/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Etale.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.RingTheory.DedekindDomain.Basic
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.Identities
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.RingTheory.WittVector.DiscreteValuationRing
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.PowerSeries.Expand
import Mathlib.RingTheory.Polynomial.Eisenstein.Basic
import Mathlib.Algebra.Ring.Action.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange

/-!
# Finite flat groups and integral p-adic Hodge theory — suggested declarations (R07.1–R07.6)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline
(Mathlib 082e2d3, Tau Ceti f790474), proved by `sorry`.

Only what the pinned libraries can carry is stated in Lean. Every predicate here has a real
body, built from Tau Ceti's finite locally free group schemes over an affine base
(`FiniteLocallyFreeCommAffineGroupSchemeCat`, with its coordinate Hopf algebra, Cartier duality
and base change), Mathlib's Witt vectors, power series and Eisenstein polynomials. The roadmap's
own constructions whose bodies are planned work (the Oort–Tate and Katz–Mazur groups, the
supremum of two models, Frobenius and Verschiebung, the Dieudonné module) appear as signatures.
Nothing owned by another roadmap is given a placeholder: statements that need multiplication by
`n` and exactness of sequences of group schemes (ModularCurves 0B/0C), `p`-divisible groups
built on them, period rings (PadicHodgeTheory R06.1), tame inertia (Tau Ceti
LocalFieldsRamification Layer 4) or Galois cohomology are roadmap targets, and the closing
comment lists the names of every API item and unit test of the plan that is not declared here.

Namespaces: R07.1 and R07.5 in `TauCeti.FiniteFlat`, R07.2 in `TauCeti.Dieudonne`, R07.3 in
`TauCeti.FontaineLaffaille`, R07.4 in `TauCeti.BreuilKisin`.
-/

set_option linter.overlappingInstances false

noncomputable section

open CategoryTheory Opposite

universe u

namespace TauCeti.FiniteFlat

/-- Finite locally free commutative group schemes over `Spec R` (Tau Ceti). -/
abbrev FLF (R : Type u) [CommRing R] :=
  FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

section Basic

variable {R : Type u} [CommRing R]

/-- The coordinate Hopf algebra `A` of `G = Spec A`. -/
abbrev coord (G : FLF R) := FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G

/-- The order (rank) of `G`, the rank of its coordinate algebra. Over a local base, where the
algebra is free, this is the order; over a general base the planned API uses the locally
constant rank function (current Tau Ceti `CartierDuality/Rank.lean`). -/
def rank (G : FLF R) : ℕ := Module.finrank R (coord G)

/-- `G` is étale: its coordinate algebra is étale over `R`. -/
def IsEtale (G : FLF R) : Prop := Algebra.Etale R (coord G)

/-- `G` is of multiplicative type: its Cartier dual is étale. -/
def IsMultiplicative (G : FLF R) : Prop :=
  IsEtale (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G)

/-- Over a local base, `G` is connected exactly when its finite coordinate algebra is local. -/
def IsConnectedLocal (G : FLF R) : Prop := IsLocalRing (coord G)

/-- Biduality (Tau Ceti, read at the pin). -/
example (G : FLF R) :
    FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R
      (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G) ≅ G :=
  (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualDualIso R G).symm

/-- R07.1/p-divisible-cartier-dual, at finite level: Cartier duality preserves the order. -/
theorem rank_cartierDual (G : FLF R) :
    rank (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G) = rank G := sorry

variable (K : Type u) [Field K] [Algebra R K]

/-- The generic fibre `G ⊗_R K`. -/
def genericFibre (G : FLF R) : FLF K :=
  (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).obj G

/-- Base change preserves the order. -/
theorem rank_genericFibre (G : FLF R) : rank (genericFibre K G) = rank G := sorry

end Basic

/-! ## R07.1: closures and finite flat models -/

section Models

variable {R : Type u} [CommRing R] [IsDomain R] (K : Type u) [Field K] [Algebra R K]
  [IsFractionRing R K]

/-- R07.1/schematic-closure-of-generic-subgroups: over a Dedekind domain, the closure of a
closed subgroup of the generic fibre is a closed flat subgroup with that generic fibre. -/
theorem exists_schematicClosure [IsDedekindDomain R] (G : FLF R) (H : FLF K)
    (ι : H ⟶ genericFibre K G) [Mono ι] :
    ∃ (𝓗 : FLF R) (j : 𝓗 ⟶ G), Mono j ∧ Nonempty (genericFibre K 𝓗 ≅ H) := sorry

/-- R07.1/finite-flat-prolongations: a finite flat model of a finite commutative `K`-group. -/
structure Prolongation (G : FLF K) where
  model : FLF R
  iso : genericFibre K model ≅ G

namespace Prolongation

variable {K} {G : FLF K}

