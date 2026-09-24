/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticKTheory--N.1.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ArithmeticKTheory--N.1: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

Naming decisions fixed here.

* `W j F` and `wInvariant j F`, never `rootsOfUnity` or `μ`. `W j F` is the
  Galois invariants of the *twisted* module `ℚ/ℤ(j)`; `NumberField.Units.torsion`
  is the untwisted group of roots of unity and is a DIFFERENT object — over `ℚ`
  the two have orders 2 and 24. Mathlib has the second complete and nothing of
  the first, so the confusion is available and the names must block it.
* `wInvariant` is introduced only after `W_finite`; the order of an infinite
  group is not what the source's `w_i(F)` means.
* The carrier is Mathlib's `Set.integer` / `Set.unit` (S-integers and S-units of
  the fraction field of a Dedekind domain). What N.1 adds is that for a NUMBER
  FIELD this ring is a localisation of the ring of integers — Tau Ceti's own
  `SInteger/Basic.lean` records that this fails for a general Dedekind domain.

K-groups are `variable`s: neither pinned library has any K-group beyond degree
zero, and the degree-zero and degree-one computations are owned by
`KTheoryLowDegrees` (Z.4, U.4). Étale cohomology of arithmetic schemes, the
twisted coefficient modules and the tame and wild kernels are likewise absent.
-/
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.Localization.Defs
import Mathlib.RingTheory.RootsOfUnity.Basic

noncomputable section

namespace TauCeti.ArithmeticK

open NumberField IsDedekindDomain

variable {F : Type*} [Field F] [NumberField F]

/-! ## N.1 — carriers and degrees zero and one -/

/-- N.1/S-integers-as-a-localisation. The carrier is Mathlib's `Set.integer`;
what is new is that for a NUMBER FIELD it is a localisation of `𝓞 F`. The proof
uses finiteness of the class group to make a power of each prime of S principal;
for a general Dedekind domain the statement is false. -/
theorem SIntegers_isLocalization (S : Finset (HeightOneSpectrum (𝓞 F))) : True := by sorry

theorem SIntegers_presentation_indep : True := by sorry

/-- Monotonicity of the RING in S. Only `Set.unit_mono`, for the unit group, is
pinned. -/
theorem SIntegers_mono : True := by sorry

theorem SIntegers_isDedekind : True := by sorry

/-- N.1/K0-of-S-integers. Imported from `KTheoryLowDegrees:Z.4`. -/
variable (K : ℕ → Type* → Type)

theorem K0_SIntegers : True := by sorry

/-- N.1/K1-of-S-integers-and-the-determinant. Imported from
`KTheoryLowDegrees:U.4`; the proof there is Bass–Milnor–Serre. -/
theorem K1_SIntegers_eq_units : True := by sorry

/-- `K₁(F) = Fˣ` is NOT the S-unit group: it is not finitely generated. -/
theorem K1_field_not_fg : True := by sorry

/-- N.1/norms-transfers-and-pullbacks. -/
def arithmeticTransfer (n : ℕ) : True := by sorry

theorem transfer_comp_pullback_eq_degree : True := by sorry

theorem arithmetic_projection_formula : True := by sorry

/-! ## N.2 — localisation and finite support -/

/-- N.2/localisation-sequence-for-a-dedekind-domain. For a ring of S-integers the
sum runs over the primes OUTSIDE S. -/
theorem localization_sequence : True := by sorry

/-- N.2/finite-support: the boundary lands in the DIRECT SUM, not the product. -/
theorem boundary_finite_support : True := by sorry

/-- N.2/the-three-classical-rows: three rows of ONE sequence. -/
theorem row_zero_class_groups : True := by sorry

theorem row_one_S_units : True := by sorry

theorem row_two_tame_kernel : True := by sorry

/-- N.2/soule-odd-isomorphism. THE additional theorem: `SK_n = 0` for `n ≥ 1`. -/
theorem soule_odd (n : ℕ) (hn : Odd n) (h3 : 3 ≤ n) : True := by sorry

theorem soule_even_short_exact : True := by sorry

/-- N.2/exactness-gives-no-injectivity. In degree zero the map is NOT injective:
the class group of `O_{F,S}` is a proper quotient. -/
theorem K0_map_not_injective : True := by sorry

/-! ## N.3 — finiteness and ranks -/

/-- N.3:finite-generation/finite-generation-of-K-of-S-integers (Quillen). -/
theorem Kn_SIntegers_fg (n : ℕ) : True := by sorry

/-- The two inputs, both imported: arithmetic-group finiteness
(`BorelRegulators:R.1`) and `K_*(F_q)` (`GeneralAlgebraicKTheory:K.1`). -/
theorem arithmetic_group_finiteness_input : True := by sorry

theorem finite_field_K_input : True := by sorry

/-- N.3:ranks/borel-rank-theorem. `n ≥ 2` only. -/
theorem borel_rank (n : ℕ) (hn : 2 ≤ n) : True := by sorry

theorem even_K_SIntegers_finite : True := by sorry

/-- The positive even K-groups of the FIELD are infinite torsion groups. -/
theorem even_K_field_infinite : True := by sorry

/-- N.3:ranks/the-first-K-group-is-not-covered: the degree-one rank is
`r₁ + r₂ + |S| − 1`, not the period-four value. -/
theorem rank_K1_eq_S_unit_rank : True := by sorry

