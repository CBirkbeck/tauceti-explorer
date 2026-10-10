/-
This file is not the roadmap and is not exhaustive. README.md is definitive;
these statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. Proofs using `sorry` do not claim an implementation.

These are ordinary group, ring, tuple and split GL_n signatures. The complete
condensed coefficient convention, algebraic regularity, scheme parabolics,
admissible complex enhancements, and stable infinity-category constructions
require the supplier interfaces specified in README.md. In particular,
LParameter is the ordinary continuous shadow, and WeilDeligneParameter is the
split GL_n shadow. Neither is the full parameter functor. No missing condition
is replaced by an unconstrained Prop field or a True-valued predicate.
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
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Category.Ring.Colimits
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.RingTheory.Nilpotent.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.BinaryFan
import Mathlib.CategoryTheory.Limits.Sifted
import Mathlib.Topology.Instances.Matrix
import TauCeti.GroupTheory.FixedSubgroup

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

theorem restrict_comp {Δ : Type w} [Group Δ] {K : Type z} [Group K]
    (c : CrossedCocycle α) (f : Δ →* Γ) (g : K →* Δ) :
    (c.restrict f).restrict g = c.restrict (f.comp g) := by
  sorry

theorem restrict_id_apply (c : CrossedCocycle α) (x : Γ) :
    c.restrict (MonoidHom.id Γ) x = c x := by sorry

theorem restrict_gauge {Δ : Type w} [Group Δ] (c : CrossedCocycle α)
    (f : Δ →* Γ) (h : H) :
    (c.gauge h).restrict f = (c.restrict f).gauge h := by sorry

theorem map_id (c : CrossedCocycle α) :
    c.map (β := α) (MonoidHom.id H) (fun _ _ => rfl) = c := by sorry

theorem map_comp {K : Type w} [Group K] {L : Type z} [Group L]
    {β : Γ →* MulAut K} {χ : Γ →* MulAut L}
    (c : CrossedCocycle α) (f : H →* K) (g : K →* L)
    (hf : ∀ x h, f (α x h) = β x (f h))
    (hg : ∀ x k, g (β x k) = χ x (g k)) :
    (c.map f hf).map g hg =
      c.map (g.comp f) (fun x h =>
        (congrArg g (hf x h)).trans (hg x (f h))) := by sorry

theorem map_gauge {K : Type w} [Group K] {β : Γ →* MulAut K}
    (c : CrossedCocycle α) (f : H →* K)
    (hf : ∀ x h, f (α x h) = β x (f h)) (h : H) :
    (c.gauge h).map f hf = (c.map f hf).gauge (f h) := by sorry

def gaugeSetoid (α : Γ →* MulAut H) : Setoid (CrossedCocycle α) where
  r c d := ∃ h : H, d = c.gauge h
  iseqv := by sorry

def orbit (c : CrossedCocycle α) : Quotient (gaugeSetoid α) := Quotient.mk _ c

theorem orbit_gauge (c : CrossedCocycle α) (h : H) :
    (c.gauge h).orbit = c.orbit := by sorry

def restrictOrbit {Δ : Type w} [Group Δ] (f : Δ →* Γ) :
    Quotient (gaugeSetoid α) → Quotient (gaugeSetoid (α.comp f)) :=
  Quotient.map (fun c => c.restrict f) (by sorry)

theorem restrictOrbit_mk {Δ : Type w} [Group Δ] (f : Δ →* Γ)
    (c : CrossedCocycle α) : restrictOrbit f c.orbit = (c.restrict f).orbit := by sorry

-- cocycle_trivial_action
example : CrossedCocycle (1 : Γ →* MulAut H) ≃ (Γ →* H) := by sorry

-- cocycle_trivial_group
example (α : Unit →* MulAut H) : Subsingleton (CrossedCocycle α) := by sorry

-- cocycle_coboundary
example (α : Γ →* MulAut H) (h : H) (x : Γ) :
    ((unit α).gauge h) x = h * (α x h)⁻¹ := by sorry

