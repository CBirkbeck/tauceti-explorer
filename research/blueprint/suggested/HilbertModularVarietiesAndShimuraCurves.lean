/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so contributors and reviewers converge on names and
signatures. No implementation is claimed; proofs use sorry as placeholders.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The typed prototypes use available Mathlib carriers. Hilbert positive-unit formulas
keep a subgroup P explicit: the arithmetic specialization uses the existing
NumberField.totallyPositiveIntegerUnits, whose compiled Tau Ceti module is unavailable
in the shared build. No replacement definition of positivity is introduced.
The part-qualified contract ledgers record geometric signatures requiring unavailable
supplier carriers. A ledger entry is neither a Lean declaration nor an elaborated
signature. No assumed theorem field or dummy moduli object replaces those carriers.

Cross-part contracts use the exact R18.1 nodes listed in the assembled reader.
K-descent in ConnectedPelComparison and FinitePelComparison remains a recorded gap;
EffectiveSmallLevel reuses R18.1/quaternionic-effective-stabilizers.
H6/moret-bailly-input-export retains its local-realization gaps.
-/
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.RingTheory.DedekindDomain.Different
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Adjugate
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Algebra.Module.Equiv.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.Basic.Complex.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.LinearAlgebra.Projectivization.Cardinality
import Mathlib.Algebra.Quaternion
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank

open scoped NumberField nonZeroDivisors

namespace TauCeti.HilbertModular

variable (F : Type*) [Field F] [NumberField F]

abbrev HilbertFractionalIdeal := FractionalIdeal (𝓞 F)⁰ F

noncomputable def polarizationLattice
    (c : HilbertFractionalIdeal F) (hc : c ≠ 0) : Submodule (𝓞 F) (F × F) := by
  sorry

theorem mem_polarizationLattice (c : HilbertFractionalIdeal F) (hc : c ≠ 0)
    (x : F × F) : x ∈ polarizationLattice F c hc ↔
    x.1 ∈ (1 : HilbertFractionalIdeal F) ∧
    x.2 ∈ c⁻¹ * FractionalIdeal.dual ℤ ℚ (1 : HilbertFractionalIdeal F) := by
  sorry

theorem polarizationLattice_rank (c : HilbertFractionalIdeal F) (hc : c ≠ 0) :
    Module.Projective (𝓞 F) (polarizationLattice F c hc) ∧
    Module.Free ℤ (polarizationLattice F c hc) ∧
    Module.rank (𝓞 F) (polarizationLattice F c hc) = 2 ∧
    Module.rank ℤ (polarizationLattice F c hc) = 2 * Module.finrank ℚ F := by
  sorry

theorem polarizationLattice_rescale (c : HilbertFractionalIdeal F) (hc : c ≠ 0)
    (a : Fˣ) :
    (polarizationLattice F c hc).map
      (LinearMap.prodMap (LinearMap.id : F →ₗ[𝓞 F] F)
        ((a⁻¹ : Fˣ) • (LinearMap.id : F →ₗ[𝓞 F] F))) =
    polarizationLattice F (FractionalIdeal.spanSingleton (𝓞 F)⁰ (a : F) * c)
      (by sorry) := by
  sorry

-- TauCeti.HilbertModular.lattice_Q
example (x : ℚ × ℚ) :
    x ∈ polarizationLattice ℚ 1 one_ne_zero ↔
      (∃ a : ℤ, (a : ℚ) = x.1) ∧ (∃ b : ℤ, (b : ℚ) = x.2) := by
  sorry

-- TauCeti.HilbertModular.lattice_nonprincipal
example (c : HilbertFractionalIdeal F) (hc : c ≠ 0) :
    (polarizationLattice F c hc).map (LinearMap.snd (𝓞 F) F F) =
      ((c⁻¹ * FractionalIdeal.dual ℤ ℚ (1 : HilbertFractionalIdeal F)) :
        Submodule (𝓞 F) F) := by
  sorry

-- TauCeti.HilbertModular.lattice_different
example : (polarizationLattice F 1 one_ne_zero).map (LinearMap.snd (𝓞 F) F F) =
    (FractionalIdeal.dual ℤ ℚ (1 : HilbertFractionalIdeal F) : Submodule (𝓞 F) F) := by
  sorry

noncomputable def integralTraceFamily (c : HilbertFractionalIdeal F) (hc : c ≠ 0)
    (a : c) : polarizationLattice F c hc →ₗ[ℤ]
      polarizationLattice F c hc →ₗ[ℤ] ℤ := by
  sorry

theorem integralTraceFamily_apply (c : HilbertFractionalIdeal F) (hc : c ≠ 0)
    (a : c) (x y : polarizationLattice F c hc) :
    (integralTraceFamily F c hc a x y : ℚ) =
      Algebra.trace ℚ F ((a : F) *
        ((x : F × F).1 * (y : F × F).2 - (x : F × F).2 * (y : F × F).1)) := by
  sorry

theorem integralTraceFamily_parameter_add (c : HilbertFractionalIdeal F) (hc : c ≠ 0)
    (a b : c) : integralTraceFamily F c hc ⟨(a : F) + (b : F), by sorry⟩ =
      integralTraceFamily F c hc a + integralTraceFamily F c hc b := by
  sorry

theorem integralTraceFamily_balance (c : HilbertFractionalIdeal F) (hc : c ≠ 0)
    (a : c) (b : 𝓞 F) (x y : polarizationLattice F c hc) :
    integralTraceFamily F c hc ⟨(b : F) * (a : F), by sorry⟩ x y = integralTraceFamily F c hc a (b • x) y ∧
      integralTraceFamily F c hc a (b • x) y = integralTraceFamily F c hc a x (b • y) := by
  sorry

theorem integralTraceFamily_integral (c : HilbertFractionalIdeal F) (hc : c ≠ 0)
    (a : c) (x y : polarizationLattice F c hc) :
    ∃ z : ℤ, Algebra.trace ℚ F ((a : F) *
      ((x : F × F).1 * (y : F × F).2 - (x : F × F).2 * (y : F × F).1)) =
        (z : ℚ) := by
  sorry

theorem integralTraceFamily_alternating (c : HilbertFractionalIdeal F) (hc : c ≠ 0)
    (a : c) (x : polarizationLattice F c hc) : integralTraceFamily F c hc a x x = 0 := by
  sorry

-- TauCeti.HilbertModular.traceFamily_Q
example : integralTraceFamily ℚ 1 one_ne_zero ⟨1, by sorry⟩
    ⟨(1, 0), by sorry⟩ ⟨(0, 1), by sorry⟩ = 1 := by
  sorry

-- TauCeti.HilbertModular.traceFamily_zero
example (c : HilbertFractionalIdeal F) (hc : c ≠ 0) :
    integralTraceFamily F c hc ⟨0, by sorry⟩ = 0 := by
  sorry

noncomputable def traceAlternatingDual (L : Submodule (𝓞 F) (F × F)) :
    Submodule (𝓞 F) (F × F) := by
  sorry

theorem mem_traceAlternatingDual (L : Submodule (𝓞 F) (F × F)) (x : F × F) :
    x ∈ traceAlternatingDual F L ↔ ∀ y ∈ L,
      ∃ z : ℤ, Algebra.trace ℚ F (x.1 * y.2 - x.2 * y.1) = (z : ℚ) := by
  sorry

theorem lattice_duality (c : HilbertFractionalIdeal F) (hc : c ≠ 0) :
    traceAlternatingDual F (polarizationLattice F c hc) =
      (c : Submodule (𝓞 F) F).prod
        (FractionalIdeal.dual ℤ ℚ (1 : HilbertFractionalIdeal F) : Submodule (𝓞 F) F) := by
  sorry

noncomputable def congruenceUnits (a : Ideal (𝓞 F)) : Subgroup (𝓞 F)ˣ := by
  sorry

theorem mem_congruenceUnits (a : Ideal (𝓞 F)) (u : (𝓞 F)ˣ) :
    u ∈ congruenceUnits F a ↔ (u : 𝓞 F) - 1 ∈ a := by
  sorry

theorem congruenceUnits_mono (a b : Ideal (𝓞 F)) (h : a ≤ b) :
    congruenceUnits F a ≤ congruenceUnits F b := by
  sorry

abbrev integerLevelIdeal (M : ℕ) : Ideal (𝓞 F) := Ideal.span {(M : 𝓞 F)}

-- TauCeti.HilbertModular.units_Q_tame
example (N : ℕ) (hN : 3 ≤ N) : congruenceUnits ℚ (integerLevelIdeal ℚ N) = ⊥ := by
  sorry

-- TauCeti.HilbertModular.units_squareRoot: ε⁴=(17,12) in ℤ[√2].
example : (17 : ZMod 12) ^ 2 = 1 ∧
    (17 : ZMod 12) ≠ 1 ∧ (-17 : ZMod 12) ≠ 1 := by
  sorry

section UnitQuotients

variable (P : Subgroup (𝓞 F)ˣ)

noncomputable def congruenceUnitSquares (M : ℕ) : Subgroup P := by
  sorry

theorem mem_congruenceUnitSquares (M : ℕ) (u : P) :
    u ∈ congruenceUnitSquares F P M ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F M) ∧
        (u : (𝓞 F)ˣ) = η ^ 2 := by
  sorry

theorem congruenceUnitSquares_mono (M M' : ℕ) (h : M ∣ M') :
    congruenceUnitSquares F P M' ≤ congruenceUnitSquares F P M := by
  sorry

-- TauCeti.HilbertModular.squareImage_Q; P=⊥ is the Q positive-unit subgroup.
example (M : ℕ) : congruenceUnitSquares ℚ ⊥ M = ⊥ := by
  sorry

-- TauCeti.HilbertModular.squareImage_positive
example (η : (𝓞 F)ˣ) (σ : F →+* ℝ) :
    0 < σ (((η ^ 2 : (𝓞 F)ˣ) : 𝓞 F) : F) := by
  sorry

abbrev TamePolarizationGroup (N : ℕ) := P ⧸ congruenceUnitSquares F P N

noncomputable def tameDelta_mk (N : ℕ) : P →* TamePolarizationGroup F P N := by
  sorry

theorem tameDelta_eq (N : ℕ) (u v : P) :
    tameDelta_mk F P N u = tameDelta_mk F P N v ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F N) ∧
        (u : (𝓞 F)ˣ) * (v : (𝓞 F)ˣ)⁻¹ = η ^ 2 := by
  sorry

theorem tameDelta_lift (N : ℕ) {J : Type*} [Group J] (f : P →* J)
    (hf : ∀ u ∈ congruenceUnitSquares F P N, f u = 1) :
    ∃! fbar : TamePolarizationGroup F P N →* J,
      fbar.comp (tameDelta_mk F P N) = f := by
  sorry

noncomputable def tameDelta_changeLevel (N M : ℕ) (h : N ∣ M) :
    TamePolarizationGroup F P M →* TamePolarizationGroup F P N := by
  sorry

-- TauCeti.HilbertModular.delta_Q
example (N : ℕ) : Subsingleton (TamePolarizationGroup ℚ ⊥ N) := by
  sorry

-- TauCeti.HilbertModular.delta_square
example (hSq : ∀ η : (𝓞 F)ˣ, η ^ 2 ∈ P) (N : ℕ)
    (η : (𝓞 F)ˣ) (hη : η ∈ congruenceUnits F (integerLevelIdeal F N)) :
    tameDelta_mk F P N ⟨η ^ 2, hSq η⟩ = 1 := by
  sorry

noncomputable def connectedCongruenceUnits (p n : ℕ) : Subgroup P := by
  sorry

theorem mem_connectedCongruenceUnits (p n : ℕ) (u : P) :
    u ∈ connectedCongruenceUnits F P p n ↔
      (u : (𝓞 F)ˣ) ∈ congruenceUnits F (integerLevelIdeal F (p ^ n)) := by
  sorry

noncomputable abbrev connectedSquareDenominator (p n N : ℕ) :
    Subgroup (connectedCongruenceUnits F P p n) :=
    (congruenceUnitSquares F P (p ^ n * N)).comap
      (connectedCongruenceUnits F P p n).subtype

abbrev ConnectedPolarizationGroup (p n N : ℕ) :=
    (connectedCongruenceUnits F P p n) ⧸ connectedSquareDenominator F P p n N

noncomputable def connectedDelta_mk (p n N : ℕ) :
    (connectedCongruenceUnits F P p n) →* ConnectedPolarizationGroup F P p n N := by
  sorry

theorem connectedDelta_eq (p n N : ℕ) (u v : connectedCongruenceUnits F P p n) :
    connectedDelta_mk F P p n N u = connectedDelta_mk F P p n N v ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F (p ^ n * N)) ∧
        ((u : P) : (𝓞 F)ˣ) * ((v : P) : (𝓞 F)ˣ)⁻¹ = η ^ 2 := by
  sorry

noncomputable def connectedDelta_transition (p n r N : ℕ) (h : r ≤ n) :
    ConnectedPolarizationGroup F P p n N →* ConnectedPolarizationGroup F P p r N := by
  sorry

theorem connectedDelta_transition_comp (p n r s N : ℕ) (hsr : s ≤ r) (hrn : r ≤ n) :
    (connectedDelta_transition F P p r s N hsr).comp
      (connectedDelta_transition F P p n r N hrn) =
      connectedDelta_transition F P p n s N (hsr.trans hrn) := by
  sorry

-- TauCeti.HilbertModular.connectedDelta_Q
example (p n N : ℕ) : Subsingleton (ConnectedPolarizationGroup ℚ ⊥ p n N) := by
  sorry

noncomputable def connectedDeltaTowerLimit (p N : ℕ) :
    Subgroup ((n : ℕ) → ConnectedPolarizationGroup F P p (n + 1) N) := by
  sorry

theorem mem_connectedDeltaTowerLimit (p N : ℕ)
    (u : (n : ℕ) → ConnectedPolarizationGroup F P p (n + 1) N) :
    u ∈ connectedDeltaTowerLimit F P p N ↔ ∀ n,
      connectedDelta_transition F P p (n + 2) (n + 1) N (by omega) (u (n + 1)) =
        u n := by
  sorry

noncomputable def connectedLimitProjection (p N n : ℕ) :
    connectedDeltaTowerLimit F P p N →* ConnectedPolarizationGroup F P p (n + 1) N := by
  sorry

theorem connected_limit_finiteness [NumberField.IsTotallyReal F]
    (hSq : ∀ η : (𝓞 F)ˣ, η ^ 2 ∈ P) (p N : ℕ) (hp : p.Prime)
    (hN : 4 ≤ N) (hcop : Nat.Coprime p N) :
    Finite (connectedDeltaTowerLimit F P p N) ∧
      ∃ n₀, ∀ n ≥ n₀, Function.Injective (connectedLimitProjection F P p N n) := by
  sorry

end UnitQuotients

abbrev HilbertResidueRing (p n : ℕ) := (𝓞 F) ⧸ integerLevelIdeal F (p ^ n)

noncomputable def residueUnitReduction (p n : ℕ) :
    (𝓞 F)ˣ →* (HilbertResidueRing F p n)ˣ := by
  sorry

noncomputable def residuePositiveImage (P : Subgroup (𝓞 F)ˣ) (p n : ℕ) :
    Subgroup (HilbertResidueRing F p n)ˣ := by
  sorry

abbrev ResiduePolarizationComponents (P : Subgroup (𝓞 F)ˣ) (p n : ℕ) :=
    (HilbertResidueRing F p n)ˣ ⧸ residuePositiveImage F P p n

noncomputable def residueComponents_mk (P : Subgroup (𝓞 F)ˣ) (p n : ℕ) :
    (HilbertResidueRing F p n)ˣ →* ResiduePolarizationComponents F P p n := by
  sorry

theorem residueComponents_eq (P : Subgroup (𝓞 F)ˣ) (p n : ℕ)
    (u v : (HilbertResidueRing F p n)ˣ) :
    residueComponents_mk F P p n u = residueComponents_mk F P p n v ↔
      ∃ η : P, residueUnitReduction F p n η = u * v⁻¹ := by
  sorry

noncomputable def residueComponents_reduce (P : Subgroup (𝓞 F)ˣ)
    (p n r : ℕ) (h : r ≤ n) :
    ResiduePolarizationComponents F P p n →* ResiduePolarizationComponents F P p r := by
  sorry

-- TauCeti.HilbertModular.residueComponents_Q
example (p n : ℕ) :
    Nonempty (ResiduePolarizationComponents ℚ ⊥ p n ≃* (ZMod (p ^ n))ˣ) := by
  sorry

-- TauCeti.HilbertModular.residueComponents_unit
example (P : Subgroup (𝓞 F)ˣ) (p n : ℕ) (η : P) :
    residueComponents_mk F P p n (residueUnitReduction F p n η) = 1 := by
  sorry

noncomputable def HilbertFiniteGamma0 (p m n : ℕ) :
    Subgroup (Matrix.GeneralLinearGroup (Fin 2) (HilbertResidueRing F p n)) := by
  sorry

theorem finiteGamma0_mem (p m n : ℕ)
    (γ : Matrix.GeneralLinearGroup (Fin 2) (HilbertResidueRing F p n)) :
    γ ∈ HilbertFiniteGamma0 F p m n ↔
      (γ : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈
        Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)} := by
  sorry

noncomputable def finiteGamma0_star (p m n : ℕ) : Subgroup (HilbertFiniteGamma0 F p m n) := by
  sorry

theorem finiteGamma0_star_mem (p m n : ℕ) (γ : HilbertFiniteGamma0 F p m n) :
    γ ∈ finiteGamma0_star F p m n ↔ ∃ a : (ZMod (p ^ n))ˣ,
      Matrix.det ((γ : Matrix.GeneralLinearGroup (Fin 2) (HilbertResidueRing F p n)) :
        Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) =
        ((a : ZMod (p ^ n)).val : HilbertResidueRing F p n) := by
  sorry

-- TauCeti.HilbertModular.gamma0_m0
example (p n : ℕ) : HilbertFiniteGamma0 F p 0 n = ⊤ := by
  sorry

-- TauCeti.HilbertModular.gamma0_mn
example (p n : ℕ)
    (γ : Matrix.GeneralLinearGroup (Fin 2) (HilbertResidueRing F p n)) :
    γ ∈ HilbertFiniteGamma0 F p n n ↔
      (γ : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 = 0 := by
  sorry

noncomputable def levelScalar (p m n : ℕ) : (𝓞 F)ˣ →* HilbertFiniteGamma0 F p m n := by
  sorry

theorem levelScalar_matrix (p m n : ℕ) (η : (𝓞 F)ˣ) :
    ((levelScalar F p m n η : Matrix.GeneralLinearGroup (Fin 2) (HilbertResidueRing F p n)) :
      Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) =
      Matrix.scalar (Fin 2) (residueUnitReduction F p n η : HilbertResidueRing F p n) := by
  sorry

noncomputable def hilbertLevelScalarKernel (p m n N : ℕ) :
    Subgroup (HilbertFiniteGamma0 F p m n) := by
  sorry

theorem levelScalarKernel_mem (p m n N : ℕ) (γ : HilbertFiniteGamma0 F p m n) :
    γ ∈ hilbertLevelScalarKernel F p m n N ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F N) ∧
        levelScalar F p m n η = γ := by
  sorry

instance levelScalarKernel_normal (p m n N : ℕ) :
    (hilbertLevelScalarKernel F p m n N).Normal := by
  sorry

theorem levelScalarKernel_quotient (p m n N : ℕ) (hcop : Nat.Coprime p N) :
    Nonempty (hilbertLevelScalarKernel F p m n N ≃*
      ((congruenceUnits F (integerLevelIdeal F N)) ⧸
        (congruenceUnits F (integerLevelIdeal F (p ^ n * N))).comap
          (congruenceUnits F (integerLevelIdeal F N)).subtype)) := by
  sorry

-- TauCeti.HilbertModular.scalarKernel_Q
example (p m n N : ℕ) (hN : 4 ≤ N) : hilbertLevelScalarKernel ℚ p m n N = ⊥ := by
  sorry

-- TauCeti.HilbertModular.scalarKernel_central
example (p m n N : ℕ) (z : hilbertLevelScalarKernel F p m n N)
    (γ : HilbertFiniteGamma0 F p m n) : (z : HilbertFiniteGamma0 F p m n) * γ =
      γ * (z : HilbertFiniteGamma0 F p m n) := by
  sorry

abbrev HilbertEffectiveGamma0 (p m n N : ℕ) :=
    (HilbertFiniteGamma0 F p m n) ⧸ hilbertLevelScalarKernel F p m n N

noncomputable def effectiveLevel_mk (p m n N : ℕ) :
    HilbertFiniteGamma0 F p m n →* HilbertEffectiveGamma0 F p m n N := by
  sorry

theorem effectiveLevel_quotient (p m n N : ℕ) {J : Type*} [Group J]
    (f : HilbertFiniteGamma0 F p m n →* J)
    (hf : ∀ z ∈ hilbertLevelScalarKernel F p m n N, f z = 1) :
    ∃! fbar : HilbertEffectiveGamma0 F p m n N →* J,
      fbar.comp (effectiveLevel_mk F p m n N) = f := by
  sorry

-- TauCeti.HilbertModular.effective_Q
example (p m n N : ℕ) (hN : 4 ≤ N) :
    Nonempty (HilbertEffectiveGamma0 ℚ p m n N ≃* HilbertFiniteGamma0 ℚ p m n) := by
  sorry

-- TauCeti.HilbertModular.effective_kernel
example (p m n N : ℕ) (γ : HilbertFiniteGamma0 F p m n) :
    effectiveLevel_mk F p m n N γ = 1 ↔ γ ∈ hilbertLevelScalarKernel F p m n N := by
  sorry

section DiagonalGroup

variable (P : Subgroup (𝓞 F)ˣ)

noncomputable def diagonalLevelRelation (p m n N : ℕ) :
    Subgroup ((HilbertFiniteGamma0 F p m n) × P) := by
  sorry

theorem mem_diagonalLevelRelation (p m n N : ℕ)
    (u : (HilbertFiniteGamma0 F p m n) × P) :
    u ∈ diagonalLevelRelation F P p m n N ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F N) ∧
        levelScalar F p m n η = u.1 ∧ η ^ 2 = (u.2 : (𝓞 F)ˣ) := by
  sorry

instance diagonalLevelRelation_normal (p m n N : ℕ) :
    (diagonalLevelRelation F P p m n N).Normal := by
  sorry

abbrev HilbertDiagonalLevelGroup (p m n N : ℕ) :=
    ((HilbertFiniteGamma0 F p m n) × P) ⧸ diagonalLevelRelation F P p m n N

noncomputable def diagonalLevel_mk (p m n N : ℕ) :
    ((HilbertFiniteGamma0 F p m n) × P) →* HilbertDiagonalLevelGroup F P p m n N := by
  sorry

theorem diagonalLevel_relation (hSq : ∀ η : (𝓞 F)ˣ, η ^ 2 ∈ P)
    (p m n N : ℕ) (η : (𝓞 F)ˣ)
    (hη : η ∈ congruenceUnits F (integerLevelIdeal F N)) :
    diagonalLevel_mk F P p m n N (levelScalar F p m n η, ⟨η ^ 2, hSq η⟩) = 1 := by
  sorry

