/-
Suggested Lean prototypes for the roadmap "P-adic Hodge theory and geometric comparison"
(PadicHodgeTheory), part P7: stages P7:annulus-foundations, P7, P8:local-rational, P8, R06.1,
R06.2, R06.3 and R06.4.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PadicHodgeTheory--P7.md` is definitive. The statements below suggest Lean
forms so that contributors and reviewers converge on names and signatures. Every proof of a planned
result is `sorry`, and definitions of objects the pinned libraries lack are signatures with `sorry`
bodies; nothing here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. One Tau Ceti
module is imported, `TauCeti.RingTheory.Huber.Restricted.TwoSidedSeries.Convolution`, for a
compatibility test of the annulus rings.

Names are relative to the namespace `TauCeti.PadicHodge` and agree with the `api` and `tests` names of
the packet `research/blueprint/packets/PadicHodgeTheory--P7.json`. Unit tests are `example`s whose
docstring begins "Test `<name>`". An API item or test that cannot be stated honestly with the pinned
libraries is a comment `-- <name>: not stated; needs <missing object>`. Objects of other roadmaps are
never invented here: where a statement needs one it is a comment, or it enters as a parameter whose
properties are hypotheses.

Organisation. One section per pair of layers:
* `PartA` (P7:annulus-foundations, P7): Laurent-series rings of annuli as coefficient families
  `ℤ → K` with the convolution product, Gauss norms, restriction maps, the Robba, bounded and Amice
  rings, the cyclotomic rings with φ and Γ; Berger's rings of a p-adic field and his dictionary
  mostly as comments, since they need the field of norms (PhiGamma PG.0).
* `PartB` (P8:local-rational, P8): ring-level pieces of Scholze's period sheaves (the erratum's ring,
  the power-series model of OB_dR^+, the formal Poincaré lemma, φ and N on B[u]); the sheaves on the
  pro-étale site are comments.
* `PartC` (R06.1, R06.2): the Galois action on ℂ_p, the tilt and ξ, Mathlib's `BDeRhamPlus` and
  `BDeRham` with the missing ℚ_p-algebra, filtration and θ given as signatures, B_cris and B_st,
  period functors, filtered (φ,N)-modules, t_H, t_N and weak admissibility.
* `D` (R06.3, R06.4): crystals over a ring with derivation and unipotent connections, the
  Weil–Deligne recipe, ordinary representations and the Hodge–Tate sign dictionary.
-/

import Mathlib.Topology.Algebra.InfiniteSum.DiscreteConvolution
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.PowerSeries.GaussNorm
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.FieldTheory.Perfect
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Order.Filter.ZeroAndBoundedAtFilter
import Mathlib.Topology.UniformSpace.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Topology.Algebra.Valued.NormedValued
import Mathlib.Topology.Algebra.Valued.ValuedField
import TauCeti.RingTheory.Huber.Restricted.TwoSidedSeries.Convolution
import Mathlib.RingTheory.Perfectoid.BDeRham
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.MvPowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.RingTheory.WittVector.FrobeniusFractionField
import Mathlib.RepresentationTheory.Invariants
import Mathlib.Algebra.BigOperators.Finprod
import Mathlib.FieldTheory.KrullTopology
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.LinearIndependent.Defs
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Algebra.Module.Equiv.Basic

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

noncomputable section

namespace TauCeti.PadicHodge

/-! # Layers P7:annulus-foundations and P7: coefficient rings on annuli and the Robba dictionary -/

section

open Filter Topology
open scoped DiscreteConvolution TensorProduct NormedField

/-! # Part A. Layer P7:annulus-foundations — early analytic coefficient rings -/

section PartA

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-! ## P7:annulus-foundations/annulus-laurent-ring -/

/-- The coefficient families of Laurent series `∑ aₙ Tⁿ` converging on the annulus `|T| ∈ I`:
`‖aₙ‖ ρⁿ → 0` as `|n| → ∞` for every `ρ ∈ I`. -/
def annulusCoeffs (I : Set ℝ) : Submodule K (ℤ → K) where
  carrier := {a | ∀ ρ ∈ I, Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- The ring `O_K(I)` of analytic functions on the annulus `|T| ∈ I`. -/
abbrev AnnulusRing (I : Set ℝ) := ↥(annulusCoeffs K I)

/-- The `ρ`-Gauss norm `|a|_ρ = sup_n ‖aₙ‖ ρⁿ` of a coefficient family. -/
def gaussNorm (ρ : ℝ) (a : ℤ → K) : ℝ := ⨆ n : ℤ, ‖a n‖ * ρ ^ n

theorem gaussNorm_nonneg (ρ : ℝ) (hρ : 0 < ρ) (a : ℤ → K) : 0 ≤ gaussNorm K ρ a := by sorry

namespace AnnulusRing

variable {K} {I : Set ℝ}

/-- The coefficient family. -/
def coeff (f : AnnulusRing K I) : ℤ → K := f

@[ext] theorem ext {f g : AnnulusRing K I} (h : ∀ n, coeff f n = coeff g n) : f = g := by sorry

instance : Mul (AnnulusRing K I) := ⟨fun a b => ⟨(a : ℤ → K) ⋆ᵣ₊ (b : ℤ → K), by sorry⟩⟩

instance : One (AnnulusRing K I) := ⟨⟨Pi.single 0 1, by sorry⟩⟩

/-- `O_K(I)` is a commutative ring under the Cauchy product. -/
instance instCommRing : CommRing (AnnulusRing K I) :=
  { (inferInstance : AddCommGroup (AnnulusRing K I)) with
    mul_assoc := by sorry
    one_mul := by sorry
    mul_one := by sorry
    zero_mul := by sorry
    mul_zero := by sorry
    left_distrib := by sorry
    right_distrib := by sorry
    mul_comm := by sorry }

instance instAlgebra : Algebra K (AnnulusRing K I) := Algebra.ofModule (by sorry) (by sorry)

theorem coeff_mul (f g : AnnulusRing K I) (n : ℤ) :
    coeff (f * g) n = ((coeff f) ⋆ᵣ₊ (coeff g)) n := by sorry

/-- The coordinate `T`. -/
def T : AnnulusRing K I := ⟨Pi.single 1 1, by sorry⟩

/-- The constant `c`. -/
def C (c : K) : AnnulusRing K I := ⟨Pi.single 0 c, by sorry⟩

/-- `T⁻¹`. -/
def Tinv : AnnulusRing K I := ⟨Pi.single (-1) 1, by sorry⟩

theorem T_isUnit : IsUnit (T : AnnulusRing K I) := by sorry

/-- `T` as a unit, with inverse `T⁻¹`. -/
def Tunit : (AnnulusRing K I)ˣ := ⟨T, Tinv, by sorry, by sorry⟩

/-- Laurent polynomials are analytic on every annulus. -/
def ofLaurentPolynomial : LaurentPolynomial K →ₐ[K] AnnulusRing K I := by sorry

theorem annulusCoeffs_antitone {I J : Set ℝ} (h : I ⊆ J) :
    annulusCoeffs K J ≤ annulusCoeffs K I := by sorry

theorem annulusCoeffs_one_eq_twoSidedRestricted :
    annulusCoeffs K {1} = TauCeti.Huber.twoSidedRestrictedSubmodule K K := by sorry

/-- The geometric series `∑_{n ≥ 0} Tⁿ` as a coefficient family. -/
def geomCoeffs : ℤ → K := fun n => if 0 ≤ n then 1 else 0

/-- Test `AnnulusRing.test_T_mul_Tinv` (computation). -/
example : (T : AnnulusRing K I) * Tinv = 1 := by sorry

/-- Test `AnnulusRing.test_geometric` (computation). -/
example : ∃ g : AnnulusRing K (Set.Ioo 0 1), coeff g = (geomCoeffs : ℤ → K) ∧ (1 - T) * g = 1 := by sorry

/-- Test `AnnulusRing.test_geometric_not_mem` (non-example). -/
example : (geomCoeffs : ℤ → K) ∉ annulusCoeffs K {1} := by sorry

/-- Test `AnnulusRing.test_unit_circle` (compatibility). -/
example : annulusCoeffs K {1} = TauCeti.Huber.twoSidedRestrictedSubmodule K K := by sorry

/-- Test `AnnulusRing.test_polynomial_mem` (degenerate). -/
example (a : ℤ →₀ K) : (a : ℤ → K) ∈ annulusCoeffs K I := by sorry

/-! ## P7:annulus-foundations/gauss-norm -/

theorem gaussNorm_eq_zero_iff {ρ : ℝ} (hρ : ρ ∈ I) (hpos : 0 < ρ) (f : AnnulusRing K I) :
    gaussNorm K ρ (coeff f) = 0 ↔ f = 0 := by sorry

theorem gaussNorm_add_le {ρ : ℝ} (hρ : ρ ∈ I) (f g : AnnulusRing K I) :
    gaussNorm K ρ (coeff (f + g)) ≤ max (gaussNorm K ρ (coeff f)) (gaussNorm K ρ (coeff g)) := by
  sorry

theorem gaussNorm_smul {ρ : ℝ} (hρ : ρ ∈ I) (c : K) (f : AnnulusRing K I) :
    gaussNorm K ρ (coeff (c • f)) = ‖c‖ * gaussNorm K ρ (coeff f) := by sorry

theorem gaussNorm_T_zpow {ρ : ℝ} (hρ : ρ ∈ I) (hpos : 0 < ρ) (n : ℤ) :
    gaussNorm K ρ (coeff ((Tunit ^ n : (AnnulusRing K I)ˣ) : AnnulusRing K I)) = ρ ^ n := by sorry

theorem norm_coeff_mul_le_gaussNorm {ρ : ℝ} (hρ : ρ ∈ I) (f : AnnulusRing K I) (n : ℤ) :
    ‖coeff f n‖ * ρ ^ n ≤ gaussNorm K ρ (coeff f) := by sorry

theorem exists_dominant {ρ : ℝ} (hρ : ρ ∈ I) {f : AnnulusRing K I} (hf : f ≠ 0) :
    {n : ℤ | ‖coeff f n‖ * ρ ^ n = gaussNorm K ρ (coeff f)}.Finite ∧
      {n : ℤ | ‖coeff f n‖ * ρ ^ n = gaussNorm K ρ (coeff f)}.Nonempty := by sorry

theorem gaussNorm_eq_powerSeries_gaussNorm {ρ : ℝ} (hρ : ρ ∈ I) (hpos : 0 < ρ)
    (f : PowerSeries K) (hf : (fun n : ℤ => if 0 ≤ n then PowerSeries.coeff n.toNat f else 0) ∈
      annulusCoeffs K I) :
    gaussNorm K ρ (fun n : ℤ => if 0 ≤ n then PowerSeries.coeff n.toNat f else 0) =
      PowerSeries.gaussNorm (fun x : K => ‖x‖) ρ f := by sorry

/-- Test `gaussNorm.test_one_add_T` (computation). -/
example {ρ : ℝ} (hρ : ρ ∈ I) (hpos : 0 < ρ) :
    gaussNorm K ρ (coeff (1 + T : AnnulusRing K I)) = max 1 ρ := by sorry

/-- Test `gaussNorm.test_constant` (degenerate). -/
example {ρ : ℝ} (hρ : ρ ∈ I) (hpos : 0 < ρ) (c : K) :
    gaussNorm K ρ (coeff (C c : AnnulusRing K I)) = ‖c‖ := by sorry

/-- Test `gaussNorm.test_not_pointwise` (non-example): the Gauss norm of `ϖ - T` at `ρ = ‖ϖ‖` is
positive although the series vanishes at `T = ϖ`. -/
example (ϖ : K) (hϖ : ϖ ≠ 0) (hρ : ‖ϖ‖ ∈ I) :
    gaussNorm K ‖ϖ‖ (coeff (C ϖ - T : AnnulusRing K I)) = ‖ϖ‖ := by sorry

/-- Test `gaussNorm.test_powerSeries` (compatibility). -/
example {ρ : ℝ} (hρ : 0 < ρ) (f : PowerSeries K) :
    gaussNorm K ρ (fun n : ℤ => if 0 ≤ n then PowerSeries.coeff n.toNat f else 0) =
      PowerSeries.gaussNorm (fun x : K => ‖x‖) ρ f := by sorry

/-! ## P7:annulus-foundations/frechet-topology -/

/-- The Fréchet uniform structure: the infimum over `ρ ∈ I` of the pseudometrics
`d_ρ(f, g) = |f - g|_ρ`. -/
instance instUniformSpace : UniformSpace (AnnulusRing K I) :=
  ⨅ ρ : I, UniformSpace.ofDist (fun f g : AnnulusRing K I => gaussNorm K ρ (coeff (f - g)))
    (by sorry) (by sorry) (by sorry)

instance instIsTopologicalRing : IsTopologicalRing (AnnulusRing K I) := by sorry

instance instCompleteSpace : CompleteSpace (AnnulusRing K I) := by sorry

instance instFirstCountableTopology : FirstCountableTopology (AnnulusRing K I) := by sorry

theorem tendsto_iff_gaussNorm (u : ℕ → AnnulusRing K I) (f : AnnulusRing K I) :
    Tendsto u atTop (𝓝 f) ↔
      ∀ ρ ∈ I, Tendsto (fun k => gaussNorm K ρ (coeff (u k - f))) atTop (𝓝 0) := by sorry

theorem hasSum_monomial (f : AnnulusRing K I) :
    HasSum (fun n : ℤ => (⟨Pi.single n (coeff f n), by sorry⟩ : AnnulusRing K I)) f := by sorry

theorem denseRange_ofLaurentPolynomial :
    DenseRange (ofLaurentPolynomial : LaurentPolynomial K →ₐ[K] AnnulusRing K I) := by sorry

/-- For a compact interval `[a, b]`, the Banach norm `max(|f|_a, |f|_b) = sup_{ρ ∈ [a,b]} |f|_ρ`. -/
def supNorm (a b : ℝ) (f : AnnulusRing K (Set.Icc a b)) : ℝ :=
  max (gaussNorm K a (coeff f)) (gaussNorm K b (coeff f))

/-- Test `frechet.test_Tpow_not_tendsto` (non-example). -/
example : ¬ Tendsto (fun n : ℕ => (T : AnnulusRing K (Set.Ioo (1/2) 2)) ^ n) atTop (𝓝 0) := by
  sorry

/-- Test `frechet.test_partialSums` (computation). -/
example (g : AnnulusRing K (Set.Ioo 0 1)) (hg : coeff g = (geomCoeffs : ℤ → K)) :
    Tendsto (fun N : ℕ => ∑ k ∈ Finset.range N, (T : AnnulusRing K (Set.Ioo 0 1)) ^ k) atTop
      (𝓝 g) := by sorry

/-- Test `frechet.test_singleton_banach` (degenerate). -/
example (ρ : ℝ) (u : ℕ → AnnulusRing K {ρ}) (f : AnnulusRing K {ρ}) :
    Tendsto u atTop (𝓝 f) ↔ Tendsto (fun k => gaussNorm K ρ (coeff (u k - f))) atTop (𝓝 0) := by
  sorry

/-! ## P7:annulus-foundations/restriction-maps -/

/-- Restriction to a sub-annulus: the identity on coefficients. -/
def res {I J : Set ℝ} (h : I ⊆ J) : AnnulusRing K J →ₐ[K] AnnulusRing K I := by sorry

theorem coeff_res {I J : Set ℝ} (h : I ⊆ J) (f : AnnulusRing K J) : coeff (res h f) = coeff f := by
  sorry

theorem res_injective {I J : Set ℝ} (h : I ⊆ J) : Function.Injective (res (K := K) h) := by sorry

theorem continuous_res {I J : Set ℝ} (h : I ⊆ J) : Continuous (res (K := K) h) := by sorry

theorem denseRange_res {I J : Set ℝ} (h : I ⊆ J) : DenseRange (res (K := K) h) := by sorry

theorem res_id : res (K := K) (subset_refl I) = AlgHom.id K _ := by sorry

theorem res_comp {I J L : Set ℝ} (h₁ : I ⊆ J) (h₂ : J ⊆ L) :
    (res (K := K) h₁).comp (res h₂) = res (h₁.trans h₂) := by sorry

theorem gaussNorm_res {I J : Set ℝ} (h : I ⊆ J) {ρ : ℝ} (hρ : ρ ∈ I) (f : AnnulusRing K J) :
    gaussNorm K ρ (coeff (res h f)) = gaussNorm K ρ (coeff f) := by sorry

/-- Test `res.test_T` (computation). -/
example {J : Set ℝ} (h : I ⊆ J) : res (K := K) h T = T := by sorry

/-- Test `res.test_id` (degenerate). -/
example (f : AnnulusRing K I) : res (subset_refl I) f = f := by sorry

/-- Test `res.test_not_surjective` (non-example). -/
example : ¬ Function.Surjective
    (res (K := K) (Set.Ioo_subset_Ioo_right (by norm_num : (1 : ℝ) ≤ 2) : Set.Ioo (0 : ℝ) 1 ⊆ Set.Ioo 0 2)) := by
  sorry

/-! ## P7:annulus-foundations/evaluation-at-points -/

variable {L : Type*} [NontriviallyNormedField L] [NormedAlgebra K L] [CompleteSpace L]

/-- Evaluation `f(z) = ∑ aₙ (z - e)ⁿ` at a point `z` with `‖z - e‖ ∈ I`. -/
def eval (e z : L) (f : AnnulusRing K I) : L :=
  ∑' n : ℤ, algebraMap K L (coeff f n) * (z - e) ^ n

def evalAlgHom (e z : L) (hz : ‖z - e‖ ∈ I) : AnnulusRing K I →ₐ[K] L := by sorry

theorem eval_T (e z : L) (hz : ‖z - e‖ ∈ I) : eval e z (T : AnnulusRing K I) = z - e := by sorry

theorem eval_C (e z : L) (c : K) : eval e z (C c : AnnulusRing K I) = algebraMap K L c := by sorry

theorem norm_eval_le (e z : L) (hz : ‖z - e‖ ∈ I) (f : AnnulusRing K I) :
    ‖eval e z f‖ ≤ gaussNorm K ‖z - e‖ (coeff f) := by sorry

theorem eval_res {J : Set ℝ} (h : I ⊆ J) (e z : L) (hz : ‖z - e‖ ∈ I) (f : AnnulusRing K J) :
    eval e z (res h f) = eval e z f := by sorry

theorem eval_ofLaurentPolynomial (e z : L) (hz : z - e ≠ 0) (P : LaurentPolynomial K) :
    eval e z (ofLaurentPolynomial P : AnnulusRing K I) =
      LaurentPolynomial.eval₂ (algebraMap K L) (Units.mk0 (z - e) hz) P := by sorry

theorem continuous_eval (e z : L) (hz : ‖z - e‖ ∈ I) :
    Continuous (eval (I := I) e z : AnnulusRing K I → L) := by sorry

theorem eval_map {L' : Type*} [NontriviallyNormedField L'] [NormedAlgebra K L'] [CompleteSpace L']
    (τ : L →ₐ[K] L') (hτ : ∀ x, ‖τ x‖ = ‖x‖) (e z : L) (f : AnnulusRing K I) :
    τ (eval e z f) = eval (τ e) (τ z) f := by sorry

/-- Test `eval.test_geometric` (computation). -/
example (z : L) (hz : ‖z‖ ∈ Set.Ioo (0 : ℝ) 1) (g : AnnulusRing K (Set.Ioo 0 1))
    (hg : coeff g = (geomCoeffs : ℤ → K)) : eval 0 z g = (1 - z)⁻¹ := by sorry

/-- Test `eval.test_const` (degenerate). -/
example (e z : L) (c : K) : eval e z (C c : AnnulusRing K I) = algebraMap K L c := by sorry

/-- Test `eval.test_laurentPolynomial` (compatibility). -/
example (e z : L) (hz : z - e ≠ 0) (P : LaurentPolynomial K) :
    eval e z (ofLaurentPolynomial P : AnnulusRing K I) =
      LaurentPolynomial.eval₂ (algebraMap K L) (Units.mk0 (z - e) hz) P := by sorry

/-- Test `eval.test_outside` (non-example): at `z = 1` the geometric series does not converge. -/
example : ¬ Summable (fun n : ℕ => (1 : K) ^ n) := by sorry

end AnnulusRing

end PartA

/-! # Part A (continued). Named theorems on annulus rings -/

section PartA

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

namespace AnnulusRing

variable {I : Set ℝ}

/-! ## P7:annulus-foundations/gauss-norm-multiplicative -/

/-- Multiplicativity of the Gauss norms (Lazard 1962, Proposition 1). -/
theorem gaussNorm_mul {ρ : ℝ} (hρ : ρ ∈ I) (f g : AnnulusRing K I) :
    gaussNorm K ρ (coeff (f * g)) = gaussNorm K ρ (coeff f) * gaussNorm K ρ (coeff g) := by sorry

/-- `O_K(I)` is an integral domain when `I` is nonempty. -/
theorem isDomain (hI : I.Nonempty) (hpos : ∀ ρ ∈ I, 0 < ρ) : IsDomain (AnnulusRing K I) := by sorry

/-! ## P7:annulus-foundations/gauss-norm-maximum-principle -/

/-- Hadamard three circles: `|f|_{a^c b^{1-c}} ≤ |f|_a^c |f|_b^{1-c}`. -/
theorem gaussNorm_three_circles {a b c : ℝ} (ha : a ∈ I) (hb : b ∈ I) (hapos : 0 < a)
    (hbpos : 0 < b) (hc : c ∈ Set.Icc (0 : ℝ) 1) (f : AnnulusRing K I) :
    gaussNorm K (a ^ c * b ^ (1 - c)) (coeff f) ≤
      gaussNorm K a (coeff f) ^ c * gaussNorm K b (coeff f) ^ (1 - c) := by sorry

/-- Maximum principle on a closed subinterval. -/
theorem gaussNorm_le_max {a b ρ : ℝ} (hab : Set.Icc a b ⊆ I) (hρ : ρ ∈ Set.Icc a b)
    (f : AnnulusRing K I) :
    gaussNorm K ρ (coeff f) ≤ max (gaussNorm K a (coeff f)) (gaussNorm K b (coeff f)) := by sorry

theorem continuousOn_gaussNorm (f : AnnulusRing K I) :
    ContinuousOn (fun ρ => gaussNorm K ρ (coeff f)) I := by sorry

/-! ## P7:annulus-foundations/annulus-limit-comparison -/

/-- (a) Membership is tested on compact subintervals. -/
theorem annulusCoeffs_eq_iInf_Icc :
    annulusCoeffs K I = ⨅ (a : ℝ) (b : ℝ) (_ : Set.Icc a b ⊆ I), annulusCoeffs K (Set.Icc a b) := by
  sorry

/-- (b) Gluing: `O_K(I ∪ J) = O_K(I) ∩ O_K(J)` when `I ∩ J ≠ ∅`. -/
theorem annulusCoeffs_union {J : Set ℝ} (h : (I ∩ J).Nonempty) :
    annulusCoeffs K (I ∪ J) = annulusCoeffs K I ⊓ annulusCoeffs K J := by sorry

/-- (c) Laurent splitting for an inner piece `I` and an outer piece `J`. -/
theorem exists_laurent_split {J : Set ℝ} (hin : ∀ ρ ∈ I, ∃ σ ∈ I ∩ J, ρ ≤ σ)
    (hout : ∀ ρ ∈ J, ∃ σ ∈ I ∩ J, σ ≤ ρ) (a : ℤ → K) (ha : a ∈ annulusCoeffs K (I ∩ J)) :
    ∃ b ∈ annulusCoeffs K I, ∃ c ∈ annulusCoeffs K J, a = b + c := by sorry

/-! ## P7:annulus-foundations/gauss-norm-is-spectral-norm and identity-principle -/

variable {L : Type*} [NontriviallyNormedField L] [NormedAlgebra K L] [CompleteSpace L]
  [IsAlgClosed L]

/-- The Gauss norm is attained on the circle `‖z - e‖ = ρ` for `ρ ∈ I ∩ ‖Lˣ‖`. -/
theorem exists_eval_eq_gaussNorm (e : K) {ρ : ℝ} (hρ : ρ ∈ I) (hρL : ∃ c : L, ‖c‖ = ρ)
    (f : AnnulusRing K I) :
    ∃ z : L, ‖z - algebraMap K L e‖ = ρ ∧
      ‖eval (algebraMap K L e) z f‖ = gaussNorm K ρ (coeff f) := by sorry

/-- Identity principle: a Laurent series vanishing on the annulus is zero. -/
theorem eq_zero_of_eval_eq_zero (e : K) (hI : ∃ ρ ∈ I, ∃ c : L, ‖c‖ = ρ) (f : AnnulusRing K I)
    (hf : ∀ z : L, ‖z - algebraMap K L e‖ ∈ I → eval (algebraMap K L e) z f = 0) : f = 0 := by
  sorry

/-! ## P7:annulus-foundations/newton-polygon-breaks -/

/-- The break radii of a nonzero `f` in a compact subinterval are finitely many. -/
theorem finite_breaks {a b : ℝ} (hab : Set.Icc a b ⊆ I) {f : AnnulusRing K I} (hf : f ≠ 0) :
    {ρ ∈ Set.Icc a b | {n : ℤ | ‖coeff f n‖ * ρ ^ n = gaussNorm K ρ (coeff f)}.ncard ≥ 2}.Finite := by
  sorry

/-- On an open subinterval without break radii a nonzero `f` is a unit. -/
theorem isUnit_res_of_no_breaks {a b : ℝ} (hab : Set.Ioo a b ⊆ I) {f : AnnulusRing K I}
    (hf : f ≠ 0) (j : ℤ)
    (hj : ∀ ρ ∈ Set.Ioo a b, ∀ n ≠ j, ‖coeff f n‖ * ρ ^ n < ‖coeff f j‖ * ρ ^ j) :
    IsUnit (res hab f) := by sorry

/-- Every nonzero `f` is a unit on some nonempty open sub-annulus. -/
theorem exists_isUnit_res {a b : ℝ} (hab : Set.Ioo a b ⊆ I) (hlt : a < b) {f : AnnulusRing K I}
    (hf : f ≠ 0) : ∃ c d, a ≤ c ∧ c < d ∧ d ≤ b ∧ ∃ h : Set.Ioo c d ⊆ I, IsUnit (res h f) := by
  sorry

/-! ## P7:annulus-foundations/weierstrass-preparation-on-circles -/

/-- Weierstrass preparation on the circle `|T| = ρ` (Lazard 1962, Proposition 2). -/
theorem exists_weierstrass {ρ : ℝ} (hρ : ρ ∈ I) {f : AnnulusRing K I} (hf : f ≠ 0) :
    ∃ (P : Polynomial K) (g : AnnulusRing K {ρ}) (m : ℤ),
      P.coeff 0 = 1 ∧ IsUnit g ∧
      res (Set.singleton_subset_iff.mpr hρ) f =
        ((Tunit ^ m : (AnnulusRing K {ρ})ˣ) : AnnulusRing K {ρ}) *
          ofLaurentPolynomial (Polynomial.toLaurent P) * g := by sorry

/-! ## P7:annulus-foundations/annulus-factor-theorem -/

/-- If `f` vanishes at `α` (algebraic, `‖α‖ ∈ I`), the minimal polynomial of `α` divides `f`. -/
theorem minpoly_dvd_of_eval_eq_zero (α : L) (hα : IsIntegral K α) (hαI : ‖α‖ ∈ I)
    (f : AnnulusRing K I) (hf : eval 0 α f = 0) :
    (ofLaurentPolynomial (Polynomial.toLaurent (minpoly K α)) : AnnulusRing K I) ∣ f := by sorry

end AnnulusRing

/-! ## P7:annulus-foundations/coefficient-extension -/

namespace AnnulusRing

variable {I : Set ℝ} {L : Type*} [NontriviallyNormedField L] [IsUltrametricDist L] [CompleteSpace L]
  [NormedAlgebra K L] [FiniteDimensional K L]

/-- Coefficient extension along a finite extension: `L ⊗_K O_K(I) ≃ O_L(I)`. -/
def coefficientExtension : L ⊗[K] AnnulusRing K I ≃ₐ[L] AnnulusRing L I := by sorry

/-- Galois invariants of `O_L(I)` under coefficientwise action are `O_K(I)`. -/
theorem mem_range_of_galois_invariant [IsGalois K L] (f : AnnulusRing L I)
    (hf : ∀ σ : L ≃ₐ[K] L, (fun n => σ (coeff f n)) = coeff f) :
    ∃ g : AnnulusRing K I, (fun n => algebraMap K L (coeff g n)) = coeff f := by sorry

end AnnulusRing

-- AnnulusRing.completedBaseChange (P7:annulus-foundations/completed-base-change): not stated; needs
-- the completed tensor product of normed K-modules (Kedlaya–Liu Definition 2.1.10), absent from
-- Mathlib at the pinned commit. Statement: `L ⊗̂_K O_K([a,b]) ≅ O_L([a,b])` isometrically.

/-! ## P7:annulus-foundations/annulus-derivation -/

namespace AnnulusRing

variable {I : Set ℝ}

/-- The derivation `d/dT`, `∑ aₙ Tⁿ ↦ ∑ n aₙ Tⁿ⁻¹`. -/
def derivative : Derivation K (AnnulusRing K I) (AnnulusRing K I) := by sorry

/-- `𝒟 f` is `d f / dT` in the ring `O_K(I)` of the current section. -/
local notation "𝒟" => (derivative : Derivation K (AnnulusRing K I) (AnnulusRing K I))

theorem coeff_derivative (f : AnnulusRing K I) (n : ℤ) :
    coeff (𝒟 f) n = ((n + 1 : ℤ) : K) * coeff f (n + 1) := by sorry

theorem gaussNorm_derivative_le {ρ : ℝ} (hρ : ρ ∈ I) (hpos : 0 < ρ) (f : AnnulusRing K I) :
    gaussNorm K ρ (coeff (𝒟 f)) ≤ ρ⁻¹ * gaussNorm K ρ (coeff f) := by sorry

theorem derivative_res {J : Set ℝ} (h : I ⊆ J) (f : AnnulusRing K J) :
    𝒟 (res h f) = res h ((derivative : Derivation K (AnnulusRing K J) (AnnulusRing K J)) f) := by
  sorry

theorem continuous_derivative : Continuous (fun f : AnnulusRing K I => 𝒟 f) := by sorry

theorem derivative_eq_zero_iff [CharZero K] (f : AnnulusRing K I) :
    𝒟 f = 0 ↔ ∃ c : K, f = C c := by sorry

theorem coeff_neg_one_derivative (f : AnnulusRing K I) : coeff (𝒟 f) (-1) = 0 := by sorry

theorem hasDerivAt_eval {L : Type*} [NontriviallyNormedField L] [NormedAlgebra K L]
    [CompleteSpace L] (e z : L) (hz : ‖z - e‖ ∈ interior I) (f : AnnulusRing K I) :
    HasDerivAt (fun w => eval e w f) (eval e z (𝒟 f)) z := by sorry

/-- Test `derivative.test_T_zpow` (computation). -/
example (n : ℤ) : 𝒟 ((Tunit ^ n : (AnnulusRing K I)ˣ) : AnnulusRing K I) =
    (n : AnnulusRing K I) * ((Tunit ^ (n - 1) : (AnnulusRing K I)ˣ) : AnnulusRing K I) := by sorry

/-- Test `derivative.test_const` (degenerate). -/
example (c : K) : 𝒟 (C c : AnnulusRing K I) = 0 := by sorry

/-- Test `derivative.test_polynomial` (compatibility). -/
example (P : Polynomial K) :
    𝒟 (ofLaurentPolynomial (Polynomial.toLaurent P) : AnnulusRing K I) =
      ofLaurentPolynomial (Polynomial.toLaurent (Polynomial.derivative P)) := by sorry

/-- Test `derivative.test_Tinv_not_exact` (non-example). -/
example : ¬ ∃ f : AnnulusRing K I, 𝒟 f = Tinv := by sorry

end AnnulusRing

end PartA

/-! # Part A (continued). Robba, bounded Robba and Amice rings -/

section PartA

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-! ## P7:annulus-foundations/robba-ring -/

/-- Coefficient families of germs converging on some annulus `r < |T| < 1`. -/
def robbaCoeffs : Submodule K (ℤ → K) where
  carrier := {a | ∃ r < (1 : ℝ), a ∈ annulusCoeffs K (Set.Ioo r 1)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- The Robba ring `R_K`. -/
abbrev RobbaRing := ↥(robbaCoeffs K)

/-! ## P7:annulus-foundations/amice-ring -/

/-- Coefficient families of the Amice ring `E_K`: bounded and tending to `0` at `-∞`. -/
def amiceCoeffs : Submodule K (ℤ → K) where
  carrier := {a | BddAbove (Set.range fun n => ‖a n‖) ∧ Tendsto a atBot (𝓝 0)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- The Amice ring `E_K`. -/
abbrev AmiceRing := ↥(amiceCoeffs K)

namespace RobbaRing

variable {K}

def coeff (f : RobbaRing K) : ℤ → K := f

instance : Mul (RobbaRing K) := ⟨fun a b => ⟨(a : ℤ → K) ⋆ᵣ₊ (b : ℤ → K), by sorry⟩⟩

instance : One (RobbaRing K) := ⟨⟨Pi.single 0 1, by sorry⟩⟩

instance instCommRing : CommRing (RobbaRing K) :=
  { (inferInstance : AddCommGroup (RobbaRing K)) with
    mul_assoc := by sorry
    one_mul := by sorry
    mul_one := by sorry
    zero_mul := by sorry
    mul_zero := by sorry
    left_distrib := by sorry
    right_distrib := by sorry
    mul_comm := by sorry }

instance instAlgebra : Algebra K (RobbaRing K) := Algebra.ofModule (by sorry) (by sorry)

instance instIsDomain : IsDomain (RobbaRing K) := by sorry

/-- The injective map from functions on `r < |T| < 1` to germs. -/
def ofAnnulus (r : ℝ) (hr : r < 1) : AnnulusRing K (Set.Ioo r 1) →ₐ[K] RobbaRing K := by sorry

theorem ofAnnulus_injective (r : ℝ) (hr : r < 1) : Function.Injective (ofAnnulus (K := K) r hr) := by
  sorry

theorem mem_iff (a : ℤ → K) : a ∈ robbaCoeffs K ↔
    ∃ r < (1 : ℝ), ∀ ρ ∈ Set.Ioo r 1, Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0) := by
  sorry

/-- The LF topology: the locally convex inductive limit of the Fréchet topologies of the
`O_K((r,1))` (Kedlaya–Liu Definition 4.1.3(c)). Mathlib has no locally convex inductive limit,
so the topology is a placeholder specified by `tendsto_iff`. -/
@[instance_reducible] def lfTopology : TopologicalSpace (RobbaRing K) := by sorry

theorem tendsto_iff (u : ℕ → RobbaRing K) (f : RobbaRing K) :
    Tendsto u atTop (@nhds _ lfTopology f) ↔
      ∃ r, ∃ hr : r < (1 : ℝ), ∃ (v : ℕ → AnnulusRing K (Set.Ioo r 1)) (g : AnnulusRing K (Set.Ioo r 1)),
        (∀ k, ofAnnulus r hr (v k) = u k) ∧ ofAnnulus r hr g = f ∧ Tendsto v atTop (𝓝 g) := by
  sorry

def T : RobbaRing K := ⟨Pi.single 1 1, by sorry⟩

def Tinv : RobbaRing K := ⟨Pi.single (-1) 1, by sorry⟩

def C (c : K) : RobbaRing K := ⟨Pi.single 0 c, by sorry⟩

/-- Functions on the open unit disc (Berger's `B^+_rig`). -/
def openDisc : Subring (RobbaRing K) where
  carrier := {f | (∀ n < 0, coeff f n = 0) ∧ coeff f ∈ annulusCoeffs K (Set.Ioo 0 1)}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- The derivation `d/dT` on germs. -/
def derivative : Derivation K (RobbaRing K) (RobbaRing K) := by sorry

/-- Germs with finitely many negative coefficients. -/
def finitePrincipalPart : Subring (RobbaRing K) where
  carrier := {f | ∃ N : ℤ, ∀ n < N, coeff f n = 0}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- Compatibility with Mathlib's formal Laurent series. -/
def toLaurentSeries : finitePrincipalPart (K := K) →+* LaurentSeries K := by sorry

theorem toLaurentSeries_injective : Function.Injective (toLaurentSeries (K := K)) := by sorry

/-! ## P7:annulus-foundations/bounded-robba-ring -/

/-- `R^bd`: germs with bounded coefficients. -/
def bounded : Subring (RobbaRing K) where
  carrier := {f | BddAbove (Set.range fun n => ‖coeff f n‖)}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- `R^int`: germs with coefficients in `O_K`. -/
def integral : Subring (RobbaRing K) where
  carrier := {f | ∀ n, ‖coeff f n‖ ≤ 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

theorem integral_le_bounded : integral (K := K) ≤ bounded := by sorry

theorem bounded_eq_localization (ϖ : K) (h0 : 0 < ‖ϖ‖) (h1 : ‖ϖ‖ < 1) (f : RobbaRing K)
    (hf : f ∈ bounded) : ∃ m : ℕ, C (ϖ ^ m) * f ∈ integral := by sorry

theorem mem_bounded_iff (f : RobbaRing K) :
    f ∈ bounded ↔ ∃ r < (1 : ℝ), BddAbove ((fun ρ => gaussNorm K ρ (coeff f)) '' Set.Ioo r 1) := by
  sorry

/-- The Gauss norm `|f|_1 = sup_n ‖aₙ‖`, multiplicative on `R^bd`. -/
def gaussNormOne (f : RobbaRing K) : ℝ := ⨆ n : ℤ, ‖coeff f n‖

theorem gaussNormOne_mul (f g : RobbaRing K) (hf : f ∈ bounded) (hg : g ∈ bounded) :
    gaussNormOne (f * g) = gaussNormOne f * gaussNormOne g := by sorry

theorem bounded_eq_inf_amice (a : ℤ → K) :
    (a ∈ robbaCoeffs K ∧ BddAbove (Set.range fun n => ‖a n‖)) ↔
      (a ∈ robbaCoeffs K ∧ a ∈ amiceCoeffs K) := by sorry

/-- The coefficients of `log (1 + T)`. -/
def logCoeffs [CharZero K] : ℤ → K := fun n => if 0 < n then (-1) ^ (n.toNat + 1) / (n : K) else 0

open Classical in
/-- The family `a_{-p^k} = p^k`, zero elsewhere (an element of `O_E` not in `R`). -/
def amiceWitness (p : ℕ) : ℤ → K :=
  fun n => if h : ∃ k : ℕ, n = -((p : ℤ) ^ k) then (p : K) ^ Nat.log p (-n).toNat else 0

/-- Test `robba.test_log_mem` (computation). -/
example [CharZero K] : logCoeffs (K := K) ∈ robbaCoeffs K := by sorry

/-- Test `robba.test_one_sub_T_unit` (computation). -/
example : IsUnit (1 - T : RobbaRing K) := by sorry

/-- Test `robba.test_const` (degenerate). -/
example : Function.Injective (C : K → RobbaRing K) := by sorry

/-- Test `robba.test_amice_not_mem` (non-example). -/
example (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ < 1) : amiceWitness (K := K) p ∉ robbaCoeffs K := by
  sorry

/-- Test `robba.test_laurentSeries` (compatibility). -/
example : Function.Injective (toLaurentSeries (K := K)) := by sorry

/-- Test `bounded.test_log_not_mem` (non-example). The stage's acceptance: an element of `R`
not in `R^bd`. -/
example [CharZero K] (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ < 1) :
    ¬ BddAbove (Set.range fun n => ‖logCoeffs (K := K) n‖) := by sorry

/-- Test `bounded.test_Tinv_mem` (computation). -/
example : Tinv ∈ integral (K := K) := by sorry

/-- Test `bounded.test_gaussNormOne` (computation). -/
example (ϖ : K) (h0 : 0 < ‖ϖ‖) (h1 : ‖ϖ‖ < 1) : gaussNormOne (C ϖ⁻¹ + T : RobbaRing K) = ‖ϖ‖⁻¹ := by
  sorry

/-- Test `bounded.test_const` (degenerate). -/
example (c : K) (hc : ‖c‖ ≤ 1) : C c ∈ integral (K := K) := by sorry

end RobbaRing

namespace AmiceRing

variable {K}

def coeff (f : AmiceRing K) : ℤ → K := f

instance : Mul (AmiceRing K) := ⟨fun a b => ⟨(a : ℤ → K) ⋆ᵣ₊ (b : ℤ → K), by sorry⟩⟩

instance : One (AmiceRing K) := ⟨⟨Pi.single 0 1, by sorry⟩⟩

instance instCommRing : CommRing (AmiceRing K) :=
  { (inferInstance : AddCommGroup (AmiceRing K)) with
    mul_assoc := by sorry
    one_mul := by sorry
    mul_one := by sorry
    zero_mul := by sorry
    mul_zero := by sorry
    left_distrib := by sorry
    right_distrib := by sorry
    mul_comm := by sorry }

instance instAlgebra : Algebra K (AmiceRing K) := Algebra.ofModule (by sorry) (by sorry)

def T : AmiceRing K := ⟨Pi.single 1 1, by sorry⟩

def Tinv : AmiceRing K := ⟨Pi.single (-1) 1, by sorry⟩

def C (c : K) : AmiceRing K := ⟨Pi.single 0 c, by sorry⟩

/-- `O_E`: families with values in `O_K`. -/
def integral : Subring (AmiceRing K) where
  carrier := {f | ∀ n, ‖coeff f n‖ ≤ 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- The multiplicative Gauss norm `|f|_1 = sup_n ‖aₙ‖`. -/
def gaussNormOne (f : AmiceRing K) : ℝ := ⨆ n : ℤ, ‖coeff f n‖

instance instUniformSpace : UniformSpace (AmiceRing K) :=
  UniformSpace.ofDist (fun f g => gaussNormOne (f - g)) (by sorry) (by sorry) (by sorry)

instance instCompleteSpace : CompleteSpace (AmiceRing K) := by sorry

/-- The weak (levelwise) topology on `O_E`: inverse limit over `m` of the `T`-adic topologies of
`O_E / ϖ^m`. Mathlib has no ready-made inverse-limit topology of this shape; placeholder. -/
@[instance_reducible] def weakTopology : TopologicalSpace (integral (K := K)) := by sorry

/-- Reduction `O_E → k((T))` to Laurent series over the residue field of `K`. -/
def reduction : integral (K := K) →+* LaurentSeries (Valued.ResidueField K) := by sorry

theorem reduction_surjective : Function.Surjective (reduction (K := K)) := by sorry

theorem dense_laurentSeries :
    Dense {f : AmiceRing K | ∃ N : ℤ, ∀ n < N, coeff f n = 0} := by sorry

/-- Test `amice.test_inverse` (computation): `(1 - T⁻¹)⁻¹ = -∑_{n ≥ 1} Tⁿ` in `O_E`. -/
example : ∃ g : AmiceRing K, coeff g = (fun n => if 1 ≤ n then -1 else 0) ∧ (1 - Tinv) * g = 1 := by
  sorry

/-- Test `amice.test_series_mem` (computation). -/
example (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ < 1) :
    RobbaRing.amiceWitness (K := K) p ∈ amiceCoeffs K := by sorry

/-- Test `amice.test_not_robba` (non-example). The stage's acceptance: an element of `E` not
in `R`. -/
example (p : ℕ) [Fact p.Prime] (hp : ‖(p : K)‖ < 1) :
    RobbaRing.amiceWitness (K := K) p ∈ amiceCoeffs K ∧
      RobbaRing.amiceWitness (K := K) p ∉ robbaCoeffs K := by sorry

/-- Test `amice.test_reduction` (compatibility). -/
example : ∃ hT : T ∈ integral (K := K), reduction ⟨T, hT⟩ = HahnSeries.single 1 1 := by sorry

/-- Test `amice.test_const` (degenerate). -/
example (c : K) : gaussNormOne (C c : AmiceRing K) = ‖c‖ := by sorry

/-! ## P7:annulus-foundations/amice-ring-complete-dvf -/

/-- For discretely valued `K`, `O_E` is a discrete valuation ring and `E` is its fraction field. -/
theorem integral_isDiscreteValuationRing
    (hdisc : ∃ ϖ : K, 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1 ∧ ∀ x : K, ‖x‖ < 1 → ‖x‖ ≤ ‖ϖ‖) :
    ∃ _ : IsDomain (integral (K := K)), IsDiscreteValuationRing (integral (K := K)) := by sorry

theorem isField_of_discrete
    (hdisc : ∃ ϖ : K, 0 < ‖ϖ‖ ∧ ‖ϖ‖ < 1 ∧ ∀ x : K, ‖x‖ < 1 → ‖x‖ ≤ ‖ϖ‖) :
    IsField (AmiceRing K) := by sorry

end AmiceRing

end PartA

/-! # Part A (continued). Cyclotomic coefficient rings over an unramified `F` -/

section PartA

variable (p : ℕ) [hp : Fact p.Prime]
variable (F : Type*) [NontriviallyNormedField F] [IsUltrametricDist F] [CompleteSpace F]
  [NormedAlgebra ℚ_[p] F] [CharZero F]

namespace CycRing

/-! ## P7:annulus-foundations/overconvergent-cyclotomic-rings -/

/-- `r_n = p^{n-1}(p-1)`; `|ζ_{p^n} - 1| = p^{-1/r_n}`. -/
def rn (n : ℕ) : ℝ := (p : ℝ) ^ ((n : ℤ) - 1) * ((p : ℝ) - 1)

/-- `B^{†,r}_{rig,F} = O_F([p^{-1/r}, 1))` in the variable `π`. -/
abbrev BrigR (r : ℝ) := AnnulusRing F (Set.Ico ((p : ℝ) ^ (-(1 / r))) 1)

/-- `B^†_{rig,F} = R_F`. -/
abbrev Brig := RobbaRing F

/-- `B^†_F = R^bd_F`. -/
def Bdag : Subring (RobbaRing F) := RobbaRing.bounded

/-- `A^+_F = O_F[[π]]`. -/
def Aplus : Subring (RobbaRing F) where
  carrier := {f | (∀ n < 0, RobbaRing.coeff f n = 0) ∧ ∀ n, ‖RobbaRing.coeff f n‖ ≤ 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- `B_F = E_F`, the Amice ring in `π`. -/
abbrev B := AmiceRing F

/-- `A_F = O_{E,F}`. -/
def A : Subring (AmiceRing F) := AmiceRing.integral

/-- `A^{†,r}_F`: elements bounded by `1` on `C[r;1[`. -/
def AdagR (r : ℝ) : Subring (BrigR p F r) where
  carrier := {f | ∀ ρ ∈ Set.Ico ((p : ℝ) ^ (-(1 / r))) 1, gaussNorm F ρ (AnnulusRing.coeff f) ≤ 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- `B^+_{rig,F}`: functions on the open unit disc. -/
def BrigPlus : Subring (RobbaRing F) := RobbaRing.openDisc

theorem BrigR_mono {r s : ℝ} (hr : 0 < r) (hrs : r ≤ s) :
    annulusCoeffs F (Set.Ico ((p : ℝ) ^ (-(1 / r))) 1) ≤
      annulusCoeffs F (Set.Ico ((p : ℝ) ^ (-(1 / s))) 1) := by sorry

theorem Bdag_eq_Brig_inf_B (a : ℤ → F) :
    (a ∈ robbaCoeffs F ∧ BddAbove (Set.range fun n => ‖a n‖)) ↔
      (a ∈ robbaCoeffs F ∧ a ∈ amiceCoeffs F) := by sorry

theorem pi_isUnit_BrigR {r : ℝ} (hr : 0 < r) : IsUnit (AnnulusRing.T : BrigR p F r) := by sorry

/-- Test `cyc.test_pi_unit` (computation). -/
example : ¬ IsUnit (⟨RobbaRing.T, by sorry⟩ : Aplus F) := by sorry

/-- Test `cyc.test_Adag_ne_union` (non-example). -/
example {r : ℝ} (hr : 0 < r) : (AnnulusRing.Tinv : BrigR p F r) ∉ AdagR p F r := by sorry

/-- Test `cyc.test_rn` (computation): `|ζ_{p^n} - 1| = p^{-1/r_n}`. -/
example (L : Type*) [NontriviallyNormedField L] [NormedAlgebra ℚ_[p] L] (n : ℕ) (hn : 1 ≤ n)
    (ζ : L) (hζ : IsPrimitiveRoot ζ (p ^ n)) : ‖ζ - 1‖ = (p : ℝ) ^ (-(1 / rn p n)) := by sorry

/-- Test `cyc.test_Qp` (degenerate). -/
example : Brig ℚ_[p] = RobbaRing ℚ_[p] := rfl

/-! ## P7:annulus-foundations/cyclotomic-frobenius -/

variable {F}

/-- The Frobenius `φ`, `σ`-semilinear with `φ(π) = (1 + π)^p - 1`. -/
def phi (p : ℕ) [Fact p.Prime] (σ : F ≃+* F) : RobbaRing F →+* RobbaRing F := by sorry

/-- The same Frobenius on the Amice ring `B_F`. -/
def phiAmice (p : ℕ) [Fact p.Prime] (σ : F ≃+* F) : AmiceRing F →+* AmiceRing F := by sorry

theorem phi_pi (σ : F ≃+* F) : phi p σ RobbaRing.T = (1 + RobbaRing.T) ^ p - 1 := by sorry

theorem phi_C (σ : F ≃+* F) (a : F) : phi p σ (RobbaRing.C a) = RobbaRing.C (σ a) := by sorry

theorem phi_mapsTo_BrigR (σ : F ≃+* F) (hσ : ∀ x, ‖σ x‖ = ‖x‖) {r : ℝ}
    (hr : ((p : ℝ) - 1) / p < r) (f : RobbaRing F)
    (hf : RobbaRing.coeff f ∈ annulusCoeffs F (Set.Ico ((p : ℝ) ^ (-(1 / r))) 1)) :
    RobbaRing.coeff (phi p σ f) ∈ annulusCoeffs F (Set.Ico ((p : ℝ) ^ (-(1 / (p * r)))) 1) := by
  sorry

theorem gaussNorm_phi (σ : F ≃+* F) (hσ : ∀ x, ‖σ x‖ = ‖x‖) {ρ : ℝ}
    (hρ : ρ ∈ Set.Ioo ((p : ℝ) ^ (-(1 / ((p : ℝ) - 1)))) 1) (f : RobbaRing F)
    (hf : RobbaRing.coeff f ∈ annulusCoeffs F (Set.Ico (ρ ^ p) 1)) :
    gaussNorm F ρ (RobbaRing.coeff (phi p σ f)) = gaussNorm F (ρ ^ p) (RobbaRing.coeff f) := by sorry

theorem phi_mapsTo (σ : F ≃+* F) :
    Set.MapsTo (phi p σ) (Bdag F : Set (RobbaRing F)) (Bdag F : Set (RobbaRing F)) ∧ Set.MapsTo (phi p σ) (Aplus F : Set (RobbaRing F)) (Aplus F : Set (RobbaRing F)) ∧
      Set.MapsTo (phi p σ) (BrigPlus F : Set (RobbaRing F)) (BrigPlus F : Set (RobbaRing F)) ∧
      Set.MapsTo (phi p σ) ((RobbaRing.integral : Subring (RobbaRing F)) : Set (RobbaRing F))
        ((RobbaRing.integral : Subring (RobbaRing F)) : Set (RobbaRing F)) := by sorry

theorem phi_injective (σ : F ≃+* F) : Function.Injective (phi p σ) := by sorry

theorem continuous_phi (σ : F ≃+* F) :
    @Continuous _ _ RobbaRing.lfTopology RobbaRing.lfTopology (phi p σ) := by sorry

theorem phi_sub_pow_mem (σ : F ≃+* F) :
    ∃ h ∈ Aplus F, phi p σ RobbaRing.T - RobbaRing.T ^ p = RobbaRing.C (p : F) * h := by sorry

theorem phi_basis (σ : F ≃+* F) (x : AmiceRing F) (hx : x ∈ A F) :
    ∃! y : Fin p → A F,
      x = ∑ i : Fin p, (1 + AmiceRing.T) ^ (i : ℕ) * phiAmice p σ (y i : AmiceRing F) := by sorry

/-- Test `phi.test_p2` (computation). -/
example (σ : F ≃+* F) (h2 : p = 2) :
    phi p σ RobbaRing.T = RobbaRing.T ^ 2 + RobbaRing.C 2 * RobbaRing.T := by sorry

/-- Test `phi.test_q` (computation). -/
example (σ : F ≃+* F) : ∃ q ∈ Aplus F, phi p σ RobbaRing.T = RobbaRing.T * q ∧
    RobbaRing.coeff q 0 = (p : F) := by sorry

/-- Test `phi.test_frobeniusLift` (compatibility): modulo `p`, `φ` is `x ↦ x^p` on `k((π))`. -/
example (σ : F ≃+* F) (x : AmiceRing F) (hx : x ∈ AmiceRing.integral) (hφ : phiAmice p σ x ∈ AmiceRing.integral) :
    AmiceRing.reduction ⟨phiAmice p σ x, hφ⟩ = (AmiceRing.reduction ⟨x, hx⟩) ^ p := by sorry

/-- Test `phi.test_not_surjective` (non-example). -/
example (σ : F ≃+* F) : AmiceRing.T ∉ Set.range (phiAmice p σ) := by sorry

/-- Test `phi.test_one` (degenerate). -/
example (σ : F ≃+* F) (hσ : ∀ q : ℚ_[p], σ (algebraMap ℚ_[p] F q) = algebraMap ℚ_[p] F q) :
    phi p σ 1 = 1 ∧ phi p σ (RobbaRing.C (p : F)) = RobbaRing.C (p : F) := by sorry

/-! ## P7:annulus-foundations/cyclotomic-gamma-action -/

/-- The `p`-adic binomial coefficient `binom(a, n) = a(a-1)⋯(a-n+1)/n!`, computed in `ℚ_p`. -/
def padicBinom (a : ℤ_[p]) (n : ℕ) : ℚ_[p] :=
  (descPochhammer ℚ_[p] n).eval (a : ℚ_[p]) / (n.factorial : ℚ_[p])

theorem padicBinom_mem_padicInt (a : ℤ_[p]) (n : ℕ) : ‖padicBinom p a n‖ ≤ 1 := by sorry

/-- `γ_a`, the `F`-linear automorphism with `γ_a(π) = (1 + π)^a - 1`. -/
def gammaAct (a : ℤ_[p]ˣ) : RobbaRing F ≃+* RobbaRing F := by sorry

theorem gammaAct_pi (a : ℤ_[p]ˣ) :
    RobbaRing.coeff (gammaAct p a RobbaRing.T) =
      fun n => if 1 ≤ n then algebraMap ℚ_[p] F (padicBinom p (a : ℤ_[p]) n.toNat) else 0 := by sorry

theorem gammaAct_C (a : ℤ_[p]ˣ) (c : F) : gammaAct p a (RobbaRing.C c) = RobbaRing.C c := by sorry

theorem gammaAct_one : gammaAct (F := F) p 1 = RingEquiv.refl _ := by sorry

theorem gammaAct_mul (a b : ℤ_[p]ˣ) (f : RobbaRing F) :
    gammaAct p (a * b) f = gammaAct p a (gammaAct p b f) := by sorry

theorem gaussNorm_gammaAct (a : ℤ_[p]ˣ) {ρ : ℝ} (hρ : ρ ∈ Set.Ioo (0 : ℝ) 1) (f : RobbaRing F)
    (hf : RobbaRing.coeff f ∈ annulusCoeffs F (Set.Ico ρ 1)) :
    gaussNorm F ρ (RobbaRing.coeff (gammaAct p a f)) = gaussNorm F ρ (RobbaRing.coeff f) := by sorry

theorem gammaAct_mapsTo (a : ℤ_[p]ˣ) :
    Set.MapsTo (gammaAct p a) (Bdag F : Set (RobbaRing F)) (Bdag F : Set (RobbaRing F)) ∧ Set.MapsTo (gammaAct p a) (Aplus F : Set (RobbaRing F)) (Aplus F : Set (RobbaRing F)) ∧
      Set.MapsTo (gammaAct p a) (BrigPlus F : Set (RobbaRing F)) (BrigPlus F : Set (RobbaRing F)) := by sorry

theorem gammaAct_phi (σ : F ≃+* F) (a : ℤ_[p]ˣ) (f : RobbaRing F) :
    gammaAct p a (phi p σ f) = phi p σ (gammaAct p a f) := by sorry

theorem continuous_gammaAct (f : RobbaRing F) :
    @Continuous _ _ _ RobbaRing.lfTopology (fun a : ℤ_[p]ˣ => gammaAct p a f) := by sorry

/-- The Galois action through the cyclotomic character. -/
def galoisAct (L : Type*) [CommRing L] [IsDomain L] (g : L ≃+* L) : RobbaRing F ≃+* RobbaRing F :=
  gammaAct p (cyclotomicCharacter L p g)

/-- Test `gamma.test_minus_one` (computation). -/
example : gammaAct (F := F) p (-1) RobbaRing.T * (1 + RobbaRing.T) = -RobbaRing.T := by sorry

/-- Test `gamma.test_linear_term` (computation). -/
example (a : ℤ_[p]ˣ) :
    RobbaRing.coeff (gammaAct (F := F) p a RobbaRing.T) 1 = algebraMap ℚ_[p] F ((a : ℤ_[p]) : ℚ_[p]) := by
  sorry

/-- Test `gamma.test_one` (degenerate). -/
example (f : RobbaRing F) : gammaAct p 1 f = f := by sorry

/-- Test `gamma.test_cyclotomicCharacter` (compatibility). -/
example (L : Type*) [CommRing L] [IsDomain L] (g : L ≃+* L) :
    galoisAct (F := F) p L g = gammaAct p (cyclotomicCharacter L p g) := rfl

/-- Test `gamma.test_non_unit_exponent` (non-example): `π ↦ (1+π)^p - 1` (the exponent `a = p`,
not a unit) is not surjective on `A_F`. -/
example : ¬ Function.Surjective (phiAmice (F := F) p (RingEquiv.refl F)) := by sorry

/-! ## P7:annulus-foundations/cyclotomic-log-element-t -/

/-- `t = log(1 + π)`. -/
def tElt : RobbaRing F := ⟨RobbaRing.logCoeffs, by sorry⟩

/-- `t` as a function on the open unit disc. -/
def tDisc : AnnulusRing F (Set.Ioo 0 1) := ⟨RobbaRing.logCoeffs, by sorry⟩

theorem coeff_tElt : RobbaRing.coeff (tElt (F := F)) = RobbaRing.logCoeffs := by sorry

theorem tElt_mem_BrigPlus : tElt (F := F) ∈ BrigPlus F := by sorry

theorem tElt_not_mem_Bdag : tElt (F := F) ∉ Bdag F := by sorry

theorem phi_tElt (σ : F ≃+* F) (hσ : ∀ q : ℚ_[p], σ (algebraMap ℚ_[p] F q) = algebraMap ℚ_[p] F q) :
    phi p σ (tElt) = RobbaRing.C (p : F) * tElt := by sorry

theorem gammaAct_tElt (a : ℤ_[p]ˣ) :
    gammaAct p a (tElt (F := F)) = RobbaRing.C (algebraMap ℚ_[p] F ((a : ℤ_[p]) : ℚ_[p])) * tElt := by
  sorry

theorem tendsto_tElt :
    Tendsto (fun N : ℕ => AnnulusRing.C (((p : F) ^ N)⁻¹) *
      ((1 + AnnulusRing.T) ^ (p ^ N) - 1 : AnnulusRing F (Set.Ioo 0 1))) atTop (𝓝 tDisc) := by sorry

theorem tElt_zeros (L : Type*) [NontriviallyNormedField L] [NormedAlgebra F L] [CompleteSpace L]
    [IsAlgClosed L] (z : L) (hz : ‖z‖ ∈ Set.Ioo (0 : ℝ) 1) :
    AnnulusRing.eval 0 z (tDisc (F := F)) = 0 ↔ ∃ n : ℕ, (1 + z) ^ (p ^ n) = 1 := by sorry

/-- Test `t.test_coeff_valuation` (computation). -/
example (k : ℕ) : ‖RobbaRing.coeff (tElt (F := F)) ((p : ℤ) ^ k)‖ = (p : ℝ) ^ k := by sorry

/-- Test `t.test_unbounded` (non-example). -/
example : tElt (F := F) ∉ Bdag F := by sorry

/-- Test `t.test_phi` (computation). -/
example (σ : F ≃+* F) (hσ : ∀ q : ℚ_[p], σ (algebraMap ℚ_[p] F q) = algebraMap ℚ_[p] F q) :
    phi p σ (tElt) = RobbaRing.C (p : F) * tElt := by sorry

/-- Test `t.test_product` (compatibility): the telescoping identity behind
`t = π ∏ φ^{n-1}(q)/p`, with Mathlib's cyclotomic polynomials. -/
example (N : ℕ) : (Polynomial.X : Polynomial ℤ) *
    ∏ n ∈ Finset.Icc 1 N, (Polynomial.cyclotomic (p ^ n) ℤ).comp (Polynomial.X + 1) =
      (Polynomial.X + 1) ^ (p ^ N) - 1 := by sorry

/-- Test `t.test_zero_at_zero` (degenerate). -/
example : RobbaRing.coeff (tElt (F := F)) 0 = 0 ∧ RobbaRing.coeff (tElt (F := F)) 1 = 1 := by sorry

/-! ## P7:annulus-foundations/cyclotomic-derivation -/

/-- `∂ = (1 + π) d/dπ`. -/
def partialOp : Derivation F (RobbaRing F) (RobbaRing F) := by sorry

/-- `𝔡 f` is `∂ f` for `f ∈ B^†_{rig,F}`. -/
local notation "𝔡" => (partialOp : Derivation F (RobbaRing F) (RobbaRing F))

/-- `∇ = t ∂`, the infinitesimal generator of the `Γ`-action. -/
def nabla : Derivation F (RobbaRing F) (RobbaRing F) := (tElt (F := F)) • partialOp

theorem partial_pi : 𝔡 RobbaRing.T = 1 + (RobbaRing.T : RobbaRing F) := by sorry

theorem partial_tElt : 𝔡 (tElt (F := F)) = 1 := by sorry

theorem partial_phi (σ : F ≃+* F) (f : RobbaRing F) :
    𝔡 (phi p σ f) = RobbaRing.C (p : F) * phi p σ (𝔡 f) := by sorry

theorem partial_gammaAct (a : ℤ_[p]ˣ) (f : RobbaRing F) :
    𝔡 (gammaAct p a f) =
      RobbaRing.C (algebraMap ℚ_[p] F ((a : ℤ_[p]) : ℚ_[p])) * gammaAct p a (𝔡 f) := by sorry

theorem ker_partial (f : RobbaRing F) : 𝔡 f = 0 ↔ ∃ c : F, f = RobbaRing.C c := by sorry

theorem partial_range_sup (f : RobbaRing F) :
    ∃ g : RobbaRing F, ∃ c : F, f = 𝔡 g + RobbaRing.C c * (1 + RobbaRing.T) * RobbaRing.Tinv := by
  sorry

-- CycRing.tendsto_nabla: not stated; needs the p-adic logarithm log_p on 1 + pZ_p (absent from
-- Mathlib at the pinned commit). Statement: (γ_a f - f)/log_p(a) → ∇ f as a → 1.

theorem invariants_gammaAct (f : RobbaRing F) :
    (∀ a : ℤ_[p]ˣ, gammaAct p a f = f) ↔ ∃ c : F, f = RobbaRing.C c := by sorry

/-- Test `partial.test_pi` (computation). -/
example : 𝔡 RobbaRing.T = 1 + (RobbaRing.T : RobbaRing F) ∧
    𝔡 RobbaRing.Tinv = -(1 + RobbaRing.T) * RobbaRing.Tinv ^ 2 := by sorry

/-- Test `partial.test_t` (computation). -/
example : 𝔡 (tElt (F := F)) = 1 := by sorry

/-- Test `partial.test_const` (degenerate). -/
example (c : F) : 𝔡 (RobbaRing.C c) = 0 := by sorry

/-- Test `partial.test_derivative` (compatibility). -/
example (f : RobbaRing F) : 𝔡 f = (1 + RobbaRing.T) * (RobbaRing.derivative : Derivation F (RobbaRing F) (RobbaRing F)) f := by
  sorry

/-- Test `partial.test_log_class` (non-example). -/
example : (1 + RobbaRing.T) * RobbaRing.Tinv ∉ Set.range (fun f : RobbaRing F => 𝔡 f) := by sorry

/-! ## P7:annulus-foundations/localisation-at-roots-of-unity -/

variable (Fn : Type*) [NontriviallyNormedField Fn] [NormedAlgebra F Fn] [CompleteSpace Fn] [CharZero Fn]

/-- `θ_n(f) = (σ^{-n} f)(ζ_{p^n} - 1)` for `f ∈ B^{†,r}_{rig,F}`, `r ≤ r_n`. -/
def thetaN (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (r : ℝ) (hr : r ≤ rn p n) : BrigR p F r → Fn := by sorry

/-- `ι_n(f) = ∑_j p^{-nj} θ_n(∂^j f)/j! t^j`: Taylor expansion at `ζ_{p^n} - 1` in `t`. -/
def iotaN (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (r : ℝ) (hr : r ≤ rn p n) :
    BrigR p F r →+* PowerSeries Fn := by sorry

/-- `φ : B^{†,r}_{rig,F} → B^{†,pr}_{rig,F}` as a bundled map (from `phi_mapsTo_BrigR`). -/
def phiR (σ : F ≃+* F) (r : ℝ) : BrigR p F r →+* BrigR p F (p * r) := by sorry

/-- `γ_a` on `B^{†,r}_{rig,F}`. -/
def gammaActR (a : ℤ_[p]ˣ) (r : ℝ) : BrigR p F r ≃+* BrigR p F r := by sorry

theorem iotaN_ringHom (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (r : ℝ) (hr : r ≤ rn p n) (c : F) :
    iotaN p Fn σ n ζ r hr (AnnulusRing.C c) =
      PowerSeries.C (algebraMap F Fn ((σ.symm : F →+* F)^[n] c)) := by sorry

theorem iotaN_pi (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (hζ : IsPrimitiveRoot ζ (p ^ n)) (r : ℝ)
    (hr : r ≤ rn p n) :
    iotaN p Fn σ n ζ r hr AnnulusRing.T =
      PowerSeries.C ζ * PowerSeries.rescale (((p : Fn) ^ n)⁻¹) (PowerSeries.exp Fn) - 1 := by sorry

theorem iotaN_tElt (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (hζ : IsPrimitiveRoot ζ (p ^ n)) (r : ℝ)
    (hr : r ≤ rn p n) (tR : BrigR p F r) (htR : AnnulusRing.coeff tR = RobbaRing.logCoeffs) :
    iotaN p Fn σ n ζ r hr tR = PowerSeries.C (((p : Fn) ^ n)⁻¹) * PowerSeries.X := by sorry

theorem iotaN_phi (σ : F ≃+* F) (n : ℕ) (ζ' : Fn) (hζ' : IsPrimitiveRoot ζ' (p ^ (n + 1)))
    (r : ℝ) (hr : r ≤ rn p n) (hpr : p * r ≤ rn p (n + 1)) (f : BrigR p F r) :
    iotaN p Fn σ (n + 1) ζ' (p * r) hpr (phiR p σ r f) = iotaN p Fn σ n (ζ' ^ p) r hr f := by sorry

theorem iotaN_gammaAct (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (hζ : IsPrimitiveRoot ζ (p ^ n)) (r : ℝ)
    (hr : r ≤ rn p n) (a : ℤ_[p]ˣ) (m : ℕ) (hm : ((a : ℤ_[p]) - m) ∈ Ideal.span {(p : ℤ_[p]) ^ n})
    (τ : Fn ≃ₐ[F] Fn) (hτ : τ ζ = ζ ^ m) (f : BrigR p F r) :
    iotaN p Fn σ n ζ r hr (gammaActR p a r f) =
      PowerSeries.rescale (algebraMap F Fn (algebraMap ℚ_[p] F ((a : ℤ_[p]) : ℚ_[p])))
        (PowerSeries.map (τ : Fn →+* Fn) (iotaN p Fn σ n ζ r hr f)) := by sorry

theorem iotaN_injective (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (hζ : IsPrimitiveRoot ζ (p ^ n)) (r : ℝ)
    (hr : r ≤ rn p n) : Function.Injective (iotaN p Fn σ n ζ r hr) := by sorry

theorem ker_thetaN (σ : F ≃+* F) (n : ℕ) (hn : 1 ≤ n) (ζ : Fn) (hζ : IsPrimitiveRoot ζ (p ^ n))
    (r : ℝ) (hr : r ≤ rn p n) (f : BrigR p F r) :
    thetaN p Fn σ n ζ r hr f = 0 ↔
      ∃ g : BrigR p F r, f = AnnulusRing.ofLaurentPolynomial
        (Polynomial.toLaurent ((Polynomial.cyclotomic (p ^ n) F).comp (Polynomial.X + 1))) * g := by
  sorry

/-- Test `iota.test_t` (computation). -/
example (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (hζ : IsPrimitiveRoot ζ (p ^ n)) (r : ℝ) (hr : r ≤ rn p n)
    (tR : BrigR p F r) (htR : AnnulusRing.coeff tR = RobbaRing.logCoeffs) :
    iotaN p Fn σ n ζ r hr tR = PowerSeries.C (((p : Fn) ^ n)⁻¹) * PowerSeries.X := by sorry

/-- Test `iota.test_q` (computation). -/
example (σ : F ≃+* F) (n : ℕ) (hn : 1 ≤ n) (ζ : Fn) (hζ : IsPrimitiveRoot ζ (p ^ n)) (r : ℝ)
    (hr : r ≤ rn p n) :
    thetaN p Fn σ n ζ r hr (AnnulusRing.ofLaurentPolynomial
      (Polynomial.toLaurent ((Polynomial.cyclotomic (p ^ n) F).comp (Polynomial.X + 1)))) = 0 := by
  sorry

/-- Test `iota.test_phi` (compatibility): `(ζ' e^{t/p^{n+1}})^p - 1 = ζ'^p e^{t/p^n} - 1`. -/
example (n : ℕ) (ζ' : Fn) :
    (PowerSeries.C ζ' * PowerSeries.rescale (((p : Fn) ^ (n + 1))⁻¹) (PowerSeries.exp Fn)) ^ p - 1 =
      PowerSeries.C (ζ' ^ p) * PowerSeries.rescale (((p : Fn) ^ n)⁻¹) (PowerSeries.exp Fn) - 1 := by
  sorry

/-- Test `iota.test_const` (degenerate). -/
example (σ : F ≃+* F) (n : ℕ) (ζ : Fn) (r : ℝ) (hr : r ≤ rn p n) (c : F) :
    iotaN p Fn σ n ζ r hr (AnnulusRing.C c) =
      PowerSeries.C (algebraMap F Fn ((σ.symm : F →+* F)^[n] c)) := by sorry

/-- Test `iota.test_outside` (non-example): for `r > r_n`, `Φ_{p^n}(1 + π)` is a unit of
`B^{†,r}_{rig,F}` (so its inverse has a pole at `ζ_{p^n} - 1` and `ι_n` cannot be defined there). -/
example (n : ℕ) (hn : 1 ≤ n) (r : ℝ) (hr : rn p n < r) :
    IsUnit (AnnulusRing.ofLaurentPolynomial
      (Polynomial.toLaurent ((Polynomial.cyclotomic (p ^ n) F).comp (Polynomial.X + 1))) :
        BrigR p F r) := by sorry

/-! ## P7:annulus-foundations/cyclotomic-log-robba-ring -/

/-- `B^†_{log,F} = B^†_{rig,F}[ℓ]`, `ℓ = log π`. -/
abbrev LogRing := Polynomial (RobbaRing F)

/-- `φ(ℓ) = p ℓ + log(φ(π)/π^p)`. -/
def logPhi (p : ℕ) [Fact p.Prime] (σ : F ≃+* F) : LogRing (F := F) →+* LogRing (F := F) := by
  sorry

/-- `γ_a(ℓ) = ℓ + log(γ_a(π)/π)`. -/
def logGamma (a : ℤ_[p]ˣ) : LogRing (F := F) ≃+* LogRing (F := F) := by sorry

/-- The monodromy operator `N = -(p/(p-1)) d/dℓ` (Berger 2008, Appendix B normalisation). -/
def monodromyN : LogRing (F := F) →ₗ[RobbaRing F] LogRing (F := F) :=
  (algebraMap F (RobbaRing F) (-(p : F) / ((p : F) - 1))) • Polynomial.derivative

/-- `∂` extended by `∂ℓ = (1 + π)/π`. -/
def logPartial : Derivation F (LogRing (F := F)) (LogRing (F := F)) := by sorry

theorem monodromyN_phi (σ : F ≃+* F) (x : LogRing (F := F)) :
    monodromyN p (logPhi p σ x) = Polynomial.C (RobbaRing.C (p : F)) * logPhi p σ (monodromyN p x) := by
  sorry

theorem monodromyN_gamma (a : ℤ_[p]ˣ) (x : LogRing (F := F)) :
    monodromyN p (logGamma p a x) = logGamma p a (monodromyN p x) := by sorry

theorem ker_monodromyN (x : LogRing (F := F)) :
    monodromyN p x = 0 ↔ x ∈ Set.range (Polynomial.C : RobbaRing F → LogRing (F := F)) := by sorry

theorem logPartial_X :
    logPartial (F := F) Polynomial.X = Polynomial.C ((1 + RobbaRing.T) * RobbaRing.Tinv) := by sorry

/-- Test `log.test_N_phi` (computation). -/
example (σ : F ≃+* F) :
    monodromyN p (logPhi p σ Polynomial.X) =
      Polynomial.C (RobbaRing.C (p : F)) * logPhi p σ (monodromyN p (Polynomial.X : LogRing (F := F))) := by
  sorry

/-- Test `log.test_gamma_cocycle` (computation). -/
example (a b : ℤ_[p]ˣ) :
    logGamma (F := F) p (a * b) Polynomial.X = logGamma p a (logGamma p b Polynomial.X) := by sorry

/-- Test `log.test_ker_N` (degenerate). -/
example (f : RobbaRing F) : monodromyN p (Polynomial.C f) = 0 := by sorry

/-- Test `log.test_not_in_Brig` (non-example). -/
example : (1 + RobbaRing.T) * RobbaRing.Tinv ∉ Set.range (fun f : RobbaRing F => 𝔡 f) := by sorry

-- Test `log.test_kedlaya` (compatibility): not stated; needs
-- PadicDifferentialEquationsAndRigidCohomology:RD.2/log-robba-ring (R_log = R[log u]), not in the
-- pinned libraries. Statement: for u = π and q = p, φ(ℓ) = q ℓ + log(φ(u)/u^q) is its Frobenius.

end CycRing

end PartA

/-! # Part A (continued). Layer P7 — Robba analytic foundations and handoffs

The objects of this layer are built from other roadmaps' carriers (the field-of-norms rings of
PhiGammaModulesAndIwasawaCohomology:PG.0, the (φ,Γ)-modules of PG.1-PG.2, Wach modules of PG.6,
the period rings and functors of PadicHodgeTheory:R06.1-R06.2, the extended Robba ring of
PadicDifferentialEquationsAndRigidCohomology:RD.0), none of which exists in the pinned libraries.
Following the protocol, their API items, unit tests and named theorems are recorded as comments
`-- <name>: not stated; needs <missing object>` with the intended statement, except where a
statement only involves Mathlib objects. -/

section PartA

/-! ## P7/robba-ring-of-p-adic-field (construction) -/

-- RobbaK.BrigR: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent field-
--   of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (constructor): B^{dagger,r}_{rig,K}, the Frechet completion of B^{dagger,r}_K.
-- RobbaK.Brig: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent field-
--   of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (constructor): B^dagger_{rig,K} = union over r.
-- RobbaK.ofBdag: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent field-
--   of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (coercion): The dense injective map B^{dagger,r}_K -> B^{dagger,r}_{rig,K}.
-- RobbaK.ofBrigF: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent
--   field-of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (coercion): The inclusion B^dagger_{rig,F} -> B^dagger_{rig,K} compatible with phi, Gamma_K,
--   partial.
-- RobbaK.phi: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent field-of-
--   norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (constructor): phi : B^{dagger,r}_{rig,K} -> B^{dagger,pr}_{rig,K}, continuous extension.
-- RobbaK.gammaAct: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent
--   field-of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (constructor): The continuous Gamma_K-action, commuting with phi.
-- RobbaK.partialOp: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent
--   field-of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (constructor): The unique continuous derivation extending (1+pi) d/dpi.
-- RobbaK.ker_partial: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent
--   field-of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (characterisation): ker partial = F'.
-- RobbaK.tElt: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent field-
--   of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended (data): t
--   = log(1+pi) in B^dagger_{rig,K}, phi t = p t, gamma t = chi(gamma) t.
-- RobbaK.LogRing: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent
--   field-of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned libraries). Intended
--   (constructor): B^dagger_{log,K} = B^dagger_{rig,K}[l] with phi, Gamma_K, N, partial.
-- RobbaK.topology_indep: not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's
--   overconvergent field-of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned
--   libraries). Intended (other): The Frechet topology does not depend on the choice of pi_K.
-- Test `robbaK.test_unramified` (degenerate): not stated; needs
--   PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent field-of-norms rings B^{†,r}_K with
--   their φ and Γ_K (not in the pinned libraries). Intended: For K = F: B^dagger_{rig,K} =
--   B^dagger_{rig,F} of P7:annulus-foundations.
-- Test `robbaK.test_t` (computation): not stated; needs PhiGammaModulesAndIwasawaCohomology:PG.0's
--   overconvergent field-of-norms rings B^{†,r}_K with their φ and Γ_K (not in the pinned
--   libraries). Intended: t lies in B^dagger_{rig,K}, phi(t) = p t, gamma(t) = chi(gamma) t.
-- Test `robbaK.test_ker_partial` (computation): not stated; needs
--   PhiGammaModulesAndIwasawaCohomology:PG.0's overconvergent field-of-norms rings B^{†,r}_K with
--   their φ and Γ_K (not in the pinned libraries). Intended: The kernel of partial on
--   B^dagger_{rig,K} is F'.

/-- Test `robbaK.test_coefficients_Fprime` (non-example): the field-theoretic core of Berger's
example `F' ≠ F`. If `ζ` is a primitive `p`-th root of unity (`p` odd) and `s² = y · p*` with
`p* = (-1)^((p-1)/2) p`, then `y` is a square in the same field (via the quadratic Gauss sum), so
`K = ℚ_p(√(y p*))` has `√y ∈ K(ζ_p)` and `F' ⊋ F` when `y` is a non-square unit. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (L : Type*) [Field L] [CharZero L] (ζ : L)
    (hζ : IsPrimitiveRoot ζ p) (y s : L) (hs : s ^ 2 = y * ((-1) ^ ((p - 1) / 2) * (p : L))) :
    ∃ w : L, w ^ 2 = y := by sorry

/-! ## P7/extended-robba-ring-with-galois-action (construction) -/

-- ExtRobba.BrigR: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's extended
--   Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended
--   (constructor): B~^{dagger,r}_{rig}: RD.0's Gamma^{C^flat}_{an,1/r}.
-- ExtRobba.galoisAct: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's
--   extended Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended
--   (constructor): The continuous G_F-action by ring automorphisms.
-- ExtRobba.phi: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's extended
--   Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended
--   (constructor): The bijection phi : B~^{dagger,r}_{rig} -> B~^{dagger,pr}_{rig}.
-- ExtRobba.phi_galoisAct: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's
--   extended Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended
--   (relation): phi commutes with G_F.
-- ExtRobba.plus: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's extended
--   Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended
--   (constructor): B~^+_{rig} = intersection of phi^n(B^+_cris), a subring of B~^dagger_{rig}.
-- ExtRobba.ofBdagK: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's extended
--   Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended
--   (coercion): The embedding B^{dagger,r}_K -> (B~^{dagger,r}_{rig})^{H_K}.
-- ExtRobba.LogRing: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's extended
--   Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended
--   (constructor): B~^dagger_{log} = B~^dagger_{rig}[X] with phi(X) = pX, Galois action and N =
--   -(p/(p-1)) d/dX.
-- ExtRobba.logPi: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's extended
--   Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended (data):
--   log(pi) = X + log(pi/[epsilon - 1]) in B~^dagger_{log}.
-- ExtRobba.radius_dictionary: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.0's
--   extended Robba ring Γ^alg_an,con and R06.1's B^+_cris (not in the pinned libraries). Intended
--   (compatibility): Berger's B~^{dagger,r}_{rig} equals RD.0's Gamma^{C^flat}_{an,1/r} for
--   v(epsilon - 1) = 1.
-- Test `extRobba.test_t` (computation): not stated; needs
--   PadicDifferentialEquationsAndRigidCohomology:RD.0's extended Robba ring Γ^alg_an,con and
--   R06.1's B^+_cris (not in the pinned libraries). Intended: t = log[epsilon] lies in B~^+_{rig},
--   with phi(t) = p t and g(t) = chi(g) t.
-- Test `extRobba.test_pi` (computation): not stated; needs
--   PadicDifferentialEquationsAndRigidCohomology:RD.0's extended Robba ring Γ^alg_an,con and
--   R06.1's B^+_cris (not in the pinned libraries). Intended: pi = [epsilon] - 1 lies in
--   B~^{dagger,r}_{rig} and is a unit there.
-- Test `extRobba.test_phi_bijective` (non-example): not stated; needs
--   PadicDifferentialEquationsAndRigidCohomology:RD.0's extended Robba ring Γ^alg_an,con and
--   R06.1's B^+_cris (not in the pinned libraries). Intended: phi is bijective on B~^dagger_{rig}
--   but not on B^dagger_{rig,F} (pi is not in phi(B^dagger_{rig,F})).
-- Test `extRobba.test_invariants` (degenerate): not stated; needs
--   PadicDifferentialEquationsAndRigidCohomology:RD.0's extended Robba ring Γ^alg_an,con and
--   R06.1's B^+_cris (not in the pinned libraries). Intended: The G_F-invariants of B~^+_{rig} are
--   F.

/-! ## P7/berger-robba-identification (theorem) -/

-- Named result P7.bergerRobbaIdentification (theorem): not stated; needs the rings of PG.0/RD.0,
--   the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from
--   the pinned libraries). Statement: Assume the hypotheses, and let r >= r(K) and alpha(K,r) =
--   p^{-1/(e_K r)}. (a) f |-> f(pi_K) is an isomorphism of topological rings O_{F'}([alpha(K,r),
--   1)) -> B^{dagger,r}_{rig,K}, restricting to an isomorphism from the bounded elements onto
--   B^{dagger,r}_K; hence R_{F'} = B^dagger_{rig,K}, R^bd_{F'} = B^dagger_K and R^int_{F'} =
--   A^dagger_K := A_K cap B^dagger_K, in the variable pi_K. (b) Under (a), phi is a Frobenius lift
--   of the Robba ring R_{F'} in the sense of
--   PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring: sigma-
--   semilinear on F', phi(pi_K) in R^int_{F'} and phi(pi_K) - pi_K^p in p R^int_{F'} (q = p);
--   Gamma_K acts by continuous automorphisms, semilinear over F' through Gamma_K -> Gal(F'/F);
--   partial(pi_K) is a unit of B^{dagger,r}_K for r large and partial = partial(pi_K) d/dpi_K, with
--   kernel F'. (c) The Frechet topology on B^{dagger,r}_K from (a) coincides with the topology
--   induced by B~^{dagger,r}_{rig} (P7/extended-robba-ring-with-galois-action), so
--   B^{dagger,r}_{rig,K} is Berger's completion and B^dagger_{rig,K} embeds continuously and
--   equivariantly in (B~^dagger_{rig})^{H_K}.

/-! ## P7/robba-ring-tensor-identity (lemma) -/

-- Named result P7.robbaRingTensorIdentity (lemma): not stated; needs the rings of PG.0/RD.0, the
--   period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from the
--   pinned libraries). Statement: For r large, the multiplication map B^{dagger,r}_{rig,F} tensor
--   over B^{dagger,r}_F of B^{dagger,r}_K -> B^{dagger,r}_{rig,K} is an isomorphism of topological
--   rings, compatible with phi and Gamma_K; hence B^dagger_{rig,K} = B^dagger_{rig,F} tensor over
--   B^dagger_F of B^dagger_K, a free B^dagger_{rig,F}-module of rank [K_infinity : F_infinity], and
--   B^dagger_{log,K} = B^dagger_{log,F} tensor over B^dagger_F of B^dagger_K.

/-! ## P7/nabla-operator-on-robba-ring (construction) -/

-- RobbaK.nabla: not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action and the p-adic logarithm
--   (absent from Mathlib). Intended (constructor): nabla = log(gamma)/log_p chi(gamma), a
--   continuous derivation of B^{dagger,r}_{rig,K}.
-- RobbaK.nabla_indep: not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action and the p-adic
--   logarithm (absent from Mathlib). Intended (characterisation): nabla does not depend on gamma.
-- RobbaK.nabla_eq_t_mul_partial: not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action and the
--   p-adic logarithm (absent from Mathlib). Intended (relation): nabla = t partial.
-- RobbaK.nabla_phi: not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action and the p-adic
--   logarithm (absent from Mathlib). Intended (relation): nabla commutes with phi and Gamma_K.
-- RobbaK.nablaDivOneSubGamma: not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action and the
--   p-adic logarithm (absent from Mathlib). Intended (constructor): The continuous operator
--   nabla/(1 - gamma_K).
-- RobbaK.partial_surjective: not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action and the
--   p-adic logarithm (absent from Mathlib). Intended (characterisation): partial maps
--   B^dagger_{rig,K} + F' log pi_K onto B^dagger_{rig,K} and B^dagger_{log,K} onto itself.
-- RobbaK.norm_one_sub_gamma: not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action and the
--   p-adic logarithm (absent from Mathlib). Intended (relation): V_I((1 - gamma) x) >= V_I(x) + 1
--   for gamma close to 1.
-- Test `nabla.test_t` (computation): not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action and
--   the p-adic logarithm (absent from Mathlib). Intended: nabla(t) = t.
-- Test `nabla.test_unramified` (compatibility): not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-
--   action and the p-adic logarithm (absent from Mathlib). Intended: For K = F, nabla = t (1+pi)
--   d/dpi (P7:annulus-foundations/cyclotomic-derivation).
-- Test `nabla.test_const` (degenerate): not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-action
--   and the p-adic logarithm (absent from Mathlib). Intended: nabla vanishes on F'.
-- Test `nabla.test_log_class` (non-example): not stated; needs B^†_{rig,K} of PG.0 with its Γ_K-
--   action and the p-adic logarithm (absent from Mathlib). Intended: partial(log pi_K) =
--   partial(pi_K)/pi_K is not partial of an element of B^dagger_{rig,K}: log pi_K must be adjoined.

/-! ## P7/localisation-maps-p-adic-field (construction) -/

-- RobbaK.iotaN: not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine element t in B_dR^+
--   with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois action). Intended
--   (constructor): iota_n : B^{dagger,r}_{rig,K} ->+* K_n[[t]] for n >= n(r).
-- RobbaK.iotaN_injective: not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine element t
--   in B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois action).
--   Intended (characterisation): iota_n is injective.
-- RobbaK.iotaN_phi: not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine element t in
--   B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois action). Intended
--   (relation): iota_{n+1} o phi = iota_n.
-- RobbaK.iotaN_gamma: not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine element t in
--   B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois action). Intended
--   (relation): iota_n commutes with Gamma_K.
-- RobbaK.iotaN_tElt: not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine element t in
--   B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois action). Intended
--   (simp): iota_n t = t/p^n.
-- RobbaK.iotaN_toBdR: not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine element t in
--   B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois action). Intended
--   (compatibility): Composed with K_n[[t]] -> B_dR^+ (t |-> Fontaine t), iota_n = phi^{-n} on
--   B^{dagger,r_n}_K.
-- RobbaK.ker_theta_iotaN: not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine element t
--   in B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois action).
--   Intended (characterisation): ker(theta o iota_n) = phi^{n-1}(q) B^{dagger,r}_{rig,K}.
-- RobbaK.quotient_eq_Kn: not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine element t in
--   B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois action). Intended
--   (characterisation): For n large, B^{dagger,r}_{rig,K}/phi^{n-1}(q) = K_n via theta o iota_n.
-- Test `iotaK.test_t` (computation): not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's Fontaine
--   element t in B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the Galois
--   action). Intended: iota_n(t) = t/p^n.
-- Test `iotaK.test_unramified` (compatibility): not stated; needs B^{†,r}_{rig,K} (PG.0) and
--   R06.1's Fontaine element t in B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or
--   the Galois action). Intended: For K = F, iota_n is P7:annulus-foundations/localisation-at-
--   roots-of-unity followed by F_n[[t]] -> B_dR^+.
-- Test `iotaK.test_const` (degenerate): not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's
--   Fontaine element t in B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the
--   Galois action). Intended: iota_n on F' is sigma^{-n} followed by the inclusion F' -> K_n.
-- Test `iotaK.test_outside` (non-example): not stated; needs B^{†,r}_{rig,K} (PG.0) and R06.1's
--   Fontaine element t in B_dR^+ with its G_K-action (Mathlib has BDeRhamPlus but not t or the
--   Galois action). Intended: For n < n(r), iota_n is not defined on B^{dagger,r}_{rig,K}:
--   1/phi^{n-1}(q) lies in B^{dagger,r}_{rig,F} for r > r_n.

