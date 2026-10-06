import Mathlib.RingTheory.PowerSeries.Ideal
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.Ideal.Height
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.IntegralClosure.IsIntegralClosure.Basic
import Mathlib.RingTheory.Polynomial.Eisenstein.Distinguished
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic

/-!
# Suggested declarations: Euler systems and Kolyvagin systems, layer ES.8

*This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/EulerSystemsAndKolyvaginSystems--ES.8.md` and the blueprint packet
`research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.8.json` are definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is implemented.*

Layer ES.8 is the rank-one Iwasawa variation of the Euler-system and Kolyvagin-system machine:

* Rubin's Iwasawa theory of Euler systems over a `ℤ_p^d`-extension `K∞/K` in which no finite
  prime splits completely (*Euler systems*, Chapters II §3, VI and VII): `X∞`, `ind_Λ(c)`,
  the weak Leopoldt theorem and the divisibility `char(X∞) ∣ ind_Λ(c)`;
* Mazur–Rubin's Λ-adic Kolyvagin systems (*Kolyvagin systems*, §5.3), specialization at
  height-one primes, the blind spot and Λ-primitivity, and Theorem 5.3.10;
* Howard's self-dual bound (Theorem 2.2.10) and its error-tolerant form (Castella–Grossi–Lee–
  Skinner, Theorem 3.4.1).

The file imports Mathlib only. The commutative algebra of the layer (the Λ-index, Mazur–Rubin's
principal index, the blind spot, Λ-primitivity, the exceptional set, the rings `S_𝔓`, the
decomposition data of a `ℤ_p^d`-extension, the statable parts of Rubin's hypotheses and the
Λ-adic Selmer data) is written as real declarations against Mathlib. Galois cohomology of number
fields, Euler systems and Kolyvagin systems have no carrier in the pinned libraries: their
owners are `SelmerIwasawaCohomology` L2–L3 and `EulerSystemsAndKolyvaginSystems` ES.0–ES.5.
For those declarations the suggested signature is recorded in a comment under the name the
packet gives it, to be turned into a declaration once the carrier exists. The characteristic
ideal of `PadicMeasuresIwasawaAlgebras` L4 (`TauCeti.Iwasawa.charIdeal`) is represented by the
stand-in `charIdeal` below, with the same shape as in that roadmap's suggested file.
-/

noncomputable section

open scoped TensorProduct

namespace TauCeti

/-! ## Stand-ins for the Iwasawa-algebra supplier (PadicMeasuresIwasawaAlgebras L4) -/

namespace EulerSystem

section Supplier

variable (Λ : Type*) [CommRing Λ]

/-- Rubin's pseudo-null modules (*Euler systems*, Chapter II §3): annihilated by an ideal of
height at least two. For `Λ = O⟦ℤ_p^d⟧` with `d ≥ 2` such modules need not be finite. -/
def IsPseudoNull (M : Type*) [AddCommGroup M] [Module Λ M] : Prop :=
  ∃ I : Ideal Λ, 2 ≤ I.height ∧ ∀ a ∈ I, ∀ m : M, a • m = 0

/-- A pseudo-isomorphism: a Λ-linear map with pseudo-null kernel and cokernel. -/
def IsPseudoIso {M N : Type*} [AddCommGroup M] [Module Λ M] [AddCommGroup N] [Module Λ N]
    (f : M →ₗ[Λ] N) : Prop :=
  IsPseudoNull Λ (LinearMap.ker f) ∧ IsPseudoNull Λ (N ⧸ LinearMap.range f)

/-- Stand-in for `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
(`TauCeti.Iwasawa.charIdeal`): the characteristic ideal of a finitely generated module, with
Rubin's convention that it is `0` for a non-torsion module. -/
def charIdeal (M : Type*) [AddCommGroup M] [Module Λ M] : Ideal Λ := sorry

end Supplier

/-! ## `ES.8/admissible-zp-d-extension` -/

section Tower

variable (p : ℕ) [Fact p.Prime] (P : Type*)

/-- **`ES.8/admissible-zp-d-extension`** (prototype carrier). A `ℤ_p^d`-extension `K∞/K`, recorded
through `Γ ≅ ℤ_p^d` (written additively as `Fin d → ℤ_[p]`) and, for each finite prime `v ∈ P`
of `K`, its decomposition and inertia subgroups. The Galois-theoretic structure (an abelian
extension `K∞ ⊂ K̄` with a topological isomorphism `Gal(K∞/K) ≅ ℤ_p^d`) replaces this carrier. -/
structure ZpdExtension where
  /-- the rank `d ≥ 1` -/
  d : ℕ
  one_le_d : 1 ≤ d
  /-- the decomposition group `D_v ⊂ Γ` -/
  decomp : P → AddSubgroup (Fin d → ℤ_[p])
  /-- the inertia group `I_v ⊂ D_v` -/
  inertia : P → AddSubgroup (Fin d → ℤ_[p])
  inertia_le_decomp : ∀ v, inertia v ≤ decomp v

namespace ZpdExtension

variable {p P}

/-- No finite prime splits completely in `K∞/K`. -/
def NoSplitPrimes (E : ZpdExtension p P) : Prop :=
  ∀ v, E.decomp v ≠ ⊥

/-- `NoSplitPrimes ↔` every decomposition group is infinite (`ℤ_p^d` has no nonzero finite
subgroups; Rubin, Remark II.1.2). -/
theorem noSplitPrimes_iff_infinite_decompositionGroup (E : ZpdExtension p P) :
    E.NoSplitPrimes ↔ ∀ v, Infinite (E.decomp v) := sorry

