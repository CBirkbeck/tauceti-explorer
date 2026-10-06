/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/Polylogarithms--P.3.md` is definitive. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.
They claim no implementation. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

B₂, B₃, their symbols and maps, Γ, the single-valued trilogarithm, and Milnor
K-groups are imported objects from the parent/supplier roadmaps. They occur as
module variables below. Statements involving those variables are signatures for
those actual objects, not assertions about arbitrary modules and arbitrary maps.
In particular no absent comparison theorem is an assumed structure field.
A name marked "not stated" needs the specific missing supplier interface named
there; it is not replaced by a placeholder proposition. All declarations remain
unchecked plans. Test names appear in docstrings on `example`s.
-/
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.Finsupp.Defs
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Algebra.DirectSum.Module
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.LSeries.RiemannZeta

-- The shared production build treats warnings as errors; this planning file
-- deliberately contains signature placeholders, permitted by the blueprint protocol.
set_option warningAsError false

noncomputable section
open scoped TensorProduct DirectSum
namespace TauCeti.Polylog.WeightThree

section Relation
variable {F : Type} [Field F]

private def bracket (z : F) : F →₀ ℚ := Finsupp.single z 1
private def relationBlock (a b c : F) : F →₀ ℚ :=
  let A := c*a-a+1
  let B := b*c-c+1
  bracket A + bracket (A/(c*a)) + bracket c + bracket (B/(A*b)) -
    bracket (A/c) + bracket (-B*a/A) - bracket (B/(A*b*c)) - bracket 1

/-- The corrected coordinate formula. Admissibility is required for the quotient theorem. -/
def relation22 (a b c : F) : F →₀ ℚ :=
  relationBlock a b c + relationBlock c a b + relationBlock b c a + bracket (-a*b*c)

private def admissible (a b c : F) : Prop :=
  a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ c*a-a+1 ≠ 0 ∧ a*b-b+1 ≠ 0 ∧ b*c-c+1 ≠ 0

theorem relation22_cyclic (a b c : F) : relation22 a b c = relation22 c a b := by sorry

theorem relation22_map {E : Type} [Field E] (f : F →+* E) (a b c : F) :
    Finsupp.lmapDomain ℚ ℚ f (relation22 a b c) = relation22 (f a) (f b) (f c) := by sorry

theorem relation22_eval {M : Type} [AddCommGroup M] [Module ℚ M]
    (v : F → M) (a b c : F) :
    Finsupp.linearCombination ℚ v (relation22 a b c) =
      Finsupp.linearCombination ℚ v (relationBlock a b c) +
      Finsupp.linearCombination ℚ v (relationBlock c a b) +
      Finsupp.linearCombination ℚ v (relationBlock b c a) + v (-a*b*c) := by sorry

variable {B3 : Type} [AddCommGroup B3] [Module ℚ B3] (gen3 : F → B3)
/-- `gen3` is the actual symbol of the parent's explicit B₃ quotient. -/
theorem relation22_quotient (a b c : F) (h : admissible a b c) :
    Finsupp.linearCombination ℚ gen3 (relation22 a b c) = 0 := by sorry

/-- Test `TauCeti.Polylog.WeightThree.relation222`. -/
example : relation22 (2 : ℚ) 2 2 =
    3 • bracket 3 + 3 • bracket (3/4) + 3 • bracket 2 + 3 • bracket (1/2) +
    3 • bracket (-2) - 3 • bracket (3/2) - 3 • bracket (1/4) -
    3 • bracket 1 + bracket (-8) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.relation111`. -/
example : relation22 (1 : ℚ) 1 1 = 3 • bracket 1 + 4 • bracket (-1) := by sorry

/-- Native quotient used only to test equality modulo inversion, not to define B₃. -/
private def inversionSpan : Submodule ℚ (F →₀ ℚ) :=
  Submodule.span ℚ {v | ∃ z : F, z ≠ 0 ∧ v = bracket z - bracket z⁻¹}
/-- Test `TauCeti.Polylog.WeightThree.relation11c`. -/
example (c : F) (hc : c ≠ 0) :
    (inversionSpan (F := F)).mkQ (relation22 1 1 c) =
      (inversionSpan (F := F)).mkQ (-bracket (c^2) + 4 • bracket c + 4 • bracket (-c)) := by sorry
end Relation

section Configurations
variable (F : Type) [Field F]

/-- Genericity uses native linear independence, including subfamilies shorter than the rank. -/
private def IsGeneric {q m : ℕ} (l : Fin m → Fin q → F) : Prop :=
  ∀ k : ℕ, k ≤ q → ∀ e : Fin k → Fin m, Function.Injective e →
    LinearIndependent F (fun i => l (e i))

