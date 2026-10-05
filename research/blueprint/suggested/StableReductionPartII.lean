import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.Pasting
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.Iso
import Mathlib.AlgebraicGeometry.Morphisms.FormallyUnramified
import Mathlib.AlgebraicGeometry.ZariskisMainTheorem
import Mathlib.RingTheory.Finiteness.Projective
import Mathlib.Algebra.Category.ModuleCat.Limits
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.CategoryTheory.Abelian.Ext
import Mathlib.CategoryTheory.Abelian.Projective.Ext
import Mathlib.Algebra.Category.ModuleCat.Ext.HasExt
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.CategoryTheory.Abelian.Projective.Resolution
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.LinearAlgebra.LeftExact
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.Algebra.Ring.Hom.Defs
import Mathlib.Algebra.Group.Units.Defs
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Flat.Equalizer
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Module.FinitePresentation
import Mathlib.LinearAlgebra.TensorProduct.Quotient
import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.AlgebraTower
import Mathlib.Algebra.Polynomial.Basis
import Mathlib.Tactic.Ring
import Mathlib.RingTheory.Polynomial.Ideal
import Mathlib.Algebra.Polynomial.Bivariate
import Mathlib.LinearAlgebra.Projection
import Mathlib.LinearAlgebra.Pi
import Mathlib.LinearAlgebra.TensorProduct.Pi

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
StableReductionPartII.md is definitive. These suggested Lean forms help
contributors and reviewers converge on names and signatures.

CHECKPOINT: the polynomial node ring, its actual ideal and dual, the two
cokernel maps, arbitrary coefficient tensor comparisons, flat ambient ideal/Hom/quotient
transport and actual noetherian module completion now have canonical
packet entries and prototype ledgers. The complete file is checked using an
existing pinned Mathlib build. The fifteen elementary proof bodies and nine
proved examples belong to the historical revision cef4c2085eddbf723e9050f7d4924924d593a0e3.
Current suggested bodies are admitted sketches under PROTOCOL section 13.
The canonical ε:J→ₗ[R]R and K:R→ₗ[A]R are named on the inherited carriers.
Their actual native proofs and 16 examples survive in immutable 5e2a9a938035;
this complete sketch is checked separately and does not certify geometry.
The current exact-file receipt and separate canonical splitting proof archive are distinguished
in the handoff; their elaboration
does not certify those proofs or provide geometric supplier types.
See handoff/DESIGN-StableReductionPartII.md for hashes and precise boundaries.

The algebraic-stack, pointed-family, invertible-sheaf and relative-Picard
interfaces must come from the suppliers before those signatures can be written.
No arbitrary Prop field or axiom is used to impersonate any missing object.
-/

/- Built inputs for MC.0/MC.1. These checks confirm the native interfaces,
not stable-curve moduli or their missing geometric signatures. The square-zero
lifting criterion quantifies over every displayed affine lifting square.
Proper plus locally quasi-finite is a scheme criterion, not stack properness. -/
#check @AlgebraicGeometry.Scheme
#check @CategoryTheory.Pseudofunctor.IsStack
#check @CategoryTheory.Limits.pullbackLeftPullbackSndIso
#check @CategoryTheory.Limits.pullbackLeftPullbackSndIso_hom_fst
#check @CategoryTheory.Limits.pullbackLeftPullbackSndIso_hom_snd
#check @CategoryTheory.Limits.pullback.hom_ext
#check @CategoryTheory.Limits.pullback_fst_iso_of_right_iso
#check @AlgebraicGeometry.Scheme.fppfTopology
#check @AlgebraicGeometry.FormallyUnramified.of_hom_ext
#check @AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite

set_option synthInstance.maxHeartbeats 100000
namespace TauCeti.ModuliCurves

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The explicit binary quadratic form; nondegeneracy is a separate unit condition. -/
def NodeForm (γ δ x y : R) : R := x ^ 2 + γ * x * y + δ * y ^ 2

namespace NodeForm

def discriminant (γ δ : R) : R := γ ^ 2 - 4 * δ

def Nondegenerate (γ δ : R) : Prop := IsUnit (discriminant γ δ)

-- NodeForm.eval
theorem eval (γ δ x y : R) :
    NodeForm γ δ x y = x ^ 2 + γ * x * y + δ * y ^ 2 := sorry
-- NodeForm.map
theorem map (φ : R →+* S) (γ δ x y : R) :
    φ (NodeForm γ δ x y) = NodeForm (φ γ) (φ δ) (φ x) (φ y) := sorry
/-- The polynomial correction identity; power-series ideal membership is a supplier input. -/
-- NodeForm.linearCorrection
theorem linearCorrection (γ δ x y ε u v : R) (hε : ε ^ 2 = 0) :
    NodeForm γ δ (x + ε * (-2 * δ * u + γ * v))
      (y + ε * (γ * u - 2 * v)) =
      NodeForm γ δ x y + ε * discriminant γ δ * (x * u + y * v) := by
  sorry

-- NodeForm.split
example (x y : R) : NodeForm (0 : R) (-1) x y = x ^ 2 - y ^ 2 := sorry
example (h2 : IsUnit (2 : R)) : Nondegenerate (0 : R) (-1) := sorry
-- NodeForm.characteristicTwo
example (h2 : (2 : R) = 0) (x y : R) :
    Nondegenerate (1 : R) 0 ∧ NodeForm (1 : R) 0 x y = x ^ 2 + x * y := sorry
-- NodeForm.doubleLineExcluded
example : ¬ Nondegenerate (0 : ℤ) 0 := sorry
end NodeForm

namespace NodeSectionFactorization

def left (γ δ x y s t : R) : Matrix (Fin 2) (Fin 2) R :=
  Matrix.of fun i j =>
    if i = 0 then
      if j = 0 then δ * y + δ * t + γ * x else x + s + γ * t
    else
      if j = 0 then -(x - s) else y - t

def right (γ δ x y s t : R) : Matrix (Fin 2) (Fin 2) R :=
  Matrix.of fun i j =>
    if i = 0 then
      if j = 0 then y - t else -(x + s + γ * t)
    else
      if j = 0 then x - s else δ * y + δ * t + γ * x

-- NodeSectionFactorization.products
theorem products (γ δ x y s t : R) :
    left γ δ x y s t * right γ δ x y s t =
      Matrix.scalar (Fin 2) (NodeForm γ δ x y - NodeForm γ δ s t) ∧
    right γ δ x y s t * left γ δ x y s t =
      Matrix.scalar (Fin 2) (NodeForm γ δ x y - NodeForm γ δ s t) := sorry
-- NodeSectionFactorization.atOrigin
example (γ δ x y : R) :
    left γ δ x y 0 0 = Matrix.of (fun i j =>
      if i = 0 then
        if j = 0 then δ * y + γ * x else x
      else
        if j = 0 then -x else y) := sorry
-- NodeSectionFactorization.characteristicTwo
example (h2 : (2 : R) = 0) (x y s t : R) :
    left 1 0 x y s t * right 1 0 x y s t =
      Matrix.scalar (Fin 2) (x ^ 2 + x * y - (s ^ 2 + s * t)) := sorry
-- NodeSectionFactorization.repeatedRootExcluded
example : ¬ NodeForm.Nondegenerate (0 : ℤ) 0 := sorry
/-
Canonical signatures for the local polynomial-model proof in MC.2.
The polynomial and its quotient are native Mathlib objects, not opaque carriers.
These signatures are counted in the packet's polynomial-model prototype ledger.
-/
namespace PolynomialModel

noncomputable section

open Polynomial

variable (A : Type*) [CommRing A] (γ δ s t : A)

-- The inner variable is Y and the outer variable is X.
def polynomial : Polynomial (Polynomial A) :=
  Polynomial.X ^ 2 +
    Polynomial.C (Polynomial.C γ * Polynomial.X) * Polynomial.X +
    Polynomial.C (Polynomial.C δ * Polynomial.X ^ 2 -
      Polynomial.C (NodeForm γ δ s t))

abbrev Ring := AdjoinRoot (polynomial A γ δ s t)

def coefficientHom : A →+* Ring A γ δ s t :=
  RingHom.comp (AdjoinRoot.of (polynomial A γ δ s t)) Polynomial.C

local notation "w₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root w₀
local notation "v₀" => AdjoinRoot.of w₀ (Polynomial.X : Polynomial A)
local notation "α₀" => left (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "β₀" => right (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "J₀" => (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀)

def sectionEval : R₀ →+* A := sorry
def sectionIdeal : Ideal R₀ :=
  Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t}

abbrev sectionDual := sectionIdeal A γ δ s t →ₗ[R₀] R₀

def coefficientMap {A' : Type*} [CommRing A'] (f : A →+* A') :
    R₀ →+* Ring A' (f γ) (f δ) (f s) (f t) := sorry
/-- Monic division gives a unique pair of coefficient polynomials over any base ring. -/
theorem polynomialMonic : (w₀).Monic := sorry
theorem polynomialNatDegree [Nontrivial A] : (w₀).natDegree = 2 := sorry
theorem normalForm (r : R₀) :
    ∃! p : Polynomial A × Polynomial A,
      r = AdjoinRoot.of w₀ p.1 + u₀ * AdjoinRoot.of w₀ p.2 := sorry
/-- The normal-form monomials give freeness over both coefficient rings. -/
theorem normalFormFree : Module.Free (Polynomial A) R₀ ∧ Module.Free A R₀ := sorry
/-- The section's Y-coordinate difference is regular; the base need not be a domain. -/
theorem sectionCoordinateRegular :
    Function.Injective (fun r : R₀ => (v₀ - ι₀ t) * r) := sorry
/-- Candidate for the exactness part of
`StableReductionPartII:MC.2/node-factorization-exact`.

The four equalities explicitly include the dual complex. Monic lift-and-cancel
proves these particular equalities over every commutative base ring; this is
a documented strengthening of the published source range. -/
theorem quotientExact :
    LinearMap.ker (Matrix.mulVecLin α₀) = LinearMap.range (Matrix.mulVecLin β₀) ∧
    LinearMap.ker (Matrix.mulVecLin β₀) = LinearMap.range (Matrix.mulVecLin α₀) ∧
    LinearMap.ker (Matrix.mulVecLin (Matrix.transpose α₀)) = LinearMap.range (Matrix.mulVecLin (Matrix.transpose β₀)) ∧
    LinearMap.ker (Matrix.mulVecLin (Matrix.transpose β₀)) = LinearMap.range (Matrix.mulVecLin (Matrix.transpose α₀)) := by
  sorry

/-- Candidate for `NodeSectionFactorization.cokernels`.

The cokernel of the RIGHT matrix is the section ideal. The cokernel of the
LEFT matrix is its actual R-linear dual. The displayed formulas fix the maps,
not merely the abstract isomorphism classes. Multiplication by `v₀ - ι₀ t`
avoids division in the statement of the dual map; `sectionCoordinateRegular`
makes that characterization unambiguous. -/
theorem cokernels :
    ∃ (eJ : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin β₀)) ≃ₗ[R₀] J₀)
      (eD : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin α₀)) ≃ₗ[R₀]
        (J₀ →ₗ[R₀] R₀)),
      (∀ z : Fin 2 → R₀,
        (eJ (Submodule.Quotient.mk z) : R₀) =
          (u₀ - ι₀ s) * z 0 - (v₀ - ι₀ t) * z 1) ∧
      (∀ (z : Fin 2 → R₀) (j : J₀),
        (v₀ - ι₀ t) * (eD (Submodule.Quotient.mk z) j) =
          ((v₀ - ι₀ t) * z 0 - (u₀ + ι₀ s + ι₀ γ * ι₀ t) * z 1) *
            (j : R₀)) := by
  sorry

/-!
Local dual-quotient continuation for MC.2/dual-section-ideal. The polynomial
model remains the actual AdjoinRoot above. These canonical local forms
are recorded in the packet; they do not give the global sheaf theorem. No Noetherian or discriminant hypothesis is needed for
these algebraic statements; the handoff gives the monic-polynomial proof.
No completed-local or arbitrary-family descent is inferred from them.
-/

open scoped TensorProduct

local notation "c₀" => u₀ - ι₀ s
local notation "d₀" => v₀ - ι₀ t
local notation "b₀" => u₀ + ι₀ s + ι₀ γ * ι₀ t
local notation "a₀" => ι₀ δ * v₀ + ι₀ δ * ι₀ t + ι₀ γ * u₀
local notation "D₀" => (J₀ →ₗ[R₀] R₀)

/-- A denominator-free characterization of the actual R-linear dual generator. -/
theorem dualGenerator_existsUnique :
    ∃! ε : D₀, ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀) := by
  sorry

/-- Normal form in the actual dual, with coefficients in R and in A respectively. -/
theorem dualNormalForm (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (h : D₀) :
    ∃! p : R₀ × A, ∀ j : J₀,
      h j = p.1 * (j : R₀) + ι₀ p.2 * ε j := by
  sorry

/-- This is A-linear, not R-linear for the componentwise scalar action. -/
theorem dualNormalEquiv (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    ∃ e : D₀ ≃ₗ[A] (R₀ × A), ∀ (p : R₀ × A) (j : J₀),
      e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j := by
  sorry

/-- The residue presents D/R as A, where R acts on A by the actual section
R→A. The kernel is the image of multiplication, not an unidentified submodule. -/
theorem dualResidue (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    let ev : R₀ →+* A :=
      sectionEval A γ δ s t
    ∃ ρ : D₀ →ₗ[A] A,
      Function.Surjective ρ ∧ ρ ε = 1 ∧
      (∀ (r : R₀) (h : D₀), ρ (r • h) = ev r * ρ h) ∧
      (∀ h : D₀, ρ h = 0 ↔ ∃ r : R₀, ∀ j : J₀, h j = r * (j : R₀)) := by
  sorry

/-- The correction term determines the non-diagonal R-action on R⊕A.
Its twisted product law is forced by regularity of d; no localization type
or chosen inverse of d is needed in the statement. -/
theorem dualScalarCorrection :
    let ev : R₀ →+* A :=
      sectionEval A γ δ s t
    ∃ K : R₀ →ₗ[A] R₀,
      (∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (ev r))) ∧
      (∀ r z : R₀, K (r * z) = r * K z + ι₀ (ev z) * K r) ∧
      K c₀ = -a₀ ∧ K d₀ = b₀ := by
  sorry

/-- Flatness is over the coefficient ring A, not a claim that J is R-flat. -/
theorem sectionIdeal_flat : Module.Flat A J₀ := by
  sorry

theorem sectionDual_flat : Module.Flat A D₀ := by
  sorry

/-- The natural coefficient-base-change comparison in the polynomial model.
The displayed formula fixes it on pure tensors and on the images of J,
whose two generators generate J' over R'. No flatness of f is assumed.
The native signature records an A'-linear equivalence; the formula identifies
it with the natural comparison, not an unrelated isomorphism of modules. -/
theorem sectionDual_baseChange {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    let w' := Polynomial.map (Polynomial.mapRingHom f) w₀
    let R' := AdjoinRoot w'
    let ι' : A' →+* R' :=
      (AdjoinRoot.of w').comp (Polynomial.C : A' →+* Polynomial A')
    let φ : R₀ →+* R' :=
      AdjoinRoot.map (Polynomial.mapRingHom f) w₀ w' (by sorry)
    let J' : Ideal R' := Ideal.span
      {AdjoinRoot.root w' - ι' (f s), AdjoinRoot.of w' Polynomial.X - ι' (f t)}
    ∃ e : (A' ⊗[A] D₀) ≃ₗ[A'] (J' →ₗ[R'] R'),
      ∀ (a' : A') (h : D₀) (j : J₀),
        e (a' ⊗ₜ[A] h) ⟨φ (j : R₀), by sorry⟩ = ι' a' * φ (h j) := by
  sorry


-- StableReductionPartII:MC.2/polynomial-relation-regular
theorem polynomialRelationRegular :
    Function.Injective (fun p : Polynomial (Polynomial A) => w₀ * p) := sorry
-- StableReductionPartII:MC.2/section-evaluation-kernel
theorem sectionEvaluationKernel (r : R₀) :
    (sectionEval A γ δ s t r = 0 ↔ r ∈ J₀) ∧
      (∀ z : A, sectionEval A γ δ s t (ι₀ z) = z) := by
  sorry

-- StableReductionPartII:MC.2/coefficient-inclusion-action
lemma coefficientHom_eq_algebraMap : ι₀ = algebraMap A R₀ := sorry

-- StableReductionPartII:MC.2/section-evaluation-scalars
lemma sectionEval_smul (a : A) (r : R₀) :
    sectionEval A γ δ s t (a • r) = a * sectionEval A γ δ s t r := sorry

-- StableReductionPartII:MC.2/section-evaluation-projection
noncomputable def sectionProjection : R₀ →ₗ[A] J₀ := sorry

lemma sectionProjection_coe (r : R₀) :
    (sectionProjection A γ δ s t r : R₀) = r - ι₀ (sectionEval A γ δ s t r) := sorry

lemma sectionProjection_ideal (j : J₀) : sectionProjection A γ δ s t (j : R₀) = j := sorry

lemma sectionProjection_coefficient (z : A) : sectionProjection A γ δ s t (ι₀ z) = 0 := sorry


-- StableReductionPartII:MC.2/section-evaluation-split
noncomputable def sectionSplit : R₀ ≃ₗ[A] J₀ × A := sorry
theorem sectionSplit_first (r : R₀) :
    ((sectionSplit A γ δ s t r).1 : R₀) = r - ι₀ (sectionEval A γ δ s t r) := sorry
theorem sectionSplit_second (r : R₀) :
    (sectionSplit A γ δ s t r).2 = sectionEval A γ δ s t r := sorry
theorem sectionSplit_inverse (j : J₀) (z : A) :
    (sectionSplit A γ δ s t).symm (j, z) = (j : R₀) + ι₀ z := sorry
theorem sectionSplit_section (z : A) :
    sectionSplit A γ δ s t (ι₀ z) = (0, z) := sorry
-- test: NodeSectionFactorization.PolynomialModel.sectionSplitNonreduced
example :
    let u := AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)
    let e := sectionSplit (ZMod 4) 0 0 1 0
    (e u).2 = 1 ∧ ((e u).1 : Ring (ZMod 4) 0 0 1 0) =
      u - coefficientHom (ZMod 4) 0 0 1 0 1 := sorry
-- test: NodeSectionFactorization.PolynomialModel.sectionSplitZeroBase
example (r : Ring (ZMod 1) 0 0 0 0) :
    sectionSplit (ZMod 1) 0 0 0 0 r = (0, 0) := sorry
-- test: NodeSectionFactorization.PolynomialModel.sectionSplitNotRingLinear
example :
    let Φ := fun r : Ring ℚ 1 0 0 0 =>
      ((sectionSplit ℚ 1 0 0 0 r).1 : Ring ℚ 1 0 0 0)
    ¬ ∀ r z : Ring ℚ 1 0 0 0, Φ (r * z) = r * Φ z := sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionProjectionIdeal
example (j : J₀) : sectionProjection A γ δ s t (j : R₀) = j := sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionProjectionZeroBase
example (r : Ring (ZMod 1) 0 0 0 0) : sectionProjection (ZMod 1) 0 0 0 0 r = 0 := sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionProjectionNonreduced
example :
    (sectionProjection (ZMod 4) 0 0 1 0
      (AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)) : Ring (ZMod 4) 0 0 1 0) =
        AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0) - coefficientHom (ZMod 4) 0 0 1 0 1 := sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionProjectionNotRingLinear
example :
    let Φ := fun r : Ring ℚ 1 0 0 0 => (sectionProjection ℚ 1 0 0 0 r : Ring ℚ 1 0 0 0)
    ¬ ∀ r z : Ring ℚ 1 0 0 0, Φ (r * z) = r * Φ z := sorry

-- StableReductionPartII:MC.2/section-ideal-cokernel
theorem cokernelIdeal :
    ∃ e : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin β₀)) ≃ₗ[R₀] J₀,
      ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀ * z 0 - d₀ * z 1 := by
  sorry

theorem cokernelIdealGenerators
    (e : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin β₀)) ≃ₗ[R₀] J₀)
    (he : ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀ * z 0 - d₀ * z 1) :
    (e (Submodule.Quotient.mk (fun i => if i = 0 then 1 else 0)) : R₀) = c₀ ∧
    (e (Submodule.Quotient.mk (fun i => if i = 0 then 0 else 1)) : R₀) = -d₀ := by
  sorry

theorem cokernelIdealUnique
    (e f : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin β₀)) ≃ₗ[R₀] J₀)
    (he : ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀ * z 0 - d₀ * z 1)
    (hf : ∀ z : Fin 2 → R₀, (f (Submodule.Quotient.mk z) : R₀) = c₀ * z 0 - d₀ * z 1) : e = f := by
  sorry


-- Native dual-generator and correction interfaces; admitted under PROTOCOL §13.
lemma sectionPolynomialFree : Module.Free (Polynomial A) R₀ := sorry

lemma sectionRelation : c₀ * b₀ + d₀ * a₀ = 0 := sorry

lemma dualGenerator_divisibility (j : J₀) : ∃ z : R₀, d₀ * z = b₀ * (j : R₀) := sorry

noncomputable def dualGenerator : D₀ := sorry

lemma dualGenerator_spec (j : J₀) :
    d₀ * dualGenerator A γ δ s t j = b₀ * (j : R₀) := sorry

lemma sectionFirst_mem : c₀ ∈ J₀ := sorry

lemma sectionSecond_mem : d₀ ∈ J₀ := sorry

noncomputable def dualCorrectionMap : R₀ →ₗ[A] R₀ := sorry

lemma dualCorrectionMap_apply (r : R₀) :
    dualCorrectionMap A γ δ s t r =
      dualGenerator A γ δ s t (sectionProjection A γ δ s t r) := sorry

lemma dualCorrectionMap_spec (r : R₀) :
    d₀ * dualCorrectionMap A γ δ s t r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)) := sorry

lemma dualCorrectionMap_product (r z : R₀) :
    dualCorrectionMap A γ δ s t (r*z) = r * dualCorrectionMap A γ δ s t z +
      ι₀ (sectionEval A γ δ s t z) * dualCorrectionMap A γ δ s t r := sorry

lemma dualCorrectionMap_values :
    dualCorrectionMap A γ δ s t c₀ = -a₀ ∧ dualCorrectionMap A γ δ s t d₀ = b₀ := sorry

lemma dualCorrectionMap_coefficient (z : A) : dualCorrectionMap A γ δ s t (ι₀ z) = 0 := sorry

theorem dualGeneratorValues (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    ε ⟨c₀, sectionFirst_mem A γ δ s t⟩ = -a₀ ∧ ε ⟨d₀, sectionSecond_mem A γ δ s t⟩ = b₀ := by
  sorry

theorem dualGeneratorUnique (ε η : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀))
    (hη : ∀ j : J₀, d₀ * η j = b₀ * (j : R₀)) : ε = η := by
  sorry

theorem dualNormalEquivInclusion (ε : D₀)
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    ∀ h : D₀, (∀ j : J₀, h j = (j : R₀)) → e h = (1, 0) := by
  sorry

theorem dualNormalEquivGenerator (ε : D₀)
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    e ε = (0, 1) := by
  sorry

-- StableReductionPartII:MC.2/section-dual-cokernel
theorem cokernelDual :
    ∃ e : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin α₀)) ≃ₗ[R₀] D₀,
      ∀ (z : Fin 2 → R₀) (j : J₀),
        d₀ * e (Submodule.Quotient.mk z) j = (d₀ * z 0 - b₀ * z 1) * (j : R₀) := by
  sorry

theorem cokernelDualGenerators (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀))
    (e : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin α₀)) ≃ₗ[R₀] D₀)
    (he : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀ * e (Submodule.Quotient.mk z) j = (d₀ * z 0 - b₀ * z 1) * (j : R₀)) :
    (∀ j : J₀, e (Submodule.Quotient.mk (fun i => if i = 0 then 1 else 0)) j = (j : R₀)) ∧
    e (Submodule.Quotient.mk (fun i => if i = 0 then 0 else 1)) = -ε := by
  sorry

theorem cokernelDualUnique
    (e f : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin α₀)) ≃ₗ[R₀] D₀)
    (he : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀ * e (Submodule.Quotient.mk z) j = (d₀ * z 0 - b₀ * z 1) * (j : R₀))
    (hf : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀ * f (Submodule.Quotient.mk z) j = (d₀ * z 0 - b₀ * z 1) * (j : R₀)) : e = f := by
  sorry

