import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Module.Submodule.Range
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.Topology.Algebra.RestrictedProduct.Basic
import Mathlib.RepresentationTheory.Homological.TateCohomology.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Matrix.Mul

/-!
# Suggested declarations: global Galois duality and compact coefficients, layers R02.1, R02.2, R02.3, R02.4

This file is a prototype in the form of upstream's `Suggested.lean`. Every proof is `sorry`; the
statements elaborate against Mathlib at the pinned commit. The complete targets are in the
blueprint packet and the roadmap document.

Layer R02.1 passes from finite discrete coefficients to compact `p`-adic ones:
* `lim` and `lim¹` of an `ℕ`-indexed tower of abelian groups, the Mittag-Leffler condition and the
  vanishing of `lim¹`;
* continuous cochains into an inverse limit, and the lifting of continuous cochains along finite
  surjections (the transition maps of cochain towers are surjective);
* compactness: a continuous cochain into `V = T[1/p]` lands in `p^{-n}T`;
* the pointwise topology on `Hom(C, A)` and the splitting torsor of Harpaz–Wittenberg,
  Lemma 5.5, in its corrected form.

The Milnor sequence, Tate's inverse-limit theorem and the rationalisation theorem are stated on
Mathlib's `continuousCohomology` carrier; their signatures are sketched in comments at the end,
because the tower of topological representations they quantify over is not yet a Mathlib object.
-/

noncomputable section

namespace TauCeti.CompactCoefficients

/-! ## Towers, `lim` and `lim¹` -/

/-- An `ℕ`-indexed inverse system of abelian groups. -/
structure Tower where
  /-- The terms. -/
  obj : ℕ → Type*
  [inst : ∀ n, AddCommGroup (obj n)]
  /-- The transition maps `A_{n+1} → A_n`. -/
  map : ∀ n, obj (n + 1) →+ obj n

attribute [instance] Tower.inst

namespace Tower

/-- The composite transition `A_{n+k} → A_n`. -/
def mapIter (A : Tower) : ∀ (n k : ℕ), A.obj (n + k) →+ A.obj n
  | _, 0 => AddMonoidHom.id _
  | n, k + 1 => (mapIter A n k).comp (A.map (n + k))

variable (A : Tower)

/-- The shift map `∏ A_n → ∏ A_n`, `(a_n) ↦ (a_n - φ_n(a_{n+1}))`. -/
def shift : (∀ n, A.obj n) →+ (∀ n, A.obj n) where
  toFun a n := a n - A.map n (a (n + 1))
  map_zero' := by ext n; simp
  map_add' a b := by ext n; simp only [Pi.add_apply, map_add]; abel

/-- **`R02.1/lim-one`**: `lim A = ker(shift)`. -/
def lim : AddSubgroup (∀ n, A.obj n) := A.shift.ker

/-- **`R02.1/lim-one`**: `lim¹ A = coker(shift)`. -/
abbrev limOne : Type _ := (∀ n, A.obj n) ⧸ A.shift.range

/-- API: membership in `lim`. -/
theorem mem_lim (a : ∀ n, A.obj n) : a ∈ A.lim ↔ ∀ n, A.map n (a (n + 1)) = a n := sorry

/-- **`R02.1/mittag-leffler`**: the images of `A_{n+k} → A_n` stabilise in `k`. -/
def IsMittagLeffler : Prop :=
  ∀ n, ∃ m, ∀ k ≥ m, (A.mapIter n k).range = (A.mapIter n m).range

/-- API: surjective transitions give a Mittag-Leffler tower. -/
theorem isMittagLeffler_of_surjective (h : ∀ n, Function.Surjective (A.map n)) :
    A.IsMittagLeffler := sorry

/-- API: a tower of finite groups is Mittag-Leffler. -/
theorem isMittagLeffler_of_finite [∀ n, Finite (A.obj n)] : A.IsMittagLeffler := sorry

/-- **`R02.1/mittag-leffler-lim-one`**: a Mittag-Leffler tower has `lim¹ = 0`. -/
theorem limOne_subsingleton_of_isMittagLeffler (h : A.IsMittagLeffler) :
    Subsingleton A.limOne := sorry

/-- API: surjective transitions give `lim¹ = 0`. -/
theorem limOne_subsingleton_of_surjective (h : ∀ n, Function.Surjective (A.map n)) :
    Subsingleton A.limOne :=
  A.limOne_subsingleton_of_isMittagLeffler (A.isMittagLeffler_of_surjective h)

