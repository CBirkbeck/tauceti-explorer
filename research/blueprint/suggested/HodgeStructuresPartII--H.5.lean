import Mathlib.Algebra.Lie.Classical
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Geometrically.Connected
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.ZariskisMainTheorem
import Mathlib.Analysis.CStarAlgebra.Matrix
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Functoriality
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.Topology.Instances.Matrix

/-!
# Suggested Lean forms for HodgeStructuresPartII, layer H.5

This file is not the roadmap and is not exhaustive. The roadmap document
(`research/blueprint/readmes/HodgeStructuresPartII--H.5.md`) is definitive. The statements suggest
Lean forms so that contributors and reviewers converge on names and signatures. Every proof is
`sorry`; no implementation is claimed.

The native part uses Mathlib at the pinned commit. The Tau Ceti baseline supplies later
local-coefficient and compactness inputs; neither Tau Ceti module is needed to elaborate these
signatures:

* trace-free adjoint coefficients on `LieAlgebra.SpecialLinear.sl` and Mathlib's group cohomology
  (`groupCohomology`, `groupCohomology.map`, `groupCohomology.H1InfRes`);
* rigidity of a representation in Simpson's orbit form, for the topology of pointwise convergence
  on `Γ →* GL (Fin r) ℂ` (the analytic topology of the representation variety when `Γ` is finitely
  generated), and cohomological rigidity relative to boundary loops;
* unitary, integral and strongly integral representations, with Mathlib's
  `NumberField.Embeddings` finiteness and Kronecker theorems and Tau Ceti's compactness of the
  unitary group;
* the rigid locus of a morphism of schemes as Mathlib's quasi-finite locus, and the part of an
  arithmetic model that Mathlib's schemes can express;
* a module-level (coordinate chart) model of systems of Hodge bundles.

All names are in the namespace `TauCeti.NonabelianHodge`; a comment `-- Name` before an `example`
gives the packet name of that unit test. Statements that need the moduli spaces of layer H.1, flat
bundles on varieties, polarized complex variations (layer H.2), projective linear groups or
completions are listed in the omission inventory at the end, with their mathematical statements.
No missing geometric condition is replaced by an opaque proposition.
-/

noncomputable section

open CategoryTheory
open scoped TensorProduct

namespace TauCeti.NonabelianHodge

/-! ## Trace-free adjoint coefficients -/

section TraceFree

variable {Γ : Type} [Group Γ] {K : Type} [Field K] {r : ℕ}

/-- Coordinate adapter to Mathlib's representation carrier (the same adapter as layer H.1). -/
def matrixRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Representation K Γ (Fin r → K) :=
  (Units.coeHom _).comp
    ((Matrix.GeneralLinearGroup.toLin (n := Fin r) (R := K)).toMonoidHom.comp ρ)

/-- The conjugation representation of `Γ` on all of `M_r(K)` (the full adjoint, which is not the
coefficient system of rigidity). -/
def conjRep (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Representation K Γ (Matrix (Fin r) (Fin r) K) where
  toFun γ :=
    { toFun := fun A => (ρ γ : Matrix (Fin r) (Fin r) K) * A *
        (((ρ γ)⁻¹ : Matrix.GeneralLinearGroup (Fin r) K) : Matrix (Fin r) (Fin r) K)
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

/-- The trace-free adjoint representation `ad⁰ρ` on `sl_r(K)`. -/
def TraceFreeAdjoint.rep (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Representation K Γ (LieAlgebra.SpecialLinear.sl (Fin r) K) where
  toFun γ :=
    { toFun := fun A => ⟨conjRep ρ γ A, by sorry⟩
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

/-- Twisting a representation by a character `χ`. -/
def scalarTwist (χ : Γ →* Kˣ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Γ →* Matrix.GeneralLinearGroup (Fin r) K where
  toFun γ := Matrix.GeneralLinearGroup.scalar (Fin r) (χ γ) * ρ γ
  map_one' := by sorry
  map_mul' := by sorry

namespace TraceFreeAdjoint

variable (ρ σ : Γ →* Matrix.GeneralLinearGroup (Fin r) K)

theorem rep_apply (γ : Γ) (A : LieAlgebra.SpecialLinear.sl (Fin r) K) :
    ((rep ρ γ A : LieAlgebra.SpecialLinear.sl (Fin r) K) : Matrix (Fin r) (Fin r) K) =
      (ρ γ : Matrix (Fin r) (Fin r) K) * A *
        (((ρ γ)⁻¹ : Matrix.GeneralLinearGroup (Fin r) K) : Matrix (Fin r) (Fin r) K) := by
  sorry

/-- If `r` is invertible in `K`, `M_r(K) = sl_r(K) ⊕ K·1` compatibly with conjugation. -/
theorem endSplitting (h : (r : K) ≠ 0) :
    ∃ e : Matrix (Fin r) (Fin r) K ≃ₗ[K] (LieAlgebra.SpecialLinear.sl (Fin r) K × K),
      ∀ γ A, e (conjRep ρ γ A) = (rep ρ γ (e A).1, (e A).2) := by
  sorry

theorem conjEquiv (P : Matrix.GeneralLinearGroup (Fin r) K)
    (hP : ∀ γ, σ γ = P * ρ γ * P⁻¹) : Nonempty ((rep ρ).Equiv (rep σ)) := by
  sorry

theorem twist (χ : Γ →* Kˣ) : rep (scalarTwist χ ρ) = rep ρ := by
  sorry

/-- `ad⁰ρ` only depends on `ρ` up to scalars, i.e. on its projectivization. -/
theorem projectivization (hscal : ∀ γ, ∃ c : Kˣ,
    σ γ = Matrix.GeneralLinearGroup.scalar (Fin r) c * ρ γ) : rep σ = rep ρ := by
  sorry

/-- Schur: for absolutely irreducible `ρ` and `r` invertible, `ad⁰ρ` has no invariants. -/
theorem invariants_eq_bot [IsAlgClosed K] (h : (r : K) ≠ 0)
    (hρ : (matrixRepresentation ρ).IsIrreducible) (A : LieAlgebra.SpecialLinear.sl (Fin r) K)
    (hA : ∀ γ, rep ρ γ A = A) : A = 0 := by
  sorry

/-- Base change of the coefficient field commutes with `ad⁰`. -/
theorem baseChange_apply {L : Type} [Field L] (f : K →+* L) (γ : Γ)
    (A : LieAlgebra.SpecialLinear.sl (Fin r) K)
    (hA : (A : Matrix (Fin r) (Fin r) K).map f ∈ LieAlgebra.SpecialLinear.sl (Fin r) L) :
    ((rep ((Matrix.GeneralLinearGroup.map f).comp ρ) γ ⟨_, hA⟩ :
      LieAlgebra.SpecialLinear.sl (Fin r) L) : Matrix (Fin r) (Fin r) L) =
      ((rep ρ γ A : LieAlgebra.SpecialLinear.sl (Fin r) K) : Matrix (Fin r) (Fin r) K).map f := by
  sorry

-- TraceFreeAdjoint.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) K)
    (A : LieAlgebra.SpecialLinear.sl (Fin 1) K) : A = 0 := by
  sorry

-- TraceFreeAdjoint.test_char_two_no_splitting
example : (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) ∈ LieAlgebra.SpecialLinear.sl (Fin 2) (ZMod 2) ∧
    ¬ IsCompl (LinearMap.ker (Matrix.traceLinearMap (Fin 2) (ZMod 2) (ZMod 2)))
      (Submodule.span (ZMod 2) {(1 : Matrix (Fin 2) (Fin 2) (ZMod 2))}) := by
  sorry

-- TraceFreeAdjoint.test_irreducible_no_invariants
example (ρ : Equiv.Perm (Fin 3) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible) (A : LieAlgebra.SpecialLinear.sl (Fin 2) ℂ)
    (hA : ∀ γ, rep ρ γ A = A) : A = 0 := by
  sorry

end TraceFreeAdjoint

/-- The trace-free adjoint representation as an object of `Rep K Γ`. -/
abbrev adRep (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) : Rep K Γ :=
  Rep.of (TraceFreeAdjoint.rep ρ)

/-- For finitely generated `Γ`, `H¹(Γ, ad⁰ρ)` commutes with extension of the coefficient field. -/
def TraceFreeAdjoint.baseChange_H1 [Group.FG Γ] {L : Type} [Field L] [Algebra K L]
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    (L ⊗[K] (groupCohomology (adRep ρ) 1)) ≃ₗ[L]
      (groupCohomology (adRep ((Matrix.GeneralLinearGroup.map (algebraMap K L)).comp ρ)) 1) := by
  sorry

-- TraceFreeAdjoint.test_trivial_free_abelian
example (r : ℕ) :
    Module.finrank ℂ (groupCohomology
      (adRep (1 : Multiplicative (ℤ × ℤ) →* Matrix.GeneralLinearGroup (Fin r) ℂ)) 1) =
      2 * (r ^ 2 - 1) := by
  sorry

-- TraceFreeAdjoint.test_full_adjoint_differs
example : Nontrivial (groupCohomology
      (Rep.of (conjRep (1 : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ))) 1) ∧
    Subsingleton (groupCohomology
      (adRep (1 : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)) 1) := by
  sorry

end TraceFree

/-! ## Boundary loops and quasi-unipotence -/

section Boundary

variable {Γ : Type} [Group Γ] {K : Type} [Field K] {r : ℕ}

/-- Quasi-unipotent local monodromy along given boundary loops `T i`. -/
def IsQuasiUnipotentAtInfinity {ι : Type} (T : ι → Γ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) : Prop :=
  ∀ i, ∃ m : ℕ, 0 < m ∧
    IsNilpotent (((ρ (T i) ^ m : Matrix.GeneralLinearGroup (Fin r) K) :
      Matrix (Fin r) (Fin r) K) - 1)

namespace IsQuasiUnipotentAtInfinity

variable {ι : Type} (T : ι → Γ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K)

theorem iff_eigenvalues [IsAlgClosed K] : IsQuasiUnipotentAtInfinity T ρ ↔
    ∀ i, ∀ μ ∈ (((ρ (T i) : Matrix.GeneralLinearGroup (Fin r) K) :
      Matrix (Fin r) (Fin r) K).charpoly).roots, ∃ n : ℕ, 0 < n ∧ μ ^ n = 1 := by
  sorry

theorem conj_aut (f : K ≃+* K) :
    IsQuasiUnipotentAtInfinity T ((Matrix.GeneralLinearGroup.map (f : K →+* K)).comp ρ) ↔
      IsQuasiUnipotentAtInfinity T ρ := by
  sorry

-- BoundaryMonodromyData.test_projective_vacuous
example [IsEmpty ι] : IsQuasiUnipotentAtInfinity T ρ := by
  sorry

-- BoundaryMonodromyData.test_Gm_root_of_unity
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ) :
    IsQuasiUnipotentAtInfinity ![Multiplicative.ofAdd (1 : ℤ), Multiplicative.ofAdd (-1 : ℤ)] ρ ↔
      ∃ n : ℕ, 0 < n ∧
        ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0) ^ n = 1 := by
  sorry

-- BoundaryMonodromyData.test_Gm_not_quasiUnipotent
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0 = 2) :
    ¬ IsQuasiUnipotentAtInfinity ![Multiplicative.ofAdd (1 : ℤ), Multiplicative.ofAdd (-1 : ℤ)] ρ := by
  sorry

-- BoundaryMonodromyData.test_unipotent_infinite_order
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (h : ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 2) ℂ) :
      Matrix (Fin 2) (Fin 2) ℂ) = !![1, 1; 0, 1]) :
    IsQuasiUnipotentAtInfinity ![Multiplicative.ofAdd (1 : ℤ), Multiplicative.ofAdd (-1 : ℤ)] ρ ∧
      ¬ IsOfFinOrder (ρ (Multiplicative.ofAdd 1)) := by
  sorry

end IsQuasiUnipotentAtInfinity

end Boundary

/-! ## Rigidity predicates -/

section Rigidity

variable {Γ : Type} [Group Γ] {K : Type} [Field K] {r : ℕ}

/-- Strong cohomological rigidity: `H¹(Γ, ad⁰ρ) = 0`. -/
def IsStronglyCohomologicallyRigid (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) : Prop :=
  Subsingleton (groupCohomology (adRep ρ) 1)

/-- Restriction of `H¹(Γ, ad⁰ρ)` to the cyclic subgroup generated by a loop `T`. -/
abbrev restrictToLoop (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) (T : Γ) :=
  groupCohomology.map (Subgroup.zpowers T).subtype (𝟙 _) 1 (A := adRep ρ)

/-- Cohomological rigidity relative to boundary loops `T i` (the local monodromy loops of a good
compactification): the restriction `H¹(Γ, ad⁰ρ) → ⊕ᵢ H¹(⟨Tᵢ⟩, ad⁰ρ)` is injective. This is the
group-theoretic form of `H¹(U, a_* End⁰ V) = 0`; with no loops it is strong cohomological
rigidity. -/
def IsCohomologicallyRigid {ι : Type} (T : ι → Γ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Prop :=
  ∀ x : groupCohomology (adRep ρ) 1, (∀ i, (restrictToLoop ρ (T i)).hom x = 0) → x = 0

namespace IsStronglyCohomologicallyRigid

variable (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K)

theorem isCohomologicallyRigid {ι : Type} (T : ι → Γ) (h : IsStronglyCohomologicallyRigid ρ) :
    IsCohomologicallyRigid T ρ := by
  sorry

/-- Restriction to a finite-index subgroup (a finite étale cover) is injective on `H¹` in
characteristic zero. -/
theorem of_finiteCover [CharZero K] (H : Subgroup Γ) [H.FiniteIndex]
    (h : IsStronglyCohomologicallyRigid (ρ.comp H.subtype)) :
    IsStronglyCohomologicallyRigid ρ := by
  sorry

theorem conj_aut (f : K ≃+* K) :
    IsStronglyCohomologicallyRigid ((Matrix.GeneralLinearGroup.map (f : K →+* K)).comp ρ) ↔
      IsStronglyCohomologicallyRigid ρ := by
  sorry

theorem of_groupCohomology :
    IsStronglyCohomologicallyRigid ρ ↔ Subsingleton (groupCohomology (adRep ρ) 1) := by
  sorry

-- IsStronglyCohomologicallyRigid.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) K) : IsStronglyCohomologicallyRigid ρ := by
  sorry

