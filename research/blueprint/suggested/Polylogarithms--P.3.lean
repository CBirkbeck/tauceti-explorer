/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/Polylogarithms--P.3.md` is definitive. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.
They claim no implementation. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Independent review REV-Polylogarithms--P.3: needs_changes. Native configuration
and finite-sum prototypes below are meaningful; generic module parameters are
not the parent's B₂/B₃ merely because comments call them so. False universal
claims have been removed. Names marked "not stated" require genuine supplier
objects and laws; they do not count as supplied API or tests. No desired theorem
is replaced by a Prop field. All remaining proofs are unchecked placeholders.
The review report lists the omitted signatures and the required revisions.
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
import Mathlib.NumberTheory.Padics.PadicVal.Basic

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

-- TauCeti.Polylog.WeightThree.relation22_quotient: not stated; needs the
-- actual parent B₃ quotient symbol and its relation-kernel law. An arbitrary
-- F → B₃ cannot satisfy this statement (R(1,1,1)=3[1]+4[−1]).

/-- Test `TauCeti.Polylog.WeightThree.relation222`. -/
example : relation22 (2 : ℚ) 2 2 =
    3 • bracket 3 + 3 • bracket (3/4) + 3 • bracket 2 + 3 • bracket (1/2) +
    3 • bracket (-2 : ℚ) - 3 • bracket (3/2) - 3 • bracket (1/4) -
    3 • bracket 1 + bracket (-8 : ℚ) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.relation111`. -/
example : relation22 (1 : ℚ) 1 1 = 3 • bracket 1 + 4 • bracket (-1 : ℚ) := by sorry

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
private def unitClass (x : F) : UnitsQ F := by
  classical
  exact if h : x = 0 then 0 else TensorProduct.tmul ℤ 1 (Additive.ofMul (Units.mk0 x h))
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

-- TauCeti.Polylog.WeightThree.configMiddle: not stated; middleFormula is
-- the raw finite sum, but GL descent and volume independence require the actual
-- B₂ symbol and five-term law. They fail for arbitrary gen2.
-- TauCeti.Polylog.WeightThree.configMiddle_mk: not stated; needs that descent.
-- TauCeti.Polylog.WeightThree.configMiddle_volume: not stated; needs five-term.
-- TauCeti.Polylog.WeightThree.configMiddle_alt: not stated; needs that descent.
-- TauCeti.Polylog.WeightThree.configMiddle_fieldMap: not stated; needs the
-- actual B₂/configuration/unit field maps.
-- Test TauCeti.Polylog.WeightThree.configMiddle_moment: not stated; needs the
-- parent d₂ formula on symbols. Taking an arbitrary d₂=0 refutes the old test.
-- Test TauCeti.Polylog.WeightThree.configMiddle_scaleVolume: not stated;
-- requires the actual B₂ quotient symbol.
-- Test TauCeti.Polylog.WeightThree.configMiddle_notProjective: not stated;
-- requires the actual d₂; the rational computations are recorded in the review.

def configTrilog : Config F 3 6 →ₗ[ℚ] B3 :=
  configLift F (fun l => (-1/5 : ℚ) • alternate (fun v => gen3 (tripleRatio v)) l) (by sorry)

theorem configTrilog_mk (l : GenericTuple F 3 6) :
    configTrilog gen3 (configMk F l) =
      (-1/5 : ℚ) • alternate (fun v => gen3 (tripleRatio v)) l := by sorry

theorem configTrilog_alt (l : GenericTuple F 3 6) (σ : Equiv.Perm (Fin 6)) :
    configTrilog gen3 (configMk F (permute l σ)) =
      signQ σ • configTrilog gen3 (configMk F l) := by sorry
-- TauCeti.Polylog.WeightThree.configTrilog_fieldMap: not stated; needs the
-- canonical parent B₃ field map, not an arbitrary linear map between modules.
/-- Test `TauCeti.Polylog.WeightThree.configTrilog_normalization`. -/
example (l : GenericTuple F 3 6) :
    (5 : ℚ) • configTrilog gen3 (configMk F l) =
      -alternate (fun v => gen3 (tripleRatio v)) l := by sorry

-- TauCeti.Polylog.WeightThree.seven_term_configuration_relation: not stated;
-- requires the actual B₃ relation quotient; an arbitrary gen3 has no such law.
-- TauCeti.Polylog.WeightThree.configuration_chain_comparison: not stated;
-- requires actual B₂/B₃ symbols, their differentials and explicit Γ. Correct
-- coefficients are −3 Alt₄ and −(1/5) Alt₆ under the packet's conventions.
-- TauCeti.Polylog.WeightThree.relation_cobracket: not stated; requires the
-- parent δ₃ law on the actual quotient, not an arbitrary delta3.

/-- Coordinate (v_p∧v_q)⊗v_r of (δ₂⊗1)δ₃[z]₃ over ℚ.
The native valuation is zero at z=0; z=1 gives a zero coordinate as required. -/
private def cobracketCoordinate (p q r : ℕ) (z : ℚ) : ℚ :=
  ((padicValRat p (1-z) : ℚ) * (padicValRat q z : ℚ) -
    (padicValRat q (1-z) : ℚ) * (padicValRat p z : ℚ)) * (padicValRat r z : ℚ)