theorem dualResidueGenerator (ε : D₀) (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    (e ε).2 = 1 := by
  sorry

theorem dualResidueInclusion (ρ : D₀ →ₗ[A] A)
    (hker : ∀ h : D₀, ρ h = 0 ↔ ∃ r : R₀, ∀ j : J₀, h j = r * (j : R₀))
    (r : R₀) (h : D₀) (hh : ∀ j : J₀, h j = r * (j : R₀)) : ρ h = 0 := by
  sorry

theorem dualScalarCorrectionConstants (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (z : A) : K (ι₀ z) = 0 := by
  sorry

theorem dualScalarCorrectionUnique (K L : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (hL : ∀ r : R₀, d₀ * L r = b₀ * (r - ι₀ (sectionEval A γ δ s t r))) : K = L := by
  sorry

-- StableReductionPartII:MC.2/section-dual-scalar-action
theorem dualScalarAction (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j)
    (z : R₀) (h : D₀) :
    e (z • h) = (z * (e h).1 + ι₀ (e h).2 * K z, sectionEval A γ δ s t z * (e h).2) := by
  sorry

theorem coefficientMapValues {A' : Type*} [CommRing A'] (f : A →+* A') (z : A) :
    coefficientMap A γ δ s t f u₀ = AdjoinRoot.root (polynomial A' (f γ) (f δ) (f s) (f t)) ∧
    coefficientMap A γ δ s t f v₀ = AdjoinRoot.of (polynomial A' (f γ) (f δ) (f s) (f t)) Polynomial.X ∧
    coefficientMap A γ δ s t f (ι₀ z) = coefficientHom A' (f γ) (f δ) (f s) (f t) (f z) := sorry
-- StableReductionPartII:MC.2/section-evaluation-coefficient-naturality
theorem coefficientMapEvaluation {A' : Type*} [CommRing A'] (f : A →+* A') (r : R₀) :
    sectionEval A' (f γ) (f δ) (f s) (f t) (coefficientMap A γ δ s t f r) =
      f (sectionEval A γ δ s t r) := sorry
theorem coefficientMapIdentity : coefficientMap A γ δ s t (RingHom.id A) = RingHom.id R₀ := sorry
theorem coefficientMapComposition {A' A'' : Type*} [CommRing A'] [CommRing A'']
    (f : A →+* A') (g : A' →+* A'') :
    (coefficientMap A' (f γ) (f δ) (f s) (f t) g).comp (coefficientMap A γ δ s t f) =
      coefficientMap A γ δ s t (g.comp f) := sorry
-- StableReductionPartII:MC.2/section-ring-base-change
theorem sectionRing_baseChange {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    let B' := Ring A' (f γ) (f δ) (f s) (f t)
    ∃ e : (A' ⊗[A] R₀) ≃ₗ[A'] B', ∀ (a' : A') (r : R₀),
      e (a' ⊗ₜ[A] r) = coefficientHom A' (f γ) (f δ) (f s) (f t) a' *
        coefficientMap A γ δ s t f r := by
  sorry

-- StableReductionPartII:MC.2/section-ideal-base-change
theorem sectionIdeal_baseChange {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    let J' := sectionIdeal A' (f γ) (f δ) (f s) (f t)
    ∃ e : (A' ⊗[A] J₀) ≃ₗ[A'] J', ∀ (a' : A') (j : J₀),
      (e (a' ⊗ₜ[A] j) : Ring A' (f γ) (f δ) (f s) (f t)) =
        coefficientHom A' (f γ) (f δ) (f s) (f t) a' * coefficientMap A γ δ s t f (j : R₀) := by
  sorry


/- Native algebra, dual and quotient adapters for the explicit polynomial model.
No completed-local or geometric-family transport is asserted. -/

-- StableReductionPartII:MC.2/section-ring-tensor-equivalence
def ringTensorEquiv {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    (A' ⊗[A] R₀) ≃ₐ[A'] Ring A' (f γ) (f δ) (f s) (f t) := by
  sorry

theorem ringTensorEquivTmul {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ (a' : A') (r : R₀),
      ringTensorEquiv A γ δ s t f (a' ⊗ₜ[A] r) =
        coefficientHom A' (f γ) (f δ) (f s) (f t) a' *
          coefficientMap A γ δ s t f r := by
  sorry

theorem ringTensorEquivUnique {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ e : (A' ⊗[A] R₀) ≃ₐ[A'] Ring A' (f γ) (f δ) (f s) (f t),
      (∀ (a' : A') (r : R₀), e (a' ⊗ₜ[A] r) =
        coefficientHom A' (f γ) (f δ) (f s) (f t) a' *
          coefficientMap A γ δ s t f r) → e = ringTensorEquiv A γ δ s t f := by
  sorry

-- API of StableReductionPartII:MC.2/section-ring-tensor-equivalence
theorem ringTensorEquivIdentity (a : A) (r : R₀) :
    ringTensorEquiv A γ δ s t (RingHom.id A) (a ⊗ₜ[A] r) = ι₀ a * r := by
  sorry

theorem ringTensorEquivComposition {A' A'' : Type*} [CommRing A'] [CommRing A'']
    (f : A →+* A') (g : A' →+* A'') :
    letI : Algebra A A' := f.toAlgebra
    letI : Algebra A' A'' := g.toAlgebra
    letI : Algebra A A'' := (g.comp f).toAlgebra
    ∀ (a'' : A'') (a' : A') (r : R₀),
      ringTensorEquiv A' (f γ) (f δ) (f s) (f t) g
        (a'' ⊗ₜ[A'] ringTensorEquiv A γ δ s t f (a' ⊗ₜ[A] r)) =
      ringTensorEquiv A γ δ s t (g.comp f) ((a'' * g a') ⊗ₜ[A] r) := by
  sorry

-- StableReductionPartII:MC.2/section-dual-tensor-equivalence
def dualTensorEquiv {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    (A' ⊗[A] D₀) ≃ₗ[A'] sectionDual A' (f γ) (f δ) (f s) (f t) := by
  sorry

theorem dualTensorEquivEvaluation {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ (a' : A') (h : D₀) (j : J₀),
      dualTensorEquiv A γ δ s t f (a' ⊗ₜ[A] h)
        ⟨coefficientMap A γ δ s t f (j : R₀), by sorry⟩ =
      coefficientHom A' (f γ) (f δ) (f s) (f t) a' *
        coefficientMap A γ δ s t f (h j) := by
  sorry

theorem dualTensorEquivIdentity (a : A) (h : D₀) :
    dualTensorEquiv A γ δ s t (RingHom.id A) (a ⊗ₜ[A] h) = a • h := by
  sorry

theorem dualTensorEquivComposition {A' A'' : Type*} [CommRing A'] [CommRing A'']
    (f : A →+* A') (g : A' →+* A'') :
    letI : Algebra A A' := f.toAlgebra
    letI : Algebra A' A'' := g.toAlgebra
    letI : Algebra A A'' := (g.comp f).toAlgebra
    ∀ (a'' : A'') (a' : A') (h : D₀),
      dualTensorEquiv A' (f γ) (f δ) (f s) (f t) g
        (a'' ⊗ₜ[A'] dualTensorEquiv A γ δ s t f (a' ⊗ₜ[A] h)) =
      dualTensorEquiv A γ δ s t (g.comp f) ((a'' * g a') ⊗ₜ[A] h) := by
  sorry

-- StableReductionPartII:MC.2/section-correction-coefficient-naturality
theorem correctionCoefficientNaturality {A' : Type*} [CommRing A'] (f : A →+* A')
    (K : R₀ →ₗ[A] R₀)
    (K' : Ring A' (f γ) (f δ) (f s) (f t) →ₗ[A']
      Ring A' (f γ) (f δ) (f s) (f t))
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (hK' : ∀ r : Ring A' (f γ) (f δ) (f s) (f t),
      (AdjoinRoot.of (polynomial A' (f γ) (f δ) (f s) (f t)) Polynomial.X -
        coefficientHom A' (f γ) (f δ) (f s) (f t) (f t)) * K' r =
      (AdjoinRoot.root (polynomial A' (f γ) (f δ) (f s) (f t)) +
        coefficientHom A' (f γ) (f δ) (f s) (f t) (f s) +
        coefficientHom A' (f γ) (f δ) (f s) (f t) (f γ) *
          coefficientHom A' (f γ) (f δ) (f s) (f t) (f t)) *
        (r - coefficientHom A' (f γ) (f δ) (f s) (f t)
          (sectionEval A' (f γ) (f δ) (f s) (f t) r))) (r : R₀) :
    coefficientMap A γ δ s t f (K r) = K' (coefficientMap A γ δ s t f r) := by
  sorry

-- StableReductionPartII:MC.2/section-dual-tensor-scalar
theorem dualTensorEquivScalar {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ (a' : A') (r : R₀) (h : D₀),
      dualTensorEquiv A γ δ s t f (a' ⊗ₜ[A] (r • h)) =
        coefficientMap A γ δ s t f r •
          dualTensorEquiv A γ δ s t f (a' ⊗ₜ[A] h) := by
  sorry

-- Actual multiplication range, not an arbitrary submodule standing for R.
-- StableReductionPartII:MC.2/section-dual-tensor-action
/-- The canonical action is constrained by dualTensorActionTmul below. -/
@[instance_reducible]
def dualTensorAction {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    Module (A' ⊗[A] R₀) (A' ⊗[A] D₀) := by
  sorry

theorem dualTensorActionTmul {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    letI := dualTensorAction A γ δ s t f
    ∀ (a' b' : A') (r : R₀) (h : D₀),
      (a' ⊗ₜ[A] r) • (b' ⊗ₜ[A] h) = (a' * b') ⊗ₜ[A] (r • h) := by
  sorry

theorem dualTensorActionUnique {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ action : Module (A' ⊗[A] R₀) (A' ⊗[A] D₀),
      (∀ (a' b' : A') (r : R₀) (h : D₀),
        letI := action
        (a' ⊗ₜ[A] r) • (b' ⊗ₜ[A] h) = (a' * b') ⊗ₜ[A] (r • h)) →
      action = dualTensorAction A γ δ s t f := by
  sorry

/-- R'-linearity for the canonical tensor-ring action transported by the
actual algebra equivalence, not an action invented from the desired answer. -/
theorem dualTensorRingLinear {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    let R' := Ring A' (f γ) (f δ) (f s) (f t)
    letI : Module (A' ⊗[A] R₀) (A' ⊗[A] D₀) := dualTensorAction A γ δ s t f
    letI : Module R' (A' ⊗[A] D₀) :=
      Module.compHom (A' ⊗[A] D₀) (ringTensorEquiv A γ δ s t f).symm.toRingHom
    ∃ e : (A' ⊗[A] D₀) ≃ₗ[R'] sectionDual A' (f γ) (f δ) (f s) (f t),
      ∀ z, e z = dualTensorEquiv A γ δ s t f z := by
  sorry

-- API of StableReductionPartII:MC.2/section-dual-residue
def dualMultiplication : R₀ →ₗ[R₀] D₀ := by
  sorry

theorem dualMultiplicationApply (r : R₀) (j : J₀) :
    dualMultiplication A γ δ s t r j = r * (j : R₀) := by
  sorry

-- StableReductionPartII:MC.2/section-dual-quotient-equivalence
abbrev sectionDualQuotient :=
  D₀ ⧸ LinearMap.range (dualMultiplication A γ δ s t)

def dualQuotientEquiv : sectionDualQuotient A γ δ s t ≃ₗ[A] A := by
  sorry

theorem dualQuotientEquivGenerator (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    dualQuotientEquiv A γ δ s t (Submodule.Quotient.mk ε) = 1 := by
  sorry

theorem dualQuotientEquivScalar (r : R₀) (q : sectionDualQuotient A γ δ s t) :
    dualQuotientEquiv A γ δ s t (r • q) =
      sectionEval A γ δ s t r * dualQuotientEquiv A γ δ s t q := by
  sorry

-- StableReductionPartII:MC.2/section-dual-quotient-tensor-equivalence
def dualQuotientTensorEquiv {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    (A' ⊗[A] sectionDualQuotient A γ δ s t) ≃ₗ[A']
      sectionDualQuotient A' (f γ) (f δ) (f s) (f t) := by
  sorry

theorem dualQuotientTensorEquivTmul {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ (a' : A') (h : D₀),
      dualQuotientTensorEquiv A γ δ s t f (a' ⊗ₜ[A]
        (Submodule.Quotient.mk h : sectionDualQuotient A γ δ s t)) =
      Submodule.Quotient.mk (dualTensorEquiv A γ δ s t f (a' ⊗ₜ[A] h)) := by
  sorry

theorem dualQuotientTensorEquivResidue {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ (a' : A') (q : sectionDualQuotient A γ δ s t),
      dualQuotientEquiv A' (f γ) (f δ) (f s) (f t)
        (dualQuotientTensorEquiv A γ δ s t f (a' ⊗ₜ[A] q)) =
      a' * f (dualQuotientEquiv A γ δ s t q) := by
  sorry

theorem dualQuotientTensorEquivIdentity (a : A) (q : sectionDualQuotient A γ δ s t) :
    dualQuotientTensorEquiv A γ δ s t (RingHom.id A) (a ⊗ₜ[A] q) = a • q := by
  sorry

theorem dualQuotientTensorEquivComposition {A' A'' : Type*} [CommRing A'] [CommRing A'']
    (f : A →+* A') (g : A' →+* A'') :
    letI : Algebra A A' := f.toAlgebra
    letI : Algebra A' A'' := g.toAlgebra
    letI : Algebra A A'' := (g.comp f).toAlgebra
    ∀ (a'' : A'') (a' : A') (q : sectionDualQuotient A γ δ s t),
      dualQuotientTensorEquiv A' (f γ) (f δ) (f s) (f t) g
        (a'' ⊗ₜ[A'] dualQuotientTensorEquiv A γ δ s t f (a' ⊗ₜ[A] q)) =
      dualQuotientTensorEquiv A γ δ s t (g.comp f) ((a'' * g a') ⊗ₜ[A] q) := by
  sorry

theorem dualQuotientTensorEquivUnique {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ e : (A' ⊗[A] sectionDualQuotient A γ δ s t) ≃ₗ[A']
        sectionDualQuotient A' (f γ) (f δ) (f s) (f t),
      (∀ (a' : A') (q : sectionDualQuotient A γ δ s t),
        dualQuotientEquiv A' (f γ) (f δ) (f s) (f t) (e (a' ⊗ₜ[A] q)) =
          a' * f (dualQuotientEquiv A γ δ s t q)) →
      e = dualQuotientTensorEquiv A γ δ s t f := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.ringTensorIdentity
example (a : A) (r : R₀) :
    ringTensorEquiv A γ δ s t (RingHom.id A) (a ⊗ₜ[A] r) = ι₀ a * r := sorry
-- test: NodeSectionFactorization.PolynomialModel.ringTensorMultiplication
example {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ x y : A' ⊗[A] R₀, ringTensorEquiv A γ δ s t f (x * y) =
      ringTensorEquiv A γ δ s t f x * ringTensorEquiv A γ δ s t f y := sorry
-- test: NodeSectionFactorization.PolynomialModel.ringTensorZero
example [Subsingleton A] : Subsingleton (A ⊗[A] R₀) := sorry
-- test: NodeSectionFactorization.PolynomialModel.dualTensorIdentity
example (a : A) (h : D₀) :
    dualTensorEquiv A γ δ s t (RingHom.id A) (a ⊗ₜ[A] h) = a • h := sorry
-- test: NodeSectionFactorization.PolynomialModel.dualTensorComposition
example {A' A'' : Type*} [CommRing A'] [CommRing A'']
    (f : A →+* A') (g : A' →+* A'') :
    letI : Algebra A A' := f.toAlgebra
    letI : Algebra A' A'' := g.toAlgebra
    letI : Algebra A A'' := (g.comp f).toAlgebra
    ∀ h : D₀,
      dualTensorEquiv A' (f γ) (f δ) (f s) (f t) g
        (1 ⊗ₜ[A'] dualTensorEquiv A γ δ s t f (1 ⊗ₜ[A] h)) =
      dualTensorEquiv A γ δ s t (g.comp f) (1 ⊗ₜ[A] h) := sorry
-- test: NodeSectionFactorization.PolynomialModel.dualTensorNonflat
example :
    (¬ Module.Flat ℤ (ZMod 2)) ∧
      Nonempty (((ZMod 2) ⊗[ℤ] sectionDual ℤ 1 0 0 0) ≃ₗ[ZMod 2]
        sectionDual (ZMod 2) 1 0 0 0) := sorry
-- test: NodeSectionFactorization.PolynomialModel.tensorActionProduct
example {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    letI := dualTensorAction A γ δ s t f
    ∀ (a' b' : A') (r : R₀) (h : D₀),
      (a' ⊗ₜ[A] r) • (b' ⊗ₜ[A] h) = (a' * b') ⊗ₜ[A] (r • h) := sorry
-- test: NodeSectionFactorization.PolynomialModel.tensorActionCorrection
example (ε : D₀) (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    letI := dualTensorAction A γ δ s t (RingHom.id A)
    ((1 : A) ⊗ₜ[A] d₀) • ((1 : A) ⊗ₜ[A] ε) =
      (1 : A) ⊗ₜ[A] dualMultiplication A γ δ s t b₀ := sorry
-- test: NodeSectionFactorization.PolynomialModel.tensorActionZero
example [Subsingleton A] : Subsingleton (A ⊗[A] D₀) := sorry
-- test: NodeSectionFactorization.PolynomialModel.quotientGenerator
example (ε : D₀) (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    dualQuotientEquiv A γ δ s t (Submodule.Quotient.mk ε) = 1 := sorry
-- test: NodeSectionFactorization.PolynomialModel.quotientMultiplication
example (r : R₀) :
    (Submodule.Quotient.mk (dualMultiplication A γ δ s t r) :
      sectionDualQuotient A γ δ s t) = 0 := sorry
-- test: NodeSectionFactorization.PolynomialModel.quotientCoordinateKills
example (q : sectionDualQuotient A γ δ s t) : d₀ • q = 0 := sorry
-- test: NodeSectionFactorization.PolynomialModel.quotientTensorResidue
example {A' : Type*} [CommRing A'] (f : A →+* A') :
    letI : Algebra A A' := f.toAlgebra
    ∀ (a' : A') (q : sectionDualQuotient A γ δ s t),
      dualQuotientEquiv A' (f γ) (f δ) (f s) (f t)
        (dualQuotientTensorEquiv A γ δ s t f (a' ⊗ₜ[A] q)) =
      a' * f (dualQuotientEquiv A γ δ s t q) := sorry
-- test: NodeSectionFactorization.PolynomialModel.quotientTensorIdentity
example (a : A) (q : sectionDualQuotient A γ δ s t) :
    dualQuotientTensorEquiv A γ δ s t (RingHom.id A) (a ⊗ₜ[A] q) = a • q := sorry
-- test: NodeSectionFactorization.PolynomialModel.quotientTensorNonflat
example :
    let f : ℤ →+* ZMod 2 := Int.castRingHom (ZMod 2)
    letI : Algebra ℤ (ZMod 2) := f.toAlgebra
    letI : Module ℤ (ZMod 2) := f.toAlgebra.toModule
    (¬ Module.Flat ℤ (ZMod 2)) ∧
      ∀ q : sectionDualQuotient ℤ 1 0 0 0,
        dualQuotientEquiv (ZMod 2) 1 0 0 0
          (dualQuotientTensorEquiv ℤ 1 0 0 0 f ((1 : ZMod 2) ⊗ₜ[ℤ] q)) =
        f (dualQuotientEquiv ℤ 1 0 0 0 q) := sorry
-- NodeSectionFactorization.PolynomialModel.modelRelation
example : NodeForm (ι₀ γ) (ι₀ δ) u₀ v₀ = ι₀ (NodeForm γ δ s t) := sorry
-- NodeSectionFactorization.PolynomialModel.modelZero
example [Subsingleton A] : Subsingleton R₀ ∧ Subsingleton J₀ ∧ Subsingleton D₀ := sorry
-- NodeSectionFactorization.PolynomialModel.evaluationCoordinates
example (z : A) : sectionEval A γ δ s t u₀ = s ∧
    sectionEval A γ δ s t v₀ = t ∧ sectionEval A γ δ s t (ι₀ z) = z := sorry
-- test: NodeSectionFactorization.PolynomialModel.monicZeroBase
example [Subsingleton A] : (w₀).Monic := polynomialMonic A γ δ s t

-- test: NodeSectionFactorization.PolynomialModel.degreeCharacteristicTwo
example : (polynomial (ZMod 2) 1 0 0 0).natDegree = 2 :=
  polynomialNatDegree (ZMod 2) 1 0 0 0

-- test: NodeSectionFactorization.PolynomialModel.regularOverNondomain
/-- The coefficient ring has zero divisors and the quadratic has zero discriminant. -/
example : Function.Injective (fun r : Ring (ZMod 4) 0 0 0 0 =>
    AdjoinRoot.of (polynomial (ZMod 4) 0 0 0 0) Polynomial.X * r) := sorry
section IdealCokernelTests
variable (e : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin β₀)) ≃ₗ[R₀] J₀)
variable (he : ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀ * z 0 - d₀ * z 1)
include he in
-- NodeSectionFactorization.PolynomialModel.idealCokernelFirst
example : (e (Submodule.Quotient.mk (fun i => if i = 0 then 1 else 0)) : R₀) = c₀ := sorry
-- NodeSectionFactorization.PolynomialModel.idealCokernelSecond
example : (e (Submodule.Quotient.mk (fun i => if i = 0 then 0 else 1)) : R₀) = -d₀ := sorry
-- NodeSectionFactorization.PolynomialModel.idealCokernelZero
example : e (Submodule.Quotient.mk (0 : Fin 2 → R₀)) = 0 := sorry
end IdealCokernelTests

section DualGeneratorTests
variable (ε : D₀) (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀))
include hε in
-- NodeSectionFactorization.PolynomialModel.dualGeneratorSecond
example : ε ⟨d₀, Ideal.subset_span (Set.mem_insert_of_mem _ (Set.mem_singleton d₀))⟩ = b₀ := sorry
section NormalCoordinateTests
variable (e : D₀ ≃ₗ[A] (R₀ × A))
variable (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j)
include he in
-- NodeSectionFactorization.PolynomialModel.normalInclusion
example (h : D₀) (hh : ∀ j : J₀, h j = (j : R₀)) : e h = (1, 0) := sorry
-- NodeSectionFactorization.PolynomialModel.normalGenerator
example : e ε = (0, 1) := sorry
-- NodeSectionFactorization.PolynomialModel.normalRoundTrip
example (p : R₀ × A) : e (e.symm p) = p := sorry
-- NodeSectionFactorization.PolynomialModel.residueGenerator
example : (e ε).2 = 1 := sorry
-- NodeSectionFactorization.PolynomialModel.residueInclusion
example (h : D₀) (hh : ∀ j : J₀, h j = (j : R₀)) : (e h).2 = 0 := sorry
end NormalCoordinateTests

section DualCokernelTests
variable (e : ((Fin 2 → R₀) ⧸ LinearMap.range (Matrix.mulVecLin α₀)) ≃ₗ[R₀] D₀)
variable (he : ∀ (z : Fin 2 → R₀) (j : J₀),
  d₀ * e (Submodule.Quotient.mk z) j = (d₀ * z 0 - b₀ * z 1) * (j : R₀))
include he in
-- NodeSectionFactorization.PolynomialModel.dualCokernelFirst
example : e (Submodule.Quotient.mk (fun i => if i = 0 then 1 else 0)) ⟨d₀, Ideal.subset_span (Set.mem_insert_of_mem _ (Set.mem_singleton d₀))⟩ = d₀ := sorry
-- NodeSectionFactorization.PolynomialModel.dualCokernelSecond
example : e (Submodule.Quotient.mk (fun i => if i = 0 then 0 else 1)) ⟨d₀, Ideal.subset_span (Set.mem_insert_of_mem _ (Set.mem_singleton d₀))⟩ = -b₀ := sorry
-- NodeSectionFactorization.PolynomialModel.dualCokernelZero
example (j : J₀) : e (Submodule.Quotient.mk (0 : Fin 2 → R₀)) j = 0 := sorry
end DualCokernelTests
end DualGeneratorTests

-- NodeSectionFactorization.PolynomialModel.dualGenerator.canonicalNonreduced
example :
    let u := AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)
    dualGenerator (ZMod 4) 0 0 1 0
      ⟨AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) Polynomial.X -
        coefficientHom (ZMod 4) 0 0 1 0 0, sectionSecond_mem (ZMod 4) 0 0 1 0⟩ = u+1 := sorry

-- NodeSectionFactorization.PolynomialModel.dualGenerator.canonicalSignThree
example :
    let u := AdjoinRoot.root (polynomial (ZMod 3) 1 0 0 0)
    dualGenerator (ZMod 3) 1 0 0 0
      ⟨u - coefficientHom (ZMod 3) 1 0 0 0 0, sectionFirst_mem (ZMod 3) 1 0 0 0⟩ = -u ∧
      dualGenerator (ZMod 3) 1 0 0 0
        ⟨AdjoinRoot.of (polynomial (ZMod 3) 1 0 0 0) Polynomial.X -
          coefficientHom (ZMod 3) 1 0 0 0 0, sectionSecond_mem (ZMod 3) 1 0 0 0⟩ = u ∧ u ≠ -u := sorry

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.canonicalCharacteristicTwo
example :
    let u := AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0)
    dualCorrectionMap (ZMod 2) 1 0 0 0 u = u := sorry

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.canonicalProduct
example (r : R₀) : dualCorrectionMap A γ δ s t (r*d₀) = r*b₀ := sorry

section CorrectionTests
variable (K : R₀ →ₗ[A] R₀)
variable (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
include hK in
-- NodeSectionFactorization.PolynomialModel.correctionFirst
example : K c₀ = -a₀ := sorry
-- NodeSectionFactorization.PolynomialModel.correctionSecond
example : K d₀ = b₀ := sorry
-- NodeSectionFactorization.PolynomialModel.correctionConstants
example (z : A) : K (ι₀ z) = 0 := sorry
end CorrectionTests

-- NodeSectionFactorization.PolynomialModel.mapIdentity
example : coefficientMap A γ δ s t (RingHom.id A) u₀ = u₀ := sorry
-- NodeSectionFactorization.PolynomialModel.mapZeroCoefficient
example {A' : Type*} [CommRing A'] (f : A →+* A') :
    coefficientMap A γ δ s t f (ι₀ 0) = 0 := sorry
-- NodeSectionFactorization.PolynomialModel.mapSectionCoordinates
example {A' : Type*} [CommRing A'] (f : A →+* A') :
    let ι' := coefficientHom A' (f γ) (f δ) (f s) (f t)
    coefficientMap A γ δ s t f c₀ = AdjoinRoot.root (polynomial A' (f γ) (f δ) (f s) (f t)) - ι' (f s) ∧
    coefficientMap A γ δ s t f d₀ = AdjoinRoot.of (polynomial A' (f γ) (f δ) (f s) (f t)) Polynomial.X - ι' (f t) := sorry
-- NodeSectionFactorization.PolynomialModel.dualZeroBase
/-- Test: over the zero base both coordinates and the dual have one element. -/
example [Subsingleton A] : Subsingleton D₀ ∧ Subsingleton (R₀ × A) := sorry
-- NodeSectionFactorization.PolynomialModel.dualSignThree
/-- Test: the two generator values retain the minus sign in characteristic three. -/
example :
    let w : Polynomial (Polynomial (ZMod 3)) :=
      Polynomial.X ^ 2 + Polynomial.C Polynomial.X * Polynomial.X
    let B := AdjoinRoot w
    let u : B := AdjoinRoot.root w
    let v : B := AdjoinRoot.of w Polynomial.X
    let J : Ideal B := Ideal.span {u, v}
    ∃ ε : J →ₗ[B] B,
      ε ⟨u, by sorry⟩ = -u ∧ ε ⟨v, by sorry⟩ = u ∧ u ≠ -u := sorry
-- NodeSectionFactorization.PolynomialModel.residueNoRingSplit
/-- Non-example: a residue surjection has no R-linear splitting over a nonzero
base, although it does have the A-linear splitting supplied by ε. The R-linearity
condition below uses the actual section evaluation, not an arbitrary predicate. -/
example [Nontrivial A] (ρ : D₀ →ₗ[A] A) :
    let ev : R₀ →+* A :=
      sectionEval A γ δ s t
    ¬ ∃ σ : A →ₗ[A] D₀,
      (∀ (r : R₀) (z : A), σ (ev r * z) = r • σ z) ∧
      Function.RightInverse σ ρ := sorry
/-- Test: the dual comparison survives the nonflat coefficient map Z→F₂.
The rings below are untruncated polynomial quotients, not Artinian substitutes. -/
example :
    let w : Polynomial (Polynomial ℤ) :=
      Polynomial.X ^ 2 + Polynomial.C Polynomial.X * Polynomial.X
    let w' := w.map (Polynomial.mapRingHom (Int.castRingHom (ZMod 2)))
    let B := AdjoinRoot w
    let B' := AdjoinRoot w'
    let J : Ideal B := Ideal.span {AdjoinRoot.root w, AdjoinRoot.of w Polynomial.X}
    let J' : Ideal B' := Ideal.span {AdjoinRoot.root w', AdjoinRoot.of w' Polynomial.X}
    (¬ Module.Flat ℤ (ZMod 2)) ∧
      Nonempty (((ZMod 2) ⊗[ℤ] (J →ₗ[B] B)) ≃ₗ[ZMod 2] (J' →ₗ[B'] B')) := sorry
-- NodeSectionFactorization.PolynomialModel.quotientCharacteristicTwo
/-- A characteristic-two test on the quotient, not just on the polynomial products. -/
example (h2 : (2 : A) = 0) :
    let f : Polynomial (Polynomial A) :=
      Polynomial.X ^ 2 + Polynomial.C Polynomial.X * Polynomial.X
    let B := AdjoinRoot f
    let u : B := AdjoinRoot.root f
    let v : B := AdjoinRoot.of f Polynomial.X
    LinearMap.ker (left 1 0 u v 0 0).mulVecLin =
      LinearMap.range (right 1 0 u v 0 0).mulVecLin := sorry
end


noncomputable section
open scoped TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)

/-! Flat ambient extension of this explicit section ideal.
These are applications of pinned finite-presentation Hom base change.
They do not define Knudsen relative stable reflexivity or a nodal family. -/

-- StableReductionPartII:MC.2/section-ideal-finite-presentation
theorem sectionIdealFinitePresentation : Module.FinitePresentation (Ring A γ δ s t) (sectionIdeal A γ δ s t) := by
  sorry

section AmbientExtension
variable (B : Type*) [CommRing B] [Algebra (Ring A γ δ s t) B]

abbrev ambientIdeal := (sectionIdeal A γ δ s t).map (algebraMap (Ring A γ δ s t) B)
abbrev ambientDual := ambientIdeal A γ δ s t B →ₗ[B] B

-- StableReductionPartII:MC.2/section-ideal-ambient-equivalence
def ambientIdealEquiv [Module.Flat (Ring A γ δ s t) B] :
    (B ⊗[(Ring A γ δ s t)] sectionIdeal A γ δ s t) ≃ₗ[B] ambientIdeal A γ δ s t B := by
  sorry

theorem ambientIdealEquivTmul [Module.Flat (Ring A γ δ s t) B] (b : B) (j : sectionIdeal A γ δ s t) :
    (ambientIdealEquiv A γ δ s t B (b ⊗ₜ[(Ring A γ δ s t)] j) : B) = b * algebraMap (Ring A γ δ s t) B j := by
  sorry

theorem ambientIdealEquivUnique [Module.Flat (Ring A γ δ s t) B]
    (e : (B ⊗[(Ring A γ δ s t)] sectionIdeal A γ δ s t) ≃ₗ[B] ambientIdeal A γ δ s t B)
    (he : ∀ b j, (e (b ⊗ₜ[(Ring A γ δ s t)] j) : B) = b * algebraMap (Ring A γ δ s t) B j) :
    e = ambientIdealEquiv A γ δ s t B := by
  sorry

-- StableReductionPartII:MC.2/section-dual-ambient-equivalence
def ambientDualEquiv [Module.Flat (Ring A γ δ s t) B] :
    (B ⊗[(Ring A γ δ s t)] sectionDual A γ δ s t) ≃ₗ[B] ambientDual A γ δ s t B := by
  sorry

theorem ambientDualEquivEvaluation [Module.Flat (Ring A γ δ s t) B]
    (b b' : B) (h : sectionDual A γ δ s t) (j : sectionIdeal A γ δ s t) :
    ambientDualEquiv A γ δ s t B (b ⊗ₜ[(Ring A γ δ s t)] h)
      (ambientIdealEquiv A γ δ s t B (b' ⊗ₜ[(Ring A γ δ s t)] j)) =
      b * b' * algebraMap (Ring A γ δ s t) B (h j) := by
  sorry

theorem ambientDualEquivUnique [Module.Flat (Ring A γ δ s t) B]
    (e : (B ⊗[(Ring A γ δ s t)] sectionDual A γ δ s t) ≃ₗ[B] ambientDual A γ δ s t B)
    (he : ∀ b b' h j, e (b ⊗ₜ[(Ring A γ δ s t)] h)
      (ambientIdealEquiv A γ δ s t B (b' ⊗ₜ[(Ring A γ δ s t)] j)) =
      b * b' * algebraMap (Ring A γ δ s t) B (h j)) : e = ambientDualEquiv A γ δ s t B := by
  sorry

-- Actual multiplication map; no residue coordinate is used to define it.
def ambientMultiplication : B →ₗ[B] ambientDual A γ δ s t B := by
  sorry

theorem ambientMultiplicationApply (b : B) (j : ambientIdeal A γ δ s t B) :
    ambientMultiplication A γ δ s t B b j = b * (j : B) := by
  sorry

-- StableReductionPartII:MC.2/section-dual-ambient-multiplication
theorem ambientDualEquivMultiplication [Module.Flat (Ring A γ δ s t) B] (b : B) (r : (Ring A γ δ s t)) :
    ambientDualEquiv A γ δ s t B (b ⊗ₜ[(Ring A γ δ s t)] dualMultiplication A γ δ s t r) =
      ambientMultiplication A γ δ s t B (b * algebraMap (Ring A γ δ s t) B r) := by
  sorry

abbrev ambientDualQuotient :=
  ambientDual A γ δ s t B ⧸ LinearMap.range (ambientMultiplication A γ δ s t B)

-- StableReductionPartII:MC.2/section-dual-ambient-quotient-equivalence
def ambientQuotientEquiv [Module.Flat (Ring A γ δ s t) B] :
    (B ⊗[(Ring A γ δ s t)] sectionDualQuotient A γ δ s t) ≃ₗ[B] ambientDualQuotient A γ δ s t B := by
  sorry

theorem ambientQuotientEquivTmul [Module.Flat (Ring A γ δ s t) B] (b : B) (h : sectionDual A γ δ s t) :
    ambientQuotientEquiv A γ δ s t B (b ⊗ₜ[(Ring A γ δ s t)] Submodule.Quotient.mk h) =
      Submodule.Quotient.mk (ambientDualEquiv A γ δ s t B (b ⊗ₜ[(Ring A γ δ s t)] h)) := by
  sorry

theorem ambientQuotientEquivUnique [Module.Flat (Ring A γ δ s t) B]
    (e : (B ⊗[(Ring A γ δ s t)] sectionDualQuotient A γ δ s t) ≃ₗ[B] ambientDualQuotient A γ δ s t B)
    (he : ∀ b h, e (b ⊗ₜ[(Ring A γ δ s t)] Submodule.Quotient.mk h) =
      Submodule.Quotient.mk (ambientDualEquiv A γ δ s t B (b ⊗ₜ[(Ring A γ δ s t)] h))) :
    e = ambientQuotientEquiv A γ δ s t B := by
  sorry

-- StableReductionPartII:MC.2/section-dual-ambient-faithful-detection
-- Faithful flatness is a stated hypothesis, not inferred from flatness alone.
theorem ambientQuotientFaithfulDetection [Module.FaithfullyFlat (Ring A γ δ s t) B]
    (f : sectionDualQuotient A γ δ s t →ₗ[(Ring A γ δ s t)] sectionDualQuotient A γ δ s t) :
    Function.Bijective (f.lTensor B) ↔ Function.Bijective f := by
  sorry

-- Tests of the ideal comparison: evaluation, identity and a degenerate target.
-- test: NodeSectionFactorization.PolynomialModel.ambientIdealGenerator
example [Module.Flat (Ring A γ δ s t) B] (j : sectionIdeal A γ δ s t) :
    (ambientIdealEquiv A γ δ s t B (1 ⊗ₜ[(Ring A γ δ s t)] j) : B) = algebraMap (Ring A γ δ s t) B j := sorry
-- test: NodeSectionFactorization.PolynomialModel.ambientIdealIdentity
example (r : (Ring A γ δ s t)) (j : sectionIdeal A γ δ s t) :
    (ambientIdealEquiv A γ δ s t (Ring A γ δ s t) (r ⊗ₜ[(Ring A γ δ s t)] j) : (Ring A γ δ s t)) = r * (j : (Ring A γ δ s t)) := sorry
-- test: NodeSectionFactorization.PolynomialModel.ambientIdealZero
example [Subsingleton B] : Subsingleton (ambientIdeal A γ δ s t B) := sorry
-- test: NodeSectionFactorization.PolynomialModel.ambientDualEvaluation
example [Module.Flat (Ring A γ δ s t) B] (h : sectionDual A γ δ s t) (j : sectionIdeal A γ δ s t) :
    ambientDualEquiv A γ δ s t B (1 ⊗ₜ[(Ring A γ δ s t)] h)
      (ambientIdealEquiv A γ δ s t B (1 ⊗ₜ[(Ring A γ δ s t)] j)) = algebraMap (Ring A γ δ s t) B (h j) := sorry
-- test: NodeSectionFactorization.PolynomialModel.ambientDualIdentity
example (h : sectionDual A γ δ s t) (j : sectionIdeal A γ δ s t) :
    ambientDualEquiv A γ δ s t (Ring A γ δ s t) (1 ⊗ₜ[(Ring A γ δ s t)] h)
      (ambientIdealEquiv A γ δ s t (Ring A γ δ s t) (1 ⊗ₜ[(Ring A γ δ s t)] j)) = h j := sorry
-- test: NodeSectionFactorization.PolynomialModel.ambientDualZero
example [Subsingleton B] : Subsingleton (ambientDual A γ δ s t B) := sorry
-- test: NodeSectionFactorization.PolynomialModel.ambientQuotientMultiplication
example [Module.Flat (Ring A γ δ s t) B] (b : B) (r : (Ring A γ δ s t)) :
    ambientQuotientEquiv A γ δ s t B
      (b ⊗ₜ[(Ring A γ δ s t)] Submodule.Quotient.mk (dualMultiplication A γ δ s t r)) = 0 := sorry
-- test: NodeSectionFactorization.PolynomialModel.ambientQuotientIdentity
example (h : sectionDual A γ δ s t) :
    ambientQuotientEquiv A γ δ s t (Ring A γ δ s t) (1 ⊗ₜ[(Ring A γ δ s t)] Submodule.Quotient.mk h) =
      Submodule.Quotient.mk (ambientDualEquiv A γ δ s t (Ring A γ δ s t) (1 ⊗ₜ[(Ring A γ δ s t)] h)) := sorry
-- test: NodeSectionFactorization.PolynomialModel.ambientQuotientAwayFromSection
example (hd : IsUnit (algebraMap (Ring A γ δ s t) B ((AdjoinRoot.of (polynomial A γ δ s t) (Polynomial.X : Polynomial A)) - (coefficientHom A γ δ s t) t))) :
    Subsingleton (ambientDualQuotient A γ δ s t B) := sorry
end AmbientExtension

-- StableReductionPartII:MC.2/section-dual-completion-equivalence
-- Completes the module itself, not only its tensor model.
def completedDualEquiv [IsNoetherianRing (Ring A γ δ s t)] (I : Ideal (Ring A γ δ s t)) :
    AdicCompletion I (sectionDual A γ δ s t) ≃ₗ[AdicCompletion I (Ring A γ δ s t)]
      ambientDual A γ δ s t (AdicCompletion I (Ring A γ δ s t)) := by
  sorry

theorem completedDualEquivOf [IsNoetherianRing (Ring A γ δ s t)] (I : Ideal (Ring A γ δ s t))
    (h : sectionDual A γ δ s t) :
    completedDualEquiv A γ δ s t I (AdicCompletion.of I _ h) =
      ambientDualEquiv A γ δ s t (AdicCompletion I (Ring A γ δ s t)) (1 ⊗ₜ[(Ring A γ δ s t)] h) := by
  sorry

theorem completedDualEquivTensor [IsNoetherianRing (Ring A γ δ s t)] (I : Ideal (Ring A γ δ s t))
    (b : AdicCompletion I (Ring A γ δ s t)) (h : sectionDual A γ δ s t) :
    completedDualEquiv A γ δ s t I (b • AdicCompletion.of I _ h) =
      ambientDualEquiv A γ δ s t (AdicCompletion I (Ring A γ δ s t)) (b ⊗ₜ[(Ring A γ δ s t)] h) := by
  sorry

-- StableReductionPartII:MC.2/section-dual-quotient-completion-equivalence
def completedQuotientEquiv [IsNoetherianRing (Ring A γ δ s t)] (I : Ideal (Ring A γ δ s t)) :
    AdicCompletion I (sectionDualQuotient A γ δ s t) ≃ₗ[AdicCompletion I (Ring A γ δ s t)]
      ambientDualQuotient A γ δ s t (AdicCompletion I (Ring A γ δ s t)) := by
  sorry

theorem completedQuotientEquivOf [IsNoetherianRing (Ring A γ δ s t)] (I : Ideal (Ring A γ δ s t))
    (h : sectionDual A γ δ s t) :
    completedQuotientEquiv A γ δ s t I
      (AdicCompletion.of I (sectionDualQuotient A γ δ s t) (Submodule.Quotient.mk h)) =
      Submodule.Quotient.mk (completedDualEquiv A γ δ s t I (AdicCompletion.of I _ h)) := by
  sorry

theorem completedQuotientEquivTensor [IsNoetherianRing (Ring A γ δ s t)] (I : Ideal (Ring A γ δ s t))
    (b : AdicCompletion I (Ring A γ δ s t)) (h : sectionDual A γ δ s t) :
    completedQuotientEquiv A γ δ s t I
      (b • AdicCompletion.of I (sectionDualQuotient A γ δ s t) (Submodule.Quotient.mk h)) =
      Submodule.Quotient.mk (ambientDualEquiv A γ δ s t (AdicCompletion I (Ring A γ δ s t))
        (b ⊗ₜ[(Ring A γ δ s t)] h)) := by
  sorry

section CompletionTests
variable [IsNoetherianRing (Ring A γ δ s t)] (I : Ideal (Ring A γ δ s t))
-- test: NodeSectionFactorization.PolynomialModel.completedDualMultiplication
example (r : (Ring A γ δ s t)) :
    completedDualEquiv A γ δ s t I
      (AdicCompletion.of I _ (dualMultiplication A γ δ s t r)) =
      ambientMultiplication A γ δ s t (AdicCompletion I (Ring A γ δ s t)) (algebraMap (Ring A γ δ s t) _ r) := sorry
-- test: NodeSectionFactorization.PolynomialModel.completedDualZero
example : completedDualEquiv A γ δ s t I 0 = 0 := sorry
-- test: NodeSectionFactorization.PolynomialModel.completedDualEvaluation
example (h : sectionDual A γ δ s t) (j : sectionIdeal A γ δ s t) :
    completedDualEquiv A γ δ s t I (AdicCompletion.of I _ h)
      (ambientIdealEquiv A γ δ s t (AdicCompletion I (Ring A γ δ s t)) (1 ⊗ₜ[(Ring A γ δ s t)] j)) =
      algebraMap (Ring A γ δ s t) (AdicCompletion I (Ring A γ δ s t)) (h j) := sorry
-- test: NodeSectionFactorization.PolynomialModel.completedQuotientMultiplication
example (r : (Ring A γ δ s t)) :
    completedQuotientEquiv A γ δ s t I
      (AdicCompletion.of I _ (Submodule.Quotient.mk (dualMultiplication A γ δ s t r))) = 0 := sorry
-- test: NodeSectionFactorization.PolynomialModel.completedQuotientZero
example : completedQuotientEquiv A γ δ s t I 0 = 0 := sorry
-- test: NodeSectionFactorization.PolynomialModel.completedQuotientAwayFromSection
example (hd : IsUnit (algebraMap (Ring A γ δ s t) (AdicCompletion I (Ring A γ δ s t)) ((AdjoinRoot.of (polynomial A γ δ s t) (Polynomial.X : Polynomial A)) - (coefficientHom A γ δ s t) t))) :
    Subsingleton (ambientDualQuotient A γ δ s t (AdicCompletion I (Ring A γ δ s t))) := sorry
end CompletionTests

end
end PolynomialModel

-- NodeSectionFactorization.PolynomialModel.receivingRingNotExact
/-- A non-example: unit discriminant and vanishing products in an arbitrary ring
are insufficient for exactness. All coordinates are specialized in Z, rather
than kept in the actual polynomial quotient. -/
example :
    NodeForm.Nondegenerate (1 : ℤ) 0 ∧
    left (1 : ℤ) 0 0 0 0 0 * right 1 0 0 0 0 0 = 0 ∧
    LinearMap.ker (left (1 : ℤ) 0 0 0 0 0).mulVecLin ≠
      LinearMap.range (right (1 : ℤ) 0 0 0 0 0).mulVecLin := sorry
end NodeSectionFactorization

-- StableReductionPartII:MC.2/small-extension-coordinate-correction
theorem smallExtensionCoordinateCorrection (γ δ x y ε u v : R) (hε : ε ^ 2 = 0) :
    NodeForm γ δ (x + ε * (-2 * δ * u + γ * v))
      (y + ε * (γ * u - 2 * v)) =
      NodeForm γ δ x y + ε * NodeForm.discriminant γ δ * (x * u + y * v) := by
  sorry

-- StableReductionPartII:MC.2/node-factorization-products
theorem nodeFactorizationProducts (γ δ x y s t : R) :
    NodeSectionFactorization.left γ δ x y s t *
        NodeSectionFactorization.right γ δ x y s t =
      Matrix.scalar (Fin 2) (NodeForm γ δ x y - NodeForm γ δ s t) ∧
    NodeSectionFactorization.right γ δ x y s t *
        NodeSectionFactorization.left γ δ x y s t =
      Matrix.scalar (Fin 2) (NodeForm γ δ x y - NodeForm γ δ s t) := by
  sorry

end TauCeti.ModuliCurves

/- CHECKPOINT OMISSIONS
Each name below is deliberately only a comment, not a Lean declaration.
The corresponding canonical signature/example remains required by the packet gap
Suggested Lean type interfaces. Local algebra entries have signatures above,
but their final export/packet integration remains open. The dual-section entry
has polynomial-model residue/base-change forms only, not a global sheaf theorem.
These signatures are not implementation proofs or completed geometric exports.
node: StableReductionPartII:key/moduli-curves
  Requires supplier types and the precise statement in the reader.
API: CurvesModuli.obj
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurvesModuli.iso
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurvesModuli.pullback
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurvesModuli.smoothInclusion
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurvesModuli.geometricPoints
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurvesModuli.rationalThree
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurvesModuli.rationalTwoExcluded
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurvesModuli.ellipticInvolution
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
API: CurvesModuli.rationalThreeEquivalence
  The sample is linked to its existing exported theorem node; actual pointed-moduli/stack types and the theorem signature are missing.
API: CurvesModuli.crossRatio
  The sample is linked to its existing exported theorem node; actual pointed-moduli/stack types and the theorem signature are missing.
API: CurvesModuli.stableStackProperties
  The sample is linked to its existing exported theorem node; actual pointed-moduli/stack types and the theorem signature are missing.
API: CurvesModuli.universalForgetful
  The sample is linked to its existing exported theorem node; actual pointed-moduli/stack types and the theorem signature are missing.
API: CurvesModuli.forgetStabilize
  The sample is linked to its existing exported theorem node; actual pointed-moduli/stack types and the theorem signature are missing.
test: CurvesModuli.crossRatioBoundary
  The geometric sample is specified and linked to its existing export; actual family/stack types are missing.
test: CurvesModuli.stableStackDimensions
  The geometric sample is specified and linked to its existing export; actual family/stack types are missing.
test: CurvesModuli.universalRationalFour
  The geometric sample is specified and linked to its existing export; actual family/stack types are missing.
test: CurvesModuli.forgetRationalTail
  The geometric sample is specified and linked to its existing export; actual family/stack types are missing.
test: CurvesModuli.selfNodeFlags
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.0/pullback-coherence
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.0/effective-descent
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.0/universal-curve
  Requires supplier types and the precise statement in the reader.
API: UniversalCurve.fiber
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: UniversalCurve.section
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: UniversalCurve.baseChange
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: UniversalCurve.nodeAllowed
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: UniversalCurve.collisionAllowed
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: UniversalCurve.smoothFiber
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
API: UniversalCurve.marking
  For each ordered marking i, define σ_i:M̄_{g,n}→Z̄_{g,n} by (C/S;s₁,…,sₙ)↦(C/S;s₁,…,sₙ;Δ=s_i). The projection composed with σ_i is the identity; under S×_{M̄}Z̄≅C it is exactly s_i, with coherent arbitrary base change.
  Actual stable-family/groupoid-stack and represented universal projection types are required; this mathematical contract is explicit, without a surrogate proposition.
API: UniversalCurve.projectionNodal
  The universal projection is representable proper flat finitely presented of pure relative dimension one, with geometrically connected genus-g nodal fibres; for a classifying family C/S its base change is precisely f:C→S. It is smooth at a geometric point exactly when that point of its fibre is smooth.
  Actual stable-family/groupoid-stack and represented universal projection types are required; this mathematical contract is explicit, without a surrogate proposition.
API: UniversalCurve.smoothRestriction
  Base change of Z̄_{g,n} to the full smooth-family substack M_{g,n} is the universal smooth proper n-pointed curve. This differs from taking only the relative smooth locus of Z̄ over all of M̄: a singular stable curve retains its nodal point in the universal fibre.
  Actual stable-family/groupoid-stack and represented universal projection types are required; this mathematical contract is explicit, without a surrogate proposition.
test: UniversalCurve.nodalProjection
  Let C/k be an irreducible rational curve with one ordinary node and one smooth marking over an algebraically closed field. Its arithmetic genus is one and it is pointed-stable. The base change of the universal projection to its classifying point is C→Spec k and is not smooth at the node; smoothness of the total universal stack over Z does not make this projection smooth.
  Actual stable-family/groupoid-stack and represented universal projection types are required; this mathematical contract is explicit, without a surrogate proposition.
node: StableReductionPartII:MC.1/tricanonical-cohomology
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/tricanonical-hilbert
  Requires supplier types and the precise statement in the reader.
API: TricanonicalHilbert.universal
  Requires actual projective-frame and base-line-twist types; O(1) is only ω³ up to a base line.
API: TricanonicalHilbert.frame
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: TricanonicalHilbert.action
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: TricanonicalHilbert.genusTwo
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: TricanonicalHilbert.wrongPolarization
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: TricanonicalHilbert.projectiveFrameTwist
  Requires the actual Hilbert/projective-frame functor, invertible sheaves and GL/PGL scalar-lift comparison; no surrogate proposition is introduced.
test: TricanonicalHilbert.pullback
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.1/frame-torsor
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/hilbert-quotient
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/isom-representable
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/isom-unramified
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/isom-proper
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/finite-unramified-diagonal
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/obstruction-vanishing
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/versal-node-parameters
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/smooth-dimension
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/normal-crossing-boundary
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/proper-moduli
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/pointed-node-normal-form
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/dual-section-ideal
  Polynomial local dual, flatness and coefficient-base-change signatures elaborate. The completed-local, stable-reflexivity and arbitrary-family sheaf/descent signatures remain absent.
node: StableReductionPartII:MC.2/expansion
  Requires supplier types and the precise statement in the reader.
API: PointedExpansion.scheme
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: PointedExpansion.markings
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: PointedExpansion.baseChange
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: PointedExpansion.newSmoothPoint
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: PointedExpansion.collidingPoint
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: PointedExpansion.nodalPoint
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.2/expansion-flat
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/expansion-stable
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/forget
  Requires supplier types and the precise statement in the reader.
API: ForgetMarking.map
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: ForgetMarking.extraSection
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: ForgetMarking.compose
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: ForgetMarking.rationalTail
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: ForgetMarking.rationalBridge
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: ForgetMarking.unstableTargetExcluded
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.2/expansion-contraction-inverses
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/genus-zero-base
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/higher-genus-pointed
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/rigid-triangle-embedding
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/genus-one-base
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/pointed-dm-theorem
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.2/cross-ratio
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.3/separating-clutching
  Requires supplier types and the precise statement in the reader.
API: SeparatingClutching.map
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: SeparatingClutching.genus
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: SeparatingClutching.baseChange
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: SeparatingClutching.rationalBoundary
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: SeparatingClutching.equalGenera
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: SeparatingClutching.twoEllipticTails
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.3/nonseparating-clutching
  Requires supplier types and the precise statement in the reader.
API: NonseparatingClutching.map
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: NonseparatingClutching.exchange
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: NonseparatingClutching.graph
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: NonseparatingClutching.genusOne
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: NonseparatingClutching.branchExchange
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: NonseparatingClutching.genus
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.3/clutching-finite-unramified
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.3/boundary-types
  Requires supplier types and the precise statement in the reader.
API: BoundaryType.vertexProduct
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: BoundaryType.automorphisms
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: BoundaryType.map
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: BoundaryType.zeroFour
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: BoundaryType.genusTwoUnpointed
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: BoundaryType.nonseparatingExchange
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.3/boundary-normalization
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.3/cotangent-line
  Requires supplier types and the precise statement in the reader.
API: MarkingCotangentLine.pullback
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: MarkingCotangentLine.differentials
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: MarkingCotangentLine.relabel
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: MarkingCotangentLine.zeroThree
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: MarkingCotangentLine.zeroFour
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: MarkingCotangentLine.sign
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.3/forget-cotangent-line
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.3/node-conormal
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/coarse-space
  Requires supplier types and the precise statement in the reader.
API: CurvesCoarseSpace.geometricPoints
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurvesCoarseSpace.initial
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurvesCoarseSpace.smoothOpen
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurvesCoarseSpace.zeroThree
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurvesCoarseSpace.zeroFour
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurvesCoarseSpace.ellipticInertia
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.4/pluricanonical-nef
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/finite-degree-equations
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/moduli-determinant-ample
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/projective-coarse
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/finite-projective-cover
  Requires supplier types and the precise statement in the reader.
API: StableModuliCover.map
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: StableModuliCover.family
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: StableModuliCover.pullback
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: StableModuliCover.smoothPullback
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: StableModuliCover.boundaryRamification
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: StableModuliCover.coverOfBase
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.4/full-level
  Requires supplier types and the precise statement in the reader.
API: CurveFullLevel.pairing
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveFullLevel.pullback
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveFullLevel.similitude
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurveFullLevel.component
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveFullLevel.minusOne
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveFullLevel.badCharacteristic
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.4/level-rigidity
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/fine-level-scheme
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/level-connectedness
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/hodge-bundle
  Requires supplier types and the precise statement in the reader.
API: CurveHodgeBundle.fiber
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveHodgeBundle.baseChange
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveHodgeBundle.duality
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurveHodgeBundle.genusZero
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveHodgeBundle.genusTwo
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveHodgeBundle.nonseparatingNode
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.5/hodge-determinant
  Requires supplier types and the precise statement in the reader.
API: CurveHodgeLine.definition
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveHodgeLine.baseChange
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveHodgeLine.rankZero
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurveHodgeLine.genusZero
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveHodgeLine.genusOne
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveHodgeLine.genusTwoRank
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.5/hodge-forgetting
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/separating-hodge
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/nonseparating-hodge
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/boundary-divisor
  Requires supplier types and the precise statement in the reader.
API: CurveBoundary.localEquation
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveBoundary.types
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveBoundary.familyPullback
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurveBoundary.smoothFamily
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveBoundary.constantNodalFamily
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveBoundary.twoNodes
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.5/rational-noether
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/complex-picard-torsion-free
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/irreducible-geometric-fibres
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/integral-picard-injection
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/integral-noether
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/universal-units
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.5/semi-canonical-noether
  Requires supplier types and the precise statement in the reader.
API: SemiCanonicalNoether.pullback
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: SemiCanonicalNoether.sign
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: SemiCanonicalNoether.line
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: SemiCanonicalNoether.smoothFamily
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: SemiCanonicalNoether.extraUnits
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: SemiCanonicalNoether.signAmbiguity
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.5/boundary-thickness
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.6/maximal-variation
  Requires supplier types and the precise statement in the reader.
API: CurveMaximalVariation.dimension
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveMaximalVariation.finiteCover
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveMaximalVariation.coarse
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurveMaximalVariation.constant
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveMaximalVariation.point
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveMaximalVariation.frameTorsor
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.6/stable-compactification
  Requires supplier types and the precise statement in the reader.
API: StableCurveCompactification.base
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: StableCurveCompactification.restrict
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: StableCurveCompactification.hodge
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: StableCurveCompactification.alreadyProjective
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: StableCurveCompactification.trait
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: StableCurveCompactification.constantBase
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.6/graph-closure
  Requires supplier types and the precise statement in the reader.
API: CurveGraphClosure.finiteCover
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveGraphClosure.projective
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveGraphClosure.family
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurveGraphClosure.constant
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveGraphClosure.integralComponent
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveGraphClosure.openNormalization
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.6/stable-compactification-exists
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.6/level-stable-compactification
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.6/smooth-torelli
  Requires supplier types and the precise statement in the reader.
API: CurveTorelli.map
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveTorelli.cartesian
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: CurveTorelli.hodge
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: CurveTorelli.dimension
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveTorelli.minusLevel
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: CurveTorelli.hyperelliptic
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.6/torelli-finite-fibres
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.6/jacobian-hodge-comparison
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.6/compactified-torelli
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.6/maximal-variation-hodge
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.7/level-picard-parameter
  Requires supplier types and the precise statement in the reader.
API: LevelPicardParameter.fiber
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: LevelPicardParameter.torsor
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: LevelPicardParameter.obstruction
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: LevelPicardParameter.degreeZero
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: LevelPicardParameter.sectionRigidification
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: LevelPicardParameter.scalarInertia
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
node: StableReductionPartII:MC.7/picard-triples-comparison
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/smooth-generic-direct-image-nef
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/dualizing-section-degree
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/pointed-normalization-nef
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.4/persistent-node-residue-sequence
  Requires supplier types and the precise statement in the reader.
-/

-- Coefficient-change continuation, Codex codex-a71f92; Refs #3342.
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open Polynomial
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "w₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root w₀
local notation "v₀" => AdjoinRoot.of w₀ (Polynomial.X : Polynomial A)
local notation "c₀" => u₀ - ι₀ s
local notation "d₀" => v₀ - ι₀ t
local notation "b₀" => u₀ + ι₀ s + ι₀ γ * ι₀ t
local notation "a₀" => ι₀ δ * v₀ + ι₀ δ * ι₀ t + ι₀ γ * u₀
local notation "J₀" => (Ideal.span {c₀,d₀} : Ideal R₀)

variable {A' : Type*} [CommRing A'] (f : A →+* A')
local notation "w₁" => polynomial A' (f γ) (f δ) (f s) (f t)
local notation "R₁" => Ring A' (f γ) (f δ) (f s) (f t)
local notation "ι₁" => coefficientHom A' (f γ) (f δ) (f s) (f t)
local notation "u₁" => AdjoinRoot.root w₁
local notation "v₁" => AdjoinRoot.of w₁ (Polynomial.X : Polynomial A')
local notation "c₁" => u₁ - ι₁ (f s)
local notation "d₁" => v₁ - ι₁ (f t)
local notation "b₁" => u₁ + ι₁ (f s) + ι₁ (f γ) * ι₁ (f t)
local notation "a₁" => ι₁ (f δ) * v₁ + ι₁ (f δ) * ι₁ (f t) + ι₁ (f γ) * u₁
local notation "J₁" => (Ideal.span {c₁,d₁} : Ideal R₁)
local notation "φ" => coefficientMap A γ δ s t f

lemma coefficientMapCoordinates :
    φ c₀ = c₁ ∧ φ d₀ = d₁ ∧ φ a₀ = a₁ ∧ φ b₀ = b₁ := by
  sorry

def idealCoefficientMap : J₀ →ₛₗ[φ] J₁ := by
  sorry

lemma idealCoefficientMap_coe (j : J₀) :
    (idealCoefficientMap A γ δ s t f j : R₁) = φ (j : R₀) := by
  sorry

lemma idealCoefficientMap_first :
    idealCoefficientMap A γ δ s t f ⟨c₀,sectionFirst_mem A γ δ s t⟩ =
      ⟨c₁,sectionFirst_mem A' (f γ) (f δ) (f s) (f t)⟩ := by
  sorry

lemma idealCoefficientMap_second :
    idealCoefficientMap A γ δ s t f ⟨d₀,sectionSecond_mem A γ δ s t⟩ =
      ⟨d₁,sectionSecond_mem A' (f γ) (f δ) (f s) (f t)⟩ := by
  sorry

lemma sectionProjection_coefficient_naturality (r : R₀) :
    idealCoefficientMap A γ δ s t f (sectionProjection A γ δ s t r) =
      sectionProjection A' (f γ) (f δ) (f s) (f t) (φ r) := by
  sorry

lemma dualGenerator_coefficient_naturality (j : J₀) :
    φ (dualGenerator A γ δ s t j) =
      dualGenerator A' (f γ) (f δ) (f s) (f t) (idealCoefficientMap A γ δ s t f j) := by
  sorry

lemma dualCorrectionMap_coefficient_naturality (r : R₀) :
    φ (dualCorrectionMap A γ δ s t r) =
      dualCorrectionMap A' (f γ) (f δ) (f s) (f t) (φ r) := by
  sorry

lemma idealCoefficientMap_identity (j : J₀) :
    idealCoefficientMap A γ δ s t (RingHom.id A) j = j := by
  sorry

lemma idealCoefficientMap_comp {A'' : Type*} [CommRing A''] (g : A' →+* A'') (j : J₀) :
    idealCoefficientMap A' (f γ) (f δ) (f s) (f t) g (idealCoefficientMap A γ δ s t f j) =
      idealCoefficientMap A γ δ s t (g.comp f) j := by
  sorry

lemma idealCoefficientMap_smul (r : R₀) (j : J₀) :
    idealCoefficientMap A γ δ s t f (r • j) = φ r • idealCoefficientMap A γ δ s t f j := by
  sorry

-- NodeSectionFactorization.PolynomialModel.idealCoefficientMap.identity
example (j : J₀) : idealCoefficientMap A γ δ s t (RingHom.id A) j = j := by
  sorry

-- NodeSectionFactorization.PolynomialModel.idealCoefficientMap.generators
example :
    idealCoefficientMap A γ δ s t f ⟨c₀,sectionFirst_mem A γ δ s t⟩ =
      ⟨c₁,sectionFirst_mem A' (f γ) (f δ) (f s) (f t)⟩ ∧
    idealCoefficientMap A γ δ s t f ⟨d₀,sectionSecond_mem A γ δ s t⟩ =
      ⟨d₁,sectionSecond_mem A' (f γ) (f δ) (f s) (f t)⟩ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.idealCoefficientMap.nonflat
set_option maxHeartbeats 1000000 in
example :
    let f := Int.castRingHom (ZMod 2)
    let j : Ideal.span {AdjoinRoot.root (polynomial ℤ 1 0 0 0) -
      coefficientHom ℤ 1 0 0 0 0,
      AdjoinRoot.of (polynomial ℤ 1 0 0 0) Polynomial.X -
      coefficientHom ℤ 1 0 0 0 0} :=
      (2 : Ring ℤ 1 0 0 0) •
        ⟨AdjoinRoot.of (polynomial ℤ 1 0 0 0) Polynomial.X -
          coefficientHom ℤ 1 0 0 0 0,sectionSecond_mem ℤ 1 0 0 0⟩
    j ≠ 0 ∧ idealCoefficientMap ℤ 1 0 0 0 f j = 0 := by
  sorry

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.coefficientIdentity
example (r : R₀) :
    coefficientMap A γ δ s t (RingHom.id A) (dualCorrectionMap A γ δ s t r) =
      dualCorrectionMap A γ δ s t r := by
  sorry

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.coefficientProjection
example (j : J₀) :
    φ (dualCorrectionMap A γ δ s t (j : R₀)) =
      dualGenerator A' (f γ) (f δ) (f s) (f t) (idealCoefficientMap A γ δ s t f j) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.nonflatCharacteristicTwo
example :
    let u := AdjoinRoot.root (polynomial ℤ 1 0 0 0)
    coefficientMap ℤ 1 0 0 0 (Int.castRingHom (ZMod 2))
      (dualCorrectionMap ℤ 1 0 0 0 u) =
        AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0) := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel


namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open Polynomial
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "F₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "u₀" => AdjoinRoot.root F₀

def polynomialCoordinates : R₀ ≃ₗ[Polynomial A] Polynomial A × Polynomial A := sorry

lemma polynomialCoordinates_symm (p q : Polynomial A) :
    (polynomialCoordinates A γ δ s t).symm (p,q) =
      AdjoinRoot.of F₀ p + u₀ * AdjoinRoot.of F₀ q := sorry

lemma polynomialCoordinates_reconstruction (r : R₀) :
    AdjoinRoot.of F₀ (polynomialCoordinates A γ δ s t r).1 +
      u₀ * AdjoinRoot.of F₀ (polynomialCoordinates A γ δ s t r).2 = r := sorry

lemma polynomialCoordinates_unique (r : R₀) :
    ∃! z : Polynomial A × Polynomial A,
      AdjoinRoot.of F₀ z.1 + u₀ * AdjoinRoot.of F₀ z.2 = r := sorry

lemma polynomialCoordinates_of (p : Polynomial A) :
    polynomialCoordinates A γ δ s t (AdjoinRoot.of F₀ p) = (p,0) := sorry

lemma polynomialCoordinates_root :
    polynomialCoordinates A γ δ s t u₀ = (0,1) := sorry

def polynomialBasis : Module.Basis (Fin 2) (Polynomial A) R₀ := sorry

lemma polynomialBasis_apply (i : Fin 2) :
    polynomialBasis A γ δ s t i = u₀ ^ (i : ℕ) := sorry

def polynomialMonomialBasis : Module.Basis (ℕ × Fin 2) A R₀ := sorry

lemma polynomialMonomialBasis_apply (n : ℕ) (i : Fin 2) :
    polynomialMonomialBasis A γ δ s t (n,i) =
      (AdjoinRoot.of F₀ (Polynomial.X : Polynomial A)) ^ n * u₀ ^ (i : ℕ) := sorry

lemma polynomialBasis_zero : polynomialBasis A γ δ s t 0 = 1 := sorry

lemma polynomialBasis_one : polynomialBasis A γ δ s t 1 = u₀ := sorry

lemma polynomialMonomialBasis_tower : polynomialMonomialBasis A γ δ s t =
    (Polynomial.basisMonomials A).smulTower (polynomialBasis A γ δ s t) := sorry

lemma polynomialMonomialBasis_repr (r : R₀) (n : ℕ) (i : Fin 2) :
    (polynomialMonomialBasis A γ δ s t).repr r (n,i) =
      (Polynomial.basisMonomials A).repr ((polynomialBasis A γ δ s t).repr r i) n := sorry

-- test: NodeSectionFactorization.PolynomialModel.coordinatesZeroRing
example (r : Ring (ZMod 1) 0 0 0 0) :
    polynomialCoordinates (ZMod 1) 0 0 0 0 r = (0,0) := sorry

-- test: NodeSectionFactorization.PolynomialModel.coordinatesCharacteristicTwoRoot
example : polynomialCoordinates (ZMod 2) 1 0 0 0
    (AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0)) = (0,1) := sorry

-- test: NodeSectionFactorization.PolynomialModel.coordinatesNonreducedPolynomial
example : polynomialCoordinates (ZMod 4) 0 0 0 0
    (AdjoinRoot.of (polynomial (ZMod 4) 0 0 0 0) (C 2 * X ^ 9)) = (C 2 * X ^ 9,0) := sorry

-- test: NodeSectionFactorization.PolynomialModel.basisConstant
example : polynomialBasis A γ δ s t 0 = 1 := sorry

-- test: NodeSectionFactorization.PolynomialModel.basisRoot
example : polynomialBasis A γ δ s t 1 = u₀ := sorry

-- test: NodeSectionFactorization.PolynomialModel.basisZeroRing
example : polynomialBasis (ZMod 1) 0 0 0 0 1 = 0 := sorry

-- test: NodeSectionFactorization.PolynomialModel.monomialBasisUntruncated
example : polynomialMonomialBasis (ZMod 2) 1 0 0 0 (37,0) =
    AdjoinRoot.of (polynomial (ZMod 2) 1 0 0 0) (X : Polynomial (ZMod 2)) ^ 37 := sorry

-- test: NodeSectionFactorization.PolynomialModel.monomialBasisNonreduced
example : polynomialMonomialBasis (ZMod 4) 0 0 0 0 (3,1) =
    AdjoinRoot.of (polynomial (ZMod 4) 0 0 0 0) (X : Polynomial (ZMod 4)) ^ 3 *
      AdjoinRoot.root (polynomial (ZMod 4) 0 0 0 0) := sorry

-- test: NodeSectionFactorization.PolynomialModel.monomialBasisZeroRing
example : polynomialMonomialBasis (ZMod 1) 0 0 0 0 (37,1) = 0 := sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel


namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open Polynomial
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "F₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root F₀
local notation "v₀" => AdjoinRoot.of F₀ (Polynomial.X : Polynomial A)
local notation "c₀" => u₀ - ι₀ s
local notation "d₀" => v₀ - ι₀ t
local notation "b₀" => u₀ + ι₀ s + ι₀ γ * ι₀ t
local notation "J₀" => (Ideal.span {c₀,d₀} : Ideal R₀)
local notation "D₀" => J₀ →ₗ[R₀] R₀
local notation "E₀" => polynomialCoordinates A γ δ s t

lemma polynomialCoordinates_coefficient_mul (p : Polynomial A) (r : R₀) :
    E₀ (AdjoinRoot.of F₀ p * r) = (p * (E₀ r).1, p * (E₀ r).2) := by
  sorry

lemma polynomialCoordinates_second_mul (r : R₀) :
    E₀ (d₀ * r) =
      ((X - C t) * (E₀ r).1, (X - C t) * (E₀ r).2) := by
  sorry

lemma polynomialCoordinates_root_mul (r : R₀) :
    E₀ (u₀ * r) =
      ((C (NodeForm γ δ s t) - C δ * X ^ 2) * (E₀ r).2,
       (E₀ r).1 - (C γ * X) * (E₀ r).2) := by
  sorry

lemma polynomialCoordinates_first_mul (r : R₀) :
    (E₀ (c₀ * r)).2 =
      (E₀ r).1 - (C s + C γ * X) * (E₀ r).2 := by
  sorry

lemma dualValue_commutes (h : D₀) (j k : J₀) :
    (j : R₀) * h k = (k : R₀) * h j := by
  sorry

lemma dualValue_at_second (h : D₀) :
    let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
    ((E₀ (h jd)).1).eval t =
      (s + γ * t) * ((E₀ (h jd)).2).eval t := by
  sorry

lemma polynomialCoordinates_dualNumerator : E₀ b₀ = (C (s + γ * t), 1) := by
  sorry

lemma dualValue_decomposition (h : D₀) :
    let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
    ∃ z : R₀ × A, h jd = d₀ * z.1 + ι₀ z.2 * b₀ := by
  sorry

lemma dualNormalForm_exists (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (h : D₀) :
    ∃ z : R₀ × A, ∀ j : J₀,
      h j = z.1 * (j : R₀) + ι₀ z.2 * ε j := by
  sorry

lemma dualValue_coordinates_unique (z z' : R₀ × A)
    (hz : d₀ * z.1 + ι₀ z.2 * b₀ = d₀ * z'.1 + ι₀ z'.2 * b₀) : z = z' := by
  sorry

lemma dualGenerator_action (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (z : R₀) (j : J₀) :
    (z - ι₀ (sectionEval A γ δ s t z)) * ε j = K z * (j : R₀) := by
  sorry

lemma dualMultiplicationInjective : Function.Injective (dualMultiplication A γ δ s t) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.normalInclusionCanonical
example : ∃ e : D₀ ≃ₗ[A] (R₀ × A),
    e (dualMultiplication A γ δ s t 1) = (1,0) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.normalGeneratorNonreduced
example : ∃ e : (sectionIdeal (ZMod 4) 0 0 0 0 →ₗ[Ring (ZMod 4) 0 0 0 0]
    Ring (ZMod 4) 0 0 0 0) ≃ₗ[ZMod 4] (Ring (ZMod 4) 0 0 0 0 × ZMod 4),
    e (dualGenerator (ZMod 4) 0 0 0 0) = (0,1) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.normalRoundTripCanonical
example : ∃ e : D₀ ≃ₗ[A] (R₀ × A),
    (∀ p, e (e.symm p) = p) ∧
    (∀ p j, e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * dualGenerator A γ δ s t j) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.residueGeneratorCanonical
example : ∃ ρ : D₀ →ₗ[A] A,
    Function.Surjective ρ ∧ ρ (dualGenerator A γ δ s t) = 1 := by
  sorry

-- NodeSectionFactorization.PolynomialModel.residueMultiplicationCanonical
example : ∃ ρ : D₀ →ₗ[A] A,
    Function.Surjective ρ ∧ ∀ r, ρ (dualMultiplication A γ δ s t r) = 0 := by
  sorry

-- NodeSectionFactorization.PolynomialModel.multiplicationZero
example : dualMultiplication A γ δ s t 0 = 0 := map_zero _
example (j : J₀) : dualMultiplication A γ δ s t 1 j = (j : R₀) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.multiplicationOne
example (j : J₀) : dualMultiplication A γ δ s t 1 j = (j : R₀) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.multiplicationFaithful
example (r : R₀) : dualMultiplication A γ δ s t r = 0 ↔ r = 0 := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

-- Coefficient projectivity, freeness and tensor retraction continuation.

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open scoped TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "R₀" => Ring A γ δ s t
local notation "J₀" => (Ideal.span {AdjoinRoot.root (polynomial A γ δ s t) - coefficientHom A γ δ s t s,
  AdjoinRoot.of (polynomial A γ δ s t) (Polynomial.X : Polynomial A) - coefficientHom A γ δ s t t} : Ideal R₀)
local notation "D₀" => J₀ →ₗ[R₀] R₀

lemma sectionIdeal_coefficient_projective : Module.Projective A J₀ := by
  sorry

lemma sectionDual_coefficient_free : Module.Free A D₀ := by
  sorry

lemma sectionProjection_lTensor_retraction (M : Type*) [AddCommGroup M] [Module A M] :
    ((sectionProjection A γ δ s t).lTensor M).comp
      ((((J₀).subtype).restrictScalars A).lTensor M) = LinearMap.id := by
  sorry

lemma sectionIdeal_lTensor_injective (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective ((((J₀).subtype).restrictScalars A).lTensor M) := by
  sorry

-- Coefficient projectivity is available over the nonreduced ring Z/4.
-- NodeSectionFactorization.PolynomialModel.coefficientProjectiveNonreduced
example : Module.Projective (ZMod 4)
    (Ideal.span {AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0) - coefficientHom (ZMod 4) 0 0 1 0 1,
      AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (Polynomial.X : Polynomial (ZMod 4)) -
        coefficientHom (ZMod 4) 0 0 1 0 0} : Ideal (Ring (ZMod 4) 0 0 1 0)) := by
  sorry

-- No nontriviality assumption is hidden in the coefficient-flatness proof.
-- NodeSectionFactorization.PolynomialModel.coefficientIdealFlatZero
example : Module.Flat (ZMod 1)
    (Ideal.span {AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0) - coefficientHom (ZMod 1) 0 0 0 0 0,
      AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (Polynomial.X : Polynomial (ZMod 1)) -
        coefficientHom (ZMod 1) 0 0 0 0 0} : Ideal (Ring (ZMod 1) 0 0 0 0)) := by
  sorry

-- The actual dual is free over coefficients, including nonreduced coefficients.
-- NodeSectionFactorization.PolynomialModel.coefficientDualFreeNonreduced
example : Module.Free (ZMod 4)
    ((Ideal.span {AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0) - coefficientHom (ZMod 4) 0 0 1 0 1,
      AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (Polynomial.X : Polynomial (ZMod 4)) -
        coefficientHom (ZMod 4) 0 0 1 0 0} : Ideal (Ring (ZMod 4) 0 0 1 0)) →ₗ[Ring (ZMod 4) 0 0 1 0]
        Ring (ZMod 4) 0 0 1 0) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.coefficientDualFlatZero
example : Module.Flat (ZMod 1)
    ((Ideal.span {AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0) - coefficientHom (ZMod 1) 0 0 0 0 0,
      AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (Polynomial.X : Polynomial (ZMod 1)) -
        coefficientHom (ZMod 1) 0 0 0 0 0} : Ideal (Ring (ZMod 1) 0 0 0 0)) →ₗ[Ring (ZMod 1) 0 0 0 0]
        Ring (ZMod 1) 0 0 0 0) := by
  sorry

-- Tensoring the inclusion with the torsion Z-module Z/2 stays injective.
-- NodeSectionFactorization.PolynomialModel.tensorInclusionTorsion
example : Function.Injective
    ((((Ideal.span {AdjoinRoot.root (polynomial ℤ 0 0 0 0) - coefficientHom ℤ 0 0 0 0 0,
      AdjoinRoot.of (polynomial ℤ 0 0 0 0) (Polynomial.X : Polynomial ℤ) - coefficientHom ℤ 0 0 0 0 0} :
        Ideal (Ring ℤ 0 0 0 0)).subtype).restrictScalars ℤ).lTensor (ZMod 2)) := by
  sorry

-- Retraction holds pointwise on every tensor, without assuming M is flat.
-- NodeSectionFactorization.PolynomialModel.tensorRetractionPointwise
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] J₀) :
    ((sectionProjection A γ δ s t).lTensor M)
      ((((J₀).subtype).restrictScalars A).lTensor M z) = z := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

/- Native matrix-presentation interfaces; admitted under PROTOCOL §13. -/
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open Polynomial
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "F₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root F₀
local notation "v₀" => AdjoinRoot.of F₀ (Polynomial.X : Polynomial A)
local notation "c₀" => u₀ - ι₀ s
local notation "d₀" => v₀ - ι₀ t
local notation "b₀" => u₀ + ι₀ s + ι₀ γ * ι₀ t
local notation "a₀" => ι₀ δ * v₀ + ι₀ δ * ι₀ t + ι₀ γ * u₀
local notation "J₀" => (Ideal.span {c₀,d₀} : Ideal R₀)
local notation "D₀" => J₀ →ₗ[R₀] R₀
local notation "E₀" => polynomialCoordinates A γ δ s t
local notation "Φ₀" => left (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "Ψ₀" => right (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)

lemma sectionIdealSyzygy (x y : R₀) (h : c₀ * x = d₀ * y) :
    ∃ r : R₀, ∃ α : A,
      x = d₀ * r + ι₀ α * b₀ ∧ y = c₀ * r - ι₀ α * a₀ := by
  sorry

lemma polynomialCoordinates_first : E₀ c₀ = (-C s,1) := by
  sorry

lemma polynomialCoordinates_numerator_mul (r : R₀) :
    (E₀ (b₀ * r)).2 = (E₀ r).1 + (C (s+γ*t) - C γ * X) * (E₀ r).2 := by
  sorry

lemma sectionDualSyzygy (x y : R₀) (h : d₀ * x = b₀ * y) :
    ∃ r : R₀, ∃ α : A,
      x = b₀ * r - ι₀ α * a₀ ∧ y = d₀ * r + ι₀ α * c₀ := by
  sorry

def idealPresentation : (Fin 2 → R₀) →ₗ[R₀] J₀ := by
  sorry

lemma idealPresentation_apply (z : Fin 2 → R₀) :
    (idealPresentation A γ δ s t z : R₀) = c₀*z 0-d₀*z 1 := by
  sorry

lemma idealPresentation_surjective : Function.Surjective (idealPresentation A γ δ s t) := by
  sorry

lemma right_mulVec (z : Fin 2 → R₀) :
    (Ψ₀).mulVecLin z = ![d₀*z 0-b₀*z 1,c₀*z 0+a₀*z 1] := by
  sorry

lemma left_mulVec (z : Fin 2 → R₀) :
    (Φ₀).mulVecLin z = ![a₀*z 0+b₀*z 1,-c₀*z 0+d₀*z 1] := by
  sorry

lemma idealPresentation_kernel :
    LinearMap.ker (idealPresentation A γ δ s t) = LinearMap.range (Ψ₀).mulVecLin := by
  sorry

def dualPresentation : (Fin 2 → R₀) →ₗ[R₀] D₀ := by
  sorry

lemma dualPresentation_apply (z : Fin 2 → R₀) (j : J₀) :
    dualPresentation A γ δ s t z j = z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j := by
  sorry

lemma dualPresentation_surjective : Function.Surjective (dualPresentation A γ δ s t) := by
  sorry

lemma dualPresentation_zero_iff (z : Fin 2 → R₀) :
    dualPresentation A γ δ s t z = 0 ↔ d₀*z 0=b₀*z 1 := by
  sorry

lemma dualPresentation_kernel :
    LinearMap.ker (dualPresentation A γ δ s t) = LinearMap.range (Φ₀).mulVecLin := by
  sorry

lemma quotientLeftExact : LinearMap.ker (Φ₀).mulVecLin = LinearMap.range (Ψ₀).mulVecLin := by
  sorry

lemma quotientRightExact : LinearMap.ker (Ψ₀).mulVecLin = LinearMap.range (Φ₀).mulVecLin := by
  sorry

lemma transposeLeft_mulVec (z : Fin 2 → R₀) :
    ((Φ₀).transpose).mulVecLin z = ![a₀*z 0-c₀*z 1,b₀*z 0+d₀*z 1] := by
  sorry

lemma transposeRight_mulVec (z : Fin 2 → R₀) :
    ((Ψ₀).transpose).mulVecLin z = ![d₀*z 0+c₀*z 1,-b₀*z 0+a₀*z 1] := by
  sorry

lemma quotientTransposeLeftExact :
    LinearMap.ker ((Φ₀).transpose).mulVecLin = LinearMap.range ((Ψ₀).transpose).mulVecLin := by
  sorry

lemma quotientTransposeRightExact :
    LinearMap.ker ((Ψ₀).transpose).mulVecLin = LinearMap.range ((Φ₀).transpose).mulVecLin := by
  sorry

-- NodeSectionFactorization.PolynomialModel.idealPresentationFirst
example : (idealPresentation A γ δ s t ![1,0] : R₀)=c₀ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.idealPresentationSecond
example : (idealPresentation A γ δ s t ![0,1] : R₀)=-d₀ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.idealPresentationZero
example : idealPresentation A γ δ s t 0=0 := by
  sorry

-- NodeSectionFactorization.PolynomialModel.dualPresentationFirst
example (j : J₀) : dualPresentation A γ δ s t ![1,0] j=(j : R₀) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.dualPresentationSecond
example : dualPresentation A γ δ s t ![0,1] = -dualGenerator A γ δ s t := by
  sorry

-- NodeSectionFactorization.PolynomialModel.dualPresentationZero
example : dualPresentation A γ δ s t 0=0 := by
  sorry

-- NodeSectionFactorization.PolynomialModel.actualIdealCokernelNonreduced
example :
    let B := Ring (ZMod 4) 0 0 1 0
    let ι := coefficientHom (ZMod 4) 0 0 1 0
    let u := AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)
    let v := AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (X : Polynomial (ZMod 4))
    let β := right (ι 0) (ι 0) u v (ι 1) (ι 0)
    ∃ e : ((Fin 2 → B) ⧸ LinearMap.range β.mulVecLin) ≃ₗ[B] Ideal.span {u-ι 1,v-ι 0},
      (e (Submodule.Quotient.mk (fun i => if i=0 then 1 else 0)) : B)=u-ι 1 ∧
      (e (Submodule.Quotient.mk (fun i => if i=0 then 0 else 1)) : B)=-(v-ι 0) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.actualDualCokernelSignThree
example :
    let B := Ring (ZMod 3) 1 0 0 0
    let ι := coefficientHom (ZMod 3) 1 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 3) 1 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 3) 1 0 0 0) (X : Polynomial (ZMod 3))
    let α := left (ι 1) (ι 0) u v (ι 0) (ι 0)
    ∃ e : ((Fin 2 → B) ⧸ LinearMap.range α.mulVecLin) ≃ₗ[B] (Ideal.span {u-ι 0,v-ι 0} →ₗ[B] B),
      e (Submodule.Quotient.mk (fun i => if i=0 then 0 else 1)) =
        -dualGenerator (ZMod 3) 1 0 0 0 := by
  sorry

-- NodeSectionFactorization.PolynomialModel.actualIdealCokernelZeroBase
example :
    let B := Ring (ZMod 1) 0 0 0 0
    let ι := coefficientHom (ZMod 1) 0 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (X : Polynomial (ZMod 1))
    let β := right (ι 0) (ι 0) u v (ι 0) (ι 0)
    Nonempty (((Fin 2 → B) ⧸ LinearMap.range β.mulVecLin) ≃ₗ[B] Ideal.span {u-ι 0,v-ι 0}) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.actualDualCokernelCharacteristicTwo
example :
    let B := Ring (ZMod 2) 1 0 0 0
    let ι := coefficientHom (ZMod 2) 1 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 2) 1 0 0 0) (X : Polynomial (ZMod 2))
    let α := left (ι 1) (ι 0) u v (ι 0) (ι 0)
    Nonempty (((Fin 2 → B) ⧸ LinearMap.range α.mulVecLin) ≃ₗ[B]
      (Ideal.span {u-ι 0,v-ι 0} →ₗ[B] B)) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.actualComplexNonreduced
example :
    let ι := coefficientHom (ZMod 4) 0 0 1 0
    let u := AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)
    let v := AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (X : Polynomial (ZMod 4))
    let α := left (ι 0) (ι 0) u v (ι 1) (ι 0)
    let β := right (ι 0) (ι 0) u v (ι 1) (ι 0)
    LinearMap.ker α.mulVecLin=LinearMap.range β.mulVecLin ∧
      LinearMap.ker β.transpose.mulVecLin=LinearMap.range α.transpose.mulVecLin := by
  sorry

-- NodeSectionFactorization.PolynomialModel.actualComplexZeroBase
example :
    let ι := coefficientHom (ZMod 1) 0 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (X : Polynomial (ZMod 1))
    let α := left (ι 0) (ι 0) u v (ι 0) (ι 0)
    let β := right (ι 0) (ι 0) u v (ι 0) (ι 0)
    LinearMap.ker β.mulVecLin=LinearMap.range α.mulVecLin := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel


/- Coefficient-universal matrix exactness; authored continuation of Knudsen §3. -/
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "F₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root F₀
local notation "v₀" => AdjoinRoot.of F₀ (Polynomial.X : Polynomial A)
local notation "J₀" => (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀)
local notation "D₀" => J₀ →ₗ[R₀] R₀
local notation "Φ₀" => left (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "Ψ₀" => right (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "ΦA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Φ₀)))
local notation "ΨA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Ψ₀)))

lemma leftImage_lTensor_injective (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective ((LinearMap.range ΦA).subtype.lTensor M) := by
  sorry
lemma rightImage_lTensor_injective (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective ((LinearMap.range ΨA).subtype.lTensor M) := by
  sorry
lemma quotientLeft_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨA).lTensor M) ((ΦA).lTensor M) := by
  sorry
lemma quotientRight_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦA).lTensor M) ((ΨA).lTensor M) := by
  sorry
open TensorProduct

def sectionRotation : (Fin 2 → R₀) ≃ₗ[R₀] (Fin 2 → R₀) := by
  sorry
lemma sectionRotation_apply (z : Fin 2 → R₀) :
    sectionRotation A γ δ s t z = ![-z 1,z 0] := by
  sorry
lemma sectionRotation_symm_apply (z : Fin 2 → R₀) :
    (sectionRotation A γ δ s t).symm z = ![z 1,-z 0] := by
  sorry
lemma sectionRotation_square (z : Fin 2 → R₀) :
    sectionRotation A γ δ s t (sectionRotation A γ δ s t z) = -z := by
  sorry
lemma transposeLeft_rotation :
    ((Φ₀).transpose).mulVecLin.comp (sectionRotation A γ δ s t).toLinearMap =
      (sectionRotation A γ δ s t).toLinearMap.comp (Ψ₀).mulVecLin := by
  sorry
lemma transposeRight_rotation :
    ((Ψ₀).transpose).mulVecLin.comp (sectionRotation A γ δ s t).toLinearMap =
      (sectionRotation A γ δ s t).toLinearMap.comp (Φ₀).mulVecLin := by
  sorry
local notation "ΦTA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Matrix.transpose (Φ₀))))
local notation "ΨTA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Matrix.transpose (Ψ₀))))
local notation "pA" => (LinearEquiv.restrictScalars A (sectionRotation A γ δ s t))

lemma transposeLeft_lTensor_rotation (M : Type*) [AddCommGroup M] [Module A M] :
    ((ΦTA).lTensor M).comp ((pA).lTensor M).toLinearMap =
      ((pA).lTensor M).toLinearMap.comp ((ΨA).lTensor M) := by
  sorry
lemma transposeRight_lTensor_rotation (M : Type*) [AddCommGroup M] [Module A M] :
    ((ΨTA).lTensor M).comp ((pA).lTensor M).toLinearMap =
      ((pA).lTensor M).toLinearMap.comp ((ΦA).lTensor M) := by
  sorry
lemma quotientTransposeLeft_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨTA).lTensor M) ((ΦTA).lTensor M) := by
  sorry
lemma quotientTransposeRight_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦTA).lTensor M) ((ΨTA).lTensor M) := by
  sorry
local notation "PJA" => (LinearMap.restrictScalars A (idealPresentation A γ δ s t))
local notation "PDA" => (LinearMap.restrictScalars A (dualPresentation A γ δ s t))

lemma idealPresentation_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨA).lTensor M) ((PJA).lTensor M) := by
  sorry
lemma dualPresentation_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦA).lTensor M) ((PDA).lTensor M) := by
  sorry
def tensorCokernelIdeal (M : Type*) [AddCommGroup M] [Module A M] :
    ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΨA).lTensor M)) ≃ₗ[A] (M ⊗[A] J₀) := by
  sorry
lemma tensorCokernelIdeal_mk (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk z) = (PJA).lTensor M z := by
  sorry
lemma tensorCokernelIdeal_tmul (M : Type*) [AddCommGroup M] [Module A M]
    (m : M) (z : Fin 2 → R₀) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) =
      m ⊗ₜ[A] idealPresentation A γ δ s t z := by
  sorry
lemma tensorCokernelIdeal_inverse (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelIdeal A γ δ s t M).symm ((PJA).lTensor M z) = Submodule.Quotient.mk z := by
  sorry
lemma tensorCokernelIdeal_unique (M : Type*) [AddCommGroup M] [Module A M]
    (e : ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΨA).lTensor M)) ≃ₗ[A] (M ⊗[A] J₀))
    (he : ∀ z, e (Submodule.Quotient.mk z) = (PJA).lTensor M z) :
    e = tensorCokernelIdeal A γ δ s t M := by
  sorry
def tensorCokernelDual (M : Type*) [AddCommGroup M] [Module A M] :
    ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΦA).lTensor M)) ≃ₗ[A] (M ⊗[A] D₀) := by
  sorry
lemma tensorCokernelDual_mk (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk z) = (PDA).lTensor M z := by
  sorry
lemma tensorCokernelDual_tmul (M : Type*) [AddCommGroup M] [Module A M]
    (m : M) (z : Fin 2 → R₀) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) =
      m ⊗ₜ[A] dualPresentation A γ δ s t z := by
  sorry
lemma tensorCokernelDual_inverse (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelDual A γ δ s t M).symm ((PDA).lTensor M z) = Submodule.Quotient.mk z := by
  sorry
lemma tensorCokernelDual_unique (M : Type*) [AddCommGroup M] [Module A M]
    (e : ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΦA).lTensor M)) ≃ₗ[A] (M ⊗[A] D₀))
    (he : ∀ z, e (Submodule.Quotient.mk z) = (PDA).lTensor M z) :
    e = tensorCokernelDual A γ δ s t M := by
  sorry
-- NodeSectionFactorization.PolynomialModel.rotationFirstBasis
example  : sectionRotation A γ δ s t ![1,0] = ![0,1] := by
  sorry
-- NodeSectionFactorization.PolynomialModel.rotationNonreducedSquare
example (z : Fin 2 → Ring (ZMod 4) 1 0 1 0) :
    sectionRotation (ZMod 4) 1 0 1 0 (sectionRotation (ZMod 4) 1 0 1 0 z) = -z := by
  sorry
-- NodeSectionFactorization.PolynomialModel.rotationZeroRing
example (z : Fin 2 → Ring (ZMod 1) 0 0 0 0) :
    (sectionRotation (ZMod 1) 0 0 0 0).symm (sectionRotation (ZMod 1) 0 0 0 0 z) = z := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorIdealZero
example (M : Type*) [AddCommGroup M] [Module A M] :
    tensorCokernelIdeal A γ δ s t M 0 = 0 := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorIdealPureTensor
example (M : Type*) [AddCommGroup M] [Module A M] (m : M) (z : Fin 2 → R₀) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) = m ⊗ₜ[A] idealPresentation A γ δ s t z := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorIdealRepresentativeRoundTrip
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelIdeal A γ δ s t M).symm ((idealPresentation A γ δ s t).restrictScalars A |>.lTensor M <| z) = Submodule.Quotient.mk z := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorDualZero
example (M : Type*) [AddCommGroup M] [Module A M] :
    tensorCokernelDual A γ δ s t M 0 = 0 := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorDualPureTensor
example (M : Type*) [AddCommGroup M] [Module A M] (m : M) (z : Fin 2 → R₀) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) = m ⊗ₜ[A] dualPresentation A γ δ s t z := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorDualRepresentativeRoundTrip
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelDual A γ δ s t M).symm ((dualPresentation A γ δ s t).restrictScalars A |>.lTensor M <| z) = Submodule.Quotient.mk z := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorIdealTorsionNegativeGenerator
example  :
    let j : sectionIdeal ℤ 1 0 1 0 :=
      ⟨AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X - coefficientHom ℤ 1 0 1 0 0,
        sectionSecond_mem ℤ 1 0 1 0⟩
    let z := tensorCokernelIdeal ℤ 1 0 1 0 (ZMod 3)
      (Submodule.Quotient.mk ((1 : ZMod 3) ⊗ₜ[ℤ] ![0,1]))
    z = (1 : ZMod 3) ⊗ₜ[ℤ] (-j) ∧ z ≠ (1 : ZMod 3) ⊗ₜ[ℤ] j := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorDualTorsionNegativeGenerator
example  :
    let z := tensorCokernelDual ℤ 1 0 1 0 (ZMod 3)
      (Submodule.Quotient.mk ((1 : ZMod 3) ⊗ₜ[ℤ] ![0,1]))
    z = (1 : ZMod 3) ⊗ₜ[ℤ] (-dualGenerator ℤ 1 0 1 0) ∧
      z ≠ (1 : ZMod 3) ⊗ₜ[ℤ] dualGenerator ℤ 1 0 1 0 := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorTorsionLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2)) := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorTorsionRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2)) := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorTorsionTransposeLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2)) := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorTorsionTransposeRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2)) := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorZeroRingLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (right ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1))
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (left ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1)) := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorZeroRingRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (left ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1))
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (right ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1)) := by
  sorry
end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

/- Actual polynomial section biduality; authored continuation of Knudsen §3. -/
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open Polynomial
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "F₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root F₀
local notation "v₀" => AdjoinRoot.of F₀ (Polynomial.X : Polynomial A)
local notation "c₀" => u₀ - ι₀ s
local notation "d₀" => v₀ - ι₀ t
local notation "b₀" => u₀ + ι₀ s + ι₀ γ * ι₀ t
local notation "a₀" => ι₀ δ * v₀ + ι₀ δ * ι₀ t + ι₀ γ * u₀
local notation "J₀" => (Ideal.span {c₀,d₀} : Ideal R₀)
local notation "D₀" => Module.Dual R₀ J₀
local notation "ε₀" => dualGenerator A γ δ s t
local notation "one₀" => dualMultiplication A γ δ s t 1

lemma dualGenerator_module_relation : d₀ • ε₀ = b₀ • one₀ := by
  sorry

lemma sectionBidual_relation (F : Module.Dual R₀ D₀) :
    d₀ * F ε₀ = b₀ * F one₀ := by
  sorry

lemma sectionBidual_value_mem (F : Module.Dual R₀ D₀) : F one₀ ∈ J₀ := by
  sorry

def sectionBidualInverse : Module.Dual R₀ D₀ →ₗ[R₀] J₀ := by
  sorry

lemma sectionBidualInverse_value (F : Module.Dual R₀ D₀) :
    (sectionBidualInverse A γ δ s t F : R₀) = F one₀ := by
  sorry

lemma sectionBidualInverse_eval (j : J₀) :
    sectionBidualInverse A γ δ s t (Module.Dual.eval R₀ J₀ j) = j := by
  sorry

lemma sectionBidual_eval_inverse (F : Module.Dual R₀ D₀) :
    Module.Dual.eval R₀ J₀ (sectionBidualInverse A γ δ s t F) = F := by
  sorry

theorem sectionIdealReflexive : Module.IsReflexive R₀ J₀ := by
  sorry

def sectionBidualEquiv : J₀ ≃ₗ[R₀] Module.Dual R₀ D₀ := by
  sorry

lemma sectionBidualEquiv_apply (j : J₀) (h : D₀) :
    sectionBidualEquiv A γ δ s t j h = h j := by
  sorry

lemma sectionBidualEquiv_inverse (F : Module.Dual R₀ D₀) :
    (sectionBidualEquiv A γ δ s t).symm F = sectionBidualInverse A γ δ s t F := by
  sorry

lemma sectionBidualEquiv_native :
    (sectionBidualEquiv A γ δ s t).toLinearMap = Module.Dual.eval R₀ J₀ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_zero
example : sectionBidualInverse A γ δ s t 0 = 0 := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_first
example : sectionBidualInverse A γ δ s t
    (Module.Dual.eval R₀ J₀ ⟨c₀,sectionFirst_mem A γ δ s t⟩) =
      ⟨c₀,sectionFirst_mem A γ δ s t⟩ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_second
example : sectionBidualInverse A γ δ s t
    (Module.Dual.eval R₀ J₀ ⟨d₀,sectionSecond_mem A γ δ s t⟩) =
      ⟨d₀,sectionSecond_mem A γ δ s t⟩ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_epsilon_first
example : sectionBidualEquiv A γ δ s t ⟨c₀,sectionFirst_mem A γ δ s t⟩ ε₀ = -a₀ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_epsilon_second
example : sectionBidualEquiv A γ δ s t ⟨d₀,sectionSecond_mem A γ δ s t⟩ ε₀ = b₀ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_negative_generator
example : sectionBidualEquiv A γ δ s t (-⟨d₀,sectionSecond_mem A γ δ s t⟩) ε₀ = -b₀ := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_nonreduced
example : Module.IsReflexive (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_zeroRing
example : Module.IsReflexive (Ring (ZMod 1) 0 0 0 0) (sectionIdeal (ZMod 1) 0 0 0 0) := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_roundtrip
example (F : Module.Dual R₀ D₀) :
    sectionBidualEquiv A γ δ s t (sectionBidualInverse A γ δ s t F) = F := by
  sorry

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_dual
example : Module.IsReflexive R₀ D₀ := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

/- Coefficient tensor--Hom comparison, with the inherited left R-module structure. -/
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
set_option maxHeartbeats 1000000
open TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "F₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root F₀
local notation "v₀" => AdjoinRoot.of F₀ (Polynomial.X : Polynomial A)
local notation "c₀" => u₀ - ι₀ s
local notation "d₀" => v₀ - ι₀ t
local notation "J₀" => (Ideal.span {c₀,d₀} : Ideal R₀)
local notation "D₀" => Module.Dual R₀ J₀
local notation "Φ₀" => left (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "Ψ₀" => right (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "ΦA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Φ₀)))
local notation "ΨA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Ψ₀)))
local notation "ΦTA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Matrix.transpose (Φ₀))))
local notation "ΨTA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Matrix.transpose (Ψ₀))))
local notation "pA" => (LinearEquiv.restrictScalars A (sectionRotation A γ δ s t))
local notation "PDA" => (LinearMap.restrictScalars A (dualPresentation A γ δ s t))
local notation "PJA" => (LinearMap.restrictScalars A (idealPresentation A γ δ s t))
variable (M : Type*) [AddCommGroup M] [Module A M]
local notation "N₀" => R₀ ⊗[A] M

def sectionDualTensorHom : D₀ ⊗[A] M →ₗ[R₀] (J₀ →ₗ[R₀] N₀) := by
  sorry

lemma sectionDualTensorHom_tmul (h : D₀) (m : M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m := by
  sorry

def sectionFreeTensorHom :
    (Fin 2 → R₀) ⊗[A] M ≃ₗ[A] ((Fin 2 → R₀) →ₗ[R₀] N₀) := by
  sorry

lemma sectionFreeTensorHom_tmul (z w : Fin 2 → R₀) (m : M) :
    sectionFreeTensorHom A γ δ s t M (z ⊗ₜ[A] m) w =
      (w 0 * z 0 + w 1 * z 1) ⊗ₜ[A] m := by
  sorry

lemma sectionFreeTensorHom_matrix (W : Matrix (Fin 2) (Fin 2) R₀)
    (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionFreeTensorHom A γ δ s t M
      (((W.transpose.mulVecLin).restrictScalars A).rTensor M z) =
    (sectionFreeTensorHom A γ δ s t M z).comp W.mulVecLin := by
  sorry

def sectionIdealHomCoordinates : (J₀ →ₗ[R₀] N₀) →ₗ[A] (Fin 2 → R₀) ⊗[A] M := by
  sorry

lemma sectionIdealHomCoordinates_injective :
    Function.Injective (sectionIdealHomCoordinates A γ δ s t M) := by
  sorry

lemma sectionIdealHomCoordinates_relation (h : J₀ →ₗ[R₀] N₀) :
    ((ΨTA).rTensor M) (sectionIdealHomCoordinates A γ δ s t M h) = 0 := by
  sorry

lemma sectionIdealPresentation_generators (z : Fin 2 → R₀) :
    idealPresentation A γ δ s t z =
    z 0 • (⟨c₀,sectionFirst_mem A γ δ s t⟩ : J₀) -
      z 1 • (⟨d₀,sectionSecond_mem A γ δ s t⟩ : J₀) := by
  sorry

lemma sectionIdealHomCoordinates_presentation (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionIdealHomCoordinates A γ δ s t M
      (sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z)) =
    -((pA).rTensor M) ((ΨA).rTensor M z) := by
  sorry

lemma transposeLeft_rTensor_rotation :
    ((ΦTA).rTensor M).comp ((pA).rTensor M).toLinearMap =
      ((pA).rTensor M).toLinearMap.comp ((ΨA).rTensor M) := by
  sorry

lemma sectionDualTensorHom_injective :
    Function.Injective (sectionDualTensorHom A γ δ s t M) := by
  sorry

lemma sectionDualTensorHom_surjective :
    Function.Surjective (sectionDualTensorHom A γ δ s t M) := by
  sorry

def sectionDualTensorHomEquiv : D₀ ⊗[A] M ≃ₗ[R₀] (J₀ →ₗ[R₀] N₀) := by
  sorry

lemma sectionDualTensorHomEquiv_tmul (h : D₀) (m : M) (j : J₀) :
    sectionDualTensorHomEquiv A γ δ s t M (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m := by
  sorry

lemma sectionDualTensorHom_natural {M' : Type*} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : D₀ →ₗ[R₀] D₀) f x) j =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionDualTensorHom A γ δ s t M x j) := by
  sorry

def sectionIdealTensorHom : J₀ ⊗[A] M →ₗ[R₀] (D₀ →ₗ[R₀] N₀) := by
  sorry

lemma sectionIdealTensorHom_tmul (j : J₀) (m : M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m := by
  sorry

def sectionDualHomCoordinates : (D₀ →ₗ[R₀] N₀) →ₗ[A] (Fin 2 → R₀) ⊗[A] M := by
  sorry

lemma sectionDualHomCoordinates_injective :
    Function.Injective (sectionDualHomCoordinates A γ δ s t M) := by
  sorry

lemma sectionDualHomCoordinates_relation (h : D₀ →ₗ[R₀] N₀) :
    ((ΦTA).rTensor M) (sectionDualHomCoordinates A γ δ s t M h) = 0 := by
  sorry

lemma sectionDualHomCoordinates_presentation (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionDualHomCoordinates A γ δ s t M
      (sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z)) =
    ((pA).rTensor M) ((ΦA).rTensor M z) := by
  sorry

lemma transposeRight_rTensor_rotation :
    ((ΨTA).rTensor M).comp ((pA).rTensor M).toLinearMap =
      ((pA).rTensor M).toLinearMap.comp ((ΦA).rTensor M) := by
  sorry

lemma sectionIdealTensorHom_injective :
    Function.Injective (sectionIdealTensorHom A γ δ s t M) := by
  sorry

lemma sectionIdealTensorHom_surjective :
    Function.Surjective (sectionIdealTensorHom A γ δ s t M) := by
  sorry

def sectionIdealTensorHomEquiv : J₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀) := by
  sorry

lemma sectionIdealTensorHomEquiv_tmul (j : J₀) (m : M) (h : D₀) :
    sectionIdealTensorHomEquiv A γ δ s t M (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m := by
  sorry

lemma sectionIdealTensorHom_natural {M' : Type*} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : J₀ →ₗ[R₀] J₀) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionIdealTensorHom A γ δ s t M x h) := by
  sorry

lemma sectionDualTensorHomEquiv_inverse (h : D₀) (m : M) :
    (sectionDualTensorHomEquiv A γ δ s t M).symm
      (sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m)) = h ⊗ₜ[A] m := by
  sorry

lemma sectionIdealTensorHomEquiv_inverse (j : J₀) (m : M) :
    (sectionIdealTensorHomEquiv A γ δ s t M).symm
      (sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m)) = j ⊗ₜ[A] m := by
  sorry

lemma sectionDualTensorHomEquiv_unique
    (e : D₀ ⊗[A] M ≃ₗ[R₀] (J₀ →ₗ[R₀] N₀))
    (he : ∀ (h : D₀) (m : M) (j : J₀), e (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m) :
    e = sectionDualTensorHomEquiv A γ δ s t M := by
  sorry

lemma sectionIdealTensorHomEquiv_unique
    (e : J₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀))
    (he : ∀ (j : J₀) (m : M) (h : D₀), e (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m) :
    e = sectionIdealTensorHomEquiv A γ δ s t M := by
  sorry

lemma sectionDualTensorHom_unit (x : D₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionDualTensorHom A γ δ s t A x) =
    (AlgebraTensorModule.rid A R₀ D₀) x := by
  sorry

lemma sectionIdealTensorHom_unit (x : J₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionIdealTensorHom A γ δ s t A x) =
    Module.Dual.eval R₀ J₀ ((AlgebraTensorModule.rid A R₀ J₀) x) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_zero
example : sectionDualTensorHom A γ δ s t M 0 = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_inclusion
example (j : J₀) (m : M) :
    sectionDualTensorHom A γ δ s t M (dualMultiplication A γ δ s t 1 ⊗ₜ[A] m) j =
    (j : R₀) ⊗ₜ[A] m := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_negative_epsilon
example (m : M) :
    sectionDualTensorHom A γ δ s t M ((-dualGenerator A γ δ s t : D₀) ⊗ₜ[A] m)
      ⟨c₀,sectionFirst_mem A γ δ s t⟩ =
    (ι₀ δ * v₀ + ι₀ δ * ι₀ t + ι₀ γ * u₀) ⊗ₜ[A] m := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_zero
example : sectionIdealTensorHom A γ δ s t M 0 = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_inclusion
example (j : J₀) (m : M) :
    sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m) (dualMultiplication A γ δ s t 1) =
    (j : R₀) ⊗ₜ[A] m := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_negative_second
example (m : M) :
    sectionIdealTensorHom A γ δ s t M
      ((-⟨d₀,sectionSecond_mem A γ δ s t⟩ : J₀) ⊗ₜ[A] m)
      (dualGenerator A γ δ s t) =
    (-(u₀ + ι₀ s + ι₀ γ * ι₀ t)) ⊗ₜ[A] m := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_zero
example : sectionIdealHomCoordinates A γ δ s t M 0 = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_negative_second
example (h : J₀ →ₗ[R₀] N₀) :
    sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M h) (Pi.single (1 : Fin 2) (1 : R₀)) =
    -h ⟨d₀,sectionSecond_mem A γ δ s t⟩ := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_faithful
example (h k : J₀ →ₗ[R₀] N₀)
    (hk : sectionIdealHomCoordinates A γ δ s t M h =
      sectionIdealHomCoordinates A γ δ s t M k) : h = k := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_zero
example : sectionDualHomCoordinates A γ δ s t M 0 = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_negative_epsilon
example (h : D₀ →ₗ[R₀] N₀) :
    sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M h) (Pi.single (1 : Fin 2) (1 : R₀)) =
    -h (dualGenerator A γ δ s t) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_faithful
example (h k : D₀ →ₗ[R₀] N₀)
    (hk : sectionDualHomCoordinates A γ δ s t M h =
      sectionDualHomCoordinates A γ δ s t M k) : h = k := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_inverse
example (h : D₀) (m : M) :
    (sectionDualTensorHomEquiv A γ δ s t M).symm
      (sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m)) = h ⊗ₜ[A] m := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_ring_action
example (r : R₀) (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHomEquiv A γ δ s t M (r • x) j =
    r • sectionDualTensorHomEquiv A γ δ s t M x j := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_torsion
example : Function.Bijective (sectionDualTensorHom ℤ 0 0 0 0 (ZMod 3)) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_inverse
example (j : J₀) (m : M) :
    (sectionIdealTensorHomEquiv A γ δ s t M).symm
      (sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m)) = j ⊗ₜ[A] m := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_ring_action
example (r : R₀) (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHomEquiv A γ δ s t M (r • x) h =
    r • sectionIdealTensorHomEquiv A γ δ s t M x h := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_torsion
example : Function.Bijective (sectionIdealTensorHom ℤ 0 0 0 0 (ZMod 3)) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_naturality
example {M' : Type*} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : D₀ →ₗ[R₀] D₀) f x) j =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionDualTensorHom A γ δ s t M x j) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_naturality
example {M' : Type*} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : J₀ →ₗ[R₀] J₀) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionIdealTensorHom A γ δ s t M x h) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_unit
example (x : D₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionDualTensorHom A γ δ s t A x) =
    (AlgebraTensorModule.rid A R₀ D₀) x := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_bidual
example (x : J₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionIdealTensorHom A γ δ s t A x) =
    Module.Dual.eval R₀ J₀ ((AlgebraTensorModule.rid A R₀ J₀) x) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_nonreduced
example : Function.Bijective (sectionDualTensorHom (ZMod 4) 0 0 0 0 (ZMod 4)) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_zero_ring
example : Function.Bijective (sectionIdealTensorHom (ZMod 1) 0 0 0 0 (ZMod 1)) := by
  sorry


end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
universe u_cochain v_cochain
open CategoryTheory TensorProduct
variable (A : Type u_cochain) [CommRing A] (γ δ s t : A)
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root (polynomial A γ δ s t)
local notation "v₀" => AdjoinRoot.of (polynomial A γ δ s t) (Polynomial.X : Polynomial A)
local notation "Φ₀" => left (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "Ψ₀" => right (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
variable (M : Type v_cochain) [AddCommGroup M] [Module A M]
local notation "N₀" => R₀ ⊗[A] M
local notation "H₀" => ((Fin 2 → R₀) →ₗ[R₀] N₀)

def sectionHomDifferential (dual : Bool) (n : ℕ) : H₀ →ₗ[R₀] H₀ := by sorry

lemma sectionHomLeftRight_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin)
      (LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin) := by sorry

lemma sectionHomRightLeft_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin)
      (LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin) := by sorry

lemma sectionHomDifferential_exact (dual : Bool) (n : ℕ) :
    Function.Exact (sectionHomDifferential A γ δ s t M dual n)
      (sectionHomDifferential A γ δ s t M dual (n+1)) := by sorry

lemma sectionHomDifferential_sq (dual : Bool) (n : ℕ) :
    (sectionHomDifferential A γ δ s t M dual (n+1)).comp
      (sectionHomDifferential A γ δ s t M dual n) = 0 := by sorry

def sectionHomCochain (coeff : Type v_cochain) [AddCommGroup coeff] [Module A coeff] (dual : Bool) : CochainComplex (ModuleCat.{max u_cochain v_cochain} R₀) ℕ := by sorry

lemma sectionHomCochain_d (dual : Bool) (n : ℕ) :
    HEq ((sectionHomCochain A γ δ s t M dual).d n (n+1))
      (ModuleCat.ofHom (R := R₀) (X := H₀) (Y := H₀) (sectionHomDifferential A γ δ s t M dual n)) := by sorry

lemma sectionHomCochain_exactAt (dual : Bool) (n : ℕ) :
    (sectionHomCochain A γ δ s t M dual).ExactAt (n+1) := by sorry

lemma sectionHomCochain_isZero_homology (dual : Bool) (n : ℕ) :
    CategoryTheory.Limits.IsZero ((sectionHomCochain A γ δ s t M dual).homology (n+1)) := by sorry

lemma sectionHomDifferential_ideal_zero :
    sectionHomDifferential A γ δ s t M false 0 =
      LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin := by sorry

lemma sectionHomDifferential_dual_zero :
    sectionHomDifferential A γ δ s t M true 0 =
      LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin := by sorry

lemma sectionHomDifferential_periodic (dual : Bool) (n : ℕ) :
    sectionHomDifferential A γ δ s t M dual (n+2) =
      sectionHomDifferential A γ δ s t M dual n := by sorry

lemma sectionHomCochain_X (dual : Bool) (n : ℕ) :
    (sectionHomCochain A γ δ s t M dual).X n = ModuleCat.of R₀ H₀ := by sorry

lemma sectionHomCochain_shape (dual : Bool) (i j : ℕ) (h : i+1 ≠ j) :
    (sectionHomCochain A γ δ s t M dual).d i j = 0 := by sorry

lemma sectionHomIdeal_augmentation_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (idealPresentation A γ δ s t))
      (sectionHomDifferential A γ δ s t M false 0) := by sorry

lemma sectionHomDual_augmentation_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (dualPresentation A γ δ s t))
      (sectionHomDifferential A γ δ s t M true 0) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_ideal_signed_column
example (m : M) :
    sectionHomDifferential A 0 0 0 0 M false 0
      (sectionFreeTensorHom A 0 0 0 0 M (![0,1] ⊗ₜ[A] m)) (![1,0]) =
      AdjoinRoot.root (polynomial A 0 0 0 0) ⊗ₜ[A] m := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_dual_negative_column
example (m : M) :
    sectionHomDifferential A 0 0 0 0 M true 0
      (sectionFreeTensorHom A 0 0 0 0 M (![0,1] ⊗ₜ[A] m)) (![1,0]) =
      (-AdjoinRoot.root (polynomial A 0 0 0 0)) ⊗ₜ[A] m := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_two_period
example (dual : Bool) (n : ℕ) :
    sectionHomDifferential A γ δ s t M dual (n+2) =
      sectionHomDifferential A γ δ s t M dual n := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_torsion_coefficient
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain ℤ 1 0 1 0 (ZMod 2) false).homology 3) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_nonreduced_base
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain (ZMod 4) 0 0 1 0 (ZMod 4) true).homology 2) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_zero_ring
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain (ZMod 1) 0 0 0 0 (ZMod 1) false).homology 1) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_actual_differential
example (n : ℕ) :
    HEq ((sectionHomCochain A γ δ s t M false).d n (n+1))
      (ModuleCat.ofHom (R := R₀) (X := H₀) (Y := H₀) (sectionHomDifferential A γ δ s t M false n)) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_degree_zero_ideal
example (h : H₀) : sectionHomDifferential A γ δ s t M false 0 h = 0 ↔
    ∃ f : (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀) →ₗ[R₀] N₀, f.comp (idealPresentation A γ δ s t) = h := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_degree_zero_dual
example (h : H₀) : sectionHomDifferential A γ δ s t M true 0 h = 0 ↔
    ∃ f : Module.Dual R₀ (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀) →ₗ[R₀] N₀, f.comp (dualPresentation A γ δ s t) = h := by sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

-- Native actual section projective resolutions; all bodies admitted under §13.
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
universe u_resolution
open CategoryTheory TensorProduct
variable (A : Type u_resolution) [CommRing A] (γ δ s t : A)
local notation "R₀" => Ring A γ δ s t
local notation "ι₀" => coefficientHom A γ δ s t
local notation "u₀" => AdjoinRoot.root (polynomial A γ δ s t)
local notation "v₀" => AdjoinRoot.of (polynomial A γ δ s t) (Polynomial.X : Polynomial A)
local notation "Φ₀" => left (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "Ψ₀" => right (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "J₀" => (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀)
local notation "D₀" => Module.Dual R₀ J₀
local notation "F₀" => (Fin 2 → R₀)

def sectionChainDifferential (dual : Bool) (n : ℕ) : F₀ →ₗ[R₀] F₀ := by
  sorry

lemma sectionChainDifferential_exact (dual : Bool) (n : ℕ) :
    Function.Exact (sectionChainDifferential A γ δ s t dual (n+1))
      (sectionChainDifferential A γ δ s t dual n) := by
  sorry

lemma sectionChainDifferential_sq (dual : Bool) (n : ℕ) :
    (sectionChainDifferential A γ δ s t dual n).comp
      (sectionChainDifferential A γ δ s t dual (n+1)) = 0 := by
  sorry

def sectionChain (dual : Bool) : ChainComplex (ModuleCat.{u_resolution} R₀) ℕ := by
  sorry

lemma sectionChain_d (dual : Bool) (n : ℕ) :
    HEq ((sectionChain A γ δ s t dual).d (n+1) n)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (sectionChainDifferential A γ δ s t dual n)) := by
  sorry

lemma sectionChain_exactAt (dual : Bool) (n : ℕ) :
    (sectionChain A γ δ s t dual).ExactAt (n+1) := by
  sorry

lemma sectionChain_projective (dual : Bool) (n : ℕ) :
    CategoryTheory.Projective ((sectionChain A γ δ s t dual).X n) := by
  sorry

lemma sectionChainIdeal_augmentation_zero :
    (idealPresentation A γ δ s t).comp
      (sectionChainDifferential A γ δ s t false 0) = 0 := by
  sorry

lemma sectionChainDual_augmentation_zero :
    (dualPresentation A γ δ s t).comp
      (sectionChainDifferential A γ δ s t true 0) = 0 := by
  sorry

def sectionIdealAugmentation : sectionChain A γ δ s t false ⟶
    (ChainComplex.single₀ (ModuleCat.{u_resolution} R₀)).obj (ModuleCat.of R₀ J₀) := by
  sorry

def sectionDualAugmentation : sectionChain A γ δ s t true ⟶
    (ChainComplex.single₀ (ModuleCat.{u_resolution} R₀)).obj (ModuleCat.of R₀ D₀) := by
  sorry

lemma sectionIdealAugmentation_zero :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) := by
  sorry

lemma sectionDualAugmentation_zero :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) := by
  sorry

set_option backward.isDefEq.respectTransparency false in
lemma sectionIdealAugmentation_quasiIso : QuasiIso (sectionIdealAugmentation A γ δ s t) := by
  sorry

set_option backward.isDefEq.respectTransparency false in
lemma sectionDualAugmentation_quasiIso : QuasiIso (sectionDualAugmentation A γ δ s t) := by
  sorry

def sectionIdealResolution : ProjectiveResolution (ModuleCat.of R₀ J₀) := by
  sorry

def sectionDualResolution : ProjectiveResolution (ModuleCat.of R₀ D₀) := by
  sorry

lemma sectionChainDifferential_ideal_zero :
    sectionChainDifferential A γ δ s t false 0 = (Ψ₀).mulVecLin := by
  sorry

lemma sectionChainDifferential_dual_zero :
    sectionChainDifferential A γ δ s t true 0 = (Φ₀).mulVecLin := by
  sorry

lemma sectionChainDifferential_periodic (dual : Bool) (n : ℕ) :
    sectionChainDifferential A γ δ s t dual (n+2) =
      sectionChainDifferential A γ δ s t dual n := by
  sorry

lemma sectionChain_X (dual : Bool) (n : ℕ) :
    (sectionChain A γ δ s t dual).X n = ModuleCat.of R₀ F₀ := by
  sorry

lemma sectionChain_finiteFree (dual : Bool) (n : ℕ) :
    Module.Free R₀ ((sectionChain A γ δ s t dual).X n) ∧
      Module.Finite R₀ ((sectionChain A γ δ s t dual).X n) := by
  sorry

lemma sectionChain_shape (dual : Bool) (i j : ℕ) (h : j+1 ≠ i) :
    (sectionChain A γ δ s t dual).d i j = 0 := by
  sorry

lemma sectionResolutionHom_d (M : Type*) [AddCommGroup M] [Module A M]
    (dual : Bool) (n : ℕ) :
    HEq (LinearMap.lcomp R₀ (R₀ ⊗[A] M) ((sectionChain A γ δ s t dual).d (n+1) n).hom)
      (sectionHomDifferential A γ δ s t M dual n) := by
  sorry

lemma sectionIdealResolution_complex :
    (sectionIdealResolution A γ δ s t).complex = sectionChain A γ δ s t false := by
  sorry

lemma sectionIdealResolution_augmentation :
    HEq ((sectionIdealResolution A γ δ s t).π) (sectionIdealAugmentation A γ δ s t) := by
  sorry

lemma sectionDualResolution_complex :
    (sectionDualResolution A γ δ s t).complex = sectionChain A γ δ s t true := by
  sorry

lemma sectionDualResolution_augmentation :
    HEq ((sectionDualResolution A γ δ s t).π) (sectionDualAugmentation A γ δ s t) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_ideal_signed_column
example : sectionChainDifferential A 0 0 0 0 false 0 (![1,0]) 1 =
    AdjoinRoot.root (polynomial A 0 0 0 0) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_dual_negative_column
example : sectionChainDifferential A 0 0 0 0 true 0 (![1,0]) 1 =
    -AdjoinRoot.root (polynomial A 0 0 0 0) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_two_period
example (dual : Bool) (n : ℕ) : sectionChainDifferential A γ δ s t dual (n+2) =
    sectionChainDifferential A γ δ s t dual n := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_nonreduced_exact
example : (sectionChain (ZMod 4) 0 0 1 0 false).ExactAt 2 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_finite_projective
example (dual : Bool) (n : ℕ) :
    CategoryTheory.Projective ((sectionChain A γ δ s t dual).X n) ∧
      Module.Finite R₀ ((sectionChain A γ δ s t dual).X n) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_hom_coefficient_differential
example (M : Type*) [AddCommGroup M] [Module A M] (dual : Bool) (n : ℕ) :
    HEq (LinearMap.lcomp R₀ (R₀ ⊗[A] M) ((sectionChain A γ δ s t dual).d (n+1) n).hom)
      (sectionHomDifferential A γ δ s t M dual n) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_first_generator
example :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) ∧
      (idealPresentation A γ δ s t (![1,0]) : R₀) = u₀ - ι₀ s := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_second_signed_generator
example :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) ∧
      (idealPresentation A γ δ s t (![0,1]) : R₀) = -(v₀ - ι₀ t) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_positive_component_zero
example (n : ℕ) : (sectionIdealAugmentation A γ δ s t).f (n+1) = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_first_generator
example (j : J₀) :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) ∧
      dualPresentation A γ δ s t (![1,0]) j = (j : R₀) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_second_signed_generator
example (j : J₀) :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) ∧
      dualPresentation A γ δ s t (![0,1]) j = -dualGenerator A γ δ s t j := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_positive_component_zero
example (n : ℕ) : (sectionDualAugmentation A γ δ s t).f (n+1) = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_starting_psi
example : HEq ((sectionIdealResolution A γ δ s t).complex.d 1 0)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Ψ₀).mulVecLin) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_next_phi
example : HEq ((sectionIdealResolution A γ δ s t).complex.d 2 1)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Φ₀).mulVecLin) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_zero_ring_quasiIso
example : QuasiIso (sectionIdealResolution (ZMod 1) 0 0 0 0).π := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_starting_phi
example : HEq ((sectionDualResolution A γ δ s t).complex.d 1 0)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Φ₀).mulVecLin) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_next_psi
example : HEq ((sectionDualResolution A γ δ s t).complex.d 2 1)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Ψ₀).mulVecLin) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_nonreduced_quasiIso
example : QuasiIso (sectionDualResolution (ZMod 4) 0 0 1 0).π := by
  sorry

lemma sectionIdealResolution_quasiIso :
    QuasiIso (sectionIdealResolution A γ δ s t).π := by
  sorry

lemma sectionDualResolution_quasiIso :
    QuasiIso (sectionDualResolution A γ δ s t).π := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
universe u_ext
open CategoryTheory TensorProduct
variable (A : Type u_ext) [CommRing A] (γ δ s t : A)
local notation "R₀" => Ring A γ δ s t
local notation "J₀" => sectionIdeal A γ δ s t
local notation "D₀" => Module.Dual R₀ J₀
variable (M : Type u_ext) [AddCommGroup M] [Module A M]
local notation "N₀" => R₀ ⊗[A] M
local notation "F₀" => Fin 2 → R₀

def sectionResolutionHomIso (dual : Bool) :
    (sectionChain A γ δ s t dual).linearYonedaObj R₀ (ModuleCat.of R₀ N₀) ≅
      sectionHomCochain A γ δ s t M dual := by sorry

lemma sectionResolutionHomIso_apply (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).hom.f n h) h.hom := by sorry

lemma sectionResolutionHomIso_inv_apply (dual : Bool) (n : ℕ)
    :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).inv.f n)
      (ModuleCat.ofHom (ModuleCat.homLinearEquiv (S := R₀)
        (M := ModuleCat.of R₀ F₀) (N := ModuleCat.of R₀ N₀)).symm.toLinearMap) := by sorry

lemma sectionResolutionHom_exact (dual : Bool) (n : ℕ) :
    Function.Exact
      (fun h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀ =>
        (sectionChain A γ δ s t dual).d (n+1) n ≫ h)
      (fun h : (sectionChain A γ δ s t dual).X (n+1) ⟶ ModuleCat.of R₀ N₀ =>
        (sectionChain A γ δ s t dual).d (n+2) (n+1) ≫ h) := by sorry

def sectionIdealDerivedExtIso (n : ℕ) :
    ((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) n).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀) ≅
      (sectionHomCochain A γ δ s t M false).homology n := by sorry

def sectionDualDerivedExtIso (n : ℕ) :
    ((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) n).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀) ≅
      (sectionHomCochain A γ δ s t M true).homology n := by sorry

lemma sectionIdealDerivedExtIso_inverse (n : ℕ) :
    (sectionIdealDerivedExtIso A γ δ s t M n).hom ≫
      (sectionIdealDerivedExtIso A γ δ s t M n).inv = 𝟙 _ := by sorry

lemma sectionDualDerivedExtIso_inverse (n : ℕ) :
    (sectionDualDerivedExtIso A γ δ s t M n).hom ≫
      (sectionDualDerivedExtIso A γ δ s t M n).inv = 𝟙 _ := by sorry

lemma sectionIdealDerivedExtIso_zero (n : ℕ) :
    (sectionIdealDerivedExtIso A γ δ s t M n).hom 0 = 0 := by sorry

lemma sectionDualDerivedExtIso_zero (n : ℕ) :
    (sectionDualDerivedExtIso A γ δ s t M n).hom 0 = 0 := by sorry

lemma sectionIdealDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀)) := by sorry

lemma sectionDualDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀)) := by sorry

