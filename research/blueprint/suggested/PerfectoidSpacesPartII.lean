/-
Copyright (c) 2026 The Tau Ceti Atlas contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.RingTheory.IntegralClosure.IsIntegral.AlmostIntegral
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Filtration
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.FieldTheory.Perfect
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.Algebra.Category.ModuleCat.Limits
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Basic

/-!
# Perfectoid rings and spaces, Part II: ramification and Riemann extension

This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/PerfectoidSpacesPartII.md` is definitive. The statements here
suggest Lean forms, so that contributors and reviewers converge on names and signatures.

Only targets whose carriers exist at the pinned Mathlib (`082e2d3`) and Tau Ceti (`f790474`)
are stated. Perfectoid algebras, almost modules over a basic setup, uniform Banach algebras
and rational localisation are planned by PerfectoidSpaces and AdicSpacesPartII and are not at
the pins; the theorems of RA.1–RA.4 are therefore README targets. What is stated here:

* RA.0: root systems, almost zero modules, almost-pro-zero and uniformly almost-pro-zero
  towers, and their behaviour under limits and linear functors;
* RA.2: the p-root closure, the localised complete integral closure and the algebraic root
  saturation, with André's Remarque 2.5.6;
* RA.5: pure and almost pure linear maps, André's Krull detection lemma, and the purity of
  Kummer extensions of `W(k)⟦T_1,…,T_n⟧` at level `j = 0`.

Definitions have real bodies; theorems are proved by `sorry`.
-/

universe u

open CategoryTheory

namespace TauCeti

/-! ## RA.0 Almost-pro-zero towers -/

namespace Almost

/-- A compatible system of `p`-power roots of `t`: `root 0 = t` and `root (k+1) ^ p = root k`.
The roots are data. -/
structure RootSystem (A : Type u) [CommRing A] (p : ℕ) (t : A) where
  /-- The chosen root `t^{1/p^k}`. -/
  root : ℕ → A
  root_zero : root 0 = t
  root_succ : ∀ k, root (k + 1) ^ p = root k

variable {A : Type u} [CommRing A] {p : ℕ}

/-- The product of two root systems is a root system of the product: `(tg)^{1/p^k} = t^{1/p^k} g^{1/p^k}`. -/
def RootSystem.mul {t g : A} (r : RootSystem A p t) (s : RootSystem A p g) :
    RootSystem A p (t * g) where
  root k := r.root k * s.root k
  root_zero := by rw [r.root_zero, s.root_zero]
  root_succ k := by rw [mul_pow, r.root_succ, s.root_succ]

/-- The trivial root system of `1`. -/
def RootSystem.one : RootSystem A p 1 where
  root _ := 1
  root_zero := rfl
  root_succ _ := one_pow p

/-- A module is almost zero with respect to `t^{1/p^∞}` if every root of `t` kills it. -/
def IsAlmostZero {t : A} (r : RootSystem A p t) (M : Type*) [AddCommGroup M] [Module A M] :
    Prop :=
  ∀ (k : ℕ) (x : M), r.root k • x = 0

/-- The transition map `M_m → M_n` of a tower indexed by `ℕᵒᵖ`, for `n ≤ m`. -/
abbrev transition (M : ℕᵒᵖ ⥤ ModuleCat.{u} A) {n m : ℕ} (h : n ≤ m) :
    M.obj (Opposite.op m) ⟶ M.obj (Opposite.op n) :=
  M.map (homOfLE h).op

/-- Bhatt, Definition 3.2: a tower is almost-pro-zero if for all `k` and `n` some later
transition into `M_n` has image killed by `t^{1/p^k}`. -/
def IsAlmostProZero {t : A} (r : RootSystem A p t) (M : ℕᵒᵖ ⥤ ModuleCat.{u} A) : Prop :=
  ∀ k n : ℕ, ∃ m, ∃ h : n ≤ m, ∀ x : M.obj (Opposite.op m),
    r.root k • (transition M h).hom x = 0

/-- Ordinary pro-zero towers (EnhancedDerivedSheaves E2): some later transition is zero. -/
def IsProZero (M : ℕᵒᵖ ⥤ ModuleCat.{u} A) : Prop :=
  ∀ n : ℕ, ∃ m, ∃ h : n ≤ m, transition M h = 0

/-- Uniformly almost-pro-zero towers with respect to `g^{1/p^∞}` (in `t`-almost modules), with
constants `c k` independent of the tower index (Bhatt, Theorem 4.2(2) and Remark 4.3). -/
def IsUniformlyAlmostProZero {t g : A} (r : RootSystem A p t) (s : RootSystem A p g)
    (c : ℕ → ℕ) (M : ℕᵒᵖ ⥤ ModuleCat.{u} A) : Prop :=
  ∀ k n l : ℕ, ∀ x : M.obj (Opposite.op (n + c k)),
    (s.root k * r.root l) • (transition M (Nat.le_add_right n (c k))).hom x = 0

/-- Pro-zero towers are almost-pro-zero. -/
theorem IsAlmostProZero.of_isProZero {t : A} (r : RootSystem A p t)
    {M : ℕᵒᵖ ⥤ ModuleCat.{u} A} (hM : IsProZero M) : IsAlmostProZero r M := by
  sorry

/-- For the trivial root system of `1`, almost-pro-zero is pro-zero. -/
theorem isAlmostProZero_iff_isProZero_unit (M : ℕᵒᵖ ⥤ ModuleCat.{u} A) :
    IsAlmostProZero (RootSystem.one (A := A) (p := p)) M ↔ IsProZero M := by
  sorry

/-- A uniformly almost-pro-zero tower is almost-pro-zero for the root system of `tg`. -/
theorem IsUniformlyAlmostProZero.isAlmostProZero_mul {t g : A} (r : RootSystem A p t)
    (s : RootSystem A p g) {c : ℕ → ℕ} {M : ℕᵒᵖ ⥤ ModuleCat.{u} A}
    (hM : IsUniformlyAlmostProZero r s c M) : IsAlmostProZero (r.mul s) M := by
  sorry

/-- Bhatt, Lemma 3.4 in degree `0`: the limit of an almost-pro-zero tower is almost zero. -/
theorem IsAlmostProZero.limit_isAlmostZero {t : A} (r : RootSystem A p t)
    {M : ℕᵒᵖ ⥤ ModuleCat.{u} A} (hM : IsAlmostProZero r M) :
    IsAlmostZero r ((Limits.limit M : ModuleCat.{u} A) : Type u) := by
  sorry

/-- Bhatt, Lemma 3.6: an `A`-linear functor preserves almost-pro-zero towers. -/
theorem IsAlmostProZero.map_linear {t : A} (r : RootSystem A p t)
    {M : ℕᵒᵖ ⥤ ModuleCat.{u} A} (hM : IsAlmostProZero r M)
    (F : ModuleCat.{u} A ⥤ ModuleCat.{u} A) [F.Additive] [F.Linear A] :
    IsAlmostProZero r (M ⋙ F) := by
  sorry

/-- The zero tower is almost-pro-zero. -/
example {t : A} (r : RootSystem A p t) :
    IsAlmostProZero r ((Functor.const ℕᵒᵖ).obj (ModuleCat.of A PUnit)) := by
  sorry

/-- A constant tower `A` with identity transitions is almost-pro-zero only if the roots of `t`
vanish: the image of every transition is all of `A`. -/
example {t : A} (r : RootSystem A p t)
    (h : IsAlmostProZero r ((Functor.const ℕᵒᵖ).obj (ModuleCat.of A A))) (k : ℕ) :
    r.root k = 0 := by
  sorry

end Almost

/-! ## RA.2 p-root closure, complete integral closure and root saturation -/

section Closures

variable (p : ℕ) (R S : Type*) [CommRing R] [CommRing S] [Algebra R S]

/-- A subset `T` of `S` is `p`-root closed if `s ^ p ∈ T` implies `s ∈ T` (André A §2.3.1). -/
def IsPRootClosed {S : Type*} [CommRing S] (T : Set S) : Prop :=
  ∀ s : S, s ^ p ∈ T → s ∈ T

/-- The `p`-root closure `R^†_S`: the smallest `p`-root closed `R`-subalgebra of `S`. -/
def pRootClosure : Subalgebra R S :=
  sInf {T : Subalgebra R S | IsPRootClosed p (T : Set S)}

/-- The `p`-root closure is contained in the integral closure. -/
theorem pRootClosure_le_integralClosure (hp : 0 < p) :
    pRootClosure p R S ≤ integralClosure R S := by
  sorry

/-- In characteristic `p` the `p`-root closure is the set of `p`-radicial elements. -/
theorem mem_pRootClosure_of_charP [Fact p.Prime] [CharP S p] (s : S) :
    s ∈ pRootClosure p R S ↔ ∃ n : ℕ, s ^ (p ^ n) ∈ (algebraMap R S).range := by
  sorry

/-- `Z` is `3`-root closed in `Z[i]` although `i` is integral: the `p`-root closure is not the
integral closure. -/
example : pRootClosure 3 ℤ GaussianInt = ⊥ := by
  sorry

/-- André A (2.18): the localised complete integral closure of `R` in `R[1/g]`. -/
def completeIntegralClosureAway (g : R) : Set (Localization.Away g) :=
  {s | ∃ m : ℕ, ∀ n : ℕ,
    algebraMap R (Localization.Away g) (g ^ m) * s ^ n ∈ (algebraMap R (Localization.Away g)).range}

/-- The localised complete integral closure is contained in Mathlib's complete integral closure
when `g` is a nonzerodivisor. -/
theorem completeIntegralClosureAway_le_completeIntegralClosure (g : R) (hg : g ∈ nonZeroDivisors R) :
    completeIntegralClosureAway R g ⊆
      (completeIntegralClosure R (Localization.Away g) : Set (Localization.Away g)) := by
  sorry

/-- The algebraic root saturation `g^{-1/p^∞}B = {b | g^{1/p^k} b ∈ B for all k}`. -/
def rootSaturation {g : S} (σ : Almost.RootSystem S p g) (B : Set S) : Set S :=
  {b | ∀ k : ℕ, σ.root k * b ∈ B}

/-- André A, Remarque 2.5.6: for a nonzerodivisor `t` with compatible roots, the complete integral
closure of `R` in `R[1/t]` is the root saturation of the `p`-root closure. -/
theorem completeIntegralClosure_eq_rootSaturation_pRootClosure [Fact p.Prime] (t : R)
    (ht : t ∈ nonZeroDivisors R) (τ : Almost.RootSystem R p t) :
    completeIntegralClosureAway R t =
      rootSaturation p (Localization.Away t)
        { root := fun k => algebraMap R (Localization.Away t) (τ.root k)
          root_zero := by rw [τ.root_zero]
          root_succ := fun k => by rw [← map_pow, τ.root_succ] }
        (pRootClosure p R (Localization.Away t) : Set (Localization.Away t)) := by
  sorry

end Closures

/-! ## RA.5 Purity, almost purity and Kummer towers -/

namespace Module

variable {R : Type u} [CommRing R] {M N : Type u} [AddCommGroup M] [Module R M]
  [AddCommGroup N] [Module R N]

/-- André B, Annexe A.1: a linear map is pure (universally injective) if it stays injective after
tensoring with every module. -/
def IsPure (f : M →ₗ[R] N) : Prop :=
  ∀ (P : Type u) [AddCommGroup P] [Module R P], Function.Injective (f.lTensor P)

/-- André B, Annexe A.4: almost purity relative to an ideal `I` (in practice idempotent): the
kernels after tensoring are killed by `I`. -/
def IsAlmostPure (I : Ideal R) (f : M →ₗ[R] N) : Prop :=
  ∀ (P : Type u) [AddCommGroup P] [Module R P],
    ∀ x ∈ LinearMap.ker (f.lTensor P), ∀ a ∈ I, a • x = 0

/-- A pure map is injective. -/
theorem IsPure.injective {f : M →ₗ[R] N} (hf : IsPure f) : Function.Injective f := by
  sorry

/-- Pure maps are almost pure for every ideal. -/
theorem IsAlmostPure.of_isPure {f : M →ₗ[R] N} (hf : IsPure f) (I : Ideal R) :
    IsAlmostPure I f := by
  sorry

/-- For the unit ideal, almost purity is purity. -/
theorem isAlmostPure_trivial_setup (f : M →ₗ[R] N) : IsAlmostPure ⊤ f ↔ IsPure f := by
  sorry

/-- A faithfully flat algebra is pure over its base. -/
theorem isPure_of_faithfullyFlat (S : Type u) [CommRing S] [Algebra R S]
    [Module.FaithfullyFlat R S] : IsPure (Algebra.linearMap R S) := by
  sorry

/-- Multiplication by `2` on `ℤ` is injective but not pure (tensor with `ℤ/2`). -/
example : ¬ IsPure ((2 : ℤ) • LinearMap.id : ℤ →ₗ[ℤ] ℤ) := by
  sorry

end Module

/-- André B, Lemme 1.1.2: Krull detection along a faithfully flat algebra with an idempotent
ideal killing `S ⊗ M`. -/
theorem krull_detection_of_idempotent {R S M : Type u} [CommRing R] [IsNoetherianRing R]
    [CommRing S] [Algebra R S] [Module.FaithfullyFlat R S] [AddCommGroup M] [Module R M]
    [Module.Finite R M] (K : Ideal S) (hK : IsIdempotentElem K)
    (hKM : ∀ a ∈ K, ∀ y : TensorProduct R S M, a • y = 0) (s : R)
    (hs : algebraMap R S s ∈ K) :
    ∃ r ∈ Module.annihilator R M, (1 - r) * s = 0 := by
  sorry

namespace KummerTower

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p] (n : ℕ)

/-- The base `A = W(k)⟦T_1,…,T_n⟧` of André B §2.2. -/
abbrev Base := MvPowerSeries (Fin n) (WittVector p k)

/-- The Kummer algebra `A[X]/(X^{p^e} − g)[1/p]`, the level `(0, e)` of André B (8).
The root is freely adjoined: no irreducibility or domain instance is intended. -/
abbrev kummerAlgebra (g : Base p k n) (e : ℕ) :=
  Localization.Away ((p : AdjoinRoot (Polynomial.X ^ (p ^ e) - Polynomial.C g)))

/-- A free root algebra can have zero divisors even for a unit radicand. This is the
rational counterpart of the packet test `kummerTower_unit_not_identity`. -/
example :
    let f : Polynomial ℚ := Polynomial.X ^ 2 - Polynomial.C 1
    let z := AdjoinRoot.root f
    z - 1 ≠ 0 ∧ z + 1 ≠ 0 ∧ (z - 1) * (z + 1) = 0 := by
  sorry

/-- André B, Corollaire 2.6.1 at level `(0, e)`: `A` is pure in the integral closure of `A` in
`A[g^{1/p^e}][1/p]`. This is integral closure relative to that algebra,
not normalization in its total quotient ring; equivalently, being finite over `A`, it is an `A`-module direct summand. -/
theorem isPure_kummer (g : Base p k n) (hg : g ≠ 0) (e : ℕ) :
    Module.IsPure (Algebra.linearMap (Base p k n)
      (integralClosure (Base p k n) (kummerAlgebra p k n g e))) := by
  sorry

/-- At level `(0, 0)` the integral closure of `A` in `A[1/p]` is `A`. -/
example (g : Base p k n) :
    Function.Surjective (algebraMap (Base p k n)
      (integralClosure (Base p k n) (Localization.Away (p : Base p k n)))) := by
  sorry

end KummerTower

end TauCeti
