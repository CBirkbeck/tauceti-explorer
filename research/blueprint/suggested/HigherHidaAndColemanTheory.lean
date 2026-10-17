/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures; they claim no implementation of the theory.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The 2026-10-12 WORKERS.md shape rule keeps only light real-bodied definitions
over existing carriers, milestones statable at these pins, and a few examples.
The solid six-functor category, polarized Igusa towers, automorphic supported
complexes and rigid cohomological eigenvarieties are README targets. They are
not replaced here by arbitrary carriers or proposition-valued assumptions.

A0/scalar-normalization is stated over an existing field and vector space;
X8/c2-weight-table uses actual integer pairs. The latter is only the derived
C2 coordinate calculation: central GSp4 coordinates and parity remain part
of the full character-lattice input in the README.
-/
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Algebra.GroupWithZero.Units.Basic
import Mathlib.Algebra.Field.Rat

namespace TauCeti.HigherHidaColeman

section Normalization

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- A0: scalar normalization of an already specified operator. -/
def renorm (p : K) (a : ℤ) (U : Module.End K V) : Module.End K V :=
  p ^ (-a) • U

theorem renorm_apply (p : K) (a : ℤ) (U : Module.End K V) (v : V) :
    renorm p a U v = p ^ (-a) • U v := sorry

theorem renorm_add (p : K) (hp : p ≠ 0) (a b : ℤ) (U : Module.End K V) :
    renorm p a (renorm p b U) = renorm p (a + b) U := sorry

theorem renorm_eigenvector (p : K) (a : ℤ) (U : Module.End K V)
    (v : V) (α : K) (hv : U v = α • v) :
    renorm p a U v = (p ^ (-a) * α) • v := sorry

/-- A0 milestone: the eigenvalue comparison keeps the original operator named. -/
theorem normalization_milestone (p : K) (hp : p ≠ 0) (a : ℤ)
    (U : Module.End K V) (v : V) (α : K) :
    (U v = α • v ↔ renorm p a U v = (p ^ (-a) * α) • v) := sorry

example (p : K) (U : Module.End K V) : renorm p 0 U = U := sorry

example : renorm (3 : ℚ) 2 (1 : Module.End ℚ ℚ) 1 = (1 / 9 : ℚ) := sorry

example : renorm (3 : ℚ) (-1) (1 : Module.End ℚ ℚ) 1 = (3 : ℚ) := sorry

end Normalization

/-- X8: the four shifted weights, in minimal-left-representative length order. -/
def c2Weight (r : Fin 4) (ν : ℤ × ℤ) : ℤ × ℤ :=
  match r.val with
  | 0 => (3 - ν.2, 3 - ν.1)
  | 1 => (3 - ν.2, ν.1 + 1)
  | 2 => (2 - ν.1, ν.2)
  | _ => (ν.1, ν.2)

theorem c2Weight_zero (ν : ℤ × ℤ) :
    c2Weight 0 ν = (3 - ν.2, 3 - ν.1) := sorry

theorem c2Weight_inverse (r : Fin 4) (ν : ℤ × ℤ) :
    (match r.val with
    | 0 => (3 - (c2Weight r ν).2, 3 - (c2Weight r ν).1)
    | 1 => ((c2Weight r ν).2 - 1, 3 - (c2Weight r ν).1)
    | 2 => (2 - (c2Weight r ν).1, (c2Weight r ν).2)
    | _ => c2Weight r ν) = ν := sorry

theorem c2Weight_serre (r : Fin 4) (ν : ℤ × ℤ) :
    (3 - (c2Weight r ν).2, 3 - (c2Weight r ν).1) =
      c2Weight ⟨3 - r.val, Nat.lt_succ_of_le (Nat.sub_le 3 r.val)⟩ ν := sorry

/-- X8 milestone: equal adjacent weights identify precisely the singular wall. -/
theorem c2_singular_wall (ν : ℤ × ℤ) :
    (c2Weight 0 ν = c2Weight 1 ν ↔ ν.1 = 1) := sorry

example : c2Weight 0 (0, -2) = (5, 3) := sorry
example : c2Weight 1 (0, -2) = (5, 1) := sorry
example : c2Weight 2 (0, -2) = (2, -2) := sorry
example : c2Weight 3 (0, -2) = (0, -2) := sorry

example (k : ℤ) : c2Weight 0 (1, 1 - k) = (k + 2, 2) := sorry
example (k : ℤ) : c2Weight 1 (1, 1 - k) = (k + 2, 2) := sorry

example : (3 - (3 : ℤ), 3 - (5 : ℤ)) = c2Weight 3 (0, -2) := sorry
example : (3 - (1 : ℤ), 3 - (5 : ℤ)) = c2Weight 2 (0, -2) := sorry

end TauCeti.HigherHidaColeman
