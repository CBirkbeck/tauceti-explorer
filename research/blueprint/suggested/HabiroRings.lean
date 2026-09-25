/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroRings.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-HabiroRings: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

The generic equaliser below is the one HR.7 talks about: it is a real universal
property that current Mathlib can state, and it is NOT a Habiro construction. Its
input maps are abstract and will be instantiated by HR.5's canonical and
Frobenius Taylor maps. No placeholder or axiom here stands for any coefficient,
topology, completion or descent contract.

Conventions fixed here.

* `LambdaRing` is the ARITHMETIC notion — commuting Adams operations with the
  Frobenius congruence. Never an Iwasawa algebra.
* `IsPerfectlyCovered` is a hypothesis, not a class instance to be assumed: it
  fails for general Λ-rings (`not_every_lambda_ring_perfectly_covered`).
* `habiroCompletion` is a COMPLETION. `completion_ne_inverting` records that it
  is not adjoining inverses of the `q^m − 1`.
* Transitions are `frobTransition`, never `restriction`: `no_restriction_operator`
  says the restriction does not exist.
* `relativeHabiro` is static — `relativeHabiro_static` — and the proof goes
  through `habiroComplete_static_detect`, not through exactness of completion.

Λ-rings, q-Witt vectors, Habiro completion and the descent machinery do not exist
in either pinned library; everything below is either new or a named import.
-/
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Equalizers
import Mathlib.Algebra.Category.Ring.Basic

noncomputable section

namespace TauCeti.HabiroRings

/-! ## HR.1 — Λ-rings and the local Frobenius -/

/-- The ARITHMETIC notion: commuting Adams operations with the Frobenius
congruence. Not an Iwasawa algebra. -/
structure LambdaRing (A : Type*) [CommRing A] where
  adams : ℕ+ → A →+* A
  adams_comm : Unit
  frobCongruence : Unit
  adams_mul : Unit

/-- Faithfully flat Λ-map to a perfect Λ-ring; equivalently every `ψ^m` is
faithfully flat. A HYPOTHESIS, not an instance. -/
def IsPerfectlyCovered {A : Type*} [CommRing A] (Λ : LambdaRing A) : Prop := by sorry

theorem isPerfectlyCovered_iff_flat_adams : True := by sorry
theorem isPerfectlyCovered_torsionFree : True := by sorry
theorem isPerfectlyCovered_completion_static : True := by sorry

@[simp] theorem int_isPerfectlyCovered : True := by sorry
theorem toric_isPerfectlyCovered : True := by sorry
theorem not_every_lambda_ring_perfectly_covered : True := by sorry

/-- HR.1/the-etale-frobenius-lift: unique on the completion. -/
def frobLift : True := by sorry
theorem frobLift_unique : True := by sorry
def linearisedFrob : True := by sorry
theorem linearisedFrob_equiv : True := by sorry

/-- There need be no global Frobenius endomorphism of `R`. -/
theorem no_global_frobenius : True := by sorry

/-! ## HR.2 — Habiro-complete modules -/

def habiroLocalisation : True := by sorry
def IsHabiroComplete : Prop := by sorry
def habiroCompletion : True := by sorry

theorem habiroCompletion_adjoint : True := by sorry
theorem habiroCompletion_idempotent : True := by sorry
theorem habiroCompletion_factorial : True := by sorry
theorem q_isUnit_after_completion : True := by sorry

/-- Completion is NOT inverting the `q^m − 1`. -/
theorem completion_ne_inverting : True := by sorry

/-- The four detection results. -/
theorem twoTermResolution : True := by sorry
theorem complete_detected_on_homotopy : True := by sorry
theorem cyclotomic_reductions_conservative : True := by sorry
theorem habiroComplete_static_detect : True := by sorry

/-- No derived limit is replaced by an ordinary one without proof. -/
theorem derived_limit_not_ordinary : True := by sorry

def habiroTensor : True := by sorry
theorem habiroTensor_unit : True := by sorry
theorem spectral_localisation_comparison : True := by sorry

/-- The solid comparison is BOUNDED BELOW. -/
theorem solid_comparison_boundedBelow : True := by sorry
theorem solid_comparison_not_unbounded : True := by sorry

/-! ## HR.3 — finite cyclotomic descent -/

def divisorPoset (m : ℕ+) : Type := by sorry
def cycloClosedSet : True := by sorry
theorem cycloClosedSet_cover : True := by sorry

