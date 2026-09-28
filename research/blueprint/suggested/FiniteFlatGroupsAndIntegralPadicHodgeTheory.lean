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
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Discriminant
import Mathlib.RingTheory.Etale.Finite
import Mathlib.RingTheory.QuasiFinite.Basic
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.CategoryTheory.Galois.Equivalence
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Identities
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.RingTheory.WittVector.DiscreteValuationRing
import Mathlib.RingTheory.Length
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange

/-!
# Finite flat groups and integral p-adic Hodge theory — suggested declarations (R07.1–R07.2)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474); the file has not been compiled.

Layer covered: R07.1 (p-divisible groups of arbitrary height with duality, Tate modules and
the connected–étale sequence; schematic closure and finite flat models; Raynaud's uniqueness
theorem for `e < p - 1` and the boundary case; F-vector schemes, Raynaud's classification and
tame inertia; the Oort–Tate classification, locally and over rings of integers; formal Lie
groups, the dimension, Tate's Hodge–Tate and generic-fibre theorems; Raynaud's extension
criterion; the finite part of a quasi-finite group; finite étale groups as Galois modules; gluing
over a completion and a localisation; the Katz–Mazur groups).

Everything is stated over an affine base, on Tau Ceti's
`FiniteLocallyFreeCommAffineGroupSchemeCat`, whose objects are finite, flat and of finite
presentation. Objects imported from Tau Ceti's ModularCurves roadmap appear as placeholders
named after their owners' planned declarations:

* `rank`, `nsmulHom`, `IsLeftExact`, `IsShortExact` — ModularCurves 0B and 0C;
* `connectedComponent`, `etaleQuotient`, `IsEtale`, `IsConnected`, `IsMultiplicative` —
  ModularCurves 7E PD-2 (the finite-level connected–étale sequence over a henselian base);
* `genericFibre`, `genericPoints` — generic fibres and their Galois modules (ModularCurves 0D
  for the field case);
* `muPow`, `constZModPow` — the groups `μ_{p^v}` and `ℤ/p^vℤ` of ModularCurves 0B;
* `CK` — the completion of an algebraic closure of `K` (PadicHodgeTheory R06.1);
* `IsUnramifiedOutside` — unramified Galois modules (InverseGaloisAndArithmeticFundamentalGroups
  IG.0, via SGA 1 V.8.2).
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

/-- Homomorphisms: compatible families of level maps. The heights may differ. -/
@[ext]
structure Hom {h' : ℕ} (G : PDivisibleGroup R p h) (H : PDivisibleGroup R p h') where
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

/-! ## Formal Lie groups, dimension and Tate's theorems -/

/-- R07.1/formal-lie-group: the axioms of an `n`-dimensional commutative formal group law
`Φ(X, Y)`: associativity, `Φ(X, 0) = X = Φ(0, X)` and commutativity, by substitution. -/
def IsCommFormalGroupLaw {Λ : Type u} [CommRing Λ] {n : ℕ}
    (Φ : Fin n → MvPowerSeries (Fin n ⊕ Fin n) Λ) : Prop := sorry

/-- R07.1/formal-lie-group: a commutative formal Lie group `Spf Λ⟦X_1, …, X_n⟧`. -/
structure FormalLieGroup (Λ : Type u) [CommRing Λ] (n : ℕ) where
  law : Fin n → MvPowerSeries (Fin n ⊕ Fin n) Λ
  isLaw : IsCommFormalGroupLaw law

namespace FormalLieGroup

variable {Λ : Type u} [CommRing Λ] {n : ℕ}

/-- The dimension. -/
def dim (_𝒢 : FormalLieGroup Λ n) : ℕ := n

/-- `[p]^*` makes `Λ⟦X⟧` a free module of finite rank over itself. -/
def IsPDivisible (𝒢 : FormalLieGroup Λ n) (p : ℕ) : Prop := sorry

/-- The height: `[p]^*` has rank `p ^ height`. -/
def height (𝒢 : FormalLieGroup Λ n) (p : ℕ) : ℕ := sorry

/-- `Ĝ_m`, with law `X + Y + XY`. -/
def multiplicative (Λ : Type u) [CommRing Λ] : FormalLieGroup Λ 1 := sorry

theorem height_multiplicative (p : ℕ) [Fact p.Prime] :
    (multiplicative (ZMod p)).height p = 1 := sorry

