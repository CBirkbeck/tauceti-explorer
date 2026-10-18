import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Nat.PrimeFin
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Sym.Basic
import Mathlib.GroupTheory.Index
import Mathlib.Tactic.NormNum
import TauCeti.LinearAlgebra.Matrix.SpecialLinearGroup.Transvection

/-!
# Geometric Frey–Mazur: suggested signatures

This file is not the roadmap and is not an exhaustive checklist. The accompanying
reader document specifies the mathematical targets, their APIs and all Checks.
The forms here are suggestions against the pinned Mathlib and Tau Ceti carriers.

Only light formulas and set adapters have definitions here. In particular there
is no substitute elliptic-family record, no assumed multiplicity estimate in a
structure, and no data definition with a missing body. Modular surfaces, cycle
measures, uniformizing metrics, relative elliptic schemes and normalization are
reader targets using their owners' interfaces; their carriers are not available
at these pins. Their eventual declarations must express the full reader targets.

The arithmetic witness signatures belong to GF.1, the signed reconstruction
checks to GF.3, graph adapters to GF.4, symmetric multisets to GF.6, and the group
milestones to GF.8, and the sign step of the GF.9 descent at the end. SL₂ perfectness is
already in Mathlib and is reused below.
-/

open scoped MatrixGroups

namespace TauCeti.GeometricFreyMazur

section GraphAdapters

variable {G X : Type*} [Group G] [MulAction G X]

/-- Point-set adapter for the simultaneous graph in two matched coordinates. -/
def bigDiagonal (g : G) : Set ((X × X) × (X × X)) :=
  {z | z.1.1 = g • z.2.1 ∧ z.1.2 = g • z.2.2}

theorem bigDiagonal_mem (g : G) (z : (X × X) × (X × X)) :
    z ∈ bigDiagonal g ↔ z.1.1 = g • z.2.1 ∧ z.1.2 = g • z.2.2 := by
  sorry

theorem bigDiagonal_one (x y : X) :
    ((x, y), (x, y)) ∈ bigDiagonal (1 : G) := by
  sorry

theorem bigDiagonal_swap (g : G) (u v : X × X) :
    (u, v) ∈ bigDiagonal g ↔ (v, u) ∈ bigDiagonal g⁻¹ := by
  sorry

theorem bigDiagonal_changeFrames (a b g : G) (u v : X × X) :
    (u, v) ∈ bigDiagonal g ↔
      ((a • u.1, a • u.2), (b • v.1, b • v.2)) ∈
        bigDiagonal (a * g * b⁻¹) := by
  sorry

/-- Restriction to an actual subset; in GF.4 this subset is the supplied T_m.
For a conjugate locus this is only a set restriction, not a complex curve. -/
def smallHecke (g : G) (T : Set (X × X)) : Set ((X × X) × (X × X)) :=
  bigDiagonal g ∩ {z | z.2 ∈ T}

theorem smallHecke_mem (g : G) (T : Set (X × X)) (z : (X × X) × (X × X)) :
    z ∈ smallHecke g T ↔ z ∈ bigDiagonal g ∧ z.2 ∈ T := by
  sorry

theorem smallHecke_subset (g : G) (T : Set (X × X)) :
    smallHecke g T ⊆ bigDiagonal g := by
  sorry

theorem smallHecke_mono (g : G) {T U : Set (X × X)} (h : T ⊆ U) :
    smallHecke g T ⊆ smallHecke g U := by
  sorry

example (x y : X) (h : x ≠ y) :
    ((x, y), (x, x)) ∉ bigDiagonal (1 : G) := by
  sorry

example (x : X) : ((x, x), (x, x)) ∈
    smallHecke (1 : G) {z : X × X | z.1 = z.2} := by
  sorry

example (x y : X) (h : x ≠ y) : ((x, y), (x, y)) ∉
    smallHecke (1 : G) {z : X × X | z.1 = z.2} := by
  sorry

end GraphAdapters

section CyclicDegree

/-- Arithmetic formula for the cyclic correspondence degree, including ψ(0)=0.
The geometric identification and its pull-push law are GF.0 reader targets. -/
def cyclicDegree (m : ℕ) : ℕ :=
  (m * ∏ q ∈ m.primeFactors, (q + 1)) / ∏ q ∈ m.primeFactors, q

theorem cyclicDegree_prime (q : ℕ) (hq : q.Prime) :
    cyclicDegree q = q + 1 := by
  sorry

theorem cyclicDegree_prime_pow (q a : ℕ) (hq : q.Prime) (ha : 0 < a) :
    cyclicDegree (q ^ a) = q ^ a + q ^ (a - 1) := by
  sorry

theorem cyclicDegree_mul {m n : ℕ} (h : m.Coprime n) :
    cyclicDegree (m * n) = cyclicDegree m * cyclicDegree n := by
  sorry

example : cyclicDegree 0 = 0 := by sorry
example : cyclicDegree 1 = 1 := by sorry
example : cyclicDegree 4 = 6 := by sorry
example : (1 + 2 + 4 : ℕ) = 7 ∧ cyclicDegree 4 ≠ 7 := by sorry

end CyclicDegree

section IntegralMatrices

