/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GeneralAlgebraicKTheory--K.6.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-GeneralAlgebraicKTheory--K.6: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

Two naming decisions are fixed here.

* `IsFlasqueRing`, never `IsFlasque`. Both pinned trees already use `IsFlasque`
  for the SHEAF-theoretic predicate, which is a different notion. Karoubi's
  flasque rings of K.6 have nothing to do with it, and a formalisation that
  reused the name would produce statements that read as true and mean something
  else.
* `negativeK n R` for Bass's groups, with `n : ℕ` counting downwards, so that
  `negativeK 1` is what the literature writes as `K₋₁`. The nonconnective
  spectrum's homotopy is a separate name, `bassSpectrum`, and the agreement of
  the two is a theorem (`bassSpectrum_pi_neg`), not a definition.

Everything this layer needs from homotopy theory is a `variable`: neither pinned
library has spectra, homotopy colimits or connective covers. So is the K-theory
functor itself in positive degrees, which GeneralAlgebraicKTheory K.3 owns, and
so is the first K-group, which is absent from both trees and which
K2SymbolsBrauer T.6 is asked for.
-/
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Ring.Hom.Defs
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Limits.Filtered
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.LinearAlgebra.TensorProduct.Defs
import Mathlib.RingTheory.Morita.Basic
import Mathlib.RingTheory.Morita.Matrix

noncomputable section

namespace TauCeti.NonconnectiveK

/-! ## K.6 -/

variable (R S : Type*) [Ring R] [Ring S]

/-- K.6/flasque-rings-and-the-swindle. Karoubi's notion: an `R`-bimodule `M`,
finitely generated projective on the right, with a bimodule isomorphism
`R ⊕ M ≅ M`. NOT `Mathlib`'s `IsFlasque`, which is about sheaves. -/
structure IsFlasqueRing where
  dummy : Unit

/-- The Eilenberg swindle: for every finitely generated projective `P` the
isomorphism `P ⊕ (P ⊗[R] M) ≅ P ⊗[R] M` kills the class of `P`. -/
theorem IsFlasqueRing.K0_eq_zero (h : IsFlasqueRing R) : True := by sorry

/-- A flasque ring whose bimodule is `R` itself as a right module. -/
structure IsInfiniteSumRing extends IsFlasqueRing R where
  dummy' : Unit

theorem IsInfiniteSumRing.isFlasque (h : IsInfiniteSumRing R) : IsFlasqueRing R := by sorry

/-- The cone ring: the row-and-column finite infinite matrices over `R`. -/
def coneRing : Type _ := by sorry

theorem coneRing_isInfiniteSumRing : True := by sorry

/-- Recorded so that the collision cannot be made by accident: the predicate of
this file is about bimodules, the pinned one about sheaves, and neither implies
the other. -/
theorem IsFlasqueRing.not_sheaf_flasque : True := by sorry

/-! ### Contracted functors -/

variable (F : Type → Type)

/-- K.6/contracted-functors. `LF R` is the cokernel of
`F R[t] ⊕ F R[t⁻¹] → F R[t,t⁻¹]`. -/
def contraction : Type → Type := by sorry

/-- The four-term sequence `0 → F R → F R[t] ⊕ F R[t⁻¹] → F R[t,t⁻¹] → LF R → 0`
is exact for every `R`. -/
def IsAcyclic : Prop := by sorry

/-- Acyclic, together with a splitting of the surjection onto `LF` that is
natural IN THE VARIABLE as well as in the ring. Naturality in the ring alone is
not enough for the iteration, and a formalisation must carry both. -/
structure IsContracted where
  acyclic : IsAcyclic F
  splitting : Unit

theorem IsContracted.sum : True := by sorry

theorem IsContracted.of_retract : True := by sorry

/-- The iterates `N L F` and `L² F`. -/
def contractionIterate (n : ℕ) : Type → Type := by sorry

/-! ### The negative groups -/

/-- K.6/negative-k-groups. `negativeK n R` is `K₋ₙ R`, defined by iterated
contraction starting from `K₀`. -/
def negativeK (n : ℕ) : Type := by sorry

instance (n : ℕ) : AddCommGroup (negativeK R n) := by sorry

theorem negativeK_functor (n : ℕ) (f : R →+* S) : True := by sorry

/-- The first negative group IS the contraction of `K₀`. -/
theorem negativeK_one_eq_contraction : True := by sorry

/-- The four-term decomposition
`K₀ R[t,t⁻¹] ≅ K₀ R ⊕ K₋₁ R ⊕ NK₀ R ⊕ NK₀ R`. Dropping the two `NK₀` summands is
only legitimate when `R` is regular noetherian. -/
theorem K0_laurent_decomposition : True := by sorry

