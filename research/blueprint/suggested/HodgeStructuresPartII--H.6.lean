import Mathlib.Analysis.Normed.Algebra.MatrixExponential
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.RingTheory.Nilpotent.Exp
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HodgeStructuresPartII--H.6.md is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures. They are prototypes, not implementations; proofs use `sorry`.

The mathematical hypotheses are in the packet and reader. Missing supplier
conditions are OMITTED and identified below; none is an arbitrary Prop field
or a proposition defined using sorry. The local representations use pinned
Mathlib matrices, submodules, analytic functions and internal direct sums.
They do not define another pure/mixed Hodge structure, log geometry theory,
monodromy filtration, Hodge form, sector object or Siegel set.

G1: SemistableLogModel represents ONLY a marked semistable normal-form chart.
Its global smooth analytic total space, proper family, chart atlas and log
sheaves are omitted. The wedge/cohomology signatures receive local linear maps
from the requested geometric comparison; their geometric origins are omitted.
G2: NilpotentOrbit represents the finite coordinate flag data and an explicitly
supplied domain subset. Its rational/integral structure and the identification
of this subset with the fixed-polarization native PeriodDomain are omitted.
Holomorphic flag maps are represented by analytic local coordinate maps.
The negative-Lie signatures use a fixed parameter or centered correction. In
a joint fixed chart its boundary value need not vanish; the commuting boundary
factor is retained in the packet rather than asserting a holomorphic varying
native Deligne complement.
The native global PVHS, curvature and tangent/stabilizer conditions are omitted.
G3: The filtration signatures receive genuine submodules and splittings, not
new abstract monodromy-filtration objects. Native limiting-MHS graded purity,
primitive polarization, relative filtration and exterior carriers are omitted.
G4: Norm statements receive the positive real diagonal of a supplied native
Hodge form, and finite splitting projections. The parameter-family specification,
common depth and bounded splitting transition interfaces are omitted. Fixed
coordinates here do not close the uniform compact-family theorem.
G5: Arithmetic signatures receive actual subsets of matrix groups. Their
rational parabolic, Siegel and fixed canonical Cartan specifications are omitted.
A compiled signature with these omissions does not discharge its packet gap.
-/

noncomputable section
open scoped BigOperators Matrix Matrix.Norms.Operator
open Set Filter Topology
namespace TauCeti.Hodge.Degeneration

abbrev Vec (d : ℕ) := Fin d → ℂ
abbrev Mat (d : ℕ) := Matrix (Fin d) (Fin d) ℂ
abbrev Flag (d : ℕ) := ℤ → Submodule ℂ (Vec d)

