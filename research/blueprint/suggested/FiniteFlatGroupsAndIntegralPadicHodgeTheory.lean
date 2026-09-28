/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Valuation.Discrete.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.RingTheory.DedekindDomain.Basic
import Mathlib.NumberTheory.NumberField.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange

/-!
# Finite flat groups and integral p-adic Hodge theory — suggested declarations (R07.1)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474); the file has not been compiled.

Layer covered: R07.1 (p-divisible groups of arbitrary height with duality, Tate modules and
the connected–étale sequence; schematic closure and finite flat models; Raynaud's uniqueness
theorem for `e < p - 1` and the boundary case; F-vector schemes, Raynaud's classification and
tame inertia; the Oort–Tate classification, locally and over rings of integers).

Everything is stated over an affine base, on Tau Ceti's
`FiniteLocallyFreeCommAffineGroupSchemeCat`, whose objects are finite, flat and of finite
presentation. Objects imported from Tau Ceti's ModularCurves roadmap appear as placeholders
named after their owners' planned declarations:

* `rank`, `nsmulHom`, `IsLeftExact`, `IsShortExact` — ModularCurves 0B and 0C;
* `connectedComponent`, `etaleQuotient`, `IsEtale`, `IsConnected`, `IsMultiplicative` —
  ModularCurves 7E PD-2 (the finite-level connected–étale sequence over a henselian base);
* `genericFibre`, `genericPoints` — generic fibres and their Galois modules (ModularCurves 0D
  for the field case);
* `muPow`, `constZModPow` — the groups `μ_{p^v}` and `ℤ/p^vℤ` of ModularCurves 0B.
-/

noncomputable section

open CategoryTheory Opposite

universe u

namespace TauCeti.FiniteFlat

/-- Finite locally free commutative group schemes over `Spec R` (Tau Ceti). -/
abbrev FLF (R : Type u) [CommRing R] :=
  FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

/-! ## Imported objects (placeholders; owned elsewhere) -/

section Placeholders

variable {R : Type u} [CommRing R]

/-- ModularCurves 0B: the rank of a finite locally free group of constant rank. -/
def rank (G : FLF R) : ℕ := sorry

/-- ModularCurves 0B: multiplication by `n` on a commutative group scheme. -/
def nsmulHom (G : FLF R) (n : ℕ) : G ⟶ G := sorry

/-- ModularCurves 0B: `0 → A → B → C` is exact, i.e. `i` is the kernel of `f`. -/
def IsLeftExact {A B C : FLF R} (i : A ⟶ B) (f : B ⟶ C) : Prop := sorry

/-- ModularCurves 0C: `0 → A → B → C → 0` is exact for the fppf topology. -/
def IsShortExact {A B C : FLF R} (i : A ⟶ B) (f : B ⟶ C) : Prop := sorry

/-- ModularCurves 0B: `G` is étale over `R`. -/
def IsEtale (G : FLF R) : Prop := sorry

/-- ModularCurves 0B: `G` is of multiplicative type (its Cartier dual is étale). -/
def IsMultiplicative (G : FLF R) : Prop := sorry

/-- ModularCurves 7E PD-2: `G` is connected (over a local base). -/
def IsConnected (G : FLF R) : Prop := sorry

/-- ModularCurves 7E PD-2: the connected component `G⁰`. -/
def connectedComponent [HenselianLocalRing R] (G : FLF R) : FLF R := sorry

/-- ModularCurves 7E PD-2: the étale quotient `G^ét`. -/
def etaleQuotient [HenselianLocalRing R] (G : FLF R) : FLF R := sorry

/-- ModularCurves 0B: `μ_{p^v}`. -/
def muPow (p v : ℕ) : FLF R := sorry

/-- ModularCurves 0B: the constant group `ℤ/p^vℤ`. -/
def constZModPow (p v : ℕ) : FLF R := sorry

variable (K : Type u) [Field K] [Algebra R K]

/-- The generic fibre `G ⊗_R K`. -/
def genericFibre (G : FLF R) : FLF K :=
  (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).obj G

/-- The Galois module `G(K̄)` of points of the generic fibre (ModularCurves 0D). -/
def genericPoints (G : FLF R) : Type u := sorry