theorem negativeK_flasque (h : IsFlasqueRing R) (n : ℕ) : True := by sorry

theorem negativeK_prod (n : ℕ) : True := by sorry

/-! ### The Fundamental Theorem -/

/-- K.6/fundamental-theorem-with-nil-terms. The splitting is multiplication by
the class of `t` in `K₁ (ℤ[t,t⁻¹])`; a different splitting changes the
identification of the boundary. -/
theorem fundamental_theorem (n : ℤ) : True := by sorry

/-- `Nilₙ R ≅ NK_{n+1} R`. -/
theorem nil_eq_NK (n : ℕ) : True := by sorry

/-- The scheme form is `SchemeKTheoryOperations:S.5`'s, not this roadmap's. -/
theorem fundamental_theorem_scheme : True := by sorry

/-! ### The axioms -/

/-- K.6/axioms-for-negative-k-theory. A theory of negative K-theory for possibly
NON-UNITAL rings: the second axiom is stated for ideals and is weakened if the
rings are required to be unital. -/
structure NegativeKTheory where
  groups : ℕ → Type → Type
  boundary : Unit
  k0 : Unit
  exact_ideal : Unit
  flasque : Unit
  matrix : Unit

/-- Bass's groups satisfy all four, which is what makes the axioms non-vacuous. -/
def bassTheory : NegativeKTheory := by sorry

/-! ### Mayer–Vietoris and the spectrum -/

/-- K.6/mayer-vietoris-for-negative-k. The sequence does not terminate; that is
what distinguishes the negative groups from the connective theory. -/
theorem mayer_vietoris_negative : True := by sorry

/-- Spectra are a `variable`: neither pinned library has them. -/
variable (Spectrum : Type) (KTheorySpectrum : ∀ (R : Type*) [Ring R], Spectrum)

/-- The data the K-theory construction consumes: a category with cofibrations AND
weak equivalences. Declared here because K.6's spectrum needs it and K.7's
comparison node is about which parts of it may be forgotten. -/
structure WaldhausenData where
  zero : Unit
  cofibrations : Unit
  weakEquivalences : Unit
  pushouts : Unit
  gluing : Unit

/-- K.6/nonconnective-spectrum. `LE R` is the homotopy cofiber of the map from
the homotopy pushout of `E R[t]` and `E R[t⁻¹]` over `E R` into `E R[t,t⁻¹]`;
the desuspension is its loop space. -/
def deloop : Spectrum → Spectrum := by sorry

theorem deloop_cofibration : True := by sorry

/-- `K R → Ω L K R` is the `(-1)`-connective cover. -/
theorem deloop_connective_cover : True := by sorry

/-- The homotopy colimit of the iterated desuspensions. -/
def bassSpectrum : Spectrum := by sorry

theorem bassSpectrum_pi_nonneg (n : ℕ) : True := by sorry

theorem bassSpectrum_pi_neg (n : ℕ) : True := by sorry

theorem bassSpectrum_natural : True := by sorry

/-- Independence of the model: two naturally equivalent models of connective
K-theory give equivalent nonconnective spectra. This is what the stage text's
"independence of enlargement" asks for. -/
theorem bassSpectrum_independent : True := by sorry

/-! ### The second route: Frobenius pairs and the flasque envelope -/

/-- K.6/frobenius-pairs. An exact category with enough projectives and injectives
which COINCIDE; its stable category is triangulated. Absent from both pinned
trees. -/
structure FrobeniusCategory (C : Type*) [Category C] where
  dummy : Unit

def FrobeniusCategory.stable {C : Type*} [Category C] (h : FrobeniusCategory C) : Type _ := by sorry

/-- A fully faithful inclusion of small Frobenius categories preserving
projective-injectives. -/
structure FrobeniusPair where
  dummy : Unit

/-- The Verdier quotient of the two stable categories. -/
def FrobeniusPair.derived (A : FrobeniusPair) : Type _ := by sorry

/-- The standing example: bounded complexes over an exact category with
DEGREEWISE SPLIT conflations, and the homotopy-acyclic ones. -/
def FrobeniusPair.ofExact : FrobeniusPair := by sorry

theorem FrobeniusPair.derived_ofExact : True := by sorry

/-- K.6/frobenius-pairs-flasque-envelope-and-suspension. Objects are sequences of
inflations; `hom` is `lim_i colim_j`. -/
def countableEnvelope : Type _ := by sorry

/-- The swindle in functorial form: `T ⊕ id ≅ T`. This is Karoubi's flasqueness,
not the sheaf predicate. -/
theorem countableEnvelope_isFlasque : True := by sorry

