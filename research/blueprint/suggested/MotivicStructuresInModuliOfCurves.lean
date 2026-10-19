/-
This file is not the roadmap and is not exhaustive. The document
research/blueprint/readmes/MotivicStructuresInModuliOfCurves.md is definitive.
These statements suggest Lean forms so contributors converge on names and signatures.

Only light definitions over existing natural numbers, integers, sets and
polynomials appear here. The geometric definitions and endpoints need carriers
absent at the pins and are specified individually in the reader. No abstract
cohomology axioms or surrogate moduli spaces are introduced. All theorem and
example proofs are placeholders; successful elaboration checks their types.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369
-/
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Polynomial.Degree.Defs
import Mathlib.Data.Set.Finite.Basic

namespace TauCeti.ModuliOfCurves

/-- Numerical stability, using natural-number addition to avoid subtraction. -/
def stablePair (g n : ℕ) : Prop := 2 < 2 * g + n

/-- The virtual dimension is integer-valued before stability is imposed. -/
def curveDimension (g n : ℕ) : ℤ := 3 * (g : ℤ) - 3 + n

/-- The stable-pair order used for boundary and marking induction. -/
def pairPrecedes (a b : ℕ × ℕ) : Prop :=
  a.1 ≤ b.1 ∧ 2 * a.1 + a.2 ≤ 2 * b.1 + b.2 ∧ a ≠ b

theorem pairPrecedes_irrefl (a : ℕ × ℕ) : ¬ pairPrecedes a a := by sorry

theorem pairPrecedes_trans {a b c : ℕ × ℕ}
    (hab : pairPrecedes a b) (hbc : pairPrecedes b c) : pairPrecedes a c := by sorry

theorem pairPrecedes_wellFounded : WellFounded pairPrecedes := by sorry

theorem dimension_nonnegative {g n : ℕ} (h : stablePair g n) :
    0 ≤ curveDimension g n := by sorry

example : stablePair 0 3 := by sorry
example : ¬ stablePair 1 0 := by sorry
example : ¬ stablePair 0 2 := by sorry
example : curveDimension 0 4 = 1 := by sorry
example : curveDimension 1 11 = 11 := by sorry
example : curveDimension 0 0 = -3 := by sorry
example : pairPrecedes (0, 4) (1, 2) := by sorry
example : ¬ pairPrecedes (1, 2) (0, 4) := by sorry
example : ¬ pairPrecedes (1, 1) (1, 1) := by sorry

/-- The exact finite seed inequalities of the cohomological theorem.
The coordinate order is genus, marks, cohomological degree. -/
def cohomologySeedRegion (k : ℕ) : Set (ℕ × ℕ × ℕ) :=
  {t | stablePair t.1 t.2.1 ∧ t.2.2 ≤ k ∧
    2 * t.1 < 3 * t.2.2 + 2 ∧ t.2.1 ≤ t.2.2 ∧
    (t.2.2 : ℤ) ≤ 4 * (t.1 : ℤ) - 4 + t.2.1}

theorem seedRegion_finite (k : ℕ) : (cohomologySeedRegion k).Finite := by sorry

theorem seedRegion_mono {k l : ℕ} (h : k ≤ l) :
    cohomologySeedRegion k ⊆ cohomologySeedRegion l := by sorry

theorem seedRegion_degree {k g n q : ℕ}
    (h : (g, n, q) ∈ cohomologySeedRegion k) : q ≤ k := by sorry

example : (1, 1, 1) ∈ cohomologySeedRegion 1 := by sorry
example : (6, 4, 4) ∈ cohomologySeedRegion 4 := by sorry
example : (7, 4, 4) ∉ cohomologySeedRegion 4 := by sorry
example : (0, 0, 0) ∉ cohomologySeedRegion 0 := by sorry

noncomputable section
open Polynomial

/-- Closed genus-four count polynomials; n is the number of ordered markings. -/
def closedGenusFour (n : Fin 4) : Polynomial ℤ :=
  match n.val with
  | 0 => 1 + 4 * X + 13 * X ^ 2 + 32 * X ^ 3 + 50 * X ^ 4 + 50 * X ^ 5 + 32 * X ^ 6 + 13 * X ^ 7 + 4 * X ^ 8 + X ^ 9
  | 1 => 1 + 6 * X + 30 * X ^ 2 + 93 * X ^ 3 + 191 * X ^ 4 + 240 * X ^ 5 + 191 * X ^ 6 + 93 * X ^ 7 + 30 * X ^ 8 + 6 * X ^ 9 + X ^ 10
  | 2 => 1 + 11 * X + 76 * X ^ 2 + 319 * X ^ 3 + 838 * X ^ 4 + 1362 * X ^ 5 + 1362 * X ^ 6 + 838 * X ^ 7 + 319 * X ^ 8 + 76 * X ^ 9 + 11 * X ^ 10 + X ^ 11
  | 3 => 1 + 21 * X + 207 * X ^ 2 + 1168 * X ^ 3 + 3977 * X ^ 4 + 8296 * X ^ 5 + 10605 * X ^ 6 + 8296 * X ^ 7 + 3977 * X ^ 8 + 1168 * X ^ 9 + 207 * X ^ 10 + 21 * X ^ 11 + X ^ 12
  | _ => 0

