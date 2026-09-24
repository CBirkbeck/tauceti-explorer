/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EllipticKTheory.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-EllipticKTheory: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Not compiled.

Naming decisions fixed here.

* `EllipticScheme` is an `AlgebraicGeometry.Scheme`. At the pins NO elliptic
  curve is one: the projective model in both libraries is a quotient of a point
  set. Everything in this file that takes a scheme argument is therefore new.
* `curveSK1`, never `SK1`. The curve invariant is `ker (K₁ X → F(X)ˣ)`; the
  stable-matrix `SK₁` of an affine ring is a different group with the same name,
  and `curveSK1_ne_stableSK1` records that.
* The tame symbol is `K2SymbolsBrauer`'s, in ITS order and sign convention. A
  certificate written in another convention is not a certificate.
* `integralPart` (full base) and `integralPartS` (S-integral) are different
  subspaces and get different names.

K-groups of schemes, the coniveau tower and Adams operations are `variable`s:
none exists at the pins, and each is owned by `GeneralAlgebraicKTheory`,
`MotivicEtaleKTheory` or `SchemeKTheoryOperations`.
-/
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.RingTheory.PicardGroup

noncomputable section

namespace TauCeti.EllipticK

open AlgebraicGeometry

variable {F : Type*} [Field F]

/-! ## E.1 — the scheme -/

/-- E.1/the-elliptic-curve-as-a-scheme. `Proj` of the graded quotient by the
homogeneous Weierstrass equation. NOTHING like this exists at the pins. -/
def EllipticScheme (W : WeierstrassCurve F) : Scheme := by sorry

def EllipticScheme.zeroSection (W : WeierstrassCurve F) : True := by sorry

theorem EllipticScheme.charts_cover : True := by sorry

theorem EllipticScheme.affine_chart_eq : True := by sorry

/-- E.1/geometric-properties-of-the-curve. -/
theorem EllipticScheme.isSmooth : True := by sorry
theorem EllipticScheme.isProper : True := by sorry
theorem EllipticScheme.geometricallyConnected : True := by sorry
theorem EllipticScheme.isRegular : True := by sorry

/-- Regular does NOT imply smooth; E.6's arithmetic models are regular and not
smooth. -/
theorem regular_not_smooth : True := by sorry

/-- E.1/the-function-field-of-the-curve: the scheme's function field is the
fraction field of the affine Weierstrass ring. Both sides are pinned; the
comparison is not. -/
theorem EllipticScheme.functionField_eq : True := by sorry

/-- E.1/isogenies-as-scheme-morphisms. Tau Ceti's function-field isogeny theory
is complete; the scheme side is not. -/
def isogenyToMorphism : True := by sorry

theorem isogenyToMorphism_degree : True := by sorry
theorem isogenyToMorphism_separable : True := by sorry
theorem isogenyToMorphism_divisor_pullback : True := by sorry

/-- The ZERO morphism induces no embedding of function fields and is handled
separately. -/
theorem zeroMorphism_not_in_correspondence : True := by sorry

/-! ## E.2 — K₀ -/

/-- K-theory of schemes is a parameter: it does not exist at the pins. -/
variable (K : ℕ → Scheme → Type)

/-- E.2/K0-of-a-curve, imported from `KTheoryLowDegrees:Z.5`. -/
theorem K0_curve_rank_det : True := by sorry

@[simp] theorem K0_class_structureSheaf : True := by sorry
@[simp] theorem K0_class_skyscraper : True := by sorry

/-- E.2/degree-euler-characteristic-and-pushforward. Tau Ceti has the additive
Euler characteristic; making it a map out of `K₀` is what is new. -/
def degree : True := by sorry
def eulerChar : True := by sorry
theorem eulerChar_additive : True := by sorry
theorem eulerChar_factors_through_K0 : True := by sorry
def pushforwardToBase : True := by sorry
theorem riemannRoch : True := by sorry

/-- E.2/picard-decomposition-and-the-point-group. BOTH halves are pinned in Tau
Ceti (`pointEquivDegreeZeroDivisorClass`, `OrderSystem.degreeSplitForward`) and
the roadmap does not record it. -/
theorem picard_degree_split : True := by sorry
theorem pic_zero_eq_points : True := by sorry

/-- E.2/K0-of-an-elliptic-curve: `ℤ ⊕ ℤ ⊕ E(F)`, as a GROUP, with the chosen
origin. -/
theorem K0_elliptic : True := by sorry

/-- The right-hand side is NOT a product ring; the multiplication is transported
from the tensor product. -/
theorem K0_elliptic_mul_not_product_ring : True := by sorry

/-- A Galois-invariant geometric line-bundle class need not descend. -/
theorem descent_obstruction : True := by sorry

/-! ## E.3 — localisation -/

/-- E.3/localisation-sequence-for-a-curve, over ALL closed points. -/
theorem localisation_sequence_curve : True := by sorry

/-- The degree-two boundary is `K2SymbolsBrauer`'s tame symbol, in ITS
convention. -/
theorem boundary_eq_tameSymbol : True := by sorry

theorem localisation_natural_open : True := by sorry
theorem localisation_natural_finite : True := by sorry

/-- E.3/what-the-sequence-does-not-identify. The kernel is the IMAGE. -/
theorem ker_tameSymbol_eq_image : True := by sorry

