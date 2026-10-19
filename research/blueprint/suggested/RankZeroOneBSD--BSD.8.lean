/-
This file is not the roadmap and is not exhaustive. The accompanying reader
document is definitive. These signatures suggest names and interfaces; proof
placeholders are intentional and assert no implementation.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The accepted BSD.7 packet owns the rational support/certificate core. Its
definitions are not copied here. The expressions involving numerator and
denominator below unfold that existing support, without defining it again.

README-only targets, because the actual arithmetic carriers are not available
together at these pins:
  primary-descent-certificate: actual Selmer and Sha, finite model equivalences;
  primary-order-extraction: actual Kummer sequence and exact primary order;
  zero-first-layer-primary-vanishing: its application to actual Sel_p;
  global-primary-order-product: actual whole-Sha annihilator and descent data;
  rank-one-search-certificate and rank-one-search-saturation: actual BSD height
    and certified complete finite search (no artificial point-data record);
  point-normalized-leading-quotient: actual derivative, period and free index;
  certified-local-factor-product: actual Tate traces and local point indices;
  leading-quotient-normalization: actual period/height comparison;
  arithmetic-data-identifies-defect: actual BSD.5 defect and its real identity;
  complete-exception-ledger: actual defect and the imported certificate carrier.

The generic additive-group and real-scalar statements below are explicitly
the algebraic projections of those targets, not stand-ins for elliptic data.
The only new definition is a light, real-bodied rational arithmetic function.
-/
import Mathlib.Data.Nat.PrimeFin
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.GroupTheory.Torsion
import Mathlib.Data.ZMod.Basic
import TauCeti.GroupTheory.Index.NSmul
import TauCeti.Algebra.Group.PrimaryDecomposition

namespace EllipticCurve.BSD

/-- Arithmetic bookkeeping. Actual invariant identifications are separate targets. -/
def normalizedDefect (a : ℚ) (t s C : ℕ) : ℚ :=
  a * (t : ℚ) ^ 2 / ((s : ℚ) * (C : ℚ))

theorem normalizedDefect_def (a : ℚ) (t s C : ℕ) :
    normalizedDefect a t s C = a * (t : ℚ) ^ 2 / ((s : ℚ) * (C : ℚ)) := by
  sorry

theorem normalizedDefect_pos {a : ℚ} {t s C : ℕ}
    (ha : 0 < a) (ht : 0 < t) (hs : 0 < s) (hC : 0 < C) :
    0 < normalizedDefect a t s C := by
  sorry

theorem normalizedDefect_unit_factors (a : ℚ) :
    normalizedDefect a 1 1 1 = a := by
  sorry

theorem normalizedDefect_zero_sha (a : ℚ) (t C : ℕ) :
    normalizedDefect a t 0 C = 0 := by
  sorry

theorem normalizedDefect_mul_denominator (a : ℚ) (t : ℕ) {s C : ℕ}
    (hs : 0 < s) (hC : 0 < C) :
    normalizedDefect a t s C * ((s : ℚ) * (C : ℚ)) = a * (t : ℚ) ^ 2 := by
  sorry

theorem normalizedDefect_eq_one_iff (a : ℚ) (t : ℕ) {s C : ℕ}
    (hs : 0 < s) (hC : 0 < C) :
    normalizedDefect a t s C = 1 ↔ a * (t : ℚ) ^ 2 = (s : ℚ) * (C : ℚ) := by
  sorry

theorem normalizedDefect_cancel_torsion_square (a : ℚ) {t : ℕ} (ht : 0 < t)
    (s C : ℕ) :
    normalizedDefect (a / (t : ℚ) ^ 2) t s C = a / ((s : ℚ) * (C : ℚ)) := by
  sorry

-- Unit tests of rational-defect-ledger, under their packet names.
-- normalizedDefect_rank_zero_torsion
example : normalizedDefect (1 / 5) 5 1 5 = 1 := by sorry
-- normalizedDefect_nontrivial_sha
example : normalizedDefect 36 1 4 9 = 1 ∧ normalizedDefect 36 1 1 9 = 4 := by sorry
-- normalizedDefect_rank_one_index
example : normalizedDefect (1 / 4) 1 1 1 = 1 / 4 ∧
    normalizedDefect ((2 : ℚ) ^ 2 * (1 / 4)) 1 1 1 = 1 := by sorry
-- normalizedDefect_zero_denominator
example : normalizedDefect 1 1 0 1 = 0 := by sorry

-- ledger-valuation-balance
theorem ledger_valuation_balance {p : ℕ} (hp : p.Prime) {a : ℚ}
    (ha : a ≠ 0) {t s C : ℕ} (ht : 0 < t) (hs : 0 < s) (hC : 0 < C) :
    padicValRat p (normalizedDefect a t s C) =
      padicValRat p a + 2 * padicValRat p (t : ℚ) -
        padicValRat p (s : ℚ) - padicValRat p (C : ℚ) := by
  sorry

-- ledger-support-cover, with the imported canonical support written out.
theorem ledger_support_cover {a : ℚ} (ha : a ≠ 0) {t s C : ℕ}
    (ht : 0 < t) (hs : 0 < s) (hC : 0 < C) :
    (normalizedDefect a t s C).num.natAbs.primeFactors ∪
        (normalizedDefect a t s C).den.primeFactors ⊆
      a.num.natAbs.primeFactors ∪ a.den.primeFactors ∪
        t.primeFactors ∪ s.primeFactors ∪ C.primeFactors := by
  sorry

