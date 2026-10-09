import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.DedekindDomain.Factorization
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Rat.Floor
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive. The reader document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. All proofs are placeholders; no implementation is claimed.

The `Inherited` namespace is a small stand-alone prototype of the accepted U.1 interfaces,
not a second plan for them. Assembly should use those declarations directly. Only Mathlib
imports are used: the shared build has the pinned Mathlib, while some parent Tau Ceti imports
lack compiled objects. Tau Ceti baseline statements were read at their pinned git objects.

The two-sided rational completions, Moore-relative-cover conditions and the arithmetic Hecke
support condition have not yet been expressed against concrete supplier objects. The three
completion theorem signatures and `cgLocalizedH1Vanishing` are consequently omitted, as
required by the protocol; no opaque Prop-valued replacement is introduced. The packet names
these omissions in its completion, Moore and Hecke gaps. The matrix and arithmetic-defect
signatures below include every new definition, API item and unit test in this part.
-/

noncomputable section
open scoped Matrix
open Matrix
open NumberField IsDedekindDomain
universe u v w
set_option autoImplicit false

namespace TauCeti.FiniteMennicke
namespace Inherited

variable {A : Type u} [CommRing A]

abbrev GLn (n : ℕ) (A : Type u) [CommRing A] := Matrix.GeneralLinearGroup (Fin n) A
abbrev SLn (n : ℕ) (A : Type u) [CommRing A] := Matrix.SpecialLinearGroup (Fin n) A

def glMap {B : Type v} [CommRing B] {n : ℕ} (f : A →+* B) : GLn n A →* GLn n B :=
  Units.map (RingHom.mapMatrix f).toMonoidHom

def congruenceSubgroup (n : ℕ) (I : Ideal A) : Subgroup (GLn n A) :=
  (glMap (n := n) (Ideal.Quotient.mk I)).ker
abbrev Level (n : ℕ) (I : Ideal A) := congruenceSubgroup n I

def elementary {n : ℕ} {i j : Fin n} (h : i ≠ j) (t : A) : GLn n A :=
  Matrix.SpecialLinearGroup.toGL (Matrix.SpecialLinearGroup.transvection h t)

def elementarySubgroup (n : ℕ) (A : Type u) [CommRing A] : Subgroup (GLn n A) :=
  Subgroup.closure {g | ∃ i j : Fin n, ∃ h : i ≠ j, ∃ t : A, g = elementary h t}

def relElementary (n : ℕ) (I : Ideal A) : Subgroup (GLn n A) :=
  Subgroup.closure {g | ∃ τ ∈ elementarySubgroup n A,
    ∃ i j : Fin n, ∃ h : i ≠ j, ∃ t ∈ I, g = τ * elementary h t * τ⁻¹}

def HasStableRange (A : Type u) [CommRing A] (k : ℕ) : Prop :=
  ∀ m, k ≤ m → ∀ a : Fin (m+1) → A, Ideal.span (Set.range a) = ⊤ →
    ∃ b : Fin m → A,
      Ideal.span (Set.range fun i : Fin m => a i.castSucc + b i * a (Fin.last m)) = ⊤

def RelativeColumn (I : Ideal A) (n : ℕ) (a : Fin (n+1) → A) : Prop :=
  Ideal.span (Set.range a) = ⊤ ∧ ∀ i, a i - (if i = 0 then 1 else 0) ∈ I

def stabilise {m r : ℕ} (_h : m ≤ r) (g : GLn m A) : GLn r A :=
  ⟨fun i j => if hi : i.val < m then
      if hj : j.val < m then g.val ⟨i.val,hi⟩ ⟨j.val,hj⟩ else 0
    else if i = j then 1 else 0,
   fun i j => if hi : i.val < m then
      if hj : j.val < m then g.inv ⟨i.val,hi⟩ ⟨j.val,hj⟩ else 0
    else if i = j then 1 else 0, by sorry, by sorry⟩

