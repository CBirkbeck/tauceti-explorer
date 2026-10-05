import Mathlib.Dynamics.BirkhoffSum.Average
import Mathlib.Dynamics.Ergodic.Ergodic
import Mathlib.MeasureTheory.MeasurableSpace.Invariants
import Mathlib.MeasureTheory.Function.ConditionalExpectation.Basic
import Mathlib.Probability.Martingale.Convergence
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.Function.Jacobian
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.PSeries
import Mathlib.Analysis.Calculus.SmoothSeries
import Mathlib.Analysis.Calculus.FDeriv.Extend
import Mathlib.Analysis.Calculus.ContDiff.Deriv
import Mathlib.Algebra.ContinuedFractions.Computation.TerminatesIffRat
import Mathlib.Algebra.ContinuedFractions.Computation.Approximations
import Mathlib.Algebra.ContinuedFractions.ContinuantsRecurrence
import Mathlib.NumberTheory.ZetaValues
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.Topology.Instances.Matrix
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.Topology.Algebra.Group.Quotient

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every proof below is a planning placeholder; nothing is claimed implemented.

Continuation of the reviewed PM.4 packet. `Inherited` names prototype the exact imported
objects; they are not new ownership claims. Native continued fractions, conditional
expectation, filtrations, matrices and invariant sigma-algebras are reused.

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
The pinned TauCeti.Probability.Martingale.Convergence and
TauCeti.MeasureTheory.Function.ConditionalExpectation statements were read in source.
Their cached object files are unavailable in this shared build. These new signatures need
only the native Mathlib types, so they compile without rebuilding or restating those suppliers.
-/

noncomputable section
open Set Filter MeasureTheory
open scoped Topology ENNReal BigOperators
namespace TauCeti.Probability.MetricNumberTheory.PM4
attribute [local instance] Classical.propDecidable

-- Local notation for existing carriers and measures; no new generic library structures.
local notation "I" => (Icc (0 : ℝ) 1)
set_option quotPrecheck false in
local notation "D" => ({x : ℝ | 0 < x ∧ x < 1 ∧ Irrational x})
local notation "m" => (volume.restrict (Ioo (0 : ℝ) 1))

namespace Inherited
-- Imports from ProbabilisticAndMetricNumberTheory:PM.4/gauss-map, gauss-measure,
-- gauss-digit and khinchin-constant. These declarations retain the parent packet's APIs.
def gaussMap : ℝ → ℝ := sorry
def gaussMeasure : Measure ℝ := sorry
def gaussDigit : ℕ → ℝ → ℕ := sorry
def khinchinConstant : ℝ := sorry