/-! ## P7/t-divisibility-criterion (lemma) -/

-- Named result P7.tDivisibilityCriterion (lemma): not stated; needs the rings of PG.0/RD.0, the
--   period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from the
--   pinned libraries). Statement: Let x in B^{dagger,r}_{rig,K} be such that x lies in phi^{n-1}(q)
--   B^{dagger,r_n}_{rig,K} for all n large. Then x lies in t B^dagger_{rig,K}. The same holds for a
--   finite free B^dagger_{rig,K}-module M with a basis, coefficientwise; in particular for M =
--   D^{dagger}_rig(V).

/-! ## P7/extended-robba-plus-decomposition (lemma) -/

-- Named result P7.extendedRobbaPlusDecomposition (lemma): not stated; needs the rings of PG.0/RD.0,
--   the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from
--   the pinned libraries). Statement: (a) For r > 0 the sequence 0 -> B~^+ -> B~^{dagger,r} (+)
--   B~^+_{rig} -> B~^{dagger,r}_{rig} -> 0, with B~^+ = W(O_C^flat)[1/p], x |-> (x, -x) and (a, b)
--   |-> a + b, is exact: every element of B~^{dagger,r}_{rig} is a bounded element plus an element
--   of B~^+_{rig}. (b) Taking H_K-invariants keeps it exact: 0 -> B~^+_K -> B~^{dagger,r}_K (+)
--   (B~^+_{rig})^{H_K} -> B~^{dagger,r}_{rig,K} -> 0, where B~^{dagger,r}_{rig,K} =
--   (B~^{dagger,r}_{rig})^{H_K}. (c) Every x in (B^+_max)^{H_K} is sum_{i>=0} a_i (omega/p)^i with
--   a_i in B~^+_K tending to 0, omega a generator of ker theta. (d) B~^{dagger,r}_K is dense in
--   B~^{dagger,r}_{rig,K}.

