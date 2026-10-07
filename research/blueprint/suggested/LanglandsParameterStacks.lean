/-
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive; these statements suggest Lean forms so contributors and reviewers
 converge on names and signatures. Nothing here claims an implementation.

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

The algebraic signatures below elaborate at the pinned Mathlib. The Tau Ceti
source checks are recorded below; its missing object file is not rebuilt. They accept
 supplier-owned group actions and invariant-ring diagrams as explicit inputs.
LParameter below is the continuous-group shadow: the relatively discrete
 condensed coefficient functor has not been fabricated. WeilDeligneParameter
 is the split GL_n shadow. Regularity of matrix coefficients, geometric
 parabolics, and all stable infinity-category/derived stack conditions that
 cannot yet be expressed are explicitly omitted in the inventory at the end.
That inventory names every missing API/test signature and its precise supplier.
-/
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.GroupTheory.Subgroup.Center
import Mathlib.GroupTheory.Perm.Cycle.Factors
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.Algebra.Category.Ring.Colimits
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.RingTheory.Nilpotent.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.Topology.Instances.Matrix
-- import TauCeti.GroupTheory.FixedSubgroup
-- The source was read at the pinned Tau Ceti commit; its object file is absent
-- from the existing shared build. Its two baseline checks are listed below.
-- No library build is requested for this planning file.

open CategoryTheory CategoryTheory.Limits
open scoped BigOperators

namespace TauCeti.LanglandsParameterStacks
universe u v w z

section Crossed
variable {Γ : Type u} {H : Type v} [Group Γ] [Group H]

/-- LP0's group-theoretic definition; the action is a genuine automorphism action. -/
structure CrossedCocycle (α : Γ →* MulAut H) where
  toFun : Γ → H
  map_mul' : ∀ x y, toFun (x * y) = toFun x * α x (toFun y)

instance {α : Γ →* MulAut H} : CoeFun (CrossedCocycle α) (fun _ => Γ → H) :=
  ⟨CrossedCocycle.toFun⟩

namespace CrossedCocycle
variable {α : Γ →* MulAut H}
@[ext] theorem ext {c d : CrossedCocycle α} (h : ∀ x, c x = d x) : c = d := by
  sorry

theorem map_one (c : CrossedCocycle α) : c 1 = 1 := by sorry

theorem map_inv (c : CrossedCocycle α) (x : Γ) :
    c x⁻¹ = α x⁻¹ (c x)⁻¹ := by sorry

def unit (α : Γ →* MulAut H) : CrossedCocycle α where
  toFun := fun _ => 1
  map_mul' := by sorry

def gauge (c : CrossedCocycle α) (h : H) : CrossedCocycle α where
  toFun := fun x => h * c x * (α x h)⁻¹
  map_mul' := by sorry

theorem gauge_one (c : CrossedCocycle α) : c.gauge 1 = c := by sorry

theorem gauge_mul (c : CrossedCocycle α) (h k : H) :
    (c.gauge k).gauge h = c.gauge (h * k) := by sorry

def restrict {Δ : Type w} [Group Δ] (c : CrossedCocycle α) (f : Δ →* Γ) :
    CrossedCocycle (α.comp f) where
  toFun := fun x => c (f x)
  map_mul' := by sorry

def map {K : Type w} [Group K] {β : Γ →* MulAut K}
    (c : CrossedCocycle α) (f : H →* K)
    (hf : ∀ x h, f (α x h) = β x (f h)) : CrossedCocycle β where
  toFun := fun x => f (c x)
  map_mul' := by sorry

def asSection (c : CrossedCocycle α) : Γ →* SemidirectProduct H Γ α where
  toFun := fun x => ⟨c x, x⟩
  map_one' := by sorry
  map_mul' := by sorry

abbrev Sections (α : Γ →* MulAut H) :=
  {s : Γ →* SemidirectProduct H Γ α //
    (SemidirectProduct.rightHom : SemidirectProduct H Γ α →* Γ).comp s =
      MonoidHom.id Γ}

def sectionEquiv (α : Γ →* MulAut H) : CrossedCocycle α ≃ Sections α := by sorry

theorem sectionEquiv_right (c : CrossedCocycle α) (x : Γ) :
    (((sectionEquiv α) c).val x).right = x := by sorry

theorem sectionEquiv_left (c : CrossedCocycle α) (x : Γ) :
    (((sectionEquiv α) c).val x).left = c x := by sorry

theorem restrict_comp {K : Type w} [Group K] (c : CrossedCocycle α)
    (f : K →* Γ) (g : K →* K) : (c.restrict f).restrict g = c.restrict (f.comp g) := by
  sorry

theorem map_gauge {K : Type w} [Group K] {β : Γ →* MulAut K}
    (c : CrossedCocycle α) (f : H →* K)
    (hf : ∀ x h, f (α x h) = β x (f h)) (h : H) :
    (c.gauge h).map f hf = (c.map f hf).gauge (f h) := by sorry

def gaugeSetoid (α : Γ →* MulAut H) : Setoid (CrossedCocycle α) where
  r c d := ∃ h : H, d = c.gauge h
  iseqv := by sorry

def orbit (c : CrossedCocycle α) : Quotient (gaugeSetoid α) := Quotient.mk _ c

-- cocycle_trivial_action
example : CrossedCocycle (1 : Γ →* MulAut H) ≃ (Γ →* H) := by sorry

-- cocycle_trivial_group
example (α : Unit →* MulAut H) : Subsingleton (CrossedCocycle α) := by sorry

-- cocycle_coboundary
example (α : Γ →* MulAut H) (h : H) (x : Γ) :
    ((unit α).gauge h) x = h * (α x h)⁻¹ := by sorry

/-- A fully concrete version of the C₂ acting by negation test. -/
def signAction : Multiplicative (ZMod 2) →* MulAut (Multiplicative ℤ) := by sorry

def signCocycle : CrossedCocycle signAction := by sorry

theorem signCocycle_generator :
    signCocycle (Multiplicative.ofAdd (1 : ZMod 2)) = Multiplicative.ofAdd (1 : ℤ) := by
  sorry

-- cocycle_not_hom
example : ¬ ∃ f : Multiplicative (ZMod 2) →* Multiplicative ℤ,
    ∀ x, f x = signCocycle x := by sorry
end CrossedCocycle
end Crossed

section Continuous
variable {Γ : Type u} {H : Type v} [Group Γ] [Group H]
  [TopologicalSpace Γ] [TopologicalSpace H]