/-- A fully concrete version of the C₂ acting by negation test. -/
def signAction : Multiplicative (ZMod 2) →* MulAut (Multiplicative ℤ) := by sorry

theorem signAction_generator (x : Multiplicative ℤ) :
    signAction (Multiplicative.ofAdd (1 : ZMod 2)) x =
      Multiplicative.ofAdd (-x.toAdd) := by sorry

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

/-- The ordinary continuous version of the gauge API. The orbit maps of the
action must be continuous; this is explicit data, not an arbitrary Prop field. -/
def gauge [IsTopologicalGroup H] (c : LParameter α) (h : H)
    (hα : ∀ k : H, Continuous (fun x : Γ => α x k)) : LParameter α :=
  ⟨c.val.gauge h, by sorry⟩

theorem gauge_apply [IsTopologicalGroup H] (c : LParameter α) (h : H)
    (hα : ∀ k : H, Continuous (fun x : Γ => α x k)) (x : Γ) :
    (c.gauge h hα).val x = h * c.val x * (α x h)⁻¹ := by sorry

theorem gauge_one [IsTopologicalGroup H] (c : LParameter α)
    (hα : ∀ k : H, Continuous (fun x : Γ => α x k)) :
    c.gauge 1 hα = c := by sorry

theorem gauge_mul [IsTopologicalGroup H] (c : LParameter α) (h k : H)
    (hα : ∀ k : H, Continuous (fun x : Γ => α x k)) :
    (c.gauge k hα).gauge h hα = c.gauge (h * k) hα := by sorry

/-- Equivariant continuous coefficient transport in the ordinary version. -/
def map {K : Type w} [Group K] [TopologicalSpace K] {β : Γ →* MulAut K}
    (c : LParameter α) (f : H →* K) (hf : Continuous f)
    (heq : ∀ x h, f (α x h) = β x (f h)) : LParameter β :=
  ⟨c.val.map f heq, by sorry⟩

/-- Lifts with fixed projection, expressed using the actual semidirect product.
Continuity of the first coordinate is the ordinary condition stated here;
the condensed finite-type section condition remains in the README. -/
def asLift {Q : Type w} [Group Q] (β : Q →* MulAut H) (η : Γ →* Q) :
    LParameter (β.comp η) ≃
      {s : Γ →* SemidirectProduct H Q β //
        (SemidirectProduct.rightHom : SemidirectProduct H Q β →* Q).comp s = η ∧
          Continuous (fun x : Γ => (s x).left)} := by sorry

theorem asLift_left {Q : Type w} [Group Q] (β : Q →* MulAut H) (η : Γ →* Q)
    (c : LParameter (β.comp η)) (x : Γ) :
    ((asLift β η c).val x).left = c.val x := by sorry

theorem asLift_right {Q : Type w} [Group Q] (β : Q →* MulAut H) (η : Γ →* Q)
    (c : LParameter (β.comp η)) (x : Γ) :
    ((asLift β η c).val x).right = η x := by sorry

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

theorem inclusion_injective : Function.Injective (inclusion δ ι) := by sorry

theorem lift_unique {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c))
    (g : C →ₐ[R] ParameterInvariantAlgebra δ ι)
    (hg : (inclusion δ ι).comp g = f) : g = lift δ ι f hf := by sorry
end ParameterInvariantAlgebra

-- coarse_trivial_group, and the torus case when its action is trivial.
example (ι : A →ₐ[R] B) : ParameterInvariantAlgebra ι ι = ⊤ := by sorry

-- coarse_affine_universal
example (δ ι : A →ₐ[R] B) {C : Type z} [CommRing C] [Algebra R C]
    (f : C →ₐ[R] A) (hf : ∀ c, δ (f c) = ι (f c)) :
    ∃! g : C →ₐ[R] ParameterInvariantAlgebra δ ι,
      (ParameterInvariantAlgebra.inclusion δ ι).comp g = f := by sorry
end Invariants

