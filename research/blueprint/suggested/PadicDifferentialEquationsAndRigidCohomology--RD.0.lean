import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.LinearAlgebra.Basis.SMul
import Mathlib.Algebra.Polynomial.Div
import Mathlib.NumberTheory.Padics.PadicNumbers

/-!
# Additional statements for p-adic differential-equation foundations

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

The accompanying reader specifies the Laurent/Robba and weak-completion
carriers, their analytic APIs, and the Cohen-coefficient descent theorem.
Those carriers are absent at these pins and remain mathematical targets in
that reader. This file uses existing bases and polynomial evaluation to state
small milestones. It introduces no analytic surrogate or sorry-valued data.

Source locators: Kedlaya, Slope filtrations revisited, Definition 2.2.17,
p.456; Arabia, Théorème 2.2.2, pp.633–634; van der Put, (2.4.4)(iii),
pp.37–38. The denominator estimate below is the Q_p normalization of the
reader's mixed-characteristic fringe-shrinking bound.
-/

namespace TauCeti.RigidCohomology

section ValuationBasis

variable {K V ι ι' : Type*} [NormedField K]
  [NormedAddCommGroup V] [NormedSpace K V]

/-- Weighted finite-coordinate maximum on an existing algebraic basis. -/
def IsValuationBasis (b : Module.Basis ι K V) : Prop :=
  ∀ c : ι →₀ K, ‖b.repr.symm c‖₊ =
    c.support.sup (fun i => ‖c i • b i‖₊)

-- Reader target valuation-basis: coordinates cannot cancel their maximum.
theorem IsValuationBasis.coordinate_le (b : Module.Basis ι K V)
    (hb : IsValuationBasis b) (x : V) (i : ι) :
    ‖(b.repr x) i‖ * ‖b i‖ ≤ ‖x‖ := by
  sorry

-- Reindexing changes labels, not the weighted maximum.
theorem IsValuationBasis.reindex_iff (b : Module.Basis ι K V) (e : ι ≃ ι') :
    IsValuationBasis (b.reindex e) ↔ IsValuationBasis b := by
  sorry

-- Rescaling the vectors by units divides the coordinates and keeps the property.
theorem IsValuationBasis.rescale_iff (b : Module.Basis ι K V) (w : ι → Kˣ) :
    IsValuationBasis (b.unitsSMul w) ↔ IsValuationBasis b := by
  sorry

-- Test valuationBasis_zero: empty support gives zero, even for an infinite index set.
example (b : Module.Basis ι K V) :
    ‖b.repr.symm (0 : ι →₀ K)‖₊ =
      (0 : ι →₀ K).support.sup (fun i => ‖(0 : ι →₀ K) i • b i‖₊) := by
  simp

-- Test valuationBasis_singleton: the singleton basis has the expected weighted norm.
example : IsValuationBasis (Module.Basis.singleton PUnit K) := by
  sorry

-- Test valuationBasis_bad_change: under the sup norm, (1,0),(1,π) is not a
-- valuation basis, since the difference of the two vectors has norm ‖π‖ < 1.
example (π : K) (hπ0 : 0 < ‖π‖) (hπ1 : ‖π‖ < 1)
    (b : Module.Basis (Fin 2) K (Fin 2 → K)) (h0 : b 0 = ![1, 0]) (h1 : b 1 = ![1, π]) :
    ¬ IsValuationBasis b := by
  sorry

-- Test valuationBasis_archimedean: the Euclidean basis of R² fails at (1,1).
example : ¬ IsValuationBasis (EuclideanSpace.basisFun (Fin 2) ℝ).toBasis := by
  sorry

end ValuationBasis

section Endpoints

variable {R : Type*} [CommRing R]

-- Reader target endpoint-preserving-weak-homotopy: the kernel over any ring.
theorem polynomial_endpoints_kernel (f : Polynomial R) :
    (f.eval 0 = 0 ∧ f.eval 1 = 0) ↔
      (Polynomial.X * (Polynomial.X - 1) : Polynomial R) ∣ f := by
  sorry

-- No domain or reducedness hypothesis is needed for joint surjectivity.
theorem polynomial_endpoints_surjective (x y : R) :
    ∃ f : Polynomial R, f.eval 0 = x ∧ f.eval 1 = y := by
  sorry

-- A fixed-endpoint perturbation is zero at both endpoints.
example (g : Polynomial R) :
    ((Polynomial.X * (Polynomial.X - 1)) * g).eval 0 = 0 ∧
      ((Polynomial.X * (Polynomial.X - 1)) * g).eval 1 = 0 := by
  simp

-- Linear interpolation of the values of X and X² cannot be an algebra map.
example : (Polynomial.X : Polynomial ℚ)^2 ≠ Polynomial.X := by
  sorry

end Endpoints

section Denominators

-- Reader target rational-dagger-interval-integration: polynomial growth.
theorem padic_integral_denominator_bound (p : ℕ) [Fact p.Prime] (n : ℕ) :
    ‖((n + 1 : ℚ_[p])⁻¹)‖ ≤ (n + 1 : ℝ) := by
  sorry

-- Test integrate_not_integral, numerical core: 1/p is not integral.
example (p : ℕ) [Fact p.Prime] : ‖((p : ℚ_[p])⁻¹)‖ > 1 := by
  sorry

end Denominators

end TauCeti.RigidCohomology
