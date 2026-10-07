/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/Polylogarithms--P.3.md` is definitive. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.
They claim no implementation. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Supplier namespace declarations below are local signature mirrors of the cited
owner nodes, not new roadmap definitions. B₂/B₃ and Γ are instantiated by their
actual rational relation quotients and differentials; the analytic function has
its fixed principal-branch formula. Unavailable supplier constructions retain
explicit type signatures and source contracts, never arbitrary-module aliases
or proposition fields containing the results to be proved. These prototypes do
not settle the recorded mathematical gaps. Every proof remains unchecked.
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
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Colimit.DirectLimit
import Mathlib.RingTheory.Valuation.Discrete.Basic
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.IntegralClosure.IntegralRestrict
import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.MeasureTheory.Constructions.BorelSpace.Basic
import Mathlib.Topology.Algebra.Group.Units
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.ConcreteCategory
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Algebra.Homology.Embedding.Basic
import Mathlib.RingTheory.Polynomial.Quotient
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

/- These rational presentations instantiate the existing owner contracts:
K3BlochGroups:V.3/pre-bloch-group; Polylogarithms:P.3/trilogarithm-group
and /polylogarithmic-complex; K2SymbolsBrauer:T.2 rational units. -/
namespace Supplier
variable (F : Type) [Field F]
abbrev UnitsQ := ℚ ⊗[ℤ] Additive Fˣ
variable {F}
def unitClass (x : F) : UnitsQ F := by
  classical
  exact if h : x = 0 then 0 else TensorProduct.tmul ℤ 1 (Additive.ofMul (Units.mk0 x h))
def fiveTerm (x y : F) : F →₀ ℚ :=
  bracket x - bracket y + bracket (y/x) -
    bracket ((1-x⁻¹)/(1-y⁻¹)) + bracket ((1-x)/(1-y))
def R2 : Submodule ℚ (F →₀ ℚ) :=
  Submodule.span ℚ ({bracket (0 : F), bracket 1} ∪
    {v | ∃ x y : F, x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧ x ≠ y ∧ v = fiveTerm x y})
def R3 : Submodule ℚ (F →₀ ℚ) :=
  Submodule.span ℚ ({bracket (0 : F)} ∪
    {v | ∃ x : F, x ≠ 0 ∧ v = bracket x - bracket x⁻¹} ∪
    {v | ∃ x : F, x ≠ 0 ∧ v = bracket x + bracket (1-x) + bracket (1-x⁻¹) - bracket 1} ∪
    {v | ∃ a b c : F, admissible a b c ∧ v = relation22 a b c})
abbrev B2 (F : Type) [Field F] := (F →₀ ℚ) ⧸ R2 (F := F)
abbrev B3 (F : Type) [Field F] := (F →₀ ℚ) ⧸ R3 (F := F)
def symbol2 (x : F) : B2 F := (R2 (F := F)).mkQ (bracket x)
def symbol3 (x : F) : B3 F := (R3 (F := F)).mkQ (bracket x)
def delta3 : B3 F →ₗ[ℚ] B2 F ⊗[ℚ] UnitsQ F :=
  (R3 (F := F)).liftQ
    (Finsupp.linearCombination ℚ (fun x => symbol2 x ⊗ₜ[ℚ] unitClass x)) (by sorry)
/-- The second differential is the linear extension of the specified symbol law. -/
private def wedgeLast (a b : UnitsQ F) : UnitsQ F →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ F) where
  toFun y := exteriorPower.ιMulti ℚ 3 ![a,b,y]
  map_add' := by sorry
  map_smul' := by sorry
def d2 : B2 F ⊗[ℚ] UnitsQ F →ₗ[ℚ] ⋀[ℚ]^3 (UnitsQ F) :=
  TensorProduct.lift ((R2 (F := F)).liftQ
    (Finsupp.linearCombination ℚ (fun x => wedgeLast (unitClass (1-x)) (unitClass x)))
    (by sorry))
theorem d2_symbol (x : F) (y : UnitsQ F) :
    d2 (symbol2 x ⊗ₜ[ℚ] y) =
      exteriorPower.ιMulti ℚ 3 ![unitClass (1-x), unitClass x, y] := by sorry

private def additiveUnitMap {E : Type} [Field E] (f : F →+* E) :
    Additive Fˣ →ₗ[ℤ] Additive Eˣ where
  toFun x := Additive.ofMul (Units.map f.toMonoidHom x.toMul)
  map_add' := by sorry
  map_smul' := by sorry
def unitMap {E : Type} [Field E] (f : F →+* E) : UnitsQ F →ₗ[ℚ] UnitsQ E where
  toFun := TensorProduct.map (LinearMap.id : ℚ →ₗ[ℤ] ℚ) (additiveUnitMap f)
  map_add' := by sorry
  map_smul' := by sorry
theorem unitMap_unit {E : Type} [Field E] (f : F →+* E) (x : F) :
    unitMap f (unitClass x) = unitClass (f x) := by sorry
def b2Map {E : Type} [Field E] (f : F →+* E) : B2 F →ₗ[ℚ] B2 E :=
  (R2 (F := F)).liftQ ((R2 (F := E)).mkQ.comp (Finsupp.lmapDomain ℚ ℚ f)) (by sorry)
def b3Map {E : Type} [Field E] (f : F →+* E) : B3 F →ₗ[ℚ] B3 E :=
  (R3 (F := F)).liftQ ((R3 (F := E)).mkQ.comp (Finsupp.lmapDomain ℚ ℚ f)) (by sorry)

open CategoryTheory in
def gammaX (F : Type) [Field F] : ℕ → ModuleCat ℚ
  | 1 => ModuleCat.of ℚ (B3 F)
  | 2 => ModuleCat.of ℚ (B2 F ⊗[ℚ] UnitsQ F)
  | 3 => ModuleCat.of ℚ (⋀[ℚ]^3 (UnitsQ F))
  | _ => ModuleCat.of ℚ (Fin 0 → ℚ)
open CategoryTheory in
def gammaD (F : Type) [Field F] : ∀ n, gammaX F n ⟶ gammaX F (n+1)
  | 0 => 0
  | 1 => ModuleCat.ofHom delta3
  | 2 => ModuleCat.ofHom d2
  | _+3 => 0
/-- This is the parent's Γ(F,3), supported in cochain degrees 1,2,3. -/
def Gamma (F : Type) [Field F] : CochainComplex (ModuleCat ℚ) ℕ :=
  CochainComplex.of (gammaX F) (gammaD F) (by sorry)
def gammaMap {E : Type} [Field E] (f : F →+* E) : Gamma F ⟶ Gamma E := by sorry
abbrev Cycles1 (F : Type) [Field F] := LinearMap.ker (delta3 (F := F))
def h1Iso (F : Type) [Field F] : Cycles1 F ≃ₗ[ℚ] (Gamma F).homology 1 := by sorry
end Supplier

open Supplier in
theorem relation22_quotient {F : Type} [Field F] (a b c : F) (h : admissible a b c) :
    (R3 (F := F)).mkQ (relation22 a b c) = 0 := by sorry
open Supplier in
theorem relation_cobracket {F : Type} [Field F] (a b c : F) (h : admissible a b c) :
    Finsupp.linearCombination ℚ (fun x => symbol2 x ⊗ₜ[ℚ] unitClass x)
      (relation22 a b c) = 0 := by sorry

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

def genericMap {E : Type} [Field E] (f : F →+* E) {q m : ℕ}
    (l : GenericTuple F q m) : GenericTuple E q m :=
  ⟨fun i j => f (l.val i j), by sorry⟩
def configFieldMap {E : Type} [Field E] (f : F →+* E) (q m : ℕ) :
    Config F q m →ₗ[ℚ] Config E q m :=
  configLift F (fun l => configMk E (genericMap F f l)) (by sorry)
theorem configFieldMap_mk {E : Type} [Field E] (f : F →+* E) {q m : ℕ}
    (l : GenericTuple F q m) :
    configFieldMap F f q m (configMk F l) = configMk E (genericMap F f l) := by sorry

abbrev Row (m : ℕ) := {q : ℕ // 3 ≤ q ∧ q < m}
abbrev bigrassmannian (m : ℕ) := ⨁ q : Row m, Config F q.val m

/-- Deletion and projection sums; signs refer to zero-based indices. -/
private def deleteD (q m : ℕ) : Config F q (m+1) →ₗ[ℚ] Config F q m :=
  ∑ i : Fin (m+1), ((-1 : ℚ)^i.val) • configDelete F i
private def projectD (q m : ℕ) : Config F (q+1) (m+1) →ₗ[ℚ] Config F q m :=
  ∑ i : Fin (m+1), ((-1 : ℚ)^i.val) • configProject F i
/-- Outgoing components outside the quotient's allowed rows are zero. -/
private def rowInclude (q m : ℕ) : Config F q m →ₗ[ℚ] bigrassmannian F m := by
  classical
  exact if h : 3 ≤ q ∧ q < m then
    DirectSum.lof ℚ (Row m) (fun r => Config F r.val m) ⟨q,h⟩ else 0
private def projectRow (m : ℕ) : ∀ q, Config F q (m+1) →ₗ[ℚ] bigrassmannian F m
  | 0 => 0
  | q+1 => (rowInclude F q m).comp (projectD F q m)
def bigrassmannianD (m : ℕ) : bigrassmannian F (m+1) →ₗ[ℚ] bigrassmannian F m :=
  DirectSum.toModule ℚ (Row (m+1)) (bigrassmannian F m)
    (fun q => (rowInclude F q.val m).comp (deleteD F q.val m) + projectRow F m q.val)
theorem bigrassmannianD_component (m : ℕ) (q : Row (m+1)) (x : Config F q.val (m+1)) :
    bigrassmannianD F m (DirectSum.lof ℚ (Row (m+1))
      (fun r => Config F r.val (m+1)) q x) =
    rowInclude F q.val m (deleteD F q.val m x) + projectRow F m q.val x := by sorry
theorem bigrassmannianD_sq (m : ℕ) :
    (bigrassmannianD F m).comp (bigrassmannianD F (m+1)) = 0 := by sorry
def bigrassmannian_corner : bigrassmannian F 4 ≃ₗ[ℚ] Config F 3 4 := by sorry
def bigrassmannian_map {E : Type} [Field E] (f : F →+* E) (m : ℕ) :
    bigrassmannian F m →ₗ[ℚ] bigrassmannian E m :=
  DirectSum.toModule ℚ (Row m) (bigrassmannian E m)
    (fun q => (DirectSum.lof ℚ (Row m) (fun r => Config E r.val m) q).comp
      (configFieldMap F f q.val m))
theorem bigrassmannian_map_D {E : Type} [Field E] (f : F →+* E) (m : ℕ) :
    (bigrassmannian_map F f m).comp (bigrassmannianD F m) =
      (bigrassmannianD E m).comp (bigrassmannian_map F f (m+1)) := by sorry
theorem bigrassmannian_map_id (m : ℕ) :
    bigrassmannian_map F (RingHom.id F) m = LinearMap.id := by sorry
theorem bigrassmannian_map_comp {E L : Type} [Field E] [Field L]
    (f : F →+* E) (g : E →+* L) (m : ℕ) :
    bigrassmannian_map F (g.comp f) m =
      (bigrassmannian_map E g m).comp (bigrassmannian_map F f m) := by sorry

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

/-- Project the four remaining vectors into F³/F·l₀, using the basis
(l₀,l₁,l₂). The two minors are quotient-plane homogeneous coordinates. -/
private def projectedFour (l : GenericTuple F 3 5) :
    Fin 4 → Projectivization F (Fin 2 → F) :=
  fun j => Projectivization.mk F
    ![minor l.val 0 1 j.succ, minor l.val 0 2 j.succ] (by sorry)
/-- V.4's ordered homogeneous-coordinate formula, not the §7 inverse convention. -/
private def blochCrossRatio (p : Fin 4 → Projectivization F (Fin 2 → F)) : F :=
  let b := fun i j => (p i).rep 0 * (p j).rep 1 - (p i).rep 1 * (p j).rep 0
  b 3 0 * b 2 1 / (b 3 1 * b 2 0)
theorem projectedRatio_blochCrossRatio (l : GenericTuple F 3 5) :
    projectedRatio l = (blochCrossRatio (projectedFour l))⁻¹ := by sorry

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
abbrev UnitsQ (F : Type) [Field F] := Supplier.UnitsQ F
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
theorem configExterior_fieldMap {E : Type} [Field E] (f : F →+* E) :
    (exteriorPower.map 3 (Supplier.unitMap f)).comp (configExterior (1 : Fˣ)) =
      (configExterior (1 : Eˣ)).comp (configFieldMap F f 3 4) := by sorry

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

private def middleFormula (vol : Fˣ) (l : GenericTuple F 3 5) : Supplier.B2 F ⊗[ℚ] UnitsQ F :=
  alternate (fun v => Supplier.symbol2 (projectedRatio v) ⊗ₜ[ℚ]
    unitClass ((vol : F)*minor v.val 2 3 4)) l

def configMiddle (vol : Fˣ) : Config F 3 5 →ₗ[ℚ] Supplier.B2 F ⊗[ℚ] UnitsQ F :=
  configLift F (middleFormula vol) (by sorry)
theorem configMiddle_mk (vol : Fˣ) (l : GenericTuple F 3 5) :
    configMiddle vol (configMk F l) = middleFormula vol l := by sorry
theorem configMiddle_volume (vol w : Fˣ) : configMiddle vol = configMiddle w := by sorry
theorem configMiddle_alt (vol : Fˣ) (l : GenericTuple F 3 5) (σ : Equiv.Perm (Fin 5)) :
    configMiddle vol (configMk F (permute l σ)) = signQ σ • configMiddle vol (configMk F l) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configMiddle_moment`. -/