instance (G : FLF R) : AddCommGroup (genericPoints K G) := sorry

instance (G : FLF R) :
    DistribMulAction (Field.absoluteGaloisGroup K) (genericPoints K G) := sorry

end Placeholders

/-! ## p-divisible groups -/

/-- A `p`-divisible group of height `h` over `R`: levels `G_v` of rank `p^(h v)` with
`0 → G_v → G_{v+1} → G_{v+1}` exact, the second map being multiplication by `p^v`. -/
structure PDivisibleGroup (R : Type u) [CommRing R] (p h : ℕ) where
  level : ℕ → FLF R
  incl : ∀ v, level v ⟶ level (v + 1)
  rank_level : ∀ v, rank (level v) = p ^ (h * v)
  exact : ∀ v, IsLeftExact (incl v) (nsmulHom (level (v + 1)) (p ^ v))

namespace PDivisibleGroup

variable {R : Type u} [CommRing R] {p h : ℕ}

/-- Homomorphisms: compatible families of level maps. -/
@[ext]
structure Hom (G H : PDivisibleGroup R p h) where
  app : ∀ v, G.level v ⟶ H.level v
  comm : ∀ v, G.incl v ≫ app (v + 1) = app v ≫ H.incl v

/-- The height. -/
def height (_G : PDivisibleGroup R p h) : ℕ := h

/-- Base change along `R → S`, levelwise. -/
def baseChange (S : Type u) [CommRing S] [Algebra R S] (G : PDivisibleGroup R p h) :
    PDivisibleGroup S p h := sorry

/-- `μ_{p^∞}`, of height one. -/
def muPInfty (R : Type u) [CommRing R] (p : ℕ) : PDivisibleGroup R p 1 := sorry

/-- `ℚ_p/ℤ_p`, constant, of height one. -/
def constQpZp (R : Type u) [CommRing R] (p : ℕ) : PDivisibleGroup R p 1 := sorry

theorem height_muPInfty : (muPInfty R p).height = 1 := rfl

/-- R07.1/p-divisible-level-exactness: `0 → G_v → G_{v+t} → G_t → 0` is exact. -/
theorem exact_levels [Fact p.Prime] (G : PDivisibleGroup R p h) (v t : ℕ) :
    ∃ (i : G.level v ⟶ G.level (v + t)) (j : G.level (v + t) ⟶ G.level t),
      IsShortExact i j := sorry

/-- R07.1/p-divisible-cartier-dual: the levelwise Cartier dual, with the duals of the maps
`G_{v+1} → G_v` induced by `p` as transitions. -/
def cartierDual (G : PDivisibleGroup R p h) : PDivisibleGroup R p h := sorry

theorem cartierDual_level (G : PDivisibleGroup R p h) (v : ℕ) :
    (cartierDual G).level v =
      FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R (G.level v) := sorry

/-- Biduality. -/
def cartierDualDual (G : PDivisibleGroup R p h) : Hom (cartierDual (cartierDual G)) G := sorry

/-- `(ℚ_p/ℤ_p)^D ≅ μ_{p^∞}`. -/
def cartierDual_constQpZp : Hom (cartierDual (constQpZp R p)) (muPInfty R p) := sorry

section Tate

variable [IsDomain R] (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K]
  [CharZero K]

/-- R07.1/p-divisible-tate-module: `T_p(G) = lim_v G_v(K̄)`, with its Galois action. -/
def tateModule (G : PDivisibleGroup R p h) : Type u := sorry

instance (G : PDivisibleGroup R p h) : AddCommGroup (tateModule K G) := sorry

instance [Fact p.Prime] (G : PDivisibleGroup R p h) : Module ℤ_[p] (tateModule K G) := sorry

theorem tateModule_free [Fact p.Prime] (G : PDivisibleGroup R p h) :
    Module.Free ℤ_[p] (tateModule K G) ∧ Module.finrank ℤ_[p] (tateModule K G) = h := sorry

end Tate