-- IsStronglyCohomologicallyRigid.test_projective
example {ι : Type} [IsEmpty ι] (T : ι → Γ) :
    IsStronglyCohomologicallyRigid ρ ↔ IsCohomologicallyRigid T ρ := by
  sorry

-- IsStronglyCohomologicallyRigid.test_free_group
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible) :
    Module.finrank ℂ (groupCohomology (adRep ρ) 1) = 3 := by
  sorry

-- IsStronglyCohomologicallyRigid.test_hypergeometric
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible) : ¬ IsStronglyCohomologicallyRigid ρ := by
  sorry

end IsStronglyCohomologicallyRigid

/-- The three local monodromy loops of `ℙ¹ ∖ {0, 1, ∞}`, whose fundamental group is free on the
loops around `0` and `1`. -/
def hypergeometricLoops : Fin 3 → FreeGroup (Fin 2) :=
  ![FreeGroup.of 0, FreeGroup.of 1, (FreeGroup.of 0 * FreeGroup.of 1)⁻¹]

namespace IsCohomologicallyRigid

variable {ι : Type} (T : ι → Γ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K)

theorem of_strong (h : IsStronglyCohomologicallyRigid ρ) : IsCohomologicallyRigid T ρ := by
  sorry

theorem projective_iff [IsEmpty ι] :
    IsCohomologicallyRigid T ρ ↔ IsStronglyCohomologicallyRigid ρ := by
  sorry

theorem conj_aut (f : K ≃+* K) :
    IsCohomologicallyRigid T ((Matrix.GeneralLinearGroup.map (f : K →+* K)).comp ρ) ↔
      IsCohomologicallyRigid T ρ := by
  sorry

-- IsCohomologicallyRigid.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) K) : IsCohomologicallyRigid T ρ := by
  sorry

-- IsCohomologicallyRigid.test_projective_groupCohomology
example [IsEmpty ι] :
    IsCohomologicallyRigid T ρ ↔ Subsingleton (groupCohomology (adRep ρ) 1) := by
  sorry

-- IsCohomologicallyRigid.test_hypergeometric
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hT : ∀ i, ∀ c : ℂˣ, ρ (hypergeometricLoops i) ≠ Matrix.GeneralLinearGroup.scalar (Fin 2) c) :
    IsCohomologicallyRigid hypergeometricLoops ρ := by
  sorry

-- IsCohomologicallyRigid.test_not_strong
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hT : ∀ i, ∀ c : ℂˣ, ρ (hypergeometricLoops i) ≠ Matrix.GeneralLinearGroup.scalar (Fin 2) c) :
    IsCohomologicallyRigid hypergeometricLoops ρ ∧ ¬ IsStronglyCohomologicallyRigid ρ := by
  sorry

end IsCohomologicallyRigid

/-- The topology of pointwise convergence on representations; for finitely generated `Γ` it is
the analytic topology of the representation variety. -/
abbrev repTopology (Γ : Type) [Group Γ] (r : ℕ) :
    TopologicalSpace (Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) :=
  TopologicalSpace.induced
    (fun ρ γ => ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ))
    inferInstance

/-- Rigidity includes irreducibility and fixed determinant `δ`: every nearby representation with
determinant `δ` is conjugate to `ρ`. For finitely generated `Γ` over `ℂ` it is
equivalent to isolation of `[ρ]` in `M_B^s(Γ, r, δ)` (layer H.1's coarse space). -/
def IsRigidRepresentation (δ : Γ →* ℂˣ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  (matrixRepresentation ρ).IsIrreducible ∧
    Matrix.GeneralLinearGroup.det.comp ρ = δ ∧
    ∀ᶠ σ in @nhds _ (repTopology Γ r) ρ, Matrix.GeneralLinearGroup.det.comp σ = δ →
      ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ, σ γ = P * ρ γ * P⁻¹

namespace IsRigidRepresentation

variable (δ : Γ →* ℂˣ) (ρ σ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)

theorem conj (P : Matrix.GeneralLinearGroup (Fin r) ℂ) (hP : ∀ γ, σ γ = P * ρ γ * P⁻¹) :
    IsRigidRepresentation δ σ ↔ IsRigidRepresentation δ ρ := by
  sorry

theorem twist (χ : Γ →* ℂˣ) :
    IsRigidRepresentation (χ ^ r * δ) (scalarTwist χ ρ) ↔ IsRigidRepresentation δ ρ := by
  sorry

theorem of_cohomologicallyRigid [Group.FG Γ] (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = δ)
    (h : IsStronglyCohomologicallyRigid ρ) : IsRigidRepresentation δ ρ := by
  sorry

theorem rankOne (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = δ) : IsRigidRepresentation δ ρ := by
  sorry

-- IsRigidRepresentation.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = δ) : IsRigidRepresentation δ ρ := by
  sorry

-- IsRigidRepresentation.test_finite_group
example [Finite Γ] (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = δ) : IsRigidRepresentation δ ρ := by
  sorry

-- IsRigidRepresentation.test_free_group
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = 1) : ¬ IsRigidRepresentation 1 ρ := by
  sorry

-- IsRigidRepresentation.test_unfixed_determinant
example (ρ : Multiplicative (ℤ × ℤ) →* Matrix.GeneralLinearGroup (Fin 1) ℂ) :
    IsRigidRepresentation (Matrix.GeneralLinearGroup.det.comp ρ) ρ ∧
      ∃ᶠ σ in @nhds _ (repTopology (Multiplicative (ℤ × ℤ)) 1) ρ,
        ¬ ∃ P : Matrix.GeneralLinearGroup (Fin 1) ℂ, ∀ γ, σ γ = P * ρ γ * P⁻¹ := by
  sorry

-- IsRigidRepresentation.test_reducible_excluded
example : ¬ IsRigidRepresentation 1
    (1 : Unit →* Matrix.GeneralLinearGroup (Fin 2) ℂ) := by
  sorry

end IsRigidRepresentation

/-- Absolute irreducibility: irreducible after extension of scalars to an algebraic closure. -/
def IsAbsolutelyIrreducible {A : Type} [Field A] (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) A) :
    Prop :=
  (matrixRepresentation
    ((Matrix.GeneralLinearGroup.map (algebraMap A (AlgebraicClosure A))).comp ρ)).IsIrreducible

namespace IsAbsolutelyIrreducible

theorem iff_algebraicClosure {A Ω : Type} [Field A] [Field Ω] [IsAlgClosed Ω] [Algebra A Ω]
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) A) :
    IsAbsolutelyIrreducible ρ ↔
      (matrixRepresentation
        ((Matrix.GeneralLinearGroup.map (algebraMap A Ω)).comp ρ)).IsIrreducible := by
  sorry

end IsAbsolutelyIrreducible

-- ProjectiveRepresentation.test_rotation_not_absolutely_irreducible
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 2) ℝ)
    (h : ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 2) ℝ) :
      Matrix (Fin 2) (Fin 2) ℝ) = !![0, -1; 1, 0]) :
    (matrixRepresentation ρ).IsIrreducible ∧ ¬ IsAbsolutelyIrreducible ρ := by
  sorry

/-- Rigidity, cohomological rigidity and quasi-unipotence are invariant under field automorphisms
of `ℂ` (which need not be continuous). -/
theorem rigidity_conj_aut [Group.FG Γ] (f : ℂ ≃+* ℂ) (δ : Γ →* ℂˣ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) (hρ : (matrixRepresentation ρ).IsIrreducible) :
    IsRigidRepresentation ((Units.map (f : ℂ →* ℂ)).comp δ)
        ((Matrix.GeneralLinearGroup.map (f : ℂ →+* ℂ)).comp ρ) ↔
      IsRigidRepresentation δ ρ := by
  sorry

/-- Rigid representations with finite-order determinant are defined over a number field. -/
theorem exists_numberField_of_rigid [Group.FG Γ] (δ : Γ →* ℂˣ) (hδ : ∀ γ, IsOfFinOrder (δ γ))
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hdet : Matrix.GeneralLinearGroup.det.comp ρ = δ) (h : IsRigidRepresentation δ ρ) :
    ∃ L : IntermediateField ℚ ℂ, FiniteDimensional ℚ L ∧
      ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j,
        ((P * ρ γ * P⁻¹ : Matrix.GeneralLinearGroup (Fin r) ℂ) :
          Matrix (Fin r) (Fin r) ℂ) i j ∈ L := by
  sorry

end Rigidity

/-! ## Unitary, integral and strongly integral representations -/

section Integral

open NumberField
open scoped ComplexOrder

variable {Γ : Type} [Group Γ] {r : ℕ}

/-- Conjugate of a representation by `P`, as a matrix-valued function. -/
abbrev conjMatrix (P : Matrix.GeneralLinearGroup (Fin r) ℂ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) (γ : Γ) : Matrix (Fin r) (Fin r) ℂ :=
  ((P * ρ γ * P⁻¹ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ)

/-- Unitary: the image has compact closure. -/
def IsUnitaryRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  IsCompact (closure (Set.range fun γ =>
    ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ)))

/-- Integral: conjugate into `GL_r(𝒪_K)` for a number field `K ⊂ ℂ` (entries in `K` and
integral over `ℤ`). The full ring of integers is required. -/
def IsIntegralRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  ∃ K : IntermediateField ℚ ℂ, FiniteDimensional ℚ K ∧
    ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j,
      conjMatrix P ρ γ i j ∈ K ∧ IsIntegral ℤ (conjMatrix P ρ γ i j)

/-- An integral realization of `ρ`: a number field, an `𝒪_K`-valued representation, a complex
embedding and a conjugator. (For a group scheme fixed over ℤ, use its base change to `𝒪_K`.) -/
structure IntegralRealization (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) where
  /-- the number field -/
  K : Type
  [field : Field K]
  [numberField : NumberField K]
  /-- the integral representation -/
  ρK : Γ →* Matrix.GeneralLinearGroup (Fin r) (𝓞 K)
  /-- the complex embedding -/
  ι : K →+* ℂ
  /-- the conjugator -/
  P : Matrix.GeneralLinearGroup (Fin r) ℂ
  /-- compatibility -/
  conj : ∀ γ, P * ρ γ * P⁻¹ = Matrix.GeneralLinearGroup.map (ι.comp (algebraMap (𝓞 K) K)) (ρK γ)

/-- Strongly integral: conjugate into `GL_r(ℤ)`. -/
def IsStronglyIntegral (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j, ∃ n : ℤ, conjMatrix P ρ γ i j = n

namespace IsUnitaryRepresentation

variable (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)

theorem iff_conj_unitaryGroup : IsUnitaryRepresentation ρ ↔
    ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ,
      conjMatrix P ρ γ ∈ Matrix.unitaryGroup (Fin r) ℂ := by
  sorry

theorem iff_invariant_form : IsUnitaryRepresentation ρ ↔
    ∃ H : Matrix (Fin r) (Fin r) ℂ, Matrix.PosDef H ∧ ∀ γ,
      ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ).conjTranspose * H *
        ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ) = H := by
  sorry

theorem semisimple (h : IsUnitaryRepresentation ρ)
    (W : Submodule ℂ (Fin r → ℂ)) (hW : ∀ γ, W.map (matrixRepresentation ρ γ) ≤ W) :
    ∃ W' : Submodule ℂ (Fin r → ℂ), IsCompl W W' ∧
      ∀ γ, W'.map (matrixRepresentation ρ γ) ≤ W' := by
  sorry

theorem of_finite (h : (Set.range ρ).Finite) : IsUnitaryRepresentation ρ := by
  sorry

theorem comp {Γ' : Type} [Group Γ'] (f : Γ' →* Γ) (h : IsUnitaryRepresentation ρ) :
    IsUnitaryRepresentation (ρ.comp f) := by
  sorry

theorem not_aut_invariant : ∃ (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (f : ℂ ≃+* ℂ), IsUnitaryRepresentation ρ ∧
      ¬ IsUnitaryRepresentation ((Matrix.GeneralLinearGroup.map (f : ℂ →+* ℂ)).comp ρ) := by
  sorry

-- IsUnitaryRepresentation.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) ℂ) :
    IsUnitaryRepresentation ρ ↔ ∀ γ, ‖(ρ γ : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0‖ = 1 := by
  sorry

-- IsUnitaryRepresentation.test_unipotent
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (h : ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 2) ℂ) :
      Matrix (Fin 2) (Fin 2) ℂ) = !![1, 1; 0, 1]) :
    ¬ IsUnitaryRepresentation ρ := by
  sorry

-- IsUnitaryRepresentation.test_finite_image
example [Finite Γ] : IsUnitaryRepresentation ρ := by
  sorry

-- IsUnitaryRepresentation.test_unitaryGroup_valued
example (h : ∀ γ, ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ) ∈
    Matrix.unitaryGroup (Fin r) ℂ) : IsUnitaryRepresentation ρ := by
  sorry

-- IsUnitaryRepresentation.test_galois_nonexample
example (α : ℂˣ) (h₁ : (α : ℂ) ^ 4 - (α : ℂ) ^ 3 - (α : ℂ) ^ 2 - (α : ℂ) + 1 = 0)
    (h₂ : ‖(α : ℂ)‖ = 1) :
    ∃ f : ℂ ≃+* ℂ, ‖f (α : ℂ)‖ ≠ 1 := by
  sorry

end IsUnitaryRepresentation

namespace IsIntegralRepresentation

variable (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)

theorem iff_algebraicIntegers [Group.FG Γ] : IsIntegralRepresentation ρ ↔
    ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j, IsIntegral ℤ (conjMatrix P ρ γ i j) := by
  sorry

theorem of_finite (h : (Set.range ρ).Finite) : IsIntegralRepresentation ρ := by
  sorry

theorem charpoly (h : IsIntegralRepresentation ρ) (γ : Γ) (k : ℕ) :
    IsIntegral ℤ ((((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) :
      Matrix (Fin r) (Fin r) ℂ).charpoly).coeff k) := by
  sorry

