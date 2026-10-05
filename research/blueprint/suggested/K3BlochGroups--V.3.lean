/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/K3BlochGroups--V.3.md is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation; every packet node stays unchecked.

BP-K3BlochGroups--V.3, Codex — codex-o0QQ19.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

`Imported` gives local signature forms for inherited SAME-roadmap objects,
not additional planned nodes. Its reduced free presentation is canonically
identified with the inherited presentation killing [1]. Cross-ratios and the
extended CGZ arithmetic are imported from their existing V.4/V.3 nodes.
No analytic dilogarithm is defined here.

The curve block uses actual schemes, smooth-relative-dimension predicates and
function fields. Canonical projective evaluation is an upstream dictionary
request. Quotient descent signatures explicitly take its concrete relation
containment as an input. They do not assert boundary closure or generic
relation containment for arbitrary evaluation functions. The two projective-line tests display concrete evaluation facts as hypotheses.
The unconditional geometric closure and relation-containment claims cannot
yet be stated without the canonical dictionary input; named comments explain
what is missing. No arbitrary evaluation function is asserted to supply it.
-/
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Exact.Basic
import Mathlib.Algebra.FreeAbelianGroup.Finsupp
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Fin.Embedding
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.Torsion
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Topology.Compactification.OnePoint.Basic

noncomputable section
open scoped TensorProduct
open CategoryTheory

namespace TauCeti.BlochConventions

instance primeTwo : Fact (Nat.Prime 2) := ⟨by decide⟩
instance primeThree : Fact (Nat.Prime 3) := ⟨by decide⟩
instance primeFive : Fact (Nat.Prime 5) := ⟨by decide⟩
instance primeSeven : Fact (Nat.Prime 7) := ⟨by decide⟩
instance primeEleven : Fact (Nat.Prime 11) := ⟨by decide⟩