section ScalingCoaction
/-- O(A¹×G_m) is the Laurent polynomial ring over O(A¹). -/
abbrev ScalingRing := LaurentPolynomial (Polynomial (ZMod 2))

/-- The scaling coaction sends x to x·t. -/
noncomputable def scalingCoaction : Polynomial (ZMod 2) →ₐ[ZMod 2] ScalingRing :=
  Polynomial.aeval (LaurentPolynomial.C Polynomial.X * LaurentPolynomial.T 1)

/-- The canonical map sends x to x. -/
noncomputable def scalingUnit : Polynomial (ZMod 2) →ₐ[ZMod 2] ScalingRing :=
  Polynomial.aeval (LaurentPolynomial.C Polynomial.X)

-- coarse_scheme_invariants: the equalizer is precisely the constants.
example (f : Polynomial (ZMod 2)) :
    f ∈ ParameterInvariantAlgebra scalingCoaction scalingUnit ↔
      ∃ a : ZMod 2, f = Polynomial.C a := by sorry

example : (Polynomial.X : Polynomial (ZMod 2)) ∉
    ParameterInvariantAlgebra scalingCoaction scalingUnit := by sorry

-- Every F₂-rational scaling fixes every polynomial. This is a strictly larger algebra.
example (f : Polynomial (ZMod 2)) (u : (ZMod 2)ˣ) :
    Polynomial.eval₂ Polynomial.C (u.val • Polynomial.X) f = f := by sorry
end ScalingCoaction

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

def coproduct (a b : FreeCocycleIndex Γ) : FreeCocycleIndex Γ :=
  ofTuple Γ (a.rank + b.rank)
    (Fin.addCases (fun i => a.tuple (FreeGroup.of i))
      (fun i => b.tuple (FreeGroup.of i)))

def inl (a b : FreeCocycleIndex Γ) : a ⟶ coproduct Γ a b :=
  ⟨⟨FreeGroup.map (Fin.castAdd b.rank), by sorry⟩⟩

def inr (a b : FreeCocycleIndex Γ) : b ⟶ coproduct Γ a b :=
  ⟨⟨FreeGroup.map (Fin.natAdd a.rank), by sorry⟩⟩

def desc {a b c : FreeCocycleIndex Γ} (f : a ⟶ c) (g : b ⟶ c) :
    coproduct Γ a b ⟶ c :=
  ⟨⟨FreeGroup.lift (Fin.addCases
    (fun i => f.down.word (FreeGroup.of i))
    (fun i => g.down.word (FreeGroup.of i))), by sorry⟩⟩

theorem inl_desc {a b c : FreeCocycleIndex Γ} (f : a ⟶ c) (g : b ⟶ c) :
    inl Γ a b ≫ desc Γ f g = f := by sorry

theorem inr_desc {a b c : FreeCocycleIndex Γ} (f : a ⟶ c) (g : b ⟶ c) :
    inr Γ a b ≫ desc Γ f g = g := by sorry

theorem desc_unique {a b c : FreeCocycleIndex Γ} (f : a ⟶ c) (g : b ⟶ c)
    (h : coproduct Γ a b ⟶ c)
    (hl : inl Γ a b ≫ h = f) (hr : inr Γ a b ≫ h = g) :
    h = desc Γ f g := by sorry

noncomputable def coproductIsColimit (a b : FreeCocycleIndex Γ) :
    IsColimit (BinaryCofan.mk (inl Γ a b) (inr Γ a b)) := by sorry

theorem sifted : IsSifted (FreeCocycleIndex Γ) := by sorry

theorem ofTuple_generator (n : ℕ) (γ : Fin n → Γ) (i : Fin n) :
    (ofTuple Γ n γ).tuple (FreeGroup.of i) = γ i := by sorry

def identityIndex (n : ℕ) : FreeCocycleIndex (FreeGroup (Fin n)) :=
  ⟨n, MonoidHom.id _⟩