def embedLevel {m r : ℕ} (h : m ≤ r) (I : Ideal A) : Level m I →* Level r I where
  toFun g := ⟨stabilise h g.val, by sorry⟩
  map_one' := by sorry
  map_mul' _ _ := by sorry

def conjugate {r : ℕ} {I : Ideal A} (τ : GLn r A) (g : Level r I) : Level r I :=
  ⟨τ * g.val * τ⁻¹, by sorry⟩
def transposeLevel {r : ℕ} {I : Ideal A} (g : Level r I) : Level r I :=
  ⟨⟨g.val.valᵀ, g.val.invᵀ, by sorry, by sorry⟩, by sorry⟩

def diagUnit {r : ℕ} (d : Fin r → Aˣ) : GLn r A :=
  ⟨Matrix.diagonal (fun i => (d i : A)),
    Matrix.diagonal (fun i => ((d i)⁻¹ : Aˣ)), by sorry, by sorry⟩

def Related {n : ℕ} (I : Ideal A) (t : A) (a b : Level (n+1) I) : Prop :=
  ∃ x : Matrix (Fin (n+1)) (Fin (n+1)) A, x 0 0 ∈ I ∧
    (∀ i j, a.val.val i j = if j = 0 then (if i = 0 then 1 else 0) + t*x i 0 else x i j) ∧
    (∀ i j, b.val.val i j = if i = 0 then (if j = 0 then 1 else 0) + t*x 0 j else x i j)

structure ExtensionConditions {n : ℕ} {I : Ideal A} {C : Type v} [Group C]
    (k : Level (n+1) I →* C) : Prop where
  elementary_kernel : ∀ e, e.val ∈ relElementary (n+1) I → k e = 1
  elementary_conjugation : ∀ τ ∈ elementarySubgroup (n+1) A, ∀ g, k (conjugate τ g) = k g
  diagonal_conjugation : ∀ d : Fin (n+1) → Aˣ, ∀ g, k (conjugate (diagUnit d) g) = k g
  transpose_kernel : ∀ g, k g = 1 → k (transposeLevel g) = 1
  related : ∀ t ∈ I, ∀ a b, Related I t a b → k b = k a

def leftMatrix {n : ℕ} {I : Ideal A} (a : Level (n+1) I) (y : Fin (n+1) → I) :
    Matrix (Fin (n+2)) (Fin (n+2)) A := fun i j =>
  if hi : i.val < n+1 then
    if hj : j.val < n+1 then a.val.val ⟨i.val,hi⟩ ⟨j.val,hj⟩ else (y ⟨i.val,hi⟩ : A)
  else if j = Fin.last (n+1) then 1 else 0

def leftBlock {n : ℕ} {I : Ideal A} (a : Level (n+1) I) (y : Fin (n+1) → I) : Level (n+2) I :=
  ⟨Matrix.GeneralLinearGroup.mk'' (leftMatrix a y) (by sorry), by sorry⟩

def rightMatrix {n : ℕ} {I : Ideal A} (b : Level (n+1) I) (y : Fin (n+1) → I) :
    Matrix (Fin (n+2)) (Fin (n+2)) A := fun i j =>
  if hi : i = 0 then if hj : j = 0 then 1 else (y (j.pred hj) : A)
  else if hj : j = 0 then 0 else b.val.val (i.pred hi) (j.pred hj)
def rightBlock {n : ℕ} {I : Ideal A} (b : Level (n+1) I) (y : Fin (n+1) → I) : Level (n+2) I :=
  ⟨Matrix.GeneralLinearGroup.mk'' (rightMatrix b y) (by sorry), by sorry⟩

def middle {n : ℕ} {I : Ideal A} (t : I) : Level (n+2) I :=
  ⟨elementary (by intro h; have hh := congrArg Fin.val h; simp at hh :
      Fin.last (n+1) ≠ (0 : Fin (n+2))) (t : A), by sorry⟩

structure StandardForm {n : ℕ} {I : Ideal A} (g : Level (n+2) I) where
  left : Level (n+1) I
  right : Level (n+1) I
  column : Fin (n+1) → I
  row : Fin (n+1) → I
  parameter : I
  factorization : g = leftBlock left column * middle parameter * rightBlock right row