/-- R07.1/serre-tate-connected-p-divisible: the connected `p`-divisible group `𝒢[p^∞]`. -/
def pDivisibleGroup (𝒢 : FormalLieGroup Λ n) (p : ℕ) (_hp : 𝒢.IsPDivisible p) :
    PDivisibleGroup Λ p (𝒢.height p) := sorry

end FormalLieGroup

namespace PDivisibleGroup

section Complete

variable {R : Type u} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
  [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [HenselianLocalRing R] {p h : ℕ} [Fact p.Prime]

/-- Serre–Tate (Tate Proposition 1, Stix Theorem 70): a connected `p`-divisible group over a
complete noetherian local ring comes from a `p`-divisible formal Lie group. -/
theorem exists_formalLieGroup (G : PDivisibleGroup R p h) (hG : ∀ v, IsConnected (G.level v)) :
    ∃ (n : ℕ) (𝒢 : FormalLieGroup R n) (hp : 𝒢.IsPDivisible p) (f : Hom (𝒢.pDivisibleGroup p hp) G),
      ∀ v, IsIso (f.app v) := sorry

/-- R07.1/p-divisible-dimension: the dimension of the formal Lie group of `G⁰`. -/
def dim (G : PDivisibleGroup R p h) : ℕ := sorry

theorem dim_muPInfty : (muPInfty R p).dim = 1 := sorry

theorem dim_constQpZp : (constQpZp R p).dim = 0 := sorry

/-- R07.1/dimension-plus-dual-dimension (Tate Proposition 3). -/
theorem dim_add_dim_cartierDual (G : PDivisibleGroup R p h) : G.dim + (cartierDual G).dim = h :=
  sorry

/-- R07.1/p-divisible-discriminant (Tate Proposition 2): the discriminant of the `v`-th level is
generated by `p ^ (n v p^{h v})`. Stated through a placeholder for the discriminant ideal. -/
theorem discr_level (discrIdeal : FLF R → Ideal R) (G : PDivisibleGroup R p h) (v : ℕ) :
    discrIdeal (G.level v) = Ideal.span {(p : R) ^ (G.dim * v * p ^ (h * v))} := sorry

end Complete

section TateTheorems

variable {R : Type u} [CommRing R] [IsDomain R] (K : Type u) [Field K] [Algebra R K]
  [IsFractionRing R K] [CharZero K] {p : ℕ} [Fact p.Prime]

instance {h : ℕ} (G : PDivisibleGroup R p h) :
    DistribMulAction (Field.absoluteGaloisGroup K) (tateModule K G) := sorry

/-- The homomorphism of generic fibres induced by `f`. -/
def Hom.genericFibre {h h' : ℕ} {G : PDivisibleGroup R p h} {H : PDivisibleGroup R p h'}
    (f : Hom G H) : Hom (G.baseChange K) (H.baseChange K) := sorry

/-- The `ℤ_p`-linear map of Tate modules induced by `f`. -/
def Hom.tateModuleMap {h h' : ℕ} {G : PDivisibleGroup R p h} {H : PDivisibleGroup R p h'}
    (f : Hom G H) : tateModule K G →ₗ[ℤ_[p]] tateModule K H := sorry

/-- R07.1/tate-generic-fibre-theorem (Tate Theorem 4): over an integrally closed noetherian domain
with fraction field of characteristic zero, homomorphisms of generic fibres extend uniquely. -/
theorem extend_genericFibre [IsIntegrallyClosed R] [IsNoetherianRing R] {h h' : ℕ}
    (G : PDivisibleGroup R p h) (H : PDivisibleGroup R p h')
    (f : Hom (G.baseChange K) (H.baseChange K)) :
    ∃! g : Hom G H, g.genericFibre K = f := sorry

/-- Tate Theorem 4, Corollary 2: a homomorphism that is an isomorphism generically is one. -/
theorem isIso_of_isIso_genericFibre [IsIntegrallyClosed R] [IsNoetherianRing R] {h h' : ℕ}
    {G : PDivisibleGroup R p h} {H : PDivisibleGroup R p h'} (g : Hom G H)
    (hg : ∀ v, IsIso ((g.genericFibre K).app v)) : ∀ v, IsIso (g.app v) := sorry

/-- R07.1/closure-of-generic-p-divisible-subgroups (Tate Proposition 12): a Galois-stable
direct summand of `T_p(F)` is the Tate module of a `p`-divisible group mapping to `F`. -/
theorem exists_of_tateModule_summand [IsDiscreteValuationRing R] {h : ℕ}
    (F : PDivisibleGroup R p h) (M : Submodule ℤ_[p] (tateModule K F))
    (hsummand : ∃ M' : Submodule ℤ_[p] (tateModule K F), IsCompl M M')
    (hstable : ∀ σ : Field.absoluteGaloisGroup K, ∀ x ∈ M, σ • x ∈ M) :
    ∃ (h' : ℕ) (Γ : PDivisibleGroup R p h') (φ : Hom Γ F),
      Function.Injective (φ.tateModuleMap K) ∧ LinearMap.range (φ.tateModuleMap K) = M := sorry

/-- PadicHodgeTheory R06.1: `C`, the completion of an algebraic closure of `K`. -/
def CK : Type u := sorry

instance : Field (CK K) := sorry

instance : Algebra K (CK K) := sorry

/-- `Hom_{ℤ_p}(T_p(G), C)^{G_K}`, a `K`-vector space. -/
def hodgeTateInvariants {h : ℕ} (G : PDivisibleGroup R p h) : Type u := sorry

instance {h : ℕ} (G : PDivisibleGroup R p h) : AddCommGroup (hodgeTateInvariants K G) := sorry

instance {h : ℕ} (G : PDivisibleGroup R p h) : Module K (hodgeTateInvariants K G) := sorry

/-- R07.1/hodge-tate-p-divisible (Tate Theorem 3; Stix Corollary 92): `Hom(T_p G, C)^{G_K}` has
dimension `dim G^D`, so `V_p(G)` is Hodge–Tate with weights `0` and `1`. -/
theorem finrank_hodgeTateInvariants [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [HenselianLocalRing R]
    [IsDiscreteValuationRing R] {h : ℕ} (G : PDivisibleGroup R p h) :
    Module.finrank K (hodgeTateInvariants K G) = (cartierDual G).dim := sorry

end TateTheorems

end PDivisibleGroup

/-- R07.1/raynaud-extension-of-generic-p-divisible (Raynaud Proposition 2.3.1): a `p`-divisible
group over `K` whose levels all have finite flat models extends to one over `R`. -/
theorem PDivisibleGroup.exists_extension_of_levels {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K]
    [CharZero K] {p h : ℕ} [Fact p.Prime] (G : PDivisibleGroup K p h)
    (hG : ∀ v, Nonempty (Prolongation (R := R) K (G.level v))) :
    ∃ (𝓖 : PDivisibleGroup R p h) (f : PDivisibleGroup.Hom (𝓖.baseChange K) G),
      ∀ v, IsIso (f.app v) := sorry

/-! ## Groups over rings of S-integers -/

/-- A separated, quasi-finite, flat, finitely presented commutative group scheme over `R`
(owned here; the carrier of R07.1/finite-part-of-quasi-finite-group). -/
def QFGroup (R : Type u) [CommRing R] : Type (u + 1) := sorry

/-- R07.1/finite-part-of-quasi-finite-group: the open and closed finite part `𝒢^f`. -/
def QFGroup.finitePart {R : Type u} [CommRing R] [HenselianLocalRing R] (𝒢 : QFGroup R) :
    FLF R := sorry

/-- InverseGaloisAndArithmeticFundamentalGroups IG.0 / SGA 1 V.8.2: the `G_ℚ`-module `M` is
unramified at every prime not dividing `N`. -/
def IsUnramifiedOutside (N : ℕ) (M : Type) [AddCommGroup M]
    [DistribMulAction (Field.absoluteGaloisGroup ℚ) M] : Prop := sorry

section Etale

variable (N : ℕ)

/-- R07.1/etale-groups-as-galois-modules: the finite étale group scheme `V(ρ)` over `ℤ[1/N]`
attached to a finite `G_ℚ`-module unramified outside `N∞`. -/
def etaleGroupOfGaloisModule (M : Type) [AddCommGroup M] [Finite M]
    [DistribMulAction (Field.absoluteGaloisGroup ℚ) M] (_hM : IsUnramifiedOutside N M) :
    FLF (Localization.Away (N : ℤ)) := sorry

theorem isEtale_etaleGroupOfGaloisModule (M : Type) [AddCommGroup M] [Finite M]
    [DistribMulAction (Field.absoluteGaloisGroup ℚ) M] (hM : IsUnramifiedOutside N M) :
    IsEtale (etaleGroupOfGaloisModule N M hM) := sorry

/-- Every finite étale commutative group scheme over `ℤ[1/N]` arises this way. -/
theorem exists_galoisModule_of_isEtale (G : FLF (Localization.Away (N : ℤ))) (hG : IsEtale G) :
    ∃ (M : Type) (_ : AddCommGroup M) (_ : Finite M)
      (_ : DistribMulAction (Field.absoluteGaloisGroup ℚ) M) (hM : IsUnramifiedOutside N M),
      Nonempty (G ≅ etaleGroupOfGaloisModule N M hM) := sorry

end Etale

/-- R07.1/gluing-equivalence: a gluing datum `(G₁, G₂, θ)` over `R̂` and `R[1/p]`; the
isomorphism `θ` over `R̂[1/p]` is recorded through the placeholder `GluingIso`. -/
def GluingIso {R : Type u} [CommRing R] (p : R) (G₁ : FLF (AdicCompletion (Ideal.span {p}) R))
    (G₂ : FLF (Localization.Away p)) : Type u := sorry

structure GluingDatum (R : Type u) [CommRing R] (p : R) where
  G₁ : FLF (AdicCompletion (Ideal.span {p}) R)
  G₂ : FLF (Localization.Away p)
  θ : GluingIso p G₁ G₂

/-- The gluing datum of a finite flat `R`-group. -/
def toGluingDatum {R : Type u} [CommRing R] (p : R) (G : FLF R) : GluingDatum R p := sorry

/-- Schoof Proposition 2.3 (essential surjectivity): every gluing datum comes from a finite
flat `R`-group, for `R` noetherian. -/
theorem exists_of_gluingDatum {R : Type u} [CommRing R] [IsNoetherianRing R] (p : R)
    (D : GluingDatum R p) :
    ∃ (G : FLF R) (e₁ : (toGluingDatum p G).G₁ ≅ D.G₁), Nonempty ((toGluingDatum p G).G₂ ≅ D.G₂) :=
  sorry

/-- R07.1/katz-mazur-groups: `T_ε = Spec ⊕_{i<p} R[X_i]/(X_i^p - ε^i)`. -/
def katzMazur {R : Type u} [CommRing R] (p : ℕ) (ε : Rˣ) : FLF R := sorry

theorem katzMazur_rank {R : Type u} [CommRing R] (p : ℕ) [Fact p.Prime] (ε : Rˣ) :
    rank (katzMazur p ε) = p ^ 2 := sorry

/-- `0 → μ_p → T_ε → ℤ/pℤ → 0`. -/
theorem katzMazur_extension {R : Type u} [CommRing R] (p : ℕ) [Fact p.Prime] (ε : Rˣ) :
    ∃ (i : muPow p 1 ⟶ katzMazur p ε) (j : katzMazur p ε ⟶ constZModPow p 1),
      IsShortExact i j := sorry

/-- `T_ε ≅ T_{ε u^p}`. -/
def katzMazurIsoOfDiv {R : Type u} [CommRing R] (p : ℕ) (ε u : Rˣ) :
    katzMazur p ε ≅ katzMazur p (ε * u ^ p) := sorry

end TauCeti.FiniteFlat


/-! ## R07.2: Dieudonné theory over a perfect field

Contravariant convention (Demazure, Fontaine, Pink): `F` on `M(G)` comes from `F_G`, and
`M(ℚ_p/ℤ_p) = (𝕎 k, F = σ)`, `M(μ_{p^∞}) = (𝕎 k, F = p σ)`. -/

namespace TauCeti.Dieudonne

open TauCeti.FiniteFlat

section

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- R07.2/dieudonne-ring: a Dieudonné module over `k`, i.e. a `𝕎 k`-module with a σ-linear `F`,
a σ⁻¹-linear `V` and `F V = V F = p` (equivalently a left module over the Dieudonné ring). -/
structure DieudonneModule where
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (WittVector p k) M]
  F : M →+ M
  V : M →+ M
  F_smul : ∀ (a : WittVector p k) (x : M), F (a • x) = WittVector.frobenius a • F x
  V_smul : ∀ (a : WittVector p k) (x : M), V (WittVector.frobenius a • x) = a • V x
  F_V : ∀ x, F (V x) = (p : WittVector p k) • x
  V_F : ∀ x, V (F x) = (p : WittVector p k) • x

attribute [instance] DieudonneModule.addCommGroup DieudonneModule.module

/-- Morphisms of Dieudonné modules: `𝕎 k`-linear maps commuting with `F` and `V`. -/
structure DieudonneModule.Hom (M N : DieudonneModule p k) where
  toLinearMap : M.M →ₗ[WittVector p k] N.M
  comm_F : ∀ x, toLinearMap (M.F x) = N.F (toLinearMap x)
  comm_V : ∀ x, toLinearMap (M.V x) = N.V (toLinearMap x)

/-- R07.2/frobenius-verschiebung: the relative Frobenius `F_G : G → G^{(p)}` (its target, the
Frobenius twist, is recorded through `frobeniusTwist`). -/
def frobeniusTwist (G : FLF k) : FLF k := sorry

def frobeniusHom (G : FLF k) : G ⟶ frobeniusTwist p k G := sorry

def verschiebungHom (G : FLF k) : frobeniusTwist p k G ⟶ G := sorry

/-- Pink Theorem 14.4: `V_G ∘ F_G = p`. -/
theorem frobeniusHom_comp_verschiebungHom (G : FLF k) :
    frobeniusHom p k G ≫ verschiebungHom p k G = nsmulHom G p := sorry

/-- R07.2/dieudonne-module-finite: the contravariant Dieudonné module of a finite commutative
`p`-group scheme. -/
def dieudonneModuleFinite (G : FLF k) : DieudonneModule p k := sorry

/-- Functoriality (contravariant). -/
def dieudonneMap {G H : FLF k} (f : G ⟶ H) :
    DieudonneModule.Hom p k (dieudonneModuleFinite p k H) (dieudonneModuleFinite p k G) := sorry

/-- R07.2/dieudonne-equivalence-finite (Pink Theorem 28.3): full faithfulness. -/
theorem dieudonneMap_bijective (G H : FLF k) (hG : ∃ n, rank G = p ^ n)
    (hH : ∃ n, rank H = p ^ n) :
    Function.Bijective (dieudonneMap p k (G := G) (H := H)) := sorry

/-- Pink Theorem 28.3: `length M(G) = log_p |G|`. -/
theorem length_dieudonneModuleFinite (G : FLF k) (n : ℕ) (hG : rank G = p ^ n) :
    Module.length (WittVector p k) (dieudonneModuleFinite p k G).M = n := sorry

/-- R07.2/dieudonne-p-divisible: the Dieudonné module `lim M(G_n)` of a `p`-divisible group. -/
def dieudonneModulePDiv {h : ℕ} (G : PDivisibleGroup k p h) : DieudonneModule p k := sorry

/-- Demazure III.8: `M(G)` is free of rank equal to the height. -/
theorem dieudonneModulePDiv_free {h : ℕ} (G : PDivisibleGroup k p h) :
    Module.Free (WittVector p k) (dieudonneModulePDiv p k G).M ∧
      Module.finrank (WittVector p k) (dieudonneModulePDiv p k G).M = h := sorry

/-- The image of `F`, a `𝕎 k`-submodule because `σ` is surjective on `𝕎 k` for perfect `k`. -/
def imageF (M : DieudonneModule p k) : Submodule (WittVector p k) M.M := sorry

theorem coe_imageF (M : DieudonneModule p k) : (imageF p k M : Set M.M) = Set.range M.F := sorry

/-- R07.2/dieudonne-lie-algebra: `dim G = length_{𝕎 k} (M(G)/F M(G))` (Yu, p. 3). -/
theorem length_coker_F_eq_dim [IsAdicComplete (IsLocalRing.maximalIdeal k) k]
    [HenselianLocalRing k] {h : ℕ} (G : PDivisibleGroup k p h) :
    Module.length (WittVector p k)
      ((dieudonneModulePDiv p k G).M ⧸ imageF p k (dieudonneModulePDiv p k G)) = G.dim := sorry

end

/-- R07.2/standard-dieudonne-modules: rationally, `M(μ_{p^∞})` is Mathlib's standard isocrystal of
slope one (and `M(ℚ_p/ℤ_p)` that of slope zero); the rational module is recorded through the
placeholder `rationalIsocrystal`. -/
def rationalIsocrystal (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] {h : ℕ} (_G : PDivisibleGroup k p h) : Type u := sorry

end TauCeti.Dieudonne
