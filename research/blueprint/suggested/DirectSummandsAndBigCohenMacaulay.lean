/-
Copyright (c) 2026 The Tau Ceti Atlas contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.IntegralClosure.IsIntegralClosure.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.Ideal.Over
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.FieldTheory.Separable
import Mathlib.FieldTheory.Perfect
import TauCeti.RingTheory.Flat.Pi

/-!
# Direct summands and big Cohen–Macaulay algebras

This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/DirectSummandsAndBigCohenMacaulay.md` is definitive. The statements
here suggest Lean forms, so that contributors and reviewers converge on names and signatures.

Only targets whose carriers exist at the pinned Mathlib (`082e2d3`) and Tau Ceti (`f790474`)
are stated. Perfectoid and almost algebra, partial algebra modifications, the splitting
obstruction in the derived category and `RΓ(X, 𝒪_X)` for proper schemes are not at the pins
(they are planned by PerfectoidSpaces, PerfectoidSpacesPartII, EnhancedDerivedSheaves and this
roadmap's README), so the theorems of DS.3, DS.7 and most of DS.4 are README targets. What is
stated here:

* DS.0: split algebras, splinters, systems of parameters, big and balanced big Cohen–Macaulay
  modules, completion, flatness over regular local rings, the characteristic-zero and
  low-dimensional cases;
* DS.1: the pure-to-split theorem over complete local rings and the characteristic-`p` theorem;
* DS.2: the adic splitting criterion and André's theorem for `W(k)⟦T_1, …, T_n⟧`;
* DS.4: almost Cohen–Macaulay algebras (with an explicit root system), existence of balanced
  big Cohen–Macaulay algebras, the Hochster–Huneke theorem for `R⁺` in characteristic `p`;
* DS.5–DS.6: the direct summand theorem, flat domination, `R → R⁺`, contracted ideals, the
  monomial theorem and Cohen–Macaulayness of pure subrings of regular rings.

Purity is planned in PerfectoidSpacesPartII RA.5 and systems of parameters in
DeformationAndDerivedPatchingAlgebra R03.3; light versions are restated here so that the file
elaborates. Definitions have real bodies; theorems are proved by `sorry`.
-/

universe u

open IsLocalRing TensorProduct

namespace TauCeti

/-! ## DS.0 Split algebras and splinters -/

namespace Algebra

variable (R S : Type u) [CommRing R] [CommRing S] [_root_.Algebra R S]

/-- `S` is split over `R`: some `R`-linear map `ρ : S → R` satisfies `ρ 1 = 1`. The map is not
required to be multiplicative. -/
def IsSplit : Prop :=
  ∃ ρ : S →ₗ[R] R, ρ 1 = 1

/-- `R → S` is pure (universally injective): `P → P ⊗[R] S` is injective for every `R`-module `P`.
Restated from PerfectoidSpacesPartII RA.5 (`RingHom.IsPure` there) so that this file elaborates. -/
def IsPure : Prop :=
  ∀ (P : Type u) [AddCommGroup P] [Module R P],
    Function.Injective (fun x : P => x ⊗ₜ[R] (1 : S))

variable {R S}

theorem IsSplit.iff_eval_surjective :
    IsSplit R S ↔ Function.Surjective (fun f : S →ₗ[R] R => f 1) := by
  sorry

theorem IsSplit.injective (h : IsSplit R S) : Function.Injective (algebraMap R S) := by
  sorry

theorem IsSplit.comp {T : Type u} [CommRing T] [_root_.Algebra S T] [_root_.Algebra R T]
    [IsScalarTower R S T] (h₁ : IsSplit R S) (h₂ : IsSplit S T) : IsSplit R T := by
  sorry

theorem IsSplit.of_comp {T : Type u} [CommRing T] [_root_.Algebra S T] [_root_.Algebra R T]
    [IsScalarTower R S T] (h : IsSplit R T) : IsSplit R S := by
  sorry

theorem IsSplit.baseChange (R' : Type u) [CommRing R'] [_root_.Algebra R R'] (h : IsSplit R S) :
    IsSplit R' (R' ⊗[R] S) := by
  sorry

theorem IsSplit.isPure (h : IsSplit R S) : IsPure R S := by
  sorry

theorem IsSplit.iff_isPure_of_finitePresentation [Module.FinitePresentation R S] :
    IsSplit R S ↔ IsPure R S := by
  sorry

theorem IsSplit.of_localization_maximal [IsNoetherianRing R] [Module.Finite R S]
    (h : ∀ (m : Ideal R) [m.IsMaximal],
      IsSplit (Localization.AtPrime m) (Localization.AtPrime m ⊗[R] S)) :
    IsSplit R S := by
  sorry

theorem IsSplit.of_faithfullyFlat_baseChange [IsNoetherianRing R] [Module.Finite R S]
    (R' : Type u) [CommRing R'] [_root_.Algebra R R'] [Module.FaithfullyFlat R R']
    (h : IsSplit R' (R' ⊗[R] S)) : IsSplit R S := by
  sorry

/-- Unit test `isSplit_polynomial`: evaluation at `0` splits `R → R[X]`. -/
example : IsSplit R (Polynomial R) := by
  sorry

/-- Unit test `isSplit_gaussian`: `ℤ → ℤ[i]` is split by the coefficient of `1`. -/
example : IsSplit ℤ GaussianInt := by
  sorry

/-- Unit test `not_isSplit_int_rat`: `ℤ → ℚ` is injective and flat but not split. -/
example : ¬ IsSplit ℤ ℚ := by
  sorry

/-- Unit test: over a field every nonzero algebra splits. -/
example (K L : Type u) [Field K] [CommRing L] [_root_.Algebra K L] [Nontrivial L] :
    IsSplit K L := by
  sorry

end Algebra

/-- A splinter: a reduced Noetherian ring over which every finite injective algebra splits. -/
def IsSplinter (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ IsReduced R ∧
    ∀ (S : Type u) [CommRing S] [_root_.Algebra R S], Module.Finite R S →
      Function.Injective (algebraMap R S) → Algebra.IsSplit R S

section Splinter

variable {R : Type u} [CommRing R]

theorem IsSplinter.isSplit (h : IsSplinter R) (S : Type u) [CommRing S] [_root_.Algebra R S]
    [Module.Finite R S] (hinj : Function.Injective (algebraMap R S)) : Algebra.IsSplit R S :=
  h.2.2 S inferInstance hinj

theorem IsSplinter.isPure_of_isIntegral (h : IsSplinter R) (S : Type u) [CommRing S]
    [_root_.Algebra R S] [_root_.Algebra.IsIntegral R S]
    (hinj : Function.Injective (algebraMap R S)) : Algebra.IsPure R S := by
  sorry

theorem IsSplinter.contracted_ideal (h : IsSplinter R) (S : Type u) [CommRing S]
    [_root_.Algebra R S] [_root_.Algebra.IsIntegral R S]
    (hinj : Function.Injective (algebraMap R S)) (I : Ideal R) :
    (I.map (algebraMap R S)).comap (algebraMap R S) = I := by
  sorry

theorem IsSplinter.isIntegrallyClosed [IsDomain R] (h : IsSplinter R) : IsIntegrallyClosed R := by
  sorry

theorem IsSplinter.of_ringEquiv {R' : Type u} [CommRing R'] (e : R ≃+* R') (h : IsSplinter R) :
    IsSplinter R' := by
  sorry

/-- Unit test `isSplinter_field`. -/
example (K : Type u) [Field K] : IsSplinter K := by
  sorry

/-- Unit test `isSplinter_int`. -/
example : IsSplinter ℤ := by
  sorry

/-- Unit test `not_isSplinter_dual_numbers`: `K[ε]/(ε²)` is excluded by reducedness, although
it is self-injective and every finite injective algebra over it splits. -/
example (K : Type u) [Field K] : ¬ IsSplinter (DualNumber K) := by
  sorry

/-- Unit test `isSplinter_iff_isIntegrallyClosed_of_charZero` (Bhatt 2012, Example 1.1). -/
theorem isSplinter_iff_isIntegrallyClosed_of_algebraRat [IsDomain R] [IsNoetherianRing R]
    [_root_.Algebra ℚ R] : IsSplinter R ↔ IsIntegrallyClosed R := by
  sorry

end Splinter

/-! ## DS.0 Systems of parameters and big Cohen–Macaulay modules -/

section BigCM

variable {R : Type u} [CommRing R] [IsLocalRing R]

/-- A system of parameters of a local ring: `dim R` elements of the maximal ideal generating an
ideal whose radical is the maximal ideal. Planned in DeformationAndDerivedPatchingAlgebra R03.3;
restated here so that this file elaborates. -/
def IsSystemOfParameters (x : List R) : Prop :=
  ringKrullDim R = x.length ∧ (∀ r ∈ x, r ∈ maximalIdeal R) ∧
    (Ideal.ofList x).radical = maximalIdeal R

variable (R) (M : Type*) [AddCommGroup M] [Module R M]

/-- `M` is big Cohen–Macaulay for the system of parameters `x`: `x` is weakly regular on `M` and
`M ≠ 𝔪 M`. No finiteness is imposed on `M`. -/
def IsBigCohenMacaulayFor (x : List R) : Prop :=
  IsSystemOfParameters x ∧ RingTheory.Sequence.IsWeaklyRegular M x ∧
    (⊤ : Submodule R M) ≠ maximalIdeal R • ⊤

/-- `M` is balanced big Cohen–Macaulay: `M ≠ 𝔪 M` and every system of parameters is weakly
regular on `M`. -/
def IsBalancedBigCohenMacaulay : Prop :=
  (⊤ : Submodule R M) ≠ maximalIdeal R • ⊤ ∧
    ∀ x : List R, IsSystemOfParameters x → RingTheory.Sequence.IsWeaklyRegular M x

/-- `M` is big Cohen–Macaulay: big Cohen–Macaulay for some system of parameters. -/
def IsBigCohenMacaulay : Prop :=
  ∃ x : List R, IsBigCohenMacaulayFor R M x

variable {R M}

theorem IsBigCohenMacaulayFor.of_linearEquiv {N : Type*} [AddCommGroup N] [Module R N]
    (e : M ≃ₗ[R] N) {x : List R} (h : IsBigCohenMacaulayFor R M x) :
    IsBigCohenMacaulayFor R N x := by
  sorry

theorem IsBigCohenMacaulayFor.iff_isRegular {x : List R} :
    IsBigCohenMacaulayFor R M x ↔
      IsSystemOfParameters x ∧ RingTheory.Sequence.IsRegular M x := by
  sorry

theorem IsBalancedBigCohenMacaulay.isBigCohenMacaulayFor (h : IsBalancedBigCohenMacaulay R M)
    {x : List R} (hx : IsSystemOfParameters x) : IsBigCohenMacaulayFor R M x :=
  ⟨hx, h.2 x hx, h.1⟩

theorem IsBigCohenMacaulayFor.monomial_not_mem {x : List R} (h : IsBigCohenMacaulayFor R M x)
    {t : ℕ} (ht : 1 ≤ t) :
    ¬ (Ideal.span {x.prod ^ (t - 1)} • (⊤ : Submodule R M) ≤ Ideal.ofList (x.map (· ^ t)) • ⊤) := by
  sorry

/-- Unit test `isBigCM_dim_zero`: over a field every nonzero module is balanced big
Cohen–Macaulay. -/
example (K : Type u) [Field K] (N : Type*) [AddCommGroup N] [Module K N] [Nontrivial N] :
    IsBalancedBigCohenMacaulay K N := by
  sorry

/-- Unit test `not_isBigCM_rat_over_zp`: `p` is a nonzerodivisor on `ℚ_[p]` but
`ℚ_[p] = p ℚ_[p]`, so `ℚ_[p]` is not big Cohen–Macaulay over `ℤ_[p]`. -/
example (p : ℕ) [Fact p.Prime] : ¬ IsBigCohenMacaulayFor ℤ_[p] ℚ_[p] [(p : ℤ_[p])] := by
  sorry

/-- Completion turns a big Cohen–Macaulay module into a balanced one
(node `DS.0/completion-balances`). -/
theorem IsBigCohenMacaulayFor.adicCompletion_isBalanced [IsNoetherianRing R] {x : List R}
    (h : IsBigCohenMacaulayFor R M x) :
    IsBalancedBigCohenMacaulay R (AdicCompletion (maximalIdeal R) M) := by
  sorry

end BigCM

section RegularLocal

variable {R : Type u} [CommRing R] [IsRegularLocalRing R]

/-- Unit test `isBalancedBigCM_regular_self`: a regular local ring is balanced big
Cohen–Macaulay over itself. -/
example : IsBalancedBigCohenMacaulay R R := by
  sorry

/-- Balanced big Cohen–Macaulay modules over a regular local ring are faithfully flat
(André B, Remarque 4.2.1; node `DS.0/regular-big-cm-flat`). -/
theorem IsBalancedBigCohenMacaulay.faithfullyFlat_of_isRegularLocalRing {M : Type*}
    [AddCommGroup M] [Module R M] (h : IsBalancedBigCohenMacaulay R M) :
    Module.FaithfullyFlat R M := by
  sorry

end RegularLocal

/-! ## DS.0 The characteristic-zero and low-dimensional cases -/

/-- Every Noetherian regular ring containing `ℚ` is a splinter (trace splitting;
node `DS.0/trace-retraction`). -/
theorem isSplinter_of_isRegularRing_of_algebraRat (R : Type u) [CommRing R] [IsRegularRing R]
    [_root_.Algebra ℚ R] : IsSplinter R := by
  sorry

/-- The direct summand theorem in dimension at most two (node `DS.0/low-dimension-direct-summand`). -/
theorem isSplinter_of_ringKrullDim_le_two (R : Type u) [CommRing R] [IsRegularLocalRing R]
    (h : ringKrullDim R ≤ 2) : IsSplinter R := by
  sorry

/-! ## DS.1 Hochster's purity criteria and characteristic `p` -/

/-- Pure maps out of a complete Noetherian local ring split (node `DS.1/complete-pure-split`).
Completeness cannot be weakened to excellent Henselian (Datta–Murayama). -/
theorem isSplit_of_isPure_of_isAdicComplete {R S : Type u} [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [IsAdicComplete (maximalIdeal R) R] [CommRing S] [_root_.Algebra R S]
    (h : Algebra.IsPure R S) : Algebra.IsSplit R S := by
  sorry

/-- The direct summand theorem in characteristic `p` (node `DS.1/frobenius-direct-summand`). -/
theorem isSplinter_of_isRegularRing_of_charP (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [IsRegularRing R] : IsSplinter R := by
  sorry

/-! ## DS.2 André's theorem for `W(k)⟦T_1, …, T_n⟧` -/

/-- Splittings modulo all powers of an ideal in the Jacobson radical give a splitting
(node `DS.2/adic-splitting-criterion`). -/
theorem isSplit_of_forall_isSplit_quotient_pow {A S : Type u} [CommRing A] [IsNoetherianRing A]
    [CommRing S] [_root_.Algebra A S] [Module.Finite A S] (I : Ideal A)
    (hI : I ≤ Ideal.jacobson ⊥)
    (h : ∀ m : ℕ, Algebra.IsSplit (A ⧸ I ^ m) (S ⧸ (I ^ m).map (algebraMap A S))) :
    Algebra.IsSplit A S := by
  sorry

/-- André's direct summand theorem for `W(k)⟦T_1, …, T_n⟧` (André B, Théorème 0.2.1;
node `DS.2/andre-unramified-direct-summand`). -/
theorem isSplinter_witt_powerSeries (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] (n : ℕ) : IsSplinter (MvPowerSeries (Fin n) (WittVector p k)) := by
  sorry

/-! ## DS.3 Bhatt's theorem for complete regular local rings -/

/-- Every complete regular local ring of mixed characteristic `(0, p)`, ramified or not, is a
splinter (Bhatt, Theorem 5.4; node `DS.3/bhatt-direct-summand`). The perfectoid cover, the
obstruction detection and the annular argument are README targets. -/
theorem isSplinter_of_isRegularLocalRing_of_mixedChar (R : Type u) [CommRing R]
    [IsRegularLocalRing R] [IsAdicComplete (maximalIdeal R) R] [CharZero R] (p : ℕ)
    [Fact p.Prime] [CharP (ResidueField R) p] : IsSplinter R := by
  sorry

/-! ## DS.4 Big Cohen–Macaulay algebras -/

section AlmostCM

variable {B : Type u} [CommRing B] [IsLocalRing B]

/-- `D` is almost Cohen–Macaulay for `(B, x, π^{1/p^∞})` (André B, Définition 4.1.1(3)):
`π = π 0` is a nonzerodivisor with chosen roots `π (h + 1) ^ p = π h`, some root lies outside
`𝔪_B D`, and every root kills the colon modules `((x_1, …, x_i) : x_{i+1}) / (x_1, …, x_i)`. -/
def IsAlmostCohenMacaulay (x : List B) (D : Type u) [CommRing D] [_root_.Algebra B D] (p : ℕ)
    (π : ℕ → D) : Prop :=
  IsSystemOfParameters x ∧ IsSMulRegular D (π 0) ∧ (∀ h, π (h + 1) ^ p = π h) ∧
    (∃ h, π h ∉ ((maximalIdeal B).map (algebraMap B D))) ∧
    ∀ (i : Fin x.length) (h : ℕ) (d : D),
      algebraMap B D x[i] * d ∈ (Ideal.ofList (x.take i)).map (algebraMap B D) →
        π h * d ∈ (Ideal.ofList (x.take i)).map (algebraMap B D)

/-- A big Cohen–Macaulay algebra is almost Cohen–Macaulay for the trivial root system of `1`. -/
theorem IsAlmostCohenMacaulay.of_isBigCohenMacaulayFor {x : List B} {D : Type u} [CommRing D]
    [_root_.Algebra B D] (p : ℕ) (h : IsBigCohenMacaulayFor B D x) :
    IsAlmostCohenMacaulay x D p (fun _ => 1) := by
  sorry

/-- An almost Cohen–Macaulay algebra yields a balanced big Cohen–Macaulay algebra
(André B, Proposition 4.1.2; node `DS.4/almost-cm-to-big-cm`). -/
theorem exists_balancedBigCM_of_almostCM [IsNoetherianRing B] (p : ℕ) [Fact p.Prime]
    [CharP (ResidueField B) p] {x : List B} {D : Type u} [CommRing D] [_root_.Algebra B D]
    {π : ℕ → D} (h : IsAlmostCohenMacaulay x D p π) :
    ∃ (C : Type u) (_ : CommRing C) (_ : _root_.Algebra B C), IsBalancedBigCohenMacaulay B C := by
  sorry

end AlmostCM

/-- Every Noetherian local ring has a balanced big Cohen–Macaulay algebra
(André B, Théorème 0.7.1, with Hochster–Huneke in equal characteristic;
node `DS.4/big-cm-existence`). -/
theorem exists_balancedBigCohenMacaulay (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] :
    ∃ (C : Type u) (_ : CommRing C) (_ : _root_.Algebra R C), IsBalancedBigCohenMacaulay R C := by
  sorry

/-- André's existence theorem in mixed characteristic (André B, Théorème 0.7.1, §4.2;
node `DS.4/mixed-char-big-cm-existence`). -/
theorem exists_balancedBigCM_of_mixedChar (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [CharZero R] (p : ℕ) [Fact p.Prime] [CharP (ResidueField R) p] :
    ∃ (C : Type u) (_ : CommRing C) (_ : _root_.Algebra R C), IsBalancedBigCohenMacaulay R C := by
  sorry

/-- Existence in equal characteristic zero (Hochster–Huneke; node `DS.4/equal-char-zero-big-cm`,
gap G1 in the README). -/
theorem exists_balancedBigCM_of_algebraRat (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] [_root_.Algebra ℚ R] :
    ∃ (C : Type u) (_ : CommRing C) (_ : _root_.Algebra R C), IsBalancedBigCohenMacaulay R C := by
  sorry

/-- Hochster–Huneke: in characteristic `p`, the absolute integral closure of a complete local
domain is balanced big Cohen–Macaulay (node `DS.4/char-p-absolute-integral-closure`). -/
theorem absoluteIntegralClosure_isBalancedBigCM_of_charP (R : Type u) [CommRing R] [IsDomain R]
    [IsLocalRing R] [IsNoetherianRing R] [IsAdicComplete (maximalIdeal R) R] (p : ℕ)
    [Fact p.Prime] [CharP R p] :
    IsBalancedBigCohenMacaulay R (integralClosure R (AlgebraicClosure (FractionRing R))) := by
  sorry

/-! ## DS.5 The direct summand theorem and flat domination -/

/-- **The direct summand theorem** (André B, Théorème 0.1.1; Bhatt, Theorem 1.1;
node `DS.5/direct-summand-theorem`): every Noetherian regular ring is a splinter. -/
theorem isSplinter_of_isRegularRing (R : Type u) [CommRing R] [IsRegularRing R] :
    IsSplinter R := by
  sorry

/-- Products of flat modules over a Noetherian ring are flat (node `DS.5/flat-products-noetherian`;
Tau Ceti has the finite case `Module.Flat.pi`). -/
theorem _root_.Module.Flat.pi_of_isNoetherianRing (R : Type u) [CommRing R] [IsNoetherianRing R]
    {ι : Type*} (M : ι → Type*) [∀ i, AddCommGroup (M i)] [∀ i, Module R (M i)]
    [∀ i, Module.Flat R (M i)] : Module.Flat R (∀ i, M i) := by
  sorry

/-- Finite covers of regular rings are dominated by faithfully flat algebras
(André B, Théorème 0.7.2; node `DS.5/finite-cover-flat-domination`). -/
theorem exists_faithfullyFlat_of_finite_of_isRegularRing {R S : Type u} [CommRing R]
    [IsRegularRing R] [CommRing S] [_root_.Algebra R S] [Module.Finite R S]
    (hinj : Function.Injective (algebraMap R S)) :
    ∃ (T : Type u) (_ : CommRing T) (_ : _root_.Algebra S T) (_ : _root_.Algebra R T)
      (_ : IsScalarTower R S T), Module.FaithfullyFlat R T := by
  sorry

/-- `R → R⁺` splits for a complete regular local ring (node `DS.5/absolute-integral-closure-splits`). -/
theorem isSplit_absoluteIntegralClosure (R : Type u) [CommRing R] [IsDomain R]
    [IsRegularLocalRing R] [IsAdicComplete (maximalIdeal R) R] :
    Algebra.IsSplit R (integralClosure R (AlgebraicClosure (FractionRing R))) := by
  sorry

/-- Contracted ideals (André B, §0.1(2)): ideals of a regular ring are contracted from every
integral extension. -/
theorem comap_map_eq_of_isRegularRing {R S : Type u} [CommRing R] [IsRegularRing R] [CommRing S]
    [_root_.Algebra R S] [_root_.Algebra.IsIntegral R S]
    (hinj : Function.Injective (algebraMap R S)) (I : Ideal R) :
    (I.map (algebraMap R S)).comap (algebraMap R S) = I := by
  sorry

/-- The monomial theorem (node `DS.5/homological-consequences`; André B §0.1(4), corrected). -/
theorem monomial_not_mem_of_lt {R : Type u} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    {x : List R} (hx : IsSystemOfParameters x) {m n : ℕ} (h : m < n) :
    x.prod ^ m ∉ Ideal.ofList (x.map (· ^ n)) := by
  sorry

/-! ## DS.6 Pure subrings of regular rings -/

/-- Weak functoriality of big Cohen–Macaulay algebras for regular targets
(André B §4.4; node `DS.6/weak-functoriality-regular-target`). -/
theorem exists_bigCM_square_of_isRegularLocalRing_target (B B' : Type u) [CommRing B]
    [IsDomain B] [IsLocalRing B] [IsNoetherianRing B] [IsAdicComplete (maximalIdeal B) B]
    [CommRing B'] [IsRegularLocalRing B'] [IsAdicComplete (maximalIdeal B') B']
    [_root_.Algebra B B'] [IsLocalHom (algebraMap B B')]
    (hinj : Function.Injective (algebraMap B B')) [CharZero B] (p : ℕ) [Fact p.Prime]
    [CharP (ResidueField B) p] [Algebra.IsSeparable (ResidueField B) (ResidueField B')] :
    ∃ (C C' : Type u) (_ : CommRing C) (_ : CommRing C') (_ : _root_.Algebra B C)
      (_ : _root_.Algebra B' C') (γ : C →+* C'),
      IsBalancedBigCohenMacaulay B C ∧ IsBalancedBigCohenMacaulay B' C' ∧
        γ.comp (algebraMap B C) = (algebraMap B' C').comp (algebraMap B B') := by
  sorry

/-- Pure subrings of regular local rings of mixed characteristic are Cohen–Macaulay
(André B, Théorème 4.4.2; node `DS.6/pure-subring-of-regular-is-cm`): some system of parameters
of `B` is a regular sequence on `B`. -/
theorem exists_isBigCohenMacaulayFor_self_of_isPure (B B' : Type u) [CommRing B] [IsLocalRing B]
    [IsNoetherianRing B] [CommRing B'] [IsRegularLocalRing B'] [_root_.Algebra B B']
    [IsLocalHom (algebraMap B B')] (hpure : Algebra.IsPure B B') [CharZero B] (p : ℕ)
    [Fact p.Prime] [CharP (ResidueField B) p]
    [Algebra.IsSeparable (ResidueField B) (ResidueField B')] :
    ∃ x : List B, IsBigCohenMacaulayFor B B x := by
  sorry

end TauCeti
