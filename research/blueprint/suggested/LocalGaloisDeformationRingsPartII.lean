import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Data.Fintype.Pi
import Mathlib.RingTheory.Ideal.Span
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.Nilpotent.Defs

/-!
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/LocalGaloisDeformationRingsPartII.md. These statements
suggest Lean forms so contributors and reviewers can converge on names and signatures.

The compact shape prescribed by WORKERS.md is used: light real-bodied definitions
on existing carriers, finite chart milestones, and representative examples. The
Kisin category, relative rigid coefficients, compact inertial types and Galois
condition functors are README targets at these pins. No stand-in for any of those
carriers is introduced here. In particular this file makes no formalization claim
for the single-type or multiple-type Galois deformation presentation.

Indices 0,1,2 below denote source shapes U₁,U₂,U₃. The eight entries x are:
  U₁: c₁₁,d₁₁,e₁₁*,c₁₂,c₂₁,d₂₁,c₂₂,d₂₂*;
  U₂: c₁₁,d₁₁,c₁₂,d₁₂*,c₂₁,d₂₁*,c₂₂,d₂₂;
  U₃: c₁₁,d₁₁*,c₁₂,d₁₂,c₂₁,c₂₂,d₂₂,e₂₂*.
Here x contains coefficient VALUES; starred values include their nonzero residual
constant. They are not eight variables all required to have zero residue.

BHHMS means arXiv:2009.03127v7; all page numbers use its preprint pagination.
-/

namespace TauCeti.TameGL2

section GaugeCharts
variable {R : Type*} [CommRing R]

/-- The three rank-two gauge matrix formulas (T.5/chart-models). -/
def gaugeChartMatrix (shape : Fin 3) (p v : R) (x : Fin 8 → R) :
    Matrix (Fin 2) (Fin 2) R :=
  if shape = 0 then
    !![(v + p)^2 * x 2 + (v + p) * x 1 + x 0, x 3;
       v * ((v + p) * x 5 + x 4), (v + p) * x 7 + x 6]
  else if shape = 1 then
    !![(v + p) * x 1 + x 0, (v + p) * x 3 + x 2;
       v * ((v + p) * x 5 + x 4), (v + p) * x 7 + x 6]
  else
    !![(v + p) * x 1 + x 0, (v + p) * x 3 + x 2;
       v * x 4, (v + p)^2 * x 7 + (v + p) * x 6 + x 5]

theorem gaugeChartMatrix_lowerLeft (shape : Fin 3) (p v : R) (x : Fin 8 → R) :
    v ∣ gaugeChartMatrix shape p v x 1 0 := by
  sorry

/-- Height-3 coefficient equations for the first chart, before monodromy. -/
theorem chart_height_coefficients (p v : R) (x : Fin 8 → R) :
    Matrix.det (gaugeChartMatrix 0 p v x) - x 2 * x 7 * (v + p)^3 =
      (x 0 * x 6 + p * x 3 * x 4) +
      (v + p) * (x 1 * x 6 - x 3 * x 4 + x 0 * x 7 + p * x 3 * x 5) +
      (v + p)^2 * (x 2 * x 6 + x 1 * x 7 - x 3 * x 5) := by
  sorry

-- Check chart_residual, BHHMS Tables 1–3, pp. 41–43.
example (u d v : R) :
    gaugeChartMatrix 0 0 v ![0, 0, u, 0, 0, 0, 0, d] =
      !![v^2 * u, 0; 0, v * d] := by
  sorry

example (u d v : R) :
    gaugeChartMatrix 1 0 v ![0, 0, 0, u, 0, d, 0, 0] =
      !![0, v * u; v^2 * d, 0] := by
  sorry

example (u d v : R) :
    gaugeChartMatrix 2 0 v ![0, u, 0, 0, 0, 0, 0, d] =
      !![v * u, 0; 0, v^2 * d] := by
  sorry

/-- Middle-chart remaining equation after four eliminations; b is a unit.
BHHMS Lemma 4.2.3, p. 31. This does not replace the five-equation ideal. -/
def middleChartHypersurface (p : R) (b : Rˣ) (x y : R) : R :=
  (↑b⁻¹ : R) * (x * y + p) * (x * y + ↑b * p)

/-- The exact identity underlying the p³ Jacobian bound. -/
theorem middle_jacobian_identity (p : R) (b : Rˣ) (x y : R) :
    (2 * (↑b + 1) * x * y + p * (↑b - 1)^2) *
        middleChartHypersurface p b x y -
      ((↑b + 1) * x * y + p * ((↑b : R)^2 + 1)) * x *
        ((↑b⁻¹ : R) * y * (2 * x * y + p * (↑b + 1))) =
      p^3 * (↑b - 1)^2 := by
  sorry

-- Check chart_middle_factors: both distinct factors are needed, and b−1 must
-- be a unit to obtain the singularity bound from the identity.
example (p : R) (b : Rˣ) : middleChartHypersurface p b 0 0 = p^2 := by
  sorry

example : middleChartHypersurface (3 : ℤ) (-1) 2 3 = -27 := by
  sorry

example (p x y : R) : middleChartHypersurface p (1 : Rˣ) x y = (x * y + p)^2 := by
  sorry

end GaugeCharts

section FiniteTypes

/-- The finite combinatorial conclusion of the weight-shape bijection,
T.4/weight-shape-bijection (BHHMS Lemma 4.1.2, pp. 26–27).
Theta's values select the excluded extreme, encoded by 0 or 2. -/
theorem allowed_shape_count (f : ℕ) (theta : Fin f → Fin 2) :
    Fintype.card {w : Fin f → Fin 3 //
      ∀ j, w j ≠ (if theta j = 0 then 0 else 2)} = 2^f := by
  sorry

