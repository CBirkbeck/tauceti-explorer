/-
Suggested Lean prototypes for the roadmap "Coleman integration and noncritical Dirichlet
L-values" (ColemanIntegration), layers L0-L3.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ColemanIntegration.md` is definitive. The statements below suggest Lean
forms so that contributors and reviewers converge on names and signatures. Every proof of a
planned result is `sorry`; nothing here is claimed to be formalised (implementationStatus =
unchecked). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

Names are relative to the namespace `TauCeti.ColemanIntegration` and agree with the `api` and
`tests` names of the packet `research/blueprint/packets/ColemanIntegration.json`. Unit tests are
`example`s whose docstring begins "Test `<name>`". An API item or node that cannot be stated
honestly with the pinned libraries is a comment `-- <name>: not stated; needs <missing object>`.
Objects of other roadmaps are never invented here: where a statement needs one it is a comment,
or it enters as a parameter whose properties are hypotheses.

Organisation.
* Section `PartA`: layers L0 and L1. Power series, primitives, residues, the branches
  `padicLogBranch p a` of the logarithm and `iwasawaLog p`; Frobenius data, the word algebra and
  Coleman functions, with concrete prototypes on the tube of `U_N = P¹ ∖ ({0, ∞} ∪ μ_N)`. Rigid
  generic fibres, dagger algebras, Laurent rings of annuli and rigid cohomology are owned by
  AdicSpacesPartII, PadicHodgeTheory and PadicDifferentialEquationsAndRigidCohomology, so the
  statements that need them are comments.
* Section `PartB`: layer L2. Coleman's polylogarithm `padicPolylog p hL k`, defined through its
  elementary characterisation for any function `L` with `IsLogBranch p a L`.
* Section `PositiveIntegerValues`: layer L3. Stated over a complete ultrametric field `K` that
  is a topological `ℤ_[p]`-algebra. Coleman's polylogarithms and the branch enter as parameters
  `Li` and `plog`, whose properties are the predicates `SatisfiesPolylogODE`,
  `HasResidueDiscExpansions`, `SatisfiesDistributionRelation` and `HasLocalFormAtOne`. The
  p-adic L-function (DirichletPadicLFunctions:L3) and locally analytic distributions
  (LocallyAnalyticDistributions:L1) are not in the pinned libraries, so theorems are stated for
  bounded measures and power series, and the `L_p` forms are comments.
* Section `Links`: the three sections joined. `padicLogBranch p a` satisfies `IsLogBranch`, so
  `colemanPolylog p a := padicPolylog p (isLogBranch_padicLogBranch p a)` is Coleman's `Li^a_k`.
  With the `ℤ_[p]`-algebra structure on `ℂ_[p]` given there, `colemanPolylog p a` has the four
  properties the L3 section assumes, for `K = ℂ_[p]`.

Dependency on Tau Ceti: the module `TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic` (at f790474)
is imported for `NormedSpace.logOneAdd`; it depends only on Mathlib.
-/

import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Analysis.Calculus.FDeriv.Analytic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.Analytic.OfScalars
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.GaussNorm
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Frobenius
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.Dynamics.PeriodicPts.Defs
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.FieldTheory.IntermediateField.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Eval
import Mathlib.NumberTheory.DirichletCharacter.GaussSum
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.NumberTheory.LSeries.ZMod
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.Padics.Measure.AmiceTransform
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.Polynomial.Cyclotomic.Roots
import Mathlib.RingTheory.IntegralDomain
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.NumberTheory.Bernoulli
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.Fourier.ZMod

open Filter Topology

set_option linter.unusedSectionVars false

noncomputable section

namespace TauCeti.ColemanIntegration

section PartA

/-! ## Layer L0: analytic differential equations on residue discs -/

section NatCastBound

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]

/-- `ColemanIntegration:L0/ultrametric-natcast-bound`: in an ultrametric field of
characteristic zero, `‖1/n‖` grows at most polynomially. -/
theorem norm_natCast_inv_le_rpow :
    ∃ s : ℝ, 0 ≤ s ∧ ∀ n : ℕ, 0 < n → ‖(n : K)‖⁻¹ ≤ (n : ℝ) ^ s := by
  sorry

/-- Part (b) of `ColemanIntegration:L0/ultrametric-natcast-bound`. -/
theorem norm_natCast_eq_pow_padicValNat (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ < 1) (n : ℕ)
    (hn : 0 < n) : ‖(n : K)‖ = ‖(p : K)‖ ^ padicValNat p n := by
  sorry

end NatCastBound

/-! ### The normalised formal primitive (`ColemanIntegration:L0/formal-primitive`) -/

namespace PowerSeries

open _root_.PowerSeries

variable {A : Type*} [CommRing A] [Algebra ℚ A]

/-- The normalised formal primitive `∑ aₙ Xⁿ ↦ ∑ aₙ Xⁿ⁺¹/(n+1)` over a `ℚ`-algebra. -/
def primitive : A⟦X⟧ →ₗ[A] A⟦X⟧ where
  toFun f := PowerSeries.mk fun n =>
    if n = 0 then 0 else algebraMap ℚ A (1 / (n : ℚ)) * coeff (n - 1) f
  map_add' := by sorry
  map_smul' := by sorry

@[simp] theorem coeff_zero_primitive (f : A⟦X⟧) : coeff 0 (primitive f) = 0 := by
  sorry

@[simp] theorem coeff_succ_primitive (f : A⟦X⟧) (n : ℕ) :
    coeff (n + 1) (primitive f) = algebraMap ℚ A (1 / ((n : ℚ) + 1)) * coeff n f := by
  sorry

/-- `ColemanIntegration:L0/derivative-formal-primitive`. -/
theorem derivative_primitive (f : A⟦X⟧) : derivative A (primitive f) = f := by
  sorry

/-- `ColemanIntegration:L0/derivative-formal-primitive`, second identity. -/
theorem primitive_derivative (f : A⟦X⟧) :
    primitive (derivative A f) = f - C (constantCoeff f) := by
  sorry

@[simp] theorem primitive_X_pow (n : ℕ) :
    primitive ((X : A⟦X⟧) ^ n) = C (algebraMap ℚ A (1 / ((n : ℚ) + 1))) * X ^ (n + 1) := by
  sorry

theorem map_primitive {B : Type*} [CommRing B] [Algebra ℚ B] (g : A →+* B) (f : A⟦X⟧) :
    map g (primitive f) = primitive (map g f) := by
  sorry

theorem primitive_eq_log : primitive (mk fun n => (-1 : A) ^ n) = log A := by
  sorry

/-- `ColemanIntegration:L0/formal-primitive-unique`. -/
theorem eq_C_add_primitive_iff (f g : A⟦X⟧) (c : A) :
    (derivative A g = f ∧ constantCoeff g = c) ↔ g = C c + primitive f := by
  sorry

/-- Test `PowerSeries.primitive_one` (computation). -/
example : primitive (1 : A⟦X⟧) = X := by sorry

/-- Test `PowerSeries.primitive_zero` (degenerate). -/
example : primitive (0 : A⟦X⟧) = 0 := by sorry

/-- Test `PowerSeries.primitive_geometric_eq_log` (compatibility). -/
example : primitive (mk fun n => (-1 : A) ^ n) = log A := by sorry

/-- Test `PowerSeries.not_exists_derivative_eq_X_pow_pred` (non-example). -/
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ g : (ZMod p)⟦X⟧, derivative (ZMod p) g = X ^ (p - 1) := by sorry

end PowerSeries

/-! ### Radius-loss estimate (`ColemanIntegration:L0/formal-primitive-radius`) -/

section Radius

open _root_.PowerSeries

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]
  [CompleteSpace K]

/-- (a): termwise integration does not change the radius of convergence. -/
theorem radius_ofScalars_primitive (f : K⟦X⟧) :
    (FormalMultilinearSeries.ofScalars K (fun n => coeff n (PowerSeries.primitive f))).radius =
      (FormalMultilinearSeries.ofScalars K (fun n => coeff n f)).radius := by
  sorry

/-- (b): restricted at `ρ` implies the primitive is restricted at every `r < ρ`. -/
theorem isRestricted_primitive_of_lt {f : K⟦X⟧} {ρ r : ℝ} (hr : 0 < r) (hrρ : r < ρ)
    (hf : f.IsRestricted ρ) : (PowerSeries.primitive f).IsRestricted r := by
  sorry

/-- (b), Gauss-norm form. -/
theorem gaussNorm_primitive_le {f : K⟦X⟧} {ρ r : ℝ} (hr : 0 < r) (hrρ : r < ρ)
    (hf : f.IsRestricted ρ) :
    ∃ C : ℝ, 0 ≤ C ∧ (PowerSeries.primitive f).gaussNorm norm r ≤ C * f.gaussNorm norm ρ := by
  sorry