def GenericTuple (q m : ℕ) := {l : Fin m → Fin q → F // IsGeneric F l}

private def genericGL {q m : ℕ} (g : Matrix.GeneralLinearGroup (Fin q) F)
    (l : GenericTuple F q m) : GenericTuple F q m :=
  ⟨fun i => (g.val).mulVec (l.val i), by sorry⟩

/-- The permutation representation on native finite formal sums of generic tuples. -/
private def configRepresentation (q m : ℕ) :
    Representation ℚ (Matrix.GeneralLinearGroup (Fin q) F) (GenericTuple F q m →₀ ℚ) where
  toFun g := Finsupp.lmapDomain ℚ ℚ (genericGL F g)
  map_one' := by sorry
  map_mul' := by sorry

abbrev Config (q m : ℕ) := Representation.Coinvariants (configRepresentation F q m)

def configMk {q m : ℕ} (l : GenericTuple F q m) : Config F q m :=
  Representation.Coinvariants.mk (configRepresentation F q m) (Finsupp.single l 1)

theorem configMk_gl {q m : ℕ} (g : Matrix.GeneralLinearGroup (Fin q) F)
    (l : GenericTuple F q m) : configMk F (genericGL F g l) = configMk F l := by sorry

variable {M : Type} [AddCommGroup M] [Module ℚ M]

def configLift {q m : ℕ} (f : GenericTuple F q m → M)
    (h : ∀ g l, f (genericGL F g l) = f l) : Config F q m →ₗ[ℚ] M := by sorry

/-- The universal property is part of the API, not just existence of a map. -/
theorem configLift_mk {q m : ℕ} (f : GenericTuple F q m → M)
    (h : ∀ g l, f (genericGL F g l) = f l) (l : GenericTuple F q m) :
    configLift F f h (configMk F l) = f l := by sorry

theorem config_ext {q m : ℕ} (f g : Config F q m →ₗ[ℚ] M)
    (h : ∀ l, f (configMk F l) = g (configMk F l)) : f = g := by sorry

/-- Target tuple size decreases by one; deletion itself works in every row. -/
def configDelete {q m : ℕ} (i : Fin (m+1)) : Config F q (m+1) →ₗ[ℚ] Config F q m := by sorry

/-- Quotienting by the chosen nonzero vector lowers ambient dimension as well. -/
def configProject {q m : ℕ} (i : Fin (m+1)) :
    Config F (q+1) (m+1) →ₗ[ℚ] Config F q m := by sorry

theorem config_coinvariants (q m : ℕ) :
    Config F q m = Representation.Coinvariants (configRepresentation F q m) := by sorry

/-- Test `TauCeti.Polylog.WeightThree.generic_basis`. -/
example : IsGeneric ℚ (fun i j : Fin 3 => if i = j then 1 else 0) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.generic_zero`. -/
example {q m : ℕ} (hq : 1 ≤ q) (l : Fin m → Fin q → F) (i : Fin m)
    (hi : l i = 0) : ¬IsGeneric F l := by sorry
private def pairOne (a : ℚ) (ha : a ≠ 0) : GenericTuple ℚ 1 2 := ⟨![![1], ![a]], by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.config_ratios`. -/
example : configMk ℚ (pairOne 2 (by norm_num)) ≠ configMk ℚ (pairOne 3 (by norm_num)) := by sorry

abbrev bigrassmannian (m : ℕ) := ⨁ q : {q : ℕ // 3 ≤ q ∧ q < m}, Config F q.val m

def bigrassmannianD (m : ℕ) : bigrassmannian F (m+1) →ₗ[ℚ] bigrassmannian F m := by sorry

/-- Deletion and projection sums; signs refer to zero-based indices. -/
private def deleteD (q m : ℕ) : Config F q (m+1) →ₗ[ℚ] Config F q m :=
  ∑ i : Fin (m+1), ((-1 : ℚ)^i.val) • configDelete F i
private def projectD (q m : ℕ) : Config F (q+1) (m+1) →ₗ[ℚ] Config F q m :=
  ∑ i : Fin (m+1), ((-1 : ℚ)^i.val) • configProject F i

-- TauCeti.Polylog.WeightThree.bigrassmannianD_component: not stated here;
-- needs the dependent row-inclusion/projection API for the finite direct sum.
-- Its required statement is exactly deletion in row q and projection in row q−1.
theorem bigrassmannianD_sq (m : ℕ) :
    (bigrassmannianD F m).comp (bigrassmannianD F (m+1)) = 0 := by sorry

def bigrassmannian_corner : bigrassmannian F 4 ≃ₗ[ℚ] Config F 3 4 := by sorry

-- TauCeti.Polylog.WeightThree.bigrassmannian_map: not stated; needs the
-- induced generic-tuple field map and its native coinvariant map.

/-- Test `TauCeti.Polylog.WeightThree.bigrassmannian_degree3`. -/
example : Subsingleton (bigrassmannian F 3) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.bigrassmannian_degree4`. -/
example : (bigrassmannianD F 3) = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.bigrassmannian_mixed`. -/
example : (deleteD F 3 5).comp (projectD F 3 6) +
    (projectD F 3 5).comp (deleteD F 4 6) = 0 := by sorry
end Configurations

section Ratios
variable {F : Type} [Field F]
private def minor {m : ℕ} (l : Fin m → Fin 3 → F) (i j k : Fin m) : F :=
  Matrix.det (fun a : Fin 3 => (![l i, l j, l k] : Fin 3 → Fin 3 → F) a)

/-- In GR §7's order, the inverse of the V.4 cross-ratio. -/
def projectedRatio (l : GenericTuple F 3 5) : F :=
  minor l.val 0 1 3 * minor l.val 0 2 4 /
    (minor l.val 0 1 4 * minor l.val 0 2 3)

theorem projectedRatio_ne (l : GenericTuple F 3 5) :
    projectedRatio l ≠ 0 ∧ projectedRatio l ≠ 1 := by sorry

theorem projectedRatio_gl (g : Matrix.GeneralLinearGroup (Fin 3) F)
    (l : GenericTuple F 3 5) : projectedRatio (genericGL F g l) = projectedRatio l := by sorry

private def scaled {m : ℕ} (s : Fin m → Fˣ) (l : GenericTuple F 3 m) :
    GenericTuple F 3 m := ⟨fun i => (s i : F) • l.val i, by sorry⟩

theorem projectedRatio_scale (s : Fin 5 → Fˣ) (l : GenericTuple F 3 5) :
    projectedRatio (scaled s l) = projectedRatio l := by sorry
-- TauCeti.Polylog.WeightThree.projectedRatio_blochCrossRatio: not stated;
-- needs V.4's ordered projective quotient-point cross-ratio carrier/map.

private def moment (t : ℚ) : Fin 3 → ℚ := ![1,t,t^2]
private def moment5 : GenericTuple ℚ 3 5 :=
  ⟨fun i => moment (![1,2,3,5,7] i), by sorry⟩
private def permute {q m : ℕ} (l : GenericTuple F q m) (σ : Equiv.Perm (Fin m)) :
    GenericTuple F q m := ⟨fun i => l.val (σ i), by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.projectedRatio_moment`. -/
example : projectedRatio moment5 = 6/5 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.projectedRatio_swap`. -/
example : projectedRatio (permute moment5 (Equiv.swap 3 4)) = 5/6 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.projectedRatio_bad`. -/
example : ¬ IsGeneric ℚ (![0, moment 2, moment 3, moment 5, moment 7]) := by sorry

def tripleRatio (l : GenericTuple F 3 6) : F :=
  minor l.val 0 1 3 * minor l.val 1 2 4 * minor l.val 0 2 5 /
    (minor l.val 0 1 4 * minor l.val 1 2 5 * minor l.val 0 2 3)

theorem tripleRatio_scale (s : Fin 6 → Fˣ) (l : GenericTuple F 3 6) :
    tripleRatio (scaled s l) = tripleRatio l := by sorry

private def moment6 : GenericTuple ℚ 3 6 :=
  ⟨fun i => moment (![1,2,3,5,7,11] i), by sorry⟩
private def ratioOne : GenericTuple ℚ 3 6 :=
  ⟨![![1,0,0], ![0,1,0], ![0,0,1], ![1,1,1], ![1,2,3], ![1,3,2]], by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.tripleRatio_moment`. -/
example : tripleRatio moment6 = 10/9 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.tripleRatio_one`. -/
example : tripleRatio ratioOne = 1 := by sorry
end Ratios

section ConfigurationMaps
variable {F : Type} [Field F]
/-- The rational unit module is owned by K2SymbolsBrauer, instantiated natively. -/
abbrev UnitsQ (F : Type) [Field F] := ℚ ⊗[ℤ] Additive Fˣ
private def unitClass (x : F) : UnitsQ F :=
  if h : x = 0 then 0 else TensorProduct.tmul ℤ 1 (Additive.ofMul (Units.mk0 x h))
private def wedge (x y z : UnitsQ F) : ⋀[ℚ]^3 (UnitsQ F) :=
  exteriorPower.ιMulti ℚ 3 ![x,y,z]
private def signQ {m : ℕ} (σ : Equiv.Perm (Fin m)) : ℚ :=
  ((Equiv.Perm.sign σ : ℤˣ) : ℤ)
private def alternate {M : Type} [AddCommGroup M] [Module ℚ M] {q m : ℕ}
    (f : GenericTuple F q m → M) (l : GenericTuple F q m) : M :=
  ∑ σ : Equiv.Perm (Fin m), signQ σ • f (permute l σ)

private def exteriorFormula (vol : Fˣ) (l : GenericTuple F 3 4) : ⋀[ℚ]^3 (UnitsQ F) :=
  (-3 : ℚ) • alternate (fun v => wedge
    (unitClass ((vol : F)*minor v.val 0 1 2))
    (unitClass ((vol : F)*minor v.val 0 1 3))
    (unitClass ((vol : F)*minor v.val 0 2 3))) l

def configExterior (vol : Fˣ) : Config F 3 4 →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ F) :=
  configLift F (exteriorFormula vol) (by sorry)

theorem configExterior_mk (vol : Fˣ) (l : GenericTuple F 3 4) :
    configExterior vol (configMk F l) = exteriorFormula vol l := by sorry

theorem configExterior_volume (vol w : Fˣ) : configExterior vol = configExterior w := by sorry

theorem configExterior_alt (vol : Fˣ) (l : GenericTuple F 3 4) (σ : Equiv.Perm (Fin 4)) :
    configExterior vol (configMk F (permute l σ)) =
      signQ σ • configExterior vol (configMk F l) := by sorry
-- TauCeti.Polylog.WeightThree.configExterior_fieldMap: not stated; needs the
-- canonical tensor extension of the supplier unit map and the config field map.

private def small4 : GenericTuple ℚ 3 4 :=
  ⟨![![1,8,2], ![7,3,11], ![1,3,2], ![9,4,3]], by sorry⟩
private def moment4 : GenericTuple ℚ 3 4 :=
  ⟨fun i => moment (![1,2,3,5] i), by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.configExterior_small`. -/
example : configExterior (1 : ℚˣ) (configMk ℚ small4) =
    (18 : ℚ) • wedge (unitClass (5 : ℚ)) (unitClass (67 : ℚ)) (unitClass (197 : ℚ)) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configExterior_moment4`. -/
example : configExterior (1 : ℚˣ) (configMk ℚ moment4) = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configExterior_native`. -/
example (x y z : UnitsQ F) : wedge x y z = exteriorPower.ιMulti ℚ 3 ![x,y,z] := by sorry

variable {B2 B3 : Type} [AddCommGroup B2] [Module ℚ B2] [AddCommGroup B3] [Module ℚ B3]
variable (gen2 : F → B2) (gen3 : F → B3)
private def middleFormula (vol : Fˣ) (l : GenericTuple F 3 5) : B2 ⊗[ℚ] UnitsQ F :=
  alternate (fun v => gen2 (projectedRatio v) ⊗ₜ[ℚ]
    unitClass ((vol : F)*minor v.val 2 3 4)) l

def configMiddle (vol : Fˣ) : Config F 3 5 →ₗ[ℚ] B2 ⊗[ℚ] UnitsQ F :=
  configLift F (middleFormula gen2 vol) (by sorry)

theorem configMiddle_mk (vol : Fˣ) (l : GenericTuple F 3 5) :
    configMiddle gen2 vol (configMk F l) = middleFormula gen2 vol l := by sorry

theorem configMiddle_volume (vol w : Fˣ) :
    configMiddle gen2 vol = configMiddle gen2 w := by sorry

theorem configMiddle_alt (vol : Fˣ) (l : GenericTuple F 3 5) (σ : Equiv.Perm (Fin 5)) :
    configMiddle gen2 vol (configMk F (permute l σ)) =
      signQ σ • configMiddle gen2 vol (configMk F l) := by sorry
-- TauCeti.Polylog.WeightThree.configMiddle_fieldMap: not stated; needs the
-- canonical supplier B₂ field map together with config and unit field maps.

/- `d2` is the parent differential, using (1−x)∧x, not V.3's opposite sign. -/
variable (d2 : B2 ⊗[ℚ] UnitsQ F →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ F))
/-- Test `TauCeti.Polylog.WeightThree.configMiddle_moment`. -/
example (gen2Q : ℚ → B2) (d2Q : B2 ⊗[ℚ] UnitsQ ℚ →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ ℚ)) :
    d2Q (configMiddle gen2Q (1 : ℚˣ) (configMk ℚ moment5)) =
      (36 : ℚ) • wedge (unitClass (2 : ℚ)) (unitClass (3 : ℚ)) (unitClass (5 : ℚ)) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configMiddle_scaleVolume`. -/
example (gen2Q : ℚ → B2) : configMiddle gen2Q (Units.mk0 (2 : ℚ) (by norm_num)) =
    configMiddle gen2Q (1 : ℚˣ) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configMiddle_notProjective`. -/