/-- Ordinary integral upper unipotent matrix. -/
def upper (t : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![1, t; 0, 1]

/-- Ordinary integral lower unipotent matrix. -/
def lower (t : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; t, 1]

/-- Integral matrix used in the surviving compact systolic witness of GF.1. -/
def systolicWitness (p x : ℕ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![1 + (x : ℤ) * p, 3 * p;
    (p : ℤ) * (2 - (x : ℤ) ^ 2 + 2 * p * x) / 3,
    1 + 2 * (p : ℤ) ^ 2 - x * p]

theorem systolicWitness_det (p r x : ℕ) (hp : p = 3 * r + x)
    (hx : x = 1 ∨ x = 2) : (systolicWitness p x).det = 1 := by
  sorry

theorem systolicWitness_trace (p x : ℕ) :
    Matrix.trace (systolicWitness p x) = 2 * (p : ℤ) ^ 2 + 2 := by
  sorry

theorem systolicWitness_mod (p r x : ℕ) (hp : p = 3 * r + x)
    (hx : x = 1 ∨ x = 2) :
    (systolicWitness p x).map (Int.castRingHom (ZMod p)) = 1 := by
  sorry

theorem systolicWitness_word_one (r : ℕ) :
    systolicWitness (3 * r + 1) 1 =
      -(lower (2 * r) * upper 3 * lower (-(r : ℤ) - 1) * upper 3) := by
  sorry

theorem systolicWitness_word_two (r : ℕ) :
    systolicWitness (3 * r + 2) 2 =
      lower (2 * r + 1) * upper (-3) * lower (-(r : ℤ) - 1) *
        upper 1 * lower 1 * upper 1 := by
  sorry

example : systolicWitness 7 1 = !![8, 21; 35, 92] := by sorry
example : systolicWitness 11 2 = !![23, 33; 154, 221] := by sorry
example : (upper 7 * lower (-7)).det = 1 := by sorry

/-- The elliptic order-three lift; its polynomial differs from the order-four one. -/
def orderThreeLift : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; -1, -1]

theorem orderThreeLift_polynomial :
    orderThreeLift ^ 2 + orderThreeLift + 1 = 0 := by
  sorry

theorem orderThreeLift_norm (a b : ℤ) :
    (a • (1 : Matrix (Fin 2) (Fin 2) ℤ) + b • orderThreeLift).det =
      a ^ 2 - a * b + b ^ 2 := by
  sorry

example : orderThreeLift ^ 2 ≠ -1 := by sorry
example : ((1 : ℤ) • (1 : Matrix (Fin 2) (Fin 2) ℤ) +
    (1 : ℤ) • orderThreeLift).det = 1 := by sorry

/-- The integral reflection used to factor a negative determinant reconstruction. -/
def reflection : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; 0, -1]

theorem reflection_det : reflection.det = -1 := by sorry
theorem reflection_sq : reflection ^ 2 = 1 := by sorry

theorem negative_reconstruction_factor
    (Q : Matrix (Fin 2) (Fin 2) ℤ) (hQ : Q.det < 0) :
    0 < (Q * reflection).det ∧ Q = (Q * reflection) * reflection := by
  sorry

example : (-reflection).det = -1 := by sorry
example : (reflection * reflection).det = 1 := by sorry

/-- Numerical obstruction in the negative-reflection cusp example, GF.3. -/
theorem ordinary_boundary_degree_obstruction (p u v : ℕ)
    (hp : 1 < p) (hu : 0 < u) (hv : 0 < v)
    (hsum : p ∣ u + v) : p - 1 ≤ u * v := by
  sorry

end IntegralMatrices

section SymmetricPoints

-- Reuse the existing point-set carrier. No new scheme quotient is asserted here.
example {X Y Z : Type*} {n : ℕ} (f : X → Y) (g : Y → Z) (s : Sym X n) :
    Sym.map g (Sym.map f s) = Sym.map (g ∘ f) s := by
  exact Sym.map_map g f s

end SymmetricPoints

section LinearMonodromy

variable {p : ℕ} [Fact p.Prime]

/-- GF.8 index milestone, using the pinned transvection-generation theorem. -/
theorem proper_subgroup_index (hp : 5 ≤ p)
    (H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) (ZMod p)))
    (hH : H ≠ ⊤) : p ≤ H.index := by
  sorry

-- This is a direct use of the existing perfectness theorem, not a new target.
example {F : Type*} [Field F] (a : F) (ha : a ≠ 0) (hasq : a ^ 2 ≠ 1) :
    commutator (Matrix.SpecialLinearGroup (Fin 2) F) = ⊤ := by
  exact Matrix.SL2.commutator_eq_top (F := F) (a := a) ha hasq

/-- GF.8: an actual invertible intertwiner of a full-image representation kills a quadratic twist.
The GF.9 descent does not need it: Hecke containment gives `f[p] = λ • Ψ` directly. -/
theorem no_quadratic_self_twist {Gamma : Type*} [Group Gamma] (hp : 3 < p)
    (ρ : Gamma →* Matrix.SpecialLinearGroup (Fin 2) (ZMod p))
    (hρ : Function.Surjective ρ) (χ : Gamma →* (ZMod p)ˣ)
    (hχ : ∀ g, χ g ^ 2 = 1)
    (A : Matrix.GeneralLinearGroup (Fin 2) (ZMod p))
    (hA : ∀ g, A.val * (ρ g).val =
      (χ g : ZMod p) • ((ρ g).val * A.val)) : χ = 1 := by
  sorry

example : (21 : ℚ) / 100 / 24 = 7 / 800 := by norm_num

/-- GF.9 descent, sign step: if `σ(f) = s • f` for a sign `s` and `f[p]` is invertible, then
`s • f[p] = f[p]` forces `s = 1` because `p` is odd. -/
theorem descent_sign_trivial (hp : p ≠ 2) (A : Matrix.GeneralLinearGroup (Fin 2) (ZMod p))
    (s : ℤˣ) (h : ((s : ℤ) : ZMod p) • A.val = A.val) : s = 1 := by
  sorry

end LinearMonodromy

end TauCeti.GeometricFreyMazur
