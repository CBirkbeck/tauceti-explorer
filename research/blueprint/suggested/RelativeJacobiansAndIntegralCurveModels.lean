import Mathlib
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.Cohomology.MayerVietoris

/-!
# Relative Jacobians and integral models of curves: suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`RelativeJacobiansAndIntegralCurveModels.md` is definitive; the statements here suggest Lean forms
so that contributors and reviewers converge on names and signatures.

Only what is easily stated with the carriers of the pinned Mathlib and Tau Ceti appears here:
models of a curve over a Dedekind domain (generalising `TauCeti.Model` over a discrete valuation
ring), the extension of rational points to sections of proper models, and the two-chart Čech
formulas on Tau Ceti's sheaf cohomology. The normalised projective-line model, relative Picard
functors with arbitrary fibres, rigidificators, universal rigidified bundles, relative Cartier
divisors, Abel maps, relative Jacobians, Raynaud's quotient `P/E`, Néron models and reduction maps
on group schemes are README targets: their carriers are not at the pins.
-/

open CategoryTheory Limits AlgebraicGeometry

noncomputable section

namespace TauCeti

universe u

/-- A model of a scheme `C` over the fraction field `K` of a Dedekind domain `R`: a flat morphism
of finite presentation to `Spec R` with a chosen identification of its generic fibre with `C`.
Properness, normality, regularity and smoothness are separate predicates. Over a discrete
valuation ring this is `TauCeti.Model` (see `DedekindModel.ofModel`). -/
structure DedekindModel (R K : Type u) [CommRing R] [IsDedekindDomain R]
    [Field K] [Algebra R K] [IsFractionRing R K]
    (C : Scheme.{u}) (toK : C ⟶ Spec (.of K)) where
  /-- The total space of the model. -/
  total : Scheme.{u}
  /-- The structure morphism to the base. -/
  toBase : total ⟶ Spec (.of R)
  /-- The structure morphism is flat. -/
  flat : Flat toBase
  /-- The structure morphism is locally of finite presentation. -/
  locallyOfFinitePresentation : LocallyOfFinitePresentation toBase
  /-- The structure morphism is quasi-compact. -/
  quasiCompact : QuasiCompact toBase
  /-- The structure morphism is quasi-separated. -/
  quasiSeparated : QuasiSeparated toBase
  /-- The identification of the generic fibre with `C`. -/
  genericFiberIso : genericFiber R K toBase ≅ Over.mk toK

namespace DedekindModel

variable {R K : Type u} [CommRing R] [IsDedekindDomain R]
variable [Field K] [Algebra R K] [IsFractionRing R K]
variable {C : Scheme.{u}} {toK : C ⟶ Spec (.of K)}

attribute [instance] DedekindModel.flat DedekindModel.locallyOfFinitePresentation
  DedekindModel.quasiCompact DedekindModel.quasiSeparated

/-- Properness of the structure morphism, a separate predicate on a model. -/
abbrev IsProper (M : DedekindModel R K C toK) : Prop :=
  AlgebraicGeometry.IsProper M.toBase

/-- Over a discrete valuation ring, a Tau Ceti model is a model in this sense, with the same
total space, structure morphism and generic identification. -/
def ofModel {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra R K] [IsFractionRing R K] (M : TauCeti.Model R K C toK) :
    DedekindModel R K C toK where
  total := M.total
  toBase := M.toBase
  flat := M.flat
  locallyOfFinitePresentation := M.locallyOfFinitePresentation
  quasiCompact := M.quasiCompact
  quasiSeparated := M.quasiSeparated
  genericFiberIso := M.genericFiberIso

example {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Algebra R K] [IsFractionRing R K] (M : TauCeti.Model R K C toK) :
    (ofModel M).toBase = M.toBase := rfl

/-- **Points of proper models** (RJ.0/proper-model-points (a)): a `K`-point of `C` extends to a
unique section of a proper model, compatibly with the generic identification. -/
theorem existsUnique_section (M : DedekindModel R K C toK) [M.IsProper]
    (x : Spec (.of K) ⟶ C) (hx : x ≫ toK = 𝟙 _) :
    ∃! σ : Spec (.of R) ⟶ M.total, σ ≫ M.toBase = 𝟙 _ ∧
      Spec.map (CommRingCat.ofHom (algebraMap R K)) ≫ σ =
        x ≫ M.genericFiberIso.inv.left ≫ genericFiberι R K M.toBase := by
  sorry

end DedekindModel

namespace AlgebraicGeometry.Scheme.Modules

open TauCeti.AlgebraicGeometry.Scheme.Modules

variable {X : Scheme.{u}} (M : X.Modules) [M.IsQuasicoherent]

/-- The difference of the two restriction maps `H⁰(U) ⊕ H⁰(V) → H⁰(U ∩ V)`, the Čech differential
of the two-chart cover. -/
abbrev twoChartDifferential (U V : X.Opens) :
    TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyOn M 0 U ⊞
        TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyOn M 0 V ⟶
      TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyOn M 0 (U ⊓ V) :=
  biprod.desc (cohomologyOnRes M 0 (inf_le_left : U ⊓ V ≤ U))
    (-cohomologyOnRes M 0 (inf_le_right : U ⊓ V ≤ V))

/-- **Two-chart Čech computation, degrees at least two** (RJ.0/two-chart-cech). -/
theorem twoChart_cohomology_subsingleton {U V : X.Opens} (hU : IsAffineOpen U)
    (hV : IsAffineOpen V) (hUV : IsAffineOpen (U ⊓ V)) (hcover : U ⊔ V = ⊤) (n : ℕ)
    (hn : 2 ≤ n) : Subsingleton (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology M n) := by
  sorry

/-- **Two-chart Čech computation, degree one**: `H¹(X, M)` is the cokernel of the two-chart
differential. -/
theorem twoChart_cohomologyOne {U V : X.Opens} (hU : IsAffineOpen U) (hV : IsAffineOpen V)
    (hUV : IsAffineOpen (U ⊓ V)) (hcover : U ⊔ V = ⊤) :
    Nonempty (TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyOn M 1 ⊤ ≅
      cokernel (twoChartDifferential M U V)) := by
  sorry

/-- **Two-chart Čech computation, degree zero**: `H⁰(X, M)` is the kernel of the two-chart
differential. -/
theorem twoChart_cohomologyZero {U V : X.Opens} (hU : IsAffineOpen U) (hV : IsAffineOpen V)
    (hUV : IsAffineOpen (U ⊓ V)) (hcover : U ⊔ V = ⊤) :
    Nonempty (TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyOn M 0 ⊤ ≅
      kernel (twoChartDifferential M U V)) := by
  sorry

end AlgebraicGeometry.Scheme.Modules

end TauCeti
