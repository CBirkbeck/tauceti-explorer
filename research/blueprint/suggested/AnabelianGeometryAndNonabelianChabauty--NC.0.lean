import Mathlib.CategoryTheory.Galois.Topology
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.Group.Subgroup
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Data.ZMod.Basic
import TauCeti.FieldTheory.GaloisCohomology.Kummer

set_option autoImplicit false

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. All goals are admitted; elaboration is not an implementation claim.

Ordinary finite-etale paths, fibre functors and their topology belong to IG.0. The native
natural-isomorphism carrier below adds the restriction-to-constants condition. The kernel
coordinates are obtained after choosing such a path, and are not a replacement for that
geometric carrier. General nonabelian H1 and topological torsors belong to NC.3.

The actual scheme/fibre-functor instantiation, rational/tangential Kummer comparison,
Chen's global specialization natural transformation, and geometric existence of symmetric
good paths have no native scheme signatures here. The packet records their exact contracts
and gaps. The inherited K(pi,1) declarations remain in the accepted parent packet.
-/

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC0

open CategoryTheory CategoryTheory.Functor
open scoped CategoryTheory.PreGaloisCategory

universe u v w

section Constants
variable {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D]
variable (K : D ⥤ C) {B X : C ⥤ FintypeCat.{w}} {W : D ⥤ FintypeCat.{w}}
variable (rb : K ⋙ B ≅ W) (rx : K ⋙ X ≅ W)

/-- Arithmetic paths over the identity on the constant-cover fibre functor. -/
def ArithmeticPath := {p : B ≅ X // isoWhiskerLeft K p = rb ≪≫ rx.symm}

namespace ArithmeticPath

theorem restrict_id (p : ArithmeticPath K rb rx) :
    rb.symm ≪≫ isoWhiskerLeft K p.val ≪≫ rx = Iso.refl W := by sorry

def identity : ArithmeticPath K rb rb := ⟨Iso.refl B, by sorry⟩

/-- Geometric right action: first apply the source automorphism, then the path. -/
def rightMul (p : ArithmeticPath K rb rx) (h : Aut B)
    (hh : isoWhiskerLeft K h = Iso.refl (K ⋙ B)) : ArithmeticPath K rb rx :=
  ⟨h ≪≫ p.val, by sorry⟩

/-- The arithmetic Galois action, with compatible lifts at the two endpoints. -/
def galoisAction (p : ArithmeticPath K rb rx) (a : Aut B) (b : Aut X)
    (h : rb.symm ≪≫ isoWhiskerLeft K a ≪≫ rb =
      rx.symm ≪≫ isoWhiskerLeft K b ≪≫ rx) : ArithmeticPath K rb rx :=
  ⟨a.symm ≪≫ p.val ≪≫ b, by sorry⟩

theorem rightMul_val (p : ArithmeticPath K rb rx) (h : Aut B)
    (hh : isoWhiskerLeft K h = Iso.refl (K ⋙ B)) :
    (rightMul K rb rx p h hh).val = h ≪≫ p.val := by sorry

theorem galoisAction_val (p : ArithmeticPath K rb rx) (a : Aut B) (b : Aut X)
    (h : rb.symm ≪≫ isoWhiskerLeft K a ≪≫ rb =
      rx.symm ≪≫ isoWhiskerLeft K b ≪≫ rx) :
    (galoisAction K rb rx p a b h).val = a.symm ≪≫ p.val ≪≫ b := by sorry

-- Tests: identity path; nontrivial geometric translation is retained; nonidentity
-- restriction to constants excludes an otherwise valid ordinary path.
-- test: arithmeticPath_identity
example : (identity K rb).val = Iso.refl B := by sorry
-- test: arithmeticPath_translation_ne
example (p : ArithmeticPath K rb rx) (h : Aut B)
    (hh : isoWhiskerLeft K h = Iso.refl (K ⋙ B)) (hne : h ≠ 1) :
    rightMul K rb rx p h hh ≠ p := by sorry
-- test: arithmeticPath_constants_excluded
example (p : B ≅ X) (h : isoWhiskerLeft K p ≠ rb ≪≫ rx.symm) :
    ¬ ∃ q : ArithmeticPath K rb rx, q.val = p := by sorry

end ArithmeticPath
end Constants

section Transport
variable {C : Type u} [Category.{v} C]
variable {B X Y : C ⥤ FintypeCat.{w}}
variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]

