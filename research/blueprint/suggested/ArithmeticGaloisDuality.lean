import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Module.Submodule.Range
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic

/-!
# Suggested declarations: global Galois duality and compact coefficients, layer R02.1

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