/-- N.3/finiteness-and-ranks-combined. The splitting is NOT natural. -/
theorem Kn_eq_free_add_finite : True := by sorry

theorem splitting_not_natural : True := by sorry

/-! ## N.4 — roots of unity with twists -/

/-- The twisted module `ℚ/ℤ(j)` as a Galois module. Absent from both pinned
trees; Tau Ceti has the untwisted `KummerCoeff`. -/
def twistedRootsOfUnity (j : ℕ) : Type _ := by sorry

/-- N.4/the-w-invariant. `W j F = H⁰(F, ℚ/ℤ(j))`. -/
def W (j : ℕ) (F : Type*) [Field F] : Type _ := by sorry

theorem W_finite (j : ℕ) (hj : 0 < j) : True := by sorry

theorem W_isCyclic : True := by sorry

/-- Introduced ONLY after `W_finite`. -/
def wInvariant (j : ℕ) (F : Type*) [Field F] : ℕ := by sorry

theorem wInvariant_prod_primary : True := by sorry

/-- The e-invariant out of the torsion of the odd K-group. -/
def eInvariant (j : ℕ) : True := by sorry

/-- `w_i(F_q) = q^i − 1`, the order of `K_{2i−1}(F_q)`. -/
theorem wInvariant_finiteField : True := by sorry

/-- N.4/computing-w-from-the-cyclotomic-character, in the exponent form that
makes the computation a finite check. -/
theorem wInvariant_eq_max_exponent : True := by sorry

theorem wInvariant_cyclotomic : True := by sorry

/-- N.4/exceptional-fields-at-two. Every real number field is exceptional; so is
`ℚ(√−7)`. -/
def IsExceptional (F : Type*) [Field F] : Prop := by sorry

theorem real_isExceptional : True := by sorry

theorem harrisSegal_summand_of_nonExceptional : True := by sorry

/-- In the exceptional case only: the summand has order `w`, `2w` or `w/2`. -/
theorem harrisSegal_exceptional_weak : True := by sorry

/-- N.4/w2-of-the-rationals: `w₂(ℚ) = 24`, with 3-part 3 and 2-part 8. -/
theorem wInvariant_two_rat : wInvariant 2 ℚ = 24 := by sorry

/-- N.4/the-invariant-is-not-the-roots-of-unity. Over `ℚ`: orders 2 and 24. -/
theorem wInvariant_ne_card_torsion : True := by sorry

/-! ## N.5 — odd groups -/

/-- N.5/odd-groups-of-ring-and-field-agree, for `j ≥ 2`. -/
theorem odd_K_SIntegers_eq_field : True := by sorry

/-- N.5/totally-imaginary-integral-structure: `ℤ^{r₂} ⊕ ℤ/w_j(F)` in odd degrees
`≥ 3`. Covers `ℓ = 2` precisely BECAUSE the field is totally imaginary. -/
theorem odd_K_totallyComplex [IsTotallyComplex F] : True := by sorry

/-- N.5/the-real-case-modulo-eight. Four rows; the `n ≡ 5` row needs `w_i` even. -/
theorem odd_K_real_mod_eight : True := by sorry

theorem wInvariant_even_of_five_mod_eight : True := by sorry

/-- Degeneration check: with no real places the table becomes the totally
imaginary one. -/
theorem odd_K_real_degenerates : True := by sorry

/-- N.5/naturality-of-the-e-invariant-and-extensions. The splittings are NOT
natural; the e-invariant, the Chern maps, their kernels and the extension classes
are. A proof by matching cardinalities is not a proof. -/
theorem eInvariant_natural : True := by sorry

theorem chern_natural : True := by sorry

theorem cardinality_match_is_not_iso : True := by sorry

/-! ## N.6 — even groups and arithmetic cohomology -/

/-- N.6/even-groups-at-odd-primes. At `ℓ = 2` the totally imaginary hypothesis is
the statement `cd_2(O_S) = 2`. -/
theorem even_K_cohomological (l : ℕ) : True := by sorry

/-- N.6/the-two-primary-corrections: an eight-fold table with an EXTENSION in one
row and an intermediate rank `ρ` the theorem does not pin down. -/
theorem two_primary_table : True := by sorry

theorem two_primary_row_four_is_extension : True := by sorry

theorem two_primary_row_five_vanishes : True := by sorry

theorem totallyReal_two_power_divides : True := by sorry

/-- N.6/tame-and-wild-kernels. Different objects, different degrees. -/
def tameKernel : True := by sorry

def wildKernel (j : ℕ) : True := by sorry

def divisibleSubgroup (n : ℕ) : True := by sorry

/-- A theorem with an attribution, NOT to be assumed in an exceptional dyadic
case. -/
theorem wildKernel_eq_divisible : True := by sorry

theorem divisible_nonzero_in_degree_two : True := by sorry

/-- N.6/certificate-driven-computation. Four fields; three give only an upper
bound; a zeta value is admitted only as a PROVED second bound. -/
structure KCertificate where
  presentation : Unit
  relations_hold : Unit
  generates : Unit
  order_certified : Unit

theorem KCertificate.iso (c : KCertificate) : True := by sorry

theorem upper_bound_only_of_three_fields : True := by sorry

theorem zeta_value_is_not_a_definition : True := by sorry

end TauCeti.ArithmeticK