/-- R07.1/p-divisible-connected-etale: the connected and étale parts are `p`-divisible, with
heights adding up, over a henselian local base. The sequence need not split over `R`. -/
theorem connectedEtale_exact [HenselianLocalRing R] (G : PDivisibleGroup R p h) :
    ∃ (h₀ h₁ : ℕ) (G₀ : PDivisibleGroup R p h₀) (G₁ : PDivisibleGroup R p h₁),
      h₀ + h₁ = h ∧
      (∀ v, G₀.level v = connectedComponent (G.level v)) ∧
      (∀ v, G₁.level v = etaleQuotient (G.level v)) := sorry

end PDivisibleGroup

/-- Stix Proposition 40(4): an extension of a connected group by an étale one splits. -/
theorem split_of_etale_sub_connected_quot {R : Type u} [CommRing R] [HenselianLocalRing R]
    {E G C : FLF R} (i : E ⟶ G) (f : G ⟶ C) (hex : IsShortExact i f)
    (hE : IsEtale E) (hC : IsConnected C) :
    ∃ s : C ⟶ G, s ≫ f = 𝟙 C := sorry

/-! ## Closures and finite flat models -/

/-- R07.1/simple-finite-flat-groups (Deligne): a commutative group scheme of order `m` is
killed by `m`. -/
theorem nsmulHom_rank_eq_zero {R : Type u} [CommRing R] (G : FLF R) :
    nsmulHom G (rank G) = 0 := sorry

section Models

variable {R : Type u} [CommRing R] [IsDomain R] (K : Type u) [Field K] [Algebra R K]
  [IsFractionRing R K]

/-- R07.1/schematic-closure-of-generic-subgroups: over a Dedekind domain, the closure of a
closed subgroup of the generic fibre is a closed flat subgroup with that generic fibre. -/
theorem exists_schematicClosure [IsDedekindDomain R] (G : FLF R) (H : FLF K)
    (ι : H ⟶ genericFibre K G) [Mono ι] :
    ∃ (𝓗 : FLF R) (j : 𝓗 ⟶ G), Mono j ∧ Nonempty (genericFibre K 𝓗 ≅ H) := sorry

/-- R07.1/finite-flat-prolongations: a finite flat model of a finite commutative
`K`-group. -/
structure Prolongation (G : FLF K) where
  model : FLF R
  iso : genericFibre K model ≅ G

namespace Prolongation

variable {K} {G : FLF K}

