/-
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/HodgeStructuresPartII--H.3.md. These statements suggest
Lean forms so that contributors and reviewers converge on names and signatures.

Every proof below is a placeholder. The existing Hodge and period-point carriers
are imported. Generic manifold, variation and sheaf-cohomology interfaces are
supplier inputs, not new objects defined here. The omitted-signature ledger at
the end records precisely what cannot yet be typed against those interfaces.
-/
import TauCeti.Geometry.Hodge.PeriodDomain
import TauCeti.LinearAlgebra.BilinearForm.Isometry
import Mathlib.RingTheory.Grassmannian
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Analysis.Normed.Algebra.Exponential
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.GroupTheory.GroupAction.Defs

noncomputable section
open scoped BigOperators

namespace TauCeti.Hodge.PeriodGeometry

universe u v w
variable {W : Type u} [AddCommGroup W] [Module ℂ W]

/-- The rank of a filtration step, including negative indices. -/
def tailRank (h : HodgeType) (p : ℤ) : ℕ := ∑ᶠ r, if p ≤ r then h.h r else 0

/-- The first bilinear relation only; opposedness and positivity are not fields. -/
structure CompactDualFlag (h : HodgeType) (Q : LinearMap.BilinForm ℂ W) where
  finite_W : Module.Finite ℂ W
  F : ℤ → Submodule ℂ W
  antitone : Antitone F
  bounded_top : ∃ p, F p = ⊤
  bounded_bot : ∃ p, F p = ⊥
  rank_eq : ∀ p, Module.finrank ℂ (F p) = tailRank h p
  orthogonal : ∀ p, ∀ x ∈ F p, ∀ y ∈ F (h.weight + 1 - p), Q x y = 0

namespace CompactDualFlag
variable {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}

theorem ext {A B : CompactDualFlag h Q} (he : ∀ p, A.F p = B.F p) : A = B := by
  sorry

theorem rank (A : CompactDualFlag h Q) (p : ℤ) :
    Module.finrank ℂ (A.F p) = tailRank h p := by
  sorry

def transport (e : W ≃ₗ[ℂ] W) (he : ∀ x y, Q (e x) (e y) = Q x y)
    (A : CompactDualFlag h Q) : CompactDualFlag h Q := by
  sorry

theorem transport_F (e : W ≃ₗ[ℂ] W) (he : ∀ x y, Q (e x) (e y) = Q x y)
    (A : CompactDualFlag h Q) (p : ℤ) :
    (transport e he A).F p = (A.F p).map e.toLinearMap := by
  sorry

theorem transport_one (A : CompactDualFlag h Q) :
    transport (LinearEquiv.refl ℂ W) (by intros; rfl) A = A := by
  sorry

theorem transport_comp (e f : W ≃ₗ[ℂ] W)
    (he : ∀ x y, Q (e x) (e y) = Q x y) (hf : ∀ x y, Q (f x) (f y) = Q x y)
    (hef : ∀ x y, Q ((f.trans e) x) ((f.trans e) y) = Q x y)
    (A : CompactDualFlag h Q) :
    transport (f.trans e) hef A = transport e he (transport f hf A) := by
  sorry

def grassmannian [FiniteDimensional ℂ W] (A : CompactDualFlag h Q) (p : ℤ) :
    Module.Grassmannian ℂ W (Module.finrank ℂ W - tailRank h p) := by
  sorry

theorem grassmannian_submodule [FiniteDimensional ℂ W] (A : CompactDualFlag h Q) (p : ℤ) :
    (A.grassmannian p).toSubmodule = A.F p := by
  sorry
end CompactDualFlag

/- Concrete test fixtures. These specify actual filtrations and forms. -/
def zeroType : HodgeType where
  weight := 0
  h := fun _ => 0
  finite_support := by sorry
  symm := by sorry
def zeroFlag : CompactDualFlag zeroType (0 : LinearMap.BilinForm ℂ (Fin 0 → ℂ)) := by
  sorry
def tateFlag (m : ℤ) : CompactDualFlag (tateHodgeType m) (LinearMap.mul ℂ ℂ) := by
  sorry
def weightOneType : HodgeType where
  weight := 1
  h := fun p => if p = 0 ∨ p = 1 then 1 else 0
  finite_support := by sorry
  symm := by sorry
abbrev Plane := Fin 2 → ℂ
def e1 : Plane := ![1, 0]
def e2 : Plane := ![0, 1]
def alternatingForm : LinearMap.BilinForm ℂ Plane := by
  sorry
def realLineFlag : CompactDualFlag weightOneType alternatingForm := by
  sorry
theorem realLineFlag_F (p : ℤ) : realLineFlag.F p =
    if p ≤ 0 then ⊤ else if p = 1 then Submodule.span ℂ {e1} else ⊥ := by
  sorry
theorem alternatingForm_apply (x y : Plane) :
    alternatingForm x y = x 0 * y 1 - x 1 * y 0 := by
  sorry
theorem weightOneType_h (p : ℤ) : weightOneType.h p = if p = 0 ∨ p = 1 then 1 else 0 := by
  sorry
theorem weightOneType_weight : weightOneType.weight = 1 := by sorry
theorem zeroType_h (p : ℤ) : zeroType.h p = 0 := by sorry

-- compactDual_tate
example (m p : ℤ) : (tateFlag m).F p = if p ≤ -m then ⊤ else ⊥ := by sorry
-- compactDual_zero: no positivity or nonzero-dimension condition is imposed.
example (A : CompactDualFlag zeroType (0 : LinearMap.BilinForm ℂ (Fin 0 → ℂ))) :
    A = zeroFlag := by sorry
