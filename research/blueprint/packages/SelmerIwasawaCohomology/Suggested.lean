import Mathlib
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.Geometry.Hodge.Dimension
import TauCeti.Geometry.Hodge.Tate.Basic
import TauCeti.Geometry.Hodge.Tate.Twist
import TauCeti.Geometry.Hodge.Dual

/-!
# SelmerIwasawaCohomology: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. The algebraic Selmer diagram
accepts actual global/local modules and maps; identifying them with continuous Galois
cohomology is a separate comparison. Pairing perfection means bijective character-dual
maps, and double annihilators are restricted to finite ZMod modules. Corank is stated
on a compact p-adic dual. The filtered Frobenius data has real semilinear maps; its
small-weight crystalline realization remains in the README. Archimedean realizations
extend native opposed Hodge filtrations by a complex-linear Betti involution. The
L-function Tate line has native Hodge Tate index -n and Gamma factor Γℝ(s-n).

Cochain fibres, compact-support duality, Iwasawa complexes, perfect determinants and
period rings with their arithmetic actions require further supplier interfaces and
remain README targets. No substitute cohomology or period carrier is defined here.
-/

noncomputable section
open scoped TensorProduct
namespace TauCetiRoadmap.SelmerIwasawaCohomology

/-! ## Layer 0: Completions and coefficient limits -/

section Completion

variable (p : ℕ) [Fact p.Prime]

/-- the `p`-adic completion `Â = lim_m A/A^{p^m}` of an abelian group
(written additively), as Mathlib's `AdicCompletion` for the ideal `(p) ⊆ ℤ`. For `A = Fˣ`
(through `Additive`) this is `lim_m Fˣ/(Fˣ)^{p^m}`. -/
abbrev pCompletion (A : Type*) [AddCommGroup A] : Type _ :=
  AdicCompletion (Ideal.span {(p : ℤ)}) A

variable {p}

/-- the canonical map `A → Â`. -/
def toPCompletion (A : Type*) [AddCommGroup A] : A →ₗ[ℤ] pCompletion p A :=
  AdicCompletion.of (Ideal.span {(p : ℤ)}) A

/-- the kernel of `A → Â` is `⋂_m p^m A`. -/
theorem ker_toPCompletion (A : Type*) [AddCommGroup A] :
    LinearMap.ker (toPCompletion (p := p) A) =
      ⨅ m : ℕ, (Ideal.span {(p : ℤ)} ^ m) • (⊤ : Submodule ℤ A) := sorry

/-- functoriality of the completion in `A`. -/
def pCompletionMap {A B : Type*} [AddCommGroup A] [AddCommGroup B] (f : A →ₗ[ℤ] B) :
    pCompletion p A →ₗ[ℤ] pCompletion p B :=
  (AdicCompletion.map (Ideal.span {(p : ℤ)}) f).restrictScalars ℤ

/-- Completion preserves identity maps. -/
theorem pCompletionMap_id (A : Type*) [AddCommGroup A] :
    pCompletionMap (p := p) (LinearMap.id : A →ₗ[ℤ] A) = LinearMap.id := sorry

/-- Completion preserves composition, in the same order as the input maps. -/
theorem pCompletionMap_comp {A B C : Type*} [AddCommGroup A] [AddCommGroup B] [AddCommGroup C]
    (f : A →ₗ[ℤ] B) (g : B →ₗ[ℤ] C) :
    pCompletionMap (p := p) (g.comp f) =
      (pCompletionMap (p := p) g).comp (pCompletionMap (p := p) f) := sorry

/-- `AdicCompletion (p) ℤ ≅ ℤ_p`, so that `Â` is a `ℤ_p`-module. -/
theorem adicCompletion_int_equiv_padicInt :
    Nonempty (AdicCompletion (Ideal.span {(p : ℤ)}) ℤ ≃+* ℤ_[p]) := sorry

/-- for finitely generated `A`,
`ℤ_p ⊗ A ≅ Â` (from `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`). -/
theorem pCompletion_bijective_of_finite (A : Type*) [AddCommGroup A] [Module.Finite ℤ A] :
    Function.Bijective (AdicCompletion.ofTensorProduct (Ideal.span {(p : ℤ)}) A) := sorry

/-- for a number field `F`, `E_F ⊗ ℤ_p ≅ Ê_F`, and `Ê_F → F̂ˣ` is
injective because a unit that is a `p^m`-th power in `F` is the `p^m`-th power of a unit. -/
theorem units_pCompletion_injective (F : Type*) [Field F] [NumberField F] :
    Function.Injective (pCompletionMap (p := p)
      (MonoidHom.toAdditive (Units.map (algebraMap (NumberField.RingOfIntegers F) F).toMonoidHom) :
        Additive (NumberField.RingOfIntegers F)ˣ →+ Additive Fˣ).toIntLinearMap) :=
  sorry

/-- A `p^m`-th root in the field of an integer unit is an integer unit. -/
theorem units_pow_of_pow_eq (F : Type*) [Field F] [NumberField F] (m : ℕ)
    (u : (NumberField.RingOfIntegers F)ˣ) (x : Fˣ)
    (hx : x ^ p ^ m = Units.map (algebraMap (NumberField.RingOfIntegers F) F).toMonoidHom u) :
    ∃ v : (NumberField.RingOfIntegers F)ˣ,
      Units.map (algebraMap (NumberField.RingOfIntegers F) F).toMonoidHom v = x := sorry

end Completion

section WeakSemisimplicity
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- The natural map from fixed vectors to coinvariants of an endomorphism. -/
def invariantCoinvariantMap (σ : M →ₗ[R] M) :
    LinearMap.ker (σ - LinearMap.id) →ₗ[R] M ⧸ LinearMap.range (σ - LinearMap.id) :=
  (LinearMap.range (σ - LinearMap.id)).mkQ.comp (LinearMap.ker (σ - LinearMap.id)).subtype

/-- Weak semisimplicity at eigenvalue one means bijectivity of invariants to coinvariants. -/
def IsWeaklySemisimple (σ : M →ₗ[R] M) : Prop := Function.Bijective (invariantCoinvariantMap σ)

/-- The invariant and image submodules are complementary exactly when the natural map is bijective. -/
theorem weaklySemisimple_iff_split (σ : M →ₗ[R] M) :
    IsWeaklySemisimple σ ↔ IsCompl (LinearMap.ker (σ - LinearMap.id))
      (LinearMap.range (σ - LinearMap.id)) := sorry

/-- Equivariant linear equivalences preserve weak semisimplicity. -/
theorem weaklySemisimple_congr {N : Type*} [AddCommGroup N] [Module R N]
    (σ : M →ₗ[R] M) (τ : N →ₗ[R] N) (e : M ≃ₗ[R] N)
    (h : e.toLinearMap.comp σ = τ.comp e.toLinearMap) :
    IsWeaklySemisimple σ ↔ IsWeaklySemisimple τ := sorry

/-- Weak semisimplicity holds on a product exactly when it holds on each factor. -/
theorem weaklySemisimple_sum {N : Type*} [AddCommGroup N] [Module R N]
    (σ : M →ₗ[R] M) (τ : N →ₗ[R] N) :
    IsWeaklySemisimple (σ.prodMap τ) ↔ IsWeaklySemisimple σ ∧ IsWeaklySemisimple τ := sorry
