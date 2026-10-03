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
node: StableReductionPartII:MC.1/tricanonical-cohomology
  Requires supplier types and the precise statement in the reader.
node: StableReductionPartII:MC.1/tricanonical-hilbert
  Requires supplier types and the precise statement in the reader.
API: TricanonicalHilbert.universal
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: TricanonicalHilbert.frame
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
API: TricanonicalHilbert.action
  Requires stable pointed-family/stack/line/Picard types; no surrogate Prop signature.
test: TricanonicalHilbert.genusTwo
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
test: TricanonicalHilbert.wrongPolarization
  The mathematical discriminating example is recorded; its actual geometric Lean types are missing.
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
    tensorCokernelIdeal ℤ 1 0 1 0 (ZMod 2) (Submodule.Quotient.mk ((1 : ZMod 2) ⊗ₜ[ℤ] ![0,1])) =
      (1 : ZMod 2) ⊗ₜ[ℤ] (-⟨AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X - coefficientHom ℤ 1 0 1 0 0, sectionSecond_mem ℤ 1 0 1 0⟩) := by
  sorry
-- NodeSectionFactorization.PolynomialModel.tensorDualTorsionNegativeGenerator
example  :
    tensorCokernelDual ℤ 1 0 1 0 (ZMod 2) (Submodule.Quotient.mk ((1 : ZMod 2) ⊗ₜ[ℤ] ![0,1])) =
      (1 : ZMod 2) ⊗ₜ[ℤ] (-dualGenerator ℤ 1 0 1 0) := by
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

/- FINITE FREE COMPLETION ARCHIVE
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
END FINITE FREE COMPLETION ARCHIVE -/
