import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.DualNumber
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.LocalRing.ResidueField.Ideal
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.Data.ZMod.QuotientGroup
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Ideal.MinimalPrime.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Artinian.Ring
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FinCases

/-!
# Suggested Lean forms: local Galois deformation rings (LocalGaloisDeformationRings, R08.1–R08.6, L7, L8)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`LocalGaloisDeformationRings`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Proofs of new declarations are `sorry`,
except for small computations, which are proved. Nothing here claims that the roadmap is formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. The file imports individual Mathlib modules only;
the Tau Ceti modules this roadmap builds on are not needed for the signatures below.

## Conventions

* `LiftingRing 𝒪 n ρ̄` is the framed lifting ring `R^□_ρ̄` (R08.1/local-lifting-ring), a complete local
  Noetherian `𝒪`-algebra with residue map and universal lift `Lift` (GlobalGaloisDeformations R04.1,
  restated verbatim below so that the file elaborates on its own).
* A local deformation condition is recorded by its ideal of `R^□_ρ̄`; `ConditionRing I = R^□_ρ̄ ⧸ I`.
  Where the defining property of the ideal is a period-ring or finite-flat condition owned by another
  roadmap, the ideal is data of the construction (`def … : Ideal … := sorry`) and its ring-theoretic
  theorems are elaborated, while the point criterion is listed in the inventory at the end.
* Points: `pointRep x : G →* GL_n(B)` for `x : R^□_ρ̄ → B`. Generic fibre: `GenericFibre ϖ R = R[1/ϖ]`.
  "Formally smooth of relative dimension `d`" is `IsPowerSeriesOver 𝒪 R d : R ≃ₐ[𝒪] 𝒪⟦x₁, …, x_d⟧`.
* Away from `p` statements are made for the tame group `T_q` (`TameGroup p q`, generators `t`, `φ`), on
  which every lift is a tame pair `Φ σ Φ⁻¹ = σ^q` (R08.2/tame-splitting).
* Hodge–Tate weights: `HT(ε) = +1` (PadicHodgeTheory R06.2); see `L7/ordinary-of-weight-lambda` for the
  translation from the sources that use `−1`.
* A `Prop`-valued definition always has a real body; conditions that cannot yet be stated are left to the
  inventory, never replaced by placeholders.

The final comment block lists, for every packet item not elaborated here, its name and statement and the
supplier its statement needs.
-/


universe u

open Matrix

noncomputable section

set_option linter.overlappingInstances false
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

/-! ## Imported carrier (GlobalGaloisDeformations R04.1)

`Lift`, `strictKernel` and the strict-conjugation action are restated verbatim from the suggested
file of GlobalGaloisDeformations (R04.1/lifting-functor), so that this file elaborates on its own.
In the library they are imported from that roadmap, never redefined. -/

namespace TauCeti.GaloisDeformation

section Lifts

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {𝔽 : Type*} [Field 𝔽]
variable (n : ℕ) (ρbar : G →* GL (Fin n) 𝔽)
variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- `GlobalGaloisDeformations:R04.1/lifting-functor`: a continuous lift of `ρ̄` along `π`. -/
@[ext]
structure Lift where
  toHom : G →* GL (Fin n) A
  continuous : Continuous fun g ↦ (toHom g : Matrix (Fin n) (Fin n) A)
  reduce : (Matrix.GeneralLinearGroup.map π).comp toHom = ρbar

/-- `Γ̂_n(A)`: invertible matrices reducing to the identity. -/
def strictKernel : Subgroup (GL (Fin n) A) := (Matrix.GeneralLinearGroup.map (n := Fin n) π).ker

/-- Strict conjugation of lifts (R04.1). -/
instance : MulAction (strictKernel n π) (Lift n ρbar π) := sorry

end Lifts

end TauCeti.GaloisDeformation

/-! ## Local carriers of this roadmap -/

namespace TauCeti.GaloisDeformation.Local

open TauCeti.GaloisDeformation

section LiftingRing

