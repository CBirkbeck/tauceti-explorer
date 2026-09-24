/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PerfectoidSpaces--P0.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-PerfectoidSpaces--P0: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established.

This roadmap has NO reviewed library audit, so the boundary with the pinned
libraries was drawn by reading the declaration index directly for this packet. What
is already there is imported below and never redefined:

* Mathlib `PreTilt` -- the inverse limit along Frobenius of the quotient by p --
  together with `PreTilt.untilt`, `WittVector.fontaineTheta` as a ring
  homomorphism, `surjective_fontaineTheta` and `BDeRhamPlus`. The theta node
  therefore prototypes only the KERNEL half of its statement.
* Tau Ceti `TauCeti.Huber.Pair`, `TauCeti.ValuationSpectrum.spa` and
  `TauCeti.ValuationSpectrum.rationalSubset` with their basis, covering and
  refinement theory. The localization and homeomorphism nodes build on those.

Almost mathematics is in neither library; every notion of P0 is new, and the
ordinary notion each is modelled on is imported so that the comparison can be
stated.

P4 and P6 are in the scope of the job and have no decomposed source; nothing is
prototyped for them.
-/
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.FieldTheory.Perfect
import Mathlib.Order.Filter.Defs
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Extension.Cotangent.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Perfectoid.Untilt
import Mathlib.RingTheory.Perfection
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.WittVector.Defs
import Mathlib.Topology.Sheaves.Presheaf

noncomputable section

namespace TauCeti.Perfectoid

universe u

/-! ## P0 Almost mathematics with a reusable base ideal -/

/-- P0/almost-modules-over-perfectoid-base: modules killed by the base ideal are
declared zero. The base ideal is idempotent and flat; that hypothesis is what makes
the quotient a tensor category. -/
structure AlmostSetup (R : Type u) [CommRing R] where
  ideal : Ideal R
  idempotent : True
  flat : True

def AlmostModule {R : Type u} [CommRing R] (_S : AlmostSetup R) : Type u := by sorry

def AlmostModule.almostZero {R : Type u} [CommRing R] (S : AlmostSetup R) : True := by sorry

theorem AlmostModule.almostZero_iff {R : Type u} [CommRing R] (S : AlmostSetup R) :
    True := by sorry

example : True := by sorry -- unit test: a module killed by the ideal is almost zero
                           -- and need not be zero

example : True := by sorry -- unit test: the idempotence hypothesis is not decorative

example : True := by sorry -- unit test: the maximal ideal of a perfectoid field's
                           -- ring of integers satisfies the hypothesis

/-- P0/almost-finite-projective-and-finite-etale-algebras. Almost projectivity is an
APPROXIMATE lifting property: the lift exists after multiplying by an arbitrary
element of the ideal. -/
def AlmostFlat : True := by sorry
def AlmostProjective : True := by sorry
def AlmostFinitelyPresented : True := by sorry
def AlmostFiniteEtale : True := by sorry

theorem AlmostFiniteEtale.baseChange : True := by sorry

example : True := by sorry -- unit test: approximate, not exact, lifting

example : True := by sorry -- unit test: finite etale implies almost finite etale and
                           -- not conversely

/-- P0/finite-etale-lifting-along-complete-flat-almost-algebras. -/
theorem finiteEtale_lift_mod_varpi : True := by sorry

/-! ## P1 Perfectoid Tate rings, tilts and marked untilts -/

/-- P1/perfectoid-field-definition. In characteristic p this must reduce to perfect
and complete. -/
def IsPerfectoidField (K : Type u) [Field K] : Prop := by sorry

theorem IsPerfectoidField.frobenius_surjective {K : Type u} [Field K]
    (h : IsPerfectoidField K) : True := by sorry

example : True := by sorry -- unit test: Q_p is NOT perfectoid: discrete value group

example : True := by sorry -- unit test: the completed cyclotomic tower is

example : True := by sorry -- unit test: in characteristic p, perfect and complete

/-- P1/tilt-of-perfectoid-field. Built on Mathlib's `PreTilt`, not redefined. -/
def tiltField (K : Type u) [Field K] : Type u := by sorry

def tiltField.sharp {K : Type u} [Field K] : True := by sorry

theorem tiltField.valueGroup {K : Type u} [Field K] : True := by sorry

example : True := by sorry -- unit test: the value groups agree

example : True := by sorry -- unit test: the tilt has characteristic p

example : True := by sorry -- unit test: in characteristic p the tilt is the field

/-- P1/continuous-valuations-under-tilting. -/
theorem valuations_correspond_under_tilting : True := by sorry

/-- P1/perfectoid-tate-rings-and-algebras. Uniformity is part of the definition and
is not implied by surjectivity of Frobenius mod p. -/
def IsPerfectoidTateRing : True := by sorry

example : True := by sorry -- unit test: uniformity is needed

example : True := by sorry -- unit test: a perfectoid field is one

example : True := by sorry -- unit test: the completed perfection of a Tate algebra is one

/-- P1/almost-integral-dictionary. -/
theorem perfectoid_almost_dictionary : True := by sorry

/-- P1/cotangent-complex-vanishing-mod-varpi. The ALMOST cotangent complex; Mathlib's
`Algebra.Extension.H1Cotangent` is the nearest pinned notion and the comparison is
part of what this node states. -/
theorem almost_cotangent_vanishes : True := by sorry

/-- P1/deformation-lifting-of-perfectoid-mod-varpi-algebras. -/
theorem perfectoid_deformation_lift : True := by sorry