end Tower

/-- The constant tower `ℤ ← ℤ ← ⋯` with transition maps multiplication by `p`. -/
def mulTower (p : ℕ) : Tower where
  obj _ := ℤ
  map _ := AddMonoidHom.mul (p : ℤ)

/-- **`R02.1/lim-one-six-term`**: a short exact sequence of towers gives
`0 → lim A → lim B → lim C → lim¹ A → lim¹ B → lim¹ C → 0`; here the connecting map. -/
def limOneConnecting (A B C : Tower) (f : ∀ n, A.obj n →+ B.obj n) (g : ∀ n, B.obj n →+ C.obj n)
    (hf : ∀ n x, f n (A.map n x) = B.map n (f (n + 1) x))
    (hg : ∀ n x, g n (B.map n x) = C.map n (g (n + 1) x))
    (hex : ∀ n, Function.Exact (f n) (g n)) (hsurj : ∀ n, Function.Surjective (g n))
    (hinj : ∀ n, Function.Injective (f n)) : C.lim →+ A.limOne := sorry

/-! ## Continuous cochains into inverse limits -/

section Cochains

variable {X : Type*} [TopologicalSpace X] [CompactSpace X] [TotallyDisconnectedSpace X]

/-- **`R02.1/cochain-lifting`**: a continuous map from a compact totally disconnected space into a
finite discrete space lifts along any surjection of finite discrete spaces; so the transition
maps of the tower of continuous cochains `C(Gⁱ, T_{n+1}) → C(Gⁱ, T_n)` are surjective. -/
theorem exists_lift_continuous {Y Z : Type*} [TopologicalSpace Y] [DiscreteTopology Y]
    [TopologicalSpace Z] [DiscreteTopology Z] (π : Y → Z) (hπ : Function.Surjective π)
    (f : C(X, Z)) : ∃ g : C(X, Y), π ∘ g = f := sorry

omit [CompactSpace X] [TotallyDisconnectedSpace X] in
/-- **`R02.1/cochains-inverse-limit`**: continuous maps into a closed subspace of a product
(an inverse limit) are compatible families of continuous maps into the factors. -/
theorem continuous_into_pi_iff {ι : Type*} {Y : ι → Type*} [∀ i, TopologicalSpace (Y i)]
    (f : X → ∀ i, Y i) : Continuous f ↔ ∀ i, Continuous fun x => f x i :=
  continuous_pi_iff

/-- **`R02.1/compact-cochain-bounded`**: a continuous map from a compact space into `ℚ_p^d` lands in
`p^{-n}ℤ_p^d` for some `n`, so `C(X, V) = ⋃_n C(X, p^{-n}T)`. -/
theorem exists_pow_smul_mem_lattice (p : ℕ) [Fact p.Prime] (d : ℕ) (f : C(X, Fin d → ℚ_[p])) :
    ∃ n : ℕ, ∀ x i, ‖(p : ℚ_[p]) ^ n * f x i‖ ≤ 1 := sorry

end Cochains

/-! ## Pointwise `Hom` and the splitting torsor (Harpaz–Wittenberg, Lemma 5.5, corrected) -/

section SplittingTorsor

variable (C A : Type*) [AddCommGroup C] [AddCommGroup A] [TopologicalSpace A]

/-- **`R02.1/pointwise-hom`**: `Hom_pt(C, A)`, the additive homomorphisms `C → A` with the topology
induced from `A^C` (pointwise convergence). -/
def HomPt : Type _ := C →+ A

instance : AddCommGroup (HomPt C A) := inferInstanceAs (AddCommGroup (C →+ A))

instance : FunLike (HomPt C A) C A := inferInstanceAs (FunLike (C →+ A) C A)

instance : TopologicalSpace (HomPt C A) :=
  TopologicalSpace.induced (fun (f : C →+ A) (c : C) => f c) Pi.topologicalSpace

variable {C A}

/-- API: evaluation `Hom_pt(C, A) × C → A` is continuous for discrete `C`. -/
theorem continuous_eval [TopologicalSpace C] [DiscreteTopology C] :
    Continuous fun x : HomPt C A × C => x.1 x.2 := sorry

/-- API: for finitely generated `C` and discrete `A`, `Hom_pt(C, A)` is discrete. -/
theorem discreteTopology_of_fg [DiscreteTopology A] (hC : AddGroup.FG C) :
    DiscreteTopology (HomPt C A) := sorry