end WeakSemisimplicity

namespace Tests
/-- weak_ss_trivial: the canonical map is the identity on the invariant module. -/
example {M : Type*} [AddCommGroup M] [Module ℚ M] :
    IsWeaklySemisimple (LinearMap.id : M →ₗ[ℚ] M) := sorry

/-- The size-two Jordan operator with specified rational eigenvalue. -/
def jordan (a : ℚ) : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ) where
  toFun x := (a * x.1 + x.2, a * x.2)
  map_add' := by intros; ext <;> simp <;> ring
  map_smul' := by intros; ext <;> simp <;> ring

/-- weak_ss_unipotent: invariants map to zero in coinvariants. -/
example : ¬ IsWeaklySemisimple (jordan 1) := sorry
/-- weak_ss_other_jordan: a Jordan block away from eigenvalue one is allowed. -/
example : IsWeaklySemisimple (jordan 2) := sorry
end Tests

namespace CompletionChecks
variable (p : ℕ) [Fact p.Prime]
/-- Completion kills a p-divisible group. -/
example : Subsingleton (pCompletion p ℚ) := sorry
/-- Completion of ℤ recovers ℤ_p. -/
example : Nonempty (pCompletion p ℤ ≃+* ℤ_[p]) := sorry
/-- An infinite free lattice has completed elements with infinite support. -/
example : ¬ Function.Surjective
    (AdicCompletion.ofTensorProduct (Ideal.span {(p : ℤ)}) (ℕ →₀ ℤ)) := sorry
/-- Completion preserves the identity rather than killing a nonzero completed lattice. -/
example : pCompletionMap (p := p) (LinearMap.id : ℤ →ₗ[ℤ] ℤ) = LinearMap.id := sorry
/-- Multiplication by three on ℤ completes to multiplication by three. -/
example : pCompletionMap (p := p) ((3 : ℤ) • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) =
    (3 : ℤ) • (LinearMap.id : pCompletion p ℤ →ₗ[ℤ] pCompletion p ℤ) := sorry
/-- The integer completion map has zero kernel, while the divisible rational carrier completes to zero. -/
example : Function.Injective (toPCompletion (p := p) ℤ) := sorry
/-- Every rational element maps to zero in its p-adic completion. -/
example (x : ℚ) : toPCompletion (p := p) ℚ x = 0 := sorry
/-- The identity operator sends each invariant to its unchanged quotient class. -/
example (x : LinearMap.ker ((LinearMap.id : ℚ →ₗ[ℚ] ℚ) - LinearMap.id)) :
    invariantCoinvariantMap (LinearMap.id : ℚ →ₗ[ℚ] ℚ) x =
      (LinearMap.range ((LinearMap.id : ℚ →ₗ[ℚ] ℚ) - LinearMap.id)).mkQ (x : ℚ) := rfl
/-- The unipotent operator kills a nonzero invariant class in coinvariants. -/
example : ¬ Function.Injective (invariantCoinvariantMap (Tests.jordan 1)) := sorry
end CompletionChecks

/-! ## Layer 1: Orthogonal conditions and duality -/

section Orthogonal