example : Supplier.d2 (configMiddle (1 : ℚˣ) (configMk ℚ moment5)) =
    (36 : ℚ) • wedge (unitClass (2 : ℚ)) (unitClass (3 : ℚ)) (unitClass (5 : ℚ)) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configMiddle_scaleVolume`. -/
example : configMiddle (Units.mk0 (2 : ℚ) (by norm_num)) (configMk ℚ moment5) =
    configMiddle (1 : ℚˣ) (configMk ℚ moment5) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configMiddle_notProjective`. -/
example : Supplier.d2 (configMiddle (1 : ℚˣ)
    (configMk ℚ (scaled (fun i => if i = 0 then Units.mk0 2 (by norm_num) else 1) moment5))) =
    (18 : ℚ) • wedge (unitClass (2 : ℚ)) (unitClass (3 : ℚ)) (unitClass (5 : ℚ)) := by sorry

theorem configMiddle_fieldMap {E : Type} [Field E] (f : F →+* E) :
    (TensorProduct.map (Supplier.b2Map f) (Supplier.unitMap f)).comp
      (configMiddle (1 : Fˣ)) =
    (configMiddle (1 : Eˣ)).comp (configFieldMap F f 3 5) := by sorry

def configTrilog : Config F 3 6 →ₗ[ℚ] Supplier.B3 F :=
  configLift F (fun l => (-1/5 : ℚ) • alternate (fun v => Supplier.symbol3 (tripleRatio v)) l) (by sorry)

theorem configTrilog_mk (l : GenericTuple F 3 6) :
    configTrilog (configMk F l) =
      (-1/5 : ℚ) • alternate (fun v => Supplier.symbol3 (tripleRatio v)) l := by sorry

theorem configTrilog_alt (l : GenericTuple F 3 6) (σ : Equiv.Perm (Fin 6)) :
    configTrilog (configMk F (permute l σ)) =
      signQ σ • configTrilog (configMk F l) := by sorry