noncomputable def identityIndex_terminal (n : ℕ) :
    IsTerminal (identityIndex n) := by sorry

-- index_zero
example : IsInitial (ofTuple Γ 0 (fun i => Fin.elim0 i)) := by sorry

-- index_coproduct
example (a b : FreeCocycleIndex Γ) : (coproduct Γ a b).rank = a.rank + b.rank := by sorry

-- The two inclusions preserve the actual tuple, not just its length.
example (a b : FreeCocycleIndex Γ) (i : Fin a.rank) :
    (coproduct Γ a b).tuple (FreeGroup.of (Fin.castAdd b.rank i)) =
      a.tuple (FreeGroup.of i) := by sorry

example (a b : FreeCocycleIndex Γ) (i : Fin b.rank) :
    (coproduct Γ a b).tuple (FreeGroup.of (Fin.natAdd a.rank i)) =
      b.tuple (FreeGroup.of i) := by sorry
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

theorem ofFree_naturality (F : FreeCocycleIndex Γ ⥤ CommRingCat.{u})
    {a b : FreeCocycleIndex Γ} (f : a ⟶ b) :
    F.map f ≫ ofFree F b = ofFree F a := by sorry

theorem lift_unique (F : FreeCocycleIndex Γ ⥤ CommRingCat.{u}) (s : Cocone F)
    (f : ExcursionAlgebra F ⟶ s.pt)
    (hf : ∀ a, ofFree F a ≫ f = s.ι.app a) : f = lift F s := by sorry

@[ext] theorem hom_ext (F : FreeCocycleIndex Γ ⥤ CommRingCat.{u})
    {A : CommRingCat.{u}} {f g : ExcursionAlgebra F ⟶ A}
    (h : ∀ a, ofFree F a ≫ f = ofFree F a ≫ g) : f = g := by sorry

-- excursion_free_group: the underlying ring diagram has a terminal tuple.
example (n : ℕ) (F : FreeCocycleIndex (FreeGroup (Fin n)) ⥤ CommRingCat.{0}) :
    Nonempty (ExcursionAlgebra F ≅ F.obj (FreeCocycleIndex.identityIndex n)) := by sorry

-- excursion_trivial_dual: the ordinary constant-ring instance of the full test.
example (A : CommRingCat.{u}) :
    Nonempty (ExcursionAlgebra ((Functor.const (FreeCocycleIndex Γ)).obj A) ≅ A) := by
  sorry

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

/-- Ordinary tuple shadow of the imported IHG carrier. This is not a second
owner of reductive pseudocharacters. The identification D n = O((H⋊Q)^n)^H
and its genuine coordinate maps are absent supplier inputs. -/
structure InvariantTupleShadow where
  Θ : ∀ n, 0 < n → D n →ₐ[R] ((Fin n → Γ) → A)
  reindex_law : ∀ {m n} (hm : 0 < m) (hn : 0 < n)
    (u : Fin m → Fin n) (f : D m) (γ : Fin n → Γ),
    Θ n hn (reindex u f) γ = Θ m hm f (fun j => γ (u j))
  multiply_law : ∀ {m n} (hm : 0 < m) (hn : 0 < n)
    (u : Fin m → Fin n) (f : D n) (γ : Fin m → Γ),
    Θ m hm (multiply u f) γ = Θ n hn f (orderedFiberProduct u γ)

namespace InvariantTupleShadow
@[ext] theorem ext (c d : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply)
    (h : ∀ n hn f γ, c.Θ n hn f γ = d.Θ n hn f γ) : c = d := by sorry

def map {B : Type w} [CommRing B] [Algebra R B]
    (c : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply)
    (f : A →ₐ[R] B) : InvariantTupleShadow (Γ := Γ) (A := B) D reindex multiply := by
  sorry

def precomp {Γ' : Type u} [Group Γ']
    (c : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply)
    (f : Γ' →* Γ) : InvariantTupleShadow (Γ := Γ') (A := A) D reindex multiply := by
  sorry