example (gen2Q : ℚ → B2) (d2Q : B2 ⊗[ℚ] UnitsQ ℚ →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ ℚ)) :
    d2Q (configMiddle gen2Q (1 : ℚˣ) (configMk ℚ
      (scaled (fun i => if i = 0 then Units.mk0 (2 : ℚ) (by norm_num) else 1) moment5))) =
      (18 : ℚ) • wedge (unitClass (2 : ℚ)) (unitClass (3 : ℚ)) (unitClass (5 : ℚ)) := by sorry

def configTrilog : Config F 3 6 →ₗ[ℚ] B3 :=
  configLift F (fun l => (1/5 : ℚ) • alternate (fun v => gen3 (tripleRatio v)) l) (by sorry)

theorem configTrilog_mk (l : GenericTuple F 3 6) :
    configTrilog gen3 (configMk F l) =
      (1/5 : ℚ) • alternate (fun v => gen3 (tripleRatio v)) l := by sorry

theorem configTrilog_alt (l : GenericTuple F 3 6) (σ : Equiv.Perm (Fin 6)) :
    configTrilog gen3 (configMk F (permute l σ)) =
      signQ σ • configTrilog gen3 (configMk F l) := by sorry
-- TauCeti.Polylog.WeightThree.configTrilog_fieldMap: not stated; needs the
-- canonical parent B₃ field map, not an arbitrary linear map between modules.
/-- Test `TauCeti.Polylog.WeightThree.configTrilog_normalization`. -/
example (l : GenericTuple F 3 6) :
    (5 : ℚ) • configTrilog gen3 (configMk F l) =
      alternate (fun v => gen3 (tripleRatio v)) l := by sorry