variable {B : Type*} [AddCommGroup B]

/-- **`R02.1/splitting-torsor`**: the sections of `κ : B → C` (group homomorphisms with
`κ ∘ s = id`), a torsor under `Hom(C, A)` for `A = ker κ`. -/
def Sections (κ : B →+ C) : Type _ := {s : C →+ B // κ.comp s = AddMonoidHom.id C}

/-- API: two sections differ by a homomorphism `C → ker κ`. -/
theorem sections_sub_mem_ker (κ : B →+ C) (s t : Sections κ) (c : C) :
    (s.1 c - t.1 c) ∈ κ.ker := sorry

/-- API: the torsor is nonempty exactly when the underlying sequence splits as groups. -/
theorem sections_nonempty_iff (κ : B →+ C) (hκ : Function.Surjective κ) :
    Nonempty (Sections κ) ↔ ∃ s : C →+ B, ∀ c, κ (s c) = c := sorry

end SplittingTorsor

/-! ## Signatures on Mathlib's `continuousCohomology` carrier (sketched)

```
/-- R02.1/milnor-sequence: for a tower of cochain complexes with surjective transitions -/
theorem milnor_exact : 0 → limOne (H^{i-1} C_n) → H^i (lim C_n) → lim H^i(C_n) → 0 exact

/-- R02.1/tate-inverse-limit: G profinite, T = lim T_n with T_n finite discrete TopRep's -/
theorem continuousCohomology_limit (hfin : ∀ n, Finite (H^{i-1}(G, T_n))) :
    continuousCohomology ℤ_[p] G i (lim T_n) ≅ lim_n continuousCohomology ℤ_[p] G i T_n

/-- R02.1/rationalization -/
theorem continuousCohomology_rationalize (T : f.g. ℤ_p-TopRep) :
    ℚ_[p] ⊗ continuousCohomology ℤ_[p] G i T ≅ continuousCohomology ℚ_[p] G i (T ⊗ ℚ_p)

/-- R02.1/continuous-section-long-exact -/
theorem longExact_of_continuousSection (0 → T' → T → T'' → 0) (s : C(T'', T), section) : LES

/-- R02.1/splitting-torsor-class and R02.1/connecting-cup-formula -/
def splittingClass : H1cont Γ (HomPt C A)
theorem splittingClass_eq_zero_iff : splittingClass = 0 ↔ ∃ s : C →+ B, equivariant ∧ κ ∘ s = id
theorem delta_eq_cup : ∂ [c] = [γ ∪ c]   -- evaluation Hom_pt(C,A) × C → A

/-- API of R02.1/mittag-leffler: agreement with Mathlib's functor-level notion -/
theorem Tower.isMittagLeffler_iff_functor : A.IsMittagLeffler ↔ (A.toFunctor ⋙ forget).IsMittagLeffler

/-- API of R02.1/pointwise-hom: finite C gives Tau Ceti's InternalHom -/
def homPt_equiv_internalHom [Finite C] : HomPt C A ≃ TauCeti.InternalHom Γ C A
```
-/

/-! ## Unit tests -/

namespace SuggestedTest

open Tower

/-- Surjective transitions: `lim¹ = 0` (the tower `ℤ/p^{n+1} → ℤ/p^n`). -/
example (p : ℕ) : Subsingleton (Tower.limOne
    { obj := fun n => ZMod (p ^ n), map := fun n => (ZMod.castHom (pow_dvd_pow p (Nat.le_succ n))
      (ZMod (p ^ n))).toAddMonoidHom }) := sorry

/-- The multiplication-by-`p` tower on `ℤ` has `lim = 0` and `lim¹ ≅ ℤ_p/ℤ ≠ 0`. -/
example (p : ℕ) [Fact p.Prime] : (mulTower p).lim = ⊥ ∧ Nontrivial (mulTower p).limOne := sorry

/-- A tower of finite groups is Mittag-Leffler. -/
example (A : Tower) [∀ n, Finite (A.obj n)] : A.IsMittagLeffler := isMittagLeffler_of_finite A

/-- The constant tower with identity maps has `lim` the diagonal. -/
example (M : Type*) [AddCommGroup M] (a : ∀ _ : ℕ, M) :
    a ∈ (⟨fun _ => M, fun _ => AddMonoidHom.id M⟩ : Tower).lim ↔ ∀ n, a n = a 0 := sorry

/-- Finitely generated `C`: discrete `Hom_pt` (here `C = ℤ`). -/
example (A : Type*) [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A] :
    DiscreteTopology (HomPt ℤ A) := sorry

/-- Harpaz–Wittenberg's counterexample: for `C = ⊕_ℕ 𝔽₂`, `Hom_pt(C, 𝔽₂) = 𝔽₂^ℕ` is not
discrete. -/
example : letI : TopologicalSpace (ZMod 2) := ⊥
    ¬ DiscreteTopology (HomPt (ℕ →₀ ZMod 2) (ZMod 2)) := sorry

end SuggestedTest

end TauCeti.CompactCoefficients

/-! # Layer R02.2: Hochschild–Serre and descent

Source: Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*, Chapter II §§1, 2, 4, and Rubin,
*Euler systems*, Proposition B.2.5. The spectral sequence of a first-quadrant double complex is built on
Mathlib's spectral objects (`HomotopyCategory.spectralObjectMappingCone`,
`Triangulated.SpectralObject.mapHomologicalFunctor`, `Abelian.SpectralObject.spectralSequence`); its
abutment and the Hochschild–Serre statements are sketched in comments. What elaborates against
Mathlib alone is the algebraic core of finite-index descent (NSW (1.6.2)) and the arithmetic of
`cor ∘ res`.
-/

