/-
Suggested Lean declarations for `SchemeKTheoryOperationsPartII`
(K-theory of schemes, localisation and operations, Part II: supported formal K-theory and
derived intersection degrees).

This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/SchemeKTheoryOperationsPartII.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures.

Neither Mathlib (082e2d3) nor Tau Ceti (f790474) has formal schemes, coherent formal modules or
their Tor sheaves. The formal-scheme declarations of the roadmap (`TauCeti.FormalScheme.K0Coh`,
`K0Supp`, `K0Supp.cup`, `torPairing`, `eulerDegree`, `derivedEuler`, …) are therefore README
targets. On `Spf A` every object of the roadmap is the corresponding object of `Spec A`
(target `FK.1/affine-transport`), so this file states the affine and local-algebra incarnations
over carriers that exist at the pins: these are the base cases the formal-scheme declarations
must restrict to. Definitions have real bodies; theorems and tests are proved by `sorry`.
-/
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Support
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.CategoryTheory.Monoidal.Tor
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Basic
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.CategoryTheory.Abelian.Projective.Resolution
import TauCeti.Algebra.Category.ModuleCat.CartanMap

universe u

open CategoryTheory
open scoped TensorProduct

namespace TauCeti.FormalScheme

/-! ### FK.0 — formal support, read on the sections of `Spf A`

`FK.0/formal-support`: a coherent module `M^Δ` on `Spf A` is formally supported on `Spf (A ⧸ J)`
when a power of `J` kills `M`. The sheaf-level predicate `IsFormallySupported 𝒥 F` on a locally
noetherian formal scheme is a README target. -/

section Support

variable {A : Type u} [CommRing A]

/-- The module `M` (the sections of `M^Δ` on `Spf A`) is killed by a power of `J`. -/
def IsFormallySupportedModule (J : Ideal A) (M : Type*) [AddCommGroup M] [Module A M] : Prop :=
  ∃ n : ℕ, ∀ a ∈ J ^ n, ∀ m : M, a • m = 0

/-- `FK.0/formal-support`, API `isFormallySupported_Spf_iff`: over a noetherian ring, formal
support of a finite module is support in `V(J) ⊆ Spec A` (Stacks 00L6). -/
theorem isFormallySupported_Spf_iff [IsNoetherianRing A] (J : Ideal A) (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Finite A M] :
    IsFormallySupportedModule J M ↔ Module.support A M ⊆ PrimeSpectrum.zeroLocus (J : Set A) := by
  sorry

/-- `isFormallySupported_quotient` (computation). -/
example (J : Ideal A) (n : ℕ) : IsFormallySupportedModule J (A ⧸ J ^ n) := by
  sorry

/-- `not_isFormallySupported_structureSheaf` (non-example): on `Spf ℤ_p`, the structure sheaf is
not formally supported on `V(p)`, although its topological support is `|V(p)|`. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsFormallySupportedModule (Ideal.span {(p : ℤ_[p])}) ℤ_[p] := by
  sorry

/-- `isFormallySupported_whole_empty` (degenerate): every module is supported on `Y = X`
(ideal `⊥`), and only zero modules on `Y = ∅` (ideal `⊤`). -/
example (M : Type*) [AddCommGroup M] [Module A M] :
    IsFormallySupportedModule (⊥ : Ideal A) M ∧ (IsFormallySupportedModule (⊤ : Ideal A) M ↔ Subsingleton M) := by
  sorry

/-- API `IsFormallySupportedModule.mono`: support on `Y = V(J)` implies support on any `Y′ = V(J′) ⊇ Y`
with `J′ ≤ J`. -/
theorem IsFormallySupportedModule.mono {J J' : Ideal A} (h : J' ≤ J) {M : Type*} [AddCommGroup M]
    [Module A M] (hM : IsFormallySupportedModule J M) : IsFormallySupportedModule J' M := by
  sorry

end Support

/-! ### FK.0 — local algebra of stalks

`FK.0/stalk-completion-comparison`: the stalk of `Spf A` at an open prime `p`, the localisation
`A_p` and the completed localisation share their completion, so dimension and regularity can be
read on `A_p`. The local statements below are the inputs. -/

section LocalAlgebra

variable (R : Type u) [CommRing R]