theorem seven_term_configuration_relation (x : Config F 3 7) :
    configTrilog gen3 (deleteD F 3 6 x) = 0 := by sorry

variable (delta3 : B3 →ₗ[ℚ] B2 ⊗[ℚ] UnitsQ F)
theorem configuration_chain_comparison :
    d2.comp (configMiddle gen2 (1 : Fˣ)) = (configExterior (1 : Fˣ)).comp (deleteD F 3 4) ∧
    delta3.comp (configTrilog gen3) = (configMiddle gen2 (1 : Fˣ)).comp (deleteD F 3 5) ∧
    (configExterior (1 : Fˣ)).comp (projectD F 3 4) = 0 ∧
    (configMiddle gen2 (1 : Fˣ)).comp (projectD F 3 5) = 0 ∧
    (configTrilog gen3).comp (projectD F 3 6) = 0 := by sorry

theorem relation_cobracket (a b c : F) (h : admissible a b c) :
    delta3 (Finsupp.linearCombination ℚ gen3 (relation22 a b c)) = 0 := by sorry
end ConfigurationMaps


section GeometricPresentation
variable (F : Type) [Field F] [Infinite F]
private abbrev SixPoints := Fin 6 → Projectivization F (Fin 3 → F)
/-- Span of projective GL changes, repeat/four-collinear degeneracies, seven-term
relations and the precise intersection R3 family in the reader document. This
submodule is a proposed construction, not an assumed proposition. -/
private def geometricRelations : Submodule ℚ (SixPoints F →₀ ℚ) := by sorry