variable {R : Type*} [CommRing R] {X X' Y : Type*} [AddCommGroup X] [Module R X]
  [AddCommGroup X'] [Module R X'] [AddCommGroup Y] [Module R Y]

/-- `F^⊥ = {x' | b(F, x') = 0}` (Mazur–Rubin, Definition 1.6). -/
def orthogonal (b : X →ₗ[R] X' →ₗ[R] Y) (F : Submodule R X) : Submodule R X' :=
  ⨅ x ∈ F, LinearMap.ker (b x)

/-- membership. -/
theorem mem_orthogonal (b : X →ₗ[R] X' →ₗ[R] Y) (F : Submodule R X) (x' : X') :
    x' ∈ orthogonal b F ↔ ∀ x ∈ F, b x x' = 0 := by
  simp [orthogonal, Submodule.mem_iInf]

/-- `F ↦ F^⊥` is antitone. -/
theorem orthogonal_antitone (b : X →ₗ[R] X' →ₗ[R] Y) : Antitone (orthogonal b) := sorry

/-- strict ↦ relaxed. -/
theorem orthogonal_bot (b : X →ₗ[R] X' →ₗ[R] Y) : orthogonal b ⊥ = ⊤ := sorry

/-- A perfect pairing: both curried maps are bijective. -/
def IsPerfect (b : X →ₗ[R] X' →ₗ[R] Y) : Prop :=
  Function.Bijective b ∧ Function.Bijective b.flip

/-- relaxed ↦ strict, for a perfect pairing. -/
theorem orthogonal_top (b : X →ₗ[R] X' →ₗ[R] Y) (hb : IsPerfect b) : orthogonal b ⊤ = ⊥ := sorry

/-- the image rule for adjoint maps, `(π F)^⊥ = ι^{-1}(F^⊥)`. -/
theorem orthogonal_map_eq_comap {Z Z' : Type*} [AddCommGroup Z] [Module R Z] [AddCommGroup Z']
    [Module R Z'] (b : X →ₗ[R] X' →ₗ[R] Y) (bZ : Z →ₗ[R] Z' →ₗ[R] Y) (π : X →ₗ[R] Z)
    (ι : Z' →ₗ[R] X') (hadj : ∀ x z', bZ (π x) z' = b x (ι z')) (F : Submodule R X) :
    orthogonal bZ (F.map π) = (orthogonal b F).comap ι := by
  ext z'
  simp [mem_orthogonal, hadj]

/-- double orthogonal, for a perfect pairing of finite modules. -/
theorem orthogonal_orthogonal {n : ℕ} [NeZero n] {A B : Type*}
    [AddCommGroup A] [Module (ZMod n) A] [AddCommGroup B] [Module (ZMod n) B]
    [Finite A] [Finite B] (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n)
    (hb : IsPerfect b) (F : Submodule (ZMod n) A) :
    orthogonal b.flip (orthogonal b F) = F := sorry

/-- The finite character-dual quotient pairing is perfect, not merely injective. -/
theorem quotientPairing_perfect {n : ℕ} [NeZero n] {A B : Type*}
    [AddCommGroup A] [Module (ZMod n) A] [AddCommGroup B] [Module (ZMod n) B]
    [Finite A] [Finite B] (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n)
    (hb : IsPerfect b) (F : Submodule (ZMod n) A) :
    ∃ c : (A ⧸ F) →ₗ[ZMod n] (orthogonal b F) →ₗ[ZMod n] ZMod n,
      IsPerfect c ∧ ∀ x (y : orthogonal b F), c (F.mkQ x) y = b x y := sorry

end Orthogonal

/-- (`card_mul_card_orthogonal`): over `ℤ/n`, a perfect pairing into `ℤ/n` of finite modules
satisfies `#F · #F^⊥ = #X`. -/
theorem card_mul_card_orthogonal {n : ℕ} [NeZero n] {X X' : Type*} [AddCommGroup X]
    [Module (ZMod n) X] [AddCommGroup X'] [Module (ZMod n) X'] [Finite X] [Finite X']
    (b : X →ₗ[ZMod n] X' →ₗ[ZMod n] ZMod n) (hb : IsPerfect b) (F : Submodule (ZMod n) X) :
    Nat.card F * Nat.card (orthogonal b F) = Nat.card X := sorry

namespace PairingChecks
/-- The scalar pairing over ℤ/5 is perfect in both arguments. -/
example : IsPerfect (LinearMap.mul (ZMod 5) (ZMod 5)) := sorry
/-- A zero pairing on a nonzero module fails perfectness. -/
example : ¬ IsPerfect (0 : ℚ →ₗ[ℚ] ℚ →ₗ[ℚ] ℚ) := sorry
/-- Zero condition has full annihilator, even without perfectness. -/
example {R X X' Y : Type*} [CommRing R] [AddCommGroup X] [Module R X]
    [AddCommGroup X'] [Module R X'] [AddCommGroup Y] [Module R Y]
    (b : X →ₗ[R] X' →ₗ[R] Y) : orthogonal b ⊥ = ⊤ := sorry
/-- A zero pairing gives full annihilator for every condition. -/
example {R X X' Y : Type*} [CommRing R] [AddCommGroup X] [Module R X]
    [AddCommGroup X'] [Module R X'] [AddCommGroup Y] [Module R Y]
    (F : Submodule R X) : orthogonal (0 : X →ₗ[R] X' →ₗ[R] Y) F = ⊤ := sorry
end PairingChecks

/-! ## Layer 2: Selmer structures and complexes -/

section SelmerKernel

variable {R : Type*} [CommRing R] {ι : Type*}

/-- global and local modules with localisation maps and local conditions
(Mazur–Rubin, Definitions 1.1 and 2.1). -/
structure SelmerData (R : Type*) [CommRing R] (ι : Type*) where
  /-- The global cohomology module, e.g. `H¹(G_{K,Σ}, M)`. -/
  glob : Type*
  [instAdd : AddCommGroup glob]
  [instMod : Module R glob]
  /-- The local cohomology modules, e.g. `H¹(K_v, M)`. -/
  loc : ι → Type*
  [instAddLoc : ∀ v, AddCommGroup (loc v)]
  [instModLoc : ∀ v, Module R (loc v)]
  /-- The localisation maps. -/
  res : ∀ v, glob →ₗ[R] loc v
  /-- The local conditions. -/
  cond : ∀ v, Submodule R (loc v)

attribute [instance] SelmerData.instAdd SelmerData.instMod SelmerData.instAddLoc
  SelmerData.instModLoc

namespace SelmerData

variable (D : SelmerData R ι)

/-- the Selmer module `{c | res_v c ∈ L_v for all v}`. -/
def selmer : Submodule R D.glob := ⨅ v, (D.cond v).comap (D.res v)

/-- membership. -/
theorem mem_selmer (c : D.glob) : c ∈ D.selmer ↔ ∀ v, D.res v c ∈ D.cond v := by
  simp [selmer, Submodule.mem_iInf]

/-- the Selmer module is the kernel of the sum of the maps to `H¹(K_v)/L_v`. -/
theorem selmer_eq_ker :
    D.selmer = LinearMap.ker (LinearMap.pi fun v => (D.cond v).mkQ ∘ₗ D.res v) := sorry

/-- The Selmer data with the conditions replaced. -/
def withCond (L : ∀ v, Submodule R (D.loc v)) : SelmerData R ι :=
  { D with cond := L }

/-- monotonicity in the local conditions. -/
theorem selmer_mono {L L' : ∀ v, Submodule R (D.loc v)} (h : ∀ v, L v ≤ L' v) :
    (D.withCond L).selmer ≤ (D.withCond L').selmer := sorry

/-- the relaxed condition at a set `B` of places (`H¹` there). -/
def relax (B : Set ι) [DecidablePred (· ∈ B)] : SelmerData R ι :=
  D.withCond fun v => if v ∈ B then ⊤ else D.cond v

/-- the strict condition at a set `A` of places (`0` there). -/
def strict (A : Set ι) [DecidablePred (· ∈ A)] : SelmerData R ι :=
  D.withCond fun v => if v ∈ A then ⊥ else D.cond v

/-- strict ≤ given ≤ relaxed. -/
theorem selmer_strict_le_le_relax (S : Set ι) [DecidablePred (· ∈ S)] :
    (D.strict S).selmer ≤ D.selmer ∧ D.selmer ≤ (D.relax S).selmer := sorry

/-- The local quotient map from the larger Selmer condition to L'_v/L_v. -/
def changeConditionMap {L L' : ∀ v, Submodule R (D.loc v)} (_h : ∀ v, L v ≤ L' v) :
    (D.withCond L').selmer →ₗ[R]
      (∀ v, (L' v) ⧸ (L v).comap (L' v).subtype) :=
  LinearMap.pi fun v => ((L v).comap (L' v).subtype).mkQ.comp
    (LinearMap.codRestrict (L' v) ((D.res v).domRestrict (D.withCond L').selmer)
      (fun c => ((D.withCond L').mem_selmer c.val).mp c.property v))

/-- exactness at the larger Selmer module;
there is no claim of surjectivity onto the local quotient. -/
theorem exact_change_of_conditions {L L' : ∀ v, Submodule R (D.loc v)}
    (h : ∀ v, L v ≤ L' v) :
    LinearMap.ker (D.changeConditionMap h) =
      ((D.withCond L).selmer).comap ((D.withCond L').selmer).subtype := sorry

/-- a map of Selmer data (compatible global and local maps sending
conditions into conditions) induces a map of Selmer modules. -/
theorem map_selmer_le (D' : SelmerData R ι) (f : D.glob →ₗ[R] D'.glob)
    (fv : ∀ v, D.loc v →ₗ[R] D'.loc v) (hcomm : ∀ v c, fv v (D.res v c) = D'.res v (f c))
    (hcond : ∀ v, (D.cond v).map (fv v) ≤ D'.cond v) :
    D.selmer.map f ≤ D'.selmer := sorry

end SelmerData

/-- propagate a local condition along a coefficient map `g` on
local cohomology: forwards by image (quotients `T ↠ T/IT`, `V → W`) and backwards by inverse image
(submodules `T[I] ↪ T`, `T → V`) (Mazur–Rubin Definition 1.1; Rubin Definition I.3.4). -/
def propagateImage {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L : Submodule R X) : Submodule R Y := L.map g

/-- The backward propagation by inverse image. -/
def propagatePreimage {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L : Submodule R Y) : Submodule R X := L.comap g

/-- propagating the relaxed condition forwards along a surjection gives the relaxed one. -/
theorem propagateImage_top {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y]
    [Module R Y] (g : X →ₗ[R] Y) (hg : Function.Surjective g) :
    propagateImage g (⊤ : Submodule R X) = ⊤ := sorry

/-- propagating the strict condition backwards gives the kernel. -/
theorem propagatePreimage_bot {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y]
    [Module R Y] (g : X →ₗ[R] Y) :
    propagatePreimage g (⊥ : Submodule R Y) = LinearMap.ker g := sorry

/-- a Galois connection, `image ≤ L ↔ L₀ ≤ preimage`. -/
theorem propagate_gc {X Y : Type*} [AddCommGroup X] [Module R X] [AddCommGroup Y] [Module R Y]
    (g : X →ₗ[R] Y) (L₀ : Submodule R X) (L : Submodule R Y) :
    propagateImage g L₀ ≤ L ↔ L₀ ≤ propagatePreimage g L := Submodule.map_le_iff_le_comap

/-- from a condition `L_V ⊆ H¹(K_v, V)`, Rubin's `H¹_f(K_v, T)` and
`H¹_f(K_v, W)` are the inverse image and image under `H¹(T) → H¹(V) → H¹(W)`; the singular quotient
`H¹(T)/H¹_f(T)` is torsion-free, i.e. the condition on `T` is saturated. -/
theorem saturated_preimage {X Y : Type*} [AddCommGroup X] [Module ℤ X] [AddCommGroup Y]
    [Module ℚ Y] [Module ℤ Y] (g : X →ₗ[ℤ] Y) (LV : Submodule ℤ Y) (n : ℤ) (hn : n ≠ 0) (x : X)
    (hx : n • x ∈ propagatePreimage g LV) (hLV : ∀ y : Y, n • y ∈ LV → y ∈ LV) :
    x ∈ propagatePreimage g LV := sorry

end SelmerKernel

section Conditions

variable {R : Type*} [CommRing R] {H HI HQ : Type*} [AddCommGroup H] [Module R H]
  [AddCommGroup HI] [Module R HI] [AddCommGroup HQ] [Module R HQ]

/-- `H¹_ur = ker(H¹(G, M) → H¹(I, M))` (Rubin Definition I.3.1). -/
def unramified (resI : H →ₗ[R] HI) : Submodule R H := LinearMap.ker resI

/-- `ker(H¹(G, M) → H¹(I, M/F⁺M))` for a `G`-stable submodule
`F⁺M`; stability is required under the decomposition group only. -/
def greenberg (resQ : H →ₗ[R] HQ) : Submodule R H := LinearMap.ker resQ

/-- with `F⁺M = 0` the Greenberg condition is the unramified one. -/
theorem greenberg_zero (resI : H →ₗ[R] HI) : greenberg resI = unramified resI := rfl

/-- with `F⁺M = M` (so `H¹(I, M/F⁺M) = 0`) the Greenberg condition is relaxed. -/
theorem greenberg_top (resQ : H →ₗ[R] HQ) [Subsingleton HQ] : greenberg resQ = ⊤ := sorry

/-- `H¹_ur ⊆ H¹_Gr` when `resQ` factors through `resI`. -/
theorem unramified_le_greenberg (resI : H →ₗ[R] HI) (resQ : H →ₗ[R] HQ) (π : HI →ₗ[R] HQ)
    (hπ : π ∘ₗ resI = resQ) : unramified resI ≤ greenberg resQ := sorry

end Conditions

/-! Pontryagin characters and coranks. -/

section Dual

/-- the contragredient action `(g • f)(x) = f(g⁻¹ • x)`. -/
def contragredient {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hcont : ∀ g : G, Continuous fun x : M => g • x) (g : G)
    (f : PontryaginDual M) : PontryaginDual M :=
  ContinuousMonoidHom.comp f ⟨MulDistribMulAction.toMonoidHom M g⁻¹, hcont g⁻¹⟩

/-- the contragredient action is a left action. -/
theorem contragredient_mul {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hcont : ∀ g : G, Continuous fun x : M => g • x) (g h : G)
    (f : PontryaginDual M) :
    contragredient hcont (g * h) f = contragredient hcont g (contragredient hcont h f) := sorry

/-- the `ℤ_p`-corank `dim_{ℚ_p}(M^∨ ⊗ ℚ_p)` of a cofinitely generated discrete
`ℤ_p`-module, stated for its compact dual `N = M^∨` as a `ℤ_p`-module. -/
def corankFromDual (p : ℕ) [Fact p.Prime] (N : Type*) [AddCommGroup N] [Module ℤ_[p] N] : ℕ :=
  Module.finrank ℚ_[p] (ℚ_[p] ⊗[ℤ_[p]] N)

/-- finite modules have corank zero. -/
theorem corankFromDual_finite (p : ℕ) [Fact p.Prime] (N : Type*) [AddCommGroup N] [Module ℤ_[p] N]
    [Finite N] : corankFromDual p N = 0 := sorry

/-- additivity in short exact sequences of finitely generated modules. -/
theorem corankFromDual_add (p : ℕ) [Fact p.Prime] {N N' N'' : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    [AddCommGroup N'] [Module ℤ_[p] N'] [AddCommGroup N''] [Module ℤ_[p] N''] [Module.Finite ℤ_[p] N']
    (f : N →ₗ[ℤ_[p]] N') (g : N' →ₗ[ℤ_[p]] N'') (hf : Function.Injective f)
    (hg : Function.Surjective g) (hfg : Function.Exact f g) :
    corankFromDual p N' = corankFromDual p N + corankFromDual p N'' := sorry

/-- the compact dual `ℤ_p^r` computes the corank `r` of `(ℚ_p/ℤ_p)^r`. -/
theorem corankFromDual_pi_padicInt (p : ℕ) [Fact p.Prime] (r : ℕ) : corankFromDual p (Fin r → ℤ_[p]) = r := sorry

end Dual

section DualStructure

variable {R : Type*} [CommRing R] {ι : Type*} {Y : Type*} [AddCommGroup Y] [Module R Y]

namespace SelmerData

/-- the dual local conditions on `D'` (e.g. the data for `T^*`)
under local pairings `b v : H¹(K_v, T) × H¹(K_v, T^*) → Y`. -/
def dualCond (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) :
    ∀ v, Submodule R (D'.loc v) :=
  fun v => orthogonal (b v) (D.cond v)

/-- The dual Selmer data: the same global module and localisations as `D'`, with the dual
conditions. -/
def dualOf (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) : SelmerData R ι :=
  D'.withCond (dualCond D D' b)

/-- (`dual_modify`): relaxing at `B` dualises to making the dual strict at `B`. -/
theorem dualCond_relax (D D' : SelmerData R ι) (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y)
    (hb : ∀ v, IsPerfect (b v)) (B : Set ι) [DecidablePred (· ∈ B)] (v : ι) (hv : v ∈ B) :
    dualCond (D.relax B) D' b v = ⊥ := sorry

/-- (`dual_dual`): dualising twice returns the conditions, for finite local modules. -/
theorem dualCond_dualCond {n : ℕ} [NeZero n] (D D' : SelmerData (ZMod n) ι)
    (b : ∀ v, D.loc v →ₗ[ZMod n] D'.loc v →ₗ[ZMod n] ZMod n)
    (hb : ∀ v, IsPerfect (b v)) [∀ v, Finite (D.loc v)] [∀ v, Finite (D'.loc v)] (v : ι) :
    orthogonal (b v).flip (dualCond D D' b v) = D.cond v := sorry

end SelmerData

end DualStructure

namespace SelmerChecks
variable {R ι : Type*} [CommRing R]
/-- All relaxed conditions give the full global module. -/
example (D : SelmerData R ι) : (D.withCond fun _ => ⊤).selmer = ⊤ := sorry
/-- All strict conditions give the intersection of localization kernels. -/
example (D : SelmerData R ι) :
    (D.withCond fun _ => ⊥).selmer = ⨅ v, LinearMap.ker (D.res v) := sorry
/-- An empty local index imposes no constraint. -/
example (D : SelmerData R Empty) : D.selmer = ⊤ := sorry
/-- Relaxing all indices changes every condition to the whole local module. -/
example (D : SelmerData R ι) : (D.relax Set.univ).cond = fun _ => ⊤ := sorry
/-- Making all indices strict changes every condition to zero. -/
example (D : SelmerData R ι) : (D.strict Set.univ).cond = fun _ => ⊥ := sorry
/-- Inverse image of zero under a zero map is everything. -/
example : propagatePreimage (0 : ℚ →ₗ[ℚ] ℚ) ⊥ = ⊤ := sorry
/-- Image of everything under a zero map is zero. -/
example : propagateImage (0 : ℚ →ₗ[ℚ] ℚ) ⊤ = ⊥ := sorry
/-- Identity inertia restriction gives the strict condition. -/
example : unramified (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊥ := sorry
/-- Zero quotient restriction gives a relaxed Greenberg condition. -/
example : greenberg (0 : ℚ →ₗ[ℚ] ℚ) = ⊤ := sorry
/-- Corank one uses the compact dual of the discrete divisible module. -/
example (p : ℕ) [Fact p.Prime] : corankFromDual p ℤ_[p] = 1 := sorry
/-- Rank two distinguishes corank from the finite torsion length. -/
example (p : ℕ) [Fact p.Prime] : corankFromDual p (Fin 2 → ℤ_[p]) = 2 := sorry
/-- The contragredient pullback evaluates at the inverse group element. -/
example {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hc : ∀ g : G, Continuous fun x : M => g • x)
    (g : G) (f : PontryaginDual M) (x : M) : contragredient hc g f x = f (g⁻¹ • x) := rfl
/-- The unit acts as the identity on characters. -/
example {G M : Type*} [Group G] [TopologicalSpace M] [CommGroup M]
    [MulDistribMulAction G M] (hc : ∀ g : G, Continuous fun x : M => g • x)
    (f : PontryaginDual M) : contragredient hc 1 f = f := sorry
/-- Identical local conditions give a zero change map. -/
example (D : SelmerData R ι) :
    D.changeConditionMap (L := D.cond) (L' := D.cond) (fun _ => le_rfl) = 0 := sorry
/-- A zero localization cannot surject onto a nonzero local-condition quotient. -/
example (D : SelmerData ℚ Unit) [Subsingleton D.glob] (h : ∃ x : D.loc (), x ≠ 0) :
    ¬ Function.Surjective
      (D.changeConditionMap (L := fun _ => ⊥) (L' := fun _ => ⊤) (fun _ => bot_le)) := sorry
/-- Dualizing strict conditions gives relaxed conditions even for a zero pairing. -/
example {Y : Type*} [AddCommGroup Y] [Module R Y] (D D' : SelmerData R ι)
    (b : ∀ v, D.loc v →ₗ[R] D'.loc v →ₗ[R] Y) (v : ι) :
    SelmerData.dualCond (D.withCond fun _ => ⊥) D' b v = ⊤ := sorry
/-- Dual data with a zero pairing have no local constraints. -/
example {Y : Type*} [AddCommGroup Y] [Module R Y] (D D' : SelmerData R ι) :
    (D.dualOf D' (fun _ => (0 : D.loc _ →ₗ[R] D'.loc _ →ₗ[R] Y))).selmer = ⊤ := sorry
end SelmerChecks

/-! ## Layer 3: Iwasawa cohomology, control and determinants -/

/-- Norm-compatible integer invariants cannot be divisible by every power of three. -/
example (x : ℤ) (h : ∀ n : ℕ, ∃ y : ℤ, x = 3 ^ n * y) : x = 0 := by
  obtain ⟨y, hy⟩ := h x.natAbs
  refine Int.eq_zero_of_dvd_of_natAbs_lt_natAbs ⟨y, hy⟩ ?_
  rw [Int.natAbs_pow]
  exact Nat.lt_pow_self (by norm_num)

/-- At k=1 and χ(γ)=4 over ℚ₃, the cup twist has inverse scalar 1/4. -/
example : ((4 : ℚ) ^ (-1 : ℤ)) * 4 = 1 := by norm_num
/-- The opposite scalar fails the inverse-character normalization. -/
example : (4 : ℚ) * 4 ≠ 1 := by norm_num
/-- Degree two contributes positively to the inverse-determinant divisor. -/
example (length : ℤ) : (-1 : ℤ) ^ 2 * length = length := by norm_num
/-- Degree one contributes negatively to the inverse-determinant divisor. -/
example (length : ℤ) : (-1 : ℤ) ^ 1 * length = -length := by ring

/-! ## Layer 4: Finite conditions and arithmetic applications -/

/-- Filtered Frobenius data with semilinear divided maps and generation; arithmetic realization requires unramified small weights. -/
structure FontaineLaffailleModule (W : Type*) [CommRing W] (p : ℕ) (σ : W ≃+* W)
    (M : Type*) [AddCommGroup M] [Module W M] [Module.Finite W M] where
  F : ℤ → Submodule W M
  antitone : Antitone F
  exhaustive : ∃ a, F a = ⊤
  separated : ∃ b, F b = ⊥
  φ : ∀ i, F i →ₛₗ[σ.toRingHom] M
  divided : ∀ (i : ℤ) (x : F (i + 1)),
    φ i ⟨x, antitone (by omega) x.property⟩ = p • φ (i + 1) x
  generation : Submodule.span W (⋃ i, Set.range (φ i)) = ⊤

/-- Free objects have split filtration steps; the general filtered prototype alone does not assert this. -/
def IsFreeFontaineLaffaille {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [Module.Finite W M] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) : Prop :=
  Module.Free W M ∧ ∀ i : ℤ, ∃ N : Submodule W M, IsCompl (D.F i) N

/-- Support in the closed filtration interval [a,b]. -/
def fontaineLaffaille_interval {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M] [Module.Finite W M]
    {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) (a b : ℤ) : Prop :=
  D.F a = ⊤ ∧ D.F (b + 1) = ⊥

/-- A linear map preserving the filtration and the divided semilinear Frobenius maps. -/
structure FontaineLaffailleHom {W M N : Type*} [CommRing W]
    [AddCommGroup M] [Module W M] [AddCommGroup N] [Module W N]
    [Module.Finite W M] [Module.Finite W N] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M)
    (D' : FontaineLaffailleModule W p σ N) where
  map : M →ₗ[W] N
  filtration : ∀ i, (D.F i).map map ≤ D'.F i
  frobenius : ∀ i (x : D.F i),
    map (D.φ i x) = D'.φ i ⟨map x, filtration i (Submodule.mem_map_of_mem x.property)⟩

namespace Tests
/-- fl_zero: zero modules admit the zero filtration in every interval. -/
example (a b : ℤ) : ∃ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) (Fin 0 → ℤ),
    fontaineLaffaille_interval D a b := sorry
/-- fl_free_split: the proper step `3ℤ` cannot occur in a free split-filtration object. -/
example (D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ)
    (hD : IsFreeFontaineLaffaille D) : D.F 1 ≠ Ideal.span {(3 : ℤ)} := sorry

/-- fl_rank_one: divided Frobenius generation includes the unit weight-zero object. -/
example : ∃ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ,
    fontaineLaffaille_interval D 0 0 ∧ ∀ x : D.F 0, D.φ 0 x = x := sorry
/-- Omitting Frobenius generation would wrongly admit this nonzero object. -/
example (D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ) :
    ¬ (∀ i (x : D.F i), D.φ i x = 0) := sorry
/-- Identity maps are filtered Frobenius morphisms on every object. -/
example {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [Module.Finite W M] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) :
    ∃ f : FontaineLaffailleHom D D, f.map = LinearMap.id := sorry
/-- The zero map is also a morphism; injectivity is not part of the morphism definition. -/
example {W M N : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [AddCommGroup N] [Module W N] [Module.Finite W M] [Module.Finite W N]
    {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M)
    (D' : FontaineLaffailleModule W p σ N) :
    ∃ f : FontaineLaffailleHom D D', f.map = 0 := sorry
end Tests

/-- A native opposed Hodge structure together with a complex-linear real Betti involution exchanging Hodge pieces. -/
structure ArchimedeanRealization (W : Type*) [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    (ω : TauCeti.Hodge.Conjugation W) (w : ℤ) where
  hodge : TauCeti.Hodge.HodgeStructureOn W ω w
  FInfty : W ≃ₗ[ℂ] W
  involutive : Function.Involutive FInfty
  commute : ∀ x, FInfty (ω.toEquiv x) = ω.toEquiv (FInfty x)
  exchange : ∀ a, (hodge.piece a).map FInfty.toLinearMap = hodge.piece (w - a)

variable {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
  {ω : TauCeti.Hodge.Conjugation W} {w : ℤ}

/-- Product conjugation used by the finite direct-sum realization. -/
def productConjugation {U : Type*} [AddCommGroup U] [Module ℂ U]
    (ω : TauCeti.Hodge.Conjugation W) (ω' : TauCeti.Hodge.Conjugation U) :
    TauCeti.Hodge.Conjugation (W × U) where
  toEquiv := {
    toFun := fun x => (ω.toEquiv x.1, ω'.toEquiv x.2)
    invFun := fun x => (ω.toEquiv.symm x.1, ω'.toEquiv.symm x.2)
    left_inv := by intro x; ext <;> simp
    right_inv := by intro x; ext <;> simp
    map_add' := by intro x y; ext <;> simp
    map_smul' := by
      intro r x
      exact Prod.ext (LinearMap.map_smulₛₗ ω.toEquiv.toLinearMap r x.1)
        (LinearMap.map_smulₛₗ ω'.toEquiv.toLinearMap r x.2) }
  involutive := by intro x; ext <;> simp

/-- Direct sum has the product Hodge filtration and the two actual Betti involutions. -/
theorem archRealization_sum {U : Type*} [AddCommGroup U] [Module ℂ U] [FiniteDimensional ℂ U]
    {ω' : TauCeti.Hodge.Conjugation U} (A : ArchimedeanRealization W ω w)
    (B : ArchimedeanRealization U ω' w) :
    ∃ C : ArchimedeanRealization (W × U) (productConjugation ω ω') w,
      (∀ a, C.hodge.F a = (A.hodge.F a).prod (B.hodge.F a)) ∧
      C.FInfty = A.FInfty.prodCongr B.FInfty := sorry

/-- The Tate dual uses the native Hodge dual/twist and the negative transpose, with no supplied dual factor list. -/
theorem archRealization_tateDual (A : ArchimedeanRealization W ω w) :
    ∃ D : ArchimedeanRealization (Module.Dual ℂ W) ω.dual (2-w),
      HEq D.hodge (A.hodge.dual.tateTwist (-1)) ∧
      D.FInfty.toLinearMap = -A.FInfty.dualMap.toLinearMap := sorry

/-- Forget the Betti involution while retaining the native opposed Hodge filtration. -/
def archRealization_hodgeCarrier (A : ArchimedeanRealization W ω w) := A.hodge

/-- Multiplicity of the eigenvalue (-1)^(a+ε) on the diagonal Hodge piece. -/
def archRealization_diagonalMultiplicity (A : ArchimedeanRealization W ω w) (a : ℤ)
    (ε : Fin 2) : ℕ :=
  Module.finrank ℂ ((A.hodge.piece a ⊓ LinearMap.ker
    (A.FInfty.toLinearMap - ((-1 : ℂ) ^ (a + ε.val)) • LinearMap.id)) : Submodule ℂ W)

/-- A real or complex Deligne Gamma factor with its integral shift. -/
inductive ShiftedGamma where
  | real (shift : ℤ)
  | complex (shift : ℤ)
  deriving DecidableEq

/-- The real-place factors from paired off-diagonal pieces and the two diagonal Betti eigenspaces. -/
def hodgeGammaFactors (A : ArchimedeanRealization W ω w) : List (ShiftedGamma × ℕ) := by
  classical
  exact A.hodge.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.flatMap fun a =>
    if a < w - a then [(.complex (-a), A.hodge.hodgeNumber a)]
    else if 2 * a = w then
      [(.real (-a), archRealization_diagonalMultiplicity A a 0),
       (.real (1 - a), archRealization_diagonalMultiplicity A a 1)]
    else []

/-- The complex-place factors, one per Hodge type with shift minus its smaller index. -/
def complexHodgeGammaFactors (H : TauCeti.Hodge.HodgeStructureOn W ω w) :
    List (ShiftedGamma × ℕ) := by
  classical
  exact H.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.map fun a =>
    (.complex (-min a (w-a)), H.hodgeNumber a)

/-- Product of shifted native Deligne Gamma factors with their multiplicities. -/
def hodgeGammaFactor (factors : List (ShiftedGamma × ℕ)) (s : ℂ) : ℂ :=
  (factors.map fun f =>
    (match f.1 with
     | .real a => Complex.Gammaℝ (s + (a : ℂ))
     | .complex a => Complex.Gammaℂ (s + (a : ℂ))) ^ f.2).prod

/-- Meromorphic pole order at an integer; totalized Gamma values are not used to detect poles. -/
def gammaPoleOrder (factors : List (ShiftedGamma × ℕ)) (m : ℤ) : ℕ :=
  (factors.map fun f =>
    match f.1 with
    | .real a => if m + a ≤ 0 ∧ (m+a) % 2 = 0 then f.2 else 0
    | .complex a => if m+a ≤ 0 then f.2 else 0).sum

/-- A direct-sum factor list gives the product of its two Gamma factors. -/
theorem gammaFactor_sum (f g : List (ShiftedGamma × ℕ)) (s : ℂ) :
    hodgeGammaFactor (f ++ g) s = hodgeGammaFactor f s * hodgeGammaFactor g s := sorry

/-- Pole orders add under concatenation of factor lists. -/
theorem gammaPoleOrder_sum (f g : List (ShiftedGamma × ℕ)) (m : ℤ) :
    gammaPoleOrder (f ++ g) m = gammaPoleOrder f m + gammaPoleOrder g m := sorry

/-- The existing lattice conjugation on the native Tate line. -/
abbrev standardConjugation : TauCeti.Hodge.Conjugation ℂ :=
  TauCeti.Hodge.latticeConjugation TauCeti.Hodge.isBaseChange_tateLatticeMap

/-- RJW's L-function convention uses the existing Hodge Tate object with index -n.
Only the weight transport is new; the filtration, opposedness and conjugation are native. -/
def tateHodge (n : ℤ) : TauCeti.Hodge.HodgeStructureOn ℂ standardConjugation (2*n) := by
  have h : -2 * (-n) = 2*n := by ring
  exact h ▸ (TauCeti.Hodge.tate (-n))

/-- The transported native Tate object has its sole Hodge type (n,n). -/
theorem tateHodge_number (n a : ℤ) : (tateHodge n).hodgeNumber a = if a=n then 1 else 0 := sorry

/-- Complex-linear multiplication by (-1)^n is the real Betti involution. -/
def tateArchimedean (n : ℤ) : ArchimedeanRealization ℂ standardConjugation (2*n) where
  hodge := tateHodge n
  FInfty := LinearEquiv.ofInvolutive
    (((-1 : ℂ) ^ n) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) (by
      intro x
      simp [neg_one_zpow_eq_ite]
      split <;> simp)
  involutive := by
    intro x
    change (-1 : ℂ)^n • ((-1 : ℂ)^n • x) = x
    simp [neg_one_zpow_eq_ite]
    split <;> simp
  commute := by
    intro x
    change (-1 : ℂ)^n • standardConjugation.toEquiv x =
      standardConjugation.toEquiv ((-1 : ℂ)^n • x)
    by_cases h : Even n <;> simp [neg_one_zpow_eq_ite, h]
  exchange := by
    intro a
    change ((tateHodge n).piece a).map
      (((-1 : ℂ)^n) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) = (tateHodge n).piece (2*n-a)
    rw [Submodule.map_smul _ _ _ (zpow_ne_zero n (by norm_num)), Submodule.map_id]
    by_cases h : a = n
    · subst a
      congr 1
      omega
    · have h' : 2*n-a ≠ n := by omega
      have ha : (tateHodge n).piece a = ⊥ := Submodule.finrank_eq_zero.mp (by
        simpa [TauCeti.Hodge.HodgeStructureOn.hodgeNumber_def, h] using tateHodge_number n a)
      have hb : (tateHodge n).piece (2*n-a) = ⊥ := Submodule.finrank_eq_zero.mp (by
        simpa [TauCeti.Hodge.HodgeStructureOn.hodgeNumber_def, h'] using tateHodge_number n (2*n-a))
      rw [ha, hb]

/-- The L-function Tate convention produces Gammaℝ(s-n). -/
theorem gamma_tate_factor (n : ℤ) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors (tateArchimedean n)) s = Complex.Gammaℝ (s-n) := sorry

/-- The archimedean pole order at the Greenberg normalization point s=1. -/
def poleOrderAtOne (A : ArchimedeanRealization W ω w) : ℕ := gammaPoleOrder (hodgeGammaFactors A) 1

/-- Compute the Tate-dual factors from the actual primal Hodge pieces and signs.
An off-diagonal (a,b) with a<b dualizes to (1-b,1-a), and diagonal ε stays ε. -/
def tateDualHodgeGammaFactors (A : ArchimedeanRealization W ω w) :
    List (ShiftedGamma × ℕ) := by
  classical
  exact A.hodge.finite_setOf_hodgeNumber_ne_zero.toFinset.toList.flatMap fun a =>
    if a < w-a then [(.complex (w-a-1), A.hodge.hodgeNumber a)]
    else if 2*a = w then
      [(.real (a-1), archRealization_diagonalMultiplicity A a 0),
       (.real a, archRealization_diagonalMultiplicity A a 1)]
    else []

/-- The computed factors agree, up to order, with the genuine Tate-dual realization. -/
theorem tateDualHodgeGammaFactors_eq (A : ArchimedeanRealization W ω w)
    (D : ArchimedeanRealization (Module.Dual ℂ W) ω.dual (2-w))
    (hH : HEq D.hodge (A.hodge.dual.tateTwist (-1)))
    (hF : D.FInfty.toLinearMap = -A.FInfty.dualMap.toLinearMap) :
    (hodgeGammaFactors D).Perm (tateDualHodgeGammaFactors A) := sorry

/-- Criticality reads the realization and its computed canonical Tate-dual factors. -/
def IsGreenbergCritical (A : ArchimedeanRealization W ω w) : Prop :=
  poleOrderAtOne A = 0 ∧ gammaPoleOrder (tateDualHodgeGammaFactors A) 1 = 0

/-- Archimedean Gamma factor computed from the actual carrier. -/
def gammaFactor (A : ArchimedeanRealization W ω w) (s : ℂ) : ℂ :=
  hodgeGammaFactor (hodgeGammaFactors A) s

/-- The Tate line has a pole at one exactly for positive odd twists. -/
theorem poleOrderAtOne_tateTwist (n : ℤ) :
    poleOrderAtOne (tateArchimedean n) = if n % 2 = 1 ∧ 1 ≤ n then 1 else 0 := sorry

/-- Tate criticality is positive even or negative odd, excluding the trivial twist. -/
theorem isGreenbergCritical_tateTwist_iff (n : ℤ) :
    IsGreenbergCritical (tateArchimedean n) ↔
      ((n % 2 = 0 ∧ 2 ≤ n) ∨ (n % 2 = 1 ∧ n ≤ -1)) := sorry

namespace Tests
/-- twist_two and twist_minus_one, on the carrier and its computed Tate dual. -/
example : IsGreenbergCritical (tateArchimedean 2) ∧
    IsGreenbergCritical (tateArchimedean (-1)) := sorry
/-- twist_zero: no arbitrary dual Gamma list can change this failure. -/
example : ¬ IsGreenbergCritical (tateArchimedean 0) := sorry
/-- twist_one: the pole at one is read from the Tate realization. -/
example : poleOrderAtOne (tateArchimedean 1) = 1 := sorry
/-- arch_tate_convention: the actual carrier has the chosen (n,n) type. -/
example (n : ℤ) : (tateArchimedean n).hodge.hodgeNumber n = 1 := sorry
/-- gamma_zero: empty factors give the unit, even at totalized Gamma poles. -/
example (s : ℂ) : hodgeGammaFactor [] s = 1 ∧ gammaPoleOrder [] 0 = 0 := by simp [hodgeGammaFactor, gammaPoleOrder]
/-- gamma_tate: the result follows from the carrier, not a supplied Gamma function. -/
example (n : ℤ) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors (tateArchimedean n)) s = Complex.Gammaℝ (s-n) := sorry
/-- gamma_real_sign: changing the real sign changes the pole at zero. -/
example : gammaPoleOrder [(.real 0, 1)] 0 = 1 ∧ gammaPoleOrder [(.real 1, 1)] 0 = 0 := by decide
/-- gamma_elliptic: a conjugate off-diagonal pair is counted once at a real place. -/
example (A : ArchimedeanRealization W ω 1)
    (h : ∀ a, A.hodge.hodgeNumber a = if a=0 ∨ a=1 then 1 else 0) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors A) s = Complex.Gammaℂ s := sorry
/-- The totalized Gamma value at a pole is zero, while its pole order is positive. -/
example : Complex.Gammaℝ 0 = 0 ∧ gammaPoleOrder [(.real 0, 1)] 0 = 1 := sorry
end Tests

/-- Change the real Betti sign on the same native opposed filtration. -/
def oppositeRealSign (A : ArchimedeanRealization W ω w) :
    ArchimedeanRealization W ω w where
  hodge := A.hodge
  FInfty := LinearEquiv.ofInvolutive (-A.FInfty.toLinearMap) (by
    intro x
    simp only [LinearMap.neg_apply, LinearEquiv.coe_coe, map_neg, neg_neg]
    exact A.involutive x)
  involutive := by
    intro x
    change -A.FInfty (-A.FInfty x) = x
    simp only [map_neg, neg_neg]
    exact A.involutive x
  commute := by
    intro x
    change -A.FInfty (ω.toEquiv x) = ω.toEquiv (-A.FInfty x)
    rw [map_neg, A.commute]
  exchange := by
    intro a
    change (A.hodge.piece a).map (-A.FInfty.toLinearMap) = _
    rw [Submodule.map_neg, A.exchange]

namespace Tests
/-- TauCeti.Selmer.arch_zero: this tests the actual carrier, not an empty input list. -/
example [Subsingleton W] (A : ArchimedeanRealization W ω w) (a : ℤ) (ε : Fin 2) :
    A.hodge.hodgeNumber a = 0 ∧ archRealization_diagonalMultiplicity A a ε = 0 := sorry
/-- TauCeti.Selmer.arch_real_involution and gamma_real_sign:
identical Hodge filtrations with different Betti involutions have different pole orders. -/
example : (oppositeRealSign (tateArchimedean 0)).hodge = (tateArchimedean 0).hodge ∧
    gammaPoleOrder (hodgeGammaFactors (tateArchimedean 0)) 0 = 1 ∧
    gammaPoleOrder (hodgeGammaFactors (oppositeRealSign (tateArchimedean 0))) 0 = 0 := sorry
/-- gamma_zero: zero carrier yields no factors with positive multiplicity. -/
example [Subsingleton W] (A : ArchimedeanRealization W ω w) (s : ℂ) :
    hodgeGammaFactor (hodgeGammaFactors A) s = 1 ∧
      gammaPoleOrder (hodgeGammaFactors A) 0 = 0 := sorry
end Tests

namespace AdditionalChecks
/-- No Gamma factors gives product one and pole order zero. -/
example (s : ℂ) : hodgeGammaFactor [] s = 1 ∧ gammaPoleOrder [] 0 = 0 := by simp [hodgeGammaFactor, gammaPoleOrder]
/-- A real Gamma factor with zero shift has a pole at zero. -/
example : gammaPoleOrder [(.real 0, 1)] 0 = 1 := by decide
/-- A real Gamma factor with shift one has no pole at zero. -/
example : gammaPoleOrder [(.real 1, 1)] 0 = 0 := by decide
/-- Complex Gamma has a pole at every nonpositive integral argument. -/
example : gammaPoleOrder [(.complex 0, 1)] (-1) = 1 := by decide
/-- An odd negative argument is not a real Gamma pole. -/
example : gammaPoleOrder [(.real 0, 1)] (-1) = 0 := by decide
/-- The p=2 sign remains meaningful: the Betti involution for n=1 has eigenvalue -1. -/
example : ((tateArchimedean 1).FInfty (1 : ℂ)) = -1 := sorry
/-- Product conjugation conjugates both factors, rather than acting complex-linearly. -/
example : (productConjugation standardConjugation standardConjugation).toEquiv
    (Complex.I, 1) = (-Complex.I, 1) := sorry
/-- The native Tate-line conjugation fixes one and reverses the imaginary unit. -/
example : standardConjugation.toEquiv (1 : ℂ) = 1 ∧
    standardConjugation.toEquiv Complex.I = -Complex.I := sorry
/-- A nonzero diagonal multiplicity lies on the expected Betti eigenspace. -/
example : archRealization_diagonalMultiplicity (tateArchimedean 0) 0 0 = 1 ∧
    archRealization_diagonalMultiplicity (tateArchimedean 0) 0 1 = 0 := sorry
/-- The sum of two actual weight-zero Tate carriers has Hodge multiplicity two. -/
example (C : ArchimedeanRealization (ℂ × ℂ)
    (productConjugation standardConjugation standardConjugation) 0)
    (h : ∀ a, C.hodge.F a = ((tateHodge 0).F a).prod ((tateHodge 0).F a)) :
    C.hodge.hodgeNumber 0 = 2 := sorry
/-- Forgetting the Betti involution preserves the sole Hodge type. -/
example (n : ℤ) : (archRealization_hodgeCarrier (tateArchimedean n)).hodgeNumber n = 1 := sorry
/-- The canonical dual factors of twists two and zero fix both shift and real sign. -/
example : gammaPoleOrder (tateDualHodgeGammaFactors (tateArchimedean 2)) 1 = 0 ∧
    gammaPoleOrder (tateDualHodgeGammaFactors (tateArchimedean 0)) 1 = 1 := sorry
/-- Zero realization also gives zero Tate-dual pole order. -/
example [Subsingleton W] (A : ArchimedeanRealization W ω w) :
    gammaPoleOrder (tateDualHodgeGammaFactors A) 1 = 0 := sorry
/-- The complex-place Tate realization contributes a complex factor, even for a real Tate line. -/
example (s : ℂ) : hodgeGammaFactor (complexHodgeGammaFactors (tateHodge 0)) s =
    Complex.Gammaℂ s := sorry
/-- A transported twist retains index two and excludes its opposite index. -/
example : (tateHodge 2).hodgeNumber 2 = 1 ∧ (tateHodge 2).hodgeNumber (-2) = 0 := sorry
/-- The Gamma wrapper reads its carrier in the same normalization as the explicit Tate line. -/
example (s : ℂ) : gammaFactor (tateArchimedean 2) s = Complex.Gammaℝ (s-2) := sorry
/-- Switching the real sign twice recovers the original involution. -/
example (A : ArchimedeanRealization W ω w) :
    (oppositeRealSign (oppositeRealSign A)).FInfty = A.FInfty := sorry
end AdditionalChecks

end TauCetiRoadmap.SelmerIwasawaCohomology

/-
Definitions whose arithmetic or derived carriers require the supplier developments
are specified in the README: kummerLimit, canonical Galois Selmer data,
corank on a discrete p-primary module, SelmerStructure and its arithmetic dual,
LocalConditionMorphism, localMinus, localDualError, selmerComplex,
iwasawaComplex, iwasawaCohomology, iwasawaSelmerComplex,
discreteInfiniteSelmerComplex, localSpecializationError, selmerDeterminant,
GreenbergStructureHypotheses, the C_p and B_dR arithmetic comparison,
aCris, bCris, dCris, dDeRham, IsCrystalline, IsDeRham,
fontaineLaffaille_sum, fontaineLaffaille_dual, IsTorsionCrystalline,
IsIntegralCrystalline, crystallineNonsingular, blochKatoCondition,
blochKatoCondition_T, blochKatoStructure, ellipticSelmerInfinity,
pRamifiedModule, unramifiedModule, closedGlobalUnitTower, arithmeticPlusMinus,
PadicLFunctionDatum, GreenbergCorankConjecture, GreenbergCharIdealConjecture,
GreenbergMainConjecture, LeadingTermData and LeadingTermStatement.
Their intended signatures, named operations and discriminating checks remain there,
as do the compact-cochain, derived, Iwasawa and period arithmetic milestones.
-/
