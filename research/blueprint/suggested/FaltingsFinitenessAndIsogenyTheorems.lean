/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/FaltingsFinitenessAndIsogenyTheorems.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can converge
on names and signatures. They claim no implementation.

BP-FaltingsFinitenessAndIsogenyTheorems: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established.

The reviewed library audit records all six layers of this roadmap as not built: the
pinned libraries have abelian varieties over a field with their homomorphism and
endomorphism groups, products and base change, and finite locally free commutative
group schemes with Cartier duality, but no polarisation, no moduli space, no Neron
model, no p-divisible group, no Tate module of an abelian variety, no arithmetic
degree and no height of an abelian variety. Almost everything below is therefore an
opaque signature; what is imported appears as a `variable` or as a field of a
structure, never as an invented definition:

* semistable reduction and the monodromy criterion are NeronModelsAndSemistableAbelianVarieties R11.3;
* the Tate module of a Weil restriction is AbelianSchemesAndArithmeticModuli A6;
* the Weil bound for abelian varieties is WeightsInEtaleCohomology R34.2;
* the Tate module with its Frobenius polynomial and l-independence is ArithmeticGaloisRepresentations R01.6;
* Chebotarev is the pinned Tau Ceti development and is imported below.
-/
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.NumberTheory.Height.Projectivization
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.Order.Northcott
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
import Mathlib.RingTheory.SimpleModule.Basic

noncomputable section

namespace TauCeti.Faltings

open AlgebraicGeometry

universe u

/-! ## R28.1 Height finiteness on arithmetic moduli -/

/-- R28.1/semiabelian-scheme-and-its-hodge-line-bundle: a smooth group scheme with
connected fibres of dimension `g`, each an extension of an abelian variety by a torus.
Tau Ceti has the fibrewise object over a field and nothing relative. -/
structure SemiabelianScheme (S : Scheme) (g : ℕ) where
  total : Scheme
  proj : total ⟶ S
  smooth : True
  fibres_semiabelian : True
  zeroSection : S ⟶ total

/-- The Hodge line bundle `omega = s^*(Omega^g)`. -/
def SemiabelianScheme.hodgeBundle {S : Scheme} {g : ℕ} (_A : SemiabelianScheme S g) :
    True := by sorry

theorem SemiabelianScheme.hodgeBundle_baseChange {S : Scheme} {g : ℕ}
    (A : SemiabelianScheme S g) : True := by sorry

/-- Part (a): for a proper family, `omega` is the pushforward of the top differentials. -/
theorem SemiabelianScheme.hodgeBundle_of_proper {S : Scheme} {g : ℕ}
    (A : SemiabelianScheme S g) (h : True) : True := by sorry

/-- Part (c): for `Pic^tau` of a stable curve, `omega` is the top exterior power of the
pushforward of the relative dualising module. -/
theorem SemiabelianScheme.hodgeBundle_of_stableCurve : True := by sorry

/-- Part (d): over `C`, the canonical hermitian product `(i/2)^g ∫ alpha ∧ conj beta`. -/
def SemiabelianScheme.hodgeInner : True := by sorry

example : True := by sorry -- unit test: for multiplicative reduction the family is
                           -- semiabelian and not proper, so (a) does not apply

example : True := by sorry -- unit test: the hermitian product of a nonzero form with
                           -- itself is positive; without (i/2)^g it can be negative for odd g

example : True := by sorry -- unit test: omega commutes with base change

/-- R28.1/extension-of-homomorphisms-of-semiabelian-schemes-over-a-normal-base
(Lemma 1): over a normal base a homomorphism defined on a dense open extends uniquely,
and the extension is again a homomorphism of groups. -/
theorem extend_hom_of_dense_open : True := by sorry

example : True := by sorry -- unit test: normality of the base is needed

example : True := by sorry -- unit test: the extension is a group homomorphism, not
                           -- merely a morphism of schemes