def GeometricTrilog := (SixPoints F →₀ ℚ) ⧸ geometricRelations F
instance : AddCommGroup (GeometricTrilog F) := inferInstanceAs (AddCommGroup (_ ⧸ _))
instance : Module ℚ (GeometricTrilog F) := inferInstanceAs (Module ℚ (_ ⧸ _))

def geometricMk (l : SixPoints F) : GeometricTrilog F :=
  (geometricRelations F).mkQ (Finsupp.single l 1)

theorem geometricMk_alt (l : SixPoints F) (σ : Equiv.Perm (Fin 6)) :
    geometricMk F (fun i => l (σ i)) = signQ σ • geometricMk F l := by sorry

/-- Native quotient universal property; its hypothesis names the actual generated
submodule and does not replace its relation families by an unspecified proposition. -/
def geometricLift {M : Type} [AddCommGroup M] [Module ℚ M]
    (f : (SixPoints F →₀ ℚ) →ₗ[ℚ] M) (h : geometricRelations F ≤ LinearMap.ker f) :
    GeometricTrilog F →ₗ[ℚ] M := (geometricRelations F).liftQ f h

/-- The triangle-family class with its specified source degeneration at 1. -/
def geometricTriangle (z : F) : GeometricTrilog F := by sorry

/-- Test `TauCeti.Polylog.WeightThree.geometric_repeat`. -/
example (l : SixPoints F) (h : l 0 = l 1) : geometricMk F l = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.geometric_fourCollinear`. -/
example (l : SixPoints F) (W : Submodule F (Fin 3 → F))
    (hW : Module.finrank F W = 2)
    (h : ∀ i : Fin 4, (l (i.castSucc.castSucc)).rep ∈ W) :
    geometricMk F l = 0 := by sorry
-- Test TauCeti.Polylog.WeightThree.geometric_triangle_nonzero appears below
-- beside the descended complex regulator, so its expected value is explicit.

variable {B3 : Type} [AddCommGroup B3] [Module ℚ B3] (gen3 : F → B3)
theorem geometric_trilogarithm_comparison :
    ∃ M3 : GeometricTrilog F ≃ₗ[ℚ] B3, ∀ z : F, M3 (geometricTriangle F z) = gen3 z := by sorry
private def geometricM3 : GeometricTrilog F ≃ₗ[ℚ] B3 :=
  Classical.choose (geometric_trilogarithm_comparison F gen3)

-- The full M₃ generic/intersection formula and Alt M₃=(3/2) Alt[T] are specified
-- in the packet. They need the projective intersection/projection carrier API.

/-- Native vector-configuration duality, not a second Grassmannian definition. -/
def configurationDual (q m : ℕ) (hq : 0 < q) (hqm : q < m) :
    Config F q m ≃ₗ[ℚ] Config F (m-q) m := by sorry

-- TauCeti.Polylog.WeightThree.configurationDual_sq: not stated in full
-- generality; needs the finite-index transport identifying m−(m−q) with q.
-- The same-rank six-point test below gives the unambiguous special case.
-- TauCeti.Polylog.WeightThree.configurationDual_matrix: not stated;
-- needs the dependent Fin-sum transport for the blocks (I_q,B) and (−Bᵀ,I).
-- TauCeti.Polylog.WeightThree.configurationDual_faces: not stated;
-- needs the same transport on the deletion/projection source and target rows.

private def dualFourInput : GenericTuple ℚ 2 4 :=
  ⟨![![1,0], ![0,1], ![1,2], ![1,3]], by sorry⟩
private def dualFourOutput : GenericTuple ℚ 2 4 :=
  ⟨![![-1,-1], ![-2,-3], ![1,0], ![0,1]], by sorry⟩
private def dualWrongInverse : GenericTuple ℚ 2 4 :=
  ⟨![![1,0], ![0,1], ![3,-2], ![-1,1]], by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.configurationDual_four`. -/