theorem standardForm_exists {n : ℕ} {I : Ideal A} (hn : 1 ≤ n)
    (hsr : HasStableRange A (n+1))
    (ht : ∀ J : Ideal A, ∀ a : Fin (n+1) → A, RelativeColumn J n a →
      ∃ u : Level (n+1) J, u.val.val *ᵥ a = Pi.single 0 1)
    (g : Level (n+2) I) : Nonempty (StandardForm g) := by sorry

def extendedValue {n : ℕ} {I : Ideal A} {C : Type v} [Group C]
    (k : Level (n+1) I →* C) (hn : 1 ≤ n) (hsr : HasStableRange A (n+1))
    (ht : ∀ J : Ideal A, ∀ a : Fin (n+1) → A, RelativeColumn J n a →
      ∃ u : Level (n+1) J, u.val.val *ᵥ a = Pi.single 0 1) (g : Level (n+2) I) : C :=
  let f := Classical.choice (standardForm_exists hn hsr ht g)
  k f.left * k f.right

def W (I : Ideal A) := {x : A × A // x.1 - 1 ∈ I ∧ x.2 ∈ I ∧ IsCoprime x.1 x.2}

def rowMove (I : Ideal A) (x y : W I) : Prop :=
  (∃ t : A, y.val = (x.val.1 + t*x.val.2,x.val.2)) ∨
    ∃ t ∈ I, y.val = (x.val.1,x.val.2+t*x.val.1)
abbrev QEquiv (I : Ideal A) := Relation.EqvGen (rowMove I)

structure MennickeSymbol (I : Ideal A) (C : Type v) [Group C] where
  toFun : W I → C
  zero_one : toFun ⟨(1,0),by sorry⟩ = 1
  qequiv : ∀ x y, QEquiv I x y → toFun x = toFun y
  numerator_mul : ∀ a b c (hx : a-1∈I ∧ b∈I ∧ IsCoprime a b)
    (hy : a-1∈I ∧ c∈I ∧ IsCoprime a c)
    (hz : a-1∈I ∧ b*c∈I ∧ IsCoprime a (b*c)),
    toFun ⟨(a,b*c),hz⟩ = toFun ⟨(a,b),hx⟩ * toFun ⟨(a,c),hy⟩

def mennickeRelations (I : Ideal A) : Set (FreeGroup (W I)) :=
  {g | (∃ h : (1:A)-1∈I ∧ (0:A)∈I ∧ IsCoprime (1:A) 0,
    g = FreeGroup.of ⟨(1,0),h⟩) ∨
    (∃ x y : W I, QEquiv I x y ∧ g = FreeGroup.of x * (FreeGroup.of y)⁻¹) ∨
    ∃ a b c, ∃ hx : a-1∈I ∧ b∈I ∧ IsCoprime a b,
    ∃ hy : a-1∈I ∧ c∈I ∧ IsCoprime a c,
    ∃ hz : a-1∈I ∧ b*c∈I ∧ IsCoprime a (b*c),
      g = FreeGroup.of ⟨(a,b*c),hz⟩ * (FreeGroup.of ⟨(a,b),hx⟩ * FreeGroup.of ⟨(a,c),hy⟩)⁻¹}
abbrev MennickeGroup (I : Ideal A) :=
  FreeGroup (W I) ⧸ Subgroup.normalClosure (mennickeRelations I)

def kubotaHom [IsDedekindDomain A] {I : Ideal A} {C : Type v} [Group C]
    (s : MennickeSymbol I C) : Level 2 I →* C where
  toFun g := s.toFun ⟨(g.val.val 0 0,g.val.val 0 1),by sorry⟩
  map_one' := by sorry
  map_mul' _ _ := by sorry

/-- These helpers are owned by the accepted parent, not this packet. -/
def ordAt (F : Type u) [Field F] [NumberField F]
    (𝔭 : HeightOneSpectrum (𝓞 F)) (I : Ideal (𝓞 F)) : ℕ :=
  (UniqueFactorizationMonoid.normalizedFactors I).count 𝔭.asIdeal

def jIndex (F : Type u) [Field F] [NumberField F] (p n : ℕ) (I : Ideal (𝓞 F)) : ℕ :=
  ⨅ (𝔭 : HeightOneSpectrum (𝓞 F)) (_ : (p : 𝓞 F) ∈ 𝔭.asIdeal),
    min n (⌊(ordAt F 𝔭 I : ℚ) / ordAt F 𝔭 (Ideal.span {(p : 𝓞 F)}) -
      1 / ((p : ℚ)-1)⌋).toNat
end Inherited

open Inherited
variable {A : Type u} [CommRing A] {I : Ideal A} {C : Type v} [Group C]

/-! The new bundling step consumes the actual product law. Its proof is obtained by one
of the two last-swap theorems below; multiplicativity is not an opaque structure field. -/
def extendedHom {n : ℕ} (k : Level (n+1) I →* C) (hk : ExtensionConditions k)
    (hn : 1 ≤ n) (hsr : HasStableRange A (n+1))
    (ht : ∀ J : Ideal A, ∀ a : Fin (n+1) → A, RelativeColumn J n a →
      ∃ u : Level (n+1) J, u.val.val *ᵥ a = Pi.single 0 1)
    (hmul : ∀ x y, extendedValue k hn hsr ht (x*y) =
      extendedValue k hn hsr ht x * extendedValue k hn hsr ht y) : Level (n+2) I →* C where
  toFun := extendedValue k hn hsr ht
  map_one' := by sorry
  map_mul' := hmul

section ExtensionAPI
variable {n : ℕ} (k : Level (n+1) I →* C) (hk : ExtensionConditions k)
  (hn : 1 ≤ n) (hsr : HasStableRange A (n+1))
  (ht : ∀ J : Ideal A, ∀ a : Fin (n+1) → A, RelativeColumn J n a →
    ∃ u : Level (n+1) J, u.val.val *ᵥ a = Pi.single 0 1)
  (hmul : ∀ x y, extendedValue k hn hsr ht (x*y) =
    extendedValue k hn hsr ht x * extendedValue k hn hsr ht y)

lemma extendedHom_apply (g : Level (n+2) I) :
    extendedHom k hk hn hsr ht hmul g = extendedValue k hn hsr ht g := by sorry
lemma extendedHom_embed (g : Level (n+1) I) :
    extendedHom k hk hn hsr ht hmul (embedLevel (Nat.le_succ (n+1)) I g) = k g := by sorry
lemma extendedHom_unique (f : Level (n+2) I →* C)
    (hf : f.comp (embedLevel (Nat.le_succ (n+1)) I) = k)
    (he : ∀ e : Level (n+2) I, e.val ∈ relElementary (n+2) I → f e = 1) :
    f = extendedHom k hk hn hsr ht hmul := by sorry
lemma extendedHom_comp {D : Type w} [Group D] (φ : C →* D)
    (hφ : ExtensionConditions (φ.comp k))
    (hmulφ : ∀ x y, extendedValue (φ.comp k) hn hsr ht (x*y) =
      extendedValue (φ.comp k) hn hsr ht x * extendedValue (φ.comp k) hn hsr ht y) :
    extendedHom (φ.comp k) hφ hn hsr ht hmulφ =
      φ.comp (extendedHom k hk hn hsr ht hmul) := by sorry

-- test extendedHom_trivial_test
example (h1 : ExtensionConditions (1 : Level (n+1) I →* C))
    (hm : ∀ x y, extendedValue (1 : Level (n+1) I →* C) hn hsr ht (x*y) =
      extendedValue (1 : Level (n+1) I →* C) hn hsr ht x *
        extendedValue (1 : Level (n+1) I →* C) hn hsr ht y) :
    extendedHom (1 : Level (n+1) I →* C) h1 hn hsr ht hm = 1 := by sorry
-- test extendedHom_root_test
example (e : Level (n+2) I) (he : e.val ∈ relElementary (n+2) I) :
    extendedHom k hk hn hsr ht hmul e = 1 := by sorry
-- test extendedHom_restriction_test
example : (extendedHom k hk hn hsr ht hmul).comp (embedLevel (Nat.le_succ (n+1)) I) = k := by sorry
end ExtensionAPI

-- test extendedHom_nonabelian_target_test
-- A noncommutative codomain is allowed; the character itself has commutative image.
example :
    ∃ k : Level 2 (⊤ : Ideal ℚ) →* (ℚˣ × Equiv.Perm (Fin 3)),
    ∃ f : Level 3 (⊤ : Ideal ℚ) →* (ℚˣ × Equiv.Perm (Fin 3)),
      f.comp (embedLevel (by decide : 2 ≤ 3) (⊤ : Ideal ℚ)) = k ∧
      (∀ g, k g = (Matrix.GeneralLinearGroup.det g.val, 1)) ∧
      (∀ g, f g = (Matrix.GeneralLinearGroup.det g.val, 1)) ∧
      ∃ x y : ℚˣ × Equiv.Perm (Fin 3), x*y ≠ y*x := by sorry

/-! Last-swap statements on actual matrices. -/
def lastSwap (n : ℕ) : GLn (n+2) A :=
  let p : Equiv.Perm (Fin (n+2)) := Equiv.swap (Fin.last (n+1)) (⟨n,by omega⟩ : Fin (n+2))
  ⟨p.permMatrix A,(p⁻¹).permMatrix A,by sorry,by sorry⟩

theorem last_swap_higher_rank {n : ℕ} (hn : 1 ≤ n)
    (hs : HasStableRange A n) (hw : HasStableRange A (n+1))
    (hts : ∀ J : Ideal A, ∀ a : Fin n → A, RelativeColumn J (n-1)
      (fun i => a ⟨i.val,by omega⟩) → ∃ u : Level n J, u.val.val *ᵥ a = Pi.single ⟨0,by omega⟩ 1)
    (ht : ∀ J : Ideal A, ∀ a : Fin (n+1) → A, RelativeColumn J n a →
      ∃ u : Level (n+1) J, u.val.val *ᵥ a = Pi.single 0 1)
    (k : Level (n+1) I →* C) (hk : ExtensionConditions k) (g : Level (n+2) I) :
    extendedValue k (by omega) hw ht (conjugate (lastSwap n) g) =
      extendedValue k (by omega) hw ht g := by sorry

theorem last_swap_dedekind_rank_two [IsDedekindDomain A] (s : MennickeSymbol I C)
    (hs : HasStableRange A 2)
    (ht : ∀ J : Ideal A, ∀ a : Fin 2 → A, RelativeColumn J 1 a →
      ∃ u : Level 2 J, u.val.val *ᵥ a = Pi.single 0 1) (g : Level 3 I) :
    extendedValue (kubotaHom s) (by decide) hs ht (conjugate (lastSwap 1) g) =
      extendedValue (kubotaHom s) (by decide) hs ht g := by sorry

theorem dedekind_iterated_symbol_hom [IsDedekindDomain A] (s : MennickeSymbol I C) :
    ∃ k : (n : ℕ) → 2 ≤ n → (Level n I →* C),
      k 2 (by decide) = kubotaHom s ∧
      (∀ n (hn : 2 ≤ n),
        (k (n+1) (by omega)).comp (embedLevel (Nat.le_succ n) I) = k n hn) ∧
      ∀ n (hn : 1 ≤ n), ExtensionConditions (k (n+1) (by omega)) := by sorry

/-! Finite relative determinant-one defects use the native SLn and quotient carriers. -/
def gamma (n : ℕ) (I : Ideal A) : Subgroup (SLn n A) :=
  (congruenceSubgroup n I).comap Matrix.SpecialLinearGroup.toGL

def elementaryInGamma (n : ℕ) (I : Ideal A) : Subgroup (gamma n I) :=
  ((relElementary n I).comap Matrix.SpecialLinearGroup.toGL).subgroupOf (gamma n I)

theorem elementaryInGamma_normal [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) :
    (elementaryInGamma n I).Normal := by sorry

def FiniteDefect [IsDedekindDomain A] (n : ℕ) (I : Ideal A) (hn : 3 ≤ n) :=
  letI := elementaryInGamma_normal (I := I) hn
  gamma n I ⧸ elementaryInGamma n I

instance FiniteDefect_group [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) :
    Group (FiniteDefect n I hn) := by
  letI := elementaryInGamma_normal (I := I) hn
  exact inferInstanceAs (Group (gamma n I ⧸ elementaryInGamma n I))

def finiteDefectMk [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) :
    gamma n I →* FiniteDefect n I hn :=
  letI := elementaryInGamma_normal (I := I) hn
  QuotientGroup.mk' _

lemma finiteDefectMk_surjective [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) :
    Function.Surjective (finiteDefectMk (I := I) hn) := by sorry
lemma finiteDefectMk_eq_one [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) (g : gamma n I) :
    finiteDefectMk hn g = 1 ↔ Matrix.SpecialLinearGroup.toGL g.val ∈ relElementary n I := by sorry
lemma finiteDefect_ext [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n)
    (f g : FiniteDefect n I hn →* C)
    (h : f.comp (finiteDefectMk hn) = g.comp (finiteDefectMk hn)) : f = g := by sorry

-- test finiteDefect_zero_test
example [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) :
    Subsingleton (FiniteDefect n (⊥ : Ideal A) hn) := by sorry
-- test finiteDefect_integer_test
example {n : ℕ} (hn : 3 ≤ n) (N : ℕ) (hN : N ≠ 0) :
    Subsingleton (FiniteDefect n (Ideal.span {(N : ℤ)}) hn) := by sorry
-- test finiteDefect_det_test
example :
    let d : Fin 3 → ℤˣ := ![-1,1,1]
    diagUnit d ∈ congruenceSubgroup 3 (Ideal.span {(2 : ℤ)}) ∧
      ¬ ∃ g : gamma 3 (Ideal.span {(2 : ℤ)}), Matrix.SpecialLinearGroup.toGL g.val = diagUnit d := by sorry
-- test finiteDefect_quotient_test
example [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) :
    (finiteDefectMk (I := I) hn).ker = elementaryInGamma n I := by sorry

/-- Auxiliary upper-left map on determinant-one congruence matrices. -/
def embedGamma {m r : ℕ} (h : m ≤ r) : gamma m I →* gamma r I where
  toFun g := ⟨⟨(stabilise h (Matrix.SpecialLinearGroup.toGL g.val)).val, by sorry⟩, by sorry⟩
  map_one' := by sorry
  map_mul' _ _ := by sorry

theorem finiteDefectMennickeEquiv [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) :
    ∃ f : FiniteDefect n I hn ≃* MennickeGroup I, ∀ g : gamma 2 I,
      f (finiteDefectMk hn (embedGamma (by omega : 2 ≤ n) g)) =
        QuotientGroup.mk' (Subgroup.normalClosure (mennickeRelations I))
          (FreeGroup.of (⟨(g.val.val 0 0,g.val.val 0 1),by sorry⟩ : W I)) := by sorry

theorem finite_defect_stabilization [IsDedekindDomain A] {n : ℕ} (hn : 3 ≤ n) :
    ∃ f : FiniteDefect n I hn ≃* FiniteDefect (n+1) I (by omega),
      ∀ g : gamma n I,
        f (finiteDefectMk hn g) =
          finiteDefectMk (by omega) (embedGamma (Nat.le_succ n) g) := by sorry

/-! The order is defined on nonzero levels only. The ordinary unit torsion carrier is
native Mathlib, as is its finite cardinality; it represents all roots of unity in F. -/
section ArithmeticOrder
variable (F : Type u) [Field F] [NumberField F]
local instance : DecidableEq (HeightOneSpectrum (𝓞 F)) := Classical.decEq _

def defectOrder (I : Ideal (𝓞 F)) (_hI : I ≠ ⊥) : ℕ :=
  (NumberField.Units.torsionOrder F).primeFactors.prod
    (fun p => p ^ jIndex F p ((NumberField.Units.torsionOrder F).factorization p) I)

lemma defectOrder_dvd (I : Ideal (𝓞 F)) (hI : I ≠ ⊥) :
    defectOrder F I hI ∣ NumberField.Units.torsionOrder F := by sorry
lemma defectOrder_pos (I : Ideal (𝓞 F)) (hI : I ≠ ⊥) :
    0 < defectOrder F I hI := by sorry
lemma defectOrder_mono {I J : Ideal (𝓞 F)} (hI : I ≠ ⊥) (hJ : J ≠ ⊥) (hJI : J ≤ I) :
    defectOrder F I hI ∣ defectOrder F J hJ := by sorry
lemma defectOrder_top : defectOrder F ⊤ (by exact top_ne_bot) = 1 := by sorry
lemma defectOrder_deep (I : Ideal (𝓞 F)) (hI : I ≠ ⊥)
    (hdepth : ∀ p ∈ (NumberField.Units.torsionOrder F).primeFactors,
      ∀ 𝔭 : HeightOneSpectrum (𝓞 F), (p : 𝓞 F) ∈ 𝔭.asIdeal →
        (ordAt F 𝔭 (Ideal.span {(p : 𝓞 F)}) : ℚ) *
          (((NumberField.Units.torsionOrder F).factorization p : ℚ) + 1/((p : ℚ)-1)) ≤
        (ordAt F 𝔭 I : ℚ)) :
    defectOrder F I hI = NumberField.Units.torsionOrder F := by sorry

-- test defectOrder_top_test
example : defectOrder F ⊤ (by exact top_ne_bot) = 1 := by sorry
-- test defectOrder_gaussian_test
-- The profile is exactly that of Q(i), with its unique dyadic prime and e=2.
-- Stating the profile explicitly also tests the formula for any identical arithmetic data.
example (I : Ideal (𝓞 F)) (hI : I ≠ ⊥) (h : ℕ)
    (𝔭₀ : HeightOneSpectrum (𝓞 F)) (hm : NumberField.Units.torsionOrder F = 4)
    (hp : (2 : 𝓞 F) ∈ 𝔭₀.asIdeal)
    (hunique : ∀ 𝔭 : HeightOneSpectrum (𝓞 F), (2 : 𝓞 F) ∈ 𝔭.asIdeal → 𝔭 = 𝔭₀)
    (he : ordAt F 𝔭₀ (Ideal.span {(2 : 𝓞 F)}) = 2)
    (hord : ordAt F 𝔭₀ I = h) :
    defectOrder F I hI = if h ≤ 3 then 1 else if h ≤ 5 then 2 else 4 := by sorry
-- test defectOrder_depth_test
example (I : Ideal (𝓞 F)) (hI : I ≠ ⊥)
    (hdepth : ∀ p ∈ (NumberField.Units.torsionOrder F).primeFactors,
      ∀ 𝔭 : HeightOneSpectrum (𝓞 F), (p : 𝓞 F) ∈ 𝔭.asIdeal →
        (ordAt F 𝔭 (Ideal.span {(p : 𝓞 F)}) : ℚ) *
          (((NumberField.Units.torsionOrder F).factorization p : ℚ) + 1/((p : ℚ)-1)) ≤
        (ordAt F 𝔭 I : ℚ)) :
    defectOrder F I hI = NumberField.Units.torsionOrder F ∧
      ∀ p, jIndex F p ((NumberField.Units.torsionOrder F).factorization p) I ≤
        (NumberField.Units.torsionOrder F).factorization p := by sorry
-- test defectOrder_multiple_primes_test
example (I : Ideal (𝓞 F)) (p n : ℕ)
    (𝔭₁ 𝔭₂ : HeightOneSpectrum (𝓞 F)) (hp₁ : (p : 𝓞 F) ∈ 𝔭₁.asIdeal)
    (hp₂ : (p : 𝓞 F) ∈ 𝔭₂.asIdeal) (hne : 𝔭₁ ≠ 𝔭₂)
    (hprofile : ∀ 𝔭 : HeightOneSpectrum (𝓞 F), (p : 𝓞 F) ∈ 𝔭.asIdeal →
      min n (⌊(ordAt F 𝔭 I : ℚ) / ordAt F 𝔭 (Ideal.span {(p : 𝓞 F)}) -
        1 / ((p : ℚ)-1)⌋).toNat = if 𝔭 = 𝔭₁ then 1 else 3) :
    jIndex F p n I = 1 ∧ jIndex F p n I ≠ 3 := by sorry
end ArithmeticOrder

/-- The additional Dedekind instance and nonzero contraction are the inherited localization
interfaces; the standalone slice makes those two supplier inputs explicit. -/
theorem arithmeticFiniteDefectRoots (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (𝓞 F))) (hS : S.Finite)
    [IsDedekindDomain (S.integer F)] (I : Ideal (S.integer F)) (hI : I ≠ ⊥)
    (hI₀ : Ideal.comap (algebraMap (𝓞 F) (S.integer F)) I ≠ ⊥)
    {n : ℕ} (hn : 3 ≤ n) :
    ((S.Nonempty ∨ ∃ v : InfinitePlace F, v.IsReal) →
      Subsingleton (FiniteDefect n I hn)) ∧
    (S = ∅ → (∀ v : InfinitePlace F, ¬ v.IsReal) →
      Nonempty (FiniteDefect n I hn ≃*
        rootsOfUnity (defectOrder F (Ideal.comap (algebraMap (𝓞 F) (S.integer F)) I) hI₀) F)) := by sorry