lemma sectionIdealExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ J₀) (ModuleCat.of R₀ N₀) (n+1)) :
    α = 0 := by sorry

lemma sectionDualExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ D₀) (ModuleCat.of R₀ N₀) (n+1)) :
    α = 0 := by sorry

lemma sectionResolutionHomIso_natural {M' : Type u_ext} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M' dual).hom.f n
      (h ≫ ModuleCat.ofHom (AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f)))
      ((AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f).comp h.hom) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_actual_components
example (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).hom.f n h) h.hom := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_inverse
example (dual : Bool) (n : ℕ) :
    ((sectionResolutionHomIso A γ δ s t M dual).inv ≫
      (sectionResolutionHomIso A γ δ s t M dual).hom).f n =
        𝟙 ((sectionHomCochain A γ δ s t M dual).X n) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_naturality
example {M' : Type u_ext} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M' dual).hom.f n
      (h ≫ ModuleCat.ofHom (AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f)))
      ((AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f).comp h.hom) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_degree_zero
example (x : (( _root_.Ext R₀ (ModuleCat.{u_ext} R₀) 0).obj
    (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀)) :
    (sectionIdealDerivedExtIso A γ δ s t M 0).inv
      ((sectionIdealDerivedExtIso A γ δ s t M 0).hom x) = x := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_nonflat
example : Limits.IsZero (((_root_.Ext (Ring ℤ 1 0 1 0)
    (ModuleCat.{0} (Ring ℤ 1 0 1 0)) 3).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal ℤ 1 0 1 0)))).obj
        (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2))) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_zero_ring
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 1) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 1) 0 0 0 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal (ZMod 1) 0 0 0 0)))).obj
        (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0 ⊗[ZMod 1] ZMod 1))) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_degree_zero