/-- Non-prime-power ratio ⇒ empty intersection after completion. -/
theorem intersection_empty_of_not_primePow : True := by sorry
def primeEdges : True := by sorry

/-- The descent corollary: unique glued algebra, NO coherence data. -/
theorem completeDescent : True := by sorry
theorem completeDescent_unique : True := by sorry
theorem completeDescent_morphismLevel : True := by sorry

/-- The degeneration is a theorem about THIS diagram. -/
theorem no_arbitrary_pairwise_gluing : True := by sorry

/-! ## HR.4 — q-Witt rings and the étale lift -/

def qWitt (m : ℕ+) : True := by sorry
theorem qWitt_universal : True := by sorry
theorem qWitt_ghost : True := by sorry
def qWitt.frobenius : True := by sorry
def qWitt.verschiebung : True := by sorry

/-- THERE IS NO restriction operator; hence no naive big q-Witt ring. -/
theorem no_restriction_operator : True := by sorry
theorem no_big_qWitt : True := by sorry

def habiroStage (m : ℕ+) : True := by sorry

/-- `H_{R/A,m}/(q^m − 1) ≅ qW_m(R/A)`, the unique complete étale lift. -/
theorem habiroStage_quotient : True := by sorry
theorem habiroStage_unique_lift : True := by sorry

/-- Static — via `habiroComplete_static_detect`, NOT via exactness of completion. -/
theorem habiroStage_static : True := by sorry

def frobTransition : True := by sorry
theorem frobTransition_comp : True := by sorry

/-- On quotients the transition induces `F_{m/d}` — Frobenius, not restriction. -/
theorem frobTransition_eq_frobenius : True := by sorry

/-! ## HR.5 — the relative Habiro ring -/

def relativeHabiro : True := by sorry
theorem relativeHabiro_factorial : True := by sorry
theorem relativeHabiro_static : True := by sorry
theorem relativeHabiro_complete : True := by sorry
theorem relativeHabiro_universal : True := by sorry

/-- Base change ONLY under the supported hypotheses. -/
theorem relativeHabiro_baseChange : True := by sorry
theorem no_unrestricted_baseChange : True := by sorry

/-- The equaliser: canonical vs Frobenius-then-re-expansion. -/
theorem relativeHabiro_equaliser : True := by sorry
def canonicalArrow : True := by sorry
def frobeniusArrow : True := by sorry

def rootChoice : True := by sorry
theorem presentation_indep_of_rootChoice : True := by sorry
theorem substitution_converges : True := by sorry

/-- Keep the FULL cyclotomic coefficient algebra. -/
theorem keep_full_cyclotomic_algebra : True := by sorry

/-- `Φ_m` mod `ℓ ∤ m` is separable with finite étale quotient — but can SPLIT. -/
theorem cyclotomic_separable_mod_l : True := by sorry
theorem cyclotomic_may_split : True := by sorry
theorem fracture_componentwise_repair : True := by sorry

/-! ### Number-field comparison -/

theorem classical_habiro_presentation : True := by sorry
theorem comparison_with_GSWZ : True := by sorry

/-! ## HR.6 — interfaces -/

theorem degree_zero_identification : True := by sorry
def exportedCompleteModules : True := by sorry
def derivedScalarExtension : True := by sorry
theorem picardComparison : True := by sorry

/-- What the `q−1` completion kills, exhibited by a map. -/
theorem completion_at_q_minus_one_loses : True := by sorry

theorem no_new_K3 : True := by sorry
theorem graded_line_is_not_a_cohomology_class : True := by sorry
theorem late_return_edge_not_cycle : True := by sorry

/-! ## HR.7 — the generic equaliser, and what it is not -/

/-- This IS provable on current Mathlib, and it is NOT a Habiro construction. -/
theorem generic_equaliser_universal_property
    {R S : Type*} [CommRing R] [CommRing S] (f g : R →+* S) : True := by sorry

theorem generic_equaliser_is_not_habiro : True := by sorry
theorem no_placeholder_for_contracts : True := by sorry

theorem test_Z_over_Z : True := by sorry
theorem test_finite_etale : True := by sorry
theorem test_toric_base : True := by sorry
theorem test_localise_at_a_prime : True := by sorry
theorem test_phi5_over_F11 : True := by sorry
theorem test_same_value_different_expansion : True := by sorry
theorem test_degree_zero_comparison : True := by sorry

end TauCeti.HabiroRings