-- Additional ordinary tuple check; this is not the geometric pseudocharacter_trivial_group test.
example (c : InvariantTupleShadow (Γ := Unit) (A := A) D reindex multiply)
    (n : ℕ) (hn : 0 < n) (f : D n) (γ δ : Fin n → Unit) :
    c.Θ n hn f γ = c.Θ n hn f δ := by sorry

-- pseudochar_map
example (c : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply) :
    c.map D reindex multiply (AlgHom.id R A) = c := by sorry

def IsContinuous [TopologicalSpace Γ] [TopologicalSpace A]
    (c : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply) : Prop :=
  ∀ n hn f, Continuous (c.Θ n hn f)
end InvariantTupleShadow

variable {Q : Type z} [Group Q] [Fintype Q] [DecidableEq Q]
  (components : ∀ n, (Fin n → Q) → D n) (η : Γ →* Q)

/-- Prescribed-component fibre over a supplied invariant tuple diagram.
The idempotents must be the actual component idempotents at the geometric owner;
this prototype expresses their evaluation condition without fabricating that owner. -/
structure ProjectedPseudocharacter where
  underlying : InvariantTupleShadow (Γ := Γ) (A := A) D reindex multiply
  component_eval : ∀ n hn (q : Fin n → Q) (γ : Fin n → Γ),
    underlying.Θ n hn (components n q) γ =
      if (fun i => η (γ i)) = q then 1 else 0

namespace ProjectedPseudocharacter
@[ext] theorem ext
    (c d : ProjectedPseudocharacter (A := A) D reindex multiply components η)
    (h : c.underlying = d.underlying) : c = d := by sorry

def forget (c : ProjectedPseudocharacter (A := A) D reindex multiply components η) :=
  c.underlying

def map {B : Type w} [CommRing B] [Algebra R B]
    (c : ProjectedPseudocharacter (A := A) D reindex multiply components η)
    (f : A →ₐ[R] B) : ProjectedPseudocharacter (A := B) D reindex multiply components η := by
  sorry