/-! Serre's elementary group is normal closure in SL₂ itself. The parent E₂(A,I)
uses normal closure in E₂(A); those ambients must not be identified by definition. -/
def SerreElementary (I : Ideal A) : Subgroup (SLn 2 A) :=
  Subgroup.normalClosure {g | ∃ t ∈ I,
    g = Matrix.SpecialLinearGroup.transvection (by decide : (0 : Fin 2) ≠ 1) t}

lemma serreElementary_root (t : A) (ht : t ∈ I) :
    Matrix.SpecialLinearGroup.transvection (by decide : (0 : Fin 2) ≠ 1) t ∈
      SerreElementary I := by sorry
lemma serreElementary_lower (t : A) (ht : t ∈ I) :
    Matrix.SpecialLinearGroup.transvection (by decide : (1 : Fin 2) ≠ 0) t ∈
      SerreElementary I := by sorry
instance serreElementary_normal : (SerreElementary I).Normal := by sorry
lemma serreElementary_le_congruence : SerreElementary I ≤ gamma 2 I := by sorry
lemma serreElementary_mono {J : Ideal A} (hJI : J ≤ I) :
    SerreElementary J ≤ SerreElementary I := by sorry
lemma serreElementary_le_iff (N : Subgroup (SLn 2 A)) [N.Normal] :
    SerreElementary I ≤ N ↔ ∀ t ∈ I,
      Matrix.SpecialLinearGroup.transvection (by decide : (0 : Fin 2) ≠ 1) t ∈ N := by sorry

-- test serreElementary_zero_test
example : SerreElementary (⊥ : Ideal A) = ⊥ := by sorry
-- test serreElementary_field_test
example (k : Type u) [Field k] : SerreElementary (⊤ : Ideal k) = ⊤ := by sorry
-- test serreElementary_ambient_test
example : SerreElementary I = Subgroup.normalClosure
    {g : SLn 2 A | ∃ t ∈ I,
      g = Matrix.SpecialLinearGroup.transvection (by decide : (0 : Fin 2) ≠ 1) t} := by sorry
-- test serreElementary_congruence_test
example (t : A) (ht : t ∉ I) :
    Matrix.SpecialLinearGroup.transvection (by decide : (0 : Fin 2) ≠ 1) t ∉
      SerreElementary I := by sorry

end TauCeti.FiniteMennicke