theorem conj_aut (f : ℂ ≃+* ℂ) :
    IsIntegralRepresentation ((Matrix.GeneralLinearGroup.map (f : ℂ →+* ℂ)).comp ρ) ↔
      IsIntegralRepresentation ρ := by
  sorry

theorem of_realization (R : IntegralRealization ρ) : IsIntegralRepresentation ρ := by
  sorry

-- IsIntegralRepresentation.test_trivial
example : IsIntegralRepresentation (1 : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) := by
  sorry

-- IsIntegralRepresentation.test_half_not_integral
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0 = 1 / 2) :
    ¬ IsIntegralRepresentation ρ := by
  sorry

-- IsIntegralRepresentation.test_S_integral_not_integral
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0 = 2) :
    ¬ IsIntegralRepresentation ρ := by
  sorry

-- IsIntegralRepresentation.test_unipotent
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (h : ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 2) ℂ) :
      Matrix (Fin 2) (Fin 2) ℂ) = !![1, 1 / 3; 0, 1]) :
    IsIntegralRepresentation ρ := by
  sorry

-- IsIntegralRepresentation.test_compat_ringOfIntegers
example (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    (h : ∀ γ i j, (ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) i j ∈ K ∧
      IsIntegral ℤ ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) i j)) :
    IsIntegralRepresentation ρ := by
  sorry

end IsIntegralRepresentation

namespace IsStronglyIntegral

variable (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)

theorem isIntegral (h : IsStronglyIntegral ρ) : IsIntegralRepresentation ρ := by
  sorry

theorem iff_lattice : IsStronglyIntegral ρ ↔
    ∃ Λ : Submodule ℤ (Fin r → ℂ), (∃ b : Module.Basis (Fin r) ℤ Λ,
      LinearIndependent ℂ (fun i => (b i : Fin r → ℂ))) ∧
      ∀ γ, Λ.map ((matrixRepresentation ρ γ).restrictScalars ℤ) ≤ Λ := by
  sorry

/-- Strong integrality and unitarity force finite image. -/
theorem unitary_finite (h₁ : IsStronglyIntegral ρ) (h₂ : IsUnitaryRepresentation ρ) :
    (Set.range ρ).Finite := by
  sorry

-- IsStronglyIntegral.test_gl_n_Z
example (h : ∀ γ i j, ∃ n : ℤ, (ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) i j = n) :
    IsStronglyIntegral ρ := by
  sorry

-- IsStronglyIntegral.test_implies_integral
example (h : IsStronglyIntegral ρ) : IsIntegralRepresentation ρ := by
  sorry

end IsStronglyIntegral

/-- Integral representations unitary at every complex embedding have finite image
(Landesman–Litt 2022, Lemma 7.2.1). -/
theorem unitary_embeddings_finite {K : Type} [Field K] [NumberField K] {m : ℕ}
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin m) (𝓞 K))
    (h : ∀ ι : K →+* ℂ, IsUnitaryRepresentation
      ((Matrix.GeneralLinearGroup.map (ι.comp (algebraMap (𝓞 K) K))).comp ρ)) :
    (Set.range ρ).Finite := by
  sorry

/-- The rank-one character `n ↦ αⁿ` of `ℤ`; pulled back along `π₁(Σ) → ℤ` it is the character of
Esnault–Groechenig's Example 6.3. -/
def SalemCharacter (α : ℂˣ) : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ :=
  (Matrix.GeneralLinearGroup.scalar (Fin 1)).comp (zpowersHom ℂˣ α)

namespace SalemCharacter

variable (α : ℂˣ)

theorem isUnitary (h : ‖(α : ℂ)‖ = 1) : IsUnitaryRepresentation (SalemCharacter α) := by
  sorry