example (x : (( _root_.Ext R₀ (ModuleCat.{u_ext} R₀) 0).obj
    (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀)) :
    (sectionDualDerivedExtIso A γ δ s t M 0).inv
      ((sectionDualDerivedExtIso A γ δ s t M 0).hom x) = x := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_nonreduced
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 4) 0 0 1 0)
    (ModuleCat.{0} (Ring (ZMod 4) 0 0 1 0)) 2).obj
      (Opposite.op (ModuleCat.of _ (Module.Dual (Ring (ZMod 4) 0 0 1 0)
        (sectionIdeal (ZMod 4) 0 0 1 0))))).obj
        (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0 ⊗[ZMod 4] ZMod 4))) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_nonflat
example : Limits.IsZero (((_root_.Ext (Ring ℤ 1 0 1 0)
    (ModuleCat.{0} (Ring ℤ 1 0 1 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))))).obj
        (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2))) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealExt.test_nonflat
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))
    (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2)) 4) : α = 0 := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualExt.test_nonreduced
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 4) 0 0 1 0)
      (Module.Dual (Ring (ZMod 4) 0 0 1 0) (sectionIdeal (ZMod 4) 0 0 1 0)))
    (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0 ⊗[ZMod 4] ZMod 4)) 2) : α = 0 := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealExt.test_zero_ring
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 1) 0 0 0 0) (sectionIdeal (ZMod 1) 0 0 0 0))
    (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0 ⊗[ZMod 1] ZMod 1)) 1) : α = 0 := by sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

