import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.FieldTheory.KummerExtension
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.PNat.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HabiroNahmSeries--HB.5.md is definitive. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.
All proofs and the new construction are intentionally left as `sorry`.

The parent packet owns analytic Nahm data, Nahm sums, Rogers values, cusp Laurent
expansions and Bloch groups. Their implementations are absent at the pinned
baseline. Literal expressions below prototype the new majorant and its finite
product estimate without introducing replacement library carriers. The local
notations are syntax for finite products and the quadratic polynomial, not new
q-Pochhammer or Nahm-datum declarations. When the suppliers land, use their names.

The final comments identify signatures that cannot honestly be expressed until
those carriers exist; no arbitrary proposition is substituted for a missing notion.
-/

noncomputable section

open scoped BigOperators
open Matrix

namespace TauCeti.Nahm.HB5

-- The polynomial Q from the existing analytic Nahm datum, written literally.
local notation "qval" => fun {r : ℕ}
  (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ) (x : Fin r → ℚ) =>
    (1 / 2 : ℚ) * (x ⬝ᵥ Matrix.mulVec A x) + (B ⬝ᵥ x) + C

-- Finite specializations (q;q)_N of the QM.0/q-pochhammer supplier.
local notation "pfin" => fun (q : ℝ) (N : ℕ) =>
  ∏ j ∈ Finset.range N, (1 - q ^ (j + 1))
local notation "pcfin" => fun (q : ℂ) (N : ℕ) =>
  ∏ j ∈ Finset.range N, (1 - q ^ (j + 1))

variable {r : ℕ}

/-- HB.5/residue-class-majorant. The analytic API requires positive t and A.
The definition is total, following the baseline real tsum convention. -/
noncomputable def residueMajorant
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) : ℝ := by
  sorry

lemma residueMajorant_eq_tsum
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) :
    residueMajorant A B C m t =
      ∑' n : Fin r → ℕ,
        Real.exp (-t * (qval A B C (fun i => (n i : ℚ)) : ℝ)) /
          ∏ i, pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (n i / (m : ℕ)) := by
  sorry

lemma residueMajorant_summable
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    Summable (fun n : Fin r → ℕ =>
      Real.exp (-t * (qval A B C (fun i => (n i : ℚ)) : ℝ)) /
        ∏ i, pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (n i / (m : ℕ))) := by
  sorry

lemma residueMajorant_pos
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    0 < residueMajorant A B C m t := by
  sorry

lemma residueMajorant_quadratic_split
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (ℓ : Fin r → ℕ) (s : Fin r → Fin (m : ℕ))
    (hA : A.transpose = A) :
    qval A B C (fun i => ((m : ℕ) : ℚ) * (ℓ i : ℚ) + ((s i : ℕ) : ℚ)) =
      ((m : ℕ) : ℚ) ^ 2 *
        qval A
          (fun i => (A.mulVec (fun j => ((s j : ℕ) : ℚ)) i + B i) / ((m : ℕ) : ℚ))
          0 (fun i => (ℓ i : ℚ)) +
      qval A B C (fun i => ((s i : ℕ) : ℚ)) := by
  sorry

-- Every shifted f on the right is its literal positive real Nahm series.
lemma residueMajorant_split
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    residueMajorant A B C m t =
      ∑ s : Fin r → Fin (m : ℕ),
        Real.exp (-t * (qval A B C (fun i => ((s i : ℕ) : ℚ)) : ℝ)) *
          ∑' ℓ : Fin r → ℕ,
            Real.exp (-((m : ℕ) : ℝ) ^ 2 * t *
              (qval A
                (fun i => (A.mulVec (fun j => ((s j : ℕ) : ℚ)) i + B i) /
                  ((m : ℕ) : ℚ))
                0 (fun i => (ℓ i : ℚ)) : ℝ)) /
              ∏ i, pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (ℓ i) := by
  sorry

lemma residueMajorant_order_one
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    residueMajorant A B C 1 t =
      ∑' n : Fin r → ℕ,
        Real.exp (-t * (qval A B C (fun i => (n i : ℚ)) : ℝ)) /
          ∏ i, pfin (Real.exp (-t)) (n i) := by
  sorry

lemma residueMajorant_rank_zero
    (A : Matrix (Fin 0) (Fin 0) ℚ) (B : Fin 0 → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) :
    residueMajorant A B C m t = Real.exp (-t * (C : ℝ)) := by
  sorry

