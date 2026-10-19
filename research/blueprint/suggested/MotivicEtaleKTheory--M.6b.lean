import Mathlib.Algebra.Homology.SpectralSequence.Basic
import Mathlib.Algebra.Homology.SpectralObject.Basic
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.Data.Rat.Cast.Defs

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivicEtaleKTheory--M.6b.md` is definitive.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. They claim no implementation; every node is unchecked.

Only integer coordinate changes and consequences over existing linear-algebra
and polynomial carriers are stated here. The support spectra, coherent moving
roofs, motivic/étale/Deligne cohomology, higher K groups, Selmer complexes and
perfect determinant functors have no supplied implementation at the programme
pins. Their exact statements, APIs and tests are README targets. They are not
replaced here by invented carrier parameters or proposition-valued stand-ins.
The scalar-difference statement below is the linear-algebra step in the Adams
argument; it neither constructs Adams operations nor proves convergence.
-/

namespace TauCeti.MotivicEtaleKTheory

namespace MotivicIndex

/-- Support weight and K degree, transported to the public E₂ coordinates. -/
def toPage (pm : ℤ × ℤ) : ℤ × ℤ := (pm.1 - pm.2, -pm.1)

/-- Inverse transport: public bidegree to support weight and K degree. -/
def ofPage (ab : ℤ × ℤ) : ℤ × ℤ := (-ab.2, -ab.1 - ab.2)

theorem ofPage_toPage (pm : ℤ × ℤ) : ofPage (toPage pm) = pm := by
  sorry

theorem toPage_ofPage (ab : ℤ × ℤ) : toPage (ofPage ab) = ab := by
  sorry

/-- Native page s becomes public page s+1. -/
theorem differential (p m : ℤ) (s : ℕ) :
    toPage (p + (s : ℤ), m - 1) =
      ((toPage (p, m)).1 + (s : ℤ) + 1,
       (toPage (p, m)).2 - (s : ℤ)) := by
  sorry

theorem degree_weight (p m : ℤ) :
    -(toPage (p, m)).1 - (toPage (p, m)).2 = m ∧
      -(toPage (p, m)).2 = p := by
  sorry

example : toPage (0, 0) = (0, 0) := by
  sorry

example : toPage (2, 3) = (-1, -2) ∧ toPage (3, 2) = (1, -3) := by
  sorry

example : ofPage (-3, -2) = (2, 5) := by
  sorry

end MotivicIndex

section AdamsLinearAlgebra

variable {A B : Type*} [AddCommGroup A] [AddCommGroup B]
  [Module ℤ A] [Module ℤ B]

/-- Apply to a genuine page differential and its genuine commuting Adams actions. -/
theorem adams_scalar_difference (d : A →ₗ[ℤ] B)
    (ψA : Module.End ℤ A) (ψB : Module.End ℤ B)
    (hcomm : ψB.comp d = d.comp ψA) (x : A) (k : ℤ) (j r : ℕ)
    (hx : ψA x = k ^ j • x)
    (hdx : ψB (d x) = k ^ (j + r - 1) • d x) :
    (k ^ (j + r - 1) - k ^ j) • d x = 0 := by
  sorry

/-- A nonzero weight difference kills no nonzero vector over Q. -/
theorem rational_weight_differential_zero
    {V W : Type*} [AddCommGroup V] [AddCommGroup W]
    [Module ℚ V] [Module ℚ W] (d : V →ₗ[ℚ] W)
    (ψV : Module.End ℚ V) (ψW : Module.End ℚ W)
    (hcomm : ψW.comp d = d.comp ψV) (x : V) (μ ν : ℚ)
    (hx : x ∈ Module.End.eigenspace ψV μ)
    (hdx : d x ∈ Module.End.eigenspace ψW ν) (hne : ν ≠ μ) :
    d x = 0 := by
  sorry

end AdamsLinearAlgebra

section EulerPolynomialChecks

open Polynomial

/-- The Rubin factor for the Tate lattice Z_ℓ(1) is 1-X. -/
example (q : ℚ) : (1 - C (q ^ (0 : ℕ)) * X : ℚ[X]) = 1 - X := by
  sorry

/-- The untwisted elliptic Rubin factor has q⁻¹ as its quadratic coefficient. -/
example (q a : ℚ) :
    (1 - C (a * q⁻¹) * X + C q⁻¹ * X ^ 2 : ℚ[X]).coeff 2 = q⁻¹ := by
  sorry

/-- The geometric cohomological elliptic factor has q as that coefficient. -/
example (q a : ℚ) :
    (1 - C a * X + C q * X ^ 2 : ℚ[X]).coeff 2 = q := by
  sorry

end EulerPolynomialChecks

end TauCeti.MotivicEtaleKTheory