def StrongMixing {Ω : Type*} [MeasurableSpace Ω] (T : Ω → Ω) (μ : Measure Ω) : Prop :=
  MeasurePreserving T μ μ ∧ ∀ A B : Set Ω, MeasurableSet A → MeasurableSet B →
    Tendsto (fun n : ℕ => μ.real (A ∩ (T^[n]) ⁻¹' B)) atTop
      (𝓝 (μ.real A * μ.real B))

def ExactSystem {Ω : Type*} [m0 : MeasurableSpace Ω] (T : Ω → Ω)
    (μ : Measure Ω) : Prop :=
  MeasurePreserving T μ μ ∧ ∀ A : Set Ω,
    MeasurableSet[⨅ n : ℕ, MeasurableSpace.comap (T^[n]) m0] A →
      μ A = 0 ∨ μ Aᶜ = 0
end Inherited

section Pointwise
variable {Ω : Type*} [MeasurableSpace Ω]

-- /upper-orbit-truncation: extended limsup, truncated before real conversion.
def upperOrbitTruncation (T : Ω → Ω) (f : Ω → ℝ) (L : ℝ) : Ω → ℝ := sorry
lemma upperOrbitTruncation_bounds (T : Ω → Ω) (f : Ω → ℝ) {L : ℝ}
    (hL : 0 ≤ L) (x : Ω) :
    0 ≤ upperOrbitTruncation T f L x ∧ upperOrbitTruncation T f L x ≤ L := sorry
lemma upperOrbitTruncation_measurable {T : Ω → Ω} {f : Ω → ℝ}
    (hT : Measurable T) (hf : Measurable f) {L : ℝ} (hL : 0 ≤ L) :
    Measurable (upperOrbitTruncation T f L) := sorry
lemma upperOrbitTruncation_comp (T : Ω → Ω) (f : Ω → ℝ)
    (hf : ∀ x, 0 ≤ f x) {L : ℝ} (hL : 0 ≤ L) (x : Ω) :
    upperOrbitTruncation T f L (T x) = upperOrbitTruncation T f L x := sorry
-- upper_truncation_zero
example (T : Ω → Ω) {L : ℝ} (hL : 0 ≤ L) (x : Ω) :
    upperOrbitTruncation T (fun _ => 0) L x = 0 := sorry
-- upper_truncation_constant
example (T : Ω → Ω) (x : Ω) : upperOrbitTruncation T (fun _ => 3) 2 x = 2 := sorry
-- upper_truncation_infinite: the untruncated limsup here is infinity.
example {L : ℝ} (hL : 0 ≤ L) :
    upperOrbitTruncation Nat.succ (fun k : ℕ => (k : ℝ)) L 0 = L := sorry

-- /first-orbit-hit: zero is the no-crossing sentinel, never an averaging length.
def firstOrbitHit (T : Ω → Ω) (f c : Ω → ℝ) : Ω → ℕ := sorry
lemma firstOrbitHit_pos_iff (T : Ω → Ω) (f c : Ω → ℝ) (x : Ω) :
    0 < firstOrbitHit T f c x ↔ ∃ n : ℕ, 1 ≤ n ∧ c x < birkhoffAverage ℝ T f n x := sorry
lemma firstOrbitHit_average (T : Ω → Ω) (f c : Ω → ℝ) {x : Ω}
    (hx : 0 < firstOrbitHit T f c x) :
    c x < birkhoffAverage ℝ T f (firstOrbitHit T f c x) x := sorry
lemma firstOrbitHit_measurable {T : Ω → Ω} {f c : Ω → ℝ}
    (hT : Measurable T) (hf : Measurable f) (hc : Measurable c) :
    Measurable (firstOrbitHit T f c) := sorry
-- first_hit_constant
example (T : Ω → Ω) (x : Ω) : firstOrbitHit T (fun _ => 2) (fun _ => 1) x = 1 := sorry
-- first_hit_no_crossing
example (T : Ω → Ω) (x : Ω) : firstOrbitHit T (fun _ => 2) (fun _ => 2) x = 0 := sorry
-- first_hit_two_cycle
example : firstOrbitHit Bool.not (fun b => if b then 4 else 0) (fun _ => 1) false = 2 ∧
    firstOrbitHit Bool.not (fun b => if b then 4 else 0) (fun _ => 1) true = 1 := sorry

-- /greedy-orbit-blocks: (start, length, isBlue), with an implicit uncovered tail.
def greedyOrbitBlocks (σ : ℕ → ℕ) (M N : ℕ) : List (ℕ × ℕ × Bool) := sorry
lemma greedyOrbitBlocks_partition (σ : ℕ → ℕ) {M : ℕ} (hM : 1 ≤ M) (N : ℕ) :
    let bs := greedyOrbitBlocks σ M N
    (bs.map (fun b => b.2.1)).sum ≤ N ∧
    (∀ i (hi : i < bs.length), (bs[i]'hi).1 =
      ((bs.take i).map (fun b => b.2.1)).sum) ∧
    (∀ b ∈ bs, 0 < b.2.1) := sorry
lemma greedyOrbitBlocks_blue (σ : ℕ → ℕ) {M : ℕ} (hM : 1 ≤ M) (N : ℕ)
    {b : ℕ × ℕ × Bool} (hb : b ∈ greedyOrbitBlocks σ M N) (hblue : b.2.2 = true) :
    b.2.1 = σ b.1 ∧ 1 ≤ b.2.1 ∧ b.2.1 ≤ M ∧ b.1 + b.2.1 ≤ N := sorry
lemma greedyOrbitBlocks_red (σ : ℕ → ℕ) {M : ℕ} (hM : 1 ≤ M) (N : ℕ)
    {b : ℕ × ℕ × Bool} (hb : b ∈ greedyOrbitBlocks σ M N) (hred : b.2.2 = false) :
    b.2.1 = 1 ∧ (σ b.1 = 0 ∨ M < σ b.1) := sorry
lemma greedyOrbitBlocks_tail (σ : ℕ → ℕ) {M : ℕ} (hM : 1 ≤ M) (N : ℕ) :
    N - ((greedyOrbitBlocks σ M N).map (fun b => b.2.1)).sum < M := sorry
-- blocks_empty
example (σ : ℕ → ℕ) {M : ℕ} (hM : 1 ≤ M) : greedyOrbitBlocks σ M 0 = [] := sorry
-- blocks_unit
example : greedyOrbitBlocks (fun _ => 1) 1 3 =
    [(0,1,true),(1,1,true),(2,1,true)] := sorry
-- blocks_boundary
example : greedyOrbitBlocks (fun _ => 2) 2 5 = [(0,2,true),(2,2,true)] := sorry
-- blocks_bad
example : greedyOrbitBlocks (fun _ => 0) 2 3 =
    [(0,1,false),(1,1,false),(2,1,false)] := sorry

-- /orbit-limit: finite real limit if convergent, zero otherwise.
def orbitLimit (T : Ω → Ω) (f : Ω → ℝ) : Ω → ℝ := sorry
lemma orbitLimit_of_tendsto (T : Ω → Ω) (f : Ω → ℝ) {x : Ω} {c : ℝ}
    (h : Tendsto (fun n => birkhoffAverage ℝ T f n x) atTop (𝓝 c)) :
    orbitLimit T f x = c := sorry
lemma orbitLimit_measurable {T : Ω → Ω} {f : Ω → ℝ}
    (hT : Measurable T) (hf : Measurable f) : Measurable (orbitLimit T f) := sorry
lemma orbitLimit_comp (T : Ω → Ω) (f : Ω → ℝ) (x : Ω) :
    orbitLimit T f (T x) = orbitLimit T f x := sorry
-- orbit_limit_constant
example (T : Ω → Ω) (c : ℝ) (x : Ω) : orbitLimit T (fun _ => c) x = c := sorry
-- orbit_limit_cycle
example (b : Bool) : orbitLimit Bool.not (fun b => if b then 4 else 0) b = 2 := sorry
-- orbit_limit_diverges
example : orbitLimit Nat.succ (fun k : ℕ => (k : ℝ)) 0 = 0 := sorry

lemma finite_upper_coloring (T : Ω → Ω) (f g : Ω → ℝ) (hf : ∀ x, 0 ≤ f x)
    (hg : ∀ x, 0 ≤ g x) (hgi : ∀ x, g (T x) = g x) {ε : ℝ} (hε : 0 < ε)
    {M N : ℕ} (hM : 1 ≤ M) (hMN : M ≤ N) (x : Ω)
    (hτ : ∀ k : ℕ, 0 < firstOrbitHit T f (fun y => g y - ε) ((T^[k]) x)) :
    ∑ k ∈ Finset.range N, (f ((T^[k]) x) + g x *
      (if M < firstOrbitHit T f (fun y => g y - ε) ((T^[k]) x) then 1 else 0)) ≥
      ((N - M : ℕ) : ℝ) * (g x - ε) := sorry

lemma finite_lower_coloring (T : Ω → Ω) (f ℓ : Ω → ℝ) (θ : Ω → ℕ)
    (hf : ∀ x, 0 ≤ f x) (hℓ : ∀ x, 0 ≤ ℓ x) (hi : ∀ x, ℓ (T x) = ℓ x)
    {ε : ℝ} (hε : 0 < ε) (hθ : ∀ x, 0 < θ x ∧
      birkhoffAverage ℝ T f (θ x) x < ℓ x + ε) {M : ℕ} (hM : 1 ≤ M)
    (N : ℕ) (x : Ω) :
    ∑ k ∈ Finset.range N, (min (f ((T^[k]) x)) (M : ℝ) *
      (if θ ((T^[k]) x) ≤ M then 1 else 0)) ≤
      (N : ℝ) * (ℓ x + ε) + (M : ℝ)^2 := sorry

variable {μ : Measure Ω} [IsProbabilityMeasure μ]
lemma upper_coloring_integrated {T : Ω → Ω} (hT : MeasurePreserving T μ μ)
    {f : Ω → ℝ} (hf : Measurable f) (hfi : Integrable f μ) (hpos : ∀ x, 0 ≤ f x)
    {L ε : ℝ} (hL : 0 ≤ L) (hε : 0 < ε) {M N : ℕ} (hM : 1 ≤ M) (hMN : M ≤ N) :
    (∫ x, f x ∂μ) ≥ (∫ x in {x | firstOrbitHit T f
      (fun y => upperOrbitTruncation T f L y - ε) x ≤ M},
      upperOrbitTruncation T f L x ∂μ) - ε - (M : ℝ) * L / N := sorry
lemma upper_truncation_bound {T : Ω → Ω} (hT : MeasurePreserving T μ μ)
    {f : Ω → ℝ} (hf : Measurable f) (hfi : Integrable f μ) (hpos : ∀ x, 0 ≤ f x)
    {L : ℝ} (hL : 0 ≤ L) :
    (∫ x, upperOrbitTruncation T f L x ∂μ) ≤ ∫ x, f x ∂μ := sorry
lemma signed_limit {T : Ω → Ω} (hT : MeasurePreserving T μ μ)
    {f : Ω → ℝ} (hf : Integrable f μ) :
    Integrable (orbitLimit T f) μ ∧ ∀ᵐ x ∂μ,
      Tendsto (fun n => birkhoffAverage ℝ T f n x) atTop (𝓝 (orbitLimit T f x)) := sorry
lemma integrable_observable_l1_limit {T : Ω → Ω} (hT : MeasurePreserving T μ μ)
    {f : Ω → ℝ} (hf : Integrable f μ) :
    Tendsto (fun n => ∫ x, |birkhoffAverage ℝ T f n x - orbitLimit T f x| ∂μ)
      atTop (𝓝 0) := sorry
lemma invariant_set_integrals {T : Ω → Ω} (hT : MeasurePreserving T μ μ)
    {f : Ω → ℝ} (hf : Integrable f μ) {s : Set Ω}
    (hs : MeasurableSet[MeasurableSpace.invariants T] s) :
    (∫ x in s, orbitLimit T f x ∂μ) = ∫ x in s, f x ∂μ := sorry
lemma native_condexp_identification {T : Ω → Ω} (hT : MeasurePreserving T μ μ)
    {f : Ω → ℝ} (hf : Integrable f μ) :
    orbitLimit T f =ᵐ[μ] μ[f | MeasurableSpace.invariants T] := sorry
-- Imported named target /birkhoff-pointwise, with this packet's proof inputs.
theorem birkhoff_pointwise {T : Ω → Ω} (hT : MeasurePreserving T μ μ)
    {f : Ω → ℝ} (hf : Integrable f μ) : ∀ᵐ x ∂μ,
    Tendsto (fun n => birkhoffAverage ℝ T f n x) atTop
      (𝓝 (μ[f | MeasurableSpace.invariants T] x)) := sorry
-- Imported named target /birkhoff-pointwise-ergodic.
theorem birkhoff_pointwise_ergodic {T : Ω → Ω} (hT : Ergodic T μ)
    {f : Ω → ℝ} (hf : Integrable f μ) : ∀ᵐ x ∂μ,
    Tendsto (fun n => birkhoffAverage ℝ T f n x) atTop (𝓝 (∫ y, f y ∂μ)) := sorry
end Pointwise
section Cylinders
-- /gauss-cylinder
-- D excludes rational endpoints. The word [1,2] has interval (2/3,3/4).
def gaussCylinder (w : List ℕ) : Set ℝ := sorry
lemma gaussCylinder_nil : gaussCylinder [] = D := sorry
lemma gaussCylinder_cons {a : ℕ} (ha : 1 ≤ a) (w : List ℕ) :
    gaussCylinder (a::w) = D ∩ {x | Inherited.gaussDigit 0 x = a} ∩
      Inherited.gaussMap ⁻¹' gaussCylinder w := sorry
lemma gaussCylinder_measurable (w : List ℕ) : MeasurableSet (gaussCylinder w) := sorry
lemma gaussCylinder_zero {w : List ℕ} (h : 0 ∈ w) : gaussCylinder w = ∅ := sorry
-- cylinder_nil
example : gaussCylinder [] = D := sorry
-- cylinder_zero
example : gaussCylinder [0] = ∅ := sorry
-- cylinder_one
example : gaussCylinder [1] = D ∩ Ioo (1/2 : ℝ) 1 := sorry
-- cylinder_twelve
example : gaussCylinder [1,2] = D ∩ Ioo (2/3 : ℝ) (3/4) ∧
    gaussCylinder [2,1] = D ∩ Ioo (1/3 : ℝ) (2/5) := sorry

-- /inverse-word
def inverseWord (w : List ℕ) : ℝ → ℝ := sorry
lemma inverseWord_nil (y : ℝ) : inverseWord [] y = y := sorry
lemma inverseWord_cons (a : ℕ) (w : List ℕ) (y : ℝ) :
    inverseWord (a::w) y = 1 / ((a : ℝ) + inverseWord w y) := sorry
lemma inverseWord_append (u w : List ℕ) :
    inverseWord (u ++ w) = inverseWord u ∘ inverseWord w := sorry
-- inverse_word_empty
example : inverseWord [] 2 = 2 := sorry
-- inverse_word_twelve
example : inverseWord [1,2] 0 = 2/3 ∧ inverseWord [1,2] 1 = 3/4 := sorry
-- inverse_word_twentyone
example : inverseWord [2,1] 0 = 1/3 ∧ inverseWord [2,1] 0 ≠ 2/3 := sorry

-- /word-matrix: a native matrix product, never another continued-fraction carrier.
def wordMatrix (w : List ℕ) : Matrix (Fin 2) (Fin 2) ℝ := sorry
lemma wordMatrix_nil : wordMatrix [] = 1 := sorry
lemma wordMatrix_cons (a : ℕ) (w : List ℕ) :
    wordMatrix (a::w) = !![0,1;1,(a : ℝ)] * wordMatrix w := sorry
lemma wordMatrix_det (w : List ℕ) : (wordMatrix w).det = (-1 : ℝ)^w.length := sorry
lemma wordMatrix_native {w : List ℕ} {x : ℝ} (hx : x ∈ gaussCylinder w)
    (hn : 1 ≤ w.length) :
    wordMatrix w = !![(GenContFract.of x).nums (w.length-1), (GenContFract.of x).nums w.length;
      (GenContFract.of x).dens (w.length-1), (GenContFract.of x).dens w.length] := sorry
-- word_matrix_empty
example : wordMatrix [] = (1 : Matrix (Fin 2) (Fin 2) ℝ) := sorry
-- word_matrix_one
example : wordMatrix [3] = !![(0 : ℝ),1;1,3] := sorry
-- word_matrix_twelve
example : wordMatrix [1,2] = !![(1 : ℝ),2;1,3] ∧
    wordMatrix [2,1] = !![(1 : ℝ),1;2,3] := sorry

lemma irrational_conull : MeasurableSet D ∧ m D = 1 ∧ Inherited.gaussMeasure D = 1 ∧
    MapsTo Inherited.gaussMap D D := sorry
lemma word_matrix_positive {w : List ℕ} (hw : ∀ a ∈ w, 1 ≤ a) (hn : 1 ≤ w.length) :
    1 ≤ wordMatrix w 1 1 ∧ 0 < wordMatrix w 1 0 ∧
      wordMatrix w 1 0 ≤ wordMatrix w 1 1 := sorry
lemma native_stream_gauss {x : ℝ} (hx : x ∈ D) (n : ℕ) :
    (GenContFract.of x).partDens.get? n = some (Inherited.gaussDigit n x : ℝ) := sorry
lemma native_nontermination {x : ℝ} (hx : x ∈ D) (n : ℕ) :
    ¬ (GenContFract.of x).TerminatedAt n ∧
    0 < (GenContFract.of x).dens n ∧
    (Nat.fib (n+1) : ℝ) ≤ (GenContFract.of x).dens n := sorry
lemma word_mobius {w : List ℕ} (hw : ∀ a ∈ w, 1 ≤ a) {y : ℝ} (hy : y ∈ I) :
    inverseWord w y = (wordMatrix w 0 0 * y + wordMatrix w 0 1) /
      (wordMatrix w 1 0 * y + wordMatrix w 1 1) := sorry
lemma word_derivative {w : List ℕ} (hw : ∀ a ∈ w, 1 ≤ a) {y : ℝ} (hy : y ∈ I) :
    HasDerivWithinAt (inverseWord w)
      ((-1 : ℝ)^w.length / (wordMatrix w 1 1 + wordMatrix w 1 0 * y)^2) I y := sorry
lemma word_denominator_fibonacci {w : List ℕ} (hw : ∀ a ∈ w, 1 ≤ a) :
    (Nat.fib (w.length+1) : ℝ) ≤ wordMatrix w 1 1 ∧
      Metric.diam (inverseWord w '' I) ≤ 1 / (Nat.fib (w.length+1) : ℝ)^2 := sorry
lemma cylinder_image {w : List ℕ} (hw : ∀ a ∈ w, 1 ≤ a) :
    inverseWord w '' D = gaussCylinder w ∧
    Set.BijOn (inverseWord w) D (gaussCylinder w) ∧
    0 < m (gaussCylinder w) ∧ 0 < Inherited.gaussMeasure (gaussCylinder w) := sorry
lemma orbit_product_identity {x : ℝ} (hx : x ∈ D) (N : ℕ) :
    (∏ j ∈ Finset.range N, (Inherited.gaussMap^[j]) x)⁻¹ =
      (GenContFract.of x).dens N +
        (if N = 0 then 0 else (GenContFract.of x).dens (N-1)) *
          (Inherited.gaussMap^[N]) x := sorry

-- /gauss-cylinder-filtration: a native Filtration, with D as its only nonnull depth-zero atom.
def gaussCylinderFiltration : Filtration ℕ (borel ℝ) := sorry
lemma gaussCylinderFiltration_cylinder {w : List ℕ} {n : ℕ} (h : w.length ≤ n) :
    MeasurableSet[gaussCylinderFiltration n] (gaussCylinder w) := sorry
lemma gaussCylinderFiltration_atoms (n : ℕ) :
    (∀ x ∈ D, ∃! w : List ℕ, w.length = n ∧ (∀ a ∈ w, 1 ≤ a) ∧ x ∈ gaussCylinder w) ∧
    (∀ w : List ℕ, w.length = n → (∀ a ∈ w, 1 ≤ a) →
      ∀ A : Set ℝ, MeasurableSet[gaussCylinderFiltration n] A →
        gaussCylinder w ⊆ A ∨ Disjoint (gaussCylinder w) A) := sorry
lemma gaussCylinderFiltration_generates {B : Set ℝ} (hB : MeasurableSet B) :
    MeasurableSet[⨆ n : ℕ, gaussCylinderFiltration n] (B ∩ D) := sorry
-- filtration_zero_domain: exact sigma-algebra, not merely D measurability.
example : gaussCylinderFiltration 0 = MeasurableSpace.generateFrom {D} := sorry
-- filtration_first_digit
example : MeasurableSet[gaussCylinderFiltration 1] (gaussCylinder [1]) := sorry
-- filtration_not_top
example : ¬ MeasurableSet[gaussCylinderFiltration 0] (gaussCylinder [1]) := sorry

lemma cylinder_ce_formula {B : Set ℝ} (hB : MeasurableSet B) {w : List ℕ}
    (hw : ∀ a ∈ w, 1 ≤ a) : ∀ᵐ x ∂m, x ∈ gaussCylinder w →
    m[B.indicator (fun _ => (1 : ℝ)) | gaussCylinderFiltration w.length] x =
      (m).real (B ∩ gaussCylinder w) / (m).real (gaussCylinder w) := sorry
lemma cylinder_ce_converges {B : Set ℝ} (hB : MeasurableSet B) : ∀ᵐ x ∂m,
    Tendsto (fun n => m[B.indicator (fun _ => (1 : ℝ)) | gaussCylinderFiltration n] x)
      atTop (𝓝 (B.indicator (fun _ => (1 : ℝ)) x)) := sorry
lemma cylinder_ce_lower_bound {B : Set ℝ}
    (hB : MeasurableSet[⨅ n : ℕ,
      MeasurableSpace.comap (Inherited.gaussMap^[n]) (borel ℝ)] B) (n : ℕ) :
    ∀ᵐ x ∂m, x ∈ D → (m).real B / 8 ≤
      m[B.indicator (fun _ => (1 : ℝ)) | gaussCylinderFiltration n] x := sorry
lemma tail_zero_one {B : Set ℝ}
    (hB : MeasurableSet[⨅ n : ℕ,
      MeasurableSpace.comap (Inherited.gaussMap^[n]) (borel ℝ)] B) :
    Inherited.gaussMeasure B = 0 ∨ Inherited.gaussMeasure B = 1 := sorry
end Cylinders

section Exactness
variable {Ω : Type*} [m0 : MeasurableSpace Ω] {μ : Measure Ω}
lemma tail_sigma_antitone {T : Ω → Ω} (hT : Measurable T) :
    Antitone (fun n : ℕ => MeasurableSpace.comap (T^[n]) m0) ∧
      MeasurableSpace.comap (T^[0]) m0 = m0 := sorry
lemma tail_event_preimage {T : Ω → Ω} (hT : Measurable T) {B : Set Ω}
    (hB : MeasurableSet[⨅ n : ℕ, MeasurableSpace.comap (T^[n]) m0] B) (n : ℕ) :
    ∃ Bn : Set Ω, MeasurableSet Bn ∧ B = (T^[n]) ⁻¹' Bn := sorry
variable [IsProbabilityMeasure μ]
lemma tail_ce_constant {T : Ω → Ω} (hT : Inherited.ExactSystem T μ)
    {f : Ω → ℝ} (hf : Integrable f μ) :
    μ[f | ⨅ n : ℕ, MeasurableSpace.comap (T^[n]) m0] =ᵐ[μ]
      (fun _ => ∫ x, f x ∂μ) := sorry
lemma tail_ce_l1_limit {T : Ω → Ω} (hT : Inherited.ExactSystem T μ)
    {A : Set Ω} (hA : MeasurableSet A) :
    Tendsto (fun n => ∫ x,
      |μ[A.indicator (fun _ => (1 : ℝ)) | MeasurableSpace.comap (T^[n]) m0] x - μ.real A| ∂μ)
      atTop (𝓝 0) := sorry
lemma tail_correlation_bound {T : Ω → Ω} (hT : Inherited.ExactSystem T μ)
    {A B : Set Ω} (hA : MeasurableSet A) (hB : MeasurableSet B) (n : ℕ) :
    |μ.real (A ∩ (T^[n]) ⁻¹' B) - μ.real A * μ.real B| ≤
      ∫ x, |μ[A.indicator (fun _ => (1 : ℝ)) | MeasurableSpace.comap (T^[n]) m0] x - μ.real A| ∂μ := sorry
end Exactness

section Transfer
-- Native real functions and sums; convergence hypotheses belong to the API.
def gaussDensityTransfer (f : ℝ → ℝ) : ℝ → ℝ := sorry
lemma gaussDensityTransfer_zero : gaussDensityTransfer (fun _ => 0) = (fun _ => 0) := sorry
lemma gaussDensityTransfer_add {f g : ℝ → ℝ}
    (hf : ContinuousOn f I) (hg : ContinuousOn g I) {x : ℝ} (hx : x ∈ I) :
    gaussDensityTransfer (fun y => f y + g y) x =
      gaussDensityTransfer f x + gaussDensityTransfer g x := sorry
lemma gaussDensityTransfer_smul (c : ℝ) {f : ℝ → ℝ}
    (hf : ContinuousOn f I) {x : ℝ} (hx : x ∈ I) :
    gaussDensityTransfer (fun y => c * f y) x = c * gaussDensityTransfer f x := sorry
lemma gaussDensityTransfer_nonnegative {f : ℝ → ℝ} (hf : ContinuousOn f I)
    (hpos : ∀ x ∈ I, 0 ≤ f x) {x : ℝ} (hx : x ∈ I) : 0 ≤ gaussDensityTransfer f x := sorry
lemma gaussDensityTransfer_duality {f ψ : ℝ → ℝ}
    (hf : ContinuousOn f I) (hψ : Measurable ψ)
    (hb : ∃ C : ℝ, ∀ x ∈ I, |ψ x| ≤ C) :
    (∫ x, ψ x * gaussDensityTransfer f x ∂m) =
      ∫ x, ψ (Inherited.gaussMap x) * f x ∂m := sorry
-- density_transfer_zero
example : gaussDensityTransfer (fun _ => 0) 0 = 0 := sorry
-- density_transfer_one_at_zero
example : gaussDensityTransfer (fun _ => 1) 0 = Real.pi ^ 2 / 6 := sorry
-- density_transfer_gauss_fixed
example {x : ℝ} (hx : x ∈ I) :
    gaussDensityTransfer (fun y => 1 / ((1 + y) * Real.log 2)) x =
      1 / ((1 + x) * Real.log 2) := sorry

def normalizedGaussTransfer (g : ℝ → ℝ) : ℝ → ℝ := sorry
lemma normalizedGaussTransfer_const (c : ℝ) {x : ℝ} (hx : x ∈ I) :
    normalizedGaussTransfer (fun _ => c) x = c := sorry
lemma normalizedGaussTransfer_conjugate {f : ℝ → ℝ}
    (hf : ContinuousOn f I) {x : ℝ} (hx : x ∈ I) :
    normalizedGaussTransfer (fun y => (1 + y) * f y) x =
      (1 + x) * gaussDensityTransfer f x := sorry
lemma normalizedGaussTransfer_integral {g : ℝ → ℝ} (hg : ContinuousOn g I) :
    (∫ x, normalizedGaussTransfer g x / (1 + x) ∂m) =
      ∫ x, g x / (1 + x) ∂m := sorry
lemma normalizedGaussTransfer_add {g h : ℝ → ℝ}
    (hg : ContinuousOn g I) (hh : ContinuousOn h I) {x : ℝ} (hx : x ∈ I) :
    normalizedGaussTransfer (fun y => g y + h y) x =
      normalizedGaussTransfer g x + normalizedGaussTransfer h x := sorry
lemma normalizedGaussTransfer_smul (c : ℝ) {g : ℝ → ℝ}
    (hg : ContinuousOn g I) {x : ℝ} (hx : x ∈ I) :
    normalizedGaussTransfer (fun y => c * g y) x = c * normalizedGaussTransfer g x := sorry
lemma normalizedGaussTransfer_bounds {g : ℝ → ℝ} (hg : ContinuousOn g I)
    {c C : ℝ} (hb : ∀ x ∈ I, c ≤ g x ∧ g x ≤ C) {x : ℝ} (hx : x ∈ I) :
    c ≤ normalizedGaussTransfer g x ∧ normalizedGaussTransfer g x ≤ C := sorry
-- normalized_transfer_zero
example {x : ℝ} (hx : x ∈ I) : normalizedGaussTransfer (fun _ => 0) x = 0 := sorry
-- normalized_transfer_one
example {x : ℝ} (hx : x ∈ I) : normalizedGaussTransfer (fun _ => 1) x = 1 := sorry
-- normalized_transfer_coordinate
example : normalizedGaussTransfer (fun x => x) 0 = Real.pi ^ 2 / 6 - 1 := sorry

lemma density_transfer_summable {f : ℝ → ℝ} (hf : ContinuousOn f I)
    {x : ℝ} (hx : x ∈ I) :
    Summable (fun k : ℕ => f (1 / ((k + 1 : ℕ) + x)) / ((k + 1 : ℕ) + x) ^ 2) := sorry
lemma gaussDensityTransfer_continuous {f : ℝ → ℝ} (hf : ContinuousOn f I) :
    ContinuousOn (gaussDensityTransfer f) I := sorry
lemma density_pushforward (n : ℕ) :
    (m).map (Inherited.gaussMap^[n]) = (m).withDensity
      (fun x => ENNReal.ofReal ((gaussDensityTransfer^[n]) (fun _ => 1) x)) := sorry

-- C1 on the closed interval is expressed by native within derivatives.
lemma transfer_branch_c1 {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I)
    {a : ℕ} (ha : 1 ≤ a) :
    ContDiffOn ℝ 1 (fun x =>
      (1 + x) / (((a : ℝ) + x) * ((a : ℝ) + 1 + x)) * g (1 / ((a : ℝ) + x))) I := sorry
lemma transfer_endpoint_derivative {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I) :
    ContDiffOn ℝ 1 (normalizedGaussTransfer g) I := sorry
lemma transfer_weight_derivative (a : ℕ) (ha : 1 ≤ a) {x : ℝ} (hx : x ∈ I) :
    derivWithin (fun y : ℝ =>
      (1 + y) / (((a : ℝ) + y) * ((a : ℝ) + 1 + y))) I x =
      ((a : ℝ) ^ 2 - a - 1 - 2 * x - x ^ 2) /
        (((a : ℝ) + x) ^ 2 * ((a : ℝ) + 1 + x) ^ 2) := sorry
lemma transfer_derivative_contraction {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I)
    {M : ℝ} (hM : 0 ≤ M) (hb : ∀ x ∈ I, |derivWithin g I x| ≤ M) :
    ∀ x ∈ I, |derivWithin (normalizedGaussTransfer g) I x| ≤ (9 / 10 : ℝ) * M := sorry
lemma transfer_iterate_c1_bound {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I)
    {M : ℝ} (hM : 0 ≤ M) (hb : ∀ x ∈ I, |derivWithin g I x| ≤ M) (n : ℕ) :
    ContDiffOn ℝ 1 ((normalizedGaussTransfer^[n]) g) I ∧
      ∀ x ∈ I, |derivWithin ((normalizedGaussTransfer^[n]) g) I x| ≤
        (9 / 10 : ℝ) ^ n * M := sorry
lemma weighted_mean_pins_limit {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I)
    {M : ℝ} (hM : 0 ≤ M) (hb : ∀ x ∈ I, |derivWithin g I x| ≤ M)
    (n : ℕ) {x : ℝ} (hx : x ∈ I) :
    |(normalizedGaussTransfer^[n]) g x - (∫ y, g y / (1 + y) ∂m) / Real.log 2| ≤
      (9 / 10 : ℝ) ^ n * M := sorry
theorem density_uniform_error (n : ℕ) {x : ℝ} (hx : x ∈ I) :
    |(gaussDensityTransfer^[n]) (fun _ => 1) x - 1 / ((1 + x) * Real.log 2)| ≤
      (9 / 10 : ℝ) ^ n := sorry
lemma digit_marginal_error {a : ℕ} (ha : 1 ≤ a) (n : ℕ) :
    |(m).real {x | Inherited.gaussDigit n x = a} -
      Real.log (((a : ℝ) + 1) ^ 2 / ((a : ℝ) * ((a : ℝ) + 2))) / Real.log 2| ≤
      (9 / 10 : ℝ) ^ n := sorry
end Transfer

section Logarithms
lemma digit_probability_log_summable :
    Summable (fun k : ℕ => Real.log (k + 1 : ℕ) *
      Real.log (1 + 1 / (((k + 1 : ℕ) : ℝ) * ((k + 1 : ℕ) + 2))) / Real.log 2) := sorry
lemma digit_log_integrable :
    Integrable (fun x => Real.log (Inherited.gaussDigit 0 x : ℝ)) Inherited.gaussMeasure := sorry
lemma negative_log_integrable : Integrable (fun x : ℝ => -Real.log x) Inherited.gaussMeasure := sorry
lemma log_power_moment (n : ℕ) :
    (∫ x : ℝ, (-Real.log x) * x ^ n ∂m) = 1 / (n + 1 : ℝ) ^ 2 := sorry
lemma alternating_zeta_two :
    Summable (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1 : ℝ) ^ 2) ∧
      (∑' n : ℕ, (-1 : ℝ) ^ n / (n + 1 : ℝ) ^ 2) = Real.pi ^ 2 / 12 := sorry
lemma negative_log_integral :
    (∫ x : ℝ, -Real.log x ∂Inherited.gaussMeasure) = Real.pi ^ 2 / (12 * Real.log 2) := sorry

-- Named parent targets, refined through the new helper graph rather than re-owned.
theorem gauss_invariant : MeasurePreserving Inherited.gaussMap
    Inherited.gaussMeasure Inherited.gaussMeasure := sorry
theorem gauss_exact : Inherited.ExactSystem Inherited.gaussMap Inherited.gaussMeasure := sorry
theorem gauss_mixing : Inherited.StrongMixing Inherited.gaussMap Inherited.gaussMeasure := sorry
theorem gauss_ergodic : Ergodic Inherited.gaussMap Inherited.gaussMeasure := sorry
theorem gauss_digit_frequency : ∀ᵐ x ∂Inherited.gaussMeasure, ∀ a : ℕ, 1 ≤ a →
    Tendsto (fun N : ℕ => ((Finset.range N).filter
      (fun n => Inherited.gaussDigit n x = a)).card / (N : ℝ)) atTop
      (𝓝 (Real.log (((a : ℝ) + 1) ^ 2 / ((a : ℝ) * ((a : ℝ) + 2))) / Real.log 2)) := sorry
theorem gauss_word_frequency : ∀ᵐ x ∂Inherited.gaussMeasure,
    ∀ w : List ℕ, (∀ a ∈ w, 1 ≤ a) →
    Tendsto (fun N : ℕ => ((Finset.range N).filter
      (fun n => (Inherited.gaussMap^[n]) x ∈ gaussCylinder w)).card / (N : ℝ))
      atTop (𝓝 (Inherited.gaussMeasure.real (gaussCylinder w))) := sorry
theorem khinchin_geometric_mean : ∀ᵐ x ∂Inherited.gaussMeasure,
    Tendsto (fun N : ℕ => Real.exp
      ((∑ n ∈ Finset.range N, Real.log (Inherited.gaussDigit n x : ℝ)) / (N : ℝ)))
      atTop (𝓝 Inherited.khinchinConstant) := sorry
theorem levy_denominator : ∀ᵐ x ∂Inherited.gaussMeasure,
    Tendsto (fun N : ℕ => Real.log ((GenContFract.of x).dens N) / (N : ℝ))
      atTop (𝓝 (Real.pi ^ 2 / (12 * Real.log 2))) := sorry
theorem gauss_kuzmin : ∃ C ρ : ℝ, 0 < C ∧ 0 < ρ ∧ ρ < 1 ∧
    ∀ a : ℕ, 1 ≤ a → ∀ n : ℕ,
    |(m).real {x | Inherited.gaussDigit n x = a} -
      Real.log (((a : ℝ) + 1) ^ 2 / ((a : ℝ) * ((a : ℝ) + 2))) / Real.log 2| ≤ C * ρ ^ n := sorry
end Logarithms

section HomogeneousConsumers
-- These local aliases are the existing native matrix-group and quotient carriers.
-- The requested GN.4 contracts supply the lattice, normalized Haar measure, Mahler
-- theorem and time-one mixing; PM.4 does not introduce a homogeneous-space structure.
local notation "G" => Matrix.SpecialLinearGroup (Fin 2) ℝ
local notation "Γ" => MonoidHom.range (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) :
  Matrix.SpecialLinearGroup (Fin 2) ℤ →* G)
local instance : TopologicalSpace G :=
  inferInstanceAs (TopologicalSpace {A : Matrix (Fin 2) (Fin 2) ℝ // A.det = 1})
local notation "X" => G ⧸ Γ
local instance : MeasurableSpace X := borel X

variable (a u : ℝ → G)
variable (ha : ∀ t : ℝ, (a t : Matrix (Fin 2) (Fin 2) ℝ) =
  !![Real.exp t, 0; 0, Real.exp (-t)])
variable (hu : ∀ x : ℝ, (u x : Matrix (Fin 2) (Fin 2) ℝ) = !![1, x; 0, 1])

theorem homogeneous_birkhoff (μ : Measure X) [IsProbabilityMeasure μ]
    (hHaar : ∀ g : G, MeasurePreserving (fun z : X => g • z) μ μ)
    (hGN4 : Inherited.StrongMixing (fun z : X => a 1 • z) μ)
    {f : X → ℝ} (hf : Integrable f μ) :
    ∀ᵐ z ∂μ, Tendsto (fun N : ℕ => birkhoffAverage ℝ (fun w : X => a 1 • w) f N z)
      atTop (𝓝 (∫ w, f w ∂μ)) := sorry

-- One-sided orbit and compact closure, with all matrix conventions visible.
include ha hu
theorem bounded_digits_compact_orbit {x : ℝ} (hx : x ∈ D) :
    (∃ B : ℕ, ∀ n : ℕ, Inherited.gaussDigit n x ≤ B) ↔
      IsCompact (closure {z : X | ∃ t : ℝ, 0 ≤ t ∧ z = QuotientGroup.mk (a t * u x)}) := sorry
theorem typical_unbounded_semiorbit : ∀ᵐ x ∂m,
    ¬ IsCompact (closure {z : X | ∃ t : ℝ, 0 ≤ t ∧ z = QuotientGroup.mk (a t * u x)}) := sorry

omit ha hu
-- Nonzero integer vectors and the separate q=0 case are essential to Mahler.
lemma badly_approximable_short_vector {x c : ℝ} (hc : 0 < c)
    (hbad : ∀ q : ℕ, 1 ≤ q → c ≤ (q : ℝ) * |(q : ℝ) * x - round ((q : ℝ) * x)|)
    {p q : ℤ} (hpq : p ≠ 0 ∨ q ≠ 0) {t : ℝ} (ht : 0 ≤ t) :
    min 1 (Real.sqrt c) ≤
      max (Real.exp t * |(p : ℝ) + x * (q : ℝ)|) (Real.exp (-t) * |(q : ℝ)|) := sorry
lemma short_vector_badly_approximable {x δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (hshort : ∀ p q : ℤ, (p ≠ 0 ∨ q ≠ 0) → ∀ t : ℝ, 0 ≤ t →
      δ ≤ max (Real.exp t * |(p : ℝ) + x * (q : ℝ)|)
        (Real.exp (-t) * |(q : ℝ)|)) :
    ∀ q : ℕ, 1 ≤ q → δ ^ 2 / 2 ≤ (q : ℝ) * |(q : ℝ) * x - round ((q : ℝ) * x)| := sorry
end HomogeneousConsumers

end TauCeti.Probability.MetricNumberTheory.PM4