-- TauCeti.HilbertModular.diagonal_Q
example (p m n N : ℕ) (hN : 4 ≤ N) :
    Nonempty (HilbertDiagonalLevelGroup ℚ ⊥ p m n N ≃* HilbertFiniteGamma0 ℚ p m n) := by
  sorry

-- TauCeti.HilbertModular.diagonal_square
example (p m n N : ℕ) (u : (HilbertFiniteGamma0 F p m n) × P)
    (hu : u ∈ diagonalLevelRelation F P p m n N) :
    ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F N) ∧
      (u.2 : (𝓞 F)ˣ) = η ^ 2 := by
  sorry

end DiagonalGroup

section AdjugateAction

variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]

noncomputable def adjugateFrameAction (γ : Matrix.GeneralLinearGroup (Fin 2) R)
    (α : (Fin 2 → R) →ₗ[R] M) : (Fin 2 → R) →ₗ[R] M := by
  sorry

theorem adjugateFrameAction_apply (γ : Matrix.GeneralLinearGroup (Fin 2) R)
    (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction γ α = α.comp
      (Matrix.mulVecLin (Matrix.adjugate (γ : Matrix (Fin 2) (Fin 2) R))) := by
  sorry

theorem adjugate_level_action (γ δ : Matrix.GeneralLinearGroup (Fin 2) R)
    (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction γ (adjugateFrameAction δ α) = adjugateFrameAction (γ * δ) α := by
  sorry

theorem adjugateFrameAction_scalar (u : Rˣ) (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction (Matrix.GeneralLinearGroup.scalar (Fin 2) u) α = (u : R) • α := by
  sorry

end AdjugateAction

-- The arithmetic content of H4's two explicit countercalculations.
example : (17 : ZMod 4) = 1 ∧ (12 : ZMod 4) = 0 ∧
    (17 : ZMod 3) = -1 ∧ (12 : ZMod 3) = 0 := by
  sorry

example : Set.range (fun x : ZMod 6 => 2 * x) = {0, 2, 4} := by
  sorry

example : ¬ Function.Surjective (fun x : ZMod 6 => 2 * x) := by
  sorry

end TauCeti.HilbertModular

/-!
# Full contract and omission ledger

All packet definition, API and test names occur below. A name marked NATIVE has
an executable signature above, sometimes for a parameterized arithmetic core.
Its full intended mathematical contract remains the statement printed here.
A name marked OMITTED has no executable signature: the necessary relative
abelian/moduli, Shimura, ordered-module or adelic supplier interface is absent.
The omission follows PROTOCOL §13; it must not be counted as a typed signature.
No generic Prop field stands in for a missing mathematical hypothesis.

For every group with a parameter P, the Hilbert specialization is
P=NumberField.totallyPositiveIntegerUnits (K:=F), with the square-containment
hypothesis provided by NumberField.sq_mem_totallyPositiveIntegerUnits. The
positive-unit module was read at the pinned commit but lacks a compiled shared
build module, so that specialization is not elaborated in this file.

The typed lattice-duality signature covers the lattice equality. Its adelic
stabilizer equality is omitted until the finite-adelic supplier carrier exists.
The typed adjugate action is on linear frames. Its restriction to actual torsion
frames, pairing multipliers and moduli spaces needs the geometric suppliers.
The typed limit-finiteness signature contains injectivity of the eventual
projection to its image; it deliberately makes no surjectivity claim.

## HilbertModularVarietiesAndShimuraCurves:H0/derived-centres
Derived groups and algebraic centres [theorem]
Contract: On D5’s groups G and G*, both derived groups are Res_{F/ℚ}SL₂ and their inclusion is the identity there. Z(G)=Res_{F/ℚ}G_m. Z(G*) is the subgroup of scalar matrices t I₂ with t² in the diagonal G_m, including its finite geometric components; its identity component is diagonal G_m. Dimensions are 4g and 3g+1. No connectedness of the full centre of G* is assumed.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: ShimuraData:D5/hilbert-datum, ShimuraData:D5/hilbert-star-datum
Suggested declaration: TauCeti.HilbertModular.derived_centres [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison
Independent signs and common signs [comparison]
Contract: The map of D5 data identifies the common-sign G* domain H^Σ ⊔ (H⁻)^Σ with the corresponding two components of the G domain (H^±)^Σ. The latter has 2^g components; both have complex dimension g and reflex field ℚ. The connected positive domains are equal, but the full conjugacy classes differ for g>1.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: ShimuraData:D5/hilbert-datum, ShimuraData:D5/hilbert-star-datum, HilbertModularVarietiesAndShimuraCurves:H0/derived-centres
Suggested declaration: TauCeti.HilbertModular.domain_comparison [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H0/polarization-lattice
Polarization lattice [definition]
Contract: For a nonzero invertible fractional ideal c of O, let D=Fractional Ideal.dual ℤ ℚ O=d⁻¹ and L_c=O⊕c⁻¹D⊂F², with row-vector convention. This is the integral lattice refining D5’s rational representation. For an integral ideal c, K_c is its finite adelic stabilizer; a column convention uses the transpose-conjugate lattice.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: mathlib:FractionalIdeal.dual, mathlib:FractionalIdeal.dual_eq_mul_inv, ShimuraData:D5/hilbert-trace-embedding
API TauCeti.HilbertModular.polarizationLattice [constructor; NATIVE core above]: Construct L_c as the O-submodule O×c⁻¹d⁻¹ of F×F.
API TauCeti.HilbertModular.mem_polarizationLattice [characterisation; NATIVE core above]: (x,y)∈L_c iff x∈O and y∈c⁻¹d⁻¹.
API TauCeti.HilbertModular.polarizationLattice_rank [structure; NATIVE core above]: L_c is projective of rank 2 over O and free of rank 2g over ℤ.
API TauCeti.HilbertModular.polarizationLattice_rescale [functoriality; NATIVE core above]: For a∈F×, diag(1,a⁻¹) carries L_c to L_{ac} in the row convention.
Test TauCeti.HilbertModular.lattice_Q [computation; NATIVE example above]: For F=ℚ,c=ℤ, L_c=ℤ².
Test TauCeti.HilbertModular.lattice_nonprincipal [non-example; NATIVE example above]: L_c is defined for a nonprincipal c without choosing a generator.
Test TauCeti.HilbertModular.lattice_different [compatibility; NATIVE example above]: For c=O the second summand is the pinned trace dual of O, not O unless d is trivial.

## HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family
Integral trace polarization family [definition]
Contract: For a∈c and x,y∈L_c set ψ_{c,a}(x,y)=Tr_{F/ℚ}(a(x₁y₂−x₂y₁))∈ℤ. This is a family parametrized O-linearly by c, rather than a canonical principal symplectic form. Nonzero a gives a nondegenerate rational alternating form; totally positive a has the polarization sign prescribed by D5 (negate the form if the positive h(i) convention is used).
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H0/polarization-lattice, mathlib:Submodule.mem_traceDual, mathlib:Algebra.trace, ShimuraData:D5/hilbert-trace-form
API TauCeti.HilbertModular.integralTraceFamily [constructor; NATIVE core above]: Map c to the alternating ℤ-bilinear forms on L_c by a↦ψ_{c,a}.
API TauCeti.HilbertModular.integralTraceFamily_apply [simp; NATIVE core above]: Evaluation is Tr(a(x₁y₂−x₂y₁)).
API TauCeti.HilbertModular.integralTraceFamily_parameter_add [functoriality; NATIVE core above]: ψ_{a+b}=ψ_a+ψ_b and ψ_0=0.
API TauCeti.HilbertModular.integralTraceFamily_integral [compatibility; NATIVE core above]: Its rational image agrees with D5’s trace representation multiplied by a.
API TauCeti.HilbertModular.integralTraceFamily_balance [relation; NATIVE core above]: For b∈O, ψ_{ba}(x,y)=ψ_a(bx,y)=ψ_a(x,by). This specifies the O-action on the family of Z-bilinear forms; it is not scalar multiplication of their Z-valued outputs.
Test TauCeti.HilbertModular.traceFamily_Q [computation; NATIVE example above]: Over ℚ,c=ℤ,a=1 its value on the two standard basis vectors is 1.
Test TauCeti.HilbertModular.traceFamily_zero [degenerate; NATIVE example above]: The a=0 form is zero, hence is not declared nondegenerate.
Test TauCeti.HilbertModular.traceFamily_ramified [non-example; OMITTED supplier example]: For F=ℚ(√2), the second summand uses d⁻¹=(2√2)⁻¹O, preventing a false O² self-duality assertion.

## HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality
Trace-dual lattice and its stabilizer [theorem]
Contract: For ψ(x,y)=Tr(x₁y₂−x₂y₁), the ℤ-dual lattice of L_c is c⊕d⁻¹=c L_c. Its finite adelic row stabilizer is K_c=GL₂(A_{F,f})∩[[Ô,(cd)⁻¹Ô],[cdÔ,Ô]]. Intersecting with G*(A_f) imposes rational scalar determinant. These are equalities of lattices and groups, including nonprincipal c.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H0/polarization-lattice, HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family, mathlib:FractionalIdeal.dual_eq_mul_inv, mathlib:FractionalIdeal.dual_dual
Suggested declaration: TauCeti.HilbertModular.lattice_duality [NATIVE core above]

## HilbertModularVarietiesAndShimuraCurves:H0/type-witnesses
Hodge and abelian type witnesses [theorem]
Contract: D5’s actual trace embedding of (G*,X*) into the Siegel datum, with the sign fixed by integral Trace Family, is a D4 Hodge-type witness. The identity Res SL₂→Res SL₂ on the derived groups induces the common connected adjoint datum, and is a D4 abelian-type witness for (G,X). It does not assert a Hodge-type embedding of the exact group G.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H0/derived-centres, HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison, HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family, ShimuraData:D5/hilbert-trace-embedding, ShimuraData:D4/hodge-type, ShimuraData:D4/abelian-type
Suggested declaration: TauCeti.HilbertModular.type_witnesses [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module
Ordered polarization module [definition]
Contract: An ordered invertible O-module is a projective rank-one O-module c with, for each real embedding τ, a chosen component c_τ^+ of (c⊗_{O,τ}ℝ)\{0}. Its positive cone is the set of elements whose images lie in all selected components. Fractional ideals have the standard embedding order, and ordered isomorphisms preserve each component.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: mathlib:FractionalIdeal.dual, tauceti:NumberField.IsTotallyPositive
API TauCeti.HilbertModular.OrderedPolarizationModule [constructor; OMITTED supplier signature]: Package the invertible O-module with the chosen real half-lines.
API TauCeti.HilbertModular.positiveCone [data; OMITTED supplier signature]: The intersection of their inverse images in c.
API TauCeti.HilbertModular.orderedModule_iso [characterisation; OMITTED supplier signature]: A module isomorphism is ordered iff it sends each selected real half-line to the selected half-line.
API TauCeti.HilbertModular.standard_positiveCone [compatibility; OMITTED supplier signature]: For standard c=O, its cone equals {a∈O | Number Field.Is Totally Positive(a:F)}.
Test TauCeti.HilbertModular.ordered_Q [computation; OMITTED supplier example]: For O=ℤ the standard cone consists of positive integers.
Test TauCeti.HilbertModular.ordered_negative [non-example; OMITTED supplier example]: Multiplication by−1 is not an automorphism of the standard ordered module.
Test TauCeti.HilbertModular.ordered_nonprincipal [compatibility; OMITTED supplier example]: An invertible nonprincipal ideal with its embedding cones is admitted without a basis.

## HilbertModularVarietiesAndShimuraCurves:H1/symmetric-polarizations
Symmetric real multiplication polarizations [definition]
Contract: For an A1 abelian scheme A/S of relative dimension g with unital injective real multiplication ι:O→End_S(A), P(A,ι) is the étale sheaf of O-linear maps f:A→A∨ satisfying f=f∨ under A2 biduality. P(A,ι)^+ is the subsheaf of polarizations, defined by A2 ampleness. On the Hilbert locus the sheaf is an invertible O-module with its embedding-wise order; the evaluation condition is imposed by the separate c-polarization definition.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module, AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A2, AbelianSchemesAndArithmeticModuli:A3
API TauCeti.HilbertModular.HilbertPolarizationModule [constructor; OMITTED supplier signature]: The symmetric O-linear Hom sheaf P(A,ι).
API TauCeti.HilbertModular.hilbertPolarizationModule_positive [projection; OMITTED supplier signature]: The subsheaf of positive homomorphisms from A2 ampleness.
API TauCeti.HilbertModular.hilbertPolarizationModule_mem [characterisation; OMITTED supplier signature]: A section is an O-linear map equal to its bidual transpose.
API TauCeti.HilbertModular.hilbertPolarizationModule_pullback [functoriality; OMITTED supplier signature]: Pullback is the A2 Hom/duality base-change map on the stipulated Hilbert locus.
API TauCeti.HilbertModular.hilbertPolarizationModule_ext [extensionality; OMITTED supplier signature]: Two sections of P(A,ι) agree if their underlying A→A∨ morphisms agree; the symmetry and O-linearity proofs add no extra section data.
Test TauCeti.HilbertModular.polModule_Q [compatibility; OMITTED supplier example]: For a geometric elliptic curve the symmetric Hom group is ℤ, with its degree-positive ray.
Test TauCeti.HilbertModular.polModule_zero [degenerate; OMITTED supplier example]: Zero is symmetric and is excluded from the positive cone.
Test TauCeti.HilbertModular.polModule_negative [non-example; OMITTED supplier example]: If λ is a polarization, −λ is symmetric but not positive.

## HilbertModularVarietiesAndShimuraCurves:H1/c-polarization
Ordered c-polarization [definition]
Contract: For an ordered invertible O-module c and a real-multiplication abelian scheme A/S, a c-polarization is an ordered isomorphism c_S≅P(A,ι), preserving the positive cones, whose evaluation A⊗_O c→A∨ is an isomorphism. The Serre tensor, duality and positivity are A2/A3 imports. This is the DP condition, including nonprincipal c.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/symmetric-polarizations, HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module, AbelianSchemesAndArithmeticModuli:A3, AbelianSchemesAndArithmeticModuli:A2/rosati-involution
API TauCeti.HilbertModular.CPolarization [constructor; OMITTED supplier signature]: The ordered isomorphism with the DP evaluation condition.
API TauCeti.HilbertModular.cPolarization_eval [projection; OMITTED supplier signature]: The induced evaluation isomorphism A⊗_O c≅A∨.
API TauCeti.HilbertModular.cPolarization_baseChange [functoriality; OMITTED supplier signature]: Evaluation and positivity commute with arbitrary base change.
API TauCeti.HilbertModular.cPolarization_rosati [compatibility; OMITTED supplier signature]: Every positive section gives a polarization whose Rosati involution fixes O.
Test TauCeti.HilbertModular.cPol_elliptic [compatibility; OMITTED supplier example]: For F=ℚ,c=ℤ this is the principal elliptic polarization.
Test TauCeti.HilbertModular.cPol_negative [non-example; OMITTED supplier example]: The negative symmetric map reverses the cone and is not a c-polarization.
Test TauCeti.HilbertModular.cPol_nonprincipal [non-example; OMITTED supplier example]: No global generator of c is required.

## HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance
Hilbert PEL instance [construction]
Contract: For c as in H1, specialize M0/M1 with B=F, *=id, V=F², L=L_c and the c-indexed integral trace polarization family. At primes where a chosen positive a∈c and d give the good PEL lattice hypotheses, this is the usual trace-pairing PEL datum; the homological h and positivity sign agree with H0. At other primes it is a generic-fibre datum with a DP integral extension constructed in H2, not an application of M2 smoothness.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H0/type-witnesses, HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality, HilbertModularVarietiesAndShimuraCurves:H1/c-polarization, PELModuli:M0/integral-pel-datum, PELModuli:M1/pel-abelian-scheme, mathlib:AlgebraicGeometry.Scheme
API TauCeti.HilbertModular.hilbertPELInstance [constructor; OMITTED supplier signature]: The specialization map from the ordered c-polarization data to M0/M1.
API TauCeti.HilbertModular.hilbertPEL_involution [simp; OMITTED supplier signature]: The adjoint action of every a∈F is the identity involution a↦a.
API TauCeti.HilbertModular.hilbertPEL_lattice [data; OMITTED supplier signature]: The integral lattice is L_c and its trace dual is c L_c.
API TauCeti.HilbertModular.hilbertPEL_moduli_equiv [equivalence; OMITTED supplier signature]: The specialized M1 objects are exactly H1’s HBAV objects with the listed level and determinant conditions.
Test TauCeti.HilbertModular.pel_Q [compatibility; OMITTED supplier example]: For F=ℚ,c=ℤ obtain the genus-one PEL object.
Test TauCeti.HilbertModular.pel_nonprincipal [non-example; OMITTED supplier example]: For nonprincipal c the lattice comparison retains c rather than replacing it by O.
Test TauCeti.HilbertModular.pel_ramified [non-example; OMITTED supplier example]: A ramified prime failing the perfect-lattice condition cannot be declared smooth by M2.

## HilbertModularVarietiesAndShimuraCurves:H1/hilbert-determinant
Full Hilbert determinant condition [theorem]
Contract: In characteristic zero, and on the integral Rapoport locus, Lie(A) is rank one over O⊗𝒪_S and for every a∈O its characteristic polynomial is Norm_{F/ℚ}(T−a). This full polynomial is the M0 determinant condition; equality of traces alone is insufficient in ramified characteristic. The all-base DP implication is proved in H2 from flatness of the universal model and pullback, not from equality on geometric points.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance, PELModuli:M0/determinant-condition, AbelianSchemesAndArithmeticModuli:A4
Suggested declaration: TauCeti.HilbertModular.hilbert_determinant [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors
Hilbert tame level functors [definition]
Contract: Over ℤ[1/N], N≥4, the tame μ_N level is an O-linear closed immersion d⁻¹⊗_ℤμ_N→A[N]. Define the K₀(c,N), K₁(c,N) and K(c,N) variants through the corresponding finite-flat subgroup, marked quotient/Cartier-dual generator, and full lattice-level conditions. Their adelic groups are the row stabilizers of H0 with reductions respectively [[*,*],[0,*]], [[*,*],[0,1]], and I₂. The μ_N functor matches this K₁ convention, not an unexplained e₁ convention.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/c-polarization, HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality, AbelianSchemesAndArithmeticModuli:A3, PELModuli:M1/moduli-problem
API TauCeti.HilbertModular.HilbertTameLevel [constructor; OMITTED supplier signature]: An O-linear closed immersion d⁻¹⊗μ_N→A[N], N invertible.
API TauCeti.HilbertModular.hilbertTameLevel_pullback [functoriality; OMITTED supplier signature]: Pullback preserves the level and closed immersion.
API TauCeti.HilbertModular.hilbertTameLevel_K1 [compatibility; OMITTED supplier signature]: The complex lattice stabilizer is K₁(c,N) with lower-right entry 1.
API TauCeti.HilbertModular.hilbertTameLevel_forget [projection; OMITTED supplier signature]: The full-level, marked-quotient and subgroup levels have their compatible forgetful maps.
Test TauCeti.HilbertModular.tame_Q [compatibility; OMITTED supplier example]: For F=ℚ the μ_N inclusion is the Cartier-dual version of the usual Y₁(N) marking after the stated isogeny/convention comparison.
Test TauCeti.HilbertModular.tame_badN [non-example; OMITTED supplier example]: If N is not invertible, the same level is not silently treated as an étale constant basis.
Test TauCeti.HilbertModular.tame_transpose [computation; OMITTED supplier example]: Conjugating the row convention by the standard symplectic matrix converts the marked e₂ quotient stabilizer to the e₁ stabilizer.

## HilbertModularVarietiesAndShimuraCurves:H1/good-representability
Good-prime representability and universal family [theorem]
Contract: For the H1 PEL instance with M2’s good-prime hypotheses, the specialized moduli is a smooth separated finite-type algebraic stack. If N≥4 rigidifies all automorphisms it is an algebraic space with its descended universal HBAV. Scheme and quasi-projective assertions require the DP representability/ample hypotheses used in H2 or the later compactification supplier; they are not inferred merely from trivial inertia. The μ_N DP scheme over ℤ[1/N] is constructed in H2 at arbitrary primes.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance, HilbertModularVarietiesAndShimuraCurves:H1/hilbert-determinant, HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors, PELModuli:M2/representability, PELModuli:M2/universal-family
Suggested declaration: TauCeti.HilbertModular.good_representability [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing
Linearized Hilbert Weil pairing [construction]
Contract: For m invertible on S and a c-polarized HBAV, define ẽ_m:A[m]×A∨[m]→d⁻¹⊗_ℤμ_m by ẽ_m(x,y)(a)=e_m(ax,y). Under the trace identification d⁻¹≅Hom_ℤ(O,ℤ), it is perfect O-bilinear and Tr∘ẽ_m=e_m. Combining λ⁻¹ with it gives an alternating pairing on A∨[m] with target c d⁻¹⊗μ_m; equivalently its first argument is twisted by c⁻¹ and the target is d⁻¹⊗μ_m. The pairing on integral finite-flat torsion is an fppf pairing, not a pairing just of geometric points.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/c-polarization, HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality, mathlib:Submodule.mem_traceDual, AbelianSchemesAndArithmeticModuli:A3, mathlib:AlgebraicGeometry.Scheme
API TauCeti.HilbertModular.linearWeilPairing [constructor; OMITTED supplier signature]: The O-linearized pairing on A[m]×A∨[m].
API TauCeti.HilbertModular.linearWeilPairing_trace [compatibility; OMITTED supplier signature]: Tr(ẽ_m(x,y))=e_m(x,y).
API TauCeti.HilbertModular.linearWeilPairing_Olinear [structure; OMITTED supplier signature]: ẽ_m(ax,y)=a·ẽ_m(x,y)=ẽ_m(x,ay).
API TauCeti.HilbertModular.linearWeilPairing_baseChange [functoriality; OMITTED supplier signature]: The construction commutes with base change and compatible torsion transition maps.
Test TauCeti.HilbertModular.weil_Q [compatibility; OMITTED supplier example]: For O=ℤ,d=ℤ the linearized and original Weil pairings agree.
Test TauCeti.HilbertModular.weil_codifferent [non-example; OMITTED supplier example]: For ramified F the target is d⁻¹⊗μ_m, rather than a canonically identified O⊗μ_m.
Test TauCeti.HilbertModular.weil_zero [degenerate; OMITTED supplier example]: Pairing either zero torsion section gives the identity section of μ_m and the zero additive linearization.

## HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws
Pairing and ideal change laws [theorem]
Contract: At p, choose β:c⁻¹O_p≅d⁻¹(1). If β′=u β with u∈O_p× and the pulled-back pairing is b·⟨ , ⟩_β, then b′=u⁻¹b. Rescaling a c-polarization by η∈O×,+ while fixing the A∨ basis changes b to η⁻¹b. An ordered isomorphism c→c′ transports both λ and β and yields a comparison functor; totally positive multiplication and changes of roots of unity satisfy the corresponding multiplicative cocycle laws. The μ_N comparison does not make c d⁻¹(1) canonically trivial.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing, HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module, HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors
Suggested declaration: TauCeti.HilbertModular.pairing_choice_laws [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison
Complex Hilbert moduli comparison [comparison]
Contract: For N≥4 and the selected ideal/lattice data, X(c,μ_N)_ℂ identifies with Sh_{K₁*(c,N)}(G*,X*), and the variants identify with their matching K,K₀,K₁ levels. The isomorphism is induced by polarized homology with the trace lattice and the H0 datum. It includes M3’s actual component decomposition; changing ideal representatives or β/root choices changes the displayed moduli trivialization by the H1 comparison laws.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance, HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors, HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws, PELModuli:M3/complex-points, PELModuli:M3/algebraization-of-components
Suggested declaration: TauCeti.HilbertModular.complex_hilbert_comparison [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H2/dp-local-model
Hilbert self-orthogonal local model [definition]
Contract: For a base S, the Hilbert local model LM_O/S classifies (O⊗𝒪_T)-submodules W⊂(O⊗𝒪_T)² which are locally direct summands of rank g as 𝒪_T-modules and satisfy W=W^⊥ for the O⊗𝒪_T-valued wedge pairing. It is the corresponding closed subscheme of the rank-g Grassmannian. Rank-one freeness over O⊗𝒪_T is an open condition, not part of the whole local model at ramified primes.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality, AlgebraicModuliForArithmeticGeometry:R09.1
API TauCeti.HilbertModular.HilbertLocalModel [constructor; OMITTED supplier signature]: The closed self-orthogonal O-stable Grassmannian model.
API TauCeti.HilbertModular.hilbertLocalModel_points [characterisation; OMITTED supplier signature]: T-points are exactly the specified rank-g self-orthogonal direct summands.
API TauCeti.HilbertModular.hilbertLocalModel_baseChange [functoriality; OMITTED supplier signature]: Construction commutes with arbitrary base change.
API TauCeti.HilbertModular.hilbertLocalModel_rapoport [projection; OMITTED supplier signature]: The open rank-one O⊗𝒪_T submodule locus is the Rapoport local-model locus.
Test TauCeti.HilbertModular.localModel_Q [computation; OMITTED supplier example]: For O=ℤ obtain ℙ¹_S, the space of lines in 𝒪_S².
Test TauCeti.HilbertModular.localModel_unramified [compatibility; OMITTED supplier example]: After an étale splitting of O at an unramified prime obtain a product ofg projective lines.
Test TauCeti.HilbertModular.localModel_ramified [non-example; OMITTED supplier example]: For k[T]/T², the submodule generated by Te₁ and Te₂ is self-orthogonal of k-dimension 2 but not free of rank-one over k[T]/T².

## HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model
Deligne–Pappas integral Hilbert model [construction]
Contract: Fix a nonzero ordered invertible integral ideal c, N≥4 with (N,Norm(c))=1, and p∤N. The DP μ_N functor of H1, including the evaluation isomorphism, has a separated finite-type algebraic-space model over ℤ_(p), with its universal HBAV; an auxiliary sufficiently fine full tame level gives an étale presentation. Its ℚ-fibre is H1’s canonical geometric Hilbert variety. BHW’s stronger scheme formulation requires the stated scheme-representability refinement, recorded as a gap rather than attributed to good-prime M2 at ramified p.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/c-polarization, HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors, HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison, PELModuli:M1/change-of-lattice-and-primes, AlgebraicModuliForArithmeticGeometry:R09.3
API TauCeti.HilbertModular.DelignePappasHilbertModel [constructor; OMITTED supplier signature]: The integral algebraic-space moduli object with universal HBAV.
API TauCeti.HilbertModular.dpHilbertModel_moduli [universal-property; OMITTED supplier signature]: Morphisms T→X_DP correspond functorially to DP c-polarized HBAVs with μ_N level over T.
API TauCeti.HilbertModular.dpHilbertModel_genericFibre [compatibility; OMITTED supplier signature]: Its ℚ-fibre identifies with the H1 canonical moduli variety with matching level.
API TauCeti.HilbertModular.dpHilbertModel_changeLevel [functoriality; OMITTED supplier signature]: Prime-to-p tame level forgetful maps and the universal family commute with pullback.
Test TauCeti.HilbertModular.dp_Q [compatibility; OMITTED supplier example]: For F=ℚ,c=ℤ recover the good integral Y₁(N) moduli problem in the μ_N convention.
Test TauCeti.HilbertModular.dp_dyadic [non-example; OMITTED supplier example]: For F=ℚ(√2),p=2,N=5 the DP evaluation functor is allowed; the whole model is not declared smooth.
Test TauCeti.HilbertModular.dp_badTame [non-example; OMITTED supplier example]: N divisible byp is excluded from this prime-to-p tame construction.

## HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal
Flatness and normality at every prime [theorem]
Contract: For the DP model at p∤N, its structure map is flat and locally a complete intersection of relative dimension g; each geometric special fibre is normal, and its nonsmooth locus has codimension at least 2. The total space over ℤ_(p) is normal. If p∤disc(F) the whole model is smooth. These assertions hold at p=2; ramified p may have singular points.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H2/dp-local-model, HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model, AbelianSchemesAndArithmeticModuli:A4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6
Suggested declaration: TauCeti.HilbertModular.dp_flat_normal [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H2/dp-determinant-all-bases
DP determinant identity on arbitrary bases [lemma]
Contract: The universal DP HBAV satisfies the full norm characteristic-polynomial identity for every a∈O on Lie(A). Therefore so does every pullback, including nonreduced bases. Proof uses H2 flatness and the generic H1 determinant identity; it does not infer a sheaf identity merely from field-valued points. Equivalence with a determinant-only moduli definition is a separate unresolved converse and is not needed here.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/hilbert-determinant, HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal, HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model, AbelianSchemesAndArithmeticModuli:A4
Suggested declaration: TauCeti.HilbertModular.dp_determinant_all_bases [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H2/rapoport-locus
Rapoport locus [definition]
Contract: X_R⊂X_DP is the open locus where ω_A (equivalently, via the polarized Hodge sequence, the relevant Lie module) is locally free of rank-one over O⊗𝒪_S. It has smooth structure map of relative dimension g. At unramified p it is all of X_DP; at ramified p its complement in each special fibre has codimension at least 2. No characteristic-zero embedding decomposition is imposed on a ramified integral base.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model, HilbertModularVarietiesAndShimuraCurves:H2/dp-local-model, HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal, AbelianSchemesAndArithmeticModuli:A4
API TauCeti.HilbertModular.HilbertRapoportLocus [constructor; OMITTED supplier signature]: The open rank-one O⊗𝒪_S locus of the DP model.
API TauCeti.HilbertModular.mem_rapoportLocus [characterisation; OMITTED supplier signature]: Membership is local rank-one freeness of ω_A over O⊗𝒪_S.
API TauCeti.HilbertModular.rapoportLocus_baseChange [functoriality; OMITTED supplier signature]: The open subspace and ω commute with pullback.
API TauCeti.HilbertModular.rapoportLocus_smooth [structure; OMITTED supplier signature]: Its structure map is smooth of relative dimension g.
Test TauCeti.HilbertModular.rapoport_Q [compatibility; OMITTED supplier example]: For F=ℚ the differential bundle is a line and X_R=X_DP.
Test TauCeti.HilbertModular.rapoport_unramified [computation; OMITTED supplier example]: For p∤disc(F), X_R is the whole model.
Test TauCeti.HilbertModular.rapoport_nonfree [non-example; OMITTED supplier example]: The k[T]/T² local-model module ⟨Te₁,Te₂⟩ fails the rank-one freeness test.

## HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport
Ordinary locus and its Rapoport inclusion [theorem]
Contract: Define the ordinary locus by A[p^∞] having ordinary slopes 0 and 1 (height 2g, dimension g), or equivalently invertible determinant Verschiebung on ω in characteristicp, using R07.2. For every rationalp, this open lies in X_R, so its completed neighborhood has the smooth Rapoport geometry. At a ramified prime, ω is rank-one over O⊗k on this locus; it need not split into embedding lines over the integral base.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H2/rapoport-locus, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2, AbelianSchemesAndArithmeticModuli:A4
Suggested declaration: TauCeti.HilbertModular.ordinary_rapoport [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal
Hilbert Hasse ideal [definition]
Contract: On the special fibre, specialize the generic R07.2 invariant Ha(A[p])=det(V*)∈(det ω_A)^{⊗(p−1)}. On an integral formal trivializing chart define I_Ha=(p,Ĥa), where Ĥa is any lift of that section. Changes of trivialization multiply the reduction by a unit, and changes of lift addp times a section, so these ideals glue. It defines the ordinary open by invertibility of Ha; the generic BT₁ invariant and Fargues LF remain owned by R07.2.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2
API TauCeti.HilbertModular.HilbertHasseIdeal [constructor; OMITTED supplier signature]: The coherent chartwise ideal (p,Ĥa) on the Hilbert formal model.
API TauCeti.HilbertModular.hilbertHasseIdeal_lift [characterisation; OMITTED supplier signature]: Replacing Ĥa by Ĥa+pf leaves the ideal unchanged.
API TauCeti.HilbertModular.hilbertHasseIdeal_trivialization [functoriality; OMITTED supplier signature]: Changing a line trivialization by a unit gives the same glued ideal.
API TauCeti.HilbertModular.hilbertHasseIdeal_ordinary [compatibility; OMITTED supplier signature]: Ha is invertible exactly on the intrinsic ordinary locus supplied by R07.2.
Test TauCeti.HilbertModular.hasse_p2 [computation; OMITTED supplier example]: At p=2 the line is det ω, with exponent 1.
Test TauCeti.HilbertModular.hasse_lift [compatibility; OMITTED supplier example]: The generators (p,Ĥa) and(p,Ĥa+pf) define equal ideals.
Test TauCeti.HilbertModular.hasse_supersingular [non-example; OMITTED supplier example]: For a supersingular elliptic fibre the invariant vanishes and the point is not ordinary.

## HilbertModularVarietiesAndShimuraCurves:H2/hasse-formal-domains
Formal Hasse neighborhoods and lift independence [construction]
Contract: For a complete p-adic base and a rational 0≤ε=a/b<1, specialize R2’s section-domain construction to det ω and Ha. On each trivializing chart take the admissible blowup chart for (Ĥa^b,p^a) in which Ĥa^b generates, with p-torsion removed; its generic fibre is |Ĥa|≥|p|^{a/b}. The chartwise models glue and the rational domain is independent of the lift. The strictε<1 is essential; no identical lift-independence assertion is made atε=1.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal, AdicSpacesPartII:R2/section-domain-formal-model, AdicSpacesPartII:R2/hasse-domain
API TauCeti.HilbertModular.hilbertHasseDomain [constructor; OMITTED supplier signature]: The formal model and adic rational domain for a/b<1.
API TauCeti.HilbertModular.hilbertHasseDomain_genericFibre [compatibility; OMITTED supplier signature]: Generic fibre is the inequality |Ĥa|^b≥|p|^a on each chart.
API TauCeti.HilbertModular.hilbertHasseDomain_lift [equivalence; OMITTED supplier signature]: Two lifts congruent modulo p determine equal rational domains forε<1.
API TauCeti.HilbertModular.hilbertHasseDomain_monotone [functoriality; OMITTED supplier signature]: Forε≤ε′<1 the ε-domain embeds into the ε′-domain.
Test TauCeti.HilbertModular.hasseDomain_zero [degenerate; OMITTED supplier example]: ε=0 means|Ĥa|=1 on the integral generic fibre.
Test TauCeti.HilbertModular.hasseDomain_dyadic [compatibility; OMITTED supplier example]: The same rational inequality and lift comparison works at p=2.
Test TauCeti.HilbertModular.hasseDomain_endpoint [non-example; OMITTED supplier example]: Atε=1 the lifts 0 andp of the zero special-fibre section give respectively empty and whole inequality domains.

## HilbertModularVarietiesAndShimuraCurves:H2/polarization-representatives-at-p
Polarization representatives at bad primes [comparison]
Contract: For any narrow ideal class and m=p N≠0, the pinned coprime-representative theorem supplies an integral representative c with gcd(Norm(c),p N)=1. Ordered isomorphisms and H1 pairing-choice laws identify the corresponding generic and DP moduli descriptions, and composition obeys the comparison cocycle. Choosing this representative simplifies the integral lattice; it does not remove ramification of F at p or identify different narrow classes.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: tauceti:NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm, HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws, HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model
Suggested declaration: TauCeti.HilbertModular.polarization_representatives_at_p [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H3/congruence-units
Tame congruence units [definition]
Contract: Let U=O× and U+=Number Field.totally Positive Integer Units F. For a nonzero integral ideal a, define U_a=ker(U→(O/a)×); for an integer M>0 write U_M=U_{MO}. Only the congruence subgroup is new; total positivity and subgroup kernels use the pinned carriers.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: tauceti:NumberField.totallyPositiveIntegerUnits, tauceti:NumberField.sq_mem_totallyPositiveIntegerUnits, mathlib:QuotientGroup.mk'
API TauCeti.HilbertModular.congruenceUnits [constructor; NATIVE core above]: The subgroup η≡1 moduloa.
API TauCeti.HilbertModular.mem_congruenceUnits [characterisation; NATIVE core above]: η∈U_a iff(η−1)∈a.
API TauCeti.HilbertModular.congruenceUnits_mono [functoriality; NATIVE core above]: Ifa⊂b then U_a⊂U_b.
Test TauCeti.HilbertModular.units_Q_tame [computation; NATIVE example above]: For O=ℤ,N≥3, U_N={1} and S_N={1}.
Test TauCeti.HilbertModular.units_sign [compatibility; OMITTED supplier example]: Both η and−η have totally positive square, but only those congruent 1 modulo N contribute to S_N.
Test TauCeti.HilbertModular.units_squareRoot [non-example; NATIVE example above]: Congruence of η² to 1 modulo N alone does not imply η∈U_N.

## HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image
Congruence square image [definition]
Contract: For M>0 let S_M be the image of U_M under η↦η² in the pinned subgroup U+ of totally positive units. The square-root congruence is part of this definition. The image is a normal subgroup since U+ is abelian.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H3/congruence-units, tauceti:NumberField.sq_mem_totallyPositiveIntegerUnits
API TauCeti.HilbertModular.congruenceUnitSquares [constructor; NATIVE core above]: The image S_M≤U+ of the square homomorphism on U_M.
API TauCeti.HilbertModular.mem_congruenceUnitSquares [characterisation; NATIVE core above]: u∈S_M iff u=η² for some η∈U_M.
API TauCeti.HilbertModular.congruenceUnitSquares_mono [functoriality; NATIVE core above]: If M divides M′, then S_{M′}≤S_M.
Test TauCeti.HilbertModular.squareImage_Q [computation; NATIVE example above]: For F=ℚ,M≥3 the image is the trivial subgroup.
Test TauCeti.HilbertModular.squareImage_positive [compatibility; NATIVE example above]: Every image element lies in Number Field.totally Positive Integer Units F by the pinned square-positivity theorem.
Test TauCeti.HilbertModular.squareImage_root [non-example; OMITTED supplier example]: For F=ℚ(√2), M=12, ε⁸ is not in S_12 although ε⁸≡1 modulo 12: its only roots ±ε⁴ both fail the congruence.

## HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action
Positive unit action on polarizations [construction]
Contract: For the fine DP μ_N object, η∈U+ sends(A,ι,λ,μ_N) to(A,ι,ηλ,μ_N). This gives an action compatible with base change and the H1 moduli comparisons. The O-linear automorphism[η] gives(A,ι,η²λ,η⁻¹μ_N,ηα)≅(A,ι,λ,μ_N,α), with the last marking on A∨. Its tame kernel is exactly S_N under this level convention.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/c-polarization, HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors, HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image, HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model
API TauCeti.HilbertModular.polarizationUnitAction [constructor; OMITTED supplier signature]: The U+ action on the c-polarized fine moduli functor.
API TauCeti.HilbertModular.polarizationUnitAction_one [simp; OMITTED supplier signature]: The unit 1 acts identically.
API TauCeti.HilbertModular.polarizationUnitAction_mul [relation; OMITTED supplier signature]: ηθ acts as η after θ.
API TauCeti.HilbertModular.polarizationUnitAction_square [compatibility; OMITTED supplier signature]: The displayed[η] isomorphism identifies square polarization changes with tame/dual-level scalar changes.
Test TauCeti.HilbertModular.unitAction_Q [degenerate; OMITTED supplier example]: For F=ℚ the positive unit group is trivial.
Test TauCeti.HilbertModular.unitAction_negative [non-example; OMITTED supplier example]: −1 is not an allowed polarization-scaling unit for the standard positive cone.
Test TauCeti.HilbertModular.unitAction_level [compatibility; OMITTED supplier example]: η² acts trivially at tame level precisely when a root η with η≡1 modulo N supplies the moduli isomorphism.

## HilbertModularVarietiesAndShimuraCurves:H3/tame-delta
Finite tame polarization group [definition]
Contract: For N≥4, define Δ(N)=U+/S_N with S_N=U_N² as in congruence Units. The quotient uses the normal subgroup inside U+, with its natural projection. It is not U+/((U+∩U_N)²), nor a quotient by units merely congruent 1 after squaring.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image, mathlib:QuotientGroup.mk'
API TauCeti.HilbertModular.TamePolarizationGroup [constructor; NATIVE core above]: The quotient U+/S_N.
API TauCeti.HilbertModular.tameDelta_mk [projection; NATIVE core above]: The projection U+→Δ(N).
API TauCeti.HilbertModular.tameDelta_eq [characterisation; NATIVE core above]: η and θ have the same class iff ηθ⁻¹=ν² for some ν∈U_N.
API TauCeti.HilbertModular.tameDelta_changeLevel [functoriality; NATIVE core above]: For N|M the inclusion S_M⊂S_N induces Δ(M)→Δ(N).
API TauCeti.HilbertModular.tameDelta_lift [universal-property; NATIVE core above]: For a group J, any homomorphism U+→J killing S_N factors uniquely through tameDelta_mk.
Test TauCeti.HilbertModular.delta_Q [computation; NATIVE example above]: For F=ℚ,N≥4, Δ(N) is trivial.
Test TauCeti.HilbertModular.delta_square [compatibility; NATIVE example above]: Every ν∈U_N maps ν² to 1 in Δ(N).
Test TauCeti.HilbertModular.delta_notPositiveRoot [non-example; OMITTED supplier example]: The denominator permits square roots that are not totally positive; replacing it by positive-root squares can change the quotient.

## HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness
Finiteness of the tame quotient [theorem]
Contract: For every M>0, Δ(M) is finite. More precisely, [U:U_M]<∞ because O/MO is finite, and finite generation of U plus the pinned square-class/unit theorem gives [U+:U_M²]<∞. For totally real F of degreeg, every subgroup of U has square-class size at most 2^g; this bound will also be used for the connected groups in H4.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H3/tame-delta, tauceti:NumberField.units_sq_index_eq, tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative
Suggested declaration: TauCeti.HilbertModular.delta_finiteness [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient
Arithmetic Hilbert quotient [theorem]
Contract: With the exact μ_N convention, X(c,μ_N)→X_G(c,μ_N) is a finite étale Δ(N)-torsor, and its quotient identifies with the G canonical Hilbert variety through V8. For the integral model the quotient exists in the stated category and has the characteristic-zero comparison. A universal HBAV on the fine source descends only when its descent datum is verified; no universal HBAV is asserted on an arbitrary coarse arithmetic quotient.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action, HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness, HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison, ShimuraVarieties:V8/finite-level-maps, AlgebraicModuliForArithmeticGeometry:R09.5
Suggested declaration: TauCeti.HilbertModular.arithmetic_quotient [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons
Polarization ideal representative comparisons [comparison]
Contract: The disjoint union of Hilbert moduli over a list of narrow ideal-class representatives has explicit comparison isomorphisms for a new list: choose ordered ideal isomorphisms and transport λ, lattices and β. Their composites obey H1’s cocycle; changing the comparison by a totally positive unit acts on the G* description and disappears after the G polarization-class quotient. Different ideal classes remain different labels.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws, HilbertModularVarietiesAndShimuraCurves:H2/polarization-representatives-at-p, HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient, tauceti:NumberField.NarrowClassGroup.instFinite
Suggested declaration: TauCeti.HilbertModular.ideal_class_comparisons [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies
Hecke isogenies between polarization components [theorem]
Contract: For an O-linear finite locally free subgroup D⊂A[a], witha prime to N and the required isotropy/polarization descent conditions, the quotientφ:A→B=A/D has the induced HBAV structure and tame marking. If D has O-module elementary divisors O/b_i, putb=∏b_i; the descended polarization module iscb and the dual-isogeny diagram of BHW(8.7) characterizes λ′. These correspondences act on the union ofc-components, not necessarily on onec-component, and have representative-independent arithmetic descent.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons, HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing, AbelianSchemesAndArithmeticModuli:A3
Suggested declaration: TauCeti.HilbertModular.hilbert_hecke_isogenies [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level
Hybrid full Hilbert level [definition]
Contract: Over characteristic-zero S with a fixed c-polarization and μ_N marking, a hybrid fullp^n level is an O/p^n O-linear isomorphism α_n:(O/p^n O)²≅A∨[p^n], n≥1. Denote its fine moduli by X_Γ(p^n). It retains λ and allows an arbitrary O-unit Weil multiplier. This is a generic-fibre basis; no such constant étale basis is imposed on characteristicp torsion.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/c-polarization, HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors, HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing, AbelianSchemesAndArithmeticModuli:A3, PELModuli:M1/moduli-problem
API TauCeti.HilbertModular.HilbertHybridLevel [constructor; OMITTED supplier signature]: A full O/p^n O basis of A∨[p^n] on the geometric c-polarized moduli.
API TauCeti.HilbertModular.hybridLevel_forget [projection; OMITTED supplier signature]: Forgetα_n to the fine tame c-polarized moduli.
API TauCeti.HilbertModular.hybridLevel_reduce [functoriality; OMITTED supplier signature]: Forr≤n use[p^{n−r}] on torsion and reduction of the basis to obtainα_r.
API TauCeti.HilbertModular.hybridLevel_dualConvention [compatibility; OMITTED supplier signature]: λ⁻¹∘(α_n⊗c⁻¹) identifies the corresponding basis of A[p^n] only after the c⁻¹ twist.
Test TauCeti.HilbertModular.hybrid_Q [compatibility; OMITTED supplier example]: For F=ℚ,c=ℤ obtain the usual full generic elliptic level on the dual curve.
Test TauCeti.HilbertModular.hybrid_twist [non-example; OMITTED supplier example]: For nonprincipal c a basis of A∨[p^n] does not canonically give an untwisted basis of A[p^n].
Test TauCeti.HilbertModular.hybrid_charp [non-example; OMITTED supplier example]: For an ordinary elliptic curve in characteristicp, E[p] includes μ_p and is not a constant étale rank p² group.

## HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier
Hilbert full-level pairing multiplier [construction]
Contract: For a compatible local generator β:c⁻¹O_p≅d⁻¹(1), pull backẽ_{p^n} using λ⁻¹(α_n⊗c⁻¹) andα_n. There is a unique b_n∈(O/p^n O)× such that this pairing is b_n times the β-determinant pairing. The construction is a mape_{n,β}:X_Γ(p^n)→(O/p^n O)×, compatible with torsion reduction. β is an auxiliary trivialization, with the exact change law of H1.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level, HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing, HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws
API TauCeti.HilbertModular.hilbertPairingMultiplier [constructor; OMITTED supplier signature]: The unique unit ratio of the pulled-back pairing to the β pairing.
API TauCeti.HilbertModular.hilbertPairingMultiplier_eq [characterisation; OMITTED supplier signature]: e_{n,β}(α)=b iff the two forms differ by multiplication byb.
API TauCeti.HilbertModular.hilbertPairingMultiplier_reduce [functoriality; OMITTED supplier signature]: The multiplier reduces compatibly fromp^n top^r.
API TauCeti.HilbertModular.hilbertPairingMultiplier_changeBeta [compatibility; OMITTED supplier signature]: Replacing β byu β replaces the multiplier byu⁻¹b.
Test TauCeti.HilbertModular.multiplier_identity [computation; OMITTED supplier example]: A basis carrying the β form to the actual pairing has multiplier 1.
Test TauCeti.HilbertModular.multiplier_change [compatibility; OMITTED supplier example]: β′=u β givesb′=u⁻¹b.
Test TauCeti.HilbertModular.multiplier_nonscalar [non-example; OMITTED supplier example]: For a nonscalar residue unitu the multiplieru is not a G* multiplier relative to the fixed β.

## HilbertModularVarietiesAndShimuraCurves:H4/geometric-full-level
Scalar-similitude geometric full level [definition]
Contract: Let S_n be the image of(ℤ/p^n ℤ)× in(O/p^n O)×. Define X_Γ*(p^n)=e_{n,β}^{−1}(S_n) inside the hybrid moduli. Its bases are the G* full-level structures of BHW Definition 5.7, and its acting level group is{γ∈GL₂(O/p^n O):det γ∈S_n}. A choice of one root/multiplier component is further data and is not folded into this definition.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier, HilbertModularVarietiesAndShimuraCurves:H0/type-witnesses
API TauCeti.HilbertModular.HilbertGeometricFullLevel [constructor; OMITTED supplier signature]: The scalar-multiplier subfunctor of hybrid full level.
API TauCeti.HilbertModular.geometricFullLevel_mem [characterisation; OMITTED supplier signature]: A basis is geometric full level iff its multiplier belongs to S_n.
API TauCeti.HilbertModular.geometricFullLevel_inclusion [projection; OMITTED supplier signature]: The natural inclusion β₁ into the hybrid space.
API TauCeti.HilbertModular.geometricFullLevel_betaTransport [equivalence; OMITTED supplier signature]: H1’s comparison identifies the subfunctors for two compatible β choices after the stated basis transport.
Test TauCeti.HilbertModular.starLevel_Q [compatibility; OMITTED supplier example]: For F=ℚ,S_n=(O/p^n O)×, so geometric and hybrid full levels coincide.
Test TauCeti.HilbertModular.starLevel_missing [non-example; OMITTED supplier example]: For g>1 with nonscalar residue units,β₁ misses their multiplier fibres and is not surjective.
Test TauCeti.HilbertModular.starLevel_root [non-example; OMITTED supplier example]: Fixing one primitive root picks one scalar multiplier component; the entire G* definition does not fix that root.

## HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action
Adjugate action on dual levels [theorem]
Contract: For γ∈GL₂(O/p^n O), let γ∨=adj(γ)=det γ·γ⁻¹. The rule γ·α=α∘γ∨ gives a left action on hybrid levels because adj(γδ)=adj δ·adj γ. It changes the pairing multiplier bydet γ, since det(adj γ)=det γ in rank-two. Scaling λ by η∈U+ changes that multiplier by η⁻¹. The actions commute; the G* action is obtained by the scalar determinant restriction.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level, HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier, HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action, mathlib:Matrix.adjugate_mul_distrib, mathlib:Matrix.det_adjugate
Suggested declaration: TauCeti.HilbertModular.adjugate_level_action [NATIVE core above]

## HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level
Unit squares versus scalar levels [lemma]
Contract: For η∈U_N, its polarization action by η² on the hybrid full-level space equals the level action of the scalar matrix η⁻¹I₂. Consequently the kernel at fullp^n level is S_{p^n N}=U_{p^n N}². This statement uses the dual-level action and the fixed tame μ_N convention; it is recalculated for another tame level.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action, HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action, HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image
Suggested declaration: TauCeti.HilbertModular.unit_square_level [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level
Arithmetic full Hilbert level [definition]
Contract: Define X_{G,Γ(p^n)} as the polarization-class quotient of the hybrid fine moduli by Δ(p^n N)=U+/U_{p^n N}². Its coarse moduli interpretation retains(A,ι,[λ],μ_N,α_n), with isomorphisms acting on the dual basis. Denote β₂ the quotient map. A local HBAV representative may be used for this interpretation; no universal HBAV on the whole arithmetic quotient is part of this definition.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level, HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level, HilbertModularVarietiesAndShimuraCurves:H3/tame-delta, HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness, AlgebraicModuliForArithmeticGeometry:R09.5
API TauCeti.HilbertModular.HilbertArithmeticFullLevel [constructor; OMITTED supplier signature]: The quotient X_Γ(p^n)/Δ(p^n N).
API TauCeti.HilbertModular.arithmeticFullLevel_quotient [universal-property; OMITTED supplier signature]: Invariant maps from the hybrid space factor uniquely through β₂.
API TauCeti.HilbertModular.arithmeticFullLevel_reduce [functoriality; OMITTED supplier signature]: The level reductions commute with the corresponding Δ quotient maps.
API TauCeti.HilbertModular.arithmeticFullLevel_coarse [compatibility; OMITTED supplier signature]: Geometric points have the stated polarization-class and dual-basis interpretation.
Test TauCeti.HilbertModular.arithmeticLevel_Q [compatibility; OMITTED supplier example]: For F=ℚ the positive-unit quotient is trivial and all three full levels agree.
Test TauCeti.HilbertModular.arithmeticLevel_beta1 [non-example; OMITTED supplier example]: The composite β₂β₁ need not be surjective and is not called a torsor merely because β₂ is one.
Test TauCeti.HilbertModular.arithmeticLevel_universal [non-example; OMITTED supplier example]: The coarse interpretation supplies no automatic descended universal abelian scheme.

## HilbertModularVarietiesAndShimuraCurves:H4/hybrid-comparison-map
Induction from scalar pairing components [comparison]
Contract: For fixed β, X_Γ(p^n)≅[(O/p^n O)××X_Γ*(p^n)]/S_n, where a residue unitu acts throughdiag(u,1) and S_n acts antidiagonally. Thus β₁ is the scalar-multiplier inclusion and β₂ is the unit polarization quotient; their distinct images and groups are visible. The assertion is on the generic fibre with compatible pairings.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/geometric-full-level, HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action, HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level
Suggested declaration: TauCeti.HilbertModular.hybrid_comparison_map [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0
Integral Iwahori and higher subgroup levels [definition]
Contract: An integral Γ₀(p^n) level is a finite locally free O-stable subgroup C⊂A[p^n] of rank p^{ng}, such that every c-indexed polarized Weil pairing vanishes on C×C. Require its generic fibre C[1/p] to be étale locally O/p^n O of rank one. The inclusion C⊂A[p^n] imposes p^n-annihilation; any stronger ideal-annihilator or flat-closure refinement is the recorded comparison gap. For a naive integral functor retain precisely these conditions; any flat closure or refined local-model variant is separately stated.Γ₁ is an integral generator condition only when its group-scheme formulation has been specified; a full constant basis is restricted to the generic fibre.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model, HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing, AbelianSchemesAndArithmeticModuli:A3, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1
API TauCeti.HilbertModular.HilbertIntegralGamma0 [constructor; OMITTED supplier signature]: The finite locally free O-stable isotropic subgroup-scheme level.
API TauCeti.HilbertModular.integralGamma0_baseChange [functoriality; OMITTED supplier signature]: Subgroup, rank and isotropy pull back to any base.
API TauCeti.HilbertModular.integralGamma0_generic [compatibility; OMITTED supplier signature]: On the generic fibre it is the stated O/p^n O rank-one subgroup level.
API TauCeti.HilbertModular.integralGamma0_forget [projection; OMITTED supplier signature]: The nested subgroup levels have forgetful maps, with their actual subgroup intersections.
Test TauCeti.HilbertModular.gamma0_ordinary [computation; OMITTED supplier example]: For an ordinary elliptic curve, the multiplicative μ_{p^n} subgroup is a valid rank p^n integral Γ₀ level.
Test TauCeti.HilbertModular.gamma0_zero [non-example; OMITTED supplier example]: The zero subgroup has the wrong rank for n≥1.
Test TauCeti.HilbertModular.gamma0_points [non-example; OMITTED supplier example]: Replacing μ_p by its geometric points loses its scheme rank and fails the test.

## HilbertModularVarietiesAndShimuraCurves:H4/gamma0-cartesian
Polarization quotient at subgroup level [comparison]
Contract: On the generic fibre, the Γ₀(p^n) subgroup-level squares over X→X_G are Cartesian: units preserve O-stable C, so the same Δ(N) torsor acts before and after adjoining C. Any invariant rational Hasse neighborhood restricts this finite-level Cartesian diagram. No perfectoid limit theorem is proved or imported here.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0, HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient, HilbertModularVarietiesAndShimuraCurves:H2/hasse-formal-domains
Suggested declaration: TauCeti.HilbertModular.gamma0_cartesian [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups
Connected polarization and residue component groups [definition]
Contract: For n≥1 put A_n=U_{p^n}∩U+, B_n=U_{p^n N}, and Δ_n(N)=A_n/B_n². For r≤n inclusion induces Δ_n→Δ_r; these maps need be neither injective nor surjective. This group preserves a selected paired component and differs from the whole-space quotient Δ(p^n N)=U+/B_n².
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image, HilbertModularVarietiesAndShimuraCurves:H3/tame-delta, mathlib:QuotientGroup.mk'
API TauCeti.HilbertModular.ConnectedPolarizationGroup [constructor; NATIVE core above]: A_n/B_n² with the indicated level transitions.
API TauCeti.HilbertModular.connectedDelta_eq [characterisation; NATIVE core above]: Classes of η,θ∈A_n agree iff ηθ⁻¹=ν² for ν∈B_n.
API TauCeti.HilbertModular.connectedDelta_transition [functoriality; NATIVE core above]: Reduction fromn tor is induced by inclusion and satisfies identity/composition laws.
Test TauCeti.HilbertModular.connectedDelta_Q [computation; NATIVE example above]: For F=ℚ all Δ_n(N) are trivial.
Test TauCeti.HilbertModular.connectedDelta_noninjective [non-example; OMITTED supplier example]: For F=ℚ(√2),p=3,N=4 the inclusion-induced Δ₁(4)→Δ(4) is not injective, as demonstrated in the counterexample node.
Test TauCeti.HilbertModular.connectedDelta_square [compatibility; OMITTED supplier example]: For η∈U_{p^n N}, the class of η² is trivial in Δ_n(N).

## HilbertModularVarietiesAndShimuraCurves:H4/residue-component-group
Residue polarization components [definition]
Contract: For n≥1 define 𝒰_n=(O/p^n O)×/image(U+), using reduction of the pinned totally positive units. This is the fixed-c arithmetic multiplier-component group; over all polarization classes it occurs as the kernel in the narrow ray-class extension.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H3/congruence-units, mathlib:QuotientGroup.mk'
API TauCeti.HilbertModular.ResiduePolarizationComponents [constructor; NATIVE core above]: The quotient of residue units by the positive-unit image.
API TauCeti.HilbertModular.residueComponents_mk [projection; NATIVE core above]: The residue-unit projection to 𝒰_n.
API TauCeti.HilbertModular.residueComponents_eq [characterisation; NATIVE core above]: Two units have equal classes iff their ratio is the reduction of a totally positive global unit.
API TauCeti.HilbertModular.residueComponents_reduce [functoriality; NATIVE core above]: Residue reduction induces compatible maps 𝒰_n→𝒰_r for r≤n.
Test TauCeti.HilbertModular.residueComponents_Q [computation; NATIVE example above]: For F=ℚ the image is {1}, so 𝒰_n=(ℤ/p^n ℤ)×.
Test TauCeti.HilbertModular.residueComponents_unit [compatibility; NATIVE example above]: Reduction of every positive global unit has trivial class.
Test TauCeti.HilbertModular.residueComponents_narrow [non-example; OMITTED supplier example]: The group for fixed c omits nontrivial narrow ideal classes and is not the whole arithmetic component set.

## HilbertModularVarietiesAndShimuraCurves:H4/component-and-torsor-comparison
Full and connected component comparisons [theorem]
Contract: With BHW’s fixedc and tame μ_N convention, after a splitting/cyclotomic base and the required component choice, π₀(X_Γ*(p^n))=(ℤ/p^n ℤ)×, π₀(X_Γ(p^n))=(O/p^n O)×, and π₀(X_{G,Γ(p^n)})=𝒰_n for thatc-fibre. Over allc classes the arithmetic labels form the narrow ray-class extension by Cl⁺(O).β₂ is a Δ(p^n N) torsor on the whole space and a Δ_n(N) torsor on paired chosen components. Base-field Galois actions on the labels are retained.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups, HilbertModularVarietiesAndShimuraCurves:H4/hybrid-comparison-map, HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons, HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level, ShimuraVarieties:V8/finite-level-maps, AdelicAlgebraicGroups:AA.4/strong-approximation-theorem, HilbertModularVarietiesAndShimuraCurves:H4/residue-component-group
Suggested declaration: TauCeti.HilbertModular.component_and_torsor_comparison [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups
Effective finite level groups [definition]
Contract: For 0≤m≤n, n≥1, define Γ₀(p^m,p^n)={γ∈GL₂(O/p^n O): γ₂₁∈p^m O/p^n O}. Its Γ₀* subgroup imposes determinant in the scalar image of (ℤ/p^n ℤ)×. These act on generic full-level frames and forget to the stipulated subgroup level.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action, HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level, HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image, mathlib:QuotientGroup.mk'
API TauCeti.HilbertModular.HilbertFiniteGamma0 [constructor; NATIVE core above]: The lower-left congruence subgroup of GL₂(O/p^n O).
API TauCeti.HilbertModular.finiteGamma0_mem [characterisation; NATIVE core above]: Membership is exactly the lower-left ideal condition.
API TauCeti.HilbertModular.finiteGamma0_star [constructor; NATIVE core above]: The scalar-determinant subgroup Γ₀*≤Γ₀.
Test TauCeti.HilbertModular.gamma0_m0 [degenerate; NATIVE example above]: For m=0 the lower-left condition is void and Γ₀=GL₂(O/p^n O).
Test TauCeti.HilbertModular.gamma0_mn [computation; NATIVE example above]: For m=n the lower-left entry is 0 in O/p^n O.
Test TauCeti.HilbertModular.effective_Q [compatibility; NATIVE example above]: For F=ℚ,N≥4, U_N={1}; hence Z_n is trivial and PΓ₀=Γ₀.

## HilbertModularVarietiesAndShimuraCurves:H4/diagonal-level-group
Diagonal level and polarization group [definition]
Contract: Define E(p^m,p^n)=(Γ₀(p^m,p^n)×U+)/image(η↦(ηI₂,η²), η∈U_N). The subgroup is central. For the left adjugate frame action and positive polarization action this is exactly the joint ineffective subgroup.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups, HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level, HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image, mathlib:QuotientGroup.mk'
API TauCeti.HilbertModular.HilbertDiagonalLevelGroup [constructor; NATIVE core above]: The central quotient E by the square relation.
API TauCeti.HilbertModular.diagonalLevel_mk [projection; NATIVE core above]: The product-group projection to E.
API TauCeti.HilbertModular.diagonalLevel_relation [characterisation; NATIVE core above]: (ηI₂,η²) maps to 1 for η∈U_N; these generate exactly the kernel.
API TauCeti.HilbertModular.diagonalLevel_action [compatibility; OMITTED supplier signature]: The joint level/polarization action factors through E using H4’s unit-square calculation.
Test TauCeti.HilbertModular.diagonal_Q [computation; NATIVE example above]: For F=ℚ,N≥4, E=Γ₀.
Test TauCeti.HilbertModular.diagonal_square [compatibility; NATIVE example above]: Its second coordinate is η², matching Rosati polarization scaling.
Test TauCeti.HilbertModular.diagonal_notLinear [non-example; OMITTED supplier example]: The relation (ηI₂,η) generally changes the paired moduli and is not substituted.

## HilbertModularVarietiesAndShimuraCurves:H4/projective-level-group
Effective projective level group [definition]
Contract: Define PΓ₀(p^m,p^n)=Γ₀(p^m,p^n)/Z_n using the actual ineffective scalar subgroup, not all residue scalar matrices. It acts effectively on the arithmetic full-level moduli over Γ₀ subgroup level.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups, HilbertModularVarietiesAndShimuraCurves:H4/level-scalar-kernel, mathlib:QuotientGroup.mk'
API TauCeti.HilbertModular.HilbertEffectiveGamma0 [constructor; NATIVE core above]: The quotient PΓ₀=Γ₀/Z_n.
API TauCeti.HilbertModular.effectiveLevel_mk [projection; NATIVE core above]: The normal-subgroup quotient projection.
API TauCeti.HilbertModular.effectiveLevel_quotient [universal-property; NATIVE core above]: An action trivial on Z_n factors uniquely through PΓ₀.
Test TauCeti.HilbertModular.effective_Q [compatibility; NATIVE example above]: For F=ℚ,N≥4, PΓ₀=Γ₀.
Test TauCeti.HilbertModular.effective_kernel [characterisation; NATIVE example above]: The projection kills exactly Z_n.
Test TauCeti.HilbertModular.effective_notPGL [non-example; OMITTED supplier example]: For F=ℚ and p odd the scalar −I₂ survives; this quotient is not PGL₂.

## HilbertModularVarietiesAndShimuraCurves:H4/level-scalar-kernel
Ineffective scalar level subgroup [definition]
Contract: Let Z_n be the image of U_N under scalar reduction η↦ηI₂ in Γ₀(p^m,p^n). It is central and its kernel is U_{p^n N}, because p and N are coprime. Thus Z_n≅U_N/U_{p^n N}; the tame congruence is not dropped.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups, HilbertModularVarietiesAndShimuraCurves:H3/congruence-units
API TauCeti.HilbertModular.hilbertLevelScalarKernel [constructor; NATIVE core above]: The central image Z_n of U_N in Γ₀.
API TauCeti.HilbertModular.levelScalarKernel_mem [characterisation; NATIVE core above]: γ∈Z_n iff γ=ηI₂ for η∈U_N.
API TauCeti.HilbertModular.levelScalarKernel_quotient [equivalence; NATIVE core above]: Z_n≅U_N/U_{p^n N}.
Test TauCeti.HilbertModular.scalarKernel_Q [computation; NATIVE example above]: For F=ℚ,N≥4, Z_n={I₂}.
Test TauCeti.HilbertModular.scalarKernel_central [compatibility; NATIVE example above]: Every scalar image commutes with Γ₀.
Test TauCeti.HilbertModular.scalarKernel_tame [non-example; OMITTED supplier example]: A scalar global unit failing the N-congruence is not inserted into this image.

## HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors
Finite-level torsors and diagonal exact sequences [theorem]
Contract: In characteristic-zero with the stated fine tame level, X_Γ*→X_Γ₀* is a Γ₀* torsor, X_Γ→X_Γ₀* a Γ₀ torsor, and X_{G,Γ}→X_{G,Γ₀} a PΓ₀ torsor. The diagonal hybrid-to-arithmetic-subgroup map is an E torsor with exact sequences 1→Γ₀→E→Δ(N)→1 and 1→Δ(p^n N)→E→PΓ₀→1. No universal nonsplitting assertion is imposed on these extensions.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups, HilbertModularVarietiesAndShimuraCurves:H4/component-and-torsor-comparison, HilbertModularVarietiesAndShimuraCurves:H4/gamma0-cartesian, HilbertModularVarietiesAndShimuraCurves:H4/projective-level-group, HilbertModularVarietiesAndShimuraCurves:H4/diagonal-level-group
Suggested declaration: TauCeti.HilbertModular.finite_level_torsors [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H4/connected-limit-finiteness
Finite connected unit limit and stable images [theorem]
Contract: For everyp including 2, the finite groups Δ_n(N) have the uniform bound|Δ_n(N)|≤[U:U_N]·2^g. Their inverse limit Δ_∞(N) is finite. Let I_n be the image of Δ_∞→Δ_n; the surjective transition maps I_{n+1}→I_n are isomorphisms for n≫0, so Δ_∞≅I_n eventually. The literal assertion Δ_∞≅Δ_n via projection for all large n is false at p=2. The whole-space inverse limit lim Δ(p^n N) is a separate profinite group and is not covered by this bound.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups, HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness, tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative
Suggested declaration: TauCeti.HilbertModular.connected_limit_finiteness [NATIVE core above]

## HilbertModularVarietiesAndShimuraCurves:H4/stabilization-counterexamples
Counterexamples to the printed unit stabilization proof [application]
Contract: For F=ℚ(√2),ε=1+√2: (i)p=3,N=4,η=ε⁴=17+12√2 lies in U_4 and η≡−1 modulo 3, so η² defines a nonzero class in Δ₁(4) which is zero in Δ(4); neither root±η lies in U_12. (ii)p=2,N=5 andn≥2, U_{2^n}=⟨ε^{2^n}⟩ and U_{2^n 5}=⟨ε^{3·2^n}⟩, hence Δ_n(5)≅ℤ/6 with transition multiplication by 2. Its inverse limit is ℤ/3; the original maps never stabilize to isomorphisms.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups, HilbertModularVarietiesAndShimuraCurves:H3/tame-delta
Suggested declaration: TauCeti.HilbertModular.stabilization_counterexamples [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H5/rational-modular-comparison
Rational modular-curve comparison [comparison]
Contract: For F=ℚ both imported Hilbert groups are GL₂, d=ℤ, and a c-polarization becomes the elliptic principal polarization after the positive generator ofc is fixed. Match μ_N⊂E[N] to the marked-point Y₁(N) convention by quotienting E by its μ_N image and using the Cartier-dual kernel of the dual isogeny; match full and Γ₀ levels through the explicit dual/polarization maps. Then all three full-level spaces and their quotients agree with V8/R12.2 modular curves, with compatible level and Hecke maps. A fixed-root full pairing component has its actual cyclotomic field.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison, HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors, HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level, HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0, ShimuraVarieties:V8/gl2-gamma1, ShimuraVarieties:V8/gl2-gamma0, ShimuraVarieties:V8/gl2-full-level, ShimuraVarieties:V8/gl2-tower-compatibility, ModularCurvesPartII:R12.2
Suggested declaration: TauCeti.HilbertModular.rational_modular_comparison [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H5/quadratic-domain-boundary
Real quadratic domains and minimal cusps [theorem]
Contract: For real quadratic F the Hilbert domains have complex dimension 2, with 4 independent-sign G components and 2 common-sign G* components. Under C6’s stated tame-ideal hypotheses, its rational minimal boundary consists of finite zero-dimensional cusps on a chosen finite-level quotient, of codimension 2. This is not the boundary of a product of two compactified modular curves, whose divisor components are one-dimensional. Toroidal boundary divisors are a separate compactification.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Additional hypotheses: For the C6 minimal-boundary comparison retain its tame-ideal range: n is coprime to the field discriminant and does not divide 2 or 3, and c is prime to n; use the supplier’s actual torsion-free moduli input. Other levels require a separate canonical finite-level comparison.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison, ShimuraCompactifications:C6/hilbert-minimal-cusps
Suggested declaration: TauCeti.HilbertModular.quadratic_domain_boundary [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H5/hodge-splitting-descent
Hilbert Hodge splitting and descent [comparison]
Contract: In characteristic-zero,ω_A is a rank-one O⊗𝒪 module. After extending coefficients to a field L containing all embeddings F→L, it decomposes canonically as⊕_τω_τ via the idempotents of F⊗L, with each ω_τ a line. The original unsplit O⊗𝒪 bundle and its descent datum recover ω_A; automorphic line construction and central descent agree with B4 and C6 on their stated loci. At a ramified integral prime there is no corresponding family of orthogonal embedding idempotents without extra structure.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H2/rapoport-locus, AutomorphicBundles:B4/unsplit-hilbert-descent, ShimuraCompactifications:C6/hilbert-conormal-comparison
Suggested declaration: TauCeti.HilbertModular.hodge_splitting_descent [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H5/algebraic-weights-units
Algebraic Hilbert weights and central units [theorem]
Contract: For a coefficient field splitting F, an algebraic weight is(k_τ,w) withk_τ≡w modulo 2; putm_τ=(w−k_τ)/2. The tensor product of embedding Hodge/determinant factors is the B4 Hilbert arithmetic weight bundle, descended through the actual central kernel. Its scalar coefficient character is Norm_{F/ℚ}(t)^w in B4’s convention; totally positive units have norm 1, and any remaining sign character must be checked on the finite residual stabilizer. Nonalgebraic p-adic weights and integral ramified splitting are outside this assertion.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H5/hodge-splitting-descent, HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient, AutomorphicBundles:B4/hilbert-arithmetic-weight, AutomorphicBundles:B4/hilbert-central-descent
Suggested declaration: TauCeti.HilbertModular.algebraic_weights_units [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H5/nonprincipal-ramified-test
Nonprincipal and ramified comparison example [application]
Contract: Take F=ℚ(√10),O=ℤ[√10],c=(2,√10),N=7,p=5. The idealc has norm 2 and is not principal: a generator would have norm±2, impossible modulo 5. The primep ramifies since disc(F)=40, whilec and N are prime to p. Construct L_c and its dualc L_c, the DP model and its Rapoport/ordinary locus with this label. Over a splitting field ω has two lines; over the ramified residue base this splitting is not imposed.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality, HilbertModularVarietiesAndShimuraCurves:H2/polarization-representatives-at-p, HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport, HilbertModularVarietiesAndShimuraCurves:H5/hodge-splitting-descent
Suggested declaration: TauCeti.HilbertModular.nonprincipal_ramified_test [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H6/torsion-isom-torsor
Simultaneous torsion Isom torsor [definition]
Contract: Let K be a characteristic-zero field and ℓ₁≠ℓ₂ distinct odd primes, with full paired torsion markings at these primes. A retained extra tame marking is prime to ℓ₁ℓ₂; in the elliptic specialization the two full odd torsion levels themselves supply a fine marking. Fori=1,2 let V_i be a finite étale G_K-module locally free of rank 2 over O/ℓ_i O, equipped with a perfect alternating pairing∧²V_i≅(c d⁻¹/ℓ_ic d⁻¹)⊗μ_{ℓ_i}. Define the symplectic O-linear Isom torsor from the standard torsion module with its matching pairing to V_i, and take their product. Its finite structural group is the product of the two symplectic automorphism groups; it need not be commutative.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing, HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier, AlgebraicModuliForArithmeticGeometry:R09.3
API TauCeti.HilbertModular.HilbertTorsionIsomTorsor [constructor; OMITTED supplier signature]: The product of the actual finite pairing-preserving Isom torsors.
API TauCeti.HilbertModular.torsionIsomTorsor_points [characterisation; OMITTED supplier signature]: Sections are precisely the two O-linear symplectic identifications.
API TauCeti.HilbertModular.torsionIsomTorsor_baseChange [functoriality; OMITTED supplier signature]: The torsor pulls back with V_i and their actual pairing targets.
API TauCeti.HilbertModular.torsionIsomTorsor_cocycle [compatibility; OMITTED supplier signature]: A splitting-field frame gives the cocycleσ↦frame⁻¹σ(frame), and changing the frame gives a cohomologous cocycle.
API TauCeti.HilbertModular.torsionIsomTorsor_ext [extensionality; OMITTED supplier signature]: Two sections of the simultaneous Isom torsor agree if both underlying O/ℓ_i O-linear maps agree; pairing-preservation proofs add no extra data.
Test TauCeti.HilbertModular.torsionTorsor_trivial [degenerate; OMITTED supplier example]: For the standard paired modules with fixed frames, the torsor has a rational section and the twist is untwisted.
Test TauCeti.HilbertModular.torsionTorsor_determinant [non-example; OMITTED supplier example]: A two-dimensional representation whose determinant is not the required cyclotomic pairing character has no equivariant paired Isom section.
Test TauCeti.HilbertModular.torsionTorsor_coboundary [compatibility; OMITTED supplier example]: Changing both splitting frames by group elements leaves the descended twist canonically isomorphic.

## HilbertModularVarietiesAndShimuraCurves:H6/simultaneous-torsion-twist
Twisted Hilbert torsion moduli [construction]
Contract: Twist the fine paired full ℓ₁/ℓ₂ Hilbert moduli and its universal HBAV by the inverse action of the actual Hilbert Torsion Isom Torsor. The descended K-space classifies (A,ι,λ,μ_N,α₁,α₂) when the Hilbert tame marking is retained, and (A,ι,λ,α₁,α₂) when full torsion level itself supplies the fine marking. In both cases α_i:V_i≅A∨[ℓ_i] preserves the c d⁻¹-valued pairing. Over a splitting field it is isomorphic to the untwisted paired full-level space. This construction uses effective finite noncommutative descent, not the commutative Γ-only torsor-twist node of R09.4.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H6/torsion-isom-torsor, HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level, HilbertModularVarietiesAndShimuraCurves:H4/geometric-full-level, AlgebraicModuliForArithmeticGeometry:R09.3, mathlib:AlgebraicGeometry.Scheme, PELModuli:M1/char-zero-adelic-moduli, PELModuli:M2/representability, PELModuli:M3/algebraization-of-components
API TauCeti.HilbertModular.TwistedHilbertTorsionModuli [constructor; OMITTED supplier signature]: The descended simultaneous paired torsion moduli space.
API TauCeti.HilbertModular.twistedHilbertModuli_points [universal-property; OMITTED supplier signature]: T-points correspond to the stipulated HBAV and pairedα_i data.
API TauCeti.HilbertModular.twistedHilbertModuli_split [equivalence; OMITTED supplier signature]: A splitting field and chosen paired frames identify the twist with the untwisted full-level moduli.
API TauCeti.HilbertModular.twistedHilbertModuli_universal [data; OMITTED supplier signature]: The fine universal HBAV descends through the verified cocycle and pulls back to the untwisted family.
Test TauCeti.HilbertModular.twist_trivial [compatibility; OMITTED supplier example]: The trivial framed torsor yields the original fine moduli and family.
Test TauCeti.HilbertModular.twist_pairing [non-example; OMITTED supplier example]: An unpaired abstract GL₂ torsor can mix Weil-pairing components and is not accepted as this twist.
Test TauCeti.HilbertModular.twist_frame_change [compatibility; OMITTED supplier example]: A cohomologous frame cocycle yields an isomorphism preserving the universal moduli interpretation.

## HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent
Selected component descent and irreducibility [theorem]
Contract: Choose a geometric paired-multiplier and narrow-class component of the twisted full-level space. It descends over its finite field of definition K_C, or over K if its component label is G_K-fixed. The descended component is smooth of dimension g and geometrically irreducible; it is quasi-projective after applying the characteristic-zero PEL ample/compactification supplier and the finite descent of an ample bundle. The fine universal HBAV restricts to it. No component is declared G_K-fixed solely from a chosen splitting-field point.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H6/simultaneous-torsion-twist, HilbertModularVarietiesAndShimuraCurves:H4/component-and-torsor-comparison, HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison, ShimuraCompactifications:C5/open-quasiprojectivity, AlgebraicModuliForArithmeticGeometry:R09.3
Suggested declaration: TauCeti.HilbertModular.twisted_component_descent [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H6/real-torsion-points
Real torsion points with polarization signature [theorem]
Contract: At a real place of K_C, require the prescribed V_i to have the polarization-compatible odd involution: in a real split O/ℓ_i frame, complex conjugation has one+ and one− eigendirection and reverses the cyclotomic pairing. If the chosen component’s real signature is compatible, the real HBAV obtained from the ordered trace-polarized real analytic lattice gives paired torsion identifications and a real point on that component. The real local locus is a nonempty open around it. Even residual modules or a mismatched component are not covered.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent, HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family, HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module, AbelianSchemesAndArithmeticModuli:A5
Suggested declaration: TauCeti.HilbertModular.real_torsion_points [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H6/hilbert-finite-local-points
Finite local Hilbert torsion points [theorem]
Contract: For a finite placev of K_C, local nonemptiness is asserted only for explicitly constructed paired HBAVs in the selected component. Under Taylor§1’s ordinary-extension/CM-character hypotheses, construct them by the trace-polarized Tate lattice in the multiplicative case, or by the ordinary Honda–Tate HBAV followed by O-linear Serre–Tate lifting in the finite H_f extension class. At the second auxiliary characteristic use the separately specified ordinary construction. Matching both auxiliary torsion modules, pairing multipliers and component labels is part of the conclusion; arbitrary local Galois modules are not claimed realizable.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent, HilbertModularVarietiesAndShimuraCurves:H6/torsion-isom-torsor, AbelianSchemesAndArithmeticModuli:A4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6, AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate, AbelianSchemesAndArithmeticModuliPartII:F3
Suggested declaration: TauCeti.HilbertModular.hilbert_finite_local_points [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H6/allen-elliptic-twists
Allen elliptic twists and Weil restriction [construction]
Contract: Under Allen Assumption 7.2.6 (ℓ₂ splitting in the coefficient fields; the two residual images containing SL₂; ℓ₁,ℓ₂ unramified in F, outside each S_i, of good reduction for E, and >2m_i+3), put K=FF₁⁺ and fix r_i′ with determinant ε_{ℓ₂}^{−1}. Define Y_i/K to classify elliptic D with symplectic α₁:E[ℓ₁]≅D[ℓ₁] and α₂:V_{r_i′}∨≅D[ℓ₂]. This is the paired elliptic specialization of the simultaneous Isom-torsor twist; its selected geometric component is a smooth geometrically irreducible curve. The second residual module is dualized so its pairing has cyclotomic multiplier.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H6/simultaneous-torsion-twist, HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent, HilbertModularVarietiesAndShimuraCurves:H5/rational-modular-comparison, mathlib:AlgebraicGeometry.Scheme
API TauCeti.HilbertModular.AllenEllipticTwist [constructor; OMITTED supplier signature]: The symplectic elliptic moduli Y_i.
API TauCeti.HilbertModular.allenElliptic_points [universal-property; OMITTED supplier signature]: Points are D with the two stipulated paired torsion isomorphisms.
API TauCeti.HilbertModular.allenElliptic_split [equivalence; OMITTED supplier signature]: Over a splitting field it is the compatible Weil-multiplier component of the full elliptic level moduli.
Test TauCeti.HilbertModular.allen_dual [non-example; OMITTED supplier example]: The undualized second module has inverse cyclotomic determinant and generally fails the pairing condition.
Test TauCeti.HilbertModular.allenElliptic_dimension [computation; OMITTED supplier example]: Y_i has dimension 1.
Test TauCeti.HilbertModular.allenElliptic_trivial [compatibility; OMITTED supplier example]: When both paired modules are torsion of one elliptic curve, that curve with identity maps gives a point.

## HilbertModularVarietiesAndShimuraCurves:H6/allen-restriction-moduli
Allen restriction of torsion moduli [construction]
Contract: For K=FF₁⁺, k=F⁺F₁⁺ in Allen §7.2.5, define X_i=Res_{K/k}Y_i using A6’s quasi-projective finite-separable restriction of scalars. It is smooth and geometrically irreducible of dimension [K:k]=2. The universal family on Y_i gives an abelian-family restriction comparison over X_i. At a real place, X_i(ℝ)=Y_i(ℂ), so this CM case requires no real odd involution.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H6/allen-elliptic-twists, AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes, AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits, AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes, mathlib:AlgebraicGeometry.Scheme
API TauCeti.HilbertModular.AllenRestrictionModuli [constructor; OMITTED supplier signature]: X_i=Res_{K/k}Y_i.
API TauCeti.HilbertModular.allenTwist_points [characterisation; OMITTED supplier signature]: X_i(L)=Y_i(K⊗_k L).
API TauCeti.HilbertModular.allenTwist_split [compatibility; OMITTED supplier signature]: Its geometric base change is the product of the conjugate Y_i.
API TauCeti.HilbertModular.allenRestriction_family [data; OMITTED supplier signature]: The finite-étale A6 restriction of the pulled-back elliptic family has relative dimension [K:k].
Test TauCeti.HilbertModular.allen_dimension [computation; OMITTED supplier example]: For the quadratic CM extension, X_i has dimension 2.
Test TauCeti.HilbertModular.allen_real [compatibility; OMITTED supplier example]: For a real place of k, K⊗_k ℝ≅ℂ and X_i(ℝ)=Y_i(ℂ).
Test TauCeti.HilbertModular.allen_restriction_split [compatibility; OMITTED supplier example]: For K=k the restriction is Y_i itself.

## HilbertModularVarietiesAndShimuraCurves:H6/allen-finite-local-points
Allen finite local elliptic points [theorem]
Contract: Retain Allen’s auxiliary-prime and local finite-flat hypotheses. Above L₀∪{ℓ₁}, use E after a finite unramified extension whose Frobenius powers match the two paired residual modules. Above ℓ₂, when the residual dual is the prescribed supersingular finite-flat type or a peu-ramifié ordinary extension, construct a good-reduction D after a finite unramified extension and pair both torsion identifications. In the ordinary case lift the negative residual extension class using Lemma 7.2.2 and Serre–Tate. For supersingular D descended from𝔽_{ℓ₂}, Frobenius overk(w) uses its residue degree: its squared scalar is(−ℓ₂)^{[k(w):𝔽_{ℓ₂}]}, not universally−ℓ₂.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H6/allen-elliptic-twists, AbelianSchemesAndArithmeticModuli:A4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6, HilbertModularVarietiesAndShimuraCurves:H6/allen-restriction-moduli
Suggested declaration: TauCeti.HilbertModular.allen_finite_local_points [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:H6/moret-bailly-input-export
Geometric and local input export [application]
Contract: Export to R23.1–R23.2 the selected smooth geometrically irreducible quasi-projective K_C-scheme, its dimension, field of definition, fine universal family and all constructed nonempty real/finite local opens with their exact local extension and reduction conditions. In the Allen case export X_i overk and the corresponding Weil-restriction family, with dimension[K:k]. Moret–Bailly is a downstream theorem consuming these witnesses; it is not a prerequisite proving their existence.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:H6/real-torsion-points, HilbertModularVarietiesAndShimuraCurves:H6/hilbert-finite-local-points, HilbertModularVarietiesAndShimuraCurves:H6/allen-finite-local-points, HilbertModularVarietiesAndShimuraCurves:H6/allen-restriction-moduli
Suggested declaration: TauCeti.HilbertModular.moret_bailly_input_export [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum
One-real-split quaternionic datum [construction]
Contract: Given a quaternion F-algebra B split at the specified real embedding τ and ramified at all other real embeddings, form G_B=Res_{F/ℚ}B× on the existing quaternion and restriction-of-scalars carriers. Set h_B(z)=([[x,y],[−y,x]]⁻¹,1,…,1) forz=x+iy under B_τ≅M₂(ℝ). Its full conjugacy class is H^±. Verify D4’s SV1–SV3; its real central weight need not be ℚ-rational when[F:ℚ]>1, which D4 treats as a separate predicate. A totally definite B yields a finite class set in R18.3 instead.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: ShimuraData:D4/shimura-datum, ShimuraData:D2/cartan-adjoint-criterion, ReductiveGroupsPartII:RG2.0a, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion, mathlib:AlgebraicGeometry.Scheme
API TauCeti.HilbertModular.QuaternionicShimuraDatum [constructor; OMITTED supplier signature]: The D4 datum with one specified real split factor and the displayedh.
API TauCeti.HilbertModular.quaternionicDatum_domain [data; OMITTED supplier signature]: Its conjugacy domain is H^± and its connected domain is H.
API TauCeti.HilbertModular.quaternionicDatum_splittingChange [equivalence; OMITTED supplier signature]: Changing the real matrix splitting conjugatesh and yields the same datum class.
API TauCeti.HilbertModular.quaternionicDatum_adjoint [compatibility; OMITTED supplier signature]: The adjoint real group is PGL₂(ℝ) times compact quaternionic projective groups.
Test TauCeti.HilbertModular.quaternion_Q_split [compatibility; OMITTED supplier example]: For B=M₂(ℚ), the complex domain is the modular H^± domain.
Test TauCeti.HilbertModular.quaternion_definite [non-example; OMITTED supplier example]: A totally definite algebra with no chosen split real place does not produce this curve datum.
Test TauCeti.HilbertModular.quaternion_dimension [computation; OMITTED supplier example]: For degreeg>1 with exactly one real split factor the domain is still one-dimensional.

## HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension
Quaternionic reflex field and dimension [theorem]
Contract: For the one-real-split quaternionic datum, the reflex field is τ(F)⊂ℂ and the Shimura variety has complex dimension 1. The cocharacter type is nontrivial only at τ, so its Galois stabilizer fixes that embedding. This differs from the Hilbert datum’s reflex field ℚ and from the auxiliary PEL bridge field F′, which generally only contains τ(F).
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum, ShimuraData:D3/cocharacter-class, ShimuraData:D3/reflex-field
Suggested declaration: TauCeti.HilbertModular.quaternionic_reflex_dimension [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve
Canonical quaternionic curve and uniformization [construction]
Contract: For compact open U⊂G_B(A_f), apply the general canonical-model theory at the datum’s reflex field τ(F), obtaining Sh_U(G_B,X_B). Its complex points are G_B(ℚ)\(H^±×G_B(A_f)/U). Level and datum maps are the V8 maps with their effective-kernel hypotheses. The curve is proper when B is division; the split rational case is the nonproper modular curve and obtains cusps from R12.2. No general abelian moduli interpretation of this exact G_B is asserted.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum, HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension, ShimuraVarieties:V8/datum-functoriality, ShimuraVarieties:V8/finite-level-maps, ShimuraVarieties:V8, ModularCurvesPartII:R12.2, AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact, mathlib:AlgebraicGeometry.Scheme
API TauCeti.HilbertModular.QuaternionicShimuraCurve [constructor; OMITTED supplier signature]: The canonical finite-level curve over τ(F).
API TauCeti.HilbertModular.quaternionicCurve_complex [compatibility; OMITTED supplier signature]: Its complex analytic space is the displayed double-coset quotient.
API TauCeti.HilbertModular.quaternionicCurve_changeLevel [functoriality; OMITTED supplier signature]: For U′⊂U the canonical level map commutes with Hecke maps and complex uniformization.
API TauCeti.HilbertModular.quaternionicCurve_splitQ [equivalence; OMITTED supplier signature]: For F=ℚ,B=M₂(ℚ), matching levels identify it with R12.2’s modular curve.
Test TauCeti.HilbertModular.curve_Q_split [compatibility; OMITTED supplier example]: The split rational curve is noncompact before modular compactification.
Test TauCeti.HilbertModular.curve_Q_division [computation; OMITTED supplier example]: An indefinite quaternion algebra over ℚ ramified at two finite primes yields a compact curve.
Test TauCeti.HilbertModular.curve_definite [non-example; OMITTED supplier example]: The totally definite datum is not passed to this one-dimensional constructor.

## HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers
Quaternionic central kernel and small levels [theorem]
Contract: At finite complex level, quotient Γ_g=B_+×∩g Ug⁻¹ by its rational scalar subgroup before measuring freeness on H. On the adelic inverse tower the ineffective central subgroup is the closure of F× in B_f×; it is not in general the discrete subgroup F×. For the compact division case and U⊂(1+NÔ_B)× with N≥3, the effective Γ_g acts freely and each compact connected component has genus≥2. No genus≥2 conclusion is applied to the noncompact split rational curve.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve, ReductiveGroupsPartII:RG2.0, ReductiveGroupsPartII:RG2.3, ShimuraVarieties:V8/finite-level-maps
Suggested declaration: TauCeti.HilbertModular.quaternionic_effective_stabilizers [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups
Yuan–Zhang PEL bridge groups [definition]
Contract: Choose a quadratic CM extension E/F and nearby CM types Φ₁,Φ₂ differing at τ. Define G″=Res_{F/ℚ}(B××_{F×}E×), quotienting by(a⁻¹,a). Its derived group is Res B¹;ν(b,e)=(Nrd(b)eē,e/ē) identifies its derived quotient with Res F××Res E¹. Define G′ by ν₁ lying in diagonal G_m. Lift the datum withh_E(z)=(1,z⁻¹,…,z⁻¹). The bridge is auxiliary; it does not redefine the quaternionic datum.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum, ShimuraData:D4/datum-morphism, ReductiveGroupsPartII:RG2.0a
API TauCeti.HilbertModular.YuanZhangBridgeGroups [constructor; OMITTED supplier signature]: The central quotient G″ and scalar ν₁ subgroup G′ on imported group carriers.
API TauCeti.HilbertModular.yzBridge_norm [data; OMITTED supplier signature]: ν₁=Nrd(b)eē and ν₂=e/ē.
API TauCeti.HilbertModular.yzBridge_derived [compatibility; OMITTED supplier signature]: Both bridge groups have derived group Res B¹.
API TauCeti.HilbertModular.yzBridge_datum [constructor; OMITTED supplier signature]: The liftedh′ is induced by(h_B,h_E) with the displayed CM-type convention.
Test TauCeti.HilbertModular.bridge_kernel [computation; OMITTED supplier example]: The pair(a⁻¹,a) has ν₁=1 and ν₂=1 for everya∈F×.
Test TauCeti.HilbertModular.bridge_scalar [non-example; OMITTED supplier example]: An arbitrary ν₁∈F× is allowed in G″ but not in G′ unless it is rational scalar.
Test TauCeti.HilbertModular.bridge_active [compatibility; OMITTED supplier example]: At τ theh_E factor is 1; at all other CM factors it isz⁻¹.

## HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-reflex
Weighted CM reflex field of the bridge [theorem]
Contract: The reflex field F′ of(G′,h′), and likewise(G″,h″), is the field fixing the weighted CM type Φ₁+Φ₂=2(Φ₁∩Φ₂)+τ₁+τ₂. It contains τ(F), because a stabilizer fixes the unique weight-one pair and hence its restriction to F. Equality F′=F is not asserted. In Carayol’s special E=F(√λ), λ∈ℚ<0, with the displayed nearby types,F′=E in the chosen embedding.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups, ShimuraData:D3/reflex-field, HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension
Suggested declaration: TauCeti.HilbertModular.yz_bridge_reflex [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:R18.1/yz-pel-instance
Quaternionic PEL bridge instance [construction]
Contract: Let B′=B⊗_FE, V′=B′ with its left B′ module structure. Choose invertible γ′ with γ̄′=−γ′ and with the required archimedean positivity. Set ψ′(v,w)=Tr_{E/ℚ}Trd_{B′/E}(γ′v w̄), and*=γ′⁻¹ℓ̄γ′. Specialize M0/M1 to obtain the G′ PEL moduli over F′: abelian schemes up to isogeny, B′ action with the full determinant condition determined by Φ₁+Φ₂, polarization with this Rosati involution, and U′-orbit of rational adelic similitude frames. An arbitrary anti-fixed γ′ need not be polarizing.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups, HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-reflex, PELModuli:M0/integral-pel-datum, PELModuli:M0/determinant-condition, PELModuli:M1/char-zero-adelic-moduli, PELModuli:M3/complex-points, mathlib:AlgebraicGeometry.Scheme
API TauCeti.HilbertModular.quaternionicPELInstance [constructor; OMITTED supplier signature]: The M0/M1 specialization with B′,ψ′,* andh′.
API TauCeti.HilbertModular.quaternionicPEL_form [data; OMITTED supplier signature]: The exact reduced-trace formula for ψ′.
API TauCeti.HilbertModular.quaternionicPEL_adjoint [compatibility; OMITTED supplier signature]: ψ′(ℓv,w)=ψ′(v,ℓ*w) with*=γ′⁻¹ℓ̄γ′.
API TauCeti.HilbertModular.quaternionicPEL_moduli [equivalence; OMITTED supplier signature]: The four data of YZ p.552 are the corresponding rational PEL moduli objects at sufficiently small U′.
Test TauCeti.HilbertModular.qpel_nonzero [non-example; OMITTED supplier example]: γ′=0 is excluded: it would make ψ′ degenerate.
Test TauCeti.HilbertModular.qpel_positive [non-example; OMITTED supplier example]: Replacing a polarizing γ′ by−γ′ reverses the archimedean sign and cannot pass the same positivity test.
Test TauCeti.HilbertModular.qpel_adjoint [compatibility; OMITTED supplier example]: The left B′ action has exactly the stated Rosati involution, including the γ′ conjugation.

## HilbertModularVarietiesAndShimuraCurves:R18.1/yz-component-comparison
Quaternionic and PEL connected comparisons [comparison]
Contract: After base change to an algebraic closure containing F′ and choosing compatible identity components, the quaternionic tower component X⁰ and the PEL component X′⁰ have the YZ Proposition 4.2 isomorphism, intertwining the identified effective positive-norm stabilizers through G_B→G″. For idealsn supported at p and prime tod_B, and sufficiently small U^p depending onn, there is a matching U′^p and a finite-level connected comparison X_{n,U^p}⁰≅X′_{n,U′^p}⁰. Its field and descent maps must be specified: the printed Proposition 4.4 says “over K” without defining K in this passage; restoration from Carayol is a recorded gap.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve, HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers, HilbertModularVarietiesAndShimuraCurves:R18.1/yz-pel-instance, ShimuraVarieties:V8/finite-level-maps
Suggested declaration: TauCeti.HilbertModular.yz_component_comparison [OMITTED geometric/supplier signature]

## HilbertModularVarietiesAndShimuraCurves:R18.1/yz-torus-bridge
Torus bridge for quaternionic towers [comparison]
Contract: Let Ψ=Φ₁∩Φ₂ and Y/F′ be the zero-dimensional CM torus Shimura tower for Res_{E/ℚ}G_m withh_Ψ(z)=(1,z⁻¹,…,z⁻¹). The product datum map induces X×_FY→X″ over F′, and the tower comparison(X×_FY)/Δ(A_{F,f}×)≅X″ uses the twisted diagonalz↦(z,z⁻¹). At finite levels use the image U″ of U×J and the induced surjective map; an identical finite quotient description at all levels is not automatic. The Tate-module tensor and integral extensions belong to R18.2.
Hypotheses: F is a totally real number field; g=[F:ℚ]; O=𝒪_F; d is the absolute different. Additional hypotheses are stated in the assertion.
Suppliers: HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups, HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-reflex, HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve, ShimuraData:D4/product-datum, ShimuraVarieties:V8/datum-functoriality
Suggested declaration: TauCeti.HilbertModular.yz_torus_bridge [OMITTED geometric/supplier signature]

## Exact outstanding gaps
- Arbitrary-prime DP scheme refinement: DP2.1 constructs an algebraic space at full level; BHW§5.1.2 uses a μ_N scheme. The passage to μ_N fine moduli and a schematic arbitrary-prime model needs a precise representability/ample argument over ℤ_(p), with p=2 and ramified p retained. Good-prime M2 or C5 open-quasiprojectivity does not prove it at bad primes. Until this is supplied H2’s global object is an algebraic space, and scheme-only formal/adic consumers use étale scheme charts with explicit descent.
- Integral Γ₀ annihilator and closure comparison: The finite-flat O-stable isotropic rank condition defines the naive integral level functor. Transcribe the precise ideal-annihilator/local-model condition for the chosen ramified polarization class and prove which flat closure, if any, agrees on the ordinary locus used downstream. A generic free O/p^n basis and the rank count alone do not identify this integral model. The source’s Definition5.4 is generic and does not close this integral refinement.
- Hecke polarization descent proof interior: BHW Lemma8.22 invokes Kisin–Lai§1.9. The cb polarization module and dual-isogeny diagram have been transcribed, but the integral isotropy/elementary-divisor argument and its exact finite-flat hypotheses still need that proof. Supply it before using a general O-stable subgroup in the Hecke construction.
- Taylor local input and structured Honda–Tate realization: Taylor Lemmas1.2–1.3 are read, but their previously chosen CM characters, auxiliary-prime data and precise ordinary/multiplicative local hypotheses are not yet a closed typed input list. The ordinary construction also uses Honda–Tate with O-action and an ordered polarization. The reviewed AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate node supplies the underlying simple isogeny class, with its own Honda existence proof gap. Request its structured ordinary realization with O-action and ordered polarization from F3 and the A2/A3 interfaces; H6 only specializes that output. No unconditional realization of arbitrary residual modules is claimed.
- Allen supersingular and ordinary local pairing checks: Published pp.1104–1105 reduce the second residual representation to the two finite-flat types. Close the use of Lemma7.1.8 and its connected–étale orientation, choose a compatible good supersingular D and track its actual Frobenius polynomial over k(w), and verify that unramified extensions preserve the selected paired component. The printed supersingular scalar is insufficient for an arbitrary D and residue degree; the ordinary residual extension uses 𝔽_ℓ₂. The negative extension-class lift must be the exact Lemma7.2.2/A4 lift, not a generic torsion realization hypothesis.
- Carayol descent field in the finite-level bridge: YZ Proposition4.4 states a connected comparison “over K”; K is not identified in the immediately preceding passage. Restore its precise definition and finite/unramified field, descent cocycle and U^p dependence from Carayol before exporting an integral comparison to R18.2. The present R18.1 geometric connected comparison is over a common algebraic closure, with n supported at p and prime to d_B.
- Consumers of the corrected connected unit limit: BHW Lemma8.20 has a false injection step and false projection stabilization at p=2, exhibited here. The finite inverse limit and eventual stable IMAGE groups are proved by the corrected uniform-bound argument. S5/O4 must use those images or prove a separate geometric replacement before treating Δ_∞ as the full finite group Δ_n. This packet does not edit their nodes or infer a full-tower finite quotient.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
-/

/-! # Quaternionic continuation: R18.2–R18.5 -/

noncomputable section
namespace TauCeti.Blueprint.Quaternionic

section ClassSet
variable {G : Type*} [Group G]

/-- The existing double-coset carrier with supplied rational and central-level subgroups.
The arithmetic specialization Γ=D× and R=UZ is a supplier obligation, not a new quotient. -/
def DefiniteClassSet (Γ R : Subgroup G) : Type _ := by
  exact DoubleCoset.Quotient (Γ : Set G) (R : Set G)

lemma DefiniteClassSet.quotient (Γ R : Subgroup G) :
    DefiniteClassSet Γ R = DoubleCoset.Quotient (Γ : Set G) (R : Set G) := by
  sorry

-- DefiniteClassSet.doubleCosetEquality: the arithmetic centre is supplied as Z.
-- The factorisation hypothesis specifies R=UZ without confusing product with a union.
example (Γ U Z R : Subgroup G)
    (hR : ∀ r : G, r ∈ R ↔ ∃ u ∈ U, ∃ z ∈ Z, r = u * z) (t t' : G) :
    DoubleCoset.mk Γ R t = DoubleCoset.mk Γ R t' ↔
      ∃ d ∈ Γ, ∃ u ∈ U, ∃ z ∈ Z, t' = d * t * (u * z) := by
  sorry
end ClassSet

namespace QuaternionTWLevel
/-- Only the diamond factor is typed here. Δ' must already be the maximal residue
p-quotient; existence of residue fields, adelic U and its ratio map is not restated. -/
def torsionSubgroup (Δ' : Type*) [CommGroup Δ'] (N : ℕ) : Subgroup Δ' := by
  refine { carrier := {g | g ^ N = 1}, one_mem' := ?_, mul_mem' := ?_, inv_mem' := ?_ }
  all_goals sorry

lemma mem_torsionSubgroup (Δ' : Type*) [CommGroup Δ'] (N : ℕ) (g : Δ') :
    g ∈ torsionSubgroup Δ' N ↔ g ^ N = 1 := by
  sorry

/-- QuaternionTWLevel.diamondGroup: factor of the full product Δ_Q, rather than
claiming that a bare quotient group defines the complete quaternionic level. -/
def diamondFactor (Δ' : Type*) [CommGroup Δ'] (N : ℕ) : Type _ := by
  exact Δ' ⧸ torsionSubgroup Δ' N

def diamondGroup {Q : Type*} (Δ' : Q → Type*) [∀ v, CommGroup (Δ' v)]
    (N : ℕ) : Type _ := by
  exact ∀ v, diamondFactor (Δ' v) N

-- QuaternionTWLevel.empty: the group factor is trivial at the empty index;
-- equality U_Q=U requires the omitted adelic level carrier.
example : Subsingleton (diamondGroup (Q := Empty) (fun _ => ℤˣ) 2) := by
  sorry
end QuaternionTWLevel

section NormTwist
variable {G A O W : Type*} [Group G] [CommGroup A] [CommRing O]
  [AddCommGroup W] [Module O W]

/-- The actual O-linear norm multiplier on coefficient functions. Its restriction to
AF.5 forms is omitted until the central-character function carrier is supplied. -/
def DyadicNormTwist (nr : G →* A) (χ : A →* Oˣ) : (G → W) ≃ₗ[O] (G → W) := by
  refine
    { toFun := fun f g => (χ (nr g) : O) • f g
      invFun := fun f g => (((χ (nr g))⁻¹ : Oˣ) : O) • f g
      left_inv := ?_
      right_inv := ?_
      map_add' := ?_
      map_smul' := ?_ }
  all_goals sorry

lemma DyadicNormTwist.apply (nr : G →* A) (χ : A →* Oˣ) (f : G → W) (g : G) :
    DyadicNormTwist nr χ f g = (χ (nr g) : O) • f g := by
  sorry

lemma DyadicNormTwist.involutive (nr : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) : Function.Involutive (DyadicNormTwist (W := W) nr χ) := by
  sorry

-- The centre part of DyadicNormTwist.centralCharacter. Actual central embeddings and
-- the AF.5 equation f(gz)=ψ(z)f(g) are omitted supplier inputs.
lemma DyadicNormTwist.centralCharacter (nr : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) (g z : G) (a : A) (hz : nr z = a ^ 2)
    (f : G → W) (ψ : O) (hf : f (g * z) = ψ • f g) :
    DyadicNormTwist nr χ f (g * z) = ψ • DyadicNormTwist nr χ f g := by
  sorry

lemma DyadicNormTwist.reduction {k : Type*} [Field k] [CharP k 2]
    (red : O →+* k) (nr : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) (f : G → O) (g : G) :
    red (DyadicNormTwist nr χ f g) = red (f g) := by
  sorry

-- DyadicNormTwist.trivial
example (nr : G →* A) (f : G → W) : DyadicNormTwist (O := O) nr 1 f = f := by
  sorry
-- DyadicNormTwist.scalar
example (χ : A →* Oˣ) (hχ : ∀ a, χ a * χ a = 1) (z : A) :
    (χ (z ^ 2) : O) = 1 := by
  sorry
-- DyadicNormTwist.nonquadratic: the scalar square of the order-four value i.
example : Complex.I ^ 2 = (-1 : ℂ) ∧ Complex.I ^ 2 ≠ 1 := by
  sorry
end NormTwist

section ResidualKernel
variable {V O k : Type*} [CommRing O] [Field k]

/-- Arithmetic trace/determinant values are given as data. The inverse norm is a unit.
This does not assert existence of a Galois eigensystem in the acting Hecke algebra. -/
def residualEvaluation (red : O →+* k) (q : V → kˣ)
    (tr det : V → k) : MvPolynomial (V × Fin 2) O →+* k := by
  exact MvPolynomial.eval₂Hom red (fun i => if i.2 = 0 then tr i.1 else
    ((q i.1)⁻¹ : kˣ) * det i.1)

def ResidualHeckeIdeal (red : O →+* k) (q : V → kˣ)
    (tr det : V → k) : Ideal (MvPolynomial (V × Fin 2) O) := by
  exact RingHom.ker (residualEvaluation red q tr det)

lemma ResidualHeckeIdeal.evalT (red : O →+* k) (q : V → kˣ)
    (tr det : V → k) (v : V) :
    residualEvaluation red q tr det (MvPolynomial.X (v, 0)) = tr v := by
  sorry
lemma ResidualHeckeIdeal.evalS (red : O →+* k) (q : V → kˣ)
    (tr det : V → k) (v : V) :
    residualEvaluation red q tr det (MvPolynomial.X (v, 1)) =
      ((q v)⁻¹ : kˣ) * det v := by
  sorry
lemma ResidualHeckeIdeal.maximal (red : O →+* k) (hred : Function.Surjective red)
    (q : V → kˣ) (tr det : V → k) : (ResidualHeckeIdeal red q tr det).IsMaximal := by
  sorry
-- ResidualHeckeIdeal.actingFactor: genuine algebraic quotient factor once the acting
-- relations are known to be killed. R19 must supply this inclusion for its eigensystem.
lemma ResidualHeckeIdeal.actingFactor (red : O →+* k) (q : V → kˣ) (tr det : V → k)
    (I : Ideal (MvPolynomial (V × Fin 2) O))
    (hI : I ≤ ResidualHeckeIdeal red q tr det) :
    ∃ f : (MvPolynomial (V × Fin 2) O ⧸ I) →+* k,
      f.comp (Ideal.Quotient.mk I) = residualEvaluation red q tr det := by
  sorry

-- ResidualHeckeIdeal.normThree
example : (3 : ZMod 7)⁻¹ * 6 = 2 := by
  sorry
-- ResidualHeckeIdeal.scalarDeterminant
example (q : kˣ) (d : k) : (q : k) * ((q⁻¹ : kˣ) * d) = d := by
  sorry
-- ResidualHeckeIdeal.nonsurjective
example : ¬ (RingHom.ker (Int.castRingHom ℚ)).IsMaximal := by
  sorry
end ResidualKernel

section CoefficientsAndCounts
/-! Prototypes added by the independent review: the parts of the packet's weight,
point-set and counting statements that the pinned Mathlib can already express. The
group actions, analytic structure and moduli interpretations stay in the ledger. -/

open scoped TensorProduct LinearAlgebra.Projectivization

/-- Sym^{k−2}(O²) as the homogeneous polynomials of degree k−2 in two variables, the model
of the coefficient factor in QuaternionWeight. The U_p-action through the chosen
splittings is the AF.4 coefficient-lattice input and is not restated here. -/
abbrev SymWeight (O : Type*) [CommRing O] (k : ℕ) : Submodule O (MvPolynomial (Fin 2) O) :=
  MvPolynomial.homogeneousSubmodule (Fin 2) O (k - 2)

/-- QuaternionWeight, underlying module only: parallel weight k over d embeddings,
⊗_{σ} Sym^{k−2}(O²). -/
abbrev QuaternionWeight (O : Type*) [CommRing O] (d k : ℕ) : Type _ :=
  ⨂[O] (_ : Fin d), SymWeight O k

lemma QuaternionWeight.rank (O : Type*) [CommRing O] [Nontrivial O] (d k : ℕ) (hk : 2 ≤ k) :
    Module.finrank O (QuaternionWeight O d k) = (k - 1) ^ d := by
  sorry

-- QuaternionWeight.weightTwoRank
example (O : Type*) [CommRing O] [Nontrivial O] (d : ℕ) :
    Module.finrank O (QuaternionWeight O d 2) = 1 := by
  sorry
-- QuaternionWeight.quadraticWeightFour
example (O : Type*) [CommRing O] [Nontrivial O] :
    Module.finrank O (QuaternionWeight O 2 4) = 9 := by
  sorry

/-- DrinfeldHalfPlane.points: the C-points P¹(C) ∖ P¹(K) of Ω_K. Only the point set is
typed; the rigid-analytic open and its affinoid exhaustion need an analytic carrier that
the pinned libraries lack. -/
def DrinfeldHalfPlane.points (K C : Type*) [Field K] [Field C] [Algebra K C] :
    Set (ℙ C (Fin 2 → C)) :=
  {x | ∀ (v : Fin 2 → K) (hv : (fun i => algebraMap K C (v i)) ≠ 0),
    x ≠ Projectivization.mk C (fun i => algebraMap K C (v i)) hv}

lemma DrinfeldHalfPlane.affineChart (K C : Type*) [Field K] [Field C] [Algebra K C] (z : C)
    (h : (![z, 1] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![z, 1] h ∈ DrinfeldHalfPlane.points K C ↔
      z ∉ Set.range (algebraMap K C) := by
  sorry

-- DrinfeldHalfPlane.infinity
example (K C : Type*) [Field K] [Field C] [Algebra K C] (h : (![1, 0] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![1, 0] h ∉ DrinfeldHalfPlane.points K C := by
  sorry
-- DrinfeldHalfPlane.quadraticPoint: a point of a quadratic extension outside K.
example (K C : Type*) [Field K] [Field C] [Algebra K C] (z : C)
    (hz : z ∉ Set.range (algebraMap K C)) (h : (![z, 1] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![z, 1] h ∈ DrinfeldHalfPlane.points K C := by
  sorry

-- DrinfeldExhaustion.residueTwo, DrinfeldFormalModel.qTwo and QuaternionDegeneracy.qTwo:
-- the edges at a vertex, the branches through a component and the index
-- [GL₂(O_w) : U₀(w)] are all counted by P¹(k); for k = F₂ there are three.
example (k : Type*) [Field k] [Fintype k] (hk : Fintype.card k = 2) :
    Nat.card (ℙ k (Fin 2 → k)) = 3 := by
  sorry
-- DrinfeldExhaustion.firstSphere: the central vertex and its q+1 neighbours.
example (k : Type*) [Field k] [Fintype k] :
    Nat.card (ℙ k (Fin 2 → k)) + 1 = Fintype.card k + 2 := by
  sorry

-- QuaternionTWLevel.cyclicOrder: C₈ modulo its 2-torsion is C₄.
example : Nat.card (QuaternionTWLevel.diamondFactor (Multiplicative (ZMod 8)) 2) = 4 := by
  sorry
-- QuaternionTWLevel.torsionNotPowers: C₈ modulo its squares has order 2.
example : Nat.card (Multiplicative (ZMod 8) ⧸
    (powMonoidHom 2 : Multiplicative (ZMod 8) →* Multiplicative (ZMod 8)).range) = 2 := by
  sorry

-- QuaternionPDiv.splitRank: for B_v = M₂(Q_p), H_v[p] ≅ M₂(F_p) and e₁₁H_v[p] ≅ F_p².
example (p : ℕ) [Fact p.Prime] :
    Fintype.card (Fin 2 → Fin 2 → ZMod p) = p ^ 4 ∧ Fintype.card (Fin 2 → ZMod p) = p ^ 2 := by
  sorry

-- QuaternionPELInstance.regularDimension: for F = Q, dim_Q (B ⊗ E) = 8, so the abelian
-- variety with H₁ ≅ B′ has dimension 4, not 2.
open Quaternion in
example (E : Type*) [Field E] [Algebra ℚ E] (hE : Module.finrank ℚ E = 2) (a b : ℚ) :
    Module.finrank ℚ (ℍ[ℚ,a,b] ⊗[ℚ] E) / 2 = 4 := by
  sorry

/-- QuaternionHodgeLine.metric: the archimedean norm of dz at z in the upper half-plane,
‖dz‖ = 2 Im z (YZ Theorem 4.7(3)). -/
def QuaternionHodgeLine.metric (z : ℂ) : ℝ := 2 * z.im

-- QuaternionHodgeLine.imaginaryUnit
example : QuaternionHodgeLine.metric Complex.I = 2 := by
  sorry
end CoefficientsAndCounts

end TauCeti.Blueprint.Quaternionic

/-!
# Declaration ledger: full targets and omitted signatures

Only the elementary prototypes above are typed declarations. The section
`CoefficientsAndCounts` types the underlying weight module, the point set of Ω_K and the
counting tests; the full entries below remain the definitive statements. Each entry below gives
the exact packet target, hypotheses, API and tests; none is a hidden Lean declaration.
The geometry requires supplied formal objects; the adelic specializations require
AF.5 and AA carriers. Replace the corresponding entries with actual signatures when
those carriers exist, without changing their hypotheses.

HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance
QuaternionPELInstance [construction]: For E=F(√λ), λ<0 rational with p split in Q(√λ), specialize the shared PEL datum to B′=B⊗F E, V′=B′, ψ′(x,y)=Tr_E/Q Trd_B′/E(γ′xȳ), and involution b*=γ′⁻¹ b̄γ′. At p use O_B′,p=O_B,p*⊕O_B,p and the self-dual lattice O_B,p^∨⊕O_B,p. Verify the special O_B,v Lie condition and zero Lie component away from v. This full regular representation has abelian dimension 4[F:Q]; the Morita-reduced E-representation has dimension 2[F:Q]. Generic PEL moduli and representability are imports.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. γ′ chosen with the required positivity; sufficiently small tame level; integral trace/different factors retained.
QuaternionPELInstance.tracePairing [data]: The specialized pairing is Tr_E/Q Trd(γ′xȳ), with its induced involution.
QuaternionPELInstance.selfDual [characterisation]: The chosen p-lattice equals its pairing dual.
QuaternionPELInstance.lieCondition [characterisation]: The active v-part is special of rank one over the unramified quadratic order, and the complementary Lie part is zero.
QuaternionPELInstance.genericComparison [compatibility]: The represented generic curve is the auxiliary canonical X′ at the specified level.
QuaternionPELInstance.regularDimension [example, computation]: For F=Q the full B′ regular representation yields abelian dimension 4, not 2.
QuaternionPELInstance.moritaDimension [example, compatibility]: For F=Q the Morita-reduced E-instance yields abelian dimension 2.
QuaternionPELInstance.dualLattice [example, non-example]: If the trace lattice is not self-dual, O_B,p⊕O_B,p fails the perfect-pairing test; replacing the first factor by its dual passes.

HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level
EffectiveSmallLevel [theorem]: If U⊂(1+N O_B)^× with integer N≥3, each geometric connected component of X_U has genus at least 2 and its arithmetic group acts freely on the upper half-plane after quotienting by F×. The effective tower action divides out the closure of F× in B_f×; for F≠Q the closure must not be replaced by the discrete rational centre.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Compact curve hypothesis; principal level N≥3.

HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower
QuaternionPDiv [definition]: On the pro-level canonical curve define H_n=(B_p/O_B,p×X)/U_p(n), with U_p(n)=(1+n O_B,p)^× acting on the fibre by right multiplication and n supported above p. For each fixed torsion level m, shrink tame level until U_p(1)/U_p(m) acts freely; H_n[m] then descends as a finite étale O_B,p-module on that finite generic level. Do not assert a common finite tame level for the entire p-divisible group without proof.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. The effective free pro-level action and all fibre actions are specified; n may be 1.
QuaternionPDiv.torsion [projection]: H_n[m] has fibre m⁻¹O_B,p/O_B,p.
QuaternionPDiv.changeLevel [functoriality]: Pullback along n′-level to n-level identifies H_n with H_n′.
QuaternionPDiv.splitMorita [compatibility]: At split v, e11H_v identifies with Carayol E∞.
QuaternionPDiv.finiteDescent [structure]: For each m a sufficiently small tame level supports its descended finite étale sheaf.
QuaternionPDiv.unitTorsion [example, degenerate]: H_n[O_F]=0.
QuaternionPDiv.splitRank [example, computation]: For F_v=Q_p and B_v=M₂(Q_p), H_v[p] has geometric cardinality p^4; e11H_v[p] has cardinality p^2.
QuaternionPDiv.rightAction [example, characterisation]: A local unit u sends a fibre element x to xu; replacing it by ux generally gives a different action.

HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison
ConnectedPelComparison [comparison]: Over F̄ identify the identity pro-components X⁰ and X′⁰ equivariantly for the norm-positive effective groups Δ̄≅Δ̄′. After quotient by O_B,p^1, whose identity components X₁⁰ and X′₁⁰ are defined over K, identify H|X₁⁰ with H′|X′₁⁰ with the transported effective group action. The comparison is of connected components with specified descent, not an isomorphism of the full unrelated global towers.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. The auxiliary split CM choice and effective central kernels are fixed.

HilbertModularVarietiesAndShimuraCurves:R18.2/finite-pel-comparison
FinitePelComparison [comparison]: For n supported above p and coprime to d_B, and tame U^p sufficiently small depending on n, choose U′^p so that the connected n-level quaternionic and auxiliary PEL curves are isomorphic over K; the maps and coefficient sheaves agree under this isomorphism.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. n prime to the quaternion discriminant; smallness depends on n.

HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model
CarayolSplitModel [theorem]: If B_v is split, U_v=GL₂(O_v) and tame level is sufficiently small, X_U has a proper smooth model over O_v with canonical generic fibre; at principal v^n level the normalised cover is the regular model representing the Drinfeld-basis level problem on the special one-dimensional height-two O_v-divisible group. Transition and tame Hecke maps extend over O_v. Higher v-level models are not asserted smooth or semistable.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Carayol assumes [F:Q]>1; for Q use the modular or fake-elliptic supplier separately. The p-components away from v meet the source’s fixed-level hypotheses.

HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower
RegularModelTower [theorem]: Let n be coprime to d_B and U^p⊂U^p(N) for an integer N≥3 prime to p. The minimal regular models X_{n,U^p}/O_v form a projective system extending canonical level maps. At v∤n the model is smooth if B_v splits and a semistable relative Mumford curve if B_v is division. The division case has maximal local level.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Fine principal tame level as stated; no assertion for arbitrary level at d_B.

HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model
CoarseModel [theorem]: For any decomposed compact open U maximal at each prime dividing d_B, construct X_U as the effective finite quotient of a sufficiently small normal fine model. It is normal, projective and flat over O_F, independent of the auxiliary prime used to rigidify level, and has canonical generic fibre. The quotient map is finite of degree the effective group order; it need not be flat everywhere or have regular target.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Fine normal cover U′⊂U and effective group Ū/Ū′; maximality at d_B.

HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension
HeckeIntegralExtension [theorem]: For admissible levels maximal at d_B, a finite generic level map extends to the model tower. Tame Hecke correspondences whose local v-component preserves the specified model problem extend via the two finite maps from the common intersection level, with composition and generic-fibre agreement. Finite étaleness over O_v is asserted only when local p-level/lattice data are unchanged and the relevant PEL deformation criterion applies.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Both source, target and intersection levels satisfy the model hypotheses. No unqualified extension of every p-isogeny as an étale map.

HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model
QfactorialModel [theorem]: If L/F is finite and unramified at all finite places where B ramifies or U is not maximal, X_U⊗O_L is Q-factorial: every Weil divisor has a positive multiple Cartier. This does not assert regularity of the coarse model.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. U maximal at d_B; unramified base change at the bad set.

HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line
QuaternionHodgeLine [construction]: Specialize the imported rational line-bundle and metric theory to the unique hermitian Q-line L_U on X_U: compatible under level pullback, equal locally to the relative dualizing line at fine level and maximal U_v, with archimedean norm |dz|=2 Im z. On the coarse generic fibre L_U=ω_{X_U/F}+Σ_Q(1−1/e_Q)[Q]. Extend by norms from fine models and glue away from two auxiliary primes.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. U maximal at d_B; fine models and rational line bundles supplied; e_Q is the effective ramification index.
QuaternionHodgeLine.pullback [functoriality]: Every admissible level map pulls L_target back to L_source.
QuaternionHodgeLine.fineDualizing [compatibility]: At fine maximal local level L_U|O_v is the relative dualizing line.
QuaternionHodgeLine.coarseCorrection [characterisation]: At branch point Q the correction coefficient is 1−1/e_Q.
QuaternionHodgeLine.metric [data]: Under uniformisation the differential dz has norm 2 Im z.
QuaternionHodgeLine.unique [characterisation]: Any system of hermitian Q-line bundles on the models X_U (U maximal at d_B) that is compatible with level pullback, equals the relative dualizing line at fine level and maximal U_v, and has archimedean metric |dz|=2 Im z, is canonically isomorphic to L_U (YZ Theorem 4.7, uniqueness).
QuaternionHodgeLine.unramified [example, degenerate]: When every e_Q=1, the generic L_U equals ω.
QuaternionHodgeLine.indexTwo [example, computation]: At an effective ramification point of index 2, the correction is [Q]/2.
QuaternionHodgeLine.imaginaryUnit [example, computation]: At z=i, |dz|=2.

HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv
IntegralPdiv [theorem]: For n prime to d_B the generic H_n extends over the pro-limit of fine models over O_K. Its v-factor is a strict special formal O_B,v-module and the factors away from v are étale. The completed maximal-local-level model is the deformation space with the prescribed O_B-action; n=v^a n′ level classifies a Drinfeld v^a-basis and a full étale n′-level structure. At division v the allowed n has a=0.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Strict O_v-module convention; active relative Lie rank 2 and O_v-height 4; absolute p-height 4[F_v:Q_p].

HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer
IntegralKodairaSpencer [theorem]: Using the strict O_v-relative crystal with rank-2 Hodge pieces W,W^t, set N=det W⊗det W^t. The determinant of the Kodaira–Spencer map identifies N with ω^{⊗2}(−d_B,v), where d_B,v=0 at split v and the reduced special fibre at division v. At ramified F_v/Q_p this target requires the relative/saturated filtration, not the raw τ-quotient of the absolute crystal.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Fine regular finite-level models; maximal v-level; relative Dieudonné filtration and Cartier dual convention explicitly supplied.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison
BridgeTateComparison [comparison]: Import the canonical torus Y and datum morphism (X×Y)/Δ(A_F,f×)≅X″ from R18.1, with Δ(z)=(z,z⁻¹) and effective rational-central closures. On X₁×Y₁, identify f₁*T(H″) with π₁*T(H)⊗O_E,p π₂*T(I), where I=(E_p/O_E,p×Y)/O_E,p×. The two centre actions cancel and H″|X′=H′.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. E embeds in B; the maximal order contains O_E,p, not merely its units; prescribed nearby CM types.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-integral-model
BridgeIntegralModel [theorem]: Over K′, the completed maximal unramified reflex extension at v′, the bridge identifies X″₁ with the quotient of X₁×Y₁. Extending Y₁ by copies of Spec O_K′ transports the model of X₁ to a flat model of X″₁ and its open-and-closed X′₁ components. It is smooth if B_v splits and has stable Mumford fibres if B_v is division; ramified K′/K base change need not preserve regularity.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. The bridge’s effective quotient and descent data are supplied.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension
BridgePointExtension [theorem]: For a finite L/K′ and points y∈Y₁(L), x′∈X′₁(L), x″∈X″₁(L), the corresponding I_y,H′_x′,H″_x″ extend uniquely over O_L. For H″ use the Tate tensor, checking that at each embedding only one factor contributes weight −1 so that no weight −2 occurs. The p=2 case requires the integral Barsotti–Tate classification including the dyadic theorem. This is pointwise and does not by itself construct a global universal abelian scheme.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Integral crystalline lattice functor and full faithfulness over O_L; a finite extension may be used to lift the bridge point.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal
BridgeFilteredCrystal [comparison]: The covariant filtered integral crystal of H″_x″ is the coefficient tensor of those of H_x and I_y over O_E,p, with base change to O_L. This is a structured crystalline tensor comparison supplied by the integral p-adic Hodge owner. On the τ-part the resulting Hodge-piece tensor formulas hold as direct-summand formulas when F_v/Q_p is unramified; at ramified v raw τ-quotients are not exact.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. Chosen integral crystalline functor, compatible tensor and Hodge filtration; local p=2 coverage supplied.

HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-determinant
BridgeDeterminant [theorem]: At unramified F_v/Q_p, the rank-one torus Hodge factor twists W(H″) by its dual and W(H″^t) by itself. Thus det W(H″)⊗det W(H″^t)≅(det W(H)⊗det W(H^t))⊗O_L, as lattices in the generic square-canonical line. The same intended ramified-prime export must use a proved saturated determinant comparison; it is an explicit source-repair gap. No equality Hom_OE=Hom_OB or unrestricted OE-linear universal deformation is claimed.
Hypotheses: F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1. A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur. For the established direct-summand proof F_v/Q_p is unramified; retain the ramified target as a gap.

HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set
DefiniteClassSet [definition]: Specialize the existing double-coset quotient to C_U=D×\D_f×/(U A_F,f×). Its effective stabiliser at t is Γ_t=(U A_F,f×∩t⁻¹D×t)/F×. Use the quotient by the rational centre before asserting finiteness. Changing t by dtu z transports the stabiliser and its coefficient action by conjugation.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
DefiniteClassSet.quotient [compatibility]: The carrier is DoubleCoset.Quotient D× (U A_F,f×).
DefiniteClassSet.finite [instance]: For definite D and admissible U the class set is finite.
DefiniteClassSet.stabiliser [data]: At t the acting finite group is (UZ∩t⁻¹D×t)/F×.
DefiniteClassSet.changeRepresentative [equivalence]: Equivalent representatives give conjugate stabilisers and canonically transported invariant modules.
DefiniteClassSet.centralUnits [example, non-example]: For a real quadratic F, quotienting by F× removes its infinite central units; the unquotiented arithmetic group is not finite.
DefiniteClassSet.trivialOrbit [example, degenerate]: A class with Γ_t=1 contributes exactly W, with no averaging denominator.
DefiniteClassSet.doubleCosetEquality [example, compatibility]: Two representatives agree exactly when t′=dtu z for d∈D×, u∈U and z∈A_F,f×.

HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight
QuaternionWeight [construction]: Specialize AF.4 coefficient lattices to parallel weight k≥2: W_k=⊗_{σ:F→E} Sym^{k−2} O², using chosen splittings at v|p and the restricted U_p action. The centre acts by N_{F/Q}(z)^{k−2}; hence ψ near p must have inverse this action. For p=2 KW uses k=2. At a dyadic ramified division place use its discrete order-two quotient and one of the two sign characters, rather than a nonexistent GL₂ splitting.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. p unramified in F for the KW weight construction; D split at each active p-adic weight place.
QuaternionWeight.rank [structure]: Parallel weight k over a degree-d field has rank (k−1)^d.
QuaternionWeight.centralAction [characterisation]: A scalar z acts by N(z)^{k−2}.
QuaternionWeight.baseChange [functoriality]: Scalar extension commutes with the tensor of symmetric-power lattices.
QuaternionWeight.weightTwo [compatibility]: At k=2 the lattice is the trivial rank-one O-representation.
QuaternionWeight.weightTwoRank [example, degenerate]: For any d, weight 2 has rank 1.
QuaternionWeight.quadraticWeightFour [example, computation]: For d=2 and k=4 the rank is 9.
QuaternionWeight.factorialObstruction [example, non-example]: At p=2 and k=4 the natural pairing on Sym²(Z₂²) pairs X² with Y² to ±2 and XY with itself to ±1, so its Gram matrix has determinant ±4 and it is not perfect over Z₂.

HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation
DefiniteSpecialisation [comparison]: Use the extended AF.5 carrier, not a new generic definition, for functions f:D_f×→W_A satisfying f(dgu)=τ(u)⁻¹f(g), f(gz)=ψ(z)f(g). Evaluation at class representatives identifies S_{τ,ψ}(U,A) with ⊕_{t∈C_U} W_A^{Γ_t}. This requires AF.5 to admit the adelic central quotient: its current discrete-centre hypothesis does not cover O_F× of positive rank.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. A is an O-algebra; τ and ψ extend by scalars.

HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change
NeatnessBaseChange [theorem]: If every effective Γ_t has order invertible in O, S_{τ,ψ}(U,O) is finite free and base change to every O-algebra A identifies S(U,O)⊗A with S(U,A). Thus reduction modulo the uniformizer is surjective. Taylor Lemma 1.1 ensures this when p>3 is unramified in F in its stated compact definite setup. For p=2 or 3 use a specified auxiliary torsion-free level, not the automatic p>3 argument.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. All stabiliser orders prime to p, or an explicitly constructed auxiliary effective torsion-free level.

HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing
IntegralPairing [theorem]: For a perfect τ-pairing satisfying the determinant/central-character similitude law and prime-to-p effective stabilisers, the sum over class representatives, weighted by |Γ_t|⁻¹ and ψ(Nrd t)⁻¹, is a perfect O-pairing on S(U,O). For the standard differential pairing on Sym^{k−2}, require its factorial entries to be units (Taylor uses 2≤k≤p+1). The adjoint of [UgU] is ψ(Nrd g)[Ug⁻¹U] with the matching coefficient action.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. A perfect integral coefficient pairing and unit isotropy denominators; Taylor weight range only where invoked.

HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation
SplitHeckeNormalisation [comparison]: At v∉S with D_v=M₂(F_v), U_v=GL₂(O_v) and unramified coefficients, specialize AF.5 double-coset Hecke action: T_v=[U diag(π_v,1)U], S_v=[U diag(π_v,π_v)U]=ψ(π_v). The arithmetic Satake polynomial is X²−T_vX+q_vS_v. All change-of-level and commuting away-place actions are imported and checked with these local and coefficient conventions.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.

HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch
NormBranch [theorem]: For parallel weight 2 and compatible finite character, the forms factoring through Nrd are exactly the SL₂-invariant local branch under the strong-approximation hypotheses of KW §7.1. Their good-place Hecke eigenvalues give sums of characters, so their localization at a non-Eisenstein maximal ideal vanishes. Following KW §7, a maximal ideal m of T_ψ(U) is Eisenstein if T_v−2 and S_v−1 lie in m for all but finitely many places v split in a fixed finite abelian extension of F; non-Eisenstein means not Eisenstein. No Galois representation is constructed here.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. Weight 2; strong approximation for D¹ at a chosen split finite place.

HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy
DefiniteDegeneracy [theorem]: At a finite place w∉Σ (so D is split at w), with w added to S for the Hecke algebra, compact U with hyperspecial U_w and trivial local coefficient action, the degeneracy map S(U,A)²→S(U₀(w),A), (f₁,f₂)↦f₁+diag(1,π_w)f₂, has kernel supported on the norm-factor Eisenstein branch. Hence it is injective after non-Eisenstein localization, for the coefficient rings and coefficient extensions in KW Lemma 7.1. This is the definite version; an integral indefinite Ihara theorem is a separate supplier request.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. D split at w, U_w=GL₂(O_w); the action by diag(1,π_w) is defined on coefficients.

HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl
DefiniteJl [comparison]: Apply R17.3 global Jacquet–Langlands to the characteristic-zero cuspidal definite module after removing χ∘Nrd. At split finite places the Hecke eigensystems agree; at ramified places the GL₂ component is discrete series. Parallel Sym^{k−2} corresponds to holomorphic discrete series of weight k at every real place. Rational realization requires actual compatible coefficient-field models, not merely equality of rationality fields.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. Characteristic zero; exclude one-dimensional norm characters and fix embeddings/splittings.

HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent
IsotropyExponent [theorem]: For an auxiliary split place w∤p with hyperspecial local control, write N_w=|GL₂(k_w)|. The Sylow-p subgroups of all Γ_t have exponent dividing 2N_w in the compact-level case and 4N_w in KW’s allowed noncompact dyadic division-factor case. The norm maps to ((A_F,f×)²V∩F×)/(F×)²; this final map need not be surjective. Its target has exact sequence 0→O_F×/(O_F×)²→target→Cl(O_F)[2]→0.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. U,V and the distinguished w satisfy KW §7.2; in the noncompact case U⁰ is used for local compactness.

HilbertModularVarietiesAndShimuraCurves:R18.3/base-change-annihilator
BaseChangeAnnihilator [theorem]: Let F′/F be totally real with w split and impose KW Lemma 7.3 residue-field divisibility at the chosen Iwahori places. Choose χ₀ of p-power order equal to the p-part of 2p(4N_w), and χ=χ₀^{4N_w}. Then χ kills every effective stabiliser; it is nontrivial, and when p=2 has order 4. Its local action is through the ratio a/d of the triangular reduction. This statement concerns a given F′ and local characters; choosing global auxiliary fields is R23 work.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. The prescribed residue fields admit χ₀, and all isotropy exponents divide 4N_w.

HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level
QuaternionTWLevel [construction]: For any finite Q away S with D split, q_v≡1 mod p^n, and fixed p-power N divisible by all Sylow-p isotropy exponents, let Δ′_v be the maximal p-quotient of k_v× and Δ_v=Δ′_v/Δ′_v[N]. Put U′_v=Iwahori and U_v=ker(a/d:U′_v→Δ_v), with unchanged factors away Q. Then U′_Q/U_Q=Δ_Q=∏_vΔ_v. The quotient kills N-torsion; it is not the quotient by Nth powers.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. N and Q are inputs; no existence or selection of Taylor–Wiles primes is claimed.
QuaternionTWLevel.diamondGroup [data]: Δ_Q is the product of the maximal residue p-quotients modulo their N-torsion.
QuaternionTWLevel.levelQuotient [equivalence]: U′_Q/U_Q≅Δ_Q via the product diagonal ratios.
QuaternionTWLevel.normal [structure]: U_Q is open normal in U′_Q.
QuaternionTWLevel.changeQ [functoriality]: For Q′⊂Q the level and diamond quotient forget the factors Q\Q′.
QuaternionTWLevel.empty [example, degenerate]: At Q=∅, Δ_Q=1 and U_Q=U.
QuaternionTWLevel.cyclicOrder [example, computation]: For Δ′=C₈ and N=2, Δ=C₄.
QuaternionTWLevel.torsionNotPowers [example, non-example]: For Δ′=C₈ and N=2 the quotient by Nth powers has order 2, and is the wrong quotient.

HilbertModularVarietiesAndShimuraCurves:R18.3/tw-stabilisers
TwStabilisers [theorem]: For the level above, every character of Δ_Q kills the effective isotropy at U′_Q; the effective stabilisers at U_Q and U′_Q agree. Consequently Δ_Q acts freely on the class-set fibres C_{U_Q}→C_{U′_Q}. The invariant coefficient modules attached to all twists have equal O-rank; modulo the uniformizer their identifications are Hecke-equivariant, while arbitrary integral twist identifications need not be.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. N kills all p-isotropy exponents; Δ_Q is the quotient by Δ′[N].

HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness
TwFreeness [theorem]: Under KW Lemma 7.4’s coefficient and level hypotheses, S_{τ,ψ}(U_Q,O) is finite free over O[Δ_Q], of rank rank_O S_{τ,ψ}(U′_Q,O). On each free Δ_Q-orbit, the common finite-free invariant coefficient summand gives a regular O[Δ_Q] factor. The localized non-Eisenstein direct factors inherit freeness when the Hecke idempotent is Δ_Q-equivariant.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. Invariant coefficient summands finite free as established in the KW setting; an arbitrary representation without this condition is not covered.

HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control
TwLocalisedControl [theorem]: Given a non-Eisenstein residual system unramified at Q with two distinct Frobenius eigenvalues α_v,β_v, choose the Hensel lift A_v of α_v in X²−T_vX+q_vψ(π_v). Localizing at U_v−α_v selects a finite-free O[Δ_Q] module with rank rank_O S(U,O)_m; its Δ_Q-coinvariants identify with S(U,O)_m via ξ_v(f)=A_vf−diag(1,π_v)f. The Steinberg exclusion used in KW’s proof requires the stated R19 local–global compatibility; geometric Lemma 7.4 is independent of that input.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. Residual irreducibility/non-Eisenstein localization; q_v≡1 mod p, distinct α_v,β_v; actual characteristic-zero local–global compatibility supplied.

HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist
DyadicNormTwist [construction]: For p=2 and a given quadratic character χ:G_n/2G_n→O×, split at S and infinity and unramified outside Q, with 2^n>N ensuring χ(Nrd U_Q)=1, define T_χf(g)=χ(Nrd g)f(g). This O-linear involution preserves the weight, level and central character because Nrd(z)=z². Existence of χ and selection of Q belong to R22/R04, not to this construction.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. p=2; χ²=1; prescribed χ is trivial on the level norms.
DyadicNormTwist.apply [projection]: T_χf(g)=χ(Nrd g)f(g).
DyadicNormTwist.involutive [characterisation]: T_χ∘T_χ=id for χ²=1.
DyadicNormTwist.centralCharacter [compatibility]: The central character remains ψ since χ(z²)=1.
DyadicNormTwist.reduction [compatibility]: At residue characteristic two the reduction of T_χ is the identity.
DyadicNormTwist.trivial [example, degenerate]: The trivial χ gives the identity.
DyadicNormTwist.scalar [example, computation]: A central scalar z contributes χ(z²)=1.
DyadicNormTwist.nonquadratic [example, non-example]: An order-four character with χ(z)=i changes the scalar action by −1 and does not preserve ψ.

HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-hecke-twist
DyadicHeckeTwist [theorem]: For the norm twist, T_v and U_v are multiplied by χ(π_v), S_v is fixed, and (f|⟨h⟩)_χ=χ(h)⁻¹(f_χ|⟨h⟩). Since χ≡1 modulo the dyadic uniformizer, the residual maximal ideal is preserved. These equations transport the localized Taylor–Wiles modules and their ranks and coinvariants as in Proposition 7.6, conditional on the given auxiliary character.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. The dyadic norm-twist hypotheses and compatible local diamond lifts.

HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-sign-extension
DyadicSignExtension [theorem]: At a dyadic division place with U_v=D_v×, its maximal compact U_v⁰ has quotient U_vF_v×/(U_v⁰F_v×) of order two. For weight two, each choice of sign extends the compact coefficient action; over characteristic two the two reductions agree. With a set Σ₀ of such places there are 2^{|Σ₀|} sign choices. Compactness-based arguments must use U⁰ and retain this quotient.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. KW noncompact variant allowed only at the specified dyadic division factors; weight two.

HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal
ResidualHeckeIdeal [construction]: In the CDN §4.1.3 setup, let T^S=O[T_v,S_v:v∉S] be the shared abstract good-place Hecke algebra. Given a continuous residual ρ̄:G_E→GL₂(k) unramified outside S, evaluate T_v↦tr ρ̄(Frob_v), S_v↦q_v⁻¹ det ρ̄(Frob_v), and coefficients by O→k. Define m_ρ̄ as the kernel. The coefficient reduction is surjective, hence this is a maximal ideal. Factoring this evaluation through the acting quotient Hecke algebra requires the eigen-system existence theorem supplied by R19.
Hypotheses: F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k. U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ a continuous central character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×. For the CDN application p>2, local F=Q_p, global E even degree with p completely split, D₀ definite and finite-unramified; keep E distinct from the earlier auxiliary CM field. q_v is a unit in k; arithmetic Frobenius convention fixed.
ResidualHeckeIdeal.evalT [simp]: T_v evaluates to tr ρ̄(Frob_v).
ResidualHeckeIdeal.evalS [simp]: S_v evaluates to q_v⁻¹ det ρ̄(Frob_v).
ResidualHeckeIdeal.maximal [structure]: Surjective O→k makes the evaluation kernel maximal.
ResidualHeckeIdeal.actingFactor [compatibility]: When R19 supplies the eigen-system, the abstract evaluation factors through the acting Hecke quotient.
ResidualHeckeIdeal.normThree [example, computation]: In k=F₇, q=3 and determinant=6 give S=2.
ResidualHeckeIdeal.scalarDeterminant [example, compatibility]: The arithmetic polynomial has constant term qS=det ρ̄(Frob).
ResidualHeckeIdeal.nonsurjective [example, non-example]: The kernel of Z→Q is zero and not maximal; surjectivity cannot be dropped.

HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems
QuaternionLocalSystem [construction]: Specialize the shared automorphic local-system construction to X_U and an algebraic B×-representation W. On each complex component Γ\H, the Betti system is (H×W)/Γ; on the canonical curve the étale O/l^n systems descend the matching finite-level torsors, compatibly in n. Identify their pullbacks to the complex analytic curve using the fixed coefficient/dual convention. At split quaternionic p-level the rank-two Morita factor of H supplies the standard geometric representation of weight one. Parallel automorphic weight k uses its tensor of Sym^{k−2} constituents; automorphic weight two has the trivial rank-one coefficient system.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
QuaternionLocalSystem.betti [projection]: On Γ\H the system is the Γ-associated W-bundle.
QuaternionLocalSystem.etaleReduction [data]: Reduction modulo l^n is the descended finite-level torsor coefficient system.
QuaternionLocalSystem.changeLevel [functoriality]: Level pullback identifies the corresponding local systems.
QuaternionLocalSystem.trivial [compatibility]: Trivial W gives the constant local system in both realizations.
QuaternionLocalSystem.constant [example, degenerate]: The trivial rank-one representation gives the constant O-system.
QuaternionLocalSystem.rank [example, computation]: A rank-r lattice gives fibre rank r, not r times the covering degree.
QuaternionLocalSystem.monodromy [example, non-example]: On a loop acting by −1 on W, parallel transport is −1; the constant system is wrong when 2 is invertible.

HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology
QuaternionCohomology [construction]: Apply the imported cohomology functors to define M_U=H¹_et(X_U,Fbar,L_O) and M_U^B=H¹_B(X_U(C),L_O), with continuous G_F action on the étale side and finite O-modules. The good-place and change-level Hecke correspondences act by coefficient transport followed by pullback and trace. The Betti–étale comparison is Hecke-equivariant; integral O-freeness is a separate theorem, not part of the definition.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
QuaternionCohomology.hecke [data]: A correspondence acts by p₂,*∘coefficientTransport∘p₁*.
QuaternionCohomology.changeLevel [functoriality]: Level pullback and trace compose with the degree on a finite étale cover.
QuaternionCohomology.comparison [compatibility]: Betti–étale comparison intertwines the Hecke actions.
QuaternionCohomology.galoisCommutes [relation]: G_F commutes with correspondences defined over F.
QuaternionCohomology.genusTwo [example, computation]: Constant rational coefficients on a connected genus-two curve give dimension 4.
QuaternionCohomology.identityCorrespondence [example, degenerate]: The identity correspondence acts as the identity.
QuaternionCohomology.coverDegree [example, compatibility]: For a finite étale cover of degree d, trace∘pullback=d on cohomology.

HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control
IntegralCohomologyControl [theorem]: For a maximal ideal m of the good-place Hecke algebra, if H⁰(X,L_k)_m and H⁰(X,L_k∨(1))_m vanish, then the localized H¹(X,L_O)_m is finite free over O, H²(X,L_O)_m has no O-torsion, and H¹(X,L_O)_m⊗k→H¹(X,L_k)_m is an isomorphism. Proving these vanishings for the intended non-Eisenstein systems is an explicit quaternionic coefficient-system obligation; arbitrary non-Eisenstein language alone is not substituted for them.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Generic integral coefficient long exact sequences, Poincaré duality, and compatible Hecke localization.

HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing
CohomologyPairing [comparison]: Specialize Poincaré duality to obtain the perfect rational pairing H¹(X,L_E)×H¹(X,L_E∨(1))→E. At integral level the duality is a derived duality; it gives a perfect O-pairing on localized H¹ only under the preceding torsion/vanishing criteria and a chosen perfect coefficient lattice pairing. Pullback is adjoint to trace, and Hecke adjoints reverse the correspondence with its coefficient similitude factor.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces
CohomologicalEigenspaces [comparison]: Over a splitting characteristic-zero field, identify the cuspidal Hecke eigenspaces of the algebraic coefficient H¹ of X_U with the automorphic representations cohomological at the split real place and of the specified algebraic type at the other real places. For trivial coefficients the split real component has weight-two discrete series. Galois action on the multiplicity space is retained, but identifying it with a two-dimensional ρ_π and proving local–global compatibility are R19 statements.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Characteristic zero; actual coefficient-field models; generic Matsushima/cohomological decomposition and strong multiplicity one imported.

HilbertModularVarietiesAndShimuraCurves:R18.4/definite-indefinite-comparison
DefiniteIndefiniteComparison [comparison]: For quaternion algebras D⁰ and B with invariants exchanged at a finite place v and the designated real place, and a cuspidal GL₂ representation discrete series at every ramified place of either algebra, apply the two global JL correspondences. At levels transported away {v,τ}, identify their away-place Hecke eigensystems and multiplicity factors over actual common rational models. At v the split GL₂ representation and its division JL partner remain different carriers; the full definite functions and the full curve H¹ are not isomorphic.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. The transfer domain and infinity weights match; actual common coefficient field as in R17.3 rational-models.

HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy
QuaternionDegeneracy [construction]: At w with B split, hyperspecial level and coefficient system unramified at w, the two canonical maps X_{U₀(w)}→X_U induce δ=(δ₁*,δ₂*):M_U²→M_{U₀(w)}. Their trace maps give the dual degeneracy map. They commute with G_F and away-w Hecke operators; the pullback/trace composition matrix is obtained from the local double-coset computation with degree q_w+1. Integral injectivity and saturated image require an Ihara theorem with explicit hypotheses, and are not inferred from the definite Lemma 7.1.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. The coefficient action extends to the local semigroup; the two level morphisms use a specified diag(1,π_w).
QuaternionDegeneracy.pullback [data]: δ maps (a,b) to δ₁*a+δ₂*b with transported coefficients.
QuaternionDegeneracy.trace [data]: The reverse map is the pair of coefficient-compatible traces.
QuaternionDegeneracy.awayHecke [compatibility]: Both maps intertwine all Hecke correspondences away w.
QuaternionDegeneracy.degree [characterisation]: Each hyperspecial-to-Iwahori map has degree q_w+1.
QuaternionDegeneracy.qTwo [example, computation]: For residue field F₂ the covering degree is 3.
QuaternionDegeneracy.tracePullback [example, compatibility]: The diagonal trace–pullback composition is q_w+1.
QuaternionDegeneracy.badPlace [example, non-example]: At a division place there is no hyperspecial GL₂-to-Iwahori map of this shape.

HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-purity
QuaternionPurity [theorem]: At a finite good place away l, a specified algebraic projector on the auxiliary abelian scheme gives a rank-two lisse coefficient constituent pure of weight one. An algebraic symmetric/tensor coefficient system of total geometric weight r is pure of weight r; since X is proper smooth, H¹(X,L) is pure of weight r+1 for geometric Frobenius. The quaternionic rank-two constituent and its projector must be verified; the current R34.5 elliptic-family node alone is insufficient for this higher-dimensional auxiliary PEL family.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Good smooth fibre; l invertible; compatible Frobenius-commuting projectors and actual pure coefficient constituents.

HilbertModularVarietiesAndShimuraCurves:R18.4/finite-level-descent
FiniteLevelDescent [theorem]: For a finite effective étale Galois level cover X_{U′}→X_U with group Δ of order invertible in the coefficient ring and compatible local systems, pullback identifies H¹(X_U,L) with H¹(X_{U′},L)^Δ and |Δ|⁻¹trace is its inverse on invariants. When p divides |Δ|, replace this assertion by the Hochschild–Serre spectral sequence and coefficient torsion terms; no unconditional integral invariants equality is asserted.
Hypotheses: B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary. O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Cover finite étale on the generic fibre and genuinely effective; |Δ| invertible for the displayed equality.

HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane
DrinfeldHalfPlane [definition]: The Drinfeld half-plane Ω_K is the rigid analytic open P¹_K\P¹(K), formed by removing the K-rational analytic points. Ω_K(C)=P¹(C)\P¹(K)=C\K in the affine chart with infinity removed. PGL₂(K) acts by homographies. This is not the algebraic complement of a Zariski-closed subscheme P¹(K). The affinoid exhaustion supplies its actual analytic open structure.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
DrinfeldHalfPlane.points [characterisation]: Its C-points are P¹(C) minus P¹(K).
DrinfeldHalfPlane.homography [data]: PGL₂(K) acts through the usual fractional linear formula.
DrinfeldHalfPlane.affineChart [compatibility]: The affine chart identifies the C-points with C minus K.
DrinfeldHalfPlane.baseChange [functoriality]: Scalar extension identifies the Ω_K affinoid exhaustion with its C-exhaustion; it does not replace the removed set by P¹(C).
DrinfeldHalfPlane.infinity [example, degenerate]: The point infinity is excluded.
DrinfeldHalfPlane.quadraticPoint [example, example]: For z∈K₂\K in a quadratic extension, z lies in Ω_K(C).
DrinfeldHalfPlane.scalarAction [example, compatibility]: Every central scalar in GL₂(K) acts trivially.
DrinfeldHalfPlane.algebraicComplement [example, non-example]: Removing finitely many K-rational points is insufficient: all P¹(K) must be excluded.

HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction
DrinfeldExhaustion [construction]: For n≥1, set P_n=P¹(O_K/π^n) and U_n=P¹_C minus the union of open balls centered at P_n of radius |π|^n in the standard projective metric. These affinoids increase to Ω_C. The norm-class reduction r:Ω_C→|T_K| is PGL₂(K)-equivariant, and U_n is the inverse image of the closed tree ball of radius n about the standard vertex. Tree vertices are homothety classes of rank-two lattices; adjacent representatives satisfy πL⊊L′⊊L.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
DrinfeldExhaustion.affinoid [structure]: Each U_n descends from an affinoid over K.
DrinfeldExhaustion.increasing [relation]: U_n⊂U_{n+1} and their union is Ω_C.
DrinfeldExhaustion.treeBall [characterisation]: U_n=r⁻¹ of the radius-n tree ball.
DrinfeldExhaustion.equivariant [compatibility]: r(gz)=g r(z) for g∈PGL₂(K).
DrinfeldExhaustion.residueTwo [example, computation]: For q=2 a vertex has 3 incident edges.
DrinfeldExhaustion.firstSphere [example, computation]: The radius-one tree ball has q+2 vertices.
DrinfeldExhaustion.centralScalar [example, compatibility]: Scaling a lattice changes neither its vertex nor the reduction class.

HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model
DrinfeldFormalModel [construction]: Start with X₀=P¹_O_K and form X_n by blowing up every smooth k-rational special-fibre point of X_{n−1}; take the π-adic completions. Remove the smooth k-rational points from X_n to form the formal open Ũ_n. Then Ũ_n⊂Ũ_{n+1}, its generic fibre is U_n,K, and Ω̂=⋃Ũ_n is a flat regular semistable formal model of Ω_K. Its components are P¹_k indexed by tree vertices and its nodes by tree edges, locally xy=π. The full GL₂(K) action factors through PGL₂(K).
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
DrinfeldFormalModel.genericFibre [compatibility]: The generic fibre of Ω̂ is Ω_K.
DrinfeldFormalModel.nodeChart [data]: At an edge the completed local equation is xy=π.
DrinfeldFormalModel.components [equivalence]: Special-fibre components and nodes identify with tree vertices and edges.
DrinfeldFormalModel.action [functoriality]: The PGL₂(K) action extends the analytic homography action.
DrinfeldFormalModel.centralComponent [example, compatibility]: The initial vertex component is P¹_k with its q+1 rational attaching points.
DrinfeldFormalModel.qTwo [example, computation]: For q=2 each component meets three branches in the full model.
DrinfeldFormalModel.ramifiedNode [example, non-example]: For e=2, xy=π′² is a singular total-space local ring; regularity is not preserved.

HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli
SpecialFormalModuli [definition]: Let D/K be the local division quaternion algebra, O_D its maximal order containing the unramified quadratic order O₂. A strict special formal O_D-module X over a π-nilpotent O_Ǩ-scheme has O_K-height 4 and Lie(X) locally free of rank one over O₂⊗O_K O_S (hence rank two over O_S), with strict O_K action. Fix a framing Φ over kbar. The functor M_Dr(0) classifies (X,ρ) where ρ:X_Sbar→Φ_Sbar is an O_D-linear quasi-isogeny of relative height zero, modulo compatible isomorphism. M̃ allows heights 2m, m∈Z. BC uses the inverse framing arrow; invert it when comparing conventions.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. The strict formal-module and relative height carriers are supplied by R07.1–R07.2.
SpecialFormalModuli.specialLie [characterisation]: Lie is rank one over O₂⊗O_S.
SpecialFormalModuli.baseChange [functoriality]: Pull back X and its special-fibre framing along every nilpotent-base map.
SpecialFormalModuli.framingAction [data]: A framing quasi-isogeny δ acts by δ∘ρ.
SpecialFormalModuli.heightComponents [structure]: The arbitrary-height functor decomposes into the height-2m components.
SpecialFormalModuli.heightZero [example, degenerate]: The framing object with identity ρ lies in M_Dr(0).
SpecialFormalModuli.absoluteHeight [example, computation]: When [K:Q_p]=2 the absolute p-height is 8.
SpecialFormalModuli.wrongLie [example, non-example]: An O_D-module whose Lie O₂ action has ranks (2,0) is not special.

HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability
DrinfeldRepresentability [theorem]: The special formal O_D-module functor M_Dr(0) is represented by Ω̂⊗O_K O_Ǩ. The equivalence is functorial on π-nilpotent bases, not just a bijection on geometric points, and identifies the universal special formal module. The group of framing quasi-isogenies is GL₂(K); on height zero the normalized action factors through PGL₂(K).
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Strict special modules, fixed frame and arrow convention as above.

HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent
HeightAndDescent [comparison]: Normalize arbitrary-height M̃_Dr≅M_Dr(0)×Z by a division uniformizer Π and its Hecke shift h(Π). Under BZ §5.9, δ∈GL₂(K) acts by (ω,m)↦(pr(δ)ω,m+ord_K det δ), where pr(δ)=h(Π)^{−ord det δ}δ on height zero. The product identification is independent of Π. For arithmetic descent use τ_c=Spf τ⁻¹ and the separate right Π⁻¹ Hecke translation in Theorem 6.7; do not conflate this translation with the normalized PGL₂ action.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient
ArithmeticDrinfeldQuotient [construction]: For B/F division split at τ only and division at v, let B̌ exchange invariants at {τ,v}, so it is totally definite and split at v. For compact level U with U_v=O_B,v× and small U^v, form B̌×\[(Ω̂⊗O_Fv O_Fv̌)×B_f×/U], using fixed away-v identifications; B̌_v× acts by homography and the local valuation component ord_v Nrd. Its finite component decomposition uses Γ_g={b∈B̌×∩gU^v g⁻¹:ord_v det b=0}, projected to PGL₂(F_v). These projected groups are discrete cocompact and become torsion-free with sufficiently small tame level.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Global B/F, τ,v and level as stated; effective central quotient and finite component representatives fixed.
ArithmeticDrinfeldQuotient.components [data]: Connected pieces are the specified projective Γ_g quotients after unramified base change.
ArithmeticDrinfeldQuotient.cocompact [structure]: Each effective Γ_g is discrete and cocompact in PGL₂(F_v).
ArithmeticDrinfeldQuotient.changeLevel [functoriality]: Nested tame levels give the corresponding finite quotient maps.
ArithmeticDrinfeldQuotient.algebraisation [compatibility]: At sufficiently small level the proper formal curve algebraizes with the same generic fibre.
ArithmeticDrinfeldQuotient.scalar [example, compatibility]: Central scalar homographies are ineffective; their valuation effect is retained separately.
ArithmeticDrinfeldQuotient.node [example, computation]: At free level an edge orbit has node chart xy=π.
ArithmeticDrinfeldQuotient.nonfree [example, non-example]: A quotient with a nontrivial effective vertex stabiliser cannot use the free-action regularity argument.

HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation
TotallyRealUniformisation [theorem]: For totally real F, B division split only at τ, v with B_v division, U_v=O_B,v× and the other p-adic factors and tame level as in BZ (6.31), the completion of the canonical integral Shimura curve over O_Eν identifies with B̌×\[(Ω̂_Fv⊗O_Fv O_Eν̌)×B_f×/U]. Here E=τ(F), E_ν=F_v. It is compatible with level transitions and Hecke operators at the permitted levels. With τ_c=Spf τ⁻¹, natural descent corresponds on the quotient to id_Ω×|Π⁻¹×τ_c. For small tame level the model is regular semistable and stable.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. All local factors match BZ (6.31); sufficiently small U^v for the final stable/regular claim.

HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation
RationalUniformisation [comparison]: For F=Q, a division quaternion algebra ramified at p and split at infinity, and maximal p-level with sufficiently small tame U^p, specialize the uniformisation to BC III Theorem 5.2. Match its left/right actions via the chosen algebra anti-isomorphism and its Frobenius–determinant twist with the BZ convention. The isomorphism also compares the universal special formal O_D modules. The split B=M₂(Q) modular curve is outside this division-prime assertion.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation
TowerUniformisation [theorem]: In CDN20 §5.2.1, E is totally real with E_𝔭=K; B̌ is split only at ∞₀ and division at 𝔭; B exchanges these invariants and is definite. With the fixed identifications of local and away-𝔭 groups, sufficiently small tame U and the exact congruence subgroups Ǧ_n at 𝔭, there are rigid isomorphisms Sh_n(U)^an≅B×\[M_n×B(A_f^𝔭)×/U] for every n≥1, compatible in n,U. M_n is the corresponding Drinfeld cover defined by the universal special formal module’s level structure. The theorem is on rigid generic fibres; it does not assert every high-level integral cover is semistable without alteration.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Exact CDN20 tower convention Ǧ_n retained; U sufficiently small.

HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph
TreeDualGraph [comparison]: At small maximal division-prime level, the geometric special-fibre dual graph is the finite disjoint union of Γ_g\T_K corresponding to the arithmetic quotient components. Vertices index rational components and edges index nodes, with loops and repeated edges retained in the quotient graph. The graph carries the Frobenius permutation induced by the Π⁻¹ descent, and Hecke/level maps are the transported adelic correspondences on vertex/edge orbits.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Tame level sufficiently small for free local charts; generic dual multigraph supplied by StableReduction.

HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy
CharacterMonodromy [comparison]: For the Jacobian of a small-level semistable uniformized curve, identify the toric character lattice with H₁(Γ_g\T_K,Z), compatibly with Hecke and descent. Under the generic semistable-Jacobian monodromy theorem the pairing is the oriented cycle edge pairing Σ_e thickness(e)a_e b_e. At the unramified regular maximal-level model thickness is 1. Its cokernel presents the geometric component group using the dual lattice; Frobenius descent determines the arithmetic group.
Hypotheses: K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension. Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective. Generic semistable Jacobian/Néron and graph monodromy theorem supplied; connected component handled separately.

-/