lemma residueMajorant_shift_constant
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C u : ℚ)
    (m : ℕ+) (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    residueMajorant A B (C + u) m t =
      Real.exp (-t * (u : ℝ)) * residueMajorant A B C m t := by
  sorry

-- Test: majorant_rank_one_even_order. Distinguishes m² from m and both B-shifts.
example (t : ℝ) (ht : 0 < t) :
    residueMajorant (r := 1) (fun _ _ => 2) (fun _ => 1) (11 / 60) 2 t =
      Real.exp (-t * (11 / 60 : ℝ)) *
        (∑' ℓ : ℕ, Real.exp (-4 * t * ((ℓ : ℝ) ^ 2 + (ℓ : ℝ) / 2)) /
          pfin (Real.exp (-4 * t)) ℓ) +
      Real.exp (-t * (131 / 60 : ℝ)) *
        (∑' ℓ : ℕ, Real.exp (-4 * t * ((ℓ : ℝ) ^ 2 + 3 * (ℓ : ℝ) / 2)) /
          pfin (Real.exp (-4 * t)) ℓ) := by
  sorry

-- Test: majorant_empty_rank. The empty-rank construction retains C.
example :
    residueMajorant (r := 0) (fun _ _ => 0) (fun _ => 0) 7 2 (Real.log 2) =
      (1 / 128 : ℝ) := by
  sorry

-- Test: majorant_original_axis. Exact compatibility with the original series.
example (t : ℝ) (ht : 0 < t) :
    residueMajorant (r := 1) (fun _ _ => 2) (fun _ => 1) (11 / 60) 1 t =
      ∑' n : ℕ, Real.exp (-t * ((n : ℝ) ^ 2 + (n : ℝ) + 11 / 60)) /
        pfin (Real.exp (-t)) n := by
  sorry

-- Test: majorant_constant_shift. A nonzero q^C factor must survive.
example (t : ℝ) (ht : 0 < t) :
    residueMajorant (r := 1) (fun _ _ => 2) (fun _ => 1) (71 / 60) 2 t =
      Real.exp (-t) *
        residueMajorant (r := 1) (fun _ _ => 2) (fun _ => 1) (11 / 60) 2 t := by
  sorry

/-- HB.5/block-product-lower-bound; uniform in N,t and primitive ζ. -/
theorem rootProduct_lower_bound (m : ℕ+) :
    ∃ c : ℝ, 0 < c ∧
      ∀ ζ : ℂ, IsPrimitiveRoot ζ (m : ℕ) →
        ∀ t : ℝ, 0 < t → t ≤ 1 → ∀ N : ℕ,
          c * pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (N / (m : ℕ)) ≤
            ‖pcfin (ζ * (Real.exp (-t) : ℂ)) N‖ := by
  sorry

lemma rootProduct_order_one (t : ℝ) (ht : 0 < t) (N : ℕ) :
    ‖pcfin (Real.exp (-t) : ℂ) N‖ = pfin (Real.exp (-t)) N := by
  sorry

lemma rootProduct_order_two (t : ℝ) (ht : 0 < t) (N : ℕ) :
    pfin (Real.exp (-4 * t)) (N / 2) ≤ ‖pcfin (-(Real.exp (-t) : ℂ)) N‖ := by
  sorry

/-- The exact majorant inequality from HB.5/growth-at-all-roots-of-unity.
`hblock` is the concrete finite-product estimate, not an abstract analytic predicate.
The left side is the parent f(α+it/(2π)), written as its literal complex series. -/
lemma nahmRoot_le_majorant
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (α : ℚ) (t c : ℝ) (hA : A.PosDef) (ht : 0 < t) (hc : 0 < c)
    (hζ : IsPrimitiveRoot (Complex.exp (2 * (Real.pi : ℂ) * Complex.I * (α : ℂ)))
      (m : ℕ))
    (hblock : ∀ N : ℕ,
      c * pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (N / (m : ℕ)) ≤
        ‖pcfin (Complex.exp (2 * (Real.pi : ℂ) * Complex.I * (α : ℂ) - (t : ℂ))) N‖) :
    ‖∑' n : Fin r → ℕ,
      Complex.exp ((2 * (Real.pi : ℂ) * Complex.I * (α : ℂ) - (t : ℂ)) *
        (qval A B C (fun i => (n i : ℚ)) : ℂ)) /
      ∏ i, pcfin
        (Complex.exp (2 * (Real.pi : ℂ) * Complex.I * (α : ℂ) - (t : ℂ))) (n i)‖ ≤
        c⁻¹ ^ r * residueMajorant A B C m t := by
  sorry

/-
Signatures omitted because their honest supplier carriers are absent at the baseline:

* nahmRoot_exponential_bound: the preceding majorant inequality is O(exp(Λ/(m²t)))
  at 0+, with Λ the parent complementary Rogers value of the distinguished solution.
  Needs the actual Rogers-value and distinguished-solution definitions, not a free Λ.

* nahm_cusp_valuation_lower_bound, nahm_cusp_zero_valuation,
  nahm_infinity_valuation: for the parent finite-index weight-zero modular function,
  normalized cusp valuation v_P is at least -Λ/(4π²), equals that at zero, and is
  min Q(n) at infinity. Requires the parent Laurent-expansion and width carriers.

* nahm_constant_kummer_class: with the integral symbol η_E in the fixed extension E,
  the corrected nonzero constant u has [u^n]=R_ζ(η_E)^(-1) in E_n×/(E_n×)^n.
  Requires B_CGZ, R_ζ and the corrected HB.4 constant-term object; its coefficient
  and eigenspace inputs are the one explicit packet gap, not fields of a fake record.

* nahm_modular_constant_comparison, nahm_constant_fixed_power: u equals
  μ_b^(-1) ω_d^(-1) e(-Cb/d) e(-λc/d) K, and u^s belongs to F_d× for a fixed
  s divisible by 24, 2den(B), den(C), den(λ). Requires the actual expansion objects,
  Dedekind sum and embedded Nahm number field. Gauss phases remain inside Φ.

* nahm_rational_bloch_bridge: bounded powers for an unbounded set of good n force
  the original rationalized ξ_F to be zero. Only η_E is reduced modulo n; apply
  good-order R injectivity, the parent CGZ/Suslin torsion criterion and extension
  of embeddings before descending through the regulator criterion.

The parent named endpoints modularity-implies-torsion and introductory-formulation
are imported by node ID; they are not redeclared in this follow-up.
-/

end TauCeti.Nahm.HB5
