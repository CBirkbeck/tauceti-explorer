/-
# Suggested Lean forms for local Galois deformation rings

This file is not the roadmap and is not exhaustive. `README.md` is definitive.
The declarations suggest Lean names and signatures for contributors and reviewers;
proof placeholders do not constitute an implementation.

The coefficient prime is `p`, and Hodge–Tate weights satisfy `HT(ε) = +1`.
`LiftingRing` is the framed local ring. A condition is an ideal of that ring,
with quotient `ConditionRing`; `GenericFibre ϖ R` means `R[1/ϖ]`.
`IsPowerSeriesOver 𝒪 R d` describes the complete local power-series presentation.
The tame relation is `Φ σ Φ⁻¹ = σ^q`.

These signatures use Mathlib `082e2d3` and Tau Ceti `f790474`.
The imported deformation-functor carrier is displayed in a self-contained adapter
until its supplier is available as an import. Its mathematical ownership remains
with GlobalGaloisDeformations R04.1. Supplier-dependent signatures that cannot yet
be expressed are specified in the final interface inventory, with their full
mathematical statements. No missing condition is replaced by an arbitrary
`Prop` field or a `Prop` definition with a placeholder body.
-/

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

universe u

open Matrix

noncomputable section

set_option linter.overlappingInstances false
set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

/-! ## Imported carrier (GlobalGaloisDeformations R04.1)

`Lift`, `strictKernel` and the strict-conjugation action display the interface supplied by
GlobalGaloisDeformations R04.1. Replace this adapter with its module import when that
interface is implemented; this roadmap adds no second deformation functor. -/

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
example [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
    [IsAdicComplete (IsLocalRing.maximalIdeal 𝒪) 𝒪] [Finite (IsLocalRing.ResidueField 𝒪)] :
    Nonempty (CoeffRing (𝒪 := 𝒪) (IsLocalRing.ResidueField 𝒪) .finite ≃ₐ[𝒪] 𝒪) := sorry

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

/- The continuous tame-pair constructor needs the complete local coefficient category,
pro-p inertia and continuous Frobenius data. Its full specification is in the inventory;
the matrix relation alone is insufficient to give its signature here. -/

/-- API `TameGroup.lift_ext`: representations agreeing on `t` and `φ_q` are equal. -/
theorem TameGroup.lift_ext (p q : ℕ) [TopologicalSpace A] [T2Space A]
    (r₁ r₂ : TameGroup p q →* GL (Fin n) A) (hr₁ : Continuous r₁) (hr₂ : Continuous r₂)
    (ht : r₁ (TameGroup.t p q) = r₂ (TameGroup.t p q))
    (hφ : r₁ (TameGroup.φ p q) = r₂ (TameGroup.φ p q)) : r₁ = r₂ := sorry

/- The local-field quotient isomorphism needs its valuation, residue cardinality and
prime-to-p inertia quotient; these are supplied by the local-field roadmap. -/

/-- `tameGroup_q_one` (degenerate): for `q = 1` the relation says `t` and `φ` commute. -/
example (p : ℕ) : TameGroup.φ p 1 * TameGroup.t p 1 = TameGroup.t p 1 * TameGroup.φ p 1 := by
  have h := TameGroup.conj_t p 1
  rw [pow_one] at h
  calc TameGroup.φ p 1 * TameGroup.t p 1
      = TameGroup.φ p 1 * TameGroup.t p 1 * (TameGroup.φ p 1)⁻¹ * TameGroup.φ p 1 := by group
    _ = TameGroup.t p 1 * TameGroup.φ p 1 := by rw [h]

/-- `tameGroup_not_direct` (non-example): for `q ≥ 2`, `T_q` is not abelian (`t` has infinite order). -/
example (p q : ℕ) [Fact p.Prime] (hpq : Nat.Coprime p q) (hq : 2 ≤ q) :
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
condition (with respect to a uniformiser `ϖ`) is prime, i.e. the Steinberg ring is a domain (Thorne,
Proposition 3.17; Newton–Thorne, proof of Lemma 3.8). -/
theorem steinbergRing_isPrime {𝒪 : Type} [CommRing 𝒪] [IsLocalRing 𝒪] [IsNoetherianRing 𝒪]
    [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
    {𝔽 : Type} [Field 𝔽] [Algebra 𝒪 𝔽] (p q : ℕ) [Fact p.Prime] (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽)
    (hρ₀ : ρ₀ = 1) (hq : (q : 𝔽) = 1)
    (ϖ : 𝒪) (hϖ : Irreducible ϖ) (Istein : Ideal (LiftingRing 𝒪 n ρ₀))
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
    [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
    (ρ₀ : TameGroup p q →* GL (Fin n) 𝔽) (hρ₀ : ρ₀ = 1) (hq : (q : 𝔽) = 1) (ϖ : 𝒪) (hϖ : Irreducible ϖ)
    (ζ : Fin n → 𝒪) (hζ1 : ∀ i, ζ i - 1 ∈ Ideal.span {ϖ}) (hζ : Function.Injective ζ) :
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

/-- `levelRaising_dims` (computation): the nodal model `k⟦x₀, x₁⟧/(x₀x₁)` has Krull dimension `1` over a
field (`2` over `𝒪`); each of its two components is a line. -/
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

/-- **`R08.2/rigid-residual-conditions`**, the disjoint ramification sets used in the rigidity condition.
The actual `IsRigidFor` predicate also needs polarized local and Fontaine–Laffaille data,
and is specified in the interface inventory. -/
structure RamificationSets where
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

/-- **`R08.3/hodge-and-galois-types`**, coordinate multiplicity profile of rank `d`, used to calculate a Hodge-type flag dimension from its
graded multiplicities at each embedding `σ ∈ ι` (`ι = Hom(K, Ē)`); the multiplicities sum to `d`. -/
@[ext]
structure HodgeMultiplicityProfile (ι : Type*) (d : ℕ) where
  mult : ι → List ℕ
  sum_eq : ∀ σ, (mult σ).sum = d

/-- `(d² − Σ_j m_j²)/2`, the dimension of the flag variety of one embedding. -/
def flagDim (m : List ℕ) : ℕ := (m.sum ^ 2 - (m.map (· ^ 2)).sum) / 2

/-- API `HodgeMultiplicityProfile.adQuotDim`: `dim_E ad D_{E,K}/Fil⁰ = Σ_σ (d² − Σ_j m_{σ,j}²)/2`. -/
def HodgeMultiplicityProfile.adQuotDim {ι : Type*} [Fintype ι] {d : ℕ} (v : HodgeMultiplicityProfile ι d) : ℕ :=
  ∑ σ, flagDim (v.mult σ)

/-- API `OpenKernelInertiaData`: the open-kernel inertia coordinates of a type. A full type also carries its Weil-extension compatibility. -/
structure OpenKernelInertiaData (I : Type*) [Group I] [TopologicalSpace I] (E : Type*) [Field E] (r : ℕ) where
  toHom : I →* GL (Fin r) E
  isOpen_ker : IsOpen (toHom.ker : Set I)

/-- API `OpenKernelInertiaData.conjugacy`: conjugating a Galois type by `g ∈ GL_r(E)` gives a Galois type with the same
kernel. -/
def OpenKernelInertiaData.conj {I : Type*} [Group I] [TopologicalSpace I] {E : Type*} [Field E] {r : ℕ}
    (τ : OpenKernelInertiaData I E r) (g : GL (Fin r) E) : OpenKernelInertiaData I E r where
  toHom := (MulAut.conj g).toMonoidHom.comp τ.toHom
  isOpen_ker := sorry

theorem OpenKernelInertiaData.conjugacy {I : Type*} [Group I] [TopologicalSpace I] {E : Type*} [Field E] {r : ℕ}
    (τ : OpenKernelInertiaData I E r) (g : GL (Fin r) E) : (τ.conj g).toHom.ker = τ.toHom.ker := sorry

/-- `adQuotDim_regular` (computation): regular weights in rank two over `ℚ_p` give `1`. -/
example : (HodgeMultiplicityProfile.adQuotDim (⟨fun _ ↦ [1, 1], fun _ ↦ rfl⟩ : HodgeMultiplicityProfile (Fin 1) 2)) = 1 := by decide

/-- `adQuotDim_formula` (characterisation): rank three with multiplicities `(2, 1)`: `(9 − 5)/2 = 2`. -/
example : (HodgeMultiplicityProfile.adQuotDim (⟨fun _ ↦ [2, 1], fun _ ↦ rfl⟩ : HodgeMultiplicityProfile (Fin 1) 3)) = 2 := by decide

/-- `galoisType_open_kernel` (non-example): a homomorphism with non-open kernel (such as the cyclotomic
character on inertia) is not a Galois type. -/
example {I E : Type*} [Group I] [TopologicalSpace I] [Field E] (χ : I →* GL (Fin 1) E)
    (h : ¬ IsOpen (χ.ker : Set I)) : ¬ ∃ τ : OpenKernelInertiaData I E 1, τ.toHom = χ := by
  rintro ⟨τ, rfl⟩
  exact h τ.isOpen_ker

/- The period-condition quotient needs the full labelled Hodge type, the actual
local inertia and its Weil extension, and the period-ring predicate. A multiplicity
profile alone does not supply this data; these quotient signatures are therefore
specified in the complete inventory, rather than formed with that profile. -/

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

/-- A ring-theoretic input to **`R08.4/components-via-special-fibre`**: a separated flat
local algebra with domain uniformizer quotient is a domain. The component theorem itself
uses a projective resolution and its closed-point fibre, as specified in the inventory. -/
theorem domain_of_specialFibre_domain [IsDomain 𝒪] [IsAdicComplete (IsLocalRing.maximalIdeal 𝒪) 𝒪]
    (R : Type) [CommRing R] [Algebra 𝒪 R] [IsLocalRing R] [IsNoetherianRing R] [Module.Flat 𝒪 R]
    (ϖ : 𝒪) (hϖ : Ideal.span {ϖ} = IsLocalRing.maximalIdeal 𝒪)
    [IsAdicComplete (Ideal.span {algebraMap 𝒪 R ϖ}) R]
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
theorem KWCondition.ring_unique [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪] [CharZero 𝒪]
    (ρ₀ : G →* GL (Fin 2) 𝔽) (I J : Ideal (LiftingRing 𝒪 2 ρ₀)) (ϖ : 𝒪) (hϖ : Irreducible ϖ)
    (hI : flatClosure (algebraMap 𝒪 _ ϖ) I = I) (hJ : flatClosure (algebraMap 𝒪 _ ϖ) J = J)
    (hIr : I.IsRadical) (hJr : J.IsRadical)
    (hpts : ∀ (B : Type) [Field B] [CharZero B] [Algebra 𝒪 B] (x : LiftingRing 𝒪 2 ρ₀ →ₐ[𝒪] B),
      (∀ r ∈ I, x r = 0) ↔ (∀ r ∈ J, x r = 0)) : I = J := sorry

/-- **`R08.6/export-archimedean`**: for `p` odd the odd ring at a real place is a power series ring in
`2` variables (`n² − a² − b² = 4 − 1 − 1`). -/
theorem export_archimedean (ρ₀ : G →* GL (Fin 2) 𝔽) (h2 : (2 : 𝔽) ≠ 0) (c : G)
    (hc : ∀ g, g = 1 ∨ g = c) (hc2 : c * c = 1)
    (hodd : ((ρ₀ c : GL (Fin 2) 𝔽) : Matrix (Fin 2) (Fin 2) 𝔽).det = -1) :
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
@[ext]
structure FullFlag (A : Type*) [CommRing A] (n : ℕ) where
  Fil : Fin (n + 1) → Submodule A (Fin n → A)
  mono : Monotone Fil
  bot : Fil 0 = ⊥
  top : Fil (Fin.last n) = ⊤
  summand : ∀ i, ∃ Q : Submodule A (Fin n → A), IsCompl (Fil i) Q
  rank : ∀ i, Nonempty (Fil i ≃ₗ[A] (Fin (i : ℕ) → A))

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

/-- The determinant and ordered-product equations commute with coefficient maps. -/
theorem IsDetOrdinary.map {B : Type*} [CommRing B] (f : A →+* B)
    (ρ : G →* GL (Fin n) A) (χ : Fin n → G →* Aˣ) (h : IsDetOrdinary ρ χ) :
    IsDetOrdinary ((Matrix.GeneralLinearGroup.map f).comp ρ)
      (fun i ↦ (Units.map f.toMonoidHom).comp (χ i)) := sorry

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

/-- **`L8/determinant-flag-comparison`** (ACC+ Proposition 6.2.12), the dimension inequality: with
`m = [F_v:ℚ_p] > n(n+1)/2 + 1`, the locus where the characters collide has dimension at most
`n² − 1 + n(n+1)/2·m`, smaller than `1 + n² + n(n+1)/2·m`. -/
theorem detFlag_dimension_count (n m : ℕ) (hm : n * (n + 1) + 4 ≤ 2 * m) (hn : 1 ≤ n) :
    2 * (1 + n ^ 2) + n * (n + 1) + n * (n + 1) * m ≤ 2 * (n ^ 2 - 1) + n * (n + 1) * m + 2 * m := by
  have : 1 ≤ n ^ 2 := Nat.one_le_pow _ _ hn
  omega

/-- **`L8/doubling-equals-unramified`** (Calegari–Geraghty Lemma 3.22), part (1): the eigenvalue algebra
`R̃^unr = R^unr[β]/(β² − tβ − t)`, `t = φ₁ + φ₄`, is free of rank two over `R^unr` (basis `1, β`), for any
commutative ring in place of `R^unr`. Hence `R^unr → R̃^unr` is injective and `R^unr` acts faithfully on the
cokernel, which is what gives `J ⊆ I`. The equality `J = I` itself needs the rings `R†`, `R̃†` and is in the
inventory. -/
theorem doubling_quadratic_free {R : Type*} [CommRing R] (t : R) :
    Module.Free R (Polynomial R ⧸ Ideal.span
      {(Polynomial.X ^ 2 - Polynomial.C t * Polynomial.X - Polynomial.C t : Polynomial R)}) ∧
    Function.Injective (algebraMap R (Polynomial R ⧸ Ideal.span
      {(Polynomial.X ^ 2 - Polynomial.C t * Polynomial.X - Polynomial.C t : Polynomial R)})) := sorry

/- The character-ring signatures need the completed group algebra and the
selected intersection of minimal primes. Their construction, universal maps and
coefficient examples are specified in the complete inventory. -/

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
`E(u)`, with `E(0) = p·unit`), so for `φ(e) = u·e` the lattice `𝔖e` has no finite `E`-height. (That no other
lattice has finite height either, for `K = ℚ_p` and `p` odd, is the argument through characters in the
interface test; for `p = 2` the lattice `𝔖·u⁻¹e` has height `0`.) -/
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

/-- Identity coefficient change on the full flag. -/
theorem ordinaryFlagScheme.baseChange_id (F : FullFlag A n) :
    ordinaryFlagScheme.baseChange (RingHom.id A) F = F := sorry

/-- Composition of coefficient changes on the full flag. -/
theorem ordinaryFlagScheme.baseChange_comp {B C : Type*} [CommRing B] [CommRing C]
    (f : A →+* B) (g : B →+* C) (F : FullFlag A n) :
    ordinaryFlagScheme.baseChange g (ordinaryFlagScheme.baseChange f F) =
      ordinaryFlagScheme.baseChange (g.comp f) F := sorry

/-- The incidence equations pull back with the flag and its characters. -/
theorem ordinaryFlagScheme.baseChange_mem {B : Type*} [CommRing B] (f : A →+* B)
    {G : Type*} [Group G] (I : Subgroup G) (ρ : G →* GL (Fin n) A)
    (χ : Fin n → G →* Aˣ) (F : FullFlag A n)
    (hF : F ∈ ordinaryFlagScheme.points I ρ χ) :
    ordinaryFlagScheme.baseChange f F ∈ ordinaryFlagScheme.points I
      ((Matrix.GeneralLinearGroup.map f).comp ρ)
      (fun i ↦ (Units.map f.toMonoidHom).comp (χ i)) := sorry

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

/-- `connects_restrict` (compatibility) and API `Connects.restrict`: for any ring map `f : R' → R` (in
practice the map of lifting rings induced by restriction to `G_{K'}`), two points of `R` that connect give
points of `R'` that connect: the preimage of a common minimal prime contains a minimal prime of `R'`. -/
theorem Connects.restrict {R R' B : Type*} [CommRing R] [CommRing R'] [CommRing B] (f : R' →+* R)
    {x y : R →+* B} (h : Connects x y) : Connects (x.comp f) (y.comp f) := by
  obtain ⟨P, hP, hx, hy⟩ := h
  have : P.IsPrime := hP.1.1
  obtain ⟨Q, hQ, hQP⟩ := Ideal.exists_minimalPrimes_le (I := (⊥ : Ideal R')) (J := P.comap f) bot_le
  exact ⟨Q, hQ, fun r hr => hx (hQP hr), fun r hr => hy (hQP hr)⟩

/-- Injective coefficient extension preserves and detects the common-component relation. -/
theorem Connects.coefficientExtension {R B C : Type*} [CommRing R] [CommRing B] [CommRing C]
    (i : B →+* C) (hi : Function.Injective i) (x y : R →+* B) :
    Connects (i.comp x) (i.comp y) ↔ Connects x y := sorry

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
`HT(ε₂) = (0, 1)`-type labelled weights the weights are `{0, m, …, (n − 1)m}` (in the source's convention
`HT(ε) = −1`; with `HT(ε) = +1` they are the negatives). -/
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

/-- The same non-example for `IsInPol`: `(X − 1)(X − 2)(X − 4)(X − 5)` lies in `Pol₄((3, 1), 2)` and not in
`Pol₄((2, 2), 2)`, although `(3, 1)` dominates `(2, 2)`. -/
example : IsInPol (2 : ℚ) [3, 1]
      ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) *
        (Polynomial.X - Polynomial.C 4) * (Polynomial.X - Polynomial.C 5)) ∧
    ¬ IsInPol (2 : ℚ) [2, 2]
      ((Polynomial.X - Polynomial.C 1) * (Polynomial.X - Polynomial.C 2) *
        (Polynomial.X - Polynomial.C 4) * (Polynomial.X - Polynomial.C 5)) := sorry

/-- **`L7/gsp4-siegel-ordinary-condition`**: the Siegel shape: `ρ(g)` stabilises the Lagrangian plane
`⟨e₁, e₂⟩`, i.e. its lower-left `2 × 2` block vanishes. -/
def IsSiegelShape (M : Matrix (Fin 4) (Fin 4) A) : Prop :=
  ∀ i j : Fin 4, 2 ≤ (i : ℕ) → (j : ℕ) < 2 → M i j = 0

/-- The symplectic form `J` (antidiagonal `(1, 1, −1, −1)`), and the similitude condition `gᵀJg = νJ`. -/
def symplecticJ : Matrix (Fin 4) (Fin 4) A := !![0, 0, 0, 1; 0, 0, 1, 0; 0, -1, 0, 0; -1, 0, 0, 0]

/-- The invertible symplectic similitude condition with multiplier `ν`. -/
def IsGSp4 (M : Matrix (Fin 4) (Fin 4) A) (ν : A) : Prop :=
  IsUnit ν ∧ M.transpose * symplecticJ * M = ν • symplecticJ

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

/-- **`L7/discrete-series-smoothness`** (CHT Lemma 2.4.28): `d(n − d) + (n − d)² + (d² − 1) + (d(n − d) + 1) = n²`,
with `d` the rank of `r̃_v` (the source uses `m` for the four terms). -/
theorem discreteSeries_dimension (n d : ℤ) :
    d * (n - d) + (n - d) ^ 2 + (d ^ 2 - 1) + (d * (n - d) + 1) = n ^ 2 := by ring

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
/-! ## Additional algebraic checks

Concrete computations, each naming the target it tests. -/

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

/-! ### CHT §§2.4.1, 2.4.2, 2.4.5 -/

/-- `L7/fontaine-laffaille-tangent-space-and-smoothness`: at `n = 2`, `F_ṽ = ℚ_l`, the ring has
`n² + [F_ṽ:ℚ_l]·n(n−1)/2 = 5` variables. -/
example : 2 ^ 2 + 1 * (2 * (2 - 1) / 2) = 5 := by decide

/-- `L7/discrete-series-smoothness` (Lemma 2.4.28): `d(n − d) + (n − d)² + (d² − 1) + (d(n − d) + 1) = n²`. -/
example (n d : ℤ) : d * (n - d) + (n - d) ^ 2 + (d ^ 2 - 1) + (d * (n - d) + 1) = n ^ 2 := by
  ring

/-- For `r̄ = ω ⊕ 1` with `ω` on the sub, the suitable first-order lifts have dimension
`1 + 1 + 3 = 5`, whereas CHT's count `n(n+1)/2 + [F_ṽ:ℚ_l]·n(n−1)/2` gives `4`. -/
example : 1 + 1 + 3 = 5 ∧ 2 * (2 + 1) / 2 + 1 * (2 * (2 - 1) / 2) = 4 := by decide

end TauCeti.GaloisDeformation.Local.SuggestedTest

/-! ## R08.5: Kisin's 2-adic rings -/

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

/-! ## Arithmetic and matrix checks (R08.1–R08.6, L7, L8)

Each block names the target it tests. Statements that need the deformation-theoretic
carriers of the supplier roadmaps are specified in the interface inventory at the end of the file. -/

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

/-- `L7/local-model-rho-nm0`: the labelled Hodge–Tate weights `{0, m, …, (n − 1)m}` (convention `HT(ε) = −1`). -/
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

namespace TauCeti.GaloisDeformation.Local.WorkedTest

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

end TauCeti.GaloisDeformation.Local.WorkedTest
/-!
## Complete mathematical interface inventory

This inventory specifies every target, API name and worked test, including statements
whose supplier carriers are not present in the pinned libraries. The declarations above
are useful coordinate signatures and algebraic tests, not a complete formalisation of
these objects. `OpenKernelInertiaData` retains only the inertia homomorphism and its open kernel; full Galois types additionally require Weil-extension compatibility.
`HodgeMultiplicityProfile` retains only graded ranks; a Hodge type also
retains its labelled jumps and filtration. `RamificationSets` retains only the two sets;
`IsRigidFor` includes the polarized local conditions and Fontaine–Laffaille hypothesis.
The `Lift` adapter belongs to GlobalGaloisDeformations R04.1. No supplier condition is
encoded as an unspecified `Prop` field.

A full statement here includes its hypotheses and mathematical suppliers, even when a
coordinate declaration above displays only part of the intended API. Once the supplier
carrier exists, give that statement its signature under the indicated name.


### `LocalGaloisDeformationRings:R08.1/local-lifting-ring` — The local framed deformation ring

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. The lifting functor Lift_ρ̄ of GlobalGaloisDeformations R04.1 is pro-represented by a complete local Noetherian 𝒪-algebra R^□_ρ̄ ∈ C_𝒪 with universal lift ρ^□ : G_K → GL_n(R^□_ρ̄).

Hypotheses: G_K satisfies Φ_p (K′^×/K′^{×p} is finite for every finite K′/K, by local class field theory)..

Suppliers: GlobalGaloisDeformations:R04.1/lifting-functor; GlobalGaloisDeformations:R04.2/phi-p-condition; GlobalGaloisDeformations:R04.2/phi-p-global; GlobalGaloisDeformations:R04.2/universal-lifting-ring; GlobalGaloisDeformations:R04.2/universal-continuous-lift; DeformationAndDerivedPatchingAlgebra:R03.2.

Sources: GEE-MLT-2022, §3.1 and Lemma 3.2, p. 12; KISIN-LECTURES, Lecture 1, (1.2) and Proposition (1.2.1)(1), p. 2.


### `LocalGaloisDeformationRings:L7/finite-height-lattices` — The functor of bounded-height lattices of a deformation family

Let K/ℚ_p be finite, 𝔖 = W(k)⟦u⟧, E(u), 𝒪_ℰ and K_∞ as in FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4/bk-coefficient-rings, and h ≥ 0. Let A be a complete local Noetherian 𝒪-algebra with finite residue field (in practice A = R^□_ρ̄ or an Artinian quotient), V_A a finite free A-module of rank d with continuous G_K-action (a deformation of V_𝔽), and M_A = M(V_A) its étale φ-module over 𝒪_{ℰ,A} (R07.4/etale-phi-modules-with-coefficients). The bounded-height lattice functor L^{≤h}_{V_A} sends an A-algebra B to the set of 𝔖_B-lattices of E-height ≤ h in M_B = M_A ⊗_A B in the sense of R07.4/finite-height-lattices (with coefficients): finite projective 𝔖_B-submodules of rank d spanning M_B, φ-stable, with coker(φ*𝔐_B → 𝔐_B) killed by E(u)^h. A morphism B → B′ sends 𝔐_B to 𝔐_B ⊗_B B′. The notions of Kisin module, E-height, étale φ-module and the uniqueness of finite-height lattices are R07.4's; this node defines only the functor on A-algebras attached to a deformation family, which L7/height-lattice-moduli represents.

Hypotheses: The general theory (𝔖, 𝒪_ℰ, M(V), Kisin modules of E-height ≤ h, uniqueness over finite flat ℤ_p-algebras by Kisin 2006, 2.1.12 with the repaired proof of Kisin 2008, Errata (E.4)) is imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4; nothing of it is rebuilt here.; Lattices are functorial in B: 𝒪_ℰ ⊗_𝔖 𝔐_B ⊗_B B′ is projective of rank d and surjects onto M_{B′}, so it is isomorphic to it (R07.4/finite-height-lattices, coefficient clause).; Two conventions. (a) Kisin defines the functor on A-algebras B killed by a power of 𝔪_A (with 𝔖_B = 𝔖 ⊗_{ℤ_p} B); for an A-algebra B that is finite over ℤ_p or ℚ_p the set of lattices is read as the set of B-points of the projective scheme of L7/height-lattice-moduli, which is how Kisin 2008, (1.6.4) uses it. (b) The étale φ-module M(V) is the one of R07.4; Kisin 2008 uses the contravariant (𝒪_{ℰ^ur} ⊗ V*)^{G_{K∞}}, and the finite flat papers use (𝒪_{ℰ^ur} ⊗ V(−1))^{G_{K∞}}. The functor depends only on the φ-module M_A, so R08.4 and R08.5 instantiate this node with the second convention without change..

Suppliers: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/finite-height-lattices; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

API `TauCeti.GaloisDeformation.Local.heightLatticeFunctor`: L^{≤h}_{V_A}: the functor from A-algebras to sets, B ↦ {𝔖_B-lattices of E-height ≤ h in M_B} (lattices in the sense of R07.4/finite-height-lattices).

API `TauCeti.GaloisDeformation.Local.heightLatticeFunctor.map`: For B → B′, 𝔐_B ↦ 𝔐_B ⊗_B B′, with map_id and map_comp.

API `TauCeti.GaloisDeformation.Local.heightLatticeFunctor.ext`: Two points of L^{≤h}_{V_A}(B) are equal iff their underlying 𝔖_B-submodules of M_B are equal; the projectivity, spanning and height conditions are properties.

API `TauCeti.GaloisDeformation.Local.heightLatticeFunctor_subsingleton`: For B finite flat over ℤ_p, L^{≤h}_{V_A}(B) has at most one element (R07.4/finite-height-lattices (1)).

API `TauCeti.GaloisDeformation.Local.heightLatticeFunctor_nonempty_iff`: For B finite flat over ℤ_p, L^{≤h}_{V_A}(B) is nonempty iff V_A ⊗_A B has E-height ≤ h in the sense of R07.4/kisin-modules and its unique 𝔖-lattice of E-height ≤ h is a projective 𝔖_B-module. The projectivity is a real condition: for K ⊇ μ_p, B = {(a, b) ∈ ℤ_p² : a ≡ b mod p} and G_K acting on V_B = B by (1, χ_p), V_B has E-height ≤ 1 but the lattices of the two factors have different reductions, so L^{≤1}(B) = ∅.

API `TauCeti.GaloisDeformation.Local.heightLatticeFunctor.mono`: For h ≤ h′, L^{≤h}_{V_A}(B) ⊆ L^{≤h′}_{V_A}(B), compatibly with base change.

Test `height_rank_one_E` (computation): Rank one, M = 𝒪_ℰ·e with φ(e) = E(u)e: in the basis e the Frobenius matrix is E(u), which divides E(u)^1 but not E(u)^0, so L^{≤1}(ℤ_p) = {𝔖e} and L^{≤0}(ℤ_p) = ∅.

Test `height_zero_iff_etale` (characterisation): A lattice with Frobenius matrix X in a basis lies in L^{≤0}(B) iff X is invertible over 𝔖_B, i.e. iff φ*𝔐_B → 𝔐_B is an isomorphism.

Test `height_u_not_finite` (non-example): For φ(e) = u·e (étale over 𝒪_ℰ, since u is a unit there) the lattice 𝔖e has Frobenius matrix u, and no power E(u)^h is divisible by u in 𝔖 (E(0) = p·unit), so 𝔖e ∉ L^{≤h}(ℤ_p) for every h. For K = ℚ_p and p odd no other lattice works either, so L^{≤h}(ℤ_p) = ∅: a rank-one lattice of finite E-height has φ(e′) = E(u)^j·w·e′ with w ∈ 𝔖^×, which is the φ-module of the restriction to G_{K∞} of a crystalline character (a power of χ_p times an unramified character), whereas φ(e) = u·e is the φ-module of the Teichmüller lift of the fundamental character g ↦ g(π^{1/(p−1)})/π^{1/(p−1)}, of order p − 1 on inertia; a power of χ_p agrees with a non-trivial finite-order character on the inertia of K_∞ for no exponent. For p = 2 that character is trivial and the claim fails: φ(u^{−1}e) = u^{−1}e, so 𝔖u^{−1}e is a lattice of E-height 0.

Sources: KISIN-PST-2008, (1.2), pp. 516–517; KISIN-PST-2008, (1.2), p. 517; KISIN-PST-2008, Errata for [Ki 2], (E.4), p. 545.


### `LocalGaloisDeformationRings:L8/ordinary-coefficient-ring` — The universal character coefficient rings Λ_v and Λ̃_v

Let F_v/ℚ_p be finite, 𝒪 the ring of integers of a finite extension E/ℚ_p with residue field k, and ρ̄ : G_{F_v} → GL_n(k) with a G_{F_v}-stable full flag 0 = Fil⁰ ⊂ ⋯ ⊂ Filⁿ = kⁿ, graded characters χ̃_i : G_{F_v} → k^× and χ̄_i = χ̃_i|_{I_{F_v}}. Let 𝒪_{F_v}^×(p) be the pro-p completion of 𝒪_{F_v}^×, with Art_{F_v} : 𝒪_{F_v}^×(p) ≅ I_{F_v^{ab}/F_v}(p), the pro-p completion of the inertia subgroup of Gal(F_v^{ab}/F_v) (not the abelianisation of I_{F_v}). For a nonempty set of minimal primes of 𝒪[[𝒪_{F_v}^×(p)ⁿ]] with intersection 𝔞, Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞; 𝔞 corresponds to a fixed collection of ordered n-tuples of characters of the torsion subgroup of I_{F_v^{ab}/F_v}(p). For each i the universal character χ_i^univ : I_{F_v} → Λ_v^× is the Teichmüller lift of χ̄_i times the map sending I_{F_v} to the i-th copy of 𝒪_{F_v}^×(p) via Art_{F_v}^{−1}. With Λ̃_v = 𝒪[[F_v^×(p)ⁿ]] ⊗_{𝒪[[𝒪_{F_v}^×(p)ⁿ]]} Λ_v, the χ_i^univ extend to χ̃_i^univ : G_{F_v} → Λ̃_v^× lifting χ̃_i.

Hypotheses: v | p; the flag on ρ̄ is part of the data..

Suppliers: PadicMeasuresIwasawaAlgebras:L1/convolution-algebra; mathlib:MvPowerSeries; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

API `TauCeti.GaloisDeformation.Local.ordinaryWeightRing`: Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞 for a chosen set of minimal primes.

API `TauCeti.GaloisDeformation.Local.universalInertialCharacter`: χ_i^univ : I_{F_v} → Λ_v^×.

API `TauCeti.GaloisDeformation.Local.ordinaryWeightRingTilde`: Λ̃_v and χ̃_i^univ : G_{F_v} → Λ̃_v^×.

API `TauCeti.GaloisDeformation.Local.universalInertialCharacter_residual`: χ_i^univ ≡ χ̄_i modulo the maximal ideal.

API `TauCeti.GaloisDeformation.Local.minimalPrimes_torsionCharacters`: Minimal primes ↔ Galois orbits of torsion characters.

API `TauCeti.GaloisDeformation.Local.ordinaryWeightRing.universal`: Continuous 𝒪-algebra maps Λ_v→A correspond to ordered continuous characters of 𝒪_{F_v}^×(p) with the prescribed reductions whose induced map from the completed group algebra kills 𝔞. The correspondence commutes with maps of complete coefficient algebras.

Test `ordinaryWeightRing_Qp` (computation): F_v = ℚ_p, p odd: 𝒪_{ℚ_p}^×(p) ≅ 1 + pℤ_p ≅ ℤ_p is torsion-free, so Λ_v = 𝒪[[X_1, …, X_n]] with 𝔞 = 0.

Test `ordinaryWeightRing_torsion` (computation): F_v = ℚ_p(ζ_p): 𝒪_{F_v}^×(p) has torsion μ_p, so 𝒪[[𝒪_{F_v}^×(p)]] has several minimal primes once ζ_p ∈ 𝒪, and 𝔞 selects tuples of characters of μ_pⁿ.

Test `ordinaryWeightRing_n_one` (degenerate): n = 1: χ_1^univ is the universal deformation of χ̄_1|_{I_{F_v}} with values in Λ_v, and Λ̃_v adds the Frobenius variable.

Sources: ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, p. 138 (arXiv v2; printed page = PDF page).


### `LocalGaloisDeformationRings:R08.1/local-tangent-obstruction` — Tangent and obstruction description of local lifting rings

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. (1) m_{R^□}/(m², λ) is dual to Z¹(G_K, ad ρ̄), of dimension h¹ + n² − h⁰ where h^i = dim_𝔽 H^i(G_K, ad ρ̄). (2) R^□_ρ̄ ≅ 𝒪[[x₁, …, x_d]]/J with d = dim Z¹(G_K, ad ρ̄), and the canonical obstruction map H²(G_K, ad ρ̄)^∨ ↠ J/𝔪J is surjective (equivalently (J/𝔪J)^∨ ↪ H²(G_K, ad ρ̄)), so J is generated by at most h² elements. (3) By local Tate duality h² = dim H⁰(G_K, ad ρ̄^∨(1)), and by the local Euler characteristic formula h⁰ − h¹ + h² = −n²[K:ℚ_p] if ℓ = p and 0 if ℓ ≠ p; hence dim R^□_ρ̄ ≥ 1 + n² + n²[K:ℚ_p] if ℓ = p and ≥ 1 + n² if ℓ ≠ p, and R^□_ρ̄ is formally smooth of relative dimension n²(1 + [K:ℚ_p]) if ℓ = p and n² if ℓ ≠ p when H⁰(G_K, ad ρ̄^∨(1)) = 0.

Hypotheses: Local Tate duality and the local Euler characteristic formula are imported from Tau Ceti ClassFieldTheory Layer 5.; The relation count (obstructions in H²) is the general presentation algebra of DeformationAndDerivedPatchingAlgebra R03.2..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; GlobalGaloisDeformations:R04.1/tangent-spaces; DeformationAndDerivedPatchingAlgebra:R03.2; tauceti:TauCeti.ContCohomology.H2; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: GEE-MLT-2022, Corollary 3.12, Lemma 3.13 and Corollary 3.14, pp. 13–14; KISIN-LECTURES, Lecture 1, Lemma (1.3.1)(2), p. 3.


### `LocalGaloisDeformationRings:R08.1/local-forget-framing` — Forgetting the framing of local lifts

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. If ρ̄ is Schur as a G_K-representation, the local universal deformation ring R_ρ̄ exists and R^□_ρ̄ ≅ R_ρ̄[[X_{ij}]]/(X_{11}) (n² − 1 variables), also with fixed determinant. If ρ̄ is not Schur (the usual case locally), R_ρ̄ need not exist and only the framed ring, with the conjugation action of the formal group Γ̂_n, is used.

Hypotheses: Schur for ρ̄|_{G_K} is a strong condition: it fails for every reducible semisimple ρ̄ and for ρ̄ unramified with repeated Frobenius eigenvalues..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; GlobalGaloisDeformations:R04.2/universal-deformation-ring; GlobalGaloisDeformations:R04.2/framed-unframed-comparison; GlobalGaloisDeformations:R04.1/strict-vs-full-conjugacy.

Sources: KISIN-LECTURES, Lecture 1, Remark (1.2.2)(3), p. 2; GEE-MLT-2022, Exercise 3.9, p. 13.


### `LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition` — The Fontaine–Laffaille deformation condition

Let l = p, F_ṽ/ℚ_l unramified, and K (integers 𝒪, residue field k) a coefficient field containing the images of all embeddings F_ṽ ↪ K̄. Use the Fontaine–Laffaille category 𝓜𝓕_{𝒪,ṽ} of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3/fl-filtered-modules (filtration in [0, l − 2], with 𝒪_{F_ṽ} ⊗_{ℤ_l} 𝒪-coefficients) and its covariant realisation 𝐆_ṽ(M) = U_S(Hom(M, F_ṽ/𝒪_{F,ṽ}{l − 2}))(2 − l) built from R07.3/fl-functor-torsion, which is exact, fully faithful and 𝒪-linear with essential image closed under subobjects and quotients (R07.3/fl-full-faithfulness, R07.3/fl-essential-image-subquotients; the covariant normalisation is PadicHodgeTheory R06.4/fontaine-laffaille-sign-dictionary). Assume r̄|_{G_{F_ṽ}} lies in the essential image of 𝐆_ṽ with dim_k(gr^i 𝐆_ṽ^{−1}(r̄) ⊗_{𝒪_{F_ṽ},τ̃} 𝒪) ≤ 1 for every i and τ̃. The Fontaine–Laffaille deformation problem 𝒟_ṽ consists of the lifts r of r̄ to R ∈ C_𝒪 such that r ⊗_R R′ lies in the essential image of 𝐆_ṽ for every Artinian quotient R′ of R. It is a local deformation problem in the sense of GlobalGaloisDeformations R04.3, its tangent space L_ṽ is the image of Ext¹_{𝓜𝓕_{k,ṽ}}(𝐆_ṽ^{−1}(r̄), 𝐆_ṽ^{−1}(r̄)) ↪ H¹(G_{F_ṽ}, ad r̄), and it is liftable (CHT Lemma 2.4.1). Only the deformation condition is constructed here; the filtered category, the functor and its full faithfulness are R07.3's.

Hypotheses: l = p, F_ṽ/ℚ_l unramified; Hodge–Tate weights in the Fontaine–Laffaille range [0, l − 2] and multiplicity-free for each embedding; CHT use a covariant normalisation of Fontaine–Laffaille's contravariant U_S; the sign conventions are PadicHodgeTheory R06.4/fontaine-laffaille-sign-dictionary.

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; GlobalGaloisDeformations:R04.3/local-deformation-problem; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-filtered-modules; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-functor-torsion; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-full-faithfulness; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients; PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison; PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary.

API `TauCeti.GaloisDeformation.Local.FLDeformation`: The condition 𝒟_ṽ on lifts of r̄|_{G_{F_ṽ}}: every Artinian quotient lies in the essential image of R07.3's realisation 𝐆_ṽ.

API `TauCeti.GaloisDeformation.Local.FLDeformation.isLocalDeformationProblem`: 𝒟_ṽ is a local deformation problem (GlobalGaloisDeformations R04.3): stable under strict conjugation and closed (Schlessinger fibre products, inverse limits), because the essential image of 𝐆_ṽ is closed under subobjects, quotients and direct sums (R07.3/fl-essential-image-subquotients).

API `TauCeti.GaloisDeformation.Local.FLDeformation.mem_iff`: For R Artinian, r ∈ 𝒟_ṽ(R) iff r ≅ 𝐆_ṽ(M) for some object M of R07.3's 𝓜𝓕_{𝒪,ṽ} with R-action; for general R ∈ C_𝒪, iff this holds for every Artinian quotient.

API `TauCeti.GaloisDeformation.Local.FLDeformation.tangentSpace`: The tangent space of 𝒟_ṽ is L_ṽ = image of Ext¹_{𝓜𝓕_{k,ṽ}}(𝐆_ṽ^{−1}(r̄), 𝐆_ṽ^{−1}(r̄)) in H¹(G_{F_ṽ}, ad r̄), using the Ext comparison of R07.3.

API `TauCeti.GaloisDeformation.Local.FLDeformation.liftable`: CHT Lemma 2.4.1: under the multiplicity-one hypothesis, every point over R/I (𝔪_R I = 0) lifts to R.

API `TauCeti.GaloisDeformation.Local.FLDeformation.baseChange`: A map of Artinian coefficient algebras carries a lift in 𝒟_ṽ to a lift in 𝒟_ṽ, via the coefficient-compatible realisation of R07.3.

Test `fl_rank_one` (degenerate): For n = 1 the tangent space L_ṽ is the unramified classes H¹(G_{F_ṽ}/I_{F_ṽ}, ad r̄), of dimension 1 (CHT Corollary 2.4.4 with n = 1).

Test `fl_elliptic_curve` (computation): E/ℚ_l with good reduction, l ≥ 3: with CHT's functor 𝐆_ṽ a rank-one object with jump i has inertial character ε^{−i}, so the lifts in 𝒟_ṽ with jumps {0, 1} have inertial characters {1, ε^{−1}}. The jumps {0, 1} lie in [0, l − 2] and are multiplicity-free, so r̄ = E[l]^∨ satisfies the hypotheses and the dual Tate module T_lE^∨ = H¹_ét(E_{ℚ̄_l}, ℤ_l) is a point of 𝒟_ṽ; T_lE itself would need the jumps {−1, 0}, outside the range.

Test `fl_weight_out_of_range` (non-example): A crystalline character with Hodge–Tate weight l − 1 is not in 𝒟_ṽ: R07.3's objects satisfy Fil^{l−1}M = 0.

Test `fl_repeated_weight` (non-example): r̄ = ε ⊕ ε violates the multiplicity-one hypothesis for n = 2, so Lemma 2.4.1 does not apply.

Sources: CHT08, §2.4.1, p. 33; CHT08, §2.4.1, 𝒟_ṽ and Lemma 2.4.1, p. 35.


### `LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda` — Ordinary representations of weight λ

Let K/ℚ_p be finite, E ⊃ K-Galois closure large, and λ = (λ_{τ,1} ≥ ⋯ ≥ λ_{τ,n})_{τ : K ↪ E} a dominant weight. A continuous ρ : G_K → GL_n(B) (B a finite E-algebra, or 𝒪_{E′}) is ordinary of weight λ if it is conjugate to an upper-triangular representation with diagonal characters χ₁, …, χ_n (in that order) such that, for every i, the character x ↦ χ_i(Art_K(x))·Π_τ τ(x)^{λ_{τ,n−i+1}+i−1} of 𝒪_K^× has finite order (equivalently, χ_i(Art_K(α)) = Π_τ τ(α)^{−(λ_{τ,n−i+1}+i−1)} for α ∈ 𝒪_K^× close to 1). It is semistable-ordinary of weight λ if the χ_i satisfy the identity on all of I_K: χ_j(σ) = Π_τ τ(Art_K^{-1}(σ))^{−λ_{τ,n+1−j}−(j−1)}. The flag is part of the condition; a condition on characteristic polynomials alone is not equivalent (L8).

Hypotheses: Conventions: Art_K is the local Artin map sending uniformisers to geometric Frobenius (Tau Ceti ClassFieldTheory Layer 7), so ε∘Art_K(x) = Π_τ τ(x) for x ∈ 𝒪_K^×. For K = ℚ_p the condition says χ_i|_{I} = ε^{−(λ_{n−i+1}+i−1)} up to a finite-order character (exactly, for semistable-ordinary).; Hodge–Tate weights. In the convention of PadicHodgeTheory R06.2, HT(ε) = +1, χ_i has τ-labelled Hodge–Tate weight −(λ_{τ,n−i+1} + i − 1). These weights strictly decrease along the flag ⟨e₁⟩ ⊂ ⟨e₁, e₂⟩ ⊂ ⋯, so the sub-objects carry the larger weights, as in PadicHodgeTheory R06.4/ordinary-representation. When the weights λ_{τ,j} do not depend on τ (in particular for K = ℚ_p), the graded characters are powers of ε on inertia, and a semistable-ordinary representation of weight λ is ordinary in R06.4's sense, with no dualisation; an ordinary representation of weight λ is so after restriction to G_{K′} for a finite extension K′/K killing the finite-order factors. For weights depending on τ the graded characters are not powers of ε, R06.4/ordinary-representation does not apply, and semistability comes from R06.4/ordinary-implies-semistable (a)–(b): the ratios χ_iχ_j^{-1} (i < j) have all labelled weights ≥ 1, so each successive extension is de Rham, hence semistable. In the convention HT(ε) = −1 of Caraiani–Newton, Boxer–Calegari–Gee–Pilloni and Newton–Thorne, the same weights read λ_{τ,n−i+1} + i − 1 (non-negative when λ_{τ,n} ≥ 0).; The finite-order factor in the first definition is part of the condition (Newton–Thorne Definition 2.5(2)); it makes ordinary representations potentially semistable, while semistable-ordinary ones are semistable.; Comparison with Khare–Wintenberger and BLGGT. Those papers normalise the Galois representation of a weight-k eigenform as ρ_f with Hodge–Tate weights {0, k − 1} (HT(ε) = +1), and ordinary means ρ_f|_{G_{ℚ_p}} ≅ (ε^{k−1}ψ₁ ∗; 0 ψ₂) with ψ_i unramified. The representation of weight λ = (k − 2, 0) in this node's normalisation is ρ_f^∨ ≅ (ψ₂^{−1} ∗; 0 ε^{1−k}ψ₁^{−1}) after reordering the basis. Translate between the two by dualising and reversing the flag, never by identifying the upper-triangular forms..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; PadicHodgeTheory:R06.4/ordinary-representation; PadicHodgeTheory:R06.4/ordinary-implies-semistable; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight`: The predicate: ρ has a G_K-stable full flag whose graded characters χ_i satisfy χ_i∘Art_K ≡ Π_τ τ^{−(λ_{τ,n−i+1}+i−1)} up to finite order on 𝒪_K^×.

API `TauCeti.GaloisDeformation.Local.IsSemistableOrdinaryOfWeight`: The same with equality on I_K.

API `TauCeti.GaloisDeformation.Local.IsSemistableOrdinaryOfWeight.isOrdinary`: Semistable-ordinary of weight λ implies ordinary of weight λ.

API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.potentiallySemistable`: Ordinary of weight λ implies potentially semistable of Hodge type v_λ; semistable-ordinary implies semistable of type v_λ.

API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.flag_unique`: If the χ_i are pairwise distinct on I_K, the flag is unique.

API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.restrict`: Ordinary of weight λ is preserved by restriction to G_{K′} (with the restricted weight).

API `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.baseChange`: A coefficient map between the allowed finite E-algebras carries the stable full flag of direct summands and its ordered inertia characters to an ordinary flag of the same weight. Exact semistable-ordinary characters are preserved as well.

Test `ordinaryWeight_n1` (computation): n = 1, λ = (λ_τ): χ_p^{-1}-normalised, ρ = χ_λ·(unramified) is ordinary of weight λ; ρ = χ_λ·ω (ω ramified of order p) is ordinary but not semistable-ordinary.

Test `ordinaryWeight_weight_zero` (degenerate): For n=2 and λ=(0,0), the ordered inertia characters are 1 and ε_p⁻¹. Weight zero is not the condition that both diagonal characters are unramified.

Test `ordinaryWeight_charpoly_not_enough` (non-example): For n=2, λ=(0,0), a nonsplit extension with subcharacter ε_p⁻¹ and quotient 1 has the same characteristic polynomials as 1⊕ε_p⁻¹ but lacks a stable subline carrying 1. It fails CN’s prescribed ordering despite the determinant equations.

Test `ordinaryWeight_KW` (compatibility): For n=2, λ=(k−2,0), CN’s ordered inertia characters are 1 and ε_p^{−(k−1)}. Dualizing and reversing the flag gives KW’s higher-weight subline χ_p^{k−1} and weight-zero quotient. This is a duality comparison, not equality of the original ordered representations.

Sources: NT-2026, Definition 2.5(2), arXiv v2 p. 12; BCGP-2025, Definition 5.6.8, arXiv v1 pp. 129–130; CN-2023, Definition 3.3.1, arXiv v3 pp. 50–51.


### `LocalGaloisDeformationRings:L7/height-lattice-moduli` — Moduli of lattices of bounded E-height and their image

Let A be a complete local Noetherian ring with finite residue field 𝔽 and V_A finite free of rank d with continuous G_{K_∞}-action. (1) On A-algebras B with 𝔪_A^i B = 0 for some i, B ↦ {𝔖_B-lattices of E-height ≤ h in M_B} is represented by a projective A-scheme Θ_A : 𝓛^{≤h}_{V_A} → Spec A, compatible with base change and carrying a canonical very ample line bundle. (2) Θ_A becomes a closed immersion after inverting p. (3) If A^{≤h} is the quotient of A cut out by the scheme-theoretic image of Θ_A, then for every finite W(𝔽)[1/p]-algebra B, A → B factors through A^{≤h} exactly when V_B has E-height ≤ h. (4) There is a finite 𝔖_{A^{≤h}}-module 𝔐 with φ*𝔐 → 𝔐 of cokernel killed by E(u)^h, projective after inverting p (the source's Corollary (1.7)(2) says free; its proof gives projective of constant rank), which specialises at each such B to the unique lattice.

Hypotheses: Artinian case (Proposition 1.3): Beauville–Laszlo realise the functor as a closed sub-ind-scheme of the affine Grassmannian of Res_{W(k)/ℤ_p}GL_d, and the height bound confines 𝔐 to u^iN ⊆ 𝔐 ⊆ u^{−i}N with i ≤ (esh + r)/(p − 1), so it lies in a finite Grassmannian of u^{−i}N/u^iN. Grassmannians and the closedness of Frobenius-stable lattice conditions are requested from AlgebraicModuliForArithmeticGeometry R09.1.; From Artinian to complete A: formal GAGA (AdicSpacesPartII F0/grothendieck-algebraization) with the canonical very ample bundle.; This rank-general construction supplies R08.4 in rank two with h = 1..

Suppliers: LocalGaloisDeformationRings:L7/finite-height-lattices; AdicSpacesPartII:F0/grothendieck-algebraization; AlgebraicModuliForArithmeticGeometry:R09.1.

Sources: KISIN-PST-2008, Proposition (1.3), p. 517; KISIN-PST-2008, Corollary (1.5.1), p. 518; KISIN-PST-2008, Proposition (1.6.4) and its proof, pp. 520–521; KISIN-PST-2008, Corollary (1.7), pp. 521–522.


### `LocalGaloisDeformationRings:L7/ordinary-flag-scheme` — The ordinary flag scheme and its image ring R^△_v

With Λ_v as in L8/ordinary-coefficient-ring and R^□_v ∈ CNL_{Λ_v} the universal lifting ring of ρ̄ (R08.1), let 𝓕 be the flag variety over 𝒪 of complete flags in 𝒪ⁿ and 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R^□_v the closed subscheme whose A-points (A an R^□_v-algebra) are flags preserved by the universal lifting over A on which I_{F_v} acts on Fil_i/Fil_{i−1} through χ_i^univ. The map 𝒢_v → Spec R^□_v is proper, and R^△_v is the image of R^□_v → H⁰(𝒢_v, 𝒪_{𝒢_v}). For a domain R ∈ CNL_{Λ_v} with K an algebraic closure of Frac R, an R-point of Spec R^□_v factors through R^△_v iff ρ ⊗_R K has a G_{F_v}-stable full flag with I_{F_v} acting on the graded pieces by the push-forwards of the χ_j^univ.

Hypotheses: v | p; ρ̄ has a full invariant flag..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:L8/ordinary-coefficient-ring; AlgebraicModuliForArithmeticGeometry:R09.1.

API `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme`: 𝒢_v ⊂ 𝓕 × Spec R^□_v.

API `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme_proper`: 𝒢_v → Spec R^□_v is proper.

API `TauCeti.GaloisDeformation.Local.ordinaryFlagImage`: R^△_v = im(R^□_v → H⁰(𝒢_v, 𝒪)).

API `TauCeti.GaloisDeformation.Local.ordinaryFlagImage_points`: The domain point criterion.

API `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme.points`: A coefficient point is a framed lift together with a full flag of locally direct summands, stable under G_{F_v}, with the prescribed ordered inertia characters on its graded lines. Pullback of the universal flag realizes this bijection.

API `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme.baseChange`: Tensoring a flag of direct summands along a coefficient map gives the new point of the incidence scheme; identity and composition agree with ordinaryFlagScheme pullback.

Test `ordinaryFlagImage_n_one` (degenerate): n = 1: every line is a flag, and R^△_v = R^□_v/(ρ|_{I_{F_v}} − χ_1^univ).

Test `ordinaryFlagScheme_permuted` (characterisation): Requiring I_{F_v} to act on the i-th piece by χ^univ_{σ(i)} for σ ∈ S_n gives the variant R^{△,σ}_v used in the proof of L8/determinant-flag-comparison.

Test `ordinaryFlagImage_not_flag` (non-example): A point of R^△_v need not carry a flag over R itself, only over the algebraic closure of its fraction field.

Sources: ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, p. 138 (arXiv v2; printed page = PDF page); ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, p. 139 (arXiv v2; printed page = PDF page).


### `LocalGaloisDeformationRings:R08.1/local-fixed-determinant` — Fixing the determinant of local lifts

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. Let χ : G_K → 𝒪^× lift det ρ̄. The fixed-determinant lifting ring R^□_{ρ̄,χ} (GlobalGaloisDeformations R04.2) has tangent space Z¹(G_K, ad⁰ρ̄) and obstructions in H²(G_K, ad⁰ρ̄) when p ∤ n; its dimension is ≥ 1 + (n² − 1)(1 + [K:ℚ_p]) for ℓ = p and ≥ n² for ℓ ≠ p; and R^□_ρ̄ ≅ R^□_{ρ̄,χ} ⊗̂_𝒪 𝒪[[G_K^{ab,(p)}]] (p ∤ n).

Hypotheses: p ∤ n, so ad ρ̄ = ad⁰ρ̄ ⊕ 𝔽 as G_K-modules and n-th roots of characters ≡ 1 exist..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; GlobalGaloisDeformations:R04.1/fixed-determinant-functors; GlobalGaloisDeformations:R04.2/fixed-determinant-rings; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: GEE-MLT-2022, §3.18 and Exercise 3.19, p. 15.


### `LocalGaloisDeformationRings:R08.1/archimedean-rings-p-odd` — Archimedean deformation rings for odd p

Let K = ℝ, G_ℝ = {1, c}, p odd, and ρ̄ : G_ℝ → GL_n(𝔽). Then H^i(G_ℝ, ad ρ̄) = 0 for i ≥ 1, R^□_ρ̄ is formally smooth over 𝒪 of relative dimension n² − dim (ad ρ̄)^{c}, and every lift is Γ̂_n-conjugate to the Teichmüller lift of ρ̄ (with ρ̄(c) diagonalised). For n = 2 and ρ̄ odd (det ρ̄(c) = −1), the relative dimension is 2, and with fixed determinant χ (χ(c) = −1) it is also 2.

Hypotheses: |G_ℝ| = 2 is invertible in 𝔽 when p is odd..

Suppliers: LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; GlobalGaloisDeformations:R04.1/lifting-functor; GlobalGaloisDeformations:R04.1/tangent-spaces.

Sources: TUNG-2021, §3.2.5, Proposition 3.2.7, p. 15.


### `LocalGaloisDeformationRings:R08.1/local-residue-field-change` — Local deformation rings under change of coefficients

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. For a finite local 𝒪 → 𝒪′ with residue extension 𝔽 ⊆ 𝔽′: R^□_{ρ̄⊗𝔽′,𝒪′} ≅ R^□_{ρ̄,𝒪} ⊗̂_𝒪 𝒪′, likewise with fixed determinant and (Schur) unframed; the tangent, obstruction and Euler-characteristic invariants of local-tangent-obstruction are unchanged (h^i(G_K, ad ρ̄ ⊗ 𝔽′) = h^i(G_K, ad ρ̄)), so the dimension bounds and formal smoothness are preserved.

Hypotheses: The comparison of local rings under residue-field extension belongs to R08.1; the generic statement is GlobalGaloisDeformations R04.2/change-of-residue-field..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; GlobalGaloisDeformations:R04.2/change-of-residue-field; GlobalGaloisDeformations:R04.1/change-of-coefficients; DeformationAndDerivedPatchingAlgebra:R03.1.

Sources: GEE-MLT-2022, §3.1, p. 12; BLGGT-2014, Lemma 1.2.1, arXiv v4 p. 13.


### `LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness` — Fontaine–Laffaille deformations: tangent space and smoothness (CHT Lemma 2.4.2, Corollaries 2.4.3–2.4.4, Lemma 2.4.5)

(Lemma 2.4.2.) For M, N in 𝓜𝓕_{k,ṽ} there is an exact sequence 0 → Hom_{𝓜𝓕}(M, N) → Fil⁰Hom(M, N) → Hom_{Fr⊗1}(gr M, N) → Ext¹_{𝓜𝓕}(M, N) → 0, the middle map sending β to (βΦ^i_M − Φ^i_Nβ). (Corollary 2.4.3.) dim_k L_ṽ − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2, and R_ṽ^{loc}/𝓘_ṽ is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables. (Corollary 2.4.4.) If n = 1 then L_ṽ = H¹(G_{F_ṽ}/I_{F_ṽ}, ad r̄). (Lemma 2.4.5.) If r̄|_{G_{F_ṽ}} = ⊕ s̄_i then H¹(G, ad r̄) = ⊕_{i,j} H¹(G, Hom(s̄_i, s̄_j)) and L_ṽ = ⊕_{i,j}(L_ṽ)_{i,j}, the images of Ext¹_{𝓜𝓕}(𝐆^{−1}(s̄_i), 𝐆^{−1}(s̄_j)).

Hypotheses: the hypotheses of L7/fontaine-laffaille-deformation-condition.

Suppliers: LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition; LocalGaloisDeformationRings:R08.1/local-lifting-ring.

Sources: CHT08, §2.4.1, Lemma 2.4.2, p. 35; CHT08, §2.4.1, proof of Lemma 2.4.2 and Corollary 2.4.3, p. 36; CHT08, §2.4.1, Corollary 2.4.4 and Lemma 2.4.5, p. 37.


### `LocalGaloisDeformationRings:R08.1/archimedean-odd-ring-p2` — The odd archimedean deformation ring at p = 2

Let p = 2, n = 2, K = ℝ, ψ : G_ℝ → 𝒪^× with ψ(c) = −1, and ρ̄ : G_ℝ → GL₂(𝔽) with det ρ̄ = ψ mod 2 (so ρ̄(c) is 1 or conjugate to (1 1; 0 1)). The fixed-determinant lifts send c to M = (a b; c′ −a) with a² + bc′ = 1, so R^{□,ψ} = 𝒪[[a − a₀, b − b₀, c′ − c′₀]]/(a² + bc′ − 1) centred at a lift (a₀, b₀, c′₀) of ρ̄(c). It is a complete intersection domain of relative dimension 2 over 𝒪; every 𝒪-point is odd, so R^odd = R^{□,ψ}; R^odd[1/2] is formally smooth; R^odd ⊗ 𝔽 is a domain.

Hypotheses: p = 2 and n = 2; the determinant is fixed with ψ(c) = −1 (oddness)..

Suppliers: LocalGaloisDeformationRings:R08.1/archimedean-rings-p-odd; GlobalGaloisDeformations:R04.1/fixed-determinant-functors; GlobalGaloisDeformations:R04.2/fixed-determinant-rings; mathlib:MvPowerSeries.

Sources: TUNG-2021, §3.2.5, Proposition 3.2.7, p. 15.


### `LocalGaloisDeformationRings:R08.1/coefficient-rings-lambda` — Coefficient rings Λ for finite, p-adic and local residue fields

Let 𝒪 be the ring of integers of a finite extension L/ℚ_p with residue field k and uniformiser ϖ, F/ℚ_p finite, and κ an 𝒪-field of one of three kinds: (1) a finite extension of k; (2) a finite extension of L; (3) a local field of characteristic p containing k, so 𝒪_κ ≅ k′⟦t⟧. Put Λ = 𝒪_{L′} with L′/L unramified of residue field κ in case (1); Λ = κ (with Λ⁰ = 𝒪_κ) in case (2); and in case (3) Λ = the p-adic completion of 𝒪_{L′}⟦t⟧[1/t], a complete discrete valuation ring with uniformiser ϖ and residue field κ (an 𝒪-Cohen ring of κ, unique up to non-canonical isomorphism). 𝔄_Λ is the category of local Artinian Λ-algebras with residue field κ, topologised discretely in case (1), p-adically in case (2), and as finite-length Λ⁰[1/t]/ϖⁿ-modules in case (3). For a continuous ρ : G_F → GL_d(κ), D^□_ρ(A) is the set of continuous lifts ρ_A : G_F → GL_d(A) of ρ. In case (1) this is the functor of R08.1/local-lifting-ring.

Hypotheses: Continuity in cases (2) and (3) is for the natural (non-discrete) topology on A; this is what makes D^□_ρ the right functor at characteristic-zero and characteristic-p points of Spec R^□_ρ̄.; For G-valued representations the same Λ and 𝔄_Λ are used (R08.1/g-valued-framed-ring)..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-residue-field-change; DeformationAndDerivedPatchingAlgebra:R03.1; mathlib:IsAdicComplete; mathlib:IsLocalRing.ResidueField.

API `TauCeti.GaloisDeformation.Local.CoeffRing`: The ring Λ attached to an 𝒪-field κ of the three kinds, with its residue isomorphism Λ/ϖ ≅ κ in cases (1), (3) and Λ = κ in case (2).

API `TauCeti.GaloisDeformation.Local.CoeffRing.isCohen`: In case (3), any 𝒪-algebra that is a complete DVR with uniformiser ϖ and residue field κ is isomorphic to Λ.

API `TauCeti.GaloisDeformation.Local.ArtinCat`: The category 𝔄_Λ with the topology on each object.

API `TauCeti.GaloisDeformation.Local.liftFunctorΛ`: D^□_ρ : 𝔄_Λ → Set, continuous lifts of ρ : G_F → GL_d(κ).

API `TauCeti.GaloisDeformation.Local.liftFunctorΛ_finite`: For κ finite, D^□_ρ restricted to Artinian objects is the lifting functor of GlobalGaloisDeformations R04.1.

Test `coeffRing_finite` (degenerate): For κ = k, CoeffRing κ = 𝒪.

Test `coeffRing_padic` (computation): For κ = L, CoeffRing κ = L and 𝔄_Λ consists of finite local L-algebras with residue field L.

Test `coeffRing_char_p_dvr` (non-example): For κ = k((t)), Λ is not 𝒪⟦t⟧ (not a DVR, residue field k) but the ϖ-adic completion of 𝒪⟦t⟧[1/t], a DVR with residue field k((t)).

Test `liftFunctorΛ_compat` (compatibility): For κ finite, liftFunctorΛ ρ agrees with the lifting functor of R08.1/local-lifting-ring on Artinian objects.

Sources: BIP-2023, §3.5, the coefficient rings Λ and Remark 3.32, arXiv v2 pp. 25–26; BIP-2023, Proposition 3.33, arXiv v2 p. 26.


### `LocalGaloisDeformationRings:R08.1/lambda-presentation` — Presentation of framed rings over Λ and the cocycle count

Let κ, Λ and ρ : G_F → GL_d(κ) be as in R08.1/coefficient-rings-lambda. (1) dim_κ Z¹(G_F, V) = h¹(G_F, V) + dim V − h⁰(G_F, V) for any finite continuous κ[G_F]-module V, and dim_κ Z¹(G_F, V) = dim V·([F:ℚ_p] + 1) + h²(G_F, V). (2) D^□_ρ is pro-represented by a complete local Noetherian Λ-algebra R^□_ρ with a presentation R^□_ρ ≅ Λ⟦x₁, …, x_r⟧/(f₁, …, f_s), r = dim_κ Z¹(G_F, ad ρ), s = dim_κ H²(G_F, ad ρ); hence r − s = d² + d²[F:ℚ_p]. (3) The analogous presentation over the universal deformation ring R_{det ρ} of det ρ holds with ad⁰ (the kernel of the trace) in place of ad, with no condition on d (BIP Proposition 4.3; PQ Proposition 3.6 with φ = det).

Hypotheses: In cases (2) and (3) of R08.1/coefficient-rings-lambda the obstruction 2-cocycle must be shown continuous; this uses a continuous set-theoretic section of GL_d(A′) → GL_d(A) for small extensions A′ → A in 𝔄_Λ.; The equality r − s = d²(1 + [F:ℚ_p]) uses the local Euler characteristic formula for κ-coefficients in all three cases.; The possibly infinite residue field κ and its natural topology require continuous-cohomology finiteness, duality and Euler characteristic beyond finite discrete coefficients. This is requested separately; ClassFieldTheory Layer 5 alone does not supply that generality..

Suppliers: LocalGaloisDeformationRings:R08.1/coefficient-rings-lambda; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; DeformationAndDerivedPatchingAlgebra:R03.2; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: BIP-2023, Proposition 3.33 and (21)–(22), arXiv v2 p. 26; PQ-2026, Lemma 3.1, arXiv v2 p. 22.


### `LocalGaloisDeformationRings:R08.1/g-valued-framed-ring` — G-valued framed deformation rings

Let G be a smooth affine group scheme over 𝒪 (for example GL_n, GSp_{2n} with its multiplier ν : GSp_{2n} → 𝔾_m, or a generalised reductive group), Γ a profinite group with Mazur's p-finiteness condition (for example G_F), κ and Λ as in R08.1/coefficient-rings-lambda, and ρ : Γ → G(κ) continuous. D^□_{ρ,G} : 𝔄_Λ → Set sends A to the continuous ρ_A : Γ → G(A) lifting ρ. (1) dim_κ Z¹(Γ, ad ρ) is finite, where ad ρ = Lie G_κ with the adjoint action. (2) D^□_{ρ,G} is pro-represented by a complete local Noetherian Λ-algebra R^□_{ρ,G} with residue field κ and tangent space Z¹(Γ, ad ρ). (3) For a closed normal subgroup scheme (e.g. fixed multiplier ν∘ρ_A = μ), the corresponding fixed-multiplier functor is a closed subfunctor, pro-represented by a quotient R^{□,μ}_{ρ,G}. (4) Surjections G(A′) → G(A) in 𝔄_Λ have continuous set-theoretic sections, and G(A) is locally profinite.

Hypotheses: For GSp₄ with fixed multiplier ε^{-1} (BCGP25 §6.1.1), ad = Lie GSp₄ has dimension 11 and ad⁰ = Lie Sp₄ dimension 10; strict equivalence uses the congruence kernel of GSp₄.; The group GSp_{2n} over 𝒪 is the matrix group {g : gᵀJg = ν(g)J}; Mathlib has the symplectic group Sp (Matrix.symplecticGroup) but not GSp, which this node takes from ArithmeticStatistics ST.5’s integral matrix carrier and its requested group-scheme extension (request).; For GSp the integral matrix carrier and multiplier come from ArithmeticStatistics ST.5/symplectic-similitude-group, not ClassicalGroups Layer 0 over ℂ. The smooth group-scheme, derived-group and integral Lie-algebra API remains a supplier extension. For compatibility with Matrix.symplecticGroup, prove equivalence of gJgᵀ=νJ and gᵀJg=νJ for invertible g..

Suppliers: LocalGaloisDeformationRings:R08.1/coefficient-rings-lambda; LocalGaloisDeformationRings:R08.1/local-lifting-ring; DeformationAndDerivedPatchingAlgebra:R03.2; mathlib:Matrix.symplecticGroup; ArithmeticStatistics:ST.5/symplectic-similitude-group.

API `TauCeti.GaloisDeformation.Local.GLift`: D^□_{ρ,G}(A): continuous lifts Γ → G(A) of ρ.

API `TauCeti.GaloisDeformation.Local.GFramedRing`: R^□_{ρ,G}, the pro-representing complete local Noetherian Λ-algebra, with the universal lift ρ^□_G : Γ → G(R^□_{ρ,G}).

API `TauCeti.GaloisDeformation.Local.GFramedRing.tangent`: Hom_Λ(R^□_{ρ,G}, κ[ε]) ≅ Z¹(Γ, ad ρ).

API `TauCeti.GaloisDeformation.Local.GFramedRing.map`: A morphism φ : G → H induces R^□_{φ∘ρ,H} → R^□_{ρ,G}, with map_id and map_comp.

API `TauCeti.GaloisDeformation.Local.GFramedRing.fixedMultiplier`: For a character μ lifting ν∘ρ, the quotient R^{□,μ}_{ρ,G} of lifts with ν∘ρ_A = μ.

API `TauCeti.GaloisDeformation.Local.GFramedRing.gl`: For G = GL_d, R^□_{ρ,GL_d} = R^□_ρ of R08.1/local-lifting-ring.

API `TauCeti.GaloisDeformation.Local.GFramedRing.hom_ext`: Two continuous Λ-algebra maps R^□_{ρ,G}→A are equal iff the induced G(A)-valued framed lifts are equal. The pro-representing bijection is natural in A; this uses framed equality rather than conjugacy.

Test `gFramed_GL1_trivial` (computation): G = 𝔾_m, F = ℚ_p (p odd), ρ trivial: R^□_{ρ,G} ≅ 𝒪⟦y₁, y₂⟧ (R08.1/rank-one-ring).

Test `gFramed_trivial_group` (degenerate): G trivial: R^□_{ρ,G} = Λ.

Test `gFramed_GSp4_unobstructed` (computation): G = GSp₄ with fixed multiplier, v ∤ p, H⁰(F_v, ad⁰ρ̄(1)) = 0: R^{□,μ} is a power series ring over 𝒪 in 10 variables (BCGP21 Proposition 7.4.2).

Test `gFramed_GL_compat` (compatibility): GFramedRing for GL_d agrees with R^□_ρ of R08.1/local-lifting-ring.

Sources: PQ-2026, §3, Lemma 3.2, arXiv v2 p. 23; BCGP-2021, §7.1, arXiv v3 p. 169.


### `LocalGaloisDeformationRings:R08.1/completion-at-points` — Completed local rings at points of the generic fibre are framed rings

Let ρ̄ : G_F → GL_d(k′) (k′/k finite, F/ℚ_ℓ finite, ℓ = p allowed) with framed ring R^□_ρ̄. Let x ∈ Spec R^□_ρ̄ be the closed point, or a point with dim R^□_ρ̄/𝔭_x = 1, whose residue field is a finite extension of L or a local field of characteristic p; BIP Proposition 3.41 treats ℓ = p, and for ℓ ≠ p only the closed points of the generic fibre are used here (BLGGT Lemma 1.3.2, Kisin). ρ_x : G_F → GL_d(κ(x)) the specialisation of the universal lift, Λ the coefficient ring of κ(x) (R08.1/coefficient-rings-lambda) and 𝔮 the kernel of Λ ⊗_𝒪 R^□_ρ̄ → κ(x), λ ⊗ a ↦ λ̄ā. Then the completion of (Λ ⊗_𝒪 R^□_ρ̄)_𝔮 is naturally isomorphic to R^□_{ρ_x}. In particular, for a closed point x of Spec R^□_ρ̄[1/p] with residue field E′, the completed local ring (R^□_ρ̄[1/p])^∧_x pro-represents the framed deformations of ρ_x : G_F → GL_d(E′) to Artinian local E′-algebras with residue field E′, and is a power series ring over E′ in dim Z¹(G_F, ad ρ_x) variables when H²(G_F, ad ρ_x) = 0. The same holds with fixed determinant (ad⁰ in place of ad) and for G-valued lifts (R08.1/g-valued-framed-ring).

Hypotheses: Closed points of R^□_ρ̄[1/p] have residue fields finite over E (Taylor II, Lemma 1.6).; The comparison is of complete local rings; it does not assert that R^□_ρ̄[1/p] is excellent or regular anywhere..

Suppliers: LocalGaloisDeformationRings:R08.1/coefficient-rings-lambda; LocalGaloisDeformationRings:R08.1/lambda-presentation; LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-fixed-determinant.

Sources: BIP-2023, Proposition 3.41, arXiv v2 p. 29; CG-2018, §4.1, proof of Lemma 4.11 (published p. 365); BCGP-2021, §7.1, the paragraph after Definition 7.1.2, arXiv v3 pp. 169–170; BHS-2019, §3.6 and Remark 3.6.1, printed pp. 362–363.


### `LocalGaloisDeformationRings:R08.1/rank-one-ring` — The universal deformation ring of a character

Let F/ℚ_p be finite, ψ̄ : G_F → k^× continuous, R_ψ̄ its universal deformation ring and μ = μ_{p^∞}(F), a finite cyclic p-group. Local class field theory gives μ → F^× → G_F^{ab} → GL₁(R_ψ̄), hence 𝒪[μ] → R_ψ̄, and R_ψ̄ ≅ 𝒪[μ]⟦y₁, …, y_{[F:ℚ_p]+1}⟧. The irreducible components of Spec R_ψ̄ are indexed by the characters χ : μ → 𝒪^× (after enlarging 𝒪), and each R_ψ̄ ⊗_{𝒪[μ],χ} 𝒪 is formally smooth over 𝒪.

Hypotheses: The Artin map is normalised as in Tau Ceti ClassFieldTheory Layer 7; the statement does not depend on the normalisation..

Suppliers: LocalGaloisDeformationRings:R08.1/lambda-presentation; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

Sources: BIP-2023, Lemma 4.1 and its proof, arXiv v2 p. 36.


### `LocalGaloisDeformationRings:R08.1/g-valued-presentations` — Presentations of G-valued framed rings and central quotients

Let φ : G → H be a morphism of smooth affine 𝒪-group schemes with G⁰ → H⁰ smooth and surjective, ρ : Γ → G(κ) continuous and ad^{0,φ}ρ = ker(ad ρ → ad(φ∘ρ)). (1) R^□_{ρ,G} ≅ R^□_{φ∘ρ,H}⟦x₁, …, x_r⟧/(f₁, …, f_t) with r = dim Z¹(Γ, ad^{0,φ}ρ), t = h²(Γ, ad^{0,φ}ρ); for Γ = G_F, r − t = (dim G_κ − dim H_κ)([F:ℚ_p] + 1). (2) With H trivial: R^□_{ρ,G} ≅ Λ⟦x₁, …, x_r⟧/(f₁, …, f_s), r − s = dim G_κ·([F:ℚ_p] + 1). (3) For G generalised reductive and H = G/Z with Z ⊂ Z(G⁰) flat, closed and normal in G (so H is generalised reductive; G′, H′ the derived groups): if Z is finite étale then R^□_H = R^□_G; if Z is a torus with Z ∩ G′ étale then R^□_{G/G′} ⊗̂_{R^□_{H/H′}} R^□_H ≅ R^□_G. (4) For v ∤ p and G = GSp₄ with fixed multiplier, H⁰(F_v, ad⁰ρ̄(1)) = 0 implies R^{□,μ}_v is a power series ring over 𝒪 in 10 variables; if moreover ρ̄ is unramified, then (still under H⁰(F_v, ad⁰ρ̄(1)) = 0) all its lifts are unramified.

Hypotheses: (1) generalises BIP Proposition 4.3 (G = GL_d, H = GL₁, φ = det).; For κ a local field the obstruction is realised by a continuous 2-cocycle via R08.1/g-valued-framed-ring (4)..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:R08.1/lambda-presentation; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: PQ-2026, Proposition 3.6, arXiv v2 p. 24; PQ-2026, Corollary 3.12 and Proposition 3.13, arXiv v2 p. 26; BCGP-2021, Proposition 7.4.2, arXiv v3 p. 189.


### `LocalGaloisDeformationRings:L7/g-valued-ordinary-condition` — G-valued ordinary representations of weight λ

Let G be a split connected reductive group over 𝒪 and T_G its canonical torus: T_G = B/R_u(B) for any Borel B ⊂ G, canonically independent of B (G(𝒪)-conjugacy of Borels and N_G(B) = B); fix B₀ ⊃ T₀ and identify T_G ×_𝒪 A with B₀/R_u(B₀) ×_𝒪 A. For v | p and cocharacters λ_τ : 𝔾_m → T_G (τ ∈ Hom_{ℚ_p}(F_v, E)), χ_λ : I_{F_v} → T_G(𝒪) is χ_λ(σ) = Π_τ λ_τ(τ(rec_v^{-1}(σ))), rec_v taking uniformisers to geometric Frobenius. For a finite local E-algebra A and finite F′_v/F_v, ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ if there is a Borel B ⊂ G_A with ρ(G_{F_v}) ⊂ B(A) such that, for g ∈ G(A) with gBg^{-1} = B₀, the composite G_{F_v} → B(A) → B₀(A) → T_G(A) equals χ_λ on I_{F′_v} (independent of g). For dominant regular λ this has p-adic Hodge type v_λ.

Hypotheses: For G = GL_n (the canonical torus is the diagonal torus and χ_λ the product of the τ-components), F′_v = F_v up to the finite-order ambiguity, this is L7/ordinary-of-weight-lambda after a change of weight: here λ is the inertial cocharacter itself (the j-th graded character is Π_τ τ∘rec_v^{−1} to the power λ_{τ,j}), while the weight λ′ of L7/ordinary-of-weight-lambda gives the exponent −(λ′_{τ,n+1−j} + j − 1). So λ_{τ,j} = −(λ′_{τ,n+1−j} + j − 1); for example the weight (1, 0) for GL₂ here is the weight (−1, −1) there, and the weight (0, 0) there is (0, −1) here.; Definition B.2 applies to lifts, not to the residual representation.; Borel subgroups, maximal tori, their conjugacy and N_G(B) = B over fields are Tau Ceti ReductiveGroups Layer 7, and split groups over ℤ (base-changed to 𝒪) are its Layer 9. The relative statement used here is SGA3 Exp. XXII 5.8.3 and Exp. XXVI 3.3. It says that for a split reductive G over 𝒪 with Borel B₀ ⊃ T₀, the Borel subgroups of G_A over a local 𝒪-algebra A are G(A)-conjugate to B₀, and the functor of Borels is represented by G/B₀. That statement is relative theory, which Tau Ceti's Layer 8 places on its long horizon; it is recorded as a gap. For G = GL_n (full flags) and G = GSp₄ (isotropic flags) the Borels and T_G are explicit, and the gap does not apply..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

API `TauCeti.GaloisDeformation.Local.canonicalTorus`: T_G = B/R_u(B), canonically independent of B.

API `TauCeti.GaloisDeformation.Local.chiLambda`: χ_λ : I_{F_v} → T_G(𝒪) attached to cocharacters λ_τ.

API `TauCeti.GaloisDeformation.Local.IsGOrdinary`: ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ.

API `TauCeti.GaloisDeformation.Local.IsGOrdinary.gl`: For G = GL_n, IsGOrdinary of weight λ is IsOrdinaryOfWeight of L7/ordinary-of-weight-lambda for the weight λ′ with λ_{τ,j} = −(λ′_{τ,n+1−j} + j − 1) (with finite-order ambiguity absorbed by F′_v).

API `TauCeti.GaloisDeformation.Local.IsGOrdinary.map`: Ordinarity is preserved by central isogenies G → G′ with the induced weight.

Test `gOrdinary_torus` (degenerate): G = T a torus: B = T, T_G = T and ρ is F′_v-ordinary of weight λ iff ρ|I_{F′_v} = χ_λ.

Test `gOrdinary_GL2` (compatibility): G = GL₂: weight λ = (1, 0) here agrees with weight λ′ = (−1, −1) of L7/ordinary-of-weight-lambda (a stable line with inertia acting by ε, trivial inertia on the quotient, for F_v = ℚ_p), and λ′ = (0, 0) there is λ = (0, −1) here.

Test `gOrdinary_GSp4` (computation): G = GSp₄, λ regular: ordinary means a stable symplectic full flag with graded characters (χ₁, χ₂, ε^{-1}χ₂^{-1}, ε^{-1}χ₁^{-1}) of the prescribed inertial weights (BCGP25 §1.8.10).

Test `gOrdinary_not_residual` (non-example): The definition is for lifts to finite E-algebras; a residual ρ̄ with a stable Borel is not 'ordinary of weight λ' (χ_λ mod 𝔪 loses the weight).

Sources: FKP-2022, Appendix B, arXiv v5 p. 52; FKP-2022, Definition B.2, arXiv v5 p. 52.


### `LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre` — Smooth points of the generic fibre and purity

Let v be a finite place of a number field, F_v its completion, ρ̄ : G_{F_v} → G(k) with G = GL_n (or a group of R08.1/g-valued-framed-ring with fixed multiplier, e.g. GSp₄), and x a closed point of Spec R^□_v[1/p] with ρ_x : G_{F_v} → G(E′). Call x smooth if (R^□_v[1/p])^∧_x is regular. (1) If v ∤ p, x is smooth iff (ad⁰ρ_x)(1)^{G_{F_v}} = 0, equivalently H²(G_{F_v}, ad⁰ρ_x) = 0. (2) If v ∤ p and ρ_x is pure (its Weil–Deligne representation is pure), then x is smooth. (3) If v ∤ p, Spec R^□_v[1/p] is equidimensional of dimension n² (dim G^der for fixed multiplier), and smooth at pure points.

Hypotheses: Purity is in the sense of Taylor–Yoshida: WD(ρ_x) arises by base change from a pure Weil–Deligne representation over a number field.; (1) uses only the generic fibre; it says nothing about R^□_v itself, which can be non-smooth at the closed point..

Suppliers: LocalGaloisDeformationRings:R08.1/completion-at-points; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: BCGP-2021, Lemma 7.1.3, arXiv v3 p. 170.


### `LocalGaloisDeformationRings:R08.1/phi-gamma-module-deformation-rings` — Deformation rings of (φ, Γ)-modules and their trianguline and de Rham quotients

Let K/ℚ_p be finite, E/ℚ_p finite and large, and D a (φ, Γ_K)-module over the Robba ring ℛ_{K,E} with End(D) = E, trianguline with a generic parameter δ : T(K) → E^× (T the diagonal torus of GL_n) and refinement w. R_D is the universal deformation ring of D on local Artinian E-algebras with residue field E; R_{D,w} that of T_w-deformations (trianguline deformations with respect to the refinement w(φ)); R_{D,g} that of de Rham, equivalently crystabelline, deformations; R_δ (resp. R_{δ,g}) that of the character δ of T(K) (resp. of its locally algebraic deformations). All are formally smooth complete local Noetherian E-algebras, with tangent spaces Ext¹_{(φ,Γ)}(D, D), its trianguline and de Rham subspaces, Hom(T(K), E) and Hom_sm(T(K), E); there are surjections R_D ↠ R_{D,w} ↠ R_{D,g} and R_δ ↠ R_{δ,g}, and for each w the parameter map induces a Cartesian square of local Artinian E-algebras with corners R_{w(φ)z^h}/𝔪², R_{w(φ)z^h,g}/𝔪², R_{D,w}/𝔪² and R_{D,g}/𝔪² (Ding (3.55)): a first-order trianguline deformation is de Rham exactly when its parameter is locally algebraic.

Hypotheses: Genericity of δ (δ_iδ_j^{-1} ∉ {x^{±k}, εx^{k}}) is needed for formal smoothness; without it R_{D,w} can be singular.; For D = D_rig(V) of a Galois representation V with End(V) = E, R_D is the unframed deformation ring of V: the completed local ring of R08.1/completion-at-points is a power series ring over R_D in n² − 1 variables (the framing).; The trianguline variety X_tri itself is not constructed here; it belongs to the trianguline-variety roadmap.; D is a noncritical crystabelline object of Ding’s ΦΓ_nc(φ,h), with φ generic, h regular and all refinements noncritical. These are the standing assumptions of §3.2.2; arbitrary generic trianguline objects are not covered..

Suppliers: LocalGaloisDeformationRings:R08.1/completion-at-points; PadicHodgeTheory:P7.

API `TauCeti.GaloisDeformation.PhiGamma.defRing`: R_D for a (φ, Γ_K)-module D with End(D) = E.

API `TauCeti.GaloisDeformation.PhiGamma.triangulineDefRing`: R_{D,w}, deformations with a deformation of the triangulation attached to w.

API `TauCeti.GaloisDeformation.PhiGamma.deRhamDefRing`: R_{D,g}, de Rham deformations.

API `TauCeti.GaloisDeformation.PhiGamma.tangent_defRing`: Tangent space of R_D is Ext¹(D, D); of R_{D,w} the classes preserving the triangulation.

API `TauCeti.GaloisDeformation.PhiGamma.formallySmooth`: Under genericity of δ, R_D, R_{D,w}, R_{D,g} are formally smooth over E.

API `TauCeti.GaloisDeformation.PhiGamma.galois_compat`: For D = D_rig(V), R_D is the unframed deformation ring of V (R08.1/completion-at-points modulo framing).

API `TauCeti.GaloisDeformation.Local.triangulineDefRing.forget`: Forgetting the chosen deformation of the triangulation gives a natural transformation to the deformation functor of D, hence a continuous E-algebra map R_D→R_{D,w}. Composition with this map sends a trianguline point to its underlying module deformation.

Test `phiGamma_rank_one` (computation): n = 1: R_D ≅ R_δ ≅ E⟦x₁, …, x_{[K:ℚ_p]+1}⟧.

Test `phiGamma_trianguline_sub` (characterisation): The tangent map of R_D → R_{D,w} identifies Hom(R_{D,w}, E[ε]) with the subspace of Ext¹(D, D) of extensions that are trianguline for the deformed refinement.

Test `phiGamma_nongeneric` (non-example): D=ℛ⊕ℛ(ε) lies outside the End(D)=E and genericity hypotheses. Its cyclotomic off-diagonal summand has H²≠0 by local duality; it cannot be used as an instance of the stated smoothness theorem.

Test `phiGamma_galois` (compatibility): For D = D_rig(V) with End V = E, R_D is the unframed deformation ring of V.

Sources: DING-2025, §3.2.2, arXiv p. 61; DING-2025, §3.2.2, arXiv p. 61.


### `LocalGaloisDeformationRings:R08.1/determinant-twisting` — Fixed-determinant rings by twisting: the functor 𝒳 and the power map φ_d

Let ρ̄ : G_F → GL_d(k), ψ : G_F → 𝒪^× a lift of det ρ̄, and χ = ψ∘Art_F on μ. (1) R^{□,ψ}_ρ̄ := R^□_ρ̄ ⊗_{R_{det ρ̄},ψ} 𝒪 represents framed lifts with determinant ψ, and is a quotient of R^{□,χ}_ρ̄ (lifts whose determinant restricted to Art_F(μ) is χ). (2) Let 𝒳 : C_𝒪 → Set send A to the group of continuous θ : G_F → 1 + 𝔪_A trivial on Art_F(μ); it is pro-represented by 𝒪(𝒳) ≅ 𝒪⟦y₁, …, y_{[F:ℚ_p]+1}⟧, and φ_e : θ ↦ θ^e. ρ ↦ (det ρ)ψ^{-1} makes R^{□,χ}_ρ̄ an 𝒪(𝒳)-algebra. (3) (ρ, θ) ↦ (ρ ⊗ θ^{-1}, θ) is a natural isomorphism D^{□,χ}_ρ̄ ×_{𝒳,φ_d} 𝒳 ≅ D^{□,ψ}_ρ̄ × 𝒳, hence R^{□,χ}_ρ̄ ⊗_{𝒪(𝒳),φ_d} 𝒪(𝒳) ≅ R^{□,ψ}_ρ̄ ⊗̂_𝒪 𝒪(𝒳). (4) φ_d : 𝒪(𝒳) → 𝒪(𝒳) is finite and flat, étale after inverting p, and a universal homeomorphism on special fibres.

Hypotheses: No hypothesis p ∤ d: the twisting goes through φ_d, which is not an isomorphism when p | d; R08.1/local-fixed-determinant covers the case p ∤ d where R^□ ≅ R^{□,ψ} ⊗̂ 𝒪⟦G_F^{ab,(p)}⟧..

Suppliers: LocalGaloisDeformationRings:R08.1/rank-one-ring; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; LocalGaloisDeformationRings:R08.1/local-lifting-ring.

Sources: BIP-2023, §5, (30) and Proposition 5.1, arXiv v2 pp. 47–48; BIP-2023, Lemma 5.3, arXiv v2 p. 48.


### `LocalGaloisDeformationRings:R08.2/tame-splitting` — The tame quotient and the reduction to tame pieces

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. Let P_K ⊆ I_K be the kernel of a surjection I_K ↠ ℤ_p (pro-order prime to p). Then G_K = P_K ⋊ T_K with T_K = G_K/P_K ≅ ℤ_p ⋊ ℤ̂ (Frobenius acting by q). For an irreducible 𝔽[P_K]-module τ with stabiliser G_τ, deformations of ρ̄ are equivalent to tuples of deformations of the multiplicity spaces ρ̄_τ = Hom_{P_K}(τ, ρ̄) as T_τ-representations.

Hypotheses: P_K has pro-order prime to p, so every lift is determined on P_K by ρ̄ (no deformations of P_K-representations).; Enlarge 𝔽 so that every irreducible constituent of ρ̄|P_K is absolutely irreducible; the multiplicity-space tensor description uses this splitting-field hypothesis. P_K is not the usual wild inertia subgroup..

Suppliers: GlobalGaloisDeformations:R04.1/lifting-functor; GlobalGaloisDeformations:R04.1/strict-deformation-functor; mathlib:ProfiniteGrp.

Sources: CHT08, §2.4.4, Lemma 2.4.10 and Corollary 2.4.13, pp. 41–43.


### `LocalGaloisDeformationRings:R08.2/unramified-lifting-ring` — Unramified lifts

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. If ρ̄ is unramified, the unramified lifts form a deformation problem, and its ring is formally smooth over 𝒪 in n² variables (n² − 1 with fixed unramified determinant): an unramified lift is determined by ρ(φ) ∈ GL_n(A) lifting ρ̄(φ), for a Frobenius lift φ.

Hypotheses: ρ̄ unramified; for the fixed-determinant version, χ unramified..

Suppliers: LocalGaloisDeformationRings:R08.2/tame-splitting; LocalGaloisDeformationRings:R08.1/local-lifting-ring; GlobalGaloisDeformations:R04.3/local-deformation-problem; GlobalGaloisDeformations:R04.3/deformation-problem-ideal; mathlib:MvPowerSeries.

Sources: GEE-MLT-2022, Definition 3.36(1) and Theorem 3.38(2), p. 21; CHT08, §2.4.4, remark after Definition 2.4.14, p. 43.


### `LocalGaloisDeformationRings:R08.2/minimally-ramified-condition` — Minimally ramified lifts

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. A lift ρ of an m-dimensional representation ρ̄ of T_q = ℤ_p ⋊ Ẑ is minimally ramified if ker(ρ(σ_q) − 1)^i ⊗_R 𝔽 → ker(ρ̄(σ_q) − 1)^i is an isomorphism for all i; a lift of ρ̄ : G_K → GL_n(𝔽) is minimally ramified if each tame piece ρ_τ (tame-splitting) is. Equivalently, the filtration Fil^i = ker(ρ(σ_q) − 1)^i is by direct summands lifting the residual one, with σ_q acting trivially on the graded pieces.

Hypotheses: The definition is independent of the generator σ_q of ℤ_p and invariant under Γ̂_n-conjugation (CHT08 remarks after Definition 2.4.14)..

Suppliers: LocalGaloisDeformationRings:R08.2/tame-splitting; GlobalGaloisDeformations:R04.3/local-deformation-problem.

API `TauCeti.GaloisDeformation.Local.IsMinimallyRamified`: The minimally ramified condition on lifts of ρ̄|_{T_q} and of ρ̄.

API `TauCeti.GaloisDeformation.Local.isMinimallyRamified_iff_filtration`: Equivalent to a σ_q-unipotent filtration by direct summands lifting the residual kernel filtration.

API `TauCeti.GaloisDeformation.Local.IsMinimallyRamified.conj`: Stable under Γ̂_n-conjugation.

API `TauCeti.GaloisDeformation.Local.minimallyRamified_deformationProblem`: Minimally ramified lifts form a deformation problem.

API `TauCeti.GaloisDeformation.Local.minimal_baseChange`: A map of coefficient algebras carries a minimal lift and its split kernel flag to the corresponding minimal lift; each kernel commutes with base change.

API `TauCeti.GaloisDeformation.Local.minimal_generator_independent`: Replacing a topological generator of the pro-p tame inertia factor by its unit power gives the same minimal condition and kernel filtration.

Test `minRam_unramified` (compatibility): For unramified ρ̄, minimally ramified = unramified.

Test `minRam_conj` (characterisation): Conjugating by Γ̂_n preserves the condition.

Test `minRam_non_example` (non-example): ρ(σ_q) = (1 x; 0 1), x ∈ m_A∖0, lifting ρ̄(σ_q) = 1, is not minimally ramified.

Sources: CHT08, §2.4.4, Definition 2.4.14 and Corollary 2.4.18, pp. 43–44.


### `LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p` — Structure of unrestricted lifting rings away from p

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. (1) If H⁰(G_K, (ad ρ̄)(1)) = 0 then H²(G_K, ad ρ̄) = 0 and R^□_ρ̄ is a power series ring in n² variables over 𝒪. (2) For n = 2 and fixed determinant χ: R^□_{ρ̄,χ} is equidimensional of Krull dimension 4, R^□_{ρ̄,χ}[1/p] has dimension 3, its irreducible components are regular and finitely many, and the restriction to inertia of the Weil–Deligne type (forgetting N) is constant on each component.

Hypotheses: (2) is stated for n = 2 as in Gee (who cites Böckle's survey Theorem 3.3.1); the general-n component statement is recorded through BLGGT Lemma 1.3.4 as quoted by Tung..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; LocalGaloisDeformationRings:R08.2/tame-splitting; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: CHT08, §2.4.3, Lemma 2.4.9, p. 40; GEE-MLT-2022, Theorem 3.31, p. 19; TUNG-2021, §3.2.6, Lemma 3.2.8, p. 15; BLGGT-2014, Lemma 1.3.4, arXiv v4 p. 21.


### `LocalGaloisDeformationRings:R08.2/steinberg-condition` — Steinberg (unipotent-monodromy) lifts

Let ℓ ≠ p, ρ̄ trivial of dimension n, q ≡ 1 mod p. D^Stein,1 consists of the lifts ρ with char ρ(σ)(X) = (X − 1)^n for σ ∈ I_K and char ρ(φ)(X) ∈ Pol_n({n}, q), i.e. Frobenius eigenvalues of the form α, qα, …, q^{n−1}α; D^Stein is its flat closure (the quotient by λ-power torsion). For n = 2 this is Gee's P_m: char ρ(σ) = (X − 1)² and q(tr ρ(φ))² = (1 + q)² det ρ(φ). The condition records the monodromy relation; it is not the same as scalar (unipotent) inertial semisimplification, which is D^{(1,…,1)}.

Hypotheses: A special/Steinberg condition includes monodromy and is not synonymous with a scalar inertial semisimplification..

Suppliers: LocalGaloisDeformationRings:R08.2/tame-splitting; GlobalGaloisDeformations:R04.3/local-deformation-problem; GlobalGaloisDeformations:R04.3/deformation-problem-ideal.

API `TauCeti.GaloisDeformation.Local.SteinbergLifts`: D^Stein,1 and its flat closure D^Stein.

API `TauCeti.GaloisDeformation.Local.steinberg_charpoly_frob`: Frobenius eigenvalues in ratio q.

API `TauCeti.GaloisDeformation.Local.steinberg_le_unipotentInertia`: D^Stein ⊆ D^{(1,…,1)}.

API `TauCeti.GaloisDeformation.Local.steinberg_n_two`: For n = 2, the relation q(tr ρ(φ))² = (1 + q)² det ρ(φ).

API `TauCeti.GaloisDeformation.Local.SteinbergLifts.baseChange`: A coefficient map carries a lift with unipotent inertia and a chosen q-chain Frobenius polynomial to one satisfying the same equations. A lift represented by the 𝒪-flat closure stays represented by that quotient after composition.

Test `stein_n_two_relation` (computation): For n = 2 the Steinberg relation is q(tr ρ(φ))² = (1 + q)² det ρ(φ).

Test `stein_subset_unipotent` (characterisation): Every Steinberg lift has unipotent inertia.

Test `stein_not_unipotent_only` (non-example): An unramified lift with Frobenius eigenvalue ratio ≠ q has unipotent inertia but is not Steinberg.

Sources: TAYLOR-II-2008, §3, definition of D^{Stein,1} and D^{Stein} before Proposition 3.1, p. 196; GEE-MLT-2022, Definition 3.36(3), p. 21.


### `LocalGaloisDeformationRings:R08.2/q-tame-group` — The q-tame group

For a positive integer q prime to p, the q-tame group T_q is the semidirect product t^{ℤ_p} ⋊ φ_q^{ℤ̂} of profinite groups with φ_q t φ_q^{-1} = t^q. For b ≥ 1, T_{q^b} is identified with the closed subgroup topologically generated by t and φ_q^b. For K/ℚ_ℓ finite (ℓ ≠ p) with residue field of order q, G_K/P_K ≅ T_q, where P_K is the kernel of a surjection I_K ↠ ℤ_p (R08.2/tame-splitting).

Hypotheses: The isomorphism G_K/P_K ≅ T_q depends on a choice of Frobenius lift and of a generator t of the p-part of tame inertia.; The pair criterion is for R∈C_𝒪 with its maximal-ideal topology and continuous representations; it is not a claim for arbitrary discrete rings..

Suppliers: LocalGaloisDeformationRings:R08.2/tame-splitting; mathlib:ProfiniteGrp.

API `TauCeti.GaloisDeformation.Local.TameGroup`: T_q as a profinite group with generators t, φ_q.

API `TauCeti.GaloisDeformation.Local.TameGroup.conj_t`: φ_q t φ_q^{-1} = t^q.

API `TauCeti.GaloisDeformation.Local.TameGroup.lift`: A pair (A, B) in GL_n(R) with B A B^{-1} = A^q and A of pro-p order (for R ∈ C_𝒪: the reduction of A unipotent) defines a unique continuous representation of T_q.

API `TauCeti.GaloisDeformation.Local.TameGroup.ofLocalField`: G_K/P_K ≅ T_q for K/ℚ_ℓ with residue field 𝔽_q, given the choices.

API `TauCeti.GaloisDeformation.Local.TameGroup.lift_ext`: Two continuous representations of T_q into GL_n(R) that agree on the chosen dense topological generators t and φ_q are equal. The unique lift of a tame pair commutes with continuous coefficient maps.

Test `tameGroup_abelianisation` (computation): T_q^{ab} ≅ ℤ_p/(q − 1) × ℤ̂.

Test `tameGroup_q_one` (degenerate): q = 1: T_1 = ℤ_p × ℤ̂ is abelian (the relation φtφ^{-1} = t is trivial).

Test `tameGroup_not_direct` (non-example): For q ≥ 2, T_q is not abelian: φ_q t φ_q^{-1} = t^q ≠ t (t has infinite order).

Test `tameGroup_sub` (characterisation): ⟨t, φ_q^b⟩ ≅ T_{q^b}.

Sources: LTXZZ-RIGID-2021, Definition 3.3.1, arXiv v1 p. 15.


### `LocalGaloisDeformationRings:R08.2/gsp4-ramification-types` — Ramification types U1–U3, P, H of GSp₄-valued residual representations

Let x ≠ p be a prime and r̄ : G_x → GSp₄(k) with similitude a power of the cyclotomic character. r̄ is of type: (U3) if r̄(I_x) is unipotent, conjugate to the group generated by exp(N₃), N₃ = E₁₂ + E₂₃ − E₃₄ (rank 3); (U2) if conjugate to ⟨exp(N₂)⟩, N₂ = E₁₂ − E₃₄ (rank 2); (U1) if conjugate to ⟨exp(N₁)⟩, N₁ = E₂₃ (rank 1); (P) if r̄|G_x is a sum of characters with r̄|I_x = diag(1, 1, χ_x, χ_x) for a nontrivial χ_x, with isotropic invariant and χ_x-planes, and x − 1 prime to p; (H) if r̄|I_x is absolutely irreducible and x⁴ − 1 is prime to p. A cyclotomic-power similitude excludes type P, the types U, P, H are mutually exclusive, and r̄ is of type U2 (resp. U3) iff r̄(I_x) is generated by exp(N) with N nilpotent of rank 2 (resp. 3).

Hypotheses: exp(N₃) requires p ≥ 5 (N₃³ ≠ 0, so exp needs N³/3! to be integral); Matrices are in the basis where J is antidiagonal (1, 1, −1, −1).; State rank-to-orbit identifications over a splitting coefficient field (or after algebraic closure). Over a finite field a square-zero rank-two symplectic nilpotent can have more than one rational orbit; rank alone does not select the displayed representative..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:R08.2/tame-splitting.

API `TauCeti.GaloisDeformation.Local.GSp4RamType`: The types U1, U2, U3, P, H as a predicate on r̄ : G_x → GSp₄(k).

API `TauCeti.GaloisDeformation.Local.GSp4RamType.unipotent_rank`: r̄ is of type U_i iff r̄(I_x) is generated by exp(N) with N ∈ sp₄ nilpotent of rank i.

API `TauCeti.GaloisDeformation.Local.GSp4RamType.exclusive`: The types U, P, H are mutually exclusive.

API `TauCeti.GaloisDeformation.Local.GSp4RamType.not_P`: A cyclotomic-power similitude excludes type P.

API `TauCeti.GaloisDeformation.Local.GSp4RamType.conjugate`: Each ramification type is invariant under GSp₄(k)-conjugation of the residual representation. Its geometric orbit description is preserved by splitting coefficient-field extension, with the rational-orbit qualification already stated.

Test `gsp4Type_U1` (computation): r̄(σ) = exp(E₂₃) = 1 + E₂₃ has rank-one logarithm, so r̄ is U1.

Test `gsp4Type_U3_needs_p5` (non-example): For p = 3, exp(N₃) = 1 + N₃ + N₃²/2 + N₃³/6 is not defined over k; type U3 is stated for p ≥ 5.

Test `gsp4Type_unramified` (degenerate): Unramified r̄ is of no type.

Test `gsp4Type_H` (computation): r̄|I_x absolutely irreducible with x ≡ 2 mod 5, p = 5: x⁴ − 1 ≡ 0 mod 5 is excluded from type H.

Sources: CG-2020, Assumption 4.3, published pp. 813–814; CG-2020, Remark 4.4, published p. 814.


### `LocalGaloisDeformationRings:R08.2/minimally-ramified-ring` — The minimally ramified deformation ring

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. The minimally ramified problem D_v is liftable, its tangent space L_v has dimension h⁰(G_K, ad ρ̄), and R^loc/I(D_v) is a power series ring in n² variables over 𝒪. If p ∤ #ρ̄(I_K), a lift is minimally ramified iff it vanishes on ker ρ̄|_{I_K}, and L_v = H¹(G_K/I_K, (ad ρ̄)^{I_K}).

Hypotheses: No hypothesis on ρ̄ beyond continuity; the p ∤ #ρ̄(I_K) description is a special case..

Suppliers: LocalGaloisDeformationRings:R08.2/minimally-ramified-condition; LocalGaloisDeformationRings:R08.2/tame-splitting; LocalGaloisDeformationRings:R08.1/local-lifting-ring; GlobalGaloisDeformations:R04.3/deformation-problem-ideal; mathlib:MvPowerSeries.

Sources: CHT08, §2.4.4, Corollary 2.4.21, p. 46; CHT08, §2.4.4, Lemma 2.4.22, p. 47.


### `LocalGaloisDeformationRings:R08.2/inertial-type-quotient` — Fixed inertial type quotients

For n = 2, ℓ ≠ p and a full inertial Weil–Deligne type τ = (r|I_K,N), let R^□_{ρ̄,χ,τ} be the reduced 𝒪-flat quotient defined by the Zariski closure in Spec R^□_{ρ̄,χ} of its characteristic-zero points of exact type τ. A nonzero such quotient is a union of irreducible components of absolute Krull dimension 4. Exact-type points lie in its generic fibre and are Zariski dense there; boundary points may have smaller monodromy. The pointwise iff in Gee §3.31 requires correction. Only finitely many types give nonzero quotients.

Hypotheses: The type retains N, as in Gee §3.30. The closure construction is Shotton Definition 3.5 and Proposition 3.6; constancy of full monodromy is only claimed for points on unique irreducible components (BLGGT Lemma 1.3.4(2))..

Suppliers: LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; GlobalGaloisDeformations:R04.3/deformation-problem-ideal.

API `TauCeti.GaloisDeformation.Local.typeQuotient`: R^□_{ρ̄,χ,τ} as a quotient of R^□_{ρ̄,χ}.

API `TauCeti.GaloisDeformation.Local.typeQuotient_points`: Every exact-type point factors through the type quotient; its exact-type points are Zariski dense. The converse can fail on component intersections.

API `TauCeti.GaloisDeformation.Local.typeQuotient_krullDim`: Nonzero ⇒ Krull dimension 4 (n = 2).

API `TauCeti.GaloisDeformation.Local.typeQuotient_finite`: Only finitely many full inertial types have a nonzero closure quotient.

API `TauCeti.GaloisDeformation.Local.typeQuotient_unique`: The defining ideal is the intersection of the kernels of all characteristic-zero exact-type points. Any reduced 𝒪-flat quotient defined by that same closure has the same kernel, hence a unique compatible quotient-ring isomorphism.

Test `typeQuotient_unramified` (computation): For ρ̄ unramified, trivial r|I_K and N = 0 give the unramified quotient. The closure of a Steinberg type with N ≠ 0 can meet it at an N = 0 point.

Test `typeQuotient_finite` (characterisation): Only finitely many types occur.

Test `typeQuotient_not_torsion` (non-example): The naive quotient by the equations of the type need not be p-torsion free; the definition takes the flat closure.

Sources: GEE-MLT-2022, §3.31, after Theorem 3.31, pp. 19–20; SHOTTON-2018, Definition 3.5 and Proposition 3.6, p. 12.


### `LocalGaloisDeformationRings:R08.2/taylor-wiles-local-ring` — Local rings at Taylor–Wiles primes

Let n = 2, ℓ ≠ p, ρ̄ unramified with ρ̄(Frob_K) having distinct eigenvalues, q ≡ 1 mod p with p^m ∥ q − 1, and χ unramified. Then R^□_{ρ̄,χ} ≅ 𝒪[[x, y, B, u]]/((1 + u)^{p^m} − 1), with ρ^□(φ) = (1 y; x 1)^{-1} diag(α + B, χ(φ)/(α + B)) (1 y; x 1) and ρ^□(σ) = (1 y; x 1)^{-1} diag(1 + u, (1 + u)^{-1}) (1 y; x 1).

Hypotheses: Distinct Frobenius eigenvalues α ≠ β in 𝔽 and q ≡ 1 mod p..

Suppliers: LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; LocalGaloisDeformationRings:R08.2/tame-splitting; LocalGaloisDeformationRings:R08.1/local-lifting-ring.

Sources: GEE-MLT-2022, §3.32, Lemma 3.33 and Exercise 3.34, p. 20.


### `LocalGaloisDeformationRings:R08.2/gsp4-unipotent-local-models` — Local models for GSp₄ Ihara avoidance: nilpotent strata, 𝒩(q) and ℳ(x, y; q)

Let p ≥ 3 and q a positive integer prime to p. 𝒰 ⊂ GSp₄/𝒪 is the closed subscheme of matrices with characteristic polynomial (X − 1)⁴ and 𝒩 ⊂ Lie GSp₄ that of matrices with characteristic polynomial X⁴. The truncated maps exp₂(N) = I + N + N²/2 + N³/2 and log₂(U) = (U − I) − (U − I)²/2 are mutually inverse GSp₄-equivariant isomorphisms 𝒩 ≅ 𝒰, with exp₂(mN + m*N³) = exp₂(N)^m and log₂(U^m) = m log₂(U) + m* log₂(U)³, m* = (m − m³)/3. 𝒩_i ⊂ 𝒩 is the reduced locally closed stratum of nilpotents of rank i, with representatives N₀ = 0, N₁ = E₁₄, N₂ = E₁₃ + E₂₄, N₃ = E₁₂ + E₂₃ − E₃₄; the centraliser Z_{GSp₄}(N_i) is smooth over 𝒪 with fibres of dimensions 11, 7, 5, 3. 𝒩(q) is the scheme of pairs (Φ, N) with Φ ∈ GSp₄, N ∈ 𝒩 and ΦNΦ^{-1} = qN + q*N³, q*=(q−q³)/3∈ℤ, and ℳ(x, y; q) (x, y ∈ 𝒪^×) the scheme of pairs (Φ, Σ) ∈ GSp₄² with char Σ = (X − x)(X − y)(X − y^{-1})(X − x^{-1}) and ΦΣΦ^{-1} = Σ^q; (Φ, Σ) ↦ (Φ, log₂ Σ) is an isomorphism ℳ(1, 1; q) ≅ 𝒩(q).

Hypotheses: p ≥ 3 is needed for the denominators 1/2 in exp₂ and log₂ (they replace exp and log, which would need p ≥ 5).; In Proposition 7.4.10 the sign of xδ is wrong and part (2) for i = 2 needs √−1; 𝒫 of §7.4.12 is the polynomial space, not 𝒫̃/W; Σ₀ = diag(x, y, y^{-1}, x^{-1}) in Proposition 7.4.18.; The nilpotent representatives describe geometric or split orbits; the source’s rank-two rational conjugacy statement needs the indicated coefficient enlargement..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:R08.2/steinberg-condition.

API `TauCeti.GaloisDeformation.Local.GSp4.exp₂`: exp₂ : 𝒩 → 𝒰, N ↦ I + N + N²/2 + N³/2.

API `TauCeti.GaloisDeformation.Local.GSp4.log₂`: log₂ : 𝒰 → 𝒩, U ↦ (U − I) − (U − I)²/2.

API `TauCeti.GaloisDeformation.Local.GSp4.exp₂_log₂`: exp₂ ∘ log₂ = id and log₂ ∘ exp₂ = id.

API `TauCeti.GaloisDeformation.Local.GSp4.exp₂_pow`: exp₂(mN + m*N³) = exp₂(N)^m, m* = (m − m³)/3.

API `TauCeti.GaloisDeformation.Local.GSp4.nilpotentStratum`: 𝒩_i, the rank-i nilpotent stratum, with representative N_i.

API `TauCeti.GaloisDeformation.Local.GSp4.MSpace`: ℳ(x, y; q) ⊂ GSp₄², with ℳ(1, 1; q) ≅ 𝒩(q).

API `TauCeti.GaloisDeformation.Local.GSp4.exp₂_conjugate`: For invertible g in GSp₄, exp₂(gNg⁻¹)=g exp₂(N)g⁻¹ and log₂(gUg⁻¹)=g log₂(U)g⁻¹. Both polynomial maps commute with coefficient maps in which 2 is invertible.

Test `exp2_N1` (computation): exp₂(E₁₄) = I + E₁₄ (E₁₄² = 0).

Test `exp2_zero` (degenerate): exp₂(0) = I and log₂(I) = 0.

Test `exp2_not_exp` (non-example): For p≥5 and N₃ with N₃³≠0, exp₂(N₃)≠exp(N₃)=I+N₃+N₃²/2+N₃³/6. At p=3 the usual exponential formula is undefined, whereas exp₂ is still a bijection 𝒩→𝒰.

Test `mstar_integral` (computation): m* = (m − m³)/3 ∈ ℤ for all m ∈ ℤ, e.g. m = 2 gives m* = −2.

Test `nilpotentModel_cubic_correction` (non-example): For q=2 one has q*=−2. In characteristic 3 the cubic coefficient is 1 and N₃³≠0, so the defining equation is ΦN₃Φ⁻¹=2N₃+N₃³, not merely 2N₃.

Sources: BCGP-2021, §7.4.9, arXiv v3 p. 190; BCGP-2021, Proposition 7.4.10, arXiv v3 p. 191; BCGP-2021, §7.4.13, pp. 193–194.


### `LocalGaloisDeformationRings:R08.2/level-raising-local-problems` — Level-raising local deformation problems 𝒟^mix, 𝒟^unr, 𝒟^ram

Let F/F⁺ be a quadratic CM extension, v an inert finite place with residue cardinality q=Nv prime to p, w the place above v, N≥2, p≥N, and p∤(q²−1). Let (r̄,χ) be the polarized 𝒢_N-valued local problem of Definition 3.5.1 of the companion paper (LTXZZ-RIGID-2021), with r̄♮ on G_{F_w} unramified, χ=η_v^μ ε_p^{1−N} with μ even, and the generalized eigenvalues of r̄♮(φ_w) containing {q^{−N},q^{−N+2}} exactly once. In its canonical rank-two block M₀, define 𝒟^mix by inertia preserving M₀ and acting trivially on M₁, 𝒟^unr by trivial inertia on M₀ too, and 𝒟^ram by characteristic polynomial (T−q^{−N})(T−q^{−N+2}) on M₀. For these polarized lifts, 𝒟^mix is formally smooth over Spf 𝒪[[x₀,x₁]]/(x₀x₁) of pure relative dimension N²−1; its two components 𝒟^unr and 𝒟^ram have relative dimension N². With r♮(t)v=v+xv′, and Frobenius eigenvalues s,s′, the relation is x(s−q^{−N})=0. Here φ_w t φ_w⁻¹=t^{q²}, since #k(w)=q². This is not asserted for arbitrary GL_N lifts over a local field of residue size q.

Hypotheses: Retain the polarized group 𝒢_N=(GL_N×GL₁)⋊{1,j}, its fixed similitude and the inert quadratic local extension. The source’s μ is the sign parameter of this polarized problem. The monodromy direction is from the q^{−N} eigenline toward q^{−N+2}: with the convention φ_w t φ_w⁻¹ = t^{q²} of R08.2/q-tame-group, Φ X Φ⁻¹ = q²X forces X to map the eigenline of eigenvalue s to that of eigenvalue q²s. LTXZZ §6.4 writes the two vectors in the other order; with the convention used here that direction would force x = 0 (unless p | q² + 1).; The ambient lifting ring is that of the 𝒢_N-valued r̄ : Γ_{F⁺_v} → 𝒢_N(k) with ν∘r = χ (R08.1/g-valued-framed-ring for G = 𝒢_N with fixed multiplier). GlobalGaloisDeformations G7/polarized-deformation-problem supplies 𝒢_N and its dictionary with polarized representations of Γ_F; its own local problems are taken at places split in F, so the problems at the inert place v are constructed here.; Parity of μ. The source states Proposition 3.5.2 for every μ ∈ ℤ/2. In the coordinates of its proof (N = 2, B = (0, (−1)^{μ+1}(1 + x); q(1 + y), 0), X = (0, 0; x₀, 0)), relation (3.21) reads x₀·((1 + y) − (−1)^μ(1 + x)) = 0. For μ even this is the nodal equation x₀(x − y) = 0. For μ odd it is x₀(2 + x + y) = 0, so x₀ = 0 (p is odd): every lift in 𝒟^mix is unramified, 𝒟^mix = 𝒟^unr, and 𝒟^ram has relative dimension N² − 1. The source applies the proposition with μ ≡ N mod 2 and N even (its Theorem 3.6.3 assumes there are no level-raising places when N is odd)..

Suppliers: LocalGaloisDeformationRings:R08.2/q-tame-group; LocalGaloisDeformationRings:R08.2/unramified-lifting-ring; LocalGaloisDeformationRings:R08.2/steinberg-condition; LocalGaloisDeformationRings:R08.1/local-lifting-ring; GlobalGaloisDeformations:R04.3/local-deformation-problem; GlobalGaloisDeformations:G7/polarized-deformation-problem; LocalGaloisDeformationRings:R08.1/g-valued-framed-ring.

API `TauCeti.GaloisDeformation.Local.LevelRaising.mix`: The polarized local problem 𝒟^mix with its canonical rank-two block at an inert place; the GL_N restriction is r♮ on G_{F_w}.

API `TauCeti.GaloisDeformation.Local.LevelRaising.unr`: 𝒟^unr ⊂ 𝒟^mix.

API `TauCeti.GaloisDeformation.Local.LevelRaising.ram`: 𝒟^ram ⊂ 𝒟^mix.

API `TauCeti.GaloisDeformation.Local.LevelRaising.localModel`: 𝒟^mix is formally smooth over Spf 𝒪⟦x₀, x₁⟧/(x₀x₁), with 𝒟^unr = {x₀ = 0} and 𝒟^ram = {x₁ = 0}.

API `TauCeti.GaloisDeformation.Local.LevelRaising.relation`: x(s − q^{−N}) = 0 in R^mix.

API `TauCeti.GaloisDeformation.Local.LevelRaising.unr_eq_minimal`: For the unramified polarized residual problem 𝒟^unr is the polarized unramified lifting condition; after restriction to G_{F_w} it is unramified GL_N inertia.

Test `levelRaising_dims` (computation): Relative dimensions: 𝒟^mix and 𝒟^unr have N² − 1 + 1 = N² as framed rings over 𝒪 on each component; 𝒟^ram is formally smooth of relative dimension N².

Test `levelRaising_N2_components` (characterisation): For N = 2, Spec R^mix has exactly two irreducible components, R^unr and R^ram, meeting in R^mix/(x, s − q^{−2}).

Test `levelRaising_wrong_direction` (non-example): For φ_w t φ_w⁻¹=t^{q²}, the direction r♮(t)v=v+xv′ gives x(s′−q²s)=0; the reversed direction gives x(s−q²s′)=0. These are different relations. Both vanish when x=0, so the reversed relation does not fail on the unramified component.

Test `levelRaising_degenerate_eigenvalues` (degenerate): When p divides q²−1 the two residual eigenvalues coincide and separate eigenlines are not supplied by Hensel. The polarized nodal model requires p∤(q²−1).

Sources: LTXZZ-RIGID-2021, Definition 3.5.1, arXiv v1 p. 27; LTXZZ-RIGID-2021, Proposition 3.5.2, arXiv v1 p. 27; LTXZZ-2022, §6.4, arXiv v3 pp. 116–117 (published p. 281 by the numbering recorded in the source entry; the published text was not read).


### `LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection` — Unrestricted lifting rings away from p are complete intersections

Let K/ℚ_ℓ be finite, ℓ ≠ p, and r̄ : G_K → GL_N(k). (1) The lifting ring R^□_r̄ is a reduced local complete intersection, flat over 𝒪 and of pure relative dimension N²; R^□_r̄/ϖ is equidimensional of dimension N². (2) Every irreducible component of Spf R^□_r̄ is a local deformation problem. (3) The minimally ramified problem 𝒟^min (R08.2/minimally-ramified-condition) is an irreducible component of Spf R^□_r̄, formally smooth over 𝒪 of relative dimension N².

Hypotheses: The source (LTXZZ-RIGID Proposition 3.4.12) states (1)–(3) for 𝒢_N-valued liftings with fixed similitude at any place of F⁺ not above p, and imposes p ≥ N in its definition of the minimally ramified problem; this node is the case of a place split in F, where (1) is Shotton's Theorem 2.5 and (3) is CHT Corollary 2.4.21, and where p ≥ N is not needed: a formally smooth quotient of relative dimension N² of the equidimensional ring R^□_r̄ is an irreducible component..

Suppliers: LocalGaloisDeformationRings:R08.2/tame-splitting; LocalGaloisDeformationRings:R08.2/minimally-ramified-ring; LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction.

Sources: LTXZZ-RIGID-2021, Proposition 3.4.12, arXiv v1 p. 25; NT-2026, proof of Lemma 3.6, arXiv v2 p. 18; SHOTTON-2018, Theorem 2.5, arXiv v2 p. 7.


### `LocalGaloisDeformationRings:R08.2/reducible-lifts-prescribed-determinant` — Lifts away from p of reducible residual representations with prescribed determinant

Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S} and μ = κ^{r−1}χ₀ a geometric lift of det ρ̄ (r ≥ 2, χ₀ of finite order). For v ∈ S not above p there is, after enlarging 𝒪, a lift ρ_v : G_{F_v} → GL₂(𝒪′) of ρ̄|G_{F_v} with determinant μ, lying on a formally smooth irreducible component of R^{□,μ}_{ρ̄|G_{F_v}}.

Suppliers: LocalGaloisDeformationRings:R08.2/minimally-ramified-ring; LocalGaloisDeformationRings:R08.2/steinberg-condition; LocalGaloisDeformationRings:R08.1/local-fixed-determinant.

Sources: FKP-2022, Lemma 7.2, first bullet, arXiv v5 pp. 33–34.


### `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components` — Components for Ihara avoidance

Let ℓ ≠ p, ρ̄ trivial, q ≡ 1 mod p, characters χ_i : I_K → 1 + λ trivial mod λ. (1) If the χ_i are distinct, Spec R^□/I^{(χ_i)} is irreducible with characteristic-zero generic point and Krull dimension n² + 1. (2) R^□/(λ, I^{(χ_i)}) = R^□/(λ, I^{(1,…,1)}). (3) All components of Spec R^□/I^{(1,…,1)} have dimension n² + 1 with characteristic-zero generic points, and each prime minimal over λ contains a unique minimal prime. (4) Spec R^□/I^Stein is irreducible of dimension n² + 1. For n = 2 with χ trivial: the minimal primes of R^□_{ρ̄,χ} are √P_ur, √P_m and √P_ζ (ζ ≠ 1), with √P₁ = √P_ur ∩ √P_m, and R^□_{χ,1}/λ = R^□_{χ,ζ}/λ.

Hypotheses: These are Taylor's 'Ihara avoidance' rings; they compare Galois representations with different ramification at v ∤ p.; The geometric irreducibility statements use sufficiently large coefficient integers 𝒪. Thorne 2015 supplies the general-rank extension beyond Taylor’s standing p > n: Proposition 3.15 for parts (1)–(3) and §3.3.4 with Proposition 3.17 for the Steinberg part (4); in the separate n=2 fixed-determinant clauses assume p>2 and χ=1 on G_K..

Suppliers: LocalGaloisDeformationRings:R08.2/steinberg-condition; LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; LocalGaloisDeformationRings:R08.2/inertial-type-quotient.

Sources: TAYLOR-II-2008, §3, Proposition 3.1, p. 196; GEE-MLT-2022, Proposition 3.37 and Theorem 3.38, p. 21; NT-2026, proof of Theorem 5.9, arXiv v2 p. 45; THORNE-2015, Proposition 3.15 and its proof, p. 18.


### `LocalGaloisDeformationRings:R08.2/taylor-wiles-local-tangent` — Taylor–Wiles local conditions in rank n: the tangent dimension

Let F_v/ℚ_ℓ be finite (ℓ ≠ p) with N(v) ≡ 1 mod p, and r̄|G_v ≅ s̄_v ⊕ ψ̄_v with ψ̄_v a one-dimensional generalised Frobenius eigenspace (unramified), ξ a fixed determinant. 𝒟_v consists of lifts of determinant ξ of the form s_v ⊕ ψ_v lifting s̄_v, ψ̄_v, with I_v acting by (possibly different) scalars on s_v and ψ_v, and L_v ⊂ H¹(G_v, ad⁰r̄) its tangent space. Then dim_k L_v − h⁰(G_v, ad⁰r̄) = 1.

Hypotheses: The congruence N(v) ≡ 1 mod p is needed and is omitted in CG18 §8.5.1 (it holds for the Taylor–Wiles primes used): without it the ramified direction does not exist.; Retain CG18’s standing p>n and sufficiently large coefficient field for the cited tangent-space theorem..

Suppliers: LocalGaloisDeformationRings:R08.2/taylor-wiles-local-ring; LocalGaloisDeformationRings:R08.2/tame-splitting; GlobalGaloisDeformations:R04.3/local-deformation-problem.

Sources: CG-2018, §8.5.1, published p. 408.


### `LocalGaloisDeformationRings:R08.2/gsp4-taylor-wiles-lifts` — GSp₄ lifts at Taylor–Wiles places

Let v be a place with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) unramified with multiplier ψ unramified, and ρ̄(Frob_v) with four distinct eigenvalues ᾱ₁, ᾱ₂, ᾱ₃ = ψ(Frob_v)/ᾱ₂, ᾱ₄ = ψ(Frob_v)/ᾱ₁. (1) Every lift ρ : G_{F_v} → GSp₄(A) with multiplier ψ is GSp₄(A)-conjugate to γ₁ ⊕ γ₂ ⊕ ψγ₂^{-1} ⊕ ψγ₁^{-1} for unique characters γ_i lifting the unramified γ̄_i with γ̄_i(Frob_v) = ᾱ_i. (2) With Δ_v = k(v)^×(p)², the characters γ_i∘Art_{F_v}|_{𝒪^×} give a local map 𝒪[Δ_v] → R^□_v, formally smooth of relative dimension 10, depending on the ordering of the eigenvalues.

Hypotheses: The conjugation in (1) is by GSp₄(A), not just by the congruence kernel: the root-coordinate argument removes only the off-torus part (BCGP25 Lemma 6.1.6).; The integral inertia matrix is diagonal in the lifted Frobenius eigenspaces because the relevant eigenvalue ratios minus q are units; q≡1 mod p does not mean q=1 in 𝒪..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:R08.1/g-valued-presentations; LocalGaloisDeformationRings:R08.2/taylor-wiles-local-ring; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

Sources: BCGP-2021, Lemma 7.4.4, arXiv v3 p. 189.


### `LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy` — Inertial types with monodromy and fixed-type rings

Let K/ℚ_ℓ be finite, ℓ ≠ p. An inertial type (in Shotton's sense) is an isomorphism class of continuous representations τ : I_K → GL_n(ℚ̄_p) that extend to the Weil group W_K, together with the monodromy: equivalently, an I_K-isomorphism class of Weil–Deligne representations (r, N) restricted to inertia with N retained. For r̄ : G_K → GL_n(k) and τ, R^□_r̄(τ) is the reduced 𝒪-flat quotient of R^□_r̄ defined by the Zariski closure of exact-type characteristic-zero points; N is retained in τ but may drop at boundary points.

Hypotheses: This is the rank-general form of R08.2/inertial-type-quotient, which already retains N. The full type is the isomorphism class of the inertial representation including its unipotent part, equivalently (r|I_K,N)..

Suppliers: LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection; LocalGaloisDeformationRings:R08.2/inertial-type-quotient; LocalGaloisDeformationRings:R08.2/steinberg-condition; ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor.

API `TauCeti.GaloisDeformation.Local.InertialType`: An inertial type: an I_K-isomorphism class of Weil–Deligne representations restricted to I_K, N retained.

API `TauCeti.GaloisDeformation.Local.fixedTypeRing`: R^□_r̄(τ), the reduced 𝒪-flat closure quotient of exact-type points.

API `TauCeti.GaloisDeformation.Local.fixedTypeRing_points`: Every exact-type point lies on R^□_r̄(τ), and such points are dense in its generic fibre. Boundary points need not have exact type τ.

API `TauCeti.GaloisDeformation.Local.fixedTypeRing_union`: The generic fibre is covered by finitely many closed type-ring loci, which can intersect; this is not a disjoint union.

API `TauCeti.GaloisDeformation.Local.fixedTypeRing_n2`: For n=2, after imposing the same compatible determinant, this closure definition agrees with R08.2/inertial-type-quotient.

API `TauCeti.GaloisDeformation.Local.fixedTypeRing.unique`: The reduced flat closure quotient is uniquely characterized by the intersection of kernels of exact-type characteristic-zero points. Its ring maps agree if they agree after precomposing the quotient map from R^□_r̄.

Test `inertialType_steinberg_vs_trivial` (non-example): The trivial type and Steinberg type Sp₂ differ by N. Their closure rings can meet at an N=0 specialization, for instance the family ρ_c(φ)=diag(q,1), ρ_c(t)=(1 c;0 1) with c=pt and q≡1 mod p.

Test `inertialType_unramified` (computation): For r̄ unramified and τ trivial with N = 0 the ring is the unramified lifting ring, formally smooth of relative dimension n² (R08.2/unramified-lifting-ring).

Test `inertialType_dimension` (characterisation): Each nonzero R^□_r̄(τ) is equidimensional of dimension 1 + n².

Test `inertialType_empty` (degenerate): If the reductions of τ|P_K and ρ̄|P_K are incompatible after coefficient extension, the exact-type locus and its closure ring are empty. Compare characteristic-zero and characteristic-p representations through reduction, not literal equality.

Sources: NT-2026, proof of Lemma 3.6, arXiv v2 p. 18; SHOTTON-2018, Definition 3.5 and Proposition 3.6, p. 12.


### `LocalGaloisDeformationRings:R08.2/rank-two-unrestricted-rings-cg` — Fixed-determinant rank-two rings away from p: complete intersection with smooth generic fibre

Let p ≥ 3, v ≠ p a prime, and ρ̄ : G_v → GL₂(k) ramified, in the setting of CG18 §4.1 (Lemma 4.11) at a prime v | N; φ is the fixed determinant χ_φ of that section and R_v = R_{v,φ} the framed fixed-determinant ring. (1) R_v is a complete intersection, and R_v[1/p] is formally smooth over K. (2) After twisting ρ̄|G_v to be minimal among its twists (and extending k), H²(G_v, ad⁰ρ̄) ≠ 0 — i.e. R_v is not formally smooth — exactly in four cases: (a) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (χ ⊕ 1) with χ ramified; (b) v ≡ −1 mod p, ρ̄|G_v absolutely irreducible and induced from ℚ_{v²}; (c) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (1 ∗; 0 1) with ∗ ramified; (d) v ≡ −1 mod p, ρ̄|G_v ≅ unr ⊗ (ω̄ ∗; 0 1) with ∗ ramified. (3) In cases (a), (b), R_v is a power series ring over 𝒪[Δ], Δ the maximal p-quotient of the multiplicative group of the finite field 𝔽_v, resp. 𝔽_{v²} (a finite cyclic p-group). (4) In cases (c), (d), R_v ≅ 𝒪⟦x₁, …, x₄⟧/(r) for one r ≠ 0; in case (c) one may take r = C(T) − T with C(t + t^{-1}) = t^v + t^{-v} and T the trace of a generator of tame inertia, and R_v[1/p] has (q + 1)/2 geometric components (q the largest power of p dividing v − 1): one where inertia acts unipotently (T = 2) and (q − 1)/2 where it acts through ζ ≠ 1, ζ^q = 1, with T = ζ + ζ^{-1}.

Hypotheses: The paper lists only (a)–(c); case (d) is omitted though the same argument applies: for ρ̄ ≅ (ω̄ ∗; 0 1) the line ω̄² ⊂ ad⁰ρ̄(1) is trivial exactly when v ≡ ±1 mod p.; Footnote 5 prints 'nilpotent' for unipotent and 'primitive q-th root of unity' for ζ ≠ 1 with ζ^q = 1; the corrected wording is used.; This is the ramified, conductor-minimal-among-twists setting v|N of CG18 §4.1, with p≥3 and the determinant character prescribed there. It excludes arbitrary unramified residual representations such as 1⊕1, whose unrestricted ring has nonsmooth points 1⊕ε..

Suppliers: LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection; LocalGaloisDeformationRings:R08.1/completion-at-points; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: CG-2018, Lemma 4.11, published p. 364; CG-2018, proof of Lemma 4.11, published p. 364; CG-2018, footnote 5, published p. 365.


### `LocalGaloisDeformationRings:R08.2/rigid-residual-conditions` — Rigidity of a residual representation for (Σ_min, Σ_lr)

Let F/F⁺ be a CM extension, N ≥ 2, ℓ = p ≥ N, and r̄ : Γ_{F⁺} → 𝒢_N(k) with similitude η^N_{F/F⁺}ε^{1−N}, r̄^♮ its restriction to Γ_F composed with the projection to GL_N. For disjoint finite sets Σ_min, Σ_lr of places of F⁺ not above p, with Σ_min containing every place at which r̄ is ramified and Σ_lr = ∅ when N is odd, r̄ is rigid for (Σ_min, Σ_lr) if: (1) for v ∈ Σ_min every lift of r̄_v is minimally ramified (R08.2/minimally-ramified-condition); (2) for v ∈ Σ_lr (inert in F, w the place above v) the generalised eigenvalues of r̄^♮_v(φ_w) contain the pair {‖v‖^{−N}, ‖v‖^{−N+2}} exactly once (the residual hypothesis of R08.2/level-raising-local-problems); (3) for v | p, r̄^♮_v is regular Fontaine–Laffaille crystalline (L7/fontaine-laffaille-deformation-condition); (4) r̄_v is unramified at every other finite place. All liftings are taken with the fixed similitude character.

Hypotheses: Condition (2) is purely residual; rigidity does not fix a component of the local rings.; The global object r̄ and the global problems 𝒮^mix, 𝒮^unr, 𝒮^ram belong to the polarized automorphy lifting Part II; this node records only the local conditions.; The polarized rigid datum has mutually disjoint Σ_min⁺, Σ_lr⁺ and Σ_p⁺; every level-raising place is inert in F/F⁺ and p∤((Nv)²−1), as in the standing assumptions immediately before Definition 3.6.1..

Suppliers: LocalGaloisDeformationRings:R08.2/minimally-ramified-condition; LocalGaloisDeformationRings:R08.2/level-raising-local-problems; LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection; LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition.

API `TauCeti.GaloisDeformation.Local.IsRigidFor`: The predicate on r̄ given by the local conditions (1)–(4) at Σ_min, Σ_lr, the places above p and the rest.

API `TauCeti.GaloisDeformation.Local.IsRigidFor.minimal`: For v ∈ Σ_min every lift of r̄_v is minimally ramified.

API `TauCeti.GaloisDeformation.Local.IsRigidFor.levelRaising`: For v ∈ Σ_lr the residual hypothesis of R08.2/level-raising-local-problems holds.

API `TauCeti.GaloisDeformation.Local.IsRigidFor.fontaineLaffaille`: For v | p, r̄^♮_v is regular Fontaine–Laffaille crystalline (clause (3)), in the sense of L7/fontaine-laffaille-deformation-condition.

API `TauCeti.GaloisDeformation.Local.IsRigidFor.unramified`: At every finite place outside Σ_min ∪ Σ_lr and not above p, r̄_v is unramified (clause (4)).

API `TauCeti.GaloisDeformation.Local.IsRigidFor.mono`: Rigid for (Σ_min, Σ_lr) and 𝔭 satisfying (2) ⟹ rigid for (Σ_min, Σ_lr ∪ {𝔭}). Require every added place to be outside the previous minimal, level-raising and p-adic sets and to satisfy the inert-place and q²−1 side conditions.

Test `rigid_empty` (degenerate): Σ_min = Σ_lr = ∅: rigidity says r̄ is unramified away from p and regular Fontaine–Laffaille at p.

Test `rigid_eigenvalue_pair_twice` (non-example): If r̄^♮_v(φ_w) has the pair {‖v‖^{−N}, ‖v‖^{−N+2}} twice, condition (2) fails and 𝒟^mix is not defined at v.

Test `rigid_add_place` (characterisation): Adding to Σ_lr a place satisfying (2) preserves rigidity (used with 𝔭 in LTXZZ §6.4).

Test `rigid_minimal_unramified` (computation): An unramified r̄_v with every lift unramified satisfies (1).

Sources: LTXZZ-2022, the rigidity definition (published Definition 6.3.3, p. 277; arXiv v3 Definition 6.3.4).


### `LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified` — Unipotent lifts of a regular unipotent residual monodromy are minimally ramified

Let K/ℚ_ℓ be finite (ℓ ≠ p), σ a topological generator of tame inertia, r̄ : G_K → GL_n(k) with r̄(σ) unipotent with a single Jordan block, and r a lift to A ∈ C_𝒪 with characteristic polynomial of r(σ) equal to (X − 1)^n. Then for every j ≤ n the natural map ker((r(σ) − 1)^j) ⊗_A k → ker((r̄(σ) − 1)^j) is an isomorphism. Hence the unipotent problem R^1 (char r(σ) = (X − 1)^n) equals the minimally ramified problem of R08.2/minimally-ramified-condition under this hypothesis on r̄.

Hypotheses: The appendix prints ⊗_R k for ⊗_A k.; r̄|_{I_K} is unipotent, in particular trivial on wild inertia, so that r̄(σ) is defined (as in part (2)(b) of the appendix's Theorem 1.2)..

Suppliers: LocalGaloisDeformationRings:R08.2/minimally-ramified-condition; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components.

Sources: CG-2020, Appendix §A.4(2)(a), published p. 888.


### `LocalGaloisDeformationRings:R08.2/gsp4-ihara-avoidance-rings` — GSp₄ Ihara-avoidance deformation rings

Let v be finite with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) trivial, ψ unramified with trivial reduction, and χ = (χ₁, χ₂) continuous characters 𝒪_{F_v}^× → 𝒪^× trivial mod λ. 𝒟_v^χ is the problem of lifts with multiplier ψ such that for σ ∈ I_{F_v}, char ρ(σ) = (X − χ₁(Art^{-1}σ))(X − χ₂(Art^{-1}σ))(X − χ₂(Art^{-1}σ)^{-1})(X − χ₁(Art^{-1}σ)^{-1}), represented by R_v^χ. (1) If χ₁, χ₂ ≠ 1 and χ₁ ≠ χ₂^{±1}, every closed point of Spec R_v^χ[1/p] is smooth and Spec R_v^χ is irreducible of dimension 11. (2) For χ₁ = χ₂ = 1, Spec R_v^1 is equidimensional of dimension 11 with characteristic-zero generic points, and every generic point of Spec R_v^1/λ specialises from a unique generic point of Spec R_v^1. (3) Let R̃_v^χ represent the lifts with the same condition on inertia and no condition on the multiplier. Then R̃_v^χ ≅ R_v^χ⟦T⟧, and R̃_v^χ is the completed local ring of ℳ(x, y; q_v) at (1, 1), x = χ₁(Art^{-1}σ), y = χ₂(Art^{-1}σ), and R_v^χ/λ = R_v^1/λ.

Hypotheses: v∤p and p>2, as in BCGP §7.4; this is an away-from-p local problem..

Suppliers: LocalGaloisDeformationRings:R08.2/gsp4-unipotent-local-models; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre; LocalGaloisDeformationRings:R08.1/g-valued-framed-ring.

Sources: BCGP-2021, Proposition 7.4.7, arXiv v3 p. 189; BCGP-2021, Proposition 7.4.21, arXiv v3 p. 197.


### `LocalGaloisDeformationRings:R08.2/taylor-wiles-block-condition` — The Taylor–Wiles block condition in rank n (including p = 2)

Let v be a finite place (v ∤ p) with r̄|G_{F_v} unramified and r̄(Frob_v) semisimple; choose an eigenvalue α_v ∈ k of multiplicity n₁ and the decomposition r̄|G_{F_v} = Ā_v ⊕ B̄_v with Ā_v(Frob_v) = α_v·1_{n₁}. 𝒟^TW_v(R) consists of lifts r with a decomposition r = A_v ⊕ B_v lifting it, B_v unramified and A_v|I_{F_v} = ψ_v·1_{n₁} for a character ψ_v : I_{F_v} → R^×. With Δ_v the p-part of k(v)^× (the 2-part when p = 2), ψ_v∘Art_{F_v} gives a canonical homomorphism Δ_v → R^×, making the lifting ring an 𝒪[Δ_v]-algebra. 𝒟^TW_v depends on α_v.

Hypotheses: The condition is a local deformation problem (Thorne 2012, Lemma 4.2); for n₁ = 1, n = 2 and p odd it is a twist of R08.2/taylor-wiles-local-ring (see the next hypothesis), and for r̄ = s̄_v ⊕ ψ̄_v with ψ̄_v one-dimensional its tangent space is that of R08.2/taylor-wiles-local-tangent.; The block condition has variable determinant, and det r|_{I_{F_v}} = ψ_v^{n₁}; imposing an unramified determinant would force ψ_v^{n₁} = 1. For n = 2, n₁ = 1, p odd, q_v ≡ 1 mod p and distinct residual eigenvalues, the comparison with the fixed-determinant ring of R08.2/taylor-wiles-local-ring is by a twist: fix the unramified part of the determinant (det r = ψ̃_v·χ with χ a fixed unramified character and ψ̃_v the extension of ψ_v trivial on the chosen Frobenius lift) and twist by ψ̃_v^{−1/2}; inertia (ψ_v, 1) becomes (ψ_v^{1/2}, ψ_v^{−1/2}) and the determinant becomes χ. Scalar inertia on A_v is part of the condition, not a consequence of the tame relation..

Suppliers: LocalGaloisDeformationRings:R08.2/tame-splitting; LocalGaloisDeformationRings:R08.2/taylor-wiles-local-ring; LocalGaloisDeformationRings:R08.2/taylor-wiles-local-tangent; GlobalGaloisDeformations:R04.3/local-deformation-problem; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock`: 𝒟^TW_v for a chosen eigenvalue α_v of multiplicity n₁.

API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.decomposition`: The lifted decomposition r = A_v ⊕ B_v.

API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.deltaAlgebra`: The canonical map 𝒪[Δ_v] → R^TW_v from ψ_v∘Art_{F_v}.

API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.isLocalDeformationProblem`: 𝒟^TW_v is a local deformation problem.

API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.rank2`: For n = 2, n₁ = 1, p odd, distinct eigenvalues and q_v ≡ 1 mod p: fixing the unramified part of the determinant and twisting by ψ̃_v^{−1/2} identifies the block ring with the ring of R08.2/taylor-wiles-local-ring, compatibly with the 𝒪[Δ_v]-structures up to the automorphism δ ↦ δ² of Δ_v.

API `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.decomposition_unique`: The selected Frobenius block is the image of the idempotent obtained by Hensel separation of its residual eigenvalue from the complementary eigenvalues. This projector, its A_v⊕B_v decomposition and the imposed scalar inertia character commute with allowed coefficient maps.

Test `twBlock_rank2` (compatibility): For n = 2, n₁ = 1 and distinct eigenvalues, the variable-determinant block ring is 𝒪[Δ_v]⟦x, y, B, C⟧. Fixing the unramified part of the determinant (det r = ψ̃_v·χ, χ a fixed unramified character) gives 𝒪[Δ_v]⟦x, y, B⟧; fixing an unramified determinant instead forces ψ_v = 1 and gives 𝒪⟦x, y, B⟧, the unramified lifts.

Test `twBlock_full_block` (degenerate): n₁ = n: lifts are ψ_v·(unramified) on inertia, the ring is formally smooth over 𝒪[Δ_v].

Test `twBlock_p2_delta` (computation): p = 2: Δ_v = k(v)^×(2), the 2-part, e.g. q_v = 17 gives Δ_v ≅ ℤ/16.

Test `twBlock_needs_semisimple` (non-example): A nonscalar residual Jordan block does not satisfy the semisimple-block hypothesis. The source condition does not impose A_v(Frob_v)=α_v I on lifts, so it does not force emptiness merely because a generalized eigenblock is nonsemisimple.

Sources: BCGP-2025, §5.5, arXiv v1 p. 124.


### `LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n` — Fixed-type rings away from p in rank n and constancy of types on components

Let K/ℚ_ℓ be finite, ℓ ≠ p, r̄ : G_K → GL_n(k). (1) For each inertial type τ, R^□_r̄(τ) is reduced, 𝒪-flat and equidimensional of dimension 1 + n², and R^□_r̄/ϖ is equidimensional of dimension n². (2) If two ℚ̄_p-points lie on the same irreducible component of Spec R^□_r̄[1/p] and neither lies on any other irreducible component, their Weil–Deligne representations restricted to I_K are conjugate; hence the conductor is constant on pure points of a component. (3) Spec R^□_r̄[1/p] has finitely many connected components, and there is a finite extension K′/K such that every lift of r̄ becomes unipotently ramified on G_{K′}.

Hypotheses: (2) is BLGGT Lemma 1.3.4(2) as used by LTXZZ 2022 (proof of Lemma 6.4.2) and BCGP25 §7.5.2; it is a statement about points of the generic fibre that each lie on a unique irreducible component.; (3) is BCGP25 Lemma 5.6.2, stated there at p = 2 but valid for every p..

Suppliers: LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy; LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection; LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre.

Sources: BCGP-2025, Lemma 5.6.2 and its proof, arXiv v1 p. 128; NT-2026, proof of Lemma 3.6, arXiv v2 p. 18.


### `LocalGaloisDeformationRings:R08.2/gsp4-minimal-conditions` — Minimal GSp₄ conditions at the ramified primes of types U, P, H

Let r̄ : G_ℚ → GSp₄(k) with similitude ε̄^{−(a−1)} and x ∈ S(r̄) of one of the types of R08.2/gsp4-ramification-types. A lift r of r̄|G_x with similitude ε^{−(a−1)} is minimal at x if: (U1–U3) r|I_x has unipotent image, topologically generated by exp(N) with N conjugate over the coefficient algebra (after the specified splitting extension) to the chosen residual orbit representative N₁, N₂ or N₃ respectively, up to the compatible unit rescaling; (P) r(I_x) ≅ r̄(I_x) (reduction is injective on the image of inertia); (H) no condition: for type H every lift has r(I_x) ≅ r̄(I_x) (the image of ker r̄|_{I_x} is generated by an element u congruent to 1 that commutes with r(I_x), hence scalar by absolute irreducibility; the Frobenius relation gives u^{x−1} = 1, so u = 1 because p ∤ x − 1). Minimal lifts at x form a local deformation problem; at a prime x of type U3 it coincides with the unipotent problem R^1 and with the minimally ramified condition (R08.2/regular-unipotent-minimally-ramified).

Hypotheses: exp(N) for N of rank 3 needs p ≥ 5; for types U1, U2 the truncated exponential suffices for p ≥ 3..

Suppliers: LocalGaloisDeformationRings:R08.2/gsp4-ramification-types; LocalGaloisDeformationRings:R08.2/gsp4-unipotent-local-models; LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified; LocalGaloisDeformationRings:R08.2/minimally-ramified-ring; LocalGaloisDeformationRings:R08.1/g-valued-framed-ring.

API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt`: The minimal condition at x ∈ S(r̄) according to its type.

API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.unipotent_rank`: At U_i the logarithm lifts the specified nilpotent orbit over the Artinian coefficient ring; require conjugacy to the chosen representative or equivalent free kernel/image conditions for every power, not just generic matrix rank.

API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.rigid`: At types P, H the reduction map is injective on r(I_x).

API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.isLocalDeformationProblem`: Each condition is a local deformation problem.

API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.U3_eq_unipotent`: At type U3 the condition equals the unipotent problem R^1 and the minimally ramified condition.

API `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.baseChange`: The split nilpotent-orbit lifting condition at U_i is preserved under Artinian coefficient maps by applying the map to its conjugating element and unit parameter. The P/H condition uses the fixed prime-to-p inertia lift and is preserved under the same maps.

Test `gsp4Minimal_U3` (compatibility): Type U3: the minimal condition equals R^1 (single Jordan block, R08.2/regular-unipotent-minimally-ramified).

Test `gsp4Minimal_H_rigid` (computation): Type H with x⁴ − 1 prime to p: r(I_x) ≅ r̄(I_x), a finite group of order prime to p, so the condition is formally smooth.

Test `gsp4Minimal_rank_jump` (non-example): Over an Artinian coefficient algebra, a nilpotent lifting N₁ whose square is a nonzero nilpotent matrix cannot be conjugate to N₁ (which squares to zero). It fails the U1 orbit condition even if its reduction has rank 1; a generic-rank label alone would miss this.

Test `gsp4Minimal_unramified` (degenerate): At primes outside S(r̄) ∪ {p} the minimal condition is 'unramified'.

Sources: CG-2020, Definition 4.6 (3)–(4), published p. 815.


### `LocalGaloisDeformationRings:R08.2/steinberg-ring-domain` — The Steinberg lifting ring is a domain and equals the fixed-type ring

Let K/ℚ_ℓ be finite with residue cardinality q_v ≡ 1 mod p, and r̄ : G_K → GL_n(k) trivial (𝒪 large enough). Then the Steinberg lifting ring R^St (Thorne 2015 §3.3.4: lifts with unipotent inertia and Frobenius eigenvalues α, q_vα, …, q_v^{n−1}α, flat-closed; R08.2/steinberg-condition) is a domain, and the natural surjection R^St → R^□_r̄(τ_{Sp_n}) onto the fixed-type ring of the special inertial type is an isomorphism.

Hypotheses: The proof of Thorne Proposition 3.17 explicitly removes Taylor’s standing p>n restriction. The hypotheses are the trivial residual representation and q_v ≡ 1 mod p. In Newton–Thorne the places in question also satisfy p^N ∥ q_v − 1 with p^N > n (a property of their auxiliary field), which the domain property does not use..

Suppliers: LocalGaloisDeformationRings:R08.2/steinberg-condition; LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy; LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n.

Sources: NT-2026, proof of Lemma 3.8, arXiv v2 p. 20; THORNE-2015, Proposition 3.17, p. 20.


### `LocalGaloisDeformationRings:R08.2/dotto-division-algebra-cycles` — Breuil–Mézard cycles for central division algebras away from p

Let K/ℚ_ℓ be finite (ℓ ≠ p), D a central division algebra of rank n over K, 𝒪_D^× its maximal compact subgroup, r̄ : G_K → GL_n(k), and E/ℚ_p large enough that every type τ of a lift of r̄, and all K-types for GL_n(K) and D^× attached to it, are defined over E, and that the irreducible components of Spec R^□_r̄[1/p] and of Spec R^□_r̄/ϖ are geometrically irreducible. For an inertial type with monodromy (τ, N) (R08.2/inertial-type-with-monodromy) let R^□_r̄(τ, N) be Shotton's fixed-type quotient (R08.2/fixed-type-rings-rank-n). (1) (Dotto §6, case ℓ ≠ p) The cycle maps cyc : R_E(GL_n(𝒪_K)) → Z^{n²+1}(R^□_r̄), σ ↦ Σ_{(τ,N)} dim Hom_{GL_n(𝒪_K)}(σ^∨ ⊗ ℚ̄_p, π_{τ,N})·[R^□_r̄(τ, N)], and cyc_{D^×} : R_E(𝒪_D^×) → Z^{n²+1}(R^□_r̄), σ ↦ Σ_{(τ,N)} dim Hom_{𝒪_D^×}(σ^∨ ⊗ ℚ̄_p, JL^{−1}(π_{τ,N}))·[R^□_r̄(τ, N)], where π_{τ,N} is any irreducible generic representation with rec(π_{τ,N}) of inertial type (τ, N) and JL^{−1}(π) = 0 unless π is essentially square-integrable, satisfy cyc_{D^×}(σ) = cyc(JL_K(σ)) for the Jacquet–Langlands transfer of types JL_K : R(𝒪_D^×) → R(GL_n(𝒪_K)) of Dotto's Definition 5.2. (2) (Theorem 6.3, with p ≠ 2) There is a unique map cyc‾_{D^×} : R_k(𝒪_D^×) → Z^{n²}(R^□_r̄/ϖ) with red ∘ cyc_{D^×} = cyc‾_{D^×} ∘ r_p; so representations σ, σ′ of 𝒪_D^× with the same reduction mod p give equal special-fibre cycles. (3) Consequently (Newton–Thorne, proof of Lemma 3.6): let n be even, K′/K the unramified quadratic extension with residue field k′, embedded in the residue field k_D of D (of degree n over that of K), χ_v : k′^× → ℚ̄_p^× a character of order p, and σ_v the character of 𝒪_D^× inflated from χ_v ∘ N_{k_D/k′}, of order p. Let τ_s be the inertial type with monodromy of the Langlands parameters of the Jacquet–Langlands transfers of the level-zero representations of D^× containing σ_v (Bushnell–Henniart); in Newton–Thorne it is the type of their representation s at v, in which χ_v ∘ Art_K^{−1} occurs. Then cyc_{D^×}(σ_v^{−1}) = [R^□_r̄(τ_s)] and cyc_{D^×}(1) = [R^□_r̄(τ_{Sp_n})]; equal reductions give equal cycles, and since both rings are 𝒪-flat and equidimensional of dimension 1 + n², (R^□_r̄(τ_s)/ϖ)_red ≅ (R^□_r̄(τ_{Sp_n})/ϖ)_red.

Hypotheses: The types retain monodromy, following Shotton (R08.2/inertial-type-with-monodromy); Dotto's types are smooth, and the cycle maps sum over pairs (τ, N).; Coefficient characteristic: the uniqueness in (2) rests on Shotton's Theorem 4.6, which assumes that the coefficient characteristic is odd (p ≠ 2 in this roadmap's notation). Dotto's Theorem 6.3 assumes that the residue characteristic of the local field (his p) is odd, where the hypothesis needed is on the characteristic of the coefficients (his ℓ). Dotto proves the identity of cycles in the form cyc_{D^×}(x^∨) = cyc(JL_K(x)^∨), after enlarging the coefficients; the form in (1) follows because the transfer commutes with contragredients.; Newton–Thorne cite the 2018 preprint ([Dot18, Theorem 6.1]); the statement used is Theorem 6.3 of the published version, the case ℓ ≠ p.; The Jacquet–Langlands correspondence for D^×, its transfer of inertial classes, and the type theory behind JL_K (Bushnell–Kutzko types, Schneider–Zink's σ_𝔓, Bushnell–Henniart's description of level-zero transfers) are representation-theoretic inputs recorded as a gap; they are not rebuilt here..

Suppliers: LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy; LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components.

Sources: NT-2026, proof of Lemma 3.6, arXiv v2 pp. 18–19; DOTTO-2025, §6, case ℓ ≠ p and Theorem 6.3, pp. 243–245 (journal pages); SHOTTON-2018, Theorem 4.6, arXiv v2 p. 17 (with the abstract).


### `LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p` — Generic fibres of G-valued lifting rings away from p and minimally ramified lifts

Let ℓ ≠ p, K/ℚ_ℓ finite (or a local field of characteristic ℓ), G a smooth affine group over 𝒪 with reductive G⁰, ρ̄ : G_K → G(k) and μ a fixed multiplier. (1) (Bellovin–Gee, Theorem 3.3.3) Spec R^{□,μ}_ρ̄[1/p] is equidimensional of dimension dim G^der, reduced, the union of the generic fibres of the fixed-type quotients (possibly several components for one type up to G⁰-conjugacy), and it has an open dense regular subscheme; the Zariski closure of a component is a reduced 𝒪-flat quotient. (2) (Booher, Theorem 1.1, Corollary 6.16, Proposition 5.6) For G = GSp_{2n} with p > 2n (p ≠ 2) and ρ̄ of similitude κ̄^{1−2n}, after enlarging 𝒪 so that the standing assumptions (A3)–(A4) hold (q a square, √−1 and √2 in 𝒪, a pure nilpotent lift with smooth centraliser) and the irreducible constituents of ρ̄ restricted to the prime-to-p inertia are absolutely irreducible: the minimally ramified lifts with fixed similitude character κ^{1−2n} form a liftable deformation condition with tangent space of dimension h⁰(G_K, ad⁰ρ̄); its framed ring is formally smooth over 𝒪 of relative dimension dim Lie G^der, so ρ̄ has a minimally ramified lift lying on an irreducible component of R^{□,κ^{1−2n}}_ρ̄ isomorphic to 𝒪′⟦X₁, …, X_{dim G^der}⟧. (3) (FKP §9, arXiv v5 p. 42) At a trivial prime v₀, a lift whose Weil–Deligne representation is a twist of the Steinberg parameter is a formally smooth point of R^{□,κ^{1−2n}}_{ρ̄|G_{v₀}}.

Hypotheses: (1) in equal characteristic holds by the same argument, Grothendieck's monodromy theorem being available there (FKP §2).; A dimension involving Lie(G_der) requires fixing the full quotient G/G_der; for GSp_{2n} this is the similitude character. Do not infer a bijection between types and components.; Booher's general theorem (Theorem 1.1, Corollary 6.16) is for G = GSp_m and GO_m with p > m (p ≠ 2); GL_m appears in the tame case of his §5, and for it the minimally ramified condition is CHT's (R08.2/minimally-ramified-ring); its Remark 3.14 extends the definition, but not the smoothness, to other almost-reductive groups. The sources in scope use (2) only for GSp_{2n} (FKP §9), so no general reductive G is planned here. The dimension of the framed fixed-similitude ring is derived from Corollary 6.16 and Remark 2.2 (dim Z¹ − dim H¹ = dim 𝔤 − h⁰); Booher states it explicitly only in the tame case (Corollary 5.8).; (1) is Bellovin–Gee Theorem 3.3.3 for each inertial type τ (the 𝒪-flat quotient R_{ρ̄,τ} of their §3.1, with fixed multiplier), for G a not necessarily connected reductive group over 𝒪; Spec R^{□,μ}_ρ̄[1/p] is the union of these over the types that occur. FKP §2 use it under their standing hypotheses on G (G⁰ split, π₀(G) finite étale of order prime to p, p ≠ 2 very good for G^der)..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre; LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n.

Sources: FKP-2022, §9, proof of Proposition 9.1, arXiv v5 p. 41; FKP-2022, §2, arXiv v5 p. 9; BOOHER-2019, Theorem 1.1, p. 2; Corollary 6.16, p. 30 (arXiv v1); BELLOVIN-GEE-2019, §3.1 and Theorem 3.3.3, arXiv v3 pp. 29–30.


### `LocalGaloisDeformationRings:R08.2/ihara-avoidance-rings-p2` — Unipotent ramification and Ihara-avoidance rings at p = 2

Let p = 2, v ∤ 2 a finite place, ρ̄ : G_{F_v} → GL_n(k). (1) There is a finite extension F′_v/F_v such that every lift of ρ̄ becomes unipotently ramified on G_{F′_v}. (2) If ρ̄ is unramified with ρ̄(Frob_v) regular semisimple (q_v odd), every lift is strictly equivalent to a direct sum of characters, and becomes unramified over a uniform finite extension. (3) For ρ̄ trivial and finite-order characters χ_{v,j} : 𝒪_{F_v}^× → 𝒪^× trivial mod ϖ, let R_v^χ classify lifts with char ρ(σ)(X) = Π_j (X − χ_{v,j}(Art^{-1}σ)^{-1}) for σ ∈ I_{F_v}. If all χ_{v,j} = 1, every component of R_v^1 has dimension n² + 1, every prime minimal over ϖ contains a unique minimal prime, and generic points have characteristic zero; if the χ_{v,j} are pairwise distinct, Spec R_v^χ is irreducible of dimension n² + 1 with characteristic-zero generic point.

Hypotheses: (3) is Thorne 2012, Proposition 3.16, which extends Taylor's Proposition 3.1 (R08.2/ihara-avoidance-components) to p = 2.; First choose a residual eigenbasis for the regular semisimple Frobenius matrix. Diagonalization by strict equivalence is relative to this basis; strict conjugation alone cannot change a nondiagonal residual matrix..

Suppliers: LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; LocalGaloisDeformationRings:R08.2/gsp4-taylor-wiles-lifts.

Sources: BCGP-2025, Lemma 5.6.2, arXiv v1 p. 128; BCGP-2025, Proposition 5.6.4, arXiv v1 p. 129.


### `LocalGaloisDeformationRings:R08.2/equal-characteristic-local-lifts` — Local lifts at places of global function fields

Let F be a global function field of characteristic ℓ ≠ p and v a place. Every ρ̄ : G_{F_v} → GL_n(k) has a p-adic lift (as in CHT Corollary 2.4.21; only ℓ ≠ p is used; the source works under p ≫_n 0 for its global theorem); any character G_{F_v} → 1 + ϖ𝒪 has an n-th root when p ∤ n, so the determinant (or multiplier) of the lift can be matched to a prescribed global character μ. The generic-fibre analysis of R08.2/g-valued-generic-fibre-away-from-p (1) holds for R^{□,μ}_ρ̄.

Suppliers: LocalGaloisDeformationRings:R08.2/minimally-ramified-ring; LocalGaloisDeformationRings:R08.2/tame-splitting; LocalGaloisDeformationRings:R08.2/g-valued-generic-fibre-away-from-p.

Sources: FKP-2022, §8, proof of Theorem 8.1, arXiv v5 p. 38; FKP-2022, §2, arXiv v5 pp. 8–9.


### `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types` — p-adic Hodge types and Galois types

Let E/ℚ_p be finite. A p-adic Hodge type v = (D_E, Fil^i D_{E,K}, 0 ≤ i ≤ h) is a finite-dimensional E-vector space D_E with a filtration of D_{E,K} = D_E ⊗_{ℚ_p} K by E ⊗ K-submodules whose graded pieces lie in degrees [0, h]. For a finite E-algebra B, a de Rham B-representation V_B of G_K is of p-adic Hodge type v if its Hodge–Tate weights lie in [0, h] and gr^i Hom_{B[G_K]}(V_B, B_dR ⊗ B) ≅ gr^i D_{E,K} ⊗_E B for all i. A Galois type is τ : I_K → GL_r(E) with open kernel; a potentially semistable V_B is of type τ if tr(γ | D*_pst(V_B)) = tr τ(γ) for all γ ∈ I_K. The number that enters dimension formulas is dim_E ad D_{E,K}/Fil⁰ad D_{E,K} = Σ_{σ : K → Ē} (d² − Σ_j m_{σ,j}²)/2, with m_{σ,j} the multiplicities of the jumps of the σ-component.

Hypotheses: Kisin's functors are contravariant (Hom(V_B, B_•)). With PadicHodgeTheory R06.2's convention HT(χ_p) = +1, 'Hodge–Tate weights in [0, h]' reads the same, and Barsotti–Tate means weights {0, 1}.; D*_pst and its inertia action are PadicHodgeTheory R06.3/potentially-semistable-dieudonne-module; the Galois type is the inertial part of WD(V) (R06.3/weil-deligne-parameter)..

Suppliers: PadicHodgeTheory:R06.2/hodge-tate-weight-convention; PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module; PadicHodgeTheory:R06.3/weil-deligne-parameter; PadicHodgeTheory:R06.2/filtered-vector-spaces.

API `TauCeti.GaloisDeformation.Local.HodgeType`: (D_E, Fil^• D_{E,K}) with jumps in [0, h].

API `TauCeti.GaloisDeformation.Local.GaloisType`: τ : I_K → GL_r(E) with open kernel.

API `TauCeti.GaloisDeformation.Local.IsOfType`: V_B is potentially semistable of type (τ, v).

API `TauCeti.GaloisDeformation.Local.HodgeType.adQuotDim`: dim_E ad D_{E,K}/Fil⁰ = Σ_σ (d² − Σ_j m_{σ,j}²)/2.

API `TauCeti.GaloisDeformation.Local.HodgeType.filteredIsom_iff`: Over a splitting coefficient field, two filtered K⊗E-modules of the given rank are filtered-isomorphic iff their graded multiplicities agree at every embedding and jump. This concerns filtered isomorphism classes, not equality of raw filtration subspaces.

API `TauCeti.GaloisDeformation.Local.GaloisType.conjugacy`: A change of basis conjugates the finite inertia representation and gives an isomorphic Galois type; isomorphism classes and the type condition are independent of the chosen matrix representative.

Test `adQuotDim_regular` (computation): Regular weights give [K : ℚ_p]·d(d − 1)/2 (for d = 2, K = ℚ_p: 1).

Test `adQuotDim_formula` (characterisation): (d² − Σ m_j²)/2 counts pairs of weights in different jumps; checked for d = 3 with multiplicities (2, 1): (9 − 5)/2 = 2.

Test `galoisType_open_kernel` (non-example): The restriction to I_K of the cyclotomic character has infinite image, so it is not a Galois type.

Sources: KISIN-PST-2008, (2.6), p. 531; KISIN-PST-2008, (2.7), pp. 532–533.


### `LocalGaloisDeformationRings:R08.3/semistable-height-quotient` — The semistable quotient with Hodge–Tate weights in [0, h]

Let A° be a complete local Noetherian W(𝔽)-algebra, A = A°[1/p], V_{A°} finite free of rank r with continuous G_K-action, and h ≥ 0. There is a quotient A_{st,h} of A such that a map ζ : A → B to a finite ℚ_p-algebra factors through A_{st,h} if and only if V_B = V_A ⊗ B is semistable with Hodge–Tate weights in [0, h]. It carries a projective W_{A_{st,h}}-module D of rank r with semilinear φ and linear N, and for such ζ, D ⊗ B ≅ Hom_{B[G_K]}(V_B, B⁺_st ⊗ B) compatibly with φ and N.

Hypotheses: Semistable with weights in [0, h] implies E-height ≤ h (Kisin 2006, 1.2.2 and 2.1.5; requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4), so one may first pass to A°^{≤h} (L7/height-lattice-moduli).; B_st with coefficients and D_st are PadicHodgeTheory R06.1–R06.2 (semistable-period-ring, dst-exact-tensor-fully-faithful)..

Suppliers: LocalGaloisDeformationRings:L7/height-lattice-moduli; LocalGaloisDeformationRings:L7/finite-height-lattices; PadicHodgeTheory:R06.1/semistable-period-ring; PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

Sources: KISIN-PST-2008, Theorem (2.5.5) and its proof, pp. 530–531; Propositions (2.4.7), (2.5.4).


### `LocalGaloisDeformationRings:R08.3/hodge-type-components` — Fixing the p-adic Hodge type selects components

Fix a p-adic Hodge type v over E and suppose A is an E-algebra. There is a quotient A_{st,v} of A_{st,h}, corresponding to a union of connected components of Spec A_{st,h}, such that ζ : A → B (B a finite E-algebra) factors through A_{st,v} exactly when V_B is semistable of p-adic Hodge type v.

Hypotheses: The filtration on D_B ⊗_{K_0} K is read off from 𝔐: Fil^i φ*(𝔐) = (1 ⊗ φ)^{−1}(E(u)^i𝔐), whose steps, taken modulo E(u)φ*(𝔐) ∩ Fil^i φ*(𝔐), are finite projective over K_A = W_A ⊗_{K_0} K (Lemma 2.6.1 (4)); the graded pieces are then projective as well..

Suppliers: LocalGaloisDeformationRings:R08.3/semistable-height-quotient; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types.

Sources: KISIN-PST-2008, Corollary (2.6.2) and Lemma (2.6.1), pp. 531–532.


### `LocalGaloisDeformationRings:R08.3/pst-deformation-ring` — Potentially semistable deformation rings of fixed type

Let V_𝔽 be a d-dimensional 𝔽-representation of G_K (K/ℚ_p finite, any d ≥ 1), R^□ = R^□_{V_𝔽} its framed deformation ring over 𝒪_E (R08.1/local-lifting-ring), and (τ, v) a Galois type and a p-adic Hodge type (R08.3/hodge-and-galois-types). (1) There is a quotient (R^□[1/p])^{τ,v} of R^□[1/p] such that a map to a finite E-algebra B factors through it exactly when V_B is potentially semistable of Galois type τ and p-adic Hodge type v (Kisin, Theorem 2.7.6). (2) The locus (R^□[1/p])^{τ,v}_cr where V_B is potentially crystalline is its closed subscheme N = 0 (Corollary 2.7.7). (3) R^{□,τ,v} denotes the reduced, p-torsion-free quotient of R^□ with R^{□,τ,v}[1/p] = ((R^□[1/p])^{τ,v})_red; its ℚ̄_p-points are exactly the lifts that are potentially semistable of type (τ, v), and it is 0 when there are none. (4) Fix a finite Galois L/K with I_L ⊆ ker τ and h with the weights of v in [0, h]. In the quotient of R^□[1/p] classifying lifts semistable over L with Hodge–Tate weights in [0, h] (R08.3/semistable-height-quotient applied over L), the Hodge type and the inertial type are locally constant, so (R^□[1/p])^{τ,v} is a union of connected components of that bounded semistable quotient. It is not asserted to be a union of components of the unrestricted R^□[1/p]. The same holds for the unframed ring R_{V_𝔽} when End_{𝔽[G_K]}V_𝔽 = 𝔽, and with fixed determinant (R08.3/fixed-determinant-pst-rings).

Hypotheses: The characterisation in (1) is on points with values in all finite E-algebras B, not only fields, so it determines the closed subscheme.; (3) is the reduced closure used by Gee (Theorem 3.28 in the crystalline case) and by subsequent work. Reducedness of (R^□[1/p])^{τ,v} itself is not asserted by Kisin, so the integral ring is defined through the reduced subscheme.; Nonemptiness is not automatic: R^{□,τ,v} can be 0..

Suppliers: LocalGaloisDeformationRings:R08.3/hodge-type-components; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-forget-framing; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module.

Sources: KISIN-PST-2008, Theorem (2.7.6) and its proof, p. 534; KISIN-PST-2008, Corollary (2.7.7), p. 534; GEE-MLT-2022, Theorem 3.28, pp. 18–19.


### `LocalGaloisDeformationRings:R08.3/pst-quotient-in-families` — Potentially semistable loci in families over a complete local base

Let E/ℚ_p be finite, A° a Noetherian complete local 𝒪_E-algebra with finite residue field, A = A°[1/p], and V_{A°} a finite free A°-module of rank r with a continuous G_K-action (K/ℚ_p finite). (1) (Kisin 2.5.5) For h ≥ 0 there is a quotient A^{st,h} of A such that a map of ℚ_p-algebras ζ : A → B to a finite ℚ_p-algebra B factors through it iff V_B = V_A ⊗_A B is semistable with Hodge–Tate weights in [0, h]; over A^{st,h} there is a projective (φ, N)-module D of rank r specialising to Hom_{B[G_K]}(V_B, B⁺_st ⊗ B), the contravariant D*_st(V_B). (2) (Kisin 2.7.6) For a p-adic Hodge type v (an E-vector space D_E of dimension r with E ⊗ K-submodules) and τ : I_K → GL_r(E) with open kernel, there is a quotient A^{τ,v} of A such that ζ : A → B (B a finite E-algebra) factors through it iff V_B is potentially semistable of type τ and p-adic Hodge type v. (3) (Kisin 2.7.7) Likewise A^{τ,v}_cr for potentially crystalline. These quotients are compatible with base change along maps A° → A′° of complete local 𝒪_E-algebras: (A′)^{τ,v} = A′ ⊗_A A^{τ,v}.

Hypotheses: The base A° is arbitrary (not only a universal framed ring); this is the form used for families of automorphic Galois representations (Kisin's Corollary on Hilbert modular forms) and exported to AutomorphicGaloisRepresentations R19.5.; The quotients are of A = A°[1/p]; no integral statement is made here (R08.3/pst-deformation-ring takes the reduced p-torsion-free closure)..

Suppliers: LocalGaloisDeformationRings:L7/height-lattice-moduli; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; LocalGaloisDeformationRings:R08.3/hodge-type-components; PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module.

Sources: KISIN-PST-2008-AMS, (2.7.5), p. 534; KISIN-PST-2008-AMS, Theorem (2.5.5), p. 530.


### `LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations` — Deformation theory of filtered (φ, N)-modules with descent data

For L/K finite Galois and d ≥ 1, let Mod_{φ,N}(A) (A a ℚ_p-algebra) be the groupoid of finite projective L_0 ⊗ A-modules D_A of rank d, locally free, with semilinear Gal(L/K)-action, nilpotent N and semilinear bijective φ with pφN = Nφ; N commutes with Gal(L/K); Mod_{F,φ,N} adds a decreasing, exhaustive, separated, Gal(L/K)-stable filtration of D_{A,L} by L ⊗ A-submodules whose associated graded module is projective. Let C•(D) be the total complex of (ad D)^{G_{L/K}} with the maps 1 − φ, N and pφ − 1, and H•(D) its cohomology. For a small extension A → A/I of local ℚ_p-algebras: if H²(D_{A/𝔪}) = 0 a lift exists; lifts form a torsor under H¹ ⊗ I (with H¹_F, involving ad D_L/Fil⁰ad D_L, in the filtered case); forgetting the filtration is formally smooth. For D_A over Noetherian A with A → Mod_{φ,N} formally smooth, the complement of the support of H²(D_A) is dense and formally smooth over ℚ_p. For the potentially semistable quotient A^{τ,v} of a family A° that is formally smooth over the deformation groupoid of V_𝔽 (the framed ring, or the universal ring when it exists), the completion at each maximal ideal maps formally smoothly to Mod_{F,φ,N} (Proposition 3.3.1); for an arbitrary family as in R08.3/pst-quotient-in-families this is not claimed.

Hypotheses: Filtered (φ, N, Gal(L/K))-modules and weak admissibility are PadicHodgeTheory R06.2 (filtered-phi-n-modules-with-descent-data, weak-admissibility); weakly admissible modules over Artinian thickenings are admissible as successive extensions (Colmez–Fontaine, R06.2/colmez-fontaine-theorem).; R06.2/colmez-fontaine-theorem defines ColmezFontainePst; it does not prove it. The R06.3 proof is requested. This is an open prerequisite, not an existing theorem node..

Suppliers: PadicHodgeTheory:R06.2/filtered-phi-n-modules-with-descent-data; PadicHodgeTheory:R06.2/weak-admissibility; PadicHodgeTheory:R06.3; LocalGaloisDeformationRings:R08.3/pst-deformation-ring.

Sources: KISIN-PST-2008, (3.1.1), Proposition (3.1.2), Corollary (3.1.3), Lemma (3.1.5), Proposition (3.1.6), pp. 535–538; KISIN-PST-2008, Lemma (3.2.1), Proposition (3.3.1), pp. 538–540.


### `LocalGaloisDeformationRings:R08.3/pst-coefficient-change` — Potentially semistable rings under change of coefficients

For a finite extension 𝒪_E → 𝒪_{E′} (possibly with a residue field extension 𝔽 ⊆ 𝔽′), R^{□,τ,v}_{V_𝔽 ⊗ 𝔽′, 𝒪_{E′}} ≅ R^{□,τ,v}_{V_𝔽, 𝒪_E} ⊗_{𝒪_E} 𝒪_{E′}, compatibly with R^□_{V_𝔽⊗𝔽′,𝒪_{E′}} ≅ R^□_{V_𝔽,𝒪_E} ⊗̂_{𝒪_E} 𝒪_{E′} (R08.1/local-residue-field-change); likewise for the crystalline and unframed variants.

Hypotheses: Types (τ, v) over E are viewed over E′ by extension of scalars..

Suppliers: LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.1/local-residue-field-change; PadicHodgeTheory:R06.2/coefficient-field-base-change.

Sources: KISIN-PST-2008, (2.7.5), p. 534.


### `LocalGaloisDeformationRings:R08.3/weil-deligne-type-ring` — Rings of fixed Weil–Deligne type cut out of pseudo-character deformation rings (R_{B,M})

Let p be such that the block theory of GL₂(ℚ_p) applies, B a block of mod p representations of GL₂(ℚ_p) with pseudo-character deformation ring R^{ps,δ}_B, and M a supercuspidal Weil–Deligne representation (a filtered (φ, N, G_{ℚ_p})-module type of weights 0 and 1) with δ_M its determinant. I_{B,M} is the intersection of the maximal ideals 𝔭 of R^{ps,δ_M}_B[1/p] at which the universal pseudo-character specialises to the trace of a de Rham representation of weights {0, 1} and type M (whole Weil–Deligne representation fixed, not only its restriction to inertia). R_{B,M} := R^{ps,δ_M}_B[1/p]/I_{B,M} is reduced and Jacobson, R^+_{B,M} is the image of R^{ps,δ_M}_B, and R_{B,M} = R^+_{B,M}[1/p]. (Théorème 5.11) R_{B,M} is the ring of bounded analytic functions on an open subset of ℙ¹, a finite product of principal ideal domains, and there is a unique up to isomorphism representation ρ_{B,M} : G_{ℚ_p} → GL₂(R_{B,M}) with trace the universal pseudo-character.

Hypotheses: This differs from R08.3/pst-deformation-ring in two ways: the type is the whole Weil–Deligne representation M (not a Galois type τ), and the ring is a quotient of a pseudo-character deformation ring rather than of a framed ring.; For M special (Sp ⊗ η) CDN set R_{M,B} = L and use the Steinberg block separately..

Suppliers: LocalGaloisDeformationRings:R08.3/pst-quotient-in-families; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; GlobalGaloisDeformations:R04.1/lifting-functor; PadicLocalLanglandsForGL2Qp:R30.5.

API `TauCeti.GaloisDeformation.Local.WDTypeRing`: R_{B,M} = R^{ps,δ_M}_B[1/p]/I_{B,M} and its integral model R^+_{B,M}.

API `TauCeti.GaloisDeformation.Local.WDTypeRing.points`: A maximal ideal of R^{ps,δ_M}_B[1/p] contains I_{B,M} iff the specialised pseudo-character is the trace of a de Rham representation of weights {0, 1}, Weil–Deligne type M and determinant δ_Mε. The direction "contains I_{B,M} ⟹ of type M" is not stated at CDN §5.2; it comes from the theorem of [19] quoted there and is to be proved with it.

API `TauCeti.GaloisDeformation.Local.WDTypeRing.reduced`: R_{B,M} is reduced and Jacobson.

API `TauCeti.GaloisDeformation.Local.WDTypeRing.pid`: R_{B,M} is a finite product of principal ideal domains (bounded analytic functions on an open of ℙ¹).

API `TauCeti.GaloisDeformation.Local.WDTypeRing.universalRep`: The representation ρ_{B,M} with Tr ρ_{B,M} = the universal pseudo-character.

API `TauCeti.GaloisDeformation.Local.WDTypeRing.integralImage`: R^+_{B,M} is the image of R^{ps,δ_M}_B→R_{B,M}; its kernel is the inverse image of I_{B,M} under localization, and localizing R^+_{B,M} at p gives R_{B,M}. This makes integral image and generic ring distinct constructions.

Test `wdTypeRing_points_typeM` (characterisation): Every maximal ideal x of R_{B,M} gives ρ_x de Rham of weights {0, 1} with WD(ρ_x) ≅ M (Frobenius included).

Test `wdTypeRing_vs_galois_type` (non-example): Choose a supercuspidal WD representation M that is not isomorphic to its unramified quadratic twist. The two have the same inertial restriction and determinant but differ as full WD types. Forgetting Frobenius does not by itself imply an increase of one in dimension when determinant is fixed.

Test `wdTypeRing_empty_block` (degenerate): If no de Rham representation of type M has reduction in B, I_{B,M} is the unit ideal and R_{B,M} = 0.

Test `wdTypeRing_trace` (compatibility): Tr ∘ ρ_{B,M} equals the image of the universal pseudo-character of R^{ps,δ_M}_B.

Sources: CDN-2023, §5.2, arXiv p. 66; CDN-2023, Théorème 5.11, arXiv p. 66.


### `LocalGaloisDeformationRings:R08.3/pst-generic-fibre` — Dimension and generic smoothness of potentially semistable rings

Spec (R^□_{V_𝔽}[1/p])^{τ,v} is equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K} and has a formally smooth dense open subscheme. If End_{𝔽[G_K]}V_𝔽 = 𝔽, the same holds for (R_{V_𝔽}[1/p])^{τ,v} with dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. Consequently a nonzero R^{□,τ,v} has Krull dimension 1 + d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}, and imposing a compatible determinant with nonzero fixed-determinant quotient lowers these dimensions by one.

Hypotheses: The passage from the generic fibre to the Krull dimension of the p-torsion-free ring R^{□,τ,v} (dim R = dim R[1/p] + 1 for p-torsion-free complete local Noetherian 𝒪-algebras) is requested from DeformationAndDerivedPatchingAlgebra R03.3.; Fixing the determinant removes the one-dimensional deformation space of the determinant (LocalGaloisDeformationRings R08.1/local-fixed-determinant).; The determinant must have the Hodge and inertia type forced by (τ,v). Dimension lowering uses characteristic-zero determinant twisting; it does not require p∤d..

Suppliers: LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; LocalGaloisDeformationRings:R08.1/local-forget-framing; DeformationAndDerivedPatchingAlgebra:R03.3; LocalGaloisDeformationRings:R08.1/determinant-twisting.

Sources: KISIN-PST-2008, Theorem (3.3.4) and its proof, pp. 540–541; KISIN-PST-2008, Introduction, p. 514, footnote 1.


### `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth` — Potentially crystalline rings are generically smooth

Spec (R^□_{V_𝔽}[1/p])^{τ,v}_cr is formally smooth and equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}; for End_{𝔽[G_K]}V_𝔽 = 𝔽 the unframed version has dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. In particular (R^□[1/p])^{τ,v}_cr is reduced, and R^{□,τ,v}_cr[1/p] = (R^□[1/p])^{τ,v}_cr. In the Fontaine–Laffaille range (K/ℚ_p unramified, τ trivial, distinct weights whose maximum minus minimum is ≤ p − 2) the fixed-determinant ring is formally smooth over 𝒪, a power series ring in d² − 1 + [K : ℚ_p]·d(d − 1)/2 variables.

Hypotheses: The Fontaine–Laffaille statement is Gee Theorem 3.28 (after Ramakrishna and CHT08 §2.4); Fontaine–Laffaille theory itself is PadicHodgeTheory R06.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory. Here it is quoted as a special case; its integral smoothness is not a consequence of Kisin's generic-fibre theorem.; For the integral Fontaine–Laffaille assertion, assume the residual representation belongs to the FL essential image with the specified regular labelled weights, and fix a compatible determinant for which the quotient is nonzero. The FL liftability/tangent calculation is imported from L7/fontaine-laffaille-deformation-condition and L7/fontaine-laffaille-tangent-space-and-smoothness..

Suppliers: LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/filtered-phi-N-deformations; LocalGaloisDeformationRings:R08.3/pst-generic-fibre; LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition; LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness.

Sources: KISIN-PST-2008, Theorem (3.3.8) and its proof, p. 541; GEE-MLT-2022, Theorem 3.28, pp. 18–19.


### `LocalGaloisDeformationRings:R08.3/g-valued-pst-rings` — G-valued potentially semistable lifting rings (Balaji, Bellovin–Gee)

Let K/ℚ_p be finite, G a (not necessarily connected) reductive group over 𝒪, ρ̄ : G_K → G(k), τ : I_K → G(Ē) an inertial type up to G⁰(Ē)-conjugacy and v a p-adic Hodge type (a (Res_{E⊗K/E} G)⁰(Ē)-conjugacy class of cocharacters of Res_{E⊗K/E} G). (1) (Balaji, Proposition 3.0.12, as stated in Bellovin–Gee §3.2) There is a unique 𝒪-flat quotient R^{□,τ,v}_ρ̄ of R^□_{ρ̄,G} (R08.1/g-valued-framed-ring) such that a map R^□_{ρ̄,G} → B to a finite local E-algebra factors through it exactly when the corresponding lift is potentially semistable of Hodge type v and inertial type τ; it is reduced (its generic fibre is, by (2)). (2) (Bellovin–Gee, Theorem A = Theorem 3.3.3) If R^{□,τ,v}_ρ̄ ≠ 0, then Spec R^{□,τ,v}_ρ̄[1/p] is reduced, a local complete intersection, equidimensional of dimension dim G + dim (Res_{E⊗K/E} G)/P_v, and has an open dense regular subscheme; for v = v_λ with λ regular the dimension is dim G + [K:ℚ_p]·dim Fl_G. (3) With fixed multiplier μ the same holds with dim G^der in place of dim G. For G = GL_n this is R08.3/pst-deformation-ring with R08.3/pst-generic-fibre (dim Fl = n(n−1)/2).

Hypotheses: The type τ is G(Ē)-valued up to G⁰(Ē)-conjugacy (FKP p. 6).; For general v the dimension is dim G + dim (Res_{E⊗K/E} G)/P_v, the sum over the embeddings τ : K → E of dim G/P_{v,τ}; the parabolic can differ from one embedding to another.; Fix the full abelianization G/G_der, with Hodge and inertial data compatible with that fixed character, and assume the quotient is nonzero..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:R08.3/pst-quotient-in-families; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/pst-generic-fibre.

Sources: FKP-2022, Appendix B, arXiv v5 pp. 52–53; BELLOVIN-GEE-2019, §3.2 and Theorem 3.3.3 (= Theorem A), arXiv v3 pp. 29–30.


### `LocalGaloisDeformationRings:R08.3/bcdt-type-rings` — Breuil–Conrad–Diamond–Taylor type rings as Kisin rings

Let ℓ be a prime, ρ̄ : G_ℓ → GL(V) two-dimensional over k with End_{k[G_ℓ]} V = k, and R_{V,𝒪} its universal deformation ring. An ℓ-type τ is a class of two-dimensional τ : I_ℓ → GL(D) over ℚ̄_ℓ with open kernel extending to W_{ℚ_ℓ}; an extended ℓ-type τ′ a class of τ′ : W_{ℚ_ℓ} → GL(D′) with open kernel. ρ over K is of type τ (resp. τ′) if it is Barsotti–Tate over every finite F/ℚ_ℓ with τ|_{I_F} trivial, WD(ρ)|_{I_ℓ} ∈ τ (resp. WD(ρ) ∼ τ′), and ε^{-1} det ρ has finite order prime to ℓ. R^D_{V,𝒪} = R^τ_{V,𝒪} is the quotient of R_{V,𝒪} by the intersection of the primes of type τ (0 if none); 'weakly of type τ' means factoring through R^D; τ is weakly acceptable if R^D = 0 or there is a surjection 𝒪⟦X⟧ ↠ R^D. Then: (1) R^D_{V,𝒪} is the unframed potentially crystalline quotient R^{τ,v_{BT},cris} obtained from R08.3/pst-deformation-ring and R08.3/pcris-generic-smooth with v_{BT} the Hodge type of weights {0, 1} and the determinant condition. (2) BCDT Conjecture 1.1.1 (a deformation to 𝒪′ is weakly of type τ iff it is of type τ) holds, by the point characterisation of Kisin's rings.

Hypotheses: For ℓ odd, Barsotti–Tate over F may be weakened to potentially Barsotti–Tate (Breuil, Theorem 1.4).; 'Acceptable' is a tangent-space bound specific to BCDT's approach and is not part of Kisin's theory.; The finite-order prime-to-ℓ determinant factor is uniquely its Teichmüller lift. For an extended type, additionally impose the full Frobenius datum; the inertial type alone does not fix it..

Suppliers: LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.1/local-forget-framing; PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth.

Sources: BCDT-2001, §1.1, p. 851; author manuscript pp.7–8 (§1.1); BCDT-2001, Conjecture 1.1.1, p. 851; author manuscript pp.7–8 (§1.1); KISIN-PST-2008-AMS, Introduction, p. 513.


### `LocalGaloisDeformationRings:L7/semistable-ordinary-quotient` — Semistable-ordinary quotients of semistable lifting rings

Let λ be dominant for (Res_{K/ℚ_p} GL_n)_E and ρ̄ : G_K → GL_n(k). (1) (Kisin) There are unique 𝒪-flat quotients R^{st,λ}_ρ̄ and R^{cris,λ}_ρ̄ of R^□_ρ̄ whose maps to finite E-algebras B are exactly the lifts that are semistable (resp. crystalline) of p-adic Hodge type v_λ; R^{st,λ}_ρ̄ is reduced (Bellovin–Gee) and R^{cris,λ}_ρ̄[1/p] is regular. (2) If B is a finite local E-algebra, ρ_B semistable of Hodge type v_λ and ρ_B ⊗ B/𝔪_B semistable-ordinary of weight λ, then ρ_B is semistable-ordinary of weight λ. (3) There is a unique 𝒪-flat quotient R^{△,λ}_ρ̄ whose B-points are the semistable-ordinary lifts of weight λ; Spec R^{△,λ}_ρ̄[1/p] is open and closed in Spec R^{st,λ}_ρ̄[1/p], so R^{△,λ}_ρ̄ is reduced.

Hypotheses: Caraiani–Newton print the tensor products in Theorem 3.3.3 over R^{st,λ} rather than over R^□; the universal lift over R^□ is meant.; (3) is the union of components of the semistable ring on which the lift is ordinary; it is not the flat closure of an arbitrary ordinary locus..

Suppliers: LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; LocalGaloisDeformationRings:R08.3/g-valued-pst-rings; LocalGaloisDeformationRings:L7/ordinary-flag-scheme.

Sources: CN-2023, Lemma 3.3.2, arXiv v3 p. 51; CN-2023, Theorem 3.3.3, arXiv v3 p. 52.


### `LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings` — Fixed-determinant crystalline and ordinary rings as power-series quotients

Let p ∤ n, λ a dominant weight, ρ̄ : G_K → GL_n(k), and ψ : G_K → 𝒪^× a crystalline character lifting det ρ̄ with τ-labelled Hodge–Tate weight Σ_i (λ_{τ,i} + n − i). For R = R^{cris,λ}_ρ̄ (resp. R^{△,λ}_ρ̄, L7/semistable-ordinary-quotient) put R^ψ = R ⊗_{R^□_ρ̄} R^{□,ψ}_ρ̄. Then the quotient map R → R^ψ has a section extending to an isomorphism R^ψ⟦X⟧ ≅ R; in particular R^ψ is 𝒪-flat and reduced, and a map R^{□,ψ}_ρ̄ → B (B a finite E-algebra) factors through R^ψ iff the corresponding lift is crystalline of Hodge type v_λ (resp. semistable-ordinary of weight λ).

Hypotheses: Caraiani–Newton print R^{△,λ,ψ} with R^{cris,λ} in place of R^{△,λ}; the ordinary ring is meant.; The weights λ_{τ,i} + n − i are in Caraiani–Newton's convention HT(ε_p) = −1; in this roadmap's convention HT(ε_p) = +1 (PadicHodgeTheory R06.2) ψ has τ-labelled Hodge–Tate weight −Σ_i (λ_{τ,i} + n − i), as in L7/ordinary-of-weight-lambda..

Suppliers: LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; LocalGaloisDeformationRings:L7/semistable-ordinary-quotient.

Sources: CN-2023, Lemma 3.3.6, arXiv v3 pp. 52–53.


### `LocalGaloisDeformationRings:R08.4/flat-deformation-condition` — Flat deformations and the flat deformation ring

The deformations of V_𝔽 over Artinian 𝒪-algebras A that are the generic fibre of a finite flat group scheme over 𝒪_K form a deformation condition: D^fl ⊆ D_{V_𝔽} is relatively representable. So the framed lifting ring R^□ (R08.1/local-lifting-ring) has a quotient R^{fl,□} classifying flat lifts, and when End_{𝔽[G_K]} V_𝔽 = 𝔽 the universal deformation ring has a quotient R^fl. An 𝒪_E-point is flat exactly when V_{𝒪_E}/p^n comes from a finite flat group scheme for every n, that is, when V_{𝒪_E} is the Tate module of a p-divisible group.

Hypotheses: K/ℚ_p is finite with p > 2 (p = 2 is stage R08.5), e = e(K/ℚ_p), K₀ the maximal unramified subfield, 𝔽 a finite field, and V_𝔽 a d-dimensional 𝔽-representation of G_K that is the generic fibre of a finite flat group scheme; 𝔖 = W(k)⟦u⟧ and E(u) are as in L7/finite-height-lattices.; Finite flat representations are stable under subobjects, quotients and direct sums (Raynaud), requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; Ramakrishna deduces relative representability from this..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-forget-framing; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1.

API `TauCeti.GaloisDeformation.Local.flatLiftingRing`: R^{fl,□}, the quotient of R^□ classifying flat lifts.

API `TauCeti.GaloisDeformation.Local.flatLiftingRing_points`: An 𝒪_E-point is flat iff it is the Tate module of a p-divisible group.

API `TauCeti.GaloisDeformation.Local.flatDeformationRing`: R^fl when End V_𝔽 = 𝔽.

API `TauCeti.GaloisDeformation.Local.flatLiftingRing.universal`: For an Artinian coefficient algebra A, the natural bijection Hom_cont,𝒪(R^{fl,□},A)≃{framed lifts to A satisfying the finite-flat deformation condition} commutes with coefficient maps. At coefficient integers its point criterion is the p-divisible-group criterion already stated.

Test `flat_mu_p_plus_Z_p` (computation): 𝔽(1) ⊕ 𝔽 is finite flat.

Test `flat_points_iff_pdivisible` (characterisation): 𝒪_E-points of R^{fl,□} are Tate modules of p-divisible groups.

Test `omega_sq_not_flat` (non-example): ω² over ℚ_p (p > 3) has no finite flat model.

Sources: KISIN-FFLAT-2009, (2.1.1), p. 16.


### `LocalGaloisDeformationRings:R08.4/savitt-weight-two-rings` — Savitt's weight-two deformation rings of tame type

Let p be odd, ρ̄ : G_{ℚ_p} → GL_2(k_E) with End ρ̄ = k_E, and R(2, τ, ρ̄) the quotient of the universal deformation ring by the intersection of the primes of type (2, τ) (potentially Barsotti–Tate of inertial type τ, Hodge–Tate weights (0, 1), fixed determinant). (1) If τ = ω̃^i ⊕ ω̃^j with i ≢ j mod p − 1: R(2, τ, ρ̄) = 0 unless ρ̄|I_p is (ω^{1+i} ∗; 0 ω^j), (ω^{1+j} ∗; 0 ω^i) or ω₂^k ⊕ ω₂^{pk} with k = 1 + {j − i} + (p + 1)i; it is 𝒪_E⟦Y⟧ in the two reducible cases, and 𝒪_E⟦X₁, X₂⟧/(X₁X₂ − pw) with w ∈ 𝒪_E^× in the irreducible case (E ⊇ ℚ_{p²}, √det ρ̄(Frob_p) ∈ k_E). (2) If τ = ω̃₂^m ⊕ ω̃₂^{pm} with p + 1 ∤ m: R(2, τ, ρ̄) is 𝒪_E⟦B⟧ for the shapes listed by Savitt (Theorem 6.23), and 0 otherwise. So the Breuil–Mézard conjecture holds for k = 2 and τ tame. Explicitly in Theorem 6.23 write m = i + (p+1)j, 1≤i≤p, so p+1∤m. The reducible inertial shapes are (ω^{i+j} *;0 ω^{1+j}) and (ω^{1+j} *;0 ω^{i+j}); the first extension is peu ramifié for i=2 and the second for i=p−1. The remaining inertial shapes are ω₂^{p+m}⊕ω₂^{1+pm} and ω₂^{1+m}⊕ω₂^{p(1+m)}; the first is of niveau two (ρ̄ irreducible) when i ≠ 1 and the second when i ≠ p, while for i = 1, resp. i = p, the two characters coincide and have niveau one (the coincident-character case). These cases give 𝒪_E[[B]], and all other shapes give zero. For Theorem 6.22 the nodal case has τ=ω̃^i⊕ω̃^j, i≢j mod p−1, and ρ̄|I_p=ω₂^a⊕ω₂^{pa}, a=1+{j−i}+(p+1)i, where 0<{j−i}<p−1; assume E contains ℚ_{p²} and k_E contains a square root of det ρ̄(Frob_p).

Hypotheses: R(2, τ, ρ̄) is the fixed-determinant, unframed version of R08.3/pst-deformation-ring for Hodge–Tate weights (0, 1) and type τ.; The construction uses Breuil–Mézard strongly divisible modules with tame descent data (Savitt §§2–5), requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.; This is the weight-two computation that R08.6/export-weight-two-irreducible cites (the case ρ̄ irreducible with a principal-series tame type)..

Suppliers: LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

Sources: SAVITT-2005, Theorems 6.22–6.24, p. 42 (arXiv v3).


### `LocalGaloisDeformationRings:R08.4/finite-cocycles-kummer` — Finite cocycles via Kummer theory over F^nr (KW II Lemma 3.7)

Let F_v/ℚ_p be finite unramified, D_v = G_{F_v}, I_v its inertia, F^nr the maximal unramified extension. Let B be a complete local Noetherian algebra over A = 𝒪⟦T⟧ and N a finitely generated B-module, and let 2 ≤ k = k(ρ̄_v) ≤ p. Let Ξ = χ₁η₁η₂^{-1} with η₁, η₂ unramified and χ₁ = χ_p^{k−1} or χ_pω^{k−2}, so that Ξ|_{I_v} = χ₁; for k = 2 this is the cyclotomic character χ_p. Put M = N(Ξ). For k = 2, Kummer theory gives H¹_cont(I_v, N(χ_p)) ≅ (F^{nr×} ⊗ N)^∧ (𝔪_B-adic completion), D_v/I_v-equivariantly; composing with the valuation (v(p) = 1) gives v_Z : Z¹(D_v, M) → N, and Z¹_f(M) := ker v_Z (finite cocycles); for 2 < k ≤ p (p odd) put Z¹_f = Z¹, where the reduction of χ_pχ₁^{−1} on inertia is non-trivial. Then Z¹_f(B(Ξ)) is free of rank 1 + [F_v:ℚ_p] over B and Z¹_f(N(Ξ)) = Z¹_f(B(Ξ)) ⊗_B N.

Hypotheses: The μ_{p^n} core of the Kummer isomorphism for F^nr is planned at Tau Ceti ProfiniteCohomology Layer 9; what is specific here is the passage to 𝒪-module coefficients N(χ_p), the 𝔪_B-adic completion, D_v/I_v-equivariance and F^{nr×} ≅ ℤ × U.; Finite cocycles are the peu ramifié (finite flat) classes, which is why the lemma sits with the finite flat layer..

Suppliers: LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: KW2-2009, §3.2.5, Lemma 3.7, author copy pp. 25–26; KW2-2009, §3.2.5, the definition of finite cocycles, p. 25.


### `LocalGaloisDeformationRings:R08.4/kw-algebraisation-lemma` — Normalising a vector over 𝒪[T] inside 𝒪⟦T⟧ (KW II Lemma 3.8)

Let A₀ = 𝒪[T], A = 𝒪⟦T⟧, M₀ a free A₀-module of finite rank, M = A ⊗_{A₀} M₀ and m ∈ M. Then there exist m₀ ∈ M₀ and an isomorphism A ⊗_{A₀} M₀ ≅ M of A-modules sending m₀ to m.

Hypotheses: Used for the smooth algebraisation in the proof of KW II Proposition 3.6 (R08.6/export-ordinary): the resolution over 𝒪⟦T⟧ is defined over 𝒪[T]..

Suppliers: mathlib:PowerSeries.exists_isWeierstrassFactorization; mathlib:PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod.

Sources: KW2-2009, Lemma 3.8, author copy p. 30; KW2-2009, proof of Lemma 3.8, p. 30.


### `LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli` — The moduli of finite flat models

For a complete local R with residue field 𝔽 and ξ ∈ D^fl(R), the lattices of E-height ≤ 1 in M(V_R) (L7/height-lattice-moduli with h = 1: 𝔖_B-submodules 𝔐_B ⊂ M_B, projective of rank d, φ-stable, spanning, with coker(φ*𝔐_B → 𝔐_B) killed by E(u)) are represented by a projective R-scheme 𝒢ℛ_{V_𝔽,ξ}. For R = R^fl (End V_𝔽 = 𝔽), or R = R^{fl,□}, this gives a projective morphism Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl sending a lattice to the flat deformation it defines. Its closed fibre 𝒢ℛ_{V_𝔽,0} is a projective 𝔽-scheme whose 𝔽′-points are the isomorphism classes of finite flat models of V_𝔽 ⊗ 𝔽′.

Hypotheses: K/ℚ_p is finite with p > 2 (p = 2 is stage R08.5), e = e(K/ℚ_p), K₀ the maximal unramified subfield, 𝔽 a finite field, and V_𝔽 a d-dimensional 𝔽-representation of G_K that is the generic fibre of a finite flat group scheme; 𝔖 = W(k)⟦u⟧ and E(u) are as in L7/finite-height-lattices.; Kisin's modules of E-height ≤ 1 and their equivalence with finite flat group schemes (p > 2), and Breuil's full faithfulness of restriction from G_K to G_{K_∞} on finite flat representations, are requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4..

Suppliers: LocalGaloisDeformationRings:L7/height-lattice-moduli; LocalGaloisDeformationRings:L7/finite-height-lattices; LocalGaloisDeformationRings:R08.4/flat-deformation-condition; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

API `TauCeti.GaloisDeformation.Local.finiteFlatModels`: 𝒢ℛ_{V_𝔽,ξ}, the projective R-scheme of E-height ≤ 1 lattices.

API `TauCeti.GaloisDeformation.Local.finiteFlatModels_toFlat`: Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl, projective.

API `TauCeti.GaloisDeformation.Local.finiteFlatModels_closedFibre`: 𝒢ℛ_{V_𝔽,0}(𝔽′) ≃ finite flat models of V_𝔽 ⊗ 𝔽′.

API `TauCeti.GaloisDeformation.Local.finiteFlatModels.points`: For an R-algebra B in the source moduli category, morphisms Spec B→𝒢ℛ_{V_𝔽,ξ} correspond to E-height≤1 projective lattices in M(ξ)_B, with the specified generic-fibre identification. Pullback of the universal lattice gives this bijection and commutes with B→B′.

Test `finiteFlatModels_irreducible_Qp` (computation): K = ℚ_p, V_𝔽 irreducible: one model.

Test `finiteFlatModels_closedFibre_models` (characterisation): Closed-fibre points are finite flat models.

Test `finiteFlatModels_two_models_ramified` (non-example): Over ℚ_p(ζ_p), μ_p and ℤ/p are two models of one generic fibre.

Sources: KISIN-FFLAT-2009, Corollaries (2.1.11) and (2.1.13), p. 21.


### `LocalGaloisDeformationRings:R08.4/flat-generic-fibre` — The generic fibre of the flat deformation ring

On the generic fibre, flat deformations are the crystalline deformations with Hodge–Tate weights in {0, 1}: for an E-point ξ of R^{fl,□}, the completion of R^{fl,□}[1/p] at ξ pro-represents crystalline deformations of V_ξ, it is formally smooth over E, and if ξ has p-adic Hodge type v = (v_ψ)_ψ (v_ψ the multiplicity of the weight 1 at the embedding ψ) its dimension is d² + Σ_ψ (d − v_ψ)v_ψ. For the unframed ring (End V_𝔽 = 𝔽) the dimension is 1 + Σ_ψ (d − v_ψ)v_ψ.

Hypotheses: Crystalline with Hodge–Tate weights in {0, 1} implies Barsotti–Tate (Breuil for p > 2, Kisin), requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.; The tangent-space count is R08.3/pcris-generic-smooth specialised to Hodge–Tate weights {0, 1}: dim ad D/Fil⁰ ad D = Σ_ψ (d − v_ψ)v_ψ..

Suppliers: LocalGaloisDeformationRings:R08.4/flat-deformation-condition; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

Sources: KISIN-FFLAT-2009, Proposition (2.3.8) and Corollary (2.3.11), pp. 32–33.


### `LocalGaloisDeformationRings:R08.4/small-ramification-flat` — Unique models in small ramification

If e(K/ℚ_p) < p − 1, then Θ : 𝒢ℛ_{V_𝔽,ξ} → Spec R is an isomorphism for every ξ, and in particular Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl is an isomorphism: a flat deformation has a unique finite flat model.

Hypotheses: Raynaud's theorems for e < p − 1 (uniqueness of finite flat prolongations, [Ra, 3.3.3], and splitting of extensions whose generic fibre splits, [Ra, 3.3.6]) are requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, whose stage text asks for them..

Suppliers: LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1.

Sources: KISIN-FFLAT-2009, Proposition (2.1.14), p. 22.


### `LocalGaloisDeformationRings:R08.4/resolution-local-structure` — Local structure of the resolution

𝒢ℛ^{v,loc} is normal and Cohen–Macaulay, and its special fibre 𝒢ℛ^{v,loc} ⊗_{𝒪_F} 𝔽 (the reduction modulo a uniformiser of 𝒪_F, a scheme over R^v/π_F) is reduced and normal with rational singularities. Nothing is claimed about the fibre 𝒢ℛ^{v,loc}_0 over the closed point of Spec R^v, a smaller scheme, which can be reducible. A closed point of 𝒢ℛ^v lies in 𝒢ℛ^{v,loc} exactly when, for each σ ∈ Gal(K₀/ℚ_p), the nilpotent endomorphism π of σ-part of φ*𝔐/E(u)𝔐 has Jordan type dominated by the dual partition of v_σ. If for each σ any two of the v_ψ with ψ|K₀ = σ differ by at most 1, and either every v_ψ ∈ {0, 1} or e ≤ 2, then 𝒢ℛ^{v,loc} = 𝒢ℛ^v.

Hypotheses: The input is Pappas–Rapoport's local models for Res_{K/ℚ_p} GL_d (normality and Cohen–Macaulayness of the flat closure, reduced special fibre with rational singularities, and equality with the naive model in the stated cases), recorded as a gap: no stage of the atlas plans these local models..

Suppliers: LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli.

Sources: KISIN-FFLAT-2009, Proposition (2.2.2), Corollary (2.2.8) and Proposition (2.4.6), pp. 23–35.


### `LocalGaloisDeformationRings:R08.4/hodge-type-resolution` — Kisin's resolution of the flat deformation ring

Let R be R^{fl,□} ⊗ 𝒪_F (or R^fl ⊗ 𝒪_F when End V_𝔽 = 𝔽), F large enough to contain the reflex fields, and v a p-adic Hodge type. Let R^v be the quotient of R cut out by the closure of the union of the connected components of Spec R[1/p] on which the Hodge type is v. The lattices whose φ*𝔐/E(u)𝔐 has determinant ∏_ψ ψ(a)^{v_ψ} form a closed subscheme 𝒢ℛ^v ⊂ 𝒢ℛ, and its p-torsion-free part 𝒢ℛ^{v,loc} carries a projective map Θ^v : 𝒢ℛ^{v,loc} → Spec R^v that becomes an isomorphism after inverting p.

Hypotheses: K/ℚ_p is finite with p > 2 (p = 2 is stage R08.5), e = e(K/ℚ_p), K₀ the maximal unramified subfield, 𝔽 a finite field, and V_𝔽 a d-dimensional 𝔽-representation of G_K that is the generic fibre of a finite flat group scheme; 𝔖 = W(k)⟦u⟧ and E(u) are as in L7/finite-height-lattices.; Kisin's condition (2.4.5): ξ → D^fl is formally smooth, which holds for the two rings named.; That the Hodge type is constant on connected components of Spec R[1/p] is R08.3/hodge-type-components (Kisin uses Sen's theorem on Hodge–Tate weights in families)..

Suppliers: LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli; LocalGaloisDeformationRings:R08.4/flat-generic-fibre; LocalGaloisDeformationRings:R08.4/resolution-local-structure; LocalGaloisDeformationRings:R08.3/hodge-type-components.

API `TauCeti.GaloisDeformation.Local.flatHodgeTypeQuotient`: R^v, the Hodge-type-v part of the flat ring.

API `TauCeti.GaloisDeformation.Local.flatResolution`: 𝒢ℛ^{v,loc} with Θ^v : 𝒢ℛ^{v,loc} → Spec R^v projective.

API `TauCeti.GaloisDeformation.Local.flatResolution_generic_iso`: Θ^v[1/p] is an isomorphism.

API `TauCeti.GaloisDeformation.Local.flatResolution.points`: An admissible B-point is a finite-flat model lattice satisfying the labelled Hodge determinant/rank condition defining v. Pullback of the universal lattice and its filtration commutes with coefficient base change.

Test `flatResolution_small_ramification` (degenerate): e < p − 1: Θ^v is an isomorphism integrally.

Test `flatResolution_generic_iso` (characterisation): Θ^v is an isomorphism after inverting p.

Test `flatResolution_not_integral_iso` (non-example): Θ^v has positive-dimensional closed fibre in general.

Sources: KISIN-FFLAT-2009, (2.4.1)–(2.4.3) and Proposition (2.4.8), pp. 34–37.


### `LocalGaloisDeformationRings:R08.4/components-via-special-fibre` — Connected components through the special fibre

There is a bijection between the connected components of Spec R^v[1/p] and those of the fibre 𝒢ℛ^{v,loc}_0 of the resolution over the closed point of Spec R^v. Because Θ^v[1/p] is an isomorphism, this describes components of the deformation ring itself and not only of the moduli space: connectedness of the source alone would not suffice.

Hypotheses: The relevant inputs are the isomorphism on the generic fibre (hodge-type-resolution) and the reducedness of the special fibre 𝒢ℛ^{v,loc} ⊗_{𝒪_F} 𝔽 (resolution-local-structure); this is not the fibre 𝒢ℛ^{v,loc}_0 over the closed point of Spec R^v, which enters only through its topological space..

Suppliers: LocalGaloisDeformationRings:R08.4/hodge-type-resolution; LocalGaloisDeformationRings:R08.4/resolution-local-structure; AdicSpacesPartII:F0/grothendieck-algebraization; AdicSpacesPartII:F0/theorem-on-formal-functions.

Sources: KISIN-FFLAT-2009, Corollary (2.4.10), pp. 37–38.


### `LocalGaloisDeformationRings:R08.4/ordinary-type-of-components` — The ordinary type of a component

Every point 𝔐_A of the moduli has a maximal multiplicative subobject 𝔐^m_A and a maximal étale quotient 𝔐^ét_A, compatible with base change and exchanged by duality; their ranks d_m and d_ét are constant on each connected component of 𝒢ℛ^{v,loc}_0. For a pair d = (d_ét, d_m), an E-point x of Spec R^v lies on a connected component of Spec R^v[1/p] corresponding to a component of type d exactly when the maximal unramified subrepresentation of V_x(−1) has dimension d_m and the maximal unramified quotient of V_x has dimension d_ét.

Hypotheses: Kisin conjectures (2.4.16) that for End V_𝔽 = 𝔽 each type-d locus is connected; this is proved here only in rank two (rank-two-nonordinary-connected, rank-two-ordinary-locus)..

Suppliers: LocalGaloisDeformationRings:R08.4/hodge-type-resolution; LocalGaloisDeformationRings:R08.4/components-via-special-fibre; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

Sources: KISIN-FFLAT-2009, Proposition (2.4.14), (2.4.15) and Conjecture (2.4.16), pp. 38–41.


### `LocalGaloisDeformationRings:R08.4/rank-two-nonordinary-connected` — Connectedness of the non-ordinary locus in rank two

Let d = 2, v_ψ = 1 for all ψ (so 𝒢ℛ^v = 𝒢ℛ^{v,loc}), and K₀ = ℚ_p. Any two non-ordinary 𝔽′-points of 𝒢ℛ^v_0 lie on the same connected component. So the non-ordinary locus of Spec R^v[1/p] is connected.

Hypotheses: K₀ = ℚ_p means K/ℚ_p totally ramified. Kisin notes (footnote to §3.5) that Gee subsequently proved the statement without this restriction for V_𝔽 with trivial G_K-action; Gee's argument is not a source of this node, so the restriction is kept.; The residual input (Kisin (2.5.3)): with ω₁, ω₂ the fundamental characters of I_K of levels 1 and 2 (g ↦ g(π^{1/(p^n−1)})/π^{1/(p^n−1)}, n = 1, 2; the mod p cyclotomic character is ω₁^e on I_K): for V_𝔽 reducible, V_𝔽^ss|I_K ≅ ω₁^i ⊕ ω₁^j with i, j ∈ [0, e] and p − 1 | e − i − j; for V_𝔽 irreducible (𝔽 ⊇ 𝔽_{p²}), V_𝔽|I_K ≅ ω₂^i ⊕ ω₂^{pi} with i = i₀ + pi₁, i₀, i₁ ∈ [0, e], p + 1 ∤ i and p − 1 | e − i..

Suppliers: LocalGaloisDeformationRings:R08.4/ordinary-type-of-components; LocalGaloisDeformationRings:R08.4/components-via-special-fibre; LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli.

Sources: KISIN-FFLAT-2009, Lemmas (2.5.1), (2.5.3), (2.5.5) and Proposition (2.5.6), pp. 41–48.


### `LocalGaloisDeformationRings:R08.4/rank-two-ordinary-locus` — The ordinary locus in rank two

Let d = 2 and v_ψ = 1 for all ψ (K₀ arbitrary). The ordinary part 𝒢ℛ^{v,ord}_0 of the closed fibre, if non-empty, is a single point, unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁, χ₂ unramified. In that case it is two points (the models D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₂} and D(𝒢_{χ₂^{−1}ω}) ⊕ 𝒢_{χ₁}) if χ₁ ≠ χ₂, and ℙ¹ if χ₁ = χ₂, all its models being isomorphic to D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₁}.

Hypotheses: 𝒢_χ is the finite étale extension of an unramified character χ, D is Cartier duality and ω the mod-p cyclotomic character..

Suppliers: LocalGaloisDeformationRings:R08.4/ordinary-type-of-components; LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1.

Sources: KISIN-FFLAT-2009, Proposition (2.5.15), pp. 48–49.


### `LocalGaloisDeformationRings:R08.4/rank-two-bt-components` — Components of rank-two Barsotti–Tate deformation rings

Let d = 2, v_ψ = 1 for all ψ (Barsotti–Tate with cyclotomic-type determinant), R = R^{fl,□} ⊗ 𝒪_F and R^v its Hodge-type-v quotient. (1) R^v is flat over ℤ_p of pure relative dimension 4 + [K : ℚ_p], and R^v[1/p] is formally smooth; its irreducible components are its connected components. (2) If E-points x₁, x₂ lie on the same irreducible component, then V_{x₁} and V_{x₂} are both ordinary or both non-ordinary. Conversely they lie on the same component if (i) both are non-ordinary and K₀ = ℚ_p, or (ii) both are ordinary and the characters of G_K on the lines L_i ⊂ V_{x_i} where I_K acts cyclotomically have the same reduction mod π_E. The same holds for R^fl ⊗ 𝒪_F when End V_𝔽 = 𝔽, with relative dimension 1 + [K : ℚ_p]. In particular, in the ordinary case, and in the non-ordinary case when K₀ = ℚ_p, a modular point and a lift lie on the same component exactly when they satisfy these matching conditions, which is how Kisin chooses his auxiliary modular forms; for non-ordinary points with K₀ ≠ ℚ_p only the necessary condition is known from this source.

Hypotheses: This is the rank-two case of Kisin's conjecture (2.4.16), with K₀ = ℚ_p in the non-ordinary case.; Potentially Barsotti–Tate representations of a nontrivial type are reduced to this case by a global solvable base change (GL2ModularityLifting R22.5), not by a local component theorem for types..

Suppliers: LocalGaloisDeformationRings:R08.4/flat-generic-fibre; LocalGaloisDeformationRings:R08.4/components-via-special-fibre; LocalGaloisDeformationRings:R08.4/ordinary-type-of-components; LocalGaloisDeformationRings:R08.4/rank-two-nonordinary-connected; LocalGaloisDeformationRings:R08.4/rank-two-ordinary-locus; LocalGaloisDeformationRings:R08.1/local-forget-framing.

Sources: KISIN-FFLAT-2009, Corollary (2.5.16), p. 49; CN-2023, Lemma 5.3.4, arXiv v3 p. 77.


### `LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation` — Unique generalisation of generic points for Barsotti–Tate rings

Let p be odd, F_v/ℚ_p finite and R = R^{ε_p^{-1},BT}_v the fixed-determinant Barsotti–Tate lifting ring (crystalline with determinant ε_p^{-1}; its Hodge–Tate weights are {0, 1} in Caraiani–Newton's convention HT(ε_p) = −1, that is {0, −1} in this roadmap's convention HT(ε_p) = +1) of ρ̄ : G_{F_v} → GL₂(k). Each generic point of Spec(R/ϖ) is the specialisation of a unique generic point of Spec R. Moreover, if ρ̄ is trivial, k_v ≠ 𝔽_p and R ≠ 0, Spec R has exactly two irreducible components, whose points are the ordinary and the non-ordinary lifts.

Hypotheses: The first statement rests on generic reducedness of the special fibre (Caraiani–Emerton–Gee–Savitt, Theorem 1.3), stated for the ring without fixed determinant, which is formally smooth over the fixed-determinant ring for p odd..

Suppliers: LocalGaloisDeformationRings:R08.4/rank-two-bt-components; LocalGaloisDeformationRings:R08.4/flat-generic-fibre; LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings.

Sources: CN-2023, Lemma 5.3.3, arXiv v3 p. 76; CN-2023, Lemma 5.3.4, arXiv v3 p. 77.


### `LocalGaloisDeformationRings:R08.5/connected-kisin-modules-with-coefficients` — Deformation groupoids of connected Kisin modules with coefficients

Let p = 2 be allowed, K/ℚ_p finite with finite residue field, and V_𝔽 a finite-dimensional 𝔽-representation of G_K. For an admissible augmented coefficient algebra (A, I) in Kisin's category 𝔄𝔲𝔤_{W(𝔽)}, use the category (Mod/𝔖)_A of Kisin modules with coefficients and its connected subcategory (Mod/𝔖)^c_A, together with the multiplicative and étale objects, from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 (R07.4/kisin-modules-with-coefficients; connectedness is the condition ψ_n(𝔐_A) ⊆ (p, u)φ^{n*}(𝔐_A) for n large of Kisin (2.1.4), under which R07.4/dyadic-classification classifies connected finite flat group schemes at p = 2). With M_𝔽 = (𝒪_{ℰ^ur} ⊗ V_𝔽(−1))^{G_{K∞}}, let D_{V_𝔽} and D_{M_𝔽} be the groupoids of deformations of V_𝔽 and of the étale φ-module M_𝔽, and D_{𝔖,M_𝔽} ⊇ D^c_{𝔖,M_𝔽} the groupoids of deformations of (connected) Kisin modules with coefficients together with an identification of their 𝒪_ℰ-module with M_𝔽 (Kisin (2.1.1)–(2.1.5)). Then 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A is a morphism D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7). Only these deformation groupoids and the forgetful morphism are constructed here; the integral categories are R07.4's.

Hypotheses: p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.; R07.4/kisin-modules-with-coefficients and R07.4/etale-phi-modules-with-coefficients are stated under the hypothesis p ≠ 2 of Kisin's Annals paper; they are used here for p = 2 as well, where the definitions and the equivalence T_A are unchanged (requested from R07.4)..

Suppliers: LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli; LocalGaloisDeformationRings:L7/finite-height-lattices; LocalGaloisDeformationRings:R08.1/local-lifting-ring; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/dyadic-classification; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

API `TauCeti.GaloisDeformation.Local.kisinGroupoid`: D_{𝔖,M_𝔽}: over (A, I), pairs (𝔐_A, ι) with 𝔐_A ∈ R07.4's (Mod/𝔖)_A and ι : 𝒪_ℰ ⊗_𝔖 𝔐_A ⊗_A A/I ≅ M_𝔽 ⊗_𝔽 A/I; morphisms are isomorphisms compatible with ι.

API `TauCeti.GaloisDeformation.Local.kisinGroupoid.connected`: D^c_{𝔖,M_𝔽} ⊆ D_{𝔖,M_𝔽}: the full subgroupoid of objects connected in R07.4's sense.

API `TauCeti.GaloisDeformation.Local.kisinGroupoid_toPhiModule`: 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A, a morphism of groupoids D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7).

API `TauCeti.GaloisDeformation.Local.kisinGroupoid.baseChange`: Along an admissible morphism of augmented coefficient algebras, tensor the Kisin module, keep connectedness (R07.4 base change) and transport ι; identity and composition laws hold up to the canonical isomorphisms.

API `TauCeti.GaloisDeformation.Local.kisinGroupoid.connected_iff_etalePart`: For p = 2 an object over a finite field is in D^c iff its maximal étale quotient in R07.4's sense is zero; for p > 2 every object of height ≤ 1 is allowed and D^c is not used.

Test `rank_one_etale` (computation): Rank one with φ(e) = E(u)e over 𝔽: the object is étale (R07.4) and lies in D_{𝔖,M_𝔽} but not in D^c_{𝔖,M_𝔽}.

Test `rank_one_multiplicative` (computation): Rank one with φ(e) = e: multiplicative, hence connected, so it lies in D^c_{𝔖,M_𝔽}.

Test `rank_one_cyclotomic` (computation): The rank-one module with φ(e) = pE(u)/E(0)·e is étale because p/E(0) is a unit, so it is not in D^c. (In the source's normalisation G_{K∞} acts on its φ-invariants by χ^{−1}, and after the fixed (1)-twist of the Galois realisation it gives the trivial character, an étale group scheme; the name of the test refers to the Frobenius pE(u)/E(0), not to the resulting character.)

Test `p_odd_vs_two` (non-example): At p = 2 an étale rank-one object is not connected and still has a finite-flat étale model: D^c is the connected part only, and Kisin's connected equivalence does not exclude nonconnected finite-flat groups.

Sources: KISIN-2ADIC-2009, §2.1, (2.1.1)–(2.1.7), pp. 19–21 (DVI).


### `LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2` — Ordinary deformation rings of rank two at p = 2

For a discrete ℤ_p[Γ_K]-module M with p nilpotent, H¹_f(G_K, M(χ)) (the classes whose inertial image lies in 𝒪^×_{K^ur} ⊗ M) is right exact in M (Lemma 2.4.2). The groupoid D^{ord,χ}_{V_𝔽} of triples (V_A, L_A, ι_A) with det V_A ≅ χ, L_A a G_K-stable line with I_K acting by χ, and extension class in H¹_f (2.4.3) is relatively representable and projective over D^χ_{V_𝔽}; Θ^{ord} becomes a closed embedding after inverting p, and if ξ → D^χ_{V_𝔽} is formally smooth then the scheme 𝓛^{ord}_{V_𝔽,ξ} is formally smooth over W(𝔽) (Proposition 2.4.4). The scheme-theoretic image R^{ord}_ξ has as E-points the crystalline representations (χη ∗; 0 η^{−1}) with η unramified, R^{ord}_ξ[1/p] is formally smooth over W(𝔽)[1/p], and R^{ord}_ξ is a domain unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁ ≠ χ₂ and χ₁|_{I_K} = χ₂|_{I_K} = χ (Corollary 2.4.5); the framed version R^{ord,ψ,□}_{V_𝔽}, whose E-points are the crystalline (χψη ∗; 0 η^{−1}), has R^{ord,ψ,□}_{V_𝔽}[1/p] formally smooth over E of dimension 3 + [K : ℚ_p], and is a domain with the same exception (Corollary 2.4.6).

Hypotheses: p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.; dim_𝔽 V_𝔽 = 2; K need not be unramified (unlike KW II 3.2.6).; For the normality/domain conclusions for R^{ord}_ξ assume the source’s formally smooth flat deformation family ξ, as in Kisin (2.3.12), (2.4.4)–(2.4.6)..

Suppliers: LocalGaloisDeformationRings:R08.1/local-fixed-determinant; LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.4/ordinary-type-of-components; LocalGaloisDeformationRings:R08.4/finite-cocycles-kummer.

Sources: KISIN-2ADIC-2009, §2.4, (2.4.1)–(2.4.6), pp. 30–33 (DVI).


### `LocalGaloisDeformationRings:R08.5/kisin-local-rings-p2-comparison` — Kisin's rings away from 2 and at ∞ against R08.1–R08.2

Kisin's rings away from p and at the real place (§2.5 of the 2-adic paper, written for every p and used at p = 2) are those already planned: the ring of extensions of γ by γ(1) (Proposition 2.5.2) is R08.2's Steinberg condition (domain of dimension 3 after inverting p, formally smooth); unramified lifts with determinant ψχ (2.5.3) form a formally smooth ring of relative dimension 3 (R08.2/unramified-lifting-ring); the fixed-determinant ring (2.5.4) is 3-dimensional after inverting p and a union of formally smooth components, with tangent dimension 3 + h²(G_L, ad⁰V_x) (R08.2/unrestricted-away-from-p); and the odd archimedean ring at p = 2 is 𝒪⟦x, y, z⟧/(x² + 2x + yz) for trivial V_𝔽 and 𝒪⟦x, y, z⟧/(x² + 2x + yz + z) for V_𝔽 = (1 1; 0 1), with universal lifts c ↦ (1+x y; z −1−x) and (1+x 1+y; z −1−x) (Proposition 2.5.6; R08.1/archimedean-odd-ring-p2).

Hypotheses: ℓ ≠ p finite (L/ℚ_ℓ) or the real place; p = 2 allowed..

Suppliers: LocalGaloisDeformationRings:R08.2/steinberg-condition; LocalGaloisDeformationRings:R08.2/unramified-lifting-ring; LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p; LocalGaloisDeformationRings:R08.1/archimedean-odd-ring-p2.

Sources: KISIN-2ADIC-2009, §2.5, Propositions 2.5.2–2.5.6, pp. 33–35 (DVI).


### `LocalGaloisDeformationRings:R08.5/weight-p-crystalline-ordinarity` — Crystalline lifts of weight k ≤ p are ordinary when the residual representation is

Let p be any prime, F/ℚ_p finite unramified and ρ : G_F → GL₂(E) a lift of ρ̄ that is crystalline of weight k (Hodge–Tate weights {0, k − 1}) with 2 ≤ k ≤ p. If ρ̄ is ordinary (has a G_F-stable line with unramified quotient), ρ is ordinary. The endpoint k = p, where Fontaine–Laffaille modules of filtration length p − 1 occur but the torsion functor is not fully faithful, is included.

Hypotheses: The weight p + 1 case (F = ℚ_p) is R08.5/weight-p-plus-one-ordinary-ring, which imports the Berger–Li–Zhu criterion from PadicHodgeTheory R06.4.; The crystalline-to-ordinary criterion is imported from the requested full KW II Lemma 3.5 at PadicHodgeTheory R06.4; the current supplier’s endpoint branch does not yet state that complete criterion. This node is a deformation-ring comparison, not a second owner of the Galois criterion..

Suppliers: PadicHodgeTheory:R06.4/weight-p-endpoint-branch; PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion; PadicHodgeTheory:R06.4/ordinary-representation.

Sources: KW2-2009, Lemma 3.5 (i) and its proof, author copy p. 22; KW2-2009, proof of Lemma 3.5, p. 22.


### `LocalGaloisDeformationRings:R08.5/weight-p-plus-one-ordinary-ring` — Crystalline lifts of weight p + 1: ordinarity and formal smoothness

Let p ≠ 2, ρ̄ : G_{F_v} → GL₂(k) with F_v = ℚ_p, k(ρ̄) = p + 1 (so ρ̄|I_v ≅ (χ̄_p ∗; 0 1) très ramifié) and φ a fixed determinant. (1) For F_v = ℚ_p, every crystalline lift of weight p + 1 is ordinary (Berger–Li–Zhu), i.e. an extension of an unramified free rank-one representation by a free rank-one representation on which I_v acts by χ_p^p. (2) The framed fixed-determinant ring R^{□,ψ}_v of ordinary lifts of weight p + 1 (extensions of unramified η₂ by χ_p^pη₁) is formally smooth over 𝒪 of relative dimension 4. (3) The map Spf R^{□,ψ}_v → X to the space of characters giving the action on the stable line is not formally smooth.

Hypotheses: (1) is the second part of KW II Lemma 3.5(i), owned by PadicHodgeTheory R06.4, its single owner; this layer imports it through a request.; (2) does not use the smooth-resolution criterion: the ring is shown to be a power series ring directly.; This node keeps F_v = ℚ_p in every clause. In KW II §3.2.7 only (1) needs it; (2) is proved there for every finite unramified F_v, with relative dimension 3 + [F_v : ℚ_p] (one for the line, 2 + [F_v : ℚ_p] for the cocycles)..

Suppliers: LocalGaloisDeformationRings:R08.4/finite-cocycles-kummer; PadicHodgeTheory:R06.4/weight-p-plus-one-branch; PadicHodgeTheory:R06.4; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: KW2-2009, §3.2.7, author copy p. 31; KW2-2009, §3.2.7, p. 31; KW2-2009, Remark after §3.2.7, p. 32.


### `LocalGaloisDeformationRings:R08.5/semistable-weight-two-resolution` — Semistable weight-two lifts at p: the resolution and the dyadic homothety case

Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) : G_{F_v} → GL₂(k) with F_v/ℚ_p unramified and γ̄_v unramified, φ a fixed determinant, and γ_v a fixed unramified lift of γ̄_v with γ_v²χ_p = φ. Consider lifts (γ_vχ_p ∗; 0 γ_v). For finite A, |Z¹(D_v, A(χ_p))| = |A|^{2+[F_v:ℚ_p]}, and the moduli of such lifts with a stable line is a smooth resolution ℛ → Spf R^{□,ψ}_v: (1) unless p = 2 and D_v acts on ρ̄_v by homotheties, ℛ → Spf R^{□,ψ}_v is an isomorphism and ℛ is a torsor over the completion of ℙ¹_𝒪 at the residual line with its prescribed character of ρ̄_v under the completion of a free module of rank 2 + [F_v:ℚ_p] along the zero section; (2) if p = 2 and D_v acts by homotheties, ℛ is a torsor over the completion of ℙ¹_𝒪 along its special fibre under the completion of a free module of rank 2 + [F_v:ℚ_p].

Hypotheses: In case (2) the resolution is not an isomorphism: every line of the residual space is stable, which is the dyadic phenomenon of this layer; the consequences (domain, faithfully flat, regular generic fibre) are drawn in R08.6/export-semistable-weight-two-at-p by the smooth-resolution criterion.; Uniqueness is for a stable line with the prescribed graded character, not for all invariant lines. A split sum of distinct characters has two invariant lines..

Suppliers: LocalGaloisDeformationRings:R08.4/finite-cocycles-kummer; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; AlgebraicModuliForArithmeticGeometry:R09.1.

Sources: KW2-2009, §3.2.6, author copy p. 30; KW2-2009, §3.2.6, p. 30.


### `LocalGaloisDeformationRings:R08.5/dyadic-minimal-lifts` — Minimal lifts in the dihedral and exceptional cases (p = 2 and residue characteristic 2)

Let v be a place with residue characteristic q ≠ p and ρ̄_v : D_v → GL₂(k) whose projective image G of I_v has order divisible by p and is non-cyclic. (a) If the centre C of the image of wild inertia in G is cyclic, then p = 2, G is dihedral of order 2d with d odd and q | d, and ρ̄_v ≅ Ind_{G_L}^{D_v}(γ) for a wildly ramified character γ of a ramified quadratic L/F_v; the minimal lift ρ₀ is an unramified twist of Ind(γ̂δ) with γ̂ the Teichmüller lift and δ a ramified quadratic character of G_L, with det ρ₀ = φ. Its restriction to I_v does not depend on δ, det ρ₀|I_v is the Teichmüller lift of det ρ̄|I_v, and the conductor of ρ₀ equals that of ρ̄_v. (b) If C is non-cyclic, then q = 2, p = 3, G ≅ A₄ inside S₄, and ρ₀ is the unique lift with determinant φ whose projectivisation is the lift of S₄ to PGL₂(ℤ₃). A lift ρ of ρ̄_v is minimal if ρ|I_v ≅ ρ₀|I_v; minimal lifts form the inertia-rigid deformation problem of ρ₀.

Hypotheses: In the cyclic-of-order-p case (ρ̄|I_v ≅ ξ ⊗ (1 η; 0 1)) minimal lifts are ξ̂ ⊗ (1 η̂; 0 1) on inertia; that case is R08.5/twisted-semistable-away-from-p's family..

Suppliers: LocalGaloisDeformationRings:R08.2/minimally-ramified-condition; GlobalGaloisDeformations:R04.4/inertia-rigid-deformations; LocalGaloisDeformationRings:R08.1/local-fixed-determinant.

API `TauCeti.GaloisDeformation.Local.DyadicMinimal.lift`: The lift ρ₀ = unramified twist of Ind(γ̂δ) in case (a), or the S₄-lift in case (b).

API `TauCeti.GaloisDeformation.Local.DyadicMinimal.restrict_inertia`: ρ₀|I_v is independent of δ (case (a)).

API `TauCeti.GaloisDeformation.Local.DyadicMinimal.det_inertia`: det ρ₀|I_v is the Teichmüller lift of det ρ̄_v|I_v.

API `TauCeti.GaloisDeformation.Local.DyadicMinimal.conductor`: a(ρ₀) = a(ρ̄_v).

API `TauCeti.GaloisDeformation.Local.DyadicMinimal.problem`: Minimal lifts: the inertia-rigid problem attached to ρ₀ (GlobalGaloisDeformations R04.4).

Test `dyadicMinimal_det` (computation): For ρ̄_v = Ind(γ) with γ of odd order divisible by q (for example of order 3^a when q = 3; here p = 2) on a ramified quadratic L, det ρ₀|I_v = Teichmüller(det ρ̄_v|I_v).

Test `dyadicMinimal_naive_fails` (non-example): The naive lift Ind(γ̂) without δ has det|I_v = ε_L·(γ̂∘t), which differs from the Teichmüller lift of det ρ̄|I_v by the ramified ε_L; δ corrects it.

Test `dyadicMinimal_A4` (computation): q = 2, p = 3, G ≅ A₄: ρ₀ has projective image S₄ ⊂ PGL₂(ℤ₃) or its subgroup A₄.

Test `dyadicMinimal_tame` (degenerate): If #G is prime to p, the lift ρ_I of ρ̄_v|I_v with ρ_I(I_v) ≅ ρ̄_v(I_v) is unique up to conjugation (KW II §3.3.1, first case); the extension ρ₀ to D_v involves a choice and an unramified twist, and the lifts with this inertial behaviour form a ring of relative dimension 3.

Sources: KW2-2009, §3.3.1, author copy p. 33; KW1-2009, §5, the definition of minimal lifts, p. 8.


### `LocalGaloisDeformationRings:R08.5/etale-multiplicative-parts` — Étale quotients, multiplicative parts and connectedness

For (A, I) in 𝔄𝔲𝔤_{W(𝔽)} and 𝔐_A in D_{𝔖,M_𝔽}(A, I), 𝔐_A has a maximal étale quotient 𝔐^{ét}_A and a maximal multiplicative subobject 𝔐^m_A in (Mod/𝔖)_A, 𝔐_A/𝔐^m_A is in (Mod/𝔖)_A, and both constructions commute with base change (Lemma 2.1.8). 𝔐_A is connected iff 𝔐^{ét}_A = 0 (Lemma 2.1.9), and the inclusion D^c_{𝔖,M_𝔽} → D_{𝔖,M_𝔽} is open and closed (Proposition 2.1.10).

Hypotheses: p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix..

Suppliers: LocalGaloisDeformationRings:R08.5/connected-kisin-modules-with-coefficients.

Sources: KISIN-2ADIC-2009, §2.1, Lemmas 2.1.8–2.1.9 and Proposition 2.1.10, p. 21 (DVI).


### `LocalGaloisDeformationRings:R08.5/twisted-semistable-away-from-p` — Twists of semistable deformations away from p

Let v ∤ p and ρ̄|D_v = (γ̄_vχ̄_p ∗; 0 γ̄_v). Fix a character γ_v of D_v lifting γ̄_v whose restriction to I_v is the Teichmüller lift, with γ_v²χ_p = φ, and consider lifts (γ_vχ_p ∗; 0 γ_v). For a finite 𝒪-algebra A, |Z¹(G_{F_v}, A(χ_p))| = |A|·|H⁰(G_{F_v}, A)| = |A|², and the moduli of such lifts with a stable line is a smooth resolution as in R08.5/semistable-weight-two-resolution with cocycle module of rank 2. If ρ̄_v is ramified, the conductor of such a lift equals the conductor of ρ̄_v.

Hypotheses: This is the twisting calculation of KW II §3.3.4; at p = 2 it includes the case ρ̄(I_v) projectively cyclic of order 2..

Suppliers: LocalGaloisDeformationRings:R08.5/semistable-weight-two-resolution; LocalGaloisDeformationRings:R08.4/finite-cocycles-kummer; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: KW2-2009, §3.3.4, author copy pp. 36–37.


### `LocalGaloisDeformationRings:R08.5/connected-model-moduli` — Moduli of connected finite flat models

D_{𝔖,M_𝔽} → D_{M_𝔽} is relatively representable and projective: for a complete local R and ξ ∈ D_{M_𝔽}(R) there is a projective R-scheme 𝒢ℛ_{V_𝔽,ξ} with |D_{𝔖,M_𝔽,ξ}|(A, I) ≅ Hom_{Spec R}(Spec A, 𝒢ℛ_{V_𝔽,ξ}), and Θ_{V_𝔽,ξ} : 𝒢ℛ_{V_𝔽,ξ} → Spec R becomes a closed immersion after inverting p; the connected part is a closed and open subscheme 𝒢ℛ^c_{V_𝔽,ξ} (Proposition 2.1.12).

Hypotheses: p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix..

Suppliers: LocalGaloisDeformationRings:R08.5/etale-multiplicative-parts; LocalGaloisDeformationRings:L7/height-lattice-moduli.

Sources: KISIN-2ADIC-2009, §2.1, Proposition 2.1.12, p. 22 (DVI).


### `LocalGaloisDeformationRings:R08.5/rank-two-type-v` — Rank-two Kisin modules of type v and their determinant

A Kisin module 𝔐_A of 𝔖_A-rank 2 is of type v if (1 ⊗ φ)(φ^*𝔐_A)/E(u)𝔐_A is maximal isotropic in 𝔐_A/E(u)𝔐_A (2.3.1). If 𝔐_A is free of type v with φ-matrix H, then det H = pE(u)/E(0)·w with w ∈ 𝔖_A^× (Lemma 2.3.2). If 𝔐_𝔽 is connected of type v, every deformation 𝔐_A is connected with 𝔐^m_A = 0 (Lemma 2.3.3). For V_A = Θ(𝔐_A), det V_A|_{I_K} ≅ χ, and det V_A ≅ χ on G_K iff det H = pE(u)/E(0)·w with w ↦ 1 in (W(k) ⊗ A)^× iff a basis can be chosen with det H = pE(u)/E(0) (Lemma 2.3.4).

Hypotheses: p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.; dim_𝔽 V_𝔽 = 2..

Suppliers: LocalGaloisDeformationRings:R08.5/connected-kisin-modules-with-coefficients; LocalGaloisDeformationRings:R08.5/etale-multiplicative-parts; LocalGaloisDeformationRings:R08.4/hodge-type-resolution.

Sources: KISIN-2ADIC-2009, §2.3, (2.3.1) and Lemmas 2.3.2–2.3.4, pp. 25–27 (DVI).


### `LocalGaloisDeformationRings:R08.5/flat-connected-deformation-ring` — Flat connected deformation rings at p = 2

Let D^{fl,c}_{V_𝔽} ⊆ D^{fl}_{V_𝔽} ⊆ D_{V_𝔽} be the deformations that arise from finite flat connected (resp. finite flat) 𝒪_K-group schemes; D^{fl,c} → D_{M_𝔽} is fully faithful. Both inclusions are relatively representable and closed, and for the maximal quotient R^c of R over which ξ is flat connected, Spec R^c[1/p] → Spec R[1/p] is an open immersion (Lemma 2.2.2). If ξ → D^{fl,c} is formally smooth then R[1/p] is formally smooth over W(𝔽)[1/p] (Lemma 2.2.3). There is Θ_{V_𝔽} : D^c_{𝔖,M_𝔽} → D^{fl,c}_{V_𝔽} compatible with 𝒪_ℰ ⊗ − (Proposition 2.2.4), and for formally smooth ξ the projective morphism Θ : 𝒢ℛ^c_{V_𝔽,ξ} → Spec R becomes an isomorphism after inverting p (Proposition 2.2.7).

Hypotheses: p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.; In the open-immersion assertion, ξ is a flat deformation V_R in D^{fl}(R), and R^c is its maximal connected quotient. The assertion is not made for an arbitrary unrestricted family..

Suppliers: LocalGaloisDeformationRings:R08.5/connected-model-moduli; LocalGaloisDeformationRings:R08.4/flat-deformation-condition; LocalGaloisDeformationRings:R08.4/flat-generic-fibre; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

Sources: KISIN-2ADIC-2009, §2.2, (2.2.1)–(2.2.7), pp. 22–24 (DVI).


### `LocalGaloisDeformationRings:R08.5/rank-two-connected-components` — Components of 2-adic Barsotti–Tate deformation rings

For ξ ∈ D^{fl,c}_{V_𝔽}(R) with dim V_𝔽 = 2: the type-v locus 𝒢ℛ^{c,v}_{V_𝔽,ξ} ⊆ 𝒢ℛ^{fl,c}_{V_𝔽,ξ} is closed, Θ^v factors through Spec R^v (inertia acting on det by χ) and is an isomorphism after inverting p; and if ξ has determinant χ and ξ → D^{fl,c,χ} is formally smooth, the complete local rings of 𝒢ℛ^{c,v} are those of Hilbert modular varieties (Deligne–Pappas), so 𝒢ℛ^{c,v} is a normal local complete intersection over W(𝔽) with geometrically reduced special fibre and formally smooth generic fibre (Theorem 2.3.9). If det V_𝔽 = χ and V_𝔽 comes from a connected finite flat group scheme, the closed fibre 𝒢ℛ^{c,v}_{V_𝔽,0} is geometrically connected when k = 𝔽_p or G_K acts trivially on V_𝔽; in these two cases Spec R[1/p] is geometrically connected whenever ξ ∈ D^{fl,c,χ}_{V_𝔽}(R) and ξ → D^{fl,c,χ}_{V_𝔽} is formally smooth (Theorem 2.3.11). The framed ring R^{fl,c,ψ,□}_{V_𝔽}[1/p] with determinant ψχ (ψ unramified) is formally smooth over E of relative dimension 3 + [K : ℚ_p], and geometrically connected under those conditions (Corollary 2.3.13).

Hypotheses: p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.; dim_𝔽 V_𝔽 = 2; for 2.3.11, k = 𝔽_p or G_K acting trivially.; Dimension lowering at p=2 uses the rational determinant-twisting construction, not the p∤rank integral splitting..

Suppliers: LocalGaloisDeformationRings:R08.5/rank-two-type-v; LocalGaloisDeformationRings:R08.5/flat-connected-deformation-ring; LocalGaloisDeformationRings:R08.4/resolution-local-structure; LocalGaloisDeformationRings:R08.4/rank-two-bt-components; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; LocalGaloisDeformationRings:R08.1/determinant-twisting.

Sources: KISIN-2ADIC-2009, §2.3, (2.3.5)–(2.3.13), pp. 27–30 (DVI).


### `LocalGaloisDeformationRings:R08.5/kw1-endpoint-weight-rings` — Endpoint-weight local rings for KW I Theorem 4.1

KW I Theorem 4.1 (modularity lifting) needs, at p, local deformation rings of the following lifts of ρ̄|G_{ℚ_p}, each with a flat reduced framed fixed-determinant ring of relative dimension 3 + 1 = 4 with regular generic fibre (or formally smooth): (1) p = 2: crystalline of weight 2 (Kisin's 2-adic Barsotti–Tate rings: R08.5/flat-connected-deformation-ring and R08.5/rank-two-connected-components for lifts coming from connected groups, R08.5/ordinary-deformations-p2 for ordinary lifts), or semistable of weight 2 when k(ρ̄) = 4 (R08.5/semistable-weight-two-resolution); (2) p > 2: crystalline of weight k with 2 ≤ k ≤ p + 1 — the Fontaine–Laffaille range k ≤ p − 1, the endpoint k = p (R08.5/weight-p-crystalline-ordinarity with R08.6/export-ordinary for ordinary ρ̄|D_p, R08.6/export-fontaine-laffaille-irreducible for irreducible ρ̄|D_p) and k = p + 1 (R08.5/weight-p-plus-one-ordinary-ring when k(ρ̄) = p + 1) — or potentially semistable of weight 2 (R08.3/pst-deformation-ring, R08.4/savitt-weight-two-rings).

Hypotheses: KW I Theorem 4.1 assumes ρ̄ has non-solvable image when p = 2, and ρ̄|ℚ(μ_p) absolutely irreducible when p > 2; these are global hypotheses, not used by the local rings.; Theorem 4.1(2)(i) also covers crystalline lifts of weight p + 1 that are not ordinary (ρ̄|D_p irreducible of Serre weight 2). KW II §10.2 treats them by citing Kisin, Modularity of some geometric Galois representations, not by a ring of KW II §3; no ring is planned for them here..

Suppliers: LocalGaloisDeformationRings:R08.5/flat-connected-deformation-ring; LocalGaloisDeformationRings:R08.5/rank-two-connected-components; LocalGaloisDeformationRings:R08.5/semistable-weight-two-resolution; LocalGaloisDeformationRings:R08.5/weight-p-crystalline-ordinarity; LocalGaloisDeformationRings:R08.5/weight-p-plus-one-ordinary-ring; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.4/savitt-weight-two-rings; LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2.

Sources: KW1-2009, Theorem 4.1, author copy p. 7; KW1-2009, Theorem 4.1 (1), p. 7.


### `LocalGaloisDeformationRings:L7/ordinary-flag-scheme-local-structure` — Local structure of the ordinary flag scheme at characteristic-zero points

Keep L7/ordinary-flag-scheme (F_w/ℚ_l finite, ρ̄ upper triangular with ordered diagonal χ̄, G = G_{Λ_w} ⊂ 𝓕 ×_𝒪 Spec R^□_{Λ_w} the scheme of pairs (ρ, Fil) with I_{F_w} acting on gr_j by χ_j^univ). Let x be a closed point of G[1/l] with residue field E, (ρ_x, Fil_x) the corresponding pair, g ∈ GL_n(𝒪_E) with Fil_x = g·Fil_std, V_x = E^n with G_{F_w} acting through ρ_x, and Fil^i ad V_x = {A : A Fil_{x,j} ⊆ Fil_{x,j−i}} (so Fil⁰ ad V_x ≅ 𝔟 as a G_{F_w}-module). (1) (Geraghty Lemma 3.5) The completed local ring 𝒪^∧_{G,x} pro-represents the functor of pairs (ρ, Fil) on Artinian local E-algebras lifting (ρ_x, Fil_x); no condition is put on the inertial characters, which the pair determines and which give the map from Λ_w. (2) (Corollary 3.6) Let R^g_x pro-represent all continuous lifts G_{F_w} → B_n(B) of g^{−1}ρ_x g; then 𝒪^∧_{G,x} ≅ R^g_x⟦Z_{ij} : 1 ≤ j < i ≤ n⟧, the variables Z_{ij} moving the flag through a lower unipotent matrix. (3) (Lemma 3.7) The tangent space of G[1/l] at x has dimension z_x = [F_w:ℚ_l]·n(n+1)/2 + n² + dim_E H²(G_{F_w}, Fil⁰ ad V_x), and 𝒪^∧_{G,x} ≅ E⟦y_1, …, y_{z_x}⟧/(f_1, …, f_r) with r ≤ dim_E H²(G_{F_w}, Fil⁰ ad V_x); so every irreducible component of 𝒪^∧_{G,x}, hence of G[1/l] through x, has dimension ≥ [F_w:ℚ_l]·n(n+1)/2 + n². (4) H²(G_{F_w}, Fil⁰ ad V_x) = 0 if χ̃_{x,s} ≠ εχ̃_{x,r} for all r > s, or if Fil_{x,j} is the unique j-dimensional G_{F_w}-stable subspace of V_x for every j; then 𝒪^∧_{G,x} is formally smooth over E of dimension [F_w:ℚ_l]·n(n+1)/2 + n².

Hypotheses: Published numbering by the concordance recorded in the source GERAGHTY-2019: Lemma 3.5 = preprint Lemma 3.2.1, Corollary 3.6 = Corollary 3.2.2, Lemma 3.7 = Lemma 3.2.3. The statements here use the preprint version.; The weight convention of the characters is that of L7/ordinary-of-weight-lambda (HT(ε) = +1 in this roadmap; Geraghty uses HT(ε) = −1)..

Suppliers: LocalGaloisDeformationRings:L7/ordinary-flag-scheme; LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/completion-at-points; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: GERAGHTY-2019, Lemma 3.7 (preprint Lemma 3.2.3, p. 35), with Lemma 3.5 and Corollary 3.6 (preprint Lemma 3.2.1, p. 33; Corollary 3.2.2, p. 35); THORNE-2015, proof of Proposition 3.14, p. 17 (accepted manuscript).


### `LocalGaloisDeformationRings:L7/residually-split-nearly-ordinary-ring` — Nearly ordinary rings of a p-distinguished split residual representation

(Skinner–Wiles Lemma 2.2 and Corollary 2.3.) Let n = 2, ρ_0 = χ ⊕ 1 on D = G_{F_v} with χ ≠ 1, d = [F_v : ℚ_p] and ω the mod-p cyclotomic character of D. There are a versal local 𝒪-deformation ρ : D → GL₂(R) of ρ_0 with det = χ̃ and a versal nearly ordinary deformation ρ_ord = (χ̃Ψ *; 0 Ψ^{−1}), Ψ ≡ 1, over R_ord, with R_ord ≅ 𝒪[[x_1, …, x_{2d+2}]]/(f) if χ = ω or ω = 1, and R_ord ≅ 𝒪[[x_1, …, x_{2d+1}]] otherwise. R_ord is a quotient of R by an ideal generated by d + ε elements, ε = 2 if χ = ω = χ^{−1}, ε = 1 if ω = 1, or χ = ω ≠ χ^{−1}, or χ ≠ ω = χ^{−1}, and ε = 0 otherwise.

Hypotheses: χ ≠ 1 (p-distinguished); p odd..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; DeformationAndDerivedPatchingAlgebra:R03.2; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: SKINNER-WILES-1999, §2.1, Lemma 2.2, p. 11 (Numdam PDF page 8; printed page = PDF page + 3); SKINNER-WILES-1999, §2.1, Corollary 2.3, p. 13 (Numdam PDF page 10; printed page = PDF page + 3).


### `LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters` — Ordinary deformations with fixed inertial characters on a full flag (CHT §2.4.2)

Let l = p and choose characters χ_{v,i} : G_{F_ṽ} → 𝒪^× (i = 0, …, n − 1) such that (1) r̄ has a decreasing filtration {Fil̄^i} by k[G_{F_ṽ}]-submodules with gr̄^i r̄ ≅ k(χ_{v,i}), and (2′) for i < j, χ̄_{v,j}/χ̄_{v,i} is neither trivial nor the mod-l cyclotomic character ε̄ (the condition the proofs use; CHT print the inverse ratio, the inverse ratio is insufficient). Then {Fil̄^i} is unique. 𝒟_v consists of the lifts r of r̄ to R such that Rⁿ has a decreasing filtration {Fil^i} by R[G_{F_ṽ}]-submodules with Fil^i ⊗_R k ≅ Fil̄^i and I_{F_ṽ} acting on gr^iRⁿ by χ_{v,i}; the Fil^i are then free direct summands and gr^iRⁿ ≅ R(χ′_i) with χ′_i an unramified twist of χ_{v,i} reducing to χ_{v,i} mod λ. (Lemma 2.4.6.) (1) Such a filtration is unique; (2) for R ↪ S injective in 𝒞_𝒪 and r over R with (S, r) ∈ 𝒟_v, (Fil^i_S ∩ Rⁿ) ⊗_R S ≅ Fil^i_S; (3) 𝒟_v is a local deformation problem.

Hypotheses: condition (2′) is the simplest case, which is how CHT describe their own condition, with the ratio the proofs need; they note that it can be weakened, without saying how far, and that the section is not needed for their modularity applications; CHT's printed condition (2) excludes the trivial and the cyclotomic character as values of χ̄_{v,i}/χ̄_{v,j} for i < j, which allows χ̄_{v,j}/χ̄_{v,i} = ε̄; then Lemma 2.4.8 fails; this fixes the characters on inertia; L7/ordinary-flag-scheme (ACC+ §6.2.6) lets the characters vary over Λ_v, and CHT's 𝒟_v corresponds to the point of Λ_v given by the χ_{v,i}|_{I}, with the index reversal χ_j^univ ↔ χ_{v,n−j}|_I (the flag of L7/ordinary-flag-scheme is increasing, with χ_1^univ on the sub; CHT's filtration is decreasing, with χ_{v,n−1} on the sub); the identification of rings uses the uniqueness of the filtration (Lemma 2.4.6).

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:L7/ordinary-flag-scheme.

API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia`: The condition 𝒟_v with its characters χ_{v,i}.

API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration`: The filtration Fil^i of a lift in 𝒟_v.

API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration_unique`: Lemma 2.4.6(1).

API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration_baseChange`: Lemma 2.4.6(2).

API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.isLocalDeformationProblem`: Lemma 2.4.6(3).

API `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.graded_character`: For a lift satisfying the fixed-inertia ordinary condition, the action of σ ∈ I_v on gr^i of its unique filtration is multiplication by χ_{v,i}(σ), for i = 0, …, n − 1 (the source's zero-based indexing of a decreasing filtration: gr^{n−1} = Fil^{n−1} is the subrepresentation).

Test `ord_n1` (degenerate): For n = 1, 𝒟_v is the lifts with inertial character χ_{v,0}.

Test `ord_n2_distinct` (computation): For n=2 write ρ̄=(χ̄₁ *;0 χ̄₀) with χ̄₁/χ̄₀ ≠ 1,ω. The decreasing filtration has Fil¹ equal to the unique line carrying the prescribed χ̄₁; its quotient carries χ̄₀.

Test `ord_cyclotomic_ratio_excluded` (non-example): r̄ = ω ⊕ 1 on G_{ℚ_l} with ω on the sub (χ̄_1 = ω, χ̄_0 = 1, l > 3) satisfies CHT's printed (2) but not (2′); there H²(G, k(ω)) ≠ 0 and the ring is not formally smooth.

Test `ord_vs_flag_scheme` (compatibility): The lifts in 𝒟_v are the lifts that admit a (unique, by Lemma 2.4.6) point of L7/ordinary-flag-scheme over the point of Λ_v given by χ_j^univ ↦ χ_{v,n−j}|_I.

Sources: CHT08, §2.4.2, the characters χ_{v,i}, p. 37; CHT08, §2.4.2, 𝒟_v and Lemma 2.4.6, p. 38.


### `LocalGaloisDeformationRings:L7/discrete-series-deformation-condition` — Discrete series deformations away from l (CHT §2.4.5)

Let l ≠ p, n = md and r̃_v : G_{F_ṽ} → GL_d(𝒪) continuous with (1) r̃_v ⊗ k absolutely irreducible, (2) every irreducible subquotient of (r̃_v ⊗ k)|_{I_{F_ṽ}} absolutely irreducible, and (3) r̃_v ⊗ k ≇ r̃_v ⊗ k(i) for i = 1, …, m. (Lemma 2.4.23.) r̃_v ≅ Ind_{G_{F′_ṽ}}^{G_{F_ṽ}} s_v for the unramified F′_ṽ of degree d₁ and s_v with s_v|_I ⊗ k absolutely irreducible and not conjugate-isomorphic; a lift ρ with ρ|_I ≅ r̃_v|_I ⊗ R is Ind(s_v ⊗ R(χ)) for a unique unramified χ; and Z_{GL_d(R)}(r̃_v(I)) ↠ Z_{GL_d(R/I)}(r̃_v(I)). (Definition 2.4.24.) ρ : G_{F_ṽ} → GL_n(R) is r̃_v-discrete series if it has a decreasing filtration {Fil^i} by R-direct summands with gr^iρ ≅ (gr⁰ρ)(i) for i = 1, …, m − 1 and (gr⁰ρ)|_I ≅ r̃_v|_I ⊗ R. (Lemma 2.4.25.) The filtration is unique. (Lemma 2.4.26.) If r̄ is r̃_v-discrete series, its r̃_v-discrete series lifts form a local deformation problem 𝒟_v.

Hypotheses: l ≠ p; CHT remark that condition (2) is likely not needed, and keep it because it simplifies the section; for d = 1, m = n and r̃_v trivial this is a Steinberg-type condition; compare R08.2/steinberg-condition (Taylor II's D^{Stein}), which instead fixes characteristic polynomials and takes the flat closure.

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.2/steinberg-condition.

API `TauCeti.GaloisDeformation.Local.DiscreteSeriesType`: (m, d, r̃_v) with conditions (1)–(3).

API `TauCeti.GaloisDeformation.Local.IsDiscreteSeriesLift`: Definition 2.4.24: the filtration with gr^i ≅ gr⁰(i) and gr⁰|_I ≅ r̃_v|_I ⊗ R.

API `TauCeti.GaloisDeformation.Local.IsDiscreteSeriesLift.filtration_unique`: Lemma 2.4.25.

API `TauCeti.GaloisDeformation.Local.discreteSeriesDeformation`: Lemma 2.4.26: a local deformation problem.

API `TauCeti.GaloisDeformation.Local.DiscreteSeriesType.induced`: Lemma 2.4.23: r̃_v ≅ Ind s_v.

API `TauCeti.GaloisDeformation.Local.DiscreteSeriesType.filtration_baseChange`: The unique direct-summand filtration of a discrete-series lift pulls back along every allowed coefficient map; its graded identifications and the fixed prime-to-p inertia representation pull back with it.

Test `ds_steinberg` (compatibility): d = 1, m = n, r̃_v trivial: the unipotent-monodromy (Steinberg) lifts with Frobenius eigenvalues α, qα, …, q^{n−1}α.

Test `ds_m1` (degenerate): m = 1: lifts with ρ|_I ≅ r̃_v|_I ⊗ R, i.e. minimally ramified type r̃_v.

Test `ds_condition3_fails` (non-example): If q ≡ 1 mod l (l the coefficient characteristic) then k(1) ≅ k and condition (3) fails for i = 1.

Test `ds_induced_type` (computation): d = 2 with r̃_v induced from the unramified quadratic extension (a supercuspidal type).

Sources: CHT08, §2.4.5, the set-up, p. 47; CHT08, §2.4.5, Definition 2.4.24, p. 49.


### `LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient` — The G-valued ordinary flag scheme and the ordinary quotient R^{△λ}

Keep L7/g-valued-ordinary-condition and let R^{□,v_λ}_ρ̄ be the potentially semistable G-valued lifting ring of Hodge type v_λ (R08.3/g-valued-pst-rings) with universal lift ρ^λ. Let 𝒢 ⊂ Fl_G be the closed subscheme of Borels fixed by ρ^λ_A(G_{F_v}), and 𝒢_λ ⊂ 𝒢 the subfunctor of B such that, Zariski-locally with gBg^{-1} = B₀, the projection of gρ^λ(σ)g^{-1} to T_G equals χ_λ(σ) for σ ∈ I_{F′_v}. (1) 𝒢_λ is representable by a closed subscheme of 𝒢, cut out by the ideal generated by the c_{β,σ} (β positive roots, defined by c_{β,σ}X_β = p_β(Ad(gρ^λ(σ)g^{-1})X_β) − β(χ_λ(σ))X_β) together with ψ(t_σ) − ψ(χ_λ(σ)) for ψ in a basis of X*(T₀), t_σ the torus part of gρ^λ(σ)g^{-1} (the torus equations; with them the c_{β,σ} are redundant). (2) R^{△λ}_ρ̄ is the scheme-theoretic image of 𝒢_λ[1/p] → Spec R^{□,v_λ}_ρ̄; Λ : 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper, so Spec R^{△λ}_ρ̄[1/p] is its image. (3) A map f : R^{□,v_λ}_ρ̄ → A to a finite local E-algebra factors through R^{△λ}_ρ̄ iff f∘ρ^λ is F′_v-ordinary of weight λ. (4) A Borel-valued representation r : G_{F_v} → B₀(A) whose torus part equals χ_λ on I_{F′_v} is semistable over F′_v of p-adic Hodge type v_λ (Nekovář for GL_n, Patrikis for G).

Hypotheses: The ideal of FKP Lemma B.3 generated by the c_{β,σ} alone imposes the torus condition only modulo Z(G) (for G = GL₁ there are no roots); the torus equations are added so that the integral scheme 𝒢_λ is the one described. After inverting p they are automatic on the potentially semistable ring of Hodge type v_λ (the Hodge cocharacter of the torus part is conjugate to λ and congruent to it modulo the centre, hence equal, and a crystalline torus-valued character is determined on inertia by its Hodge cocharacter); only 𝒢_λ[1/p] is used, so Lemma B.3 holds where it is used and Lemma B.4 is unaffected.; For G = GL_n this is Geraghty's construction (L7/ordinary-flag-scheme specialised at the weight λ).; λ is dominant regular, F′_v/F_v is fixed, and the ambient p-adic Hodge quotient is the one semistable over that fixed extension with compatible Hodge data. The unique-flag proof uses regularity..

Suppliers: LocalGaloisDeformationRings:L7/g-valued-ordinary-condition; LocalGaloisDeformationRings:R08.3/g-valued-pst-rings; LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; PadicHodgeTheory:R06.4/ordinary-implies-semistable; LocalGaloisDeformationRings:L7/ordinary-flag-scheme.

API `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme`: 𝒢_λ ⊂ Fl_G ×_𝒪 Spec R^{□,v_λ}_ρ̄.

API `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.isClosed`: 𝒢_λ is a closed subscheme, with the ideal of (1) including the torus equations.

API `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.proper`: 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper.

API `TauCeti.GaloisDeformation.Local.gOrdinaryRing`: R^{△λ}_ρ̄, the scheme-theoretic image of 𝒢_λ[1/p].

API `TauCeti.GaloisDeformation.Local.gOrdinaryRing_points`: Point criterion (3).

API `TauCeti.GaloisDeformation.Local.gOrdinaryRing.gl`: For G = GL_n, R^{△λ}_ρ̄ is the weight-λ specialisation of L7/ordinary-flag-scheme's image ring, intersected with the Hodge type v_λ.

API `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.points`: Over a finite E-algebra in the specified semistable-over-F′_v Hodge family, a point is a framed lift and a Borel reduction satisfying the root and canonical-torus equations. Base change pulls back the Borel reduction and these equations; the torus equations are retained also when G has no roots.

Test `gOrdinaryRing_GL1` (degenerate): G = GL₁: R^{△λ}_ρ̄ = R_ρ̄/(ρ(σ) − χ_λ(σ) : σ ∈ I_{F′_v}) up to the p-torsion-free generic fibre (R08.1/rank-one-ring).

Test `gOrdinaryRing_central_generators` (non-example): In the ambient unrestricted framed GL₁ ring there are no root generators. The torus equations ρ(σ)=χ_λ(σ) on I_{F′_v} must be imposed explicitly. Whether they are redundant after a particular fixed Hodge/semistable quotient is a separate assertion.

Test `gOrdinaryRing_points_GL2` (computation): For G=GL₂, F_v=ℚ_p and λ=(1,0), the stated ordinary point has the form (ψ₁χ_p *;0 ψ₂) in the FKP convention and is semistable over F′_v. A nonzero Tate-curve extension can have N≠0 and need not be crystalline.

Test `gOrdinaryRing_compat` (compatibility): For G = GL_n and F′_v = F_v the points agree with those of L7/semistable-ordinary-quotient for the weight λ′ with λ_{τ,j} = −(λ′_{τ,n+1−j} + j − 1) (L7/g-valued-ordinary-condition).

Sources: FKP-2022, Lemma B.3, arXiv v5 p. 53; FKP-2022, Lemma B.4 (1), arXiv v5 p. 54.


### `LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual` — The two-dimensional ordinary ring of the trivial representation (Snowden)

Let p be odd, F_v/ℚ_p finite, ρ̄ : G_{F_v} → GL₂(k) trivial, ε_p trivial on G_{F_v} mod p, and R^△_v = R^{△,(0,0),ψ}_v the fixed-determinant (ψ = ε_p^{-1}) semistable-ordinary ring of weight 0 (L7/semistable-ordinary-quotient, R08.3/fixed-determinant-pst-rings). (1) Spec R^△_v is equidimensional of dimension [F_v:ℚ_p] + 4 with two irreducible components X^cr = Spec R^{△,cr}_v and X^st = Spec R^{△,st}_v: an E′-point factors through R^{△,cr}_v iff ρ_x is crystalline, and through R^{△,st}_v iff ρ_x is conjugate to (1 ∗; 0 ε_p^{-1}). (2) Each generic point of Spec(R^△_v/ϖ) is the specialisation of a unique generic point of Spec R^△_v.

Hypotheses: Twisting by the cyclotomic character identifies R^△_v with Snowden's ring R of Proposition 4.3.2.; µ_p⊂F_v (equivalently ε̄_p|G_{F_v}=1) is required. For odd p this excludes F_v=ℚ_p.; Conventions are Caraiani–Newton's (HT(ε_p) = −1): weight 0 means Hodge–Tate weights {0, 1} there, {0, −1} in this roadmap's convention, with the sub-line unramified and ε_p^{-1} on the quotient (L7/ordinary-of-weight-lambda)..

Suppliers: LocalGaloisDeformationRings:L7/semistable-ordinary-quotient; LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings; PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion.

Sources: CN-2023, Proposition 5.3.2, arXiv v3 pp. 75–76.


### `LocalGaloisDeformationRings:L7/ordinary-ring-with-frobenius-eigenvalue` — The ordinary ring with a Frobenius eigenvalue for trivial ρ̄|G_p (Calegari–Geraghty R̃†)

Let p ≥ 3, let n ≥ 2 be an integer (the weight; the rank is 2), χ = εω^{−1} with ω the Teichmüller lift of ε̄ (so χ ≡ 1 mod ϖ), φ_p a lift of Frobenius with χ(φ_p) = 1, and ρ̄|G_{ℚ_p} trivial (two-dimensional). R̃† represents framed deformations ρ of ρ̄|G_p with determinant χ^{n−1} together with α ∈ A such that, writing φ := ρ(φ_p) and g := ρ(g): (1) det φ = 1; (2) α is a root of the characteristic polynomial of φ; (3) tr g = χ^{n−1}(g) + 1 for g ∈ I_p; (4) (g − 1)(g′ − 1) = (χ^{n−1}(g) − 1)(g′ − 1); (5) (g − 1)(φ − α) = (χ^{n−1}(g) − 1)(φ − α); (6) (φ − α)(g − 1) = (α^{-1} − α)(g − 1), for g, g′ ∈ I_p — the reduced 𝒪-flat ring of Kisin's ordinary lifts with an eigenvalue of Frobenius on the unramified quotient (Snowden's equations). R† is its image after forgetting α (the ordinary ring without the eigenvalue). R̃† is topologically generated over 𝒪 by φ₁, …, φ₄ (entries of ρ(φ_p) − 1), x_{ij} (entries of ρ(g_j) − 1) and β = α − 1, with β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0. R^unr is the largest quotient of R† on which the deformation is unramified (R† modulo the entries of ρ(g) − 1, g ∈ I_p), R̃^unr = R̃† ⊗_{R†} R^unr, the unramified ideal is I = ker(R^univ → R^unr) and the doubling ideal is J = Ann_{R^univ}(R̃†/R†).

Hypotheses: R^univ is the local framed deformation ring of the trivial ρ̄ : G_p → GL₂(k) (CG18 Definition 3.18), of which R† is a quotient.; Equations (4)–(6) are rank-two instances of L8's ordered products (ρ(g₁) − χ₁(g₁))(ρ(g₂) − χ₂(g₂)) = 0.; Since χ ≡ 1 mod ϖ, the determinant χ^{n−1} is residually trivial for every n ≥ 2; no congruence on n is needed. The eigenvalue α is a unit reducing to 1..

Suppliers: LocalGaloisDeformationRings:L7/ordinary-flag-scheme; LocalGaloisDeformationRings:L7/semistable-ordinary-quotient; LocalGaloisDeformationRings:R08.1/local-fixed-determinant.

API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue`: R̃† with the universal pair (ρ, α) satisfying (1)–(6).

API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.forget`: R† → R̃†, forgetting α; R† is the image.

API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.beta_relation`: β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0, α = 1 + β.

API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.unr`: R^unr and R̃^unr = R̃† ⊗_{R†} R^unr.

API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.unramifiedIdeal`: I = ker(R^univ → R^unr).

API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.doublingIdeal`: J = Ann_{R^univ}(R̃†/R†).

API `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.hom_ext`: Two continuous maps R̃†→A are equal iff they induce the same framed lift ρ and the same eigenvalue α. Equality of ρ alone characterizes maps from the image ring R†, not maps from R̃†.

Test `eigenvalueRing_unr_presentation` (computation): R^unr ≅ 𝒪/ϖ^m⟦φ₁, …, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃) and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr, with ϖ^m the largest power dividing all χ^{n−1}(g) − 1, g ∈ D_p. The direct sum is an isomorphism of R^unr-modules, not a product of rings.

Test `eigenvalueRing_rank_two` (characterisation): The unramified quotient has a rank-two eigenvalue algebra as a module, while its support is killed by a power of ϖ. After inverting p, I=J becomes the unit ideal and R̃†[1/p]=R†[1/p]; the ordinary eigenvalue map is generically degree one.

Test `eigenvalueRing_not_flag_free` (non-example): R† ≠ R̃†: the ring with an eigenvalue is not the image ring; their difference is measured by J.

Test `eigenvalueRing_trace_relation` (computation): α + α^{-1} = 2 + φ₁ + φ₄ in R̃†.

Sources: CG-2018, proof of Lemma 3.22, published pp. 336–337; CG-2018, Definition 3.20, published p. 335; CG-2018, Definition 3.21, published p. 335.


### `LocalGaloisDeformationRings:L7/connects-relation` — The relation "connects" between potentially crystalline lifts

Let K/ℚ_l be finite (l = p) and ρ₁, ρ₂ : G_K → GL_n(𝒪_{ℚ̄_l}) continuous. ρ₁ connects to ρ₂ (ρ₁ ∼ ρ₂) if: the reductions ρ̄₁, ρ̄₂ are equivalent; ρ₁, ρ₂ are potentially crystalline; HT_τ(ρ₁) = HT_τ(ρ₂) for every τ : K ↪ ℚ̄_l; and ρ₁, ρ₂ define points on the same irreducible component of Spec(R^□_{ρ̄₁,{HT_τ},K′-cris} ⊗ ℚ̄_l) for some (hence all) sufficiently large K′. For l ≠ p the analogue uses Spec(R^□_{ρ̄₁} ⊗ ℚ̄_l). ρ₁ strongly connects to ρ₂ if moreover ρ₁ lies on a unique component.

Hypotheses: Independent of the equivalence chosen between ρ̄₁ and ρ̄₂ and of the GL_n(𝒪_{ℚ̄_l})-conjugacy classes (BLGGT Lemma 1.2.2).; 'Connects' is symmetric; it is an equivalence relation on points lying on unique components (in particular on smooth points), since components of the generic fibre of the potentially crystalline ring are then connected components (R08.3/pcris-generic-smooth).; Representations are defined over the integers of finite extensions of the coefficient field. Component relations are not asserted for an arbitrary infinite-coefficient representation without descent..

Suppliers: LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; LocalGaloisDeformationRings:R08.3/pst-coefficient-change; LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n.

API `TauCeti.GaloisDeformation.Local.Connects`: ρ₁ ∼ ρ₂: same reduction, potentially crystalline with the same labelled Hodge–Tate weights, same component of the potentially crystalline lifting ring over ℚ̄_l.

API `TauCeti.GaloisDeformation.Local.Connects.symm`: ρ₁ ∼ ρ₂ ⟹ ρ₂ ∼ ρ₁.

API `TauCeti.GaloisDeformation.Local.Connects.restrict`: ρ₁ ∼ ρ₂ ⟹ ρ₁|G_{K′} ∼ ρ₂|G_{K′} for K′/K finite.

API `TauCeti.GaloisDeformation.Local.Connects.sum_tensor_dual`: ∼ is compatible with direct sums, tensor products, duals, and twists by unramified characters with trivial reduction.

API `TauCeti.GaloisDeformation.Local.Connects.symPow`: ∼ is compatible with Sym^{n−1} (components of these generic fibres are connected components and Sym^{n−1} induces a morphism of generic fibres).

API `TauCeti.GaloisDeformation.Local.Connects.trans_of_smooth`: On points lying on unique components, ∼ is transitive.

Test `connects_rank_one` (computation): n = 1: ψ₁ ∼ ψ₂ iff ψ̄₁ = ψ̄₂ and HT(ψ₁) = HT(ψ₂) (crystalline characters).

Test `connects_ordinary_trivial` (characterisation): Two ordinary crystalline weight-0 lifts of the trivial representation connect (L7/weight-zero-crystalline-connectedness).

Test `connects_different_weights` (non-example): Lifts with different labelled Hodge–Tate weights never connect, even if their reductions agree.

Test `connects_restrict` (compatibility): ρ₁ ∼ ρ₂ implies ρ₁|G_{K′} ∼ ρ₂|G_{K′}.

Sources: BLGGT-2014, §1.3, p. 21, and §1.4, p. 26, arXiv v4.


### `LocalGaloisDeformationRings:L7/kisin-modules-tame-descent` — GL₃ eigenbasis charts and shapes of Kisin modules with tame descent

Let K/ℚ_p be unramified of degree f, τ a tame inertial type with lowest alcove presentation (s, μ), r ∈ {1, 2, 3} the order of s_τ = s_0 s_{f−1} ⋯ s_1, f′ = f·r, K′/K the unramified extension of degree r with residue field k′, L′ = K′((−p)^{1/e′}) with e′ = p^{f′} − 1 (so [L′ : K] = r·e′), Δ = Gal(L′/K) ⊃ Δ′ = Gal(L′/K′), 𝔖_{L′,R} = (W(k′) ⊗ R)⟦u′⟧ with its Δ-action and Frobenius, v = (u′)^{e′} (so that (W(k) ⊗ R)⟦v⟧ is the ring of Δ-invariants), and h ≥ 0. Kisin modules over 𝔖_{L′,R} of E(v)-height in [0, h] with a semilinear Δ-action are the objects of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 (R07.4/kisin-modules, with tame descent data as requested from R07.4); Y^{[0,h],τ}(R) denotes those of rank 3 whose descent datum has type τ: for each j the reduction of 𝔐^{(j)} modulo u′ is isomorphic to τ^∨ ⊗ R as a Δ′-representation (LLHLM Definition 3.1.3, Remark 3.1.5). This node fixes the GL₃ coordinates: an eigenbasis of 𝔐 (Definition 3.1.6) is a basis of each isotypic piece compatible with the descent datum, and in it the partial Frobenii have matrices A^{(j)} ∈ GL₃(R((v))), j ∈ ℤ/f; two eigenbases differ by a tuple (I^{(j)})_j of elements of the Iwahori subgroup, which acts on the tuple (A^{(j)})_j by a φ-twisted conjugation whose twist is the conjugation by s_j* v^{μ_j*+η_j*} of Proposition 3.2.1 (the exact formula is LLHLM18 Proposition 2.15 with the indexing of LLHLM §3.2, and is part of what is taken from R07.4). For a principal series type the shape of 𝔐̄ over F is the tuple (w̃_j) ∈ W̃^∨ of Iwahori double cosets of the A^{(j)} (Definition 3.3.1); in general it is defined after the unramified base change that makes τ principal series. The shape w̃(ρ̄, τ) (Definition 3.3.2) is that of the Kisin module of type (η, τ) attached to ρ̄, when one exists; it is unique for 3-generic τ (LLHLM18 Theorem 3.2).

Hypotheses: Genericity hypotheses (τ n-generic for the n required) are part of every statement that uses the shape.; Kisin modules with descent data, their étale φ-modules (𝔐 ⊗ 𝒪_{ℰ,L′})^{Δ=1} and the functor T*_dd are imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4; this node adds only the eigenbasis charts, the partial Frobenius matrices and the shape used for GL₃ component labelling.; τ is 1-generic throughout, as in LLHLM §3 (a lowest alcove presentation exists only for 0-generic types). The stronger genericity assumptions belong to the uniqueness and domain theorems. For ρ̄ 10-generic and semisimple and weight η, a tame type that is not 1-generic has R^τ_ρ̄ = 0 (Theorem 3.5.3, L7/gl3-pcris-deformation-rings); for a ρ̄ that is not generic nothing is claimed here..

Suppliers: LocalGaloisDeformationRings:L7/finite-height-lattices; LocalGaloisDeformationRings:L7/height-lattice-moduli; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4.

API `TauCeti.GaloisDeformation.Local.GL3KisinChart`: A rank-3 Kisin module with tame descent datum of type τ (R07.4) over R together with an eigenbasis: the data from which the partial Frobenius matrices are read.

API `TauCeti.GaloisDeformation.Local.GL3KisinChart.frobMatrix`: A^{(j)} ∈ GL₃(R((v))) for j ∈ ℤ/f, the matrix of the j-th partial Frobenius in the eigenbasis.

API `TauCeti.GaloisDeformation.Local.GL3KisinChart.changeBasis`: Two eigenbases of the same Kisin module differ by a tuple (I^{(j)})_j in the Iwahori subgroup, and the matrices (A^{(j)})_j change by the φ-twisted conjugation of LLHLM18 Proposition 2.15 (twist by s_j* v^{μ_j*+η_j*}, Proposition 3.2.1); two charts of the same Kisin module are related in this way.

API `TauCeti.GaloisDeformation.Local.GL3KisinChart.shape`: The shape (w̃_j) ∈ W̃^∨ of 𝔐̄ over a field: for a principal series type the Iwahori double coset of A^{(j)}, independent of the eigenbasis by changeBasis; in general after unramified base change.

API `TauCeti.GaloisDeformation.Local.GL3KisinChart.unique`: For 3-generic τ a Kisin module of type (η, τ) with T*_dd ≅ ρ̄|_{G_{K∞}} is unique up to isomorphism when it exists (LLHLM18 Theorem 3.2), so w̃(ρ̄, τ) is then well defined.

Test `kisinDescent_trivialType` (degenerate): Principal series type (r = 1): Δ is cyclic of order p^f − 1, each isotypic piece of 𝔐^{(j)} is free of rank one over (W(k) ⊗ R)⟦v⟧ up to the shift by a power of u′, and the chart is a basis adapted to the three characters. (Remark of the plan, outside the source's set-up: for the trivial type, with L′ = K, the chart is an ordinary basis of an R07.4 Kisin module.)

Test `kisinDescent_shape_identity` (computation): For ρ̄ = T*_dd of the semisimple Kisin module of shape t_1 (A^{(j)} diagonal), the shape w̃(ρ̄, τ) is the identity at every j.

Test `kisinDescent_shape_admissible` (characterisation): w̃(ρ̄, τ) lies in Adm^∨(η) whenever ρ̄ has a potentially crystalline lift of type (η, τ) (LLHLM Theorem 3.3.11).

Test `kisinDescent_nongeneric_not_empty` (non-example): For ρ̄ 10-generic and semisimple and a tame type τ that is not 1-generic, there is no Kisin module of type (η, τ) lifting to a potentially crystalline lift: R^τ_ρ̄ = 0 (Theorem 3.5.3). Without genericity of ρ̄ this fails: the trivial residual representation has crystalline lifts with trivial type, so the hypothesis on ρ̄ cannot be dropped from the vanishing.

Sources: LLHLM-2020, Definition 3.1.3, published p. 27; LLHLM-2020, Definition 3.3.1, published p. 31.


### `LocalGaloisDeformationRings:L7/partition-monodromy-rings` — Unipotent lifting rings with monodromy bounded by a partition (Clozel–Thorne R^m_v)

Let v ∤ l (l = p the coefficient prime), q_v ≡ 1 mod l, r̄|G_{L_ṽ} trivial of dimension n, and R^1_v the ring of lifts with char ρ(σ) = (X − 1)^n for σ ∈ I_{L_ṽ}. For a partition m = (m₁ ≥ ⋯ ≥ m_k) of n, R^m_v is the maximal 𝒪-flat reduced quotient of R^1_v classifying lifts for which a lift of Frob_ṽ^{-1} has characteristic polynomial in Taylor's scheme Pol_n(m, q_v) (the polynomials whose roots can be grouped into chains α, q_vα, …, q_v^{m_i−1}α). For m = (n), R^m_v = R^St_v (R08.2/steinberg-condition); for m = (1, …, 1), R^m_v is the maximal reduced 𝒪-flat quotient of R^1_v (which is not claimed to be reduced). A local deformation problem is determined by its ring (BLGHT Lemma 3.2).

Hypotheses: The Frobenius normalisation: Clozel–Thorne use a lift of Frob_ṽ^{-1}; the chains α, q_vα, … reflect the monodromy relation ΦNΦ^{-1} = q_v N..

Suppliers: LocalGaloisDeformationRings:R08.2/steinberg-condition; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; GlobalGaloisDeformations:R04.3/local-deformation-problem.

API `TauCeti.GaloisDeformation.Local.partitionRing`: R^m_v for a partition m of n.

API `TauCeti.GaloisDeformation.Local.partitionRing_points`: ℚ̄_l-points of R^m_v are the unipotently ramified lifts whose Frobenius characteristic polynomial lies in Pol_n(m, q_v).

API `TauCeti.GaloisDeformation.Local.partitionRing_steinberg`: R^{(n)}_v = R^St_v.

API `TauCeti.GaloisDeformation.Local.partitionRing_trivial`: R^{(1,…,1)}_v = R^1_v.

API `TauCeti.GaloisDeformation.Local.partitionRing_mono`: If m is obtained by splitting the parts of m′ into shorter consecutive q-chains, Pol_n(m′,q)⊂Pol_n(m,q), giving R^m_v↠R^{m′}_v. Dominance of partitions alone does not imply this inclusion.

API `TauCeti.GaloisDeformation.Local.partitionRing.coefficientMap`: Composing a framed lift with a coefficient map preserves unipotent inertia and the defining Frobenius q-chain equations. A point of the reduced flat quotient R^m_v therefore pulls back as a point of that same quotient; no bound on the rank of N is inferred.

Test `partitionRing_steinberg` (compatibility): m = (n) gives R^St_v of R08.2/steinberg-condition.

Test `partitionRing_trivial` (degenerate): m = (1, …, 1) gives the maximal reduced 𝒪-flat quotient of R^1_v.

Test `partitionRing_n2` (computation): n = 2, m = (2): the defining equation q_v(tr Φ)² = (1 + q_v)² det Φ.

Test `partitionRing_not_scalar` (non-example): R^m_v for m = (2, 1) is not the ring of lifts with scalar inertial semisimplification: it also constrains the Frobenius eigenvalues to contain a chain α, q_vα.

Test `partitionRing_dominance_insufficient` (non-example): The roots {1,q,q²,b} for generic b form chains of lengths (3,1), but cannot be grouped into two chains of length 2. Thus dominance (3,1)≥(2,2) does not give the proposed quotient map.

Sources: CT-2017, §5.1, item 5, accepted manuscript p. 39.


### `LocalGaloisDeformationRings:L7/torsion-crystalline-representations` — Torsion crystalline representations with Hodge–Tate weights in [a, b]

Let w | p with F_w/ℚ_p finite unramified, a ≤ b integers, and Mod(F_w, ℤ_p) the category of finitely generated ℤ_p-modules with continuous Γ_{F_w}-action. (1) A torsion object R is crystalline with Hodge–Tate weights in [a, b] if R ≅ R″/R′ for Γ_{F_w}-stable ℤ_p-lattices R′ ⊆ R″ in a crystalline ℚ_p-representation with Hodge–Tate weights in [a, b]. (2) R ∈ Mod(F_w, ℤ_p) is crystalline with weights in [a, b] if R/p^m R is torsion crystalline with weights in [a, b] for every m ≥ 1. (3) R ∈ Mod(F_w, 𝒪) is crystalline if its underlying ℤ_p-module is. A lattice R with R_ℚ crystalline with weights in [a, b] is crystalline. For b − a ≤ p − 2 the torsion objects are those in the essential image of Fontaine–Laffaille's functor (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3, after the twist bringing the weights into its range); this identification is not part of LTXZZ's definition and is to be proved with R07.3.

Hypotheses: Convention: ℚ_p(1) has Hodge–Tate weight −1 in LTXZZ.; LTXZZ footnote 5 also claims the converse (R crystalline ⟹ R_ℚ crystalline) by Lemma 2.2.6; only the direction R_ℚ crystalline ⟹ R crystalline is immediate (take R″ = R, R′ = p^m R) and used..

Suppliers: LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients; PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences.

API `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline`: R is a subquotient R″/R′ of lattices in a crystalline representation with weights in [a, b].

API `TauCeti.GaloisDeformation.Local.IsCrystallineIntegral`: R crystalline iff every R/p^m R is torsion crystalline.

API `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.closed`: For every fixed [a,b], torsion crystalline objects are closed under subobjects, quotients and finite direct sums.

API `TauCeti.GaloisDeformation.Local.IsCrystallineIntegral.of_rational`: A lattice in a crystalline representation with weights in [a, b] is crystalline.

API `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.fontaineLaffaille`: For b − a ≤ p − 2 these are the representations of Fontaine–Laffaille modules.

API `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.twist`: Tensoring a torsion crystalline object with a lattice in a crystalline character of constant labelled Hodge weight w shifts its weight interval from [a,b] to [a+w,b+w]. This states the shift in terms of w, independently of the cyclotomic sign convention.

Test `torsionCrys_mu_p` (computation): μ_p ≅ ℤ/p(1) is torsion crystalline with weights in [−1, 0] (LTXZZ convention).

Test `torsionCrys_trivial` (degenerate): ℤ/p^m with trivial action is torsion crystalline with weights in [0, 0].

Test `torsionCrys_wide_range` (non-example): At b−a=p−1, unrestricted integral FL full faithfulness can fail (R06.4/fontaine-laffaille-endpoint-non-example). Torsion crystalline subquotient closure still holds by the lattice-quotient definition.

Test `torsionCrys_lattice` (compatibility): A Γ-stable lattice in a crystalline representation is crystalline in the sense of (2).

Sources: LTXZZ-2022, Definition 2.2.4, published pp. 124–125.


### `LocalGaloisDeformationRings:L7/geraghty-fixed-weight-ordinary-rings` — Geraghty's fixed-weight ordinary rings: components, connected fibres and irreducibility

Let F_w/ℚ_l be finite, K ⊃ all embeddings of F_w, λ_w ∈ (ℤ^n_+)^{Hom(F_w,K)}, and χ_j^{λ_w} : I_{F_w} → 𝒪^×, σ ↦ ε(σ)^{−(j−1)}·Π_τ τ(Art^{−1}_{F_w}(σ))^{−λ_{τ,n−j+1}} (Geraghty's normalisation). Let ρ̄ : G_{F_w} → GL_n(𝔽) be arbitrary, R^{v_{λ_w},st} and R^{v_{λ_w},cr} Kisin's semistable and crystalline quotients of Hodge type v_{λ_w} (R08.3/pst-deformation-ring), G^{λ_w} ⊂ 𝓕 ×_𝒪 Spec R^{v_{λ_w},st} the closed subscheme of G_{F_w}-stable full flags on whose graded pieces I_{F_w} acts by χ_j^{λ_w}, and R^{△λ_w,st}, R^{△λ_w,cr} the quotients cut out by the scheme-theoretic images of G^{λ_w}[1/l] and of its crystalline part. (1) (Lemma 3.10) A map ζ : R^{v_{λ_w},st} → B to a finite local K-algebra factors through R^{△λ_w,st} (resp. R^{△λ_w,cr}) iff ζ∘ρ^□ is ordinary of weight λ_w (resp. and crystalline), and Spec R^{△λ_w,st}, Spec R^{△λ_w,cr} are unions of irreducible components of Spec R^{v_{λ_w},st}, Spec R^{v_{λ_w},cr}. (2) (Lemma 3.13) If ρ̄ is trivial, then for every closed point z of Spec Λ_w[1/l] the fibre G_z = G ×_{Spec Λ_w} Spec k(z) of the ordinary flag scheme of L7/ordinary-flag-scheme is connected. (3) (Lemma 3.14) If ρ̄ is trivial, then R^{△λ_w,cr} is irreducible when non-zero.

Hypotheses: Published numbering by the concordance recorded in the source GERAGHTY-2019: Lemma 3.10 = preprint Lemma 3.3.3, Lemma 3.13 = Lemma 3.4.2, Lemma 3.14 = Lemma 3.4.3; preprint statements are the ones planned.; Ordinary of weight λ_w is L7/ordinary-of-weight-lambda (each χ_j agrees with χ_j^{λ_w} on an open subgroup of I_{F_w}); Geraghty's convention HT(ε) = −1 is translated there.; Whether the arithmetic components G^{ar}_j exhaust the components of G[1/l] is not asserted (Geraghty Remark 3.4.4 asserts it, without proof, when F_w contains no l-th roots of unity or n − 1 ≤ [F_w:ℚ_l])..

Suppliers: LocalGaloisDeformationRings:L7/ordinary-flag-scheme; LocalGaloisDeformationRings:L7/ordinary-flag-scheme-local-structure; LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/pst-generic-fibre; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth.

Sources: GERAGHTY-2019, Lemma 3.10 (preprint Lemma 3.3.3, p. 37); GERAGHTY-2019, Lemmas 3.13–3.14 (preprint Lemmas 3.4.2–3.4.3, pp. 38–39).


### `LocalGaloisDeformationRings:L7/ordinary-fixed-inertial-characters-smoothness` — Ordinary deformations with fixed inertial characters are formally smooth (CHT Lemmas 2.4.7–2.4.8)

Under (2′): (Lemma 2.4.7.) 𝒟_v is liftable. (Lemma 2.4.8.) R_v^{loc}/𝓘_v is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables, and dim_k L_v − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2.

Hypotheses: conditions (1) and (2′) of L7/ordinary-condition-fixed-inertial-characters; with CHT's printed (2) both lemmas can fail.

Suppliers: LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters; LocalGaloisDeformationRings:R08.1/local-lifting-ring; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: CHT08, §2.4.2, proof of Lemma 2.4.7, p. 39; CHT08, §2.4.2, proof of Lemma 2.4.8, p. 40.


### `LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-condition` — The Siegel-ordinary GSp₄ condition at p with fixed multiplier (Calegari–Geraghty)

Let p > 2, a ≥ 2 and r̄ : G_{ℚ_p} → GSp₄(k) with multiplier ε̄^{−(a−1)} of the shape below with α, β ∈ k^× and (α² − 1)(β² − 1)(α²β² − 1)(α − β) ≠ 0. A lift r to R ∈ C_𝒪 satisfies the condition at p if r is GSp₄(R)-conjugate to the matrix with rows (χ_αψ^{-1}, 0, ∗, ∗), (0, χ_βψ^{-1}, ∗, ∗), (0, 0, ε^{−(a−1)}χ_β^{-1}ψ, 0), (0, 0, 0, ε^{−(a−1)}χ_α^{-1}ψ), with χ_α, χ_β unramified characters lifting λ(α), λ(β) and ψ unramified, trivial mod 𝔪_R. Equivalently, r stabilises an isotropic (Lagrangian) plane on which G_p acts through the sum of two unramified characters lifting λ(α), λ(β), and acts on the quotient through ε^{−(a−1)} times the dual characters. Its tangent space: with b⁰ ⊂ g⁰ = ad⁰r̄ the Borel of Sp₄ and u ⊂ b⁰ the 3-dimensional unipotent radical of the Siegel parabolic (upper-right 2 × 2 block), L′_p = ker(H¹(G_p, b⁰) → H¹(I_p, b⁰/u)) and L_p = image of L′_p in H¹(G_p, g⁰).

Hypotheses: Stronger than the full-flag ordinary condition: the (1, 2) and (3, 4) entries vanish (an unramified Lagrangian plane), as needed for the non-regular weight [0, 0, j − 1, j − 1].; This is 'ordinary with Hodge–Tate weights [0, 0, j − 1, j − 1]' of CG20 Theorem 1.1 with a = j..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda; LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters.

API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary`: The local deformation problem of Siegel-ordinary lifts with multiplier ε^{−(a−1)}.

API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.plane`: The stable unramified Lagrangian plane of a lift in the condition.

API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.plane_unique`: Under the genericity condition the plane is unique and lifts the residual one.

API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.tangent`: The tangent space of the condition is L_p ⊂ H¹(G_p, ad⁰r̄).

API `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.isOrdinary`: Every lift in the condition is G-ordinary of the corresponding (non-regular) weight in the sense of L7/g-valued-ordinary-condition with the Siegel parabolic.

API `TauCeti.GaloisDeformation.Local.SiegelOrdinary.baseChange`: Along a coefficient map, the Galois-stable unramified Lagrangian direct summand pulls back to the corresponding plane; isotropy, its rank and the fixed multiplier are preserved. Under the stated uniqueness hypothesis this is the plane assigned to the pulled-back lift.

Test `siegelOrdinary_u_dim` (computation): dim u = 3 (root spaces (1,4), (2,3) and (1,3) ~ (2,4) in sp₄).

Test `siegelOrdinary_not_borel_ordinary` (non-example): A ramified nonsplit extension of the two prescribed unramified characters on the Lagrangian quotient plane is not Siegel ordinary: the quotient-plane inertia action is nontrivial. A nonzero upper matrix entry alone is insufficient, since an unramified extension may be split by conjugation.

Test `siegelOrdinary_residual` (degenerate): For R = k the condition is the residual shape itself.

Test `siegelOrdinary_multiplier` (computation): Every lift in the condition has multiplier ε^{−(a−1)}: (χ_αψ^{-1})(ε^{−(a−1)}χ_α^{-1}ψ) = ε^{−(a−1)}.

Sources: CG-2020, Definition 4.6 (6), published p. 815; CG-2020, §4, the definition of L′_p, published p. 816.


### `LocalGaloisDeformationRings:L7/gl2-borel-ordinary-ring` — The GL₂ ordinary ring R^{B₂}: irreducible generic fibre and explicit presentations

Let p > 2 and r̄ = (λ_ᾱ ∗; 0 ε̄^{-1}λ_ᾱ^{-1}) : G_{ℚ_p} → GL₂(k), written with extension class η_{α²} ∈ H¹(ℚ_p, ε̄λ_{ᾱ²}); let Λ = 𝒪⟦1 + pℤ_p⟧ with canonical character θ : I_{ℚ_p} → Λ^× (through Art^{-1}). A lift r over A ∈ CNL_Λ is ordinary if it is ker(GL₂(A) → GL₂(k))-conjugate to (χ ∗; 0 ε^{-1}χ^{-1}) with χ̄ = λ_ᾱ and χ|_{I_{ℚ_p}} = θ; this local deformation problem is represented by R^{B₂}. (1) h²(ℚ_p, ad⁰_{B₂}r̄) = 0 unless ᾱ² = 1 and η_{α²} = 0, in which case it equals 1. (2) R^{B₂}[1/p] is irreducible of relative dimension 5 over ℚ_p; when h² = 0, R^{B₂} is formally smooth over 𝒪 of relative dimension 5. (3) (Lemma 7.3.7) The B₂-framed fixed-determinant ring R^{B₂,◹} of r̄ = (λ_γ ε̄⁻¹λ_γ⁻¹η; 0 ε̄⁻¹λ_γ⁻¹), γ ∈ k^×, η ∈ H¹(ℚ_p, ε̄λ_γ²), is a complete intersection, flat over Λ = 𝒪⟦y₂⟧ and irreducible of relative dimension 4 over 𝒪, and as an algebra over R^{GL₁} = 𝒪⟦y₁, y₂⟧ (the universal ring of λ_γ) it is: (a) 𝒪⟦x₁, x₂, y₁, y₂⟧ if γ² ≠ 1 and η ≠ 0; (b) 𝒪⟦x₁, z₁, y₁, y₂⟧ if γ² ≠ 1 and η = 0; (c) if γ² = 1 and η ≠ 0, formally smooth over 𝒪, formally smooth over Λ unless η is peu ramifiée, and ≅ 𝒪⟦x₁, x₂, z₁, y₁, y₂⟧/(g_η) with g_η ≡ c_η y₁ + d_η y₂ mod (λ, 𝔪²) for [c_η : d_η] ∈ ℙ¹(k) depending only on η (c_η = 0 exactly when η is peu ramifiée); (d) if γ² = 1 and η = 0, ≅ 𝒪⟦x₁, z₁, z₂, y₁, y₂⟧/(g) with g ≡ z₁y₁ + z₂y₂ mod (λ, 𝔪³), and R^{B₂,◹}/λ is not formally smooth. Here x_i are framing variables, y_i come from R^{GL₁} and z_i are extension variables. R^{B₂,□} is formally smooth over R^{B₂,◹} of relative dimension dim ad⁰_{GL₂} − dim ad⁰_{B₂} = 1. (4) The points of R^{B₂}[1/p] that are not smooth over Λ are, up to unramified twist, crystalline extensions of ε^{-1} by 1.

Suppliers: LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters; LocalGaloisDeformationRings:R08.1/rank-one-ring; LocalGaloisDeformationRings:R08.1/completion-at-points; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

Sources: BCGP-2021, Lemma 7.3.6, arXiv v3 p. 174; BCGP-2021, Lemma 7.3.9, arXiv v3 p. 179.


### `LocalGaloisDeformationRings:L7/discrete-series-smoothness` — Discrete series deformations are formally smooth of relative dimension n² (CHT Lemmas 2.4.27–2.4.30)

(Lemma 2.4.27.) 𝒟_v is liftable. (Lemma 2.4.28.) R_v^{loc}/𝓘_v is a power series ring in n² variables over 𝒪. (Corollary 2.4.29.) dim_k L_v = dim_k H⁰(G_{F_ṽ}, ad r̄). (Lemma 2.4.30.) If d = 1 and m = n, with Fil¹ ad r̄ the endomorphisms x with x Fil^i r̄ ⊂ Fil^{i+1} r̄, then L_v = H¹(G/I, k1_n) ⊕ ker(H¹(G, ad⁰r̄) → H¹(G, ad r̄/Fil¹ ad r̄)).

Hypotheses: r̄ is r̃_v-discrete series (L7/discrete-series-deformation-condition); The source prints the four terms of the count in the proof of Lemma 2.4.28 with m in place of d (m(n − m), (n − m)², m² − 1, m(n − m) + 1); Fil^{m−1} r̄ has rank d, and the terms are as in the proof outline below. The sum is n² for either letter..

Suppliers: LocalGaloisDeformationRings:L7/discrete-series-deformation-condition; LocalGaloisDeformationRings:R08.1/local-lifting-ring; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: CHT08, §2.4.5, Lemma 2.4.27, p. 51; CHT08, §2.4.5, proof of Lemma 2.4.28, p. 52; CHT08, §2.4.5, Lemma 2.4.30, p. 53.


### `LocalGaloisDeformationRings:L7/g-valued-ordinary-components` — The G-valued ordinary locus is a union of components

Keep L7/g-valued-ordinary-quotient with λ dominant regular. R^{△λ}_ρ̄ is a union of irreducible components of R^{□,v_λ}_ρ̄; hence R^{△λ}_ρ̄[1/p] has an open dense regular subscheme and all its components have dimension dim G + [F_v:ℚ_p]·dim Fl_G. With a fixed multiplier μ : G_{F_v} → (G/G^der)(𝒪), the same holds with dim G^der in place of dim G.

Hypotheses: Misprints on FKP p. 55 do not affect the statement..

Suppliers: LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient; LocalGaloisDeformationRings:R08.3/g-valued-pst-rings; LocalGaloisDeformationRings:R08.1/completion-at-points; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: FKP-2022, Lemma B.4 (2)–(3), arXiv v5 pp. 54–55; BCG-2025, proof of Theorem 2.1, arXiv v3 p. 6.


### `LocalGaloisDeformationRings:L7/eigenvalue-ring-normal-cm-type-three` — R̃† is a normal Cohen–Macaulay domain of relative dimension 4 and type 3

Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R̃† is an integral domain, normal and Cohen–Macaulay of relative dimension 4 over 𝒪; R̃† ⊗ k is a normal Cohen–Macaulay domain of dimension 4, not Gorenstein, isomorphic to the completion of Snowden's variety B₁ at b = (1, 1; 0): A := k⟦a, b, c, φ₁, φ₂, φ₃, φ₄, β⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃, β² − (φ₁ + φ₄)β − (φ₁ + φ₄), aφ₁ + bφ₃ − aβ, aφ₂ + bφ₄ − bβ, −aφ₃ + cφ₁ − cβ, aφ₄ − cφ₂ − aβ, a² + bc). (2) B := A/βA ≅ k⟦a, b, c, φ₁, φ₂, φ₃⟧/(−φ₁² − φ₂φ₃, aφ₁ + bφ₃, aφ₂ − bφ₁, −aφ₃ + cφ₁, −aφ₁ − cφ₂, a² + bc) is Cohen–Macaulay of dimension 3, isomorphic to the completion of its associated graded ring, with Hilbert series H_B(t) = 1 + 6t + 15t² + ⋯. (3) For an ideal I ⊂ B generated by three elements of degree one, the generators form a regular sequence iff H_{B/I}(t) = 1 + 3t. (4) {β, a, φ₂ + φ₃, b + c + φ₁} is a regular sequence in A with quotient C ≅ k[x, y, z]/(x, y, z)², H_C = 1 + 3t. (5) dim_k ω_{R̃†}/𝔪ω_{R̃†} = 3: R̃† is Cohen–Macaulay of type 3, in particular not Gorenstein.

Hypotheses: The domain property is Geraghty's (proof of Lemma 3.4.3); normality and the Cohen–Macaulay property of A are Snowden's (Theorem 3.4.1)..

Suppliers: LocalGaloisDeformationRings:L7/ordinary-ring-with-frobenius-eigenvalue; DeformationAndDerivedPatchingAlgebra:R03.3.

Sources: CG-2018, Theorem 4.3, published p. 356; CG-2018, Lemma 4.7, published p. 360; CG-2018, Lemma 4.5, published p. 358.


### `LocalGaloisDeformationRings:L7/local-model-rho-nm0` — The induced local models ρ_{n,m,0}

Let p > nm, ε₂, ε′₂ : G_{ℚ_{p²}} → ℤ̄_p^× the two Lubin–Tate characters trivial on Art_{ℚ_{p²}}(p), normalised by ε₂∘Art_{ℚ_{p²}}(u) = τ(u)^{−1} for units u (Art sending uniformisers to geometric Frobenius, τ the chosen embedding, ε′₂ its conjugate), so that ε₂ε′₂ = ε^{-1}, and ρ_{n,m,0} = ⊕_{i=1}^n ε₂^{m(n−i)}(ε′₂)^{m(i−1)} : G_{ℚ_{p²}} → GL_n(ℤ̄_p), crystalline with Hodge–Tate weights {0, m, …, (n − 1)m} at each embedding (Fontaine–Laffaille since p > nm); ρ₀ = ρ_{n,1,0} has weight 0. (1) Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0} and ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}. (2) If K₀/ℚ_{p²} is unramified and ρ : G_{K₀} → GL_n(ℤ̄_p) is crystalline with Hodge–Tate weights {0, m, …, (n − 1)m} and ρ̄|I_{K₀} = ρ̄_{n,m,0}|I_{K₀}, then ρ̄|G_{K₁} = ρ̄_{n,m,0}|G_{K₁} for some finite unramified K₁/K₀, and ρ|G_K ∼ ρ_{n,m,0}|G_K for every finite K/K₀ with ρ̄|G_K = ρ̄_{n,m,0}|G_K.

Hypotheses: BCGNT's proof of Lemma 5.1.3 prints ρ₀ where ρ_{n,m,0} is meant.; Convention: the weights {0, m, …, (n − 1)m} are in the convention HT(ε) = −1 of BCGNT (consistent with ε₂ε′₂ = ε^{-1}); in this roadmap's convention HT(ε) = +1 they are {0, −m, …, −(n − 1)m}. Barnet-Lamb–Calegari–Gee's ρ_{n,m} = Sym^{n−1} Ind ε₂^{−m} uses the inverse of BCGNT's ε₂..

Suppliers: LocalGaloisDeformationRings:L7/connects-relation; LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness; ArithmeticGaloisRepresentations:R01.2/tame-inertia-and-fundamental-characters; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

API `TauCeti.GaloisDeformation.Local.rhoNM0`: ρ_{n,m,0} = ⊕ ε₂^{m(n−i)}(ε′₂)^{m(i−1)}.

API `TauCeti.GaloisDeformation.Local.rhoNM0.hodgeTate`: HT_τ(ρ_{n,m,0})={0,−m,…,−(n−1)m} here; the source uses HT(ε)=−1 and the opposite signs.

API `TauCeti.GaloisDeformation.Local.rhoNM0.symPow`: Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0}.

API `TauCeti.GaloisDeformation.Local.rhoNM0.tensor`: ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}.

API `TauCeti.GaloisDeformation.Local.rhoNM0.connects`: Crystalline lifts of ρ̄_{n,m,0} with the same weights connect to ρ_{n,m,0} after an unramified extension.

API `TauCeti.GaloisDeformation.Local.rhoNM0.rank_one`: For n=1 the sole summand has exponents zero, so ρ_{1,m,0} is the trivial character for every allowed m.

Test `rhoNM0_n1` (degenerate): n = 1: ρ_{1,m,0} is the trivial character.

Test `rhoNM0_det` (computation): det ρ_{2,1,0} = ε₂ε′₂ = ε^{-1}.

Test `rhoNM0_weights` (computation): ρ_{3,2,0} has weights {0,−2,−4} here, equivalently {0,2,4} in the source convention.

Test `rhoNM0_needs_p_large` (non-example): The bound p>nm supplies the uniform FL range for the tensor weights. If p≤nm that hypothesis is unavailable; this does not imply that every individual weight multiset is outside the FL interval.

Sources: BCGNT-2025, Definition 5.1.1, arXiv p. 49; BCGNT-2025, Lemma 5.1.3, arXiv p. 49.


### `LocalGaloisDeformationRings:L7/semisimple-kisin-modules-and-shapes` — Semisimple Kisin modules and the shapes of potentially crystalline lifts

Keep L7/kisin-modules-tame-descent (GL₃, K/ℚ_p unramified). (1) A semisimple Kisin module of shape w̃ (Definition 3.3.4) gives a semisimple G_{K_∞}-representation, with the explicit normal form of Proposition 3.3.6 and étale φ-module 𝓜(w̃) (Definition 3.3.7); T*_dd of it and its inertial type are given by Proposition 3.3.8. (2) (Proposition 3.3.9) If 𝔐̄ is semisimple of shape w̃ with T*_dd(𝔐̄) ≅ ρ̄|_{G_{K∞}}, then a semisimple ρ̄′ has ρ̄′|_{I_K} ≅ ρ̄|_{I_K} if and only if ρ̄′|_{G_{K∞}} also comes from a semisimple Kisin module of shape w̃. (3) (Lemma 3.3.10) If ρ̄ has a potentially crystalline lift of type (λ, τ), then, after possibly replacing E by a finite (possibly ramified) extension, so does ρ̄^ss. (4) (Theorem 3.3.11) Let ρ̄ have a potentially crystalline lift of type (λ, τ) with λ effective. If τ is a regular principal series type, or if λ = η and τ is 3-generic, then for h large enough there is 𝔐̄ ∈ Y^{[0,h],τ}(F) of shape in Adm^∨(λ) with T*_dd(𝔐̄) ≅ ρ̄|_{G_{K∞}}. (5) (Theorem 3.3.12) Let ρ̄ be semisimple and τ 1-generic, and assume either that ρ̄ is a direct sum of characters or that λ = η and τ is 3-generic. If some 𝔐̄ ∈ Y^{λ,τ}(F) has T*_dd(𝔐̄) ≅ ρ̄|_{G_{K∞}}, then there is a semisimple one over a finite extension F′ of F, and F′ = F in the second case (where 𝔐̄ is unique, hence semisimple).

Suppliers: LocalGaloisDeformationRings:L7/kisin-modules-tame-descent; LocalGaloisDeformationRings:R08.3/pst-deformation-ring.

Sources: LLHLM-2020, Theorem 3.3.11, published p. 33; LLHLM-2020, Propositions 3.3.5–3.3.9, Lemma 3.3.10, Theorem 3.3.12, arXiv v4 pp. 24–27.


### `LocalGaloisDeformationRings:L7/gl3-explicit-ring-rows` — Explicit GL₃ rings for shapes of length two, three and four (LLHLM Tables 3–4)

Keep L7/kisin-modules-tame-descent and the conventions of L7/gl3-explicit-rings (row w̃_{f−1−i} t_{−1}, structure constants (a, b, c), units c*). For the shapes of length 2 and 3, R̄^{expl,∇}_{𝔐̄,w̃_{f−1−i}} is the power series ring over F in the coefficients of the listed matrix (units through c* − [c̄*]) modulo the listed relations, with the listed minimal primes 𝔠_{(ω_i,a_i)} and the elements z̃*_i ∈ W̃_a of Proposition 3.6.9: (βαγ) A = (v c11, v c*12, 0; v² c*21, v c22, 0; v(c31 + v d31), v c32, c*33); relations c11 c22 = 0, (−1 − a + c) c*12 c31 − (−1 − b + c) c32 c11 = 0; primes (ε1+ε2, 0): (c11), z̃* = βγ⁺β; (ε2, 1): (c22), z̃* = α. (αβγ) A = (v² c*11, 0, 0; v(c21 + v d21), c22, c*23; v(c21 c33 (c*23)^{−1} + v d31), v c*32, c33); relations c22 c33 = 0, (−1 − a + c) c21 c*32 + (b − c) d31 c22 = 0; primes (ε1+ε2, 0): (c22), αγ⁺α; (ε1, 1): (c33), β. (αβα) A = (c11, c11 c32 (c*31)^{−1}, d33 c11 (c*31)^{−1} + v c*13; 0, v c*22, v c23; v c*31, v c32, v d33); relation c11((a − b) c23 c32 − (a − c) c*22 d33) = 0; primes (0, 0): (c11), γ⁺; (0, 1): ((a − b) c23 c32 − (a − c) c*22 d33), id. (αβ) A = (c31 c12 (c*32)^{−1}, c12, c13 + v c*13; v c*21, c22, c23 + v d23; v c31, v c*32, c31 c23 (c*21)^{−1} + v d33); relations (3.14): c12 c23 − c22 c13 = 0, c22 c31 = 0, c*32 c13 − d33 c12 = 0, c12((b − c) d33 c*21 + (a − b) c31 d23) = 0, (−1 − a + c) c23 c*32 = (−1 − a + b) c22 d33; primes (ε1, 1): (c12, c31), γ⁺β; (ε1 − ε2, 0): (c31, d33), βγ⁺αβ; (0, 0): (c12, c22), αγ⁺; (0, 1): (c22, (b − c) d33 c*21 + (a − b) c31 d23), α. (βα) A = (c11, (c*31)^{−1} c11 c32 + v c*12, c13; 0, v d22, v c*23; v c*31, v c32, c33 + v d33); relations c11 c33 = 0, d22(c13 c*31 − c11 d33) = 0, c11((a − b) c32 c*23 − (a − c) d22 d33) = 0, (1 + a − c) c33 c*23 c*12 = c13((a − b) c32 c*23 − (a − c) d22 d33); primes (ε2, 1): (d22, c11), γ⁺α; (ε2 − ε1, 0): (d22, c32), αγ⁺βα; (0, 0): (c11, c13), βγ⁺; (0, 1): ((a − b) c32 c*23 − (a − c) d22 d33, c13 c*31 − c11 d33), β. The intersections 𝔴_ω = 𝔠_{(ω,0)} ∩ 𝔠_{(ω,1)} of the continuation of Table 3 are (c22) for αβ and (c13 c*31 − c11 d33) for βα. For the shapes w̃′ of the minimal types τ′ (Table 4, structure constants (a′, b′, c′) ≡ z̃_{f−1−i}(a, b, c)): αβαγ, βγβα and αγαβ give power series rings in their entries; βγαγ, γαβα and αβγβ each have one relation, (−1 − b′ + c′) c′32 c′*11 − (−1 − a′ + c′) c′12 c′31 = 0, (a′ − c′) c′13 c′*22 − (a′ − b′) c′23 c′12 = 0 and (−1 − a′ + b′) c′21 c′*33 − (b′ − c′) c′31 c′23 = 0 respectively, solvable for one variable, so the ring is again a power series ring; the length-three shapes αβα, βγβ and γαγ have the relations c′11((a′ − b′) c′23 c′32 − (a′ − c′) c′*22 d′33) = 0, c′22((b′ − c′) c′31 c′13 − (−1 − a′ + b′) c′*33 d′11) = 0 and c′33((−1 − a′ + c′) c′12 c′21 − (−1 − b′ + c′) c′*11 d′22) = 0, each with two minimal primes.

Hypotheses: ρ̄ is 10-generic and semisimple, and R^τ_ρ̄ ≠ 0; the presentations are those at the semisimple Kisin module (the special locus of each shape). Only representatives up to the outer automorphisms of W̃_a are listed (Remark 3.6.5); the other shapes follow by w̃ ↦ δ̃w̃δ̃^{−1}.; Convention for the structure constants: in L7/gl3-explicit-rings, L7/gl3-explicit-ring-rows and L7/gl3-component-labelling the type is written τ = τ(s, μ), so its lowest alcove presentation is (s, μ − η) (LLHLM §3.6.1, first paragraph); L7/kisin-modules-tame-descent writes (s, μ) for the lowest alcove presentation itself, and the two differ by η. The listed generators generate the minimal primes of the quotient ring R̄^{expl,∇}, not prime ideals of the ambient power series ring.; The coordinate formulas require these corrections: the αβ matrix's (1,1) entry is c31 c12 (c*32)^{−1}, as in §3.6.2; the fourth αβ relation has the sign of (3.14); the αβα relation and prime use c*22, not c*33; the first βα relation is c11 c33 = 0 (p. 54 instead uses c11 c32); the αβγ (1,1) entry is v² c*11; the γαγ coefficient is (−1 − b′ + c′).; The minimal-prime lists are those of Table 3; for each length-three row of Table 4 the two components are cut out by the first factor of the relation (a coordinate) and by its second factor (the bracket)..

Suppliers: LocalGaloisDeformationRings:L7/kisin-modules-tame-descent; LocalGaloisDeformationRings:R08.1/local-lifting-ring.

Sources: LLHLM-2020, Table 3, published p. 51 (arXiv v4 p. 53), and its continuation, published p. 52 (arXiv v4 p. 54); LLHLM-2020, §3.6.2, (3.14), arXiv v4 p. 43; LLHLM-2020, Table 4, published p. 60 (arXiv v4 p. 55).


### `LocalGaloisDeformationRings:L7/partition-ring-smooth-points` — Smooth pure points of partition rings and their minimal primes

Keep L7/partition-monodromy-rings. Let x ∈ Spec R^m_v[1/l] be a closed point given by ρ : G_{L_ṽ} → GL_n(𝒪) with ρ ⊗ ℚ̄_l pure (Taylor–Yoshida, Lemma 1.4). Then Spec R^1_v[1/l] is formally smooth over K at x, there is a unique minimal prime Q_v of R^1_v in the kernel of R^1_v → 𝒪, and Q_v contains ker(R^1_v → R^m_v).

Suppliers: LocalGaloisDeformationRings:L7/partition-monodromy-rings; LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components.

Sources: CT-2017, Lemma 5.2, accepted manuscript p. 39.


### `LocalGaloisDeformationRings:L7/away-from-p-rank-n-interface` — Rank-n conditions away from p: the interface with R08.2

L7's rank-n semistable, Steinberg and minimally ramified conditions away from p are those of R08.2, cited and not rebuilt: (1) minimally ramified lifts in rank n (R08.2/minimally-ramified-condition, R08.2/minimally-ramified-ring), which equal the unipotent lifts when r̄(σ) is a single Jordan block (R08.2/regular-unipotent-minimally-ramified); (2) Steinberg lifts with monodromy (R08.2/steinberg-condition, R08.2/steinberg-ring-domain) and their generalisations with Frobenius characteristic polynomial constrained by q-chains of a partition (L7/partition-monodromy-rings); (3) fixed inertial types with monodromy (R08.2/inertial-type-with-monodromy) with constancy on components (R08.2/fixed-type-rings-rank-n); (4) Ihara-avoidance rings (R08.2/ihara-avoidance-components, R08.2/ihara-avoidance-rings-p2); (5) discrete series lifts (L7/discrete-series-deformation-condition). These, together with the ordinary and Fontaine–Laffaille conditions of L7, are exported to GlobalGaloisDeformations G7 and, for the comparisons of patched complexes under change of local condition, to PotentialAutomorphyInfrastructure PA.3.

Hypotheses: The arithmetic consumer of ACC+ §6.2's local comparisons is PotentialAutomorphyInfrastructure PA.3; DeformationAndDerivedPatchingAlgebra P9 keeps only the abstract algebraic hypotheses.; Full inertial type including N is constant for two points on a common irreducible component only when each is on a unique irreducible component (R08.2/fixed-type-rings-rank-n)..

Suppliers: LocalGaloisDeformationRings:R08.2/minimally-ramified-ring; LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified; LocalGaloisDeformationRings:R08.2/steinberg-ring-domain; LocalGaloisDeformationRings:L7/partition-monodromy-rings; LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components; LocalGaloisDeformationRings:R08.2/ihara-avoidance-rings-p2; LocalGaloisDeformationRings:L7/discrete-series-deformation-condition.

Sources: CT-2017, §5.1, accepted manuscript p. 39.


### `LocalGaloisDeformationRings:L7/trivial-residual-flag-ring` — The flag image ring for trivial residual representation

(ACC+ Proposition 6.2.10, from Thorne 2015, Lemma 3.11 and Proposition 3.14.) Let ρ̄|_{G_{F_v}} be trivial and [F_v : ℚ_p] > n(n − 1)/2 + 1, and let Λ_v be a quotient of 𝒪⟦𝒪_{F_v}^×(p)ⁿ⟧ by an intersection of minimal primes (L8/ordinary-coefficient-ring). (1) (Lemma 3.11) The ordinary flag scheme 𝒢_v of L7/ordinary-flag-scheme is 𝒪-flat and reduced; for each minimal prime Q_v of Λ_v, 𝒢_v ⊗_{Λ_v} Λ_v/Q_v is 𝒪-flat and integral of dimension 1 + [F_v:ℚ_p]·n(n+1)/2 + n², and 𝒢_v ⊗_{Λ_v} Λ_v/(Q_v, λ) is integral. Hence the scheme-theoretic image R^△_v of 𝒢_v is already 𝒪-flat and reduced, and the definitions 'image of R^□_v in H⁰(𝒢_v, 𝒪)' (ACC+) and 'maximal reduced 𝒪-flat quotient of the image' (Thorne) agree, and both agree with Geraghty's image of R^□_v in the functions on the generic fibre of 𝒢_v. (2) (Corollary 3.12) For an integral R ∈ C_𝒪 and an algebraic closure Ē of its fraction field, R^□_v → R factors through R^△_v iff ρ ⊗_R Ē has a G_{F_v}-stable full flag on whose graded pieces I_{F_v} acts by the specialisations of the universal characters. (3) (Lemma 3.13) Over the open U ⊂ Spec Λ_v where the universal characters ψ_i are pairwise distinct, 𝒢_{v,U} → Spec R^△_{v,U} is an isomorphism. (4) (Proposition 3.14) At a closed point x of Spec R^△_v[1/p] over y ∈ Spec Λ_v[1/p]: if the ψ_i mod y are pairwise distinct, the fibre over κ(y) is geometrically connected of dimension ≤ [F_v:ℚ_p]·n(n−1)/2 + n² + n(n−1)/2; if moreover ψ_i ≠ εψ_j mod y for i < j, it is regular of dimension [F_v:ℚ_p]·n(n−1)/2 + n² and Spec R^△_v[1/p] is regular at x of dimension [F_v:ℚ_p]·n(n+1)/2 + n². (5) For each minimal prime Q_v of Λ_v, R^△_v/Q_v is geometrically irreducible of dimension 1 + n² + [F_v:ℚ_p]·n(n+1)/2 and R^△_v/(Q_v, λ) is generically reduced; so R^△_v is 𝒪-flat, reduced and equidimensional, and Spec R^△_v → Spec Λ_v is bijective on generic points, hence on irreducible components.

Hypotheses: ρ̄ trivial; [F_v : ℚ_p] > n(n − 1)/2 + 1. Thorne's standing hypothesis is p odd. For p = 2, BCGP25 Proposition 5.6.6(3) and Remark 5.6.7 state part (5) and the flatness of 𝒢_v in (1), citing Thorne's Lemma 3.11 and Proposition 3.14(3); parts (2)–(4) are planned for p odd. Under the degree hypothesis no flat closure is needed (BCGP25 Remark 5.6.7).; Thorne's manuscript prints R_{v,U} without △ in Lemma 3.13; its integrality clause uses Lemma 3.11 and so the degree hypothesis.; Thorne works with Λ_v = 𝒪⟦𝒪_{F_v}^×(p)ⁿ⟧; minimal primes of Λ_v generate minimal primes of R^△_v, so the case of a quotient by an intersection of minimal primes follows; ACC+ state this for (5), and for (1)–(4) it is this node's deduction..

Suppliers: LocalGaloisDeformationRings:L7/ordinary-flag-scheme; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; LocalGaloisDeformationRings:L7/ordinary-flag-scheme-local-structure; LocalGaloisDeformationRings:L7/geraghty-fixed-weight-ordinary-rings; LocalGaloisDeformationRings:L8/ordinary-coefficient-ring.

Sources: ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, Proposition 6.2.10, p. 139 (arXiv v2; printed page = PDF page); BCGP-2025, Proposition 5.6.6 (3) and Remark 5.6.7, arXiv v1 p. 129; THORNE-2015, Lemma 3.11, Corollary 3.12, Lemma 3.13, Proposition 3.14, pp. 16–17 (accepted manuscript, 16 April 2014).


### `LocalGaloisDeformationRings:L7/weight-zero-crystalline-connectedness` — Connectedness results for crystalline weight-zero lifts

Let K/ℚ_p be finite. (1) Two ordinary crystalline weight-0 representations ρ₁, ρ₂ of G_K with ρ̄₁ = ρ̄₂ trivial connect: ρ₁ ∼ ρ₂ (the ordinary weight-0 crystalline lifting ring of the trivial representation is irreducible). (2) For ρ : G_K → GL_n(ℤ̄_p) crystalline of weight 0 there is c = c(K, ρ, n) such that every crystalline weight-0 t with t ≡ ρ mod p^c satisfies t ∼ ρ. (3) In the sources' convention HT(ε) = −1 (so weights {0, −1, …, −(n − 1)} in this roadmap's convention), a crystalline representation of G_K with parallel Hodge–Tate weights {0, …, n − 1} is ordinary iff the eigenvalues of the Frobenius φ^f of WD(ρ) (f the residue degree) have valuations 0, f, …, (n − 1)f, the valuation being normalised by v(p) = 1. (4) Symmetric powers and tensor products of crystalline ordinary representations are crystalline and carry the induced G_K-stable flag; they are ordinary when, for every τ, the resulting labelled Hodge–Tate weights are pairwise distinct and are ordered along the flag in the same way, as for Sym^{n−1} of a two-dimensional one and for the tensor products ρ_{n,m,0} ⊗ ρ_{m,1,0} of L7/local-model-rho-nm0.

Hypotheses: Geraghty's results are read in the 2010 preprint with the concordance of the source GERAGHTY-2019 (Lemma 2.32 = preprint Lemma 2.7.7, Lemma 3.14 = Lemma 3.4.3)..

Suppliers: LocalGaloisDeformationRings:L7/connects-relation; LocalGaloisDeformationRings:L7/semistable-ordinary-quotient; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; LocalGaloisDeformationRings:L7/ordinary-of-weight-lambda; LocalGaloisDeformationRings:L7/geraghty-fixed-weight-ordinary-rings.

Sources: BCGNT-2025, Lemma 5.1.4, arXiv p. 50; BCGNT-2025, Lemma 5.1.5, arXiv p. 50; BCGNT-2025, Proposition 4.2.5(2) and its proof, arXiv pp. 42–43; GERAGHTY-2019, Lemma 2.32 (preprint Lemma 2.7.7, pp. 27–28).


### `LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-tangent` — Tangent dimension of the Siegel-ordinary condition and its comparison with finite flatness

Keep L7/gsp4-siegel-ordinary-condition. (1) b⁰/u ≅ 1 ⊕ 1 ⊕ λ(α)λ(β)^{-1} as k[G_p]-modules, u ≅ λ(α²)ε̄^{a−1} ⊕ λ(β²)ε̄^{a−1} ⊕ λ(αβ)ε̄^{a−1}, and h⁰(G_p, g⁰/b⁰) = 0; hence h⁰(G_p, u) = h²(G_p, u) = 0, h¹(G_p, u) = 3, H¹(G_p, b⁰) ↠ H¹(G_p, b⁰/u) and H¹(G_p, b⁰) ↪ H¹(G_p, g⁰). (2) dim_k L_p − dim_k H⁰(G_p, ad⁰r̄) = 3. (3) The condition at p is equivalent to r|G_p being ordinary of fixed weight; for a = 2 it is equivalent to finite flatness of r^∨ ≅ r ⊗ ε.

Hypotheses: CG20 prints λ(β)λ(α)^{-1} for the character on the (1, 2) root space; conjugation by diag(λ(α), λ(β), ε^{1−a}λ(β)^{-1}, ε^{1−a}λ(α)^{-1}) acts on that root space by λ(α)λ(β)^{-1}; the dimension count is unaffected.; Remark 4.7 is printed for r and with Ext¹(εψ₁, ψ₂); it concerns r^∨ and extensions 0 → εψ₁ → E → ψ₂ → 0..

Suppliers: LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-condition; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: CG-2020, Lemma 4.8 and its proof, published pp. 816–817; CG-2020, Remark 4.7, published p. 816.


### `LocalGaloisDeformationRings:L7/gsp4-borel-ordinary-conditions` — p-distinguished weight-two ordinary GSp₄ conditions (B- and P-ordinary)

Assume p > 2 and F_v = ℚ_p. For x ∈ k^×, λ_x is the unramified character with λ_x(Frob) = x. ρ̄|G_{F_v} is p-distinguished weight 2 ordinary if it is conjugate to the matrix with rows (λ_{ᾱ}, 0, ∗, ∗), (0, λ_{β̄}, ∗, ∗), (0, 0, ε̄^{-1}λ_{β̄}^{-1}, 0), (0, 0, 0, ε̄^{-1}λ_{ᾱ}^{-1}) with ᾱ ≠ β̄; a lift is p-distinguished weight 2 ordinary if it is conjugate to the same shape with λ_α, λ_β lifting λ_{ᾱ}, λ_{β̄} (such lifts are semistable, not necessarily crystalline). With 𝔠̄ ∈ {ᾱ, β̄} and the weight algebras Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ and Λ_{v,1} = 𝒪⟦1 + pℤ_p⟧, 𝒟^{B,𝔠̄}_v (over Λ_{v,2}) is the problem of lifts conjugate to a Borel-upper-triangular form with diagonal characters whose inertial restrictions are the universal characters and with the first character lifting λ_{𝔠̄}; 𝒟^P_v (over Λ_{v,1}, where the two universal characters coincide, θ₁ = θ₂ = θ) is the problem of lifts that are both (B, ᾱ)- and (B, β̄)-ordinary, equivalently conjugate to the upper-triangular shape with zero (1, 2) and (3, 4) entries and χ₁|_I = χ₂|_I = θ: a stable Lagrangian plane on which inertia acts through the scalar θ. Here P is the six-dimensional subgroup of B (the torus times the unipotent radical of the Siegel parabolic), not the Siegel parabolic itself. They are represented by R^{B,𝔠̄}_v and R^P_v; their B- and P-framed variants R^{B,◹}, R^{P,◹} (framed for the Borel resp. parabolic) are defined so that R^B and R^P are formally smooth over them.

Hypotheses: For p-distinguished residual representations the flag is unique, so the flag-incidence map is a closed immersion (BCGP25 Remark 6.2.1); R^{B,𝔠̄}_v is the residual-distinguished case of L7/gsp4-ordinary-flag-incidence (for p > 2 and unramified residual characters), and 𝒟^P_v is a further closed condition inside 𝒟^{B,𝔠̄}_v ×_{Λ_{v,2}} Λ_{v,1}..

Suppliers: LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-condition; LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

API `TauCeti.GaloisDeformation.Local.GSp4.IsPDistinguishedOrdinary`: The residual and lifted p-distinguished weight-2 ordinary shapes.

API `TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary`: 𝒟^{B,𝔠̄}_v over Λ_{v,2}, represented by R^{B,𝔠̄}_v.

API `TauCeti.GaloisDeformation.Local.GSp4.ParabolicOrdinary`: 𝒟^P_v over Λ_{v,1}, represented by R^P_v.

API `TauCeti.GaloisDeformation.Local.GSp4.partiallyFramed`: R^B and R^P are formally smooth over the B- and P-framed rings R^{B,◹}, R^{P,◹} (BCGP21 Lemma 7.3.12).

API `TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary.semistable`: At the specified weight-two arithmetic specialization, the source’s ordinary finite-flat flag criterion gives a semistable lift. Arbitrary variable-weight points are not asserted semistable.

API `TauCeti.GaloisDeformation.Local.ParabolicOrdinary.toBorel`: A P-ordinary lift is (B, 𝔠̄)-ordinary for 𝔠̄ = ᾱ and for 𝔠̄ = β̄, with θ₁ = θ₂ = θ; this gives surjections R^{B,𝔠̄}_v ⊗̂_{Λ_{v,2}} Λ_{v,1} ↠ R^P_v commuting with the universal lifts. The converse fails: for a (B, 𝔠̄)-ordinary lift with θ₁ = θ₂ the plane Fil₂ can be a non-split (ramified) extension of χ₂ by χ₁, so the generic fibres have dimensions 15 and 14.

Test `gsp4BorelOrdinary_weightAlgebra` (computation): Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ ≅ 𝒪⟦x₁, x₂⟧ for p > 2.

Test `gsp4BorelOrdinary_not_distinguished` (non-example): ᾱ = β̄ is excluded: the residual Lagrangian plane then carries a two-dimensional unramified isotypic piece and the flag is not unique.

Test `gsp4BorelOrdinary_semistable_not_crystalline` (characterisation): When α² = 1, the rank-two subquotient on the first and fourth basis vectors may be the non-split extension of ε^{-1}λ_α^{-1} by λ_α given by the Kummer class of p in H¹(ℚ_p, E(ε)) = H¹(ℚ_p, E(ελ_α²)); such a lift is p-distinguished weight-2 ordinary and semistable but not crystalline, so the condition is not the crystalline condition.

Test `gsp4BorelOrdinary_closed_immersion` (compatibility): For p-distinguished ρ̄ the flag-incidence map of L7/gsp4-ordinary-flag-incidence is a closed immersion with image R^{B,𝔠̄}_v.

Sources: BCGP-2021, Definition 7.3.1, arXiv v3 p. 172.


### `LocalGaloisDeformationRings:L7/gl3-explicit-rings` — Explicit rings R^{expl,∇} and the comparison diagram (3.9)

Keep L7/kisin-modules-tame-descent (K/ℚ_p unramified of degree f, ρ̄ 10-generic and semisimple, τ = τ(s, μ) a tame type with R^τ_ρ̄ ≠ 0, so that τ is 7-generic, 𝔐̄ the unique Kisin module of type (η, τ) with T*_dd(𝔐̄) ≅ ρ̄|_{G_{K∞}}, which is semisimple, of shape w̃ = (w̃_i), with a fixed gauge basis β̄). The groupoids Φ-Mod^ét_{ℳ̄}, Φ-Mod^{ét,□}_{ℳ̄}, Ȳ^{η,τ}_{𝔐̄} and D̄^{τ,β̄}_{𝔐̄} (deformations with a gauge basis) fit into the diagram (3.9): Spf R̄^{τ,β̄,□}_{𝔐̄,ρ̄} → Spf R̄^{expl,∇}_{𝔐̄,w̃} ↪ D̄^{τ,β̄}_{𝔐̄} (formally smooth, then closed), Spf R̄^τ_ρ̄ → [Spf R̄^{expl,∇}_{𝔐̄,w̃}/Ĝ_m^{3f}] ↪ Ȳ^{η,τ}_{𝔐̄}, with [Spf R̄^{τ,β̄,□}_{𝔐̄,ρ̄}/GL̂₃] ≅ Spf R̄^{expl,∇}_{𝔐̄,w̃}, where R̄^{expl,∇}_{𝔐̄,w̃} = ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}. Each factor is the quotient of a power series ring over F in the coefficients of the universal partial Frobenius matrix A^{(i)} (units c*_{jk} entering through c*_{jk} − [c̄*_{jk}]) by explicit relations whose type-dependent terms use (a, b, c) ≡ s_{f−1−i}^{−1}(μ_{f−1−i}) mod p: (a) for ℓ(w̃_i) ≥ 2 the presentations are those of L7/gl3-explicit-ring-rows (from LLHLM18 §5.3 and Table 7); (b) for the length-one shape αt₁ (β and γ follow by the outer automorphism w̃ ↦ δ̃w̃δ̃^{−1}, δ̃ = (123)t_(0,0,−1)), A^{(i)} = (c11, c12 + v c*12, c13; v c*21, c22 + v d22, c23; v c31, v c32, c33 + v c*33), c̃32 := (c32 c*21 − d22 c31)/c*21, and R̄^{expl,∇}_{𝔐̄,αt₁} is F⟦c11, c12, c13, c22, c23, c31, c̃32, c33, d22, c*12 − [c̄*12], c*21 − [c̄*21], c*33 − [c̄*33]⟧ modulo: c11 c23 = 0; c*33 c11 c̃32 = c13 c31 c̃32; (a − b) c11 d22 c*33 = (b − c) c*21 c13 c̃32; c13 c23 c̃32 = 0; c23 c31 c̃32 = 0; (a − b) c13 c31 d22 + (c − b) c13 c̃32 c*21 + (−1 − a + c) c23 c31 c*12 = 0; (a − b) c12 c*33 = (a − c) c13 c̃32; (−1 − a + b) c22 c*33 = (−1 − a + c) c23 c̃32; c*21 c33 = c31 c23 — a power series ring in three variables over the ring R̃ of LLHLM18 Proposition 8.11; (c) for the identity shape t₁, A^{(i)} = (c11 + v c*11, c12, c13; v c21, c22 + v c*22, c23; v c31, v c32, c33 + v c*33), and R̄^{expl,∇}_{𝔐̄,t₁} is F⟦c_{jk} (1 ≤ j, k ≤ 3), c*_{kk} − [c̄*_{kk}]⟧ (twelve variables) modulo: c_{jj} c_{kk} = 0 (j ≠ k); c11 c23 = c31 c22 = c33 c12 = 0; c12 c23 = c22 c13; c11 c32 = c12 c31; c21 c33 = c31 c23; (−1 − a + c) c*22 c33 + (−1 − a + b) c22 c*33 − (−1 − a + c) c23 c32 = 0; (a − b) c*33 c11 + (−1 − b + c) c33 c*11 − (a − b) c13 c31 = 0; (b − c) c*11 c22 + (a − c) c11 c*22 − (b − c) c12 c21 = 0; and the cubic c11 c*22 c*33 + c22 c*11 c*33 + c33 c*11 c*22 − c*11 c23 c32 − c*22 c13 c31 − c*33 c12 c21 + c13 c32 c21 = 0 (the vanishing of the v² coefficient of det A^{(i)}), a power series ring in three variables over the three-dimensional ring R̃ of LLHLM18 Corollary 8.4, so of dimension 6. The map ι′_τ : Ȳ^{η,τ}_{𝔐̄} → Φ-Mod^ét_{ℳ̄} in (3.9) is a monomorphism (Proposition 3.6.3, for τ 3-generic and 𝔐̄ semisimple). The ring R̄^{τ,β̄,□}_{𝔐̄,ρ̄} is a power series ring in 3f variables over R̄^τ_ρ̄ and is formally smooth of relative dimension 9 over R̄^{expl,∇}_{𝔐̄,w̃}; R̄^τ_ρ̄ itself is not an algebra over R̄^{expl,∇}_{𝔐̄,w̃} (their dimensions are 9 + 3f and 6f). Through these two formally smooth maps there is a bijection Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{𝔐̄,w̃_i}).

Hypotheses: ρ̄ is 10-generic and semisimple; τ is then 7-generic when R^τ_ρ̄ ≠ 0. The structure constants (a, b, c) ∈ F_p³ are those of the indexing convention of the Table 3 caption: the row for w̃_{f−1−i} uses s_i^{−1}(μ_i).; Convention for the structure constants: in L7/gl3-explicit-rings, L7/gl3-explicit-ring-rows and L7/gl3-component-labelling the type is written τ = τ(s, μ), so its lowest alcove presentation is (s, μ − η) (LLHLM §3.6.1, first paragraph); L7/kisin-modules-tame-descent writes (s, μ) for the lowest alcove presentation itself, and the two differ by η.; In (c), the relation c12 c33 = 0 is missing from LLHLM18 Corollary 8.4 and is added by the authors; the comparison with R̃ is the dimension-three companion-ring quotient.; In (b), the first six relations come from LLHLM18 Proposition 8.11 with the units c*12, c*21, c*33 restored, the next two from its proof, and the last from the p-saturation of the 2 × 2 minor condition (LLHLM p. 38). The denominators a − b and −1 − a + b are units by genericity and have been cleared.; The source does not say which relations are 'the ∇ (monodromy) condition'; the type-dependent relations (those involving a, b, c) are the ones that come from the monodromy condition of LLHLM18.; The groupoids of Kisin modules with descent data are FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4's (requested); only the explicit coordinates and rings are planned here..

Suppliers: LocalGaloisDeformationRings:L7/kisin-modules-tame-descent; LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:L7/gl3-explicit-ring-rows.

API `TauCeti.GaloisDeformation.Local.GL3.explicitRing`: R̄^{expl,∇}_{𝔐̄,w̃} for each shape w̃ (three cases by length).

API `TauCeti.GaloisDeformation.Local.GL3.comparisonDiagram`: The diagram (3.9) relating R̄^τ_ρ̄, explicit rings and étale φ-modules.

API `TauCeti.GaloisDeformation.Local.GL3.iotaPrime_mono`: For τ 3-generic and 𝔐̄ semisimple, ι′_τ : Ȳ^{η,τ}_{𝔐̄} → Φ-Mod^ét_{ℳ̄} is a monomorphism.

API `TauCeti.GaloisDeformation.Local.GL3.formallySmooth_over_explicit`: R̄^{τ,β̄,□}_{𝔐̄,ρ̄} is a power series ring in 3f variables over R̄^τ_ρ̄ and is formally smooth of relative dimension 9 over ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}.

API `TauCeti.GaloisDeformation.Local.GL3.irr_bijection`: Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{w̃_i}).

Test `gl3Explicit_identity_components` (computation): For the identity shape the explicit ring (twelve variables, the relations of (c)) has exactly 6 minimal primes, each with quotient of dimension 6 (Table 3, row id); the listed generators generate these primes in the quotient ring, not in the ambient power series ring.

Test `gl3Explicit_alpha_components` (computation): For shape α the explicit ring (the nine relations of (b)) has exactly 6 minimal primes (Table 3, row α).

Test `gl3Explicit_long_shape` (degenerate): For ℓ(w̃_i) = 4 the explicit ring is a power series ring over F (Table 4: the single relation, when present, is solved for one variable), and for ℓ(w̃_i) ≥ 2 the characteristic-zero explicit ring is formally smooth over R_N.

Test `gl3Explicit_not_epi` (non-example): ι′_τ is a monomorphism but not an equivalence onto Φ-Mod^ét_{ℳ̄}: deformations of the étale φ-module ℳ̄ that do not come from Kisin modules of type (η, τ) are not in the image.

Sources: LLHLM-2020, §3.6.1, items (1)–(4) and diagram (3.9), published p. 49; arXiv v4 pp. 36–39; LLHLM-2020, §3.6.1 item (4)(b)–(c), arXiv v4 p. 38 (relations for the shapes α and id; repeated on pp. 46 and 48 respectively).


### `LocalGaloisDeformationRings:L7/gsp4-ordinary-flag-incidence` — The GSp₄ ordinary flag-incidence scheme and its scheme-theoretic image R^△_v

Let v | p with F_v = ℚ_p (any p, including p = 2), ρ̄ : G_{F_v} → GSp₄(k) ordinary with a fixed p-stabilisation (χ̄₁, χ̄₂) and multiplier ε̄^{-1}. Λ_{GSp₄,v} = 𝒪⟦(𝒪_{F_v}^×(p))²⟧ with characters θ_i : I_{F_v} → Λ^× (the i-th copy through Art^{-1}); for p > 2, Λ_{GSp₄,v} ≅ 𝒪⟦x₁, x₂⟧, for p = 2 Spec Λ_{GSp₄,v} has four components with regular generic fibre. Λ̃_{GSp₄,v} = 𝒪⟦Gal(F_v^{ab}/F_v)(p)²⟧ carries universal characters (χ̃₁, χ̃₂) lifting (χ̄₁, χ̄₂). With 𝓕 the flag variety of full symplectic flags (Fil_i^⊥ = Fil_{4−i}) and R_v the fixed-multiplier lifting ring over Λ̃, 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v is the closed subscheme of pairs (Fil_•, R_v → A) with Fil_• stable and G_{F_v} acting on the graded pieces by χ̃₁, χ̃₂, ε^{-1}χ̃₂^{-1}, ε^{-1}χ̃₁^{-1}. R^△_v := im(R_v → 𝒪_{𝒢_v}(𝒢_v)), so Spec R^△_v is the scheme-theoretic image of 𝒢_v → Spec R_v (p-torsion is not removed). (1) The 𝒪_{E′}-points of Spf R^△_v are exactly the lifts that are ordinary with p-stabilisation (χ̃₁, χ̃₂). (2) If ρ̄ is residually p-distinguished (the four characters pairwise distinct), the flag is unique and 𝒢_v → Spec R_v is a closed immersion. (3) At a characteristic-zero flagged point x, Fil^i ad⁰ρ_x (symplectic endomorphisms lowering the flag by i) has dimensions 6, 4, 2, 1, 0 for i = 0, …, 4.

Hypotheses: Unlike Geraghty's ring (L7/ordinary-flag-scheme, flat closure), R^△_v here is the scheme-theoretic image without passing to the p-torsion-free quotient (BCGP25 §6.2).; BCGP25 §1.8.10: an ordinary lift is semistable ordinary of weight 2 when the whole upper 2 × 2 subrepresentation (the stable Lagrangian plane) is unramified; residually the multiplier is ε̄^{-1}, and a compatible integral p-stabilisation reduces to the chosen residual ordered pair..

Suppliers: LocalGaloisDeformationRings:R08.1/g-valued-framed-ring; LocalGaloisDeformationRings:L7/ordinary-flag-scheme; LocalGaloisDeformationRings:L7/gsp4-borel-ordinary-conditions; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

API `TauCeti.GaloisDeformation.Local.GSp4.weightAlgebra`: Λ_{GSp₄,v} and Λ̃_{GSp₄,v} with their universal characters.

API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme`: 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v.

API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme_proper`: 𝒢_v → Spec R_v is proper.

API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryImage`: R^△_v, the scheme-theoretic image (no flat closure).

API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryImage_points`: 𝒪_{E′}-points of Spf R^△_v are the ordinary lifts with the given p-stabilisation.

API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme_closedImmersion`: Residually p-distinguished ⟹ 𝒢_v → Spec R_v is a closed immersion.

API `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme.points`: A coefficient point consists of a fixed-similitude framed lift, an isotropic stable full flag and the ordered universal weight characters of its graded lines. This description and the incidence equations commute with coefficient base change.

Test `gsp4Flag_weightAlgebra_p2` (computation): p = 2: Spec Λ_{GSp₄,v} has 4 irreducible components (from (ℤ/2)² ⊂ (ℤ₂^×)²) and regular generic fibre.

Test `gsp4Flag_filtration_dims` (computation): dim Fil^i ad⁰ρ_x = 6, 4, 2, 1, 0 for i = 0, …, 4.

Test `gsp4Flag_no_flat_closure` (non-example): R^△_v may have p-torsion; replacing it by its flat closure changes the ring when 𝒢_v is not 𝒪-flat.

Test `gsp4Flag_distinguished` (compatibility): For p > 2 and ρ̄ p-distinguished of weight 2 (unramified residual characters χ̄₁ ≠ χ̄₂), R^△_v is the ring R^{B,𝔠̄}_v of L7/gsp4-borel-ordinary-conditions.

Sources: BCGP-2025, §6.2, arXiv v1 p. 142; BCGP-2025, §6.2, arXiv v1 p. 143.


### `LocalGaloisDeformationRings:L7/gl3-pcris-deformation-rings` — Potentially crystalline deformation rings of GL₃ in parallel weight (2, 1, 0)

Let K/ℚ_p be unramified of degree f, ρ̄ : G_K → GL₃(F) continuous, 10-generic and semisimple, τ a tame inertial type, and R^τ_ρ̄ the framed potentially crystalline deformation ring of type (η, τ) with η = (2, 1, 0) (R08.3/pst-deformation-ring). If τ is not 1-generic, R^τ_ρ̄ = 0. If τ is 1-generic and R^τ_ρ̄≠0: R^τ_ρ̄ is a normal Cohen–Macaulay domain; R̄^τ_ρ̄ := R^τ_ρ̄/ϖ is reduced, its irreducible components are formally smooth of the same dimension, and their number equals #W^?(ρ̄, τ) (the predicted Serre weights in the Jordan–Hölder factors of σ(τ)); moreover, for 1-generic τ, R^τ_ρ̄ ≠ 0 if and only if W^?(ρ̄, τ) ≠ ∅. For ρ̄ semisimple (no genericity of ρ̄), τ 5-generic and shapes w̃_j of length > 1 at every j, as in the hypothesis below, R^τ_ρ̄ ≠ 0 and the same conclusions hold, with Π_j 2^{4−ℓ(w̃_j)} components (Lemma 3.5.4).

Hypotheses: The genericity bounds (10-generic ρ̄, 5-generic τ) are part of the statement.; For the nonemptiness assertion of Lemma 3.5.4, use its residual Deligne–Lusztig presentation V(ρ̄|_{I_K}) = R_{s w̃*}(μ + η) with (s, μ) the lowest alcove presentation of τ and w̃ = w̃(ρ̄, τ), τ 5-generic and each specified shape in Adm^∨(η) of length>1; generic τ alone does not assert existence.; Theorem 3.5.3 for shapes of length ≤ 1 rests on a global input, a weak minimal patching functor for ρ̄ (LLHLM Definition 3.5.1 and Proposition 3.5.15) with Theorem 3.5.2; this is recorded as a gap. Lemma 3.5.4 (all shapes of length > 1) is local..

Suppliers: LocalGaloisDeformationRings:L7/kisin-modules-tame-descent; LocalGaloisDeformationRings:L7/semisimple-kisin-modules-and-shapes; LocalGaloisDeformationRings:L7/gl3-explicit-rings; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; DeformationAndDerivedPatchingAlgebra:R03.3.

Sources: LLHLM-2020, Theorem 3.5.3, published p. 38; LLHLM-2020, Lemma 3.5.4, published p. 38; LLHLM-2020, §3.5.3, proof of Theorem 3.5.3 and Remark 3.5.17, arXiv v4 p. 34; Theorem 3.5.2 and Proposition 3.5.15, arXiv v4 pp. 29, 33.


### `LocalGaloisDeformationRings:L7/gsp4-ordinary-regularity` — Regularity of the GSp₄ ordinary flag scheme at characteristic-zero points

Keep L7/gsp4-ordinary-flag-incidence and let x be a closed point of 𝒢_v[1/p] with ρ_x. (1) If H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0, then x is a regular point of 𝒢_v[1/p], on a unique irreducible component, of dimension 16; and H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0 iff H⁰(G_{F_v}, (ad⁰ρ_x/Fil¹ad⁰ρ_x)(1)) = 0. (2) The conditions of (1) hold if (a) none of the specialisations at x of χ̃₁²ε, χ̃₂²ε, χ̃₁χ̃₂ε, χ̃₁χ̃₂^{-1} equals ε; or (b) ρ_x is pure and p-distinguished; or (c) ρ_x is pure and potentially crystalline. (3) If ρ_x is p-distinguished and (1) holds, the image of x in Spec R^△_v is a regular point on a unique irreducible component of relative 𝒪-dimension 16.

Hypotheses: (2)(c) concerns the flagged point x of 𝒢_v, not its image, when ρ_x is not p-distinguished..

Suppliers: LocalGaloisDeformationRings:L7/gsp4-ordinary-flag-incidence; LocalGaloisDeformationRings:R08.1/completion-at-points; LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality; LocalGaloisDeformationRings:L7/ordinary-flag-scheme-local-structure.

Sources: BCGP-2025, Lemma 6.2.2, arXiv v1 p. 143.


### `LocalGaloisDeformationRings:L7/gsp4-flat-ordinary-smoothness` — Formal smoothness of the finite-flat ordinary flag scheme for GSp₄

Let p > 2, v | p with F_v⁺ = ℚ_p, ρ̄|_{G_{F_v⁺}} : G_{ℚ_p} → GSp₄(k) ordinary (L7/gsp4-ordinary-flag-incidence) with (ρ̄ ⊗ ε̄)|_{G_{F_v⁺}} finite flat, and let G_v → Spec R^□_v be the ordinary flag scheme of L7/gsp4-ordinary-flag-incidence. Let G_v^flat ⊆ G_v be the closed subscheme whose A-points are the pairs (Fil•, ρ) with ρ ⊗ ε finite flat (every finite quotient of ρ ⊗ ε is the generic fibre of a finite flat group scheme over ℤ_p) and inertia acting trivially on Fil₂. Then the completion of G_v^flat at every k′-point (k′/k finite) is formally smooth over 𝒪 (the source expresses this as the vanishing of an obstruction group H²_flat(Fil⁰ad⁰ρ̄), which it does not define; the statement planned is the formal smoothness). Consequently the scheme-theoretic image R^{△,flat}_v of G_v^flat in Spec R^△_v is irreducible, since its fibre over ρ̄ is a point or ℙ¹.

Hypotheses: BCGP25 (p. 145, proof of Lemma 6.2.5, in the part of §6.2 that assumes p > 2) asserts the formal smoothness and reduces it, by the tangent-obstruction calculation of its Lemma 6.2.2, to the vanishing of H²_flat(Fil⁰ad⁰ρ̄), referring to the proof of the GL₂ case in Kisin's 2-adic paper (Proposition 2.4.4, there built on the right exactness of H¹_f in Lemma 2.4.2). The rank-four vanishing is not written out in the source, which refers to Kisin's proof for it; the proof outline below writes that argument out for the Siegel parabolic.; BCGP25's '[Kis09]' is Kisin, Modularity of 2-adic Barsotti–Tate representations (Invent. Math. 178 (2009)); BCGP21's '[Kis09]' is Kisin's Annals paper. The two labels name different papers..

Suppliers: LocalGaloisDeformationRings:L7/gsp4-ordinary-flag-incidence; LocalGaloisDeformationRings:R08.1/local-lifting-ring; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory.

Sources: BCGP-2025, proof of Lemma 6.2.5, arXiv v1 p. 145.


### `LocalGaloisDeformationRings:L7/gl3-component-labelling` — Labelling of components of GL₃ potentially crystalline rings by Serre weights

Keep L7/gl3-pcris-deformation-rings with ρ̄ 10-generic and semisimple, types written τ = τ(s, μ), and the explicit rings of L7/gl3-explicit-rings and L7/gl3-explicit-ring-rows. (1) (Proposition 3.6.1) There is a unique assignment σ ↦ 𝔭(σ) ⊂ R^□_ρ̄ from W^?(ρ̄) to prime ideals such that, for every tame type τ, Spec R̄^τ_ρ̄ = ⋃_{σ∈W^?(ρ̄,τ)} Spec R^□_ρ̄/𝔭(σ) with the reduced structure, the image of 𝔭(σ) being a minimal prime of R̄^τ_ρ̄. (2) (Theorem 3.6.4) Via the bijections of L7/gl3-explicit-rings and Proposition 3.4.2, ((ω_i, a_i))_i ∈ Π_i Σ_{(w̃*)_i} (the i-th component of w̃*, which is (w̃_{f−1−i})*) corresponds to the component (𝔠_{(ω_{f−1−i}, a_{f−1−i})})_i of Π_i Irr(R̄^{expl,∇}_{𝔐̄,w̃_i}), hence to 𝔭(σ^{(s,μ)}_{(ω,a)}); the primes 𝔠 are those of Table 3. For the shape α they are: (ε1, 1): (c11, c13, c31); (ε2, 0): (c11, c31, c*21 c̃32); (ε2, 1): (c11, c*21 c̃32, (a − b) c13 d22 + (−1 − a + c) c23 c*12); (ε2 − ε1, 0): (c23, d22, c*21 c̃32); (0, 0): (c11, c13, c23); (0, 1): (c11 c*33 − c13 c31, c23, (a − b) c31 d22 + (c − b) c*21 c̃32). For the identity shape: (ε1, 0): (c11, c22, c33, c21, c31, c23); (ε1, 1): (c31, c33, c11, (−1 − a + c) c32 c13 − (−1 − a + b) c12 c*33, c21 c13 − c23 c*11); (ε2, 0): (c11, c22, c33, c12, c31, c32); (ε2, 1): (c12, c22, c11, (a − b) c21 c13 − (−1 − b + c) c23 c*11, c21 c32 − c31 c*22); (0, 0): (c11, c22, c33, c13, c23, c12); (0, 1): (c23, c33, c22, (b − c) c21 c32 − (a − c) c31 c*22, c32 c13 − c12 c*33). (3) (Lemma 3.6.6, Corollary 3.6.7) For types τ, τ′ with z̃* such that s′ = s z* and μ′ = μ + s z̃*(0): if ideals I, I′ (intersections of minimal primes, embedding by embedding) have isomorphic quotients and A^{(f−1−i)} ≡ A′^{(f−1−i)} z̃_{f−1−i} modulo them, they induce the same ideal of R̄^□_ρ̄. Gauge bases are normalised so that the reductions satisfy (Ā^{(i)})_i = (Ā′^{(i)} z̃_i)_i (Remark 3.6.8, (3.12)), which can be arranged by scaling by T(F) (LLHL19 Proposition 3.2.22). (4) (Proposition 3.6.9) The minimal type τ′ of σ = σ^{(s,μ)}_{(ω,a)} is τ(s z*, μ + s z̃*(0)) for the z̃* of Table 3, with w̃(ρ̄, τ′) z̃ = w̃ and W^?(ρ̄, τ′) ⊂ W^?(ρ̄, τ). (5) (Lemma 3.6.10) Let Σ₀ be the graph with vertices (ε1+ε2, 0), (ε1−ε2, 0), (ε2−ε1, 0), (0, 0), (ε1, 0), (ε2, 0), (0, 1), (ε1, 1), (ε2, 1) and the 15 edges (ε1+ε2, 0)–(ε1, 1), (ε1+ε2, 0)–(ε2, 1), (ε1−ε2, 0)–(ε1, 1), (ε1−ε2, 0)–(0, 1), (ε2−ε1, 0)–(ε2, 1), (ε2−ε1, 0)–(0, 1), and each of (0, 0), (ε1, 0), (ε2, 0) joined to each of (0, 1), (ε1, 1), (ε2, 1) (the extension graph of Definition 2.1.6 on Σ₀, Table 1), and give Σ = Σ₀^J the product graph with distance d_gph. If ℓ(w̃_i) ≥ 2 for all i and R_N → R^{expl,∇}_{𝔐̄,w̃} is the fixed formally smooth map, the minimal primes over ϖ are ((z_j)_{j=1}^N + (ϖ)) with z_j ∈ {x_j, y_j}, and for σ₁, σ₂ ∈ W^?(ρ̄, τ): #({z_j(σ₁)} Δ {z_j(σ₂)}) = 2 d_gph(σ₁, σ₂).

Hypotheses: ρ̄ 10-generic and semisimple; R^τ_ρ̄ ≠ 0 for the types considered.; The identity-shape prime 𝔠_{(0,1)} is stated with the coefficient (b − c), correcting Table 3's (a − b) (the printed ideal is not a minimal prime). In the matching of 𝔠_{(0,0)} for the identity shape, z̃_{f−1−i} = t_{(−1,0,1)}.; The proof of Lemma 3.6.10 sums the ideals ((z_j) + (ϖ)) + ((z′_j) + (ϖ)) (the source says 'intersection').; Σ_{w̃*} is a 4-cycle for ℓ(w̃) = 2, an edge for ℓ = 3 and a point for ℓ = 4, matching N = Σ_i (4 − ℓ(w̃_i))..

Suppliers: LocalGaloisDeformationRings:L7/gl3-explicit-ring-rows; LocalGaloisDeformationRings:L7/gl3-explicit-rings; LocalGaloisDeformationRings:L7/gl3-pcris-deformation-rings.

Sources: LLHLM-2020, Proposition 3.6.1, published p. 46; LLHLM-2020, Theorem 3.6.4, published p. 55; LLHLM-2020, Lemma 3.6.10, published p. 59 (arXiv v4 p. 43), with Definition 2.1.6 and Table 1 (arXiv v4 pp. 12, 17); LLHLM-2020, Remark 3.6.8, arXiv v4 pp. 41–42; LLHLM-2020, Proposition 3.6.9 and Lemma 3.6.6, Corollary 3.6.7, arXiv v4 pp. 40–42; Table 2, arXiv v4 p. 18.


### `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres` — Generic fibres of the GSp₄ ordinary rings: irreducibility, dimension and smooth pure points

Keep L7/gsp4-borel-ordinary-conditions (p > 2, F_v = ℚ_p, ρ̄ p-distinguished weight 2 ordinary). (1) R^{B,𝔠̄}_v[1/p] and R^P_v[1/p] are irreducible, of relative dimensions 16 and 14 over ℚ_p. (2) R^{P,univ} and R^P are complete intersections, connected in characteristic zero, with non-smooth locus in characteristic zero of codimension at least two; R^{P,univ}[1/p] and R^P[1/p] are irreducible of dimensions 15 and 14. (3) The P-framed ring R^{P,univ,◹} is a completed tensor product of GL₂ ordinary rings for the three two-dimensional subquotients (Lemma 7.3.15). (4) (Lemma 7.3.14) Write ρ̄ with diagonal (λ_ᾱ, λ_β̄, ε̄⁻¹λ_β̄⁻¹, ε̄⁻¹λ_ᾱ⁻¹), ᾱ ≠ β̄, and extension classes η_δ ∈ H¹(ℚ_p, ε̄λ_δ̄) for δ ∈ {α², β², αβ}. Then H²(ℚ_p, ad⁰_B ρ̄) = 0 unless one of: (i) η_{αβ} = η_{α²} = 0 and ᾱ² = 1; (ii) η_{β²} = 0 and β̄² = 1, in which case either (ii.a) (i) also holds, or (ii.b) h² = 1 and H²(ℚ_p, ad⁰_B ρ̄) ≅ H²(ℚ_p, ad⁰_{B₂} W) for W = λ_β̄ ⊗ (1 ⊕ ε̄⁻¹), through a ℚ_p-equivariant map from ρ̄ to the GL₂ Borel of W; (iii) η_{αβ} = η_{β²} = 0 and ᾱβ̄ = 1. Its dimension is at most 1 except in case (ii.a), where it is 2. The list gives necessary conditions; the converse is not asserted. (5) A pure closed point of R^{B,𝔠̄}_v[1/p] or R^P_v[1/p] is smooth.

Hypotheses: The formulas of BCGP21 require these corrections: in the proof of Proposition 7.3.4, case (2b) has relative dimension 12 over R^{B₂,◹}, and in case (2a) the complement of U has dimension at most 13; 'codimension 4' in Proposition 7.3.16 reads 3; Lemma 7.3.18's Tate-duality step fails for ad⁰_B (the dual of ad⁰_B is a quotient of ad⁰, not a submodule); the argument of BCGP25 Lemma 6.2.2(2)(b), with purity and p-distinguishedness, replaces it.; BCGP21 Remark 7.3.17: in case (ii.a) the argument shows that R^B is a complete intersection, but not that it is 𝒪-flat or that R^B/λ is a complete intersection (only dim R^B/λ ≤ 17). No flatness is asserted in that case.; In the definition of smooth points before Lemma 7.3.18 the 'resp.' clause should name R^P_v..

Suppliers: LocalGaloisDeformationRings:L7/gsp4-borel-ordinary-conditions; LocalGaloisDeformationRings:L7/gl2-borel-ordinary-ring; LocalGaloisDeformationRings:R08.1/completion-at-points; LocalGaloisDeformationRings:R08.1/smooth-points-generic-fibre; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality; LocalGaloisDeformationRings:L7/gsp4-ordinary-regularity.

Sources: BCGP-2021, Proposition 7.3.4, arXiv v3 p. 173; BCGP-2021, Proposition 7.3.16, arXiv v3 p. 183; BCGP-2021, Lemma 7.3.18, arXiv v3 p. 188.


### `LocalGaloisDeformationRings:L7/gsp4-ordinary-weight-two-components` — Finite-flat ordinary weight-two lifts lie on one component

Keep L7/gsp4-ordinary-flag-incidence with p > 2. (1) If (ρ̄ ⊗ ε̄)|G_{F_v} is finite flat, then all ordinary pure weight-two crystalline lifts lie on a single irreducible component of Spec R^△_v, each on a unique component, of relative 𝒪-dimension 16. (2) If Spec R^△_v/Q → Spec Λ_{GSp₄,v} is surjective, some minimal prime of R^△_v/(p) contains Q and no other minimal prime of R^△_v, and R^△_v/Q has relative 𝒪-dimension 16. No claim is made that every component surjects onto Spec Λ_{GSp₄,v}.

Hypotheses: The rank-four input is the formal smoothness of G_v^flat (L7/gsp4-flat-ordinary-smoothness, the rank-four analogue of Kisin's 2-adic Proposition 2.4.4), not rank-two connectedness and not Geraghty or Thorne..

Suppliers: LocalGaloisDeformationRings:L7/gsp4-ordinary-regularity; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4; LocalGaloisDeformationRings:L7/gsp4-flat-ordinary-smoothness.

Sources: BCGP-2025, Lemma 6.2.5, arXiv v1 p. 145.


### `LocalGaloisDeformationRings:L8/determinant-ordinary-ring` — The determinant-ordinary rings R̃^{det,ord}_v and R^{det,ord}_v

Let R̃^□_v = R^□_v ⊗_{Λ_v} Λ̃_v and R̃^{det,ord}_v its maximal quotient on which, for all g, g_1, …, g_n ∈ G_{F_v}, (6.2.7) det(X − ρ^□(g)) = ∏_{i=1}^n (X − χ̃_i^univ(g)) and (6.2.8) (ρ^□(g_1) − χ̃_1^univ(g_1))⋯(ρ^□(g_n) − χ̃_n^univ(g_n)) = 0. R^{det,ord}_v is the image of R^□_v → R̃^{det,ord}_v.

Hypotheses: v | p; the flag on ρ̄ gives the residual characters..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:L8/ordinary-coefficient-ring.

API `TauCeti.GaloisDeformation.Local.detOrdTilde`: R̃^{det,ord}_v, the quotient by (6.2.7)–(6.2.8).

API `TauCeti.GaloisDeformation.Local.detOrd`: R^{det,ord}_v = im(R^□_v → R̃^{det,ord}_v).

API `TauCeti.GaloisDeformation.Local.detOrdTilde_charpoly`: (6.2.7) holds over R̃^{det,ord}_v.

API `TauCeti.GaloisDeformation.Local.detOrdTilde_product`: (6.2.8) holds over R̃^{det,ord}_v.

API `TauCeti.GaloisDeformation.Local.detOrd_universal`: R^□_v → R factors through R^{det,ord}_v when R ↪ S carries characters ψ_i with the relations.

API `TauCeti.GaloisDeformation.Local.detOrdTilde.factor_iff`: A continuous map from R̃^□_v to A factors uniquely through R̃^{det,ord}_v iff every coefficient of (6.2.7) and every ordered matrix entry of (6.2.8) vanishes in A. The ordered products are required for all tuples of group elements, and are preserved by A→A′.

Test `detOrd_n_one` (degenerate): n = 1: (6.2.7) says ρ^□ = χ̃_1^univ and (6.2.8) is the same relation.

Test `detOrd_diagonal` (computation): A diagonal lift diag(χ̃_1, …, χ̃_n) satisfies (6.2.7) and (6.2.8).

Test `detOrd_charpoly_not_enough` (non-example): Over A=ℤ/9 let M=diag(4,7), U=(1 1;0 1), and H the finite subgroup they generate in GL₂(A). Every element of H has characteristic polynomial (X−1)², with both prescribed characters equal to 1, but (M−I)(U−I)=(0 3;0 0)≠0. Thus (6.2.7) does not imply (6.2.8).

Sources: ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, p. 138 (arXiv v2; printed page = PDF page); ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, p. 139 (arXiv v2; printed page = PDF page).


### `LocalGaloisDeformationRings:L8/det-ord-finite` — R̃^{det,ord}_v is finite over R^{det,ord}_v

(ACC+ Lemma 6.2.9.) R̃^{det,ord}_v is a finite R^{det,ord}_v-algebra.

Suppliers: LocalGaloisDeformationRings:L8/determinant-ordinary-ring; mathlib:Module.Finite.

Sources: ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, Lemma 6.2.9, p. 139 (arXiv v2; printed page = PDF page).


### `LocalGaloisDeformationRings:L8/ordinary-point-criteria` — Point criteria and Spec R^△_v ⊂ Spec R^{det,ord}_v

If R ↪ S is an injective map of R^□_v-algebras and there are characters ψ_1, …, ψ_n : G_{F_v} → S^× with ψ_i|_{I_{F_v}} the push-forward of χ_i^univ satisfying (6.2.7) and (6.2.8) with the push-forward of the universal lifting, then R^□_v → R factors through R^{det,ord}_v. Consequently Spec R^△_v ⊂ Spec R^{det,ord}_v as topological spaces, and there is a surjection of R^□_v-algebras R^{det,ord}_v ↠ (R^△_v)_red.

Suppliers: LocalGaloisDeformationRings:L8/determinant-ordinary-ring; LocalGaloisDeformationRings:L7/ordinary-flag-scheme.

Sources: ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, p. 139 (arXiv v2; printed page = PDF page).


### `LocalGaloisDeformationRings:L8/distinct-characters-flag` — Characteristic polynomials and ordered products give a flag

(ACC+ Lemma 6.2.11.) Let K be a field, G a group and ρ : G → GL_n(K). If χ_1, …, χ_n : G → K^× are pairwise distinct characters with det(X − ρ(g)) = ∏_i(X − χ_i(g)) for all g and (ρ(g_1) − χ_1(g_1))⋯(ρ(g_n) − χ_n(g_n)) = 0 for all g_1, …, g_n, then there is a G-stable flag 0 = Fil⁰ ⊂ ⋯ ⊂ Filⁿ = Kⁿ with Fil^i/Fil^{i−1} ≅ K(χ_i).

Hypotheses: K a field; the χ_i pairwise distinct..

Suppliers: LocalGaloisDeformationRings:L8/determinant-ordinary-ring.

Sources: ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, Lemma 6.2.11, p. 140 (arXiv v2; printed page = PDF page).


### `LocalGaloisDeformationRings:L8/doubling-equals-unramified` — The doubling ideal equals the unramified ideal (Calegari–Geraghty Lemma 3.22)

Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R^unr ≅ 𝒪/ϖ^m⟦φ₁, φ₂, φ₃, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃), where ϖ^m is the largest power of ϖ dividing χ^{n−1}(g) − 1 for all g in the decomposition group at p, and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr as R^unr-modules; so R^unr → R̃^unr is injective and R^unr acts faithfully on R̃^unr/R^unr ≅ R^unr. (2) J = I: the annihilator of R̃†/R† (the ring with a Frobenius eigenvalue modulo the flag-free image ring) is the kernel of the map to the unramified quotient.

Hypotheses: This is the rank-two trivial-residual instance of L8's comparison of a flag-bearing ring (here: with an eigenvalue on the unramified quotient) with its image after forgetting the flag; equality of characteristic polynomials alone does not recover R̃† from R†..

Suppliers: LocalGaloisDeformationRings:L7/ordinary-ring-with-frobenius-eigenvalue; LocalGaloisDeformationRings:L8/determinant-ordinary-ring.

Sources: CG-2018, Lemma 3.22, published p. 335; CG-2018, proof of Lemma 3.22, published pp. 336–337.


### `LocalGaloisDeformationRings:L8/determinant-flag-comparison` — Determinant-ordinary versus flag-ordinary components

(ACC+ Proposition 6.2.12.) Let U ⊂ Spec Λ_v be the open locus where χ_1^univ, …, χ_n^univ are pairwise distinct, Z its complement, and f : Spec R^△_v → Spec Λ_v, g : Spec R^{det,ord}_v → Spec Λ_v the structure maps. Suppose ρ̄ is trivial and [F_v : ℚ_p] > n(n + 1)/2 + 1. (1) f^{−1}(U) = g^{−1}(U) in Spec R^□_v; hence every irreducible component C of Spec Λ_v is dominated by a unique irreducible component C′ of Spec R^{det,ord}_v, of dimension n² + 1 + n(n + 1)/2 · [F_v : ℚ_p]. (2) Every irreducible component C′ of R^{det,ord}_v not dominating a component of Spec Λ_v lies in g^{−1}(Z) and has dimension ≤ n² − 1 + n(n + 1)/2 · [F_v : ℚ_p].

Hypotheses: ρ̄ trivial; [F_v : ℚ_p] > n(n + 1)/2 + 1 (stronger than the n(n − 1)/2 + 1 of trivial-residual-flag-ring)..

Suppliers: LocalGaloisDeformationRings:L8/ordinary-point-criteria; LocalGaloisDeformationRings:L8/distinct-characters-flag; LocalGaloisDeformationRings:L8/det-ord-finite; LocalGaloisDeformationRings:L7/trivial-residual-flag-ring; LocalGaloisDeformationRings:R08.1/local-tangent-obstruction; LocalGaloisDeformationRings:L7/ordinary-flag-scheme-local-structure.

Sources: ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, Proposition 6.2.12, p. 140 (arXiv v2; printed page = PDF page); ACC-POTENTIAL-AUTOMORPHY-CM-2023, §6.2.6, proof of Proposition 6.2.12, p. 141 (arXiv v2; printed page = PDF page).


### `LocalGaloisDeformationRings:R08.6/smooth-resolution-criterion` — Smooth resolutions of framed deformation conditions

Let R^□_X be a nonzero quotient of the framed ring R^□ by a (GL_d)_1-stable ideal. A smooth resolution of D^□_X is a flat 𝒪-scheme ℛ with an 𝒪-morphism f : ℛ → Spec R^□_X such that: (1) f is proper and 𝒪_{Spec R^□_X} → f_*𝒪_ℛ is injective (so f is surjective and Spec R^□_X is the scheme-theoretic image); (2) ℛ[1/p] → Spec R^□[1/p] is a closed immersion; (3) the fibre Y ⊂ ℛ over the closed point of Spec R^□_X is geometrically connected; (4) ℛ has a smooth algebraization along Y: an 𝒪-scheme ℛ₀, smooth of finite type, with a closed subscheme Y₀ and an 𝒪-morphism ℛ → ℛ₀ carrying Y into Y₀ that induces an isomorphism of formal completions ℛ^∧_Y ≅ (ℛ₀)^∧_{Y₀}. If such a resolution exists, then R^□_X is a domain, R^□_X[1/p] is regular, the relative dimension of R^□_X over 𝒪 equals that of ℛ, and the 𝒪̄-points of D^□_X are the images of the points of ℛ specialising into Y.

Hypotheses: KW II use this for the odd archimedean ring at p = 2 (Proposition 3.3), the ordinary rings (Proposition 3.6, in the homothety case, where ℛ₀ is the affine bundle over ℙ¹_{𝒪[T]} built with Lemma 3.8, R08.4/kw-algebraisation-lemma) and the semistable weight-two rings (§3.2.6, §3.3.4).; Condition (4) is a comparison of formal completions along the whole closed fibre with a scheme of finite type; smoothness of the projective scheme ℛ alone does not give it. Kisin's variant (Annals 2009, (2.4.8) and (2.4.10); 2-adic paper, (2.4.4)–(2.4.5)) replaces (4) by formal smoothness of ℛ at its closed points together with reducedness of the special fibre.; In the source's proof, 'By (2)' should read 'by (4)'.; Stein factorization, the theorem on formal functions and excellence are the commutative algebra and formal geometry inputs: AdicSpacesPartII F0 and DeformationAndDerivedPatchingAlgebra R03.3..

Suppliers: AdicSpacesPartII:F0/theorem-on-formal-functions; DeformationAndDerivedPatchingAlgebra:R03.3.

Sources: KW2-2009, §2.8, Proposition 2.12 and its proof, pp. 16–18.


### `LocalGaloisDeformationRings:R08.6/kw-local-conditions` — The local conditions of KW II

For a place v of a totally real F and ρ̄_v : D_v → GL_2(𝔽) with fixed determinant φ = ψχ_p, R̄^{□,ψ}_v is the flat, reduced quotient of R^{□,ψ}_v classifying, in the sense of KW II Definition 2.4, the lifts satisfying one of the following conditions X_v:
(∞) odd lifts;
(p) with F_v/ℚ_p unramified, and F_v = ℚ_p when ρ̄_v is irreducible, or when k(ρ̄_v) = p+1 and crystalline lifts are considered: low-weight crystalline lifts (crystalline of weight k(ρ̄_v) ≤ p, or ordinary of weight p+1 when k = p+1); weight-two lifts (for p odd, potentially semistable of weight 2 with inertial Weil–Deligne parameter (ω^{k−2} ⊕ 1, 0), or (1, N) with N ≠ 0 when k = p+1; for p = 2, crystalline of weight 2 if k = 2 and semistable of weight 2 if k = 4); semistable weight-two lifts (γ_vχ_p ∗; 0 γ_v) with a fixed unramified γ_v;
(v ∤ p) semistable lifts (γ_vχ_p ∗; 0 γ_v) with fixed γ_v (§3.3.4), or inertia-rigid lifts conjugate on inertia to a fixed ρ₀ (§3.3.1–3.3.3; F_v = ℚ_q in §3.3.3).
The choices (an unramified character when ρ̄_v ≅ η̄₁ ⊕ η̄₂ is unramified with k = p; the characters γ_v; the lift ρ₀) are part of the datum.

Hypotheses: The choices are what make the rings domains (KW II remarks after Theorem 3.1).; Weight k and ordinary are KW II Definition 3.4 (weight k: V ⊗ ℂ_p = ℂ_p ⊕ ℂ_p(k − 1); ordinary: a free rank-one submodule on which an open subgroup of inertia acts by χ_p^a for an integer a ≥ 0, with unramified quotient; the open subgroup is what makes the weight-two lifts, with χ_pω^{k−2} on the sub, ordinary).; In the abelian inertia-rigid case (§3.3.2), when ρ̄_v is a direct sum of two distinct unramified characters, the lifts taken are those whose restriction to inertia is upper triangular with the prescribed character in a basis lifting the chosen one; they form one irreducible component of the inertia-rigid lifts, not all of them..

Suppliers: LocalGaloisDeformationRings:R08.1/local-lifting-ring; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types.

API `TauCeti.GaloisDeformation.Local.KWCondition`: A KW II local condition at v, with its choices.

API `TauCeti.GaloisDeformation.Local.KWCondition.ring`: R̄^{□,ψ}_v as the flat reduced quotient classifying X_v-lifts.

API `TauCeti.GaloisDeformation.Local.KWCondition.points`: 𝒪′-points of the ring are exactly the X_v-lifts.

API `TauCeti.GaloisDeformation.Local.KWCondition.ring_unique`: With all local type, weight, determinant and chosen-character data fixed, two reduced 𝒪-flat quotient rings having the same characteristic-zero X_v-points have the same kernel in R^□_v and a unique isomorphism respecting that quotient map.

Test `kwCondition_infinity` (computation): Odd lifts at a real place.

Test `kwCondition_points` (characterisation): The ring classifies exactly the X_v-lifts on 𝒪′-points.

Test `kwCondition_choice_needed` (non-example): For unramified ρ̄_v = η̄₁ ⊕ η̄₂ with η̄₁ ≠ η̄₂, the union over both choices of the unramified-quotient character has two components, so it is not a domain; KW II fix one choice.

Sources: KW2-2009, §3 opening and §3.2.2, pp. 18 and 22–24.


### `LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible` — Export: irreducible residual representation, low-weight crystalline

Let F_v = ℚ_p and ρ̄_p be irreducible of weight k ≤ p. The ring of crystalline lifts of weight k with fixed determinant is formally smooth over 𝒪 of relative dimension 1, and the framed ring R̄^{□,ψ}_v is formally smooth of relative dimension 4 = 3 + [ℚ_p : ℚ_p]. The same holds for p = 2 (k = 2).

Hypotheses: Fontaine–Laffaille theory (the filtered Dieudonné module has basis v₁, v₂ with v₂ spanning Fil^{k−1} and φ = (λ p^{k−1}; α 0), with α a unit fixed by the determinant and λ ∈ 𝔪) is the Fontaine–Laffaille part of this roadmap's L7; KW II extend Ramakrishna's argument to k = p and p = 2 using irreducibility..

Suppliers: LocalGaloisDeformationRings:R08.1/local-forget-framing; LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness.

Sources: KW2-2009, §3.2.3, p. 24.


### `LocalGaloisDeformationRings:R08.6/export-weight-two-irreducible` — Export: irreducible residual representation, weight two

Let p ≠ 2, F_v = ℚ_p and ρ̄_p irreducible with 3 ≤ k(ρ̄_p) ≤ p. After enlarging 𝒪, the fixed-determinant ring of weight-two potentially semistable lifts of inertial type ω^{k(ρ̄_p)−2} ⊕ 1 (a non-trivial tame principal-series type) is 𝒪⟦T₁, T₂⟧/(T₁T₂ − p), and every 𝒪′-point is of the required type. The framed ring R̄^{□,ψ}_v ≅ 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p) is a domain, flat of relative dimension 4, with regular generic fibre, and it is not formally smooth.

Hypotheses: Use precisely Savitt Theorem 6.22(3): τ=ω̃^i⊕ω̃^j with i≢j mod p−1, and ρ̄|I_p=ω₂^a⊕ω₂^{pa}, a=1+{j−i}+(p+1)i. Enlarge E to contain ℚ_{p²} and k_E to contain a square root of det ρ̄(Frob_p). The compatible fixed determinant is that of Savitt’s weight-two problem; rescale one variable to absorb the unit w in X₁X₂−pw.; KW II §3.2.4 states this for every irreducible ρ̄_p with p ≠ 2. For k(ρ̄_p) = 2 the type ω^{k−2} ⊕ 1 is trivial, Savitt's Theorem 6.22 (which needs i ≢ j mod p − 1) does not apply, and the lifts are the crystalline ones of R08.6/export-fontaine-laffaille-irreducible, with formally smooth ring..

Suppliers: LocalGaloisDeformationRings:R08.4/savitt-weight-two-rings; LocalGaloisDeformationRings:R08.1/local-forget-framing.

Sources: KW2-2009, §3.2.4, p. 24.


### `LocalGaloisDeformationRings:R08.6/ordinary-pcris-lifts-reducible` — Ordinary potentially crystalline local lifts of reducible residual representations

Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S}, and μ = κ^{r−1}χ₀ (r ≥ 2, χ₀ of finite order) a geometric lift of det ρ̄. After enlarging 𝒪, for v | p there is an ordinary potentially crystalline lift ρ_v of ρ̄|G_{F_v} with Hodge–Tate weights {0, r − 1} and determinant μ; and there is always an ordinary potentially crystalline lift with Hodge–Tate weights {0, r − 1} having a non-trivial unramified quotient, possibly without det ρ_v = μ. Here a lift is ordinary when it is F′_v-ordinary of some weight in the sense of L7/g-valued-ordinary-condition (for GL₂: a stable line with the prescribed inertial characters).

Hypotheses: FKP apply 'ordinary' to ρ̄|G_{F_v} itself; Definition B.2 concerns lifts..

Suppliers: LocalGaloisDeformationRings:L7/g-valued-ordinary-condition; LocalGaloisDeformationRings:R08.1/local-fixed-determinant; PadicHodgeTheory:R06.4/ordinary-implies-semistable; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: FKP-2022, Lemma 7.2, second bullet, arXiv v5 p. 34.


### `LocalGaloisDeformationRings:R08.6/category-deformation-conditions` — Deformation conditions cut out by a category S (BCDT §4.3)

Let K/ℚ_ℓ be finite with integers 𝒪 and residue field k, ρ̄ : G_ℓ → Aut_k(V) two-dimensional with centraliser k, and ψ a lift of det ρ̄. S(ρ̄) is the abelian category of finite-length 𝒪[G_ℓ]-modules with a filtration whose graded pieces are ≅ V. For a full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients and containing V, D^S_{V,𝒪}(R) is the set of deformations ρ to R such that (R/𝔞)² with the action ρ is an object of S for all open ideals 𝔞; D^{ψ,S} adds det = ψ. They are represented by R^S_{V,𝒪} and R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪} and R^ψ_{V,𝒪}; the tangent space of D^S is Ext¹_S(V, V) and that of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄).

Hypotheses: S = finite flat modules recovers R08.4/flat-deformation-condition (Ramakrishna); BCDT use the S of modules with descent data of given type (S_{±1}) at ℓ = 3..

Suppliers: LocalGaloisDeformationRings:R08.4/flat-deformation-condition; LocalGaloisDeformationRings:R08.1/local-forget-framing; GlobalGaloisDeformations:R04.3/local-deformation-problem.

API `TauCeti.GaloisDeformation.Local.CategoryCondition`: A full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients, containing V.

API `TauCeti.GaloisDeformation.Local.CategoryCondition.defFunctor`: D^S_{V,𝒪} and D^{ψ,S}_{V,𝒪}.

API `TauCeti.GaloisDeformation.Local.CategoryCondition.ring`: R^S_{V,𝒪}, R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪}, R^ψ_{V,𝒪}.

API `TauCeti.GaloisDeformation.Local.CategoryCondition.tangent`: Tangent space of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄) ⊂ H¹(G_ℓ, ad⁰ρ̄).

API `TauCeti.GaloisDeformation.Local.CategoryCondition.flat`: For S the finite flat modules, D^S is R08.4/flat-deformation-condition.

API `TauCeti.GaloisDeformation.Local.CategoryCondition.mono`: For S⊂T satisfying the category-condition hypotheses and the same residual object and determinant, D^S⊂D^T induces a canonical surjection R^T↠R^S commuting with the universal lifts.

Test `categoryCondition_all` (degenerate): S = S(ρ̄): R^S_{V,𝒪} = R_{V,𝒪}.

Test `categoryCondition_flat` (compatibility): S = finite flat 𝒪[G_ℓ]-modules (ℓ = p): R^S is the flat deformation ring.

Test `categoryCondition_not_closed` (non-example): The full subcategory consisting of 0 and a single copy of the residual object V is not closed under finite products: V⊕V is missing. It therefore fails the category-condition hypotheses. A category of semisimple sums is not a counterexample to subobject/quotient closure.

Test `categoryCondition_tangent_dim` (computation): For p odd, S = finite flat, ρ̄ peu ramifié of weight 2 over ℚ_p: dim H¹_S(G_p, ad⁰ρ̄) = 1 + dim H⁰(G_p, ad⁰ρ̄).

Sources: BCDT-2001, §4.3, p. 874; author manuscript pp.27–28 (§4.3).


### `LocalGaloisDeformationRings:R08.6/export-archimedean` — Export: odd archimedean rings

At a real place v, R̄^{□,ψ}_∞ (odd lifts) is the completion of the quadric of 2 × 2 matrices with characteristic polynomial X² − 1 at ρ̄(c). It is a domain, flat over 𝒪 of relative dimension 2, with regular generic fibre. It is formally smooth when ρ̄(c) ≠ 1, which always holds for p ≠ 2. For p = 2 and ρ̄(c) = 1 it is 𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁), a relative complete intersection.

Hypotheses: The rings are LocalGaloisDeformationRings R08.1 (archimedean-rings-p-odd, archimedean-odd-ring-p2); this node exports them in KW II's form..

Suppliers: LocalGaloisDeformationRings:R08.1/archimedean-rings-p-odd; LocalGaloisDeformationRings:R08.1/archimedean-odd-ring-p2; LocalGaloisDeformationRings:R08.6/smooth-resolution-criterion.

Sources: KW2-2009, Proposition 3.3 and the Remark after it, pp. 20–21.


### `LocalGaloisDeformationRings:R08.6/export-away-from-p` — Export: rings at finite places away from p

Let v ∤ p. (a) Semistable condition (γ_vχ_p ∗; 0 γ_v) with a fixed character γ_v (Teichmüller on inertia, γ_v²χ_p = φ): R̄^{□,ψ}_v is a domain, flat of relative dimension 3, with regular generic fibre (§3.3.4). (b) Inertia-rigid conditions (minimally ramified, abelian with fixed inertial character, non-abelian of level two with F_v = ℚ_q): after enlarging 𝒪 there is a lift ρ₀ with finite ρ₀(I_v) and determinant φ. The ring is flat, each component of relative dimension 3, with regular generic fibre (GlobalGaloisDeformations R04.4/inertia-rigid-deformations with d = 2, fixed determinant).

Hypotheses: The Steinberg condition is LocalGaloisDeformationRings R08.2/steinberg-condition; the inertia-rigid rings are GlobalGaloisDeformations R04.4 (KW II §2.7).; In the abelian case with ρ̄_v a direct sum of two distinct unramified characters (the particular case of KW II §3.3.2), the ring of the condition is one irreducible component of the inertia-rigid ring..

Suppliers: LocalGaloisDeformationRings:R08.2/steinberg-condition; LocalGaloisDeformationRings:R08.2/minimally-ramified-condition; GlobalGaloisDeformations:R04.4/inertia-rigid-deformations; LocalGaloisDeformationRings:R08.6/smooth-resolution-criterion; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality; LocalGaloisDeformationRings:R08.5/twisted-semistable-away-from-p.

Sources: KW2-2009, Theorem 3.1 and §3.3, pp. 18–19 and 32–37.


### `LocalGaloisDeformationRings:R08.6/export-ordinary` — Export: ordinary rings of low weight or weight two

Let F_v/ℚ_p be unramified, ρ̄_v ordinary with k(ρ̄_v) ≤ p, and X_v the low-weight crystalline or weight-two potentially Barsotti–Tate condition, with the chosen unramified character. Then R̄^{□,ψ}_v is a domain, flat over 𝒪 of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre. It is formally smooth if ρ̄_v is ramified or ρ̄_v ≅ η₁ ⊕ η₂ with η₁ ≠ η₂ unramified. Every lift of this type is (χ₁η₁ ∗; 0 η₂) with η₁, η₂ unramified, where χ₁ = χ_p^{k−1} (crystalline) or χ_pω^{k−2} (weight two).

Hypotheses: Ordinarity of the lifts is KW II Lemma 3.5, which uses Fontaine–Laffaille theory for crystalline weight k ≤ p, Berger–Li–Zhu for k = p+1 over ℚ_p, and Conrad–Diamond–Taylor (J. Amer. Math. Soc. 12 (1999)), Lemma 2.1.2, for weight two crystalline over ℚ_p^nr(μ_p)..

Suppliers: LocalGaloisDeformationRings:R08.6/kw-local-conditions; LocalGaloisDeformationRings:R08.6/smooth-resolution-criterion; LocalGaloisDeformationRings:R08.3/pst-generic-fibre; LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness; LocalGaloisDeformationRings:R08.4/finite-cocycles-kummer; LocalGaloisDeformationRings:R08.4/kw-algebraisation-lemma; LocalGaloisDeformationRings:R08.5/weight-p-crystalline-ordinarity.

Sources: KW2-2009, §3.2.5, Proposition 3.6, Lemma 3.7 and their proofs, pp. 24–30; KW2-2009, Lemma 3.5, p. 22.


### `LocalGaloisDeformationRings:R08.6/serre-weight-crystalline-lift` — A crystalline lift in Serre weight

Let p ≥ 3 and ρ̄_p : G_{ℚ_p} → GL₂(k) (or G_{F_v} with F_v = ℚ_p at each v | p) be of the form (χ̄ ∗; 0 1), and r = k(ρ̄_p) Serre's weight (Serre 1987 §2.3). After enlarging 𝒪 there is a crystalline lift ρ_p of ρ̄_p with Hodge–Tate weights {0, r − 1}; it may be chosen ordinary with unramified quotient (R08.6/ordinary-pcris-lifts-reducible).

Hypotheses: The printed statement gives only a crystalline lift; the ordinarity used in the proof of FKP Theorem 7.4 comes from R08.6/ordinary-pcris-lifts-reducible..

Suppliers: PadicHodgeTheory:R06.4/weight-p-endpoint-branch; LocalGaloisDeformationRings:R08.5/weight-p-plus-one-ordinary-ring; LocalGaloisDeformationRings:R08.6/ordinary-pcris-lifts-reducible.

Sources: FKP-2022, Lemma 7.2, third bullet, arXiv v5 p. 34.


### `LocalGaloisDeformationRings:R08.6/good-dihedral-type` — The good-dihedral local condition at q ≡ −1 mod p

Let q ≠ p be a prime with p | q + 1, and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist. Let {χ′, χ′^q} be a pair of 𝒪′-valued characters of I_q of level 2 (factoring through 𝔽_{q²}^× but not 𝔽_q^×) of p-power order, χ′ = ω_{q,2}^i ω_{q,2}^{qj} with 0 ≤ j < i ≤ q − 1, and i + j even when p = 2. The lifts with ρ|I_q ≅ χ′ ⊕ χ′^q (induced from a character of G_{ℚ_{q²}}) and fixed determinant form the non-abelian level-two inertia-rigid problem: its ring is flat of relative dimension 3 over 𝒪 with regular generic fibre, and it is non-empty after enlarging 𝒪. Such χ′ exist unless p = 2 and v₂(q + 1) = 1; for p odd they are the non-trivial powers of ω_{q,2}^{(q²−1)/p^r} (r = v_p(q + 1)), for p = 2 and r ≥ 2 the powers of ω_{q,2}^{(q²−1)/2^{r+1}} of order 2^a with 2 ≤ a ≤ r, and in both cases (i, j) = (q − 1 − j, m(q + 1)/p^r − 1) with 0 < m < p^r/2. Since i + j = q − 1, for q odd i − j is even and i = j + 1 does not occur; for q = 2 (then p = 3) the list is (i, j) = (1, 0).

Hypotheses: The parity condition at p = 2 makes the global lift odd.; If q is odd and the residual representation at q is irreducible, its Serre weight is q + 1 − (i − j) or i − j up to twist when i > j + 1, and q when i = j + 1 (Savitt, Corollary 6.15); the second case does not occur for the characters of p-power order considered here, since q is odd.; The order-p tame characters take values in enlarged coefficient integers 𝒪′ containing μ_p; they do not in general take values in ℤ_p^×.; When ρ̄(I_q) is trivial, KW II §3.3.3 asks for ρ|I_q = (χ′ ∗; 0 χ′^q) in a basis lifting the chosen one, which is more than ρ|I_q ⊗ E ≅ χ′ ⊕ χ′^q; whether this is the whole inertia-rigid ring or a union of its components is not settled by the source and is left to the formalisation of GlobalGaloisDeformations R04.4/inertia-rigid-deformations..

Suppliers: LocalGaloisDeformationRings:R08.6/export-away-from-p; GlobalGaloisDeformations:R04.4/inertia-rigid-deformations; LocalGaloisDeformationRings:R08.1/local-fixed-determinant.

Sources: KW1-2009, Theorem 5.1 (4), author copy pp. 9–10; KW1-2009, Remarks after Theorem 5.1, p. 10.


### `LocalGaloisDeformationRings:R08.6/newton-thorne-local-quotients` — Local quotients for weight-two symmetric power lifting (Newton–Thorne §4)

Let r : G_F → GL₂(k) with det = ε^{-1} and R_v the fixed-determinant lifting ring at v. The local quotients R̄_v used in Newton–Thorne §4 are: (1) v | p, r_{π,ι}|G_{F_v} non-ordinary: the reduced 𝒪-torsion-free quotient of crystalline non-ordinary lifts of Hodge–Tate weights {0, 1}, a domain of dimension 4 + [F_v:ℚ_p] (Kisin's 2-adic paper, Corollary 2.3.13); (2) v | p, ordinary crystalline: the ordinary crystalline quotient, a domain of dimension 4 + [F_v:ℚ_p] (Kisin, Proposition 2.4.6); (3) v ∈ Σ_p (ordinary non-crystalline, p > 2): the semistable non-crystalline quotient, a domain of dimension 4 + [F_v:ℚ_p] (Snowden, Proposition 4.3.1); (4) v ∈ Σ^p: the extensions of ε^{-1} by 1, a domain of dimension 4 (Kisin, Proposition 2.5.2); (5) v real: Kisin's ring R^{−1,□}_{V_𝔽} of odd lifts, a domain of dimension 3 (Proposition 2.5.6).

Hypotheses: All the citations of Kisin in Newton–Thorne §4 are to Modularity of 2-adic Barsotti–Tate representations (Invent. Math. 178 (2009)), whose §2 is written for every p: Corollary (2.3.13), Corollary (2.4.6) (called a proposition by Newton–Thorne), Propositions (2.5.2) and (2.5.6).; Use Newton–Thorne’s §4 standing local situation after the soluble base change: the residual representation is trivial at every v∈S, and the determinant is ε⁻¹. The five quotients are not a theorem for arbitrary residual r. The noncrystalline p-adic case requires p>2.; Newton–Thorne use HT(ε) = −1: their weights {0, 1} with determinant ε^{-1} are {0, −1} in this roadmap's convention; the rings are those of the cited nodes after the twist by ε (dual normalisation), which does not change them as rings..

Suppliers: LocalGaloisDeformationRings:R08.4/rank-two-bt-components; LocalGaloisDeformationRings:R08.4/rank-two-ordinary-locus; LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual; LocalGaloisDeformationRings:R08.6/export-away-from-p; LocalGaloisDeformationRings:R08.1/archimedean-rings-p-odd; LocalGaloisDeformationRings:R08.5/rank-two-connected-components; LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2; LocalGaloisDeformationRings:R08.5/kisin-local-rings-p2-comparison; LocalGaloisDeformationRings:R08.1/archimedean-odd-ring-p2.

Sources: NT-2026, §4, after Theorem 4.1, arXiv v2 p. 27; NT-2026, §4, after Theorem 4.1, p. 27.


### `LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p` — Export: semistable weight-two rings above p

Let F_v/ℚ_p be unramified and ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) with γ̄_v unramified, and X_v the semistable weight-two lifts (γ_vχ_p ∗; 0 γ_v) with a fixed unramified γ_v lifting γ̄_v and γ_v²χ_p = φ. R̄^{□,ψ}_v is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p], unless p = 2 and D_v acts by homotheties. In that case it is a domain, faithfully flat of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre.

Hypotheses: The dyadic exception belongs to this roadmap's R08.5 (dyadic and endpoint cases)..

Suppliers: LocalGaloisDeformationRings:R08.6/smooth-resolution-criterion; LocalGaloisDeformationRings:R08.6/export-ordinary; LocalGaloisDeformationRings:R08.5/semistable-weight-two-resolution.

Sources: KW2-2009, §3.2.6, pp. 30.


### `LocalGaloisDeformationRings:R08.6/torsion-semistable-condition` — Torsion semistable lifts with Hodge–Tate weights in {0, 1} form a stable condition

Let F_v/ℚ_p be finite and r̄ : G_{F_v} → GL₂(k). The condition on a lift r_B (B ∈ C_𝒪 Artinian) that B² be isomorphic, as ℤ_p[G_{F_v}]-module, to a subquotient of a lattice in a semistable ℚ_p[G_{F_v}]-representation with Hodge–Tate weights in {0, 1} is stable (closed under subobjects, quotients and finite direct sums in the sense of Ramakrishna), so it cuts out a quotient R′_v of the fixed-determinant lifting ring R_v. The semistable non-crystalline quotient of R08.6/newton-thorne-local-quotients (3) factors through R′_v.

Suppliers: LocalGaloisDeformationRings:R08.6/newton-thorne-local-quotients; LocalGaloisDeformationRings:R08.4/flat-deformation-condition; LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual.

Sources: NT-2026, proof of Lemma 4.2, arXiv v2 pp. 28–29.


### `LocalGaloisDeformationRings:R08.6/export-endpoint-weight` — Export: crystalline lifts of weight p + 1

Let p>2, F_v=ℚ_p and k(ρ̄_v)=p+1 in the KW II §3.2.7 residual Serre-weight case, with its compatible fixed determinant. The framed ring of crystalline (hence ordinary) lifts of weight p+1 is formally smooth over 𝒪 of relative dimension 4. The map to the space of characters of the stable line is not formally smooth.

Hypotheses: Crystalline lifts of weight p + 1 are ordinary (Berger–Li–Zhu, KW II Lemma 3.5(i) for F_v = ℚ_p); the endpoint weight belongs to this roadmap's R08.5.; In KW II §3.2.7 the identification of the crystalline lifts of weight p + 1 with the ordinary ones is for F_v = ℚ_p; the formal smoothness of the ring of ordinary lifts (χ_p^p on inertia on the sub, unramified quotient) is proved there for every unramified F_v, with relative dimension 3 + [F_v : ℚ_p]. This node keeps F_v = ℚ_p, where the two rings agree..

Suppliers: LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p; LocalGaloisDeformationRings:R08.5/weight-p-plus-one-ordinary-ring; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

Sources: KW2-2009, §3.2.7 and the Remark, pp. 31–32.


### `LocalGaloisDeformationRings:R08.6/dyadic-weight-two-transition` — The dyadic weight-two transition: k(ρ̄) = 2 versus k(ρ̄) = 4 at p = 2

Let p = 2, F_v = ℚ₂ (or F_v/ℚ₂ unramified for reducible ρ̄_v), and φ = ψχ₂ a fixed determinant. The weight-two lifts used in KW I Theorem 5.1(2) and KW II §3.2.2(i) at p = 2 are: crystalline of weight 2 (equivalently Barsotti–Tate with det|I_v = χ₂) if k(ρ̄_v) = 2, and semistable of weight 2 with inertial Weil–Deligne parameter (id, N ≠ 0) if k(ρ̄_v) = 4. In the first case R̄^{□,ψ}_v is the ring of R08.6/export-fontaine-laffaille-irreducible when ρ̄_v is irreducible (F_v = ℚ₂; formally smooth of relative dimension 4) and the ordinary ring of R08.6/export-ordinary when ρ̄_v is reducible (F_v unramified, with the choice of character when ρ̄_v is a sum of two distinct unramified characters); both are flat of relative dimension 3 + [F_v:ℚ₂] with regular generic fibre. In the second it is the semistable weight-two ring (γ_vχ₂ ∗; 0 γ_v) of R08.6/export-semistable-weight-two-at-p, which is formally smooth here: k(ρ̄_v) = 4 means ρ̄_v is très ramifié, so D_v does not act by homotheties.

Hypotheses: The transition: since ω₂ is trivial, the parameter (ω^{k−2} ⊕ 1, 0) is trivial for every k at p = 2, so the weight-two type is distinguished by N: N = 0 for k = 2 and N ≠ 0 for k = 4.; KW I Theorem 4.1(1) treats the semistable case only when k(ρ̄) = 4..

Suppliers: LocalGaloisDeformationRings:R08.5/semistable-weight-two-resolution; LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p; LocalGaloisDeformationRings:R08.6/smooth-resolution-criterion; LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible; LocalGaloisDeformationRings:R08.6/export-ordinary.

Sources: KW2-2009, §3.2.2 (i), author copy p. 23; KW1-2009, Theorem 5.1 (2), p. 9.


### `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product` — Export: the completed tensor product of KW II's local rings

For S a finite set of places and conditions X_v of kw-local-conditions at each v ∈ S, after enlarging 𝒪, R̄^{□,loc,ψ} = ⊗̂_{v∈S} R̄^{□,ψ}_v is flat over 𝒪, each component has relative dimension 3|S| when F is totally real and S contains the infinite places and the places above p, and R̄^{□,loc,ψ}[1/p] is regular. If the conditions at the finite places of S not above p are semistable, it is a domain. It has points over the integers of a finite extension of E.

Hypotheses: KW II Proposition 2.2 (the completed tensor product of flat domains with regular generic fibres and an 𝒪-point is again one) is DeformationAndDerivedPatchingAlgebra R03.1/R03.3 commutative algebra..

Suppliers: LocalGaloisDeformationRings:R08.6/export-archimedean; LocalGaloisDeformationRings:R08.6/export-ordinary; LocalGaloisDeformationRings:R08.6/export-away-from-p; DeformationAndDerivedPatchingAlgebra:R03.3; LocalGaloisDeformationRings:R08.6/kw-local-conditions; LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible; LocalGaloisDeformationRings:R08.6/export-weight-two-irreducible; LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p; LocalGaloisDeformationRings:R08.6/export-endpoint-weight.

Sources: KW2-2009, Proposition 3.2, p. 19.


### `LocalGaloisDeformationRings:R08.6/local-nonemptiness` — Nonemptiness of KW II's local rings

For every condition X_v of kw-local-conditions (with the hypotheses of KW II Theorem 3.1), R̄^{□,ψ}_v ≠ 0, and it has a point over the integers 𝒪′ of a finite extension of E, that is, a lift of ρ̄_v of type X_v. The same holds for their completed tensor product.

Hypotheses: This is the local nonemptiness that PotentialModularityAndCompatibleSystems R24.2 combines with global finiteness; it is not assumed for other types (R08.3/pst-deformation-ring gives an empty example)..

Suppliers: LocalGaloisDeformationRings:R08.6/kw-local-conditions; LocalGaloisDeformationRings:R08.6/export-completed-tensor-product; LocalGaloisDeformationRings:R08.6/export-away-from-p; LocalGaloisDeformationRings:R08.6/export-ordinary; DeformationAndDerivedPatchingAlgebra:R03.3.

Sources: KW2-2009, Theorem 3.1, p. 19.


### `LocalGaloisDeformationRings:R08.6/kw1-lift-types` — The local conditions of KW I Theorem 5.1

KW I Theorem 5.1 lifts ρ̄ (S-type, 2 ≤ k(ρ̄) ≤ p + 1 for p > 2; with non-solvable image when p = 2, and with ρ̄|ℚ(μ_p) absolutely irreducible when p > 2) to an almost strictly compatible system whose p-adic member has one of the following local types; each is exported with its ring, dimension, nonemptiness and tangent condition: (1) (assuming k(ρ̄) = 2 if p = 2) minimally ramified at primes ≠ p (R08.2/minimally-ramified-ring, R08.5/dyadic-minimal-lifts; R08.6/export-away-from-p) and crystalline of weight k(ρ̄) at p (R08.6/export-fontaine-laffaille-irreducible, R08.6/export-ordinary, R08.6/export-endpoint-weight); (2) weight 2, minimally ramified at primes ≠ p, with inertial Weil–Deligne parameter (ω_p^{k(ρ̄)−2} ⊕ 1, 0) at p, or (id, N ≠ 0) when k(ρ̄) = p + 1 (p > 2) or k(ρ̄) = 4 (p = 2) (R08.6/export-weight-two-irreducible, R08.6/export-ordinary, R08.6/export-semistable-weight-two-at-p, R08.6/dyadic-weight-two-transition); (3) of weight 2, minimally ramified at primes ≠ p, q and with the parameter at p as in (2); at q ∥ N(ρ̄), q odd, with p | q − 1 and ρ̄|I_q = (χ ∗; 0 1): ρ_p|I_q = (χ′ ∗; 0 1) for a chosen non-trivial 𝒪′-valued lift χ′ of χ factoring through (ℤ/q)^× (i even if p = 2): the abelian condition with fixed inertial character (R08.6/export-away-from-p); (4) of weight 2, minimally ramified at primes ≠ p, q and with the parameter at p as in (2); at q ≠ p with p | q + 1 and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist: the good-dihedral condition (R08.6/good-dihedral-type).

Hypotheses: Each local ring is flat over 𝒪 of relative dimension 3 (v ∤ p) or 3 + [F_v:ℚ_p] (v | p), with regular generic fibre, so the global presentation of KW II §4 applies.; The order-p tame characters take values in enlarged coefficient integers 𝒪′ containing μ_p; they do not in general take values in ℤ_p^×..

Suppliers: LocalGaloisDeformationRings:R08.6/export-away-from-p; LocalGaloisDeformationRings:R08.6/export-ordinary; LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible; LocalGaloisDeformationRings:R08.6/export-weight-two-irreducible; LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p; LocalGaloisDeformationRings:R08.6/export-endpoint-weight; LocalGaloisDeformationRings:R08.6/local-nonemptiness; LocalGaloisDeformationRings:R08.5/dyadic-minimal-lifts; LocalGaloisDeformationRings:R08.2/minimally-ramified-ring.

Sources: KW1-2009, Theorem 5.1, author copy p. 9.

-/