/- BEGIN RELATIVE CRITERION COMPARISON -/
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
universe u_rel
open CategoryTheory TensorProduct
variable (A : Type u_rel) [CommRing A] (γ δ s t : A)
local notation "R₀" => Ring A γ δ s t
local notation "J₀" => sectionIdeal A γ δ s t
local notation "D₀" => Module.Dual R₀ J₀
variable (M : Type u_rel) [AddCommGroup M] [Module A M]
local notation "N₀" => R₀ ⊗[A] M

def sectionBidualTensorHomEquiv :
    Module.Dual R₀ D₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀) := by sorry

lemma sectionBidualTensorHomEquiv_tmul (F : Module.Dual R₀ D₀) (m : M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M (F ⊗ₜ[A] m) h = F h ⊗ₜ[A] m := by sorry

lemma sectionBidualTensorHomEquiv_inverse (F : Module.Dual R₀ D₀) (m : M) :
    (sectionBidualTensorHomEquiv A γ δ s t M).symm
      (sectionBidualTensorHomEquiv A γ δ s t M (F ⊗ₜ[A] m)) = F ⊗ₜ[A] m := by sorry

lemma sectionBidualTensorHomEquiv_unique
    (e : Module.Dual R₀ D₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀))
    (he : ∀ F m h, e (F ⊗ₜ[A] m) h = F h ⊗ₜ[A] m) :
    e = sectionBidualTensorHomEquiv A γ δ s t M := by sorry

lemma sectionBidualTensorHomEquiv_natural
    {M' : Type u_rel} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : Module.Dual R₀ D₀ ⊗[A] M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : Module.Dual R₀ D₀ →ₗ[R₀] _) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionBidualTensorHomEquiv A γ δ s t M x h) := by sorry

lemma sectionBidualTensorHomEquiv_evaluation (x : J₀ ⊗[A] M) :
    sectionBidualTensorHomEquiv A γ δ s t M
      (AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀) x) =
        sectionIdealTensorHomEquiv A γ δ s t M x := by sorry

lemma sectionIdealAbsoluteDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ R₀)) := by sorry

lemma sectionDualAbsoluteDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ R₀)) := by sorry

set_option backward.defeqAttrib.useBackward true in
lemma sectionIdealAbsoluteExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ J₀) (ModuleCat.of R₀ R₀) (n+1)) :
    α = 0 := by sorry

set_option backward.defeqAttrib.useBackward true in
lemma sectionDualAbsoluteExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ D₀) (ModuleCat.of R₀ R₀) (n+1)) :
    α = 0 := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_unit
example (F : Module.Dual R₀ D₀) (h : D₀) :
    AlgebraTensorModule.rid A R₀ R₀
      (sectionBidualTensorHomEquiv A γ δ s t A (F ⊗ₜ[A] 1) h) = F h := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_torsion
example (F : Module.Dual (Ring ℤ 1 0 1 0)
    (Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0)))
    (h : Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0)) :
    sectionBidualTensorHomEquiv ℤ 1 0 1 0 (ZMod 2) (F ⊗ₜ[ℤ] 1) h = F h ⊗ₜ[ℤ] 1 := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_inverse_nonreduced
example (F : Module.Dual (Ring (ZMod 4) 0 0 0 0)
    (Module.Dual (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0))) :
    (sectionBidualTensorHomEquiv (ZMod 4) 0 0 0 0 (ZMod 4)).symm
      (sectionBidualTensorHomEquiv (ZMod 4) 0 0 0 0 (ZMod 4) (F ⊗ₜ[ZMod 4] 1)) =
        F ⊗ₜ[ZMod 4] 1 := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv_evaluation.test_native
example (j : J₀) (m : M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M
      (AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀) (j ⊗ₜ[A] m)) h =
        h j ⊗ₜ[A] m := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAbsoluteDerivedExt.test_zero_ring
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 1) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 1) 0 0 0 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal (ZMod 1) 0 0 0 0)))).obj
        (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0))) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAbsoluteDerivedExt.test_nonreduced
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 4) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 4) 0 0 0 0)) 2).obj
      (Opposite.op (ModuleCat.of _
        (Module.Dual (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0))))).obj
        (ModuleCat.of _ (Ring (ZMod 4) 0 0 0 0))) := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAbsoluteExt.test_integral
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))
    (ModuleCat.of _ (Ring ℤ 1 0 1 0)) 3) : α = 0 := by sorry

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAbsoluteExt.test_nonreduced
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 4) 0 0 1 0)
      (Module.Dual (Ring (ZMod 4) 0 0 1 0) (sectionIdeal (ZMod 4) 0 0 1 0)))
    (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0)) 4) : α = 0 := by sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
/- END RELATIVE CRITERION COMPARISON -/

/- BEGIN COMPLETED COEFFICIENT COMPARISON -/

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t)) (h : p ≤ m.comap (coefficientHom A γ δ s t))

include h in
lemma completionCoefficient_pow (n : ℕ) : p ^ n ≤ (m ^ n).comap (coefficientHom A γ δ s t) := by sorry
/-- The actual finite-level coefficient map between the two ideal-adic quotients. -/
def completionCoefficientLevel (h : p ≤ m.comap (coefficientHom A γ δ s t)) (n : ℕ) : A ⧸ p ^ n →+* (Ring A γ δ s t) ⧸ m ^ n := by sorry
lemma completionCoefficientLevel_mk (n : ℕ) (a : A) :
    completionCoefficientLevel A γ δ s t p m h n (Ideal.Quotient.mk (p ^ n) a) =
      Ideal.Quotient.mk (m ^ n) ((coefficientHom A γ δ s t) a) := by sorry
lemma completionCoefficientLevel_transition {i j : ℕ} (hij : i ≤ j) :
    (Ideal.Quotient.factorPow m hij).comp (completionCoefficientLevel A γ δ s t p m h j) =
      (completionCoefficientLevel A γ δ s t p m h i).comp (Ideal.Quotient.factorPow p hij) := by sorry
lemma completionCoefficientLevel_mul (n : ℕ) (a b : A ⧸ p ^ n) :
    completionCoefficientLevel A γ δ s t p m h n (a * b) =
      completionCoefficientLevel A γ δ s t p m h n a *
        completionCoefficientLevel A γ δ s t p m h n b := by sorry
lemma completionCoefficientSource_transition {i j : ℕ} (hij : i ≤ j)
    (a : AdicCompletion p A) :
    Ideal.Quotient.factorPow p hij (AdicCompletion.evalₐ p j a) =
      AdicCompletion.evalₐ p i a := by sorry
/-- The quotient-compatible family maps actual completed coefficients to the nodal quotients. -/
def completionCoefficientFamily (h : p ≤ m.comap (coefficientHom A γ δ s t)) (n : ℕ) : AdicCompletion p A →+* (Ring A γ δ s t) ⧸ m ^ n := by sorry
lemma completionCoefficientFamily_transition {i j : ℕ} (hij : i ≤ j) :
    (Ideal.Quotient.factorPow m hij).comp (completionCoefficientFamily A γ δ s t p m h j) =
      completionCoefficientFamily A γ δ s t p m h i := by sorry
lemma completionCoefficientFamily_of (n : ℕ) (a : A) :
    completionCoefficientFamily A γ δ s t p m h n (AdicCompletion.of p A a) =
      Ideal.Quotient.mk (m ^ n) (coefficientHom A γ δ s t a) := by sorry
lemma completionCoefficientFamily_one (n : ℕ) :
    completionCoefficientFamily A γ δ s t p m h n 1 = 1 := by sorry
def completionCoefficientHom (h : p ≤ m.comap (coefficientHom A γ δ s t)) : AdicCompletion p A →+* AdicCompletion m (Ring A γ δ s t) := by sorry
lemma completionCoefficientHom_eval (n : ℕ) (a : AdicCompletion p A) :
    AdicCompletion.evalₐ m n (completionCoefficientHom A γ δ s t p m h a) =
      completionCoefficientLevel A γ δ s t p m h n (AdicCompletion.evalₐ p n a) := by sorry
lemma completionCoefficientHom_of (a : A) :
    completionCoefficientHom A γ δ s t p m h (AdicCompletion.of p A a) =
      AdicCompletion.of m (Ring A γ δ s t) ((coefficientHom A γ δ s t) a) := by sorry
lemma completionCoefficientHom_unique (f : AdicCompletion p A →+* AdicCompletion m (Ring A γ δ s t))
    (hf : ∀ n a, AdicCompletion.evalₐ m n (f a) =
      completionCoefficientLevel A γ δ s t p m h n (AdicCompletion.evalₐ p n a)) :
    f = completionCoefficientHom A γ δ s t p m h := by sorry
end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t))
  (h : p ≤ m.comap (coefficientHom A γ δ s t))
local notation "AH" => AdicCompletion p A
local notation "RH" => AdicCompletion m (Ring A γ δ s t)

/-- The completed chart is an algebra over its actual completed coefficient ring. -/
@[instance_reducible]
def completionCoefficientAlgebra (h : p ≤ m.comap (coefficientHom A γ δ s t)) : Algebra AH RH := by sorry
lemma completionCoefficientAlgebra_map (a : AH) :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    algebraMap AH RH a = completionCoefficientHom A γ δ s t p m h a := by sorry
lemma completionCoefficientAlgebra_of (a : A) :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    algebraMap AH RH (AdicCompletion.of p A a) =
      AdicCompletion.of m (Ring A γ δ s t) (coefficientHom A γ δ s t a) := by sorry
lemma completionCoefficientScalarTower :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    IsScalarTower A AH RH := by sorry
variable (N : Type*) [AddCommGroup N] [Module (AdicCompletion p A) N]
  [Module A N] [IsScalarTower A (AdicCompletion p A) N]

/-- Quotient by the additional completed-coefficient balancing relations. -/
def completionCoefficientTensor (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (N : Type*) [AddCommGroup N] [Module AH N] [Module A N] [IsScalarTower A AH N] :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    letI := completionCoefficientScalarTower A γ δ s t p m h
    RH ⊗[A] N →ₗ[RH] RH ⊗[AH] N := by sorry
lemma completionCoefficientTensor_tmul (r : RH) (n : N) :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    letI := completionCoefficientScalarTower A γ δ s t p m h
    completionCoefficientTensor A γ δ s t p m h N (r ⊗ₜ[A] n) = r ⊗ₜ[AH] n := by sorry
lemma completionCoefficientTensor_surjective :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    letI := completionCoefficientScalarTower A γ δ s t p m h
    Function.Surjective (completionCoefficientTensor A γ δ s t p m h N) := by sorry
lemma completionCoefficientTensor_balance (a : AH) (r : RH) (n : N) :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    letI := completionCoefficientScalarTower A γ δ s t p m h
    completionCoefficientTensor A γ δ s t p m h N ((a • r) ⊗ₜ[A] n) =
      completionCoefficientTensor A γ δ s t p m h N (r ⊗ₜ[A] (a • n)) := by sorry
lemma completionCoefficientTensor_ker :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    letI := completionCoefficientScalarTower A γ δ s t p m h
    ((completionCoefficientTensor A γ δ s t p m h N).restrictScalars AH).ker =
      Submodule.span AH {(a • r) ⊗ₜ[A] n - r ⊗ₜ[A] (a • n) |
        (a : AH) (r : RH) (n : N)} := by sorry
end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t))
  (h : p ≤ m.comap (coefficientHom A γ δ s t))

-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientLevel.test_level_zero
example (a : A) : completionCoefficientLevel A γ δ s t p m h 0
    (Ideal.Quotient.mk (p ^ 0) a) = Ideal.Quotient.mk (m ^ 0) (coefficientHom A γ δ s t a) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientLevel.test_level_one
example (a : A) : completionCoefficientLevel A γ δ s t p m h 1
    (Ideal.Quotient.mk (p ^ 1) a) = Ideal.Quotient.mk (m ^ 1) (coefficientHom A γ δ s t a) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientLevel.test_product
example (a b : A ⧸ p ^ 3) : completionCoefficientLevel A γ δ s t p m h 3 (a * b) =
    completionCoefficientLevel A γ δ s t p m h 3 a * completionCoefficientLevel A γ δ s t p m h 3 b := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientFamily.test_coefficients
example (a : A) : completionCoefficientFamily A γ δ s t p m h 2 (AdicCompletion.of p A a) =
    Ideal.Quotient.mk (m ^ 2) (coefficientHom A γ δ s t a) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientFamily.test_unit
example : completionCoefficientFamily A γ δ s t p m h 4 1 = 1 := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientFamily.test_successor
example (n : ℕ) : (Ideal.Quotient.factorPow m (Nat.le_succ n)).comp
    (completionCoefficientFamily A γ δ s t p m h (n+1)) = completionCoefficientFamily A γ δ s t p m h n := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientHom.test_finite_projection
example (a : AdicCompletion p A) : AdicCompletion.evalₐ m 2
    (completionCoefficientHom A γ δ s t p m h a) =
      completionCoefficientLevel A γ δ s t p m h 2 (AdicCompletion.evalₐ p 2 a) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientHom.test_uniqueness
example (f : AdicCompletion p A →+* AdicCompletion m (Ring A γ δ s t))
    (hf : ∀ n a, AdicCompletion.evalₐ m n (f a) =
      completionCoefficientLevel A γ δ s t p m h n (AdicCompletion.evalₐ p n a)) :
    f = completionCoefficientHom A γ δ s t p m h := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientHom.test_nonreduced
example (a : ZMod 4) : completionCoefficientHom (ZMod 4) 0 0 1 0 ⊥ ⊥ (by simp)
    (AdicCompletion.of ⊥ (ZMod 4) a) =
      AdicCompletion.of ⊥ (Ring (ZMod 4) 0 0 1 0) (coefficientHom (ZMod 4) 0 0 1 0 a) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientAlgebra.test_tower
example : letI := completionCoefficientAlgebra A γ δ s t p m h
    IsScalarTower A (AdicCompletion p A) (AdicCompletion m (Ring A γ δ s t)) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientAlgebra.test_product_coefficients
example (a b : A) : letI := completionCoefficientAlgebra A γ δ s t p m h
    algebraMap (AdicCompletion p A) (AdicCompletion m (Ring A γ δ s t)) (AdicCompletion.of p A (a*b)) =
      AdicCompletion.of m (Ring A γ δ s t) (coefficientHom A γ δ s t (a*b)) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientAlgebra.test_completed_element
example (a : AdicCompletion p A) : letI := completionCoefficientAlgebra A γ δ s t p m h
    algebraMap (AdicCompletion p A) (AdicCompletion m (Ring A γ δ s t)) a =
      completionCoefficientHom A γ δ s t p m h a := by sorry
variable (N : Type*) [AddCommGroup N] [Module (AdicCompletion p A) N]
  [Module A N] [IsScalarTower A (AdicCompletion p A) N]

-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientTensor.test_unit_tensors
example (n : N) :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    letI := completionCoefficientScalarTower A γ δ s t p m h
    completionCoefficientTensor A γ δ s t p m h N (1 ⊗ₜ[A] n) =
      (1 : AdicCompletion m (Ring A γ δ s t)) ⊗ₜ[AdicCompletion p A] n := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientTensor.test_relation_kernel
example (a : AdicCompletion p A) (r : AdicCompletion m (Ring A γ δ s t)) (n : N) :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    letI := completionCoefficientScalarTower A γ δ s t p m h
    completionCoefficientTensor A γ δ s t p m h N
      ((a • r) ⊗ₜ[A] n - r ⊗ₜ[A] (a • n)) = 0 := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionCoefficientTensor.test_arbitrary_target
example :
    letI := completionCoefficientAlgebra A γ δ s t p m h
    letI := completionCoefficientScalarTower A γ δ s t p m h
    ∀ z : AdicCompletion m (Ring A γ δ s t) ⊗[AdicCompletion p A] N,
      ∃ x : AdicCompletion m (Ring A γ δ s t) ⊗[A] N,
        completionCoefficientTensor A γ δ s t p m h N x = z := by sorry
