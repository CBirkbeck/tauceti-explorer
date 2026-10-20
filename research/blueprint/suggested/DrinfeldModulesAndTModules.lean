/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Claude Code (cc-fb70e5), Codex (codex-zJGrQH, codex-hNQyYt, codex-H2yAfU,
codex-Rum4XU, codex-ljXclE), Claude (claude-OaJlDs), Codex (codex-iUf6YW)
-/
import Mathlib

/-!
# Drinfeld modules, t-motives and characteristic-p special values

The README states every target, hypothesis, API and discriminating check. This file keeps
light definitions on native carriers and a few milestones statable at the pinned libraries.
Heavy objects, including Drinfeld modules on line bundles, t-motives, moduli spaces, elliptic
sheaves, arithmetic entire rings and their Tannakian categories, remain README targets.

The source conventions are inverse coefficient Frobenius fixing the motive variable, and
π_N = -π_P. The numerical Carlitz exponential in DM.2 does not depend on the auxiliary
function Ω; Ω and analytic coefficient twisting belong to DM.8.
-/

noncomputable section
open scoped BigOperators Topology

namespace TauCeti.Drinfeld

section CarlitzProducts
variable {F R : Type*} [Field F] [Fintype F] [CommRing R] [Algebra F R]

/-- DM.0/carlitz-products: the bracket uses the coefficient θ. -/
def carlitzBracket (F : Type*) [Field F] [Fintype F] (theta : R) (n : ℕ) : R :=
  theta ^ (Fintype.card F ^ n) - theta

/-- DM.0/carlitz-products: the product definition, before the Frobenius recurrence. -/
def carlitzD (F : Type*) [Field F] [Fintype F] (theta : R) (n : ℕ) : R :=
  ∏ j ∈ Finset.range n, (theta ^ (Fintype.card F ^ n) - theta ^ (Fintype.card F ^ j))

/-- DM.0/carlitz-products: the signed logarithm denominators. -/
def carlitzEll (F : Type*) [Field F] [Fintype F] (theta : R) (n : ℕ) : R :=
  ∏ j ∈ Finset.range n, (theta - theta ^ (Fintype.card F ^ (j + 1)))

/-- The denominator recurrence is a polynomial identity over every F-algebra. -/
theorem carlitzD_succ (theta : R) (n : ℕ) :
    carlitzD F theta (n + 1) = carlitzBracket F theta (n + 1) *
      carlitzD F theta n ^ Fintype.card F := by
  sorry

/-- The sign in ℓ_(n+1) = -[n+1] ℓ_n is part of the convention. -/
theorem carlitzEll_succ (theta : R) (n : ℕ) :
    carlitzEll F theta (n + 1) = -carlitzBracket F theta (n + 1) * carlitzEll F theta n := by
  sorry

/-- The zero bracket vanishes. -/
example (theta : R) : carlitzBracket F theta 0 = 0 := by
  simp [carlitzBracket]

/-- At q=2 the bracket is θ²-θ, including over a polynomial coefficient ring. -/
example (theta : R) (hq : Fintype.card F = 2) :
    carlitzBracket F theta 1 = theta ^ 2 - theta := by
  simp [carlitzBracket, hq]

/-- Empty product. -/
example (theta : R) : carlitzD F theta 0 = 1 := by
  simp [carlitzD]

/-- The two factors have distinct q-power exponents. -/
example (theta : R) : carlitzD F theta 2 =
    (theta ^ (Fintype.card F ^ 2) - theta) *
      (theta ^ (Fintype.card F ^ 2) - theta ^ Fintype.card F) := by
  simp [carlitzD, Finset.prod_range_succ]

/-- Empty logarithm product. -/
example (theta : R) : carlitzEll F theta 0 = 1 := by
  simp [carlitzEll]

/-- First logarithm denominator; reversing this sign changes odd weights. -/
example (theta : R) : carlitzEll F theta 1 = theta - theta ^ Fintype.card F := by
  simp [carlitzEll]

