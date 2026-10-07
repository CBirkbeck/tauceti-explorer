/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. The statements suggest Lean forms so contributors and reviewers
converge on names and signatures. No implementation is claimed.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The executable portion uses available Mathlib carriers. The intended arithmetic
specialization imports TauCeti.NumberTheory.NumberField.TotallyPositive, whose
compiled module is absent from the shared build. Its pinned source was read,
but rebuilding the library is prohibited. Therefore P remains an explicit
subgroup parameter, instantiated mathematically with the existing positive
unit subgroup; no replacement definition of total positivity is introduced.
Missing geometric supplier interfaces are itemized in the final contract ledger.
An omitted contract is not an elaborated signature or a proved theorem.
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

/-!
# Suggested Hilbert modular signatures

This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so that contributors and reviewers
converge on names and signatures; no implementation is claimed.

The native part reuses Mathlib fractional ideals, submodules, traces, matrix units
and normal-subgroup quotients. The unit formulas are parameterized by a subgroup P
of arithmetic units; instantiate P with the existing
NumberField.totallyPositiveIntegerUnits, rather than redefining total positivity.
Where square containment is needed it is an explicit hypothesis, supplied by
NumberField.sq_mem_totallyPositiveIntegerUnits in that specialization.

The final contract ledger records unavailable supplier signatures. A missing
relative moduli carrier is not replaced by an assumed proposition or a dummy type.
-/

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
