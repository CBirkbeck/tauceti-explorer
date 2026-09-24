/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EllipticRegulators.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-EllipticRegulators: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

Conventions fixed here, and they matter more than usual because every downstream
scalar depends on them.

* `qParameter` comes from an ORIENTED basis; for a curve over ℝ the orientation of
  the real locus makes it real with `-1 < q < 1`, and reversing the orientation
  flips the sign of `ellipticDilog`.
* `ellipticR = ellipticLogCompanion + I • ellipticDilog` (Bloch's convention).
  Both parts are carried: the complex regulator formula is a statement about
  `ellipticR`, and the identity for its imaginary part alone does not give it.
* `diamond (f) (g) = Σ mᵢnⱼ [Qⱼ - Pᵢ]` — second minus first. The opposite
  convention negates the divisor and flips every later sign.
* `finiteFourier` is normalised by `1/C`, not `1/C²`.
* `regulatorNormalisation` is fixed by comparison with the universal regulator,
  NOT by requiring an L-value formula to hold. `normalisation_not_by_fiat` records
  that.

Deligne cohomology, the dilogarithm, Kronecker–Eisenstein series and Riemann
surfaces do not exist at the pins; Mathlib's `PeriodPair`/`weierstrassP` are the
one substantial pinned input.
-/
import Mathlib.Analysis.SpecialFunctions.Elliptic.Weierstrass
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic

noncomputable section

namespace TauCeti.EllipticRegulator

open Complex

/-! ## ER.1 — the analytic curve -/

/-- ER.1/complex-uniformisation. Mathlib has `℘`, `℘′`, `g₂`, `g₃` and
`℘′² = 4℘³ - g₂℘ - g₃`; the GROUP ISOMORPHISM is what is missing. -/
theorem uniformisation_isGroupIso (Λ : PeriodPair) : True := by sorry

theorem lattice_discriminant_ne_zero (Λ : PeriodPair) : True := by sorry

theorem exists_lattice_of_curve : True := by sorry

/-- ER.1/the-q-parameter. Oriented basis; for `E/ℝ`, `q` is real in `(-1,1)`. -/
def qParameter : ℂ := by sorry

theorem qParameter_abs_lt_one : True := by sorry
theorem qParameter_real_of_realCurve : True := by sorry
theorem qParameter_changeOfBasis : True := by sorry

/-- ER.1/periods. The period matrix is the MATRIX OF THE PAIRING, and its
non-degeneracy is a theorem about the comparison — not a definition. -/
def periodMatrix : True := by sorry
theorem periodMatrix_nondegenerate : True := by sorry
theorem intersectionPairing_perfect : True := by sorry

/-- ER.1/all-embeddings. A statement at one embedding is not a statement at all
of them. -/
theorem embeddings_conjugation_compat : True := by sorry

/-! ## ER.2 — Deligne cohomology and the regulator -/

def deligneCohomology : Type := by sorry
theorem deligneCohomology_exactSequence : True := by sorry
theorem deligneCohomology_rank_one_over_Q : True := by sorry

/-- ER.2/the-eta-form. -/
def etaForm : True := by sorry
theorem etaForm_extDeriv : True := by sorry
theorem etaForm_closed_of_units : True := by sorry
theorem etaForm_local_behaviour : True := by sorry

/-- ER.2/the-regulator-on-symbols. -/
def symbolRegulator : True := by sorry
theorem symbolRegulator_steinberg : True := by sorry
theorem symbolRegulator_indep_of_cuts : True := by sorry
theorem symbolRegulator_eq_periodPairing_of_tame_vanishes : True := by sorry

/-- ER.2/the-normalisation-factor: fixed by comparison with the universal
regulator. -/
def regulatorNormalisation : ℝ := by sorry
theorem regulatorNormalisation_eq_universal : True := by sorry

/-- The factor may NOT be chosen to make an L-value formula come out true. -/
theorem normalisation_not_by_fiat : True := by sorry

/-! ## ER.3 — the elliptic dilogarithm -/

/-- The Bloch–Wigner function is `Polylogarithms:P.1`'s; absent at the pins. -/
variable (blochWigner : ℂ → ℝ)

/-- ER.3/the-elliptic-dilogarithm: `Σ_{n ∈ ℤ} D(x qⁿ)`. -/
def ellipticDilog : ℂ → ℝ := by sorry

theorem ellipticDilog_converges : True := by sorry
theorem ellipticDilog_smooth_off_zero : True := by sorry
theorem ellipticDilog_distribution (n : ℤ) (hn : n ≠ 0) : True := by sorry
theorem ellipticDilog_sign_of_orientation : True := by sorry

/-- ER.3/the-companion: the naive log sum DIVERGES; the Bernoulli correction is
not cosmetic. -/
def ellipticLogCompanion : ℂ → ℝ := by sorry
theorem naive_log_sum_diverges : True := by sorry
theorem ellipticLogCompanion_converges : True := by sorry

/-- Bloch's convention. -/
def ellipticR : ℂ → ℂ := by sorry
@[simp] theorem ellipticR_im : True := by sorry
theorem ellipticR_q_invariant : True := by sorry

/-- ER.3/the-steinberg-relation-by-truncation: annuli, uniform estimates on BOTH
parts, then a limit. -/
theorem ellipticR_steinberg : True := by sorry
theorem imaginary_part_alone_insufficient : True := by sorry

/-- ER.3/fourier: the interchange is justified, and at the singular point the
regularised expression is used. -/
theorem ellipticR_fourier : True := by sorry
theorem kroneckerEisenstein_identification : True := by sorry

/-! ## ER.4 — the divisor formula -/

/-- ER.4/the-diamond-convolution: second minus first. -/
def diamond : True := by sorry
theorem diamond_bilinear : True := by sorry
theorem diamond_degree : True := by sorry
theorem diamond_convention_sign : True := by sorry

/-- ER.4/the-divisor-formula. -/
theorem divisor_formula : True := by sorry
theorem divisor_formula_indep_of_lifts : True := by sorry
theorem lift_conditions_needed : True := by sorry

/-- ER.4/the-regulator-of-the-corrected-classes. -/
theorem constant_corrections_contribute_zero : True := by sorry
def finiteFourier : True := by sorry
theorem finiteFourier_normalisation : True := by sorry

/-- ER.4/transfer-and-the-trace-formula. REQUIRED before any extension by
transfer. -/
theorem regulator_trace_formula : True := by sorry

/-! ## ER.5 — the CM example -/

def cmHeckeCharacter : True := by sorry
theorem deuringComparison : True := by sorry
theorem deuringComparison_badPrimes : True := by sorry
theorem not_from_endomorphisms_alone : True := by sorry

/-- ER.5/the-class-U: a SPECIFIED finite combination, proved to descend. -/
def blochClassU : True := by sorry
theorem blochClassU_descends : True := by sorry

/-- ER.5/the-L-value-theorem: an equality with an EXPLICIT scalar. The scalar is
recorded from the roadmap's transcription; the monograph's scan has no text layer
in this environment. -/
theorem bloch_L_value : True := by sorry
theorem scalar_is_explicit_not_existential : True := by sorry

theorem L_value_ne_zero : True := by sorry
theorem blochClassU_ne_zero : True := by sorry

/-- NOT claimed: spanning, non-maximal orders, larger class number. -/
theorem spanning_is_a_conjecture : True := by sorry

/-! ## ER.6 — integral parts and Beilinson -/

def regulatorOnIntegralPart : True := by sorry
theorem integralPart_finiteDimensional_is_an_import : True := by sorry

theorem beilinson_leadingTerm_form : True := by sorry
theorem beilinson_valueAtTwo_form : True := by sorry
theorem beilinson_forms_equivalent : True := by sorry

/-- ER.6/three-conclusions: (1) and (2) do NOT imply (3). -/
theorem conclusion_one : True := by sorry
theorem conclusion_two : True := by sorry
theorem conclusion_three : True := by sorry
theorem one_and_two_do_not_imply_three : True := by sorry

/-- ER.6/the-vertical-step: unramified ≠ integral. -/
theorem unramified_not_integral : True := by sorry

/-! ## ER.7 — modular elliptic curves -/

def modularUnit : True := by sorry
theorem modularUnit_divisor_on_cusps : True := by sorry
theorem maninDrinfeld : True := by sorry
theorem modularSymbol_mem_K2_complete : True := by sorry

/-- ER.7/the-regulator-integral: the explicit finite-level theorem. -/
theorem rankinSelberg_evaluation : True := by sorry
theorem exists_character_nonvanishing_twist : True := by sorry

theorem explicit_elliptic_formula : True := by sorry
theorem coefficients_independent_of_curve : True := by sorry

/-- ER.7/the-pushforward: conditional first, unconditional only by importing
modularity. -/
theorem pushforward_conditional : True := by sorry
theorem pushforward_unconditional_of_modularity : True := by sorry
theorem beilinson_phrase_is_not_a_rank_statement : True := by sorry

/-! ## ER.8 — p-adic side and examples -/

theorem syntomic_regulator_on_symbols : True := by sorry
theorem padic_conjecture_needs_its_ingredients : True := by sorry
theorem ER5_is_independent_of_padic : True := by sorry

theorem example_P1_normalisation : True := by sorry
theorem example_CM_certificate : True := by sorry
theorem example_nonrational_transfer : True := by sorry
theorem example_bad_fibre_integrality : True := by sorry

/-- A numerical approximation may accompany a proof but cannot replace an
identity. -/
theorem numerics_are_not_a_proof : True := by sorry

end TauCeti.EllipticRegulator