/-! ## P7/frobenius-regularisation (lemma) -/

-- Named result P7.frobeniusRegularisation (lemma): not stated; needs the rings of PG.0/RD.0, the
--   period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from the
--   pinned libraries). Statement: (a) For an integer h >= 0 and r > 0: the intersection over s >= 0
--   of p^{-hs} A~^{dagger, p^{-s} r} is A~^+, and the intersection over s >= 0 of p^{-hs}
--   A~^{dagger, p^{-s} r}_{rig} is contained in B~^+_{rig}. (b) If A is a u x r matrix with entries
--   in B~^dagger_{log} and P in GL_u(F) satisfies A = P phi^{-1}(A), then A has entries in
--   B~^+_{log} = B~^+_{rig}[X].

/-! ## P7/robba-realisation-comparison (comparison) -/

-- Named result P7.robbaRealisationComparison (comparison): not stated; needs the rings of
--   PG.0/RD.0, the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2
--   (absent from the pinned libraries). Statement: Let V be a p-adic representation of G_K of
--   dimension d. Import from PhiGammaModulesAndIwasawaCohomology:PG.1-PG.2: the etale (phi,
--   Gamma_K)-module D(V) = (B tensor V)^{H_K} over B_K with V = (B tensor_{B_K} D(V))^{phi = 1},
--   and the overconvergent module D^dagger(V) = (B^dagger tensor V)^{H_K}, free of rank d over
--   B^dagger_K with D(V) = B_K tensor D^dagger(V) and B^dagger tensor_{B^dagger_K} D^dagger(V) =
--   B^dagger tensor_{Q_p} V, and its models D^{dagger,r}(V) for r >= r(V). Define D^dagger_rig(V) =
--   B^dagger_{rig,K} tensor_{B^dagger_K} D^dagger(V), D^{dagger,r}_rig(V) = B^{dagger,r}_{rig,K}
--   tensor D^{dagger,r}(V) and D^dagger_log(V) = B^dagger_{log,K} tensor D^dagger(V). Then: (a)
--   D^dagger_rig(V) is a free B^dagger_{rig,K}-module of rank d with commuting semilinear phi and
--   Gamma_K, and the linearisation of phi is an isomorphism (etale, slope 0 for the slope theory of
--   RD.3); (b) for r >= r(V), phi(D^{dagger,r}_rig(V)) is contained in D^{dagger,pr}_rig(V) and
--   B^{dagger,pr}_{rig,K} tensor phi(D^{dagger,r}_rig(V)) = D^{dagger,pr}_rig(V); (c)
--   B~^dagger_{rig} tensor_{B^dagger_{rig,K}} D^dagger_rig(V) = B~^dagger_{rig} tensor_{Q_p} V,
--   compatibly with phi and G_K, so D^dagger_rig(V) is contained in (B~^dagger_{rig} tensor
--   V)^{H_K} = B~^dagger_{rig,K} tensor D^dagger(V) and V = (B~^dagger_{rig} tensor
--   D^dagger_rig(V))^{phi = 1}; (d) V |-> D^dagger_rig(V) is an exact tensor functor compatible
--   with duals and Tate twists: D^dagger_rig(V(n)) = D^dagger_rig(V) tensor e_n with phi(e_n) = e_n
--   and gamma(e_n) = chi(gamma)^n e_n.

/-! ## P7/extended-localisation-maps (construction) -/

-- ExtRobba.iotaN: not stated; needs RD.0's extended Robba ring and R06.1's B_dR^+ with t and u =
--   log[p~]. Intended (constructor): iota_n : B~^{dagger,r_n}_{rig} ->+* B_dR^+.
-- ExtRobba.iotaN_injective: not stated; needs RD.0's extended Robba ring and R06.1's B_dR^+ with t
--   and u = log[p~]. Intended (characterisation): iota_n is injective.
-- ExtRobba.iotaN_galois: not stated; needs RD.0's extended Robba ring and R06.1's B_dR^+ with t and
--   u = log[p~]. Intended (relation): iota_n commutes with G_F.
-- ExtRobba.iotaN_phi: not stated; needs RD.0's extended Robba ring and R06.1's B_dR^+ with t and u
--   = log[p~]. Intended (relation): iota_{n+1} o phi = iota_n.
-- ExtRobba.ker_theta_iotaN: not stated; needs RD.0's extended Robba ring and R06.1's B_dR^+ with t
--   and u = log[p~]. Intended (characterisation): ker(theta o iota_n) = phi^{n-1}(q)
--   B~^{dagger,r_n}_{rig} (n >= 1).
-- ExtRobba.iotaN_log: not stated; needs RD.0's extended Robba ring and R06.1's B_dR^+ with t and u
--   = log[p~]. Intended (constructor): Extension to B~^{dagger,r_n}_{log} with iota_n(X) = p^{-n}
--   log[epsilon - 1].
-- ExtRobba.log_eq: not stated; needs RD.0's extended Robba ring and R06.1's B_dR^+ with t and u =
--   log[p~]. Intended (relation): log[epsilon - 1] = (p/(p-1)) u + (element of B~^+_{rig}), u =
--   log[p~].
-- ExtRobba.iotaN_restrict: not stated; needs RD.0's extended Robba ring and R06.1's B_dR^+ with t
--   and u = log[p~]. Intended (compatibility): On B^{dagger,r}_{rig,K} it is P7/localisation-maps-
--   p-adic-field.
-- Test `extIota.test_t` (computation): not stated; needs RD.0's extended Robba ring and R06.1's
--   B_dR^+ with t and u = log[p~]. Intended: iota_n(t) = p^{-n} t.
-- Test `extIota.test_theta` (computation): not stated; needs RD.0's extended Robba ring and R06.1's
--   B_dR^+ with t and u = log[p~]. Intended: theta(iota_n(pi)) = zeta_{p^n} - 1 and
--   theta(iota_n(phi^{n-1}(q))) = 0.
-- Test `extIota.test_plus` (compatibility): not stated; needs RD.0's extended Robba ring and
--   R06.1's B_dR^+ with t and u = log[p~]. Intended: On B~^+_{rig}, iota_0 is the inclusion
--   B~^+_{rig} in B^+_cris in B_dR^+.
-- Test `extIota.test_not_phi_equivariant` (non-example): not stated; needs RD.0's extended Robba
--   ring and R06.1's B_dR^+ with t and u = log[p~]. Intended: iota_n is not phi-equivariant into
--   B_dR^+ (B_dR^+ has no Frobenius): iota_n(phi(x)) = iota_{n-1}(x), not phi(iota_n(x)).

/-! ## P7/semistable-periods-in-extended-robba-ring (theorem) -/

-- Named result P7.semistablePeriodsInExtendedRobbaRing (theorem): not stated; needs the rings of
--   PG.0/RD.0, the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2
--   (absent from the pinned libraries). Statement: (a) For i in Z, {x in B~^dagger_{log} : g(x) =
--   chi(g)^i x for all g in G_K} is F t^i if i >= 0 and 0 if i < 0. (b) For every p-adic
--   representation V of G_K, (B~^dagger_{log} tensor V)^{G_K} is a finite-dimensional F-vector
--   space, and the inclusion B~^+_{log} in B~^dagger_{log} induces an isomorphism of (phi,
--   N)-modules D^+_st(V) = (B~^+_{log} tensor V)^{G_K} -> (B~^dagger_{log} tensor V)^{G_K}. (c)
--   Consequently D_st(V) = (B~^dagger_{log}[1/t] tensor V)^{G_K} and D_cris(V) =
--   (B~^dagger_{rig}[1/t] tensor V)^{G_K}; V is semistable (resp. crystalline) iff it is
--   B~^dagger_{log}[1/t]-admissible (resp. B~^dagger_{rig}[1/t]-admissible); and for V semistable,
--   B~^dagger_{log}[1/t] tensor_F D_st(V) = B~^dagger_{log}[1/t] tensor_{Q_p} V.

/-! ## P7/decompletion-operators (construction) -/

-- ExtRobba.decompletion: not stated; needs the H_K-invariants of RD.0's extended Robba ring and
--   PG.0's B^†_K. Intended (constructor): R_k : B~^{dagger,r}_{rig,K} -> phi^{-k}(B^{dagger,p^k
--   r}_{rig,K}).
-- ExtRobba.decompletion_section: not stated; needs the H_K-invariants of RD.0's extended Robba ring
--   and PG.0's B^†_K. Intended (characterisation): R_k is the identity on phi^{-k}(B^{dagger,p^k
--   r}_{rig,K}).
-- ExtRobba.decompletion_linear: not stated; needs the H_K-invariants of RD.0's extended Robba ring
--   and PG.0's B^†_K. Intended (structure): R_k is phi^{-k}(B^{dagger,p^k r}_{rig,K})-linear and
--   continuous.
-- ExtRobba.tendsto_decompletion: not stated; needs the H_K-invariants of RD.0's extended Robba ring
--   and PG.0's B^†_K. Intended (characterisation): R_k(x) -> x as k -> infinity.
-- ExtRobba.decompletion_gamma: not stated; needs the H_K-invariants of RD.0's extended Robba ring
--   and PG.0's B^†_K. Intended (relation): R_k commutes with Gamma_K.
-- ExtRobba.decompletion_log: not stated; needs the H_K-invariants of RD.0's extended Robba ring and
--   PG.0's B^†_K. Intended (other): The extension to B~^{dagger,r}_{log,K}[1/t] and to modules
--   B~^dagger_{rig,K} tensor D^dagger(V).
-- Test `decompletion.test_section` (computation): not stated; needs the H_K-invariants of RD.0's
--   extended Robba ring and PG.0's B^†_K. Intended: R_0(x) = x for x in B^{dagger,r}_{rig,K}.
-- Test `decompletion.test_epsilon` (computation): not stated; needs the H_K-invariants of RD.0's
--   extended Robba ring and PG.0's B^†_K. Intended: For K = F: R_0([epsilon^{1/p}]) = 0 and
--   R_1([epsilon^{1/p}]) = [epsilon^{1/p}].
-- Test `decompletion.test_limit` (degenerate): not stated; needs the H_K-invariants of RD.0's
--   extended Robba ring and PG.0's B^†_K. Intended: For x in phi^{-k}(B^{dagger,p^k r}_{rig,K}),
--   R_m(x) = x for all m >= k.
-- Test `decompletion.test_not_ring_hom` (non-example): not stated; needs the H_K-invariants of
--   RD.0's extended Robba ring and PG.0's B^†_K. Intended: R_0 is not multiplicative:
--   R_0([epsilon^{1/p}]^p) = [epsilon] != 0 = R_0([epsilon^{1/p}])^p.

