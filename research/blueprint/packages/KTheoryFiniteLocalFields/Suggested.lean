import Mathlib
import TauCeti.CategoryTheory.GrothendieckGroup.FiniteDimensionalVectorSpace

/-!
# KTheoryFiniteLocalFields: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures statable
against the pinned APIs and is not exhaustive. It fixes the valuation-coordinate order in the
tame boundary and defines the maximal divisible subgroup using actual additive subgroups.
The K-theory, homotopy, logarithmic and trace constructions are targets of the README.
-/

namespace TauCetiRoadmap.KTheoryFiniteLocalFields

/-! ## Layer 0: completed KU and pullback cohomology -/

/-! ## Layer 1: refinements of the supplied finite-field comparison -/

-- The dimension equivalence is a supplier, not a new K₀ calculation.
#check TauCeti.SplitK0.finrankEquiv

/-! ## Layer 2: henselian rings away from the residue characteristic -/

/-! ## Layer 3: integral K₂ and Moore's theorem -/

namespace Tame

variable {k : Type*} [CommRing k]

/-- The residue-coordinate expression for the left-linear boundary:
`∂{π^r u, π^s v} = (-1)^(r*s) * ū^s * v̄^(-r)`.
The agreement with K₂ is a separate README target. -/
def tameCoordinate (r s : ℤ) (u v : kˣ) : kˣ :=
  (-1 : kˣ) ^ (r * s) * u ^ s * v ^ (-r)

/-- Changing the order of the two inputs inverts the boundary. -/
theorem tameCoordinate_swap (r s : ℤ) (u v : kˣ) :
    tameCoordinate s r v u = (tameCoordinate r s u v)⁻¹ := by
  sorry

/-- Replacing `π` by `cπ` changes the unit coordinates by `c^(-r)` and `c^(-s)`.
The residue boundary itself is independent of the uniformizer. -/
theorem tameCoordinate_change_uniformizer (r s : ℤ) (u v c : kˣ) :
    tameCoordinate r s (c ^ (-r) * u) (c ^ (-s) * v) =
      tameCoordinate r s u v := by
  sorry

/-- Multiplication in the first valuation/unit pair gives multiplication of the coordinates. -/
theorem tameCoordinate_mul_left (r₁ r₂ s : ℤ) (u₁ u₂ v : kˣ) :
    tameCoordinate (r₁ + r₂) s (u₁ * u₂) v =
      tameCoordinate r₁ s u₁ v * tameCoordinate r₂ s u₂ v := by
  sorry

/-- The numerical residue-field witnesses use the prime field of order five. -/
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

/-- The unit/uniformizer pair has positive unit boundary. -/
example :
    ((tameCoordinate 0 1 (Units.mk0 (2 : ZMod 5) (by decide)) 1 : (ZMod 5)ˣ) :
      ZMod 5) = 2 := by
  decide

/-- Two uniformizers detect the sign, even when both unit coordinates are trivial. -/
example :
    ((tameCoordinate 1 1 (1 : (ZMod 5)ˣ) 1 : (ZMod 5)ˣ) : ZMod 5) = 4 := by
  decide

/-- Two uniformizers retain the `(-1)^(rs)` factor. -/
theorem tameCoordinate_two_uniformizers_mod_five : ((tameCoordinate 1 1 (1 : (ZMod 5)ˣ) 1 : (ZMod 5)ˣ) : ZMod 5) = 4 := by
  sorry

/-- Negative valuation exponents occur in local fields. -/
theorem tameCoordinate_negative_valuation_mod_five :
    ((tameCoordinate (-1) 1 (Units.mk0 (2 : ZMod 5) (by decide))
      (Units.mk0 (3 : ZMod 5) (by decide)) : (ZMod 5)ˣ) : ZMod 5) = 4 := by
  sorry

/-- A change from `π` to `2π` preserves the first numerical boundary. -/
theorem tameCoordinate_changed_uniformizer_mod_five :
    ((tameCoordinate 0 1 (Units.mk0 (2 : ZMod 5) (by decide))
      (Units.mk0 (3 : ZMod 5) (by decide)) : (ZMod 5)ˣ) : ZMod 5) = 2 := by
  sorry

/-- The residue unit group at two is trivial. -/
theorem tameCoordinate_char_two (r s : ℤ) (u v : (ZMod 2)ˣ) : tameCoordinate r s u v = 1 := by
  sorry

/-- The coordinate definition also covers the zero ring, whose unit group is trivial. -/
theorem tameCoordinate_zero_ring (r s : ℤ) (u v : (ZMod 1)ˣ) : tameCoordinate r s u v = 1 := by
  sorry

end Tame

/-! ## Layer 4: the logarithmic trace and localization -/

/-! ## Layer 5: logarithmic Witt and residue-characteristic calculations -/

/-! ## Layer 6: local higher K-groups -/

namespace Divisible

variable (A : Type*) [AddCommGroup A]

/-- The supremum of the divisible additive subgroups of an abelian group.
Divisibility is expressed as surjectivity of every positive integer multiplication. -/
def maxDivisible : AddSubgroup A :=
  sSup {D : AddSubgroup A | ∀ n : ℕ, n ≠ 0 → ∀ x : D, ∃ y : D, n • y = x}