/-- Backward transport: the opposite direction to IG.0's forward basepoint map. -/
def pullAut (p : B ≅ X) : Aut X →* Aut B where
  toFun g := p ≪≫ g ≪≫ p.symm
  map_one' := by sorry
  map_mul' := by sorry

theorem pullAut_continuous (p : B ≅ X) : Continuous (pullAut p) := by sorry

/-- The section at x, transferred to b along a geometric path. -/
def transportedSection (p : B ≅ X) (sx : Γ →ₜ* Aut X) : Γ →ₜ* Aut B where
  toMonoidHom := (pullAut p).comp sx.toMonoidHom
  continuous_toFun := by sorry

theorem transportedSection_apply (p : B ≅ X) (sx : Γ →ₜ* Aut X) (σ : Γ) :
    transportedSection p sx σ = p ≪≫ sx σ ≪≫ p.symm := by sorry

theorem transportedSection_changePath (p : B ≅ X) (sx : Γ →ₜ* Aut X)
    (h : Aut B) (σ : Γ) :
    transportedSection (h ≪≫ p) sx σ = h⁻¹ * transportedSection p sx σ * h := by sorry

theorem transportedSection_comp (p : B ≅ X) (q : X ≅ Y) (sy : Γ →ₜ* Aut Y) :
    transportedSection (p ≪≫ q) sy = transportedSection p (transportedSection q sy) := by sorry

-- Tests: the identity; geometric translation gives the displayed conjugacy;
-- noncommuting elements detect the inverse convention.
-- test: transportedSection_identity
example (sx : Γ →ₜ* Aut B) : transportedSection (Iso.refl B) sx = sx := by sorry
-- test: transportedSection_translation
example (p : B ≅ X) (sx : Γ →ₜ* Aut X) (h : Aut B) (σ : Γ) :
    h * transportedSection (h ≪≫ p) sx σ * h⁻¹ = transportedSection p sx σ := by sorry
-- test: transportedSection_inverse_order
example (h g : Aut B) (hne : h⁻¹ * g * h ≠ h * g * h⁻¹) :
    pullAut h g ≠ h * g * h⁻¹ := by sorry
end Transport

