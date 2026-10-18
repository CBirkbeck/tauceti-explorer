import Mathlib.CategoryTheory.Action
import Mathlib.Algebra.Group.Hom.Instances
import Mathlib.Topology.Algebra.RestrictedProduct.Units
import Mathlib.Topology.Algebra.Valued.WithVal
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.FieldTheory.Finite.Basic
import TauCeti.FieldTheory.FunctionField.Place.Zeros
import TauCeti.FieldTheory.FunctionField.Divisor.ProductFormula

/-!
This file is not the roadmap and is not exhaustive. The companion README is the
definitive specification. These statements suggest Lean forms so that contributors
and reviewers can converge on names and signatures.

GC.2 uses the existing completed valuation fields and `ActionCategory`. The
geometric framed-root-line groupoids and their gluing equivalences are README
targets: their sheaf interfaces are not present at the pinned baseline. No data
definition is admitted here. Theorems and examples are unproved specifications.
-/

noncomputable section

open CategoryTheory
open scoped RestrictedProduct WithZero

namespace TauCeti.RamifiedClassField.GC2

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- The existing completion at a native normalized place. -/
abbrev LocalField (P : Place k F) := Valuation.Completion P.valuation

/-- The completed valuation ring, as a native valuation subring. -/
abbrev LocalIntegers (P : Place k F) : ValuationSubring (LocalField P) :=
  (Valued.v : Valuation (LocalField P) ℤᵐ⁰).valuationSubring

/-- Carrier spelling for the imported FA.2 projective ideles, including infinity. -/
abbrev Ideles (k F : Type*) [Field k] [Field F] [Algebra k F] :=
  Πʳ P : Place k F, [(LocalField P)ˣ, (LocalIntegers P).unitGroup]

abbrev IntegralUnits (k F : Type*) [Field k] [Field F] [Algebra k F] :=
  (P : Place k F) → (LocalIntegers P).unitGroup

abbrev BranchUnits (R : Finset (Place k F)) :=
  (x : R) → (IsLocalRing.ResidueField (LocalIntegers x.val))ˣ

def residueProduct (R : Finset (Place k F)) : IntegralUnits k F →* BranchUnits R where
  toFun u x := (LocalIntegers x.val).unitGroupToResidueFieldUnits (u x.val)
  map_one' := by
    funext x
    exact map_one (LocalIntegers x.val).unitGroupToResidueFieldUnits
  map_mul' u v := by
    funext x
    exact map_mul (LocalIntegers x.val).unitGroupToResidueFieldUnits _ _

/-- A light equalizer spelling of the inherited modified-unit group; labels survive. -/
def rootUnitSubgroup (R : Finset (Place k F)) :
    Subgroup (IntegralUnits k F × BranchUnits R) :=
  ((residueProduct R).comp (MonoidHom.fst _ _)).eqLocus
    ((powMonoidHom 2).comp (MonoidHom.snd _ _))

abbrev RootUnits (R : Finset (Place k F)) := rootUnitSubgroup R

def integralInclusion : IntegralUnits k F →* Ideles k F where
  toFun u := ⟨fun P => (u P).val, Filter.Eventually.of_forall (fun P => (u P).property)⟩
  map_one' := rfl
  map_mul' _ _ := rfl

def rootUnitMap (R : Finset (Place k F)) : RootUnits R →* Ideles k F :=
  integralInclusion.comp ((MonoidHom.fst _ _).comp (rootUnitSubgroup R).subtype)

/-- The existing completion embedding, with the place's topology selected. -/
def localEmbedding (P : Place k F) : F →+* LocalField P :=
  UniformSpace.Completion.coeRingHom.comp (WithVal.equiv P.valuation).symm.toRingHom

/-- The FA.2 diagonal on its native carrier; restrictedness is the pinned zeros/poles theorem. -/
def diagonal (hF : IsFunctionField k F) : Fˣ →* Ideles k F where
  toFun f := ⟨fun P => Units.map (localEmbedding P).toMonoidHom f, by
    have ho : ∀ᶠ P : Place k F in Filter.cofinite, P.ord (f : F) = 0 := by
      simpa using (Place.finite_setOf_ord_ne_zero hF (f : F)).compl_mem_cofinite
    filter_upwards [ho] with P hP
    change Units.map (localEmbedding P).toMonoidHom f ∈
      (Valued.v : Valuation (LocalField P) ℤᵐ⁰).valuationSubring.unitGroup
    rw [Valuation.mem_unitGroup_iff]
    change Valued.v (((WithVal.equiv P.valuation).symm (f : F) : WithVal P.valuation) :
      UniformSpace.Completion (WithVal P.valuation)) = 1
    rw [Valued.valuedCompletion_apply]
    change P.valuation (f : F) = 1
    rw [P.valuation_eq_exp_neg_ord (Units.ne_zero f), hP]
    simp⟩
  map_one' := Subtype.ext (funext fun P => map_one (Units.map (localEmbedding P).toMonoidHom))
  map_mul' f g := Subtype.ext (funext fun P =>
    map_mul (Units.map (localEmbedding P).toMonoidHom) f g)

instance rootAction (R : Finset (Place k F)) : MulAction (RootUnits R) (Ideles k F) :=
  MulAction.compHom _ (rootUnitMap R)

/-- The actual signed right-action groupoid, with every modified-unit label. -/
abbrev RootDivisorGroupoid (R : Finset (Place k F)) :=
  ActionCategory (RootUnits R) (Ideles k F)

theorem rootUnitMap_eq_one_iff (R : Finset (Place k F)) (h : RootUnits R) :
    rootUnitMap R h = 1 ↔ h.val.1 = 1 := by
  sorry