-- Private notation adapters, not proposed roadmap-owned definitions.
private def act {d : ℕ} (A : Mat d) (F : Flag d) : Flag d :=
  fun p => (F p).map (Matrix.toLin' A)
private def twist {n d : ℕ} (L : Fin n → Mat d) (z : Fin n → ℂ) : Mat d :=
  NormedSpace.exp (∑ i, z i • L i)
private def upper {n : ℕ} (Y : ℝ) : Set (Fin n → ℂ) :=
  {z | ∀ i, Y < (z i).im}

/-- G1: only the local normal-form/radius data; global family omitted. -/
structure SemistableLogModel (d : ℕ) where
  divisorCoordinates : Fin (d + 1)
  nonempty : 0 < divisorCoordinates.val
  radius : ℝ
  radius_pos : 0 < radius

def SemistableLogModel.localMap {d : ℕ} (M : SemistableLogModel d)
    (x : Vec d) : ℂ :=
  ∏ i : Fin d with i.val < M.divisorCoordinates.val, x i

lemma SemistableLogModel.localMap_equation {d : ℕ} (M : SemistableLogModel d)
    (x : Vec d) : M.localMap x =
      ∏ i : Fin d with i.val < M.divisorCoordinates.val, x i := by
  sorry

lemma SemistableLogModel.ext {d : ℕ} (M M' : SemistableLogModel d)
    (hr : M.divisorCoordinates = M'.divisorCoordinates)
    (hρ : M.radius = M'.radius) : M = M' := by
  sorry

-- G1: global properness and induced divisor-log atlas are omitted.
def SemistableLogModel.restrict {d : ℕ} (M : SemistableLogModel d)
    (ρ : ℝ) (hρ : 0 < ρ) (_hle : ρ ≤ M.radius) : SemistableLogModel d :=
  { M with radius := ρ, radius_pos := hρ }

lemma SemistableLogModel.restrict_comp {d : ℕ} (M : SemistableLogModel d)
    (ρ₁ ρ₂ : ℝ) (h₁ : 0 < ρ₁) (h₂ : 0 < ρ₂)
    (h₁M : ρ₁ ≤ M.radius) (h₂₁ : ρ₂ ≤ ρ₁) :
    (M.restrict ρ₁ h₁ h₁M).restrict ρ₂ h₂ h₂₁ =
      M.restrict ρ₂ h₂ (h₂₁.trans h₁M) := by
  sorry

private def smoothChart : SemistableLogModel 2 :=
  ⟨1, by decide, 1, by norm_num⟩
private def nodalChart : SemistableLogModel 2 :=
  ⟨2, by decide, 1, by norm_num⟩

-- SemistableLogModel_test_smooth
example (a b : ℂ) : smoothChart.localMap ![a,b] = a := by
  sorry
-- SemistableLogModel_test_node
example (a b : ℂ) : nodalChart.localMap ![a,b] = a * b := by
  sorry
-- SemistableLogModel_test_not_sum
example : nodalChart.localMap ![1,1] ≠ (2 : ℂ) := by
  sorry

-- G1: degree-one chart representative only; log complex and sheafification omitted.
theorem relativeLogForms {d : ℕ} (M : SemistableLogModel d) :
    Module.finrank ℂ ((Vec d) ⧸ Submodule.span ℂ
      {fun i : Fin d => if i.val < M.divisorCoordinates.val then (1 : ℂ) else 0}) =
      d - 1 := by
  sorry

-- G1: w and p are the wedge-dlog and quotient maps supplied by geometry.
-- Their origin in the shifted exact sequence of log complexes is omitted.
theorem wedgeDlogTriangle {a b c : ℕ} (w : Vec a →ₗ[ℂ] Vec b)
    (p : Vec b →ₗ[ℂ] Vec c) : LinearMap.ker p = LinearMap.range w := by
  sorry

-- G1: c is the marked proper log-cohomology base-change comparison.
-- The global cohomology construction, properness and log-smooth hypotheses are omitted.
theorem logCohomologyBaseChange {a b : ℕ} (c : Vec a →ₗ[ℂ] Vec b) :
    Function.Bijective c := by
  sorry

/-- G1: frame representative of the geometric connecting-map connection. -/
def logGaussManin {d : ℕ} (A : ℂ → Mat d) (q : ℂ) (v dv : Vec d) : Vec d :=
  dv + q⁻¹ • (A q).mulVec v

lemma logGaussManin.apply {d : ℕ} (A : ℂ → Mat d) (q : ℂ) (v dv : Vec d) :
    logGaussManin A q v dv = dv + q⁻¹ • (A q).mulVec v := by
  sorry
lemma logGaussManin.add {d : ℕ} (A : ℂ → Mat d) (q : ℂ)
    (u v du dv : Vec d) :
    logGaussManin A q (u + v) (du + dv) =
      logGaussManin A q u du + logGaussManin A q v dv := by
  sorry
lemma logGaussManin.leibniz {d : ℕ} (A : ℂ → Mat d) (q f df : ℂ)
    (v dv : Vec d) :
    logGaussManin A q (f • v) (df • v + f • dv) =
      df • v + f • logGaussManin A q v dv := by
  sorry
-- G1: this limit is the local residue calculation; special-fibre identification omitted.
lemma logGaussManin.residue {d : ℕ} (A : ℂ → Mat d)
    (hA : ContinuousAt A 0) (v : Vec d) :
    Tendsto (fun q => q • logGaussManin A q v 0) (𝓝[≠] 0)
      (𝓝 ((A 0).mulVec v)) := by
  sorry
lemma logGaussManin.horizontalMap {d e : ℕ} (A : ℂ → Mat d) (B : ℂ → Mat e)
    (P : Matrix (Fin e) (Fin d) ℂ) (hP : ∀ q, P * A q = B q * P)
    (q : ℂ) (v dv : Vec d) :
    P.mulVec (logGaussManin A q v dv) =
      logGaussManin B q (P.mulVec v) (P.mulVec dv) := by
  sorry
lemma logGaussManin.ramified {d : ℕ} (A : ℂ → Mat d) (e : ℕ) (he : 0 < e)
    (t : ℂ) (ht : t ≠ 0) (v dv : Vec d) :
    logGaussManin (fun s => (e : ℂ) • A (s ^ e)) t v
      (((e : ℂ) * t ^ (e - 1)) • dv) =
      ((e : ℂ) * t ^ (e - 1)) • logGaussManin A (t ^ e) v dv := by
  sorry

private def jordan : Mat 2 := !![0,1;0,0]
-- logGaussManin_test_zero
example {d : ℕ} (q : ℂ) (v dv : Vec d) :
    logGaussManin (fun _ => 0) q v dv = dv := by
  sorry
-- logGaussManin_test_jordan
example : logGaussManin (fun _ => jordan) 2 ![0,1] 0 = ![1/2,0] := by
  sorry
-- logGaussManin_test_leibniz
example (q : ℂ) : logGaussManin (fun _ => (0 : Mat 1)) q ![q] ![1] = ![1] := by
  sorry

-- G1: c comes from the specialized comparison of triangles, not an arbitrary marking.
theorem specialResidue {a b : ℕ} (c : Vec a ≃ₗ[ℂ] Vec b)
    (A : Vec a →ₗ[ℂ] Vec a) (A₀ : Vec b →ₗ[ℂ] Vec b) :
    c.toLinearMap.comp A = A₀.comp c.toLinearMap := by
  sorry

-- G1: P is the actual nearby-cycle/de Rham marking; its geometric condition omitted.
theorem semistableBetti {d : ℕ} (P : (Mat d)ˣ) (T A₀ : Mat d) :
    T = (P : Mat d) * NormedSpace.exp ((-(2 * Real.pi : ℂ) * Complex.I) • A₀) *
      (↑P⁻¹ : Mat d) := by
  sorry

theorem equivariantLogComparison {d : ℕ} (A : Mat d) (H : Type*)
    [Group H] (ρ : H →* (Mat d)ˣ)
    (hρ : ∀ g, Commute (ρ g : Mat d) A) (g : H) :
    Commute (ρ g : Mat d) (NormedSpace.exp ((-(2 * Real.pi : ℂ) * Complex.I) • A)) := by
  sorry

-- G1: semistable modification and geometric comparison omitted.
-- The displayed assertion is the genuine generic scalar/power interface received from LPV.1.
theorem ramifiedResidue {d : ℕ} (L : Mat d) (hL : IsNilpotent L)
    (e : ℕ) (he : 0 < e) :
    NormedSpace.exp ((e : ℂ) • L) = NormedSpace.exp L ^ e ∧
      (∀ r : ℕ, ((e : ℂ) • L) ^ r = 0 ↔ L ^ r = 0) := by
  sorry

-- G2: T is coordinate monodromy of the integral polarized horizontal variation;
-- the global carrier and these hypotheses are omitted, not replaced by a fake class.
theorem quasiUnipotentMonodromy {d : ℕ} (T : Mat d) :
    ∃ e : ℕ, 0 < e ∧ IsNilpotent (T ^ e - 1) := by
  sorry

-- G2/G3: rational finite-log construction and isometry Lie-algebra hypotheses omitted.
-- The commuting nilpotent matrices and their exponential identity are the typed local output.
theorem unipotentNormalization {n d : ℕ} (T : Fin n → Mat d)
    (hT : ∀ i j, Commute (T i) (T j))
    (hqu : ∀ i, ∃ e : ℕ, 0 < e ∧ IsNilpotent (T i ^ e - 1)) :
    ∃ (e : Fin n → ℕ) (L : Fin n → Mat d),
      (∀ i, 0 < e i ∧ IsNilpotent (L i) ∧ NormedSpace.exp (L i) = T i ^ e i) ∧
      ∀ i j, Commute (L i) (L j) := by
  sorry

/-- G2: local flags and supplied domain; rational lattice/polarization omitted. -/
structure NilpotentOrbit (n d : ℕ) (D : Set (Flag d)) where
  L : Fin n → Mat d
  F : Flag d
  antitone : Antitone F
  exhaustive : ∃ p, F p = ⊤
  separated : ∃ p, F p = ⊥
  nilpotent : ∀ i, IsNilpotent (L i)
  commute : ∀ i j, Commute (L i) (L j)
  lowering : ∀ i p, (F p).map (Matrix.toLin' (L i)) ≤ F (p - 1)
  eventual : ∃ Y : ℝ, 0 < Y ∧ ∀ z ∈ upper Y, act (twist L z) F ∈ D

def NilpotentOrbit.orbit {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (z : Fin n → ℂ) : Flag d :=
  act (twist O.L z) O.F
lemma NilpotentOrbit.orbit_zero {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) : O.orbit 0 = O.F := by
  sorry
lemma NilpotentOrbit.orbit_shift {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (z : Fin n → ℂ) (a : Fin n → ℤ) :
    O.orbit (fun i => z i + a i) = act (twist O.L (fun i => (a i : ℂ))) (O.orbit z) := by
  sorry
lemma NilpotentOrbit.horizontal {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (i : Fin n) (p : ℤ) :
    (O.F p).map (Matrix.toLin' (O.L i)) ≤ O.F (p - 1) := by
  sorry
lemma NilpotentOrbit.eventual_mem {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) :
    ∃ Y : ℝ, 0 < Y ∧ ∀ z, (∀ i, Y < (z i).im) → O.orbit z ∈ D := by
  sorry

def NilpotentOrbit.reindex {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (σ : Equiv.Perm (Fin n)) : NilpotentOrbit n d D where
  L := O.L ∘ σ
  F := O.F
  antitone := by sorry
  exhaustive := by sorry
  separated := by sorry
  nilpotent := by sorry
  commute := by sorry
  lowering := by sorry
  eventual := by sorry
lemma NilpotentOrbit.ext {n d : ℕ} {D : Set (Flag d)} (O O' : NilpotentOrbit n d D)
    (hL : O.L = O'.L) (hF : O.F = O'.F) : O = O' := by
  sorry

-- NilpotentOrbit_test_zero
example {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (hL : ∀ i, O.L i = 0) (z : Fin n → ℂ) : O.orbit z = O.F := by
  sorry
-- NilpotentOrbit_test_elliptic: the degree-one coordinate calculation.
example (z : ℂ) :
    (Submodule.span ℂ {(![0,1] : Vec 2)}).map
      (Matrix.toLin' (NormedSpace.exp (z • jordan))) =
      Submodule.span ℂ {(![z,1] : Vec 2)} := by
  sorry
-- NilpotentOrbit_test_no_positivity
example {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (hL : ∀ i, O.L i = 0) : O.F ∈ D := by
  sorry

/-- G2: universal-cover representative; holomorphic descent carrier omitted. -/
def untwistedPeriodMap {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) : Flag d :=
  act (twist L (fun i => -z i)) (Φ z)
lemma untwistedPeriodMap.apply {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap L Φ z = act (twist L (fun i => -z i)) (Φ z) := by
  sorry
lemma untwistedPeriodMap.undo {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    act (twist L z) (untwistedPeriodMap L Φ z) = Φ z := by
  sorry
lemma untwistedPeriodMap.integer_shift {n d : ℕ} (L : Fin n → Mat d)
    (hL : ∀ i j, Commute (L i) (L j)) (Φ : (Fin n → ℂ) → Flag d)
    (hΦ : ∀ (z : Fin n → ℂ) (a : Fin n → ℤ),
      Φ (fun i => z i + a i) = act (twist L (fun i => (a i : ℂ))) (Φ z))
    (z : Fin n → ℂ) (a : Fin n → ℤ) :
    untwistedPeriodMap L Φ (fun i => z i + a i) = untwistedPeriodMap L Φ z := by
  sorry
lemma untwistedPeriodMap.zero {n d : ℕ} (Φ : (Fin n → ℂ) → Flag d) :
    untwistedPeriodMap (fun _ => (0 : Mat d)) Φ = Φ := by
  sorry
lemma untwistedPeriodMap.gauge {n d : ℕ} (P : (Mat d)ˣ) (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap (fun i => (↑P : Mat d) * L i * (↑P⁻¹ : Mat d))
      (fun z => act (↑P : Mat d) (Φ z)) z = act (↑P : Mat d) (untwistedPeriodMap L Φ z) := by
  sorry
-- G2: geometric canonical-extension identification omitted; its residue convention retained.
lemma untwistedPeriodMap.canonicalExtension {n d : ℕ} (L : Fin n → Mat d) (i : Fin n) :
    NormedSpace.exp ((-(2 * Real.pi : ℂ) * Complex.I) •
      ((-(2 * Real.pi : ℂ) * Complex.I)⁻¹ • L i)) = NormedSpace.exp (L i) := by
  sorry

-- untwistedPeriodMap_test_orbit
example {n d : ℕ} (L : Fin n → Mat d) (F : Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap L (fun z => act (twist L z) F) z = F := by
  sorry
-- untwistedPeriodMap_test_zero
example {d : ℕ} (Φ : (Fin 0 → ℂ) → Flag d) (z : Fin 0 → ℂ) :
    untwistedPeriodMap (fun i => Fin.elim0 i) Φ z = Φ z := by
  sorry
-- untwistedPeriodMap_test_sign
example : (Submodule.span ℂ {(![Complex.I,1] : Vec 2)}).map
    (Matrix.toLin' (NormedSpace.exp ((-Complex.I) • jordan))) =
      Submodule.span ℂ {(![0,1] : Vec 2)} := by
  sorry

-- G2: f represents the untwisted flag map in a requested local coordinate chart.
-- Its origin in a horizontal PVHS and the compact-dual chart identification are omitted.
theorem untwistedExtension {n d : ℕ} (f : (Fin n → ℂ) → Vec d)
    (hhol : AnalyticOnNhd ℂ f {q | ∀ i, 0 < ‖q i‖ ∧ ‖q i‖ < 1}) :
    ∃ fbar : (Fin n → ℂ) → Vec d,
      AnalyticOnNhd ℂ fbar {q | ∀ i, ‖q i‖ < 1} ∧
      ∀ q, (∀ i, 0 < ‖q i‖ ∧ ‖q i‖ < 1) → fbar q = f q := by
  sorry

-- G2: L,F are the normalized variation's actual limit data, not arbitrary flags.
theorem nilpotentOrbitTheorem {n d : ℕ} (D : Set (Flag d))
    (L : Fin n → Mat d) (F : Flag d) :
    ∃ O : NilpotentOrbit n d D, O.L = L ∧ O.F = F := by
  sorry

-- G2: f is the finite-monodromy period map on its killing cover; its origin omitted.
theorem finiteMonodromyExtension {n d : ℕ} (D : Set (Vec d))
    (f : (Fin n → ℂ) → Vec d) :
    ∃ fbar : (Fin n → ℂ) → Vec d,
      AnalyticOnNhd ℂ fbar {q | ∀ i, ‖q i‖ < 1} ∧
      (∀ q, (∀ i, ‖q i‖ < 1) → fbar q ∈ D) ∧
      ∀ q, (∀ i, 0 < ‖q i‖ ∧ ‖q i‖ < 1) → fbar q = f q := by
  sorry

-- G3: W is the supplier's centered monodromy filtration assignment.
-- Its characterization, rationality and relative-face API are omitted.
theorem nilpotentConeWeights {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (W : Mat d → ℤ → Submodule ℂ (Vec d)) (a b : Fin n → ℝ)
    (ha : ∀ i, 0 < a i) (hb : ∀ i, 0 < b i) :
    W (∑ i, (a i : ℂ) • O.L i) = W (∑ i, (b i : ℂ) • O.L i) := by
  sorry

-- G3: local induced opposedness output only. Native rational MHS, quotient carrier
-- for gr^W, primitive polarization and the weight-k shift are omitted.
theorem limitingMixedHodge {d : ℕ} (k r : ℤ)
    (Fgraded conjFgraded : ℤ → Submodule ℂ (Vec d)) (p : ℤ) :
    IsCompl (Fgraded p) (conjFgraded (k + r + 1 - p)) := by
  sorry

-- G3: I is the native Deligne splitting of the actual full-cone limit.
theorem logarithmsTypeMinusOne {n d : ℕ} (L : Fin n → Mat d)
    (I : ℤ → ℤ → Submodule ℂ (Vec d)) (i : Fin n) (p q : ℤ) :
    (I p q).map (Matrix.toLin' (L i)) ≤ I (p - 1) (q - 1) := by
  sorry

-- G3: the three subspaces are steps in the lattice generated by the actual
-- Hodge/initial-face-weight family; the specification is omitted.
theorem hodgeWeightDistributive {d : ℕ} (A B C : Submodule ℂ (Vec d)) :
    A ⊓ (B ⊔ C) = (A ⊓ B) ⊔ (A ⊓ C) := by
  sorry

-- G3: F,W are the actual bounded Hodge and centered face weights.
-- The rational J output and the distributive-family supplier hypothesis are omitted.
-- Parameter transport is supplied by the commuting boundary factor in the packet;
-- its native analytic bundle/metric interface is omitted here.
theorem simultaneousSplittings {n d : ℕ} (F : Flag d)
    (W : Fin n → ℤ → Submodule ℂ (Vec d)) :
    ∃ I : (ℤ × (Fin n → ℤ)) → Submodule ℂ (Vec d),
      DirectSum.IsInternal I ∧
      (∀ r, F r = ⨆ a, ⨆ (_ : r ≤ a.1), I a) ∧
      ∀ j r, W j r = ⨆ a, ⨆ (_ : a.2 j ≤ r), I a := by
  sorry

/-- G2: represented exponential correction; its negative Lie subspace/chart omitted. -/
def negativeLieCorrection {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (q : Fin n → ℂ) : Mat d := NormedSpace.exp (v q)
lemma negativeLieCorrection.exp_zero {n d : ℕ} (q : Fin n → ℂ) :
    negativeLieCorrection (fun _ => (0 : Mat d)) q = 1 := by
  sorry
-- G2: Ψ and v come from the inverse big-cell chart; this origin is omitted.
lemma negativeLieCorrection.lift {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (Ψ : (Fin n → ℂ) → Flag d) (F : Flag d) (q : Fin n → ℂ) :
    Ψ q = act (negativeLieCorrection v q) F := by
  sorry
-- Injectivity is supplied by the honest chosen chart, not a dummy Prop field.
lemma negativeLieCorrection.unique {d : ℕ} (F : Flag d) (B : Set (Mat d))
    (hchart : Set.InjOn (fun A => act (NormedSpace.exp A) F) B)
    (A A' : Mat d) (hA : A ∈ B) (hA' : A' ∈ B)
    (h : act (NormedSpace.exp A) F = act (NormedSpace.exp A') F) : A = A' := by
  sorry
lemma negativeLieCorrection.boundary {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (hv : v 0 = 0) : negativeLieCorrection v 0 = 1 := by
  sorry

def negativeLieCorrection.gamma {n d : ℕ} (L : Fin n → Mat d)
    (v : (Fin n → ℂ) → Mat d) (z : Fin n → ℂ) : Mat d :=
  twist L z * negativeLieCorrection v
    (fun i => Complex.exp ((2 * Real.pi : ℂ) * Complex.I * z i))
lemma negativeLieCorrection.buffer {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (U K : Set (Fin n → ℂ)) (hv : AnalyticOnNhd ℂ v U)
    (hK : K ⊆ U) : AnalyticOnNhd ℂ v K := by
  sorry

-- negativeLieCorrection_test_zero
example {n d : ℕ} (q : Fin n → ℂ) :
    negativeLieCorrection (fun _ => (0 : Mat d)) q = 1 := by
  sorry
-- negativeLieCorrection_test_square_zero
example {d : ℕ} (A : Mat d) (hA : A ^ 2 = 0) :
    negativeLieCorrection (fun _ : Fin 1 → ℂ => A) 0 = 1 + A := by
  sorry
-- negativeLieCorrection_test_nonidentity
example : negativeLieCorrection (fun _ : Fin 1 → ℂ => jordan) 0 ≠ 1 := by
  sorry

-- G2: g is the actual negative-Lie lift, and FminusOne the Lie Hodge step.
-- Horizontality/negative-chart specifications omitted. Analytic derivative is real data.
theorem horizontalCorrection {d : ℕ} (g : ℂ → Mat d) (L : Mat d)
    (FminusOne : Submodule ℂ (Mat d)) (q : ℂ) (hhol : AnalyticAt ℂ g q) :
    (g q)⁻¹ * L * g q + ((2 * Real.pi : ℂ) * Complex.I * q) •
      ((g q)⁻¹ * deriv g q) ∈ FminusOne := by
  sorry

-- Private inline numerical comparison, not H.7 sector/rough-monomial objects.
private def ordered {n : ℕ} (R Y : ℝ) (z : Fin n → ℂ) : Prop :=
  (∀ i, |(z i).re| ≤ R ∧ Y ≤ (z i).im) ∧
  ∀ i j, i ≤ j → (z j).im ≤ (z i).im
private def weightMonomial {n : ℕ} (σ : Fin n → ℤ) (y : Fin n → ℝ) : ℝ :=
  ∏ i : Fin n, (if h : i.val + 1 < n then y i / y ⟨i.val + 1, h⟩ else y i) ^ (σ i)
private def weightedSum {n d m : ℕ} (σ : Fin m → Fin n → ℤ)
    (pr : Fin m → (Vec d →ₗ[ℂ] Vec d)) (z : Fin n → ℂ) (u : Vec d) : ℝ :=
  ∑ a, weightMonomial (σ a) (fun i => (z i).im) * ‖pr a u‖ ^ 2

-- G2/G3/G4: h is the actual native positive Hodge diagonal of Φ; pr and σ
-- are a compatible splitting and centered labels. Their geometric specifications,
-- compact parameters and constant-rank/bounded-transition hypotheses are omitted.
theorem flatNormEstimate {n d m : ℕ} (h : (Fin n → ℂ) → Vec d → ℝ)
    (σ : Fin m → Fin n → ℤ) (pr : Fin m → (Vec d →ₗ[ℂ] Vec d))
    (hpr : ∀ u, ∑ a, pr a u = u) (R : ℝ) (hR : 0 ≤ R) :
    ∃ c C Y : ℝ, 0 < c ∧ 0 < C ∧ 0 < Y ∧
      ∀ z, ordered R Y z → ∀ u,
        c * weightedSum σ pr z u ≤ h z u ∧ h z u ≤ C * weightedSum σ pr z u := by
  sorry

-- G2/G3/G4: same omissions as flatNormEstimate; h is evaluated at the moving vector.
theorem movingNormEstimate {n d m : ℕ} (h : (Fin n → ℂ) → Vec d → ℝ)
    (L : Fin n → Mat d) (σ : Fin m → Fin n → ℤ)
    (pr : Fin m → (Vec d →ₗ[ℂ] Vec d)) (hpr : ∀ u, ∑ a, pr a u = u)
    (R : ℝ) (hR : 0 ≤ R) :
    ∃ c C Y : ℝ, 0 < c ∧ 0 < C ∧ 0 < Y ∧
      ∀ z, ordered R Y z → ∀ u,
        c * weightedSum σ pr z u ≤ h z ((twist L z).mulVec u) ∧
        h z ((twist L z).mulVec u) ≤ C * weightedSum σ pr z u := by
  sorry

-- G3/G4: a chosen basis represents the supplied exterior-power carrier.
-- The basis/Gram determinant identification and polarization are omitted.
theorem exteriorPowerEstimates {n e m : ℕ} (r : ℕ)
    (hExterior : (Fin n → ℂ) → Vec e → ℝ) (LExterior : Fin n → Mat e)
    (σ : Fin m → Fin n → ℤ) (pr : Fin m → (Vec e →ₗ[ℂ] Vec e))
    (R : ℝ) (hR : 0 ≤ R) :
    ∃ c C Y : ℝ, 0 < c ∧ 0 < C ∧ 0 < Y ∧
      ∀ z, ordered R Y z → ∀ u,
        (c * weightedSum σ pr z u ≤ hExterior z u ∧
          hExterior z u ≤ C * weightedSum σ pr z u) ∧
        (c * weightedSum σ pr z u ≤ hExterior z ((twist LExterior z).mulVec u) ∧
          hExterior z ((twist LExterior z).mulVec u) ≤ C * weightedSum σ pr z u) := by
  sorry

-- G2/G4: v satisfies the triangular horizontal theorem in its negative-Lie chart;
-- h is the actual Hodge diagonal. These global specifications are omitted.
theorem perturbedNormComparison {n d : ℕ} (h : (Fin n → ℂ) → Vec d → ℝ)
    (L : Fin n → Mat d) (v : (Fin n → ℂ) → Mat d) (R : ℝ) (hR : 0 ≤ R) :
    ∃ c C Y : ℝ, 0 < c ∧ 0 < C ∧ 0 < Y ∧
      ∀ z, ordered R Y z → ∀ u,
        c * h z ((twist L z).mulVec u) ≤
          h z ((negativeLieCorrection.gamma L v z).mulVec u) ∧
        h z ((negativeLieCorrection.gamma L v z).mulVec u) ≤
          C * h z ((twist L z).mulVec u) := by
  sorry

-- G2/G3/G5: rational SL2/parabolic and factor-membership specifications omitted.
-- Φ is the represented period frame. The factor equation and asymptotic are local outputs.
theorem oneVariableSL2 {d : ℕ} (Φ : ℂ → Mat d) (Ygrading : Mat d)
    (R : ℝ) (hR : 0 ≤ R) :
    ∃ (Y₀ : ℝ) (r t m k : ℝ → ℝ → Mat d),
      0 < Y₀ ∧ (∀ x y, |x| ≤ R → Y₀ < y →
        Φ ((x : ℂ) + (y : ℂ) * Complex.I) = r x y * t x y * m x y * k x y) ∧
      ∀ x, |x| ≤ R → Tendsto
        (fun y => NormedSpace.exp (((Real.log y / 2 : ℝ) : ℂ) • Ygrading) * t x y)
        atTop (𝓝 1) := by
  sorry

-- G5: siegel indexes the genuine fixed-canonical-K Siegel sets supplied by AA.3.
-- Their specification, the compatible metric adapter and analytic outer buffer are omitted.
theorem oneVariableSiegel {d : ℕ} (Φ : ℂ → Mat d)
    (sie : ℕ → Set (Mat d)) (R η : ℝ) (hR : 0 ≤ R) (hη : 0 < η) :
    ∃ J : Finset ℕ, ∀ z, |z.re| ≤ R → η ≤ z.im →
      Φ z ∈ ⋃ j ∈ J, sie j := by
  sorry

-- G2/G5: the pulled-back integral variation and fixed-K Siegel conditions omitted.
-- The denominator clearing and combined logarithm are concrete typed outputs.
theorem powerCurveNormalization {n d : ℕ} (a : Fin n → ℚ)
    (ha : ∀ i, 0 ≤ a i) (L : Fin n → Mat d) :
    ∃ (e : ℕ) (b : Fin n → ℕ), 0 < e ∧
      (∀ i, (e : ℚ) * a i = b i) ∧
      (∑ i, ((b i : ℕ) : ℂ) • L i) =
        (e : ℂ) • (∑ i, (a i : ℂ) • L i) := by
  sorry

end TauCeti.Hodge.Degeneration