def FrobeniusPair.enlarge (A : FrobeniusPair) : FrobeniusPair := by sorry

/-- The enlarged derived category has countable coproducts and is c-compactly
generated by the original, so the idempotent completion of the original is its
c-compact part. -/
theorem FrobeniusPair.enlarge_generates : True := by sorry

/-- The suspension: the enlargement, together with the objects killed in the
quotient. -/
def FrobeniusPair.suspension (A : FrobeniusPair) : FrobeniusPair := by sorry

theorem FrobeniusPair.derived_suspension : True := by sorry

/-! ### The axiomatic set-up -/

/-- K.6/schlichting-set-up. `IK₀ T = K₀` of the idempotent completion. -/
def IK0 : Type _ := by sorry

/-- Exact: the composite is zero, the first is fully faithful, and `B/A → C` is
COFINAL — not required to be an equivalence. -/
structure IsExactSequenceOfTriangulated where
  dummy : Unit

/-- Models with `F` (flasque) and `S` (suspension), and the three conditions. -/
structure NegativeKSetup where
  F : Unit
  S : Unit
  preserves_exact : Unit
  IK0_flasque_eq_zero : Unit
  seq_exact : Unit

/-- `IK₋ₙ M = IK₀ (Sⁿ M)`. -/
def negativeIK (n : ℕ) : Type _ := by sorry

theorem negativeIK_frobenius : True := by sorry

/-- For an idempotent complete exact category this is the usual `K₀`. -/
theorem IK0_eq_K0_of_idempotentComplete : True := by sorry

/-! ### Localisation, additivity and the IK-spectrum -/

/-- K.6/schlichting-set-up-and-negative-localization: the long exact sequence in
degrees `i ≤ 0`. -/
theorem negativeIK_localization : True := by sorry

/-- A cofinal derived functor — in particular an equivalence — gives isomorphisms
in all non-positive degrees. -/
theorem negativeIK_of_cofinal : True := by sorry

/-- `IK₋₁ M = 0` iff every relevant Verdier quotient of idempotent completions is
idempotent complete. -/
theorem negativeIK_one_eq_zero_iff : True := by sorry

/-- K.6/additivity-and-colimits-for-negative-K. -/
theorem negativeIK_additivity : True := by sorry

theorem negativeIK_filteredColimit : True := by sorry

/-- K.6/nonconnective-spectrum-and-derived-invariance. The Waldhausen structure:
cofibrations are the inflations, weak equivalences the maps inverted in the
derived category. -/
def FrobeniusPair.waldhausen (A : FrobeniusPair) : WaldhausenData := by sorry

def FrobeniusPair.KSpace (A : FrobeniusPair) : Type _ := by sorry

/-- The K-theory space of an enlargement is contractible, FUNCTORIALLY; that is
what the flasqueness lemma buys. -/
theorem FrobeniusPair.KSpace_enlarge_contractible : True := by sorry

def IKSpectrum (A : FrobeniusPair) : Spectrum := by sorry

theorem IKSpectrum_omega : True := by sorry

/-- Quillen's groups above zero, `K₀` of the idempotent completion in degree
zero, the negative groups below. -/
theorem IKSpectrum_pi : True := by sorry

/-- Localisation in EVERY degree, at the spectrum level. -/
theorem IKSpectrum_localization : True := by sorry

/-! ### Agreement and vanishing -/

/-- K.6/agreement-and-vanishing-of-negative-K. The two routes of this layer land
in the same groups, and in Bass's, Karoubi's, Pedersen–Weibel's and Thomason's. -/
theorem IK_eq_bass : True := by sorry

theorem IK_eq_thomason : True := by sorry

/-- `IK₋₁ E` is the monoid of idempotents of `D(E)` modulo the split ones. -/
theorem IK_neg_one_presentation : True := by sorry

theorem IK_neg_one_abelian_eq_zero : True := by sorry

theorem IK_neg_noetherian_abelian_eq_zero : True := by sorry

/-- Bass's vanishing theorem, DEDUCED: for a regular ring the projectives sit
inside the finitely generated modules as a derived equivalence, and that category
is abelian. -/
theorem IK_neg_regular_eq_zero : True := by sorry

/-- Stated by the source as a CONJECTURE, and recorded here as one. -/
theorem IK_neg_abelian_eq_zero_conjecture : True := by sorry

/-! ### Vanishing, and the inference that is not available -/

/-- K.6/vanishing-for-regular-noetherian-rings. -/
theorem negativeK_eq_zero_of_regular (n : ℕ) : True := by sorry

