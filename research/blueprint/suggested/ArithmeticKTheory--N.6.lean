/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Codex — codex-jToARl; independent review Codex — codex-HBL6zX;
revision Codex — codex-20n7RW; independent review Codex — codex-2Ohski
-/
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Algebra.Module.Submodule.LinearMap
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.LinearAlgebra.Pi
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.NumberTheory.NumberField.Completion.FinitePlace
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Basic
import Mathlib.RepresentationTheory.Homological.GroupHomology.Shapiro
import Mathlib.RingTheory.Valuation.RamificationGroup

/-!
# Suggested declarations for ArithmeticKTheory N.6

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticKTheory--N.6.md` is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures; they claim no implementation. Every packet node is unchecked.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The numerical function, special number-field predicate and real local
cohomology tests use actual pinned carriers. The four kernel/map constructors
use additive homomorphisms or linear maps, the precise generic form of their
suppliers. These types are not declared to be K-groups or arithmetic H².
Restriction, transfer, degree-two and change-of-S interfaces display the
map equations or local detection inputs that arithmetic suppliers must prove.
The compatible-section identity does not assert the continuous-cohomology
comparison: R02's H¹ finiteness and limit interfaces remain necessary.

The final omission register names each arithmetic statement/test that cannot
be typed without a missing supplier carrier or map. Entries there are comments,
not declarations. No opaque K-group stand-in or proposition field is introduced.
The packet retains its earlier review in reviewHistory; round 2 accepts this planned pass.
-/

open IsDedekindDomain Filter
open scoped Pointwise NumberField

namespace TauCeti.ArithmeticKTheory.N6

/-- Numerical table only: positive even degrees have the arithmetic theorem. -/
def evenTwoRank (r s t j n : ℕ) : ℕ :=
  if n % 8 = 2 then r + s + t - 1
  else if n % 8 = 4 ∨ n % 8 = 6 then j + s + t - 1
  else if n % 8 = 0 then s + t - 1
  else 0

theorem evenTwoRank_residue_two (r s t j n : ℕ) (h : n % 8 = 2) :
    evenTwoRank r s t j n = r + s + t - 1 := by sorry

theorem evenTwoRank_residue_four (r s t j n : ℕ) (h : n % 8 = 4) :
    evenTwoRank r s t j n = j + s + t - 1 := by sorry

theorem evenTwoRank_residue_six (r s t j n : ℕ) (h : n % 8 = 6) :
    evenTwoRank r s t j n = j + s + t - 1 := by sorry

theorem evenTwoRank_residue_zero (r s t j n : ℕ) (h : n % 8 = 0) :
    evenTwoRank r s t j n = s + t - 1 := by sorry

theorem evenTwoRank_periodic (r s t j n : ℕ) :
    evenTwoRank r s t j (n + 8) = evenTwoRank r s t j n := by sorry

-- TauCeti.ArithmeticKTheory.N6.rankTable_rational
example : (evenTwoRank 1 1 0 0 2, evenTwoRank 1 1 0 0 4,
    evenTwoRank 1 1 0 0 6, evenTwoRank 1 1 0 0 8) = (1, 0, 0, 0) := by sorry

-- TauCeti.ArithmeticKTheory.N6.rankTable_real_defect
example : (evenTwoRank 2 1 0 1 2, evenTwoRank 2 1 0 1 4,
    evenTwoRank 2 1 0 1 6, evenTwoRank 2 1 0 1 8) = (2, 1, 1, 0) := by sorry

-- TauCeti.ArithmeticKTheory.N6.rankTable_extra_prime
example (r s t j n : ℕ) (hs : 1 ≤ s) (hn : Even n) :
    evenTwoRank r (s + 1) t j n = evenTwoRank r s t j n + 1 := by sorry

-- TauCeti.ArithmeticKTheory.N6.rankTable_odd_totalisation
example (r s t j : ℕ) : evenTwoRank r s t j 1 = 0 := by sorry


universe u v w

section AdditiveSymbols
variable {A : Type u} [AddCommGroup A] {ι : Type v}
  {B : ι → Type w} [∀ v, AddCommGroup (B v)]

/-- Joint map into the product. Finite support has to be proved independently. -/
def localSymbolFamily (localMap : ∀ v, A →+ B v) : A →+ ∀ v, B v where
  toFun x v := localMap v x
  map_zero' := by sorry
  map_add' := by sorry

theorem localSymbolFamily_apply (localMap : ∀ v, A →+ B v) (x : A) (v : ι) :
    localSymbolFamily localMap x v = localMap v x := by sorry

theorem localSymbolFamily_map_zero (localMap : ∀ v, A →+ B v) :
    localSymbolFamily localMap 0 = 0 := by sorry

theorem localSymbolFamily_map_add (localMap : ∀ v, A →+ B v) (x y : A) :
    localSymbolFamily localMap (x + y) =
      localSymbolFamily localMap x + localSymbolFamily localMap y := by sorry

theorem localSymbolFamily_ext (f g : ∀ v, A →+ B v) :
    localSymbolFamily f = localSymbolFamily g ↔ ∀ v, f v = g v := by sorry

/-- The prescribed real finite symbol kernel in degree 2i. -/
def positiveEvenK (i : ℕ) (realMap : A →+ (ι → ZMod 2)) : AddSubgroup A :=
  if i % 4 = 1 then realMap.ker else ⊤

theorem positiveEvenK_mem (i : ℕ) (realMap : A →+ (ι → ZMod 2))
    (hzero : i % 4 ≠ 1 → realMap = 0) (x : A) :
    x ∈ positiveEvenK i realMap ↔ ∀ v, realMap x v = 0 := by sorry

theorem positiveEvenK_of_no_real_places [IsEmpty ι]
    (i : ℕ) (realMap : A →+ (ι → ZMod 2)) :
    positiveEvenK i realMap = ⊤ := by sorry

theorem positiveEvenK_ring_comap {C : Type*} [AddCommGroup C]
    (i : ℕ) (realMap : A →+ (ι → ZMod 2)) (fieldMap : C →+ A) :
    positiveEvenK i (realMap.comp fieldMap) = (positiveEvenK i realMap).comap fieldMap := by sorry

theorem positiveEvenK_of_other_residue (i : ℕ) (hi : i % 4 ≠ 1)
    (realMap : A →+ (ι → ZMod 2)) : positiveEvenK i realMap = ⊤ := by sorry

/-- Kernel on the genuine supplied maps; no new K-group carrier is introduced. -/
def symbolWildKernel (localMap : ∀ v, A →+ B v) : AddSubgroup A :=
  (localSymbolFamily localMap).ker

theorem symbolWildKernel_mem (localMap : ∀ v, A →+ B v) (x : A) :
    x ∈ symbolWildKernel localMap ↔ ∀ v, localMap v x = 0 := by sorry

def symbolWildKernel_lift {C : Type*} [AddCommGroup C]
    (localMap : ∀ v, A →+ B v) (f : C →+ A)
    (hf : ∀ c v, localMap v (f c) = 0) : C →+ symbolWildKernel localMap where
  toFun c := ⟨f c, by sorry⟩
  map_zero' := by sorry
  map_add' := by sorry

theorem symbolWildKernel_lift_coe {C : Type*} [AddCommGroup C]
    (localMap : ∀ v, A →+ B v) (f : C →+ A)
    (hf : ∀ c v, localMap v (f c) = 0) (c : C) :
    (symbolWildKernel_lift localMap f hf c : A) = f c := by sorry

theorem symbolWildKernel_lift_unique {C : Type*} [AddCommGroup C]
    (localMap : ∀ v, A →+ B v) (f : C →+ A)
    (hf : ∀ c v, localMap v (f c) = 0) (g : C →+ symbolWildKernel localMap)
    (hg : ∀ c, (g c : A) = f c) : g = symbolWildKernel_lift localMap f hf := by sorry

theorem symbolWildKernel_le_positive {ρ : Type*} (localMap : ∀ v, A →+ B v)
    (i : ℕ) (realMap : A →+ (ρ → ZMod 2))
    (p : (∀ v, B v) →+ (ρ → ZMod 2))
    (hreal : realMap = p.comp (localSymbolFamily localMap)) :
    symbolWildKernel localMap ≤ positiveEvenK i realMap := by sorry

/-- Shapes of the map identities. The local commuting-square equations are
supplier facts; these lemmas do not assert an arithmetic restriction theorem. -/
theorem localSymbolFamily_restriction {C : Type*} [AddCommGroup C] {κ : Type*}
    {D : κ → Type*} [∀ w, AddCommGroup (D w)]
    (f : ∀ v, A →+ B v) (g : ∀ w, C →+ D w) (res : A →+ C)
    (place : κ → ι) (localRes : ∀ w, B (place w) →+ D w)
    (hsq : ∀ w, (g w).comp res = (localRes w).comp (f (place w))) (x : A) (w : κ) :
    localSymbolFamily g (res x) w = localRes w (localSymbolFamily f x (place w)) := by sorry

theorem localSymbolFamily_transfer {C : Type*} [AddCommGroup C] {κ : Type*}
    {D : κ → Type*} [∀ w, AddCommGroup (D w)]
    (f : ∀ v, A →+ B v) (g : ∀ w, C →+ D w) (tr : C →+ A)
    (over : ι → Finset κ) (localTr : ∀ v w, D w →+ B v)
    (hsq : ∀ x v, f v (tr x) = ∑ w ∈ over v, localTr v w (g w x)) (x : C) (v : ι) :
    localSymbolFamily f (tr x) v = ∑ w ∈ over v, localTr v w (localSymbolFamily g x w) := by sorry

theorem symbolWildKernel_restriction {C : Type*} [AddCommGroup C] {κ : Type*}
    {D : κ → Type*} [∀ w, AddCommGroup (D w)]
    (f : ∀ v, A →+ B v) (g : ∀ w, C →+ D w) (res : A →+ C)
    (place : κ → ι) (localRes : ∀ w, B (place w) →+ D w)
    (hsq : ∀ w, (g w).comp res = (localRes w).comp (f (place w))) :
    (symbolWildKernel f).map res ≤ symbolWildKernel g := by sorry

theorem symbolWildKernel_transfer {C : Type*} [AddCommGroup C] {κ : Type*}
    {D : κ → Type*} [∀ w, AddCommGroup (D w)]
    (f : ∀ v, A →+ B v) (g : ∀ w, C →+ D w) (tr : C →+ A)
    (over : ι → Finset κ) (localTr : ∀ v w, D w →+ B v)
    (hsq : ∀ x v, f v (tr x) = ∑ w ∈ over v, localTr v w (g w x)) :
    (symbolWildKernel g).map tr ≤ symbolWildKernel f := by sorry

/-- The degree-two comparison uses torsion-free kernels; these are explicit
algebraic conditions, rather than an unqualified assumption of kernel equality. -/
theorem symbolWildKernel_degree_two {C : ι → Type*} [∀ v, AddCommGroup (C v)]
    (completion : ∀ v, A →+ C v) (quotient : ∀ v, C v →+ B v)
    (htorsion : ∀ x : A, ∃ n : ℕ, 0 < n ∧ n • x = 0)
    (hdetect : ∀ v (y : C v), quotient v y = 0 →
      (∃ n : ℕ, 0 < n ∧ n • y = 0) → y = 0) :
    symbolWildKernel (fun v => (quotient v).comp (completion v)) =
      (localSymbolFamily completion).ker := by sorry

/-- The Hilbert pairing factors through the supplied Matsumoto map. -/
theorem localSymbolFamily_degree_two {P : Type*} [AddCommGroup P]
    (matsumoto : P ≃+ A) (symbols : ∀ v, A →+ B v) (hilbert : ∀ v, P →+ B v)
    (hfactor : ∀ v, symbols v = (hilbert v).comp matsumoto.symm.toAddMonoidHom) (x : P) :
    localSymbolFamily symbols (matsumoto x) = localSymbolFamily hilbert x := by sorry

-- TauCeti.ArithmeticKTheory.N6.positiveK_degree_four
-- Uniform constructor test; its K₄ arithmetic instance uses the real K supplier.
example (realMap : A →+ (ι → ZMod 2)) : positiveEvenK 2 realMap = ⊤ := by sorry

end AdditiveSymbols

section StrictKernels
variable {R : Type*} [CommRing R] {H : Type*} [AddCommGroup H] [Module R H]
    {ι : Type*} {V : ι → Type w} [∀ v, AddCommGroup (V v)] [∀ v, Module R (V v)]

/-- Strict zero conditions on actual R-linear maps, the L2 supplied-kernel form. -/
def cohomologicalWildKernel (res : ∀ v, H →ₗ[R] V v) : Submodule R H :=
  ⨅ v, (res v).ker

theorem cohomologicalWildKernel_mem (res : ∀ v, H →ₗ[R] V v) (x : H) :
    x ∈ cohomologicalWildKernel res ↔ ∀ v, res v x = 0 := by sorry

/-- The Selmer quotient construction with L_v = 0, on the supplier's module maps. -/
theorem cohomologicalWildKernel_selmer (res : ∀ v, H →ₗ[R] V v) :
    cohomologicalWildKernel res =
      (LinearMap.pi (fun v => (Submodule.mkQ (⊥ : Submodule R (V v))).comp (res v))).ker := by sorry

/-- Enlarging S: new unramified local conditions factor through old ones.
The factorisation is a required arithmetic input, not proved by this signature. -/
theorem cohomologicalWildKernel_change_S {κ : Type*} {W : κ → Type w}
    [∀ w, AddCommGroup (W w)] [∀ w, Module R (W w)]
    (res : ∀ v, H →ₗ[R] V v) (place : κ → ι) (g : ∀ w, V (place w) →ₗ[R] W w) :
    cohomologicalWildKernel res ⊓
      (⨅ w, ((g w).comp (res (place w))).ker) = cohomologicalWildKernel res := by sorry

/-- Induced map of strict kernels. -/
noncomputable def cohomologicalWildKernel_functoriality {H' : Type*}
    [AddCommGroup H'] [Module R H'] {V' : ι → Type*}
    [∀ v, AddCommGroup (V' v)] [∀ v, Module R (V' v)]
    (res : ∀ v, H →ₗ[R] V v) (res' : ∀ v, H' →ₗ[R] V' v)
    (f : H →ₗ[R] H') (fv : ∀ v, V v →ₗ[R] V' v)
    (hsq : ∀ v, (res' v).comp f = (fv v).comp (res v)) :
    cohomologicalWildKernel res →ₗ[R] cohomologicalWildKernel res' where
  toFun x := ⟨f x, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

theorem cohomologicalWildKernel_functoriality_apply {H' : Type*}
    [AddCommGroup H'] [Module R H'] {V' : ι → Type*}
    [∀ v, AddCommGroup (V' v)] [∀ v, Module R (V' v)]
    (res : ∀ v, H →ₗ[R] V v) (res' : ∀ v, H' →ₗ[R] V' v)
    (f : H →ₗ[R] H') (fv : ∀ v, V v →ₗ[R] V' v)
    (hsq : ∀ v, (res' v).comp f = (fv v).comp (res v)) (x : cohomologicalWildKernel res) :
    (cohomologicalWildKernel_functoriality res res' f fv hsq x : H') = f x := by sorry

theorem cohomologicalWildKernel_functoriality_id (res : ∀ v, H →ₗ[R] V v)
    (x : cohomologicalWildKernel res) :
    cohomologicalWildKernel_functoriality res res LinearMap.id
      (fun _ => LinearMap.id) (by intro v; simp) x = x := by sorry

theorem cohomologicalWildKernel_functoriality_comp {H' H'' : Type*}
    [AddCommGroup H'] [Module R H'] [AddCommGroup H''] [Module R H'']
    {V' V'' : ι → Type*} [∀ v, AddCommGroup (V' v)] [∀ v, Module R (V' v)]
    [∀ v, AddCommGroup (V'' v)] [∀ v, Module R (V'' v)]
    (res : ∀ v, H →ₗ[R] V v) (res' : ∀ v, H' →ₗ[R] V' v)
    (res'' : ∀ v, H'' →ₗ[R] V'' v)
    (f : H →ₗ[R] H') (fv : ∀ v, V v →ₗ[R] V' v)
    (g : H' →ₗ[R] H'') (gv : ∀ v, V' v →ₗ[R] V'' v)
    (hf : ∀ v, (res' v).comp f = (fv v).comp (res v))
    (hg : ∀ v, (res'' v).comp g = (gv v).comp (res' v))
    (hgf : ∀ v, (res'' v).comp (g.comp f) = ((gv v).comp (fv v)).comp (res v))
    (x : cohomologicalWildKernel res) :
    cohomologicalWildKernel_functoriality res res'' (g.comp f)
      (fun v => (gv v).comp (fv v)) hgf x =
    cohomologicalWildKernel_functoriality res' res'' g gv hg
      (cohomologicalWildKernel_functoriality res res' f fv hf x) := by sorry

/-- Finite-level compatible sections. This is not the continuous cohomology comparison. -/
def compatibleSections (Hn : ℕ → Type*) [∀ n, AddCommGroup (Hn n)]
    [∀ n, Module R (Hn n)] (transition : ∀ n, Hn (n + 1) →ₗ[R] Hn n) :
    Submodule R (∀ n, Hn n) where
  carrier := {x | ∀ n, transition n (x (n + 1)) = x n}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

noncomputable def compatibleEval (Hn : ℕ → Type*) [∀ n, AddCommGroup (Hn n)]
    [∀ n, Module R (Hn n)] (transition : ∀ n, Hn (n + 1) →ₗ[R] Hn n) (n : ℕ) :
    compatibleSections (R := R) Hn transition →ₗ[R] Hn n where
  toFun x := x.1 n
  map_add' := by sorry
  map_smul' := by sorry

/-- Strict kernels commute with the supplied compatible-section construction.
Identifying continuous H² with this domain still needs the R02 limit theorem. -/
theorem cohomologicalWildKernel_inverse_limit (Hn : ℕ → Type*)
    [∀ n, AddCommGroup (Hn n)] [∀ n, Module R (Hn n)]
    (transition : ∀ n, Hn (n + 1) →ₗ[R] Hn n)
    (Vn : ℕ → ι → Type*) [∀ n v, AddCommGroup (Vn n v)]
    [∀ n v, Module R (Vn n v)] (res : ∀ n v, Hn n →ₗ[R] Vn n v) :
    cohomologicalWildKernel (V := fun j : ℕ × ι => Vn j.1 j.2)
      (fun j => (res j.1 j.2).comp (compatibleEval Hn transition j.1)) =
    ⨅ n, (cohomologicalWildKernel (res n)).comap (compatibleEval Hn transition n) := by sorry

end StrictKernels




/-- A local spelling of the imported N.4 predicate, rather than a new owner. -/
private abbrev exceptionalForm (F : Type*) [Field F] [NumberField F] : Prop :=
  ∀ᶠ ν : ℕ in atTop,
    ¬ IsCyclic (CyclotomicField (2 ^ ν) F ≃ₐ[F] CyclotomicField (2 ^ ν) F)

/-- A root in the actual closure of a finite completion; both inclusions are explicit. -/
private def rootWitness (F : Type*) [Field F] [NumberField F]
    (v : HeightOneSpectrum (𝓞 F)) : Prop :=
  ∃ (ν : ℕ) (ζ : AlgebraicClosure (v.adicCompletion F)),
    ζ ^ (2 ^ ν) = 1 ∧
    (∃ y : v.adicCompletion F, algebraMap _ _ y = ζ + ζ⁻¹) ∧
    ¬ ∃ x : F, algebraMap _ _ (NumberField.FinitePlace.embedding v x) = ζ + ζ⁻¹

/-- The source's degree-independent predicate, on genuine number fields and completions. -/
def SpecialAtTwo (F : Type*) [Field F] [NumberField F] : Prop :=
  exceptionalForm F ∧ ∀ v : HeightOneSpectrum (𝓞 F), (2 : 𝓞 F) ∈ v.asIdeal → rootWitness F v

theorem specialAtTwo_exceptional (F : Type*) [Field F] [NumberField F]
    (h : SpecialAtTwo F) :
    ∀ᶠ ν : ℕ in atTop,
      ¬ IsCyclic (CyclotomicField (2 ^ ν) F ≃ₐ[F] CyclotomicField (2 ^ ν) F) := by sorry

theorem specialAtTwo_local_witness (F : Type*) [Field F] [NumberField F]
    (h : SpecialAtTwo F) (v : HeightOneSpectrum (𝓞 F)) (hv : (2 : 𝓞 F) ∈ v.asIdeal) :
    ∃ (ν : ℕ) (ζ : AlgebraicClosure (v.adicCompletion F)),
      ζ ^ (2 ^ ν) = 1 ∧
      (∃ y : v.adicCompletion F, algebraMap _ _ y = ζ + ζ⁻¹) ∧
      ¬ ∃ x : F, algebraMap _ _ (NumberField.FinitePlace.embedding v x) = ζ + ζ⁻¹ := by sorry

theorem specialAtTwo_iff (F : Type*) [Field F] [NumberField F] :
    SpecialAtTwo F ↔ exceptionalForm F ∧
      ∀ v : HeightOneSpectrum (𝓞 F), (2 : 𝓞 F) ∈ v.asIdeal → rootWitness F v := by sorry

theorem specialAtTwo_transport (F E : Type*) [Field F] [NumberField F]
    [Field E] [NumberField E] (e : F ≃+* E) :
    SpecialAtTwo F ↔ SpecialAtTwo E := by sorry

/-- Actual valuation-subring stabilisers, over the odd-twist splitting field.
For odd i, powering the cyclotomic character by i has the same finite kernel. -/
private def dyadicDecompositionProper (F : Type*) [Field F] [NumberField F] (ν : ℕ) : Prop :=
  ∀ w : HeightOneSpectrum (𝓞 (CyclotomicField (2 ^ ν) F)),
    (2 : 𝓞 (CyclotomicField (2 ^ ν) F)) ∈ w.asIdeal →
    (w.valuation (CyclotomicField (2 ^ ν) F)).valuationSubring.decompositionSubgroup F ≠ ⊤

theorem specialAtTwo_iff_decomposition (F : Type*) [Field F] [NumberField F]
    (hF : exceptionalForm F) (i : ℕ) (hi : Odd i) :
    ∀ᶠ ν : ℕ in atTop, SpecialAtTwo F ↔ dyadicDecompositionProper F ν := by sorry

/-- The decomposition-equivalence conclusion of the named theorem.
Its subgroup H₁/ρ₁ conclusion is omitted at the exact boundary in the register. -/
theorem specialDyadicDecomposition (F : Type*) [Field F] [NumberField F]
    (hF : exceptionalForm F) (i : ℕ) (hi : Odd i) :
    ∀ᶠ ν : ℕ in atTop, SpecialAtTwo F ↔ dyadicDecompositionProper F ν := by sorry

-- TauCeti.ArithmeticKTheory.N6.specialAtTwo_rational
example : exceptionalForm ℚ ∧ ¬ SpecialAtTwo ℚ := by sorry

-- TauCeti.ArithmeticKTheory.N6.specialAtTwo_gaussian
example (F : Type*) [Field F] [NumberField F]
    (hd : Module.finrank ℚ F = 2) (x : F) (hx : x ^ 2 = -1) :
    ¬ exceptionalForm F ∧ ¬ SpecialAtTwo F := by sorry

-- TauCeti.ArithmeticKTheory.N6.specialAtTwo_minus_fourteen
example (F : Type*) [Field F] [NumberField F]
    (hd : Module.finrank ℚ F = 2) (x : F) (hx : x ^ 2 = -14) :
    SpecialAtTwo F := by sorry

-- TauCeti.ArithmeticKTheory.N6.specialAtTwo_quadratic
example (F : Type*) [Field F] [NumberField F] (d : ℤ) (hs : Squarefree d)
    (h0 : d ≠ 0) (h1 : d ≠ 1) (hd : Module.finrank ℚ F = 2) (x : F)
    (hx : x ^ 2 = (d : F)) :
    SpecialAtTwo F ↔
      (d % 8 = 7 ∧ d ≠ -1) ∨ ((d % 16 = 2 ∨ d % 16 = 14) ∧ d ≠ 2 ∧ d ≠ -2) := by sorry




/-- The actual real Galois group, with the integral Tate-twist action. -/
private noncomputable def realTwist (A : Type*) [AddCommGroup A] (i : ℕ) :
    Rep ℤ (Multiplicative (ZMod 2)) :=
  Rep.of (show Representation ℤ (Multiplicative (ZMod 2)) A from {
    toFun := fun g => if g = 1 then LinearMap.id else ((-1 : ℤ) ^ (i + 1)) • LinearMap.id
    map_one' := by sorry
    map_mul' := by sorry })

-- TauCeti.ArithmeticKTheory.N6.cohomWild_no_real_odd_prime
-- The real local term is zero, so adding it to a joint localisation kernel has no effect.
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (i : ℕ) :
    Subsingleton (groupCohomology (realTwist ℤ_[ℓ] i) 2) := by sorry

-- TauCeti.ArithmeticKTheory.N6.cohomWild_real_odd_i
example (i : ℕ) (hi : Odd i) :
    Nonempty (groupCohomology (realTwist ℤ_[2] i) 2 ≃+ ZMod 2) := by sorry

-- TauCeti.ArithmeticKTheory.N6.cohomWild_real_even_i
example (i : ℕ) (hi : Even i) :
    Subsingleton (groupCohomology (realTwist ℤ_[2] i) 2) ∧
    Nat.card (groupCohomology (realTwist (ZMod 4) i) 2) = 2 := by sorry


-- Compatibility boundary for twistedResidueNormTest: the full unit group only.
example (K L : Type*) [Field K] [Field L] [Algebra K L] [Finite L] :
    Function.Surjective (Units.map (Algebra.norm K (S := L))) := by sorry

-- Arithmetic order evidence cannot be replaced by the number of generators.
example : Nat.card (ZMod 2) ≠ Nat.card (ZMod 4) := by sorry

end TauCeti.ArithmeticKTheory.N6

/-!
## Arithmetic instantiation and omission register

TauCeti.ArithmeticKTheory.N6.specialDyadicDecomposition [partial named statement above]
The special/proper-decomposition equivalence is typed on actual cyclotomic fields. The remaining ρ₁ zero/split-surjection conclusions need the faithful tensor-twist representation and subgroup-induced homology maps from I.1/ClassFieldTheory Layer 0; Shapiro’s carrier/isomorphism exists at the Mathlib pin. They are omitted, not replaced by a supplied conclusion.

The reader states every mathematical declaration, its hypotheses, proof steps
and locators. This register names the exact missing types/maps; it does not
count comments as Lean declarations. Generic API declarations above retain
supplier input equations, so their arithmetic specialisations are also required.

TauCeti.ArithmeticKTheory.N6.arithmeticModTwoDimensions [omitted named arithmetic statement]
M.2/R02 must supply the actual ordinary H¹/H² modules and real restriction maps on O_{F,S}, together with the N.2 S-unit Kummer/Brauer maps.

TauCeti.ArithmeticKTheory.N6.modifiedModTwoDimensions [omitted named arithmetic statement]
M.2 must supply modified real-restriction cohomology kernels and their exact sequence on the preceding ordinary modules.

TauCeti.ArithmeticKTheory.N6.modTwoCoefficientOrders [omitted named arithmetic statement]
H.6 must supply coefficient K-groups, and M.7 the eight exact filtrations on those groups; no vector-space stand-in is used.

TauCeti.ArithmeticKTheory.N6.evenTwoRanks [omitted named arithmetic statement]
GeneralAlgebraicKTheory must supply actual K_n(O_{F,S}); H.6/M.7 must supply the coefficient UCT and comparisons to the specified arithmetic cohomology.

TauCeti.ArithmeticKTheory.N6.finiteCoefficientDivisibilityKernel [omitted named arithmetic statement]
H.6 must supply actual coefficient K-groups and functorial ring-to-field UCT maps. The integral subgroup and the annihilator condition are then stated on the imported K-group.

TauCeti.ArithmeticKTheory.N6.primaryKernelsStabilise [omitted named arithmetic statement]
The actual finite S-integer K-group, its field image and compatible coefficient reduction maps from H.6/N.5 are needed to define the descending primary kernels.

TauCeti.ArithmeticKTheory.N6.positiveEvenK [generic signature above; arithmetic instantiation]
A supplied additive carrier and real-symbol map define the prescribed subgroup. Outside i≡1 mod 4 the arithmetic map-vanishing fact is an explicit input to the membership API; actual K/real comparison maps are supplied by M.7.

TauCeti.ArithmeticKTheory.N6.positiveK_rational_symbol [omitted example]
T.2/matsumoto supplies the field K₂ carrier and its Steinberg class {-1,-1}; T.5/real-sign-symbol supplies its actual real symbol. L.7 supplies finite-completion symbols, not the real map.

TauCeti.ArithmeticKTheory.N6.positiveK_imaginary [omitted example]
The actual K₂(Q(i)) carrier and its real-place indexing/completion map are missing; the generic empty-index API is already typed.

TauCeti.ArithmeticKTheory.N6.localSymbolFamily [generic signature above; arithmetic instantiation]
The product homomorphism is concrete. L.6/L.7 supply finite-completion components; T.2/matsumoto supplies the degree-two field carrier, T.5/real-sign-symbol the degree-two real map, and M.7 the higher real comparisons. Restriction/transfer require the displayed component squares/sums. Finite support and quotient orders are arithmetic inputs.

TauCeti.ArithmeticKTheory.N6.localSymbols_rational_minus_one [omitted example]
T.2/matsumoto supplies the actual K₂(Q) class; T.5/real-sign-symbol supplies the real map, and T.7/L.7 supply the Q₂ full Hilbert-symbol map.

TauCeti.ArithmeticKTheory.N6.localSymbols_no_real_term [omitted example]
M.7 must supply the genuine real K₄ finite quotient and comparison map; real coefficient H² alone is not that K-theoretic target.

TauCeti.ArithmeticKTheory.N6.localSymbols_unramified_residue [omitted example]
L.7 must supply actual Soulé boundary and finite-field K/twist identification maps, with ℓ unequal to the residue characteristic.

TauCeti.ArithmeticKTheory.N6.localSymbols_dyadic_degree_four [omitted example]
L.6/L.7 must supply D_i(Q₂) as the full actual K/cohomology quotient and its dyadic primary subgroup. ZMod 24 by itself would only restate the asserted order.

TauCeti.ArithmeticKTheory.N6.symbolWildKernel [generic signature above; arithmetic instantiation]
The kernel and universal lift use actual additive homomorphisms. Arithmetic restriction/transfer and degree-two raw equality require the displayed supplier squares and torsion-detection fact; G1 is not assumed.

TauCeti.ArithmeticKTheory.N6.symbolWild_rational [omitted example]
The actual K₂(Q) carrier and computation from T.5/k2-of-the-rationals, the real map from T.5/real-sign-symbol and finite maps from T.7/L.7 are required; a zero module cannot replace this kernel.

TauCeti.ArithmeticKTheory.N6.symbolWild_tame_nonexample [omitted example]
T.5/k2-of-the-integers and /k2-of-the-rationals supply the actual K₂(Z) class and map into K₂(Q); T.5/real-sign-symbol and T.7/L.7 supply its real and finite symbols.

TauCeti.ArithmeticKTheory.N6.symbolWild_special_minus_fourteen [omitted example]
The actual K₂(Q(√−14)) class, symbol and divisible subgroups are needed; the special-field predicate is already concrete.

TauCeti.ArithmeticKTheory.N6.globalMooreSequence [omitted named arithmetic statement]
L.6/L.7 must provide actual finite local quotient targets and their completion/symbol maps; M.2/M.7 must provide the global comparison and duality invariant sum, including real symbols.

TauCeti.ArithmeticKTheory.N6.primarySIntegerMooreSequence [omitted named arithmetic statement]
The preceding Moore maps must be supplied on actual S-integer primary K-subgroups, with residue boundaries and the local/global twist targets.

TauCeti.ArithmeticKTheory.N6.symbolWildOrder [omitted named arithmetic statement]
The actual finite arithmetic symbol kernel and positive S-integer K-group are needed before the Moore-sequence index/order statement can be typed.

TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel [generic signature above; arithmetic instantiation]
The strict kernel is the exact module-theoretic L2 specialisation with all local conditions zero. Arithmetic change of S still needs M.2 unramified identifications/factorisation; continuous H² comparison needs R02.1/tate-inverse-limit and R02.3/h1-finite on compatible finite modules. The typed inverse-limit API asserts only the kernel identity on compatible sections.

TauCeti.ArithmeticKTheory.N6.symbolCohomologicalComparison [omitted named arithmetic statement]
M.2/M.7 and L.7 must supply the actual K-to-H² comparison and localisation squares, with S containing all dyadic primes and the real comparison kernel.

TauCeti.ArithmeticKTheory.N6.twistedResidueNormTest [omitted named arithmetic statement]
M.2 supplies the finite-field root-twist module and Frobenius action; ClassFieldTheory Layer 0 supplies the faithful cyclic-module norm interface. I.1 supplies number-field towers elsewhere, not this finite-field test. The existing full-unit norm does not identify the twisted norm.

TauCeti.ArithmeticKTheory.N6.hilbertLocalNormCertification [omitted named arithmetic statement]
T.7/L.7 and existing ClassFieldTheory Layer 6 must supply the actual full Hilbert-symbol pairing and the local reciprocity map for the Kummer extension; an arbitrary pairing would omit the required norm-kernel property.

TauCeti.ArithmeticKTheory.N6.cyclotomicClassGroupDescent [omitted named arithmetic statement]
I.1/I.2 must supply the actual twisted S-class module, G-action and coinvariant/transition maps; M.2 supplies top-degree corestriction. S contains primes dividing m and ramified primes, and T is its full inverse image.

TauCeti.ArithmeticKTheory.N6.cyclotomicDivisibleImage [omitted named arithmetic statement]
The preceding actual class-group coinvariant-to-K or motivic map and ring-to-field localisation map are missing. G2 remains a proof boundary on the exceptional odd dyadic branch.

TauCeti.ArithmeticKTheory.N6.imaginaryEqualityCases [omitted named arithmetic statement]
Actual arithmetic K-groups, divisible subgroup and symbol maps, together with the preceding class-group comparison, are needed. The odd-prime/even-twist/nonexceptional hypotheses remain in the reader.

TauCeti.ArithmeticKTheory.N6.imaginarySpecialObstruction [omitted named arithmetic statement]
The actual finite symbol/divisible subgroups and obstruction homomorphism from cyclotomic homology are needed to state the index-two quotient. SpecialAtTwo itself already has a concrete signature.

TauCeti.ArithmeticKTheory.N6.realMotivicObstruction [omitted named arithmetic statement]
M.7 must supply actual motivic H², finite-coefficient localisation and the real comparison/edge maps; no proposition-valued obstruction substitute is used.

TauCeti.ArithmeticKTheory.N6.hiddenRealClassesDivisible [omitted named arithmetic statement]
M.7 must supply the actual dyadic K-to-H² kernel, cyclotomic spectral edge/d₂ and transfer on real embedding classes, with S containing all dyadic primes.

TauCeti.ArithmeticKTheory.N6.weibelSymbolDivisibility [omitted named arithmetic statement]
Actual field K-groups, symbol and divisible subgroups and their inclusion/obstruction map are needed. G1 is irrelevant to the symbol assertion; G2 remains its stated proof boundary.

TauCeti.ArithmeticKTheory.N6.rawSymbolKernelBoundary [omitted named arithmetic statement]
L.6/L.7 must supply actual full completion K-groups/maps as well as finite quotient maps. The generic degree-two detection lemma is typed, but higher arithmetic detection remains G1.

TauCeti.ArithmeticKTheory.N6.arithmeticCertificateEvidence [omitted named arithmetic statement]
The parent certificate engine must be instantiated on actual K-groups/presentation maps and independent cohomological orders. In degree 8k+4 the order is 2^ρ times |H²|; extension data determine structure.

-/