/-- R28.1/stable-curve-correspondence-stack-over-Z (Lemma 2): the proper stack `J` over
`Spec Z` with a stable curve, a line subbundle `L`, and the two homomorphisms whose
composite is multiplication by a nonzero `d`. -/
structure CorrespondenceStack (g : ℕ) where
  J : True
  U : True
  psi : True
  curve : True
  subbundle : True
  alpha_beta : True
  modular_iso : True

example : True := by sorry -- unit test: for g = 1, d may be taken to be 1

example : True := by sorry -- unit test: J is proper over Spec Z, the moduli stack is not

/-- R28.1/commensurability-of-the-modular-and-hodge-line-bundles (Korollar to Lemma 2):
`e . rho^*(M) ⊆ omega^{⊗ r} ⊆ e^{-1} . rho^*(M)` with `e` depending only on `g`. -/
theorem modular_hodge_commensurable (g : ℕ) : True := by sorry

/-- R28.1/faltings-modular-height-of-a-semiabelian-model: metrized line bundles on
`Spec O_K`, the arithmetic degree, and `h(A) = deg(omega) / [K : Q]`. -/
structure MetrizedLineBundle (K : Type u) [Field K] where
  module : True
  norms : True

def MetrizedLineBundle.degree {K : Type u} [Field K] (_P : MetrizedLineBundle K) :
    ℝ := by sorry

theorem MetrizedLineBundle.degree_well_defined {K : Type u} [Field K]
    (P : MetrizedLineBundle K) : True := by sorry

def modularHeight : True := by sorry

theorem modularHeight_baseChange : True := by sorry

example : True := by sorry -- unit test: h is invariant under a finite extension

example : True := by sorry -- unit test: the weight at a complex place is 2; with 1 the
                           -- height is not invariant

example : True := by sorry -- unit test: the degree does not depend on the chosen element

/-- R28.1/hodge-metric-has-logarithmic-singularities-along-the-boundary: the canonical
metric has logarithmic singularities along the degeneration locus. -/
theorem hodge_metric_log_singularities : True := by sorry

/-- R28.1/northcott-property-for-heights-from-log-singular-metrics: finitely many points
of bounded height for such a metric. -/
theorem northcott_of_log_singular : True := by sorry

/-- R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S (imported):
finitely many extensions of bounded degree unramified outside `S`. Mathlib has Hermite's
theorem with a discriminant bound; the version with ramification restricted to `S` is a
gap of this packet. -/
theorem hermite_minkowski_outside_S : True := by sorry

/-- R28.1/finiteness-of-principally-polarized-semiabelian-models-of-bounded-height
(Satz 1). -/
theorem satz_1_finiteness_of_bounded_height : True := by sorry

/-! ## R28.2 Isogeny-height estimates and boundedness -/

/-- R28.2/height-change-under-an-isogeny-of-semiabelian-models (Lemma 5). -/
theorem isogeny_height_formula : True := by sorry

/-- R28.2/bounded-denominators-of-height-differences-under-isogeny (the Bemerkung):
`exp(2[K:Q](h(A₂) - h(A₁)))` is rational with prime divisors dividing the degree. -/
theorem isogeny_height_denominators : True := by sorry

/-- R28.2/inertia-triviality-on-the-quotient-by-the-l-divisible-group-of-the-formal-completion
(Lemma 6). The orthogonality it uses is SGA 7 I, Exposé IX 7.4.3. -/
theorem lemma_6_inertia_trivial : True := by sorry

/-- R28.2/local-differential-computation-for-the-l-divisible-tower (imported from Tate). -/
theorem tate_local_differentials : True := by sorry

/-- R28.2/global-determinant-identity-forcing-sum-m-i-d-i-equals-mh-over-two. -/
theorem global_determinant_identity : True := by sorry

/-! ## R28.3 Finiteness within an isogeny class -/

/-- R28.3/closure-tower-becomes-l-divisible-only-after-a-shift (erratum (a)). -/
theorem erratum_a_shift : True := by sorry

/-- R28.3/intersection-with-the-toric-l-divisible-group-after-a-shift (erratum (b)). -/
theorem erratum_b_shift : True := by sorry