namespace TauCeti.HochschildSerre

/-- **`R02.2/finite-index-descent`**, algebraic core (NSW (1.6.2)): if multiplication by `#G` is
bijective on `A`, the cohomology of the finite group `G` with coefficients in `A` vanishes in positive
degrees. Applied to `G/U` and `B = Hᵠ(U, A)`, this collapses Hochschild–Serre to its left column. -/
theorem subsingleton_groupCohomology_of_bijective {G : Type} [Group G] [Fintype G] (A : Rep ℤ G)
    (hA : Function.Bijective fun a : A => (Fintype.card G : ℤ) • a) (n : ℕ) (hn : 0 < n) :
    Subsingleton (groupCohomology A n) := sorry

/-- API (`finite-index-descent` (iii)): an element killed by `n` in a group on which `n` is injective
is zero; with `cor ∘ res = n` this is the injectivity of restriction for prime-to-`n` torsion. -/
theorem eq_zero_of_nsmul_eq_zero {M : Type*} [AddCommGroup M] {n : ℕ}
    (hn : Function.Injective fun m : M => n • m) {x : M} (hx : n • x = 0) : x = 0 :=
  hn (by simpa using hx)

/-! Signatures on the continuous-cohomology carrier (sketched):

```
/-- R02.2/first-quadrant-spectral-sequence -/
def DoubleComplex.spectralSequence (A : HomologicalComplex₂ Ab (.up ℕ) (.up ℕ)) :
    SpectralSequence Ab (fun r => ComplexShape.spectralSequenceNat ⟨r, 1 - r⟩) 2
theorem DoubleComplex.eInftyIsoGr : E_∞^{p,q} ≅ F^p H^{p+q}(Tot A) ⧸ F^{p+1} H^{p+q}(Tot A)
theorem DoubleComplex.fiveTerm_exact : 0 → E₂^{1,0} → H¹ → E₂^{0,1} → E₂^{2,0} → H² exact

/-- R02.2/hochschild-serre-spectral-sequence (G profinite, H ⊴ G closed, A discrete) -/
def spectralSequence (G H A) : E₂^{p,q} = H^p(G ⧸ H, H^q(H, A)) ⇒ continuousCohomology (p+q) A
theorem edgeBottom_eq_inflation, edgeLeft_eq_restriction

/-- R02.2/five-term-transgression, R02.2/transgression-cup-product -/
theorem d₂_zero_one_eq_transgression : d₂^{0,1} = ProfiniteCohomology.transgression
theorem d₂_eq_neg_cup (hH : IsOpen H) (htriv : ∀ h ∈ H, ∀ a, h • a = a) : d₂ x = -(u ∪ x)

/-- R02.2/finite-index-descent -/
theorem res_bijective_of_coprime (hU : U.Normal) (hn : Nat.Coprime (G : U).index ℓ)
    [IsPrimaryTorsion ℓ A] : Bijective (res : H^i(G, A) → H^i(U, A)^{G ⧸ U})
```
-/

namespace SuggestedTest