theorem rootUnit_relation (R : Finset (Place k F)) (h : RootUnits R) (x : R) :
    (LocalIntegers x.val).unitGroupToResidueFieldUnits (h.val.1 x.val) = h.val.2 x ^ 2 := by
  sorry

theorem rootUnits_kernel_equiv (R : Finset (Place k F)) :
    Nonempty ((rootUnitMap R).ker ≃*
      (powMonoidHom 2 : BranchUnits R →* BranchUnits R).ker) := by
  sorry

theorem rootUnits_lift_iff (R : Finset (Place k F)) (u : IntegralUnits k F) :
    (∃ h : RootUnits R, h.val.1 = u) ↔ ∀ x : R, IsSquare (residueProduct R u x) := by
  sorry

theorem right_hom_nonempty_iff (R : Finset (Place k F)) (a b : Ideles k F) :
    Nonempty ((a : RootDivisorGroupoid R) ⟶ (b : RootDivisorGroupoid R)) ↔
      ∃ h : RootUnits R, b = a * rootUnitMap R h := by
  sorry

theorem right_end_label (R : Finset (Place k F)) (a : Ideles k F)
    (m : End (a : RootDivisorGroupoid R)) : rootUnitMap R m.hom = 1 := by
  sorry

theorem right_stabilizer_equiv (R : Finset (Place k F)) (a : Ideles k F) :
    Nonempty (End (a : RootDivisorGroupoid R) ≃* (rootUnitMap R).ker) := by
  sorry

section DoubleQuotient

variable [Fact (IsFunctionField k F)]

def doubleActionMap (R : Finset (Place k F)) : Fˣ × RootUnits R →* Ideles k F where
  toFun g := diagonal (Fact.out : IsFunctionField k F) g.1 * rootUnitMap R g.2
  map_one' := by simp
  map_mul' g h := by
    simp only [Prod.fst_mul, Prod.snd_mul, map_mul]
    apply Subtype.ext
    funext P
    exact mul_mul_mul_comm _ _ _ _

instance doubleAction (R : Finset (Place k F)) :
    MulAction (Fˣ × RootUnits R) (Ideles k F) := MulAction.compHom _ (doubleActionMap R)

/-- Its objects are ideles, but its arrows also change the generic frame. -/
abbrev RootPicardPresentation (R : Finset (Place k F)) :=
  ActionCategory (Fˣ × RootUnits R) (Ideles k F)

set_option backward.isDefEq.respectTransparency.types false in
/-- The separate further quotient; the source has no principal-idele arrows. -/
def abelJacobi (R : Finset (Place k F)) :
    RootDivisorGroupoid R ⥤ RootPicardPresentation R where
  obj a := a.back
  map {a b} m := Functor.Elements.homMk (1, m.hom) (by
    have hm : rootUnitMap R m.hom * a.back = b.back := m.map_val
    change doubleActionMap R (1, m.hom) * a.back = b.back
    simpa [doubleActionMap] using hm)
  map_id _ := rfl
  map_comp m n := by
    apply Functor.Elements.hom_ext
    exact Prod.ext (one_mul (1 : Fˣ)).symm rfl

theorem abelJacobi_faithful (R : Finset (Place k F)) :
    (abelJacobi R).Faithful := by
  sorry

theorem abelJacobi_map_label (R : Finset (Place k F))
    {a b : RootDivisorGroupoid R} (m : a ⟶ b) :
    ((abelJacobi R).map m).hom = (1, m.hom) := by
  sorry

theorem double_hom_nonempty_iff (R : Finset (Place k F)) (a b : Ideles k F) :
    Nonempty ((a : RootPicardPresentation R) ⟶ (b : RootPicardPresentation R)) ↔
      ∃ f : Fˣ, ∃ h : RootUnits R,
        b = diagonal (Fact.out : IsFunctionField k F) f * a * rootUnitMap R h := by
  sorry

end DoubleQuotient

/-! Small checks use existing carriers; the geometric tests are specified in the README. -/

-- Negative coefficients survive; geometric degree will be the negative valuation degree.
example (P : Place k F) :
    Divisor.degree (-Finsupp.single P (1 : ℤ)) = -(P.degree : ℤ) := by
  sorry

-- The right quotient remembers its full label, including nontrivial kernel elements.
example (R : Finset (Place k F)) (a : Ideles k F) (h : RootUnits R)
    (hh : rootUnitMap R h = 1) (hne : h ≠ 1) :
    ∃ m : End (a : RootDivisorGroupoid R), m.hom = h ∧ m ≠ 𝟙 _ := by
  sorry

-- At empty ramification the actual modified-unit homomorphism is injective.
example : Function.Injective (rootUnitMap (k := k) (F := F) ∅) := by
  sorry

-- Principal ideles create additional arrows only in the double presentation.
example [Fact (IsFunctionField k F)] (f : Fˣ)
    (hf : ∃ P : Place k F, P.ord (f : F) ≠ 0) :
    IsEmpty (((1 : Ideles k F) : RootDivisorGroupoid (∅ : Finset (Place k F))) ⟶
      ((diagonal (Fact.out : IsFunctionField k F) f : Ideles k F) :
        RootDivisorGroupoid (∅ : Finset (Place k F)))) ∧
    Nonempty (((1 : Ideles k F) : RootPicardPresentation (∅ : Finset (Place k F))) ⟶
      ((diagonal (Fact.out : IsFunctionField k F) f : Ideles k F) :
        RootPicardPresentation (∅ : Finset (Place k F)))) := by
  sorry

end TauCeti.RamifiedClassField.GC2
