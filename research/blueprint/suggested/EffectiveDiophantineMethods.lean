/-
Effective Diophantine methods: suggested statements, revision4 (#10051).
The README is the full roadmap, including every target, hypothesis, API,
regression and exact omission. This file follows WORKERS.md's 2026-10-12
shape: light definitions on existing carriers, end statements and a few
examples. There are no sorry'd data definitions or constructed carriers.

ED.0 owns scalar algebraic/valuation/precision certificates; ED.2 owns
quantitative logarithm errors. Other explicit arithmetic tables are inputs
with their exact correctness hypotheses. In particular no theorem assumes
that its output solution list is complete. Geometric Chabauty/QC carriers
and raw certificate records remain README targets, not arbitrary-type
stand-ins. All theorem bodies are planning placeholders, not proofs.
-/
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Arctan
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Data.Finset.Prod
import Mathlib.Algebra.Order.Floor.Ring
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight

noncomputable section
open scoped BigOperators
namespace TauCeti.EffectiveDiophantine

/- ED.0: existing scalar carriers and quantitative certificate milestones. -/
namespace ED0

/-- Closed rational interval containment, including singleton intervals. -/
def realIntervalContains (l u : ℚ) (x : ℝ) : Prop :=
  (l : ℝ) ≤ x ∧ x ≤ (u : ℝ)

/-- A box concerns the actual complex value, not a numerical equality test. -/
def complexBoxContains (lr ur li ui : ℚ) (z : ℂ) : Prop :=
  realIntervalContains lr ur z.re ∧ realIntervalContains li ui z.im

/-- Absolute precision; a zero centre is allowed and asserts no valuation. -/
def padicBallContains (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ)
    (x : ℚ_[p]) : Prop := ‖x - (c : ℚ_[p])‖ ≤ (p : ℝ) ^ (-N)

/-- Finite-root separation gives arbitrarily narrow boxes for a fixed root.
This is the existing polynomial carrier form of the certificate existence
milestone, not a construction of an exact-algebraic arithmetic package. -/
theorem exists_isolating_box (f : Polynomial ℚ) (hf : f ≠ 0) (z : ℂ)
    (hz : f.eval₂ (algebraMap ℚ ℂ) z = 0) (ε : ℚ) (hε : 0 < ε) :
    ∃ lr ur li ui : ℚ, lr ≤ ur ∧ li ≤ ui ∧
      ur - lr < ε ∧ ui - li < ε ∧ complexBoxContains lr ur li ui z ∧
      ∀ w : ℂ, f.eval₂ (algebraMap ℚ ℂ) w = 0 →
        complexBoxContains lr ur li ui w → w = z := by
  sorry

/-- Overlap of certified intervals does not prove equality of the values. -/
example : realIntervalContains 1 2 (Real.sqrt 2) ∧
    realIntervalContains 1 2 (Real.sqrt 3) ∧ Real.sqrt 2 ≠ Real.sqrt 3 := by
  sorry

example : complexBoxContains 0 0 1 1 Complex.I := by
  sorry

example : padicBallContains 3 0 2 (9 : ℚ_[3]) := by
  sorry

/-- Strong precision at a nonzero centre determines both norm and nonzero. -/
theorem padic_nonzero_of_error_lt {p : ℕ} [Fact p.Prime]
    (x c : ℚ_[p]) (hc : c ≠ 0) (h : ‖x - c‖ < ‖c‖) :
    x ≠ 0 ∧ ‖x‖ = ‖c‖ := by
  sorry

/-- Addition and multiplication retain the explicit absolute precision.
The stronger ramified valuation formulation is specified in the README. -/
theorem padic_ball_add {p : ℕ} [Fact p.Prime] (x y : ℚ_[p])
    (c d : ℚ) (N M : ℤ) (hx : padicBallContains p c N x)
    (hy : padicBallContains p d M y) :
    padicBallContains p (c + d) (min N M) (x + y) := by
  sorry

theorem padic_ball_mul {p : ℕ} [Fact p.Prime] (x y c d : ℚ_[p])
    (r s A B : ℝ) (hr : ‖x - c‖ ≤ r) (hs : ‖y - d‖ ≤ s)
    (hx : ‖x‖ ≤ A) (hd : ‖d‖ ≤ B) :
    ‖x * y - c * d‖ ≤ max (A * s) (B * r) := by
  sorry

/-- Inversion loses twice the valuation of the centre. -/
theorem padic_ball_inv {p : ℕ} [Fact p.Prime] (x c : ℚ_[p])
    (hc : c ≠ 0) (h : ‖x - c‖ < ‖c‖) :
    ‖x⁻¹ - c⁻¹‖ = ‖x - c‖ / ‖c‖ ^ 2 := by
  sorry

/-- Pivot division is safe only after certifying the pivot's nonvanishing.
This is the exact norm identity behind the m+s precision requirement. -/
theorem padic_quotient_error {p : ℕ} [Fact p.Prime]
    (x y c d : ℚ_[p]) (hd : d ≠ 0) (hy : ‖y - d‖ < ‖d‖)
    (hxy : ‖x‖ ≤ ‖y‖) (r : ℝ)
    (hx : ‖x - c‖ ≤ r) (he : ‖y - d‖ ≤ r) :
    ‖x / y - c / d‖ ≤ r / ‖d‖ := by
  sorry

/-- Rational centres exist at every absolute precision by density. -/
theorem exists_padic_ball {p : ℕ} [Fact p.Prime] (x : ℚ_[p]) (N : ℤ) :
    ∃ c : ℚ, padicBallContains p c N x := by
  sorry

end ED0

/- ED.1: the lattice endpoint uses actual finite-dimensional real space.
General reduction theory is owned upstream; exact raw checker structures
and LDL recursion remain mathematical targets in the reader. -/
namespace ED1

/-- The rounded small linear form must put the corresponding lattice vector
inside this explicit squared radius. A certified larger distance excludes it. -/
theorem linear_form_excluded {n : ℕ} (a : Fin n → ℝ)
    (b : Fin n → ℤ) (v : Fin n → ℤ) (C X η R : ℝ)
    (hX : 0 ≤ X) (hη : 0 ≤ η) (hC : 0 < C)
    (hb : ∀ i, |(b i : ℝ)| ≤ X)
    (hr : ∀ i, |(v i : ℝ) - C * a i| ≤ η)
    (hlarge : R < (∑ i, (b i : ℝ) * (v i : ℝ)) ^ 2)
    (hR : (C * Real.exp (-X) + (n : ℝ) * X * η) ^ 2 ≤ R) :
    Real.exp (-X) < |∑ i, (b i : ℝ) * a i| := by
  sorry

end ED1

/- ED.2: real and p-adic scalar error formulas, with explicit truncation.
No analytic-value oracle or logarithm-series foundation is introduced. -/

def realLogPartialSum (x : ℚ) (N : ℕ) : ℚ :=
  2 * ∑ k ∈ Finset.range N, ((x - 1) / (x + 1)) ^ (2 * k + 1) / (2 * k + 1)

def arctanPartialSum (t : ℚ) (N : ℕ) : ℚ :=
  ∑ k ∈ Finset.range N, (-1 : ℚ) ^ k * t ^ (2 * k + 1) / (2 * k + 1)

/-- Positive rational logarithms have a rational geometric remainder bound. -/
theorem realLogPartialSum_error (x : ℚ) (hx : 0 < x) (N : ℕ) :
    |Real.log (x : ℝ) - (realLogPartialSum x N : ℝ)| ≤
      (2 * |(x - 1) / (x + 1)| ^ (2 * N + 1) /
        ((2 * N + 1) * (1 - |(x - 1) / (x + 1)| ^ 2)) : ℚ) := by
  sorry

/-- The endpoint t=1 is included, so this also certifies π=4 arctan1. -/
theorem arctanPartialSum_error (t : ℚ) (ht : |t| ≤ 1) (N : ℕ) :
    |Real.arctan (t : ℝ) - (arctanPartialSum t N : ℝ)| ≤
      (|t| ^ (2 * N + 1) / (2 * N + 1) : ℚ) := by
  sorry

theorem exists_scalar_log_precision (x : ℚ) (hx : 0 < x)
    (ε : ℚ) (hε : 0 < ε) :
    ∃ N : ℕ, (4 * |(x - 1) / (x + 1)| ^ (2 * N + 1) /
      ((2 * N + 1) * (1 - |(x - 1) / (x + 1)| ^ 2)) : ℚ) ≤ ε := by
  sorry

example : realLogPartialSum 2 1 = 2 / 3 ∧
    (2 * (1 / 3 : ℚ) ^ 3 / (3 * (1 - (1 / 3 : ℚ) ^ 2))) = 1 / 36 := by
  sorry

example (N : ℕ) : realLogPartialSum 1 N = 0 := by
  sorry

example : arctanPartialSum 1 1 = 1 ∧ arctanPartialSum (-1) 1 = -1 := by
  sorry

/-- The already defined principal-unit logarithm is compared with this finite
sum. The full local-field/branch certificate and ramified version are in the
reader. In the pinned file only the existing Q_p carrier is used. -/
def padicLogPartialSum {p : ℕ} [Fact p.Prime] (z : ℚ_[p]) (N : ℕ) : ℚ_[p] :=
  ∑ k ∈ Finset.range N, (-1 : ℚ_[p]) ^ k * (z - 1) ^ (k + 1) / (k + 1)

/-- Norm form of ord(tail)≥ceil(d+N(d−1/(p−1))). The HasSum hypothesis
identifies the existing logarithm, not the finite-tail conclusion. -/
theorem padicLog_tail_precision {p : ℕ} [Fact p.Prime]
    (z logz : ℚ_[p]) (d : ℚ) (N : ℕ)
    (hd : 1 / ((p : ℚ) - 1) < d)
    (hz : ‖z - 1‖ ≤ (p : ℝ) ^ (-(d : ℝ)))
    (hlog : HasSum (fun k : ℕ =>
      (-1 : ℚ_[p]) ^ k * (z - 1) ^ (k + 1) / (k + 1)) logz) :
    ‖logz - padicLogPartialSum z N‖ ≤
      (p : ℝ) ^ (-(⌈d + N * (d - 1 / ((p : ℚ) - 1))⌉ : ℤ)) := by
  sorry

/-- The positive tail slope supplies every requested integer precision. -/
theorem exists_padic_log_truncation (p : ℕ) (hp : p.Prime) (d : ℚ)
    (hd : 1 / ((p : ℚ) - 1) < d) (m : ℤ) :
    ∃ N : ℕ, (m : ℚ) ≤ d + N * (d - 1 / ((p : ℚ) - 1)) := by
  sorry

example : padicLogPartialSum (4 : ℚ_[3]) 4 = (-51 / 4 : ℚ_[3]) := by
  sorry

example {p : ℕ} [Fact p.Prime] (N : ℕ) :
    padicLogPartialSum (1 : ℚ_[p]) N = 0 := by
  sorry

/- S-unit finite enumeration is an equivalence proved after the bound. The
bounded-box hypothesis is about all solutions and is supplied by DT.4 plus
ED.1/ED.2 reductions, never by a proposed answer list. -/
namespace ED2

def supportedOn (S : Finset ℕ) (n : ℕ) : Prop :=
  ∀ q : ℕ, q.Prime → q ∣ n → q ∈ S

def coprimeSUnitTriple (S : Finset ℕ) (x : ℕ × ℕ × ℕ) : Prop :=
  0 < x.1 ∧ 0 < x.2.1 ∧ x.1 ≤ x.2.1 ∧ x.1 + x.2.1 = x.2.2 ∧
    Nat.Coprime x.1 x.2.1 ∧ supportedOn S x.1 ∧
    supportedOn S x.2.1 ∧ supportedOn S x.2.2

/-- Once reduction proves B, finite exact filtering is exhaustive. -/
theorem sUnit_finite_search (S : Finset ℕ) (B : ℕ)
    (hbound : ∀ x, coprimeSUnitTriple S x → x.2.2 ≤ B) :
    {x | coprimeSUnitTriple S x} =
      {x ∈ (↑((Finset.range (B + 1)).product
        ((Finset.range (B + 1)).product (Finset.range (B + 1)))) :
        Set (ℕ × ℕ × ℕ)) |
        coprimeSUnitTriple S x} := by
  sorry

example : coprimeSUnitTriple {2, 3} (1, 2, 3) := by
  sorry

example : ¬ coprimeSUnitTriple {2, 3} (2, 2, 4) := by
  sorry

example : ¬ coprimeSUnitTriple {2, 3} (1, 4, 5) := by
  sorry

end ED2

/- ED.3: use the actual pinned Weierstrass point and canonical half-height.
The full Cremona/Silverman constant contracts, two-descent objects and basis
factories stay in the README. No field asserting the rank is constructed. -/
namespace ED3

variable (W : WeierstrassCurve.Affine ℚ) [W.IsElliptic]

/-- Certified doubling interval using explicit input height/error bounds. -/
theorem canonicalHeight_mem_doubling_interval (P : W.Point) (n : ℕ)
    (l u cminus cplus : ℚ)
    (hlog : (l : ℝ) ≤ ((2 ^ n : ℕ) • P).naiveHeight ∧
      ((2 ^ n : ℕ) • P).naiveHeight ≤ (u : ℝ))
    (hminus : -(cminus : ℝ) ≤
      ((2 ^ n : ℕ) • P).canonicalHeight - ((2 ^ n : ℕ) • P).naiveHeight / 2)
    (hplus : ((2 ^ n : ℕ) • P).canonicalHeight -
      ((2 ^ n : ℕ) • P).naiveHeight / 2 ≤ (cplus : ℝ)) :
    ((l : ℝ) / 2 - cminus) / 4 ^ n ≤ P.canonicalHeight ∧
      P.canonicalHeight ≤ ((u : ℝ) / 2 + cplus) / 4 ^ n := by
  sorry

/-- Width has the factor 1/2 from the pinned height, and 4^n from doubling. -/
example (n : ℕ) (a : ℚ) :
    ((a + 1 / 8) / 2 + 3) / (4 : ℚ) ^ n -
      (a / 2 - 2) / (4 : ℚ) ^ n = 81 / (16 * (4 : ℚ) ^ n) := by
  sorry

end ED3

/- ED.4: actual curve/differential/trace/Chabauty statements are README
contracts. Missing supplier carriers are not replaced by finite-span logic.
The imported power-series and local integration APIs are reused there.

ED.5: the core sieve theorem really is a theorem about a supplied group,
finite quotient maps and local images. Geometry supplies their commuting
reduction square; it must not assume the global answer. -/
namespace ED5

variable {G : Type*} [AddCommGroup G] {ι : Type*} [Fintype ι]
variable {A : ι → Type*} [∀ i, AddCommGroup (A i)]

/-- Empty intersection of necessary local conditions proves nonexistence. -/
theorem sieve_empty (r : ∀ i, G →+ A i) (localImage : ∀ i, Set (A i))
    (globalImage : Set G)
    (hnecessary : ∀ g ∈ globalImage, ∀ i, r i g ∈ localImage i)
    (hempty : ¬ ∃ g : G, ∀ i, r i g ∈ localImage i) : globalImage = ∅ := by
  sorry

/-- Superset local data preserve every global point. -/
theorem sieve_weaken (r : ∀ i, G →+ A i) (T U : ∀ i, Set (A i))
    (hTU : ∀ i, T i ⊆ U i) :
    {g : G | ∀ i, r i g ∈ T i} ⊆ {g : G | ∀ i, r i g ∈ U i} := by
  sorry

end ED5

/- ED.6: every concrete model/table/Hecke/point-count/L-value input is a
hypothesis in the reader's exact original-name theorem contracts. Complete
S-unit, Thue and QC answer lists must follow from bounds/exclusion, never
from an input equality asserting that same answer. The 1492-case and all
nine X_0^+(N) numerical replays remain explicit implementation obligations.
-/
end TauCeti.EffectiveDiophantine