/-- This subgroup is itself divisible in Mathlib's sense. -/
theorem maxDivisible_divisible : Nonempty (DivisibleBy (maxDivisible A) ℤ) := by
  sorry

/-- Membership means membership in an actual divisible subgroup, not merely a sequence of
unrelated divisions in the ambient group. -/
theorem mem_maxDivisible_iff (a : A) :
    a ∈ maxDivisible A ↔ ∃ D : AddSubgroup A,
      (∀ n : ℕ, n ≠ 0 → ∀ x : D, ∃ y : D, n • y = x) ∧ a ∈ D := by
  sorry

/-- Divisible groups are exactly those for which the maximal divisible subgroup is all. -/
theorem maxDivisible_eq_top_iff :
    maxDivisible A = ⊤ ↔ Nonempty (DivisibleBy A ℤ) := by
  sorry

/-- The quotient by the maximal divisible subgroup is reduced. -/
theorem maxDivisible_quotient : maxDivisible (A ⧸ maxDivisible A) = ⊥ := by
  sorry

/-- Divisibility gives an internal complement, with no preferred choice of complement. -/
theorem exists_isCompl_maxDivisible :
    ∃ C : AddSubgroup A, IsCompl (maxDivisible A) C := by
  sorry

/-- The maximal divisible subgroup is functorial for additive homomorphisms. -/
theorem map_maxDivisible_le {B : Type*} [AddCommGroup B] (f : A →+ B) :
    (maxDivisible A).map f ≤ maxDivisible B := by
  sorry

/-- Finite products preserve the maximal divisible subgroup. -/
theorem maxDivisible_prod (B : Type*) [AddCommGroup B] :
    maxDivisible (A × B) = (maxDivisible A).prod (maxDivisible B) := by
  sorry

/-- A finite abelian group has no nonzero divisible subgroup. -/
theorem maxDivisible_eq_bot_of_finite [Finite A] : maxDivisible A = ⊥ := by
  sorry

/-- The rational additive group is divisible. -/
example : maxDivisible ℚ = ⊤ := by
  apply top_unique
  apply le_sSup
  intro n hn x
  refine ⟨⟨(x : ℚ) / (n : ℚ), trivial⟩, ?_⟩
  apply Subtype.ext
  change n • ((x : ℚ) / (n : ℚ)) = (x : ℚ)
  rw [nsmul_eq_mul]
  exact mul_div_cancel₀ _ (by exact_mod_cast hn)

/-- A finite-exponent group cannot contain a nonzero divisible subgroup. -/
example : maxDivisible (ZMod 6) = ⊥ := by
  apply le_antisymm
  · apply sSup_le
    intro D hD x hx
    obtain ⟨y, hy⟩ := hD 6 (by decide) ⟨x, hx⟩
    change x = 0
    have h : (6 : ℕ) • (y : ZMod 6) = 0 := by
      rw [nsmul_eq_mul, ZMod.natCast_self, zero_mul]
    exact (congrArg Subtype.val hy).symm.trans h
  · exact bot_le

/-- Integer divisibility is not the subgroup `wℤ` for a fixed positive `w`. -/
theorem maxDivisible_int : maxDivisible ℤ = ⊥ := by
  sorry

/-- The divisible and reduced factors are retained separately. -/
theorem maxDivisible_rat_prod_zmod_six :
    maxDivisible (ℚ × ZMod 6) = (⊤ : AddSubgroup ℚ).prod ⊥ := by
  sorry

end Divisible

/-! ## Layer 7: arithmetic completion interfaces -/

/-
The README also specifies the following constructions whose carriers are not present here:
the compact augmentation-kernel tower, continuous completed Adams operations, the multiplicative
Eilenberg–Moore pullback comparison and height-one module realization,
finite-coefficient and completed K-theory, Bott classes, profinite changes of the supplied
Brauer comparison, normalized relative Chern classes, finite-field restriction and transfer,
the universal equivariant Chern/slant and Moore-Hurewicz maps, the finite-field edge,
the Lang torsor and its geometric classifying comparison,
the full norm-residue map and its kernel, the linear Waldhausen THH model, classical TR and
TC, the Connes operator, the HM Tate-cochain comparison and Tate spectral sequence, the
logarithmic DVR THH/TR/TC objects, the Cohen/Witt coefficient presentation, the residue
coefficient map on Witt vectors modulo p,
modified Verschiebung, the Frobenius-twisted derivation and hW module, logarithmic trace
structure maps, the normalized log-THH class κ, the Lubin–Tate unit and α coordinates,
TR Bott classes, the Dwyer–Friedlander comparison, the early étale edge and Chern maps,
the left-exactness, torsion-freeness and bounded-exponent lemmas on the supplied Tate module,
the weightwise twisted-TR inverse limits, and arithmetic and
semilocal completion maps. The Tate-module carrier is supplied by the current Tau Ceti library.
The local height-one module comparison, its cyclotomic Iwasawa calculation, actual spectrum
splitting and valuation compatibility, and the logarithmic, cyclotomic, hermitian and finite-rank symplectic milestones remain in README.md.
-/

end TauCetiRoadmap.KTheoryFiniteLocalFields