/-! ## P7/berger-dcris-dst-dictionary (theorem) -/

-- Named result P7.bergerDcrisDstDictionary (theorem): not stated; needs the rings of PG.0/RD.0, the
--   period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from the
--   pinned libraries). Statement: For every p-adic representation V of G_K: D_st(V) =
--   (D^dagger_log(V)[1/t])^{Gamma_K} and D_cris(V) = (D^dagger_rig(V)[1/t])^{Gamma_K}, as (phi,
--   N)-modules, resp. phi-modules, over F, the equalities taking place inside (B~^dagger_{log}[1/t]
--   tensor V)^{H_K} (which contains D^dagger_log(V)[1/t] by P7/robba-realisation-comparison and
--   whose G_K-invariants are D_st(V) by P7/semistable-periods-in-extended-robba-ring). In
--   particular V is semistable (resp. crystalline) iff (D^dagger_log(V)[1/t])^{Gamma_K} (resp.
--   (D^dagger_rig(V)[1/t])^{Gamma_K}) has F-dimension d = dim V. If V has Hodge–Tate weights <= 0
--   then D_st(V) = D^dagger_log(V)^{Gamma_K} and D_cris(V) = D^dagger_rig(V)^{Gamma_K}. The
--   identification is compatible with Tate twists: D_cris(V(n)) = t^{-n} D_cris(V) tensor e_n
--   inside D^dagger_rig(V(n))[1/t]. The monodromy operator of D_st corresponds to N on
--   B^dagger_{log,K} normalised by N(log pi) = -p/(p-1).

/-! ## P7/berger-comparison-isomorphisms (theorem) -/

-- Named result P7.bergerComparisonIsomorphisms (theorem): not stated; needs the rings of PG.0/RD.0,
--   the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from
--   the pinned libraries). Statement: (1) If V is semistable, D^dagger(V) tensor_{B^dagger_K}
--   B^dagger_{log,K}[1/t] = D_st(V) tensor_F B^dagger_{log,K}[1/t], compatibly with phi, N and
--   Gamma_K. (2) If V is crystalline, D^dagger(V) tensor B^dagger_{rig,K}[1/t] = D_cris(V) tensor_F
--   B^dagger_{rig,K}[1/t]. If moreover the Hodge–Tate weights of V are <= 0, then D_st(V) is
--   contained in B^dagger_{log,K} tensor D^dagger(V). (3) For V semistable, the determinant of the
--   transition matrix from a basis of D_st(V) to a basis of D^dagger(V) is lambda t^r with r in Z
--   and lambda in B^dagger_K.

/-! ## P7/connection-on-robba-realisation (construction) -/

-- RobbaRealisation.nablaV: not stated; needs the Robba realisation D^†_rig(V) of PG.1-PG.2 (p-adic
--   Galois representations and (φ,Γ)-modules are absent from the pinned libraries). Intended
--   (constructor): nabla_V = log(gamma)/log_p chi(gamma) on D^{dagger,r}_rig(V).
-- RobbaRealisation.nablaV_leibniz: not stated; needs the Robba realisation D^†_rig(V) of PG.1-PG.2
--   (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned libraries).
--   Intended (relation): nabla_V(lambda x) = nabla(lambda) x + lambda nabla_V(x).
-- RobbaRealisation.nablaV_indep: not stated; needs the Robba realisation D^†_rig(V) of PG.1-PG.2
--   (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned libraries).
--   Intended (characterisation): Independent of gamma; nabla_V(x) = lim (gamma(x) - x)/(chi(gamma)
--   - 1).
-- RobbaRealisation.nablaV_phi: not stated; needs the Robba realisation D^†_rig(V) of PG.1-PG.2
--   (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned libraries).
--   Intended (relation): nabla_V commutes with phi and Gamma_K.
-- RobbaRealisation.partialV: not stated; needs the Robba realisation D^†_rig(V) of PG.1-PG.2
--   (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned libraries).
--   Intended (constructor): partial_V = t^{-1} nabla_V on D^dagger_rig(V)[1/t].
-- RobbaRealisation.ker_theta_iotaN: not stated; needs the Robba realisation D^†_rig(V) of PG.1-PG.2
--   (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned libraries).
--   Intended (characterisation): ker(theta o iota_n) = phi^{n-1}(q) D^{dagger,r}_rig(V).
-- RobbaRealisation.mem_t_of_forall: not stated; needs the Robba realisation D^†_rig(V) of PG.1-PG.2
--   (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned libraries).
--   Intended (characterisation): Divisibility by t on D^dagger_rig(V) from divisibility by all
--   phi^{n-1}(q).
-- RobbaRealisation.nablaV_twist: not stated; needs the Robba realisation D^†_rig(V) of PG.1-PG.2
--   (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned libraries).
--   Intended (simp): On Q_p(r): nabla_V(f e_r) = (nabla f + r f) e_r.
-- Test `nablaV.test_twist` (computation): not stated; needs the Robba realisation D^†_rig(V) of
--   PG.1-PG.2 (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned
--   libraries). Intended: For V = Q_p(r): nabla_V(e_r) = r e_r and nabla_V = t partial + r.
-- Test `nablaV.test_trivial` (degenerate): not stated; needs the Robba realisation D^†_rig(V) of
--   PG.1-PG.2 (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned
--   libraries). Intended: For V = Q_p: nabla_V = nabla = t partial on D^dagger_rig(V) =
--   B^dagger_{rig,K}.
-- Test `nablaV.test_leibniz` (compatibility): not stated; needs the Robba realisation D^†_rig(V) of
--   PG.1-PG.2 (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned
--   libraries). Intended: nabla_V(t e_r) = (t + r t) e_r = (1 + r) t e_r, consistent with nabla(t)
--   = t.
-- Test `nablaV.test_poles` (non-example): not stated; needs the Robba realisation D^†_rig(V) of
--   PG.1-PG.2 (p-adic Galois representations and (φ,Γ)-modules are absent from the pinned
--   libraries). Intended: partial_V is not defined on D^dagger_rig(V) itself in general: for V =
--   Q_p(1), partial_V(e_1) = t^{-1} e_1, which has poles at the zeta - 1.

/-! ## P7/unipotent-connection-criterion (lemma) -/

-- Named result P7.unipotentConnectionCriterion (lemma): not stated; needs the rings of PG.0/RD.0,
--   the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from
--   the pinned libraries). Statement: Let M be a free B^dagger_{rig,K}-module of rank d with a
--   connection nabla_M over nabla. The following are equivalent: (1) nabla_M is trivial on M tensor
--   B^dagger_{log,K}: there are e_0, ..., e_{d-1} in M tensor B^dagger_{log,K} with nabla_M(e_i) =
--   0 spanning M tensor B^dagger_{log,K}[1/t] over B^dagger_{log,K}[1/t]; (2) there are f_0, ...,
--   f_{d-1} in M forming a basis of M[1/t] over B^dagger_{rig,K}[1/t] with nabla_M(f_i) in t
--   <f_{i-1}, ..., f_0>. Such M (a 'cristal') is called unipotent; it is trivial if one can take
--   nabla_M(f_i) = 0.

/-! ## P7/semistability-criterion-unipotent-connection (theorem) -/

-- Named result P7.semistabilityCriterionUnipotentConnection (theorem): not stated; needs the rings
--   of PG.0/RD.0, the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2
--   (absent from the pinned libraries). Statement: Let V be a p-adic representation of G_K. There
--   exists n such that the restriction of V to G_{K_n} is semistable (resp. crystalline) with
--   Hodge–Tate weights <= 0 if and only if D^dagger_rig(V) with nabla_V is unipotent (resp.
--   trivial) in the sense of P7/unipotent-connection-criterion.

/-! ## P7/ddr-via-robba-realisation (theorem) -/

-- Named result P7.ddrViaRobbaRealisation (theorem): not stated; needs the rings of PG.0/RD.0, the
--   period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from the
--   pinned libraries). Statement: Let V be a p-adic representation of G_K. For n large (n >= n(r)
--   with r >= r(V)), the map K_infinity((t)) tensor_{iota_n, B^{dagger,r_n}_{rig,K}}
--   D^{dagger,r_n}_rig(V) -> D_dif(V) induced by iota_n is an isomorphism of
--   K_infinity((t))-modules with connection, where D_dif(V) = K_infinity((t)) tensor D^+_dif(V) is
--   Fontaine's module (D^+_dif(V) the largest finitely generated Gamma_K-stable
--   K_infinity[[t]]-submodule of (B_dR^+ tensor V)^{H_K}), with the connection nabla_V =
--   log(gamma)/log chi(gamma). K_infinity tensor_K D_dR(V) is the kernel of nabla_V on D_dif(V),
--   hence D_dR(V) = (K_infinity((t)) tensor_{iota_n} D^{dagger,r_n}(V))^{Gamma_K}, and V is de Rham
--   iff nabla_V is trivial on D_dif(V). If V is de Rham with Hodge–Tate weights <= 0 and n is
--   large, K_n[[t]] tensor_{iota_n} D^{dagger,r}_rig(V) is dense in Fil^0(K_n((t)) tensor_K
--   D_dR(V)) for the t-adic topology (Berger 2008 Appendix B correction of Berger 2002 Proposition
--   5.15).

/-! ## P7/wach-dcris-comparison (theorem) -/

-- Named result P7.wachDcrisComparison (theorem): not stated; needs the rings of PG.0/RD.0, the
--   period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from the
--   pinned libraries). Statement: Equip N(V) with the filtration Fil^i N(V) = {x in N(V) : phi(x)
--   in q^i N(V)} (for V with weights <= 0; in general N(V) = pi^{-b} N(V(-b)) and the filtration is
--   transported). Then the map lambda : D_cris(V) -> N(V)/pi N(V), obtained from the inclusion
--   D_cris(V) in B^+_{rig,F} tensor_{B^+_F} N(V) (PG.6: D_cris(V) = (B^+_{rig,F} tensor
--   N(V))^{Gamma_F}), is an isomorphism of filtered phi-modules over F, where N(V)/pi N(V) carries
--   the image filtration and D_cris(V) its Hodge filtration (PadicHodgeTheory:R06.2/filtered-phi-n-
--   modules, Fil^i D_cris(V) = Fil^i D_dR(V) cap D_cris(V)).

/-! ## P7/integral-dcris-lattice (construction) -/

-- Wach.dcrisLattice: not stated; needs Wach modules N(T) (PG.6) and R06.2's D_cris (absent from the
--   pinned libraries). Intended (constructor): D_cris(T) = image of N(T) in N(V)/pi N(V) =
--   D_cris(V).
-- Wach.dcrisLattice_isLattice: not stated; needs Wach modules N(T) (PG.6) and R06.2's D_cris
--   (absent from the pinned libraries). Intended (characterisation): D_cris(T) is a free O_F-
--   submodule of rank d spanning D_cris(V).
-- Wach.dcrisLattice_phi: not stated; needs Wach modules N(T) (PG.6) and R06.2's D_cris (absent from
--   the pinned libraries). Intended (relation): phi(D_cris(T)) is contained in D_cris(T) when all
--   Hodge–Tate weights are <= 0.
-- Wach.dcrisLattice_mono: not stated; needs Wach modules N(T) (PG.6) and R06.2's D_cris (absent
--   from the pinned libraries). Intended (functoriality): T_1 contained in T_2 implies D_cris(T_1)
--   contained in D_cris(T_2).
-- Wach.dcrisLattice_injective: not stated; needs Wach modules N(T) (PG.6) and R06.2's D_cris
--   (absent from the pinned libraries). Intended (characterisation): D_cris(T_1) = D_cris(T_2) iff
--   T_1 = T_2.
-- Wach.det_comparison: not stated; needs Wach modules N(T) (PG.6) and R06.2's D_cris (absent from
--   the pinned libraries). Intended (relation): det of B_max tensor V = B_max tensor D_cris(V) in
--   bases of T and D_cris(T) lies in t^{sum r_i} W(k)^x.
-- Wach.filtrationT: not stated; needs Wach modules N(T) (PG.6) and R06.2's D_cris (absent from the
--   pinned libraries). Intended (data): Fil^i_T D_cris(T): images of Fil^i N(T) = Fil^i N(V) cap
--   N(T).
-- Test `wachLattice.test_twist` (computation): not stated; needs Wach modules N(T) (PG.6) and
--   R06.2's D_cris (absent from the pinned libraries). Intended: For T = Z_p(r), r <= 0: D_cris(T)
--   = O_F t^{-r} e_r.
-- Test `wachLattice.test_det` (computation): not stated; needs Wach modules N(T) (PG.6) and R06.2's
--   D_cris (absent from the pinned libraries). Intended: For T = Z_p(r) the comparison determinant
--   is t^{-r} times a unit of W(k).
-- Test `wachLattice.test_trivial` (degenerate): not stated; needs Wach modules N(T) (PG.6) and
--   R06.2's D_cris (absent from the pinned libraries). Intended: For T = Z_p: D_cris(T) = O_F.
-- Test `wachLattice.test_not_dual` (non-example): not stated; needs Wach modules N(T) (PG.6) and
--   R06.2's D_cris (absent from the pinned libraries). Intended: D_cris(T) depends on T, not only
--   on V: for T and pT (same V) D_cris(pT) = p D_cris(T) != D_cris(T).

/-! ## P7/wach-fontaine-laffaille-comparison (comparison) -/

-- Named result P7.wachFontaineLaffailleComparison (comparison): not stated; needs the rings of
--   PG.0/RD.0, the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2
--   (absent from the pinned libraries). Statement: (a) If the Hodge–Tate weights of V lie in an
--   interval [a - (p-1), a] (filtration length <= p - 1), then M = D_cris(T) is a strongly
--   divisible lattice of D_cris(V): sum_i p^{-i} phi(Fil^i M) = M with Fil^i M = Fil^i D_cris(V)
--   cap M; and Fil^i_T = Fil^i_V on M. (b) Conversely, if M is a strongly divisible lattice of a
--   (weakly admissible) filtered phi-module D with weights in [a - (p-1), a] such that D has no
--   slope -a part or no slope -a + (p-1) part, there are a crystalline V and a lattice T with
--   D_cris(V) = D and D_cris(T) = M; on an interval of length <= p - 2 no slope condition is
--   needed. (c) Hence for weights in an interval of length <= p - 2, T |-> D_cris(T) is an
--   inclusion-preserving bijection between G_F-stable lattices of V and strongly divisible lattices
--   of D_cris(V), and agrees with the Fontaine–Laffaille correspondence of
--   FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3 after translating filtration indices to
--   HT(chi) = +1. For length >= p the statement (a) fails in general.

/-! ## P7/principal-parts-interpolation (lemma) -/

-- Named result P7.principalPartsInterpolation (lemma): not stated; needs the rings of PG.0/RD.0,
--   the period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from
--   the pinned libraries). Statement: Let r >= r(K), n >= n(r) and w >= 1. There is t_{n,w} in
--   B^{dagger,r}_{rig,F} (hence in B^{dagger,r}_{rig,K}) with iota_n(t_{n,w}) congruent to 1 modulo
--   t^w F_n[[t]] and iota_m(t_{n,w}) in t^w F_m[[t]] for every m >= n(r) with m != n; one may take
--   t_{n,w} in B^+_{rig,F}.

/-! ## P7/ideals-dividing-powers-of-t (lemma) -/

-- Named result P7.idealsDividingPowersOfT (lemma): not stated; needs the rings of PG.0/RD.0, the
--   period rings and functors of R06.1-R06.2 and the (φ,Γ)-modules of PG.1-PG.2 (absent from the
--   pinned libraries). Statement: Let r >= r(K) and h >= 0. Every principal ideal of
--   B^{dagger,r}_{rig,K} dividing (t^h) is generated by prod_{n >= n(r)} (phi^{n-1}(q)/p)^{j_n}
--   with integers 0 <= j_n <= h; the ideals (phi^{n-1}(q)) of B^{dagger,r}_{rig,K} (n >= n(r)) are
--   maximal and pairwise coprime.

end PartA

end

/-! # Layers P8:local-rational and P8: pro-étale period sheaves -/

section

open Ideal WittVector
open scoped TensorProduct

section PartB

noncomputable section

variable (p : ℕ) [Fact p.Prime]

local notation "𝕎 " A:100 => WittVector p A
local notation A "♭" => PreTilt A p

/-! ## Ring-level models -/

/-- The completion of `B` along the kernel of a ring map `θ : B →+* S`: the pattern of Mathlib's
`BDeRhamPlus` and of the erratum's rings `S_i`. -/
abbrev kerThetaCompletion {B S : Type*} [CommRing B] [CommRing S] (θ : B →+* S) : Type _ :=
  AdicCompletion (RingHom.ker θ) B

/-- The step from almost acyclicity to rational acyclicity (node
`completed-structure-sheaf-on-affinoid-perfectoids`): a module killed by an ideal containing `π`
vanishes after inverting `π`. -/
theorem localizedModule_subsingleton_of_ideal_smul_eq_zero {A M : Type*} [CommRing A]
    [AddCommGroup M] [Module A M] (m : Ideal A) (π : A) (hπ : π ∈ m)
    (hM : ∀ a ∈ m, ∀ x : M, a • x = 0) :
    Subsingleton (LocalizedModule (Submonoid.powers π) M) := sorry

/-- Formal Poincaré lemma, degree 0 (node `formal-poincare-lemma`): over a `ℚ`-algebra, a power
series killed by all partial derivatives is constant. -/
theorem formalPoincare_degree_zero {B : Type*} [CommRing B] [Algebra ℚ B] {n : ℕ}
    (f : MvPowerSeries (Fin n) B) :
    (∀ i, MvPowerSeries.pderiv B i f = 0) ↔ f ∈ Set.range (MvPowerSeries.C (σ := Fin n) (R := B)) :=
  sorry

/-- Formal Poincaré lemma, degree 1 (node `formal-poincare-lemma`): closed formal 1-forms over a
`ℚ`-algebra are exact. -/
theorem formalPoincare_degree_one {B : Type*} [CommRing B] [Algebra ℚ B] {n : ℕ}
    (ω : Fin n → MvPowerSeries (Fin n) B)
    (hω : ∀ i j, MvPowerSeries.pderiv B i (ω j) = MvPowerSeries.pderiv B j (ω i)) :
    ∃ f : MvPowerSeries (Fin n) B, ∀ i, MvPowerSeries.pderiv B i f = ω i := sorry

/-- The one-variable formal Poincaré lemma: `d/dX` is surjective on `B⟦X⟧` over a `ℚ`-algebra. -/
theorem formalPoincare_one_variable {B : Type*} [CommRing B] [Algebra ℚ B] :
    Function.Surjective (PowerSeries.derivative B) := sorry

open Polynomial in
/-- `γ − 1` on `S[V]`, `P(V) ↦ P(V + 1) − P(V)` (Lemma 6.17 and the proof of Proposition 6.16). -/
def gammaShiftSubOne (S : Type*) [CommRing S] : S[X] →ₗ[S] S[X] :=
  (aeval (X + 1 : S[X])).toLinearMap - LinearMap.id

/-- Over a `ℚ`-algebra, `γ − 1` is surjective on `S[V]` (node
`cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`). -/
theorem gammaShiftSubOne_surjective (S : Type*) [CommRing S] [Algebra ℚ S] :
    Function.Surjective (gammaShiftSubOne S) := sorry

open Polynomial in
/-- Over a `ℚ`-algebra, the kernel of `γ − 1` on `S[V]` is the constants. -/
theorem gammaShiftSubOne_eq_zero_iff (S : Type*) [CommRing S] [Algebra ℚ S] (P : S[X]) :
    gammaShiftSubOne S P = 0 ↔ ∃ s, P = C s := sorry

section Perfectoid

variable (O : Type*) [CommRing O] [Fact ¬IsUnit (p : O)] [IsAdicComplete (span {(p : O)}) O]

/-- The local model `B_dR^+(R, R^+)[[X_1, …, X_n]]` of `OB_dR^+` over the perfectoid toric cover
(node `local-structure-of-structural-de-rham-sheaf`). -/
abbrev bdrPowerSeries (n : ℕ) : Type _ := MvPowerSeries (Fin n) (BDeRhamPlus O p)

/-- The ring map `W(O♭) → B_dR^+(O)`. -/
def toBDeRhamPlus : 𝕎 (O♭) →+* BDeRhamPlus O p :=
  (algebraMap (Localization.Away ((p : ℕ) : 𝕎 (O♭)))
    (AdicCompletion (RingHom.ker (fontaineThetaInvertP O p))
      (Localization.Away ((p : ℕ) : 𝕎 (O♭))))).comp
    (algebraMap (𝕎 (O♭)) (Localization.Away ((p : ℕ) : 𝕎 (O♭))))

/-- The image `[T_i♭] + X_i` of the coordinate `T_i` (node
`structural-algebra-structure-on-bdr-power-series`). -/
def PowerSeriesStructure.coordinateImage {n : ℕ} (T : Fin n → O♭) (i : Fin n) :
    bdrPowerSeries p O n :=
  MvPowerSeries.C (toBDeRhamPlus p O (teichmuller p (T i))) + MvPowerSeries.X i

end Perfectoid

section Structural

variable (W A O : Type*) [CommRing W] [CommRing A] [CommRing O] [Fact ¬IsUnit (p : O)]
  [Algebra W A] [Algebra W (WittVector p (PreTilt O p))]

/-- The `p`-adically completed tensor product `R_i^+ ⊗̂_{W(κ)} A_inf(R, R^+)` of the erratum. -/
abbrev completedTensorAinf : Type _ :=
  AdicCompletion (span {((p : ℕ) : A ⊗[W] 𝕎 (O♭))}) (A ⊗[W] 𝕎 (O♭))

/-- `StructuralDeRhamPlusSheaf.sectionRing`: the erratum's ring `S_i`, the ker θ-adic completion
of `(R_i^+ ⊗̂_{W(κ)} A_inf(R, R^+))[1/p]`. The map `θ` is an input: the tensor product of
`R_i^+ → R^+` with Fontaine's θ, inverted at `p`. -/
abbrev StructuralDeRhamPlusSheaf.sectionRing
    (θ : Localization.Away ((p : ℕ) : completedTensorAinf p W A O) →+*
      Localization.Away ((p : ℕ) : O)) : Type _ :=
  kerThetaCompletion θ

end Structural

section Semistable

variable (B : Type*) [CommRing B]

open Polynomial

/-- `SemistablePeriodSheaf.frobenius`, sectionwise on `B_st = B_cris[u]`: `φ` on coefficients and
`u ↦ p u`. -/
def SemistablePeriodSheaf.frobenius (φ : B →+* B) : B[X] →+* B[X] :=
  eval₂RingHom (C.comp φ) (C (p : B) * X)

/-- `SemistablePeriodSheaf.monodromy`, sectionwise: `N = −d/du`. -/
def SemistablePeriodSheaf.monodromy : B[X] →ₗ[B] B[X] := -derivative

/-- `SemistablePeriodSheaf.monodromy_frobenius`: `N φ = p φ N`. -/
theorem SemistablePeriodSheaf.monodromy_frobenius (φ : B →+* B) (f : B[X]) :
    SemistablePeriodSheaf.monodromy B (SemistablePeriodSheaf.frobenius p B φ f) =
      (p : B[X]) * SemistablePeriodSheaf.frobenius p B φ (SemistablePeriodSheaf.monodromy B f) :=
  sorry

/-- `SemistablePeriodSheaf.ker_monodromy`: over a `ℚ`-algebra, `ker N` is the constants
(`B_st^{N=0} = B_cris`). -/
theorem SemistablePeriodSheaf.ker_monodromy [Algebra ℚ B] (f : B[X]) :
    SemistablePeriodSheaf.monodromy B f = 0 ↔ ∃ b, f = C b := sorry

end Semistable

/-! ## Declarations of the packet, node by node -/

/-! ### `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces` (lemma): Local toric charts on smooth adic spaces (étale maps to Tⁿ through rational embeddings and finite étale maps) -/

-- toricChartsForSmoothSpaces: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations` (definition): The structure sheaves O_X and Ô_X on X_proét and the continuous valuations on their sections -/

-- UncompletedStructureSheaf (data): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- CompletedStructureSheaf (data): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- UncompletedStructureSheaf.sections_limit (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- CompletedStructureSheaf.sections_qcqs (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- CompletedStructureSheaf.valuation (constructor): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- CompletedStructureSheaf.valuation_restrict (functoriality): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- CompletedStructureSheaf.topology (instance): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- CompletedStructureSheaf.sections_perfectoidTorus (test, computation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- CompletedStructureSheaf.sections_etale (test, compatibility): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- CompletedStructureSheaf.point (test, degenerate): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- UncompletedStructureSheaf.not_complete (test, non-example): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/integral-elements-via-valuations` (lemma): Integral elements of O_X(U) and Ô_X(U) are those with |f(x)| ≤ 1 at every point -/

-- integralElementsViaValuations: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids` (theorem): Rational local acyclicity of Ô_X: Ô_X(U) = R and H^i(U, Ô_X) = 0 on affinoid perfectoid U -/

-- completedStructureSheafOnAffinoidPerfectoids: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3) (its algebraic step localizedModule_subsingleton_of_ideal_smul_eq_zero is stated above).

/-! ### `PadicHodgeTheory:P8:local-rational/affinoid-perfectoid-objects-and-etale-pullbacks` (lemma): Étale pullbacks of affinoid perfectoid objects: Ô_X(V_j ×_{U_j} U) = S_j ⊗̂_{R_j} R -/

-- affinoidPerfectoidObjectsAndEtalePullbacks: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions` (definition): The period sheaves B_inf and B_dR^+ with θ and the ker θ-adic filtration -/

