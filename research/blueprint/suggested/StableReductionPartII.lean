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

/- INVERSE LIMIT ARCHIVE PAYLOAD
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
END INVERSE LIMIT ARCHIVE PAYLOAD -/
