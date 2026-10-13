import Mathlib
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange

/-!
# Finite flat group schemes and integral p-adic Hodge theory: representative target signatures

The roadmap is `README.md`. This file records definitions and theorem signatures that can already
be stated against the pinned Mathlib and Tau Ceti; it is not an exhaustive list of the targets of
any layer, and the statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every theorem is proved by `sorry`.

The design choices made explicit here:

* A finite flat group over an affine base `Spec R` is an object of Tau Ceti's
  `FiniteLocallyFreeCommAffineGroupSchemeCat`. Its order is the rank of its coordinate Hopf algebra,
  it is étale when that algebra is étale, of multiplicative type when its Cartier dual is étale, and
  connected over a local base when the algebra is local.
* A finite flat model of a generic group is a `Prolongation`: a model together with an isomorphism
  of its generic fibre, ordered by domination.
* Dieudonné modules are contravariant: a Dieudonné module over a perfect field `k` is a
  `W(k)`-module with a `σ`-linear `F` and a `σ⁻¹`-linear `V` such that `FV = VF = p`, and
  `M(ℚ_p/ℤ_p) = (W(k), F = σ)`, `M(μ_{p^∞}) = (W(k), F = pσ)`.
* Filtered `(φ, N)`-modules live over `K₀ = Frac W(k)` with the filtration on `K ⊗_{K₀} D`, and
  Fontaine–Laffaille modules are filtered `W(k)`-modules with divided Frobenii `φ^i`.
* Breuil–Kisin modules live over `𝔖 = W(k)⟦u⟧` with `φ` the Witt vector Frobenius on coefficients
  and `u ↦ u^p`, and an Eisenstein polynomial `E(u)`.
* Peu ramifiée Kummer classes over `ℚ_p` are those of `p`-adic valuation divisible by `p`.

Heavy objects (`p`-divisible groups beyond Tau Ceti's finite levels, Frobenius and Verschiebung,
the Dieudonné module functor itself, Raynaud's `F`-vector schemes, the Oort–Tate and Katz–Mazur
groups, period rings, the Robba ring, tame inertia and its fundamental characters, the
Fontaine–Laffaille functor, Breuil's `S`-modules and the ramification filtration in Fontaine's
normalisation) are README targets and do not appear here; the closing comment lists them.
-/

set_option linter.overlappingInstances false

noncomputable section

open CategoryTheory Opposite

universe u

namespace TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

namespace FiniteFlat

open TauCeti

/-- Finite locally free commutative group schemes over `Spec R` (Tau Ceti). -/
abbrev FLF (R : Type u) [CommRing R] :=
  FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

/-! ## Layer R07.1: finite flat group schemes and `p`-divisible groups -/

section Basic

variable {R : Type u} [CommRing R]

/-- The coordinate Hopf algebra `A` of `G = Spec A`. -/
abbrev coord (G : FLF R) := FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G

/-- The order of `G`: the rank of its coordinate algebra. Over a local base, where the algebra is
free, this is the order; over a general base the README uses the locally constant rank. -/
def rank (G : FLF R) : ℕ := Module.finrank R (coord G)

/-- `G` is étale: its coordinate algebra is étale over `R`. -/
def IsEtale (G : FLF R) : Prop := Algebra.Etale R (coord G)

/-- `G` is of multiplicative type: its Cartier dual is étale. -/
def IsMultiplicative (G : FLF R) : Prop :=
  IsEtale (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G)

/-- Over a local base, `G` is connected exactly when its finite coordinate algebra is local. -/
def IsConnectedLocal (G : FLF R) : Prop := IsLocalRing (coord G)

/-- Cartier biduality (Tau Ceti, at the pin). -/
example (G : FLF R) :
    FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R
      (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G) ≅ G :=
  (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualDualIso R G).symm

/-- Cartier duality preserves the order (the finite-level case of the duality of Layer R07.1). Over
a local base the coordinate algebra is free, so the order is its rank. -/
theorem rank_cartierDual [IsLocalRing R] (G : FLF R) :
    rank (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G) = rank G := sorry

/-- `G` is multiplicative exactly when its Cartier dual is étale, and étale exactly when its dual
is multiplicative (biduality). -/
theorem isMultiplicative_cartierDual_iff (G : FLF R) :
    IsMultiplicative (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G) ↔ IsEtale G :=
  sorry

/-- A finite flat group whose order is invertible on the base is étale (Layer R07.1, finite étale
groups as Galois modules; Stix, Theorem 34). -/
theorem isEtale_of_isUnit_rank (G : FLF R) (h : IsUnit (rank G : R)) : IsEtale G := sorry

/-- Over a local base, a group that is both étale and connected is trivial: the connected–étale
dichotomy at the level of coordinate algebras. -/
theorem rank_eq_one_of_isEtale_of_isConnectedLocal [IsLocalRing R] (G : FLF R)
    (he : IsEtale G) (hc : IsConnectedLocal G) : rank G = 1 := sorry

