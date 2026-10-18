/-
# FunctionFieldArithmeticPartII — finite native root stacks (RS.1)

This file is not the roadmap and is not exhaustive. The companion README is the
full specification of the targets, hypotheses, API, checks and worked examples.
The declarations here suggest forms over carriers that exist at the atlas pins:
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

The native geometric root/quotient/coarse carriers are README targets. The two
abbreviations below merely name an actual polynomial and an actual localization
of its quotient. They do not construct a geometric stack or replace one by fields
of predicates. Proof admissions are planning signatures, not implementations.
-/
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.Data.ZMod.Basic

namespace TauCeti.FiniteRoot.RS1Suggested

universe u

/-- The equation of the smooth frame presentation, with z = X 0 and q = X 1. -/
noncomputable abbrev presentationRelation (A : Type u) [CommRing A] (f : A) (n : ℕ) :
    MvPolynomial (Fin 2) A :=
  MvPolynomial.X 0 ^ n - MvPolynomial.X 1 * MvPolynomial.C f

/-- A[z,q,q⁻¹]/(zⁿ-qf), as the actual localization of a polynomial quotient. -/
abbrev smoothPresentationRing (A : Type u) [CommRing A] (f : A) (n : ℕ) :=
  Localization.Away
    (Ideal.Quotient.mk (Ideal.span ({presentationRelation A f n} : Set (MvPolynomial (Fin 2) A)))
      (MvPolynomial.X 1))

/-- Native-regularity: the ring of the actual smooth G_m frame atlas is regular.
The hypotheses mean that f cuts out a regular effective Cartier divisor. -/
theorem smoothPresentationRing_regular (A : Type u) [CommRing A] [IsRegularRing A]
    (f : A) (hf : f ∈ nonZeroDivisors A)
    [IsRegularRing (A ⧸ Ideal.span ({f} : Set A))] (n : ℕ) (hn : 0 < n) :
    IsRegularRing (smoothPresentationRing A f n) := by
  sorry

/-- Native-geometric-fibres: the ramified chart retains a nonzero nilpotent.
The full stack fibre is obtained by a torsor quotient, not by deleting this element. -/
theorem zeroFibre_nonreduced (K : Type u) [Field K] (n : ℕ) (hn : 1 < n) :
    (AdjoinRoot.root (Polynomial.X ^ n : Polynomial K)) ^ n = 0 ∧
      AdjoinRoot.root (Polynomial.X ^ n : Polynomial K) ≠ 0 := by
  sorry

/-- Native-dm-locus: the tangent μ_p point is invisible on geometric field points.
Its actual carrier is the native dual-number polynomial quotient. -/
theorem wildInertia_tangent (K : Type u) [Field K] (p : ℕ) (hp : p.Prime) [CharP K p] :
    (1 + AdjoinRoot.root (Polynomial.X ^ 2 : Polynomial K)) ^ p = 1 ∧
      (1 + AdjoinRoot.root (Polynomial.X ^ 2 : Polynomial K)) ≠ 1 := by
  sorry

/-- The n=1 presentation eliminates z by z=qf, rather than requiring f to be a unit. -/
example {A : Type u} [CommRing A] (f q : A) :
    MvPolynomial.eval ![q * f, q] (presentationRelation A f 1) = 0 := by
  sorry

/-- Unit sections have no relative automorphisms; no invertibility of n is needed. -/
example {A : Type u} [CommRing A] (w : Aˣ) (y : A)
    (hy : IsUnit y) (h : (w : A) * y = y) : w = 1 := by
  sorry

/-- A zero square-root section over a nonreduced ring need not itself be zero. -/
example : (3 : ZMod 9) ^ 2 = 0 ∧ (3 : ZMod 9) ≠ 0 := by
  decide

/-- A native power-identification coefficient need not have a global normalizing root. -/
example : ¬ ∃ r : ZMod 4, r ^ 2 = 3 := by
  decide

/-- The base Z example has exponent 3 invertible on its branch divisor V(2). -/
example : IsUnit (3 : ZMod 2) := by
  simpa only [show (3 : ZMod 2) = 1 from by decide] using
    (isUnit_one : IsUnit (1 : ZMod 2))

/-
README-only signature ledger, exhaustive for this packet:
* native-effective-descent: descentEquiv, descentEquiv_section,
  descentEquiv_powerIso, descentEquiv_hom, descentEquiv_refine,
  descentEquiv_baseChange and all four descent_* tests need actual native root
  and QCoh descent categories plus the coherent monoidal pullback interfaces.
* native-upstream-equivalence: nativeEquiv, nativeEquiv_obj, nativeEquiv_hom,
  nativeEquiv_pullback, nativeEquiv_targetIso, nativeEquiv_overStack and all four
  nativeEquiv_* tests need actual root stacks and line-section 2-pullbacks.
* native-universal-root-comparison and native-basechange-square need the actual
  universal triple, strong transformations and 2-pullback comparisons.
* native-quotient-comparison needs torsors, their associated native line, and the
  actual quotient stack. The ZMod 4 example records its global-frame obstruction.
* native-smooth-presentation: smoothPresentation, smoothPresentation_action,
  smoothPresentation_torsor, smoothPresentation_quotient,
  smoothPresentation_finiteChart, smoothPresentation_baseChange and all four
  smoothPresentation_* tests need the actual torsor/quotient geometry. The two
  light abbreviations name its ring only, not its atlas map or quotient theorem.
* native-algebraicity needs actual algebraic stacks and relative morphism
  properties. No field named algebraic or flat substitutes for these predicates.
* native-coarse-space needs the actual coarse universal property and the
  finite-diagonalizable supplier contract RS1-DIAGONALIZABLE-COARSE.
* native-geometric-fibres needs actual 2-fibres, closed substacks and gerbes;
  zeroFibre_nonreduced records its coordinate end condition over the native ring.
* native-regularity needs smooth-local regularity on actual algebraic stacks;
  smoothPresentationRing_regular is its ring milestone, not the stack theorem.
* native-dm-locus needs the actual DM morphism and inertia loci;
  wildInertia_tangent and the unit/branch examples record its coordinate tests.

All omitted targets, API items and tests are specified in the README. The
accepted parent's root carrier, Hopf coaction and invariant algebra are reused
there; this file does not develop competing versions of them.
-/

end TauCeti.FiniteRoot.RS1Suggested