end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
/- END COMPLETED COEFFICIENT COMPARISON -/

/- BEGIN FINITE TWO-BASE COMPARISON -/

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t)) (n : ℕ)

/-- The finite coefficient ring has its actual completed-coefficient action. -/
@[instance_reducible]
def completionResidueAlgebra : Algebra (AdicCompletion p A) (A ⧸ p ^ n) := by
  sorry

lemma completionResidueAlgebra_map (a : AdicCompletion p A) :
    letI := completionResidueAlgebra A p n
    algebraMap (AdicCompletion p A) (A ⧸ p ^ n) a = AdicCompletion.evalₐ p n a := by
  sorry

lemma completionResidueAlgebra_of (a : A) :
    letI := completionResidueAlgebra A p n
    algebraMap (AdicCompletion p A) (A ⧸ p ^ n) (AdicCompletion.of p A a) =
      Ideal.Quotient.mk (p ^ n) a := by
  sorry

lemma completionResidueAlgebra_surjective :
    letI := completionResidueAlgebra A p n
    Function.Surjective (algebraMap (AdicCompletion p A) (A ⧸ p ^ n)) := by
  sorry

/-- The finite polynomial chart is an algebra over the actual finite coefficient ring. -/
@[instance_reducible]
def completionFiniteChartAlgebra (h : p ≤ m.comap (coefficientHom A γ δ s t)) :
    Algebra (A ⧸ p ^ n) ((Ring A γ δ s t) ⧸ m ^ n) := by
  sorry

lemma completionFiniteChartAlgebra_map (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (a : A ⧸ p ^ n) :
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    algebraMap (A ⧸ p ^ n) ((Ring A γ δ s t) ⧸ m ^ n) a =
      completionCoefficientLevel A γ δ s t p m h n a := by
  sorry

lemma completionFiniteChartAlgebra_mk (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (a : A) :
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    algebraMap (A ⧸ p ^ n) ((Ring A γ δ s t) ⧸ m ^ n)
      (Ideal.Quotient.mk (p ^ n) a) =
      Ideal.Quotient.mk (m ^ n) (coefficientHom A γ δ s t a) := by
  sorry

lemma completionFiniteChartAlgebra_family (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (a : AdicCompletion p A) :
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    algebraMap (A ⧸ p ^ n) ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n a) =
      completionCoefficientFamily A γ δ s t p m h n a := by
  sorry

/-- Finite generation identifies the kernel of the actual residue evaluation. -/
lemma completionResidueAlgebra_kernel (hp : p.FG) (a : AdicCompletion p A)
    (ha : AdicCompletion.evalₐ p n a = 0) :
    a ∈ p ^ n • (⊤ : Submodule A (AdicCompletion p A)) := by
  sorry

lemma completionFiniteCoefficient_original_smul
    (h : p ≤ m.comap (coefficientHom A γ δ s t)) (b : A)
    (q : ((Ring A γ δ s t) ⧸ m ^ n)) :
    b • q = completionCoefficientLevel A γ δ s t p m h n
      (Ideal.Quotient.mk (p ^ n) b) * q := by
  sorry

lemma completionFiniteCoefficient_annihilate (h : p ≤ m.comap (coefficientHom A γ δ s t)) (b : A) (hb : b ∈ p ^ n) (q : ((Ring A γ δ s t) ⧸ m ^ n)) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    b • q = 0 := by
  sorry

lemma completionFiniteCoefficient_tower (h : p ≤ m.comap (coefficientHom A γ δ s t)) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    IsScalarTower A (AdicCompletion p A) ((Ring A γ δ s t) ⧸ m ^ n) := by
  sorry

variable (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
variable [IsScalarTower A (AdicCompletion p A) N]

lemma completionFiniteTensor_kernel_vanish
    (h : p ≤ m.comap (coefficientHom A γ δ s t)) (c : AdicCompletion p A)
    (hc : c ∈ p ^ n • (⊤ : Submodule A (AdicCompletion p A))) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    q ⊗ₜ[A] (c • z) = 0 := by
  sorry

lemma completionFiniteTensor_balance_kernel
    (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t)) (a : AdicCompletion p A) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (a • q) ⊗ₜ[A] z = q ⊗ₜ[A] (a • z) := by
  sorry

lemma completionFiniteTensor_compatible
    (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t)) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    CompatibleSMul A (AdicCompletion p A) ((Ring A γ δ s t) ⧸ m ^ n) N := by
  sorry

/-- The finite nodal quotient comparison for every completed-coefficient module. -/
def completionFiniteTensorEquiv
    (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t)) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N) ≃ₗ[((Ring A γ δ s t) ⧸ m ^ n)] (((Ring A γ δ s t) ⧸ m ^ n) ⊗[AdicCompletion p A] N) := by
  sorry

lemma completionFiniteTensorEquiv_tmul (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t)) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    completionFiniteTensorEquiv A γ δ s t p m n N hp h (q ⊗ₜ[A] z) = q ⊗ₜ[AdicCompletion p A] z := by
  sorry

lemma completionFiniteTensorEquiv_symm_tmul (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t)) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (completionFiniteTensorEquiv A γ δ s t p m n N hp h).symm (q ⊗ₜ[AdicCompletion p A] z) = q ⊗ₜ[A] z := by
  sorry

lemma completionFiniteTensorEquiv_source (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (x :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (completionFiniteTensorEquiv A γ δ s t p m n N hp h).symm (completionFiniteTensorEquiv A γ δ s t p m n N hp h x) = x := by
  sorry

lemma completionFiniteTensorEquiv_target (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (x :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    ((Ring A γ δ s t) ⧸ m ^ n) ⊗[AdicCompletion p A] N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    completionFiniteTensorEquiv A γ δ s t p m n N hp h ((completionFiniteTensorEquiv A γ δ s t p m n N hp h).symm x) = x := by
  sorry

lemma completionFiniteTensorEquiv_balance (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t)) (a : AdicCompletion p A) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (a • q) ⊗ₜ[A] z = q ⊗ₜ[A] (a • z) := by
  sorry

variable (L : Type*) [AddCommGroup L] [Module ((Ring A γ δ s t) ⧸ m ^ n) L]

/-- Postcompose actual Hom targets with the finite coefficient equivalence. -/
def completionFiniteHomEquiv
    (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t)) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (L →ₗ[((Ring A γ δ s t) ⧸ m ^ n)] ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N) ≃ₗ[((Ring A γ δ s t) ⧸ m ^ n)]
      (L →ₗ[((Ring A γ δ s t) ⧸ m ^ n)] ((Ring A γ δ s t) ⧸ m ^ n) ⊗[AdicCompletion p A] N) := by
  sorry

lemma completionFiniteHomEquiv_apply (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (f :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (L →ₗ[((Ring A γ δ s t) ⧸ m ^ n)] ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N)) (x : L) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    completionFiniteHomEquiv A γ δ s t p m n N L hp h f x = completionFiniteTensorEquiv A γ δ s t p m n N hp h (f x) := by
  sorry

lemma completionFiniteHomEquiv_symm_apply (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (f :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (L →ₗ[((Ring A γ δ s t) ⧸ m ^ n)] ((Ring A γ δ s t) ⧸ m ^ n) ⊗[AdicCompletion p A] N)) (x : L) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (completionFiniteHomEquiv A γ δ s t p m n N L hp h).symm f x = (completionFiniteTensorEquiv A γ δ s t p m n N hp h).symm (f x) := by
  sorry

lemma completionFiniteHomEquiv_roundtrip (hp : p.FG) (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (f :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (L →ₗ[((Ring A γ δ s t) ⧸ m ^ n)] ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N)) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (completionFiniteHomEquiv A γ δ s t p m n N L hp h).symm (completionFiniteHomEquiv A γ δ s t p m n N L hp h f) = f := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel


namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t)) (n : ℕ)

-- test: NodeSectionFactorization.PolynomialModel.completionResidueAlgebra.test_native_evaluation
example (a : AdicCompletion p A) :
    letI := completionResidueAlgebra A p n
    algebraMap (AdicCompletion p A) (A ⧸ p ^ n) a = AdicCompletion.evalₐ p n a := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionResidueAlgebra.test_unit
example  :
    letI := completionResidueAlgebra A p n
    algebraMap (AdicCompletion p A) (A ⧸ p ^ n) (AdicCompletion.of p A (1 : A)) = 1 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionResidueAlgebra.test_zero
example  :
    letI := completionResidueAlgebra A p n
    algebraMap (AdicCompletion p A) (A ⧸ p ^ n) 0 = 0 := by
  sorry

variable (h : p ≤ m.comap (coefficientHom A γ δ s t))

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteChartAlgebra.test_original_coefficient
example (a : A) :
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    algebraMap (A ⧸ p ^ n) ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n) a) =
      Ideal.Quotient.mk (m ^ n) (coefficientHom A γ δ s t a) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteChartAlgebra.test_zero
example  :
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    algebraMap (A ⧸ p ^ n) ((Ring A γ δ s t) ⧸ m ^ n) 0 = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteChartAlgebra.test_completed_square
example (a : AdicCompletion p A) :
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    algebraMap (A ⧸ p ^ n) ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n a) =
      completionCoefficientFamily A γ δ s t p m h n a := by
  sorry

variable (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
variable [IsScalarTower A (AdicCompletion p A) N]
variable (hp : p.FG)

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorEquiv.test_forward_pure
example (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    completionFiniteTensorEquiv A γ δ s t p m n N hp h (q ⊗ₜ[A] z) = q ⊗ₜ[AdicCompletion p A] z := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorEquiv.test_inverse_pure
example (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (completionFiniteTensorEquiv A γ δ s t p m n N hp h).symm (q ⊗ₜ[AdicCompletion p A] z) = q ⊗ₜ[A] z := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorEquiv.test_completed_balancing
example (a : AdicCompletion p A) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (a • q) ⊗ₜ[A] z = q ⊗ₜ[A] (a • z) := by
  sorry

variable (L : Type*) [AddCommGroup L] [Module ((Ring A γ δ s t) ⧸ m ^ n) L]

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteHomEquiv.test_zero
example  :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    completionFiniteHomEquiv A γ δ s t p m n N L hp h (0 : L →ₗ[((Ring A γ δ s t) ⧸ m ^ n)] ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N) = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteHomEquiv.test_roundtrip
example (f :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    L →ₗ[((Ring A γ δ s t) ⧸ m ^ n)] ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (completionFiniteHomEquiv A γ δ s t p m n N L hp h).symm (completionFiniteHomEquiv A γ δ s t p m n N L hp h f) = f := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteHomEquiv.test_section_target
example (f :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    (((Ring A γ δ s t) ⧸ m ^ n) ⊗[Ring A γ δ s t] (sectionIdeal A γ δ s t)) →ₗ[((Ring A γ δ s t) ⧸ m ^ n)] ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N)
    (x : (((Ring A γ δ s t) ⧸ m ^ n) ⊗[Ring A γ δ s t] (sectionIdeal A γ δ s t))) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    completionFiniteHomEquiv A γ δ s t p m n N (((Ring A γ δ s t) ⧸ m ^ n) ⊗[Ring A γ δ s t] (sectionIdeal A γ δ s t)) hp h f x =
      completionFiniteTensorEquiv A γ δ s t p m n N hp h (f x) := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
/- END FINITE TWO-BASE COMPARISON -/

/- BEGIN FINITE TWO-BASE COHERENCE -/
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct
set_option linter.style.haveILetI false
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t))
variable (h : p ≤ m.comap (coefficientHom A γ δ s t))
variable {i j k : ℕ}

def completionFiniteTransition (hij : i ≤ j) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    ((Ring A γ δ s t) ⧸ m ^ j) →ₐ[AdicCompletion p A] ((Ring A γ δ s t) ⧸ m ^ i) := by
  sorry

lemma completionFiniteTransition_toRingHom (hij : i ≤ j) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    (completionFiniteTransition A γ δ s t p m h hij).toRingHom = Ideal.Quotient.factorPow m hij := by
  sorry

lemma completionFiniteTransition_refl (n : ℕ) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    completionFiniteTransition A γ δ s t p m h (i := n) (le_refl n) = AlgHom.id (AdicCompletion p A) ((Ring A γ δ s t) ⧸ m ^ n) := by
  sorry

lemma completionFiniteTransition_comp (hij : i ≤ j) (hjk : j ≤ k) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionResidueAlgebra A p k
    letI := completionFiniteChartAlgebra A γ δ s t p m k h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ k) (Ideal.Quotient.mk (p ^ k))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ k) (AdicCompletion.evalₐ p k).toRingHom
    (completionFiniteTransition A γ δ s t p m h hij).comp (completionFiniteTransition A γ δ s t p m h hjk) = completionFiniteTransition A γ δ s t p m h (le_trans hij hjk) := by
  sorry

lemma completionFiniteTransition_smul (hij : i ≤ j) (a : AdicCompletion p A) (q : ((Ring A γ δ s t) ⧸ m ^ j)) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    completionFiniteTransition A γ δ s t p m h hij (a • q) = a • completionFiniteTransition A γ δ s t p m h hij q := by
  sorry

variable (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
variable [IsScalarTower A (AdicCompletion p A) N]
variable (hp : p.FG)

lemma completionFiniteTensorEquiv_transition (hij : i ≤ j) (x :
      letI := completionResidueAlgebra A p j
      letI := completionFiniteChartAlgebra A γ δ s t p m j h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
      ((Ring A γ δ s t) ⧸ m ^ j) ⊗[A] N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    completionFiniteTensorEquiv A γ δ s t p m i N hp h (((completionFiniteTransition A γ δ s t p m h hij).toLinearMap.restrictScalars A).rTensor N x) =
      (completionFiniteTransition A γ δ s t p m h hij).toLinearMap.rTensor N (completionFiniteTensorEquiv A γ δ s t p m j N hp h x) := by
  sorry

lemma completionFiniteTensorEquiv_symm_transition (hij : i ≤ j) (x :
      letI := completionResidueAlgebra A p j
      letI := completionFiniteChartAlgebra A γ δ s t p m j h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
      ((Ring A γ δ s t) ⧸ m ^ j) ⊗[AdicCompletion p A] N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    (completionFiniteTensorEquiv A γ δ s t p m i N hp h).symm ((completionFiniteTransition A γ δ s t p m h hij).toLinearMap.rTensor N x) =
      ((completionFiniteTransition A γ δ s t p m h hij).toLinearMap.restrictScalars A).rTensor N ((completionFiniteTensorEquiv A γ δ s t p m j N hp h).symm x) := by
  sorry

variable (N' : Type*) [AddCommGroup N'] [Module A N'] [Module (AdicCompletion p A) N']
variable [IsScalarTower A (AdicCompletion p A) N']

lemma completionFiniteTensorEquiv_coefficient (n : ℕ) (f : N →ₗ[AdicCompletion p A] N') (x :
      letI := completionResidueAlgebra A p n
      letI := completionFiniteChartAlgebra A γ δ s t p m n h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
      ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    completionFiniteTensorEquiv A γ δ s t p m n N' hp h ((f.restrictScalars A).lTensor ((Ring A γ δ s t) ⧸ m ^ n) x) =
      f.lTensor ((Ring A γ δ s t) ⧸ m ^ n) (completionFiniteTensorEquiv A γ δ s t p m n N hp h x) := by
  sorry

lemma completionFiniteTensorEquiv_symm_coefficient (n : ℕ) (f : N →ₗ[AdicCompletion p A] N') (x :
      letI := completionResidueAlgebra A p n
      letI := completionFiniteChartAlgebra A γ δ s t p m n h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
      ((Ring A γ δ s t) ⧸ m ^ n) ⊗[AdicCompletion p A] N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorEquiv A γ δ s t p m n N' hp h).symm (f.lTensor ((Ring A γ δ s t) ⧸ m ^ n) x) =
      (f.restrictScalars A).lTensor ((Ring A γ δ s t) ⧸ m ^ n) ((completionFiniteTensorEquiv A γ δ s t p m n N hp h).symm x) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTransition.test_representative
example (hij : i ≤ j) (r : Ring A γ δ s t) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    completionFiniteTransition A γ δ s t p m h hij (Ideal.Quotient.mk (m ^ j) r) = Ideal.Quotient.mk (m ^ i) r := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTransition.test_zero_level
example (j : ℕ) (q : ((Ring A γ δ s t) ⧸ m ^ j)) :
    letI := completionResidueAlgebra A p 0
    letI := completionFiniteChartAlgebra A γ δ s t p m 0 h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ 0) (Ideal.Quotient.mk (p ^ 0))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ 0) (AdicCompletion.evalₐ p 0).toRingHom
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    completionFiniteTransition A γ δ s t p m h (Nat.zero_le j) q = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTransition.test_completed_scalar
example (hij : i ≤ j) (a : AdicCompletion p A) (q : ((Ring A γ δ s t) ⧸ m ^ j)) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    completionFiniteTransition A γ δ s t p m h hij (a • q) = a • completionFiniteTransition A γ δ s t p m h hij q := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorEquiv.test_arbitrary_transition
example (hij : i ≤ j) (x :
      letI := completionResidueAlgebra A p j
      letI := completionFiniteChartAlgebra A γ δ s t p m j h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
      ((Ring A γ δ s t) ⧸ m ^ j) ⊗[A] N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    completionFiniteTensorEquiv A γ δ s t p m i N hp h (((completionFiniteTransition A γ δ s t p m h hij).toLinearMap.restrictScalars A).rTensor N x) =
      (completionFiniteTransition A γ δ s t p m h hij).toLinearMap.rTensor N (completionFiniteTensorEquiv A γ δ s t p m j N hp h x) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorEquiv.test_coefficient_naturality
example (n : ℕ) (f : N →ₗ[AdicCompletion p A] N') (x :
      letI := completionResidueAlgebra A p n
      letI := completionFiniteChartAlgebra A γ δ s t p m n h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
      ((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    completionFiniteTensorEquiv A γ δ s t p m n N' hp h ((f.restrictScalars A).lTensor ((Ring A γ δ s t) ⧸ m ^ n) x) =
      f.lTensor ((Ring A γ δ s t) ⧸ m ^ n) (completionFiniteTensorEquiv A γ δ s t p m n N hp h x) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorEquiv.test_inverse_coefficient
example (n : ℕ) (f : N →ₗ[AdicCompletion p A] N') (x :
      letI := completionResidueAlgebra A p n
      letI := completionFiniteChartAlgebra A γ δ s t p m n h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
      ((Ring A γ δ s t) ⧸ m ^ n) ⊗[AdicCompletion p A] N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorEquiv A γ δ s t p m n N' hp h).symm (f.lTensor ((Ring A γ δ s t) ⧸ m ^ n) x) =
      (f.restrictScalars A).lTensor ((Ring A γ δ s t) ⧸ m ^ n) ((completionFiniteTensorEquiv A γ δ s t p m n N hp h).symm x) := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
/- END FINITE TWO-BASE COHERENCE -/

/- BEGIN FINITE TENSOR LIMIT COMPARISON -/
namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct CategoryTheory CategoryTheory.Limits Opposite
set_option maxHeartbeats 2000000
set_option linter.style.haveILetI false
set_option backward.isDefEq.respectTransparency true
set_option backward.isDefEq.respectTransparency.types true
set_option autoImplicit false
attribute [local instance 100] ModuleCat.isModule

def completionFiniteTensorDiagramA (A : Type*) [CommRing A] (γ δ s t : A)
    (p : Ideal A) (m : Ideal (Ring A γ δ s t))
    (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
    [IsScalarTower A (AdicCompletion p A) N] : ℕᵒᵖ ⥤ ModuleCat A := by
  refine {
    obj := fun n =>
      letI := completionResidueAlgebra A p n.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m n.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n.unop) (Ideal.Quotient.mk (p ^ n.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n.unop) (AdicCompletion.evalₐ p n.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m n.unop h
      ModuleCat.of A (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[A] N)
    map := fun {i j} f => by
      letI := completionResidueAlgebra A p i.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m i.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i.unop) (Ideal.Quotient.mk (p ^ i.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i.unop) (AdicCompletion.evalₐ p i.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m i.unop h
      letI := completionResidueAlgebra A p j.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m j.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j.unop) (Ideal.Quotient.mk (p ^ j.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j.unop) (AdicCompletion.evalₐ p j.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m j.unop h
      set_option backward.isDefEq.respectTransparency false in
      set_option backward.isDefEq.respectTransparency.types false in
      exact ModuleCat.ofHom (((completionFiniteTransition A γ δ s t p m h (leOfHom f.unop)).toLinearMap.restrictScalars A).rTensor N)
    map_id := ?_
    map_comp := ?_ }
  · sorry
  · sorry


def completionFiniteTensorDiagramComplete (A : Type*) [CommRing A] (γ δ s t : A)
    (p : Ideal A) (m : Ideal (Ring A γ δ s t))
    (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
    [IsScalarTower A (AdicCompletion p A) N] : ℕᵒᵖ ⥤ ModuleCat A := by
  refine {
    obj := fun n =>
      letI := completionResidueAlgebra A p n.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m n.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n.unop) (Ideal.Quotient.mk (p ^ n.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n.unop) (AdicCompletion.evalₐ p n.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m n.unop h
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).obj (ModuleCat.of (AdicCompletion p A) (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[AdicCompletion p A] N))
    map := fun {i j} f => by
      letI := completionResidueAlgebra A p i.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m i.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i.unop) (Ideal.Quotient.mk (p ^ i.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i.unop) (AdicCompletion.evalₐ p i.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m i.unop h
      letI := completionResidueAlgebra A p j.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m j.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j.unop) (Ideal.Quotient.mk (p ^ j.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j.unop) (AdicCompletion.evalₐ p j.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m j.unop h
      set_option backward.isDefEq.respectTransparency false in
      set_option backward.isDefEq.respectTransparency.types false in
      exact ((ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).map (ModuleCat.ofHom ((completionFiniteTransition A γ δ s t p m h (leOfHom f.unop)).toLinearMap.rTensor N)))
    map_id := ?_
    map_comp := ?_ }
  · sorry
  · sorry


def completionFiniteTensorDiagramIso (A : Type*) [CommRing A] (γ δ s t : A)
    (p : Ideal A) (m : Ideal (Ring A γ δ s t))
    (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
    [IsScalarTower A (AdicCompletion p A) N] (hp : p.FG) :
    completionFiniteTensorDiagramA A γ δ s t p m h N ≅
      completionFiniteTensorDiagramComplete A γ δ s t p m h N := by
  refine NatIso.ofComponents (fun n => ?_) ?_
  · letI := completionResidueAlgebra A p n.unop
    letI := completionFiniteChartAlgebra A γ δ s t p m n.unop h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n.unop) (Ideal.Quotient.mk (p ^ n.unop))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n.unop) (AdicCompletion.evalₐ p n.unop).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n.unop h
    let e := completionFiniteTensorEquiv A γ δ s t p m n.unop N hp h
    change ModuleCat.of A (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[A] N) ≅
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).obj
        (ModuleCat.of (AdicCompletion p A) (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[AdicCompletion p A] N))
    refine {
      hom := ModuleCat.ofHom (X := ModuleCat.of A (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[A] N))
        (Y := (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).obj
          (ModuleCat.of (AdicCompletion p A) (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[AdicCompletion p A] N)))
        { toFun := e, map_add' := e.map_add, map_smul' := ?_ }
      inv := ModuleCat.ofHom (X := (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).obj
          (ModuleCat.of (AdicCompletion p A) (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[AdicCompletion p A] N)))
        (Y := ModuleCat.of A (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[A] N))
        { toFun := e.symm, map_add' := e.symm.map_add, map_smul' := ?_ }
      hom_inv_id := ?_
      inv_hom_id := ?_ }
    · sorry
    · sorry
    · sorry
    · sorry
  · sorry


def completionFiniteTensorLimitIso (A : Type*) [CommRing A] (γ δ s t : A)
    (p : Ideal A) (m : Ideal (Ring A γ δ s t))
    (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
    [IsScalarTower A (AdicCompletion p A) N] (hp : p.FG) :
    limit (completionFiniteTensorDiagramA A γ δ s t p m h N) ≅
      limit (completionFiniteTensorDiagramComplete A γ δ s t p m h N) :=
  HasLimit.isoOfNatIso (completionFiniteTensorDiagramIso A γ δ s t p m h N hp)

variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t))
variable (h : p ≤ m.comap (coefficientHom A γ δ s t))
variable (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
variable [IsScalarTower A (AdicCompletion p A) N]

lemma completionFiniteTensorDiagramA_obj (n : ℕ) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorDiagramA A γ δ s t p m h N).obj (op n) = ModuleCat.of A (((Ring A γ δ s t) ⧸ m ^ n) ⊗[A] N) := by
  sorry

lemma completionFiniteTensorDiagramA_map_tmul {i j : ℕ} (hij : i ≤ j) (q : ((Ring A γ δ s t) ⧸ m ^ j)) (z : N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    (completionFiniteTensorDiagramA A γ δ s t p m h N).map (homOfLE hij).op (q ⊗ₜ[A] z) =
      completionFiniteTransition A γ δ s t p m h hij q ⊗ₜ[A] z := by
  sorry

lemma completionFiniteTensorDiagramA_map_id (n : ℕ) :
    (completionFiniteTensorDiagramA A γ δ s t p m h N).map (𝟙 (op n)) = 𝟙 ((completionFiniteTensorDiagramA A γ δ s t p m h N).obj (op n)) := by
  sorry

lemma completionFiniteTensorDiagramA_map_comp {i j k : ℕ} (hij : i ≤ j) (hjk : j ≤ k) :
    (completionFiniteTensorDiagramA A γ δ s t p m h N).map ((homOfLE hjk).op ≫ (homOfLE hij).op) =
      (completionFiniteTensorDiagramA A γ δ s t p m h N).map (homOfLE hjk).op ≫ (completionFiniteTensorDiagramA A γ δ s t p m h N).map (homOfLE hij).op := by
  sorry

lemma completionFiniteTensorDiagramComplete_obj (n : ℕ) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op n) = (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).obj (ModuleCat.of (AdicCompletion p A) (((Ring A γ δ s t) ⧸ m ^ n) ⊗[AdicCompletion p A] N)) := by
  sorry

lemma completionFiniteTensorDiagramComplete_map_tmul {i j : ℕ} (hij : i ≤ j) (q : ((Ring A γ δ s t) ⧸ m ^ j)) (z : N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE hij).op (q ⊗ₜ[AdicCompletion p A] z) =
      completionFiniteTransition A γ δ s t p m h hij q ⊗ₜ[AdicCompletion p A] z := by
  sorry

lemma completionFiniteTensorDiagramComplete_map_id (n : ℕ) :
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (𝟙 (op n)) = 𝟙 ((completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op n)) := by
  sorry

lemma completionFiniteTensorDiagramComplete_map_comp {i j k : ℕ} (hij : i ≤ j) (hjk : j ≤ k) :
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map ((homOfLE hjk).op ≫ (homOfLE hij).op) =
      (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE hjk).op ≫ (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE hij).op := by
  sorry

lemma completionFiniteTensorDiagramIso_hom_tmul (hp : p.FG) (n : ℕ) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) (q ⊗ₜ[A] z) = q ⊗ₜ[AdicCompletion p A] z := by
  sorry

lemma completionFiniteTensorDiagramIso_inv_tmul (hp : p.FG) (n : ℕ) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) (q ⊗ₜ[AdicCompletion p A] z) = q ⊗ₜ[A] z := by
  sorry

lemma completionFiniteTensorDiagramIso_naturality (hp : p.FG) {i j : ℕ} (hij : i ≤ j) :
    (completionFiniteTensorDiagramA A γ δ s t p m h N).map (homOfLE hij).op ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op i) =
      (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op j) ≫ (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE hij).op := by
  sorry

lemma completionFiniteTensorDiagramIso_inverse_naturality (hp : p.FG) {i j : ℕ} (hij : i ≤ j) :
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE hij).op ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op i) =
      (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op j) ≫ (completionFiniteTensorDiagramA A γ δ s t p m h N).map (homOfLE hij).op := by
  sorry

lemma completionFiniteTensorDiagramIso_left (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) = 𝟙 ((completionFiniteTensorDiagramA A γ δ s t p m h N).obj (op n)) := by
  sorry

lemma completionFiniteTensorDiagramIso_right (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) = 𝟙 ((completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op n)) := by
  sorry

lemma completionFiniteTensorLimitIso_hom_projection (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorLimitIso A γ δ s t p m h N hp).hom ≫ limit.π (completionFiniteTensorDiagramComplete A γ δ s t p m h N) (op n) =
      limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) := by
  sorry

lemma completionFiniteTensorLimitIso_inv_projection (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorLimitIso A γ δ s t p m h N hp).inv ≫ limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) =
      limit.π (completionFiniteTensorDiagramComplete A γ δ s t p m h N) (op n) ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) := by
  sorry

lemma completionFiniteTensorLimitIso_left (hp : p.FG) :
    (completionFiniteTensorLimitIso A γ δ s t p m h N hp).hom ≫ (completionFiniteTensorLimitIso A γ δ s t p m h N hp).inv = 𝟙 (limit (completionFiniteTensorDiagramA A γ δ s t p m h N)) := by
  sorry

lemma completionFiniteTensorLimitIso_right (hp : p.FG) :
    (completionFiniteTensorLimitIso A γ δ s t p m h N hp).inv ≫ (completionFiniteTensorLimitIso A γ δ s t p m h N hp).hom = 𝟙 (limit (completionFiniteTensorDiagramComplete A γ δ s t p m h N)) := by
  sorry

lemma completionFiniteTensorLimitIso_unique (hp : p.FG) (f : limit (completionFiniteTensorDiagramA A γ δ s t p m h N) ⟶ limit (completionFiniteTensorDiagramComplete A γ δ s t p m h N))
    (hf : ∀ n : ℕ, f ≫ limit.π (completionFiniteTensorDiagramComplete A γ δ s t p m h N) (op n) =
      limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n)) :
    f = (completionFiniteTensorLimitIso A γ δ s t p m h N hp).hom := by
  sorry

lemma completionFiniteTensorLimitIso_lift (hp : p.FG) (c : Cone (completionFiniteTensorDiagramA A γ δ s t p m h N)) :
    limit.lift (completionFiniteTensorDiagramA A γ δ s t p m h N) c ≫ (completionFiniteTensorLimitIso A γ δ s t p m h N hp).hom =
      limit.lift (completionFiniteTensorDiagramComplete A γ δ s t p m h N) ((Cone.postcompose (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom).obj c) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramA.test_map_tmul
example {i j : ℕ} (hij : i ≤ j) (q : ((Ring A γ δ s t) ⧸ m ^ j)) (z : N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    (completionFiniteTensorDiagramA A γ δ s t p m h N).map (homOfLE hij).op (q ⊗ₜ[A] z) =
      completionFiniteTransition A γ δ s t p m h hij q ⊗ₜ[A] z := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramA.test_map_id
example (n : ℕ) :
    (completionFiniteTensorDiagramA A γ δ s t p m h N).map (𝟙 (op n)) = 𝟙 ((completionFiniteTensorDiagramA A γ δ s t p m h N).obj (op n)) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramA.test_zero_level
example (j : ℕ) (x : (completionFiniteTensorDiagramA A γ δ s t p m h N).obj (op j)) :
    (completionFiniteTensorDiagramA A γ δ s t p m h N).map (homOfLE (Nat.zero_le j)).op x = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramComplete.test_map_tmul
example {i j : ℕ} (hij : i ≤ j) (q : ((Ring A γ δ s t) ⧸ m ^ j)) (z : N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE hij).op (q ⊗ₜ[AdicCompletion p A] z) =
      completionFiniteTransition A γ δ s t p m h hij q ⊗ₜ[AdicCompletion p A] z := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramComplete.test_map_id
example (n : ℕ) :
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (𝟙 (op n)) = 𝟙 ((completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op n)) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramComplete.test_zero_level
example (j : ℕ) (x : (completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op j)) :
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE (Nat.zero_le j)).op x = 0 := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramIso.test_hom_tmul
example (hp : p.FG) (n : ℕ) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) (q ⊗ₜ[A] z) = q ⊗ₜ[AdicCompletion p A] z := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramIso.test_inv_tmul
example (hp : p.FG) (n : ℕ) (q : ((Ring A γ δ s t) ⧸ m ^ n)) (z : N) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) (q ⊗ₜ[AdicCompletion p A] z) = q ⊗ₜ[A] z := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramIso.test_left
example (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) = 𝟙 ((completionFiniteTensorDiagramA A γ δ s t p m h N).obj (op n)) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitIso.test_hom_projection
example (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorLimitIso A γ δ s t p m h N hp).hom ≫ limit.π (completionFiniteTensorDiagramComplete A γ δ s t p m h N) (op n) =
      limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitIso.test_inv_projection
example (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorLimitIso A γ δ s t p m h N hp).inv ≫ limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) =
      limit.π (completionFiniteTensorDiagramComplete A γ δ s t p m h N) (op n) ≫ (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) := by
  sorry

-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitIso.test_lift
example (hp : p.FG) (c : Cone (completionFiniteTensorDiagramA A γ δ s t p m h N)) :
    limit.lift (completionFiniteTensorDiagramA A γ δ s t p m h N) c ≫ (completionFiniteTensorLimitIso A γ δ s t p m h N hp).hom =
      limit.lift (completionFiniteTensorDiagramComplete A γ δ s t p m h N) ((Cone.postcompose (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom).obj c) := by
  sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
/- END FINITE TENSOR LIMIT COMPARISON -/

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct CategoryTheory CategoryTheory.Limits Opposite
set_option maxHeartbeats 2000000
set_option autoImplicit false
set_option linter.style.haveILetI false
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
attribute [local instance 100] ModuleCat.isModule
def completionFiniteTensorDiagramCompleted (A : Type*) [CommRing A] (γ δ s t : A)
    (p : Ideal A) (m : Ideal (Ring A γ δ s t))
    (h : p ≤ m.comap (coefficientHom A γ δ s t))
    (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
    [IsScalarTower A (AdicCompletion p A) N] : ℕᵒᵖ ⥤ ModuleCat (AdicCompletion p A) := by
  refine {
    obj := fun n =>
      letI := completionResidueAlgebra A p n.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m n.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n.unop) (Ideal.Quotient.mk (p ^ n.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n.unop) (AdicCompletion.evalₐ p n.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m n.unop h
      ModuleCat.of (AdicCompletion p A) (((Ring A γ δ s t) ⧸ m ^ n.unop) ⊗[AdicCompletion p A] N)
    map := fun {i j} f => by
      letI := completionResidueAlgebra A p i.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m i.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i.unop) (Ideal.Quotient.mk (p ^ i.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i.unop) (AdicCompletion.evalₐ p i.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m i.unop h
      letI := completionResidueAlgebra A p j.unop
      letI := completionFiniteChartAlgebra A γ δ s t p m j.unop h
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j.unop) (Ideal.Quotient.mk (p ^ j.unop))
      letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j.unop) (AdicCompletion.evalₐ p j.unop).toRingHom
      letI := completionFiniteCoefficient_tower A γ δ s t p m j.unop h
      set_option backward.isDefEq.respectTransparency false in
      set_option backward.isDefEq.respectTransparency.types false in
      exact ModuleCat.ofHom ((completionFiniteTransition A γ δ s t p m h (leOfHom f.unop)).toLinearMap.rTensor N)
    map_id := by sorry
    map_comp := by sorry }

variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t))
variable (h : p ≤ m.comap (coefficientHom A γ δ s t))
variable (N : Type*) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
variable [IsScalarTower A (AdicCompletion p A) N]

def completionFiniteTensorDiagramRestrictionIso :
    completionFiniteTensorDiagramComplete A γ δ s t p m h N ≅
      completionFiniteTensorDiagramCompleted A γ δ s t p m h N ⋙
        ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A)) := by
  refine NatIso.ofComponents (fun n => Iso.refl _) ?_
  intro i j f
  rfl