/-- The injectivity step of descent: `n • x = 0` with `n` injective forces `x = 0` (here `n = 3` on
`ℤ`). -/
example (x : ℤ) (hx : 3 • x = 0) : x = 0 :=
  eq_zero_of_nsmul_eq_zero (M := ℤ) (n := 3)
    (fun a b h => by simpa using (mul_left_cancel₀ (by norm_num : (3 : ℤ) ≠ 0) h)) hx

end SuggestedTest

end TauCeti.HochschildSerre

/-! # Layers R02.3 and R02.4: restricted ramification and Poitou–Tate duality

Source: Milne, *Arithmetic Duality Theorems*, Chapter I §§1, 2, 4, 5. The arithmetic carriers
(`K_S`, the S-idele classes, class formations, local duality) live in Tau Ceti's
`ProfiniteCohomology` and `ClassFieldTheory` roadmaps, which are not part of Mathlib; their
signatures are sketched in comments below. What is stated here elaborates against Mathlib alone:
* the compositum of the finite subextensions satisfying a predicate (the shape of `K_S`);
* restricted products of local cohomology groups, the map `β` and `Ш = ker β`;
* exact annihilators and the duality of restricted products;
* the numerical form of the global Euler characteristic, with the test of Milne's footnote 13;
* the modified archimedean groups as Tate cohomology of `ℤ/2`, with their unit tests.
-/

namespace TauCeti.RestrictedRamification

variable (K Ω : Type*) [Field K] [Field Ω] [Algebra K Ω]

/-- **`R02.3/restricted-ramification-group`**, abstract form: the compositum of the finite
subextensions of `Ω/K` satisfying `good`. With `good L` the statement that `L/K` is unramified at
every finite place outside `S`, this is `K_S`. -/
def maxSubfieldOf (good : IntermediateField K Ω → Prop) : IntermediateField K Ω :=
  ⨆ (L : IntermediateField K Ω) (_ : FiniteDimensional K L ∧ good L), L

variable {K Ω}

/-- API: every good finite subextension lies in the compositum. -/
theorem le_maxSubfieldOf {good : IntermediateField K Ω → Prop} {L : IntermediateField K Ω}
    (hL : FiniteDimensional K L) (hg : good L) : L ≤ maxSubfieldOf K Ω good := sorry

/-- API (`mem_maxUnramifiedOutside_iff`): if `good` is closed under composita of finite
subextensions and passes to subextensions, a finite `L` lies in the compositum exactly when it is
good. -/
theorem le_maxSubfieldOf_iff {good : IntermediateField K Ω → Prop}
    (hsup : ∀ L₁ L₂ : IntermediateField K Ω, FiniteDimensional K L₁ → FiniteDimensional K L₂ → good L₁ → good L₂ →
      good (L₁ ⊔ L₂))
    (hle : ∀ L₁ L₂ : IntermediateField K Ω, L₁ ≤ L₂ → FiniteDimensional K L₂ → good L₂ → good L₁)
    {L : IntermediateField K Ω} (hL : FiniteDimensional K L) :
    L ≤ maxSubfieldOf K Ω good ↔ good L := sorry

/-! Signatures on the arithmetic carriers (sketched):

```
/-- R02.3/restricted-ramification-group -/
def maxUnramifiedOutside (K) [NumberField K] (S : Set (Place K)) : IntermediateField K Kˢ
def galoisGroupS K S : ProfiniteGrp := Gal(K_S/K)
theorem mem_maxUnramifiedOutside_iff [FiniteDimensional K L] :
    L ≤ K_S ↔ ∀ v ∉ S, v.IsFinite → IsUnramifiedAt v L
theorem cyclotomic_le_maxUnramifiedOutside (hℓ : ∀ v ∣ ℓ, v ∈ S) : K(μ_{ℓ^∞}) ≤ K_S

/-- R02.3/hermite-unramified-outside-finite -/
theorem finite_unramifiedOutside (hS : S.Finite) (n : ℕ) :
    {L : IntermediateField K Kˢ | finrank K L ≤ n ∧ L.IsUnramifiedOutside S}.Finite

/-- R02.3/h1-finite -/
theorem finite_H1 (hS : S.Finite) (M : DiscreteRep ℤ G_S) [Finite M] : Finite (H¹(G_S, M))

/-- R02.3/localisation-maps: Tate cohomology at archimedean places -/
def localCohomology (v : Place K) (r : ℕ) (M) :=
  if v.IsInfinite then tateCohomology (M restricted to G_v) r else H^r(G_v, M)
def locMap (v) : H^r(G_S, M) →+ localCohomology v r M
theorem locMap_indep (ι ι' : Kˢ →ₐ[K] K_vˢ) : locMap ι = locMap ι'

/-- R02.3/s-idele-class-modules, R02.3/s-idele-class-sequence -/
def sIdeleClasses S : DiscreteRep ℤ G_S      -- C_S = colim_F J_{F,S}/E_{F,S}
theorem H_units_eq_zero (r ≥ 1) : H^r(G_S, U_S) = 0
theorem sIdeleClasses_invariants : (C_S)^{Gal(K_S/F)} ≃ C_F ⧸ U_{F,S}

/-- R02.3/p-class-formation, R02.3/s-class-formation -/
structure PClassFormation (P : Set ℕ) (G) (C : DiscreteRep ℤ G) where
  inv (U : OpenSubgroup G) : H²(U, C) →+ ℚ ⧸ ℤ
  inv_injective, H1_eq_zero, inv_res, inv_layer_bijective, inv_primary_bijective (ℓ ∈ P)
def sClassFormation K S : PClassFormation (primesDividingDegree K_S) G_S C_S

/-- R02.3/s-unit-kummer-sequence (m a unit in R_{K,S}) -/
theorem kummer_exact : 0 → (Set.unit K S) ⧸ m → H¹(G_S, μ_m) → (ClassGroup R_{K,S})[m] → 0
```
-/

