import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.Norm.Defs

/-!
# Localization comparison: calibration at the pinned libraries

This file is not the roadmap and is not exhaustive. The reader document is
definitive; these statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. It claims no implementation. Proofs are
intentionally omitted.

The Milnor groups, Quillen groups, products and connecting maps are absent at
Mathlib 082e2d3 / Tau Ceti f790474. Consequently the new targets and the total
residue construction remain README targets. No missing carrier is replaced by
an axiomatic structure or a data definition with an omitted body.

The statements below calibrate the explicit inverse formula, the dependent
direct-sum sign transport and the determinant norm using existing carriers.
They do not assert a localization sequence or a K-theory comparison.
-/

namespace TauCetiRoadmap.K2SymbolsBrauer.LocalizationComparison

open scoped DirectSum

/-- The arithmetic comparison of the two displayed residue formulas.
The arguments are actual units; this is not a definition of a boundary. -/
theorem boundaryFormula_eq_inverse {k : Type*} [Field k]
    (u v : kˣ) (a b : ℤ) :
    (-1 : kˣ) ^ (a * b) * v ^ a * u ^ (-b) =
      ((-1 : kˣ) ^ (a * b) * u ^ b * v ^ (-a))⁻¹ := by
  sorry

-- A residue which distinguishes the actual boundary from the roadmap symbol.
example : (2 : ZMod 5)⁻¹ = 3 := by
  sorry

-- In degree three over ℚ(t)((π)), a second boundary distinguishes the sign.
-- The residue Φ₂{2,t} has t-adic boundary 1/2; its negative has boundary 2.
example : (2 : ℚ)⁻¹ = 1 / 2 ∧ (2 : ℚ)⁻¹ ≠ 2 := by
  sorry

-- Reversing the order reverses the value.
example : (3 : ZMod 5)⁻¹ = 2 := by
  sorry

-- A repeated uniformizer contributes the residue of -1, not the identity.
example : (-1 : ZMod 5) = 4 ∧ (-1 : ZMod 5) ≠ 1 := by
  sorry

-- Unit-part specialization at 10 of 5 is 1/2; the Quillen correction is -1/2.
example : (2 : ZMod 5)⁻¹ = 3 ∧ -(2 : ZMod 5)⁻¹ = 2 := by
  sorry

/-- Transport both arrows adjacent to the residue term by negation.
This is the algebra needed for a comparison of the displayed exact rows. -/
theorem negation_transport {A B C : Type*}
    [AddCommGroup A] [AddCommGroup B] [AddCommGroup C]
    (d : A →+ B) (j : B →+ C) :
    (-j).comp (-d) = j.comp d := by
  sorry

-- The residue fields may vary with the prime: retain a dependent direct sum.
example {ι : Type*} {A B : ι → Type*}
    [∀ i, AddCommGroup (A i)] [∀ i, AddCommGroup (B i)]
    (f : ∀ i, A i →+ B i) (x : ⨁ i, A i) (i : ι) :
    DirectSum.map f (-x) i = -(f i (x i)) := by
  sorry

-- Coordinatewise negation preserves the zero test used for the residue kernel.
example {ι : Type*} {A : ι → Type*} [∀ i, AddCommGroup (A i)]
    (x : ⨁ i, A i) : (-x = 0) ↔ ∀ i, x i = 0 := by
  sorry

-- Determinant norms retain the full field degree, without separability.
example {F E : Type*} [Field F] [Field E] [Algebra F E]
    [FiniteDimensional F E] (a : F) :
    Algebra.norm F (algebraMap F E a) = a ^ Module.finrank F E := by
  sorry

end TauCetiRoadmap.K2SymbolsBrauer.LocalizationComparison

/-!
README-only new targets:
* product-residue-comparison: D_n Phi_n = (-1)^(n-1) Phi_(n-1) r_n;
  Phi_2 is the product-normalized Matsumoto equivalence, with the constant
  torus sign retained when using the Hurewicz-normalized comparison instead.
* global-residue-hom: MilnorK.globalResidueHom and its apply, unique,
  support_subset, eq_zero_iff, degree_one, degree_two, quillen and reindex API;
  empty/zero, principal-divisor, rational-symbol, Steinberg, inverse/diagonal,
  degree-three and infinite-family tests. Missing Milnor carriers prevent these signatures at the pins.
* specialization-product-comparison: the right [-pi] formula for unit-part
  specialization, the correction r_n(x){-1} for the left [pi] specialization,
  and their common parameter-change formula.

Imported, without duplicate declarations: the local and Dedekind localization
targets, the Quillen transfer/residue square and the comparison of Milnor and
Quillen transfers in degree two; the earlier higher residues, specialization,
finite-support theorem, product law and Milnor norm construction.
-/