/-- Continuous-group shadow; the condensed finite-type coefficient condition is omitted. -/
def LParameter (α : Γ →* MulAut H) := {c : CrossedCocycle α // Continuous c}

namespace LParameter
variable {α : Γ →* MulAut H}

@[ext] theorem ext {c d : LParameter α} (h : ∀ x, c.val x = d.val x) :
    c = d := by sorry
def asSection (c : LParameter α) : CrossedCocycle.Sections α :=
  (CrossedCocycle.sectionEquiv α) c.val

def restrictWild (c : LParameter α) (P : Subgroup Γ) :
    LParameter (α.comp P.subtype) :=
  ⟨c.val.restrict P.subtype, by sorry⟩

-- Finite-Q lifts require the supplied integral L-group and condensed coefficient functor.
-- LParameter.asLift and LParameter.matrixCriterion are in the omission inventory.

-- parameter_split_torus: multiplicative characters into any topological abelian group.
example (α : Γ →* MulAut H) (hα : α = 1) :
    LParameter α ≃ {χ : Γ →* H // Continuous χ} := by sorry

-- parameter_section
example (c : LParameter α) (x : Γ) :
    (c.asSection.val x).right = x ∧ (c.asSection.val x).left = c.val x := by sorry
end LParameter

/-- Open means open in the wild subgroup P, not in the full Weil group Γ. -/
def FiniteWildRamification {α : Γ →* MulAut H}
    (c : CrossedCocycle α) (P : Subgroup Γ) : Prop :=
  ∃ U : Subgroup P, IsOpen (U : Set P) ∧ ∀ x : P, x ∈ U → c x.val = 1

def FiniteWildPiece (α : Γ →* MulAut H) (P : Subgroup Γ) :=
  {c : LParameter α // ∀ x : Γ, x ∈ P → c.val x = 1}

namespace FiniteWildPiece
variable {α : Γ →* MulAut H} {P P' : Subgroup Γ}
def inflate (h : P' ≤ P) (c : FiniteWildPiece α P) : FiniteWildPiece α P' := by sorry

theorem inflate_val (h : P' ≤ P) (c : FiniteWildPiece α P) :
    (inflate h c).val = c.val := by sorry
end FiniteWildPiece

-- wild_piece_order
example {α : Γ →* MulAut H} {P P' : Subgroup Γ} (h : P' ≤ P)
    (c : FiniteWildPiece α P) : (c.inflate h).val = c.val := by sorry

-- wild_unramified: trivial cocycles lie in every supplied wild piece.
example (α : Γ →* MulAut H) (P : Subgroup Γ) :
    ∀ x : Γ, x ∈ P → CrossedCocycle.unit α x = 1 := by sorry
end Continuous

section Wild
variable {P : Type u} {W : Type v} {L : Type w} [Group P] [Group W] [Group L]

/-- Underlying extendibility shadow. Admissibility and the SL₂(C) factor are omitted. -/
def WildInertialParameter (i : P →* W) :=
  {ρ : P →* L // ∃ φ : W →* L, φ.comp i = ρ}

namespace WildInertialParameter
variable {i : P →* W}
def ofLanglands (φ : W →* L) : WildInertialParameter (L := L) i :=
  ⟨φ.comp i, φ, rfl⟩

def conjugate (g : L) (ρ : WildInertialParameter (L := L) i) :
    WildInertialParameter (L := L) i := by
  sorry

theorem conjugate_val (g : L) (ρ : WildInertialParameter (L := L) i) (p : P) :
    (conjugate (i := i) g ρ).val p = g * ρ.val p * g⁻¹ := by sorry

-- wild_inertial_trivial
example : (ofLanglands (i := i) (1 : W →* L)).val = (1 : P →* L) := by sorry

-- wild_inertial_conjugate
example (g : L) (φ ψ : W →* L) (hψ : ∀ w, ψ w = g * φ w * g⁻¹) :
    conjugate (i := i) g (ofLanglands (i := i) φ) = ofLanglands (i := i) ψ := by sorry

-- wild_inertial_forget
example (φ : W →* L) : (ofLanglands (i := i) φ).val = φ.comp i := by sorry

theorem ext {ρ σ : WildInertialParameter (L := L) i} (h : ρ.val = σ.val) : ρ = σ := by
  sorry

-- wild_inertial_extension_not_data
example (φ ψ : W →* L) (h : φ.comp i = ψ.comp i) :
    ofLanglands (i := i) φ = ofLanglands (i := i) ψ := by sorry
end WildInertialParameter
end Wild

section TwistedCentralizer
variable {W : Type u} {L : Type v} [Group W] [Group L]
  (P : Subgroup W) [P.Normal] (π : L →* W) (ρ : P →* L)

def conjugateWild (w : W) (p : P) : P :=
  ⟨w⁻¹ * p.val * w, by sorry⟩

def twistedWildCentralizer : Subgroup L where
  carrier := {g | ∀ p : P, g * ρ (conjugateWild P (π g) p) * g⁻¹ = ρ p}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

namespace twistedWildCentralizer
theorem mem_iff (g : L) : g ∈ twistedWildCentralizer P π ρ ↔
    ∀ p : P, g * ρ (conjugateWild P (π g) p) * g⁻¹ = ρ p := by sorry

def projection : twistedWildCentralizer P π ρ →* W :=
  π.comp (twistedWildCentralizer P π ρ).subtype

theorem kernel (g : L) (hg : π g = 1) :
    g ∈ twistedWildCentralizer P π ρ ↔ ∀ p : P, g * ρ p = ρ p * g := by sorry
end twistedWildCentralizer

/-- Ordinary splitting using an actual extending group homomorphism. The inverse
maps c to (c phi(pi c)^-1, pi c); the action is conjugation by phi. -/
def twistedWildCentralizer.splitEquiv (φ : W →* L) (hπ : π.comp φ = MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ)
    (α : W →* MulAut ↥(Subgroup.centralizer (Set.range ρ) ⊓ π.ker))
    (hα : ∀ w c, (α w c).val = φ w * c.val * (φ w)⁻¹) :
    twistedWildCentralizer P π ρ ≃*
      SemidirectProduct ↥(Subgroup.centralizer (Set.range ρ) ⊓ π.ker) W α := by sorry

-- wild_centralizer_trivial
example : twistedWildCentralizer P π (1 : P →* L) = ⊤ := by sorry

-- wild_centralizer_kernel
example (g : L) (hg : π g = 1) :
    g ∈ twistedWildCentralizer P π ρ ↔ ∀ p : P, g * ρ p = ρ p * g := by sorry
-- wild_centralizer_twist
example (φ : W →* L) (hπ : π.comp φ = MonoidHom.id W)
    (hρ : φ.comp P.subtype = ρ) (w : W)
    (hNoncomm : ∃ p : P, φ w * ρ p ≠ ρ p * φ w) :
    φ w ∈ twistedWildCentralizer P π ρ ∧
      φ w ∉ Subgroup.centralizer (Set.range ρ) := by sorry
end TwistedCentralizer

/-- The quotient carrier, with the intrinsic central subgroup supplied explicitly.
The missing identification with Z(H)^W is not encoded by a placeholder field. -/
def wildEnhancementGroup {L : Type u} [Group L] (C : Subgroup L)
    (Z : Subgroup (Subgroup.center C)) [Z.Normal] := (Subgroup.center C) ⧸ Z

section Invariants
variable {R : Type u} {A : Type v} [CommRing R] [CommRing A] [Algebra R A]
  {B : Type w} [CommRing B] [Algebra R B]

/-- Equaliser of a supplied coaction and the canonical map a ↦ a ⊗ 1.
For the group-scheme instance B is A ⊗ O(H), δ is the coaction and ι is
the canonical map. Their geometric construction is supplied by RG/SF.1.
Invariants of the abstract group H(R) do not suffice over finite fields. -/
def ParameterInvariantAlgebra (δ ι : A →ₐ[R] B) : Subalgebra R A where
  carrier := {a | δ a = ι a}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  algebraMap_mem' := by sorry

namespace ParameterInvariantAlgebra
variable (δ ι : A →ₐ[R] B)
def inclusion : ParameterInvariantAlgebra δ ι →ₐ[R] A :=
  (ParameterInvariantAlgebra δ ι).val

theorem mem_iff (a : A) : a ∈ ParameterInvariantAlgebra δ ι ↔ δ a = ι a := by sorry

def lift {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c)) :
    C →ₐ[R] ParameterInvariantAlgebra δ ι := by sorry

theorem lift_comp {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c)) :
    (inclusion δ ι).comp (lift δ ι f hf) = f := by sorry
end ParameterInvariantAlgebra

-- coarse_trivial_group, and the torus case when its action is trivial.
example (ι : A →ₐ[R] B) : ParameterInvariantAlgebra ι ι = ⊤ := by sorry

-- coarse_affine_universal
example (δ ι : A →ₐ[R] B) {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c)) :
    ∃! g : C →ₐ[R] ParameterInvariantAlgebra δ ι,
      (ParameterInvariantAlgebra.inclusion δ ι).comp g = f := by sorry
end Invariants

section Reducibility
variable {G : Type u} [Group G]

/-- Predicates for supplied parabolic/Levi families. Their geometric construction is RG's. -/
def IsGCompletelyReducible (parabolics : Set (Subgroup G))
    (levis : Subgroup G → Set (Subgroup G)) (H : Subgroup G) : Prop :=
  ∀ P ∈ parabolics, H ≤ P → ∃ L ∈ levis P, H ≤ L

def IsGIrreducible (parabolics : Set (Subgroup G)) (H : Subgroup G) : Prop :=
  ∀ P ∈ parabolics, H ≤ P → P = ⊤

theorem IsGIrreducible.completelyReducible
    (parabolics : Set (Subgroup G)) (levis : Subgroup G → Set (Subgroup G))
    (hTop : (⊤ : Subgroup G) ∈ levis ⊤) (H : Subgroup G)
    (h : IsGIrreducible parabolics H) : IsGCompletelyReducible parabolics levis H := by
  sorry

-- cr_trivial: a supplied Levi in each parabolic contains the trivial subgroup.
example (parabolics : Set (Subgroup G)) (levis : Subgroup G → Set (Subgroup G))
    (h : ∀ P ∈ parabolics, (levis P).Nonempty) :
    IsGCompletelyReducible parabolics levis ⊥ := by sorry

-- semisimple_torus: the geometric torus parabolic family is {top}.
example (H : Subgroup G) :
    IsGCompletelyReducible {⊤} (fun _ => {⊤}) H := by sorry
end Reducibility

section FreeIndex
variable (Γ : Type u) [Group Γ]

structure FreeCocycleIndex where
  rank : ℕ
  tuple : FreeGroup (Fin rank) →* Γ

namespace FreeCocycleIndex
structure Hom (a b : FreeCocycleIndex Γ) where
  word : FreeGroup (Fin a.rank) →* FreeGroup (Fin b.rank)
  comm : b.tuple.comp word = a.tuple

instance : SmallCategory (FreeCocycleIndex Γ) where
  Hom a b := ULift.{u} (Hom Γ a b)
  id a := ⟨⟨MonoidHom.id _, by sorry⟩⟩
  comp f g := ⟨⟨g.down.word.comp f.down.word, by sorry⟩⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

/-- Tuple constructor using the pinned free-group universal property. -/
def ofTuple (n : ℕ) (γ : Fin n → Γ) : FreeCocycleIndex Γ := ⟨n, FreeGroup.lift γ⟩

def coproduct (a b : FreeCocycleIndex Γ) : FreeCocycleIndex Γ := by sorry

-- index_zero
example : IsInitial (ofTuple Γ 0 (fun i => Fin.elim0 i)) := by sorry

-- index_coproduct
example (a b : FreeCocycleIndex Γ) : (coproduct Γ a b).rank = a.rank + b.rank := by sorry
end FreeCocycleIndex
end FreeIndex

section Excursion
variable {Γ : Type u} [Group Γ]
/-- The supplied diagram consists of the free-cocycle invariant rings.
CommRingCat is the underlying-ring prototype; the Z_l-algebra enhancement is omitted. -/
noncomputable def ExcursionAlgebra (F : FreeCocycleIndex Γ ⥤ CommRingCat.{u}) :
    CommRingCat.{u} := colimit F

namespace ExcursionAlgebra
noncomputable def ofFree (F : FreeCocycleIndex Γ ⥤ CommRingCat.{u})
    (a : FreeCocycleIndex Γ) : F.obj a ⟶ ExcursionAlgebra F := colimit.ι F a

noncomputable def lift (F : FreeCocycleIndex Γ ⥤ CommRingCat.{u})
    (s : Cocone F) : ExcursionAlgebra F ⟶ s.pt := colimit.desc F s

-- excursion_lift_eval
example (F : FreeCocycleIndex Γ ⥤ CommRingCat.{u}) (s : Cocone F)
    (a : FreeCocycleIndex Γ) : ofFree F a ≫ lift F s = s.ι.app a := by sorry
end ExcursionAlgebra
end Excursion

section Pseudocharacters
variable {Γ : Type u} [Group Γ]

def orderedFiberProduct {m n : ℕ} (u : Fin m → Fin n) (γ : Fin m → Γ) : Fin n → Γ :=
  fun i => (((List.finRange m).filter (fun j => u j = i)).map γ).prod

variable {R : Type v} {A : Type w} [CommRing R] [CommRing A] [Algebra R A]
  (D : ℕ → Type v) [∀ n, CommRing (D n)] [∀ n, Algebra R (D n)]
  (reindex : ∀ {m n}, (Fin m → Fin n) → D m →ₐ[R] D n)
  (multiply : ∀ {m n}, (Fin m → Fin n) → D n →ₐ[R] D m)

/-- Exact untwisted excursion relations for a supplied invariant-ring diagram.
The geometric identification D n = O(H^n)^H and the finite-Q linearity condition
are supplier inputs, not unspecified proposition-valued fields. -/
structure ReductivePseudocharacter where
  Θ : ∀ n, 0 < n → D n →ₐ[R] ((Fin n → Γ) → A)
  reindex_law : ∀ {m n} (hm : 0 < m) (hn : 0 < n)
    (u : Fin m → Fin n) (f : D m) (γ : Fin n → Γ),
    Θ n hn (reindex u f) γ = Θ m hm f (fun j => γ (u j))
  multiply_law : ∀ {m n} (hm : 0 < m) (hn : 0 < n)
    (u : Fin m → Fin n) (f : D n) (γ : Fin m → Γ),
    Θ m hm (multiply u f) γ = Θ n hn f (orderedFiberProduct u γ)

namespace ReductivePseudocharacter
@[ext] theorem ext (c d : ReductivePseudocharacter (Γ := Γ) (A := A) D reindex multiply)
    (h : ∀ n hn f γ, c.Θ n hn f γ = d.Θ n hn f γ) : c = d := by sorry

def map {B : Type w} [CommRing B] [Algebra R B]
    (c : ReductivePseudocharacter (Γ := Γ) (A := A) D reindex multiply)
    (f : A →ₐ[R] B) : ReductivePseudocharacter (Γ := Γ) (A := B) D reindex multiply := by
  sorry

def precomp {Γ' : Type u} [Group Γ']
    (c : ReductivePseudocharacter (Γ := Γ) (A := A) D reindex multiply)
    (f : Γ' →* Γ) : ReductivePseudocharacter (Γ := Γ') (A := A) D reindex multiply := by
  sorry

-- Additional ordinary tuple check; this is not the geometric pseudocharacter_trivial_group test.
example (c : ReductivePseudocharacter (Γ := Unit) (A := A) D reindex multiply)
    (n : ℕ) (hn : 0 < n) (f : D n) (γ δ : Fin n → Unit) :
    c.Θ n hn f γ = c.Θ n hn f δ := by sorry

-- pseudochar_map
example (c : ReductivePseudocharacter (Γ := Γ) (A := A) D reindex multiply) :
    c.map D reindex multiply (AlgHom.id R A) = c := by sorry

def IsContinuous [TopologicalSpace Γ] [TopologicalSpace A]
    (c : ReductivePseudocharacter (Γ := Γ) (A := A) D reindex multiply) : Prop :=
  ∀ n hn f, Continuous (c.Θ n hn f)
end ReductivePseudocharacter
end Pseudocharacters

section MatrixCoefficients
variable {R : Type u} [CommRing R] {I : Type v} [Fintype I]
  {Γ H G : Type w} [Group Γ] [Group H] [Group G]
  {V : Type z} [AddCommGroup V] [Module R V]

/-- The linear-algebra portion; the integral algebraic representation condition is omitted. -/
structure ExcursionDatum (ι : H →* G) where
  representation : Representation R (I → G) V
  α : V
  β : V →ₗ[R] R
  α_fixed : ∀ h, representation (fun _ => ι h) α = α
  β_fixed : ∀ h, β.comp (representation (fun _ => ι h)) = β
  tuple : I → Γ

def ExcursionDatum.unit (ι : H →* G) :
    ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := R) ι where
  representation := Representation.trivial R (I → G) R
  α := 1
  β := LinearMap.id
  α_fixed := by sorry
  β_fixed := by sorry
  tuple := fun _ => 1

def excursionMatrixCoefficient {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι) (g : I → G) : R :=
  D.β (D.representation g D.α)

namespace excursionMatrixCoefficient
theorem eval {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι) (g : I → G) :
    excursionMatrixCoefficient D g = D.β (D.representation g D.α) := by sorry
end excursionMatrixCoefficient

-- coefficient_unit (the categorical datum_unit requires the omitted Hecke carrier).
example (ι : H →* G) (g : I → G) :
    excursionMatrixCoefficient (ExcursionDatum.unit (R := R) (Γ := Γ) ι) g = 1 := by sorry

-- coefficient_zero
example {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (h : D.α = 0) (g : I → G) : excursionMatrixCoefficient D g = 0 := by sorry

-- coefficient_biinvariant
example {ι : H →* G}
    (D : ExcursionDatum (R := R) (I := I) (Γ := Γ) (V := V) ι)
    (g : I → G) (a b : H) :
    excursionMatrixCoefficient D (fun i => ι a * g i * ι b) =
      excursionMatrixCoefficient D g := by sorry
end MatrixCoefficients

section Trace
variable {Γ : Type u} [Group Γ] {R : Type v} [CommRing R]

noncomputable def cycleWord {n : ℕ} (c : Equiv.Perm (Fin n))
    (γ : Fin n → Γ) (i : Fin n) : Γ :=
  ((List.range (orderOf c)).map (fun j => γ ((c ^ j) i))).prod

/-- Nontrivial cycle factors, together with the fixed one-cycles. -/
noncomputable def traceCycleValue {n : ℕ} (τ : Γ → R)
    (γ : Fin n → Γ) (σ : Equiv.Perm (Fin n)) : R := by
  classical
  exact (∏ c ∈ σ.cycleFactorsFinset,
    if h : c.support.Nonempty then τ (cycleWord c γ (c.support.min' h)) else 1) *
    ∏ i ∈ Finset.univ.filter (fun i => σ i = i), τ (γ i)

structure TracePseudocharacter (Γ : Type u) [Group Γ] (R : Type v) [CommRing R]
    (rank : ℕ) where
  toFun : Γ → R
  normalized : toFun 1 = rank
  central : ∀ x y, toFun (x * y) = toFun (y * x)
  alternating : ∀ γ : Fin (rank + 1) → Γ,
    ∑ σ : Equiv.Perm (Fin (rank + 1)),
      (((Equiv.Perm.sign σ : ℤˣ) : ℤ) : R) * traceCycleValue toFun γ σ = 0

instance {r : ℕ} : CoeFun (TracePseudocharacter Γ R r) (fun _ => Γ → R) :=
  ⟨TracePseudocharacter.toFun⟩

namespace TracePseudocharacter
noncomputable def cycleValue {r n : ℕ} (τ : TracePseudocharacter Γ R r)
    (γ : Fin n → Γ) (σ : Equiv.Perm (Fin n)) : R := traceCycleValue τ γ σ

noncomputable def ofRepresentation {n : ℕ} (ρ : Γ →* (Matrix (Fin n) (Fin n) R)ˣ) :
    TracePseudocharacter Γ R n where
  toFun := fun γ => Matrix.trace (ρ γ : Matrix (Fin n) (Fin n) R)
  normalized := by sorry
  central := by sorry
  alternating := by sorry

noncomputable def map {S : Type w} [CommRing S] {r : ℕ}
    (f : R →+* S) (τ : TracePseudocharacter Γ R r) : TracePseudocharacter Γ S r where
  toFun := fun γ => f (τ γ)
  normalized := by sorry
  central := by sorry
  alternating := by sorry

-- trace_rank_one
example (τ : TracePseudocharacter Γ R 1) (x y : Γ) : τ (x * y) = τ x * τ y := by sorry

-- trace_zero_rank
example (τ : TracePseudocharacter Γ R 0) : ∀ γ, τ γ = 0 := by sorry

-- trace_semisimple_sum
example (χ ψ : Γ →* R) : ∃ τ : TracePseudocharacter Γ R 2,
    ∀ γ, τ γ = χ γ + ψ γ := by sorry

-- trace_not_rank_one_constant
example : ¬ ∃ τ : TracePseudocharacter Γ ℚ 2, ∀ γ, τ γ = 1 := by sorry
end TracePseudocharacter
end Trace

section WeilDeligneGL
variable {W : Type u} [Group W] [TopologicalSpace W]
  {K : Type v} [Field K] [TopologicalSpace K] [DiscreteTopology K] (n : ℕ)

/-- Split GL_n prototype. The source's general dual group and finite-Q action
remain absent rather than being encoded by unverified fields. With geometric
degree, norm(σ) = q⁻¹ for σ⁻¹ τ σ = τ^q; arithmetic Frobenius has norm q. -/
structure WeilDeligneParameter (norm : W →* Kˣ) where
  cocycle : W →* (Matrix (Fin n) (Fin n) K)ˣ
  continuous : Continuous (fun w => (cocycle w : Matrix (Fin n) (Fin n) K))
  monodromy : Matrix (Fin n) (Fin n) K
  nilpotent : IsNilpotent monodromy
  scales : ∀ w, (cocycle w : Matrix (Fin n) (Fin n) K) * monodromy *
    ((cocycle w)⁻¹).val = (norm w : K) • monodromy

namespace WeilDeligneParameter
@[ext] theorem ext {norm : W →* Kˣ} {φ ψ : WeilDeligneParameter n norm}
    (hφ : φ.cocycle = ψ.cocycle) (hN : φ.monodromy = ψ.monodromy) :
    φ = ψ := by sorry

noncomputable def zeroMonodromy (norm : W →* Kˣ)
    (ρ : W →* (Matrix (Fin n) (Fin n) K)ˣ)
    (hρ : Continuous (fun w => (ρ w : Matrix (Fin n) (Fin n) K))) :
    WeilDeligneParameter n norm := by sorry

noncomputable def gauge (norm : W →* Kˣ) (φ : WeilDeligneParameter n norm)
    (g : (Matrix (Fin n) (Fin n) K)ˣ) : WeilDeligneParameter n norm := by sorry

theorem gauge_monodromy (norm : W →* Kˣ) (φ : WeilDeligneParameter n norm)
    (g : (Matrix (Fin n) (Fin n) K)ˣ) :
    (gauge n norm φ g).monodromy = g.val * φ.monodromy * (g⁻¹).val := by sorry

theorem gauge_cocycle (norm : W →* Kˣ) (φ : WeilDeligneParameter n norm)
    (g : (Matrix (Fin n) (Fin n) K)ˣ) (w : W) :
    (gauge n norm φ g).cocycle w = g * φ.cocycle w * g⁻¹ := by sorry

-- WD_gauge: the zero-monodromy portion of the full equality test.
example (norm : W →* Kˣ) (ρ : W →* (Matrix (Fin n) (Fin n) K)ˣ)
    (hρ : Continuous (fun w => (ρ w : Matrix (Fin n) (Fin n) K)))
    (g : (Matrix (Fin n) (Fin n) K)ˣ) :
    (gauge n norm (zeroMonodromy n norm ρ hρ) g).monodromy = 0 := by sorry

-- WD_unramified (the zero-monodromy construction works for every discrete continuous ρ).
example (norm : W →* Kˣ) (ρ : W →* (Matrix (Fin n) (Fin n) K)ˣ)
    (hρ : Continuous (fun w => (ρ w : Matrix (Fin n) (Fin n) K))) :
    (zeroMonodromy n norm ρ hρ).monodromy = 0 := by sorry

-- WD_torus, for GL_1.
example (norm : W →* Kˣ) (φ : WeilDeligneParameter 1 norm) : φ.monodromy = 0 := by sorry
end WeilDeligneParameter

-- WD_geometric_frobenius: the matrix computation fixing the scaling convention
-- for q = 3 and N = E₁₂. The full Weil-group/logarithm comparison remains omitted.
example :
    let N : Matrix (Fin 2) (Fin 2) ℚ := fun i j => if i = 0 ∧ j = 1 then 1 else 0
    let F := Matrix.diagonal (fun i : Fin 2 => if i = 0 then (1 / 3 : ℚ) else 1)
    let FInv := Matrix.diagonal (fun i : Fin 2 => if i = 0 then (3 : ℚ) else 1)
    F * N * FInv = (1 / 3 : ℚ) • N := by sorry
end WeilDeligneGL

section DualGL
/-- GL_n trace-pairing shadow of the dual nullcone, not a definition for every H. -/
def dualNilpotentCone (n : ℕ) (K : Type u) [Field K] :
    Set (Matrix (Fin n) (Fin n) K) := {N | IsNilpotent N}

def NilpotentSingularSupport {n : ℕ} {K : Type u} [Field K]
    (support : Set (Matrix (Fin n) (Fin n) K)) : Prop := support ⊆ dualNilpotentCone n K

example {n : ℕ} {K : Type u} [Field K] :
    NilpotentSingularSupport ({0} : Set (Matrix (Fin n) (Fin n) K)) := by sorry
end DualGL

/-
Baseline checks omitted from elaboration because the existing shared build lacks
TauCeti.GroupTheory.FixedSubgroup. The actual source statements were read:
for Θ:G≃*G, g∈TauCeti.fixedSubgroup Θ.toMonoidHom iff Θ g=g;
TauCeti.fixedSubgroup (MonoidHom.id G)=top. They are point-group statements;
no scheme-theoretic smoothness or reductivity follows from them.
-/

end TauCeti.LanglandsParameterStacks

/-
API and test signature inventory

This inventory is a mathematical specification, not additional Lean declarations.
Every packet definition/construction, API name, test name and theorem target is
listed. A named prototype or example above can express only a stated shadow.
Unavailable full signatures are explicitly left out (Protocol section 13, gap G3);
no True goals, proposition-valued placeholders or fake future carriers replace them.
The document and packet give the full hypotheses and proof outlines.

LanglandsParameterStacks:LP0/functoriality-of-cocycles
Crossed cocycles and gauge action (construction).
Scope: The algebraic group signatures are expressed above. The continuous gauge/transport version and the Cech-to-group-cocycle descent comparison require SF.1 and the continuous/condensed action interface.
API CrossedCocycle [data]: Maps with the crossed multiplication law. Named prototype above; scope limited as stated.
API CrossedCocycle.ext [extensionality]: Pointwise equality implies equality of cocycles. Named prototype above; scope limited as stated.
API CrossedCocycle.map_one [simp]: c(1)=1. Named prototype above; scope limited as stated.
API CrossedCocycle.map_inv [simp]: c(γ⁻¹)=α(γ⁻¹)(c(γ)⁻¹). Named prototype above; scope limited as stated.
API CrossedCocycle.gauge [functoriality]: The H-action h·c has the displayed formula and satisfies one and multiplication laws. Named prototype above; scope limited as stated.
API CrossedCocycle.restrict [functoriality]: Precompose a group homomorphism; restrict the action, with identity and composition laws. Named prototype above; scope limited as stated.
API CrossedCocycle.map [functoriality]: An α-equivariant homomorphism H→H′ maps c pointwise; identity, composition and gauge compatibility. Named prototype above; scope limited as stated.
API CrossedCocycle.sectionEquiv [equivalence]: Cocycles are the sections of H⋊Γ→Γ. Named prototype above; scope limited as stated.
API CrossedCocycle.orbit [projection]: The gauge class in nonabelian H¹, compatible with restrictions. Named prototype above; scope limited as stated.
TEST cocycle_trivial_action [compatibility]: For trivial α, crossed cocycles are precisely group homomorphisms Γ→H. Typed example above for the stated prototype scope.
TEST cocycle_trivial_group [degenerate]: For Γ=1 there is exactly one crossed cocycle. Typed example above for the stated prototype scope.
TEST cocycle_coboundary [computation]: The gauge of the unit cocycle by h evaluates to h α(γ)(h)⁻¹. Typed example above for the stated prototype scope.
TEST cocycle_not_hom [non-example]: Let Γ=C₂ act on H=ℤ additively by negation. The cocycle c(s)=1 satisfies c(s²)=1−1=0, but is not a homomorphism C₂→ℤ. Typed example above for the stated prototype scope.

LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters
Condensed L-parameters (definition).
Scope: The typed LParameter is the continuous-group shadow. The relatively discrete condensed algebra tensor and its finite-type section criterion are absent; CFT/LocalFieldsRamification/RG2.5/E5 must supply the Weil group, integral algebraic points, action and coefficient functor. asSection is currently an extraction map, not the full condensed equivalence; its projection test is expressed.
API condensedCoefficients [structure]: The relatively discrete condensed coefficient algebra with its finite-type continuous sections. Full signature omitted pending the carriers named in Scope.
API LParameter [data]: A condensed crossed cocycle for the standard action. Named prototype above; scope limited as stated.
API LParameter.asSection [equivalence]: Cocycles and sections are naturally equivalent. Named prototype above; scope limited as stated.
API LParameter.asLift [equivalence]: Sections and lifts to H⋊Q are naturally equivalent. Full signature omitted pending the carriers named in Scope.
API LParameter.matrixCriterion [characterisation]: For a closed embedding H⋊Q→GL_N, restriction to inertia has finite-type continuous matrix coefficients. Full signature omitted pending the carriers named in Scope.
API LParameter.restrictWild [projection]: Restriction to wild inertia with the same action and coefficient convention. Named prototype above; scope limited as stated.
TEST parameter_split_torus [computation]: For H=G_m with trivial action, parameters are continuous multiplicative characters with the prescribed coefficient convention. Typed example above for the stated prototype scope.
TEST parameter_char_l [computation]: For an F_l-algebra Λ the relatively discrete condensed structure is discrete; inertia restrictions are locally constant. Full example omitted pending the carriers named in Scope.
TEST parameter_section [compatibility]: The projection of asSection(φ)(w) equals w, and its first coordinate equals φ(w). Typed example above for the stated prototype scope.
TEST parameter_not_discrete_Ql [non-example]: For Λ=Q_l the convention admits continuous infinite-image Z_l-valued inertia characters; imposing discrete coefficients would exclude them. Full example omitted pending the carriers named in Scope.
API LParameter.ext [extensionality]: Equality of the underlying condensed cocycle on every test object and section implies equality of parameters. Typed continuous-group extensionality below its prototype; the full condensed version uses test-object extensionality.
API LParameter.gauge [functoriality]: The dual group acts by h·φ(w)=hφ(w)(w·h)⁻¹; this preserves the relatively discrete coefficient and continuous cocycle conditions, with identity and multiplication laws. Full signature omitted pending the enhanced/condensed carriers named in Scope.

LanglandsParameterStacks:LP0/finite-wild-ramification
Finite wild ramification (definition).
Scope: The point-group predicate and inclusions are expressed. The theorem that every parameter has finite wild ramification needs the specific Weil pro-p/ell-adic coefficient inputs from LocalFieldsRamification and the relatively discrete convention, not an arbitrary topological group.
API FiniteWildRamification [characterisation]: There exists an open wild kernel. Named prototype above; scope limited as stated.
API FiniteWildPiece [data]: The subfunctor of parameters trivial on P. Named prototype above; scope limited as stated.
API FiniteWildPiece.inflate [functoriality]: For P′⊂P, inflation embeds the P-piece in the P′-piece. Named prototype above; scope limited as stated.
API LParameter.finiteWild [other]: Every parameter with these coefficients has finite wild ramification. Full signature omitted pending the carriers named in Scope.
TEST wild_unramified [degenerate]: An unramified parameter lies in the piece P=P_E when Q is unramified. Typed example above for the stated prototype scope.
TEST wild_piece_order [characterisation]: For P′⊂P, triviality on P implies triviality on P′; the inflation direction is this way. Typed example above for the stated prototype scope.
TEST wild_finite_image [compatibility]: For coefficients in a finite extension of Q_l the condition means the usual finite image on wild inertia. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP0/discretization-and-unique-extension
Discrete Weil groups and unique extension (theorem).
Target statement (not an elaborated theorem signature): For open normal P as above choose tame τ and geometric Frobenius σ. The dense group W⊂W_E/P generated by P_E/P, τ^{Z[1/p]} and σ is finitely presented, with σ⁻¹τσ=τ^q and the finite-wild conjugation relations. Restriction identifies condensed parameters trivial on P with crossed cocycles on W whose wild restriction is continuous (automatic for finite P_E/P).
Required full carriers: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group; ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP0/change-of-discretization
Change of discrete Weil model (comparison).
Target statement (not an elaborated theorem signature): Any two choices of dense discrete W₁,W₂ inside the same W_E/P yield canonically equivalent cocycle functors over Z_l: extend to W_E/P, then restrict. The comparisons obey identity and composition. Over Z[1/p] the framed models need not be canonically choice independent; only their Z_l base changes have this universal continuous extension comparison.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP0/wild-inertial-parameter
Wild inertial parameters (definition).
Scope: The typed subtype requires an actual extending homomorphism, and forgets the extension witness. It leaves out admissibility, the prescribed Weil projection and SL2(C), whose complex enhanced carrier is requested from RG2.5 as an extension. Consequently the typed trivial/conjugacy tests check the group shadow only.
API WildInertialParameter [data]: A wild homomorphism together with existence of an admissible extension. Named prototype above; scope limited as stated.
API WildInertialParameter.conjugate [functoriality]: H-conjugation preserves extendibility. Named prototype above; scope limited as stated.
API WildInertialParameter.ofLanglands [constructor]: Restrict an admissible complex Langlands parameter. Named prototype above; scope limited as stated.
API WildInertialParameter.ext [extensionality]: The underlying homomorphism determines this subtype; the extension is not chosen data. Named prototype above; scope limited as stated.
TEST wild_inertial_trivial [degenerate]: The wild parameter with trivial dual-group component, ρ(p)=(1,p), is extendible by the standard unramified admissible parameter. Typed example above for the stated prototype scope.
TEST wild_inertial_conjugate [compatibility]: Restriction of hφh⁻¹ equals hρh⁻¹. Typed example above for the stated prototype scope.
TEST wild_inertial_extension_not_data [characterisation]: Two admissible extensions with the same ρ define the same WildInertialParameter. Typed example above for the stated prototype scope.

LanglandsParameterStacks:LP0/twisted-wild-centralizer
Twisted wild centralizers (construction).
Scope: The twisted subgroup, projection, kernel and semidirect splitting are expressed for an actual normal subgroup and an extending section. The kernel in the splitting is the intersection of the ordinary centralizer with ker(pi); the L-group identifies it with C_H(rho). The scheme and complex L-group identifications require RG2.5.
API twistedWildCentralizer [data]: The displayed subgroup of the L-group. Named prototype above; scope limited as stated.
API twistedWildCentralizer.mem_iff [characterisation]: Membership is the twisted equation for every p. Named prototype above; scope limited as stated.
API twistedWildCentralizer.projection [projection]: The group projection to W_F. Named prototype above; scope limited as stated.
API twistedWildCentralizer.kernel [characterisation]: Its kernel is C_H(ρ). Named prototype above; scope limited as stated.
API twistedWildCentralizer.splitEquiv [equivalence]: A chosen extension gives C_H(ρ)⋊_{Ad φ}W_F. Named prototype above; scope limited as stated.
TEST wild_centralizer_trivial [degenerate]: For ρ(p)=(1,p) and trivial P_F-action on H, the twisted centralizer is the whole L-group; this is not the constant homomorphism into a group projecting to P_F. Typed example above for the stated prototype scope.
TEST wild_centralizer_kernel [compatibility]: Elements above w=1 are exactly the usual dual-group centralizer. Typed example above for the stated prototype scope.
TEST wild_centralizer_twist [non-example]: For any extension φ, φ(w) lies in the twisted centralizer even when it does not commute with every ρ(p). Typed example above for the stated prototype scope.

LanglandsParameterStacks:LP0/wild-enhancement-group
Wild enhancement groups (definition).
Scope: The typed quotient is the centre of C by an explicitly supplied central subgroup. The intrinsic Z(H)^W embedding, its comparison after a chosen extension, S_phi and the algebraic complex enhancement representation interface must be supplied by RG2.5. No arbitrary quotient is claimed to have those identifications.
API wildEnhancementGroup [data]: The quotient of the intrinsic twisted centralizer centre. Named prototype above; scope limited as stated.
API wildEnhancementGroup.centerIdentification [equivalence]: Using φ identifies it with Z(C_H(ρ))^{φ(W_F)}/Z(H)^{W_F}. Full signature omitted pending the carriers named in Scope.
API wildEnhancementGroup.restrictRep [functoriality]: Inflate from S_φ and restrict to the centre, descending to S_ρ. Full signature omitted pending the carriers named in Scope.
API wildEnhancementGroup.conjugateEquiv [equivalence]: Dual-group conjugation transports the quotient and its representations. Full signature omitted pending the carriers named in Scope.
TEST wild_enhancement_trivial_rho [computation]: For the trivial dual-group component ρ(p)=(1,p), the numerator is Z(H)^{W_F}, so S_ρ is trivial. Full example omitted pending the carriers named in Scope.
TEST wild_enhancement_center_quotient [characterisation]: The restricted representation is trivial on Z(H)^{W_F}. Full example omitted pending the carriers named in Scope.
TEST wild_enhancement_conjugacy [compatibility]: Conjugating φ and ρ transports the restricted representation by the induced S_ρ equivalence. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP0/extended-wild-parameters
Extended wild inertial parameters (definition).
Scope: The admissible W x SL2(C) parameter, its component-group enhancement, algebraic centre quotient, restriction functor and dual conjugation on pairs require the RG2.5 complex extension. The existential restriction condition is specified here; no bare representation is asserted extendible or irreducible.
API ExtendedWildParameter [data]: Pairs satisfying the enhancement extension condition. Full signature omitted pending the carriers named in Scope.
API WildParameterClasses [data]: H-conjugacy classes of extended wild pairs. Full signature omitted pending the carriers named in Scope.
API restrictEnhancedParameter [functoriality]: The well-defined map Res on classes. Full signature omitted pending the carriers named in Scope.
API ExtendedWildParameter.forget [projection]: Forget the enhancement to the wild conjugacy class. Full signature omitted pending the carriers named in Scope.
TEST extended_wild_unramified [degenerate]: For trivial ρ the restriction enhancement is the trivial S_ρ representation on the underlying vector space, whose dimension need not be one. Full example omitted pending the carriers named in Scope.
TEST extended_wild_conjugacy [characterisation]: Conjugate enhanced Langlands parameters have the same WildParameterClasses image. Full example omitted pending the carriers named in Scope.
TEST extended_wild_forget [compatibility]: Forgetting Res(φ,χ_φ) equals the conjugacy class of φ|P_F. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p
Integral finite-wild cocycle schemes (construction).
Scope: Scheme exists at the baseline, but the integral reductive functor of points, action and coordinate Hopf-algebra carrier requested from RG2.5, and its closed-scheme representing interface requested from SF.1, are not yet available as the full carrier. No fake scheme object is introduced for them.
API IntegralCocycleScheme [data]: The representing affine finite-presentation scheme over Z[1/p]. Full signature omitted pending the carriers named in Scope.
API IntegralCocycleScheme.pointsEquiv [universal-property]: A-points are crossed cocycles W→H(A), naturally in A. Full signature omitted pending the carriers named in Scope.
API IntegralCocycleScheme.universalCocycle [projection]: Evaluation at w gives the universal cocycle, satisfying the crossed multiplication law. Full signature omitted pending the carriers named in Scope.
API IntegralCocycleScheme.gaugeAction [structure]: Twisted conjugation is an algebraic H-action. Full signature omitted pending the carriers named in Scope.
API IntegralCocycleScheme.baseChange [compatibility]: The base change represents cocycles for the base-changed H and action. Full signature omitted pending the carriers named in Scope.
API IntegralCocycleScheme.presentationEquiv [equivalence]: Two finite presentations of the same W give canonical mutually inverse scheme isomorphisms. Full signature omitted pending the carriers named in Scope.
TEST scheme_free_group [computation]: For W=F_n the cocycle scheme is H^n with twisted conjugation. Full example omitted pending the carriers named in Scope.
TEST scheme_trivial_group [degenerate]: For W=1 it is Spec Z[1/p]. Full example omitted pending the carriers named in Scope.
TEST scheme_tame_torus [computation]: For H=G_m and unramified action, the tame scheme has coordinates s∈G_m, t∈μ_{q−1}; it is G_m×μ_{q−1}. Full example omitted pending the carriers named in Scope.
TEST scheme_l_adic [compatibility]: Its Z_l-points functor on Z_l-algebras agrees with the corresponding finite-wild condensed parameter functor. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP1/decomposition-by-wild-kernel
Clopen finite-wild pieces (lemma).
Target statement (not an elaborated theorem signature): Z¹(W_E,H) is the filtered union of its finite-wild pieces Z¹(W_E/P,H). For P′⊂P these are open and closed subschemes inside the P′-piece; the union is a disjoint union of affine finite-type schemes after separating the clopen wild-kernel strata.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic
Weil cohomology dimension and Euler characteristic (theorem).
Target statement (not an elaborated theorem signature): For a finite-rank free relatively discrete Λ-module M with condensed W_E-action and l≠p, RΓ(W_E,M) has perfect amplitude [0,2] and Euler characteristic zero. For field coefficients dim H⁰−dim H¹+dim H²=0. The same calculation on a finite-wild dense W gives the derived deformation complex.
Required full carriers: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group; tauceti:TauCeti.ContinuousCohomology.continuousCohomologyFunctor; EnhancedDerivedSheaves:E5:presentability. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/dimension-bound-lemma
Frobenius-tame dimension bound (lemma).
Target statement (not an elaborated theorem signature): Let H/F_l be smooth with reductive identity component. For the prescribed action of σ on Z/l^mZ, the variety Hom(Z/l^mZ⋊σZ,H) has dimension at most dim H. Consequently each geometric fibre of the finite-wild cocycle scheme has dimension at most dim H of the dual group.
Required full carriers: ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/representability-flatness-and-lci
Flat complete-intersection parameter schemes (theorem).
Target statement (not an elaborated theorem signature): Each finite-wild Z¹(W,H) over Z[1/p] is flat and a relative local complete intersection of relative dimension dim H; its total dimension is dim H+1. After base change to Z_l these schemes represent finite-wild parameters, and their clopen union represents all condensed L-parameters. The quotient [Z¹/H] has expected relative dimension zero.
Required full carriers: DeformationAndDerivedPatchingAlgebra:R03.3; SchemeAndStackFoundations:SF.1. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/independent-source-and-dimension-normalisation
DHKM and FS integral models (comparison).
Target statement (not an elaborated theorem signature): DHKM W_F^0 uses arithmetic Frobenius and the same dense tame subgroup as FS W after σ=Fr⁻¹. The finite-presentation cocycle schemes agree for matched choices over Z[1/p]; FS Z_l models are their base changes. Canonical independence of choices follows over Z_l from continuous extension, not for the framed Z[1/p]-models. DHKM dimension dim H+1 is absolute; FS dim H is relative.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/derived-parameter-stack
Derived parameter stacks (construction).
Scope: The animated framed mapping/quotient stack, derived fpqc descent and full Perf pullback interfaces are E5/SF.1/S.1 requests. The ordinary Scheme carrier cannot replace this derived object.
API DerivedParameterStack [data]: Mapping stack over BQ with the fixed quotient map. Full signature omitted pending the carriers named in Scope.
API DerivedParameterStack.framed [data]: Its base-point-framed fibre. Full signature omitted pending the carriers named in Scope.
API DerivedParameterStack.forgetFraming [projection]: Quotient of the framed stack by H. Full signature omitted pending the carriers named in Scope.
API DerivedParameterStack.classicalPoints [compatibility]: Classical ring points are ordinary crossed cocycles modulo gauge. Full signature omitted pending the carriers named in Scope.
API DerivedParameterStack.perfectPullback [functoriality]: Restriction and coefficient base change preserve locally perfect complexes by the imported S.1 interface. Full signature omitted pending the carriers named in Scope.
TEST derived_stack_trivial_group [degenerate]: For W=1 over the trivial quotient the unframed stack is BH, and its framed space is a point. Full example omitted pending the carriers named in Scope.
TEST derived_stack_free_group [computation]: For W=F_n with trivial quotient the stack is [H^n/H] and the framed space H^n. Full example omitted pending the carriers named in Scope.
TEST derived_stack_gauge [compatibility]: Changing a base-point framing by h acts by c(γ)↦h c(γ)α(γ)(h)⁻¹. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme
Classicality of the derived cocycle scheme (theorem).
Target statement (not an elaborated theorem signature): The derived framed cocycle scheme of a finite-wild W is classical and equals IntegralCocycleScheme base changed to Z_l. The unframed derived stack equals [Z¹(W,H)/H].
Required full carriers: DerivedDeRhamCohomology:DD.0; EnhancedDerivedSheaves:E5:animation. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/local-tate-duality
Local Tate duality for Weil cochains (theorem).
Target statement (not an elaborated theorem signature): For a finite-rank free Λ-module M with condensed W_E-action, RΓ(W_E,M) is perfect and there is a natural duality RΓ(W_E,M)^∨ ≃ RΓ(W_E,M^∨(1))[2].
Required full carriers: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group; EnhancedDerivedSheaves:E5:presentability. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory
Cotangent complexes of parameter stacks (theorem).
Target statement (not an elaborated theorem signature): At φ over Λ the tangent complex of [Z¹(W_E,H)/H] is RΓ(W_E,Lie(H)_{Ad φ})[1]. Its dual, the pullback cotangent complex, is RΓ(W_E,Lie(H)^*_{Ad φ}(1))[1]. Thus H⁰ of the adjoint cochains gives infinitesimal automorphisms, H¹ gives deformations and H² gives obstructions.
Required full carriers: DerivedDeRhamCohomology:DD.0; ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/weil-deligne-parameters
Weil–Deligne parameters (definition).
Scope: The typed structure is the split GL_n shadow with discrete continuous cocycle, nilpotent matrix and the supplied norm scaling law. A general integral L-group, Lie action and condensed-to-discrete monodromy comparison require RG2.5/ArithmeticGaloisRepresentations. The gauge test currently proves the zero-monodromy part and its pointwise formula, not a general-group equivalence.
API WeilDeligneParameter [data]: A discrete-inertia cocycle and nilpotent monodromy with scaling q^{−deg(w)} for geometric degree; the split GL_n prototype takes this norm as an explicit homomorphism. Named prototype above; scope limited as stated.
API WeilDeligneParameter.cocycle [projection]: The discrete cocycle φ₀. Named prototype above; scope limited as stated.
API WeilDeligneParameter.monodromy [projection]: N, with its nilpotence and equivariance. Named prototype above; scope limited as stated.
API WeilDeligneParameter.gauge [functoriality]: Gauge conjugates N as well as φ₀. Named prototype above; scope limited as stated.
API WeilDeligneParameter.zeroMonodromy [constructor]: Discrete-inertia cocycles give parameters with N=0. Named prototype above; scope limited as stated.
TEST WD_unramified [degenerate]: For unramified φ₀ and N=0 one obtains a Weil–Deligne parameter. Typed example above for the stated prototype scope.
TEST WD_torus [computation]: For a torus in characteristic zero the nilpotent cone is zero, so every Weil–Deligne parameter has N=0. Typed example above for the stated prototype scope.
TEST WD_gauge [compatibility]: Gauge of zeroMonodromy(φ₀) is zeroMonodromy(h·φ₀). Typed example above for the stated prototype scope.

TEST WD_geometric_frobenius [computation]: In split GL₂ with q=3, N=E₁₂ and φ₀(σ)=diag(1/3,1), conjugation sends N to N/3. This is compatible with σ⁻¹τσ=τ³ and excludes the reciprocal scaling convention. The full inertia parameter is exp(xN). Typed matrix computation above; the full Weil/exp comparison requires the carriers named in Scope.
API WeilDeligneParameter.ext [extensionality]: Equality of the discrete cocycle and of monodromy implies equality of Weil–Deligne parameters; proof fields do not introduce extra data. Named algebraic prototype above; scope limited as stated.

LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map
Monodromy and the Weil–Deligne comparison (comparison).
Target statement (not an elaborated theorem signature): For chosen tame coordinate and Frobenius there is an H-equivariant isomorphism Z¹(W_E,H)_{Q_l}≃Par_WD. On sufficiently small l-primary tame inertia φ(x)=exp(xN). A unipotent power of tame τ gives N=m⁻¹log φ(τ^m); subtracting its exponential gives φ₀ with finite inertia. This constructs the algebraic monodromy morphism to the Lie(H) nilpotent cone.
Required full carriers: ArithmeticGaloisRepresentations:R01.2; ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/singularities-and-singular-support
Singularities of parameter stacks (definition).
Scope: DD.0 supplies full cotangent, R03.3 the syntomic singularities/coherent support extension, and E5 smooth derived descent. The typed matrix nilpotent cone is only the GL_n trace-pairing shadow. It is not the full dual Lie cone or ParameterSingularities; the ordinary zero-support example does not prove the singularity-fibre tests.
API ParameterSingularities [data]: The relative singularity scheme/stack of the parameter stack. Full signature omitted pending the carriers named in Scope.
API ParameterSingularities.fiber [characterisation]: The fibre at φ is H⁰(W_E,Lie(H)^*_{Ad φ}(1)). Full signature omitted pending the carriers named in Scope.
API ParameterSingularities.embed [projection]: Closed inclusion into the dual Lie bundle pulled back from BH. Full signature omitted pending the carriers named in Scope.
API dualNilpotentCone [data]: Covectors with zero in their H-orbit closure. Named prototype above; scope limited as stated.
API NilpotentSingularSupport [characterisation]: The support of a coherent parameter complex is contained in the pullback of dualNilpotentCone. Named prototype above; scope limited as stated.
API ParameterSingularities.smoothPullback [compatibility]: Pullback along smooth parameter charts agrees with the affine singularity construction. Full signature omitted pending the carriers named in Scope.
TEST singularities_smooth [degenerate]: On the smooth locus of a syntomic parameter chart the singularity fibre is zero. Full example omitted pending the carriers named in Scope.
TEST singularities_torus_Ql [computation]: At the trivial torus parameter over Q_l, H⁰(W_E,Q_l(1))=0 and the singularity fibre is zero. Full example omitted pending the carriers named in Scope.
TEST singularities_torus_mod_l [non-example]: For H=G_m and l dividing q−1, the trivial F_l-parameter has one-dimensional singularity fibre although the dual nilpotent cone of the torus is zero. Full example omitted pending the carriers named in Scope.
TEST singularities_dual [compatibility]: If a specified invariant perfect Lie pairing exists, the inclusion transports to the usual Lie nilpotent cone; no such identification is implicit. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP1/hochshild-action-and-support
Hochschild action on parameter complexes (theorem).
Target statement (not an elaborated theorem signature): On any affine syntomic parameter chart B/Z_l, The commutative square-zero-extension map H¹(L^∨)→HH²(B/Z_l) and the Hochschild action give H¹(L^∨)→Ext²_B(N,N), naturally in N. For bounded coherent N the resulting graded Sym_B H¹(L^∨)-module is coherent; its conical support descends to the parameter stack. N is perfect precisely when this support lies in the zero section, and the projection of nonzero support is the complement of its largest perfectness open.
Required full carriers: tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality; DeformationAndDerivedPatchingAlgebra:R03.3; SchemeKTheoryOperations:S.1; EnhancedDerivedSheaves:E5:animation. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone
Nilpotence of singularity fibres (theorem).
Target statement (not an elaborated theorem signature): At φ over a Z_l-field L, the fibre of ParameterSingularities is contained in the dual nilpotent cone if either L is a Q_l-field, or l∤q^{en}−1 for every homogeneous Chevalley invariant degree e, where n is the residue degree of the extension cutting out the outer action. This is an inclusion, not equality.
Required full carriers: ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient
Coarse parameter quotients (construction).
Scope: The typed Subalgebra equalises two supplied algebra homomorphisms, representing the coaction and a↦a⊗1. Their Hopf-algebra/geometric construction, representing affine quotient, inflation and flat base-change theorem require RG2.5/SF.1. Abstract H(base)-point invariants are insufficient; the F₂ scaling example detects the distinction. The typed lift checks the equaliser universal property.
API ParameterInvariantAlgebra [data]: The equaliser of the algebraic coaction A→A⊗O(H) and a↦a⊗1, as a subalgebra of A=O(Z¹); taking fixed elements only under H(base) is insufficient. Named prototype above; scope limited as stated.
API ParameterCoarseQuotient [data]: Its spectrum, separately on each affine finite-wild piece. Full signature omitted pending the carriers named in Scope.
API ParameterCoarseQuotient.quotientMap [projection]: The affine map induced by the invariant inclusion. Full signature omitted pending the carriers named in Scope.
API ParameterCoarseQuotient.lift [universal-property]: Invariant maps to affine schemes factor uniquely, with lift and uniqueness laws. Full signature omitted pending the carriers named in Scope.
API ParameterCoarseQuotient.inflate [functoriality]: Shrinking P gives the compatible coarse map; identity and composition. Full signature omitted pending the carriers named in Scope.
API ParameterInvariantAlgebra.flatBaseChange [compatibility]: For the DVR hypotheses of the next node, flat base change commutes with invariants. Full signature omitted pending the carriers named in Scope.
TEST coarse_trivial_group [degenerate]: For H=1 the invariant algebra is the full coordinate algebra and the quotient map is identity. Typed example above for the stated prototype scope.
TEST coarse_torus [computation]: For a torus with trivial W-action the gauge action is trivial, so the coarse quotient equals the cocycle scheme. Full example omitted pending the carriers named in Scope.
TEST coarse_affine_universal [characterisation]: An invariant affine scalar function descends uniquely, and pulls back to itself. Typed example above for the stated prototype scope.
TEST coarse_not_orbit_set [non-example]: For the SL₂ tuple (nontrivial upper unipotent), its coarse image equals the image of the identity tuple although the two tuples are not conjugate. Full example omitted pending the carriers named in Scope.

TEST coarse_scheme_invariants [non-example]: For the scaling action of the group scheme G_m/F₂ on A=F₂[x], coaction invariants are F₂, while the abstract group G_m(F₂) is trivial and its fixed algebra is all A. The invariant construction must use the coaction. Full example omitted pending the coaction/Hopf-algebra carriers named in Scope.
API ParameterInvariantAlgebra.mem_iff [characterisation]: An element belongs to the invariant subalgebra exactly when its coaction equals a↦a⊗1. Named algebraic prototype above; scope limited as stated.
API ParameterInvariantAlgebra.inclusion [projection]: The canonical algebra injection into the coordinate algebra is injective. Named algebraic prototype above; scope limited as stated.
API ParameterInvariantAlgebra.lift [universal-property]: An algebra map whose image equalises the coaction and a↦a⊗1 factors uniquely through the invariant subalgebra; composing with inclusion recovers the map. Named algebraic prototype above; scope limited as stated.

LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs
Reductive quotient properties over fields and DVRs (theorem).
Target statement (not an elaborated theorem signature): For an integral affine finite-type X over a field with reductive G, X//G is integral finite type and normal if X is normal. Over an excellent coefficient DVR O, assume additionally X is flat; the same properties hold. For every algebraically closed O-field K, coarse K-points are closed G_K-orbits, each fibre has one closed orbit, and invariant closed sets have closed, separated images. Invariants commute with flat O-base change; invariant principal neighbourhoods exist about closed residual orbits.
Required full carriers: ReductiveGroupsPartII:RG2.5; SchemeAndStackFoundations:SF.1. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility
Complete reducibility and strong reductivity (definition).
Scope: The typed predicates quantify over supplied parabolic/Levi families. Their algebraic-geometric carriers and conjugacy transport, strong reductivity, absolute and strong irreducibility require RG2.5. The trivial subgroup and one-parabolic tests check those supplied families, rather than constructing parabolics for a reductive scheme.
API IsGCompletelyReducible [characterisation]: Every containing parabolic admits a containing Levi. Named prototype above; scope limited as stated.
API IsGIrreducible [characterisation]: No proper containing parabolic. Named prototype above; scope limited as stated.
API IsStronglyReductive [characterisation]: No proper containing parabolic in the maximal centralizer torus centralizer. Full signature omitted pending the carriers named in Scope.
API IsAbsolutelyGCompletelyReducible [characterisation]: Apply complete reducibility to the geometric Zariski image. Full signature omitted pending the carriers named in Scope.
API IsStronglyGIrreducible [characterisation]: Irreducibility persists for representations with identical one-variable invariants. Full signature omitted pending the carriers named in Scope.
API IsGCompletelyReducible.conjugate [compatibility]: Each predicate is preserved by G-conjugation. Full signature omitted pending the carriers named in Scope.
API IsGIrreducible.completelyReducible [relation]: G-irreducible implies G-completely reducible. Named prototype above; scope limited as stated.
TEST cr_torus [computation]: A maximal torus of SL₂ is completely reducible but not SL₂-irreducible. Full example omitted pending the carriers named in Scope.
TEST cr_unipotent [non-example]: The upper unipotent root subgroup of SL₂ lies in its Borel and in no Levi of that Borel, hence is not completely reducible. Full example omitted pending the carriers named in Scope.
TEST cr_GL [compatibility]: For GL(V), the Zariski image is completely reducible exactly when V is a semisimple representation. Full example omitted pending the carriers named in Scope.
TEST cr_trivial [degenerate]: The trivial subgroup is completely reducible. Typed example above for the stated prototype scope.

LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion
Closed tuples and Levi semisimplification (theorem).
Target statement (not an elaborated theorem signature): For a tuple x∈G(k)^n, with G connected reductive and k algebraically closed of any characteristic, its orbit is closed iff its generated Zariski subgroup is strongly reductive iff it is G-completely reducible. It is stable iff this subgroup is G-irreducible. Projection along a minimal containing parabolic to a Levi gives a cocharacter limit in the unique closed orbit in the closure. For a completely reducible subgroup, a containing Levi in a minimal parabolic is irreducible; all minimal containing parabolics have the same dimension.
Required full carriers: ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits
Semisimple L-parameters (definition).
Scope: The geometric L-group parabolics, Levi projection, Zariski closure and scheme orbit interfaces are RG2.5 extensions. The torus-family test above is the ordinary completely reducible shadow only.
API IsSemisimpleParameter [characterisation]: The containing-parabolic/containing-Levi property. Full signature omitted pending the carriers named in Scope.
API IsSemisimpleParameter.leviCriterion [characterisation]: Every standard-parabolic factorisation is conjugate to its Levi projection. Full signature omitted pending the carriers named in Scope.
API IsSemisimpleParameter.gauge [compatibility]: The predicate is invariant under gauge conjugation. Full signature omitted pending the carriers named in Scope.
API IsSemisimpleParameter.GL [compatibility]: For split GL_n it agrees with semisimplicity of the underlying linear representation. Full signature omitted pending the carriers named in Scope.
TEST semisimple_torus [computation]: Every parameter into a torus is semisimple because there are no proper parabolics. Full example omitted pending the carriers named in Scope.
TEST semisimple_split_GL [compatibility]: A direct sum of characters into GL_n is semisimple. Full example omitted pending the carriers named in Scope.
TEST semisimple_unipotent [non-example]: A nontrivial unipotent generator representation of Z in SL₂ is not semisimple although all its invariant values agree with the trivial representation. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits
Closed parameter orbits (theorem).
Target statement (not an elaborated theorem signature): For every finite-wild component over algebraically closed L, closed H(L)-orbits of cocycles are exactly semisimple parameters, equivalently parameters conjugate to every applicable Levi projection. Consequently the coarse L-points classify semisimple gauge classes without assuming l∤|π₁(H)_tors|.
Required full carriers: ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index
Finite free-group indexing (definition).
Scope: The typed category uses actual free groups, word homomorphisms and commuting triangles. ULift makes the morphism universe small. The zero-object and rank examples are expressed; the coproduct universal property and siftedness must be completed. The coordinate diagram requires RG2.5 rational invariant algebras.
API FreeCocycleIndex [data]: Finite free group maps to Γ and commuting triangle morphisms. Named prototype above; scope limited as stated.
API FreeCocycleIndex.coproduct [constructor]: Free product with the induced map to Γ. Named prototype above; scope limited as stated.
API FreeCocycleIndex.coordinateDiagram [functoriality]: Cocycle restriction gives the covariant coordinate-ring diagram. Full signature omitted pending the carriers named in Scope.
API FreeCocycleIndex.sifted [structure]: The index is sifted, with the zero-generator object providing nonemptiness. Full signature omitted pending the carriers named in Scope.
TEST index_zero [degenerate]: The zero-generator map is initial. Typed example above for the stated prototype scope.
TEST index_coproduct [computation]: The coproduct of n- and m-generator tuples is the n+m-generator concatenation. Typed example above for the stated prototype scope.
TEST index_direction [characterisation]: A word map F_n→F_m induces O(Z¹(F_n,H))→O(Z¹(F_m,H)), not the reverse ring map. Full example omitted pending the carriers named in Scope.
API FreeCocycleIndex.ofTuple [constructor]: A finite tuple in Γ extends uniquely to a homomorphism F_n→Γ and hence gives an indexing object; evaluation on free generators recovers the tuple. Named algebraic prototype above; scope limited as stated.

LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism
Excursion algebras (construction).
Scope: The typed colimit is for a supplied CommRingCat diagram, with its injection and universal descent. The specific free-cocycle invariant diagram, Z_ell algebra structure, comparison to the represented cocycle invariants and group functoriality require RG2.5/SF.1. Animated/equivariant colimits need E5.
API ExcursionAlgebra [data]: The colimit of free-cocycle invariant algebras. Named prototype above; scope limited as stated.
API ExcursionAlgebra.ofFree [constructor]: Structure map from each free tuple invariant algebra. Named prototype above; scope limited as stated.
API ExcursionAlgebra.lift [universal-property]: Compatible ring maps out of the free diagram induce a unique ring map; evaluation and uniqueness laws. Named prototype above; scope limited as stated.
API ExcursionAlgebra.compare [projection]: The canonical map to represented Γ-cocycle invariants. Full signature omitted pending the carriers named in Scope.
API ExcursionAlgebra.mapGroup [functoriality]: A homomorphism Γ→Γ′ over Q induces Exc(Γ,H)→Exc(Γ′,H), with identity and composition laws. Full signature omitted pending the carriers named in Scope.
TEST excursion_trivial_dual [degenerate]: For H=1 and fixed Γ→Q all free-cocycle invariant rings are the base, so Exc is the base. Full example omitted pending the carriers named in Scope.
TEST excursion_free_group [compatibility]: For Γ=F_n the identity tuple is terminal in the index, hence Exc≃O(Z¹(F_n,H))^H. Full example omitted pending the carriers named in Scope.
TEST excursion_lift_eval [characterisation]: For a compatible cone ξ, lift(ξ)∘ofFree(u)=ξ_u for every u. Typed example above for the stated prototype scope.

LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism
Excursion comparison as a universal homeomorphism (theorem).
Target statement (not an elaborated theorem signature): For a finite-wild W, Spec(O(Z¹(W,H))^H)→Spec Exc(W,H) is a universal homeomorphism, and the algebra comparison is an isomorphism after inverting l. Its proof is independent of l∤|π₁(H)_tors|.
Required full carriers: ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra
The universal excursion relations (theorem).
Target statement (not an elaborated theorem signature): Maps Exc(Γ,H)→A correspond to families of Z_l-algebra maps Θ_n:O((H⋊Q)^n//H)→Map(Γ^n,A), n≥1, linear over O(Q^n) via Γ→Q, compatible with coordinate reindexing and with ordered multiplication in fibres of every map between finite ordered sets. Empty products are units. These relations imply insertion of identities and inversion/word substitution, yielding the full free-group diagram compatibility.
Required full carriers: ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity
Continuous torsion-free excursion characters (theorem).
Target statement (not an elaborated theorem signature): The l-torsion-free quotient Exc(W,H)_tf is flat over Z_l and has the universal property of the Θ families of VIII.3.7 for flat test algebras A when those families are maps of condensed sets on (W_E/P)^n. The torsion-free quotient is canonically independent of the dense discrete W. Inflation on finite-wild pieces is compatible with evaluation and the invariant comparison. Geometric field-valued characters do not change under removal of l-power torsion because that torsion is nilpotent.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum
Categorical Hecke data (definition).
Scope: E5 supplies stable linear categories, exact tensor functors, actions, anima of natural transformations and all finite-set coherence; RG2.5 supplies finite-projective algebraic representation categories. An ordinary abstract Representation does not encode this categorical datum.
API CategoricalHeckeDatum [data]: Coherent finite-set monoidal representation functors with Γ^I-equivariance and fusion; exact in the stable infinity-category version, whose operator centre is π₀End(id_C). Full signature omitted pending the carriers named in Scope.
API CategoricalHeckeDatum.unit [simp]: The trivial representation acts as identity. Full signature omitted pending the carriers named in Scope.
API CategoricalHeckeDatum.reindex [compatibility]: Finite-set pullback and fusion commute coherently with the Γ-action. Full signature omitted pending the carriers named in Scope.
API CategoricalHeckeDatum.create [constructor]: A diagonal invariant α:1→V creates a transformation id_C→T_V. Full signature omitted pending the carriers named in Scope.
API CategoricalHeckeDatum.annihilate [constructor]: A diagonal invariant β:V→1 annihilates T_V→id_C. Full signature omitted pending the carriers named in Scope.
TEST hecke_empty_set [degenerate]: For I=∅ the unit object acts as identity with trivial Γ^∅-action. Full example omitted pending the carriers named in Scope.
TEST hecke_fold [characterisation]: Folding I⊔I to I identifies the external tensor product action with the tensor product action. Full example omitted pending the carriers named in Scope.
TEST hecke_zero_category [computation]: The zero stable category admits the unique datum; every excursion endomorphism is zero. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum
Excursion data (definition).
Scope: The typed structure expresses the module, representation, diagonal invariant vector/form and group tuple. Algebraic regularity and finite-projectivity are omitted; RG2.5 supplies them. The operator/reindex/tensor signatures require the full categorical Hecke datum and E5. The matrix coefficient unit and zero tests check its linear-algebra shadow.
API ExcursionDatum [data]: Finite I, V, invariant α,β and Γ-tuple. Named prototype above; scope limited as stated.
API ExcursionDatum.operator [constructor]: The natural endomorphism S_D, with its class in π₀End(id_C) for a stable infinity-category. Full signature omitted pending the carriers named in Scope.
API ExcursionDatum.reindex [functoriality]: Reindex tuples and pull back the representation; the resulting operator is unchanged. Full signature omitted pending the carriers named in Scope.
API ExcursionDatum.tensor [constructor]: External tensor product on I⊔J with tensor α,β and concatenated tuple. Full signature omitted pending the carriers named in Scope.
TEST datum_unit [degenerate]: For the unit representation and α=β=id, S_D=id_C. Full example omitted pending the carriers named in Scope.
TEST datum_zero_alpha [computation]: If α=0 then S_D=0. Full example omitted pending the carriers named in Scope.
TEST datum_tensor_operator [compatibility]: For external tensor products S_{D⊗D′}=S_D S_D′. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence
Excursion matrix coefficients (construction).
Scope: The typed coefficient is beta(rho(g)alpha) and its unit/zero/bi-invariance tests elaborate. Regular functions and finite-projective canonical presentations require RG2.5. Operator independence, reindexing and tensor-product operators require the categorical E5 datum; no coefficient is silently treated as a regular function.
API excursionMatrixCoefficient [data]: The bi-invariant regular function f_D. Named prototype above; scope limited as stated.
API excursionMatrixCoefficient.eval [simp]: Its value is β(g·α). Named prototype above; scope limited as stated.
API excursionMatrixCoefficient.canonicalPresentation [constructor]: The generated regular-function representation with α_f=f, β_f evaluation at the unit. Full signature omitted pending the carriers named in Scope.
API excursionMatrixCoefficient.operatorIndependent [relation]: Equal f_D give equal operators for fixed I and tuple. Full signature omitted pending the carriers named in Scope.
API excursionMatrixCoefficient.reindex [functoriality]: Pullback of f agrees with reindexing the datum. Full signature omitted pending the carriers named in Scope.
TEST coefficient_unit [computation]: For V=1 and α=β=id the coefficient is 1. Typed example above for the stated prototype scope.
TEST coefficient_zero [degenerate]: For α=0 the coefficient is zero. Typed example above for the stated prototype scope.
TEST coefficient_product [compatibility]: External tensor product gives the product of the two matrix coefficients. Full example omitted pending the carriers named in Scope.
TEST coefficient_biinvariant [characterisation]: For diagonal a,b∈H, f_D(a g_i b)=f_D(g_i). Typed example above for the stated prototype scope.

LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center
Abstract excursion centre maps (theorem).
Target statement (not an elaborated theorem signature): Every categorical Hecke datum for Γ over Q induces a natural Z_l-algebra map Exc(Γ,H)→π₀End(id_C), sending an invariant function evaluated at a Γ-tuple to its excursion operator. This is group-agnostic and has no π₁ good-prime condition. The Bun_G and Bernstein-centre comparisons are consumer applications.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters
Reductive-group pseudocharacters (definition).
Scope: The typed Theta families, relations, coefficient map, group precomposition, extensionality and continuity predicate use supplied actual AlgHom reindex/multiplication maps. The identification D(n)=integral regular-function invariants, representation evaluation, finite-Q linearity, and the four geometric examples require the algebraic group interface. Import the general pseudocharacter carrier from the existing IHG.0 node and impose the given Γ→Q projection; this prototype does not create a second general owner (G6). The auxiliary Unit-tuple example above is not the trivial-representation evaluation test.
API ReductivePseudocharacter [data]: The integral-invariant family with the stated relations. Named prototype above; scope limited as stated.
API ReductivePseudocharacter.ofRepresentation [constructor]: Evaluate invariant functions on tuples of a representation. Full signature omitted pending the carriers named in Scope.
API ReductivePseudocharacter.map [functoriality]: Coefficient base change with identity and composition laws. Named prototype above; scope limited as stated.
API ReductivePseudocharacter.precomp [functoriality]: Precompose Γ′→Γ with identity and composition laws. Named prototype above; scope limited as stated.
API ReductivePseudocharacter.ext [extensionality]: Equality of all Θ_n values implies equality. Named prototype above; scope limited as stated.
API ReductivePseudocharacter.IsContinuous [characterisation]: Every invariant function has continuous tuple evaluation. Named prototype above; scope limited as stated.
TEST pseudocharacter_rank_one [computation]: For H=G_m, evaluation of a character χ gives Θ_n(t₁^{a₁}⋯t_n^{a_n})(γ)=∏χ(γ_i)^{a_i}. Full example omitted pending the carriers named in Scope.
TEST pseudocharacter_conjugate [compatibility]: Conjugate representations have equal pseudocharacters. Full example omitted pending the carriers named in Scope.
TEST pseudocharacter_trivial_group [degenerate]: For Γ=1, the pseudocharacter of the trivial representation evaluates f at (1,…,1). Full example omitted pending the carriers named in Scope.
TEST pseudocharacter_unipotent [non-example]: For Γ=Z and H=SL₂, a nontrivial unipotent generator representation and the trivial representation have the same pseudocharacter but are not conjugate; pseudocharacters classify their semisimplifications. Full example omitted pending the carriers named in Scope.
Ownership: the general pseudocharacter carrier is imported from IHG.0; only its prescribed Γ→Q adapter belongs here. G6 records the remaining API/reader alignment.

LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-anchor
Finite anchors in characteristic zero (theorem).
Target statement (not an elaborated theorem signature): For compatible invariant families of an arbitrary Γ over Q and algebraically closed characteristic-zero L, choose an anchor tuple maximising the dimension of its reductive generated Zariski closure, then minimising centralizer dimension, then centralizer component count. There is a closed-orbit representative ḡ such that each γ has a unique g(γ) with (ḡ,g(γ)) in the prescribed closed orbit and with centralizer unchanged. The elements g(γ) lie in the double centralizer of ḡ.
Required full carriers: ReductiveGroupsPartII:RG2.5; IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction. See G1/G3/G4/G5/G6 where applicable.
Ownership: this generic anchor evidence is retained pending coordinated alignment with the existing IHG.1 reconstruction owner, not accepted as a second LP proof (G6).

LanglandsParameterStacks:LP2:semisimple-characters/positive-characteristic-anchor
Finite anchors in arbitrary characteristic (theorem).
Target statement (not an elaborated theorem signature): For a compatible pseudocharacter over algebraically closed k, let d(γ̄) be the dimension of a minimal parabolic containing a representative of the prescribed closed tuple orbit. Choose an anchor maximising d(γ̄) over all tuples, then minimising centralizer dimension and component count. Its closed-orbit representative uniquely determines each appended element by its prescribed invariant values and unchanged centralizer. The resulting representation is completely reducible. This uses minimal parabolics and Levi irreducibility, rather than identifying complete reducibility with reductivity of the image in characteristic p.
Required full carriers: ReductiveGroupsPartII:RG2.5; IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-stable-tuple; IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction. See G1/G3/G4/G5/G6 where applicable.
Ownership: this generic anchor evidence is retained pending coordinated alignment with the existing IHG.1 reconstruction owner, not accepted as a second LP proof (G6).

LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection
Group-agnostic semisimple reconstruction (theorem).
Target statement (not an elaborated theorem signature): For any group Γ→Q, H/Z_l with action of finite Q and algebraically closed Z_l-field L, compatible Θ families as in the excursion universal property correspond bijectively to H(L)-conjugacy classes of semisimple crossed cocycles Γ→H(L). The forward family evaluates invariant functions on the associated lifts Γ→H(L)⋊Q. This theorem is algebraic; continuity is a separate clause.
Required full carriers: IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction. See G1/G3/G4/G5/G6 where applicable.
Ownership: use the existing IHG nodes listed above; the packet gives the group/projection/Weil or excursion specialisation. G6 records residual reader alignment.

LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity
Continuity from characteristic-zero anchors (theorem).
Target statement (not an elaborated theorem signature): In Lafforgue11.7, for profinite Γ and split H° over finite E/Q_l (possibly disconnected H), continuous invariant families over E reconstruct a continuous representation Γ→H(E′) for a finite extension E′/E, unique up to H°(Q_l-bar)-conjugation, with reductive Zariski image. For algebraically closed rank-one valued characteristic-zero coefficients the analogous reconstructed semisimple representation is continuous. For relatively discrete condensed Q_l-fields the argument is applied locally to their finite-type coefficient modules.
Required full carriers: ReductiveGroupsPartII:RG2.5; IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-valued-continuity. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity
Continuity with discrete coefficients (theorem).
Target statement (not an elaborated theorem signature): For profinite Γ and algebraically closed discrete k, continuous pseudocharacter values imply continuity of the reconstructed completely reducible representation. More generally the finite-anchor proof works locally on profinite parameter sets in a condensed group with discrete coefficients. In characteristic l the relatively discrete Z_l-field convention is discrete, so it supplies this continuity clause for W_E.
Required full carriers: ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-discrete-continuity. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:semisimple-characters/character-bijection
Continuous semisimple parameter characters (theorem).
Target statement (not an elaborated theorem signature): For algebraically closed Z_l-field L there are canonical bijections between (i) semisimple condensed L-parameters up to H(L)-conjugation, (ii) L-points of the piecewise coarse parameter quotient, and (iii) condensed Θ families on W_E^n with the reindexing and ordered multiplication relations. All primes l≠p are allowed.
Required full carriers: IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction. See G1/G3/G4/G5/G6 where applicable.
Ownership: use the existing IHG nodes listed above; the packet gives the group/projection/Weil or excursion specialisation. G6 records residual reader alignment.

LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-pseudocharacters
GL trace pseudocharacters (definition).
Scope: The complete algebraic trace identity and all four test goals are expressed, including fixed one-cycles. The full trace carrier is the group-algebra adapter of IHG.0/pseudocharacter; the characteristic-zero comparison imports the existing IHG determinant-trace and reconstruction nodes. This prototype does not create a second trace-theory owner (G6).
API TracePseudocharacter [data]: Normalised central trace function satisfying the alternating identity. Named prototype above; scope limited as stated.
API TracePseudocharacter.ofRepresentation [constructor]: Trace of an r-dimensional representation. Named prototype above; scope limited as stated.
API TracePseudocharacter.cycleValue [data]: The product of trace values along a permutation’s cycles. Named prototype above; scope limited as stated.
API TracePseudocharacter.map [functoriality]: Coefficient ring maps preserve all identities. Named prototype above; scope limited as stated.
TEST trace_rank_one [computation]: For r=1 the identity is τ(x)τ(y)=τ(xy), so normalised pseudocharacters are characters. Typed example above for the stated prototype scope.
TEST trace_zero_rank [degenerate]: For r=0 the one-variable alternating identity forces τ=0. Typed example above for the stated prototype scope.
TEST trace_semisimple_sum [compatibility]: The trace of a direct sum of characters is a trace pseudocharacter of the sum of their ranks. Typed example above for the stated prototype scope.
TEST trace_not_rank_one_constant [non-example]: The constant function 1 is not rank-two because τ(1) must be 2 in characteristic zero. Typed example above for the stated prototype scope.

LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-comparison
Trace and excursion character comparison (theorem).
Target statement (not an elaborated theorem signature): For algebraically closed characteristic-zero L, GL_r-pseudocharacters, r-dimensional trace pseudocharacters and conjugacy classes of semisimple representations Γ→GL_r(L) correspond. The invariant functions on tuples are generated by permutation cycle-trace functions (and inverse-determinant functions on GL_r); Cayley–Hamilton/Newton identities and group inverses express these using traces of words.
Required full carriers: ReductiveGroupsPartII:RG2.5; IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-bijective-rational; IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction. See G1/G3/G4/G5/G6 where applicable.
Ownership: use the existing IHG nodes listed above; the packet gives the group/projection/Weil or excursion specialisation. G6 records residual reader alignment.

LanglandsParameterStacks:LP2:semisimple-characters/schur-object-parameter
Parameters of Schur objects (theorem).
Target statement (not an elaborated theorem signature): If L is algebraically closed and a categorical Hecke datum acts on C, every object X with π₀End_C(X)=L receives a unique semisimple cocycle Γ→H(L), up to H(L)-conjugation, whose invariant evaluations equal the excursion action on X.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/good-filtration-t-structure
Good-filtration t-structures (construction).
Scope: The accepted ReductiveGroupsIntegralRepresentationsPartII candidate, through its parent Layer9 request, supplies general induced/Weyl modules, cohomological criteria and tensor stability; E5 supplies stable IndPerf, rational algebraic cohomology and truncations. Ordinary triangulated TStructure does not supply these enhanced carriers. Highest-weight inputs extend the already accepted ReductiveGroupsIntegralRepresentationsPartII candidate through the registered parent Layer9 request; they are not supplied by current RG2.5.
API goodFiltrationTStructure [data]: The t-structure on IndPerf(BG) with its connective convention. Full signature omitted pending the carriers named in Scope.
API goodFiltrationTStructure.connective_iff [characterisation]: Vanishing of H^i(G°,M⊗∇_λ) for all i>0 and λ. Full signature omitted pending the carriers named in Scope.
API goodFiltrationTStructure.coconnective_iff [characterisation]: Vanishing with Δ_λ for i<0. Full signature omitted pending the carriers named in Scope.
API goodFiltrationTStructure.tensorConnective [relation]: Tensor products of connective objects are connective under the imported Donkin–Mathieu tensor theorem. Full signature omitted pending the carriers named in Scope.
API goodFiltrationTStructure.homotopy [compatibility]: Its homotopy-category t-structure uses the baseline TStructure convention; this does not recover its infinity enhancement. Full signature omitted pending the carriers named in Scope.
TEST good_torus [computation]: For a torus every rational module decomposes into weights, so the good-filtration t-structure is the usual cohomological one. Full example omitted pending the carriers named in Scope.
TEST good_zero [degenerate]: The zero object is in both halves. Full example omitted pending the carriers named in Scope.
TEST good_induced [compatibility]: A dual-Weyl module ∇_λ in degree zero is connective. Full example omitted pending the carriers named in Scope.
TEST good_shift_sign [non-example]: For a nonzero torus representation V, V[−1] lies in positive cohomological degree and is not connective in the convention D^{≤0}. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG
Separatedness of good filtrations (theorem).
Target statement (not an elaborated theorem signature): The good-filtration t-structure on IndPerf(BG) is separated: an infinitely connective object and an infinitely coconnective object are zero. The induced test modules detect zero.
Required full carriers: ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/free-cocycle-good-filtration
Good filtrations of free cocycle algebras (theorem).
Target statement (not an elaborated theorem signature): For every action F_n→Aut(G), O(Z¹(F_n,G)) with twisted diagonal G°-conjugation has a good G°-filtration. Hence its higher rational G°-cohomology vanishes; for prime-to-l π₀G the corresponding G-cohomology also vanishes.
Required full carriers: ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/induced-perfect-complexes
Perfect complexes generated from the classifying stack (definition).
Scope: S.1/E5 supply Perf and IndPerf on the quotient, stable retract closure, pullback and the algebra module functor. An arbitrary ordinary category cannot replace stable cones, higher coherence or compact generation.
API InducedPerfectComplexes [data]: Stable retract closure of the image of Perf(BG). Full signature omitted pending the carriers named in Scope.
API InducedPerfectComplexes.pullback [constructor]: Any classifying-stack perfect complex yields an induced one. Full signature omitted pending the carriers named in Scope.
API InducedPerfectComplexes.retract [structure]: Closed under shifts, cones and retracts. Full signature omitted pending the carriers named in Scope.
API InducedPerfectComplexes.moduleFunctor [functoriality]: The fully faithful comparison on the induced Ind subcategory to A-modules in IndPerf(BG). Full signature omitted pending the carriers named in Scope.
API InducedPerfectComplexes.minimal [universal-property]: Every stable idempotent-complete subcategory containing the pullbacks contains Perf^ind. Full signature omitted pending the carriers named in Scope.
TEST induced_point [degenerate]: For X=Spec L, Perf^ind(BG)=Perf(BG). Full example omitted pending the carriers named in Scope.
TEST induced_trivial_group [computation]: For G=1, finite-cell A-complexes and their retracts give all Perf(A). Full example omitted pending the carriers named in Scope.
TEST induced_retract [characterisation]: A direct summand of an induced finite complex lies in Perf^ind. Full example omitted pending the carriers named in Scope.
TEST induced_not_all_bad_prime [non-example]: For X=G with conjugation and l dividing |π₁(G°)_tors|, the unit skyscraper fails to be induced by VIII.5.11. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP3/bar-criterion
The induced-perfect bar criterion (theorem).
Target statement (not an elaborated theorem signature): For M∈Perf(X/G), M lies in Perf^ind iff the canonical bar map colim[…→M⊗_L A⊗_L M^∨→M⊗_L M^∨]→M⊗_A M^∨ is an isomorphism in IndPerf(BG). All tensor products on the left and its geometric realisation are formed in IndPerf(BG).
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:presentability; SchemeKTheoryOperations:S.1; tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind
Tensor-connectivity criterion for induced perfectness (theorem).
Target statement (not an elaborated theorem signature): Assume A has a good G°-filtration and M∈Perf(X/G) is connective in the good-filtration t-structure after forgetting its A-action. Then M∈Perf^ind iff for every similarly connective N∈Perf(X/G), M⊗_A N remains connective.
Required full carriers: ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/adjoint-unit-generation
Adjoint perfect generation and its prime restriction (theorem).
Target statement (not an elaborated theorem signature): For G acting on itself by conjugation, let i:Spec L→G be the unit. With G° reductive and π₀G prime to l, the following are equivalent: l∤|π₁(G°)_tors|; i_*L∈Perf^ind(G/G); Perf^ind(G/G)=Perf(G/G).
Required full carriers: ReductiveGroupsPartII:RG2.5; SchemeKTheoryOperations:S.1; SchemeAndStackFoundations:SF.1; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/twisted-free-generation
Twisted free-group perfect generation (theorem).
Target statement (not an elaborated theorem signature): If G° is reductive and the orders of π₀G and π₁(G°)_tors are prime to l, then for any action F_n→Aut(G), Perf(Z¹(F_n,G)/G) is generated under cones and retracts by Perf(BG).
Required full carriers: SchemeKTheoryOperations:S.1; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/derived-unit-fibre
Derived unit fibres and generation (theorem).
Target statement (not an elaborated theorem signature): For a G-equivariant map X̃→G with conjugation action on G, put X=X̃×^R_G Spec L at the unit and Ã=O(X̃), A=O(X). If G° is reductive and π₀G, π₁(G°)_tors have prime-to-l orders, then L⊗_{O(G)}Ã→A is an isomorphism in IndPerf(BG). If additionally Perf(X̃/G)=Perf^ind and Ã is connective for the good-filtration t-structure, then A is connective and Perf(X/G)=Perf^ind.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:animation; EnhancedDerivedSheaves:E5:presentability; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/surface-and-tame-relations
Surface and tame relation fibres (comparison).
Target statement (not an elaborated theorem signature): The derived character stack of a compact oriented surface with relation ∏[a_i,b_i]=1 and the tame Weil parameter stack with relation σ⁻¹τσ=τ^q are unit fibres of equivariant maps G^{2g}→G and G²→G respectively. Under the good π₁ and component hypotheses their coordinate algebras are connective and their Perf categories are generated from BG. The surface comparison is an application of the same mechanism; no new surface roadmap is created here.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions
Prime-to-l components of fixed groups (theorem).
Target statement (not an elaborated theorem signature): Let L be algebraically closed of characteristic l, G smooth affine with G° reductive and π₀G of order prime to l, and P finite of order prime to l acting on G. For H=G^P, the order of π₀H is prime to l. Smoothness and reductivity of H° are imported from the RG2.6 fixed-point request; this LP3 theorem owns only the component-order assertion.
Required full carriers: ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution
Cyclic fixed-locus resolutions (theorem).
Target statement (not an elaborated theorem signature): Let Θ have prime order r≠l on G with G° reductive and π₀G prime to l. Put X={(g₀,…,g_{r−1}):g₀Θ(g₁)⋯Θ^{r−1}(g_{r−1})=1}, with G twisted conjugation and C_r cyclic permutation. For the augmented cosimplicial G-space X^{C_r}→X⇒∏_{C_r}X→…, the coordinate-algebra realisation is O(X^{C_r}) in IndPerf(BG).
Required full carriers: EnhancedDerivedSheaves:E5:presentability; SchemeAndStackFoundations:SF.4; ReductiveGroupsPartII:RG2.5; tauceti:TauCeti.fixedSubgroup; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/donkin-subgroup-and-generation
Solvable fixed groups as Donkin subgroups (theorem).
Target statement (not an elaborated theorem signature): If P is finite solvable of order prime to l acting on G with G° reductive and π₀G prime to l, then H°=(G^P)° is a Donkin subgroup of G°: restriction of a good G°-filtered representation has a good H°-filtration. Equivalently induction of a good H°-filtered representation has a good G°-filtration.
Required full carriers: ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/fixed-induction-and-counit
Fixed-group induction and good counit kernels (theorem).
Target statement (not an elaborated theorem signature): In the solvable prime-to-l fixed-group setting H=G^P, a representation W of H° has good H°-filtration iff Ind_{H°}^{G°}W has good G°-filtration, and a representation of H has good H°-filtration iff Ind_H^G W has good G°-filtration. For good W the respective restriction–induction counit kernels also have good H°-filtrations.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:presentability; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/fixed-restriction-generation
Generation by restriction to fixed groups (theorem).
Target statement (not an elaborated theorem signature): In the same solvable prime-to-l setting, Perf(BH°) is generated under cones and retracts by restrictions from Perf(BG°), and Perf(BH) is generated by restrictions from Perf(BG). No π₁ good-prime hypothesis is added.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:presentability; SchemeKTheoryOperations:S.1; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample
The central-character fixed-group counterexample (comparison).
Target statement (not an elaborated theorem signature): In characteristic2, for G=(SL₂×SL₂)/μ₂ with factor-swap P=C₂, the fixed group is H=PGL₂×(μ₂×μ₂)/μ₂. The nontrivial central character of H is not generated by restrictions of Perf(BG) under cones and retracts. Thus prime-to-l cannot be replaced by preserving a Borel, torus or pinning.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:abstract; EnhancedDerivedSheaves:E5:presentability; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/fixed-fundamental-group
Fundamental groups of solvable fixed groups (theorem).
Target statement (not an elaborated theorem signature): If G° is reductive, P is finite solvable of order prime to l and l∤|π₁(G°)_tors|, then l∤|π₁((G^P)°)_tors|.
Required full carriers: ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/mapping-approximation
Sifted parameter mapping approximations (construction).
Scope: E5 supplies anima over BGamma, finite sets equipped with Gamma-torsors (finite bases, potentially infinite total torsors), sifted animation/left Kan extension and stable linear Perf/IndPerf; SF.1 supplies gerbes and quotient stacks. This is a category-valued approximation, not an assumed representing stack.
API ParameterMappingApproximation [data]: The left Kan extension category denoted Perf(Map^Σ). Full signature omitted pending the carriers named in Scope.
API ParameterMappingApproximation.compare [projection]: Natural comparison to the actual Perf mapping category. Full signature omitted pending the carriers named in Scope.
API ParameterMappingApproximation.finiteTorsor [compatibility]: It agrees with the defining Perf category on finite sets with Γ-torsors. Full signature omitted pending the carriers named in Scope.
API ParameterMappingApproximation.leftKan [universal-property]: Restriction to finite sets with Γ-torsors classifies sifted-colimit-preserving extensions. Full signature omitted pending the carriers named in Scope.
API ParameterMappingApproximation.ind [functoriality]: Ind-completion of the compact category diagram. Full signature omitted pending the carriers named in Scope.
TEST approx_point [degenerate]: On a one-point base equipped with its Γ-torsor (whose total set can be infinite), the category equals Perf of the gerbe fibre. Full example omitted pending the carriers named in Scope.
TEST approx_coproduct [characterisation]: A finite disjoint union of bases equipped with Γ-torsors maps to the tensor product of their linear Perf categories. Full example omitted pending the carriers named in Scope.
TEST approx_bad_prime [non-example]: Over F_l-bar with G=PGL_l and Γ=Z, the free-group approximation has induced-perfect image and excludes the unit skyscraper in Perf(G/G); it is not the actual mapping category. Full example omitted pending the carriers named in Scope.

LanglandsParameterStacks:LP3/free-gerbe-comparison
Free-group gerbe comparisons (theorem).
Target statement (not an elaborated theorem signature): For a gerbe 𝒢 over BΓ banded by G with G° reductive and π₀G prime to l, the comparison IndPerf(Map^Σ_{BΓ}(BF_n,𝒢))→IndPerf(Map_{BΓ}(BF_n,𝒢)) is fully faithful, with image generated by IndPerf(BG). For a connected gerbe and extension E_G→Γ its source is modules over O(∏π⁻¹(γ_i)) in IndPerf(BG). It is an equivalence if π₁(G°)_tors has prime-to-l order; finite unions of gerbes satisfy the analogous statement.
Required full carriers: EnhancedDerivedSheaves:E5:presentability; ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/wild-gerbe-elimination
Solvable wild gerbe elimination (theorem).
Target statement (not an elaborated theorem signature): For finite solvable normal P⊂Γ of order prime to l, and a stack 𝒢 over BΓ with fibre a finite union of BG with G° reductive and π₀G prime to l, its pushforward along BΓ→B(Γ/P) has fibre Map_{BΓ}(BP,𝒢), a finite union of BH with H° reductive and π₀H prime to l. The Map^Σ(BP) comparison is an equivalence. Prime-to-l π₁ torsion of every input G° is preserved in every H°.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:presentability. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/tame-case-and-the-wild-remainder
Tame reduction of finite-wild parameter categories (comparison).
Target statement (not an elaborated theorem signature): For a finite-wild discrete W with finite normal p-group P and tame W/P, the gerbe pushforward and Map^Σ comparison reduce the characteristic-l cocycle algebra and Perf generation assertions to the tame relation-fibre case. Consequently colim free-cocycle algebras→O(Z¹(W,H)) is an isomorphism in IndPerf(BH), its algebra is connective in the good-filtration t-structure, and Perf(Z¹(W,H)/H) is generated from Perf(BH), under the good π₁ restriction.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/separable-centralizers
Very-good and reductive-pair centralizers (theorem).
Target statement (not an elaborated theorem signature): Over algebraically closed k, every closed subgroup of reductive G has smooth scheme-theoretic centralizer if char(k) is very good for G in the BMRT sense, or if G has a faithful V with G-equivariant splitting Lie(G)⊂Lie(GL(V)). Its tuple orbit maps are then separable. For simple root systems the very-good exclusions are l∤n+1 for A_n, l≠2 for B,C,D,E,F,G, l≠3 for E,F,G, and l≠5 for E₈. A positive characteristic prime to |W_G| is sufficient.
Required full carriers: ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP3/quotient-etale-descent
Descent of étaleness to reductive quotients (theorem).
Target statement (not an elaborated theorem signature): Let G/O be reductive and X,Y normal integral affine flat finite-type O-schemes, with a finite equivariant φ:Y→X. If y∈Y(k) and x=φ(y) have closed residual orbits, φ is étale at y, and its map on these orbits is injective on geometric points, then φ//G is étale at π(y).
Required full carriers: SchemeAndStackFoundations:SF.4; ReductiveGroupsPartII:RG2.5. See G1/G3/G4/G5/G6 where applicable.
Source repair E9: on the quotient normalise in the finite relative algebraic closure L₀ of Frac(O[X]^G) inside L, using the image Galois group; L itself may be transcendental over the quotient field.

LanglandsParameterStacks:LP3/formal-etale-slice
Formal quotient slices over coefficient DVRs (theorem).
Target statement (not an elaborated theorem signature): Let G/O be reductive, X integral affine smooth finite type over O, and x∈X(k) have closed residual orbit and scheme-theoretically trivial stabilizer. For Artin local O-algebras with residue field k, the formal G-identity neighbourhood acts freely on X̂_x, and X̂_x/Ĝ≃(X//G)̂_{π(x)} as deformation functors.
Required full carriers: SchemeAndStackFoundations:SF.4; ReductiveGroupsPartII:RG2.5; SchemeAndStackFoundations:SF.1. See G1/G3/G4/G5/G6 where applicable.
Source repair E10: the action map point is (1,x); the quotient map point is π(i(1,x)).

LanglandsParameterStacks:LP3/integral-chevalley-restriction
Integral Chevalley restriction for Levi groups (theorem).
Target statement (not an elaborated theorem signature): For a split reductive standard dual Levi M over Z, maximal split torus T and Weyl group W(M,T), restriction gives an isomorphism Z[M]^M≃Z[T]^{W(M,T)}. This is integral over Z with no good-prime hypothesis.
Required full carriers: ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit
Derived free-cocycle presentations (theorem).
Target statement (not an elaborated theorem signature): For finite-wild W the natural map colim_{F_n→W} O(Z¹(F_n,H))→O(Z¹(W,H)) is an isomorphism in D(Z_l), indeed of animated algebras. This underlying derived statement has no π₁ good-prime restriction.
Required full carriers: EnhancedDerivedSheaves:E5:animation; EnhancedDerivedSheaves:E5:presentability. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem
Integral invariant comparison (theorem).
Target statement (not an elaborated theorem signature): Assume l∤|π₁(H)_tors|. Then colim_{F_n→W}O(Z¹(F_n,H))→O(Z¹(W,H)) is an isomorphism in IndPerf(BH) over Z_l. In particular Exc(W,H)≃O(Z¹(W,H))^H as Z_l-algebras.
Required full carriers: EnhancedDerivedSheaves:E5:presentability; ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change
Cohomology vanishing and invariant base change (theorem).
Target statement (not an elaborated theorem signature): Under the same good-prime hypotheses, the cocycle algebra has no higher rational H-cohomology, its invariant algebra is Z_l-flat, and for a Z_l-algebra Λ the canonical map O(Z¹(W,H))^H⊗Λ→O(Z¹(W,H)_Λ)^{H_Λ} is an isomorphism, with the derived base-change form supplied by the equivariant colimit.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:presentability; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP2/three-way-separation
The three excursion comparisons (comparison).
Target statement (not an elaborated theorem signature): At every l≠p the excursion comparison is a universal homeomorphism and classifies semisimple geometric parameters; after inverting l it is a ring isomorphism. Under l∤|π₁(H)_tors| it is an integral ring isomorphism with higher-cohomology vanishing and coefficient base change. These are three distinct mathematical strengths.
Required full carriers: the full source carriers of the local prerequisites listed in the packet. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/rep-action-on-perf
Universal representation bundles (construction).
Scope: RG2.5 supplies algebraic finite-projective representations; S.1/E5/SF.1 supply the universal torsor, associated perfect bundle, higher W^I equivariance and symmetric monoidal tensor action.
API UniversalRepresentationBundle [constructor]: Associated finite-projective bundle with universal W-equivariance. Full signature omitted pending the carriers named in Scope.
API UniversalRepresentationBundle.unit [simp]: The trivial representation gives O_X. Full signature omitted pending the carriers named in Scope.
API UniversalRepresentationBundle.tensor [compatibility]: Associated bundles preserve tensor product. Full signature omitted pending the carriers named in Scope.
API UniversalRepresentationBundle.reindex [functoriality]: Finite-set pullbacks give the fusion compatibilities. Full signature omitted pending the carriers named in Scope.
API UniversalRepresentationBundle.act [functoriality]: Tensoring defines the exact Perf action, compatible with unit and composition. Full signature omitted pending the carriers named in Scope.
TEST rep_bundle_unit [degenerate]: The trivial representation acts by identity on Perf(X). Full example omitted pending the carriers named in Scope.
TEST rep_bundle_at_parameter [computation]: The fibre at φ is V with the W-action supplied by φ. Full example omitted pending the carriers named in Scope.
TEST rep_bundle_tensor [compatibility]: The fibre of the tensor product is the tensor product of the two parameter representations. Full example omitted pending the carriers named in Scope.
API UniversalRepresentationBundle.baseChange [compatibility]: Pullback along coefficient change carries the bundle associated to V to the bundle associated to its scalar extension, compatibly with W-action, tensor and unit; no invariant-ring base-change isomorphism is assumed. Full signature omitted pending the enhanced/condensed carriers named in Scope.

LanglandsParameterStacks:LP4/generation-and-module-comparison
Perfect generation on parameter stacks (theorem).
Target statement (not an elaborated theorem signature): For finite-wild W and l∤|π₁(H)_tors|, Perf(Z¹(W,H)/H) over Z_l is generated under cones and retracts by the image of Perf(BH). The analogous characteristic-l statement holds over F_l-bar, and over a characteristic-zero field no restriction on l is needed.
Required full carriers: SchemeKTheoryOperations:S.1; EnhancedDerivedSheaves:E5:presentability; ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/module-comparison
Parameter IndPerf module comparison (theorem).
Target statement (not an elaborated theorem signature): Under integral good-prime generation, IndPerf(Z¹(W,H)/H)≃Mod_{O(Z¹(W,H))}(IndPerf(BH)), compatibly with pullback, tensor products and the representation bundles. Over characteristic-zero fields the same comparison holds without a π₁ restriction.
Required full carriers: EnhancedDerivedSheaves:E5:presentability; SchemeKTheoryOperations:S.1. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/rational-all-colimits
Rational mapping-stack Perf colimits (theorem).
Target statement (not an elaborated theorem signature): Let H/L be reductive over characteristic-zero L, with finite Q-action. The functor S↦Perf(Map_{BQ}(S,B(H⋊Q))) from anima over BQ to L-linear symmetric monoidal small stable idempotent-complete categories preserves all colimits; in particular it preserves sifted colimits after forgetting the monoidal structure.
Required full carriers: EnhancedDerivedSheaves:E5:animation; EnhancedDerivedSheaves:E5:abstract; EnhancedDerivedSheaves:E5:presentability; SchemeAndStackFoundations:SF.1; SchemeKTheoryOperations:S.1; ReductiveGroupsPartII:RG2.5; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property
Rational categorical parameter actions (theorem).
Target statement (not an elaborated theorem signature): For any anima S→BQ, reductive H over characteristic-zero L with finite Q-action, and small idempotent-complete stable L-linear C, the anima of L-linear Perf(Map_{BQ}(S,B(H⋊Q)))-actions on C is equivalent to the anima of finite-set-functorial exact Rep_L(Q^I)-linear monoidal functors Rep_L((H⋊Q)^I)→End_L(C)^{S^I}. The comparison is given by universal representation bundles.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:abstract; EnhancedDerivedSheaves:E5:presentability; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/integral-universal-property
Integral categorical parameter actions (theorem).
Target statement (not an elaborated theorem signature): For split reductive H over a coefficient DVR R with finite Q-action, anima S→BQ and small idempotent-complete stable R-linear C, the same finite-set monoidal datum classifies R-linear actions of ParameterMappingApproximation(S)=Perf(Map^Σ_{BQ}(S,B(H⋊Q))). No π₁ restriction is needed for this approximation theorem.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:abstract; EnhancedDerivedSheaves:E5:presentability; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/approximation-all-colimits
Colimits of integral parameter approximations (theorem).
Target statement (not an elaborated theorem signature): Over a coefficient DVR R the functor S↦Perf(Map^Σ_{BQ}(S,B(H⋊Q))) preserves all colimits into symmetric monoidal idempotent-complete small stable R-linear categories.
Required full carriers: ReductiveGroupsPartII:RG2.5; EnhancedDerivedSheaves:E5:presentability; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/integral-free-group-comparison
Integral free-group approximation comparison (theorem).
Target statement (not an elaborated theorem signature): For S=BF_n→BQ, the integral approximation-to-actual Perf comparison is fully faithful and its image is the stable retract closure of Rep_R(H). Its Ind category is modules over O(H^n), with pulled-back twisted conjugation, in IndPerf(BH); compact objects give the approximation.
Required full carriers: EnhancedDerivedSheaves:E5:presentability; ReductiveGroupsPartII:RG2.5; SchemeKTheoryOperations:S.1; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/sifted-approximation
Discrete-group approximation algebras (theorem).
Target statement (not an elaborated theorem signature): For any discrete Γ→Q, BΓ is the sifted colimit of BF_n over FreeCocycleIndex(Γ) in anima. The integral approximation Perf(Map^Σ_{BQ}(BΓ,B(H⋊Q))) is the compact-object category of modules over colim_{F_n→Γ}O(H^n) in IndPerf(BH), with the tuple-dependent twisted action.
Required full carriers: EnhancedDerivedSheaves:E5:animation; EnhancedDerivedSheaves:E5:presentability. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/weil-approximation-equivalence
Weil approximation and categorical actions (theorem).
Target statement (not an elaborated theorem signature): For finite-wild W, coefficient ring Λ the integers of a finite Q_l-extension and l∤|π₁(H)_tors|, the comparison Perf(Map^Σ_{BQ}(BW,B(H⋊Q)))_Λ→Perf(Z¹(W,H)_Λ/H) is an equivalence. Thus finite-set exact monoidal representation data classify Λ-linear actions of the actual finite-wild parameter Perf category on any small idempotent-complete stable C. Over a Q_l-field this holds at every l.
Required full carriers: EnhancedDerivedSheaves:E5:presentability. See G1/G3/G4/G5/G6 where applicable.

LanglandsParameterStacks:LP4/compactly-supported-actions
Compactly supported parameter actions (definition).
Scope: The clopen parameter union is LP1/SF.1; E5/S.1 supply Perf restriction and category actions. The quantified objectwise factorisation and its coherent action are absent full carriers, not a proposition field asserted to hold.
API IsCompactlySupportedParameterAction [characterisation]: Each object has its own quasi-compact clopen factorisation. Full signature omitted pending the carriers named in Scope.
API ParameterAction.supportUnion [relation]: A finite union controls a finite sum or cone. Full signature omitted pending the carriers named in Scope.
API ParameterAction.supportRetract [relation]: Retracts retain the same support bound. Full signature omitted pending the carriers named in Scope.
API ParameterAction.restrictPiece [functoriality]: Actions supported on a finite piece factor through that piece’s Perf category. Full signature omitted pending the carriers named in Scope.
TEST support_zero [degenerate]: The zero object has empty support. Full example omitted pending the carriers named in Scope.
TEST support_finite_sum [computation]: Supports U,V for c,d give U∪V for c⊕d. Full example omitted pending the carriers named in Scope.
TEST support_objectwise [non-example]: On a disjoint infinite union, objects each supported on one distinct component satisfy the condition without a common finite-component bound for the whole category. Full example omitted pending the carriers named in Scope.

-/
