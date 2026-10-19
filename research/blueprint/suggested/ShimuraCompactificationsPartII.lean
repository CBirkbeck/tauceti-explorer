import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.LinearAlgebra.CliffordAlgebra.SpinGroup
import Mathlib.Algebra.Module.Submodule.Map
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-!
# Toroidal compactifications and boundary geometry, Part II: suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ShimuraCompactificationsPartII.md` is definitive; the statements
below suggest Lean forms for the few targets that can already be stated against the pinned
Mathlib and Tau Ceti, so that contributors and reviewers converge on names and signatures.
Every heavy object of the roadmap (Shimura varieties and their toroidal and minimal
compactifications, auxiliary Siegel data, 1-motives, log Dieudonné crystals, the semistable
comparison) has no carrier at the pins; these are README targets, listed at the end.

The only carrier used is Mathlib's relative normalization of a quasi-compact quasi-separated
morphism of schemes, `AlgebraicGeometry.Scheme.Hom.normalization`, which is the scheme case of
the normalized models of Layer C7 (README C7.5), together with elementary arithmetic and lattice
checks from Layers C7, C13 and C14.
-/

universe u

open CategoryTheory AlgebraicGeometry

namespace TauCetiRoadmap.ShimuraCompactificationsPartII

/-! ## Layer C7: normalized models (scheme case) -/

section Normalization

variable {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f] [QuasiSeparated f]

/-- README C7.5 (`NormalizedToroidalModel`), scheme case: the normalization of the auxiliary
model `Y` in the generic model `X` along `f`, the relative spectrum of the integral closure of
`𝒪_Y` in `f_* 𝒪_X`. For the roadmap, `Y` is the product of good Siegel toroidal models and `X`
the characteristic-zero toroidal compactification. -/
noncomputable abbrev NormalizedToroidalModel : Scheme.{u} := f.normalization

/-- README C7.5, `NormalizedToroidalModel.finite`: the structure map to the auxiliary model
(integral; finite once `Y` is Nagata and `X` of finite type, by `SchemeAndStackFoundations`). -/
noncomputable def NormalizedToroidalModel.toAux : NormalizedToroidalModel f ⟶ Y :=
  f.fromNormalization

/-- README C7.5, `NormalizedToroidalModel.generic`: the map from the generic model. -/
noncomputable def NormalizedToroidalModel.generic : X ⟶ NormalizedToroidalModel f :=
  f.toNormalization

instance NormalizedToroidalModel.isIntegralHom_toAux :
    IsIntegralHom (NormalizedToroidalModel.toAux f) := by
  unfold NormalizedToroidalModel.toAux; infer_instance

theorem NormalizedToroidalModel.generic_toAux :
    NormalizedToroidalModel.generic f ≫ NormalizedToroidalModel.toAux f = f :=
  f.toNormalization_fromNormalization

/-- README C7.5, `NormalizedToroidalModel.factorizationDesc`: maps out of the normalized model into any
integral factorization of `f`. This outgoing property is distinct from the README incoming
normal-test lifting target `NormalizedToroidalModel.desc`. -/
noncomputable def NormalizedToroidalModel.factorizationDesc {T : Scheme.{u}} (f₁ : X ⟶ T) (f₂ : T ⟶ Y)
    [IsIntegralHom f₂] (H : f = f₁ ≫ f₂) : NormalizedToroidalModel f ⟶ T :=
  f.normalizationDesc f₁ f₂ H

theorem NormalizedToroidalModel.generic_factorizationDesc {T : Scheme.{u}} (f₁ : X ⟶ T) (f₂ : T ⟶ Y)
    [IsIntegralHom f₂] (H : f = f₁ ≫ f₂) :
    NormalizedToroidalModel.generic f ≫ NormalizedToroidalModel.factorizationDesc f f₁ f₂ H = f₁ :=
  f.toNormalization_normalizationDesc f₁ f₂ H

/-- Test `NormalizedToroidalModel.identity_test` (degenerate case): if the generic model is
already integral over the auxiliary model, normalization changes nothing. -/
example [IsIntegralHom f] : IsIso (NormalizedToroidalModel.generic f) := by
  unfold NormalizedToroidalModel.generic; infer_instance

end Normalization

/-! ## Layer C7: induced cone decompositions need not be smooth -/

/-- The index-two lattice `B = {(a, b) : a ≡ b mod 2}` of the test
`inducedConeDecomposition_nonsmooth_test` (README C7.3). -/
def inducedTestLattice : AddSubgroup (ℤ × ℤ) :=
  AddMonoidHom.ker ((Int.castAddHom (ZMod 2)).comp
    (AddMonoidHom.fst ℤ ℤ - AddMonoidHom.snd ℤ ℤ))