/-- If `K∞ ⊂ K∞'` and the projection `Γ' ↠ Γ` maps `D'_v` onto `D_v`, admissibility of `K∞/K`
gives admissibility of `K∞'/K`. -/
theorem noSplitPrimes_mono (E E' : ZpdExtension p P)
    (π : (Fin E'.d → ℤ_[p]) →+ (Fin E.d → ℤ_[p]))
    (hπ : ∀ v, (E'.decomp v).map π = E.decomp v) (h : E.NoSplitPrimes) :
    E'.NoSplitPrimes := sorry

/-- The Iwasawa algebra `Λ = O[[Γ]] ≅ O⟦T₁, …, T_d⟧`; a stand-in for the completed group ring of
`PadicMeasuresIwasawaAlgebras` L1, through Mathlib's `MvPowerSeries`. -/
abbrev iwasawaAlgebra (O : Type*) [CommRing O] (E : ZpdExtension p P) : Type _ :=
  MvPowerSeries (Fin E.d) O

/-- The finite layers `F` correspond to the open subgroups `U ⊂ Γ`, of `p`-power index. -/
theorem layer_finite (E : ZpdExtension p P) (U : AddSubgroup (Fin E.d → ℤ_[p]))
    (hU : IsOpen (U : Set (Fin E.d → ℤ_[p]))) : ∃ n : ℕ, U.index = p ^ n := sorry

/- Suggested signatures awaiting the arithmetic carrier (number field `K`, the Galois group of
`K∞/K`, its primes):
* `TauCeti.EulerSystem.ZpdExtension.unramified_of_not_dvd_p : ¬ v ∣ p → E.inertia v = ⊥`
* `TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_of_cyclotomic_le :
    K^cyc ≤ K∞ → E.NoSplitPrimes` (the cyclotomic tower from `IsCyclotomicExtension`)
* test `TauCeti.EulerSystem.ZpdExtension.cyclotomic_rat_noSplitPrimes`: `Q∞/Q` is admissible
  (see the `example` on the Frobenius of `ℓ` below)
* test `TauCeti.EulerSystem.ZpdExtension.anticyclotomic_not_noSplitPrimes`: for `K = ℚ(√-7)`,
  `p = 3`, the prime `5` splits completely in the anticyclotomic `ℤ_3`-extension. -/

/-- Test `TauCeti.EulerSystem.ZpdExtension.cyclotomic_rat_noSplitPrimes` (arithmetic core): the
Frobenius of `ℓ ≠ p` acts on `μ_{p^∞}` by `ℓ ∈ ℤ_p^×`, which has infinite order. -/
example (ℓ : ℕ) (hℓ : 1 < ℓ) (n : ℕ) (hn : 0 < n) : ((ℓ : ℤ_[p]) ^ n) ≠ 1 := sorry

/-- Test `TauCeti.EulerSystem.ZpdExtension.split_iff_decompositionGroup_trivial`. -/
example (E : ZpdExtension p P) (v : P) : E.decomp v = ⊥ ↔ Finite (E.decomp v) := sorry

/-- Test `TauCeti.EulerSystem.ZpdExtension.trivial_excluded`: `d ≥ 1`. -/
example (E : ZpdExtension p P) : E.d ≠ 0 := Nat.one_le_iff_ne_zero.mp E.one_le_d

end ZpdExtension

end Tower

/-! ## `ES.8/iwasawa-large-image-hypotheses` and `ES.8/leopoldt-tower-hypothesis` -/

section Hypotheses

variable (O : Type*) [CommRing O] [IsLocalRing O] (G : Type*) [Group G]
  (T : Type*) [AddCommGroup T] [Module O T] (ρ : Representation O G T)

/-- **`ES.8/iwasawa-large-image-hypotheses`**: the part of Rubin's `Hyp(K∞, T)` statable over the
pinned Mathlib, for `G = G_{K∞}` acting on `T` through `ρ`: an element `τ` with `T/(τ - 1)T`
free of rank one over `O`, and irreducibility of `T/𝔪T` (every `G`-stable `O`-submodule between
`𝔪T` and `T` is one of them). The conditions that `τ` fixes `μ_{p^∞}`, `(𝒪_K^×)^{1/p^∞}` and
`K(1)` need the arithmetic carrier and are omitted, not replaced by a placeholder. -/
structure IwasawaHypT where
  τ : G
  free : Module.Free O (T ⧸ LinearMap.range (ρ τ - LinearMap.id))
  rank_one : Module.finrank O (T ⧸ LinearMap.range (ρ τ - LinearMap.id)) = 1
  irreducible : ∀ W : Submodule O T, (∀ g, ∀ x ∈ W, ρ g x ∈ W) →
    (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O T) ≤ W →
      W = (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O T) ∨ W = ⊤

variable (Φ : Type*) [Field Φ] (V : Type*) [AddCommGroup V] [Module Φ V]
  (σ : Representation Φ G V)

/-- **`ES.8/iwasawa-large-image-hypotheses`**: the statable part of `Hyp(K∞, V)`:
`dim_Φ V/(τ - 1)V = 1` and `V` irreducible under `G`. -/
structure IwasawaHypV where
  τ : G
  finrank_coinvariants : Module.finrank Φ (V ⧸ LinearMap.range (σ τ - LinearMap.id)) = 1
  irreducible : ∀ W : Submodule Φ V, (∀ g, ∀ x ∈ W, σ g x ∈ W) → W = ⊥ ∨ W = ⊤

variable {O G T ρ}

/-- `Hyp(K∞, T)` holds with `τ = 1` when `T` has rank one. -/
def IwasawaHypT.of_rank_one [Module.Free O T] (h : Module.finrank O T = 1)
    [IsSimpleModule O (T ⧸ (IsLocalRing.maximalIdeal O) • (⊤ : Submodule O T))] :
    IwasawaHypT O G T ρ := sorry

/- Suggested signatures awaiting the base change `V = T ⊗ Φ` of representations and the
arithmetic conditions on `τ`:
* `TauCeti.EulerSystem.IwasawaHypT.toHypV : IwasawaHypT O G T ρ → IwasawaHypV Φ G (Φ ⊗[O] T) ρ_Φ`
* `TauCeti.EulerSystem.IwasawaHypT.toBase : Hyp(K∞, T) → Hyp(K, T)` (ES.4's record)
* `TauCeti.EulerSystem.IwasawaHypV.dual : dim V*/(τ - 1)V* = 1`
* `TauCeti.EulerSystem.IwasawaHypT.twist_iff : Hyp(K∞, T ⊗ ρ) ↔ Hyp(K∞, T)` for `ρ` a character
  of `Γ` (restriction to `G_{K∞}` is unchanged)
* `TauCeti.EulerSystem.IwasawaHypT.aTau_eq_one : a_τ = 1` (see `ES.8/iwasawa-evaluation-maps`)
* tests `rank_one_example`, `elliptic_surjective`, `cm_fails`, `irreducible_K_not_Kinf`
  (`TauCeti.EulerSystem.IwasawaHypT.*`, `TauCeti.EulerSystem.IwasawaHypV.*`). -/

/-- Test `TauCeti.EulerSystem.IwasawaHypV.cm_fails` (linear-algebra core): a unipotent-free
element of `SL₂` with trace `0` has no eigenvalue `1` (outside characteristic `2`), so
`dim V/(τ - 1)V = 0` for it. -/
example {F : Type*} [Field F] (h2 : (2 : F) ≠ 0) (a b : F) (h : -(a * b) = 1) :
    LinearMap.range (Matrix.toLin' !![0, a; b, 0] - LinearMap.id) = ⊤ := sorry

/-- **`ES.8/leopoldt-tower-hypothesis`**: Rubin's `Hyp(K∞/K)`, as a predicate on its arithmetic
inputs: `rankΓ = rank_{ℤ_p} Γ`, whether `G_{K∞}` acts on `V` trivially or by the cyclotomic
character, whether `K` is totally real with Leopoldt's conjecture, and whether `K` is imaginary
quadratic. -/
def LeopoldtTowerHyp (rankΓ : ℕ) (scalarAction totallyRealLeopoldt imagQuadratic : Prop) : Prop :=
  rankΓ = 1 → scalarAction → totallyRealLeopoldt ∨ imagQuadratic

theorem LeopoldtTowerHyp.of_two_le_rank {r : ℕ} (hr : 2 ≤ r) (s t i : Prop) :
    LeopoldtTowerHyp r s t i := fun h => absurd h (by omega)

theorem LeopoldtTowerHyp.of_action_not_scalar (r : ℕ) {s : Prop} (hs : ¬ s) (t i : Prop) :
    LeopoldtTowerHyp r s t i := fun _ h => absurd h hs

theorem LeopoldtTowerHyp.rat (r : ℕ) (s : Prop) (i : Prop) : LeopoldtTowerHyp r s True i :=
  fun _ _ => Or.inl trivial

theorem LeopoldtTowerHyp.imaginaryQuadratic (r : ℕ) (s t : Prop) : LeopoldtTowerHyp r s t True :=
  fun _ _ => Or.inr trivial

/- Suggested signatures awaiting the arithmetic carrier:
* `TauCeti.EulerSystem.LeopoldtTowerHyp.twist_iff` (invariance under characters of `Γ`)
* `TauCeti.EulerSystem.LeopoldtTowerHyp.of_totallyReal_abelian` (Brumer–Ax)
* tests `rat_cyclotomic_Zp1`, `pure_cubic_fails`, `Zp2_vacuous`, `elliptic`. -/

/-- Test `TauCeti.EulerSystem.LeopoldtTowerHyp.Zp2_vacuous`. -/
example (s t i : Prop) : LeopoldtTowerHyp 2 s t i := LeopoldtTowerHyp.of_two_le_rank le_rfl s t i

/-- Test `TauCeti.EulerSystem.LeopoldtTowerHyp.pure_cubic_fails`: rank one, cyclotomic action,
`K = ℚ(∛2)` neither totally real nor imaginary quadratic. -/
example : ¬ LeopoldtTowerHyp 1 True False False := fun h => by simpa using h rfl trivial

end Hypotheses

/-! ## `ES.8/lambda-index`: Rubin's `ind_Λ` -/

section LambdaIndex

variable {Λ : Type*} [CommRing Λ] {H H' : Type*} [AddCommGroup H] [Module Λ H]
  [AddCommGroup H'] [Module Λ H']

/-- **`ES.8/lambda-index`** (Rubin, Definition II.3.1): `ind_Λ(x) = {φ(x) : φ ∈ Hom_Λ(H, Λ)}`,
an ideal that need not be principal. For an Euler system `c`, `ind_Λ(c) = ind_Λ(c_{K,∞})` with
`H = H¹_∞(K, T)`. -/
def lambdaIndex (Λ : Type*) [CommRing Λ] {H : Type*} [AddCommGroup H] [Module Λ H] (x : H) :
    Ideal Λ :=
  Ideal.span (Set.range fun φ : Module.Dual Λ H => φ x)

theorem apply_mem_lambdaIndex (φ : Module.Dual Λ H) (x : H) : φ x ∈ lambdaIndex Λ x :=
  Ideal.subset_span ⟨φ, rfl⟩

@[simp] theorem lambdaIndex_smul (a : Λ) (x : H) :
    lambdaIndex Λ (a • x) = Ideal.span {a} * lambdaIndex Λ x := sorry

theorem lambdaIndex_eq_bot_iff [IsDomain Λ] [IsNoetherianRing Λ] [Module.Finite Λ H] (x : H) :
    lambdaIndex Λ x = ⊥ ↔ x ∈ Submodule.torsion Λ H := sorry

theorem lambdaIndex_of_rank_one [IsDomain Λ] (e : (H ⧸ Submodule.torsion Λ H) ≃ₗ[Λ] Λ) (x : H) :
    lambdaIndex Λ x = Ideal.span {e (Submodule.Quotient.mk x)} := sorry

/-- For a free module of coordinates, `ind_Λ(a) = (a₁, …, a_r)`; a principal ideal `(f)` contains it
iff `f` divides every coordinate, i.e. iff `(f)` contains Mazur–Rubin's `Ind`. -/
theorem lambdaIndex_le_span_iff {r : ℕ} (a : Fin r → Λ) (f : Λ) :
    lambdaIndex Λ a ≤ Ideal.span {f} ↔ ∀ i, f ∣ a i := sorry

theorem lambdaIndex_twist (τ : Λ ≃+* Λ) (e : H →ₛₗ[(τ : Λ →+* Λ)] H')
    (he : Function.Bijective e) (x : H) :
    lambdaIndex Λ (e x) = Ideal.map (τ : Λ →+* Λ) (lambdaIndex Λ x) := sorry

theorem lambdaIndex_map_le (f : H →ₗ[Λ] H') (x : H) : lambdaIndex Λ (f x) ≤ lambdaIndex Λ x :=
  Ideal.span_le.mpr (by rintro _ ⟨φ, rfl⟩; exact Ideal.subset_span ⟨φ ∘ₗ f, rfl⟩)

/-- Test `TauCeti.EulerSystem.lambdaIndex_free_rank_one`. -/
example (f : Λ) : lambdaIndex Λ (H := Λ) f = Ideal.span {f} := sorry

/-- Test `TauCeti.EulerSystem.lambdaIndex_not_principal`: in `ℤ_p⟦X⟧`, `X = γ - 1`, the vector
`(p, X)` has `ind_Λ = (p, X)`, which is not principal. -/
example (p : ℕ) [Fact p.Prime] :
    lambdaIndex (PowerSeries ℤ_[p])
        (![(p : PowerSeries ℤ_[p]), PowerSeries.X] : Fin 2 → PowerSeries ℤ_[p]) =
      Ideal.span {(p : PowerSeries ℤ_[p]), PowerSeries.X} ∧
    ¬ (lambdaIndex (PowerSeries ℤ_[p]) (![(p : PowerSeries ℤ_[p]), PowerSeries.X] :
      Fin 2 → PowerSeries ℤ_[p])).IsPrincipal := sorry

/-- Test `TauCeti.EulerSystem.lambdaIndex_torsion`. -/
example [IsDomain Λ] (x : H) (hx : x ∈ Submodule.torsion Λ H) : lambdaIndex Λ x = ⊥ := sorry

/-- Test `TauCeti.EulerSystem.lambdaIndex_dvd_iff_Ind`. -/
example {r : ℕ} (a : Fin r → Λ) (f : Λ) :
    lambdaIndex Λ a ≤ Ideal.span {f} ↔ Ideal.span (Set.range a) ≤ Ideal.span {f} := sorry

end LambdaIndex

end EulerSystem

/-! ## `ES.8/lambda-adic-ind`: Mazur–Rubin's principal index -/

namespace KolyvaginSystem

section Ind

variable {Λ : Type*} [CommRing Λ] {H : Type*} [AddCommGroup H] [Module Λ H] {r : ℕ}

/-- **`ES.8/lambda-adic-ind`** (Mazur–Rubin, Definition 5.3.8, with `Ind(0) = 0`): for a
pseudo-isomorphism `ψ : H → Λ^r`, `Ind(c)` is the smallest principal ideal containing the
coordinates of `ψ c`, that is the ideal generated by their gcd over a factorial `Λ`. -/
def ind (ψ : H →ₗ[Λ] (Fin r → Λ)) (c : H) : Ideal Λ :=
  ⨅ (f : Λ) (_ : Ideal.span (Set.range (ψ c)) ≤ Ideal.span {f}), Ideal.span {f}

@[simp] theorem ind_zero (ψ : H →ₗ[Λ] (Fin r → Λ)) : ind ψ 0 = ⊥ := sorry

theorem ind_eq_char [IsDomain Λ] (ψ : H →ₗ[Λ] (Fin r → Λ)) (hψ : EulerSystem.IsPseudoIso Λ ψ)
    (c : H) (hc : c ∉ Submodule.torsion Λ H) :
    ind ψ c = EulerSystem.charIdeal Λ (Submodule.torsion Λ (H ⧸ Λ ∙ c)) := sorry

@[simp] theorem ind_smul [IsDomain Λ] [UniqueFactorizationMonoid Λ]
    (ψ : H →ₗ[Λ] (Fin r → Λ)) (a : Λ) (c : H) :
    ind ψ (a • c) = Ideal.span {a} * ind ψ c := sorry

theorem exists_finiteIndex_mul_mem [IsDomain Λ] (ψ : H →ₗ[Λ] (Fin r → Λ))
    (hψ : EulerSystem.IsPseudoIso Λ ψ) (c : H) :
    ∃ B : Ideal Λ, Finite (Λ ⧸ B) ∧ ∀ b ∈ B, b • c ∈ (ind ψ c) • (⊤ : Submodule Λ H) := sorry

theorem lambdaIndex_le_ind [IsDomain Λ] (ψ : H →ₗ[Λ] (Fin r → Λ))
    (hψ : EulerSystem.IsPseudoIso Λ ψ) (c : H) :
    EulerSystem.lambdaIndex Λ c ≤ ind ψ c ∧
      ∀ f : Λ, (EulerSystem.lambdaIndex Λ c ≤ Ideal.span {f} ↔ ind ψ c ≤ Ideal.span {f}) := sorry

/-- `Ind(κ) = Ind(κ₁)` for a Λ-adic Kolyvagin system, through its bottom class. -/
def indKS {M : Type*} [AddCommGroup M] [Module Λ M] (bottomClass : M →ₗ[Λ] H)
    (ψ : H →ₗ[Λ] (Fin r → Λ)) (κ : M) : Ideal Λ :=
  ind ψ (bottomClass κ)

/-- Test `TauCeti.KolyvaginSystem.ind_free_rank_one`. -/
example (f : Λ) : ind (LinearMap.id : (Fin 1 → Λ) →ₗ[Λ] (Fin 1 → Λ)) (fun _ => f) =
    Ideal.span {f} := sorry

/-- Test `TauCeti.KolyvaginSystem.ind_rank_two`: `Ind((p, X)) = Λ` in `ℤ_p⟦X⟧`. -/
example (p : ℕ) [Fact p.Prime] :
    ind (LinearMap.id : (Fin 2 → PowerSeries ℤ_[p]) →ₗ[PowerSeries ℤ_[p]] _)
      ![(p : PowerSeries ℤ_[p]), PowerSeries.X] = ⊤ := sorry

/-- Test `TauCeti.KolyvaginSystem.ind_zero_convention`: `Ind(0) = 0`, whereas the printed formula
`char((H/Λ·0)_tors)` would give `Λ` for torsion-free `H` (source issue E801). -/
example (ψ : H →ₗ[Λ] (Fin r → Λ)) : ind ψ 0 = ⊥ := ind_zero ψ

/-- Test `TauCeti.KolyvaginSystem.ind_pseudoIso_invariant`. -/
example [IsDomain Λ] (ψ ψ' : H →ₗ[Λ] (Fin r → Λ)) (hψ : EulerSystem.IsPseudoIso Λ ψ)
    (hψ' : EulerSystem.IsPseudoIso Λ ψ') (c : H) : ind ψ c = ind ψ' c := sorry

end Ind

/-! ## `ES.8/blind-spot-and-lambda-primitivity` and its lemma -/

section BlindSpot

variable {Λ : Type*} [CommRing Λ] {M : Type*} [AddCommGroup M] [Module Λ M]
  (N : Ideal Λ → Type*) [∀ I, AddCommGroup (N I)] [∀ I, Module Λ (N I)]
  (red : ∀ I, M →ₗ[Λ] N I)

/-- **`ES.8/blind-spot-and-lambda-primitivity`**: the blind spot of `κ` for the reduction maps
`red I : KS‾(𝐓) → KS‾(𝐓/I𝐓)` (Mazur–Rubin, Definition 3.1.6). The modules `N I` are ES.4's
generalized Kolyvagin-system modules; here they are parameters. -/
def blindSpot (κ : M) : Set (Ideal Λ) := {I | red I κ = 0}

/-- **Λ-primitivity** (Mazur–Rubin, Definition 5.3.9): no height-one prime is in the blind spot. -/
def IsLambdaPrimitive (κ : M) : Prop :=
  ∀ 𝔓 : Ideal Λ, 𝔓.IsPrime → 𝔓.height = 1 → 𝔓 ∉ blindSpot N red κ

/-- `I` is outside the blind spot iff some `𝔪^k`-level component survives at every depth `j`,
when `KS‾(𝐓/I𝐓) = lim_k colim_j KS(𝐓/(I, 𝔪^k), P ∩ P_j)` is presented by maps `redk`. -/
theorem mem_blindSpot_iff (Nk : Ideal Λ → ℕ → ℕ → Type*) [∀ I k j, AddCommGroup (Nk I k j)]
    [∀ I k j, Module Λ (Nk I k j)] (redk : ∀ I k j, M →ₗ[Λ] Nk I k j)
    (hlim : ∀ I κ, red I κ = 0 ↔ ∀ k, ∃ j, redk I k j κ = 0) (I : Ideal Λ) (κ : M) :
    I ∉ blindSpot N red κ ↔ ∃ k, ∀ j, redk I k j κ ≠ 0 := sorry

theorem blindSpot_zero : blindSpot N red 0 = Set.univ := by
  ext I; simp [blindSpot]

theorem blindSpot_smul (a : Λ) (κ : M) :
    blindSpot N red κ ⊆ blindSpot N red (a • κ) ∧
      ((∀ I, ∀ b ∈ I, ∀ y : N I, b • y = 0) → ∀ I, a ∈ I → I ∈ blindSpot N red (a • κ)) := sorry

theorem not_isLambdaPrimitive_smul [IsDomain Λ] [IsNoetherianRing Λ]
    [UniqueFactorizationMonoid Λ] (hΛ : ¬ IsField Λ) (hann : ∀ I, ∀ b ∈ I, ∀ y : N I, b • y = 0)
    (a : Λ) (ha : ¬ IsUnit a) (κ : M) : ¬ IsLambdaPrimitive N red (a • κ) := sorry

/-- **`ES.8/residual-primitivity-implies-lambda-primitivity`**: if reduction to `𝔪` factors
through every height-one `𝔓` and `κ` survives modulo `𝔪`, then `κ` is Λ-primitive. -/
theorem IsLambdaPrimitive.of_isPrimitive [IsLocalRing Λ]
    (hfac : ∀ 𝔓 : Ideal Λ, 𝔓.IsPrime →
      ∃ π : N 𝔓 →ₗ[Λ] N (IsLocalRing.maximalIdeal Λ),
        red (IsLocalRing.maximalIdeal Λ) = π ∘ₗ red 𝔓)
    (κ : M) (h : red (IsLocalRing.maximalIdeal Λ) κ ≠ 0) : IsLambdaPrimitive N red κ := by
  intro 𝔓 h𝔓 _ hmem
  obtain ⟨π, hπ⟩ := hfac 𝔓 h𝔓
  have hmem' : red 𝔓 κ = 0 := hmem
  exact h (by rw [hπ, LinearMap.comp_apply, hmem', map_zero])

/- Suggested signature awaiting the specialization of ES.4's Kolyvagin systems to `S_𝔓`:
* `TauCeti.KolyvaginSystem.specialize_ne_zero_of_not_mem_blindSpot :
    𝔓 ∉ blindSpot κ → specialize 𝔓 κ ≠ 0` (Mazur–Rubin, Lemma 5.3.20)
* test `TauCeti.KolyvaginSystem.cyclotomic_isLambdaPrimitive` (Büyükboduk, Proposition 4.1). -/

/-- Test `TauCeti.KolyvaginSystem.augmentation_mul_not_primitive`: multiplying by a generator of a
height-one prime (for instance `γ - 1`) destroys Λ-primitivity. -/
example (hann : ∀ I, ∀ b ∈ I, ∀ y : N I, b • y = 0) (g : Λ) (hg : (Ideal.span {g}).IsPrime)
    (hh : (Ideal.span {g}).height = 1) (κ : M) : ¬ IsLambdaPrimitive N red (g • κ) :=
  fun hκ => hκ _ hg hh ((blindSpot_smul N red g κ).2 hann _ (Ideal.mem_span_singleton_self g))

/-- Test `TauCeti.KolyvaginSystem.free_rank_one_primitive_iff`. -/
example [IsLocalRing Λ] [IsDomain Λ] [IsNoetherianRing Λ] [UniqueFactorizationMonoid Λ]
    (hΛ : ¬ IsField Λ) (hann : ∀ I, ∀ b ∈ I, ∀ y : N I, b • y = 0)
    (hfac : ∀ 𝔓 : Ideal Λ, 𝔓.IsPrime →
      ∃ π : N 𝔓 →ₗ[Λ] N (IsLocalRing.maximalIdeal Λ),
        red (IsLocalRing.maximalIdeal Λ) = π ∘ₗ red 𝔓)
    (κ₀ : M) (hfree : ∀ κ : M, ∃! a : Λ, κ = a • κ₀)
    (hprim : red (IsLocalRing.maximalIdeal Λ) κ₀ ≠ 0) (a : Λ) :
    IsLambdaPrimitive N red (a • κ₀) ↔ IsUnit a := sorry

/-- Test `TauCeti.KolyvaginSystem.zero_not_primitive`. -/
example (h : ∃ 𝔓 : Ideal Λ, 𝔓.IsPrime ∧ 𝔓.height = 1) : ¬ IsLambdaPrimitive N red (0 : M) := by
  obtain ⟨𝔓, h𝔓, hh⟩ := h
  exact fun hκ => hκ 𝔓 h𝔓 hh (by simp [blindSpot])

end BlindSpot

/-! ## `ES.8/exceptional-height-one-primes` -/

section Exceptional

variable (p : ℕ) (Λ : Type*) [CommRing Λ] (H2g H2l : Type*) [AddCommGroup H2g] [Module Λ H2g]
  [AddCommGroup H2l] [Module Λ H2l]

/-- **`ES.8/exceptional-height-one-primes`** (Mazur–Rubin, Definition 5.3.12): the height-one
primes `𝔓` with `H²(ℚ_Σ/ℚ, 𝐓)[𝔓]` or `H²(ℚ_p, 𝐓)[𝔓]` infinite, together with `pΛ`. The two
`H²` modules are parameters, supplied by `SelmerIwasawaCohomology` L3. Mazur–Rubin take
`Λ = ℤ_p⟦Γ⟧`; over `O⟦Γ⟧` with `O` ramified the prime `ϖΛ` replaces `pΛ`. -/
def exceptionalSet : Set (Ideal Λ) :=
  {𝔓 | 𝔓.IsPrime ∧ 𝔓.height = 1 ∧ (Infinite (Submodule.torsionBySet Λ H2g (𝔓 : Set Λ)) ∨
      Infinite (Submodule.torsionBySet Λ H2l (𝔓 : Set Λ)))} ∪ {Ideal.span {(p : Λ)}}

theorem exceptionalSet_finite [IsDomain Λ] [IsNoetherianRing Λ] [IsLocalRing Λ]
    [Finite (IsLocalRing.ResidueField Λ)] (hdim : ringKrullDim Λ = 2)
    [Module.Finite Λ H2g] [Module.Finite Λ H2l] : (exceptionalSet p Λ H2g H2l).Finite := sorry

@[simp] theorem p_mem_exceptionalSet : Ideal.span {(p : Λ)} ∈ exceptionalSet p Λ H2g H2l :=
  Or.inr rfl

theorem mem_exceptionalSet_iff [IsDomain Λ] (𝔓 : Ideal Λ) (h𝔓 : 𝔓 ≠ Ideal.span {(p : Λ)}) :
    𝔓 ∈ exceptionalSet p Λ H2g H2l ↔ 𝔓.IsPrime ∧ 𝔓.height = 1 ∧
      EulerSystem.charIdeal Λ (Submodule.torsion Λ H2g) *
        EulerSystem.charIdeal Λ (Submodule.torsion Λ H2l) ≤ 𝔓 :=
  sorry

theorem exceptionalSet_twist (τ : Λ ≃+* Λ) (hτ : τ (p : Λ) = p) (H2g' H2l' : Type*)
    [AddCommGroup H2g'] [Module Λ H2g'] [AddCommGroup H2l'] [Module Λ H2l']
    (eg : H2g →ₛₗ[(τ : Λ →+* Λ)] H2g') (hg : Function.Bijective eg)
    (el : H2l →ₛₗ[(τ : Λ →+* Λ)] H2l') (hl : Function.Bijective el) (𝔓 : Ideal Λ) :
    𝔓 ∈ exceptionalSet p Λ H2g' H2l' ↔ Ideal.comap (τ : Λ →+* Λ) 𝔓 ∈ exceptionalSet p Λ H2g H2l :=
  sorry

/- Tests awaiting the arithmetic carrier: `TauCeti.KolyvaginSystem.exceptionalSet_Zp1`
(`J ∈ Σ_Λ` for `T = ℤ_p(1)`), `TauCeti.KolyvaginSystem.exceptionalSet_not_blindSpot`. -/

/-- Test `TauCeti.KolyvaginSystem.p_mem_exceptionalSet_test`. -/
example : Ideal.span {(p : Λ)} ∈ exceptionalSet p Λ H2g H2l := p_mem_exceptionalSet p Λ H2g H2l

/-- Test `TauCeti.KolyvaginSystem.exceptionalSet_free_H2`: finite `H²` give `Σ_Λ = {pΛ}`. -/
example [Finite H2g] [Finite H2l] : exceptionalSet p Λ H2g H2l = {Ideal.span {(p : Λ)}} := sorry

end Exceptional

/-! ## `ES.8/height-one-specialization` -/

section Specialization

variable {Λ : Type*} [CommRing Λ] (𝔓 : Ideal Λ) [𝔓.IsPrime]

/-- **`ES.8/height-one-specialization`**: `S_𝔓`, the integral closure of `Λ/𝔓` in its fraction
field. -/
abbrev specRing : Type _ := integralClosure (Λ ⧸ 𝔓) (FractionRing (Λ ⧸ 𝔓))

instance specRing.algebraBase : Algebra Λ (specRing 𝔓) :=
  ((algebraMap (Λ ⧸ 𝔓) (specRing 𝔓)).comp (Ideal.Quotient.mk 𝔓)).toAlgebra

/-- `T ⊗ S_𝔓 = 𝐓 ⊗_Λ S_𝔓`. -/
abbrev specRep (T : Type*) [AddCommGroup T] [Module Λ T] : Type _ := specRing 𝔓 ⊗[Λ] T

theorem specRing_isDiscreteValuationRing [IsNoetherianRing Λ] [IsLocalRing Λ]
    [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ] (hdim : ringKrullDim Λ = 2)
    (h : 𝔓.height = 1) : IsDiscreteValuationRing (specRing 𝔓) := sorry

theorem specRing_finite [IsNoetherianRing Λ] [IsLocalRing Λ]
    [IsAdicComplete (IsLocalRing.maximalIdeal Λ) Λ] (h : 𝔓.height = 1) :
    Module.Finite (Λ ⧸ 𝔓) (specRing 𝔓) := sorry

/-- The perturbations `𝔓_N = (g + p^N)` of `𝔓 = (g)` (Mazur–Rubin, proof of Theorem 5.3.10). -/
def perturb (p : ℕ) (g : Λ) (N : ℕ) : Ideal Λ := Ideal.span {g + (p : Λ) ^ N}

/-- For `g` distinguished and `N` large, `𝔓_N` is a height-one prime with `Λ/𝔓 ≅ Λ/𝔓_N`
(Hensel's lemma). -/
theorem perturb_quotient_equiv {O : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (p : ℕ)
    (hp : (p : O) ∈ IsLocalRing.maximalIdeal O)
    (g : Polynomial O) (hg : g.IsDistinguishedAt (IsLocalRing.maximalIdeal O))
    (hirr : Irreducible g) :
    ∀ᶠ N in Filter.atTop, (perturb p (g : PowerSeries O) N).IsPrime ∧
      Nonempty ((PowerSeries O ⧸ Ideal.span {(g : PowerSeries O)}) ≃+*
        (PowerSeries O ⧸ perturb p (g : PowerSeries O) N)) := sorry

/- Suggested signatures awaiting ES.4's Kolyvagin-system modules:
* `TauCeti.KolyvaginSystem.specialize : KS‾(𝐓, F_Λ) →ₗ[Λ] KS‾(specRep 𝔓 𝐓, F_can)`
* `TauCeti.KolyvaginSystem.specialize_bottomClass`, `specialize_augmentation`,
  `specialize_twist` (see the packet). -/

variable (p : ℕ) [Fact p.Prime]

/-- Test `TauCeti.KolyvaginSystem.specRing_augmentation`: `Λ/(γ - 1) = ℤ_p`. -/
example : Nonempty ((PowerSeries ℤ_[p] ⧸ Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p])}) ≃+*
    ℤ_[p]) := sorry

/-- Test `TauCeti.KolyvaginSystem.specRing_twist`: `Λ/(γ - (1 + p)) = ℤ_p`, the twist by
`γ ↦ 1 + p`. -/
example : Nonempty ((PowerSeries ℤ_[p] ⧸
    Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) - (p : PowerSeries ℤ_[p])}) ≃+* ℤ_[p]) :=
  sorry

/-- Test `TauCeti.KolyvaginSystem.specRing_not_quotient`: `𝔓 = (X² - p³)` is prime and `Λ/𝔓` is
not integrally closed. -/
example :
    (Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) ^ 2 - (p : PowerSeries ℤ_[p]) ^ 3}).IsPrime ∧
    ¬ IsIntegrallyClosed (PowerSeries ℤ_[p] ⧸
      Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) ^ 2 - (p : PowerSeries ℤ_[p]) ^ 3}) :=
  sorry

/-- Test `TauCeti.KolyvaginSystem.perturb_height_one`. -/
example (N : ℕ) (hN : 2 ≤ N) :
    (perturb p ((PowerSeries.X : PowerSeries ℤ_[p]) - (p : PowerSeries ℤ_[p])) N).IsPrime ∧
      perturb p ((PowerSeries.X : PowerSeries ℤ_[p]) - (p : PowerSeries ℤ_[p])) N ≠
        Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) - (p : PowerSeries ℤ_[p])} := sorry

end Specialization

/-! ## `ES.8/lambda-adic-selmer-structure` -/

section LambdaSelmer

variable (Λ : Type*) [CommRing Λ] (P : Type*)

/-- **`ES.8/lambda-adic-selmer-structure`**: the Λ-adic representation `𝐓 = T ⊗_O Λ`. The Galois
action (on both factors, through the tautological character on `Λ`) is part of the
`SelmerIwasawaCohomology` L3 carrier; here only the module is recorded. -/
abbrev lambdaRep (O : Type*) [CommRing O] (T : Type*) [AddCommGroup T] [Module O T]
    [Algebra O Λ] : Type _ :=
  Λ ⊗[O] T

/-- A Selmer structure over `R = Λ`: places `Σ`, global and local cohomology modules with
restriction maps, and local conditions (Mazur–Rubin, Definition 2.1.1, with `R = Λ`). The
cohomology modules are parameters supplied by `SelmerIwasawaCohomology` L2–L3. -/
structure LambdaSelmerStructure (Hglob : Type*) [AddCommGroup Hglob] [Module Λ Hglob]
    (Hloc : P → Type*) [∀ v, AddCommGroup (Hloc v)] [∀ v, Module Λ (Hloc v)] where
  places : Set P
  res : ∀ v, Hglob →ₗ[Λ] Hloc v
  cond : ∀ v, Submodule Λ (Hloc v)

namespace LambdaSelmerStructure

variable {Λ P} {Hglob : Type*} [AddCommGroup Hglob] [Module Λ Hglob]
  {Hloc : P → Type*} [∀ v, AddCommGroup (Hloc v)] [∀ v, Module Λ (Hloc v)]

/-- The Selmer module `H¹_{F_Λ}(K, 𝐓)`. -/
def selmer (F : LambdaSelmerStructure Λ P Hglob Hloc) : Submodule Λ Hglob :=
  ⨅ v ∈ F.places, (F.cond v).comap (F.res v)

/-- Mazur–Rubin's canonical structure (Definition 5.3.2): the full local cohomology. -/
def canonical (places : Set P) (res : ∀ v, Hglob →ₗ[Λ] Hloc v) :
    LambdaSelmerStructure Λ P Hglob Hloc :=
  ⟨places, res, fun _ => ⊤⟩

/-- Howard's ordinary structure (Definition 2.2.6): the image of the cohomology of `Fil_v 𝐓`
(at the places above `p`; the unramified condition elsewhere is part of `fil`). -/
def ordinary (places : Set P) (res : ∀ v, Hglob →ₗ[Λ] Hloc v)
    (Hfil : P → Type*) [∀ v, AddCommGroup (Hfil v)] [∀ v, Module Λ (Hfil v)]
    (fil : ∀ v, Hfil v →ₗ[Λ] Hloc v) : LambdaSelmerStructure Λ P Hglob Hloc :=
  ⟨places, res, fun v => LinearMap.range (fil v)⟩

@[simp] theorem canonical_selmer_eq (places : Set P) (res : ∀ v, Hglob →ₗ[Λ] Hloc v) :
    (canonical places res).selmer = ⊤ := by
  simp [selmer, canonical]

/-- The structure induced on a quotient `𝐓/I𝐓` by propagation along maps of cohomology. -/
def quotient (F : LambdaSelmerStructure Λ P Hglob Hloc) {Hglob' : Type*} [AddCommGroup Hglob']
    [Module Λ Hglob'] {Hloc' : P → Type*} [∀ v, AddCommGroup (Hloc' v)] [∀ v, Module Λ (Hloc' v)]
    (res' : ∀ v, Hglob' →ₗ[Λ] Hloc' v) (q : ∀ v, Hloc v →ₗ[Λ] Hloc' v) :
    LambdaSelmerStructure Λ P Hglob' Hloc' :=
  ⟨F.places, res', fun v => (F.cond v).map (q v)⟩

end LambdaSelmerStructure

/- Suggested signatures awaiting the Galois-cohomology carriers of `SelmerIwasawaCohomology`:
* `TauCeti.KolyvaginSystem.lambdaRep_cohomologyEquiv :
    H^i(K, lambdaRep Λ O T) ≃ₛₗ[ι] lim_n H^i(K_n, T)` (Shapiro; semilinear for the involution `ι`
    of `Λ` when `G_K` acts on `Λ` through `Ψ`, with `Γ` acting on the limit by conjugation)
* `TauCeti.KolyvaginSystem.LambdaSelmerStructure.dualX :
    X = Hom(H¹_{F_Λ*}(K, 𝐓*), ℚ_p/ℤ_p)`
* `TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical_X_eq : X ≃ₛₗ[ι] Rubin's X∞` (`K = ℚ`;
    so `charIdeal X = ι (charIdeal X∞)`)
* tests `TauCeti.KolyvaginSystem.canonical_rat_selmer`, `canonical_unramified_away_from_p`,
  `quotient_not_full`, `ordinary_selfOrthogonal`. -/

end LambdaSelmer

/-! ## Λ-adic Kolyvagin systems and the theorems of Mazur–Rubin §5.3, Howard §2.2 and
Castella–Grossi–Lee–Skinner §3.4

The module of Kolyvagin systems is ES.4's global sections of the Selmer sheaf; until that carrier
exists, the suggested signatures are recorded here under the packet's names.

* **`ES.8/lambda-adic-kolyvagin-systems`**: `TauCeti.KolyvaginSystem.lambdaKS`,
  `lambdaKSBar`, `lambdaKS_toBar`, `bottomClass`, `lambdaKS_baseChange`,
  `lambdaKS_restrictPrimes`, `lambdaKS_ext`, `bottomClass_zero`; tests `zero_mem`,
  `relation_required`, `cyclotomic_free_rank_one`, `bottomClass_specialize`.
* `euler_to_lambdaKS` — **`ES.8/euler-to-lambda-adic-kolyvagin`** (Mazur–Rubin, Theorem 5.3.3):
  `theorem euler_to_lambdaKS : (∀ ℓ ∈ P, IsCyclic (T/(Fr_ℓ - 1)T)) →
    (∀ ℓ ∈ P, ∀ k, Injective (Fr_ℓ^{p^k} - 1)) → ∃ ψ : ES(T, 𝒦, P) →ₗ KS‾(𝐓, F_Λ, P),
    ∀ c, bottomClass (ψ c) = (c_{ℚ_n})_n`.
* `specializationControl` — **`ES.8/specialization-control`** (Mazur–Rubin, Lemma 5.3.13,
  Proposition 5.3.14; Howard,
  Lemma 2.2.7, Proposition 2.2.8): injectivity of `π_𝔓` and the bounds on `coker π_𝔓`,
  `ker π*_𝔓`, `coker π*_𝔓` for `𝔓 ∉ exceptionalSet`, uniform in `[S_𝔓 : Λ/𝔓]`.
* `genericCoreRank` — **`ES.8/generic-core-rank`** (Lemma 5.3.16): `χ(T ⊗ S_𝔓, F_can) = rank T⁻` for
  `𝔓 ∉ exceptionalSet`.
* `weakLeopoldt_of_lambdaKS` — **`ES.8/weak-leopoldt-from-lambda-adic-kolyvagin`** (Theorem
  5.3.6, Corollary 5.3.19):
  `bottomClass κ ≠ 0 → Module.IsTorsion Λ X∞`.
* `charIdeal_dvd_ind` — **`ES.8/mazur-rubin-lambda-adic-main-theorem`** (Theorem 5.3.10):
  `(i) ind ψ (bottomClass κ) ≤ charIdeal Λ X∞`;
  `(ii) χ = 1 → bottomClass κ ≠ 0 → 𝔓 ∉ blindSpot κ → ord_𝔓 (charIdeal Λ X∞) = ord_𝔓 (Ind κ)`;
  `(iii) χ = 1 → bottomClass κ ≠ 0 → IsLambdaPrimitive κ → charIdeal Λ X∞ = Ind κ`.
* `howard_selfDual_bound` — **`ES.8/self-dual-lambda-adic-kolyvagin-bound`** (Howard, Theorem
  2.2.10): rank one,
  `X ∼ Λ ⊕ M ⊕ M` with `char M = ι (char M)`, and `char M ∣ char(H¹_{F_Λ}(K, 𝐓)/Λκ₁)`.
* `cgls_errorTolerant_bound` — **`ES.8/error-tolerant-self-dual-lambda-adic-bound`**
  (Castella–Grossi–Lee–Skinner, Theorem 3.4.1, Corollary 3.4.2): the same divisibility in
  `Λ[1/p, 1/(γ - 1)]`, resp. `Λ[1/p]`. -/

end KolyvaginSystem

/-! ## Rubin's Iwasawa theory of Euler systems (Chapters II §3, VI, VII) -/

namespace EulerSystem

section RubinLemma

/-- Rubin's Lemma VII.1.8 (in the proof of `ES.8/characteristic-ideal-bound-with-error`): for `G`
finite abelian, `R` a principal ideal domain and `B` a finitely generated `R[G]`-module without
`R`-torsion, if every functional value `ψ(b)` lies in `f R[G]` for a non-zero-divisor `f`, then
`b ∈ f B`. -/
theorem mem_smul_of_forall_dual_mem {R G : Type*} [CommRing R] [IsDomain R]
    [IsPrincipalIdealRing R] [CommGroup G] [Finite G] {B : Type*} [AddCommGroup B]
    [Module (MonoidAlgebra R G) B] [Module R B] [IsScalarTower R (MonoidAlgebra R G) B]
    [Module.Finite (MonoidAlgebra R G) B] [NoZeroSMulDivisors R B]
    (f : MonoidAlgebra R G) (hf : f ∈ nonZeroDivisors (MonoidAlgebra R G)) (b : B)
    (h : ∀ ψ : Module.Dual (MonoidAlgebra R G) B, ψ b ∈ Ideal.span {f}) : ∃ b', b = f • b' :=
  sorry

end RubinLemma

/- Suggested signatures awaiting the carriers of `SelmerIwasawaCohomology` L2–L3 (Galois
cohomology of the finite layers `F` of `K∞/K`, restricted and true Selmer groups) and of ES.2
(Euler systems). In each, `E : ZpdExtension p P` is admissible, `Λ = iwasawaAlgebra O E`,
`H¹∞ = H¹_∞(K, T)` and `X∞ = Xinf`.

* **`ES.8/restricted-iwasawa-selmer-module`**: `restrictedSelmerInf`, `Xinf`,
  `restrictedSelmerInf.res`, `Xinf_coinvariants`, `Xinf_finitelyGenerated`, `Xinf_twist`,
  `Xinf_eq_mazurRubin` (an `ι`-semilinear identification with Mazur–Rubin's `X∞`); tests
  `Xinf_rat_Zp1`, `Xinf_coinvariants_rank_one`,
  `Xinf_not_true_selmer`, `Xinf_contragredient`.
* **`ES.8/iwasawa-class-of-an-euler-system`**: `iwasawaClass : ES(T, 𝒦, N) →ₗ H¹∞`,
  `iwasawaClassAt`, `iwasawaClass_proj`, `iwasawaClass_smul`, `iwasawaClass_zero`,
  `iwasawaClass_mem_unramified`, `iwasawaClass_twist`, `iwasawaClass_eq_kappaOne`; tests
  `iwasawaClass_zero_index`, `iwasawaClass_norm_coherent`, `iwasawaClass_proj_base`,
  `iwasawaClass_cyclotomic`.
* **`ES.8/true-iwasawa-selmer-and-singular-quotient`**: `trueSelmerInf`, `singularLocalInf`,
  `locSingularInf`, `restrictedSelmerInf_le_true`, `compatible_cor_iff_res`,
  `singularLocal_torsionFree`, `singularLocalInf_eq_zero_of_full`; tests
  `singularLocalInf_full_condition`, `singularLocal_strict_condition`,
  `singularLocalInf_cyclotomic`, `singularLocal_not_torsion`.
* **`ES.8/twisting-by-characters-of-gamma`**: `twistGamma`, `twistGamma_eulerRelation`,
  `twistGamma_twistGamma`, `twistGamma_of_finiteOrder`, `iwasawaCohomologyTwistEquiv`,
  `selmerTwistEquiv`, `exists_good_twist`, `twistGamma_tate`; tests `twistGamma_one`,
  `twistGamma_eulerFactor_rank_one`, `twistGamma_not_pointwise`,
  `twistGamma_finiteOrder_agrees`.
* **`ES.8/iwasawa-evaluation-maps`**: `evalStar`, `eval`, `evalAt`, `aTau`, `aTau_eq_one`,
  `groupRingDualEquiv`, `eval_frobenius_derivative`, `eval_pairing`, `eval_semilinear`; tests
  `aTau_rank_one`, `aTau_unipotent_lower_bound`, `evalStar_wellDefined`,
  `eval_not_Lambda_linear`.
* **`ES.8/unramified-at-split-primes-condition`**: `UnramifiedAtSplitPrimes`,
  `unramifiedAtSplitPrimes_of_noSplitPrimes`, `unramifiedAtSplitPrimes_mem`,
  `splitPrimes_density_zero`, `weakLeopoldt_of_unramifiedAtSplitPrimes`,
  `unramifiedAtSplitPrimes_kummer`; tests `unramifiedAtSplitPrimes_vacuous`,
  `unramifiedAtSplitPrimes_anticyclotomic`, `unramifiedAtSplitPrimes_kummer_example`,
  `unramifiedAtSplitPrimes_not_selmer_limit`.

Named theorems:
* `twistingInvariance` (**`ES.8/twisting-invariance-of-iwasawa-theorems`**, Theorem VI.4.1):
  `charIdeal Λ (Xinf (T ⊗ ρ)) = (charIdeal Λ (Xinf T)).map Tw_ρ⁻¹` and
  `lambdaIndex Λ (iwasawaClass c^ρ) = (lambdaIndex Λ (iwasawaClass c)).map Tw_ρ⁻¹`.
* `restrictionControl` (**`ES.8/restriction-control-over-the-tower`**, Proposition VII.3.4).
* `Xinf_fg` (**`ES.8/x-infinity-finitely-generated`**, Lemma VII.4.1):
  `Module.Finite Λ Xinf`.
* `weakLeopoldt` (**`ES.8/weak-leopoldt-from-an-euler-system`**, Theorem II.3.2):
  `IwasawaHypV … → iwasawaClass c ∉ Submodule.torsion Λ H¹∞ → Module.IsTorsion Λ Xinf`.
* `rankOneLeopoldt` (**`ES.8/rank-one-leopoldt-case`**, Lemma VII.3.7).
* `kolyvaginSequenceInduction` (**`ES.8/kolyvagin-sequence-induction`**, Propositions VII.1.4,
  VII.1.6).
* `charIdeal_dvd_aTau_pow_mul` (**`ES.8/characteristic-ideal-bound-with-error`**, Theorem
  VII.1.9): `(aTau : Λ) ^ (5 * r) • lambdaIndex Λ (iwasawaClass c) ≤ charIdeal Λ Xinf`.
* `rubinDivisibility` (**`ES.8/rubin-iwasawa-divisibility`**, Theorem II.3.3):
  `IwasawaHypT … → LeopoldtTowerHyp … → lambdaIndex Λ (iwasawaClass c) ≤ charIdeal Λ Xinf`.
* `rubinRationalDivisibility` (**`ES.8/rubin-rational-iwasawa-divisibility`**, Theorem II.3.4):
  `∃ t, (p : Λ) ^ t • lambdaIndex Λ (iwasawaClass c) ≤ charIdeal Λ Xinf`.
* `iwasawaPoitouTate` (**`ES.8/iwasawa-poitou-tate-sequence`**, Proposition II.3.7): the exact
  sequence `0 → singularLocalInf / range locSingularInf → dual (trueSelmerInf) → Xinf → 0`.
* `trueSelmerDivisibility` (**`ES.8/true-selmer-iwasawa-divisibility`**, Theorem II.3.8). -/

end EulerSystem

end TauCeti