variable (K : Type u) [Field K] [Algebra R K]

/-- The generic fibre `G ⊗_R K`. -/
def genericFibre (G : FLF R) : FLF K :=
  (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).obj G

/-- Base change preserves the order (over a local base, where the coordinate algebra is free). -/
theorem rank_genericFibre [IsLocalRing R] (G : FLF R) : rank (genericFibre K G) = rank G := sorry

end Basic

/-! ### Closures and finite flat models -/

section Models

variable {R : Type u} [CommRing R] [IsDomain R] (K : Type u) [Field K] [Algebra R K]
  [IsFractionRing R K]

/-- Schematic closure over a Dedekind domain: a closed subgroup of the generic fibre is the generic
fibre of a closed flat subgroup (Raynaud, §2.1). -/
theorem schematicClosure_flat [IsDedekindDomain R] (G : FLF R) (H : FLF K)
    (ι : H ⟶ genericFibre K G) [Mono ι] :
    ∃ (𝓗 : FLF R) (j : 𝓗 ⟶ G), Mono j ∧ Nonempty (genericFibre K 𝓗 ≅ H) := sorry

/-- A finite flat model (prolongation) of a finite commutative `K`-group `G`. -/
structure Prolongation (G : FLF K) where
  /-- The finite flat model over `R`. -/
  model : FLF R
  /-- The identification of its generic fibre with `G`. -/
  iso : genericFibre K model ≅ G

namespace Prolongation

variable {K} {G : FLF K}