theorem configTrilog_fieldMap {E : Type} [Field E] (f : F →+* E) :
    (Supplier.b3Map f).comp (configTrilog (F := F)) =
      (configTrilog (F := E)).comp (configFieldMap F f 3 6) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configTrilog_normalization`. -/
example (l : GenericTuple F 3 6) :
    (5 : ℚ) • configTrilog (configMk F l) =
      -alternate (fun v => Supplier.symbol3 (tripleRatio v)) l := by sorry

theorem seven_term_configuration_relation :
    configTrilog.comp (deleteD F 3 6) = 0 := by sorry
/-- Every component equality is stated on its actual source and target. -/
theorem configuration_chain_comparison :
    Supplier.d2.comp (configMiddle (1 : Fˣ)) =
      (configExterior (1 : Fˣ)).comp (deleteD F 3 4) ∧
    Supplier.delta3.comp configTrilog =
      (configMiddle (1 : Fˣ)).comp (deleteD F 3 5) ∧
    (configExterior (1 : Fˣ)).comp (projectD F 3 4) = 0 ∧
    (configMiddle (1 : Fˣ)).comp (projectD F 3 5) = 0 ∧
    configTrilog.comp (projectD F 3 6) = 0 := by sorry

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


/- Formula mirrors of Polylogarithms:P.1/classical-polylogarithm,
/single-valued-polylogarithm and /single-valued-continuity. Only positive
weights 1..3 are needed here; the fixed cut convention is Mathlib's log. -/
namespace Supplier
def liPositive : ℕ → ℂ → ℂ
  | 0, z => z/(1-z)
  | n+1, z => if n = 0 then -Complex.log (1-z) else
      ∫ t : ℝ in (0 : ℝ)..1, liPositive n ((t : ℂ)*z) / (t : ℂ)
def L3 (z : ℂ) : ℝ :=
  if z = 0 then 0 else if z = 1 then (riemannZeta 3).re else
    (liPositive 3 z - (Real.log ‖z‖ : ℂ)*liPositive 2 z +
      (1/3 : ℂ)*(Real.log ‖z‖ : ℂ)^2*liPositive 1 z).re
end Supplier

theorem trilogarithm_functional_relations :
    (∀ a b c : ℂ, admissible a b c →
      Finsupp.linearCombination ℚ Supplier.L3 (relation22 a b c) = 0) ∧
    (∀ x : ℂ, x ≠ 0 → Supplier.L3 x = Supplier.L3 x⁻¹) ∧
    (∀ x : ℂ, x ≠ 0 →
      Supplier.L3 x + Supplier.L3 (1-x) + Supplier.L3 (1-x⁻¹) = Supplier.L3 1) := by sorry

def trilogDescent : Supplier.B3 ℂ →ₗ[ℚ] ℝ :=
  (Supplier.R3 (F := ℂ)).liftQ (Finsupp.linearCombination ℚ Supplier.L3) (by sorry)
theorem trilogDescent_mk (z : ℂ) : trilogDescent (Supplier.symbol3 z) = Supplier.L3 z := by sorry
theorem trilogDescent_sum (v : ℂ →₀ ℚ) :
    trilogDescent ((Supplier.R3 (F := ℂ)).mkQ v) =
      Finsupp.linearCombination ℚ Supplier.L3 v := by sorry
theorem trilogDescent_conj (z : Supplier.B3 ℂ) :
    trilogDescent (Supplier.b3Map (starRingEnd ℂ) z) = trilogDescent z := by sorry
def trilogRegulatorAt {F : Type} [Field F] (σ : F →+* ℂ) :
    Supplier.Cycles1 F →ₗ[ℚ] ℝ :=
  trilogDescent.comp ((Supplier.b3Map σ).comp (Supplier.delta3 (F := F)).ker.subtype)
theorem trilogRegulatorAt_conj {F : Type} [Field F] (σ : F →+* ℂ) :
    trilogRegulatorAt ((starRingEnd ℂ).comp σ) = trilogRegulatorAt σ := by sorry
/-- Test `TauCeti.Polylog.WeightThree.trilogDescent_zero`. -/
example : trilogDescent (Supplier.symbol3 (0 : ℂ)) = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.trilogDescent_one`. -/
example : trilogDescent (Supplier.symbol3 (1 : ℂ)) = (riemannZeta 3).re ∧
    0 < trilogDescent (Supplier.symbol3 (1 : ℂ)) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.trilogDescent_minusOne`. -/
example : trilogDescent (Supplier.symbol3 (-1 : ℂ)) = (-3/4 : ℝ)*(riemannZeta 3).re := by sorry

section GeometricPresentation
variable (F : Type) [Field F] [Infinite F]
private abbrev SixPoints := Fin 6 → Projectivization F (Fin 3 → F)
private def projectiveGL (g : Matrix.GeneralLinearGroup (Fin 3) F)
    (x : Projectivization F (Fin 3 → F)) : Projectivization F (Fin 3 → F) :=
  Projectivization.mk F (g.val.mulVec x.rep) (by sorry)
private def pointMinor (a b c : Projectivization F (Fin 3 → F)) : F :=
  Matrix.det (![a.rep,b.rep,c.rep] : Matrix (Fin 3) (Fin 3) F)
private def projectedPointRatio (p : Projectivization F (Fin 3 → F))
    (l : Fin 4 → Projectivization F (Fin 3 → F)) : F :=
  pointMinor F p (l 0) (l 2) * pointMinor F p (l 1) (l 3) /
    (pointMinor F p (l 0) (l 3) * pointMinor F p (l 1) (l 2))
/-- All six vectors are nonzero for every z; at 1 only the b triangle is collinear. -/
private def triangleTuple (z : F) : SixPoints F :=
  fun i => Projectivization.mk F
    ((![![1,0,0], ![0,1,0], ![0,0,1], ![1,1,0], ![0,1,1], ![-z,0,1]] :
      Fin 6 → Fin 3 → F) i) (by sorry)
private def triangleRaw (z : F) : SixPoints F →₀ ℚ := Finsupp.single (triangleTuple F z) 1
private def triangle1Raw (z : F) : SixPoints F →₀ ℚ :=
  -triangleRaw F z - (2 : ℚ) • triangleRaw F (1-z) + triangleRaw F 1
private def fourCollinear (l : SixPoints F) : Prop :=
  ∃ W : Submodule F (Fin 3 → F), Module.finrank F W = 2 ∧
    ∃ e : Fin 4 → Fin 6, Function.Injective e ∧ ∀ i, (l (e i)).rep ∈ W
private def typeB (y : SixPoints F) : Prop :=
  Function.Injective y ∧
  (y 2).rep ∈ Submodule.span F {(y 0).rep, (y 1).rep} ∧
  (y 2).rep ∈ Submodule.span F {(y 3).rep, (y 4).rep} ∧
  (∀ i j : Fin 5, i ≠ j → pointMinor F (y 5) (y i.castSucc) (y j.castSucc) ≠ 0)
private def intersectionRaw (y : SixPoints F) : SixPoints F →₀ ℚ :=
  (3 : ℚ) • Finsupp.single y 1 -
    ∑ i : Fin 5, ((-1 : ℚ)^i.val) • triangle1Raw F
      (projectedPointRatio F (y 5) (fun j => y (i.succAbove j).castSucc))
/-- Actual generating families, with the source's intersection admissibility. -/
private def geometricRelations : Submodule ℚ (SixPoints F →₀ ℚ) :=
  Submodule.span ℚ (
    {v | ∃ (g : Matrix.GeneralLinearGroup (Fin 3) F) (l : SixPoints F),
      v = Finsupp.single (fun i => projectiveGL F g (l i)) 1 - Finsupp.single l 1} ∪
    {v | ∃ l : SixPoints F, (¬ Function.Injective l ∨ fourCollinear F l) ∧
      v = Finsupp.single l 1} ∪
    {v | ∃ l : Fin 7 → Projectivization F (Fin 3 → F),
      v = ∑ i : Fin 7, ((-1 : ℚ)^i.val) • Finsupp.single (fun j => l (i.succAbove j)) 1} ∪
    {v | ∃ y : SixPoints F, typeB F y ∧ v = intersectionRaw F y})

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
def geometricTriangle (z : F) : GeometricTrilog F := geometricMk F (triangleTuple F z)
private def projectivize {m : ℕ} (l : GenericTuple F 3 m) :
    Fin m → Projectivization F (Fin 3 → F) :=
  fun i => Projectivization.mk F (l.val i) (by sorry)
/-- The intended canonical intersection evaluation, with choice-independence proof open. -/
def geometricComparison : GeometricTrilog F ≃ₗ[ℚ] Supplier.B3 F := by sorry
private def geometricAlt (l : GenericTuple F 3 6) : Supplier.B3 F :=
  ∑ σ : Equiv.Perm (Fin 6), signQ σ •
    geometricComparison F (geometricMk F (projectivize F (permute l σ)))
theorem geometric_trilogarithm_comparison :
    (∀ z : F, geometricComparison F (geometricTriangle F z) = Supplier.symbol3 z) ∧
    (∀ l : GenericTuple F 3 6,
      geometricAlt F l = (3/2 : ℚ) • alternate (fun v => Supplier.symbol3 (tripleRatio v)) l) ∧
    (∀ l : GenericTuple F 3 6,
      configTrilog (configMk F l) = (-2/15 : ℚ) • geometricAlt F l) := by sorry

/-- Test `TauCeti.Polylog.WeightThree.geometric_repeat`. -/
example (l : SixPoints F) (h : l 0 = l 1) : geometricMk F l = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.geometric_fourCollinear`. -/
example (l : SixPoints F) (W : Submodule F (Fin 3 → F))
    (hW : Module.finrank F W = 2)
    (h : ∀ i : Fin 4, (l (i.castSucc.castSucc)).rep ∈ W) :
    geometricMk F l = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.geometric_triangle_nonzero`. -/
example : geometricComparison ℂ (geometricTriangle ℂ 1) = Supplier.symbol3 (1 : ℂ) ∧
    trilogDescent (geometricComparison ℂ (geometricTriangle ℂ 1)) = (riemannZeta 3).re ∧
    geometricTriangle ℂ 1 ≠ 0 := by sorry

/-- Native vector-configuration duality, not a second Grassmannian definition. -/
def configurationDual (q m : ℕ) (hq : 0 < q) (hqm : q < m) :
    Config F q m ≃ₗ[ℚ] Config F (m-q) m := by sorry

private def configCast {q r m : ℕ} (h : q = r) : Config F q m ≃ₗ[ℚ] Config F r m :=
  h ▸ LinearEquiv.refl ℚ (Config F q m)
theorem configurationDual_sq (q m : ℕ) (hq : 0 < q) (hqm : q < m) (x : Config F q m) :
    configCast F (by omega : m-(m-q) = q)
      (configurationDual F (m-q) m (by omega) (by omega)
        (configurationDual F q m hq hqm x)) = x := by sorry
private def blockTuple (q r : ℕ) (B : Matrix (Fin q) (Fin r) F) : Fin (q+r) → Fin q → F :=
  Fin.addCases (fun i j => if i = j then 1 else 0) (fun i j => B j i)
private def dualBlockTuple (q r : ℕ) (B : Matrix (Fin q) (Fin r) F) : Fin (q+r) → Fin r → F :=
  Fin.addCases (fun i j => -B i j) (fun i j => if i = j then 1 else 0)
theorem configurationDual_matrix (q r : ℕ) (hq : 0 < q) (hr : 0 < r)
    (B : Matrix (Fin q) (Fin r) F)
    (hB : IsGeneric F (blockTuple F q r B)) (hD : IsGeneric F (dualBlockTuple F q r B)) :
    configCast F (by omega : q+r-q = r)
      (configurationDual F q (q+r) hq (by omega) (configMk F ⟨blockTuple F q r B,hB⟩)) =
    configMk F ⟨dualBlockTuple F q r B,hD⟩ := by sorry
/-- Transport dimensions first, then exchange deletion and projection. -/
theorem configurationDual_faces (q m : ℕ) (hq : 0 < q) (hqm : q < m)
    (i : Fin (m+1)) (x : Config F q (m+1)) :
    configurationDual F q m hq hqm (configDelete F i x) =
    configProject F i
      (configCast F (by omega : m+1-q = (m-q)+1)
        (configurationDual F q (m+1) hq (by omega) x)) := by sorry

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

private def noFourCollinear (l : SixPoints F) : Prop := ¬ fourCollinear F l
/-- Annihilator duality on projective configurations, including the no-four-collinear locus. -/
def projectiveDual (l : SixPoints F) (h : noFourCollinear F l) : SixPoints F := by sorry
theorem trilogarithm_duality (l : SixPoints F) (h : noFourCollinear F l) :
    geometricMk F (projectiveDual F l h) = -geometricMk F l := by sorry
end GeometricPresentation

namespace Supplier
open CategoryTheory
variable (F : Type) [Field F]
/-- Formula mirror of U.1/stabilisation-map, g ↦ diag(g,I). -/
private def stabilizeMatrix {m n : ℕ} (M : Matrix (Fin m) (Fin m) F) : Matrix (Fin n) (Fin n) F :=
  fun a b => if h : a.val < m ∧ b.val < m then M ⟨a,h.1⟩ ⟨b,h.2⟩ else if a = b then 1 else 0
private def stabilizeMatrixHom {m n : ℕ} (h : m ≤ n) :
    Matrix (Fin m) (Fin m) F →* Matrix (Fin n) (Fin n) F where
  toFun := stabilizeMatrix F
  map_one' := by sorry
  map_mul' := by sorry
def stabilize {m n : ℕ} (h : m ≤ n) :
    Matrix.GeneralLinearGroup (Fin m) F →* Matrix.GeneralLinearGroup (Fin n) F :=
  Units.map (stabilizeMatrixHom F h)
instance stableSystem : DirectedSystem (fun n : ℕ => Matrix.GeneralLinearGroup (Fin n) F)
    (fun _ _ h => ⇑(stabilize F h)) := by sorry
/-- The native colimit, owned by KTheoryLowDegrees:U.1/stable-general-linear-group. -/
abbrev StableGL := DirectLimit (fun n : ℕ => Matrix.GeneralLinearGroup (Fin n) F)
  (fun _ _ h => stabilize F h)
def stableInclusion (n : ℕ) : Matrix.GeneralLinearGroup (Fin n) F →* StableGL F where
  toFun g := ⟦⟨n,g⟩⟧
  map_one' := by sorry
  map_mul' := by sorry
variable {F}
def glFieldMap {E : Type} [Field E] (f : F →+* E) (n : ℕ) :
    Matrix.GeneralLinearGroup (Fin n) F →* Matrix.GeneralLinearGroup (Fin n) E :=
  Matrix.GeneralLinearGroup.map f
private def trivialCoefficientMap {G H : Type} [Group G] [Group H] (f : G →* H) :
    Rep.trivial ℚ G ℚ ⟶ Rep.res f (Rep.trivial ℚ H ℚ) :=
  Rep.ofHom ⟨LinearMap.id, by sorry⟩
def groupMap {G H : Type} [Group G] [Group H] (f : G →* H) (k : ℕ) :
    groupHomology (Rep.trivial ℚ G ℚ) k →ₗ[ℚ] groupHomology (Rep.trivial ℚ H ℚ) k :=
  (groupHomology.map f (trivialCoefficientMap f) k).hom
abbrev HGL (F : Type) [Field F] (n k : ℕ) :=
  groupHomology (Rep.trivial ℚ (Matrix.GeneralLinearGroup (Fin n) F) ℚ) k
abbrev HStable (F : Type) [Field F] (k : ℕ) :=
  groupHomology (Rep.trivial ℚ (StableGL F) ℚ) k
/-- These are the rational Quillen groups of K.2:plus, NOT another definition of K-theory.
The requested supplier constructs π_k(BGL(F)^+)⊗Q and its primitive Hurewicz map. -/
def KQ (F : Type) [Field F] (k : ℕ) : ModuleCat ℚ := by sorry
def primitiveHurewicz (F : Type) [Field F] (k : ℕ) : KQ F k →ₗ[ℚ] HStable F k := by sorry
def rankK (F : Type) [Field F] (n k : ℕ) : Submodule ℚ (KQ F k) :=
  (LinearMap.range (groupMap (stableInclusion F n) k)).comap (primitiveHurewicz F k)
end Supplier

section Homology
open CategoryTheory Supplier
variable (F : Type) [Field F] [Infinite F]
private def configurationComplex : ChainComplex (ModuleCat ℚ) ℕ :=
  ChainComplex.of (fun p => ModuleCat.of ℚ (bigrassmannian F (p+1)))
    (fun p => ModuleCat.ofHom (bigrassmannianD F (p+1))) (by sorry)
private def reversedGammaX : ℕ → ModuleCat ℚ
  | 3 => ModuleCat.of ℚ (⋀[ℚ]^3 (UnitsQ F))
  | 4 => ModuleCat.of ℚ (B2 F ⊗[ℚ] UnitsQ F)
  | 5 => ModuleCat.of ℚ (B3 F)
  | _ => ModuleCat.of ℚ (Fin 0 → ℚ)
private def reversedGammaD : ∀ p, reversedGammaX F (p+1) ⟶ reversedGammaX F p
  | 0 => 0
  | 1 => 0
  | 2 => 0
  | 3 => ModuleCat.ofHom d2
  | 4 => ModuleCat.ofHom delta3
  | _+5 => 0
private def reversedGamma : ChainComplex (ModuleCat ℚ) ℕ :=
  ChainComplex.of (reversedGammaX F) (reversedGammaD F) (by sorry)
private def comparisonComponent : ∀ p, (configurationComplex F).X p ⟶ (reversedGamma F).X p
  | 0 => 0
  | 1 => 0
  | 2 => 0
  | 3 => ModuleCat.ofHom ((configExterior (1 : Fˣ)).comp
      (DirectSum.component ℚ (Row 4) (fun q => Config F q.val 4) ⟨3,by omega⟩))
  | 4 => ModuleCat.ofHom ((configMiddle (1 : Fˣ)).comp
      (DirectSum.component ℚ (Row 5) (fun q => Config F q.val 5) ⟨3,by omega⟩))
  | 5 => ModuleCat.ofHom ((configTrilog (F := F)).comp
      (DirectSum.component ℚ (Row 6) (fun q => Config F q.val 6) ⟨3,by omega⟩))
  | _+6 => 0
private def configurationChainMap : configurationComplex F ⟶ reversedGamma F :=
  ChainComplex.ofHom (comparisonComponent F) (by sorry)
private def reverseHomology (i : ℕ) (hi : 1 ≤ i ∧ i ≤ 3) :
    (reversedGamma F).homology (6-i) ≃ₗ[ℚ] (Gamma F).homology i := by sorry
/-- Signature extension requested from V.4/hyperhomology-map: the edge of the
symmetrized generic-vector resolution, projecting along its first n−3 vectors
as in G95 §2.6 and §6. No arbitrary complex is supplied as an argument. -/
private def symmetrizedEdge (n k : ℕ) (hn : 3 ≤ n) :
    HGL F n k →ₗ[ℚ] (configurationComplex F).homology k := by sorry

def configurationComparison (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    HGL F n (6-i) →ₗ[ℚ] (Gamma F).homology i :=
  (reverseHomology F i hi).toLinearMap.comp
    (((HomologicalComplex.homologyMap (configurationChainMap F) (6-i)).hom).comp
      (symmetrizedEdge F n (6-i) hn))
theorem configurationComparison_stabilize (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    (configurationComparison F (n+1) i (by omega) hi).comp
      (groupMap (stabilize F (Nat.le_succ n)) (6-i)) =
    configurationComparison F n i hn hi := by sorry
theorem configurationComparison_rank3 (i : ℕ) (hi : 1 ≤ i ∧ i ≤ 3) :
    configurationComparison F 3 i (by omega) hi =
    (reverseHomology F i hi).toLinearMap.comp
      (((HomologicalComplex.homologyMap (configurationChainMap F) (6-i)).hom).comp
        (symmetrizedEdge F 3 (6-i) (by omega))) := by sorry
theorem configurationComparison_fieldMap {E : Type} [Field E] [Infinite E]
    (f : F →+* E) (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    ((HomologicalComplex.homologyMap (gammaMap f) i).hom).comp
      (configurationComparison F n i hn hi) =
    (configurationComparison E n i hn hi).comp (groupMap (glFieldMap f n) (6-i)) := by sorry
/-- The compatible stable comparison; its restrictions are part of the supplier colimit contract. -/
def stableConfigurationComparison (i : ℕ) (hi : 1 ≤ i ∧ i ≤ 3) :
    HStable F (6-i) →ₗ[ℚ] (Gamma F).homology i := by sorry
theorem stableConfigurationComparison_restrict (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    (stableConfigurationComparison F i hi).comp (groupMap (stableInclusion F n) (6-i)) =
    configurationComparison F n i hn hi := by sorry
def configurationComparison_K (i : ℕ) (hi : 1 ≤ i ∧ i ≤ 3) :
    rankK F 3 (6-i) →ₗ[ℚ] (Gamma F).homology i :=
  (stableConfigurationComparison F i hi).comp
    ((primitiveHurewicz F (6-i)).comp (rankK F 3 (6-i)).subtype)
/-- Test `TauCeti.Polylog.WeightThree.configurationComparison_zero`. -/
example (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    configurationComparison F n i hn hi 0 = 0 := by sorry
/-- Test `TauCeti.Polylog.WeightThree.configurationComparison_degree2`. -/
example (n : ℕ) (hn : 3 ≤ n) : HGL F n 4 →ₗ[ℚ] (Gamma F).homology 2 :=
  configurationComparison F n 2 hn ⟨by omega,by omega⟩
/-- Test `TauCeti.Polylog.WeightThree.configurationComparison_stableFixture`.
An existence/value test on the genuine cycle carrier; the zero comparison fails. -/
example : ∃ c : groupHomology.cycles (Rep.trivial ℚ (Matrix.GeneralLinearGroup (Fin 3) ℂ) ℚ) 5,
    let h := groupHomology.π (Rep.trivial ℚ (Matrix.GeneralLinearGroup (Fin 3) ℂ) ℚ) 5 c
    ∃ z : Cycles1 ℂ, z.val = symbol3 (1 : ℂ) ∧
      configurationComparison ℂ 3 1 (by omega) ⟨by omega,by omega⟩ h = h1Iso ℂ z ∧
      configurationComparison ℂ 4 1 (by omega) ⟨by omega,by omega⟩
        (groupMap (stabilize ℂ (by omega : 3 ≤ 4)) 5 h) = h1Iso ℂ z ∧
      trilogRegulatorAt (RingHom.id ℂ) z = (riemannZeta 3).re := by sorry

private def rankTwoInThree (k : ℕ) : Submodule ℚ (rankK F 3 k) :=
  (rankK F 2 k).comap (rankK F 3 k).subtype
/-- Rank-two vanishing includes the actual quotient factorization; it makes
no assertion that all Quillen K-theory has rank at most three. -/
theorem rank_two_vanishing (n i : ℕ) (hn : 3 ≤ n) (hi : 1 ≤ i ∧ i ≤ 3) :
    (configurationComparison F n i hn hi).comp
      (groupMap (stabilize F (by omega : 2 ≤ n)) (6-i)) = 0 ∧
    ∃ c : (↥(rankK F 3 (6-i)) ⧸ rankTwoInThree F (6-i)) →ₗ[ℚ] (Gamma F).homology i,
      c.comp (rankTwoInThree F (6-i)).mkQ = configurationComparison_K F i hi := by sorry
theorem cycle_lifting [CharZero F] (z : Cycles1 F) :
    ∃ h : HStable F 5, stableConfigurationComparison F 1 ⟨by omega,by omega⟩ h = h1Iso F z := by sorry
end Homology

/- The following native rational presentation mirrors T.2/milnor-k-theory
and /milnor-alternating. It supplies a concrete carrier for their T.4 norm,
product and residue signatures, not additional P.3 nodes or a new norm. -/
namespace Supplier
variable (F : Type) [Field F]
def milnorSteinberg (n : ℕ) : Submodule ℚ (⋀[ℚ]^n (UnitsQ F)) :=
  Submodule.span ℚ {w | ∃ (x : F) (v : Fin n → UnitsQ F) (i j : Fin n),
    x ≠ 0 ∧ x ≠ 1 ∧ i ≠ j ∧ v i = unitClass (1-x) ∧ v j = unitClass x ∧
      w = exteriorPower.ιMulti ℚ n v}
abbrev MilnorQ (n : ℕ) := (⋀[ℚ]^n (UnitsQ F)) ⧸ milnorSteinberg F n
/-- The parent's H³–Milnor equivalence, normalized by exterior symbols. -/
def eta3 : (Gamma F).homology 3 ≃ₗ[ℚ] MilnorQ F 3 := by sorry
def milnorMap {E : Type} [Field E] (f : F →+* E) (n : ℕ) :
    MilnorQ F n →ₗ[ℚ] MilnorQ E n :=
  (milnorSteinberg F n).liftQ
    ((milnorSteinberg E n).mkQ.comp (exteriorPower.map n (unitMap f))) (by sorry)
def milnorMul (p q : ℕ) : MilnorQ F p →ₗ[ℚ] MilnorQ F q →ₗ[ℚ] MilnorQ F (p+q) := by sorry
/-- T.4's Bass–Tate/Kato norm, with its actual finite-field-extension arguments. -/
def milnorNorm (E : Type) [Field E] [Algebra F E] [FiniteDimensional F E] (n : ℕ) :
    MilnorQ E n →ₗ[ℚ] MilnorQ F n := by sorry
def milnorNormOf {E : Type} [Field E] (f : F →+* E) (n : ℕ)
    (hfin : letI := f.toAlgebra; FiniteDimensional F E) : MilnorQ E n →ₗ[ℚ] MilnorQ F n :=
  letI := f.toAlgebra
  letI := hfin
  milnorNorm F E n
/-- V.4's diagonal-symbol map restricted along the primitive Hurewicz map.
Its comparison scalar with the corrected configuration map is NOT supplied here. -/
def primitiveDiagonal : rankK F 3 3 →ₗ[ℚ] MilnorQ F 3 := by sorry

open scoped WithZero
abbrev ResidueField (v : Valuation F ℤᵐ⁰) := IsLocalRing.ResidueField v.valuationSubring
private def ord (v : Valuation F ℤᵐ⁰) (x : F) : ℤ := -WithZero.log (v x)
/-- Parent residue: degree 3 uses uniformizer-first; T.3 uses last.
The degree-three sign is (+1), so the following residue agrees with both. -/
def milnorResidue (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (n : ℕ) :
    MilnorQ F (n+1) →ₗ[ℚ] MilnorQ (ResidueField F v) n := by sorry
def residueFieldMap {E : Type} [Field E] [Algebra F E]
    (v : Valuation F ℤᵐ⁰) (w : Valuation E ℤᵐ⁰) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, ord E w (algebraMap F E r) = e * ord F v r) :
    ResidueField F v →+* ResidueField E w := by sorry
def residueDegree {E : Type} [Field E] [Algebra F E]
    (v : Valuation F ℤᵐ⁰) (w : Valuation E ℤᵐ⁰) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, ord E w (algebraMap F E r) = e * ord F v r) : ℕ :=
  letI := (residueFieldMap F v w e he hvw).toAlgebra
  Module.finrank (ResidueField F v) (ResidueField E w)
end Supplier

section Milnor
open Supplier
variable (F : Type) [Field F] [Infinite F]
private def steinbergSpan : Submodule ℚ (⋀[ℚ]^3 (UnitsQ F)) :=
  Submodule.span ℚ {v | ∃ x y : F, x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧
    v = wedge (unitClass (1-x)) (unitClass x) (unitClass y)}
theorem steinberg_boundary_image :
    LinearMap.range (d2 (F := F)) = steinbergSpan F ∧
    LinearMap.ker (milnorSteinberg F 3).mkQ = steinbergSpan F := by sorry

variable (E : Type) [Field E] [Infinite E] [Algebra F E] [FiniteDimensional F E]
def h3Transfer : (Gamma E).homology 3 →ₗ[ℚ] (Gamma F).homology 3 :=
  (eta3 F).symm.toLinearMap.comp ((milnorNorm F E 3).comp (eta3 E).toLinearMap)
theorem h3Transfer_eta :
    (eta3 F).toLinearMap.comp (h3Transfer F E) = (milnorNorm F E 3).comp (eta3 E).toLinearMap := by sorry
theorem h3Transfer_id : h3Transfer F F = LinearMap.id := by sorry
theorem h3Transfer_comp (L : Type) [Field L] [Infinite L]
    [Algebra E L] [Algebra F L] [IsScalarTower F E L]
    [FiniteDimensional E L] [FiniteDimensional F L] :
    (h3Transfer F E).comp (h3Transfer E L) = h3Transfer F L := by sorry
theorem h3Transfer_res :
    (h3Transfer F E).comp ((HomologicalComplex.homologyMap (gammaMap (algebraMap F E)) 3).hom) =
      (Module.finrank F E : ℚ) • LinearMap.id := by sorry
theorem h3Transfer_projection (a : MilnorQ F 1) (b : MilnorQ E 2) :
    eta3 F (h3Transfer F E ((eta3 E).symm
      (milnorMul E 1 2 (milnorMap F (algebraMap F E) 1 a) b))) =
      milnorMul F 1 2 a (milnorNorm F E 2 b) ∧
    (∀ (a' : MilnorQ F 2) (b' : MilnorQ E 1),
      eta3 F (h3Transfer F E ((eta3 E).symm
        (milnorMul E 2 1 (milnorMap F (algebraMap F E) 2 a') b'))) =
        milnorMul F 2 1 a' (milnorNorm F E 1 b')) := by sorry

open scoped WithZero in
/-- All normalized extensions above v, finite integral closure and residue degrees
are explicit. No extra ramification multiplier occurs in the conclusion. -/
theorem h3Transfer_residue (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v)
    (W : Finset (Valuation E ℤᵐ⁰)) (e : Valuation E ℤᵐ⁰ → ℕ)
    (he : ∀ w ∈ W, 0 < e w) (hsurj : ∀ w ∈ W, Function.Surjective w)
    (hvw : ∀ w ∈ W, ∀ r : F, ord E w (algebraMap F E r) = e w * ord F v r)
    (hall : ∀ (w : Valuation E ℤᵐ⁰) (e' : ℕ), Function.Surjective w → 0 < e' →
      (∀ r : F, ord E w (algebraMap F E r) = e' * ord F v r) → w ∈ W)
    (hfiniteClosure : letI := ((algebraMap F E).comp v.valuationSubring.subtype).toAlgebra;
      Module.Finite v.valuationSubring (integralClosure v.valuationSubring E))
    (hfin : ∑ w ∈ W.attach,
      e w.val * residueDegree F v w.val (e w.val) (he w.val w.prop) (hvw w.val w.prop) =
      Module.finrank F E)
    (hresfin : ∀ (w) (hw : w ∈ W), letI := (residueFieldMap F v w (e w) (he w hw) (hvw w hw)).toAlgebra;
      FiniteDimensional (ResidueField F v) (ResidueField E w))
    (x : (Gamma E).homology 3) :
    milnorResidue F v hv 2 (eta3 F (h3Transfer F E x)) =
      ∑ w ∈ W.attach,
        milnorNormOf (ResidueField F v)
          (residueFieldMap F v w.val (e w.val) (he w.val w.prop) (hvw w.val w.prop)) 2
          (hresfin w.val w.prop)
          (milnorResidue E w.val (hsurj w.val w.prop) 2 (eta3 E x)) := by sorry
/-- Test `TauCeti.Polylog.WeightThree.h3Transfer_identity`. -/
example (x : (Gamma F).homology 3) : h3Transfer F F x = x := by sorry
/-- Test `TauCeti.Polylog.WeightThree.h3Transfer_quadratic`. -/
example (hd : Module.finrank F E = 2) (x : (Gamma F).homology 3) :
    h3Transfer F E ((HomologicalComplex.homologyMap (gammaMap (algebraMap F E)) 3).hom x) = 2 • x := by sorry
/-- Test `TauCeti.Polylog.WeightThree.h3Transfer_notExteriorNorm`.
The exterior norm of restriction has coefficient d³; the genuine transfer has d. -/
example (d : ℚ) (v : ⋀[ℚ]^3 (UnitsQ F)) :
    exteriorPower.map 3 (d • (LinearMap.id : UnitsQ F →ₗ[ℚ] UnitsQ F)) v = d^3 • v := by sorry
/-- κ must be computed against V.4's diagonal normalization; no unscaled equality is assumed. -/
theorem suslin_top_comparison : ∃ κ : ℚ, κ ≠ 0 ∧
    (eta3 F).toLinearMap.comp (configurationComparison_K F 3 ⟨by omega,by omega⟩) =
      κ • primitiveDiagonal F := by sorry
end Milnor

/- R.7 signature mirrors. These use the concrete homogeneous continuous and
Borel-measurable bar complexes, not arbitrary vector spaces called cohomology.
The universal classes and comparison construction remain supplier obligations. -/
namespace Supplier
abbrev ComplexGL := Matrix.GeneralLinearGroup (Fin 3) ℂ
private abbrev ctsCochains (n : ℕ) : Submodule ℝ ((Fin (n+1) → ComplexGL) → ℝ) where
  carrier := {f | Continuous f ∧ ∀ g x, f (fun i => g*x i) = f x}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
private abbrev measCochains (n : ℕ) : Submodule ℝ ((Fin (n+1) → ComplexGL) → ℝ) where
  carrier := {f | @Measurable _ _ (borel _) (borel _) f ∧ ∀ g x, f (fun i => g*x i) = f x}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
private def barD (n : ℕ) (f : (Fin (n+1) → ComplexGL) → ℝ)
    (x : Fin (n+2) → ComplexGL) : ℝ :=
  ∑ i : Fin (n+2), (-1 : ℝ)^i.val * f (fun j => x (i.succAbove j))
private def ctsD (n : ℕ) : ctsCochains n →ₗ[ℝ] ctsCochains (n+1) where
  toFun f := ⟨barD n f.val,by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry
private def measD (n : ℕ) : measCochains n →ₗ[ℝ] measCochains (n+1) where
  toFun f := ⟨barD n f.val,by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry
private def ctsComplex : CochainComplex (ModuleCat ℝ) ℕ :=
  CochainComplex.of (fun n => ModuleCat.of ℝ (ctsCochains n))
    (fun n => ModuleCat.ofHom (ctsD n)) (by sorry)
private def measComplex : CochainComplex (ModuleCat ℝ) ℕ :=
  CochainComplex.of (fun n => ModuleCat.of ℝ (measCochains n))
    (fun n => ModuleCat.ofHom (measD n)) (by sorry)
abbrev ContinuousH5 := ctsComplex.homology 5
abbrev MeasurableH5 := measComplex.homology 5
private def ctsToMeasCochain (n : ℕ) : ctsCochains n →ₗ[ℝ] measCochains n where
  toFun f := ⟨f.val,by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry
private def ctsToMeasComplex : ctsComplex ⟶ measComplex :=
  CochainComplex.ofHom (fun n => ModuleCat.ofHom (ctsToMeasCochain n)) (by sorry)
/-- Continuous-to-measurable comparison induced by the inclusion of cochains. -/
def ctsToMeas : ContinuousH5 →ₗ[ℝ] MeasurableH5 :=
  (HomologicalComplex.homologyMap ctsToMeasComplex 5).hom
/-- Borel's original primitive degree-five real class (G95's convention). -/
def borelOriginal : ContinuousH5 := by sorry
/-- R.4's Burgos class divided by the R(2) Tate generator, not borelOriginal. -/
def borelCoordinate : ContinuousH5 := by sorry
/-- Pullback by the actual matrix entrywise complex-conjugation homomorphism. -/
def conjugateContinuous : ContinuousH5 →ₗ[ℝ] ContinuousH5 := by sorry
private def orbitPoint (g : ComplexGL) : Projectivization ℂ (Fin 3 → ℂ) :=
  Projectivization.mk ℂ (fun i => (g : Matrix (Fin 3) (Fin 3) ℂ) i 0) (by sorry)
/-- The configuration cochain uses geometric classes on all six-tuples.
The −2/15 factor translates Alt M₃ to the corrected r₆; it retains [1]₃. -/
private def configurationCochain (x : Fin 6 → ComplexGL) : ℝ :=
  trilogDescent ((-2/15 : ℚ) • geometricComparison ℂ
    (∑ σ : Equiv.Perm (Fin 6), signQ σ •
      geometricMk ℂ (fun i => orbitPoint (x (σ i)))))
private def configurationMeasCochain : measCochains 5 :=
  ⟨configurationCochain,by sorry⟩
private def configurationMeasCycle : measComplex.cycles 5 :=
  measComplex.cyclesMk configurationMeasCochain 6 (by sorry) (by sorry)
def configurationMeasClass : MeasurableH5 :=
  (measComplex.homologyπ 5).hom configurationMeasCycle
/-- Pair the continuous-to-discrete restriction of R.4's actual normalized
class with stable homology; primitive compatibility belongs to R.7/K.2 Part II. -/
def borelPair : HStable ℂ 5 →ₗ[ℚ] ℝ := by sorry
def stableFieldMap {F E : Type} [Field F] [Field E] (f : F →+* E) :
    StableGL F →* StableGL E := by sorry
end Supplier

/-- The primitive Borel line is the span of the fixed original universal class;
its primitivity is the R.4/R.7 contract, not an assumption on arbitrary classes. -/
theorem configuration_borel_class : ∃ b : Supplier.ContinuousH5,
    b ≠ 0 ∧ b ∈ Submodule.span ℝ {Supplier.borelOriginal} ∧
    Supplier.conjugateContinuous b = b ∧
    Supplier.ctsToMeas b = Supplier.configurationMeasClass := by sorry
/-- Original-real and Tate-divided coordinate normalizations have separate
rational coefficients. π² is explicit in the coordinate-class comparison. -/
theorem rational_regulator_calibration : ∃ q q' : ℚ, q ≠ 0 ∧ q' ≠ 0 ∧
    Supplier.configurationMeasClass = (q : ℝ) • Supplier.ctsToMeas Supplier.borelOriginal ∧
    Supplier.configurationMeasClass = ((q' : ℝ)*Real.pi^2) •
      Supplier.ctsToMeas Supplier.borelCoordinate := by sorry

section ArithmeticRegulator
open Supplier
variable (F : Type) [Field F] [NumberField F]
local instance : DecidableEq (NumberField.InfinitePlace F) := Classical.decEq _
/-- Actual embedding-by-embedding R.4 regulator, rationalized. -/
private def borelAt (σ : F →+* ℂ) : KQ F 5 →ₗ[ℚ] ℝ :=
  borelPair.comp ((groupMap (stableFieldMap σ) 5).comp (primitiveHurewicz F 5))
private def borelRegulator : KQ F 5 →ₗ[ℚ] (NumberField.InfinitePlace F → ℝ) :=
  LinearMap.pi (fun v => borelAt F v.embedding)
private def cycleRegulator : (Gamma F).homology 1 →ₗ[ℚ] (NumberField.InfinitePlace F → ℝ) :=
  LinearMap.pi (fun v => (trilogRegulatorAt v.embedding).comp (h1Iso F).symm.toLinearMap)
theorem regulator_image_containment : LinearMap.range (cycleRegulator F) ≤
    LinearMap.range ((Real.pi^2 : ℝ) • borelRegulator F) := by sorry
private def trilogPeriod : ℝ :=
  Real.sqrt |(NumberField.discr F : ℝ)| *
    Real.pi ^ (-(3 * NumberField.InfinitePlace.nrComplexPlaces F : ℤ)) *
    (NumberField.dedekindZeta F 3).re
private def cycleMatrix (z : NumberField.InfinitePlace F → LinearMap.ker (delta3 (F := F))) :
    Matrix (NumberField.InfinitePlace F) (NumberField.InfinitePlace F) ℝ :=
  fun v j => trilogRegulatorAt v.embedding (z j)
/-- The orientation det=q·period allows q=0 for dependent families.
The nonzero-family clause imports the parent's existence theorem. -/
theorem every_family_special_value :
    (∀ z : NumberField.InfinitePlace F → LinearMap.ker (delta3 (F := F)),
      ∃ q : ℚ, Matrix.det (cycleMatrix F z) = (q : ℝ) * trilogPeriod F) ∧
    (∃ (z : NumberField.InfinitePlace F → LinearMap.ker (delta3 (F := F))) (q : ℚ),
      q ≠ 0 ∧ Matrix.det (cycleMatrix F z) = (q : ℝ) * trilogPeriod F) := by sorry
end ArithmeticRegulator


/- P.4 owns the inductive field complexes, constants and all finite/infinite
residues. The following native complex/derived signatures mirror that request.
The explicit/inductive bridge and resolution are assumptions of the theorem. -/
namespace Supplier
open CategoryTheory
private def gammaZX (F : Type) [Field F] (i : ℤ) : ModuleCat ℚ :=
  if i = 1 then ModuleCat.of ℚ (B3 F)
  else if i = 2 then ModuleCat.of ℚ (B2 F ⊗[ℚ] UnitsQ F)
  else if i = 3 then ModuleCat.of ℚ (⋀[ℚ]^3 (UnitsQ F))
  else ModuleCat.of ℚ (Fin 0 → ℚ)
private def gammaZD (F : Type) [Field F] (i : ℤ) : gammaZX F i ⟶ gammaZX F (i+1) := by
  classical
  by_cases h1 : i = 1
  · subst i
    simpa [gammaZX] using ModuleCat.ofHom (delta3 (F := F))
  by_cases h2 : i = 2
  · subst i
    simpa [gammaZX] using ModuleCat.ofHom (d2 (F := F))
  exact 0
def gammaZ (F : Type) [Field F] : CochainComplex (ModuleCat ℚ) ℤ :=
  CochainComplex.of (gammaZX F) (gammaZD F) (by sorry)
/-- P.4's curve-specialization relation submodule defining inductive B₃. -/
def inductiveR3 (F : Type) [Field F] : Submodule ℚ (F →₀ ℚ) := by sorry
abbrev InductiveB3 (F : Type) [Field F] := (F →₀ ℚ) ⧸ inductiveR3 F
/-- P.4 proves vanishing on its curve-specialization relations. -/
def inductiveDelta3 (F : Type) [Field F] :
    InductiveB3 F →ₗ[ℚ] B2 F ⊗[ℚ] UnitsQ F :=
  (inductiveR3 F).liftQ
    (Finsupp.linearCombination ℚ (fun x => symbol2 x ⊗ₜ[ℚ] unitClass x)) (by sorry)
private def inductiveGammaX (F : Type) [Field F] (i : ℤ) : ModuleCat ℚ :=
  if i = 1 then ModuleCat.of ℚ (InductiveB3 F)
  else if i = 2 then ModuleCat.of ℚ (B2 F ⊗[ℚ] UnitsQ F)
  else if i = 3 then ModuleCat.of ℚ (⋀[ℚ]^3 (UnitsQ F))
  else ModuleCat.of ℚ (Fin 0 → ℚ)
private def inductiveGammaD (F : Type) [Field F] (i : ℤ) :
    inductiveGammaX F i ⟶ inductiveGammaX F (i+1) := by
  classical
  by_cases h1 : i = 1
  · subst i
    simpa [inductiveGammaX] using ModuleCat.ofHom (inductiveDelta3 F)
  by_cases h2 : i = 2
  · subst i
    simpa [inductiveGammaX] using ModuleCat.ofHom (d2 (F := F))
  exact 0
/-- Terms and differential are fixed, rather than supplied as arbitrary data. -/
def inductiveGamma3 (F : Type) [Field F] : CochainComplex (ModuleCat ℚ) ℤ :=
  CochainComplex.of (inductiveGammaX F) (inductiveGammaD F) (by sorry)
def explicitToInductiveB3 (F : Type) [Field F] : B3 F →ₗ[ℚ] InductiveB3 F :=
  (R3 (F := F)).liftQ (inductiveR3 F).mkQ (by sorry)
/-- The canonical bridge is [x]₃↦[x]₃ and identity in degrees 2,3.
Its invertibility is a conditional hypothesis, not a choice of arbitrary isomorphism. -/
def explicitToInductive (F : Type) [Field F] : gammaZ F ⟶ inductiveGamma3 F where
  f i := by
    classical
    by_cases h1 : i = 1
    · subst i
      simpa [gammaZ, inductiveGamma3, gammaZX, inductiveGammaX] using
        ModuleCat.ofHom (explicitToInductiveB3 F)
    by_cases h2 : i = 2
    · subst i
      simpa [gammaZ, inductiveGamma3, gammaZX, inductiveGammaX] using
        (𝟙 (ModuleCat.of ℚ (B2 F ⊗[ℚ] UnitsQ F)))
    by_cases h3 : i = 3
    · subst i
      simpa [gammaZ, inductiveGamma3, gammaZX, inductiveGammaX] using
        (𝟙 (ModuleCat.of ℚ (⋀[ℚ]^3 (UnitsQ F))))
    exact 0
  comm' := by sorry
/-- P.4's field-complex Γ(-,4), in degrees 1..4, with inductive groups.
This is not a user-selected complex or the P.5 complex-variety residue. -/
def gamma4 (F : Type) [Field F] : CochainComplex (ModuleCat ℚ) ℤ := by sorry
def constants4 (F : Type) [Field F] : gamma4 F ⟶ gamma4 (RatFunc F) := by sorry
/-- The actual cokernel of the constant-field inclusion, not an arbitrary quotient. -/
def quotient4 (F : Type) [Field F] : CochainComplex (ModuleCat ℚ) ℤ :=
  CategoryTheory.Limits.cokernel (constants4 F)
abbrev MonicIrreducible (F : Type) [Field F] :=
  {p : Polynomial F // p.Monic ∧ Irreducible p}
instance {F : Type} [Field F] (p : MonicIrreducible F) : Fact (Irreducible p.val) := ⟨p.prop.2⟩
abbrev PolynomialResidue {F : Type} [Field F] (p : MonicIrreducible F) := AdjoinRoot p.val
local instance {F : Type} [Field F] : DecidableEq (MonicIrreducible F) := Classical.decEq _
private def residueSumX (F : Type) [Field F] (i : ℤ) : ModuleCat ℚ :=
  ModuleCat.of ℚ (⨁ p : MonicIrreducible F, (gammaZ (PolynomialResidue p)).X (i-1))
private def residueSumD (F : Type) [Field F] (i : ℤ) : residueSumX F i ⟶ residueSumX F (i+1) :=
  ModuleCat.ofHom (DirectSum.toModule ℚ _ _ (fun p =>
    (DirectSum.lof ℚ _ (fun p => (gammaZ (PolynomialResidue p)).X ((i+1)-1)) p).comp
      (-((gammaZ (PolynomialResidue p)).d (i-1) ((i+1)-1)).hom)))
def residueSum (F : Type) [Field F] : CochainComplex (ModuleCat ℚ) ℤ :=
  CochainComplex.of (residueSumX F) (residueSumD F) (by sorry)
/-- Finite-residue map, factoring through constants, transported along the
inverse of the canonical bridge; the proof parameter cannot rescale the map. -/
def residueResolution (F : Type) [Field F]
    (bridge : ∀ p : MonicIrreducible F, IsIso (explicitToInductive (PolynomialResidue p))) :
    quotient4 F ⟶ residueSum F := by sorry
/-- Minus infinity residue is used only after factoring its constant-annihilation.
The F bridge is explicit; no unconditional presentation equivalence is assumed. -/
def infinityResidue (F : Type) [Field F]
    (bridge : IsIso (explicitToInductive F)) :
    quotient4 F ⟶ (shiftFunctor (CochainComplex (ModuleCat ℚ) ℤ) (-1 : ℤ)).obj (gammaZ F) := by sorry
/-- Inclusion of the polynomial residue-field summand, including the shift sign. -/
def residueSummand (F : Type) [Field F] (p : MonicIrreducible F) :
    (shiftFunctor (CochainComplex (ModuleCat ℚ) ℤ) (-1 : ℤ)).obj
      (gammaZ (PolynomialResidue p)) ⟶ residueSum F := by sorry
end Supplier

section DerivedTransfer
open CategoryTheory Supplier
local instance : HasDerivedCategory (ModuleCat.{0} ℚ) := HasDerivedCategory.standard _
private abbrev DQ := DerivedCategory.Q (C := ModuleCat.{0} ℚ)
private def derivedH3 (X : DerivedCategory (ModuleCat.{0} ℚ)) : ModuleCat ℚ :=
  (HomologicalComplexUpToQuasiIso.homologyFunctor (ModuleCat ℚ) (ComplexShape.up ℤ) 3).obj X
private def derivedH3Map {X Y : DerivedCategory (ModuleCat.{0} ℚ)} (f : X ⟶ Y) :
    derivedH3 X →ₗ[ℚ] derivedH3 Y :=
  ((HomologicalComplexUpToQuasiIso.homologyFunctor (ModuleCat ℚ) (ComplexShape.up ℤ) 3).map f).hom
/-- The canonical comparison uses homologyFunctorFactors and zero extension. -/
private def derivedH3Iso (F : Type) [Field F] :
    derivedH3 (DQ.obj (gammaZ F)) ≃ₗ[ℚ] (Gamma F).homology 3 := by sorry
/-- This is a simple-extension recipe. Tower independence is a separate gap.
The IsIso assumption is precisely the derived homotopy/residue resolution. -/
theorem conditional_complex_transfer (F : Type) [Field F] [Infinite F]
    (p : MonicIrreducible F) [Infinite (PolynomialResidue p)]
    [FiniteDimensional F (PolynomialResidue p)]
    (bridgeF : IsIso (explicitToInductive F))
    (bridgeP : ∀ p : MonicIrreducible F, IsIso (explicitToInductive (PolynomialResidue p)))
    [IsIso (DQ.map (residueResolution F bridgeP))] :
    ∃ t : DQ.obj (gammaZ (PolynomialResidue p)) ⟶ DQ.obj (gammaZ F),
      (DQ.commShiftIso (-1 : ℤ)).hom.app (gammaZ (PolynomialResidue p)) ≫
        (shiftFunctor (DerivedCategory (ModuleCat ℚ)) (-1 : ℤ)).map t ≫
        (DQ.commShiftIso (-1 : ℤ)).inv.app (gammaZ F) =
      DQ.map (residueSummand F p) ≫ inv (DQ.map (residueResolution F bridgeP)) ≫
        DQ.map (-infinityResidue F bridgeF) ∧
      (derivedH3Iso F).toLinearMap.comp
        ((derivedH3Map t).comp (derivedH3Iso (PolynomialResidue p)).symm.toLinearMap) =
          h3Transfer F (PolynomialResidue p) := by sorry
end DerivedTransfer

end TauCeti.Polylog.WeightThree