-- compactDual_realLine: the compact dual includes a non-opposed real line.
example : realLineFlag.F 1 = Submodule.span ℂ {e1} ∧
    ¬ IsCompl (realLineFlag.F 1)
      ((realLineFlag.F 1).map (by
        exact { toFun := fun x i => star (x i)
                map_add' := by intros; ext; simp
                map_smul' := by intros; ext; simp } : Plane →ₗ[starRingEnd ℂ] Plane)) := by
  sorry

section NativePoints
variable {V : Type v} [AddCommGroup V] [Module.Free ℤ V] [Module.Finite ℤ V]
variable {ι : V →ₗ[ℤ] W} (hC : IsBaseChange ℂ ι)
variable (n : ℤ) (Qint : LinearMap.BilinForm ℤ V) (h : HodgeType)

def toCompactDual (D : PeriodDomain.Point hC n Qint h) :
    CompactDualFlag h (integralFormBaseChange hC Qint) := by
  sorry

theorem toCompactDual_F (D : PeriodDomain.Point hC n Qint h) (p : ℤ) :
    (toCompactDual hC n Qint h D).F p = D.hs.F p := by sorry

theorem toCompactDual_injective : Function.Injective (toCompactDual hC n Qint h) := by
  sorry

def transportPoint (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) =
      integralFormBaseChange hC Qint x y)
    (D : PeriodDomain.Point hC n Qint h) : PeriodDomain.Point hC n Qint h := by
  sorry

theorem transportPoint_F (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) =
      integralFormBaseChange hC Qint x y)
    (D : PeriodDomain.Point hC n Qint h) (p : ℤ) :
    (transportPoint hC n Qint h e hc hq D).hs.F p = (D.hs.F p).map e.toLinearMap := by
  sorry

theorem transportPoint_one_comp
    (e f : W ≃ₗ[ℂ] W)
    (hc_e : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hc_f : ∀ x, f (latticeConj hC x) = latticeConj hC (f x))
    (hc_ef : ∀ x, (f.trans e) (latticeConj hC x) = latticeConj hC ((f.trans e) x))
    (hq_e : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) = integralFormBaseChange hC Qint x y)
    (hq_f : ∀ x y, integralFormBaseChange hC Qint (f x) (f y) = integralFormBaseChange hC Qint x y)
    (hq_ef : ∀ x y, integralFormBaseChange hC Qint ((f.trans e) x) ((f.trans e) y) =
      integralFormBaseChange hC Qint x y) (D : PeriodDomain.Point hC n Qint h) :
    transportPoint hC n Qint h (LinearEquiv.refl ℂ W) (by intros; rfl) (by intros; rfl) D = D ∧
    transportPoint hC n Qint h (f.trans e) hc_ef hq_ef D =
      transportPoint hC n Qint h e hc_e hq_e (transportPoint hC n Qint h f hc_f hq_f D) := by
  sorry

theorem transportPoint_compactDual (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) = integralFormBaseChange hC Qint x y)
    (D : PeriodDomain.Point hC n Qint h) :
    toCompactDual hC n Qint h (transportPoint hC n Qint h e hc hq D) =
      CompactDualFlag.transport e hq (toCompactDual hC n Qint h D) := by sorry

-- toCompactDual_fixedForm
example (D : PeriodDomain.Point hC n Qint h) (p : ℤ)
    (x y : W) (hx : x ∈ (toCompactDual hC n Qint h D).F p)
    (hy : y ∈ (toCompactDual hC n Qint h D).F (h.weight + 1 - p)) :
    integralFormBaseChange hC Qint x y = 0 := by sorry
-- toCompactDual_separates
example (A B : PeriodDomain.Point hC n Qint h) (p : ℤ) (hne : A.hs.F p ≠ B.hs.F p) :
    toCompactDual hC n Qint h A ≠ toCompactDual hC n Qint h B := by sorry
-- transportPoint_one
example (D : PeriodDomain.Point hC n Qint h) :
    transportPoint hC n Qint h (LinearEquiv.refl ℂ W) (by intros; rfl) (by intros; rfl) D = D := by
  sorry
-- transportPoint_inverse: inverse witnesses are supplied explicitly.
example (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hci : ∀ x, e.symm (latticeConj hC x) = latticeConj hC (e.symm x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) = integralFormBaseChange hC Qint x y)
    (hqi : ∀ x y, integralFormBaseChange hC Qint (e.symm x) (e.symm y) = integralFormBaseChange hC Qint x y)
    (D : PeriodDomain.Point hC n Qint h) :
    transportPoint hC n Qint h e.symm hci hqi (transportPoint hC n Qint h e hc hq D) = D := by
  sorry

/-- Point assembly after an imported flat marking; no variation carrier is defined. -/
def markedPeriodMap {B : Type w} (hs : B → HodgeStructure hC n)
    (hw : h.weight = n) (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p) : B → PeriodDomain.Point hC n Qint h := by
  sorry

theorem markedPeriodMap_F {B : Type w} (hs : B → HodgeStructure hC n)
    (hw : h.weight = n) (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p) (b : B) (p : ℤ) :
    (markedPeriodMap hC n Qint h hs hw pol hn b).hs.F p = (hs b).F p := by sorry

theorem markedPeriodMap_compactDual {B : Type w} (hs : B → HodgeStructure hC n)
    (hw : h.weight = n) (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p) (b : B) :
    (toCompactDual hC n Qint h (markedPeriodMap hC n Qint h hs hw pol hn b)).F = (hs b).F := by
  sorry
