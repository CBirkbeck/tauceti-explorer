import Mathlib.FieldTheory.KrullTopology
import Mathlib.FieldTheory.Galois.Infinite
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.Topology.Algebra.ContinuousMonoidHom

/-!
# Arithmetic Iwasawa theory, layers L1–L4: statements available at the library pins

This file is not the roadmap and is not exhaustive. The reader document
`IntegralIwasawaTheory--L1.md` is definitive; the statements below suggest Lean forms so that
contributors and reviewers converge on names and signatures. Every proof is `sorry`.

It complements the compact file of the I.8 pass (which holds the L0 cyclotomic carriers and
L3's `Vandiver` predicate) and does not restate it. Only light definitions over carriers that
exist at Mathlib 082e2d3 and Tau Ceti f790474 are given real bodies: the ℤ_p-extension
predicate and its layers, the p-rank of an abelian group and the relative class number. The
Iwasawa modules X and Y, the tower invariants μ, λ, ν, the Γ-transform, the Kubota–Leopoldt
series and the class-number growth theorem need carriers that are not at the pins; they are
README targets and are not replaced here by assumed structures.
-/

noncomputable section

namespace TauCeti.IntegralIwasawa

open NumberField

section ZpExtension

variable (p : ℕ) [Fact p.Prime] (K L : Type*) [Field K] [Field L] [Algebra K L]

/-- L2: a ℤ_p-extension is a Galois extension whose Galois group, with the Krull topology, is
continuously isomorphic to ℤ_p (RJW Definition A.1, p. 199; Sharifi Definition 3.1.1, p. 75). -/
def IsZpExtension : Prop :=
  IsGalois K L ∧ Nonempty (Gal(L/K) ≃ₜ* Multiplicative ℤ_[p])

variable {p K L}

/-- The subgroup Γ^{p^n} of a ℤ_p-extension, transported from the ideal p^n ℤ_p. -/
def zpLayerSubgroup (e : Gal(L/K) ≃ₜ* Multiplicative ℤ_[p]) (n : ℕ) : Subgroup Gal(L/K) :=
  (AddSubgroup.toSubgroup (Ideal.span {(p : ℤ_[p]) ^ n}).toAddSubgroup).comap
    e.toMulEquiv.toMonoidHom

/-- The n-th layer F_n, the fixed field of Γ^{p^n}. -/
def zpLayer (e : Gal(L/K) ≃ₜ* Multiplicative ℤ_[p]) (n : ℕ) : IntermediateField K L :=
  IntermediateField.fixedField (zpLayerSubgroup e n)

/-- L2 layer degree: [F_n : F] = p^n. -/
theorem finrank_zpLayer [IsGalois K L] (e : Gal(L/K) ≃ₜ* Multiplicative ℤ_[p]) (n : ℕ) :
    Module.finrank K (zpLayer e n) = p ^ n := sorry

/-- The layers increase with n. -/
theorem zpLayer_mono (e : Gal(L/K) ≃ₜ* Multiplicative ℤ_[p]) {m n : ℕ} (h : m ≤ n) :
    zpLayer e m ≤ zpLayer e n := sorry

/-- A finite extension is never a ℤ_p-extension: ℤ_p is infinite. -/
theorem not_isZpExtension_of_finiteDimensional [FiniteDimensional K L] :
    ¬ IsZpExtension p K L := sorry

-- The zeroth layer is the base field (unit test `zpLayer_zero`).
example [IsGalois K L] (e : Gal(L/K) ≃ₜ* Multiplicative ℤ_[p]) : zpLayer e 0 = ⊥ := sorry

-- Degenerate non-example: ℚ over itself is not a ℤ_3-extension.
example : ¬ IsZpExtension 3 ℚ ℚ := sorry

end ZpExtension

section Ranks

/-- The p-rank of an abelian group, read from its p-torsion: r_p(A) = log_p #A[p]
(RJW, before Corollary A.13, p. 206). For the finite groups used here this is dim_{𝔽_p} A/pA. -/
def pRank (p : ℕ) (A : Type*) [AddCommGroup A] : ℕ :=
  Nat.log p (Nat.card {a : A // p • a = 0})

example : pRank 2 (ZMod 4) = 1 := sorry

example : pRank 2 (ZMod 2 × ZMod 2) = 2 := sorry

-- A group of order prime to p has p-rank zero.
example : pRank 3 (ZMod 4) = 0 := sorry

end Ranks

section ClassNumbers

/-- The relative class number h⁻ = h(K)/h(K⁺), as a rational number; for CM fields it is an
integer (L4, relative class number formula; Washington 1978, p. 88). -/
def relClassNumber (K : Type*) [Field K] [NumberField K] : ℚ :=
  (classNumber K : ℚ) / classNumber (maximalRealSubfield K)

/-- For a CM field, h(K⁺) divides h(K). -/
theorem relClassNumber_isNat (K : Type*) [Field K] [NumberField K] [IsCMField K] :
    ∃ n : ℕ, relClassNumber K = n := sorry

-- ℚ(μ₂₃) has class number 3 and real class number 1.
example : relClassNumber (CyclotomicField 23 ℚ) = 3 := sorry

-- ℚ(μ₃₇) has class number 37 and real class number 1: 37 is irregular.
example : relClassNumber (CyclotomicField 37 ℚ) = 37 := sorry

/-- L3, `vandiver-plus-part-tower`: the left side is L3's `Vandiver p` of the I.8 file. Vandiver's
condition at the first layer propagates to every layer of the real cyclotomic tower
(RJW Corollary 13.16, p. 194). -/
theorem vandiver_iff_forall_pow (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    ¬ p ∣ classNumber (maximalRealSubfield (CyclotomicField p ℚ)) ↔
      ∀ n : ℕ, 1 ≤ n → ¬ p ∣ classNumber (maximalRealSubfield (CyclotomicField (p ^ n) ℚ)) :=
  sorry

-- Vandiver's condition does not imply regularity: p = 37.
example : ¬ 37 ∣ classNumber (maximalRealSubfield (CyclotomicField 37 ℚ)) ∧
    37 ∣ classNumber (CyclotomicField 37 ℚ) := sorry

end ClassNumbers

end TauCeti.IntegralIwasawa