/-- The NON-EXAMPLE. The connective model has zero homotopy in negative degrees
for EVERY ring; that absence is a property of the model and proves nothing about
a singular ring. A proof of vanishing must come from `negativeK` or from
`bassSpectrum`. -/
theorem not_vanishing_from_connective : True := by sorry

/-! ## K.7 -/

/-- K.7/morita-invariance. The pinned `IsMoritaEquivalent` and
`IsMoritaEquivalent.matrix` are the hypothesis; the K-theoretic consequence is
what is missing. -/
def KTheory.moritaEquiv (h : IsMoritaEquivalent R S) (n : ℤ) : True := by sorry

theorem KTheory.moritaEquiv_matrix (n : ℕ) : True := by sorry

theorem KTheory.moritaEquiv_negative : True := by sorry

theorem KTheory.moritaEquiv_mul : True := by sorry

/-- The Structure Theorem: the equivalence is tensoring against a finitely
generated projective generator whose endomorphism ring is the other ring. -/
theorem moritaStructure : True := by sorry

/-- Morita equivalent rings need not be isomorphic, so the invariance is not
vacuous. -/
theorem morita_not_iso : True := by sorry

/-! ### Derived invariance -/

/-- K.7/derived-morita-and-enhancements. The hypothesis is an equivalence of
ENHANCEMENTS — a quasi-equivalence of dg-categories, an equivalence of stable
∞-categories, or, in Schlichting's form, a map of Frobenius pairs inducing an
equivalence of derived categories (`FrobeniusPair.derived_equiv_KSpace` below).
The data K-theory consumes is `WaldhausenData`, declared in the K.6 section: a
category with cofibrations AND weak equivalences. -/
theorem FrobeniusPair.derived_equiv_KSpace : True := by sorry

theorem KTheory.of_exact_equivalence : True := by sorry

/-- The NON-EXAMPLE the stage text names. A bare triangulated equivalence of
homotopy categories does not induce an isomorphism on the higher K-groups: the
homotopy category forgets the weak equivalences, and mapping cones there are not
functorial. -/
theorem not_invariant_under_triangulated_equivalence : True := by sorry

/-- What DOES survive in degree zero, and is pinned:
`TauCeti.ExactK0.mapEquiv`. -/
theorem K0_invariant_under_equivalence : True := by sorry

/-! ### Colimits and products -/

/-- K.7/invariance-under-filtered-colimits-and-products. -/
theorem KTheory.of_filtered_colimit (n : ℤ) : True := by sorry

theorem KTheory.of_prod (n : ℤ) : True := by sorry

/-- Claimed for FINITE products only. -/
theorem KTheory.not_of_infinite_prod : True := by sorry

/-! ### Products -/

/-- K.7/products-from-biexact-functors. A functor exact in each variable
separately induces a pairing. -/
def KTheory.biexactPairing : True := by sorry

def KTheory.externalProduct : True := by sorry

variable (A : Type*) [CommRing A]

def KTheory.mul : True := by sorry

/-- The coherence is DATA, transported from the tensor product's own coherence
isomorphisms; a formalisation that asserts these has not built the product. -/
theorem KTheory.mul_assoc : True := by sorry

theorem KTheory.mul_one : True := by sorry

theorem KTheory.mul_comm_graded : True := by sorry

/-- K.7/graded-commutativity: `x * y = (-1)^(p*q) * (y * x)`. -/
theorem KTheory.graded_comm (p q : ℕ) : True := by sorry

/-- In degree one this is the anticommutativity of the symbol. The first K-group
is absent from both pinned trees; `K2SymbolsBrauer:T.6` is asked for it. -/
theorem symbol_anticomm : True := by sorry

/-- The link back to K.6: multiplication by the class of `t` in `K₁ (ℤ[t,t⁻¹])`
is the splitting of the Fundamental Theorem. -/
theorem mul_t_eq_splitting : True := by sorry

/-! ### Compatibilities and the two unit tests -/

/-- K.7/compatibility-with-relative-groups-and-transfers. Three separate
assertions, none of which follows from bilinearity. -/
theorem KTheory.mul_relative : True := by sorry

theorem KTheory.boundary_mul : True := by sorry

theorem KTheory.transfer_mul : True := by sorry

/-- K.7/unit-multiplication-and-K0-tensor-comparison, first test. The pinned
`TauCeti.SplitK0.of_mul_of` is exactly this for the split model; a comparison of
the split model with the exact-category model is still needed. -/
theorem K0_mul_eq_tensor : True := by sorry

/-- Second test: multiplication by the class of a unit is an automorphism, with
inverse multiplication by the inverse unit. -/
theorem mul_unit_bijective (u : Aˣ) : True := by sorry

end TauCeti.NonconnectiveK
