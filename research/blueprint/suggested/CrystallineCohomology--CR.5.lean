/-
This file is not the roadmap and is not exhaustive. The accompanying roadmap
document is definitive. These statements suggest Lean forms so contributors and
reviewers can converge on names and signatures. All implementations are unchecked.

Revision 3 binds the interfaces to actual small-etale log schemes, compatible PD
thickenings, geometric cohomology constructions and their canonical maps. Named
supplier client types represent the precise exports requested in the packet;
their presence is not a claim that the supplier modules have been implemented.
Affine slices are identified below. Full sheaf descent and formal/analytic
construction proofs remain the tasks specified by the mathematical roadmap.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The unbuilt Tau Ceti
nilpotentExpUnit wrapper is read at the pin; its underlying Mathlib operation
IsNilpotent.exp is used here. Elaboration verifies types, not the proposed proofs.

Revision 3 repairs the module-sheaf crystal/connection interfaces (R2),
source-qualified residue embedding geometry (R4), and completed geometric
coefficient adapters with locally split filtrations (R5). The independent
revision-2 review and its verdicts remain preserved in the packet. Its fine/fs
base-change correction (R1) and bounded-below support correction (R3) remain.
The four inherited source/owner gaps remain explicit; no stage is closed.
-/
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Scheme
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Algebra.Group.Submonoid.Finite
import Mathlib.RingTheory.DividedPowers.Basic
import Mathlib.RingTheory.DividedPowerAlgebra.Init
import Mathlib.CategoryTheory.Limits.Indization.Category
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.CategoryTheory.LiftingProperties.Basic
import Mathlib.RingTheory.DualNumber
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.Category.ModuleCat.Presheaf.OfCommRing
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.Topology.Algebra.Module.Basic
import Mathlib.RingTheory.Nilpotent.Exp
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.RingTheory.Localization.Away.Basic

import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.Algebra.Category.ModuleCat.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.PullbackContinuous
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Submodule
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Analysis.LocallyConvex.WithSeminorms
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.Topology.Metrizable.Basic

set_option autoImplicit false
set_option linter.unusedVariables false
noncomputable section
open CategoryTheory AlgebraicGeometry
open CategoryTheory.Pretriangulated Filter
open scoped TensorProduct
universe u v
namespace TauCeti.LogCrystalline

instance moduleCatDerived (A : Type) [CommRing A] : HasDerivedCategory.{1} (ModuleCat.{0} A) :=
  HasDerivedCategory.standard _
instance (priority := 90) moduleCatRestrict {R A : Type} [CommRing R] [CommRing A]
    [Algebra R A] (M : ModuleCat.{0} A) : Module R M := Module.compHom M (algebraMap R A)
instance (priority := 90) moduleCatTower {R A : Type} [CommRing R] [CommRing A]
    [Algebra R A] (M : ModuleCat.{0} A) : IsScalarTower R A M := by sorry


-- Affine/stalk form. The étale sheaf and its descent are omitted, not asserted by this type.
structure PrelogRing (A P : Type) [CommRing A] [CommMonoid P] where
  structureMap : P →* A

structure PrelogHom {A B P Q : Type} [CommRing A] [CommRing B]
    [CommMonoid P] [CommMonoid Q] (a : PrelogRing A P) (b : PrelogRing B Q) where
  ringMap : A →+* B
  monoidMap : P →* Q
  compatible : ∀ p, ringMap (a.structureMap p) = b.structureMap (monoidMap p)

namespace PrelogRing
 def alpha {A P : Type} [CommRing A] [CommMonoid P] (a : PrelogRing A P) : P →* A := by sorry
 theorem hom_ext {A B P Q : Type} [CommRing A] [CommRing B]
    [CommMonoid P] [CommMonoid Q] {a : PrelogRing A P} {b : PrelogRing B Q}
    (f g : PrelogHom a b) (hr : f.ringMap = g.ringMap) (hm : f.monoidMap = g.monoidMap) : f = g := by sorry
 def map_comp {A B C P Q R : Type} [CommRing A] [CommRing B] [CommRing C]
    [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    {a : PrelogRing A P} {b : PrelogRing B Q} {c : PrelogRing C R}
    (f : PrelogHom a b) (g : PrelogHom b c) : PrelogHom a c := by sorry
end PrelogRing

def natChart {A : Type} [CommRing A] (t : A) : Multiplicative ℕ →* A := by sorry
-- Test: TauCeti.LogCrystalline.PrelogRing.zero_chart
example {k : Type} [Field k] (n : ℕ) : natChart (0 : k) (Multiplicative.ofAdd (n+1)) = 0 := by sorry
-- Test: TauCeti.LogCrystalline.PrelogRing.trivial_chart
example {A : Type} [CommRing A] (f : PUnit →* A) : f PUnit.unit = 1 := by sorry
-- Test: TauCeti.LogCrystalline.PrelogRing.units_only_failure
example {k : Type} [Field k] : ¬ ∃ f : Multiplicative ℕ →* kˣ,
    ∀ n, (f n : k) = natChart (0 : k) n := by sorry

structure LogStructure (A : Type) [CommRing A] where
  monoid : CommMonCat.{0}
  structureMap : monoid →* A
  unitCondition : ∀ a : A, IsUnit a → ∃! m : monoid, structureMap m = a

def LogHom {A : Type} [CommRing A] (L M : LogStructure A) :=
  {f : L.monoid →* M.monoid // ∀ x, M.structureMap (f x) = L.structureMap x}
def trivialLog {A : Type} [CommRing A] : LogStructure A := by sorry
namespace LogStructure
 def units {A : Type} [CommRing A] (L : LogStructure A) :
    {m : L.monoid // IsUnit (L.structureMap m)} ≃ Aˣ := by sorry
 theorem hom_ext {A : Type} [CommRing A] {L M : LogStructure A} (f g : LogHom L M)
    (h : ∀ x, f.val x = g.val x) : f = g := by sorry
 -- Pointwise criterion for the unit-subsheaf isomorphism. Sheaf/stalk comparison is omitted.
 theorem stalk_is_log {A : Type} [CommRing A] (L : LogStructure A) :
    ∀ a : A, IsUnit a → ∃! m : L.monoid, L.structureMap m = a := by sorry
end LogStructure

structure LogIso {A : Type} [CommRing A] (L M : LogStructure A) where
  equiv : L.monoid ≃* M.monoid
  compatible : ∀ m, M.structureMap (equiv m) = L.structureMap m

def associatedLog {A P : Type} [CommRing A] [CommMonoid P] (α : P →* A) : LogStructure A := by sorry
def associatedLogOf {A P : Type} [CommRing A] [CommMonoid P] (α : P →* A) :
    P →* (associatedLog α).monoid := by sorry
namespace associatedLog
 theorem of {A P : Type} [CommRing A] [CommMonoid P] (α : P →* A) (p : P) :
    (associatedLog α).structureMap (associatedLogOf α p) = α p := by sorry
 theorem lift {A P : Type} [CommRing A] [CommMonoid P] (α : P →* A)
    (L : LogStructure A) (f : P →* L.monoid) (hf : ∀ p, L.structureMap (f p) = α p) :
    ∃! g : LogHom (associatedLog α) L, ∀ p, g.val (associatedLogOf α p) = f p := by sorry
 def idempotent {A P : Type} [CommRing A] [CommMonoid P] (α : P →* A) :
    (associatedLog (associatedLog α).structureMap).monoid ≃* (associatedLog α).monoid := by sorry
end associatedLog
-- Test: TauCeti.LogCrystalline.associatedLog.already_log
example {A : Type} [CommRing A] :
    (associatedLog (trivialLog (A := A)).structureMap).monoid ≃* Aˣ := by sorry
-- Test: TauCeti.LogCrystalline.associatedLog.zero_log_point
example {k : Type} [Field k] : (associatedLog (natChart (0 : k))).monoid ≃* (kˣ × Multiplicative ℕ) := by sorry
-- Test: TauCeti.LogCrystalline.associatedLog.invertible_generator
example {A : Type} [CommRing A] (t : Aˣ) : (associatedLog (natChart (t : A))).monoid ≃* Aˣ := by sorry
-- Test: TauCeti.LogCrystalline.LogStructure.standard_log_point
example {k : Type} [Field k] : (associatedLog (natChart (0 : k))).monoid ≃* (kˣ × Multiplicative ℕ) := by sorry
-- Test: TauCeti.LogCrystalline.LogStructure.prelog_is_not_log
example {k : Type} [Field k] (a : kˣ) (ha : a ≠ 1) :
    ¬ (∀ b : k, IsUnit b → ∃! x : PUnit, (1 : k) = b) := by sorry

def logPullback {A B : Type} [CommRing A] [CommRing B] (f : A →+* B)
    (L : LogStructure A) : LogStructure B := by sorry
namespace logPullback
 def of {A B : Type} [CommRing A] [CommRing B] (f : A →+* B) (L : LogStructure A) :
    L.monoid →* (logPullback f L).monoid := by sorry
 def comp {A B C : Type} [CommRing A] [CommRing B] [CommRing C]
    (f : A →+* B) (g : B →+* C) (L : LogStructure A) :
    (logPullback (g.comp f) L).monoid ≃* (logPullback g (logPullback f L)).monoid := by sorry
 def units {A B : Type} [CommRing A] [CommRing B] (f : A →+* B) :
    (logPullback f (trivialLog (A := A))).monoid ≃* Bˣ := by sorry
end logPullback
-- Test: TauCeti.LogCrystalline.logPullback.identity
example {A : Type} [CommRing A] (L : LogStructure A) :
    (logPullback (RingHom.id A) L).monoid ≃* L.monoid := by sorry
-- Test: TauCeti.LogCrystalline.logPullback.punctured_line
example {A B : Type} [CommRing A] [CommRing B] (f : A →+* B) (t : A) (ht : IsUnit (f t)) :
    (logPullback f (associatedLog (natChart t))).monoid ≃* Bˣ := by sorry
-- Test: TauCeti.LogCrystalline.logPullback.special_fibre
example {A k : Type} [CommRing A] [Field k] (f : A →+* k) (π : A) (hπ : f π = 0) :
    (logPullback f (associatedLog (natChart π))).monoid ≃* (kˣ × Multiplicative ℕ) := by sorry

def characteristicMonoid {A : Type} [CommRing A] (L : LogStructure A) : CommMonCat.{0} := by sorry
namespace characteristicMonoid
 def quotient {A : Type} [CommRing A] (L : LogStructure A) : L.monoid →* characteristicMonoid L := by sorry
 -- The log unit condition gives the canonical monoid homomorphism from ring units.
 def logUnits {A : Type} [CommRing A] (L : LogStructure A) : Aˣ →* L.monoid := by sorry
 -- Quotient by the image: groupification need not embed the unit group for a nonintegral log.
 def gp_quotient {A : Type} [CommRing A] (L : LogStructure A) :
    Algebra.GrothendieckGroup (characteristicMonoid L) ≃*
      (Algebra.GrothendieckGroup L.monoid ⧸
        (Algebra.GrothendieckGroup.of.comp (logUnits L)).range) := by sorry
 theorem sharp {A : Type} [CommRing A] (L : LogStructure A) (m : characteristicMonoid L)
    (hm : IsUnit m) : m = 1 := by sorry
end characteristicMonoid
-- Test: TauCeti.LogCrystalline.characteristicMonoid.trivial
example {A : Type} [CommRing A] : Subsingleton (characteristicMonoid (trivialLog (A := A))) := by sorry
-- Test: TauCeti.LogCrystalline.LogStructure.trivial_units
example {A : Type} [CommRing A] : Subsingleton (characteristicMonoid (trivialLog (A := A))) := by sorry
-- Test: TauCeti.LogCrystalline.characteristicMonoid.log_point
example {k : Type} [Field k] : characteristicMonoid (associatedLog (natChart (0 : k))) ≃* Multiplicative ℕ := by sorry
-- Test: TauCeti.LogCrystalline.characteristicMonoid.same_alpha_image
example : ¬ Nonempty (Multiplicative ℕ ≃* (Multiplicative ℕ × Multiplicative ℕ)) := by sorry

def IsIntegralMonoid (P : Type) [CommMonoid P] : Prop :=
  Function.Injective (Algebra.GrothendieckGroup.of (M := P))
def IsFineMonoid (P : Type) [CommMonoid P] : Prop :=
  IsIntegralMonoid P ∧ ∃ s : Finset P, Submonoid.closure (s : Set P) = ⊤
def IsSaturatedMonoid (P : Type) [CommMonoid P] : Prop :=
  IsIntegralMonoid P ∧ ∀ g : Algebra.GrothendieckGroup P, ∀ n : ℕ, 0 < n →
    (∃ p : P, Algebra.GrothendieckGroup.of p = g^n) → ∃ p : P, Algebra.GrothendieckGroup.of p = g
namespace IsIntegralMonoid
 theorem cancel (P : Type) [CommMonoid P] : IsIntegralMonoid P ↔ ∀ a b c : P, a*b=a*c → b=c := by sorry
 theorem of_injective (P : Type) [CommMonoid P] (h : IsIntegralMonoid P) :
    Function.Injective (Algebra.GrothendieckGroup.of (M := P)) := by sorry
 theorem characteristic {A : Type} [CommRing A] (L : LogStructure A)
    (h : IsIntegralMonoid L.monoid) : IsIntegralMonoid (characteristicMonoid L) := by sorry
end IsIntegralMonoid
namespace IsFineMonoid
 theorem integral (P : Type) [CommMonoid P] (h : IsFineMonoid P) : IsIntegralMonoid P := by sorry
 theorem finite_generators (P : Type) [CommMonoid P] (h : IsFineMonoid P) :
    ∃ s : Finset P, Submonoid.closure (s : Set P) = ⊤ := by sorry

end IsFineMonoid
namespace IsSaturatedMonoid
 theorem root_closed (P : Type) [CommMonoid P] (h : IsSaturatedMonoid P)
    (g : Algebra.GrothendieckGroup P) (n : ℕ) (hn : 0<n)
    (hg : ∃ p : P, Algebra.GrothendieckGroup.of p = g^n) :
    ∃ p : P, Algebra.GrothendieckGroup.of p = g := by sorry
 -- The saturation object is a submonoid of the existing groupification.
 def saturation (P : Type) [CommMonoid P] : Submonoid (Algebra.GrothendieckGroup P) := by sorry
 def saturation_lift {P Q : Type} [CommMonoid P] [CommMonoid Q]
    (hP : IsIntegralMonoid P) (hQ : IsSaturatedMonoid Q) (f : P →* Q) : saturation P →* Q := by sorry
 theorem fs_integral (P : Type) [CommMonoid P] (hf : IsFineMonoid P) (hs : IsSaturatedMonoid P) : IsIntegralMonoid P := by sorry
end IsSaturatedMonoid

def cusp : AddSubmonoid ℕ := AddSubmonoid.closure ({2,3} : Set ℕ)
abbrev RatNonneg := {q : ℚ // 0 ≤ q}
-- Test: TauCeti.LogCrystalline.IsIntegralMonoid.nat
example : IsIntegralMonoid (Multiplicative ℕ) := by sorry
-- Test: TauCeti.LogCrystalline.IsIntegralMonoid.rational
example : IsIntegralMonoid (Multiplicative RatNonneg) := by sorry
-- Test: TauCeti.LogCrystalline.IsIntegralMonoid.idempotent
example {P : Type} [CommMonoid P] (a : P) (ha : a*a=a) (hne : a≠1) : ¬ IsIntegralMonoid P := by sorry
-- Test: TauCeti.LogCrystalline.IsFineMonoid.nat
example : IsFineMonoid (Multiplicative ℕ) := by sorry
-- Test: TauCeti.LogCrystalline.IsFineMonoid.cusp
example : IsFineMonoid (Multiplicative cusp) ∧ (1:ℕ) ∉ cusp := by sorry
-- Test: TauCeti.LogCrystalline.IsFineMonoid.rational_not_fine
example : ¬ IsFineMonoid (Multiplicative RatNonneg) := by sorry
-- Test: TauCeti.LogCrystalline.IsSaturatedMonoid.nat
example : IsSaturatedMonoid (Multiplicative ℕ) := by sorry
-- Test: TauCeti.LogCrystalline.IsSaturatedMonoid.cusp
example : ¬ IsSaturatedMonoid (Multiplicative cusp) := by sorry
-- Test: TauCeti.LogCrystalline.IsSaturatedMonoid.rational
example : IsSaturatedMonoid (Multiplicative RatNonneg) ∧ ¬ IsFineMonoid (Multiplicative RatNonneg) := by sorry

structure LogChart {A : Type} [CommRing A] (L : LogStructure A) where
  P : CommMonCat.{0}
  α : P →* A
  logIso : (associatedLog α).monoid ≃* L.monoid
  compatible : ∀ m, L.structureMap (logIso m) = (associatedLog α).structureMap m
namespace LogChart
 def associated_iso {A : Type} [CommRing A] {L : LogStructure A} (c : LogChart L) :
    (associatedLog c.α).monoid ≃* L.monoid := by sorry
 theorem characteristic_stalk {A : Type} [CommRing A] {L : LogStructure A} (c : LogChart L)
    (p : c.P) : characteristicMonoid.quotient L (c.logIso (associatedLogOf c.α p))=1 ↔ IsUnit (c.α p) := by sorry
 def restrict {A B : Type} [CommRing A] [CommRing B] {L : LogStructure A}
    (c : LogChart L) (f : A →+* B) : LogChart (logPullback f L) := by sorry
end LogChart
-- Standard closed toric and rational log-point charts, including all units after logification.
def toricZeroChart (k : Type) [Field k] (r : ℕ) : Multiplicative (Fin r → ℕ) →* k := by sorry
def zeroRationalChart (k : Type) [Field k] : Multiplicative ℚ≥0 →* k := by sorry
def rationalLogPoint (k : Type) [Field k] : LogStructure k := associatedLog (zeroRationalChart k)
def rationalLogPointChart (k : Type) [Field k] : LogChart (rationalLogPoint k) := by sorry
def unitLogChart (A : Type) [CommRing A] : LogChart (associatedLog (Units.coeHom A)) where
  P := CommMonCat.of Aˣ
  α := Units.coeHom A
  logIso := MulEquiv.refl _
  compatible := by intro m; rfl

-- Test: TauCeti.LogCrystalline.LogChart.toric_origin
example (k : Type) [Field k] (r : ℕ) :
    characteristicMonoid (associatedLog (toricZeroChart k r)) ≃* Multiplicative (Fin r → ℕ) := by sorry
-- Test: TauCeti.LogCrystalline.LogChart.torus
example {A P : Type} [CommRing A] [CommMonoid P] (α : P →* A) (h : ∀ p, IsUnit (α p)) :
    Subsingleton (characteristicMonoid (associatedLog α)) := by sorry
-- Test: TauCeti.LogCrystalline.LogChart.chart_not_sharp
example : (∃ m : (unitLogChart ℤ).P, IsUnit m ∧ m ≠ 1) ∧
    Subsingleton (characteristicMonoid (associatedLog (unitLogChart ℤ).α)) := by sorry

def gpMap {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) :
    Algebra.GrothendieckGroup P →* Algebra.GrothendieckGroup Q :=
  Algebra.GrothendieckGroup.lift (Algebra.GrothendieckGroup.of.comp f)
def IsExact {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) : Prop :=
  ∀ x : Algebra.GrothendieckGroup P,
    x ∈ Set.range Algebra.GrothendieckGroup.of ↔ gpMap f x ∈ Set.range Algebra.GrothendieckGroup.of
def IsIntegralMorphism {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) : Prop :=
  ∀ a₁ a₂ : P, ∀ b₁ b₂ : Q, f a₁*b₁=f a₂*b₂ →
    ∃ a₃ a₄ : P, ∃ b : Q, b₁=f a₃*b ∧ b₂=f a₄*b ∧ a₁*a₃=a₂*a₄
def IsKummer {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) : Prop :=
  Function.Injective f ∧ ∀ b : Q, ∃ n : ℕ, 0<n ∧ ∃ a : P, f a=b^n

def rootChart (n : ℕ) : Multiplicative ℕ →* Multiplicative ℕ := by sorry
def sumChart : Multiplicative (ℕ × ℕ) →* Multiplicative ℕ := by sorry
def diagonalChart (r : ℕ) : Multiplicative ℕ →* Multiplicative (Fin r → ℕ) := by sorry
namespace IsExact
 theorem gp_square {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) : IsExact f ↔
    ∀ x, x ∈ Set.range Algebra.GrothendieckGroup.of ↔ gpMap f x ∈ Set.range Algebra.GrothendieckGroup.of := by sorry
 theorem comp {P Q R : Type} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : Q →* R) (hf : IsExact f) (hg : IsExact g) : IsExact (g.comp f) := by sorry
 theorem closed_strict {P Q : Type} [CommMonoid P] [CommMonoid Q]
    (f : P →* Q) (hP : IsIntegralMonoid P) (hQ : IsIntegralMonoid Q)
    (hf : IsExact f) (hs : Function.Surjective f)
    (hu : ∀ a, f a=1 → a=1) : Function.Bijective f := by sorry
end IsExact
-- Test: TauCeti.LogCrystalline.IsExact.nat_multiple
example (n : ℕ) (hn : 0<n) : IsExact (rootChart n) := by sorry
-- Test: TauCeti.LogCrystalline.IsExact.identity
example {P : Type} [CommMonoid P] : IsExact (MonoidHom.id P) := by sorry
-- Test: TauCeti.LogCrystalline.IsExact.diagonal_immersion
example : ¬ IsExact sumChart := by sorry
namespace IsIntegralMorphism
 theorem exact {P Q : Type} [CommMonoid P] [CommMonoid Q]
    (f : P →* Q) (hP : IsIntegralMonoid P) (hQ : IsIntegralMonoid Q)
    (h : IsIntegralMorphism f) (hl : ∀ a, IsUnit (f a) → IsUnit a) : IsExact f := by sorry
end IsIntegralMorphism
-- Test: TauCeti.LogCrystalline.IsIntegralMorphism.diagonal
example (r : ℕ) (hr : 0<r) : IsIntegralMorphism (diagonalChart r) := by sorry
-- Test: TauCeti.LogCrystalline.IsIntegralMorphism.identity
example {P : Type} [CommMonoid P] : IsIntegralMorphism (MonoidHom.id P) := by sorry
-- Test: TauCeti.LogCrystalline.IsIntegralMorphism.cusp_inclusion
example : ¬ IsIntegralMorphism (cusp.subtype.toMultiplicative) := by sorry
namespace IsKummer
 theorem injective {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) (h : IsKummer f) : Function.Injective f := by sorry
 theorem power_lift {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) (h : IsKummer f) (b : Q) :
    ∃ n : ℕ, 0<n ∧ ∃ a : P, f a=b^n := by sorry
 theorem comp {P Q R : Type} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : Q →* R) (hf : IsKummer f) (hg : IsKummer g) : IsKummer (g.comp f) := by sorry
end IsKummer

-- Test: TauCeti.LogCrystalline.IsKummer.identity
example {P : Type} [CommMonoid P] : IsKummer (MonoidHom.id P) := by sorry

structure PushoutChart {P Q R : Type} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : P →* R) where
  monoid : CommMonCat.{0}
  left : Q →* monoid
  right : R →* monoid
  commute : left.comp f = right.comp g
  universal : ∀ (T : CommMonCat.{0}) (a : Q →* T) (b : R →* T),
    a.comp f=b.comp g → ∃! c : monoid →* T, c.comp left=a ∧ c.comp right=b

def monoidPushout {P Q R : Type} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : P →* R) : PushoutChart f g := by sorry
-- Geometric forms of the affine primitives above. These are CR.5 constructions,
-- on the pinned small etale site, rather than arbitrary categories of test objects.
def etaleStructureSheaf (X : Scheme.{0}) :
    Sheaf (Scheme.smallEtaleTopology X) CommRingCat.{0} := by sorry

structure EtaleLogStructure (X : Scheme.{0}) where
  monoidSheaf : Sheaf (Scheme.smallEtaleTopology X) CommMonCat.{0}
  alpha : monoidSheaf.obj ⟶
    (etaleStructureSheaf X).obj ⋙ forget₂ CommRingCat CommMonCat
  unitCondition : ∀ (U : X.Etaleᵒᵖ) (a : (etaleStructureSheaf X).obj.obj U),
    IsUnit a → ∃! m : monoidSheaf.obj.obj U, (alpha.app U) m = a

def etaleLogPullback {X Y : Scheme.{0}} (f : X ⟶ Y)
    (L : EtaleLogStructure Y) : EtaleLogStructure X := by sorry

structure LogScheme where
  scheme : Scheme.{0}
  log : EtaleLogStructure scheme

structure LogSchemeHom (X Y : LogScheme) where
  underlying : X.scheme ⟶ Y.scheme
  structural : (etaleLogPullback underlying Y.log).monoidSheaf ⟶ X.log.monoidSheaf
  compatible : structural.hom ≫ X.log.alpha = (etaleLogPullback underlying Y.log).alpha

instance : Category LogScheme where
  Hom := LogSchemeHom
  id X := { underlying := 𝟙 X.scheme, structural := by sorry, compatible := by sorry }
  comp f g := { underlying := f.underlying ≫ g.underlying, structural := by sorry, compatible := by sorry }
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
def logUnderlying {X Y : LogScheme} (f : X ⟶ Y) : X.scheme ⟶ Y.scheme := f.underlying
def logStructural {X Y : LogScheme} (f : X ⟶ Y) :
    (etaleLogPullback (logUnderlying f) Y.log).monoidSheaf ⟶ X.log.monoidSheaf := f.structural
def logForget : LogScheme ⥤ Scheme.{0} := by sorry
def trivialLogScheme (X : Scheme.{0}) : LogScheme := ⟨X, by sorry⟩
def affineLogScheme {A P : Type} [CommRing A] [CommMonoid P]
    (alpha : P →* A) : LogScheme := ⟨Spec (CommRingCat.of A), by sorry⟩
def strictPullback {X : LogScheme} {U : Scheme.{0}} (e : U ⟶ X.scheme) : LogScheme :=
  ⟨U, etaleLogPullback e X.log⟩
def strictPullbackMap {X : LogScheme} {U : Scheme.{0}} (e : U ⟶ X.scheme) :
    strictPullback e ⟶ X := by sorry

-- A geometric point includes the field and its actual map, so a stalk is never an
-- independently chosen monoid or local ring.
structure LogGeometricPoint (X : LogScheme) where
  field : Type
  fieldInstance : Field field
  separablyClosed : IsSepClosed field
  point : Spec (CommRingCat.of field) ⟶ X.scheme
attribute [instance] LogGeometricPoint.fieldInstance LogGeometricPoint.separablyClosed
def logStalkRing {X : LogScheme} (x : LogGeometricPoint X) : CommRingCat.{0} := by sorry
def logStalk {X : LogScheme} (x : LogGeometricPoint X) : LogStructure (logStalkRing x) := by sorry
def mappedGeometricPoint {X Y : LogScheme} (f : X ⟶ Y) (x : LogGeometricPoint X) :
    LogGeometricPoint Y := by sorry
def logStalkHom {X Y : LogScheme} (f : X ⟶ Y) (x : LogGeometricPoint X) :
    (logStalk (mappedGeometricPoint f x)).monoid →* (logStalk x).monoid := by sorry

def associatedEtaleLog {X : Scheme.{0}} {P : Type} [CommMonoid P]
    (alpha : P →* Γ(X, ⊤)) : EtaleLogStructure X := by sorry
structure EtaleLogChart (X : LogScheme) where
  monoid : CommMonCat.{0}
  alpha : monoid →* Γ(X.scheme, ⊤)
  iso : (associatedEtaleLog alpha).monoidSheaf ≅ X.log.monoidSheaf
  compatible : iso.hom.hom ≫ X.log.alpha = (associatedEtaleLog alpha).alpha

def HasEtaleCharts (X : LogScheme) : Prop :=
  ∀ x : X.scheme, ∃ (U : Scheme.{0}) (e : U ⟶ X.scheme),
    Etale e ∧ (∃ u : U, e.base u = x) ∧ Nonempty (EtaleLogChart (strictPullback e))
def IsFineLog (X : LogScheme) : Prop :=
  ∀ x : X.scheme, ∃ (U : Scheme.{0}) (e : U ⟶ X.scheme),
    Etale e ∧ (∃ u : U, e.base u = x) ∧
      ∃ c : EtaleLogChart (strictPullback e), IsFineMonoid c.monoid
def IsIntegralLog (X : LogScheme) : Prop :=
  ∀ x : LogGeometricPoint X, IsIntegralMonoid (logStalk x).monoid
def IsFSLog (X : LogScheme) : Prop :=
  IsFineLog X ∧ ∀ x : LogGeometricPoint X,
    IsSaturatedMonoid (characteristicMonoid (logStalk x))

namespace IsFineMonoid
 theorem logification {A P : Type} [CommRing A] [CommMonoid P]
    (alpha : P →* A) (h : IsFineMonoid P) : IsFineLog (affineLogScheme alpha) := by sorry
end IsFineMonoid

def IsStrict {X Y : LogScheme} (f : X ⟶ Y) : Prop := IsIso (logStructural f)
def IsExactLog {X Y : LogScheme} (f : X ⟶ Y) : Prop :=
  ∀ x : LogGeometricPoint X, IsExact (logStalkHom f x)
def IsIntegralLogMorphism {X Y : LogScheme} (f : X ⟶ Y) : Prop :=
  ∀ x : LogGeometricPoint X, IsIntegralMorphism (logStalkHom f x)
def logCharacteristicHom {X Y : LogScheme} (f : X ⟶ Y) (x : LogGeometricPoint X) :
    characteristicMonoid (logStalk (mappedGeometricPoint f x)) →*
      characteristicMonoid (logStalk x) := by sorry
def IsKummerLog {X Y : LogScheme} (f : X ⟶ Y) : Prop :=
  ∀ x : LogGeometricPoint X,
    IsKummer (logCharacteristicHom f x)

-- Ordinary log limits, followed by the right adjoint integralization. FS limits
-- apply saturation afterwards and can change the underlying scheme.
def ordinaryLogFiberProduct {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S) : LogScheme := by sorry
def integralization (X : LogScheme) : LogScheme := by sorry
def fsification (X : LogScheme) (hf : IsFineLog X) : LogScheme := by sorry
def logFiberProduct {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S) : LogScheme :=
  integralization (ordinaryLogFiberProduct f g)
def logFiberProductFst {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S) :
    logFiberProduct f g ⟶ X := by sorry
def logFiberProductSnd {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S) :
    logFiberProduct f g ⟶ Y := by sorry
namespace logFiberProduct
 theorem projections {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S) :
    logFiberProductFst f g ≫ f = logFiberProductSnd f g ≫ g := by sorry
 theorem lift {X Y S T : LogScheme} (f : X ⟶ S) (g : Y ⟶ S)
    (hT : IsIntegralLog T) (a : T ⟶ X) (b : T ⟶ Y) (h : a ≫ f = b ≫ g) :
    ∃! c : T ⟶ logFiberProduct f g,
      c ≫ logFiberProductFst f g = a ∧ c ≫ logFiberProductSnd f g = b := by sorry
 def strict_underlying {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S)
    (hX : IsIntegralLog X) (hY : IsIntegralLog Y) (hs : IsStrict f) :
    (logFiberProduct f g).scheme ≅ Limits.pullback (logUnderlying f) (logUnderlying g) := by sorry
end logFiberProduct

def IsLogClosedImmersion {X Y : LogScheme} (i : X ⟶ Y) : Prop :=
  IsClosedImmersion (logUnderlying i) ∧ ∀ x : LogGeometricPoint X,
    Function.Surjective (logStalkHom i x)

def fsificationMap (X : LogScheme) (hf : IsFineLog X) : fsification X hf ⟶ X := by sorry
def coordinateChart {A : Type} [CommRing A] (r : ℕ) (t : Fin r → A) :
    Multiplicative (Fin r → ℕ) →* A := by sorry
theorem coordinateChart_basis {A : Type} [CommRing A] (r : ℕ) (t : Fin r → A) (i : Fin r) :
    coordinateChart r t (Multiplicative.ofAdd (Pi.single i 1)) = t i := by sorry
def IsExactSquareZero {A B : LogScheme} (i : A ⟶ B) : Prop :=
  IsLogClosedImmersion i ∧ IsExactLog i ∧
    ∀ x : A.scheme, (RingHom.ker ((logUnderlying i).stalkMap x).hom)^2 = ⊥
def EtaleLocalLifts {A B X Y : LogScheme} {i : A ⟶ B} {f : X ⟶ Y}
    {a : A ⟶ X} {b : B ⟶ Y} (sq : CommSq a i f b) : Prop :=
  ∀ z : B.scheme, ∃ (U : Scheme.{0}) (e : U ⟶ B.scheme),
    Etale e ∧ (∃ u : U, e.base u = z) ∧
      ∃ l : strictPullback e ⟶ X,
        l ≫ f = strictPullbackMap e ≫ b ∧
        logFiberProductSnd i (strictPullbackMap e) ≫ l =
          logFiberProductFst i (strictPullbackMap e) ≫ a
def IsLogSmooth {X Y : LogScheme} (f : X ⟶ Y) : Prop :=
  LocallyOfFinitePresentation (logUnderlying f) ∧
    ∀ (A B : LogScheme) (i : A ⟶ B) (a : A ⟶ X) (b : B ⟶ Y),
      IsExactSquareZero i → ∀ sq : CommSq a i f b, EtaleLocalLifts sq
def IsLogEtale {X Y : LogScheme} (f : X ⟶ Y) : Prop :=
  IsLogSmooth f ∧ ∀ (A B : LogScheme) (i : A ⟶ B) (hi : IsExactSquareZero i),
    ∀ l₁ l₂ : B ⟶ X, i ≫ l₁ = i ≫ l₂ → l₁ ≫ f = l₂ ≫ f → l₁ = l₂

namespace IsStrict
 def pullback_iso {X Y : LogScheme} (f : X ⟶ Y) (h : IsStrict f) :
    (etaleLogPullback (logUnderlying f) Y.log).monoidSheaf ≅ X.log.monoidSheaf := by sorry
 theorem comp {X Y Z : LogScheme} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : IsStrict f) (hg : IsStrict g) : IsStrict (f ≫ g) := by sorry
 theorem smooth_iff {X Y : LogScheme} (f : X ⟶ Y) (hs : IsStrict f) :
    IsLogSmooth f ↔ Smooth (logUnderlying f) := by sorry
end IsStrict
namespace IsLogSmooth
 theorem lift {A B X Y : LogScheme} (i : A ⟶ B) (f : X ⟶ Y)
    (hi : IsExactSquareZero i) (hf : IsLogSmooth f)
    (a : A ⟶ X) (b : B ⟶ Y) (sq : CommSq a i f b) : EtaleLocalLifts sq := by sorry
 theorem strict_iff {X Y : LogScheme} (f : X ⟶ Y) (hs : IsStrict f) :
    IsLogSmooth f ↔ Smooth (logUnderlying f) := by sorry
 theorem compose {X Y Z : LogScheme} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : IsLogSmooth f) (hg : IsLogSmooth g) : IsLogSmooth (f ≫ g) := by sorry
end IsLogSmooth

-- Compatible charts supply the actual map X -> Y x_Spec Z[P] Spec Z[Q].
structure LogMorphismChart {X Y : LogScheme} (f : X ⟶ Y) where
  source : EtaleLogChart X
  target : EtaleLogChart Y
  chartMap : target.monoid →* source.monoid
  compatible : ∀ p, source.alpha (chartMap p) =
    ((logUnderlying f).appTop).hom (target.alpha p)
def toricScheme (P : CommMonCat.{0}) : Scheme.{0} :=
  Spec (CommRingCat.of (MonoidAlgebra ℤ P))
def toricChartMap {X Y : LogScheme} {f : X ⟶ Y} (c : LogMorphismChart f) :
    X.scheme ⟶ Limits.pullback
      (show Y.scheme ⟶ toricScheme c.target.monoid from by sorry)
      (show toricScheme c.source.monoid ⟶ toricScheme c.target.monoid from by sorry) := by sorry
def chartCokernel {P Q : Type} [CommMonoid P] [CommMonoid Q] (h : P →* Q) :
    CommGrpCat.{0} := CommGrpCat.of (Algebra.GrothendieckGroup Q ⧸ (gpMap h).range)
def chartTorsion {G : Type} [CommGroup G] : Subgroup G := by sorry
def ChartGroupCondition {X Y : LogScheme} {f : X ⟶ Y} (c : LogMorphismChart f) : Prop :=
  Set.Finite ((gpMap c.chartMap).ker : Set (Algebra.GrothendieckGroup c.target.monoid)) ∧
  Set.Finite (chartTorsion (G := chartCokernel c.chartMap) : Set (chartCokernel c.chartMap)) ∧
  (∃ n : ℕ, 0 < n ∧ IsUnit (n : Γ(X.scheme, ⊤)) ∧
    (∀ a : (gpMap c.chartMap).ker, a^n = 1) ∧
    (∀ a : chartTorsion (G := chartCokernel c.chartMap), a^n = 1))
theorem logSmooth_of_chart {X Y : LogScheme} (f : X ⟶ Y)
    (c : LogMorphismChart f) (hP : IsFineMonoid c.target.monoid)
    (hQ : IsFineMonoid c.source.monoid) (hg : ChartGroupCondition c)
    (ht : Smooth (toricChartMap c)) : IsLogSmooth f := by sorry

structure KatoSmoothNeighborhood {X Y : LogScheme} (f : X ⟶ Y) (x : X.scheme) where
  source : LogScheme
  target : LogScheme
  sourceMap : source ⟶ X
  targetMap : target ⟶ Y
  strictSource : IsStrict sourceMap
  strictTarget : IsStrict targetMap
  etaleSource : Etale (logUnderlying sourceMap)
  etaleTarget : Etale (logUnderlying targetMap)
  point : source.scheme
  contains : (logUnderlying sourceMap).base point = x
  map : source ⟶ target
  commutes : map ≫ targetMap = sourceMap ≫ f
  chart : LogMorphismChart map
  sourceFine : IsFineMonoid chart.source.monoid
  targetFine : IsFineMonoid chart.target.monoid
  groupCondition : ChartGroupCondition chart
  toricSmooth : Smooth (toricChartMap chart)
theorem logSmooth_chart_criterion {X Y : LogScheme} (f : X ⟶ Y)
    (hX : IsFineLog X) (hY : IsFineLog Y) :
    IsLogSmooth f ↔ ∀ x : X.scheme, Nonempty (KatoSmoothNeighborhood f x) := by sorry
structure KatoEtaleNeighborhood {X Y : LogScheme} (f : X ⟶ Y) (x : X.scheme) extends
    KatoSmoothNeighborhood f x where
  finiteCokernel : Finite (chartCokernel chart.chartMap)
  invertibleAnnihilator : ∃ n : ℕ, 0 < n ∧ IsUnit (n : Γ(source.scheme, ⊤)) ∧
    ∀ a : chartCokernel chart.chartMap, a^n = 1
  toricEtale : Etale (toricChartMap chart)
theorem logEtale_chart_criterion {X Y : LogScheme} (f : X ⟶ Y)
    (hX : IsFineLog X) (hY : IsFineLog Y) :
    IsLogEtale f ↔ ∀ x : X.scheme, Nonempty (KatoEtaleNeighborhood f x) := by sorry
theorem logFiberProduct_fine {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S)
    (hX : IsFineLog X) (hY : IsFineLog Y) (hS : IsFineLog S) :
    IsFineLog (logFiberProduct f g) := by sorry
def fsLogFiberProduct {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S)
    (hX : IsFineLog X) (hY : IsFineLog Y) (hS : IsFineLog S) : LogScheme :=
  fsification (logFiberProduct f g) (logFiberProduct_fine f g hX hY hS)
def fsLogFiberProductSnd {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S)
    (hX : IsFineLog X) (hY : IsFineLog Y) (hS : IsFineLog S) :
    fsLogFiberProduct f g hX hY hS ⟶ Y :=
  fsificationMap (logFiberProduct f g) (logFiberProduct_fine f g hX hY hS) ≫
    logFiberProductSnd f g
-- Kato's fine base-change statements and fs Kummer etale base change
-- use different products. The integral product alone is not an fs product.
theorem logMorphisms_baseChange {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S)
    (hX : IsFineLog X) (hY : IsFineLog Y) (hS : IsFineLog S) :
    (IsStrict f → IsStrict (logFiberProductSnd f g)) ∧
    (IsExactLog f → IsExactLog (logFiberProductSnd f g)) ∧
    (IsIntegralLogMorphism f → IsIntegralLogMorphism (logFiberProductSnd f g)) ∧
    (IsLogSmooth f → IsLogSmooth (logFiberProductSnd f g)) ∧
    (IsLogEtale f → IsLogEtale (logFiberProductSnd f g)) := by sorry
theorem kummerEtale_fsBaseChange {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S)
    (hX : IsFSLog X) (hY : IsFSLog Y) (hS : IsFSLog S)
    (hk : IsKummerLog f) (he : IsLogEtale f) :
    IsKummerLog (fsLogFiberProductSnd f g hX.1 hY.1 hS.1) ∧
      IsLogEtale (fsLogFiberProductSnd f g hX.1 hY.1 hS.1) := by sorry

def standardLogPoint (k : Type) [Field k] : LogScheme := affineLogScheme (natChart (0 : k))
def forgettingLogPoint (k : Type) [Field k] :
    standardLogPoint k ⟶ trivialLogScheme (Spec (CommRingCat.of k)) := by sorry
def semistableLogModel (k : Type) [Field k] (r : ℕ) : LogScheme := by sorry
def semistableLogMap (k : Type) [Field k] (r : ℕ) :
    semistableLogModel k r ⟶ standardLogPoint k := by sorry
def toricRootMap (k : Type) [Field k] (n : ℕ) :
    affineLogScheme (natChart (Polynomial.X : Polynomial k)) ⟶
      affineLogScheme (natChart (Polynomial.X : Polynomial k)) := by sorry

-- Test: TauCeti.LogCrystalline.IsKummer.root_prime_to_p
example (k : Type) [Field k] (n : ℕ) (hn : 0 < n) (hi : IsUnit (n : k)) :
    IsKummer (rootChart n) ∧ IsKummerLog (toricRootMap k n) ∧ IsLogEtale (toricRootMap k n) := by sorry
-- Test: TauCeti.LogCrystalline.IsKummer.p_root
example (p : ℕ) [Fact p.Prime] :
    IsKummer (rootChart p) ∧ IsKummerLog (toricRootMap (ZMod p) p) ∧
      ¬ IsLogEtale (toricRootMap (ZMod p) p) := by sorry
def torusInclusion (k : Type) [Field k] :
    Spec (CommRingCat.of (LaurentPolynomial k)) ⟶
      (affineLogScheme (natChart (Polynomial.X : Polynomial k))).scheme :=
  Spec.map (CommRingCat.ofHom (Polynomial.eval₂RingHom LaurentPolynomial.C (LaurentPolynomial.T 1)))
-- Test: TauCeti.LogCrystalline.IsStrict.identity
example (X : LogScheme) : IsStrict (𝟙 X) := by sorry
-- Test: TauCeti.LogCrystalline.IsStrict.open_torus
example (k : Type) [Field k] : IsStrict (strictPullbackMap (torusInclusion k)) := by sorry

-- Test: TauCeti.LogCrystalline.IsStrict.forget_log_point
example (k : Type) [Field k] : ¬ IsStrict (forgettingLogPoint k) := by sorry
-- Test: TauCeti.LogCrystalline.logFiberProduct.over_trivial
example (X Y : Scheme.{0}) :
    (ordinaryLogFiberProduct
      (show trivialLogScheme X ⟶ trivialLogScheme (Spec (CommRingCat.of ℤ)) from by sorry)
      (show trivialLogScheme Y ⟶ trivialLogScheme (Spec (CommRingCat.of ℤ)) from by sorry)).scheme ≅
      Limits.prod X Y := by sorry
-- Test: TauCeti.LogCrystalline.logFiberProduct.identity
example (X S : LogScheme) (f : X ⟶ S) (hX : IsIntegralLog X) : logFiberProduct f (𝟙 S) ≅ X := by sorry
-- Test: TauCeti.LogCrystalline.logFiberProduct.saturation_changes
example (k : Type) [Field k] [CharZero k] :
    let Z := ordinaryLogFiberProduct (toricRootMap k 2) (toricRootMap k 2)
    ¬ IsIso (logUnderlying (fsificationMap Z (by sorry))) := by sorry
-- Test: TauCeti.LogCrystalline.IsLogSmooth.identity
example (X : LogScheme) : IsLogSmooth (𝟙 X) ∧ IsLogEtale (𝟙 X) := by sorry

-- Test: TauCeti.LogCrystalline.IsLogSmooth.semistable
example (k : Type) [Field k] (r : ℕ) (hr : 0 < r) : IsLogSmooth (semistableLogMap k r) := by sorry
-- Test: TauCeti.LogCrystalline.IsLogSmooth.torsion_obstruction
example (p : ℕ) [Fact p.Prime] : ¬ IsLogSmooth (toricRootMap (ZMod p) p) := by sorry
namespace IsIntegralMorphism
 theorem pushout {P Q R : Type} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : P →* R) (hP : IsIntegralMonoid P)
    (hQ : IsIntegralMonoid Q) (hR : IsIntegralMonoid R) (hf : IsIntegralMorphism f) :
    IsIntegralMonoid (monoidPushout f g).monoid := by sorry
 theorem base_change {P Q R : Type} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : P →* R) (hP : IsIntegralMonoid P)
    (hQ : IsIntegralMonoid Q) (hR : IsIntegralMonoid R) (hf : IsIntegralMorphism f) :
    IsIntegralMorphism (monoidPushout f g).right := by sorry
end IsIntegralMorphism

namespace IsLogRegular
 def boundary_ideal {A : Type} [CommRing A] (L : LogStructure A) : Ideal A :=
    Ideal.span {a | ∃ m : L.monoid, ¬ IsUnit (L.structureMap m) ∧ L.structureMap m = a}
end IsLogRegular
def characteristicRank {A : Type} [CommRing A] (L : LogStructure A) : ℕ :=
  Module.finrank ℤ (Additive (Algebra.GrothendieckGroup (characteristicMonoid L)))
def IsLogRegular {A : Type} [CommRing A] (L : LogStructure A) : Prop :=
  IsLocalRing A ∧ IsNoetherianRing A ∧
  IsIntegralMonoid L.monoid ∧ IsFineMonoid (characteristicMonoid L) ∧
  IsSaturatedMonoid (characteristicMonoid L) ∧
  IsRegularLocalRing (A ⧸ IsLogRegular.boundary_ideal L) ∧
  ringKrullDim A = ringKrullDim (A ⧸ IsLogRegular.boundary_ideal L) + characteristicRank L
def IsLogRegularScheme (X : LogScheme) : Prop :=
  IsFSLog X ∧ ∀ x : LogGeometricPoint X, IsLogRegular (logStalk x)
namespace IsLogRegular
 theorem dimension {A : Type} [CommRing A] (L : LogStructure A) (h : IsLogRegular L) :
    IsRegularLocalRing (A ⧸ boundary_ideal L) ∧
    ringKrullDim A = ringKrullDim (A ⧸ boundary_ideal L) + characteristicRank L := by sorry
 theorem trivial_iff (A : Type) [CommRing A] [IsLocalRing A] [IsNoetherianRing A] :
    IsLogRegular (trivialLog (A := A)) ↔ IsRegularLocalRing A := by sorry
end IsLogRegular
-- Test: TauCeti.LogCrystalline.IsLogRegular.regular_trivial
example (A : Type) [CommRing A] [IsRegularLocalRing A] :
    IsLogRegular (trivialLog (A := A)) := by sorry
def toricLocalRing (k : Type) [Field k] (r : ℕ) : CommRingCat.{0} := by sorry
def toricLocalLog (k : Type) [Field k] (r : ℕ) : LogStructure (toricLocalRing k r) := by sorry
def nodalLocalRing (k : Type) [Field k] : CommRingCat.{0} := by sorry
-- Test: TauCeti.LogCrystalline.IsLogRegular.coordinate_crossing
example (k : Type) [Field k] :
    IsLogRegular (toricLocalLog k 2) ∧
    ringKrullDim (toricLocalRing k 2) = 2 ∧
    ringKrullDim (toricLocalRing k 2 ⧸ IsLogRegular.boundary_ideal (toricLocalLog k 2)) = 0 ∧
    characteristicRank (toricLocalLog k 2) = 2 := by sorry
-- Test: TauCeti.LogCrystalline.IsLogRegular.nodal_trivial
example (k : Type) [Field k] : ¬ IsLogRegular (trivialLog (A := nodalLocalRing k)) := by sorry

-- Client view of the R09.7a SNC carrier, not a second owner of the boundary notion.
-- The source regularity and local equations are part of the supplied data.
def RegularParameterSubset {R : Type} [CommRing R] (r : ℕ) (t : Fin r → R) : Prop :=
  ∀ I : Finset (Fin r), (∀ i ∈ I, ¬ IsUnit (t i)) →
    IsRegularLocalRing (R ⧸ Ideal.span (t '' (I : Set (Fin r)))) ∧
    ringKrullDim R = ringKrullDim (R ⧸ Ideal.span (t '' (I : Set (Fin r)))) + I.card
def schemeGlobalToStalk (X : Scheme.{0}) (x : X) : Γ(X, ⊤) →+* X.presheaf.stalk x := by sorry
structure SNCBoundaryView where
  ambient : Scheme.{0}
  complement : Scheme.{0}
  inclusion : complement ⟶ ambient
  openImmersion : IsOpenImmersion inclusion
  regular : ∀ x : ambient, IsRegularLocalRing (ambient.presheaf.stalk x)
  parameterChart : ∀ x : ambient, ∃ (U : Scheme.{0}) (e : U ⟶ ambient),
    Etale e ∧ (∃ u : U, e.base u = x) ∧
    ∃ (r : ℕ) (t : Fin r → Γ(U, ⊤)),
      (∀ u : U, RegularParameterSubset r (fun i => schemeGlobalToStalk U u (t i))) ∧
      ∀ u : U, (∃ v : complement, inclusion.base v = e.base u) ↔
        ∀ i, IsUnit (schemeGlobalToStalk U u (t i))
def divisorialLog (D : SNCBoundaryView) : LogScheme := by sorry
def divisorialUnderlyingIso (D : SNCBoundaryView) : (divisorialLog D).scheme ≅ D.ambient := by sorry
def divisorialSections (D : SNCBoundaryView) (U : D.ambient.Etaleᵒᵖ) : Submonoid
    ((etaleStructureSheaf D.ambient).obj.obj U) := by sorry
namespace divisorialLog
 theorem sections (D : SNCBoundaryView) (U : D.ambient.Etaleᵒᵖ)
    (a : (etaleStructureSheaf D.ambient).obj.obj U) :
    a ∈ divisorialSections D U ↔
      IsUnit ((show (etaleStructureSheaf D.ambient).obj.obj U →+*
        Γ((Limits.pullback U.unop.hom D.inclusion), ⊤) from by sorry) a) := by sorry
 theorem boundary_chart (D : SNCBoundaryView) : IsFSLog (divisorialLog D) := by sorry
 def unit_change {A : Type} [CommRing A] (r : ℕ) (t : Fin r → A) (u : Fin r → Aˣ) :
    LogIso (associatedLog (coordinateChart r t))
      (associatedLog (coordinateChart r (fun i => (u i : A) * t i))) := by sorry
end divisorialLog
def emptySNCBoundary (X : Scheme.{0})
    (h : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) : SNCBoundaryView := by sorry
def coordinateSNCBoundary (k : Type) [Field k] (r : ℕ) : SNCBoundaryView := by sorry
-- Test: TauCeti.LogCrystalline.divisorialLog.empty_boundary
example (X : Scheme.{0}) (h : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) :
    divisorialLog (emptySNCBoundary X h) ≅ trivialLogScheme X := by sorry
-- Test: TauCeti.LogCrystalline.divisorialLog.coordinate_crossing
example (k : Type) [Field k] :
    divisorialLog (coordinateSNCBoundary k 2) ≅
      affineLogScheme (coordinateChart 2 (fun i => (MvPolynomial.X i : MvPolynomial (Fin 2) k))) := by sorry
def cuspLocalRing (k : Type) [Field k] : CommRingCat.{0} := by sorry
-- Localization of k[t^2,t^3] at the boundary maximal ideal (t^2,t^3).
-- Test: TauCeti.LogCrystalline.divisorialLog.cusp_failure
example (k : Type) [Field k] : ¬ IsRegularLocalRing (cuspLocalRing k) := by sorry

theorem logSmooth_logRegular {X Y : LogScheme} (f : X ⟶ Y)
    (hX : IsFSLog X) (hY : IsLogRegularScheme Y) (hf : IsLogSmooth f)
    (hn : ∀ x : LogGeometricPoint X, IsNoetherianRing (logStalkRing x)) :
    IsLogRegularScheme X := by sorry

-- The normalized tame finite cover and inertia condition come from LPV.5.
-- This client record retains the actual normal extension and its restriction.
def boundaryInertiaGroup {Y X : Scheme.{0}} (f : Y ⟶ X) (y : Y) : Type := by sorry
instance {Y X : Scheme.{0}} (f : Y ⟶ X) (y : Y) : Group (boundaryInertiaGroup f y) := by sorry
structure TameBoundaryCover (D : SNCBoundaryView) where
  normalExtension : Scheme.{0}
  finiteMap : normalExtension ⟶ D.ambient
  finite : IsFinite finiteMap
  normal : ∀ y : normalExtension, IsIntegrallyClosed (normalExtension.presheaf.stalk y)
  etaleOnComplement : Etale (Limits.pullback.snd finiteMap D.inclusion)
  finiteInertia : ∀ y, Finite (boundaryInertiaGroup finiteMap y)
  tame : ∀ y, IsUnit (Nat.card (boundaryInertiaGroup finiteMap y) : normalExtension.residueField y)
def normalizedBoundaryLog {D : SNCBoundaryView} (V : TameBoundaryCover D) : LogScheme := by sorry
def normalizedBoundaryMap {D : SNCBoundaryView} (V : TameBoundaryCover D) :
    normalizedBoundaryLog V ⟶ divisorialLog D := by sorry
theorem logAbhyankar (D : SNCBoundaryView) (V : TameBoundaryCover D) :
    IsKummerLog (normalizedBoundaryMap V) ∧ IsLogEtale (normalizedBoundaryMap V) ∧
      IsLogRegularScheme (normalizedBoundaryLog V) := by sorry

structure QCLogScheme where
  object : LogScheme
  charts : HasEtaleCharts object
  integral : IsIntegralLog object
def ordinaryLogLimit {J : Type} [SmallCategory J] (F : J ⥤ LogScheme) : LogScheme := by sorry
namespace QCLogScheme
 theorem chart (X : QCLogScheme) (x : X.object.scheme) :
    ∃ (U : Scheme.{0}) (e : U ⟶ X.object.scheme), Etale e ∧
      (∃ u : U, e.base u = x) ∧ Nonempty (EtaleLogChart (strictPullback e)) := by sorry
 def fine_inclusion (X : LogScheme) (hf : IsFineLog X) : QCLogScheme := by sorry
 theorem integral_limits {J : Type} [SmallCategory J] [FinCategory J]
    (F : J ⥤ LogScheme) (h : ∀ j, HasEtaleCharts (F.obj j) ∧ IsIntegralLog (F.obj j)) :
    HasEtaleCharts (integralization (ordinaryLogLimit F)) ∧
      IsIntegralLog (integralization (ordinaryLogLimit F)) := by sorry
end QCLogScheme
-- Test: TauCeti.LogCrystalline.QCLogScheme.fine_case
example (k : Type) [Field k] : IsFineLog (standardLogPoint k) ∧
    ∃ X : QCLogScheme, X.object = standardLogPoint k := by sorry
-- Test: TauCeti.LogCrystalline.QCLogScheme.rational_log_point
example (k : Type) [Field k] :
    ∃ X : QCLogScheme, X.object = affineLogScheme (zeroRationalChart k) := by sorry
-- Test: TauCeti.LogCrystalline.QCLogScheme.coherence_failure
example (k : Type) [Field k] : ¬ IsFineLog (affineLogScheme (zeroRationalChart k)) := by sorry

structure FineLogSmoothModel {X S : LogScheme} (f : X ⟶ S) where
  fineBase : LogScheme
  fineSource : LogScheme
  baseFine : IsFineLog fineBase
  sourceFine : IsFineLog fineSource
  baseMap : S ⟶ fineBase
  baseSchemeIso : IsIso (logUnderlying baseMap)
  modelMap : fineSource ⟶ fineBase
  smooth : IsLogSmooth modelMap
  sourceIso : X ≅ logFiberProduct modelMap baseMap
  overBase : sourceIso.hom ≫ logFiberProductSnd modelMap baseMap = f
structure EtaleLogNeighborhood (X : LogScheme) where
  scheme : Scheme.{0}
  map : scheme ⟶ X.scheme
  etale : Etale map
def EtaleLogNeighborhood.object {X : LogScheme} (U : EtaleLogNeighborhood X) : LogScheme :=
  strictPullback U.map
def EtaleLogNeighborhood.toOriginal {X : LogScheme} (U : EtaleLogNeighborhood X) : U.object ⟶ X :=
  strictPullbackMap U.map
structure LocalFineLogSmoothModel {X S : LogScheme} (f : X ⟶ S) (x : X.scheme) where
  source : EtaleLogNeighborhood X
  base : EtaleLogNeighborhood S
  point : source.scheme
  contains : source.map.base point = x
  localMap : source.object ⟶ base.object
  square : localMap ≫ base.toOriginal = source.toOriginal ≫ f
  model : FineLogSmoothModel localMap
def QCLogSmooth {X S : LogScheme} (f : X ⟶ S) : Prop :=
  HasEtaleCharts X ∧ HasEtaleCharts S ∧ IsIntegralLog X ∧ IsIntegralLog S ∧
    ∀ x : X.scheme, Nonempty (LocalFineLogSmoothModel f x)
namespace QCLogSmooth
 theorem fine_model {X S : LogScheme} (f : X ⟶ S) (h : QCLogSmooth f) (x : X.scheme) :
    Nonempty (LocalFineLogSmoothModel f x) := by sorry
 theorem fine_compatibility {X S : LogScheme} (f : X ⟶ S)
    (hX : IsFineLog X) (hS : IsFineLog S) : QCLogSmooth f ↔ IsLogSmooth f := by sorry
 theorem base_change {X Y S : LogScheme} (f : X ⟶ S) (g : Y ⟶ S)
    (h : QCLogSmooth f) (hY : HasEtaleCharts Y ∧ IsIntegralLog Y) :
    QCLogSmooth (logFiberProductSnd f g) := by sorry
end QCLogSmooth
-- Test: TauCeti.LogCrystalline.QCLogSmooth.identity
example (X : QCLogScheme) : QCLogSmooth (𝟙 X.object) := by sorry
-- Test: TauCeti.LogCrystalline.QCLogSmooth.valuation_base_change
example (k : Type) [Field k] (r : ℕ) (hr : 0 < r)
    (g : affineLogScheme (zeroRationalChart k) ⟶ standardLogPoint k) :
    QCLogSmooth (logFiberProductSnd (semistableLogMap k r) g) := by sorry
def rationalDualNumberProjection (k : Type) [Field k] :
    (strictPullback (X := affineLogScheme (zeroRationalChart k))
      (Spec.map (CommRingCat.ofHom (algebraMap k (DualNumber k))))) ⟶
        affineLogScheme (zeroRationalChart k) :=
  strictPullbackMap (Spec.map (CommRingCat.ofHom (algebraMap k (DualNumber k))))
-- Test: TauCeti.LogCrystalline.QCLogSmooth.infinite_chart_warning
example (k : Type) [Field k] : ¬ QCLogSmooth (rationalDualNumberProjection k) := by sorry

structure CommonFineModel {X Y S : LogScheme} (g : X ⟶ S) (h : Y ⟶ S)
    (f : X ⟶ Y) where
  source : FineLogSmoothModel g
  target : FineLogSmoothModel h
  sameBase : source.fineBase = target.fineBase
  modelMap : source.fineSource ⟶ target.fineSource
  overBase : modelMap ≫ target.modelMap = source.modelMap ≫ eqToHom sameBase
  pullbackMap : logFiberProduct source.modelMap source.baseMap ⟶
    logFiberProduct target.modelMap target.baseMap
  recovers : source.sourceIso.hom ≫ pullbackMap = f ≫ target.sourceIso.hom
structure CommonFineNeighborhood {X Y S : LogScheme} (g : X ⟶ S) (h : Y ⟶ S)
    (f : X ⟶ Y) (x : X.scheme) where
  source : EtaleLogNeighborhood X
  target : EtaleLogNeighborhood Y
  base : EtaleLogNeighborhood S
  point : source.scheme
  contains : source.map.base point = x
  localSource : source.object ⟶ base.object
  localTarget : target.object ⟶ base.object
  localMap : source.object ⟶ target.object
  sourceSquare : localSource ≫ base.toOriginal = source.toOriginal ≫ g
  targetSquare : localTarget ≫ base.toOriginal = target.toOriginal ≫ h
  mapSquare : localMap ≫ target.toOriginal = source.toOriginal ≫ f
  localSquare : localMap ≫ localTarget = localSource
  common : CommonFineModel localSource localTarget localMap
theorem fineModel_descent {X Y S : LogScheme} (g : X ⟶ S) (h : Y ⟶ S)
    (f : X ⟶ Y) (hf : f ≫ h = g) (hg : QCLogSmooth g) (hh : QCLogSmooth h) :
    ∀ x : X.scheme, Nonempty (CommonFineNeighborhood g h f x) := by sorry
def IsVertical {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) : Prop :=
  ∀ b : Q, ∃ b' : Q, ∃ a : P, b*b'=f a
namespace IsVertical
 theorem cokernel_group {P Q : Type} [CommMonoid P] [CommMonoid Q] (f : P →* Q) (h : IsVertical f) :
    ∀ b : Q, ∃ b' : Q, ∃ a : P, b*b'=f a := by sorry
 theorem comp {P Q R : Type} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : Q →* R) (hf : IsVertical f) (hg : IsVertical g) : IsVertical (g.comp f) := by sorry
 theorem base_change {P Q R : Type} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : P →* R) (hf : IsVertical f) : IsVertical (monoidPushout f g).right := by sorry
end IsVertical
-- Test: TauCeti.LogCrystalline.IsVertical.diagonal
example (r : ℕ) : IsVertical (diagonalChart r) := by sorry
-- Test: TauCeti.LogCrystalline.IsVertical.identity
example {P : Type} [CommMonoid P] : IsVertical (MonoidHom.id P) := by sorry
-- Test: TauCeti.LogCrystalline.IsVertical.horizontal_boundary
example : ¬ IsVertical (1 : PUnit →* Multiplicative ℕ) := by sorry

def nonzeroMonoid (A : Type) [CommRing A] [IsDomain A] : Submonoid A := by sorry
def valuationLog (A : Type) [CommRing A] [IsDomain A] : LogStructure A := by sorry
namespace valuationLog
 def characteristic {A Γ : Type} [CommRing A] [IsDomain A] [CommMonoid Γ]
    (value : nonzeroMonoid A →* Γ) (hs : Function.Surjective value)
    (hk : ∀ x, value x=1 ↔ IsUnit (x:A)) : characteristicMonoid (valuationLog A) ≃* Γ := by sorry
 def tilt_chart {A B : Type} [CommRing A] [CommRing B] [IsDomain A] [IsDomain B]
    (sharp : nonzeroMonoid B →* A) : LogStructure A := by sorry
 -- Residue-log identification: the actual perfectoid sharp/residue maps are supplied by AI.0.
 def residue_iso {k P Q : Type} [Field k] [CommMonoid P] [CommMonoid Q]
    (α : P →* k) (β : Q →* k) (e : P ≃* Q) (he : ∀ p, β (e p)=α p) :
    (associatedLog α).monoid ≃* (associatedLog β).monoid := by sorry
end valuationLog



-- R06.1/CR.4 client data. It does not re-plan arithmetic fields or Witt bases.
structure ArithmeticFrame where
  p : ℕ
  [prime : Fact p.Prime]
  O : Type
  [ringO : CommRing O]
  [domainO : IsDomain O]
  [dvr : IsDiscreteValuationRing O]
  K : Type
  [normedK : NormedField K]
  [completeK : CompleteSpace K]
  [charZeroK : CharZero K]
  [algebraOK : Algebra O K]
  [fractionOK : IsFractionRing O K]
  nonarchimedean : ∀ x y : K, ‖x + y‖ ≤ max ‖x‖ ‖y‖
  ringOfIntegers : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x
  pSmall : ‖(p : K)‖ < 1
  k : Type
  [fieldk : Field k]
  [charPk : CharP k p]
  [perfectk : PerfectRing k p]
  residue : O →+* k
  residueSurjective : Function.Surjective residue
  residueKernel : RingHom.ker residue = IsLocalRing.maximalIdeal O
  completeO : IsAdicComplete (IsLocalRing.maximalIdeal O) O
  uniformizer : O
  uniformizerIdeal : Ideal.span {uniformizer} = IsLocalRing.maximalIdeal O
  K0 : Type
  [normedK0 : NormedField K0]
  [completeK0 : CompleteSpace K0]
  [charZeroK0 : CharZero K0]
  [algebraWK0 : Algebra (WittVector p k) K0]
  [fractionWK0 : IsFractionRing (WittVector p k) K0]
  integralWittEmbedding : WittVector p k →+* O
  wittResidue : ∀ a, residue (integralWittEmbedding a) = a.coeff 0
  coefficientEmbedding : K0 →+* K
  coefficientIsometric : ∀ a, ‖coefficientEmbedding a‖ = ‖a‖
  coefficientIntegral : ∀ a : WittVector p k,
    coefficientEmbedding (algebraMap (WittVector p k) K0 a) =
      algebraMap O K (integralWittEmbedding a)
  sigma : K0 ≃+* K0
  sigmaIsometric : ∀ a, ‖sigma a‖ = ‖a‖
  sigmaWitt : ∀ a : WittVector p k,
    sigma (algebraMap (WittVector p k) K0 a) =
      algebraMap (WittVector p k) K0 (WittVector.frobenius a)
attribute [instance] ArithmeticFrame.prime ArithmeticFrame.ringO ArithmeticFrame.domainO ArithmeticFrame.dvr ArithmeticFrame.normedK
  ArithmeticFrame.completeK ArithmeticFrame.charZeroK ArithmeticFrame.algebraOK
  ArithmeticFrame.fractionOK ArithmeticFrame.fieldk ArithmeticFrame.charPk
  ArithmeticFrame.perfectk ArithmeticFrame.normedK0 ArithmeticFrame.completeK0 ArithmeticFrame.charZeroK0
  ArithmeticFrame.algebraWK0 ArithmeticFrame.fractionWK0

-- The formal carrier is imported from R2: the p-adic completion of
-- O<x_1,...,x_d>/(x_1...x_r-pi). Only its log construction is planned here.
def formalSemistableRing (F : ArithmeticFrame) (r d : ℕ)
    (hr : 0 < r) (hrd : r ≤ d) : CommRingCat.{0} := by sorry
def formalBaseMap (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    F.O →+* formalSemistableRing F r d hr hrd := by sorry
def formalCoordinates (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    Fin r → formalSemistableRing F r d hr hrd := by sorry
def formalSemistableLog (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    LogStructure (formalSemistableRing F r d hr hrd) :=
  associatedLog (coordinateChart r (formalCoordinates F r d hr hrd))
def semistableReduction (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d)
    (n : ℕ) : LogScheme := by sorry
def semistableReductionMap (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d)
    (n : ℕ) : semistableReduction F r d hr hrd n ⟶
      affineLogScheme (natChart (Ideal.Quotient.mk (Ideal.span {(F.p : F.O)^n}) F.uniformizer)) := by sorry
namespace formalSemistableLog
 theorem chart (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    ∃ c : LogChart (formalSemistableLog F r d hr hrd),
      Nonempty (c.P ≃* Multiplicative (Fin r → ℕ)) ∧
      ∏ i, formalCoordinates F r d hr hrd i = formalBaseMap F r d hr hrd F.uniformizer := by sorry
 def special_fibre (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    (logPullback
      (Ideal.Quotient.mk (Ideal.span {formalBaseMap F r d hr hrd F.uniformizer}))
      (formalSemistableLog F r d hr hrd)).monoid ≃*
    (associatedLog (coordinateChart r
      (fun i => Ideal.Quotient.mk (Ideal.span {formalBaseMap F r d hr hrd F.uniformizer})
        (formalCoordinates F r d hr hrd i)))).monoid := by sorry
 theorem base_change (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d)
    (n : ℕ) (Y : QCLogScheme)
    (g : Y.object ⟶ affineLogScheme
      (natChart (Ideal.Quotient.mk (Ideal.span {(F.p : F.O)^n}) F.uniformizer))) :
    QCLogSmooth (logFiberProductSnd (semistableReductionMap F r d hr hrd n) g) ∧
      ∀ x : LogGeometricPoint
        (logFiberProduct (semistableReductionMap F r d hr hrd n) g),
        IsVertical (logStalkHom (logFiberProductSnd (semistableReductionMap F r d hr hrd n) g) x) := by sorry
end formalSemistableLog
-- Test: TauCeti.LogCrystalline.formalSemistableLog.smooth_case
example (F : ArithmeticFrame) (d : ℕ) (hd : 1 ≤ d) (n : ℕ) (hn : 0 < n) :
    IsStrict (semistableReductionMap F 1 d (by omega) hd n) ∧
      Smooth (logUnderlying (semistableReductionMap F 1 d (by omega) hd n)) := by sorry
def semistableOrigin (F : ArithmeticFrame) :
    formalSemistableRing F 2 2 (by omega) (by omega) →+* F.k := by sorry
-- Test: TauCeti.LogCrystalline.formalSemistableLog.node
example (F : ArithmeticFrame) :
    characteristicMonoid (logPullback
      (semistableOrigin F)
      (formalSemistableLog F 2 2 (by omega) (by omega))) ≃* Multiplicative (Fin 2 → ℕ) := by sorry
-- Test: TauCeti.LogCrystalline.formalSemistableLog.forget_log
example (F : ArithmeticFrame) :
    IsLogSmooth (semistableLogMap F.k 2) ∧
      ¬ Smooth (logUnderlying (semistableLogMap F.k 2)) := by sorry
-- Affine log differential module. Sheafification is omitted; ordinary differentials are reused.
def logDifferentials (R A P Q : Type) [CommRing R] [CommRing A] [Algebra R A]
    [CommMonoid P] [CommMonoid Q] (α : P →* A) (q : Q →* P) : ModuleCat A := by sorry
def logD {R A P Q : Type} [CommRing R] [CommRing A] [Algebra R A] [CommMonoid P] [CommMonoid Q]
    (α : P →* A) (q : Q →* P) : Derivation R A (logDifferentials R A P Q α q) := by sorry
def logDlog {R A P Q : Type} [CommRing R] [CommRing A] [Algebra R A] [CommMonoid P] [CommMonoid Q]
    (α : P →* A) (q : Q →* P) : P →* Multiplicative (logDifferentials R A P Q α q) := by sorry
namespace logDifferentials
 theorem dlog_mul {R A P Q : Type} [CommRing R] [CommRing A] [Algebra R A]
    [CommMonoid P] [CommMonoid Q] (α : P →* A) (q : Q →* P) (p p' : P) :
    (logDlog (R := R) α q (p*p')).toAdd=
      (logDlog (R := R) α q p).toAdd+(logDlog (R := R) α q p').toAdd := by sorry
 theorem d_alpha {R A P Q : Type} [CommRing R] [CommRing A] [Algebra R A]
    [CommMonoid P] [CommMonoid Q] (α : P →* A) (q : Q →* P) (p : P) :
    logD (R := R) α q (α p)=α p • (logDlog (R := R) α q p).toAdd := by sorry
 theorem lift {R A P Q : Type} [CommRing R] [CommRing A] [Algebra R A]
    [CommMonoid P] [CommMonoid Q] (α : P →* A) (q : Q →* P) (M : ModuleCat A)
    (D : Derivation R A M) (δ : P →* Multiplicative M)
    (hc : ∀ p, D (α p)=α p • (δ p).toAdd) (hb : ∀ a, δ (q a)=1) :
    ∃! f : logDifferentials R A P Q α q →ₗ[A] M,
      (∀ a, f (logD (R := R) α q a)=D a) ∧
      (∀ p, f (logDlog (R := R) α q p).toAdd=(δ p).toAdd) := by sorry
end logDifferentials

def unitsStructuralMap {R A : Type} [CommRing R] [CommRing A] [Algebra R A] : Rˣ →* Aˣ := by sorry
-- Test: TauCeti.LogCrystalline.logDifferentials.trivial_log
example {R A : Type} [CommRing R] [CommRing A] [Algebra R A] :
    logDifferentials R A Aˣ Rˣ (Units.coeHom A) unitsStructuralMap ≃ₗ[A] KaehlerDifferential R A := by sorry
-- Test: TauCeti.LogCrystalline.logDifferentials.toric_line
example {k : Type} [Field k] :
    logDifferentials k (Polynomial k) (Multiplicative ℕ) PUnit (natChart Polynomial.X) 1 ≃ₗ[Polynomial k] Polynomial k := by sorry
-- Test: TauCeti.LogCrystalline.logDifferentials.log_point
example {k : Type} [Field k] : logDifferentials k k (Multiplicative ℕ) PUnit (natChart (0:k)) 1 ≃ₗ[k] k := by sorry

def logDeRham (R A P Q : Type) [CommRing R] [CommRing A] [Algebra R A]
    [CommMonoid P] [CommMonoid Q] (α : P →* A) (q : Q →* P) : CochainComplex (ModuleCat R) ℤ := by sorry
def logFormGenerator {R A P Q : Type} [CommRing R] [CommRing A] [Algebra R A]
    [CommMonoid P] [CommMonoid Q] (α : P →* A) (q : Q →* P) :
    P →* Multiplicative ((logDeRham R A P Q α q).X 1) := by sorry
namespace logDeRham
 def degree_zero {R A P Q : Type} [CommRing R] [CommRing A] [Algebra R A]
    [CommMonoid P] [CommMonoid Q] (α : P →* A) (q : Q →* P) :
    (logDeRham R A P Q α q).X 0 ≅ ModuleCat.of R A := by sorry
 theorem dlog_closed {R A P Q : Type} [CommRing R] [CommRing A] [Algebra R A]
    [CommMonoid P] [CommMonoid Q] (α : P →* A) (q : Q →* P) (p : P) :
    ((logDeRham R A P Q α q).d 1 2).hom (logFormGenerator (R := R) α q p).toAdd=0 := by sorry
 def base_change {R A B P Q : Type} [CommRing R] [CommRing A] [CommRing B]
    [Algebra R A] [Algebra R B] [CommMonoid P] [CommMonoid Q]
    (f : A →ₐ[R] B) (α : P →* A) (q : Q →* P) :
    logDeRham R A P Q α q ⟶ logDeRham R B P Q (f.toMonoidHom.comp α) q := by sorry
end logDeRham
def ordinaryDeRhamComplex (R A : Type) [CommRing R] [CommRing A] [Algebra R A] :
    CochainComplex (ModuleCat R) ℤ := by sorry
-- Test: TauCeti.LogCrystalline.logDeRham.trivial_log
example {R A : Type} [CommRing R] [CommRing A] [Algebra R A] :
    logDeRham R A Aˣ Rˣ (Units.coeHom A) unitsStructuralMap ≅ ordinaryDeRhamComplex R A := by sorry

-- Test: TauCeti.LogCrystalline.logDeRham.relative_log_point
example {k : Type} [Field k] (q : ℤ) (hq : 0<q) :
    Limits.IsZero ((logDeRham k k (Multiplicative ℕ) (Multiplicative ℕ) (natChart (0:k)) (MonoidHom.id _)).X q) := by sorry
-- The torus logarithmic differential is t·d/dt, defined on actual Laurent coefficients.
def torusLogDerivative {k : Type} [Field k] (f : LaurentPolynomial k) : LaurentPolynomial k :=
  AddMonoidAlgebra.ofCoeff (f.coeff.sum fun n a => Finsupp.single n ((n:k)*a))
-- Test: TauCeti.LogCrystalline.logDeRham.char_p_torus
example {k : Type} [Field k] (p : ℕ) [CharP k p] (hp : Nat.Prime p) :
    torusLogDerivative (LaurentPolynomial.T (p:ℤ) : LaurentPolynomial k)=0 ∧
    ¬ ∃ f : LaurentPolynomial k, torusLogDerivative f=1 := by sorry

open scoped BigOperators

structure SemistableChartData (A : Type) [CommRing A] (r : ℕ) where
  π : A
  x : Fin r → A
  relation : ∏ i, x i = π

def coordinateVector {A : Type} [CommRing A] {r : ℕ} (i : Fin r) : Fin r → A := Pi.single i 1
def semistableRelativeRelations (A : Type) [CommRing A] (r : ℕ) : Submodule A (Fin r → A) :=
    Submodule.span A {(fun _ => (1:A))}
def semistableAbsoluteRelations {A : Type} [CommRing A] (r : ℕ) (π : A) : Submodule A (Fin r → A) :=
    Submodule.span A {(fun _ => π)}
-- The ordinary remaining coordinate summand and completed module are omitted in this chart slice.
theorem semistableLogForms {A : Type} [CommRing A] (r : ℕ) (hr : 0<r) :
    Nonempty (((Fin r → A) ⧸ semistableRelativeRelations A r) ≃ₗ[A] (Fin (r-1) → A)) := by sorry

def semistableResidue {A : Type} [CommRing A] (r : ℕ) (s : SemistableChartData A r) (i : Fin r) :
    ((Fin r → A) ⧸ semistableAbsoluteRelations r s.π) →ₗ[A] A ⧸ Ideal.span {s.x i} := by sorry
namespace semistableResidue
 theorem coordinate {A : Type} [CommRing A] (r : ℕ) (s : SemistableChartData A r) (i j : Fin r) :
    semistableResidue r s i ((semistableAbsoluteRelations r s.π).mkQ (coordinateVector j))=
      if i=j then 1 else 0 := by sorry
 theorem ordinary {A : Type} [CommRing A] (r : ℕ) (s : SemistableChartData A r) (i : Fin r) :
    semistableResidue r s i ((semistableAbsoluteRelations r s.π).mkQ (s.x i • coordinateVector i))=0 := by sorry
 theorem relative_obstruction {A : Type} [CommRing A] (r : ℕ) (s : SemistableChartData A r) (i : Fin r) :
    semistableResidue r s i ((semistableAbsoluteRelations r s.π).mkQ (fun _ => 1))=1 := by sorry
end semistableResidue
-- Test: TauCeti.LogCrystalline.semistableResidue.node_absolute
example {A : Type} [CommRing A] (s : SemistableChartData A 2) :
    semistableResidue 2 s 0 ((semistableAbsoluteRelations 2 s.π).mkQ (coordinateVector 0))=1 ∧
    semistableResidue 2 s 0 ((semistableAbsoluteRelations 2 s.π).mkQ (coordinateVector 1))=0 := by sorry
-- Test: TauCeti.LogCrystalline.semistableResidue.ordinary_zero
example {A : Type} [CommRing A] (s : SemistableChartData A 2) :
    semistableResidue 2 s 0 ((semistableAbsoluteRelations 2 s.π).mkQ (s.x 0 • coordinateVector 0))=0 := by sorry
-- Test: TauCeti.LogCrystalline.semistableResidue.relative_nonexample
example {k : Type} [Field k] : ¬ ∃ f : ((Fin 2 → k) ⧸ semistableRelativeRelations k 2) →ₗ[k] k,
    f ((semistableRelativeRelations k 2).mkQ (coordinateVector 0))=1 ∧
    f ((semistableRelativeRelations k 2).mkQ (coordinateVector 1))=0 := by sorry

-- Affine PD base view supplied by CR.0. Global bases are treated by etale descent.
-- Keeping this client base affine does not restrict the source log schemes to be fine.
structure LogPDBase where
  ring : CommRingCat.{0}
  ideal : Ideal ring
  gamma : DividedPowers ideal
  p : ℕ
  [prime : Fact p.Prime]
  nilpotentP : ∃ n : ℕ, 0 < n ∧ (p : ring)^n = 0
  log : EtaleLogStructure (Spec ring)
  charts : HasEtaleCharts ⟨Spec ring, log⟩
def LogPDBase.object (B : LogPDBase) : LogScheme := ⟨Spec B.ring, B.log⟩
def pdBaseRingMap {X : LogScheme} (B : LogPDBase) (f : X ⟶ B.object)
    (U : X.scheme.Etaleᵒᵖ) : B.ring →+* (etaleStructureSheaf X.scheme).obj.obj U := by sorry
def baseIdeal {X : LogScheme} (B : LogPDBase) (f : X ⟶ B.object)
    (U : X.scheme.Etaleᵒᵖ) : Ideal ((etaleStructureSheaf X.scheme).obj.obj U) :=
  Ideal.map (pdBaseRingMap B f U) B.ideal
structure BasePDExtension {X : LogScheme} (B : LogPDBase) (f : X ⟶ B.object) where
  gamma : ∀ U : X.scheme.Etaleᵒᵖ, DividedPowers (baseIdeal B f U)
  extendsBase : ∀ U n a, a ∈ B.ideal →
    pdBaseRingMap B f U (B.gamma.dpow n a) = (gamma U).dpow n (pdBaseRingMap B f U a)
  natural : ∀ {U V : X.scheme.Etaleᵒᵖ} (e : U ⟶ V) n a,
    a ∈ baseIdeal B f U →
    ((etaleStructureSheaf X.scheme).obj.map e).hom ((gamma U).dpow n a) =
      (gamma V).dpow n (((etaleStructureSheaf X.scheme).obj.map e).hom a)
structure LogOverPDBase (B : LogPDBase) where
  object : LogScheme
  structureMap : object ⟶ B.object
  extension : BasePDExtension B structureMap
  charts : HasEtaleCharts object
def closedSectionMap {Z T : LogScheme} (i : Z ⟶ T) (U : T.scheme.Etaleᵒᵖ) :
    (etaleStructureSheaf T.scheme).obj.obj U →+*
      Γ(Limits.pullback U.unop.hom (logUnderlying i), ⊤) := by sorry
def thickeningIdeal {Z T : LogScheme} (i : Z ⟶ T) (U : T.scheme.Etaleᵒᵖ) :
    Ideal ((etaleStructureSheaf T.scheme).obj.obj U) := RingHom.ker (closedSectionMap i U)

structure LogPDThickening (B : LogPDBase) (Z : LogOverPDBase B) where
  ambient : LogOverPDBase B
  closed : Z.object ⟶ ambient.object
  overBase : closed ≫ ambient.structureMap = Z.structureMap
  closedImmersion : IsClosedImmersion (logUnderlying closed)
  logSurjective : ∀ x : LogGeometricPoint Z.object, Function.Surjective (logStalkHom closed x)
  exact : IsExactLog closed
  integral : IsIntegralLog ambient.object
  delta : ∀ U : ambient.object.scheme.Etaleᵒᵖ, DividedPowers (thickeningIdeal closed U)
  common : ∀ U : ambient.object.scheme.Etaleᵒᵖ,
    DividedPowers (thickeningIdeal closed U ⊔ baseIdeal B ambient.structureMap U)
  commonOnJ : ∀ U n a, a ∈ thickeningIdeal closed U →
    (common U).dpow n a = (delta U).dpow n a
  commonOnBase : ∀ U n a, a ∈ baseIdeal B ambient.structureMap U →
    (common U).dpow n a = (ambient.extension.gamma U).dpow n a
  deltaNatural : ∀ {U V : ambient.object.scheme.Etaleᵒᵖ} (e : U ⟶ V) n a,
    a ∈ thickeningIdeal closed U →
    ((etaleStructureSheaf ambient.object.scheme).obj.map e).hom ((delta U).dpow n a) =
      (delta V).dpow n (((etaleStructureSheaf ambient.object.scheme).obj.map e).hom a)
namespace LogPDThickening
 def ideal {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (U : T.ambient.object.scheme.Etaleᵒᵖ) := thickeningIdeal T.closed U
 theorem exact_log {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) :
    IsExactLog T.closed := by sorry
 theorem pd_base {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (U : T.ambient.object.scheme.Etaleᵒᵖ) :
    (∀ n a, a ∈ T.ideal U → (T.common U).dpow n a = (T.delta U).dpow n a) ∧
    (∀ n a, a ∈ B.ideal →
      (T.common U).dpow n (pdBaseRingMap B T.ambient.structureMap U a) =
        pdBaseRingMap B T.ambient.structureMap U (B.gamma.dpow n a)) := by sorry
end LogPDThickening

-- PD maps use the actual stalk PD structures induced from their sheaf data.
def thickeningStalkIdeal {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (x : LogGeometricPoint T.ambient.object) :
    Ideal (logStalkRing x) := by sorry
def thickeningStalkPD {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (x : LogGeometricPoint T.ambient.object) :
    DividedPowers (thickeningStalkIdeal T x) := by sorry
def geometricStalkRingMap {X Y : LogScheme} (f : X ⟶ Y) (x : LogGeometricPoint X) :
    logStalkRing (mappedGeometricPoint f x) →+* logStalkRing x := by sorry
structure PDThickeningHom {B : LogPDBase} {Z Z' : LogOverPDBase B}
    (T : LogPDThickening B Z) (T' : LogPDThickening B Z') where
  source : Z.object ⟶ Z'.object
  ambient : T.ambient.object ⟶ T'.ambient.object
  square : T.closed ≫ ambient = source ≫ T'.closed
  overBase : ambient ≫ T'.ambient.structureMap = T.ambient.structureMap
  preservesPD : ∀ (x : LogGeometricPoint T.ambient.object) n a,
    a ∈ thickeningStalkIdeal T' (mappedGeometricPoint ambient x) →
    geometricStalkRingMap ambient x
        ((thickeningStalkPD T' (mappedGeometricPoint ambient x)).dpow n a) =
      (thickeningStalkPD T x).dpow n (geometricStalkRingMap ambient x a)

structure EnvelopeInput (B : LogPDBase) where
  source : LogOverPDBase B
  target : LogOverPDBase B
  immersion : source.object ⟶ target.object
  closed : IsClosedImmersion (logUnderlying immersion)
  overBase : immersion ≫ target.structureMap = source.structureMap
  integralSource : IsIntegralLog source.object
  logSurjective : ∀ x : LogGeometricPoint source.object, Function.Surjective (logStalkHom immersion x)
structure EnvelopeCandidate {B : LogPDBase} (E : EnvelopeInput B) where
  thickening : LogPDThickening B E.source
  ambientMap : thickening.ambient.object ⟶ E.target.object
  factor : thickening.closed ≫ ambientMap = E.immersion
  overBase : ambientMap ≫ E.target.structureMap = thickening.ambient.structureMap
def qcLogPDEnvelope {B : LogPDBase} (E : EnvelopeInput B) : EnvelopeCandidate E := by sorry
def logPDEnvelope {B : LogPDBase} (E : EnvelopeInput B)
    (hZ : IsFineLog E.source.object) (hY : IsFineLog E.target.object) : EnvelopeCandidate E := by sorry
namespace logPDEnvelope
 theorem factor {B : LogPDBase} (E : EnvelopeInput B)
    (hZ : IsFineLog E.source.object) (hY : IsFineLog E.target.object) :
    (logPDEnvelope E hZ hY).thickening.closed ≫ (logPDEnvelope E hZ hY).ambientMap = E.immersion ∧
      IsExactLog (logPDEnvelope E hZ hY).thickening.closed := by sorry
 theorem lift {B : LogPDBase} (E : EnvelopeInput B)
    (hZ : IsFineLog E.source.object) (hY : IsFineLog E.target.object) (T : EnvelopeCandidate E) :
    ∃! a : PDThickeningHom T.thickening (logPDEnvelope E hZ hY).thickening,
      a.source = 𝟙 E.source.object ∧ a.ambient ≫ (logPDEnvelope E hZ hY).ambientMap = T.ambientMap := by sorry
 theorem exact_case {B : LogPDBase} (E : EnvelopeInput B)
    (hZ : IsFineLog E.source.object) (hY : IsFineLog E.target.object)
    (he : IsExactLog E.immersion) : IsStrict (logPDEnvelope E hZ hY).ambientMap := by sorry
end logPDEnvelope
namespace qcLogPDEnvelope
 theorem exact_source {B : LogPDBase} (E : EnvelopeInput B) :
    IsExactLog (qcLogPDEnvelope E).thickening.closed := by sorry
 theorem lift {B : LogPDBase} (E : EnvelopeInput B) (T : EnvelopeCandidate E) :
    ∃! a : PDThickeningHom T.thickening (qcLogPDEnvelope E).thickening,
      a.source = 𝟙 E.source.object ∧ a.ambient ≫ (qcLogPDEnvelope E).ambientMap = T.ambientMap := by sorry
 def fine_case {B : LogPDBase} (E : EnvelopeInput B)
    (hZ : IsFineLog E.source.object) (hY : IsFineLog E.target.object) :
    (qcLogPDEnvelope E).thickening.ambient.object ≅
      (logPDEnvelope E hZ hY).thickening.ambient.object := by sorry
end qcLogPDEnvelope
def identityEnvelopeInput {B : LogPDBase} (Z : LogOverPDBase B)
    (hZ : IsIntegralLog Z.object) : EnvelopeInput B where
  source := Z
  target := Z
  immersion := 𝟙 Z.object
  closed := by sorry
  overBase := by sorry
  integralSource := hZ
  logSurjective := by sorry
def modpPDBase (p : ℕ) [Fact p.Prime] : LogPDBase where
  ring := CommRingCat.of (ZMod p)
  ideal := ⊥
  gamma := by sorry
  p := p
  prime := inferInstance
  nilpotentP := by sorry
  log := (trivialLogScheme (Spec (CommRingCat.of (ZMod p)))).log
  charts := by sorry
def logLineOverModp (p : ℕ) [Fact p.Prime] : LogOverPDBase (modpPDBase p) where
  object := affineLogScheme (natChart (Polynomial.X : Polynomial (ZMod p)))
  structureMap := by sorry
  extension := by sorry
  charts := by sorry
def rationalLogPointOverModp (p : ℕ) [Fact p.Prime] : LogOverPDBase (modpPDBase p) where
  object := affineLogScheme (zeroRationalChart (ZMod p))
  structureMap := by sorry
  extension := by sorry
  charts := by sorry
def logLineProductOverModp (p : ℕ) [Fact p.Prime] : LogOverPDBase (modpPDBase p) where
  object := logFiberProduct (logLineOverModp p).structureMap (logLineOverModp p).structureMap
  structureMap := logFiberProductSnd _ _ ≫ (logLineOverModp p).structureMap
  extension := by sorry
  charts := by sorry
def logLineDiagonal (p : ℕ) [Fact p.Prime] :
    (logLineOverModp p).object ⟶ (logLineProductOverModp p).object := by sorry
def logLineDiagonalInput (p : ℕ) [Fact p.Prime] : EnvelopeInput (modpPDBase p) where
  source := logLineOverModp p
  target := logLineProductOverModp p
  immersion := logLineDiagonal p
  closed := by sorry
  overBase := by sorry
  integralSource := by sorry
  logSurjective := by sorry
def diagonalEnvelopeRatio (p : ℕ) [Fact p.Prime] :
    Γ((qcLogPDEnvelope (logLineDiagonalInput p)).thickening.ambient.object.scheme, ⊤)ˣ := by sorry
-- Test: TauCeti.LogCrystalline.logPDEnvelope.identity
example {B : LogPDBase} (Z : LogOverPDBase B) (hZ : IsFineLog Z.object) (hi : IsIntegralLog Z.object) :
    (logPDEnvelope (identityEnvelopeInput Z hi) (by sorry) (by sorry)).thickening.ambient.object ≅ Z.object := by sorry
-- Test: TauCeti.LogCrystalline.logPDEnvelope.log_diagonal
example (p : ℕ) [Fact p.Prime] :
    IsExactLog (qcLogPDEnvelope (logLineDiagonalInput p)).thickening.closed ∧
    (diagonalEnvelopeRatio p : Γ((qcLogPDEnvelope (logLineDiagonalInput p)).thickening.ambient.object.scheme, ⊤)) - 1 ∈
      RingHom.ker ((qcLogPDEnvelope (logLineDiagonalInput p)).thickening.closed |>
        logUnderlying |>.appTop |>.hom) := by sorry
-- Test: TauCeti.LogCrystalline.logPDEnvelope.ordinary_wrong
example : ¬ IsExact sumChart := by sorry
-- Test: TauCeti.LogCrystalline.qcLogPDEnvelope.fine_diagonal
example (p : ℕ) [Fact p.Prime] :
    (qcLogPDEnvelope (logLineDiagonalInput p)).thickening.ambient.object ≅
      (logPDEnvelope (logLineDiagonalInput p) (by sorry) (by sorry)).thickening.ambient.object := by sorry
-- Test: TauCeti.LogCrystalline.qcLogPDEnvelope.identity
example {B : LogPDBase} (Z : LogOverPDBase B) (hi : IsIntegralLog Z.object) :
    (qcLogPDEnvelope (identityEnvelopeInput Z hi)).thickening.ambient.object ≅ Z.object := by sorry
-- Test: TauCeti.LogCrystalline.qcLogPDEnvelope.uncompleted_scope
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((qcLogPDEnvelope
      (identityEnvelopeInput (rationalLogPointOverModp p) (by sorry))).thickening.ambient.object ≅
        (rationalLogPointOverModp p).object) ∧
    ¬ IsFineLog (rationalLogPointOverModp p).object := by sorry
-- Test: TauCeti.LogCrystalline.LogPDThickening.zero_ideal
example {B : LogPDBase} (Z : LogOverPDBase B) (hi : IsIntegralLog Z.object) :
    ∃ T : LogPDThickening B Z, T.ambient.object = Z.object ∧
      ∀ U, T.ideal U = ⊥ := by sorry
def modpPointSource (p : ℕ) [Fact p.Prime] : LogOverPDBase (modpPDBase p) := by sorry
def dualNumberPDThickening (p : ℕ) [Fact p.Prime] :
    LogPDThickening (modpPDBase p) (modpPointSource p) := by sorry
def dualNumberAmbientIso (p : ℕ) [Fact p.Prime] :
    (dualNumberPDThickening p).ambient.object.scheme ≅ Spec (CommRingCat.of (DualNumber (ZMod p))) := by sorry
-- Test: TauCeti.LogCrystalline.LogPDThickening.nonexact_rejected
example {B : LogPDBase} (Z : LogOverPDBase B) {Y : LogOverPDBase B}
    (i : Z.object ⟶ Y.object) (hi : ¬ IsExactLog i) :
    ¬ ∃ T : LogPDThickening B Z, ∃ e : T.ambient.object ≅ Y.object, T.closed ≫ e.hom = i := by sorry

def IsPDSmooth {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) : Prop :=
  ∀ (Z' : LogOverPDBase B) (T' : LogPDThickening B Z')
    (a : Z'.object ⟶ Z.object),
    IsAffine Z'.object.scheme → a ≫ Z.structureMap = Z'.structureMap →
      ∃ l : PDThickeningHom T' T, l.source = a
-- Product of ordinary and logarithmic affine lines over B, indexed by the two
-- coordinate sets; the actual closed immersion is retained.
def logCoordinateSpace (B : LogPDBase) (I J : Type) : LogOverPDBase B := by sorry
structure CoordinateEmbedding {B : LogPDBase} (Z : LogOverPDBase B) where
  ordinary : Type
  logarithmic : Type
  embedding : Z.object ⟶ (logCoordinateSpace B ordinary logarithmic).object
  closed : IsClosedImmersion (logUnderlying embedding)
  logSurjective : ∀ x : LogGeometricPoint Z.object, Function.Surjective (logStalkHom embedding x)
  overBase : embedding ≫ (logCoordinateSpace B ordinary logarithmic).structureMap = Z.structureMap
def coordinateEnvelopeInput {B : LogPDBase} {Z : LogOverPDBase B}
    (e : CoordinateEmbedding Z) (hi : IsIntegralLog Z.object) : EnvelopeInput B where
  source := Z
  target := logCoordinateSpace B e.ordinary e.logarithmic
  immersion := e.embedding
  closed := e.closed
  overBase := e.overBase
  integralSource := hi
  logSurjective := e.logSurjective
def coordinatePDEnvelope {B : LogPDBase} {Z : LogOverPDBase B}
    (e : CoordinateEmbedding Z) (hi : IsIntegralLog Z.object) : LogPDThickening B Z :=
  (qcLogPDEnvelope (coordinateEnvelopeInput e hi)).thickening
namespace IsPDSmooth
 theorem affine_lift {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (h : IsPDSmooth T) (Z' : LogOverPDBase B) (T' : LogPDThickening B Z')
    (a : Z'.object ⟶ Z.object) (ha : IsAffine Z'.object.scheme)
    (hs : a ≫ Z.structureMap = Z'.structureMap) :
    ∃ l : PDThickeningHom T' T, l.source = a := by sorry
 theorem coordinate {B : LogPDBase} {Z : LogOverPDBase B}
    (e : CoordinateEmbedding Z) (hi : IsIntegralLog Z.object) :
    IsPDSmooth (coordinatePDEnvelope e hi) := by sorry
 theorem retract {B : LogPDBase} {Z : LogOverPDBase B}
    (T P : LogPDThickening B Z) (a : PDThickeningHom T P) (b : PDThickeningHom P T)
    (ha : a.source = 𝟙 _) (hb : b.source = 𝟙 _) (hab : a.ambient ≫ b.ambient = 𝟙 _)
    (hP : IsPDSmooth P) : IsPDSmooth T := by sorry
end IsPDSmooth
def pdBaseSource (B : LogPDBase) : LogOverPDBase B where
  object := B.object
  structureMap := 𝟙 _
  extension := by sorry
  charts := B.charts
def baseIdentityPDThickening (B : LogPDBase) (hi : IsIntegralLog B.object) :
    LogPDThickening B (pdBaseSource B) := by sorry
-- Test: TauCeti.LogCrystalline.IsPDSmooth.base_object
example (B : LogPDBase) (hi : IsIntegralLog B.object) :
    IsPDSmooth (baseIdentityPDThickening B hi) := by sorry
-- Test: TauCeti.LogCrystalline.IsPDSmooth.coordinate_envelope
example {B : LogPDBase} {Z : LogOverPDBase B}
    (e : CoordinateEmbedding Z) (hi : IsIntegralLog Z.object) :
    IsPDSmooth (coordinatePDEnvelope e hi) := by sorry
-- Test: TauCeti.LogCrystalline.IsPDSmooth.locality_caveat
-- Source §1.4 leaves etale locality open: this tests global affine lifting,
-- not a theorem inferring it from a cover.
example {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (h : IsPDSmooth T) (e : CoordinateEmbedding Z) (hi : IsIntegralLog Z.object)
    (hz : IsAffine Z.object.scheme) :
    ∃ a : PDThickeningHom (coordinatePDEnvelope e hi) T, a.source = 𝟙 _ := by sorry

structure LogCrysObject (B : LogPDBase) (Z : LogOverPDBase B) where
  source : LogOverPDBase B
  etaleMap : source.object ⟶ Z.object
  etale : Etale (logUnderlying etaleMap)
  strict : IsStrict etaleMap
  overBase : etaleMap ≫ Z.structureMap = source.structureMap
  thickening : LogPDThickening B source
structure LogCrysHom {B : LogPDBase} {Z : LogOverPDBase B} (T T' : LogCrysObject B Z) where
  map : PDThickeningHom T.thickening T'.thickening
  overSource : map.source ≫ T'.etaleMap = T.etaleMap
instance {B : LogPDBase} {Z : LogOverPDBase B} : Category (LogCrysObject B Z) where
  Hom := LogCrysHom
  id := by sorry
  comp := by sorry
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
def crystallineCover {B : LogPDBase} {Z : LogOverPDBase B} (T : LogCrysObject B Z)
    (I : Type) (U : I → LogCrysObject B Z) (e : ∀ i, U i ⟶ T) : Prop :=
  (∀ i, Etale (logUnderlying (e i).map.ambient) ∧ IsStrict (e i).map.ambient ∧
    IsIso (Limits.pullback.lift (f := logUnderlying T.thickening.closed)
      (g := logUnderlying (e i).map.ambient) (logUnderlying (e i).map.source)
      (logUnderlying (U i).thickening.closed) (by sorry))) ∧
    ∀ x : T.thickening.ambient.object.scheme, ∃ i,
      ∃ u : (U i).thickening.ambient.object.scheme, (logUnderlying (e i).map.ambient).base u = x
def logCrystallineSite (B : LogPDBase) (Z : LogOverPDBase B) :
    GrothendieckTopology (LogCrysObject B Z) := by sorry
def logCrystallineStructure (B : LogPDBase) (Z : LogOverPDBase B) :
    Sheaf (logCrystallineSite B Z) CommRingCat.{0} := by sorry
-- Ordinary site is a CR.1 supplier, parametrized by the same PD base and scheme.
def ordinaryCrystallineObjects (B : LogPDBase) (Z : LogOverPDBase B) : Type 1 := by sorry
instance (B : LogPDBase) (Z : LogOverPDBase B) : Category (ordinaryCrystallineObjects B Z) := by sorry
def forgetLogCrystalline (B : LogPDBase) (Z : LogOverPDBase B) :
    LogCrysObject B Z ⥤ ordinaryCrystallineObjects B Z := by sorry
namespace logCrystallineSite
 def structure_sections {B : LogPDBase} {Z : LogOverPDBase B} (T : LogCrysObject B Z) :
    (logCrystallineStructure B Z).obj.obj (Opposite.op T) ≅
      Γ(T.thickening.ambient.object.scheme, ⊤) := by sorry
 def pullback {B : LogPDBase} (Z Z' : LogOverPDBase B)
    (f : Z'.object ⟶ Z.object) (hs : f ≫ Z.structureMap = Z'.structureMap) :
    Sheaf (logCrystallineSite B Z) CommRingCat.{0} ⥤
      Sheaf (logCrystallineSite B Z') CommRingCat.{0} := by sorry
 theorem trivial_log (B : LogPDBase) (Z : LogOverPDBase B)
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme)) :
    (forgetLogCrystalline B Z).IsEquivalence := by sorry
end logCrystallineSite
-- Test: TauCeti.LogCrystalline.logCrystallineSite.identity_object
example {B : LogPDBase} (Z : LogOverPDBase B) (hi : IsIntegralLog Z.object) (ha : IsAffine Z.object.scheme) :
    ∃ T : LogCrysObject B Z, T.source.object = Z.object ∧
      T.thickening.ambient.object = Z.object := by sorry
-- Test: TauCeti.LogCrystalline.logCrystallineSite.log_diagonal_envelope
example (p : ℕ) [Fact p.Prime] :
    ∃ T : LogCrysObject _ (logLineDiagonalInput p).source,
      T.thickening.ambient.object = (qcLogPDEnvelope (logLineDiagonalInput p)).thickening.ambient.object := by sorry
-- Test: TauCeti.LogCrystalline.logCrystallineSite.nonexact_excluded
example {B : LogPDBase} (Z : LogOverPDBase B) {Y : LogOverPDBase B}
    (i : Z.object ⟶ Y.object) (hi : ¬ IsExactLog i) :
    ¬ ∃ T : LogCrysObject B Z, ∃ e : T.thickening.ambient.object ≅ Y.object,
      ∃ eZ : Z.object ≅ T.source.object, eZ.hom ≫ T.thickening.closed ≫ e.hom = i := by sorry

-- Ringed small-etale module operations are clients of EDS:E1. Pullback is
-- the existing Mathlib left adjoint; tensor is sheafification of the tensor
-- presheaf. Neither operation is tensor extension of GLOBAL sections.
def etaleStructureRingSheaf (X : Scheme.{0}) :
    Sheaf (Scheme.smallEtaleTopology X) RingCat.{0} :=
  ⟨(etaleStructureSheaf X).obj ⋙ forget₂ CommRingCat RingCat, by sorry⟩
@[reducible] instance etaleSectionCommRing (X : Scheme.{0}) (U : X.Etaleᵒᵖ) :
    CommRing ((etaleStructureRingSheaf X).obj.obj U) := by
  change CommRing ((etaleStructureSheaf X).obj.obj U)
  infer_instance
abbrev EtaleModules (X : Scheme.{0}) := SheafOfModules.{0} (etaleStructureRingSheaf X)
instance (priority := 90) etaleSectionModule (X : Scheme.{0}) (M : EtaleModules X) (U : X.Etaleᵒᵖ) :
    Module ((etaleStructureRingSheaf X).obj.obj U) (M.val.obj U) :=
  ModuleCat.isModule (M.val.obj U)
def etaleBaseChange {X Y : Scheme.{0}} (f : X ⟶ Y) : Y.Etale ⥤ X.Etale := by sorry
-- The object is U x_Y X, with its actual second projection to X.
def etaleBaseChange_obj {X Y : Scheme.{0}} (f : X ⟶ Y) (U : Y.Etale) :
    ((etaleBaseChange f).obj U).left ≅ Limits.pullback U.hom f := by sorry
instance etaleBaseChange_continuous {X Y : Scheme.{0}} (f : X ⟶ Y) :
    (etaleBaseChange f).IsContinuous (Scheme.smallEtaleTopology Y)
      (Scheme.smallEtaleTopology X) := by sorry
def etaleBaseChangeRingMap {X Y : Scheme.{0}} (f : X ⟶ Y) :
    etaleStructureRingSheaf Y ⟶
      ((etaleBaseChange f).sheafPushforwardContinuous RingCat
        (Scheme.smallEtaleTopology Y) (Scheme.smallEtaleTopology X)).obj
          (etaleStructureRingSheaf X) := by sorry
instance etaleModulePushforward_rightAdjoint {X Y : Scheme.{0}} (f : X ⟶ Y) :
    (SheafOfModules.pushforward.{0} (etaleBaseChangeRingMap f)).IsRightAdjoint := by sorry
def etaleModulePullback {X Y : Scheme.{0}} (f : X ⟶ Y) : EtaleModules Y ⥤ EtaleModules X :=
  SheafOfModules.pullback (etaleBaseChangeRingMap f)
def etaleModulePullback_id (X : Scheme.{0}) : etaleModulePullback (𝟙 X) ≅ 𝟭 _ := by sorry
def etaleModulePullback_comp {X Y Z : Scheme.{0}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    etaleModulePullback g ⋙ etaleModulePullback f ≅ etaleModulePullback (f ≫ g) := by sorry
instance etaleWeakSheafify (X : Scheme.{0}) :
    HasWeakSheafify (Scheme.smallEtaleTopology X) AddCommGrpCat.{0} := by sorry
instance etaleLocallyBijective (X : Scheme.{0}) :
    (Scheme.smallEtaleTopology X).WEqualsLocallyBijective AddCommGrpCat.{0} := by sorry
def etaleSectionsTensor {X : Scheme.{0}} (M N : EtaleModules X) (U : X.Etaleᵒᵖ) :
    ModuleCat.{0} ((etaleStructureRingSheaf X).obj.obj U) :=
  ModuleCat.of ((etaleStructureRingSheaf X).obj.obj U)
    (M.val.obj U ⊗[(etaleStructureRingSheaf X).obj.obj U] N.val.obj U)
def etaleTensorPresheaf {X : Scheme.{0}} (M N : EtaleModules X) :
    PresheafOfModules.{0} (etaleStructureRingSheaf X).obj := by sorry
def etaleTensorPresheaf_sections {X : Scheme.{0}} (M N : EtaleModules X) (U : X.Etaleᵒᵖ) :
    (etaleTensorPresheaf M N).obj U ≅
      ModuleCat.of ((etaleStructureRingSheaf X).obj.obj U)
        (M.val.obj U ⊗[(etaleStructureRingSheaf X).obj.obj U] N.val.obj U) := by sorry
def etaleModuleTensor {X : Scheme.{0}} (M N : EtaleModules X) : EtaleModules X :=
  (PresheafOfModules.sheafification (𝟙 (etaleStructureRingSheaf X).obj)).obj
    (etaleTensorPresheaf M N)
def etaleTensorSection {X : Scheme.{0}} (M N : EtaleModules X) (U : X.Etaleᵒᵖ)
    (m : M.val.obj U) (n : N.val.obj U) : (etaleModuleTensor M N).val.obj U := by sorry
def etaleTensorMap {X : Scheme.{0}} {M M' N N' : EtaleModules X}
    (f : M ⟶ M') (g : N ⟶ N') : etaleModuleTensor M N ⟶ etaleModuleTensor M' N' := by sorry
def etaleFree (X : Scheme.{0}) (n : ℕ) : EtaleModules X := by sorry
def etaleFree_sections (X : Scheme.{0}) (n : ℕ) (U : X.Etaleᵒᵖ) :
    (etaleFree X n).val.obj U ≅ ModuleCat.of ((etaleStructureRingSheaf X).obj.obj U)
      (Fin n → (etaleStructureRingSheaf X).obj.obj U) := by sorry
def EtaleFiniteLocallyFree {X : Scheme.{0}} (M : EtaleModules X) : Prop :=
  ∀ x : X, ∃ U : X.Etale, ∃ u : U.left, U.hom.base u = x ∧
    ∃ n : ℕ, Nonempty ((etaleModulePullback U.hom).obj M ≅ etaleFree U.left n)
def relativeLogFormSheaf {X Y : LogScheme} (f : X ⟶ Y) (q : ℕ) : EtaleModules X.scheme := by sorry
def etaleModuleDual {X : Scheme.{0}} (M : EtaleModules X) : EtaleModules X := by sorry
-- Internal O-linear Hom(M,O), not the dual of Gamma(X,M).
-- Concrete nonaffine test geometry, using the native projective scheme.
def projectiveLine (k : Type) [Field k] : Scheme.{0} := by
  letI := MvPolynomial.gradedAlgebra (σ := Fin 2) (R := k)
  exact AlgebraicGeometry.Proj (MvPolynomial.homogeneousSubmodule (Fin 2) k)
def etaleIdentity (X : Scheme.{0}) : X.Etale :=
  MorphismProperty.Over.mk _ (𝟙 X) (by infer_instance)
def projectiveLineTwist (k : Type) [Field k] (n : ℤ) : EtaleModules (projectiveLine k) := by sorry
-- Glue free rank-one sheaves on D_+(X_0), D_+(X_1), with transition
-- (X_1/X_0)^n; thus this is O(n), not an arbitrary line bundle.
-- The ambient evaluation restricts the crystalline sheaf along all etale
-- pullbacks of this thickening. Descent identifies its value on U with the
-- original presheaf value on the PD thickening restricted to U.
def crystallineEtaleFunctor {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogCrysObject B Z) : T.thickening.ambient.object.scheme.Etale ⥤ LogCrysObject B Z := by sorry
def crystallineEtaleFunctor_ambient {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogCrysObject B Z) (U : T.thickening.ambient.object.scheme.Etale) :
    ((crystallineEtaleFunctor T).obj U).thickening.ambient.object.scheme ≅ U.left := by sorry
def crystallineEtaleSectionRingEquiv {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogCrysObject B Z) (U : T.thickening.ambient.object.scheme.Etale) :
    ((logCrystallineStructure B Z).obj.obj (Opposite.op ((crystallineEtaleFunctor T).obj U))) ≃+*
      ((etaleStructureRingSheaf T.thickening.ambient.object.scheme).obj.obj (Opposite.op U)) := by sorry
def crystalAmbientEvaluation {B : LogPDBase} {Z : LogOverPDBase B}
    (P : PresheafOfModulesOfCommRing.{0} (logCrystallineStructure B Z).obj)
    (hs : Presheaf.IsSheaf (logCrystallineSite B Z) P.presheaf) (T : LogCrysObject B Z) :
    EtaleModules T.thickening.ambient.object.scheme := by sorry
-- Explicit comparison on EVERY etale U, with the section-ring identification
-- supplied by crystallineEtaleFunctor_ambient and structure_sections.
def crystalAmbientEvaluation_sections {B : LogPDBase} {Z : LogOverPDBase B}
    (P : PresheafOfModulesOfCommRing.{0} (logCrystallineStructure B Z).obj)
    (hs : Presheaf.IsSheaf (logCrystallineSite B Z) P.presheaf) (T : LogCrysObject B Z)
    (U : T.thickening.ambient.object.scheme.Etale) :
    (crystalAmbientEvaluation P hs T).val.obj (Opposite.op U) ≅
      (ModuleCat.restrictScalars (crystallineEtaleSectionRingEquiv T U).symm.toRingHom).obj
        (P.obj (Opposite.op ((crystallineEtaleFunctor T).obj U))) := by sorry
def crystalEvaluationRestriction {B : LogPDBase} {Z : LogOverPDBase B}
    (P : PresheafOfModulesOfCommRing.{0} (logCrystallineStructure B Z).obj)
    (hs : Presheaf.IsSheaf (logCrystallineSite B Z) P.presheaf)
    {T T' : LogCrysObject B Z} (g : T' ⟶ T) :
    crystalAmbientEvaluation P hs T ⟶
      (SheafOfModules.pushforward (etaleBaseChangeRingMap (logUnderlying g.map.ambient))).obj
        (crystalAmbientEvaluation P hs T') := by sorry
-- Induced by P's restriction maps on the restricted PD thickenings, not a chosen map.
def crystalTransition {B : LogPDBase} {Z : LogOverPDBase B}
    (P : PresheafOfModulesOfCommRing.{0} (logCrystallineStructure B Z).obj)
    (hs : Presheaf.IsSheaf (logCrystallineSite B Z) P.presheaf)
    {T T' : LogCrysObject B Z} (g : T' ⟶ T) :
    (etaleModulePullback (logUnderlying g.map.ambient)).obj (crystalAmbientEvaluation P hs T) ⟶
      crystalAmbientEvaluation P hs T' :=
  ((SheafOfModules.pullbackPushforwardAdjunction
    (etaleBaseChangeRingMap (logUnderlying g.map.ambient))).homEquiv _ _).symm
      (crystalEvaluationRestriction P hs g)
-- The map is adjoint to restriction along g, on the ambient ringed sites.
structure LogCrystal (B : LogPDBase) (Z : LogOverPDBase B) where
  modules : PresheafOfModulesOfCommRing.{0} (logCrystallineStructure B Z).obj
  sheaf : Presheaf.IsSheaf (logCrystallineSite B Z) modules.presheaf
  cartesian : ∀ {T T' : LogCrysObject B Z} (g : T' ⟶ T),
    IsIso (crystalTransition modules sheaf g)
instance {B : LogPDBase} {Z : LogOverPDBase B} : Category (LogCrystal B Z) where
  Hom F G := F.modules ⟶ G.modules
  id F := 𝟙 F.modules
  comp f g := f ≫ g
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
instance {B : LogPDBase} {Z : LogOverPDBase B} : Preadditive (LogCrystal B Z) := by sorry
def structureCrystal (B : LogPDBase) (Z : LogOverPDBase B) : LogCrystal B Z := by sorry
def zeroCrystal (B : LogPDBase) (Z : LogOverPDBase B) : LogCrystal B Z := by sorry
namespace LogCrystal
 def evaluation {B : LogPDBase} {Z : LogOverPDBase B} (F : LogCrystal B Z)
    (T : LogCrysObject B Z) : EtaleModules T.thickening.ambient.object.scheme :=
    crystalAmbientEvaluation F.modules F.sheaf T
 def transition {B : LogPDBase} {Z : LogOverPDBase B} (F : LogCrystal B Z)
    {T T' : LogCrysObject B Z} (g : T' ⟶ T) :
    (etaleModulePullback (logUnderlying g.map.ambient)).obj (F.evaluation T) ≅
      F.evaluation T' := by sorry
 def tensor {B : LogPDBase} {Z : LogOverPDBase B} (F G : LogCrystal B Z) : LogCrystal B Z := by sorry
 def tensor_evaluation {B : LogPDBase} {Z : LogOverPDBase B} (F G : LogCrystal B Z)
    (T : LogCrysObject B Z) : (tensor F G).evaluation T ≅ etaleModuleTensor (F.evaluation T) (G.evaluation T) := by sorry
 def dual {B : LogPDBase} {Z : LogOverPDBase B} (F : LogCrystal B Z)
    (hf : ∀ T, EtaleFiniteLocallyFree (F.evaluation T)) : LogCrystal B Z := by sorry
 def dual_evaluation {B : LogPDBase} {Z : LogOverPDBase B} (F : LogCrystal B Z)
    (hf : ∀ T, EtaleFiniteLocallyFree (F.evaluation T)) (T : LogCrysObject B Z) :
    (dual F hf).evaluation T ≅ etaleModuleDual (F.evaluation T) := by sorry
end LogCrystal
-- Test: TauCeti.LogCrystalline.LogCrystal.structure_sheaf
example (B : LogPDBase) (Z : LogOverPDBase B) (T : LogCrysObject B Z) :
    (structureCrystal B Z).evaluation T ≅ etaleFree T.thickening.ambient.object.scheme 1 := by sorry
-- Test: TauCeti.LogCrystalline.LogCrystal.zero
example (B : LogPDBase) (Z : LogOverPDBase B) (T : LogCrysObject B Z) :
    Limits.IsZero ((zeroCrystal B Z).evaluation T) := by sorry
-- Test: TauCeti.LogCrystalline.LogCrystal.arbitrary_sheaf
example {B : LogPDBase} {Z : LogOverPDBase B}
    (P : PresheafOfModulesOfCommRing.{0} (logCrystallineStructure B Z).obj)
    (hs : Presheaf.IsSheaf (logCrystallineSite B Z) P.presheaf)
    {T T' : LogCrysObject B Z} (g : T' ⟶ T) (h : ¬ IsIso (crystalTransition P hs g)) :
    ¬ ∃ F : LogCrystal B Z, F.modules = P := by sorry

-- The completion comparison is tied to the finite semistable presentation.
-- Each level is the ordinary quotient log differential module, restricted to A.
def continuousSemistableForms (F : ArithmeticFrame) (r d : ℕ)
    (hr : 0 < r) (hrd : r ≤ d) : ModuleCat (formalSemistableRing F r d hr hrd) := by sorry
def reductionFormLimit (F : ArithmeticFrame) (r d : ℕ)
    (hr : 0 < r) (hrd : r ≤ d) : ModuleCat (formalSemistableRing F r d hr hrd) := by sorry
def semistableReductionFormTower (F : ArithmeticFrame) (r d : ℕ)
    (hr : 0 < r) (hrd : r ≤ d) : ℕᵒᵖ ⥤ ModuleCat.{0} (formalSemistableRing F r d hr hrd) := by sorry
def reductionFormCone (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    Limits.Cone (semistableReductionFormTower F r d hr hrd) := by sorry
theorem reductionFormCone_point (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    (reductionFormCone F r d hr hrd).pt = reductionFormLimit F r d hr hrd := by sorry
def reductionFormCone_isLimit (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    Limits.IsLimit (reductionFormCone F r d hr hrd) := by sorry
def logReduction_completion (F : ArithmeticFrame) (r d : ℕ)
    (hr : 0 < r) (hrd : r ≤ d) :
    continuousSemistableForms F r d hr hrd ≃ₗ[formalSemistableRing F r d hr hrd]
      reductionFormLimit F r d hr hrd := by sorry

def InCharacteristic (p : ℕ) (X : LogScheme) : Prop :=
  ∀ x : LogGeometricPoint X, CharP (logStalkRing x) p
def logAbsoluteFrobenius (p : ℕ) [Fact p.Prime] (X : LogScheme)
    (h : InCharacteristic p X) : X ⟶ X := by sorry
def frobeniusTwist {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hY : InCharacteristic p Y) : LogScheme :=
  logFiberProduct f (logAbsoluteFrobenius p Y hY)
def logRelativeFrobenius {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hX : InCharacteristic p X) (hY : InCharacteristic p Y) :
    X ⟶ frobeniusTwist p f hY := by sorry
def IsCartierType {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hX : InCharacteristic p X) (hY : InCharacteristic p Y) : Prop :=
  IsIntegralLogMorphism f ∧ IsExactLog (logRelativeFrobenius p f hX hY)
namespace IsCartierType
 theorem integral {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hX : InCharacteristic p X) (hY : InCharacteristic p Y) (h : IsCartierType p f hX hY) :
    IsIntegralLogMorphism f := by sorry
 theorem relative_frobenius_exact {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hX : InCharacteristic p X) (hY : InCharacteristic p Y) (h : IsCartierType p f hX hY) :
    IsExactLog (logRelativeFrobenius p f hX hY) := by sorry
 theorem base_change {X Y S : LogScheme} (p : ℕ) [Fact p.Prime]
    (f : X ⟶ S) (g : Y ⟶ S) (hX : InCharacteristic p X)
    (hY : InCharacteristic p Y) (hS : InCharacteristic p S)
    (h : IsCartierType p f hX hS) :
    IsCartierType p (logFiberProductSnd f g) (by sorry) hY := by sorry
end IsCartierType
def trivialSchemeMap {X Y : Scheme.{0}} (f : X ⟶ Y) :
    trivialLogScheme X ⟶ trivialLogScheme Y := by sorry
-- Test: TauCeti.LogCrystalline.IsCartierType.semistable
example (p : ℕ) [Fact p.Prime] (r : ℕ) (hr : 0 < r) :
    IsCartierType p (semistableLogMap (ZMod p) r) (by sorry) (by sorry) := by sorry
-- Test: TauCeti.LogCrystalline.IsCartierType.smooth_trivial
example (p : ℕ) [Fact p.Prime] {X Y : Scheme.{0}} (f : X ⟶ Y)
    (hf : Smooth f) (hX : InCharacteristic p (trivialLogScheme X))
    (hY : InCharacteristic p (trivialLogScheme Y)) :
    IsCartierType p (trivialSchemeMap f) hX hY := by sorry
-- Test: TauCeti.LogCrystalline.IsCartierType.root_counterexample
example (p r : ℕ) [Fact p.Prime] (hr : 1 < r) (hcop : r.Coprime p) :
    ¬ IsCartierType p (toricRootMap (ZMod p) r) (by sorry) (by sorry) := by sorry

def cartierTwistedForms {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hY : InCharacteristic p Y) (q : ℕ) :
    SheafOfModules.{0} (etaleStructureRingSheaf (frobeniusTwist p f hY).scheme) := by sorry
def cartierCohomology {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hX : InCharacteristic p X) (hY : InCharacteristic p Y) (q : ℕ) :
    SheafOfModules.{0} (etaleStructureRingSheaf (frobeniusTwist p f hY).scheme) := by sorry
def logCartierMap {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hX : InCharacteristic p X) (hY : InCharacteristic p Y) (q : ℕ) :
    cartierTwistedForms p f hY q ⟶ cartierCohomology p f hX hY q := by sorry
theorem logCartier_iso {X Y : LogScheme} (p : ℕ) [Fact p.Prime] (f : X ⟶ Y)
    (hX : InCharacteristic p X) (hY : InCharacteristic p Y)
    (hfX : IsFineLog X) (hfY : IsFineLog Y) (hs : IsLogSmooth f)
    (hc : IsCartierType p f hX hY) (q : ℕ) : IsIso (logCartierMap p f hX hY q) := by sorry

structure ExactificationAt {X Y : LogScheme} (i : X ⟶ Y) (x : X.scheme) where
  sourceNeighborhood : LogScheme
  etaleSource : sourceNeighborhood ⟶ X
  etale : Etale (logUnderlying etaleSource)
  strict : IsStrict etaleSource
  point : sourceNeighborhood.scheme
  mapsTo : (logUnderlying etaleSource).base point = x
  ambient : LogScheme
  exactImmersion : sourceNeighborhood ⟶ ambient
  exact : IsExactLog exactImmersion
  closed : IsLogClosedImmersion exactImmersion
  ambientMap : ambient ⟶ Y
  logEtale : IsLogEtale ambientMap
  factor : exactImmersion ≫ ambientMap = etaleSource ≫ i
def logExactification {X Y : LogScheme} (i : X ⟶ Y)
    (hi : IsLogClosedImmersion i) (hX : IsFineLog X) (hY : IsFineLog Y)
    (x : X.scheme) : ExactificationAt i x := by sorry
structure ExactificationRefinement {X Y : LogScheme} {i : X ⟶ Y} {x : X.scheme}
    (e e' : ExactificationAt i x) where
  common : ExactificationAt i x
  leftSource : common.sourceNeighborhood ⟶ e.sourceNeighborhood
  rightSource : common.sourceNeighborhood ⟶ e'.sourceNeighborhood
  sourceLeft : leftSource ≫ e.etaleSource = common.etaleSource
  sourceRight : rightSource ≫ e'.etaleSource = common.etaleSource
  leftAmbient : common.ambient ⟶ e.ambient
  rightAmbient : common.ambient ⟶ e'.ambient
  squareLeft : common.exactImmersion ≫ leftAmbient = leftSource ≫ e.exactImmersion
  squareRight : common.exactImmersion ≫ rightAmbient = rightSource ≫ e'.exactImmersion
  overLeft : leftAmbient ≫ e.ambientMap = common.ambientMap
  overRight : rightAmbient ≫ e'.ambientMap = common.ambientMap
  leftEtale : IsLogEtale leftAmbient
  rightEtale : IsLogEtale rightAmbient
namespace logExactification
 theorem factor {X Y : LogScheme} (i : X ⟶ Y) (hi : IsLogClosedImmersion i)
    (hX : IsFineLog X) (hY : IsFineLog Y) (x : X.scheme) :
    (logExactification i hi hX hY x).exactImmersion ≫ (logExactification i hi hX hY x).ambientMap =
      (logExactification i hi hX hY x).etaleSource ≫ i := by sorry
 theorem source_log {X Y : LogScheme} (i : X ⟶ Y) (hi : IsLogClosedImmersion i)
    (hX : IsFineLog X) (hY : IsFineLog Y) (x : X.scheme) :
    IsExactLog (logExactification i hi hX hY x).exactImmersion ∧
      IsLogClosedImmersion (logExactification i hi hX hY x).exactImmersion := by sorry
 def refinement {X Y : LogScheme} {i : X ⟶ Y} {x : X.scheme}
    (e e' : ExactificationAt i x) : ExactificationRefinement e e' := by sorry
end logExactification
-- Test: TauCeti.LogCrystalline.logExactification.already_exact
example {X Y : LogScheme} (i : X ⟶ Y) (hi : IsLogClosedImmersion i)
    (he : IsExactLog i) (x : X.scheme) :
    ∃ E : ExactificationAt i x, E.ambient = Y ∧ E.sourceNeighborhood = X := by sorry
def logDiagonalImmersion (k : Type) [Field k] :
    standardLogPoint k ⟶ affineLogScheme (toricZeroChart k 2) := by sorry
-- Test: TauCeti.LogCrystalline.logExactification.log_diagonal
example (k : Type) [Field k] (x : (standardLogPoint k).scheme) :
    IsExactLog (logExactification (logDiagonalImmersion k) (by sorry) (by sorry) (by sorry) x).exactImmersion ∧
      IsLogEtale (logExactification (logDiagonalImmersion k) (by sorry) (by sorry) (by sorry) x).ambientMap := by sorry
-- Test: TauCeti.LogCrystalline.logExactification.ordinary_diagonal_failure
example (k : Type) [Field k] : ¬ IsExactLog (logDiagonalImmersion k) := by sorry

open scoped TensorProduct
abbrev LogComplex (A : Type) [CommRing A] := CochainComplex (ModuleCat.{0} A) ℤ
abbrev LogDerived (A : Type) [CommRing A] := DerivedCategory (ModuleCat.{0} A)
structure PrelogDifferentialInput (R A : Type) [CommRing R] [CommRing A] [Algebra R A] where
  P : Type
  Q : Type
  [monoidP : CommMonoid P]
  [monoidQ : CommMonoid Q]
  alpha : P →* A
  beta : Q →* R
  chartMap : Q →* P
  compatible : alpha.comp chartMap = (algebraMap R A).toMonoidHom.comp beta
attribute [instance] PrelogDifferentialInput.monoidP PrelogDifferentialInput.monoidQ
def pdGlobalBaseMap {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) : B.ring →+* Γ(T.ambient.object.scheme, ⊤) := by sorry
-- A closed list of geometric inputs, rather than arbitrary degree-two maps.
inductive DifferentialGeometry (R A : Type) [CommRing R] [CommRing A] [Algebra R A] where
  | prelog (input : PrelogDifferentialInput R A)
  | pd (B : LogPDBase) (Z : LogOverPDBase B) (T : LogPDThickening B Z)
      (base : R ≃+* B.ring) (ambient : A ≃+* Γ(T.ambient.object.scheme, ⊤))
      (compatible : ∀ r, ambient (algebraMap R A r) =
        pdGlobalBaseMap T (base r))
def formModule {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (G : DifferentialGeometry R A) (q : ℕ) : ModuleCat.{0} A := by sorry
def formDerivation {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (G : DifferentialGeometry R A) : Derivation R A (formModule G 1) := by sorry
def formDifferential {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (G : DifferentialGeometry R A) (q : ℕ) : formModule G q →ₗ[R] formModule G (q+1) := by sorry
def formWedge {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (G : DifferentialGeometry R A) (i j : ℕ) :
    formModule G i →ₗ[A] formModule G j →ₗ[A] formModule G (i+j) := by sorry
def formWedgeOne {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (G : DifferentialGeometry R A) (q : ℕ) :
    formModule G 1 →ₗ[A] formModule G q →ₗ[A] formModule G (q+1) := by sorry
structure LogConnection {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (M Ω : ModuleCat.{0} A) (d : Derivation R A Ω) where
  nabla : M →+ M ⊗[A] Ω
  leibniz_eq : ∀ a m, nabla (a • m) = a • nabla m + m ⊗ₜ[A] d a
def extendedConnection {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    {G : DifferentialGeometry R A} {M : ModuleCat.{0} A}
    (c : LogConnection M (formModule G 1) (formDerivation G)) (q : ℕ) :
    M ⊗[A] formModule G q →ₗ[R] M ⊗[A] formModule G (q+1) := by sorry
def IsIntegrableConnection {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    {G : DifferentialGeometry R A} {M : ModuleCat.{0} A}
    (c : LogConnection M (formModule G 1) (formDerivation G)) : Prop :=
  ∀ m, extendedConnection c 1 (c.nabla m) = 0
def coefficientConnectionComplex {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    {G : DifferentialGeometry R A} {M : ModuleCat.{0} A}
    (c : LogConnection M (formModule G 1) (formDerivation G))
    (hi : IsIntegrableConnection c) : LogComplex R := by sorry
namespace LogConnection
 theorem leibniz {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    {M Ω : ModuleCat.{0} A} {d : Derivation R A Ω} (c : LogConnection M Ω d) (a : A) (m : M) :
    c.nabla (a • m) = a • c.nabla m + m ⊗ₜ[A] d a := by sorry
 def curvature {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    {G : DifferentialGeometry R A} {M : ModuleCat.{0} A}
    (c : LogConnection M (formModule G 1) (formDerivation G)) :
    M →+ M ⊗[A] formModule G 2 := (extendedConnection c 1).toAddMonoidHom.comp c.nabla
 def horizontal {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    {G : DifferentialGeometry R A} {M N : ModuleCat.{0} A}
    (c : LogConnection M (formModule G 1) (formDerivation G))
    (c' : LogConnection N (formModule G 1) (formDerivation G)) (f : M →ₗ[A] N)
    (hf : ∀ m, c'.nabla (f m) = TensorProduct.map f LinearMap.id (c.nabla m))
    (hi : IsIntegrableConnection c) (hi' : IsIntegrableConnection c') :
    coefficientConnectionComplex c hi ⟶ coefficientConnectionComplex c' hi' := by sorry
 theorem extension_formula {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    {G : DifferentialGeometry R A} {M : ModuleCat.{0} A}
    (c : LogConnection M (formModule G 1) (formDerivation G))
    (q : ℕ) (m : M) (w : formModule G q) :
    extendedConnection c q (m ⊗ₜ[A] w) =
      (TensorProduct.map (LinearMap.id : M →ₗ[A] M) ((formWedgeOne G q).flip w)) (c.nabla m) +
      m ⊗ₜ[A] formDifferential G q w := by sorry
end LogConnection
def structureConnection {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (G : DifferentialGeometry R A) :
    LogConnection (ModuleCat.of A A) (formModule G 1) (formDerivation G) := by sorry
-- Test: TauCeti.LogCrystalline.LogConnection.structure
example {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (G : DifferentialGeometry R A) : IsIntegrableConnection (structureConnection G) ∧
    ∀ a, (structureConnection G).nabla a = 1 ⊗ₜ[A] formDerivation G a := by sorry
-- Test: TauCeti.LogCrystalline.LogConnection.zero
example {R A : Type} [CommRing R] [CommRing A] [Algebra R A]
    (G : DifferentialGeometry R A) :
    ∃ c : LogConnection (ModuleCat.of A PUnit) (formModule G 1) (formDerivation G),
      c.nabla = 0 ∧ IsIntegrableConnection c := by sorry
def affinePlaneGeometry (k : Type) [Field k] :
    DifferentialGeometry k (MvPolynomial (Fin 2) k) := by sorry
def planeCoordinateForm (k : Type) [Field k] (i : Fin 2) :
    formModule (affinePlaneGeometry k) 1 :=
  formDerivation (affinePlaneGeometry k) (MvPolynomial.X i)
def planeNonintegrableConnection (k : Type) [Field k] :
    LogConnection (ModuleCat.of (MvPolynomial (Fin 2) k) (MvPolynomial (Fin 2) k))
      (formModule (affinePlaneGeometry k) 1) (formDerivation (affinePlaneGeometry k)) := by sorry
-- Test: TauCeti.LogCrystalline.LogConnection.nonintegrable
example (k : Type) [Field k] :
    (∀ a : MvPolynomial (Fin 2) k, (planeNonintegrableConnection k).nabla a =
      1 ⊗ₜ[MvPolynomial (Fin 2) k] formDerivation (affinePlaneGeometry k) a +
      a ⊗ₜ[MvPolynomial (Fin 2) k] ((MvPolynomial.X (0 : Fin 2) : MvPolynomial (Fin 2) k) • planeCoordinateForm k 1)) ∧
    LogConnection.curvature (planeNonintegrableConnection k) 1 =
      1 ⊗ₜ[MvPolynomial (Fin 2) k]
        formWedge (affinePlaneGeometry k) 1 1 (planeCoordinateForm k 0) (planeCoordinateForm k 1) ∧
    LogConnection.curvature (planeNonintegrableConnection k) 1 ≠ 0 := by sorry

-- PD forms are sheaves of relative log forms modulo d(gamma_n(x)) =
-- gamma_(n-1)(x) dx. The quotient is imposed locally and then sheafified.
def pdFormSheaf {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (q : ℕ) : EtaleModules T.ambient.object.scheme := by sorry
def pdSheafDerivative {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (U : T.ambient.object.scheme.Etaleᵒᵖ) :
    (etaleStructureRingSheaf T.ambient.object.scheme).obj.obj U →+
      (pdFormSheaf T 1).val.obj U := by sorry
structure SheafPDConnection {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) where
  modules : EtaleModules T.ambient.object.scheme
  nabla : ∀ U, modules.val.obj U →+ (etaleModuleTensor modules (pdFormSheaf T 1)).val.obj U
  restriction : ∀ {U V} (f : U ⟶ V) m,
    (etaleModuleTensor modules (pdFormSheaf T 1)).val.map f (nabla U m) =
      nabla V (modules.val.map f m)
  leibniz : ∀ U a m, nabla U (a • m) = a • nabla U m +
    etaleTensorSection modules (pdFormSheaf T 1) U m (pdSheafDerivative T U a)
def sheafPDExtended {B : LogPDBase} {Z : LogOverPDBase B} {T : LogPDThickening B Z}
    (C : SheafPDConnection T) (q : ℕ) (U : T.ambient.object.scheme.Etaleᵒᵖ) :
    (etaleModuleTensor C.modules (pdFormSheaf T q)).val.obj U →+
      (etaleModuleTensor C.modules (pdFormSheaf T (q+1))).val.obj U := by sorry
-- Extended differential: d_nabla(m tensor omega) = nabla(m) wedge omega + m tensor d(omega).
structure PDConnectionSheaf {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    extends SheafPDConnection T where
  integrable : ∀ U m, sheafPDExtended toSheafPDConnection 1 U (nabla U m) = 0
-- Actual small-etale stalk, indexed by a geometric point of the SAME ambient.
def etaleModuleStalk {X : LogScheme} (M : EtaleModules X.scheme) (x : LogGeometricPoint X) :
    ModuleCat.{0} (logStalkRing x) := by sorry
-- Coordinate frames live at the geometric stalk, with the actual ordinary
-- derivative and dlog. The bound may depend on the frame AND the section germ.
def pdDerivativeStalk {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (x : LogGeometricPoint T.ambient.object) :
    logStalkRing x →+ etaleModuleStalk (pdFormSheaf T 1) x := by sorry
def pdDlogStalk {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (x : LogGeometricPoint T.ambient.object) :
    (logStalk x).monoid →* Multiplicative (etaleModuleStalk (pdFormSheaf T 1) x) := by sorry
structure PDStalkCoordinateFrame {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (x : LogGeometricPoint T.ambient.object) where
  ordinary : ℕ
  logarithmic : ℕ
  ordinaryCoordinates : Fin ordinary → logStalkRing x
  logCoordinates : Fin logarithmic → (logStalk x).monoid
  basis : (Fin (ordinary + logarithmic) → logStalkRing x) ≃ₗ[logStalkRing x]
    etaleModuleStalk (pdFormSheaf T 1) x
  ordinaryBasis : ∀ i, basis (Pi.single (Fin.castAdd logarithmic i) 1) =
    pdDerivativeStalk T x (ordinaryCoordinates i)
  logBasis : ∀ i, basis (Pi.single (Fin.natAdd ordinary i) 1) =
    (pdDlogStalk T x (logCoordinates i)).toAdd
def pdNablaStalk {B : LogPDBase} {Z : LogOverPDBase B} {T : LogPDThickening B Z}
    (C : PDConnectionSheaf T) (x : LogGeometricPoint T.ambient.object) :
    etaleModuleStalk C.modules x →+
      etaleModuleStalk (etaleModuleTensor C.modules (pdFormSheaf T 1)) x := by sorry
-- The native stalk/tensor comparison is valid; the global section comparison is not.
def etaleTensorStalkIso {X : LogScheme} (M N : EtaleModules X.scheme) (x : LogGeometricPoint X) :
    etaleModuleStalk (etaleModuleTensor M N) x ≅
      ModuleCat.of (logStalkRing x)
        (etaleModuleStalk M x ⊗[logStalkRing x] etaleModuleStalk N x) := by sorry
def pdStalkCoordinateOperator {B : LogPDBase} {Z : LogOverPDBase B} {T : LogPDThickening B Z}
    (C : PDConnectionSheaf T) (x : LogGeometricPoint T.ambient.object)
    (c : PDStalkCoordinateFrame T x) (i : Fin (c.ordinary + c.logarithmic)) :
    etaleModuleStalk C.modules x →+ etaleModuleStalk C.modules x :=
  (TensorProduct.rid (logStalkRing x) (etaleModuleStalk C.modules x)).toAddMonoidHom.comp
    ((TensorProduct.map LinearMap.id ((LinearMap.proj i).comp c.basis.symm.toLinearMap)).toAddMonoidHom.comp
      ((etaleTensorStalkIso C.modules (pdFormSheaf T 1) x).hom.hom.toAddMonoidHom.comp (pdNablaStalk C x)))
-- Compose ordinary powers and logarithmic falling factorials in a fixed order;
-- integrability gives their commuting/coordinate-independence comparison.
def pdTaylorStalkCoefficient {B : LogPDBase} {Z : LogOverPDBase B} {T : LogPDThickening B Z}
    (C : PDConnectionSheaf T) (x : LogGeometricPoint T.ambient.object)
    (c : PDStalkCoordinateFrame T x) (nu : Fin (c.ordinary + c.logarithmic) → ℕ) :
    etaleModuleStalk C.modules x →+ etaleModuleStalk C.modules x :=
  (List.ofFn (fun i : Fin (c.ordinary + c.logarithmic) =>
    (List.range (nu i)).foldl (fun acc j =>
      acc.comp (if i.val < c.ordinary then pdStalkCoordinateOperator C x c i
        else pdStalkCoordinateOperator C x c i - j • AddMonoidHom.id _)) (AddMonoidHom.id _))).foldl
    (fun acc op => acc.comp op) (AddMonoidHom.id _)
def PDConnectionQuasiNilpotent {B : LogPDBase} {Z : LogOverPDBase B} {T : LogPDThickening B Z}
    (C : PDConnectionSheaf T) : Prop :=
  ∀ x : LogGeometricPoint T.ambient.object, ∀ c : PDStalkCoordinateFrame T x,
    ∀ m : etaleModuleStalk C.modules x, ∃ b : ℕ, ∀ nu,
      b ≤ ∑ i, nu i → pdTaylorStalkCoefficient C x c nu m = 0

structure QNPDConnection {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) where
  val : PDConnectionSheaf T
  quasiNilpotent : PDConnectionQuasiNilpotent val
structure HorizontalPDMap {B : LogPDBase} {Z : LogOverPDBase B} {T : LogPDThickening B Z}
    (C D : QNPDConnection T) where
  val : C.val.modules ⟶ D.val.modules
  horizontal : ∀ U m, D.val.nabla U (val.val.app U m) =
    (etaleTensorMap val (𝟙 (pdFormSheaf T 1))).val.app U (C.val.nabla U m)
instance {B : LogPDBase} {Z : LogOverPDBase B} {T : LogPDThickening B Z} :
    Category (QNPDConnection T) where
  Hom := HorizontalPDMap
  id C := ⟨𝟙 C.val.modules, by sorry⟩
  comp f g := ⟨f.val ≫ g.val, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

structure PDStratificationDiagram (C D E : Type 1) [Category C] [Category D] [Category E] where
  p₁ : C ⥤ D
  p₂ : C ⥤ D
  diagonal : D ⥤ C
  d₁ : p₁ ⋙ diagonal ≅ 𝟭 C
  d₂ : p₂ ⋙ diagonal ≅ 𝟭 C
  p₁₂ : D ⥤ E
  p₂₃ : D ⥤ E
  p₁₃ : D ⥤ E
  a : p₁ ⋙ p₁₂ ≅ p₁ ⋙ p₁₃
  b : p₂ ⋙ p₁₂ ≅ p₁ ⋙ p₂₃
  c : p₂ ⋙ p₂₃ ≅ p₂ ⋙ p₁₃
-- Exactified double/triple PD diagonal schemes, with their actual projections.
def pdDiagonalThickening {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (n : ℕ) : LogPDThickening B Z := by sorry
-- Exactified PD envelope of Z -> T^n over B, with the inherited PD base.
def pdDiagonalScheme {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (n : ℕ) : Scheme.{0} :=
  (pdDiagonalThickening T n).ambient.object.scheme
def pdDiagonalProjection {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (i : Fin 2) : pdDiagonalScheme T 2 ⟶ T.ambient.object.scheme := by sorry
def pdDiagonalUnit {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) : T.ambient.object.scheme ⟶ pdDiagonalScheme T 2 := by sorry
def pdTripleProjection {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (i j : Fin 3) : pdDiagonalScheme T 3 ⟶ pdDiagonalScheme T 2 := by sorry
-- Induced by the indicated projections of the exactified PD envelopes.
def pdDiagonalDiagram {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) :
    PDStratificationDiagram (EtaleModules T.ambient.object.scheme)
      (EtaleModules (pdDiagonalScheme T 2)) (EtaleModules (pdDiagonalScheme T 3)) where
  p₁ := etaleModulePullback (pdDiagonalProjection T 0)
  p₂ := etaleModulePullback (pdDiagonalProjection T 1)
  diagonal := etaleModulePullback (pdDiagonalUnit T)
  d₁ := by sorry
  d₂ := by sorry
  p₁₂ := etaleModulePullback (pdTripleProjection T 0 1)
  p₂₃ := etaleModulePullback (pdTripleProjection T 1 2)
  p₁₃ := etaleModulePullback (pdTripleProjection T 0 2)
  a := by sorry
  b := by sorry
  c := by sorry
def pdDiagonalDiagram_projection {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) :
    (pdDiagonalDiagram T).p₁ ≅ etaleModulePullback (pdDiagonalProjection T 0) := by sorry
def pdDiagonalDiagram_projection₂ {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) :
    (pdDiagonalDiagram T).p₂ ≅ etaleModulePullback (pdDiagonalProjection T 1) := by sorry
structure LogPDStratification {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (M : EtaleModules T.ambient.object.scheme) where
  epsilon : (pdDiagonalDiagram T).p₂.obj M ≅ (pdDiagonalDiagram T).p₁.obj M
  diagonal_eq : ((pdDiagonalDiagram T).d₂.app M).inv ≫
    (pdDiagonalDiagram T).diagonal.map epsilon.hom ≫ ((pdDiagonalDiagram T).d₁.app M).hom = 𝟙 M
  cocycle_eq : (pdDiagonalDiagram T).p₂₃.map epsilon.hom ≫
    ((pdDiagonalDiagram T).b.app M).inv ≫ (pdDiagonalDiagram T).p₁₂.map epsilon.hom ≫
    ((pdDiagonalDiagram T).a.app M).hom =
      ((pdDiagonalDiagram T).c.app M).hom ≫ (pdDiagonalDiagram T).p₁₃.map epsilon.hom
instance pdAmbientAlgebra {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) : Algebra B.ring Γ(T.ambient.object.scheme, ⊤) := by sorry
def pdDifferentialGeometry {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) :
    DifferentialGeometry B.ring Γ(T.ambient.object.scheme, ⊤) :=
  .pd B Z T (RingEquiv.refl _) (RingEquiv.refl _) (by sorry)
namespace LogPDStratification
 theorem diagonal {B : LogPDBase} {Z : LogOverPDBase B}
    {T : LogPDThickening B Z} {M : EtaleModules T.ambient.object.scheme}
    (e : LogPDStratification T M) :
    ((pdDiagonalDiagram T).d₂.app M).inv ≫ (pdDiagonalDiagram T).diagonal.map e.epsilon.hom ≫
      ((pdDiagonalDiagram T).d₁.app M).hom = 𝟙 M := by sorry
 theorem cocycle {B : LogPDBase} {Z : LogOverPDBase B}
    {T : LogPDThickening B Z} {M : EtaleModules T.ambient.object.scheme}
    (e : LogPDStratification T M) :
    (pdDiagonalDiagram T).p₂₃.map e.epsilon.hom ≫ ((pdDiagonalDiagram T).b.app M).inv ≫
      (pdDiagonalDiagram T).p₁₂.map e.epsilon.hom ≫ ((pdDiagonalDiagram T).a.app M).hom =
      ((pdDiagonalDiagram T).c.app M).hom ≫ (pdDiagonalDiagram T).p₁₃.map e.epsilon.hom := by sorry
 def first_order {B : LogPDBase} {Z : LogOverPDBase B}
    {T : LogPDThickening B Z} {M : EtaleModules T.ambient.object.scheme}
    (e : LogPDStratification T M) :
    PDConnectionSheaf T := by sorry
 theorem first_order_module {B : LogPDBase} {Z : LogOverPDBase B}
    {T : LogPDThickening B Z} {M : EtaleModules T.ambient.object.scheme}
    (e : LogPDStratification T M) : (first_order e).modules = M := by sorry
end LogPDStratification
def structurePDStratification {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) :
    LogPDStratification T (etaleFree T.ambient.object.scheme 1) := by sorry
-- Test: TauCeti.LogCrystalline.LogPDStratification.structure
example {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) :
    (LogPDStratification.first_order (structurePDStratification T)).modules =
      etaleFree T.ambient.object.scheme 1 := by sorry
-- Test: TauCeti.LogCrystalline.LogPDStratification.zero
example {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) :
    Nonempty (LogPDStratification T (etaleFree T.ambient.object.scheme 0)) := by sorry
-- Test: TauCeti.LogCrystalline.LogPDStratification.missing_cocycle
example {B : LogPDBase} {Z : LogOverPDBase B} {T : LogPDThickening B Z}
    {M : EtaleModules T.ambient.object.scheme}
    (e : (pdDiagonalDiagram T).p₂.obj M ≅ (pdDiagonalDiagram T).p₁.obj M)
    (h : (pdDiagonalDiagram T).p₂₃.map e.hom ≫ ((pdDiagonalDiagram T).b.app M).inv ≫
      (pdDiagonalDiagram T).p₁₂.map e.hom ≫ ((pdDiagonalDiagram T).a.app M).hom ≠
      ((pdDiagonalDiagram T).c.app M).hom ≫ (pdDiagonalDiagram T).p₁₃.map e.hom) :
    ¬ ∃ s : LogPDStratification T M, s.epsilon = e := by sorry

def logFallingFactorial {R M : Type} [CommRing R] [AddCommGroup M] [Module R M]
    (D : Module.End R M) (n : ℕ) : Module.End R M :=
  (List.range n).foldl (fun acc j => acc * (D - (j:R) • (1 : Module.End R M))) 1
def FallingFactorialNilpotent {R M : Type} [CommRing R] [AddCommGroup M] [Module R M]
    (D : Module.End R M) : Prop := ∀ m, ∃ b : ℕ, ∀ n ≥ b, logFallingFactorial D n m = 0
def logGlobalMonoid (X : LogScheme) : CommMonCat.{0} := by sorry
def pdGlobalDlog {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) : logGlobalMonoid T.ambient.object →*
      Multiplicative (formModule (pdDifferentialGeometry T) 1) := by sorry
-- Finite ordinary/logarithmic PD coordinate systems, with basis duality to Ω¹.
structure PDCoordinateFrame {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) where
  ordinary : ℕ
  logarithmic : ℕ
  ordinaryCoordinates : Fin ordinary → Γ(T.ambient.object.scheme, ⊤)
  logCoordinates : Fin logarithmic → logGlobalMonoid T.ambient.object
  basis : (Fin (ordinary + logarithmic) → Γ(T.ambient.object.scheme, ⊤)) ≃ₗ[Γ(T.ambient.object.scheme, ⊤)]
    formModule (pdDifferentialGeometry T) 1
  ordinaryBasis : ∀ i, basis (Pi.single (Fin.castAdd logarithmic i) 1) =
    formDerivation (pdDifferentialGeometry T) (ordinaryCoordinates i)
  logBasis : ∀ i, basis (Pi.single (Fin.natAdd ordinary i) 1) =
    (pdGlobalDlog T (logCoordinates i)).toAdd
def logTaylorCoefficient {B : LogPDBase} {Z : LogOverPDBase B}
    {T : LogPDThickening B Z} {M : ModuleCat.{0} Γ(T.ambient.object.scheme, ⊤)}
    (c : LogConnection M (formModule (pdDifferentialGeometry T) 1)
      (formDerivation (pdDifferentialGeometry T))) (s : PDCoordinateFrame T)
    (nu : Fin (s.ordinary + s.logarithmic) → ℕ) : M →ₗ[B.ring] M := by sorry
def LogQuasiNilpotent {B : LogPDBase} {Z : LogOverPDBase B}
    {T : LogPDThickening B Z} {M : ModuleCat.{0} Γ(T.ambient.object.scheme, ⊤)}
    (c : LogConnection M (formModule (pdDifferentialGeometry T) 1)
      (formDerivation (pdDifferentialGeometry T))) (s : PDCoordinateFrame T) : Prop :=
  ∀ m, ∃ b : ℕ, ∀ nu, b ≤ ∑ i, nu i → logTaylorCoefficient c s nu m = 0
namespace LogQuasiNilpotent
 theorem falling_factorial {R M : Type} [CommRing R] [AddCommGroup M] [Module R M]
    (D : Module.End R M) (h : FallingFactorialNilpotent D) (m : M) :
    ∃ b : ℕ, ∀ n ≥ b, logFallingFactorial D n m = 0 := by sorry
 theorem coordinate_independent {B : LogPDBase} {Z : LogOverPDBase B}
    {T : LogPDThickening B Z} {M : ModuleCat.{0} Γ(T.ambient.object.scheme, ⊤)}
    (c : LogConnection M (formModule (pdDifferentialGeometry T) 1)
      (formDerivation (pdDifferentialGeometry T))) (hi : IsIntegrableConnection c)
    (s t : PDCoordinateFrame T) : LogQuasiNilpotent c s ↔ LogQuasiNilpotent c t := by sorry
end LogQuasiNilpotent
-- Test: TauCeti.LogCrystalline.LogQuasiNilpotent.zero_residue
example {R M : Type} [CommRing R] [AddCommGroup M] [Module R M] :
    FallingFactorialNilpotent (0 : Module.End R M) := by sorry
-- Test: TauCeti.LogCrystalline.LogQuasiNilpotent.integer_residue
example : logFallingFactorial (1 : Module.End ℚ ℚ) 2 = 0 ∧ (1 : Module.End ℚ ℚ)^2 ≠ 0 := by sorry
-- Test: TauCeti.LogCrystalline.LogQuasiNilpotent.nonintegral_residue
example (n : ℕ) : padicValRat 2 ((Finset.range n).prod fun j => (1/2 : ℚ) - (j : ℚ)) = -(n : ℤ) := by sorry

-- Completed connections and their actual quotient operators, rather than a
-- separately chosen operator on an unrelated quotient.
instance formalSemistableAlgebra (F : ArithmeticFrame) (r d : ℕ)
    (hr : 0 < r) (hrd : r ≤ d) : Algebra F.O (formalSemistableRing F r d hr hrd) := by sorry
def formalFormGeometry (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) :
    DifferentialGeometry F.O (formalSemistableRing F r d hr hrd) := by sorry
structure FormalLogConnection (F : ArithmeticFrame) (r d : ℕ) (hr : 0 < r) (hrd : r ≤ d) where
  module : ModuleCat.{0} (formalSemistableRing F r d hr hrd)
  complete : IsAdicComplete (Ideal.span {(F.p : formalSemistableRing F r d hr hrd)}) module
  connection : LogConnection module (formModule (formalFormGeometry F r d hr hrd) 1)
    (formDerivation (formalFormGeometry F r d hr hrd))
  integrable : IsIntegrableConnection connection
def formalTaylorCoefficient {F : ArithmeticFrame} {r d : ℕ} {hr : 0 < r} {hrd : r ≤ d}
    (C : FormalLogConnection F r d hr hrd) (nu : Fin d → ℕ) : C.module →ₗ[F.O] C.module := by sorry
def formalReductionModule {F : ArithmeticFrame} {r d : ℕ} {hr : 0 < r} {hrd : r ≤ d}
    (C : FormalLogConnection F r d hr hrd) (n : ℕ) : ModuleCat.{0} F.O :=
  ModuleCat.of F.O (C.module ⧸
    (Ideal.span {(F.p : formalSemistableRing F r d hr hrd)^n}) • (⊤ : Submodule (formalSemistableRing F r d hr hrd) C.module))
def reducedTaylorCoefficient {F : ArithmeticFrame} {r d : ℕ} {hr : 0 < r} {hrd : r ≤ d}
    (C : FormalLogConnection F r d hr hrd) (n : ℕ) (nu : Fin d → ℕ) :
    Module.End F.O (formalReductionModule C n) := by sorry
def TopologicallyQuasiNilpotent {F : ArithmeticFrame} {r d : ℕ} {hr : 0 < r} {hrd : r ≤ d}
    (C : FormalLogConnection F r d hr hrd) : Prop :=
  ∀ n m, ∃ b : ℕ, ∀ nu, b ≤ ∑ i, nu i → formalTaylorCoefficient C nu m ∈
    (Ideal.span {(F.p : formalSemistableRing F r d hr hrd)^n}) • (⊤ : Submodule (formalSemistableRing F r d hr hrd) C.module)
namespace LogQuasiNilpotent
 theorem formal_mod_pn {F : ArithmeticFrame} {r d : ℕ} {hr : 0 < r} {hrd : r ≤ d}
    (C : FormalLogConnection F r d hr hrd) : TopologicallyQuasiNilpotent C ↔
      ∀ n, 0 < n → ∀ m : formalReductionModule C n, ∃ b : ℕ,
        ∀ nu, b ≤ ∑ i, nu i → reducedTaylorCoefficient C n nu m = 0 := by sorry
end LogQuasiNilpotent

instance pdEtaleAlgebra {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (U : T.ambient.object.scheme.Etaleᵒᵖ) :
    Algebra B.ring ((etaleStructureSheaf T.ambient.object.scheme).obj.obj U) := by sorry
def pdEtaleGeometry {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (U : T.ambient.object.scheme.Etaleᵒᵖ) :
    DifferentialGeometry B.ring ((etaleStructureSheaf T.ambient.object.scheme).obj.obj U) := by sorry
-- CR.1 supplies ordinary ringed-site derived sections; the logarithmic site
-- constructed above fixes the inputs of this client functor.
abbrev Crystals (B : LogPDBase) (Z : LogOverPDBase B) :=
  LogCrystal B Z
def logCrystal_connection_equivalence {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (h : IsPDSmooth T) : Crystals B Z ≌ QNPDConnection T := by sorry
def pdIdentitySiteObject {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) : LogCrysObject B Z :=
  ⟨Z, 𝟙 _, by sorry, by sorry, by sorry, T⟩
def crystalEvaluation {B : LogPDBase} {Z : LogOverPDBase B}
    (F : Crystals B Z) (T : LogPDThickening B Z) : PDConnectionSheaf T where
  modules := F.evaluation (pdIdentitySiteObject T)
  nabla := by sorry
  restriction := by sorry
  leibniz := by sorry
  integrable := by sorry
theorem crystalEvaluation_modules {B : LogPDBase} {Z : LogOverPDBase B}
    (F : Crystals B Z) (T : LogPDThickening B Z) :
    (crystalEvaluation F T).modules = F.evaluation (pdIdentitySiteObject T) := by sorry
theorem logCrystal_connection_equivalence_evaluation {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (h : IsPDSmooth T) (F : Crystals B Z) :
    ((logCrystal_connection_equivalence T h).functor.obj F).val = crystalEvaluation F T := by sorry
def logPDDeRham {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (C : PDConnectionSheaf T) :
    T.ambient.object.scheme.Etaleᵒᵖ ⥤ LogComplex B.ring := by sorry
def pdIdealGlobal {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) :
    Ideal Γ(T.ambient.object.scheme, ⊤) := RingHom.ker (logUnderlying T.closed).appTop.hom
def pdGlobalPowers {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) :
    DividedPowers (pdIdealGlobal T) := by sorry
def pdFiltrationPower {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (m : ℤ) : Ideal Γ(T.ambient.object.scheme, ⊤) := by sorry
def pdCoefficientFormSheaf {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (C : PDConnectionSheaf T) (q : ℕ) :
    EtaleModules T.ambient.object.scheme := etaleModuleTensor C.modules (pdFormSheaf T q)
def pdCoefficientForms {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (C : PDConnectionSheaf T)
    (U : T.ambient.object.scheme.Etaleᵒᵖ) (q : ℕ) :
    ModuleCat.{0} ((etaleStructureRingSheaf T.ambient.object.scheme).obj.obj U) :=
    (pdCoefficientFormSheaf T C q).val.obj U
-- The complex uses the sections of these sheaf tensor terms on every U.
def logPDDeRham_terms {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (C : PDConnectionSheaf T)
    (U : T.ambient.object.scheme.Etaleᵒᵖ) (q : ℕ) :
    ((logPDDeRham T C).obj U).X (q : ℤ) ≅
      (ModuleCat.restrictScalars (pdBaseRingMap B T.ambient.structureMap U)).obj (pdCoefficientForms T C U q) := by sorry
def dualNumberGlobalIso (p : ℕ) [Fact p.Prime] :
    Γ((dualNumberPDThickening p).ambient.object.scheme, ⊤) ≃+* DualNumber (ZMod p) := by sorry
-- Test: TauCeti.LogCrystalline.LogPDThickening.square_zero
example (p : ℕ) [Fact p.Prime] (n : ℕ) (hn : 2 ≤ n) :
    (pdGlobalPowers (dualNumberPDThickening p)).dpow n
      ((dualNumberGlobalIso p).symm (⟨0, 1⟩ : DualNumber (ZMod p))) = 0 := by sorry
namespace logPDDeRham
 theorem pd_derivative {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (n : ℕ) (x : Γ(T.ambient.object.scheme, ⊤)) (hx : x ∈ pdIdealGlobal T) :
    formDerivation (pdDifferentialGeometry T) ((pdGlobalPowers T).dpow (n+1) x) =
      (pdGlobalPowers T).dpow n x • formDerivation (pdDifferentialGeometry T) x := by sorry
 def filtration_degree {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (m a : ℤ) : Ideal Γ(T.ambient.object.scheme, ⊤) :=
    pdFiltrationPower T (m-a)
 -- Sheaf-level tensor identity, valid without an affineness hypothesis.
 def coefficient_tensor {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (C : PDConnectionSheaf T) (q : ℕ) :
    pdCoefficientFormSheaf T C q ≅ etaleModuleTensor C.modules (pdFormSheaf T q) := Iso.refl _
end logPDDeRham
-- Test: TauCeti.LogCrystalline.logPDDeRham.degree_zero
example {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) (m : ℤ) :
    logPDDeRham.filtration_degree T m 0 = pdFiltrationPower T m := by sorry
-- Test: TauCeti.LogCrystalline.logPDDeRham.zero_pd_ideal
example {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (hj : pdIdealGlobal T = ⊥) (m a : ℤ) :
    logPDDeRham.filtration_degree T m a = (if m ≤ a then ⊤ else ⊥) := by sorry
-- Test: TauCeti.LogCrystalline.logPDDeRham.ordinary_power_failure
example (p : ℕ) [Fact p.Prime] :
    (DividedPowerAlgebra.dp (ZMod p) 1 (1 : ZMod p))^p = 0 ∧
      DividedPowerAlgebra.dp (ZMod p) p (1 : ZMod p) ≠ 0 := by sorry
def projectiveLineModPSource (p : ℕ) [Fact p.Prime] : LogOverPDBase (modpPDBase p) where
  object := trivialLogScheme (projectiveLine (ZMod p))
  structureMap := by sorry
  extension := by sorry
  charts := by sorry
def projectiveLineIdentityPD (p : ℕ) [Fact p.Prime] :
    LogPDThickening (modpPDBase p) (projectiveLineModPSource p) where
  ambient := projectiveLineModPSource p
  closed := 𝟙 _
  overBase := by sorry
  closedImmersion := by sorry
  logSurjective := by sorry
  exact := by sorry
  integral := by sorry
  delta := by sorry
  common := by sorry
  commonOnJ := by sorry
  commonOnBase := by sorry
  deltaNatural := by sorry
def projectiveLineCartierConnection (p : ℕ) [Fact p.Prime] :
    PDConnectionSheaf (projectiveLineIdentityPD p) where
  modules := projectiveLineTwist (ZMod p) (p : ℤ)
  nabla := by sorry
  restriction := by sorry
  leibniz := by sorry
  integrable := by sorry
-- Canonical Cartier connection on Frob^*O(1)=O(p), with trivial log and J=0.
def projectiveLinePDForms (p : ℕ) [Fact p.Prime] :
    pdFormSheaf (projectiveLineIdentityPD p) 1 ≅ projectiveLineTwist (ZMod p) (-2) := by sorry
theorem projectiveLineCartierConnection_qn (p : ℕ) [Fact p.Prime] :
    PDConnectionQuasiNilpotent (projectiveLineCartierConnection p) := by sorry
-- Test: TauCeti.LogCrystalline.logPDDeRham.section_tensor_failure
example (p : ℕ) [Fact p.Prime] :
    Subsingleton (etaleSectionsTensor (projectiveLineCartierConnection p).modules
      (pdFormSheaf (projectiveLineIdentityPD p) 1)
      (Opposite.op (etaleIdentity (projectiveLine (ZMod p))))) ∧
    ¬ Subsingleton (pdCoefficientForms (projectiveLineIdentityPD p)
      (projectiveLineCartierConnection p)
        (Opposite.op (etaleIdentity (projectiveLine (ZMod p)))) 1) := by sorry
-- Gamma(Omega^1)=0, but Gamma(O(p) tensor Omega^1)=Gamma(O(p-2)) has dimension p-1.

def logCrystallineCohomology (B : LogPDBase) (Z : LogOverPDBase B)
    (F : Crystals B Z) : LogDerived B.ring := by sorry
def pdDeRhamCohomology {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (C : PDConnectionSheaf T) : LogDerived B.ring := by sorry
def logPoincare {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (h : IsPDSmooth T) (F : Crystals B Z) :
    logCrystallineCohomology B Z F ≅ pdDeRhamCohomology T (crystalEvaluation F T) := by sorry
-- Hypercover and PD embedding systems are genuine augmented simplicial log
-- schemes; the augmentation must be a strict etale hypercover of this Z.
def logRelativeMatching {Z : LogScheme} {U : SimplicialObject LogScheme}
    (a : U ⟶ (Functor.const _).obj Z) (n : ℕ) : LogScheme := by sorry
def logMatchingMap {Z : LogScheme} {U : SimplicialObject LogScheme}
    (a : U ⟶ (Functor.const _).obj Z) (n : ℕ) :
    U.obj (Opposite.op (SimplexCategory.mk n)) ⟶ logRelativeMatching a n := by sorry
def IsStrictEtaleHypercover {Z : LogScheme} {U : SimplicialObject LogScheme}
    (a : U ⟶ (Functor.const _).obj Z) : Prop := ∀ n,
  IsStrict (logMatchingMap a n) ∧ Etale (logUnderlying (logMatchingMap a n)) ∧
    Function.Surjective (logUnderlying (logMatchingMap a n)).base
structure LogEmbeddingSystem (B : LogPDBase) (Z : LogOverPDBase B) where
  source : SimplicialObject LogScheme
  augmentation : source ⟶ (Functor.const _).obj Z.object
  hypercover : IsStrictEtaleHypercover augmentation
  ambient : SimplicialObject LogScheme
  embedding : source ⟶ ambient
  sourceOver : ∀ n, LogOverPDBase B
  sourceIdentification : ∀ n, (sourceOver n).object = source.obj n
  thickening : ∀ n, LogPDThickening B (sourceOver n)
  ambientIdentification : ∀ n, (thickening n).ambient.object = ambient.obj n
  identifiesEmbedding : ∀ n, (thickening n).closed ≫ eqToHom (ambientIdentification n) =
    eqToHom (sourceIdentification n) ≫ embedding.app n
  pdSmooth : ∀ n, IsPDSmooth (thickening n)
  pdMaps : ∀ {n m} (f : n ⟶ m), ∃ h : PDThickeningHom (thickening n) (thickening m),
    h.source ≫ eqToHom (sourceIdentification m) = eqToHom (sourceIdentification n) ≫ source.map f ∧
    h.ambient ≫ eqToHom (ambientIdentification m) = eqToHom (ambientIdentification n) ≫ ambient.map f
def embeddingTotal {B : LogPDBase} {Z : LogOverPDBase B}
    (E : LogEmbeddingSystem B Z) (F : Crystals B Z) : LogDerived B.ring := by sorry
def logEmbedding_descent {B : LogPDBase} {Z : LogOverPDBase B}
    (E : LogEmbeddingSystem B Z) (F : Crystals B Z) :
    logCrystallineCohomology B Z F ≅ embeddingTotal E F := by sorry

-- DD.1 must export a coherent countable derived-limit functor, its cones and
-- Milnor theorem. This is an explicit supplier request, separate from completion.
-- A strict coherent tower of complexes carries the chain-level data lost by
-- a bare diagram in a triangulated category. DD.1 resolves geometric towers.
abbrev LogDerivedTower (A : Type) [CommRing A] := ℕᵒᵖ ⥤ LogComplex A
def derivedTower {A : Type} [CommRing A] (T : LogDerivedTower A) : ℕᵒᵖ ⥤ LogDerived A :=
  T ⋙ DerivedCategory.Q
def degreeZeroComplex {A : Type} [CommRing A] (M : ModuleCat.{0} A) : LogComplex A := by sorry
def logH {A : Type} [CommRing A] (C : LogDerived A) (n : ℤ) : ModuleCat.{0} A :=
  (DerivedCategory.homologyFunctor (ModuleCat.{0} A) n).obj C
def degreeZero {A : Type} [CommRing A] (M : ModuleCat.{0} A) : LogDerived A :=
  (DerivedCategory.singleFunctor (ModuleCat.{0} A) 0).obj M
-- Fixed DD.1 constructions, not an argument allowed to be a constant function.
def derivedCountableLimit (A : Type) [CommRing A] : LogDerivedTower A ⥤ LogDerived A := by sorry
def derivedLimitCone {A : Type} [CommRing A] (T : LogDerivedTower A) : Limits.Cone (derivedTower T) := by sorry
theorem derivedLimitCone_point {A : Type} [CommRing A] (T : LogDerivedTower A) :
    (derivedLimitCone T).pt = (derivedCountableLimit A).obj T := by sorry
-- DD.1's chain-level limit adapter; degreewise surjectivity is checked on
-- the compatible PD de Rham resolutions, before passing to their derived class.
def continuousComplexLimit {A : Type} [CommRing A] (T : LogDerivedTower A) : LogComplex A := by sorry
def HasSurjectiveTransitions {A : Type} [CommRing A] (T : LogDerivedTower A) : Prop :=
  ∀ n : ℕ, ∀ q : ℤ, Function.Surjective ((T.map (homOfLE (Nat.le_succ n)).op).f q)
def continuousComplexLimitProjection {A : Type} [CommRing A] (T : LogDerivedTower A) (n : ℕ) :
    continuousComplexLimit T ⟶ T.obj (Opposite.op n) := by sorry
def degreewiseLimitCone {A : Type} [CommRing A] (T : LogDerivedTower A) (q : ℤ) :
    Limits.Cone (T ⋙ HomologicalComplex.eval _ _ q) := by sorry
theorem degreewiseLimitCone_point {A : Type} [CommRing A] (T : LogDerivedTower A) (q : ℤ) :
    (degreewiseLimitCone T q).pt = (continuousComplexLimit T).X q := by sorry
def degreewiseLimitCone_isLimit {A : Type} [CommRing A] (T : LogDerivedTower A) (q : ℤ) :
    Limits.IsLimit (degreewiseLimitCone T q) := by sorry
def pAdicLogCrystalline {A : Type} [CommRing A] (T : LogDerivedTower A) : LogDerived A :=
  (derivedCountableLimit A).obj T
namespace pAdicLogCrystalline
 def level_maps {A : Type} [CommRing A] (T : LogDerivedTower A) (n : ℕ) :
    pAdicLogCrystalline T ⟶ (derivedTower T).obj (Opposite.op n) := by sorry
 theorem derived_limit {A : Type} [CommRing A] (T : LogDerivedTower A) (n m : ℕ) (h : n ≤ m) :
    level_maps T m ≫ (derivedTower T).map (homOfLE h).op = level_maps T n := by sorry
 def continuous_model {A : Type} [CommRing A] (T : LogDerivedTower A)
    (h : HasSurjectiveTransitions T) :
    pAdicLogCrystalline T ≅ DerivedCategory.Q.obj (continuousComplexLimit T) := by sorry
end pAdicLogCrystalline
def wittPointTower (p : ℕ) (k : Type) [Fact p.Prime] [Field k] [CharP k p] [PerfectRing k p] :
    LogDerivedTower (WittVector p k) := by sorry
def wittPointLevel (p : ℕ) (k : Type) [Fact p.Prime] [Field k] [CharP k p]
    [PerfectRing k p] (n : ℕ) : ModuleCat.{0} (WittVector p k) :=
  ModuleCat.of (WittVector p k) ((WittVector p k) ⧸ Ideal.span {((p : WittVector p k)^(n+1))})
def wittPointTower_level (p : ℕ) (k : Type) [Fact p.Prime] [Field k] [CharP k p]
    [PerfectRing k p] (n : ℕ) :
    (wittPointTower p k).obj (Opposite.op n) ≅ degreeZeroComplex (wittPointLevel p k n) := by sorry
def degreeZeroComplexMap {A : Type} [CommRing A] {M N : ModuleCat.{0} A}
    (f : M ⟶ N) : degreeZeroComplex M ⟶ degreeZeroComplex N := by sorry
def wittPointQuotientMap (p : ℕ) (k : Type) [Fact p.Prime] [Field k] [CharP k p]
    [PerfectRing k p] (n : ℕ) : wittPointLevel p k (n+1) ⟶ wittPointLevel p k n := by sorry
theorem wittPointQuotientMap_mk (p : ℕ) (k : Type) [Fact p.Prime] [Field k] [CharP k p]
    [PerfectRing k p] (n : ℕ) (x : WittVector p k) :
    wittPointQuotientMap p k n (Ideal.Quotient.mk _ x) = Ideal.Quotient.mk _ x := by sorry
theorem wittPointTower_transition (p : ℕ) (k : Type) [Fact p.Prime] [Field k] [CharP k p]
    [PerfectRing k p] (n : ℕ) :
    (wittPointTower p k).map (homOfLE (Nat.le_succ n)).op ≫ (wittPointTower_level p k n).hom =
    (wittPointTower_level p k (n+1)).hom ≫ degreeZeroComplexMap (wittPointQuotientMap p k n) := by sorry
def zeroTower (A : Type) [CommRing A] : LogDerivedTower A :=
  (Functor.const _).obj (degreeZeroComplex (ModuleCat.of A PUnit))
-- Test: TauCeti.LogCrystalline.pAdicLogCrystalline.witt_point
example (p : ℕ) (k : Type) [Fact p.Prime] [Field k] [CharP k p] [PerfectRing k p] :
    logH (pAdicLogCrystalline (wittPointTower p k)) 0 ≅ ModuleCat.of (WittVector p k) (WittVector p k) := by sorry
-- Test: TauCeti.LogCrystalline.pAdicLogCrystalline.zero_coefficients
example {A : Type} [CommRing A] : Limits.IsZero (pAdicLogCrystalline (zeroTower A)) := by sorry
def roosDelta (p : ℕ) : (ℕ → ℤ) →ₗ[ℤ] (ℕ → ℤ) where
  toFun x n := x n - (p : ℤ) * x (n+1)
  map_add' := by sorry
  map_smul' := by sorry
def padicIntegerImage (p : ℕ) [Fact p.Prime] : AddSubgroup (PadicInt p) := (Int.castAddHom (PadicInt p)).range
-- Test: TauCeti.LogCrystalline.pAdicLogCrystalline.lim_one
example (p : ℕ) [Fact p.Prime] : LinearMap.ker (roosDelta p) = ⊥ ∧
    Nonempty (((ℕ → ℤ) ⧸ LinearMap.range (roosDelta p)) ≃+ (PadicInt p ⧸ padicIntegerImage p)) := by sorry

structure PDivisibleLogLiftInput where
  A : CommRingCat.{0}
  ideal : Ideal A
  delta : DividedPowers ideal
  p : ℕ
  [prime : Fact p.Prime]
  nilpotentP : ∃ n : ℕ, 0 < n ∧ (p : A)^n = 0
  pInIdeal : (p : A) ∈ ideal
  log : LogStructure (A ⧸ ideal)
  integral : IsIntegralMonoid log.monoid
  chart : LogChart log
  pDivisible : Function.Bijective (fun x : characteristicMonoid log => x^p)
attribute [instance] PDivisibleLogLiftInput.prime
structure LogLift (I : PDivisibleLogLiftInput) where
  lifted : LogStructure I.A
  integral : IsIntegralMonoid lifted.monoid
  reduction : (logPullback (Ideal.Quotient.mk I.ideal) lifted).monoid ≃* I.log.monoid
  reductionStructural : ∀ m, I.log.structureMap (reduction m) =
    (logPullback (Ideal.Quotient.mk I.ideal) lifted).structureMap m
structure LogLiftIso {I : PDivisibleLogLiftInput} (L L' : LogLift I) where
  monoidIso : L.lifted.monoid ≃* L'.lifted.monoid
  structural : ∀ m, L'.lifted.structureMap (monoidIso m) = L.lifted.structureMap m
  reductionCompatible : ∀ m, L'.reduction
    (logPullback.of (Ideal.Quotient.mk I.ideal) L'.lifted (monoidIso m)) =
      L.reduction (logPullback.of (Ideal.Quotient.mk I.ideal) L.lifted m)
def uniquePDivisible_logLift (I : PDivisibleLogLiftInput) : LogLift I := by sorry
abbrev uniquePDivisible_logLift.unique (I : PDivisibleLogLiftInput) (L : LogLift I) :
    Unique (LogLiftIso (uniquePDivisible_logLift I) L) := by sorry
-- Tests use actual p-nilpotent PD inputs, not arbitrary rings with a chart.
def rationalLogLiftInput (p : ℕ) [Fact p.Prime] : PDivisibleLogLiftInput := by sorry
def trivialLogLiftInput (p : ℕ) [Fact p.Prime] : PDivisibleLogLiftInput := by sorry
-- Test: TauCeti.LogCrystalline.uniquePDivisible_logLift.rational_chart
example (p : ℕ) [Fact p.Prime] :
    Nonempty (characteristicMonoid (uniquePDivisible_logLift (rationalLogLiftInput p)).lifted ≃*
      Multiplicative ℚ≥0) := by sorry
-- Test: TauCeti.LogCrystalline.uniquePDivisible_logLift.trivial
example (p : ℕ) [Fact p.Prime] :
    Subsingleton (characteristicMonoid (uniquePDivisible_logLift (trivialLogLiftInput p)).lifted) := by sorry
-- Test: TauCeti.LogCrystalline.uniquePDivisible_logLift.nondivisible_warning
example (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (fun x : Multiplicative ℕ => x^p) := by sorry

-- R06.1/AI.0:integral input: completion of an algebraic closure with its norm.
-- Algebraic elements are dense; the completed field itself need not be algebraic.
structure GeometricCoefficientFrame (F : ArithmeticFrame) where
  C : Type
  [normed : NormedField C]
  [complete : CompleteSpace C]
  [algClosed : IsAlgClosed C]
  [algebra : Algebra F.K C]
  nonarchimedean : ∀ x y : C, ‖x+y‖ ≤ max ‖x‖ ‖y‖
  embeddingIsometric : ∀ a : F.K, ‖algebraMap F.K C a‖ = ‖a‖
  denseAlgebraic : Dense {c : C | IsAlgebraic F.K c}
attribute [instance] GeometricCoefficientFrame.normed GeometricCoefficientFrame.complete
  GeometricCoefficientFrame.algClosed GeometricCoefficientFrame.algebra
def geometricIntegers {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) : Subring G.C where
  carrier := {x | ‖x‖ ≤ 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry
instance geometricIntegersDomain {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) :
    IsDomain (geometricIntegers G) := by sorry
-- Test: TauCeti.LogCrystalline.valuationLog.dvr
example (F : ArithmeticFrame) :
    Nonempty ((valuationLog F.O).monoid ≃* (associatedLog (natChart F.uniformizer)).monoid) ∧
      Nonempty (characteristicMonoid (valuationLog F.O) ≃* Multiplicative ℕ) := by sorry
-- Test: TauCeti.LogCrystalline.valuationLog.completed_algebraic_closure
example {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) :
    characteristicMonoid (valuationLog (geometricIntegers G)) ≃* Multiplicative ℚ≥0 := by sorry
-- Test: TauCeti.LogCrystalline.valuationLog.residue_not_trivial
example (F : ArithmeticFrame) :
    ¬ Subsingleton (characteristicMonoid (logPullback F.residue (valuationLog F.O))) := by sorry
-- Common ring, theta and phi are imports from CR.0. AI.0:integral supplies
-- integral tilt/sharp and Teichmuller charts; this file only plans their log use.
def commonACris {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) : CommRingCat.{0} := by sorry
def aCrisTheta {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) :
    commonACris G →+* geometricIntegers G := by sorry
def aCrisPhi {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) :
    commonACris G →+* commonACris G := by sorry
def aCrisFiniteRing {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) (n : ℕ) :
    CommRingCat.{0} := CommRingCat.of (commonACris G ⧸ Ideal.span {(F.p : commonACris G)^n})
def geometricModPLog {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) :
    LogStructure (geometricIntegers G ⧸ Ideal.span {(F.p : geometricIntegers G)}) :=
  logPullback (Ideal.Quotient.mk _) (valuationLog (geometricIntegers G))
def aCrisLiftInput {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) : PDivisibleLogLiftInput := by sorry
theorem aCrisLiftInput_ring {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) : (aCrisLiftInput G n hn).A = aCrisFiniteRing G n := by sorry
def aCrisLog {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) : LogStructure (aCrisFiniteRing G n) := by sorry
def aCrisLiftView {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) : LogLift (aCrisLiftInput G n hn) where
  lifted := logPullback (eqToHom (aCrisLiftInput_ring G n hn).symm).hom (aCrisLog G n hn)
  integral := by sorry
  reduction := by sorry
  reductionStructural := by sorry
def aCrisLog_identifiesUniqueLift {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) :
    LogLiftIso (uniquePDivisible_logLift (aCrisLiftInput G n hn)) (aCrisLiftView G n hn) := by sorry
def aCrisFiniteTheta {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) : aCrisFiniteRing G n →+*
    (geometricIntegers G ⧸ Ideal.span {(F.p : geometricIntegers G)}) := by sorry
def aCrisFinitePhi {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) (n : ℕ) :
    aCrisFiniteRing G n →+* aCrisFiniteRing G n := by sorry
def aCrisReductionComparison {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) :
    (logPullback (aCrisFiniteTheta G n hn) (aCrisLog G n hn)).monoid ≃*
      (geometricModPLog G).monoid := by sorry
theorem aCrisLiftInput_ideal {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) :
    (aCrisLiftInput G n hn).ideal = Ideal.comap
      (eqToHom (aCrisLiftInput_ring G n hn)).hom
      (RingHom.ker (aCrisFiniteTheta G n hn)) := by sorry
structure ACrisFineApproximation {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) (Q : CommMonCat.{0}) (c : Q →* (geometricModPLog G).monoid) where
  chart : Q →* (aCrisLog G n hn).monoid
  reduces : ∀ q, aCrisReductionComparison G n hn
    (logPullback.of (aCrisFiniteTheta G n hn) (aCrisLog G n hn) (chart q)) = c q
  comparison : LogHom (associatedLog ((aCrisLog G n hn).structureMap.comp chart)) (aCrisLog G n hn)
namespace aCrisLog
 def finite_lift {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) (n : ℕ) (hn : 0 < n) :
    (logPullback (aCrisFiniteTheta G n hn) (aCrisLog G n hn)).monoid ≃*
      (geometricModPLog G).monoid := by sorry
 def frobenius {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) (n : ℕ) (hn : 0 < n) :
    LogHom (logPullback (aCrisFinitePhi G n) (aCrisLog G n hn)) (aCrisLog G n hn) := by sorry
 theorem fine_chart_comparison {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (n : ℕ) (hn : 0 < n) (Q : CommMonCat.{0}) (hQ : IsFineMonoid Q)
    (c : Q →* (geometricModPLog G).monoid) :
    Nonempty (ACrisFineApproximation G n hn Q c) := by sorry
end aCrisLog
-- Test: TauCeti.LogCrystalline.aCrisLog.rational_characteristic
example {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) (n : ℕ) (hn : 0 < n) :
    characteristicMonoid (aCrisLog G n hn) ≃* Multiplicative ℚ≥0 := by sorry
-- Test: TauCeti.LogCrystalline.aCrisLog.trivial_units
example {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) (n : ℕ) (hn : 0 < n)
    (a : (aCrisFiniteRing G n)ˣ) :
    characteristicMonoid.quotient (aCrisLog G n hn)
      (characteristicMonoid.logUnits (aCrisLog G n hn) a) = 1 := by sorry
-- Test: TauCeti.LogCrystalline.aCrisLog.not_fine
example {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) (n : ℕ) (hn : 0 < n) :
    ¬ IsFineMonoid (characteristicMonoid (aCrisLog G n hn)) := by sorry

instance coefficientFieldAlgebra (F : ArithmeticFrame) : Algebra F.K0 F.K :=
  F.coefficientEmbedding.toAlgebra
-- CR.4 supplies truncated Witt rings, quotient maps and canonical PD ideals.
def truncatedWittRing (F : ArithmeticFrame) (n : ℕ) : CommRingCat.{0} :=
  CommRingCat.of (WittVector F.p F.k ⧸ Ideal.span {(F.p : WittVector F.p F.k)^n})
def logWittBase (F : ArithmeticFrame) (n : ℕ) (hn : 0 < n) : LogPDBase := by sorry
theorem logWittBase_ring (F : ArithmeticFrame) (n : ℕ) (hn : 0 < n) :
    (logWittBase F n hn).ring = truncatedWittRing F n := by sorry
def completedLogWittBase (F : ArithmeticFrame) : LogStructure (WittVector F.p F.k) :=
  associatedLog (natChart (0 : WittVector F.p F.k))
namespace logWittBase
 theorem chart (F : ArithmeticFrame) :
    natChart (0 : WittVector F.p F.k) (Multiplicative.ofAdd 1) = 0 := by sorry
 theorem frobenius (F : ArithmeticFrame) (n : ℕ) :
    WittVector.frobenius (natChart (0 : WittVector F.p F.k) (Multiplicative.ofAdd n)) =
      natChart (0 : WittVector F.p F.k) (Multiplicative.ofAdd (F.p*n)) := by sorry
 def reduce (F : ArithmeticFrame) (n : ℕ) (hn : 0 < n) :
    standardLogPoint F.k ⟶ (logWittBase F n hn).object := by sorry
end logWittBase
-- Test: TauCeti.LogCrystalline.logWittBase.length_one
example (F : ArithmeticFrame) : (logWittBase F 1 (by omega)).object ≅ standardLogPoint F.k := by sorry
-- Test: TauCeti.LogCrystalline.logWittBase.relative_identity
example (F : ArithmeticFrame) :
    Subsingleton (logDifferentials F.k F.k (Multiplicative ℕ) (Multiplicative ℕ)
      (natChart (0 : F.k)) (MonoidHom.id _)) := by sorry
-- Test: TauCeti.LogCrystalline.logWittBase.not_p_chart
example (F : ArithmeticFrame) (n : ℕ) (hn : 1 < n) :
    natChart (0 : truncatedWittRing F n) ≠ natChart (F.p : truncatedWittRing F n) := by sorry

structure HKSpace (F : ArithmeticFrame) where
  object : LogScheme
  structureMap : object ⟶ standardLogPoint F.k
  fine : IsFineLog object
  integral : IsIntegralLog object
  smooth : IsLogSmooth structureMap
  characteristic : InCharacteristic F.p object
  cartier : IsCartierType F.p structureMap characteristic (by sorry)
def hkFiniteSource {F : ArithmeticFrame} (X : HKSpace F) (n : ℕ) (hn : 0 < n) :
    LogOverPDBase (logWittBase F n hn) := by sorry
def hkCrystallineTower {F : ArithmeticFrame} (X : HKSpace F) :
    LogDerivedTower (WittVector F.p F.k) := by sorry
-- Restrict the finite crystalline complex along W(k) -> W_{n+1}(k).
def wittDerivedRestriction (F : ArithmeticFrame) (n : ℕ) (hn : 0 < n) :
    LogDerived (logWittBase F n hn).ring ⥤ LogDerived (WittVector F.p F.k) := by sorry
def hkCrystallineTower_level {F : ArithmeticFrame} (X : HKSpace F) (n : ℕ) :
    (derivedTower (hkCrystallineTower X)).obj (Opposite.op n) ≅
      (wittDerivedRestriction F (n+1) (by omega)).obj
        (logCrystallineCohomology _ (hkFiniteSource X (n+1) (by omega))
          (structureCrystal _ _)) := by sorry
def integralHK {F : ArithmeticFrame} (X : HKSpace F) : LogDerived (WittVector F.p F.k) :=
  pAdicLogCrystalline (hkCrystallineTower X)
def hkPoint (F : ArithmeticFrame) : HKSpace F := by sorry
structure HKMorphism {F : ArithmeticFrame} (X Y : HKSpace F) where
  map : X.object ⟶ Y.object
  overBase : map ≫ Y.structureMap = X.structureMap
-- Base-change of embeddings uses compatible simplicial log maps and actual PD
-- stalk operations, rather than an arbitrary isomorphism of total complexes.
def IsPDLevelMap {B B' : LogPDBase} {Z : LogOverPDBase B} {Z' : LogOverPDBase B'}
    (E : LogEmbeddingSystem B Z) (E' : LogEmbeddingSystem B' Z')
    (a : E.ambient ⟶ E'.ambient) : Prop := ∀ n,
  ∀ (x : LogGeometricPoint (E.thickening n).ambient.object) j b,
  b ∈ thickeningStalkIdeal (E'.thickening n)
    (mappedGeometricPoint (eqToHom (E.ambientIdentification n) ≫ a.app n ≫
      eqToHom (E'.ambientIdentification n).symm) x) →
  geometricStalkRingMap (eqToHom (E.ambientIdentification n) ≫ a.app n ≫
      eqToHom (E'.ambientIdentification n).symm) x
    ((thickeningStalkPD (E'.thickening n)
      (mappedGeometricPoint (eqToHom (E.ambientIdentification n) ≫ a.app n ≫
        eqToHom (E'.ambientIdentification n).symm) x)).dpow j b) =
    (thickeningStalkPD (E.thickening n) x).dpow j
      (geometricStalkRingMap (eqToHom (E.ambientIdentification n) ≫ a.app n ≫
        eqToHom (E'.ambientIdentification n).symm) x b)
structure EmbeddingLevelReduction {B B' : LogPDBase} {Z : LogOverPDBase B} {Z' : LogOverPDBase B'}
    (E : LogEmbeddingSystem B Z) (E' : LogEmbeddingSystem B' Z') where
  source : E.source ⟶ E'.source
  ambient : E.ambient ⟶ E'.ambient
  square : E.embedding ≫ ambient = source ≫ E'.embedding
  pd : IsPDLevelMap E E' ambient
structure HKEmbeddingSystem {F : ArithmeticFrame} (X : HKSpace F) where
  level : ∀ n, LogEmbeddingSystem (logWittBase F (n+1) (by omega))
    (hkFiniteSource X (n+1) (by omega))
  reduction : ∀ n, EmbeddingLevelReduction (level n) (level (n+1))
def completedHKEmbeddingTotal {F : ArithmeticFrame} {X : HKSpace F}
    (E : HKEmbeddingSystem X) : LogDerived (WittVector F.p F.k) := by sorry
-- Reduction maps point from the smaller closed ambient to the larger one;
-- their induced section maps run from level n+1 to n.
instance wittResidueModule (F : ArithmeticFrame) : Module (WittVector F.p F.k) F.k := by sorry
def hkPointModPTower (F : ArithmeticFrame) : LogDerivedTower (WittVector F.p F.k) :=
  (Functor.const _).obj (degreeZeroComplex (ModuleCat.of (WittVector F.p F.k) F.k))
namespace integralHK
 def finite_level {F : ArithmeticFrame} (X : HKSpace F) (n : ℕ) :
    integralHK X ⟶ (derivedTower (hkCrystallineTower X)).obj (Opposite.op n) := pAdicLogCrystalline.level_maps _ n
 def embedding_model {F : ArithmeticFrame} (X : HKSpace F)
    (E : HKEmbeddingSystem X) : integralHK X ≅ completedHKEmbeddingTotal E := by sorry
 def pullback {F : ArithmeticFrame} {X Y : HKSpace F} (f : HKMorphism X Y) :
    integralHK Y ⟶ integralHK X := by sorry
end integralHK
-- Test: TauCeti.LogCrystalline.integralHK.point
example (F : ArithmeticFrame) :
    logH (integralHK (hkPoint F)) 0 ≅ ModuleCat.of (WittVector F.p F.k) (WittVector F.p F.k) := by sorry
-- Test: TauCeti.LogCrystalline.integralHK.zero_cohomology
example (F : ArithmeticFrame) (q : ℤ) (hq : 0 < q) :
    Limits.IsZero (logH (integralHK (hkPoint F)) q) := by sorry
-- Test: TauCeti.LogCrystalline.integralHK.torsion_retained
example (F : ArithmeticFrame) :
    Nonempty ((ModuleCat.of (WittVector F.p F.k) F.k) ≅
      logH (pAdicLogCrystalline (hkPointModPTower F)) 0) ∧
    ¬ Subsingleton (logH (pAdicLogCrystalline (hkPointModPTower F)) 0) := by sorry

-- CR.3/E1 exact derived scalar extension along this W(k) -> K0.
def rationalHKScalar (F : ArithmeticFrame) :
    LogDerived (WittVector F.p F.k) ⥤ LogDerived F.K0 := by sorry
def rationalHK {F : ArithmeticFrame} (X : HKSpace F) : LogDerived F.K0 :=
  (rationalHKScalar F).obj (integralHK X)
namespace rationalHK
 def cohomology {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ) :
    (ModuleCat.extendScalars (algebraMap (WittVector F.p F.k) F.K0)).obj
      (logH (integralHK X) q) ≅ logH (rationalHK X) q := by sorry
 def map {F : ArithmeticFrame} {X Y : HKSpace F} (f : HKMorphism X Y) :
    rationalHK Y ⟶ rationalHK X := (rationalHKScalar F).map (integralHK.pullback f)
 theorem torsion_killed {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ) (n : ℕ)
    (m : logH (integralHK X) q) (hm : (F.p : WittVector F.p F.k)^n • m = 0) :
    (1 : F.K0) ⊗ₜ[WittVector F.p F.k] m = 0 := by sorry
end rationalHK
-- Test: TauCeti.LogCrystalline.rationalHK.point
example (F : ArithmeticFrame) : logH (rationalHK (hkPoint F)) 0 ≅ ModuleCat.of F.K0 F.K0 := by sorry
-- Test: TauCeti.LogCrystalline.rationalHK.p_torsion
example (F : ArithmeticFrame) : Limits.IsZero
    ((rationalHKScalar F).obj (pAdicLogCrystalline (hkPointModPTower F))) := by sorry
-- Test: TauCeti.LogCrystalline.rationalHK.integral_not_iso
example (F : ArithmeticFrame) : ¬ Function.Injective
    (fun x : F.k => (1 : F.K0) ⊗ₜ[WittVector F.p F.k] x) := by sorry

def hkPointBasis (F : ArithmeticFrame) : logH (rationalHK (hkPoint F)) 0 ≃ₗ[F.K0] F.K0 := by sorry
def hkLogFormFrobenius (F : ArithmeticFrame) (q : ℕ) : F.K0 →ₛₗ[F.sigma.toRingHom] F.K0 where
  toFun a := (F.p : F.K0)^q * F.sigma a
  map_add' := by sorry
  map_smul' := by sorry
def rationalHKEmbeddingTotal {F : ArithmeticFrame} {X : HKSpace F}
    (E : HKEmbeddingSystem X) : LogDerived F.K0 := (rationalHKScalar F).obj (completedHKEmbeddingTotal E)
def hkEmbeddingComparison {F : ArithmeticFrame} {X : HKSpace F}
    (E E' : HKEmbeddingSystem X) (q : ℤ) :
    logH (rationalHKEmbeddingTotal E) q ≃ₗ[F.K0] logH (rationalHKEmbeddingTotal E') q := by sorry
def hkEmbeddingBoundary {F : ArithmeticFrame} {X : HKSpace F}
    (E : HKEmbeddingSystem X) (q : ℤ) :
    Module.End F.K0 (logH (rationalHKEmbeddingTotal E) q) := by sorry

def semistableClosedFibre (F : ArithmeticFrame) (X : LogScheme)
    (f : X ⟶ affineLogScheme (natChart F.uniformizer)) : LogScheme := by sorry
def semistableClosedMap (F : ArithmeticFrame) (X : LogScheme)
    (f : X ⟶ affineLogScheme (natChart F.uniformizer)) :
    semistableClosedFibre F X f ⟶ standardLogPoint F.k := by sorry
def IsSemistableSpecialCartier (F : ArithmeticFrame) (X : LogScheme)
    (f : X ⟶ affineLogScheme (natChart F.uniformizer)) : Prop :=
  IsCartierType F.p (semistableClosedMap F X f) (by sorry) (by sorry)
-- Genuine semistable O-models determine both special and generic fibres.
structure SemistableModel (F : ArithmeticFrame) where
  object : LogScheme
  structureMap : object ⟶ affineLogScheme (natChart F.uniformizer)
  fine : IsFineLog object
  integral : IsIntegralLog object
  smooth : IsLogSmooth structureMap
  vertical : ∀ x : LogGeometricPoint object, IsVertical (logStalkHom structureMap x)
  flat : Flat (logUnderlying structureMap)
  finitePresentation : LocallyOfFinitePresentation (logUnderlying structureMap)
  cartierSpecial : IsSemistableSpecialCartier F object structureMap
abbrev Uniformizer (F : ArithmeticFrame) :=
  {a : F.O // Ideal.span {a} = IsLocalRing.maximalIdeal F.O}
def semistableSpecial {F : ArithmeticFrame} (M : SemistableModel F) : HKSpace F := by sorry
def semistableGeneric {F : ArithmeticFrame} (M : SemistableModel F) : Scheme.{0} := by sorry
def genericDeRham {F : ArithmeticFrame} (M : SemistableModel F) : LogDerived F.K := by sorry
def hkScalarToK (F : ArithmeticFrame) : LogDerived F.K0 ⥤ LogDerived F.K := by sorry
structure SemistableMorphism {F : ArithmeticFrame} (M M' : SemistableModel F) where
  map : M.object ⟶ M'.object
  overBase : map ≫ M'.structureMap = M.structureMap
def GoodReduction {F : ArithmeticFrame} (M : SemistableModel F) : Prop :=
  IsStrict M.structureMap ∧ Smooth (logUnderlying M.structureMap)
def CompactLogSpace {F : ArithmeticFrame} (X : HKSpace F) : Prop :=
  QuasiCompact (logUnderlying X.structureMap) ∧ QuasiSeparated (logUnderlying X.structureMap)
def semistableSpecialMap {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M M') : HKMorphism (semistableSpecial M) (semistableSpecial M') := by sorry
def genericDeRhamPullback {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M M') : genericDeRham M' ⟶ genericDeRham M := by sorry
def genericLogDeRham {F : ArithmeticFrame} (M : SemistableModel F) : LogDerived F.K := by sorry
def ordinaryGoodReductionCrystalline {F : ArithmeticFrame} (M : SemistableModel F)
    (h : GoodReduction M) : LogDerived F.K0 := by sorry
-- Elliptic/Tate geometry is supplied by E3; CR.6 owns the valuation/residue
-- identification with its log crystalline H1, not the downstream R06.5 stage.
def tateGenericCurve (F : ArithmeticFrame) (q : F.K) (hq : 0 < ‖q‖ ∧ ‖q‖ < 1) : Scheme.{0} := by sorry
structure TateSemistableModel (F : ArithmeticFrame) where
  model : SemistableModel F
  proper : IsProper (logUnderlying model.structureMap)
  parameter : F.K
  small : 0 < ‖parameter‖ ∧ ‖parameter‖ < 1
  valuation : ℕ
  positive : 0 < valuation
  normalizedValuation : ‖parameter‖ = ‖algebraMap F.O F.K F.uniformizer‖^valuation
  genericIdentification : semistableGeneric model ≅ tateGenericCurve F parameter small
def TateSemistableModel.special {F : ArithmeticFrame} (t : TateSemistableModel F) : HKSpace F :=
  semistableSpecial t.model
def tateHKBasis {F : ArithmeticFrame} (t : TateSemistableModel F) :
    logH (rationalHK t.special) 1 ≃ₗ[F.K0] (Fin 2 → F.K0) := by sorry
def tateSemilinearPhi (F : ArithmeticFrame) : (Fin 2 → F.K0) →ₛₗ[F.sigma.toRingHom] (Fin 2 → F.K0) := by sorry
-- Raw operators are independently constructed from crystalline Frobenius and
-- the right-wedge distinguished triangle; their relation is a theorem below.
def hkFrobenius {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ) :
    logH (rationalHK X) q →ₛₗ[F.sigma.toRingHom] logH (rationalHK X) q := by sorry
def hkMonodromy {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ) :
    Module.End F.K0 (logH (rationalHK X) q) := by sorry
def hkRightWedgeBoundary {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ) :
    Module.End F.K0 (logH (rationalHK X) q) := by sorry
namespace hkFrobenius
 theorem semilinear {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ)
    (a : F.K0) (x : logH (rationalHK X) q) :
    hkFrobenius X q (a • x) = F.sigma a • hkFrobenius X q x := by sorry
 def linearization {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ) :
    (ModuleCat.extendScalars F.sigma.toRingHom).obj (logH (rationalHK X) q) ⟶
      logH (rationalHK X) q := by sorry
 theorem forms (F : ArithmeticFrame) (q : ℕ) (a : F.K0) :
    hkLogFormFrobenius F q a = (F.p : F.K0)^q * F.sigma a := by sorry
end hkFrobenius
-- Test: TauCeti.LogCrystalline.hkFrobenius.point
example (F : ArithmeticFrame) (a : F.K0) :
    hkPointBasis F (hkFrobenius (hkPoint F) 0 ((hkPointBasis F).symm a)) = F.sigma a := by sorry
-- Test: TauCeti.LogCrystalline.hkFrobenius.log_one_form
example (F : ArithmeticFrame) : hkLogFormFrobenius F 1 1 = (F.p : F.K0) := by sorry
-- Test: TauCeti.LogCrystalline.hkFrobenius.not_linear
example (F : ArithmeticFrame) (a : F.k) (ha : a^F.p ≠ a) :
    WittVector.frobenius (WittVector.teichmuller F.p a) ≠
      WittVector.teichmuller F.p a * WittVector.frobenius 1 := by sorry
namespace hkMonodromy
 theorem boundary {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ) :
    hkMonodromy X q = hkRightWedgeBoundary X q := by sorry
 theorem linear {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ)
    (a : F.K0) (x : logH (rationalHK X) q) :
    hkMonodromy X q (a • x) = a • hkMonodromy X q x := by sorry
 theorem embedding_independence {F : ArithmeticFrame} (X : HKSpace F)
    (E E' : HKEmbeddingSystem X) (q : ℤ) (x : logH (rationalHKEmbeddingTotal E) q) :
    hkEmbeddingComparison E E' q (hkEmbeddingBoundary E q x) =
      hkEmbeddingBoundary E' q (hkEmbeddingComparison E E' q x) := by sorry
end hkMonodromy
-- The matrix is a test target; geometric Tate identification is stated below,
-- and the valuation/residue proof remains the explicitly recorded CR.6 gap.
def tateN {K : Type} [Field K] (n : K) : (Fin 2 → K) →ₗ[K] (Fin 2 → K) := by sorry
def e₀ {K : Type} [Field K] : Fin 2 → K := Pi.single 0 1
def e₁ {K : Type} [Field K] : Fin 2 → K := Pi.single 1 1
-- Test: TauCeti.LogCrystalline.hkMonodromy.point
example (F : ArithmeticFrame) : hkMonodromy (hkPoint F) 0 = 0 := by sorry
-- Test: TauCeti.LogCrystalline.hkMonodromy.tate_block
example (F : ArithmeticFrame) (t : TateSemistableModel F) :
    tateHKBasis t (hkMonodromy t.special 1 ((tateHKBasis t).symm e₁)) =
      (t.valuation : F.K0) • e₀ ∧
    tateHKBasis t (hkMonodromy t.special 1 ((tateHKBasis t).symm e₀)) = 0 := by sorry
-- Test: TauCeti.LogCrystalline.hkMonodromy.wedge_sign
example : (-tateN (1 : ℚ)) e₁ = -e₀ ∧ tateN (1 : ℚ) e₁ = e₀ ∧ (-e₀ : Fin 2 → ℚ) ≠ e₀ := by sorry

theorem monodromy_frobenius {F : ArithmeticFrame} (X : HKSpace F) (q : ℤ)
    (x : logH (rationalHK X) q) :
    hkMonodromy X q (hkFrobenius X q x) = (F.p : F.K0) • hkFrobenius X q (hkMonodromy X q x) := by sorry
theorem hk_finite_frobenius_isogeny {F : ArithmeticFrame} (X : HKSpace F)
    (hp : IsProper (logUnderlying X.structureMap)) (q : ℤ) :
    Module.Finite F.K0 (logH (rationalHK X) q) ∧ Function.Bijective (hkFrobenius X q) := by sorry
theorem hk_monodromy_nilpotent {F : ArithmeticFrame} (X : HKSpace F)
    (hp : IsProper (logUnderlying X.structureMap)) (q : ℤ) :
    (hkMonodromy X q)^(Module.finrank F.K0 (logH (rationalHK X) q)) = 0 := by sorry
-- CR.4 owns the log Witt extension; its geometrically indexed cohomology.
def logWittCohomology {F : ArithmeticFrame} (X : HKSpace F) : LogDerived (WittVector F.p F.k) := by sorry
def hk_logWitt_model {F : ArithmeticFrame} (X : HKSpace F) :
    integralHK X ≅ logWittCohomology X := by sorry

-- R06.1 normalizes the log by the actual Witt/Teichmuller section and the
-- convergent principal-unit series in this complete DVR field.
def teichmullerUnit (F : ArithmeticFrame) (a : F.kˣ) : F.Oˣ := by sorry
def unitLog (F : ArithmeticFrame) : F.Oˣ →* Multiplicative F.K := by sorry
namespace unitLog
 theorem mul (F : ArithmeticFrame) (u v : F.Oˣ) :
    (unitLog F (u*v)).toAdd = (unitLog F u).toAdd + (unitLog F v).toAdd := by sorry
 theorem teichmuller (F : ArithmeticFrame) (a : F.kˣ) : (unitLog F (teichmullerUnit F a)).toAdd = 0 := by sorry
 theorem principal_series (F : ArithmeticFrame) (u : F.Oˣ)
    (h : F.residue u = 1) : HasSum
      (fun n : ℕ => (-1 : F.K)^n *
        (algebraMap F.O F.K u - 1)^(n+1) / (n+1 : F.K)) (unitLog F u).toAdd := by sorry
end unitLog
-- Test: TauCeti.LogCrystalline.unitLog.one
example (F : ArithmeticFrame) : (unitLog F 1).toAdd = 0 := by sorry
-- Test: TauCeti.LogCrystalline.unitLog.teichmuller_unit
example (F : ArithmeticFrame) (a : F.kˣ) : (unitLog F (teichmullerUnit F a)).toAdd = 0 := by sorry
-- Test: TauCeti.LogCrystalline.unitLog.principal_unit
example (F : ArithmeticFrame) (u : F.Oˣ) (h : F.residue u = 1) :
    HasSum (fun n : ℕ => (-1 : F.K)^n * (algebraMap F.O F.K u - 1)^(n+1) / (n+1 : F.K))
      (unitLog F u).toAdd := by sorry

-- Test: TauCeti.LogCrystalline.unitLog.torsion
example (F : ArithmeticFrame) (u : F.Oˣ) (n : ℕ) (hn : 0 < n) (hu : u^n = 1) :
    (unitLog F u).toAdd = 0 := by sorry
-- Test: TauCeti.LogCrystalline.unitLog.branch_warning
example (F : ArithmeticFrame) (c : F.K) (hc : c ≠ 0) (pi : F.Kˣ)
    (v : F.Kˣ →* Multiplicative ℤ) (hv : (v pi).toAdd = 1)
    (ell : F.Kˣ →* Multiplicative F.K) :
    (ell pi).toAdd + c * ((v pi).toAdd : F.K) ≠ (ell pi).toAdd := by sorry
def hkComparisonMap {F : ArithmeticFrame} (M : SemistableModel F) (pi : Uniformizer F) :
    (hkScalarToK F).obj (rationalHK (semistableSpecial M)) ⟶ genericDeRham M := by sorry
def semistableBasePoint (F : ArithmeticFrame) : SemistableModel F where
  object := affineLogScheme (natChart F.uniformizer)
  structureMap := 𝟙 _
  fine := by sorry
  integral := by sorry
  smooth := by sorry
  vertical := by sorry
  flat := by sorry
  finitePresentation := by sorry
  cartierSpecial := by sorry
def hkBasePointDomainIso (F : ArithmeticFrame) :
    logH ((hkScalarToK F).obj (rationalHK (semistableSpecial (semistableBasePoint F)))) 0 ≃ₗ[F.K] F.K := by sorry
def hkBasePointTargetIso (F : ArithmeticFrame) :
    logH (genericDeRham (semistableBasePoint F)) 0 ≃ₗ[F.K] F.K := by sorry
def hkPointComparisonScalar (F : ArithmeticFrame) (pi : Uniformizer F) : F.K →+* F.K := by sorry
theorem hkPointComparisonScalar_map (F : ArithmeticFrame) (pi : Uniformizer F) (x : F.K) :
    hkPointComparisonScalar F pi x = hkBasePointTargetIso F
      ((DerivedCategory.homologyFunctor (ModuleCat.{0} F.K) 0).map
        (hkComparisonMap (semistableBasePoint F) pi) ((hkBasePointDomainIso F).symm x)) := by sorry
namespace hkComparisonMap
 theorem pullback {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M M') (pi : Uniformizer F) :
    hkComparisonMap M' pi ≫ genericDeRhamPullback f =
      (hkScalarToK F).map (rationalHK.map (semistableSpecialMap f)) ≫ hkComparisonMap M pi := by sorry
 def rational_domain {F : ArithmeticFrame} (M : SemistableModel F) : LogDerived F.K :=
    (hkScalarToK F).obj (rationalHK (semistableSpecial M))
 def generic_log {F : ArithmeticFrame} (M : SemistableModel F) :
    genericLogDeRham M ≅ genericDeRham M := by sorry
end hkComparisonMap
-- Test: TauCeti.LogCrystalline.hkComparisonMap.point
example (F : ArithmeticFrame) (pi : Uniformizer F) :
    hkPointComparisonScalar F pi = RingHom.id F.K := by sorry
-- Test: TauCeti.LogCrystalline.hkComparisonMap.good_reduction
example {F : ArithmeticFrame} (M : SemistableModel F)
    (h : GoodReduction M) (pi pi' : Uniformizer F) : hkComparisonMap M pi = hkComparisonMap M pi' := by sorry
-- Test: TauCeti.LogCrystalline.hkComparisonMap.integral_warning
example (F : ArithmeticFrame) : ¬ ∃ a : WittVector F.p F.k,
    algebraMap (WittVector F.p F.k) F.K0 a = (F.p : F.K0)⁻¹ := by sorry

theorem hyodoKato_comparison {F : ArithmeticFrame} (M : SemistableModel F)
    (hp : IsProper (logUnderlying M.structureMap)) (pi : Uniformizer F) : IsIso (hkComparisonMap M pi) := by sorry
def uniformizerUnitMul {F : ArithmeticFrame} (pi : Uniformizer F) (u : F.Oˣ) : Uniformizer F :=
  ⟨pi.val * u, by sorry⟩
def hkComparisonOnH {F : ArithmeticFrame} (M : SemistableModel F) (pi : Uniformizer F) (q : ℤ) :
    (F.K ⊗[F.K0] logH (rationalHK (semistableSpecial M)) q) →ₗ[F.K] logH (genericDeRham M) q := by sorry
def hkMonodromyScalar {F : ArithmeticFrame} (M : SemistableModel F) (q : ℤ) :
    Module.End F.K (F.K ⊗[F.K0] logH (rationalHK (semistableSpecial M)) q) := by sorry
theorem hyodoKato_uniformizer_change {F : ArithmeticFrame} (M : SemistableModel F)
    (hp : IsProper (logUnderlying M.structureMap)) (pi : Uniformizer F) (u : F.Oˣ) (q : ℤ) :
    hkComparisonOnH M (uniformizerUnitMul pi u) q = hkComparisonOnH M pi q ∘ₗ
      IsNilpotent.exp ((unitLog F u).toAdd • hkMonodromyScalar M q) := by sorry
-- Generic finite exponential is a baseline result, not a second log construction.
theorem hk_exp_formula {K M : Type} [Field K] [CharZero K] [AddCommGroup M]
    [Module K M] [Module ℚ (Module.End K M)] (N : Module.End K M) (a : K) (s : ℕ)
    (h : (a • N)^s = 0) : IsNilpotent.exp (a • N) =
    ∑ j ∈ Finset.range s, (j.factorial : ℚ)⁻¹ • (a • N)^j := by sorry
-- CR.3 owns ordinary products; these are its log PD-resolution adaptation.
def hkProduct {F : ArithmeticFrame} (X Y : HKSpace F) : HKSpace F := by sorry
def derivedTensor (A : Type) [CommRing A] : LogDerived A ⥤ LogDerived A ⥤ LogDerived A := by sorry
def hyodoKato_products {F : ArithmeticFrame} (X Y : HKSpace F)
    (hX : CompactLogSpace X) (hY : CompactLogSpace Y) :
    ((derivedTensor F.K0).obj (rationalHK X)).obj (rationalHK Y) ≅
      rationalHK (hkProduct X Y) := by sorry
def hkCup {F : ArithmeticFrame} (X Y : HKSpace F) (q r : ℤ) :
    logH (rationalHK X) q ⊗[F.K0] logH (rationalHK Y) r →ₗ[F.K0]
      logH (rationalHK (hkProduct X Y)) (q+r) := by sorry
theorem hyodoKato_products_operators {F : ArithmeticFrame} (X Y : HKSpace F)
    (q r : ℤ) (x : logH (rationalHK X) q) (y : logH (rationalHK Y) r) :
    hkMonodromy (hkProduct X Y) (q+r) (hkCup X Y q r (x ⊗ₜ[F.K0] y)) =
      hkCup X Y q r (hkMonodromy X q x ⊗ₜ[F.K0] y) +
        hkCup X Y q r (x ⊗ₜ[F.K0] hkMonodromy Y r y) ∧
    hkFrobenius (hkProduct X Y) (q+r) (hkCup X Y q r (x ⊗ₜ[F.K0] y)) =
      hkCup X Y q r (hkFrobenius X q x ⊗ₜ[F.K0] hkFrobenius Y r y) := by sorry
def semistableProduct {F : ArithmeticFrame} (M M' : SemistableModel F) : SemistableModel F := by sorry
def genericDeRhamCup {F : ArithmeticFrame} (M M' : SemistableModel F) (q r : ℤ) :
    logH (genericDeRham M) q ⊗[F.K] logH (genericDeRham M') r →ₗ[F.K]
      logH (genericDeRham (semistableProduct M M')) (q+r) := by sorry
-- The actual special-fibre product identification induces this scalar cup map.
def hkSemistableScalarCup {F : ArithmeticFrame} (M M' : SemistableModel F) (q r : ℤ) :
    (F.K ⊗[F.K0] logH (rationalHK (semistableSpecial M)) q) ⊗[F.K]
      (F.K ⊗[F.K0] logH (rationalHK (semistableSpecial M')) r) →ₗ[F.K]
      F.K ⊗[F.K0] logH (rationalHK (semistableSpecial (semistableProduct M M'))) (q+r) := by sorry
theorem hyodoKato_products_comparison {F : ArithmeticFrame} (M M' : SemistableModel F)
    (pi : Uniformizer F) (q r : ℤ)
    (x : F.K ⊗[F.K0] logH (rationalHK (semistableSpecial M)) q)
    (y : F.K ⊗[F.K0] logH (rationalHK (semistableSpecial M')) r) :
    hkComparisonOnH (semistableProduct M M') pi (q+r)
      (hkSemistableScalarCup M M' q r (x ⊗ₜ[F.K] y)) =
    genericDeRhamCup M M' q r (hkComparisonOnH M pi q x ⊗ₜ[F.K] hkComparisonOnH M' pi r y) := by sorry
theorem hyodoKato_goodReduction {F : ArithmeticFrame} (M : SemistableModel F)
    (h : GoodReduction M) :
    Nonempty (rationalHK (semistableSpecial M) ≅ ordinaryGoodReductionCrystalline M h) ∧
      ∀ q, hkMonodromy (semistableSpecial M) q = 0 := by sorry
theorem hyodoKato_tateCurve (F : ArithmeticFrame) (t : TateSemistableModel F) :
    (∀ x, tateHKBasis t (hkMonodromy t.special 1 x) = tateN (t.valuation : F.K0) (tateHKBasis t x)) ∧
    (∀ x, tateHKBasis t (hkFrobenius t.special 1 x) =
      tateSemilinearPhi F (tateHKBasis t x)) ∧
    hkMonodromy t.special 1 ≠ 0 ∧ (hkMonodromy t.special 1)^2 = 0 := by sorry

-- The family includes the properness used in Qian's proof on PDF pp.17--18.
def qianAffineBase (F : ArithmeticFrame) : Scheme.{0} :=
  Spec (CommRingCat.of (Polynomial (WittVector F.p F.k)))
def qianZeroSection (F : ArithmeticFrame) : Spec (CommRingCat.of (WittVector F.p F.k)) ⟶
    qianAffineBase F := by sorry
def qianOpenLogBase (F : ArithmeticFrame) (U : (qianAffineBase F).Opens) : LogScheme := by sorry
def qianModPSpecialFibre (F : ArithmeticFrame) (X : LogScheme)
    {U : (qianAffineBase F).Opens} (f : X ⟶ qianOpenLogBase F U) : LogScheme := by sorry
def qianSpecialMap (F : ArithmeticFrame) (X : LogScheme)
    {U : (qianAffineBase F).Opens} (f : X ⟶ qianOpenLogBase F U) :
    qianModPSpecialFibre F X f ⟶ standardLogPoint F.k := by sorry
structure QianLogFamily (F : ArithmeticFrame) where
  baseOpen : (qianAffineBase F).Opens
  containsZero : Set.range (qianZeroSection F).base ⊆ baseOpen
  object : LogScheme
  structureMap : object ⟶ qianOpenLogBase F baseOpen
  fine : IsFineLog object
  smooth : IsLogSmooth structureMap
  proper : IsProper (logUnderlying structureMap)
  cartier : IsCartierType F.p (qianSpecialMap F object structureMap) (by sorry) (by sorry)
def qianSpecial {F : ArithmeticFrame} (Y : QianLogFamily F) : HKSpace F := by sorry
def qianCompletedDeRham {F : ArithmeticFrame} (Y : QianLogFamily F) :
    LogDerived (WittVector F.p F.k) := by sorry
def qian_logFamily_comparison {F : ArithmeticFrame} (Y : QianLogFamily F) :
    rationalHK (qianSpecial Y) ≅ (rationalHKScalar F).obj (qianCompletedDeRham Y) := by sorry

-- These are RD.4 Part II supplier types, indexed by the actual special log
-- fibre. Their model/tube/topology and specialization functors are fixed here;
-- no arbitrary derived objects are parameters of a comparison.
def WeakFormalLogModel {F : ArithmeticFrame} (X : HKSpace F) : Type 1 := by sorry
def TubeEmbedding {F : ArithmeticFrame} (X : HKSpace F) : Type 1 := by sorry
def tubeModel {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) : WeakFormalLogModel X := by sorry
def tubeSite {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) : Type 1 := by sorry
instance tubeSiteCategory {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    Category.{0} (tubeSite E) := by sorry
def tubeTopology {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    GrothendieckTopology (tubeSite E) := by sorry
abbrev TubeSheaves {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :=
  Sheaf (tubeTopology E) (ModuleCat.{0} F.K0)
instance tubeSheavesAbelian {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    Abelian (TubeSheaves E) := by sorry
instance tubeSheavesDerived {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    HasDerivedCategory.{1} (TubeSheaves E) := HasDerivedCategory.standard _
abbrev TubeDerived {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) := DerivedCategory (TubeSheaves E)
abbrev SpecialSheaves {F : ArithmeticFrame} (X : HKSpace F) :=
  Sheaf (Scheme.smallEtaleTopology X.object.scheme) (ModuleCat.{0} F.K0)
instance specialSheavesAbelian {F : ArithmeticFrame} (X : HKSpace F) : Abelian (SpecialSheaves X) := by sorry
instance specialSheavesDerived {F : ArithmeticFrame} (X : HKSpace F) :
    HasDerivedCategory.{1} (SpecialSheaves X) := HasDerivedCategory.standard _
abbrev SpecialDerived {F : ArithmeticFrame} (X : HKSpace F) := DerivedCategory (SpecialSheaves X)
def derivedSpecialization {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    TubeDerived E ⥤ SpecialDerived X := by sorry
inductive LogFormBase | relative | absolute
def tubeFormComplex {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (b : LogFormBase) : TubeDerived E := by sorry
def convergentLogComplex {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (b : LogFormBase) : SpecialDerived X :=
  (derivedSpecialization E).obj (tubeFormComplex E b)
-- RD.4 refinements are admissible model maps over this common special fibre.
def TubeRefinementMap {F : ArithmeticFrame} {X : HKSpace F}
    (E E' : TubeEmbedding X) : Type 1 := by sorry
structure TubeEmbeddingRefinement {F : ArithmeticFrame} {X : HKSpace F}
    (E E' : TubeEmbedding X) where
  common : TubeEmbedding X
  left : TubeRefinementMap common E
  right : TubeRefinementMap common E'
def identityTubeRefinement {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) : TubeEmbeddingRefinement E E := by sorry
def convergentGlobalCohomology {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (b : LogFormBase) : LogDerived F.K0 := by sorry
def pointTubeEmbedding (F : ArithmeticFrame) : TubeEmbedding (hkPoint F) := by sorry
def unitDiscSpecial (F : ArithmeticFrame) : HKSpace F := by sorry
def unitDiscTubeEmbedding (F : ArithmeticFrame) : TubeEmbedding (unitDiscSpecial F) := by sorry
def tubeDegreeZeroSections {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) : ModuleCat.{0} F.K0 := by sorry
def overconvergentDegreeZeroSections {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) : Submodule F.K0 (tubeDegreeZeroSections E) := by sorry
-- On the closed unit disc this has coefficients p^(floor(sqrt(n))).
def unitDiscConvergentSection (F : ArithmeticFrame) :
    tubeDegreeZeroSections (unitDiscTubeEmbedding F) := by sorry
namespace convergentLogComplex
 def relative {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) : SpecialDerived X :=
    convergentLogComplex E .relative
 def absolute {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) : SpecialDerived X :=
    convergentLogComplex E .absolute
 def refinement {F : ArithmeticFrame} {X : HKSpace F} {E E' : TubeEmbedding X}
    (r : TubeEmbeddingRefinement E E') (b : LogFormBase) :
    convergentLogComplex E b ≅ convergentLogComplex E' b := by sorry
end convergentLogComplex
-- Test: TauCeti.LogCrystalline.convergentLogComplex.point
example (F : ArithmeticFrame) :
    convergentGlobalCohomology (pointTubeEmbedding F) .relative ≅ degreeZero (ModuleCat.of F.K0 F.K0) := by sorry

-- Test: TauCeti.LogCrystalline.convergentLogComplex.identity_refinement
example {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) (b : LogFormBase) :
    convergentLogComplex.refinement (identityTubeRefinement E) b =
      Iso.refl (convergentLogComplex E b) := by sorry
-- Test: TauCeti.LogCrystalline.convergentLogComplex.not_overconvergent_by_name
example (F : ArithmeticFrame) :
    unitDiscConvergentSection F ∉ overconvergentDegreeZeroSections (unitDiscTubeEmbedding F) := by sorry

-- The support kernel is applied on the quasi-etale tube site before Rs_*.
def tubeComplementRestriction {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) : TubeSheaves E ⥤ TubeSheaves E := by sorry
def tubeRestrictionUnit {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    𝟭 (TubeSheaves E) ⟶ tubeComplementRestriction E U := by sorry
def tubeProperSupport {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) : TubeSheaves E ⥤ TubeSheaves E := by sorry
def derivedTubeSupport {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) : TubeDerived E ⥤ TubeDerived E := by sorry
def specialFibreSupport {F : ArithmeticFrame} (X : HKSpace F)
    (U : X.object.scheme.Opens) : SpecialDerived X ⥤ SpecialDerived X := by sorry
namespace tubeProperSupport
 def kernel {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X)
    (U : X.object.scheme.Opens) (M : TubeSheaves E) :
    (tubeProperSupport E U).obj M ≅ Limits.kernel ((tubeRestrictionUnit E U).app M) := by sorry
 def whole {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    tubeProperSupport E ⊤ ≅ 𝟭 (TubeSheaves E) := by sorry
 def special_fibre_map {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X)
    (U : X.object.scheme.Opens) :
    derivedSpecialization E ⋙ specialFibreSupport X U ⟶
      derivedTubeSupport E U ⋙ derivedSpecialization E := by sorry
 theorem exact {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X)
    (U : X.object.scheme.Opens) : Limits.PreservesFiniteLimits (tubeProperSupport E U) ∧
    Limits.PreservesFiniteColimits (tubeProperSupport E U) := by sorry
end tubeProperSupport
-- Test: TauCeti.LogCrystalline.tubeProperSupport.whole_space
example {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) (M : TubeSheaves E) :
    (tubeProperSupport E ⊤).obj M ≅ M := by sorry
-- Test: TauCeti.LogCrystalline.tubeProperSupport.empty_open
example {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) (M : TubeSheaves E) :
    Limits.IsZero ((tubeProperSupport E ⊥).obj M) := by sorry
-- Test: TauCeti.LogCrystalline.tubeProperSupport.wrong_order
-- DL Remark B.2 concerns D+, so a proposed factorization must preserve
-- bounded-below objects. Its assertion does not forbid arbitrary D functors.
def SpecialBoundedBelow {F : ArithmeticFrame} {X : HKSpace F}
    (C : SpecialDerived X) : Prop :=
  ∃ b : ℤ, ∀ q : ℤ, q < b →
    Limits.IsZero ((DerivedCategory.homologyFunctor (SpecialSheaves X) q).obj C)
example : ∃ (F : ArithmeticFrame) (X : HKSpace F) (E : TubeEmbedding X)
    (U : X.object.scheme.Opens), ¬ ∃ f : SpecialDerived X ⥤ SpecialDerived X,
      (∀ C, SpecialBoundedBelow C → SpecialBoundedBelow (f.obj C)) ∧
      Nonempty (derivedSpecialization E ⋙ f ≅ derivedTubeSupport E U ⋙ derivedSpecialization E) := by sorry

def supportedConvergent {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) (b : LogFormBase) : SpecialDerived X :=
  (derivedSpecialization E).obj ((derivedTubeSupport E U).obj (tubeFormComplex E b))
def convergentMonodromyTriangle {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) : Triangle (SpecialDerived X) := by sorry
def convergentMonodromyFirst {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    (convergentMonodromyTriangle E U).obj₁ ≅
      (shiftFunctor (SpecialDerived X) (-1 : ℤ)).obj (supportedConvergent E U .relative) := by sorry
def convergentMonodromySecond {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    (convergentMonodromyTriangle E U).obj₂ ≅ supportedConvergent E U .absolute := by sorry
def convergentMonodromyThird {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    (convergentMonodromyTriangle E U).obj₃ ≅ supportedConvergent E U .relative := by sorry
def convergentMonodromyTarget {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    (shiftFunctor (SpecialDerived X) (1 : ℤ)).obj (convergentMonodromyTriangle E U).obj₁ ≅
      supportedConvergent E U .relative := by sorry
def convergentMonodromy {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    supportedConvergent E U .relative ⟶ supportedConvergent E U .relative :=
  (convergentMonodromyThird E U).inv ≫ (convergentMonodromyTriangle E U).mor₃ ≫
    (convergentMonodromyTarget E U).hom
theorem convergent_monodromy_triangle {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    distinguishedTriangles (convergentMonodromyTriangle E U) := by sorry
def specialSigmaPullback {F : ArithmeticFrame} (X : HKSpace F) :
    SpecialDerived X ⥤ SpecialDerived X := by sorry
def convergentFrobenius {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    (specialSigmaPullback X).obj (supportedConvergent E U .relative) ⟶ supportedConvergent E U .relative := by sorry
theorem convergent_monodromy_frobenius {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (U : X.object.scheme.Opens) :
    convergentFrobenius E U ≫ convergentMonodromy E U =
      F.p • ((specialSigmaPullback X).map (convergentMonodromy E U) ≫ convergentFrobenius E U) := by sorry
-- Strict semistability is the actual chart property, beyond general log smoothness.
def strictSemistableChart (F : ArithmeticFrame) (r d : ℕ) : HKSpace F := by sorry
structure StrictSemistableEtaleChart {F : ArithmeticFrame} (X : HKSpace F)
    (x : X.object.scheme) (r d : ℕ) (hr : 0 < r) where
  neighborhood : LogScheme
  toSource : neighborhood ⟶ X.object
  strictSource : IsStrict toSource
  etaleSource : Etale (logUnderlying toSource)
  point : neighborhood.scheme
  mapsTo : (logUnderlying toSource).base point = x
  toChart : neighborhood ⟶ (strictSemistableChart F r d).object
  strictChart : IsStrict toChart
  etaleChart : Etale (logUnderlying toChart)
  overBase : toChart ≫ (strictSemistableChart F r d).structureMap = toSource ≫ X.structureMap
def IsStrictlySemistable {F : ArithmeticFrame} (X : HKSpace F) : Prop :=
  ∀ x : X.object.scheme, ∃ (r : ℕ) (hr : 0 < r) (d : ℕ),
    Nonempty (StrictSemistableEtaleChart X x r d hr)
def rationalLogWittSheaf {F : ArithmeticFrame} (X : HKSpace F) : SpecialDerived X := by sorry
def convergent_logWitt_comparison {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (h : IsStrictlySemistable X) :
    convergentLogComplex E .relative ≅ rationalLogWittSheaf X := by sorry
-- RD Part II supplies algebraic/weak-formal embedding systems and their
-- analytic tubes. R09.7a supplies the ordinary relative SNC boundary carriers.
-- These client signatures specify their geometry; no unrelated family is used.
def wittPolynomialLogBase (F : ArithmeticFrame) : LogScheme :=
  affineLogScheme (natChart (Polynomial.X : Polynomial (WittVector F.p F.k)))
def wittPolynomialToWitt (F : ArithmeticFrame) :
    (wittPolynomialLogBase F).scheme ⟶ Spec (CommRingCat.of (WittVector F.p F.k)) := by sorry
-- Underlying map induced by W -> W[t].
def wittZeroSection (F : ArithmeticFrame) :
    Spec (CommRingCat.of (WittVector F.p F.k)) ⟶ (wittPolynomialLogBase F).scheme := by sorry
-- Underlying map induced by evaluation t -> 0.
def wittResidueLogMap (F : ArithmeticFrame) : standardLogPoint F.k ⟶ wittPolynomialLogBase F := by sorry
-- The log generator maps identically; W -> k is reduction and t maps to 0.
def IsZariskiCover {X Y : Scheme.{0}} (f : X ⟶ Y) : Prop :=
  Function.Surjective f.base ∧ ∀ x : X, ∃ U : X.Opens, x ∈ U ∧ IsOpenImmersion (U.ι ≫ f)
def IsStrictZariskiHypercover {Z : LogScheme} {U : SimplicialObject LogScheme}
    (a : U ⟶ (Functor.const _).obj Z) : Prop := ∀ n,
  IsStrict (logMatchingMap a n) ∧ IsZariskiCover (logUnderlying (logMatchingMap a n))
structure WittPolynomialEmbeddingSystem {F : ArithmeticFrame} (X : HKSpace F) where
  source : SimplicialObject LogScheme
  augmentation : source ⟶ (Functor.const _).obj X.object
  hypercover : IsStrictZariskiHypercover augmentation
  ambient : SimplicialObject LogScheme
  structureMap : ambient ⟶ (Functor.const _).obj (wittPolynomialLogBase F)
  embedding : source ⟶ ambient
  overBase : embedding ≫ structureMap =
    augmentation ≫ (Functor.const _).map (X.structureMap ≫ wittResidueLogMap F)
  exact : ∀ n, IsExactLog (embedding.app n)
  closed : ∀ n, IsLogClosedImmersion (embedding.app n)
  fine : ∀ n, IsFineLog (ambient.obj n)
  smooth : ∀ n, IsLogSmooth (structureMap.app n)
  finitePresentation : ∀ n, LocallyOfFinitePresentation (logUnderlying (structureMap.app n))
-- These are the algebraic models for this SAME E, with their weak completion
-- along source, t=0 fibre and tube specialization supplied by RD Part II.
def tubeAlgebraicEmbeddingSystem {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) : WittPolynomialEmbeddingSystem X := by sorry
def tubeAlgebraicModel {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) : LogScheme :=
  (tubeAlgebraicEmbeddingSystem E).ambient.obj (Opposite.op (SimplexCategory.mk 0))
def tubeAlgebraicStructure {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    tubeAlgebraicModel E ⟶ wittPolynomialLogBase F :=
    (tubeAlgebraicEmbeddingSystem E).structureMap.app (Opposite.op (SimplexCategory.mk 0))
def tubeAlgebraicBaseMap {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    (tubeAlgebraicModel E).scheme ⟶ (wittPolynomialLogBase F).scheme := logUnderlying (tubeAlgebraicStructure E)
def tubeAlgebraicWittMap {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    (tubeAlgebraicModel E).scheme ⟶ Spec (CommRingCat.of (WittVector F.p F.k)) :=
    tubeAlgebraicBaseMap E ≫ wittPolynomialToWitt F
def wittPolynomialGenericPoint (F : ArithmeticFrame) :
    Spec (CommRingCat.of (FractionRing (Polynomial (WittVector F.p F.k)))) ⟶
      (wittPolynomialLogBase F).scheme := by sorry
-- Generic point of Spec W[t], not the K-generic fibre of an O-model.
def tubeAlgebraicGenericMap {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) :
    Limits.pullback (tubeAlgebraicBaseMap E) (wittPolynomialGenericPoint F) ⟶
      Spec (CommRingCat.of (FractionRing (Polynomial (WittVector F.p F.k)))) := Limits.pullback.snd _ _
def tubeZeroFibre {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) : Scheme.{0} :=
  Limits.pullback (tubeAlgebraicBaseMap E) (wittZeroSection F)
def boundaryClosedScheme (D : SNCBoundaryView) : Scheme.{0} := by sorry
def boundaryClosedInclusion (D : SNCBoundaryView) : boundaryClosedScheme D ⟶ D.ambient := by sorry
-- The reduced closed divisor complementary to D.complement, with its actual
-- Cartier ideal; all ordinary boundary geometry remains the R09.7a export.
def wittAffineSpace (F : ArithmeticFrame) (d : ℕ) : Scheme.{0} :=
  Spec (CommRingCat.of (MvPolynomial (Fin d) (WittVector F.p F.k)))
def wittAffineSpaceMap (F : ArithmeticFrame) (d : ℕ) :
    wittAffineSpace F d ⟶ Spec (CommRingCat.of (WittVector F.p F.k)) := by sorry
def wittCoordinate (F : ArithmeticFrame) (d : ℕ) (j : Fin d) : Γ(wittAffineSpace F d, ⊤) := by sorry
-- Native affine coordinate MvPolynomial.X j under the Spec/global-section iso.
def RelativeSNCOverWitt (F : ArithmeticFrame) (D : SNCBoundaryView)
    (f : D.ambient ⟶ Spec (CommRingCat.of (WittVector F.p F.k))) : Prop :=
  ∀ x : D.ambient, ∃ U : D.ambient.Etale, ∃ u : U.left, U.hom.base u = x ∧
    IsAffine U.left ∧ ∃ d : ℕ, ∃ e : U.left ⟶ wittAffineSpace F d,
      Etale e ∧ e ≫ wittAffineSpaceMap F d = U.hom ≫ f ∧
      ∃ r : ℕ, r ≤ d ∧ ∀ v : U.left,
        U.hom.base v ∈ Set.range D.inclusion.base ↔
          ∀ j : Fin d, j.val < r →
            IsUnit (schemeGlobalToStalk U.left v (e.appTop.hom (wittCoordinate F d j)))
set_option maxHeartbeats 0 in
structure AdmissibleDegreeZeroLift {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) where
  flat : Flat (tubeAlgebraicBaseMap E)
  genericallySmooth : Smooth (tubeAlgebraicGenericMap E)
  smoothOverWitt : Smooth (tubeAlgebraicWittMap E)
  boundary : SNCBoundaryView
  ambientEq : boundary.ambient = (tubeAlgebraicModel E).scheme
  relativeSNC : RelativeSNCOverWitt F boundary (eqToHom ambientEq ≫ tubeAlgebraicWittMap E)
  zeroDivisor : tubeZeroFibre E ≅ boundaryClosedScheme boundary
  zeroDivisorOverAmbient : zeroDivisor.hom ≫ boundaryClosedInclusion boundary ≫ eqToHom ambientEq =
    Limits.pullback.fst (tubeAlgebraicBaseMap E) (wittZeroSection F)
  divisorLog : tubeAlgebraicModel E ≅ divisorialLog boundary
  divisorLogUnderlying : logUnderlying divisorLog.hom ≫ (divisorialUnderlyingIso boundary).hom ≫ eqToHom ambientEq = 𝟙 _
  specialFibre : (tubeAlgebraicEmbeddingSystem E).source.obj (Opposite.op (SimplexCategory.mk 0)) ≅
    logFiberProduct (tubeAlgebraicStructure E) (wittResidueLogMap F)
  specialFibreEmbedding : specialFibre.hom ≫ logFiberProductFst (tubeAlgebraicStructure E) (wittResidueLogMap F) =
    (tubeAlgebraicEmbeddingSystem E).embedding.app (Opposite.op (SimplexCategory.mk 0))
-- GK §§5.1-5.2, pp.26-27: local lift cover; products OVER W; blowup of
-- products of corresponding flat divisor components; remove strict transforms;
-- exceptional divisor and diagonal embeddings. The resulting maps commute
-- with all faces, degeneracies, augmentation and base structure maps.
def gkInducedEmbeddingSystem {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (L : AdmissibleDegreeZeroLift E) : WittPolynomialEmbeddingSystem X := by sorry
structure WittEmbeddingSystemIso {F : ArithmeticFrame} {X : HKSpace F}
    (A B : WittPolynomialEmbeddingSystem X) where
  source : A.source ≅ B.source
  ambient : A.ambient ≅ B.ambient
  augmentation : source.hom ≫ B.augmentation = A.augmentation
  embedding : A.embedding ≫ ambient.hom = source.hom ≫ B.embedding
  overBase : ambient.hom ≫ B.structureMap = A.structureMap
structure AdmissibleTubeEmbedding {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) where
  degreeZero : AdmissibleDegreeZeroLift E
  higherInduced : WittEmbeddingSystemIso (tubeAlgebraicEmbeddingSystem E) (gkInducedEmbeddingSystem degreeZero)
def IsAdmissibleTubeEmbedding {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) : Prop := Nonempty (AdmissibleTubeEmbedding E)
-- Absolute forms on Z^n/W, ordinary subcomplex and the cokernel in degree q+1.
def ordinaryWittFormSheaf (F : ArithmeticFrame) (Z : LogScheme)
    (f : Z.scheme ⟶ Spec (CommRingCat.of (WittVector F.p F.k))) (q : ℕ) : EtaleModules Z.scheme := by sorry
def tubeAbsoluteWittMap {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X)
    (n : SimplexCategoryᵒᵖ) : (tubeAlgebraicEmbeddingSystem E).ambient.obj n ⟶
      trivialLogScheme (Spec (CommRingCat.of (WittVector F.p F.k))) := by sorry
-- This is structureMap.app n followed by W[t]^log -> W^triv.
def ordinaryToLogWittForms {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X)
    (n : SimplexCategoryᵒᵖ) (q : ℕ) :
    ordinaryWittFormSheaf F ((tubeAlgebraicEmbeddingSystem E).ambient.obj n)
      (logUnderlying (tubeAbsoluteWittMap E n)) q ⟶ relativeLogFormSheaf (tubeAbsoluteWittMap E n) q := by sorry
instance etaleModulesHasCokernels (Z : Scheme.{0}) : Limits.HasCokernels (EtaleModules Z) := by sorry
def residueQuotientSheaf {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X)
    (n : SimplexCategoryᵒᵖ) (q : ℕ) : EtaleModules ((tubeAlgebraicEmbeddingSystem E).ambient.obj n).scheme :=
    Limits.cokernel (ordinaryToLogWittForms E n (q+1))
-- RD's analytic realization restricts this q+1 quotient to the actual t=0
-- fibre, then to the same simplicial tubes of E, and takes their total complex.
def tubeResidueFormComplex {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (A : AdmissibleTubeEmbedding E) : TubeDerived E := by sorry
def convergentResidueQuotient {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (A : AdmissibleTubeEmbedding E) : SpecialDerived X :=
    (derivedSpecialization E).obj (tubeResidueFormComplex E A)
def supportedConvergentResidue {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (A : AdmissibleTubeEmbedding E) (U : X.object.scheme.Opens) : SpecialDerived X :=
    (derivedSpecialization E).obj ((derivedTubeSupport E U).obj (tubeResidueFormComplex E A))
def rationalSatoXi {F : ArithmeticFrame} (X : HKSpace F) : SpecialDerived X := by sorry
def convergent_sato_residue_comparison {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (h : IsStrictlySemistable X) (A : AdmissibleTubeEmbedding E) :
    convergentResidueQuotient E A ≅ rationalSatoXi X := by sorry
-- Support is applied to THIS quotient complex on E before specialization;
-- DL (B.9) is the natural comparison, not a general support commutation iso.
def specialExtensionByZero {F : ArithmeticFrame} {X : HKSpace F} (U : X.object.scheme.Opens) :
    SpecialDerived X ⥤ SpecialDerived X := by sorry
-- F_! F^* for the actual open U -> X, supplied by EDS.
def satoSupportedComparison {F : ArithmeticFrame} {X : HKSpace F}
    (E : TubeEmbedding X) (A : AdmissibleTubeEmbedding E) (U : X.object.scheme.Opens) :
    (specialExtensionByZero U).obj (rationalSatoXi X) ⟶ supportedConvergentResidue E A U := by sorry
def logRigidCohomology {F : ArithmeticFrame} (X : HKSpace F) : LogDerived F.K0 := by sorry
def proper_logRigid_HK {F : ArithmeticFrame} (X : HKSpace F)
    (hp : IsProper (logUnderlying X.structureMap)) (h : IsStrictlySemistable X) : logRigidCohomology X ≅ rationalHK X := by sorry

structure ArithmeticExtension (F F' : ArithmeticFrame) where
  samePrime : F.p = F'.p
  integerMap : F.O →+* F'.O
  fieldMap : F.K →+* F'.K
  residueMap : F.k →+* F'.k
  coefficientMap : F.K0 →+* F'.K0
  commutesIntegers : ∀ a, fieldMap (algebraMap F.O F.K a) = algebraMap F'.O F'.K (integerMap a)
  commutesResidue : ∀ a, F'.residue (integerMap a) = residueMap (F.residue a)
  commutesCoefficients : ∀ a, fieldMap (F.coefficientEmbedding a) = F'.coefficientEmbedding (coefficientMap a)
  commutesSigma : ∀ a, coefficientMap (F.sigma a) = F'.sigma (coefficientMap a)
  ramification : ℕ
  positive : 0 < ramification
  uniformizerUnit : F'.Oˣ
  uniformizerImage : integerMap F.uniformizer = uniformizerUnit * F'.uniformizer^ramification
  finite : letI := fieldMap.toAlgebra; Module.Finite F.K F'.K
def hkExtension {F F' : ArithmeticFrame} (e : ArithmeticExtension F F') (X : HKSpace F) : HKSpace F' := by sorry
def hkExtensionComparison {F F' : ArithmeticFrame} (e : ArithmeticExtension F F')
    (X : HKSpace F) (hp : IsProper (logUnderlying X.structureMap)) (q : ℤ) : letI := e.coefficientMap.toAlgebra
    F'.K0 ⊗[F.K0] logH (rationalHK X) q ≃ₗ[F'.K0] logH (rationalHK (hkExtension e X)) q := by sorry
theorem hyodoKato_ramified_baseChange {F F' : ArithmeticFrame} (e : ArithmeticExtension F F')
    (X : HKSpace F) (hp : IsProper (logUnderlying X.structureMap)) (q : ℤ) :
    letI := e.coefficientMap.toAlgebra
    ∀ x : F'.K0 ⊗[F.K0] logH (rationalHK X) q,
    hkExtensionComparison e X hp q (TensorProduct.map LinearMap.id (hkMonodromy X q) x) =
      (e.ramification : F'.K0)⁻¹ • hkMonodromy (hkExtension e X) q (hkExtensionComparison e X hp q x) := by sorry

def extendedHKFrobenius {F F' : ArithmeticFrame} (e : ArithmeticExtension F F')
    (X : HKSpace F) (q : ℤ) : letI := e.coefficientMap.toAlgebra
    (F'.K0 ⊗[F.K0] logH (rationalHK X) q) →+ (F'.K0 ⊗[F.K0] logH (rationalHK X) q) := by sorry
theorem extendedHKFrobenius_tmul {F F' : ArithmeticFrame} (e : ArithmeticExtension F F')
    (X : HKSpace F) (q : ℤ) (a : F'.K0) (x : logH (rationalHK X) q) :
    letI := e.coefficientMap.toAlgebra
    extendedHKFrobenius e X q (a ⊗ₜ[F.K0] x) = F'.sigma a ⊗ₜ[F.K0] hkFrobenius X q x := by sorry
theorem hkExtensionComparison_frobenius {F F' : ArithmeticFrame} (e : ArithmeticExtension F F')
    (X : HKSpace F) (hp : IsProper (logUnderlying X.structureMap)) (q : ℤ) :
    letI := e.coefficientMap.toAlgebra
    ∀ x : F'.K0 ⊗[F.K0] logH (rationalHK X) q,
    hkExtensionComparison e X hp q (extendedHKFrobenius e X q x) =
      hkFrobenius (hkExtension e X) q (hkExtensionComparison e X hp q x) := by sorry
-- RD.5's Frechet carrier: complete, metrizable, Hausdorff, and with the
-- topology generated by countably many nonarchimedean seminorms.
structure SteinHKData (K : Type) [NormedField K] where
  space : Type
  [add : AddCommGroup space]
  [module : Module K space]
  [uniform : UniformSpace space]
  [uniformAdd : IsUniformAddGroup space]
  [complete : CompleteSpace space]
  [hausdorff : T2Space space]
  [metrizable : TopologicalSpace.MetrizableSpace space]
  seminorms : ℕ → Seminorm K space
  induces : WithSeminorms seminorms
  nonarchimedean : ∀ n x y, seminorms n (x+y) ≤ max (seminorms n x) (seminorms n y)
attribute [instance] SteinHKData.add SteinHKData.module SteinHKData.uniform
  SteinHKData.uniformAdd SteinHKData.complete SteinHKData.hausdorff SteinHKData.metrizable
instance steinContinuousSMul {K : Type} [NormedField K] (D : SteinHKData K) :
    ContinuousSMul K D.space := D.induces.continuousSMul
instance steinTopologicalAdd {K : Type} [NormedField K] (D : SteinHKData K) :
    IsTopologicalAddGroup D.space := D.induces.isTopologicalAddGroup
-- The hom universe is enlarged for Mathlib's small Ind construction. Its maps
-- are still precisely continuous linear maps, with ordinary composition.
instance steinCategory (K : Type) [NormedField K] : SmallCategory (SteinHKData K) where
  Hom D E := ULift.{1} (D.space →L[K] E.space)
  id D := ⟨ContinuousLinearMap.id K D.space⟩
  comp f g := ⟨g.down.comp f.down⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
-- R06.1/RD.5 supply Kbreve = completion of K0^nr, not its uncompleted union.
def completedUnramifiedField (F : ArithmeticFrame) : Type := by sorry
instance completedUnramifiedNorm (F : ArithmeticFrame) : NormedField (completedUnramifiedField F) := by sorry
instance completedUnramifiedComplete (F : ArithmeticFrame) : CompleteSpace (completedUnramifiedField F) := by sorry
instance completedUnramifiedCharZero (F : ArithmeticFrame) : CharZero (completedUnramifiedField F) := by sorry
def completedUnramifiedEmbedding (F : ArithmeticFrame) : F.K0 →+* completedUnramifiedField F := by sorry
-- Admissible affinoid opens and their dense Runge restrictions are RD.4 inputs.
def maximalUnramifiedField (F : ArithmeticFrame) : Type := by sorry
instance maximalUnramifiedNorm (F : ArithmeticFrame) : NormedField (maximalUnramifiedField F) := by sorry
def unramifiedCoefficientEmbedding (F : ArithmeticFrame) : F.K0 →+* maximalUnramifiedField F := by sorry
def unramifiedCompletionEmbedding (F : ArithmeticFrame) :
    maximalUnramifiedField F →+* completedUnramifiedField F := by sorry
theorem unramifiedCompletion_dense (F : ArithmeticFrame) : DenseRange (unramifiedCompletionEmbedding F) := by sorry
theorem unramifiedCompletion_isometry (F : ArithmeticFrame) : Isometry (unramifiedCompletionEmbedding F) := by sorry
theorem unramifiedCoefficient_factor (F : ArithmeticFrame) :
    completedUnramifiedEmbedding F = (unramifiedCompletionEmbedding F).comp (unramifiedCoefficientEmbedding F) := by sorry
def TubeAdmissibleOpen {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) : Type := by sorry
def tubePoints {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) : TopCat.{0} := by sorry
def tubeOpenPoints {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (U : TubeAdmissibleOpen E) : TopologicalSpace.Opens (tubePoints E) := by sorry
-- RD.4 supplies the convergent Tate algebra and its adic spectrum.
def convergentTateAlgebra (K : Type) [NormedField K] (n : ℕ) : Type := by sorry
instance (K : Type) [NormedField K] (n : ℕ) : NormedCommRing (convergentTateAlgebra K n) := by sorry
def affinoidTubePoints {K : Type} [NormedField K] (B : Type) [NormedCommRing B]
    [NormedAlgebra K B] : TopCat.{0} := by sorry
structure AffinoidTubePresentation {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (U : TubeAdmissibleOpen E) where
  algebra : Type
  [normed : NormedCommRing algebra]
  [scalar : NormedAlgebra F.K0 algebra]
  [complete : CompleteSpace algebra]
  variableCount : ℕ
  quotient : convergentTateAlgebra F.K0 variableCount →+* algebra
  continuous : Continuous quotient
  surjective : Function.Surjective quotient
  spectrumIso : TopCat.of (tubeOpenPoints U) ≅ affinoidTubePoints (K := F.K0) algebra
def IsAffinoidTubeOpen {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (U : TubeAdmissibleOpen E) : Prop := Nonempty (AffinoidTubePresentation U)
def tubeOpenFunctions {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (U : TubeAdmissibleOpen E) : SteinHKData F.K0 := by sorry
def tubeOpenRestriction {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (U V : TubeAdmissibleOpen E) (h : tubeOpenPoints U ≤ tubeOpenPoints V) :
    (tubeOpenFunctions V).space →L[F.K0] (tubeOpenFunctions U).space := by sorry
-- RD.4 exports the actual radius extension of affinoid presentations:
-- D=T_n(delta)/I -> C=T_n/I T_n, delta>1, and the spectrum factorization
-- of the inclusion U -> V. This nominal client type is an explicit request.
def DaggerRadiusExtension {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    {U V : TubeAdmissibleOpen E} (PU : AffinoidTubePresentation U)
    (PV : AffinoidTubePresentation V) (radius : ℝ) : Type 1 := by sorry
structure StrictTubeContainment {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (U V : TubeAdmissibleOpen E) where
  radius : ℝ
  largerThanOne : 1 < radius
  innerPresentation : AffinoidTubePresentation U
  outerPresentation : AffinoidTubePresentation V
  radiusExtension : DaggerRadiusExtension innerPresentation outerPresentation radius
structure AdmissibleSteinExhaustion {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X) where
  piece : ℕ → TubeAdmissibleOpen E
  affinoid : ∀ n, IsAffinoidTubeOpen (piece n)
  nested : ∀ n, tubeOpenPoints (piece n) ≤ tubeOpenPoints (piece (n+1))
  covers : ∀ x : tubePoints E, ∃ n, x ∈ tubeOpenPoints (piece n)
  strictContainment : ∀ n, StrictTubeContainment (piece n) (piece (n+1))
  runge : ∀ n, DenseRange (tubeOpenRestriction (piece n) (piece (n+1)) (nested n))
def logRelativeStalkForms {X Y : LogScheme} (f : X ⟶ Y) (x : LogGeometricPoint X) :
    ModuleCat.{0} (logStalkRing x) := by sorry
-- RD.4's semistable weak-formal model includes its actual special-fibre
-- identification and Zariski-local etale semistable coordinate maps over O.
def SemistableWeakFormalModel {F : ArithmeticFrame} {X : HKSpace F}
    (M : WeakFormalLogModel X) : Type 1 := by sorry
-- RD.4 identifies the tube of an open of the special fibre inside this model.
def tubeOfOpen {F : ArithmeticFrame} {X : HKSpace F} (E : TubeEmbedding X)
    (U : X.object.scheme.Opens) : TopologicalSpace.Opens (tubePoints E) := by sorry
structure SemistableSteinCover {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (D : AdmissibleSteinExhaustion E) where
  components : ℕ → Finset (Set X.object.scheme)
  irreducible : ∀ n c, c ∈ components n → c ∈ irreducibleComponents X.object.scheme
  opens : ℕ → X.object.scheme.Opens
  interleaveLeft : ∀ n, (⋃ c ∈ components n, c) ⊆ opens n
  interleaveRight : ∀ n, (opens n : Set X.object.scheme) ⊆ ⋃ c ∈ components (n+1), c
  covers : ∀ x : X.object.scheme, ∃ n, x ∈ opens n
  tubes : ∀ n, tubeOpenPoints (D.piece n) = tubeOfOpen E (opens n)
structure SteinCurve (F : ArithmeticFrame) where
  special : HKSpace F
  embedding : TubeEmbedding special
  semistable : IsStrictlySemistable special
  weakSemistable : SemistableWeakFormalModel (tubeModel embedding)
  dimensionOne : ∀ x : LogGeometricPoint special.object,
    Nonempty (logRelativeStalkForms special.structureMap x ≃ₗ[logStalkRing x] logStalkRing x)
  stein : ∃ D : AdmissibleSteinExhaustion embedding, Nonempty (SemistableSteinCover D)
def IsGoodReductionSteinCurve {F : ArithmeticFrame} (X : SteinCurve F) : Prop :=
  IsStrict X.special.structureMap ∧ Smooth (logUnderlying X.special.structureMap)
def cofinalSteinExhaustion {F : ArithmeticFrame} {X : HKSpace F} {E : TubeEmbedding X}
    (D : AdmissibleSteinExhaustion E) (a : ℕ → ℕ) (ha : StrictMono a)
    (hc : Tendsto a Filter.atTop Filter.atTop) : AdmissibleSteinExhaustion E where
  piece n := D.piece (a n)
  affinoid n := D.affinoid (a n)
  nested := by sorry
  covers := by sorry
  strictContainment := by sorry
  runge := by sorry
def steinHK {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) :
    SteinHKData (completedUnramifiedField F) := by sorry
def steinPieceHK {F : ArithmeticFrame} {X : SteinCurve F}
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) (n : ℕ) :
    SteinHKData (completedUnramifiedField F) := by sorry
def completedUnramifiedFrobenius (F : ArithmeticFrame) :
    completedUnramifiedField F →+* completedUnramifiedField F := by sorry
structure ContinuousHKOperators {K : Type} [NormedField K]
    (D : SteinHKData K) (sigma : K →+* K) where
  phi : D.space →ₛₗ[sigma] D.space
  continuousPhi : Continuous phi
  monodromy : D.space →L[K] D.space
namespace steinHK
 def limit {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) (n : ℕ) :
    (steinHK X E q).space →L[completedUnramifiedField F] (steinPieceHK E q n).space := by sorry
 def operators {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) :
    ContinuousHKOperators (steinHK X E q) (completedUnramifiedFrobenius F) := by sorry
 def exhaustion_independence {F : ArithmeticFrame} (X : SteinCurve F)
    (E E' : AdmissibleSteinExhaustion X.embedding) (q : ℤ) :
    (steinHK X E q).space ≃L[completedUnramifiedField F] (steinHK X E' q).space := by sorry
 theorem relation {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) (x : (steinHK X E q).space) :
    (operators X E q).monodromy ((operators X E q).phi x) =
      (F.p : completedUnramifiedField F) • (operators X E q).phi ((operators X E q).monodromy x) := by sorry
end steinHK
theorem steinPieceHK_finite {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) (n : ℕ) :
    Module.Finite (completedUnramifiedField F) (steinPieceHK E q n).space := by sorry
def steinHKDiagram {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) : ℕᵒᵖ ⥤ SteinHKData (completedUnramifiedField F) where
  obj n := steinPieceHK E q n.unop
  map f := by sorry
  map_id := by sorry
  map_comp := by sorry
def steinHKCone {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) : Limits.Cone (steinHKDiagram X E q) where
  pt := steinHK X E q
  π := { app n := ⟨steinHK.limit X E q n.unop⟩, naturality := by sorry }
def steinHK_isLimit {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) : Limits.IsLimit (steinHKCone X E q) := by sorry

-- Test: TauCeti.LogCrystalline.steinHK.good_reduction_piece
example {F : ArithmeticFrame} (X : SteinCurve F) (h : IsGoodReductionSteinCurve X)
    (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) : (steinHK.operators X E q).monodromy = 0 := by sorry
-- Test: TauCeti.LogCrystalline.steinHK.cofinal_exhaustion
example {F : ArithmeticFrame} (X : SteinCurve F) (E : AdmissibleSteinExhaustion X.embedding)
    (a : ℕ → ℕ) (ha : StrictMono a) (hc : Tendsto a Filter.atTop Filter.atTop) (q : ℤ) :
    (steinHK X E q).space ≃L[completedUnramifiedField F]
      (steinHK X (cofinalSteinExhaustion E a ha hc) q).space := by sorry
-- Test: TauCeti.LogCrystalline.steinHK.affinoid_warning
example {F : ArithmeticFrame} (X : SteinCurve F) (E : AdmissibleSteinExhaustion X.embedding)
    (q : ℤ) (x : (steinHK X E q).space) (hx : ∀ n, steinHK.limit X E q n x = 0) : x = 0 := by sorry
-- RD.5 supplies the completed projective tensor functor in its strict topology.
def geometricUnramifiedEmbedding {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) :
    completedUnramifiedField F →+* G.C := by sorry
def completedCScalar {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (D : SteinHKData (completedUnramifiedField F)) : SteinHKData G.C := by sorry
def steinDeRham {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (X : SteinCurve F) (q : ℤ) : SteinHKData G.C := by sorry
def stein_hyodoKato_comparison {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (X : SteinCurve F) (E : AdmissibleSteinExhaustion X.embedding) (pi : Uniformizer F) (q : ℤ) :
    (completedCScalar G (steinHK X E q)).space ≃L[G.C] (steinDeRham G X q).space := by sorry

-- The geometric tower and its pullbacks supply a coherent filtered diagram.
-- RD.4's morphism type includes the map of tubes and its analytic ring maps.
def TubeMap {F : ArithmeticFrame} {X Y : HKSpace F} (E : TubeEmbedding X)
    (E' : TubeEmbedding Y) (f : X.object ⟶ Y.object) : Type 1 := by sorry
structure SteinCurveMap {F : ArithmeticFrame} (X Y : SteinCurve F) where
  specialMap : X.special.object ⟶ Y.special.object
  overBase : specialMap ≫ Y.special.structureMap = X.special.structureMap
  analyticMap : TubeMap X.embedding Y.embedding specialMap
-- A geometric finite-etale witness, exported by RD.4 on analytic affinoid charts.
def FiniteEtaleTubeMap {F : ArithmeticFrame} {X Y : SteinCurve F}
    (f : SteinCurveMap X Y) : Type 1 := by sorry
def IsFiniteEtaleSteinMap {F : ArithmeticFrame} {X Y : SteinCurve F}
    (f : SteinCurveMap X Y) : Prop := Nonempty (FiniteEtaleTubeMap f)
structure TowerHKData (F : ArithmeticFrame) where
  level : ℕ → SteinCurve F
  exhaustion : ∀ n, AdmissibleSteinExhaustion (level n).embedding
  transition : ∀ n, SteinCurveMap (level (n+1)) (level n)
  finiteEtale : ∀ n, IsFiniteEtaleSteinMap (transition n)
def constantCurveTower {F : ArithmeticFrame} (X : SteinCurve F)
    (E : AdmissibleSteinExhaustion X.embedding) : TowerHKData F := by sorry
def cofinalCurveTower {F : ArithmeticFrame} (T : TowerHKData F) (a : ℕ → ℕ)
    (ha : Monotone a) (hc : Tendsto a Filter.atTop Filter.atTop) : TowerHKData F := by sorry
def towerHKDiagram {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) :
    ULift.{1} ℕ ⥤ SteinHKData (completedUnramifiedField F) := by sorry
def towerHKDiagram_level {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) (n : ℕ) :
    (towerHKDiagram T q).obj ⟨n⟩ ≅ steinHK (T.level n) (T.exhaustion n) q := by sorry
def steinHKPullback {F : ArithmeticFrame} {X Y : SteinCurve F} (f : SteinCurveMap X Y)
    (EX : AdmissibleSteinExhaustion X.embedding) (EY : AdmissibleSteinExhaustion Y.embedding) (q : ℤ) :
    steinHK Y EY q ⟶ steinHK X EX q := by sorry
theorem steinHKPullback_monodromy {F : ArithmeticFrame} {X Y : SteinCurve F}
    (f : SteinCurveMap X Y) (EX : AdmissibleSteinExhaustion X.embedding)
    (EY : AdmissibleSteinExhaustion Y.embedding) (q : ℤ) (x : (steinHK Y EY q).space) :
    (steinHKPullback f EX EY q).down ((steinHK.operators Y EY q).monodromy x) =
      (steinHK.operators X EX q).monodromy ((steinHKPullback f EX EY q).down x) := by sorry
theorem steinHKPullback_frobenius {F : ArithmeticFrame} {X Y : SteinCurve F}
    (f : SteinCurveMap X Y) (EX : AdmissibleSteinExhaustion X.embedding)
    (EY : AdmissibleSteinExhaustion Y.embedding) (q : ℤ) (x : (steinHK Y EY q).space) :
    (steinHKPullback f EX EY q).down ((steinHK.operators Y EY q).phi x) =
      (steinHK.operators X EX q).phi ((steinHKPullback f EX EY q).down x) := by sorry
theorem towerHKDiagram_transition {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) (n : ℕ) :
    (towerHKDiagram_level T q n).hom ≫
      steinHKPullback (T.transition n) (T.exhaustion (n+1)) (T.exhaustion n) q =
    (towerHKDiagram T q).map (homOfLE (show (⟨n⟩ : ULift.{1} ℕ) ≤ ⟨n+1⟩ from by sorry)) ≫
      (towerHKDiagram_level T q (n+1)).hom := by sorry
def towerHK {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) :
    Ind (SteinHKData (completedUnramifiedField F)) := (Ind.lim (ULift.{1} ℕ)).obj (towerHKDiagram T q)
def towerSymmetryGroup {F : ArithmeticFrame} (T : TowerHKData F) : Type := by sorry
instance towerSymmetryGroupStructure {F : ArithmeticFrame} (T : TowerHKData F) : Group (towerSymmetryGroup T) := by sorry
-- The source Galois/tower action is an actual action on each semistable tube.
-- RD.4/RD.5 supply its geometric action and the continuous cohomology maps.
def towerGeometricAction {F : ArithmeticFrame} (T : TowerHKData F)
    (g : towerSymmetryGroup T) (n : ℕ) : SteinCurveMap (T.level n) (T.level n) := by sorry
theorem towerGeometricAction_transition {F : ArithmeticFrame} (T : TowerHKData F)
    (g : towerSymmetryGroup T) (n : ℕ) :
    (towerGeometricAction T g (n+1)).specialMap ≫ (T.transition n).specialMap =
      (T.transition n).specialMap ≫ (towerGeometricAction T g n).specialMap := by sorry
def towerLevelAction {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) (n : ℕ) :
    towerSymmetryGroup T →* Aut ((towerHKDiagram T q).obj ⟨n⟩) := by sorry
theorem towerLevelAction_geometric {F : ArithmeticFrame} (T : TowerHKData F)
    (q : ℤ) (n : ℕ) (g : towerSymmetryGroup T) :
    (towerLevelAction T q n g).hom ≫ (towerHKDiagram_level T q n).hom =
      (towerHKDiagram_level T q n).hom ≫
        steinHKPullback (towerGeometricAction T g⁻¹ n) (T.exhaustion n) (T.exhaustion n) q := by sorry
theorem towerLevelAction_transition {F : ArithmeticFrame} (T : TowerHKData F)
    (q : ℤ) (n : ℕ) (g : towerSymmetryGroup T) :
    (towerLevelAction T q n g).hom ≫
      (towerHKDiagram T q).map (homOfLE (show (⟨n⟩ : ULift.{1} ℕ) ≤ ⟨n+1⟩ from by sorry)) =
    (towerHKDiagram T q).map (homOfLE (show (⟨n⟩ : ULift.{1} ℕ) ≤ ⟨n+1⟩ from by sorry)) ≫
      (towerLevelAction T q (n+1) g).hom := by sorry
def towerDeRham {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (T : TowerHKData F) (q : ℤ) : Ind (SteinHKData G.C) := by sorry
def indCompletedCScalar {F : ArithmeticFrame} (G : GeometricCoefficientFrame F) :
    Ind (SteinHKData (completedUnramifiedField F)) ⥤ Ind (SteinHKData G.C) := by sorry
-- R06.1 supplies Gal_F and its action on completed unramified coefficients.
-- Its cohomology action is semilinear, unlike the linear geometric symmetry group.
def arithmeticGaloisGroup (F : ArithmeticFrame) : Type := by sorry
instance arithmeticGaloisGroupStructure (F : ArithmeticFrame) : Group (arithmeticGaloisGroup F) := by sorry
def arithmeticGaloisCoefficientAction (F : ArithmeticFrame) :
    arithmeticGaloisGroup F →* RingAut (completedUnramifiedField F) := by sorry
-- RD.5 supplies continuous scalar twisting and its ind-extension.
def indCoefficientTwist (F : ArithmeticFrame) (sigma : completedUnramifiedField F →+* completedUnramifiedField F) :
    Ind (SteinHKData (completedUnramifiedField F)) ⥤ Ind (SteinHKData (completedUnramifiedField F)) := by sorry
namespace towerHK
 def level_maps {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) (n : ℕ) :
    Ind.yoneda.obj ((towerHKDiagram T q).obj ⟨n⟩) ⟶ towerHK T q := by sorry
 def actions {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) :
    towerSymmetryGroup T →* Aut (towerHK T q) := by sorry
 theorem actions_level {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ)
    (n : ℕ) (g : towerSymmetryGroup T) :
    level_maps T q n ≫ (actions T q g).hom =
      Ind.yoneda.map (towerLevelAction T q n g).hom ≫ level_maps T q n := by sorry
 def comparison {F : ArithmeticFrame} (G : GeometricCoefficientFrame F)
    (T : TowerHKData F) (pi : Uniformizer F) (q : ℤ) :
    (indCompletedCScalar G).obj (towerHK T q) ≅ towerDeRham G T q := by sorry
 def galois {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) (g : arithmeticGaloisGroup F) :
    (indCoefficientTwist F (arithmeticGaloisCoefficientAction F g).toRingHom).obj (towerHK T q) ⟶
      towerHK T q := by sorry
 theorem galois_iso {F : ArithmeticFrame} (T : TowerHKData F) (q : ℤ) (g : arithmeticGaloisGroup F) :
    IsIso (galois T q g) := by sorry
end towerHK
-- Test: TauCeti.LogCrystalline.towerHK.constant_tower
example {F : ArithmeticFrame} (X : SteinCurve F) (E : AdmissibleSteinExhaustion X.embedding) (q : ℤ) :
    towerHK (constantCurveTower X E) q ≅ Ind.yoneda.obj (steinHK X E q) := by sorry
-- Test: TauCeti.LogCrystalline.towerHK.cofinal_levels
example {F : ArithmeticFrame} (T : TowerHKData F) (a : ℕ → ℕ)
    (ha : Monotone a) (hc : Tendsto a Filter.atTop Filter.atTop) (q : ℤ) :
    towerHK (cofinalCurveTower T a ha hc) q ≅ towerHK T q := by sorry
-- Test: TauCeti.LogCrystalline.towerHK.bare_colimit_wrong
example {K : Type} [NormedField K] (D E : SteinHKData K) (f : D.space →ₗ[K] E.space)
    (hf : ¬ Continuous f) : ¬ ∃ g : D.space →L[K] E.space, g.toLinearMap = f := by sorry

-- CR.7 consumes the existing ordinary/log crystal categories. Evaluation is
-- on one actual site and PD object, with finite projectivity as extra data.
structure FiniteProjectiveEvaluation (A : Type) [CommRing A] where
  module : ModuleCat.{0} A
  [finite : Module.Finite A module]
  [projective : Module.Projective A module]
attribute [instance] FiniteProjectiveEvaluation.finite FiniteProjectiveEvaluation.projective
structure FiniteProjectiveCrystal (B : LogPDBase) (Z : LogOverPDBase B) where
  crystal : Crystals B Z
  finiteLocallyFree : ∀ T, EtaleFiniteLocallyFree (crystal.evaluation T)
instance (B : LogPDBase) (Z : LogOverPDBase B) : Category (FiniteProjectiveCrystal B Z) where
  Hom F G := F.crystal ⟶ G.crystal
  id F := 𝟙 F.crystal
  comp f g := f ≫ g
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
instance (B : LogPDBase) (Z : LogOverPDBase B) : Preadditive (FiniteProjectiveCrystal B Z) := by sorry
def finiteCrystalForget (B : LogPDBase) (Z : LogOverPDBase B) :
    FiniteProjectiveCrystal B Z ⥤ Crystals B Z where
  obj F := F.crystal
  map f := f
-- Global finite projectivity is an AFFINE consequence of finite local freeness.
def coefficientInterface {B : LogPDBase} {Z : LogOverPDBase B}
    (F : FiniteProjectiveCrystal B Z) (T : (LogCrysObject B Z)ᵒᵖ)
    (ha : IsAffine T.unop.thickening.ambient.object.scheme) :
    FiniteProjectiveEvaluation ((logCrystallineStructure B Z).obj.obj T) := by sorry
def finiteStructureCrystal (B : LogPDBase) (Z : LogOverPDBase B) : FiniteProjectiveCrystal B Z := by sorry
def finiteZeroCrystal (B : LogPDBase) (Z : LogOverPDBase B) : FiniteProjectiveCrystal B Z := by sorry
namespace coefficientInterface
 def evaluate {B : LogPDBase} {Z : LogOverPDBase B} (F : FiniteProjectiveCrystal B Z)
    (T : LogCrysObject B Z) : EtaleModules T.thickening.ambient.object.scheme := F.crystal.evaluation T
 def pullback {B : LogPDBase} {Z : LogOverPDBase B} (F : FiniteProjectiveCrystal B Z)
    {T T' : LogCrysObject B Z} (g : T' ⟶ T) :
    (etaleModulePullback (logUnderlying g.map.ambient)).obj (evaluate F T) ≅ evaluate F T' :=
    F.crystal.transition g
 def tensor_dual {B : LogPDBase} {Z : LogOverPDBase B} (F G : FiniteProjectiveCrystal B Z)
    (T : LogCrysObject B Z) :
    (LogCrystal.tensor F.crystal G.crystal).evaluation T ≅
      etaleModuleTensor (evaluate F T) (evaluate G T) := F.crystal.tensor_evaluation G.crystal T
 def dual_evaluation {B : LogPDBase} {Z : LogOverPDBase B} (F : FiniteProjectiveCrystal B Z)
    (T : LogCrysObject B Z) :
    (LogCrystal.dual F.crystal F.finiteLocallyFree).evaluation T ≅
      etaleModuleDual (evaluate F T) := F.crystal.dual_evaluation F.finiteLocallyFree T
end coefficientInterface
-- Test: TauCeti.LogCrystalline.coefficientInterface.structure
example (B : LogPDBase) (Z : LogOverPDBase B) (T : LogCrysObject B Z) :
    coefficientInterface.evaluate (finiteStructureCrystal B Z) T ≅
      etaleFree T.thickening.ambient.object.scheme 1 := by sorry
-- Test: TauCeti.LogCrystalline.coefficientInterface.zero
example (B : LogPDBase) (Z : LogOverPDBase B) (T : LogCrysObject B Z) :
    Limits.IsZero (coefficientInterface.evaluate (finiteZeroCrystal B Z) T) := by sorry
-- Test: TauCeti.LogCrystalline.coefficientInterface.nonflat_failure
example (p : ℕ) [Fact p.Prime] :
    ¬ Module.Flat (PadicInt p) (PadicInt p ⧸ Ideal.span {(p : PadicInt p)}) := by sorry

-- The completed category uses M/p, NOT the reduced M/pi, so that the actual
-- thickenings M/p^(n+1) carry canonical PD(p), including ramified O-models.
-- Its base is W_n with TRIVIAL log; this is not the HK base with 1 mapping to 0.
def coefficientPDBase (F : ArithmeticFrame) (n : ℕ) : LogPDBase := by sorry
def coefficientPDBase_ring (F : ArithmeticFrame) (n : ℕ) :
    (coefficientPDBase F n).ring ≅ truncatedWittRing F (n+1) := by sorry
def coefficientPDBase_log (F : ArithmeticFrame) (n : ℕ) :
    (coefficientPDBase F n).object ≅ trivialLogScheme (Spec (coefficientPDBase F n).ring) := by sorry
def coefficientModelReduction {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) : LogScheme := by sorry
def coefficientReductionInclusion {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    coefficientModelReduction M n ⟶ M.object := by sorry
def coefficientModelReduction_fibre {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    (coefficientModelReduction M n).scheme ≅
      Limits.pullback (logUnderlying M.structureMap)
        (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk (Ideal.span {(F.p : F.O)^(n+1)})))) := by sorry
def coefficientLevelSource {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    LogOverPDBase (coefficientPDBase F n) := by sorry
theorem coefficientLevelSource_object {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    (coefficientLevelSource M n).object = coefficientModelReduction M 0 := by sorry
def coefficientModelPDThickening {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    LogPDThickening (coefficientPDBase F n) (coefficientLevelSource M n) := by sorry
def coefficientModelPDObject {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    LogCrysObject (coefficientPDBase F n) (coefficientLevelSource M n) :=
    pdIdentitySiteObject (coefficientModelPDThickening M n)
theorem coefficientModelPDObject_ambient {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    (coefficientModelPDObject M n).thickening.ambient.object = coefficientModelReduction M n := by sorry
def coefficientModelAmbientInclusion {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    (coefficientModelPDObject M n).thickening.ambient.object.scheme ⟶ M.object.scheme :=
  logUnderlying ((eqToHom (coefficientModelPDObject_ambient M n)) ≫ coefficientReductionInclusion M n)
def coefficientAmbientReduction {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    (coefficientModelPDObject M n).thickening.ambient.object.scheme ⟶
      (coefficientModelPDObject M (n+1)).thickening.ambient.object.scheme := by sorry
theorem coefficientAmbientReduction_overModel {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    coefficientAmbientReduction M n ≫ coefficientModelAmbientInclusion M (n+1) =
      coefficientModelAmbientInclusion M n := by sorry
-- Canonical reduction W_(n+2) -> W_(n+1), with the identity on M/p.
def coefficientLevelReduction {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    FiniteProjectiveCrystal (coefficientPDBase F (n+1)) (coefficientLevelSource M (n+1)) ⥤
      FiniteProjectiveCrystal (coefficientPDBase F n) (coefficientLevelSource M n) := by sorry
structure CompletedCoefficientCrystal {F : ArithmeticFrame} (M : SemistableModel F) where
  level : ∀ n, FiniteProjectiveCrystal (coefficientPDBase F n) (coefficientLevelSource M n)
  reduction : ∀ n, (coefficientLevelReduction M n).obj (level (n+1)) ≅ level n
structure CompletedCoefficientHom {F : ArithmeticFrame} {M : SemistableModel F}
    (C D : CompletedCoefficientCrystal M) where
  level : ∀ n, C.level n ⟶ D.level n
  compatible : ∀ n, (coefficientLevelReduction M n).map (level (n+1)) ≫ (D.reduction n).hom =
    (C.reduction n).hom ≫ level n
instance {F : ArithmeticFrame} (M : SemistableModel F) : Category.{1} (CompletedCoefficientCrystal M) where
  Hom := CompletedCoefficientHom
  id C := ⟨fun n => 𝟙 (C.level n), by sorry⟩
  comp f g := ⟨fun n => f.level n ≫ g.level n, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
instance {F : ArithmeticFrame} (M : SemistableModel F) : Preadditive (CompletedCoefficientCrystal M) := by sorry
instance {F : ArithmeticFrame} (M : SemistableModel F) :
    Linear (WittVector F.p F.k) (CompletedCoefficientCrystal M) := by sorry
-- Adjacent isomorphisms compose to all reductions; their morphism coherence
-- makes this an inverse system, not a freely chosen sequence of evaluations.
def completedCoefficientLevel {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    CompletedCoefficientCrystal M ⥤
      FiniteProjectiveCrystal (coefficientPDBase F n) (coefficientLevelSource M n) where
  obj C := C.level n
  map f := f.level n
-- Evaluate the very same crystal at the canonical PD thickening M/p^(n+1).
-- The isomorphism combines crystalline base reduction with C.reduction n.
def coefficientEvaluationReduction {F : ArithmeticFrame} {M : SemistableModel F}
    (C : CompletedCoefficientCrystal M) (n : ℕ) :
    (etaleModulePullback (coefficientAmbientReduction M n)).obj
      ((C.level (n+1)).crystal.evaluation (coefficientModelPDObject M (n+1))) ≅
        (C.level n).crystal.evaluation (coefficientModelPDObject M n) := by sorry
-- Explicit p-inversion: retain an integral lattice as object and localize Hom.
structure RationalCoefficientCrystal {F : ArithmeticFrame} (M : SemistableModel F) where
  integral : CompletedCoefficientCrystal M
def rationalCoefficientHom {F : ArithmeticFrame} {M : SemistableModel F}
    (C D : RationalCoefficientCrystal M) := F.K0 ⊗[WittVector F.p F.k] (C.integral ⟶ D.integral)
def rationalCoefficientComp {F : ArithmeticFrame} {M : SemistableModel F}
    {C D E : RationalCoefficientCrystal M} (f : rationalCoefficientHom C D)
    (g : rationalCoefficientHom D E) : rationalCoefficientHom C E := by sorry
instance {F : ArithmeticFrame} (M : SemistableModel F) : Category.{1} (RationalCoefficientCrystal M) where
  Hom := rationalCoefficientHom
  id C := 1 ⊗ₜ[WittVector F.p F.k] (𝟙 C.integral)
  comp := rationalCoefficientComp
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
instance {F : ArithmeticFrame} (M : SemistableModel F) : Preadditive (RationalCoefficientCrystal M) := by sorry
instance {F : ArithmeticFrame} (M : SemistableModel F) : Linear F.K0 (RationalCoefficientCrystal M) := by sorry
theorem rationalCoefficientComp_tmul {F : ArithmeticFrame} {M : SemistableModel F}
    {C D E : RationalCoefficientCrystal M} (a b : F.K0)
    (f : C.integral ⟶ D.integral) (g : D.integral ⟶ E.integral) :
    rationalCoefficientComp (C := C) (D := D) (E := E)
      (a ⊗ₜ[WittVector F.p F.k] f) (b ⊗ₜ[WittVector F.p F.k] g) =
        (a*b) ⊗ₜ[WittVector F.p F.k] (f ≫ g) := by sorry
def coefficientIntegralInversion {F : ArithmeticFrame} (M : SemistableModel F) :
    CompletedCoefficientCrystal M ⥤ RationalCoefficientCrystal M where
  obj C := ⟨C⟩
  map f := 1 ⊗ₜ[WittVector F.p F.k] f
  map_id := by sorry
  map_comp := by sorry
-- Levelwise pullback along absolute Frobenius of M/p and Witt sigma, followed
-- by the same reduction isomorphisms. This does not require a lift on O.
def coefficientLevelFrobenius {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    FiniteProjectiveCrystal (coefficientPDBase F n) (coefficientLevelSource M n) ⥤
      FiniteProjectiveCrystal (coefficientPDBase F n) (coefficientLevelSource M n) := by sorry
def completedCoefficientFrobenius {F : ArithmeticFrame} (M : SemistableModel F) :
    CompletedCoefficientCrystal M ⥤ CompletedCoefficientCrystal M := by sorry
def completedCoefficientFrobenius_level {F : ArithmeticFrame} (M : SemistableModel F) (n : ℕ) :
    completedCoefficientFrobenius M ⋙ completedCoefficientLevel M n ≅
      completedCoefficientLevel M n ⋙ coefficientLevelFrobenius M n := by sorry
def coefficientFrobeniusPullback {F : ArithmeticFrame} (M : SemistableModel F) :
    RationalCoefficientCrystal M ⥤ RationalCoefficientCrystal M := by sorry
theorem coefficientFrobeniusPullback_integral {F : ArithmeticFrame} {M : SemistableModel F}
    (C : RationalCoefficientCrystal M) :
    ((coefficientFrobeniusPullback M).obj C).integral = (completedCoefficientFrobenius M).obj C.integral := by sorry
theorem coefficientFrobeniusPullback_smul {F : ArithmeticFrame} {M : SemistableModel F}
    {C D : RationalCoefficientCrystal M} (a : F.K0) (f : C ⟶ D) :
    (coefficientFrobeniusPullback M).map (a • f) = F.sigma a • (coefficientFrobeniusPullback M).map f := by sorry
-- General relative log forms and connections reuse the CR.5 sheaf tensor.
def relativeLogDerivative {X Y : LogScheme} (f : X ⟶ Y) (U : X.scheme.Etaleᵒᵖ) :
    (etaleStructureRingSheaf X.scheme).obj.obj U →+ (relativeLogFormSheaf f 1).val.obj U := by sorry
structure RelativeSheafConnection {X Y : LogScheme} (f : X ⟶ Y) where
  modules : EtaleModules X.scheme
  nabla : ∀ U, modules.val.obj U →+ (etaleModuleTensor modules (relativeLogFormSheaf f 1)).val.obj U
  restriction : ∀ {U V} (g : U ⟶ V) m,
    (etaleModuleTensor modules (relativeLogFormSheaf f 1)).val.map g (nabla U m) =
      nabla V (modules.val.map g m)
  leibniz : ∀ U a m, nabla U (a • m) = a • nabla U m +
    etaleTensorSection modules (relativeLogFormSheaf f 1) U m (relativeLogDerivative f U a)
def relativeSheafExtended {X Y : LogScheme} {f : X ⟶ Y} (C : RelativeSheafConnection f)
    (q : ℕ) (U : X.scheme.Etaleᵒᵖ) :
    (etaleModuleTensor C.modules (relativeLogFormSheaf f q)).val.obj U →+
      (etaleModuleTensor C.modules (relativeLogFormSheaf f (q+1))).val.obj U := by sorry
def RelativeSheafIntegrable {X Y : LogScheme} {f : X ⟶ Y} (C : RelativeSheafConnection f) : Prop :=
  ∀ U m, relativeSheafExtended C 1 U (C.nabla U m) = 0
def modelOverWitt {F : ArithmeticFrame} (M : SemistableModel F) :
    M.object ⟶ trivialLogScheme (Spec (CommRingCat.of (WittVector F.p F.k))) := by sorry
-- The structure map is induced by integralWittEmbedding : W -> O and M -> O.
-- Reducing this algebraic connection gives a connection in the PD quotient forms.
def coefficientConnectionReduction {F : ArithmeticFrame} {M : SemistableModel F}
    (C : RelativeSheafConnection (modelOverWitt M)) (hi : RelativeSheafIntegrable C) (n : ℕ) :
    PDConnectionSheaf (coefficientModelPDObject M n).thickening := by sorry
-- Restriction to M/p^(n+1), using coefficientModelPDObject_ambient.
def coefficientLatticeRestriction {F : ArithmeticFrame} {M : SemistableModel F}
    (L : EtaleModules M.object.scheme) (n : ℕ) :
    EtaleModules (coefficientModelPDObject M n).thickening.ambient.object.scheme :=
  (etaleModulePullback (coefficientModelAmbientInclusion M n)).obj L
def coefficientConnectionReductionTransition {F : ArithmeticFrame} {M : SemistableModel F}
    (C : RelativeSheafConnection (modelOverWitt M)) (hi : RelativeSheafIntegrable C) (n : ℕ) :
    (etaleModulePullback (coefficientAmbientReduction M n)).obj
      (coefficientConnectionReduction C hi (n+1)).modules ≅
        (coefficientConnectionReduction C hi n).modules := by sorry
-- Algebraization is additional data. Completed crystals canonically give a
-- FORMAL realization; no arbitrary nonproper algebraization is inferred.
structure CoefficientAlgebraization {F : ArithmeticFrame} {M : SemistableModel F}
    (C : RationalCoefficientCrystal M) where
  connection : RelativeSheafConnection (modelOverWitt M)
  finiteLocallyFree : EtaleFiniteLocallyFree connection.modules
  integrable : RelativeSheafIntegrable connection
  reduction : ∀ n, (coefficientConnectionReduction connection integrable n).modules ≅
    (C.integral.level n).crystal.evaluation (coefficientModelPDObject M n)
  compatibleReduction : ∀ n,
    (etaleModulePullback (coefficientAmbientReduction M n)).map (reduction (n+1)).hom ≫
      (coefficientEvaluationReduction C.integral n).hom =
        (coefficientConnectionReductionTransition connection integrable n).hom ≫ (reduction n).hom
  horizontal : ∀ n U m,
    let A := coefficientConnectionReduction connection integrable n
    let D := crystalEvaluation (C.integral.level n).crystal (coefficientModelPDObject M n).thickening
    D.nabla U ((reduction n).hom.val.app U m) =
      (etaleTensorMap (reduction n).hom (𝟙 (pdFormSheaf (coefficientModelPDObject M n).thickening 1))).val.app U
        (A.nabla U m)
theorem coefficientConnectionReduction_modules {F : ArithmeticFrame} {M : SemistableModel F}
    (C : RelativeSheafConnection (modelOverWitt M)) (hi : RelativeSheafIntegrable C) (n : ℕ) :
    (coefficientConnectionReduction C hi n).modules = coefficientLatticeRestriction C.modules n := by sorry
-- Generic realization is restriction of THAT algebraic lattice, followed by
-- quotienting W-relative forms to K-relative forms. It exists here because A is supplied.
def semistableGenericInclusion {F : ArithmeticFrame} (M : SemistableModel F) :
    semistableGeneric M ⟶ M.object.scheme := by sorry
def genericLogStructureMap {F : ArithmeticFrame} (M : SemistableModel F) :
    trivialLogScheme (semistableGeneric M) ⟶ trivialLogScheme (Spec (CommRingCat.of F.K)) := by sorry
def coefficientDeRhamSheaf {F : ArithmeticFrame} {M : SemistableModel F}
    {C : RationalCoefficientCrystal M} (A : CoefficientAlgebraization C) : EtaleModules (semistableGeneric M) :=
    (etaleModulePullback (semistableGenericInclusion M)).obj A.connection.modules
def coefficientDeRhamConnection {F : ArithmeticFrame} {M : SemistableModel F}
    {C : RationalCoefficientCrystal M} (A : CoefficientAlgebraization C) :
    RelativeSheafConnection (genericLogStructureMap M) := by sorry
theorem coefficientDeRhamConnection_modules {F : ArithmeticFrame} {M : SemistableModel F}
    {C : RationalCoefficientCrystal M} (A : CoefficientAlgebraization C) :
    (coefficientDeRhamConnection A).modules = coefficientDeRhamSheaf A := by sorry
theorem coefficientDeRham_integrable {F : ArithmeticFrame} {M : SemistableModel F}
    {C : RationalCoefficientCrystal M} (A : CoefficientAlgebraization C) :
    RelativeSheafIntegrable (coefficientDeRhamConnection A) := by sorry
-- Filtration subobjects and tensor images are SHEAF submodules.
def etaleSubmodulePullback {X Y : Scheme.{0}} (f : X ⟶ Y) {M : EtaleModules Y}
    (P : SheafOfModules.Submodule M) : SheafOfModules.Submodule ((etaleModulePullback f).obj M) := by sorry
-- Defined as the sheaf image of f^*P -> f^*M; on etale maps or split P,
-- this is the usual pullback subbundle. No flatness of a general model map is assumed.
def EtaleLocallySplit {X : Scheme.{0}} {M : EtaleModules X} (P : SheafOfModules.Submodule M) : Prop :=
  ∀ x : X, ∃ U : X.Etale, ∃ u : U.left, U.hom.base u = x ∧
    ∃ Q : SheafOfModules.Submodule ((etaleModulePullback U.hom).obj M),
      IsCompl (etaleSubmodulePullback U.hom P) Q
def etaleTensorSubmodule {X : Scheme.{0}} {M : EtaleModules X}
    (P : SheafOfModules.Submodule M) (N : EtaleModules X) :
    SheafOfModules.Submodule (etaleModuleTensor M N) := by sorry
-- Sheaf image of P tensor N -> M tensor N; membership means LOCAL image membership.
def projectiveLineEulerSubbundle (k : Type) [Field k] :
    SheafOfModules.Submodule (etaleFree (projectiveLine k) 2) := by sorry
-- Image of O(-1) -> O^2 given by the two homogeneous coordinates;
-- its quotient is O(1), the Euler sequence on this actual projective line.
-- Test: TauCeti.LogCrystalline.arithmeticCoefficientInterface.local_split_not_global
example (k : Type) [Field k] :
    EtaleLocallySplit (projectiveLineEulerSubbundle k) ∧
      ¬ ∃ Q : SheafOfModules.Submodule (etaleFree (projectiveLine k) 2),
        IsCompl (projectiveLineEulerSubbundle k) Q := by sorry
structure ArithmeticCoefficientData {F : ArithmeticFrame} (M : SemistableModel F) where
  crystal : RationalCoefficientCrystal M
  algebraization : CoefficientAlgebraization crystal
  phi : (coefficientFrobeniusPullback M).obj crystal ⟶ crystal
  phiIso : IsIso phi
  monodromy : crystal ⟶ crystal
  relation : phi ≫ monodromy =
    (F.p : F.K0) • ((coefficientFrobeniusPullback M).map monodromy ≫ phi)
  filtration : ℤ → SheafOfModules.Submodule (coefficientDeRhamConnection algebraization).modules
  decreasing : ∀ i, filtration (i+1) ≤ filtration i
  locallySplit : ∀ i, EtaleLocallySplit (filtration i)
  exhaustive : iSup filtration = ⊤
  separated : iInf filtration = ⊥
  transverse : ∀ i U x, x ∈ (filtration i).obj U →
    (coefficientDeRhamConnection algebraization).nabla U x ∈
      (etaleTensorSubmodule (filtration (i-1)) (relativeLogFormSheaf (genericLogStructureMap M) 1)).obj U
def arithmeticCoefficientInterface {F : ArithmeticFrame} {M : SemistableModel F}
    (C : ArithmeticCoefficientData M) : ArithmeticCoefficientData M := C
-- Pullback at each finite level is along the actual map M'/p -> M/p.
def coefficientLevelModelPullback {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (n : ℕ) :
    FiniteProjectiveCrystal (coefficientPDBase F n) (coefficientLevelSource M n) ⥤
      FiniteProjectiveCrystal (coefficientPDBase F n) (coefficientLevelSource M' n) := by sorry
def completedCoefficientModelPullback {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) : CompletedCoefficientCrystal M ⥤ CompletedCoefficientCrystal M' := by sorry
def coefficientModelPullback {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) : RationalCoefficientCrystal M ⥤ RationalCoefficientCrystal M' := by sorry
def coefficientModelPullback_level {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (n : ℕ) :
    completedCoefficientModelPullback f ⋙ completedCoefficientLevel M' n ≅
      completedCoefficientLevel M n ⋙ coefficientLevelModelPullback f n := by sorry
def coefficientModelPullback_frobenius {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) :
    coefficientFrobeniusPullback M ⋙ coefficientModelPullback f ≅
      coefficientModelPullback f ⋙ coefficientFrobeniusPullback M' := by sorry
def coefficientGenericModelMap {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) : semistableGeneric M' ⟶ semistableGeneric M := by sorry
theorem coefficientGenericModelMap_square {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) :
    coefficientGenericModelMap f ≫ semistableGenericInclusion M =
      semistableGenericInclusion M' ≫ logUnderlying f.map := by sorry
def etaleSubmoduleTransport {X : Scheme.{0}} {M N : EtaleModules X}
    (e : M ≅ N) (P : SheafOfModules.Submodule M) : SheafOfModules.Submodule N := by sorry
-- The image under e; its sections are exactly e(P), since e is an isomorphism.
-- Pull back the algebraized generic connection along the actual generic map.
-- Its differential is the pullback of nabla plus the scalar derivative,
-- followed by the natural map on relative log forms (the chain rule).
def coefficientDeRhamPullbackConnection {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) {C : RationalCoefficientCrystal M}
    (A : CoefficientAlgebraization C) : RelativeSheafConnection (genericLogStructureMap M') where
  modules := (etaleModulePullback (coefficientGenericModelMap f)).obj
    (coefficientDeRhamConnection A).modules
  nabla := by sorry
  restriction := by sorry
  leibniz := by sorry
theorem coefficientDeRhamPullbackConnection_integrable {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) {C : RationalCoefficientCrystal M}
    (A : CoefficientAlgebraization C) : RelativeSheafIntegrable (coefficientDeRhamPullbackConnection f A) := by sorry
namespace arithmeticCoefficientInterface
 def frobenius {F : ArithmeticFrame} {M : SemistableModel F} (C : ArithmeticCoefficientData M) :
    (coefficientFrobeniusPullback M).obj C.crystal ⟶ C.crystal := C.phi
 def twist {F : ArithmeticFrame} {M : SemistableModel F} (C : ArithmeticCoefficientData M) (r : ℤ) :
    ArithmeticCoefficientData M where
  crystal := C.crystal
  algebraization := C.algebraization
  phi := (F.p : F.K0)^(-r) • C.phi
  phiIso := by sorry
  monodromy := C.monodromy
  relation := by sorry
  filtration i := C.filtration (i+r)
  decreasing := by sorry
  locallySplit := by sorry
  exhaustive := by sorry
  separated := by sorry
  transverse := by sorry
 def base_change {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (C : ArithmeticCoefficientData M) : ArithmeticCoefficientData M' := by sorry
 def base_change_crystal {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (C : ArithmeticCoefficientData M) :
    (base_change f C).crystal ≅ (coefficientModelPullback f).obj C.crystal := by sorry
 theorem base_change_monodromy {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (C : ArithmeticCoefficientData M) :
    (base_change f C).monodromy ≫ (base_change_crystal f C).hom =
      (base_change_crystal f C).hom ≫ (coefficientModelPullback f).map C.monodromy := by sorry
 theorem base_change_frobenius {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (C : ArithmeticCoefficientData M) :
    (base_change f C).phi ≫ (base_change_crystal f C).hom =
      (coefficientFrobeniusPullback M').map (base_change_crystal f C).hom ≫
        (coefficientModelPullback_frobenius f).inv.app C.crystal ≫
          (coefficientModelPullback f).map C.phi := by sorry
 def base_change_deRham {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (C : ArithmeticCoefficientData M) :
    (etaleModulePullback (coefficientGenericModelMap f)).obj
      (coefficientDeRhamConnection C.algebraization).modules ≅
        (coefficientDeRhamConnection (base_change f C).algebraization).modules := by sorry
 theorem base_change_horizontal {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (C : ArithmeticCoefficientData M) (U : (semistableGeneric M').Etaleᵒᵖ)
    (m : (coefficientDeRhamPullbackConnection f C.algebraization).modules.val.obj U) :
    (coefficientDeRhamConnection (base_change f C).algebraization).nabla U
      ((base_change_deRham f C).hom.val.app U m) =
        (etaleTensorMap (base_change_deRham f C).hom
          (𝟙 (relativeLogFormSheaf (genericLogStructureMap M') 1))).val.app U
            ((coefficientDeRhamPullbackConnection f C.algebraization).nabla U m) := by sorry
 theorem base_change_filtration {F : ArithmeticFrame} {M M' : SemistableModel F}
    (f : SemistableMorphism M' M) (C : ArithmeticCoefficientData M) (i : ℤ) :
    (base_change f C).filtration i = etaleSubmoduleTransport (base_change_deRham f C)
      (etaleSubmodulePullback (coefficientGenericModelMap f) (C.filtration i)) := by sorry
end arithmeticCoefficientInterface
-- Test: TauCeti.LogCrystalline.arithmeticCoefficientInterface.twist_zero
example {F : ArithmeticFrame} {M : SemistableModel F} (C : ArithmeticCoefficientData M) :
    arithmeticCoefficientInterface.twist C 0 = C := by sorry
-- Test: TauCeti.LogCrystalline.arithmeticCoefficientInterface.twist_minus_one
example {F : ArithmeticFrame} {M : SemistableModel F} (C : ArithmeticCoefficientData M) :
    (arithmeticCoefficientInterface.twist C (-1)).phi = (F.p : F.K0) • C.phi ∧
    ∀ i, (arithmeticCoefficientInterface.twist C (-1)).filtration i = C.filtration (i-1) := by sorry
def constantArithmeticCoefficient {F : ArithmeticFrame} (M : SemistableModel F)
    (weight : ℤ) : ArithmeticCoefficientData M := by sorry
-- Test: TauCeti.LogCrystalline.arithmeticCoefficientInterface.crystal_not_filtered
example {F : ArithmeticFrame} (M : SemistableModel F) (hn : Nonempty (semistableGeneric M)) :
    (constantArithmeticCoefficient M 0).crystal = (constantArithmeticCoefficient M 1).crystal ∧
    (constantArithmeticCoefficient M 0).filtration ≠ (constantArithmeticCoefficient M 1).filtration := by sorry

-- Every p-divisible group, group morphism, Cartier dual and Dieudonne functor
-- below is imported from R07.2. The source scheme is retained in each type.
def PDivisibleGroup (S : Scheme.{0}) (p : ℕ) : Type 1 := by sorry
instance (S : Scheme.{0}) (p : ℕ) : Category.{0} (PDivisibleGroup S p) := by sorry
def dieudonneFunctor (B : LogPDBase) (Z : LogOverPDBase B) [Fact (InCharacteristic B.p Z.object)]
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme)) :
    (PDivisibleGroup Z.object.scheme B.p)ᵒᵖ ⥤ Crystals B Z := by sorry
def dieudonneEvaluation {B : LogPDBase} {Z : LogOverPDBase B} [Fact (InCharacteristic B.p Z.object)]
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme))
    (G : PDivisibleGroup Z.object.scheme B.p) (T : (LogCrysObject B Z)ᵒᵖ)
    (ha : IsAffine T.unop.thickening.ambient.object.scheme) :
    FiniteProjectiveEvaluation ((logCrystallineStructure B Z).obj.obj T) := by sorry
def crystalFrobeniusPullback (B : LogPDBase) (Z : LogOverPDBase B) [Fact (InCharacteristic B.p Z.object)] : Crystals B Z ⥤ Crystals B Z := by sorry
def dieudonneCrystalF {B : LogPDBase} {Z : LogOverPDBase B} [Fact (InCharacteristic B.p Z.object)]
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme)) (G : PDivisibleGroup Z.object.scheme B.p) :
    (crystalFrobeniusPullback B Z).obj ((dieudonneFunctor B Z hB hZ).obj (Opposite.op G)) ⟶
      (dieudonneFunctor B Z hB hZ).obj (Opposite.op G) := by sorry
def dieudonneCrystalV {B : LogPDBase} {Z : LogOverPDBase B} [Fact (InCharacteristic B.p Z.object)]
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme)) (G : PDivisibleGroup Z.object.scheme B.p) :
    (dieudonneFunctor B Z hB hZ).obj (Opposite.op G) ⟶
      (crystalFrobeniusPullback B Z).obj ((dieudonneFunctor B Z hB hZ).obj (Opposite.op G)) := by sorry
namespace dieudonneEvaluation
 def evaluate {B : LogPDBase} {Z : LogOverPDBase B} [Fact (InCharacteristic B.p Z.object)]
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme))
    (G : PDivisibleGroup Z.object.scheme B.p) (T : (LogCrysObject B Z)ᵒᵖ)
    (ha : IsAffine T.unop.thickening.ambient.object.scheme) :
    (dieudonneEvaluation hB hZ G T ha).module ≅
      ((dieudonneFunctor B Z hB hZ).obj (Opposite.op G)).modules.obj T := by sorry
 def contravariant {B : LogPDBase} {Z : LogOverPDBase B} [Fact (InCharacteristic B.p Z.object)]
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme))
    {G H : PDivisibleGroup Z.object.scheme B.p} (f : G ⟶ H) :
    (dieudonneFunctor B Z hB hZ).obj (Opposite.op H) ⟶
      (dieudonneFunctor B Z hB hZ).obj (Opposite.op G) :=
    (dieudonneFunctor B Z hB hZ).map f.op
 theorem fv {B : LogPDBase} {Z : LogOverPDBase B} [Fact (InCharacteristic B.p Z.object)]
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme)) (G : PDivisibleGroup Z.object.scheme B.p) :
    dieudonneCrystalV hB hZ G ≫ dieudonneCrystalF hB hZ G =
      B.p • (𝟙 ((dieudonneFunctor B Z hB hZ).obj (Opposite.op G))) ∧
      dieudonneCrystalF hB hZ G ≫ dieudonneCrystalV hB hZ G =
      B.p • (𝟙 ((crystalFrobeniusPullback B Z).obj ((dieudonneFunctor B Z hB hZ).obj (Opposite.op G)))) := by sorry
end dieudonneEvaluation
-- Actual Witt evaluations supplied by the R07.2 standard-module nodes.
def constantPDivisible (F : ArithmeticFrame) : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p := by sorry
def multiplicativePDivisible (F : ArithmeticFrame) : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p := by sorry
def dieudonneWittModule {F : ArithmeticFrame} (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p) :
    ModuleCat.{0} (WittVector F.p F.k) := by sorry
def dieudonneWittF {F : ArithmeticFrame} (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p) :
    dieudonneWittModule G →ₛₗ[(WittVector.frobenius (p := F.p) (R := F.k))] dieudonneWittModule G := by sorry
def dieudonneWittV {F : ArithmeticFrame} (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p) :
    dieudonneWittModule G →ₛₗ[(WittVector.frobeniusEquiv F.p F.k).symm.toRingHom] dieudonneWittModule G := by sorry
def constantDieudonneBasis (F : ArithmeticFrame) :
    dieudonneWittModule (constantPDivisible F) ≃ₗ[WittVector F.p F.k] WittVector F.p F.k := by sorry
def multiplicativeDieudonneBasis (F : ArithmeticFrame) :
    dieudonneWittModule (multiplicativePDivisible F) ≃ₗ[WittVector F.p F.k] WittVector F.p F.k := by sorry
-- Test: TauCeti.LogCrystalline.dieudonneEvaluation.constant
example (F : ArithmeticFrame) (x : dieudonneWittModule (constantPDivisible F)) :
    constantDieudonneBasis F (dieudonneWittF (constantPDivisible F) x) =
      WittVector.frobenius (constantDieudonneBasis F x) ∧
    constantDieudonneBasis F (dieudonneWittV (constantPDivisible F) x) =
      (F.p : WittVector F.p F.k) * (WittVector.frobeniusEquiv F.p F.k).symm (constantDieudonneBasis F x) := by sorry
-- Test: TauCeti.LogCrystalline.dieudonneEvaluation.multiplicative
example (F : ArithmeticFrame) (x : dieudonneWittModule (multiplicativePDivisible F)) :
    multiplicativeDieudonneBasis F (dieudonneWittF (multiplicativePDivisible F) x) =
      (F.p : WittVector F.p F.k) * WittVector.frobenius (multiplicativeDieudonneBasis F x) ∧
    multiplicativeDieudonneBasis F (dieudonneWittV (multiplicativePDivisible F) x) =
      (WittVector.frobeniusEquiv F.p F.k).symm (multiplicativeDieudonneBasis F x) := by sorry
-- Test: TauCeti.LogCrystalline.dieudonneEvaluation.variance
example {B : LogPDBase} {Z : LogOverPDBase B} [Fact (InCharacteristic B.p Z.object)]
    (hB : Nonempty (B.object ≅ trivialLogScheme (Spec B.ring)))
    (hZ : Nonempty (Z.object ≅ trivialLogScheme Z.object.scheme))
    {G H : PDivisibleGroup Z.object.scheme B.p} (f : G ⟶ H) :
    dieudonneEvaluation.contravariant hB hZ f = (dieudonneFunctor B Z hB hZ).map f.op := by sorry

def pDivisibleCartierDual {S : Scheme.{0}} {p : ℕ} (G : PDivisibleGroup S p) : PDivisibleGroup S p := by sorry
def rationalDieudonne {F : ArithmeticFrame} (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p) :
    ModuleCat.{0} F.K0 := (ModuleCat.extendScalars (algebraMap (WittVector F.p F.k) F.K0)).obj (dieudonneWittModule G)
def pDivisibleCartierBidual {S : Scheme.{0}} {p : ℕ} (G : PDivisibleGroup S p) :
    pDivisibleCartierDual (pDivisibleCartierDual G) ≅ G := by sorry
def rationalDieudonnePhi {F : ArithmeticFrame} (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p) :
    rationalDieudonne G →ₛₗ[F.sigma.toRingHom] rationalDieudonne G := by sorry
def ordinaryDieudonneDualPhi {F : ArithmeticFrame}
    (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p) :
    Module.Dual F.K0 (rationalDieudonne G) →ₛₗ[F.sigma.toRingHom]
      Module.Dual F.K0 (rationalDieudonne G) := by sorry
def dieudonneDualTwistPhi {F : ArithmeticFrame} (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p) :
    Module.Dual F.K0 (rationalDieudonne G) →ₛₗ[F.sigma.toRingHom]
      Module.Dual F.K0 (rationalDieudonne G) := (F.p : F.K0) • ordinaryDieudonneDualPhi G
def dieudonne_dual_twist {F : ArithmeticFrame} (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p) :
    rationalDieudonne (pDivisibleCartierDual G) ≃ₗ[F.K0] Module.Dual F.K0 (rationalDieudonne G) := by sorry
theorem dieudonne_dual_twist_phi {F : ArithmeticFrame} (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p)
    (x : rationalDieudonne (pDivisibleCartierDual G)) :
    dieudonne_dual_twist G (rationalDieudonnePhi (pDivisibleCartierDual G) x) =
      dieudonneDualTwistPhi G (dieudonne_dual_twist G x) := by sorry

theorem dieudonne_variance_twist {F : ArithmeticFrame}
    (G : PDivisibleGroup (Spec (CommRingCat.of F.k)) F.p)
    (x : rationalDieudonne (pDivisibleCartierDual G)) :
    dieudonne_dual_twist G (rationalDieudonnePhi (pDivisibleCartierDual G) x) =
      (F.p : F.K0) • ordinaryDieudonneDualPhi G (dieudonne_dual_twist G x) := by sorry
-- The evaluated maps and direct summand come from R07, never arbitrary i,q.
def nilpotentPD {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z) : Prop :=
  ∀ U, ∃ n, ∀ m ≥ n, ∀ x ∈ thickeningIdeal T.closed U, (T.delta U).dpow m x = 0
def messingEvaluation {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (G : PDivisibleGroup Z.object.scheme B.p) : ModuleCat.{0} Γ(T.ambient.object.scheme, ⊤) := by sorry
def pDivisiblePullback {S S' : Scheme.{0}} {p : ℕ} (f : S' ⟶ S)
    (G : PDivisibleGroup S p) : PDivisibleGroup S' p := by sorry
structure LiftedPDivisibleGroup {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (G : PDivisibleGroup Z.object.scheme B.p) where
  lift : PDivisibleGroup T.ambient.object.scheme B.p
  reductionIso : pDivisiblePullback (logUnderlying T.closed) lift ≅ G
def messingHodge {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (G : PDivisibleGroup Z.object.scheme B.p) (L : LiftedPDivisibleGroup T G) :
    Submodule Γ(T.ambient.object.scheme, ⊤) (messingEvaluation T G) := by sorry
def pDivisibleCotangent {B : LogPDBase} (Z : LogOverPDBase B)
    (G : PDivisibleGroup Z.object.scheme B.p) : ModuleCat.{0} Γ(Z.object.scheme, ⊤) := by sorry
def dualPDivisibleLie {B : LogPDBase} (Z : LogOverPDBase B)
    (G : PDivisibleGroup Z.object.scheme B.p) : ModuleCat.{0} Γ(Z.object.scheme, ⊤) := by sorry
def messingSpecialEvaluation {B : LogPDBase} (Z : LogOverPDBase B)
    (G : PDivisibleGroup Z.object.scheme B.p) : ModuleCat.{0} Γ(Z.object.scheme, ⊤) := by sorry
def messingHodgeInjection {B : LogPDBase} (Z : LogOverPDBase B)
    (G : PDivisibleGroup Z.object.scheme B.p) : pDivisibleCotangent Z G →ₗ[Γ(Z.object.scheme, ⊤)] messingSpecialEvaluation Z G := by sorry
def messingHodgeQuotient {B : LogPDBase} (Z : LogOverPDBase B)
    (G : PDivisibleGroup Z.object.scheme B.p) : messingSpecialEvaluation Z G →ₗ[Γ(Z.object.scheme, ⊤)] dualPDivisibleLie Z G := by sorry
theorem messing_filtration_exact {B : LogPDBase} (Z : LogOverPDBase B)
    (G : PDivisibleGroup Z.object.scheme B.p) (ha : IsAffine Z.object.scheme) :
    Function.Injective (messingHodgeInjection Z G) ∧
    LinearMap.range (messingHodgeInjection Z G) = LinearMap.ker (messingHodgeQuotient Z G) ∧
    Function.Surjective (messingHodgeQuotient Z G) := by sorry
theorem messing_lift_directSummand {B : LogPDBase} {Z : LogOverPDBase B} (T : LogPDThickening B Z)
    (G : PDivisibleGroup Z.object.scheme B.p) (L : LiftedPDivisibleGroup T G) (hn : nilpotentPD T)
    (ha : IsAffine T.ambient.object.scheme) :
    ∃ Q : Submodule Γ(T.ambient.object.scheme, ⊤) (messingEvaluation T G), IsCompl (messingHodge T G L) Q := by sorry

theorem messing_filtration_interface {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (G : PDivisibleGroup Z.object.scheme B.p)
    (L : LiftedPDivisibleGroup T G) (hn : nilpotentPD T)
    (ha : IsAffine T.ambient.object.scheme) :
    ∃ Q : Submodule Γ(T.ambient.object.scheme, ⊤) (messingEvaluation T G),
      IsCompl (messingHodge T G L) Q := by sorry
structure ProperSmoothFamily (B : LogPDBase) where
  source : LogOverPDBase B
  base : LogOverPDBase B
  map : source.object ⟶ base.object
  overBase : map ≫ base.structureMap = source.structureMap
  strict : IsStrict map
  smooth : Smooth (logUnderlying map)
  proper : IsProper (logUnderlying map)
  qcBase : CompactSpace base.object.scheme
  coefficient : FiniteProjectiveCrystal B source
-- CR.1's derived module sheaves, and E1's derived scalar extension, have
-- fixed supplier owners. A proper family does not imply H^i is locally free.
def DerivedCrystal (B : LogPDBase) (Y : LogOverPDBase B) : Type 1 := by sorry
def derivedCrystalEvaluation {B : LogPDBase} {Y : LogOverPDBase B}
    (D : DerivedCrystal B Y) (T : LogCrysObject B Y) :
    LogDerived Γ(T.thickening.ambient.object.scheme, ⊤) := by sorry
def relativeCrystallineImage {B : LogPDBase} (D : ProperSmoothFamily B) : DerivedCrystal B D.base := by sorry
def relativeCrystallineFibre {B : LogPDBase} (D : ProperSmoothFamily B)
    (T : LogCrysObject B D.base) : LogDerived Γ(T.thickening.ambient.object.scheme, ⊤) := by sorry
def derivedPDScalar {B : LogPDBase} {Y : LogOverPDBase B} {T T' : LogCrysObject B Y}
    (g : T' ⟶ T) : LogDerived Γ(T.thickening.ambient.object.scheme, ⊤) ⥤
      LogDerived Γ(T'.thickening.ambient.object.scheme, ⊤) := by sorry
def identityProperFamily (B : LogPDBase) (Y : LogOverPDBase B)
    (hqc : CompactSpace Y.object.scheme) : ProperSmoothFamily B where
  source := Y
  base := Y
  map := 𝟙 _
  overBase := by sorry
  strict := by sorry
  smooth := by sorry
  proper := by sorry
  qcBase := hqc
  coefficient := finiteStructureCrystal B Y
def crystalInDegreeZero {B : LogPDBase} {Y : LogOverPDBase B} (F : FiniteProjectiveCrystal B Y) :
    DerivedCrystal B Y := by sorry
namespace relativeCrystallineImage
 def evaluate {B : LogPDBase} (D : ProperSmoothFamily B) (T : LogCrysObject B D.base) :
    derivedCrystalEvaluation (relativeCrystallineImage D) T ≅ relativeCrystallineFibre D T := by sorry
 def base_change_map {B : LogPDBase} (D : ProperSmoothFamily B) {T T' : LogCrysObject B D.base}
    (g : T' ⟶ T) : (derivedPDScalar g).obj (derivedCrystalEvaluation (relativeCrystallineImage D) T) ⟶
      derivedCrystalEvaluation (relativeCrystallineImage D) T' := by sorry
 theorem identity (B : LogPDBase) (Y : LogOverPDBase B) (hqc : CompactSpace Y.object.scheme) :
    relativeCrystallineImage (identityProperFamily B Y hqc) = crystalInDegreeZero (finiteStructureCrystal B Y) := by sorry
end relativeCrystallineImage
-- Test: TauCeti.LogCrystalline.relativeCrystallineImage.identity
example (B : LogPDBase) (Y : LogOverPDBase B) (hqc : CompactSpace Y.object.scheme)
    (T : LogCrysObject B Y) (q : ℤ) (hq : q ≠ 0) :
    Limits.IsZero (logH (derivedCrystalEvaluation (relativeCrystallineImage (identityProperFamily B Y hqc)) T) q) := by sorry
def crystallineBasePoint (p : ℕ) [Fact p.Prime] : ProperSmoothFamily (modpPDBase p) :=
  identityProperFamily _ (modpPointSource p) (by sorry)
-- Test: TauCeti.LogCrystalline.relativeCrystallineImage.point
example (p : ℕ) [Fact p.Prime] (T : LogCrysObject (modpPDBase p) (modpPointSource p)) :
    logH (derivedCrystalEvaluation (relativeCrystallineImage (crystallineBasePoint p)) T) 0 ≅
      ModuleCat.of Γ(T.thickening.ambient.object.scheme, ⊤) Γ(T.thickening.ambient.object.scheme, ⊤) := by sorry
def multiplicationPComplex (p : ℕ) [Fact p.Prime] : LogComplex (PadicInt p) := by sorry
def multiplicationPComplex_zero (p : ℕ) [Fact p.Prime] :
    (multiplicationPComplex p).X 0 ≅ ModuleCat.of (PadicInt p) (PadicInt p) := by sorry
def multiplicationPComplex_one (p : ℕ) [Fact p.Prime] :
    (multiplicationPComplex p).X 1 ≅ ModuleCat.of (PadicInt p) (PadicInt p) := by sorry
theorem multiplicationPComplex_d (p : ℕ) [Fact p.Prime] (x : (multiplicationPComplex p).X 0) :
    (multiplicationPComplex_one p).hom ((multiplicationPComplex p).d 0 1 x) =
      (p : PadicInt p) * (multiplicationPComplex_zero p).hom x := by sorry
theorem multiplicationPComplex_other (p : ℕ) [Fact p.Prime] (i : ℤ) (hi : i ≠ 0) (hj : i ≠ 1) :
    Limits.IsZero ((multiplicationPComplex p).X i) := by sorry
-- Test: TauCeti.LogCrystalline.relativeCrystallineImage.no_local_freeness
example (p : ℕ) [Fact p.Prime] :
    Nonempty (logH (DerivedCategory.Q.obj (multiplicationPComplex p)) 1 ≅
      ModuleCat.of (PadicInt p) (PadicInt p ⧸ Ideal.span {(p : PadicInt p)})) ∧
    ¬ Module.Projective (PadicInt p) (logH (DerivedCategory.Q.obj (multiplicationPComplex p)) 1) := by sorry

-- coefficients are hypotheses; properness is not needed for this theorem.
def closedBaseRingMap (B : LogPDBase) (Z : LogOverPDBase B) :
    B.ring →+* Γ(Z.object.scheme, ⊤) := by sorry
structure BOBaseChange where
  base : LogPDBase
  newBase : LogPDBase
  pdMap : newBase.object ⟶ base.object
  ringMap : base.ring →+* newBase.ring
  underlying : logUnderlying pdMap = Spec.map (CommRingCat.ofHom ringMap)
  respectsIdeal : Ideal.map ringMap base.ideal ≤ newBase.ideal
  respectsPD : ∀ n x, x ∈ base.ideal → ringMap (base.gamma.dpow n x) = newBase.gamma.dpow n (ringMap x)
  specialBase : LogOverPDBase base
  specialNewBase : LogOverPDBase newBase
  specialMap : specialNewBase.object ⟶ specialBase.object
  square : specialMap ≫ specialBase.structureMap = specialNewBase.structureMap ≫ pdMap
  specialClosed : IsClosedImmersion (logUnderlying specialBase.structureMap)
  newSpecialClosed : IsClosedImmersion (logUnderlying specialNewBase.structureMap)
  specialIdealBound : RingHom.ker (closedBaseRingMap base specialBase) ≤ base.ideal
  subPD : ∀ n x, x ∈ RingHom.ker (closedBaseRingMap base specialBase) →
    base.gamma.dpow n x ∈ RingHom.ker (closedBaseRingMap base specialBase)
  newIdealBound : RingHom.ker (closedBaseRingMap newBase specialNewBase) ≤ newBase.ideal
  newSubPD : ∀ n x, x ∈ RingHom.ker (closedBaseRingMap newBase specialNewBase) →
    newBase.gamma.dpow n x ∈ RingHom.ker (closedBaseRingMap newBase specialNewBase)
  source : LogOverPDBase base
  map : source.object ⟶ specialBase.object
  overBase : map ≫ specialBase.structureMap = source.structureMap
  smooth : Smooth (logUnderlying map)
  qc : QuasiCompact (logUnderlying map)
  qs : QuasiSeparated (logUnderlying map)
  ordinaryBase : Nonempty (base.object ≅ trivialLogScheme (Spec base.ring))
  ordinaryNewBase : Nonempty (newBase.object ≅ trivialLogScheme (Spec newBase.ring))
  ordinarySource : Nonempty (source.object ≅ trivialLogScheme source.object.scheme)
  ordinarySpecial : Nonempty (specialBase.object ≅ trivialLogScheme specialBase.object.scheme)
  ordinarySpecialNew : Nonempty (specialNewBase.object ≅ trivialLogScheme specialNewBase.object.scheme)
  coefficient : Crystals base source
  flat : ∀ T, Module.Flat ((logCrystallineStructure base source).obj.obj T) (coefficient.modules.obj T)
def boBaseChangedSource (D : BOBaseChange) : LogOverPDBase D.newBase where
  object := logFiberProduct D.map D.specialMap
  structureMap := logFiberProductSnd D.map D.specialMap ≫ D.specialNewBase.structureMap
  extension := by sorry
  charts := by sorry
def boBaseChangedCoefficient (D : BOBaseChange) : Crystals D.newBase (boBaseChangedSource D) := by sorry
def boBaseScalar (D : BOBaseChange) : LogDerived D.base.ring ⥤ LogDerived D.newBase.ring := by sorry
def relativeCrystallineBaseChangeArrow (D : BOBaseChange) :
    (boBaseScalar D).obj (logCrystallineCohomology D.base D.source D.coefficient) ⟶
      logCrystallineCohomology D.newBase (boBaseChangedSource D) (boBaseChangedCoefficient D) := by sorry
theorem relativeCrystalline_baseChange (D : BOBaseChange) : IsIso (relativeCrystallineBaseChangeArrow D) := by sorry

-- The extra cohomology hypotheses are precisely the ones that let a derived
-- crystal yield a finite projective module with a connection on this T.
def relativeCohomology {B : LogPDBase} (D : ProperSmoothFamily B) (T : LogCrysObject B D.base) (q : ℤ) :
    ModuleCat.{0} Γ(T.thickening.ambient.object.scheme, ⊤) :=
  logH (derivedCrystalEvaluation (relativeCrystallineImage D) T) q
def relativeCohomologyBaseChange {B : LogPDBase} (D : ProperSmoothFamily B)
    {T T' : LogCrysObject B D.base} (g : T' ⟶ T) (q : ℤ) :
    ModuleCat.{0} Γ(T'.thickening.ambient.object.scheme, ⊤) := by sorry
def relativeCohomologyBaseChangeArrow {B : LogPDBase} (D : ProperSmoothFamily B)
    {T T' : LogCrysObject B D.base} (g : T' ⟶ T) (q : ℤ) :
    relativeCohomologyBaseChange D g q ⟶ relativeCohomology D T' q := by sorry
structure GaussManinInput {B : LogPDBase} (D : ProperSmoothFamily B)
    (T : LogCrysObject B D.base) (q : ℤ) where
  baseSmooth : IsPDSmooth T.thickening
  finite : Module.Finite Γ(T.thickening.ambient.object.scheme, ⊤) (relativeCohomology D T q)
  projective : Module.Projective Γ(T.thickening.ambient.object.scheme, ⊤) (relativeCohomology D T q)
  cohomologyBaseChange : ∀ (T' : LogCrysObject B D.base) (g : T' ⟶ T),
    IsIso (relativeCohomologyBaseChangeArrow D g q)
def gaussManin {B : LogPDBase} (D : ProperSmoothFamily B) (T : LogCrysObject B D.base)
    (q : ℤ) (h : GaussManinInput D T q) :
    LogConnection (relativeCohomology D T q) (formModule (pdDifferentialGeometry T.thickening) 1)
      (formDerivation (pdDifferentialGeometry T.thickening)) := by sorry
def firstBaseFormBoundary {B : LogPDBase} (D : ProperSmoothFamily B)
    (T : LogCrysObject B D.base) (q : ℤ) : relativeCohomology D T q →+
      relativeCohomology D T q ⊗[Γ(T.thickening.ambient.object.scheme, ⊤)]
        formModule (pdDifferentialGeometry T.thickening) 1 := by sorry
namespace gaussManin
 theorem boundary {B : LogPDBase} (D : ProperSmoothFamily B) (T : LogCrysObject B D.base)
    (q : ℤ) (h : GaussManinInput D T q) : (gaussManin D T q h).nabla = firstBaseFormBoundary D T q := by sorry
 theorem leibniz {B : LogPDBase} (D : ProperSmoothFamily B) (T : LogCrysObject B D.base)
    (q : ℤ) (h : GaussManinInput D T q) (a : Γ(T.thickening.ambient.object.scheme, ⊤))
    (x : relativeCohomology D T q) :
    (gaussManin D T q h).nabla (a • x) = a • (gaussManin D T q h).nabla x +
      x ⊗ₜ[Γ(T.thickening.ambient.object.scheme, ⊤)] formDerivation (pdDifferentialGeometry T.thickening) a := by sorry
 theorem integrable {B : LogPDBase} (D : ProperSmoothFamily B) (T : LogCrysObject B D.base)
    (q : ℤ) (h : GaussManinInput D T q) : IsIntegrableConnection (gaussManin D T q h) := by sorry
end gaussManin
theorem gaussManin_quasiNilpotent {B : LogPDBase} (D : ProperSmoothFamily B)
    (T : LogCrysObject B D.base) (q : ℤ) (h : GaussManinInput D T q)
    (c : PDCoordinateFrame T.thickening) : LogQuasiNilpotent (gaussManin D T q h) c := by sorry
-- The constant family is the actual base change of X/B along Y/B.
def constantProperFamily {B : LogPDBase} (X Y : LogOverPDBase B)
    (hp : IsProper (logUnderlying X.structureMap)) (hs : Smooth (logUnderlying X.structureMap))
    (hx : IsStrict X.structureMap) (hqc : CompactSpace Y.object.scheme) : ProperSmoothFamily B where
  source := ⟨logFiberProduct X.structureMap Y.structureMap,
    logFiberProductSnd X.structureMap Y.structureMap ≫ Y.structureMap, by sorry, by sorry⟩
  base := Y
  map := logFiberProductSnd X.structureMap Y.structureMap
  overBase := by sorry
  strict := by sorry
  smooth := by sorry
  proper := by sorry
  qcBase := hqc
  coefficient := finiteStructureCrystal B _
def constantBaseCohomology {B : LogPDBase} (X : LogOverPDBase B) (q : ℤ) : ModuleCat.{0} B.ring :=
  logH (logCrystallineCohomology B X (finiteStructureCrystal B X).crystal) q
def constantFamilyTensor {B : LogPDBase} (X Y : LogOverPDBase B)
    (hp : IsProper (logUnderlying X.structureMap)) (hs : Smooth (logUnderlying X.structureMap))
    (hx : IsStrict X.structureMap) (hqc : CompactSpace Y.object.scheme) (T : LogCrysObject B Y) (q : ℤ) :
    ModuleCat.{0} Γ(T.thickening.ambient.object.scheme, ⊤) :=
  ModuleCat.of Γ(T.thickening.ambient.object.scheme, ⊤)
    (Γ(T.thickening.ambient.object.scheme, ⊤) ⊗[B.ring] constantBaseCohomology X q)
def constantFamilyTensorConnection {B : LogPDBase} (X Y : LogOverPDBase B)
    (hp : IsProper (logUnderlying X.structureMap)) (hs : Smooth (logUnderlying X.structureMap))
    (hx : IsStrict X.structureMap) (hqc : CompactSpace Y.object.scheme) (T : LogCrysObject B Y) (q : ℤ) :
    LogConnection (constantFamilyTensor X Y hp hs hx hqc T q) (formModule (pdDifferentialGeometry T.thickening) 1)
      (formDerivation (pdDifferentialGeometry T.thickening)) := by sorry
theorem constantFamilyTensorConnection_tmul {B : LogPDBase} (X Y : LogOverPDBase B)
    (hp : IsProper (logUnderlying X.structureMap)) (hs : Smooth (logUnderlying X.structureMap))
    (hx : IsStrict X.structureMap) (hqc : CompactSpace Y.object.scheme) (T : LogCrysObject B Y) (q : ℤ)
    (a : Γ(T.thickening.ambient.object.scheme, ⊤)) (v : constantBaseCohomology X q) :
    (constantFamilyTensorConnection X Y hp hs hx hqc T q).nabla (a ⊗ₜ[B.ring] v) =
      ((1 : Γ(T.thickening.ambient.object.scheme, ⊤)) ⊗ₜ[B.ring] v) ⊗ₜ[Γ(T.thickening.ambient.object.scheme, ⊤)]
        formDerivation (pdDifferentialGeometry T.thickening) a := by sorry
def constantFamilyCohomologyIso {B : LogPDBase} (X Y : LogOverPDBase B)
    (hp : IsProper (logUnderlying X.structureMap)) (hs : Smooth (logUnderlying X.structureMap))
    (hx : IsStrict X.structureMap) (hqc : CompactSpace Y.object.scheme) (T : LogCrysObject B Y) (q : ℤ)
    (h : GaussManinInput (constantProperFamily X Y hp hs hx hqc) T q)
    (hb : ∀ j : ℤ, Module.Projective B.ring (constantBaseCohomology X j)) :
    relativeCohomology (constantProperFamily X Y hp hs hx hqc) T q ≃ₗ[Γ(T.thickening.ambient.object.scheme, ⊤)]
      constantFamilyTensor X Y hp hs hx hqc T q := by sorry
-- Test: TauCeti.LogCrystalline.gaussManin.constant_family
example {B : LogPDBase} (X Y : LogOverPDBase B)
    (hp : IsProper (logUnderlying X.structureMap)) (hs : Smooth (logUnderlying X.structureMap))
    (hx : IsStrict X.structureMap) (hqc : CompactSpace Y.object.scheme) (T : LogCrysObject B Y) (q : ℤ)
    (h : GaussManinInput (constantProperFamily X Y hp hs hx hqc) T q)
    (hb : ∀ j : ℤ, Module.Projective B.ring (constantBaseCohomology X j))
    (x : relativeCohomology (constantProperFamily X Y hp hs hx hqc) T q) :
    TensorProduct.map (constantFamilyCohomologyIso X Y hp hs hx hqc T q h hb).toLinearMap LinearMap.id
      ((gaussManin (constantProperFamily X Y hp hs hx hqc) T q h).nabla x) =
    (constantFamilyTensorConnection X Y hp hs hx hqc T q).nabla
      (constantFamilyCohomologyIso X Y hp hs hx hqc T q h hb x) := by sorry
def identityFamilyCohomologyIso (B : LogPDBase) (Y : LogOverPDBase B)
    (hqc : CompactSpace Y.object.scheme) (T : LogCrysObject B Y) :
    relativeCohomology (identityProperFamily B Y hqc) T 0 ≃ₗ[Γ(T.thickening.ambient.object.scheme, ⊤)]
      Γ(T.thickening.ambient.object.scheme, ⊤) := by sorry
theorem gaussManin_identity_derivation (B : LogPDBase) (Y : LogOverPDBase B)
    (hqc : CompactSpace Y.object.scheme) (T : LogCrysObject B Y)
    (h : GaussManinInput (identityProperFamily B Y hqc) T 0)
    (x : relativeCohomology (identityProperFamily B Y hqc) T 0) :
    TensorProduct.map (identityFamilyCohomologyIso B Y hqc T).toLinearMap LinearMap.id
      ((gaussManin (identityProperFamily B Y hqc) T 0 h).nabla x) =
    (1 : Γ(T.thickening.ambient.object.scheme, ⊤)) ⊗ₜ[Γ(T.thickening.ambient.object.scheme, ⊤)]
      formDerivation (pdDifferentialGeometry T.thickening) (identityFamilyCohomologyIso B Y hqc T x) := by sorry
-- Test: TauCeti.LogCrystalline.gaussManin.identity
example (B : LogPDBase) (Y : LogOverPDBase B) (hqc : CompactSpace Y.object.scheme)
    (T : LogCrysObject B Y) :
    Nonempty (relativeCohomology (identityProperFamily B Y hqc) T 0 ≅
      ModuleCat.of Γ(T.thickening.ambient.object.scheme, ⊤) Γ(T.thickening.ambient.object.scheme, ⊤)) ∧
    ∀ q : ℤ, q ≠ 0 → Limits.IsZero (relativeCohomology (identityProperFamily B Y hqc) T q) := by sorry
-- Test: TauCeti.LogCrystalline.gaussManin.torsion_warning
example (p : ℕ) [Fact p.Prime] :
    ¬ Module.Flat (PadicInt p) (logH (DerivedCategory.Q.obj (multiplicationPComplex p)) 1) := by sorry

-- linear isomorphism, is horizontal for the pulled back differential geometry.
def gaussManinPulledConnection {B : LogPDBase} (D : ProperSmoothFamily B)
    {T T' : LogCrysObject B D.base} (g : T' ⟶ T) (q : ℤ) (h : GaussManinInput D T q) :
    LogConnection (relativeCohomologyBaseChange D g q) (formModule (pdDifferentialGeometry T'.thickening) 1)
      (formDerivation (pdDifferentialGeometry T'.thickening)) := by sorry
def gaussManinCohomologyComparison {B : LogPDBase} (D : ProperSmoothFamily B)
    {T T' : LogCrysObject B D.base} (g : T' ⟶ T) (q : ℤ) (h : GaussManinInput D T q) :
    relativeCohomologyBaseChange D g q ≃ₗ[Γ(T'.thickening.ambient.object.scheme, ⊤)] relativeCohomology D T' q := by sorry
theorem gaussManin_baseChange_horizontal {B : LogPDBase} (D : ProperSmoothFamily B)
    {T T' : LogCrysObject B D.base} (g : T' ⟶ T) (q : ℤ)
    (h : GaussManinInput D T q) (h' : GaussManinInput D T' q)
    (x : relativeCohomologyBaseChange D g q) :
    (gaussManin D T' q h').nabla (gaussManinCohomologyComparison D g q h x) =
      TensorProduct.map (gaussManinCohomologyComparison D g q h).toLinearMap LinearMap.id
        ((gaussManinPulledConnection D g q h).nabla x) := by sorry

def pdEvaluationModule {B : LogPDBase} {Z : LogOverPDBase B}
    (F : FiniteProjectiveCrystal B Z) (T : LogCrysObject B Z) :
    ModuleCat.{0} Γ(T.thickening.ambient.object.scheme, ⊤) :=
  (ModuleCat.extendScalars (logCrystallineSite.structure_sections T).hom.hom).obj
    (F.crystal.modules.obj (Opposite.op T))
-- Transport the crystal evaluation along the canonical structure-sections isomorphism.
def pdEvaluationConnection {B : LogPDBase} {Z : LogOverPDBase B}
    (F : FiniteProjectiveCrystal B Z) (T : LogCrysObject B Z) (h : IsPDSmooth T.thickening) :
    PDConnectionSheaf T.thickening := by sorry
theorem pdEvaluationConnection_modules {B : LogPDBase} {Z : LogOverPDBase B}
    (F : FiniteProjectiveCrystal B Z) (T : LogCrysObject B Z) (h : IsPDSmooth T.thickening) :
    (pdEvaluationConnection F T h).modules = F.crystal.evaluation T := by sorry
def pdEvaluationStratification {B : LogPDBase} {Z : LogOverPDBase B}
    (F : FiniteProjectiveCrystal B Z) (T : LogCrysObject B Z) (h : IsPDSmooth T.thickening) :
    LogPDStratification T.thickening (F.crystal.evaluation T) := by sorry
theorem coefficient_PD_connection {B : LogPDBase} {Z : LogOverPDBase B}
    (F : FiniteProjectiveCrystal B Z) (T : LogCrysObject B Z) (h : IsPDSmooth T.thickening) :
    (pdEvaluationStratification F T h).first_order = pdEvaluationConnection F T h := by sorry
theorem coefficient_PD_map {B : LogPDBase} {Z Z' : LogOverPDBase B}
    {T : LogPDThickening B Z} {T' : LogPDThickening B Z'} (f : PDThickeningHom T' T)
    (n : ℕ) (x : Γ(T.ambient.object.scheme, ⊤)) (hx : x ∈ pdIdealGlobal T) :
    (logUnderlying f.ambient).appTop.hom ((pdGlobalPowers T).dpow n x) =
      (pdGlobalPowers T').dpow n ((logUnderlying f.ambient).appTop.hom x) := by sorry
theorem coefficient_PD_compatibility {B : LogPDBase} {Z : LogOverPDBase B}
    (T : LogPDThickening B Z) (n : ℕ) (x : Γ(T.ambient.object.scheme, ⊤))
    (hx : x ∈ pdIdealGlobal T) :
    (pdGlobalPowers T).dpow 1 x = x ∧
    formDerivation (pdDifferentialGeometry T) ((pdGlobalPowers T).dpow (n+1) x) =
      (pdGlobalPowers T).dpow n x • formDerivation (pdDifferentialGeometry T) x := by sorry

end TauCeti.LogCrystalline
