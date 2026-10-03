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

/- FINITE PROJECTIVE COMPLETION ARCHIVE
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
END FINITE PROJECTIVE COMPLETION ARCHIVE -/