def precomp {Γ' : Type u} [Group Γ']
    (c : ProjectedPseudocharacter (A := A) D reindex multiply components η)
    (f : Γ' →* Γ) :
    ProjectedPseudocharacter (A := A) D reindex multiply components (η.comp f) := by
  sorry

def IsContinuous [TopologicalSpace Γ] [TopologicalSpace A]
    (c : ProjectedPseudocharacter (A := A) D reindex multiply components η) : Prop :=
  c.underlying.IsContinuous D reindex multiply

-- Component-fibre regression, expressing the projection part of projected_trivial_group.
example (η₀ : Unit →* Q) (c : ProjectedPseudocharacter (Γ := Unit) (A := A)
    D reindex multiply components η₀) (n : ℕ) (hn : 0 < n) :
    c.underlying.Θ n hn (components n (fun _ => 1)) (fun _ => ()) = 1 := by sorry

-- projected_wrong_component: matching tuple families cannot belong to two different fibres.
example [Nontrivial A] {η' : Γ →* Q}
    (c : ProjectedPseudocharacter (A := A) D reindex multiply components η)
    (d : ProjectedPseudocharacter (A := A) D reindex multiply components η')
    (h : c.underlying = d.underlying) : η = η' := by sorry

-- Additional coefficient-fibre identity check.
example (c : ProjectedPseudocharacter (A := A) D reindex multiply components η) :
    c.map D reindex multiply components η (AlgHom.id R A) = c := by sorry
end ProjectedPseudocharacter
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

/-- Group-basis shadow of the imported IHG.0 linear pseudocharacter on R[Γ].
The full adapter requires that imported carrier as specified in README.md.
The linear extension below uses the actual Mathlib group algebra. -/
structure GroupTraceShadow (Γ : Type u) [Group Γ] (R : Type v) [CommRing R]
    (rank : ℕ) where
  toFun : Γ → R
  normalized : toFun 1 = rank
  central : ∀ x y, toFun (x * y) = toFun (y * x)
  alternating : ∀ γ : Fin (rank + 1) → Γ,
    ∑ σ : Equiv.Perm (Fin (rank + 1)),
      (((Equiv.Perm.sign σ : ℤˣ) : ℤ) : R) * traceCycleValue toFun γ σ = 0

instance {r : ℕ} : CoeFun (GroupTraceShadow Γ R r) (fun _ => Γ → R) :=
  ⟨GroupTraceShadow.toFun⟩

namespace GroupTraceShadow
noncomputable def cycleValue {r n : ℕ} (τ : GroupTraceShadow Γ R r)
    (γ : Fin n → Γ) (σ : Equiv.Perm (Fin n)) : R := traceCycleValue τ γ σ

noncomputable def ofRepresentation {n : ℕ} (ρ : Γ →* (Matrix (Fin n) (Fin n) R)ˣ) :
    GroupTraceShadow Γ R n where
  toFun := fun γ => Matrix.trace (ρ γ : Matrix (Fin n) (Fin n) R)
  normalized := by sorry
  central := by sorry
  alternating := by sorry

noncomputable def map {S : Type w} [CommRing S] {r : ℕ}
    (f : R →+* S) (τ : GroupTraceShadow Γ R r) : GroupTraceShadow Γ S r where
  toFun := fun γ => f (τ γ)
  normalized := by sorry
  central := by sorry
  alternating := by sorry

-- trace_rank_one
example (τ : GroupTraceShadow Γ R 1) (x y : Γ) : τ (x * y) = τ x * τ y := by sorry

-- trace_zero_rank
example (τ : GroupTraceShadow Γ R 0) : ∀ γ, τ γ = 0 := by sorry

-- trace_semisimple_sum
example (χ ψ : Γ →* R) : ∃ τ : GroupTraceShadow Γ R 2,
    ∀ γ, τ γ = χ γ + ψ γ := by sorry

-- trace_not_rank_one_constant
example : ¬ ∃ τ : GroupTraceShadow Γ ℚ 2, ∀ γ, τ γ = 1 := by sorry
end GroupTraceShadow

namespace GroupTraceAdapter
/-- The A-linear extension used in the full IHG adapter. -/
noncomputable def extendFunction (τ : Γ → R) : MonoidAlgebra R Γ →ₗ[R] R where
  toFun := fun x => x.coeff.sum (fun γ a => a * τ γ)
  map_add' := by sorry
  map_smul' := by sorry

noncomputable def restrictFunction (T : MonoidAlgebra R Γ →ₗ[R] R) : Γ → R :=
  fun γ => T (MonoidAlgebra.of R Γ γ)

theorem extend_basis (τ : Γ → R) (γ : Γ) :
    extendFunction τ (MonoidAlgebra.of R Γ γ) = τ γ := by sorry

theorem extend_restrict (T : MonoidAlgebra R Γ →ₗ[R] R) :
    extendFunction (restrictFunction T) = T := by sorry

-- trace_linear_extension: this is the linear adapter, not a multiplicative map.
example (τ : Γ → R) (γ δ : Γ) :
    extendFunction τ (2 • MonoidAlgebra.of R Γ γ - MonoidAlgebra.of R Γ δ) =
      2 * τ γ - τ δ := by sorry

-- Normalization on the actual group-algebra unit.
example {r : ℕ} (τ : GroupTraceShadow Γ R r) : extendFunction τ 1 = r := by sorry
end GroupTraceAdapter
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

section FixedGroupChecks
variable {G : Type u} [Group G]

-- Cyclic fixed-locus point-group compatibility, using the existing Tau Ceti carrier.
example (θ : G ≃* G) (g : G) :
    g ∈ TauCeti.fixedSubgroup θ.toMonoidHom ↔ θ g = g := by sorry

example : TauCeti.fixedSubgroup (MonoidHom.id G) = ⊤ := by sorry
end FixedGroupChecks

end TauCeti.LanglandsParameterStacks