example : Fintype.card {w : Fin 1 → Fin 3 // ∀ j, w j ≠ 2} = 2 := by
  sorry

example : Fintype.card {w : Fin 2 → Fin 3 // ∀ j, w j ≠ 0} = 4 := by
  sorry

end FiniteTypes

section ExactIdeals
variable {R : Type*} [CommRing R]

/-- The exact local (2,1) ideals of T.7/exact-q-ideals.
Side 0 is table 4: branches 0,1 are Q₁,Q₂.
Side 1 is table 5: branches 0,1 are Q₂,Q₃.
The seven nonstarred coefficient values are c₁₁,d₁₁,c₁₂,c₂₁,c₂₂,d₂₂,b.
The two units are d₁₂*,d₂₁*. These are ideals in an existing ring, not a new
carrier for the actual globally transported component primes. -/
def exactWeight21Ideal (side branch : Fin 2) (p : R) (u d : Rˣ)
    (x : Fin 7 → R) : Ideal R :=
  if side = 0 ∧ branch = 0 then
    Ideal.span {x 6 - p * x 2, x 0, x 2 - p * ↑u, x 3, x 4, x 1}
  else if side = 1 ∧ branch = 1 then
    Ideal.span {x 6 - p * x 3, x 0, x 2, x 3 - p * ↑d, x 4, x 5}
  else
    Ideal.span {x 6, x 0, x 2, x 3, x 4,
      x 1 * x 5 * (↑(u * d)⁻¹ : R) + p}

-- Check q_middle_contains_c21: the same c entry belongs to both exact ideals.
theorem exactWeight21_table4_common (p : R) (u d : Rˣ) (x : Fin 7 → R) :
    x 3 ∈ exactWeight21Ideal 0 0 p u d x ⊓ exactWeight21Ideal 0 1 p u d x := by
  sorry

theorem exactWeight21_table5_common (p : R) (u d : Rˣ) (x : Fin 7 → R) :
    x 2 ∈ exactWeight21Ideal 1 0 p u d x ⊓ exactWeight21Ideal 1 1 p u d x := by
  sorry

theorem exactWeight21_middle_agrees (p : R) (u d : Rˣ) (x : Fin 7 → R) :
    exactWeight21Ideal 0 1 p u d x = exactWeight21Ideal 1 0 p u d x := by
  sorry

-- Check q_outer_shift: the source's shifted equations vanish at this point;
-- replacing c₁₂−pu or b−pc₁₂ by an unshifted coordinate fails this test.
example : exactWeight21Ideal 0 0 (5 : ℤ) 1 1 ![0, 0, 5, 0, 0, 0, 25] = ⊥ := by
  sorry

-- Check q_middle_relation: d₁₁d₂₂/(ud)+p vanishes, whereas omitting +p fails.
example : exactWeight21Ideal 0 1 (5 : ℤ) 1 1 ![0, 1, 0, 0, 0, -5, 0] = ⊥ := by
  sorry

example : exactWeight21Ideal 1 1 (5 : ℤ) 1 1 ![0, 0, 0, 5, 0, 0, 25] = ⊥ := by
  sorry

/-- The actual ideal-theoretic witness in table 4. This is a typed finite
milestone of T.7/p-membership, not a stand-in for the missing deformation ring.
BHHMS Proposition 4.3.3, pp. 39–40. The one generated element is the witness
obtained from the actual middle (3,0) equations in the reader. -/
theorem table4_p_membership [IsLocalRing R] (p : R)
    (hp : p ∈ IsLocalRing.maximalIdeal R) (h2 : IsUnit (2 : R))
    (N : ℕ) (hN : 10 ≤ N) (a u d : Rˣ) (x : Fin 7 → R) (err : R) :
    p ∈ (exactWeight21Ideal 0 0 p u d x ⊓ exactWeight21Ideal 0 1 p u d x) ⊔
      Ideal.span {x 3 + 2 * p * (↑a⁻¹ : R) * ↑d + p^(N - 8) * err} := by
  sorry

/-- The table-5 witness; a denotes the unit a₂−1 of that computation. -/
theorem table5_p_membership [IsLocalRing R] (p : R)
    (hp : p ∈ IsLocalRing.maximalIdeal R) (h2 : IsUnit (2 : R))
    (N : ℕ) (hN : 10 ≤ N) (a u d : Rˣ) (x : Fin 7 → R) (err : R) :
    p ∈ (exactWeight21Ideal 1 0 p u d x ⊓ exactWeight21Ideal 1 1 p u d x) ⊔
      Ideal.span {x 2 - 2 * p * (↑a⁻¹ : R) * ↑u + p^(N - 8) * err} := by
  sorry

end ExactIdeals

section SpecialFibreCheck

/-- The square-free crossing consequence used in T.6/special-fibres.
The general square-free monomial theorem is imported from
DeformationAndDerivedPatchingAlgebra:R03.6/monomial-components-and-cycles;
this example records the concrete form of the chart calculation. -/
example (k : Type*) [Field k] (m n : ℕ) :
    IsReduced (MvPowerSeries ((Fin m × Fin 2) ⊕ Fin n) k ⧸
      Ideal.span (Set.range (fun i : Fin m =>
        (MvPowerSeries.X (Sum.inl (i, (0 : Fin 2))) :
          MvPowerSeries ((Fin m × Fin 2) ⊕ Fin n) k) *
        MvPowerSeries.X (Sum.inl (i, (1 : Fin 2)))))) := by
  sorry

end SpecialFibreCheck
end TauCeti.TameGL2
