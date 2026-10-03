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

/- BEGIN ARCHIVED FINITE COHERENCE PAYLOAD
{"Native.lean":{"sha256":"162dcf957d43986427dbab003a1de181e7306513dd5c59d8c2aad4fbc1d9e407","bytes":293317,"lines":5457,"data":"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"},"Canonical.lean":{"sha256":"d16a9eb659f754b6e41d1e11a2fe748fa8d9136035f5a3c922cda7c9c51abcda","bytes":219311,"lines":4220,"data":"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"},"FixedNative.lean":{"sha256":"05fbe77c7091745827ab55391b7aae09ecf6a2f38c50ff70bc9b9e65b0f871ee","bytes":266180,"lines":5061,"data":"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"},"FixedCanonical.lean":{"sha256":"d07d6ca1f24f27d1cd1da9d8026d5c9357e471658c70da117fca97688bfab399","bytes":203146,"lines":3975,"data":"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"},"IncomingNative.lean":{"sha256":"67a62b3137b3f65d9c774d915e948ac6e42332e8917e27810e731f92634a39d4","bytes":265454,"lines":5041,"data":"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"},"IncomingCanonical.lean":{"sha256":"e4b30084bfe1075ba124f6f9f2a4e0bb639a393004da42552fedaaffa2559feb","bytes":202997,"lines":3966,"data":"eNrtvV1z48iVKPiuX5GefRBZJbJEVdu+rt6auCqp5FJ9qMoq2dPjjrIMkqCIKhJgAaBKUk9HuG1vR3uebkzMhGN374YnJrztvrHz4q87M6+e9+7/oF9wf8Kekx9AJjIBJECQUtvyvdMlkkDm+c6T55w86U1nQRiTZ048nnj97o4TuydBeH40duG/3e2+O/Ecv/vwLF7zrJ58EQav3UHsnbqml7YnJ24/dJKXu8+C4Xziwkd8uvvIiaq9lM5WHbxDNwom89gL/LwJHwXTYBKcnHdfjuHnnWA6m7hn6ezZ1556vuuE4uWn7ih+eOYM4mqj82+9gTPhXxVPszt3Jt1ddxTlTXPo+Sc4auFD3w2D+az7fd+LI+Nzu07sdOFD6J11HziRNyh64Nl8Ugwzf+4ogK+Ln/zePIg914+NQCFmgr3D14HnHwZBCVOOXD8KQhCC4XwQmzGRRq329N7EsXzo4VtgmnfhhkYq/hAEzDxOQj8qgd09D/jlvgjdCCjkmAS5CHlB2kKqegMmhDh4dztSRijDcs/x4vFoPpmcW1GGQ3kUvNPpIjB4EUzO/WDqgcjjcJpEHIG6eQM6asFM0ij7Q9eZ2MzmnTqhByalmMLCupRx4oVXhVPw9NqdzjfWjsZeREbexCXwrx/EJB67JAyc4dSZEccfiq/ds7Ezj6iNI0fSI8NgMJ8ix1/GTn/iHro4OsD6wgnj/f3ulA4wdEcoVuLlyCXR/OTEjWJ3SJ66jk9GQTiNyNidzNYGgQ+K3J/HQRhRAEL31HOBfxGBn07d8MQlgU98Z+qy3yPvxHfiOUhsd21t59HDnScvnu8fHN2jmMwScgMWQwAbOLZBwCIR4CooDPGQWXScIXzcoC/F7wIA440b+u6EAJLRBnHCvheHTngOQLijkTdAKScxJSl8NZ0BJ6PAhydHIJfEmfbpA3T0O2Ao77wVmgGj+BFlE07KofADFyYGYfDJlOohHZOpCPz4joydU/jO8QMfjfjazBm8cYEpSCpOhlkYxEF8PnPJxB2eALkYn/g4bsLjwdiFd4dkHgEp4M0198wDvsLfM8/34QcuPaQ/9yZDNsjIG8Wu6xN34iKvkQwwXTAi/WAo5vdB2Nbg21MYwj1zcNaIwAIZwMhxQOkKogZcRQQoUyNEbuCO3htsbf6Xb7rDYX/07a277nc2v7k5+vbwve9s4f8ffvM7d51N9253bWcehkjTVHTE7KFLQBi9GL+LgC6AYkTm/tANyYvD50fPd54/JRFTIdKDkShdBC3Jl3+89/jy03+4/OkvPzx8dUhxeXLvkH+zjd/A+ChuQ5Q7xMPzkVc428AJgQFAaxzTCxN2OijrjEaMOr1vpUSJ5uEp/uz5xJtO51RvyDfdLec7znfu/pfNu998fy1GrUxYx3CSmRe5IHBgOSbnTHQDl2npwA1jb3ROTtxg6sZglhiunHIueg4dKgihO3C9GZNBMZhEk2g2AXJSoaB8dsLBGEFGUgyZuMy9aOwO1zxGkjEMFIxG7+MHoIM7cfpByJYPDbh4HEQJcUB9UGhAUQTQ3gAoNAMAgH0oz0Dcl24yw53dhy/3v3vQyTU3YErg2WicqIU78GC6fgAC4aC2gJVAojjMLHqDThSDNm2AqfB84Gln5Ey9yTkYCTQ2sQezdGA0Z8SN0YTytvMC6BQi+rEbjpwBzDYF84g8A3UJgymlisADFQHgcjnqqcVCksNv5F2I0ut31w4CydSArZ6B7rmTIZLJOfNgWBCCeQQSACoF1h6GDnxkneOfk6kXUZ0O+rhedNc6d9bWqJkEa+GSI2e+A/aErfMeKNOpG62t0RUI5e+jQ/KS3CNHQPBbH5MPYYWe4upGDl9JH16+wkWjQ22CewaoDbyY9D0fgQX3Y4gcH1Bj/j5wHBTwxPXd0BmcI9hOKmhzWAzQmg896gMQgBSWCHIAFnoPXiatL39PvvwDOSPnANJhG/9D7t2Hzz8iW+Q2gV9vwYdb8PNtfA7/gF9kbMVQa3RgENlB6E0BUNACPrg8MHyDI3fIezDWl39Y49AkCADI6luUM/DifoTuLWkpE9An22trQCgBRtc9Basdo6vgTgl+0HFcI/C/hATpr6V4IyCwDIXnyoywbiUT4kLd+upTii4Yttu3yMt2DgDwVEsHog1QpNyBZ778fZv9+wf27xn7Bx5MgBGCIi3BA/iB22FQeD/24vP34XdY3DuRS1cythxP3WkfRHvszbjgCHvg+bN5TOVFRnVC/ZydZPAE7+wPMs5f/pHMySlDvTWGT/fwKyTnfbKZw47WGRL+j0D4VmeLigr8Zy44c9pu05cIaZ0nz9Ff5iBaW+wJcp8/Y+A0f0cXJhzojE91TsdBMvfPYShGa4Uc1Hiv8eUGX0y0KGXhJke802srQtbJilQyzBi+TOR9i77OhlS0RB7XKJaDMZiAARhNXEUGR+BpqTPwoRkTWpp2KJP12G+b5PKz30i4JV+r2sMUxwjUMJiDDUR3+eHZYDIfwromoLpH/vSvJiQvf/5rnCKlEywOqdFRDdFLJn17gDe4PxdsWaQ2ZgL7eVkoIxILXrH9LGnBhoxstZN/0V4BLfhuF5bm0RyUibwm9/+aksgbwScgHq4/Phc1+O518p0wHNyCxKldcSewNqGER+K7mA6A3xtH6gB/OiRqszfP4e+YoRV6J+OV40XnZ6B0Wioa7WI8KBbszTziJBpm4mV3xjZVUWJ4xBdmGlAgKOvVX29xwqnfCoPBSROBf+aEKf0MdqSTNS4wTBuVhI5kmuOWCZymJs6qnJGETvwcAPP81BwYl6cMmJvw/+5LQtPKSI1ZbvI1QlYE/rAkNZr880fPLXGsbvtMMtPjlk2WGPm7Erap5rBDWhH/IqKaYolK6M5csIVDjI7l2UxuXC2M553O2k6690i9Y/Tl0Y+eBPhD6kh0YJMMW3O2NwG8nu10t9hWR3I2aPACVFDsvPk+ju7MxB6Xucqwa8f9STBz3s5ddU+neus4wgA2Erj14xsfthNfj4zQKRty6pCnC0MaCHqGj8OaEfi44+P7Qb5fXVsLZiBp6cOSy97aFg57W/LRt18J1WHCs8080SO6bwUmkOR9cK3+llIJ8Qjmcea3D7rUlksUvSfBQVrS39ttZr2l4NYHTKqoLEpf78jvwSeqcfJr7cxniyH+kH2FOjJcC9QXDeYJyOP0+6F7Sij5QCbTuC9pSdhvSy+xZU4KBT2CrRnQmnvXjBFEYgNSB7/FmDlyGZiXzEINV85EbQWBtTWmCSCtVA3JX727/OlP/gqsHTG/rz1/KJ7Pgqg9+eV/iEczaBa9NBfvSNiFSEiEU3v61PA00AKfVXj8gSp5INEasL8VQ3GPCoFnmxT+J+xTEDhySgdnX0bJz7FhyN+JIYU3s/iYj8WQLRojBk8dtv8f0TE6hL+/wYYTn+OP0e2muyLkHZc8bh0enlKtxB+45G2nRlV6jr0vj8MksgIUiZbwITFFROeSZ5BFXoTU4PVXdEpNZ57BrvSj7XVT1GF7HazYSNKo7XWxBkrI8kfxScqWEduOjigTRorrgZvRZ7jAwO6KRx5PYCHAzeXc99DszxwvJIECoKRUEQlOwT5imKXvRCyOTPehiccnmXOcBlZzlON2l38UgOjPHzjxrnsSui758IDGvk+pkL9Kh/CTJ+7LWzMxlA8GzZmwvU/IxUFQ6/Kzn32DzDL6Q/7zl8rnDW4rQ3LfpIqzbg/cAyoft8y/b+m7fgZUB2NBZBoIIiLNyQgw8d2Ik7QfxGOF6EjaSKFtiuAeEgH2EDxXhZ8y6xATD9gPys9sC5nPAMmFF1bvv+0MgiAcejSYNvRGIzd0/QFdB0P3ZA4eFA1tMub7Lqz/6DH0XZCfYTB1PF8BmI+7kwx5yMbgTNmb+/T37r7P88bMcRXMoxZC1T9cFsOMPIPLNPSGCLDwk2iAl5J25oTg0IzWfmyMk95Dh+kOJkQ6I9mt69ABfswjpKNgHhKXphVjjM2IiN/kHDwJ6vLRSTFvwmPVZ12uZBNvFHcAvM7AASpOWF4gwscx8gsweANKD2l0Kgwu/AdTLDQsTgmTaBvSH7jhRWtOknTCSHgMjDpBd5yGPkfMKYPtPA1PA7XmIbAxdPwTV2GR8AppNp3zheXLwCx13wAsLe5AT+eTH7gD+I3QVQbd8/RBOrDp0d/RR8Weq3Tk39mP/NtKI4tveNoJt7h0ALvJDG//jr29wPy/W2h+Dn0m/qXrw4/zt2E8tRcJQU9yfVx8Dve/++iITFmgwotYKD+NW8KSSQyvrT19uCe/JSUZDzssEkl1hb089KLZxDl3acICEHYwC3tGp6IZxzW0L1OwQpNz+qXTB0lHUfWiYBqEM9CFKRnAa5ELxvLZfBJ7qJ3M0eifkx+r9uPHa85p4A2jdPnj+5cI9Iwm9QTyVJ0BhPfJj/PM2I/Xps4bqs5OTNJNLSMvrKeY/TyZB3PViidkT5cm0nIf4zLHNqe4qvPF6/I3/26tZPD0L36WuhqPqZfE47Du7iLD/1YfPokEtB5zP0R1ctptsZi2Lj/7CbmA6dXJN9IRAPfWy3mfJXzTqpTpG3LRTpbx+8nz8Ibqo+GacAHb6I5psbggvVRJOTQtHRxwlF7Dl5RoEmj6eEjKfGhfZwA1AkQhpSjcFigkf9F9YBb8W9KQhAF6mKP931h7Sn1tlN5OsuPHWgLPnzO5RKNA1z36DJftjqTPqUu2xnbwILWwsjP955os7Q2dfpDWM6SpU+bz04KGNYwXhO4A1CcbMKDexDksZNSPoG4R/ngyCfoYAqH5Rq44XXIQwP9PCgQADSVDMD6fBbiw0sWR+ibMqKyx1TbJc6aqHr0v52y5I0wtD+LQkbaSNMJCs5IiGT3sMAQxISkSlTxlSoZuNKBVDwCJDx5UiIDwXOiU5SNpNCMawD9Dohb+aJulgdgsqVKvPTcUz6kypz3XV8YrFkHtZUe8LLZ+mIWRx6Hf8LfVIeemre9ushPMsSNsSdsGmiIrwPgGYQcdZ93ecrttWmoID7sFoWKJ8afvil+Oaf0H5nVwFyTtGmhKDOHcIGg8hJnYIEO2E4DfMRbaZ59S7TQtzQfUg6daIfSAw8uqbt556iYABYiwWgz4YxuUKJoxT3lyrqFyIO1/EqDZEsATe5Xgx3SgGCS7i6LeOeyetjM04YZqTEfE/ZJCECEOuFHi8xpodMTcW7LNOciCkgk/hY+Pihj4QKN3WNbAo7vOIEmk65R5+HbunTZEmnTpdvloYnnEuGNCnjajT0uhmWmtcbvR+RR2w4sRDq1s5A1xF88KFyOyewfEJ0JGvQO76aIwYT4mQGnqn8sSKCKtWPKzzVYC7tdx18+bOlhzNiJTxcti/HHQ4WHJ7JGHG45kicwy45CD2CQjJlgEdqqHgDh15TCRHLYTPPzqk4SJotwpjQYku9SX81BsU+EF3FvDPwDZfdLTPIw0/pAq0QY+D79c/uRfyBj9foA4BHTg27Hmo4wTo4M/01zL5af/SKEVY2ftEdO6MEsgs6BIJQhgQ4EzLv4DKsZ4Dat4Z+g5J4FPbSnTK5Saw8u//6ft7to+yBBqHm49eZKPTJx3KCqgoAMsSjsXEQMvPkepGWItDHMLhMnGrMAaFg5iOZDPKo0iKmJDaQ3PeuiaRL2kyi+VNzQiFE+kN7lMyI4r5VLKCi6oT2jwSMhpmCzDLeR1u62xOaSuMRviCb5wC91IxsUn8Ntt6f2LNptAHuQJGdBACek4IuDzhMHCoTCwHyuGaXDE49EGZk7VyBNaDKrXuLnypmyP8xhfOexgaacpzkODn8e08DONTeGnbSqhWVgyb2Mk1fzybg4iNL6GKSkaeEng72CspAP+AW5n0prUxPFM3Trq3rKEmbYPxW0oFuLEKPWzORatUT+NldOJCkg0iREK7OONtXe0qC1+F6TuRkSShN/jdUbsw3XqyI4EEzDFT6t7omg+dYcMGp6eS1Ju3HvGucn2ulgKXVzQnAkG6JgnK0BP7HC0BvBTpyJWaCVoItluWtGH2ibtq9HWU05EJnZThiGtdxipq8ewQUP38QfmmsMDOMJ9MurGAf8uUeR39BcpGUJrudTPPLFERm2WZxHvHq5n0lnv1pPfvvwPBBrm5aH09dRAZFJT79bbPGWl5NKkl+UI7Ho7mYIVnEnhemkOaYpyhJAILbCrVAXS8R+vpykNimmazuCzfKSlodapZVpnSYKNbDR7Xc0jJo/G7Y8Vv6eFqP89NY3MTRQ+ELL88XrizsPHw/XE16ELpMPIrjiZpi24Sx+FSS5/+t9xHlwpf/UFVucla9wGETS5/NX/ALuHwMI7t2gN3xj35BnbgXnggniwlMFmZa6wFvKlzJC2OOSP2IW2Z4XJY9gHvWNLx0ytPyiAVmzgsZiS7fA7zG3LquvD5IEnzK3TkiStnCWRrmnM/wDv5bPPGI+ySxkuZLBo5I3Bs4F0dbsw1e0V4Cgbdxpyx8gdd0rWJu506mSSs8fu22O+4cfs2j2+it4n0pfZZEh1OrNNR8QhkBA/jsAMg+DSsgOdzrkkcqhvGCKJHBCCfHYsAPQsPUajVlpIedL0qI3uAz1Wiabgnr53DPzIFzBp/AxeItpHJNcplwxtCzhYIW1qWeDfYiCkbdd9ts8qxzTxnGhkcdtiEkkZpPqfOjJIi1xzOfkSf06YmOxQH4u9qJ5FlV88HnlhFBv42FKGV5nS7dVnoxEI+BCAy5UrTUYgsHzZQn+ME4p9iCQ1CWOLZ26zbXzr9QbjrWEPf1GOLSvRVmbMRVWWpNbmBjetycIRu1F8L798LVN81ZWnOQjAJwQhlAvaEp9jrnpUzKuQi3daeNKSvNempYk9spm6K65ULsHwyT7LaOySOWMj3V2DzNEvqHChW6lNkETesco8U6uTfRj+ryEq/dANgwfgA6cljKEKYY9NupkW0xtwTx+iay0ycrNBRsYID0v0GHj55efU6RaJdwT98uf/FyUTrSsVJaQZrZefCSXGSN8zpv/pX4m01c08soHTq/te+OJCXeHqIZ/aXnYSNeFQA4tBA0BVkxwDoEbR2WwWyFwj0MqDJ6PG6jaq3Ey0y/WbVDM81axBM0RbUOFM1FXUbYm6ZuF+UJ+qI/LYWmKbV9mpO8WmU9vyZtKQXcblwyKpzKJnIik7FB96eaEqBcUkdRSJBWtpKfzW2OWh8eZxTZya3FH4aQKQS+UUAZCJlv1zpZVnEVvD6mNusjF7ypidYUH4UOEJS9+JuUdfU47wGUZFM4wW5DnBKsqRKTRywIKPtDwgiWTSqKd8bjE58Pt+eug8c9b8T7/BU+bqvimxnZYljDn7LxF1gRE4in2WheY4Omy7v6m9r+Z8WRVQ35tgjkLxC9BwXWSj+xd5eV4+hb4NU6YTSaZimDDDq8BCpYFDoI4nuyqvS2BTyLeH+7rjqTsV9BNRnbwXXtI9GH9jmPOGGf00L8NCMYacipEiynvHzmw2Odf3gPoEmbgVXyby6VYWk2hbAMdYpsGWsqwQRFO6KH+zbAOPyMi10vSSHcFa4a3ENSh+8oIfSCFlENOsVRkNylHCiIcbWSGhZcSKH89ky0rgMEd7SqiaE+0x1qH8gCHaZHYcfr/81RcD+opmACRAWfg8pRt7byi/J9kB7cV+wSKtoMhrbBDFL/9tcSzFm/+W++a/5dKH5e/x1Xy4peqRfRF81vlTXAeSdRoKKkIq14Kk1Shy2UDLVBwg446+hEtLC1o9EW6wIEFqRa8hCVzGT4yf9CrmGMTmhro9uXsbdtynma2NoayW8U7Ok9mWqnJRL/I7qQAMZYewLzmERaVrJiqku59mbFUDe6g8gmqSZ0fURkma7LJUqiyy59IUmm+6FtlzgflH3pWzv8GN1rVmW2YrVg2GUVOiY96sGarqjNb5OljmFppmEc8vx0NaaI3FeQJkPGxzjzRZMMcGNtXvwZ9jzazlFN2lQBTgmq1b2wn8KHawarOVU3wm0H7C4bCvPyvYUPBBE2f2ie6w2mIgPLsn5OnqERg/zRv0aZ1BKSXuIyK13QhWICAKFXTCbYtuTI1Ua1+BzFyhXUmFVtNT4QvCr0mtLfyNh3fgAz3FK6oq8fMWq7XML11JX90qcI3k89x8E1elIk7N92aOh8vQjNjBjeL0a9Fp8NRTKJzlVJsl25+hcA6lgsxqQtnqZHstFB1uh/9eLFIuJVcX8RJJLz7P4WxaRVWNu4U1QIXYFdIsTNNio2olFuqw+7wNHcYD8+dridYd3pCWqxHpsxrHM8+C/Y6DyEuot72eS0H50zo7bqgT9USuvoTnEmcji0MRgU9EWWcRoVMyF5HnhI00qiyNWHEtly1nS0OQECsrtX1AfyltKpFXCXqYrQR9sL6RrflMtCE5/5Ip8wyrGgEs+Ew2w8UqU29BZ0nPAh6x6vdVMenxut51pAazHmeZ9Vhnlra7aWW59TrJ2hevCfdNHLJibcnKkRu5WLuT5LN46ecGOxGI6ay0I9bQmcXYnjZtIMGbuuqHBcxnQJOeveIMaNremtX2uyE8T6voq5gEduSgIxX6876C/gk7NcrOtC1N0sxq/d+opFh1nTG5Shnoj7BWdmkYlBmeLCkzgqUZpdoSLJ3hrmaecsjGt1pLJVy+ZbcUAeWwlJENRsu/fCKL8Pf9EgGov/fLUV38bdWqq53NkHtX1dHgDBI1feJF9Ljo0EiWxEUqPW4nIoMpMrtFJnPgZG1BWS2e1XSAJYcPiROfnDzI7omLSJNx7vEwgnzqBo8k0N20JTCr8vXtfSblMQ7QfXJS8qB4LnXuzZLJRBMhNUhprmgWbkzSPiQ4vOAGEKyahLeVKohc9qeblxad7xY5ATltq1JQyx6mZUPle+00Fpo8eJA8V8W8MDEqjok9WbfxW5N310Xbm3JXd5lhTgp1Mqr1EtxIIKdTa2nmIwHa61JNTqt+AOt2XTCiBd7FX3I8DGsKpCod6nXJpRs4/qp17IiGsbXQU/F684TtvYFTpZGnhZ0jFh/PW0FYjHz1WwMbu11gcJMODzmOrMnlhxckBlcz7wY2bLOOHmqfDtb8LznxnV6vkrTqwBYL/hCJi/vgw24NjvJUR9JlImkHxTtI0Ot8fGzh5vmsSUSKLMuG0O0g3pf0ju6W/+uHHk2KDdxjehAB76F5lfGkeRplaYLCalT1nZDmYpd6RhKKy4wO7eP3Gn0UMVI0oG+lBNo+DcW81V/P+oktGrDpK65D2vbEkkar2N464oirLYO17awd4VKecPWQ/LrFKUr9Ez4kx6iM+aZmGoeirQT6WUmTpUR/uX7T1iB8liTExRQZWz/yVkI81CY3qEjtjqgfP2WNS5NLooZu5GGnNBj0nas36mLYpOdqlhtePawQA+fDVrESFrqpjgrwGMYRNxywAhN03+nxpuyDrcIYBzuzCjTg+z+rDg+HFaIIylEdDPhcKAJqWuMuTIvai31sSGK7IPFOWMlSkWkNqm4L0qKjIvukDrGdrUjXa/b1adWyZ710ZAGfSkSzlZCT3qxclCEx8WHJe1OdVjHwvP/6UBqQ8fGecS6lIXpSKrBdRGxl2IKi0wXqonXolQ2xuXTryz+2y2qYlDG5FyvLydtyKlmCyNaAt6mnmX/k/VbJWG+bEL2CoKeYedXBz1JCp3FRlYbqGzWjpAasV5rvMO5kTKwo2GOk7opZI8YW4pxKaE5patWQVjWai56DqyK7jYabOFIeFUyZUYOTYClSRlCfcqSOYzALpiWp4gHp1P0QEer0zHtej5wil6UoUk2DFyyWhi10wkWaKKQwqAthAv1SxYnd+KV6kxtl+Up6m1XK4+Knz+i9WUVPnDdDPmx1kBDtQ7AAeD8rkAJ9CrzfQ/mmta36zwtAkBqVfMFbVopkcZilDIoicX/WmZSkjHvBjEmvQr6kt2C6pKfF4xZn/kHgY4vIbNeNP/2r0hvz8ue/5t0stpTeovC2O51hJrAlfqZKBc+r+zYcQDSQEJ4QeyFd9uXnk9GSlxbANpZ2wKL9+dJN6/UPjzVBTukS4PQiSelAyGK9lssJqFpK3jSsx0xuivaQhRSQTvqPdKO1lqhz9tXivbV6mncxWtZcvXYXXb3ErirZ/DbOykU3wItiluNW6Z3eCjYNRQEW8T4p3wUqJ7PrY5TeEfPEm0yiFCW7PT9vrYB7+qYg4nFTHg1bief6Z7wRaoYb+d5ozdBQHYf1beqwvm0ONbPfgiH1EbvwlgsW8yNot2JQ5oETxaLZsXAxTFIn+zsFvikPmhc8DX+xhyq5VSjceRySPCnpVLYmUlkHSs7r53FUGhrllC6GkleH/KSO3Vsl5WyUaHmot5Z3HGcZTguhRQMe6bLj9Ob5kitCxQa9VfuWbCNIldbp5H5E5dvHxm93s86ENVzpKaN0YZAWhWy3WC1sy096RYkM5j3I6RpT4K1aMC+i8vR+JK1/oYHk2bs/s7eDyvcu1Nku0dtAd3KvE79n6Awo7V20C0WBxKb7SDWdrRMMYe3Bn5+6aCLZXZnSZRyZyxfGTkQugL7smjpx6QBmSd/OnSE4g0A76Zn0FiyaNk3RL7xhU+uyKHX7zC8Wy76RKRBTr+cUzWzpAZUd3j7gCCgXSdd3L6lvXjrBUlu1iStA6b3ilYyDJxOFNuSRBbfBbny1TJcCHWv7sxB4xY39FoRPMf33CjpgbOrtGzK+vwuKZhDXRJSV3idZUV50X5ZKEzxSUZyUFksaw+ReTvx+CLDWbnxMb71uvXSBPu702PPxpNJxMKItno7TH1LDTjftbbXlk6rtrFtQuuKZFL7o1LhBc5s9Ol5fZ9kVzEl3inQpt+kSkW3pofZeqq4CDBg9PHBP74NUd/DDYO4Pj0JvlmKa4QTVNsEC1KVZvfnCTAMT1dgovUNqD94I30TTAM1qmMVeMRxLWQLz++eYFKm8gU3DDXTqK9twnr8+LrI8LsEQ1l/HZCQ1q73IKrsELDv9RtBUVmul62rFhfu1roS6lolvM4t2/bW1m1RFLuOKBLVTaU5PdeCtpYfe0zz03CMcWlv0TVPbx+xTTDLmtzM91Bcl7UvvxD8aw+6rPmXvttXe6CbK3s0GYoCyufdHpA9LpEk7aWYf4jozlwJIViBYsVdCLo+9pAIWGoOzaFAs8L+/+GdEqT6vlTapKb8LNvFV+b5l4LvanDX7HIx8nywBqWxSU05slHfiHYo7dG5letMKjyJ9O+tP5B57kzyChs+mJcv8k6rLfHroL7vIZ263rLXwpKNrq+sTc+/feqMnzdsM4b0neS2AcW3KcrFa4DNt3SMhZt/ChwcY57UJAADgci4d11wgx2TTHmpTz9VVAfal4JYejq2VE2MXSN6vfJSvENXBog2+pMsd7XpvDRts9iVdF1nfV0yiyzRGSmOtyV21NOqJjXZIP6D3pSe8TMKktMfL2Dl1SeC74BOnFwfbJgh2jamAlrzzrYtb6tukyCHQytWxhHc8D93Y4TfXTj1/HtFLYfEu24GyYsIDMKAa/k0vT82/dVKs9tJxEoWZPwKP+zZRbjzNxHvlj2kPqeyNq/Iinv2V30maPHJqeASvJTVP9Ti5/fSBevkp+Wi+QU7TG0tpPO6xWBIfvCIPRKKOBcfm2YtEmevGfz3N/prnEdWISxzQszf0Wi0qEgfYoI5x8R5xkkvdI34BOcghBv/9gByKq4DpNYAxmiuqJQ5e4I1qsoZqskGcSTwO5idjvM54GIBUUdVAmdrWR4jmM/ibHer68o/sJvjD9HDYGq6irK8DPaZJ5hG/NFy9SJ6kyS/DodMZbJywZkMV2Q8B8zj0TqnFeZXX+3Xx+73pNUk/I1/9TJh1PvZu9oJvueKLLecb+FaLX93OL0vAHDp8eyHnipPUy6F3Mo73+ZWCX7HL5oWsqPpPjZZ0YTXw+9Q7TW9kp5djy7kivDL4hwD93uVPf8oujsbsUcT54oQumQM5ARB6s7NkzUXOPmKc2Q6B8Z6DM/bBmMTzmN/4XMmUXP781w1bEXbp87uiq5FbeeUD7baFMXpQcDN0gV3RTNdGoan62HRV84P10lHXSy5m/ri5mtCWYhfb2VpQ+TbnB7SlX7vm+pcUSmn7PdSF7cyq1sElETOt4sJ18TqT29fz9BdJuvn1J6oIt8ZbGGTdYj75/fQ6RlGbkn8t81JXxlH5yjgqWxlH+lRp3BhbZLcm7iimu905jEFz32kAWWCnhZpDtFx5b8l7mLXs3T/c9q4FMxeMygD+GRJW0SK2xOlGdFs43W3Z6QaRS/1TZBmeUv4GoRLuTPvU/LlnWKaJSw3QIB57Udq3T6xBNEtITSMYXzSIeI8QrxWM8LWZ52MjghHYv9jtwKoUwcislBCtCfUyWb9HOso5LJ9U9IYuvOKSJ/58CG8QdlH4KW2hgFiF7mjinsFCBvoWsPV4CMLEmgNWaQPI2k4awDO2n9yjz72QsUiv2NJ/azFay+U3LbWlZKYyRz4HJEi8zbjxUDBDYu0DE2vBwHwo6rkMADx4tSZOrXI+8/sE7xfAxlYI6XJv08DtzLjsLo/76jTytuiBbBOrMYyPqZ2ElOdiFVkfyrbbSA9RBPuAmmv9kVckn2fcjMMgBVjmnKXTYKUnFy3gbfXRTPG0UoE8MbR0kqjQwWi8yM2EOm09+gANeh+vfSuWAHaFqxWuvP9EObbSvSXLYlC2j3qfvGZ1K01SJm2bfp+UsaT+SeESvUCVbFwtWIOCQqJnHylVigRQqfehraz02YGSB/wQSS6UVuqjEa6K8iTdDy2UcL1Y1tLK0z493WIhcoWtDbN4LUUfa0mGro2A7RhV0r3+5BZ3yZSIjW1LKVh238c4hIhQpKE47PQ0j8CzigPhK3lxV9Z1rSGHvNzW1Utjiw55OSqwsqpGFZwreYAWmNtVOuiDdgMmUSVtriJk4KqyHGMsQ3+kEUtSfhInOW1hQd6WzYqlN6DT3Tu12Um+UBkrbSwgbdfitLFTi6QZasl+wythYRMMVfOM7VvKNFABvrLHWLggKnKaf1KnTFZzuliUtqhYcKltVyHc0pa7hdmvL3/j8pXvqkhucGqL5GZxIz5yvHg8mk86QzfmMRAYZY9/SzCC67tRRC8FwFgBxmXH57MAZCHyeDTW80duGIrWaMkrziTw3W6e1IgpdsW8qezwXybnZVI0sunexJboWlLGeJEExh946ZmELj9KjEYAr20zPGRqxk4z5iz647JYjxQ/v6dkIDzRHBtThA74JDzT5pLYCU/cuFvjUIfsTOiFqzZ2r5kdcs9uH2i1O657JkgGUj/fmOd6NEEAUxQrLKWICRqpG5vRT2qGOgXn1B7o58kLHdaFAaKWNdGSSqK7/L1rr6HNVK90L2W/V22A3rp2LJmUJgVphLaVB2bEHjdiaXbnNVXJsKVvAJzvFfc0aHyfVuDHCObVcMnKWyos3CohA39FbbCkQWXJXIqHWkPxmhTF7XfO+R74kC+znWDGQ0xDR7DJiEuzJqRVdHOAgpqS/lQSqtu0Jq2VLZKT345Tbz1Xa3N2JGo9pZaPqnbxO73ai94QKW3OYYQdfukXq8bgDdO9OHInI+a2B/7kHL/grZLFfWG4r08uDJPi2/vRQeDCUKHn+OworkEeWvtJvUC+QdgeeoOdBG6yn+TJcsOb+hv63Gq4RrOZLYsxCi5LzdLj+agRivC9abkBMXBExm4/ix8K/j45lg1CseZbkafMGNjTj++emqMhrkV2ODRC7T6toVoJzfvVaF6nDW6OFVFMQSbItyJzUNwCt5ZZMBrlZsyDQqMrMxH5XsZ+epONLrjlZM/rp1veLbe++apI9K+JXbFgUb6FWSajFjdYaZ+rqvHl9JiQmCFzTKgRrlb3UhXhLWoBl2/jyuS/SC+P7TY51ukqy2Wn2M0+VtqmLEjTTDeMUmOxueiWTp1BDyc1EOCob/EsQxkNOGxyWr6Y3S1bE/i6Gan4nkXDRQttq7kSHtdv4Lh4uEEDPk87CpBrUEOa3JtbStE1379bYdHOnplUlzRahIw/ZOi+VvE0zsD1TmFunP8giB+eweO8Lt2Xj+TMkTly2y2aVDp1fC8aI+iiAB2PaSmnXvB4xhqWIXt+NE+OceBtSy7OhXm+LtmeTNQzbfB8NHMHAKd34Q5x0B9ukNDBhRvcN5jgjTvDtKF8CMdw2MNwokM04OtiT7I0I0Y7DNLjHJvJAQJaQS7/IP4f9pAXdeJJFzHpRVMlumEcubb88hf/XFyTXvJ+pi2Lmf2lW7upM5l0khrzTsoS6ULTtAobn05iTunx0vR0ryhox77+X/6RltTfI4dJoyj4D54okA4mZLojts6wl9EfMUHVoa2M/gD/meN3v4c/ThNPsXWePEd/wXYGW+yJZHXKDI0g8XcSiVDEmz12i90vgHOe0wGr7ZV9GLozklnQEYqSkBGfUbj0QqiSRD12JOBQppNRv6moqa+lF3DmvsUkTH0tuWmLNd+J+J0+tCFJW+tjiW91iKm5pdCJSpNbwGzAtCmQMyxGjTpy5jtgfLs0peHtzMNTN8LjGWTn0cOdJy+e7x8ckefP9l++3H9+8HLtoTMYE9+ZuvxYmhcRMLZen5qayTmLmzq4Dk+Tgz0OeeqCXRu6AwCaobjGGiWCNkWzgN1Smd5Oh2di8ZZg946wbyBMDhhZ+BeW8zC5oY7MnMEbNyYnzmzt5fzkBFYP+I1OFp/P0C7HbggyiuffngYD+S47PJgoTk4m84F17gen7sZafx7j+F6IR0ngNfcMb8a7w6fDYU9Cfg0nhwzPxrDDlTR4lJyahHnO1/B8Z2rCOzSWLKos7+ChlA47lIJrxzSiNBSUO5kEfSTJ2HVoXQTqlTgBI8MduqzaBMk1TY6EgEYGowjPrCQuCzlxg6kL2A84VlF3DfX0Xo6yv3HP71Bnz+sMmGwQcsjYEInDpSEld3peewZG0otcVhKD0IjlLHSdoRt217Zf7N8jTNSY2HWD/mtlYHbwZhYgrYcddtLmDnw7eHMHz67eeQGSEg7ZvLRoNZqHYXCC6x0YmVlKG9NkXhSsbrLZfDLpw1CrmzGagnM4TtujrWziRLRe4PjRsiZm3royM9NGZ8IO4hOqiFP0qabYXRUUKF0A6aloYVg8tClgh4bu8H2a7uEOV6okiTVhSjb1IvSGi4F4Fzw8o/1ThlcFijuZeDOYbt8/DSZzfk3plUCCKTW6Ek2ck2glQBRZM3BdNu8IjQTPD5xuGsxvwKaVTgu7LVb81hm60QB7q6xiVtjd4GF1zIYiWxqz3t8X41Jud0foAizV0mQmFIdSVzglrtQ7dKFermXLTIsshl1k8G6l5iQDxCAAi4KryZVDwla3PS5vV25OenfwbeG7okkJpsEkODlfgXZn5h57EyBK3JiKH0mDP2JjdxNzslTFM808CmHXsfJZnaVaGSbgpnlPXH8eYSOF1emZCYx3YeCfvAhg3ybiLFcLj+RMXwPNpyLZgZ07bKdXou5cw5PahJVMCrulaSd0RbuC/sRd3bRzH0jsjTy64KxoTtg0z9zV8JN3gkix7Aw95wT3ECuZPuhHcci+7iTx7pXMzF1SGkScOahGMXyzkqmZ/wCEnvKKwlVMyvqvdwZhQG1Lp4+d2J1wNU4CE+gOi+KsYMatO2JxpPzluGNsayWTywE41sBjTW72QyY0EohPbUjnsWB6KSHWkaNyUpzNnTj9IKSNzlgEk0fVOnTQDe4cdOSGMfSEksgZcXeBxfPu8H2gPAGLJxKnj7bWAln3bOY0JsbUC3rBePdQDNyNBrDGLtfz0uacOuEbbH622llXtcHTJvbddy+pWaK/rNDH0iCh+zyMx185JLTH0uqgsNe0Dr0SbxWWLJ0yWpXftXUH7PSJ29wmco8O94zpM3Z2WqpKq7O5Z2B0X64gUKROO6BXfS/ZhqhTJqFnx5usUGnNQDwIveGJe2VgzH1G7SN6EnilkfgKGj3A3qgOd1JYP9FoJfpNIwsdbCdLnZyVzDn2TsbggbKpuRKsZOLQO/GGnRhLYk/AL3OnfXc4XM0mR1A68N3VEVoYmOG0w5PFK5mW7ms6VP9XMN/dO5E7o5UEsJMC7Y4HTe1bqTF/mQy+I8Ze+rplmpOKz8pnXZUPbJo7WUDS3fGqlhATOIC86ARxxZDE74KHPKOLK/y1yKPeveMH/lIV8UAef3W6mDOtezZYqloUzX0SOrPxcvUxb2Y0Qs/9VXpzOZD0Q8cfjB+mXLhieIR5vgaKmKheRwsor2Q5FtHMDh24Mf0XywA2He6Chxy7Z6Lh9DJ1UJnWmcfBNAhnYy+aRqubdok2jgm1MhtuBvaCebhCpVLmF8nO7/vp3uBKAFFWtJWaGnsdY+H0NB27fPUeBDHSwY/ptSGNqTffr++I0fF0wGqqJY0zD73RCKvBYs+ZRKufHnvO993JcrXeODNq/6rrJnMBWbEZMsKBZLseSs9isZ3mFdDCtx/iyRhmbFYw43tgZZwwcjvRzBm4DdeY79ChX+LIq6pRzpkd3TNvycVT+qws5f185vqrKMmWZ74K22KGYsWGRQciLckGT9ZzroOBee/ObDKXKwh9d7QSXefblKF7AqKBXVXYFS4rmZsfZsGWriE7ENehZF7J5LMw4B1QO8zerZLcyuSnzZQ4sTginZofIMORlx8v1WZkY6540mV7qzwiqM3LDPqLVRZD5oEi9iWHNOAwWHWRqA4QFe3nowcs5XINbCx2a+5M3FN30qxbswfjPsVhuzPHC7OB16V4FdKUKzvVls4ZAdsmXjwfuitwY9JpaTrfd1daDZMBgd4Vu9oobAaCvjNUL/m7HrpF1apDs7zYdXRFi6nL1LljqIxb1qxsQtiQ+bCCu0OsWVzBvN+8Mw6GJ26nDzZ+0vCu7BGO/IAOvILTY9qUy89zmufFutOsqC7Hgsmz0ggr7ZWzYguiAbHaMy0aDEqEF8+lXgc7JtRM2pMsQddYlNOlm4GVHAtPZ125srGQquO/4TK/El2jk16tpqUgXIG3kIEANP0QOHCdFIzFU+PVFIB9Uy5TovOvZFK1KmN18yYJqqF36jV0IC7VapGm69KDFg95xGj51iSZV09tL3c+Nt6LlQQY1Jn5AWsRT1mpCUmAAE8XMPLjAzwFcMWwxO8C9BSi62HJRJFcx2fdXlei3Oyg01lnRkWLHnmlJyFYZH/52x8Pr9CaDzw8XJXQsAPbhtBdzT6I93yaCAp4/mvDuYKlz75KnqedQ7BDYrSiFXPqdaR8RHPo8oLXqbcjRufdklcTyjLOzBPNK55VyyEvobbXhOzVLCtGWOjBoO9zqb5SSJB2eMfJyZwFBa7BApNW8429wZsVRZq+dWfqnHl4Tpg2NI+bPNFKV/NnbPgfiNG75gPgS3HqtLlZQm5HS8KtZnZD5nE5LqVhZubVrdqV0wCZrfh0a44YYOODI9E+5MpV/1t3+PF1eusm/Cjl85pMFFNi7GTm6GpnpJaTvjVPDhMi5eIrA0Dfpy8pjWye3pkgn85fJBUCK0/hmuGCZdqLrwkswnhdl8zyt+7QYyGdwSQA1jecnfkuDr3DRl7tcqXMPJMFcpUTL7ecRFoUlFmvan1UgBCbzZ2rynsr0GBj5YNMyfv1XSk77pkXxatxmHkOenlLdjkRWCulOAixuLFZA3TEBl16JZkyGbwKcug5/uqmXMHCr8wnb3tWqtUJQ7GW5Skvh7oSCMbwVCjKca+HOeEqJM7vrSyw+a07r51B0AeJZ5kiZkdCL1qRBUnNljts0o5UjzasLFP2bW64eSA56X7XmPmkusWMxAsx+AoqbIzTGnpjrmReqbPhcm2rcXZW177iIgAjJLwN3iEtkLuC8lwzUPT2kmt0DuLbd0ReK/Rgomi1VvA94UfRG5u8QWfo4SVDHbBPYJBXdSSD1qVdYMlAcgsuleLVHItI+kVKjv7KUAdvIAKvHc/X0WNv/GYWIMTbeVO3A3TurLF7x9MWk7y7JDaCApeIorwBDwzdM/gO/ttxvt0bfWfrfZh8FJH/7e7d97YAGdAhekTOeG9P1/Z2NCCKj0I+ZwZRNNPHzZbUKjO9XLS1Te4RPCJ9q00+hI3hlF3q9kpc5MQucdpur7Hmmn7AL6D5q3eXP/3JX5H7f03M99Rpzx+K57O3xmlPfvkf4tH8i+y0l+biHekWvRD+QxBO7elTw9PBiD5bfL+eNtJAjIQAkA6hwJNIe24onjuVn9Px6Cvj3RbjJX/Ru8LyXnbEy/xZvAvsVB6HfsPfVoecm8j0WIzXotdxdkE+ffIRoryB+Hyc3DiLzG2vpVL10fa6EKuPZbFaB7kaoTyRy0//4fYt+MIoWJ9ogrWO7335+zb95w/0n4j+N26bJO0TSdKqvIoE+cQoelVGmYtBDLL4iUkWPzHL4ieFsrhuFMZPhPB8woXsEwaqSSA/EQKpPGtAqK+Me1seV/6E5LlVOJAjBkrf+UObCakyLvtWGkmfZm6i5WMxflZgP0GB/UQR2E908L76NMt7vNJTvgVztLY2cadTJ/PMjnQPJLvt7qtPCeoJuY//fII3yuFXQ/bVUPrKYV850ld99hVSPXuvG95NTzsf76gw3iOoq6hVlz/9v/GS+K8+fYVfaQMw6A1DHANG7I5fHElc2tcyTaYQhOArlJwAMgDf4p9/0rafeuSFUcxnLJ/w8ldfUBPE17Y9fPl46irrw+Wv/kdytR57/hPD8wVKjQNYww8jB+AvVEBgKCHwkr5dgsFQwkB+oQ4KfBiREwr8Y0maj+k2iB5lYBcOH0riUI5bSxs8c1VwgpThwQJkSAtkK8yRqWHSzg0co1xksrKNwqq8qUD6OoU081AhlBb6UoBEeg0p10grrghElLfzyG54sC7ZTaoA34HXayJ3GWXodcKw1na9IThaYFbuo2mxt17TGbodOX4HOh4n6HisJ57HetsSxiLynFhyXFC/lAisyTAZtasgH03nE1ksKtN+hG9f/uRfKKgoT+yTlfHX7pa1vsjZMHxXyE9607aESyMytCiEJ8ISRJlbmq/RyiUusL3Oa9GifICNLu3XHrnxcTCjC8jUOXvkwv6/7zpxRHqb9H+wYc8wauIi5gDOvh93B04Uc6khrR/CdGSrnTz1WjiM3JPMOvTyJe2XP/+1uFy7TTqcWplthPQM2dzgz+Tf+64MqWwFbMYHb1cwrbWFtgFNoTIk6HhyaTHwdRFASpHV5UX6HcSDjvMa7xRnl5IbZVceckTVe3MRsdLWwq6Ewr5mibLr7sDaEC20PMsPLg3b1A0zWl5LPyN1/lfnPS1GAm5F1CPweJRVNxlznNnWApgERJbeVp7tSe6H1yktvz9PCUwKgRLjpvqrXxWee124fdhx7WsXwNxbWgAzNxaJU7I9fDqnEjqgugM28Ge4hZeDPa+U0A/5z1+qn4GlipNoHP44Op+CnM3I22xUU2z2zVBJqLa7fIyNt6n8qcsG4khm5DYLYN4y/frWEl7MCflJuk+3v4ahy1EAY9vtkdsc9nwg7UbagiUotERn7ntv54Zl5PKzn32DXGR4kmXxRj6xLxCfAkwuKkFJV/4cASknScskDLinAJFhpseG76grtjPOWbCstbnRk8dXleyBE3moXtQiuV32sbXn+WgYWyqqVAXzAaXvHjuz2QT2uB6MyUfJwsvmkCH1AEwK7Y/Yi5c//6d8iJ8FRZDDqyggfOrtMpiVwQTsvgChCAsVDIXT/oaX2gAT3wsTKW2ggs/zDjkEMVMeW/7Bs0WE3gRC90oHCny3ZJyeYJgtZePgnRsqg+bTj1FOplEfnxEvwMNgbGFff0THbBXA2baGD+/6VOIEBTLQskCi3aUjhllhKESKAVGIkBgWxvQl5MDTE43bLf29QWo0sGgDV+6MO49rOXORwHxsJi5SgfHJPg1wUvOjmLeFQNWcUVSr1CEthCt19NayelnuGrYNhnQhTA4Cnx7vdYeS62aHyHsJgdcMBkZH4z2Jfa0dsgW25QMwLN9hSElfLMooKtE7op7bhEy5Rao5a64cWNmumpNqiqNPrKlET+zMa089lW3O931wAv2Bgw3kTVCoBior1qR199vI9PtrxdEWfafUyixbyR4N5Ojut5vDL1UTa/RScQf0UGPtsFO0xIjdeww7cmvNdm8pj9kYSQqlzkSQnkyQb1OKKCJ4s8293nU6exXqdPa+5nU6Fetqsq/vitfTnP8vP8RHX9EXtOcf6iKQs5sq3pfJ+UiacdL3idrm9iFllTFEcIvGPXGUW6RFn8Ot+QZRPm/l5B5zIhw8uqymw2RIhmybLEVcW2AHO2QH/WgVDuP31eBByS6CZm6AZoe00IjsBeFU9vERFFq+hU7MlgqTCA5I4MPzMBKVwg8WQGDEUk4mDNiIrYFAgQZD1sxwoF6YocnPhf/AmcxdzOtO59QrHMP8uyK9+SZbp5JWndwiY/gZ5OqN8tXrspmcWNRxSFOl0d/XQ1FkA+PYZs0YbJxSAMMQqNRrd91T0JY4pRY1G0gcJmvq81vJ8xX4hmgdzKc86H6PiRuvK0IJk2bcIL12GW2GLrv61mOBuGbpc/nZz2j4iwYx/vOXZHsD2TVkdVIoWyzAxYwpBrNuMUxyYWanClGBjtmpPVgk/yhAZiwZ0y8uP/sJEUmODTEb/PKaVV/hJzmjoeFtgFwZkvN3TAdELOTxMijRaUuVQY8mXpCLdRkEgSDCVUy/lL7r8gPryROYcb9AyNdtym4cHqVthtRPkmA4W962X/HFkI35hA8pjFIy5BO6HRcjhskKLuqSHp6q/g8aLj7oRX79BPxWOtBFu52i9AQId6u0Fg4J+Gw+ib3ZhJ/g2Pf5qWgMx8CWh7qO6Zct/Q0tElQ3N8ZK9Pf9wWSOpwiThjaSB47y7nLuiiwFuqCp8DGRLwWUUPe81dvYbADkRASN2ygBs+Abc6y0TZTwotJ4UPrjK4qU8ae2IAP7/hVL/OrDA3H4VwqF0ryoPrAUilmMPofY9uco9GaLsLSF2jbbQMBdlgSiYX34j6g1YU+Q1/AMf4BqwizP7M2onSkswFsAdX7UIxk6D/evPkmQTwwNT7Yk+vdyHgoF/IoX6X5SUDrYFsGeBWFX1adZBKjt3EjwKNDUsL1olcVUGZwenktRKJl9U0w+dWYs9H9srgwrszdUFvPtcX18sB3v9YJoz/Hi8Wg+MRaulIEVUoJffvqP/K/lFAuoB6ZI0gzEi883CPaexOZk7AyW68PUJHTjkDsY8rGq7kriMdEA/gGcKSjiotLFIzP2kRZzvKAoMretbh3zAzQkQluRHzZUBioMuRRPEy8a1FBr1+lISkAibSiTZkvTrkcAy+PcPQMfc3eeGRIFMR1sDz9tM1NrWVY/YSJzLElv65kkLdvDIQrMd8NgPiPPXpEP2VQwC3zgnmdxQX27y+cgz9q0cjgJI7Ra1BB1o3kfTzS2k05YL+khXZqKS98FXcf+3k7IanALEWS0F7h5qXNaETWTf1sVbN1o5tkVPGTsnDrehCotdjyixzj9xGckeNMO+eGd97qVbK+hhu7UNXqiulAKp49x2la3FVexR6tNs5qXfYT0yotN9WEL1D3NFaQFoGUwbKYmwOAl92j+0bQIIo9ABE49dvzBiaL5lNX7AkvH3nAIJpofypVA6GBZH11GQAqCUW2mUoD3YKyM4yKsAvySZCDq8FFOO+fwUUptbNryUR62lI+9cj7KMJj5KM1o4iP2AuDH+tEFQd5R+0o1UZoy2gBmwh50iCNL2ik/UpuZaOLRjhfpJ7XzqmbeqCaMlrtD7okdsnmX3COLbfKz7Kuiije6aGRcLxPayDCupyZ0s4pMF198Gi2uJ+JF5B3sOuhXvIc8+WFnytb8H97Zwv4J5xFJnIVqGsw2AUlo6ohNIEmA7kqsCS+oyvGNfOZLv9oe3LBhOTxXNtnH3FvC/8mMlqcocJdwhsRhSusXdLYepj7qOJgMI9ZL5x32voCvXLDS53wztkFZHcxjthQjMM+oOQf9q8PXdOYXYsp062rtU9Lw7TNy+fc0AqIEb+1d6HreM7lA//liSXvlO0BQh7qLUwdAOOvMABaQFLZvwvYq4Qi2v9H7xBlOvTiGtXLuD2FRfXH4/Oj5zvOn5E+/6d3tks6dm9qFm9qFr3uPkRXWQmgy87l4d+KOYPEQmLWTP//QZiSl9OBfRsnPpn4jX4ghQ+9kXG9Mw+b85fnF+ck5aZ2R8zSnhclLnqw/S3N/53IuM82m4acvf4taKRY76Z0wZetvRTIRg8rnrNsFe6QjP+LkBk0Kyg5E2pr30Wh1dki00atUvuCLFHhhCUNfKWGQixdus2T57S9/f0uUYFjXMEhRpVx+DFN+9Gvwo59PbMEPM8sGBn4krUVeyOvLPX5MAlWLQ64oWX5UTRtLHDy4EKXm0phytxFlfiXDmhCPydmtC7LZGbI/erZARGku5J4xQ1IMRI74UfVFIfuBOyjEkGp8u8uefArPYIL9Gx8OBTp9js6GQPC2w795ZZ4ZbZHVxJ8bJ3bENMnEnWTmYfHMOm3fuKHvTviMaTzxDR5gKKGqHH8Mafs0nVQGgcVQQiV53S2sHLEVV61AQINDlVta/0E2b6Xpng7Q9VZB8tMSxnJpLoKsbTkLJt6OvdGoSMBKKCCySkLQ7/cL9VYDoUi0ilE0SdbnxZLFYHg7D2J0C5+Chj08A4cYcM/MrA1UQ4zVyQ7RkOTN9oXFbFaowYbLj2ZB5D61tB5i3OTFfEsi7Edvo29pSJJBD22tqCBFAThC0G4n4HT6liZV8OJIphLniUn+Colj4FEh9HYQyWJiBumLiiB9bg1S5cYdsm7SHiZS5KZkyf/Gh72NzVfCaN43+S0LgcMqE6vAs7nRS+Gh3kejAGVCm8XQbN5fuP1FPm+0YoYyJr2+30w1Q3YujUclwFAO3Sed/NW1QeAM5SzLYhfLnuyzFhlsPTTlMZKK3Ac4mTEenzzy5X/gMyXZAfsGGFrcP3n1NPNqeYIjL6uRwv47HDPZN9OX2D9zmA7/7Ilvkg0V1XDJQXwA3uFv/l0zh1/+LrV+SYXfg1dKK6B5B2fYOMV/Nj8Wu7IW6M3LeZ8Fvrvf42a7O31DWqO5j0fA/5p4sM8CSYjHrg+4upPIZSkzgOY+GzWpqas+4CYbsCcG7LQYhO3FJW93ngreS+/EPxpjF+lyuburHkktkTvD05Zyl75ZUe7ulh75uyvL3W9xTBECSoUsEbvN2mL3W7PYtTS52xRyJzY38NSDthDC+iKTtpTpmMpTU0I1bMfQitLbt8qlqaeeCy6RJsPTltIkJcGqSVOv9Ihlr5IVU8UJLL47nWF/xSbtWCJPDZsJm7ZKWQZvVTIXW7XNxVZdc2F1QriuuajGX7PBEEuHpdlogOc77BbxQnfka+1rqEwsczXquCfqBk7m7P0itZZchcwIv0s3c0Vj/db0WGMSUWDYv9ZWu0weNmvIw2aRPPyumIe5nGvq2Psd9YqL5Ap5npTGq1wGtNzufeLM43EQ0pKttFKbANWf+PMh7IzIn36zinT0Tfq5ofSzOUOr5qI3MjnnptO21zT3qoO5zSglqWi2cIS0nlGVkXSWR9/aJiBrDvgFH1DKEu3jtUPLqtvWbNLn20n1TH7BtpQ8Wy10X9hDJ6cBEviouasPG4vcYpRWLWfHOGxRgbshV9A4SJ9rIH1RBBKt+lGPxtDMnLigLChIzDGHlam99qsJ88yg5RnlLBTZpNQ3PsRE3MYF2XxlNSEebLTIYxdMy1tosslpWsJ+8rdzvPysJrqtQlpgnqxzYQRDTRaFCUPLM0Osl30xNeIgUU6pIYLlG3yCkhSbMcuk4/HF1eNRnLzTV5ujeqsD/yZBNV2ATCtQc5N8kTfJTJni4du5d2qapIicbXNuMzmCJd6pfgALyayds8IOhuq3RgEoeEgMU2xejbLbBFJfLBepCsvYkZFhja2wR/oSe1QDuCUttjp0XxRDl9GcF49ttLO4+EbXxxe7NqMW1l2088uElu5EAVFKGaxVmCzdjwKiFkCFPhOrhxfBU17tX1m1kyL4rEtlDiJqBGzLfSCyFfUm46RDfYzJBlvA0+4rBZAz5EwEkt2YZ3mZD+rfZOSCXFijE9Py0WoITRGhdpG3VhsbGBsIdfnT/460upDyNvL3pbWUlrh7PkZ63KXws1VKAtFxXuMdMjSH19aoiR5K1TBj2bwlaplocuTyJkcXG/kpPbNgC/q68GO5lJUZIszorMQOfW5BoV1LO0RP86/EDFHyVLFCu5WtEEVmFUbIHhcrG1RSFGqJ+AotkI5/aoB2mzRAFLHV2h9r7aphf3Zt7Y9BwFRiVWqUFEiFa7QZcJJnAtCL4h28ZO1+UtC3MAxp7vMlDdOkdXQZ3VMKsnrJAWlj/Cb7nL4F1p4wR3LqYKR3zM/FRO+dnwOo9CDXq7LnzIcra5wexoVPqdaruqKVL6SbhpZJNSF9MQ9dpk91zsKu1PdcwOusSZxDNz0De+om/e0WPjXcgJtavNM27KL/7q8lw/m//12VdaU69dD6NqgDBmPejArgwKvVgEUcn/ouTz3KXLH4F/hIhRGhqxZ+qra8d8SBe0KJl1Q4So5Drn0U9+/RhViUguVJSasHpBUPcfGAAV5xj0NymHOfbHWsLuXs6Zdy5l3FSevWNkj+XZw9ehdnuxExrUdqKl2rp7Ra7qqQdlFacDokh4hkH1UNG/KNc37QFeEypFp4AUMrn+ttWm1W+ACWH9ncbsm6AbVqyGV7cRDhf3o3k7pkY6Ukf6lUa0qu06NozQv2XzaHbszBlQq2fvyzeQH/S+KVVFrRpLT/BRmJEgo2LvjLNO03bFtY8G9sR2OSL2KdTZj6JIJpvzTrUdTNtu1TlQ5FtMsv0pTHL2FjfbB1LvYsFKGIsmZzckNYdhS4IfVoZEG44eIVqMeN4bHXj+Yad26zhtcSqjz0RvoeRpy8+PzanJe6ad95077z6tp38h7eNPpL7556bDwG9kfxfG5zF+2dwHfll4qu5DFfbMdizsehOxEnWWjXn8uf/Auh8IhGjPgFm6ywIeQDqvnpcK29tIV5ir58zSDv4binTodf2E93Si8QxFB/4XzpmJeffWZs7iid7WFD7/PqnJxBbdtFmsZkUFtQqGWESObtntQ7sgLdBCD0Bk6t61/prC0JanaLZyLbeL/Z/bw+fyrv8MW0CKqUGAVzWtCJESgDVTx2YYWaKk1mD93RxD1T7tvZj9Iv00nLBIge9xCXhypnwswCVU4xOqI4ppUyTbu/0wCG2oRxDMQYWzGJTWnPpFbx3Dyjugfz24i2JXg+6yNuCYFy9qNIqhZoFmBCrov3xtOek1JjrVIqbC56TV0+KKNMz7oyWBh5Cwh2+asvBtL1uHvskmXtdtw0cWn5wnLQj7L915rA3+p6YIUAVm80RgF2Bo3i784ibxL4xWKgWw9bnolFveM0qUsG+Iv5aETAjuaKW7IEBHxeQXB8opUQlCJBaygshS3hREOIqMskx6Xg5iF5+WzlXDdbfI1te0lQX2RLQUth7pXA3GsUZk1kQiyKipWiqNIluUySavpODbEAJy0mf66H1Fw8Q75cj0UGOx3cdmM4wQm9KPA30nuAPH/shh7eR0KjeofiOqAoDueDeB66KwhqRG58HLDL4qbO2SPwZuK+68QR6W3S/5naF9wEPq5p4GPFsYabljP1Ws7ctCkobFOwlLPWyzkWnlpC6xNKWUAOEtNGHX9WaPxMiQLQWlFqgdGQicvM+ZNq+Kilt4s6MLWb1m5gScbnp+jSSEBSKZ4T3FGhy1SIj6XC72mbXvOA4QLpy4LoB140KeHNdk1aj5yEDulpreIbLsoJokzMCXJB3pnuueDEUSiiwp2hyIVKkXdp7e07cPZu4S0Y5DZ83aN/99pFtCoAmneda/0Nwsf/psC3k3/ZIpCcBMylrD126e1wf2Nqmmi8JC5UDgwqgZciOl7whhx/U3z9iewvwiDyTVb38pWFf2Wo+E/FrfQCaHU6qWFXfhuuAmjV4wSVZ0+D6eMkkGjQCaX3SSj1ZrCFjIzbpjCTDp/SWSLZtkZF51HKTk4x4UH9wURDyzokxI2auFMUr1wRA1iGVIy9H8qZotxTWEkHS/mQ6a9UaKPZ4VRZD4Uidlgnm1BrdqYorcUFKmG2H4/aOig0dtkJbbrshOWtg8Lc29ALVsEK6lpA3CozyjcVqVPKtxXVmDPPkxBphYw7ofScW9idYHH1hXwKPdJQy7EoID0o0DwEr+yjZ+vCjfs468atK37cOj9qPmLHw5L14tl6G2+xyxC1lvO0LuR8e3Li9kOHPca3ZlNQBMl19YbJlNm7vNpkRM4ogeh4toMdGtuOwmAVLMsZpvBKFmXZr31c4Nfu1hBEdQIuhFK2SwhhTtYrA19GAF+rAjiu5Nki1XR3ZHdJ7og+W1XzVt8ZMcyt+iK7Zb7I5zm+SBlcNq6IAbr6i3IZQBnNKRYv1rHGtCib1uTPq63JvMFj7qL8xXIX5c/tF+WMCld1omsty5k5K63LlWbNtYVqwt+8Mi9uEOWlua5VNK7N1U1jEf2XsDg/zizONRaAyqvzY2OpD1+dx0tanQttzBlayIqOXFK/oftyatFEmQfH6jeqbFNUj69NhaqeSGVQ0WVfRaVU4o24VPEeWKFTLd+V4cL6JKXdj2q49NmeRoXeOu13VO6Cy12ObD37qmzMol7DZmqoF1lDinq5hTOgXm457XcsgHWsbzS2E9E1GZIQTMc2Mx2HrJNzZm221sZttFn3rWZiEnRWxeCnuD1eGm4F2ikhV1QoWAYGk58zU/Ie09X3Kue8FXYUlYAVWdG8IrDGQPL8wWSOZyRN12Qao+WFRr+sIFkzQUxE0ms2C4xqk2gnFTi8lijFvjLKraJ7Obk+yVhXrIDjFKpX3b4ceqrKWCTahYtqs7JtAqq6cFeKIZRKe3s18m1CPRHwTJFcZayTjWKncnzdIPWtXF1JaNVpWRwDaS+RkmpMoFS8C2MaS5BxE3i53C7PHtlnCavklFovvG7k+ScIQ09kiNrsb96Ki6csxouUwjZMxpHjxePRfCLT700+Bbkb+qaKQIyT0Iv1K2/wGAu6rG8aXRHtxbw0cte8l1Io5NqaXR6XrCzlNtHKKkJeZPiWTbg8sd61FetyYmSluvSNJQm1ul0TXgANHOjicm1jIY2TIAQpPXZYBWlChjBxSmpnwIzhxJCm46UcFvvC9v0z/XhS4/SIWV8YydQlQeIHXnHuFht5iE6+yV3aS3LlioT4axAFa54KNnJcK1hcLMhjkyCXD3AGLy6dJJVEOcPe5cqyadvNcgNefJ7AWyVNYEwRMKm/yeHn5/Cb3VgulYU3mZ68TE+TaogR29R+fn2j0o0KNmtgopLlJqBt4UwZTwBa+1PZE3/pZfXLXztxu0t9ilqrp3axQ177ncYOrC33aBm/At0l8+NBMBg7sJs9FX+xY2U7sJE7CcLzI+yecF56yiwdqOJxs6s6PtYyH29r2x4py3u/4jGza3pQSz88k8pHQ6doso89Sg7IWRwRUQp0QAZ2vdHIDUEeaEcuNO4A9oMgmABS2PTm8uf/hEGIR9qK/Sg5cmpMf8LQWCTNirLY5YrmKxPTBWBCS6korgeMvJmLcZP4eNE7mUuB28UwUvhoNXddGL+oAePnlWCUWSTuqcxjlBH8HG6r7hQdMQXf/p2Wfzux5lYoRG9L4K88ucl3sMI2DckaytdoaI6ZeNZjrlSh6VOyUvMvVHTvET4svAjL6ZlomgELR/ejqXNmWlo+Fgr9838qpjQf+nhYQuNHD4ELLR1TnUzt7pD4nNCCxinAwYiu8ocIFY8vfIB/P2J//630dxXGtO2wpNqwHdvLUxGaD8VgiKrd/F6EPTKPx8E0mAQn5yVwqJ5B96k39eKou0/HsGZGOldVvaNHjag7p+4Tixkycibg7WwmsesKtrACbLTjVVXQ4nBuC9nntSGbuaEXDL1BCW8rmaytdjYVYKMUdiL5QTPK8AHMJ9o/MT1n9Cxf9gUg0dgBW5kBxsO4NQOHhi282z1y+Yt/pvGYKuANiUdr8zaLYWEXvjrzk2lyLK/mOl92aLrK4sNVqkx35w2BXnKIvArkTOMygNfecmbm4jF8yrLIO/HdIax+k/m0pO5Ih1hsNRNKZ3DMJjjT51v8Ykg1gt9i90amSlu8JUo63GhR/+VQjNrOJO+7KMkYi5umWKtjR7OVES1+F3DTnpLqehn4RfDlplNJfhxLm38plFPklPCjM7pJNt7URZVNclDutpeEUBpLO+47UrqvJjJKcK0nBdeoLkgIbS0LIVOIbQFUDNE2jTm9ZeHi0ObXx0NJ2FMNq7UJ4aCvchfC1g1tG9IYkYbuCVhUxne64Kl1F494W95KDvqYukOXn/4jJc/lZz8juGFVmiapHZk2Mp2XMp2U9ODRBhnx427F3hCt3Fg+4dRMRGW68d2DmWxas6jl0LHQNdPJ2FCEHHvTsZ6wTFmT9vSzMBDhfAAKHAn8NnqfOJMJ6cMmyI2IMwQ7hN3d5v7QDcmfftO7211dyD2Fqm6sPR3hJtz+ZxBut2sWV0lfF+0gl7QBzEbjleDiDto0y+D7nhZ83yvriK0Nv0jgWIdVtqRSHDaza7B4z29XRMM6eGw1uSlwbI2tqZ43y2E99JsX+JVNkxbtLSJPtVDvjuZgiYAKC3v6FbyrPcm72lO8KyviW7C+YoA3DzlDZLdwVmkdrBTRfSG9VwbTB1aybwhgSVHSsnvnK0t3Epkq6zHBhpkXwVZ8K3hl0EToqVjpKL22JZBSb1BnBMP28lf/kwEsqyYvWafLTrGStrtB/7WqLXJpSXG7FFtIKfLLAnTXrsXCdg6jFfOi01/h+gg4WM++8CrekjBs6WFjKyQ0zjSEAy+nL47HZlGQehn3ncGbd0447HrRrjt6+BY7D84AZHZzpwNaMzjnQu35ZRx8O3cibz8CApDviT/tuLgcCDXuFAFYyKEy83CYaAZ6vYnJlr6uqc21Bi7XPt0JysvkWRl3sKA5mTrr+XOydTYGnM7++UKzV8vI2blzesDWxoWxcCU+WNB1ycvD2e0Ajkee78Uuhu9L4OB7G/okC3hYOTCXn/2Gk00MQCesMkQ5ElaZxNc8k+jZUjaTQsyBIFVe7OIwrNATOXGCih1zY+KudZgp8bZ33zHE265VC1PqAaS0OB7wHYzhOI1k7jSPD1+5X+aQVYHDURyoHH8kD6KvftKuueRpK1cpaTLrQ1XKUONZAYgyuhSBI5Ol0kJbO8qr2dryVPC9Ijstsh9ixUvSkT1xUMEugbtk/AoTt1YI8jVVw69zPRCskmStuV4vsFovhq2WinSVC5LvZdYfLcnIs1oiNLG1DOjY6i+FMyxz3YuGNZr3CpqgBiyMcg48J0Vpu75/rdf2xU6JyAuCdFee6aKu6xchSGWz+NHUqKZXiKp5hGUTlbUpEevfnx1xsWxIJm6npaZlli60syDy+Mo7nQU+mgSltYe8OFkTmKlq050+7DVOO897jSJbqXQUPZgqHu7OpK5QyyVombb9eRCWKR0StqAh2+slk7qO4pURuHm9y2wduZTEThhjf4VZ5Em+nv2ek+/1YFHvCaGol2nLOei0LMR99wwYN14U6S3SWwjpz1eKdFKXlwSjJfTNUXM52Ju98hJ21o1qVr5w5vPJIg7RgGwujU0mtJloRguivKhkfrFSlNNtp41kZiiQ3YuaBLMw6pamZijFSjUhE16qEsgqm6o4kLWkO1FXVu8Gkl230A1eXVqFW1JlpVzxW/RGSQ2V4dS0wGAZJ6aTEi21QktJ6CmBfypxaiWPVY5hQgMAfws+ztB53n/NAwB6NodfifKL/0M7NJB/CKrg9FAW9mNnNpvknk7krey0kJU5GXX5q/9J8hAwOMYaGXPONIIL52NDlzF+qIKa559aoFcXMhgdIcv33tMvAG7phlDSepmsGvxlQqU7L5kHEB+Yf2Xt3GkjMrlhStuWSjVK/wS6o7lPFhcM0LSUBLbBLtCG/w8Eojok7P0GocFulWxMClHueXFqBXfdEKz38OFZTG1GNtvbOsZw/DFQOdaMwUfU5InaP5/W6wj0n8/opsntBrPc6oT8Cp+sebE9cpGcFvFzkUZDfjU47zaMc+awT9FxW53T6cUbOfl9g3Co07PoLsqYqQlSyZswO+x9/9f/86v/kxwXwK0xqxRsnb2WUFu8aAm0gdi09GRRSm+WHB/WiVU4rSWlymbNQM87DGizZnsH2OsY75jRrG1pW9PxGiC0uyBClEWIivs2IxL8FoLf6sf3tvvuxHN8ik5udVmuFROtHuj4MHy54DYL3m6T4GkenH4XFuEMrn8h1rXzdNdVV1eI6pg6FZpXuXAjxXZ6GKOBwdhpNeqaN3UiMkst5fBoEheOyhLW133v0jB9tAbHxbWFVbc6hnXclgZtSoT7iWdNl/WWfbOR5cpVYT9WS2tT0JT1xtpcc2uj+4TacWK1p2mrRawdkM3U+WjIl6rmz25S3U0YUOE1NFfYRlU0jV0anf3AH00cuTqqyN9r0QCk1GNCC8x/tPmx4ak2uWvpBx6r1FVHUZxJor+ZnZfGGeHzK8I7YbSXLbamfhHlBNXyUflU1R5tw4d6pNWHsqKv1skCicy+43TuNUdnbe92NdZht4Z1KNt2mo2DxVuN24YcIhsbI9sKs5TDKhNm6dE26Ki1MMsJi6KpNZNtmLeK6Euloonov8dF/72li/6qDHZvEUbIQxUb9Otl0YFkZiqX7c31/HRFSqzVRB+l8Z5xa7+Q4MmEyBqB2rTIU08bTS7X4LUF9ZY2kWqWkqpM6b7BgpSUlu7SpX1twQWdtqUyUqehzP2dDnnw8Lv7B+Tw4dPto/0fPCQ7h/tHDw/3nx+QnefPXmwf7r+EPzt3VtnTZlK/mc3ka57jZxg0keOXk1IP6C0VmWuH7mUvi0idropXaxcEN00zH8fTOSjLnqmt1G7OhdzqGVYjPpl7mPb027v3TBeo2YOd5IYsIFed0nJ4jfdqVUezTbFcAMfsRetNiEf25vU9AGtMb1gv55HhhnULqlREmkfD6ERKGAy0cdG7iYoJuIiIV76yKAcUmV/HS77AyIJ3Z1pJQTkD8ZabOTOHpguhKhK2iK4h+4SsVxyozEU77fQ2nkq3x52Vpdm2+zTM6TaeQKSivpyM6KFNRvRaIrZbHTFT8w9Yid2323Ecev3uPHIf8O/ZaVVzZxJOjRVlVQ/t0pYL4yYzekUZWUvUam82TObEdF9akc+QXQIsrgqrale31cUWthXjNl9tl02H7F2TGimKoyW1Ahxpqqn+IBbLhrHtc0poGjLoaX4N+3rpdOfuqjGWYGZB9la1XD5oDxbFCViM28Yjzr/Vzdo7zh1CYosIQfTa8hqt/7xEDkkeS5KQVY6j6xf11ncUG/FntGt8xxLtxqYrfRs6pqr5BX+xKZ9mg9x5hG0i/7Bpn3/YrJZ/yJJsQatUPf/QKB+yvp4w3OD5hHIPhusRBqf55GWEvTUK/FmGv4uyBs1Ec+90yMOD3fJQbhr1xe+fPjx6uAt/Pdzb29/Zf3hwlH16uZFfPZB7qySGm74xSzpVb/OFkjMqG81t8/VzRi5/8WsyxYoajGLk9yMHzq55/mAyH7qwuiX7GHY8kpYuSY1TZsE75Yz2jPyIntf4NcL0I95WuWQ+RR7ugDqBiIt29KxtTWfinroTuYc6wUH7bvzOdX0Sw/Pxu4DQPhMdB/sBvp0HMT4XdZGPGA82wv+UjluVPgrG2+TyN/8u8P70H27fMrCAPkLpoeBaQFgK2PH0jTRVy6EywF2gAnRkD2iGAUe8LYP1QP8eJ0sXR6Ywt4mTuoKGhxgXYd0rYqDTroZXjD1APbqb/ihp3gdr5NjDvz3KifQasAxUI6ppL0DwADXvNa8Ra1UiyGvpOqJKL3piulygZhSoinzGpIDM6L4qWHWZ7pBbpJ+iWvF1eDtxDyq+2rfF/2UwDweupUAwcaBqADq+k4wH0yZ6UcwXsLTKm9TXv/zpf4NfX8uKkPuUB1QxmSthbzqIJawBaKNHztSbnKOlioQ54zRwh7ItA8IF1Ib5wRCesTRde2z0xWyXRsYGTRgDcHW6zglSqOzVXvQqooqOVxVznTuxr8kpDI3csbPV+fyvYKkFTr5+IqwqMj3w+tSQQq5U0yLkqiJdIMiZH6YmybYkCD0+e+pMNB7n2qIcKzIlfo4IZ7nFCOjUtuD51s6vIAmIOIp2uUCb4S+XZf0BI6OackIQIZbtZRnMRaRHxFtHPMMLhN0oZPxoafwUrBmBulVgj0y0ZjZjy9010QKZsoqYpWyk1kj1rVS2ZGX7Eb+YKStyen2O8UmTDK4lbojkX4ydMCYeeB4gGiz6SYJTNyReXOyNEIwsUtfjv37o+VHs+OCf0ZAEOjWv8k03j7HWMt/81e1H5PCRrRbzl47pBNQ2PRIaAM/u4zCFcGqaQF/ltHoGgzJonGra5FQFX7OsTQLfnOltxKd4CRLuhEfBO5DDhZHdj+Thtg3Ckyr5QV4n14O0pKVlWsgP8GRpWvSCj2fnzXuPKqXwzxAodPGd4ZD6wrL2dWTt68PQ/gDpH7oTaglK9gE8i1HZMNFly4YuQFf5k5EG7JmFWVr4qjqj6XVgP698OUgqch69Sr5+hN9bSiqjKi/XC7HM5xHfOh20rxzPIjnQLdIBIpCmqHxMfqdfAFH8ikSJ5qHoAX3VlEha1bxMYWpVJE+7IvpMQ910zfn6ywegcvmTfyFhOyMnRV6qrbzxsbMX6JbT+U0Ti8SClGxVFia85igOvQEfPEIJ6SIqgpgv5/0pS7/QCynBcn5kJD/pECMZyd+lObs8Cfz4xqlfqlNfI+eXv9NjeT+a4cicLxRuYbVt4qYxkiYC/pss4J8XPtqs5OotiwyB7y5KhV4hFXrFVOhdMRVmXAUkGqgZgbuV6XE3kw2o+DK+W/GV/jKIxKKMjEpyCN1WXHKjlFule6UcWdm6ClmRyaAUW1ZF+z1DcHYJMEbzwcCNIrmHutzYuyDq3zpw4u7EpSOgE5HeFloxC5Bc1Fs1er0E0oCQGG9lkUtFc0PL+dHFrQK6NBta3ioIRW4tSeYTorHQrQ/ylFLrJoy7TIqbipJQPkWZz72CZI5+Evb/pf/XQmi96YxTXje+9CHxdmHEij6ZV8Y0KIFnOcLKdyWiDBx2GJKJbjDoZQw+tWwEfulYcycmd5nui4W6mYDnApTIWflbzq1+u9FIKR9x2ZRPIovHLmyz4VebVeXKueAUm1ObcPsVB3wb4iXbBqfO3XFMv4hU3+nrGGfqmeNL8P09q0U6eV1jwKvlOGoyK0Q8HgNTvjsp1ykalbEzQF9PhiathKrEr9paCfASeOWEfS8OnfD8OHbCEzfOXJR2dRRG3/LCTixY0sIg6QcbnPCXn/0Mj83aDya9W1178VLaiyUEFnnptlU9dlK9vbd/sH/0kBz9zfPOg+2XD1dbt311wUrpuGiS82d7SC2FT8ZOZEz2K+lGh6VPbNP9h27kDeeuUJE0c5+z7islrKabXvKGlrL6ueVVuipmwNvGHZWlhyJDiin/oi1aRVQsMvwNAV6rajBBuhpWFlnAXKyMabtKqGrilNEG6Y7j3EqYOHvMoH4ZDLvUdgdnql8GIx+AzjK2qCC3VLV06Jh61SoZcMyl6Tr3DTTJLiu+aQNRAW+nfml7DZK9WYRiV0kn4actegbEIsxdiaKjeiXsNscArkQcS8pt6xWhG4QVbR2/RptfTorYe0O89nnkuRG1bGyXQmAJkOxcyCwykc5go4krMfV8qNYYPZVZd++7+ZXPPIzq5Iep2Qp6n145z6gNfuxn4gAVbBFal3//a3g9yZPn7LhtBU46rOb4vjf2YBfn1jg2wcNVrTH+0U9hhq/e0j6wRaJRY+VfSILFyyIshIPQ6GeJAOdaiPZCw+aLQrsbB/gujEJn6FMReGu6vbWcvzTOWnfhvWFNCWvsQs+VHJVq8bptm+BdMqR92M4sWGkVEti+41PH96Kx/aBJE5ZKNmZQaFTx10FNY2lppVoXxYGoG5VQVOKtHOAaUIZctO1tl1pQKJbZijImrcmV5S03cnkjK43LCg+AvpWDpBcgK2/1IOlFu5L8SEdOVyc7N1y34vpOwpuXz+aTmqvmQUmwQz03TCkMq2AEo4+CEHx9NzzPCf/xSlT9gIEsYKyv0o1oXTeDUjKUiPi3Rava4udf2Q1oykdUMldyH+SFFq+bNapxkSrSfx3ZAwL8GyMjpBWtrSxpBmm5qC4s2AHvRmKupxGqIzKsp6EsOCY5aWecozqCQ7uLLCQ1STvrG3mwkQdCrFelG4ouX8NqGXT5qqdKazottbjRtuumbTku2w2Jl+cSLaK0ddUvOZd6ExL6SwgJpbHzp3mx86dSuLwY6Ke8XcGLIIrpjctRkjJElJllj8g7Lx7TdKKhXsJFIXQmLohgbjwhadJ8E0y4bqL4VHRMKI8SNBp1EOtYo/MvEKRI2pQ7sxmtTVjUmRndiKC1M9O4ELbZpThPb+xATXfH2FZfOC1PmbczoqXB9RwleuVSNcWk0aAb7fyaa6fRRN+o66LBAQt95dsMprULRRdqKC/4pf4wDr3Zje5+3VfWG+IvW0VbtVZjDB+MsmrZ0J25fxEHaxY5j6YKv3zBkXTvkcVx3Ot1wKVpiigtS67oUAw7dEqPI/aWja/S1mnZ+G6aCtBSpVhpryvdwDOCwLsnnu9M5OYAegufK6zkX+lRiWVQ2E7kVkBKozguA+O060H0du6Ebn0r+2d0VORaVFhLxifx+ZuQAWmvwtspBSHewHo8m8vsv8lc/HkUCi1BYMRFoTcC82dcJ7QEuUnXmqRft0U/kBu5+jNPoS4uaeo9xgvuG27WJtugSWsTw86Np0CX4vmqIpIEVJVeiDeSYhcXbZ7lN6T/GkVFm1ZGHsfMNp260cgqBY3lmpZ94FXmsuJMz7hmNTwpUW0e1BvrsYwlvnmJSqsetDDNorUPjbZUK26S9v8DlE2W8Q=="},"NewNative.lean":{"sha256":"27ea10af806c411505c94d84a0c720c89e8bd0a18b4a9e2f82862d7c8a6bd4c0","bytes":26007,"lines":386,"data":"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"},"NewAdmitted.lean":{"sha256":"5dd05da38495ec77db43e3985716d07c3919b0aa6d81859b919ef3ccb1175c20","bytes":16165,"lines":245,"data":"eNrtW19v4kYQf+dT7FtMJRyeI90Dx5Ec0p0vTZD6gFK0sYdjjb0264WEqypVVVWpfaoqVX2vKvUDtA/9FPch+CSdtfnjAAZsQ1pdN1Ikm92Z3Zmd+c3sDFTOa+Rl66ptkcu21e60SOeLd7WXjdsWab573bppWc0WqZ1XOPUhCqkNpEPHTZDMfBs4Y481x2ICkWkFDtyCLVnAL6ktA8E+UPViXgfelAc+ox7OB6/CA24HfjiW9N4DEiUklSAETjrAo0BcC+Rry0oEsheEapR4jEsQZiSnHpgDOoH2G5Bt0qdeBOl599QePlDhmCx6Bf3WyBS4ZVyhIyjHvQvg9rQYlSmnIURz2gkVLN690SAXpIMjn1VJtxn4/g3j70njjhgf/yQf/yIRkTihUU1RhPhB2wHq4cfE8JdvRkJKloTVNNUA54Vk9sPvxDdRezQkhh1Av89sBly+Dvwsyq8YcckQqWff/fJ1peJAnyjtexAfFONMQiwmizVhDJiLc1m8klslFxWCf57S9cWLFOENRMwZQ8N7D/eC4tohYRlTkzWaAyrkavpKOyHxcbnBE+L5PCVoqEQzNnVDZn/8jZRfEoZKjBVofj4OpFKG6Q+VltVQtRTbhsPs5lIOEybUm337kxK1aspA0SKXwxXkFleQW0JBbraC3BIKcncpyF1X0B5Os+9/RsLuU37IRznS7kPCXd9PcQmEDTGtVDzwfbrDwHvLbWlT16Z+GlPfAa/rwg4IGmGKAXlB1vbfj0PpdfCgZiuDzWnvAvoYWniC/7mMnBc/Q17iDHn2GfISZ8h3nSFfP8NcR2gwtRm1gAeJvvE53h2yM5mzvrDCteq+zeY9ZzW0AWnGwFWR343fhxriNMQdB+IOUtCwuIKGJRQ0zFbQsISChrsUNDxCDEgcOB+dO1RAkw+sEKOkmhBHk5hDXqiJ/LG3CTVU3XO24dwIB3abngYmDUzHAaa8bqfMdvbNb2Sk/Ch5zM1itO5Aq0u7lSoONBxH1QeuRDAOiXVHunHxBJBp6mVrpmDdrVh229GtTT0qOsEDCCTeS2EMVMEhNC+vqpm+HVddWqMxmyTYsL0WYDzO/TSXIZY0xZMZ43OY4/5774+/dvGOa2kELIyAc6lXtTC84ieusVt0jaEHJ3eHqngh+g582XIsFkGEwsTEKHRxfsM4UPGWhqpmKwWzZYKPEeKgKZKVcYlHBPiFS5ZcZsnTyCOnu5Dz8dCEKwXK0dT3NTI/PzJvKUdqqNZQ/QlBtVEEq6umAiRiHA1J0+h8yihgFILsubibwJ1K9M8yM/2zJ6n+2b5c/yx/so8kB8SQVLcwVQ82+vhkJf2XDMA7yx9feJn4wkvFlwPKx89RQCb7eBXK/P/PJfniWMcLpKUc7X6Rl/a3gYo3B5U9AqaQrX8ojZFzoyXzSg0M/z1gKJ14aqQogxRGIahYpEX9AuBQCmSMQoiRmdbUakTiXtD9D/xGl5mdspmKU09AiNKh3pF8AhV4pGr+5jVW4NumpPq+pZsD/05zYMuW58uK6uZXNRbDeGzi9D71AUTQ82AC3sqf3GX0PnLTrV7cbOolzKaebTb1EmZT32U2de1Xp/Qrw6LSnNuuWmeEflQ/vbfMx8HpRXF4zY5Buo+tQ5XuYx/JC1dpaOKGVNwzKaiYproZ2a6ouxq636ybGLqJofvNR+03nwDXUzXEHqdyLKjH5HSF7LqsqPsNut/wifcbToArjE9ARJDGFw0qulehUUb3KhLMAe6o/5K/SD+vkZb1avev3/8BKaaYnw=="},"ScalarBridgeNative.lean":{"sha256":"48c4d7c037c1d3eb2c91bb9fa89984a2e58d1be2cd6eb851e42daf876d36e5f0","bytes":585,"lines":11,"data":"eNqVkU9Kw0AYxfc9xVsmEnKAQhZFEAVd6FZ0mKRf0rHzJ5lOK+5cCe68QUEEda0LT9FD5CR+SQVbtIizGpj3m/ceT5MxEoUztaagnD1QVgXad1SWqlBkg3BeVcpKLWZmrgfgE00wRI32/gkmZVTWiIpv4tAZjLB6w+odM4Q4RpQzMIrXcMP3KDpTttpSoX3+gMElLAPDXpqjvX1Eg2wj30ayY1qQ3vyDMxlMYHuYnY7GJHV6Onehk6dmiqjuDZDH2OOPhxnyG1a7PEhl0S5ffAJf6nb52r394MVs7q+oCGpBaJgrJtJWhF981kW64l0FHyPrQ/2vx18Nvnrutves8Nc4320rzDRBe/cAHlHwvglGuqLcy7RbW4ypTHqXTrI9saBGyLX2RNYXg09878dI"},"ScalarBridgeAdmitted.lean":{"sha256":"45c1fd10aa51c01d2967089d4a368521679bcd5106ab6909fbbb62c80c5568cc","bytes":267,"lines":6,"data":"eNpVjjEOgkAQRXtP8cvFggOQWBATo4mNHkADuMDGnd0FFhM7W69hTDyAFp7CQ3ASRyzEqaZ47/+vJVGCzJLT0itrZsooL6dW5rnKlDR+a2tVKJPobUOtHoFPlIjg0J2voJDVxEFkP2NuCTFed7weaOCDACJlIQ6+csW/EGtlij8K3e0JwgaGhahHU3SnCypMBvsGy5byIPUwgzcRSphe5qbFTiY6XLXWf/CQ9hCuL0AaYMzB0QTpkenG1vVx9AZQQ1hH"},"NewAudits.lean":{"sha256":"0e631a48fbb5c162f6d0802495c610c86561ebdfcc1300fcd545b5a0528fb940","bytes":1130,"lines":10,"data":"eNrFk0EKwkAMRfeeotD9XKIobhTR7ocwTUtgJqkzmWI9va0be4GOy0/+55HwU4+RWCt4kYRUtZAbVDIX6bKnJscJk7lKhw90SsIncCqR3rAKcxM/swQCv/jRGydh9Pj1EZNiI9j35AhZ7ZIaiMHbFLI/1DtS2wicaNWFMFblTjycJZQCRuxL3dCuo1Ks/buBnCQen5kmq4V6skGmOYR/cN3vEcvuugV/ACcouTg="}}
END ARCHIVED FINITE COHERENCE PAYLOAD -/