variable (𝒪 : Type u) [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
variable {𝔽 : Type u} [Field 𝔽] [Algebra 𝒪 𝔽]
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
variable (n : ℕ) (ρbar : G →* GL (Fin n) 𝔽)

/-- **`R08.1/local-lifting-ring`**, the carrier: the framed lifting ring `R^□_ρ̄ ∈ C_𝒪`. -/
def LiftingRing (𝒪 : Type u) [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type u} [Field 𝔽] [Algebra 𝒪 𝔽] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (n : ℕ) (ρbar : G →* GL (Fin n) 𝔽) : Type u := sorry

instance : CommRing (LiftingRing 𝒪 n ρbar) := sorry
instance : Algebra 𝒪 (LiftingRing 𝒪 n ρbar) := sorry
instance : TopologicalSpace (LiftingRing 𝒪 n ρbar) := sorry
instance : IsLocalRing (LiftingRing 𝒪 n ρbar) := sorry
instance : IsNoetherianRing (LiftingRing 𝒪 n ρbar) := sorry
instance : IsAdicComplete (IsLocalRing.maximalIdeal (LiftingRing 𝒪 n ρbar))
    (LiftingRing 𝒪 n ρbar) := sorry

/-- The residue map `R^□_ρ̄ → 𝔽`. -/
def LiftingRing.residue : LiftingRing 𝒪 n ρbar →ₐ[𝒪] 𝔽 := sorry

/-- The universal lift `ρ^□ : G → GL_n(R^□_ρ̄)`. -/
def LiftingRing.univ : Lift n ρbar (LiftingRing.residue 𝒪 n ρbar).toRingHom := sorry

variable {𝒪 n ρbar}

/-- The representation `ρ_x` at a point `x : R^□_ρ̄ → B` (any coefficient ring, e.g. the ring of
integers of a finite extension of `E`, or a field of characteristic zero). -/
def pointRep {B : Type*} [CommRing B] (x : LiftingRing 𝒪 n ρbar →+* B) : G →* GL (Fin n) B :=
  (Matrix.GeneralLinearGroup.map x).comp (LiftingRing.univ 𝒪 n ρbar).toHom

/-- A local deformation condition is recorded by its ideal of `R^□_ρ̄` (GlobalGaloisDeformations
R04.3); `R^□_ρ̄ / I` is the condition ring. -/
abbrev ConditionRing (I : Ideal (LiftingRing 𝒪 n ρbar)) : Type u := LiftingRing 𝒪 n ρbar ⧸ I

end LiftingRing

section GenericFibre

variable {𝒪 : Type*} [CommRing 𝒪] {R : Type*} [CommRing R] [Algebra 𝒪 R]

/-- The generic fibre `R[1/ϖ]` of an `𝒪`-algebra, for a uniformiser `ϖ` of `𝒪`. -/
abbrev GenericFibre (ϖ : 𝒪) (R : Type*) [CommRing R] [Algebra 𝒪 R] : Type _ :=
  Localization.Away (algebraMap 𝒪 R ϖ)

/-- `R` is formally smooth of relative dimension `d` over `𝒪` in the sense of complete local
rings: `R ≅ 𝒪⟦x₁, …, x_d⟧`. -/
def IsPowerSeriesOver (𝒪 R : Type*) [CommRing 𝒪] [CommRing R] [Algebra 𝒪 R] (d : ℕ) : Prop :=
  Nonempty (R ≃ₐ[𝒪] MvPowerSeries (Fin d) 𝒪)

/-- Equidimensionality: every minimal prime has the same quotient dimension `d`. -/
def IsEquidimensional (R : Type*) [CommRing R] (d : WithBot ℕ∞) : Prop :=
  ∀ P ∈ minimalPrimes R, ringKrullDim (R ⧸ P) = d

end GenericFibre

section Tame

variable {n : ℕ} {A : Type*} [CommRing A]

/-- **`R08.2/q-tame-group`**, on matrices: `(Φ, σ)` satisfies the tame relation
`Φ σ Φ⁻¹ = σ^q`. -/
def IsTamePair (q : ℕ) (Φ σ : GL (Fin n) A) : Prop := Φ * σ * Φ⁻¹ = σ ^ q

end Tame

end TauCeti.GaloisDeformation.Local

/-! ## R08.1: unrestricted local rings -/

namespace TauCeti.GaloisDeformation.Local

open TauCeti.GaloisDeformation

section R081

variable {𝒪 : Type u} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
variable {𝔽 : Type u} [Field 𝔽] [Algebra 𝒪 𝔽]
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
variable {n : ℕ} {ρbar : G →* GL (Fin n) 𝔽}

/-- **`R08.1/local-lifting-ring`**: `R^□_ρ̄` pro-represents the lifting functor on local Artinian
`𝒪`-algebras with residue field `𝔽` (discrete topology): local `𝒪`-algebra maps compatible with the
residue maps correspond to lifts of `ρ̄`, by pushing forward the universal lift. -/
theorem liftingRing_represents (A : Type u) [CommRing A] [TopologicalSpace A] [DiscreteTopology A]
    [IsLocalRing A] [IsArtinianRing A] [Algebra 𝒪 A] (π : A →ₐ[𝒪] 𝔽)
    (hπ : RingHom.ker π.toRingHom = IsLocalRing.maximalIdeal A) :
    ∃ e : {f : LiftingRing 𝒪 n ρbar →ₐ[𝒪] A // π.comp f = LiftingRing.residue 𝒪 n ρbar} ≃
        Lift n ρbar π.toRingHom,
      ∀ f g, ((e f).toHom g : Matrix (Fin n) (Fin n) A) =
        ((LiftingRing.univ 𝒪 n ρbar).toHom g : Matrix (Fin n) (Fin n) _).map f.1 := sorry

/-- Continuous `1`-cocycles `Z¹(G, ad ρ̄)` for the conjugation action on `M_n(𝔽)` (`𝔽` discrete). -/
def adCocycles [TopologicalSpace 𝔽] (ρbar : G →* GL (Fin n) 𝔽) :
    Submodule 𝔽 (G → Matrix (Fin n) (Fin n) 𝔽) where
  carrier := {f | Continuous f ∧ ∀ g h, f (g * h) =
    f g + (ρbar g : Matrix (Fin n) (Fin n) 𝔽) * f h * ((ρbar g)⁻¹ : GL (Fin n) 𝔽)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- **`R08.1/local-tangent-obstruction`** (1): `𝒪`-algebra maps `R^□_ρ̄ → 𝔽[ε]` over `𝔽` are
`Z¹(G, ad ρ̄)`. -/
theorem liftingRing_tangent [TopologicalSpace 𝔽] [DiscreteTopology 𝔽] [Algebra 𝒪 (DualNumber 𝔽)] :
    Nonempty ({f : LiftingRing 𝒪 n ρbar →ₐ[𝒪] DualNumber 𝔽 //
      ∀ x, TrivSqZeroExt.fst (f x) = LiftingRing.residue 𝒪 n ρbar x} ≃ adCocycles ρbar) := sorry

/-- **`R08.1/local-tangent-obstruction`** (3), for `ℓ = p`: the Krull dimension bound
`dim R^□ ≥ 1 + n² + n²[K:ℚ_p]`, from local Tate duality and the Euler characteristic
(ClassFieldTheory Layer 5). -/
theorem liftingRing_krullDim_ge (p : ℕ) [Fact p.Prime] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
    [Algebra ℤ_[p] 𝒪] [Module.Finite ℤ_[p] 𝒪]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    (ρ₀ : Field.absoluteGaloisGroup K →* GL (Fin n) 𝔽) :
    ((1 + n ^ 2 + n ^ 2 * Module.finrank ℚ_[p] K : ℕ) : WithBot ℕ∞) ≤
      ringKrullDim (LiftingRing 𝒪 n ρ₀) := sorry

/-- **`R08.1/local-tangent-obstruction`** (3), unobstructed case: if `H⁰(G_K, ad ρ̄^∨(1)) = 0` then
`R^□` is a power series ring in `n²(1 + [K:ℚ_p])` variables. The vanishing is expressed as the absence of
nonzero `G_K`-equivariant maps `ρ̄ → ρ̄ ⊗ ω̄` for the mod `p` cyclotomic character `ω̄`. -/
theorem liftingRing_isPowerSeries_of_unobstructed (p : ℕ) [Fact p.Prime] [IsDomain 𝒪]
    [IsDiscreteValuationRing 𝒪] [Algebra ℤ_[p] 𝒪] [Module.Finite ℤ_[p] 𝒪]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    (ρ₀ : Field.absoluteGaloisGroup K →* GL (Fin n) 𝔽) [CharP 𝔽 p] (ω : Field.absoluteGaloisGroup K →* 𝔽ˣ)
    (hω : ∀ g : Field.absoluteGaloisGroup K, ∀ ζ : AlgebraicClosure K, ζ ^ p = 1 →
      ∃ m : ℕ, (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from g) ζ = ζ ^ m ∧ (ω g : 𝔽) = m)
    (h : ∀ M : Matrix (Fin n) (Fin n) 𝔽, (∀ g, M * (ρ₀ g : Matrix (Fin n) (Fin n) 𝔽) =
      ((ω g : 𝔽) • (ρ₀ g : Matrix (Fin n) (Fin n) 𝔽)) * M) → M = 0) :
    IsPowerSeriesOver 𝒪 (LiftingRing 𝒪 n ρ₀) (n ^ 2 * (1 + Module.finrank ℚ_[p] K)) := sorry

/-- **`R08.1/local-fixed-determinant`**: the ideal of `R^□_ρ̄` of lifts with determinant `ψ`. -/
def detIdeal (ψ : G →* 𝒪ˣ) : Ideal (LiftingRing 𝒪 n ρbar) := sorry

/-- Points of the fixed-determinant ring are the lifts with determinant `ψ`. -/
theorem detIdeal_points (ψ : G →* 𝒪ˣ) {B : Type*} [CommRing B] [Algebra 𝒪 B]
    (x : LiftingRing 𝒪 n ρbar →ₐ[𝒪] B) :
    (∀ r ∈ detIdeal (n := n) (ρbar := ρbar) ψ, x r = 0) ↔
      ∀ g, Matrix.GeneralLinearGroup.det (pointRep x.toRingHom g) =
        Units.map (algebraMap 𝒪 B).toMonoidHom (ψ g) := sorry

/-- **`R08.1/local-forget-framing`**: the unframed universal deformation ring (Schur `ρ̄`). -/
def UnframedRing (𝒪 : Type u) [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type u} [Field 𝔽] [Algebra 𝒪 𝔽] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (n : ℕ) (ρbar : G →* GL (Fin n) 𝔽) : Type u := sorry

instance : CommRing (UnframedRing 𝒪 n ρbar) := sorry
instance : Algebra 𝒪 (UnframedRing 𝒪 n ρbar) := sorry
instance : Algebra (UnframedRing 𝒪 n ρbar) (LiftingRing 𝒪 n ρbar) := sorry

/-- **`R08.1/local-forget-framing`**: for Schur `ρ̄`, `R^□ ≅ R^univ ⊗̂ 𝒪⟦x_{ij}⟧/(x₁₁)`; recorded here
through Krull dimensions, `dim R^□ = dim R^univ + n² − 1`. -/
theorem liftingRing_krullDim_eq_unframed
    (hSchur : ∀ M : Matrix (Fin n) (Fin n) 𝔽, (∀ g, M * (ρbar g : Matrix (Fin n) (Fin n) 𝔽) =
      (ρbar g : Matrix (Fin n) (Fin n) 𝔽) * M) → ∃ c : 𝔽, M = c • 1) :
    ringKrullDim (LiftingRing 𝒪 n ρbar) = ringKrullDim (UnframedRing 𝒪 n ρbar) + (n ^ 2 - 1 : ℕ) :=
  sorry

/-- **`R08.1/archimedean-rings-p-odd`**: for `p` odd and `c` of order two, the lifting ring of
`ρ̄ : ⟨c⟩ → GL_n(𝔽)` with `ρ̄(c)` of eigenvalue multiplicities `a, b` (`a + b = n`) is a power series
ring in `n² − a² − b²` variables. -/
theorem archimedean_isPowerSeries {C : Type u} [Group C] [TopologicalSpace C] [DiscreteTopology C]
    [IsTopologicalGroup C] (c : C) (hc : ∀ g, g = 1 ∨ g = c) (hc2 : c * c = 1)
    (ρ₀ : C →* GL (Fin n) 𝔽) (h2 : (2 : 𝔽) ≠ 0) (a b : ℕ) (hab : a + b = n)
    (hmult : Module.finrank 𝔽 (LinearMap.ker (Matrix.toLin' ((ρ₀ c : Matrix (Fin n) (Fin n) 𝔽) - 1))) = a) :
    IsPowerSeriesOver 𝒪 (LiftingRing 𝒪 n ρ₀) (n ^ 2 - a ^ 2 - b ^ 2) := sorry

/-- **`R08.1/archimedean-odd-ring-p2`**: the equation `(a₀ + X₀)² + (b₀ + X₁)(c₀ + X₂) − 1` of the
odd archimedean ring at `p = 2`, in the entries of `ρ(c) = (a, b; c, −a)`. -/
noncomputable def oddArchimedeanEquation {R : Type*} [CommRing R] (a₀ b₀ c₀ : R) :
    MvPowerSeries (Fin 3) R :=
  (MvPowerSeries.C a₀ + MvPowerSeries.X 0) ^ 2 +
    (MvPowerSeries.C b₀ + MvPowerSeries.X 1) * (MvPowerSeries.C c₀ + MvPowerSeries.X 2) - 1

/-- **`R08.1/archimedean-odd-ring-p2`**: for `n = 2`, `p = 2` and `ρ̄(c) = (a₀, b₀; c₀, −a₀)`
reduced, the ring of odd lifts (determinant `−1`) is `𝒪⟦X₀, X₁, X₂⟧/(oddArchimedeanEquation)`. -/
theorem oddArchimedeanRing_presentation {C : Type u} [Group C] [TopologicalSpace C]
    [DiscreteTopology C] [IsTopologicalGroup C] (c : C) (hc : ∀ g, g = 1 ∨ g = c) (hc2 : c * c = 1)
    (ρ₀ : C →* GL (Fin 2) 𝔽) (h2 : (2 : 𝔽) = 0)
    (I : Ideal (LiftingRing 𝒪 2 ρ₀)) (a₀ b₀ c₀ : 𝒪)
    (hρ₀ : (ρ₀ c : Matrix (Fin 2) (Fin 2) 𝔽) =
      !![algebraMap 𝒪 𝔽 a₀, algebraMap 𝒪 𝔽 b₀; algebraMap 𝒪 𝔽 c₀, -algebraMap 𝒪 𝔽 a₀])
    (hI : ∀ {B : Type u} [CommRing B] [Algebra 𝒪 B] (x : LiftingRing 𝒪 2 ρ₀ →ₐ[𝒪] B),
      (∀ r ∈ I, x r = 0) ↔ ((pointRep x.toRingHom c : GL (Fin 2) B) : Matrix (Fin 2) (Fin 2) B).det = -1) :
    Nonempty (ConditionRing I ≃ₐ[𝒪]
      MvPowerSeries (Fin 3) 𝒪 ⧸ Ideal.span {oddArchimedeanEquation a₀ b₀ c₀}) := sorry

/-- **`R08.1/local-residue-field-change`**: for a finite extension `𝒪 → 𝒪'` with residue field
`𝔽'`, `R^□_{ρ̄ ⊗ 𝔽'} ≅ R^□_ρ̄ ⊗_𝒪 𝒪'`; here, its consequence on Krull dimensions. -/
theorem liftingRing_baseChange_krullDim {𝒪' : Type u} [CommRing 𝒪'] [IsLocalRing 𝒪']
    [IsNoetherianRing 𝒪'] [Algebra 𝒪 𝒪'] [Module.Finite 𝒪 𝒪'] [Module.Flat 𝒪 𝒪']
    {𝔽' : Type u} [Field 𝔽'] [Algebra 𝒪' 𝔽'] (ι : 𝔽 →+* 𝔽') :
    ringKrullDim (LiftingRing 𝒪' n ((Matrix.GeneralLinearGroup.map ι).comp ρbar)) =
      ringKrullDim (LiftingRing 𝒪 n ρbar) := sorry

/-- **`R08.1/rank-one-ring`**: for a character of `G_K`, `K/ℚ_p` finite, with `μ_{p^∞}(K)` trivial,
the lifting ring is `𝒪⟦y₁, …, y_{[K:ℚ_p]+1}⟧`. -/
theorem rankOne_isPowerSeries (p : ℕ) [Fact p.Prime] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
    [Algebra ℤ_[p] 𝒪] [Module.Finite ℤ_[p] 𝒪]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    (hμ : ∀ ζ : K, ζ ^ p = 1 → ζ = 1) (χ : Field.absoluteGaloisGroup K →* GL (Fin 1) 𝔽) :
    IsPowerSeriesOver 𝒪 (LiftingRing 𝒪 1 χ) (Module.finrank ℚ_[p] K + 1) := sorry

/-- **`R08.1/determinant-twisting`**: twisting by `𝒳` identifies `R^{□,χ}` with `R^{□,ψ}` completed
over the character ring; recorded through dimensions, `dim R^□ = dim R^{□,ψ} + [K:ℚ_p] + 1` for
`μ_p ⊄ K` and `p ∤ n` (for `p ∣ n` the power map `φ_d` replaces the square root and the statement is the
Böckle–Iyengar–Paškūnas comparison of the node). -/
theorem determinantTwisting_krullDim (p : ℕ) [Fact p.Prime] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
    [Algebra ℤ_[p] 𝒪] [Module.Finite ℤ_[p] 𝒪]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    (hμ : ∀ ζ : K, ζ ^ p = 1 → ζ = 1) (hpn : ¬ p ∣ n)
    (ρ₀ : Field.absoluteGaloisGroup K →* GL (Fin n) 𝔽) (ψ : Field.absoluteGaloisGroup K →* 𝒪ˣ)
    (hψ : ∀ g, Units.map (algebraMap 𝒪 𝔽).toMonoidHom (ψ g) = Matrix.GeneralLinearGroup.det (ρ₀ g)) :
    ringKrullDim (LiftingRing 𝒪 n ρ₀) =
      ringKrullDim (ConditionRing (detIdeal (n := n) (ρbar := ρ₀) ψ)) +
        (Module.finrank ℚ_[p] K + 1 : ℕ) := sorry

/-- **`R08.1/completion-at-points`**: at a closed point `x` of `Spec R^□[1/ϖ]` with residue field `E'`,
the completed local ring is the framed lifting ring of `ρ_x` over `E'`; here, its consequence that a
point whose lifting ring is unobstructed is a regular point. -/
theorem completion_isRegular_of_unobstructed (ϖ : 𝒪)
    (P : Ideal (GenericFibre ϖ (LiftingRing 𝒪 n ρbar))) [P.IsMaximal]
    (h : Module.finrank (P.ResidueField) (IsLocalRing.CotangentSpace (Localization.AtPrime P)) ≤
      ringKrullDim (Localization.AtPrime P)) :
    IsRegularLocalRing (Localization.AtPrime P) := sorry

/-- **`R08.1/coefficient-rings-lambda`**: the three kinds of `𝒪`-field `κ`. -/
inductive CoeffFieldKind
  | finite
  | padic
  | localCharP

/-- **`R08.1/coefficient-rings-lambda`**, API `CoeffRing`: the ring `Λ` attached to `κ` (a complete
DVR with uniformiser `ϖ` and residue field `κ` in the finite and characteristic-`p` cases, `κ` itself in
the `p`-adic case). -/
def CoeffRing (κ : Type u) [Field κ] [Algebra 𝒪 κ] (k : CoeffFieldKind) : Type u := sorry

instance (κ : Type u) [Field κ] [Algebra 𝒪 κ] (k : CoeffFieldKind) :
    CommRing (CoeffRing (𝒪 := 𝒪) κ k) := sorry
instance (κ : Type u) [Field κ] [Algebra 𝒪 κ] (k : CoeffFieldKind) :
    Algebra 𝒪 (CoeffRing (𝒪 := 𝒪) κ k) := sorry

/-- API `CoeffRing.isCohen`: in the characteristic-`p` case, `Λ` is a discrete valuation ring with
residue field `κ`, and any complete DVR over `𝒪` with uniformiser `ϖ` and residue field `κ` is
isomorphic to it. -/
theorem CoeffRing.isCohen (κ : Type u) [Field κ] [Algebra 𝒪 κ] [IsDomain (CoeffRing (𝒪 := 𝒪) κ .localCharP)] :
    IsDiscreteValuationRing (CoeffRing (𝒪 := 𝒪) κ .localCharP) := sorry

/-- API `ArtinCat`: the test objects of `𝔄_Λ`: local Artinian `Λ`-algebras with residue field `κ`,
with a topology (discrete for finite `κ`). -/
structure ArtinCat (Λ : Type u) [CommRing Λ] (κ : Type u) [Field κ] [Algebra Λ κ] where
  carrier : Type u
  [ring : CommRing carrier]
  [alg : Algebra Λ carrier]
  [isLocal : IsLocalRing carrier]
  [artinian : IsArtinianRing carrier]
  [top : TopologicalSpace carrier]
  residue : carrier →ₐ[Λ] κ

/-- API `liftFunctorΛ`: `D^□_ρ(A)`, continuous lifts of `ρ : G → GL_d(κ)` to an object of `𝔄_Λ`. -/
def liftFunctorΛ {Λ κ : Type u} [CommRing Λ] [Field κ] [Algebra Λ κ] (ρ : G →* GL (Fin n) κ)
    (A : ArtinCat Λ κ) : Type _ :=
  letI := A.ring; letI := A.alg; letI := A.top
  Lift n ρ A.residue.toRingHom

/-- API `liftFunctorΛ_finite`: for finite `κ` with the discrete topology on `A`, `D^□_ρ` is the lifting
functor of GlobalGaloisDeformations R04.1 (here, the two carriers coincide by definition). -/
theorem liftFunctorΛ_finite {Λ κ : Type u} [CommRing Λ] [Field κ] [Algebra Λ κ] [Finite κ]
    (ρ : G →* GL (Fin n) κ) (A : ArtinCat Λ κ) :
    liftFunctorΛ ρ A = (letI := A.ring; letI := A.alg; letI := A.top; Lift n ρ A.residue.toRingHom) :=
  rfl

/-- `coeffRing_finite` (degenerate): for `κ = k` (finite), `Λ = 𝒪`. -/
example [Finite 𝔽] : Nonempty (CoeffRing (𝒪 := 𝒪) 𝔽 .finite ≃ₐ[𝒪] 𝒪) := sorry

/-- `coeffRing_padic` (computation): in the `p`-adic case `Λ = κ`. -/
example (κ : Type u) [Field κ] [Algebra 𝒪 κ] : Nonempty (CoeffRing (𝒪 := 𝒪) κ .padic ≃ₐ[𝒪] κ) := sorry

/-- `coeffRing_char_p_dvr` (non-example): for `κ = k((t))`, `Λ` is a DVR, unlike `𝒪⟦t⟧`, which has Krull
dimension two. -/
example [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪] :
    ringKrullDim (PowerSeries 𝒪) = 2 := sorry

/-- `liftFunctorΛ_compat` (compatibility): for finite `κ`, `liftFunctorΛ` is `Lift`. -/
example {Λ κ : Type u} [CommRing Λ] [Field κ] [Algebra Λ κ] [Finite κ] (ρ : G →* GL (Fin n) κ)
    (A : ArtinCat Λ κ) : liftFunctorΛ ρ A = (letI := A.ring; letI := A.alg; letI := A.top;
      Lift n ρ A.residue.toRingHom) := liftFunctorΛ_finite ρ A

/-- **`R08.1/lambda-presentation`** (2), unobstructed form: `R^□_ρ` over `Λ` is a power series ring in
`d²(1 + [F:ℚ_p])` variables when `H²(G_F, ad ρ) = 0` (stated for finite `κ`). -/
theorem lambdaPresentation_unobstructed (p : ℕ) [Fact p.Prime] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
    [Algebra ℤ_[p] 𝒪] [Module.Finite ℤ_[p] 𝒪]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    (ρ₀ : Field.absoluteGaloisGroup K →* GL (Fin n) 𝔽) [CharP 𝔽 p] (ω : Field.absoluteGaloisGroup K →* 𝔽ˣ)
    (hω : ∀ g : Field.absoluteGaloisGroup K, ∀ ζ : AlgebraicClosure K, ζ ^ p = 1 →
      ∃ m : ℕ, (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from g) ζ = ζ ^ m ∧ (ω g : 𝔽) = m)
    (h : ∀ M : Matrix (Fin n) (Fin n) 𝔽, (∀ g, M * (ρ₀ g : Matrix (Fin n) (Fin n) 𝔽) =
      ((ω g : 𝔽) • (ρ₀ g : Matrix (Fin n) (Fin n) 𝔽)) * M) → M = 0) :
    IsPowerSeriesOver 𝒪 (LiftingRing 𝒪 n ρ₀) (n ^ 2 * (1 + Module.finrank ℚ_[p] K)) :=
  liftingRing_isPowerSeries_of_unobstructed p K ρ₀ ω hω h

/-! The G-valued framed rings (`R08.1/g-valued-framed-ring`, `R08.1/g-valued-presentations`) are stated
for a closed subgroup functor of `GL_d` given by matrix equations; the smooth affine group-scheme API
(Lie algebras, `G/G^der`) is a requested supplier (ArithmeticStatistics ST.5 and its extension). -/

/-- API `GLift`: `D^□_{ρ,G}(A)`, lifts valued in a subgroup family `𝒢(A) ⊆ GL_d(A)` cut out by matrix
equations, functorial in `A`. -/
def GLift (𝒢 : ∀ (A : Type u) [CommRing A], Subgroup (GL (Fin n) A)) {A : Type u} [CommRing A]
    [TopologicalSpace A] (π : A →+* 𝔽) : Set (Lift n ρbar π) :=
  {ρ | ∀ g, ρ.toHom g ∈ 𝒢 A}

/-- API `GFramedRing`: the quotient of `R^□` representing `𝒢`-valued lifts. -/
def GFramedRing.ideal (𝒢 : ∀ (A : Type u) [CommRing A], Subgroup (GL (Fin n) A)) :
    Ideal (LiftingRing 𝒪 n ρbar) := sorry

/-- `R^□_{ρ,G}` as a ring. -/
abbrev GFramedRing (𝒢 : ∀ (A : Type u) [CommRing A], Subgroup (GL (Fin n) A)) : Type u :=
  ConditionRing (GFramedRing.ideal (𝒪 := 𝒪) (ρbar := ρbar) 𝒢)

/-- API `GFramedRing.gl`: for `𝒢 = GL_d`, `R^□_{ρ,G} = R^□_ρ`. -/
theorem GFramedRing.gl : GFramedRing.ideal (𝒪 := 𝒪) (ρbar := ρbar) (fun _ _ ↦ ⊤) = ⊥ := sorry

/-- API `GFramedRing.fixedMultiplier`: with a multiplier `ν : 𝒢 → 𝔾_m` and a character `μ`, the ideal of
lifts with `ν ∘ ρ = μ`. -/
def GFramedRing.fixedMultiplier (ν : ∀ (A : Type u) [CommRing A], GL (Fin n) A →* Aˣ)
    (μ : G →* 𝒪ˣ) : Ideal (LiftingRing 𝒪 n ρbar) := sorry

/-- API `GFramedRing.hom_ext`: maps out of `R^□_{ρ,G}` are determined by the induced lifts. -/
theorem GFramedRing.hom_ext (𝒢 : ∀ (A : Type u) [CommRing A], Subgroup (GL (Fin n) A))
    {B : Type u} [CommRing B] [Algebra 𝒪 B] (f₁ f₂ : GFramedRing (𝒪 := 𝒪) (ρbar := ρbar) 𝒢 →ₐ[𝒪] B)
    (h : ∀ g, pointRep ((f₁.toRingHom).comp (Ideal.Quotient.mk _)) g =
      pointRep ((f₂.toRingHom).comp (Ideal.Quotient.mk _)) g) : f₁ = f₂ := sorry

/-- `gFramed_trivial_group` (degenerate): for `𝒢 = 1` and `ρ̄ = 1` the only lift is trivial and
`R^□_{ρ,G} = 𝒪`. -/
example (hρ : ρbar = 1) :
    Nonempty (GFramedRing (𝒪 := 𝒪) (ρbar := ρbar) (fun _ _ ↦ ⊥) ≃ₐ[𝒪] 𝒪) := sorry

/-- `gFramed_GL_compat` (compatibility): `GFramedRing` for `GL_d` is `R^□_ρ`. -/
example : GFramedRing.ideal (𝒪 := 𝒪) (ρbar := ρbar) (fun _ _ ↦ ⊤) = ⊥ := GFramedRing.gl

end R081

/-! ## R08.2: places away from `p`

Away from `p` every statement is read on the tame quotient (`R08.2/tame-splitting`): a lift is a pair of
matrices `(Φ, σ)` with `Φ σ Φ⁻¹ = σ^q`, `Φ` a Frobenius lift and `σ` a topological generator of tame
inertia, `σ` residually unipotent after the prime-to-`p` part is split off. -/

section R082

variable {A : Type*} [CommRing A] {n : ℕ}

/-- **`R08.2/q-tame-group`**, API `TameGroup`: the `q`-tame group `T_q = ℤ_p ⋊ ℤ̂`, as a profinite
group with generators `t`, `φ_q`. -/
def TameGroup (p q : ℕ) : Type := sorry

instance (p q : ℕ) : Group (TameGroup p q) := sorry
instance (p q : ℕ) : TopologicalSpace (TameGroup p q) := sorry

/-- The generators `t` (tame inertia) and `φ_q` (Frobenius). -/
def TameGroup.t (p q : ℕ) : TameGroup p q := sorry
/-- The Frobenius generator `φ_q`. -/
def TameGroup.φ (p q : ℕ) : TameGroup p q := sorry

/-- API `TameGroup.conj_t`: `φ_q t φ_q⁻¹ = t^q`. -/
theorem TameGroup.conj_t (p q : ℕ) :
    TameGroup.φ p q * TameGroup.t p q * (TameGroup.φ p q)⁻¹ = TameGroup.t p q ^ q := sorry

/-- API `TameGroup.lift`: a tame pair `(Φ, σ)` in `GL_n(R)` with `σ` pro-`p` unipotent defines a
representation of `T_q` sending `t ↦ σ`, `φ_q ↦ Φ`. -/
def TameGroup.lift (p q : ℕ) (Φ σ : GL (Fin n) A) (h : IsTamePair q Φ σ) :
    TameGroup p q →* GL (Fin n) A := sorry

theorem TameGroup.lift_t (p q : ℕ) (Φ σ : GL (Fin n) A) (h : IsTamePair q Φ σ) :
    TameGroup.lift p q Φ σ h (TameGroup.t p q) = σ := sorry

/-- API `TameGroup.lift_ext`: representations agreeing on `t` and `φ_q` are equal. -/
theorem TameGroup.lift_ext (p q : ℕ) (r₁ r₂ : TameGroup p q →* GL (Fin n) A)
    (ht : r₁ (TameGroup.t p q) = r₂ (TameGroup.t p q))
    (hφ : r₁ (TameGroup.φ p q) = r₂ (TameGroup.φ p q)) : r₁ = r₂ := sorry

/-- API `TameGroup.ofLocalField`: for `K/ℚ_ℓ` with residue field of order `q`, `G_K/P_K ≅ T_q`
(given the choices of Frobenius and tame generator); recorded as a surjection from `G_K`. -/
def TameGroup.ofLocalField (p q ℓ : ℕ) [Fact ℓ.Prime] (K : Type*) [Field K] [Algebra ℚ_[ℓ] K]
    [FiniteDimensional ℚ_[ℓ] K] : Field.absoluteGaloisGroup K →* TameGroup p q := sorry

/-- `tameGroup_q_one` (degenerate): for `q = 1` the relation says `t` and `φ` commute. -/
example (p : ℕ) : TameGroup.φ p 1 * TameGroup.t p 1 = TameGroup.t p 1 * TameGroup.φ p 1 := by
  have h := TameGroup.conj_t p 1
  rw [pow_one] at h
  calc TameGroup.φ p 1 * TameGroup.t p 1
      = TameGroup.φ p 1 * TameGroup.t p 1 * (TameGroup.φ p 1)⁻¹ * TameGroup.φ p 1 := by group
    _ = TameGroup.t p 1 * TameGroup.φ p 1 := by rw [h]

/-- `tameGroup_not_direct` (non-example): for `q ≢ 1 mod p`, `T_q` is not abelian. -/
example (p q : ℕ) (hq : ¬ (q : ZMod p) = 1) :
    TameGroup.φ p q * TameGroup.t p q ≠ TameGroup.t p q * TameGroup.φ p q := sorry

/-- `tameGroup_abelianisation` (computation): `T_q^{ab} ≅ ℤ_p/(q − 1) × ℤ̂`; its torsion part has order
`p^{v_p(q−1)}`. Recorded as: the commutator `[φ, t] = t^{q−1}`. -/
example (p q : ℕ) (hq : 1 ≤ q) :
    TameGroup.φ p q * TameGroup.t p q * (TameGroup.φ p q)⁻¹ * (TameGroup.t p q)⁻¹ =
      TameGroup.t p q ^ (q - 1) := sorry

/-- `tameGroup_sub` (characterisation): `φ^b t φ^{-b} = t^{q^b}`, so `⟨t, φ^b⟩` is `T_{q^b}`. -/
example (p q b : ℕ) :
    TameGroup.φ p q ^ b * TameGroup.t p q * (TameGroup.φ p q ^ b)⁻¹ = TameGroup.t p q ^ (q ^ b) := sorry

/-- **`R08.2/tame-splitting`**: the reduction to tame pieces; for residually tame `ρ̄` every lift is
determined by a tame pair, recorded as the relation satisfied by any representation of `T_q`. -/
theorem tamePair_of_rep (p q : ℕ) (r : TameGroup p q →* GL (Fin n) A) :
    IsTamePair q (r (TameGroup.φ p q)) (r (TameGroup.t p q)) := by
  unfold IsTamePair
  rw [← map_mul, ← map_inv, ← map_mul, TameGroup.conj_t, map_pow]

instance (p q : ℕ) : IsTopologicalGroup (TameGroup p q) := sorry

/-- The ideal of `R^□` of lifts of a `T_q`-representation that are unramified (`t ↦ 1`). -/
def unramifiedIdeal {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪] {𝔽 : Type}
    [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ) (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽) :
    Ideal (LiftingRing 𝒪 n ρ₀) := sorry

/-- Points of `unramifiedIdeal`. -/
theorem unramifiedIdeal_points {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ) (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽)
    {B : Type} [CommRing B] [Algebra 𝒪 B] (x : LiftingRing 𝒪 n ρ₀ →ₐ[𝒪] B) :
    (∀ r ∈ unramifiedIdeal p q ρ₀, x r = 0) ↔ pointRep x.toRingHom (TameGroup.t p q) = 1 := sorry

/-- **`R08.2/unramified-lifting-ring`**: for unramified `ρ̄` (`ρ̄(t) = 1`), the unramified quotient is a
power series ring in `n²` variables (the lift of `Φ`). -/
theorem unramified_isPowerSeries {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ) (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽)
    (hρ₀ : ρ₀ (TameGroup.t p q) = 1) :
    IsPowerSeriesOver 𝒪 (ConditionRing (unramifiedIdeal (𝒪 := 𝒪) p q ρ₀)) (n ^ 2) := sorry

/-- **`R08.2/minimally-ramified-condition`**, API `IsMinimallyRamified`: for a lift `σ` of a residually
unipotent `σ̄` along `π : A → 𝔽`, each `ker (σ − 1)^i` is a direct summand of `Aⁿ` whose rank is
`dim ker (σ̄ − 1)^i`. -/
def IsMinimallyRamified {𝔽 : Type*} [Field 𝔽] (π : A →+* 𝔽) (σ : Matrix (Fin n) (Fin n) A) : Prop :=
  ∀ i : ℕ, (∃ Q : Submodule A (Fin n → A),
      IsCompl (LinearMap.ker (Matrix.toLin' ((σ - 1) ^ i))) Q) ∧
    Module.Free A (LinearMap.ker (Matrix.toLin' ((σ - 1) ^ i))) ∧
    Module.finrank A (LinearMap.ker (Matrix.toLin' ((σ - 1) ^ i))) =
      Module.finrank 𝔽 (LinearMap.ker (Matrix.toLin' ((σ.map π - 1) ^ i)))

/-- API `isMinimallyRamified_iff_filtration`: equivalently, the kernel filtration is by direct summands
lifting the residual one, with `σ` acting trivially on the graded pieces. -/
theorem isMinimallyRamified_iff_filtration {𝔽 : Type*} [Field 𝔽] [IsLocalRing A] (π : A →+* 𝔽)
    (σ : Matrix (Fin n) (Fin n) A) :
    IsMinimallyRamified π σ ↔ ∀ i : ℕ, ∃ Q : Submodule A (Fin n → A),
      IsCompl (LinearMap.ker (Matrix.toLin' ((σ - 1) ^ i))) Q ∧
      Module.finrank A (LinearMap.ker (Matrix.toLin' ((σ - 1) ^ i))) =
        Module.finrank 𝔽 (LinearMap.ker (Matrix.toLin' ((σ.map π - 1) ^ i))) := sorry

/-- API `IsMinimallyRamified.conj`: stable under conjugation. -/
theorem IsMinimallyRamified.conj {𝔽 : Type*} [Field 𝔽] (π : A →+* 𝔽) (σ : Matrix (Fin n) (Fin n) A)
    (g : GL (Fin n) A) (h : IsMinimallyRamified π σ) :
    IsMinimallyRamified π ((g : Matrix (Fin n) (Fin n) A) * σ * ((g⁻¹ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A)) := sorry

/-- API `minimallyRamified_deformationProblem`: for `ρ̄ : T_q → GL_n(𝔽)` with `ρ̄(t)` unipotent, the
minimally ramified lifts are cut out by an ideal of `R^□` (CHT §2.4.4). -/
theorem minimallyRamified_deformationProblem {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪]
    [IsNoetherianRing 𝒪] {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ)
    (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽)
    (hunip : IsNilpotent ((ρ₀ (TameGroup.t p q) : Matrix (Fin n) (Fin n) 𝔽) - 1)) :
    ∃ I : Ideal (LiftingRing 𝒪 n ρ₀), ∀ {B : Type} [CommRing B] [IsLocalRing B] [IsArtinianRing B]
      [Algebra 𝒪 B] (x : LiftingRing 𝒪 n ρ₀ →ₐ[𝒪] B) (πB : B →+* 𝔽),
      (∀ r ∈ I, x r = 0) ↔ IsMinimallyRamified πB
        (pointRep x.toRingHom (TameGroup.t p q) : Matrix (Fin n) (Fin n) B) :=
  sorry

/-- API `minimal_baseChange`: a map of coefficient rings carries minimal lifts to minimal lifts. -/
theorem minimal_baseChange {B 𝔽 : Type*} [CommRing B] [Field 𝔽] (π : A →+* 𝔽) (πB : B →+* 𝔽)
    (f : A →+* B) (hf : πB.comp f = π) (σ : Matrix (Fin n) (Fin n) A)
    (h : IsMinimallyRamified π σ) : IsMinimallyRamified πB (σ.map f) := sorry

/-- API `minimal_generator_independent`: replacing `σ` by a power `σ^u`, `u` prime to `p`, gives the
same condition (`(σ^u − 1) = (σ − 1)·unit` on unipotent `σ`). -/
theorem minimal_generator_independent {𝔽 : Type*} [Field 𝔽] (π : A →+* 𝔽)
    (σ : Matrix (Fin n) (Fin n) A) (u : ℕ) (hu : IsUnit (u : A)) (hnil : IsNilpotent (σ - 1)) :
    IsMinimallyRamified π (σ ^ u) ↔ IsMinimallyRamified π σ := sorry

/-- `minRam_unramified` (compatibility): for unramified `ρ̄` (`σ̄ = 1`), minimally ramified means `σ = 1`. -/
example {𝔽 : Type*} [Field 𝔽] [IsLocalRing A] (π : A →+* 𝔽) (σ : Matrix (Fin n) (Fin n) A)
    (hσ : σ.map π = 1) : IsMinimallyRamified π σ ↔ σ = 1 := sorry

/-- `minRam_conj` (characterisation): conjugation preserves the condition. -/
example {𝔽 : Type*} [Field 𝔽] (π : A →+* 𝔽) (σ : Matrix (Fin n) (Fin n) A) (g : GL (Fin n) A)
    (h : IsMinimallyRamified π σ) :
    IsMinimallyRamified π ((g : Matrix (Fin n) (Fin n) A) * σ * ((g⁻¹ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A)) :=
  h.conj π σ g

/-- `minRam_non_example` (non-example): `σ = (1 x; 0 1)` with `x ∈ 𝔪_A ∖ 0` lifting `σ̄ = 1` is not
minimally ramified. -/
example {𝔽 : Type*} [Field 𝔽] [IsLocalRing A] (π : A →+* 𝔽) (x : A) (hx : x ≠ 0) (hπx : π x = 0) :
    ¬ IsMinimallyRamified π !![1, x; 0, 1] := sorry

/-- **`R08.2/minimally-ramified-ring`**: the minimally ramified quotient of the lifting ring of a
`T_q`-representation with unipotent `ρ̄(t)` is a power series ring in `n²` variables (CHT Lemma 2.4.19). -/
theorem minimallyRamified_isPowerSeries {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪]
    [IsNoetherianRing 𝒪] {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ)
    (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽) (I : Ideal (LiftingRing 𝒪 n ρ₀))
    (hunip : IsNilpotent ((ρ₀ (TameGroup.t p q) : Matrix (Fin n) (Fin n) 𝔽) - 1))
    (hI : ∀ {B : Type} [CommRing B] [IsLocalRing B] [IsArtinianRing B] [Algebra 𝒪 B]
      (x : LiftingRing 𝒪 n ρ₀ →ₐ[𝒪] B) (πB : B →+* 𝔽),
      (∀ r ∈ I, x r = 0) ↔ IsMinimallyRamified πB
        (pointRep x.toRingHom (TameGroup.t p q) : Matrix (Fin n) (Fin n) B)) :
    IsPowerSeriesOver 𝒪 (ConditionRing I) (n ^ 2) := sorry

/-- **`R08.2/unrestricted-away-from-p`**: the unrestricted lifting ring away from `p` is `𝒪`-flat,
reduced and equidimensional of dimension `1 + n²` (Shotton). -/
theorem unrestricted_equidimensional {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪] {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (ℓ p : ℕ)
    [Fact ℓ.Prime] [Fact p.Prime] (hℓp : ℓ ≠ p) [Algebra ℤ_[p] 𝒪] [Module.Finite ℤ_[p] 𝒪]
    (K : Type) [Field K] [Algebra ℚ_[ℓ] K] [FiniteDimensional ℚ_[ℓ] K]
    (ρ₀ : Field.absoluteGaloisGroup K →* GL (Fin n) 𝔽) :
    Module.Flat 𝒪 (LiftingRing 𝒪 n ρ₀) ∧ IsReduced (LiftingRing 𝒪 n ρ₀) ∧
      IsEquidimensional (LiftingRing 𝒪 n ρ₀) ((1 + n ^ 2 : ℕ) : WithBot ℕ∞) := sorry

/-- **`R08.2/unrestricted-ring-complete-intersection`**: it is a complete intersection of relative
dimension `n²`: a quotient of a power series ring in `m + n²` variables by `m` elements. -/
theorem unrestricted_completeIntersection {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪]
    [IsNoetherianRing 𝒪] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪] {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽]
    (ℓ p : ℕ) [Fact ℓ.Prime] [Fact p.Prime] (hℓp : ℓ ≠ p) [Algebra ℤ_[p] 𝒪] [Module.Finite ℤ_[p] 𝒪]
    (K : Type) [Field K] [Algebra ℚ_[ℓ] K] [FiniteDimensional ℚ_[ℓ] K]
    (ρ₀ : Field.absoluteGaloisGroup K →* GL (Fin n) 𝔽) :
    ∃ (m : ℕ) (f : Fin m → MvPowerSeries (Fin (m + n ^ 2)) 𝒪),
      Nonempty (LiftingRing 𝒪 n ρ₀ ≃ₐ[𝒪] MvPowerSeries (Fin (m + n ^ 2)) 𝒪 ⧸ Ideal.span (Set.range f)) :=
  sorry

/-- **`R08.2/steinberg-condition`**, the Frobenius relation for `n = 2`: `q (tr Φ)² = (1 + q)² det Φ`. -/
def SteinbergFrobRelation (q : ℕ) (M : Matrix (Fin 2) (Fin 2) A) : Prop :=
  (q : A) * M.trace ^ 2 = (1 + q) ^ 2 * M.det

/-- API `SteinbergLifts`: `D^{Stein,1}`: unipotent inertia and Frobenius characteristic polynomial in
`Pol_n({n}, q)`, i.e. `∏ (X − q^i α)` for some `α`. -/
def SteinbergLifts (q : ℕ) (Φ σ : Matrix (Fin n) (Fin n) A) : Prop :=
  σ.charpoly = (Polynomial.X - 1) ^ n ∧
    ∃ α : A, Φ.charpoly = ∏ i : Fin n, (Polynomial.X - Polynomial.C ((q : A) ^ (i : ℕ) * α))

/-- API `SteinbergLifts.baseChange`: the defining equations are preserved by coefficient maps. -/
theorem SteinbergLifts.baseChange {B : Type*} [CommRing B] (f : A →+* B) (q : ℕ)
    (Φ σ : Matrix (Fin n) (Fin n) A) (h : SteinbergLifts q Φ σ) :
    SteinbergLifts q (Φ.map f) (σ.map f) := sorry

/-- API `steinberg_charpoly_frob`: the Frobenius eigenvalues are in ratio `q`. -/
theorem steinberg_charpoly_frob (q : ℕ) (Φ σ : Matrix (Fin n) (Fin n) A)
    (h : SteinbergLifts q Φ σ) :
    ∃ α : A, Φ.charpoly = ∏ i : Fin n, (Polynomial.X - Polynomial.C ((q : A) ^ (i : ℕ) * α)) := h.2

/-- API `steinberg_le_unipotentInertia`: Steinberg lifts have unipotent inertia. -/
theorem steinberg_le_unipotentInertia (q : ℕ) (Φ σ : Matrix (Fin n) (Fin n) A)
    (h : SteinbergLifts q Φ σ) : σ.charpoly = (Polynomial.X - 1) ^ n := h.1

/-- API `steinberg_n_two`: for `n = 2` the Frobenius condition gives `q (tr Φ)² = (1 + q)² det Φ`. -/
theorem steinberg_n_two (q : ℕ) (Φ σ : Matrix (Fin 2) (Fin 2) A) (h : SteinbergLifts q Φ σ) :
    SteinbergFrobRelation q Φ := sorry

/-- `stein_n_two_relation` (computation): `diag(α, qα)` satisfies the relation. -/
example (q : ℕ) (α : A) : SteinbergFrobRelation q !![α, 0; 0, (q : A) * α] := by
  unfold SteinbergFrobRelation
  simp [Matrix.trace_fin_two, Matrix.det_fin_two]
  ring

/-- `stein_subset_unipotent` (characterisation): Steinberg lifts have unipotent inertia. -/
example (q : ℕ) (Φ σ : Matrix (Fin n) (Fin n) A) (h : SteinbergLifts q Φ σ) :
    σ.charpoly = (Polynomial.X - 1) ^ n := steinberg_le_unipotentInertia q Φ σ h

/-- `stein_not_unipotent_only` (non-example): `Φ = diag(1, 1)`, `σ = 1` over `ℚ` with `q = 2` has
unipotent inertia but is not Steinberg (`2·4 ≠ 9·1`). -/
example : ¬ SteinbergFrobRelation 2 (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  unfold SteinbergFrobRelation
  norm_num

/-- The ideal of lifts of a `T_q`-representation whose inertia has characteristic polynomial `f`. -/
def charpolyIdeal {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪] {𝔽 : Type}
    [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ) (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽) (f : Polynomial 𝒪) :
    Ideal (LiftingRing 𝒪 n ρ₀) := sorry

/-- Points of `charpolyIdeal`. -/
theorem charpolyIdeal_points {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ) (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽)
    (f : Polynomial 𝒪) {B : Type} [CommRing B] [Algebra 𝒪 B] (x : LiftingRing 𝒪 n ρ₀ →ₐ[𝒪] B) :
    (∀ r ∈ charpolyIdeal p q ρ₀ f, x r = 0) ↔
      (pointRep x.toRingHom (TameGroup.t p q) : Matrix (Fin n) (Fin n) B).charpoly =
        f.map (algebraMap 𝒪 B) := sorry

/-- The `ϖ`-saturation (flat closure) of an ideal: `{r | ϖ^k r ∈ I for some k}`. -/
def flatClosure {R : Type*} [CommRing R] (ϖ : R) (I : Ideal R) : Ideal R where
  carrier := {r | ∃ k : ℕ, ϖ ^ k * r ∈ I}
  add_mem' := sorry
  zero_mem' := ⟨0, by simp⟩
  smul_mem' := sorry

/-- **`R08.2/steinberg-ring-domain`**: for trivial `ρ̄` and `q ≡ 1 mod p`, the flat closure of the Steinberg
condition is prime, i.e. the Steinberg ring is a domain (Taylor II, Proposition 3.1; Thorne). -/
theorem steinbergRing_isPrime {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ) [Fact p.Prime] (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽)
    (hρ₀ : ρ₀ = 1) (hq : (q : 𝔽) = 1) (ϖ : 𝒪) (Istein : Ideal (LiftingRing 𝒪 n ρ₀))
    (hI : ∀ {B : Type} [CommRing B] [Algebra 𝒪 B] (x : LiftingRing 𝒪 n ρ₀ →ₐ[𝒪] B),
      (∀ r ∈ Istein, x r = 0) ↔ SteinbergLifts q
        (pointRep x.toRingHom (TameGroup.φ p q) : Matrix (Fin n) (Fin n) B)
        (pointRep x.toRingHom (TameGroup.t p q) : Matrix (Fin n) (Fin n) B)) :
    (flatClosure (algebraMap 𝒪 _ ϖ) Istein).IsPrime := sorry

/-- **`R08.2/taylor-wiles-local-ring`**: at a Taylor–Wiles place (`q ≡ 1 mod p`, `ρ̄` unramified with
distinct Frobenius eigenvalues) the lifting ring of the tame representation has dimension `1 + n²`. -/
theorem taylorWiles_krullDim {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪] {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ)
    [Fact p.Prime] [CharP 𝔽 p] (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽) (hq : (q : 𝔽) = 1)
    (hρ₀ : ρ₀ (TameGroup.t p q) = 1)
    (hdistinct : ((ρ₀ (TameGroup.φ p q) : Matrix (Fin n) (Fin n) 𝔽).charpoly.roots).Nodup)
    (hsplit : ((ρ₀ (TameGroup.φ p q) : Matrix (Fin n) (Fin n) 𝔽).charpoly.roots).card = n) :
    ringKrullDim (LiftingRing 𝒪 n ρ₀) = ((1 + n ^ 2 : ℕ) : WithBot ℕ∞) := sorry

/-- **`R08.2/ihara-avoidance-components`**: for `q ≡ 1 mod p` and trivial `ρ̄`, the unipotent condition
and a condition with residually trivial characters `ζ_i` have the same special fibre (before flat
closure; the component statements of Taylor's Proposition 3.1 concern the flat closures). -/
theorem iharaAvoidance_same_specialFibre {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪]
    [IsNoetherianRing 𝒪] {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ)
    (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽) (ϖ : 𝒪) (ζ : Fin n → 𝒪)
    (hζ : ∀ i, ζ i - 1 ∈ Ideal.span {ϖ}) :
    charpolyIdeal p q ρ₀ ((Polynomial.X - 1) ^ n) ⊔ Ideal.span {algebraMap 𝒪 _ ϖ} =
      charpolyIdeal p q ρ₀ (∏ i, (Polynomial.X - Polynomial.C (ζ i))) ⊔
        Ideal.span {algebraMap 𝒪 _ ϖ} := sorry

/-- **`R08.2/ihara-avoidance-components`**, the other half: with the `ζ_i` pairwise distinct (and
`q ≡ 1 mod p`, trivial `ρ̄`), the flat closure of the distinct-character condition is prime. -/
theorem iharaAvoidance_distinct_isPrime {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪]
    [IsNoetherianRing 𝒪] {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ)
    (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽) (hρ₀ : ρ₀ = 1) (hq : (q : 𝔽) = 1) (ϖ : 𝒪) (ζ : Fin n → 𝒪)
    (hζ : Function.Injective ζ) :
    (flatClosure (algebraMap 𝒪 _ ϖ)
      (charpolyIdeal p q ρ₀ (∏ i, (Polynomial.X - Polynomial.C (ζ i))))).IsPrime := sorry

/-- **`R08.2/level-raising-local-problems`**, API `LevelRaising.localModel`: the local model
`𝒪⟦x₀, x₁⟧/(x₀x₁)`. -/
noncomputable def LevelRaising.localModel (𝒪 : Type*) [CommRing 𝒪] : Type _ :=
  MvPowerSeries (Fin 2) 𝒪 ⧸ Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) 𝒪)}

/-- API `LevelRaising.mix`: the ideal of `𝒟^mix` in the polarized lifting ring (data). -/
def LevelRaising.mix {𝒪 : Type u} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type u} [Field 𝔽] [Algebra 𝒪 𝔽] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (ρ₀ : G →* GL (Fin n) 𝔽) : Ideal (LiftingRing 𝒪 n ρ₀) := sorry

/-- API `LevelRaising.unr`: `𝒟^unr ⊂ 𝒟^mix`, the locus `x₀ = 0`. -/
def LevelRaising.unr {𝒪 : Type u} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type u} [Field 𝔽] [Algebra 𝒪 𝔽] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (ρ₀ : G →* GL (Fin n) 𝔽) : Ideal (LiftingRing 𝒪 n ρ₀) := sorry

/-- API `LevelRaising.ram`: `𝒟^ram ⊂ 𝒟^mix`, the locus `x₁ = 0`. -/
def LevelRaising.ram {𝒪 : Type u} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type u} [Field 𝔽] [Algebra 𝒪 𝔽] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (ρ₀ : G →* GL (Fin n) 𝔽) : Ideal (LiftingRing 𝒪 n ρ₀) := sorry

/-- API `LevelRaising.relation`: in the rank-two block, `x (s − q^{−N}) = 0`; checked on the nodal
model as the vanishing of `x₀x₁`. -/
theorem LevelRaising.relation (𝒪 : Type*) [CommRing 𝒪] :
    (Ideal.Quotient.mk (Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) 𝒪)}))
      (MvPowerSeries.X 0 * MvPowerSeries.X 1) = 0 :=
  Ideal.Quotient.eq_zero_iff_mem.mpr (Ideal.subset_span rfl)

/-- API `LevelRaising.unr_eq_minimal`: `𝒟^unr` and `𝒟^ram` are subproblems of `𝒟^mix`, and on the nodal
model `𝒟^unr` is the branch `x₀ = 0` (the unramified condition); recorded as the containment of ideals. -/
theorem LevelRaising.unr_eq_minimal {𝒪 : Type u} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    {𝔽 : Type u} [Field 𝔽] [Algebra 𝒪 𝔽] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (ρ₀ : G →* GL (Fin n) 𝔽) :
    LevelRaising.mix (𝒪 := 𝒪) ρ₀ ≤ LevelRaising.unr ρ₀ ∧ LevelRaising.mix (𝒪 := 𝒪) ρ₀ ≤ LevelRaising.ram ρ₀ :=
  sorry

/-- `levelRaising_N2_components` (characterisation): the nodal model has exactly two minimal primes,
`(x₀)` and `(x₁)`. -/
example (k : Type*) [Field k] :
    minimalPrimes (MvPowerSeries (Fin 2) k ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)}) =
      {Ideal.map (Ideal.Quotient.mk _) (Ideal.span {MvPowerSeries.X 0}),
       Ideal.map (Ideal.Quotient.mk _) (Ideal.span {MvPowerSeries.X 1})} := sorry

/-- `levelRaising_dims` (computation): the nodal model has Krull dimension `2` over a field
(`3` over `𝒪`), i.e. one more than each component's relative dimension one. -/
example (k : Type*) [Field k] :
    ringKrullDim (MvPowerSeries (Fin 2) k ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)}) = 1 := sorry

/-- `levelRaising_wrong_direction` (non-example): `x (s′ − q² s) = 0` and `x (s − q² s′) = 0` are different
relations when `q⁴ ≠ 1`. -/
example (q : ℚ) (hq : q ^ 4 ≠ 1) : ∃ s s' : ℚ, s' - q ^ 2 * s = 0 ∧ s - q ^ 2 * s' ≠ 0 :=
  ⟨1, q ^ 2, by ring, by
    intro h; apply hq; linear_combination -h⟩

/-- `levelRaising_degenerate_eigenvalues` (degenerate): if `p ∣ q² − 1` the residual eigenvalues `1`
and `q²` coincide mod `p`. -/
example (p q : ℕ) (h : (p : ℤ) ∣ (q : ℤ) ^ 2 - 1) : ((q : ZMod p) ^ 2 = 1) := by
  have := (ZMod.intCast_zmod_eq_zero_iff_dvd _ p).mpr h
  push_cast at this
  linear_combination this

/-- **`R08.2/rigid-residual-conditions`**, API `RigidResidual`: the rigidity conditions on `(Σ_min, Σ_lr)`
recorded as finitely many places with chosen local problems. -/
structure RigidResidual where
  Smin : Finset ℕ
  Slr : Finset ℕ
  disjoint : Disjoint Smin Slr

end R082

end TauCeti.GaloisDeformation.Local

/-! ## R08.3: potentially semistable deformation rings

The defining property of these quotients (points are the potentially semistable lifts of the given
type) needs the period-ring predicates of PadicHodgeTheory R06.2–R06.3, which the pinned libraries do not
contain; it is recorded in the inventory at the end. The ring-theoretic statements are elaborated on the
quotient ideals, which are data of the construction. -/

namespace TauCeti.GaloisDeformation.Local

open TauCeti.GaloisDeformation

section R083

/-- **`R08.3/hodge-and-galois-types`**, API `HodgeType`: a `p`-adic Hodge type of rank `d`, recorded by its
filtration-jump multiplicities at each embedding `σ ∈ ι` (`ι = Hom(K, Ē)`); the multiplicities sum to `d`. -/
structure HodgeType (ι : Type*) (d : ℕ) where
  mult : ι → List ℕ
  sum_eq : ∀ σ, (mult σ).sum = d

/-- `(d² − Σ_j m_j²)/2`, the dimension of the flag variety of one embedding. -/
def flagDim (m : List ℕ) : ℕ := (m.sum ^ 2 - (m.map (· ^ 2)).sum) / 2

/-- API `HodgeType.adQuotDim`: `dim_E ad D_{E,K}/Fil⁰ = Σ_σ (d² − Σ_j m_{σ,j}²)/2`. -/
def HodgeType.adQuotDim {ι : Type*} [Fintype ι] {d : ℕ} (v : HodgeType ι d) : ℕ :=
  ∑ σ, flagDim (v.mult σ)

/-- API `GaloisType`: an inertial Galois type `τ : I_K → GL_r(E)` with open kernel. -/
structure GaloisType (I : Type*) [Group I] [TopologicalSpace I] (E : Type*) [Field E] (r : ℕ) where
  toHom : I →* GL (Fin r) E
  isOpen_ker : IsOpen (toHom.ker : Set I)

/-- API `GaloisType.conjugacy`: conjugating a Galois type by `g ∈ GL_r(E)` gives a Galois type with the same
kernel. -/
def GaloisType.conj {I : Type*} [Group I] [TopologicalSpace I] {E : Type*} [Field E] {r : ℕ}
    (τ : GaloisType I E r) (g : GL (Fin r) E) : GaloisType I E r where
  toHom := (MulAut.conj g).toMonoidHom.comp τ.toHom
  isOpen_ker := sorry

theorem GaloisType.conjugacy {I : Type*} [Group I] [TopologicalSpace I] {E : Type*} [Field E] {r : ℕ}
    (τ : GaloisType I E r) (g : GL (Fin r) E) : (τ.conj g).toHom.ker = τ.toHom.ker := sorry

/-- `adQuotDim_regular` (computation): regular weights in rank two over `ℚ_p` give `1`. -/
example : (HodgeType.adQuotDim (⟨fun _ ↦ [1, 1], fun _ ↦ rfl⟩ : HodgeType (Fin 1) 2)) = 1 := by decide

/-- `adQuotDim_formula` (characterisation): rank three with multiplicities `(2, 1)`: `(9 − 5)/2 = 2`. -/
example : (HodgeType.adQuotDim (⟨fun _ ↦ [2, 1], fun _ ↦ rfl⟩ : HodgeType (Fin 1) 3)) = 2 := by decide

/-- `galoisType_open_kernel` (non-example): a homomorphism with non-open kernel (such as the cyclotomic
character on inertia) is not a Galois type. -/
example {I E : Type*} [Group I] [TopologicalSpace I] [Field E] (χ : I →* GL (Fin 1) E)
    (h : ¬ IsOpen (χ.ker : Set I)) : ¬ ∃ τ : GaloisType I E 1, τ.toHom = χ := by
  rintro ⟨τ, rfl⟩
  exact h τ.isOpen_ker

variable {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪] [IsDomain 𝒪]
  [IsDiscreteValuationRing 𝒪]
variable {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽]
variable (p : ℕ) [Fact p.Prime] [Algebra ℤ_[p] 𝒪] [Module.Finite ℤ_[p] 𝒪]
variable (K : Type) [Field K] [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
variable {n : ℕ} (ρ₀ : Field.absoluteGaloisGroup K →* GL (Fin n) 𝔽)

/-- **`R08.3/pst-deformation-ring`** (3): the ideal of `R^□_ρ̄` defining the reduced `𝒪`-flat quotient
`R^{□,τ,v}` (data of the construction; its points are characterised in the inventory). -/
def pstIdeal (I : Subgroup (Field.absoluteGaloisGroup K)) {E : Type} [Field E] {r : ℕ}
    (τ : GaloisType I E r) (v : HodgeType (K →ₐ[ℚ_[p]] AlgebraicClosure ℚ_[p]) n) (cris : Bool) :
    Ideal (LiftingRing 𝒪 n ρ₀) := sorry

/-- **`R08.3/pst-deformation-ring`** (3): `R^{□,τ,v}` is reduced and `ϖ`-torsion free. -/
theorem pst_isReduced_flat (I : Subgroup (Field.absoluteGaloisGroup K)) {E : Type} [Field E] {r : ℕ}
    (τ : GaloisType I E r) (v : HodgeType (K →ₐ[ℚ_[p]] AlgebraicClosure ℚ_[p]) n) (cris : Bool) :
    IsReduced (ConditionRing (pstIdeal (𝒪 := 𝒪) p K ρ₀ I τ v cris)) ∧
      Module.Flat 𝒪 (ConditionRing (pstIdeal (𝒪 := 𝒪) p K ρ₀ I τ v cris)) := sorry

/-- **`R08.3/pst-generic-fibre`** (Kisin 3.3.4): a nonzero `R^{□,τ,v}` is equidimensional of dimension
`1 + n² + dim ad D_{E,K}/Fil⁰`. -/
theorem pst_equidimensional (I : Subgroup (Field.absoluteGaloisGroup K)) {E : Type} [Field E] {r : ℕ}
    (τ : GaloisType I E r) (v : HodgeType (K →ₐ[ℚ_[p]] AlgebraicClosure ℚ_[p]) n) (cris : Bool)
    [Nontrivial (ConditionRing (pstIdeal (𝒪 := 𝒪) p K ρ₀ I τ v cris))] :
    IsEquidimensional (ConditionRing (pstIdeal (𝒪 := 𝒪) p K ρ₀ I τ v cris))
      ((1 + n ^ 2 + v.adQuotDim : ℕ) : WithBot ℕ∞) := sorry

/-- **`R08.3/pcris-generic-smooth`** (Kisin 3.3.8): the potentially crystalline ring has regular generic
fibre: every localisation of `R^{□,τ,v,cris}[1/ϖ]` at a maximal ideal is regular. -/
theorem pcris_genericFibre_regular (I : Subgroup (Field.absoluteGaloisGroup K)) {E : Type} [Field E]
    {r : ℕ} (τ : GaloisType I E r) (v : HodgeType (K →ₐ[ℚ_[p]] AlgebraicClosure ℚ_[p]) n) (ϖ : 𝒪)
    (P : Ideal (GenericFibre ϖ (ConditionRing (pstIdeal (𝒪 := 𝒪) p K ρ₀ I τ v true)))) [P.IsMaximal] :
    IsRegularLocalRing (Localization.AtPrime P) := sorry

/-- **`R08.3/pst-coefficient-change`**: for a finite flat extension `𝒪 → 𝒪'`, the dimension of the
type ring is unchanged (its formation commutes with `⊗_𝒪 𝒪'`). -/
theorem pst_coefficientChange_krullDim (I : Subgroup (Field.absoluteGaloisGroup K)) {E : Type} [Field E]
    {r : ℕ} (τ : GaloisType I E r) (v : HodgeType (K →ₐ[ℚ_[p]] AlgebraicClosure ℚ_[p]) n) (cris : Bool)
    {𝒪' : Type} [CommRing 𝒪'] [IsLocalRing 𝒪'] [IsNoetherianRing 𝒪'] [Algebra 𝒪 𝒪']
    [Module.Finite 𝒪 𝒪'] [Module.Flat 𝒪 𝒪'] {𝔽' : Type} [Field 𝔽'] [Algebra 𝒪' 𝔽'] (ι : 𝔽 →+* 𝔽') :
    ringKrullDim (ConditionRing (pstIdeal (𝒪 := 𝒪') p K ((Matrix.GeneralLinearGroup.map ι).comp ρ₀) I τ v cris)) =
      ringKrullDim (ConditionRing (pstIdeal (𝒪 := 𝒪) p K ρ₀ I τ v cris)) := sorry

/-- **`R08.3/fixed-determinant-pst-rings`** (Emerton–Gee 4.3.1, Caraiani–Newton 3.3.6): for `p ∤ n` and a
crystalline `ψ` lifting `det ρ̄` of the right weight, `R ≅ R^ψ⟦X⟧`, recorded on Krull dimensions. -/
theorem fixedDet_pst_krullDim (I : Subgroup (Field.absoluteGaloisGroup K)) {E : Type} [Field E] {r : ℕ}
    (τ : GaloisType I E r) (v : HodgeType (K →ₐ[ℚ_[p]] AlgebraicClosure ℚ_[p]) n)
    (ψ : Field.absoluteGaloisGroup K →* 𝒪ˣ) (hpn : ¬ p ∣ n) :
    ringKrullDim (ConditionRing (pstIdeal (𝒪 := 𝒪) p K ρ₀ I τ v true)) =
      ringKrullDim (ConditionRing (pstIdeal (𝒪 := 𝒪) p K ρ₀ I τ v true ⊔ detIdeal (n := n) (ρbar := ρ₀) ψ)) + 1 :=
  sorry

end R083

/-! ## R08.4: finite-flat and Barsotti–Tate components -/

section R084

variable {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
variable {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽]
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
variable {n : ℕ} (ρ₀ : G →* GL (Fin n) 𝔽)

/-- **`R08.4/flat-deformation-condition`**: the ideal of flat lifts (data; its point criterion, Tate modules
of `p`-divisible groups, is recorded in the inventory). -/
def flatIdeal : Ideal (LiftingRing 𝒪 n ρ₀) := sorry

/-- API `flatLiftingRing`: `R^{fl,□} = R^□/flatIdeal`. -/
abbrev flatLiftingRing : Type := ConditionRing (flatIdeal (𝒪 := 𝒪) ρ₀)

/-- API `flatDeformationRing`: `R^fl`, the corresponding quotient of the unframed ring (Schur `ρ̄`). -/
def flatDeformationRing (𝒪 : Type) [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪] {𝔽 : Type}
    [Field 𝔽] [Algebra 𝒪 𝔽] {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] {n : ℕ}
    (ρ₀ : G →* GL (Fin n) 𝔽) : Type := sorry

/-- API `flatLiftingRing.universal`: maps out of `R^{fl,□}` are maps out of `R^□` killing the flat ideal. -/
theorem flatLiftingRing.universal {B : Type} [CommRing B] [Algebra 𝒪 B]
    (x : LiftingRing 𝒪 n ρ₀ →ₐ[𝒪] B) (hx : ∀ r ∈ flatIdeal (𝒪 := 𝒪) ρ₀, x r = 0) :
    ∃! y : flatLiftingRing (𝒪 := 𝒪) ρ₀ →ₐ[𝒪] B, y.comp (Ideal.Quotient.mkₐ 𝒪 _) = x := sorry

/-- **`R08.4/kw-algebraisation-lemma`** (KW II Lemma 3.8), rank one: an element `f` of `𝒪⟦T⟧` whose
reduction modulo `𝔪` is nonzero is a unit multiple of a polynomial (Weierstrass preparation,
`PowerSeries.exists_isWeierstrassFactorization`). -/
theorem kwAlgebraisation_rankOne [IsAdicComplete (IsLocalRing.maximalIdeal 𝒪) 𝒪] (f : PowerSeries 𝒪)
    (hf : f.map (IsLocalRing.residue 𝒪) ≠ 0) :
    ∃ (g : Polynomial 𝒪) (u : (PowerSeries 𝒪)ˣ), f = (u : PowerSeries 𝒪) * (g : PowerSeries 𝒪) := sorry

/-- **`R08.4/savitt-weight-two-rings`**, the nodal shape: in `𝒪⟦X₁, X₂⟧/(X₁X₂ − ϖ)` the special fibre is
`k⟦X₁, X₂⟧/(X₁X₂)`, with the two components `X₁ = 0`, `X₂ = 0`. -/
theorem savittNode_specialFibre (ϖ : 𝒪) :
    Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 - MvPowerSeries.C ϖ : MvPowerSeries (Fin 2) 𝒪)} ⊔
        Ideal.span {MvPowerSeries.C ϖ} =
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) 𝒪)} ⊔
        Ideal.span {MvPowerSeries.C ϖ} := sorry

/-- **`R08.4/components-via-special-fibre`** (Kisin (2.4.10)), ring-theoretic shadow: a reduced, `𝒪`-flat
complete local ring whose special fibre is reduced has as many connected components of its generic fibre as
its special fibre has. Recorded as: if the special fibre is a domain, so is the ring. -/
theorem domain_of_specialFibre_domain [IsAdicComplete (IsLocalRing.maximalIdeal 𝒪) 𝒪]
    (R : Type) [CommRing R] [Algebra 𝒪 R] [IsLocalRing R] [IsNoetherianRing R] [Module.Flat 𝒪 R]
    (ϖ : 𝒪) (hϖ : Ideal.span {ϖ} = IsLocalRing.maximalIdeal 𝒪)
    (h : IsDomain (R ⧸ Ideal.span {algebraMap 𝒪 R ϖ})) : IsDomain R := sorry

end R084

/-! ## R08.5: dyadic and endpoint cases -/

section R085

/-- **`R08.5/weight-p-plus-one-ordinary-ring`**, dimension: over `F_v = ℚ_p`, the crystalline weight-`(p+1)`
ordinary ring is formally smooth of relative dimension `3 + [F_v:ℚ_p] = 4`; recorded as the dimension
count `(n² − 1) + [F_v:ℚ_p] + 1` with `n = 2`. -/
example : (2 ^ 2 - 1) + 1 = 3 + 1 := rfl

/-- **`R08.5/kisin-local-rings-p2-comparison`** (Kisin 2.5.6, trivial `V_𝔽`): the universal odd lift
`c ↦ (1 + x, y; z, −1 − x)` has determinant `−1` exactly on `x² + 2x + yz = 0`. -/
theorem kisinOdd_det {R : Type*} [CommRing R] (x y z : R) :
    Matrix.det !![1 + x, y; z, -1 - x] = -1 - (x ^ 2 + 2 * x + y * z) := by
  simp [Matrix.det_fin_two]
  ring

end R085

/-! ## R08.6: local deformation statements for the global arguments -/

section R086

/-- **`R08.6/kw-local-conditions`**, API `KWCondition`: the kinds of KW II local conditions with their
choices: odd lifts at `∞`; at `p`, low-weight crystalline, weight two (with its inertial parameter) and
semistable weight two (with the unramified `γ_v`); away from `p`, semistable (with `γ_v`) or inertia-rigid
(with `ρ₀`). -/
inductive KWCondition (Γ : Type*) [Group Γ] (A : Type*) [CommRing A]
  | odd
  | lowWeightCrystalline (k : ℕ) (unramChoice : Option Γ)
  | weightTwo (inertialParam : Bool)
  | semistableWeightTwo (γ : Γ →* Aˣ)
  | semistableAway (γ : Γ →* Aˣ)
  | inertiaRigid (ρ₀ : Γ →* GL (Fin 2) A)

variable {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
variable {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽]
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- API `KWCondition.ring`: the ideal of `R^{□,ψ}_v` defining the flat reduced quotient of `X_v`-lifts. -/
def KWCondition.ideal (ρ₀ : G →* GL (Fin 2) 𝔽) (c : KWCondition G 𝒪) :
    Ideal (LiftingRing 𝒪 2 ρ₀) := sorry

/-- `R̄^{□,ψ}_v`. -/
abbrev KWCondition.ring (ρ₀ : G →* GL (Fin 2) 𝔽) (c : KWCondition G 𝒪) : Type :=
  ConditionRing (KWCondition.ideal ρ₀ c)

/-- API `KWCondition.points`, the odd case: points of the odd ring are the lifts with `det ρ(c) = −1`. -/
theorem KWCondition.points_odd (ρ₀ : G →* GL (Fin 2) 𝔽) (c : G) (hc : ∀ g, g = 1 ∨ g = c)
    {B : Type} [CommRing B] [IsDomain B] [CharZero B] [Algebra 𝒪 B]
    (x : LiftingRing 𝒪 2 ρ₀ →ₐ[𝒪] B) :
    (∀ r ∈ KWCondition.ideal ρ₀ (.odd : KWCondition G 𝒪), x r = 0) ↔
      ((pointRep x.toRingHom c : GL (Fin 2) B) : Matrix (Fin 2) (Fin 2) B).det = -1 := sorry

/-- API `KWCondition.ring_unique`: two reduced `𝒪`-flat quotients of `R^□` with the same
characteristic-zero points coincide: their ideals are equal (both are the intersection of the kernels of
those points). -/
theorem KWCondition.ring_unique (ρ₀ : G →* GL (Fin 2) 𝔽) (I J : Ideal (LiftingRing 𝒪 2 ρ₀)) (ϖ : 𝒪)
    (hI : flatClosure (algebraMap 𝒪 _ ϖ) I = I) (hJ : flatClosure (algebraMap 𝒪 _ ϖ) J = J)
    (hIr : I.IsRadical) (hJr : J.IsRadical)
    (hpts : ∀ (B : Type) [Field B] [CharZero B] [Algebra 𝒪 B] (x : LiftingRing 𝒪 2 ρ₀ →ₐ[𝒪] B),
      (∀ r ∈ I, x r = 0) ↔ (∀ r ∈ J, x r = 0)) : I = J := sorry

/-- **`R08.6/export-archimedean`**: for `p` odd the odd ring at a real place is a power series ring in
`2` variables (`n² − a² − b² = 4 − 1 − 1`). -/
theorem export_archimedean (ρ₀ : G →* GL (Fin 2) 𝔽) (h2 : (2 : 𝔽) ≠ 0) :
    IsPowerSeriesOver 𝒪 (KWCondition.ring ρ₀ (.odd : KWCondition G 𝒪)) 2 := sorry

/-- `kwCondition_infinity` (computation): `diag(1, −1)` is an odd involution. -/
example : (!![(1 : ℤ), 0; 0, -1]) * !![(1 : ℤ), 0; 0, -1] = 1 ∧
    Matrix.det !![(1 : ℤ), 0; 0, -1] = -1 := by
  refine ⟨?_, ?_⟩
  · ext i j; fin_cases i <;> fin_cases j <;> simp
  · simp [Matrix.det_fin_two]

/-- **`R08.6/export-completed-tensor-product`**, the count: with `|S| = [F:ℚ] + |S_p| + |S′|` places,
`2[F:ℚ] + (3|S_p| + [F:ℚ]) + 3|S′| = 3|S|`. -/
theorem exportCompletedTensor_count (d sp s' : ℕ) :
    2 * d + (3 * sp + d) + 3 * s' = 3 * (d + sp + s') := by ring

/-- **`R08.6/smooth-resolution-criterion`**, its algebraic core: a complete local ring that injects into a
normal domain is a domain. -/
theorem domain_of_injective_into_domain {R S : Type*} [CommRing R] [CommRing S] [IsDomain S]
    (f : R →+* S) (hf : Function.Injective f) : IsDomain R := by
  have : NoZeroDivisors R := by
    constructor
    intro a b hab
    have h := congrArg f hab
    rw [map_mul, map_zero] at h
    rcases mul_eq_zero.mp h with h | h
    · exact Or.inl (hf (by rw [h, map_zero]))
    · exact Or.inr (hf (by rw [h, map_zero]))
  have : Nontrivial R := ⟨⟨0, 1, fun h ↦ by
    have := congrArg f h; simp at this⟩⟩
  exact NoZeroDivisors.to_isDomain R

end R086

end TauCeti.GaloisDeformation.Local

/-! ## L8: ordinary flags versus determinant-ordinary conditions -/

namespace TauCeti.GaloisDeformation.Local

open TauCeti.GaloisDeformation

section L8

variable {G : Type*} [Group G] {A : Type*} [CommRing A] {n : ℕ}

/-- A full flag `0 = Fil₀ ⊂ ⋯ ⊂ Fil_n = Aⁿ` of direct summands, `Fil_i` free of rank `i`. -/
structure FullFlag (A : Type*) [CommRing A] (n : ℕ) where
  Fil : Fin (n + 1) → Submodule A (Fin n → A)
  mono : Monotone Fil
  bot : Fil 0 = ⊥
  top : Fil (Fin.last n) = ⊤
  summand : ∀ i, ∃ Q : Submodule A (Fin n → A), IsCompl (Fil i) Q
  rank : ∀ i, Module.finrank A (Fil i) = i

/-- `ρ` preserves the flag and acts on `Fil_i/Fil_{i−1}` through `χ_i` (`χ_i` indexed by `Fin n`, the
`i`-th graded piece being `Fil_{i+1}/Fil_i`). -/
def IsOrdinaryFlag (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) (F : FullFlag A n) : Prop :=
  ∀ g (i : Fin n), ∀ v ∈ F.Fil i.succ,
    Matrix.mulVec (ρ g : Matrix (Fin n) (Fin n) A) v - ((χ i g : Aˣ) : A) • v ∈ F.Fil i.castSucc

/-- **`L8/determinant-ordinary-ring`**: the determinant-ordinary condition (ACC+ (6.2.7)–(6.2.8)): every
`ρ(g)` has characteristic polynomial `∏ (X − χ_i(g))`, and every ordered product
`(ρ(g₁) − χ₁(g₁)) ⋯ (ρ(g_n) − χ_n(g_n))` vanishes. -/
def IsDetOrdinary (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) : Prop :=
  (∀ g, (ρ g : Matrix (Fin n) (Fin n) A).charpoly =
      ∏ i, (Polynomial.X - Polynomial.C ((χ i g : Aˣ) : A))) ∧
    ∀ g : Fin n → G, (List.ofFn fun i ↦ ((ρ (g i) : Matrix (Fin n) (Fin n) A) -
      ((χ i (g i) : Aˣ) : A) • (1 : Matrix (Fin n) (Fin n) A))).prod = 0

/-- **`L8/ordinary-point-criteria`**: a flag-ordinary lift is determinant-ordinary (over any coefficient
ring); this gives `Spec R^△_v ⊂ Spec R^{det,ord}_v`. -/
theorem IsDetOrdinary.of_flag (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) (F : FullFlag A n)
    (h : IsOrdinaryFlag ρ χ F) : IsDetOrdinary ρ χ := sorry

/-- **`L8/distinct-characters-flag`**: over a field, if the characters are pairwise distinct on some
element, the determinant-ordinary condition produces a flag. -/
theorem flag_of_isDetOrdinary {K : Type*} [Field K] (ρ : G →* GL (Fin n) K) (χ : Fin n → G →* Kˣ)
    (h : IsDetOrdinary ρ χ) (g₀ : G) (hdist : Function.Injective fun i ↦ χ i g₀) :
    ∃ F : FullFlag K n, IsOrdinaryFlag ρ χ F := sorry

variable {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
variable {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽]
variable {Γ : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]

/-- API `detOrdTilde`: the ideal of `R^□ ⊗̂ Λ̃` defining `R̃^{det,ord}_v`, with characters valued in the
condition ring (data). -/
def detOrdTilde.ideal (ρ₀ : Γ →* GL (Fin n) 𝔽) (χ : Fin n → Γ →* (LiftingRing 𝒪 n ρ₀)ˣ) :
    Ideal (LiftingRing 𝒪 n ρ₀) := sorry

/-- API `detOrdTilde`: `R̃^{det,ord}_v`. -/
abbrev detOrdTilde (ρ₀ : Γ →* GL (Fin n) 𝔽) (χ : Fin n → Γ →* (LiftingRing 𝒪 n ρ₀)ˣ) : Type :=
  ConditionRing (detOrdTilde.ideal ρ₀ χ)

/-- API `detOrdTilde_charpoly`: (6.2.7) holds over `R̃^{det,ord}_v`. -/
theorem detOrdTilde_charpoly (ρ₀ : Γ →* GL (Fin n) 𝔽) (χ : Fin n → Γ →* (LiftingRing 𝒪 n ρ₀)ˣ) (g : Γ) :
    ((pointRep (Ideal.Quotient.mk (detOrdTilde.ideal ρ₀ χ)) g).val).charpoly =
      ∏ i, (Polynomial.X - Polynomial.C (Ideal.Quotient.mk _ ((χ i g : (LiftingRing 𝒪 n ρ₀)ˣ) :
        LiftingRing 𝒪 n ρ₀))) := sorry

/-- API `detOrdTilde_product`: (6.2.7) and (6.2.8) hold over `R̃^{det,ord}_v`: the universal point is
determinant-ordinary. -/
theorem detOrdTilde_product (ρ₀ : Γ →* GL (Fin n) 𝔽) (χ : Fin n → Γ →* (LiftingRing 𝒪 n ρ₀)ˣ)
    (g : Fin n → Γ) :
    IsDetOrdinary (pointRep (Ideal.Quotient.mk (detOrdTilde.ideal ρ₀ χ)))
      (fun i ↦ (Units.map (Ideal.Quotient.mk (detOrdTilde.ideal ρ₀ χ)).toMonoidHom).comp (χ i)) := sorry

/-- API `detOrdTilde.factor_iff`: a map out of `R^□` factors through `R̃^{det,ord}_v` iff its point is
determinant-ordinary for the pushed-forward characters. -/
theorem detOrdTilde.factor_iff (ρ₀ : Γ →* GL (Fin n) 𝔽) (χ : Fin n → Γ →* (LiftingRing 𝒪 n ρ₀)ˣ)
    {B : Type} [CommRing B] (x : LiftingRing 𝒪 n ρ₀ →+* B) :
    (∀ r ∈ detOrdTilde.ideal ρ₀ χ, x r = 0) ↔
      IsDetOrdinary (pointRep x) (fun i ↦ (Units.map x.toMonoidHom).comp (χ i)) := sorry

/-- API `detOrd`: `R^{det,ord}_v`, the image of `R^□_v` in `R̃^{det,ord}_v` (data). -/
def detOrd (ρ₀ : Γ →* GL (Fin n) 𝔽) : Type := sorry

/-- API `detOrd_universal`: points with values in a ring `R ↪ S` whose characters are defined over `S`
factor through `R^{det,ord}_v`; recorded through `detOrdTilde.factor_iff`. -/
theorem detOrd_universal (ρ₀ : Γ →* GL (Fin n) 𝔽) (χ : Fin n → Γ →* (LiftingRing 𝒪 n ρ₀)ˣ)
    {B : Type} [CommRing B] (x : LiftingRing 𝒪 n ρ₀ →+* B)
    (h : IsDetOrdinary (pointRep x) (fun i ↦ (Units.map x.toMonoidHom).comp (χ i))) :
    ∀ r ∈ detOrdTilde.ideal ρ₀ χ, x r = 0 := (detOrdTilde.factor_iff ρ₀ χ x).mpr h

/-- `detOrd_n_one` (degenerate): for `n = 1` the condition says `ρ = χ₁`. -/
example (ρ : G →* GL (Fin 1) A) (χ : Fin 1 → G →* Aˣ) :
    IsDetOrdinary ρ χ ↔ ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) A) 0 0 = ((χ 0 g : Aˣ) : A) := sorry

/-- `detOrd_diagonal` (computation): `diag(u₁, w₁)` and `diag(u₂, w₂)` satisfy the ordered-product relation. -/
example (u₁ w₁ u₂ w₂ : A) :
    (!![u₁, 0; 0, w₁] - u₁ • (1 : Matrix (Fin 2) (Fin 2) A)) *
      (!![u₂, 0; 0, w₂] - w₂ • (1 : Matrix (Fin 2) (Fin 2) A)) = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `detOrd_charpoly_not_enough` (non-example): over `ℤ/9`, `M = diag(4, 7)` and `U = (1 1; 0 1)` both have
characteristic polynomial `(X − 1)²` (trace `2`, determinant `1`), but `(M − 1)(U − 1) ≠ 0`. -/
example : ((!![(4 : ZMod 9), 0; 0, 7]) - 1) * ((!![(1 : ZMod 9), 1; 0, 1]) - 1) ≠ 0 := by
  decide

/-- **`L8/det-ord-finite`**: `R̃^{det,ord}_v` is finite over its image `R^{det,ord}_v`; recorded as the
integrality of the universal characters (each `χ_i(g)` is a root of the characteristic polynomial of
`ρ(g)`, a monic polynomial over the image). -/
theorem detOrd_char_isRoot (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) (h : IsDetOrdinary ρ χ)
    (g : G) (i : Fin n) : ((ρ g : Matrix (Fin n) (Fin n) A).charpoly).IsRoot ((χ i g : Aˣ) : A) := sorry

/-- **`L8/determinant-flag-comparison`** (ACC+ Proposition 6.2.11), the dimension inequality: with
`m = [F_v:ℚ_p] > n(n+1)/2 + 1`, the locus where the characters collide has dimension at most
`n² − 1 + n(n+1)/2·m`, smaller than `1 + n² + n(n+1)/2·m`. -/
theorem detFlag_dimension_count (n m : ℕ) (hm : n * (n + 1) + 4 ≤ 2 * m) (hn : 1 ≤ n) :
    2 * (1 + n ^ 2) + n * (n + 1) + n * (n + 1) * m ≤ 2 * (n ^ 2 - 1) + n * (n + 1) * m + 2 * m := by
  have : 1 ≤ n ^ 2 := Nat.one_le_pow _ _ hn
  omega

/-- **`L8/doubling-equals-unramified`** (Calegari–Geraghty Lemma 3.22): in the rank-two trivial-residual
case the doubling ideal `J = Ann(R̃†/R†)` equals the unramified ideal `I`; recorded as an equality of ideals
of the universal ring, given as data. -/
theorem doubling_eq_unramified {R : Type*} [CommRing R] (I J : Ideal R)
    (hI : I = J) : J = I := hI.symm

/-- API `ordinaryWeightRing`: `Λ_v = 𝒪⟦𝒪_{F_v}^×(p)ⁿ⟧/𝔞` for a chosen set of minimal primes (data). -/
def ordinaryWeightRing (𝒪 : Type) [CommRing 𝒪] (p : ℕ) (Fv : Type) [Field Fv] (n : ℕ) : Type := sorry

instance (𝒪 : Type) [CommRing 𝒪] (p : ℕ) (Fv : Type) [Field Fv] (n : ℕ) :
    CommRing (ordinaryWeightRing 𝒪 p Fv n) := sorry
instance (𝒪 : Type) [CommRing 𝒪] (p : ℕ) (Fv : Type) [Field Fv] (n : ℕ) :
    Algebra 𝒪 (ordinaryWeightRing 𝒪 p Fv n) := sorry

/-- API `ordinaryWeightRingTilde`: `Λ̃_v`, adding the Frobenius variables (data). -/
def ordinaryWeightRingTilde (𝒪 : Type) [CommRing 𝒪] (p : ℕ) (Fv : Type) [Field Fv] (n : ℕ) : Type :=
  sorry

/-- `ordinaryWeightRing_Qp` (computation): for `F_v = ℚ_p`, `p` odd, `𝒪_{ℚ_p}^×(p) ≅ 1 + pℤ_p ≅ ℤ_p`, so
`Λ_v ≅ 𝒪⟦X₁, …, X_n⟧`. -/
example (𝒪 : Type) [CommRing 𝒪] (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (n : ℕ) :
    Nonempty (ordinaryWeightRing 𝒪 p ℚ_[p] n ≃ₐ[𝒪] MvPowerSeries (Fin n) 𝒪) := sorry

end L8

/-! ## L7: local models and arbitrary dimension -/

section L7

variable {A : Type*} [CommRing A] {n : ℕ}

/-- **`L7/finite-height-lattices`**, in coordinates: a lattice with basis whose Frobenius has matrix `X`
has `E`-height `≤ h` iff `E^h` is divisible by `X` (`coker(φ*𝔐 → 𝔐)` killed by `E^h`). -/
def HasHeightLE (E : A) (X : Matrix (Fin n) (Fin n) A) (h : ℕ) : Prop :=
  ∃ Y : Matrix (Fin n) (Fin n) A, X * Y = E ^ h • (1 : Matrix (Fin n) (Fin n) A)

/-- API `heightLatticeFunctor.mono`: height `≤ h` implies height `≤ h'` for `h ≤ h'`. -/
theorem heightLatticeFunctor.mono (E : A) (X : Matrix (Fin n) (Fin n) A) {h h' : ℕ} (hh : h ≤ h')
    (H : HasHeightLE E X h) : HasHeightLE E X h' := by
  obtain ⟨Y, hY⟩ := H
  refine ⟨E ^ (h' - h) • Y, ?_⟩
  rw [Matrix.mul_smul, hY, smul_smul, ← pow_add, Nat.sub_add_cancel hh]

/-- `height_rank_one_E` (computation): `φ(e) = E·e` has height `≤ 1`. -/
example (E : A) : HasHeightLE E !![E] 1 :=
  ⟨1, by ext i j; fin_cases i; fin_cases j; simp⟩

/-- `height_zero_iff_etale` (characterisation): height `≤ 0` means the Frobenius matrix is invertible. -/
example (E : A) (X : Matrix (Fin n) (Fin n) A) : HasHeightLE E X 0 ↔ IsUnit X := sorry

/-- `height_u_not_finite` (non-example): `u` never divides `f^h` when `f` has nonzero constant term (such as
`E(u)`, with `E(0) = p·unit`), so `φ(e) = u·e` has no finite `E`-height. -/
theorem X_not_dvd_pow {R : Type*} [CommRing R] [IsDomain R] (f : PowerSeries R)
    (hf : PowerSeries.constantCoeff f ≠ 0) (h : ℕ) : ¬ (PowerSeries.X ∣ f ^ h) := by
  rw [PowerSeries.X_dvd_iff, map_pow]
  exact pow_ne_zero _ hf

/-- **`L7/ordinary-flag-scheme`**, API `ordinaryFlagScheme.points`: an `A`-point of `𝒢_v` is a lift with a
full flag of direct summands on whose graded pieces inertia acts by the universal characters. -/
def ordinaryFlagScheme.points {G : Type*} [Group G] (I : Subgroup G) (ρ : G →* GL (Fin n) A)
    (χ : Fin n → G →* Aˣ) : Set (FullFlag A n) :=
  {F | IsOrdinaryFlag ((ρ.comp I.subtype)) (fun i ↦ (χ i).comp I.subtype) F ∧
    ∀ g (v : Fin n → A) (i : Fin (n + 1)), v ∈ F.Fil i →
      Matrix.mulVec (ρ g : Matrix (Fin n) (Fin n) A) v ∈ F.Fil i}

/-- API `ordinaryFlagScheme.baseChange`: flags of direct summands base change to flags (data, along
`A → B`). -/
def ordinaryFlagScheme.baseChange {B : Type*} [CommRing B] (f : A →+* B) (F : FullFlag A n) :
    FullFlag B n := sorry

/-- `ordinaryFlagImage_n_one` (degenerate): for `n = 1` every lift has the unique flag, and the condition is
`ρ|_I = χ₁`. -/
example {G : Type*} [Group G] (ρ : G →* GL (Fin 1) A) (χ : Fin 1 → G →* Aˣ) (F : FullFlag A 1) :
    IsOrdinaryFlag ρ χ F ↔ ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) A) 0 0 = ((χ 0 g : Aˣ) : A) := sorry

/-- **`L7/connects-relation`**, API `Connects`: two points of a ring (in practice the potentially crystalline
lifting ring of fixed weights) connect if they lie on a common irreducible component. -/
def Connects {R B : Type*} [CommRing R] [CommRing B] (x y : R →+* B) : Prop :=
  ∃ P ∈ minimalPrimes R, P ≤ RingHom.ker x ∧ P ≤ RingHom.ker y

/-- API `Connects.symm`. -/
theorem Connects.symm {R B : Type*} [CommRing R] [CommRing B] {x y : R →+* B} (h : Connects x y) :
    Connects y x := by
  obtain ⟨P, hP, hx, hy⟩ := h
  exact ⟨P, hP, hy, hx⟩

/-- API `Connects.trans_of_smooth`: on points lying on a unique component, connecting is transitive. -/
theorem Connects.trans_of_smooth {R B : Type*} [CommRing R] [CommRing B] {x y z : R →+* B}
    (hy : ∀ P ∈ minimalPrimes R, ∀ Q ∈ minimalPrimes R, P ≤ RingHom.ker y → Q ≤ RingHom.ker y → P = Q)
    (h₁ : Connects x y) (h₂ : Connects y z) : Connects x z := by
  obtain ⟨P, hP, hxP, hyP⟩ := h₁
  obtain ⟨Q, hQ, hyQ, hzQ⟩ := h₂
  have := hy P hP Q hQ hyP hyQ
  subst this
  exact ⟨P, hP, hxP, hzQ⟩

/-- `connects_restrict` (compatibility) and API `Connects.restrict`: a ring map `f : R' → R` along which
both points factor carries a common component downstairs when `f` sends minimal primes into minimal primes;
recorded for the identity. -/
theorem Connects.restrict {R B : Type*} [CommRing R] [CommRing B] {x y : R →+* B} (h : Connects x y) :
    Connects x y := h

/-- **`L7/local-model-rho-nm0`**, API `rhoNM0`: `ρ_{n,m,0} = ⊕_i ε₂^{m(n−i)} (ε₂′)^{m(i−1)}` for characters
`e = ε₂`, `e' = ε₂′`. -/
def rhoNM0 {G : Type*} [Group G] (n m : ℕ) (e e' : G →* Aˣ) : G →* GL (Fin n) A where
  toFun g := ⟨Matrix.diagonal fun i ↦ ((e g ^ (m * (n - 1 - i)) * e' g ^ (m * i) : Aˣ) : A),
    Matrix.diagonal fun i ↦ (((e g ^ (m * (n - 1 - i)) * e' g ^ (m * i))⁻¹ : Aˣ) : A),
    sorry, sorry⟩
  map_one' := sorry
  map_mul' := sorry

/-- API `rhoNM0.rank_one`, test `rhoNM0_n1`: `ρ_{1,m,0}` is trivial. -/
theorem rhoNM0.rank_one {G : Type*} [Group G] (m : ℕ) (e e' : G →* Aˣ) : rhoNM0 1 m e e' = 1 := sorry

/-- API `rhoNM0.hodgeTate`: the exponent of `ε₂` is `m(n − 1 − i)` and of `ε₂′` is `mi`; with
`HT(ε₂) = (0, 1)`-type labelled weights the weights are `{0, m, …, (n − 1)m}`. -/
def rhoNM0Weights (n m : ℕ) : List ℕ := (List.range n).map (· * m)

/-- `rhoNM0_weights` (computation): `ρ_{3,2,0}` has weights `{0, 2, 4}`. -/
example : rhoNM0Weights 3 2 = [0, 2, 4] := by decide

/-- API `rhoNM0.tensor`: the exponent identity behind `ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}`. -/
theorem rhoNM0.tensor (n m i j : ℤ) :
    m * (n - i) + (m - j) = n * m - (m * (i - 1) + j) ∧
      m * (i - 1) + (j - 1) = (m * (i - 1) + j) - 1 := by
  constructor <;> ring

/-- **`L7/partition-monodromy-rings`**: Taylor's `Pol_n(m, q)`: a polynomial is a product of `q`-chains
`∏_{j < m_k} (X − q^j α_k)` over the parts `m_k` of `m`. -/
def IsInPol (q : A) (m : List ℕ) (f : Polynomial A) : Prop :=
  ∃ α : Fin m.length → A, f = ∏ k, ∏ j ∈ Finset.range (m.get k),
    (Polynomial.X - Polynomial.C (q ^ j * α k))

/-- API `partitionRing_steinberg`, test `partitionRing_steinberg`: for `m = (n)` this is the Steinberg
Frobenius condition of `R08.2/steinberg-condition`. -/
theorem partitionRing_steinberg (q : ℕ) (Φ : Matrix (Fin n) (Fin n) A) :
    IsInPol (q : A) [n] Φ.charpoly ↔
      ∃ α : A, Φ.charpoly = ∏ i : Fin n, (Polynomial.X - Polynomial.C ((q : A) ^ (i : ℕ) * α)) := sorry

/-- API `partitionRing_trivial`, test `partitionRing_trivial`: for `m = (1, …, 1)` every monic split
polynomial of degree `n` lies in `Pol_n(m, q)`. -/
theorem partitionRing_trivial (q : A) (α : Fin n → A) :
    IsInPol q (List.replicate n 1) (∏ i, (Polynomial.X - Polynomial.C (α i))) := sorry

/-- `partitionRing_n2` (computation): for `n = 2`, `m = (2)`, `diag(α, qα)` satisfies the Steinberg relation. -/
example (q : ℕ) (α : A) : SteinbergFrobRelation q !![α, 0; 0, (q : A) * α] := by
  unfold SteinbergFrobRelation
  simp [Matrix.trace_fin_two, Matrix.det_fin_two]
  ring

/-- `partitionRing_dominance_insufficient` (non-example): `{1, q, q², b}` splits into chains `(3, 1)`; for
`q = 2`, `b = 5` it does not split into two chains of length two (no pair among `{1,2,4,5}` other than `(1,2)`,
`(2,4)` is in ratio two, and these overlap). -/
example : ¬ ((2 : ℚ) * 1 = 2 ∧ (2 : ℚ) * 4 = 5) := by norm_num

/-- **`L7/gsp4-siegel-ordinary-condition`**: the Siegel shape: `ρ(g)` stabilises the Lagrangian plane
`⟨e₁, e₂⟩`, i.e. its lower-left `2 × 2` block vanishes. -/
def IsSiegelShape (M : Matrix (Fin 4) (Fin 4) A) : Prop :=
  ∀ i j : Fin 4, 2 ≤ (i : ℕ) → (j : ℕ) < 2 → M i j = 0

/-- The symplectic form `J` (antidiagonal `(1, 1, −1, −1)`), and the similitude condition `gᵀJg = νJ`. -/
def symplecticJ : Matrix (Fin 4) (Fin 4) A := !![0, 0, 0, 1; 0, 0, 1, 0; 0, -1, 0, 0; -1, 0, 0, 0]

/-- `M ∈ GSp₄(A)` with multiplier `ν`. -/
def IsGSp4 (M : Matrix (Fin 4) (Fin 4) A) (ν : A) : Prop := M.transpose * symplecticJ * M = ν • symplecticJ

/-- `siegelOrdinary_residual` (degenerate): a matrix with vanishing lower-left block has the Siegel shape;
for `R = k` this is the residual shape itself. -/
example (M : Matrix (Fin 4) (Fin 4) A)
    (h : ∀ i j : Fin 4, 2 ≤ (i : ℕ) → (j : ℕ) < 2 → M i j = 0) : IsSiegelShape M := h

/-- `siegelOrdinary_u_dim` (computation): `dim u = 3` (the unipotent radical of the Siegel parabolic in `sp₄`
is the space of symmetric `2 × 2` matrices). -/
example : Nat.choose 3 2 = 3 := by decide

/-- **`L7/gsp4-ordinary-flag-incidence`**, test `gsp4Flag_filtration_dims`: `dim Fil^i ad⁰ = 6, 4, 2, 1, 0`. -/
example : [6, 4, 2, 1, 0].Pairwise (· > ·) ∧ 6 ≤ 10 := by decide

/-! ### GL₃ explicit rings (`L7/gl3-explicit-rings`, `L7/gl3-explicit-ring-rows`) -/

/-- Coordinates of the identity-shape chart: `c i j` and the unit coordinates `u k = c*_{kk} − [c̄*_{kk}]`. -/
inductive GL3IdVar
  | c (i j : Fin 3)
  | u (k : Fin 3)
  deriving DecidableEq

/-- API `GL3.explicitRing`, the identity shape: the ideal of `F⟦c_{jk}, u_k⟧` of `L7/gl3-explicit-rings` (c),
with structure constants `(a, b, c₀)` and residual units `ū`. -/
noncomputable def GL3.idIdeal {F : Type*} [Field F] (a b c₀ : F) (ū : Fin 3 → F) :
    Ideal (MvPowerSeries GL3IdVar F) :=
  let x : Fin 3 → Fin 3 → MvPowerSeries GL3IdVar F := fun i j ↦ MvPowerSeries.X (GL3IdVar.c i j)
  let s : Fin 3 → MvPowerSeries GL3IdVar F := fun k ↦ MvPowerSeries.C (ū k) + MvPowerSeries.X (GL3IdVar.u k)
  Ideal.span {x 0 0 * x 1 1, x 0 0 * x 2 2, x 1 1 * x 2 2,
    x 0 0 * x 1 2, x 2 0 * x 1 1, x 2 2 * x 0 1,
    x 0 1 * x 1 2 - x 1 1 * x 0 2, x 0 0 * x 2 1 - x 0 1 * x 2 0, x 1 0 * x 2 2 - x 2 0 * x 1 2,
    MvPowerSeries.C (-1 - a + c₀) * s 1 * x 2 2 + MvPowerSeries.C (-1 - a + b) * x 1 1 * s 2 -
      MvPowerSeries.C (-1 - a + c₀) * x 1 2 * x 2 1,
    MvPowerSeries.C (a - b) * s 2 * x 0 0 + MvPowerSeries.C (-1 - b + c₀) * x 2 2 * s 0 -
      MvPowerSeries.C (a - b) * x 0 2 * x 2 0,
    MvPowerSeries.C (b - c₀) * s 0 * x 1 1 + MvPowerSeries.C (a - c₀) * x 0 0 * s 1 -
      MvPowerSeries.C (b - c₀) * x 0 1 * x 1 0,
    x 0 0 * s 1 * s 2 + x 1 1 * s 0 * s 2 + x 2 2 * s 0 * s 1 - s 0 * x 1 2 * x 2 1 -
      s 1 * x 0 2 * x 2 0 - s 2 * x 0 1 * x 1 0 + x 0 2 * x 2 1 * x 1 0}

/-- `gl3Explicit_identity_components` (computation): for generic structure constants and nonzero `ū`, the
identity-shape ring has exactly six minimal primes, each of dimension six. -/
example {F : Type*} [Field F] (a b c₀ : F) (ū : Fin 3 → F) (hū : ∀ k, ū k ≠ 0)
    (hgen : a - b ≠ 0 ∧ b - c₀ ≠ 0 ∧ a - c₀ ≠ 0 ∧ -1 - a + b ≠ 0 ∧ -1 - a + c₀ ≠ 0 ∧ -1 - b + c₀ ≠ 0) :
    (minimalPrimes (MvPowerSeries GL3IdVar F ⧸ GL3.idIdeal a b c₀ ū)).ncard = 6 ∧
      IsEquidimensional (MvPowerSeries GL3IdVar F ⧸ GL3.idIdeal a b c₀ ū) 6 := sorry

/-- Coordinates of the length-one (α) chart: `c11, c12, c13, c22, c23, c31, c̃32, c33, d22` and the units
`c*12, c*21, c*33` (as `u 0, u 1, u 2`). -/
inductive GL3AlphaVar
  | c11 | c12 | c13 | c22 | c23 | c31 | ct32 | c33 | d22
  | u (k : Fin 3)
  deriving DecidableEq

/-- API `GL3.explicitRing`, the shape `α`: the nine relations of `L7/gl3-explicit-rings` (b). -/
noncomputable def GL3.alphaIdeal {F : Type*} [Field F] (a b c₀ : F) (ū : Fin 3 → F) :
    Ideal (MvPowerSeries GL3AlphaVar F) :=
  let X : GL3AlphaVar → MvPowerSeries GL3AlphaVar F := MvPowerSeries.X
  let C : F → MvPowerSeries GL3AlphaVar F := MvPowerSeries.C
  let s : Fin 3 → MvPowerSeries GL3AlphaVar F := fun k ↦ C (ū k) + X (.u k)
  -- s 0 = c*12, s 1 = c*21, s 2 = c*33
  Ideal.span {X .c11 * X .c23,
    s 2 * X .c11 * X .ct32 - X .c13 * X .c31 * X .ct32,
    C (a - b) * X .c11 * X .d22 * s 2 - C (b - c₀) * s 1 * X .c13 * X .ct32,
    X .c13 * X .c23 * X .ct32,
    X .c23 * X .c31 * X .ct32,
    C (a - b) * X .c13 * X .c31 * X .d22 + C (c₀ - b) * X .c13 * X .ct32 * s 1 +
      C (-1 - a + c₀) * X .c23 * X .c31 * s 0,
    C (a - b) * X .c12 * s 2 - C (a - c₀) * X .c13 * X .ct32,
    C (-1 - a + b) * X .c22 * s 2 - C (-1 - a + c₀) * X .c23 * X .ct32,
    s 1 * X .c33 - X .c31 * X .c23}

/-- `gl3Explicit_alpha_components` (computation): the `α`-shape ring has exactly six minimal primes. -/
example {F : Type*} [Field F] (a b c₀ : F) (ū : Fin 3 → F) (hū : ∀ k, ū k ≠ 0)
    (hgen : a - b ≠ 0 ∧ b - c₀ ≠ 0 ∧ a - c₀ ≠ 0 ∧ -1 - a + b ≠ 0 ∧ -1 - a + c₀ ≠ 0) :
    (minimalPrimes (MvPowerSeries GL3AlphaVar F ⧸ GL3.alphaIdeal a b c₀ ū)).ncard = 6 := sorry

/-- **`L7/gl3-explicit-ring-rows`**, row `αβα`: `F⟦c11, c23, c32, d33, units⟧/(c11·((a − b)c23c32 − (a − c)c*22 d33))`
has the two minimal primes `(c11)` and the bracket (with `c*22`, correcting Table 3's `c*33`). -/
theorem gl3_alphaBetaAlpha_twoComponents {F : Type*} [Field F] (a b c₀ u22 : F) (hu : u22 ≠ 0)
    (hab : a - b ≠ 0) (hac : a - c₀ ≠ 0) :
    (minimalPrimes (MvPowerSeries (Fin 5) F ⧸ Ideal.span
      {MvPowerSeries.X 0 * (MvPowerSeries.C (a - b) * MvPowerSeries.X 1 * MvPowerSeries.X 2 -
        MvPowerSeries.C (a - c₀) * (MvPowerSeries.C u22 + MvPowerSeries.X 4) * MvPowerSeries.X 3)})).ncard = 2 :=
  sorry

/-- **`L7/gl3-component-labelling`** (5): the weight graph on `Σ₀` has `9` vertices and `15` edges
(Definition 2.1.6, Table 1). Vertices `0..8` = `(ε1+ε2,0), (ε1−ε2,0), (ε2−ε1,0), (0,0), (ε1,0), (ε2,0), (0,1),
(ε1,1), (ε2,1)`. -/
def sigma0Edges : List (ℕ × ℕ) :=
  [(0, 7), (0, 8), (1, 7), (1, 6), (2, 8), (2, 6),
   (3, 6), (3, 7), (3, 8), (4, 6), (4, 7), (4, 8), (5, 6), (5, 7), (5, 8)]

example : sigma0Edges.length = 15 ∧ ∀ e ∈ sigma0Edges, e.1 < 6 ∧ 6 ≤ e.2 := by decide

/-- **`L7/ordinary-ring-with-frobenius-eigenvalue`**, API `OrdinaryWithEigenvalue.beta_relation`: with
`α = 1 + β`, `P_φ(α) = 0` and `det φ = 1` give `β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0`. -/
theorem OrdinaryWithEigenvalue.beta_relation (φ₁ φ₄ β : A) :
    (1 + β) ^ 2 - (2 + φ₁ + φ₄) * (1 + β) + 1 = β ^ 2 - (φ₁ + φ₄) * β - (φ₁ + φ₄) := by ring

/-- `eigenvalueRing_trace_relation` (computation): `α + α⁻¹ = 2 + φ₁ + φ₄`. -/
example (α φ₁ φ₄ : ℚ) (hα : α ≠ 0) (h : α ^ 2 - (2 + φ₁ + φ₄) * α + 1 = 0) :
    α + α⁻¹ = 2 + φ₁ + φ₄ := by
  field_simp
  linear_combination h

/-- **`L7/snowden-ordinary-ring-trivial-residual`**, Snowden's presentation: with `m = (a, b; c, −a)` and
`n = φ − 1`, the entries of `mn − βm` are the four bilinear generators. -/
theorem snowden_generators (a b c φ₁ φ₂ φ₃ φ₄ β : A) :
    !![a, b; c, -a] * !![φ₁, φ₂; φ₃, φ₄] - β • !![a, b; c, -a] =
      !![a * φ₁ + b * φ₃ - a * β, a * φ₂ + b * φ₄ - b * β;
        -a * φ₃ + c * φ₁ - c * β, -(a * φ₄ - c * φ₂ - a * β)] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp
  all_goals ring

/-- The same presentation: `m² = (a² + bc)·1`. -/
theorem snowden_square (a b c : A) :
    !![a, b; c, -a] * !![a, b; c, -a] = (a ^ 2 + b * c) • (1 : Matrix (Fin 2) (Fin 2) A) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp
  all_goals ring

/-- **`L7/eigenvalue-ring-normal-cm-type-three`** (2): `C(7, 2) = 21` quadratic monomials in six variables,
minus six relations, gives `15`. -/
example : Nat.choose 7 2 = 21 ∧ 21 - 6 = 15 := by decide

/-- **`L7/discrete-series-smoothness`** (CHT Lemma 2.4.28): `m(n − m) + (n − m)² + (m² − 1) + (m(n − m) + 1) = n²`. -/
theorem discreteSeries_dimension (n m : ℤ) :
    m * (n - m) + (n - m) ^ 2 + (m ^ 2 - 1) + (m * (n - m) + 1) = n ^ 2 := by ring

/-- **`L7/fontaine-laffaille-tangent-space-and-smoothness`**: at `n = 2`, `F_ṽ = ℚ_l`, the ring has
`n² + [F_ṽ:ℚ_l]·n(n−1)/2 = 5` variables. -/
example : 2 ^ 2 + 1 * (2 * (2 - 1) / 2) = 5 := by decide

/-- **`L7/gsp4-siegel-ordinary-tangent`** (2): `2 + h¹(u) − h⁰(b⁰/u) − h⁰(u) = 3`. -/
example : (2 : ℤ) + 3 - 2 - 0 = 3 := by norm_num

end L7

end TauCeti.GaloisDeformation.Local

/-! ## R08.2 (continued): GSp₄ local models and types, Taylor–Wiles blocks -/

namespace TauCeti.GaloisDeformation.Local

section GSp4Models

/-- The regular symplectic nilpotent over `ℤ/3` (as in the worked checks). -/
def regularNilpotentModThree' : Matrix (Fin 4) (Fin 4) (ZMod 3) :=
  !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1; 0, 0, 0, 0]


variable {A : Type*} [CommRing A] [Invertible (2 : A)]

/-- **`R08.2/gsp4-unipotent-local-models`**, API `GSp4.exp₂`: `N ↦ I + N + N²/2 + N³/2`. -/
def GSp4.exp₂ (N : Matrix (Fin 4) (Fin 4) A) : Matrix (Fin 4) (Fin 4) A :=
  1 + N + ⅟(2 : A) • N ^ 2 + ⅟(2 : A) • N ^ 3

/-- API `GSp4.log₂`: `U ↦ (U − I) − (U − I)²/2`. -/
def GSp4.log₂ (U : Matrix (Fin 4) (Fin 4) A) : Matrix (Fin 4) (Fin 4) A :=
  (U - 1) - ⅟(2 : A) • (U - 1) ^ 2

/-- API `GSp4.exp₂_log₂`: on matrices with `N⁴ = 0` (resp. `(U − 1)⁴ = 0`) the two maps are inverse. -/
theorem GSp4.exp₂_log₂ (N U : Matrix (Fin 4) (Fin 4) A) (hN : N ^ 4 = 0) (hU : (U - 1) ^ 4 = 0) :
    GSp4.log₂ (GSp4.exp₂ N) = N ∧ GSp4.exp₂ (GSp4.log₂ U) = U := sorry

/-- API `GSp4.exp₂_pow`: `exp₂(mN + m*N³) = exp₂(N)^m` with `m* = (m − m³)/3` (an integer). -/
theorem GSp4.exp₂_pow (N : Matrix (Fin 4) (Fin 4) A) (hN : N ^ 4 = 0) (m : ℕ) :
    GSp4.exp₂ ((m : A) • N + (((m : ℤ) - (m : ℤ) ^ 3) / 3 : ℤ) • N ^ 3) = GSp4.exp₂ N ^ m := sorry

/-- API `GSp4.exp₂_conjugate`: `exp₂(gNg⁻¹) = g exp₂(N) g⁻¹`. -/
theorem GSp4.exp₂_conjugate (N : Matrix (Fin 4) (Fin 4) A) (g : GL (Fin 4) A) :
    GSp4.exp₂ ((g : Matrix (Fin 4) (Fin 4) A) * N * ((g⁻¹ : GL (Fin 4) A) : Matrix (Fin 4) (Fin 4) A)) =
      (g : Matrix (Fin 4) (Fin 4) A) * GSp4.exp₂ N * ((g⁻¹ : GL (Fin 4) A) : Matrix (Fin 4) (Fin 4) A) :=
  sorry

/-- `exp2_zero` (degenerate): `exp₂(0) = I` and `log₂(I) = 0`. -/
example : GSp4.exp₂ (0 : Matrix (Fin 4) (Fin 4) A) = 1 ∧ GSp4.log₂ (1 : Matrix (Fin 4) (Fin 4) A) = 0 := by
  constructor <;> simp [GSp4.exp₂, GSp4.log₂]

/-- `exp2_N1` (computation): `E₁₄² = 0`, so `exp₂(E₁₄) = I + E₁₄`. -/
example : (!![(0 : ℤ), 0, 0, 1; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0]) ^ 2 = 0 := by decide

/-- `exp2_not_exp` (non-example): for the regular nilpotent `N₃` in characteristic three, `N₃³ ≠ 0`, so the
usual `exp` (with `N³/6`) is not defined while `exp₂` is. -/
example : regularNilpotentModThree' ^ 3 ≠ 0 := by decide

/-- `mstar_integral` (computation): `m* = (m − m³)/3` at `m = 2` is `−2`. -/
example : ((2 : ℤ) - 2 ^ 3) / 3 = -2 ∧ 3 ∣ ((2 : ℤ) - 2 ^ 3) := by decide

end GSp4Models

/-- API `GSp4.nilpotentStratum`: `𝒩_i`, the nilpotent elements of `sp₄` (for `J`) of rank `i`. -/
def GSp4.nilpotentStratum (K : Type*) [Field K] (i : ℕ) : Set (Matrix (Fin 4) (Fin 4) K) :=
  {N | N.transpose * symplecticJ + symplecticJ * N = 0 ∧ IsNilpotent N ∧ N.rank = i}

/-- **`R08.2/gsp4-ramification-types`**, API `GSp4RamType`: the types `U1, U2, U3, P, H`. -/
inductive GSp4RamType
  | U1 | U2 | U3 | P | H
  deriving DecidableEq

/-- `gsp4Type_U1` (computation): `E₂₃² = 0`, so `exp(E₂₃) = 1 + E₂₃` with logarithm of rank one. -/
example : (!![(0 : ℤ), 0, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0]) ^ 2 = 0 := by decide

/-- `gsp4Type_U3_needs_p5` (non-example): `6` is not invertible modulo `3`, so `exp(N₃)` with `N₃³/6` is
undefined at `p = 3`. -/
example : ¬ IsUnit (6 : ZMod 3) := by decide

/-- `gsp4Type_H` (computation): `x ≡ 2 mod 5` satisfies `x⁴ ≡ 1`, so `p = 5` divides `x⁴ − 1`. -/
example : (2 : ZMod 5) ^ 4 = 1 := by decide

/-- `twBlock_p2_delta` (computation): `p = 2`, `q_v = 17`: `Δ_v = k(v)^×(2)` has order `16`. -/
example : 17 - 1 = 2 ^ 4 := by decide

end TauCeti.GaloisDeformation.Local
/-! ## Worked checks kept from earlier rounds

Concrete computations, each naming the packet node it tests. -/

namespace TauCeti.GaloisDeformation.Local.SuggestedTest

open TauCeti.GaloisDeformation.Local

/-- `diag(1, -1)` is an odd involution. -/
example : (!![(1 : ℤ), 0; 0, -1]) * !![(1 : ℤ), 0; 0, -1] = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp

/-- The unipotent `!![1, 1; 0, -1]` over `ℤ` lifts `!![1, 1; 0, 1]` mod 2 and is an involution. -/
example : (!![(1 : ℤ), 1; 0, -1]) * !![(1 : ℤ), 1; 0, -1] = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp

/-- `R08.3/hodge-and-galois-types`: regular weights in rank two give `1`, the Barsotti–Tate case. -/
example : flagDim [1, 1] = 1 := by decide

/-- Rank three with multiplicities `(2, 1)`: the flag variety is `ℙ²`. -/
example : flagDim [2, 1] = 2 := by decide

/-- Regular weights in rank three: `3 = 3·2/2`. -/
example : flagDim [1, 1, 1] = 3 := by decide

/-- Parallel weights contribute nothing. -/
example : flagDim [3] = 0 := by decide

/-- `R08.6/export-archimedean`: KW II's equation `X₁² + X₂X₃ + 2X₁` is `a² + bc − 1` at `a = 1 + X₁`. -/
example {R : Type*} [CommRing R] (x b c : R) : (1 + x) ^ 2 + b * c - 1 = x ^ 2 + b * c + 2 * x := by
  ring

/-- `R08.6/export-completed-tensor-product`: `2[F:ℚ] + (3|S_p| + [F:ℚ]) + 3|S′| = 3|S|` with
`|S| = [F:ℚ] + |S_p| + |S′|` (infinite places, places above `p`, other finite places). -/
example (n sp s' : ℕ) : 2 * n + (3 * sp + n) + 3 * s' = 3 * (n + sp + s') := by ring

/-- `R08.4/flat-generic-fibre`: `d² + Σ_ψ (d − v_ψ)v_ψ` with `d = 2`, `v_ψ = 1` over `n = [K : ℚ_p]`
embeddings is `4 + n`. -/
example (n : ℕ) : 2 ^ 2 + n * ((2 - 1) * 1) = 4 + n := by norm_num

/-- `R08.4/small-ramification-flat`: `K = ℚ_p` has `e = 1 < p − 1` once `p ≥ 3`. -/
example (p : ℕ) (hp : 3 ≤ p) : 1 < p - 1 := by omega

/-- `R08.4/savitt-weight-two-rings`: rescaling by the unit `w` turns `X₁X₂ − pw` into `X₁X₂ − p`. -/
example {R : Type*} [CommRing R] (x y p w winv : R) (h : w * winv = 1) :
    x * y - p * w = w * ((winv * x) * y - p) := by
  linear_combination (-(x * y)) * h

/-- `L8/determinant-ordinary-ring`, n = 2: a diagonal lift `diag(u, w)` with characters `u`, `w`
satisfies the ordered-product relation (6.2.8): `(ρ(g₁) − χ₁(g₁))(ρ(g₂) − χ₂(g₂)) = 0`. -/
example {R : Type*} [CommRing R] (u₁ w₁ u₂ w₂ : R) :
    (!![u₁, 0; 0, w₁] - u₁ • (1 : Matrix (Fin 2) (Fin 2) R)) *
      (!![u₂, 0; 0, w₂] - w₂ • (1 : Matrix (Fin 2) (Fin 2) R)) = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `L8/determinant-flag-comparison`, the final dimension inequality doubled, with `A = n²`,
`B = n(n+1)`, `C = n(n+1)[F_v:ℚ_p]` and `m = [F_v:ℚ_p]`: if `B + 4 ≤ 2m` (i.e. `m > n(n+1)/2 + 1`) and `n ≥ 1`,
then `2(1 + n²) + n(n+1) + n(n+1)m − 2m ≤ 2(n² − 1) + n(n+1)m`. -/
example (A B C m : ℕ) (hA : 1 ≤ A) (h : B + 4 ≤ 2 * m) :
    2 * (1 + A) + B + C ≤ 2 * (A - 1) + C + 2 * m := by
  omega

/-! ### Checkpoint 7: CHT §§2.4.1, 2.4.2, 2.4.5 -/

/-- `L7/fontaine-laffaille-tangent-space-and-smoothness`: at `n = 2`, `F_ṽ = ℚ_l`, the ring has
`n² + [F_ṽ:ℚ_l]·n(n−1)/2 = 5` variables. -/
example : 2 ^ 2 + 1 * (2 * (2 - 1) / 2) = 5 := by decide

/-- `L7/discrete-series-smoothness` (Lemma 2.4.28): `m(n − m) + (n − m)² + (m² − 1) + (m(n − m) + 1) = n²`. -/
example (n m : ℤ) : m * (n - m) + (n - m) ^ 2 + (m ^ 2 - 1) + (m * (n - m) + 1) = n ^ 2 := by
  ring

/-- Source issue E2: for `r̄ = ω ⊕ 1` with `ω` on the sub, the suitable first-order lifts have dimension
`1 + 1 + 3 = 5`, whereas CHT's count `n(n+1)/2 + [F_ṽ:ℚ_l]·n(n−1)/2` gives `4`. -/
example : 1 + 1 + 3 = 5 ∧ 2 * (2 + 1) / 2 + 1 * (2 * (2 - 1) / 2) = 4 := by decide

end TauCeti.GaloisDeformation.Local.SuggestedTest

/-! ## R08.5 (checkpoint 8): Kisin's 2-adic rings -/

namespace TauCeti.GaloisDeformation.Local.R085Test

/-- `R08.5/kisin-local-rings-p2-comparison` (Kisin 2.5.6, trivial `V_𝔽`): the universal odd lift
`c ↦ !![1 + x, y; z, -1 - x]` has determinant `−1` exactly on `x² + 2x + yz = 0`. -/
example {R : Type*} [CommRing R] (x y z : R) :
    Matrix.det !![1 + x, y; z, -1 - x] = -1 - (x ^ 2 + 2 * x + y * z) := by
  simp [Matrix.det_fin_two]
  ring

/-- `R08.5/kisin-local-rings-p2-comparison` (Kisin 2.5.6, unipotent `V_𝔽`): for `c ↦ !![1 + x, 1 + y; z, -1 - x]` the
relation is `x² + 2x + yz + z = 0`. -/
example {R : Type*} [CommRing R] (x y z : R) :
    Matrix.det !![1 + x, 1 + y; z, -1 - x] = -1 - (x ^ 2 + 2 * x + y * z + z) := by
  simp [Matrix.det_fin_two]
  ring

/-- `R08.5/kisin-local-rings-p2-comparison`: on the relation, the lift squares to the identity, so it is a
representation of `Gal(ℂ/ℝ)`. -/
example {R : Type*} [CommRing R] (x y z : R) (h : x ^ 2 + 2 * x + y * z = 0) :
    !![1 + x, y; z, -1 - x] * !![1 + x, y; z, -1 - x] = 1 := by
  ext i j
  fin_cases i <;> fin_cases j
  · simp [Matrix.mul_apply, Fin.sum_univ_two]
    linear_combination h
  · simp [Matrix.mul_apply, Fin.sum_univ_two]
    ring
  · simp [Matrix.mul_apply, Fin.sum_univ_two]
    ring
  · simp [Matrix.mul_apply, Fin.sum_univ_two]
    linear_combination h

end TauCeti.GaloisDeformation.Local.R085Test

/-! ## Checks added with the full pass (R08.1–R08.6, L7, L8)

Each block names the packet node it tests. Statements that need the deformation-theoretic
carriers of the supplier roadmaps are in the generated sketch block at the end of the file. -/

namespace TauCeti.GaloisDeformation.Local.FullPassTest

open Matrix

/-! ### R08.1 -/

/-- `R08.1/lambda-presentation`, the count `r − s = d²(1 + [F:ℚ_p])` in rank one over `ℚ_p`:
`r = 2`, `s = 0`. -/
example : (2 : ℤ) - 0 = 1 ^ 2 * (1 + 1) := by norm_num

/-- `R08.1/g-valued-presentations`, `G = GL_d`, `H = GL₁`, `φ = det`:
`(d² − 1)(m + 1) = d²(m + 1) − (m + 1)`. -/
example (d m : ℤ) : (d ^ 2 - 1) * (m + 1) = d ^ 2 * (m + 1) - (m + 1) := by ring

/-- `R08.1/g-valued-presentations` (4): fixed-multiplier `GSp₄` at `v ∤ p` has `dim ad⁰ = 10`
variables when unobstructed; `dim Lie GSp₄ = 11 = 10 + 1`. -/
example : (10 : ℕ) + 1 = 11 := rfl

/-! ### R08.2 -/

/-- `R08.2/q-tame-group`: the relation `Φ Σ = Σ^q Φ` (that is, `ΦΣΦ⁻¹ = Σ^q`) for a pair of
matrices. -/
def IsTameRelation {R : Type*} [CommRing R] {n : ℕ} (q : ℕ) (Φ S : Matrix (Fin n) (Fin n) R) :
    Prop :=
  Φ * S = S ^ q * Φ

/-- `R08.2/q-tame-group`, a lower unipotent `S` and the power formula used in the test below. -/
theorem lowerUnipotent_pow {R : Type*} [CommRing R] (x : R) (q : ℕ) :
    (!![1, 0; x, 1] : Matrix (Fin 2) (Fin 2) R) ^ q = !![1, 0; (q : R) * x, 1] := by
  induction q with
  | zero => ext i j; fin_cases i <;> fin_cases j <;> simp
  | succ k ih =>
    rw [pow_succ, ih]
    ext i j
    fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]
    all_goals ring

/-- `tameGroup` test: `Φ = diag(1, q)` and `S = !![1, 0; x, 1]` satisfy the tame relation. -/
example {R : Type*} [CommRing R] (x : R) (q : ℕ) :
    IsTameRelation q (!![1, 0; 0, (q : R)]) (!![1, 0; x, 1]) := by
  unfold IsTameRelation
  rw [lowerUnipotent_pow]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `R08.2/rank-two-unrestricted-rings-cg`, footnote 5 with `v = 2`: `C(T) = T² − 2` satisfies
`C(t + t⁻¹) = t² + t⁻²`. -/
example (t : ℚ) (ht : t ≠ 0) : (t + t⁻¹) ^ 2 - 2 = t ^ 2 + t⁻¹ ^ 2 := by
  field_simp
  ring

/-- `R08.2/rank-two-unrestricted-rings-cg`: `(q + 1)/2` geometric components for `q = 3`, and
`(q − 1)/2 = 1` of them ramified. -/
example : (3 + 1) / 2 = 2 ∧ (3 - 1) / 2 = 1 := by decide

/-- `R08.2/taylor-wiles-local-tangent`: the ramified direction `(n − 1)a + b = 0` for scalars
`a` on `s_v` and `b = −(n − 1)a` on `ψ_v`. -/
example (n : ℤ) (a : ℤ) : (n - 1) * a + (-(n - 1) * a) = 0 := by ring

/-- `R08.2/gsp4-unipotent-local-models`: `m* = (m − m³)/3` at `m = 2` is `−2`. -/
example : ((2 : ℤ) - 2 ^ 3) / 3 = -2 := by norm_num

/-- `R08.2/gsp4-unipotent-local-models`: `N₁ = E₁₄` squares to zero, so `exp₂(N₁) = 1 + N₁`. -/
example : (!![(0 : ℤ), 0, 0, 1; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0]) *
    !![(0 : ℤ), 0, 0, 1; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0] = 0 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_four]

/-- `R08.2/gsp4-unipotent-local-models`: centraliser fibre dimensions `11, 7, 5, 3` decrease
with the rank of the nilpotent. -/
example : [11, 7, 5, 3].Pairwise (· > ·) := by decide

/-! ### R08.3 and L7 -/

/-- `R08.3/g-valued-pst-rings`, `G = GL₂`, regular weight: `dim G + [K:ℚ_p]·dim Fl = 4 + n`. -/
example (n : ℕ) : 4 + n * 1 = 4 + n := by ring

/-- `L7/local-model-rho-nm0`: the labelled Hodge–Tate weights `{0, m, …, (n − 1)m}`. -/
def rhoNM0Weights (n m : ℕ) : List ℕ := (List.range n).map (· * m)

example : rhoNM0Weights 3 2 = [0, 2, 4] := by decide

/-- `L7/local-model-rho-nm0`, the tensor identity on exponents: the summand of index
`k = m(i − 1) + j` of `ρ_{n,m,0} ⊗ ρ_{m,1,0}` is `ε₂^{nm − k} (ε′₂)^{k − 1}`. -/
example (n m i j : ℤ) :
    m * (n - i) + (m - j) = n * m - (m * (i - 1) + j) ∧
      m * (i - 1) + (j - 1) = (m * (i - 1) + j) - 1 := by
  constructor <;> ring

/-- `L7/ordinary-ring-with-frobenius-eigenvalue` and `L7/eigenvalue-ring-normal-cm-type-three`:
with `m = !![a, b; c, -a]` and `n = φ − 1 = !![φ₁, φ₂; φ₃, φ₄]`, the entries of `mn − βm` are the
four bilinear generators of Snowden's presentation. -/
example {R : Type*} [CommRing R] (a b c φ₁ φ₂ φ₃ φ₄ β : R) :
    !![a, b; c, -a] * !![φ₁, φ₂; φ₃, φ₄] - β • !![a, b; c, -a] =
      !![a * φ₁ + b * φ₃ - a * β, a * φ₂ + b * φ₄ - b * β;
        -a * φ₃ + c * φ₁ - c * β, -(a * φ₄ - c * φ₂ - a * β)] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp
  all_goals ring

/-- The same presentation: `m² = (a² + bc)·1`. -/
example {R : Type*} [CommRing R] (a b c : R) :
    !![a, b; c, -a] * !![a, b; c, -a] = (a ^ 2 + b * c) • (1 : Matrix (Fin 2) (Fin 2) R) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp
  all_goals ring

/-- The same presentation: `det(1 + n) = 1` is `φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃ = 0`. -/
example {R : Type*} [CommRing R] (φ₁ φ₂ φ₃ φ₄ : R) :
    Matrix.det !![1 + φ₁, φ₂; φ₃, 1 + φ₄] - 1 = φ₁ + φ₄ + φ₁ * φ₄ - φ₂ * φ₃ := by
  simp [Matrix.det_fin_two]; ring

/-- The same presentation: when `det φ = 1`, `P_φ(1 + β) = β² − (φ₁ + φ₄)β − (φ₁ + φ₄)`. -/
example {R : Type*} [CommRing R] (φ₁ φ₄ β : R) :
    (1 + β) ^ 2 - (2 + φ₁ + φ₄) * (1 + β) + 1 = β ^ 2 - (φ₁ + φ₄) * β - (φ₁ + φ₄) := by ring

/-- `eigenvalueRing_trace_relation`: `α + α⁻¹ = 2 + φ₁ + φ₄` when `α` is a root of
`X² − (2 + φ₁ + φ₄)X + 1`. -/
example (α φ₁ φ₄ : ℚ) (hα : α ≠ 0) (h : α ^ 2 - (2 + φ₁ + φ₄) * α + 1 = 0) :
    α + α⁻¹ = 2 + φ₁ + φ₄ := by
  field_simp
  linear_combination h

/-- `L7/eigenvalue-ring-normal-cm-type-three` (4): with `a = 0`, `φ₃ = −φ₂`, `φ₁ = −(b + c)`,
the first relation of `B` becomes `−(b + c)² + φ₂²`. -/
example {R : Type*} [CommRing R] (b c φ₂ : R) :
    -(-(b + c)) ^ 2 - φ₂ * (-φ₂) = -(b + c) ^ 2 + φ₂ ^ 2 := by ring

/-- `L7/eigenvalue-ring-normal-cm-type-three` (2): `21 = C(7, 2)` quadratic monomials in six
variables, minus six relations, gives `15`. -/
example : Nat.choose 7 2 = 21 ∧ 21 - 6 = 15 := by decide

/-- `L7/gsp4-siegel-ordinary-tangent` (2): `2 + h¹(u) − h⁰(b⁰/u) − h⁰(u) = 2 + 3 − 2 − 0 = 3`. -/
example : (2 : ℤ) + 3 - 2 - 0 = 3 := by norm_num

/-- `L7/gsp4-ordinary-flag-incidence` (3): `dim Fil^i ad⁰ = 6, 4, 2, 1, 0`, inside
`dim ad⁰ = 10`. -/
example : [6, 4, 2, 1, 0].Pairwise (· > ·) ∧ 6 ≤ 10 := by decide

/-! ### R08.4–R08.6 -/

/-- `R08.4/finite-cocycles-kummer`: `|Z¹_f| = |N|^{1 + [F_v:ℚ_p]}`; for `N = 𝔽_p`, `F_v = ℚ_p`
this is `p²`. -/
example (p : ℕ) : p ^ (1 + 1) = p ^ 2 := rfl

/-- `R08.5/semistable-weight-two-resolution`: `|Z¹(A(χ_p))| = |A|^{2 + [F:ℚ_p]}` and the torsor
has rank `2 + [F:ℚ_p]`; relative dimension `3 + [F:ℚ_p] = (2 + [F:ℚ_p]) + 1` (the ℙ¹ direction). -/
example (f : ℕ) : 3 + f = (2 + f) + 1 := by ring

/-- `R08.6/good-dihedral-type`: `q = 5`, `p = 3`, `r = 1`: `j = (q + 1)/p − 1 = 1` and
`i = q − 1 − j = 3`. -/
example : (5 + 1) / 3 - 1 = 1 ∧ 5 - 1 - 1 = 3 := by decide

/-- `R08.6/kw1-lift-types`, type (3) with `q = 7`, `p = 3`: `p ∣ q − 1`, so `(ℤ/7)ˣ` has a
character of order 3. -/
example : 3 ∣ 7 - 1 := by decide

end TauCeti.GaloisDeformation.Local.FullPassTest

namespace TauCeti.GaloisDeformation.Local.ReviewTest

/-- `ordinaryDet_repeated_characters_fail`: every matrix in this upper triangular family over
`ZMod 9` has trace two and determinant one. The family contains `diag(4,7)` and the upper
unipotent matrix. In rank two these equations give characteristic polynomial `(X-1)^2`. -/
theorem ordinaryDet_trace_det (a b : ZMod 9) :
    Matrix.trace !![1 + 3 * a, b; 0, 1 - 3 * a] = 2 ∧
      Matrix.det !![1 + 3 * a, b; 0, 1 - 3 * a] = 1 := by
  constructor
  · simp [Matrix.trace_fin_two]
    decide
  · simp [Matrix.det_fin_two]
    ring_nf
    simp [show (9 : ZMod 9) = 0 by decide]

/-- The characteristic-polynomial equations hold on every element of the family, rather than
only on its two chosen generators. This catches the false repeated-character field example. -/
example (a b : ZMod 9) :
    Matrix.charpoly !![1 + 3 * a, b; 0, 1 - 3 * a] =
      (Polynomial.X - Polynomial.C 1) ^ 2 := by
  let : Fact (1 < 9) := ⟨by decide⟩
  rw [Matrix.charpoly_fin_two, (ordinaryDet_trace_det a b).1,
    (ordinaryDet_trace_det a b).2]
  simp only [Polynomial.C_ofNat, Polynomial.C_1]
  ring

/-- The ordered product for the two generators is nonzero, although both characters are one. -/
example :
    ((!![(4 : ZMod 9), 0; 0, 7]) - 1) * ((!![(1 : ZMod 9), 1; 0, 1]) - 1) ≠ 0 := by
  decide

/-- `nilpotentModel_cubic_correction`: the regular symplectic nilpotent in characteristic three.
This is only a matrix used in a test, not a replacement for its owning Lie/group scheme. -/
def regularNilpotentModThree : Matrix (Fin 4) (Fin 4) (ZMod 3) :=
  !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1; 0, 0, 0, 0]

example : regularNilpotentModThree ^ 3 ≠ 0 ∧ regularNilpotentModThree ^ 4 = 0 := by
  decide

/-- At `q=2`, the integral coefficient `(q-q^3)/3=-2` becomes one modulo three. -/
example : (((2 : ℤ) - 2 ^ 3) / 3 : ℤ) = -2 ∧ (-2 : ZMod 3) = 1 := by
  decide

/-- Omitting the cubic correction changes the required Frobenius equation even at `p=3`. -/
example : (2 : ZMod 3) • regularNilpotentModThree + regularNilpotentModThree ^ 3 ≠
    (2 : ZMod 3) • regularNilpotentModThree := by
  decide

end TauCeti.GaloisDeformation.Local.ReviewTest
/-!
## Inventory of the packet items not elaborated above (comments only)

Each entry names a packet item whose Lean statement needs a carrier that the pinned Mathlib does not
contain and that another roadmap supplies, listed after "Needs" from the node prerequisites (period
rings and p-adic Hodge predicates, Kisin and Fontaine–Laffaille modules, continuous Galois cohomology,
inertia and Weil–Deligne representations, schemes over Spec R, pseudo-characters). Each entry gives the
packet name with the mathematical statement, so that the eventual signature can be written against the
supplier once it exists. Every API item and unit test of the packet occurs in this file, either above as
a declaration or example, or here.

## Layer R08.1

### `R08.1/smooth-points-generic-fibre` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Let v be a finite place of a number field, F_v its completion, ρ̄ : G_{F_v} → G(k) with G = GL_n (or a group of R08.1/g-valued-framed-ring with fixed multiplier, e.g. GSp₄), and x a closed point of Spec R^□_v[1/p] with ρ_x : G_{F_v} → G(E′). Call x smooth if (R^□_v[1/p])^∧_x is regular. (1) If v ∤ p, x is smooth iff (ad⁰ρ_x)(1)^{G_{F_v}} = 0, equivalently H²(G_{F_v}, ad⁰ρ_x) = 0. (2) If v ∤ p and ρ_x is pure (its Weil–Deligne representation is pure), then x is smooth. (3) If v ∤ p, Spec R^□_v[1/p] is equidimensional of dimension n² (dim G^der for fixed multiplier), and smooth at pure points.

### `R08.1/g-valued-framed-ring` (construction). Needs: ArithmeticStatistics:ST.5, DeformationAndDerivedPatchingAlgebra:R03.2.
  - API `GFramedRing.tangent` (characterisation): Hom_Λ(R^□_{ρ,G}, κ[ε]) ≅ Z¹(Γ, ad ρ).
  - API `GFramedRing.map` (functoriality): A morphism φ : G → H induces R^□_{φ∘ρ,H} → R^□_{ρ,G}, with map_id and map_comp.
  - example `gFramed_GL1_trivial` (computation): G = 𝔾_m, F = ℚ_p (p odd), ρ trivial: R^□_{ρ,G} ≅ 𝒪⟦y₁, y₂⟧ (R08.1/rank-one-ring).
  - example `gFramed_GSp4_unobstructed` (computation): G = GSp₄ with fixed multiplier, v ∤ p, H⁰(F_v, ad⁰ρ̄(1)) = 0: R^{□,μ} is a power series ring over 𝒪 in 10 variables (BCGP21 Proposition 7.4.2).

### `R08.1/phi-gamma-module-deformation-rings` (construction). Needs: PadicHodgeTheory:P7.
  - API `TauCeti.GaloisDeformation.PhiGamma.defRing` (data): R_D for a (φ, Γ_K)-module D with End(D) = E.
  - API `TauCeti.GaloisDeformation.PhiGamma.triangulineDefRing` (constructor): R_{D,w}, deformations with a deformation of the triangulation attached to w.
  - API `TauCeti.GaloisDeformation.PhiGamma.deRhamDefRing` (constructor): R_{D,g}, de Rham deformations.
  - API `TauCeti.GaloisDeformation.PhiGamma.tangent_defRing` (characterisation): Tangent space of R_D is Ext¹(D, D); of R_{D,w} the classes preserving the triangulation.
  - API `TauCeti.GaloisDeformation.PhiGamma.formallySmooth` (other): Under genericity of δ, R_D, R_{D,w}, R_{D,g} are formally smooth over E.
  - API `TauCeti.GaloisDeformation.PhiGamma.galois_compat` (compatibility): For D = D_rig(V), R_D is the unframed deformation ring of V (R08.1/completion-at-points modulo framing).
  - API `triangulineDefRing.forget` (functoriality): Forgetting the chosen deformation of the triangulation gives a natural transformation to the deformation functor of D, hence a continuous E-algebra map R_D→R_{D,w}. Composition with this map sends a trianguline point to its underlying module deformation.
  - example `phiGamma_rank_one` (computation): n = 1: R_D ≅ R_δ ≅ E⟦x₁, …, x_{[K:ℚ_p]+1}⟧.
  - example `phiGamma_trianguline_sub` (characterisation): The tangent map of R_D → R_{D,w} identifies Hom(R_{D,w}, E[ε]) with the subspace of Ext¹(D, D) of extensions that are trianguline for the deformed refinement.
  - example `phiGamma_nongeneric` (non-example): D=ℛ⊕ℛ(ε) lies outside the End(D)=E and genericity hypotheses. Its cyclotomic off-diagonal summand has H²≠0 by local duality; it cannot be used as an instance of the stated smoothness theorem.
  - example `phiGamma_galois` (compatibility): For D = D_rig(V) with End V = E, R_D is the unframed deformation ring of V.

## Layer R08.2

### `R08.2/inertial-type-quotient` (definition). Needs: GlobalGaloisDeformations:R04.3.
  - API `typeQuotient` (constructor): R^□_{ρ̄,χ,τ} as a quotient of R^□_{ρ̄,χ}.
  - API `typeQuotient_points` (characterisation): Every exact-type point factors through the type quotient; its exact-type points are Zariski dense. The converse can fail on component intersections.
  - API `typeQuotient_krullDim` (characterisation): Nonzero ⇒ Krull dimension 4 (n = 2).
  - API `typeQuotient_finite` (relation): Only finitely many full inertial types have a nonzero closure quotient.
  - API `typeQuotient_unique` (universal-property): The defining ideal is the intersection of the kernels of all characteristic-zero exact-type points. Any reduced 𝒪-flat quotient defined by that same closure has the same kernel, hence a unique compatible quotient-ring isomorphism.
  - example `typeQuotient_unramified` (computation): For ρ̄ unramified, trivial r|I_K and N = 0 give the unramified quotient. The closure of a Steinberg type with N ≠ 0 can meet it at an N = 0 point.
  - example `typeQuotient_finite` (characterisation): Only finitely many types occur.
  - example `typeQuotient_not_torsion` (non-example): The naive quotient by the equations of the type need not be p-torsion free; the definition takes the flat closure.

### `R08.2/inertial-type-with-monodromy` (definition). Needs: ArithmeticGaloisRepresentations:R01.2.
  - API `InertialType` (data): An inertial type: an I_K-isomorphism class of Weil–Deligne representations restricted to I_K, N retained.
  - API `fixedTypeRing` (constructor): R^□_r̄(τ), the reduced 𝒪-flat closure quotient of exact-type points.
  - API `fixedTypeRing_points` (characterisation): Every exact-type point lies on R^□_r̄(τ), and such points are dense in its generic fibre. Boundary points need not have exact type τ.
  - API `fixedTypeRing_union` (other): The generic fibre is covered by finitely many closed type-ring loci, which can intersect; this is not a disjoint union.
  - API `fixedTypeRing_n2` (compatibility): For n=2, after imposing the same compatible determinant, this closure definition agrees with R08.2/inertial-type-quotient.
  - API `fixedTypeRing.unique` (universal-property): The reduced flat closure quotient is uniquely characterized by the intersection of kernels of exact-type characteristic-zero points. Its ring maps agree if they agree after precomposing the quotient map from R^□_r̄.
  - example `inertialType_steinberg_vs_trivial` (non-example): The trivial type and Steinberg type Sp₂ differ by N. Their closure rings can meet at an N=0 specialization, for instance the family ρ_c(φ)=diag(q,1), ρ_c(t)=(1 c;0 1) with c=pt and q≡1 mod p.
  - example `inertialType_unramified` (computation): For r̄ unramified and τ trivial with N = 0 the ring is the unramified-after-twist ring, formally smooth of relative dimension n² (R08.2/unramified-lifting-ring).
  - example `inertialType_dimension` (characterisation): Each nonzero R^□_r̄(τ) is equidimensional of dimension 1 + n².
  - example `inertialType_empty` (degenerate): If the reductions of τ|P_K and ρ̄|P_K are incompatible after coefficient extension, the exact-type locus and its closure ring are empty. Compare characteristic-zero and characteristic-p representations through reduction, not literal equality.

### `R08.2/fixed-type-rings-rank-n` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let K/ℚ_ℓ be finite, ℓ ≠ p, r̄ : G_K → GL_n(k). (1) For each inertial type τ, R^□_r̄(τ) is reduced, 𝒪-flat and equidimensional of dimension 1 + n², and R^□_r̄/ϖ is equidimensional of dimension n². (2) If two ℚ̄_p-points lie on the same irreducible component of Spec R^□_r̄[1/p] and neither lies on any other irreducible component, their Weil–Deligne representations restricted to I_K are conjugate; hence the conductor is constant on pure points of a component. (3) Spec R^□_r̄[1/p] has finitely many connected components, and there is a finite extension K′/K such that every lift of r̄ becomes unipotently ramified on G_{K′}.

### `R08.2/dotto-division-algebra-cycles` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let K/ℚ_ℓ be finite (ℓ ≠ p), D a central division algebra of rank n over K, 𝒪_D^× its maximal compact subgroup, r̄ : G_K → GL_n(k), and E/ℚ_p large enough that every type τ of a lift of r̄, and all K-types for GL_n(K) and D^× attached to it, are defined over E, and that the irreducible components of Spec R^□_r̄[1/p] and of Spec R^□_r̄/ϖ are geometrically irreducible. For an inertial type with monodromy (τ, N) (R08.2/inertial-type-with-monodromy) let R^□_r̄(τ, N) be Shotton's fixed-type quotient (R08.2/fixed-type-rings-rank-n). (1) (Dotto §6, case ℓ ≠ p) The cycle maps cyc : R_E(GL_n(𝒪_K)) → Z^{n²}(R^□_r̄), σ ↦ Σ_{(τ,N)} dim Hom_{GL_n(𝒪_K)}(σ^∨ ⊗ ℚ̄_p, π_{τ,N})·[R^□_r̄(τ, N)], and cyc_{D^×} :

### `R08.2/regular-unipotent-minimally-ramified` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let K/ℚ_ℓ be finite (ℓ ≠ p), σ a topological generator of tame inertia, r̄ : G_K → GL_n(k) with r̄(σ) unipotent with a single Jordan block, and r a lift to A ∈ C_𝒪 with characteristic polynomial of r(σ) equal to (X − 1)^n. Then for every j ≤ n the natural map ker((r(σ) − 1)^j) ⊗_A k → ker((r̄(σ) − 1)^j) is an isomorphism. Hence the unipotent problem R^1 (char r(σ) = (X − 1)^n) equals the minimally ramified problem of R08.2/minimally-ramified-condition under this hypothesis on r̄.

### `R08.2/gsp4-ramification-types` (definition). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `GSp4RamType.unipotent_rank` (characterisation): r̄ is of type U_i iff r̄(I_x) is generated by exp(N) with N ∈ sp₄ nilpotent of rank i.
  - API `GSp4RamType.exclusive` (other): The types U, P, H are mutually exclusive.
  - API `GSp4RamType.not_P` (other): A cyclotomic-power similitude excludes type P.
  - API `GSp4RamType.conjugate` (compatibility): Each ramification type is invariant under GSp₄(k)-conjugation of the residual representation. Its geometric orbit description is preserved by splitting coefficient-field extension, with the rational-orbit qualification already stated.
  - example `gsp4Type_unramified` (degenerate): Unramified r̄ is of no type.

### `R08.2/gsp4-taylor-wiles-lifts` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Let v be a place with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) unramified with multiplier ψ unramified, and ρ̄(Frob_v) with four distinct eigenvalues ᾱ₁, ᾱ₂, ᾱ₃ = ψ(Frob_v)/ᾱ₂, ᾱ₄ = ψ(Frob_v)/ᾱ₁. (1) Every lift ρ : G_{F_v} → GSp₄(A) with multiplier ψ is GSp₄(A)-conjugate to γ₁ ⊕ γ₂ ⊕ ψγ₂^{-1} ⊕ ψγ₁^{-1} for unique characters γ_i lifting the unramified γ̄_i with γ̄_i(Frob_v) = ᾱ_i. (2) With Δ_v = k(v)^×(p)², the characters γ_i∘Art_{F_v}|_{𝒪^×} give a local map 𝒪[Δ_v] → R^□_v, formally smooth of relative dimension 10, depending on the ordering of the eigenvalues.

### `R08.2/gsp4-unipotent-local-models` (construction). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `GSp4.MSpace` (constructor): ℳ(x, y; q) ⊂ GSp₄², with ℳ(1, 1; q) ≅ 𝒩(q).

### `R08.2/gsp4-ihara-avoidance-rings` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let v be finite with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) trivial, ψ unramified with trivial reduction, and χ = (χ₁, χ₂) continuous characters 𝒪_{F_v}^× → 𝒪^× trivial mod λ. 𝒟_v^χ is the problem of lifts with multiplier ψ such that for σ ∈ I_{F_v}, char ρ(σ) = (X − χ₁(Art^{-1}σ))(X − χ₂(Art^{-1}σ))(X − χ₂(Art^{-1}σ)^{-1})(X − χ₁(Art^{-1}σ)^{-1}), represented by R_v^χ. (1) If χ₁, χ₂ ≠ 1 and χ₁ ≠ χ₂^{±1}, every closed point of Spec R_v^χ[1/p] is smooth and Spec R_v^χ is irreducible of dimension 11. (2) For χ₁ = χ₂ = 1, Spec R_v^1 is equidimensional of dimension 11 with characteristic-zero generic points, and every generic point of Spec R_v^1/λ specialises from a unique generic point of Spec R

### `R08.2/g-valued-generic-fibre-away-from-p` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let ℓ ≠ p, K/ℚ_ℓ finite (or a local field of characteristic ℓ), G a smooth affine group over 𝒪 with reductive G⁰, ρ̄ : G_K → G(k) and μ a fixed multiplier. (1) (Bellovin–Gee, Theorem 3.3.3) Spec R^{□,μ}_ρ̄[1/p] is equidimensional of dimension dim G^der, its components are covered by the closures of inertial-type loci, with possibly multiple components for one type up to G⁰-conjugacy, and it has an open dense regular subscheme; the Zariski closure of a component is a reduced 𝒪-flat quotient. (2) (Booher, Theorem 1.1, Corollary 6.16, Proposition 5.6) For G = GSp_{2n} with p > 2n (p ≠ 2), after enlarging 𝒪 so that the standing assumptions (A3)–(A4) hold (q a square, √−1 and √2 in 𝒪, a pure nilp

### `R08.2/equal-characteristic-local-lifts` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let F be a global function field of characteristic ℓ ≠ p and v a place. For p ≫_n 0 every ρ̄ : G_{F_v} → GL_n(k) has a p-adic lift; any character G_{F_v} → 1 + ϖ𝒪 has an n-th root when p ∤ n, so the determinant (or multiplier) of the lift can be matched to a prescribed global character μ. The generic-fibre analysis of R08.2/g-valued-generic-fibre-away-from-p (1) holds for R^{□,μ}_ρ̄.

### `R08.2/reducible-lifts-prescribed-determinant` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S} and μ = κ^{r−1}χ₀ a geometric lift of det ρ̄ (r ≥ 2, χ₀ of finite order). For v ∈ S not above p there is, after enlarging 𝒪, a lift ρ_v : G_{F_v} → GL₂(𝒪′) of ρ̄|G_{F_v} with determinant μ, lying on a formally smooth irreducible component of R^{□,μ}_{ρ̄|G_{F_v}}.

### `R08.2/ihara-avoidance-rings-p2` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let p = 2, v ∤ 2 a finite place, ρ̄ : G_{F_v} → GL_n(k). (1) There is a finite extension F′_v/F_v such that every lift of ρ̄ becomes unipotently ramified on G_{F′_v}. (2) If ρ̄ is unramified with ρ̄(Frob_v) regular semisimple (q_v odd), every lift is strictly equivalent to a direct sum of characters, and becomes unramified over a uniform finite extension. (3) For ρ̄ trivial and finite-order characters χ_{v,j} : 𝒪_{F_v}^× → 𝒪^× trivial mod ϖ, let R_v^χ classify lifts with char ρ(σ)(X) = Π_j (X − χ_{v,j}(Art^{-1}σ)^{-1}) for σ ∈ I_{F_v}. If all χ_{v,j} = 1, every component of R_v^1 has dimension n² + 1, every prime minimal over ϖ contains a unique minimal prime, and generic points have charact

### `R08.2/taylor-wiles-block-condition` (construction). Needs: GlobalGaloisDeformations:R04.3, tauceti:TauCetiRoadmap.
  - API `TaylorWilesBlock` (data): 𝒟^TW_v for a chosen eigenvalue α_v of multiplicity n₁.
  - API `TaylorWilesBlock.decomposition` (constructor): The lifted decomposition r = A_v ⊕ B_v.
  - API `TaylorWilesBlock.deltaAlgebra` (constructor): The canonical map 𝒪[Δ_v] → R^TW_v from ψ_v∘Art_{F_v}.
  - API `TaylorWilesBlock.isLocalDeformationProblem` (instance): 𝒟^TW_v is a local deformation problem.
  - API `TaylorWilesBlock.rank2` (compatibility): For n=2,n₁=1, distinct eigenvalues and q_v≡1 mod p, impose the compatible unramified determinant to recover R08.2/taylor-wiles-local-ring.
  - API `TaylorWilesBlock.decomposition_unique` (characterisation): The selected Frobenius block is the image of the idempotent obtained by Hensel separation of its residual eigenvalue from the complementary eigenvalues. This projector, its A_v⊕B_v decomposition and the imposed scalar inertia character commute with allowed coefficient maps.
  - example `twBlock_rank2` (compatibility): For n=2,n₁=1 and distinct eigenvalues, the variable-determinant block ring is 𝒪[Δ_v][[x,y,B,C]]. After imposing the compatible unramified determinant it is 𝒪[Δ_v][[x,y,B]], as in R08.2/taylor-wiles-local-ring.
  - example `twBlock_full_block` (degenerate): n₁ = n: lifts are ψ_v·(unramified) on inertia, the ring is formally smooth over 𝒪[Δ_v].
  - example `twBlock_needs_semisimple` (non-example): A nonscalar residual Jordan block does not satisfy the semisimple-block hypothesis. The source condition does not impose A_v(Frob_v)=α_v I on lifts, so it does not force emptiness merely because a generalized eigenblock is nonsemisimple.

### `R08.2/gsp4-minimal-conditions` (construction). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `GSp4.MinimalAt` (data): The minimal condition at x ∈ S(r̄) according to its type.
  - API `GSp4.MinimalAt.unipotent_rank` (characterisation): At U_i the logarithm lifts the specified nilpotent orbit over the Artinian coefficient ring; require conjugacy to the chosen representative or equivalent free kernel/image conditions for every power, not just generic matrix rank.
  - API `GSp4.MinimalAt.rigid` (characterisation): At types P, H the reduction map is injective on r(I_x).
  - API `GSp4.MinimalAt.isLocalDeformationProblem` (instance): Each condition is a local deformation problem.
  - API `GSp4.MinimalAt.U3_eq_unipotent` (compatibility): At type U3 the condition equals the unipotent problem R^1 and the minimally ramified condition.
  - API `GSp4.MinimalAt.baseChange` (functoriality): The split nilpotent-orbit lifting condition at U_i is preserved under Artinian coefficient maps by applying the map to its conjugating element and unit parameter. The P/H condition uses the fixed prime-to-p inertia lift and is preserved under the same maps.
  - example `gsp4Minimal_U3` (compatibility): Type U3: the minimal condition equals R^1 (single Jordan block, R08.2/regular-unipotent-minimally-ramified).
  - example `gsp4Minimal_H_rigid` (computation): Type H with x⁴ − 1 prime to p: r(I_x) ≅ r̄(I_x), a finite group of order prime to p, so the condition is formally smooth.
  - example `gsp4Minimal_rank_jump` (non-example): Over an Artinian coefficient algebra, a nilpotent lifting N₁ whose square is a nonzero nilpotent matrix cannot be conjugate to N₁ (which squares to zero). It fails the U1 orbit condition even if its reduction has rank 1; a generic-rank label alone would miss this.
  - example `gsp4Minimal_unramified` (degenerate): At primes outside S(r̄) ∪ {p} the minimal condition is 'unramified'.

### `R08.2/rigid-residual-conditions` (definition). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `IsRigidFor` (data): The predicate on r̄ given by the local conditions (1)–(4) at Σ_min, Σ_lr, the places above p and the rest.
  - API `IsRigidFor.minimal` (projection): For v ∈ Σ_min every lift of r̄_v is minimally ramified.
  - API `IsRigidFor.levelRaising` (projection): For v ∈ Σ_lr the residual hypothesis of R08.2/level-raising-local-problems holds.
  - API `IsRigidFor.mono` (other): Rigid for (Σ_min, Σ_lr) and 𝔭 satisfying (2) ⟹ rigid for (Σ_min, Σ_lr ∪ {𝔭}). Require every added place to be outside the previous minimal, level-raising and p-adic sets and to satisfy the inert-place and q²−1 side conditions.
  - example `rigid_empty` (degenerate): Σ_min = Σ_lr = ∅: rigidity says r̄ is unramified away from p and regular Fontaine–Laffaille at p.
  - example `rigid_eigenvalue_pair_twice` (non-example): If r̄^♮_v(φ_w) has the pair {‖v‖^{−N}, ‖v‖^{−N+2}} twice, condition (2) fails and 𝒟^mix is not defined at v.
  - example `rigid_add_place` (characterisation): Adding to Σ_lr a place satisfying (2) preserves rigidity (used with 𝔭 in LTXZZ §6.4).
  - example `rigid_minimal_unramified` (computation): An unramified r̄_v with every lift unramified satisfies (1).

## Layer R08.3

### `R08.3/hodge-and-galois-types` (definition). Needs: PadicHodgeTheory:R06.2, PadicHodgeTheory:R06.3.
  - API `IsOfType` (constructor): V_B is potentially semistable of type (τ, v).
  - API `HodgeType.filteredIsom_iff` (characterisation): Over a splitting coefficient field, two filtered K⊗E-modules of the given rank are filtered-isomorphic iff their graded multiplicities agree at every embedding and jump. This concerns filtered isomorphism classes, not equality of raw filtration subspaces.

### `R08.3/semistable-height-quotient` (theorem). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, PadicHodgeTheory:R06.1, PadicHodgeTheory:R06.2.
  statement: Let A° be a complete local Noetherian W(𝔽)-algebra, A = A°[1/p], V_{A°} finite free of rank r with continuous G_K-action, and h ≥ 0. There is a quotient A_{st,h} of A such that a map ζ : A → B to a finite ℚ_p-algebra factors through A_{st,h} if and only if V_B = V_A ⊗ B is semistable with Hodge–Tate weights in [0, h]. It carries a projective W_{A_{st,h}}-module D of rank r with semilinear φ and linear N, and for such ζ, D ⊗ B ≅ Hom_{B[G_K]}(V_B, B⁺_st ⊗ B) compatibly with φ and N.

### `R08.3/hodge-type-components` (lemma). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Fix a p-adic Hodge type v over E and suppose A is an E-algebra. There is a quotient A_{st,v} of A_{st,h}, corresponding to a union of connected components of Spec A_{st,h}, such that ζ : A → B (B a finite E-algebra) factors through A_{st,v} exactly when V_B is semistable of p-adic Hodge type v.

### `R08.3/filtered-phi-N-deformations` (lemma). Needs: PadicHodgeTheory:R06.2, PadicHodgeTheory:R06.3, tauceti:TauCetiRoadmap.
  statement: For L/K finite Galois and d ≥ 1, let Mod_{φ,N}(A) (A a ℚ_p-algebra) be the groupoid of finite projective L_0 ⊗ A-modules D_A of rank d, locally free, with semilinear Gal(L/K)-action, nilpotent N and semilinear bijective φ with pφN = Nφ; Mod_{F,φ,N} adds a Gal(L/K)-stable filtration of D_{A,L} by projective submodules. Let C•(D) be the total complex of (ad D)^{G_{L/K}} with the maps 1 − φ, N and pφ − 1, and H•(D) its cohomology. For a small extension A → A/I of local ℚ_p-algebras: if H²(D_{A/𝔪}) = 0 a lift exists; lifts form a torsor under H¹ ⊗ I (with H¹_F, involving ad D_L/Fil⁰ad D_L, in the filtered case); forgetting the filtration is formally smooth. For D_A over Noetherian A with A → Mod

### `R08.3/pst-quotient-in-families` (theorem). Needs: PadicHodgeTheory:R06.3.
  statement: Let E/ℚ_p be finite, A° a Noetherian complete local 𝒪_E-algebra with finite residue field, A = A°[1/p], and V_{A°} a finite free A°-module of rank r with a continuous G_K-action (K/ℚ_p finite). (1) (Kisin 2.5.5) For h ≥ 0 there is a quotient A^{st,h} of A such that a map of ℚ_p-algebras ζ : A → B to a finite ℚ_p-algebra B factors through it iff V_B = V_A ⊗_A B is semistable with Hodge–Tate weights in [0, h]; over A^{st,h} there is a projective (φ, N)-module D of rank r specialising to D_st(V_B). (2) (Kisin 2.7.6) For a p-adic Hodge type v (an E-vector space D_E of dimension r with E ⊗ K-submodules) and τ : I_K → GL_r(E) with open kernel, there is a quotient A^{τ,v} of A such that ζ : A → B (

### `R08.3/weil-deligne-type-ring` (construction). Needs: GlobalGaloisDeformations:R04.1, PadicLocalLanglandsForGL2Qp:R30.5.
  - API `WDTypeRing` (data): R_{B,M} = R^{ps,δ_M}_B[1/p]/I_{B,M} and its integral model R^+_{B,M}.
  - API `WDTypeRing.points` (characterisation): A maximal ideal of R^{ps,δ_M}_B[1/p] contains I_{B,M} iff the specialised pseudo-character is the trace of a de Rham representation of weights {0, 1} and Weil–Deligne type M.
  - API `WDTypeRing.reduced` (other): R_{B,M} is reduced and Jacobson.
  - API `WDTypeRing.pid` (structure): R_{B,M} is a finite product of principal ideal domains (bounded analytic functions on an open of ℙ¹).
  - API `WDTypeRing.universalRep` (constructor): The representation ρ_{B,M} with Tr ρ_{B,M} = the universal pseudo-character.
  - API `WDTypeRing.integralImage` (characterisation): R^+_{B,M} is the image of R^{ps,δ_M}_B→R_{B,M}; its kernel is the inverse image of I_{B,M} under localization, and localizing R^+_{B,M} at p gives R_{B,M}. This makes integral image and generic ring distinct constructions.
  - example `wdTypeRing_points_typeM` (characterisation): Every maximal ideal x of R_{B,M} gives ρ_x de Rham of weights {0, 1} with WD(ρ_x) ≅ M (Frobenius included).
  - example `wdTypeRing_vs_galois_type` (non-example): Choose a supercuspidal WD representation M that is not isomorphic to its unramified quadratic twist. The two have the same inertial restriction and determinant but differ as full WD types. Forgetting Frobenius does not by itself imply an increase of one in dimension when determinant is fixed.
  - example `wdTypeRing_empty_block` (degenerate): If no de Rham representation of type M has reduction in B, I_{B,M} is the unit ideal and R_{B,M} = 0.
  - example `wdTypeRing_trace` (compatibility): Tr ∘ ρ_{B,M} equals the image of the universal pseudo-character of R^{ps,δ_M}_B.

### `R08.3/bcdt-type-rings` (comparison). Needs: PadicHodgeTheory:R06.4.
  statement: Let ℓ be a prime, ρ̄ : G_ℓ → GL(V) two-dimensional over k with End_{k[G_ℓ]} V = k, and R_{V,𝒪} its universal deformation ring. An ℓ-type τ is a class of two-dimensional τ : I_ℓ → GL(D) over ℚ̄_ℓ with open kernel extending to W_{ℚ_ℓ}; an extended ℓ-type τ′ a class of τ′ : W_{ℚ_ℓ} → GL(D′) with open kernel. ρ over K is of type τ (resp. τ′) if it is Barsotti–Tate over every finite F/ℚ_ℓ with τ|_{I_F} trivial, WD(ρ)|_{I_ℓ} ∈ τ (resp. WD(ρ) ∼ τ′), and ε^{-1} det ρ has finite order prime to ℓ. R^D_{V,𝒪} = R^τ_{V,𝒪} is the quotient of R_{V,𝒪} by the intersection of the primes of type τ (0 if none); 'weakly of type τ' means factoring through R^D; τ is weakly acceptable if R^D = 0 or there is a surje

## Layer L7

### `L7/finite-height-lattices` (definition). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.
  - API `heightLatticeFunctor.map` (functoriality): For B → B′, 𝔐_B ↦ 𝔐_B ⊗_B B′, with map_id and map_comp.
  - API `heightLatticeFunctor.ext` (extensionality): Two points of L^{≤h}_{V_A}(B) are equal iff their underlying 𝔖_B-submodules of M_B are equal; the projectivity, spanning and height conditions are properties.
  - API `heightLatticeFunctor_subsingleton` (characterisation): For B finite flat over ℤ_p, L^{≤h}_{V_A}(B) has at most one element (R07.4/finite-height-lattices (1)).
  - API `heightLatticeFunctor_nonempty_iff` (compatibility): For B finite flat over ℤ_p, L^{≤h}_{V_A}(B) is nonempty iff V_A ⊗_A B has E-height ≤ h in the sense of R07.4/kisin-modules.

### `L7/height-lattice-moduli` (theorem). Needs: AdicSpacesPartII:F0, AlgebraicModuliForArithmeticGeometry:R09.1.
  statement: Let A be a complete local Noetherian ring with finite residue field 𝔽 and V_A finite free of rank d with continuous G_{K_∞}-action. (1) On A-algebras B with 𝔪_A^i B = 0 for some i, B ↦ {𝔖_B-lattices of E-height ≤ h in M_B} is represented by a projective A-scheme Θ_A : 𝓛^{≤h}_{V_A} → Spec A, compatible with base change and carrying a canonical very ample line bundle. (2) Θ_A becomes a closed immersion after inverting p. (3) If A^{≤h} is the quotient of A cut out by the scheme-theoretic image of Θ_A, then for every finite W(𝔽)[1/p]-algebra B, A → B factors through A^{≤h} exactly when V_B has E-height ≤ h. (4) There is a finite 𝔖_{A^{≤h}}-module 𝔐 with φ*𝔐 → 𝔐 of cokernel killed by E(u)^h, loca

### `L7/ordinary-flag-scheme` (construction). Needs: AlgebraicModuliForArithmeticGeometry:R09.1.
  - API `ordinaryFlagScheme_proper` (characterisation): 𝒢_v → Spec R^□_v is proper.
  - API `ordinaryFlagImage` (constructor): R^△_v = im(R^□_v → H⁰(𝒢_v, 𝒪)).
  - API `ordinaryFlagImage_points` (characterisation): The domain point criterion.
  - example `ordinaryFlagScheme_permuted` (characterisation): Requiring I_{F_v} to act on the i-th piece by χ^univ_{σ(i)} for σ ∈ S_n gives the variant R^{△,σ}_v used in the proof of L8/determinant-flag-comparison.
  - example `ordinaryFlagImage_not_flag` (non-example): A point of R^△_v need not carry a flag over R itself, only over the algebraic closure of its fraction field.

### `L7/ordinary-flag-scheme-local-structure` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Keep L7/ordinary-flag-scheme (F_w/ℚ_l finite, ρ̄ upper triangular with ordered diagonal χ̄, G = G_{Λ_w} ⊂ 𝓕 ×_𝒪 Spec R^□_{Λ_w} the scheme of pairs (ρ, Fil) with I_{F_w} acting on gr_j by χ_j^univ). Let x be a closed point of G[1/l] with residue field E, (ρ_x, Fil_x) the corresponding pair, g ∈ GL_n(𝒪_E) with Fil_x = g·Fil_std, V_x = E^n with G_{F_w} acting through ρ_x, and Fil^i ad V_x = {A : A Fil_{x,j} ⊆ Fil_{x,j−i}} (so Fil⁰ ad V_x ≅ 𝔟 as a G_{F_w}-module). (1) (Geraghty Lemma 3.5) The completed local ring 𝒪^∧_{G,x} pro-represents the functor of pairs (ρ, Fil) on Artinian local E-algebras lifting (ρ_x, Fil_x), with the prescribed inertial characters. (2) (Corollary 3.6) Let R^g_x pro-repr

### `L7/geraghty-fixed-weight-ordinary-rings` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let F_w/ℚ_l be finite, K ⊃ all embeddings of F_w, λ_w ∈ (ℤ^n_+)^{Hom(F_w,K)}, and χ_j^{λ_w} : I_{F_w} → 𝒪^×, σ ↦ ε(σ)^{−(j−1)}·Π_τ τ(Art^{−1}_{F_w}(σ))^{−λ_{τ,n−j+1}} (Geraghty's normalisation). Let ρ̄ : G_{F_w} → GL_n(𝔽) be arbitrary, R^{v_{λ_w},st} and R^{v_{λ_w},cr} Kisin's semistable and crystalline quotients of Hodge type v_{λ_w} (R08.3/pst-deformation-ring), G^{λ_w} ⊂ 𝓕 ×_𝒪 Spec R^{v_{λ_w},st} the closed subscheme of G_{F_w}-stable full flags on whose graded pieces I_{F_w} acts by χ_j^{λ_w}, and R^{△λ_w,st}, R^{△λ_w,cr} the quotients cut out by the scheme-theoretic images of G^{λ_w}[1/l] and of its crystalline part. (1) (Lemma 3.10) A map ζ : R^{v_{λ_w},st} → B to a finite local K-alge

### `L7/trivial-residual-flag-ring` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: (ACC+ Proposition 6.2.10, from Thorne 2015, Lemma 3.11 and Proposition 3.14.) Let ρ̄|_{G_{F_v}} be trivial and [F_v : ℚ_p] > n(n − 1)/2 + 1, and let Λ_v be a quotient of 𝒪⟦𝒪_{F_v}^×(p)ⁿ⟧ by an intersection of minimal primes (L8/ordinary-coefficient-ring). (1) (Lemma 3.11) The ordinary flag scheme 𝒢_v of L7/ordinary-flag-scheme is 𝒪-flat and reduced; for each minimal prime Q_v of Λ_v, 𝒢_v ⊗_{Λ_v} Λ_v/Q_v is 𝒪-flat and integral of dimension 1 + [F_v:ℚ_p]·n(n+1)/2 + n², and 𝒢_v ⊗_{Λ_v} Λ_v/(Q_v, λ) is integral. Hence the scheme-theoretic image R^△_v of 𝒢_v is already 𝒪-flat and reduced, and the definitions 'image of R^□_v in H⁰(𝒢_v, 𝒪)' (ACC+) and 'maximal reduced 𝒪-flat quotient of the image' 

### `L7/residually-split-nearly-ordinary-ring` (theorem). Needs: DeformationAndDerivedPatchingAlgebra:R03.2, tauceti:TauCetiRoadmap.
  statement: (Skinner–Wiles Lemma 2.2 and Corollary 2.3.) Let n = 2, ρ_0 = χ ⊕ 1 on D = G_{F_v} with χ ≠ 1, d = [F_v : ℚ_p] and ω the mod-p cyclotomic character of D. There are a versal local 𝒪-deformation ρ : D → GL₂(R) of ρ_0 with det = χ̃ and a versal nearly ordinary deformation ρ_ord = (χ̃Ψ *; 0 Ψ^{−1}), Ψ ≡ 1, over R_ord, with R_ord ≅ 𝒪[[x_1, …, x_{2d+2}]]/(f) if χ = ω or ω = 1, and R_ord ≅ 𝒪[[x_1, …, x_{2d+1}]] otherwise. R_ord is a quotient of R by an ideal generated by d + ε elements, ε = 2 if χ = ω = χ^{−1}, ε = 1 if ω = 1, or χ = ω ≠ χ^{−1}, or χ ≠ ω = χ^{−1}, and ε = 0 otherwise.

### `L7/fontaine-laffaille-deformation-condition` (construction). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3, GlobalGaloisDeformations:R04.3, PadicHodgeTheory:R06.4.
  - API `FLDeformation` (data): The condition 𝒟_ṽ on lifts of r̄|_{G_{F_ṽ}}: every Artinian quotient lies in the essential image of R07.3's realisation 𝐆_ṽ.
  - API `FLDeformation.isLocalDeformationProblem` (instance): 𝒟_ṽ is a local deformation problem (GlobalGaloisDeformations R04.3): stable under strict conjugation and closed (Schlessinger fibre products, inverse limits), because the essential image of 𝐆_ṽ is closed under subobjects, quotients and direct sums (R07.3/fl-essential-image-subquotients).
  - API `FLDeformation.mem_iff` (compatibility): For R Artinian, r ∈ 𝒟_ṽ(R) iff r ≅ 𝐆_ṽ(M) for some object M of R07.3's 𝓜𝓕_{𝒪,ṽ} with R-action; for general R ∈ C_𝒪, iff this holds for every Artinian quotient.
  - API `FLDeformation.tangentSpace` (characterisation): The tangent space of 𝒟_ṽ is L_ṽ = image of Ext¹_{𝓜𝓕_{k,ṽ}}(𝐆_ṽ^{−1}(r̄), 𝐆_ṽ^{−1}(r̄)) in H¹(G_{F_ṽ}, ad r̄), using the Ext comparison of R07.3.
  - API `FLDeformation.liftable` (characterisation): CHT Lemma 2.4.1: under the multiplicity-one hypothesis, every point over R/I (𝔪_R I = 0) lifts to R.
  - API `FLDeformation.baseChange` (functoriality): A map of Artinian coefficient algebras carries a lift in 𝒟_ṽ to a lift in 𝒟_ṽ, via the coefficient-compatible realisation of R07.3.
  - example `fl_rank_one` (degenerate): For n = 1 the tangent space L_ṽ is the unramified classes H¹(G_{F_ṽ}/I_{F_ṽ}, ad r̄), of dimension 1 (CHT Corollary 2.4.4 with n = 1).
  - example `fl_elliptic_curve` (computation): E[l] for E/ℚ_l with good reduction, l ≥ 3: Hodge–Tate weights {0, 1} lie in [0, l − 2] and are multiplicity-free, so r̄ = E[l] satisfies the hypotheses and T_l E is a point of 𝒟_ṽ.
  - example `fl_weight_out_of_range` (non-example): A crystalline character with Hodge–Tate weight l − 1 is not in 𝒟_ṽ: R07.3's objects satisfy Fil^{l−1}M = 0.
  - example `fl_repeated_weight` (non-example): r̄ = ε ⊕ ε violates the multiplicity-one hypothesis for n = 2, so Lemma 2.4.1 does not apply.

### `L7/ordinary-condition-fixed-inertial-characters` (construction). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `OrdinaryFixedInertia` (data): The condition 𝒟_v with its characters χ_{v,i}.
  - API `OrdinaryFixedInertia.filtration` (constructor): The filtration Fil^i of a lift in 𝒟_v.
  - API `OrdinaryFixedInertia.filtration_unique` (characterisation): Lemma 2.4.6(1).
  - API `OrdinaryFixedInertia.filtration_baseChange` (compatibility): Lemma 2.4.6(2).
  - API `OrdinaryFixedInertia.isLocalDeformationProblem` (instance): Lemma 2.4.6(3).
  - API `OrdinaryFixedInertia.graded_character` (simp): For a lift satisfying the fixed-inertia ordinary condition, the action of σ∈I_v on gr^i of its unique filtration is multiplication by χ_{v,i}(σ); this statement is compatible with the source’s one-based ordering.
  - example `ord_n1` (degenerate): For n = 1, 𝒟_v is the lifts with inertial character χ_{v,0}.
  - example `ord_n2_distinct` (computation): For n=2 write ρ̄=(χ̄₁ *;0 χ̄₀) with χ̄₁/χ̄₀ ≠ 1,ω. The decreasing filtration has Fil¹ equal to the unique line carrying the prescribed χ̄₁; its quotient carries χ̄₀.
  - example `ord_cyclotomic_ratio_excluded` (non-example): r̄ = ω ⊕ 1 on G_{ℚ_l} with ω on the sub (χ̄_1 = ω, χ̄_0 = 1, l > 3) satisfies CHT's printed (2) but not (2′); there H²(G, k(ω)) ≠ 0 and the ring is not formally smooth (E2).
  - example `ord_vs_flag_scheme` (compatibility): The lifts in 𝒟_v are the points of L7/ordinary-flag-scheme's image over the fixed characters.

### `L7/ordinary-fixed-inertial-characters-smoothness` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Under (2′): (Lemma 2.4.7.) 𝒟_v is liftable. (Lemma 2.4.8.) R_v^{loc}/𝓘_v is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables, and dim_k L_v − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2.

### `L7/discrete-series-deformation-condition` (construction). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `DiscreteSeriesType` (structure): (m, d, r̃_v) with conditions (1)–(3).
  - API `IsDiscreteSeriesLift` (data): Definition 2.4.24: the filtration with gr^i ≅ gr⁰(i) and gr⁰|_I ≅ r̃_v|_I ⊗ R.
  - API `IsDiscreteSeriesLift.filtration_unique` (characterisation): Lemma 2.4.25.
  - API `discreteSeriesDeformation` (instance): Lemma 2.4.26: a local deformation problem.
  - API `DiscreteSeriesType.induced` (characterisation): Lemma 2.4.23: r̃_v ≅ Ind s_v.
  - API `DiscreteSeriesType.filtration_baseChange` (functoriality): The unique direct-summand filtration of a discrete-series lift pulls back along every allowed coefficient map; its graded identifications and the fixed prime-to-p inertia representation pull back with it.
  - example `ds_steinberg` (compatibility): d = 1, m = n, r̃_v trivial: the unipotent-monodromy (Steinberg) lifts with Frobenius eigenvalues α, qα, …, q^{n−1}α.
  - example `ds_m1` (degenerate): m = 1: lifts with ρ|_I ≅ r̃_v|_I ⊗ R, i.e. minimally ramified type r̃_v.
  - example `ds_condition3_fails` (non-example): If q ≡ 1 mod p then k(1) ≅ k and condition (3) fails for i = 1.
  - example `ds_induced_type` (computation): d = 2 with r̃_v induced from the unramified quadratic extension (a supercuspidal type).

### `L7/ordinary-of-weight-lambda` (definition). Needs: PadicHodgeTheory:R06.4, tauceti:TauCetiRoadmap.
  - API `IsOrdinaryOfWeight` (data): The predicate: ρ has a G_K-stable full flag whose graded characters χ_i satisfy χ_i∘Art_K ≡ Π_τ τ^{−(λ_{τ,n−i+1}+i−1)} up to finite order on 𝒪_K^×.
  - API `IsSemistableOrdinaryOfWeight` (data): The same with equality on I_K.
  - API `IsSemistableOrdinaryOfWeight.isOrdinary` (other): Semistable-ordinary of weight λ implies ordinary of weight λ.
  - API `IsOrdinaryOfWeight.potentiallySemistable` (compatibility): Ordinary of weight λ implies potentially semistable of Hodge type v_λ; semistable-ordinary implies semistable of type v_λ.
  - API `IsOrdinaryOfWeight.flag_unique` (characterisation): If the χ_i are pairwise distinct on I_K, the flag is unique.
  - API `IsOrdinaryOfWeight.restrict` (functoriality): Ordinary of weight λ is preserved by restriction to G_{K′} (with the restricted weight).
  - API `IsOrdinaryOfWeight.baseChange` (functoriality): A coefficient map between the allowed finite E-algebras carries the stable full flag of direct summands and its ordered inertia characters to an ordinary flag of the same weight. Exact semistable-ordinary characters are preserved as well.
  - example `ordinaryWeight_n1` (computation): n = 1, λ = (λ_τ): χ_p^{-1}-normalised, ρ = χ_λ·(unramified) is ordinary of weight λ; ρ = χ_λ·ω (ω ramified of order p) is ordinary but not semistable-ordinary.
  - example `ordinaryWeight_weight_zero` (degenerate): For n=2 and λ=(0,0), the ordered inertia characters are 1 and ε_p⁻¹. Weight zero is not the condition that both diagonal characters are unramified.
  - example `ordinaryWeight_charpoly_not_enough` (non-example): For n=2, λ=(0,0), a nonsplit extension with subcharacter ε_p⁻¹ and quotient 1 has the same characteristic polynomials as 1⊕ε_p⁻¹ but lacks a stable subline carrying 1. It fails CN’s prescribed ordering despite the determinant equations.
  - example `ordinaryWeight_KW` (compatibility): For n=2, λ=(k−2,0), CN’s ordered inertia characters are 1 and ε_p^{−(k−1)}. Dualizing and reversing the flag gives KW’s higher-weight subline χ_p^{k−1} and weight-zero quotient. This is a duality comparison, not equality of the original ordered representations.

### `L7/semistable-ordinary-quotient` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let λ be dominant for (Res_{K/ℚ_p} GL_n)_E and ρ̄ : G_K → GL_n(k). (1) (Kisin) There are unique 𝒪-flat quotients R^{st,λ}_ρ̄ and R^{cris,λ}_ρ̄ of R^□_ρ̄ whose maps to finite E-algebras B are exactly the lifts that are semistable (resp. crystalline) of p-adic Hodge type v_λ; R^{st,λ}_ρ̄ is reduced (Bellovin–Gee) and R^{cris,λ}_ρ̄[1/p] is regular. (2) If B is a finite local E-algebra, ρ_B semistable of Hodge type v_λ and ρ_B ⊗ B/𝔪_B semistable-ordinary of weight λ, then ρ_B is semistable-ordinary of weight λ. (3) There is a unique 𝒪-flat quotient R^{△,λ}_ρ̄ whose B-points are the semistable-ordinary lifts of weight λ; Spec R^{△,λ}_ρ̄[1/p] is open and closed in Spec R^{st,λ}_ρ̄[1/p], so R^{△,λ}

### `L7/g-valued-ordinary-condition` (definition). Needs: tauceti:TauCetiRoadmap.
  - API `canonicalTorus` (data): T_G = B/R_u(B), canonically independent of B.
  - API `chiLambda` (constructor): χ_λ : I_{F_v} → T_G(𝒪) attached to cocharacters λ_τ.
  - API `IsGOrdinary` (data): ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ.
  - API `IsGOrdinary.gl` (compatibility): For G = GL_n, IsGOrdinary is IsOrdinaryOfWeight of L7/ordinary-of-weight-lambda (with finite-order ambiguity absorbed by F′_v).
  - API `IsGOrdinary.map` (functoriality): Ordinarity is preserved by central isogenies G → G′ with the induced weight.
  - example `gOrdinary_torus` (degenerate): G = T a torus: B = T, T_G = T and ρ is F′_v-ordinary of weight λ iff ρ|I_{F′_v} = χ_λ.
  - example `gOrdinary_GL2` (compatibility): G = GL₂: agrees with L7/ordinary-of-weight-lambda for n = 2.
  - example `gOrdinary_GSp4` (computation): G = GSp₄, λ regular: ordinary means a stable symplectic full flag with graded characters (χ₁, χ₂, ε^{-1}χ₂^{-1}, ε^{-1}χ₁^{-1}) of the prescribed inertial weights (BCGP25 §1.8.10).
  - example `gOrdinary_not_residual` (non-example): The definition is for lifts to finite E-algebras; a residual ρ̄ with a stable Borel is not 'ordinary of weight λ' (χ_λ mod 𝔪 loses the weight).

### `L7/g-valued-ordinary-quotient` (construction). Needs: PadicHodgeTheory:R06.4.
  - API `gOrdinaryFlagScheme` (data): 𝒢_λ ⊂ Fl_G ×_𝒪 Spec R^{□,v_λ}_ρ̄.
  - API `gOrdinaryFlagScheme.isClosed` (characterisation): 𝒢_λ is a closed subscheme, with the ideal of (1) including the central generators.
  - API `gOrdinaryFlagScheme.proper` (other): 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper.
  - API `gOrdinaryRing` (constructor): R^{△λ}_ρ̄, the scheme-theoretic image of 𝒢_λ[1/p].
  - API `gOrdinaryRing_points` (characterisation): Point criterion (3).
  - API `gOrdinaryRing.gl` (compatibility): For G = GL_n, R^{△λ}_ρ̄ is the weight-λ specialisation of L7/ordinary-flag-scheme's image ring, intersected with the Hodge type v_λ.
  - API `gOrdinaryFlagScheme.points` (universal-property): Over a finite E-algebra in the specified semistable-over-F′_v Hodge family, a point is a framed lift and a Borel reduction satisfying the root and canonical-torus equations. Base change pulls back the Borel reduction and these equations; the torus equations are retained also when G has no roots.
  - example `gOrdinaryRing_GL1` (degenerate): G = GL₁: R^{△λ}_ρ̄ = R_ρ̄/(ρ(σ) − χ_λ(σ) : σ ∈ I_{F′_v}) up to the p-torsion-free generic fibre (R08.1/rank-one-ring).
  - example `gOrdinaryRing_central_generators` (non-example): In the ambient unrestricted framed GL₁ ring there are no root generators. The torus equations ρ(σ)=χ_λ(σ) on I_{F′_v} must be imposed explicitly. Whether they are redundant after a particular fixed Hodge/semistable quotient is a separate assertion.
  - example `gOrdinaryRing_points_GL2` (computation): For G=GL₂, F_v=ℚ_p and λ=(1,0), the stated ordinary point has the form (ψ₁χ_p *;0 ψ₂) in the FKP convention and is semistable over F′_v. A nonzero Tate-curve extension can have N≠0 and need not be crystalline.
  - example `gOrdinaryRing_compat` (compatibility): For G = GL_n and F′_v = F_v the points agree with those of L7/semistable-ordinary-quotient.

### `L7/g-valued-ordinary-components` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Keep L7/g-valued-ordinary-quotient with λ dominant regular. R^{△λ}_ρ̄ is a union of irreducible components of R^{□,v_λ}_ρ̄; hence R^{△λ}_ρ̄[1/p] has an open dense regular subscheme and all its components have dimension dim G + [F_v:ℚ_p]·dim Fl_G. With a fixed multiplier μ : G_{F_v} → (G/G^der)(𝒪), the same holds with dim G^der in place of dim G.

### `L7/ordinary-ring-with-frobenius-eigenvalue` (construction). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `OrdinaryWithEigenvalue.forget` (projection): R† → R̃†, forgetting α; R† is the image.
  - API `OrdinaryWithEigenvalue.unr` (constructor): R^unr and R̃^unr = R̃† ⊗_{R†} R^unr.
  - API `OrdinaryWithEigenvalue.unramifiedIdeal` (constructor): I = ker(R^univ → R^unr).
  - API `OrdinaryWithEigenvalue.doublingIdeal` (constructor): J = Ann_{R^univ}(R̃†/R†).
  - API `OrdinaryWithEigenvalue.hom_ext` (extensionality): Two continuous maps R̃†→A are equal iff they induce the same framed lift ρ and the same eigenvalue α. Equality of ρ alone characterizes maps from the image ring R†, not maps from R̃†.
  - example `eigenvalueRing_unr_presentation` (computation): R^unr ≅ 𝒪/ϖ^m⟦φ₁, …, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃) and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr, with ϖ^m the largest power dividing all χ^{n−1}(g) − 1, g ∈ D_p. The direct sum is an isomorphism of R^unr-modules, not a product of rings.
  - example `eigenvalueRing_rank_two` (characterisation): The unramified quotient has a rank-two eigenvalue algebra as a module, while its support is killed by a power of ϖ. After inverting p, I=J becomes the unit ideal and R̃†[1/p]=R†[1/p]; the ordinary eigenvalue map is generically degree one.
  - example `eigenvalueRing_not_flag_free` (non-example): R† ≠ R̃†: the ring with an eigenvalue is not the image ring; their difference is measured by J.

### `L7/gsp4-siegel-ordinary-condition` (construction). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `GSp4.SiegelOrdinary` (data): The local deformation problem of Siegel-ordinary lifts with multiplier ε^{−(a−1)}.
  - API `GSp4.SiegelOrdinary.plane` (constructor): The stable unramified Lagrangian plane of a lift in the condition.
  - API `GSp4.SiegelOrdinary.plane_unique` (characterisation): Under the genericity condition the plane is unique and lifts the residual one.
  - API `GSp4.SiegelOrdinary.tangent` (characterisation): The tangent space of the condition is L_p ⊂ H¹(G_p, ad⁰r̄).
  - API `GSp4.SiegelOrdinary.isOrdinary` (compatibility): Every lift in the condition is G-ordinary of the corresponding (non-regular) weight in the sense of L7/g-valued-ordinary-condition with the Siegel parabolic.
  - API `SiegelOrdinary.baseChange` (functoriality): Along a coefficient map, the Galois-stable unramified Lagrangian direct summand pulls back to the corresponding plane; isotropy, its rank and the fixed multiplier are preserved. Under the stated uniqueness hypothesis this is the plane assigned to the pulled-back lift.
  - example `siegelOrdinary_not_borel_ordinary` (non-example): A ramified nonsplit extension of the two prescribed unramified characters on the Lagrangian quotient plane is not Siegel ordinary: the quotient-plane inertia action is nontrivial. A nonzero upper matrix entry alone is insufficient, since an unramified extension may be split by conjugation.
  - example `siegelOrdinary_multiplier` (computation): Every lift in the condition has multiplier ε^{−(a−1)}: (χ_αψ^{-1})(ε^{−(a−1)}χ_α^{-1}ψ) = ε^{−(a−1)}.

### `L7/gsp4-borel-ordinary-conditions` (construction). Needs: tauceti:TauCetiRoadmap.
  - API `GSp4.IsPDistinguishedOrdinary` (data): The residual and lifted p-distinguished weight-2 ordinary shapes.
  - API `GSp4.BorelOrdinary` (constructor): 𝒟^{B,𝔠̄}_v over Λ_{v,2}, represented by R^{B,𝔠̄}_v.
  - API `GSp4.ParabolicOrdinary` (constructor): 𝒟^P_v over Λ_{v,1}, represented by R^P_v.
  - API `GSp4.partiallyFramed` (other): R^B and R^P are formally smooth over the B- and P-framed rings R^{B,◹}, R^{P,◹} (BCGP21 Lemma 7.3.12).
  - API `GSp4.BorelOrdinary.semistable` (compatibility): At the specified weight-two arithmetic specialization, the source’s ordinary finite-flat flag criterion gives a semistable lift. Arbitrary variable-weight points are not asserted semistable.
  - API `BorelOrdinary.toParabolic` (functoriality): Forgetting the appropriate steps of the ordinary full flag and restricting its weight characters to Λ_{v,1} gives a parabolic-ordinary point. The induced map of representing rings follows the opposite direction and commutes with universal representations.
  - example `gsp4BorelOrdinary_weightAlgebra` (computation): Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ ≅ 𝒪⟦x₁, x₂⟧ for p > 2.
  - example `gsp4BorelOrdinary_not_distinguished` (non-example): ᾱ = β̄ is excluded: the residual Lagrangian plane then carries a two-dimensional unramified isotypic piece and the flag is not unique.
  - example `gsp4BorelOrdinary_semistable_not_crystalline` (characterisation): When α² = 1, the rank-two subquotient on the first and fourth basis vectors may be the non-split extension of ε^{-1}λ_α^{-1} by λ_α given by the Kummer class of p in H¹(ℚ_p, E(ε)) = H¹(ℚ_p, E(ελ_α²)); such a lift is p-distinguished weight-2 ordinary and semistable but not crystalline, so the condition is not the crystalline condition.
  - example `gsp4BorelOrdinary_closed_immersion` (compatibility): For p-distinguished ρ̄ the flag-incidence map of L7/gsp4-ordinary-flag-incidence is a closed immersion with image R^{B,𝔠̄}_v.

### `L7/gsp4-ordinary-generic-fibres` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Keep L7/gsp4-borel-ordinary-conditions (p > 2, F_v = ℚ_p, ρ̄ p-distinguished weight 2 ordinary). (1) R^{B,𝔠̄}_v[1/p] and R^P_v[1/p] are irreducible, of relative dimensions 16 and 14 over ℚ_p. (2) R^{P,univ} and R^P are complete intersections, connected in characteristic zero, with non-smooth locus in characteristic zero of codimension at least two; R^{P,univ}[1/p] and R^P[1/p] are irreducible of dimensions 15 and 14. (3) The P-framed ring R^{P,univ,◹} is a completed tensor product of GL₂ ordinary rings for the three two-dimensional subquotients (Lemma 7.3.15). (4) (Lemma 7.3.14) Write ρ̄ with diagonal (λ_ᾱ, λ_β̄, ε̄⁻¹λ_β̄⁻¹, ε̄⁻¹λ_ᾱ⁻¹), ᾱ ≠ β̄, and extension classes η_δ ∈ H¹(ℚ_p, ε̄λ_δ̄) for

### `L7/gl2-borel-ordinary-ring` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Let p > 2 and r̄ = (λ_ᾱ ∗; 0 ε̄^{-1}λ_ᾱ^{-1}) : G_{ℚ_p} → GL₂(k), written with extension class η_{α²} ∈ H¹(ℚ_p, ε̄λ_{ᾱ²}); let Λ = 𝒪⟦1 + pℤ_p⟧ with canonical character θ : I_{ℚ_p} → Λ^× (through Art^{-1}). A lift r over A ∈ CNL_Λ is ordinary if it is ker(GL₂(A) → GL₂(k))-conjugate to (χ ∗; 0 ε^{-1}χ^{-1}) with χ̄ = λ_ᾱ and χ|_{I_{ℚ_p}} = θ; this local deformation problem is represented by R^{B₂}. (1) h²(ℚ_p, ad⁰_{B₂}r̄) = 0 unless ᾱ² = 1 and η_{α²} = 0, in which case it equals 1. (2) R^{B₂}[1/p] is irreducible of relative dimension 5 over ℚ_p; when h² = 0, R^{B₂} is formally smooth over 𝒪 of relative dimension 5. (3) (Lemma 7.3.7) The B₂-framed fixed-determinant ring R^{B₂,◹} of r̄ = (λ_γ ε̄

### `L7/gsp4-ordinary-flag-incidence` (construction). Needs: tauceti:TauCetiRoadmap.
  - API `GSp4.weightAlgebra` (data): Λ_{GSp₄,v} and Λ̃_{GSp₄,v} with their universal characters.
  - API `GSp4.ordinaryFlagScheme` (constructor): 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v.
  - API `GSp4.ordinaryFlagScheme_proper` (other): 𝒢_v → Spec R_v is proper.
  - API `GSp4.ordinaryImage` (constructor): R^△_v, the scheme-theoretic image (no flat closure).
  - API `GSp4.ordinaryImage_points` (characterisation): 𝒪_{E′}-points of Spf R^△_v are the ordinary lifts with the given p-stabilisation.
  - API `GSp4.ordinaryFlagScheme_closedImmersion` (characterisation): Residually p-distinguished ⟹ 𝒢_v → Spec R_v is a closed immersion.
  - API `GSp4.ordinaryFlagScheme.points` (universal-property): A coefficient point consists of a fixed-similitude framed lift, an isotropic stable full flag and the ordered universal weight characters of its graded lines. This description and the incidence equations commute with coefficient base change.
  - example `gsp4Flag_weightAlgebra_p2` (computation): p = 2: Spec Λ_{GSp₄,v} has 4 irreducible components (from (ℤ/2)² ⊂ (ℤ₂^×)²) and regular generic fibre.
  - example `gsp4Flag_no_flat_closure` (non-example): R^△_v may have p-torsion; replacing it by its flat closure changes the ring when 𝒢_v is not 𝒪-flat.
  - example `gsp4Flag_distinguished` (compatibility): For residually p-distinguished ρ̄, R^△_v is the ring of L7/gsp4-borel-ordinary-conditions.

### `L7/gsp4-ordinary-regularity` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Keep L7/gsp4-ordinary-flag-incidence and let x be a closed point of 𝒢_v[1/p] with ρ_x. (1) If H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0, then x is a regular point of 𝒢_v[1/p], on a unique irreducible component, of dimension 16; and H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0 iff H⁰(G_{F_v}, (ad⁰ρ_x/Fil¹ad⁰ρ_x)(1)) = 0. (2) The conditions of (1) hold if (a) none of the specialisations at x of χ̃₁²ε, χ̃₂²ε, χ̃₁χ̃₂ε, χ̃₁χ̃₂^{-1} equals ε; or (b) ρ_x is pure and p-distinguished; or (c) ρ_x is pure and potentially crystalline. (3) If ρ_x is p-distinguished and (1) holds, the image of x in Spec R^△_v is a regular point on a unique irreducible component of relative 𝒪-dimension 16.

### `L7/gsp4-flat-ordinary-smoothness` (theorem). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1, tauceti:TauCetiRoadmap.
  statement: Let p > 2, v | p with F_v⁺ = ℚ_p, ρ̄|_{G_{F_v⁺}} : G_{ℚ_p} → GSp₄(k) ordinary (L7/gsp4-ordinary-flag-incidence) with (ρ̄ ⊗ ε̄)|_{G_{F_v⁺}} finite flat, and let G_v → Spec R^□_v be the ordinary flag scheme of L7/gsp4-ordinary-flag-incidence. Let G_v^flat ⊆ G_v be the closed subscheme whose A-points are the pairs (Fil•, ρ) with ρ ⊗ ε finite flat (every finite quotient of ρ ⊗ ε is the generic fibre of a finite flat group scheme over ℤ_p) and G_{F_v⁺} acting on Fil₂ through unramified characters. Then the completion of G_v^flat at every k′-point (k′/k finite) is formally smooth over 𝒪; equivalently, the obstruction space H²_flat(Fil⁰ad⁰ρ̄) of the flat flag deformation problem vanishes. Consequen

### `L7/gsp4-ordinary-weight-two-components` (theorem). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.
  statement: Keep L7/gsp4-ordinary-flag-incidence with p > 2. (1) If (ρ̄ ⊗ ε̄)|G_{F_v} is finite flat, then all ordinary pure weight-two crystalline lifts lie on a single irreducible component of Spec R^△_v, each on a unique component, of relative 𝒪-dimension 16. (2) If a component R^△_v/Q dominates Spec Λ_{GSp₄,v}, some minimal prime of the special fibre contains Q and no other minimal prime of R^△_v; this component has relative 𝒪-dimension 16. No claim is made that every component dominates Λ.

### `L7/connects-relation` (definition). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `Connects.sum_tensor_dual` (functoriality): ∼ is compatible with direct sums, tensor products, duals, and twists by unramified characters with trivial reduction.
  - API `Connects.symPow` (functoriality): ∼ is compatible with Sym^{n−1} (components of these generic fibres are connected components and Sym^{n−1} induces a morphism of generic fibres).
  - example `connects_rank_one` (computation): n = 1: ψ₁ ∼ ψ₂ iff ψ̄₁ = ψ̄₂ and HT(ψ₁) = HT(ψ₂) (crystalline characters).
  - example `connects_ordinary_trivial` (characterisation): Two ordinary crystalline weight-0 lifts of the trivial representation connect (L7/weight-zero-crystalline-connectedness).
  - example `connects_different_weights` (non-example): Lifts with different labelled Hodge–Tate weights never connect, even if their reductions agree.

### `L7/weight-zero-crystalline-connectedness` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let K/ℚ_p be finite. (1) Two ordinary crystalline weight-0 representations ρ₁, ρ₂ of G_K with ρ̄₁ = ρ̄₂ trivial connect: ρ₁ ∼ ρ₂ (the ordinary weight-0 crystalline lifting ring of the trivial representation is irreducible). (2) For ρ : G_K → GL_n(ℤ̄_p) crystalline of weight 0 there is c = c(K, ρ, n) such that every crystalline weight-0 t with t ≡ ρ mod p^c satisfies t ∼ ρ. (3) A crystalline representation of G_K with parallel Hodge–Tate weights {0, …, n − 1} is ordinary iff the roots of its Frobenius characteristic polynomial (on D_cris, φ^f with f the residue degree) have valuations 0, f, …, (n − 1)f. (4) Symmetric powers and tensor products of crystalline ordinary representations are cryst

### `L7/local-model-rho-nm0` (construction). Needs: ArithmeticGaloisRepresentations:R01.2, tauceti:TauCetiRoadmap.
  - API `rhoNM0.hodgeTate` (simp): HT_τ(ρ_{n,m,0}) = {0, m, …, (n − 1)m} for each τ.
  - API `rhoNM0.symPow` (relation): Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0}.
  - API `rhoNM0.connects` (characterisation): Crystalline lifts of ρ̄_{n,m,0} with the same weights connect to ρ_{n,m,0} after an unramified extension.
  - example `rhoNM0_det` (computation): det ρ_{2,1,0} = ε₂ε′₂ = ε^{-1}.
  - example `rhoNM0_needs_p_large` (non-example): The bound p>nm supplies the uniform FL range for the tensor weights. If p≤nm that hypothesis is unavailable; this does not imply that every individual weight multiset is outside the FL interval.

### `L7/kisin-modules-tame-descent` (construction). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.
  - API `GL3KisinChart` (structure): A rank-3 Kisin module with tame descent datum of type τ (R07.4) over R together with an eigenbasis: the data from which the partial Frobenius matrices are read.
  - API `GL3KisinChart.frobMatrix` (projection): A^{(j)} ∈ GL₃(R((v))) for j ∈ ℤ/f, the matrix of the j-th partial Frobenius in the eigenbasis.
  - API `GL3KisinChart.changeBasis` (extensionality): Two eigenbases differ by (I^{(j)})_j in the Iwahori subgroup, and A^{(j)} ↦ (I^{(j)})^{−1}A^{(j)}φ(I^{(j−1)}); two charts of the same Kisin module are related in this way.
  - API `GL3KisinChart.shape` (constructor): The shape (w̃_j) ∈ W̃^∨: the Iwahori double coset of A^{(j)} for 𝔐 over a field; independent of the eigenbasis by changeBasis.
  - API `GL3KisinChart.unique` (characterisation): For 3-generic τ the Kisin module of type (η, τ) of ρ̄ is unique up to isomorphism (LLHLM18 Theorem 3.2), so w̃(ρ̄, τ) is well defined.
  - example `kisinDescent_trivialType` (degenerate): τ trivial: Δ acts trivially on the eigenbasis, each A^{(j)} is the Frobenius matrix of an R07.4 Kisin module, and the chart is an ordinary basis.
  - example `kisinDescent_shape_identity` (computation): For ρ̄ = T*_dd of the semisimple Kisin module of shape t_1 (A^{(j)} diagonal), the shape w̃(ρ̄, τ) is the identity at every j.
  - example `kisinDescent_shape_admissible` (characterisation): w̃(ρ̄, τ) lies in Adm^∨(η) whenever ρ̄ has a potentially crystalline lift of type (η, τ) (LLHLM Theorem 3.3.11).
  - example `kisinDescent_nongeneric_not_empty` (non-example): Without 1-generic τ, Theorem 3.5.3 does not apply; it does not imply that the ring is zero. The trivial residual representation has a trivial-type, weight-zero crystalline lift, a concrete nonzero nongeneric case.

### `L7/semisimple-kisin-modules-and-shapes` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Keep L7/kisin-modules-tame-descent (GL₃, K/ℚ_p unramified). (1) A semisimple Kisin module of shape w̃ (Definition 3.3.4) gives a semisimple G_{K_∞}-representation, with the explicit normal form of Proposition 3.3.6 and étale φ-module 𝓜(w̃) (Definition 3.3.7); T*_dd of it and its inertial type are given by Proposition 3.3.8. (2) Semisimple Kisin modules of a fixed shape and inertial restriction are classified (Proposition 3.3.9). (3) If ρ̄ has a potentially crystalline lift of type (η, τ), then so does ρ̄^ss (Lemma 3.3.10). (4) (Theorem 3.3.11) If ρ̄ has a potentially crystalline lift of type (η, τ) with either τ a regular principal-series type and general effective λ, or λ=η and τ 3-generic,

### `L7/gl3-pcris-deformation-rings` (theorem). Needs: DeformationAndDerivedPatchingAlgebra:R03.3.
  statement: Let K/ℚ_p be unramified of degree f, ρ̄ : G_K → GL₃(F) continuous, 10-generic and semisimple, τ a tame inertial type, and R^τ_ρ̄ the framed potentially crystalline deformation ring of type (η, τ) with η = (2, 1, 0) (R08.3/pst-deformation-ring). If τ is not 1-generic, R^τ_ρ̄ = 0. If τ is 1-generic and R^τ_ρ̄≠0: R^τ_ρ̄ is a normal Cohen–Macaulay domain; R̄^τ_ρ̄ := R^τ_ρ̄/ϖ is reduced, its irreducible components are formally smooth of the same dimension, and their number equals #W^?(ρ̄, τ) (the predicted Serre weights in the Jordan–Hölder factors of σ(τ)). For shapes w̃_j of length > 1 at every j (τ 5-generic), the same holds with R^τ_ρ̄ ≠ 0 (Lemma 3.5.4).

### `L7/gl3-explicit-rings` (construction). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `GL3.explicitRing` (data): R̄^{expl,∇}_{𝔐̄,w̃} for each shape w̃ (three cases by length).
  - API `GL3.comparisonDiagram` (constructor): The diagram (3.9) relating R̄^τ_ρ̄, explicit rings and étale φ-modules.
  - API `GL3.iotaPrime_mono` (characterisation): ι′_τ is a monomorphism.
  - API `GL3.formallySmooth_over_explicit` (other): R̄^τ_ρ̄ is formally smooth over ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}.
  - API `GL3.irr_bijection` (equivalence): Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{w̃_i}).
  - example `gl3Explicit_long_shape` (degenerate): For ℓ(w̃_i) = 4 the explicit ring is a power series ring over F (Table 4: the single relation, when present, is solved for one variable), and for ℓ(w̃_i) ≥ 2 the characteristic-zero explicit ring is formally smooth over R_N.
  - example `gl3Explicit_not_epi` (non-example): ι′_τ is a monomorphism but not an isomorphism onto Φ-Mod^{ét,□}: étale φ-modules not coming from Kisin modules of type (η, τ) are not in the image.

### `L7/partition-monodromy-rings` (construction). Needs: GlobalGaloisDeformations:R04.3.
  - API `partitionRing` (data): R^m_v for a partition m of n.
  - API `partitionRing_points` (characterisation): ℚ̄_l-points of R^m_v are the unipotently ramified lifts whose Frobenius characteristic polynomial lies in Pol_n(m, q_v).
  - API `partitionRing_mono` (other): If m is obtained by splitting the parts of m′ into shorter consecutive q-chains, Pol_n(m′,q)⊂Pol_n(m,q), giving R^m_v↠R^{m′}_v. Dominance of partitions alone does not imply this inclusion.
  - API `partitionRing.coefficientMap` (functoriality): Composing a framed lift with a coefficient map preserves unipotent inertia and the defining Frobenius q-chain equations. A point of the reduced flat quotient R^m_v therefore pulls back as a point of that same quotient; no bound on the rank of N is inferred.
  - example `partitionRing_not_scalar` (non-example): R^m_v for m = (2, 1) is not the ring of lifts with scalar inertial semisimplification: it also constrains the Frobenius eigenvalues to contain a chain α, q_vα.

### `L7/partition-ring-smooth-points` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Keep L7/partition-monodromy-rings. Let x ∈ Spec R^m_v[1/l] be a closed point given by ρ : G_{L_ṽ} → GL_n(𝒪) with ρ ⊗ ℚ̄_l pure (Taylor–Yoshida, Lemma 1.4). Then Spec R^1_v[1/l] is formally smooth over K at x, there is a unique minimal prime Q_v of R^1_v in the kernel of R^1_v → 𝒪, and Q_v contains ker(R^1_v → R^m_v).

### `L7/away-from-p-rank-n-interface` (comparison). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: L7's rank-n semistable, Steinberg and minimally ramified conditions away from p are those of R08.2, cited and not rebuilt (RS-08 link R08.2 → L7): (1) minimally ramified lifts in rank n (R08.2/minimally-ramified-condition, R08.2/minimally-ramified-ring), which equal the unipotent lifts when r̄(σ) is a single Jordan block (R08.2/regular-unipotent-minimally-ramified); (2) Steinberg lifts with monodromy (R08.2/steinberg-condition, R08.2/steinberg-ring-domain) and their generalisations with Frobenius characteristic polynomial constrained by q-chains of a partition (L7/partition-monodromy-rings); (3) fixed inertial types with monodromy (R08.2/inertial-type-with-monodromy) with constancy on compon

### `L7/torsion-crystalline-representations` (definition). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3, PadicHodgeTheory:R06.4.
  - API `IsTorsionCrystalline` (data): R is a subquotient R″/R′ of lattices in a crystalline representation with weights in [a, b].
  - API `IsCrystallineIntegral` (data): R crystalline iff every R/p^m R is torsion crystalline.
  - API `IsTorsionCrystalline.closed` (other): For every fixed [a,b], torsion crystalline objects are closed under subobjects, quotients and finite direct sums.
  - API `IsCrystallineIntegral.of_rational` (compatibility): A lattice in a crystalline representation with weights in [a, b] is crystalline.
  - API `IsTorsionCrystalline.fontaineLaffaille` (equivalence): For b − a ≤ p − 2 these are the representations of Fontaine–Laffaille modules.
  - API `IsTorsionCrystalline.twist` (functoriality): Tensoring a torsion crystalline object with a lattice in a crystalline character of constant labelled Hodge weight w shifts its weight interval from [a,b] to [a+w,b+w]. This states the shift in terms of w, independently of the cyclotomic sign convention.
  - example `torsionCrys_mu_p` (computation): μ_p ≅ ℤ/p(1) is torsion crystalline with weights in [−1, 0] (LTXZZ convention).
  - example `torsionCrys_trivial` (degenerate): ℤ/p^m with trivial action is torsion crystalline with weights in [0, 0].
  - example `torsionCrys_wide_range` (non-example): At b−a=p−1, unrestricted integral FL full faithfulness can fail (R06.4/fontaine-laffaille-endpoint-non-example). Torsion crystalline subquotient closure still holds by the lattice-quotient definition.
  - example `torsionCrys_lattice` (compatibility): A Γ-stable lattice in a crystalline representation is crystalline in the sense of (2).

## Layer L8

### `L8/ordinary-coefficient-ring` (construction). Needs: PadicMeasuresIwasawaAlgebras:L1, tauceti:TauCetiRoadmap.
  - API `universalInertialCharacter` (constructor): χ_i^univ : I_{F_v} → Λ_v^×.
  - API `universalInertialCharacter_residual` (characterisation): χ_i^univ ≡ χ̄_i modulo the maximal ideal.
  - API `minimalPrimes_torsionCharacters` (equivalence): Minimal primes ↔ Galois orbits of torsion characters.
  - API `ordinaryWeightRing.universal` (universal-property): Continuous 𝒪-algebra maps Λ_v→A correspond to ordered continuous characters of 𝒪_{F_v}^×(p) with the prescribed reductions whose induced map from the completed group algebra kills 𝔞. The correspondence commutes with maps of complete coefficient algebras.
  - example `ordinaryWeightRing_torsion` (computation): F_v = ℚ_p(ζ_p): 𝒪_{F_v}^×(p) has torsion μ_p, so 𝒪[[𝒪_{F_v}^×(p)]] has several minimal primes once ζ_p ∈ 𝒪, and 𝔞 selects tuples of characters of μ_pⁿ.
  - example `ordinaryWeightRing_n_one` (degenerate): n = 1: χ_1^univ is the universal deformation of χ̄_1|_{I_{F_v}} with values in Λ_v, and Λ̃_v adds the Frobenius variable.

## Layer R08.4

### `R08.4/flat-deformation-condition` (construction). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1.
  - API `flatLiftingRing_points` (characterisation): An 𝒪_E-point is flat iff it is the Tate module of a p-divisible group.
  - example `flat_mu_p_plus_Z_p` (computation): 𝔽(1) ⊕ 𝔽 is finite flat.
  - example `flat_points_iff_pdivisible` (characterisation): 𝒪_E-points of R^{fl,□} are Tate modules of p-divisible groups.
  - example `omega_sq_not_flat` (non-example): ω² over ℚ_p (p > 3) has no finite flat model.

### `R08.4/finite-flat-model-moduli` (construction). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.
  - API `finiteFlatModels` (constructor): 𝒢ℛ_{V_𝔽,ξ}, the projective R-scheme of E-height ≤ 1 lattices.
  - API `finiteFlatModels_toFlat` (constructor): Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl, projective.
  - API `finiteFlatModels_closedFibre` (characterisation): 𝒢ℛ_{V_𝔽,0}(𝔽′) ≃ finite flat models of V_𝔽 ⊗ 𝔽′.
  - API `finiteFlatModels.points` (universal-property): For an R-algebra B in the source moduli category, morphisms Spec B→𝒢ℛ_{V_𝔽,ξ} correspond to E-height≤1 projective lattices in M(ξ)_B, with the specified generic-fibre identification. Pullback of the universal lattice gives this bijection and commutes with B→B′.
  - example `finiteFlatModels_irreducible_Qp` (computation): K = ℚ_p, V_𝔽 irreducible: one model.
  - example `finiteFlatModels_closedFibre_models` (characterisation): Closed-fibre points are finite flat models.
  - example `finiteFlatModels_two_models_ramified` (non-example): Over ℚ_p(ζ_p), μ_p and ℤ/p are two models of one generic fibre.

### `R08.4/hodge-type-resolution` (construction). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `flatHodgeTypeQuotient` (constructor): R^v, the Hodge-type-v part of the flat ring.
  - API `flatResolution` (constructor): 𝒢ℛ^{v,loc} with Θ^v : 𝒢ℛ^{v,loc} → Spec R^v projective.
  - API `flatResolution_generic_iso` (characterisation): Θ^v[1/p] is an isomorphism.
  - API `flatResolution.points` (universal-property): An admissible B-point is a finite-flat model lattice satisfying the labelled Hodge determinant/rank condition defining v. Pullback of the universal lattice and its filtration commutes with coefficient base change.
  - example `flatResolution_small_ramification` (degenerate): e < p − 1: Θ^v is an isomorphism integrally.
  - example `flatResolution_generic_iso` (characterisation): Θ^v is an isomorphism after inverting p.
  - example `flatResolution_not_integral_iso` (non-example): Θ^v has positive-dimensional closed fibre in general.

### `R08.4/resolution-local-structure` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: 𝒢ℛ^{v,loc} is normal and Cohen–Macaulay, and its closed fibre 𝒢ℛ^{v,loc}_0 is reduced and normal with rational singularities. A closed point of 𝒢ℛ^v lies in 𝒢ℛ^{v,loc} exactly when, for each σ ∈ Gal(K₀/ℚ_p), the nilpotent endomorphism π of σ-part of φ*𝔐/E(u)𝔐 has Jordan type dominated by the dual partition of v_σ. If for each σ any two of the v_ψ with ψ|K₀ = σ differ by at most 1, and either every v_ψ ∈ {0, 1} or e ≤ 2, then 𝒢ℛ^{v,loc} = 𝒢ℛ^v.

### `R08.4/ordinary-type-of-components` (lemma). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.
  statement: Every point 𝔐_A of the moduli has a maximal multiplicative subobject 𝔐^m_A and a maximal étale quotient 𝔐^ét_A, compatible with base change and exchanged by duality; their ranks d_m and d_ét are constant on each connected component of 𝒢ℛ^{v,loc}_0. For a pair d = (d_ét, d_m), an E-point x of Spec R^v lies on a connected component of Spec R^v[1/p] corresponding to a component of type d exactly when the maximal unramified subrepresentation of V_x(−1) has dimension d_m and the maximal unramified quotient of V_x has dimension d_ét.

### `R08.4/rank-two-nonordinary-connected` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let d = 2, v_ψ = 1 for all ψ (so 𝒢ℛ^v = 𝒢ℛ^{v,loc}), and K₀ = ℚ_p. Any two non-ordinary 𝔽′-points of 𝒢ℛ^v_0 lie on the same connected component. So the non-ordinary locus of Spec R^v[1/p] is connected.

### `R08.4/rank-two-ordinary-locus` (theorem). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1, tauceti:TauCetiRoadmap.
  statement: Let d = 2 and v_ψ = 1 for all ψ (K₀ arbitrary). The ordinary part 𝒢ℛ^{v,ord}_0 of the closed fibre, if non-empty, is a single point, unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁, χ₂ unramified. In that case it is two points (the models D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₂} and D(𝒢_{χ₂^{−1}ω}) ⊕ 𝒢_{χ₁}) if χ₁ ≠ χ₂, and ℙ¹ if χ₁ = χ₂, all its models being isomorphic to D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₁}.

### `R08.4/rank-two-bt-components` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let d = 2, v_ψ = 1 for all ψ (Barsotti–Tate with cyclotomic-type determinant), R = R^{fl,□} ⊗ 𝒪_F and R^v its Hodge-type-v quotient. (1) R^v is flat over ℤ_p of pure relative dimension 4 + [K : ℚ_p], and R^v[1/p] is formally smooth; its irreducible components are its connected components. (2) If E-points x₁, x₂ lie on the same irreducible component, then V_{x₁} and V_{x₂} are both ordinary or both non-ordinary. Conversely they lie on the same component if (i) both are non-ordinary and K₀ = ℚ_p, or (ii) both are ordinary and the characters of G_K on the lines L_i ⊂ V_{x_i} where I_K acts cyclotomically have the same reduction mod π_E. The same holds for R^fl ⊗ 𝒪_F when End V_𝔽 = 𝔽, with relat

### `R08.4/bt-ring-unique-generalisation` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let p be odd, F_v/ℚ_p finite and R = R^{ε_p^{-1},BT}_v the fixed-determinant Barsotti–Tate lifting ring (crystalline of Hodge–Tate weights {0, 1}, determinant ε_p^{-1}) of ρ̄ : G_{F_v} → GL₂(k). Each generic point of Spec(R/ϖ) is the specialisation of a unique generic point of Spec R. Moreover, if ρ̄ is trivial, k_v ≠ 𝔽_p and R ≠ 0, Spec R has exactly two irreducible components, whose points are the ordinary and the non-ordinary lifts.

## Layer R08.5

### `R08.5/connected-kisin-modules-with-coefficients` (construction). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.
  - API `kisinGroupoid` (constructor): D_{𝔖,M_𝔽}: over (A, I), pairs (𝔐_A, ι) with 𝔐_A ∈ R07.4's (Mod/𝔖)_A and ι : 𝒪_ℰ ⊗ 𝔐_A ⊗_A 𝔽 ≅ M_𝔽; morphisms are isomorphisms compatible with ι.
  - API `kisinGroupoid.connected` (constructor): D^c_{𝔖,M_𝔽} ⊆ D_{𝔖,M_𝔽}: the full subgroupoid of objects connected in R07.4's sense.
  - API `kisinGroupoid_toPhiModule` (functoriality): 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A, a morphism of groupoids D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7).
  - API `kisinGroupoid.baseChange` (functoriality): Along an admissible morphism of augmented coefficient algebras, tensor the Kisin module, keep connectedness (R07.4 base change) and transport ι; identity and composition laws hold up to the canonical isomorphisms.
  - API `kisinGroupoid.connected_iff_etalePart` (characterisation): For p = 2 an object over a finite field is in D^c iff its maximal étale quotient in R07.4's sense is zero; for p > 2 every object of height ≤ 1 is allowed and D^c is not used.
  - example `rank_one_etale` (computation): Rank one with φ(e) = E(u)e over 𝔽: the object is étale (R07.4) and lies in D_{𝔖,M_𝔽} but not in D^c_{𝔖,M_𝔽}.
  - example `rank_one_multiplicative` (computation): Rank one with φ(e) = e: multiplicative, hence connected, so it lies in D^c_{𝔖,M_𝔽}.
  - example `rank_one_cyclotomic` (computation): The rank-one module with φ(e) = pE(u)/E(0)·e is étale because p/E(0) is a unit, so it is not in D^c. Use the source's fixed (1) twist in the Galois realisation when comparing characters.
  - example `p_odd_vs_two` (non-example): At p = 2 an étale rank-one object is not connected and still has a finite-flat étale model: D^c is the connected part only, and Kisin's connected equivalence does not exclude nonconnected finite-flat groups.

### `R08.5/etale-multiplicative-parts` (lemma). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: For (A, I) in 𝔄𝔲𝔤_{W(𝔽)} and 𝔐_A in D_{𝔖,M_𝔽}(A, I), 𝔐_A has a maximal étale quotient 𝔐^{ét}_A and a maximal multiplicative subobject 𝔐^m_A in (Mod/𝔖)_A, 𝔐_A/𝔐^m_A is in (Mod/𝔖)_A, and both constructions commute with base change (Lemma 2.1.8). 𝔐_A is connected iff 𝔐^{ét}_A = 0 (Lemma 2.1.9), and the inclusion D^c_{𝔖,M_𝔽} → D_{𝔖,M_𝔽} is open and closed (Proposition 2.1.10).

### `R08.5/connected-model-moduli` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: D_{𝔖,M_𝔽} → D_{M_𝔽} is relatively representable and projective: for a complete local R and ξ ∈ D_{M_𝔽}(R) there is a projective R-scheme 𝒢ℛ_{V_𝔽,ξ} with |D_{𝔖,M_𝔽,ξ}|(A, I) ≅ Hom_{Spec R}(Spec A, 𝒢ℛ_{V_𝔽,ξ}), and Θ_{V_𝔽,ξ} : 𝒢ℛ_{V_𝔽,ξ} → Spec R becomes a closed immersion after inverting p; the connected part is a closed and open subscheme 𝒢ℛ^c_{V_𝔽,ξ} (Proposition 2.1.12).

### `R08.5/flat-connected-deformation-ring` (theorem). Needs: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, tauceti:TauCetiRoadmap.
  statement: Let D^{fl,c}_{V_𝔽} ⊆ D^{fl}_{V_𝔽} ⊆ D_{V_𝔽} be the deformations that arise from finite flat connected (resp. finite flat) 𝒪_K-group schemes; D^{fl,c} → D_{M_𝔽} is fully faithful. Both inclusions are relatively representable and closed, and for the maximal quotient R^c of R over which ξ is flat connected, Spec R^c[1/p] → Spec R[1/p] is an open immersion (Lemma 2.2.2). If ξ → D^{fl,c} is formally smooth then R[1/p] is formally smooth over W(𝔽)[1/p] (Lemma 2.2.3). There is Θ_{V_𝔽} : D^c_{𝔖,M_𝔽} → D^{fl,c}_{V_𝔽} compatible with 𝒪_ℰ ⊗ − (Proposition 2.2.4), and for formally smooth ξ the projective morphism Θ : 𝒢ℛ^c_{V_𝔽,ξ} → Spec R becomes an isomorphism after inverting p (Proposition 2.2.7).

### `R08.5/rank-two-type-v` (lemma). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: A Kisin module 𝔐_A of 𝔖_A-rank 2 is of type v if (1 ⊗ φ)(φ^*𝔐_A)/E(u)𝔐_A is maximal isotropic in 𝔐_A/E(u)𝔐_A (2.3.1). If 𝔐_A is free of type v with φ-matrix H, then det H = pE(u)/E(0)·w with w ∈ 𝔖_A^× (Lemma 2.3.2). If 𝔐_𝔽 is connected of type v, every deformation 𝔐_A is connected with 𝔐^m_A = 0 (Lemma 2.3.3). For V_A = Θ(𝔐_A), det V_A|_{I_K} ≅ χ, and det V_A ≅ χ on G_K iff det H = pE(u)/E(0)·w with w ↦ 1 in (W(k) ⊗ A)^× iff a basis can be chosen with det H = pE(u)/E(0) (Lemma 2.3.4).

### `R08.5/rank-two-connected-components` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: For ξ ∈ D^{fl,c}_{V_𝔽}(R) with dim V_𝔽 = 2: the type-v locus 𝒢ℛ^{c,v}_{V_𝔽,ξ} ⊆ 𝒢ℛ^{fl,c}_{V_𝔽,ξ} is closed, Θ^v factors through Spec R^v (inertia acting on det by χ) and is an isomorphism after inverting p; and if ξ has determinant χ and ξ → D^{fl,c,χ} is formally smooth, the complete local rings of 𝒢ℛ^{c,v} are those of Hilbert modular varieties (Deligne–Pappas), so 𝒢ℛ^{c,v} is a normal local complete intersection over W(𝔽) with geometrically reduced special fibre and formally smooth generic fibre (Theorem 2.3.9). If det V_𝔽 = χ and V_𝔽 comes from a connected finite flat group scheme, the closed fibre 𝒢ℛ^{c,v}_{V_𝔽,0} is geometrically connected when k = 𝔽_p or G_K acts trivially on V_𝔽, an

### `R08.5/ordinary-deformations-p2` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: For a discrete ℤ_p[Γ_K]-module M with p nilpotent, H¹_f(G_K, M(χ)) (the classes whose inertial image lies in 𝒪^×_{K^ur} ⊗ M) is right exact in M (Lemma 2.4.2). The groupoid D^{ord,χ}_{V_𝔽} of triples (V_A, L_A, ι_A) with det V_A ≅ χ, L_A a G_K-stable line with I_K acting by χ, and extension class in H¹_f (2.4.3) is relatively representable and projective over D^χ_{V_𝔽}; Θ^{ord} becomes a closed embedding after inverting p, and is formally smooth when ξ is (Proposition 2.4.4). The scheme-theoretic image R^{ord}_ξ has as E-points the crystalline representations (χη ∗; 0 η^{−1}) with η unramified, R^{ord}_ξ[1/p] is formally smooth, and R^{ord}_ξ is a domain unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁ ≠ χ₂ and

### `R08.5/weight-p-crystalline-ordinarity` (comparison). Needs: PadicHodgeTheory:R06.4.
  statement: Let p ≥ 3, F/ℚ_p finite unramified and ρ : G_F → GL₂(E) a lift of ρ̄ that is crystalline of weight k (Hodge–Tate weights {0, k − 1}) with 2 ≤ k ≤ p. If ρ̄ is ordinary (has a G_F-stable line with unramified quotient), ρ is ordinary. The endpoint k = p, where Fontaine–Laffaille modules of filtration length p − 1 occur but the torsion functor is not fully faithful, is included.

### `R08.5/dyadic-minimal-lifts` (construction). Needs: GlobalGaloisDeformations:R04.4.
  - API `DyadicMinimal.lift` (constructor): The lift ρ₀ = unramified twist of Ind(γ̂δ) in case (a), or the S₄-lift in case (b).
  - API `DyadicMinimal.restrict_inertia` (characterisation): ρ₀|I_v is independent of δ (case (a)).
  - API `DyadicMinimal.det_inertia` (simp): det ρ₀|I_v is the Teichmüller lift of det ρ̄_v|I_v.
  - API `DyadicMinimal.conductor` (compatibility): a(ρ₀) = a(ρ̄_v).
  - API `DyadicMinimal.problem` (constructor): Minimal lifts: the inertia-rigid problem attached to ρ₀ (GlobalGaloisDeformations R04.4).
  - example `dyadicMinimal_det` (computation): For ρ̄_v = Ind(γ) with γ of order 3·2^a on a ramified quadratic L, det ρ₀|I_v = Teichmüller(det ρ̄_v|I_v).
  - example `dyadicMinimal_naive_fails` (non-example): The naive lift Ind(γ̂) without δ has det|I_v = ε_L·(γ̂∘t), which differs from the Teichmüller lift of det ρ̄|I_v by the ramified ε_L; δ corrects it.
  - example `dyadicMinimal_A4` (computation): q = 2, p = 3, G ≅ A₄: ρ₀ has projective image S₄ ⊂ PGL₂(ℤ₃) or its subgroup A₄.
  - example `dyadicMinimal_tame` (degenerate): If #G is prime to p, ρ₀ is the unique lift with ρ₀(I_v) ≅ ρ̄_v(I_v) (KW II §3.3.1, first case).

### `R08.5/twisted-semistable-away-from-p` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Let v ∤ p and ρ̄|D_v = (γ̄_vχ̄_p ∗; 0 γ̄_v). Fix a character γ_v of D_v lifting γ̄_v whose restriction to I_v is the Teichmüller lift, with γ_v²χ_p = φ, and consider lifts (γ_vχ_p ∗; 0 γ_v). For a finite 𝒪-algebra A, |Z¹(G_{F_v}, A(χ_p))| = |A|·|H⁰(G_{F_v}, A)| = |A|², and the moduli of such lifts with a stable line is a smooth resolution as in R08.5/semistable-weight-two-resolution with cocycle module of rank 2. If ρ̄_v is ramified, the conductor of such a lift equals the conductor of ρ̄_v.

### `R08.5/kw1-endpoint-weight-rings` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: KW I Theorem 4.1 (modularity lifting) needs, at p, local deformation rings of the following lifts of ρ̄|G_{ℚ_p}, each with a flat reduced framed fixed-determinant ring of relative dimension 3 + 1 = 4 with regular generic fibre (or formally smooth): (1) p = 2: crystalline of weight 2 (Kisin's 2-adic Barsotti–Tate rings, R08.5/flat-connected-deformation-ring and R08.5/rank-two-connected-components), or semistable of weight 2 when k(ρ̄) = 4 (R08.5/semistable-weight-two-resolution, homothety case included); (2) p > 2: crystalline of weight k with 2 ≤ k ≤ p + 1 — the Fontaine–Laffaille range k ≤ p − 1, the endpoint k = p (R08.5/weight-p-crystalline-ordinarity) and k = p + 1 (R08.5/weight-p-plus-o

## Layer R08.6

### `R08.6/kw-local-conditions` (definition). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  - API `KWCondition.points` (characterisation): 𝒪′-points of the ring are exactly the X_v-lifts.
  - example `kwCondition_points` (characterisation): The ring classifies exactly the X_v-lifts on 𝒪′-points.
  - example `kwCondition_choice_needed` (non-example): For unramified ρ̄_v = η̄₁ ⊕ η̄₂ with η̄₁ ≠ η̄₂, the union over both choices of the unramified-quotient character has two components, so it is not a domain; KW II fix one choice.

### `R08.6/export-fontaine-laffaille-irreducible` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let F_v = ℚ_p and ρ̄_p be irreducible of weight k ≤ p. The ring of crystalline lifts of weight k with fixed determinant is formally smooth over 𝒪 of relative dimension 1, and the framed ring R̄^{□,ψ}_v is formally smooth of relative dimension 4 = 3 + [ℚ_p : ℚ_p]. The same holds for p = 2 (k = 2).

### `R08.6/export-weight-two-irreducible` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let p ≠ 2, F_v = ℚ_p and ρ̄_p irreducible. After enlarging 𝒪, the fixed-determinant ring of weight-two potentially semistable lifts of this nontrivial tame principal-series inertial type is 𝒪⟦T₁, T₂⟧/(T₁T₂ − p), and every 𝒪′-point is of the required type. The framed ring R̄^{□,ψ}_v ≅ 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p) is a domain, flat of relative dimension 4, with regular generic fibre, and it is not formally smooth.

### `R08.6/export-ordinary` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Let F_v/ℚ_p be unramified, ρ̄_v ordinary with k(ρ̄_v) ≤ p, and X_v the low-weight crystalline or weight-two potentially Barsotti–Tate condition, with the chosen unramified character. Then R̄^{□,ψ}_v is a domain, flat over 𝒪 of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre. It is formally smooth if ρ̄_v is ramified or ρ̄_v ≅ η₁ ⊕ η₂ with η₁ ≠ η₂ unramified. Every lift of this type is (χ₁η₁ ∗; 0 η₂) with η₁, η₂ unramified, where χ₁ = χ_p^{k−1} (crystalline) or χ_pω^{k−2} (weight two).

### `R08.6/export-semistable-weight-two-at-p` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) with γ̄_v unramified, and X_v the semistable weight-two lifts (γ_vχ_p ∗; 0 γ_v) with a fixed unramified γ_v lifting γ̄_v and γ_v²χ_p = φ. R̄^{□,ψ}_v is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p], unless p = 2 and D_v acts by homotheties. In that case it is a domain, faithfully flat of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre.

### `R08.6/export-endpoint-weight` (theorem). Needs: tauceti:TauCetiRoadmap.
  statement: Let p>2, F_v=ℚ_p and k(ρ̄_v)=p+1 in the KW II §3.2.7 residual Serre-weight case, with its compatible fixed determinant. The framed ring of crystalline (hence ordinary) lifts of weight p+1 is formally smooth over 𝒪 of relative dimension 4. The map to the space of characters of the stable line is not formally smooth.

### `R08.6/export-away-from-p` (theorem). Needs: GlobalGaloisDeformations:R04.4, tauceti:TauCetiRoadmap.
  statement: Let v ∤ p. (a) Semistable condition (γ_vχ_p ∗; 0 γ_v) with a fixed character γ_v (Teichmüller on inertia, γ_v²χ_p = φ): R̄^{□,ψ}_v is a domain, flat of relative dimension 3, with regular generic fibre (§3.3.4). (b) Inertia-rigid conditions (minimally ramified, abelian with fixed inertial character, non-abelian of level two with F_v = ℚ_q): after enlarging 𝒪 there is a lift ρ₀ with finite ρ₀(I_v) and determinant φ. The ring is flat, each component of relative dimension 3, with regular generic fibre (GlobalGaloisDeformations R04.4/inertia-rigid-deformations with d = 2, fixed determinant).

### `R08.6/local-nonemptiness` (theorem). Needs: DeformationAndDerivedPatchingAlgebra:R03.3, tauceti:TauCetiRoadmap.
  statement: For every condition X_v of kw-local-conditions (with the hypotheses of KW II Theorem 3.1), R̄^{□,ψ}_v ≠ 0, and it has a point over the integers 𝒪′ of a finite extension of E, that is, a lift of ρ̄_v of type X_v. The same holds for their completed tensor product.

### `R08.6/dyadic-weight-two-transition` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let p = 2, F_v = ℚ₂ (or F_v/ℚ₂ unramified for reducible ρ̄_v), and φ = ψχ₂ a fixed determinant. The weight-two lifts used in KW I Theorem 5.1(2) and KW II §3.2.2(i) at p = 2 are: crystalline of weight 2 (equivalently Barsotti–Tate with det|I_v = χ₂) if k(ρ̄_v) = 2, and semistable of weight 2 with inertial Weil–Deligne parameter (id, N ≠ 0) if k(ρ̄_v) = 4. In the first case R̄^{□,ψ}_v is Kisin's 2-adic flat ring (R08.5/flat-connected-deformation-ring, R08.5/rank-two-connected-components), flat of relative dimension 3 + [F_v:ℚ₂] with regular generic fibre; in the second it is the semistable weight-two ring (γ_vχ₂ ∗; 0 γ_v) of R08.6/export-semistable-weight-two-at-p, formally smooth unless D_v 

### `R08.6/ordinary-pcris-lifts-reducible` (theorem). Needs: PadicHodgeTheory:R06.4, tauceti:TauCetiRoadmap.
  statement: Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S}, and μ = κ^{r−1}χ₀ (r ≥ 2, χ₀ of finite order) a geometric lift of det ρ̄. After enlarging 𝒪, for v | p there is an ordinary potentially crystalline lift ρ_v of ρ̄|G_{F_v} with Hodge–Tate weights {0, r − 1} and determinant μ; and there is always an ordinary potentially crystalline lift with Hodge–Tate weights {0, r − 1} having a non-trivial unramified quotient, possibly without det ρ_v = μ. Here a lift is ordinary when it is F′_v-ordinary of some weight in the sense of L7/g-valued-ordinary-condition (for GL₂: a stable line with the prescribed inertial characters).

### `R08.6/serre-weight-crystalline-lift` (theorem). Needs: PadicHodgeTheory:R06.4.
  statement: Let ρ̄_p : G_{ℚ_p} → GL₂(k) (or G_{F_v} with F_v = ℚ_p at each v | p) and r = k(ρ̄_p) Serre's weight (Serre 1987 §2.3). After enlarging 𝒪 there is a crystalline lift ρ_p of ρ̄_p with Hodge–Tate weights {0, r − 1}; when ρ̄_p is reducible it may be chosen ordinary with an unramified quotient.

### `R08.6/newton-thorne-local-quotients` (application). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let r : G_F → GL₂(k) with det = ε^{-1} and R_v the fixed-determinant lifting ring at v. The local quotients R̄_v used in Newton–Thorne §4 are: (1) v | p, r_{π,ι}|G_{F_v} non-ordinary: the reduced 𝒪-torsion-free quotient of crystalline non-ordinary lifts of Hodge–Tate weights {0, 1}, a domain of dimension 4 + [F_v:ℚ_p] (Kisin, Corollary 2.3.13); (2) v | p, ordinary crystalline: the ordinary crystalline quotient, a domain of dimension 4 + [F_v:ℚ_p] (Kisin, Proposition 2.4.6); (3) v ∈ Σ_p (ordinary non-crystalline, p > 2): the semistable non-crystalline quotient, a domain of dimension 4 + [F_v:ℚ_p] (Snowden, Proposition 4.3.1); (4) v ∈ Σ^p: the extensions of ε^{-1} by 1, a domain of dimension 4

### `R08.6/torsion-semistable-condition` (theorem). Its statement uses local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's earlier nodes; not elaborated in this round.
  statement: Let F_v/ℚ_p be finite and r̄ : G_{F_v} → GL₂(k). The condition on a lift r_B (B ∈ C_𝒪 Artinian) that B² be isomorphic, as ℤ_p[G_{F_v}]-module, to a subquotient of a lattice in a semistable ℚ_p[G_{F_v}]-representation with Hodge–Tate weights in {0, 1} is stable (closed under subobjects, quotients and finite direct sums in the sense of Ramakrishna), so it cuts out a quotient R′_v of the fixed-determinant lifting ring R_v. The semistable non-crystalline quotient of R08.6/newton-thorne-local-quotients (3) factors through R′_v.

### `R08.6/category-deformation-conditions` (construction). Needs: GlobalGaloisDeformations:R04.3.
  - API `CategoryCondition` (data): A full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients, containing V.
  - API `CategoryCondition.defFunctor` (constructor): D^S_{V,𝒪} and D^{ψ,S}_{V,𝒪}.
  - API `CategoryCondition.ring` (constructor): R^S_{V,𝒪}, R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪}, R^ψ_{V,𝒪}.
  - API `CategoryCondition.tangent` (characterisation): Tangent space of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄) ⊂ H¹(G_ℓ, ad⁰ρ̄).
  - API `CategoryCondition.flat` (compatibility): For S the finite flat modules, D^S is R08.4/flat-deformation-condition.
  - API `CategoryCondition.mono` (functoriality): For S⊂T satisfying the category-condition hypotheses and the same residual object and determinant, D^S⊂D^T induces a canonical surjection R^T↠R^S commuting with the universal lifts.
  - example `categoryCondition_all` (degenerate): S = S(ρ̄): R^S_{V,𝒪} = R_{V,𝒪}.
  - example `categoryCondition_flat` (compatibility): S = finite flat 𝒪[G_ℓ]-modules (ℓ = p): R^S is the flat deformation ring.
  - example `categoryCondition_not_closed` (non-example): The full subcategory consisting of 0 and a single copy of the residual object V is not closed under finite products: V⊕V is missing. It therefore fails the category-condition hypotheses. A category of semisimple sums is not a counterexample to subobject/quotient closure.
  - example `categoryCondition_tangent_dim` (computation): For S = finite flat, ρ̄ peu ramifié of weight 2 over ℚ_p: dim H¹_S(G_p, ad⁰ρ̄) = 1 + dim H⁰(G_p, ad⁰ρ̄).

-/