/-- R28.3/corrected-satz-2-stationarity-of-heights-along-an-l-divisible-tower. Only the
corrected form is stated: the sequence `h(A_n)` becomes stationary after replacing `A`
by `A_m` for large `m`. -/
theorem satz_2_corrected_stationarity : True := by sorry

/-- R28.3/infinitely-many-isomorphic-quotients-along-a-maximal-isotropic-tower. -/
theorem infinitely_many_isomorphic_quotients : True := by sorry

/-- R28.3/reduction-to-a-principally-polarized-semiabelian-model: the isogeny produced
has degree the *square root* of the polarization degree. -/
def polarizationReduction : True := by sorry

theorem polarizationReduction_degree : True := by sorry

example : True := by sorry -- unit test: the degree is sqrt d, not d

example : True := by sorry -- unit test: a maximal isotropic quotient suffices; the
                           -- fourfold-product trick is not needed here

example : True := by sorry -- unit test: the field extension is finite, so finiteness
                           -- transports back

/-! ## R28.4 Semisimplicity and the Tate isogeny theorem -/

/-- R28.4/quaternion-construction-of-an-invariant-maximal-isotropic-subspace. The
coefficients are `Q_l`, not `Z_l`. -/
def quaternionInvariantSubspace : True := by sorry

theorem quaternionInvariantSubspace_isotropic : True := by sorry

theorem quaternionInvariantSubspace_galois_invariant : True := by sorry

example : True := by sorry -- unit test: coefficients are l-adic rational; the integral
                           -- statement has no idempotent

example : True := by sorry -- unit test: the subspace is maximal isotropic

example : True := by sorry -- unit test: Galois invariance is what defines the quotient
                           -- over the ground field

/-- R28.4/semisimplicity-and-the-tate-homomorphism-comparison (Satz 3 and Satz 4). -/
theorem satz_3_semisimplicity : True := by sorry

theorem satz_4_tate_comparison : True := by sorry

/-- R28.4/hom-comparison-for-pairs-and-the-isogeny-criterion. -/
theorem isogeny_criterion : True := by sorry

/-- R28.4/finiteness-of-polarized-varieties-with-all-tate-modules-isomorphic. -/
theorem finiteness_with_fixed_tate_modules : True := by sorry

/-! ## R28.5 Shafarevich finiteness -/

/-- R28.5/finiteness-of-isogeny-classes-with-good-reduction-outside-S (Satz 5).
The Chebotarev input is the pinned Tau Ceti development. -/
theorem satz_5_finiteness_of_isogeny_classes : True := by sorry

/-- R28.5/weil-bounds-on-exterior-powers-and-the-choice-of-N. -/
theorem weil_bounds_choice_of_N : True := by sorry

/-- R28.5/determinant-character-of-the-kernel-computed-by-raynaud: Raynaud's
Théorème 4.1.1, the one imported result whose original was re-fetched and re-hashed
for this packet. -/
theorem raynaud_determinant_character : True := by sorry

/-- R28.5/finiteness-of-pi-invariant-lattices-from-semisimplicity. -/
theorem finiteness_of_invariant_lattices : True := by sorry

/-- R28.5/shafarevich-finiteness (Satz 6). -/
theorem satz_6_shafarevich : True := by sorry

/-- R28.5/finiteness-of-curves-of-genus-at-least-two-with-good-reduction-outside-S.
Torelli is an unread import, recorded as a gap. -/
theorem finiteness_of_curves : True := by sorry

/-- R28.5/mordell-conjecture-by-the-parshin-construction (Satz 7). -/
theorem mordell_conjecture : True := by sorry

/-! ## R28.6 Interfaces for elliptic curves and automorphic cohomology -/

/-- R28.6/commutant-statement-for-almost-all-primes. -/
theorem commutant_at_almost_all_primes : True := by sorry

/-- R28.6/siegel-theorem-without-diophantine-approximation. -/
theorem siegel_without_approximation : True := by sorry

example : True := by sorry -- unit test: specialise the isogeny criterion to a
                           -- Weierstrass curve over a number field

end TauCeti.Faltings