/-- Open genus-four count polynomials; n is the number of ordered markings. -/
def openGenusFour (n : Fin 4) : Polynomial ℤ :=
  match n.val with
  | 0 => -X ^ 6 + X ^ 7 + X ^ 8 + X ^ 9
  | 1 => -X ^ 2 - X ^ 6 - X ^ 7 + 2 * X ^ 8 + 2 * X ^ 9 + X ^ 10
  | 2 => -2 * X ^ 2 - 2 * X ^ 3 - 4 * X ^ 7 - 2 * X ^ 8 + 4 * X ^ 9 + 3 * X ^ 10 + X ^ 11
  | 3 => -1 + 2 * X + 2 * X ^ 2 - 11 * X ^ 3 - X ^ 6 + 4 * X ^ 7 - 13 * X ^ 8 - 4 * X ^ 9 + 7 * X ^ 10 + 4 * X ^ 11 + X ^ 12
  | _ => 0

/-- Independently recorded boundary count polynomials; n is the number of ordered markings. -/
def boundaryGenusFour (n : Fin 4) : Polynomial ℤ :=
  match n.val with
  | 0 => 1 + 4 * X + 13 * X ^ 2 + 32 * X ^ 3 + 50 * X ^ 4 + 50 * X ^ 5 + 33 * X ^ 6 + 12 * X ^ 7 + 3 * X ^ 8
  | 1 => 1 + 6 * X + 31 * X ^ 2 + 93 * X ^ 3 + 191 * X ^ 4 + 240 * X ^ 5 + 192 * X ^ 6 + 94 * X ^ 7 + 28 * X ^ 8 + 4 * X ^ 9
  | 2 => 1 + 11 * X + 78 * X ^ 2 + 321 * X ^ 3 + 838 * X ^ 4 + 1362 * X ^ 5 + 1362 * X ^ 6 + 842 * X ^ 7 + 321 * X ^ 8 + 72 * X ^ 9 + 8 * X ^ 10
  | 3 => 2 + 19 * X + 205 * X ^ 2 + 1179 * X ^ 3 + 3977 * X ^ 4 + 8296 * X ^ 5 + 10606 * X ^ 6 + 8292 * X ^ 7 + 3990 * X ^ 8 + 1172 * X ^ 9 + 200 * X ^ 10 + 17 * X ^ 11
  | _ => 0

theorem genusFour_closed_open_boundary (n : Fin 4) :
    closedGenusFour n = openGenusFour n + boundaryGenusFour n := by sorry

theorem closedGenusFour_degree (n : Fin 4) :
    (closedGenusFour n).natDegree = 9 + n.val := by sorry

theorem boundaryGenusFour_degree (n : Fin 4) :
    (boundaryGenusFour n).natDegree = 8 + n.val := by sorry

theorem closedGenusFour_palindromic (n : Fin 4) (i : ℕ) (hi : i ≤ 9 + n.val) :
    (closedGenusFour n).coeff i = (closedGenusFour n).coeff (9 + n.val - i) := by sorry

theorem closedGenusFour_coeff_nonnegative (n : Fin 4) (i : ℕ) :
    0 ≤ (closedGenusFour n).coeff i := by sorry

example : (closedGenusFour 0).coeff 4 = 50 := by sorry
example : (closedGenusFour 3).coeff 6 = 10605 := by sorry
example : (closedGenusFour 3).coeff 13 = 0 := by sorry
example : (openGenusFour 3).coeff 3 = -11 := by sorry
example : (openGenusFour 3).coeff 4 = 0 := by sorry
example : (openGenusFour 3).eval 1 = -10 := by sorry
example : (boundaryGenusFour 3).coeff 6 = 10606 := by sorry
example : (boundaryGenusFour 0).coeff 9 = 0 := by sorry
example : (boundaryGenusFour 3).coeff 0 = 2 := by sorry

-- Arithmetic acceptance checks do not stand for the missing graph certificates.
example : (891 : ℕ) = 132 + 11 + 132 + 220 + 66 + 66 + 132 + 66 + 66 := by sorry
example : (891 : ℕ) - 825 = 66 := by sorry
example : (825 : ℕ) + 11 = 836 := by sorry
example : (891 : ℕ) - 836 = 55 := by sorry

end

/-
README definitions requiring actual geometric carriers, stated there with APIs/tests:
TC.0 tautological-rings and kappa-classes;
TC.2 symplectic-local-systems;
TC.3 semi-tautological-extension and marking-filtration;
TC.4 chow-kunneth-generation;
TC.5 gonality-strata, tetragonal-hurwitz and tetragonal-splitting;
TC.6 marked-spinor-incidence (after both central/descent gates);
TC.7 quadric-incidence;
TC.8 curve-marking-twists, weight-euler-characteristic and stable-graph-transform;
TC.11 omega-graphs; TC.12 weight-fifteen-complex.
Their target theorem statements, comparison maps, and every geometric endpoint
are in the reader. None is replaced by a proposition-valued mock carrier here.
-/
end TauCeti.ModuliOfCurves