/-- P1/tilting-equivalence-and-explicit-tilt. -/
theorem tilting_equivalence : True := by sorry

/-- P1/tilt-of-perfectoid-tate-ring. The sharp map is multiplicative, NOT additive. -/
def tiltRing : True := by sorry

theorem tiltRing.sharp_multiplicative : True := by sorry

example : True := by sorry -- unit test: agrees with the tilt of a field

example : True := by sorry -- unit test: sharp is multiplicative and not a ring map

example : True := by sorry -- unit test: the integral elements are the limit along
                           -- Frobenius of the integral elements mod p

/-- P1/fontaine-theta-and-primitive-kernel. Mathlib already has the map
(`WittVector.fontaineTheta`) and its surjectivity (`surjective_fontaineTheta`); what
is planned here is that the kernel is generated by a primitive element of degree one. -/
theorem fontaineTheta_ker_primitive : True := by sorry

/-- P1/untilts-classified-by-primitive-ideals. -/
theorem untilts_classified : True := by sorry

/-! ## P2 Rational localization, sheafiness, and perfectoid spaces -/

/-- P2/rational-localization-of-perfectoid-affinoids. Built on Tau Ceti's rational
subsets and localization. -/
def rationalLocalization : True := by sorry

theorem rationalLocalization.isPerfectoid : True := by sorry

theorem rationalLocalization.tilt : True := by sorry

example : True := by sorry -- unit test: perfectoid is preserved

example : True := by sorry -- unit test: localizing and tilting commute

example : True := by sorry -- unit test: the topology and the integral elements come along

/-- P2/approximation-lemma. -/
theorem approximation_lemma : True := by sorry

/-- P2/tilting-homeomorphism-and-rational-subsets: the homeomorphism IDENTIFIES
rational subsets, which is what makes the comparison local. -/
theorem tilting_homeomorphism : True := by sorry

/-- P2/p-finite-acyclicity-from-tate. -/
theorem p_finite_acyclicity : True := by sorry

/-- P2/completed-direct-limits-of-p-finite-affinoids. -/
theorem completed_direct_limit : True := by sorry

/-- P2/sheaf-theorem-and-almost-acyclicity. -/
theorem sheaf_theorem : True := by sorry

/-- P2/perfectoid-spaces-and-glued-tilting. -/
structure PerfectoidSpace where
  space : True
  affinoidCover : True

def PerfectoidSpace.tilt (_X : PerfectoidSpace) : PerfectoidSpace := by sorry

theorem PerfectoidSpace.tilt_homeomorphism : True := by sorry

example : True := by sorry -- unit test: the glued tilt is independent of the cover

example : True := by sorry -- unit test: same underlying space

example : True := by sorry -- unit test: on an affinoid it is the tilt of the algebra

/-- P2/fibre-products-of-perfectoid-spaces. -/
def PerfectoidSpace.fibreProduct : True := by sorry

example : True := by sorry -- unit test: exists and is perfectoid, unlike the general
                           -- adic case

example : True := by sorry -- unit test: tilting commutes with fibre products

example : True := by sorry -- unit test: affinoid case is the completed tensor product

/-! ## P3 Almost purity and étale tilting -/

/-- P3/finite-etale-covers-in-characteristic-p. -/
theorem almost_purity_charP : True := by sorry

/-- P3/tilting-finite-etale-algebras-fully-faithful. -/
theorem tilting_finiteEtale_fullyFaithful : True := by sorry

/-- P3/finite-extensions-of-perfectoid-fields. -/
theorem finite_extension_perfectoid : True := by sorry

/-- P3/strongly-etale-morphisms-and-base-change. Three genuinely different classes. -/
def IsFiniteEtaleMor : True := by sorry
def IsEtaleMor : True := by sorry
def IsStronglyEtaleMor : True := by sorry

theorem IsStronglyEtaleMor.baseChange : True := by sorry

example : True := by sorry -- unit test: strongly finite etale is strictly stronger

example : True := by sorry -- unit test: stable under base change

example : True := by sorry -- unit test: an open immersion is etale, not finite etale

/-- P3/strongly-finite-etale-maps-are-affinoid-over-affinoids. -/
theorem stronglyFiniteEtale_affinoid : True := by sorry

/-- P3/almost-purity-theorem. -/
theorem almost_purity : True := by sorry

/-- P3/etale-site-tilting-and-etale-almost-acyclicity. -/
theorem etale_site_tilting : True := by sorry

/-- P3/henselian-finite-etale-approximation. Placed here, not in P5: P3 needs it, and
the independent review of the decomposition made exactly this correction. -/
theorem henselian_finiteEtale_approximation : True := by sorry

/-! ## P5 Limits and étale finite-stage descent -/

/-- P5/cofiltered-limits-of-affinoid-perfectoid-spaces. -/
def cofilteredLimit : True := by sorry

example : True := by sorry -- unit test: the limit of affinoid perfectoids is one

example : True := by sorry -- unit test: the cardinal bound is needed

example : True := by sorry -- unit test: the countable case is the completed colimit

/-- P5/finite-stage-descent-of-qcqs-etale-objects. -/
theorem finite_stage_descent : True := by sorry

/-! ## P7 Tilde-limits and Frobenius-controlled towers -/

/-- P7/tilde-limits-and-etale-topos-comparison. -/
theorem tilde_limit_etale_topos : True := by sorry

/-! ## P4 and P6

Not prototyped: the integrated decomposition has no node for either layer, and no
source for them was read for this packet. -/

end TauCeti.Perfectoid