end TauCeti.RestrictedRamification

namespace TauCeti.PoitouTate

open Filter RestrictedProduct

/-! ## Restricted products of local cohomology and `Ш` -/

section RestrictedCohomology

variable {ι : Type*} (H : ι → Type*) [∀ v, AddCommGroup (H v)] (Hun : ∀ v, AddSubgroup (H v))

/-- **`R02.4/restricted-product-cohomology`**: `P_S = ∏′_{v ∈ S} (H^r(K_v, M), H^r_un(K_v, M))`. -/
abbrev RestrictedCohomology : Type _ := Πʳ v, [H v, Hun v]_[cofinite]

variable {H Hun} {A : Type*} [AddCommGroup A]

/-- **`R02.4/restricted-product-cohomology`**: `β`, built from localisations that are unramified
at almost every place (Milne, Lemma 4.8). -/
def beta (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    A →+ RestrictedCohomology H Hun where
  toFun a := ⟨fun v => loc v a, hloc a⟩
  map_zero' := sorry
  map_add' := sorry

/-- **`R02.4/restricted-product-cohomology`**: `Ш = ker β`. -/
def sha (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) : AddSubgroup A :=
  (beta loc hloc).ker

/-- API: a class is in `Ш` iff it is locally trivial everywhere. -/
theorem mem_sha_iff (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v)
    (a : A) : a ∈ sha loc hloc ↔ ∀ v, loc v a = 0 := sorry

/-- API: for finitely many places the restricted product is the full product. -/
theorem restrictedCohomology_equiv_pi [Finite ι] :
    Nonempty (RestrictedCohomology H Hun ≃+ ∀ v, H v) := sorry

end RestrictedCohomology

/-! ## Exact annihilators and the duality of restricted products -/

section Annihilators

variable {M N T : Type*} [AddCommGroup M] [AddCommGroup N] [AddCommGroup T]

/-- `A ≤ M` and `B ≤ N` are exact annihilators of each other under `b`. -/
def IsExactAnnihilator (b : M →+ N →+ T) (A : AddSubgroup M) (B : AddSubgroup N) : Prop :=
  (∀ n, n ∈ B ↔ ∀ m ∈ A, b m n = 0) ∧ ∀ m, m ∈ A ↔ ∀ n ∈ B, b m n = 0

/-- A pairing is perfect on both sides (nondegenerate, for finite groups). -/
def IsPerfect (b : M →+ N →+ T) : Prop :=
  (∀ m, (∀ n, b m n = 0) → m = 0) ∧ ∀ n, (∀ m, b m n = 0) → n = 0

/-- **`R02.4/unramified-exact-annihilators`**, counting form: in a perfect pairing of finite
groups, orthogonal subgroups whose orders multiply to the order of `M` are exact annihilators. -/
theorem isExactAnnihilator_of_card [Finite M] [Finite N] (b : M →+ N →+ T) (hb : IsPerfect b)
    (A : AddSubgroup M) (B : AddSubgroup N) (horth : ∀ m ∈ A, ∀ n ∈ B, b m n = 0)
    (hcard : Nat.card A * Nat.card B = Nat.card M) : IsExactAnnihilator b A B := sorry

variable {ι : Type*} {H H' : ι → Type*} [∀ v, AddCommGroup (H v)] [∀ v, AddCommGroup (H' v)]
  {Hun : ∀ v, AddSubgroup (H v)} {Hun' : ∀ v, AddSubgroup (H' v)}