def completionFiniteTensorLimitCompletedIso (hp : p.FG) :
    limit (completionFiniteTensorDiagramA A γ δ s t p m h N) ≅
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).obj
        (limit (completionFiniteTensorDiagramCompleted A γ δ s t p m h N)) :=
  (completionFiniteTensorLimitIso A γ δ s t p m h N hp).trans
    ((HasLimit.isoOfNatIso (completionFiniteTensorDiagramRestrictionIso A γ δ s t p m h N)).trans
      (preservesLimitIso (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A)))
        (completionFiniteTensorDiagramCompleted A γ δ s t p m h N)).symm)
lemma completionFiniteTensorDiagramCompleted_obj (n : ℕ) :
    letI := completionResidueAlgebra A p n
    letI := completionFiniteChartAlgebra A γ δ s t p m n h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m n h
    (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).obj (op n) = ModuleCat.of (AdicCompletion p A) (((Ring A γ δ s t) ⧸ m ^ n) ⊗[AdicCompletion p A] N) := by sorry
lemma completionFiniteTensorDiagramCompleted_map_tmul {i j : ℕ} (hij : i ≤ j) (q : ((Ring A γ δ s t) ⧸ m ^ j)) (z : N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).map (homOfLE hij).op (q ⊗ₜ[AdicCompletion p A] z) =
      completionFiniteTransition A γ δ s t p m h hij q ⊗ₜ[AdicCompletion p A] z := by sorry
lemma completionFiniteTensorDiagramCompleted_map_zero (j : ℕ)
    (x : (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).obj (op j)) :
    (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).map (homOfLE (Nat.zero_le j)).op x = 0 := by sorry
lemma completionFiniteTensorDiagramRestrictionIso_hom (n : ℕ) :
    (completionFiniteTensorDiagramRestrictionIso A γ δ s t p m h N).hom.app (op n) =
      𝟙 ((completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op n)) := by sorry
lemma completionFiniteTensorDiagramRestrictionIso_inv (n : ℕ) :
    (completionFiniteTensorDiagramRestrictionIso A γ δ s t p m h N).inv.app (op n) =
      𝟙 ((completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op n)) := by sorry
lemma completionFiniteTensorDiagramRestrictionIso_map {i j : ℕ} (hij : i ≤ j) :
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE hij).op =
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).map
        ((completionFiniteTensorDiagramCompleted A γ δ s t p m h N).map (homOfLE hij).op) := by sorry
lemma completionFiniteTensorLimitCompletedIso_hom_projection (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).hom ≫
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).map
        (limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m h N) (op n)) =
      limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) ≫
        (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) := by sorry
lemma completionFiniteTensorLimitCompletedIso_inv_projection (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).inv ≫
      limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) =
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).map
        (limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m h N) (op n)) ≫
        (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) := by sorry
lemma completionFiniteTensorLimitCompletedIso_left (hp : p.FG) :
    (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).hom ≫
      (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).inv =
        𝟙 (limit (completionFiniteTensorDiagramA A γ δ s t p m h N)) := by sorry
@[instance_reducible]
def completionFiniteTensorLimitModule (hp : p.FG) :
    Module (AdicCompletion p A) (↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :=
  (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).toLinearEquiv.toAddEquiv.module (AdicCompletion p A)
def completionFiniteTensorLimitLinearEquiv (hp : p.FG) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    (↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) ≃ₗ[AdicCompletion p A]
      (↑(limit (completionFiniteTensorDiagramCompleted A γ δ s t p m h N))) :=
  (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).toLinearEquiv.toAddEquiv.linearEquiv (AdicCompletion p A)
lemma completionFiniteTensorLimitModule_tower (hp : p.FG) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    IsScalarTower A (AdicCompletion p A) (↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) := by sorry
lemma completionFiniteTensorLimitModule_smul (hp : p.FG) (b : AdicCompletion p A)
    (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).hom (b • x) =
      b • (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).hom x := by sorry
lemma completionFiniteTensorLimitModule_coefficient (hp : p.FG) (a : A)
    (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    algebraMap A (AdicCompletion p A) a • x = a • x := by sorry
lemma completionFiniteTensorLimitLinearEquiv_apply (hp : p.FG)
    (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp x =
      (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).hom x := by sorry
lemma completionFiniteTensorLimitLinearEquiv_symm_apply (hp : p.FG)
    (y : ↑(limit (completionFiniteTensorDiagramCompleted A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    (completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp).symm y =
      (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).inv y := by sorry
lemma completionFiniteTensorLimitLinearEquiv_projection_smul (hp : p.FG) (n : ℕ)
    (b : AdicCompletion p A) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m h N) (op n)
      (completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp (b • x)) =
      b • limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m h N) (op n)
        (completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp x) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramCompleted.test_map_tmul
example {i j : ℕ} (hij : i ≤ j) (q : ((Ring A γ δ s t) ⧸ m ^ j)) (z : N) :
    letI := completionResidueAlgebra A p i
    letI := completionFiniteChartAlgebra A γ δ s t p m i h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (Ideal.Quotient.mk (p ^ i))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ i) (AdicCompletion.evalₐ p i).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m i h
    letI := completionResidueAlgebra A p j
    letI := completionFiniteChartAlgebra A γ δ s t p m j h
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (Ideal.Quotient.mk (p ^ j))
    letI := Algebra.compHom ((Ring A γ δ s t) ⧸ m ^ j) (AdicCompletion.evalₐ p j).toRingHom
    letI := completionFiniteCoefficient_tower A γ δ s t p m j h
    (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).map (homOfLE hij).op (q ⊗ₜ[AdicCompletion p A] z) =
      completionFiniteTransition A γ δ s t p m h hij q ⊗ₜ[AdicCompletion p A] z := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramCompleted.test_zero_level
example (j : ℕ)
    (x : (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).obj (op j)) :
    (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).map (homOfLE (Nat.zero_le j)).op x = 0 := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramCompleted.test_completed_scalar
example {i j : ℕ} (hij : i ≤ j) (b : AdicCompletion p A)
    (x : (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).obj (op j)) :
    (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).map (homOfLE hij).op (b • x) =
      b • (completionFiniteTensorDiagramCompleted A γ δ s t p m h N).map (homOfLE hij).op x := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramRestrictionIso.test_identity_component
example (n : ℕ) :
    (completionFiniteTensorDiagramRestrictionIso A γ δ s t p m h N).hom.app (op n) =
      𝟙 ((completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op n)) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramRestrictionIso.test_inverse_component
example (n : ℕ) :
    (completionFiniteTensorDiagramRestrictionIso A γ δ s t p m h N).inv.app (op n) =
      𝟙 ((completionFiniteTensorDiagramComplete A γ δ s t p m h N).obj (op n)) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorDiagramRestrictionIso.test_actual_transition
example {i j : ℕ} (hij : i ≤ j) :
    (completionFiniteTensorDiagramComplete A γ δ s t p m h N).map (homOfLE hij).op =
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).map
        ((completionFiniteTensorDiagramCompleted A γ δ s t p m h N).map (homOfLE hij).op) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitCompletedIso.test_forward_projection
example (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).hom ≫
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).map
        (limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m h N) (op n)) =
      limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) ≫
        (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).hom.app (op n) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitCompletedIso.test_inverse_projection
example (hp : p.FG) (n : ℕ) :
    (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).inv ≫
      limit.π (completionFiniteTensorDiagramA A γ δ s t p m h N) (op n) =
      (ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).map
        (limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m h N) (op n)) ≫
        (completionFiniteTensorDiagramIso A γ δ s t p m h N hp).inv.app (op n) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitCompletedIso.test_right_inverse
example (hp : p.FG) :
    (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).inv ≫
      (completionFiniteTensorLimitCompletedIso A γ δ s t p m h N hp).hom =
      𝟙 ((ModuleCat.restrictScalars (algebraMap A (AdicCompletion p A))).obj
        (limit (completionFiniteTensorDiagramCompleted A γ δ s t p m h N))) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitModule.test_zero_scalar
example (hp : p.FG) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    (0 : AdicCompletion p A) • x = 0 := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitModule.test_original_scalar_association
example (hp : p.FG) (a : A) (b : AdicCompletion p A)
    (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    (a • b) • x = a • (b • x) := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitModule.test_original_coefficient
example (hp : p.FG) (a : A)
    (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    algebraMap A (AdicCompletion p A) a • x = a • x := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitLinearEquiv.test_forward_inverse
example (hp : p.FG) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    (completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp).symm
      (completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp x) = x := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitLinearEquiv.test_inverse_forward
example (hp : p.FG) (y : ↑(limit (completionFiniteTensorDiagramCompleted A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp
      ((completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp).symm y) = y := by sorry
-- test: NodeSectionFactorization.PolynomialModel.completionFiniteTensorLimitLinearEquiv.test_projection_scalar
example (hp : p.FG) (n : ℕ)
    (b : AdicCompletion p A) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m h N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m h N hp
    limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m h N) (op n)
      (completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp (b • x)) =
      b • limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m h N) (op n)
        (completionFiniteTensorLimitLinearEquiv A γ δ s t p m h N hp x) := by sorry
end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct CategoryTheory CategoryTheory.Limits Opposite
set_option maxHeartbeats 2000000
set_option autoImplicit false
set_option linter.style.haveILetI false
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
attribute [local instance 100] ModuleCat.isModule
variable (A : Type*) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t))
variable [H : Fact (p ≤ m.comap (coefficientHom A γ δ s t))]
local notation "AH" => AdicCompletion p A
local notation "RR" => Ring A γ δ s t
local notation "RH" => AdicCompletion m RR
local instance : Algebra AH RH := completionCoefficientAlgebra A γ δ s t p m H.out
local instance (n : ℕ) : Algebra AH (RR ⧸ m ^ n) :=
  letI := completionResidueAlgebra A p n
  letI := completionFiniteChartAlgebra A γ δ s t p m n H.out
  letI := Algebra.compHom (RR ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
  Algebra.compHom (RR ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom

def completionChartEval (n : ℕ) : RH →ₐ[AH] (RR ⧸ m ^ n) := by sorry

lemma completionChartEval_apply (n : ℕ) (r : RH) :
    completionChartEval A γ δ s t p m n r = AdicCompletion.evalₐ m n r := by sorry

lemma completionChartEval_transition {i j : ℕ} (hij : i ≤ j) (r : RH) :
    completionFiniteTransition A γ δ s t p m H.out hij
      (completionChartEval A γ δ s t p m j r) =
        completionChartEval A γ δ s t p m i r := by sorry

def completionChartAssemble (f : ∀ n : ℕ, RR ⧸ m ^ n)
    (hf : ∀ {i j : ℕ} (hij : i ≤ j), Ideal.Quotient.factorPow m hij (f j) = f i) : RH := by sorry

lemma completionChartAssemble_eval (f : ∀ n : ℕ, RR ⧸ m ^ n)
    (hf : ∀ {i j : ℕ} (hij : i ≤ j), Ideal.Quotient.factorPow m hij (f j) = f i)
    (n : ℕ) :
    AdicCompletion.evalₐ m n (completionChartAssemble A γ δ s t m f hf) = f n := by sorry

variable (rank : ℕ)
local notation "FF" => Fin rank → AH
local notation "G" => completionFiniteTensorDiagramCompleted A γ δ s t p m H.out FF

def completionFiniteFreeCoordinates (n : ℕ) :
    (G).obj (op n) ≃ₗ[AH] (Fin rank → RR ⧸ m ^ n) := by sorry

lemma completionFiniteFreeCoordinates_map {i j : ℕ} (hij : i ≤ j)
    (x : (G).obj (op j)) (k : Fin rank) :
    completionFiniteFreeCoordinates A γ δ s t p m rank i
      ((G).map (homOfLE hij).op x) k =
        completionFiniteTransition A γ δ s t p m H.out hij
          (completionFiniteFreeCoordinates A γ δ s t p m rank j x k) := by sorry

def completionOrdinaryTensorProjection (n : ℕ) :
    (RH ⊗[AH] FF) →ₗ[AH] (G).obj (op n) := by sorry

lemma completionOrdinaryTensorProjection_tmul (n : ℕ) (r : RH) (z : FF) :
    completionOrdinaryTensorProjection A γ δ s t p m rank n (r ⊗ₜ[AH] z) =
      (AdicCompletion.evalₐ m n r) ⊗ₜ[AH] z := by sorry

lemma completionOrdinaryTensorProjection_coordinates (n : ℕ)
    (x : RH ⊗[AH] FF) (k : Fin rank) :
    completionFiniteFreeCoordinates A γ δ s t p m rank n
      (completionOrdinaryTensorProjection A γ δ s t p m rank n x) k =
    completionChartEval A γ δ s t p m n
      ((TensorProduct.piScalarRight AH AH RH (Fin rank)) x k) := by sorry

def completionOrdinaryTensorCone : Cone G := by
  refine {
    pt := ModuleCat.of AH (RH ⊗[AH] FF)
    π := {
      app := fun n => ModuleCat.ofHom (completionOrdinaryTensorProjection A γ δ s t p m rank n.unop)
      naturality := by sorry } }

def completionFiniteFreeLiftCoordinate (c : Cone G) (x : c.pt) (k : Fin rank) : RH := by sorry

lemma completionFiniteFreeLiftCoordinate_eval (c : Cone G) (x : c.pt)
    (k : Fin rank) (n : ℕ) :
    AdicCompletion.evalₐ m n (completionFiniteFreeLiftCoordinate A γ δ s t p m rank c x k) =
      completionFiniteFreeCoordinates A γ δ s t p m rank n (c.π.app (op n) x) k := by sorry

def completionFiniteFreeLift (c : Cone G) :
    c.pt →ₗ[AH] (RH ⊗[AH] FF) := by sorry

lemma completionFiniteFreeLift_projection (c : Cone G) (x : c.pt) (n : ℕ) :
    completionOrdinaryTensorProjection A γ δ s t p m rank n
      (completionFiniteFreeLift A γ δ s t p m rank c x) = c.π.app (op n) x := by sorry

lemma completionOrdinaryTensorProjection_ext {x y : RH ⊗[AH] FF}
    (he : ∀ n, completionOrdinaryTensorProjection A γ δ s t p m rank n x =
      completionOrdinaryTensorProjection A γ δ s t p m rank n y) : x = y := by sorry

def completionOrdinaryTensorIsLimit : IsLimit (completionOrdinaryTensorCone A γ δ s t p m rank) := by sorry

def completionOrdinaryTensorLimitIso :
    ModuleCat.of AH (RH ⊗[AH] FF) ≅ limit G := by sorry

def completionOrdinaryTensorLimitEquiv :
    (RH ⊗[AH] FF) ≃ₗ[AH] (↑(limit G)) := by sorry

lemma completionOrdinaryTensorLimitEquiv_projection (x : RH ⊗[AH] FF) (n : ℕ) :
    limit.π G (op n) (completionOrdinaryTensorLimitEquiv A γ δ s t p m rank x) =
      completionOrdinaryTensorProjection A γ δ s t p m rank n x := by sorry

lemma completionOrdinaryTensorLimitEquiv_symm_projection (x : ↑(limit G)) (n : ℕ) :
    completionOrdinaryTensorProjection A γ δ s t p m rank n
      ((completionOrdinaryTensorLimitEquiv A γ δ s t p m rank).symm x) =
        limit.π G (op n) x := by sorry

lemma completionOrdinaryTensorLimitEquiv_tmul (n : ℕ) (r : RH) (z : FF) :
    limit.π G (op n) (completionOrdinaryTensorLimitEquiv A γ δ s t p m rank (r ⊗ₜ[AH] z)) =
      (AdicCompletion.evalₐ m n r) ⊗ₜ[AH] z := by sorry

lemma completionOrdinaryTensorLimitEquiv_left (x : RH ⊗[AH] FF) :
    (completionOrdinaryTensorLimitEquiv A γ δ s t p m rank).symm
      (completionOrdinaryTensorLimitEquiv A γ δ s t p m rank x) = x := by sorry

lemma completionOrdinaryTensorLimitEquiv_right (x : ↑(limit G)) :
    completionOrdinaryTensorLimitEquiv A γ δ s t p m rank
      ((completionOrdinaryTensorLimitEquiv A γ δ s t p m rank).symm x) = x := by sorry

def completionOriginalTensorOrdinaryEquiv (hp : p.FG) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out FF hp
    (↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out FF))) ≃ₗ[AH]
      (RH ⊗[AH] FF) := by sorry

lemma completionOriginalTensorOrdinaryEquiv_projection (hp : p.FG)
    (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out FF))) (n : ℕ) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out FF hp
    completionOrdinaryTensorProjection A γ δ s t p m rank n
      (completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp x) =
        limit.π G (op n) (completionFiniteTensorLimitLinearEquiv A γ δ s t p m H.out FF hp x) := by sorry

lemma completionOrdinaryTensorCone_projection (n : ℕ) :
    (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) =
      ModuleCat.ofHom (completionOrdinaryTensorProjection A γ δ s t p m rank n) := by sorry

lemma completionChartEval_of (n : ℕ) (r : RR) :
    completionChartEval A γ δ s t p m n (AdicCompletion.of m RR r) =
      Ideal.Quotient.mk (m ^ n) r := by sorry

lemma completionChartAssemble_zero : completionChartAssemble A γ δ s t m (fun _ => 0) (fun _ => map_zero _) = 0 := by sorry

lemma completionChartAssemble_recover (r : RH) :
    completionChartAssemble A γ δ s t m (fun n => AdicCompletion.evalₐ m n r)
      (fun hij => completionCoefficientSource_transition RR m hij r) = r := by sorry

lemma completionFiniteFreeCoordinates_tmul (n : ℕ) (q : RR ⧸ m ^ n) (z : FF) :
    completionFiniteFreeCoordinates A γ δ s t p m rank n (q ⊗ₜ[AH] z) =
      fun k => z k • q := by sorry

lemma completionFiniteFreeCoordinates_single (n : ℕ) (q : RR ⧸ m ^ n) (k : Fin rank) :
    (completionFiniteFreeCoordinates A γ δ s t p m rank n).symm (Pi.single k q) =
      q ⊗ₜ[AH] Pi.single k 1 := by sorry

lemma completionFiniteFreeLiftCoordinate_zero (c : Cone G) (k : Fin rank) :
    completionFiniteFreeLiftCoordinate A γ δ s t p m rank c 0 k = 0 := by sorry

lemma completionFiniteFreeLiftCoordinate_tmul (r : RH) (z : FF) (k : Fin rank) :
    completionFiniteFreeLiftCoordinate A γ δ s t p m rank
      (completionOrdinaryTensorCone A γ δ s t p m rank) (r ⊗ₜ[AH] z) k = z k • r := by sorry

lemma completionFiniteFreeLift_zero (c : Cone G) : completionFiniteFreeLift A γ δ s t p m rank c 0 = 0 := by sorry

lemma completionFiniteFreeLift_smul (c : Cone G) (b : AH) (x : c.pt) :
    completionFiniteFreeLift A γ δ s t p m rank c (b • x) =
      b • completionFiniteFreeLift A γ δ s t p m rank c x := by sorry

lemma completionOrdinaryTensorIsLimit_self_lift :
    (completionOrdinaryTensorIsLimit A γ δ s t p m rank).lift
      (completionOrdinaryTensorCone A γ δ s t p m rank) = 𝟙 _ := by sorry

lemma completionOrdinaryTensorLimitIso_left :
    (completionOrdinaryTensorLimitIso A γ δ s t p m rank).hom ≫
      (completionOrdinaryTensorLimitIso A γ δ s t p m rank).inv = 𝟙 _ := by sorry

lemma completionOriginalTensorOrdinaryEquiv_left (hp : p.FG) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out FF))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out FF hp
    (completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp).symm
      (completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp x) = x := by sorry

lemma completionOriginalTensorOrdinaryEquiv_right (hp : p.FG) (x : RH ⊗[AH] FF) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out FF hp
    completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp
      ((completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp).symm x) = x := by sorry

-- test: completionChartEval.test_of
example (n : ℕ) (r : RR) :
    completionChartEval A γ δ s t p m n (AdicCompletion.of m RR r) =
      Ideal.Quotient.mk (m ^ n) r := by sorry

-- test: completionChartEval.test_zero
example (n : ℕ) : completionChartEval A γ δ s t p m n 0 = 0 := by sorry

-- test: completionChartEval.test_completed_scalar
example (n : ℕ) (b : AH) (r : RH) :
    completionChartEval A γ δ s t p m n (b • r) =
      b • completionChartEval A γ δ s t p m n r := by sorry

-- test: completionChartAssemble.test_projection
example (f : ∀ n : ℕ, RR ⧸ m ^ n)
    (hf : ∀ {i j : ℕ} (hij : i ≤ j), Ideal.Quotient.factorPow m hij (f j) = f i) (n : ℕ) :
    AdicCompletion.evalₐ m n (completionChartAssemble A γ δ s t m f hf) = f n := by sorry

-- test: completionChartAssemble.test_zero
example : completionChartAssemble A γ δ s t m (fun _ => 0) (fun _ => map_zero _) = 0 := by sorry

-- test: completionChartAssemble.test_existing_completion
example (r : RH) :
    completionChartAssemble A γ δ s t m (fun n => AdicCompletion.evalₐ m n r)
      (fun hij => completionCoefficientSource_transition RR m hij r) = r := by sorry

-- test: completionFiniteFreeCoordinates.test_tmul
example (n : ℕ) (q : RR ⧸ m ^ n) (z : FF) :
    completionFiniteFreeCoordinates A γ δ s t p m rank n (q ⊗ₜ[AH] z) =
      fun k => z k • q := by sorry

-- test: completionFiniteFreeCoordinates.test_rank_zero
example (n : ℕ) (x : (completionFiniteTensorDiagramCompleted A γ δ s t p m H.out (Fin 0 → AH)).obj (op n)) :
    completionFiniteFreeCoordinates A γ δ s t p m 0 n x = 0 := by sorry

-- test: completionFiniteFreeCoordinates.test_single
example (n : ℕ) (q : RR ⧸ m ^ n) (k : Fin rank) :
    (completionFiniteFreeCoordinates A γ δ s t p m rank n).symm (Pi.single k q) =
      q ⊗ₜ[AH] Pi.single k 1 := by sorry

-- test: completionOrdinaryTensorProjection.test_tmul
example (n : ℕ) (r : RH) (z : FF) :
    completionOrdinaryTensorProjection A γ δ s t p m rank n (r ⊗ₜ[AH] z) =
      (AdicCompletion.evalₐ m n r) ⊗ₜ[AH] z := by sorry

-- test: completionOrdinaryTensorProjection.test_zero
example (n : ℕ) : completionOrdinaryTensorProjection A γ δ s t p m rank n 0 = 0 := by sorry

-- test: completionOrdinaryTensorProjection.test_coordinate
example (n : ℕ) (x : RH ⊗[AH] FF) (k : Fin rank) :
    completionFiniteFreeCoordinates A γ δ s t p m rank n
      (completionOrdinaryTensorProjection A γ δ s t p m rank n x) k =
    completionChartEval A γ δ s t p m n ((TensorProduct.piScalarRight AH AH RH (Fin rank)) x k) := by sorry

-- test: completionOrdinaryTensorCone.test_tmul
example (n : ℕ) (r : RH) (z : FF) :
    (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) (r ⊗ₜ[AH] z) =
      (AdicCompletion.evalₐ m n r) ⊗ₜ[AH] z := by sorry

-- test: completionOrdinaryTensorCone.test_zero
example (n : ℕ) : (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) 0 = 0 := by sorry

-- test: completionOrdinaryTensorCone.test_completed_scalar
example (n : ℕ) (b : AH) (x : RH ⊗[AH] FF) :
    (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) (b • x) =
      b • (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) x := by sorry

-- test: completionFiniteFreeLiftCoordinate.test_projection
example (c : Cone G) (x : c.pt) (k : Fin rank) (n : ℕ) :
    AdicCompletion.evalₐ m n (completionFiniteFreeLiftCoordinate A γ δ s t p m rank c x k) =
      completionFiniteFreeCoordinates A γ δ s t p m rank n (c.π.app (op n) x) k := by sorry

-- test: completionFiniteFreeLiftCoordinate.test_zero
example (c : Cone G) (k : Fin rank) :
    completionFiniteFreeLiftCoordinate A γ δ s t p m rank c 0 k = 0 := by sorry

-- test: completionFiniteFreeLiftCoordinate.test_pure_tensor
example (r : RH) (z : FF) (k : Fin rank) :
    completionFiniteFreeLiftCoordinate A γ δ s t p m rank
      (completionOrdinaryTensorCone A γ δ s t p m rank) (r ⊗ₜ[AH] z) k = z k • r := by sorry

-- test: completionFiniteFreeLift.test_projection
example (c : Cone G) (x : c.pt) (n : ℕ) :
    completionOrdinaryTensorProjection A γ δ s t p m rank n
      (completionFiniteFreeLift A γ δ s t p m rank c x) = c.π.app (op n) x := by sorry

-- test: completionFiniteFreeLift.test_zero
example (c : Cone G) : completionFiniteFreeLift A γ δ s t p m rank c 0 = 0 := by sorry

-- test: completionFiniteFreeLift.test_completed_scalar
example (c : Cone G) (b : AH) (x : c.pt) :
    completionFiniteFreeLift A γ δ s t p m rank c (b • x) =
      b • completionFiniteFreeLift A γ δ s t p m rank c x := by sorry

-- test: completionOrdinaryTensorIsLimit.test_fac
example (c : Cone G) (n : ℕ) :
    (completionOrdinaryTensorIsLimit A γ δ s t p m rank).lift c ≫
      (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) = c.π.app (op n) := by sorry

-- test: completionOrdinaryTensorIsLimit.test_unique
example (c : Cone G) (f : c.pt ⟶ (completionOrdinaryTensorCone A γ δ s t p m rank).pt)
    (hf : ∀ n, f ≫ (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) =
      c.π.app (op n)) :
    f = (completionOrdinaryTensorIsLimit A γ δ s t p m rank).lift c := by sorry

-- test: completionOrdinaryTensorIsLimit.test_self_lift
example :
    (completionOrdinaryTensorIsLimit A γ δ s t p m rank).lift
      (completionOrdinaryTensorCone A γ δ s t p m rank) = 𝟙 _ := by sorry

-- test: completionOrdinaryTensorLimitIso.test_forward_projection
example (n : ℕ) :
    (completionOrdinaryTensorLimitIso A γ δ s t p m rank).hom ≫ limit.π G (op n) =
      (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) := by sorry

-- test: completionOrdinaryTensorLimitIso.test_inverse_projection
example (n : ℕ) :
    (completionOrdinaryTensorLimitIso A γ δ s t p m rank).inv ≫
      (completionOrdinaryTensorCone A γ δ s t p m rank).π.app (op n) = limit.π G (op n) := by sorry

-- test: completionOrdinaryTensorLimitIso.test_inverse
example :
    (completionOrdinaryTensorLimitIso A γ δ s t p m rank).hom ≫
      (completionOrdinaryTensorLimitIso A γ δ s t p m rank).inv = 𝟙 _ := by sorry

-- test: completionOrdinaryTensorLimitEquiv.test_left
example (x : RH ⊗[AH] FF) :
    (completionOrdinaryTensorLimitEquiv A γ δ s t p m rank).symm
      (completionOrdinaryTensorLimitEquiv A γ δ s t p m rank x) = x := by sorry

-- test: completionOrdinaryTensorLimitEquiv.test_right
example (x : ↑(limit G)) :
    completionOrdinaryTensorLimitEquiv A γ δ s t p m rank
      ((completionOrdinaryTensorLimitEquiv A γ δ s t p m rank).symm x) = x := by sorry

-- test: completionOrdinaryTensorLimitEquiv.test_tmul
example (n : ℕ) (r : RH) (z : FF) :
    limit.π G (op n) (completionOrdinaryTensorLimitEquiv A γ δ s t p m rank (r ⊗ₜ[AH] z)) =
      (AdicCompletion.evalₐ m n r) ⊗ₜ[AH] z := by sorry

-- test: completionOrdinaryTensorLimitEquiv.test_rank_zero
example (x : AdicCompletion m RR ⊗[AH] (Fin 0 → AH)) :
    (completionOrdinaryTensorLimitEquiv A γ δ s t p m 0).symm
      (completionOrdinaryTensorLimitEquiv A γ δ s t p m 0 x) = 0 := by sorry

-- test: completionOrdinaryTensorLimitEquiv.test_rank_one
example (n : ℕ) (r : RH) :
    completionFiniteFreeCoordinates A γ δ s t p m 1 n
      (limit.π (completionFiniteTensorDiagramCompleted A γ δ s t p m H.out (Fin 1 → AH)) (op n)
        (completionOrdinaryTensorLimitEquiv A γ δ s t p m 1 (r ⊗ₜ[AH] Pi.single 0 1))) 0 =
      AdicCompletion.evalₐ m n r := by sorry

-- test: completionOriginalTensorOrdinaryEquiv.test_left
example (hp : p.FG) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out FF))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out FF hp
    (completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp).symm
      (completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp x) = x := by sorry

-- test: completionOriginalTensorOrdinaryEquiv.test_right
example (hp : p.FG) (x : RH ⊗[AH] FF) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out FF hp
    completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp
      ((completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp).symm x) = x := by sorry

-- test: completionOriginalTensorOrdinaryEquiv.test_projection
example (hp : p.FG) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out FF))) (n : ℕ) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out FF hp
    completionOrdinaryTensorProjection A γ δ s t p m rank n
      (completionOriginalTensorOrdinaryEquiv A γ δ s t p m rank hp x) =
        limit.π G (op n) (completionFiniteTensorLimitLinearEquiv A γ δ s t p m H.out FF hp x) := by sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct CategoryTheory CategoryTheory.Limits Opposite
set_option maxHeartbeats 2000000
set_option autoImplicit false
set_option linter.style.haveILetI false
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
attribute [local instance 100] ModuleCat.isModule
universe u
variable (A : Type u) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t))
variable [H : Fact (p ≤ m.comap (coefficientHom A γ δ s t))]
local notation "AH" => AdicCompletion p A
local notation "RR" => Ring A γ δ s t
local notation "RH" => AdicCompletion m RR
local instance : Algebra AH RH := completionCoefficientAlgebra A γ δ s t p m H.out
local instance (n : ℕ) : Algebra AH (RR ⧸ m ^ n) :=
  letI := completionResidueAlgebra A p n
  letI := completionFiniteChartAlgebra A γ δ s t p m n H.out
  letI := Algebra.compHom (RR ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
  Algebra.compHom (RR ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
variable (N : Type u) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
variable [IsScalarTower A (AdicCompletion p A) N]
local notation "GN" => completionFiniteTensorDiagramCompleted A γ δ s t p m H.out N

def completionModuleTensorProjection (n : ℕ) :
    (RH ⊗[AH] N) →ₗ[AH] (GN).obj (op n) := by sorry

lemma completionModuleTensorProjection_tmul (n : ℕ) (u : RH) (z : N) :
    completionModuleTensorProjection A γ δ s t p m N n (u ⊗ₜ[AH] z) =
      (AdicCompletion.evalₐ m n u) ⊗ₜ[AH] z := by sorry

lemma completionModuleTensorProjection_map (K : Type u) [AddCommGroup K] [Module A K] [Module AH K]
    [IsScalarTower A AH K]
    (f : N →ₗ[AH] K) (n : ℕ) (x : RH ⊗[AH] N) :
    completionModuleTensorProjection A γ δ s t p m K n (f.lTensor RH x) =
      f.lTensor (RR ⧸ m ^ n) (completionModuleTensorProjection A γ δ s t p m N n x) := by sorry

def completionModuleTensorCone : Cone GN where
  pt := ModuleCat.of AH (RH ⊗[AH] N)
  π := {
    app := fun n => ModuleCat.ofHom (completionModuleTensorProjection A γ δ s t p m N n.unop)
    naturality := by sorry }

variable (rank : ℕ)
local notation "FF" => Fin rank → AH
local notation "GF" => completionFiniteTensorDiagramCompleted A γ δ s t p m H.out FF

def completionRetractFreeCone (i : N →ₗ[AH] FF) (c : Cone GN) : Cone GF where
  pt := c.pt
  π := {
    app := fun n => c.π.app n ≫ ModuleCat.ofHom (i.lTensor (RR ⧸ m ^ n.unop))
    naturality := by sorry }

def completionRetractTensorLift (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (c : Cone GN) :
    c.pt →ₗ[AH] (RH ⊗[AH] N) := by sorry

lemma completionRetractTensorLift_projection (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N)
    (hri : r.comp i = LinearMap.id) (c : Cone GN) (x : c.pt) (n : ℕ) :
    completionModuleTensorProjection A γ δ s t p m N n
      (completionRetractTensorLift A γ δ s t p m N rank i r c x) = c.π.app (op n) x := by sorry

lemma completionRetractTensorProjection_ext (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N)
    (hri : r.comp i = LinearMap.id) {x y : RH ⊗[AH] N}
    (he : ∀ n, completionModuleTensorProjection A γ δ s t p m N n x =
      completionModuleTensorProjection A γ δ s t p m N n y) : x = y := by sorry

def completionRetractTensorIsLimit (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N)
    (hri : r.comp i = LinearMap.id) : IsLimit (completionModuleTensorCone A γ δ s t p m N) := by sorry

lemma completionRetractTensorLift_independent (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N)
    (hri : r.comp i = LinearMap.id) (rank' : ℕ)
    (i' : N →ₗ[AH] (Fin rank' → AH)) (r' : (Fin rank' → AH) →ₗ[AH] N)
    (hri' : r'.comp i' = LinearMap.id) (c : Cone GN) (x : c.pt) :
    completionRetractTensorLift A γ δ s t p m N rank i r c x =
      completionRetractTensorLift A γ δ s t p m N rank' i' r' c x := by sorry

-- test: completionModuleTensorProjection.test_tmul
example (n : ℕ) (u : RH) (z : N) :
    completionModuleTensorProjection A γ δ s t p m N n (u ⊗ₜ[AH] z) =
      (AdicCompletion.evalₐ m n u) ⊗ₜ[AH] z := by sorry

-- test: completionModuleTensorProjection.test_coefficient_map
example (K : Type u) [AddCommGroup K] [Module A K] [Module AH K] [IsScalarTower A AH K]
    (f : N →ₗ[AH] K)
    (n : ℕ) (x : RH ⊗[AH] N) :
    completionModuleTensorProjection A γ δ s t p m K n (f.lTensor RH x) =
      f.lTensor (RR ⧸ m ^ n) (completionModuleTensorProjection A γ δ s t p m N n x) := by sorry

lemma completionModuleTensorProjection_zero (n : ℕ) : completionModuleTensorProjection A γ δ s t p m N n 0 = 0 := by sorry

-- test: completionModuleTensorProjection.test_zero
example (n : ℕ) : completionModuleTensorProjection A γ δ s t p m N n 0 = 0 := by sorry

lemma completionModuleTensorCone_projection (n : ℕ) (u : RH) (z : N) :
    (completionModuleTensorCone A γ δ s t p m N).π.app (op n) (u ⊗ₜ[AH] z) =
      (AdicCompletion.evalₐ m n u) ⊗ₜ[AH] z := by sorry

-- test: completionModuleTensorCone.test_tmul
example (n : ℕ) (u : RH) (z : N) :
    (completionModuleTensorCone A γ δ s t p m N).π.app (op n) (u ⊗ₜ[AH] z) =
      (AdicCompletion.evalₐ m n u) ⊗ₜ[AH] z := by sorry

lemma completionModuleTensorCone_transition {j k : ℕ} (hjk : j ≤ k) :
    (completionModuleTensorCone A γ δ s t p m N).π.app (op k) ≫
      (GN).map (homOfLE hjk).op =
        (completionModuleTensorCone A γ δ s t p m N).π.app (op j) := by sorry

-- test: completionModuleTensorCone.test_transition
example {j k : ℕ} (hjk : j ≤ k) :
    (completionModuleTensorCone A γ δ s t p m N).π.app (op k) ≫
      (GN).map (homOfLE hjk).op =
        (completionModuleTensorCone A γ δ s t p m N).π.app (op j) := by sorry

lemma completionModuleTensorCone_smul (n : ℕ) (b : AH) (x : RH ⊗[AH] N) :
    (completionModuleTensorCone A γ δ s t p m N).π.app (op n) (b • x) =
      b • (completionModuleTensorCone A γ δ s t p m N).π.app (op n) x := by sorry

-- test: completionModuleTensorCone.test_completed_scalar
example (n : ℕ) (b : AH) (x : RH ⊗[AH] N) :
    (completionModuleTensorCone A γ δ s t p m N).π.app (op n) (b • x) =
      b • (completionModuleTensorCone A γ δ s t p m N).π.app (op n) x := by sorry

lemma completionRetractFreeCone_projection (i : N →ₗ[AH] FF) (c : Cone GN) (x : c.pt) (n : ℕ) :
    (completionRetractFreeCone A γ δ s t p m N rank i c).π.app (op n) x =
      i.lTensor (RR ⧸ m ^ n) (c.π.app (op n) x) := by sorry

-- test: completionRetractFreeCone.test_projection
example (i : N →ₗ[AH] FF) (c : Cone GN) (x : c.pt) (n : ℕ) :
    (completionRetractFreeCone A γ δ s t p m N rank i c).π.app (op n) x =
      i.lTensor (RR ⧸ m ^ n) (c.π.app (op n) x) := by sorry

lemma completionRetractFreeCone_transition (i : N →ₗ[AH] FF) (c : Cone GN) {j k : ℕ} (hjk : j ≤ k) :
    (completionRetractFreeCone A γ δ s t p m N rank i c).π.app (op k) ≫
      (GF).map (homOfLE hjk).op =
        (completionRetractFreeCone A γ δ s t p m N rank i c).π.app (op j) := by sorry

-- test: completionRetractFreeCone.test_transition
example (i : N →ₗ[AH] FF) (c : Cone GN) {j k : ℕ} (hjk : j ≤ k) :
    (completionRetractFreeCone A γ δ s t p m N rank i c).π.app (op k) ≫
      (GF).map (homOfLE hjk).op =
        (completionRetractFreeCone A γ δ s t p m N rank i c).π.app (op j) := by sorry

lemma completionRetractFreeCone_zero (c : Cone GN) (x : c.pt) (n : ℕ) :
    (completionRetractFreeCone A γ δ s t p m N rank 0 c).π.app (op n) x = 0 := by sorry

-- test: completionRetractFreeCone.test_zero_embedding
example (c : Cone GN) (x : c.pt) (n : ℕ) :
    (completionRetractFreeCone A γ δ s t p m N rank 0 c).π.app (op n) x = 0 := by sorry

-- test: completionRetractTensorLift.test_projection
example (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (hri : r.comp i = LinearMap.id)
    (c : Cone GN) (x : c.pt) (n : ℕ) :
    completionModuleTensorProjection A γ δ s t p m N n
      (completionRetractTensorLift A γ δ s t p m N rank i r c x) = c.π.app (op n) x := by sorry

lemma completionRetractTensorLift_zero (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (c : Cone GN) :
    completionRetractTensorLift A γ δ s t p m N rank i r c 0 = 0 := by sorry

-- test: completionRetractTensorLift.test_zero
example (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (c : Cone GN) :
    completionRetractTensorLift A γ δ s t p m N rank i r c 0 = 0 := by sorry

-- test: completionRetractTensorLift.test_retraction_independence
example (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (hri : r.comp i = LinearMap.id)
    (rank' : ℕ) (i' : N →ₗ[AH] (Fin rank' → AH))
    (r' : (Fin rank' → AH) →ₗ[AH] N) (hri' : r'.comp i' = LinearMap.id)
    (c : Cone GN) (x : c.pt) :
    completionRetractTensorLift A γ δ s t p m N rank i r c x =
      completionRetractTensorLift A γ δ s t p m N rank' i' r' c x := by sorry

lemma completionRetractTensorIsLimit_fac (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (hri : r.comp i = LinearMap.id)
    (c : Cone GN) (n : ℕ) :
    (completionRetractTensorIsLimit A γ δ s t p m N rank i r hri).lift c ≫
      (completionModuleTensorCone A γ δ s t p m N).π.app (op n) = c.π.app (op n) := by sorry

-- test: completionRetractTensorIsLimit.test_fac
example (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (hri : r.comp i = LinearMap.id)
    (c : Cone GN) (n : ℕ) :
    (completionRetractTensorIsLimit A γ δ s t p m N rank i r hri).lift c ≫
      (completionModuleTensorCone A γ δ s t p m N).π.app (op n) = c.π.app (op n) := by sorry

lemma completionRetractTensorIsLimit_unique (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (hri : r.comp i = LinearMap.id)
    (c : Cone GN) (f : c.pt ⟶ (completionModuleTensorCone A γ δ s t p m N).pt)
    (hf : ∀ n, f ≫ (completionModuleTensorCone A γ δ s t p m N).π.app (op n) = c.π.app (op n)) :
    f = (completionRetractTensorIsLimit A γ δ s t p m N rank i r hri).lift c := by sorry

-- test: completionRetractTensorIsLimit.test_unique
example (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (hri : r.comp i = LinearMap.id)
    (c : Cone GN) (f : c.pt ⟶ (completionModuleTensorCone A γ δ s t p m N).pt)
    (hf : ∀ n, f ≫ (completionModuleTensorCone A γ δ s t p m N).π.app (op n) = c.π.app (op n)) :
    f = (completionRetractTensorIsLimit A γ δ s t p m N rank i r hri).lift c := by sorry

lemma completionRetractTensorIsLimit_self (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (hri : r.comp i = LinearMap.id) :
    (completionRetractTensorIsLimit A γ δ s t p m N rank i r hri).lift
      (completionModuleTensorCone A γ δ s t p m N) = 𝟙 _ := by sorry

-- test: completionRetractTensorIsLimit.test_self
example (i : N →ₗ[AH] FF) (r : FF →ₗ[AH] N) (hri : r.comp i = LinearMap.id) :
    (completionRetractTensorIsLimit A γ δ s t p m N rank i r hri).lift
      (completionModuleTensorCone A γ δ s t p m N) = 𝟙 _ := by sorry

variable [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N]

def completionProjectiveTensorIsLimit : IsLimit (completionModuleTensorCone A γ δ s t p m N) := by sorry

def completionProjectiveTensorLimitEquiv : (RH ⊗[AH] N) ≃ₗ[AH] (↑(limit GN)) := by sorry

lemma completionProjectiveTensorLimitEquiv_projection (x : RH ⊗[AH] N) (n : ℕ) :
    limit.π GN (op n) (completionProjectiveTensorLimitEquiv A γ δ s t p m N x) =
      completionModuleTensorProjection A γ δ s t p m N n x := by sorry

lemma completionProjectiveTensorLimitEquiv_symm_projection (x : ↑(limit GN)) (n : ℕ) :
    completionModuleTensorProjection A γ δ s t p m N n
      ((completionProjectiveTensorLimitEquiv A γ δ s t p m N).symm x) = limit.π GN (op n) x := by sorry

lemma completionProjectiveTensorLimitEquiv_left (x : RH ⊗[AH] N) :
    (completionProjectiveTensorLimitEquiv A γ δ s t p m N).symm
      (completionProjectiveTensorLimitEquiv A γ δ s t p m N x) = x := by sorry

lemma completionProjectiveTensorLimitEquiv_right (x : ↑(limit GN)) :
    completionProjectiveTensorLimitEquiv A γ δ s t p m N
      ((completionProjectiveTensorLimitEquiv A γ δ s t p m N).symm x) = x := by sorry

def completionProjectiveOriginalTensorOrdinaryEquiv (hp : p.FG) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out N hp
    (↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out N))) ≃ₗ[AH] (RH ⊗[AH] N) := by sorry

lemma completionProjectiveOriginalTensorOrdinaryEquiv_projection (hp : p.FG)
    (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out N))) (n : ℕ) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out N hp
    completionModuleTensorProjection A γ δ s t p m N n
      (completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp x) =
        limit.π GN (op n) (completionFiniteTensorLimitLinearEquiv A γ δ s t p m H.out N hp x) := by sorry

lemma completionProjectiveTensorIsLimit_fac (c : Cone GN) (n : ℕ) :
    (completionProjectiveTensorIsLimit A γ δ s t p m N).lift c ≫
      (completionModuleTensorCone A γ δ s t p m N).π.app (op n) = c.π.app (op n) := by sorry

-- test: completionProjectiveTensorIsLimit.test_fac
example (c : Cone GN) (n : ℕ) :
    (completionProjectiveTensorIsLimit A γ δ s t p m N).lift c ≫
      (completionModuleTensorCone A γ δ s t p m N).π.app (op n) = c.π.app (op n) := by sorry

lemma completionProjectiveTensorIsLimit_unique (c : Cone GN) (f : c.pt ⟶ (completionModuleTensorCone A γ δ s t p m N).pt)
    (hf : ∀ n, f ≫ (completionModuleTensorCone A γ δ s t p m N).π.app (op n) = c.π.app (op n)) :
    f = (completionProjectiveTensorIsLimit A γ δ s t p m N).lift c := by sorry

-- test: completionProjectiveTensorIsLimit.test_unique
example (c : Cone GN) (f : c.pt ⟶ (completionModuleTensorCone A γ δ s t p m N).pt)
    (hf : ∀ n, f ≫ (completionModuleTensorCone A γ δ s t p m N).π.app (op n) = c.π.app (op n)) :
    f = (completionProjectiveTensorIsLimit A γ δ s t p m N).lift c := by sorry

lemma completionProjectiveTensorIsLimit_self :
    (completionProjectiveTensorIsLimit A γ δ s t p m N).lift
      (completionModuleTensorCone A γ δ s t p m N) = 𝟙 _ := by sorry

-- test: completionProjectiveTensorIsLimit.test_self
example :
    (completionProjectiveTensorIsLimit A γ δ s t p m N).lift
      (completionModuleTensorCone A γ δ s t p m N) = 𝟙 _ := by sorry

-- test: completionProjectiveTensorLimitEquiv.test_forward_projection
example (x : RH ⊗[AH] N) (n : ℕ) :
    limit.π GN (op n) (completionProjectiveTensorLimitEquiv A γ δ s t p m N x) =
      completionModuleTensorProjection A γ δ s t p m N n x := by sorry

-- test: completionProjectiveTensorLimitEquiv.test_inverse_projection
example (x : ↑(limit GN)) (n : ℕ) :
    completionModuleTensorProjection A γ δ s t p m N n
      ((completionProjectiveTensorLimitEquiv A γ δ s t p m N).symm x) = limit.π GN (op n) x := by sorry

-- test: completionProjectiveTensorLimitEquiv.test_left
example (x : RH ⊗[AH] N) :
    (completionProjectiveTensorLimitEquiv A γ δ s t p m N).symm
      (completionProjectiveTensorLimitEquiv A γ δ s t p m N x) = x := by sorry

-- test: completionProjectiveTensorLimitEquiv.test_right
example (x : ↑(limit GN)) :
    completionProjectiveTensorLimitEquiv A γ δ s t p m N
      ((completionProjectiveTensorLimitEquiv A γ δ s t p m N).symm x) = x := by sorry

-- test: completionProjectiveTensorLimitEquiv.test_rank_zero
example (x : RH ⊗[AH] (Fin 0 → AH)) :
    (completionProjectiveTensorLimitEquiv A γ δ s t p m (Fin 0 → AH)).symm
      (completionProjectiveTensorLimitEquiv A γ δ s t p m (Fin 0 → AH) x) = 0 := by sorry

-- test: completionProjectiveTensorLimitEquiv.test_rank_one_agreement
example (x : RH ⊗[AH] (Fin 1 → AH)) :
    completionProjectiveTensorLimitEquiv A γ δ s t p m (Fin 1 → AH) x =
      completionOrdinaryTensorLimitEquiv A γ δ s t p m 1 x := by sorry

lemma completionProjectiveOriginalTensorOrdinaryEquiv_left (hp : p.FG) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out N hp
    (completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp).symm
      (completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp x) = x := by sorry

-- test: completionProjectiveOriginalTensorOrdinaryEquiv.test_left
example (hp : p.FG) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out N))) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out N hp
    (completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp).symm
      (completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp x) = x := by sorry

lemma completionProjectiveOriginalTensorOrdinaryEquiv_right (hp : p.FG) (x : RH ⊗[AH] N) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out N hp
    completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp
      ((completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp).symm x) = x := by sorry

-- test: completionProjectiveOriginalTensorOrdinaryEquiv.test_right
example (hp : p.FG) (x : RH ⊗[AH] N) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out N hp
    completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp
      ((completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp).symm x) = x := by sorry

-- test: completionProjectiveOriginalTensorOrdinaryEquiv.test_projection
example (hp : p.FG) (x : ↑(limit (completionFiniteTensorDiagramA A γ δ s t p m H.out N))) (n : ℕ) :
    letI := completionFiniteTensorLimitModule A γ δ s t p m H.out N hp
    completionModuleTensorProjection A γ δ s t p m N n
      (completionProjectiveOriginalTensorOrdinaryEquiv A γ δ s t p m N hp x) =
        limit.π GN (op n) (completionFiniteTensorLimitLinearEquiv A γ δ s t p m H.out N hp x) := by sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open TensorProduct CategoryTheory CategoryTheory.Limits Opposite
set_option maxHeartbeats 2000000
set_option autoImplicit false
set_option linter.style.haveILetI false
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
attribute [local instance 100] ModuleCat.isModule
universe u
variable (A : Type u) [CommRing A] (γ δ s t : A)
variable (p : Ideal A) (m : Ideal (Ring A γ δ s t))
variable [H : Fact (p ≤ m.comap (coefficientHom A γ δ s t))]
local notation "AH" => AdicCompletion p A
local notation "RR" => Ring A γ δ s t
local notation "RH" => AdicCompletion m RR
local instance : Algebra AH RH := completionCoefficientAlgebra A γ δ s t p m H.out
local instance (n : ℕ) : Algebra AH (RR ⧸ m ^ n) :=
  letI := completionResidueAlgebra A p n
  letI := completionFiniteChartAlgebra A γ δ s t p m n H.out
  letI := Algebra.compHom (RR ⧸ m ^ n) (Ideal.Quotient.mk (p ^ n))
  Algebra.compHom (RR ⧸ m ^ n) (AdicCompletion.evalₐ p n).toRingHom
variable (N : Type u) [AddCommGroup N] [Module A N] [Module (AdicCompletion p A) N]
variable [IsScalarTower A (AdicCompletion p A) N]
local notation "GN" => completionFiniteTensorDiagramCompleted A γ δ s t p m H.out N
local notation "TN" => RH ⊗[AH] N

local instance (n : ℕ) : Module RR ((GN).obj (op n)) :=
  inferInstanceAs (Module RR ((RR ⧸ m ^ n) ⊗[AH] N))
local instance (n : ℕ) : SMulCommClass RR AH ((GN).obj (op n)) :=
  inferInstanceAs (SMulCommClass RR AH ((RR ⧸ m ^ n) ⊗[AH] N))

lemma completionModuleTensorProjection_ring_smul (n : ℕ) (r : RR) (x : TN) :
    completionModuleTensorProjection A γ δ s t p m N n (r • x) =
      r • completionModuleTensorProjection A γ δ s t p m N n x := by sorry

def completionModuleTensorProjectionRing (n : ℕ) : TN →ₗ[RR] (GN).obj (op n) := by sorry

lemma completionProjectiveTensorProjection_ext [Module.Finite (AdicCompletion p A) N]
    [Module.Projective (AdicCompletion p A) N] {x y : TN}
    (hxy : ∀ n, completionModuleTensorProjection A γ δ s t p m N n x =
      completionModuleTensorProjection A γ δ s t p m N n y) : x = y := by sorry

def completionTensorSectionsAssemble [Module.Finite (AdicCompletion p A) N]
    [Module.Projective (AdicCompletion p A) N] : (ModuleCat.sectionsSubmodule GN) →ₗ[AH] TN := by sorry

lemma completionTensorSectionsAssemble_projection [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (x : ModuleCat.sectionsSubmodule GN) (n : ℕ) :
    completionModuleTensorProjection A γ δ s t p m N n
      (completionTensorSectionsAssemble A γ δ s t p m N x) = x.val (op n) := by sorry

variable (L : Type u) [AddCommGroup L] [Module (Ring A γ δ s t) L]

def completionRelativeHomSections : Submodule AH (∀ n : ℕ, L →ₗ[RR] (GN).obj (op n)) := by sorry

local notation "HS" => completionRelativeHomSections A γ δ s t p m N L

def completionRelativeHomProjection : (L →ₗ[RR] TN) →ₗ[AH] HS := by sorry

def completionRelativeHomAssembly [Module.Finite (AdicCompletion p A) N]
    [Module.Projective (AdicCompletion p A) N] : HS →ₗ[AH] (L →ₗ[RR] TN) := by sorry

lemma completionRelativeHomAssembly_projection [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : HS) (n : ℕ) (x : L) :
    completionModuleTensorProjection A γ δ s t p m N n
      (completionRelativeHomAssembly A γ δ s t p m N L h x) = h.val n x := by sorry

lemma completionRelativeHomAssembly_left [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (f : L →ₗ[RR] TN) :
    completionRelativeHomAssembly A γ δ s t p m N L
      (completionRelativeHomProjection A γ δ s t p m N L f) = f := by sorry

lemma completionRelativeHomAssembly_right [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : HS) :
    completionRelativeHomProjection A γ δ s t p m N L
      (completionRelativeHomAssembly A γ δ s t p m N L h) = h := by sorry

def completionRelativeHomEquiv [Module.Finite (AdicCompletion p A) N]
    [Module.Projective (AdicCompletion p A) N] : (L →ₗ[RR] TN) ≃ₗ[AH] HS := by sorry

lemma completionModuleTensorProjectionRing_tmul [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (n : ℕ) (u : RH) (z : N) :
    completionModuleTensorProjectionRing A γ δ s t p m N n (u ⊗ₜ[AH] z) =
      AdicCompletion.evalₐ m n u ⊗ₜ[AH] z := by sorry

lemma completionModuleTensorProjectionRing_coefficient [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (n : ℕ) (a : AH) (x : TN) :
    completionModuleTensorProjectionRing A γ δ s t p m N n (a • x) =
      a • completionModuleTensorProjectionRing A γ δ s t p m N n x := by sorry

lemma completionModuleTensorProjectionRing_zero [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (n : ℕ) :
    completionModuleTensorProjectionRing A γ δ s t p m N n 0 = 0 := by sorry

lemma completionTensorSectionsAssemble_unique [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : ModuleCat.sectionsSubmodule GN) (y : TN)
    (hy : ∀ n, completionModuleTensorProjection A γ δ s t p m N n y = h.val (op n)) :
    y = completionTensorSectionsAssemble A γ δ s t p m N h := by sorry

lemma completionTensorSectionsAssemble_zero [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] :
    completionTensorSectionsAssemble A γ δ s t p m N 0 = 0 := by sorry

lemma completionRelativeHomSections_transition [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : HS) (i j : ℕ) (hij : i ≤ j) (x : L) :
    (GN).map (homOfLE hij).op (h.val j x) = h.val i x := by sorry

lemma completionRelativeHomSections_zero [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (n : ℕ) (x : L) :
    (0 : HS).val n x = 0 := by sorry

lemma completionRelativeHomSections_ext [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] {h k : HS}
    (he : ∀ n x, h.val n x = k.val n x) : h = k := by sorry

lemma completionRelativeHomProjection_apply [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (f : L →ₗ[RR] TN) (n : ℕ) (x : L) :
    (completionRelativeHomProjection A γ δ s t p m N L f).val n x =
      completionModuleTensorProjection A γ δ s t p m N n (f x) := by sorry

lemma completionRelativeHomProjection_zero [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] :
    completionRelativeHomProjection A γ δ s t p m N L 0 = 0 := by sorry

lemma completionRelativeHomProjection_coefficient [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (a : AH) (f : L →ₗ[RR] TN) :
    completionRelativeHomProjection A γ δ s t p m N L (a • f) =
      a • completionRelativeHomProjection A γ δ s t p m N L f := by sorry

lemma completionRelativeHomAssembly_precomp [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (K : Type u) [AddCommGroup K] [Module RR K]
    (f : K →ₗ[RR] L) (h : HS)
    (k : completionRelativeHomSections A γ δ s t p m N K)
    (hk : ∀ n x, k.val n x = h.val n (f x)) :
    completionRelativeHomAssembly A γ δ s t p m N K k =
      (completionRelativeHomAssembly A γ δ s t p m N L h).comp f := by sorry

lemma completionRelativeHomEquiv_apply [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (f : L →ₗ[RR] TN) (n : ℕ) (x : L) :
    (completionRelativeHomEquiv A γ δ s t p m N L f).val n x =
      completionModuleTensorProjection A γ δ s t p m N n (f x) := by sorry

lemma completionRelativeHomEquiv_symm_projection [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : HS) (n : ℕ) (x : L) :
    completionModuleTensorProjection A γ δ s t p m N n
      ((completionRelativeHomEquiv A γ δ s t p m N L).symm h x) = h.val n x := by sorry

lemma completionRelativeHomEquiv_left [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (f : L →ₗ[RR] TN) :
    (completionRelativeHomEquiv A γ δ s t p m N L).symm
      (completionRelativeHomEquiv A γ δ s t p m N L f) = f := by sorry

lemma completionRelativeHomEquiv_right [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : HS) :
    completionRelativeHomEquiv A γ δ s t p m N L
      ((completionRelativeHomEquiv A γ δ s t p m N L).symm h) = h := by sorry

-- test: completionModuleTensorProjectionRing.test_tensor
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (n : ℕ) (u : RH) (z : N) :
    completionModuleTensorProjectionRing A γ δ s t p m N n (u ⊗ₜ[AH] z) =
      AdicCompletion.evalₐ m n u ⊗ₜ[AH] z := by sorry

-- test: completionModuleTensorProjectionRing.test_ring_scalar
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (n : ℕ) (r : RR) (x : TN) :
    completionModuleTensorProjectionRing A γ δ s t p m N n (r • x) =
      r • completionModuleTensorProjectionRing A γ δ s t p m N n x := by sorry

-- test: completionModuleTensorProjectionRing.test_completed_scalar
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (n : ℕ) (a : AH) (x : TN) :
    completionModuleTensorProjectionRing A γ δ s t p m N n (a • x) =
      a • completionModuleTensorProjectionRing A γ δ s t p m N n x := by sorry

-- test: completionTensorSectionsAssemble.test_projection
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : ModuleCat.sectionsSubmodule GN) (n : ℕ) :
    completionModuleTensorProjection A γ δ s t p m N n
      (completionTensorSectionsAssemble A γ δ s t p m N h) = h.val (op n) := by sorry

-- test: completionTensorSectionsAssemble.test_unique
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : ModuleCat.sectionsSubmodule GN) (y : TN)
    (hy : ∀ n, completionModuleTensorProjection A γ δ s t p m N n y = h.val (op n)) :
    y = completionTensorSectionsAssemble A γ δ s t p m N h := by sorry

-- test: completionTensorSectionsAssemble.test_zero
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] : completionTensorSectionsAssemble A γ δ s t p m N 0 = 0 := by sorry

-- test: completionRelativeHomSections.test_transition
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : HS) (x : L) : (GN).map (homOfLE (show 1 ≤ 2 by decide)).op (h.val 2 x) = h.val 1 x := by sorry

-- test: completionRelativeHomSections.test_zero
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (n : ℕ) (x : L) : (0 : HS).val n x = 0 := by sorry

-- test: completionRelativeHomSections.test_ext
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h k : HS) (he : ∀ n x, h.val n x = k.val n x) : h = k := by sorry

-- test: completionRelativeHomProjection.test_evaluate
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (f : L →ₗ[RR] TN) (n : ℕ) (x : L) :
    (completionRelativeHomProjection A γ δ s t p m N L f).val n x =
      completionModuleTensorProjection A γ δ s t p m N n (f x) := by sorry

-- test: completionRelativeHomProjection.test_zero
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] : completionRelativeHomProjection A γ δ s t p m N L 0 = 0 := by sorry

-- test: completionRelativeHomProjection.test_completed_scalar
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (a : AH) (f : L →ₗ[RR] TN) :
    completionRelativeHomProjection A γ δ s t p m N L (a • f) =
      a • completionRelativeHomProjection A γ δ s t p m N L f := by sorry

-- test: completionRelativeHomAssembly.test_ideal
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (f : (sectionIdeal A γ δ s t) →ₗ[RR] TN) :
    completionRelativeHomAssembly A γ δ s t p m N (sectionIdeal A γ δ s t)
      (completionRelativeHomProjection A γ δ s t p m N (sectionIdeal A γ δ s t) f) = f := by sorry

-- test: completionRelativeHomAssembly.test_dual
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : completionRelativeHomSections A γ δ s t p m N (Module.Dual RR (sectionIdeal A γ δ s t))) :
    completionRelativeHomProjection A γ δ s t p m N (Module.Dual RR (sectionIdeal A γ δ s t))
      (completionRelativeHomAssembly A γ δ s t p m N (Module.Dual RR (sectionIdeal A γ δ s t)) h) = h := by sorry

-- test: completionRelativeHomAssembly.test_precomp
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (K : Type u) [AddCommGroup K] [Module RR K] (f : K →ₗ[RR] L) (h : HS)
    (k : completionRelativeHomSections A γ δ s t p m N K)
    (hk : ∀ n x, k.val n x = h.val n (f x)) :
    completionRelativeHomAssembly A γ δ s t p m N K k =
      (completionRelativeHomAssembly A γ δ s t p m N L h).comp f := by sorry

-- test: completionRelativeHomEquiv.test_ideal_projection
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (f : (sectionIdeal A γ δ s t) →ₗ[RR] TN) (n : ℕ) (j : sectionIdeal A γ δ s t) :
    (completionRelativeHomEquiv A γ δ s t p m N (sectionIdeal A γ δ s t) f).val n j =
      completionModuleTensorProjection A γ δ s t p m N n (f j) := by sorry

-- test: completionRelativeHomEquiv.test_dual_inverse_projection
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : completionRelativeHomSections A γ δ s t p m N (Module.Dual RR (sectionIdeal A γ δ s t)))
    (n : ℕ) (d : Module.Dual RR (sectionIdeal A γ δ s t)) :
    completionModuleTensorProjection A γ δ s t p m N n
      ((completionRelativeHomEquiv A γ δ s t p m N (Module.Dual RR (sectionIdeal A γ δ s t))).symm h d) = h.val n d := by sorry

-- test: completionRelativeHomEquiv.test_left
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (f : L →ₗ[RR] TN) : (completionRelativeHomEquiv A γ δ s t p m N L).symm
    (completionRelativeHomEquiv A γ δ s t p m N L f) = f := by sorry

-- test: completionRelativeHomEquiv.test_right
example [Module.Finite (AdicCompletion p A) N] [Module.Projective (AdicCompletion p A) N] (h : HS) : completionRelativeHomEquiv A γ δ s t p m N L
    ((completionRelativeHomEquiv A γ δ s t p m N L).symm h) = h := by sorry

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

/- RELATIVE HOM COMPLETION ARCHIVE
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
END RELATIVE HOM COMPLETION ARCHIVE -/

/- Independent review checkpoint: codex-G2QhrF
The rigid genus-one triangle has three internal nodes plus its attachment node.
Its image in the relative five-dimensional Mbar_2,2 chart imposes FOUR parameters;
the nodal elliptic boundary is the FIFTH. The geometry is still omitted.
Polynomial expansion flatness requires formal Proj/flatness transfer for families.
Boundary normalization is a stack quotient; conormal branch exchange is unsigned.
The characteristic-zero source checks do not establish their integral descent.
Additional API/test omissions (actual types missing; no surrogate signatures):
API: PointedExpansion.projLift
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
API: PointedExpansion.mapIso
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
API: PointedExpansion.baseChangeCoherence
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
API: SeparatingClutching.mapIso
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
API: SeparatingClutching.pushout
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
API: NonseparatingClutching.baseChange
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
API: NonseparatingClutching.pushout
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
API: BoundaryType.quotientDescent
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
test: BoundaryType.zeroThreeEmpty
  Needs the parent finite weighted graph and actual boundary-type interface; the count is proved in the review report, with no surrogate Lean test.
API: MarkingCotangentLine.pullbackCoherence
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
API: MarkingCotangentLine.conormal
  Requires the actual pointed-family, sheaf, Proj or stack-quotient interfaces; this contract is specified, not replaced by a surrogate proposition.
-/

/- Independent review continuation: codex-0Sbfnu
MC.4 section-degree positivity uses the line image of generic evaluation,
not vanishing of H1 on every unstable nodal fibre. MC.5 rational GRR is
characteristic zero; integral Noether uses Picard injection and torsion freeness.
Ordered separating determinants have exchange sign (-1)^(g1*g2), and the
nonseparating residue has its separate branch-exchange sign. Pullbacks of
universal phi and -phi coincide in characteristic two. Full homogeneous
level and its fixed symplectic component remain distinct moduli problems.
Yuan degree-d triples are in section 4.3.2, pages 73-75.
Additional contracts have no geometric Lean types yet and remain omissions:
test: SemiCanonicalNoether.characteristicTwo
  Requires the actual geometric interface; the mathematical guard is recorded in the review report, not encoded as a vacuous proposition.
API: CurvesCoarseSpace.baseChange
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveFullLevel.changeFrame
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveFullLevel.ext
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveHodgeBundle.mapIso
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveHodgeBundle.baseChangeCoherence
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveHodgeLine.exactSequence
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveBoundary.lineBaseChange
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveMaximalVariation.fieldExtension
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: StableCurveCompactification.mapIso
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveGraphClosure.comparison
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: CurveTorelli.baseChange
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: LevelPicardParameter.baseChange
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
API: LevelPicardParameter.tensor
  Requires the actual family/sheaf/stack interface and the mathematical statement in its node; no surrogate proposition is supplied.
test: LevelPicardParameter.canonicalDegree
  Requires the actual geometric interface; the mathematical guard is recorded in the review report, not encoded as a vacuous proposition.
test: CurveGraphClosure.constantDimension
  Requires the actual geometric interface; the mathematical guard is recorded in the review report, not encoded as a vacuous proposition.
-/

/-
Review continuation codex-LwkQQl: exact Picard supplier imports and scope.
MC.6/jacobian-hodge-comparison is the moduli-specific full-level Torelli
Hodge pullback, importing JC6 on integral Noetherian components; it does
not re-plan the generic Picard Lie/duality comparison. All existing geometric
node omissions remain omissions.
API: LevelPicardParameter.liftFiber
  Requires the actual relative Picard sheaf, H²_fppf Leray boundary and free
  Pic(T) action on line-class lifts under universal global functions.
test: LevelPicardParameter.baseTwist
  Over C×P¹, L and L tensor the base O(1) are distinct actual line classes
  with the same relative degree-d Picard point; actual geometric types needed.
test: LevelPicardParameter.dualNumbers
  Fixed genus-two curve/level3 line deformations over C[ε]/(ε²) have tangent
  H¹(O), dimension two; actual infinitesimal Picard and cohomology types needed.
-/