/-- In an `I`-adically complete ring every maximal ideal contains `I`: the closed points of
`|Spf A|` are the maximal ideals of `A`. -/
example (I : Ideal R) [IsAdicComplete I R] : I ≤ (⊥ : Ideal R).jacobson :=
  IsAdicComplete.le_jacobson_bot I

/-- Completing a noetherian local ring along an ideal inside its maximal ideal preserves the Krull
dimension (Stacks 07NV, applied to the common `m`-adic completion). -/
theorem ringKrullDim_adicCompletion [IsNoetherianRing R] [IsLocalRing R] (I : Ideal R)
    (hI : I ≤ IsLocalRing.maximalIdeal R) :
    ringKrullDim (AdicCompletion I R) = ringKrullDim R := by
  sorry

/-- Regularity is read on the completion (Stacks 07NY). -/
theorem isRegularLocalRing_adicCompletion_iff [IsNoetherianRing R] [IsLocalRing R] (I : Ideal R)
    (hI : I ≤ IsLocalRing.maximalIdeal R) :
    IsRegularLocalRing (AdicCompletion I R) ↔ IsRegularLocalRing R := by
  sorry

/-- `FK.0/formal-codimension-formula`, local form: in a regular (hence Cohen–Macaulay) local ring,
height plus dimension of the quotient is the dimension (Stacks 00NA). -/
theorem height_add_ringKrullDim_quotient [IsRegularLocalRing R] (I : Ideal R) (hI : I ≠ ⊤) :
    (I.height : WithBot ℕ∞) + ringKrullDim (R ⧸ I) = ringKrullDim R := by
  sorry

/-- `dim_Spf_powerSeries` (computation): `dim Spf ℤ_p⟦t⟧ = 2`, although its underlying space is a
point. -/
example (p : ℕ) [Fact p.Prime] : ringKrullDim (PowerSeries ℤ_[p]) = 2 := by
  sorry

/-- `not_isRegular_node` (non-example): `k⟦x, y⟧/(xy)` is not a regular local ring. -/
example (k : Type u) [Field k] :
    ¬ IsRegularLocalRing (MvPowerSeries (Fin 2) k ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)}) := by
  sorry

end LocalAlgebra

/-! ### FK.3 — Tor vanishing in expected dimension, local form

`FK.3/expected-dimension-tor-vanishing` (Zhang, Lemma B.2(i)): at a point of `Z₁ ∩ Z₂`, if `Z₁` is
cut out by a regular sequence `f` and `f` stays (weakly) regular on `O_{Z₂}`, the higher Tor of
the two structure sheaves vanishes. The Cohen–Macaulay dimension criterion that produces the weak
regularity is SchemeAndStackFoundations' and is not at the pins. -/

section TorVanishing

variable {R : Type u} [CommRing R]

/-- Higher Tor of `R ⧸ (f)` and `R ⧸ J` vanishes when `f` is regular on `R` and weakly regular on
`R ⧸ J` (Koszul resolution, Stacks 062F). -/
theorem tor_quotient_ofList_isZero {f : List R} (hf : RingTheory.Sequence.IsRegular R f)
    (J : Ideal R) (hfJ : RingTheory.Sequence.IsWeaklyRegular (R ⧸ J) f) (i : ℕ) (hi : 0 < i) :
    Limits.IsZero (((Tor (ModuleCat.{u} R) i).obj (ModuleCat.of R (R ⧸ Ideal.ofList f))).obj
      (ModuleCat.of R (R ⧸ J))) := by
  sorry

/-- `FK.4/zero-dimensional-pairing`, local form: over a regular local domain of dimension `d`, the
alternating sum of the lengths of `Tor_i(k, M)` (the Betti numbers of `M`) is the generic rank of
`M`; it vanishes for torsion `M`, i.e. for supports of codimension `≥ 1`. -/
theorem eulerChar_tor_residueField_eq_rank [IsRegularLocalRing R]
    (d : ℕ) (hd : ringKrullDim R = d) (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] :
    (∑ i ∈ Finset.range (d + 1), (-1 : ℤ) ^ i *
        ((Module.length R (((Tor (ModuleCat.{u} R) i).obj
          (ModuleCat.of R (IsLocalRing.ResidueField R))).obj (ModuleCat.of R M))).toNat : ℤ)) =
      Module.finrank (FractionRing R) (FractionRing R ⊗[R] M) := by
  sorry

end TorVanishing

/-! ### FK.1 and FK.2 — `K′₀` and the regular comparison on `Spf A`