/-- (c): the primitive of an overconvergent series is overconvergent. -/
theorem isRestricted_primitive_of_overconvergent {f : K⟦X⟧} {ρ ρ' : ℝ} (hρ : 0 < ρ)
    (hρρ' : ρ < ρ') (hf : f.IsRestricted ρ') :
    ∃ ρ'' : ℝ, ρ < ρ'' ∧ (PowerSeries.primitive f).IsRestricted ρ'' := by
  sorry

open Classical in
/-- `ColemanIntegration:L0/closed-disc-primitive-failure`: `∑ pᵏ X^(pᵏ-1)` is restricted at
`1` but its primitive `∑ X^(pᵏ)` is not. -/
theorem not_isRestricted_primitive_closedDisc (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ < 1) :
    let f : K⟦X⟧ := PowerSeries.mk fun n => if ∃ k : ℕ, n + 1 = p ^ k then ((n + 1 : ℕ) : K) else 0
    f.IsRestricted 1 ∧ ¬ (PowerSeries.primitive f).IsRestricted 1 := by
  sorry

end Radius

/-! ### Analytic functions on open discs (`ColemanIntegration:L0/disc-analytic-functions`) -/

section Disc

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- The functions on the open disc `D⁻(a, r)` given by one convergent power series. -/
def discAnalytic (a : K) (r : ENNReal) : Subalgebra K (Metric.eball a r → K) where
  carrier := {f | ∃ (F : K → K) (P : FormalMultilinearSeries K K K),
    HasFPowerSeriesOnBall F P a r ∧ ∀ z : Metric.eball a r, f z = F z}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

theorem mem_discAnalytic_iff (a : K) (r : ENNReal) (f : Metric.eball a r → K) :
    f ∈ discAnalytic a r ↔ ∃ (F : K → K) (P : FormalMultilinearSeries K K K),
      HasFPowerSeriesOnBall F P a r ∧ ∀ z : Metric.eball a r, f z = F z := Iff.rfl

/-- The coefficient sequence at the centre (unique by `HasFPowerSeriesAt.eq_formalMultilinearSeries`). -/
def discAnalytic.coeff {a : K} {r : ENNReal} (f : discAnalytic a r) (n : ℕ) : K :=
  (Classical.choose (Classical.choose_spec f.2)).coeff n

theorem discAnalytic.deriv_mem {a : K} {r : ENNReal} {F : K → K} {P : FormalMultilinearSeries K K K}
    (hF : HasFPowerSeriesOnBall F P a r) :
    (fun z : Metric.eball a r => deriv F z) ∈ discAnalytic a r := by
  sorry

/-- Recentring: in an ultrametric field every point of a disc is a centre. -/
theorem discAnalytic.recentre {a a' : K} {r : ENNReal} (ha' : a' ∈ Metric.eball a r)
    {F : K → K} {P : FormalMultilinearSeries K K K} (hF : HasFPowerSeriesOnBall F P a r) :
    Metric.eball a' r = Metric.eball a r ∧
      ∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall F Q a' r := by
  sorry

theorem discAnalytic.restrict {a b : K} {r r' : ENNReal} (hsub : Metric.eball b r' ⊆ Metric.eball a r)
    (hr' : 0 < r') {F : K → K} {P : FormalMultilinearSeries K K K}
    (hF : HasFPowerSeriesOnBall F P a r) :
    ∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall F Q b r' := by
  sorry

theorem discAnalytic.eq_zero_of_eqOn {a : K} {r : ENNReal} {F : K → K}
    {P : FormalMultilinearSeries K K K} (hF : HasFPowerSeriesOnBall F P a r) {U : Set K}
    (hU : IsOpen U) (hne : U.Nonempty) (hUsub : U ⊆ Metric.eball a r) (h0 : Set.EqOn F 0 U) :
    Set.EqOn F 0 (Metric.eball a r) := by
  sorry

-- discAnalytic.equivRPlus: not stated; needs the ring R^+ with its Fréchet topology,
-- owned by LocallyAnalyticDistributions:L1 (requested).

theorem discAnalytic.ofIsRestricted {f : PowerSeries K} {ρ : ℝ} {r : NNReal} (hr : 0 < r)
    (hrρ : (r : ℝ) < ρ) (hf : f.IsRestricted ρ) :
    HasFPowerSeriesOnBall
      (fun z => (FormalMultilinearSeries.ofScalars K (fun n => PowerSeries.coeff n f)).sum z)
      (FormalMultilinearSeries.ofScalars K (fun n => PowerSeries.coeff n f)) 0 r := by
  sorry

/-- Test `discAnalytic_logOneAdd` (computation). -/
example (p : ℕ) [Fact p.Prime] :
    HasFPowerSeriesOnBall (NormedSpace.logOneAdd ℂ_[p] ℂ_[p])
      (NormedSpace.logOneAddSeries ℂ_[p] ℂ_[p]) 0 1 := by sorry

/-- Test `discAnalytic_indicator_not_mem` (non-example). -/
example (p : ℕ) [Fact p.Prime] :
    AnalyticOnNhd ℂ_[p] (Set.indicator (Metric.ball (0 : ℂ_[p]) (p : ℝ)⁻¹) (fun _ => (1 : ℂ_[p]))) (Metric.ball 0 1) ∧
      ¬ ∃ P : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p],
        HasFPowerSeriesOnBall (Set.indicator (Metric.ball (0 : ℂ_[p]) (p : ℝ)⁻¹) (fun _ => (1 : ℂ_[p]))) P 0 1 := by
  sorry

/-- Test `discAnalytic_const` (degenerate). -/
example (a c : K) (r : ENNReal) : (fun _ : Metric.eball a r => c) ∈ discAnalytic a r := by sorry

/-- Test `discAnalytic_geometric` (compatibility). -/
example (p : ℕ) [Fact p.Prime] :
    HasFPowerSeriesOnBall (fun z : ℂ_[p] => (1 - z)⁻¹)
        (FormalMultilinearSeries.ofScalars ℂ_[p] fun _ => (1 : ℂ_[p])) 0 1 ∧
      ¬ (PowerSeries.mk fun _ => (1 : ℂ_[p])).IsRestricted 1 := by sorry

/-- `ColemanIntegration:L0/disc-primitive-unique`: the unique primitive on an open disc with a
chosen value at a base point. -/
theorem existsUnique_primitive_disc [CharZero K] {a : K} {r : ENNReal} {f : K → K}
    {P : FormalMultilinearSeries K K K} (hf : HasFPowerSeriesOnBall f P a r) {b : K}
    (hb : b ∈ Metric.eball a r) (c : K) :
    ∃ F : K → K, (∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall F Q a r) ∧
      (∀ z ∈ Metric.eball a r, HasDerivAt F (f z) z) ∧ F b = c ∧
      ∀ G : K → K, (∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall G Q a r) →
        (∀ z ∈ Metric.eball a r, HasDerivAt G (f z) z) → G b = c →
          Set.EqOn G F (Metric.eball a r) := by
  sorry

end Disc

/-- `ColemanIntegration:L0/locally-analytic-primitive-nonunique`: locally analytic functions with
zero derivative need not be constant on a disc of `ℂ_p`. -/
theorem exists_locallyConstant_nonconst (p : ℕ) [Fact p.Prime] :
    ∃ g : ℂ_[p] → ℂ_[p], AnalyticOnNhd ℂ_[p] g (Metric.ball 0 1) ∧
      (∀ z ∈ Metric.ball (0 : ℂ_[p]) 1, HasDerivAt g 0 z) ∧
      ¬ ∃ c, Set.EqOn g (fun _ => c) (Metric.ball 0 1) := by
  sorry

/-! ### Annuli and residues (`ColemanIntegration:L0/annulus-residue`) -/

section Annulus

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- Local prototype of the coefficient space of Laurent series convergent on the annulus
`r < |z| < s` (the carrier is constructed in `PadicHodgeTheory:P7:annulus-foundations`):
two-sided sequences with `‖aₙ‖ ρⁿ → 0` as `|n| → ∞` for every `ρ ∈ (r, s)`. A differential
`f dz` is recorded by the coefficients of `f`. -/
def annulusLaurent (r s : ℝ) : Submodule K (ℤ → K) where
  carrier := {a | ∀ ρ : ℝ, r < ρ → ρ < s → Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

variable {K}

/-- The residue `a₋₁` of `f dz`. -/
def annulusResidue (r s : ℝ) : annulusLaurent K r s →ₗ[K] K :=
  (LinearMap.proj (-1 : ℤ)).comp (Submodule.subtype _)

/-- The derivative `d/dz` on coefficient sequences: `(n+1) aₙ₊₁`. -/
def annulusDeriv (r s : ℝ) : annulusLaurent K r s →ₗ[K] annulusLaurent K r s where
  toFun a := ⟨fun n => ((n : K) + 1) * a.1 (n + 1), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- The monomial `zᵐ` (or `zᵐ dz`) as an element of the coefficient space. -/
def annulusMonomial (r s : ℝ) (m : ℤ) : annulusLaurent K r s :=
  ⟨Pi.single m 1, by sorry⟩

@[simp] theorem annulusResidue_d (r s : ℝ) (g : annulusLaurent K r s) :
    annulusResidue r s (annulusDeriv r s g) = 0 := by
  sorry

@[simp] theorem annulusResidue_dz_div (r s : ℝ) (m : ℤ) :
    annulusResidue r s (annulusMonomial r s m) = if m = -1 then (1 : K) else 0 := by
  sorry

/-- Rescaling `t = u z` with `‖u‖ = 1`: `∑ aₙ zⁿ dz = ∑ aₙ u⁻ⁿ⁻¹ tⁿ dt`. -/
def annulusScale (r s : ℝ) (u : K) (hu : ‖u‖ = 1) : annulusLaurent K r s →ₗ[K] annulusLaurent K r s where
  toFun a := ⟨fun n => a.1 n * u ^ (-n - 1), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- `annulusResidue_coord`, in the case of the rescalings `t = u z`, `‖u‖ = 1`; the general
orientation-preserving coordinate change needs composition of Laurent series
(PadicHodgeTheory:P7:annulus-foundations). -/
theorem annulusResidue_coord (r s : ℝ) (u : K) (hu : ‖u‖ = 1) (ω : annulusLaurent K r s) :
    annulusResidue r s (annulusScale r s u hu ω) = annulusResidue r s ω := by
  sorry

/-- Pullback along `z = 1/t`: `∑ aₙ zⁿ dz = -∑ aₙ t^(-n-2) dt`. -/
def annulusInvPullback (r s : ℝ) (hr : 0 < r) :
    annulusLaurent K r s →ₗ[K] annulusLaurent K s⁻¹ r⁻¹ where
  toFun a := ⟨fun m => - a.1 (-m - 2), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

theorem annulusResidue_inv (r s : ℝ) (hr : 0 < r) (ω : annulusLaurent K r s) :
    annulusResidue s⁻¹ r⁻¹ (annulusInvPullback r s hr ω) = - annulusResidue r s ω := by
  sorry

theorem annulusResidue_restrict {r s r' s' : ℝ} (h1 : r ≤ r') (h2 : r' < s') (h3 : s' ≤ s)
    (ω : annulusLaurent K r s) :
    ∃ h : ω.1 ∈ annulusLaurent K r' s',
      annulusResidue r' s' ⟨ω.1, h⟩ = annulusResidue r s ω := by
  sorry

theorem annulusResidue_laurentSeries {s : ℝ} (L : LaurentSeries K) (ω : annulusLaurent K 0 s)
    (hω : ∀ n, (ω : ℤ → K) n = L.coeff n) : annulusResidue 0 s ω = L.coeff (-1) := by
  sorry

/-- Test `annulusResidue_dz_div_z` (computation). -/
example (r s : ℝ) :
    annulusResidue r s (annulusMonomial (K := K) r s (-1)) = (1 : K) ∧
      annulusResidue r s (annulusMonomial (K := K) r s 2) = (0 : K) := by sorry

/-- Test `annulusResidue_inv_sign` (compatibility). -/
example (r s : ℝ) (hr : 0 < r) :
    annulusResidue s⁻¹ r⁻¹ (annulusInvPullback r s hr (annulusMonomial (K := K) r s (-1))) = (-1 : K) := by
  sorry

/-- Test `annulusResidue_zero` (degenerate). -/
example (r s : ℝ) : annulusResidue r s (0 : annulusLaurent K r s) = (0 : K) := by sorry

/-- Test `annulusResidue_pole_outside` (non-example): `dz/(z - c)` with `‖c‖ ≥ s` has the expansion
`-∑_{n ≥ 0} zⁿ / cⁿ⁺¹` on the annulus and residue `0`. -/
example (r s : ℝ) (c : K) (hc : s ≤ ‖c‖) (hs : 0 < s) :
    ∃ h : (fun n : ℤ => if 0 ≤ n then -(c ^ (n + 1))⁻¹ else 0) ∈ annulusLaurent K r s,
      annulusResidue r s ⟨_, h⟩ = (0 : K) := by sorry

/-- `ColemanIntegration:L0/annulus-exact-iff-residue-zero`. -/
theorem exists_annulusDeriv_eq_iff [CharZero K] [CompleteSpace K] (r s : ℝ) (hrs : r < s)
    (ω : annulusLaurent K r s) :
    (∃ g, annulusDeriv r s g = ω) ↔ annulusResidue r s ω = 0 := by
  sorry

theorem annulusDeriv_eq_zero_iff [CharZero K] (r s : ℝ) (hrs : r < s) (g : annulusLaurent K r s) :
    annulusDeriv r s g = 0 ↔ ∀ n : ℤ, n ≠ 0 → (g : ℤ → K) n = 0 := by
  sorry

end Annulus

/-! ### The logarithm series (`ColemanIntegration:L0/log-one-add-convergence`,
`ColemanIntegration:L0/log-one-add-mul`) -/

section LogSeries

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]

theorem one_le_radius_logOneAddSeries_of_ultrametric :
    1 ≤ (NormedSpace.logOneAddSeries K K).radius := by
  sorry

theorem hasFPowerSeriesOnBall_logOneAdd_of_ultrametric [CompleteSpace K] :
    HasFPowerSeriesOnBall (NormedSpace.logOneAdd K K) (NormedSpace.logOneAddSeries K K) 0 1 := by
  sorry

theorem hasDerivAt_logOneAdd_of_ultrametric [CompleteSpace K] {u : K} (hu : ‖u‖ < 1) :
    HasDerivAt (NormedSpace.logOneAdd K K) (1 + u)⁻¹ u := by
  sorry

theorem logOneAdd_add_mul_of_ultrametric [CompleteSpace K] {u v : K} (hu : ‖u‖ < 1) (hv : ‖v‖ < 1) :
    NormedSpace.logOneAdd K K (u + v + u * v) =
      NormedSpace.logOneAdd K K u + NormedSpace.logOneAdd K K v := by
  sorry

theorem logOneAdd_rootOfUnity [CompleteSpace K] {ζ : K} {m : ℕ} (hm : 0 < m) (hζ : ζ ^ m = 1)
    (hζ1 : ‖ζ - 1‖ < 1) : NormedSpace.logOneAdd K K (ζ - 1) = 0 := by
  sorry

end LogSeries

/-! ### Branches of the logarithm on `ℂ_p` -/

section Branch

variable (p : ℕ) [Fact p.Prime]

/-- `ColemanIntegration:L0/cp-unit-power-principal`: the value group of `ℂ_p` is `p^ℚ`. -/
theorem exists_norm_eq_rpow (x : ℂ_[p]) (hx : x ≠ 0) :
    ∃ q : ℚ, ‖x‖ = (p : ℝ) ^ (-(q : ℝ)) := by
  sorry

/-- `ColemanIntegration:L0/cp-unit-power-principal`. -/
theorem exists_pow_mul_zpow_mem_principal (x : ℂ_[p]) (hx : x ≠ 0) :
    ∃ N : ℕ, 0 < N ∧ ∃ m : ℤ, ‖x ^ N * (p : ℂ_[p]) ^ (-m) - 1‖ < 1 := by
  sorry

open Classical in
/-- The valuation `v_p(x) = -log_p ‖x‖ ∈ ℚ` on `ℂ_p` (junk value `0` at `0`). -/
def padicValC (x : ℂ_[p]) : ℚ :=
  if hx : x = 0 then 0 else Classical.choose (exists_norm_eq_rpow p x hx)

open Classical in
/-- `ColemanIntegration:L0/log-branch`: the branch `log_a` with `log_a(p) = a`, defined by
`log_a(x) = (log(x^N p^(-m)) + m a)/N` (junk value `0` at `0`). -/
def padicLogBranch (a : ℂ_[p]) (x : ℂ_[p]) : ℂ_[p] :=
  if hx : x = 0 then 0 else
    let h := exists_pow_mul_zpow_mem_principal p x hx
    let N := Classical.choose h
    let m := Classical.choose (Classical.choose_spec h).2
    ((N : ℂ_[p]))⁻¹ *
      (NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (x ^ N * (p : ℂ_[p]) ^ (-m) - 1) + (m : ℂ_[p]) * a)

variable {p}

@[simp] theorem padicLogBranch_mul (a : ℂ_[p]) {x y : ℂ_[p]} (hx : x ≠ 0) (hy : y ≠ 0) :
    padicLogBranch p a (x * y) = padicLogBranch p a x + padicLogBranch p a y := by
  sorry

@[simp] theorem padicLogBranch_p (a : ℂ_[p]) : padicLogBranch p a p = a := by
  sorry

theorem padicLogBranch_one_add (a : ℂ_[p]) {u : ℂ_[p]} (hu : ‖u‖ < 1) :
    padicLogBranch p a (1 + u) = NormedSpace.logOneAdd ℂ_[p] ℂ_[p] u := by
  sorry

@[simp] theorem padicLogBranch_pow (a : ℂ_[p]) (x : ℂ_[p]) (n : ℕ) :
    padicLogBranch p a (x ^ n) = n * padicLogBranch p a x := by
  sorry

theorem padicLogBranch_rootOfUnity (a : ℂ_[p]) {ζ : ℂ_[p]} {m : ℕ} (hm : 0 < m) (hζ : ζ ^ m = 1) :
    padicLogBranch p a ζ = 0 := by
  sorry

theorem padicLogBranch_unique (a : ℂ_[p]) (h : ℂ_[p] → ℂ_[p])
    (hmul : ∀ x y, x ≠ 0 → y ≠ 0 → h (x * y) = h x + h y)
    (hser : ∀ u : ℂ_[p], ‖u‖ < 1 → h (1 + u) = NormedSpace.logOneAdd ℂ_[p] ℂ_[p] u)
    (hp : h p = a) : ∀ x, x ≠ 0 → h x = padicLogBranch p a x := by
  sorry

/-- `ColemanIntegration:L0/log-branch-change`. -/
theorem padicLogBranch_sub (a b : ℂ_[p]) {x : ℂ_[p]} (hx : x ≠ 0) :
    padicLogBranch p b x - padicLogBranch p a x = (b - a) * (padicValC p x : ℂ_[p]) := by
  sorry

/-- `ColemanIntegration:L0/log-branch-local-expansion`. -/
theorem padicLogBranch_local (a : ℂ_[p]) {x₀ z : ℂ_[p]} (hx₀ : x₀ ≠ 0) (hz : ‖z - x₀‖ < ‖x₀‖) :
    padicLogBranch p a z =
      padicLogBranch p a x₀ + NormedSpace.logOneAdd ℂ_[p] ℂ_[p] ((z - x₀) / x₀) := by
  sorry

theorem padicLogBranch_hasDerivAt (a : ℂ_[p]) {x : ℂ_[p]} (hx : x ≠ 0) :
    HasDerivAt (padicLogBranch p a) x⁻¹ x := by
  sorry

/-- `ColemanIntegration:L0/log-branch-field-compatibility` (a). -/
theorem padicLogBranch_map (a : ℂ_[p]) (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ) (x : ℂ_[p]) :
    padicLogBranch p (σ a) (σ x) = σ (padicLogBranch p a x) := by
  sorry

/-- `ColemanIntegration:L0/log-branch-field-compatibility` (b). -/
theorem padicLogBranch_mem_of_finite (L : IntermediateField ℚ_[p] ℂ_[p])
    [FiniteDimensional ℚ_[p] L] {a x : ℂ_[p]} (ha : a ∈ L) (hx : x ∈ L) :
    padicLogBranch p a x ∈ L := by
  sorry

/-- Test `padicLogBranch_p_eq` (degenerate). -/
example (a : ℂ_[p]) : padicLogBranch p a p = a ∧ padicLogBranch p a 1 = 0 := by sorry

/-- Test `padicLogBranch_four_three` (computation): `log_a 4 = log(1 + 3)` in `ℂ_3`, which is
`3 + 2·3² + 3³ + 2·3⁵ + 2·3⁶ + 3⁸ + 2·3¹⁰ + 3¹¹ mod 3¹²` (PARI/GP). -/
example [Fact (Nat.Prime 3)] (a : ℂ_[3]) :
    padicLogBranch 3 a 4 = NormedSpace.logOneAdd ℂ_[3] ℂ_[3] 3 := by sorry

/-- Test `padicLogBranch_teichmuller` (computation). -/
example [Fact (Nat.Prime 5)] (a ζ : ℂ_[5]) (hζ : ζ ^ 4 = 1) :
    padicLogBranch 5 a ζ = 0 ∧ padicLogBranch 5 a (-2) = padicLogBranch 5 a 16 / 4 := by sorry

/-- Test `padicLogBranch_eq_logOneAdd` (compatibility). -/
example (a : ℂ_[p]) : Set.EqOn (fun u => padicLogBranch p a (1 + u))
    (NormedSpace.logOneAdd ℂ_[p] ℂ_[p]) (Metric.ball 0 1) := by sorry

/-- Test `padicLogBranch_not_series` (non-example). -/
example : ¬ Summable (fun n : ℕ => ((-1 : ℂ_[p]) ^ (n + 1) / n) * ((p : ℂ_[p]) - 1) ^ n) := by
  sorry

variable (p) in
/-- `ColemanIntegration:L0/iwasawa-logarithm`: the Iwasawa branch `log_p = log_0`. -/
def iwasawaLog : ℂ_[p] → ℂ_[p] := padicLogBranch p 0

@[simp] theorem iwasawaLog_p : iwasawaLog p p = 0 := by sorry

theorem padicLogBranch_eq_iwasawaLog_add (a : ℂ_[p]) {x : ℂ_[p]} (hx : x ≠ 0) :
    padicLogBranch p a x = iwasawaLog p x + a * (padicValC p x : ℂ_[p]) := by
  sorry

theorem iwasawaLog_map (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ) (x : ℂ_[p]) :
    iwasawaLog p (σ x) = σ (iwasawaLog p x) := by
  sorry

theorem iwasawaLog_mem_of_finite (L : IntermediateField ℚ_[p] ℂ_[p]) [FiniteDimensional ℚ_[p] L]
    {x : ℂ_[p]} (hx : x ∈ L) : iwasawaLog p x ∈ L := by
  sorry

@[simp] theorem iwasawaLog_of_unit (a : ℂ_[p]) {x : ℂ_[p]} (hx : ‖x‖ = 1) :
    iwasawaLog p x = padicLogBranch p a x := by
  sorry

/-- Test `iwasawaLog_p_pow` (degenerate). -/
example (k : ℕ) : iwasawaLog p ((p : ℂ_[p]) ^ k) = 0 := by sorry

/-- Test `iwasawaLog_sixtyThree` (computation). -/
example [Fact (Nat.Prime 3)] : iwasawaLog 3 63 = iwasawaLog 3 7 := by sorry

/-- Test `iwasawaLog_galois` (characterisation). -/
example (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ) (x : ℂ_[p]) :
    iwasawaLog p (σ x) = σ (iwasawaLog p x) := by sorry

/-- Test `iwasawaLog_ne_branch_one` (non-example). -/
example : padicLogBranch p 1 p ≠ iwasawaLog p p := by sorry

end Branch

/-! ### Logarithmic rings on annuli (`ColemanIntegration:L0/annulus-log-ring`) -/

section AnnulusLog

variable (p : ℕ) [Fact p.Prime]

/-- The points `r < ‖z‖ < s` of `ℂ_p`. -/
def annulusSet (r s : ℝ) : Set ℂ_[p] := {z | r < ‖z‖ ∧ ‖z‖ < s}

/-- Local prototype of `O(A(0; r, s))` as functions (the ring is constructed in
`PadicHodgeTheory:P7:annulus-foundations`): functions on the annulus given by a Laurent series. -/
def annulusFunctions (r s : ℝ) : Subalgebra ℂ_[p] (annulusSet p r s → ℂ_[p]) where
  carrier := {f | ∃ a ∈ annulusLaurent ℂ_[p] r s,
    ∀ z : annulusSet p r s, HasSum (fun n : ℤ => a n * (z : ℂ_[p]) ^ n) (f z)}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

/-- The logarithmic function ring `O(A)[l]`. -/
abbrev AnnulusLogRing (r s : ℝ) := Polynomial (annulusFunctions p r s)

/-- The realisation `l ↦ log_a z`. -/
def AnnulusLogRing.realize (r s : ℝ) (a : ℂ_[p]) :
    AnnulusLogRing p r s →+* (annulusSet p r s → ℂ_[p]) :=
  Polynomial.eval₂RingHom (annulusFunctions p r s).val.toRingHom
    (fun z => padicLogBranch p a (z : ℂ_[p]))

/-- The derivation on `O(A)[l]`: `d(∑ fₖ lᵏ) = ∑ (∂fₖ) lᵏ + ∑ k fₖ z⁻¹ lᵏ⁻¹`, given the derivation
`∂ = d/dz` on `O(A)`; stated for an abstract commutative algebra `O` with a derivation and the
element `w = 1/z`. -/
def logRingDeriv {O : Type*} [CommRing O] [Algebra ℚ O] (D : Derivation ℚ O O) (w : O) :
    Polynomial O →ₗ[ℚ] Polynomial O where
  toFun f := f.sum fun n c => Polynomial.C (D c) * Polynomial.X ^ n +
    Polynomial.C ((n : O) * c * w) * Polynomial.X ^ (n - 1)
  map_add' := by sorry
  map_smul' := by sorry

theorem AnnulusLogRing.d_ell_pow {O : Type*} [CommRing O] [Algebra ℚ O] (D : Derivation ℚ O O)
    (w : O) (k : ℕ) :
    logRingDeriv D w (Polynomial.X ^ k) = Polynomial.C ((k : O) * w) * Polynomial.X ^ (k - 1) := by
  sorry

/-- `AnnulusLogRing.realize_injective`, i.e. `ColemanIntegration:L0/annulus-log-transcendence`. -/
theorem AnnulusLogRing.realize_injective (r s : ℝ) (hrs : r < s) (a : ℂ_[p]) :
    Function.Injective (AnnulusLogRing.realize p r s a) := by
  sorry

-- AnnulusLogRing.realize_d: not stated; needs the derivative on the Laurent function ring
-- of PadicHodgeTheory:P7:annulus-foundations as a derivation of annulusFunctions.
-- AnnulusLogRing.changeParam: not stated; needs composition of Laurent series with
-- automorphisms of the annulus (PadicHodgeTheory:P7:annulus-foundations).

theorem AnnulusLogRing.realize_branch (r s : ℝ) (a b : ℂ_[p]) (F : AnnulusLogRing p r s)
    (z : annulusSet p r s) :
    AnnulusLogRing.realize p r s b F z =
      F.eval₂ ((Pi.evalRingHom (fun _ : annulusSet p r s => ℂ_[p]) z).comp
          (annulusFunctions p r s).val.toRingHom)
        (padicLogBranch p a z + (b - a) * (padicValC p z : ℂ_[p])) := by
  sorry

-- AnnulusLogRing.restrict: not stated; needs restriction maps between the Laurent function
-- rings of nested annuli (PadicHodgeTheory:P7:annulus-foundations).

/-- Test `AnnulusLogRing.d_ell` (computation). -/
example (r s : ℝ) (hr : r < (p : ℝ)⁻¹) (hs : (p : ℝ)⁻¹ < s) (a : ℂ_[p]) :
    AnnulusLogRing.realize p r s a Polynomial.X ⟨(p : ℂ_[p]), by sorry⟩ = a := by sorry

/-- Test `AnnulusLogRing.realize_const` (degenerate). -/
example (r s : ℝ) (a : ℂ_[p]) (f : annulusFunctions p r s) :
    AnnulusLogRing.realize p r s a (Polynomial.C f) = f := by sorry

/-- Test `AnnulusLogRing.ell_not_mem` (non-example). -/
example (r s : ℝ) (hrs : r < s) (a : ℂ_[p]) :
    ¬ ∃ f : annulusFunctions p r s,
      (f : annulusSet p r s → ℂ_[p]) = fun z : annulusSet p r s => padicLogBranch p a z := by
  sorry

/-- Test `AnnulusLogRing.realize_branch_diff` (compatibility). -/
example (a b : ℂ_[p]) (z : annulusSet p ((p : ℝ) ^ (-2 : ℤ)) 1) :
    AnnulusLogRing.realize p _ _ b Polynomial.X z - AnnulusLogRing.realize p _ _ a Polynomial.X z =
      (b - a) * (padicValC p z : ℂ_[p]) := by sorry

/-- `ColemanIntegration:L0/annulus-log-primitive`: the derivation of `O(A)[l]` is surjective with
kernel `ℚ` (stated for the abstract model with `∂` surjective up to residues). -/
theorem logRingDeriv_surjective_of_residue {O : Type*} [CommRing O] [Algebra ℚ O]
    (D : Derivation ℚ O O) (w : O) (res : O →ₗ[ℚ] ℚ)
    (hres : ∀ f, ∃ g : O, f = D g + algebraMap ℚ O (res f) * w) :
    Function.Surjective (logRingDeriv D w) := by
  sorry

/-- `ColemanIntegration:L0/annulus-branch-change`, for the primitive `l` of `dz/z`. -/
theorem annulus_branch_change_ell (a b : ℂ_[p]) (r s : ℝ) (z : annulusSet p r s) :
    padicLogBranch p b z - padicLogBranch p a z = (b - a) * (padicValC p z : ℂ_[p]) := by
  sorry

end AnnulusLog

/-! ## Layer L1: Frobenius continuation -/

/-! ### Good-reduction pairs and wide opens (general curves) -/

section GoodReduction

open AlgebraicGeometry CategoryTheory

universe u

/-- `ColemanIntegration:L1/good-reduction-pair`: a smooth proper curve `X` over `R = O_K` with a
closed subscheme `D` that is finite etale over `R`. Geometric connectedness of the fibres and
nonemptiness of `D` are further hypotheses of the layer (not encoded: the pinned Mathlib has no
geometric connectedness of fibres). -/
structure GoodReductionPair (R : Type u) [CommRing R] where
  /-- the curve -/
  X : Scheme.{u}
  /-- its structure morphism -/
  toBase : X ⟶ Spec (CommRingCat.of R)
  smooth : SmoothOfRelativeDimension 1 toBase
  proper : IsProper toBase
  /-- the divisor removed -/
  D : Scheme.{u}
  /-- its closed immersion -/
  ι : D ⟶ X
  closedImmersion : IsClosedImmersion ι
  finite : IsFinite (ι ≫ toBase)
  etale : Etale (ι ≫ toBase)

-- GoodReductionPair.affineComplement: not stated; needs the scheme X - D with IsAffine, which
-- uses the relative ampleness of D (not in the pinned libraries).
-- GoodReductionPair.residueClasses: not stated; needs the special fibre X_k and its F_p-bar points.
-- GoodReductionPair.frobenius: not stated; needs X_k(F_p-bar) with its q-power Frobenius.
-- GoodReductionPair.baseChange: not stated; needs base change of the pair along O_K -> O_K'
-- (pullbacks of schemes with the stability of the four morphism properties).
-- GoodReductionPair.puncturedLine: not stated; needs P^1 over Z_p[mu_N] as a scheme with its
-- sections 0, infinity, mu_N (see the tube prototype `puncturedTube` below).
-- GoodReductionPair.D_reduction_injective: not stated; needs the special fibre points of D.
-- goodReductionPair_thricePunctured: not stated; needs P^1 as a scheme with its three sections.
-- goodReductionPair_collision: not stated; needs P^1 over Z_p and the closed subscheme V(z(z - p)).
-- goodReductionPair_mu_p: not stated; needs P^1 over Z_p[mu_p].
-- goodReductionPair_affineLine: not stated; needs P^1 over Z_p with the section infinity.

-- wideOpen, daggerAlgebra, daggerDifferentials, mem_tube_iff, wideOpen_anti, wideOpen_param_indep,
-- daggerAlgebra_eq_weakCompletion, daggerAlgebra_restrict, daggerAlgebra_identity: not stated;
-- need rigid generic fibres and residue discs (AdicSpacesPartII:R2) and dagger algebras of strict
-- neighbourhoods (AdicSpacesPartII:F1). The tube and dagger algebra of the punctured line are
-- prototyped below (`puncturedTube`, `puncturedDagger`).
-- wideOpen_thricePunctured, wideOpen_affineLine, tube_not_wideOpen: not stated; same reason
-- (for the affine line the contrast is `not_isRestricted_primitive_closedDisc` versus
-- `isRestricted_primitive_of_overconvergent`).

-- `ColemanIntegration:L1/residue-disc-parametrisation`: not stated; needs residue discs of the
-- generic fibre (AdicSpacesPartII:R2).

-- LocAn, LocAn.d, LocAn.ker_d, LocAn.d_surjective, LocAn.ofDagger, LocAn.eval, LocAn.iotaBranch,
-- LocAn.paramIndep, LocAn.ker_d_eq, LocAn.log_element, LocAn.affineLine, LocAn.iota_on_disc:
-- not stated for general pairs; need residue discs and end germs (AdicSpacesPartII:R2,
-- PadicHodgeTheory:P7:annulus-foundations). The tube part for the punctured line is
-- `puncturedLocAn` below.

end GoodReduction

/-! ### Frobenius lifts (`ColemanIntegration:L1/frobenius-lift`) -/

section Frobenius

/-- A Frobenius lift on an integral algebra `S` over `R = O_K` with uniformiser `π`: an
`R`-algebra endomorphism that is an arithmetic Frobenius at `π S` (Mathlib's
`AlgHom.IsArithFrobAt`). For the dagger algebra, `S` is the integral weak completion
(AdicSpacesPartII:F1). -/
structure FrobeniusLift (R S : Type*) [CommRing R] [CommRing S] [Algebra R S] (π : R) where
  /-- the lift -/
  toAlgHom : S →ₐ[R] S
  isArithFrobAt : toAlgHom.IsArithFrobAt (Ideal.span {algebraMap R S π})

/-- `FrobeniusLift.close`: two Frobenius lifts agree modulo `π`. -/
theorem FrobeniusLift.close {R S : Type*} [CommRing R] [CommRing S] [Algebra R S] {π : R}
    (φ φ' : FrobeniusLift R S π) (x : S) :
    φ.toAlgHom x - φ'.toAlgHom x ∈ Ideal.span {algebraMap R S π} := by
  sorry

-- FrobeniusLift.mapsTo, FrobeniusLift.pullback, FrobeniusLift.pullback_ell: not stated; need
-- residue discs and the algebra of locally analytic functions (AdicSpacesPartII:R2).
-- FrobeniusLift.pow: not stated in this form: the q^m-power Frobenius is not
-- `AlgHom.IsArithFrobAt` at the same ideal (the exponent there is #(R/(pi))); it is the
-- statement `(φ^m x - x^(q^m)) ∈ (π)`.
-- FrobeniusLift.exists: not stated; needs weak completions (AdicSpacesPartII:F1) and the lifting
-- theorem requested from PadicDifferentialEquationsAndRigidCohomology:RD.0.

/-- Test `frobeniusLift_zpow` (computation), on the affine line `Z_p[z]`: `z ↦ z^p` lifts Frobenius
(on `P^1 - {0, 1, ∞}` the same map needs the weak completion). -/
example (p : ℕ) [Fact p.Prime] :
    (Polynomial.aeval (R := ℤ_[p]) (Polynomial.X ^ p : Polynomial ℤ_[p])).IsArithFrobAt
      (Ideal.span {algebraMap ℤ_[p] (Polynomial ℤ_[p]) p}) := by sorry

/-- Test `frobeniusLift_twisted` (compatibility): `z ↦ z^p + p z` is another lift of the same
Frobenius. -/
example (p : ℕ) [Fact p.Prime] :
    (Polynomial.aeval (R := ℤ_[p])
      (Polynomial.X ^ p + Polynomial.C (p : ℤ_[p]) * Polynomial.X : Polynomial ℤ_[p])).IsArithFrobAt
      (Ideal.span {algebraMap ℤ_[p] (Polynomial ℤ_[p]) p}) := by sorry

/-- Test `frobeniusLift_not_scaling` (non-example). -/
example (p : ℕ) [Fact p.Prime] :
    ¬ (Polynomial.aeval (R := ℤ_[p])
      (Polynomial.C (p : ℤ_[p]) * Polynomial.X : Polynomial ℤ_[p])).IsArithFrobAt
      (Ideal.span {algebraMap ℤ_[p] (Polynomial ℤ_[p]) p}) := by sorry

/-- Test `frobeniusLift_fixed_points` (characterisation): the points of the tube of
`P^1 - {0, 1, ∞}` fixed by `(z ↦ z^p)^m` are the roots of unity of order dividing `p^m - 1`,
other than `1`. -/
example (p : ℕ) [Fact p.Prime] (m : ℕ) (hm : 0 < m) (z : ℂ_[p]) (hz : ‖z‖ = 1) (hz1 : ‖z - 1‖ = 1) :
    z ^ (p ^ m) = z ↔ z ^ (p ^ m - 1) = 1 := by sorry

/-- `ColemanIntegration:L1/teichmuller-point`, for the punctured line and `φ(z) = z^p`: every unit of
`ℂ_p` is congruent to a unique root of unity of order prime to `p`. -/
theorem existsUnique_teichmuller (p : ℕ) [Fact p.Prime] (x : ℂ_[p]) (hx : ‖x‖ = 1) :
    ∃! ζ : ℂ_[p], ‖ζ - x‖ < 1 ∧ ∃ m : ℕ, 0 < m ∧ ζ ^ (p ^ m) = ζ := by
  sorry

end Frobenius

/-! ### Frobenius-structured data (`ColemanIntegration:L1/frobenius-h1-datum`) -/

section Datum

/-- The data of `ColemanIntegration:L1/frobenius-h1-datum` over an abstract dagger algebra `A` with
differentials `Ω`: a Frobenius `φ` with its action on `Ω`, forms `ω`, the matrix `M` and the
functions `g` with `φ^* ω = M ω + d g`. The hypotheses (H0), (H1), (Hw) are the `Prop`-valued
definitions below. -/
structure FrobeniusDatum (K A Ω : Type*) [Field K] [CommRing A] [Algebra K A] [AddCommGroup Ω]
    [Module A Ω] [Module K Ω] [IsScalarTower K A Ω] (r : ℕ) where
  /-- the exterior derivative -/
  d : Derivation K A Ω
  /-- the Frobenius lift -/
  φ : A →ₐ[K] A
  /-- its action on differentials -/
  φΩ : Ω →+ Ω
  φΩ_d : ∀ a, φΩ (d a) = d (φ a)
  φΩ_smul : ∀ (a : A) (w : Ω), φΩ (a • w) = φ a • φΩ w
  /-- the forms -/
  ω : Fin r → Ω
  /-- the Frobenius matrix -/
  M : Matrix (Fin r) (Fin r) K
  /-- the correction functions -/
  g : Fin r → A
  frobenius_eq : ∀ i, φΩ (ω i) = ∑ j, M i j • ω j + d (g i)

namespace FrobeniusDatum

variable {K A Ω : Type*} [Field K] [CommRing A] [Algebra K A] [AddCommGroup Ω] [Module A Ω]
  [Module K Ω] [IsScalarTower K A Ω] {r : ℕ} (𝔇 : FrobeniusDatum K A Ω r)

/-- (H0): the kernel of `d` is `K`. -/
def H0 : Prop := ∀ a : A, 𝔇.d a = 0 → a ∈ Set.range (algebraMap K A)

/-- (H1): the classes of the `ω i` form a basis of `Ω / dA`. -/
def H1 : Prop := ∀ η : Ω, ∃! c : Fin r → K, ∃ h : A, η = 𝔇.d h + ∑ i, c i • 𝔇.ω i

/-- (Hw): no product of `n ≥ 1` eigenvalues of `M` is a root of unity. -/
def Hw : Prop :=
  ∀ (n m : ℕ), 0 < n → 0 < m → ∀ μ : Fin n → AlgebraicClosure K,
    (∀ i, (𝔇.M.charpoly.map (algebraMap K (AlgebraicClosure K))).IsRoot (μ i)) → (∏ i, μ i) ^ m ≠ 1

/-- `FrobeniusDatum.coords`: the H^1 coordinates of a form, under (H1). -/
def coords (h1 : 𝔇.H1) (η : Ω) : Fin r → K := Classical.choose (h1 η).exists

theorem coords_frobenius (h1 : 𝔇.H1) (η : Ω) :
    𝔇.coords h1 (𝔇.φΩ η) = (𝔇.M.transpose).mulVec (𝔇.coords h1 η) := by
  sorry

-- FrobeniusDatum.frobenius_eq: the structure field above.
-- FrobeniusDatum.changeBasis: not stated separately; it is the datum with ω replaced by
-- `fun i => ∑ j, P i j • ω j` and M by `P * M * P⁻¹` (bookkeeping, to be added with the API).
-- FrobeniusDatum.pow: not stated; needs iterates of φ on Ω (bookkeeping).

theorem noRootOfUnity : 𝔇.Hw ↔ ∀ (n m : ℕ), 0 < n → 0 < m → ∀ μ : Fin n → AlgebraicClosure K,
    (∀ i, (𝔇.M.charpoly.map (algebraMap K (AlgebraicClosure K))).IsRoot (μ i)) →
      (∏ i, μ i) ^ m ≠ 1 := Iff.rfl

end FrobeniusDatum

-- frobeniusDatum_thricePunctured: see `puncturedLine_frobenius_polynomial` and
-- `puncturedLine_frobenius_logDeriv` below; the datum itself needs the dagger algebra of
-- `P^1 - {0, 1, ∞}` (AdicSpacesPartII:F1).
-- frobeniusDatum_identity_fails: not stated; needs A+(G_m) (AdicSpacesPartII:F1).
-- frobeniusDatum_affineLine: not stated; needs A+(A^1) (AdicSpacesPartII:F1).
-- frobeniusDatum_changeBasis: not stated; needs FrobeniusDatum.changeBasis.

/-- `ColemanIntegration:L1/weil-weight-no-root-of-unity`. -/
theorem weil_weight_product_ne_one {q : ℕ} (hq : 1 < q) {n m : ℕ} (hm : 0 < m) (hn : 0 < n)
    (ev : Fin n → ℂ) (w : Fin n → ℕ) (hw : ∀ i, 1 ≤ w i)
    (habs : ∀ i, ‖ev i‖ = (q : ℝ) ^ ((w i : ℝ) / 2)) : (∏ i, ev i) ^ m ≠ 1 := by
  sorry

-- `ColemanIntegration:L1/good-reduction-datum-exists`: not stated; needs good-reduction pairs with
-- their dagger algebras and rigid cohomology (AdicSpacesPartII:F1, PadicDifferentialEquations-
-- AndRigidCohomology:RD.0, RD.4, RD.5, RD.6).

end Datum

/-! ### Dwork's principle (`ColemanIntegration:L1/frobenius-orbit-linear-algebra`,
`ColemanIntegration:L1/dwork-principle`) -/

section Dwork

/-- `ColemanIntegration:L1/frobenius-orbit-linear-algebra`: Frobenius equations for functions on a
set with a bijection with finite orbits. -/
theorem existsUnique_frobenius_orbit_solution {S : Type*} (F : S ≃ S)
    (hF : ∀ s, ∃ m, 0 < m ∧ F^[m] s = s) {L V : Type*} [Field L] [AddCommGroup V] [Module L V]
    [FiniteDimensional L V] (T : V →ₗ[L] V)
    (hT : ∀ m : ℕ, 0 < m → ∀ v, (T ^ m) v = v → v = 0) (e : S → V) :
    ∃! c : S → V, ∀ s, c (F s) = T (c s) + e s := by
  sorry

/-- `ColemanIntegration:L1/dwork-principle` (a), on locally constant functions (functions on the set
of residue classes): a solution of the homogeneous equation up to a constant is constant. -/
theorem dwork_uniqueness {S : Type*} (F : S ≃ S) (hF : ∀ s, ∃ m, 0 < m ∧ F^[m] s = s)
    {L V : Type*} [Field L] [AddCommGroup V] [Module L V] [FiniteDimensional L V] (T : V →ₗ[L] V)
    (hT : ∀ m : ℕ, 0 < m → ∀ v, (T ^ m) v = v → v = 0) (c : S → V) (C : V)
    (hc : ∀ s, c (F s) - T (c s) = C) : ∃ v : V, ∀ s, c s = v := by
  sorry

-- The statement of `ColemanIntegration:L1/dwork-principle` on A_loc (with dG = 0) is not stated;
-- it needs the algebra of locally analytic functions of a good-reduction pair (AdicSpacesPartII:R2).
-- For the punctured line it is the `frob` clause of `IsColemanFamily` below.

end Dwork

/-! ### The unipotent word algebra (`ColemanIntegration:L1/word-algebra`) -/

section Words

/-- The shuffle of two words. -/
def shuffle {α : Type*} : List α → List α → List (List α)
  | [], v => [v]
  | u, [] => [u]
  | a :: u, b :: v => (shuffle u (b :: v)).map (a :: ·) ++ (shuffle (a :: u) v).map (b :: ·)
termination_by u v => u.length + v.length

/-- Local prototype of the unipotent word algebra `U(A; ω)`: the free `A`-module on words in
`Fin r`, with the shuffle product (instances below). -/
def WordAlgebra (A : Type*) [CommRing A] (r : ℕ) : Type _ := List (Fin r) →₀ A

namespace WordAlgebra

variable {A : Type*} [CommRing A] {r : ℕ}

instance : AddCommGroup (WordAlgebra A r) := inferInstanceAs (AddCommGroup (List (Fin r) →₀ A))
instance : Module A (WordAlgebra A r) := inferInstanceAs (Module A (List (Fin r) →₀ A))

/-- The basis vector `L_w`. -/
def L (w : List (Fin r)) : WordAlgebra A r := Finsupp.single w 1

/-- The shuffle product. -/
instance : Mul (WordAlgebra A r) where
  mul x y := (show List (Fin r) →₀ A from x).sum fun u a =>
    (show List (Fin r) →₀ A from y).sum fun v b =>
      ((shuffle u v).map fun w => (Finsupp.single w (a * b) : List (Fin r) →₀ A)).sum

instance : One (WordAlgebra A r) := ⟨L []⟩

instance : CommRing (WordAlgebra A r) where
  __ := (inferInstance : AddCommGroup (WordAlgebra A r))
  mul_assoc := by sorry
  one_mul := by sorry
  mul_one := by sorry
  left_distrib := by sorry
  right_distrib := by sorry
  zero_mul := by sorry
  mul_zero := by sorry
  mul_comm := by sorry
  natCast n := (n : A) • L []
  natCast_zero := by sorry
  natCast_succ := by sorry
  intCast n := (n : A) • L []
  intCast_ofNat := by sorry
  intCast_negSucc := by sorry
  npow := npowRec
  zsmul := fun n x => (n : A) • x
  zsmul_zero' := by sorry
  zsmul_succ' := by sorry
  zsmul_neg' := by sorry

@[simp] theorem L_mul_L (u v : List (Fin r)) :
    (L u : WordAlgebra A r) * L v = ((shuffle u v).map fun w => (L w : WordAlgebra A r)).sum := by
  sorry

/-- The derivation `D : U → U ⊗ Ω`, with `U ⊗ Ω` realised as `Ω`-valued coefficients on words:
`D(f L_w) = L_w ⊗ df + f L_w' ⊗ ω_i` for `w = i :: w'`. -/
def D {K Ω : Type*} [Field K] [Algebra K A] [AddCommGroup Ω] [Module A Ω] [Module K Ω]
    (d : Derivation K A Ω) (ω : Fin r → Ω) (x : WordAlgebra A r) : List (Fin r) →₀ Ω :=
  (show List (Fin r) →₀ A from x).sum fun w a =>
    Finsupp.single w (d a) + match w with
      | [] => 0
      | i :: w' => Finsupp.single w' (a • ω i)

variable {K Ω : Type*} [Field K] [Algebra K A] [AddCommGroup Ω] [Module A Ω] [Module K Ω]

@[simp] theorem D_L_cons (d : Derivation K A Ω) (ω : Fin r → Ω) (i : Fin r) (w : List (Fin r)) :
    D d ω (L (i :: w) : WordAlgebra A r) = Finsupp.single w (ω i) := by
  sorry

@[simp] theorem D_L_nil (d : Derivation K A Ω) (ω : Fin r → Ω) :
    D d ω (L [] : WordAlgebra A r) = 0 := by
  sorry

/-- `WordAlgebra.D_mul`: `D` is a derivation for the shuffle product (Leibniz rule, with `U`
acting on `Ω`-valued coefficients through the shuffle). -/
theorem D_mul (d : Derivation K A Ω) (ω : Fin r → Ω) (x y : WordAlgebra A r) :
    D d ω (x * y) =
      ((show List (Fin r) →₀ A from x).sum fun u a => (D d ω y).sum fun v η =>
        ((shuffle u v).map fun w => Finsupp.single w (a • η)).sum) +
      ((show List (Fin r) →₀ A from y).sum fun u a => (D d ω x).sum fun v η =>
        ((shuffle u v).map fun w => Finsupp.single w (a • η)).sum) := by
  sorry

/-- `WordAlgebra.depth`: the depth filtration `U_(≤ n)`. -/
def depth (n : ℕ) : Submodule A (WordAlgebra A r) where
  carrier := {x | ∀ w, n < w.length → (show List (Fin r) →₀ A from x) w = 0}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

-- WordAlgebra.map: not stated; base change and linear change of the forms (bookkeeping on
-- coefficients, `Finsupp.mapRange` and `P^(⊗ n)` on words).
-- WordAlgebra.isUnipotent: not stated; needs connections on modules over dagger algebras
-- (Besser's M_B), not in the pinned libraries.

/-- Test `WordAlgebra.shuffle_two` (computation). -/
example (i j : Fin r) :
    (L [i] : WordAlgebra A r) * L [j] = L [i, j] + L [j, i] ∧
      (L [i] : WordAlgebra A r) * L [i] = 2 * L [i, i] := by sorry

/-- Test `WordAlgebra.D_single` (computation). -/
example (d : Derivation K A Ω) (ω : Fin r → Ω) (i : Fin r) :
    D d ω (L [i] : WordAlgebra A r) = Finsupp.single [] (ω i) := by sorry

/-- Test `WordAlgebra.r_zero` (degenerate): for `r = 0` the only word is `[]`. -/
example (x : WordAlgebra A 0) : x = (show List (Fin 0) →₀ A from x) [] • (L [] : WordAlgebra A 0) := by
  sorry

/-- Test `WordAlgebra.concat_not_derivation` (non-example): with concatenation, `L[i] * L[i]` would be
`L[i, i]`, whose `D` is `ω i` at `[i]`, while the Leibniz rule forces `2 ω i`. -/
example (d : Derivation K A Ω) (ω : Fin r → Ω) (i : Fin r) :
    D d ω ((L [i] : WordAlgebra A r) * L [i]) = Finsupp.single [i] ((2 : A) • ω i) := by sorry

/-- `ColemanIntegration:L1/word-algebra-integrability` (a): every `Ω`-valued coefficient family is a
`D`-image, under (H0) and (H1). -/
theorem D_surjective [IsScalarTower K A Ω] (𝔇 : FrobeniusDatum K A Ω r) (h0 : 𝔇.H0)
    (h1 : 𝔇.H1) : Function.Surjective (D 𝔇.d 𝔇.ω : WordAlgebra A r → _) := by
  sorry

/-- `ColemanIntegration:L1/word-algebra-integrability` (b): `ker D = K`. -/
theorem D_eq_zero_iff [IsScalarTower K A Ω] (𝔇 : FrobeniusDatum K A Ω r) (h0 : 𝔇.H0)
    (h1 : 𝔇.H1) (x : WordAlgebra A r) :
    D 𝔇.d 𝔇.ω x = 0 ↔ ∃ c : K, x = (algebraMap K A c) • (L [] : WordAlgebra A r) := by
  sorry

end WordAlgebra

-- localExpansion, localExpansionEnd, localExpansion_D, localExpansion_apply_base, constantTerm,
-- localExpansion_classify, localExpansion_changeBase, localExpansion_log, localExpansion_empty,
-- localExpansion_not_global, constantTerm_analytic: not stated for general pairs; need residue
-- discs and end germs (AdicSpacesPartII:R2, PadicHodgeTheory:P7:annulus-foundations). The
-- tube version for the punctured line is part of `IsColemanFamily` below.

/-- `constantTerm` on the logarithmic ring over formal Laurent series: the constant coefficient of
the `l`-free part (the tangential normalisation at an end, for expansions of algebraic origin). -/
def constantTerm {K : Type*} [Field K] (F : Polynomial (LaurentSeries K)) : K :=
  (F.coeff 0).coeff 0

/-- Test `constantTerm_analytic` (compatibility): on power series without `l` the constant term is
the value at `0`. -/
example {K : Type*} [Field K] (f : PowerSeries K) :
    constantTerm (Polynomial.C (HahnSeries.ofPowerSeries ℤ K f)) = PowerSeries.constantCoeff f := by
  sorry

-- frobeniusWord, frobeniusWord_dagger, frobeniusWord_D, frobeniusWord_L_single, frobeniusWord_top,
-- frobeniusWord_localExpansion, frobeniusWord_log, frobeniusWord_empty, frobeniusWord_Li1,
-- frobeniusWord_not_top_only: not stated for general pairs; the normalisation of φ^# needs the
-- local expansion at a φ-fixed base point (residue discs, AdicSpacesPartII:R2). For the punctured
-- line the Frobenius equation is the `frob` clause of `IsColemanFamily`.

-- ColemanFunctions, ColemanFunctions.dagger_le, ColemanFunctions.d_mem, ColemanFunctions.depth,
-- ColemanFunctions.ker_d, ColemanFunctions.frobenius_mem, ColemanFunctions.pullback,
-- ColemanFunctions.branch, ColemanFunctions.indep_basis, ColemanFunctions.eval,
-- ColemanFunctions.log_mem, ColemanFunctions.depth_zero, ColemanFunctions.not_all_locAn,
-- ColemanFunctions.dF_zero:
-- not stated for general pairs; need the algebra of locally analytic functions of a
-- good-reduction pair (AdicSpacesPartII:R2, AdicSpacesPartII:F1). Tube versions for the
-- punctured line: `PuncturedLine.colemanFunctions` below.
-- colemanIntegral, d_colemanIntegral, colemanIntegral_d, colemanIntegral_frobenius,
-- definiteIntegral, definiteIntegral_add, definiteIntegral_tiny, basedPrimitive,
-- definiteIntegral_d, definiteIntegral_pullback, definiteIntegral_dz_div_z,
-- definiteIntegral_exact, definiteIntegral_tiny_log, definiteIntegral_forced: not stated for
-- general pairs; same reason. Tube versions: `PuncturedLine.basedPrimitive` below.
-- `ColemanIntegration:L1/coleman-integration-characterisation`,
-- `ColemanIntegration:L1/coleman-uniqueness-principle`, `ColemanIntegration:L1/taylor-homotopy`,
-- `ColemanIntegration:L1/frobenius-lift-independence`, `ColemanIntegration:L1/coleman-pullback`,
-- `ColemanIntegration:L1/branch-independence-principle`,
-- `ColemanIntegration:L1/cohomological-analytic-pullback`: not stated for general pairs; same
-- reason. Tube versions for the punctured line below.

end Words

/-! ### The punctured line `P^1 - ({0, ∞} ∪ μ_N)` (tube prototypes) -/

section PuncturedLine

variable (p : ℕ) [Fact p.Prime] (N : ℕ)

/-- The tube of `U_N = P^1 - ({0, ∞} ∪ μ_N)`: units of `ℂ_p` not congruent to an `N`-th root of unity. -/
def puncturedTube : Set ℂ_[p] := {z | ‖z‖ = 1 ∧ ∀ ζ : ℂ_[p], ζ ^ N = 1 → ‖z - ζ‖ = 1}

/-- Evaluation of a power series at a point, as a `tsum`. -/
def psEval (f : PowerSeries ℂ_[p]) (x : ℂ_[p]) : ℂ_[p] := ∑' n : ℕ, PowerSeries.coeff n f * x ^ n

/-- Local prototype of the dagger algebra `A+(U_N)` restricted to the tube
(`ColemanIntegration:L1/punctured-line-mittag-leffler`; carrier from AdicSpacesPartII:F1):
Mittag-Leffler sums `f_∞(z) + f_0(1/z) + ∑_ζ f_ζ(1/(z - ζ))` of series restricted at some `ρ > 1`. -/
def puncturedDagger : Subalgebra ℂ_[p] (puncturedTube p N → ℂ_[p]) where
  carrier := {f | ∃ ρ : ℝ, 1 < ρ ∧ ∃ (fInf f0 : PowerSeries ℂ_[p]) (fζ : ℂ_[p] → PowerSeries ℂ_[p]),
      fInf.IsRestricted ρ ∧ f0.IsRestricted ρ ∧ PowerSeries.constantCoeff f0 = 0 ∧
      (∀ ζ, (fζ ζ).IsRestricted ρ ∧ PowerSeries.constantCoeff (fζ ζ) = 0) ∧
      ∀ z : puncturedTube p N, f z = psEval p fInf z + psEval p f0 (z : ℂ_[p])⁻¹ +
        ∑ ζ ∈ Polynomial.nthRootsFinset N (1 : ℂ_[p]), psEval p (fζ ζ) ((z : ℂ_[p]) - ζ)⁻¹}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

/-- Locally analytic functions on the tube: one power series on each residue disc. -/
def puncturedLocAn : Subalgebra ℂ_[p] (puncturedTube p N → ℂ_[p]) where
  carrier := {f | ∀ x : puncturedTube p N, ∃ (F : ℂ_[p] → ℂ_[p])
      (P : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p]), HasFPowerSeriesOnBall F P x 1 ∧
      ∀ z : puncturedTube p N, ‖(z : ℂ_[p]) - x‖ < 1 → f z = F z}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

/-- The derivative of a function on the (open) tube. -/
def tubeDeriv (f : puncturedTube p N → ℂ_[p]) : puncturedTube p N → ℂ_[p] :=
  fun z => deriv (Function.extend Subtype.val f 0) z

theorem pow_mem_puncturedTube (hN : ¬ p ∣ N) (z : puncturedTube p N) :
    (z : ℂ_[p]) ^ p ∈ puncturedTube p N := by
  sorry

/-- Pullback along `φ(z) = z^p`. -/
def tubeFrob (hN : ¬ p ∣ N) (f : puncturedTube p N → ℂ_[p]) : puncturedTube p N → ℂ_[p] :=
  fun z => f ⟨(z : ℂ_[p]) ^ p, pow_mem_puncturedTube p N hN z⟩

/-- Letters: `none` for `dz/z`, `some ζ` for `dz/(z - ζ)`. -/
abbrev Letter := Option (Polynomial.nthRootsFinset N (1 : ℂ_[p]))

/-- The coefficient of `dz` of the letter's form. -/
def letterForm : Letter p N → (puncturedTube p N → ℂ_[p])
  | none => fun z => (z : ℂ_[p])⁻¹
  | some ζ => fun z => ((z : ℂ_[p]) - ζ)⁻¹

theorem exists_root_pow_eq (hN : ¬ p ∣ N) (ζ : Polynomial.nthRootsFinset N (1 : ℂ_[p])) :
    ∃ η : Polynomial.nthRootsFinset N (1 : ℂ_[p]), (η : ℂ_[p]) ^ p = ζ := by
  sorry

/-- The Frobenius permutation of letters: `e_0 ↦ e_0`, `e_ζ ↦ e_η` with `η^p = ζ`. -/
def frobLetter (hN : ¬ p ∣ N) : Letter p N → Letter p N
  | none => none
  | some ζ => some (Classical.choose (exists_root_pow_eq p N hN ζ))

/-- `ColemanIntegration:L1/punctured-line-frobenius`: `z^p - 1 - (z - 1)^p` has all coefficients
divisible by `p`, so `u = (z^p - 1)/(z - 1)^p` is congruent to `1` on the wide open. -/
theorem puncturedLine_frobenius_polynomial :
    ∃ h : Polynomial ℤ, (Polynomial.X ^ p - 1 - (Polynomial.X - 1) ^ p : Polynomial ℤ) =
      Polynomial.C (p : ℤ) * h := by
  sorry

/-- `ColemanIntegration:L1/punctured-line-frobenius`: `φ^*(dz/(z-1)) = p dz/(z-1) + d log u`,
i.e. `p z^(p-1)/(z^p - 1) = p/(z - 1) + u'/u`. -/
theorem puncturedLine_frobenius_logDeriv (z : ℂ_[p]) (hz : z ^ p ≠ 1) (hz1 : z ≠ 1) :
    deriv (fun x : ℂ_[p] => (x ^ p - 1) / (x - 1) ^ p) z / ((z ^ p - 1) / (z - 1) ^ p) =
      (p : ℂ_[p]) * z ^ (p - 1) / (z ^ p - 1) - (p : ℂ_[p]) / (z - 1) := by
  sorry

/-- `ColemanIntegration:L1/punctured-line-de-rham-h1`, on the tube prototype: every element of
`A+(U_N)` (as a coefficient of `dz`) is `dh + c_0/z + ∑ c_ζ/(z - ζ)` with unique constants. -/
theorem puncturedLine_h1 (f : puncturedDagger p N) :
    ∃! c : Letter p N → ℂ_[p], ∃ h ∈ puncturedDagger p N,
      (f : puncturedTube p N → ℂ_[p]) = tubeDeriv p N h + ∑ i, c i • letterForm p N i := by
  sorry

/-- The Coleman family of iterated integrals on the tube of `U_N`, normalised at a base point
`b`: `F [] = 1`, `F` locally analytic, `d F (i :: w) = ω_i F w`, `F w (b) = 0` for `w ≠ []`, and
the Frobenius equation `φ^* F w - p^|w| F (σ w) ∈ span_{A+}{F v : |v| < |w|}` (Dwork's
principle). This is `ColemanIntegration:L1/coleman-realization` for the datum
`ColemanIntegration:L1/punctured-line-datum`, restricted to the tube. -/
structure IsColemanFamily (hN : ¬ p ∣ N) (b : puncturedTube p N)
    (F : List (Letter p N) → (puncturedTube p N → ℂ_[p])) : Prop where
  nil : F [] = 1
  locAn : ∀ w, F w ∈ puncturedLocAn p N
  deriv_cons : ∀ i w, tubeDeriv p N (F (i :: w)) = letterForm p N i * F w
  base : ∀ w, w ≠ [] → F w b = 0
  frob : ∀ w, tubeFrob p N hN (F w) - ((p : ℂ_[p]) ^ w.length) • F (w.map (frobLetter p N hN)) ∈
    Submodule.span (puncturedDagger p N) (F '' {v | v.length < w.length})

/-- `ColemanIntegration:L1/coleman-realization` for the punctured line (tube version, base point a
Teichmueller point `b`, i.e. `b^(p^m) = b`). -/
theorem existsUnique_colemanFamily (hN : ¬ p ∣ N) (b : puncturedTube p N)
    (hb : ∃ m, 0 < m ∧ (b : ℂ_[p]) ^ (p ^ m) = b) :
    ∃! F, IsColemanFamily p N hN b F := by
  sorry

namespace PuncturedLine

/-- `PuncturedLine.iteratedIntegral`: the iterated integrals `L_w` (tube version, based at `b`). -/
def iteratedIntegral (hN : ¬ p ∣ N) (b : puncturedTube p N)
    (hb : ∃ m, 0 < m ∧ (b : ℂ_[p]) ^ (p ^ m) = b) :
    List (Letter p N) → (puncturedTube p N → ℂ_[p]) :=
  Classical.choose (existsUnique_colemanFamily p N hN b hb).exists

/-- `PuncturedLine.colemanFunctions`: the Coleman functions on `U_N`, restricted to the tube: the
algebra generated by `A+(U_N)` and the iterated integrals. -/
def colemanFunctions (hN : ¬ p ∣ N) (b : puncturedTube p N)
    (hb : ∃ m, 0 < m ∧ (b : ℂ_[p]) ^ (p ^ m) = b) : Subalgebra ℂ_[p] (puncturedTube p N → ℂ_[p]) :=
  Algebra.adjoin ℂ_[p]
    ((puncturedDagger p N : Set (puncturedTube p N → ℂ_[p])) ∪ Set.range (iteratedIntegral p N hN b hb))

variable {p N}
variable (hN : ¬ p ∣ N) (b : puncturedTube p N) (hb : ∃ m, 0 < m ∧ (b : ℂ_[p]) ^ (p ^ m) = b)

@[simp] theorem d_iteratedIntegral (i : Letter p N) (w : List (Letter p N)) :
    tubeDeriv p N (iteratedIntegral p N hN b hb (i :: w)) =
      letterForm p N i * iteratedIntegral p N hN b hb w := by
  sorry

theorem iteratedIntegral_base (w : List (Letter p N)) (hw : w ≠ []) :
    iteratedIntegral p N hN b hb w b = 0 := by
  sorry

-- PuncturedLine.constantTerm_iteratedIntegral: not stated; the tangential normalisation at 0
-- needs the end germ at 0 (PadicHodgeTheory:P7:annulus-foundations); the tube prototype is
-- normalised at a Teichmueller point instead (`iteratedIntegral_base`).

theorem iteratedIntegral_shuffle (u v : List (Letter p N)) :
    iteratedIntegral p N hN b hb u * iteratedIntegral p N hN b hb v =
      ((shuffle u v).map (iteratedIntegral p N hN b hb)).sum := by
  sorry

theorem frobenius_iteratedIntegral (w : List (Letter p N)) :
    tubeFrob p N hN (iteratedIntegral p N hN b hb w) -
        ((p : ℂ_[p]) ^ w.length) • iteratedIntegral p N hN b hb (w.map (frobLetter p N hN)) ∈
      Submodule.span (puncturedDagger p N)
        (iteratedIntegral p N hN b hb '' {v | v.length < w.length}) := by
  sorry

-- PuncturedLine.iteratedIntegral_series: not stated; the expansion at 0 needs the end germ at 0
-- (PadicHodgeTheory:P7:annulus-foundations); the complex side is
-- Polylogarithms:P.1/classical-polylogarithm.

/-- `PuncturedLine.pullback_S3`, for `z ↦ 1/z` on `U_1` (the tube of `U_1` is stable under
inversion; `z ↦ 1 - z` is analogous). -/
theorem pullback_S3 (hN1 : ¬ p ∣ 1) (b : puncturedTube p 1) (hb : ∃ m, 0 < m ∧ (b : ℂ_[p]) ^ (p ^ m) = b)
    (hinv : ∀ z : puncturedTube p 1, (z : ℂ_[p])⁻¹ ∈ puncturedTube p 1)
    (f : puncturedTube p 1 → ℂ_[p]) (hf : f ∈ colemanFunctions p 1 hN1 b hb) :
    (fun z : puncturedTube p 1 => f ⟨(z : ℂ_[p])⁻¹, hinv z⟩) ∈ colemanFunctions p 1 hN1 b hb := by
  sorry

-- PuncturedLine.pullback_power: not stated; the map z ↦ z^m from U_m to U_1 goes between tubes of
-- different punctured lines; statable once both prototypes carry their own Coleman algebras
-- (bookkeeping), and it depends on `ColemanIntegration:L1/coleman-pullback`.
-- PuncturedLine.branch: on the tube the Coleman functions do not involve the branch at all
-- (`ColemanIntegration:L1/branch-independence-principle`); the branch enters through the end
-- germs (PadicHodgeTheory:P7:annulus-foundations).

/-- `ColemanIntegration:L1/coleman-uniqueness-principle` for the punctured line (tube version). -/
theorem eq_zero_of_eqOn_residueDisc (f : puncturedTube p N → ℂ_[p])
    (hf : f ∈ colemanFunctions p N hN b hb) (x : puncturedTube p N)
    (h0 : ∀ z : puncturedTube p N, ‖(z : ℂ_[p]) - x‖ < 1 → f z = 0) : f = 0 := by
  sorry

/-- `ColemanIntegration:L1/frobenius-lift-independence` for the punctured line, for the lifts
`z ↦ c z^p` with `c` a `p`-power root of unity: the Coleman algebra does not change. Stated as:
the family of `z ↦ z^p` also satisfies the Frobenius equation of `z ↦ c z^p` (up to the span of
shorter iterated integrals and constants). -/
theorem frobenius_lift_independence (c : ℂ_[p]) (k : ℕ) (hc : c ^ (p ^ k) = 1)
    (hmem : ∀ z : puncturedTube p N, c * (z : ℂ_[p]) ^ p ∈ puncturedTube p N)
    (w : List (Letter p N)) :
    (fun z : puncturedTube p N => iteratedIntegral p N hN b hb w ⟨c * (z : ℂ_[p]) ^ p, hmem z⟩) -
        ((p : ℂ_[p]) ^ w.length) • iteratedIntegral p N hN b hb (w.map (frobLetter p N hN)) ∈
      Submodule.span (puncturedDagger p N)
        (iteratedIntegral p N hN b hb '' {v | v.length < w.length}) := by
  sorry

/-- `PuncturedLine.basedPrimitive` (tube version, normalised at the base point `b`; the version
at the tangential base point `0` needs the end germ at `0`). -/
theorem exists_basedPrimitive (f : puncturedTube p N → ℂ_[p]) (hf : f ∈ colemanFunctions p N hN b hb)
    (i : Letter p N) :
    ∃! G : puncturedTube p N → ℂ_[p], G ∈ colemanFunctions p N hN b hb ∧
      tubeDeriv p N G = f * letterForm p N i ∧ G b = 0 := by
  sorry

-- PuncturedLine.d_basedPrimitive, PuncturedLine.constantTerm_basedPrimitive,
-- PuncturedLine.basedPrimitive_eq_zero_at_zero, PuncturedLine.basedPrimitive_unique,
-- PuncturedLine.basedPrimitive_frobenius, PuncturedLine.basedPrimitive_branch: the tube versions
-- are the three conjuncts of `exists_basedPrimitive` and `frobenius_iteratedIntegral`; the
-- constant-term, value-at-0 and branch statements need the end germ at 0.
-- PuncturedLine.basedPrimitive_Li1, PuncturedLine.basedPrimitive_log,
-- PuncturedLine.basedPrimitive_zero, PuncturedLine.value_normalisation_fails: not stated; need
-- the tangential base point at 0 (end germ).

/-- Test `PuncturedLine.log_eq` (computation), tube version: for `N = 1` and a Teichmueller base
point `b` (a root of unity), `L_(e_0) = log_p z` and `L_(e_1) = log_p(1 - z) - log_p(1 - b)`. -/
example (hN1 : ¬ p ∣ 1) (b : puncturedTube p 1) (hb : ∃ m, 0 < m ∧ (b : ℂ_[p]) ^ (p ^ m) = b)
    (one : Polynomial.nthRootsFinset 1 (1 : ℂ_[p])) :
    iteratedIntegral p 1 hN1 b hb [none] = (fun z : puncturedTube p 1 => iwasawaLog p z) ∧
      iteratedIntegral p 1 hN1 b hb [some one] =
        (fun z : puncturedTube p 1 => iwasawaLog p (1 - (z : ℂ_[p])) - iwasawaLog p (1 - (b : ℂ_[p]))) := by
  sorry

-- Test PuncturedLine.Li2_frobenius (computation): not stated as a Lean example; needs Li_2^(p)
-- (ColemanIntegration:L2). Checked numerically: H(2) = 3 Li_2^(3)(2) mod 3^10 (see the packet).

/-- Test `PuncturedLine.depth_zero` (degenerate). -/
example : puncturedDagger p N ≤ colemanFunctions p N hN b hb := by sorry

-- Test PuncturedLine.series_compat (compatibility): not stated; needs the end germ at 0.

/-- Test `PuncturedLine.not_all_primitives` (non-example), tube version for `N = 1`, `p ≥ 5`:
`log_p z + (indicator of the residue disc of 2)` is not a Coleman function. -/
example (hp : 5 ≤ p) (hN1 : ¬ p ∣ 1) (b : puncturedTube p 1)
    (hb : ∃ m, 0 < m ∧ (b : ℂ_[p]) ^ (p ^ m) = b) :
    (fun z : puncturedTube p 1 => iwasawaLog p z +
      Set.indicator {x : ℂ_[p] | ‖x - 2‖ < 1} (fun _ => 1) (z : ℂ_[p])) ∉
        colemanFunctions p 1 hN1 b hb := by
  sorry

end PuncturedLine

/-- Test `puncturedLine_one` (degenerate): the tube of `U_1` is `{‖z‖ = 1, ‖z - 1‖ = 1}`. -/
example (z : ℂ_[p]) : z ∈ puncturedTube p 1 ↔ ‖z‖ = 1 ∧ ‖z - 1‖ = 1 := by sorry

open Classical in
/-- Test `puncturedLine_teichmuller_count` (computation). -/
example : ((Polynomial.nthRootsFinset (p - 1) (1 : ℂ_[p])).erase 1).card = p - 2 := by sorry

-- Test puncturedLine_p_dvd (non-example): not stated; needs good-reduction pairs over Z_p[mu_p].

/-- Test `puncturedLine_powerMap_fibre` (compatibility): the fibre of `z ↦ z^N` over `1` is `μ_N`. -/
example (hN : 0 < N) (z : ℂ_[p]) : z ^ N = 1 ↔ z ∈ Polynomial.nthRootsFinset N (1 : ℂ_[p]) := by
  sorry

-- puncturedLine, puncturedLine.wideOpen_eq, puncturedLine.residueClasses, puncturedLine.teichmuller,
-- puncturedLine.inclusion, puncturedLine.powerMap, puncturedLine.rotation,
-- puncturedLine.pPowerRotation: the scheme-theoretic pair needs P^1 over Z_p[mu_N]; the tube
-- prototypes are `puncturedTube`, `puncturedDagger`, `existsUnique_teichmuller`, `pow_mem_puncturedTube`.

end PuncturedLine

end PartA

/-! ## Layer L2: polylogarithms -/

section PartB

open scoped ENNReal NNReal

variable (p : ℕ) [hp : Fact p.Prime]

/-! ### The branch of the logarithm (interface to ColemanIntegration:L0/log-branch) -/

/-- `IsLogBranch p a L`: `L` is a homomorphism `ℂ_[p]ˣ → ℂ_[p]`, given by the logarithm series on
`1 + 𝔪`, with `L p = a`. Layer L0 constructs the branch `log_a` as `padicLogBranch p a`
(ColemanIntegration:L0/log-branch), which satisfies this predicate
(`isLogBranch_padicLogBranch` at the end of the file); the predicate lists exactly the
properties that layer L2 uses. -/
structure IsLogBranch (a : ℂ_[p]) (L : ℂ_[p] → ℂ_[p]) : Prop where
  map_mul : ∀ x y : ℂ_[p], x ≠ 0 → y ≠ 0 → L (x * y) = L x + L y
  map_p : L (p : ℂ_[p]) = a
  hasSum_one_add : ∀ x : ℂ_[p], ‖x‖ < 1 →
    HasSum (fun n : ℕ => (-1 : ℂ_[p]) ^ n * x ^ (n + 1) / (n + 1)) (L (1 + x))

/-! ### ColemanIntegration:L2/polylogarithm-power-series -/

/-- The coefficients `n ↦ n^{-k}` (and `0` at `n = 0`) of the polylogarithm series. -/
def polylogCoeff (k : ℤ) (n : ℕ) : ℂ_[p] := if n = 0 then 0 else ((n : ℂ_[p]) ^ k)⁻¹

/-- The formal multilinear series `Σ_{n ≥ 1} n^{-k} X^n` over `ℂ_[p]`. -/
def polylogSeries (k : ℤ) : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p] :=
  FormalMultilinearSeries.ofScalars ℂ_[p] (polylogCoeff p k)

/-- `polylogSer p k z = Σ' n ≥ 1, z^n / n^k`, the polylogarithm series; it is `Li_k^ser(z)` for
`‖z‖ < 1`. -/
def polylogSer (k : ℤ) (z : ℂ_[p]) : ℂ_[p] :=
  ∑' n : ℕ, z ^ (n + 1) / ((n + 1 : ℂ_[p]) ^ k)

theorem polylogSer_hasFPowerSeriesOnBall (k : ℤ) :
    HasFPowerSeriesOnBall (polylogSer p k) (polylogSeries p k) 0 1 := by
  sorry

theorem radius_polylogSeries (k : ℤ) : (polylogSeries p k).radius = 1 := by
  sorry

@[simp] theorem polylogSer_zero (k : ℤ) : polylogSer p k 0 = 0 := by
  sorry

theorem polylogSer_zero_index {z : ℂ_[p]} (hz : ‖z‖ < 1) : polylogSer p 0 z = z / (1 - z) := by
  sorry

theorem polylogSer_hasDerivAt (k : ℤ) {z : ℂ_[p]} (hz : ‖z‖ < 1) (hz0 : z ≠ 0) :
    HasDerivAt (polylogSer p (k + 1)) (polylogSer p k z / z) z := by
  sorry

theorem polylogSer_hasDerivAt_zero (k : ℤ) : HasDerivAt (polylogSer p (k + 1)) 1 0 := by
  sorry

/-- Compatibility with Tau Ceti's series logarithm `NormedSpace.logOneAdd`, written through its
defining equation `NormedSpace.logOneAdd_eq_tsum`. -/
theorem polylogSer_one_eq_neg_logOneAdd {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    polylogSer p 1 z = -∑' n : ℕ, ((-1 : ℂ_[p]) ^ (n + 1) / n) * (-z) ^ n := by
  sorry

-- polylogSer_eq_eval_polylogSeries: not stated; needs Polylogarithms P.1's formal series
-- `polylogSeries (n : ℤ) : ℚ⟦X⟧` (the coefficients of `polylogSeries p k` are its images in ℂ_[p]).

theorem polylogSer_mem_of_mem (K : Subfield ℂ_[p]) (hK : IsClosed (K : Set ℂ_[p])) (k : ℤ)
    {z : ℂ_[p]} (hzK : z ∈ K) (hz : ‖z‖ < 1) : polylogSer p k z ∈ K := by
  sorry

theorem polylogSer_map (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ) (k : ℤ) {z : ℂ_[p]}
    (hz : ‖z‖ < 1) : σ (polylogSer p k z) = polylogSer p k (σ z) := by
  sorry

/-- Test `polylogSer_zero_index_apply_p` (computation). -/
example : polylogSer p 0 (p : ℂ_[p]) = (p : ℂ_[p]) / (1 - p) := by
  sorry

/-- Test `polylogSer_two_apply_p` (computation). -/
example (h5 : 5 ≤ p) : ‖polylogSer p 2 (p : ℂ_[p]) - p‖ = (p : ℝ) ^ (-2 : ℤ) := by
  sorry

/-- Test `polylogSer_apply_zero` (degenerate). -/
example (k : ℤ) : polylogSer p k 0 = 0 := by
  sorry

/-- Test `not_summable_polylogSer_one_add_p` (non-example). -/
example (k : ℕ) :
    ¬ Summable (fun n : ℕ => (1 + (p : ℂ_[p])) ^ (n + 1) / ((n + 1 : ℂ_[p]) ^ (k : ℤ))) := by
  sorry

/-- Test `polylogSer_one_eq_neg_logOneAdd_test` (compatibility). -/
example {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    polylogSer p 1 z = -∑' n : ℕ, ((-1 : ℂ_[p]) ^ (n + 1) / n) * (-z) ^ n := by
  sorry

/-! ### ColemanIntegration:L2/residue-discs-of-roots-of-unity -/

theorem norm_sub_one_of_isPrimitiveRoot_prime_pow {ζ : ℂ_[p]} {r : ℕ} (hr : 1 ≤ r)
    (hζ : IsPrimitiveRoot ζ (p ^ r)) :
    ‖ζ - 1‖ = (p : ℝ) ^ (-(1 : ℝ) / ((p : ℝ) ^ (r - 1) * ((p : ℝ) - 1))) := by
  sorry

theorem norm_sub_one_of_isPrimitiveRoot_of_not_prime_pow {ζ : ℂ_[p]} {N : ℕ} (hN : 2 ≤ N)
    (hζ : IsPrimitiveRoot ζ N) (hNp : ∀ r : ℕ, N ≠ p ^ r) : ‖ζ - 1‖ = 1 := by
  sorry

/-! ### The class of BBDJR and the p-adic polylogarithm
(ColemanIntegration:L2/elementary-characterisation, ColemanIntegration:L2/p-adic-polylogarithm) -/

/-- `f` is, on `0 < ‖z - c‖ < 1`, a polynomial in `L (z - c)` with coefficients Laurent series in
`z - c` converging on the punctured unit disc around `c`. -/
def IsLogLaurentNear (L : ℂ_[p] → ℂ_[p]) (f : ℂ_[p] → ℂ_[p]) (c : ℂ_[p]) : Prop :=
  ∃ (N : ℕ) (coeff : ℕ → ℤ → ℂ_[p]),
    (∀ i : ℕ, ∀ r : ℝ, 0 < r → r < 1 → Summable fun n : ℤ => ‖coeff i n‖ * r ^ n) ∧
    ∀ z : ℂ_[p], 0 < ‖z - c‖ → ‖z - c‖ < 1 →
      f z = ∑ i ∈ Finset.range (N + 1), (∑' n : ℤ, coeff i n * (z - c) ^ n) * L (z - c) ^ i

/-- The same shape at `∞`, in the parameter `1/z`, on `‖z‖ > 1`. -/
def IsLogLaurentAtInfty (L : ℂ_[p] → ℂ_[p]) (f : ℂ_[p] → ℂ_[p]) : Prop :=
  ∃ (N : ℕ) (coeff : ℕ → ℤ → ℂ_[p]),
    (∀ i : ℕ, ∀ r : ℝ, 0 < r → r < 1 → Summable fun n : ℤ => ‖coeff i n‖ * r ^ n) ∧
    ∀ z : ℂ_[p], 1 < ‖z‖ →
      f z = ∑ i ∈ Finset.range (N + 1), (∑' n : ℤ, coeff i n * z⁻¹ ^ n) * L z⁻¹ ^ i

/-- The class `𝒞^a` of Besser–Buckingham–de Jeu–Roblot, §4: analytic on every residue disc
`D⁻(x, 1)` with `‖x - 1‖ = 1`, and logarithmic-Laurent on the punctured discs of `1` and `∞`. -/
structure InPolylogClass (L : ℂ_[p] → ℂ_[p]) (f : ℂ_[p] → ℂ_[p]) : Prop where
  analytic_residue_disc : ∀ x : ℂ_[p], ‖x - 1‖ = 1 →
    ∃ q : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p], HasFPowerSeriesOnBall f q x 1
  near_one : IsLogLaurentNear p L f 1
  near_infty : IsLogLaurentAtInfty p L f

/-- The characterising properties (i)–(iv) of ColemanIntegration:L2/elementary-characterisation,
together with the normalisation of the value at `1` (continuity along `ℚ_[p]` for `k ≥ 2`, the
value `0` for `k ≤ 1`). -/
structure IsPolylogFamily (L : ℂ_[p] → ℂ_[p]) (F : ℕ → ℂ_[p] → ℂ_[p]) : Prop where
  zero_index : ∀ z : ℂ_[p], z ≠ 1 → F 0 z = z / (1 - z)
  apply_zero : ∀ k, F k 0 = 0
  mem_class : ∀ k, InPolylogClass p L (F k)
  hasDerivAt : ∀ k (z : ℂ_[p]), z ≠ 1 → z ≠ 0 → HasDerivAt (F (k + 1)) (F k z / z) z
  frobenius : ∀ k, ∃ g : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p],
    ENNReal.ofReal ((p : ℝ) ^ ((1 : ℝ) / ((p : ℝ) - 1))) ≤ g.radius ∧
    ∀ z : ℂ_[p], (p : ℝ) ^ (-(1 : ℝ) / ((p : ℝ) - 1)) < ‖z - 1‖ →
      F k z - ((p : ℂ_[p]) ^ k)⁻¹ * F k (z ^ p) = g.sum (1 - z)⁻¹
  tendsto_one : ∀ k, 2 ≤ k →
    Tendsto (fun x : ℚ_[p] => F k (algebraMap ℚ_[p] ℂ_[p] x)) (𝓝[≠] 1) (𝓝 (F k 1))
  apply_one : ∀ k, k < 2 → F k 1 = 0

/-- **Elementary characterisation** (ColemanIntegration:L2/elementary-characterisation): for every
branch there is exactly one polylogarithm family. -/
theorem existsUnique_isPolylogFamily {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    ∃! F : ℕ → ℂ_[p] → ℂ_[p], IsPolylogFamily p L F := by
  sorry

/-- Coleman's p-adic polylogarithm `Li^a_k`, defined through its elementary characterisation. -/
def padicPolylog {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    ℕ → ℂ_[p] → ℂ_[p] :=
  (existsUnique_isPolylogFamily p hL).exists.choose

theorem isPolylogFamily_padicPolylog {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    IsPolylogFamily p L (padicPolylog p hL) :=
  (existsUnique_isPolylogFamily p hL).exists.choose_spec

-- existence-and-uniqueness-of-coleman-polylogarithms, padicPolylog_isColeman: not stated; needs
-- the ring of Coleman functions on P¹ ∖ {0,1,∞} normalised at the tangential base point at 0
-- (ColemanIntegration:L1/punctured-line-coleman-functions; the tube prototype
-- `colemanFunctions` above is normalised at a Teichmüller point instead), in which
-- `padicPolylog p hL k` is the unique Coleman function with `d Li_k = Li_{k-1} dz/z`,
-- `Li_1 = -log_a(1 - z)` and no logarithmic term and value 0 at 0.

-- tangential-base-point-at-zero: not stated; needs Coleman functions on P¹ ∖ {0,1,∞} and their
-- log-expansions on the residue annulus of 0 to define the regularised value `Reg_{λ∂z}`.

variable {p}
variable {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]}

/-- The p-adic zeta value `ζ_p(k) = Li_k(1)` (`k ≥ 2`). -/
def padicZeta (hL : IsLogBranch p a L) (k : ℕ) : ℂ_[p] := padicPolylog p hL k 1

/-- The modified polylogarithm `Li^{(p),a}_k(z) = Li^a_k(z) - p^{-k} Li^a_k(z^p)`. -/
def padicModPolylog (hL : IsLogBranch p a L) (k : ℕ) (z : ℂ_[p]) : ℂ_[p] :=
  padicPolylog p hL k z - ((p : ℂ_[p]) ^ k)⁻¹ * padicPolylog p hL k (z ^ p)

theorem padicPolylog_zero_index (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz : z ≠ 1) :
    padicPolylog p hL 0 z = z / (1 - z) := by
  sorry

theorem padicPolylog_one_index (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz : z ≠ 1) :
    padicPolylog p hL 1 z = -L (1 - z) := by
  sorry

@[simp] theorem padicPolylog_apply_zero (hL : IsLogBranch p a L) (k : ℕ) :
    padicPolylog p hL k 0 = 0 := by
  sorry

theorem padicPolylog_eq_polylogSer (hL : IsLogBranch p a L) (k : ℕ) {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    padicPolylog p hL k z = polylogSer p k z := by
  sorry

theorem padicPolylog_analyticAt (hL : IsLogBranch p a L) (k : ℕ) {z : ℂ_[p]} (hz : z ≠ 1) :
    AnalyticAt ℂ_[p] (padicPolylog p hL k) z := by
  sorry

theorem padicPolylog_one (hL : IsLogBranch p a L) {b : ℂ_[p]} {L' : ℂ_[p] → ℂ_[p]}
    (hL' : IsLogBranch p b L') {k : ℕ} (hk : 2 ≤ k) :
    padicPolylog p hL k 1 = padicPolylog p hL' k 1 := by
  sorry

/-! ### ColemanIntegration:L2/differential-recursion -/

theorem padicPolylog_hasDerivAt (hL : IsLogBranch p a L) (k : ℕ) {z : ℂ_[p]} (hz : z ≠ 1)
    (hz0 : z ≠ 0) : HasDerivAt (padicPolylog p hL (k + 1)) (padicPolylog p hL k z / z) z := by
  sorry

theorem padicPolylog_hasDerivAt_zero (hL : IsLogBranch p a L) (k : ℕ) :
    HasDerivAt (padicPolylog p hL (k + 1)) 1 0 := by
  sorry

/-! ### ColemanIntegration:L2/distribution-relation -/

/-- **Distribution relation.** -/
theorem padicPolylog_distribution (hL : IsLogBranch p a L) (k m : ℕ) (hm : 0 < m) {z : ℂ_[p]}
    (hz : z ^ m ≠ 1) {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ m) :
    ∑ i ∈ Finset.range m, padicPolylog p hL k (ζ ^ i * z) =
      ((m : ℂ_[p]) ^ k)⁻¹ * (m : ℂ_[p]) * padicPolylog p hL k (z ^ m) := by
  sorry

/-! ### ColemanIntegration:L2/inversion-relation -/

/-- **Inversion relation.** -/
theorem padicPolylog_inversion (hL : IsLogBranch p a L) (k : ℕ) {z : ℂ_[p]} (hz0 : z ≠ 0)
    (hz1 : z ≠ 1) :
    padicPolylog p hL k z + (-1) ^ k * padicPolylog p hL k z⁻¹ = -(L z) ^ k / (k.factorial) := by
  sorry

theorem padicPolylog_inv_of_isPrimitiveRoot (hL : IsLogBranch p a L) {k N : ℕ} (hk : 1 ≤ k)
    (hN : 2 ≤ N) {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ N) :
    padicPolylog p hL k ζ⁻¹ = (-1) ^ (k + 1) * padicPolylog p hL k ζ := by
  sorry

/-! ### ColemanIntegration:L2/branch-dependence -/

/-- **Branch dependence** (Besser–de Jeu, Proposition 2.6), with `v(1 - z)` written through the
norm: `‖1 - z‖ = p^{-v(1-z)}`. -/
theorem padicPolylog_sub_padicPolylog {b : ℂ_[p]} {L' : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L)
    (hL' : IsLogBranch p b L') (k : ℕ) (hk : 1 ≤ k) {z : ℂ_[p]} (hz : z ≠ 1) (v : ℚ)
    (hv : ‖1 - z‖ = (p : ℝ) ^ (-(v : ℝ))) :
    padicPolylog p hL k z - padicPolylog p hL' k z =
      -((a - b) * (v : ℂ_[p]) / (k.factorial)) *
        ∑ j ∈ Finset.range k, L z ^ (k - 1 - j) * L' z ^ j := by
  sorry

theorem padicPolylog_eq_of_norm_sub_one_eq_one {b : ℂ_[p]} {L' : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) (hL' : IsLogBranch p b L') (k : ℕ) {z : ℂ_[p]}
    (hz : ‖z - 1‖ = 1) (hz' : ‖z‖ ≤ 1) : padicPolylog p hL k z = padicPolylog p hL' k z := by
  sorry

/-! ### ColemanIntegration:L2/galois-equivariance -/

theorem padicPolylog_map {b : ℂ_[p]} {L' : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L)
    (hL' : IsLogBranch p b L') (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ) (hσa : σ a = b)
    (k : ℕ) {z : ℂ_[p]} (hz : z ≠ 1) :
    σ (padicPolylog p hL k z) = padicPolylog p hL' k (σ z) := by
  sorry

/-! ### ColemanIntegration:L2/value-at-one -/

theorem tendsto_padicPolylog_one (hL : IsLogBranch p a L) {k : ℕ} (hk : 2 ≤ k) :
    Tendsto (fun x : ℚ_[p] => padicPolylog p hL k (algebraMap ℚ_[p] ℂ_[p] x)) (𝓝[≠] 1)
      (𝓝 (padicZeta hL k)) := by
  sorry

theorem padicZeta_even (hL : IsLogBranch p a L) {k : ℕ} (hk : 1 ≤ k) :
    padicZeta hL (2 * k) = 0 := by
  sorry

theorem sum_padicPolylog_rootsOfUnity (hL : IsLogBranch p a L) {k m : ℕ} (hk : 2 ≤ k)
    (hm : 0 < m) {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ m) :
    ∑ i ∈ Finset.range m, padicPolylog p hL k (ζ ^ i) =
      ((m : ℂ_[p]) ^ k)⁻¹ * (m : ℂ_[p]) * padicZeta hL k := by
  sorry

/-! ### ColemanIntegration:L2/locally-analytic-antiderivatives-and-a-non-example -/

/-- `5` is prime (for the non-example below). -/
local instance fact_prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/-- The non-example: adding `1` on the residue disc of `2` (for `p = 5`) keeps the local
differential equation and the normalisation at `0` but breaks the distribution relation. -/
theorem nonExample_distribution_defect {a₅ : ℂ_[5]} {L₅ : ℂ_[5] → ℂ_[5]}
    (hL : IsLogBranch 5 a₅ L₅) :
    let G : ℂ_[5] → ℂ_[5] := fun z =>
      padicPolylog 5 hL 2 z + if ‖z - 2‖ < 1 then 1 else 0
    G 2 + G (-2) - (2 : ℂ_[5])⁻¹ * G 4 = 1 := by
  sorry

/-! ### ColemanIntegration:L2/integral-modified-polylogarithm -/

variable (p) in
/-- The Riemann sums `(1 - z^{p^m})⁻¹ Σ_{0<b<p^m, p∤b} b^{-k} z^b`. -/
def modPolylogApprox (k : ℤ) (m : ℕ) (z : ℂ_[p]) : ℂ_[p] :=
  (1 - z ^ (p ^ m))⁻¹ *
    ∑ b ∈ (Finset.range (p ^ m)).filter (fun b => ¬ p ∣ b), ((b : ℂ_[p]) ^ k)⁻¹ * z ^ b

variable (p) in
/-- The integral modified polylogarithm `ℓ_k` on `P¹ ∖ D⁻(1,1)`: the p-adic limit of the Riemann
sums on `‖z‖ ≤ 1`, extended to `‖z‖ > 1` by the symmetry `ℓ_k(1/z) = (-1)^{k+1} ℓ_k(z)`. -/
def modPolylogLimit (k : ℤ) (z : ℂ_[p]) : ℂ_[p] :=
  if ‖z‖ ≤ 1 then limUnder atTop (fun m => modPolylogApprox p k m z)
  else (-1 : ℂ_[p]) ^ (k + 1) * limUnder atTop (fun m => modPolylogApprox p k m z⁻¹)

variable (p) in
/-- The ring `ℤ_[p][t, (1 - t)⁻¹]`. -/
abbrev IntegralLocalRing : Type := Localization.Away (1 - Polynomial.X : Polynomial ℤ_[p])

variable (p) in
/-- The element `ℓ_k` of the p-adic completion of `ℤ_[p][t, (1 - t)⁻¹]`. -/
def modPolylogElement (k : ℤ) :
    AdicCompletion (Ideal.span {(p : IntegralLocalRing p)}) (IntegralLocalRing p) := by
  sorry

-- modPolylogElement expansion at 0: not stated; needs the expansion map from the p-adic
-- completion of ℤ_[p][t, (1 - t)⁻¹] to ℤ_[p]⟦t⟧ (injective ring map), not in Mathlib.

theorem norm_modPolylogLimit_sub_approx_le (k : ℤ) (m : ℕ) {z : ℂ_[p]} (hz : ‖z‖ ≤ 1)
    (hz1 : ‖z - 1‖ = 1) :
    ‖modPolylogLimit p k z - modPolylogApprox p k m z‖ ≤ (p : ℝ) ^ (-(m : ℤ)) := by
  sorry

theorem norm_modPolylogLimit_le_one (k : ℤ) {z : ℂ_[p]} (hz : 1 ≤ ‖z - 1‖) :
    ‖modPolylogLimit p k z‖ ≤ 1 := by
  sorry

theorem modPolylogLimit_eq_tsum (k : ℤ) {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    modPolylogLimit p k z =
      ∑' n : ℕ, if p ∣ (n + 1) then 0 else z ^ (n + 1) / ((n + 1 : ℂ_[p]) ^ k) := by
  sorry

theorem modPolylogLimit_inv (k : ℤ) {z : ℂ_[p]} (hz0 : z ≠ 0) (hz : 1 ≤ ‖z - 1‖) :
    modPolylogLimit p k z⁻¹ = (-1 : ℂ_[p]) ^ (k + 1) * modPolylogLimit p k z := by
  sorry

theorem modPolylogLimit_hasDerivAt (k : ℤ) {z : ℂ_[p]} (hz0 : z ≠ 0) (hz : 1 ≤ ‖z - 1‖) :
    HasDerivAt (modPolylogLimit p (k + 1)) (modPolylogLimit p k z / z) z := by
  sorry

theorem modPolylogLimit_zero_index {z : ℂ_[p]} (hz : 1 ≤ ‖z - 1‖) :
    modPolylogLimit p 0 z = z / (1 - z) - z ^ p / (1 - z ^ p) := by
  sorry

theorem modPolylogLimit_reduction (k : ℤ) {z : ℂ_[p]} (hz : ‖z‖ ≤ 1) (hz1 : ‖z - 1‖ = 1) :
    ‖modPolylogLimit p k z -
        (1 - z ^ p)⁻¹ * ∑ b ∈ Finset.Ico 1 p, ((b : ℂ_[p]) ^ k)⁻¹ * z ^ b‖ ≤ (p : ℝ)⁻¹ := by
  sorry

theorem modPolylogLimit_distribution (k : ℤ) {m : ℕ} (hm : 0 < m) (hpm : ¬ p ∣ m)
    {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ m) {z : ℂ_[p]} (hz : ‖z‖ ≤ 1) (hz1 : ‖z - 1‖ = 1) :
    ∑ i ∈ Finset.range m, modPolylogLimit p k (ζ ^ i * z) =
      ((m : ℂ_[p]) ^ k)⁻¹ * (m : ℂ_[p]) * modPolylogLimit p k (z ^ m) := by
  sorry

/-- Test `modPolylogLimit_zero_index_test` (computation). -/
example {z : ℂ_[p]} (hz : 1 ≤ ‖z - 1‖) :
    modPolylogLimit p 0 z = z / (1 - z) - z ^ p / (1 - z ^ p) := by
  sorry

/-- Test `modPolylogLimit_two_neg_one` (computation). -/
example (hp2 : p ≠ 2) {k : ℕ} (hk : Even k) (hk0 : k ≠ 0) :
    modPolylogLimit p k (-1) = 0 := by
  sorry

/-- Test `modPolylogLimit_apply_zero` (degenerate). -/
example (k : ℤ) : modPolylogLimit p k 0 = 0 := by
  sorry

/-- Test `modPolylogLimit_ne_polylog` (non-example): `ℓ_1(-1) = -(1 - 1/p) log 2 ≠ -log 2`. -/
example (hp2 : p ≠ 2) (hL : IsLogBranch p a L) :
    modPolylogLimit p 1 (-1) ≠ padicPolylog p hL 1 (-1) := by
  sorry

/-- Test `modPolylogLimit_isRestricted` (compatibility): the expansion of `ℓ_k` in
`s = t/(1 - t)` is a restricted power series with `ℤ_[p]` coefficients. -/
example (k : ℤ) : ∃ f : PowerSeries ℤ_[p], PowerSeries.IsRestricted 1 f ∧
    ∀ s : ℂ_[p], ‖s‖ ≤ 1 →
      HasSum (fun n : ℕ => algebraMap ℚ_[p] ℂ_[p] ((PowerSeries.coeff n f : ℤ_[p]) : ℚ_[p]) * s ^ n)
      (modPolylogLimit p k (s / (1 + s))) := by
  sorry

/-! ### ColemanIntegration:L2/overconvergent-expansion-of-the-modified-polylogarithm and
ColemanIntegration:L2/frobenius-relation -/

variable (p) in
/-- The overconvergent series `g_k(v)`, `v = 1/(1 - z)`. -/
def frobeniusSeries (k : ℕ) : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p] := by
  sorry

theorem le_radius_frobeniusSeries (k : ℕ) :
    ENNReal.ofReal ((p : ℝ) ^ ((1 : ℝ) / ((p : ℝ) - 1))) ≤ (frobeniusSeries p k).radius := by
  sorry

theorem frobeniusSeries_sum_eq_modPolylogLimit (k : ℕ) {z : ℂ_[p]} (hz : 1 ≤ ‖z - 1‖) :
    (frobeniusSeries p k).sum (1 - z)⁻¹ = modPolylogLimit p k z := by
  sorry

/-- **Coleman's Frobenius relation.** -/
theorem padicModPolylog_eq_frobeniusSeries (hL : IsLogBranch p a L) (k : ℕ) {z : ℂ_[p]}
    (hz : (p : ℝ) ^ (-(1 : ℝ) / ((p : ℝ) - 1)) < ‖z - 1‖) :
    padicModPolylog hL k z = (frobeniusSeries p k).sum (1 - z)⁻¹ := by
  sorry

/-! ### ColemanIntegration:L2/dilogarithm-identities and ColemanIntegration:L2/five-term-relation -/

/-- Coleman's dilogarithm `D^a(z) = Li^a_2(z) + ½ log_a z · log_a (1 - z)` (GSWZ's `D_p` for the
Iwasawa branch). -/
def dilogD (hL : IsLogBranch p a L) (z : ℂ_[p]) : ℂ_[p] :=
  padicPolylog p hL 2 z + L z * L (1 - z) / 2

theorem padicPolylog_two_add_one_sub (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz0 : z ≠ 0)
    (hz1 : z ≠ 1) : padicPolylog p hL 2 z + padicPolylog p hL 2 (1 - z) = -(L z * L (1 - z)) := by
  sorry

theorem dilogD_one_sub (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    dilogD hL (1 - z) = -dilogD hL z := by
  sorry

theorem dilogD_inv (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    dilogD hL z⁻¹ = -dilogD hL z := by
  sorry

/-- **Five-term relation** for the p-adic dilogarithm. -/
theorem dilogD_five_term (hL : IsLogBranch p a L) {x y : ℂ_[p]} (hx0 : x ≠ 0) (hx1 : x ≠ 1)
    (hy0 : y ≠ 0) (hy1 : y ≠ 1) (hxy : x ≠ y) :
    dilogD hL x - dilogD hL y + dilogD hL (y / x) - dilogD hL ((1 - x⁻¹) / (1 - y⁻¹)) +
      dilogD hL ((1 - x) / (1 - y)) = 0 := by
  sorry

/-! ### ColemanIntegration:L2/values-at-tame-roots-of-unity and
ColemanIntegration:L2/values-at-roots-of-unity-of-p-power-order -/

/-- **Values at roots of unity of order prime to p** (telescoped Frobenius relation). -/
theorem padicPolylog_tame_rootOfUnity (hL : IsLogBranch p a L) {k N f : ℕ} (hk : 1 ≤ k)
    (hN : 2 ≤ N) (hpN : ¬ p ∣ N) {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ N) (hf : ζ ^ p ^ f = ζ)
    (hf0 : 0 < f) :
    (1 - ((p : ℂ_[p]) ^ (k * f))⁻¹) * padicPolylog p hL k ζ =
      ∑ i ∈ Finset.range f, ((p : ℂ_[p]) ^ (k * i))⁻¹ * modPolylogLimit p k (ζ ^ p ^ i) := by
  sorry

theorem norm_padicPolylog_tame_rootOfUnity_le (hL : IsLogBranch p a L) {k N : ℕ} (hk : 1 ≤ k)
    (hN : 2 ≤ N) (hpN : ¬ p ∣ N) {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ N) :
    ‖padicPolylog p hL k ζ‖ ≤ (p : ℝ) ^ (-(k : ℤ)) := by
  sorry

theorem padicPolylog_primePow_rootOfUnity_branch (hL : IsLogBranch p a L) {b : ℂ_[p]}
    {L' : ℂ_[p] → ℂ_[p]} (hL' : IsLogBranch p b L') {k r : ℕ} (hk : 2 ≤ k) (hr : 1 ≤ r)
    {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ (p ^ r)) :
    padicPolylog p hL k ζ = padicPolylog p hL' k ζ := by
  sorry

/-! ### ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity -/

/-- **Expansion at a root of unity whose order is not a power of `p`, with logarithmic growth.** -/
theorem padicPolylog_expansion_at_rootOfUnity (hL : IsLogBranch p a L) (k : ℕ) {N : ℕ}
    (hN : 2 ≤ N) (hNp : ∀ r : ℕ, N ≠ p ^ r) {ε : ℂ_[p]} (hε : IsPrimitiveRoot ε N) :
    ∃ c : ℕ → ℂ_[p], ∃ C : ℝ,
      (∀ T : ℂ_[p], ‖T‖ < 1 →
        HasSum (fun n => c n * T ^ n) (padicPolylog p hL k ((1 + T) * ε))) ∧
      c 0 = padicPolylog p hL k ε ∧
      ∀ n : ℕ, 1 ≤ n → ‖c n‖ ≤ C * (n : ℝ) ^ k := by
  sorry

/-! ### ColemanIntegration:L2/twisted-sums-for-primitive-characters -/

/-- The twisted sum `S_k(θ, ε) = Σ_{c ∈ (ℤ/N)ˣ} θ⁻¹(c) Li_k(ε^c)`. -/
def twistedPolylogSum (hL : IsLogBranch p a L) {N : ℕ} [NeZero N] (θ : DirichletCharacter ℂ_[p] N)
    (ε : ℂ_[p]) (k : ℕ) : ℂ_[p] :=
  ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * padicPolylog p hL k (ε ^ (c : ZMod N).val)

/-- **Euler factor**: the twisted sum of `Li^{(p)}_k` for a primitive character. -/
theorem twistedModPolylogSum_eq (hL : IsLogBranch p a L) {N k : ℕ} [NeZero N] (hk : 1 ≤ k)
    (θ : DirichletCharacter ℂ_[p] N) (hθ : θ.IsPrimitive) (hθ1 : θ ≠ 1) {ε : ℂ_[p]}
    (hε : IsPrimitiveRoot ε N) (hNk : N ≠ p ∨ 2 ≤ k) :
    ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * padicModPolylog hL k (ε ^ (c : ZMod N).val) =
      (1 - θ (p : ZMod N) * ((p : ℂ_[p]) ^ k)⁻¹) * twistedPolylogSum hL θ ε k := by
  sorry

theorem twistedPolylogSum_parity (hL : IsLogBranch p a L) {N k : ℕ} [NeZero N] (hk : 1 ≤ k)
    (θ : DirichletCharacter ℂ_[p] N) {ε : ℂ_[p]} (hε : IsPrimitiveRoot ε N)
    (hpar : θ (-1) = (-1) ^ k) : twistedPolylogSum hL θ ε k = 0 := by
  sorry

/-! ### ColemanIntegration:L2/complex-polylogarithm-at-roots-of-unity -/

-- complex values Li_k^ℂ(e^{2πix}) = expZeta x k: not stated; needs Polylogarithms P.1's
-- `polylog`. The Mathlib side (`HurwitzZeta.hasSum_expZeta_of_one_lt_re`) is already there.

/-- The complex inversion relation at roots of unity, from Mathlib's `cosZeta`/`sinZeta` values
(contrast: `padicPolylog_inv_of_isPrimitiveRoot`). -/
theorem expZeta_add_neg_expZeta {k : ℕ} (hk : 2 ≤ k) {x : ℝ} (hx0 : 0 < x) (hx1 : x < 1) :
    HurwitzZeta.expZeta x k + (-1) ^ k * HurwitzZeta.expZeta (-x) k =
      -(2 * Real.pi * Complex.I) ^ k / (k.factorial) *
        ((Polynomial.bernoulli k).map (algebraMap ℚ ℂ)).eval (x : ℂ) := by
  sorry

/-! ### Tests of `padicPolylog` (ColemanIntegration:L2/p-adic-polylogarithm) -/

/-- Test `padicPolylog_two_neg_one` (computation). -/
example (hp2 : p ≠ 2) (hL : IsLogBranch p a L) : padicPolylog p hL 2 (-1) = 0 := by
  sorry

/-- Test `padicPolylog_two_two` (computation). -/
example (hp2 : p ≠ 2) (hL : IsLogBranch p a L) : padicPolylog p hL 2 2 = 0 := by
  sorry

/-- Test `padicPolylog_two_half` (computation). -/
example (hp2 : p ≠ 2) (hL : IsLogBranch p a L) :
    padicPolylog p hL 2 (2⁻¹) = -(L 2) ^ 2 / 2 := by
  sorry

/-- Test `padicPolylog_two_inv_p` (non-example: the branch matters on the residue disc of ∞). -/
example (hL : IsLogBranch p a L) :
    padicPolylog p hL 2 ((p : ℂ_[p])⁻¹) = -polylogSer p 2 (p : ℂ_[p]) - a ^ 2 / 2 := by
  sorry

/-- Test `padicPolylog_apply_zero_test` (degenerate). -/
example (hL : IsLogBranch p a L) (k : ℕ) {z : ℂ_[p]} (hz : z ≠ 1) :
    padicPolylog p hL k 0 = 0 ∧ padicPolylog p hL 0 z = z / (1 - z) := by
  sorry

/-- Test `padicPolylog_one_index_eq_logOneAdd` (compatibility). -/
example (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz : ‖z‖ < 1) :
    padicPolylog p hL 1 z = -∑' n : ℕ, ((-1 : ℂ_[p]) ^ (n + 1) / n) * (-z) ^ n := by
  sorry

end PartB

/-! ## Layer L3: positive integer values -/

section PositiveIntegerValues

open scoped AbstractMeasure _root_.PowerSeries

variable {p : ℕ} [hp : Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]
  [Algebra ℤ_[p] K] [ContinuousSMul ℤ_[p] K]

/-! ### Power series on the open unit disc -/

/-- `R⁺`: power series converging on the open unit disc, i.e. restricted at every radius
`c < 1` (Mathlib's `PowerSeries.IsRestricted`). The ring itself is owned by
LocallyAnalyticDistributions:L1. -/
def IsOpenDiscSeries (f : K⟦X⟧) : Prop :=
  ∀ c : ℝ, 0 ≤ c → c < 1 → f.IsRestricted c

/-- Value of a power series at a point, as a `tsum`. -/
def evalSeries (f : K⟦X⟧) (t : K) : K :=
  ∑' n, PowerSeries.coeff n f * t ^ n

/-- RJW's operator `∂ = (1 + T) d/dT`. -/
def dop (f : K⟦X⟧) : K⟦X⟧ :=
  (1 + PowerSeries.X) * PowerSeries.derivative K f

/-! ### Test functions on `ℤ_p` -/

open scoped Classical in
/-- `x ↦ 1_{ℤ_p^×}(x) · x^{-k}` for an integer `k`. -/
def unitsZPow (k : ℤ) : C(ℤ_[p], K) :=
  ⟨fun x => if IsUnit x then (algebraMap ℤ_[p] K x) ^ (-k) else 0, sorry⟩

/-- `x ↦ x^j`. -/
def powFun (j : ℕ) : C(ℤ_[p], K) :=
  ⟨fun x => (algebraMap ℤ_[p] K x) ^ j, sorry⟩

/-- The indicator function of the residue class `a + p^m ℤ_p`. -/
def residueClassIndicator (m a : ℕ) : C(ℤ_[p], K) :=
  ⟨fun x => if PadicInt.toZModPow m x = (a : ZMod (p ^ m)) then 1 else 0, sorry⟩

/-! ### The geometric measure `μ_w` (ColemanIntegration:L3/geometric-measure) -/

/-- The Amice transform `w(1+T)/(1 - w(1+T)) = Li₀(w(1+T))`. -/
def geometricTransform (w : K) : K⟦X⟧ :=
  PowerSeries.C w * (1 + PowerSeries.X) * (1 - PowerSeries.C w * (1 + PowerSeries.X))⁻¹

/-- The geometric measure `μ_w` of a point with `‖w‖ ≤ 1`, `‖w - 1‖ = 1`: the bounded measure
with Amice transform `geometricTransform w` (existence needs PadicMeasuresIwasawaAlgebras:L2,
the bounded Mahler–Amice bijection over `O_K`). -/
def geometricMeasure (w : K) (_hw : ‖w‖ ≤ 1) (_hw1 : ‖w - 1‖ = 1) : D(ℤ_[p], K) :=
  sorry

theorem amiceTransform_geometricMeasure (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) :
    (geometricMeasure (p := p) w hw hw1).amiceTransform = geometricTransform w :=
  sorry

theorem geometricMeasure_residueClass (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1)
    (m a : ℕ) (ha : 0 < a) (ham : a ≤ p ^ m) :
    geometricMeasure (p := p) w hw hw1 (residueClassIndicator m a) = w ^ a / (1 - w ^ (p ^ m)) :=
  sorry

/-- Polynomial moments (RJW Corollary 3.30): `∫ x^j dμ_w = (∂^j A_{μ_w})(0) = Li_{-j}(w)`. -/
theorem geometricMeasure_moment (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) (j : ℕ) :
    geometricMeasure (p := p) w hw hw1 (powFun j) =
      PowerSeries.coeff 0 (dop^[j] (geometricTransform w)) :=
  sorry

theorem geometricMeasure_eq_tsum_dirac (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1)
    (hlt : ‖w‖ < 1) (f : C(ℤ_[p], K)) :
    HasSum (fun n : ℕ => w ^ (n + 1) * f ((n + 1 : ℕ) : ℤ_[p]))
      (geometricMeasure (p := p) w hw hw1 f) :=
  sorry

theorem geometricMeasure_norm_le_one (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1)
    (f : C(ℤ_[p], K)) (hf : ‖f‖ ≤ 1) :
    ‖geometricMeasure (p := p) w hw hw1 f‖ ≤ 1 :=
  sorry

-- geometricMeasure_psi: not stated; needs the operator ψ on measures
--   (PadicMeasuresIwasawaAlgebras:L2): ψ(μ_w) = μ_{w^p}, Res_{pℤ_p} μ_w = φ(μ_{w^p}).
-- geometricMeasure_rotate: not stated; needs multiplication of a measure by ξ^x
--   (PadicMeasuresIwasawaAlgebras:L2): ξ^x μ_w = μ_{ξ w} for ξ ∈ μ_{p^∞}.
-- geometricMeasure_galois: not stated; needs the action of continuous automorphisms of ℂ_p on
--   measures: σ ∘ μ_w = μ_{σ w}.

/-- Test `geometricMeasure_total_mass` (computation). -/
example (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) :
    geometricMeasure (p := p) w hw hw1 1 = w / (1 - w) :=
  sorry

/-- Test `geometricMeasure_residue_classes_p3` (computation): `p = 3`, `w = -1`. -/
example [Fact (Nat.Prime 3)] (hw : ‖(-1 : ℚ_[3])‖ ≤ 1) (hw1 : ‖(-1 : ℚ_[3]) - 1‖ = 1) :
    geometricMeasure (p := 3) (-1 : ℚ_[3]) hw hw1 (residueClassIndicator 1 1) = -1 / 2 ∧
    geometricMeasure (p := 3) (-1 : ℚ_[3]) hw hw1 (residueClassIndicator 1 2) = 1 / 2 ∧
    geometricMeasure (p := 3) (-1 : ℚ_[3]) hw hw1 (residueClassIndicator 1 3) = -1 / 2 :=
  sorry

/-- Test `geometricMeasure_zero` (degenerate). -/
example (h0 : ‖(0 : K)‖ ≤ 1) (h1 : ‖(0 : K) - 1‖ = 1) :
    geometricMeasure (p := p) (0 : K) h0 h1 = 0 :=
  sorry

/-- Test `geometricMeasure_small` (compatibility): for `‖w‖ < 1` the negative moments on
`ℤ_p^×` are `∑_{p ∤ n} wⁿ n^{-k}`. -/
example (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) (hlt : ‖w‖ < 1) (k : ℕ) :
    HasSum (fun n : ℕ => if p ∣ (n + 1) then 0 else w ^ (n + 1) / ((n + 1 : ℕ) : K) ^ k)
      (geometricMeasure (p := p) w hw hw1 (unitsZPow (k : ℤ))) :=
  sorry

/-- Test `geometricMeasure_not_near_one` (non-example): no measure has the transform
`Li₀(ζ(1+T))` for a primitive `p`-th root of unity `ζ`. -/
example (ζ : K) (hζ : IsPrimitiveRoot ζ p) (hζ1 : ‖ζ - 1‖ < 1) :
    ¬ ∃ μ : D(ℤ_[p], K), μ.amiceTransform = geometricTransform ζ :=
  sorry

/-! ### Properties of Coleman's polylogarithms used in L3 (proved in ColemanIntegration:L2) -/

/-- Taylor expansion at `T = 0` of `T ↦ Li k (w (1 + T))`. -/
def polylogPrimitive (Li : ℕ → K → K) (w : K) (k : ℕ) : K⟦X⟧ :=
  PowerSeries.mk fun n => iteratedDeriv n (fun t => Li k (w * (1 + t))) 0 / (n.factorial : K)

/-- `Li₀(z) = z/(1 - z)` and `z d/dz Li_k = Li_{k-1}` off the residue disc of `1`. -/
def SatisfiesPolylogODE (Li : ℕ → K → K) : Prop :=
  (∀ z : K, z ≠ 1 → Li 0 z = z / (1 - z)) ∧
    ∀ k : ℕ, 1 ≤ k → ∀ z : K, z ≠ 0 → ‖z‖ ≤ 1 → ‖z - 1‖ = 1 →
      HasDerivAt (Li k) (Li (k - 1) z / z) z

/-- On every residue disc of a point `w` with `‖w‖ ≤ 1`, `‖w - 1‖ = 1`, `Li k` is one power
series converging on the whole disc (ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs). -/
def HasResidueDiscExpansions (Li : ℕ → K → K) : Prop :=
  ∀ k : ℕ, ∀ w : K, ‖w‖ ≤ 1 → ‖w - 1‖ = 1 →
    IsOpenDiscSeries (polylogPrimitive Li w k) ∧
      ∀ t : K, ‖t‖ < 1 →
        HasSum (fun n => PowerSeries.coeff n (polylogPrimitive Li w k) * t ^ n) (Li k (w * (1 + t)))

/-- The distribution relation `∑_{ξ ∈ μ_p} Li_k(ξ z) = p^{1-k} Li_k(z^p)` for `z^p ≠ 1`
(ColemanIntegration:L2/distribution-relation); used when `K` contains `μ_p`. -/
def SatisfiesDistributionRelation (Li : ℕ → K → K) : Prop :=
  ∀ k : ℕ, ∀ z : K, z ^ p ≠ 1 →
    ∑ ξ ∈ Polynomial.nthRootsFinset p (1 : K), Li k (ξ * z) = (p : K) ^ ((1 : ℤ) - k) * Li k (z ^ p)

/-- On the punctured residue disc of `1`,
`Li_k(z) = -(log z)^{k-1}/(k-1)! · log(1 - z) + h_k(z)` with `h_k` analytic on the disc
(ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs, residue disc of `1`). -/
def HasLocalFormAtOne (Li : ℕ → K → K) (plog : K → K) : Prop :=
  ∀ k : ℕ, 1 ≤ k → ∃ h : K → K, AnalyticOnNhd K h (Metric.ball 1 1) ∧
    ∀ z ∈ Metric.ball (1 : K) 1, z ≠ 1 →
      Li k z = -(plog z) ^ (k - 1) / ((k - 1).factorial : K) * plog (1 - z) + h z

/-! ### Taylor expansions on residue discs (ColemanIntegration:L3/polylog-primitive-on-residue-disc) -/

section Primitive

variable (Li : ℕ → K → K)

theorem polylogPrimitive_mem_openDisc (hexp : HasResidueDiscExpansions Li) (w : K)
    (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) (k : ℕ) :
    IsOpenDiscSeries (polylogPrimitive Li w k) :=
  sorry

theorem polylogPrimitive_eval (hexp : HasResidueDiscExpansions Li) (w : K) (hw : ‖w‖ ≤ 1)
    (hw1 : ‖w - 1‖ = 1) (k : ℕ) (t : K) (ht : ‖t‖ < 1) :
    evalSeries (polylogPrimitive Li w k) t = Li k (w * (1 + t)) :=
  sorry

theorem polylogPrimitive_zero (hODE : SatisfiesPolylogODE Li) (hexp : HasResidueDiscExpansions Li)
    (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) :
    polylogPrimitive Li w 0 = geometricTransform w :=
  sorry

theorem polylogPrimitive_derivation (hODE : SatisfiesPolylogODE Li)
    (hexp : HasResidueDiscExpansions Li) (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1)
    (k : ℕ) (hk : 1 ≤ k) :
    dop (polylogPrimitive Li w k) = polylogPrimitive Li w (k - 1) :=
  sorry

theorem polylogPrimitive_of_norm_lt_one
    (hser : ∀ k : ℕ, 1 ≤ k → ∀ z : K, ‖z‖ < 1 →
      HasSum (fun n : ℕ => z ^ (n + 1) / ((n + 1 : ℕ) : K) ^ k) (Li k z))
    (w : K) (hw : ‖w‖ < 1) (k : ℕ) (hk : 1 ≤ k) (t : K) (ht : ‖t‖ < 1) :
    HasSum (fun n : ℕ => (w * (1 + t)) ^ (n + 1) / ((n + 1 : ℕ) : K) ^ k)
      (evalSeries (polylogPrimitive Li w k) t) :=
  sorry

-- polylogDistribution: not stated; needs locally analytic distributions D^la(ℤ_p, K) with the
--   Amice bijection onto R⁺ (LocallyAnalyticDistributions:L1, RJW Theorem 3.43).
-- polylogDistribution_mul_x_pow: not stated; same reason (x^k · μ̃^{(k)}_w = μ_w).

/-- Test `polylogPrimitive_at_zero_point` (degenerate). -/
example (hLi0 : ∀ k : ℕ, Li k 0 = 0) (k : ℕ) : polylogPrimitive Li 0 k = 0 :=
  sorry

/-- Test `polylogPrimitive_weight_one` (computation), with `Li₁(z) = -log(1 - z)`. -/
example (plog : K → K) (hLi1 : ∀ z : K, z ≠ 1 → Li 1 z = -plog (1 - z))
    (hexp : HasResidueDiscExpansions Li) (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) (m : ℕ) :
    PowerSeries.coeff (m + 1) (polylogPrimitive Li w 1) = (w / (1 - w)) ^ (m + 1) / ((m + 1 : ℕ) : K) :=
  sorry

/-- Test `polylogPrimitive_derivation_weight_one` (characterisation). -/
example (hODE : SatisfiesPolylogODE Li) (hexp : HasResidueDiscExpansions Li) (w : K)
    (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) :
    dop (polylogPrimitive Li w 1) = geometricTransform w :=
  sorry

/-- Test `polylogPrimitive_small_w` (compatibility). -/
example (hser : ∀ k : ℕ, 1 ≤ k → ∀ z : K, ‖z‖ < 1 →
      HasSum (fun n : ℕ => z ^ (n + 1) / ((n + 1 : ℕ) : K) ^ k) (Li k z))
    (w : K) (hw : ‖w‖ < 1) (k : ℕ) (hk : 1 ≤ k) :
    evalSeries (polylogPrimitive Li w k) 0 = Li k w :=
  sorry

/-- Test `polylogPrimitive_not_near_one` (non-example): at a primitive `p`-th root of unity the
Taylor series of `Li₁(ζ(1+T))` does not converge on the open unit disc. -/
example (plog : K → K) (hplog : ∀ x : K, x ≠ 0 → HasDerivAt plog x⁻¹ x)
    (hLi1 : ∀ z : K, z ≠ 1 → Li 1 z = -plog (1 - z)) (ζ : K)
    (hζ : IsPrimitiveRoot ζ p) (hζ1 : ‖ζ - 1‖ < 1) :
    ¬ IsOpenDiscSeries (polylogPrimitive Li ζ 1) :=
  sorry

end Primitive

/-! ### Negative moments on `ℤ_p^×` -/

/-- ColemanIntegration:L3/unit-moment-via-distribution-primitive, stated without distributions:
if `∂^k F = A_μ` with `F ∈ R⁺`, then `∫_{ℤ_p^×} x^{-k} dμ = F(0) - p⁻¹ ∑_{ξ ∈ μ_p} F(ξ - 1)`. -/
theorem negMoment_eq_of_primitive (μ : D(ℤ_[p], K)) (k : ℕ) (F : K⟦X⟧)
    (hF : IsOpenDiscSeries F) (hder : dop^[k] F = μ.amiceTransform)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p) :
    μ (unitsZPow (k : ℤ)) =
      evalSeries F 0 - (p : K)⁻¹ * ∑ ξ ∈ Polynomial.nthRootsFinset p (1 : K), evalSeries F (ξ - 1) :=
  sorry

/-- ColemanIntegration:L3/negative-moments-of-geometric-measure:
`∫_{ℤ_p^×} x^{-k} dμ_w = Li_k(w) - p^{-k} Li_k(w^p)`. -/
theorem negMoment_geometricMeasure (Li : ℕ → K → K) (hODE : SatisfiesPolylogODE Li)
    (hexp : HasResidueDiscExpansions Li) (hdist : SatisfiesDistributionRelation (p := p) Li)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p)
    (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) (k : ℕ) (hk : 1 ≤ k) :
    geometricMeasure (p := p) w hw hw1 (unitsZPow (k : ℤ)) =
      Li k w - (p : K) ^ (-(k : ℤ)) * Li k (w ^ p) :=
  sorry

/-- ColemanIntegration:L3/negative-moment-riemann-sums (BHYY Lemma 3.3 with `F = ℚ`). -/
theorem tendsto_riemannSum_negMoment (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) (k : ℤ) :
    Tendsto (fun r : ℕ => (1 - w ^ (p ^ r))⁻¹ *
        ∑ a ∈ (Finset.range (p ^ r)).filter (fun a => ¬ p ∣ a), (a : K) ^ (-k) * w ^ a)
      atTop (𝓝 (geometricMeasure (p := p) w hw hw1 (unitsZPow k))) :=
  sorry

/-! ### The smoothed polylogarithm (ColemanIntegration:L3/smoothed-polylog-combination) -/

section Smoothed

variable (Li : ℕ → K → K) (plog : K → K)

open scoped Classical in
/-- `Φ^{(k)}_b(z) = -Li_k(z) + b^{1-k} Li_k(z^b) + (b - 1) log(z)^k/k!` on the residue disc of
`1`, with its analytic value at `z = 1`. -/
def smoothedPolylog (b k : ℕ) (z : K) : K :=
  if z = 1 then
    (if k = 0 then ((b : K) - 1) / 2
     else if k = 1 then -plog (b : K)
     else -(1 - (b : K) ^ ((1 : ℤ) - k)) * Li k 1)
  else -Li k z + (b : K) ^ ((1 : ℤ) - k) * Li k (z ^ b) + ((b : K) - 1) * plog z ^ k / (k.factorial : K)

theorem smoothedPolylog_analyticOnNhd (hODE : SatisfiesPolylogODE Li)
    (hloc : HasLocalFormAtOne Li plog) (b : ℕ) (hb : 1 < b) (hbp : ¬ p ∣ b) (k : ℕ) :
    AnalyticOnNhd K (smoothedPolylog Li plog b k) (Metric.ball 1 1) :=
  sorry

theorem smoothedPolylog_eq (b k : ℕ) (z : K) (hz : z ≠ 1) :
    smoothedPolylog Li plog b k z =
      -Li k z + (b : K) ^ ((1 : ℤ) - k) * Li k (z ^ b) + ((b : K) - 1) * plog z ^ k / (k.factorial : K) :=
  sorry

theorem smoothedPolylog_zero (hODE : SatisfiesPolylogODE Li) (b : ℕ) (z : K) (hz : z ≠ 1)
    (hzb : z ^ b ≠ 1) (hlog0 : plog z ^ 0 = 1) :
    smoothedPolylog Li plog b 0 z = 1 / (z - 1) - (b : K) / (z ^ b - 1) :=
  sorry

theorem smoothedPolylog_deriv (hODE : SatisfiesPolylogODE Li) (hloc : HasLocalFormAtOne Li plog)
    (b : ℕ) (hb : 1 < b) (hbp : ¬ p ∣ b) (k : ℕ) (hk : 1 ≤ k) (z : K)
    (hz : z ∈ Metric.ball (1 : K) 1) :
    HasDerivAt (smoothedPolylog Li plog b k) (smoothedPolylog Li plog b (k - 1) z / z) z :=
  sorry

theorem smoothedPolylog_one (b k : ℕ) (hk : 2 ≤ k) :
    smoothedPolylog Li plog b k 1 = -(1 - (b : K) ^ ((1 : ℤ) - k)) * Li k 1 :=
  sorry

theorem smoothedPolylog_rootOfUnity (b k : ℕ) (ζ : K) (hζ1 : ζ ≠ 1) (hlog : plog ζ = 0)
    (hk : 1 ≤ k) :
    smoothedPolylog Li plog b k ζ = -Li k ζ + (b : K) ^ ((1 : ℤ) - k) * Li k (ζ ^ b) :=
  sorry

/-- The composite `Φ^{(k)}_b(w(1+T))` lies in `R⁺` and `∂^k` of it is the Amice transform of
`w^x μ_b`, which is `F_b(w(1+T) - 1)`; here that transform is written as a rational expression. -/
theorem smoothedPolylog_expansion (hODE : SatisfiesPolylogODE Li)
    (hloc : HasLocalFormAtOne Li plog) (b : ℕ) (hb : 1 < b) (hbp : ¬ p ∣ b) (k : ℕ) (w : K)
    (hw : ‖w - 1‖ < 1) :
    ∃ F : K⟦X⟧, IsOpenDiscSeries F ∧
      (∀ t : K, ‖t‖ < 1 → evalSeries F t = smoothedPolylog Li plog b k (w * (1 + t))) ∧
      dop^[k] F = (PowerSeries.C w * (1 + PowerSeries.X) - 1)⁻¹ -
        (b : K) • ((PowerSeries.C w * (1 + PowerSeries.X)) ^ b - 1)⁻¹ :=
  sorry

-- smoothedPolylog_branch_independent: not stated; needs the valuation v on ℂ_p and the
--   branch-change formula Li_{k,λ} - Li_{k,λ'} = -v(1-z)(λ-λ')(log z)^{k-1}/(k-1)!
--   (ColemanIntegration:L2; Besser–de Jeu Proposition 2.6).

/-- ColemanIntegration:L3/smoothed-polylog-distribution-relation. -/
theorem smoothedPolylog_distribution (hODE : SatisfiesPolylogODE Li)
    (hloc : HasLocalFormAtOne Li plog) (hdist : SatisfiesDistributionRelation (p := p) Li)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p)
    (b : ℕ) (hb : 1 < b) (hbp : ¬ p ∣ b) (k : ℕ) (w : K) (hw : ‖w - 1‖ < 1) :
    ∑ ξ ∈ Polynomial.nthRootsFinset p (1 : K), smoothedPolylog Li plog b k (ξ * w) =
      (p : K) ^ ((1 : ℤ) - k) * smoothedPolylog Li plog b k (w ^ p) :=
  sorry

/-- Test `smoothedPolylog_weight_one` (computation): RJW's `F̃_b(t) = log(t(1+t)^{b-1}/((1+t)^b - 1))`. -/
example (hLi1 : ∀ z : K, z ≠ 1 → Li 1 z = -plog (1 - z))
    (hmul : ∀ x y : K, x ≠ 0 → y ≠ 0 → plog (x * y) = plog x + plog y)
    (b : ℕ) (t : K) (ht0 : t ≠ 0) (ht : ‖t‖ < 1) (htb : (1 + t) ^ b ≠ 1) :
    smoothedPolylog Li plog b 1 (1 + t) = plog (t * (1 + t) ^ (b - 1) / ((1 + t) ^ b - 1)) :=
  sorry

/-- Test `smoothedPolylog_weight_zero` (degenerate): `Φ^{(0)}_b(1) = F_b(0) = (b - 1)/2`. -/
example (b : ℕ) : smoothedPolylog Li plog b 0 1 = ((b : K) - 1) / 2 :=
  sorry

/-- Test `smoothedPolylog_b_eq_one` (degenerate): for `b = 1` the combination vanishes. -/
example (k : ℕ) (z : K) (hz : z ≠ 1) : smoothedPolylog Li plog 1 k z = 0 :=
  sorry

/-- Test `smoothedPolylog_parts_singular` (non-example): `Li₁ = -log(1 - z)` alone has no
analytic extension over `z = 1`, because a branch of the logarithm has no limit at `0`
(for the Iwasawa branch, `log_p(p^m) = 0` while `log_p(p^m (1 + p)) = log(1 + p) ≠ 0`). -/
example (hLi1 : ∀ z : K, z ≠ 1 → Li 1 z = -plog (1 - z))
    (hnolim : ¬ ∃ L : K, Tendsto plog (𝓝[≠] 0) (𝓝 L)) :
    ¬ ∃ h : K → K, AnalyticOnNhd K h (Metric.ball 1 1) ∧
      ∀ z ∈ Metric.ball (1 : K) 1, z ≠ 1 → h z = Li 1 z :=
  sorry

-- Test `smoothedPolylog_branch_invariance` (characterisation): not stated; needs the valuation
--   on ℂ_p (see smoothedPolylog_branch_independent).

end Smoothed

/-- ColemanIntegration:L3/negative-moments-of-smoothed-measure, for a measure `ν` with the
Amice transform of `w^x μ_b`. -/
theorem negMoment_smoothedMeasure (Li : ℕ → K → K) (plog : K → K)
    (hODE : SatisfiesPolylogODE Li) (hloc : HasLocalFormAtOne Li plog)
    (hdist : SatisfiesDistributionRelation (p := p) Li)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p)
    (b : ℕ) (hb : 1 < b) (hbp : ¬ p ∣ b) (w : K) (hw : ‖w - 1‖ < 1) (ν : D(ℤ_[p], K))
    (hν : ν.amiceTransform = (PowerSeries.C w * (1 + PowerSeries.X) - 1)⁻¹ -
        (b : K) • ((PowerSeries.C w * (1 + PowerSeries.X)) ^ b - 1)⁻¹)
    (k : ℕ) (hk : 1 ≤ k) :
    ν (unitsZPow (k : ℤ)) =
      smoothedPolylog Li plog b k w - (p : K) ^ (-(k : ℤ)) * smoothedPolylog Li plog b k (w ^ p) :=
  sorry

/-! ### Character sums -/

/-- ColemanIntegration:L3/primitive-character-fibre-sum-vanishes. -/
theorem sum_mul_comp_unitsMap_eq_zero {R : Type*} [CommRing R] [IsDomain R] {N M : ℕ}
    [NeZero N] (θ : DirichletCharacter R N) (hθ : θ.IsPrimitive) (hM : M ∣ N) (hMN : M ≠ N)
    (f : (ZMod M)ˣ → R) :
    ∑ c : (ZMod N)ˣ, θ (c : ZMod N) * f (ZMod.unitsMap hM c) = 0 :=
  sorry

/-- ColemanIntegration:L3/euler-factor-from-p-power-map. -/
theorem sum_inv_mul_comp_pow_eq {F : Type*} [Field F] {N : ℕ} [NeZero N]
    (θ : DirichletCharacter F N) (hθ : θ.IsPrimitive) (ε : F) (hε : IsPrimitiveRoot ε N)
    (f : F → F) :
    ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * f (ε ^ (p * (c : ZMod N).val)) =
      θ (p : ZMod N) * ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * f (ε ^ (c : ZMod N).val) :=
  sorry

/-- ColemanIntegration:L3/gauss-sum-root-of-unity-independence. -/
theorem gaussSum_inv_mul_sum_indep {F : Type*} [Field F] {N : ℕ} [NeZero N]
    (θ : DirichletCharacter F N) (hθ : θ.IsPrimitive) (hθ1 : θ ≠ 1)
    (ε ε' : F) (hε : IsPrimitiveRoot ε N) (hε' : IsPrimitiveRoot ε' N) (f : F → F) :
    (gaussSum θ⁻¹ (AddChar.zmodChar N hε.pow_eq_one))⁻¹ *
        ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * f (ε ^ (c : ZMod N).val) =
      (gaussSum θ⁻¹ (AddChar.zmodChar N hε'.pow_eq_one))⁻¹ *
        ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * f (ε' ^ (c : ZMod N).val) :=
  sorry

/-! ### Coleman's formula (ColemanIntegration:L3/coleman-formula), moment form -/

/-- RJW Lemma 5.12: the Amice transform `F_θ` of `μ_θ` (owned by DirichletPadicLFunctions:L2). -/
def rjwThetaTransform {N : ℕ} [NeZero N] (θ : DirichletCharacter K N) (ε : K)
    (hε : ε ^ N = 1) : K⟦X⟧ :=
  -(gaussSum θ⁻¹ (AddChar.zmodChar N hε))⁻¹ •
    ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) •
      (PowerSeries.C (ε ^ (c : ZMod N).val) * (1 + PowerSeries.X) - 1)⁻¹

/-- ColemanIntegration:L3/mu-theta-as-sum-of-geometric-measures, on transforms. -/
theorem rjwThetaTransform_eq_sum_geometricTransform {N : ℕ} [NeZero N]
    (θ : DirichletCharacter K N) (hθ : θ.IsPrimitive) (hθ1 : θ ≠ 1) (ε : K)
    (hε : IsPrimitiveRoot ε N) :
    rjwThetaTransform θ ε hε.pow_eq_one =
      (gaussSum θ⁻¹ (AddChar.zmodChar N hε.pow_eq_one))⁻¹ •
        ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) • geometricTransform (ε ^ (c : ZMod N).val) :=
  sorry

/-- Coleman's formula for tame part `D > 1`, in moment form: for `μ_θ` with Amice transform
`F_θ`, `∫_{ℤ_p^×} x^{-k} dμ_θ = (1 - θ(p) p^{-k}) G(θ⁻¹)⁻¹ ∑_c θ⁻¹(c) Li_k(ε^c)`. The
hypothesis `hεc` holds exactly when `N` is not a power of `p`. -/
theorem negMoment_muTheta_eq_colemanSum {N : ℕ} [NeZero N] (θ : DirichletCharacter K N)
    (hθ : θ.IsPrimitive) (hθ1 : θ ≠ 1) (ε : K) (hε : IsPrimitiveRoot ε N)
    (hεc : ∀ c : (ZMod N)ˣ, ‖ε ^ (c : ZMod N).val - 1‖ = 1)
    (μ : D(ℤ_[p], K)) (hμ : μ.amiceTransform = rjwThetaTransform θ ε hε.pow_eq_one)
    (Li : ℕ → K → K) (hODE : SatisfiesPolylogODE Li) (hexp : HasResidueDiscExpansions Li)
    (hdist : SatisfiesDistributionRelation (p := p) Li)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p) (k : ℕ) (hk : 1 ≤ k) :
    μ (unitsZPow (k : ℤ)) =
      (1 - θ (p : ZMod N) * (p : K) ^ (-(k : ℤ))) *
        (gaussSum θ⁻¹ (AddChar.zmodChar N hε.pow_eq_one))⁻¹ *
          ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * Li k (ε ^ (c : ZMod N).val) :=
  sorry

/-- RJW Lemma 5.4 applied to `μ_b`: the Amice transform of `μ_{χ,b} = (μ_b)_χ`
(owned by DirichletPadicLFunctions:L2), written through the rational expression for
`F_b((1+T)ε^c - 1)`. -/
def smoothedTwistTransform {n : ℕ} [NeZero (p ^ n)] (χ : DirichletCharacter K (p ^ n)) (ε : K)
    (hε : ε ^ (p ^ n) = 1) (b : ℕ) : K⟦X⟧ :=
  (gaussSum χ⁻¹ (AddChar.zmodChar (p ^ n) hε))⁻¹ •
    ∑ c : (ZMod (p ^ n))ˣ, χ⁻¹ (c : ZMod (p ^ n)) •
      ((PowerSeries.C (ε ^ (c : ZMod (p ^ n)).val) * (1 + PowerSeries.X) - 1)⁻¹ -
        (b : K) • ((PowerSeries.C (ε ^ (c : ZMod (p ^ n)).val) * (1 + PowerSeries.X)) ^ b - 1)⁻¹)

/-- Coleman's formula for pure `p`-power conductor, in moment form through the smoothed
measure: `(χ(b) b^{1-k} - 1)⁻¹ ∫_{ℤ_p^×} x^{-k} dμ_{χ,b} = G(χ⁻¹)⁻¹ ∑_c χ⁻¹(c) Li_k(ε^c)`. -/
theorem negMoment_smoothedTwist_eq_colemanSum {n : ℕ} [NeZero (p ^ n)] (hn : 1 ≤ n)
    (χ : DirichletCharacter K (p ^ n)) (hχ : χ.IsPrimitive) (ε : K)
    (hε : IsPrimitiveRoot ε (p ^ n)) (hεc : ‖ε - 1‖ < 1)
    (Li : ℕ → K → K) (plog : K → K) (hODE : SatisfiesPolylogODE Li)
    (hloc : HasLocalFormAtOne Li plog) (hdist : SatisfiesDistributionRelation (p := p) Li)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p)
    (hlog : ∀ c : (ZMod (p ^ n))ˣ, plog (ε ^ (c : ZMod (p ^ n)).val) = 0)
    (k : ℕ) (hk : 1 ≤ k) (b : ℕ) (hb : 1 < b) (hbp : ¬ p ∣ b)
    (hχb : χ (b : ZMod (p ^ n)) * (b : K) ^ ((1 : ℤ) - k) ≠ 1)
    (μ : D(ℤ_[p], K)) (hμ : μ.amiceTransform = smoothedTwistTransform χ ε hε.pow_eq_one b) :
    (χ (b : ZMod (p ^ n)) * (b : K) ^ ((1 : ℤ) - k) - 1)⁻¹ * μ (unitsZPow (k : ℤ)) =
      (gaussSum χ⁻¹ (AddChar.zmodChar (p ^ n) hε.pow_eq_one))⁻¹ *
        ∑ c : (ZMod (p ^ n))ˣ, χ⁻¹ (c : ZMod (p ^ n)) * Li k (ε ^ (c : ZMod (p ^ n)).val) :=
  sorry

-- colemanFormula: L_p(θ ω^{1-k}, k) = (1 - θ(p) p^{-k}) G(θ⁻¹)⁻¹ ∑_c θ⁻¹(c) Li_k(ε_N^c) —
--   not stated in L_p form; needs the p-adic L-function of DirichletPadicLFunctions:L3
--   (RJW Definition 5.18 and (5.7)). It is `negMoment_muTheta_eq_colemanSum` (D > 1) and
--   `negMoment_smoothedTwist_eq_colemanSum` (D = 1) combined with
--   ColemanIntegration:L3/padic-value-as-negative-moment and
--   ColemanIntegration:L3/padic-value-as-smoothed-negative-moment.
-- colemanFormula_rjwNormalisation: L_p(θ, k) through the primitive character attached to
--   θ ω^{k-1}; not stated for the same reason.
-- colemanFormula_trivialCharacter: L_p(ω^{1-k}, k) = (1 - p^{-k}) Li_k(1), k ≥ 2; not stated in
--   L_p form; its moment form is `negMoment_smoothedMeasure` at `w = 1` with `smoothedPolylog_one`.

/-! ### The complex formula (ColemanIntegration:L3/complex-coleman-formula) -/

/-- `L(θ, s) = G(θ⁻¹)⁻¹ ∑_c θ⁻¹(c) expZeta(c/N, s)` for every `s`, `θ` primitive, `N ≥ 2`. -/
theorem LFunction_eq_gaussSum_inv_mul_sum_expZeta {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ N) (hθ : θ.IsPrimitive) (hN : 2 ≤ N) (s : ℂ) :
    DirichletCharacter.LFunction θ s =
      (gaussSum θ⁻¹ ZMod.stdAddChar)⁻¹ *
        ∑ c : ZMod N, θ⁻¹ c * HurwitzZeta.expZeta (ZMod.toAddCircle c) s :=
  sorry

/-- ColemanIntegration:L3/complex-polylog-at-roots-of-unity, for any function with the defining
series on the open disc and continuity on the closed disc (the principal-branch polylogarithm of
Polylogarithms:P.1 has both). -/
theorem polylog_exp_eq_expZeta (polylogC : ℕ → ℂ → ℂ)
    (hseries : ∀ k : ℕ, ∀ z : ℂ, ‖z‖ < 1 →
      HasSum (fun n : ℕ => z ^ (n + 1) / ((n + 1 : ℕ) : ℂ) ^ k) (polylogC k z))
    (hcont : ∀ k : ℕ, 2 ≤ k → ContinuousOn (polylogC k) (Metric.closedBall 0 1))
    (k : ℕ) (hk : 2 ≤ k) (a : ℝ) :
    polylogC k (Complex.exp (2 * Real.pi * Complex.I * a)) = HurwitzZeta.expZeta a k :=
  sorry

/-- RJW Theorem 6.7(i) for `k ≥ 2` (the case `k = 1` is RJW Theorem 6.1(i),
DirichletPadicLFunctions:L3). -/
theorem LFunction_nat_eq_gaussSum_inv_mul_sum_polylog {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ N) (hθ : θ.IsPrimitive) (hN : 2 ≤ N) (polylogC : ℕ → ℂ → ℂ)
    (hseries : ∀ k : ℕ, ∀ z : ℂ, ‖z‖ < 1 →
      HasSum (fun n : ℕ => z ^ (n + 1) / ((n + 1 : ℕ) : ℂ) ^ k) (polylogC k z))
    (hcont : ∀ k : ℕ, 2 ≤ k → ContinuousOn (polylogC k) (Metric.closedBall 0 1))
    (k : ℕ) (hk : 2 ≤ k) :
    DirichletCharacter.LFunction θ k =
      (gaussSum θ⁻¹ ZMod.stdAddChar)⁻¹ * ∑ c : ZMod N, θ⁻¹ c * polylogC k (ZMod.stdAddChar c) :=
  sorry

/-! ### The modified p-adic polylogarithm (ColemanIntegration:L3/padic-regulator-polylogarithm) -/

section Regulator

variable (Li : ℕ → K → K) (plog : K → K)

/-- `L^mod_n(z) = ∑_{j<n} (B_j/j!) Li_{n-j}(z) log(z)^j` (Besser–de Jeu Remark 1.5). -/
def padicRegulatorPolylog (n : ℕ) (z : K) : K :=
  ∑ j ∈ Finset.range n, ((bernoulli j : ℚ) : K) / (j.factorial : K) * Li (n - j) z * plog z ^ j

theorem padicRegulatorPolylog_inv
    (hinv : ∀ m : ℕ, 1 ≤ m → ∀ z : K, z ≠ 0 → z ≠ 1 →
      Li m z + (-1) ^ m * Li m z⁻¹ = -(plog z ^ m) / (m.factorial : K))
    (hloginv : ∀ z : K, z ≠ 0 → plog z⁻¹ = -plog z)
    (n : ℕ) (hn : 2 ≤ n) (z : K) (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    padicRegulatorPolylog Li plog n z + (-1) ^ n * padicRegulatorPolylog Li plog n z⁻¹ = 0 :=
  sorry

theorem padicRegulatorPolylog_distribution (hdist : SatisfiesDistributionRelation (p := p) Li)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p)
    (hlogμ : ∀ ξ ∈ Polynomial.nthRootsFinset p (1 : K), ∀ z : K, z ≠ 0 → plog (ξ * z) = plog z)
    (hlogpow : ∀ z : K, z ≠ 0 → plog (z ^ p) = p * plog z)
    (n : ℕ) (hn : 2 ≤ n) (z : K) (hz0 : z ≠ 0) (hzp : z ^ p ≠ 1) :
    padicRegulatorPolylog Li plog n (z ^ p) =
      (p : K) ^ (n - 1) * ∑ ξ ∈ Polynomial.nthRootsFinset p (1 : K), padicRegulatorPolylog Li plog n (ξ * z) :=
  sorry

theorem padicRegulatorPolylog_rootOfUnity (n : ℕ) (hn : 1 ≤ n) (ζ : K) (hlog : plog ζ = 0) :
    padicRegulatorPolylog Li plog n ζ = Li n ζ :=
  sorry

theorem padicRegulatorPolylog_two (z : K) :
    padicRegulatorPolylog Li plog 2 z = Li 2 z - 1 / 2 * plog z * Li 1 z :=
  sorry

-- padicRegulatorPolylog_galois: not stated; needs continuous automorphisms of ℂ_p over ℚ_p and
--   Galois equivariance of Coleman's Li_n (Besser–de Jeu Remark 2.3).
-- padicRegulatorPolylog_specialUnit_branch: not stated; needs the branch-change formula of
--   ColemanIntegration:L2 (independence on special units).

/-- Test `padicRegulatorPolylog_weight_two` (computation). -/
example (z : K) :
    padicRegulatorPolylog Li plog 2 z = Li 2 z + ((bernoulli 1 : ℚ) : K) * Li 1 z * plog z :=
  sorry

/-- Test `padicRegulatorPolylog_at_root_of_unity` (degenerate). -/
example (n : ℕ) (hn : 2 ≤ n) (ζ : K) (hlog : plog ζ = 0) :
    padicRegulatorPolylog Li plog n ζ = Li n ζ :=
  sorry

/-- Test `padicRegulatorPolylog_inversion` (characterisation), at `n = 2`, `z = 2`. -/
example (hinv : ∀ m : ℕ, 1 ≤ m → ∀ z : K, z ≠ 0 → z ≠ 1 →
      Li m z + (-1) ^ m * Li m z⁻¹ = -(plog z ^ m) / (m.factorial : K))
    (hloginv : ∀ z : K, z ≠ 0 → plog z⁻¹ = -plog z) (h2 : (2 : K) ≠ 0) (h21 : (2 : K) ≠ 1) :
    padicRegulatorPolylog Li plog 2 2 + padicRegulatorPolylog Li plog 2 (1 / 2) = 0 :=
  sorry

/-- Test `padicRegulatorPolylog_ne_Li` (non-example): off roots of unity `L^mod_2 ≠ Li_2`. -/
example (z : K) (hlog : plog z ≠ 0) (hLi1 : Li 1 z ≠ 0) :
    padicRegulatorPolylog Li plog 2 z ≠ Li 2 z :=
  sorry

-- Test `padicRegulatorPolylog_vs_complex` (compatibility): not stated; needs Zagier's complex
--   single-valued polylogarithm P_n (Polylogarithms:P.1/single-valued-polylogarithm).

end Regulator

/-! ### Regulators and the p-adic Beilinson conjecture -/

-- syntomicRegulator_cyclotomic (ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements):
--   not stated; needs algebraic K-theory K_{2n-1}^{(n)} of number fields and of p-adic rings,
--   de Jeu's map H^1(M̃_n(F)) → K_{2n-1}(F)_ℚ (Polylogarithms:P.4) and Besser's syntomic
--   regulator (PadicHodgeRegulators:D.2).
-- padicBeilinsonConjecture (ColemanIntegration:L3/padic-beilinson-conjecture): not stated;
--   needs K_{2n-1}(k)_E, Beilinson's and the syntomic regulators, complex and p-adic Artin
--   L-functions with coefficients. It is a `Prop`-valued definition built from those objects,
--   never an assumption.
-- padicBeilinsonConjecture_basis_indep, padicBeilinsonConjecture_coeff_ext,
--   padicBeilinsonConjecture_orthogonal_sum, padicBeilinsonConjecture_dimension_iff,
--   padicBeilinsonConjecture_quotient_group: not stated; same reason.
-- Tests pbc_dirichlet_instance (computation), pbc_trivial_motive (degenerate),
--   pbc_dimension_fails_imaginary_quadratic (non-example), pbc_even_n_totally_real
--   (non-example): not stated; same reason.
-- padicBeilinson_dirichletMotives (ColemanIntegration:L3/padic-beilinson-for-dirichlet-motives)
--   and colemanFormula_syntomicRegulator
--   (ColemanIntegration:L3/coleman-formula-as-syntomic-regulator-formula): not stated; same reason.

end PositiveIntegerValues

/-! ## Links between the layers

Layer L2 was prototyped against the interface `IsLogBranch`, and layer L3 against the predicates
`SatisfiesPolylogODE`, `HasResidueDiscExpansions`, `SatisfiesDistributionRelation` and
`HasLocalFormAtOne`. The statements below instantiate them with the objects of the earlier
layers. -/

section Links

variable (p : ℕ) [Fact p.Prime]

/-- The branch `log_a` of layer L0 has the properties layer L2 uses. -/
theorem isLogBranch_padicLogBranch (a : ℂ_[p]) : IsLogBranch p a (padicLogBranch p a) := by
  sorry

/-- Coleman's p-adic polylogarithm `Li^a_k` for the branch `log_a` of layer L0
(ColemanIntegration:L2/p-adic-polylogarithm). The Iwasawa branch is `a = 0`. -/
def colemanPolylog (a : ℂ_[p]) : ℕ → ℂ_[p] → ℂ_[p] :=
  padicPolylog p (isLogBranch_padicLogBranch p a)

/-- `ℤ_[p]` acts uniformly continuously on the algebraic closure of `ℚ_[p]`, through `ℚ_[p]`. -/
instance padicAlgCl_uniformContinuousConstSMul :
    UniformContinuousConstSMul ℤ_[p] (PadicAlgCl p) :=
  ⟨fun c => by
    have h := uniformContinuous_const_smul (M := ℚ_[p]) (X := PadicAlgCl p) (c : ℚ_[p])
    convert h using 2 with x
    rw [← algebraMap_smul ℚ_[p] c x]
    rfl⟩

/-- `ℂ_[p]` as a `ℤ_[p]`-algebra: the completion of the `ℤ_[p]`-algebra `PadicAlgCl p`. Its scalar
action is Mathlib's action `UniformSpace.Completion.instSMul`. Mathlib at the pinned commit has the
`ℚ_[p]`-algebra structure on `ℂ_[p]` but not this one. -/
noncomputable abbrev padicComplexAlgebra : Algebra ℤ_[p] ℂ_[p] :=
  UniformSpace.Completion.algebra (PadicAlgCl p) ℤ_[p]

/-- The action of `ℤ_[p]` on `ℂ_[p]` is jointly continuous. -/
instance padicComplex_continuousSMul : ContinuousSMul ℤ_[p] ℂ_[p] :=
  ⟨by
    have : (fun q : ℤ_[p] × ℂ_[p] => q.1 • q.2) = fun q => (q.1 : ℚ_[p]) • q.2 := by
      funext q
      exact (algebraMap_smul ℚ_[p] q.1 q.2).symm
    rw [this]
    exact (continuous_subtype_val.comp continuous_fst).smul continuous_snd⟩

attribute [local instance] padicComplexAlgebra

/-- ColemanIntegration:L2/differential-recursion, in the form layer L3 uses. -/
theorem satisfiesPolylogODE_colemanPolylog (a : ℂ_[p]) :
    SatisfiesPolylogODE (colemanPolylog p a) := by
  sorry

/-- ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs, part (c), on the residue
discs of points `w` with `‖w‖ ≤ 1`, `‖w - 1‖ = 1`. -/
theorem hasResidueDiscExpansions_colemanPolylog (a : ℂ_[p]) :
    HasResidueDiscExpansions (colemanPolylog p a) := by
  sorry

/-- ColemanIntegration:L2/distribution-relation for `m = p`. -/
theorem satisfiesDistributionRelation_colemanPolylog (a : ℂ_[p]) :
    SatisfiesDistributionRelation (p := p) (colemanPolylog p a) := by
  sorry

/-- ColemanIntegration:L2/polylogarithms-on-the-punctured-residue-discs, part (a): the local form
on the residue disc of `1`. -/
theorem hasLocalFormAtOne_colemanPolylog (a : ℂ_[p]) :
    HasLocalFormAtOne (colemanPolylog p a) (padicLogBranch p a) := by
  sorry

/-- ColemanIntegration:L2/values-in-finite-extensions: for a branch parameter in a finite extension
`K` of `ℚ_[p]`, the polylogarithms map `K ∖ {1}` into `K`. -/
theorem padicPolylog_mem_intermediateField {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L)
    (K : IntermediateField ℚ_[p] ℂ_[p]) [FiniteDimensional ℚ_[p] K] (ha : a ∈ K) (k : ℕ)
    {z : ℂ_[p]} (hz : z ∈ K) (hz1 : z ≠ 1) : padicPolylog p hL k z ∈ K := by
  sorry

end Links

/-! ## Nodes without a declaration of their own

Every definition, API item and unit test of the packet appears above under its packet name, as a
declaration, an `example` or a `not stated` comment. The following nodes have no declaration of their
own; this list says where they are carried or why they are comments.

* `ColemanIntegration:L1/wide-open-neighbourhood`, `L1/locally-analytic-log-functions`,
  `L1/word-algebra-local-expansion`, `L1/word-algebra-frobenius`, `L1/coleman-integral`: for general
  good-reduction pairs their API items are the `not stated` comments of section `PartA` (they need
  AdicSpacesPartII:F1 and R2); on the tube of `U_N` the prototypes are `puncturedDagger`,
  `puncturedLocAn`, `colemanFunctions` and `exists_basedPrimitive`.
* `L1/punctured-line-based-primitive`: `exists_basedPrimitive`, normalised at a base point of the
  tube; the tangential normalisation at `0` needs the end expansions.
* `L1/punctured-line-singular-disc-expansion`: not stated; needs the Laurent rings of annuli
  (PadicHodgeTheory:P7:annulus-foundations).
* `L2/values-in-finite-extensions`: `padicPolylog_mem_intermediateField` above, and
  `polylogSer_mem_of_mem` on the open unit disc.
* `L2/sums-over-galois-conjugates`: not stated separately; its identities are finite sums of values
  of `padicPolylog` over roots of unity and Galois orbits (see the roadmap document).
* `L3/smoothed-twist-as-sum-of-rotated-measures`: `smoothedTwistTransform` and
  `negMoment_smoothedTwist_eq_colemanSum`.
* `L3/coleman-formula-rjw-normalisation`, `L3/coleman-formula-trivial-character`,
  `L3/recovers-leopoldt-formula`: not stated; they need `L_p(ψ, s)` (DirichletPadicLFunctions:L3).
  Their content in moment form is `negMoment_muTheta_eq_colemanSum`,
  `negMoment_smoothedTwist_eq_colemanSum` and `negMoment_smoothedMeasure`.
* `L3/comparison-with-rjw-distribution-argument`, `L3/comparison-with-bhyy-measure-argument`,
  `L3/coleman-functions-versus-locally-analytic`, `L3/independence-of-branch-and-frobenius-lift`:
  comparisons of proofs and of choices, recorded in the roadmap document. The limit formula they use
  is `tendsto_riemannSum_negMoment`. -/

end TauCeti.ColemanIntegration