section KernelCoordinates
variable {E Γ : Type*} [Group E] [TopologicalSpace E] [IsTopologicalGroup E]
variable [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
variable (q : E →ₜ* Γ)

-- A notation for native continuous sections, not a second extension theory.
abbrev Section := {s : Γ →ₜ* E // q.comp s = ContinuousMonoidHom.id Γ}
abbrev GeometricKernel := q.toMonoidHom.ker

/-- Conjugation action on the geometric kernel determined by the reference section. -/
def kernelAction (s0 : Section q) (σ : Γ) (h : GeometricKernel q) : GeometricKernel q :=
  ⟨s0.val σ * h.val * (s0.val σ)⁻¹, by sorry⟩

/-- The arithmetic path action after a chosen geometric path identifies its torsor with ker q. -/
def pathAction (s0 s1 : Section q) (σ : Γ) (h : GeometricKernel q) : GeometricKernel q :=
  ⟨s1.val σ * h.val * (s0.val σ)⁻¹, by sorry⟩

theorem pathAction_mul (s0 s1 : Section q) (σ τ : Γ) (h : GeometricKernel q) :
    pathAction q s0 s1 (σ * τ) h = pathAction q s0 s1 σ (pathAction q s0 s1 τ h) := by sorry

theorem pathAction_continuous (s0 s1 : Section q) :
    Continuous (fun z : Γ × GeometricKernel q => pathAction q s0 s1 z.1 z.2) := by sorry

theorem pathAction_rightMul (s0 s1 : Section q) (σ : Γ) (h k : GeometricKernel q) :
    pathAction q s0 s1 σ (h * k) = pathAction q s0 s1 σ h * kernelAction q s0 σ k := by sorry

/-- Specific cocycle of a chosen point h in the arithmetic path torsor. -/
def pathCocycle (s0 s1 : Section q) (h : GeometricKernel q) : C(Γ, GeometricKernel q) where
  toFun σ := h⁻¹ * pathAction q s0 s1 σ h
  continuous_toFun := by sorry

theorem pathCocycle_apply (s0 s1 : Section q) (h : GeometricKernel q) (σ : Γ) :
    (pathCocycle q s0 s1 h σ).val = h.val⁻¹ * s1.val σ * h.val * (s0.val σ)⁻¹ := by sorry

theorem pathCocycle_mul (s0 s1 : Section q) (h : GeometricKernel q) (σ τ : Γ) :
    pathCocycle q s0 s1 h (σ * τ) = pathCocycle q s0 s1 h σ *
      kernelAction q s0 σ (pathCocycle q s0 s1 h τ) := by sorry

theorem pathCocycle_changePoint (s0 s1 : Section q) (h k : GeometricKernel q) (σ : Γ) :
    pathCocycle q s0 s1 (h * k) σ = k⁻¹ * pathCocycle q s0 s1 h σ * kernelAction q s0 σ k := by sorry

-- Tests: identical endpoints at the identity; a changed point is generally not the same
-- representative; differing sections give a nontrivial value at the identity path.
-- test: pathCocycle_same_sections
example (s0 : Section q) (σ : Γ) : pathCocycle q s0 s0 1 σ = 1 := by sorry
-- test: pathCocycle_changed_representative
example (s0 : Section q) (h : GeometricKernel q) (σ : Γ)
    (hne : kernelAction q s0 σ h ≠ h) : pathCocycle q s0 s0 h σ ≠ 1 := by sorry
-- test: pathCocycle_distinct_sections
example (s0 s1 : Section q) (σ : Γ) (hne : s1.val σ ≠ s0.val σ) :
    pathCocycle q s0 s1 1 σ ≠ 1 := by sorry

/-- The fixed-path criterion and the neutral-class criterion of the imported NC.3 H1. -/
theorem fixedPath_iff_sections_conjugate (s0 s1 : Section q) :
    (∃ h : GeometricKernel q, ∀ σ, pathAction q s0 s1 σ h = h) ↔
    ∃ h : GeometricKernel q, ∀ σ, s1.val σ = h.val * s0.val σ * h.val⁻¹ := by sorry

theorem pathCocycle_neutral_iff_fixedPath (s0 s1 : Section q) (h : GeometricKernel q) :
    (∃ k : GeometricKernel q, ∀ σ,
      pathCocycle q s0 s1 h σ = k * (kernelAction q s0 σ k)⁻¹) ↔
    ∃ k : GeometricKernel q, ∀ σ, pathAction q s0 s1 σ k = k := by sorry

/-- Morphisms of arithmetic extensions commute with the coordinate cocycles. -/
theorem pathCocycle_map {E' : Type*} [Group E'] [TopologicalSpace E'] [IsTopologicalGroup E']
    (q' : E' →ₜ* Γ) (f : E →ₜ* E') (hf : q'.comp f = q)
    (s0 s1 : Section q) (t0 t1 : Section q')
    (h0 : f.comp s0.val = t0.val) (h1 : f.comp s1.val = t1.val)
    (h : GeometricKernel q) (σ : Γ) :
    f (pathCocycle q s0 s1 h σ).val =
      (pathCocycle q' t0 t1 ⟨f h.val, by sorry⟩ σ).val := by sorry

/-- Changing the reference section twists its kernel action by the path cocycle. -/
theorem kernelAction_changeReference (s0 s1 : Section q) (σ : Γ) (h : GeometricKernel q) :
    kernelAction q s1 σ h = pathCocycle q s0 s1 1 σ * kernelAction q s0 σ h *
      (pathCocycle q s0 s1 1 σ)⁻¹ := by sorry
end KernelCoordinates

section LocalSpecialization
variable {Y : Type u} (e : Y → ℕ+)

-- Local power-map coordinates used only to prove Chen's geometric specialization theorem.
abbrev BranchFiber := Σ y : Y, ZMod (e y : ℕ)

instance branchNeZero (y : Y) : NeZero (e y : ℕ) := ⟨(e y).ne_zero⟩

/-- Translation in each local Kummer fibre; a compatible primitive root chooses +1. -/
def branchRotation : Equiv.Perm (BranchFiber e) where
  toFun x := ⟨x.1, x.2 + 1⟩
  invFun x := ⟨x.1, x.2 - 1⟩
  left_inv := by sorry
  right_inv := by sorry

abbrev InertiaOrbits := MulAction.orbitRel.Quotient
  (Subgroup.zpowers (branchRotation e)) (BranchFiber e)

/-- The branch projection factors through the actual cyclic-action orbit quotient. -/
def specializeLocal : InertiaOrbits e → Y :=
  Quotient.lift (fun x : BranchFiber e => x.1) (by sorry)

theorem specializeLocal_mk (x : BranchFiber e) :
    specializeLocal e (Quotient.mk _ x) = x.1 := by sorry

theorem branchRotation_apply (x : BranchFiber e) : branchRotation e x = ⟨x.1, x.2 + 1⟩ := by sorry

theorem inertiaOrbit_iff (x z : BranchFiber e) :
    MulAction.orbitRel (Subgroup.zpowers (branchRotation e)) (BranchFiber e) x z ↔ x.1 = z.1 := by sorry

theorem specializeLocal_bijective : Function.Bijective (specializeLocal e) := by sorry

theorem branch_card (y : Y) : Fintype.card (ZMod (e y : ℕ)) = e y := by sorry

-- Tests: a degree-three branch has one orbit, not three; distinct branches stay
-- distinct even when their ramification indices coincide; unramified branches are fixed.
-- test: inertiaOrbit_degree_three
example : Subsingleton (InertiaOrbits (fun _ : Unit => (3 : ℕ+))) := by sorry
-- test: inertiaOrbit_distinct_branches
example (x z : BranchFiber (fun _ : Bool => (2 : ℕ+))) (h : x.1 ≠ z.1) :
    (Quotient.mk _ x : InertiaOrbits (fun _ : Bool => (2 : ℕ+))) ≠ Quotient.mk _ z := by sorry
-- test: inertiaOrbit_unramified
example (x : BranchFiber (fun _ : Y => (1 : ℕ+))) :
    branchRotation (fun _ : Y => (1 : ℕ+)) x = x := by sorry
end LocalSpecialization

section GoodPaths
variable {C : Type u} [Category.{v} C]
variable {F0 F1 Finf : C ⥤ FintypeCat.{w}}

/-- Chen's relation uses the exact order infinity, one, zero. -/
def IsGoodPath (γ0 : Aut F0) (γ1 : Aut F1) (γinf : Aut Finf) (δ : F0 ≅ Finf) : Prop :=
  (Subgroup.closure {γ0, pullAut δ γinf}).topologicalClosure = ⊤ ∧
    ∃ ε : F0 ≅ F1, pullAut δ γinf * pullAut ε γ1 * γ0 = 1

theorem IsGoodPath.generates {γ0 : Aut F0} {γ1 : Aut F1} {γinf : Aut Finf} {δ : F0 ≅ Finf}
    (h : IsGoodPath γ0 γ1 γinf δ) :
    (Subgroup.closure {γ0, pullAut δ γinf}).topologicalClosure = ⊤ := by sorry

theorem IsGoodPath.relation {γ0 : Aut F0} {γ1 : Aut F1} {γinf : Aut Finf} {δ : F0 ≅ Finf}
    (h : IsGoodPath γ0 γ1 γinf δ) :
    ∃ ε : F0 ≅ F1, pullAut δ γinf * pullAut ε γ1 * γ0 = 1 := by sorry

theorem isGoodPath_iff (γ0 : Aut F0) (γ1 : Aut F1) (γinf : Aut Finf) (δ : F0 ≅ Finf) :
    IsGoodPath γ0 γ1 γinf δ ↔
      (Subgroup.closure {γ0, pullAut δ γinf}).topologicalClosure = ⊤ ∧
        ∃ ε : F0 ≅ F1, pullAut δ γinf * pullAut ε γ1 * γ0 = 1 := by sorry

-- Tests: the zero peripheral system works only for the trivial group; a correctly ordered
-- noncommutative relation works; reversing the order can destroy that relation.
-- test: goodPath_trivial_group
example [Subsingleton (Aut F0)] : IsGoodPath (1 : Aut F0) (1 : Aut F0) (1 : Aut F0) (Iso.refl F0) := by sorry
-- test: goodPath_identity_nonexample
example (h : ¬ Subsingleton (Aut F0)) : ¬ IsGoodPath (1 : Aut F0) (1 : Aut F0) (1 : Aut F0) (Iso.refl F0) := by sorry
-- test: goodPath_ordered_relation
example (a b : Aut F0) (hgen : (Subgroup.closure {a, b}).topologicalClosure = ⊤) :
    IsGoodPath a (b⁻¹ * a⁻¹) b (Iso.refl F0) := by sorry
-- test: goodPath_reversed_order
example (a b : Aut F0) (h : b * a ≠ a * b) : a * (b⁻¹ * a⁻¹) * b ≠ 1 := by sorry

/-- Pullback of a path by inversion of the punctured line, with endpoint identifications. -/
def invertPath (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf) (einf : J ⋙ Finf ≅ F0)
    (δ : F0 ≅ Finf) : Finf ≅ F0 := e0.symm ≪≫ isoWhiskerLeft J δ ≪≫ einf

/-- Chen's symmetry witnesses are integers, not profinite integers. -/
def IsSymmetricPath (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf) (einf : J ⋙ Finf ≅ F0)
    (γ0 : Aut F0) (γinf : Aut Finf) (δ : F0 ≅ Finf) : Prop :=
  ∃ r s : ℤ, invertPath J e0 einf δ = (γinf ^ s) ≪≫ δ.symm ≪≫ (γ0 ^ r)

theorem IsSymmetricPath.witnesses (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf)
    (einf : J ⋙ Finf ≅ F0) (γ0 : Aut F0) (γinf : Aut Finf) (δ : F0 ≅ Finf)
    (h : IsSymmetricPath J e0 einf γ0 γinf δ) :
    ∃ r s : ℤ, invertPath J e0 einf δ = (γinf ^ s) ≪≫ δ.symm ≪≫ (γ0 ^ r) := by sorry

theorem isSymmetricPath_of_eq (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf)
    (einf : J ⋙ Finf ≅ F0) (γ0 : Aut F0) (γinf : Aut Finf) (δ : F0 ≅ Finf)
    (r s : ℤ) (h : invertPath J e0 einf δ = (γinf ^ s) ≪≫ δ.symm ≪≫ (γ0 ^ r)) :
    IsSymmetricPath J e0 einf γ0 γinf δ := by sorry

theorem isSymmetricPath_iff (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf)
    (einf : J ⋙ Finf ≅ F0) (γ0 : Aut F0) (γinf : Aut Finf) (δ : F0 ≅ Finf) :
    IsSymmetricPath J e0 einf γ0 γinf δ ↔
      ∃ r s : ℤ, invertPath J e0 einf δ = (γinf ^ s) ≪≫ δ.symm ≪≫ (γ0 ^ r) := by sorry

-- Tests use the identity pullback with its actual functor unitor, so there is no assumed
-- abstract path involution. Identity is symmetric; zero inertia forces a loop to square
-- to one; an order-three loop fails.
-- test: symmetricPath_identity
example : IsSymmetricPath (𝟭 C) (Functor.leftUnitor F0) (Functor.leftUnitor F0)
    1 1 (Iso.refl F0) := by sorry
-- test: symmetricPath_zero_inertia
example (δ : Aut F0) :
    IsSymmetricPath (𝟭 C) (Functor.leftUnitor F0) (Functor.leftUnitor F0) 1 1 δ ↔ δ * δ = 1 := by sorry
-- test: symmetricPath_square_nonexample
example (δ : Aut F0) (h : δ * δ ≠ 1) :
    ¬ IsSymmetricPath (𝟭 C) (Functor.leftUnitor F0) (Functor.leftUnitor F0) 1 1 δ := by sorry
end GoodPaths

/-! The rational/tangential acceptance test consumes the existing Kummer map. These examples
check its nontrivial finite projections without introducing a second Kummer definition. -/
-- test: kummer_two_nontrivial
example : TauCeti.kummerMap ℚ 2 (by norm_num) (Units.mk0 2 (by norm_num)) ≠ 1 := by sorry
-- test: kummer_four_trivial
example : TauCeti.kummerMap ℚ 2 (by norm_num) (Units.mk0 4 (by norm_num)) = 1 := by sorry
-- test: kummer_one_trivial
example : TauCeti.kummerMap ℚ 1 (by norm_num) (Units.mk0 2 (by norm_num)) = 1 := by sorry

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC0
