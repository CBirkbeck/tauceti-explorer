import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Sym.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-!
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/ModularCurvesPartIII.md. Suggested statements help
contributors and reviewers agree on names and signatures; they do not implement
the roadmap. Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

This identifier is an import index. GeometricFreyMazur owns its 67 targets,
80 API items, 40 definition tests and 53 planets; its suggested file is
research/blueprint/suggested/GeometricFreyMazur.lean. The stage mapping is
ModularCurvesPartIII:GF.n -> GeometricFreyMazur:GF.n for n = 0,...,10.
No declarations are reassigned, and no mathematical stage is closed here.

GF.0 imports projective frames, quotient and special loci; GF.1 compact metrics
and the surviving systolic witness; GF.2 height lifts and cusp lenses;
GF.3 signed arithmetic repulsion; GF.4 diagonal overlap; GF.5 multiplicities
and projectionwise area; GF.6 pencils and normalized pullbacks; GF.7 ramification
and rigidity; GF.8 modular gonality and actual monodromy; GF.9 actual torsion,
descent and spreading; GF.10 genus and minimal-model consequences.

The anonymous examples below check native-carrier acceptance data. They do not
prove the general geometric estimates or verify the owner's full prototype.
In particular the surviving witness's compact trace asymptotic is an owner
target, not a consequence of its two elementary matrix checks below. Surface
quotients, cycles and elliptic schemes remain targets in the owner's packet;
no substitute structure has those results as fields.
-/

namespace ModularCurvesPartIIIAcceptance

open scoped MatrixGroups

-- GF.0: use the native scalar quotient; the scalar acts trivially in PGL.
example (u : ℚˣ) :
    Matrix.ProjGenLinGroup.mk (Matrix.GeneralLinearGroup.scalar (Fin 2) u) = 1 :=
  Matrix.ProjGenLinGroup.mk_scalar u

-- Cyclic degree at m = 4 differs from the full order-four subgroup count.
example : (4 * (1 + 1 / 2) : ℚ) = 6 ∧ (1 + 2 + 4 : ℚ) = 7 := by norm_num

-- GF.1: accepted M_p, one example in each nonzero residue class modulo 3.
-- p = 7, x = 1: lower-left entry is 7(2 - 1 + 14)/3 = 35.
example : Matrix.det (!![8, 21; 35, 92] : Matrix (Fin 2) (Fin 2) ℤ) = 1 := by
  norm_num [Matrix.det_fin_two]

example : Matrix.trace (!![8, 21; 35, 92] : Matrix (Fin 2) (Fin 2) ℤ) =
    2 * 7 ^ 2 + 2 := by norm_num [Matrix.trace, Matrix.diag, Fin.sum_univ_two]

-- p = 11, x = 2: lower-left entry is 11(2 - 4 + 44)/3 = 154.
example : Matrix.det (!![23, 33; 154, 221] : Matrix (Fin 2) (Fin 2) ℤ) = 1 := by
  norm_num [Matrix.det_fin_two]

example : Matrix.trace (!![23, 33; 154, 221] : Matrix (Fin 2) (Fin 2) ℤ) =
    2 * 11 ^ 2 + 2 := by norm_num [Matrix.trace, Matrix.diag, Fin.sum_univ_two]

-- GF.3: negating a two-dimensional matrix preserves its determinant sign.
example : Matrix.det (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) ℤ) = -1 ∧
    Matrix.det (!![-1, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) = -1 := by
  norm_num [Matrix.det_fin_two]

-- Gaussian and Eisenstein centralizers have different norm polynomials.
example (a b : ℚ) :
    Matrix.det (!![a, b; -b, a - b] : Matrix (Fin 2) (Fin 2) ℚ) =
      a ^ 2 - a * b + b ^ 2 := by
  simp [Matrix.det_fin_two]
  ring

-- GF.5: order of the three small parameters; checks the displayed exponents.
example :
    3 * (1 / 10000 : ℚ) < 2 * (1 / 1000) ∧
    -2 * (1 / 100000 : ℚ) < 0 ∧
    -2 * (1 / 1000 : ℚ) + 3 * (1 / 10000) < 0 := by norm_num

-- The exact area ratio at p = 7 is not close to 1 yet.
example : (1 + 6 / (7 - 6) : ℚ) = 7 := by norm_num

-- GF.6: the point-set symmetric power retains repetitions and order symmetry.
example : (⟨{1, 2}, by decide⟩ : Sym ℕ 2) = ⟨{2, 1}, by decide⟩ := by decide

example : (⟨{1, 2}, by decide⟩ : Sym ℕ 2) ≠ ⟨{1, 1}, by decide⟩ := by decide

example : (⟨{1}, by decide⟩ : Sym ℕ 1).val.card = 1 := by decide

example {α β γ : Type*} {n : ℕ} (g : β → γ) (f : α → β) (s : Sym α n) :
    Sym.map g (Sym.map f s) = Sym.map (g ∘ f) s := Sym.map_map g f s

-- GF.7: dropping the negative term yields an inequality, not an equality.
example (d r : ℚ) (hd : 0 < d) : -2 * d + r < r := by linarith

-- GF.8: imported numerical bounds compose to Abramovich's constant.
example : ((21 / 100 : ℚ) / 24) = 7 / 800 := by norm_num

-- GF.9: odd characteristic separates the two signs in the Hom lattice.
example (x : ℚ) (hx : x ≠ 0) : -x ≠ x := by
  intro h
  apply hx
  linarith

end ModularCurvesPartIIIAcceptance