-- The genuine group-theoretic part of zero-first-layer-primary-vanishing.
theorem primary_trivial_of_p_torsion_trivial {G : Type*} [AddCommGroup G]
    {p : ℕ} (hp : p.Prime) (h : ∀ x : G, p • x = 0 → x = 0) :
    ∀ x : AddCommGroup.primaryComponent G p, x = 0 := by
  sorry

-- The algebraic end statement of primary-order-extraction. No arithmetic
-- Kummer maps are supplied by this generic theorem.
theorem primary_order_of_finite_quotient {G F : Type*}
    [AddCommGroup G] [AddCommGroup F] [Finite F]
    {p n : ℕ} (hp : p.Prime) (hn : 0 < n)
    (A : AddSubgroup F)
    (e : (F ⧸ A) ≃+ (nsmulAddMonoidHom (α := G) (p ^ n)).ker)
    (hkill : ∀ x : AddCommGroup.primaryComponent G p, (p ^ n) • (x : G) = 0) :
    Finite (AddCommGroup.primaryComponent G p) ∧
      Nat.card F = Nat.card A * Nat.card (AddCommGroup.primaryComponent G p) := by
  sorry

-- The ambiguity test uses actual finite groups, with no invented Sha carrier.
-- primaryDescent_first_layer_ambiguity
example :
    Nat.card (nsmulAddMonoidHom (α := ZMod 2 × ZMod 2) 2).ker = 4 ∧
    Nat.card (ZMod 2 × ZMod 2) = 4 ∧
    Nat.card (nsmulAddMonoidHom (α := ZMod 4 × ZMod 4) 2).ker = 4 ∧
    Nat.card (ZMod 4 × ZMod 4) = 16 := by
  sorry

-- The existing Tau Ceti nsmul index includes both rank and torsion.
-- primaryDescent_rank_and_torsion (its group-theoretic input)
example : (nsmulAddMonoidHom (α := ℤ × ZMod 2) 2).range.index = 4 := by sorry
-- primaryDescent_partial_torsion (its finite-group input)
example : Nat.card (nsmulAddMonoidHom (α := ZMod 4) 2).ker = 2 ∧
    Nat.card (ZMod 4) = 4 := by sorry

-- Scalar projection of leading-quotient-normalization. The actual period and
-- regulator identifications in the reader are indispensable additional inputs.
theorem leadingQuotient_normalization {L ΩB RB Ωsrc Rsrc : ℝ}
    {u v aSrc : ℚ} {r : ℕ}
    (hΩB : ΩB ≠ 0) (hRB : RB ≠ 0) (hu : u ≠ 0) (hv : v ≠ 0)
    (hΩ : Ωsrc = (u : ℝ) * ΩB) (hR : Rsrc = (v : ℝ) ^ r * RB)
    (ha : (aSrc : ℝ) = L / (Ωsrc * Rsrc)) :
    ((u * v ^ r * aSrc : ℚ) : ℝ) = L / (ΩB * RB) := by
  sorry

example : (1 : ℚ) * (1 / 2) ^ 1 * 2 = 1 ∧
    padicValRat 2 ((1 : ℚ) * (1 / 2) ^ 1 * 2) = 0 := by sorry

-- Pin-native end statement of complete-exception-ledger, using the explicit
-- ledger support cover. This does not supply actual elliptic input data.
theorem normalizedDefect_eq_one_of_balances {a : ℚ} {t s C : ℕ}
    (ha : 0 < a) (ht : 0 < t) (hs : 0 < s) (hC : 0 < C)
    (hbal : ∀ p ∈ a.num.natAbs.primeFactors ∪ a.den.primeFactors ∪
        t.primeFactors ∪ s.primeFactors ∪ C.primeFactors,
      padicValRat p a + 2 * padicValRat p (t : ℚ) =
        padicValRat p (s : ℚ) + padicValRat p (C : ℚ)) :
    normalizedDefect a t s C = 1 := by
  sorry

theorem normalizedDefect_real_identity {a : ℚ} {t s C : ℕ} {L B : ℝ}
    (ha : 0 < a) (ht : 0 < t) (hs : 0 < s) (hC : 0 < C)
    (hB : B ≠ 0) (hreal : (normalizedDefect a t s C : ℝ) = L / B)
    (hbal : ∀ p ∈ a.num.natAbs.primeFactors ∪ a.den.primeFactors ∪
        t.primeFactors ∪ s.primeFactors ∪ C.primeFactors,
      padicValRat p a + 2 * padicValRat p (t : ℚ) =
        padicValRat p (s : ℚ) + padicValRat p (C : ℚ)) :
    L = B := by
  sorry

-- complete-exception-ledger tests of incomplete and complete scalar inputs.
-- exceptionLedger_missing_two
example : (∀ p : ℕ, p.Prime → p ≠ 2 → padicValRat p (2 : ℚ) = 0) ∧
    padicValRat 2 (2 : ℚ) = 1 := by sorry
-- exceptionLedger_torsion_sha_product
example : padicValRat 5 (1 / 5 : ℚ) + 2 * padicValRat 5 (5 : ℚ) =
    padicValRat 5 (1 : ℚ) + padicValRat 5 (5 : ℚ) := by sorry
-- exceptionLedger_negative_valuation
example : padicValRat 2 (1 / 4 : ℚ) = -2 := by sorry
-- exceptionLedger_empty_support
example : normalizedDefect 1 1 1 1 = 1 ∧
    ((1 : ℚ).num.natAbs.primeFactors ∪ (1 : ℚ).den.primeFactors) = ∅ := by sorry

end EllipticCurve.BSD
