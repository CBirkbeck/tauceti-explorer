/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/KatoEulerSystems.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-KatoEulerSystems: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established.

The reviewed library audit records all five layers as not built: the pinned
libraries have modular forms, cusp forms, the slash action, group cohomology,
p-adic numbers, cyclotomic extensions, L-series and Dirichlet characters, but no
Siegel functions, no modular curves Y(M,N) as schemes with their degeneracy maps,
no K_2 of a curve, no etale Chern character, no modular local system, no dual
exponential map and no p-adic L-function of a modular form. Almost everything below
is therefore an opaque signature.

Imported and never invented here: the Iwasawa form of the generic Euler-system
machine, which the source itself imports and which this packet requests from
EulerSystemsAndKolyvaginSystems ES.8, and the generalised explicit reciprocity law,
which Kato attributes to a companion paper that the packet records as unread.
-/
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.NumberTheory.LSeries.Basic
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.NumberTheory.ModularForms.SlashActions
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.PowerSeries.Basic

noncomputable section

namespace TauCeti.Kato

/-! ## L0 Siegel units -/

/-- L0/theta-function-c-normalised: the `c`-normalised theta function, a unit away from
the `c`-torsion. `c` is prime to `6` and to the level. -/
def cTheta (c : ℕ) : True := by sorry

theorem cTheta_divisor (c : ℕ) : True := by sorry

theorem cTheta_qExpansion (c : ℕ) : True := by sorry