example : configurationDual ℚ 2 4 (by omega) (by omega) (configMk ℚ dualFourInput) =
    configMk ℚ dualFourOutput := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configurationDual_six`. -/
example (x : Config F 3 6) :
    configurationDual F 3 6 (by omega) (by omega)
      (configurationDual F 3 6 (by omega) (by omega) x) = x := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configurationDual_notInverse`. -/
example : configurationDual ℚ 2 4 (by omega) (by omega) (configMk ℚ dualFourInput) ≠
    configMk ℚ dualWrongInverse := by sorry

-- TauCeti.Polylog.WeightThree.trilogarithm_duality: not stated;
-- needs the arbitrary projective six-tuple duality map on the no-four-collinear
-- locus, then the native M₃ comparison. Its conclusion is [dual x]=−[x], not
-- a real functional identity. configuration_chain_comparison states its r₆p consequence.
end GeometricPresentation

section Homology
variable (F : Type) [Field F] [Infinite F]
private abbrev HGL (n k : ℕ) :=
  groupHomology (Rep.trivial ℚ (Matrix.GeneralLinearGroup (Fin n) F) ℚ) k
variable (Gamma : CochainComplex (ModuleCat ℚ) ℕ)

def configurationComparison (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    HGL F n (6-i) →ₗ[ℚ] Gamma.homology i := by sorry

-- TauCeti.Polylog.WeightThree.configurationComparison_stabilize: not stated;
-- needs V.4's native block-stabilization map on group homology.
-- TauCeti.Polylog.WeightThree.configurationComparison_rank3: not stated;
-- needs the parent Γ's three module identifications and the hyperhomology edge map.
-- TauCeti.Polylog.WeightThree.configurationComparison_fieldMap: not stated;
-- needs the Γ and group-homology field maps from the supplier interfaces.
-- TauCeti.Polylog.WeightThree.configurationComparison_K: not stated;
-- needs GeneralAlgebraicKTheory Part II's rational primitive Hurewicz map.

/-- Test `TauCeti.Polylog.WeightThree.configurationComparison_zero`. -/
example (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    configurationComparison F Gamma n i hn hi 0 = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configurationComparison_degree2`. -/
example (n : ℕ) (hn : 3 ≤ n) : HGL F n 4 →ₗ[ℚ] Gamma.homology 2 :=
  by sorry
-- Test `TauCeti.Polylog.WeightThree.configurationComparison_stableFixture`:
-- not stated; needs the same block-stabilization and cycle-to-homology interface.
-- TauCeti.Polylog.WeightThree.rank_two_vanishing: not stated; needs the
-- GL₂→GL_n homology map. No Adams/rank filtration equality is assumed.
-- TauCeti.Polylog.WeightThree.suslin_top_comparison: not stated; needs the
-- primitive Hurewicz/Milnor diagonal adapter in the precise supplier request.
-- TauCeti.Polylog.WeightThree.cycle_lifting: not stated; needs the stable
-- generic-resolution edge map, including the omitted higher differentials.
end Homology

section Milnor
variable {F : Type} [Field F]
variable {B2 : Type} [AddCommGroup B2] [Module ℚ B2]
variable (d2 : B2 ⊗[ℚ] UnitsQ F →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ F))
private def steinbergSpan : Submodule ℚ (⋀[ℚ]^3 (UnitsQ F)) :=
  Submodule.span ℚ {v | ∃ x y : F, x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧
    v = wedge (unitClass (1-x)) (unitClass x) (unitClass y)}

theorem steinberg_boundary_image : LinearMap.range d2 = steinbergSpan (F := F) := by sorry
-- The kernel equality with Milnor symbols is the imported T.2 presentation;
-- no new Milnor K-group or new H³Γ equivalence is defined here.

variable {HF HE HL MF ME ML : Type}
variable [AddCommGroup HF] [Module ℚ HF] [AddCommGroup HE] [Module ℚ HE]
variable [AddCommGroup HL] [Module ℚ HL] [AddCommGroup MF] [Module ℚ MF]
variable [AddCommGroup ME] [Module ℚ ME] [AddCommGroup ML] [Module ℚ ML]
/-- η is the parent's H³–Milnor equivalence; N is the supplier Milnor norm. -/
def h3Transfer (etaF : HF ≃ₗ[ℚ] MF) (etaE : HE ≃ₗ[ℚ] ME) (N : ME →ₗ[ℚ] MF) :
    HE →ₗ[ℚ] HF := etaF.symm.toLinearMap.comp (N.comp etaE.toLinearMap)

theorem h3Transfer_eta (etaF : HF ≃ₗ[ℚ] MF) (etaE : HE ≃ₗ[ℚ] ME) (N : ME →ₗ[ℚ] MF) :
    etaF.toLinearMap.comp (h3Transfer etaF etaE N) = N.comp etaE.toLinearMap := by sorry

theorem h3Transfer_id (etaF : HF ≃ₗ[ℚ] MF) :
    h3Transfer etaF etaF LinearMap.id = LinearMap.id := by sorry

theorem h3Transfer_comp (etaF : HF ≃ₗ[ℚ] MF) (etaE : HE ≃ₗ[ℚ] ME)
    (etaL : HL ≃ₗ[ℚ] ML) (NFE : ME →ₗ[ℚ] MF) (NEL : ML →ₗ[ℚ] ME) :
    (h3Transfer etaF etaE NFE).comp (h3Transfer etaE etaL NEL) =
      h3Transfer etaF etaL (NFE.comp NEL) := by sorry

-- TauCeti.Polylog.WeightThree.h3Transfer_res: not stated; needs the actual
-- Milnor restriction and its eta-compatible parent cohomology restriction.
-- TauCeti.Polylog.WeightThree.h3Transfer_projection: not stated; needs the
-- supplier graded Milnor product with the degree-1/2 eta comparisons.
-- TauCeti.Polylog.WeightThree.h3Transfer_residue: not stated; needs the
-- valuation/residue-field transfer family with finite-integral-closure hypotheses.
/-- Test `TauCeti.Polylog.WeightThree.h3Transfer_identity`. -/
example (etaF : HF ≃ₗ[ℚ] MF) (x : HF) : h3Transfer etaF etaF LinearMap.id x = x := by sorry
-- Test `TauCeti.Polylog.WeightThree.h3Transfer_quadratic`: not stated;
-- needs the actual quadratic Milnor restriction/transfer maps; coefficient is 2.
/-- Test `TauCeti.Polylog.WeightThree.h3Transfer_notExteriorNorm`.
This is a native exterior-power computation of the competing coefficient law. -/
example (d : ℚ) (v : ⋀[ℚ]^3 (UnitsQ F)) :
    exteriorPower.map 3 (d • (LinearMap.id : UnitsQ F →ₗ[ℚ] UnitsQ F)) v = d^3 • v := by sorry
-- TauCeti.Polylog.WeightThree.conditional_complex_transfer: not stated;
-- needs P.4's weight-four localization quasi-isomorphism in the native derived
-- category and its residue-at-infinity map. The condition is not a fake Prop field.
end Milnor

section RealRegulator
variable {B3C : Type} [AddCommGroup B3C] [Module ℚ B3C]
variable (gen3C : ℂ → B3C) (L3 : ℂ → ℝ)

def trilogDescent (L3 : ℂ → ℝ) : B3C →ₗ[ℚ] ℝ := by sorry

theorem trilogDescent_mk (z : ℂ) : trilogDescent (B3C := B3C) L3 (gen3C z) = L3 z := by sorry

theorem trilogDescent_sum (s : ℂ →₀ ℚ) :
    trilogDescent (B3C := B3C) L3 (Finsupp.linearCombination ℚ gen3C s) =
      Finsupp.linearCombination ℚ L3 s := by sorry

variable (conjugateB3 : B3C →ₗ[ℚ] B3C)
theorem trilogDescent_conj (z : B3C) :
    trilogDescent L3 (conjugateB3 z) = trilogDescent (B3C := B3C) L3 z := by sorry

variable {F : Type} [Field F]
variable {B3F M : Type} [AddCommGroup B3F] [Module ℚ B3F] [AddCommGroup M] [Module ℚ M]
variable (delta3 : B3F →ₗ[ℚ] M)
/-- `B3sigma` is the parent B₃ map attached to the embedding, not an arbitrary map. -/
def trilogRegulatorAt (B3sigma : B3F →ₗ[ℚ] B3C) : LinearMap.ker delta3 →ₗ[ℚ] ℝ :=
  (trilogDescent (B3C := B3C) L3).comp (B3sigma.comp (LinearMap.ker delta3).subtype)

-- TauCeti.Polylog.WeightThree.trilogRegulatorAt_conj: not stated; needs the
-- canonical B₃ maps for sigma and starRingEnd C composed with sigma.

/-- Test `TauCeti.Polylog.WeightThree.trilogDescent_zero`. -/
example : trilogDescent (B3C := B3C) L3 (gen3C 0) = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.trilogDescent_one`. -/
example : trilogDescent (B3C := B3C) L3 (gen3C 1) = (riemannZeta (3 : ℂ)).re ∧
    0 < (riemannZeta (3 : ℂ)).re := by sorry
/-- Test `TauCeti.Polylog.WeightThree.geometric_triangle_nonzero`. -/
example : trilogDescent (B3C := B3C) L3
    (geometricM3 ℂ gen3C (geometricTriangle ℂ 1)) = (riemannZeta (3 : ℂ)).re := by sorry
/-- Test `TauCeti.Polylog.WeightThree.trilogDescent_minusOne`. -/
example : trilogDescent (B3C := B3C) L3 (gen3C (-1)) = -(3/4 : ℝ) * (riemannZeta (3 : ℂ)).re := by sorry

theorem trilogarithm_functional_relations (a b c : ℂ) (h : admissible a b c)
    (x : ℂ) (hx : x ≠ 0) :
    Finsupp.linearCombination ℚ L3 (relation22 a b c) = 0 ∧
    L3 x = L3 x⁻¹ ∧ L3 x + L3 (1-x) + L3 (1-x⁻¹) = L3 1 := by sorry

-- TauCeti.Polylog.WeightThree.configuration_borel_class: not stated;
-- needs the measurable configuration-cohomology carrier and its continuous
-- comparison, with the conjugation-even primitive Borel line singled out.
-- TauCeti.Polylog.WeightThree.rational_regulator_calibration: not stated;
-- needs R.7's exact comparison between the original Borel class and R.4's
-- Tate-generator coordinates. The scaling is pi^2 times a nonzero rational.
-- TauCeti.Polylog.WeightThree.regulator_image_containment: not stated;
-- needs the supplier rational K₅ module and its R.4 regulator map.
end RealRegulator

section NumberField
variable (F : Type) [Field F] [NumberField F]
variable {B3 M : Type} [AddCommGroup B3] [Module ℚ B3] [AddCommGroup M] [Module ℚ M]
variable (delta3 : B3 →ₗ[ℚ] M)
/- Rows select all real embeddings and one from each complex pair. `regAt` is
exactly the preceding L₃ pullback on the actual parent cycles. -/
variable (regAt : (F →+* ℂ) → LinearMap.ker delta3 →ₗ[ℚ] ℝ)
variable (places : Fin (NumberField.InfinitePlace.nrRealPlaces F + NumberField.InfinitePlace.nrComplexPlaces F) ≃ NumberField.InfinitePlace F)

/-- An enumeration of native infinite places selects exactly one embedding per
place; equal conjugate L₃ coordinates make the representative choice immaterial. -/
theorem every_family_special_value
    (z : Fin (NumberField.InfinitePlace.nrRealPlaces F + NumberField.InfinitePlace.nrComplexPlaces F) → LinearMap.ker delta3) :
    ∃ q : ℚ, Matrix.det (fun i j => regAt ((places i).embedding) (z j)) =
      (q : ℝ) * Real.sqrt |(NumberField.discr F : ℝ)| *
      Real.pi ^ (-(3 * (NumberField.InfinitePlace.nrComplexPlaces F : ℤ))) *
      (NumberField.dedekindZeta F (3 : ℂ)).re := by sorry
end NumberField
end TauCeti.Polylog.WeightThree