private def topCoordinate (l : GenericTuple ℚ 3 6) : ℚ :=
  (-1/5 : ℚ) * ∑ σ : Equiv.Perm (Fin 6),
    signQ σ * cobracketCoordinate 2 3 2 (tripleRatio (permute l σ))
private def middleCoordinate (l : GenericTuple ℚ 3 5) : ℚ :=
  ∑ σ : Equiv.Perm (Fin 5), signQ σ *
    (((padicValRat 2 (1-projectedRatio (permute l σ)) : ℚ) *
      (padicValRat 3 (projectedRatio (permute l σ)) : ℚ) -
      (padicValRat 3 (1-projectedRatio (permute l σ)) : ℚ) *
      (padicValRat 2 (projectedRatio (permute l σ)) : ℚ)) *
      (padicValRat 2 (minor (permute l σ).val 2 3 4) : ℚ))
private def deleteTuple (l : GenericTuple ℚ 3 6) (i : Fin 6) : GenericTuple ℚ 3 5 :=
  ⟨fun j => l.val (i.succAbove j), by sorry⟩
/-- Test `TauCeti.Polylog.WeightThree.configTrilog_cobracketCoordinate`.
This checks the corrected raw formula without assuming a B₃ interface. -/
example : topCoordinate ratioOne = -60 ∧
    (∑ i : Fin 6, (-1 : ℚ)^i.val * middleCoordinate (deleteTuple ratioOne i)) = -60 := by sorry
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
-- Test TauCeti.Polylog.WeightThree.geometric_triangle_nonzero: not stated;
-- needs the actual B₃ comparison and descended L₃; the expected value is ζ(3).

-- TauCeti.Polylog.WeightThree.geometric_trilogarithm_comparison: not stated;
-- needs the actual parent B₃ quotient and a native intersection/projection API.
-- Existence of an isomorphism to every arbitrary rational module was false.
-- The packet records the printed Alt M₃=(3/2) Alt[T] and the separate corrected
-- r₆=−(1/5) Alt[T]. Their full explicit-quotient adapter is still required.

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
-- This type prototype must be specialized to the parent Γ and constrained by
-- the actual configuration edge construction. Its type and zero test alone
-- also admit a zero map, and do not validate the planned comparison.
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
  configurationComparison F Gamma n 2 hn ⟨by omega, by omega⟩
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

-- TauCeti.Polylog.WeightThree.steinberg_boundary_image: not stated; requires
-- the generating parent B₂ symbol and d₂([x]⊗u(y))=(1−x)∧x∧y law.
-- An arbitrary linear map d₂, in particular zero, has no such range equality.
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

-- The following actual-parent signatures cannot yet be stated faithfully.
-- TauCeti.Polylog.WeightThree.trilogDescent: not stated; requires the parent
-- explicit B₃(C) quotient, the actual single-valued L₃, and kernel inclusion
-- for its linearCombination map. Arbitrary L₃ and gen3C cannot descend.
-- TauCeti.Polylog.WeightThree.trilogDescent_mk: not stated; same interfaces.
-- TauCeti.Polylog.WeightThree.trilogDescent_sum: not stated; same interfaces.
-- TauCeti.Polylog.WeightThree.trilogDescent_conj: not stated; actual conjugation.
-- TauCeti.Polylog.WeightThree.trilogRegulatorAt: not stated; needs the actual
-- B₃ embedding map, δ₃ and descended functional, not an arbitrary linear map.
-- TauCeti.Polylog.WeightThree.trilogRegulatorAt_conj: not stated; same maps.
-- Test TauCeti.Polylog.WeightThree.trilogDescent_zero: not stated; L₃(0)=0.
-- Test TauCeti.Polylog.WeightThree.trilogDescent_one: not stated; L₃(1)=ζ(3)>0.
-- Test TauCeti.Polylog.WeightThree.trilogDescent_minusOne: not stated;
-- L₃(−1)=−3ζ(3)/4 for the actual function.
-- TauCeti.Polylog.WeightThree.trilogarithm_functional_relations: not stated;
-- requires that actual function and the source's continuity hypotheses.
-- TauCeti.Polylog.WeightThree.configuration_borel_class: not stated;
-- needs measurable configuration cohomology and its continuous comparison.
-- TauCeti.Polylog.WeightThree.rational_regulator_calibration: not stated;
-- needs R.7's original-class/Tate-coordinate adapter, π² times a nonzero rational.
-- TauCeti.Polylog.WeightThree.regulator_image_containment: not stated;
-- needs actual K₅ and the R.4 regulator, and the cycle-lifting construction.
-- TauCeti.Polylog.WeightThree.every_family_special_value: not stated; requires
-- the actual L₃ regulator on parent cycles and the lifting/calibration suppliers.
-- For arbitrary regAt the removed determinant statement was false. The intended
-- equality is det=q sqrt|D_F| π^(−3r₂) ζ_F(3), allowing q=0, with native infinite
-- places and native NumberField.discr/dedekindZeta as specified in the packet.
end TauCeti.Polylog.WeightThree
