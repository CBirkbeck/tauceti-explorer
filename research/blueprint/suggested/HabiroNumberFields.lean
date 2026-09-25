/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroNumberFields.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-HabiroNumberFields: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

Conventions fixed here.

* `blochCGZ` and `blochSuslin` are DIFFERENT names for the two conventions. They
  agree after inverting 6; `bloch_compare_primary` records the bounded 2- and
  3-primary difference. Nothing here identifies them integrally.
* `chernScalar` is the universal invertible scalar in `R = c ^ chernScalar`.
  `chernScalar_eq_two_of_odd` is Hutchinson's refinement, with ITS hypotheses;
  `chernScalar_not_one` records that it is not set to 1 outside them.
* `eigenProjection` needs the group order invertible; `eigenKernel` is the
  integral formulation and `eigen_agree_of_invertible` relates them. Never divide
  formally.
* `HabiroRingNF R` is GSWZ Definition 1.1 — the gluing condition, not a naive
  limit. `constant_families_need_not_glue` says why there is no naive `R`-algebra
  structure.
* Local rank one is LOCAL: `localModule_rankOne` is at a prime;
  `not_globally_free` and `mul_not_iso` block the global readings.

`K₃`, the Bloch group, Galois cohomology, Chern classes and the p-adic regulator
are all `variable`s: they are owned by `K3BlochGroups`, `MotivicEtaleKTheory` and
`PadicHodgeRegulators`, and are imported by name.
-/
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.RingTheory.RootsOfUnity.Basic

noncomputable section

namespace TauCeti.HabiroNF

variable (K : Type*) [Field K] [NumberField K]

/-! ## HB.1 — Bloch conventions and the finite Chern class -/

variable (K3 : Type*) (blochCGZ blochSuslin : Type*)

/-- After inverting 6 the two conventions agree. -/
theorem bloch_compare_invert_six : True := by sorry

/-- Integrally they differ by bounded 2- and 3-primary groups. -/
theorem bloch_compare_primary : True := by sorry

/-- Suslin's sequence, imported from `K3BlochGroups:V.4`. -/
theorem suslin_sequence : True := by sorry
theorem suslin_iso_mod_odd : True := by sorry

/-- HB.1/finite-coefficient-K3-and-the-chern-class. -/
def K3mod (n : ℕ) : Type := by sorry
theorem K3mod_bockstein : True := by sorry
def chernClass : True := by sorry
theorem chernClass_iso_ind : True := by sorry
theorem chernClass_iso_numberField : True := by sorry
theorem milnorK3_eq_zero_of_totallyImaginary : True := by sorry

/-- The cohomological input is IMPORTED, not assumed. -/
theorem cohomological_input_imported : True := by sorry

/-- HB.1/the-excluded-primes. -/
def excludedSet : Finset ℕ := by sorry
theorem excludedSet_finite : True := by sorry
theorem RMap_injective_of_coprime : True := by sorry
theorem RMap_image_units_of_prime : True := by sorry
theorem RMap_image_Sunits : True := by sorry

/-- HB.1/the-eigenspace: two formulations. -/
def eigenProjection : True := by sorry
def eigenKernel : True := by sorry
theorem eigen_agree_of_invertible : True := by sorry
theorem no_formal_division_by_order : True := by sorry

/-! ## HB.2 — the cyclic quantum dilogarithm -/

def cyclicQuantumDilog (n : ℕ) : True := by sorry
def RMap (n : ℕ) : True := by sorry

theorem RMap_wellDefined : True := by sorry
theorem RMap_fiveTerm : True := by sorry
theorem RMap_distribution : True := by sorry
theorem RMap_galois : True := by sorry
theorem RMap_root_power : True := by sorry

def kummerClass : True := by sorry
def rootTorsor : True := by sorry

/-- Units, S-units, Kummer classes and quotients are FOUR objects. -/
theorem four_objects_distinct : True := by sorry

/-- CGZ Theorem 1.6: `R = c ^ β` for a universal invertible `β`. -/
def chernScalar : ℕ := by sorry
theorem RMap_eq_chern_pow : True := by sorry
theorem chernScalar_field_independent : True := by sorry

/-- Hutchinson: `β = 2` for odd orders, with HIS hypotheses. -/
theorem chernScalar_eq_two_of_odd : True := by sorry

/-- Outside those hypotheses the scalar is NOT set to one. -/
theorem chernScalar_not_one : True := by sorry

/-- The three inputs of the refinement. -/
def cyclicBarCycle : True := by sorry
theorem cyclicBarCycle_exact_order : True := by sorry
def bottElement : True := by sorry
theorem souleProductFormula : True := by sorry
theorem chern_of_distinguished_element : True := by sorry

/-! ## HB.6 — the number-field Habiro ring -/

variable (Δ : ℕ)

def coeffRing (m : ℕ) : Type := by sorry
def coeffRingCompletion (m : ℕ) (p : ℕ) : Type := by sorry
def frobenius (p : ℕ) : True := by sorry

theorem frobenius_lifts_residue : True := by sorry

/-- The Frobenius is NOT a global automorphism of `K` in general. -/
theorem frobenius_not_global_automorphism : True := by sorry

/-- For `K/ℚ` abelian a global lift exists — a SEPARATE result. -/
theorem abelian_global_lift : True := by sorry

/-- GSWZ Definition 1.1. -/
def HabiroRingNF : Type := by sorry

theorem HabiroRingNF_glue : True := by sorry
def HabiroRingNF.restrict (γ : ℕ) : True := by sorry
theorem glue_vacuous_at_inverted : True := by sorry

/-- The substitution is legitimate: `ζ_{pm} − ζ_m` is topologically nilpotent. -/
theorem diff_roots_topologically_nilpotent : True := by sorry
theorem subst_wellDefined : True := by sorry

theorem HabiroRingNF_isRing : True := by sorry
theorem HabiroRingNF_eq_classical_of_Q : True := by sorry

/-- Three things that are FALSE in general. -/
theorem constant_families_need_not_glue : True := by sorry
theorem not_domain_even_if_O_K_is : True := by sorry
theorem padic_comparison_keeps_full_algebra : True := by sorry

/-! ## HB.7 — the K₃-graded modules -/

variable (ξ : Type*) (padicRegulator : True)

/-- GSWZ Definition 1.3: the logarithmic Frobenius condition is Dwork's. -/
structure LocalSection where
  series : Unit
  frobCondition : Unit

def LocalSection.formalCompletion : True := by sorry
theorem LocalSection.exists : True := by sorry

def LocalModule : Type := by sorry

/-- GSWZ Theorem 1: rank one — AT A PRIME. -/
theorem localModule_rankOne : True := by sorry

/-- GSWZ Definition 1.4. -/
def HabiroModule : Type := by sorry
theorem HabiroModule_local_everywhere : True := by sorry
theorem HabiroModule_glue_pow : True := by sorry
theorem equivariance_removes_root_ambiguity : True := by sorry
@[simp] theorem HabiroModule_zero : True := by sorry

def HabiroModule.mul : True := by sorry
def HabiroModule.changeIndex : True := by sorry
def HabiroModule.baseChange : True := by sorry
def HabiroModule.galois : True := by sorry
def HabiroModule.restrictOrders : True := by sorry
def HabiroModule.evalAt : True := by sorry

theorem mul_adds_classes : True := by sorry

/-- Local rank one does NOT give global freeness. -/
theorem not_globally_free : True := by sorry

/-- Nor is every multiplication map an isomorphism. -/
theorem mul_not_iso : True := by sorry

end TauCeti.HabiroNF