/-- `𝓖 ≥ 𝓖'`: the identity of `G` extends to an `R`-morphism `𝓖 → 𝓖'`. -/
def Dominates (𝓖 𝓖' : Prolongation (R := R) K G) : Prop := sorry

/-- The supremum of two prolongations. -/
def sup (𝓖 𝓖' : Prolongation (R := R) K G) : Prolongation (R := R) K G := sorry

end Prolongation

/-- The absolute ramification index `e = v(p)` of a mixed-characteristic DVR. -/
def absRamificationIndex (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (p : ℕ) : ℕ := sorry

/-- R07.1/raynaud-uniqueness (Raynaud Theorem 3.3.3): if `e < p - 1` a finite commutative
`K`-group killed by a power of `p` has at most one finite flat prolongation. -/
theorem prolongation_unique_of_lt [IsDiscreteValuationRing R] [CharZero K] (p : ℕ)
    [Fact p.Prime] (he : absRamificationIndex R p < p - 1) (G : FLF K)
    (hG : ∃ n, nsmulHom G (p ^ n) = 0) (𝓖 𝓖' : Prolongation (R := R) K G) :
    Nonempty (𝓖.model ≅ 𝓖'.model) := sorry

/-- Raynaud Corollary 3.3.6(1): full faithfulness of the generic fibre for `e < p - 1`. -/
theorem genericFibre_map_bijective [IsDiscreteValuationRing R] [CharZero K] (p : ℕ)
    [Fact p.Prime] (he : absRamificationIndex R p < p - 1) (𝓖 𝓗 : FLF R)
    (h𝓖 : ∃ n, nsmulHom 𝓖 (p ^ n) = 0) (h𝓗 : ∃ n, nsmulHom 𝓗 (p ^ n) = 0) :
    Function.Bijective
      ((FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map (X := 𝓖) (Y := 𝓗)) :=
  sorry

end Models

/-! ## F-vector schemes and tame inertia -/

/-- Raynaud's condition (**): the eigen-sheaves of the augmentation ideal for the fundamental
characters of `F^×` are invertible. -/
def SatisfiesStarStar {F : Type} [Field F] [Fintype F] {R : Type u} [CommRing R] (G : FLF R)
    (act : F →+* End G) : Prop := sorry

/-- R07.1/f-vector-scheme: an `F`-vector scheme of rank `card F` satisfying (**). The base is
an algebra over Raynaud's ring `D`. -/
structure FVectorScheme (F : Type) [Field F] [Fintype F] (R : Type u) [CommRing R] where
  G : FLF R
  act : F →+* End G
  rank_eq : rank G = Fintype.card F
  starStar : SatisfiesStarStar G act

namespace FVectorScheme

variable {F : Type} [Field F] [Fintype F] {R : Type u} [CommRing R] [IsDomain R]
  [IsDiscreteValuationRing R] [HenselianLocalRing R]
  [IsSepClosed (IsLocalRing.ResidueField R)] {p r : ℕ} [Fact p.Prime]

/-- The exponents `n_i = v(δ_i)` of the equations `X_i^p = δ_i X_{i+1}` (Corollary 1.5.1). -/
def exponents (hq : Fintype.card F = p ^ r) (G : FVectorScheme F R) : ZMod r → ℕ := sorry

/-- R07.1/raynaud-classification (Corollary 1.5.2), bound: `0 ≤ n_i ≤ e`. -/
theorem exponents_le (hq : Fintype.card F = p ^ r) (G : FVectorScheme F R) (i : ZMod r) :
    exponents hq G i ≤ absRamificationIndex R p := sorry

/-- Corollary 1.5.2, injectivity: the exponents determine the scheme up to isomorphism. -/
theorem nonempty_iso_of_exponents_eq (hq : Fintype.card F = p ^ r) (G G' : FVectorScheme F R)
    (h : exponents hq G = exponents hq G') : Nonempty (G.G ≅ G'.G) := sorry

/-- Corollary 1.5.2, surjectivity: every family with `n_i ≤ e` occurs. -/
theorem exists_exponents_eq (hq : Fintype.card F = p ^ r) (n : ZMod r → ℕ)
    (hn : ∀ i, n i ≤ absRamificationIndex R p) :
    ∃ G : FVectorScheme F R, exponents hq G = n := sorry

end FVectorScheme

/-! ## Groups of prime order -/

/-- The Oort–Tate group `G_{a,b} = Spec R[X]/(X^p - aX)`, for `a b = w_p`. -/
def oortTateGroup {R : Type u} [CommRing R] (p : ℕ) (a b : R) : FLF R := sorry

/-- R07.1/oort-tate-classification (Stix Theorem 60 (2)): `G_{a,b} ≅ G_{c,d}` iff
`(c, d) = (u^{p-1} a, u^{1-p} b)` for a unit `u`. -/
theorem oortTateGroup_iso_iff {R : Type u} [CommRing R] (p : ℕ) [Fact p.Prime]
    (a b c d : R) :
    Nonempty (oortTateGroup p a b ≅ oortTateGroup p c d) ↔
      ∃ u : Rˣ, c = (u : R) ^ (p - 1) * a ∧ b = (u : R) ^ (p - 1) * d := sorry

/-- The Cartier dual of `G_{a,b}` is `G_{b,a}`. -/
theorem cartierDual_oortTateGroup {R : Type u} [CommRing R] (p : ℕ) (a b : R) :
    Nonempty (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R (oortTateGroup p a b) ≅
      oortTateGroup p b a) := sorry

/-- R07.1/oort-tate-over-number-rings (Artin–Mazur): over `ℤ` every group of prime order `p`
is `ℤ/pℤ` or `μ_p`. -/
theorem group_of_order_p_over_int (p : ℕ) [Fact p.Prime] (G : FLF ℤ) (hG : rank G = p) :
    Nonempty (G ≅ constZModPow p 1) ∨ Nonempty (G ≅ muPow p 1) := sorry

end TauCeti.FiniteFlat
