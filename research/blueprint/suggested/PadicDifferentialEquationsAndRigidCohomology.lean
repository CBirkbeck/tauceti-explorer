/-
Suggested Lean prototypes for the roadmap "P-adic differential equations, rigid cohomology and
p-adic weights" (PadicDifferentialEquationsAndRigidCohomology), layers RD.0-RD.7.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology.md` is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof of a planned result is `sorry`; nothing here is claimed to be formalised
(implementationStatus = unchecked). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The file imports Mathlib modules only.

Names are relative to the namespace `TauCeti.RigidCohomology` and agree with the `api` and `tests`
names of the packet `research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology.json`.
Unit tests are `example`s whose docstring begins "Test `<name>`". An API item or test that cannot
be stated honestly with the pinned libraries is a comment `-- <name>: not stated; needs <missing
object>`. Objects of other roadmaps are never invented here: where a statement needs one it is a
comment, or it enters as a parameter whose properties are hypotheses.

Organisation. One section per pair of layers:
* `PartA` (RD.0, RD.1). The Laurent-series rings on annuli belong to
  PadicHodgeTheory:P7:annulus-foundations and the dagger algebras to AdicSpacesPartII:F1, so the
  Robba ring appears as a concrete stand-in of coefficient families `ℤ → K` with the Cauchy
  product. Differential modules, generic radii, Frobenius modules, slopes and the
  Harder-Narasimhan formalism are stated on it.
* `PartB` (RD.2, RD.3). Unipotent differential modules over a ring with derivation, the
  logarithmic extension R[ℓ] with its Frobenius and monodromy operator, and the solution space.
  Frames, tubes, j† and the categories of overconvergent isocrystals need rigid analytic spaces
  (AdicSpacesPartII:R2, R3), so their items are comments.
* `PartC` (RD.4, RD.5). F-spaces and Tate twists, (σ,∇)-modules over a dagger algebra given as
  a parameter, coefficient-space models, near-isomorphisms and strict maps, with rigid cohomology
  itself recorded in comments.
* `PartD` (RD.6, RD.7). Fibre data for the trace formula, weights of Frobenius eigenvalues, the
  overconvergent Weyl algebra of the Fourier transform, and the Weil factors with their
  elliptic-curve tests.
-/

import Mathlib.Topology.Algebra.InfiniteSum.DiscreteConvolution
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Order.Filter.ZeroAndBoundedAtFilter
import Mathlib.RingTheory.Bezout
import Mathlib.RingTheory.PrincipalIdealDomain
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Flat.TorsionFree
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.Derivation.DifferentialRing
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.MvPowerSeries.GaussNorm
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.Frobenius
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.Data.EReal.Basic
import Mathlib.Algebra.SkewPolynomial.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.Data.Multiset.Sort
import Mathlib.Analysis.Convex.Hull
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.Algebra.Module.Projective
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.StdBasis
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Topology.Algebra.InfiniteSum.Defs
import Mathlib.Order.Filter.Cofinite
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Pi
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.RingTheory.Trace.Defs
import Mathlib.Algebra.Exact.Basic
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Data.Nat.Log
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Topology.Algebra.Module.Equiv
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.FieldTheory.IsAlgClosed.Classification
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.Polynomial.Expand
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.Algebra.Lie.CartanCriterion

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

noncomputable section

namespace TauCeti.RigidCohomology

/-! # Layers RD.0 and RD.1: Robba rings, Frobenius lifts, differential modules and slopes -/

section PartA

open Filter Topology
open scoped DiscreteConvolution Isocrystal

/-! # RD.0 — Dagger algebras and Robba rings -/