abbrev Nondeg (F : Type) [Field F] := {x : F // x ≠ 0 ∧ x ≠ 1}
abbrev RawSymbols (F : Type) [Field F] := FreeAbelianGroup (Nondeg F)
abbrev UnitAdd (F : Type) [Field F] := Additive Fˣ
abbrev FullTensor (F : Type) [Field F] := UnitAdd F ⊗[ℤ] UnitAdd F
abbrev ProjectiveSymbols (F : Type) [Field F] := FreeAbelianGroup (OnePoint F)
def FourElements (F : Type) : Prop := 4 ≤ Cardinal.mk F

namespace Imported
variable (F : Type) [Field F]

def sym (x : F) : RawSymbols F := by
  classical
  exact if hx : x ≠ 0 ∧ x ≠ 1 then FreeAbelianGroup.of ⟨x, hx⟩ else 0

def unit (x : F) (hx : x ≠ 0) : UnitAdd F :=
  Additive.ofMul (Units.mk0 x hx)

-- K3BlochGroups:V.3/antisymmetric-tensor-quotient
abbrev symmetric : Submodule ℤ (FullTensor F) :=
  LinearMap.range (LinearMap.id + (TensorProduct.comm ℤ (UnitAdd F) (UnitAdd F)).toLinearMap)
abbrev Qs := FullTensor F ⧸ symmetric F
abbrev pi : FullTensor F →+ Qs F := (symmetric F).mkQ.toAddMonoidHom
abbrev Exterior := ⋀[ℤ]^2 (UnitAdd F)
def toExterior : Qs F →+ Exterior F := by sorry

def fiveTerm (x y : F) : RawSymbols F :=
  sym F x - sym F y + sym F (y / x) -
    sym F ((1 - x⁻¹) / (1 - y⁻¹)) + sym F ((1 - x) / (1 - y))

-- K3BlochGroups:V.3/five-term-relation and pre-bloch-group
abbrev R5 : AddSubgroup (RawSymbols F) :=
  AddSubgroup.closure {r | ∃ x y : F, x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧
    x ≠ y ∧ r = fiveTerm F x y}
abbrev P := RawSymbols F ⧸ R5 F
abbrev q : RawSymbols F →+ P F := QuotientAddGroup.mk' (R5 F)
def boundary : P F →+ Qs F := by sorry
abbrev B := (boundary F).ker
abbrev BE := ((toExterior F).comp (boundary F)).ker

def h : UnitAdd F →+ P F := by sorry
abbrev H : AddSubgroup (P F) := (h F).range
def c : B F := by sorry

variable {E : Type} [Field E]
def freeMap (f : F →+* E) : RawSymbols F →+ RawSymbols E := by sorry
def tensorMap (f : F →+* E) : FullTensor F →+ FullTensor E := by sorry
def pMap (f : F →+* E) : P F →+ P E := by sorry
def bMap (f : F →+* E) : B F →+ B E := by sorry

-- K3BlochGroups:V.4/cross-ratio; no new configuration definition.
def crossRatio (t : Fin 4 ↪ OnePoint F) : Nondeg F := by sorry

-- Same extended five-term subgroup in both CGZ versions; inherited V.3.
def Cext : AddSubgroup (ProjectiveSymbols F) := by sorry
abbrev Extended := ProjectiveSymbols F ⧸ Cext F
abbrev extQ : ProjectiveSymbols F →+ Extended F := QuotientAddGroup.mk' (Cext F)
def j : P F →+ Extended F := by sorry
def oldBoundary : ProjectiveSymbols F →+ Exterior F := by sorry
abbrev OldCycles := (oldBoundary F).ker
def oldCycleMap : OldCycles F →+ Extended F := by sorry
abbrev OldB := (oldCycleMap F).range
def oldCompare : B F →+ OldB F := by sorry

def coeffMap (R : Type) [CommRing R] {M N : Type} [AddCommGroup M] [AddCommGroup N]
    (f : M →+ N) : R ⊗[ℤ] M →+ R ⊗[ℤ] N :=
  (TensorProduct.map (LinearMap.id : R →ₗ[ℤ] R) f.toIntLinearMap).toAddMonoidHom
end Imported

/-! K3BlochGroups:V.3/bloch-lecture-kernel -/
namespace LectureBloch
variable (F : Type) [Field F]

def lambda : RawSymbols F →+ FullTensor F := by sorry
abbrev Group := (lambda F).ker

lemma lambda_symbol (x : F) (hx : x ≠ 0) (hx1 : x ≠ 1) :
    lambda F (Imported.sym F x) =
      Imported.unit F (1 - x) (by sorry) ⊗ₜ[ℤ] Imported.unit F x hx := by sorry
lemma mem_iff (α : RawSymbols F) : α ∈ (lambda F).ker ↔ lambda F α = 0 := by sorry
lemma inclusion_injective : Function.Injective ((lambda F).ker.subtype) := by sorry

def map {E : Type} [Field E] (f : F →+* E) : Group F →+ Group E := by sorry
lemma map_symbol {E : Type} [Field E] (f : F →+* E) :
    (lambda E).comp (Imported.freeMap F f) =
      (Imported.tensorMap F f).comp (lambda F) ∧
    ∀ α : Group F, ((map F f α) : RawSymbols E) = Imported.freeMap F f α := by sorry
lemma map_id (α : Group F) : map F (RingHom.id F) α = α := by sorry
lemma map_comp {E G : Type} [Field E] [Field G] (f : F →+* E) (g : E →+* G)
    (α : Group F) : map E g (map F f α) = map F (g.comp f) α := by sorry

/-- Test `LectureBloch.test_F2`. -/
example : Subsingleton (Group (ZMod 2)) := by sorry
/-- Test `LectureBloch.test_F3`. -/
example : ∃ e : RawSymbols (ZMod 3) ≃+ ℤ,
    e (Imported.sym (ZMod 3) (-1)) = 1 ∧
    ∀ α, lambda (ZMod 3) α = 0 ↔ Even (e α) := by sorry
/-- Test `LectureBloch.test_F5_relation`. -/
example : Imported.fiveTerm (ZMod 5) 2 3 = Imported.sym (ZMod 5) 4 ∧
    lambda (ZMod 5) (Imported.sym (ZMod 5) 4) ≠ 0 ∧
    2 • lambda (ZMod 5) (Imported.sym (ZMod 5) 4) = 0 := by sorry

/-! K3BlochGroups:V.3/bloch-lecture-comparison -/
def mu : Group F →+ Imported.B F := by sorry
abbrev rawRelations : AddSubgroup (Group F) := (Imported.R5 F).comap (lambda F).ker.subtype
abbrev RelationQuotient := Group F ⧸ rawRelations F
def muRel : RelationQuotient F →+ Imported.B F := by sorry

lemma boundary_compare : (Imported.boundary F).comp (Imported.q F) =
    -((Imported.pi F).comp (lambda F)) := by sorry
lemma mu_coe (α : Group F) : ((mu F α) : Imported.P F) = Imported.q F α := by sorry
lemma mu_ker (α : Group F) : mu F α = 0 ↔ (α : RawSymbols F) ∈ Imported.R5 F := by sorry
lemma muRel_injective : Function.Injective (muRel F) ∧
    (muRel F).comp (QuotientAddGroup.mk' (rawRelations F)) = mu F ∧
    ∀ f : RelationQuotient F →+ Imported.B F,
      f.comp (QuotientAddGroup.mk' (rawRelations F)) = mu F → f = muRel F := by sorry

/-- Test `LectureBloch.test_F5_kernel`. -/
example : ∃ α : Group (ZMod 5),
    (α : RawSymbols (ZMod 5)) = 2 • Imported.sym (ZMod 5) 4 ∧
    α ≠ 0 ∧ mu (ZMod 5) α = 0 ∧ addOrderOf α = 0 := by sorry
/-- Test `LectureBloch.test_F5_generator`. -/
example : ∃ α : Group (ZMod 5),
    (α : RawSymbols (ZMod 5)) = 4 • Imported.sym (ZMod 5) 3 ∧
    ((mu (ZMod 5) α) : Imported.P (ZMod 5)) = 4 • Imported.q (ZMod 5)
      (Imported.sym (ZMod 5) 3) ∧ addOrderOf (mu (ZMod 5) α) = 3 := by sorry
/-- Test `LectureBloch.test_Q_kernel`. -/
example : ∃ α : Group ℚ, (α : RawSymbols ℚ) = 4 • Imported.sym ℚ (-1) ∧
    α ≠ 0 ∧ mu ℚ α = 0 ∧ addOrderOf α = 0 := by sorry

/-! K3BlochGroups:V.3/bloch-lecture-obstruction -/
abbrev E := (lambda F).range ⊓ (Imported.symmetric F).toAddSubgroup
abbrev L := (Imported.R5 F).map (lambda F)
abbrev Obstruction := E F ⧸ ((L F).comap (E F).subtype)
def obstruction : Imported.B F →+ Obstruction F := by sorry

theorem obstruction_exact : L F ≤ E F ∧ (mu F).ker = rawRelations F ∧
    Function.Exact (mu F) (obstruction F) ∧ Function.Surjective (obstruction F) := by sorry

def sigma : RawSymbols F →+ RawSymbols F := by sorry
def degree : RawSymbols F →+ ℤ := FreeAbelianGroup.lift (fun _ => 1)

/-! K3BlochGroups:V.3/bloch-lecture-six-torsion -/
theorem six_lift (hF : FourElements F) (β : Imported.B F) (α : RawSymbols F)
    (hα : Imported.q F α = (β : Imported.P F)) :
    let γ := 3 • (α - sigma F α) + degree F α • (2 • Imported.sym F (-1))
    lambda F γ = 0 ∧ Imported.q F γ = 6 • (β : Imported.P F) := by sorry

theorem six_obstruction (hF : FourElements F) (x : Obstruction F) : 6 • x = 0 := by sorry
end LectureBloch

/-! K3BlochGroups:V.3/goncharov-generic-b2 -/
namespace GoncharovB2
variable (F : Type) [Field F]

def configurationRelation (t : Fin 5 ↪ OnePoint F) : RawSymbols F :=
  ∑ i : Fin 5, ((-1 : ℤ) ^ (i : ℕ)) •
    FreeAbelianGroup.of (Imported.crossRatio F (i.succAboveEmb.trans t))
abbrev relations : AddSubgroup (RawSymbols F) :=
  AddSubgroup.closure (Set.range (configurationRelation F))
abbrev Group := RawSymbols F ⧸ relations F
abbrev mk : RawSymbols F →+ Group F := QuotientAddGroup.mk' (relations F)
def «class» (x : F) : Group F := mk F (Imported.sym F x)

lemma eq_iff (α β : RawSymbols F) : mk F α = mk F β ↔ α - β ∈ relations F := by sorry
def lift {M : Type} [AddCommGroup M] (f : RawSymbols F →+ M)
    (hf : ∀ t, f (configurationRelation F t) = 0) : Group F →+ M := by sorry
lemma lift_mk {M : Type} [AddCommGroup M] (f : RawSymbols F →+ M)
    (hf : ∀ t, f (configurationRelation F t) = 0) :
    (lift F f hf).comp (mk F) = f ∧
    ∀ g : Group F →+ M, g.comp (mk F) = f → g = lift F f hf := by sorry

def map {E : Type} [Field E] (f : F →+* E) : Group F →+ Group E := by sorry
lemma map_symbol {E : Type} [Field E] (f : F →+* E) (x : F) :
    map F f («class» F x) = «class» E (f x) := by sorry
lemma map_id (x : Group F) : map F (RingHom.id F) x = x := by sorry
lemma map_comp {E G : Type} [Field E] [Field G] (f : F →+* E) (g : E →+* G)
    (x : Group F) : map E g (map F f x) = map F (g.comp f) x := by sorry

/-- Test `GoncharovB2.test_F2`. -/
example : Subsingleton (Group (ZMod 2)) := by sorry
/-- Test `GoncharovB2.test_F3`. -/
example : ∃ e : Group (ZMod 3) ≃+ ℤ, e («class» (ZMod 3) (-1)) = 1 := by sorry
/-- Test `GoncharovB2.test_F5`. -/
example : ∃ e : Group (ZMod 5) ≃+ ZMod 6,
    e («class» (ZMod 5) 3) = 1 := by sorry

/-! K3BlochGroups:V.3/goncharov-generic-comparison -/
def compare : Group F ≃+ Imported.P F := by sorry
def boundary : Group F →+ Imported.Qs F := by sorry

theorem generic_compare : (relations F = Imported.R5 F) ∧
    (∀ x, compare F («class» F x) = Imported.q F (Imported.sym F x)) ∧
    boundary F = -((Imported.boundary F).comp (compare F).toAddMonoidHom) := by sorry

def kernelCompare : (boundary F).ker ≃+ Imported.B F := by sorry
/-- The second half of Test `GoncharovB2.test_F5`: B₂ is not its cycle kernel. -/
example : boundary (ZMod 5) («class» (ZMod 5) 3) ≠ 0 ∧
    Nonempty ((boundary (ZMod 5)).ker ≃+ ZMod 3) := by sorry
end GoncharovB2

/-! K3BlochGroups:V.3/cgz-published-negative-tensor -/
namespace CGZPublished
variable (F : Type) [Field F]

def negativeUnit (u : UnitAdd F) : UnitAdd F := Additive.ofMul (-u.toMul)
abbrev negativeRelations : Submodule ℤ (FullTensor F) :=
  Submodule.span ℤ (Set.range fun u : UnitAdd F => u ⊗ₜ[ℤ] negativeUnit F u)
abbrev NegativeTarget := FullTensor F ⧸ negativeRelations F
abbrev tensorProjection : FullTensor F →+ NegativeTarget F :=
  (negativeRelations F).mkQ.toAddMonoidHom
def negativeProjection : Imported.Qs F →+ NegativeTarget F := by sorry

lemma negativeTensor_zero (u : UnitAdd F) :
    tensorProjection F (u ⊗ₜ[ℤ] negativeUnit F u) = 0 := by sorry
lemma tensorProjection_surjective : Function.Surjective (tensorProjection F) ∧
    (negativeProjection F).comp (Imported.pi F) = tensorProjection F := by sorry

def tensorLift {M : Type} [AddCommGroup M] (f : FullTensor F →+ M)
    (hf : ∀ u, f (u ⊗ₜ[ℤ] negativeUnit F u) = 0) : NegativeTarget F →+ M := by sorry
lemma tensorLift_unique {M : Type} [AddCommGroup M] (f : FullTensor F →+ M)
    (hf : ∀ u, f (u ⊗ₜ[ℤ] negativeUnit F u) = 0) :
    (tensorLift F f hf).comp (tensorProjection F) = f ∧
    ∀ g : NegativeTarget F →+ M,
      g.comp (tensorProjection F) = f → g = tensorLift F f hf := by sorry
lemma symmetrizer_le : Imported.symmetric F ≤ negativeRelations F := by sorry

/-- Test `CGZPublished.test_tensor_F3`. -/
example : Nonempty (NegativeTarget (ZMod 3) ≃+ ZMod 2) ∧
    Subsingleton (Imported.Exterior (ZMod 3)) := by sorry
/-- Test `CGZPublished.test_tensor_F5`. -/
example : Nonempty (Imported.Qs (ZMod 5) ≃+ ZMod 2) ∧
    Subsingleton (NegativeTarget (ZMod 5)) := by sorry
/-- Test `CGZPublished.test_tensor_Q`. -/
example : let u := Imported.unit ℚ 2 (by sorry)
    let v := negativeUnit ℚ u
    tensorProjection ℚ (u ⊗ₜ[ℤ] v) = 0 ∧
      Imported.toExterior ℚ (Imported.pi ℚ (u ⊗ₜ[ℤ] v)) ≠ 0 := by sorry

/-! K3BlochGroups:V.3/cgz-published-target-kernel -/
theorem target_kernel (hF : FourElements F) :
    (negativeProjection F).ker = (Imported.H F).map (Imported.boundary F) ∧
    ((negativeProjection F).comp (Imported.boundary F)).ker =
      Imported.B F ⊔ Imported.H F ∧ ∀ h : Imported.H F, 2 • h = 0 := by sorry

/-! K3BlochGroups:V.3/cgz-published-boundary -/
def boundary : ProjectiveSymbols F →+ NegativeTarget F := by sorry
def boundaryQuotient : Imported.Extended F →+ NegativeTarget F := by sorry

lemma boundary_symbol (x : F) (hx : x ≠ 0) (hx1 : x ≠ 1) :
    boundary F (FreeAbelianGroup.of (x : OnePoint F)) = tensorProjection F
      (Imported.unit F x hx ⊗ₜ[ℤ] Imported.unit F (1 - x) (by sorry)) ∧
    boundary F (FreeAbelianGroup.of (0 : F)) = 0 ∧
    boundary F (FreeAbelianGroup.of (1 : F)) = 0 ∧
    boundary F (FreeAbelianGroup.of (OnePoint.infty : OnePoint F)) = 0 := by sorry
lemma relations_le_kernel : Imported.Cext F ≤ (boundary F).ker := by sorry
lemma boundaryQuotient_unique :
    (boundaryQuotient F).comp (Imported.extQ F) = boundary F ∧
    ∀ d : Imported.Extended F →+ NegativeTarget F,
      d.comp (Imported.extQ F) = boundary F → d = boundaryQuotient F := by sorry
lemma boundary_ordinary : (boundaryQuotient F).comp (Imported.j F) =
    (negativeProjection F).comp (Imported.boundary F) := by sorry

/-- Test `CGZPublished.test_boundary_degenerate`. -/
example : boundary F (FreeAbelianGroup.of ((0 : F) : OnePoint F)) = 0 ∧
    boundary F (FreeAbelianGroup.of ((1 : F) : OnePoint F)) = 0 ∧
    boundary F (FreeAbelianGroup.of (OnePoint.infty : OnePoint F)) = 0 := by sorry
/-- Test `CGZPublished.test_boundary_F5`. -/
example : boundary (ZMod 5) (FreeAbelianGroup.of ((2 : (ZMod 5)) : OnePoint (ZMod 5)) +
      FreeAbelianGroup.of ((3 : (ZMod 5)) : OnePoint (ZMod 5))) = 0 ∧
    Imported.boundary (ZMod 5)
      (Imported.q (ZMod 5) (Imported.sym (ZMod 5) 2 + Imported.sym (ZMod 5) 3)) ≠ 0 := by sorry
/-- Test `CGZPublished.test_boundary_Q_relation`. -/
example : let r : ProjectiveSymbols ℚ := FreeAbelianGroup.of ((2 : ℚ) : OnePoint ℚ) +
    FreeAbelianGroup.of ((1 / 2 : ℚ) : OnePoint ℚ) - FreeAbelianGroup.of ((1 : ℚ) : OnePoint ℚ)
    boundary ℚ r = 0 ∧ Imported.oldBoundary ℚ r ≠ 0 := by sorry

/-! K3BlochGroups:V.3/cgz-published-bloch-group -/
abbrev Cycles := (boundary F).ker
abbrev cycleRelations : AddSubgroup (Cycles F) :=
  (Imported.Cext F).comap (boundary F).ker.subtype
abbrev CycleQuotient := Cycles F ⧸ cycleRelations F
abbrev Group := (boundaryQuotient F).ker

def cycleClass : Cycles F →+ Group F := by sorry
lemma cycleClass_eq_iff (α β : Cycles F) :
    cycleClass F α = cycleClass F β ↔
      (α : ProjectiveSymbols F) - (β : ProjectiveSymbols F) ∈ Imported.Cext F := by sorry
def kernelEquiv : CycleQuotient F ≃+ Group F := by sorry
lemma kernelEquiv_mk (α : Cycles F) :
    kernelEquiv F (QuotientAddGroup.mk' (cycleRelations F) α) = cycleClass F α ∧
    ((cycleClass F α) : Imported.Extended F) = Imported.extQ F α := by sorry

def cycleLift {M : Type} [AddCommGroup M] (f : Cycles F →+ M)
    (hf : cycleRelations F ≤ f.ker) : Group F →+ M := by sorry
lemma cycleLift_unique {M : Type} [AddCommGroup M] (f : Cycles F →+ M)
    (hf : cycleRelations F ≤ f.ker) :
    (cycleLift F f hf).comp (cycleClass F) = f ∧
    ∀ g : Group F →+ M, g.comp (cycleClass F) = f → g = cycleLift F f hf := by sorry

def zeroCycle : Cycles F := ⟨FreeAbelianGroup.of ((0 : F) : OnePoint F), by sorry⟩
/-- Test `CGZPublished.test_group_F2`. -/
example : ∃ e : Group (ZMod 2) ≃+ ZMod 3,
    e (cycleClass (ZMod 2) (zeroCycle (ZMod 2))) = 1 := by sorry
/-- Test `CGZPublished.test_group_F3`. -/
example : Subsingleton (Group (ZMod 3)) ∧
    Nonempty (Imported.Extended (ZMod 3) ≃+ ZMod 2) ∧
    Function.Bijective (boundaryQuotient (ZMod 3)) := by sorry
/-- Test `CGZPublished.test_group_F11`. -/
example : Nonempty (Group (ZMod 11) ≃+ ZMod 3) ∧
    Nonempty (Imported.OldB (ZMod 11) ≃+ ZMod 6) := by sorry

/-! K3BlochGroups:V.3/cgz-published-comparison-map -/
def compare : Imported.B F →+ Group F := by sorry
lemma compare_coe (β : Imported.B F) :
    ((compare F β) : Imported.Extended F) = Imported.j F β := by sorry
lemma compare_c (hF : FourElements F) :
    compare F (Imported.c F) = cycleClass F (zeroCycle F) := by sorry
lemma compare_angle (hF : FourElements F) (u : UnitAdd F)
    (hu : Imported.h F u ∈ Imported.B F) : compare F ⟨Imported.h F u, hu⟩ = 0 := by sorry

def map {E : Type} [Field E] (f : F →+* E) : Group F →+ Group E := by sorry
lemma compare_natural {E : Type} [Field E] (f : F →+* E) :
    (map F f).comp (compare F) = (compare E).comp (Imported.bMap F f) := by sorry
lemma map_id (β : Group F) : map F (RingHom.id F) β = β := by sorry
lemma map_comp {E G : Type} [Field E] [Field G] (f : F →+* E) (g : E →+* G)
    (β : Group F) : map E g (map F f β) = map F (g.comp f) β := by sorry

/-- Test `CGZPublished.test_compare_F5`. -/
example : Function.Bijective (compare (ZMod 5)) ∧
    compare (ZMod 5) (Imported.c (ZMod 5)) = cycleClass (ZMod 5) (zeroCycle (ZMod 5)) ∧
    addOrderOf (compare (ZMod 5) (Imported.c (ZMod 5))) = 3 := by sorry
/-- Test `CGZPublished.test_compare_F7`. -/
example : Nonempty (Imported.B (ZMod 7) ≃+ ZMod 4) ∧
    Nonempty (Group (ZMod 7) ≃+ ZMod 2) ∧
    (compare (ZMod 7)).ker = AddSubgroup.zmultiples (Imported.c (ZMod 7)) ∧
    addOrderOf (Imported.c (ZMod 7)) = 2 ∧ compare (ZMod 7) (Imported.c (ZMod 7)) = 0 := by sorry
/-- Test `CGZPublished.test_compare_F11`. -/
example : Nonempty (Imported.B (ZMod 11) ≃+ ZMod 6) ∧
    addOrderOf (compare (ZMod 11) (Imported.c (ZMod 11))) = 3 ∧
    (compare (ZMod 11)).ker = AddSubgroup.zmultiples (3 • Imported.c (ZMod 11)) := by sorry

/-! K3BlochGroups:V.3/cgz-published-lemma-two-two -/
abbrev angleKernel : AddSubgroup (Imported.B F) := (Imported.H F).comap (Imported.B F).subtype

theorem published_lemma_two_two (hF : FourElements F) :
    Function.Surjective (compare F) ∧ (compare F).ker = angleKernel F ∧
    ∀ β : angleKernel F, 2 • β = 0 := by sorry

def classicalQuotientEquiv (hF : FourElements F) :
    Imported.B F ⧸ angleKernel F ≃+ Group F := by sorry

/-! K3BlochGroups:V.3/cgz-published-to-older -/
def toOlder (hF : FourElements F) : Group F →+ Imported.OldB F := by sorry
abbrev olderCorrection := Imported.BE F ⧸
  ((Imported.B F ⊔ (Imported.BE F ⊓ Imported.H F)).comap (Imported.BE F).subtype)

theorem published_to_older (hF : FourElements F) :
    Function.Injective (toOlder F hF) ∧
    Imported.oldCompare F = (toOlder F hF).comp (compare F) ∧
    Nonempty ((Imported.OldB F ⧸ (toOlder F hF).range) ≃+ olderCorrection F) ∧
    ∀ z : olderCorrection F, 2 • z = 0 := by sorry

abbrev zeroDegenerateSubgroup : AddSubgroup (Group F) :=
  AddSubgroup.zmultiples (cycleClass F (zeroCycle F))
abbrev ZeroDegenerate := Group F ⧸ zeroDegenerateSubgroup F
abbrev zeroDegenerateCompare : Imported.B F →+ ZeroDegenerate F :=
  (QuotientAddGroup.mk' (zeroDegenerateSubgroup F)).comp (compare F)

theorem extra_zero_degenerate (hF : FourElements F) :
    Function.Surjective (zeroDegenerateCompare F) ∧
    (zeroDegenerateCompare F).ker = angleKernel F ⊔ AddSubgroup.zmultiples (Imported.c F) ∧
    ∀ β : (zeroDegenerateCompare F).ker, 6 • β = 0 := by sorry
end CGZPublished

/-! K3BlochGroups:V.3/goncharov-curve-b2.
The scheme bundle records mathematical predicates already in Mathlib. No
field stores an unspecified theorem or a stand-in proposition. Its general
geometry is owned by the upstream AlgebraicCurves dictionary.
-/
open AlgebraicGeometry

structure SmoothCurve (F : Type) [Field F] where
  X : Scheme.{0}
  toBase : X ⟶ Spec (CommRingCat.of F)
  integral : IsIntegral X
  smooth : SmoothOfRelativeDimension 1 toBase
attribute [instance] SmoothCurve.integral SmoothCurve.smooth

abbrev SmoothCurve.Point {F : Type} [Field F] (C : SmoothCurve F) :=
  {u : Spec (CommRingCat.of F) ⟶ C.X // u ≫ C.toBase = 𝟙 _}

/-- Type of the upstream projective evaluation maps. Canonical construction
and its local-DVR correctness contract are an outstanding request, not assumed
as an opaque proposition. The quotient below can be formed from any family;
its geometric comparisons need the explicit input conditions shown below. -/
abbrev CurveSpecializations := ∀ (F : Type) [Field F] (C : SmoothCurve F),
  C.Point → OnePoint C.X.functionField → OnePoint F

namespace GoncharovCurve
variable (sp : CurveSpecializations) (F : Type) [Field F]

abbrev Symbols := OnePoint F →₀ ℚ
abbrev Target := ℚ ⊗[ℤ] Imported.Qs F

def rawBoundary : Symbols F →ₗ[ℚ] Target F := by
  classical
  exact Finsupp.linearCombination ℚ fun z =>
    match z with
    | none => 0
    | some x => if hx : x ≠ 0 ∧ x ≠ 1 then
        (1 : ℚ) ⊗ₜ[ℤ] Imported.pi F
          (Imported.unit F (1 - x) (by sorry) ⊗ₜ[ℤ] Imported.unit F x hx.1)
      else 0

def specialize (C : SmoothCurve F) (u : C.Point) :
    Symbols C.X.functionField →ₗ[ℚ] Symbols F :=
  Finsupp.linearCombination ℚ fun z => Finsupp.single (sp F C u z) 1

abbrev relations : Submodule ℚ (Symbols F) :=
  Submodule.span ℚ {r | r = Finsupp.single ((0 : F) : OnePoint F) 1 ∨
    r = Finsupp.single (OnePoint.infty : OnePoint F) 1 ∨
    ∃ (C : SmoothCurve F) (u v : C.Point) (α : Symbols C.X.functionField),
      rawBoundary C.X.functionField α = 0 ∧
      r = specialize sp F C u α - specialize sp F C v α}
abbrev Group := Symbols F ⧸ relations sp F
abbrev mk : Symbols F →ₗ[ℚ] Group sp F := (relations sp F).mkQ

def «class» (z : OnePoint F) : Group sp F := mk sp F (Finsupp.single z 1)
lemma eq_iff (α β : Symbols F) : mk sp F α = mk sp F β ↔
    α - β ∈ relations sp F := by sorry

def lift {M : Type} [AddCommGroup M] [Module ℚ M] (f : Symbols F →ₗ[ℚ] M)
    (h0 : f (Finsupp.single ((0 : F) : OnePoint F) 1) = 0)
    (hInfinity : f (Finsupp.single (OnePoint.infty : OnePoint F) 1) = 0)
    (hsp : ∀ (C : SmoothCurve F) (u v : C.Point) (α : Symbols C.X.functionField),
      rawBoundary C.X.functionField α = 0 →
      f (specialize sp F C u α - specialize sp F C v α) = 0) :
    Group sp F →ₗ[ℚ] M := by sorry
lemma lift_unique {M : Type} [AddCommGroup M] [Module ℚ M] (f : Symbols F →ₗ[ℚ] M)
    (h0 : f (Finsupp.single ((0 : F) : OnePoint F) 1) = 0)
    (hInfinity : f (Finsupp.single (OnePoint.infty : OnePoint F) 1) = 0)
    (hsp : ∀ (C : SmoothCurve F) (u v : C.Point) (α : Symbols C.X.functionField),
      rawBoundary C.X.functionField α = 0 →
      f (specialize sp F C u α - specialize sp F C v α) = 0) :
    (lift sp F f h0 hInfinity hsp).comp (mk sp F) = f ∧
    ∀ g : Group sp F →ₗ[ℚ] M, g.comp (mk sp F) = f → g = lift sp F f h0 hInfinity hsp := by sorry
lemma specialization_relation (C : SmoothCurve F) (u v : C.Point)
    (α : Symbols C.X.functionField) (hα : rawBoundary C.X.functionField α = 0) :
    mk sp F (specialize sp F C u α) = mk sp F (specialize sp F C v α) := by sorry

/-- Test `GoncharovCurve.test_zero`. -/
example : «class» sp F ((0 : F) : OnePoint F) = 0 ∧
    «class» sp F (OnePoint.infty : OnePoint F) = 0 := by sorry
/-- Test `GoncharovCurve.test_one`.
Instantiate C with P¹, t with its affine coordinate and u,v with 0,∞.
The evaluation equalities are genuine geometric inputs of the missing supplier,
not a proposition replacing them. -/
example (C : SmoothCurve F) (u v : C.Point) (t : C.X.functionField)
    (hu : sp F C u (t : OnePoint C.X.functionField) = ((0 : F) : OnePoint F))
    (hu1 : sp F C u (((1 : C.X.functionField) - t : C.X.functionField) : OnePoint C.X.functionField) = ((1 : F) : OnePoint F))
    (hv : sp F C v (t : OnePoint C.X.functionField) = OnePoint.infty)
    (hv1 : sp F C v (((1 : C.X.functionField) - t : C.X.functionField) : OnePoint C.X.functionField) = OnePoint.infty) :
    «class» sp F ((1 : F) : OnePoint F) = 0 := by sorry
/-- Test `GoncharovCurve.test_inversion`.
Instantiate C with P¹, t with its coordinate, and u,v with x,0. -/
example (C : SmoothCurve F) (u v : C.Point) (t : C.X.functionField) (x : F) (hx : x ≠ 0)
    (hu : sp F C u (t : OnePoint C.X.functionField) = (x : OnePoint F))
    (hui : sp F C u ((t⁻¹ : C.X.functionField) : OnePoint C.X.functionField) = ((x⁻¹ : F) : OnePoint F))
    (hv : sp F C v (t : OnePoint C.X.functionField) = ((0 : F) : OnePoint F))
    (hvi : sp F C v ((t⁻¹ : C.X.functionField) : OnePoint C.X.functionField) = OnePoint.infty) :
    «class» sp F (x : OnePoint F) + «class» sp F ((x⁻¹ : F) : OnePoint F) = 0 := by sorry

/-! K3BlochGroups:V.3/goncharov-curve-boundary.
`relations_le_kernel`: not stated unconditionally; needs the canonical
local-DVR projective specialization and the P.4 degree-two valuation formula.
The following is the exact, conventional quotient-descent signature.
-/
def boundary (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    Group sp F →ₗ[ℚ] Target F := (relations sp F).liftQ (rawBoundary F) hclosure
lemma boundary_class (hclosure : relations sp F ≤ (rawBoundary F).ker) (z : OnePoint F) :
    boundary sp F hclosure («class» sp F z) = rawBoundary F (Finsupp.single z 1) := by sorry
lemma boundary_unique (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    (boundary sp F hclosure).comp (mk sp F) = rawBoundary F ∧
    ∀ d : Group sp F →ₗ[ℚ] Target F,
      d.comp (mk sp F) = rawBoundary F → d = boundary sp F hclosure := by sorry
lemma mem_kernel (hclosure : relations sp F ≤ (rawBoundary F).ker) (α : Symbols F) :
    mk sp F α ∈ (boundary sp F hclosure).ker ↔ rawBoundary F α = 0 := by sorry

/-- Test `GoncharovCurve.test_boundary_degenerate`. -/
example (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    boundary sp F hclosure («class» sp F ((0 : F) : OnePoint F)) = 0 ∧
    boundary sp F hclosure («class» sp F ((1 : F) : OnePoint F)) = 0 ∧
    boundary sp F hclosure («class» sp F (OnePoint.infty : OnePoint F)) = 0 := by sorry
/-- Test `GoncharovCurve.test_boundary_complex`. -/
example (hclosure : relations sp ℂ ≤ (rawBoundary ℂ).ker) :
    boundary sp ℂ hclosure («class» sp ℂ (Complex.I : OnePoint ℂ)) = 0 := by sorry

/-! K3BlochGroups:V.3/goncharov-curve-comparison.
`generic_relations_le`: not stated unconditionally; needs the canonical
P¹ specialization compatibility to evaluate R(1+t(x-1),y) at 1 and 0.
An arbitrary `sp` does not discharge either `hR5` or `hclosure`.
-/
abbrev RationalP := ℚ ⊗[ℤ] Imported.P F
abbrev RationalB := ℚ ⊗[ℤ] Imported.B F

def toGeneric : Symbols F →ₗ[ℚ] RationalP F :=
  Finsupp.linearCombination ℚ fun z => match z with
    | none => 0
    | some x => (1 : ℚ) ⊗ₜ[ℤ] Imported.q F (Imported.sym F x)
abbrev reducedRelations : Submodule ℚ (Symbols F) := (toGeneric F).ker
abbrev Correction := relations sp F ⧸ (reducedRelations F).comap (relations sp F).subtype

def genericCompare (hR5 : reducedRelations F ≤ relations sp F) :
    RationalP F →ₗ[ℚ] Group sp F := by sorry
def rationalPartial : RationalP F →ₗ[ℚ] Target F := by sorry

def cycleCompare (hR5 : reducedRelations F ≤ relations sp F)
    (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    RationalB F →ₗ[ℚ] (boundary sp F hclosure).ker := by sorry

theorem curve_comparison (hR5 : reducedRelations F ≤ relations sp F)
    (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    Function.Surjective (genericCompare sp F hR5) ∧
    (genericCompare sp F hR5).comp (toGeneric F) = mk sp F ∧
    Nonempty ((genericCompare sp F hR5).ker ≃ₗ[ℚ] Correction sp F) ∧
    Function.Surjective (cycleCompare sp F hR5 hclosure) ∧
    Nonempty ((cycleCompare sp F hR5 hclosure).ker ≃ₗ[ℚ] Correction sp F) := by sorry

/-- Test `GoncharovCurve.test_boundary_sign`. -/
example (hR5 : reducedRelations F ≤ relations sp F)
    (hclosure : relations sp F ≤ (rawBoundary F).ker) (β : RationalP F) :
    boundary sp F hclosure (genericCompare sp F hR5 β) = -(rationalPartial F β) := by sorry

-- The canonical projective-line evaluations prove hOne and hInv below.
-- This is the exceptional small-field acceptance calculation, not an
-- unconditional claim about an arbitrary evaluation family.
example (hR5 : reducedRelations (ZMod 3) ≤ relations sp (ZMod 3))
    (hOne : «class» sp (ZMod 3) ((1 : ZMod 3) : OnePoint (ZMod 3)) = 0)
    (hInv : «class» sp (ZMod 3) ((-1 : ZMod 3) : OnePoint (ZMod 3)) +
      «class» sp (ZMod 3) ((-1 : ZMod 3) : OnePoint (ZMod 3)) = 0) :
    Subsingleton (Group sp (ZMod 3)) ∧
    Nonempty (Correction sp (ZMod 3) ≃ₗ[ℚ] ℚ) := by sorry

-- No assertion `Correction sp F = 0`: for fields with at least four
-- elements this all-curve comparison remains a mathematical gap. F₃ is
-- a proved exception with rational kernel ℚ, conditional on the canonical
-- projective-line evaluation facts above.
-- Polylogarithms:P.4/explicit-to-inductive-comparison supplies the different
-- F(t)-only rational identification for infinite fields; it is not restated.
end GoncharovCurve

/-! K3BlochGroups:V.3/convention-coefficient-exports -/
theorem convention_coefficient_exports (F : Type) [Field F] (hF : FourElements F) :
    Function.Bijective (Imported.coeffMap (Localization.Away (2 : ℤ)) (CGZPublished.compare F)) ∧
    Function.Bijective (Imported.coeffMap ℚ (CGZPublished.compare F)) ∧
    Function.Bijective (Imported.coeffMap (Localization.Away (2 : ℤ)) (CGZPublished.toOlder F hF)) ∧
    Function.Bijective (Imported.coeffMap ℚ (CGZPublished.toOlder F hF)) ∧
    Function.Bijective (Imported.coeffMap (Localization.Away (6 : ℤ)) (LectureBloch.muRel F)) ∧
    Function.Bijective (Imported.coeffMap ℚ (LectureBloch.muRel F)) ∧
    (∀ n : ℕ, 0 < n → Odd n →
      Function.Bijective (Imported.coeffMap (ZMod n) (CGZPublished.compare F)) ∧
      Function.Bijective (Imported.coeffMap (ZMod n) (CGZPublished.toOlder F hF))) ∧
    (∀ n : ℕ, 0 < n → Nat.Coprime n 6 →
      Function.Bijective (Imported.coeffMap (ZMod n) (LectureBloch.muRel F))) := by sorry

/-- The 2-primary coefficient restriction is real. -/
example : ¬Function.Bijective (Imported.coeffMap (ZMod 2) (CGZPublished.compare (ZMod 11))) := by sorry
/-- The extra degenerate-zero quotient has a 3-primary obstruction. -/
example : ¬Function.Bijective
    (Imported.coeffMap (ZMod 3) (CGZPublished.zeroDegenerateCompare (ZMod 5))) := by sorry

end TauCeti.BlochConventions