theorem isIntegral (h : IsIntegral ℤ (α : ℂ)) (h' : IsIntegral ℤ ((α⁻¹ : ℂˣ) : ℂ)) :
    IsIntegralRepresentation (SalemCharacter α) := by
  sorry

theorem infinite_range (h : ∀ n : ℕ, 0 < n → (α : ℂ) ^ n ≠ 1) :
    (Set.range (SalemCharacter α)).Infinite := by
  sorry

theorem not_strongly_integral (h : ∀ n : ℕ, 0 < n → (α : ℂ) ^ n ≠ 1) :
    ¬ IsStronglyIntegral (SalemCharacter α) := by
  sorry

theorem exists_nonunitary_conjugate (hint : IsIntegral ℤ (α : ℂ))
    (h : ∀ n : ℕ, 0 < n → (α : ℂ) ^ n ≠ 1) :
    ∃ f : ℂ ≃+* ℂ, ¬ IsUnitaryRepresentation
      ((Matrix.GeneralLinearGroup.map (f : ℂ →+* ℂ)).comp (SalemCharacter α)) := by
  sorry

-- SalemCharacter.test_unitary
example (h₁ : (α : ℂ) ^ 4 - (α : ℂ) ^ 3 - (α : ℂ) ^ 2 - (α : ℂ) + 1 = 0) (h₂ : ‖(α : ℂ)‖ = 1) :
    IsUnitaryRepresentation (SalemCharacter α) ∧ IsIntegralRepresentation (SalemCharacter α) := by
  sorry

-- SalemCharacter.test_infinite_image
example (h₁ : (α : ℂ) ^ 4 - (α : ℂ) ^ 3 - (α : ℂ) ^ 2 - (α : ℂ) + 1 = 0) (h₂ : ‖(α : ℂ)‖ = 1) :
    (Set.range (SalemCharacter α)).Infinite := by
  sorry

-- SalemCharacter.test_kronecker
example (K : Type) [Field K] [NumberField K] (x : K) (hx : IsIntegral ℤ x)
    (hroot : ∀ n : ℕ, 0 < n → x ^ n ≠ 1) : ∃ φ : K →+* ℂ, ‖φ x‖ ≠ 1 := by
  sorry

-- SalemCharacter.test_gaussian_not_integral
example : ‖((3 + 4 * Complex.I) / 5 : ℂ)‖ = 1 ∧ (∀ n : ℕ, 0 < n → ((3 + 4 * Complex.I) / 5 : ℂ) ^ n ≠ 1) ∧
    ¬ IsIntegral ℤ ((3 + 4 * Complex.I) / 5 : ℂ) := by
  sorry

-- IsStronglyIntegral.test_salem_not_strong
example (h₁ : (α : ℂ) ^ 4 - (α : ℂ) ^ 3 - (α : ℂ) ^ 2 - (α : ℂ) + 1 = 0) (h₂ : ‖(α : ℂ)‖ = 1) :
    IsIntegralRepresentation (SalemCharacter α) ∧ ¬ IsStronglyIntegral (SalemCharacter α) := by
  sorry

end SalemCharacter

end Integral

/-! ## Rigid loci of moduli schemes and arithmetic models -/

section RigidLocus

open AlgebraicGeometry

/-- The rigid locus of a morphism locally of finite type: Mathlib's quasi-finite locus
(Esnault–Groechenig, Definition 3.2). -/
abbrev RigidLocus {M S : Scheme.{0}} (f : M ⟶ S) [LocallyOfFiniteType f] : M.Opens :=
  f.quasiFiniteLocus

namespace RigidLocus

variable {M S : Scheme.{0}} (f : M ⟶ S) [LocallyOfFiniteType f]

theorem mem_iff_isolated (x : M) : x ∈ RigidLocus f ↔ IsOpen {f.asFiber x} := by
  sorry

instance locallyQuasiFinite : LocallyQuasiFinite ((RigidLocus f).ι ≫ f) := by
  sorry

theorem field_isClopen (K : Type) [Field K] (g : M ⟶ Spec (CommRingCat.of K))
    [LocallyOfFiniteType g] [QuasiCompact g] : IsClopen ((RigidLocus g : M.Opens) : Set M) := by
  sorry

theorem comp_openImmersion {M' : Scheme.{0}} (j : M' ⟶ M) [IsOpenImmersion j]
    [LocallyOfFiniteType (j ≫ f)] : RigidLocus (j ≫ f) = j ⁻¹ᵁ RigidLocus f := by
  sorry

theorem isFinite_of_isProper [IsSeparated f] [IsProper ((RigidLocus f).ι ≫ f)] :
    IsFinite ((RigidLocus f).ι ≫ f) := by
  sorry

theorem equivariant (a : M ≅ M) (b : S ≅ S) (h : a.hom ≫ f = f ≫ b.hom) :
    a.hom ⁻¹ᵁ RigidLocus f = RigidLocus f := by
  sorry

-- RigidLocus.test_fat_point (every finite morphism, e.g. `Spec ℂ[x]/(x²) → Spec ℂ`, is rigid)
example [IsFinite f] : RigidLocus f = ⊤ := by
  sorry

-- RigidLocus.test_affine_line
example [LocallyOfFiniteType (𝔸(Fin 1; Spec (CommRingCat.of ℂ)) ↘ Spec (CommRingCat.of ℂ))] :
    RigidLocus (𝔸(Fin 1; Spec (CommRingCat.of ℂ)) ↘ Spec (CommRingCat.of ℂ)) = ⊥ := by
  sorry

-- RigidLocus.test_compat_mathlib
example (x : M) : x ∈ RigidLocus f ↔ f.QuasiFiniteAt x := by
  sorry

end RigidLocus

/-- The part of an arithmetic model expressible with Mathlib's schemes: a finitely generated
subring `R ⊂ ℂ` smooth over `ℤ`, a smooth proper `X_S → Spec R` with geometrically connected fibres,
an identification over `Spec ℂ` of its base change along `Spec ℂ → Spec R` with `X`, and a spread
section compatible with the base point `x`. The torsion line bundle `L_S`, the isomorphism
`L_S^{⊗d} ≅ O`, invertibility of `d` and projectivity have no Mathlib carrier at the pinned commit
(omission inventory). -/
structure ArithmeticModel (X : Scheme.{0}) (f : X ⟶ Spec (CommRingCat.of ℂ))
    (x : Spec (CommRingCat.of ℂ) ⟶ X) where
  /-- the coefficient ring, a finitely generated subring of `ℂ` -/
  R : Subring ℂ
  fg : Algebra.FiniteType ℤ R
  smooth : Smooth (Spec.map (CommRingCat.ofHom (algebraMap ℤ R)))
  /-- the model -/
  XS : Scheme.{0}
  p : XS ⟶ Spec (CommRingCat.of R)
  smooth_p : Smooth p
  proper_p : IsProper p
  geomConnected_p : GeometricallyConnected p
  /-- the generic-fibre identification, over `Spec ℂ` -/
  genericFibreIso : Limits.pullback p (Spec.map (CommRingCat.ofHom R.subtype)) ≅ X
  genericFibreIso_over : genericFibreIso.hom ≫ f = Limits.pullback.snd _ _
  /-- the spread base point -/
  xS : Spec (CommRingCat.of R) ⟶ XS
  section_p : xS ≫ p = 𝟙 _
  basePoint : ∀ h : (Spec.map (CommRingCat.ofHom R.subtype) ≫ xS) ≫ p =
      𝟙 _ ≫ Spec.map (CommRingCat.ofHom R.subtype),
    Limits.pullback.lift _ _ h ≫ genericFibreIso.hom = x

namespace ArithmeticModel

variable {X : Scheme.{0}} {f : X ⟶ Spec (CommRingCat.of ℂ)} {x : Spec (CommRingCat.of ℂ) ⟶ X}

/-- Every smooth proper geometrically connected `X/ℂ` with a point has an arithmetic model. -/
theorem «exists» [Smooth f] [IsProper f] [GeometricallyConnected f] (hx : x ≫ f = 𝟙 _) :
    Nonempty (ArithmeticModel X f x) := by
  sorry

/-- Restriction of a model to `R[1/g]` for nonzero `g ∈ R` is again a model, with `X_S` replaced by
its base change. -/
theorem restrict (M : ArithmeticModel X f x) (g : M.R) (hg : g ≠ 0) :
    ∃ (M' : ArithmeticModel X f x) (h : M.R ≤ M'.R),
      (M'.R : Set ℂ) = Subring.closure (insert ((g : ℂ)⁻¹) (M.R : Set ℂ)) ∧
        Nonempty (M'.XS ≅ Limits.pullback M.p
          (Spec.map (CommRingCat.ofHom (Subring.inclusion h)))) := by
  sorry

-- ArithmeticModel.test_generic_fibre
example (M : ArithmeticModel X f x) :
    Smooth f ∧ IsProper f ∧ M.genericFibreIso.hom ≫ f = Limits.pullback.snd _ _ := by
  sorry

end ArithmeticModel

end RigidLocus

/-! ## Systems of Hodge bundles: coordinate model

A chart model: `E` an `R`-module with an internal `ℤ`-grading by submodules `Ep p` and
`θ : E → E ⊗ Ω` of degree `-1`, with `Ω` finite free as on a cotangent chart.
This hypothesis makes commuting contractions equivalent to exterior-square integrability.
For a torsion module `Ω` over `ℤ`, its dual can vanish and contractions cannot detect curvature.
The sheaf version on a complex manifold is in the omission inventory. -/

section HodgeBundles

open TensorProduct

/-- The component of a Higgs field `θ : E → E ⊗ Ω` along a covector `v` of `Ω`. -/
def higgsComponent {R : Type} [CommRing R] {Ω E : Type} [AddCommGroup Ω] [Module R Ω]
    [AddCommGroup E] [Module R E] (θ : E →ₗ[R] E ⊗[R] Ω) (v : Module.Dual R Ω) : E →ₗ[R] E :=
  (TensorProduct.rid R E).toLinearMap ∘ₗ TensorProduct.map LinearMap.id v ∘ₗ θ

/-- A system of Hodge bundles in a coordinate chart. -/
structure SystemOfHodgeBundles (R : Type) [CommRing R] (Ω E : Type) [AddCommGroup Ω] [Module R Ω]
    [Module.Free R Ω] [Module.Finite R Ω] [AddCommGroup E] [Module R E] where
  /-- the Hodge pieces -/
  Ep : ℤ → Submodule R E
  /-- the decomposition is internal -/
  isInternal : DirectSum.IsInternal Ep
  /-- finitely many nonzero pieces -/
  finite_support : {p : ℤ | Ep p ≠ ⊥}.Finite
  /-- the Higgs field -/
  θ : E →ₗ[R] E ⊗[R] Ω
  /-- degree `-1` -/
  lowers : ∀ p, ∀ e ∈ Ep p, θ e ∈ LinearMap.range (TensorProduct.map (Ep (p - 1)).subtype
    (LinearMap.id : Ω →ₗ[R] Ω))
  /-- integrability `θ ∧ θ = 0`, in the chart form: the components of `θ` commute -/
  integrable : ∀ v w : Module.Dual R Ω,
    higgsComponent θ v ∘ₗ higgsComponent θ w = higgsComponent θ w ∘ₗ higgsComponent θ v

namespace SystemOfHodgeBundles

variable {R : Type} [CommRing R] {Ω E : Type} [AddCommGroup Ω] [Module R Ω]
  [Module.Free R Ω] [Module.Finite R Ω] [AddCommGroup E] [Module R E]
  (H : SystemOfHodgeBundles R Ω E)

/-- The component of `θ` along a covector `v` of `Ω`. -/
def contract (v : Module.Dual R Ω) : E →ₗ[R] E :=
  higgsComponent H.θ v

/-- Multiplication by `t ^ p` on `Ep p` is an isomorphism from `(E, t θ)` to `(E, θ)`. -/
theorem scaleIso (t : Rˣ) : ∃ φ : E ≃ₗ[R] E, (∀ p, ∀ e ∈ H.Ep p, φ e = ((t ^ p : Rˣ) : R) • e) ∧
    ∀ e, TensorProduct.map φ.toLinearMap (LinearMap.id : Ω →ₗ[R] Ω) ((t : R) • H.θ e) =
      H.θ (φ e) := by
  sorry

/-- The shift of the grading. -/
def shift (k : ℤ) : SystemOfHodgeBundles R Ω E where
  Ep p := H.Ep (p + k)
  isInternal := by sorry
  finite_support := by sorry
  θ := H.θ
  lowers := by sorry
  integrable := H.integrable

/-- Joint nilpotence: any product of `N` components of `θ` vanishes once `N` exceeds the number of
nonzero degrees. -/
theorem nilpotent (N : ℕ) (hN : H.finite_support.toFinset.card ≤ N)
    (v : Fin N → Module.Dual R Ω) : (List.ofFn fun i => H.contract (v i)).prod = 0 := by
  sorry

theorem trace_eq_zero [Module.Free R E] [Module.Finite R E] (v : Module.Dual R Ω) :
    LinearMap.trace R E (H.contract v) = 0 := by
  sorry

-- SystemOfHodgeBundles.test_single_degree
example (h : ∀ p, p ≠ 0 → H.Ep p = ⊥) : H.θ = 0 := by
  sorry

-- SystemOfHodgeBundles.test_scale_iso
example (t : Rˣ) (h : ∀ p, p ≠ 0 → p ≠ 1 → H.Ep p = ⊥) :
    ∃ φ : E ≃ₗ[R] E, (∀ e ∈ H.Ep 1, φ e = (t : R) • e) ∧ (∀ e ∈ H.Ep 0, φ e = e) ∧
      ∀ e, TensorProduct.map φ.toLinearMap (LinearMap.id : Ω →ₗ[R] Ω) ((t : R) • H.θ e) =
        H.θ (φ e) := by
  sorry

-- SystemOfHodgeBundles.test_trace_zero
example [Module.Free R E] [Module.Finite R E] (v : Module.Dual R Ω) :
    LinearMap.trace R E (H.contract v) = 0 ∧
      (List.ofFn fun _ : Fin H.finite_support.toFinset.card => H.contract v).prod = 0 := by
  sorry

end SystemOfHodgeBundles

-- SystemOfHodgeBundles.test_nonnilpotent_not_hodge
example : ¬ ∃ H : SystemOfHodgeBundles ℚ ℚ (Fin 2 → ℚ),
    H.θ = (TensorProduct.rid ℚ (Fin 2 → ℚ)).symm.toLinearMap ∘ₗ
      Matrix.toLin' !![(1 : ℚ), 0; 0, -1] := by
  sorry

end HodgeBundles

/-! ## Fibrewise vanishing of `H¹` -/

section Fibrewise

variable {k G : Type} [CommRing k] [Group G]

/-- If `A^S = 0`, restriction `H¹(G, A) → H¹(S, A)` is injective (inflation–restriction). -/
theorem restriction_injective (A : Rep k G) (S : Subgroup G) [S.Normal]
    (hinv : ∀ a : A, (∀ s : S, A.ρ s a = a) → a = 0) :
    Function.Injective (groupCohomology.map S.subtype (𝟙 _) 1 (A := A)).hom := by
  sorry

/-- If `A^S = 0` and the `G/S`-invariant classes in `H¹(S, A)` vanish, then `H¹(G, A) = 0`.
A class of the cocycle `c` is `G`-invariant when, for every `g`, the conjugate cocycle
`s ↦ g⁻¹ · c(g s g⁻¹)` differs from `c` by a coboundary. -/
theorem fibrewise_h1_vanishing (A : Rep k G) (S : Subgroup G) [S.Normal]
    (hinv : ∀ a : A, (∀ s : S, A.ρ s a = a) → a = 0)
    (hinvH1 : ∀ c : S → A, c ∈ groupCohomology.cocycles₁ (Rep.res S.subtype A) →
      (∀ g : G, ((fun s : S => A.ρ g⁻¹ (c ⟨g * s * g⁻¹, ‹S.Normal›.conj_mem _ s.2 g⟩)) - c) ∈
        groupCohomology.coboundaries₁ (Rep.res S.subtype A)) →
      c ∈ groupCohomology.coboundaries₁ (Rep.res S.subtype A)) :
    Subsingleton (groupCohomology A 1) := by
  sorry

end Fibrewise

end TauCeti.NonabelianHodge

/-!
## Index of native names

Names below are relative to `TauCeti.NonabelianHodge`. A test name denotes the preceding
named comment on an `example`. Promoted API nodes reuse the existing signature; there is
one declaration, not a duplicate implementation. Partial carriers remain partial.

HodgeStructuresPartII:H.5/trace-free-adjoint:
  TraceFreeAdjoint.rep, TraceFreeAdjoint.rep_apply, TraceFreeAdjoint.endSplitting,
  TraceFreeAdjoint.conjEquiv, TraceFreeAdjoint.twist, TraceFreeAdjoint.projectivization,
  TraceFreeAdjoint.invariants_eq_bot, TraceFreeAdjoint.baseChange_apply,
  TraceFreeAdjoint.baseChange_H1, TraceFreeAdjoint.test_rank_one,
  TraceFreeAdjoint.test_trivial_free_abelian, TraceFreeAdjoint.test_full_adjoint_differs,
  TraceFreeAdjoint.test_char_two_no_splitting, TraceFreeAdjoint.test_irreducible_no_invariants.
HodgeStructuresPartII:H.5/rigid-representation:
  IsRigidRepresentation, IsRigidRepresentation.conj, IsRigidRepresentation.twist,
  IsRigidRepresentation.of_cohomologicallyRigid, IsRigidRepresentation.rankOne,
  IsRigidRepresentation.test_rank_one, IsRigidRepresentation.test_free_group,
  IsRigidRepresentation.test_unfixed_determinant, IsRigidRepresentation.test_finite_group,
  IsRigidRepresentation.test_reducible_excluded.
HodgeStructuresPartII:H.5/projective-rigidity:
  IsAbsolutelyIrreducible, IsAbsolutelyIrreducible.iff_algebraicClosure,
  ProjectiveRepresentation.test_rotation_not_absolutely_irreducible.
HodgeStructuresPartII:H.5/cohomological-rigidity:
  IsCohomologicallyRigid, IsCohomologicallyRigid.of_strong, IsCohomologicallyRigid.projective_iff,
  IsCohomologicallyRigid.conj_aut, IsCohomologicallyRigid.test_rank_one,
  IsCohomologicallyRigid.test_hypergeometric, IsCohomologicallyRigid.test_not_strong,
  IsCohomologicallyRigid.test_projective_groupCohomology.
HodgeStructuresPartII:H.5/strong-cohomological-rigidity:
  IsStronglyCohomologicallyRigid, IsStronglyCohomologicallyRigid.isCohomologicallyRigid,
  IsStronglyCohomologicallyRigid.of_finiteCover, IsStronglyCohomologicallyRigid.conj_aut,
  IsStronglyCohomologicallyRigid.of_groupCohomology, IsStronglyCohomologicallyRigid.test_projective,
  IsStronglyCohomologicallyRigid.test_rank_one, IsStronglyCohomologicallyRigid.test_hypergeometric,
  IsStronglyCohomologicallyRigid.test_free_group.
HodgeStructuresPartII:H.5/strong-implies-cohomological:
  IsStronglyCohomologicallyRigid.isCohomologicallyRigid.
HodgeStructuresPartII:H.5/rigid-locus:
  RigidLocus, RigidLocus.mem_iff_isolated, RigidLocus.locallyQuasiFinite, RigidLocus.field_isClopen,
  RigidLocus.comp_openImmersion, RigidLocus.isFinite_of_isProper, RigidLocus.equivariant,
  RigidLocus.test_fat_point, RigidLocus.test_affine_line, RigidLocus.test_compat_mathlib.
HodgeStructuresPartII:H.5/rigidity-conjugate:
  rigidity_conj_aut.
HodgeStructuresPartII:H.5/rigid-number-field:
  exists_numberField_of_rigid.
HodgeStructuresPartII:H.5/boundary-monodromy-data:
  IsQuasiUnipotentAtInfinity, IsQuasiUnipotentAtInfinity.iff_eigenvalues,
  IsQuasiUnipotentAtInfinity.conj_aut, BoundaryMonodromyData.test_projective_vacuous,
  BoundaryMonodromyData.test_Gm_root_of_unity, BoundaryMonodromyData.test_Gm_not_quasiUnipotent,
  BoundaryMonodromyData.test_unipotent_infinite_order.
HodgeStructuresPartII:H.5/system-of-hodge-bundles:
  SystemOfHodgeBundles, SystemOfHodgeBundles.contract, SystemOfHodgeBundles.scaleIso,
  SystemOfHodgeBundles.shift, SystemOfHodgeBundles.nilpotent, SystemOfHodgeBundles.trace_eq_zero,
  SystemOfHodgeBundles.test_single_degree, SystemOfHodgeBundles.test_trace_zero,
  SystemOfHodgeBundles.test_nonnilpotent_not_hodge, SystemOfHodgeBundles.test_scale_iso.
HodgeStructuresPartII:H.5/unitary-representation:
  IsUnitaryRepresentation, IsUnitaryRepresentation.iff_conj_unitaryGroup,
  IsUnitaryRepresentation.iff_invariant_form, IsUnitaryRepresentation.semisimple,
  IsUnitaryRepresentation.of_finite, IsUnitaryRepresentation.comp,
  IsUnitaryRepresentation.not_aut_invariant, IsUnitaryRepresentation.test_rank_one,
  IsUnitaryRepresentation.test_unipotent, IsUnitaryRepresentation.test_finite_image,
  IsUnitaryRepresentation.test_unitaryGroup_valued, IsUnitaryRepresentation.test_galois_nonexample.
HodgeStructuresPartII:H.5/smooth-arithmetic-model:
  ArithmeticModel, ArithmeticModel.exists, ArithmeticModel.restrict,
  ArithmeticModel.genericFibreIso, ArithmeticModel.test_generic_fibre.
HodgeStructuresPartII:H.5/integral-representation:
  IsIntegralRepresentation, IntegralRealization, IsIntegralRepresentation.iff_algebraicIntegers,
  IsIntegralRepresentation.of_finite, IsIntegralRepresentation.charpoly,
  IsIntegralRepresentation.conj_aut, IsIntegralRepresentation.of_realization,
  IsIntegralRepresentation.test_trivial, IsIntegralRepresentation.test_half_not_integral,
  IsIntegralRepresentation.test_S_integral_not_integral, IsIntegralRepresentation.test_unipotent,
  IsIntegralRepresentation.test_compat_ringOfIntegers.
HodgeStructuresPartII:H.5/strongly-integral:
  IsStronglyIntegral, IsStronglyIntegral.iff_lattice, IsStronglyIntegral.isIntegral,
  IsStronglyIntegral.unitary_finite, IsStronglyIntegral.test_gl_n_Z,
  IsStronglyIntegral.test_salem_not_strong, IsStronglyIntegral.test_implies_integral.
HodgeStructuresPartII:H.5/strong-integral-unitary-finite:
  IsStronglyIntegral.unitary_finite.
HodgeStructuresPartII:H.5/unitary-embeddings-finite:
  unitary_embeddings_finite.
HodgeStructuresPartII:H.5/infinite-image-unitary-example:
  SalemCharacter, SalemCharacter.isUnitary, SalemCharacter.isIntegral,
  SalemCharacter.infinite_range, SalemCharacter.not_strongly_integral,
  SalemCharacter.exists_nonunitary_conjugate, SalemCharacter.test_unitary,
  SalemCharacter.test_infinite_image, SalemCharacter.test_kronecker,
  SalemCharacter.test_gaussian_not_integral.
HodgeStructuresPartII:H.5/fibrewise-h1-vanishing:
  fibrewise_h1_vanishing.
HodgeStructuresPartII:H.5/trace-splitting:
  TraceFreeAdjoint.endSplitting.
HodgeStructuresPartII:H.5/adjoint-projectivization:
  TraceFreeAdjoint.projectivization.
HodgeStructuresPartII:H.5/adjoint-no-invariants:
  TraceFreeAdjoint.invariants_eq_bot.
HodgeStructuresPartII:H.5/adjoint-h1-base-change:
  TraceFreeAdjoint.baseChange_H1.
HodgeStructuresPartII:H.5/rigid-locus-field-clopen:
  RigidLocus.field_isClopen.
HodgeStructuresPartII:H.5/rigid-locus-equivariant:
  RigidLocus.equivariant.
HodgeStructuresPartII:H.5/hodge-system-scaling:
  SystemOfHodgeBundles.scaleIso.
HodgeStructuresPartII:H.5/hodge-system-nilpotent:
  SystemOfHodgeBundles.nilpotent.
HodgeStructuresPartII:H.5/unitary-conjugation:
  IsUnitaryRepresentation.iff_conj_unitaryGroup.
HodgeStructuresPartII:H.5/unitary-invariant-form:
  IsUnitaryRepresentation.iff_invariant_form.
HodgeStructuresPartII:H.5/unitary-semisimple:
  IsUnitaryRepresentation.semisimple.
-/

/-!
## Omission inventory

These are mathematical specifications without Lean signatures. Their geometric carriers
remain missing at the pinned baseline. Native special cases do not supply these omitted
parts. Every entry comes from the corrected packet, including the promoted API facts.

Node HodgeStructuresPartII:H.5/trace-free-adjoint
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  TraceFreeAdjoint.flatBundle: For a flat bundle (E,∇) on a connected complex manifold with
    monodromy ρ at x, the local system of horizontal sections of End⁰(E,∇) has monodromy
    representation rep ρ, under TauCeti.LocalCoefficientSystem.monodromyRepresentation.
  TraceFreeAdjoint.baseChange: For a field embedding σ: K → L, rep (σ ∘ ρ) ≅ (rep ρ) ⊗_{K,σ} L,
    compatibly with the matrix entries.

Node HodgeStructuresPartII:H.5/betti-tangent
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  tangentSpace_eq_H1: Let K be a field of characteristic zero, Γ a finitely generated group, G a
    split connected reductive group over K with maximal abelian quotient A, θ: Γ → A(K) a
    homomorphism, γ_1,…,γ_N ∈ Γ and K_1,…,K_N ⊂ G locally closed conjugacy classes defined over K.
    Let M = M(Γ, θ, (γ_i, K_i)) be the finite-type stack of G-irreducible representations with
    abelianization θ and ρ(γ_i) ∈ K_i (HodgeStructuresPartII:H.5/prescribed-monodromy-moduli). For a
    G-irreducible ρ₀: Γ → G(K) in M(K), the Zariski tangent space of M at [ρ₀] is the kernel of the
    restriction map H¹(Γ, g^der) → ⊕_{i=1}^{N} H¹(γ_i^ℤ, g^der), with coefficients ad⁰ρ₀. In
    particular, for G = GL_r, θ = δ the determinant and N = 0: the representation scheme R_B(Γ, r,
    δ) has tangent space Z¹(Γ, ad⁰ρ) at ρ, and for absolutely irreducible ρ the stable fixed-
    determinant Betti moduli has Zariski tangent space H¹(Γ, ad⁰ρ) at [ρ]; for K = ℂ and Γ finitely
    presented this is the coarse space M_B^s(Γ, r, δ) of HodgeStructuresPartII:H.1/betti-coarse, and
    for other K (a number field in the integrality applications) the moduli is the K-form
    constructed in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli. Since the automorphism
    group of a stable fixed-determinant object is the finite étale group μ_r in characteristic zero,
    the stack and its coarse space have the same tangent spaces at stable points.

Node HodgeStructuresPartII:H.5/rigid-representation
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  IsRigidRepresentation.iff_orbit_open: IsRigidRepresentation ρ ↔ the conjugation orbit of ρ is open
    in R_B(Γ, r, δ)(ℂ) with the analytic topology.
  IsRigidRepresentation.finite: For fixed Γ, r and δ there are finitely many rigid classes (proved
    in node HodgeStructuresPartII:H.5/rigid-finite and re-exported here).

Node HodgeStructuresPartII:H.5/projective-rigidity
  Missing carrier: projective linear groups PGL_r and projective representations.
  ProjectiveRepresentation.IsAbsolutelyIrreducible: Predicate on ρ̄: Γ → PGL_r(A): no invariant
    proper nonzero subspace after every embedding into an algebraically closed field.
  ProjectiveBettiModuli: The affine finite-type ℤ-scheme M_B(Γ, PGL_r) = Hom(Γ, PGL_r) // PGL_r for
    finitely generated Γ.
  ProjectiveRepresentation.IsRigid: Isolation of the point of an absolutely irreducible ρ̄ in the
    geometric fibre of M_B(Γ, PGL_r).
  ProjectiveRepresentation.isRigid_iff_fixedDet: For irreducible ρ over an algebraically closed
    field of characteristic zero, ρ is rigid in M_B^s(Γ, r, det ρ) iff its projectivization is rigid
    (Esnault–Groechenig Lemma 5.5).
  ProjectiveRepresentation.liftObstruction: The central extension 1 → μ_r → SL_r → PGL_r → 1
    attaches to ρ̄: Γ → PGL_r(Ω) a class o(ρ̄) ∈ H²(Γ, μ_r(Ω)); ρ̄ lifts to SL_r(Ω) iff o(ρ̄) = 0,
    and then the lifts with determinant 1 form a torsor under Hom(Γ, μ_r). Projective
    representations need not lift: the Klein four-group image of diag(1,−1) and [[0,1],[1,0]] in
    PGL_2(ℂ) does not lift to a homomorphism (ℤ/2)² → GL_2(ℂ).
  ProjectiveRepresentation.test_rank_one: For r = 1, PGL_1 is trivial, so M_B(Γ, PGL_1) is one point
    and the unique projective representation is rigid.
  ProjectiveRepresentation.test_twist_same_class: For ρ: Γ → GL_r(ℂ) and any character χ, the
    projectivizations of ρ and χ·ρ define the same point of M_B(Γ, PGL_r).
  ProjectiveRepresentation.test_fixedDet_comparison: For an irreducible ρ: Γ → GL_r(ℂ),
    IsRigidRepresentation ρ (with δ = det ρ) holds iff the projectivization of ρ is rigid in M_B(Γ,
    PGL_r) (Esnault–Groechenig Lemma 5.5).
  ProjectiveRepresentation.test_nontrivial_self_twist: For Q₈, let A=diag(i,−i), B=[[0,1],[−1,0]] in
    SL₂(ℂ), and let χ(A)=1, χ(B)=−1. The irreducible representation generated by A and B is
    conjugate by A to χ·ρ, while χ is nontrivial and χ²=1. All traces agree, so trace equality
    cannot imply χ=1.

Node HodgeStructuresPartII:H.5/cohomological-rigidity
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsCohomologicallyRigid.iff_tangent_eq_bot: For irreducible ρ with det ρ = δ and ρ(T_i) ∈ K_i:
    IsCohomologicallyRigid ρ ↔ the Zariski tangent space of M(π₁, r, δ, (T_i, K_i)) at [ρ] is zero.
  IsCohomologicallyRigid.isRigid: For irreducible ρ: cohomologically rigid implies rigid, and the
    moduli point is reduced (proved in HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated and re-
    exported here).
  IsCohomologicallyRigid.deRham_iff: If X is projective and (E,∇) is the algebraic flat connection
    of ρ, the predicate is H¹_dR(X, End⁰(E,∇)) = 0 (HodgeStructuresPartII:H.5/derham-betti-tangent).
  IsCohomologicallyRigid.intermediateExtension_iff: The predicate is H¹(X̄, j_{!*} ad⁰ρ) = 0
    (HodgeStructuresPartII:H.5/intermediate-extension-h1).
  IsCohomologicallyRigid.test_compact_curve_genus_two: If X is a compact curve of genus g ≥ 2 and ρ
    is irreducible of rank r ≥ 2, then dim H¹(X, End⁰V) = (2g − 2)(r² − 1) > 0, so ρ is not
    cohomologically rigid.

Node HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  isCohomologicallyRigid_iff_reduced_isolated: In the setting of
    HodgeStructuresPartII:H.5/prescribed-monodromy-moduli with G = GL_r and fixed determinant (in
    particular for the fixed-determinant moduli of a smooth projective X), an irreducible ρ is
    cohomologically rigid if and only if its point is an isolated reduced point of the coarse
    moduli, i.e. the local ring of the coarse moduli at [ρ] is the residue field. For a general
    split reductive G and G-irreducible ρ, cohomological rigidity implies that [ρ] is a reduced
    isolated point of the coarse moduli; the converse is asserted only for the stack, since a
    nontrivial finite stabiliser Z_G(ρ)/Z(G) can make the coarse local ring reduced while H¹ ≠ 0. In
    particular cohomological rigidity implies rigidity. Rigidity alone allows a non-reduced isolated
    point.

Node HodgeStructuresPartII:H.5/rigid-connection
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsRigidConnection: Predicate on a stable flat connection with determinant (L,∇_L): its point of
    M_dR^s(X, r, L) is isolated.
  IsRigidHiggs: Predicate on a stable trace-free Higgs bundle with determinant (L,0) on the
    vanishing-Chern-class component: its point of M_Dol^s(X, (L,0), r) is isolated.
  IsRigidConnection.iff_monodromy: (E,∇) is rigid iff its monodromy representation is rigid in
    M_B^s(π₁(X,x), r, δ_L) (Riemann–Hilbert, HodgeStructuresPartII:H.5/rigid-correspondence).
  IsRigidConnection.iff_higgs: (E,∇) is rigid iff the corresponding stable Higgs bundle is rigid
    (non-abelian Hodge, HodgeStructuresPartII:H.5/rigid-correspondence).
  IsRigidConnection.dual: The dual of a rigid connection with determinant L is rigid with
    determinant L⁻¹.
  IsRigidConnection.tensor_torsion: For a torsion line N with its canonical connection, (E,∇) ⊗
    (N,∇_N) is rigid with determinant L ⊗ N^r iff (E,∇) is rigid.
  IsRigidHiggs.scale: If (V,θ) is rigid then so is (V, tθ) for every t ∈ ℂ^×.
  IsCohomologicallyRigidConnection.iff_tangent: Cohomological rigidity of (E,∇) is H¹_dR(X,
    End⁰(E,∇)) = 0, and of (V,θ) the vanishing of the trace-free Dolbeault H¹.
  IsRigidConnection.test_rank_one: For r = 1 the fibre M_dR^s(X, 1, L) is the single reduced point
    (L,∇_L), which is rigid; likewise M_Dol^s(X, (L,0), 1) = {(L,0)}.
  IsRigidConnection.test_genus_two_curve: If X is a compact curve of genus g ≥ 2 and r ≥ 2, no
    stable flat connection of rank r with determinant (O_X, d) is rigid, since M_dR^s(X, r, O) is
    smooth of dimension 2(g − 1)(r² − 1).
  IsRigidConnection.test_flat_determinant_needed: On an elliptic curve X, the rank-one connections
    on the trivial bundle are d + a·dz with a ∈ ℂ; fixing only det E ≅ O leaves this one-parameter
    family, while fixing (O, d) leaves a point.
  IsRigidHiggs.test_trace_condition: For a nonzero holomorphic 1-form ω, the Higgs bundle (L, ω) has
    tr θ = ω ≠ 0 and is not a point of M_Dol(X, (L,0), 1).
  IsRigidHiggs.test_projective_space: For X = ℙⁿ (simply connected, H⁰(Sym^i Ω¹) = 0), M_dR^s(ℙⁿ, r,
    O) and M_Dol^s(ℙⁿ, (O,0), r) are empty for r ≥ 2 and a reduced point for r = 1.

Node HodgeStructuresPartII:H.5/derham-betti-tangent
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  deRham_betti_tangent_iso: Let X be smooth connected projective over ℂ, (E,∇) a stable flat
    connection with determinant (L,∇_L), monodromy ρ at x, and (V,θ) the corresponding stable Higgs
    bundle under HodgeStructuresPartII:H.1/harmonic-correspondence. Then there are natural
    isomorphisms H¹_dR(X, End⁰(E,∇)) ≅ H¹(X^an, End⁰(E^∇)) ≅ H¹(π₁(X^an, x), ad⁰ρ) and an
    isomorphism of the latter with the first hypercohomology of the trace-free Higgs complex
    (End⁰(V), [θ,−]). These are the Zariski tangent spaces of M_dR^s(X,r,L), M_B^s(π₁, r, δ) and
    M_Dol^s(X,(L,0),r) at the corresponding points. More precisely (Simpson, Moduli II, Proposition
    10.5 and Theorem 10.6), the formal completions of the three moduli at points corresponding to
    the same harmonic bundle are canonically isomorphic, each being the completion at 0 of a
    quadratic cone in this H¹ (modulo the scalar stabilizer, which acts trivially at stable points);
    the analytic Riemann–Hilbert isomorphism of HodgeStructuresPartII:H.1/riemann-hilbert-coarse
    induces an isomorphism of the de Rham and Betti tangent spaces. In particular the three
    cohomological rigidity conditions coincide.

Node HodgeStructuresPartII:H.5/rigid-correspondence
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  rigid_correspondence: Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. The
    Riemann–Hilbert analytic isomorphism M_dR^s(X,r,L)^an ≅ M_B^s(π₁(X,x), r, δ_L)^an
    (HodgeStructuresPartII:H.1/riemann-hilbert-coarse) and the non-abelian Hodge homeomorphism
    M_dR^s(X,r,L) ≅ M_Dol^s(X,(L,0),r) (HodgeStructuresPartII:H.1/nonabelian-hodge-topology)
    restrict to bijections M^rig_B(ℂ) ≅ M^rig_dR(ℂ) ≅ M^rig_Dol(ℂ) between the finite sets of rigid
    points (HodgeStructuresPartII:H.5/rigid-locus). The Riemann–Hilbert bijection preserves the
    local rings; by Simpson's isosingularity theorem the formal completions of M_dR^s and M_Dol^s at
    corresponding points are isomorphic, so the non-abelian Hodge bijection of rigid points also
    preserves the (Artinian) local rings, hence lengths and cohomological rigidity
    (HodgeStructuresPartII:H.5/derham-betti-tangent). Consequently the numbers of rigid connections,
    rigid representations and rigid stable Higgs bundles of rank r and determinant L are equal.

Node HodgeStructuresPartII:H.5/rigid-locus
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  RigidLocus.fibre: For s ∈ S, the fibre of RigidLocus f over s is the rigid locus of the fibre M_s
    → Spec κ(s), i.e. the isolated points of M_s.
  RigidLocus.test_line_and_point: For M = Spec ℂ[x,y]/(y(y − 1), xy) → Spec ℂ (the line y = 0 and
    the point (0,1)), the rigid locus is the point (0,1).
  RigidLocus.test_relative_open_not_closed: For f: Spec ℤ[x]/(px) → Spec ℤ, the rigid locus is the
    open subscheme Spec ℤ[1/p] (x = 0 away from p); it does not meet the fibre 𝔸¹_{𝔽_p}.

Node HodgeStructuresPartII:H.5/rigid-finite
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  rigidLocus_finite: Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. The rigid
    loci M^rig_B(π₁(X), r, δ_L), M^rig_dR(X, r, L) and M^rig_Dol(X, (L,0), r) are finite ℂ-schemes;
    there are finitely many isomorphism classes of rigid flat connections, rigid representations and
    rigid stable Higgs bundles of rank ≤ r with determinant L. More generally, for a finitely
    generated Γ and prescribed data as in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli, the
    moduli has finitely many isolated points, and for r, d, h fixed the set S(r, d, h) of
    irreducible cohomologically rigid local systems on a smooth quasi-projective X of rank r,
    determinant of order dividing d and quasi-unipotent local monodromies whose eigenvalues have
    order dividing h is finite.

Node HodgeStructuresPartII:H.5/boundary-monodromy-data
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  GoodCompactification: Data (X̄, j, D) with X̄ smooth projective, j an open immersion with image X,
    and D = X̄ ∖ X a strict normal crossings divisor with components D_i.
  GoodCompactification.localMonodromy: For each component D_i, the conjugacy class in π₁(X, x) of
    the loop T_i around D_i.
  GoodCompactification.localMonodromy_conj: Different choices of y_i, Δ_i, x_i and path give
    conjugate loops; the orientation convention removes the inversion ambiguity (Esnault–Groechenig
    2018 leave the sign open).
  IsQuasiUnipotentAtInfinity.of_geometricOrigin: Local systems of geometric origin have quasi-
    unipotent local monodromy (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).
  GoodCompactification.exists: Every smooth quasi-projective complex variety has a good
    compactification (AlgebraicModuliForArithmeticGeometry:R09.7d).

Node HodgeStructuresPartII:H.5/prescribed-monodromy-moduli
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  PrescribedMonodromyModuli: The algebraic stack of finite type over K attached to (Γ, r, χ_L, (γ_i,
    K_i)).
  PrescribedMonodromyModuli.coarse: Its μ_r-rigidification, an algebraic space of finite type over K
    that is a coarse moduli space.
  PrescribedMonodromyModuli.points: For an algebraically closed Ω ⊃ K, the Ω-points of the coarse
    space are the isomorphism classes of irreducible ρ: Γ → GL_r(Ω) with det ρ = χ_L and ρ(γ_i) ∈
    K_i(Ω).
  PrescribedMonodromyModuli.automorphisms: Every object has automorphism group μ_r.
  PrescribedMonodromyModuli.irreducible_open: The geometrically irreducible locus is open in the
    stack of all representations with determinant L.
  PrescribedMonodromyModuli.finite_isolated: The coarse space has finitely many isolated points (the
    rigid local systems with this data).
  PrescribedMonodromyModuli.baseChange: Formation commutes with field extension; σ ∈ Aut(ℂ/K) acts
    on its ℂ-points by ρ ↦ σ∘ρ.
  PrescribedMonodromyModuli.reductive: For split connected reductive G, the stack of G-irreducible
    representations with abelianization θ and ρ(γ_i) ∈ K_i is algebraic of finite type
    (Klevdal–Patrikis Proposition 4.4).
  PrescribedMonodromyModuli.test_no_boundary: With N = 0 and K = ℂ, the coarse space of M(Γ, r, L)
    is M_B^s(Γ, r, δ_L) of HodgeStructuresPartII:H.1/betti-coarse.
  PrescribedMonodromyModuli.test_rank_one: For r = 1, M(Γ, 1, L, ∅) is a single point with trivial
    automorphism group: the only object is the character χ_L itself.
  PrescribedMonodromyModuli.test_free_group_dimension: For Γ = F_2 free, r = 2, L trivial and N = 0,
    the coarse space is irreducible of dimension 3 and has no isolated point.
  PrescribedMonodromyModuli.test_locally_closed: Prescribing K_1 = the conjugacy class of
    [[1,1],[0,1]] at γ_1 gives a locally closed but not closed condition: its closure in GL_2
    contains the identity, which is not in K_1.

Node HodgeStructuresPartII:H.5/prescribed-monodromy-tangent
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  PrescribedMonodromyModuli.tangent_eq: In the setting of HodgeStructuresPartII:H.5/prescribed-
    monodromy-moduli with Γ = π₁(X, x), X smooth connected quasi-projective with good
    compactification and γ_i = T_i, let V be a geometrically irreducible K-local system in M(K) with
    monodromy ρ. The Zariski tangent space of M at [V] is H¹(U, a_* End⁰(V)), where a: X → U = X̄ ∖
    D_sing; equivalently it is the kernel of the restriction map H¹(π₁(X, x), ad⁰ρ) → ⊕_{i=1}^{N}
    H¹(⟨T_i⟩, ad⁰ρ) (HodgeStructuresPartII:H.5/betti-tangent). In particular, if H¹(U, a_* End⁰(V))
    = 0, then [V] is a reduced isolated point. The same holds with g^der in place of End⁰ for split
    reductive G (Klevdal–Patrikis Proposition 4.7).

Node HodgeStructuresPartII:H.5/intermediate-extension-h1
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  h1_intermediateExtension_eq: Let X ⊂ X̄ be a good compactification with U = X̄ ∖ D_sing, X →a U →b
    X̄ and j = b∘a, and let F be a local system of finite-dimensional vector spaces on X over a
    field of characteristic zero. Then H¹(X̄, j_{!*}F) ≅ H¹(U, a_* F), where j_{!*} is the
    intermediate extension of F (placed in the appropriate perverse degree and shifted back): there
    is an exact triangle j_{!*}F → Rb_* a_* F → C with C supported on D_sing and concentrated in
    degrees ≥ 2. If the local monodromies of F are finite, j_{!*}F = j_*F; if X is a curve, j_{!*} =
    j_*. The same identity holds for lisse ℚ̄_ℓ-sheaves on X_s ⊂ X̄_s for a good compactification
    over a finite field with ℓ invertible (for instance the fibre of a model as in
    HodgeStructuresPartII:H.5/smooth-arithmetic-model; Esnault–Groechenig 2018 Lemma 3.4). Thus the
    j_{!*}-definitions of cohomological rigidity of Esnault–Groechenig, Klevdal–Patrikis and
    Landesman–Litt agree with the a_*-definition of HodgeStructuresPartII:H.5/cohomological-
    rigidity.

Node HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsRigidHiggs.gm_fixed: Let X be smooth connected projective over ℂ and (V,θ) a rigid stable Higgs
    bundle with determinant (L,0) (HodgeStructuresPartII:H.5/rigid-connection). Then (V, tθ) ≅ (V,
    θ) for every t ∈ ℂ^×; equivalently [(V,θ)] is a fixed point of the 𝔾_m-action on M_Dol^s(X,
    (L,0), r).

Node HodgeStructuresPartII:H.5/rigid-higgs-nilpotent
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsRigidHiggs.nilpotent: Let X be smooth connected projective over ℂ and (V,θ) a rigid stable Higgs
    bundle of rank r with determinant (L,0). Then the Hitchin image h(V,θ) ∈ A_r = ⊕_{i=2}^{r} H⁰(X,
    Sym^i Ω¹_X) is zero, the characteristic polynomial of θ is T^r, and θ is nilpotent: every
    composite θ_{v_1} ∘ ⋯ ∘ θ_{v_r} of r components of θ vanishes, i.e. the joint nilpotence bound r
    holds (HodgeStructuresPartII:H.0/joint-nilpotence).

Node HodgeStructuresPartII:H.5/system-of-hodge-bundles
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  SystemOfHodgeBundles.ofGriffiths: The associated graded Higgs bundle of a Griffiths-transverse
    filtration (HodgeStructuresPartII:H.0/graded-higgs) with E^p = Gr^p_F.
  SystemOfHodgeBundles.determinant: det E = ⊗_p det E^p, with determinant Higgs field 0.
  SystemOfHodgeBundles.hom_graded: Morphisms of systems of Hodge bundles are degree-preserving
    morphisms of Higgs bundles; for stable underlying Higgs bundles every Higgs isomorphism between
    systems is graded up to shift (HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles).
  SystemOfHodgeBundles.test_uniformizing: On a compact curve C of genus ≥ 2 with a theta
    characteristic K^{1/2}, E^1 = K^{1/2}, E^0 = K^{−1/2} and θ: E^1 → E^0 ⊗ K the identity of
    K^{1/2} form a system of Hodge bundles with θ ≠ 0 and θ² = 0.

Node HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  SystemOfHodgeBundles.of_scale_iso: Let X be a compact connected complex manifold and (E,θ) a Higgs
    bundle with (E,θ) ≅ (E,tθ) for some t ∈ ℂ^× that is not a root of unity. Then E has a structure
    of system of Hodge bundles; if (E,θ) is stable, this structure is unique up to shift of indices.

Node HodgeStructuresPartII:H.5/cvhs-hodge-bundles
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  cvhs_equiv_hodgeBundles: Let X be a compact Kähler manifold (in this layer, smooth connected
    projective over ℂ). (a) A polarized complex variation of Hodge structure (V = ⊕_{p+q=w} V^{p,q},
    flat D satisfying Griffiths transversality, flat Hermitian form ψ making the decomposition
    orthogonal, definite of sign (−1)^p on V^{p,q}) supplied by HodgeStructuresPartII:H.2
    determines, with the sign-alternated polarization K, a harmonic bundle
    (HodgeStructuresPartII:H.1/harmonic-bundle) with D = ∂ + ∂̄ + θ + θ̄, whose Higgs bundle is the
    system of Hodge bundles (⊕_p Gr^p_F, gr_F D) with Gr^p_F = V^{p,w−p}
    (HodgeStructuresPartII:H.0/graded-higgs). (b) Conversely, under the projective harmonic
    correspondence (HodgeStructuresPartII:H.1/harmonic-correspondence), the semisimple flat bundle
    corresponding to a polystable system of Hodge bundles with vanishing rational Chern classes
    carries a polarized complex variation of Hodge structure whose associated graded is the given
    system; the structures of polarized complex variation on a semisimple local system correspond
    bijectively to the structures of system of Hodge bundles on its Higgs bundle. (c) Consequently
    the semisimple representations of π₁(X) underlying complex variations of Hodge structure are
    exactly the semisimple ones fixed by the 𝔾_m-action (Simpson Corollary 4.2).

Node HodgeStructuresPartII:H.5/rigid-underlies-cvhs
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsRigidConnection.underlies_cvhs: Let X be smooth connected projective over ℂ and (E,∇) a rigid
    stable flat connection with torsion determinant (L,∇_L) (HodgeStructuresPartII:H.5/rigid-
    connection). Then (E,∇) underlies a polarized complex variation of Hodge structure: there is a
    Griffiths-transverse filtration F^• of E (∇F^i ⊂ F^{i−1} ⊗ Ω¹) with polarization, unique up to
    shift of indices, and the associated graded Higgs bundle (Gr_F E, gr_F ∇) is the rigid stable
    Higgs bundle corresponding to (E,∇) under HodgeStructuresPartII:H.5/rigid-correspondence. The
    complex variation need not have a real or integral structure. More generally (Simpson Lemma 4.5)
    every properly rigid reductive representation of π₁(X) into a reductive group comes from a
    complex variation of Hodge structure.

Node HodgeStructuresPartII:H.5/deformation-to-cvhs
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  deformation_to_cvhs: (a) Let X be smooth connected projective over ℂ and G a reductive complex
    group. Every representation ρ: π₁(X) → G(ℂ) can be deformed, inside Hom(π₁(X), G), to a
    representation underlying a complex variation of Hodge structure; for G = GL_r and ρ with finite
    determinant the deformation can be taken with constant determinant. (b) (Mochizuki, as stated by
    Landesman–Litt Theorem 4.3.1) Let X̄ be smooth projective, D ⊂ X̄ a strict normal crossings
    divisor and X = X̄ ∖ D. Every ρ: π₁(X) → GL_r(ℂ) with finite determinant admits a deformation
    with constant determinant to a representation underlying a polarizable complex variation of
    Hodge structure; the G-version for a reductive Zariski closure (Mochizuki Lemma 10.13) deforms
    within G.

Node HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  IsStronglyCohomologicallyRigid.underlies_pvhs: Let X̄ be smooth projective, D ⊂ X̄ a strict normal
    crossings divisor and X = X̄ ∖ D. Let ρ: π₁(X) → GL_r(ℂ) be semisimple with finite determinant
    and H¹(X, ad ρ) = 0 (strongly cohomologically rigid, HodgeStructuresPartII:H.5/strong-
    cohomological-rigidity). Then ρ underlies a polarizable complex variation of Hodge structure on
    X.

Node HodgeStructuresPartII:H.5/unitary-representation
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsUnitaryRepresentation.dual_iff_conj: For unitary ρ the dual representation is isomorphic to the
    complex conjugate ρ̄.

Node HodgeStructuresPartII:H.5/zero-higgs-unitary
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  gradedHiggs_eq_zero_iff_unitary: Let X be a compact connected Kähler manifold (smooth projective
    in this layer) and (V, F, ∇, ψ) a polarized complex variation of Hodge structure with associated
    graded Higgs field θ = gr_F ∇: Gr_F V → Gr_F V ⊗ Ω¹ (its Kodaira–Spencer class). Then θ = 0 if
    and only if the monodromy of ∇ is unitary. When the underlying local system is irreducible, θ =
    0 forces the Hodge filtration to have a single nonzero graded piece. No integral or real
    structure is assumed.

Node HodgeStructuresPartII:H.5/hodge-rigid-locus
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  HodgeRigidLocus: RigidLocus of q: M_Hod^s(X, r, L) → 𝔸¹.
  HodgeRigidLocus.zeroFibre: Its fibre over 0 is M^rig_Dol(X,(L,0),r).
  HodgeRigidLocus.oneFibre: Its fibre over 1 is M^rig_dR(X,r,L).
  HodgeRigidLocus.gmStable: The 𝔾_m-action of HodgeStructuresPartII:H.1/hodge-scaling restricts to
    M^rig_Hod, compatibly with weight one on 𝔸¹.
  HodgeRigidLocus.nonzeroTrivialization: M^rig_Hod ×_{𝔸¹} 𝔾_m ≅ M^rig_dR × 𝔾_m over 𝔾_m, (λ, E, D) ↦
    ((E, λ⁻¹D), λ).
  HodgeRigidLocus.mem_iff: A point over λ lies in M^rig_Hod iff it is isolated in q⁻¹(λ).
  HodgeRigidLocus.test_rank_one: For r = 1, M^rig_Hod(X, L, 1) → 𝔸¹ is an isomorphism.
  HodgeRigidLocus.test_genus_two_empty: For X a compact curve of genus g ≥ 2 and r = 2, M^rig_Hod(X,
    O, 2) is empty, although M_Hod^s(X, 2, O) is nonempty.
  HodgeRigidLocus.test_fibres: The fibre of M^rig_Hod over 0 is M^rig_Dol(X,(L,0),r) and over 1 is
    M^rig_dR(X,r,L), as subschemes of the fibres of M_Hod^s.
  HodgeRigidLocus.test_gm_stable: For t ∈ ℂ^× and a point m of M^rig_Hod over λ, t·m is a point of
    M^rig_Hod over tλ.

Node HodgeStructuresPartII:H.5/rigid-hodge-splitting
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  HodgeRigidLocus.splitting: Let X be smooth connected projective over ℂ, L torsion, r ≥ 1. Then:
    (i) for every rigid stable flat connection (E,∇) with determinant (L,∇_L), with Hodge filtration
    F of HodgeStructuresPartII:H.5/rigid-underlies-cvhs, the Rees λ-connection ξ(E, F) = Σ_p λ^{−p}
    F^p ⊗ ℂ[λ] (HodgeStructuresPartII:H.0/rees-parameter) defines a 𝔾_m-equivariant section σ_E: 𝔸¹
    → M^rig_Hod(X, L, r) with σ_E(1) = [(E,∇)] and σ_E(0) = [(Gr_F E, gr_F ∇)]; (ii) M^rig_Hod(X, L,
    r) → 𝔸¹ is finite and flat, and its reduced subscheme is the disjoint union of the images of the
    sections σ_E, so (M^rig_Hod)_red ≅ (M^rig_Dol)_red × 𝔸¹ 𝔾_m-equivariantly; (iii) each connected
    component is finite flat over 𝔸¹ with all fibres isomorphic to the local Artinian ring of
    M_Dol^s at the corresponding rigid Higgs point; (iv) (Esnault–Groechenig Lemma 4.9) M^rig_Hod(X,
    L, r) ≅ M^rig_Dol(X, (L,0), r) × 𝔸¹ 𝔾_m-equivariantly over 𝔸¹, the action on the right being
    scaling of θ times weight one on 𝔸¹, including non-reduced structure (proved here from (iii) by
    the classification of torsors on [𝔸¹/𝔾_m]); (v) every 𝔾_m-equivariant section of M^rig_Hod over
    𝔸¹ is a Rees section of a complex variation of Hodge structure as in (i) (Simpson's Lemma 7.2).

Node HodgeStructuresPartII:H.5/smooth-arithmetic-model
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Scope: Native arithmetic model has smooth proper geometric data only. Projectivity, the torsion determinant and its flat connection remain in the omission inventory; this row is partial.
  ArithmeticModel.dominate: Any two arithmetic models of (X, x, L, ι) become isomorphic after base
    change to a common finitely generated subring R̃₃ ⊂ ℂ containing both coefficient rings,
    followed by inverting finitely many nonzero elements.
  ArithmeticModel.spread_hom: Morphisms, sections and isomorphisms of finitely presented objects
    over X extend over some restriction of S, uniquely after further shrinking (EGA IV 8.8.2(i),
    Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).
  ArithmeticModel.closedPoint_finite_residue: Closed points s ∈ S have finite residue fields κ(s) of
    characteristic p, and smoothness of S over ℤ lifts s to W₂(κ(s)).
  ArithmeticModel.flatDeterminant: The relative flat connection ∇_{L_S} on L_S determined by ι_S,
    restricting to ∇_L on X.
  ArithmeticModel.test_projective_space: For X = ℙⁿ_ℂ, x = [1:0:⋯:0], L = O and ι = id, (S = Spec ℤ,
    X_S = ℙⁿ_ℤ) is an arithmetic model.
  ArithmeticModel.test_legendre: For the elliptic curve y² = x(x − 1)(x − λ) with λ ∈ ℂ
    transcendental, R̃ = ℤ[λ, 1/(2λ(1 − λ))] gives an arithmetic model with X_S the Legendre family.
  ArithmeticModel.test_must_invert: For the curve y² = x³ − x over ℂ, the integral model Proj
    ℤ[x,y,z]/(y²z − x³ + xz²) is not smooth over Spec ℤ at the prime 2, so 2 must be inverted: the
    model over Spec ℤ itself is not an arithmetic model.
  ArithmeticModel.test_shrink: If (S, X_S, …) is an arithmetic model and 0 ≠ f ∈ R̃, then the
    restriction to Spec R̃[1/f] is an arithmetic model.

Node HodgeStructuresPartII:H.5/relative-moduli
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  RelativeModuli.deRham: The quasi-projective S-scheme M_dR(X_S/S, L_S, r) of finite type.
  RelativeModuli.dolbeault: The quasi-projective S-scheme M_Dol(X_S/S, L_S, r) of finite type.
  RelativeModuli.hodge: The quasi-projective S × 𝔸¹-scheme M_Hod(X_S/S, L_S, r): over S × 𝔾_m it is
    M_dR × 𝔾_m by rescaling, and the λ = 0 fibre maps to M_Dol(X_S/S, L_S, r) by a morphism that is
    bijective on geometric points (an isomorphism over ℚ, HodgeStructuresPartII:H.1/hodge-coarse).
  RelativeModuli.corepresents: Uniform corepresentation of the family functor; universal
    corepresentation on the stable open.
  RelativeModuli.baseChange: For locally Noetherian T → S the morphism φ_T: M(X_S/S) ×_S T →
    M(X_T/T), bijective on points for geometric T.
  RelativeModuli.stableGenericIso: The stable open base-changes to the stable moduli of
    HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse,
    HodgeStructuresPartII:H.1/hodge-coarse over ℂ.
  RelativeModuli.rigidLocus: M^rig(X_S/S, L_S, r) := RigidLocus of the structure morphism of the
    stable open M^s(X_S/S, L_S, r).
  RelativeModuli.leRank: M(X_S/S, L_S, ≤ r) := ⊔_{r′ ≤ r} M(X_S/S, L_S, r′).
  RelativeModuli.test_rank_one: For r = 1, M_dR(X_S/S, L_S, 1) → S and M_Dol(X_S/S, L_S, 1) → S are
    isomorphisms (the single object (L_S, ∇_{L_S}), respectively (L_S, 0)).
  RelativeModuli.test_geometric_points: For a geometric point s̄ of S, φ_{s̄} is a bijection between
    the s̄-points of M_dR(X_S/S, L_S, r) and the S-equivalence classes of semistable flat
    connections of rank r with determinant (L_s̄, ∇) on X_s̄.
  RelativeModuli.test_generic_stable: The base change of the stable open M^s_dR(X_S/S, L_S, r) along
    Spec ℂ → S is isomorphic to M^s_dR(X, r, L) of HodgeStructuresPartII:H.1/derham-coarse.
  RelativeModuli.test_unfixed_determinant: For an elliptic curve E_S → S and r = 1, fixing only the
    underlying line bundle O of the determinant gives the positive-dimensional family of relative
    connections d + a·ω (ω a relative invariant differential, a ∈ O_S), while the fixed-determinant
    moduli M_dR(E_S/S, O, 1) is S itself.

Node HodgeStructuresPartII:H.5/simultaneous-spreading
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  ArithmeticModel.exists_spreading: Let X be smooth connected projective over ℂ, L torsion and r ≥
    1. There is an affine arithmetic model (S, X_S, L_S) (HodgeStructuresPartII:H.5/smooth-
    arithmetic-model) such that (a) every rigid flat connection (E,∇) on X with determinant L and
    rank ≤ r spreads to a relative flat connection (E_S, ∇_S) on X_S/S with determinant (L_S,
    ∇_{L_S}) which is P-stable over every geometric point of S; (b) every rigid stable Higgs bundle
    (V,θ) on X with determinant (L,0) and rank ≤ r spreads to a relative Higgs bundle (V_S, θ_S) on
    X_S/S, P-stable over every geometric point.

Node HodgeStructuresPartII:H.5/nilpotent-rigid-models
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  ArithmeticModel.exists_nilpotent_rigid: In HodgeStructuresPartII:H.5/simultaneous-spreading, after
    shrinking S: (c) every spread Higgs field is nilpotent, θ_S^{r} = 0 (all products of r
    components of θ_S vanish); (d) the sections [E_S, ∇_S]: S → M_dR(X_S/S, L_S, ≤ r) and [V_S,
    θ_S]: S → M_Dol(X_S/S, L_S, ≤ r) factor through the relative rigid loci M^rig_dR(X_S/S, L_S, ≤
    r) and M^rig_Dol(X_S/S, L_S, ≤ r).

Node HodgeStructuresPartII:H.5/rigid-locus-exhaustion
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  ArithmeticModel.exists_exhaustion: In HodgeStructuresPartII:H.5/nilpotent-rigid-models, after
    further shrinking S: the finitely many sections s_1, …, s_N: S → M^rig_dR(X_S/S, L_S, ≤ r) of
    the spread rigid connections are pairwise disjoint and |M^rig_dR(X_S/S, L_S, ≤ r)| = ∪_i
    s_i(|S|); the same holds for M^rig_Dol(X_S/S, L_S, ≤ r). Thus every geometric fibre
    M^rig_dR(X_s̄/s̄, L_s̄, ≤ r) has exactly N points, one on each section, and over the generic
    point these are the N rigid connections over ℂ. Local multiplicities (lengths of local rings)
    are part of the rigid locus and are retained.

Node HodgeStructuresPartII:H.5/nice-hodge-models
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  ArithmeticModel.exists_nice_hodge: Let X be smooth connected projective over ℂ, L torsion of exact
    order d and r ≥ 1. There are an affine arithmetic model (S, X_S, L_S) and finitely many
    λ-connections (N_S^i, D_S^i), i = 1, …, M, on X_S × 𝔸¹_S relative to λ = pr₂, geometrically
    P-stable, with determinants (L_S^{a(i)}, λ∇) for some 0 ≤ a(i) < d, such that (a) all
    conclusions of HodgeStructuresPartII:H.5/simultaneous-spreading,
    HodgeStructuresPartII:H.5/nilpotent-rigid-models and HodgeStructuresPartII:H.5/rigid-locus-
    exhaustion hold for every determinant L^a, 0 ≤ a ≤ d − 1; (b) each (N_S^i, D_S^i) can moreover
    be chosen 𝔾_m-equivariant, the spread Rees λ-connection of a rigid variation, with fibre at λ =
    1 a spread rigid connection and at λ = 0 its associated graded rigid Higgs bundle
    (Esnault–Groechenig state (b) without the equivariance; this plan chooses the Rees families of
    HodgeStructuresPartII:H.5/rigid-hodge-splitting (i)); (c) the sections give a bijection
    ⊔_{i=1}^{M} [(N_S^i, D_S^i)](|S × 𝔸¹|) = ⊔_{a=0}^{d−1} |M^rig_Hod(X_S/S, L_S^a, ≤ r)|, the rigid
    Hodge loci being taken in the stable opens (HodgeStructuresPartII:H.5/relative-moduli). In
    particular the number n_L of rank-r rigid connections with determinant among L^0, …, L^{d−1}
    equals the number of rank-r rigid stable Higgs bundles with those determinants and indexes the
    sections at λ = 0 and λ = 1. (Indices as corrected in source issue E-H5-1.)

Node HodgeStructuresPartII:H.5/integral-representation
  Missing carrier: projective linear groups PGL_r and projective representations.
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  Missing carrier: general split reductive group schemes over ℤ and their adjoint representations.
  IsIntegralRepresentation.iff_projectiveLattice: For G = GL_r, integral ↔ the local system comes by
    extension of scalars from a local system of finitely generated projective 𝒪_K-modules.
  IsIntegralRepresentation.of_projectivization: For G = GL_r and det ρ of finite order, ρ is
    integral iff its projectivization Γ → PGL_r(ℂ) is integral (Landesman–Litt Lemma 8.3.4: the
    obstruction is a torsor under the finite kernel of G → PGL_r, trivial over a finite extension).
  IsIntegralRepresentation.restrictScalars: If ρ is GL_r(𝒪_K)-valued then ⊕_{τ: K → ℂ} τ∘ρ is
    conjugate into GL_{r[K:ℚ]}(ℤ), hence strongly integral.

Node HodgeStructuresPartII:H.5/strongly-integral
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  IsStronglyIntegral.restrictScalars: For ρ with values in GL_r(𝒪_K), the representation ⊕_{τ} τ∘ρ
    is strongly integral.
  IsStronglyIntegral.sum: Direct sums, tensor products and duals of strongly integral
    representations are strongly integral.
  IsStronglyIntegral.test_restriction_of_scalars: For K = ℚ(i) and ρ: ℤ → GL_1(ℤ[i]), 1 ↦ i, the sum
    of the two embeddings is conjugate to 1 ↦ [[0,−1],[1,0]] ∈ GL_2(ℤ).

Node HodgeStructuresPartII:H.5/integrality-local-criterion
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  isIntegral_of_local: Let Γ be finitely generated, G a connected reductive group over ℤ (GL_r in
    Esnault–Groechenig), K a number field, Σ a finite set of finite places of K and ρ: Γ →
    G(𝒪_{K,Σ}). If for every λ ∈ Σ the completion ρ_λ: Γ → G(K_λ) is G(K̄_λ)-conjugate to a
    representation into G(𝒪_{K̄_λ}) (for G reductive: G(K_λ)-conjugate into G(𝒪_{K_λ}) after a
    finite extension), then there is a finite extension L/K such that ρ is G(L)-conjugate to a
    representation Γ → G(𝒪_L); in particular ρ is integral.

Node HodgeStructuresPartII:H.5/integrality-EG18
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  isIntegral_of_cohomologicallyRigid: Let X be a smooth connected quasi-projective complex variety
    with a good compactification. Every irreducible complex local system V on X that is
    cohomologically rigid (HodgeStructuresPartII:H.5/cohomological-rigidity), has finite-order
    determinant, and has quasi-unipotent local monodromy along every boundary component, is integral
    (HodgeStructuresPartII:H.5/integral-representation): its monodromy is conjugate into GL_r(𝒪_L)
    for a number field L. Integral is not strongly integral; the conclusion is over the full ring
    𝒪_L.

Node HodgeStructuresPartII:H.5/integrality-KP
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  Missing carrier: general split reductive group schemes over ℤ and their adjoint representations.
  isIntegral_of_G_cohomologicallyRigid: Let X be a connected smooth quasi-projective complex variety
    with base point x, G a split connected reductive group over ℤ with maximal abelian quotient A,
    and ρ: π₁(X, x) → G(ℂ) G-irreducible (image in no proper parabolic subgroup) and
    G-cohomologically rigid (H¹(X̄, j_{!*} g^der) = 0 for a good compactification), with quasi-
    unipotent local monodromy and with π₁(X, x) → G(ℂ) → A(ℂ) of finite image. Then the identity
    component of the Zariski closure of ρ(π₁(X,x)) is semisimple, and ρ is G(ℂ)-conjugate to a
    homomorphism π₁(X, x) → G(𝒪_L) for a number field L. For G = PGL_r (A trivial) this applies to
    the projectivizations used by Landesman–Litt; with HodgeStructuresPartII:H.5/integral-
    representation API of_projectivization it gives integrality of GL_r-local systems with finite
    determinant.

Node HodgeStructuresPartII:H.5/geometric-origin
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsOfGeometricOrigin: ∃ U dense open, f: Y → U smooth projective, i, with V|_U a subquotient of R^i
    f_* ℂ.
  IsOfGeometricOrigin.iff_summand: Equivalent with 'direct summand' in place of 'subquotient'
    (semisimplicity).
  IsOfGeometricOrigin.restrict: Restriction to a dense open preserves geometric origin. For a
    morphism h: X′ → X, pullback preserves the given geometric-origin witness when h⁻¹(U) is dense
    in X′ (in particular for a dominant morphism between irreducible varieties): pull back its
    smooth projective family to h⁻¹(U).
  IsOfGeometricOrigin.sum_tensor_dual: Direct sums, tensor products, duals and subquotients of local
    systems of geometric origin are of geometric origin (fibre products and Künneth).
  IsOfGeometricOrigin.quasiUnipotent: Local systems of geometric origin have quasi-unipotent local
    monodromy at infinity (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).
  IsOfGeometricOrigin.integralPVHS: Geometric origin implies underlying an integral PVHS
    (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs).
  IsOfGeometricOrigin.test_constant: The constant local system ℂ_X is of geometric origin (U = X, f
    = id_X, i = 0).
  IsOfGeometricOrigin.test_finite_monodromy: A local system V of rank r with finite monodromy is of
    geometric origin: if f₀: Y → X is the finite étale Galois cover trivializing it, V is a summand
    of f_* ℂ for f: ⊔^r Y → X the disjoint union of r copies (i = 0), since the regular
    representation contains each irreducible representation of the Galois group.
  IsOfGeometricOrigin.test_salem_not: The Salem-type character χ_α on a genus-one curve is not of
    geometric origin: geometric origin implies that every Galois conjugate underlies a polarizable
    variation (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs), and a rank-one polarizable
    variation is unitary, while some conjugate of χ_α is not unitary.
  IsOfGeometricOrigin.test_legendre: On X = ℙ¹ ∖ {0, 1, ∞}, R¹f_*ℂ for the Legendre family y² = x(x
    − 1)(x − λ) is of geometric origin (rank 2, infinite monodromy).

Node HodgeStructuresPartII:H.5/integral-pvhs
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  IsIntegralPVHS: ∃ K, W: 𝒪_K-local system, ι₀, V ≅ W ⊗_{ι₀} ℂ ∧ ∀ ι, W ⊗_ι ℂ underlies a
    polarizable complex variation.
  IsIntegralPVHS.isIntegral: Implies integrality of the monodromy.
  IsIntegralPVHS.conj_aut: Preserved by σ ∈ Aut(ℂ).
  IsIntegralPVHS.of_geometricOrigin: Geometric origin implies IsIntegralPVHS
    (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs).
  IsIntegralPVHS.unitary_all_finite: If moreover every W ⊗_ι ℂ is unitary, the monodromy is finite
    (HodgeStructuresPartII:H.5/unitary-embeddings-finite).
  IsIntegralPVHS.test_finite_monodromy: A local system with finite monodromy underlies an integral
    PVHS: it is defined over 𝒪_K for K a splitting field of its finite monodromy group (e.g. ℚ(ζ_N),
    N the exponent, by Brauer; the character field need not suffice because of Schur indices, as for
    the quaternion group), and every conjugate is unitary, hence a variation of a single Hodge type.
  IsIntegralPVHS.test_salem_not: The Salem-type character χ_α is integral and unitary but does not
    underlie an integral PVHS: some conjugate σ∘χ_α is not unitary, and a rank-one polarizable
    complex variation is unitary (HodgeStructuresPartII:H.5/zero-higgs-unitary).
  IsIntegralPVHS.test_isIntegral: IsIntegralPVHS V → IsIntegralRepresentation of the monodromy of V.
  IsIntegralPVHS.test_unitary_everywhere_finite: If V underlies an integral PVHS through W and every
    W ⊗_ι ℂ is unitary, then the monodromy of V is finite (HodgeStructuresPartII:H.5/unitary-
    embeddings-finite).

Node HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  IsOfGeometricOrigin.integralPVHS: Let V be a complex local system of geometric origin on a smooth
    complex variety X (V|_U a subquotient of R^i f_* ℂ for a smooth projective f: Y → U over a dense
    open U ⊂ X). Then V is defined over 𝒪_L for a number field L and every Galois conjugate V
    ⊗_{𝒪_L, ι} ℂ underlies a polarizable complex variation of Hodge structure on X: V underlies an
    integral PVHS (HodgeStructuresPartII:H.5/integral-pvhs).

Node HodgeStructuresPartII:H.5/low-rank-pvhs-unitary
  Missing carrier: Teichmüller space, versal families of pointed curves and isomonodromic deformations.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  unitary_of_lowRank_pvhs: (Landesman–Litt 2022 Theorem 1.2.12, Theorem 1.2.13 in v3.) Let (C, x_1,
    …, x_n) be a hyperbolic n-pointed curve of genus g and (E,∇) a flat vector bundle on C with
    regular singularities at the x_i and rank E < 2√(g+1). If an isomonodromic deformation of (E,∇)
    to an analytically general nearby n-pointed curve underlies a polarizable complex variation of
    Hodge structure, then (E,∇) has unitary monodromy. In the form used by Landesman–Litt 2024: a
    local system of rank < 2√(g+1) on the total space of a punctured versal family of hyperbolic
    genus-g curves that underlies a complex PVHS restricts to a unitary local system on every fibre.

Node HodgeStructuresPartII:H.5/very-general-rank-bound
  Missing carrier: Teichmüller space, versal families of pointed curves and isomonodromic deformations.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  rank_bound_veryGeneral: (Landesman–Litt 2022 Theorem 1.2.5.) Let K be a number field, (C, x_1, …,
    x_n) an analytically very general hyperbolic n-pointed curve of genus g, and V an 𝒪_K-local
    system on C ∖ {x_1, …, x_n} with infinite monodromy such that V ⊗_{𝒪_K, ι} ℂ underlies a
    polarizable complex variation of Hodge structure for every embedding ι (V underlies an integral
    PVHS, HodgeStructuresPartII:H.5/integral-pvhs). Then rk_{𝒪_K} V ≥ 2√(g+1). Equivalently,
    integral PVHS of rank < 2√(g+1) on such curves have finite monodromy; in particular (Corollary
    1.2.7) local systems of geometric origin with infinite monodromy have rank ≥ 2√(g+1).

Node HodgeStructuresPartII:H.5/rigid-sl3-geometric
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  isOfGeometricOrigin_of_sl3: Let X be a smooth connected projective complex variety with base point
    x. (a) (Langer–Simpson Theorem 1.3) Every rigid, integral, irreducible representation ρ: π₁(X,
    x) → SL_3(ℂ) is of geometric origin. (b) (Esnault–Groechenig §8.1) Every cohomologically rigid
    irreducible flat connection of rank 3 with trivial determinant on X is of geometric origin.

Node HodgeStructuresPartII:H.5/no-symmetric-differentials
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  finite_of_no_symmetric_differentials: Let X be a compact Kähler manifold (smooth projective in the
    uses here) with H⁰(X, Sym^i Ω¹_X) = 0 for every i ≥ 1. Then: (a) (Arapura;
    Brunebarbe–Klingler–Totaro Theorem 4.1) every finite-dimensional complex representation of π₁(X)
    is rigid, in the sense that its point of M_B(X, GL(n)) is isolated (no determinant fixed); (b)
    (Brunebarbe–Klingler–Totaro Theorem 0.1) every finite-dimensional representation of π₁(X) over
    any field has finite image; (c) every Higgs bundle in M_Dol(X, (L,0), r) has nilpotent Higgs
    field, the Hitchin base A_r being a point.

Node HodgeStructuresPartII:H.5/versal-unitary-rigidity
  Missing carrier: Teichmüller space, versal families of pointed curves and isomonodromic deformations.
  versal_unitary_strongly_rigid: Let π°: 𝒞° → M be a punctured versal family of n-pointed genus-g
    curves (as in HodgeStructuresPartII:H.4 and Landesman–Litt Notation 1.10.1), m ∈ M and C° =
    𝒞°_m. Let V be a GL_r-local system (respectively a PGL_r-local system) on the total space 𝒞°
    with r < √(g+1), such that V|_{C°} is (respectively is the projectivization of) an irreducible
    unitary local system. Then H¹(𝒞°, ad V) = 0: V is strongly cohomologically rigid
    (HodgeStructuresPartII:H.5/strong-cohomological-rigidity), hence cohomologically rigid for every
    good compactification of 𝒞° (HodgeStructuresPartII:H.5/strong-implies-cohomological).

Node HodgeStructuresPartII:H.5/adjoint-projectivization
  Missing carrier: the full geometric or coefficient generality described in the review note.
  Scope: Native projectivization states invariance under pointwise scalar twists. The full Lie(PGL_r) comparison in this specification has no native PGL carrier and remains omitted.

Node HodgeStructuresPartII:H.5/adjoint-no-invariants
  Missing carrier: the full geometric or coefficient generality described in the review note.
  Scope: Native no-invariants has an algebraically closed coefficient field and irreducibility. The packet states the general absolutely irreducible version; that generality remains omitted.

Node HodgeStructuresPartII:H.5/adjoint-base-change
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  TraceFreeAdjoint.baseChange: For a field embedding σ: K → L, rep (σ ∘ ρ) ≅ (rep ρ) ⊗_{K,σ} L,
    compatibly with the matrix entries.

Node HodgeStructuresPartII:H.5/rigid-locus-fibre
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  RigidLocus.fibre: For s ∈ S, the fibre of RigidLocus f over s is the rigid locus of the fibre M_s
    → Spec κ(s), i.e. the isolated points of M_s.

Node HodgeStructuresPartII:H.5/hodge-system-scaling
  Missing carrier: the full geometric or coefficient generality described in the review note.
  Scope: Native scaling is for the finite-free cotangent module chart. The sheaf-valued system and its Higgs isomorphism remain omitted.

Node HodgeStructuresPartII:H.5/hodge-system-nilpotent
  Missing carrier: the full geometric or coefficient generality described in the review note.
  Scope: Native nilpotence is for contractions in the finite-free cotangent module chart. The full sheaf-valued joint-nilpotence statement remains omitted.

Node HodgeStructuresPartII:H.5/rigid-hodge-nonzero
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  HodgeRigidLocus.nonzeroTrivialization: M^rig_Hod ×_{𝔸¹} 𝔾_m ≅ M^rig_dR × 𝔾_m over 𝔾_m, (λ, E, D) ↦
    ((E, λ⁻¹D), λ).

Node HodgeStructuresPartII:H.5/arithmetic-spread-morphisms
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  ArithmeticModel.spread_hom: Morphisms, sections and isomorphisms of finitely presented objects
    over X extend over some restriction of S, uniquely after further shrinking (EGA IV 8.8.2(i),
    Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).

Node HodgeStructuresPartII:H.5/relative-stable-complex-fibre
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  RelativeModuli.stableGenericIso: The stable open base-changes to the stable moduli of
    HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse,
    HodgeStructuresPartII:H.1/hodge-coarse over ℂ.

Node HodgeStructuresPartII:H.5/integral-projective-lattice
  Missing carrier: projective linear groups PGL_r and projective representations.
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  Missing carrier: general split reductive group schemes over ℤ and their adjoint representations.
  IsIntegralRepresentation.iff_projectiveLattice: For G = GL_r, integral ↔ the local system comes by
    extension of scalars from a local system of finitely generated projective 𝒪_K-modules.

Node HodgeStructuresPartII:H.5/geometric-origin-summand
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsOfGeometricOrigin.iff_summand: Equivalent with 'direct summand' in place of 'subquotient'
    (semisimplicity).

Node HodgeStructuresPartII:H.5/geometric-origin-boundary
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsOfGeometricOrigin.quasiUnipotent: Local systems of geometric origin have quasi-unipotent local
    monodromy at infinity (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).

-/