-- InfinitesimalPeriodSheaf (data): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamPlusSheaf (data): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamPlusSheaf.theta (projection): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamPlusSheaf.fil (structure): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamPlusSheaf.map (functoriality): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamPlusSheaf.algebraMap_fontaine (compatibility): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- InfinitesimalPeriodSheaf.sections_qcqs (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
/-- Test `DeRhamPlusSheaf.sections_point` (compatibility), ring-level half: Mathlib's `BDeRhamPlus` is
the ker θ[1/p]-adic completion, the value of `B_dR^+` on a perfectoid point. The sheaf-level half
(`B_dR^+(Spa C) ≅ BDeRhamPlus (PadicComplexInt p) p`) needs `X_proét`. -/
example (O : Type*) [CommRing O] [Fact ¬IsUnit (p : O)] [IsAdicComplete (span {(p : O)}) O] :
    BDeRhamPlus O p = kerThetaCompletion (fontaineThetaInvertP O p) := rfl
-- DeRhamPlusSheaf.gr_one (test, computation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamPlusSheaf.theta_surjective (test, characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
/-- Test `DeRhamPlusSheaf.p_isUnit` (non-example): `p` is a unit in `B_dR^+`, so `B_dR^+` is not a
`p`-adic completion of `A_inf`. -/
example (O : Type*) [CommRing O] [Fact ¬IsUnit (p : O)] [IsAdicComplete (span {(p : O)}) O] :
    IsUnit ((p : ℕ) : BDeRhamPlus O p) := sorry
-- InfinitesimalPeriodSheaf.not_complete (test, non-example): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids` (theorem): Values of B_inf, B_dR^+ on affinoid perfectoids; ξ generates Fil¹ locally -/

-- periodSheavesOnAffinoidPerfectoids: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves` (theorem): Rational local acyclicity of B_dR^+, B_dR, their filtration steps and graded pieces on affinoid perfectoids -/

-- rationalAcyclicityOfDeRhamPeriodSheaves: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf` (definition): The de Rham period sheaf B_dR = B_dR^+[1/t] and its filtration -/

-- DeRhamSheaf (data): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.fil (structure): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.t_isUnit (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.sections_affinoidPerfectoid (compatibility): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.gr (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.map (functoriality): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.sections_point (test, compatibility): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.fil_zero (test, characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.gr_neg_one (test, computation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- DeRhamSheaf.not_p_localization (test, non-example): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products` (lemma): Values of the period sheaves on U × S for profinite S (continuous maps) -/

-- periodSheavesOnProfiniteProducts: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/graded-de-rham-period-sheaf-tate-twist` (theorem): gr^i B_dR ≅ Ô_X(i) -/

-- gradedDeRhamPeriodSheafTateTwist: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf` (definition): The positive structural de Rham sheaf OB_dR^+ (corrected definition) with θ and its filtration -/

-- StructuralDeRhamPlusSheaf (data): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.sectionRing (constructor): stated above.
-- StructuralDeRhamPlusSheaf.theta (projection): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.fil (structure): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.algebraMap_O (structure): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.algebraMap_BdR (structure): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.map (functoriality): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.torus_sections (test, computation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.point (test, degenerate): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.theta_restrict (test, characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.uncorrected_non_example (test, non-example): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection` (construction): The connection ∇ on the corrected OB_dR^+ -/

-- StructuralDeRhamPlusSheaf.connection (constructor): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_leibniz (relation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_integrable (relation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_griffiths (relation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_unique (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_map (functoriality): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_coordinates (test, computation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_kernel (test, characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_dim_zero (test, degenerate): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamPlusSheaf.connection_not_O_linear (test, non-example): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/bdr-plus-power-series-extension-lemma` (lemma): Maps of finitely generated O_k-algebras into B_dR^+(R, R^+)[[X]] extend to p-adic completions -/

-- bdrPlusPowerSeriesExtensionLemma: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/etale-algebras-over-torus-models` (lemma): Affinoids étale over the torus have finitely generated étale algebraic models -/

-- etaleAlgebrasOverTorusModels: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/structural-algebra-structure-on-bdr-power-series` (construction): The O_X-algebra structure on B_dR^+[[X_1, …, X_n]] over the perfectoid toric cover -/

-- PowerSeriesStructure.algebraMap (constructor): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- PowerSeriesStructure.algebraMap_T (simp): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- PowerSeriesStructure.theta_comp (compatibility): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- PowerSeriesStructure.unique (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- PowerSeriesStructure.map_etale (functoriality): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- PowerSeriesStructure.algebraMap_inv_T (test, computation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- PowerSeriesStructure.torus (test, degenerate): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- PowerSeriesStructure.theta_comp_test (test, compatibility): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- PowerSeriesStructure.not_equivariant (test, non-example): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf` (theorem): OB_dR^+|_{X̃} ≅ B_dR^+|_{X̃}[[X_1, …, X_n]] (strengthened form of the erratum) -/

-- localStructureOfStructuralDeRhamSheaf: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3) (its local model bdrPowerSeries and the ring StructuralDeRhamPlusSheaf.sectionRing are stated above).

/-! ### `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates` (lemma): ∇ and the filtrations of OB_dR^+ and OB_dR in the coordinates X_i = u_i -/

-- connectionAndFiltrationInLocalCoordinates: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf` (definition): The structural de Rham sheaf OB_dR = OB_dR^+[1/t] with filtration and connection -/

-- StructuralDeRhamSheaf (data): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.fil (structure): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.connection (constructor): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.plus_inter_fil (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.gr (characterisation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.pushforward (compatibility): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.gr_zero_torus (test, computation): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.point (test, degenerate): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.pushforward_eq (test, compatibility): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).
-- StructuralDeRhamSheaf.gr_zero_not_OX (test, non-example): not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/formal-poincare-lemma` (lemma): Formal Poincaré lemma for power series over a Q-algebra, with strictness -/

-- formalPoincareLemma: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3) (formalPoincare_degree_zero, formalPoincare_degree_one and formalPoincare_one_variable are stated above).

/-! ### `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension` (theorem): The Poincaré lemma for OB_dR^+: exactness, Griffiths transversality and strict exactness -/

-- poincareLemmaAndFaltingsExtension: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/faltings-extension` (theorem): Faltings's extension 0 → Ô_X(1) → gr¹OB_dR^+ → Ô_X ⊗_{O_X} Ω¹_X → 0 -/

-- faltingsExtension: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/graded-structural-de-rham-sheaf-local-description` (lemma): gr^i OB_dR ≅ ξ^i Ô_X[X_1/ξ, …, X_n/ξ] over the toric cover -/

-- gradedStructuralDeRhamSheafLocalDescription: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/relative-poincare-lemma` (theorem): The relative Poincaré lemma for a smooth morphism (with the completed tensor product) -/

-- relativePoincareLemma: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/gamma-action-on-log-coordinates` (lemma): The Z_p^n-action on the log coordinates V_j of gr⁰OB_dR -/

-- gammaActionOnLogCoordinates: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3) (its polynomial consequence gammaShiftSubOne_surjective / gammaShiftSubOne_eq_zero_iff is stated above).

/-! ### `PadicHodgeTheory:P8:local-rational/perfectoid-torus-cover-completed-tensor` (lemma): R̃ = R ⊗̂_{k⟨T^{±1}⟩} K⟨T^{±1/p^∞}⟩ for the perfectoid toric cover -/

-- perfectoidTorusCoverCompletedTensor: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/tate-descent-for-completed-cyclotomic-tensor` (lemma): Continuous Γ_k-cohomology of R ⊗̂_k K̂_∞(i) (Tate's normalised traces, relative form) -/

-- tateDescentForCompletedCyclotomicTensor: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base` (theorem): H^q(X_K, gr⁰OB_dR) = 0 for q > 0 and = R ⊗̂_k K for q = 0 -/

-- cohomologyOfGradedStructuralDeRhamSheafOverCyclotomicBase: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf` (theorem): H^q(X, gr^i OB_dR) over k: only R (q = 0) and R·log χ (q = 1) for i = 0 -/

-- cohomologyOfGradedStructuralDeRhamSheaf: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf` (theorem): ν_*OB_dR = O_{X_ét}, ν_*Ô_X = O_{X_ét}, ν_*Ô_X(n) = 0 (n ≥ 1), R¹ν_*Ô_X(1) ≅ Ω¹_{X_ét}, R¹ν_*Ô_X(n) = 0 (n ≥ 2) -/

-- pushforwardOfStructuralDeRhamSheaf: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/higher-direct-images-of-twisted-completed-structure-sheaf` (theorem): R^iν_*Ô_X(j) = Ω^j_{X_ét} (i = j), Ω^j_{X_ét}·log χ (i = j + 1), 0 otherwise -/

-- higherDirectImagesOfTwistedCompletedStructureSheaf: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves` (definition): The crystalline period sheaves A_cris, B_cris^+, B_cris and their filtrations -/

-- CrystallinePeriodSheaf.Acris (data): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.BcrisPlus (data): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.Bcris (data): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.fil (structure): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.theta (projection): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.t (constructor): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.map (functoriality): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.sections_point (test, compatibility): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.gr_zero (test, computation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.pTorsionFree (test, characterisation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
/-- Test `CrystallinePeriodSheaf.xi_pow_div` (non-example): for `ξ = [p♭] − p` with `(p♭)^p ≠ 0`,
`ξ^p` is not divisible by `p` in `W(O♭)`, so `ξ^p/p ∈ A_cris` does not lie in `A_inf`. -/
example (O : Type*) [CommRing O] [Fact ¬IsUnit (p : O)] (pflat : O♭) (h : pflat ^ p ≠ 0) :
    ¬ (((p : ℕ) : 𝕎 (O♭)) ∣ (teichmuller p pflat - ((p : ℕ) : 𝕎 (O♭))) ^ p) := sorry

/-! ### `PadicHodgeTheory:P8:local-rational/almost-limit-lemma-for-acris-modules` (lemma): Almost inverse-limit lemma for p-adically complete A_cris-modules on affinoid perfectoids -/

-- almostLimitLemmaForAcrisModules: not stated; needs the pro-étale site X_proét of a locally noetherian adic space (AdicEtaleGeometry A1) and the integral sheaves Ô⁺_X, Ô⁺_{X♭}, A_inf on it (AInfCohomology AI.3).

/-! ### `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids` (theorem): Values and acyclicity of A_cris, B_cris^+, B_cris on affinoid perfectoids -/

-- crystallinePeriodSheavesOnAffinoidPerfectoids: not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8:local-rational/frobenius-on-crystalline-period-sheaves` (construction): Frobenius φ on A_cris, B_cris^+ and B_cris -/

-- CrystallinePeriodSheaf.frobenius (constructor): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.frobenius_teichmuller (simp): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.frobenius_t (simp): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.frobenius_galois (compatibility): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.frobenius_sections (compatibility): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- CrystallinePeriodSheaf.frobenius_point (test, compatibility): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
/-- Test `CrystallinePeriodSheaf.frobenius_xi` (computation): `φ(ξ) = [p♭]^p − p`. -/
example (O : Type*) [CommRing O] [Fact ¬IsUnit (p : O)] (pflat : O♭) :
    WittVector.frobenius (teichmuller p pflat - ((p : ℕ) : 𝕎 (O♭))) =
      teichmuller p (pflat ^ p) - ((p : ℕ) : 𝕎 (O♭)) := sorry
-- CrystallinePeriodSheaf.frobenius_t_test (test, computation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
/-- Test `CrystallinePeriodSheaf.frobenius_not_filtered` (non-example): `θ(φ(ξ)) = p^p − p`, which is
nonzero, so `φ(Fil¹) ⊄ Fil¹`. -/
example (O : Type*) [CommRing O] [Fact ¬IsUnit (p : O)] [IsAdicComplete (span {(p : O)}) O]
    (pflat : O♭) (hp : PreTilt.untilt pflat = (p : O)) :
    fontaineTheta O p (WittVector.frobenius (teichmuller p pflat - ((p : ℕ) : 𝕎 (O♭)))) =
      (p : O) ^ p - p := sorry

/-! ### `PadicHodgeTheory:P8:local-rational/crystalline-to-de-rham-period-sheaf-embedding` (theorem): B_cris^+ ↪ B_dR^+ and B_cris ↪ B_dR as filtered subsheaves -/

-- crystallineToDeRhamPeriodSheafEmbedding: not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves` (definition): The structural crystalline period sheaves OA_cris, OB_cris^+, OB_cris with filtration and connection -/

-- StructuralCrystallineSheaf.OAcris (data): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.OBcris (data): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.fil (structure): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.connection (constructor): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.connection_griffiths (relation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.theta (projection): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.map (functoriality): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.torus_sections (test, computation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.point (test, degenerate): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.embeds_OBdR (test, compatibility): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
/-- Test `StructuralCrystallineSheaf.not_OBdR` (non-example), core fact: `v_p(n!) − n` is unbounded
below, so `Σ p^{-n} u^n = Σ (n!/p^n) u^{[n]}` has unbounded denominators and is not in `OB_cris^+`. -/
example : ∀ N : ℕ, ∃ n : ℕ, (padicValNat p n.factorial : ℤ) - n < -(N : ℤ) := sorry

/-! ### `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf` (theorem): OA_cris|_{X̃} ≅ A_cris{⟨u_1, …, u_d⟩}|_{X̃}, strictly compatible with filtrations -/

-- localStructureOfStructuralCrystallineSheaf: not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8:local-rational/crystalline-poincare-lemma` (theorem): The crystalline Poincaré lemma for OA_cris, OB_cris^+ and OB_cris -/

-- crystallinePoincareLemma: not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8:local-rational/structural-crystalline-sheaf-on-affinoid-perfectoids` (theorem): Values and acyclicity of OA_cris and OB_cris on affinoid perfectoids -/

-- structuralCrystallineSheafOnAffinoidPerfectoids: not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8:local-rational/frobenius-on-structural-crystalline-sheaf` (construction): Frobenius on OA_cris from a Frobenius lift, its horizontality and dependence on the lift -/

-- StructuralCrystallineSheaf.frobenius (constructor): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.frobenius_u (simp): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.frobenius_horizontal (relation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.frobenius_change_of_lift (relation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.frobenius_restrict (compatibility): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
open Polynomial in
/-- Test `StructuralCrystallineSheaf.frobenius_standard_lift` (computation): with `σ(T) = T^p`,
`φ(u) = (u + [T♭])^p − [T♭]^p = Σ_{j ≥ 1} binom(p, j) [T♭]^{p−j} u^j`. -/
example (A : Type*) [CommRing A] (a : A) :
    (X + C a) ^ p - C (a ^ p) = ∑ j ∈ Finset.Icc 1 p, C ((p.choose j : A) * a ^ (p - j)) * X ^ j :=
  sorry
-- StructuralCrystallineSheaf.frobenius_point (test, degenerate): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.frobenius_horizontal_sections (test, characterisation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralCrystallineSheaf.frobenius_depends_on_lift (test, non-example): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8:local-rational/structural-crystalline-to-de-rham-embedding` (theorem): OB_cris^+ ↪ OB_dR^+, OB_cris ↪ OB_dR as filtered subsheaves; w_*OB_cris = O_{𝔛_ét}[1/p] -/

-- structuralCrystallineToDeRhamEmbedding: not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8:local-rational/semistable-period-sheaves` (definition): The semistable period sheaves B_st^+ = B_cris^+[u] and B_st = B_cris[u] with φ, N and G_k-action -/

-- SemistablePeriodSheaf (data): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- SemistablePeriodSheaf.frobenius (structure): stated above.
-- SemistablePeriodSheaf.monodromy (structure): stated above.
-- SemistablePeriodSheaf.monodromy_frobenius (relation): stated above.
-- SemistablePeriodSheaf.galois (other): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- SemistablePeriodSheaf.embedding (constructor): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- SemistablePeriodSheaf.ker_monodromy (characterisation): stated above.
open Polynomial in
/-- Test `SemistablePeriodSheaf.monodromy_frobenius_test` (computation): `N φ(u^m) = −m p^m u^{m−1}`. -/
example (B : Type*) [CommRing B] (φ : B →+* B) (m : ℕ) :
    SemistablePeriodSheaf.monodromy B (SemistablePeriodSheaf.frobenius p B φ (X ^ m)) =
      -((m : B[X]) * (p : B[X]) ^ m * X ^ (m - 1)) := sorry
open Polynomial in
/-- Test `SemistablePeriodSheaf.ker_monodromy_test` (characterisation): constants are killed by `N`
and `u` is not. -/
example (B : Type*) [CommRing B] [Algebra ℚ B] [Nontrivial B] (b : B) :
    SemistablePeriodSheaf.monodromy B (C b) = 0 ∧ SemistablePeriodSheaf.monodromy B (X : B[X]) ≠ 0 :=
  sorry
-- SemistablePeriodSheaf.sections_point (test, compatibility): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- SemistablePeriodSheaf.u_not_crystalline (test, non-example): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8:local-rational/structural-semistable-period-sheaves` (definition): The structural semistable sheaf OB_st = OB_cris[u] on the pro-étale site of a smooth formal scheme -/

-- StructuralSemistableSheaf (data): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralSemistableSheaf.connection (constructor): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralSemistableSheaf.monodromy (structure): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralSemistableSheaf.horizontal (characterisation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralSemistableSheaf.embedding (constructor): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralSemistableSheaf.horizontal_test (test, characterisation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralSemistableSheaf.point (test, degenerate): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralSemistableSheaf.commute (test, computation): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).
-- StructuralSemistableSheaf.not_crystalline (test, non-example): not stated; needs the pro-étale site (AdicEtaleGeometry A1), A_inf and θ as sheaves (AInfCohomology AI.3) and PD envelopes of sheaves of rings (CrystallineCohomology CR.0).

/-! ### `PadicHodgeTheory:P8/bdr-plus-local-system` (definition): B_dR^+-local systems and OB_dR^+-modules with integrable connection -/

-- BdRPlusLocalSystem (data): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- OBdRPlusConnection (data): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- BdRPlusLocalSystem.ofLisse (constructor): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- BdRPlusLocalSystem.tensor (structure): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- BdRPlusLocalSystem.gr0 (projection): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- BdRPlusLocalSystem.pullback (functoriality): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- BdRPlusLocalSystem.trivial (test, degenerate): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- BdRPlusLocalSystem.ofLisse_tate (test, computation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- BdRPlusLocalSystem.gr0_rank (test, characterisation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- BdRPlusLocalSystem.ohat_non_example (test, non-example): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/bdr-plus-local-systems-and-integrable-connections` (theorem): B_dR^+-local systems are equivalent to OB_dR^+-modules with integrable connection -/

-- bdrPlusLocalSystemsAndIntegrableConnections: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites` (lemma): Vector bundles on X_an, X_ét and X_proét agree -/

-- vectorBundlesOnAnalyticEtaleAndProetaleSites: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/filtered-module-with-integrable-connection` (definition): Filtered O_X-modules with integrable connection, and association with OB_dR^+-modules -/

-- FilteredConnection (data): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.deRham (constructor): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.tensor (structure): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.shift (other): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.Associated (other): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.pullback (functoriality): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.trivial (test, degenerate): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.twist (test, computation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.dR_graded (test, characterisation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- FilteredConnection.griffiths_non_example (test, non-example): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/associated-bdr-plus-local-system` (construction): The B_dR^+-local system M(E) = Fil⁰(E ⊗ OB_dR)^{∇=0} associated to a filtered module with connection -/

-- associatedLocalSystem (constructor): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- associatedLocalSystem.recover (characterisation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- associatedLocalSystem.fullyFaithful (characterisation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- associatedLocalSystem.map (functoriality): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- associatedLocalSystem.shift (compatibility): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- associatedLocalSystem.trivial_filtration (test, computation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- associatedLocalSystem.tate (test, computation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- associatedLocalSystem.shift_test (test, compatibility): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- associatedLocalSystem.filtration_matters (test, non-example): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/boundary-map-of-associated-local-system` (lemma): The extension class of M_0/Fil²M_0 is −∇ under R¹ν_*Ô_X(1) ≅ Ω¹ -/

-- boundaryMapOfAssociatedLocalSystem: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/position-of-associated-local-system` (theorem): M(E) ⊂ M_0 ⊗ B_dR is the unique lattice with graded pieces Fil^{−i}E ⊗ Ô_X(i) -/

-- positionOfAssociatedLocalSystem: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/tensor-compatibility-of-associated-local-systems` (lemma): M(E) is a tensor functor: M(E ⊗ E') = M(E) ⊗ M(E'), M(E^∨) = M(E)^∨ -/

-- tensorCompatibilityOfAssociatedLocalSystems: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/coherent-cohomology-against-graded-structural-sheaf` (lemma): RΓ(X_k̄, A) ⊗ gr^i B_dR ≅ RΓ(X_k̄, A ⊗ gr^i OB_dR) for proper smooth X -/

-- coherentCohomologyAgainstGradedStructuralSheaf: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/proper-smooth-bdr-local-system-comparison` (theorem): de Rham comparison for B_dR^+-local systems from filtered modules on proper smooth X -/

-- properSmoothBdrLocalSystemComparison: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion` (theorem): Connected affinoid noetherian adic spaces are K(π,1) for p-torsion coefficients -/

-- affinoidKPiOneForPTorsion: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/lisse-zp-sheaf` (definition): Lisse Z_p-sheaves on X_ét and lisse Ẑ_p-sheaves on X_proét -/

-- LisseZpSheaf (data): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.ofEtale (constructor): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.tensor (structure): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.rational (other): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.tate (constructor): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.pullback (functoriality): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.constant (test, degenerate): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.tate_test (test, computation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.sections_profinite (test, characterisation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
/-- Test `LisseZpSheaf.naive_non_example` (non-example), core fact: the identity of `ℤ_[p]` is continuous
but not locally constant, so it is a section of `Ẑ_p` over `U × ℤ_[p]` but not of `ν^* ℤ_p`. -/
example : ¬ IsLocallyConstant (fun x : ℤ_[p] => x) := sorry

/-! ### `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence` (theorem): Lisse Z_p-sheaves on X_ét are equivalent to lisse Ẑ_p-sheaves on X_proét, with R^j lim ν^*L_n = 0 -/

-- lisseSheavesEtaleProetaleEquivalence: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/de-rham-lisse-sheaf` (definition): De Rham lisse Ẑ_p-sheaves -/

-- LisseZpSheaf.IsDeRham (other): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.IsDeRham.associated (data): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.IsDeRham.tensor (structure): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.IsDeRham.point (compatibility): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.IsDeRham.pullback (functoriality): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.IsDeRham.constant (test, degenerate): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.IsDeRham.tate (test, computation): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.IsDeRham.point_compat (test, compatibility): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).
-- LisseZpSheaf.IsDeRham.non_example (test, non-example): not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves` (theorem): H^i(X_k̄, L) ⊗ B_dR^+ ≅ H^i(X_k̄, L ⊗ B_dR^+) for proper smooth X -/

-- etaleToBdrPlusComparisonForLisseSheaves: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/de-rham-comparison-for-de-rham-lisse-sheaves` (theorem): Hodge–de Rham degeneration and H^i(X_k̄, L) ⊗ B_dR ≅ H^i_dR(X, E) ⊗ B_dR for de Rham L -/

-- deRhamComparisonForDeRhamLisseSheaves: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application` (application): Application of CP.3–CP.4: the proper-smooth de Rham/semistable comparison realised by the period sheaves, with tensor compatibility -/

-- properSmoothDeRhamComparisonApplication: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/relative-completed-structure-sheaf-computations` (lemma): Completed-tensor computations for a proper smooth f: X → Y with toric charts -/

-- relativeCompletedStructureSheafComputations: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/relative-pushforward-of-graded-structural-sheaf` (lemma): (Rf_*A) ⊗_{O_Y} gr⁰OB_dR,Y ≅ Rf_*(A ⊗_{O_X} gr⁰OB_dR,X) for proper smooth f -/

-- relativePushforwardOfGradedStructuralSheaf: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison` (theorem): R^if_*(L ⊗ B_dR,X^+) ≅ R^if_*L ⊗ B_dR,Y^+ for proper smooth f -/

-- relativeBdrPlusLocalSystemComparison: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/relative-de-rham-comparison` (theorem): Relative de Rham comparison: R^if_*L is de Rham with associated R^if_dR*(E) (Gauss–Manin) -/

-- relativeDeRhamComparison: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

/-! ### `PadicHodgeTheory:P8/degree-one-abelian-comparison` (theorem): Degree-one comparison for abelian families: R¹f_*Ẑ_p ⊗ OB_dR,S ≅ H¹_dR(A/S) ⊗ OB_dR,S -/

-- degreeOneAbelianComparison: not stated; needs the pro-étale site of a smooth adic space (AdicEtaleGeometry A1), the sheaves B_dR^+, OB_dR^+, OB_dR of P8:local-rational as sheaves, and sheaf cohomology and derived direct images on it (ClassicalAdicEtaleCohomology H0).

end

end PartB

end

/-! # Layers R06.1 and R06.2: period rings, period functors and admissibility -/

section

open scoped PadicComplex Isocrystal

section PartC

variable (p : ℕ) [hp : Fact p.Prime]

/-! ## R06.1 — period rings -/

/-! ### R06.1/cp-integers-p-adically-complete -/

/-- `p` is not a unit of `𝓞_ℂ_[p]`. -/
theorem padicComplexInt_not_isUnit_p : ¬ IsUnit (p : 𝓞_ℂ_[p]) := sorry

instance factNotIsUnitPadicComplexInt : Fact (¬ IsUnit (p : 𝓞_ℂ_[p])) :=
  ⟨padicComplexInt_not_isUnit_p p⟩

/-- `𝓞_ℂ_[p]` is `p`-adically separated and complete. -/
theorem padicComplexInt_isAdicComplete : IsAdicComplete (Ideal.span {(p : 𝓞_ℂ_[p])}) 𝓞_ℂ_[p] :=
  sorry

instance isAdicCompletePadicComplexInt : IsAdicComplete (Ideal.span {(p : 𝓞_ℂ_[p])}) 𝓞_ℂ_[p] :=
  padicComplexInt_isAdicComplete p

/-- Frobenius is surjective on `𝓞_ℂ_[p]/p`, so Mathlib's `surjective_fontaineTheta` applies. -/
theorem padicComplexInt_frobenius_surjective :
    Function.Surjective (frobenius (ModP 𝓞_ℂ_[p] p) p) := sorry

/-! ### R06.1/galois-action-on-cp -/

/-- `G_{ℚ_p} = Gal(Q̄_p/Q_p)` with Mathlib's Krull topology. -/
abbrev GalQp := PadicAlgCl p ≃ₐ[ℚ_[p]] PadicAlgCl p

/-- `G_K ⊆ G_{Q_p}` for a finite extension `K ⊆ Q̄_p` of `Q_p` (the fixing subgroup of `K`). -/
abbrev GalK (K : IntermediateField ℚ_[p] (PadicAlgCl p)) := ↥(K.fixingSubgroup)

/-- The inclusion `G_K → G_{Q_p}`. -/
def GalK.toGalQp (K : IntermediateField ℚ_[p] (PadicAlgCl p)) : GalK p K →* GalQp p :=
  K.fixingSubgroup.subtype

/-- Restriction `G_L → G_K` for `K ≤ L`. -/
def GalK.restrict {K L : IntermediateField ℚ_[p] (PadicAlgCl p)} (h : K ≤ L) : GalK p L →* GalK p K :=
  Subgroup.inclusion (IntermediateField.fixingSubgroup_le h)

/-- The continuous extension `σ ↦ σ̂` of the Galois action to `ℂ_[p]`. -/
def galoisActionCp : GalQp p →* (ℂ_[p] ≃+* ℂ_[p]) := sorry

theorem galoisActionCp_coe (σ : GalQp p) (x : PadicAlgCl p) :
    galoisActionCp p σ (x : ℂ_[p]) = ((σ x : PadicAlgCl p) : ℂ_[p]) := sorry

theorem norm_galoisActionCp (σ : GalQp p) (x : ℂ_[p]) : ‖galoisActionCp p σ x‖ = ‖x‖ := sorry

theorem continuous_galoisActionCp :
    Continuous (fun q : GalQp p × ℂ_[p] => galoisActionCp p q.1 q.2) := sorry

theorem galoisActionCp_injective : Function.Injective (galoisActionCp p) := sorry

theorem galoisActionCp_range (f : ℂ_[p] ≃+* ℂ_[p]) (hf : Continuous f)
    (hQ : ∀ x : ℚ_[p], f (algebraMap ℚ_[p] ℂ_[p] x) = algebraMap ℚ_[p] ℂ_[p] x) :
    ∃ σ, galoisActionCp p σ = f := sorry

theorem galoisActionCp_mem_integers (σ : GalQp p) (x : ℂ_[p]) :
    galoisActionCp p σ x ∈ 𝓞_ℂ_[p] ↔ x ∈ 𝓞_ℂ_[p] := sorry

theorem galoisActionCp_cyclotomic (σ : GalQp p) (n : ℕ) (ζ : ℂ_[p]) (hζ : ζ ^ p ^ n = 1) :
    galoisActionCp p σ ζ =
      ζ ^ ((cyclotomicCharacter ℂ_[p] p (galoisActionCp p σ)).val.toZModPow n).val := sorry

/-- The tilt `O_C^♭ = PreTilt 𝓞_ℂ_[p] p`. -/
abbrev TiltCp := PreTilt 𝓞_ℂ_[p] p

/-- The induced action on the tilt. -/
def galoisActionPreTilt : GalQp p →* (TiltCp p ≃+* TiltCp p) := sorry

theorem fontaineTheta_galoisAction (σ : GalQp p) (w : WittVector p (TiltCp p)) :
    ((WittVector.fontaineTheta 𝓞_ℂ_[p] p
        (WittVector.map ((galoisActionPreTilt p σ : TiltCp p ≃+* TiltCp p) : TiltCp p →+* TiltCp p) w) :
          𝓞_ℂ_[p]) : ℂ_[p]) =
      galoisActionCp p σ ((WittVector.fontaineTheta 𝓞_ℂ_[p] p w : 𝓞_ℂ_[p]) : ℂ_[p]) := sorry

/-- Test `galoisActionCp_id` (degenerate). -/
example : galoisActionCp p 1 = 1 := by sorry

/-- Test `galoisActionCp_restrict` (compatibility). -/
example (σ : GalQp p) (x : PadicAlgCl p) :
    galoisActionCp p σ (x : ℂ_[p]) = ((σ x : PadicAlgCl p) : ℂ_[p]) := by sorry

/-- Test `galoisActionCp_zeta` (computation). -/
example (σ : GalQp p) (ζ : ℂ_[p]) (hζ : ζ ^ p = 1) :
    galoisActionCp p σ ζ =
      ζ ^ ((cyclotomicCharacter ℂ_[p] p (galoisActionCp p σ)).val.toZModPow 1).val := by sorry

/-- Test `galoisActionCp_not_discrete` (non-example): the action of `G_{ℚ_p}` on `ℂ_[p]` is not
discrete — some element has a non-open stabilizer. -/
example : ∃ x : ℂ_[p], ¬ IsOpen {σ : GalQp p | galoisActionCp p σ x = x} := by sorry

/-! ### R06.1/semilinear-galois-descent, ax-sen-lemma, ax-sen-tate-invariants -/

/-- Ax–Sen–Tate (`R06.1/ax-sen-tate-invariants`, case `H = G_K`): `ℂ_[p]^{G_K} = K`. -/
theorem ax_sen_tate (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K]
    (x : ℂ_[p]) (hx : ∀ σ : GalK p K, galoisActionCp p (GalK.toGalQp p K σ) x = x) :
    ∃ a : K, x = ((a : PadicAlgCl p) : ℂ_[p]) := sorry

-- semilinear-galois-descent: not stated as a single declaration; needs a Mathlib notion of
-- semilinear Galois representation on a vector space (Hilbert 90 for GL_n; Mathlib has only the
-- rank-one case `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`).
-- ax-sen-lemma: not stated; needs the conjugate-distance function Δ_E on algebraic elements.

/-! ### R06.1/tate-sen-theorem (with tate-trace-almost-surjective, tate-sen-axioms-cyclotomic,
tate-sen-vanishing-on-hk as its lemma nodes) -/

/-- Tate–Sen, degree 0, for the cyclotomic twists: `ℂ_[p](r)^{G_K} = 0` for `r ≠ 0`. -/
theorem tate_sen_twist_invariants (K : IntermediateField ℚ_[p] (PadicAlgCl p))
    [FiniteDimensional ℚ_[p] K] (r : ℤ) (hr : r ≠ 0) (x : ℂ_[p])
    (hx : ∀ σ : GalK p K,
      galoisActionCp p (GalK.toGalQp p K σ) x =
        ((((cyclotomicCharacter ℂ_[p] p (galoisActionCp p (GalK.toGalQp p K σ)) : ℤ_[p]ˣ) : ℤ_[p])
          : ℚ_[p]) : ℂ_[p]) ^ (-r) * x) :
    x = 0 := sorry

-- tate-sen-theorem (general η and H^1): not stated as a declaration here; needs the topological
-- `G_K`-representation `ℂ_[p](η)` as a `TopRep` to apply Mathlib's `continuousCohomology`.

/-! ### R06.1/tilt-of-cp-and-special-elements -/

/-- A compatible system `(ζ_{p^n})` of primitive `p`-power roots of unity in `𝓞_ℂ_[p]`. -/
structure CompatibleRootsOfUnity where
  ζ : ℕ → 𝓞_ℂ_[p]
  zero : ζ 0 = 1
  one_ne : ζ 1 ≠ 1
  pow_succ : ∀ n, ζ (n + 1) ^ p = ζ n

/-- A compatible system `(p^{1/p^n})` of `p`-power roots of `p` in `𝓞_ℂ_[p]`. -/
structure CompatibleRootsOfP where
  π : ℕ → 𝓞_ℂ_[p]
  zero : π 0 = p
  pow_succ : ∀ n, π (n + 1) ^ p = π n

/-- The valuation `v^♭` on the tilt (Mathlib `PreTilt.val`). -/
abbrev TiltCp.val : Valuation (TiltCp p) NNReal :=
  PreTilt.val ℂ_[p] (PadicComplex.valued p).v 𝓞_ℂ_[p] (PadicComplexInt.integers p) p

/-- `ε = (1, ζ_p, ζ_{p^2}, …) ∈ O_C^♭`. -/
def epsilonFlat (z : CompatibleRootsOfUnity p) : TiltCp p := sorry

/-- `p^♭ = (p, p^{1/p}, …) ∈ O_C^♭`. -/
def pFlat (z : CompatibleRootsOfP p) : TiltCp p := sorry

theorem untilt_epsilonFlat (z : CompatibleRootsOfUnity p) : PreTilt.untilt (epsilonFlat p z) = 1 :=
  sorry

theorem untilt_pFlat (z : CompatibleRootsOfP p) : PreTilt.untilt (pFlat p z) = (p : 𝓞_ℂ_[p]) := sorry

/-- `v^♭(ε − 1) = p/(p − 1)`, written multiplicatively: `|ε − 1|^♭ = p^{−p/(p−1)}`. -/
theorem val_epsilonFlat_sub_one (z : CompatibleRootsOfUnity p) :
    TiltCp.val p (epsilonFlat p z - 1) = (p : NNReal) ^ (-((p : ℝ) / ((p : ℝ) - 1))) := sorry

-- galois_epsilonFlat: not stated; needs the Z_p-module structure on the 1-units of TiltCp p
-- (g(ε) = ε^{χ(g)}).
-- epsilonFlat_change: not stated; needs the same Z_p-power structure (ε_{ζ^a} = ε_ζ^a).

/-- Test `untilt_epsilonFlat_eq_one` (computation). -/
example (z : CompatibleRootsOfUnity p) : PreTilt.untilt (epsilonFlat p z) = 1 := by sorry

/-- Test `epsilonFlat_ne_one` (non-example). -/
example (z : CompatibleRootsOfUnity p) : epsilonFlat p z ≠ 1 := by sorry

/-- Test `val_pFlat_eq_one` (computation): `v^♭(p^♭) = 1`, i.e. `|p^♭|^♭ = p^{-1}`. -/
example (z : CompatibleRootsOfP p) : TiltCp.val p (pFlat p z) = (p : NNReal)⁻¹ := by sorry

/-- Test `tiltCp_compat_tilt` (compatibility): Mathlib's `Tilt` of `ℂ_[p]` is the fraction field of
`TiltCp p`. -/
example [Fact ((PadicComplex.valued p).v (p : ℂ_[p]) ≠ 1)] :
    Tilt ℂ_[p] (PadicComplex.valued p).v 𝓞_ℂ_[p] (PadicComplexInt.integers p) p =
      FractionRing (TiltCp p) := rfl

/-! ### R06.1/explicit-generator-of-ker-theta -/

/-- `ξ = [p^♭] − p ∈ A_inf`. -/
def xiAinf (z : CompatibleRootsOfP p) : WittVector p (TiltCp p) :=
  WittVector.teichmuller p (pFlat p z) - (p : WittVector p (TiltCp p))

/-- `ker θ = (ξ)`. -/
theorem ker_fontaineTheta_eq_span_xi (z : CompatibleRootsOfP p) :
    RingHom.ker (WittVector.fontaineTheta 𝓞_ℂ_[p] p) = Ideal.span {xiAinf p z} := sorry

/-! ### R06.1/bdr-plus-of-perfectoid-affinoid-algebras -/

section Affinoid

variable (Rp : Type*) [CommRing Rp] [Fact (¬ IsUnit (p : Rp))] [IsAdicComplete (Ideal.span {(p : Rp)}) Rp]

/-- `B_dR^+(R, R^+)`: Mathlib's `BDeRhamPlus R^+ p` (Scholze, Definition 6.1; the perfectoid
affinoid hypothesis enters the theorems below, not the construction). -/
abbrev bdRPlusAffinoid := BDeRhamPlus Rp p

/-- The element `ξ = [π] − Σ_{i≥1} p^i [x_i]` of `W(K^{♭+})`. -/
def xiAffinoid (π : PreTilt Rp p) (x : ℕ → PreTilt Rp p) : WittVector p (PreTilt Rp p) := sorry

-- xiAffinoid_generates: not stated; needs the perfectoid affinoid (K, K^+)-algebra predicate of
-- PerfectoidSpaces P1 (PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras).

/-- `Fil^i B_dR(R, R^+) = ξ^i B_dR^+(R, R^+)` (as an ideal of `B_dR^+` for `i ≥ 0`). -/
def filAffinoid (i : ℕ) : Ideal (bdRPlusAffinoid p Rp) := sorry

/-- `gr^i B_dR(R, R^+)`. -/
abbrev grAffinoid (i : ℕ) :=
  ↥(filAffinoid p Rp i) ⧸
    Submodule.comap (Submodule.subtype (filAffinoid p Rp i)) (filAffinoid p Rp (i + 1))

-- bdRPlusAffinoid_functorial: not stated; needs functoriality of `BDeRhamPlus` in the ring
-- (maps of `PreTilt`, `WittVector.map` and `AdicCompletion.map`).

end Affinoid

/-- `bdRPlusAffinoid_eq_bdRPlus_C`: the case `(C, O_C)` is `BdRPlus`. -/
theorem bdRPlusAffinoid_eq_bdRPlus_C : bdRPlusAffinoid p 𝓞_ℂ_[p] = BDeRhamPlus 𝓞_ℂ_[p] p := rfl

/-- Test `bdRPlusAffinoid_C` (compatibility). -/
example : bdRPlusAffinoid p 𝓞_ℂ_[p] = BDeRhamPlus 𝓞_ℂ_[p] p := rfl

-- grAffinoid_zero (degenerate): not stated; needs `θ : B_dR^+(R, R^+) → R` (the analogue of
-- `thetaDR` for general `R`).
-- xiAffinoid_mem_ker (computation): not stated; needs the explicit choice of the `x_i` in terms of
-- `π♯ = p·u` (decomposition node, proof step 1).
-- grAffinoid_not_split_equivariantly (non-example): not stated; see
-- `bdRPlus_no_equivariant_section` for the case (C, O_C).

/-! ### R06.1/de-rham-period-ring -/

/-- `A_inf[1/p]`. -/
abbrev AinfInvP := Localization.Away (p : WittVector p (TiltCp p))

/-- `B_dR^+ := BDeRhamPlus 𝓞_ℂ_[p] p` (Mathlib). -/
abbrev BdRPlus := BDeRhamPlus 𝓞_ℂ_[p] p

/-- `B_dR := BDeRham 𝓞_ℂ_[p] p` (Mathlib). -/
abbrev BdR := BDeRham 𝓞_ℂ_[p] p

instance : Algebra (AinfInvP p) (BdRPlus p) :=
  inferInstanceAs
    (Algebra (AinfInvP p) (AdicCompletion (RingHom.ker (fontaineThetaInvertP 𝓞_ℂ_[p] p)) (AinfInvP p)))

/-- Mathlib's `BDeRham` carries no ring structure at the pinned commit; it is transported here from
the underlying localisation. -/
instance : CommRing (BdR p) := by unfold BdR BDeRham; infer_instance

instance : Algebra (BdRPlus p) (BdR p) := by unfold BdR BDeRham; infer_instance

/-- `B_dR^+` and `B_dR` as `Q_p`-algebras (through `A_inf[1/p]`, in which `p` is inverted). -/
instance : Algebra ℚ_[p] (BdRPlus p) := sorry

instance : Algebra ℚ_[p] (BdR p) := sorry

instance : IsScalarTower ℚ_[p] (BdRPlus p) (BdR p) := sorry

/-- `A_inf → B_dR^+`. -/
def ainfToBdRPlus : WittVector p (TiltCp p) →+* BdRPlus p :=
  (algebraMap (AinfInvP p) (BdRPlus p)).comp (algebraMap _ (AinfInvP p))

/-- `θ_dR : B_dR^+ → ℂ_[p]`. -/
def thetaDR : BdRPlus p →+* ℂ_[p] := sorry

theorem thetaDR_surjective : Function.Surjective (thetaDR p) := sorry

theorem thetaDR_coe (w : WittVector p (TiltCp p)) :
    thetaDR p (ainfToBdRPlus p w) = ((WittVector.fontaineTheta 𝓞_ℂ_[p] p w : 𝓞_ℂ_[p]) : ℂ_[p]) := sorry

/-- The filtration `Fil^i B_dR = ξ^i B_dR^+`. -/
def filBdR (i : ℤ) : Submodule (BdRPlus p) (BdR p) := sorry

/-- The filtration is decreasing, exhaustive and separated (reindexed by `i ↦ −i` it is a Mathlib
`IsFiltration`). -/
theorem filBdR_isFiltration :
    Antitone (filBdR p) ∧ (⨆ i, filBdR p i) = ⊤ ∧ (⨅ i, filBdR p i) = ⊥ := sorry

/-- The Galois action on `B_dR^+`. -/
instance galoisActionBdR : MulSemiringAction (GalQp p) (BdRPlus p) := sorry

/-- The Galois action on `B_dR`. -/
instance galoisActionBdRField : MulSemiringAction (GalQp p) (BdR p) := sorry

-- bdR_functorial_C: not stated; needs `BDeRhamPlus` for an arbitrary algebraically closed complete
-- field C and functoriality of `PreTilt`, `WittVector.map` and `AdicCompletion` in one package.
-- bdR_independent_of_K: not stated; it is the remark that `BdRPlus p` involves no K (only the group
-- `GalK p K` acting through `GalK.toGalQp`).

/-- Test `thetaDR_teichmuller` (computation). -/
example (x : TiltCp p) :
    thetaDR p (ainfToBdRPlus p (WittVector.teichmuller p x)) = ((PreTilt.untilt x : 𝓞_ℂ_[p]) : ℂ_[p]) := by
  sorry

/-- Test `filBdR_zero` (degenerate). -/
example : filBdR p 0 = LinearMap.range (Algebra.linearMap (BdRPlus p) (BdR p)) := by sorry

/-- Test `bdRPlus_eq_mathlib` (compatibility). -/
example : BdRPlus p = BDeRhamPlus 𝓞_ℂ_[p] p := rfl

/-- Test `bdRPlus_not_field` (non-example). -/
example : ¬ IsField (BdRPlus p) := by sorry

/-- Test `bdRPlus_no_equivariant_section` (non-example). -/
example : ¬ ∃ s : ℂ_[p] →+* BdRPlus p, (∀ x, thetaDR p (s x) = x) ∧
    ∀ (σ : GalQp p) (x : ℂ_[p]), s (galoisActionCp p σ x) = σ • s x := by sorry

/-! ### R06.1/bdr-plus-complete-dvr -/

theorem ainfInvP_to_bdRPlus_injective :
    Function.Injective (algebraMap (AinfInvP p) (BdRPlus p)) := sorry

instance bdRPlus_isDomain : IsDomain (BdRPlus p) := sorry

theorem bdRPlus_isDiscreteValuationRing : IsDiscreteValuationRing (BdRPlus p) := sorry

theorem bdR_isFractionRing : IsFractionRing (BdRPlus p) (BdR p) := sorry

/-! ### R06.1/bdr-natural-topology -/

/-- The natural topology on `A_inf[1/p]` (basis `U_{N,a}`). -/
instance naturalTopologyAinfInvP : TopologicalSpace (AinfInvP p) := sorry

/-- The natural (inverse-limit) topology on `B_dR^+`. -/
instance naturalTopologyBdRPlus : TopologicalSpace (BdRPlus p) := sorry

theorem continuousSMul_galois_bdRPlus : ContinuousSMul (GalQp p) (BdRPlus p) := sorry

theorem isClosedEmbedding_mul_xi (u : BdRPlus p) (hu : Ideal.span {u} = RingHom.ker (thetaDR p)) :
    Topology.IsClosedEmbedding (fun x : BdRPlus p => u * x) := sorry

theorem continuous_thetaDR : Continuous (thetaDR p) := sorry

theorem isClosed_ainf : IsClosed (Set.range (ainfToBdRPlus p)) := sorry

/-- Test `naturalTopology_theta_quotient` (compatibility). -/
example : Topology.IsQuotientMap (thetaDR p) := by sorry

/-- Test `naturalTopology_p_pow_tendsto_zero` (computation). -/
example : Filter.Tendsto (fun n : ℕ => (p : BdRPlus p) ^ n) Filter.atTop (nhds 0) := by sorry

/-- Test `naturalTopology_xi_pow_not_tendsto_zero` (non-example): `([p^♭]/p)^n ↛ 0`. -/
example (z : CompatibleRootsOfP p) :
    ¬ Filter.Tendsto
      (fun n : ℕ => (ainfToBdRPlus p (WittVector.teichmuller p (pFlat p z)) * Ring.inverse (p : BdRPlus p)) ^ n)
      Filter.atTop (nhds 0) := by sorry

-- naturalTopology_W_k_padic (degenerate): not stated; needs the embedding W(k̄) → A_inf for the
-- residue field k̄ of ℂ_[p] (Teichmüller lifts of the residue field inside TiltCp p).

/-! ### R06.1/algebraic-closure-in-bdr-plus -/

/-- The Hensel lift `Q̄_p → B_dR^+` of the inclusion `Q̄_p ⊆ ℂ_[p]`. -/
def kbarToBdRPlus : PadicAlgCl p →+* BdRPlus p := sorry

theorem thetaDR_kbarToBdRPlus (x : PadicAlgCl p) : thetaDR p (kbarToBdRPlus p x) = (x : ℂ_[p]) := sorry

theorem kbarToBdRPlus_galois (σ : GalQp p) (x : PadicAlgCl p) :
    kbarToBdRPlus p (σ x) = σ • kbarToBdRPlus p x := sorry

/-! ### R06.1/fontaine-element-t -/

/-- `Z_p → B_dR^+` (through `W(k̄)[1/p]`). -/
def zpToBdRPlus : ℤ_[p] →+* BdRPlus p := sorry

/-- `t = log[ε]`. -/
def fontaineT (z : CompatibleRootsOfUnity p) : BdRPlus p := sorry

theorem thetaDR_fontaineT (z : CompatibleRootsOfUnity p) : thetaDR p (fontaineT p z) = 0 := sorry

theorem fontaineT_isUniformizer (z : CompatibleRootsOfUnity p) :
    Ideal.span {fontaineT p z} = RingHom.ker (thetaDR p) := sorry

theorem galois_fontaineT (σ : GalQp p) (z : CompatibleRootsOfUnity p) :
    σ • fontaineT p z =
      zpToBdRPlus p ((cyclotomicCharacter ℂ_[p] p (galoisActionCp p σ) : ℤ_[p]ˣ) : ℤ_[p]) *
        fontaineT p z := sorry

-- fontaineT_change: not stated; needs Z_p-powers of compatible systems of roots of unity.

/-- `x ↦ log[x]` on `U_R = {x : x^♯ = 1}`. -/
def logTeichmuller : {x : TiltCp p // PreTilt.untilt x = 1} → BdRPlus p := sorry

/-- `log[x^n] = n log[x]` (the `ℕ`-case; the `Z_p`-case needs Z_p-powers on `U_R`). -/
theorem logTeichmuller_zpow (x : {x : TiltCp p // PreTilt.untilt x = 1}) (n : ℕ) :
    logTeichmuller p ⟨x.1 ^ n, by rw [map_pow, x.2, one_pow]⟩ = (n : BdRPlus p) * logTeichmuller p x :=
  sorry

-- zpTwistLine: not stated; needs the Z_p-module structure on B_dR^+ (Z_p t ≅ Z_p(1)).

/-- Test `fontaineT_ne_zero` (non-example). -/
example (z : CompatibleRootsOfUnity p) : fontaineT p z ≠ 0 := by sorry

/-- Test `galois_fontaineT_cyclotomic` (computation). -/
example (σ : GalQp p) (z : CompatibleRootsOfUnity p)
    (h : ((cyclotomicCharacter ℂ_[p] p (galoisActionCp p σ) : ℤ_[p]ˣ) : ℤ_[p]) = -1) :
    σ • fontaineT p z = -fontaineT p z := by sorry

/-- Test `fontaineT_trivial_character` (degenerate). -/
example (σ : GalQp p) (z : CompatibleRootsOfUnity p)
    (h : cyclotomicCharacter ℂ_[p] p (galoisActionCp p σ) = 1) : σ • fontaineT p z = fontaineT p z := by
  sorry

/-- Test `fontaineT_div_xi_unit` (compatibility). -/
example (z : CompatibleRootsOfUnity p) (zP : CompatibleRootsOfP p) :
    ∃ u : (BdRPlus p)ˣ, fontaineT p z = u * ainfToBdRPlus p (xiAinf p zP) := by sorry

/-! ### R06.1/bdr-filtration-and-graded and R06.1/de-rham-invariants -/

theorem filBdR_eq_fontaineT_pow (z : CompatibleRootsOfUnity p) (i : ℕ) :
    filBdR p i = Submodule.span (BdRPlus p) {algebraMap (BdRPlus p) (BdR p) (fontaineT p z ^ i)} := sorry

/-- `B_dR^{G_K} = K`. -/
theorem bdR_invariants (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K]
    (x : BdRPlus p) (hx : ∀ σ : GalK p K, GalK.toGalQp p K σ • x = x) :
    ∃ a : K, x = kbarToBdRPlus p (a : PadicAlgCl p) := sorry

/-! ### R06.1/hodge-tate-period-ring -/

/-- `B_HT = ⊕ ℂ_[p](q)`, modelled on Laurent polynomials in `t` (the twisted action is the
`galoisActionBHT` instance). -/
abbrev BHT := LaurentPolynomial ℂ_[p]

/-- `c·t^q`. -/
def BHT.single (q : ℤ) (c : ℂ_[p]) : BHT p := LaurentPolynomial.C c * LaurentPolynomial.T q

/-- With the model above the choice of `t` is built in. -/
def BHT.laurentEquiv : BHT p ≃+* LaurentPolynomial ℂ_[p] := RingEquiv.refl _

/-- The twisted Galois action `g(c t^n) = g(c) χ(g)^n t^n`. -/
instance galoisActionBHT : MulSemiringAction (GalQp p) (BHT p) := sorry

theorem BHT.invariants_eq (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K]
    (x : BHT p) :
    (∀ σ : GalK p K, GalK.toGalQp p K σ • x = x) ↔
      ∃ a : K, x = LaurentPolynomial.C ((a : PadicAlgCl p) : ℂ_[p]) := sorry

theorem BHT.frac_invariants_eq (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K]
    (a b : BHT p) (hb : b ≠ 0)
    (h : ∀ σ : GalK p K, (GalK.toGalQp p K σ • a) * b = a * (GalK.toGalQp p K σ • b)) :
    ∃ c : K, a = LaurentPolynomial.C ((c : PadicAlgCl p) : ℂ_[p]) * b := sorry

theorem BHT.isDomain : IsDomain (BHT p) := sorry

/-- Test `BHT_invariants_degree_zero` (computation): no nonzero invariant in degree 1. -/
example (c : ℂ_[p]) (h : ∀ σ : GalQp p, σ • BHT.single p 1 c = BHT.single p 1 c) : c = 0 := by sorry

/-- Test `BHT_unit_single` (degenerate). -/
example (c : ℂ_[p]) : BHT.single p 0 c = LaurentPolynomial.C c := by sorry

-- BHT_eq_gr_BdR (compatibility): not stated; needs the associated graded ring of `filBdR`
-- (Mathlib's `GradedRing` of a filtration is not available for this non-indexed filtration).

/-- Test `BHT_not_field` (non-example). -/
example : ¬ IsField (BHT p) := by sorry

/-! ### R06.1/acris-embedding-into-bdr-plus -/

/-- `A^0_cris = A_inf[ξ^m/m!] ⊆ A_inf[1/p]`: a concrete stand-in for the divided-power envelope
supplied by CrystallineCohomology CR.0 (R06.1/arithmetic-and-perfectoid-constructions-agree
identifies the two). -/
def AcrisZero : Subalgebra (WittVector p (TiltCp p)) (AinfInvP p) :=
  Algebra.adjoin _ {x | ∃ (a : WittVector p (TiltCp p)) (m : ℕ),
    WittVector.fontaineTheta 𝓞_ℂ_[p] p a = 0 ∧
      x = Ring.inverse (m.factorial : AinfInvP p) * (algebraMap _ (AinfInvP p) a) ^ m}

/-- `A_cris`, the `p`-adic completion of `A^0_cris`. -/
abbrev Acris := AdicCompletion (Ideal.span {(p : AcrisZero p)}) (AcrisZero p)

/-- `A_inf → A_cris`. -/
def ainfToAcris : WittVector p (TiltCp p) →+* Acris p := sorry

/-- The divided power `γ_m(ξ) = ξ^m/m! ∈ A_cris`. -/
def dividedPowerXi (zP : CompatibleRootsOfP p) (m : ℕ) : Acris p := sorry

/-- `θ_cris : A_cris → 𝓞_ℂ_[p]`. -/
def thetaCris : Acris p →+* 𝓞_ℂ_[p] := sorry

/-- The Galois action on `A_cris`. -/
instance galoisActionAcris : MulSemiringAction (GalQp p) (Acris p) := sorry

/-- The structure map `j : A_cris → B_dR^+`. -/
def acrisToBdRPlus : Acris p →+* BdRPlus p := sorry

-- acrisToBdRPlus_continuous: not stated; needs the p-adic topology instance on `Acris p`
-- (an `AdicCompletion`), together with `naturalTopologyBdRPlus`.

theorem acrisToBdRPlus_divided_power (zP : CompatibleRootsOfP p) (m : ℕ) :
    acrisToBdRPlus p (dividedPowerXi p zP m) =
      Ring.inverse (m.factorial : BdRPlus p) * ainfToBdRPlus p (xiAinf p zP) ^ m := sorry

theorem thetaDR_comp_acrisToBdRPlus (a : Acris p) :
    thetaDR p (acrisToBdRPlus p a) = ((thetaCris p a : 𝓞_ℂ_[p]) : ℂ_[p]) := sorry

theorem acrisToBdRPlus_galois (σ : GalQp p) (a : Acris p) :
    acrisToBdRPlus p (σ • a) = σ • acrisToBdRPlus p a := sorry

-- acrisToBdRPlus_range: not stated; needs convergent series Σ a_n ξ^n/n! in `BdRPlus p` for the
-- discrete-valuation topology.

/-- Test `acrisToBdRPlus_one` (degenerate). -/
example : acrisToBdRPlus p 1 = 1 := by sorry

/-- Test `acrisToBdRPlus_xi_sq` (computation). -/
example (zP : CompatibleRootsOfP p) :
    acrisToBdRPlus p (dividedPowerXi p zP 2) = Ring.inverse 2 * ainfToBdRPlus p (xiAinf p zP) ^ 2 := by
  sorry

/-- Test `acrisToBdRPlus_theta` (compatibility): on `A_inf`, `θ_cris` is Mathlib's `fontaineTheta`. -/
example (w : WittVector p (TiltCp p)) :
    thetaDR p (acrisToBdRPlus p (ainfToAcris p w)) = ((WittVector.fontaineTheta 𝓞_ℂ_[p] p w : 𝓞_ℂ_[p]) : ℂ_[p]) := by
  sorry

/-- The element `t ∈ A_cris` (R06.1/t-in-acris). -/
def acrisT (z : CompatibleRootsOfUnity p) : Acris p := sorry

/-- Test `acrisToBdRPlus_not_into_ainf` (non-example). -/
example (z : CompatibleRootsOfUnity p) :
    acrisToBdRPlus p (acrisT p z) ∉ Set.range (algebraMap (AinfInvP p) (BdRPlus p)) := by sorry

/-! ### R06.1/acris-embedding-injective and R06.1/t-in-acris -/

theorem acrisToBdRPlus_injective : Function.Injective (acrisToBdRPlus p) := sorry

theorem acrisToBdRPlus_acrisT (z : CompatibleRootsOfUnity p) :
    acrisToBdRPlus p (acrisT p z) = fontaineT p z := sorry

theorem acrisT_pow_pred_mem (z : CompatibleRootsOfUnity p) :
    acrisT p z ^ (p - 1) ∈ Ideal.span {(p : Acris p)} := sorry

/-! ### R06.1/frobenius-on-acris -/

/-- Frobenius on `A_cris`. -/
def acrisFrobenius : Acris p →+* Acris p := sorry

theorem acrisFrobenius_teichmuller (x : TiltCp p) :
    acrisFrobenius p (ainfToAcris p (WittVector.teichmuller p x)) =
      ainfToAcris p (WittVector.teichmuller p (x ^ p)) := sorry

theorem acrisFrobenius_t (z : CompatibleRootsOfUnity p) :
    acrisFrobenius p (acrisT p z) = (p : Acris p) * acrisT p z := sorry

/-- `B_cris^+ = A_cris[1/p]`. -/
abbrev BcrisPlus := Localization.Away (p : Acris p)

/-- `B_cris = A_cris[1/t]`, localising at all the elements `t_ζ` (they differ by units). -/
abbrev Bcris := Localization (Submonoid.closure {x : Acris p | ∃ z, x = acrisT p z})

/-- Frobenius on `B_cris`. -/
def bcrisFrobenius : Bcris p →+* Bcris p := sorry

/-- The Galois action on `B_cris`. -/
instance Bcris.galoisAction : MulSemiringAction (GalQp p) (Bcris p) := sorry

theorem bcrisFrobenius_galois (σ : GalQp p) (b : Bcris p) :
    bcrisFrobenius p (σ • b) = σ • bcrisFrobenius p b := sorry

-- bcrisFrobenius_semilinear: not stated; needs the algebra map W(k̄)[1/p] → B_cris for the residue
-- field k̄ of ℂ_[p].

/-- The filtration `Fil^i B_cris = B_cris ∩ Fil^i B_dR`. -/
def Bcris.fil (i : ℤ) : AddSubgroup (Bcris p) := sorry

theorem bcrisFrobenius_not_filtered :
    ¬ ∀ x ∈ Bcris.fil p 1, bcrisFrobenius p x ∈ Bcris.fil p 1 := sorry

/-- `Bcris.frobenius`, the Frobenius of `B_cris` as its structure map. -/
abbrev Bcris.frobenius := bcrisFrobenius p

theorem Bcris.t_mem (z : CompatibleRootsOfUnity p) : IsUnit (algebraMap (Acris p) (Bcris p) (acrisT p z)) :=
  sorry

/-- `B_cris ⊆ B_dR`. -/
def bcrisToBdR : Bcris p →+* BdR p := sorry

/-- `B_cris^+ ⊆ B_dR^+`. -/
def bcrisPlusToBdRPlus : BcrisPlus p →+* BdRPlus p := sorry

theorem Bcris_subset_BdR : Function.Injective (bcrisToBdR p) := sorry

-- Bcris.algebraK0ur: not stated; needs W(k̄)[1/p] ⊆ A_inf[1/p] (Teichmüller lifts of k̄).
-- Bcris.independent_of_K: the remark that `Bcris p` involves no K; nothing to state.

/-- Test `Bcris_invariants_computation` (computation): `B_cris^{G_{Q_p}} = Q_p`. -/
example (b : Bcris p) (hb : ∀ σ : GalQp p, σ • b = b) :
    ∃ a : ℚ_[p], bcrisToBdR p b = algebraMap (BdRPlus p) (BdR p) (kbarToBdRPlus p (algebraMap ℚ_[p] _ a)) := by
  sorry

/-- Test `Bcris_t_inv` (degenerate). -/
example (z : CompatibleRootsOfUnity p) :
    IsUnit (algebraMap (Acris p) (Bcris p) (acrisT p z)) := by sorry

/-- Test `BcrisPlus_subset_BdRPlus` (compatibility). -/
example : Function.Injective (bcrisPlusToBdRPlus p) := by sorry

/-- Test `Bcris_ne_BdR` (non-example): `bcrisToBdR` is not surjective. -/
example : ¬ Function.Surjective (bcrisToBdR p) := by sorry

/-- Test `Bcris_not_field` (non-example). -/
example : ¬ IsField (Bcris p) := by sorry

/-- Test `acrisFrobenius_one` (degenerate). -/
example : acrisFrobenius p 1 = 1 := by sorry

/-- Test `acrisFrobenius_xi` (computation). -/
example (zP : CompatibleRootsOfP p) :
    acrisFrobenius p (ainfToAcris p (xiAinf p zP)) =
      ainfToAcris p (WittVector.teichmuller p (pFlat p zP) ^ p - (p : WittVector p (TiltCp p))) := by sorry

/-- Test `acrisFrobenius_witt_compat` (compatibility). -/
example (w : WittVector p (TiltCp p)) :
    acrisFrobenius p (ainfToAcris p w) = ainfToAcris p (WittVector.frobenius w) := by sorry

/-- Test `acrisFrobenius_not_theta_compatible` (non-example). -/
example (zP : CompatibleRootsOfP p) :
    thetaCris p (acrisFrobenius p (ainfToAcris p (xiAinf p zP))) ≠ thetaCris p (ainfToAcris p (xiAinf p zP)) := by
  sorry

/-! ### R06.1/fundamental-exact-sequence (with its lemma nodes on A_cris) -/

/-- The Frobenius on `B_cris^+`. -/
def bcrisPlusFrobenius : BcrisPlus p →+* BcrisPlus p := sorry

/-- `(Fil^0 B_cris)^{φ = 1} = Q_p`: a `φ`-fixed element of `B_cris` lying in `B_dR^+` is in `Q_p`. -/
theorem fundamental_exact_sequence_left (b : Bcris p) (hφ : bcrisFrobenius p b = b)
    (hfil : b ∈ Bcris.fil p 0) :
    ∃ a : ℚ_[p], bcrisToBdR p b = algebraMap (BdRPlus p) (BdR p) (kbarToBdRPlus p (algebraMap ℚ_[p] _ a)) :=
  sorry

/-- `B_dR = B_cris^{φ=1} + B_dR^+` (surjectivity in the fundamental exact sequence). -/
theorem fundamental_exact_sequence_right (x : BdR p) :
    ∃ b : Bcris p, bcrisFrobenius p b = b ∧
      x - bcrisToBdR p b ∈ Set.range (algebraMap (BdRPlus p) (BdR p)) := sorry

/-- `φ − 1` is surjective on `B_cris`. -/
theorem bcrisFrobenius_sub_one_surjective : Function.Surjective (fun b : Bcris p => bcrisFrobenius p b - b) :=
  sorry

/-! ### R06.1/bmax-period-ring and R06.1/k-tensor-bmax-injective -/

/-- `A^0_max = A_inf[ξ/p]`. -/
def AmaxZero (zP : CompatibleRootsOfP p) : Subalgebra (WittVector p (TiltCp p)) (AinfInvP p) :=
  Algebra.adjoin _ {Ring.inverse (p : AinfInvP p) * algebraMap _ (AinfInvP p) (xiAinf p zP)}

/-- `A_max`. -/
abbrev Amax (zP : CompatibleRootsOfP p) := AdicCompletion (Ideal.span {(p : AmaxZero p zP)}) (AmaxZero p zP)

/-- `B_max^+ = A_max[1/p]`. -/
abbrev BmaxPlus (zP : CompatibleRootsOfP p) := Localization.Away (p : Amax p zP)

def bmaxPlusToBdRPlus (zP : CompatibleRootsOfP p) : BmaxPlus p zP →+* BdRPlus p := sorry

def acrisToAmax (zP : CompatibleRootsOfP p) : Acris p →+* Amax p zP := sorry

theorem acrisToAmax_comp (zP : CompatibleRootsOfP p) (a : Acris p) :
    bmaxPlusToBdRPlus p zP (algebraMap _ _ (acrisToAmax p zP a)) = acrisToBdRPlus p a := sorry

def bmaxFrobenius (zP : CompatibleRootsOfP p) : Amax p zP →+* Amax p zP := sorry

-- bmaxPlusK_equiv: not stated; needs B_max,K^+ for a finite extension K (the O_K-version of A_max).

/-- Colmez, Proposition 8.14 (case `K = K_0`): `B_max^+ → B_dR^+` is injective. -/
theorem bmaxPlusToBdRPlus_injective (zP : CompatibleRootsOfP p) :
    Function.Injective (bmaxPlusToBdRPlus p zP) := sorry

/-- Test `Amax_xi_div_p` (computation). -/
example (zP : CompatibleRootsOfP p) :
    Ring.inverse (p : AinfInvP p) * algebraMap _ (AinfInvP p) (xiAinf p zP) ∈ AmaxZero p zP := by sorry

/-- Test `Amax_contains_ainf` (degenerate). -/
example (zP : CompatibleRootsOfP p) (w : WittVector p (TiltCp p)) :
    algebraMap _ (AinfInvP p) w ∈ AmaxZero p zP := by sorry

/-- Test `acrisToAmax_divided_power` (compatibility). -/
example (zP : CompatibleRootsOfP p) (n : ℕ) :
    bmaxPlusToBdRPlus p zP (algebraMap _ _ (acrisToAmax p zP (dividedPowerXi p zP n))) =
      Ring.inverse (n.factorial : BdRPlus p) * ainfToBdRPlus p (xiAinf p zP) ^ n := by sorry

/-- Test `xi_mem_p_Amax_not_Acris` (non-example). -/
example (zP : CompatibleRootsOfP p) :
    ainfToAcris p (xiAinf p zP) ∉ Ideal.span {(p : Acris p)} := by sorry

/-! ### R06.1/k-tensor-bcris-injective -/

/-- `B_cris` as a `Q_p`-algebra (through `A_inf[1/p]`). -/
instance : Algebra ℚ_[p] (Bcris p) := sorry

/-- `K ⊗ B_cris → B_dR` is injective, stated for `K` totally ramified over `Q_p` (so that `K_0 = Q_p`
and `K ⊗_{K_0} B_cris = K ⊗_{Q_p} B_cris`); for general `K` replace `Q_p` by `K_0`. -/
theorem k_tensor_bcris_injective (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K]
    (f : TensorProduct ℚ_[p] K (Bcris p) →ₗ[ℚ_[p]] BdR p)
    (hf : ∀ (a : K) (b : Bcris p), f (a ⊗ₜ b) =
      algebraMap (BdRPlus p) (BdR p) (kbarToBdRPlus p (a : PadicAlgCl p)) * bcrisToBdR p b) :
    Function.Injective f := sorry

/-! ### R06.1/crystalline-logarithm -/

def logCris : Additive (TiltCp p)ˣ →+ BcrisPlus p := sorry

theorem logCris_mul (x y : (TiltCp p)ˣ) :
    logCris p (Additive.ofMul (x * y)) = logCris p (Additive.ofMul x) + logCris p (Additive.ofMul y) := sorry

theorem frobenius_logCris (x : (TiltCp p)ˣ) :
    bcrisPlusFrobenius p (logCris p (Additive.ofMul x)) = (p : BcrisPlus p) * logCris p (Additive.ofMul x) := sorry

/-- The Galois action on `B_cris^+`. -/
instance galoisActionBcrisPlus : MulSemiringAction (GalQp p) (BcrisPlus p) := sorry

theorem logCris_galois (σ : GalQp p) (x : (TiltCp p)ˣ) :
    logCris p (Additive.ofMul (Units.map ((galoisActionPreTilt p σ : TiltCp p ≃+* TiltCp p) : TiltCp p →* TiltCp p) x)) =
      σ • logCris p (Additive.ofMul x) := sorry

-- logCris_epsilon: not stated; needs ε as a unit of TiltCp p and the map t ∈ A_cris → B_cris^+.
-- logCris_eq_logDR: not stated; needs the logarithm of 1-units of B_dR^+ and log on 𝓞_{Q̄_p}^×.

/-- Test `logCris_one` (degenerate). -/
example : logCris p (Additive.ofMul 1) = 0 := by sorry

-- logCris_epsilon_eq_t (computation): not stated; needs ε as a unit (see logCris_epsilon).
-- logCris_compat_logDR_units (compatibility): not stated; needs the B_dR^+-logarithm on U_R.
-- logCris_not_extend_nonunits (non-example): not stated; it is R06.1/log-p-flat-transcendental.

/-! ### R06.1/semistable-period-ring -/

/-- `B_st = B_cris[u]`. -/
abbrev Bst := Polynomial (Bcris p)

/-- `u = λ_st(p^♭)`. -/
def Bst.u : Bst p := Polynomial.X

/-- `λ_st : (C^♭)^× → B_st`. -/
def Bst.logSt : Additive (FractionRing (TiltCp p))ˣ →+ Bst p := sorry

/-- `φ` on `B_st`: `φ(b u^n) = φ(b) p^n u^n`. -/
def Bst.frobenius : Bst p →+* Bst p :=
  Polynomial.eval₂RingHom (Polynomial.C.comp (bcrisFrobenius p)) (Polynomial.C (p : Bcris p) * Polynomial.X)

/-- `N = −d/du` (Fontaine's normalisation `N(u) = −1`). -/
def Bst.monodromy : Bst p →ₗ[Bcris p] Bst p := -Polynomial.derivative

theorem Bst.monodromy_frobenius (x : Bst p) :
    Bst.monodromy p (Bst.frobenius p x) = (p : Bcris p) • Bst.frobenius p (Bst.monodromy p x) := sorry

/-- The Galois action on `B_st` (`g(u) = u + c(g)t`). -/
instance Bst.galoisAction : MulSemiringAction (GalQp p) (Bst p) := sorry

/-- The Kummer cocycle of `p`: `g(p^♭) = p^♭ ε^{c(g)}`. -/
def kummerCocycle (zP : CompatibleRootsOfP p) (z : CompatibleRootsOfUnity p) : GalQp p → ℤ_[p] := sorry

/-- `Z_p → B_cris`. -/
def zpToBcris : ℤ_[p] →+* Bcris p := sorry

theorem Bst.galois_u (zP : CompatibleRootsOfP p) (z : CompatibleRootsOfUnity p) (σ : GalQp p) :
    σ • Bst.u p = Bst.u p + Polynomial.C (zpToBcris p (kummerCocycle p zP z σ) *
      algebraMap (Acris p) (Bcris p) (acrisT p z)) := sorry

theorem Bst.monodromy_galois (σ : GalQp p) (x : Bst p) :
    Bst.monodromy p (σ • x) = σ • Bst.monodromy p x := sorry

theorem Bst.ker_monodromy :
    LinearMap.ker (Bst.monodromy p) = LinearMap.range (Algebra.linearMap (Bcris p) (Bst p)) := sorry

theorem Bst.monodromy_surjective : Function.Surjective (Bst.monodromy p) := sorry

-- Bst.universal: not stated; needs Sym_Q((C^♭)^×) and the universal property of B-C Def. 9.2.3.

/-- Test `Bst_monodromy_u` (computation). -/
example : Bst.monodromy p (Bst.u p) = -1 := by sorry

/-- Test `Bst_monodromy_bcris` (degenerate). -/
example (b : Bcris p) : Bst.monodromy p (Polynomial.C b) = 0 := by sorry

/-- Test `Bst_frobenius_restrict` (compatibility). -/
example (b : Bcris p) : Bst.frobenius p (Polynomial.C b) = Polynomial.C (bcrisFrobenius p b) := by sorry

/-- Test `Bst_not_bcris` (non-example). -/
example : Bst.u p ∉ Set.range (Polynomial.C : Bcris p →+* Bst p) := by sorry

/-- Test `Bst_sign_convention` (characterisation): Brinon–Conrad's operator `d/du` is `−N`. -/
example : -Bst.monodromy p = (Polynomial.derivative : Bst p →ₗ[Bcris p] Bst p) := by sorry

/-! ### R06.1/bst-embedding-into-bdr, log-extension-to-kbar, log-p-flat-transcendental,
k-tensor-bst-injective -/

/-- `log([p^♭]/p) ∈ B_dR^+`. -/
def logPFlatDR (zP : CompatibleRootsOfP p) : BdRPlus p := sorry

/-- `ι : B_st → B_dR` with Iwasawa's `log p = 0`. -/
def bstToBdR (zP : CompatibleRootsOfP p) : Bst p →+* BdR p :=
  Polynomial.eval₂RingHom (bcrisToBdR p) (algebraMap (BdRPlus p) (BdR p) (logPFlatDR p zP))

theorem bstToBdR_u (zP : CompatibleRootsOfP p) :
    bstToBdR p zP (Bst.u p) = algebraMap (BdRPlus p) (BdR p) (logPFlatDR p zP) := sorry

theorem bstToBdR_bcris (zP : CompatibleRootsOfP p) (b : Bcris p) :
    bstToBdR p zP (Polynomial.C b) = bcrisToBdR p b := sorry

theorem bstToBdR_galois (zP : CompatibleRootsOfP p) (σ : GalQp p) (x : Bst p) :
    bstToBdR p zP (σ • x) = σ • bstToBdR p zP x := sorry

-- bstToBdR_range_independent: not stated; needs the family of embeddings for log p ∈ K_0.
-- bstToBdR_fil: the filtration pulled back along bstToBdR; see `filBdR`.

/-- `K ⊗ B_st → B_dR` is injective; the `K = Q_p` case. -/
theorem bstToBdR_injective (zP : CompatibleRootsOfP p) : Function.Injective (bstToBdR p zP) := sorry

/-- `log([p^♭]/p)` is not algebraic over `B_cris` inside `B_dR`. -/
theorem logPFlatDR_transcendental (zP : CompatibleRootsOfP p) (f : Polynomial (Bcris p)) (hf : f ≠ 0) :
    Polynomial.eval₂ (bcrisToBdR p) (algebraMap (BdRPlus p) (BdR p) (logPFlatDR p zP)) f ≠ 0 := sorry

/-- Test `bstToBdR_u_mod_fil2` (computation): `ι(u) − ξ/p ∈ Fil^2`. -/
example (zP : CompatibleRootsOfP p) :
    bstToBdR p zP (Bst.u p) -
      algebraMap (BdRPlus p) (BdR p) (ainfToBdRPlus p (xiAinf p zP) * Ring.inverse (p : BdRPlus p)) ∈ filBdR p 2 := by
  sorry

/-- Test `bstToBdR_one` (degenerate). -/
example (zP : CompatibleRootsOfP p) : bstToBdR p zP 1 = 1 := by sorry

-- bstToBdR_theta (compatibility): not stated; needs θ_dR on the image of `bstToBdR` inside
-- B_dR^+ (the element log([p^♭]/p) lies in B_dR^+ with θ_dR = log p = 0).

-- bstToBdR_not_frobenius (non-example): not stated; B_dR carries no Frobenius to compare with.

/-! ### R06.1/crystalline-semistable-invariants and R06.1/period-ring-invariants -/

/-- `B_st^{G_{Q_p}} = Q_p`. -/
theorem bst_invariants (zP : CompatibleRootsOfP p) (x : Bst p) (hx : ∀ σ : GalQp p, σ • x = x) :
    ∃ a : ℚ_[p], bstToBdR p zP x = algebraMap (BdRPlus p) (BdR p) (kbarToBdRPlus p (algebraMap ℚ_[p] _ a)) :=
  sorry

/-! ### R06.1/arithmetic-and-perfectoid-constructions-agree -/

/-- Fontaine's `R = lim_{x ↦ x^p} 𝓞_{Q̄_p}/p` is the tilt of `𝓞_ℂ_[p]`. -/
theorem fontaine_R_equiv_tilt [Fact (¬ IsUnit (p : ↥(integralClosure ℤ_[p] (PadicAlgCl p))))] :
    Nonempty (PreTilt ↥(integralClosure ℤ_[p] (PadicAlgCl p)) p ≃+* TiltCp p) := sorry

/-! ## R06.2 — period functors and admissibility -/

/-! ### R06.2/regular-period-ring -/

/-- `(F, G)`-regular rings (Brinon–Conrad Definition 5.1.1). The condition `(Frac B)^G = B^G` is
phrased without the fraction field: an invariant fraction `a/b` lies in `B^G`. -/
structure IsRegularPeriodRing (F G B : Type*) [Field F] [Group G] [CommRing B] [Algebra F B]
    [MulSemiringAction G B] : Prop where
  isDomain : IsDomain B
  frac_invariants : ∀ a b : B, b ≠ 0 → (∀ g : G, (g • a) * b = a * (g • b)) →
    ∃ c : B, (∀ g : G, g • c = c) ∧ a = c * b
  unit_of_stable_line : ∀ b : B, b ≠ 0 → (∀ g : G, ∃ c : F, g • b = algebraMap F B c * b) → IsUnit b

section Regular

variable {F G B : Type*} [Field F] [Group G] [CommRing B] [Algebra F B] [MulSemiringAction G B]

-- IsRegularPeriodRing.unit_of_stable_line: the structure field above.

theorem IsRegularPeriodRing.of_isField (hB : IsField B) : IsRegularPeriodRing F G B := sorry

/-- A nonzero `G`-invariant element of a regular ring is a unit (so `B^G` is a field). -/
theorem IsRegularPeriodRing.invariants_isField (h : IsRegularPeriodRing F G B) (b : B) (hb : b ≠ 0)
    (hinv : ∀ g : G, g • b = b) : IsUnit b := sorry

/-- A `G`-stable `F`-line `F b` defines a character `η : G → Fˣ` with `g • b = η(g) b`. -/
theorem IsRegularPeriodRing.character_of_stable_line (h : IsRegularPeriodRing F G B)
    [FaithfulSMul F B] (b : B) (hb : b ≠ 0) (hst : ∀ g : G, ∃ c : F, g • b = algebraMap F B c * b) :
    ∃ η : G →* Fˣ, ∀ g : G, g • b = algebraMap F B (η g) * b := sorry

/-- Test `isRegularPeriodRing_field` (degenerate). -/
example (L : Type*) [Field L] [Algebra F L] [MulSemiringAction G L] : IsRegularPeriodRing F G L := by sorry

end Regular

/-- Test `isRegularPeriodRing_BdR` (compatibility). -/
example : IsRegularPeriodRing ℚ_[p] (GalQp p) (BdR p) := by sorry

/-- Test `not_isRegularPeriodRing_BdRPlus` (non-example). -/
example : ¬ IsRegularPeriodRing ℚ_[p] (GalQp p) (BdRPlus p) := by sorry

-- isRegularPeriodRing_polynomial_trivial (computation): not stated; needs the trivial
-- `MulSemiringAction` of a group on `Polynomial F` (not an instance in Mathlib).

/-! ### R06.2/admissibility-dimension-bound and R06.2/admissible-category-tannakian -/

section Formalism

variable {F G B V : Type*} [Field F] [Group G] [CommRing B] [Algebra F B] [AddCommGroup V]
  [Module F V]

/-- `D_B(V) = (B ⊗_F V)^G`. -/
def periodFunctor (ρB : Representation F G B) (ρV : Representation F G V) :
    Submodule F (TensorProduct F B V) :=
  (ρB.tprod ρV).invariants

/-- `B`-admissibility, with `E = B^G` finite over `F`: `dim_E D_B(V) = dim_F V`, i.e.
`dim_F D_B(V) = [E : F] · dim_F V`. -/
def IsAdmissible (E : Type*) [Field E] [Algebra F E] (ρB : Representation F G B)
    (ρV : Representation F G V) : Prop :=
  Module.finrank F (periodFunctor ρB ρV) = Module.finrank F E * Module.finrank F V

/-- `dim_E D_B(V) ≤ dim_F V` for a regular ring. -/
theorem admissibility_dimension_bound [MulSemiringAction G B] (E : Type*) [Field E] [Algebra F E]
    [Algebra E B] [FiniteDimensional F V] (ρB : Representation F G B) (ρV : Representation F G V)
    (hreg : IsRegularPeriodRing F G B) (hρ : ∀ g b, ρB g b = g • b)
    (hE : ∀ b : B, (∀ g : G, g • b = b) ↔ b ∈ Set.range (algebraMap E B)) :
    Module.finrank F (periodFunctor ρB ρV) ≤ Module.finrank F E * Module.finrank F V := sorry

end Formalism

/-! ### R06.2/period-functors -/

section Functors

variable (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K]
  {V : Type*} [AddCommGroup V] [Module ℚ_[p] V] [FiniteDimensional ℚ_[p] V]
  (ρV : Representation ℚ_[p] (GalK p K) V)

/-- The maximal unramified subextension `K_0 ⊆ K`. -/
def K0 (K : IntermediateField ℚ_[p] (PadicAlgCl p)) : IntermediateField ℚ_[p] (PadicAlgCl p) := sorry

/-- `B_HT`, `B_dR`, `B_cris`, `B_st` as `Q_p`-representations of `G_K`. -/
def repBHT : Representation ℚ_[p] (GalK p K) (BHT p) := sorry
def repBdR : Representation ℚ_[p] (GalK p K) (BdR p) := sorry
def repBcris : Representation ℚ_[p] (GalK p K) (Bcris p) := sorry
def repBst : Representation ℚ_[p] (GalK p K) (Bst p) := sorry

theorem repBdR_apply (g : GalK p K) (b : BdR p) : repBdR p K g b = GalK.toGalQp p K g • b := sorry

/-- `D_HT(V)`. -/
def DHT : Submodule ℚ_[p] (TensorProduct ℚ_[p] (BHT p) V) := periodFunctor (repBHT p K) ρV
/-- `D_dR(V)`. -/
def DdR : Submodule ℚ_[p] (TensorProduct ℚ_[p] (BdR p) V) := periodFunctor (repBdR p K) ρV
/-- `D_cris(V)`. -/
def Dcris : Submodule ℚ_[p] (TensorProduct ℚ_[p] (Bcris p) V) := periodFunctor (repBcris p K) ρV
/-- `D_st(V)`. -/
def Dst : Submodule ℚ_[p] (TensorProduct ℚ_[p] (Bst p) V) := periodFunctor (repBst p K) ρV

/-- The comparison map `α_V : B_dR ⊗_K D_dR(V) → B_dR ⊗ V` (here with `Q_p`-coefficients on the
source, followed by the multiplication map). -/
def comparisonMap :
    TensorProduct ℚ_[p] (BdR p) (DdR p K ρV) →ₗ[ℚ_[p]] TensorProduct ℚ_[p] (BdR p) V := sorry

theorem Dcris_eq_Dst_ker_monodromy :
    (Dcris p K ρV).map
        (TensorProduct.map ((Algebra.linearMap (Bcris p) (Bst p)).restrictScalars ℚ_[p]) LinearMap.id) =
      Dst p K ρV ⊓
        LinearMap.ker (TensorProduct.map ((Bst.monodromy p).restrictScalars ℚ_[p]) (LinearMap.id : V →ₗ[ℚ_[p]] V)) :=
  sorry

def Dst_to_DdR (zP : CompatibleRootsOfP p) :
    TensorProduct ℚ_[p] K (Dst p K ρV) →ₗ[ℚ_[p]] DdR p K ρV := sorry

theorem Dst_to_DdR_injective (zP : CompatibleRootsOfP p) : Function.Injective (Dst_to_DdR p K ρV zP) :=
  sorry

-- DB_map: functoriality of `periodFunctor` in `V` (a `G`-equivariant linear map induces a map of
-- invariants); not stated separately: it is `Submodule.map` of `LinearMap.lTensor` restricted to
-- invariants.
-- DdR_twist: not stated; needs the Tate twist `V(n)` as a representation (tensor with the
-- cyclotomic character of `GalK p K`).

/-- The filtration `Fil^i D_dR(V)`. -/
def DdR.fil (i : ℤ) : Submodule ℚ_[p] (TensorProduct ℚ_[p] (BdR p) V) :=
  DdR p K ρV ⊓ Submodule.map (TensorProduct.map ((filBdR p i).restrictScalars ℚ_[p]).subtype LinearMap.id) ⊤

/-- `V_cris(D)` and `V_st(D)` are `Q_p`-subspaces of `B_cris ⊗ D`, `B_st ⊗ D`; stated for an
abstract `D` with its structures in `R06.2/filtered-phi-n-modules`. -/
def Vcris (D : Type*) [AddCommGroup D] [Module ℚ_[p] D] : Submodule ℚ_[p] (TensorProduct ℚ_[p] (Bcris p) D) :=
  sorry

def Vst (D : Type*) [AddCommGroup D] [Module ℚ_[p] D] : Submodule ℚ_[p] (TensorProduct ℚ_[p] (Bst p) D) :=
  sorry

-- DdR_contravariant: not stated; needs `Representation.dual` and `Hom_{Q_p[G]}(V, B_dR)`.

/-- Hodge–Tate multiplicity `m_h(V) = dim_K gr^{−h} D_dR(V)` (convention `HT(χ) = +1`). -/
def hodgeTateMultiplicity (h : ℤ) : ℕ :=
  (Module.finrank ℚ_[p] (DdR.fil p K ρV (-h)) - Module.finrank ℚ_[p] (DdR.fil p K ρV (-h + 1))) /
    Module.finrank ℚ_[p] K

-- hodgeTateMultiplicity_eq_BC: not stated; needs `D_HT` graded pieces `(C(−h) ⊗ V)^{G_K}` as
-- separate submodules.

/-- Test `DdR_trivial` (degenerate): `D_dR` of the trivial one-dimensional representation has
`Q_p`-dimension `[K : Q_p]`. -/
example : Module.finrank ℚ_[p] (DdR p K (1 : Representation ℚ_[p] (GalK p K) ℚ_[p])) = Module.finrank ℚ_[p] K := by
  sorry

-- DdR_tate_twist (computation): not stated; needs `Q_p(1)` as a representation of `GalK p K`.
-- Dcris_trivial_compat_isocrystal (compatibility): not stated; needs the isocrystal structure on
-- `Dcris` for a residue field `k` with `K_0 = K(p, k)`.
-- DHT_nonHT_character (non-example): not stated; needs the character ⟨χ⟩^s as a representation.
-- Dcris_ne_DdR_ramified (non-example): not stated; needs `K0 p K ≠ K` for ramified `K`.

/-! ### R06.2/admissible-representations -/

def IsHodgeTate : Prop := IsAdmissible K (repBHT p K) ρV
def IsDeRham : Prop := IsAdmissible K (repBdR p K) ρV
def IsCrystalline : Prop := IsAdmissible (K0 p K) (repBcris p K) ρV
def IsSemistable : Prop := IsAdmissible (K0 p K) (repBst p K) ρV

/-- Potentially semistable: semistable after restriction to `G_L` for a finite `L ⊇ K`. -/
def IsPotentiallySemistable : Prop :=
  ∃ (L : IntermediateField ℚ_[p] (PadicAlgCl p)) (h : K ≤ L), FiniteDimensional ℚ_[p] L ∧
    IsAdmissible (K0 p L) (repBst p L) (ρV.comp (GalK.restrict p h))

theorem isDeRham_iff_comparison_bijective :
    IsDeRham p K ρV ↔ Function.Surjective (comparisonMap p K ρV) := sorry

theorem IsCrystalline.sub (W : Submodule ℚ_[p] V) (hW : ∀ g, W ≤ W.comap (ρV g))
    (h : IsCrystalline p K ρV) :
    IsCrystalline p K (ρV.subrepresentation W hW) := sorry

-- IsDeRham.tensor: not stated; needs the tensor product of two representations of `GalK p K` on
-- possibly different spaces, which is `Representation.tprod`; stated form:
theorem IsDeRham.tensor {W : Type*} [AddCommGroup W] [Module ℚ_[p] W] [FiniteDimensional ℚ_[p] W]
    (ρW : Representation ℚ_[p] (GalK p K) W) (hV : IsDeRham p K ρV) (hW : IsDeRham p K ρW) :
    IsDeRham p K (ρV.tprod ρW) := sorry

/-- Test `isCrystalline_trivial` (degenerate). -/
example : IsCrystalline p K (1 : Representation ℚ_[p] (GalK p K) ℚ_[p]) := by sorry

-- isCrystalline_tateTwist (computation): not stated; needs `Q_p(n)` as a representation.

/-- Test `isDeRham_of_isCrystalline` (compatibility). -/
example (h : IsCrystalline p K ρV) : IsDeRham p K ρV := by sorry

-- not_isHodgeTate_nonalgebraic (non-example): not stated; needs the character ⟨χ⟩^s.

/-! ### Named theorems of R06.2 on representations -/

/-- `R06.2/de-rham-implies-hodge-tate`. -/
theorem isHodgeTate_of_isDeRham (h : IsDeRham p K ρV) : IsHodgeTate p K ρV := sorry

/-- `R06.2/crystalline-semistable-de-rham-implications`: crystalline ⇒ semistable ⇒ de Rham. -/
theorem isSemistable_of_isCrystalline (h : IsCrystalline p K ρV) : IsSemistable p K ρV := sorry

theorem isDeRham_of_isSemistable (h : IsSemistable p K ρV) : IsDeRham p K ρV := sorry

/-- `R06.2/de-rham-base-change`: de Rham is insensitive to finite extensions. -/
theorem isDeRham_restrict_iff {L : IntermediateField ℚ_[p] (PadicAlgCl p)} (h : K ≤ L)
    [FiniteDimensional ℚ_[p] L] :
    IsAdmissible L (repBdR p L) (ρV.comp (GalK.restrict p h)) ↔ IsDeRham p K ρV := sorry

/-- `R06.2/hodge-tate-decomposition-tate` (2): finite image ⇒ `ℂ_[p] ⊗ V` is trivial, stated as
`ℂ_[p]`-admissibility of `V` for the ring `ℂ_[p]` with `E = K`. -/
theorem isAdmissible_Cp_of_finite_image (repCp : Representation ℚ_[p] (GalK p K) ℂ_[p])
    (hfin : Set.Finite (Set.range ρV)) : IsAdmissible K repCp ρV := sorry

end Functors

/-! ### R06.2/filtered-vector-spaces -/

/-- A finite-dimensional filtered vector space: a decreasing, exhaustive, separated `Z`-filtration. -/
structure FilteredSpace (F : Type*) [Field F] (D : Type*) [AddCommGroup D] [Module F D] where
  fil : ℤ → Submodule F D
  antitone : Antitone fil
  exhaustive : ∃ i, fil i = ⊤
  separated : ∃ i, fil i = ⊥

namespace FilteredSpace

variable {F : Type*} [Field F] {D D' : Type*} [AddCommGroup D] [Module F D] [AddCommGroup D'] [Module F D']

/-- Filtered morphisms. -/
structure Hom (A : FilteredSpace F D') (B : FilteredSpace F D) where
  toLinearMap : D' →ₗ[F] D
  map_fil : ∀ i, (A.fil i).map toLinearMap ≤ B.fil i

/-- Strict morphisms: `T(Fil^i D') = Fil^i D ∩ T(D')`. -/
def IsStrict {A : FilteredSpace F D'} {B : FilteredSpace F D} (T : Hom A B) : Prop :=
  ∀ i, (A.fil i).map T.toLinearMap = B.fil i ⊓ LinearMap.range T.toLinearMap

/-- The shift `D[n]`, `Fil^i(D[n]) = Fil^{i+n} D`. -/
def shift (A : FilteredSpace F D) (n : ℤ) : FilteredSpace F D where
  fil i := A.fil (i + n)
  antitone := fun _ _ h => A.antitone (by omega)
  exhaustive := by obtain ⟨i, hi⟩ := A.exhaustive; exact ⟨i - n, by simpa using hi⟩
  separated := by obtain ⟨i, hi⟩ := A.separated; exact ⟨i - n, by simpa using hi⟩

/-- The graded piece `gr^i D = Fil^i / Fil^{i+1}`. -/
abbrev gr (A : FilteredSpace F D) (i : ℤ) :=
  ↥(A.fil i) ⧸ (A.fil (i + 1)).comap (A.fil i).subtype

/-- The unit object `F[0]`. -/
def unit : FilteredSpace F F where
  fil i := if i ≤ 0 then ⊤ else ⊥
  antitone := sorry
  exhaustive := ⟨0, by simp⟩
  separated := ⟨1, by simp⟩

/-- Tensor product filtration `Fil^n = Σ_{a+b=n} Fil^a ⊗ Fil^b`. -/
def tensor (A : FilteredSpace F D) (B : FilteredSpace F D') : FilteredSpace F (TensorProduct F D D') := sorry

/-- Dual filtration `Fil^i D^∨ = (Fil^{1−i} D)^⊥`. -/
def dual (A : FilteredSpace F D) : FilteredSpace F (Module.Dual F D) := sorry

/-- Short exact sequences in `Fil_F`: exact with the subspace filtration on the kernel and the
quotient filtration on the cokernel. -/
structure ShortExact {D'' : Type*} [AddCommGroup D''] [Module F D''] (A : FilteredSpace F D')
    (B : FilteredSpace F D) (C : FilteredSpace F D'') (f : D' →ₗ[F] D) (g : D →ₗ[F] D'') : Prop where
  injective : Function.Injective f
  surjective : Function.Surjective g
  exact : LinearMap.range f = LinearMap.ker g
  sub : ∀ i, (A.fil i).map f = B.fil i ⊓ LinearMap.range f
  quot : ∀ i, (B.fil i).map g = C.fil i

theorem isIso_iff_gr [FiniteDimensional F D] {A B : FilteredSpace F D} (T : Hom A B)
    (hT : Function.Bijective T.toLinearMap) :
    IsStrict T ↔ ∀ i, Module.finrank F (A.fil i) = Module.finrank F (B.fil i) := sorry

-- FilteredSpace.isModuleFiltration: not stated; Mathlib's `IsModuleFiltration` is indexed increasingly by a
-- filtered ring; the reindexed family `i ↦ fil (−i)` over the trivially filtered `F` is meant.

end FilteredSpace

/-- Test `filteredSpace_unit_dual` (degenerate): `F[0]^∨` has its unique jump at `0`. -/
example : ((FilteredSpace.unit (F := ℚ_[p])).dual.fil 0) = ⊤ ∧
    ((FilteredSpace.unit (F := ℚ_[p])).dual.fil 1) = ⊥ := by sorry

/-- Test `filteredSpace_bijective_not_iso` (non-example). -/
example : ∃ (A B : FilteredSpace ℚ_[p] (Fin 2 → ℚ_[p])) (T : FilteredSpace.Hom A B),
    Function.Bijective T.toLinearMap ∧ ¬ FilteredSpace.IsStrict T := by sorry

/-- Test `filteredSpace_gr_dim` (computation). -/
example (A : FilteredSpace ℚ_[p] (Fin 2 → ℚ_[p])) (h0 : A.fil 0 = ⊤)
    (h1 : A.fil 1 = Submodule.span ℚ_[p] {Pi.single 0 1}) (h2 : A.fil 2 = ⊥) :
    Module.finrank ℚ_[p] (A.gr 0) = 1 ∧ Module.finrank ℚ_[p] (A.gr 1) = 1 := by sorry

/-- Test `filteredSpace_mathlib_filtration` (compatibility): the filtration is antitone. -/
example (A : FilteredSpace ℚ_[p] (Fin 2 → ℚ_[p])) : Antitone A.fil := A.antitone

/-! ### R06.2/hodge-number-tH -/

section Hodge

variable {F : Type*} [Field F] {D D' : Type*} [AddCommGroup D] [Module F D] [AddCommGroup D']
  [Module F D']

/-- `t_H(D) = Σ_i i · dim gr^i D`. -/
def hodgeNumber (A : FilteredSpace F D) : ℤ :=
  ∑ᶠ i : ℤ, i * ((Module.finrank F (A.fil i) : ℤ) - Module.finrank F (A.fil (i + 1)))

-- hodgeNumber_det: not stated; needs the top exterior power of a filtered space with the quotient
-- filtration from `D^{⊗ d}`.

theorem hodgeNumber_dual [FiniteDimensional F D] (A : FilteredSpace F D) :
    hodgeNumber A.dual = -hodgeNumber A := sorry

theorem hodgeNumber_tensor [FiniteDimensional F D] [FiniteDimensional F D'] (A : FilteredSpace F D)
    (B : FilteredSpace F D') :
    hodgeNumber (A.tensor B) =
      (Module.finrank F D : ℤ) * hodgeNumber B + (Module.finrank F D' : ℤ) * hodgeNumber A := sorry

theorem hodgeNumber_shortExact {D'' : Type*} [AddCommGroup D''] [Module F D''] [FiniteDimensional F D]
    (A : FilteredSpace F D') (B : FilteredSpace F D) (C : FilteredSpace F D'') (f : D' →ₗ[F] D)
    (g : D →ₗ[F] D'') (h : FilteredSpace.ShortExact A B C f g) :
    hodgeNumber B = hodgeNumber A + hodgeNumber C := sorry

theorem hodgeNumber_shift [FiniteDimensional F D] (A : FilteredSpace F D) (n : ℤ) :
    hodgeNumber (A.shift n) = hodgeNumber A - n * Module.finrank F D := sorry

theorem hodgeNumber_le_of_bijective [FiniteDimensional F D] {A B : FilteredSpace F D}
    (T : FilteredSpace.Hom A B) (hT : Function.Bijective T.toLinearMap) :
    hodgeNumber A ≤ hodgeNumber B ∧ (hodgeNumber A = hodgeNumber B ↔ FilteredSpace.IsStrict T) := sorry

/-- The weight `t_H(D)/dim D ∈ Q` (MordellLawrenceVenkatesh's filtration weight). -/
def hodgeWeight (A : FilteredSpace F D) : ℚ := hodgeNumber A / Module.finrank F D

end Hodge

/-- Test `hodgeNumber_unit` (degenerate). -/
example : hodgeNumber (FilteredSpace.unit (F := ℚ_[p])) = 0 := by sorry

/-- Test `hodgeNumber_elliptic` (computation). -/
example (A : FilteredSpace ℚ_[p] (Fin 2 → ℚ_[p])) (h0 : A.fil 0 = ⊤)
    (h1 : A.fil 1 = Submodule.span ℚ_[p] {Pi.single 0 1}) (h2 : A.fil 2 = ⊥)
    (hneg : ∀ i < 0, A.fil i = ⊤) (hbig : ∀ i > 2, A.fil i = ⊥) : hodgeNumber A = 1 := by sorry

-- hodgeNumber_tateTwist (compatibility): not stated; needs `DdR` of `Q_p(n)` as a `FilteredSpace`.

/-- Test `hodgeNumber_not_monotone_subobject` (non-example): two lines of the same filtered plane can
have different Hodge numbers. -/
example : ∃ (A : FilteredSpace ℚ_[p] (Fin 2 → ℚ_[p])) (B C : FilteredSpace ℚ_[p] ℚ_[p]),
    hodgeNumber B ≠ hodgeNumber C ∧ hodgeNumber A = 1 := by sorry

/-! ### R06.2/filtered-phi-n-modules -/

section PhiN

variable (k : Type*) [Field k] [CharP k p] [PerfectRing k p]
  (K : Type*) [Field K] [Algebra K(p, k) K]

/-- The Frobenius of a Mathlib isocrystal, with its carrier explicit. -/
abbrev phiD (D : Type*) [AddCommGroup D] [WittVector.Isocrystal p k D] : D ≃ᶠˡ[p, k] D :=
  WittVector.Isocrystal.frobenius p k

/-- A filtered `(φ, N)`-module over `K`: an isocrystal `D` over `K_0 = K(p, k)` (Mathlib), a
monodromy `N` with `Nφ = pφN`, and a filtration on `D_K = K ⊗_{K_0} D`. -/
structure FilteredPhiNModule (D : Type*) [AddCommGroup D] [WittVector.Isocrystal p k D] where
  N : D →ₗ[K(p, k)] D
  comm : ∀ x, N ((phiD p k D).toLinearMap x) = (p : K(p, k)) • (phiD p k D).toLinearMap (N x)
  fil : FilteredSpace K (TensorProduct K(p, k) K D)

variable {k K}

/-- Filtered `φ`-modules: `N = 0`. -/
abbrev FilteredPhiModule (D : Type*) [AddCommGroup D] [WittVector.Isocrystal p k D] :=
  {M : FilteredPhiNModule p k K D // M.N = 0}

namespace FilteredPhiNModule

variable {D D' : Type*} [AddCommGroup D] [WittVector.Isocrystal p k D] [AddCommGroup D']
  [WittVector.Isocrystal p k D']

/-- Morphisms of filtered `(φ, N)`-modules. -/
structure Hom (M : FilteredPhiNModule p k K D) (M' : FilteredPhiNModule p k K D') where
  toIsocrystalHom : WittVector.IsocrystalHom p k D D'
  comm_N : ∀ x, toIsocrystalHom.toLinearMap (M.N x) = M'.N (toIsocrystalHom.toLinearMap x)
  map_fil : ∀ i, (M.fil.fil i).map ((toIsocrystalHom.toLinearMap).baseChange K) ≤ M'.fil.fil i

/-- Subobjects: `φ`- and `N`-stable `K_0`-subspaces. -/
def IsSubobject (M : FilteredPhiNModule p k K D) (D₀ : Submodule K(p, k) D) : Prop :=
  (∀ x ∈ D₀, (phiD p k D).toLinearMap x ∈ D₀) ∧ ∀ x ∈ D₀, M.N x ∈ D₀

/-- The subobject with the induced filtration (on `K ⊗ D₀ ⊆ K ⊗ D`). -/
def sub (M : FilteredPhiNModule p k K D) (D₀ : Submodule K(p, k) D) :
    FilteredSpace K (TensorProduct K(p, k) K D₀) := sorry

/-- The quotient filtration on `K ⊗ (D/D₀)`. -/
def quot (M : FilteredPhiNModule p k K D) (D₀ : Submodule K(p, k) D) :
    FilteredSpace K (TensorProduct K(p, k) K (D ⧸ D₀)) := sorry

-- tensor, dual, twist, unit, det: the underlying isocrystal constructions (tensor product and dual
-- of Mathlib isocrystals, twist of the Frobenius by `p^{−i}`) are not in Mathlib; stated on the
-- filtered side:
/-- `FilteredPhiNModule.tensor`: the tensor filtration on `K ⊗ (D ⊗ D')`. -/
def tensor (M : FilteredPhiNModule p k K D) (M' : FilteredPhiNModule p k K D') :
    FilteredSpace K (TensorProduct K(p, k) K (TensorProduct K(p, k) D D')) := sorry
/-- `FilteredPhiNModule.dual`: the dual filtration on `K ⊗ D^∨`. -/
def dual (M : FilteredPhiNModule p k K D) : FilteredSpace K (TensorProduct K(p, k) K (Module.Dual K(p, k) D)) :=
  sorry
/-- `FilteredPhiNModule.twist`: `Fil^r(D⟨i⟩) = Fil^{r+i}(D)` (the Frobenius becomes `p^{−i}φ`). -/
def twist (M : FilteredPhiNModule p k K D) (i : ℤ) : FilteredSpace K (TensorProduct K(p, k) K D) :=
  M.fil.shift i
/-- `FilteredPhiNModule.unit`: `K_0[0]` with its filtration. -/
def unit : FilteredSpace K (TensorProduct K(p, k) K K(p, k)) := sorry
/-- `FilteredPhiNModule.det`: the filtration on `K ⊗ det D`. -/
def det (M : FilteredPhiNModule p k K D) :
    FilteredSpace K (TensorProduct K(p, k) K (ExteriorAlgebra K(p, k) D)) := sorry

/-- The underlying Mathlib isocrystal (`D` itself). -/
def toIsocrystal (_M : FilteredPhiNModule p k K D) : D ≃ᶠⁱ[p, k] D :=
  { LinearEquiv.refl K(p, k) D with frob_equivariant := fun _ => rfl }

theorem isIso_iff (M : FilteredPhiNModule p k K D) (M' : FilteredPhiNModule p k K D') (f : Hom p M M')
    (hf : Function.Bijective f.toIsocrystalHom.toLinearMap) :
    (∀ i, (M.fil.fil i).map ((f.toIsocrystalHom.toLinearMap).baseChange K) = M'.fil.fil i) ↔
      ∀ i, Module.finrank K (M.fil.fil i) = Module.finrank K (M'.fil.fil i) := sorry

end FilteredPhiNModule

-- filteredPhiNModule_unit_tH_tN (degenerate): not stated; needs `FilteredPhiNModule.unit` as an
-- object (the unit isocrystal `K(p, k)` with its Frobenius is Mathlib's
-- `StandardOneDimIsocrystal p k 0`).
-- filteredPhiNModule_tensor_monodromy (computation), filteredPhiNModule_not_abelian (non-example),
-- filteredPhiNModule_twist_sign (characterisation): not stated; need explicit 2-dimensional
-- isocrystals and the twist of the Frobenius, which Mathlib does not provide.

/-! ### R06.2/newton-number-tN -/

/-- `t_N(D) = v_p(det φ)` in any basis. -/
def newtonNumber (D : Type*) [AddCommGroup D] [WittVector.Isocrystal p k D] : ℤ := sorry

-- newtonNumber_eq_det, newtonNumber_basis_indep: not stated; need the p-adic valuation on
-- `K(p, k) = FractionRing (WittVector p k)` and the matrix of a semilinear map in a basis.
-- newtonNumber_shortExact, newtonNumber_tensor, newtonNumber_dual, newtonNumber_twist: not stated;
-- need the exact-sequence, tensor, dual and twist constructions on Mathlib isocrystals.
-- newtonNumber_eq_sum_slopes: not stated; needs the slope decomposition (R06.2/slope-decomposition).

-- newtonNumber_unit (degenerate): covered by the next test with `m = 0`.
/-- Test `newtonNumber_standard` (compatibility): Mathlib's standard isocrystal of slope `m`. -/
example (m : ℤ) : newtonNumber p (k := k) (WittVector.StandardOneDimIsocrystal p k m) = m := by sorry

/-- Test `filteredPhiNModule_isocrystal_compat` (compatibility): the isocrystal of `K_0[0]⟨n⟩` is
Mathlib's standard isocrystal of slope `−n`, with `t_N = −n`. -/
example (n : ℤ) : newtonNumber p (k := k) (WittVector.StandardOneDimIsocrystal p k (-n)) = -n := by sorry

/-- Test `newtonNumber_unit` (degenerate). -/
example : newtonNumber p (k := k) (WittVector.StandardOneDimIsocrystal p k 0) = 0 := by sorry

-- newtonNumber_katz (computation), newtonNumber_not_eigenvalue_valuation (non-example): not stated;
-- need an explicit isocrystal over `K(p, F_9)` given by a matrix.

/-! ### R06.2/weak-admissibility -/

/-- `t_H` and `t_N` of a subobject. -/
def tHsub {D : Type*} [AddCommGroup D] [WittVector.Isocrystal p k D] (M : FilteredPhiNModule p k K D)
    (D₀ : Submodule K(p, k) D) : ℤ :=
  hodgeNumber (FilteredPhiNModule.sub p M D₀)

def tNsub {D : Type*} [AddCommGroup D] [WittVector.Isocrystal p k D] (D₀ : Submodule K(p, k) D) : ℤ :=
  sorry

/-- Weak admissibility. -/
def IsWeaklyAdmissible {D : Type*} [AddCommGroup D] [WittVector.Isocrystal p k D]
    (M : FilteredPhiNModule p k K D) : Prop :=
  hodgeNumber M.fil = newtonNumber p (k := k) D ∧
    ∀ D₀ : Submodule K(p, k) D, FilteredPhiNModule.IsSubobject p M D₀ → tHsub p M D₀ ≤ tNsub p (k := k) D₀

theorem isWeaklyAdmissible_iff_quotients {D : Type*} [AddCommGroup D] [WittVector.Isocrystal p k D]
    (M : FilteredPhiNModule p k K D) :
    IsWeaklyAdmissible p M ↔ hodgeNumber M.fil = newtonNumber p (k := k) D ∧
      ∀ D₀ : Submodule K(p, k) D, FilteredPhiNModule.IsSubobject p M D₀ →
        hodgeNumber (FilteredPhiNModule.quot p M D₀) ≥ newtonNumber p (k := k) D - tNsub p (k := k) D₀ := sorry

-- isWeaklyAdmissible_iff_polygons: not stated; needs Hodge and Newton polygons as convex functions.
-- IsWeaklyAdmissible.dual, IsWeaklyAdmissible.twist, IsWeaklyAdmissible.baseChange_ur: not stated;
-- need the dual, twisted and base-changed objects as `FilteredPhiNModule`s.

/-- The full subcategory of weakly admissible objects (on a fixed `D`). -/
def MFwa (D : Type*) [AddCommGroup D] [WittVector.Isocrystal p k D] :=
  {M : FilteredPhiNModule p k K D // IsWeaklyAdmissible p M}

-- isWeaklyAdmissible_unit (degenerate), isWeaklyAdmissible_rank_one (characterisation),
-- not_isWeaklyAdmissible_berger (non-example), isWeaklyAdmissible_berger_generic (computation),
-- isWeaklyAdmissible_depends_on_N (non-example), isWeaklyAdmissible_Dcris_tate (compatibility):
-- not stated; need explicit filtered (φ, N)-modules over `K_0 = Q_p` (the isocrystal on
-- `Fin 2 → K(p, F_p)` with diagonal Frobenius) — the packet gives them in coordinates.

/-! ### R06.2/filtered-phi-n-modules-with-descent-data -/

/-- Filtered `(φ, N, Gal(L/K))`-modules: a filtered `(φ, N)`-module over `L` with a semilinear
action of a finite group `Γ` commuting with `φ` and `N` and preserving the filtration. -/
structure FilteredPhiNGaloisModule (Γ : Type*) [Group Γ] (D : Type*) [AddCommGroup D]
    [WittVector.Isocrystal p k D] [DistribMulAction Γ D] extends FilteredPhiNModule p k K D where
  comm_phi : ∀ (g : Γ) (x : D), g • (phiD p k D).toLinearMap x = (phiD p k D).toLinearMap (g • x)
  comm_N : ∀ (g : Γ) (x : D), g • N x = N (g • x)

namespace FilteredPhiNGaloisModule

variable {Γ : Type*} [Group Γ] {D : Type*} [AddCommGroup D] [WittVector.Isocrystal p k D]
  [DistribMulAction Γ D]

/-- The filtration on `D_K = (D_L)^{Gal(L/K)}`. -/
def filK (_M : FilteredPhiNGaloisModule p (k := k) (K := K) Γ D) (i : ℤ) :
    Submodule K(p, k) (TensorProduct K(p, k) K D) := sorry

def IsWeaklyAdmissible (M : FilteredPhiNGaloisModule p (k := k) (K := K) Γ D) : Prop :=
  TauCeti.PadicHodge.IsWeaklyAdmissible p M.toFilteredPhiNModule

/-- A filtered `(φ, N)`-module is one with the trivial group. -/
def ofFilteredPhiN [DistribMulAction (Unit) D] (M : FilteredPhiNModule p k K D)
    (h : ∀ (g : Unit) (x : D), g • x = x) : FilteredPhiNGaloisModule p (k := k) (K := K) Unit D :=
  { M with comm_phi := sorry, comm_N := sorry }

-- FilteredPhiNGaloisModule.restrict: restriction of the group action to a subgroup; not stated
-- separately.

end FilteredPhiNGaloisModule

-- DstL, DstL_dR: not stated; need `D_{st,L}(V)` with its `Gal(L/K)`-action built from
-- `Dst p L ρV` together with the isocrystal structure over `L_0`.
-- descentData_trivial_group (degenerate), descentData_tH_eq (computation),
-- descentData_DstL_compat (compatibility), descentData_not_forgetful_equivalence (non-example):
-- not stated; they need `DstL` and explicit objects.

/-! ### R06.2/colmez-fontaine-theorem (definition of the statement) -/

/-- `V_st(D)` for a filtered `(φ, N)`-module (as a `Q_p`-space); only its dimension is used here. -/
def VstDim {D : Type*} [AddCommGroup D] [WittVector.Isocrystal p k D] (_M : FilteredPhiNModule p k K D) :
    ℕ := sorry

/-- The Colmez–Fontaine proposition, in the dimension form: for every weakly admissible filtered
`(φ, N)`-module, `dim_{Q_p} V_st(D) = dim_{K_0} D`. Proved in R06.3; defined here. -/
def ColmezFontaine : Prop :=
  ∀ (D : Type) [AddCommGroup D] [WittVector.Isocrystal p k D] [FiniteDimensional K(p, k) D]
    (M : FilteredPhiNModule p k K D), IsWeaklyAdmissible p M → VstDim p M = Module.finrank K(p, k) D

/-- The descent-data form, for the finite groups `Γ = Gal(L/K)`. -/
def ColmezFontainePst : Prop :=
  ∀ (Γ : Type) [Group Γ] [Finite Γ] (D : Type) [AddCommGroup D] [WittVector.Isocrystal p k D]
    [FiniteDimensional K(p, k) D] [DistribMulAction Γ D] (M : FilteredPhiNGaloisModule p (k := k) (K := K) Γ D),
    FilteredPhiNGaloisModule.IsWeaklyAdmissible p M → VstDim p M.toFilteredPhiNModule = Module.finrank K(p, k) D

theorem colmezFontaine_iff_dim :
    ColmezFontaine p (k := k) (K := K) ↔
      ∀ (D : Type) [AddCommGroup D] [WittVector.Isocrystal p k D] [FiniteDimensional K(p, k) D]
        (M : FilteredPhiNModule p k K D), IsWeaklyAdmissible p M →
          Module.finrank K(p, k) D ≤ VstDim p M := sorry

-- colmezFontaine_iff_simple: not stated; needs simple objects of the abelian category MFwa.
-- colmezFontaine_iff_essSurj: not stated; needs `Dst` as a functor into `FilteredPhiNModule`.

theorem colmezFontaine_rank_one {D : Type} [AddCommGroup D] [WittVector.Isocrystal p k D]
    [FiniteDimensional K(p, k) D] (hD : Module.finrank K(p, k) D = 1) (M : FilteredPhiNModule p k K D)
    (hM : IsWeaklyAdmissible p M) : VstDim p M = 1 := sorry

/-- Test `colmezFontaine_rank_one_holds` (computation). -/
example {D : Type} [AddCommGroup D] [WittVector.Isocrystal p k D] [FiniteDimensional K(p, k) D]
    (hD : Module.finrank K(p, k) D = 1) (M : FilteredPhiNModule p k K D) (hM : IsWeaklyAdmissible p M) :
    VstDim p M = Module.finrank K(p, k) D := by sorry

-- colmezFontaine_trivial_filtration (degenerate): not stated; needs the trivial filtration on
-- `K ⊗ D` as a `FilteredSpace` and the unit-root condition.

/-- Test `colmezFontaine_iff_essSurj_test` (compatibility): the dimension form implies the
statement for rank-one objects. -/
example (h : ColmezFontaine p (k := k) (K := K)) {D : Type} [AddCommGroup D] [WittVector.Isocrystal p k D]
    [FiniteDimensional K(p, k) D] (M : FilteredPhiNModule p k K D) (hM : IsWeaklyAdmissible p M) :
    VstDim p M = Module.finrank K(p, k) D := h D M hM

-- colmezFontaine_not_for_all_filtered (non-example): not stated; needs Berger's explicit
-- non-weakly-admissible module.

end PhiN

/-! ### Remaining named theorems of R06.2 -/

-- admissible-implies-weakly-admissible, colmez-fontaine-bigness-criterion,
-- dst-exact-tensor-fully-faithful, crystalline-subobjects-strict, vst-rank-one, vst-continuity,
-- dcris-dst-filtered-phi-n-modules: not stated as declarations here; they need `D_st(V)` and
-- `D_cris(V)` as objects of `FilteredPhiNModule p k K _` (an isocrystal structure on the
-- `K(p, k)`-space `Dst p K ρV`, where `K(p, k) ↪ K_0` identifies the residue field), which the
-- library must build first (packet node R06.2/dcris-dst-filtered-phi-n-modules).

end PartC

end

/-! # Layers R06.3 and R06.4: the p-adic monodromy theorem, Weil–Deligne parameters and small weights -/

section

section D

/-! ## R06.4 — Hodge–Tate weights on filtered vector spaces (`hodge-tate-weight-convention`)

The weights of a de Rham representation are the negatives of the jumps of `D_dR(V)`. The
representation-level statements need R06.2's `D_dR`; the filtered-space core is below. -/

/-- A decreasing, exhaustive, separated `ℤ`-indexed filtration of a `K`-vector space. -/
structure DecFiltration (K D : Type*) [Field K] [AddCommGroup D] [Module K D] where
  /-- The filtration `Fil^i`. -/
  fil : ℤ → Submodule K D
  antitone : Antitone fil
  exhaustive : ∃ i, fil i = ⊤
  separated : ∃ i, fil i = ⊥

variable {K D : Type*} [Field K] [AddCommGroup D] [Module K D]

/-- The multiplicity of `h` as a Hodge–Tate weight: `dim gr^{-h}` (HT(χ_p) = +1). -/
noncomputable def filtrationMultiplicity (F : DecFiltration K D) (h : ℤ) : ℕ :=
  Module.finrank K (F.fil (-h) ⧸ (F.fil (-h + 1)).comap (F.fil (-h)).subtype)

/-- The Hodge–Tate weights: the `h` with `gr^{-h} ≠ 0`. -/
def hodgeTateWeights (F : DecFiltration K D) : Set ℤ :=
  {h | 0 < filtrationMultiplicity F h}

/-- The Tate twist on filtrations: `Fil^i (D ⊗ K t^{-n}) = Fil^{i+n} D`. -/
def DecFiltration.shift (F : DecFiltration K D) (n : ℤ) : DecFiltration K D where
  fil i := F.fil (i + n)
  antitone := fun _ _ hij => F.antitone (by omega)
  exhaustive := by
    obtain ⟨i, hi⟩ := F.exhaustive
    exact ⟨i - n, by simpa using hi⟩
  separated := by
    obtain ⟨i, hi⟩ := F.separated
    exact ⟨i - n, by simpa using hi⟩

/-- The dual filtration `Fil^i(D^*) = (Fil^{1-i} D)^⊥`. -/
def DecFiltration.dual (F : DecFiltration K D) : DecFiltration K (Module.Dual K D) where
  fil i := (F.fil (1 - i)).dualAnnihilator
  antitone := sorry
  exhaustive := sorry
  separated := sorry

/-- The filtration of `D_dR(Q_p(n)) = K·t^{-n}`: its unique jump is at `-n`. -/
def tateFiltration (n : ℤ) : DecFiltration K K where
  fil i := if i ≤ -n then ⊤ else ⊥
  antitone := sorry
  exhaustive := ⟨-n, by simp⟩
  separated := ⟨-n + 1, by simp⟩

theorem hodgeTateWeights_twist (F : DecFiltration K D) (n h : ℤ) :
    filtrationMultiplicity (F.shift n) h = filtrationMultiplicity F (h - n) := sorry

theorem hodgeTateWeights_dual [FiniteDimensional K D] (F : DecFiltration K D) (h : ℤ) :
    filtrationMultiplicity F.dual h = filtrationMultiplicity F (-h) := sorry

theorem hodgeTateWeights_eq_filtrationJumps_neg [FiniteDimensional K D]
    (F : DecFiltration K D) (h : ℤ) :
    h ∈ hodgeTateWeights F ↔ F.fil (-h + 1) ≠ F.fil (-h) := sorry

-- hodgeTateWeights_tensor: not stated; needs the tensor filtration of filtered modules
--   (PadicHodgeTheory:R06.2/filtered-phi-n-modules, part C).
-- hodgeTateWeights_eq_sen: not stated; needs Sen's operator (PadicHodgeTheory:P7/sen-module)
--   and D_Sen, which need C_K with its G_K-action (R06.1).

/-- Test `hodgeTateWeights_tate_twist` (computation) -/
example (n : ℤ) : filtrationMultiplicity (tateFiltration (K := K) n) n = 1 := sorry

/-- Test `hodgeTateWeights_trivial` (degenerate) -/
example : hodgeTateWeights (tateFiltration (K := K) 0) = {0} := sorry

/-- Test `hodgeTateWeights_cyclotomic_pos` (non-example): the weight of `Q_p(1)` is `+1`, not `-1`. -/
example : filtrationMultiplicity (tateFiltration (K := K) 1) (-1) = 0 := sorry

-- hodgeTateWeights_cyclotomicCharacter: not stated; needs D_dR of the representation defined by
--   Mathlib's `cyclotomicCharacter` (R06.1/de-rham-period-ring, R06.2/period-functors).
-- hodgeTateWeights_elliptic: not stated; needs D_dR(V_p(E)) (R06.2, R06.6).

/-! ## R06.4 — Fontaine–Laffaille endpoint: rank-one characters mod p
(`fontaine-laffaille-endpoint-non-example`, `fontaine-laffaille-sign-dictionary` (5)) -/

/-- `ω^{p-1} = ω^0`: the weight-`0` and weight-`(p-1)` rank-one objects have the same reduction. -/
theorem flEndpoint_omega_collision (p : ℕ) [Fact p.Prime] (a : (ZMod p)ˣ) :
    a ^ (p - 1) = a ^ 0 := by
  rw [pow_zero]
  exact ZMod.units_pow_card_sub_one_eq_one p a

/-- On `[0, p-2]` the characters `ω^n` are pairwise distinct. -/
theorem flSmallWeight_omega_injective (p : ℕ) [Fact p.Prime] (g : (ZMod p)ˣ)
    (hg : orderOf g = p - 1) {m n : ℕ} (hm : m < p - 1) (hn : n < p - 1)
    (h : g ^ m = g ^ n) : m = n := sorry

/-! ## R06.4 — ordinary representations (`ordinary-representation`) -/

section Ordinary

variable {p : ℕ} [Fact p.Prime] {G : Type*} [Group G]
variable {E V : Type*} [Field E] [Algebra ℚ_[p] E] [AddCommGroup V] [Module E V]

/-- `V` is ordinary (Perrin-Riou): a decreasing exhaustive separated `G`-stable filtration on
which the inertia subgroup `I` acts on `gr^i` through `χ^i`. -/
def IsOrdinary (I : Subgroup G) (χ : G →* ℤ_[p]ˣ) (ρ : G →* (V ≃ₗ[E] V)) : Prop :=
  ∃ F : ℤ → Submodule E V, Antitone F ∧ (∃ i, F i = ⊤) ∧ (∃ i, F i = ⊥) ∧
    (∀ (i : ℤ) (g : G), ∀ v ∈ F i, ρ g v ∈ F i) ∧
    ∀ (i : ℤ), ∀ g ∈ I, ∀ v ∈ F i,
      ρ g v - algebraMap ℚ_[p] E (((χ g ^ i : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]) • v ∈ F (i + 1)

-- IsOrdinary.subquotient: not stated; needs sub- and quotient representations of `ρ`.
-- IsOrdinary.dual: not stated; needs the contragredient representation.
-- IsOrdinary.tensor: not stated; needs the tensor product representation.
-- IsOrdinary.hodgeTateWeights: not stated; needs D_dR (R06.2) and ordinary ⇒ semistable.

/-- Test `isOrdinary_unramified` (degenerate) -/
example (I : Subgroup G) (χ : G →* ℤ_[p]ˣ) (ρ : G →* (V ≃ₗ[E] V))
    (h : ∀ g ∈ I, ρ g = 1) : IsOrdinary I χ ρ := sorry

/-- Test `isOrdinary_tate_twist` (computation) -/
example (I : Subgroup G) (χ : G →* ℤ_[p]ˣ) (n : ℤ) (ρ : G →* (E ≃ₗ[E] E))
    (hρ : ∀ g x, ρ g x = algebraMap ℚ_[p] E (((χ g ^ n : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]) * x) :
    IsOrdinary I χ ρ := sorry

/-- Test `isOrdinary_cyclotomicCharacter` (compatibility): the one-dimensional representation
given by Mathlib's `cyclotomicCharacter` is ordinary with `gr^1 = V`. -/
example (L : Type*) [CommRing L] [IsDomain L] (I : Subgroup (L ≃+* L))
    (ρ : (L ≃+* L) →* (ℚ_[p] ≃ₗ[ℚ_[p]] ℚ_[p]))
    (hρ : ∀ g x, ρ g x = ((cyclotomicCharacter L p g : ℤ_[p]) : ℚ_[p]) * x) :
    IsOrdinary I (cyclotomicCharacter L p) ρ := sorry

-- not_isOrdinary_supersingular: not stated; needs V_p(E) and R06.2/colmez-fontaine-theorem.
-- not_isOrdinary_wrong_order: not stated; needs a non-split extension of Q_p(1) by Q_p (R06.2).

end Ordinary

/-! ## R06.4 — named theorems that need R06.1/R06.2 (part C) and R07.3/R07.4

-- smallWeightAdmissibility (small-weight-admissibility): not stated; needs weakly admissible
--   filtered φ-modules and V_cris (R06.2/weak-admissibility, R06.2/admissible-representations).
-- fontaineLaffailleCrystallineComparison: not stated; needs FL's Ŝ_K and U_{S_K} (R07.3) and
--   V_cris (R06.2).
-- fontaineLaffailleRationalConsequences: not stated; needs strongly divisible lattices and U_S
--   (R07.3).
-- fontaineLaffailleSignDictionary: not stated beyond `hodgeTateWeights_dual` and
--   `hodgeTateWeights_twist`; needs U_S (R07.3).
-- barsottiTateCrystallineCriterion, weightPEndpointBranch, weightPPlusOneBranch: not stated;
--   need p-divisible groups and Kisin modules (R07.4).
-- ordinaryImpliesSemistable, twoDimensionalOrdinarityCriterion: not stated; need D_st (R06.2).
-/

/-! ## R06.3 — Fontaine's Weil–Deligne recipe, linearised (`fontaine-weil-deligne-functor`)

On a factor `D_τ` of a (φ,N,Gal(L/K))-module, `Φ := φ^{f_K}` is linear and an arithmetic
Frobenius acts by `r(Φ) = Φ̄ ∘ φ^{-f_K}`, i.e. by `Φ⁻¹` when `Gal(L/K)` acts trivially. -/

section WeilDeligne

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V]

/-- Frobenius part of Fontaine's recipe on one factor: `Φ^{n} ↦ Φ^{-n}`. -/
def fontaineFrobenius (Φ : V ≃ₗ[E] V) : Multiplicative ℤ →* (V ≃ₗ[E] V) :=
  zpowersHom _ Φ⁻¹

/-- `Nφ = pφN` becomes `r(Φ) N r(Φ)⁻¹ = q N` for the arithmetic Frobenius. -/
theorem fontaineWD_relation (Φ : V ≃ₗ[E] V) (N : V →ₗ[E] V) (q : E)
    (hN : N ∘ₗ Φ.toLinearMap = q • (Φ.toLinearMap ∘ₗ N)) :
    (fontaineFrobenius Φ (Multiplicative.ofAdd 1)).toLinearMap ∘ₗ N ∘ₗ
      (fontaineFrobenius Φ (Multiplicative.ofAdd 1)).symm.toLinearMap = q • N := sorry

/-- Twist compatibility: replacing `Φ` by `c⁻¹ Φ` (`φ_{D(1)} = p⁻¹ φ_D`) multiplies `r(Φ)` by `c`. -/
theorem fontaineWD_twist (Φ : V ≃ₗ[E] V) (c : Eˣ) :
    fontaineFrobenius (LinearEquiv.smulOfUnit c⁻¹ * Φ) (Multiplicative.ofAdd 1) =
      LinearEquiv.smulOfUnit c * fontaineFrobenius Φ (Multiplicative.ofAdd 1) := sorry

-- fontaineWD: not stated; needs (φ,N,Gal(L/K))-modules with E-coefficients
--   (R06.2/filtered-phi-n-modules) and the Weil–Deligne category of ArithmeticGaloisRepresentations:R01.2.
-- fontaineWD_linear: not stated; needs the semilinear Gal(L/K)-action on L_0 ⊗ E-modules (R06.2).
-- fontaineWD_inertia: not stated; needs W_K and I_K (R01.2).
-- fontaineWD_equiv: not stated; needs the Weil–Deligne category (R01.2).
-- fontaineWD_tensor: not stated; needs ⊗ of (φ,N,Gal)-modules (R06.2) and of WD representations (R01.2).

/-- Test `fontaineWD_unramified_rank_one` (computation) -/
example (c : Eˣ) :
    fontaineFrobenius (LinearEquiv.smulOfUnit c : V ≃ₗ[E] V) (Multiplicative.ofAdd 1) =
      LinearEquiv.smulOfUnit c⁻¹ := sorry

/-- Test `fontaineWD_trivial` (degenerate) -/
example : fontaineFrobenius (1 : V ≃ₗ[E] V) = 1 := sorry

/-- Test `fontaineWD_tate_matrix` (computation): the Tate curve of `11a1` at `p = 11`. -/
example :
    (!![0, 5; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * !![(11 : ℚ)⁻¹, 0; 0, 1] =
        (11 : ℚ) • (!![(11 : ℚ)⁻¹, 0; 0, 1] * !![0, 5; 0, 0]) ∧
      (!![(11 : ℚ)⁻¹, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ)⁻¹ * !![0, 5; 0, 0] *
          !![(11 : ℚ)⁻¹, 0; 0, 1] = (11 : ℚ) • !![0, 5; 0, 0] := sorry

/-- Test `fontaineWD_wrong_sign` (non-example): `Φ N Φ⁻¹ = q⁻¹ N ≠ q N`. -/
example :
    (!![(11 : ℚ)⁻¹, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![0, 5; 0, 0] *
        (!![(11 : ℚ)⁻¹, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ)⁻¹ ≠ (11 : ℚ) • !![0, 5; 0, 0] := sorry

-- fontaineWD_compat_deligne: not stated; needs Deligne's relation (8.4.1.1) from R01.2.

/-- `tate-curve-weil-deligne-example`: `Nφ = pφN` and `r(Φ) N r(Φ)⁻¹ = p N` with `r(Φ) = φ⁻¹`
for the Tate-curve module (`φ = diag(p⁻¹, 1)`, `N(y) = v x`). -/
theorem tateCurve_weilDeligne (p v : ℚ) (hp : p ≠ 0) :
    (!![0, v; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * !![p⁻¹, 0; 0, 1] =
        p • (!![p⁻¹, 0; 0, 1] * !![0, v; 0, 0]) ∧
      (!![p⁻¹, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ)⁻¹ * !![0, v; 0, 0] * !![p⁻¹, 0; 0, 1] =
        p • !![0, v; 0, 0] := sorry

end WeilDeligne

/-! ## R06.3 — the Weil–Deligne parameter and D_pst

-- weilDeligneParameter, weilDeligneParameter_restrict, weilDeligneParameter_tensor,
-- weilDeligneParameter_twist, inertialType, weilDeligneParameter_frobeniusSemisimple,
-- weilDeligneParameter_crystalline_iff: not stated; need D_st,L (R06.2/period-functors,
--   R06.1/semistable-period-ring) and the Weil–Deligne category (R01.2).
-- weilDeligneParameter_cyclotomic, weilDeligneParameter_trivial,
-- weilDeligneParameter_finite_character, weilDeligneParameter_not_hodge_type,
-- weilDeligneParameter_ladic_compat: not stated; same needs (the linear-algebra content of
--   the first two is `fontaineWD_twist` and `fontaineWD_trivial`).
-- stL, pst, pst_baseChange, pst_rank_iff, stL_deRham, pst_tensor, pst_crystalline,
-- pst_finite_character, pst_not_full_rank, stL_eq_fontaine_ouyang: not stated; need B_st with
--   its G_K-action and D_st (R06.1/semistable-period-ring, R06.2/period-functors).
-/

/-! ## R06.3 — connections and unipotence (`unipotent-crystal`) -/

section Connection

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- A connection on `M` over an additive operator `nablaR : R → R` (Berger: a connection
"au-dessus de ∇"). -/
structure ConnectionOver (nablaR : R →+ R) (M : Type*) [AddCommGroup M] [Module R M] where
  /-- The underlying additive map. -/
  toAddMonoidHom : M →+ M
  leibniz : ∀ (a : R) (m : M), toAddMonoidHom (a • m) = nablaR a • m + a • toAddMonoidHom m

/-- Condition (2) of Berger's Proposition 5.5: a family `f` which is a basis after inverting `t`
with `∇ f_i ∈ t · ⟨f_j : j < i⟩`. -/
def IsUnipotentConnection {nablaR : R →+ R} (c : ConnectionOver nablaR M) (t : R) : Prop :=
  ∃ (d : ℕ) (f : Fin d → M), LinearIndependent R f ∧
    (∀ m : M, ∃ n : ℕ, t ^ n • m ∈ Submodule.span R (Set.range f)) ∧
    ∀ i, ∃ x ∈ Submodule.span R (f '' {j | j < i}), c.toAddMonoidHom (f i) = t • x

/-- Trivial connection: a family as above consisting of horizontal elements. -/
def IsTrivialConnection {nablaR : R →+ R} (c : ConnectionOver nablaR M) (t : R) : Prop :=
  ∃ (d : ℕ) (f : Fin d → M), LinearIndependent R f ∧
    (∀ m : M, ∃ n : ℕ, t ^ n • m ∈ Submodule.span R (Set.range f)) ∧
    ∀ i, c.toAddMonoidHom (f i) = 0

/-- The connection of a derivation on the ring itself. -/
def ConnectionOver.ofDerivation (Dr : Derivation ℤ R R) :
    ConnectionOver (Dr.toLinearMap.toAddMonoidHom) R where
  toAddMonoidHom := Dr.toLinearMap.toAddMonoidHom
  leibniz := sorry

-- RobbaCrystal: not stated; needs B†_rig,K with φ and ∇ (P7:annulus-foundations/overconvergent-cyclotomic-rings).
-- isUnipotentConnection_iff_horizontal: not stated; needs B†_log,K = B†_rig,K[log π]
--   (PadicHodgeTheory:P7/log-extended-period-rings).
-- isUnipotentConnection_tensor: not stated; needs the tensor product of connections.

/-- Test `isTrivialConnection_unit` (degenerate) -/
example (Dr : Derivation ℤ R R) (t : R) :
    IsTrivialConnection (ConnectionOver.ofDerivation Dr) t := sorry

-- isUnipotent_log_example, not_isTrivial_log_example: not stated; need B†_rig,F and log π
--   (P7, PadicHodgeTheory:P7/log-extended-period-rings).
-- isUnipotent_iff_kedlaya: not stated; needs PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-differential-module.

end Connection

/-! ## R06.3 — objects built on Robba rings, B_dR and (φ,Γ)-modules (parts A and C, PG.0–PG.2)

-- ExtendedRobba, ExtendedRobba.frobenius, ExtendedRobba.galoisAction, ExtendedRobba.mayerVietoris,
-- ExtendedRobba.plusRig_subset_bcrisPlus, ExtendedRobba.robba_subset_invariants,
-- ExtendedRobba.t_mem_phi, ExtendedRobba.phi_fixed_eq_Qp, ExtendedRobba.eq_kedlaya_alg,
-- ExtendedRobba.t_not_isUnit, ExtendedRobba.diag_mod_p: not stated; need A_inf = W(O_{C♭}),
--   A_cris, B_cris^+ with φ (R06.1/crystalline-period-ring) and p-adic completions of
--   A_inf[p/[π̄]^r, [π̄]^s/p].
-- iotaMap, iotaMap_injective, iotaMap_frobenius, iotaMap_t, iotaMap_equivariant,
-- iotaMap_robba_subset, iotaMap_pi, iotaMap_zero_of_plus, iotaMap_theta_q,
-- iotaMap_not_phi_equivariant: not stated; need the rings above and B_dR^+ with its
--   G_K-action and θ (R06.1/de-rham-period-ring; Mathlib `BDeRhamPlus` has no Galois action).
-- tLog, LogExtendedRobba, LogExtendedRobba.frobenius_u, LogExtendedRobba.galois_u,
-- LogExtendedRobba.monodromy, LogExtendedRobba.iotaMap_injective, LogExtendedRobba.plusLog_subset_bst,
-- tLog_pi_bar, LogExtendedRobba.monodromy_frobenius, LogExtendedRobba.ker_monodromy,
-- LogExtendedRobba.old_normalisation_wrong, LogExtendedRobba.compat_bst: not stated; need the
--   extended rings and B_st (R06.1/semistable-period-ring).
-- decompletion, decompletion_section, decompletion_linear, decompletion_tendsto,
-- decompletion_comm_gamma, decompletion_log, decompletion_zero_id, decompletion_eps_pow,
-- decompletion_not_mul, decompletion_compat_normalized_trace: not stated; need B†_rig,K
--   (P7:annulus-foundations/overconvergent-cyclotomic-rings) and Cherbonnier–Colmez's R_k (PG.2).
-- robbaNabla, robbaNabla_eq_t_mul_partial, robbaNabla_indep, robbaNabla_leibniz, robbaNabla_comm,
-- robbaNabla_iota, robbaNabla_div_one_sub_gamma, robbaNabla_t, robbaNabla_pi, robbaNabla_const,
-- robbaNabla_ne_partial, robbaNabla_kedlaya: not stated; need B†_rig,K with Γ_K and ∂ (P7).
-- phiGammaNabla, phiGammaNabla_leibniz, phiGammaNabla_limit, phiGammaNabla_comm, phiGammaPartial,
-- phiGammaPartial_frobenius, phiGammaNabla_tensor, phiGammaNabla_restrict, phiGammaNabla_twist,
-- phiGammaNabla_trivial, phiGammaNabla_iota_dif, phiGammaPartial_not_stable: not stated; need
--   D†_rig(V) (P7/robba-realisation-comparison, PG.2).
-- senModule, senOperator, senModule_equiv, senOperator_ker, senOperator_tensor,
-- senOperator_tate_twist, senOperator_trivial, senOperator_zero_iff_potentially_unramified,
-- senOperator_nonsplit_nilpotent: not stated; need C_K with G_K-action (R06.1) and the
--   Tate–Sen formalism (PG.2).
-- difPlus, difPlus_comparison, difConnection, dif, difPlus_mod_t, dif_functor, difPlus_tate_twist,
-- difPlus_trivial, difPlus_mod_t_sen, dif_not_flat_nonsplit: not stated; need B_dR^+ with
--   G_K-action (R06.1/de-rham-period-ring).
-- deRhamDiffEq, deRhamDiffEq_free, deRhamDiffEq_unique, deRhamDiffEq_frobenius, deRhamDiffEq_gamma,
-- deRhamDiffEq_crystalline, deRhamDiffEq_functor, deRhamDiffEq_twist, deRhamDiffEq_trivial,
-- deRhamDiffEq_crystalline_eq, deRhamDiffEq_not_for_nonDeRham: not stated; need D†_rig(V), D_dR
--   (R06.2/period-functors) and the nodes above.

## R06.3 — named theorems

-- dstDcrisFromRobbaModule (Berger, Théorème 3.6): not stated; needs D_st, D_cris (R06.2) and
--   D†_log(V) (P7, PG.2).
-- semistableOverKnIffUnipotent (Berger, Proposition 5.6): not stated; same needs.
-- deRhamIffDifConnectionTrivial (Fontaine; Berger 5.9): not stated; needs D_dR and D_dif.
-- pAdicMonodromyTheorem: not stated; needs D_dR and D_st (R06.2/period-functors); its intended
--   form is `∀ V, IsDeRham V → ∃ L/K finite, IsSemistable (V.restrict L)`.
-- weilDeligneIndependenceOfChoices, weilDeligneDescent, conventionComparisonWithR01,
-- hodgeAndInertialTypeDoNotDetermineFrobenius: not stated; need D_st,L and the Weil–Deligne
--   category (R06.2, R01.2); their linear-algebra cores are `fontaineWD_relation`,
--   `fontaineWD_twist` and `tateCurve_weilDeligne`.
-/

end D

end

/-! ## Nodes without a declaration of their own

Every definition, API item and unit test of the packet appears above under its packet name, as a
declaration, an `example` or a `not stated` comment. The following nodes have no declaration of
their own in this file; the packet and the roadmap document state them. For the definitions and
constructions among them, the API items are the `not stated` comments above.

* P7: `P7/theta-iota-kernel`, `P7/cyclotomic-eigenvectors-in-log-ring`,
  `P7/antiderivatives-on-log-robba-ring`, `P7/theta-iota-surjective-onto-Kn`,
  `P7/fontaine-dif-module`.
* R06.1: `R06.1/frobenius-kernel-ideals-of-ainf`, `R06.1/acris-completed-tensor-description`,
  `R06.1/galois-action-on-acris-continuous`, `R06.1/filtration-i-r-of-acris`,
  `R06.1/divided-frobenius-exact-sequence`, `R06.1/bcris-twisted-frobenius-sequences`.
* R06.2: `R06.2/period-rings-are-regular`, `R06.2/serre-tate-injectivity`,
  `R06.2/hodge-tate-base-change`, `R06.2/hodge-tate-graded-equivalence`, `R06.2/ddr-of-tate-twists`,
  `R06.2/ddr-exact-strict-tensor`, `R06.2/induction-and-restriction-of-scalars`,
  `R06.2/hodge-tate-characters-are-de-rham`, `R06.2/extension-with-separated-weights-de-rham`,
  `R06.2/monodromy-nilpotent`, `R06.2/weakly-admissible-two-out-of-three`,
  `R06.2/weakly-admissible-category-abelian`, `R06.2/rank-one-filtered-modules`,
  `R06.2/crystalline-semistable-base-change`, `R06.2/frobenius-twisted-units-surjective`,
  `R06.2/dcris-of-tate-twists-and-unramified`, `R06.2/potentially-unramified-and-characters`,
  `R06.2/coefficient-field-base-change`, `R06.2/period-functors-transport-of-structure`.
* R06.3: `R06.3/closed-submodules-of-free-robba-modules`, `R06.3/lie-algebra-trivial-gamma-action`,
  `R06.3/de-rham-iff-dif-connection-trivial`, `R06.3/approximation-in-dif-module`,
  `R06.3/de-rham-lattice-Ns`, `R06.3/determinant-of-stable-submodule`,
  `R06.3/de-rham-differential-equation`, `R06.3/robba-lattice-implies-de-rham`,
  `R06.3/de-rham-differential-equation-has-frobenius-structure`, `R06.3/p-adic-monodromy-theorem`,
  `R06.3/potentially-semistable-dieudonne-module`, `R06.3/weil-deligne-independence-of-choices`,
  `R06.3/weil-deligne-parameter`, `R06.3/weil-deligne-descent`,
  `R06.3/convention-comparison-with-r01`,
  `R06.3/hodge-and-inertial-type-do-not-determine-frobenius`.
* R06.4: `R06.4/fontaine-laffaille-crystalline-comparison`,
  `R06.4/fontaine-laffaille-rational-consequences`, `R06.4/ordinary-implies-semistable`,
  `R06.4/two-dimensional-ordinarity-criterion`, `R06.4/barsotti-tate-crystalline-criterion`,
  `R06.4/weight-p-endpoint-branch`, `R06.4/weight-p-plus-one-branch`.
-/

end TauCeti.PadicHodge