theorem markedPeriodMap_changeMarking {B : Type w}
    (hs hs' : B → HodgeStructure hC n) (hw : h.weight = n)
    (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (pol' : ∀ b, IsPolarization hC (hs' b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p)
    (hn' : ∀ b p, (hs' b).hodgeNumber p = h.h p)
    (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) = integralFormBaseChange hC Qint x y)
    (hF : ∀ b p, (hs' b).F p = ((hs b).F p).map e.toLinearMap) (b : B) :
    markedPeriodMap hC n Qint h hs' hw pol' hn' b =
      transportPoint hC n Qint h e hc hq (markedPeriodMap hC n Qint h hs hw pol hn b) := by
  sorry

-- markedPeriod_constant
example {B : Type w} (D : PeriodDomain.Point hC n Qint h) (b : B) :
    markedPeriodMap hC n Qint h (fun _ : B => D.hs) D.htype_weight
      (fun _ => D.pol) (fun _ => D.hodge_numbers) b = D := by sorry
-- markedPeriod_steps
example {B : Type w} (hs : B → HodgeStructure hC n)
    (hw : h.weight = n) (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p) (b : B) (p : ℤ) :
    (markedPeriodMap hC n Qint h hs hw pol hn b).hs.F p = (hs b).F p := by sorry
end NativePoints

def minusIdentity : ℂ ≃ₗ[ℂ] ℂ := by sorry
theorem minusIdentity_apply (x : ℂ) : minusIdentity x = -x := by sorry
-- transportPoint_tateMinus
example (m : ℤ)
    (hc : ∀ x, minusIdentity (latticeConj isBaseChange_tateLatticeMap x) =
      latticeConj isBaseChange_tateLatticeMap (minusIdentity x))
    (hq : ∀ x y, integralFormBaseChange isBaseChange_tateLatticeMap (LinearMap.mul ℤ ℤ)
      (minusIdentity x) (minusIdentity y) =
      integralFormBaseChange isBaseChange_tateLatticeMap (LinearMap.mul ℤ ℤ) x y) :
    transportPoint isBaseChange_tateLatticeMap (-2*m) (LinearMap.mul ℤ ℤ) (tateHodgeType m)
      minusIdentity hc hq (tatePoint m) = tatePoint m := by sorry

-- toCompactDual_tate
example (m p : ℤ) :
    (toCompactDual isBaseChange_tateLatticeMap (-2*m) (LinearMap.mul ℤ ℤ)
      (tateHodgeType m) (tatePoint m)).F p = if p ≤ -m then ⊤ else ⊥ := by sorry
-- markedPeriod_tate
example (m : ℤ) (b : Unit) :
    markedPeriodMap isBaseChange_tateLatticeMap (-2*m) (LinearMap.mul ℤ ℤ) (tateHodgeType m)
      (fun _ : Unit => tate m) (tateHodgeType_weight m) (fun _ => isPolarization_tate m)
      (by intros; sorry) b = tatePoint m := by sorry

/- Orbit carriers use supplied represented actions. The real carrier is on native
points; the complex carrier is on compact-dual flags. Algebraic groups, their
representations, normalization and connected components are not redefined here.
-/
section Orbits
variable {G : Type v} [Group G]

abbrev RealPeriodOrbit {V : Type u} {W : Type w} [AddCommGroup V]
    [Module.Free ℤ V] [Module.Finite ℤ V] [AddCommGroup W] [Module ℂ W]
    {ι : V →ₗ[ℤ] W} {hC : IsBaseChange ℂ ι} {n : ℤ}
    {Qint : LinearMap.BilinForm ℤ V} {h : HodgeType}
    [MulAction G (PeriodDomain.Point hC n Qint h)]
    (a : PeriodDomain.Point hC n Qint h) := ↥(MulAction.orbit G a)

abbrev ComplexPeriodOrbit {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    [MulAction G (CompactDualFlag h Q)] (a : CompactDualFlag h Q) := ↥(MulAction.orbit G a)

namespace RealPeriodOrbit
variable {V : Type u} {W : Type w} [AddCommGroup V]
    [Module.Free ℤ V] [Module.Finite ℤ V] [AddCommGroup W] [Module ℂ W]
    {ι : V →ₗ[ℤ] W} {hC : IsBaseChange ℂ ι} {n : ℤ}
    {Qint : LinearMap.BilinForm ℤ V} {h : HodgeType}
    [MulAction G (PeriodDomain.Point hC n Qint h)]
theorem mem_iff (a x : PeriodDomain.Point hC n Qint h) :
    x ∈ MulAction.orbit G a ↔ ∃ g : G, g • a = x := by sorry
def base (a : PeriodDomain.Point hC n Qint h) : RealPeriodOrbit (G := G) a := by sorry
def rebase (a : PeriodDomain.Point hC n Qint h) (g : G) :
    RealPeriodOrbit (G := G) (g • a) ≃ RealPeriodOrbit (G := G) a := by sorry
theorem rebase_val (a : PeriodDomain.Point hC n Qint h) (g : G)
    (x : RealPeriodOrbit (G := G) (g • a)) : (rebase a g x).val = x.val := by sorry
def inclusion (a : PeriodDomain.Point hC n Qint h) :
    RealPeriodOrbit (G := G) a ↪ PeriodDomain.Point hC n Qint h := by sorry
-- realOrbit_trivial
example [Subsingleton G] (a x : PeriodDomain.Point hC n Qint h) :
    x ∈ MulAction.orbit G a ↔ x = a := by sorry
-- realOrbit_baseChange
example (a : PeriodDomain.Point hC n Qint h) (g : G) :
    MulAction.orbit G (g • a) = MulAction.orbit G a := by sorry
end RealPeriodOrbit

namespace ComplexPeriodOrbit
variable {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    [MulAction G (CompactDualFlag h Q)]
theorem mem_iff (a x : CompactDualFlag h Q) :
    x ∈ MulAction.orbit G a ↔ ∃ g : G, g • a = x := by sorry
def rebase (a : CompactDualFlag h Q) (g : G) :
    ComplexPeriodOrbit (G := G) (g • a) ≃ ComplexPeriodOrbit (G := G) a := by sorry
theorem rebase_val (a : CompactDualFlag h Q) (g : G)
    (x : ComplexPeriodOrbit (G := G) (g • a)) : (rebase a g x).val = x.val := by sorry
def inclusion (a : CompactDualFlag h Q) : ComplexPeriodOrbit (G := G) a ↪ CompactDualFlag h Q := by
  sorry
-- complexOrbit_trivial
example [Subsingleton G] (a x : CompactDualFlag h Q) : x ∈ MulAction.orbit G a ↔ x = a := by sorry
-- complexOrbit_transitive
example (a : CompactDualFlag h Q) (ht : ∀ x : CompactDualFlag h Q, ∃ g : G, g • a = x) :
    Function.Surjective (inclusion (G := G) a) := by sorry
end ComplexPeriodOrbit
end Orbits

section ExponentialCoordinates
variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
variable {G : Type v} [Group G] {h : HodgeType} {Q : LinearMap.BilinForm ℂ E}
    [MulAction G (CompactDualFlag h Q)]
/-- Supplied represented exponential, not an assumed local inverse. The complex
Lie supplier identifies expG with the matrix exponential in the representation;
the displayed equation is genuine matrix-exponential compatibility. -/
def negativeOrbitMap (q : Submodule ℂ (E →L[ℂ] E)) (expG : q → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (_hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (F0 : CompactDualFlag h Q) : q → ComplexPeriodOrbit (G := G) F0 := by sorry

theorem negativeOrbitMap_zero (q : Submodule ℂ (E →L[ℂ] E)) (expG : q → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (he0 : expG 0 = 1) (F0 : CompactDualFlag h Q) :
    (negativeOrbitMap q expG rho hexp F0 0).val = F0 := by sorry

theorem negativeOrbitMap_F (q : Submodule ℂ (E →L[ℂ] E)) (expG : q → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (ha : ∀ g (F : CompactDualFlag h Q) p, (g • F).F p = (F.F p).map (rho g).toLinearMap)
    (F0 : CompactDualFlag h Q) (X : q) (p : ℤ) :
    (negativeOrbitMap q expG rho hexp F0 X).val.F p = (F0.F p).map (rho (expG X)).toLinearMap := by
  sorry
theorem negativeOrbitMap_rebase
    (q q' : Submodule ℂ (E →L[ℂ] E)) (A : q ≃ₗ[ℂ] q')
    (expG : q → G) (expG' : q' → G) (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (hexp' : ∀ X : q', ∀ w, rho (expG' X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (g : G) (hAd : ∀ X, expG' (A X) = g * expG X * g⁻¹)
    (F0 : CompactDualFlag h Q) (X : q) :
    g • (negativeOrbitMap q expG rho hexp F0 X).val =
      (negativeOrbitMap q' expG' rho hexp' (g • F0) (A X)).val := by sorry

-- negativeOrbit_zero
example (q : Submodule ℂ (E →L[ℂ] E)) (expG : q → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (he0 : expG 0 = 1) (F0 : CompactDualFlag h Q) :
    (negativeOrbitMap q expG rho hexp F0 0).val = F0 := by sorry
-- negativeOrbit_scalar: the negative complement of a Tate structure is zero.
example (expG : (⊥ : Submodule ℂ (E →L[ℂ] E)) → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : (⊥ : Submodule ℂ (E →L[ℂ] E)), ∀ w,
      rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (he0 : expG 0 = 1) (F0 : CompactDualFlag h Q)
    (X : (⊥ : Submodule ℂ (E →L[ℂ] E))) :
    (negativeOrbitMap ⊥ expG rho hexp F0 X).val = F0 := by sorry
end ExponentialCoordinates

/-- Filtration on the represented Lie subalgebra, with all integer indices. -/
def lieFiltration {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) (a : ℤ) : Submodule ℂ g := by
  sorry

theorem mem_lieFiltration {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) (a : ℤ) (X : g) :
    X ∈ lieFiltration F g a ↔ ∀ p, ∀ x ∈ F.F p, (X : Module.End ℂ W) x ∈ F.F (p+a) := by
  sorry

theorem lieFiltration_antitone {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) :
    Antitone (lieFiltration F g) := by sorry

theorem lieFiltration_bracket {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) (a b : ℤ)
    (X Y : g) (hx : X ∈ lieFiltration F g a) (hy : Y ∈ lieFiltration F g b) :
    ⁅X,Y⁆ ∈ lieFiltration F g (a+b) := by sorry

def lower : Module.End ℂ Plane := by sorry
theorem lower_apply (x : Plane) : lower x = ![0, x 0] := by sorry
-- lieFiltration_lower
example : (⟨lower, by simp⟩ : (⊤ : LieSubalgebra ℂ (Module.End ℂ Plane))) ∈
    lieFiltration realLineFlag ⊤ (-1) ∧
    (⟨lower, by simp⟩ : (⊤ : LieSubalgebra ℂ (Module.End ℂ Plane))) ∉
    lieFiltration realLineFlag ⊤ 0 := by sorry
-- lieFiltration_zero
example {h : HodgeType} {Q : LinearMap.BilinForm ℂ W} (F : CompactDualFlag h Q) (a : ℤ) :
    lieFiltration F (⊥ : LieSubalgebra ℂ (Module.End ℂ W)) a = ⊥ := by sorry
-- lieFiltration_one
example (m : ℤ) :
    (⟨LinearMap.id, by simp⟩ : (⊤ : LieSubalgebra ℂ (Module.End ℂ ℂ))) ∈
      lieFiltration (tateFlag m) ⊤ 0 ∧
    (⟨LinearMap.id, by simp⟩ : (⊤ : LieSubalgebra ℂ (Module.End ℂ ℂ))) ∉
      lieFiltration (tateFlag m) ⊤ 1 := by sorry

/-- Fibre of the horizontal tangent distribution. -/
def horizontalSubspace {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) :
    Submodule ℂ (g ⧸ lieFiltration F g 0) :=
  (lieFiltration F g (-1)).map (lieFiltration F g 0).mkQ

theorem horizontalSubspace_mem {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W))
    (x : g ⧸ lieFiltration F g 0) : x ∈ horizontalSubspace F g ↔
    ∃ X : g, (∀ p, ∀ v ∈ F.F p, (X : Module.End ℂ W) v ∈ F.F (p-1)) ∧
      (lieFiltration F g 0).mkQ X = x := by sorry

def horizontalSubspace_quotient {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) :
    ((lieFiltration F g (-1)) ⧸
      (lieFiltration F g 0).comap (lieFiltration F g (-1)).subtype) ≃ₗ[ℂ]
        horizontalSubspace F g := by sorry

theorem horizontalSubspace_quotient_apply {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W))
    (X : lieFiltration F g (-1)) :
    (horizontalSubspace_quotient F g
      (((lieFiltration F g 0).comap (lieFiltration F g (-1)).subtype).mkQ X)).val =
      (lieFiltration F g 0).mkQ X.val := by sorry

theorem horizontalSubspace_transport {h h' : HodgeType}
    {Q Q' : LinearMap.BilinForm ℂ W} (F : CompactDualFlag h Q) (F' : CompactDualFlag h' Q')
    (g g' : LieSubalgebra ℂ (Module.End ℂ W)) (A : g ≃ₗ[ℂ] g')
    (h0 : (lieFiltration F g 0).map A.toLinearMap = lieFiltration F' g' 0)
    (hm : (lieFiltration F g (-1)).map A.toLinearMap = lieFiltration F' g' (-1)) :
    (horizontalSubspace F g).map
      (Submodule.Quotient.equiv (lieFiltration F g 0) (lieFiltration F' g' 0) A h0).toLinearMap =
      horizontalSubspace F' g' := by sorry

-- horizontal_tate
example (m : ℤ) : horizontalSubspace (tateFlag m) ⊤ = ⊥ := by sorry
-- horizontal_weightOne
example : horizontalSubspace realLineFlag ⊤ = ⊤ ∧
    Module.finrank ℂ ((⊤ : LieSubalgebra ℂ (Module.End ℂ Plane)) ⧸
      lieFiltration realLineFlag ⊤ 0) = 1 := by sorry

/-- Quotient of a supplied lift jet. Geometry identifies this with dP. -/
def periodSymbol {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W)) : T →ₗ[ℂ] (S →ₗ[ℂ] W ⧸ S) := by
  sorry
theorem periodSymbol_apply {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W)) (v : T) (s : S) :
    periodSymbol S J v s = S.mkQ (J v s) := by sorry
theorem periodSymbol_liftCorrection {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J K : T →ₗ[ℂ] (S →ₗ[ℂ] W))
    (hk : ∀ v s, K v s ∈ S) : periodSymbol S (J+K) = periodSymbol S J := by sorry

theorem periodSymbol_frame {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (e : W ≃ₗ[ℂ] W)
    (J : T →ₗ[ℂ] (S →ₗ[ℂ] W))
    (J' : T →ₗ[ℂ] ((S.map e.toLinearMap) →ₗ[ℂ] W))
    (hJ : ∀ v s, J' v (e.submoduleMap S s) = e (J v s)) (v : T) (x : S) :
    Submodule.Quotient.equiv S (S.map e.toLinearMap) e rfl (periodSymbol S J v x) =
      periodSymbol (S.map e.toLinearMap) J' v (e.submoduleMap S x) := by sorry

theorem periodSymbol_kernel {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W)) (v : T) :
    periodSymbol S J v = 0 ↔ ∀ s : S, J v s ∈ S := by sorry
-- periodSymbol_preserving
example {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W))
    (hp : ∀ v s, J v s ∈ S) : periodSymbol S J = 0 := by sorry
-- periodSymbol_zeroStep
example {T : Type v} [AddCommGroup T] [Module ℂ T]
    (J : T →ₗ[ℂ] ((⊥ : Submodule ℂ W) →ₗ[ℂ] W)) : periodSymbol ⊥ J = 0 := by sorry
-- periodSymbol_zeroStep (the full-step case)
example {T : Type v} [AddCommGroup T] [Module ℂ T]
    (J : T →ₗ[ℂ] ((⊤ : Submodule ℂ W) →ₗ[ℂ] W)) : periodSymbol ⊤ J = 0 := by sorry
def shearJet : ℂ →ₗ[ℂ] ((Submodule.span ℂ {e1}) →ₗ[ℂ] Plane) := by sorry
theorem shearJet_apply (t : ℂ) (s : Submodule.span ℂ {e1}) :
    shearJet t s = t • lower s.val := by sorry
-- periodSymbol_shear
example (he : e1 ∈ Submodule.span ℂ {e1}) :
    periodSymbol (Submodule.span ℂ {e1}) shearJet 1 ⟨e1, he⟩ =
      (Submodule.span ℂ {e1}).mkQ e2 ∧ (Submodule.span ℂ {e1}).mkQ e2 ≠ 0 := by sorry

namespace AbelianPeriod
variable {g : ℕ}
def normalize (A B : Matrix (Fin g) (Fin g) ℂ) (_hA : IsUnit A.det) :
    Matrix (Fin g) (Fin g) ℂ := A⁻¹ * B
theorem normalize_one (B : Matrix (Fin g) (Fin g) ℂ) (hI : IsUnit (1 : Matrix (Fin g) (Fin g) ℂ).det) :
    normalize 1 B hI = B := by sorry
theorem frame (A B C : Matrix (Fin g) (Fin g) ℂ) (hA : IsUnit A.det) (hC : IsUnit C.det)
    (hCA : IsUnit (C*A).det) : normalize (C*A) (C*B) hCA = normalize A B hA := by sorry
private def rowPlane (A B : Matrix (Fin g) (Fin g) ℂ) :
    Submodule ℂ ((Fin g → ℂ) × (Fin g → ℂ)) :=
  Submodule.span ℂ (Set.range fun i => (A i, B i))
theorem graph (A B : Matrix (Fin g) (Fin g) ℂ) (hA : IsUnit A.det) :
    rowPlane A B = rowPlane 1 (normalize A B hA) ∧
    Module.finrank ℂ (rowPlane A B) = g ∧
    Module.finrank ℂ (((Fin g → ℂ) × (Fin g → ℂ)) ⧸ rowPlane A B) = g := by sorry
end AbelianPeriod
-- abelianPeriod_rankOne
example (hA : IsUnit (!![1] : Matrix (Fin 1) (Fin 1) ℂ).det) :
    AbelianPeriod.normalize !![1] !![Complex.I] hA = !![Complex.I] := by sorry
-- abelianPeriod_scaled
example (hA : IsUnit (!![2] : Matrix (Fin 1) (Fin 1) ℂ).det) :
    AbelianPeriod.normalize !![2] !![2*Complex.I] hA = !![Complex.I] := by sorry
-- abelianPeriod_zeroRank
example (A B : Matrix (Fin 0) (Fin 0) ℂ) (hA : IsUnit A.det) :
    AbelianPeriod.normalize A B hA = 0 := by sorry

end TauCeti.Hodge.PeriodGeometry

/-
Omitted-signature ledger (Protocol §13).

These entries are mathematical plans, not Lean declarations/examples. The
packet and definitive reader retain their exact hypotheses, source passages,
supplier prerequisites and proof routes. The unavailable types are represented
MT groups/components, analytic flag manifolds/universal subbundles, common
holomorphic variations, coherent C-linear logarithmic cohomology, holomorphic
global sections and trace-compatible Serre duality. No arbitrary Prop field or
local scalar product substitutes for those objects. Supplied native actions,
filtrations and matrix-exponential compatibility have their literal typed
meanings above; their global geometric provenance is conditional on suppliers.

test signature omitted: TauCeti.Hodge.PeriodGeometry.realOrbit_CM
  For a marked CM elliptic H¹ whose represented MT group centralizes its Hodge decomposition, the connected real period orbit is a singleton; the weight-one ambient component has all upper-half-plane period lines.

test signature omitted: TauCeti.Hodge.PeriodGeometry.complexOrbit_CM
  The complexified CM elliptic torus fixes the reference Hodge line; its orbit is a point inside the ambient P¹ compact dual.

test signature omitted: TauCeti.Hodge.PeriodGeometry.negativeOrbit_shear
  For F¹=C e1 and N(e1)=e2,N(e2)=0, exp(tN) sends F¹ to C(e1+t e2); this is not the line C(e1) for t≠0.

construction signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS
  For a smooth proper connected complex curve family π:Cbar→B over a smooth analytic base, with disjoint marked sections D and b∈B, define logCurveKS_b:T_bB→H¹(C_b,T_Cb(−D_b)) as the connecting homomorphism of 0→T_Cb(−D_b)→T_Cbar(−log D)|Cb→O_Cb⊗T_bB→0 after the canonical H⁰ identification. Smoothness, connected proper fibres and disjoint sections are retained. It is the curve-family adapter of the supplied coherent connecting map, not a second general deformation theory.

API signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_boundary
  Its value is the connecting class of the constant tangent section.

API signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_lift
  A smooth tangent-to-D lift v gives logCurveKS(u)=[barpartial v].

API signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_baseChange
  Pullback of a smooth pointed family gives κ_new=κ_old∘d(base map), under the fibre cohomology identification.

test signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_split
  For a product pointed family the logarithmic tangent sequence splits and κ=0.

test signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_identityBase
  Pullback along the identity base map preserves κ and the marked divisor.

test signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_verticalLift
  If a base vector has a holomorphic tangent-to-D lift, its connecting class is zero; changing any smooth lift by a vertical field changes barpartial v by an exact class.

construction signature omitted: TauCeti.Hodge.PeriodGeometry.PeriodTrace.multiply
  For any holomorphic finite-rank vector bundle E on a smooth proper connected complex curve C and reduced divisor D, define B_E:(E⊗ω_C(D))×(E∨⊗ω_C)→ω_C²(D) by evaluation E⊗E∨→O_C, with the two line factors multiplied. Its induced global-section map μ_E:H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D)) is trace after tensor product of sections. The sheaf pairing is perfect between these two mutually twisted dual bundles; neither nondegeneracy nor surjectivity of μ_E on global sections is asserted.

API signature omitted: TauCeti.Hodge.PeriodGeometry.PeriodTrace.eval
  In dual frames μ_E(s,t)=Σ_i s_i t_i, as a section of ω²(D).

API signature omitted: TauCeti.Hodge.PeriodGeometry.PeriodTrace.frame
  Under E-frame change A and inverse-dual frame change, trace multiplication is invariant; identity and compositions agree.

API signature omitted: TauCeti.Hodge.PeriodGeometry.PeriodTrace.rankOne
  For E=O_C the map is ordinary multiplication H⁰(ω(D))⊗H⁰(ω)→H⁰(ω²(D)).

test signature omitted: TauCeti.Hodge.PeriodGeometry.periodTrace_rankTwo
  In a rank-two frame s=(1,2),t=(3,4) with unit line factors, B_E(s,t)=11.

test signature omitted: TauCeti.Hodge.PeriodGeometry.periodTrace_zero
  For the rank-zero bundle μ_E is zero even when H⁰(ω²(D)) is nonzero.

test signature omitted: TauCeti.Hodge.PeriodGeometry.periodTrace_divisor
  With local coordinate z at a reduced marked point, s=e⊗dz/z and t=e∨⊗dz evaluate to dz²/z, not dz²/z².

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.ambientDomain_open
  For a nonempty native period carrier with fixed (V,Qint,h), its toCompactDual image is exactly the set of compact-dual flags that are n-opposed to lattice conjugation and satisfy the pinned strict Hodge–Riemann inequalities i^(2p−n)Q_C(x,conj x)>0 on each nonzero Hodge piece. This subset is open in the complex analytic topology and gives the entire native carrier a complex manifold structure, with possibly several connected components. The compact-dual carrier is smooth projective, and the full real Q-isometry group acts transitively on the full native domain; its identity component acts transitively on each chosen connected component. Stabilizers are compact; they need not be maximal compact.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.mtOrbit_open
  For the represented polarizable pure datum, RealPeriodOrbit is a connected complex manifold open in its own represented ComplexPeriodOrbit, and its inclusion into the full ambient domain is a holomorphic immersion and locally closed embedding. Its real homogeneous description is G(R)^+/Z_{G(R)^+}(h), with scalar centre acting trivially. This isotropy is compact only after quotienting the positive scalar centre, or on the normalized real isometry image. The full centralizer in MT(R) need not be compact. The complex-orbit tangent is g_C/F⁰g_C. These assertions are independent, by canonical isomorphism, of the faithful representation used to realize the same Hodge datum.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.orbit_hodgeTensors
  Import the Hodge tensor operations and a represented rational group G acting on them. If a rational tensor t in a finite tensor construction from V,V∨ and explicit Tate twists is fixed by G and is of type (0,0) at F0, then it is of type (0,0) at every flag in the chosen real G-orbit. Its period-symbol evaluation vanishes in normal directions that would violate t. Conversely a tensor-defined locus is identified with the orbit only after supplying its group-stabilizer theorem and selecting the required homogeneous component; no equality with the entire ambient domain is claimed. An untwisted type (p,p) tensor for p≠0 is not a type-(0,0) Hodge tensor.

comparison signature omitted: TauCeti.Hodge.PeriodGeometry.fullIsometry_specialization
  When the represented normalized acting group is the full identity component of the real Q-isometry group and its complex group is the corresponding full isometry group with the components needed for the selected flag orbit, RealPeriodOrbit(F0) identifies with the ambient connected component through F0. The full ambient carrier is the union of these orbits over representatives of its connected components. For a general MT subgroup only the orbit inclusion is supplied; it is not asserted surjective or open in the full ambient domain.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.tangent_horizontal
  At F in a represented pure compact-dual orbit, T_F Dcheck≅g_C/F⁰g_C≅⊕_{r<0}g^{r,−r}. The horizontal holomorphic subbundle is F^(−1)g_C/F⁰g_C≅g^(−1,1); at every point it consists of the tangent classes represented by X with X(F^p)⊆F^{p−1} for all p. Under the full flag inclusion its derivative is the collection s↦X(s) mod F^p. Brackets have grade sum: [g^(−1,1),g^(−1,1)]⊆g^(−2,2), so horizontal integrability is not asserted in general.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.negativeChart_local
  For a specified complex linear complement q to F⁰g_C, negativeOrbitMap has derivative at zero the isomorphism q→g_C/F⁰g_C. There are open neighborhoods of zero and F0 on which it is a biholomorphism. Negative grading provides a canonical such complement at a pure reference point. Chart transitions between translates and complements are holomorphic; these charts are only local. No boundedness or global injectivity is asserted.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.tautological_transversality
  On a represented pure period orbit with constant underlying local system and its universal holomorphic filtration, Griffiths transversality holds in all tangent directions iff the adjoint Hodge grading has no grades r<−1, equivalently by reality no grades r>1. Thus the allowed adjoint types are {(-1,1),(0,0),(1,-1)}. In the general case the universal filtered bundle is not a VHS on the full domain; a map from a base is a VHS only when its derivative lies in the horizontal subbundle.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.periodMap_holomorphic
  For the imported polarized integral variation and a flat marking on a simply connected patch, markedPeriodMap is holomorphic into the full ambient period manifold and its derivative takes values in the horizontal subbundle. For an imported rational variation and a represented MT orbit, factorization into that orbit requires supplied flat Hodge tensors, constant generic datum and a chosen component; with this supplied factorization the induced orbit-valued map is holomorphic and horizontal. Local holomorphicity alone does not add an integral lattice.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.monodromy_descent
  For a connected base with universal cover and the imported polarized integral variation, the marked lift P satisfies P(γb)=ρ(γ)·P(b), with ρ valued in the existing integral Q-isometry group. It descends to B→Γ\D for any discrete subgroup Γ containing the monodromy image and preserving the chosen domain/component. With compact isotropy in the effective real isometry group, discrete Γ acts properly discontinuously. If its action is free (for instance effective torsion-free Γ), the quotient is a complex manifold and the descended map is holomorphic with horizontal local lifts. Without freeness retain an analytic orbifold/quotient space, not a manifold. The monodromy subgroup need not itself be a finite-index arithmetic lattice.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.derivative_connection
  For an imported variation and p∈Z, under the universal Grassmannian tangent identification, dP_b^p(v)(s)=∇_v(tilde s) mod F_b^p for any local holomorphic F^p-lift of s. The quotient of ∇ on F^p is O_B-linear because the Leibniz term s⊗df lies in F^p⊗Ω¹. For a Griffiths-transverse variation the value lies in F^{p−1}/F^p and depends only on s modulo F^{p+1}; this is precisely the existing H.0 graded-Higgs operator. The curried and uncurried derivative and its cotangent dual agree under the canonical Hom/tensor/dual identifications.

comparison signature omitted: TauCeti.Hodge.PeriodGeometry.curve_hodgeFiltration
  For π:Cbar→B smooth proper connected curves over a smooth contractible complex analytic base, disjoint marked sections D, and a finite-rank unitary complex local system V on C°=Cbar−D, import its Deligne canonical extension (E,∇), relative logarithmic de Rham comparison and unitary Hodge-to-de Rham degeneration. Then H=(R¹π°_*V)⊗O_B, F¹H=π_*(E⊗ω_Cbar/B(D)), and H/F¹H=R¹π_*E are the imported locally free two-step data. A flat marking defines a holomorphic Grassmannian period map of subspace rank s=rank F¹ and total rank r, which uses the pinned Module.Grassmannian with quotient rank r−s. This complex two-step period map is not assumed to be a pure integral polarized-domain map.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.gaussManin_contraction
  Under the curve-family hypotheses and supplied logarithmic smooth de Rham/Dolbeault resolutions, let σ be a smooth E-valued logarithmic one-form whose restriction to every fibre near b is closed. If u∈T_bB and v is a smooth lift along C_b tangent to D, then ∇GM([σ])_b(u) is the class of (ι_v d_tot σ)|Cb, where d_tot=∇+barpartial. Its class is independent of the lift and of exact changes of representative. Contraction occurs before restriction to the fibre.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.curve_kodairaSpencer_derivative
  Under the unitary logarithmic curve hypotheses, at b write C=C_b,D=D_b,E=E|C. For σ∈H⁰(C,Eω(D)) and u∈T_bB, the uncurried Grassmannian period derivative satisfies dP_b(u)(σ)=eval_*(κ_b(u) cup σ) in H¹(C,E), where κ_b is logCurveKS and eval contracts ω(D)⊗T_C(−D)→O_C. The sign is positive with κ=[barpartial v], d_tot=∇+barpartial and the source cup order specified; interchanging a degree-zero σ introduces no graded sign.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.serre_traceAdjoint
  For a smooth proper connected complex curve C, reduced D and holomorphic vector bundle E, the cup-contraction map H¹(T_C(−D))⊗H⁰(Eω(D))→H¹(E) is adjoint to μ_E:H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D)). Use Serre duality H¹(E)∨≅H⁰(E∨ω), H¹(T_C(−D))∨≅H⁰(ω²(D)) with the trace H¹(ω)→C and its cup/evaluation description. The statement is about vector bundles and proper curves, not arbitrary nonproper curves or only line-bundle duality.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.trace_periodDerivative
  For the unitary logarithmic family, the cotangent period derivative is dP_b∨=κ_b∨∘μ_E under the stated vector-bundle Serre dualities: H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D))→T_bB∨. Here κ_b∨ denotes the Serre identification followed by the linear dual of logCurveKS. If 2g−2+n>0 and a supplied analytic classifying map c:B→M_g,n with the universal deformation/cotangent dictionary is chosen, κ_b∨ is exactly c_b*:H⁰(ω²(D))→Ω¹_B,b, giving the factorization of Landesman–Litt Theorem 5.1.6. The derivative is adjoint to the quotient Gauss–Manin map.

application signature omitted: TauCeti.Hodge.PeriodGeometry.trace_derivativeRank
  In the finite-dimensional fibre spaces of the trace formula, rank dP_b=rank dP_b∨=rank(κ_b∨∘μ_E)≤rank μ_E. If the classifying map is étale at b, κ_b∨ is an isomorphism and equality rank dP_b=rank μ_E holds. More generally equality requires injectivity of κ_b∨ on im μ_E. The statement supplies the interface for H.4; it does not prove that every family is versal or any Clifford/rank bound.

comparison signature omitted: TauCeti.Hodge.PeriodGeometry.abelianPeriod_holomorphic
  For the principally polarized abelian family and local symplectic marking, Ω and τ are holomorphic; τ is symmetric and Im τ positive definite, so the weight-one period map is the corresponding holomorphic map to Siegel upper half space. Its graph plane is the marked F¹ in the row-period convention. For a changed symplectic cycle marking M with blocks a,b,c,d acting on the right on [I τ], the new normalized matrix is (a+τc)^(−1)(b+τd). A left column-plane convention instead gives the familiar (aτ+b)(cτ+d)^(−1); these are not mixed. General polarization type retains its elementary-divisor matrix rather than being forced to this principal convention.

test signature omitted: TauCeti.Hodge.PeriodGeometry.horizontal_twoStep
  For weight two with dimensions h(2)=h(0)=2,h(1)=1, choose basis e1,e2,e3,e4,e5, F²=span(e1,e2), F¹=span(e1,e2,e3), and Q(e1,e4)=Q(e2,e5)=−1,Q(e3,e3)=1. In the Q-skew Lie algebra, X(e1)=e5,X(e2)=−e4 and X(e3)=X(e4)=X(e5)=0 has grade −2. Its nonzero class in g/F⁰g is not horizontal.
-/