/-! ## Stand-ins for `PadicHodgeTheory:P7:annulus-foundations` -/

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- Coefficient families of Laurent series converging on the open annulus `r < |t| < 1`
(stand-in for P7's ring of functions on the annulus). -/
def annulusCoeffs (r : ℝ) : Submodule K (ℤ → K) where
  carrier := {a | ∀ ρ ∈ Set.Ioo r 1, Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- Coefficient families of germs converging on some annulus `r < |t| < 1`. -/
def robbaCoeffs : Submodule K (ℤ → K) where
  carrier := {a | ∃ r < (1 : ℝ), a ∈ annulusCoeffs K r}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- The Robba ring `R_K` (stand-in for P7's ring), with the Cauchy product. -/
abbrev RobbaRing := ↥(robbaCoeffs K)

/-- Coefficient families of the Amice ring `E`: bounded, tending to `0` as `n → −∞`. -/
def amiceCoeffs : Submodule K (ℤ → K) where
  carrier := {a | BddAbove (Set.range fun n => ‖a n‖) ∧ Tendsto a atBot (𝓝 0)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- The Amice ring `E` (stand-in for P7's ring). -/
abbrev AmiceRing := ↥(amiceCoeffs K)

/-- The `ρ`-Gauss norm `|f|_ρ = sup_n |a_n| ρ^n` of a coefficient family. -/
def gaussNorm (ρ : ℝ) (a : ℤ → K) : ℝ := ⨆ n : ℤ, ‖a n‖ * ρ ^ n

namespace RobbaRing
variable {K}

instance : Mul (RobbaRing K) := ⟨fun a b => ⟨(a : ℤ → K) ⋆ᵣ₊ (b : ℤ → K), sorry⟩⟩

instance : One (RobbaRing K) := ⟨⟨Pi.single 0 1, sorry⟩⟩

instance instCommRing : CommRing (RobbaRing K) :=
  { (inferInstance : AddCommGroup (RobbaRing K)) with
    mul_assoc := sorry
    one_mul := sorry
    mul_one := sorry
    zero_mul := sorry
    mul_zero := sorry
    left_distrib := sorry
    right_distrib := sorry
    mul_comm := sorry }

instance instAlgebra : Algebra K (RobbaRing K) := Algebra.ofModule sorry sorry

/-- The Robba ring is an integral domain (RD.0/analytic-ring-slope-additivity). -/
instance instIsDomain : IsDomain (RobbaRing K) := sorry

theorem coe_mul (a b : RobbaRing K) :
    ((a * b : RobbaRing K) : ℤ → K) = (a : ℤ → K) ⋆ᵣ₊ (b : ℤ → K) := rfl

/-- The coordinate `t`. -/
def T : RobbaRing K := ⟨Pi.single 1 1, sorry⟩

/-- The constants `c ∈ K`. -/
def C (c : K) : RobbaRing K := ⟨Pi.single 0 c, sorry⟩

/-- `t⁻¹`. -/
def Tinv : RobbaRing K := ⟨Pi.single (-1) 1, sorry⟩

/-- The bounded Robba ring `R^bd`: elements with bounded coefficients. -/
def bounded : Subring (RobbaRing K) where
  carrier := {f | BddAbove (Set.range fun n => ‖(f : ℤ → K) n‖)}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- The integral Robba ring `R^int`: all coefficients of norm `≤ 1`. -/
def integral : Subring (RobbaRing K) where
  carrier := {f | ∀ n, ‖(f : ℤ → K) n‖ ≤ 1}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

end RobbaRing

/-- `K` is discretely valued: there is a largest absolute value `< 1`. -/
def IsDiscretelyValued : Prop :=
  ∃ ϖ : K, 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1 ∧ ∀ x : K, ‖x‖ < 1 → ‖x‖ ≤ ‖ϖ‖

/-! ## RD.0/frobenius-lift-on-robba-ring -/

/-- A Frobenius lift on the Robba ring: `σ_K`-semilinear on constants, `σ(t) ∈ R^int`,
`σ(t) − t^q ∈ π·R^int`. Weak continuity on `R^int` is part of the intended definition but is
not expressible without P7's topology; it is left out rather than replaced by a `Prop` field. -/
structure RobbaRing.FrobeniusLift (q : ℕ) (π : K) where
  σK : K →+* K
  toRingHom : RobbaRing K →+* RobbaRing K
  map_C : ∀ c : K, toRingHom (RobbaRing.C c) = RobbaRing.C (σK c)
  image_mem_integral : toRingHom RobbaRing.T ∈ RobbaRing.integral (K := K)
  image_sub_pow : ∃ h ∈ RobbaRing.integral (K := K),
    toRingHom RobbaRing.T - RobbaRing.T ^ q = RobbaRing.C π * h

namespace RobbaRing.FrobeniusLift
variable {K} {q : ℕ} {π : K}

/-- The lift with prescribed image `u` of the coordinate. -/
def ofImage (σK : K →+* K) (u : RobbaRing K) (hu : u ∈ RobbaRing.integral (K := K))
    (hq : ∃ h ∈ RobbaRing.integral (K := K), u - RobbaRing.T ^ q = RobbaRing.C π * h) :
    RobbaRing.FrobeniusLift K q π := sorry

theorem ofImage_T (σK : K →+* K) (u : RobbaRing K) (hu) (hq) :
    (ofImage (q := q) (π := π) σK u hu hq).toRingHom RobbaRing.T = u := sorry

/-- Extensionality: a lift is determined by `σ_K` and the image of `t`
(uses weak continuity, see the structure docstring). -/
theorem ext (σ₁ σ₂ : RobbaRing.FrobeniusLift K q π) (hK : σ₁.σK = σ₂.σK)
    (hT : σ₁.toRingHom RobbaRing.T = σ₂.toRingHom RobbaRing.T) : σ₁ = σ₂ := sorry

/-- The lift preserves `R^bd`. -/
theorem toBounded (σ : RobbaRing.FrobeniusLift K q π) :
    ∀ f ∈ RobbaRing.bounded (K := K), σ.toRingHom f ∈ RobbaRing.bounded (K := K) := sorry

-- RobbaRing.FrobeniusLift.toAmice: not stated; needs the ring structure on P7's Amice ring `E`
-- (the coefficient submodule `amiceCoeffs` is defined above) and the weak topology.

/-- The lift as an endomorphism of the Robba ring. -/
abbrev toRobba (σ : RobbaRing.FrobeniusLift K q π) : RobbaRing K →+* RobbaRing K := σ.toRingHom

/-- Near the boundary, `|σ f|_{ρ^{1/q}} = |f|_ρ`. -/
theorem gaussNorm_apply (σ : RobbaRing.FrobeniusLift K q π) :
    ∃ r < (1 : ℝ), ∀ ρ ∈ Set.Ioo r 1, ∀ f : RobbaRing K, (f : ℤ → K) ∈ annulusCoeffs K r →
      gaussNorm K (ρ ^ (1 / (q : ℝ))) (σ.toRingHom f : ℤ → K) = gaussNorm K ρ (f : ℤ → K) :=
  sorry

/-- The standard lift `t ↦ t^q`. -/
def standard (σK : K →+* K) : RobbaRing.FrobeniusLift K q π := sorry

theorem standard_T (σK : K →+* K) :
    (standard (q := q) (π := π) σK).toRingHom RobbaRing.T = RobbaRing.T ^ q := sorry

/-- Modulo `π`, the lift is the `q`-power map on `R^int / π = k((t))`. -/
theorem reduction (σ : RobbaRing.FrobeniusLift K q π) :
    ∀ f ∈ RobbaRing.integral (K := K), ∃ h ∈ RobbaRing.integral (K := K),
      σ.toRingHom f - f ^ q = RobbaRing.C π * h := sorry

end RobbaRing.FrobeniusLift

/-- Test `frobeniusLift_standard_apply` (computation). -/
example (q : ℕ) (π : K) (σK : K →+* K) :
    (RobbaRing.FrobeniusLift.standard (q := q) (π := π) σK).toRingHom RobbaRing.Tinv =
      RobbaRing.Tinv ^ q := by sorry

-- frobeniusLift_cyclotomic_log: not stated; needs `log (1 + t) ∈ R` (a P7 series) and the
-- lift `t ↦ (1 + t)^p − 1` over `K = ℚ_p`.

/-- Test `frobeniusLift_reduction` (compatibility). -/
example (q : ℕ) (π : K) (σ : RobbaRing.FrobeniusLift K q π) :
    ∃ h ∈ RobbaRing.integral (K := K),
      σ.toRingHom RobbaRing.T - RobbaRing.T ^ q = RobbaRing.C π * h :=
  σ.image_sub_pow

/-- Test `frobeniusLift_not_on_fixed_annulus` (non-example): the standard lift does not map
the functions on a fixed annulus `r < |t| < 1` into themselves. -/
example (q : ℕ) (hq : 2 ≤ q) (π : K) (σK : K →+* K) (r : ℝ) (hr0 : 0 < r) (hr1 : r < 1) :
    ∃ f : RobbaRing K, (f : ℤ → K) ∈ annulusCoeffs K r ∧
      ((RobbaRing.FrobeniusLift.standard (q := q) (π := π) σK).toRingHom f : ℤ → K) ∉
        annulusCoeffs K r := by sorry

/-- Test `frobeniusLift_ext_image` (characterisation). -/
example (q : ℕ) (π : K) (σ₁ σ₂ : RobbaRing.FrobeniusLift K q π) (hK : σ₁.σK = σ₂.σK)
    (hT : σ₁.toRingHom RobbaRing.T = σ₂.toRingHom RobbaRing.T) (f : RobbaRing K) :
    σ₁.toRingHom f = σ₂.toRingHom f := by
  rw [RobbaRing.FrobeniusLift.ext σ₁ σ₂ hK hT]

/-! ## RD.0/witt-partial-valuations (unramified case `O = W(k₀)`, `π = p`) -/

namespace WittPartial

variable (p : ℕ) [Fact p.Prime] (ℓ : Type*) [Field ℓ] [CharP ℓ p] [PerfectRing ℓ p]
variable (vℓ : AddValuation ℓ (WithTop ℝ))

/-- `WithTop ℝ → EReal`. -/
def toEReal (x : WithTop ℝ) : EReal := WithTop.recTopCoe ⊤ (fun a : ℝ => (a : EReal)) x

/-- Teichmüller coordinates: `x = Σ_i [z_i] p^i` with `z_i = (x.coeff i)^{p^{-i}}`. -/
def teichCoord (x : WittVector p ℓ) (i : ℕ) : ℓ := (iterateFrobeniusEquiv ℓ p i).symm (x.coeff i)

/-- The partial valuation `v_n(x) = min_{i ≤ n} v_ℓ(z_i)`. -/
def v (x : WittVector p ℓ) (n : ℕ) : WithTop ℝ :=
  (Finset.range (n + 1)).inf' (by simp) fun i => vℓ (teichCoord p ℓ x i)

/-- `w_r(x) = min_n (r·v_n(x) + n)`, valued in `EReal`. -/
def w (r : ℝ) (x : WittVector p ℓ) : EReal :=
  ⨅ n : ℕ, (r : EReal) * toEReal (WittPartial.v p ℓ vℓ x n) + (n : EReal)

/-- The overconvergent subring `W_r`: `r·v_n(x) + n → ∞`. -/
def overconvergentSubring (r : ℝ) : Subring (WittVector p ℓ) where
  carrier := {x | Tendsto (fun n : ℕ =>
    (r : EReal) * toEReal (WittPartial.v p ℓ vℓ x n) + (n : EReal)) atTop (𝓝 ⊤)}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

theorem v_add (x y : WittVector p ℓ) (n : ℕ) :
    min (WittPartial.v p ℓ vℓ x n) (WittPartial.v p ℓ vℓ y n) ≤ WittPartial.v p ℓ vℓ (x + y) n := sorry

-- WittPartial.v_mul: not stated in this form; the product rule involves `v_m` for negative `m`
-- after inverting `p` (Kedlaya, Definition 2.1.5); it is recorded as the lemma node
-- RD.0/partial-valuation-multiplicativity.

theorem v_frobenius (x : WittVector p ℓ) (n : ℕ) :
    WittPartial.v p ℓ vℓ (WittVector.frobenius x) n = WithTop.map ((p : ℝ) * ·) (WittPartial.v p ℓ vℓ x n) := sorry

theorem v_teichmuller (z : ℓ) (n : ℕ) :
    WittPartial.v p ℓ vℓ (WittVector.teichmuller p z) n = vℓ z := sorry

/-- Test `wittPartial_v_teichmuller` (computation). -/
example (z : ℓ) : WittPartial.v p ℓ vℓ (WittVector.teichmuller p z) 0 = vℓ z := by sorry

/-- Test `wittPartial_w_pi` (computation): `w_r(p) = 1`. -/
example (r : ℝ) (hr : 0 ≤ r) : WittPartial.w p ℓ vℓ r (p : WittVector p ℓ) = 1 := by sorry

/-- Test `wittPartial_trivial_valuation` (degenerate). -/
example (hv : ∀ z : ℓ, z ≠ 0 → vℓ z = 0) (r : ℝ) (hr : 0 < r) :
    (WittPartial.overconvergentSubring p ℓ vℓ r : Set (WittVector p ℓ)) = Set.univ := by sorry

/-- Test `wittPartial_compat_mathlib_witt` (compatibility): Teichmüller coordinates of a
Teichmüller lift. -/
example (z : ℓ) : WittPartial.teichCoord p ℓ (WittVector.teichmuller p z) 0 = z := by sorry

/-- Test `wittPartial_not_overconvergent` (non-example). -/
example (y : ℓ) (hy : vℓ y < 0) (r : ℝ) (hr : 0 < r) :
    ∃ x : WittVector p ℓ, x ∉ WittPartial.overconvergentSubring p ℓ vℓ r := by sorry

end WittPartial

-- RD.0/partial-valuation-multiplicativity: not stated; needs `w_r` on `W(ℓ,O)[π⁻¹]`.
-- RD.0/overconvergent-witt-vectors-henselian: `W_con(ℓ,O)` is a henselian DVR; not stated as a
-- Lean instance here because `W_con` over a ramified `O` is not constructed; for `O = W(k₀)` it
-- is the union of `WittPartial.overconvergentSubring`.

/-! ## RD.0/analytic-ring (Kedlaya's `Γ^ℓ_I`, `Γ^ℓ_an,r`, `Γ^ℓ_an,con`) -/
-- AnalyticRing.intervalRing: not stated; needs the Fréchet completion of `Γ_{r₀}[π⁻¹]` for the
--   valuations `w_s`, `s ∈ I` (no library has these completions).
-- AnalyticRing.analyticRing: not stated; needs AnalyticRing.intervalRing.
-- AnalyticRing.boundedSubring: not stated; needs the embedding `Γ^ℓ ↪ W(ℓ^perf, O^perf)`.
-- AnalyticRing.restrict: not stated; needs AnalyticRing.intervalRing.
-- AnalyticRing.frobenius: not stated; needs AnalyticRing.intervalRing.
-- AnalyticRing.slopes: not stated; needs AnalyticRing.intervalRing.
-- AnalyticRing.isDomain: not stated; for `ℓ = k((t))` it is `RobbaRing.instIsDomain` above.
-- AnalyticRing.trivialValuation: not stated; needs AnalyticRing.analyticRing.
-- analyticRing_trivial_valuation, analyticRing_closed_interval, analyticRing_slopes_monomial,
-- analyticRing_compat_robba, analyticRing_not_noetherian: not stated (tests of the items above);
-- the last is stated for the Robba ring stand-in:

/-- Test `analyticRing_not_noetherian` (non-example), for the Robba ring. -/
example : ¬ IsNoetherianRing (RobbaRing K) := by sorry

/-! ## RD.0 structure theorems for the Robba ring stand-in -/

/-- RD.0/bounded-robba-ring (a): `R^int` is a henselian discrete valuation ring. -/
theorem RobbaRing.integral_isDVR (hK : IsDiscretelyValued K) :
    IsDiscreteValuationRing (RobbaRing.integral (K := K)) := sorry

theorem RobbaRing.integral_henselian (hK : IsDiscretelyValued K) :
    HenselianLocalRing (RobbaRing.integral (K := K)) := sorry

/-- RD.0/bounded-robba-ring (b): `R^bd` is a field. -/
theorem RobbaRing.bounded_isField (hK : IsDiscretelyValued K) :
    IsField (RobbaRing.bounded (K := K)) := sorry

/-- RD.0/bounded-robba-ring (c): `R^bd = R ∩ E` on coefficient families. -/
theorem RobbaRing.bounded_eq_inter_amice :
    ((↑) '' (RobbaRing.bounded (K := K) : Set (RobbaRing K)) : Set (ℤ → K)) =
      (robbaCoeffs K : Set (ℤ → K)) ∩ (amiceCoeffs K : Set (ℤ → K)) := sorry

/-- RD.0/units-of-robba-ring: `R^× = R^bd ∖ {0}`. -/
theorem RobbaRing.isUnit_iff (hK : IsDiscretelyValued K) (f : RobbaRing K) :
    IsUnit f ↔ f ≠ 0 ∧ f ∈ RobbaRing.bounded (K := K) := sorry

/-- RD.0/analytic-ring-bezout: the Robba ring is a Bézout domain (Lazard). -/
theorem RobbaRing.isBezout (hK : IsDiscretelyValued K) : IsBezout (RobbaRing K) := sorry

/-- RD.0/modules-over-bezout-domains (c): finite projective modules over a Bézout domain are
free. -/
theorem Module.free_of_projective_of_isBezout (R M : Type*) [CommRing R] [IsDomain R] [IsBezout R]
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M] :
    Module.Free R M := sorry

/-- RD.0/robba-ring-flat-base-change (a): `R` is faithfully flat over the field `R^bd`. -/
theorem RobbaRing.faithfullyFlat_over_bounded (hK : IsDiscretelyValued K) :
    Module.FaithfullyFlat (RobbaRing.bounded (K := K)) (RobbaRing K) := sorry

-- RD.0/closed-interval-analytic-ring-pid, RD.0/matrix-approximation-and-factorization,
-- RD.0/vector-bundles-on-half-open-intervals-free, RD.0/semiunit-presentation,
-- RD.0/analytic-ring-membership-and-intersections, RD.0/units-of-analytic-ring,
-- RD.0/finite-separable-extensions-of-analytic-rings: not stated; need the annulus rings
-- `Γ_I` (for the Robba ring: P7's rings of functions on closed annuli with their Gauss norms).

/-! ## RD.0/extended-robba-ring and RD.0/frobenius-equivariant-embedding -/
-- ExtendedRobba.ring: not stated; needs AnalyticRing.analyticRing for ℓ = completed algebraic
--   closure of k((t)).
-- ExtendedRobba.boundedSubring, ExtendedRobba.isBezout, ExtendedRobba.units,
-- ExtendedRobba.frobenius_bijective, ExtendedRobba.dense_union: not stated; need ExtendedRobba.ring.
-- extendedRobba_trivial_residue, extendedRobba_H0_twist, extendedRobba_units,
-- extendedRobba_not_over_bounded: not stated; need ExtendedRobba.ring.
-- RobbaRing.toExtended, RobbaRing.toExtended_frobenius, RobbaRing.toExtended_injective,
-- RobbaRing.toExtended_residue, RobbaRing.toExtended_standard: not stated; need ExtendedRobba.ring.
-- toExtended_standard_t, toExtended_frobenius_commutes, toExtended_depends_on_lift,
-- toExtended_residue_inclusion: not stated; need RobbaRing.toExtended.

/-- For the unramified perfect case the integral part of the target is Mathlib's
`WittVector p ℓ`, and the standard lift sends `t` to the Teichmüller lift `[t]`; the embedding
itself needs the Fréchet completions above. -/
example (p : ℕ) [Fact p.Prime] (ℓ : Type*) [Field ℓ] [CharP ℓ p] [PerfectRing ℓ p] (z : ℓ) :
    WittVector.frobenius (WittVector.teichmuller p z) = WittVector.teichmuller p (z ^ p) := by sorry

/-! ## RD.0/derivation-on-robba-ring -/

namespace RobbaRing
variable {K}

/-- Termwise derivative on coefficient families: `(df/dt)_n = (n+1) a_{n+1}`. -/
def derivCoeffs : RobbaRing K →ₗ[K] RobbaRing K where
  toFun f := ⟨fun n => ((n + 1 : ℤ) : K) * (f : ℤ → K) (n + 1), sorry⟩
  map_add' := sorry
  map_smul' := sorry

/-- `d/dt` as a `K`-derivation of the Robba ring. -/
def derivative (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] :
    Derivation K (RobbaRing K) (RobbaRing K) :=
  Derivation.mk' derivCoeffs sorry

theorem derivative_monomial (n : ℤ) :
    ((derivative K (⟨Pi.single n (1 : K), sorry⟩ : RobbaRing K) : RobbaRing K) : ℤ → K) =
      Pi.single (n - 1) (n : K) := sorry

theorem gaussNorm_derivative_le (r : ℝ) (f : RobbaRing K) (hf : (f : ℤ → K) ∈ annulusCoeffs K r)
    (ρ : ℝ) (hρ : ρ ∈ Set.Ioo r 1) :
    gaussNorm K ρ (derivative K f : ℤ → K) ≤ ρ⁻¹ * gaussNorm K ρ (f : ℤ → K) := sorry

theorem derivative_restrict (r r' : ℝ) (h : r ≤ r') (f : RobbaRing K)
    (hf : (f : ℤ → K) ∈ annulusCoeffs K r) : (derivative K f : ℤ → K) ∈ annulusCoeffs K r := sorry

-- RobbaRing.continuous_derivative: not stated; needs P7's Fréchet and LF topologies.
-- RobbaRing.kaehler_free: not stated; needs continuous differentials (the algebraic Kähler
--   differentials of `R` over `K` are not free of rank one).

theorem ker_derivative (f : RobbaRing K) : derivative K f = 0 ↔ ∃ c : K, f = C c := sorry

theorem derivative_frobenius (q : ℕ) (π : K) (σ : FrobeniusLift K q π) (f : RobbaRing K) :
    derivative K (σ.toRingHom f) = derivative K (σ.toRingHom T) * σ.toRingHom (derivative K f) := sorry

end RobbaRing

/-- Test `derivative_t_pow` (computation): `d(t⁻¹)/dt = −t⁻²`. -/
example : RobbaRing.derivative K (RobbaRing.Tinv (K := K)) = -(RobbaRing.Tinv ^ 2) := by sorry

/-- Test `derivative_ker` (degenerate). -/
example (f : RobbaRing K) (h : RobbaRing.derivative K f = 0) : ∃ c : K, f = RobbaRing.C c :=
  (RobbaRing.ker_derivative f).1 h

/-- Test `derivative_compat_powerSeries` (compatibility): on power series the derivative is
Mathlib's `PowerSeries.derivative`, coefficientwise. -/
example (g : PowerSeries K) (f : RobbaRing K)
    (hfg : ∀ n : ℕ, (f : ℤ → K) n = PowerSeries.coeff n g) (hneg : ∀ n : ℤ, n < 0 → (f : ℤ → K) n = 0) :
    ∀ n : ℕ, (RobbaRing.derivative K f : ℤ → K) n = PowerSeries.coeff n (PowerSeries.derivative K g) := by
  sorry

/-- Test `derivative_not_surjective` (non-example): `t⁻¹` has no primitive. -/
example : ¬ ∃ g : RobbaRing K, RobbaRing.derivative K g = RobbaRing.Tinv := by sorry

/-- Test `gaussNorm_derivative_strict` (computation). -/
example (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ = (p : ℝ)⁻¹) (ρ : ℝ) (hρ : 0 < ρ) :
    gaussNorm K ρ (RobbaRing.derivative K (RobbaRing.T (K := K) ^ p) : ℤ → K) =
      (p : ℝ)⁻¹ * ρ ^ (p - 1) := by sorry

/-! ## RD.0/change-of-frobenius-lift-taylor-formula and RD.0/completion-versus-overconvergence -/
-- RD.0/change-of-frobenius-lift-taylor-formula: not stated; needs convergent series in `R`
--   (P7's Fréchet topology).

/-- RD.0/completion-versus-overconvergence (c): `Σ_{n ≥ 0} p^n t^{-p^n}` lies in `E` but not
in `R`. -/
theorem amice_not_robba (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ = (p : ℝ)⁻¹) :
    ∃ a : ℤ → K, a ∈ amiceCoeffs K ∧ a ∉ robbaCoeffs K := sorry

/-! ## RD.0/frobenius-lift-on-dagger-algebra and RD.0/frobenius-lifts-induce-homotopic-maps -/
-- RD.0/frobenius-lift-on-dagger-algebra: not stated in general; needs the weak completion `S†`
--   of a smooth `O_K`-algebra (AdicSpacesPartII:F1). The conclusion is Mathlib's
--   `AlgHom.IsArithFrobAt φ (π S†)` for an `O_K`-algebra endomorphism `φ` of `S†`.
-- RD.0/frobenius-lifts-induce-homotopic-maps: not stated; needs `S†⟨T⟩†` and the overconvergent
--   de Rham complex (AdicSpacesPartII:F1).

/-- The polynomial case of a Frobenius lift, in Mathlib's `AlgHom.IsArithFrobAt` form: for
`O` with residue field of cardinality `q` at `π`, `x ↦ x^q` on `O[X]`. -/
example (O : Type*) [CommRing O] (π : O) (q : ℕ)
    (hq : Nat.card (O ⧸ (Ideal.span {Polynomial.C π} : Ideal (Polynomial O)).under O) = q)
    (hres : ∀ f : Polynomial O, f.comp (Polynomial.X ^ q) - f ^ q ∈
      (Ideal.span {Polynomial.C π} : Ideal (Polynomial O))) :
    ∃ φ : Polynomial O →ₐ[O] Polynomial O,
      φ.IsArithFrobAt (Ideal.span {Polynomial.C π}) := by sorry

/-! # RD.1 — Differential modules, radii and Frobenius slopes -/

/-! ## RD.1/differential-module -/

/-- A `∇`-module over a differential ring `(A, δ)`: an additive map `D = ∇_{d/dt}` with the
Leibniz rule (integrability is automatic in one variable). Finite freeness is imposed by the
instance arguments where it is needed. -/
structure DifferentialModule (A : Type*) [CommRing A] (δ : Derivation ℤ A A)
    (M : Type*) [AddCommGroup M] [Module A M] where
  D : M →+ M
  leibniz : ∀ (f : A) (m : M), D (f • m) = f • D m + (δ f) • m

namespace DifferentialModule

variable {A : Type*} [CommRing A] {δ : Derivation ℤ A A}
variable {M : Type*} [AddCommGroup M] [Module A M]
variable {N : Type*} [AddCommGroup N] [Module A N]

/-- Horizontal `A`-linear maps. -/
structure Hom (E : DifferentialModule A δ M) (E' : DifferentialModule A δ N) where
  toLinearMap : M →ₗ[A] N
  horizontal : ∀ m, toLinearMap (E.D m) = E'.D (toLinearMap m)

/-- The trivial module `(A, δ)`. -/
def trivial (δ : Derivation ℤ A A) : DifferentialModule A δ A where
  D := δ.toLinearMap.toAddMonoidHom
  leibniz := sorry

/-- `H⁰ = ker D`. -/
def H0 (E : DifferentialModule A δ M) : AddSubgroup M := E.D.ker

/-- `H¹ = coker D`. -/
def H1 (E : DifferentialModule A δ M) : Type _ := M ⧸ E.D.range

/-- Tensor product, `D(v ⊗ w) = Dv ⊗ w + v ⊗ Dw`. -/
def tensor (E : DifferentialModule A δ M) (E' : DifferentialModule A δ N) :
    DifferentialModule A δ (TensorProduct A M N) := sorry

/-- Dual, `(Dλ)(v) = δ(λ v) − λ(Dv)`. -/
def dual (E : DifferentialModule A δ M) : DifferentialModule A δ (Module.Dual A M) := sorry

/-- Base change along a map of differential rings. -/
def baseChange (B : Type*) [CommRing B] [Algebra A B] (δB : Derivation ℤ B B)
    (h : ∀ a : A, δB (algebraMap A B a) = algebraMap A B (δ a))
    (E : DifferentialModule A δ M) : DifferentialModule B δB (TensorProduct A B M) := sorry

-- DifferentialModule.boundaryEquivalence: not stated; needs ∇-modules on the annuli
-- `A[r, 1)` as coherent sheaves (P7's annulus rings) and the direct limit over `r → 1`.

end DifferentialModule

/-- Test `differentialModule_trivial_H0_H1` (computation): `H⁰` of the trivial module over
the Robba ring is the constants. -/
example : ∀ f : RobbaRing K,
    f ∈ (DifferentialModule.trivial ((RobbaRing.derivative K).restrictScalars ℤ)).H0 ↔
      ∃ c : K, f = RobbaRing.C c := by sorry

/-- Test `differentialModule_rankOne_integer_residue` (characterisation): for `D e = (a/t) e`,
`a ∈ ℤ`, the unit `t^{-a}` is a horizontal generator. -/
example (a : ℕ) : RobbaRing.derivative K (RobbaRing.Tinv ^ a) +
    ((a : K) • RobbaRing.Tinv) * RobbaRing.Tinv ^ a = 0 := by sorry

/-- Test `differentialModule_zero_rank` (degenerate). -/
example (A : Type*) [CommRing A] (δ : Derivation ℤ A A)
    (E : DifferentialModule A δ PUnit) : E.H0 = ⊤ := by sorry

/-- Test `differentialModule_compat_derivation` (compatibility): a `∇`-structure on `A` itself
is `δ + f` with `f = D 1`. -/
example (A : Type*) [CommRing A] (δ : Derivation ℤ A A) (E : DifferentialModule A δ A) (m : A) :
    E.D m = δ m + m * E.D 1 := by sorry

/-- Test `differentialModule_unipotent_nonsplit` (non-example): for `D(e₁) = 0`,
`D(e₂) = e₁/t` on `R²`, every horizontal vector has zero `e₂`-coordinate. -/
example (E : DifferentialModule (RobbaRing K) ((RobbaRing.derivative K).restrictScalars ℤ)
      (Fin 2 → RobbaRing K))
    (hE : ∀ v : Fin 2 → RobbaRing K, E.D v =
      ![RobbaRing.derivative K (v 0) + RobbaRing.Tinv * v 1, RobbaRing.derivative K (v 1)]) :
    ∀ v, E.D v = 0 → v 1 = 0 := by sorry

/-! ## RD.1/differential-twisted-polynomial-ring -/

/-- Twisted polynomials `F{T}`, `T a = a T + δ a`, as finitely supported coefficient families. -/
def TwistedPolynomial (F : Type*) [CommRing F] (δ : Derivation ℤ F F) : Type _ := ℕ →₀ F

namespace TwistedPolynomial

variable {F : Type*} [CommRing F] {δ : Derivation ℤ F F}

instance : AddCommGroup (TwistedPolynomial F δ) := inferInstanceAs (AddCommGroup (ℕ →₀ F))

/-- The coefficient family. -/
def coeffs (P : TwistedPolynomial F δ) : ℕ →₀ F := P

/-- `T`. -/
def T : TwistedPolynomial F δ := Finsupp.single 1 1

/-- Constants. -/
def C (a : F) : TwistedPolynomial F δ := Finsupp.single 0 a

/-- Multiplication: `(a T^i)(b T^j) = Σ_k C(i,k) a δ^k(b) T^{i−k+j}`. -/
instance : Mul (TwistedPolynomial F δ) :=
  ⟨fun P Q => (P : ℕ →₀ F).sum fun i a => (Q : ℕ →₀ F).sum fun j b =>
    ∑ k ∈ Finset.range (i + 1), Finsupp.single (i - k + j) (a * (i.choose k : F) * ((⇑δ)^[k] b))⟩

theorem T_mul (a : F) : (T : TwistedPolynomial F δ) * C a = C a * T + C (δ a) := sorry

/-- The Newton polygon (as a region: the convex hull of the points `(−i, val a_i)` plus the
upward quadrant) for a valuation-like function `val`. -/
def newtonPolygon (val : F → ℝ) (P : TwistedPolynomial F δ) : Set (ℝ × ℝ) :=
  convexHull ℝ {x | ∃ i ∈ P.coeffs.support, ∃ y ≥ val (P.coeffs i), x = (-(i : ℝ), y)}

-- TwistedPolynomial.opposite: not stated; the opposite ring is the twisted polynomial ring of
-- `−δ` (needs the ring structure on `TwistedPolynomial`, whose axioms are not proved here).

end TwistedPolynomial

/-- A cyclic vector: `v, Dv, …, D^{n−1}v` are linearly independent, `n = dim V`. -/
def IsCyclicVector (F : Type*) [Field F] {V : Type*} [AddCommGroup V] [Module F V]
    (D : V →+ V) (v : V) : Prop :=
  LinearIndependent F (fun i : Fin (Module.finrank F V) => (⇑D)^[i] v)

-- IsCyclicVector.presentation: not stated; needs the ring structure on `TwistedPolynomial`.

/-- Test `twistedPolynomial_T_mul_t` (computation): `T t = t T + 1` when `δ t = 1`. -/
example (F : Type*) [CommRing F] (δ : Derivation ℤ F F) (t : F) (ht : δ t = 1) :
    (TwistedPolynomial.T : TwistedPolynomial F δ) * TwistedPolynomial.C t =
      TwistedPolynomial.C t * TwistedPolynomial.T + TwistedPolynomial.C 1 := by sorry

/-- Test `twistedPolynomial_trivial_derivation` (degenerate): for `δ = 0`, `T a = a T`. -/
example (F : Type*) [CommRing F] (a : F) :
    (TwistedPolynomial.T : TwistedPolynomial F 0) * TwistedPolynomial.C a =
      TwistedPolynomial.C a * TwistedPolynomial.T := by sorry

/-- Test `twistedPolynomial_not_skewPolynomial` (non-example): `T a − a T = δ a`, which is not
of the Frobenius-twisted form `(φ a − a) T` of Mathlib's `SkewPolynomial`. -/
example (F : Type*) [CommRing F] (δ : Derivation ℤ F F) (a : F) (ha : δ a ≠ 0) :
    (TwistedPolynomial.T : TwistedPolynomial F δ) * TwistedPolynomial.C a -
      TwistedPolynomial.C a * TwistedPolynomial.T ≠ 0 := by sorry

/-- Test `cyclicVector_rankOne` (characterisation). -/
example (F : Type*) [Field F] (D : F →+ F) (v : F) (hv : v ≠ 0) : IsCyclicVector F D v := by sorry

/-! ## RD.1/cyclic-vector-lemma -/

/-- Cyclic vector lemma, with the necessary hypothesis `δ ≠ 0`. -/
theorem exists_isCyclicVector (F : Type*) [Field F] [CharZero F] (δ : Derivation ℤ F F)
    (hδ : δ ≠ 0) (V : Type*) [AddCommGroup V] [Module F V] [FiniteDimensional F V]
    (E : DifferentialModule F δ V) : ∃ v, IsCyclicVector F E.D v := sorry

/-- The hypothesis `δ ≠ 0` cannot be dropped. -/
example (F : Type*) [Field F] [CharZero F] :
    ¬ ∃ v : Fin 2 → F, IsCyclicVector F (0 : (Fin 2 → F) →+ (Fin 2 → F)) v := by sorry

/-! ## RD.1/spectral-norm-of-differential-module and RD.1/generic-radius -/

section Radius

/-- `D^s` on a basis: `D₀ = 1`, `D_{s+1} = δ(D_s) + G·D_s`, for the connection matrix `G`. -/
def connPow {R : Type*} [CommRing R] (δ : R →+ R) {ι : Type*} [Fintype ι] [DecidableEq ι]
    (G : Matrix ι ι R) : ℕ → Matrix ι ι R
  | 0 => 1
  | s + 1 => (connPow δ G s).map δ + G * connPow δ G s

variable {F : Type*} [NormedField F] (δ : F →+ F)
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Operator norm of a map `F → F` (junk value `0` if unbounded). -/
def opNormFun (f : F → F) : ℝ := ⨆ x : F, ‖f x‖ / ‖x‖

/-- The spectral norm `|δ|_{F,sp} = lim sup |δ^s|^{1/s}`. -/
def derivSpectralNorm : ℝ := limsup (fun s : ℕ => opNormFun ((⇑δ)^[s]) ^ (1 / (s : ℝ))) atTop

/-- Sup norm of a matrix. -/
def matSupNorm (M : Matrix ι ι F) : ℝ := ⨆ i, ⨆ j, ‖M i j‖

/-- The spectral norm of `δ` on the module with connection matrix `G`, in the matrix form
`max(|δ|_{F,sp}, lim sup |D_s|^{1/s})` (Christol-Dwork). -/
def DifferentialModule.spectralNorm (G : Matrix ι ι F) : ℝ :=
  max (derivSpectralNorm δ) (limsup (fun s : ℕ => matSupNorm (connPow δ G s) ^ (1 / (s : ℝ))) atTop)

theorem DifferentialModule.spectralNorm_eq_matrix (G : Matrix ι ι F) :
    DifferentialModule.spectralNorm δ G = max (derivSpectralNorm δ)
      (limsup (fun s : ℕ => matSupNorm (connPow δ G s) ^ (1 / (s : ℝ))) atTop) := rfl

/-- Basis independence: a gauge transformation does not change the spectral norm. -/
theorem DifferentialModule.spectralNorm_basis_indep (G : Matrix ι ι F) (U : Matrix ι ι F)
    (hU : IsUnit U.det) :
    DifferentialModule.spectralNorm δ (U⁻¹ * G * U + U⁻¹ * U.map δ) =
      DifferentialModule.spectralNorm δ G := sorry

theorem DifferentialModule.le_spectralNorm (G : Matrix ι ι F) :
    derivSpectralNorm δ ≤ DifferentialModule.spectralNorm δ G := le_max_left _ _

-- DifferentialModule.spectralNorm_baseChange: not stated; needs isometric embeddings of
-- complete differential fields.

/-- Generic radius `R = ω·|δ|_{V,sp}^{-1}`, `ω = p^{-1/(p-1)}`. -/
def DifferentialModule.genericRadius (p : ℕ) (G : Matrix ι ι F) : ℝ :=
  (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) / DifferentialModule.spectralNorm δ G

/-- Intrinsic (toric) radius `T = |δ|_{F,sp} / |δ|_{V,sp} ∈ (0, 1]`. -/
def DifferentialModule.intrinsicRadius (G : Matrix ι ι F) : ℝ :=
  derivSpectralNorm δ / DifferentialModule.spectralNorm δ G

-- DifferentialModule.subsidiaryRadii: not stated; needs Jordan-Hölder constituents of
-- differential modules over `F_ρ`.

theorem DifferentialModule.genericRadius_eq_liminf (p : ℕ) [Fact p.Prime] (ρ : ℝ) (hρ : 0 < ρ)
    (hδ : derivSpectralNorm δ = (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) * ρ⁻¹) (G : Matrix ι ι F) :
    DifferentialModule.genericRadius δ p G = min ρ (liminf (fun s : ℕ =>
      (matSupNorm (connPow δ G s) / ‖((s.factorial : ℕ) : F)‖) ^ (-(1 / (s : ℝ)))) atTop) := sorry

theorem DifferentialModule.genericRadius_le (p : ℕ) [Fact p.Prime] (ρ : ℝ) (hρ : 0 < ρ)
    (hδ : derivSpectralNorm δ = (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) * ρ⁻¹) (G : Matrix ι ι F) :
    DifferentialModule.genericRadius δ p G ≤ ρ := sorry

theorem DifferentialModule.genericRadius_trivial (p : ℕ) [Fact p.Prime] (ρ : ℝ) (hρ : 0 < ρ)
    (hδ : derivSpectralNorm δ = (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) * ρ⁻¹) (hd : δ 1 = 0) :
    DifferentialModule.genericRadius δ p (0 : Matrix ι ι F) = ρ := sorry

end Radius

/-- Test `genericRadius_trivial` (degenerate): the trivial module has `R(O, ρ) = ρ`. -/
example {F : Type*} [NormedField F] (p : ℕ) [Fact p.Prime] (δ : F →+ F) (ρ : ℝ) (hρ : 0 < ρ)
    (hδ : derivSpectralNorm δ = (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) * ρ⁻¹) (hd : δ 1 = 0) :
    DifferentialModule.genericRadius δ p (0 : Matrix (Fin 1) (Fin 1) F) = ρ :=
  DifferentialModule.genericRadius_trivial δ p ρ hρ hδ hd

/-- Test `spectralNorm_trivial` (degenerate). -/
example {F : Type*} [NormedField F] (δ : F →+ F) (hd : δ 1 = 0) :
    DifferentialModule.spectralNorm δ (0 : Matrix (Fin 1) (Fin 1) F) = derivSpectralNorm δ := by
  sorry

/-- Test `spectralNorm_Frho` (computation): if `|δ^s| = |s!| ρ^{-s}` (as for `d/dt` on `F_ρ`)
then `|δ|_{F,sp} = p^{-1/(p-1)} ρ^{-1}`. -/
example {F : Type*} [NormedField F] (p : ℕ) [Fact p.Prime] (δ : F →+ F) (ρ : ℝ) (hρ : 0 < ρ)
    (hp : ∀ n : ℕ, ‖(n : F)‖ = (p : ℝ) ^ (-(padicValNat p n : ℝ)))
    (hs : ∀ s : ℕ, opNormFun ((⇑δ)^[s]) = ‖((s.factorial : ℕ) : F)‖ * ρ ^ (-(s : ℝ))) :
    derivSpectralNorm δ = (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) * ρ⁻¹ := by sorry

/-- Test `spectralNorm_rankOne_large` (computation). -/
example {F : Type*} [NormedField F] (δ : F →+ F) (f : F) (hf : opNormFun δ < ‖f‖) :
    DifferentialModule.spectralNorm δ (Matrix.of fun _ _ => f : Matrix (Fin 1) (Fin 1) F) = ‖f‖ := by
  sorry

/-- Test `spectralNorm_not_operatorNorm` (non-example). -/
example {F : Type*} [NormedField F] (p : ℕ) [Fact p.Prime] (δ : F →+ F) (ρ : ℝ) (hρ : 0 < ρ)
    (hop : opNormFun δ = ρ⁻¹)
    (hsp : derivSpectralNorm δ = (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) * ρ⁻¹) :
    derivSpectralNorm δ < opNormFun δ := by sorry

/-- Test `genericRadius_dworkExponential` (computation), algebraic part: for `D w = −π t^{-2} w`
and `δ t = 1`, `D^s w = (−1)^s Σ_k L(s,k) π^k t^{−s−k} w` with Lah numbers
`L(s,k) = C(s−1,k−1) s!/k!` (checked in PARI/GP for `s ≤ 40`). -/
example {R : Type*} [CommRing R] (δ : Derivation ℤ R R) (t tinv π : R) (ht : t * tinv = 1)
    (hd : δ t = 1) (hπ : δ π = 0) (s : ℕ) :
    connPow δ.toLinearMap.toAddMonoidHom (Matrix.of fun _ _ => -π * tinv ^ 2 :
      Matrix (Fin 1) (Fin 1) R) s 0 0 =
      (-1) ^ s * ∑ k ∈ Finset.Icc 1 s,
        ((s - 1).choose (k - 1) * (s.factorial / k.factorial) : ℕ) * π ^ k * tinv ^ (s + k) := by
  sorry

/-- Test `genericRadius_rankOne_constant` (computation): `D e = a e` gives
`R = min(ρ, ω/|a|)`. -/
example {F : Type*} [NormedField F] (p : ℕ) [Fact p.Prime] (δ : F →+ F) (ρ : ℝ) (hρ : 0 < ρ)
    (hδ : derivSpectralNorm δ = (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) * ρ⁻¹)
    (a : F) (ha : δ a = 0) (ha0 : a ≠ 0) :
    DifferentialModule.genericRadius δ p (Matrix.of fun _ _ => a : Matrix (Fin 1) (Fin 1) F) =
      min ρ ((p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) / ‖a‖) := by sorry

-- genericRadius_unipotent_full: not stated; needs `F_ρ` (the completion of `K(t)`) to compare
-- the full radius with `H⁰` over the Robba ring.

/-- Test `genericRadius_basis_indep` (compatibility). -/
example {F : Type*} [NormedField F] (δ : F →+ F) (G U : Matrix (Fin 2) (Fin 2) F)
    (hU : IsUnit U.det) :
    DifferentialModule.spectralNorm δ (U⁻¹ * G * U + U⁻¹ * U.map δ) =
      DifferentialModule.spectralNorm δ G :=
  DifferentialModule.spectralNorm_basis_indep δ G U hU

/-! ## RD.1/solvable-at-boundary, RD.1/highest-break, RD.1/differential-swan-conductor
These are stated on the intrinsic radius function `T : ρ ↦ T(E, ρ)` of a `∇`-module. -/

/-- Solvable at `1`: `T(E, ρ) → 1` as `ρ → 1⁻`. -/
def DifferentialModule.IsSolvable (T : ℝ → ℝ) : Prop := Tendsto T (𝓝[<] 1) (𝓝 1)

-- DifferentialModule.isSolvable_iff_taylor: not stated; needs the Taylor series over annuli.

theorem DifferentialModule.IsSolvable.tensor (T₁ T₂ T₁₂ : ℝ → ℝ)
    (h : ∀ ρ, min (T₁ ρ) (T₂ ρ) ≤ T₁₂ ρ ∧ T₁₂ ρ ≤ 1)
    (h₁ : DifferentialModule.IsSolvable T₁) (h₂ : DifferentialModule.IsSolvable T₂) :
    DifferentialModule.IsSolvable T₁₂ := sorry

-- DifferentialModule.IsSolvable.pullback: not stated; needs pullback of `∇`-modules along
-- automorphisms of the disc.

/-- `b` is the highest break: `T(E, ρ) = ρ^b` for `ρ` close to `1`. -/
def DifferentialModule.IsHighestBreak (T : ℝ → ℝ) (b : ℚ) : Prop :=
  ∀ᶠ ρ in 𝓝[<] (1 : ℝ), T ρ = ρ ^ (b : ℝ)

/-- The highest break of a solvable module (it exists by RD.1/radius-function-piecewise-linear). -/
def DifferentialModule.highestBreak (T : ℝ → ℝ) (h : ∃ b, DifferentialModule.IsHighestBreak T b) : ℚ :=
  Classical.choose h

theorem DifferentialModule.highestBreak_spec (T : ℝ → ℝ) (h : ∃ b, DifferentialModule.IsHighestBreak T b) :
    DifferentialModule.IsHighestBreak T (DifferentialModule.highestBreak T h) := Classical.choose_spec h

theorem DifferentialModule.highestBreak_pullback_pow (T : ℝ → ℝ) (N : ℕ) (hN : 0 < N) (b : ℚ)
    (hb : DifferentialModule.IsHighestBreak T b) :
    DifferentialModule.IsHighestBreak (fun ρ => T (ρ ^ N)) (N * b) := sorry

-- DifferentialModule.highestBreak_tensor: not stated on radius functions; needs the tensor
-- product of `∇`-modules and generic points (overview Lemma 5.4.5).

/-- The break multiset: `S(E, ρ) = {ρ^{b_i}}` near `ρ = 1`. -/
def DifferentialModule.breakMultiset (S : ℝ → Multiset ℝ) (bs : Multiset ℚ) : Prop :=
  ∀ᶠ ρ in 𝓝[<] (1 : ℝ), S ρ = bs.map fun b : ℚ => ρ ^ (b : ℝ)

/-- The differential Swan conductor, the sum of the breaks. -/
def DifferentialModule.swanConductor (bs : Multiset ℚ) : ℚ := bs.sum

theorem DifferentialModule.swanConductor_additive (bs₁ bs₂ : Multiset ℚ) :
    DifferentialModule.swanConductor (bs₁ + bs₂) =
      DifferentialModule.swanConductor bs₁ + DifferentialModule.swanConductor bs₂ := by
  simp [DifferentialModule.swanConductor]

theorem DifferentialModule.swanConductor_pullback_pow (bs : Multiset ℚ) (N : ℕ) :
    DifferentialModule.swanConductor (bs.map fun b => (N : ℚ) * b) =
      N * DifferentialModule.swanConductor bs := sorry

-- DifferentialModule.swanConductor_dual: not stated; needs duals of `∇`-modules over annuli
-- (the break multiset of `E^∨` equals that of `E`).

/-- Test `isSolvable_trivial` (degenerate). -/
example : DifferentialModule.IsSolvable (fun _ => 1) := tendsto_const_nhds

/-- Test `isSolvable_dworkExponential` (computation): `T(E_π, ρ) = ρ`. -/
example : DifferentialModule.IsSolvable (fun ρ => ρ) := by sorry

/-- Test `not_isSolvable_large_constant` (non-example): `T = ω/(ρ|a|)` with `ω/|a| < 1`. -/
example (c : ℝ) (hc : c < 1) : ¬ DifferentialModule.IsSolvable (fun ρ => c / ρ) := by sorry

-- isSolvable_iff_christolMebkhout: not stated; needs Christol-Mebkhout's definition via the
-- Taylor series (overview Remark 5.1.6).

/-- Test `highestBreak_trivial` (degenerate). -/
example : DifferentialModule.IsHighestBreak (fun _ => 1) 0 := by sorry

/-- Test `highestBreak_dworkExponential` (computation). -/
example : DifferentialModule.IsHighestBreak (fun ρ => ρ) 1 := by sorry

/-- Test `highestBreak_unipotent` (computation): unipotent modules have `T ≡ 1`. -/
example : DifferentialModule.IsHighestBreak (fun _ => 1) 0 := by sorry

/-- Test `highestBreak_pullback_tN` (compatibility). -/
example (N : ℕ) (hN : 0 < N) : DifferentialModule.IsHighestBreak (fun ρ => ρ ^ N) N := by sorry

/-- Test `highestBreak_not_slope` (non-example): the unit-root Dwork module has break `1 ≠ 0`. -/
example : ¬ DifferentialModule.IsHighestBreak (fun ρ => ρ) 0 := by sorry

/-- Test `swanConductor_trivial` (degenerate). -/
example (n : ℕ) : DifferentialModule.swanConductor (Multiset.replicate n 0) = 0 := by sorry

/-- Test `swanConductor_dworkExponential` (computation). -/
example : DifferentialModule.swanConductor {1} = 1 := by simp [DifferentialModule.swanConductor]

/-- Test `swanConductor_pullback_t2` (computation). -/
example : DifferentialModule.swanConductor (({1} : Multiset ℚ).map (fun b => 2 * b)) = 2 := by
  sorry

/-- Test `swanConductor_not_rank` (non-example). -/
example : DifferentialModule.swanConductor {1} ≠ DifferentialModule.swanConductor {0} := by
  simp [DifferentialModule.swanConductor]

-- swanConductor_compat_galois: not stated; needs the Galois Swan conductor of the
-- Artin-Schreier character (Swan conductors I, Example 3.5.10).

-- RD.1/christol-dwork-newton-polygon, RD.1/robba-factorization-and-radius-decomposition,
-- RD.1/generic-radius-basic-properties, RD.1/dwork-transfer-generic-disc,
-- RD.1/frobenius-antecedent, RD.1/radius-function-piecewise-linear, RD.1/break-decomposition,
-- RD.1/swan-conductor-integrality: not stated; they need `F_ρ` (the completion of `K(t)` for the
-- `ρ`-Gauss norm), the ring structure on `TwistedPolynomial`, and ∇-modules over P7's annulus
-- rings.

/-! ## RD.1/frobenius-module -/

section FrobeniusModules

variable {A : Type*} [CommRing A] [Nontrivial A] (σ : A →+* A)

/-- The matrix of a `σ`-semilinear map on a basis: `F(b_j) = Σ_i A_ij b_i`. -/
def frobMatrixOf {M : Type*} [AddCommGroup M] [Module A M] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (F : M →ₛₗ[σ] M) (b : Module.Basis ι A M) : Matrix ι ι A :=
  Matrix.of fun i j => b.repr (F (b j)) i

/-- A `σ`-module over a ring `A` in which `π` is invertible (e.g. `R`, `R^bd`, `E`, `R^alg`,
`W(κ,O)[π⁻¹]`): a finite free module with a `σ`-semilinear `F` whose matrix is invertible. Over
`R^int` or `O_E` the condition is invertibility after inverting `π` (not formalised here). -/
structure FrobeniusModule (M : Type*) [AddCommGroup M] [Module A M] [Module.Free A M]
    [Module.Finite A M] where
  frob : M →ₛₗ[σ] M
  isUnit_det : ∃ b : Module.Basis (Fin (Module.finrank A M)) A M, IsUnit (frobMatrixOf σ frob b).det

namespace FrobeniusModule

variable {σ}
variable {M : Type*} [AddCommGroup M] [Module A M] [Module.Free A M] [Module.Finite A M]

/-- The Frobenius matrix on the standard basis. -/
def frobMatrix (E : FrobeniusModule σ M) : Matrix (Fin (Module.finrank A M)) (Fin (Module.finrank A M)) A :=
  frobMatrixOf σ E.frob (Module.finBasis A M)

/-- Twist `M(c)`: `F` multiplied by `π^c`. -/
def twist (π : Aˣ) (c : ℤ) (E : FrobeniusModule σ M) : FrobeniusModule σ M where
  frob := ((π ^ c : Aˣ) : A) • E.frob
  isUnit_det := sorry

/-- Dual `M^∨`, `(Fλ)(Fv) = σ(λ v)`. -/
def dual (E : FrobeniusModule σ M) : FrobeniusModule σ (Module.Dual A M) := sorry

/-- Tensor product, `F(v ⊗ w) = Fv ⊗ Fw`. -/
def tensor {N : Type*} [AddCommGroup N] [Module A N] [Module.Free A N] [Module.Finite A N]
    (E : FrobeniusModule σ M) (E' : FrobeniusModule σ N) : FrobeniusModule σ (TensorProduct A M N) :=
  sorry

/-- `H⁰ = {v : F v = v}`. -/
def H0 (E : FrobeniusModule σ M) : AddSubgroup M :=
  (E.frob.toAddMonoidHom - AddMonoidHom.id M).ker

/-- `H¹ = coker(F − 1)`. -/
def H1 (E : FrobeniusModule σ M) : Type _ := M ⧸ (E.frob.toAddMonoidHom - AddMonoidHom.id M).range

-- FrobeniusModule.ext_eq_H1: not stated; needs the exact (non-abelian) category of
-- σ-modules and Yoneda Ext¹.

/-- Base change along a `σ`-equivariant ring map. -/
def baseChange {B : Type*} [CommRing B] [Algebra A B] (σB : B →+* B)
    (h : ∀ a : A, σB (algebraMap A B a) = algebraMap A B (σ a)) (E : FrobeniusModule σ M) :
    FrobeniusModule σB (TensorProduct A B M) := sorry

/-- For `A = W(k)[1/p]` with the Witt Frobenius, a `σ`-module is a Mathlib isocrystal. -/
abbrev toIsocrystal (p : ℕ) [Fact p.Prime] (k : Type*) [CommRing k] [IsDomain k] [CharP k p]
    [PerfectRing k p] (V : Type*) [AddCommGroup V] [Module (FractionRing (WittVector p k)) V]
    [Module.Free (FractionRing (WittVector p k)) V] [Module.Finite (FractionRing (WittVector p k)) V]
    (E : FrobeniusModule (WittVector.FractionRing.frobeniusRingHom p k) V) :
    WittVector.Isocrystal p k V := sorry

end FrobeniusModule

/-! ## RD.1/frobenius-restriction-and-pullback -/

namespace FrobeniusModule
variable {σ}
variable {M : Type*} [AddCommGroup M] [Module A M] [Module.Free A M] [Module.Finite A M]

/-- `[a]_*`: the `σ^a`-module `(M, F^a)`. -/
def pushforward (a : ℕ) (E : FrobeniusModule σ M) : FrobeniusModule (σ ^ a) M := sorry

-- FrobeniusModule.pullback: not stated; needs the twisted polynomial ring `A{σ}` and
-- `A{σ} ⊗_{A{σ^a}} N` (Mathlib's `SkewPolynomial` has no module theory yet).
-- FrobeniusModule.pullback_pushforward_adj, FrobeniusModule.pushforward_pullback_rankOne:
-- not stated; need FrobeniusModule.pullback.
-- FrobeniusModule.frobeniusPullback: not stated; needs `M ⊗_{A,σ} A` as an `A`-module
-- (restriction of scalars along `σ`).

theorem pushforward_twist (π : Aˣ) (hπ : σ π = π) (c : ℤ) (a : ℕ) (E : FrobeniusModule σ M) :
    (pushforward a (twist π c E)).frob = (twist π (a * c) (pushforward a E)).frob := sorry

end FrobeniusModule

/-! ## RD.1/degree-and-slope -/

namespace FrobeniusModule
variable {σ}
variable {M : Type*} [AddCommGroup M] [Module A M] [Module.Free A M] [Module.Finite A M]

/-- Degree `w(det F)`, for a valuation `w` on `A` (for the Robba ring, `w` is the `π`-adic
valuation of the unit `det F ∈ R^bd`). -/
def degree (w : AddValuation A (WithTop ℤ)) (E : FrobeniusModule σ M) : WithTop ℤ :=
  w E.frobMatrix.det

/-- Slope `μ = deg / rank`. -/
def slope (w : AddValuation A (WithTop ℤ)) (E : FrobeniusModule σ M) : ℚ :=
  (((degree w E).untopD 0 : ℤ) : ℚ) / (Module.finrank A M : ℚ)

-- FrobeniusModule.degree_additive, FrobeniusModule.degree_le_of_sub: not stated; need exact
-- sequences and σ-stable saturated submodules with their induced Frobenius.

theorem degree_twist (w : AddValuation A (WithTop ℤ)) (π : Aˣ) (hπ : w π = 1) (c : ℤ)
    (E : FrobeniusModule σ M) :
    degree w (twist π c E) = degree w E + ((c * Module.finrank A M : ℤ) : WithTop ℤ) := sorry

theorem slope_pushforward (w : AddValuation A (WithTop ℤ)) (hw : ∀ a, w (σ a) = w a) (a : ℕ)
    (ha : 0 < a) (E : FrobeniusModule σ M) :
    slope w (pushforward a E) = a * slope w E := sorry

end FrobeniusModule

/-! ## RD.1/semistability-and-harder-narasimhan-filtration -/
-- FrobeniusModule.IsSemistable, FrobeniusModule.IsStable, FrobeniusModule.HNFiltration,
-- FrobeniusModule.HNFiltration.unique, FrobeniusModule.hnPolygon_above,
-- FrobeniusModule.descends_iff_top_exterior: not stated; need degrees of σ-stable saturated
-- submodules (free over Bézout rings by RD.0/modules-over-bezout-domains) with the restricted
-- Frobenius.
-- isSemistable_twist_sum, hnFiltration_rankOne, not_isSemistable_sum,
-- hnFiltration_compat_bundles: not stated; need FrobeniusModule.IsSemistable.

/-- The Newton polygon of a finite multiset of slopes: `i ↦` sum of the `i` smallest. -/
def NewtonPolygon.ofMultiset (S : Multiset ℚ) (i : ℕ) : ℚ :=
  ((S.sort (· ≤ ·)).take i).sum

/-- `P` lies above `P'`: same endpoint and `P ≥ P'` at every integer abscissa. -/
def NewtonPolygon.le (S S' : Multiset ℚ) : Prop :=
  Multiset.card S = Multiset.card S' ∧ S.sum = S'.sum ∧
    ∀ i ≤ Multiset.card S, NewtonPolygon.ofMultiset S' i ≤ NewtonPolygon.ofMultiset S i

/-- Test `newtonPolygon_endpoint` (characterisation). -/
example (S : Multiset ℚ) : NewtonPolygon.ofMultiset S (Multiset.card S) = S.sum := by sorry

/-! ## RD.1/standard-frobenius-modules -/

namespace FrobeniusModule
variable {σ}

/-- The Frobenius of `M_{c,d+1}`: `F e_i = e_{i+1}`, `F e_{d+1} = π^c e_1`, `σ`-semilinearly. -/
def standardFrob (π : Aˣ) (c : ℤ) (d : ℕ) : (Fin (d + 1) → A) →ₛₗ[σ] (Fin (d + 1) → A) where
  toFun v := fun i => Fin.cases (((π ^ c : Aˣ) : A) * σ (v (Fin.last d)))
    (fun j : Fin d => σ (v j.castSucc)) i
  map_add' := sorry
  map_smul' := sorry

/-- The standard module `M_{c,d+1}`. -/
def standard (π : Aˣ) (c : ℤ) (d : ℕ) : FrobeniusModule σ (Fin (d + 1) → A) where
  frob := standardFrob π c d
  isUnit_det := sorry

theorem standard_frob_last (π : Aˣ) (c : ℤ) (d : ℕ) :
    (standard (σ := σ) π c d).frob (Pi.single (Fin.last d) 1) = Pi.single 0 ((π ^ c : Aˣ) : A) := sorry

-- FrobeniusModule.standard_tensor, FrobeniusModule.standard_dual, FrobeniusModule.standard_twist,
-- FrobeniusModule.standard_isStable, FrobeniusModule.hom_standard_ne_zero_iff,
-- FrobeniusModule.standard_end_divisionRing: not stated; need isomorphisms of σ-modules over
-- `R^alg` (not constructed) or FrobeniusModule.IsStable.
-- FrobeniusModule.standard_compat_vb0: not stated; VectorBundlesAndIsocrystals's standard block
-- has no Lean form (its suggested file uses opaque parameters).

end FrobeniusModule

/-- Test `standard_rankOne` (degenerate): `M_{c,1}` is the twist of the unit module. -/
example (π : Aˣ) (c : ℤ) (v : Fin 1 → A) :
    (FrobeniusModule.standard (σ := σ) π c 0).frob v = fun _ => ((π ^ c : Aˣ) : A) * σ (v 0) := by
  sorry

set_option backward.isDefEq.respectTransparency.types false in
/-- Test `standard_compat_mathlib` (compatibility): `M_{m,1}` over `W(k)[1/p]` is Mathlib's
`StandardOneDimIsocrystal p k m`, whose Frobenius is `x ↦ p^m φ(x)`. -/
example (p : ℕ) [Fact p.Prime] (k : Type*) [CommRing k] [IsDomain k] [CharP k p] [PerfectRing k p]
    (m : ℤ) (x : WittVector.StandardOneDimIsocrystal p k m) :
    (WittVector.Isocrystal.frobenius p k (V := WittVector.StandardOneDimIsocrystal p k m)) x =
      (p : FractionRing (WittVector p k)) ^ m • WittVector.FractionRing.frobenius p k x :=
  WittVector.StandardOneDimIsocrystal.frobenius_apply p k m x

-- standard_tensor_half, standard_hom_vanishing, standard_not_diagonal: not stated; need
-- isomorphisms and Hom-spaces of σ-modules over `R^alg`.

end FrobeniusModules

/-! ## RD.1/dieudonne-manin-classical (for Mathlib isocrystals, `O = W(k)`, `π = p`) -/

set_option backward.isDefEq.respectTransparency.types false in
/-- Dieudonné-Manin: over an algebraically closed `k`, every isocrystal has a basis made of
standard blocks `F e_{i,j} = e_{i,j+1}`, `F e_{i,last} = p^{c_i} e_{i,0}`. -/
theorem isocrystal_dieudonneManin (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [IsAlgClosed k]
    [CharP k p] (V : Type*) [AddCommGroup V] [WittVector.Isocrystal p k V]
    [FiniteDimensional (FractionRing (WittVector p k)) V] :
    ∃ (n : ℕ) (c : Fin n → ℤ) (d : Fin n → ℕ)
      (b : Module.Basis (Σ i, Fin (d i + 1)) (FractionRing (WittVector p k)) V),
      ∀ i j, (WittVector.Isocrystal.frobenius p k (V := V)) (b ⟨i, j⟩) =
        if j = Fin.last (d i) then (p : FractionRing (WittVector p k)) ^ (c i) • b ⟨i, 0⟩
        else b ⟨i, j + 1⟩ := sorry

/-! ## RD.1/frobenius-slopes and RD.1/isoclinic-frobenius-module (isocrystal case) -/

/-- Generic slopes of an isocrystal: the multiset of `c_i/(d_i+1)`, each with multiplicity
`d_i + 1`, from a Dieudonné-Manin basis. -/
def FrobeniusModule.genericSlopes (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [IsAlgClosed k]
    [CharP k p] (V : Type*) [AddCommGroup V] [WittVector.Isocrystal p k V]
    [FiniteDimensional (FractionRing (WittVector p k)) V] : Multiset ℚ :=
  let h := isocrystal_dieudonneManin p k V
  let n := Classical.choose h
  let hc := Classical.choose_spec h
  let c := Classical.choose hc
  let hd := Classical.choose_spec hc
  let d := Classical.choose hd
  (Finset.univ : Finset (Fin n)).val.bind fun i =>
    Multiset.replicate (d i + 1) ((c i : ℚ) / (d i + 1 : ℚ))

-- FrobeniusModule.absoluteSlopes: not stated; needs FrobeniusModule over `R^alg`.

/-- The Newton polygon of the generic slopes. -/
def FrobeniusModule.newtonPolygon (S : Multiset ℚ) : ℕ → ℚ := NewtonPolygon.ofMultiset S

theorem FrobeniusModule.slopes_card (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [IsAlgClosed k]
    [CharP k p] (V : Type*) [AddCommGroup V] [WittVector.Isocrystal p k V]
    [FiniteDimensional (FractionRing (WittVector p k)) V] :
    Multiset.card (FrobeniusModule.genericSlopes p k V) =
      Module.finrank (FractionRing (WittVector p k)) V := sorry

-- FrobeniusModule.slopes_sum: the sum of the slopes is `v_p(det F)`; not stated here because the
-- degree of a Mathlib isocrystal needs a determinant of a semilinear map.
-- FrobeniusModule.slopes_baseChange, FrobeniusModule.special_above_generic: not stated; need
-- `E`, `R^bd`, `R` and `R^alg` as rings with Frobenius.

theorem FrobeniusModule.genericSlopes_isocrystal (p : ℕ) [Fact p.Prime] (k : Type*) [Field k]
    [IsAlgClosed k] [CharP k p] (m : ℤ)
    [FiniteDimensional (FractionRing (WittVector p k)) (WittVector.StandardOneDimIsocrystal p k m)] :
    FrobeniusModule.genericSlopes p k (WittVector.StandardOneDimIsocrystal p k m) = {(m : ℚ)} := sorry

/-- Isoclinic of slope `s`: all generic slopes equal `s`. -/
def FrobeniusModule.IsIsoclinic (S : Multiset ℚ) (s : ℚ) : Prop := ∀ x ∈ S, x = s

/-- Unit-root: isoclinic of slope `0`. -/
def FrobeniusModule.IsUnitRoot (S : Multiset ℚ) : Prop := FrobeniusModule.IsIsoclinic S 0

-- FrobeniusModule.isIsoclinic_iff_semistable, FrobeniusModule.IsIsoclinic.tensor,
-- FrobeniusModule.IsIsoclinic.hom_eq_zero, FrobeniusModule.isUnitRoot_iff_lattice: not stated;
-- need semistability and lattices over `R^int`.

/-- Test `genericSlopes_twist` (computation). -/
example (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [IsAlgClosed k] [CharP k p] (m : ℤ)
    [FiniteDimensional (FractionRing (WittVector p k)) (WittVector.StandardOneDimIsocrystal p k m)] :
    FrobeniusModule.genericSlopes p k (WittVector.StandardOneDimIsocrystal p k m) = {(m : ℚ)} :=
  FrobeniusModule.genericSlopes_isocrystal p k m

/-- Test `genericSlopes_zero` (degenerate). -/
example : FrobeniusModule.newtonPolygon (0 : Multiset ℚ) 0 = 0 := by
  simp [FrobeniusModule.newtonPolygon, NewtonPolygon.ofMultiset]

/-- Test `genericSlopes_compat_isocrystal` (compatibility): Mathlib's rank-one classification. -/
example (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [IsAlgClosed k] [CharP k p] (V : Type*)
    [AddCommGroup V] [WittVector.Isocrystal p k V]
    (h : Module.finrank (FractionRing (WittVector p k)) V = 1) :
    ∃ m : ℤ, Nonempty (WittVector.IsocrystalEquiv p k (WittVector.StandardOneDimIsocrystal p k m) V) :=
  WittVector.isocrystal_classification p k V h

-- slopes_generic_ne_special, slopes_not_charpoly: not stated; need `R^bd` and `R` as rings with
-- Frobenius and the special slopes.

/-- Test `isIsoclinic_twist` (computation). -/
example (m : ℤ) (n : ℕ) : FrobeniusModule.IsIsoclinic (Multiset.replicate n (m : ℚ)) m := by
  intro x hx; exact Multiset.eq_of_mem_replicate hx

/-- Test `isIsoclinic_zero` (degenerate). -/
example (s : ℚ) : FrobeniusModule.IsIsoclinic 0 s := by simp [FrobeniusModule.IsIsoclinic]

/-- Test `not_isIsoclinic_sum` (non-example). -/
example : ¬ FrobeniusModule.IsIsoclinic ({0, 1} : Multiset ℚ) 0 := by
  simp [FrobeniusModule.IsIsoclinic]

-- isUnitRoot_compat_isocrystal: not stated; needs W(k)-lattices of isocrystals.

/-! ## RD.1/frobenius-differential-module -/

/-- A `(σ, ∇)`-module over `A` with coordinate `t`: `D(F v) = (δ(σ t))·F(D v)`. -/
structure FrobeniusDifferentialModule {A : Type*} [CommRing A] (σ : A →+* A)
    (δ : Derivation ℤ A A) (t : A) (M : Type*) [AddCommGroup M] [Module A M] [Module.Free A M]
    [Module.Finite A M] where
  toFrobeniusModule : FrobeniusModule σ M
  toDifferentialModule : DifferentialModule A δ M
  compat : ∀ v, toDifferentialModule.D (toFrobeniusModule.frob v) =
    (δ (σ t)) • toFrobeniusModule.frob (toDifferentialModule.D v)

-- FrobeniusDifferentialModule.toFrobeniusModule and FrobeniusDifferentialModule.toDifferentialModule
-- are the structure projections above.

namespace FrobeniusDifferentialModule
variable {A : Type*} [CommRing A] {σ : A →+* A} {δ : Derivation ℤ A A} {t : A}
variable {M : Type*} [AddCommGroup M] [Module A M] [Module.Free A M] [Module.Finite A M]

-- FrobeniusDifferentialModule.frobeniusStructure: not stated; needs the pulled-back
-- connection on `M ⊗_{A,σ} A`.

/-- Tensor product of `(σ,∇)`-modules. -/
def tensor {N : Type*} [AddCommGroup N] [Module A N] [Module.Free A N] [Module.Finite A N]
    (E : FrobeniusDifferentialModule σ δ t M) (E' : FrobeniusDifferentialModule σ δ t N) :
    FrobeniusDifferentialModule σ δ t (TensorProduct A M N) := sorry

/-- Base change along maps compatible with `σ` and `δ`. -/
def baseChange {B : Type*} [CommRing B] [Algebra A B] (σB : B →+* B) (δB : Derivation ℤ B B)
    (hσ : ∀ a : A, σB (algebraMap A B a) = algebraMap A B (σ a))
    (hδ : ∀ a : A, δB (algebraMap A B a) = algebraMap A B (δ a))
    (E : FrobeniusDifferentialModule σ δ t M) :
    FrobeniusDifferentialModule σB δB (algebraMap A B t) (TensorProduct A B M) := sorry

/-- `H⁰ = ker D`, stable under `F`. -/
theorem H0_isocrystal (E : FrobeniusDifferentialModule σ δ t M) :
    ∀ v ∈ E.toDifferentialModule.H0, E.toFrobeniusModule.frob v ∈ E.toDifferentialModule.H0 := sorry

/-- The trivial `(σ,∇)`-module `(A, σ, δ)` on the free module `Fin 1 → A`. -/
def trivial (hσ : ∀ f : A, δ (σ f) = δ (σ t) * σ (δ f)) : FrobeniusDifferentialModule σ δ t (Fin 1 → A) := sorry

end FrobeniusDifferentialModule

/-- Test `frobeniusDifferentialModule_trivial` (degenerate): the chain rule is the compatibility
of the trivial module over the Robba ring. -/
example (q : ℕ) (π : K) (σ : RobbaRing.FrobeniusLift K q π) (f : RobbaRing K) :
    RobbaRing.derivative K (σ.toRingHom f) =
      RobbaRing.derivative K (σ.toRingHom RobbaRing.T) * σ.toRingHom (RobbaRing.derivative K f) :=
  RobbaRing.derivative_frobenius q π σ f

/-- Test `frobeniusDifferentialModule_twist` (computation): for `F = π^n σ`, `D = d/dt`,
`D(F(f)) = (dσ(t)/dt)·F(D f)`. -/
example (q : ℕ) (π : K) (hπ : RobbaRing.derivative K (RobbaRing.C π) = 0) (n : ℕ)
    (σ : RobbaRing.FrobeniusLift K q π) (f : RobbaRing K) :
    RobbaRing.derivative K (RobbaRing.C π ^ n * σ.toRingHom f) =
      RobbaRing.derivative K (σ.toRingHom RobbaRing.T) *
        (RobbaRing.C π ^ n * σ.toRingHom (RobbaRing.derivative K f)) := by sorry

/-- Test `frobeniusDifferentialModule_dwork` (computation), algebraic part: with `D w = −π t⁻² w`,
`σ t = t^p` and `δθ = π(t⁻² − p t^{−p−1})θ`, the compatibility `D(θ w) = (d t^p/dt)·σ(−π t⁻²) θ w`
holds (`σ` fixes `π`). -/
example {R : Type*} [CommRing R] (δ : Derivation ℤ R R) (σ : R →+* R) (t tinv π θ : R) (p : ℕ)
    (ht : t * tinv = 1) (hd : δ t = 1) (hσt : σ t = t ^ p) (hσinv : σ tinv = tinv ^ p)
    (hσπ : σ π = π) (hθ : δ θ = π * (tinv ^ 2 - (p : R) * tinv ^ (p + 1)) * θ) :
    δ θ + θ * (-π * tinv ^ 2) = δ (σ t) * (σ (-π * tinv ^ 2) * θ) := by sorry

/-- Test `frobeniusDifferentialModule_wrong_sign` (non-example): the inverse `θ⁻¹` fails the
compatibility when `2π t⁻² ≠ 0`. -/
example {R : Type*} [CommRing R] [IsDomain R] (δ : Derivation ℤ R R) (σ : R →+* R) (t tinv π θ θi : R)
    (p : ℕ) (hp : 2 ≤ p) (ht : t * tinv = 1) (hd : δ t = 1) (hσt : σ t = t ^ p)
    (hσinv : σ tinv = tinv ^ p) (hσπ : σ π = π) (hθi : θ * θi = 1) (hθ0 : θi ≠ 0)
    (hθ : δ θ = π * (tinv ^ 2 - (p : R) * tinv ^ (p + 1)) * θ) (hπ : 2 * π * tinv ^ 2 ≠ 0) :
    δ θi + θi * (-π * tinv ^ 2) ≠ δ (σ t) * (σ (-π * tinv ^ 2) * θi) := by sorry

/-- Test `frobeniusDifferentialModule_compat_isocrystal` (compatibility). -/
example {A : Type*} [CommRing A] (σ : A →+* A) (δ : Derivation ℤ A A) (t : A)
    (M : Type*) [AddCommGroup M] [Module A M] [Module.Free A M] [Module.Finite A M]
    (E : FrobeniusDifferentialModule σ δ t M) (v : M) (hv : v ∈ E.toDifferentialModule.H0) :
    E.toFrobeniusModule.frob v ∈ E.toDifferentialModule.H0 :=
  FrobeniusDifferentialModule.H0_isocrystal E v hv

/-! ## Remaining RD.1 statements
RD.1/rank-one-frobenius-modules (isocrystal case: `WittVector.isocrystal_classification`),
RD.1/cohomology-of-rank-one-frobenius-modules, RD.1/eigenvectors-over-extended-robba-ring,
RD.1/harder-narasimhan-filtration-exists, RD.1/slope-zero-eigenvectors-in-extensions,
RD.1/standard-submodules-exist, RD.1/dieudonne-manin-over-extended-robba-ring,
RD.1/dieudonne-manin-slopes-are-hn-slopes, RD.1/calculus-of-slopes,
RD.1/splitting-of-exact-sequences-by-polygons, RD.1/frobenius-stable-lattices,
RD.1/generic-slope-decomposition-and-descent, RD.1/generic-newton-polygon-from-cyclic-vector,
RD.1/change-of-frobenius-for-frobenius-structures, RD.1/frobenius-structure-forces-solvability,
RD.1/dwork-exponential-module (algebraic parts above), RD.1/slope-and-irregularity-are-independent:
not stated; they need `R^alg`, `F_ρ` and the σ-module category over P7's rings. -/

section FrobeniusTests
variable {A : Type*} [CommRing A] [Nontrivial A] (σ : A →+* A)

-- frobeniusModule_rankOne_twist, frobeniusModule_zero, frobeniusModule_compat_isocrystal,
-- frobeniusModule_not_zero_map, frobeniusModule_isogeny_integral, pushforward_rank_deg,
-- pullback_rank_deg, pushforward_one, pushforward_pullback_rankOne_check,
-- pushforward_not_faithful_on_iso_without_residue, degree_twist_rankOne, degree_zero_module,
-- degree_compat_isocrystal, degree_not_matrix_entries: examples follow.

/-- Test `frobeniusModule_rankOne_twist` (computation): the twist of the unit rank-one module
has Frobenius `π^n σ`. -/
example (π : Aˣ) (n : ℤ) (E : FrobeniusModule σ (Fin 1 → A)) (v : Fin 1 → A) :
    (FrobeniusModule.twist π n E).frob v = ((π ^ n : Aˣ) : A) • E.frob v := rfl

/-- Test `frobeniusModule_zero` (degenerate): `H⁰` of the zero module is everything. -/
example (E : FrobeniusModule σ (Fin 0 → A)) : E.H0 = ⊤ := by sorry

/-- Test `frobeniusModule_compat_isocrystal` (compatibility). -/
example (p : ℕ) [Fact p.Prime] (k : Type*) [CommRing k] [IsDomain k] [CharP k p] [PerfectRing k p]
    (V : Type*) [AddCommGroup V] [Module (FractionRing (WittVector p k)) V]
    [Module.Free (FractionRing (WittVector p k)) V] [Module.Finite (FractionRing (WittVector p k)) V]
    (E : FrobeniusModule (WittVector.FractionRing.frobeniusRingHom p k) V) :
    Nonempty (WittVector.Isocrystal p k V) := ⟨FrobeniusModule.toIsocrystal p k V E⟩

/-- Test `frobeniusModule_not_zero_map` (non-example): `F = 0` is not a Frobenius structure. -/
example : ¬ ∃ E : FrobeniusModule σ (Fin 1 → A), E.frob = 0 := by sorry

-- frobeniusModule_isogeny_integral: not stated; needs σ-modules over `R^int` (π not invertible).

/-- Test `pushforward_one` (degenerate). -/
example (E : FrobeniusModule σ (Fin 1 → A)) (v : Fin 1 → A) :
    (FrobeniusModule.pushforward 1 E).frob v = E.frob v := by sorry

-- pushforward_rank_deg, pullback_rank_deg, pushforward_pullback_rankOne_check,
-- pushforward_not_faithful_on_iso_without_residue: not stated; need FrobeniusModule.pullback and
-- isomorphisms of σ-modules.

/-- Test `degree_twist_rankOne` (computation). -/
example (w : AddValuation A (WithTop ℤ)) (π : Aˣ) (hπ : w π = 1) (n : ℤ)
    (E : FrobeniusModule σ (Fin 1 → A)) (hE : FrobeniusModule.degree w E = 0) :
    FrobeniusModule.degree w (FrobeniusModule.twist π n E) = (n : WithTop ℤ) := by sorry

/-- Test `degree_zero_module` (degenerate). -/
example (w : AddValuation A (WithTop ℤ)) (E : FrobeniusModule σ (Fin 0 → A)) :
    FrobeniusModule.degree w E = 0 := by sorry

-- degree_compat_isocrystal: not stated; needs determinants of Mathlib isocrystals.

/-- Test `degree_not_matrix_entries` (non-example): the matrix `[[0,1],[p,0]]` has degree `1`
(slope `1/2`) although its entries have valuations `0` and `1`. -/
example (w : AddValuation A (WithTop ℤ)) (π : Aˣ) (hπ : w π = 1)
    (E : FrobeniusModule σ (Fin 2 → A))
    (hE : frobMatrixOf σ E.frob (Pi.basisFun A (Fin 2)) = !![0, 1; (π : A), 0]) :
    FrobeniusModule.degree w E = 1 := by sorry

end FrobeniusTests

end PartA

/-! # Layers RD.2 and RD.3: local monodromy, frames and overconvergent isocrystals -/

section PartB

open Polynomial Filter Topology
universe u v

/-! ## RD.2 — ∇-modules over a differential ring

`R` is a commutative `K`-algebra with a `K`-linear derivation `D`; for the Robba ring `R_K`
this is `D = t d/dt`, so that `∇_D` is the connection contracted with `dt/t`.  All modules are
modules with connection in the sense of RD.1/differential-module. -/

/-- A module with connection over `(R, D)`: a finite free `R`-module `M` with an additive map
`∇ = ∇_D` satisfying the Leibniz rule (RD.1/differential-module, contracted with `D`). -/
structure DiffModule (K : Type u) (R : Type u) [Field K] [CommRing R] [Algebra K R]
    (D : Derivation K R R) where
  /-- The underlying module. -/
  M : Type u
  [instAddCommGroup : AddCommGroup M]
  [instModule : Module R M]
  [instFree : Module.Free R M]
  [instFinite : Module.Finite R M]
  /-- The connection contracted with `D`. -/
  nabla : M →+ M
  leibniz : ∀ (r : R) (m : M), nabla (r • m) = r • nabla m + D r • m

attribute [instance] DiffModule.instAddCommGroup DiffModule.instModule DiffModule.instFree
  DiffModule.instFinite

namespace DiffModule

variable {K : Type u} {R : Type u} [Field K] [CommRing R] [Algebra K R] {D : Derivation K R R}

/-- The trivial module `(R, D)^{⊕ n}`. -/
def trivial (D : Derivation K R R) (n : ℕ) : DiffModule K R D where
  M := Fin n → R
  nabla :=
    { toFun := fun v i => D (v i)
      map_zero' := by sorry
      map_add' := by sorry }
  leibniz := by sorry

/-- The rank one module `R e` with `∇_D e = a e`. -/
def rankOne (D : Derivation K R R) (a : R) : DiffModule K R D where
  M := Fin 1 → R
  nabla :=
    { toFun := fun v i => D (v i) + a * v i
      map_zero' := by sorry
      map_add' := by sorry }
  leibniz := by sorry

/-- The logarithmic module `R e_1 ⊕ R e_2` with `∇_D e_1 = 0`, `∇_D e_2 = e_1`
(for `D = t d/dt`: `∇ e_2 = e_1 ⊗ dt/t`). -/
def logModule (D : Derivation K R R) : DiffModule K R D where
  M := Fin 2 → R
  nabla :=
    { toFun := fun v => ![D (v 0) + v 1, D (v 1)]
      map_zero' := by sorry
      map_add' := by sorry }
  leibniz := by sorry

/-- Horizontal sections `H^0(M) = ker ∇`. -/
def H0 (E : DiffModule K R D) : AddSubgroup E.M := E.nabla.ker

end DiffModule

namespace DifferentialModule

open DiffModule

variable {K : Type u} {R : Type u} [Field K] [CommRing R] [Algebra K R] {D : Derivation K R R}

/-! ### RD.2/constant-and-quasi-constant-differential-module -/

/-- API `DifferentialModule.IsConstant`: `M` is spanned over `R` by `ker ∇`. -/
def IsConstant (E : DiffModule K R D) : Prop :=
  Submodule.span R {m : E.M | E.nabla m = 0} = ⊤

/-- API `DifferentialModule.isConstant_iff_trivial_sum`: constant iff there is a basis of
horizontal sections, i.e. `M ≅ (R, D)^{⊕ n}`; uses `ker D = K`. -/
theorem isConstant_iff_trivial_sum [IsDomain R] (hker : ∀ g : R, D g = 0 → ∃ c : K, g = algebraMap K R c)
    (E : DiffModule K R D) :
    IsConstant E ↔ ∃ (ι : Type u) (b : Module.Basis ι R E.M), ∀ i, E.nabla (b i) = 0 := by
  sorry

-- DifferentialModule.IsQuasiConstant: not stated; needs the finite étale extensions R^L of the
--   Robba ring (RD.2/finite-etale-extension-of-bounded-robba-ring, RD.0/finite-separable-extensions-of-analytic-rings)
--   and base change of ∇-modules along them.
-- DifferentialModule.H0_isConstant: not stated; needs the K-linear structure on ker ∇ and
--   finrank over K (RD.1/differential-module).
-- DifferentialModule.quasiConstantEquivGaloisRep: not stated; needs R^L with its Galois action
--   (RD.2/finite-etale-extension-of-bounded-robba-ring).
-- DifferentialModule.isQuasiConstant_tensor: not stated; needs tensor products and duals of
--   ∇-modules (RD.1/differential-module) and R^L.

/-- Test `DifferentialModule.trivial_isConstant` (degenerate). -/
example (n : ℕ) : IsConstant (DiffModule.trivial D n) := by sorry

-- DifferentialModule.kummer_quasiConstant: not stated; needs R^L for L = k((t^{1/2})).
-- DifferentialModule.constant_iff_H0: not stated; needs finrank over K of ker ∇.
-- DifferentialModule.exp_not_quasiConstant: not stated; needs R^L for all finite separable L.

/-! ### RD.2/unipotent-differential-module -/

/-- API `DifferentialModule.IsUnipotent`: a saturated filtration `0 = F 0 ≤ … ≤ F k = M` by
`∇`-stable submodules whose successive quotients are spanned by horizontal classes. -/
def IsUnipotent [IsDomain R] (E : DiffModule K R D) : Prop :=
  ∃ (k : ℕ) (F : Fin (k + 1) → Submodule R E.M),
    Monotone F ∧ F 0 = ⊥ ∧ F (Fin.last k) = ⊤ ∧
    (∀ i, ∀ m ∈ F i, E.nabla m ∈ F i) ∧
    (∀ i, ∀ (r : R) (m : E.M), r ≠ 0 → r • m ∈ F i → m ∈ F i) ∧
    (∀ i : Fin k, F i.succ ≤
      F i.castSucc ⊔ Submodule.span R {m : E.M | m ∈ F i.succ ∧ E.nabla m ∈ F i.castSucc})

/-- API `DifferentialModule.UnipotentBasis`: a basis `v` with `∇ v_j ∈ Σ_{i<j} R v_i`. -/
structure UnipotentBasis (E : DiffModule K R D) (n : ℕ) where
  /-- The basis. -/
  basis : Module.Basis (Fin n) R E.M
  mem_span : ∀ j, E.nabla (basis j) ∈ Submodule.span R (basis '' {i | i < j})

/-- API `DifferentialModule.StronglyUnipotentBasis`: a basis on which `∇_D` acts by a strictly
upper triangular matrix with entries in `K`. -/
structure StronglyUnipotentBasis (E : DiffModule K R D) (n : ℕ) where
  /-- The basis. -/
  basis : Module.Basis (Fin n) R E.M
  /-- The matrix of `∇_D`, with entries in `K`. -/
  mat : Matrix (Fin n) (Fin n) K
  upper : ∀ i j, j ≤ i → mat i j = 0
  nabla_eq : ∀ j, E.nabla (basis j) = ∑ i, algebraMap K R (mat i j) • basis i

/-- API `DifferentialModule.isUnipotent_iff_exists_unipotentBasis` (with `ker D = K`, so that
constant quotients have bases of horizontal sections). -/
theorem isUnipotent_iff_exists_unipotentBasis [IsDomain R] [IsBezout R]
    (hker : ∀ g : R, D g = 0 → ∃ c : K, g = algebraMap K R c) (E : DiffModule K R D) :
    IsUnipotent E ↔ ∃ n, Nonempty (UnipotentBasis E n) := by
  sorry

/-- API `DifferentialModule.exists_stronglyUnipotentBasis` (Crew 6.7; overview Proposition
4.5.3), under the two properties of `D = t d/dt` on the Robba ring used in the proof. -/
theorem exists_stronglyUnipotentBasis [IsDomain R] [IsBezout R]
    (hsurj : ∀ f : R, ∃ (g : R) (c : K), f = D g + algebraMap K R c)
    (hker : ∀ g : R, D g = 0 → ∃ c : K, g = algebraMap K R c)
    (E : DiffModule K R D) (hE : IsUnipotent E) :
    ∃ n, Nonempty (StronglyUnipotentBasis E n) := by
  sorry

/-- API `DifferentialModule.isConstant.isUnipotent`. -/
theorem isConstant.isUnipotent [IsDomain R] {E : DiffModule K R D} (h : IsConstant E) :
    IsUnipotent E := by
  sorry

-- DifferentialModule.isUnipotent_closure: not stated; needs direct sums, tensor products, duals
--   and subquotients of ∇-modules (RD.1/differential-module).
-- DifferentialModule.isUnipotent_comap: not stated; needs pullback along continuous automorphisms
--   of R_K and base change to R^L (RD.0/robba-ring, RD.2/finite-etale-extension-of-bounded-robba-ring).

/-- Test `DifferentialModule.trivial_isUnipotent` (degenerate). -/
example [IsDomain R] (n : ℕ) : IsUnipotent (DiffModule.trivial D n) := by sorry

/-- Test `DifferentialModule.log_isUnipotent` (computation): unipotent, and not constant as soon
as `ker D = K` and `1` is not `D`-exact (for the Robba ring: `dt/t` has residue `1`). -/
example [IsDomain R] (hker : ∀ g : R, D g = 0 → ∃ c : K, g = algebraMap K R c)
    (h1 : ∀ g : R, D g ≠ 1) :
    IsUnipotent (logModule D) ∧ ¬ IsConstant (logModule D) := by sorry

/-- Test `DifferentialModule.isUnipotent_iff_basis` (characterisation). -/
example [IsDomain R] [IsBezout R]
    (hsurj : ∀ f : R, ∃ (g : R) (c : K), f = D g + algebraMap K R c)
    (hker : ∀ g : R, D g = 0 → ∃ c : K, g = algebraMap K R c) (E : DiffModule K R D) :
    IsUnipotent E ↔ ∃ n, Nonempty (StronglyUnipotentBasis E n) := by sorry

/-- Test `DifferentialModule.kummer_not_unipotent` (non-example): `∇ e = (1/2) e` is not
unipotent when `D g = -(1/2) g` has no nonzero solution (for `R_K`: `t^{-1/2} ∉ R_K`). -/
example [IsDomain R] (h : ∀ g : R, D g + (2⁻¹ : K) • g = 0 → g = 0) :
    ¬ IsUnipotent (rankOne D (algebraMap K R 2⁻¹)) := by sorry

/-- Test `DifferentialModule.exp_not_unipotent` (non-example), over `R` itself: `∇_D e = t e`
(that is, `∇ e = e ⊗ dt`) is not unipotent when `D g = - t g` has no nonzero solution
(for `R_K`: `exp(-t) ∉ R_K`).  The statement over every `R^L` needs RD.2/finite-etale-extension-of-bounded-robba-ring. -/
example [IsDomain R] (t : R) (h : ∀ g : R, D g + t * g = 0 → g = 0) :
    ¬ IsUnipotent (rankOne D t) := by sorry

/-! ### RD.2/unipotent-iff-nilpotent-residue (theorem) -/

/-- Theorem `unipotent-iff-nilpotent-residue` (Crew 6.7): under `hsurj` and `hker`, `M` is
unipotent iff it has a basis on which `∇_D` acts through a nilpotent matrix over `K`. -/
theorem isUnipotent_iff_nilpotent_residue [IsDomain R] [IsBezout R]
    (hsurj : ∀ f : R, ∃ (g : R) (c : K), f = D g + algebraMap K R c)
    (hker : ∀ g : R, D g = 0 → ∃ c : K, g = algebraMap K R c) (E : DiffModule K R D) :
    IsUnipotent E ↔ ∃ (n : ℕ) (b : Module.Basis (Fin n) R E.M) (N : Matrix (Fin n) (Fin n) K),
      IsNilpotent N ∧ ∀ j, E.nabla (b j) = ∑ i, algebraMap K R (N i j) • b i := by
  sorry

/-! ### RD.2/quasi-unipotent-differential-module -/

-- DifferentialModule.IsQuasiUnipotent: not stated; needs R^L (RD.2/finite-etale-extension-of-bounded-robba-ring)
--   and base change of ∇-modules; the class of allowed L (finite separable, or nearly finite
--   separable when k is imperfect) cannot be expressed without the Robba ring.
-- DifferentialModule.isQuasiUnipotent_iff_filtration: not stated; needs IsQuasiUnipotent.
-- DifferentialModule.canonicalUnipotentFiltration: not stated; needs R^L and its Galois action.
-- DifferentialModule.isQuasiUnipotent_closure: not stated; needs IsQuasiUnipotent and tensor products.
-- DifferentialModule.isQuasiUnipotent_of_isUnipotent: not stated; needs IsQuasiUnipotent.
-- DifferentialModule.isQuasiUnipotent_baseChange: not stated; needs R^L.
-- DifferentialModule.isQuasiUnipotent_trivial: not stated; needs IsQuasiUnipotent.
-- DifferentialModule.kummer_isQuasiUnipotent: not stated; needs R^L for L = k((t^{1/2})).
-- DifferentialModule.isQuasiUnipotent_iff_filtration_test: not stated; needs IsQuasiUnipotent.
-- DifferentialModule.exp_not_isQuasiUnipotent: not stated; needs R^L for all L.

end DifferentialModule

/-! ## RD.2/log-robba-ring — the logarithmic extension `R[ℓ]`

`ℓ = log u` is the polynomial variable; `D = u d/du` extends by `D ℓ = 1`. -/

/-- API `RobbaLog`: `R_log = R[ℓ]`. -/
abbrev RobbaLog (R : Type u) [CommRing R] := R[X]

namespace RobbaLog

variable {K : Type u} {R : Type u} [Field K] [CommRing R] [Algebra K R]

/-- API `RobbaLog.frobenius`: `φ(ℓ) = q ℓ + c` with `c = log(φ(u)/u^q) ∈ R`, extending `φ`. -/
noncomputable def frobenius (φ : R →+* R) (q : ℕ) (c : R) : RobbaLog R →+* RobbaLog R :=
  Polynomial.eval₂RingHom (Polynomial.C.comp φ) (Polynomial.C (q : R) * X + Polynomial.C c)

/-- API `RobbaLog.derivation`: `D` extended to `R[ℓ]` by `D ℓ = 1`
(coefficientwise `D` plus `d/dℓ`). -/
noncomputable def derivation (D : Derivation K R R) : Derivation K (RobbaLog R) (RobbaLog R) where
  toFun f := (f.sum fun n a => Polynomial.monomial n (D a)) + Polynomial.derivative f
  map_add' := by sorry
  map_smul' := by sorry
  map_one_eq_zero' := by sorry
  leibniz' := by sorry

/-- API `RobbaLog.monodromy`: `N = - d/dℓ`, `R`-linear, `N ℓ = -1`. -/
noncomputable def monodromy : RobbaLog R →ₗ[R] RobbaLog R :=
  -(Polynomial.derivative : R[X] →ₗ[R] R[X])

/-- API `RobbaLog.monodromy_frobenius`: `N ∘ φ = q · φ ∘ N`. -/
theorem monodromy_frobenius (φ : R →+* R) (q : ℕ) (c : R) (f : RobbaLog R) :
    monodromy (frobenius φ q c f) = (q : RobbaLog R) * frobenius φ q c (monodromy f) := by
  sorry

/-- API `RobbaLog.monodromy_derivation_comm`: `N` commutes with `D`. -/
theorem monodromy_derivation_comm (D : Derivation K R R) (f : RobbaLog R) :
    monodromy (derivation D f) = derivation D (monodromy f) := by
  sorry

/-- API `RobbaLog.ker_monodromy`: `ker N = R` (characteristic zero). -/
theorem ker_monodromy [IsDomain R] [CharZero R] (f : RobbaLog R) :
    monodromy f = 0 ↔ ∃ a : R, f = Polynomial.C a := by
  sorry

/-- API `RobbaLog.logOfUniformizer_indep`: changing `u` changes `ℓ` by `c ∈ R`; the substitution
`ℓ ↦ ℓ + c` is an `R`-algebra automorphism of `R[ℓ]`. -/
noncomputable def logOfUniformizer_indep (c : R) : RobbaLog R ≃ₐ[R] RobbaLog R :=
  Polynomial.algEquivAevalXAddC c

-- RobbaLog.galoisAction: not stated; needs R^L with its Galois action
--   (RD.2/finite-etale-extension-of-bounded-robba-ring).

/-- Test `RobbaLog.standard_frobenius_log` (computation): if `φ(u) = u^q` then `φ(ℓ) = q ℓ`. -/
example (φ : R →+* R) (q : ℕ) :
    frobenius φ q 0 X = Polynomial.C (q : R) * X ∧
      frobenius φ q 0 (X ^ 2) = Polynomial.C ((q : R) ^ 2) * X ^ 2 := by sorry

/-- Test `RobbaLog.monodromy_log_pow` (computation). -/
example (m : ℕ) (f : R) :
    monodromy (X ^ m : RobbaLog R) = -(Polynomial.C (m : R) * X ^ (m - 1)) ∧
      monodromy (Polynomial.C f * X) = -Polynomial.C f := by sorry

/-- Test `RobbaLog.degree_zero` (degenerate). -/
example [IsDomain R] [CharZero R] (f : RobbaLog R) (hf : f.natDegree = 0) : monodromy f = 0 := by
  sorry

-- RobbaLog.berger_compat: not stated; needs Berger's B†_rig,Q_p (PadicHodgeTheory:P7:annulus-foundations).
-- RobbaLog.log_not_in_robba: not stated; needs the Robba ring (the residue of du/u is 1;
--   RD.2/robba-ring-antiderivative).

end RobbaLog

/-! ## RD.2/solution-space-phi-n-module — solutions in `R[ℓ]` of a ∇-module in matrix form

For a free module with basis `e_1..e_n` and `∇_D e_j = Σ_i G i j e_i`, the solution space is
`{v ∈ R[ℓ]^n : D v + G v = 0}`. -/

section SolutionSpaceDef

variable {K : Type u} {R : Type u} [Field K] [CommRing R] [Algebra K R]

/-- API `SolutionSpace`: `V(M) = (M ⊗ R[ℓ])^{∇ = 0}` for `M` given by its connection matrix
(over `R^L` this is `V_L(M)`; the extension `R^L` itself is Part A's / RD.2's). -/
def SolutionSpace (D : Derivation K R R) {n : ℕ} (G : Matrix (Fin n) (Fin n) R) :
    AddSubgroup (Fin n → RobbaLog R) where
  carrier := {v | ∀ i, RobbaLog.derivation D (v i) + ∑ j, Polynomial.C (G i j) * v j = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry

end SolutionSpaceDef

namespace SolutionSpace

variable {K : Type u} {R : Type u} [Field K] [CommRing R] [Algebra K R]

/-- API `SolutionSpace.monodromy`: `N` acting coordinatewise. -/
noncomputable def monodromy {n : ℕ} (v : Fin n → RobbaLog R) : Fin n → RobbaLog R :=
  fun i => RobbaLog.monodromy (v i)

-- SolutionSpace.frobenius: not stated; needs the Frobenius structure of a (φ,∇)-module
--   (RD.1/frobenius-differential-module) together with its matrix over R^L.
-- SolutionSpace.monodromy_frobenius: not stated; needs SolutionSpace.frobenius.
-- SolutionSpace.galoisAction: not stated; needs R^L with its Galois action.
-- SolutionSpace.comparison: not stated; needs the local monodromy theorem over the Robba ring
--   (RD.2/logarithmic-form-of-local-monodromy).
-- SolutionSpace.finrank: not stated; needs the local monodromy theorem.
-- SolutionSpace.map: not stated; needs morphisms and tensor products of (φ,∇)-modules.
-- SolutionSpace.baseChange: not stated; needs R^L ⊆ R^{L'}.

/-- Test `SolutionSpace.trivial` (degenerate): for the trivial connection the solutions are the
vectors of `D`-constants of `R[ℓ]`. -/
example (D : Derivation K R R) (n : ℕ) (v : Fin n → RobbaLog R) :
    v ∈ SolutionSpace D (0 : Matrix (Fin n) (Fin n) R) ↔ ∀ i, RobbaLog.derivation D (v i) = 0 := by sorry

/-- Test `SolutionSpace.unipotent_example` (computation): for `∇ e_1 = 0`, `∇ e_2 = e_1`
the vector `e_2 - ℓ e_1` is horizontal and `N` maps it to `e_1`. -/
example (D : Derivation K R R) :
    ![-X, 1] ∈ SolutionSpace D !![(0 : R), 1; 0, 0] ∧ monodromy ![-X, (1 : RobbaLog R)] = ![1, 0] := by
  sorry

-- SolutionSpace.finrank_eq_rank: not stated; needs the local monodromy theorem.
-- SolutionSpace.not_for_nonsolvable: not stated; needs R^L for all L.

end SolutionSpace

/-! ## RD.2/finite-etale-extension-of-bounded-robba-ring -/

-- RobbaExtension.intAlg: not stated; needs R^int (RD.0/bounded-robba-ring) and the henselian
--   lifting of finite separable extensions of k((t)) (RD.0/finite-separable-extensions-of-analytic-rings).
-- RobbaExtension.robba: not stated; needs R_K (RD.0/robba-ring) and RobbaExtension.intAlg.
-- RobbaExtension.bounded: not stated; needs R^bd (RD.0/bounded-robba-ring).
-- RobbaExtension.frobenius: not stated; needs the Frobenius lift (RD.0/frobenius-lift-on-robba-ring).
-- RobbaExtension.derivation: not stated; needs the derivation on R_K (RD.0/derivation-on-robba-ring).
-- RobbaExtension.galoisAction: not stated; needs RobbaExtension.robba.
-- RobbaExtension.equivOfResidue: not stated; needs RobbaExtension.intAlg.
-- RobbaExtension.isoRobbaOfUniformizer: not stated; needs RD.0/robba-ring over K'.
-- RobbaExtension.isBezout: not stated; needs RobbaExtension.robba (RD.0/analytic-ring-bezout).
-- RobbaExtension.trans: not stated; needs RobbaExtension.robba.
-- RobbaExtension.trivial: not stated; needs RobbaExtension.robba.
-- RobbaExtension.kummer: not stated; needs RobbaExtension.robba.
-- RobbaExtension.artinSchreier: not stated; needs R^int (RD.0/bounded-robba-ring).
-- RobbaExtension.galois_fixed: not stated; needs RobbaExtension.galoisAction.
-- RobbaExtension.not_etale_purely_inseparable: not stated; needs R^int.

/-! ## RD.2 named theorems (statements need Part A's rings) -/

-- slope-filtration-for-frobenius-modules-statement: not stated; needs σ-modules over the Robba
--   ring and their slopes (RD.1/frobenius-module, RD.1/frobenius-slopes, RD.0/robba-ring).
-- isoclinic-descent-to-bounded-robba-ring: not stated; needs RD.1/isoclinic-frobenius-module.
-- tsuzuki-unit-root-finite-monodromy: not stated; needs RD.1/frobenius-differential-module and R^L.
-- quasi-unipotence-and-local-monodromy-statement: not stated; needs RD.1/frobenius-differential-module
--   and DifferentialModule.IsQuasiUnipotent.
-- local-monodromy-finite-etale-form: not stated; needs RobbaExtension.robba.
-- logarithmic-form-of-local-monodromy: not stated; needs R^L_log over the Robba ring.
-- monodromy-representation-equivalence: not stated; needs SolutionSpace.frobenius and galoisAction.
-- berger-form-of-local-monodromy: not stated; needs Berger's rings (PadicHodgeTheory:P7:annulus-foundations).

/-! ## RD.3 — overconvergent isocrystals and frames

Mathlib has schemes (`AlgebraicGeometry.Scheme`, `IsOpenImmersion`, `IsClosedImmersion`,
`IsProper`, `Smooth`) but no formal schemes, generic fibres, rigid analytic spaces or tubes.
Frames need `P` a formal `O_K`-scheme and tubes need its generic fibre (AdicSpacesPartII:R2);
none of the RD.3 objects can be declared honestly here. -/

-- Frame: not stated; needs formal O_K-schemes and their special fibres (AdicSpacesPartII:R2)
--   and open/closed immersions of k-schemes (mathlib IsOpenImmersion, IsClosedImmersion).
-- Frame.IsProper: not stated; needs Frame (mathlib IsProper for Y → Spec k).
-- Frame.Hom: not stated; needs Frame.
-- Frame.Hom.IsSmoothNear: not stated; needs smoothness of formal schemes near X (AdicSpacesPartII:R2).
-- Frame.boundary: not stated; needs Frame.
-- Frame.id_comp: not stated; needs Frame.Hom.
-- Frame.prod: not stated; needs fibre products of formal schemes (AdicSpacesPartII:R2).
-- Frame.affineSpace: not stated; needs formal projective spaces (AdicSpacesPartII:R2).
-- Frame.affineLine_tube: not stated; needs generic fibres (AdicSpacesPartII:R2).
-- Frame.proper_self: not stated; needs Frame.
-- Frame.scheme_compat: not stated; needs Frame (its algebraic part uses mathlib
--   AlgebraicGeometry.IsOpenImmersion and AlgebraicGeometry.IsClosedImmersion).
-- Frame.not_frame_nonsmooth: not stated; needs Frame.
-- Frame.tube: not stated; needs the specialisation map sp : P_K → P (AdicSpacesPartII:R2).
-- Frame.tube_eq_of_equations: not stated; needs Frame.tube.
-- Frame.tubeRadius: not stated; needs Frame.tube.
-- Frame.tube_mono: not stated; needs Frame.tube.
-- Frame.tube_map: not stated; needs Frame.tube and Frame.Hom.
-- Frame.tube_isQuasiStein: not stated; needs quasi-Stein spaces (AdicSpacesPartII:R3).
-- Frame.tube_union_radius: not stated; needs admissible coverings (AdicSpacesPartII:R2).
-- Frame.tube_point_affineLine: not stated; needs Frame.tube.
-- Frame.tube_whole: not stated; needs Frame.tube.
-- Frame.tube_closedDisc_notEqual_open: not stated; needs Frame.tube.
-- Frame.tube_radius_limit: not stated; needs Frame.tubeRadius.
-- Frame.IsStrictNbhd: not stated; needs admissible opens and coverings of ]Y[ (AdicSpacesPartII:R2).
-- Frame.complementOfTube: not stated; needs Frame.tubeRadius.
-- Frame.isStrictNbhd_complementOfTube: not stated; needs Frame.IsStrictNbhd.
-- Frame.IsStrictNbhd.inter: not stated; needs Frame.IsStrictNbhd.
-- Frame.IsStrictNbhd.preimage: not stated; needs Frame.IsStrictNbhd and Frame.Hom.
-- Frame.IsStrictNbhd.cofinal: not stated; needs Frame.IsStrictNbhd.
-- Frame.isStrictNbhd_proper: not stated; needs Frame.IsStrictNbhd.
-- Frame.strictNbhd_affineLine: not stated; needs Frame.IsStrictNbhd.
-- Frame.strictNbhd_proper: not stated; needs Frame.IsStrictNbhd.
-- Frame.tube_not_strictNbhd: not stated; needs Frame.IsStrictNbhd.
-- Frame.strictNbhd_iff_complement: not stated; needs Frame.IsStrictNbhd.
-- Frame.jDagger: not stated; needs sheaves on rigid spaces (AdicSpacesPartII:R3).
-- Frame.jDagger_eq_lim_strictNbhd: not stated; needs Frame.jDagger.
-- Frame.jDaggerStructureSheaf: not stated; needs Frame.jDagger.
-- Frame.jDagger_restrict: not stated; needs Frame.jDagger.
-- Frame.jDagger_exact_coherent: not stated; needs coherent sheaves (AdicSpacesPartII:R3).
-- Frame.jDagger_tensor: not stated; needs Frame.jDagger.
-- Frame.jDagger_map: not stated; needs Frame.jDagger and Frame.Hom.
-- Frame.jDagger_empty_boundary: not stated; needs Frame.jDagger.
-- Frame.jDagger_affineLine_global: not stated; needs Frame.jDagger (its value K⟨t⟩† is
--   `overconvergentPowerSeries K 1` below).
-- Frame.jDagger_trivial_boundary: not stated; needs Frame.jDagger.
-- Frame.jDagger_restrict_test: not stated; needs Frame.jDagger.
-- Frame.jDagger_ne_restriction: not stated; needs Frame.jDagger.
-- OverconvergentIsocrystal: not stated; needs j†O-modules on a frame (Frame.jDagger).
-- OverconvergentIsocrystal.connection: not stated; needs OverconvergentIsocrystal.
-- OverconvergentIsocrystal.taylorIso: not stated; needs OverconvergentIsocrystal.
-- OverconvergentIsocrystal.Hom: not stated; needs OverconvergentIsocrystal.
-- OverconvergentIsocrystal.tensor: not stated; needs OverconvergentIsocrystal.
-- OverconvergentIsocrystal.unit: not stated; needs Frame.jDaggerStructureSheaf.
-- OverconvergentIsocrystal.restrictStrictNbhd: not stated; needs Frame.IsStrictNbhd.
-- OverconvergentIsocrystal.pullback: not stated; needs Frame.Hom.
-- OverconvergentIsocrystal.isLocallyFree_of_coherent: not stated; needs coherent j†O-modules.
-- OverconvergentIsocrystal.dwork_taylor: not stated; needs OverconvergentIsocrystal.
-- OverconvergentIsocrystal.unit_proper: not stated; needs OverconvergentIsocrystal.
-- OverconvergentIsocrystal.restriction_iso: not stated; needs OverconvergentIsocrystal.
-- OverconvergentIsocrystal.convergent_not_overconvergent: not stated; needs convergent
--   isocrystals (CrystallineCohomology:CR.3).
-- OverconvergentIsocrystal.pullbackFunctor: not stated; needs Frame.Hom.
-- OverconvergentIsocrystal.pullback_id: not stated; needs pullbackFunctor.
-- OverconvergentIsocrystal.pullback_comp: not stated; needs pullbackFunctor.
-- OverconvergentIsocrystal.pullback_tensor: not stated; needs pullbackFunctor.
-- OverconvergentIsocrystal.pullback_connection: not stated; needs pullbackFunctor.
-- OverconvergentIsocrystal.pullback_unit: not stated; needs pullbackFunctor.
-- OverconvergentIsocrystal.pullback_dwork: not stated; needs pullbackFunctor.
-- OverconvergentIsocrystal.pullback_comp_test: not stated; needs pullbackFunctor.
-- OverconvergentIsocrystal.pullback_not_equiv_nonsmooth: not stated; needs pullbackFunctor.
-- IsocDagger: not stated; needs OverconvergentIsocrystal and Nagata compactifications
--   (SchemeAndStackFoundations:SF.0).
-- IsocDagger.ofFrame: not stated; needs IsocDagger.
-- IsocDagger.pullback: not stated; needs IsocDagger.
-- IsocDagger.isStack: not stated; needs IsocDagger.
-- IsocDagger.monoidal: not stated; needs IsocDagger.
-- IsocDagger.proper_eq_convergent: not stated; needs convergent isocrystals (CrystallineCohomology:CR.3).
-- IsocDagger.affineLine: not stated; needs IsocDagger.
-- IsocDagger.point: not stated; needs IsocDagger.
-- IsocDagger.proper_convergent: not stated; needs IsocDagger.
-- IsocDagger.not_convergent_affine: not stated; needs IsocDagger.
-- FIsocDagger: not stated; needs IsocDagger and a Frobenius lift on frames
--   (RD.0/frobenius-lift-on-dagger-algebra).
-- FIsocDagger.frobeniusPullback: not stated; needs FIsocDagger.
-- FIsocDagger.forget: not stated; needs FIsocDagger.
-- FIsocDagger.tensor: not stated; needs FIsocDagger.
-- FIsocDagger.pullback: not stated; needs FIsocDagger.
-- FIsocDagger.independent_of_lift: not stated; needs FIsocDagger.
-- FIsocDagger.pointFiber: not stated; needs FIsocDagger (its target for X = Spec k, k
--   algebraically closed, q = p, is mathlib WittVector.Isocrystal).
-- FIsocDagger.localAtBoundary: not stated; needs FIsocDagger and the Robba ring (RD.0/robba-ring).
-- FIsocDagger.dwork: not stated; needs FIsocDagger.
-- FIsocDagger.unit: not stated; needs FIsocDagger.
-- FIsocDagger.point_compat: not stated; needs FIsocDagger (compare mathlib WittVector.Isocrystal
--   and WittVector.isocrystal_classification).
-- FIsocDagger.twist: not stated; needs FIsocDagger.
-- FIsocDagger.no_frobenius_example: not stated; needs FIsocDagger.
-- FIsocDagger.restrictConvergent: not stated; needs convergent F-isocrystals (CrystallineCohomology:CR.3).
-- FIsocDagger.restrictConvergent_tensor: not stated; needs restrictConvergent.
-- FIsocDagger.restrictConvergent_pullback: not stated; needs restrictConvergent.
-- FIsocDagger.restrictConvergent_faithful: not stated; needs restrictConvergent.
-- FIsocDagger.restrictConvergent_proper: not stated; needs restrictConvergent.
-- FIsocDagger.restrictConvergent_CR3: not stated; needs CrystallineCohomology:CR.3.
-- FIsocDagger.restrict_unit: not stated; needs restrictConvergent.
-- FIsocDagger.restrict_dwork: not stated; needs restrictConvergent.
-- FIsocDagger.restrict_proper_equiv: not stated; needs restrictConvergent.
-- FIsocDagger.restrict_not_essSurj: not stated; needs restrictConvergent.
-- FIsocDagger.restrict_ordinary_locus: not stated; needs restrictConvergent and modular curves.
-- FIsocDagger.pushforward: not stated; needs FIsocDagger and finite étale morphisms.
-- FIsocDagger.pushforward_rank: not stated; needs pushforward.
-- FIsocDagger.pushforward_H0: not stated; needs pushforward.
-- FIsocDagger.pushforward_restrict: not stated; needs pushforward and restrictConvergent.
-- FIsocDagger.pushforward_adjoint: not stated; needs pushforward.
-- FIsocDagger.pushforward_id: not stated; needs pushforward.
-- FIsocDagger.pushforward_rank_test: not stated; needs pushforward.
-- FIsocDagger.pushforward_H0_test: not stated; needs pushforward.
-- FIsocDagger.pushforward_not_for_ramified: not stated; needs pushforward.

/-! ## RD.3/rigid-quillen-suslin — stated concretely -/

/-- `K⟨t_1, …, t_n⟩†`: power series converging on some closed polydisc of radius `ρ > 1`
(coefficients times `ρ^{|m|}` tend to `0`). -/
def overconvergentPowerSeries (K : Type u) [NormedField K] (n : ℕ) :
    Subring (MvPowerSeries (Fin n) K) where
  carrier := {f | ∃ ρ : ℝ, 1 < ρ ∧
    Tendsto (fun m : Fin n →₀ ℕ => ‖MvPowerSeries.coeff m f‖ * ρ ^ (m.sum fun _ e => e))
      cofinite (𝓝 0)}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- Theorem `rigid-quillen-suslin` (Kedlaya, Full faithfulness, Theorem 6.7, field case):
finite projective modules over `K⟨t_1..t_n⟩†` are free. -/
theorem rigidQuillenSuslin (K : Type u) [NontriviallyNormedField K] [CompleteSpace K]
    [IsUltrametricDist K] (n : ℕ) (M : Type v) [AddCommGroup M]
    [Module (overconvergentPowerSeries K n) M] [Module.Finite (overconvergentPowerSeries K n) M]
    [Module.Projective (overconvergentPowerSeries K n) M] :
    Module.Free (overconvergentPowerSeries K n) M := by
  sorry

-- RD.3 named theorems (all need Frame, IsocDagger or FIsocDagger):
-- weak-fibration-theorem, strong-fibration-theorem, independence-of-frame,
-- independence-of-compactification, affine-smooth-description-of-overconvergent-f-isocrystals,
-- splitting-of-slope-separated-extensions, de-jong-tensor-injectivity, de-jong-rank-one-image,
-- local-full-faithfulness, etale-cover-of-affine-space, full-faithfulness-overconvergent-to-convergent:
-- not stated; need the objects above (AdicSpacesPartII:R2/R3, CrystallineCohomology:CR.3) and,
-- for the local statements, Part A's rings Γ_con, Γ, Γ^alg_con (RD.0/analytic-ring,
-- RD.0/extended-robba-ring).

end PartB

/-! # Layers RD.4 and RD.5: rigid cohomology, finiteness, duality and Künneth -/

section PartC

open Filter Topology
universe u

/-! ## RD.4 — F-spaces and Tate twists (`RD.4/frobenius-vector-space`, `RD.4/tate-twist`) -/

/-- API `FrobeniusSpace`: a `K`-vector space with a `σ`-semilinear endomorphism (not required
to be bijective: rigid cohomology groups are F-spaces before finiteness is known). -/
structure FrobeniusSpace (K : Type u) [Field K] (σ : K →+* K) where
  /-- The underlying vector space. -/
  carrier : Type u
  [instAddCommGroup : AddCommGroup carrier]
  [instModule : Module K carrier]
  /-- The Frobenius, a `σ`-semilinear endomorphism. -/
  frob : carrier →ₛₗ[σ] carrier

attribute [instance] FrobeniusSpace.instAddCommGroup FrobeniusSpace.instModule

namespace FrobeniusSpace

variable {K : Type u} [Field K] {σ : K →+* K}

/-- API `FrobeniusSpace.unit`: `K` with Frobenius `σ`. -/
def unit (K : Type u) [Field K] (σ : K →+* K) : FrobeniusSpace K σ where
  carrier := K
  frob := { toFun := σ, map_add' := σ.map_add, map_smul' := fun a b => by simp }

/-- API `FrobeniusSpace.Hom`: `K`-linear maps commuting with Frobenius. -/
structure Hom (M N : FrobeniusSpace K (RingHom.id K)) where
  /-- The underlying linear map. -/
  toLinearMap : M.carrier →ₗ[K] N.carrier
  comm : toLinearMap ∘ₗ M.frob = N.frob ∘ₗ toLinearMap

/-- API `FrobeniusSpace.tensor` (for `σ_K = id`). -/
noncomputable def tensor (M N : FrobeniusSpace K (RingHom.id K)) : FrobeniusSpace K (RingHom.id K) where
  carrier := TensorProduct K M.carrier N.carrier
  frob := TensorProduct.map M.frob N.frob

/-- API `FrobeniusSpace.dual` (for `σ_K = id` and bijective Frobenius): the inverse transpose. -/
noncomputable def dual (M : FrobeniusSpace K (RingHom.id K)) (hF : Function.Bijective M.frob) :
    FrobeniusSpace K (RingHom.id K) where
  carrier := Module.Dual K M.carrier
  frob := Module.Dual.transpose (R := K) (LinearEquiv.ofBijective M.frob hF).symm.toLinearMap

/-- API `FrobeniusSpace.charpoly` (for `σ_K = id`); `det(1 − Ft)` is its reverse. -/
noncomputable def charpoly (M : FrobeniusSpace K (RingHom.id K)) [FiniteDimensional K M.carrier] :
    Polynomial K :=
  LinearMap.charpoly M.frob

/-- API `FrobeniusSpace.toIsocrystal`: for `K = K(p, k)` and the Witt vector Frobenius, a
finite-dimensional F-space with bijective Frobenius is a Mathlib isocrystal. -/
noncomputable abbrev toIsocrystal (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] [IsDomain k]
    [CharP k p] [PerfectRing k p]
    (M : FrobeniusSpace (FractionRing (WittVector p k)) (WittVector.FractionRing.frobeniusRingHom p k))
    (_hF : Function.Bijective M.frob) : WittVector.Isocrystal p k M.carrier :=
  sorry

/-- API `FrobeniusSpace.tateTwist`: `V(n)` is `V` with Frobenius `q^{-n} F`; so `V(-i)` has `q^i F`. -/
noncomputable def tateTwist (q : K) (M : FrobeniusSpace K σ) (n : ℤ) : FrobeniusSpace K σ where
  carrier := M.carrier
  frob := (q ^ (-n)) • M.frob

/-- API `FrobeniusSpace.tateTwist_frob_apply`. -/
theorem tateTwist_frob_apply (q : K) (M : FrobeniusSpace K σ) (n : ℤ) (x : M.carrier) :
    (M.tateTwist q n).frob x = q ^ (-n) • M.frob x := rfl

/-- API `FrobeniusSpace.tateTwist_zero`. -/
theorem tateTwist_zero (q : K) (M : FrobeniusSpace K σ) (x : M.carrier) :
    (M.tateTwist q 0).frob x = M.frob x := by
  sorry

/-- API `FrobeniusSpace.tateTwist_add`. -/
theorem tateTwist_add (q : K) (hq : q ≠ 0) (M : FrobeniusSpace K σ) (m n : ℤ) (x : M.carrier) :
    ((M.tateTwist q n).tateTwist q m).frob x = (M.tateTwist q (n + m)).frob x := by
  sorry

/-- API `FrobeniusSpace.tateTwist_tensor`. -/
theorem tateTwist_tensor (q : K) (hq : q ≠ 0) (M N : FrobeniusSpace K (RingHom.id K)) (m n : ℤ)
    (x : M.carrier) (y : N.carrier) :
    ((M.tateTwist q m).tensor (N.tateTwist q n)).frob (x ⊗ₜ y) =
      ((M.tensor N).tateTwist q (m + n)).frob (x ⊗ₜ y) := by
  sorry

/-- API `FrobeniusSpace.tateTwist_dual`: the dual of `V(n)` is `V^∨(-n)`. -/
theorem tateTwist_dual (q : K) (hq : q ≠ 0) (M : FrobeniusSpace K (RingHom.id K))
    (hF : Function.Bijective M.frob) (hF' : Function.Bijective (M.tateTwist q 1).frob)
    (l : Module.Dual K M.carrier) :
    ((M.tateTwist q 1).dual hF').frob l = ((M.dual hF).tateTwist q (-1)).frob l := by
  sorry

/-- API `FrobeniusSpace.tateTwist_hasEigenvalue`: eigenvalues of `V(n)` are those of `V` times `q^{-n}`. -/
theorem tateTwist_hasEigenvalue (q : K) (M : FrobeniusSpace K (RingHom.id K)) (n : ℤ) (α : K)
    (h : Module.End.HasEigenvalue M.frob α) :
    Module.End.HasEigenvalue (M.tateTwist q n).frob (q ^ (-n) * α) := by
  sorry

/-- Test `FrobeniusSpace.unit_frob` (degenerate). -/
example (x : K) : (unit K (RingHom.id K)).frob x = x := rfl

/-- Test `tateTwist_unit_neg_one` (computation): `K(-1)` has Frobenius `q`. -/
example (q x : K) : ((unit K (RingHom.id K)).tateTwist q (-1)).frob x = q * x := by
  sorry

/-- Test `tateTwist_zero_test` (degenerate). -/
example (q : K) (M : FrobeniusSpace K σ) (x : M.carrier) :
    (M.tateTwist q 0).frob x = M.frob x := tateTwist_zero q M x

/-- Test `FrobeniusSpace.dual_twist` (computation): the dual of `K(-1)` has Frobenius `q⁻¹`. -/
example (q : K) (hq : q ≠ 0) (hF : Function.Bijective ((unit K (RingHom.id K)).tateTwist q (-1)).frob)
    (l : Module.Dual K K) :
    (((unit K (RingHom.id K)).tateTwist q (-1)).dual hF).frob l = q⁻¹ • l := by
  sorry

/-- Test `tateTwist_sign_nonexample` (non-example): with the opposite sign convention
`K(-1)` would have Frobenius `q⁻¹`, which differs from `q` as soon as `q ≠ ±1`. -/
example (q : K) (hq : q ^ 2 ≠ 1) : ((unit K (RingHom.id K)).tateTwist q (-1)).frob (1 : K) ≠ q⁻¹ := by
  sorry

/-- Test `tateTwist_standardOneDim` (compatibility): `K(-m)` is Mathlib's standard
one-dimensional isocrystal of slope `m` (Frobenius `p^m σ`). -/
example (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] [IsDomain k] [CharP k p] [PerfectRing k p]
    (m : ℤ) (x : FractionRing (WittVector p k)) :
    ((unit _ (WittVector.FractionRing.frobeniusRingHom p k)).tateTwist (p : FractionRing (WittVector p k)) (-m)).frob x =
      (p : FractionRing (WittVector p k)) ^ m * WittVector.FractionRing.frobeniusRingHom p k x := by
  sorry

/-- Test `FrobeniusSpace.isocrystal_compat` (compatibility). -/
example (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] [IsDomain k] [CharP k p] [PerfectRing k p]
    (M : FrobeniusSpace (FractionRing (WittVector p k)) (WittVector.FractionRing.frobeniusRingHom p k))
    (hF : Function.Bijective M.frob) (x : M.carrier) :
    letI := M.toIsocrystal p k hF
    (WittVector.Isocrystal.frobenius p k (V := M.carrier)).toLinearMap x = M.frob x := by
  sorry

/-- Test `FrobeniusSpace.zero_frob_nonexample` (non-example): `F = 0` on `K` is an F-space whose
Frobenius is not bijective, so it is not an F-isocrystal. -/
example : ¬ Function.Bijective (({ carrier := K, frob := 0 } : FrobeniusSpace K (RingHom.id K)).frob) := by
  sorry

end FrobeniusSpace

/-! ## RD.4 — (σ,∇)-modules in the curve form (`RD.3/sigma-nabla-module-over-dagger-algebra`)

`A` stands for the dagger algebra of a smooth affine curve with `Ω¹_A = A·ω`, `∂` the derivation
with `da = ∂(a)·ω`, `σ` a Frobenius lift (for `σ_K = id`) and `μ` with `dσ(ω) = μ·ω`. The
dagger algebra itself is supplied by `AdicSpacesPartII:F1`; here `A` is a parameter. -/

variable (K : Type u) [Field K] (A : Type u) [CommRing A] [Algebra K A]

/-- API `SigmaNablaModule` (curve form). The condition that the linearisation `σ^*M → M` of
`frob` is an isomorphism is part of the mathematical definition; it is omitted here because
stating it needs the base change of `M` along `σ` (a separate module structure through `σ`),
and is recorded in the roadmap. -/
structure SigmaNablaModule (d : Derivation K A A) (σ : A →ₐ[K] A) (μ : A) where
  /-- The underlying module. -/
  M : Type u
  [instAddCommGroup : AddCommGroup M]
  [instModuleA : Module A M]
  [instModuleK : Module K M]
  [instTower : IsScalarTower K A M]
  [instFinite : Module.Finite A M]
  [instProjective : Module.Projective A M]
  /-- The connection, `∇m = D(m) ⊗ ω`. -/
  D : M →ₗ[K] M
  leibniz : ∀ (a : A) (m : M), D (a • m) = a • D m + d a • m
  /-- The Frobenius. -/
  frob : M →ₗ[K] M
  frob_smul : ∀ (a : A) (m : M), frob (a • m) = σ a • frob m
  /-- Horizontality: `∇ ∘ F = (F ⊗ dσ) ∘ ∇`. -/
  horizontal : ∀ m : M, D (frob m) = μ • frob (D m)

attribute [instance] SigmaNablaModule.instAddCommGroup SigmaNablaModule.instModuleA
  SigmaNablaModule.instModuleK SigmaNablaModule.instTower SigmaNablaModule.instFinite
  SigmaNablaModule.instProjective

namespace SigmaNablaModule

variable {K A} {d : Derivation K A A} {σ : A →ₐ[K] A} {μ : A}

/-- API `SigmaNablaModule.trivial`: `(A, d, σ)`; horizontality needs `d ∘ σ = μ • σ ∘ d`. -/
noncomputable def trivial (hμ : ∀ a, d (σ a) = μ * σ (d a)) : SigmaNablaModule K A d σ μ where
  M := A
  D := d.toLinearMap
  leibniz := sorry
  frob := σ.toLinearMap
  frob_smul := sorry
  horizontal := sorry

/-- API `SigmaNablaModule.tensor`. -/
noncomputable def tensor (M N : SigmaNablaModule K A d σ μ) : SigmaNablaModule K A d σ μ := sorry

/-- API `SigmaNablaModule.dual`. -/
noncomputable def dual (M : SigmaNablaModule K A d σ μ) : SigmaNablaModule K A d σ μ := sorry

/-- API `SigmaNablaModule.pullback`: along a Frobenius-compatible map `f : A → B`. -/
noncomputable def pullback {B : Type u} [CommRing B] [Algebra K B] {dB : Derivation K B B}
    {σB : B →ₐ[K] B} {μB : B} (f : A →ₐ[K] B) (_hσ : f.comp σ = σB.comp f)
    (_hd : ∀ a, dB (f a) = f (d a)) (M : SigmaNablaModule K A d σ μ) :
    SigmaNablaModule K B dB σB μB := sorry

/-- API `SigmaNablaModule.pushforward`: along a finite étale `B → A`. -/
noncomputable def pushforward {B : Type u} [CommRing B] [Algebra K B] [Algebra B A]
    [IsScalarTower K B A] [Module.Finite B A] [Algebra.Etale B A] {dB : Derivation K B B}
    {σB : B →ₐ[K] B} {μB : B} (M : SigmaNablaModule K A d σ μ) :
    SigmaNablaModule K B dB σB μB := sorry

-- SigmaNablaModule.locallyFree_of_connection: not stated; needs the dagger algebra of MW-type
--   (regular, with derivations spanning the tangent spaces; AdicSpacesPartII:F1): over a general
--   ring a connection does not force local freeness (take d = 0).
-- SigmaNablaModule.isDirectSummand_of_sub: not stated; needs the same MW-type hypotheses.
-- SigmaNablaModule.changeOfFrobenius: not stated; needs the Taylor isomorphism on dagger algebras
--   (AdicSpacesPartII:F1) and RD.0/frobenius-lift-on-dagger-algebra.
-- Test `SigmaNablaModule.trivial_dual` (degenerate): not stated; needs morphisms of (σ,∇)-modules
--   and the body of `dual`.
-- Test `SigmaNablaModule.kummer_frobenius_iff` (characterisation): not stated; needs the ring
--   structure of `K⟨x, x⁻¹⟩†` (the coefficient model below is only a vector space).
-- Test `SigmaNablaModule.point_eq_isocrystal` (compatibility): see `FrobeniusSpace.toIsocrystal`.

/-! ### Monsky–Washnitzer cohomology in the curve form (`RD.4/monsky-washnitzer-cohomology`) -/

/-- API `SigmaNablaModule.mwH0`: horizontal sections. -/
def mwH0 (M : SigmaNablaModule K A d σ μ) : Submodule K M.M := LinearMap.ker M.D

/-- API `SigmaNablaModule.mwH1`: `coker ∇`, identifying `M ⊗ Ω¹` with `M` through `ω`. -/
def mwH1 (M : SigmaNablaModule K A d σ μ) : Type u := M.M ⧸ LinearMap.range M.D

/-- The Frobenius on one-forms, `m ⊗ ω ↦ F(m) ⊗ μω`. -/
noncomputable def frobOnForms (M : SigmaNablaModule K A d σ μ) : M.M →ₗ[K] M.M where
  toFun m := μ • M.frob m
  map_add' := sorry
  map_smul' := sorry

/-- API `SigmaNablaModule.mwH1Frobenius`. -/
noncomputable def mwH1Frobenius (M : SigmaNablaModule K A d σ μ) :
    (M.M ⧸ LinearMap.range M.D) →ₗ[K] (M.M ⧸ LinearMap.range M.D) :=
  Submodule.mapQ _ _ M.frobOnForms sorry

/-- API `SigmaNablaModule.mwCohomology_zero`. -/
theorem mwCohomology_zero (M : SigmaNablaModule K A d σ μ) (m : M.M) :
    m ∈ M.mwH0 ↔ M.D m = 0 := Iff.rfl

-- API `mwCohomology_of_dim_one`: holds by construction in this curve form (the complex has two
--   terms); the general form needs `Ω^i` of dagger algebras (AdicSpacesPartII:F1).
-- API `mwCohomology.map`: not stated; needs morphisms of (σ,∇)-modules.

-- API `mwCohomology.frobenius_injective`: not stated; needs finite flatness of the Frobenius lift
--   on a dagger algebra of MW-type and the de Rham trace (RD.4/de-rham-trace, AdicSpacesPartII:F1).
-- API `mwCohomology_trivial_zero`: not stated; needs geometric connectedness of the special fibre
--   of a dagger algebra (Monsky–Washnitzer, Theorem 7.1).

end SigmaNablaModule

/-- Test `mwH_point` (degenerate): if the connection is zero (the case of a point, where
`Ω¹ = 0`), every element is horizontal. -/
example {d : Derivation K A A} {σ : A →ₐ[K] A} {μ : A} (M : SigmaNablaModule K A d σ μ)
    (h : M.D = 0) : M.mwH0 = ⊤ := by
  sorry

/-! ## RD.4 — coefficient models of `K⟨x⟩†`, `K⟨x, x⁻¹⟩†` and of the compact-support complex
of `A¹` (the underlying `K`-vector spaces; the rings themselves are `RD.0` / `AdicSpacesPartII:F1`)
used for the computations of `RD.4/cohomology-of-affine-space`,
`RD.4/cohomology-of-multiplicative-group` and `RD.4/compactly-supported-cohomology-of-affine-space`. -/

section Models

variable (L : Type u) [NontriviallyNormedField L]

/-- Coefficient sequences of `L⟨x, x⁻¹⟩†`: `∃ ρ > 1, ‖a_n‖ ρ^{|n|} → 0`. -/
def overconvergentLaurent : Submodule L (ℤ → L) where
  carrier := {a | ∃ ρ : ℝ, 1 < ρ ∧ Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n.natAbs) cofinite (𝓝 0)}
  add_mem' := sorry
  zero_mem' := ⟨2, one_lt_two, by simp⟩
  smul_mem' := sorry

/-- Coefficient sequences of `L⟨x⟩†`: `∃ ρ > 1, ‖a_n‖ ρ^n → 0`. -/
def overconvergentPower : Submodule L (ℕ → L) where
  carrier := {a | ∃ ρ : ℝ, 1 < ρ ∧ Tendsto (fun n : ℕ => ‖a n‖ * ρ ^ n) atTop (𝓝 0)}
  add_mem' := sorry
  zero_mem' := ⟨2, one_lt_two, by simp⟩
  smul_mem' := sorry

/-- Coefficient sequences of the Tate algebra `L⟨x⟩`: `‖a_n‖ → 0`. -/
def tateCoeffs : Submodule L (ℕ → L) where
  carrier := {a | Tendsto (fun n : ℕ => ‖a n‖) atTop (𝓝 0)}
  add_mem' := sorry
  zero_mem' := by simp
  smul_mem' := sorry

/-- Coefficient sequences of functions on the open unit disc: `∀ η < 1, ‖a_n‖ η^n → 0`
(Berthelot's `M`, with `t = 1/x`). -/
def openDiscCoeffs : Submodule L (ℕ → L) where
  carrier := {a | ∀ η : ℝ, 0 < η → η < 1 → Tendsto (fun n : ℕ => ‖a n‖ * η ^ n) atTop (𝓝 0)}
  add_mem' := sorry
  zero_mem' := by intro η _ _; simp
  smul_mem' := sorry

/-- `x d/dx` on `L⟨x, x⁻¹⟩†` in the basis `dx/x` of one-forms: `(a_n) ↦ (n a_n)`. -/
noncomputable def eulerDerivative : overconvergentLaurent L →ₗ[L] overconvergentLaurent L :=
  (LinearMap.pi (fun n : ℤ => (n : L) • LinearMap.proj n)).restrict (fun _ _ => sorry)

/-- `d/dx` on `L⟨x⟩†` in the basis `dx`: `(a_n) ↦ ((n + 1) a_{n+1})`. -/
noncomputable def powerDerivative : overconvergentPower L →ₗ[L] overconvergentPower L :=
  (LinearMap.pi (fun n : ℕ => ((n : L) + 1) • LinearMap.proj (n + 1))).restrict (fun _ _ => sorry)

/-- `d/dx` on the Tate algebra `L⟨x⟩`. -/
noncomputable def tateDerivative : tateCoeffs L →ₗ[L] tateCoeffs L :=
  (LinearMap.pi (fun n : ℕ => ((n : L) + 1) • LinearMap.proj (n + 1))).restrict (fun _ _ => sorry)

/-- The Kummer connection `x d/dx + c` on `L⟨x, x⁻¹⟩†`: `(a_n) ↦ ((n + c) a_n)`. -/
noncomputable def kummerConnection (c : L) : overconvergentLaurent L →ₗ[L] overconvergentLaurent L :=
  (LinearMap.pi (fun n : ℤ => ((n : L) + c) • LinearMap.proj n)).restrict (fun _ _ => sorry)

/-- The residue `Σ a_n x^n dx/x ↦ a_0`. -/
noncomputable def residueMap : overconvergentLaurent L →ₗ[L] L :=
  (LinearMap.proj (0 : ℤ)).comp (overconvergentLaurent L).subtype

/-- The Frobenius `x ↦ x^q` on one-forms `f dx/x ↦ q σ(f) dx/x`, on coefficients. -/
noncomputable def laurentFormFrobenius (q : ℕ) : overconvergentLaurent L →ₗ[L] overconvergentLaurent L where
  toFun a := ⟨fun m => if (q : ℤ) ∣ m then (q : L) * a.1 (m / q) else 0, sorry⟩
  map_add' := sorry
  map_smul' := sorry

/-- The compact-support complex of `A¹` in degrees 1, 2 (`t = 1/x`): series with vanishing
constant term map to one-forms `Σ b_n t^n dt/t` by `(a_n) ↦ (n a_n)`. -/
noncomputable def compactSupportAffineLineDifferential : openDiscCoeffs L →ₗ[L] openDiscCoeffs L :=
  (LinearMap.pi (fun n : ℕ => (n : L) • LinearMap.proj n)).restrict (fun _ _ => sorry)

/-- The Frobenius `t ↦ t^q` on compact-support one-forms, on coefficients. -/
noncomputable def openDiscFormFrobenius (q : ℕ) : openDiscCoeffs L →ₗ[L] openDiscCoeffs L where
  toFun a := ⟨fun m => if q ∣ m then (q : L) * a.1 (m / q) else 0, sorry⟩
  map_add' := sorry
  map_smul' := sorry

/-- Test `mwH1_multiplicativeGroup` (computation): `H¹(L⟨x, x⁻¹⟩†) ≅ L` via the residue. -/
example [CharZero L] :
    Nonempty ((overconvergentLaurent L ⧸ LinearMap.range (eulerDerivative L)) ≃ₗ[L] L) := by
  sorry

/-- Test `mwH_affineLine` (computation), degree 1: `d/dx` is surjective on `L⟨x⟩†`. -/
example [CharZero L] : Function.Surjective (powerDerivative L) := by
  sorry

/-- Test `mwH_affineLine` (computation), degree 0: the kernel of `d/dx` is the constants. -/
example [CharZero L] (a : overconvergentPower L) :
    powerDerivative L a = 0 ↔ ∀ n, n ≠ 0 → a.1 n = 0 := by
  sorry

/-- Test `mwH1_tateAlgebra_nonexample` (non-example): on the Tate algebra `ℚ_p⟨x⟩` the
cokernel of `d/dx` is infinite dimensional. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ FiniteDimensional ℚ_[p] (tateCoeffs ℚ_[p] ⧸ LinearMap.range (tateDerivative ℚ_[p])) := by
  sorry

/-- Test `frobenius_gm_h1` (computation): the Frobenius `x ↦ x^q` multiplies the residue by `q`,
so it acts by `q` on `H¹(G_m) ≅ L`, i.e. `H¹_rig(G_m) = L(-1)`. -/
example (q : ℕ) (hq : 0 < q) (a : overconvergentLaurent L) :
    residueMap L (laurentFormFrobenius L q a) = (q : L) * residueMap L a := by
  sorry

/-- Test `compactSupportCohomology_affineLine` (computation), in the explicit model of
`RD.4/compact-support-cohomology-of-affine-space-with-coefficients`: on series with zero
constant term the differential is injective (`H¹_c(A¹) = 0`) and its cokernel is `L` via the
coefficient of `dt/t` (`H²_c(A¹) = L`). -/
example [CharZero L] :
    (∀ a : openDiscCoeffs L, a.1 0 = 0 → compactSupportAffineLineDifferential L a = 0 → a = 0) ∧
    Nonempty ((openDiscCoeffs L ⧸ LinearMap.range (compactSupportAffineLineDifferential L)) ≃ₗ[L] L) := by
  sorry

/-- Test `frobenius_affineLine_compact` (compatibility): `t ↦ t^q` multiplies the class of
`dt/t` by `q`, i.e. `H²_c(A¹) = L(-1)`, matching `#A¹(F_q) = q`. -/
example (q : ℕ) (hq : 0 < q) (a : openDiscCoeffs L) :
    (openDiscFormFrobenius L q a).1 0 = (q : L) * a.1 0 := by
  sorry

/-- Test `frobenius_point_trivial` (degenerate): on the point, Frobenius is `σ_K = id`. -/
example (x : L) : (FrobeniusSpace.unit L (RingHom.id L)).frob x = x := rfl

end Models

/-! ## RD.4 — rigid-analytic objects (not stated here)

The following API items and tests of RD.4 need rigid analytic spaces with their G-topology
(`AdicSpacesPartII:R2`), coherent cohomology and Kiehl's Theorem B (`AdicSpacesPartII:R3`),
dagger differential forms (`AdicSpacesPartII:F1`), frames and tubes (`RD.3/frame`, `RD.3/tube`,
`RD.3/strict-neighbourhood`) and overconvergent isocrystals (`RD.3/overconvergent-isocrystal`).
None of these exists in Mathlib or Tau Ceti, so no placeholder is introduced. -/

-- deRhamTrace, deRhamTrace_comp_map, deRhamTrace_wedge, deRhamTrace_zero, deRhamTrace_frobenius:
--   not stated; need Ω^• of dagger algebras (AdicSpacesPartII:F1).
-- Test `deRhamTrace_degree_one` (degenerate), Test `deRhamTrace_frobenius_power` (computation),
--   Test `deRhamTrace_algebraTrace` (compatibility, against Mathlib's `Algebra.trace`),
--   Test `deRhamTrace_not_retraction` (non-example): not stated; same reason.
-- jDagger, jDagger_exact, jDagger_restrict, cohomology_jDagger, overconvergentDeRham,
--   frameCohomology, overconvergentDeRham.map, overconvergentDeRham_affine: not stated; need
--   sheaves on tubes of frames (RD.3/tube, AdicSpacesPartII:R2).
-- Test `jDagger_of_proper` (degenerate), Test `jDagger_affineLine_sections` (computation),
--   Test `jDagger_restrict_tube` (compatibility), Test `convergent_deRham_affineLine_nonexample`
--   (non-example; its algebraic shadow is `mwH1_tateAlgebra_nonexample` above): not stated.
-- rigidCohomology, rigidCohomologyComplex, rigidCohomology.frameIso, rigidCohomology_point,
--   rigidCohomology_eq_mw, rigidCohomology_of_reduced: not stated; need RD.4/overconvergent-de-rham-complex.
-- Test `rigidCohomology_point_test` (degenerate), Test `rigidCohomology_affineLine` (computation;
--   algebraic model `mwH_affineLine`), Test `rigidCohomology_convergent_nonexample` (non-example),
--   Test `rigidCohomology_dwork_vanishes` (computation), Test `rigidCohomology_point_isocrystal`
--   (compatibility; model `FrobeniusSpace.isocrystal_compat`): not stated.
-- rigidCohomology.map, rigidCohomology.map_id, rigidCohomology.map_comp, rigidCohomology.mapCoeff,
--   rigidCohomology.map_mapCoeff, rigidCohomology.map_mw: not stated; need rigid cohomology.
-- Test `rigidCohomology.map_id_test` (degenerate), Test `rigidCohomology.map_structure_affineLine`
--   (computation), Test `rigidCohomology.map_mw_test` (compatibility),
--   Test `rigidCohomology.map_not_injective` (non-example): not stated.
-- compactSupportCohomology, compactSupportComplex, sectionsWithSupport, sectionsWithSupport_coherent,
--   compactSupportCohomology_of_proper, compactSupportCohomology.map, compactSupportCohomology_curve:
--   not stated; need RΓ_]X[ on strict neighbourhoods (RD.3, AdicSpacesPartII:R3).
-- Test `compactSupportCohomology_point` (degenerate), Test `compactSupportCohomology_ne_rigid`
--   (non-example), Test `compactSupportCohomology_curve_crew` (compatibility): not stated
--   (`compactSupportCohomology_affineLine` is stated above in the explicit model).
-- compactSupportCohomology.mapProper, compactSupportCohomology.extendByZero,
--   compactSupportCohomology.extendByZero_mapProper, compactSupportCohomology.mapCoeff: not stated.
-- Test `extendByZero_gm_affineLine` (computation), Test `mapProper_id` (degenerate),
--   Test `mapProper_requires_proper` (non-example), Test `mapProper_finite_etale` (compatibility): not stated.
-- forgetSupports, forgetSupports_bijective_of_proper, forgetSupports_frobenius, forgetSupports_natural:
--   not stated. Test `forgetSupports_affineLine_zero` (non-example), Test `forgetSupports_projectiveLine`
--   (degenerate), Test `forgetSupports_gm_zero` (computation): not stated.
-- rigidCohomology.frobenius, compactSupportCohomology.frobenius, frobenius_mw, frobenius_natural,
--   frobenius_injective, frobenius_tateTwist: not stated; need rigid cohomology (the MW-level
--   Frobenius is `SigmaNablaModule.mwH1Frobenius`).
-- Test `frobenius_absolute_nonexample` (non-example): not stated.
-- supportCohomology, supportCohomology_self, supportCohomology_empty, supportCohomology.frobenius,
--   supportCohomology.excise, supportCohomology.gysin: not stated. Test `supportCohomology_point_in_line`
--   (computation), Test `supportCohomology_self_test` (degenerate), Test `supportCohomology_ne_closed`
--   (non-example), Test `supportCohomology_localisation_A1` (compatibility): not stated.
-- FIsocDagger.pushforward_trace, FIsocDagger.pushforward_dual, FIsocDagger.pushforward_comp (the
--   pushforward itself is FIsocDagger.pushforward of section PartB): not stated; need F-Isoc†
--   (RD.3/overconvergent-f-isocrystal). The MW-level form is `SigmaNablaModule.pushforward`.
--   Test `FIsocDagger.pushforward_kummer` (computation), Test `FIsocDagger.pushforward_mw`
--   (compatibility): not stated.
-- Named theorems of RD.4 (independence of the embedding and of the compactification, the excision
--   and localisation sequences, the Gysin isomorphism, finite étale invariance, finite flat base
--   change, independence of the Frobenius lift, the Monsky–Washnitzer comparison and its curve
--   case, proper = convergent, the cohomology of A^n, G_m, P^1): not stated; need rigid cohomology.

/-! ## RD.5 — near-isomorphisms (`RD.5/near-isomorphism`) -/

section NearIsomorphism

variable {F V W X : Type u} [Field F] [AddCommGroup V] [Module F V] [AddCommGroup W] [Module F W]
  [AddCommGroup X] [Module F X]

/-- API `NearInjective`: the kernel is finite dimensional. -/
def NearInjective (f : V →ₗ[F] W) : Prop := FiniteDimensional F (LinearMap.ker f)

/-- API `NearSurjective`: the cokernel is finite dimensional. -/
def NearSurjective (f : V →ₗ[F] W) : Prop := FiniteDimensional F (W ⧸ LinearMap.range f)

/-- API `NearIsomorphism`. -/
def NearIsomorphism (f : V →ₗ[F] W) : Prop := NearInjective f ∧ NearSurjective f

/-- API `NearIsomorphism.index`: `dim ker f − dim coker f`. -/
noncomputable def NearIsomorphism.index (f : V →ₗ[F] W) : ℤ :=
  (Module.finrank F (LinearMap.ker f) : ℤ) - Module.finrank F (W ⧸ LinearMap.range f)

/-- API `NearInjective.of_comp`. -/
theorem NearInjective.of_comp {f : V →ₗ[F] W} {g : W →ₗ[F] X} (h : NearInjective (g ∘ₗ f)) :
    NearInjective f := by
  sorry

/-- API `NearSurjective.of_comp`. -/
theorem NearSurjective.of_comp {f : V →ₗ[F] W} {g : W →ₗ[F] X} (h : NearSurjective (g ∘ₗ f)) :
    NearSurjective g := by
  sorry

/-- API `NearIsomorphism.two_of_three` (one of the three cases; the others are analogous). -/
theorem NearIsomorphism.two_of_three {f : V →ₗ[F] W} {g : W →ₗ[F] X} (hf : NearIsomorphism f)
    (hg : NearIsomorphism g) : NearIsomorphism (g ∘ₗ f) ∧
      NearIsomorphism.index (g ∘ₗ f) = NearIsomorphism.index f + NearIsomorphism.index g := by
  sorry

/-- API `NearIsomorphism.of_square`. -/
theorem NearIsomorphism.of_square {Y : Type u} [AddCommGroup Y] [Module F Y]
    {f : V →ₗ[F] W} {g : V →ₗ[F] X} {h : W →ₗ[F] Y} {k : X →ₗ[F] Y} (hsq : h ∘ₗ f = k ∘ₗ g)
    (hf : NearIsomorphism f) (hh : NearIsomorphism h) (hk : NearIsomorphism k) :
    NearIsomorphism g := by
  sorry

/-- API `NearIsomorphism.of_bijective`. -/
theorem NearIsomorphism.of_bijective (e : V ≃ₗ[F] W) :
    NearIsomorphism e.toLinearMap ∧ NearIsomorphism.index e.toLinearMap = 0 := by
  sorry

/-- Test `NearIsomorphism.of_finiteDimensional` (degenerate). -/
example [FiniteDimensional F V] [FiniteDimensional F W] (f : V →ₗ[F] W) : NearIsomorphism f := by
  sorry

/-- Test `NearInjective.zero_nonexample` (non-example). -/
example (h : ¬ FiniteDimensional F V) : ¬ NearInjective (0 : V →ₗ[F] V) := by
  sorry

/-- Test `NearIsomorphism.linearEquiv_compat` (compatibility). -/
example (e : V ≃ₗ[F] W) : NearIsomorphism e.toLinearMap := (NearIsomorphism.of_bijective e).1

end NearIsomorphism

/-- Test `NearIsomorphism.gm_derivative` (computation): `x d/dx` on `L⟨x, x⁻¹⟩†` is a
near-isomorphism of index `0` (kernel and cokernel of dimension one). -/
example (L : Type u) [NontriviallyNormedField L] [CharZero L] :
    NearIsomorphism (eulerDerivative L) ∧ NearIsomorphism.index (eulerDerivative L) = 0 := by
  sorry

/-! ## RD.5 — strict maps (`RD.5/strict-map`) -/

section Strict

variable {𝕜 V W V' W' : Type u} [NontriviallyNormedField 𝕜]
  [AddCommGroup V] [Module 𝕜 V] [TopologicalSpace V]
  [AddCommGroup W] [Module 𝕜 W] [TopologicalSpace W]
  [AddCommGroup V'] [Module 𝕜 V'] [TopologicalSpace V']
  [AddCommGroup W'] [Module 𝕜 W'] [TopologicalSpace W']

/-- API `IsStrict`: `V / ker f → im f` is a homeomorphism, i.e. the corestriction of `f` to its
image (with the subspace topology) is an open map. -/
def IsStrict (f : V →L[𝕜] W) : Prop :=
  IsOpenMap (fun v : V => (⟨f v, v, rfl⟩ : LinearMap.range (f : V →ₗ[𝕜] W)))

/-- API `IsStrict.directSum`: a product of two maps is strict iff both are. -/
theorem IsStrict.directSum [ContinuousAdd V] [ContinuousAdd W] [ContinuousAdd V'] [ContinuousAdd W']
    [ContinuousSMul 𝕜 V] [ContinuousSMul 𝕜 W] [ContinuousSMul 𝕜 V'] [ContinuousSMul 𝕜 W']
    (f : V →L[𝕜] W) (g : V' →L[𝕜] W') :
    IsStrict (f.prodMap g) ↔ IsStrict f ∧ IsStrict g := by
  sorry

/-- API `IsStrict.comp_of_surjective`: a composite of strict maps with closed image is strict
when the first map is surjective. -/
theorem IsStrict.comp_of_surjective {X : Type u} [AddCommGroup X] [Module 𝕜 X] [TopologicalSpace X]
    (f : V →L[𝕜] W) (g : W →L[𝕜] X) (hf : IsStrict f) (hg : IsStrict g)
    (hsurj : Function.Surjective f) : IsStrict (g.comp f) := by
  sorry

/-- Test `IsStrict_of_linearEquiv` (degenerate). -/
example (e : V ≃L[𝕜] W) : IsStrict (e : V →L[𝕜] W) := by
  sorry

/-- Test `IsStrict_finiteDimensional` (compatibility): over a complete field every linear map
between finite-dimensional Hausdorff topological vector spaces is strict. -/
example [CompleteSpace 𝕜] [IsTopologicalAddGroup V] [ContinuousSMul 𝕜 V] [T2Space V]
    [IsTopologicalAddGroup W] [ContinuousSMul 𝕜 W] [T2Space W]
    [FiniteDimensional 𝕜 V] [FiniteDimensional 𝕜 W] (f : V →L[𝕜] W) : IsStrict f := by
  sorry

end Strict

-- IsLFSpace, IsFrechetMontel, strongDual: not stated; need nonarchimedean locally convex spaces
--   (Mathlib's `LocallyConvexSpace` is for ordered scalar fields); proposed owner in the packet's
--   restructure list. IsStrict.of_surjective_LF (open mapping theorem for LF-spaces): not stated.
-- Test `IsStrict_referee_nonexample` (non-example) and Test `IsStrict_derivative_robba`
--   (computation): not stated; need Tate algebras `K⟨x, y⟩` and the Robba ring (RD.0).

/-! ## RD.5 — algebraic lemmas of Kedlaya's proof -/

/-- `RD.5/binomial-denominator-bound` (Kedlaya, Lemma 5.2.7). -/
theorem binomial_denominator_bound (p : ℕ) [Fact p.Prime] (m : ℤ) (l e : ℕ) (hl : 0 < l)
    (he : 0 < e) :
    ∃ a : ℕ, a ≤ (e - 1) * Nat.clog p (m.natAbs + l) ∧ ∀ j < e,
      0 ≤ padicValRat p ((p : ℚ) ^ a *
        (∏ i ∈ Finset.range l,
          (Polynomial.X + Polynomial.C ((m : ℚ) + (i + 1))) * Polynomial.C (1 / ((i : ℚ) + 1))).coeff j) := by
  sorry

/-- `RD.5/finitely-generated-intersection` (Kedlaya, Lemma 7.3.4): for a noetherian domain `R`
inside a field `L` and a finite-dimensional `L`-subspace `N ⊆ L^S`, `N ∩ R^S` is finitely
generated over `R`. -/
theorem finitelyGenerated_inter_pi (R L S : Type u) [CommRing R] [IsDomain R] [IsNoetherianRing R]
    [Field L] [Algebra R L] (hinj : Function.Injective (algebraMap R L))
    (N : Submodule L (S → L)) [FiniteDimensional L N] :
    (Submodule.comap (LinearMap.pi (fun s : S => (Algebra.linearMap R L).comp (LinearMap.proj s)))
      (N.restrictScalars R)).FG := by
  sorry

/-- `RD.5/six-term-isomorphism-lemma` (Kedlaya, Lemma 7.5.3). -/
theorem six_term_isomorphism {A B C D E F A' B' C' D' E' F' : Type u}
    [AddCommGroup A] [AddCommGroup B] [AddCommGroup C] [AddCommGroup D] [AddCommGroup E]
    [AddCommGroup F] [AddCommGroup A'] [AddCommGroup B'] [AddCommGroup C'] [AddCommGroup D']
    [AddCommGroup E'] [AddCommGroup F']
    (f₁ : A →+ B) (f₂ : B →+ C) (f₃ : C →+ D) (f₄ : D →+ E) (f₅ : E →+ F)
    (g₁ : A' →+ B') (g₂ : B' →+ C') (g₃ : C' →+ D') (g₄ : D' →+ E') (g₅ : E' →+ F')
    (hf₁ : Function.Injective f₁) (hf₂ : Function.Exact f₁ f₂) (hf₃ : Function.Exact f₂ f₃)
    (hf₄ : Function.Exact f₃ f₄) (hf₅ : Function.Exact f₄ f₅) (hf₆ : Function.Surjective f₅)
    (hg₁ : Function.Injective g₁) (hg₂ : Function.Exact g₁ g₂) (hg₃ : Function.Exact g₂ g₃)
    (hg₄ : Function.Exact g₃ g₄) (hg₅ : Function.Exact g₄ g₅) (hg₆ : Function.Surjective g₅)
    (a : A →+ A') (b : B →+ B') (c : C →+ C') (d : D →+ D') (e : E →+ E') (f : F →+ F')
    (h₁ : g₁.comp a = b.comp f₁) (h₂ : g₂.comp b = c.comp f₂) (h₃ : g₃.comp c = d.comp f₃)
    (h₄ : g₄.comp d = e.comp f₄) (h₅ : g₅.comp e = f.comp f₅)
    (hc : Function.Injective c) (hb : Function.Bijective b) (he : Function.Bijective e)
    (hd : Function.Surjective d) :
    Function.Bijective a ∧ Function.Bijective b ∧ Function.Bijective c ∧ Function.Bijective d ∧
      Function.Bijective e ∧ Function.Bijective f := by
  sorry

/-! ## RD.5 — no finiteness without Frobenius (`RD.5/no-finiteness-without-frobenius`) -/

/-- A `p`-adic Liouville number (Crew, p. 739): `‖a − n‖ < r^{|n|}` for some `0 < r < 1` and
infinitely many `n ∈ ℤ`. -/
def IsPadicLiouville (p : ℕ) [Fact p.Prime] (a : ℚ_[p]) : Prop :=
  ∃ r : ℝ, 0 < r ∧ r < 1 ∧ ∃ᶠ n : ℤ in cofinite, ‖a - n‖ < r ^ n.natAbs

/-- Existence: `a = Σ p^{e_m}` with `e₁ = 1`, `e_{m+1} = p^{e_m}` is Liouville and not an integer. -/
theorem exists_isPadicLiouville (p : ℕ) [Fact p.Prime] :
    ∃ a : ℤ_[p], IsPadicLiouville p (a : ℚ_[p]) ∧ ∀ n : ℤ, (a : ℚ_[p]) ≠ n := by
  sorry

/-- `RD.5/no-finiteness-without-frobenius`: for a non-integral `p`-adic Liouville number `a`, the
Kummer isocrystal `d + a·dx/x` on `G_m` (no Frobenius structure) has infinite-dimensional `H¹`. -/
theorem not_finiteDimensional_kummer_h1 (p : ℕ) [Fact p.Prime] (a : ℚ_[p])
    (ha : IsPadicLiouville p a) (hz : ∀ n : ℤ, a ≠ n) :
    ¬ FiniteDimensional ℚ_[p]
      (overconvergentLaurent ℚ_[p] ⧸ LinearMap.range (kummerConnection ℚ_[p] a)) := by
  sorry

/-- Test `SigmaNablaModule.kummer_liouville_nonexample` (non-example). -/
example (p : ℕ) [Fact p.Prime] :
    ∃ a : ℚ_[p], ¬ FiniteDimensional ℚ_[p]
      (overconvergentLaurent ℚ_[p] ⧸ LinearMap.range (kummerConnection ℚ_[p] a)) := by
  sorry

/-! ## RD.5 — objects over dagger algebras and rigid cohomology (not stated here)

These need dagger algebras and their fringe algebras (`AdicSpacesPartII:F1`), the Robba ring
(`RD.0/robba-ring`), rigid cohomology (`RD.4/rigid-cohomology`), schemes with alterations
(`AdicCoefficientsAndComparisons:L5`) or nonarchimedean functional analysis. -/

-- relativeRobba, relativeRobba.radius, relativeRobba.plus, relativeRobba.integral,
--   relativeRobba.mem_iff, relativeRobba.derivative_ker_range, relativeRobba.standardFrobenius,
--   relativeRobba.map, relativeRobba.ofPowerSeriesInverse, relativeRobba_field: not stated; need
--   fringe algebras of dagger algebras (AdicSpacesPartII:F1) and RD.0/robba-ring.
-- Test `relativeRobba_field_test` (degenerate), Test `relativeRobba_derivative_residue` (computation),
--   Test `relativeRobba_unit_nonexample` (non-example), Test `relativeRobba_integral_reduction`
--   (compatibility): not stated.
-- RelativeSigmaNablaModule, RelativeSigmaNablaModule.D, RelativeSigmaNablaModule.baseChange,
--   RelativeSigmaNablaModule.localCohomology, RelativeSigmaNablaModule.tensor,
--   RelativeSigmaNablaModule.ofField: not stated; need `relativeRobba`.
-- Test `relativeSigmaNabla_trivial_cohomology` (computation), Test `relativeSigmaNabla_field`
--   (degenerate), Test `relativeSigmaNabla_kummer_liouville_nonexample` (non-example; its global
--   form is `not_finiteDimensional_kummer_h1`), Test `relativeSigmaNabla_baseChange_generic`
--   (compatibility): not stated.
-- RelativeSigmaNablaModule.IsUnipotent, RelativeSigmaNablaModule.StronglyUnipotentBasis,
--   IsUnipotent_iff_exists_strongly, StronglyUnipotentBasis.span_eq, IsUnipotent.of_automorphism,
--   IsUnipotent.baseChange, IsUnipotent_field: not stated.
-- Test `unipotent_trivial` (degenerate), Test `unipotent_jordan_block` (computation),
--   Test `unipotent_kummer_nonexample` (non-example), Test `unipotent_field_compat` (compatibility): not stated.
-- localAlgebra, localEmbedding, principalParts, localEmbedding_independent, localEmbedding_residue:
--   not stated; need the Cohen structure theorem on dagger algebras of curves.
-- Test `localEmbedding_gm` (computation), Test `localEmbedding_affineLine` (degenerate),
--   Test `localEmbedding_residue_theorem` (compatibility), Test `localEmbedding_single_not_closed`
--   (non-example): not stated.
-- pushforward, pushforwardLoc, pushforwardCompact, pushforwardPrimitive, pushforward_exact,
--   pushforward.frobenius, pushforward.horizontalConnection, pushforward.baseChange,
--   pushforward_trivial: not stated; need A⟨x⟩† → R_A.
-- Test `pushforward_trivial_test` (computation), Test `pushforward_base_point` (degenerate),
--   Test `pushforward_exact_test` (compatibility), Test `pushforward_not_finite_nonexample`
--   (non-example): not stated.
-- smoothHypercovering, smoothHypercovering.isProperHypercovering, smoothHypercovering.smooth,
--   smoothHypercovering.reduced_comparison: not stated; need simplicial schemes and alterations
--   (AdicCoefficientsAndComparisons:L5). Test `smoothHypercovering_of_smooth` (degenerate),
--   Test `smoothHypercovering_cusp` (computation), Test `smoothHypercovering_not_cover_nonexample`
--   (non-example), Test `smoothHypercovering_inseparable` (compatibility): not stated.
-- traceMap, traceMap_frobenius, traceMap_affineSpace, traceMap_finiteEtale, traceMap_openImmersion:
--   not stated; need compact-support rigid cohomology. Test `traceMap_affineLine` (computation; its
--   model is `frobenius_affineLine_compact` above), Test `traceMap_point` (degenerate),
--   Test `traceMap_twist_nonexample` (non-example), Test `traceMap_crew` (compatibility): not stated.
-- cupProduct, poincarePairing, poincarePairingSupports, poincarePairing_frobenius,
--   poincarePairing_natural, cupProduct_assoc, poincarePairing_affineSpace: not stated; the target
--   form of Poincaré duality is `LinearMap.IsPerfPair` on these pairings. Test `poincarePairing_gm`
--   (computation), Test `poincarePairing_point` (degenerate),
--   Test `poincarePairing_untwisted_nonexample` (non-example), Test `poincarePairing_crew`
--   (compatibility): not stated.
-- kunnethMap, kunnethMapSupports, kunnethMap_frobenius, kunnethMap_natural, kunnethMap_unit,
--   kunnethMap_cup: not stated. Test `kunnethMap_affinePlane` (computation), Test `kunnethMap_point`
--   (degenerate), Test `kunnethMap_gm_square` (compatibility), Test `kunnethMap_sum_nonexample`
--   (non-example): not stated.
-- Named theorems of RD.5 not stated here, all for want of rigid cohomology or of the relative
--   Robba ring: the relative local monodromy theorem (Kedlaya 5.1.3) and its inputs 5.1.2, 5.3.1–5.4.1;
--   finiteness on curves (6.2.10, 6.4.2) and Crew's finiteness and duality; the generic pushforward
--   theorem (7.3.3), flat base change (7.5.2), external products (7.6.2), relative duality (8.6.1);
--   strictness (8.4.1–8.4.5); duality on affine space (8.5.3); étale covers of affine space (9.1.2);
--   finiteness (1.2.1, 1.2.2, 9.1.1), cohomological descent, Poincaré duality (1.2.3) and the
--   Künneth formula (1.2.4); the dimension formula for affine curves and the acceptance computations.

end PartC

/-! # Layers RD.6 and RD.7: trace formula, Fourier transform, weights and the crystalline comparison -/

section PartD

open Polynomial

/-! ### RD.6/linear-q-frobenius -/

-- linearFrobenius: not stated; needs RD.4/rigid-cohomology and RD.4/frobenius-on-rigid-cohomology
--   (the K-linear q-Frobenius on H^i_rig(X/K, E) and H^i_{c,rig}(X/K, E) for k = F_q, σ_K = id).
-- linearFrobenius_eq_pow: not stated; needs the p-power Frobenius structure of RD.3.
-- linearFrobenius_natural: not stated; needs functoriality of RD.4 cohomology.
-- linearFrobenius_tateTwist: not stated; needs RD.4 cohomology (see `tateTwist` below for fibres).
-- linearFrobenius_baseChange: not stated; needs RD.4 base change (RD.6/base-change-to-finite-extension-of-fq).
-- Test `linearFrobenius_point` (computation): not stated; needs H^0_rig(Spec F_q/K) from RD.4.
-- Test `linearFrobenius_projectiveLine_top` (computation): not stated; needs H^2_rig(P^1/K) from RD.4.

/-- Test `linearFrobenius_witt_square` (compatibility): for `q = p ^ 2` the Witt vector
Frobenius of `W(F_{p^2})` has square the identity, so the p-power Frobenius of the unit
object is semilinear while its square (the q-power Frobenius) is linear. -/
example (p : ℕ) [Fact p.Prime] :
    (WittVector.frobenius : WittVector p (GaloisField p 2) →+* _).comp WittVector.frobenius =
      RingHom.id _ := by
  sorry

/-- Test `pPowerFrobenius_not_linear` (non-example): the p-power Frobenius of `W(F_{p^2})` is
not the identity, so for `q = p ^ 2` it is not the linear q-Frobenius. -/
example (p : ℕ) [Fact p.Prime] :
    (WittVector.frobenius : WittVector p (GaloisField p 2) →+* _) ≠ RingHom.id _ := by
  sorry

/-! ### RD.6/frobenius-at-closed-point: fibre data -/

/-- Frobenius data of an overconvergent F-isocrystal on a separated `F_q`-scheme of finite
type, read at closed points: each closed point `x` has a degree, and the fibre `E_x`,
regarded as a `K`-vector space of dimension `rank x = deg x · rank E`, carries the
`K`-linear Frobenius `F` (with `σ_K = id`), recorded as a matrix. Only finitely many closed
points have degree dividing a given `r > 0`. -/
structure FibreData (K : Type*) [Field K] where
  /-- The closed points. -/
  Pt : Type*
  /-- The degree `[κ(x) : F_q]`. -/
  deg : Pt → ℕ
  deg_pos : ∀ x, 0 < deg x
  finite_dvd : ∀ r : ℕ, 0 < r → {x | deg x ∣ r}.Finite
  /-- `dim_K E_x`. -/
  rank : Pt → ℕ
  /-- The `K`-linear Frobenius on `E_x`. -/
  frob : ∀ x, Matrix (Fin (rank x)) (Fin (rank x)) K
  /-- `F` permutes the `deg x` conjugate blocks of `E_x` cyclically, so `Tr(F^r) = 0` unless
  `deg x ∣ r`. -/
  trace_pow_eq_zero : ∀ x (r : ℕ), 0 < r → ¬ deg x ∣ r → Matrix.trace (frob x ^ r) = 0

namespace FibreData

variable {K : Type*} [Field K] (D : FibreData K)

-- fibre: not stated; needs RD.3 pullback of overconvergent F-isocrystals to closed points
--   (here the fibre is only recorded through `rank` and `frob`).

/-- `F_x := F ^ deg x`, the Frobenius at the closed point `x`. -/
def fibreFrobenius (x : D.Pt) : Matrix (Fin (D.rank x)) (Fin (D.rank x)) K :=
  D.frob x ^ D.deg x

-- fibreCharpoly: not stated; needs the `K_x`-structure of `E_x` (RD.3); over `K` one has
--   `det_K(1 - tF | E_x) = P_x(t^deg x)`, recorded as `restrictScalarsCharpoly`.
-- fibreCharpoly_coeff_mem: not stated; needs the `K_x`-structure of `E_x`.
-- det_restrictScalars_eq: not stated; needs the `K_x`-structure of `E_x`.
-- fibre_pullback: not stated; needs RD.3 pullback along morphisms of `F_q`-schemes.

/-- `det_K(1 - tF | E_x)`. -/
noncomputable def restrictScalarsCharpoly (x : D.Pt) : K[X] :=
  (D.frob x).charpolyRev

/-! ### RD.6/tate-twist-of-f-isocrystals -/

/-- The Tate twist `E(n)`: the Frobenius is multiplied by `q ^ (-n)`. -/
def tateTwist (q : K) (n : ℤ) : FibreData K :=
  { D with frob := fun x => (q ^ (-n)) • D.frob x
           trace_pow_eq_zero := by sorry }

theorem fibre_tateTwist (q : K) (n : ℤ) (x : D.Pt) :
    (D.tateTwist q n).frob x = (q ^ (-n)) • D.frob x := by
  sorry

theorem fibreFrobenius_tateTwist (q : K) (n : ℤ) (x : D.Pt) :
    (D.tateTwist q n).fibreFrobenius x = (q ^ (-n)) ^ D.deg x • D.fibreFrobenius x := by
  sorry

theorem tateTwist_add (q : K) (hq : q ≠ 0) (m n : ℤ) :
    (D.tateTwist q m).tateTwist q n = D.tateTwist q (m + n) := by
  sorry

-- tateTwist_dual: not stated; needs duals of overconvergent F-isocrystals (RD.3).
-- tateTwist_tensor: not stated; needs tensor products of overconvergent F-isocrystals (RD.3).
-- cohomology_tateTwist: not stated; needs RD.4 rigid cohomology.

/-- Test `tateTwist_zero` (degenerate): `E(0) = E`. -/
example (q : K) : D.tateTwist q 0 = D := by
  sorry

/-! ### RD.6/l-function-of-overconvergent-f-isocrystal -/

/-- `S_r(X, E) = Σ_{deg x ∣ r} Tr(F^r | E_x)`, the trace of Frobenius over `F_{q^r}`. -/
noncomputable def traceSum (r : ℕ) : K :=
  if hr : 0 < r then ∑ x ∈ (D.finite_dvd r hr).toFinset, Matrix.trace (D.frob x ^ r) else 0

/-- Coefficients of the L-function, determined by `n·c_n = Σ_{r=1}^{n} S_r c_{n-r}`. -/
noncomputable def lCoeff : ℕ → K
  | 0 => 1
  | n + 1 => ((n + 1 : ℕ) : K)⁻¹ * ∑ i : Fin (n + 1), D.traceSum (i + 1) * lCoeff (n - i)

/-- The L-function `L(X, E, t) = ∏_x det(1 - t^{deg x} F_x | E_x)^{-1} = exp(Σ S_r t^r / r)`. -/
noncomputable def LFunction : PowerSeries K :=
  PowerSeries.mk D.lCoeff

theorem LFunction.constantCoeff : PowerSeries.constantCoeff D.LFunction = 1 := by
  sorry

theorem LFunction.logDeriv [CharZero K] :
    PowerSeries.X * PowerSeries.derivative K D.LFunction =
      D.LFunction * PowerSeries.mk D.traceSum := by
  sorry

theorem LFunction.tateTwist (q : K) (n : ℤ) :
    (D.tateTwist q n).LFunction = PowerSeries.rescale (q ^ (-n)) D.LFunction := by
  sorry

/-- The Euler-product form: the L-function is the product of the inverse reversed
characteristic polynomials of `F` on the fibres (only finitely many factors matter modulo
`t ^ (N + 1)`), stated coefficientwise. -/
theorem LFunction.euler [CharZero K] (N : ℕ) :
    PowerSeries.trunc (N + 1)
        (D.LFunction * ∏ x ∈ (D.finite_dvd (Nat.factorial (N + 1)) (Nat.factorial_pos _)).toFinset,
          ((D.restrictScalarsCharpoly x : K[X]) : PowerSeries K)) =
      PowerSeries.trunc (N + 1) 1 := by
  sorry

-- LFunction.of_exact: not stated; needs exact sequences of overconvergent F-isocrystals (RD.3).
-- LFunction.excision: not stated; needs closed/open decompositions of schemes (SF.0, RD.4).
-- LFunction.pushforward: not stated; needs finite étale pushforward of F-isocrystals (RD.4).
-- LFunction.const: not stated; needs the zeta function of WeilConjectures:WC.1.

/-- Test `LFunction_point` (computation): one rational point with `F = α` gives `(1 - αt)^{-1}`. -/
example (α : K) :
    ({ Pt := Unit, deg := fun _ => 1, deg_pos := fun _ => one_pos,
       finite_dvd := fun _ _ => Set.toFinite _, rank := fun _ => 1,
       frob := fun _ => !![α], trace_pow_eq_zero := by sorry } : FibreData K).LFunction *
      (1 - PowerSeries.C α * PowerSeries.X) = 1 := by
  sorry

/-- Test `LFunction_empty` (degenerate): no closed points gives `L = 1`. -/
example :
    ({ Pt := Empty, deg := fun e => e.elim, deg_pos := fun e => e.elim,
       finite_dvd := fun _ _ => Set.toFinite _, rank := fun e => e.elim,
       frob := fun e => e.elim, trace_pow_eq_zero := fun e => e.elim } : FibreData K).LFunction = 1 := by
  sorry

/-- Test `LFunction_degreeTwoPoint` (non-example): one closed point of degree 2 with trivial
coefficients (`F` swaps the two conjugate lines of `K_x`) gives `(1 - t^2)^{-1}`, not the
naive `(1 - t^2)^{-2}`. -/
example :
    ({ Pt := Unit, deg := fun _ => 2, deg_pos := fun _ => two_pos,
       finite_dvd := fun _ _ => Set.toFinite _, rank := fun _ => 2,
       frob := fun _ => !![0, 1; 1, 0], trace_pow_eq_zero := by sorry } : FibreData K).LFunction *
      (1 - PowerSeries.X ^ 2) = 1 := by
  sorry

-- Test `LFunction_const_projectiveLine` (compatibility): not stated; needs the zeta
--   function of P^1 from WeilConjectures:WC.1.
-- Test `LFunction_dwork` (computation): not stated; needs the Dwork isocrystal (RD.6/dwork-isocrystal).

/-- Test `fibreFrobenius_const` (computation): trivial coefficients give `F_x = 1`. -/
example (x : D.Pt) (h : D.frob x = 1) : D.fibreFrobenius x = 1 := by
  sorry

/-- Test `fibreFrobenius_tate` (computation): for `O(-1)`, `F = q` and `F_x = q ^ deg x`. -/
example (q : K) (x : D.Pt) (h : D.frob x = q • 1) : D.fibreFrobenius x = q ^ D.deg x • 1 := by
  sorry

/-- Test `tateTwist_unit_frobenius` (computation): twisting the unit object by `-1`
multiplies `F` by `q`. -/
example (q : K) (x : D.Pt) (h : D.frob x = 1) : (D.tateTwist q (-1)).frob x = q • 1 := by
  sorry

end FibreData

/-- Test `det_restrictScalars_degreeTwo` (non-example): on `K_x ≅ K²` for a degree-two
point, `det(1 - tF) = 1 - t²`, while the naive determinant of `F_x = F²` is `(1 - t)²`. -/
example {K : Type*} [Field K] :
    (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) K).charpolyRev = 1 - X ^ 2 ∧
      ((!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) K) ^ 2).charpolyRev = (1 - X) ^ 2 := by
  sorry

/-- Test `fibre_isocrystal` (compatibility): for `q = p` and `K = FractionRing (W(F_p))`, a
Frobenius automorphism of a fibre at a rational point is a Mathlib isocrystal. -/
example (p : ℕ) [Fact p.Prime] (V : Type*) [AddCommGroup V]
    [Module (FractionRing (WittVector p (ZMod p))) V]
    (F : V ≃ₗ[FractionRing (WittVector p (ZMod p))] V) :
    ∃ I : WittVector.Isocrystal p (ZMod p) V, ∀ v : V, I.frob.toEquiv v = F v := by
  sorry

-- Test `tateTwist_projectiveLine` (compatibility): not stated; needs H^2_rig(P^1/K) (RD.4).
-- Test `tateTwist_wrong_sign` (non-example): not stated; needs the trace formula for A^1 (RD.4).

/-! ### RD.6: the trace formula, stated against abstract cohomology data -/

/-- Finite-dimensional graded cohomology with a linear Frobenius: `dim i` and the matrix of `F`
on the `i`-th group (used for `H^i_{c,rig}(X/K, E)`). -/
structure CohomologyData (K : Type*) [Field K] where
  top : ℕ
  dim : ℕ → ℕ
  frob : ∀ i, Matrix (Fin (dim i)) (Fin (dim i)) K

/-- The trace-formula identity `S_r(X, E) = Σ_i (-1)^i Tr(F^r | H^i)` for all `r ≥ 1`. It is a
genuine condition relating fibre data and cohomology data; RD.6/lefschetz-trace-formula
asserts it for `H = H_{c,rig}(X/K, E)`. -/
def SatisfiesTraceFormula {K : Type*} [Field K] (D : FibreData K) (H : CohomologyData K) : Prop :=
  ∀ r : ℕ, 0 < r →
    D.traceSum r = ∑ i ∈ Finset.range (H.top + 1), (-1 : K) ^ i * Matrix.trace (H.frob i ^ r)

-- lefschetzTraceFormula: not stated; needs RD.4 compactly supported rigid cohomology and the
--   fibre data of an overconvergent F-isocrystal; its conclusion is `SatisfiesTraceFormula`.

/-- RD.6/l-function-rationality, linear-algebra core: the trace formula for all `r` gives
`L(X, E, t) = ∏_i det(1 - tF | H^i)^{(-1)^{i+1}}`. -/
theorem LFunction_mul_even_eq_odd {K : Type*} [Field K] [CharZero K] (D : FibreData K)
    (H : CohomologyData K) (h : SatisfiesTraceFormula D H) :
    D.LFunction * ∏ i ∈ (Finset.range (H.top + 1)).filter Even,
        (((H.frob i).charpolyRev : K[X]) : PowerSeries K) =
      ∏ i ∈ (Finset.range (H.top + 1)).filter (fun i => ¬ Even i),
        (((H.frob i).charpolyRev : K[X]) : PowerSeries K) := by
  sorry

-- RD.6/alternating-trace-additivity: its short-exact step is the Tau Ceti theorem
--   `LinearMap.trace_eq_add_of_exact` (not restated here); the long exact case splits into
--   short exact sequences.

/-! ### RD.6/dwork-operator -/

/-- A Dwork operator on an `A`-module `M` for a Frobenius lift `σ`: `θ(σ(a) m) = a θ(m)`. -/
def IsDworkOperator {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M]
    (σ : A →+* A) (θ : M →+ M) : Prop :=
  ∀ (a : A) (m : M), θ (σ a • m) = a • θ m

theorem IsDworkOperator.comp_mul {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M]
    {σ : A →+* A} {θ : M →+ M} (hθ : IsDworkOperator σ θ) (b : A) :
    IsDworkOperator σ (θ.comp (DistribSMul.toAddMonoidHom M b)) ∧
      IsDworkOperator σ ((DistribSMul.toAddMonoidHom M b).comp θ) := by
  sorry

theorem IsDworkOperator.add {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M]
    {σ : A →+* A} {θ θ' : M →+ M} (hθ : IsDworkOperator σ θ) (hθ' : IsDworkOperator σ θ') :
    IsDworkOperator σ (θ + θ') := by
  sorry

-- IsDworkOperator.equivRestrictScalars: not stated; needs restriction of scalars along σ as a
--   bundled module (Mathlib `Module.compHom`) together with the dagger algebra of AdicSpacesPartII:F1.
-- IsDworkOperator.tensorOmega: not stated; needs continuous differentials of dagger algebras (F1).

/-- Test `isDworkOperator_standard` (computation), on the polynomial part of `K⟨x⟩†`:
`contract q` (`Σ cₙ xⁿ ↦ Σ c_{qn} xⁿ`) is a Dwork operator for `x ↦ x^q`. -/
example {K : Type*} [Field K] (q : ℕ) (hq : 0 < q) :
    IsDworkOperator ((expand K q : K[X] →ₐ[K] K[X]) : K[X] →+* K[X])
      ((Polynomial.contract q : K[X] → K[X]) |> fun f =>
        ({ toFun := f, map_zero' := by sorry, map_add' := by sorry } : K[X] →+ K[X])) := by
  sorry

/-- Test `isDworkOperator_zero` (degenerate): on the zero module every map is Dwork. -/
example {A : Type*} [CommRing A] (σ : A →+* A) :
    IsDworkOperator σ (0 : PUnit →+ PUnit) := by
  sorry

/-- Test `isDworkOperator_field` (compatibility): for `σ = id` on a field, Dwork operators
are exactly the `K`-linear maps. -/
example {K M : Type*} [Field K] [AddCommGroup M] [Module K M] (θ : M →+ M) :
    IsDworkOperator (RingHom.id K) θ ↔ ∀ (c : K) (m : M), θ (c • m) = c • θ m := by
  sorry

/-- Test `frobeniusLift_not_dwork` (non-example): the lift `x ↦ x^q` itself is not a Dwork
operator on `K[x]` when `q ≥ 2`. -/
example {K : Type*} [Field K] (q : ℕ) (hq : 2 ≤ q) :
    ¬ IsDworkOperator ((expand K q : K[X] →ₐ[K] K[X]) : K[X] →+* K[X])
      ((expand K q : K[X] →ₐ[K] K[X]) : K[X] →+ K[X]) := by
  sorry

/-! ### RD.6/galois-frobenius-lift -/

/-- A Frobenius lift `σ` on `A` (of pure dimension `n`) is Galois if the automorphisms fixing
`σ(A)` pointwise form a group of order `q ^ n` whose fixed ring is `σ(A)`. -/
def IsGaloisFrobeniusLift {A : Type*} [CommRing A] (σ : A →+* A) (q n : ℕ) : Prop :=
  Nat.card {τ : A ≃+* A // ∀ a, τ (σ a) = σ a} = q ^ n ∧
    ∀ b : A, (∀ τ : A ≃+* A, (∀ a, τ (σ a) = σ a) → τ b = b) → b ∈ σ.range

/-- The group `Aut(A/σ(A))`. -/
def galoisGroup {A : Type*} [CommRing A] (σ : A →+* A) : Subgroup (A ≃+* A) where
  carrier := {τ | ∀ a, τ (σ a) = σ a}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

theorem card_galoisGroup {A : Type*} [CommRing A] {σ : A →+* A} {q n : ℕ}
    (h : IsGaloisFrobeniusLift σ q n) : Nat.card (galoisGroup σ) = q ^ n := by
  sorry

-- galoisGroup_reduction: not stated; needs the integral subring and reduction of a dagger algebra (F1).
-- IsGaloisFrobeniusLift.extend: not stated; needs finite étale maps of dagger algebras (F1, RD.0).

/-- Test `galoisFrobenius_point` (degenerate): on a field, `id` is Galois of degree `q ^ 0`. -/
example {K : Type*} [Field K] (q : ℕ) : IsGaloisFrobeniusLift (RingHom.id K) q 0 := by
  sorry

-- Test `galoisFrobenius_line` (computation): not stated; needs K⟨x⟩† (AdicSpacesPartII:F1).
-- Test `galoisFrobenius_plane` (computation): not stated; needs K⟨x, y⟩† (AdicSpacesPartII:F1).
-- Test `galoisFrobenius_no_roots_of_unity` (non-example): not stated; needs Q_p⟨x⟩† (F1).

/-! ### RD.6/canonical-dwork-operator -/

/-- `ψ(v) = F^{-1}(Σ_{τ ∈ G} τ v)`, given the parallel-transport action and a left inverse
`Finv` of the Frobenius. -/
def canonicalDworkOperator {G M : Type*} [Fintype G] [AddCommGroup M]
    (act : G → M →+ M) (Finv : M →+ M) : M →+ M :=
  Finv.comp (∑ g, act g)

theorem canonicalDworkOperator_comp_frobenius {G M : Type*} [Fintype G] [AddCommGroup M]
    (act : G → M →+ M) (F Finv : M →+ M) (hinv : Finv.comp F = AddMonoidHom.id M)
    (hfix : ∀ g, (act g).comp F = F) :
    (canonicalDworkOperator act Finv).comp F = (Fintype.card G) • AddMonoidHom.id M := by
  sorry

-- canonicalDworkOperator_isDwork: not stated; needs the (σ, ∇)-module structure over a dagger algebra.
-- canonicalDworkOperator_commute_nabla: not stated; needs connections on dagger modules (RD.3).
-- canonicalDworkOperator_on_cohomology: not stated; needs RD.4 Monsky–Washnitzer cohomology.
-- canonicalDworkOperator_trivial: not stated; needs K⟨x⟩† and its differentials (F1).

/-- Test `canonicalDworkOperator_point` (degenerate): for a trivial group, `ψ = F^{-1}`. -/
example {M : Type*} [AddCommGroup M] (act : Unit → M →+ M) (hact : act () = AddMonoidHom.id M)
    (Finv : M →+ M) : canonicalDworkOperator act Finv = Finv := by
  sorry

-- Test `canonicalDworkOperator_line` (computation): not stated; needs K⟨x⟩† with μ_q ⊂ K.
-- Test `canonicalDworkOperator_comp_order` (non-example): not stated; needs K⟨x⟩† (F1).
-- Test `canonicalDworkOperator_h1_line` (compatibility): not stated; needs H^1_MW(G_m) (RD.4).

/-! ### RD.6: Fourier transform -/

/-- RD.6/factorial-valuation-bounds: `n/(p-1) ≥ v_p(n!) ≥ n/(p-1) - ⌈log_p(n+1)⌉`, in
integer form (the number of base-`p` digits of `n` is `Nat.log p n + 1`). -/
theorem factorial_valuation_bounds (p n : ℕ) [Fact p.Prime] (hn : 0 < n) :
    (p - 1) * padicValNat p n.factorial ≤ n ∧
      n ≤ (p - 1) * (padicValNat p n.factorial + (Nat.log p n + 1)) := by
  sorry

/-- RD.6/weyl-algebra-commutation-formula, for `∂x - x∂ = h` with `h` central:
`∂ⁿ xᵐ = Σ_i C(n,i) m!/(m-i)! hⁱ x^{m-i} ∂^{n-i}`. -/
theorem weyl_pow_mul_pow {R : Type*} [Ring R] (x d h : R) (hh : ∀ y, Commute h y)
    (hdx : d * x - x * d = h) (n m : ℕ) :
    d ^ n * x ^ m = ∑ i ∈ Finset.range (min n m + 1),
      ((n.choose i * m.descFactorial i : ℕ) : R) * h ^ i * x ^ (m - i) * d ^ (n - i) := by
  sorry

/-- RD.6/overconvergent-weyl-algebra: overconvergent differential operators
`Σ a_ij xⁱ ∂ʲ` with `liminf v_p(a_ij)/(i+j) > 0`, i.e. `‖a_ij‖ ≤ C ρ^{i+j}` for some `ρ < 1`.
The parameter `π` (with `π^{p-1} = -p`) enters only the multiplication (`∂x - x∂ = π⁻¹`). -/
structure OverconvergentWeyl (K : Type*) [NormedField K] (π : K) where
  /-- The coefficient of `xⁱ ∂ʲ` in normal form. -/
  coeff : ℕ → ℕ → K
  growth : ∃ ρ : ℝ, 0 ≤ ρ ∧ ρ < 1 ∧ ∃ C : ℝ, ∀ i j, ‖coeff i j‖ ≤ C * ρ ^ (i + j)

namespace OverconvergentWeyl

variable {K : Type*} [NormedField K] (π : K)

theorem ext {a b : OverconvergentWeyl K π} (h : ∀ i j, a.coeff i j = b.coeff i j) : a = b := by
  sorry

/-- Ring structure with the product of Kedlaya's Proposition 4.3 (convergent by
RD.6/overconvergent-weyl-multiplication-converges). -/
noncomputable instance instRing : Ring (OverconvergentWeyl K π) := sorry

/-- The element `x`. -/
def X : OverconvergentWeyl K π :=
  ⟨fun i j => if i = 1 ∧ j = 0 then 1 else 0, sorry⟩

/-- The element `∂`. -/
def D : OverconvergentWeyl K π :=
  ⟨fun i j => if i = 0 ∧ j = 1 then 1 else 0, sorry⟩

/-- Scalars `c ∈ K`. -/
def const (c : K) : OverconvergentWeyl K π :=
  ⟨fun i j => if i = 0 ∧ j = 0 then c else 0, sorry⟩

theorem D_mul_X : D π * X π - X π * D π = const π π⁻¹ := by
  sorry

-- OverconvergentWeyl.ofWeyl: not stated; needs the Weyl algebra as a Mathlib ring (no `WeylAlgebra` in the
--   pinned Mathlib); its image is the polynomial arrays.

/-- Test `overconvergentWeyl_relation` (computation): `∂·x = x·∂ + π⁻¹`. -/
example : D π * X π = X π * D π + const π π⁻¹ := by
  sorry

/-- Test `overconvergentWeyl_constant` (degenerate): scalars are central. -/
example (c : K) (a : OverconvergentWeyl K π) : const π c * a = a * const π c := by
  sorry

/-- Test `overconvergentWeyl_geometric` (characterisation): `Σ aʲ ∂ʲ` is overconvergent iff
`‖a‖ < 1`. -/
example (a : K) :
    (∃ ρ : ℝ, 0 ≤ ρ ∧ ρ < 1 ∧ ∃ C : ℝ, ∀ i j : ℕ,
      ‖(if i = 0 then a ^ j else 0 : K)‖ ≤ C * ρ ^ (i + j)) ↔ ‖a‖ < 1 := by
  sorry

/-- Test `overconvergentWeyl_not_formal` (non-example): all coefficients `1` along `∂ʲ` do
not satisfy the growth condition. -/
example [NormOneClass K] : ¬ ∃ ρ : ℝ, 0 ≤ ρ ∧ ρ < 1 ∧ ∃ C : ℝ, ∀ i j : ℕ,
    ‖(if i = 0 then (1 : K) else 0)‖ ≤ C * ρ ^ (i + j) := by
  sorry

/-! ### RD.6/fourier-automorphism and RD.6/p-adic-fourier-transform -/

/-- The Fourier automorphism `ρ` with `ρ(x) = ∂`, `ρ(∂) = -x`. -/
noncomputable def fourierAut : OverconvergentWeyl K π ≃+* OverconvergentWeyl K π := sorry

theorem fourierAut_X : fourierAut π (X π) = D π := by
  sorry

theorem fourierAut_D : fourierAut π (D π) = -X π := by
  sorry

/-- Normal-form coefficients of `ρ(a)` (the corrected form of Kedlaya's display):
the coefficient of `xᵃ ∂ᵇ` is `Σ_k (-1)^{a+k} (a+k)!(b+k)!/(π^k k! a! b!) c_{(b+k)(a+k)}`. -/
theorem fourierAut_coeff (a : OverconvergentWeyl K π) (i j : ℕ) :
    ((fourierAut π a).coeff i j) =
      ∑' k : ℕ, (-1 : K) ^ (i + k) * ((i + k).factorial * (j + k).factorial : ℕ) /
        (π ^ k * (k.factorial * i.factorial * j.factorial : ℕ)) * a.coeff (j + k) (i + k) := by
  sorry

theorem fourierAut_sq : fourierAut π (fourierAut π (X π)) = -X π ∧
    fourierAut π (fourierAut π (D π)) = -D π := by
  sorry

-- fourierAut_continuous: not stated; needs the fringe topology on `OverconvergentWeyl`.

/-- Test `fourierAut_X_eq` (computation): `ρ(x∂) = -x∂ - π⁻¹`. -/
example : fourierAut π (X π * D π) = -(X π * D π) - const π π⁻¹ := by
  sorry

/-- Test `fourierAut_one` (degenerate): `ρ(1) = 1`. -/
example : fourierAut π 1 = 1 := by
  sorry

/-- Test `fourierAut_sq_X` (characterisation): `ρ(ρ(x)) = -x`. -/
example : fourierAut π (fourierAut π (X π)) = -X π := by
  sorry

-- Test `fourierAut_printed_formula` (non-example): Kedlaya's printed coefficient formula,
--   `(-1)^{j+k} … c_{(i+k)(j+k)}`, sends `x` to `x`; checked by machine in D.md (it is not a
--   statement about `fourierAut`, whose values are fixed by `fourierAut_X`).

/-- The Fourier transform of a left `D†`-module: the same module with the action twisted by
`ρ⁻¹`. -/
def FourierTransform (M : Type*) : Type _ := M

noncomputable instance (M : Type*) [AddCommGroup M] : AddCommGroup (FourierTransform M) :=
  inferInstanceAs (AddCommGroup M)

noncomputable instance (M : Type*) [AddCommGroup M] [Module (OverconvergentWeyl K π) M] :
    Module (OverconvergentWeyl K π) (FourierTransform M) :=
  Module.compHom M ((fourierAut π).symm : OverconvergentWeyl K π →+* OverconvergentWeyl K π)

/-- The underlying identification `M → M̂`. -/
def fourierTransform (M : Type*) : M ≃ FourierTransform M := Equiv.refl M

theorem fourierTransform_smul (M : Type*) [AddCommGroup M] [Module (OverconvergentWeyl K π) M]
    (d : OverconvergentWeyl K π) (m : M) :
    (d • fourierTransform M m : FourierTransform M) =
      fourierTransform M ((fourierAut π).symm d • m) := by
  sorry

-- fourierTransform_fourfold: not stated here in module-isomorphism form; it follows from
--   `fourierAut_sq` (ρ⁴ = id).
-- fourierTransform_irreducible: not stated; needs (σ, ∇)-submodules (Frobenius-stable).
-- fourierTransform_baseChange: not stated; needs base change of `OverconvergentWeyl` along K → K'.
-- fourierTransform_geometric: not stated; needs RD.6/geometric-fourier-transform (dagger modules).
-- Test `fourierTransform_dwork` (computation): not stated; needs the Dwork isocrystal as a D†-module.
-- Test `fourierTransform_trivial` (computation): not stated; needs K⟨x⟩† as a D†-module.
-- Test `fourierTransform_not_identity` (non-example): not stated; needs K⟨x⟩† as a D†-module.

/-- Test `fourierTransform_zero` (degenerate): the transform of the zero module is zero. -/
example [Module (OverconvergentWeyl K π) PUnit] : Subsingleton (FourierTransform PUnit) := by
  sorry

end OverconvergentWeyl

/-! ### RD.6/dwork-isocrystal -/

/-- The Frobenius multiplier `θ(x) = exp(π x^q - π x)` of the Dwork isocrystal (the corrected
sign; with `∇e = π e dx` and `σ(x) = x^q`). -/
noncomputable def dworkFrobeniusSeries (K : Type*) [Field K] [CharZero K] (π : K) (q : ℕ) :
    PowerSeries K :=
  (PowerSeries.exp K).subst (π • (PowerSeries.X ^ q - PowerSeries.X : PowerSeries K))

/-- Horizontality of the corrected Frobenius: `θ' = π (q x^{q-1} - 1) θ`, i.e.
`∇(Fe) = (F ⊗ dσ)(∇e)` for `∇e = π e dx`. -/
theorem dworkFrobeniusSeries_horizontal (K : Type*) [Field K] [CharZero K] (π : K) (q : ℕ)
    (hq : 1 ≤ q) :
    PowerSeries.derivative K (dworkFrobeniusSeries K π q) + PowerSeries.C π * dworkFrobeniusSeries K π q =
      PowerSeries.C (π * q) * PowerSeries.X ^ (q - 1) * dworkFrobeniusSeries K π q := by
  sorry

-- dworkIsocrystal: not stated; needs (σ, ∇)-modules over K⟨x⟩† (RD.3, AdicSpacesPartII:F1);
--   its Frobenius multiplier is `dworkFrobeniusSeries`.
-- dworkIsocrystal.pullback, dworkIsocrystal.add, dworkIsocrystal.mod_pi, dworkIsocrystal.pow_p,
--   dworkIsocrystal.fibreFrobenius, dworkIsocrystal.cohomology: not stated; need the same objects.
-- Test `dworkIsocrystal_splitting_value` (computation): not stated; needs evaluation of an
--   overconvergent series at a Teichmüller point (checked with PARI/GP in D.md).
-- Test `dworkIsocrystal_trace_character` (compatibility): not stated; needs the fibres of the
--   Dwork isocrystal; the character side is `AddChar.zmodChar` and
--   FiniteFieldsAndCharacterSums:FF.1/canonical-additive-character.

/-- Test `dworkIsocrystal_zero` (degenerate): for `π = 0` the multiplier is `1`. -/
example (K : Type*) [Field K] [CharZero K] (q : ℕ) : dworkFrobeniusSeries K 0 q = 1 := by
  sorry

/-- Test `dworkIsocrystal_printed_sign` (non-example): Kedlaya's printed multiplier
`exp(πx - πx^q)` is not horizontal for `∇e = π e dx` (the defect has constant term `2π`). -/
example (K : Type*) [Field K] [CharZero K] (π : K) (hπ : π ≠ 0) (q : ℕ) (hq : 2 ≤ q) :
    PowerSeries.derivative K (dworkFrobeniusSeries K (-π) q) + PowerSeries.C π * dworkFrobeniusSeries K (-π) q ≠
      PowerSeries.C (π * q) * PowerSeries.X ^ (q - 1) * dworkFrobeniusSeries K (-π) q := by
  sorry

/-! ### RD.6/geometric-fourier-transform -/

-- geometricFourier: not stated; needs (σ, ∇)-modules over K⟨s, x⟩† and the pullback L_{sx}.
-- geometricFourier.frobenius, geometricFourier.weylModule, geometricFourier.fibre,
--   geometricFourier_iso: not stated; need the same objects.
-- Tests `geometricFourier_trivial` (computation), `geometricFourier_zero` (degenerate),
--   `geometricFourier_dwork_fibre` (compatibility), `geometricFourier_not_locally_free`
--   (non-example): not stated; need dagger modules over K⟨s, x⟩†.

/-! ### RD.6/swan-conductor-of-isocrystal -/

/-- The Swan conductor of a finite-image representation of `G = Gal(F/E_x)` from its Swan
function and character: `(1/|G|) Σ_g Swan(g) χ(g)`. -/
noncomputable def swanConductor {K G : Type*} [Field K] [Fintype G] (swanFn : G → ℤ)
    (χ : G → K) : K :=
  (Fintype.card G : K)⁻¹ * ∑ g, (swanFn g : K) * χ g

-- localMonodromy: not stated; needs RD.2 local monodromy (quasi-unipotence) of F-isocrystals.
-- swanConductor_eq_breaks, swanConductor_additive, swanConductor_twist: not stated; need the
--   upper-numbering ramification theory of ArithmeticGaloisRepresentations:R01.3.
-- swanConductor_of_unipotent: not stated; needs RD.2 unipotence.
-- Test `swanConductor_dwork` (computation): not stated; needs the Artin–Schreier break (R01.3).
-- Test `swanConductor_not_irregularity_of_frobenius` (non-example): not stated; needs F-isocrystals.

/-- Test `swanConductor_const` (degenerate): if the Swan function vanishes, so does the
conductor (tame or unipotent local monodromy). -/
example {K G : Type*} [Field K] [Fintype G] (χ : G → K) :
    swanConductor (fun _ : G => (0 : ℤ)) χ = 0 := by
  sorry

/-- Test `swanConductor_formula_trivialGroup` (compatibility): for the trivial group the
Swan function is `0` at `e` and the conductor is `0`. -/
example {K : Type*} [Field K] (χ : Unit → K) : swanConductor (fun _ : Unit => (0 : ℤ)) χ = 0 := by
  sorry

/-! ### RD.6/pointwise-iota-weights and RD.6/iota-real-and-realizable -/

namespace FibreData

variable {K L : Type*} [Field K] [Field L] [Algebra K L] (D : FibreData K)

/-- `E` is ι-pure of weight `w`: every eigenvalue `α` of `F_x` has `|ι(α)| = q^{w·deg x/2}`.
(The number-level predicate is DeligneWeightsAndPurity:DWP.0's.) -/
def IsIotaPure (ι : L →+* ℂ) (q w : ℝ) : Prop :=
  ∀ x, ∀ α ∈ ((D.fibreFrobenius x).charpoly.map (algebraMap K L)).roots,
    ‖ι α‖ = q ^ (w * D.deg x / 2)

/-- ι-mixed of weight `≤ w`: integral excess `i ≤ 0` at every eigenvalue. -/
def IsIotaMixedLE (ι : L →+* ℂ) (q w : ℝ) : Prop :=
  ∀ x, ∀ α ∈ ((D.fibreFrobenius x).charpoly.map (algebraMap K L)).roots,
    ∃ i : ℤ, i ≤ 0 ∧ ‖ι α‖ = q ^ ((w + i) * D.deg x / 2)

/-- ι-mixed of weight `≥ w`. -/
def IsIotaMixedGE (ι : L →+* ℂ) (q w : ℝ) : Prop :=
  ∀ x, ∀ α ∈ ((D.fibreFrobenius x).charpoly.map (algebraMap K L)).roots,
    ∃ i : ℤ, 0 ≤ i ∧ ‖ι α‖ = q ^ ((w + i) * D.deg x / 2)

/-- Weakly ι-mixed of weight `≤ w`: real excess. -/
def IsWeaklyIotaMixedLE (ι : L →+* ℂ) (q w : ℝ) : Prop :=
  ∀ x, ∀ α ∈ ((D.fibreFrobenius x).charpoly.map (algebraMap K L)).roots,
    ∃ i : ℝ, i ≤ 0 ∧ ‖ι α‖ = q ^ ((w + i) * D.deg x / 2)

/-- `E` is ι-real: all local traces are real under `ι`. -/
def IsIotaReal (ι : L →+* ℂ) : Prop :=
  ∀ x (n : ℕ), (ι (algebraMap K L (Matrix.trace (D.frob x ^ n)))).im = 0

theorem isIotaPure_tateTwist (ι : L →+* ℂ) (q w : ℝ) (qK : K) (hq : ‖ι (algebraMap K L qK)‖ = q)
    (hq1 : 1 < q) (n : ℤ) :
    (D.tateTwist qK n).IsIotaPure ι q (w - 2 * n) ↔ D.IsIotaPure ι q w := by
  sorry

/-- ι-reality through traces is equivalent to ι-reality of the characteristic polynomials
(Newton's identities, characteristic zero). -/
theorem isIotaReal_iff_traces [CharZero K] (ι : L →+* ℂ) :
    D.IsIotaReal ι ↔ ∀ x (n : ℕ), (ι (algebraMap K L ((D.frob x).charpoly.coeff n))).im = 0 := by
  sorry

-- isIotaPure_dual, isIotaPure_tensor, isIotaPure_pullback, isIotaMixed_of_exact,
--   h0_of_isIotaPure, isIotaMixed_of_successiveExtension: not stated; need duals, tensor products,
--   pullbacks, exact sequences and H^0 of overconvergent F-isocrystals (RD.3, RD.4).
-- IsIotaRealizable: not stated; needs direct summands in the category of overconvergent
--   F-isocrystals (RD.3); a fibrewise version would be weaker than Kedlaya's.
-- isIotaRealizable_of_isIotaPure, isIotaReal_add, isIotaReal_of_rational: not stated; need the same.
-- Tests `dwork_not_iotaReal`, `dwork_iotaRealizable`: not stated; need the Dwork isocrystal.
-- Test `isIotaReal_conj_pairing` (compatibility): not stated; needs duals of F-isocrystals.

/-- Test `isIotaPure_const` (computation): trivial Frobenius is pure of weight `0`. -/
example (ι : L →+* ℂ) (q : ℝ) (hq : 0 < q) (h : ∀ x, D.frob x = 1) : D.IsIotaPure ι q 0 := by
  sorry

/-- Test `isIotaPure_tate` (computation): `F = q` everywhere is pure of weight `2`. -/
example (ι : L →+* ℂ) (qK : K) (q : ℝ) (hq : ‖ι (algebraMap K L qK)‖ = q) (hq0 : 0 < q)
    (h : ∀ x, D.frob x = qK • 1) : D.IsIotaPure ι q 2 := by
  sorry

/-- Test `isIotaPure_zero` (degenerate): rank zero at every point is pure of every weight. -/
example (ι : L →+* ℂ) (q w : ℝ) (h : ∀ x, D.rank x = 0) : D.IsIotaPure ι q w := by
  sorry

/-- Test `isIotaReal_const` (computation): trivial Frobenius is ι-real. -/
example (ι : L →+* ℂ) (h : ∀ x, D.frob x = 1) : D.IsIotaReal ι := by
  sorry

/-- Test `isIotaReal_zero` (degenerate). -/
example (ι : L →+* ℂ) (h : ∀ x, D.rank x = 0) : D.IsIotaReal ι := by
  sorry

end FibreData

/-- Test `weaklyMixed_not_mixed` (non-example): on `Spec F_3`, `F = 4` has
`|4| = 3^{w/2}` with `w = 2 log_3 4`, which is not `2 + i` for an integer `i ≥ 0`. -/
example : ¬ ∃ i : ℤ, 0 ≤ i ∧ (4 : ℝ) = (3 : ℝ) ^ (((2 : ℝ) + i) / 2) := by
  sorry

/-- Test `iotaWeight_depends_on_iota` (non-example): `1 + √2` has absolute values
`1 + √2 ≠ √2 - 1` under the two real embeddings of `Q(√2)`, so its ι-weight depends on ι. -/
example : (1 + Real.sqrt 2) ≠ |1 - Real.sqrt 2| := by
  sorry

/-! ### RD.6/determinantal-weights -/

/-- Determinantal weights from the absolutely irreducible constituents, each given as
`(rank, weight of its determinant)`. -/
noncomputable def detWeights (cs : List (ℕ × ℝ)) : List ℝ :=
  cs.map fun c => c.2 / c.1

/-- Purely of determinantal weight `α`. -/
def IsPurelyDetWeight (cs : List (ℕ × ℝ)) (α : ℝ) : Prop :=
  ∀ w ∈ detWeights cs, w = α

theorem detWeight_rankOne (w : ℝ) : detWeights [(1, w)] = [w] := by
  sorry

theorem detWeight_of_isIotaPure (cs : List (ℕ × ℝ)) (w : ℝ) (h : ∀ c ∈ cs, 0 < c.1 ∧ c.2 = c.1 * w) :
    IsPurelyDetWeight cs w := by
  sorry

theorem detWeight_dual (cs : List (ℕ × ℝ)) :
    detWeights (cs.map fun c => (c.1, -c.2)) = (detWeights cs).map Neg.neg := by
  sorry

-- detWeight_tensor: not stated; needs tensor products and the monodromy group (RD.6/global-monodromy-group).

/-- Test `detWeight_const` (computation): the constant object has determinantal weight `0`. -/
example : detWeights [(1, 0)] = [0] := by
  sorry

/-- Test `detWeight_zero` (degenerate): the zero object has no determinantal weights. -/
example : detWeights [] = [] := by
  sorry

/-- Test `detWeight_constituents` (non-example): `K ⊕ K(-2)` has determinantal weights
`{0, 4}`, not the average `2`. -/
example : detWeights [(1, 0), (1, 4)] = [0, 4] ∧ detWeights [(1, 0), (1, 4)] ≠ [2, 2] := by
  sorry

/-- Test `detWeight_rankOne_compat` (compatibility): for rank one the determinantal weight is
the ι-weight. -/
example (w : ℝ) : IsPurelyDetWeight [(1, w)] w := by
  sorry

/-! ### RD.6/global-monodromy-group -/

-- monodromyGroup, fibreFunctor, tannakaEquiv, monodromyGroup_irreducible,
--   monodromyGroup_trivial_on_constant, weilGroup, frobenius_normalises: not stated; need the
--   Tannakian formalism of MotivesAndAlgebraicCycles:MC.6 and modules with connection over
--   dagger algebras (RD.3).
-- Tests `monodromyGroup_constant`, `monodromyGroup_dwork`, `monodromyGroup_twist_invariant`,
--   `monodromyGroup_rankOne`: not stated; need the same.

-- RD.6/normaliser-over-centraliser-finite: not stated; needs Lie algebras of affine algebraic
--   groups (Tau Ceti ReductiveGroups, Layers 2–3); its Lie-theoretic inputs are Mathlib's
--   `LieModule.isNilpotent_derivedSeries_of_traceForm_eq_zero` (Cartan) and
--   `LieModule.isNilpotent_iff_forall` (Engel), used as they stand.

/-! ### RD.6/slope-interval-of-isocrystal -/

/-- The slope `v_p(α)/v_p(q)` of `α`, for an additive valuation `vp` normalised by `vp p = 1`
and `q = p ^ a`. -/
noncomputable def slope {L : Type*} (vp : L → ℚ) (a : ℕ) (α : L) : ℚ :=
  vp α / a

/-- Slopes of the reciprocal roots of `T² - aT + b` from its Newton polygon (with the
convention `v_p(0) = ∞`): used for the Frobenius of an elliptic curve. -/
noncomputable def quadraticNewtonSlopes (p : ℕ) (a b : ℤ) : ℚ × ℚ :=
  if a = 0 ∨ padicValInt p b ≤ 2 * padicValInt p a then
    ((padicValInt p b : ℚ) / 2, (padicValInt p b : ℚ) / 2)
  else ((padicValInt p a : ℚ), (padicValInt p b : ℚ) - padicValInt p a)

/-- `E` has slopes in `[r, s]`: every eigenvalue of `F_x` has slope in `[r·deg x, s·deg x]`. -/
def HasSlopesIn {K L : Type*} [Field K] [Field L] [Algebra K L] (D : FibreData K)
    (vp : L → ℚ) (a : ℕ) (r s : ℚ) : Prop :=
  ∀ x, ∀ α ∈ ((D.fibreFrobenius x).charpoly.map (algebraMap K L)).roots,
    r * D.deg x ≤ slope vp a α ∧ slope vp a α ≤ s * D.deg x

theorem slope_mul {L : Type*} [Field L] (vp : L → ℚ) (hvp : ∀ α β, α ≠ 0 → β ≠ 0 → vp (α * β) = vp α + vp β)
    (a : ℕ) (α β : L) (hα : α ≠ 0) (hβ : β ≠ 0) :
    slope vp a (α * β) = slope vp a α + slope vp a β := by
  sorry

-- hasSlopesIn_tateTwist, slopes_eq_newton, hasSlopesIn_const: `slopes_eq_newton` needs the
--   Newton polygon of RD.1/frobenius-slopes; the other two are stated on `FibreData` once a
--   valuation on `L` is fixed (as in `HasSlopesIn`).

/-- Test `slope_ordinary` (computation): `T² - 3T + 7` over `F_7` has slopes `0` and `1`. -/
example : quadraticNewtonSlopes 7 3 7 = (0, 1) := by
  sorry

/-- Test `slope_supersingular` (computation): `T² + 7` over `F_7` has slopes `1/2, 1/2`. -/
example : quadraticNewtonSlopes 7 0 7 = (1 / 2, 1 / 2) := by
  sorry

/-- Test `slope_const` (degenerate): `slope` of a unit is `0`. -/
example {L : Type*} (vp : L → ℚ) (a : ℕ) (u : L) (hu : vp u = 0) : slope vp a u = 0 := by
  sorry

/-- Test `slope_not_weight` (non-example): the roots of `T² - 3T + 7` both have complex
absolute value `√7` although their slopes are `0` and `1`. -/
example : ∀ z : ℂ, z ^ 2 - 3 * z + 7 = 0 → ‖z‖ = Real.sqrt 7 := by
  sorry

/-! ### RD.6: weights of H^1 of an affine curve (the ColemanIntegration request), linear-algebra core -/

/-- If `0 → V₁ → V → V₂` is exact and Frobenius-equivariant, every eigenvalue of `F` on `V`
is an eigenvalue on `V₁` or on `V₂`. With `V₁ = H^1(X)` (weight 1) and `V₂` the residue part
(eigenvalues `qζ`), no eigenvalue on `H^1(Y)` is a root of unity. -/
theorem eigenvalue_of_left_exact {K V₁ V V₂ : Type*} [Field K] [AddCommGroup V₁] [Module K V₁]
    [AddCommGroup V] [Module K V] [AddCommGroup V₂] [Module K V₂] [FiniteDimensional K V]
    {i : V₁ →ₗ[K] V} {r : V →ₗ[K] V₂} (hi : Function.Injective i) (hex : Function.Exact i r)
    {F₁ : Module.End K V₁} {F : Module.End K V} {F₂ : Module.End K V₂}
    (h₁ : F ∘ₗ i = i ∘ₗ F₁) (h₂ : r ∘ₗ F = F₂ ∘ₗ r) (μ : K) (hμ : F.HasEigenvalue μ) :
    F₁.HasEigenvalue μ ∨ F₂.HasEigenvalue μ := by
  sorry

/-! ### RD.7/weil-factor -/

/-- The Weil factor `P_i(t) = det(1 - tF | H^i)` of a Frobenius on a finite-dimensional space. -/
noncomputable def weilFactor {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (F : Module.End K V) : K[X] :=
  (LinearMap.charpoly F).reverse

theorem weilFactor_constantCoeff {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (F : Module.End K V) : (weilFactor F).coeff 0 = 1 := by
  sorry

theorem weilFactor_natDegree {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (F : Module.End K V) (hF : Function.Bijective F) :
    (weilFactor F).natDegree = Module.finrank K V := by
  sorry

/-- Functional equation (RD.6/rigid-functional-equation): for a perfect Frobenius-equivariant
pairing `⟨F v, G w⟩ = c ⟨v, w⟩` (`c = q^n`), `det F · P_G(t) = (-1)^b · χ_F(c t)`, where
`χ_F` is the characteristic polynomial of `F` and `b = dim V`. -/
theorem weilFactor_functionalEquation {K V W : Type*} [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (F : Module.End K V) (G : Module.End K W) (B : V →ₗ[K] W →ₗ[K] K)
    (hB : ∀ v, (∀ w, B v w = 0) → v = 0) (hdim : Module.finrank K V = Module.finrank K W)
    (c : K) (hc : c ≠ 0) (hFG : ∀ v w, B (F v) (G w) = c * B v w) :
    Polynomial.C (LinearMap.det F) * weilFactor G =
      Polynomial.C ((-1) ^ Module.finrank K V) * (LinearMap.charpoly F).comp (Polynomial.C c * X) := by
  sorry

-- weilFactor_eq_crys, weilFactor_zeta, weilFactor_mem_int, weilFactor_baseChange,
--   weilFactor_eq_ellAdic: not stated; need rigid and crystalline cohomology (RD.4, CR.3),
--   the zeta function (WC.1) and ℓ-adic cohomology (DWP.4/DWP.7).

/-- Test `weilFactor_projectiveLine` (computation): on `H²(P¹) = K(-1)`, `P₂ = 1 - qt`. -/
example {K : Type*} [Field K] (q : K) :
    weilFactor (q • LinearMap.id : Module.End K K) = 1 - Polynomial.C q * X := by
  sorry

/-- Test `weilFactor_ellipticOrdinary` (computation): the companion matrix of `T² - 3T + 7`
(Frobenius of `y² = x³ + x + 1` over `F_7`) has Weil factor `1 - 3t + 7t²`. -/
example : weilFactor (Matrix.toLin' !![(0 : ℚ), -7; 1, 3]) = 1 - 3 * X + 7 * X ^ 2 := by
  sorry

/-- Test `weilFactor_point` (degenerate): on `H⁰(Spec F_q) = K` with `F = 1`, `P₀ = 1 - t`. -/
example {K : Type*} [Field K] : weilFactor (LinearMap.id : Module.End K K) = 1 - X := by
  sorry

/-- Test `weilFactor_semilinear_basis` (non-example): for `q = p²`, the matrix of a
`σ`-semilinear `φ` changes to `u·σ(c)/c` under `e ↦ c·e`, so its "characteristic polynomial"
is not an invariant; the invariant is the eigenvalue `u·σ(u)` of `φ²`. Stated for
`W(F_{p²})`: `σ(c)/c` is not constant in `c`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ c : WittVector p (GaloisField p 2), IsUnit c ∧ WittVector.frobenius c ≠ c := by
  sorry

/-- Test `weilFactor_crys_compat` (compatibility): on `H²_crys(P¹/Z_p) = Z_p` with `φ = p`,
`det(1 - tφ) = 1 - pt = P₂(P¹)` for `q = p`. -/
example (p : ℕ) :
    weilFactor ((p : ℚ) • LinearMap.id : Module.End ℚ ℚ) = 1 - Polynomial.C (p : ℚ) * X := by
  sorry

/-! ### RD.6 and RD.7 named theorems that need rigid or crystalline cohomology -/

-- lefschetzTraceFormula (RD.6/lefschetz-trace-formula): not stated; needs RD.4 compactly
--   supported rigid cohomology; conclusion `SatisfiesTraceFormula (fibre data) (H_c)`.
-- pAdicWeilII (RD.6/p-adic-weil-ii): not stated; needs RD.4 cohomology and the RD.3 category
--   (ι-realizable objects); its conclusion is `IsIotaMixedLE`/`IsIotaMixedGE` on cohomology.
-- puritySmoothProper (RD.6/purity-smooth-proper): not stated; needs RD.4 cohomology of smooth
--   proper schemes.
-- weightsOfH1OfAffineCurve (RD.6/weights-of-h1-of-affine-curve): not stated; needs RD.4 and
--   RD.5; its linear-algebra core is `eigenvalue_of_left_exact`.
-- rigidCrystallineComparison (RD.7/rigid-crystalline-comparison): not stated; needs RD.4
--   rigid cohomology and CrystallineCohomology:CR.3 crystalline cohomology.
-- weilFactorExport (RD.7/weil-factor-export): not stated; needs the same, plus the zeta
--   function of WeilConjectures:WC.1; its factors are `weilFactor` of the q-Frobenius.

end PartD

/-! ## Nodes without a declaration of their own

Every definition, API item and unit test of the packet appears above under its packet name, as a
declaration, an `example` or a `not stated` comment. The following nodes have no declaration of
their own in this file; the packet and the roadmap document state them. For the definitions and
constructions among them, the API items are the `not stated` comments above. Most need objects that
the pinned libraries lack (rigid analytic spaces, frames, rigid cohomology, crystalline cohomology).

* RD.2: `RD.2/finitely-presented-differential-module-is-free`,
  `RD.2/slope-zero-eigenvectors-descend-to-overconvergent`, `RD.2/special-polygon-above-generic`,
  `RD.2/coincident-polygons-common-filtration`, `RD.2/good-models-of-sigma-modules`,
  `RD.2/differentials-have-positive-slopes`, `RD.2/slope-filtration-is-horizontal`,
  `RD.2/isoclinic-model-inherits-connection`, `RD.2/quasi-unipotent-implies-overconvergent`,
  `RD.2/log-robba-ring-antiderivative`, `RD.2/slope-pieces-horizontal-after-finite-extension`,
  `RD.2/unipotent-log-extension-nilpotent-residue-example`,
  `RD.2/frobenius-hypothesis-is-necessary`, `RD.2/dwork-exponential-artin-schreier-example`.
* RD.3: `RD.3/j-dagger`, `RD.3/j-dagger-properties`, `RD.3/overconvergent-sections-of-affine-frame`,
  `RD.3/overconvergent-isocrystal-connection-form`, `RD.3/frame-pullback-functor`,
  `RD.3/taylor-comparison-of-pullbacks`, `RD.3/overconvergent-isocrystals-of-a-variety`,
  `RD.3/restriction-to-convergent`, `RD.3/finite-etale-pushforward-of-isocrystals`,
  `RD.3/full-faithfulness-requires-frobenius`, `RD.3/affine-space-two-embeddings-acceptance`,
  `RD.3/punctured-curve-boundary-acceptance`.
* RD.4: `RD.4/finite-flat-pullback-injective`, `RD.4/finite-etale-pushforward-de-rham`,
  `RD.4/independence-of-embedding`, `RD.4/functoriality-of-rigid-cohomology`,
  `RD.4/compactly-supported-rigid-cohomology`, `RD.4/compact-support-independence-of-embedding`,
  `RD.4/compact-support-independence-of-compactification`, `RD.4/compact-support-functoriality`,
  `RD.4/forget-supports-map`, `RD.4/excision-sequence`, `RD.4/rigid-cohomology-with-supports`,
  `RD.4/localisation-sequence`, `RD.4/frobenius-independent-of-lift`,
  `RD.4/monsky-washnitzer-comparison`, `RD.4/compact-support-complex-of-affine-space`,
  `RD.4/gysin-isomorphism`, `RD.4/finite-etale-pushforward-cohomology`,
  `RD.4/finite-flat-base-change`, `RD.4/mw-comparison-for-affine-curves`,
  `RD.4/proper-rigid-equals-convergent`, `RD.4/cohomology-of-projective-line`.
* RD.5: `RD.5/fringe-norm-interpolation`, `RD.5/relative-robba-ring`,
  `RD.5/relative-sigma-nabla-module`, `RD.5/unipotent-relative-module`,
  `RD.5/strongly-unipotent-basis-exists`, `RD.5/strongly-unipotent-span-unique`,
  `RD.5/horizontal-projection-iteration`, `RD.5/horizontal-sections-descend`,
  `RD.5/generic-unipotence-spreads-out-radius`, `RD.5/generic-unipotence-spreads-out`,
  `RD.5/relative-local-monodromy-theorem`, `RD.5/local-algebras-at-missing-points`,
  `RD.5/reduction-principal-parts-near-isomorphism`, `RD.5/principal-parts-embedding-closed`,
  `RD.5/principal-parts-near-isomorphism`,
  `RD.5/finiteness-for-affine-curves-constant-coefficients`, `RD.5/dimension-of-h1-of-affine-curve`,
  `RD.5/van-der-put-legendre-computation`, `RD.5/robba-matrix-factorisation`,
  `RD.5/simultaneous-matrix-approximation`, `RD.5/unipotent-local-residue-isomorphism`,
  `RD.5/unipotent-curve-near-isomorphism`, `RD.5/finiteness-for-affine-curves`,
  `RD.5/nonarchimedean-hahn-banach`, `RD.5/frechet-montel-transpose-strict`,
  `RD.5/crew-finiteness-and-duality-on-curves`,
  `RD.5/unipotent-local-cohomology-finitely-generated`,
  `RD.5/relative-local-cohomology-finitely-generated`, `RD.5/relative-local-cohomology-base-change`,
  `RD.5/generic-pushforward-modules`, `RD.5/generic-pushforward-theorem`,
  `RD.5/leray-long-exact-sequence`, `RD.5/finite-cokernel-strict`,
  `RD.5/strictness-of-localisation`, `RD.5/strictness-of-relative-connection`,
  `RD.5/strictness-of-vertical-connection`, `RD.5/strictness-from-finite-cohomology`,
  `RD.5/residue-pairing-perfect`, `RD.5/poincare-duality-on-affine-space`,
  `RD.5/pushforward-flat-base-change`, `RD.5/relative-poincare-duality`,
  `RD.5/pushforward-external-product`, `RD.5/finiteness-for-smooth-varieties`,
  `RD.5/smooth-proper-hypercovering`, `RD.5/cohomological-descent-for-proper-hypercoverings`,
  `RD.5/finiteness-of-rigid-cohomology`, `RD.5/frobenius-bijective-on-cohomology`,
  `RD.5/compact-support-vanishing-above-twice-dimension`, `RD.5/trace-map`,
  `RD.5/top-compact-support-cohomology`, `RD.5/poincare-pairing`,
  `RD.5/excision-duality-compatibility`, `RD.5/poincare-duality`,
  `RD.5/finiteness-of-compactly-supported-rigid-cohomology`, `RD.5/euler-characteristic-duality`,
  `RD.5/kunneth-morphism`, `RD.5/kunneth-formula-with-supports`, `RD.5/kunneth-formula`,
  `RD.5/affine-curve-duality-acceptance`.
* RD.6: `RD.6/dwork-operators-are-nuclear`, `RD.6/galois-frobenius-exists`,
  `RD.6/parallel-transport-action`, `RD.6/unit-ideal-without-rational-points`,
  `RD.6/dwork-trace-vanishes-without-rational-points`, `RD.6/frobenius-bijective-on-smooth`,
  `RD.6/canonical-dwork-operator-on-cohomology`, `RD.6/trace-formula-without-rational-points`,
  `RD.6/rigid-cohomology-of-a-finite-field-point`, `RD.6/trace-formula-dimension-zero`,
  `RD.6/monsky-washnitzer-fixed-point-formula`, `RD.6/projective-line-frobenius-eigenvalues`,
  `RD.6/multiplicative-group-mixed-weights`, `RD.6/relative-dwork-trick`,
  `RD.6/degeneration-injection`, `RD.6/robba-matrix-factorisation-in-parameter`,
  `RD.6/horizontal-sections-descend-in-families`,
  `RD.6/pushforward-free-when-fibre-cohomology-constant`,
  `RD.6/frobenius-structure-gives-weyl-module`, `RD.6/fourier-transform-comparison`,
  `RD.6/fourier-transform-rank-and-irreducibility`, `RD.6/grothendieck-ogg-shafarevich-formula`,
  `RD.6/conductor-estimate-for-polynomial-twists`, `RD.6/rank-one-isocrystals-are-pure`,
  `RD.6/frobenius-power-inner-on-monodromy`, `RD.6/determinantal-weight-via-central-frobenius`,
  `RD.6/determinantal-weights-functoriality`, `RD.6/rankin-squaring-bound`,
  `RD.6/iota-real-constituents-are-pure`, `RD.6/weight-drop-lemma`,
  `RD.6/local-invariants-weakly-mixed`, `RD.6/local-invariants-strongly-mixed`,
  `RD.6/purity-via-fourier-on-affine-line`, `RD.6/weil-ii-on-affine-line`,
  `RD.6/nonnegative-slopes-of-h1c-on-curves`, `RD.6/slope-bounds-for-rigid-cohomology`,
  `RD.6/gysin-sequence-for-curves`.
* RD.7: `RD.7/frobenius-compatibility-of-comparison`, `RD.7/rigid-zeta-expression`,
  `RD.7/weil-factors-rational-and-integral`, `RD.7/ell-adic-comparison-smooth-projective`,
  `RD.7/ell-adic-comparison-smooth-proper`, `RD.7/de-rham-lift-insufficient`,
  `RD.7/elliptic-curve-slopes-versus-weights`, `RD.7/kedlaya-point-counting-certification`.
-/

end TauCeti.RigidCohomology