/-- `𝓖 ≥ 𝓖'`: the identity of `G` extends to an `R`-morphism `𝓖 → 𝓖'`. -/
def Dominates (𝓖 𝓖' : Prolongation (R := R) K G) : Prop :=
  ∃ f : 𝓖.model ⟶ 𝓖'.model,
    (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map f ≫ 𝓖'.iso.hom =
      𝓖.iso.hom

/-- Test (`Prolongation.self`): every model dominates itself, through the identity. -/
theorem self (𝓖 : Prolongation (R := R) K G) : 𝓖.Dominates 𝓖 := sorry

/-- The extending morphism is unique (`Prolongation.Dominates`, uniqueness). -/
theorem dominates_unique {𝓖 𝓖' : Prolongation (R := R) K G} (f g : 𝓖.model ⟶ 𝓖'.model)
    (hf : (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map f ≫ 𝓖'.iso.hom =
      𝓖.iso.hom)
    (hg : (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map g ≫ 𝓖'.iso.hom =
      𝓖.iso.hom) : f = g := sorry

/-- The supremum of two models: the closure of the antidiagonal (construction of this roadmap). -/
def sup (𝓖 𝓖' : Prolongation (R := R) K G) : Prolongation (R := R) K G := sorry

theorem le_sup_left (𝓖 𝓖' : Prolongation (R := R) K G) : (sup 𝓖 𝓖').Dominates 𝓖 := sorry

end Prolongation

/-- The absolute ramification index `e = v(p)` of a discrete valuation ring. -/
def absRamificationIndex (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (p : ℕ) : ℕ :=
  (IsDiscreteValuationRing.addVal R (p : R)).toNat

/-- R07.1/raynaud-uniqueness (Raynaud Théorème 3.3.3): if `e < p - 1`, a finite commutative
`K`-group of `p`-power order has at most one finite flat model. -/
theorem prolongation_unique_of_lt [IsDiscreteValuationRing R] [CharZero K] (p : ℕ)
    [Fact p.Prime] (he : absRamificationIndex R p < p - 1) (G : FLF K)
    (hG : ∃ n, rank G = p ^ n) (𝓖 𝓖' : Prolongation (R := R) K G) :
    Nonempty (𝓖.model ≅ 𝓖'.model) := sorry

/-- Raynaud Corollaire 3.3.6, 1°: full faithfulness of the generic fibre for `e < p - 1`. -/
theorem genericFibre_map_bijective [IsDiscreteValuationRing R] [CharZero K] (p : ℕ)
    [Fact p.Prime] (he : absRamificationIndex R p < p - 1) (𝓖 𝓗 : FLF R)
    (h𝓖 : ∃ n, rank 𝓖 = p ^ n) (h𝓗 : ∃ n, rank 𝓗 = p ^ n) :
    Function.Bijective
      ((FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map (X := 𝓖) (Y := 𝓗)) :=
  sorry

end Models

/-! ## R07.1: groups of prime order and the Katz–Mazur groups -/

/-- The Oort–Tate group `G_{a,b} = Spec R[X]/(X^p - aX)`, for `a b = w_p` (construction of this
roadmap; the comultiplication is Oort–Tate's). -/
def oortTateGroup {R : Type u} [CommRing R] (p : ℕ) (a b : R) : FLF R := sorry

theorem rank_oortTateGroup {R : Type u} [CommRing R] [Nontrivial R] (p : ℕ) [Fact p.Prime]
    (a b : R) : rank (oortTateGroup p a b) = p := sorry

/-- R07.1/oort-tate-classification (Oort–Tate Theorem 2; Stix Theorem 60): `G_{a,b} ≅ G_{c,d}`
iff `(c, d) = (u^{p-1} a, u^{1-p} b)` for a unit `u`. -/
theorem oortTateGroup_iso_iff {R : Type u} [CommRing R] (p : ℕ) [Fact p.Prime]
    (a b c d : R) :
    Nonempty (oortTateGroup p a b ≅ oortTateGroup p c d) ↔
      ∃ u : Rˣ, c = (u : R) ^ (p - 1) * a ∧ b = (u : R) ^ (p - 1) * d := sorry

/-- The Cartier dual of `G_{a,b}` is `G_{b,a}`. -/
theorem cartierDual_oortTateGroup {R : Type u} [CommRing R] (p : ℕ) (a b : R) :
    Nonempty (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R (oortTateGroup p a b) ≅
      oortTateGroup p b a) := sorry

/-- R07.1/oort-tate-classification: over `ℤ_p` a group of order `p` is étale or multiplicative
(one of `a`, `b` is a unit, since `v(w_p) = 1`). -/
theorem isEtale_or_isMultiplicative_of_rank_eq (p : ℕ) [Fact p.Prime] (G : FLF ℤ_[p])
    (hG : rank G = p) : IsEtale G ∨ IsMultiplicative G := sorry

/-- R07.1/katz-mazur-groups: `T_ε = Spec ⊕_{i<p} R[X_i]/(X_i^p - ε^i)` (construction of this
roadmap). -/
def katzMazur {R : Type u} [CommRing R] (p : ℕ) (ε : Rˣ) : FLF R := sorry

theorem katzMazur_rank {R : Type u} [CommRing R] [Nontrivial R] (p : ℕ) [Fact p.Prime] (ε : Rˣ) :
    rank (katzMazur p ε) = p ^ 2 := sorry

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

/-- Test (`DieudonneModule.zero`): the zero module, the module of the trivial group. -/
def DieudonneModule.zero : DieudonneModule p k where
  M := PUnit
  F := 0
  V := 0
  F_smul _ _ := Subsingleton.elim _ _
  V_smul _ _ := Subsingleton.elim _ _
  F_V _ := Subsingleton.elim _ _
  V_F _ := Subsingleton.elim _ _

/-- R07.2/standard-dieudonne-modules (i): `M(ℚ_p/ℤ_p) = 𝕎 k` with `F = σ`, `V = p σ⁻¹`. -/
def dieudonneModuleQpZp : DieudonneModule p k where
  M := WittVector p k
  F := (WittVector.frobenius : WittVector p k →+* WittVector p k).toAddMonoidHom
  V := (p : WittVector p k) • ((WittVector.frobeniusEquiv p k).symm.toRingHom.toAddMonoidHom)
  F_smul a x := sorry
  V_smul a x := sorry
  F_V x := sorry
  V_F x := sorry

/-- R07.2/standard-dieudonne-modules (ii): `M(μ_{p^∞}) = 𝕎 k` with `F = p σ`, `V = σ⁻¹`. -/
def dieudonneModuleMuPInfty : DieudonneModule p k where
  M := WittVector p k
  F := (p : WittVector p k) • (WittVector.frobenius : WittVector p k →+* WittVector p k).toAddMonoidHom
  V := (WittVector.frobeniusEquiv p k).symm.toRingHom.toAddMonoidHom
  F_smul a x := sorry
  V_smul a x := sorry
  F_V x := sorry
  V_F x := sorry

/-- The two standard modules are told apart by `F`: on `M(ℚ_p/ℤ_p)` it is bijective, on
`M(μ_{p^∞})` its image lies in `p 𝕎 k` (slopes `0` and `1`). -/
theorem frobenius_bijective_dieudonneModuleQpZp :
    Function.Bijective (dieudonneModuleQpZp p k).F := sorry

theorem not_frobenius_surjective_dieudonneModuleMuPInfty :
    ¬ Function.Surjective (dieudonneModuleMuPInfty p k).F := sorry

/-- The Frobenius twist `G^{(p)} = G ×_{k, Frob} k`. -/
def frobeniusTwist (G : FLF k) : FLF k :=
  letI : Algebra k k := (frobenius k p).toAlgebra
  (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor k k).obj G

/-- R07.2/frobenius-verschiebung: the relative Frobenius `F_G : G → G^{(p)}` and the
Verschiebung `V_G : G^{(p)} → G` (constructions of this roadmap). -/
def frobeniusHom (G : FLF k) : G ⟶ frobeniusTwist p k G := sorry

def verschiebungHom (G : FLF k) : frobeniusTwist p k G ⟶ G := sorry

/-- R07.2/dieudonne-module-finite: the contravariant Dieudonné module of a finite commutative
`p`-group scheme over `k` (construction of this roadmap). -/
def dieudonneModule (G : FLF k) : DieudonneModule p k := sorry

/-- Functoriality (contravariant). -/
def dieudonneMap {G H : FLF k} (f : G ⟶ H) :
    DieudonneModule.Hom p k (dieudonneModule p k H) (dieudonneModule p k G) := sorry

/-- R07.2/dieudonne-equivalence-finite (Pink Theorem 28.3): full faithfulness. -/
theorem dieudonneMap_bijective (G H : FLF k) (hG : ∃ n, rank G = p ^ n)
    (hH : ∃ n, rank H = p ^ n) :
    Function.Bijective (dieudonneMap p k (G := G) (H := H)) := sorry

/-- Pink Theorem 28.3: `length M(G) = log_p |G|`. -/
theorem length_dieudonneModule (G : FLF k) (n : ℕ) (hG : rank G = p ^ n) :
    Module.length (WittVector p k) (dieudonneModule p k G).M = n := sorry

/-- R07.2/dieudonne-equivalence-finite: `G` is étale iff `F` is bijective on `M(G)`. -/
theorem isEtale_iff_bijective_F (G : FLF k) (hG : ∃ n, rank G = p ^ n) :
    IsEtale G ↔ Function.Bijective (dieudonneModule p k G).F := sorry

/-- The image of `F`, a `𝕎 k`-submodule because `σ` is surjective on `𝕎 k` for perfect `k`. -/
def imageF (M : DieudonneModule p k) : Submodule (WittVector p k) M.M :=
  Submodule.span (WittVector p k) (Set.range M.F)

theorem coe_imageF (M : DieudonneModule p k) : (imageF p k M : Set M.M) = Set.range M.F := sorry

end

end TauCeti.Dieudonne

/-! ## R07.3: Fontaine–Laffaille theory at `e = 1`

Fontaine–Laffaille 1982 with `A = W(k)`, `π = p`: filtered modules with `σ`-semilinear `φ^i`,
`φ^i = p φ^{i+1}` on `Fil^{i+1}`. The functor `U_S` is contravariant; the safe torsion interval is
`[0, p − 2]`. -/

namespace TauCeti.FontaineLaffaille

section

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- R07.3/fl-filtered-modules: a Fontaine–Laffaille filtered module over `W(k)`. -/
structure FLModule where
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (WittVector p k) M]
  fil : ℤ → Submodule (WittVector p k) M
  fil_antitone : Antitone fil
  fil_exhaustive : ∃ a, fil a = ⊤
  fil_separated : ∃ b, fil b = ⊥
  phi : ∀ i, fil i →ₛₗ[(WittVector.frobenius : WittVector p k →+* WittVector p k)] M
  phi_succ : ∀ (i : ℤ) (x : fil (i + 1)),
    phi i ⟨x, fil_antitone (by omega : i ≤ i + 1) x.2⟩ = (p : WittVector p k) • phi (i + 1) x

attribute [instance] FLModule.addCommGroup FLModule.module

/-- `M ∈ MF_tor`: finite length and `Σ φ^i(Fil^i) = M` (`FLModule.IsTorsion`). -/
def FLModule.IsTorsion (M : FLModule p k) : Prop :=
  Module.length (WittVector p k) M.M < ⊤ ∧
    (⨆ i, AddMonoidHom.range (M.phi i).toAddMonoidHom) = (⊤ : AddSubgroup M.M)

/-- `M ∈ MF_tor^{[a,b]}`: moreover `Fil^a = M` and `Fil^{b+1} = 0`. -/
def FLModule.IsTorsionIn (M : FLModule p k) (a b : ℤ) : Prop :=
  M.IsTorsion ∧ M.fil a = ⊤ ∧ M.fil (b + 1) = ⊥

/-- Morphisms of Fontaine–Laffaille modules. -/
structure FLModule.Hom (M N : FLModule p k) where
  toLinearMap : M.M →ₗ[WittVector p k] N.M
  map_fil : ∀ i, (M.fil i).map toLinearMap ≤ N.fil i
  comm_phi : ∀ i (x : M.fil i), toLinearMap (M.phi i x) =
    N.phi i ⟨toLinearMap x, map_fil i ⟨x, x.2, rfl⟩⟩

/-- Test (`FLModule.zero`): the zero module lies in every `MF_tor^{[a,b]}`. -/
def FLModule.zero : FLModule p k where
  M := PUnit
  fil _ := ⊥
  fil_antitone _ _ _ := le_rfl
  fil_exhaustive := ⟨0, sorry⟩
  fil_separated := ⟨0, rfl⟩
  phi _ := 0
  phi_succ _ _ := Subsingleton.elim _ _

theorem FLModule.zero_isTorsionIn (a b : ℤ) : (FLModule.zero p k).IsTorsionIn p k a b := sorry

/-- The unit object of weight `j`: `W(k)/p` with `Fil^i = M` for `i ≤ j`, `0` above, and
`φ^j = σ`; its torsion functor is `ω^j` on inertia (R07.3/fl-tame-inertia). Construction of this
roadmap. -/
def FLModule.unit (j : ℤ) : FLModule p k := sorry

theorem FLModule.unit_isTorsionIn (j : ℤ) : (FLModule.unit p k j).IsTorsionIn p k j j := sorry

/-- Test (`FLModule.not_strongly_divisible`): with `φ = 0` the sum condition fails, so a filtered
module with zero Frobenius on a nonzero module is not in `MF_tor`. -/
theorem FLModule.not_isTorsion_of_phi_eq_zero (M : FLModule p k) [Nontrivial M.M]
    (h : ∀ i (x : M.fil i), M.phi i x = 0) : ¬ M.IsTorsion p k := sorry

end

end TauCeti.FontaineLaffaille

/-! ## R07.4: Breuil–Kisin modules

Kisin's normalisation: `𝔖 = W(k)⟦u⟧` with `φ` the Witt vector Frobenius on coefficients and
`u ↦ u^p`, and `E(u)` the Eisenstein polynomial of a fixed uniformiser `π` of `O = 𝒪_K`. -/

namespace TauCeti.BreuilKisin

variable (p : ℕ) [hp : Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- R07.4/bk-coefficient-rings: `𝔖 = W(k)⟦u⟧`. -/
abbrev Sfrak : Type u := PowerSeries (WittVector p k)

/-- The Frobenius of `𝔖`: the Witt vector Frobenius on coefficients, then `u ↦ u^p`
(`TauCeti.BreuilKisin.frob`). -/
def frob : Sfrak p k →+* Sfrak p k :=
  (PowerSeries.expand p hp.out.ne_zero).toRingHom.comp (PowerSeries.map WittVector.frobenius)

/-- Test (`frob_X`): `φ(u) = u^p`. -/
theorem frob_X : frob p k PowerSeries.X = PowerSeries.X ^ p := sorry

theorem frob_C (a : WittVector p k) :
    frob p k (PowerSeries.C a) = PowerSeries.C (WittVector.frobenius a) := sorry

/-- An Eisenstein polynomial `E(u) ∈ W(k)[u]` (`TauCeti.BreuilKisin.eisenstein`). -/
structure Eisenstein where
  E : Polynomial (WittVector p k)
  monic : E.Monic
  isEisensteinAt : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)})

/-- Test (`eisenstein_unramified`): for `e = 1` and `π = p`, `E(u) = u - p`. -/
def eisensteinUnramified : Eisenstein p k where
  E := Polynomial.X - Polynomial.C (p : WittVector p k)
  monic := Polynomial.monic_X_sub_C _
  isEisensteinAt := sorry

/-- R07.4/kisin-modules: a finite free `𝔖`-module with a `φ`-semilinear endomorphism whose
linearisation `φ*𝔐 → 𝔐` has cokernel killed by a power of `E(u)`; the image of the
linearisation is the span of `φ(𝔐)`. -/
structure KisinModule (E : Eisenstein p k) where
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (Sfrak p k) M]
  [free : Module.Free (Sfrak p k) M]
  [finite : Module.Finite (Sfrak p k) M]
  phi : M →ₛₗ[frob p k] M
  finiteHeight : ∃ h : ℕ, ∀ m : M,
    ((E.E : Sfrak p k) ^ h) • m ∈ Submodule.span (Sfrak p k) (Set.range phi)

attribute [instance] KisinModule.addCommGroup KisinModule.module KisinModule.free
  KisinModule.finite

variable {p k}

/-- `E(u)^h` kills the cokernel of `1 ⊗ φ`; `BT^φ_{/𝔖}` is `HeightLE 1`. -/
def KisinModule.HeightLE {E : Eisenstein p k} (M : KisinModule p k E) (h : ℕ) : Prop :=
  ∀ m : M.M, ((E.E : Sfrak p k) ^ h) • m ∈ Submodule.span (Sfrak p k) (Set.range M.phi)

/-- Morphisms of Kisin modules: `𝔖`-linear maps commuting with `φ`. -/
structure KisinModule.Hom {E : Eisenstein p k} (M N : KisinModule p k E) where
  toLinearMap : M.M →ₗ[Sfrak p k] N.M
  comm : ∀ m, toLinearMap (M.phi m) = N.phi (toLinearMap m)

/-- The rank-one module `𝔖 e` with `φ(e) = c·e`, for `c ∈ 𝔖`. -/
def KisinModule.rankOne (E : Eisenstein p k) (c : Sfrak p k)
    (hc : ∃ h : ℕ, ∀ m : Sfrak p k, (E.E : Sfrak p k) ^ h * m ∈
      Submodule.span (Sfrak p k) (Set.range fun x : Sfrak p k => c * frob p k x)) :
    KisinModule p k E where
  M := Sfrak p k
  phi := c • (frob p k).toSemilinearMap
  finiteHeight := hc

/-- The unit object `(𝔖, φ)` (`KisinModule.unit`). -/
def KisinModule.unit (E : Eisenstein p k) : KisinModule p k E :=
  KisinModule.rankOne E 1 sorry

/-- Test (`KisinModule.unit_height_zero`): `(𝔖, φ)` has `E`-height `0`. -/
theorem KisinModule.unit_height_zero (E : Eisenstein p k) :
    (KisinModule.unit E).HeightLE 0 := sorry

/-- Test (`KisinModule.eisenstein_height_one`): `𝔖 e` with `φ(e) = E(u) e` has `E`-height `1`
and not `0`. -/
theorem KisinModule.eisenstein_height_one (E : Eisenstein p k) :
    (KisinModule.rankOne E (E.E : Sfrak p k) sorry).HeightLE 1 ∧
      ¬ (KisinModule.rankOne E (E.E : Sfrak p k) sorry).HeightLE 0 := sorry

/-- Test (`KisinModule.not_finite_height`): `φ(e) = p e` has no finite `E`-height, since
`E(u) ≡ u^e` is not nilpotent modulo `p`. -/
theorem KisinModule.not_finite_height (E : Eisenstein p k) :
    ¬ ∃ h : ℕ, ∀ m : Sfrak p k, (E.E : Sfrak p k) ^ h * m ∈
      Submodule.span (Sfrak p k)
        (Set.range fun x : Sfrak p k => (p : Sfrak p k) * frob p k x) := sorry

/-! ### Descent data in weight two (Savitt 2005, §§3–4) -/

/-- R07.4/strongly-divisible-modules-descent-data: semilinear descent data on a module `M`
over a ring `S` on which `Γ = Gal(F/F′)` acts by ring automorphisms `s ↦ ĝ(s)`: bijections
`ĝ : M → M` with `ĝ(s • m) = ĝ(s) • ĝ(m)` and `ĝ₁ ∘ ĝ₂ = (g₁ g₂)^` (Savitt, Definition 3.7).
Compatibility with `Fil`, `φ₁` and `N` is added on the strongly divisible module itself. -/
structure SemilinearDescentData (Γ S M : Type*) [Group Γ] [CommRing S] [AddCommGroup M]
    [Module S M] [MulSemiringAction Γ S] where
  act : Γ → M ≃+ M
  act_smul : ∀ (g : Γ) (s : S) (m : M), act g (s • m) = (g • s) • act g m
  act_mul : ∀ g h : Γ, act (g * h) = (act h).trans (act g)
  act_one : act 1 = AddEquiv.refl M

/-- The cocycle condition in the form `ĝ₁ (ĝ₂ m) = (g₁ g₂)^ m`. -/
theorem SemilinearDescentData.act_mul_apply {Γ S M : Type*} [Group Γ] [CommRing S]
    [AddCommGroup M] [Module S M] [MulSemiringAction Γ S] (D : SemilinearDescentData Γ S M)
    (g h : Γ) (m : M) : D.act (g * h) m = D.act g (D.act h m) := by
  rw [D.act_mul]; rfl

end TauCeti.BreuilKisin

/-! ## R07.5: peu ramifiée Kummer classes over `ℚ_p` -/

namespace TauCeti.FiniteFlat

/-- R07.5/peu-tres-ramifiee and R07.5/peu-ramifie-classes for `K = ℚ_p` and trivial `χ̄`: the
Kummer class of `x ∈ ℚ_p^×` is peu ramifiée exactly when `v_p(x) ≡ 0 mod p`, i.e. when it is
represented by a unit (Serre 1987, (2.4.7); ACC §7.2.1). -/
def IsPeuRamifieeClass (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ) : Prop :=
  (p : ℤ) ∣ Padic.valuation (x : ℚ_[p])

/-- Test (`isPeuRamifiee_of_unit`): the class of a unit is peu ramifiée. -/
theorem isPeuRamifieeClass_of_valuation_eq_zero (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ)
    (hx : Padic.valuation (x : ℚ_[p]) = 0) : IsPeuRamifieeClass p x := by
  simp [IsPeuRamifieeClass, hx]

/-- Test (`peuRamifieH1_uniformiser`): the class of `p` is très ramifiée. -/
theorem not_isPeuRamifieeClass_p (p : ℕ) [Fact p.Prime] :
    ¬ IsPeuRamifieeClass p (Units.mk0 (p : ℚ_[p]) (by exact_mod_cast (Fact.out : p.Prime).ne_zero)) :=
  sorry

/-- The class of `q` for a Tate curve with `p ∣ v(q)` is peu ramifiée
(R07.5/multiplicative-torsion-inertia). -/
theorem isPeuRamifieeClass_pow (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ) :
    IsPeuRamifieeClass p (x ^ p) := sorry

end TauCeti.FiniteFlat

/-! ## R07.2: coefficients — Frobenius-fixed Witt vectors and characteristic polynomials

These two statements make the coefficient recognition used with Dieudonné modules over finite
fields explicit (R07.2/witt-frobenius-fixed-constants, R07.2/semilinear-charpoly-descent). -/

namespace TauCeti.Dieudonne

section Coefficients

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]

/-- The canonical map `ℤ_p ≅ 𝕎(F_p) → 𝕎(k)` induced by `F_p ⊆ k`. -/
def padicConstants : ℤ_[p] →+* WittVector p k :=
  (WittVector.map (ZMod.castHom (dvd_refl p) k)).comp (WittVector.equiv p).symm.toRingHom

/-- R07.2/witt-frobenius-fixed-constants: `ι_k` is injective. -/
theorem padicConstants_injective : Function.Injective (padicConstants p k) := sorry

/-- R07.2/witt-frobenius-fixed-constants: an element of `𝕎(k)` is fixed by the Witt vector
Frobenius iff it is a `p`-adic constant. No finiteness or perfectness of `k` is assumed. -/
theorem frobenius_eq_self_iff (x : WittVector p k) :
    WittVector.frobenius x = x ↔ x ∈ Set.range (padicConstants p k) := sorry

/-- Test: over `k = F_p` every Witt vector is fixed by Frobenius (Mathlib's
`WittVector.frobenius_zmodp`), as the characterisation predicts. -/
example (x : WittVector p (ZMod p)) : WittVector.frobenius x = x :=
  WittVector.frobenius_zmodp p x

/-- R07.2/semilinear-charpoly-descent: if `T` is `σ`-conjugate to itself over
`L = Frac 𝕎(k)`, its characteristic polynomial has coefficients in `ℤ_p`. -/
theorem exists_padic_charpoly [PerfectRing k p] {n : Type*} [Fintype n] [DecidableEq n]
    (T : Matrix n n (WittVector p k)) (B : Matrix n n (FractionRing (WittVector p k)))
    (hB : IsUnit B.det)
    (hT : T.map (algebraMap (WittVector p k) (FractionRing (WittVector p k))) =
      B * T.map (fun x => algebraMap (WittVector p k) (FractionRing (WittVector p k))
        (WittVector.frobenius x)) * B⁻¹) :
    ∃ P : Polynomial ℤ_[p], P.Monic ∧ P.natDegree = Fintype.card n ∧
      P.map (padicConstants p k) = T.charpoly := sorry

/-- Test: the empty matrix has characteristic polynomial `1`, which descends as `1`. -/
example [PerfectRing k p] (T : Matrix (Fin 0) (Fin 0) (WittVector p k)) :
    T.charpoly = (1 : Polynomial ℤ_[p]).map (padicConstants p k) := by
  simp [Matrix.charpoly, Matrix.det_fin_zero]

end Coefficients

end TauCeti.Dieudonne

/-!
## Statements not typed at the pins

The following API items and unit tests of the plan are stated in the roadmap document and the
blueprint packet. Their carriers are not in the pinned libraries in a form that makes the
statements meaningful, so they are listed by name only: `p`-divisible groups and their Tate
modules need multiplication by `n` and exactness of sequences of finite locally free group
schemes (ModularCurves 0B/0C, not at the pin); F-vector schemes need Raynaud's condition (**);
formal Lie groups need the substitution axioms of a formal group law; the Witt group schemes, the
crystals, the period rings (PadicHodgeTheory R06.1), the étale φ-modules and `V_𝔖`, Breuil's
`S`-modules, tame inertia (Tau Ceti LocalFieldsRamification Layer 4), Galois cohomology of local
fields and smooth representations of `GL₂` are likewise not available as carriers.

R07.1:
  TauCeti.FiniteFlat.FVectorScheme, TauCeti.FiniteFlat.FVectorScheme.cartierDual,
  TauCeti.FiniteFlat.FVectorScheme.cartierDual_zModP,
  TauCeti.FiniteFlat.FVectorScheme.not_of_rank,
  TauCeti.FiniteFlat.FVectorScheme.of_generic_char_zero, TauCeti.FiniteFlat.FVectorScheme.rank_eq,
  TauCeti.FiniteFlat.FVectorScheme.supersingular_E_p, TauCeti.FiniteFlat.FVectorScheme.zModP,
  TauCeti.FiniteFlat.FormalLieGroup, TauCeti.FiniteFlat.FormalLieGroup.IsPDivisible,
  TauCeti.FiniteFlat.FormalLieGroup.dim, TauCeti.FiniteFlat.FormalLieGroup.dim_multiplicative,
  TauCeti.FiniteFlat.FormalLieGroup.dim_zero, TauCeti.FiniteFlat.FormalLieGroup.height,
  TauCeti.FiniteFlat.FormalLieGroup.height_elliptic, TauCeti.FiniteFlat.FormalLieGroup.inv,
  TauCeti.FiniteFlat.FormalLieGroup.mulP,
  TauCeti.FiniteFlat.FormalLieGroup.not_isPDivisible_additive, TauCeti.FiniteFlat.PDivisibleGroup,
  TauCeti.FiniteFlat.PDivisibleGroup.Hom, TauCeti.FiniteFlat.PDivisibleGroup.baseChange,
  TauCeti.FiniteFlat.PDivisibleGroup.cartierDual,
  TauCeti.FiniteFlat.PDivisibleGroup.cartierDualDual,
  TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_baseChange,
  TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_constQpZp,
  TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_height,
  TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_levels,
  TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_transition,
  TauCeti.FiniteFlat.PDivisibleGroup.cartierDual_zero,
  TauCeti.FiniteFlat.PDivisibleGroup.constQpZp,
  TauCeti.FiniteFlat.PDivisibleGroup.continuous_galoisAction,
  TauCeti.FiniteFlat.PDivisibleGroup.dim, TauCeti.FiniteFlat.PDivisibleGroup.dim_baseChange,
  TauCeti.FiniteFlat.PDivisibleGroup.dim_constQpZp,
  TauCeti.FiniteFlat.PDivisibleGroup.dim_height_zero,
  TauCeti.FiniteFlat.PDivisibleGroup.dim_le_height,
  TauCeti.FiniteFlat.PDivisibleGroup.dim_muPInfty,
  TauCeti.FiniteFlat.PDivisibleGroup.dim_supersingular, TauCeti.FiniteFlat.PDivisibleGroup.height,
  TauCeti.FiniteFlat.PDivisibleGroup.height_abelianScheme,
  TauCeti.FiniteFlat.PDivisibleGroup.height_constQpZp,
  TauCeti.FiniteFlat.PDivisibleGroup.height_muPInfty,
  TauCeti.FiniteFlat.PDivisibleGroup.height_zero, TauCeti.FiniteFlat.PDivisibleGroup.muPInfty,
  TauCeti.FiniteFlat.PDivisibleGroup.not_of_constant_ZpZ,
  TauCeti.FiniteFlat.PDivisibleGroup.ordinary_nonsplit,
  TauCeti.FiniteFlat.PDivisibleGroup.supersingular_connected,
  TauCeti.FiniteFlat.PDivisibleGroup.tangentSpace, TauCeti.FiniteFlat.PDivisibleGroup.tateModule,
  TauCeti.FiniteFlat.PDivisibleGroup.tateModulePairing,
  TauCeti.FiniteFlat.PDivisibleGroup.tateModule_constQpZp,
  TauCeti.FiniteFlat.PDivisibleGroup.tateModule_free,
  TauCeti.FiniteFlat.PDivisibleGroup.tateModule_height_zero,
  TauCeti.FiniteFlat.PDivisibleGroup.tateModule_map,
  TauCeti.FiniteFlat.PDivisibleGroup.tateModule_muPInfty,
  TauCeti.FiniteFlat.PDivisibleGroup.tateModule_not_direct_limit,
  TauCeti.FiniteFlat.PDivisibleGroup.tateSheaf,
  TauCeti.FiniteFlat.PDivisibleGroup.tateSheaf_exact,
  TauCeti.FiniteFlat.PDivisibleGroup.truncation,
  TauCeti.FiniteFlat.PDivisibleGroup.universalCover,
  TauCeti.FiniteFlat.PDivisibleGroup.universalCover_eq_hom,
  TauCeti.FiniteFlat.PDivisibleGroup.universalCover_etale,
  TauCeti.FiniteFlat.PDivisibleGroup.universalCover_isogeny,
  TauCeti.FiniteFlat.PDivisibleGroup.universalCover_mu,
  TauCeti.FiniteFlat.PDivisibleGroup.universalCover_not_colim,
  TauCeti.FiniteFlat.PDivisibleGroup.universalCover_perfect,
  TauCeti.FiniteFlat.PDivisibleGroup.universalCover_zero,
  TauCeti.FiniteFlat.Prolongation.dyadic_two_models,
  TauCeti.FiniteFlat.Prolongation.exists_max_min, TauCeti.FiniteFlat.Prolongation.inf,
  TauCeti.FiniteFlat.Prolongation.two_models_mu_p,
  TauCeti.FiniteFlat.Prolongation.unique_etale_Zp, TauCeti.FiniteFlat.TruncatedBT,
  TauCeti.FiniteFlat.TruncatedBT.cartierDual, TauCeti.FiniteFlat.TruncatedBT.elliptic,
  TauCeti.FiniteFlat.TruncatedBT.height, TauCeti.FiniteFlat.TruncatedBT.mu,
  TauCeti.FiniteFlat.TruncatedBT.not_Zp2_level1, TauCeti.FiniteFlat.TruncatedBT.not_alpha,
  TauCeti.FiniteFlat.TruncatedBT.of_exact, TauCeti.FiniteFlat.TruncatedBT.restrict,
  TauCeti.FiniteFlat.katzMazur_extension, TauCeti.FiniteFlat.katzMazur_neg_one_two,
  TauCeti.FiniteFlat.katzMazur_not_split, TauCeti.FiniteFlat.katzMazur_one

R07.2:
  TauCeti.Dieudonne.DieudonneRing, TauCeti.Dieudonne.DieudonneRing.F_mul,
  TauCeti.Dieudonne.DieudonneRing.F_mul_V, TauCeti.Dieudonne.DieudonneRing.basis,
  TauCeti.Dieudonne.DieudonneRing.comm_of_Fp, TauCeti.Dieudonne.DieudonneRing.mul_V,
  TauCeti.Dieudonne.DieudonneRing.not_comm, TauCeti.Dieudonne.DieudonneRing.quot_F_V,
  TauCeti.Dieudonne.aNumber, TauCeti.Dieudonne.aNumber_M1, TauCeti.Dieudonne.covariantModule,
  TauCeti.Dieudonne.covariantModule_equiv_dual, TauCeti.Dieudonne.covariantModule_lie,
  TauCeti.Dieudonne.covariantModule_lie_mu, TauCeti.Dieudonne.covariantModule_mu,
  TauCeti.Dieudonne.covariantModule_rank, TauCeti.Dieudonne.covariantModule_slope,
  TauCeti.Dieudonne.covariantModule_zero, TauCeti.Dieudonne.dieudonneModule_F,
  TauCeti.Dieudonne.dieudonneModule_alphaP, TauCeti.Dieudonne.dieudonneModule_muP,
  TauCeti.Dieudonne.dieudonneModule_not_covariant, TauCeti.Dieudonne.dieudonneModule_prod,
  TauCeti.Dieudonne.dieudonneModule_trivial, TauCeti.Dieudonne.dieudonneModule_zmodp,
  TauCeti.Dieudonne.dualModule, TauCeti.Dieudonne.farguesLF,
  TauCeti.Dieudonne.frobeniusHom_naturality, TauCeti.Dieudonne.frobenius_alphaP_zero,
  TauCeti.Dieudonne.frobenius_comp_verschiebung, TauCeti.Dieudonne.frobenius_constZModP_iso,
  TauCeti.Dieudonne.hasseInvariant, TauCeti.Dieudonne.hasseInvariant_baseChange,
  TauCeti.Dieudonne.hasseInvariant_dual, TauCeti.Dieudonne.hasseInvariant_mu,
  TauCeti.Dieudonne.hasseInvariant_supersingular, TauCeti.Dieudonne.hasseInvariant_weight,
  TauCeti.Dieudonne.hasseWitt, TauCeti.Dieudonne.hodgeTateMap_exact,
  TauCeti.Dieudonne.isUnit_hasseInvariant_iff_ordinary, TauCeti.Dieudonne.linearDualModule,
  TauCeti.Dieudonne.linearDual_ne_covariant, TauCeti.Dieudonne.slopeSequence,
  TauCeti.Dieudonne.slopeSequence_baseChange, TauCeti.Dieudonne.slopeSequence_dual,
  TauCeti.Dieudonne.slope_constQpZp, TauCeti.Dieudonne.slope_muPInfty,
  TauCeti.Dieudonne.slope_out_of_range, TauCeti.Dieudonne.slope_supersingular,
  TauCeti.Dieudonne.standardDieudonne, TauCeti.Dieudonne.verschiebungHom_eq_cartierDual,
  TauCeti.Dieudonne.verschiebung_comp_frobenius, TauCeti.Dieudonne.verschiebung_muP_iso,
  TauCeti.Dieudonne.verschiebung_not_inverse, TauCeti.Dieudonne.wittGroup,
  TauCeti.Dieudonne.wittGroupKer, TauCeti.Dieudonne.wittGroupKer_dieudonneAction,
  TauCeti.Dieudonne.wittGroupKer_order, TauCeti.Dieudonne.wittGroupKer_points_zero,
  TauCeti.Dieudonne.wittGroup_exact, TauCeti.Dieudonne.wittGroup_not_constant,
  TauCeti.Dieudonne.wittGroup_one

R07.3:
  TauCeti.FontaineLaffaille.FLModule.isTorsion_iff,
  TauCeti.FontaineLaffaille.FLModule.not_strongly_divisible,
  TauCeti.FontaineLaffaille.FLModule.twist, TauCeti.FontaineLaffaille.FLModule.weights,
  TauCeti.FontaineLaffaille.IsStronglyDivisible,
  TauCeti.FontaineLaffaille.StronglyDivisibleLattice,
  TauCeti.FontaineLaffaille.StronglyDivisibleLattice.toFLModule,
  TauCeti.FontaineLaffaille.exists_stronglyDivisible_iff, TauCeti.FontaineLaffaille.flFunctor,
  TauCeti.FontaineLaffaille.flFunctor_eq_hom, TauCeti.FontaineLaffaille.flFunctor_map,
  TauCeti.FontaineLaffaille.flFunctor_not_covariant, TauCeti.FontaineLaffaille.flFunctor_unit,
  TauCeti.FontaineLaffaille.flFunctor_zero, TauCeti.FontaineLaffaille.ringS,
  TauCeti.FontaineLaffaille.ringS.completion, TauCeti.FontaineLaffaille.ringS.contains_WR,
  TauCeti.FontaineLaffaille.ringS.galoisAction, TauCeti.FontaineLaffaille.ringS.galois_fixed,
  TauCeti.FontaineLaffaille.ringS.not_WR, TauCeti.FontaineLaffaille.ringS.phi_teichmuller,
  TauCeti.FontaineLaffaille.ringS.reduction, TauCeti.FontaineLaffaille.sdl_not_weakly_admissible,
  TauCeti.FontaineLaffaille.sdl_slope_one, TauCeti.FontaineLaffaille.sdl_slope_zero,
  TauCeti.FontaineLaffaille.sdl_zero

R07.4:
  TauCeti.BreuilKisin.BreuilModule, TauCeti.BreuilKisin.BreuilModule.IsMaximal,
  TauCeti.BreuilKisin.BreuilModule.IsMinimal, TauCeti.BreuilKisin.BreuilModule.T0,
  TauCeti.BreuilKisin.BreuilModule.exists_hom_to_maximal,
  TauCeti.BreuilKisin.BreuilModule.fil_quotient_free, TauCeti.BreuilKisin.BreuilModule.frob,
  TauCeti.BreuilKisin.BreuilModule.not_surjective, TauCeti.BreuilKisin.BreuilModule.ofKisin,
  TauCeti.BreuilKisin.BreuilModule.ofKisin_unit, TauCeti.BreuilKisin.BreuilModule.ofPDivisible,
  TauCeti.BreuilKisin.BreuilModule.zero, TauCeti.BreuilKisin.FilteredPhiNModuleDD,
  TauCeti.BreuilKisin.FilteredPhiNModuleDD.IsWeaklyAdmissible,
  TauCeti.BreuilKisin.FilteredPhiNModuleDD.galoisAction,
  TauCeti.BreuilKisin.FilteredPhiNModuleDD.weilDeligne, TauCeti.BreuilKisin.KisinModule.category,
  TauCeti.BreuilKisin.KisinModuleCoeff, TauCeti.BreuilKisin.KisinModuleCoeff.baseChange,
  TauCeti.BreuilKisin.KisinModuleCoeff.coker_projective,
  TauCeti.BreuilKisin.KisinModuleCoeff.dual, TauCeti.BreuilKisin.KisinModuleCoeff.free_of_finite,
  TauCeti.BreuilKisin.OE, TauCeti.BreuilKisin.SUr, TauCeti.BreuilKisin.StronglyDivisibleModule,
  TauCeti.BreuilKisin.StronglyDivisibleModule.descentData,
  TauCeti.BreuilKisin.StronglyDivisibleModule.monodromy,
  TauCeti.BreuilKisin.StronglyDivisibleModule.ofPDivisible,
  TauCeti.BreuilKisin.StronglyDivisibleModule.ofPDivisible_antiequiv,
  TauCeti.BreuilKisin.StronglyDivisibleRModule,
  TauCeti.BreuilKisin.StronglyDivisibleRModule.baseChange,
  TauCeti.BreuilKisin.StronglyDivisibleRModule.exists_of_lattice,
  TauCeti.BreuilKisin.StronglyDivisibleRModule.tst,
  TauCeti.BreuilKisin.StronglyDivisibleRModule.tst_free, TauCeti.BreuilKisin.TorsionKisinModule,
  TauCeti.BreuilKisin.TorsionKisinModule.IsEtale,
  TauCeti.BreuilKisin.TorsionKisinModule.IsMultiplicative,
  TauCeti.BreuilKisin.TorsionKisinModule.zero, TauCeti.BreuilKisin.breuilS,
  TauCeti.BreuilKisin.coeff_zp, TauCeti.BreuilKisin.dst_cyclotomic_teichmuller,
  TauCeti.BreuilKisin.dual_etale_multiplicative, TauCeti.BreuilKisin.eisenstein,
  TauCeti.BreuilKisin.eisenstein_not_isUnit, TauCeti.BreuilKisin.eisenstein_unramified,
  TauCeti.BreuilKisin.galoisType, TauCeti.BreuilKisin.galoisType_principal_series,
  TauCeti.BreuilKisin.minimal_example, TauCeti.BreuilKisin.no_descent_qp,
  TauCeti.BreuilKisin.not_commuting_action, TauCeti.BreuilKisin.not_generating,
  TauCeti.BreuilKisin.not_projective, TauCeti.BreuilKisin.not_strongly_divisible,
  TauCeti.BreuilKisin.rank_one_character, TauCeti.BreuilKisin.rank_one_maximal,
  TauCeti.BreuilKisin.semistable_excluded, TauCeti.BreuilKisin.theta_eisenstein,
  TauCeti.BreuilKisin.toWittR, TauCeti.BreuilKisin.trivial_descent,
  TauCeti.BreuilKisin.tst_rank_one, TauCeti.BreuilKisin.unit_is_object, TauCeti.BreuilKisin.zero,
  TauCeti.BreuilKisin.zp_coefficients

R07.5:
  TauCeti.FiniteFlat.IsPeuRamifiee, TauCeti.FiniteFlat.IsTresRamifiee,
  TauCeti.FiniteFlat.cyclotomic_restrict_ne_one,
  TauCeti.FiniteFlat.cyclotomic_restrict_tameInertia, TauCeti.FiniteFlat.fundamentalCharacter,
  TauCeti.FiniteFlat.fundamentalCharacter_one_surjective,
  TauCeti.FiniteFlat.fundamentalCharacter_pow_p, TauCeti.FiniteFlat.fundamentalCharacter_two_norm,
  TauCeti.FiniteFlat.isPeuRamifiee_iff_valuation, TauCeti.FiniteFlat.isPeuRamifiee_of_unit,
  TauCeti.FiniteFlat.isPeuRamifiee_sqrt_neg_one, TauCeti.FiniteFlat.isTresRamifiee_sqrt_two,
  TauCeti.FiniteFlat.kummerSubgroup, TauCeti.FiniteFlat.not_extension_sensitive,
  TauCeti.FiniteFlat.peuRamifieH1, TauCeti.FiniteFlat.peuRamifieH1Int,
  TauCeti.FiniteFlat.peuRamifieH1_Ql_finrank, TauCeti.FiniteFlat.peuRamifieH1_eq_top,
  TauCeti.FiniteFlat.peuRamifieH1_iff_isPeuRamifiee, TauCeti.FiniteFlat.peuRamifieH1_nontrivial,
  TauCeti.FiniteFlat.peuRamifieH1_quotient, TauCeti.FiniteFlat.peuRamifieH1_uniformiser,
  TauCeti.FiniteFlat.peuRamifieH1_unit, TauCeti.FiniteFlat.tameInertia,
  TauCeti.FiniteFlat.tameInertiaIso, TauCeti.FiniteFlat.tameInertiaIso_eq_inertiaTameCharacter,
  TauCeti.FiniteFlat.tate_curve_tres, TauCeti.FiniteFlat.theta_one,
  TauCeti.SerreWeights.SerreWeight, TauCeti.SerreWeights.SerreWeight.sym,
  TauCeti.SerreWeights.compactInduction, TauCeti.SerreWeights.compactInduction_free,
  TauCeti.SerreWeights.compactInduction_frobenius, TauCeti.SerreWeights.endEquivPolynomial,
  TauCeti.SerreWeights.heckeOperatorT, TauCeti.SerreWeights.not_finite_dim,
  TauCeti.SerreWeights.sym_dim, TauCeti.SerreWeights.trivial_length_two

R07.6:
  TauCeti.FiniteFlat.cyclotomic_upper_break, TauCeti.FiniteFlat.fontaineLowerIndex,
  TauCeti.FiniteFlat.fontaineUpper, TauCeti.FiniteFlat.fontaineUpperBreak,
  TauCeti.FiniteFlat.fontaineUpper_eq_serreUpper, TauCeti.FiniteFlat.shift_non_example,
  TauCeti.FiniteFlat.tame_upper_break, TauCeti.FiniteFlat.unramified,
  TauCeti.FiniteFlat.valuation_different_eq

-/