end CarlitzProducts

section CarlitzAnalysis
variable {F C : Type*} [Field F] [Fintype F] [NormedField C] [Algebra F C]

/-- DM.2/carlitz-exponential: a light expression on the native complete normed field.
The convergence and inverse assertions below require the stated analytic hypotheses. -/
def carlitzExp (F : Type*) [Field F] [Fintype F] (theta z : C) : C :=
  ∑' n : ℕ, z ^ (Fintype.card F ^ n) / carlitzD F theta n

/-- DM.2/carlitz-logarithm: total `tsum`; the theorem specifies its convergence disk. -/
def carlitzLog (F : Type*) [Field F] [Fintype F] (theta z : C) : C :=
  ∑' n : ℕ, z ^ (Fintype.card F ^ n) / carlitzEll F theta n

/-- Entire convergence for the Carlitz exponential, independent of Ω. -/
theorem carlitzExp_summable [CompleteSpace C] [IsUltrametricDist C]
    (theta z : C) (htheta : 1 < ‖theta‖) :
    Summable (fun n : ℕ => z ^ (Fintype.card F ^ n) / carlitzD F theta n) := by
  sorry

/-- Carlitz exponential intertwines multiplication by θ with θ+τ. -/
theorem carlitzExp_functional [CompleteSpace C] [IsUltrametricDist C]
    (theta z : C) (htheta : 1 < ‖theta‖) :
    carlitzExp F theta (theta * z) =
      theta * carlitzExp F theta z + carlitzExp F theta z ^ Fintype.card F := by
  sorry

/-- The logarithm converges in the open disk, and is a right inverse there. -/
theorem carlitzExp_carlitzLog [CompleteSpace C] [IsUltrametricDist C]
    (theta z : C) (htheta : 1 < ‖theta‖)
    (hz : ‖z‖ < ‖theta‖ ^ ((Fintype.card F : ℝ) / (Fintype.card F - 1 : ℝ))) :
    Summable (fun n : ℕ => z ^ (Fintype.card F ^ n) / carlitzEll F theta n) ∧
      carlitzExp F theta (carlitzLog F theta z) = z := by
  sorry

/-- Exponential at zero, without an admitted example. -/
example (theta : C) : carlitzExp F theta 0 = 0 := by
  simp [carlitzExp]

/-- Logarithm at zero. -/
example (theta : C) : carlitzLog F theta 0 = 0 := by
  simp [carlitzLog]

end CarlitzAnalysis
end TauCeti.Drinfeld

namespace TauCeti.Difference.Periods

section CoefficientTwist
variable {C : Type*} [CommRing C]

/-- DM.8/coefficient-twist: native coefficient map, fixing the power-series variable.
In the analytic targets σ is the inverse q-Frobenius; the formula is valid for any ring map. -/
def twistSeries (σ : C →+* C) (f : PowerSeries C) : PowerSeries C :=
  PowerSeries.map σ f

/-- Fixing X tests the difference between coefficient twist and substitution X↦X^q. -/
example (σ : C →+* C) : twistSeries σ PowerSeries.X = PowerSeries.X := by
  simp [twistSeries]

/-- A coefficient that moves under σ also moves in the constant series. -/
example (σ : C →+* C) (a : C) (ha : σ a ≠ a) :
    twistSeries σ (PowerSeries.C a) ≠ PowerSeries.C a := by
  intro h
  have hcoeff := congrArg (PowerSeries.coeff 0) h
  exact ha (by simpa [twistSeries] using hcoeff)

end CoefficientTwist

section FixedVectors
variable {F L V I : Type*} [Field F] [Field L] [Algebra F L]
  [AddCommGroup V] [Module F V] [Module L V] [IsScalarTower F L V]

/-- DM.8/fixed-independence: descent of linear independence for fixed vectors. -/
theorem fixed_independence (σ : L ≃ₐ[F] L)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    (S : V →ₗ[F] V) (hsemi : ∀ (a : L) (v : V), S (a • v) = σ a • S v)
    (v : I → V) (hfixed : ∀ i, S (v i) = v i) :
    LinearIndependent F v ↔ LinearIndependent L v := by
  sorry