/-- Over a number field: injective rationally (residue `K₂`s are torsion). -/
theorem K2_injective_rat_numberField : True := by sorry

/-- Over a finite field: injective integrally (residue `K₂`s vanish). -/
theorem K2_injective_finiteField : True := by sorry

/-! ## E.4 — K₁, SK₁, K₃ -/

theorem K1_image_eq_constants : True := by sorry

/-- E.4/K1-and-SK1-of-a-curve. NOT the stable-matrix `SK₁`. -/
def curveSK1 : True := by sorry

theorem curveSK1_eq_coker : True := by sorry
theorem curveSK1_split : True := by sorry
theorem curveSK1_ne_stableSK1 : True := by sorry

/-- E.4/the-coniveau-spectral-sequence-of-a-curve: TWO columns. -/
def coniveauPage : True := by sorry
def coniveauFiltration : True := by sorry
theorem coniveau_eq_localisation : True := by sorry

/-- The LEFT filtration term is not zero and may not be dropped. -/
theorem coniveauFiltration_left_ne_zero : True := by sorry

/-- E.4/the-third-K-group-of-a-curve: an EXTENSION, not a kernel. -/
theorem K3_curve_sequence : True := by sorry
theorem K3_kernel_is_subquotient_only : True := by sorry

/-- E.4/adams-operations-and-the-weight-decomposition: rational only. -/
theorem adams_eigenspaces_rat : True := by sorry
theorem no_integral_eigenspace_decomposition : True := by sorry

/-! ## E.5 — functoriality and examples -/

def KPullback : True := by sorry
def KPushforward : True := by sorry
theorem KPushforward_eq_transfer : True := by sorry

/-- E.5/projection-formula-and-isogenies. `f_*f^*(a) = [f_*O_X]·a`. -/
theorem projection_formula : True := by sorry
theorem pull_push_eq_class_of_pushforward : True := by sorry
theorem rank_class_eq_degree : True := by sorry

/-- NOT `deg(f)·a` in integral K-theory. -/
theorem pull_push_ne_degree_smul : True := by sorry

/-- E.5/the-projective-line: two copies, basis `O` and `O(-1)`. -/
theorem K_projectiveLine : True := by sorry

/-- E.5/an-elliptic-curve-over-a-finite-field. Harder + geometric computation +
Frobenius; NOT the finite-field calculation alone. -/
theorem harder_finiteness : True := by sorry
theorem K_curve_finiteField : True := by sorry
theorem K1_elliptic_finiteField : True := by sorry
theorem not_from_finite_field_alone : True := by sorry

/-! ## E.6 — arithmetic models -/

/-- E.6/the-regular-proper-model. -/
structure EllipticModel where
  proper : Unit
  flat : Unit
  regular : Unit
  genericFibre : Unit

/-- A Néron model is smooth but NOT proper. -/
theorem neron_not_proper : True := by sorry

/-- A Weierstrass model is proper but NOT regular at bad primes. -/
theorem weierstrassModel_not_regular : True := by sorry

/-- E.6/the-integral-part. A SUBSPACE of the rationalised group. -/
def integralPart : True := by sorry
def integralPartS : True := by sorry
theorem integralPart_le_integralPartS : True := by sorry

/-- An unramified symbol need not be integral. -/
theorem unramified_not_integral : True := by sorry

/-- The definition asserts NO lattice property. -/
theorem integralPart_not_lattice : True := by sorry

theorem integralPart_model_independent : True := by sorry

/-- E.6/vertical-residues, with hypotheses; the converse is conditional. -/
def verticalResidue : True := by sorry
theorem integral_iff_vertical_residues_vanish : True := by sorry

/-! ## E.7 — certified symbols -/

structure SymbolCandidate where
  terms : Unit

/-- E.7/symbol-certificates: four fields, all finite data. -/
structure SymbolCertificate where
  divisors : Unit
  leadingUnits : Unit
  symbolsTrivial : Unit
  supportExhaustive : Unit

/-- Soundness gives a class in the IMAGE; identifying it with a class on the
curve is E.3's theorem. -/
theorem SymbolCertificate.sound : True := by sorry

structure IntegralCertificate extends SymbolCertificate where
  verticalConditions : Unit

theorem IntegralCertificate.sound : True := by sorry

/-- E.7/weil-reciprocity: the consistency condition, WITH the residue-field
norms. -/
theorem weil_reciprocity : True := by sorry
theorem reciprocity_fails_without_norms : True := by sorry

/-- E.7/classes-from-torsion-divisors. The function comes from Riemann–Roch, not
from an assumed existence. The source proving the correction was not obtained. -/
theorem function_of_torsion_divisor : True := by sorry
theorem corrected_symbol_residues_vanish : True := by sorry
theorem classes_independent_mod_torsion : True := by sorry

/-- E.7/non-rational-torsion-and-descent. -/
theorem transfer_of_certified_class : True := by sorry
theorem galois_invariant_not_restriction : True := by sorry

/-! ## E.8 — completion -/

theorem completion_criterion : True := by sorry

/-- No finite generation and no explicit classification is claimed anywhere. -/
theorem no_classification_claimed : True := by sorry

theorem worked_example_certificate : True := by sorry
theorem worked_example_nonrational_residue : True := by sorry
theorem worked_example_bad_fibre : True := by sorry

end TauCeti.EllipticK