`FK.1/coherent-grothendieck-group`, API `K0Coh.SpfEquiv`: `K′₀(Spf A) ≅ G₀(A)`, Tau Ceti's exact
`K₀` of finitely generated modules. `FK.2/regular-supported-comparison` with `Y = X` on `Spf A`
is the bijectivity of Tau Ceti's Cartan map for a regular ring of finite dimension. -/

section KTheory

/-- `K′₀(Spf A)`, through `Γ`: the Grothendieck group of finitely generated `A`-modules. -/
abbrev K0CohSpf (A : Type u) [CommRing A] : Type u :=
  TauCeti.ExactK0.{u} (TauCeti.finiteModulesExactStructure A)

/-- `K0Coh_Spf_padic` (computation): `K′₀(Spf ℤ_p) ≅ ℤ` by generic rank. -/
example (p : ℕ) [Fact p.Prime] : Nonempty (K0CohSpf ℤ_[p] ≃+ ℤ) := by
  sorry

/-- `K0Coh_Spf_node` (computation): `K′₀(Spf k⟦x, y⟧/(xy)) ≅ ℤ²`, by the ranks at the two minimal
primes. -/
example (k : Type u) [Field k] :
    Nonempty (K0CohSpf (MvPowerSeries (Fin 2) k ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)}) ≃+ ℤ × ℤ) := by
  sorry

/-- `FK.2/regular-supported-comparison` for `Y = X = Spf A`: the formal Cartan map is bijective
when `A` is regular of finite Krull dimension. -/
theorem cartanMap_bijective_of_isRegularRing (A : Type u) [CommRing A] [IsRegularRing A]
    (hA : ringKrullDim A < ⊤) : Function.Bijective (TauCeti.cartanMap A) := by
  sorry

/-- `homologyClass_node_not_surjective` (non-example): without regularity the Cartan map is not
surjective (`ℤ → ℤ²` for the node). -/
example (k : Type u) [Field k] :
    ¬ Function.Surjective (TauCeti.cartanMap (MvPowerSeries (Fin 2) k ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)})) := by
  sorry

end KTheory

/-! ### FK.4 — the Euler degree over a complete discrete valuation ring

`FK.4/euler-degree`: for `W` a scheme proper over `Spf A`, `deg [E] = Σ (-1)^i length_A H^i(W, E)`.
Its base case is the length of a torsion module over the discrete valuation ring. -/

section EulerDegree

/-- `eulerDegree_torsion_module` (computation): `deg [O_{Spec A/ϖ^n}] = n`. -/
theorem eulerDegree_torsion_module (A : Type u) [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] {ϖ : A} (hϖ : Irreducible ϖ) (n : ℕ) :
    Module.length A (A ⧸ Ideal.span {ϖ ^ n}) = n := by
  sorry

/-- `FK.4/euler-degree-base-change` (b): for a finite extension of discrete valuation rings with
residue degree `f`, `A`-lengths are `f` times `A′`-lengths. -/
theorem length_restrictScalars_eq (A A' : Type u) [CommRing A] [CommRing A'] [IsDomain A]
    [IsDiscreteValuationRing A] [IsDomain A'] [IsDiscreteValuationRing A'] [Algebra A A']
    [Module.Finite A A'] (f : ℕ) (hf : Module.length A (IsLocalRing.ResidueField A') = f)
    (M : Type u) [AddCommGroup M] [Module A' M] [Module A M] [IsScalarTower A A' M]
    (hM : Module.length A' M < ⊤) :
    Module.length A M = f * Module.length A' M := by
  sorry

/-- `FK.4/euler-degree-base-change` (c): for a flat map of discrete valuation rings with
closed-fibre length `e`, base change multiplies finite lengths by `e`. -/
theorem length_baseChange_eq (A A' : Type u) [CommRing A] [CommRing A'] [IsDomain A]
    [IsDiscreteValuationRing A] [IsDomain A'] [IsDiscreteValuationRing A'] [Algebra A A']
    [Module.Flat A A'] (e : ℕ)
    (he : Module.length A' (A' ⧸ Ideal.map (algebraMap A A') (IsLocalRing.maximalIdeal A)) = e)
    (M : Type u) [AddCommGroup M] [Module A M] (hM : Module.length A M < ⊤) :
    Module.length A' (A' ⊗[A] M) = e * Module.length A M := by
  sorry

end EulerDegree

end TauCeti.FormalScheme