/-- DM.8/fixed-dimension-bound: finiteness is asserted before using finrank. -/
theorem fixed_dimension_bound [FiniteDimensional L V] (σ : L ≃ₐ[F] L)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    (S : V →ₗ[F] V) (hsemi : ∀ (a : L) (v : V), S (a • v) = σ a • S v) :
    FiniteDimensional F S.fixedSubmodule ∧
      Module.finrank F S.fixedSubmodule ≤ Module.finrank L V := by
  sorry

end FixedVectors

section FundamentalMatrices
variable {F L : Type*} [Field F] [Field L] [Algebra F L]
  {r : ℕ}

/-- DM.8/fundamental-matrix: two solutions differ on the right by an invertible
constant matrix. This is over the actual fixed field, not the Laurent-series constants. -/
theorem fundamental_unique (σ : L ≃ₐ[F] L)
    (hconstants : ∀ a : L, σ a = a ↔ ∃ c : F, algebraMap F L c = a)
    (Φ Ψ Ψ' : Matrix.GeneralLinearGroup (Fin r) L)
    (hΨ : (Ψ : Matrix (Fin r) (Fin r) L).map σ = Φ * Ψ)
    (hΨ' : (Ψ' : Matrix (Fin r) (Fin r) L).map σ = Φ * Ψ') :
    ∃ B : Matrix.GeneralLinearGroup (Fin r) F,
      (Ψ' : Matrix (Fin r) (Fin r) L) =
        (Ψ : Matrix (Fin r) (Fin r) L) *
          (B : Matrix (Fin r) (Fin r) F).map (algebraMap F L) := by
  sorry

end FundamentalMatrices

section Denominators
variable {F K : Type*} [Field F] [Field K] [Algebra F K]

/-- DM.8/constant-denominator: rational intertwiners admit a common denominator
in the fixed polynomial ring. The matrix B is rational before denominators are cleared. -/
theorem constant_denominator (σ : K ≃ₐ[F] K)
    (hc : ∀ a : K, σ a = a ↔ ∃ c : F, algebraMap F K c = a)
    (σR : RatFunc K ≃+* RatFunc K)
    (hσR : ∀ P : Polynomial K, σR (algebraMap (Polynomial K) (RatFunc K) P) =
      algebraMap (Polynomial K) (RatFunc K) (P.map σ.toRingHom))
    (θ : K) (hθ : ∀ n : ℕ, 0 < n → (σ.toEquiv : K → K)^[n] θ ≠ θ)
    {r s : ℕ} (Φ₁ : Matrix (Fin r) (Fin r) (Polynomial K))
    (Φ₂ : Matrix (Fin s) (Fin s) (Polynomial K))
    (c₁ c₂ : K) (hc₁ : c₁ ≠ 0) (hc₂ : c₂ ≠ 0) (n₁ n₂ : ℕ)
    (hd₁ : Φ₁.det = Polynomial.C c₁ * (Polynomial.X - Polynomial.C θ) ^ n₁)
    (hd₂ : Φ₂.det = Polynomial.C c₂ * (Polynomial.X - Polynomial.C θ) ^ n₂)
    (B : Matrix (Fin r) (Fin s) (RatFunc K))
    (hB : B.map σR * Φ₂.map (algebraMap (Polynomial K) (RatFunc K)) =
      Φ₁.map (algebraMap (Polynomial K) (RatFunc K)) * B) :
    ∃ D : Polynomial F, D ≠ 0 ∧ ∀ i j, ∃ P : Polynomial K,
      algebraMap (Polynomial K) (RatFunc K) P =
        algebraMap (Polynomial K) (RatFunc K) (D.map (algebraMap F K)) * B i j := by
  sorry

end Denominators
end TauCeti.Difference.Periods
end