/-- `𝓖 ≥ 𝓖'`: the identity of `G` extends to an `R`-morphism `𝓖 → 𝓖'`. -/
def Dominates (𝓖 𝓖' : Prolongation (R := R) K G) : Prop :=
  ∃ f : 𝓖.model ⟶ 𝓖'.model,
    (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map f ≫ 𝓖'.iso.hom =
      𝓖.iso.hom

omit [IsDomain R] [IsFractionRing R K] in
/-- Every model dominates itself, through the identity. -/
theorem self (𝓖 : Prolongation (R := R) K G) : 𝓖.Dominates 𝓖 :=
  ⟨𝟙 _, by rw [CategoryTheory.Functor.map_id]; exact Category.id_comp _⟩

/-- The dominating morphism is unique (the ring of a model embeds in that of its generic fibre). -/
theorem dominates_unique {𝓖 𝓖' : Prolongation (R := R) K G} (f g : 𝓖.model ⟶ 𝓖'.model)
    (hf : (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map f ≫ 𝓖'.iso.hom =
      𝓖.iso.hom)
    (hg : (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map g ≫ 𝓖'.iso.hom =
      𝓖.iso.hom) : f = g := sorry

end Prolongation

/-- The absolute ramification index `e = v(p)` of a discrete valuation ring. -/
def absRamificationIndex (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (p : ℕ) : ℕ :=
  (IsDiscreteValuationRing.addVal R (p : R)).toNat

/-- `e(ℤ_p) = 1`. -/
example (p : ℕ) [Fact p.Prime] : absRamificationIndex ℤ_[p] p = 1 := sorry

/-- Raynaud's uniqueness theorem (Théorème 3.3.3): if `e < p − 1`, a finite commutative `K`-group
of `p`-power order has at most one finite flat model. The milestone of the models part of
Layer R07.1. -/
theorem prolongation_unique_of_lt [IsDiscreteValuationRing R] [CharZero K] (p : ℕ)
    [Fact p.Prime] (he : absRamificationIndex R p < p - 1) (G : FLF K)
    (hG : ∃ n, rank G = p ^ n) (𝓖 𝓖' : Prolongation (R := R) K G) :
    Nonempty (𝓖.model ≅ 𝓖'.model) := sorry

/-- Raynaud, Corollaire 3.3.6: full faithfulness of the generic fibre for `e < p − 1`. -/
theorem genericFibre_map_bijective [IsDiscreteValuationRing R] [CharZero K] (p : ℕ)
    [Fact p.Prime] (he : absRamificationIndex R p < p - 1) (𝓖 𝓗 : FLF R)
    (h𝓖 : ∃ n, rank 𝓖 = p ^ n) (h𝓗 : ∃ n, rank 𝓗 = p ^ n) :
    Function.Bijective
      ((FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map (X := 𝓖) (Y := 𝓗)) :=
  sorry

end Models

/-- Groups of prime order over `ℤ_p` (Oort–Tate): since `v(w_p) = 1`, one of the Oort–Tate
parameters is a unit, so the group is étale or multiplicative. -/
theorem isEtale_or_isMultiplicative_of_rank_eq (p : ℕ) [Fact p.Prime] (G : FLF ℤ_[p])
    (hG : rank G = p) : IsEtale G ∨ IsMultiplicative G := sorry

end FiniteFlat

/-! ## Layer R07.2: Dieudonné theory -/

namespace Dieudonne

open FiniteFlat TauCeti

section

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- A Dieudonné module over `k`: a `W(k)`-module with a `σ`-linear `F`, a `σ⁻¹`-linear `V` and
`F V = V F = p`; equivalently a left module over the Dieudonné ring `W(k)[F, V]`. -/
structure DieudonneModule where
  /-- The underlying `W(k)`-module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (WittVector p k) M]
  /-- The Frobenius, `σ`-linear. -/
  F : M →+ M
  /-- The Verschiebung, `σ⁻¹`-linear. -/
  V : M →+ M
  F_smul : ∀ (a : WittVector p k) (x : M), F (a • x) = WittVector.frobenius a • F x
  V_smul : ∀ (a : WittVector p k) (x : M), V (WittVector.frobenius a • x) = a • V x
  F_V : ∀ x, F (V x) = (p : WittVector p k) • x
  V_F : ∀ x, V (F x) = (p : WittVector p k) • x

attribute [instance] DieudonneModule.addCommGroup DieudonneModule.module

namespace DieudonneModule

variable {p k}

/-- Morphisms of Dieudonné modules: `W(k)`-linear maps commuting with `F` and `V`. -/
@[ext]
structure Hom (M N : DieudonneModule p k) where
  /-- The underlying linear map. -/
  toLinearMap : M.M →ₗ[WittVector p k] N.M
  comm_F : ∀ x, toLinearMap (M.F x) = N.F (toLinearMap x)
  comm_V : ∀ x, toLinearMap (M.V x) = N.V (toLinearMap x)

instance : Category (DieudonneModule p k) where
  Hom := Hom
  id M := ⟨LinearMap.id, fun _ => rfl, fun _ => rfl⟩
  comp f g := ⟨g.toLinearMap.comp f.toLinearMap, fun x => by simp [f.comm_F, g.comm_F],
    fun x => by simp [f.comm_V, g.comm_V]⟩

variable (p k)

/-- The zero module, the Dieudonné module of the trivial group. -/
def zero : DieudonneModule p k where
  M := PUnit
  F := 0
  V := 0
  F_smul _ _ := Subsingleton.elim _ _
  V_smul _ _ := Subsingleton.elim _ _
  F_V _ := Subsingleton.elim _ _
  V_F _ := Subsingleton.elim _ _

/-- `M(ℚ_p/ℤ_p) = W(k)` with `F = σ` and `V = p σ⁻¹` (contravariant convention). -/
def qpZp : DieudonneModule p k where
  M := WittVector p k
  F := (WittVector.frobenius : WittVector p k →+* WittVector p k).toAddMonoidHom
  V := (p : WittVector p k) • ((WittVector.frobeniusEquiv p k).symm.toRingHom.toAddMonoidHom)
  F_smul a x := by simp [smul_eq_mul]
  V_smul a x := sorry
  F_V x := sorry
  V_F x := sorry

/-- `M(μ_{p^∞}) = W(k)` with `F = p σ` and `V = σ⁻¹`. -/
def muPInfty : DieudonneModule p k where
  M := WittVector p k
  F := (p : WittVector p k) •
    (WittVector.frobenius : WittVector p k →+* WittVector p k).toAddMonoidHom
  V := (WittVector.frobeniusEquiv p k).symm.toRingHom.toAddMonoidHom
  F_smul a x := sorry
  V_smul a x := sorry
  F_V x := sorry
  V_F x := sorry

/-- The image of `F`, a `W(k)`-submodule because `σ` is surjective on `W(k)` for perfect `k`. -/
def imageF (M : DieudonneModule p k) : Submodule (WittVector p k) M.M :=
  Submodule.span (WittVector p k) (Set.range M.F)

/-- For perfect `k` the span of the image of `F` is the image itself. -/
theorem coe_imageF (M : DieudonneModule p k) : (imageF p k M : Set M.M) = Set.range M.F := sorry

/-- Test: on `M(ℚ_p/ℤ_p)` the Frobenius is bijective (slope `0`, étale). -/
theorem qpZp_F_bijective : Function.Bijective (qpZp p k).F := sorry

/-- Test: on `M(μ_{p^∞})` the Frobenius is not surjective (slope `1`, multiplicative); a covariant
convention would swap this test with the previous one. -/
theorem muPInfty_F_not_surjective : ¬ Function.Surjective (muPInfty p k).F := sorry

/-- Test: `M/FM` has length `dim G`: it is `0` for `ℚ_p/ℤ_p` and `1` for `μ_{p^∞}`. -/
theorem muPInfty_imageF_ne_top : imageF p k (muPInfty p k) ≠ ⊤ := sorry

end DieudonneModule

/-- The Frobenius twist `G^{(p)} = G ×_{k, Frob} k`. -/
def frobeniusTwist (G : FLF k) : FLF k :=
  letI : Algebra k k := (frobenius k p).toAlgebra
  (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor k k).obj G

/-- Finite commutative group schemes of `p`-power order over `k`. -/
abbrev PGroup := ObjectProperty.FullSubcategory (fun G : FLF k => ∃ n, rank G = p ^ n)

/-- The Dieudonné classification of finite commutative `p`-group schemes over a perfect field
(Pink, Theorem 28.3): a fully faithful contravariant functor to Dieudonné modules, with
`length M(G) = log_p |G|` and with `G` étale exactly when `F` is bijective on `M(G)`. Its essential
image is the modules of finite length. The milestone of Layer R07.2 at finite level. -/
theorem dieudonneEquivalenceFinite :
    ∃ Mfun : (PGroup p k)ᵒᵖ ⥤ DieudonneModule p k,
      Mfun.Full ∧ Mfun.Faithful ∧
      (∀ (G : PGroup p k) (n : ℕ), rank G.obj = p ^ n →
        Module.length (WittVector p k) (Mfun.obj (op G)).M = n) ∧
      (∀ G : PGroup p k, IsEtale G.obj ↔ Function.Bijective (Mfun.obj (op G)).F) ∧
      (∀ M : DieudonneModule p k, Module.length (WittVector p k) M.M < ⊤ →
        ∃ G : PGroup p k, Nonempty (Mfun.obj (op G) ≅ M)) := sorry

end

section Coefficients

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]

/-- The canonical map `ℤ_p ≅ W(F_p) → W(k)` induced by `F_p ⊆ k`. -/
def padicConstants : ℤ_[p] →+* WittVector p k :=
  (WittVector.map (ZMod.castHom (dvd_refl p) k)).comp (WittVector.equiv p).symm.toRingHom

/-- The `p`-adic constants embed in `W(k)`. -/
theorem padicConstants_injective : Function.Injective (padicConstants p k) := sorry

/-- An element of `W(k)` is fixed by the Witt vector Frobenius iff it is a `p`-adic constant. No
finiteness or perfectness of `k` is assumed. -/
theorem frobenius_eq_self_iff (x : WittVector p k) :
    WittVector.frobenius x = x ↔ x ∈ Set.range (padicConstants p k) := sorry

/-- Test: over `k = F_p` every Witt vector is fixed by Frobenius (Mathlib's
`WittVector.frobenius_zmodp`), as the characterisation predicts. -/
example (x : WittVector p (ZMod p)) : WittVector.frobenius x = x :=
  WittVector.frobenius_zmodp p x

/-- If `T` is `σ`-conjugate to itself over `Frac W(k)`, its characteristic polynomial has
coefficients in `ℤ_p`. -/
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

end Dieudonne

/-! ## Layer R07.3: filtered `(φ, N)`-modules and Fontaine–Laffaille theory -/

namespace FontaineLaffaille

section Filtered

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
  (K : Type u) [Field K] [Algebra (FractionRing (WittVector p k)) K]

/-- A filtered `(φ, N)`-module over `K`: a finite-dimensional `K₀`-space with a bijective
`σ`-semilinear `φ`, a linear `N` with `N φ = p φ N`, and an exhaustive separated decreasing
filtration of `K ⊗_{K₀} D` by `K`-subspaces, with no condition linking it to `φ` or `N`. -/
structure FilteredPhiNModule where
  /-- The underlying `K₀`-vector space. -/
  D : Type u
  [addCommGroup : AddCommGroup D]
  [module : Module (FractionRing (WittVector p k)) D]
  [finiteDimensional : FiniteDimensional (FractionRing (WittVector p k)) D]
  /-- The Frobenius, a `σ`-semilinear bijection. -/
  phi : D →+ D
  phi_smul : ∀ (a : FractionRing (WittVector p k)) (x : D),
    phi (a • x) = WittVector.FractionRing.frobenius p k a • phi x
  phi_bijective : Function.Bijective phi
  /-- The monodromy. -/
  N : D →ₗ[FractionRing (WittVector p k)] D
  N_phi : ∀ x, N (phi x) = (p : FractionRing (WittVector p k)) • phi (N x)
  /-- The Hodge filtration of `K ⊗_{K₀} D`. -/
  fil : ℤ → Submodule K (TensorProduct (FractionRing (WittVector p k)) K D)
  fil_antitone : Antitone fil
  fil_exhaustive : ∃ a, fil a = ⊤
  fil_separated : ∃ b, fil b = ⊥

attribute [instance] FilteredPhiNModule.addCommGroup FilteredPhiNModule.module
  FilteredPhiNModule.finiteDimensional

variable {p k K}

/-- `D` is effective when `Fil⁰ = K ⊗ D`. -/
def FilteredPhiNModule.IsEffective (D : FilteredPhiNModule p k K) : Prop := D.fil 0 = ⊤

/-- The Hodge number `t_H(D) = Σ_i i · dim_K gr^i`. -/
def FilteredPhiNModule.tH (D : FilteredPhiNModule p k K) : ℤ :=
  ∑ᶠ i : ℤ, i * ((Module.finrank K (D.fil i) : ℤ) - Module.finrank K (D.fil (i + 1)))

end Filtered

section FL

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- A Fontaine–Laffaille filtered module over `W(k)`: a decreasing filtration indexed by `ℤ` with
`σ`-semilinear `φ^i : Fil^i → M` and `φ^i = p φ^{i+1}` on `Fil^{i+1}`. -/
structure FLModule where
  /-- The underlying `W(k)`-module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (WittVector p k) M]
  /-- The filtration. -/
  fil : ℤ → Submodule (WittVector p k) M
  fil_antitone : Antitone fil
  fil_exhaustive : ∃ a, fil a = ⊤
  fil_separated : ∃ b, fil b = ⊥
  /-- The divided Frobenii. -/
  phi : ∀ i, fil i →ₛₗ[(WittVector.frobenius : WittVector p k →+* WittVector p k)] M
  phi_succ : ∀ (i : ℤ) (x : fil (i + 1)),
    phi i ⟨x, fil_antitone (by omega : i ≤ i + 1) x.2⟩ = (p : WittVector p k) • phi (i + 1) x

attribute [instance] FLModule.addCommGroup FLModule.module

variable {p k}

/-- `M ∈ MF_tor`: finite length and `Σ φ^i(Fil^i) = M`. -/
def FLModule.IsTorsion (M : FLModule p k) : Prop :=
  Module.length (WittVector p k) M.M < ⊤ ∧
    (⨆ i, AddMonoidHom.range (M.phi i).toAddMonoidHom) = (⊤ : AddSubgroup M.M)

/-- `M ∈ MF_tor^{[a,b]}`: moreover `Fil^a = M` and `Fil^{b+1} = 0`. -/
def FLModule.IsTorsionIn (M : FLModule p k) (a b : ℤ) : Prop :=
  M.IsTorsion ∧ M.fil a = ⊤ ∧ M.fil (b + 1) = ⊥

/-- Morphisms of Fontaine–Laffaille modules: linear maps preserving the filtration and commuting
with every `φ^i`. -/
structure FLModule.Hom (M N : FLModule p k) where
  /-- The underlying linear map. -/
  toLinearMap : M.M →ₗ[WittVector p k] N.M
  map_fil : ∀ i, (M.fil i).map toLinearMap ≤ N.fil i
  comm_phi : ∀ i (x : M.fil i), toLinearMap (M.phi i x) =
    N.phi i ⟨toLinearMap x, map_fil i ⟨x, x.2, rfl⟩⟩

variable (p k)

/-- The zero module, which lies in every `MF_tor^{[a,b]}`. -/
def FLModule.zero : FLModule p k where
  M := PUnit
  fil _ := ⊥
  fil_antitone _ _ _ := le_rfl
  fil_exhaustive := ⟨0, Subsingleton.elim _ _⟩
  fil_separated := ⟨0, rfl⟩
  phi _ := 0
  phi_succ _ _ := Subsingleton.elim _ _

/-- Test: the zero module lies in every range. -/
theorem FLModule.zero_isTorsionIn (a b : ℤ) : (FLModule.zero p k).IsTorsionIn a b := sorry

variable {p k}

/-- Test: with all `φ^i = 0` the generation condition fails, so a nonzero filtered module with zero
Frobenius is not in `MF_tor`. -/
theorem FLModule.not_isTorsion_of_phi_eq_zero (M : FLModule p k) [Nontrivial M.M]
    (h : ∀ i (x : M.fil i), M.phi i x = 0) : ¬ M.IsTorsion := sorry

end FL

end FontaineLaffaille

/-! ## Layer R07.4: Breuil–Kisin modules -/

namespace BreuilKisin

variable (p : ℕ) [hp : Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- `𝔖 = W(k)⟦u⟧`. -/
abbrev Sfrak : Type u := PowerSeries (WittVector p k)

/-- The Frobenius of `𝔖`: the Witt vector Frobenius on coefficients, then `u ↦ u^p`. -/
def frob : Sfrak p k →+* Sfrak p k :=
  (PowerSeries.expand p hp.out.ne_zero).toRingHom.comp (PowerSeries.map WittVector.frobenius)

/-- Test: `φ(u) = u^p`. -/
theorem frob_X : frob p k PowerSeries.X = PowerSeries.X ^ p := sorry

/-- Test: `φ` is the Witt vector Frobenius on constants. -/
theorem frob_C (a : WittVector p k) :
    frob p k (PowerSeries.C a) = PowerSeries.C (WittVector.frobenius a) := sorry

/-- An Eisenstein polynomial `E(u) ∈ W(k)[u]` (of a uniformiser of a totally ramified `K/K₀`). -/
structure Eisenstein where
  /-- The polynomial. -/
  E : Polynomial (WittVector p k)
  monic : E.Monic
  isEisensteinAt : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)})

/-- For `e = 1` and `π = p`, `E(u) = u − p`. -/
def eisensteinUnramified : Eisenstein p k where
  E := Polynomial.X - Polynomial.C (p : WittVector p k)
  monic := Polynomial.monic_X_sub_C _
  isEisensteinAt := sorry

/-- A Kisin module of finite `E`-height: a finite free `𝔖`-module with a `φ`-semilinear
endomorphism whose linearisation has cokernel killed by a power of `E(u)`; the image of the
linearisation is the span of `φ(𝔐)`. -/
structure KisinModule (E : Eisenstein p k) where
  /-- The underlying `𝔖`-module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (Sfrak p k) M]
  [free : Module.Free (Sfrak p k) M]
  [finite : Module.Finite (Sfrak p k) M]
  /-- The Frobenius. -/
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
  /-- The underlying linear map. -/
  toLinearMap : M.M →ₗ[Sfrak p k] N.M
  comm : ∀ m, toLinearMap (M.phi m) = N.phi (toLinearMap m)

/-- The rank-one module `𝔖 e` with `φ(e) = c·e`, for `c ∈ 𝔖` of finite `E`-height. -/
def KisinModule.rankOne (E : Eisenstein p k) (c : Sfrak p k)
    (hc : ∃ h : ℕ, ∀ m : Sfrak p k, (E.E : Sfrak p k) ^ h * m ∈
      Submodule.span (Sfrak p k) (Set.range fun x : Sfrak p k => c * frob p k x)) :
    KisinModule p k E where
  M := Sfrak p k
  phi := c • (frob p k).toSemilinearMap
  finiteHeight := hc

/-- The unit object `(𝔖, φ)`: `φ(1) = 1`, so the span of the image of `φ` is everything. -/
def KisinModule.unit (E : Eisenstein p k) : KisinModule p k E :=
  KisinModule.rankOne E 1 ⟨0, fun m => by
    have h1 : (1 : Sfrak p k) ∈ Set.range fun x : Sfrak p k => 1 * frob p k x :=
      ⟨1, by simp⟩
    simpa using Submodule.smul_mem _ m (Submodule.subset_span h1)⟩

/-- Test: `(𝔖, φ)` has `E`-height `0`. -/
theorem KisinModule.unit_height_zero (E : Eisenstein p k) :
    (KisinModule.unit E).HeightLE 0 := sorry

/-- Test: `𝔖 e` with `φ(e) = E(u) e` has `E`-height `1` and not `0`. -/
theorem KisinModule.eisenstein_height_one (E : Eisenstein p k)
    (hE : ∃ h : ℕ, ∀ m : Sfrak p k, (E.E : Sfrak p k) ^ h * m ∈
      Submodule.span (Sfrak p k)
        (Set.range fun x : Sfrak p k => (E.E : Sfrak p k) * frob p k x)) :
    (KisinModule.rankOne E (E.E : Sfrak p k) hE).HeightLE 1 ∧
      ¬ (KisinModule.rankOne E (E.E : Sfrak p k) hE).HeightLE 0 := sorry

/-- Test: `φ(e) = p e` has no finite `E`-height, since `E(u) ≡ u^e` is not nilpotent modulo `p`. -/
theorem KisinModule.not_finite_height (E : Eisenstein p k) :
    ¬ ∃ h : ℕ, ∀ m : Sfrak p k, (E.E : Sfrak p k) ^ h * m ∈
      Submodule.span (Sfrak p k)
        (Set.range fun x : Sfrak p k => (p : Sfrak p k) * frob p k x) := sorry

/-- Semilinear descent data on a module `M` over a ring `S` on which `Γ = Gal(F/F′)` acts by ring
automorphisms: bijections `ĝ` with `ĝ(s m) = ĝ(s) ĝ(m)` and `ĝ₁ ∘ ĝ₂ = (g₁ g₂)^` (Savitt,
Definition 3.7). Compatibility with the filtration, `φ₁` and `N` is imposed on the strongly
divisible module itself. -/
structure SemilinearDescentData (Γ S M : Type*) [Group Γ] [CommRing S] [AddCommGroup M]
    [Module S M] [MulSemiringAction Γ S] where
  /-- The action. -/
  act : Γ → M ≃+ M
  act_smul : ∀ (g : Γ) (s : S) (m : M), act g (s • m) = (g • s) • act g m
  act_mul : ∀ g h : Γ, act (g * h) = (act h).trans (act g)
  act_one : act 1 = AddEquiv.refl M

/-- The cocycle condition in the form `ĝ₁ (ĝ₂ m) = (g₁ g₂)^ m`. -/
theorem SemilinearDescentData.act_mul_apply {Γ S M : Type*} [Group Γ] [CommRing S]
    [AddCommGroup M] [Module S M] [MulSemiringAction Γ S] (D : SemilinearDescentData Γ S M)
    (g h : Γ) (m : M) : D.act (g * h) m = D.act g (D.act h m) := by
  rw [D.act_mul]; rfl

end BreuilKisin

/-! ## Layer R07.5: local residual types -/

namespace FiniteFlat

/-- The Kummer class of `x ∈ ℚ_p^×` is peu ramifiée exactly when `v_p(x) ≡ 0 mod p`, i.e. when it is
represented by a unit (Serre 1987, (2.4.7); the case `L = ℚ_p`, `χ̄ = 1` of the peu ramifié
classes). -/
def IsPeuRamifieeClass (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ) : Prop :=
  (p : ℤ) ∣ Padic.valuation (x : ℚ_[p])

/-- Test: the class of a unit is peu ramifiée. -/
theorem isPeuRamifieeClass_of_valuation_eq_zero (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ)
    (hx : Padic.valuation (x : ℚ_[p]) = 0) : IsPeuRamifieeClass p x := by
  simp [IsPeuRamifieeClass, hx]

/-- Test: the class of `p` is très ramifiée. -/
theorem not_isPeuRamifieeClass_p (p : ℕ) [Fact p.Prime] :
    ¬ IsPeuRamifieeClass p
      (Units.mk0 (p : ℚ_[p]) (by exact_mod_cast (Fact.out : p.Prime).ne_zero)) := sorry

/-- Test: `p`-th powers are peu ramifiée; for a Tate curve with `p ∣ v(q)` the torsion `E[p]` is
peu ramifiée. -/
theorem isPeuRamifieeClass_pow (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ) :
    IsPeuRamifieeClass p (x ^ p) := sorry

end FiniteFlat

namespace SerreWeights

/-- Labels `(r, s)` of the Serre weights `Sym^r ⊗ det^s` of `GL₂(F_p)`, with `0 ≤ r ≤ p − 1` and
`s` modulo `p − 1`. -/
abbrev Label (p : ℕ) := Fin p × Fin (p - 1)

/-- Test: there are `p (p − 1)` Serre weights of `GL₂(F_p)`. -/
theorem card_label (p : ℕ) : Fintype.card (Label p) = p * (p - 1) := by
  simp [Label]

/-- Test: `Sym^r F_p²` has dimension `r + 1`, so the weights are told apart by dimension and
determinant. -/
theorem finrank_sym (p : ℕ) [Fact p.Prime] (r : ℕ) :
    Module.finrank (ZMod p) (MvPolynomial.homogeneousSubmodule (Fin 2) (ZMod p) r) = r + 1 := sorry

end SerreWeights

/-!
## Statements not typed at the pins

The README states the following targets; their carriers are not in the pinned libraries, so they
appear only there.

* Layer R07.1: Frobenius and Verschiebung (`frobeniusHom`, `verschiebungHom`); finite étale groups
  as `π₁`-modules (`etaleGroupEquivContAction`); `finitePart`; `multiplicativeTypeRigidity`;
  `p`-divisible groups beyond the finite levels (`BarsottiTate.Hom`, `BarsottiTate.muPInfty`,
  `BarsottiTate.constQpZp`, `BarsottiTate.exact_levels`, `BarsottiTate.cartierDual_levels`,
  `BarsottiTate.tateModule`, `BarsottiTate.connectedEtale_exact`); `TruncatedBT` and
  `btNRecognition`; `FormalLieGroup`, `BarsottiTate.equivFormalLieGroup`, `BarsottiTate.dim`,
  `BarsottiTate.dim_add_dim_cartierDual`, `BarsottiTate.discr_level`, `invariantDifferentialsAndAbsoluteDifferent`;
  `tateSen`; `BarsottiTate.hodgeTate`; `BarsottiTate.exists_of_tateModule_summand`, `BarsottiTate.extend_genericFibre`;
  `isSimple_killed_by_prime`; `Prolongation.sup`, `Prolongation.inf`,
  `BarsottiTate.exists_extension_of_levels`; `tameInertiaIso`, `fundamentalCharacter`; `FVectorScheme` and
  `FVectorScheme.classification`; `exists_fVector_composition`; `prolongation_boundary`;
  `tameInertia_exponents_le`; `raynaudDeterminantTameDifferent`; `oortTate_classification`,
  `oortTate_numberRing`; `katzMazur`; `orthogonalSchematicClosure`; `gluingEquiv`,
  `mayerVietoris_exact`; `raynaudAbelianEmbedding`; `pCompleteFlatDescent`.
* Layer R07.2: `canonicalDecomposition`; `multiplicativePartFiltration`;
  `orderPSubgroupTypeDecomposition`; `wittGroup`; `DieudonneRing`; `dieudonneModule` as a named
  functor (stated above in existential form as `dieudonneEquivalenceFinite`); `dieudonneGaloisDescent`;
  `dieudonneTangentSpace`; `dieudonnePDivisible`; `dieudonneLieAlgebra`;
  `standardDieudonneModules` in rank two; `alphaPFiltration`; `ellipticDieudonne`;
  `dieudonneManinClassification` in higher rank; `standardDieudonne`, `slopeSequence`, `aNumber`;
  `isogenyClassification`; `covariantModule`; `hasseWitt`, `hasseInvariant`, `farguesLF`;
  `bt1HasseWittDuality`; `btStackSmooth`; `henselianLiftingPDivisible`;
  `BarsottiTate.tateSheaf`, `BarsottiTate.universalCover`; `universalCoverRigidity`;
  `deJongDieudonneEquivalence`; `swDieudonneSemiperfect`; `berthelotPerfectValuationRings`.
* Layer R07.3: `FilteredPhiNModule.tN`, `IsWeaklyAdmissible`; `dSt_isWeaklyAdmissible`,
  `dSt_fullyFaithful`, `IsAdmissible`; `mfTorAbelian`; `ringS`; `flFunctor`; `flExactFaithful`;
  `flSimpleObjects`; `flTameInertia`; `flFullFaithfulness`; `flEssentialImageSubquotients`;
  `StronglyDivisibleLattice`; `flLatticeFunctor`; `flPeriodComparison`; `flAdmissibility`;
  `flLatticeCorrespondence`; `flFiniteFlatDictionary`.
* Layer R07.4: `OE`, `SUr`, `breuilS`; `TorsionKisinModule`; `kummerFieldOfNorms`;
  `etalePhiModulesCohenRing`; `kummerEtalePhiModules`; `kisinEtaleFullFaithfulness`;
  `phiNNablaModules`; `robba`, `robbaBounded`, `robbaInt`, `PhiModule.slope`; `kedlayaSlopeFiltration`;
  `weaklyAdmissibleSlopeZero`; `kisinCrystallineEmbedding`; `finiteHeightLattices`;
  `semistableFiniteHeight`; `crystallineRestrictionFullFaithfulness`; `bkModuleStructure`;
  `bmsKisinFunctor`; `btTypeEquivalence`; `BreuilModule`; `tateModuleAcris`; `crystalline01IsBt`;
  `kisinPDivisibleClassification`; `finiteFlatClassification`; `dyadicClassification`;
  `finiteFlatRestrictionFullFaithfulness`; `bkIntegralComparisons`; `wachBreuilKisinComparison`;
  `FilteredPhiNModuleDD`; `potentiallySemistableDescentEquivalence`;
  `tameTypeWeightTwoFilteredModules`; `descentDataPDivisibleGroups`; `StronglyDivisibleModule`;
  `descentDataLatticeClassification`; `StronglyDivisibleRModule`; `BreuilModuleModP`;
  `stronglyDivisibleModulesForCharacters`; `KisinModuleCoeff`; `multiplicativeEtaleDictionary`;
  `breuilModulesWithCoefficients`; `etalePhiModulesWithCoefficients`;
  `crystallineWithCoefficients`.
* Layer R07.5: `formalGroupTorsionInertia`; `ordinaryTorsionInertia`;
  `supersingularTorsionInertia`; `multiplicativeTorsionInertia`; `IsPeuRamifiee` and `IsTresRamifiee` for
  general residual representations; `finiteFlatKummerExtensions`; `finiteFlatWeightTwoCriterion`;
  `dyadicFiniteFlatDichotomy`; `savittReductionPrincipalSeries`; `savittResidualTypes`;
  `flResidualWeights`; `crystalline01InertiaTypes`; `peuRamifieH1`, `peuRamifieH1Int`;
  `peuRamifieIntegralLifting`; `SerreWeight`, `compactInduction`, `heckeOperatorT`,
  `endEquivPolynomial`.
* Layer R07.6: `abelianSchemeTorsionFiniteFlat`; `fontaineLowerIndex`, `fontaineUpper`;
  `krasnerEmbeddingCriterion`; `lciLiftingAndRamification`; `fontaineRamificationBound`;
  `illusieObstructionHomomorphisms`; `flatDeformationTangentSpace`; `finiteFlatBaseChangeTwist`;
  `raynaudDetTateModule`; `cyclotomicImageStability`.
-/

end TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory
