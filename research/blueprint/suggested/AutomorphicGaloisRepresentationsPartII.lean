/-
# Galois representations attached to regular algebraic automorphic representations of GL_n

This file is not the roadmap and is not exhaustive. The definitive specification
is research/blueprint/readmes/AutomorphicGaloisRepresentationsPartII.md. These
signatures suggest forms and conventions; they claim no implementation.
Proving all of them would not complete a layer or this roadmap.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

Only light coordinate definitions and statements on existing carriers appear
here. Automorphic representations, PEL towers, period comparisons, compatible
systems and local Langlands parameters are README targets. The generic Hecke
polynomial and Galois-type ideals belong to the existing upstream roadmap
IntegralHeckeAndGaloisDeterminants, Layers 3a and 3b. The polynomial examples
below check the automorphic normalization without defining those objects again.

The matrix examples distinguish the semisimple Weil part from monodromy; they
are algebraic checks, not substitutes for a Weil--Deligne or period comparison.
-/

import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RingTheory.Polynomial.Vieta
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Algebra.Field.ZMod
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic.NormNum

namespace TauCeti.AutomorphicGalois

open Polynomial
open scoped BigOperators

/-! ## AG2.0: finite coordinate specializations of AF.4 -/

/-- Dominant GL_n coordinates at each embedding. The algebraic representation
of highest weight a is imported from AF.4, not constructed here. -/
def DominantWeight (n : ℕ) (ι : Type*) :=
  ι → {a : Fin n → ℤ // Antitone a}

/-- The purity-weight relation; c is the conjugation map on embeddings. -/
def DominantWeight.IsInW {n : ℕ} {ι : Type*}
    (c : ι → ι) (w : ℤ) (a : DominantWeight n ι) : Prop :=
  ∀ τ (i : Fin n), (a τ).1 i + (a (c τ)).1 i.rev = w

/-- Restriction of embeddings gives base change of the coordinates. -/
def DominantWeight.baseChange {n : ℕ} {ι ι' : Type*}
    (f : ι' → ι) (a : DominantWeight n ι) : DominantWeight n ι' :=
  fun τ => a (f τ)

/-- HT(epsilon) = -1, with Fin n indexed from zero. -/
def expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) : Multiset ℤ :=
  Multiset.map (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) Finset.univ.val

/-- The shifted coordinates are distinct even when the highest weight repeats. -/
theorem expectedHodgeTate_strictAnti {n : ℕ} {a : Fin n → ℤ}
    (ha : Antitone a) :
    StrictAnti fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ) := sorry

theorem expectedHodgeTate_card {n : ℕ} (a : Fin n → ℤ) :
    (expectedHodgeTate a).card = n := sorry

theorem expectedHodgeTate_nodup {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    (expectedHodgeTate a).Nodup := sorry

theorem expectedHodgeTate_twist {n : ℕ} (a : Fin n → ℤ) (t : ℤ) :
    expectedHodgeTate (fun i => a i - t) = (expectedHodgeTate a).map (· - t) := sorry

theorem expectedHodgeTate_conj {n : ℕ} {ι : Type*} (c : ι → ι)
    {w : ℤ} {a : DominantWeight n ι} (h : a.IsInW c w) (τ : ι) (i : Fin n) :
    (a (c τ)).1 i + ((n - 1 - i : ℕ) : ℤ) =
      (w + ((n - 1 : ℕ) : ℤ)) -
        ((a τ).1 i.rev + ((n - 1 - i.rev : ℕ) : ℤ)) := sorry

theorem DominantWeight.isInW_baseChange {n : ℕ} {ι ι' : Type*}
    (c : ι → ι) (c' : ι' → ι') (f : ι' → ι)
    (hf : ∀ τ, f (c' τ) = c (f τ))
    {w : ℤ} {a : DominantWeight n ι} (h : a.IsInW c w) :
    (a.baseChange f).IsInW c' w := sorry

/-- Agreement with the CM involution already in Mathlib. -/
theorem conjugation_at_embedding {K : Type*} [Field K] [NumberField K]
    [NumberField.IsCMField K] (τ : K →+* ℂ) (x : K) :
    τ (NumberField.IsCMField.complexConj K x) = star (τ x) := sorry

example : expectedHodgeTate ![(10 : ℤ), 0] = {11, 0} := sorry
example : expectedHodgeTate (0 : Fin 2 → ℤ) = {1, 0} := sorry
example : expectedHodgeTate (0 : Fin 0 → ℤ) = 0 := sorry
example (a : ℤ) : expectedHodgeTate (fun _ : Fin 1 => a) = {a} := sorry
example : ¬ Antitone (![0, 1] : Fin 2 → ℤ) := sorry

/-- Corrected multiplier parity, with w integral, including negative weights. -/
example (n : ℕ) (w : ℤ) (hn : 1 ≤ n) :
    (-1 : ℚ) ^ (n - 1) * (-1 : ℚ) ^ w * (-1 : ℚ) ^ ((n : ℤ) + w) = -1 := sorry

/-! ## AG2.0/AG2.5: checks of the imported integral polynomial -/

example {R : Type*} [CommRing R] (s α β x : R) :
    x ^ 2 - (s * (α + β)) * x + s ^ 2 * (α * β) =
      (x - s * α) * (x - s * β) := sorry

example {R : Type*} [CommRing R] (q a b c x : R) :
    x ^ 3 - (q * (a + b + c)) * x ^ 2 +
        q * (q * (a * b + b * c + c * a)) * x - q ^ 3 * (a * b * c) =
      (x - q * a) * (x - q * b) * (x - q * c) := sorry

/-- Reciprocal Frobenius changes both coefficients of the rank-two polynomial. -/
example (b₁ b₂ : ℂ) (hs : b₁ + b₂ = -24) (hp : b₁ * b₂ = 2 ^ 11) :
    1 / b₁ + 1 / b₂ = -24 / 2 ^ 11 ∧
      1 / b₁ * (1 / b₂) = 1 / 2 ^ 11 := sorry

/-- Geometric norm twist scales each root by u inverse. -/
example (b₁ b₂ u x : ℚ) (hu : u ≠ 0) :
    (x - b₁ / u) * (x - b₂ / u) =
      (u * x - b₁) * (u * x - b₂) / u ^ 2 := sorry

/-! ## AG2.1a/AG2.6: an equivariant comparison restricts to projected summands -/

/-- This statement assumes an actual comparison u intertwining the projectors.
It does not manufacture an etale--period comparison from their dimensions. -/
theorem comparison_on_projected_summands {K V W : Type*} [Field K]
    [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]
    (u : V ≃ₗ[K] W) (e : Module.End K V) (f : Module.End K W)
    (hu : u.toLinearMap.comp e = f.comp u.toLinearMap) :
    Nonempty (LinearMap.range e ≃ₗ[K] LinearMap.range f) := sorry

/-! ## AG2.5/AG2.6: monodromy is additional data -/

/-- A rank bound by the zero operator forces zero monodromy. -/
theorem monodromy_zero_of_rank_bound {K : Type*} [Field K] {n : ℕ}
    (N : Matrix (Fin n) (Fin n) K)
    (h : N.rank ≤ (0 : Matrix (Fin n) (Fin n) K).rank) : N = 0 := sorry

/-- Geometric-Frobenius relation for the Steinberg test, q = 2. -/
example :
    (!![1, 0; 0, 2] : Matrix (Fin 2) (Fin 2) ℚ) * !![0, 1; 0, 0] =
      (1 / 2 : ℚ) •
        ((!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 0, 2]) ∧
    (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2 = 0 ∧
    (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) ≠ 0 := sorry

/-- The same Frobenius matrix admits N = 0; the Weil part alone cannot choose N. -/
example :
    (!![1, 0; 0, 2] : Matrix (Fin 2) (Fin 2) ℚ) * 0 =
      (1 / 2 : ℚ) •
        ((0 : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 0, 2]) ∧
    ¬ ∃ u : Matrix.GeneralLinearGroup (Fin 2) ℚ,
      u.val * (0 : Matrix (Fin 2) (Fin 2) ℚ) = !![0, 1; 0, 0] * u.val := sorry

/-! ## AG2.7: ACC+ and Caraiani--Scholze eigenvalue conditions -/

/-- The ACC+ condition is on ordered pairs of distinct positions. Repeated
roots can satisfy it when q is not one in the residue field. -/
def IsGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  ∀ i j, i ≠ j → (α i : K) / (α j : K) ≠ q

/-- CS Definition 1.9 adds pairwise distinctness. -/
def IsStrongGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  IsGenericEigenvalues α q ∧ Function.Injective α

/-- Algebraic specialization after specifying actual local inertia and a
Frobenius lift. The global local-Galois carrier stays with its owner R01. -/
def IsGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    (((r frob).val.map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)

theorem isGenericEigenvalues_smul {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (c : Kˣ) :
    IsGenericEigenvalues (fun i => c * α i) q ↔ IsGenericEigenvalues α q := sorry

theorem isGenericEigenvalues_reindex {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (e : Fin n ≃ Fin n) :
    IsGenericEigenvalues (α ∘ e) q ↔ IsGenericEigenvalues α q := sorry

theorem isGenericEigenvalues_inverse {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) :
    IsGenericEigenvalues (fun i => (α i)⁻¹) q ↔ IsGenericEigenvalues α q := sorry

/-- Independence uses equality of the representation at the lifts. In the local
application this follows because their difference belongs to inertia. -/
theorem isGeneric_frobenius_independent {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (f₁ f₂ : G) (q : k) (h : r f₁ = r f₂) :
    IsGeneric I r f₁ q ↔ IsGeneric I r f₂ q := sorry

example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsGenericEigenvalues (fun _ : Fin 1 => a) q := sorry

example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := sorry

example : ¬ IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 1 := sorry

local instance : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

example : ¬ IsGenericEigenvalues
    ![(Units.mk0 (2 : ZMod 5) (by decide)), 1] (2 : ZMod 5) := sorry

/-- For residue cardinality 4, as in an unramified quadratic extension of Q_2,
the scalar is one modulo 3, not the scalar 2 of Q_2. -/
example : (4 : ZMod 3) = 1 ∧
    ¬ IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 4 := sorry

/-- Algebraic component of reduction through a stable lattice. Semisimplification,
continuity, existence and independence of that lattice are R01 targets. -/
example {O k : Type*} [CommRing O] [CommRing k] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) O) (red : O →+* k) :
    (A.map red).charpoly = A.charpoly.map red := sorry

end TauCeti.AutomorphicGalois