/-- Test `inducedConeDecomposition_nonsmooth_test`: `(1, 1)` lies in `B` and in the quadrant,
but is not a nonnegative integral combination of the ray generators `(2, 0)` and `(0, 2)` of
the quadrant in `B`, so the induced cone is not smooth for `B`. -/
example : ((1 : ℤ), (1 : ℤ)) ∈ inducedTestLattice ∧
    ¬ ∃ m n : ℕ, ((1 : ℤ), (1 : ℤ)) = (2 * (m : ℤ), 2 * (n : ℤ)) := by
  refine ⟨by simp [inducedTestLattice], ?_⟩
  rintro ⟨m, n, h⟩
  simp only [Prod.mk.injEq] at h
  omega

/-! ## Layer C13: the Iwahori polarization degrees -/

/-- README C13.4 (`IwahoriNormalizedModel`), corrected degrees (sourceIssues E6): the factor
`A_{g+i}` of the Iwahori chain at level `p^n` carries a polarization of degree `d_i²`, with
`d_0 = 1` and `d_i = p^{n(g-i)}` for `1 ≤ i ≤ g`. -/
def iwahoriDegree (p n g i : ℕ) : ℕ := if i = 0 then 1 else p ^ (n * (g - i))

/-- Test `IwahoriNormalizedModel.degrees_test`: for `g = 2`, `n = 1` the squared degrees are
`1, p², 1`. -/
example (p : ℕ) : iwahoriDegree p 1 2 0 ^ 2 = 1 ∧ iwahoriDegree p 1 2 1 ^ 2 = p ^ 2 ∧
    iwahoriDegree p 1 2 2 ^ 2 = 1 := by
  simp [iwahoriDegree]

/-- Test `IwahoriNormalizedModel.g1_test`: in genus one both degrees are `1`. -/
example (p : ℕ) : iwahoriDegree p 1 1 0 = 1 ∧ iwahoriDegree p 1 1 1 = 1 := by
  simp [iwahoriDegree]

theorem iwahoriDegree_top (p n g : ℕ) : iwahoriDegree p n g g = 1 := by
  by_cases h : g = 0 <;> simp [iwahoriDegree, h]

/-! ## Layer C14: Klingen and paramodular level -/

/-- README C14.1 (`paramodularLattice`): `V_1 = p e_1 ℤ ⊕ e_2 ℤ ⊕ e_3 ℤ ⊕ e_4 ℤ ⊂ ℤ⁴`. -/
noncomputable def paramodularLattice (p : ℤ) : Submodule ℤ (Fin 4 → ℤ) :=
  Submodule.span ℤ {p • Pi.single 0 1, Pi.single 1 1, Pi.single 2 1, Pi.single 3 1}

/-- Test `paramodularLattice_notSelfDual_test`: for `p ≥ 2`, `V_1` is a proper sublattice
of `ℤ⁴` (of index `p`), so the restricted form is not perfect. -/
theorem paramodularLattice_ne_top (p : ℤ) (hp : 2 ≤ p) : paramodularLattice p ≠ ⊤ := sorry

/-- The number `(q + 1)(q² + 1)` of lines (equivalently, of Lagrangian planes) in a
four-dimensional symplectic space over `𝔽_q`: the degree of the Klingen projection and of the
`T_{p,2}`-correspondence over the interior generic fibre (README C14.1, C14.6). -/
def lagrangianCount (q : ℕ) : ℕ := (q + 1) * (q ^ 2 + 1)

/-- Test `TP2Correspondence.degree_test`. -/
example : lagrangianCount 2 = 15 := rfl

/-- Test `klingenGroup_index_test`: the number of lines in `𝔽_q⁴` is `(q⁴ - 1)/(q - 1)`. -/
theorem lagrangianCount_mul (q : ℕ) :
    ((q : ℤ) - 1) * (lagrangianCount q : ℤ) = (q : ℤ) ^ 4 - 1 := by
  simp only [lagrangianCount]; push_cast; ring

/-- Acceptance of README C14.1: the Klingen chain `G → G/H → G/H^⊥ → G` has degrees
`p, p², p` and composite of degree `p⁴ = deg [p]` on an abelian surface. -/
example (p : ℕ) : p * p ^ 2 * p = p ^ 4 := by ring

end TauCetiRoadmap.ShimuraCompactificationsPartII

/-! ## README targets and conventions

The reader document specifies every heavy target, with its hypotheses, proof, source locator,
API and tests. No missing carrier is replaced by an opaque type or a sorry'd data definition.
In particular, the full-Iwahori order-p finite extension (README C13.7) is a separately glued
finite-flat group, not the literal boundary kernel. Its Klingen adaptation uses the two end
pieces of the partial flag and their Cartier-dual gluing.
The proposed general PEL relative-lci transfer is conditional as well.

Build C12 before C11. De Rham cohomology in C9 is dual to the homological bundle used in C11.
At infinite cyclotomic level maps are integral; finite-level finiteness is a separate assertion.
`Matrix.symplecticGroup` provides Sp, not GSp. The imports here provide no GSpin Shimura datum.
The arithmetic degree examples above remain valid for n=0, when all Iwahori chain maps are
identities; nontrivial order-p gluing concerns n=1.
-/