/-- Two admissible choices of `c` agree only after inverting `c ^ 2 - 1`. -/
theorem cTheta_independent_after_inverting (c c' : ℕ) : True := by sorry

example : True := by sorry -- unit test: the divisor is supported on the c-torsion

example : True := by sorry -- unit test: c must be prime to 6; for c = 2 or 3 the
                           -- construction does not give a unit

example : True := by sorry -- unit test: two choices of c agree after inverting
                           -- c ^ 2 - 1, not before

/-- L0/siegel-units-and-c-independent-rationalisation: the Siegel unit `g_{a,b}` on
`Y(N)`, and its `c`-independent rationalisation. -/
def siegelUnit (N : ℕ) (a b : ZMod N) : True := by sorry

theorem siegelUnit_isUnit (N : ℕ) (a b : ZMod N) : True := by sorry

def siegelUnit_rationalise (N : ℕ) (a b : ZMod N) : True := by sorry

theorem siegelUnit_divisor_at_cusps (N : ℕ) (a b : ZMod N) : True := by sorry

example : True := by sorry -- unit test: invertible on the open curve, nonzero divisor
                           -- at the cusps

example : True := by sorry -- unit test: the distribution relation along a degeneracy map

example : True := by sorry -- unit test: the rationalisation does not mention c

/-- L0/siegel-unit-galois-action-and-distribution: the `GL_2(Z/N)`-equivariance and the
distribution relation. -/
theorem siegelUnit_galois_action (N : ℕ) : True := by sorry

theorem siegelUnit_distribution (N M : ℕ) : True := by sorry

/-- L0/siegel-unit-degeneracy-product-formula (Kato Lemma 2.12). -/
theorem siegelUnit_degeneracy_product : True := by sorry

/-! ## L1 Symbols and regulators -/

/-- L1/beilinson-element-in-K2-of-Y-M-N: the symbol of two Siegel units. -/
def beilinsonElement (M N : ℕ) : True := by sorry

theorem beilinsonElement_symbol (M N : ℕ) : True := by sorry

/-- L1/K2-norm-projection-formula-and-level-norm-relation. -/
theorem K2_norm_level_relation : True := by sorry

/-- L1/euler-factor-norm-relation-at-auxiliary-primes. The operator that appears is the
**dual** Hecke operator `T'(l)`, not `T(l)`. -/
theorem euler_factor_norm_relation : True := by sorry

example : True := by sorry -- unit test: the dual Hecke operator appears; with T(l)
                           -- the relation is false

/-- L1/etale-chern-moment-map-into-modular-local-system: `Ch_{M,N}(k,r,r')`. -/
def chernMoment (M N k r r' : ℕ) : True := by sorry

theorem chernMoment_target (M N k r r' : ℕ) : True := by sorry

/-- L1/hecke-and-diamond-equivariance-of-the-moment-map (Kato Lemma 8.8). -/
theorem chernMoment_hecke (M N k r r' : ℕ) : True := by sorry

theorem chernMoment_diamond (M N k r r' : ℕ) : True := by sorry

example : True := by sorry -- unit test: for k = 2 the map is the etale Chern character

example : True := by sorry -- unit test: the two twists r and r' are separate arguments

/-! ## L2 Global zeta classes -/

/-- L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology: the Perrin-Riou and
Rubin lemma. -/
theorem cyclotomic_limit_integral : True := by sorry

/-- L2/p-adic-zeta-elements-and-their-norm-relations. There are **two** norm relations. -/
def zetaElement (M N k r r' c d : ℕ) : True := by sorry

theorem zetaElement_norm_level : True := by sorry

theorem zetaElement_norm_p : True := by sorry

example : True := by sorry -- unit test: both norm relations hold; one of them alone is
                           -- not an Euler system

example : True := by sorry -- unit test: the element is integral, which is where the
                           -- integrality lemma is used

/-- L2/euler-system-datum-for-the-modular-lattice: the triple and its Euler polynomials.
Whether this datum satisfies the hypothesis package of the generic machine is *not*
settled here; two gaps record why. -/
structure EulerSystemDatum where
  lattice : True
  fields : True
  primes : True
  eulerPolynomials : True
  normCompatible : True

/-- L2/integral-zeta-submodule-and-finite-index (Kato Thm. 12.6). -/
theorem zeta_submodule_finite_index : True := by sorry

/-! ## L3 Explicit reciprocity -/

/-- L3/dual-exponential-map-on-the-modular-local-system. -/
def dualExp : True := by sorry

theorem dualExp_target : True := by sorry

example : True := by sorry -- unit test: for weight two the target is the cusp forms of
                           -- that weight and level

example : True := by sorry -- unit test: the dual exponential is not the exponential

/-- L3/generalised-explicit-reciprocity-law-for-zeta-elements (Kato Thm. 9.5), in its
three `p`-Euler-factor cases. Kato imports this from a companion paper; the packet
records that paper as unread. -/
theorem explicit_reciprocity_law : True := by sorry

/-- L3/zeta-class-interpolation-of-complex-L-values. -/
theorem zeta_class_interpolates_L_values : True := by sorry

/-- L3/beilinson-regulator-and-the-archimedean-zeta-value (Kato Thm. 2.6). -/
theorem beilinson_regulator_zeta_value : True := by sorry

/-! ## L4 Nonvanishing and the Euler-system divisibility -/

/-- L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra (Kato Thm. 13.4).
Imported: requested from EulerSystemsAndKolyvaginSystems ES.8. -/
theorem imported_euler_system_bound : True := by sorry

/-- L4/nonvanishing-of-the-zeta-submodule-at-height-zero (Kato Prop. 13.7). Its proof in
the source cites Thm. 13.6 (Ash-Stevens), Thm. 6.6, Thm. 9.7 and Thm. 13.5 (Rohrlich);
that citation list was re-read directly for this packet. -/
theorem zeta_submodule_nonvanishing : True := by sorry

/-- L4/cohomological-divisibility-one-direction. One direction only: the reverse
divisibility is not proved and Conjecture 12.10 remains a conjecture in the source. -/
theorem cohomological_divisibility : True := by sorry

/-- L4/ordinary-selmer-divisibility. -/
theorem ordinary_selmer_divisibility : True := by sorry

/-- L4/cm-exclusion-and-the-separate-treatment. -/
theorem cm_case_excluded : True := by sorry

example : True := by sorry -- unit test: only one divisibility is claimed; a statement
                           -- of equality is not what the source proves

end TauCeti.Kato