/-- **`R02.4/restricted-product-self-duality`**, algebraic form: placewise perfect pairings of
finite groups for which the unramified subgroups are exact annihilators at almost every place
give a perfect pairing of the restricted products, equal to the finite sum of the local pairings. -/
theorem exists_restrictedCohomology_pairing [∀ v, Finite (H v)] [∀ v, Finite (H' v)]
    (b : ∀ v, H v →+ H' v →+ T) (hb : ∀ v, IsPerfect (b v))
    (hun : ∀ᶠ v in cofinite, IsExactAnnihilator (b v) (Hun v) (Hun' v)) :
    ∃ B : RestrictedCohomology H Hun →+ RestrictedCohomology H' Hun' →+ T,
      IsPerfect B ∧ ∀ x y (s : Finset ι), (∀ v ∉ s, b v (x v) (y v) = 0) →
        B x y = ∑ v ∈ s, b v (x v) (y v) := sorry

end Annihilators

/-! ## The global Euler characteristic, numerically -/

section Euler

/-- `χ(G_S, M) = #H⁰ · #H² / #H¹` (ordinary cohomology). -/
def eulerChar (h0 h1 h2 : ℕ) : ℚ := (h0 * h2 : ℚ) / h1

/-- The archimedean factor `#H⁰(G_v, M) / |#M|_v`: `|m|_v = m` at a real place and `m²` at a
complex place, and `H⁰` is ordinary (not Tate) cohomology. -/
def archFactor (isComplex : Bool) (h0 m : ℕ) : ℚ :=
  (h0 : ℚ) / (if isComplex then (m : ℚ) ^ 2 else m)

/-- **`R02.4/global-euler-characteristic`**: the right-hand side `∏_{v arch} #H⁰(G_v, M)/|#M|_v`
for a list of archimedean places, each recorded as (complex?, `#H⁰(G_v, M)`). -/
def archProduct (places : List (Bool × ℕ)) (m : ℕ) : ℚ :=
  (places.map fun p => archFactor p.1 p.2 m).prod

end Euler

/-! Signatures on the arithmetic carriers (sketched):

```
/-- R02.4/discrete-module-ext -/
instance : IsGrothendieckAbelian (DiscreteRep ℤ G)
abbrev Ext (M N : DiscreteRep ℤ G) (r : ℕ) := Abelian.Ext M N r
def extIntEquivCohomology : Ext (trivial ℤ) N r ≃+ H^r(G, N)
def yonedaPairing : Ext M C r →+ H^s(G, M) →+ H^{r+s}(G, C)

/-- R02.4/class-formation-ext-duality, R02.4/tate-global-duality -/
def alpha (F : PClassFormation P G C) (M) (r) : Ext M C r →+ Module.Dual ℤ (H^{2-r}(G, M))
theorem alpha_primary_bijective (hℓ : ℓ ∈ P) (hr : 2 ≤ r) : Bijective (alpha F M r).primary ℓ
theorem tate_global_duality (hℓ : ℓ ∈ P) (hr : 1 ≤ r) : Bijective (alpha (sClassFormation K S) M r).primary ℓ

/-- R02.4/finite-module-dual -/
def dual (M) : DiscreteRep ℤ G_S := InternalHom G_S M (E_S)
def doubleDualEquiv (hM : IsUnit (#M : R_{K,S})) : M ≃ dual (dual M)

/-- R02.4/poitou-tate -/
theorem sha_pairing_perfect (hM) : IsPerfect (shaPairing : Ш¹_S(K, M) →+ Ш²_S(K, dual M) →+ ℚ⧸ℤ)
theorem nineTerm_exact (hM) : the nine-term sequence of locally compact groups is exact
theorem beta_bijective_of_three_le (hr : 3 ≤ r) : Bijective (β^r : H^r(G_S, M) → ⊕_{v real} H^r(K_v, M))

/-- R02.4/global-finiteness, R02.4/cohomological-dimension-bound -/
theorem finite_H (hS : S.Finite) (hM) (r) : Finite (H^r(G_S, M))
theorem cd_le_two (hℓ : IsUnit (ℓ : R_{K,S})) (h : Odd ℓ ∨ IsTotallyComplex K) : cd_ℓ G_S ≤ 2

/-- R02.4/units-cohomology-high-degree -/
theorem H3_units_eq_zero (K) [NumberField K] : H³(G_K, Kˢˣ) = 0

/-- R02.4/global-euler-characteristic -/
theorem eulerChar_eq (hS : S.Finite) (hM) :
    eulerChar #H⁰(G_S, M) #H¹(G_S, M) #H²(G_S, M) = archProduct (archimedean places, #H⁰(G_v, M)) #M
```
-/

/-! ## Unit tests -/

namespace SuggestedTest

/-- Milne's footnote 13: `M = ℤ/2` gives the factor `1` at a real place ... -/
example : archFactor false 2 2 = 1 := by norm_num [archFactor]

/-- ... and `1/2` at a complex place, so `χ(G_S, ℤ/2) = 2^{-s}`. -/
example : archFactor true 2 2 = 1 / 2 := by norm_num [archFactor]

/-- The whole product over `r` real and `s` complex places is `2^{-s}`. -/
example (r s : ℕ) :
    archProduct (List.replicate r (false, 2) ++ List.replicate s (true, 2)) 2 = 1 / 2 ^ s := sorry

/-- Modified archimedean groups: `Ĥ⁰(ℤ/2, ℤ/3) = 0`, whereas the invariants are `ℤ/3`. -/
example : Subsingleton (tateCohomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) (ZMod 3)) 0) :=
  sorry

/-- `Ĥ⁰(ℤ/2, ℤ/2) = ℤ/2` at a real place. -/
example : Nontrivial (tateCohomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) (ZMod 2)) 0) := sorry

/-- A class of `A` in `Ш` of a single place with zero localisation. -/
example {A H : Type*} [AddCommGroup A] [AddCommGroup H] (loc : A →+ H) (a : A) (ha : loc a = 0) :
    a ∈ sha (H := fun _ : Unit => H) (Hun := fun _ => ⊤) (fun _ => loc)
      (fun _ => Filter.Eventually.of_forall fun _ => trivial) :=
  (mem_sha_iff _ _ a).2 fun _ => ha

/-- `R02.5/greenberg-wiles-formula`, the acceptance test: `M = ℤ/p` over `ℚ` with unramified conditions; the
global term `#H⁰(ℚ, ℤ/p)/#H⁰(ℚ, μ_p) = p` and the archimedean factor `#L_∞/#H⁰(ℝ, ℤ/p) = 1/p` cancel, and all finite
factors are `1`. -/
example (p : ℕ) (hp : 0 < p) : ((p : ℚ) / 1) * (1 / p) = 1 := by
  field_simp

/-- `R02.6/taylor-wiles-local-count`: the Frobenius eigenvalues on `ad⁰` are `x, 1, x⁻¹`, so on the diagonal model
`Frob − 1` has a one-dimensional kernel when `x ≠ 1`: the entries `x − 1, 0, x⁻¹ − 1` have exactly one zero. -/
example (x : ℚ) (hx : x ≠ 1) : x - 1 ≠ 0 ∧ x⁻¹ - 1 ≠ 0 := by
  refine ⟨sub_ne_zero.mpr hx, sub_ne_zero.mpr ?_⟩
  intro h
  exact hx (by simpa using congrArg (·⁻¹) h)

end SuggestedTest

/-! ## D7 (checkpoint 5): compactly supported cochains -/

namespace D7Test

/-- `D7/compact-support-cochains`: with the cone convention `d = ((d_B, f), (0, −d_A))`, the cone differential squares to
zero when `d_A² = d_B² = 0` and `f` is a chain map (`d_B f = f d_A`); here as `2 × 2` matrices over a commutative
ring. -/
example {R : Type*} [CommRing R] (dA dB f : R) (hA : dA * dA = 0) (hB : dB * dB = 0) (hf : dB * f = f * dA) :
    !![dB, f; 0, -dA] * !![dB, f; 0, -dA] = 0 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two, hA, hB, hf]

/-- `D7/compact-support-cup-products`: the sign `(−1)^{deg a}` in `a ∪_c (b, b_S)` is `−1` for `deg a = 1` and `1` for
`deg a = 2`. -/
example : ((-1 : ℤ) ^ 1, (-1 : ℤ) ^ 2) = (-1, 1) := by norm_num

end D7Test

end TauCeti.PoitouTate
