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

/-
BEGIN ARCHIVED CHECKED POLYNOMIAL COORDINATES
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
import Mathlib.Tactic.ComputeDegree
import Mathlib.LinearAlgebra.Pi
namespace TauCeti.ModuliCurves
variable {R : Type*} [CommRing R]
def NodeForm (γ δ x y : R) : R := x ^ 2 + γ * x * y + δ * y ^ 2
namespace NodeSectionFactorization
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
local notation "J₀" => (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀)

def sectionEval : R₀ →+* A :=
  AdjoinRoot.lift (Polynomial.evalRingHom t) s (by
    simp only [polynomial, Polynomial.eval₂_add, Polynomial.eval₂_mul,
      Polynomial.eval₂_pow, Polynomial.eval₂_C, Polynomial.eval₂_X,
      Polynomial.coe_evalRingHom, Polynomial.eval_mul, Polynomial.eval_pow,
      Polynomial.eval_sub, Polynomial.eval_C, Polynomial.eval_X]
    unfold NodeForm
    ring)

def sectionIdeal : Ideal R₀ := Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t}

theorem sectionEvaluationKernel (r : R₀) :
    (sectionEval A γ δ s t r = 0 ↔ r ∈ J₀) ∧
      (∀ z : A, sectionEval A γ δ s t (ι₀ z) = z) := by
  constructor
  · constructor
    · induction r using AdjoinRoot.induction_on
      rename_i P
      intro h
      have h' : (P.eval (C s)).eval t = 0 := by
        simpa only [sectionEval, AdjoinRoot.lift_mk, Polynomial.eval₂_evalRingHom,
          Polynomial.evalEval] using h
      have hm := (Polynomial.mem_span_C_X_sub_C_X_sub_C_iff_eval_eval_eq_zero
        (a := t) (b := C s) (P := P)).mpr h'
      have mapped := Ideal.mem_map_of_mem (AdjoinRoot.mk w₀) hm
      have hmap : (Ideal.span {C (X - C t), X - C (C s)}).map
          (AdjoinRoot.mk w₀) = J₀ := by
        rw [Ideal.map_span]
        simp only [Set.image_pair, map_sub, AdjoinRoot.mk_C, AdjoinRoot.mk_X]
        change Ideal.span {v₀ - ι₀ t, u₀ - ι₀ s} = J₀
        rw [Set.pair_comm]
      simpa only [hmap] using mapped
    · intro h
      have hj : J₀ ≤ RingHom.ker (sectionEval A γ δ s t) := by
        rw [Ideal.span_le]
        simp [Set.insert_subset_iff, Set.singleton_subset_iff, sectionEval, coefficientHom]
      exact hj h
  · intro z
    simp [sectionEval, coefficientHom]

lemma coefficientHom_eq_algebraMap : ι₀ = algebraMap A R₀ := by
  rw [AdjoinRoot.algebraMap_eq', Polynomial.algebraMap_eq]
  rfl

lemma sectionEval_smul (a : A) (r : R₀) :
    sectionEval A γ δ s t (a • r) = a * sectionEval A γ δ s t r := by
  rw [Algebra.smul_def, ← coefficientHom_eq_algebraMap]
  rw [map_mul, (sectionEvaluationKernel A γ δ s t 0).2]

noncomputable def sectionProjection : R₀ →ₗ[A] J₀ where
  toFun r := ⟨r - ι₀ (sectionEval A γ δ s t r),
    ((sectionEvaluationKernel A γ δ s t _).1).mp (by rw [map_sub, (sectionEvaluationKernel A γ δ s t 0).2]; simp)⟩
  map_add' r z := by
    apply Subtype.ext
    change r + z - ι₀ (sectionEval A γ δ s t (r + z)) = _
    rw [map_add, map_add]
    change r + z - (ι₀ (sectionEval A γ δ s t r) + ι₀ (sectionEval A γ δ s t z)) =
      (r - ι₀ (sectionEval A γ δ s t r)) + (z - ι₀ (sectionEval A γ δ s t z))
    ring
  map_smul' a r := by
    apply Subtype.ext
    change a • r - ι₀ (sectionEval A γ δ s t (a • r)) = a • _
    rw [sectionEval_smul, map_mul, smul_sub]
    simp only [Algebra.smul_def, ← coefficientHom_eq_algebraMap]

lemma sectionProjection_coe (r : R₀) :
    (sectionProjection A γ δ s t r : R₀) = r - ι₀ (sectionEval A γ δ s t r) := rfl

lemma sectionProjection_ideal (j : J₀) : sectionProjection A γ δ s t (j : R₀) = j := by
  apply Subtype.ext
  rw [sectionProjection_coe, ((sectionEvaluationKernel A γ δ s t _).1).mpr j.property, map_zero,
    sub_zero]

lemma sectionProjection_coefficient (z : A) : sectionProjection A γ δ s t (ι₀ z) = 0 := by
  apply Subtype.ext
  rw [sectionProjection_coe, (sectionEvaluationKernel A γ δ s t 0).2, sub_self]
  rfl

noncomputable def sectionSplit : R₀ ≃ₗ[A] J₀ × A where
  toFun r := (sectionProjection A γ δ s t r, sectionEval A γ δ s t r)
  invFun z := (z.1 : R₀) + ι₀ z.2
  left_inv r := by
    change (sectionProjection A γ δ s t r : R₀) + ι₀ (sectionEval A γ δ s t r) = r
    rw [sectionProjection_coe]
    exact sub_add_cancel _ _
  right_inv z := by
    apply Prod.ext
    · change sectionProjection A γ δ s t ((z.1 : R₀) + ι₀ z.2) = z.1
      rw [map_add, sectionProjection_ideal, sectionProjection_coefficient, add_zero]
    · change sectionEval A γ δ s t ((z.1 : R₀) + ι₀ z.2) = z.2
      rw [map_add, (sectionEvaluationKernel A γ δ s t 0).2, ((sectionEvaluationKernel A γ δ s t _).1).mpr z.1.property,
        zero_add]
  map_add' r z := by simp [map_add]
  map_smul' a r := by
    apply Prod.ext
    · exact (sectionProjection A γ δ s t).map_smul a r
    · exact sectionEval_smul A γ δ s t a r

lemma sectionSplit_first (r : R₀) :
    ((sectionSplit A γ δ s t r).1 : R₀) = r - ι₀ (sectionEval A γ δ s t r) := rfl
lemma sectionSplit_second (r : R₀) :
    (sectionSplit A γ δ s t r).2 = sectionEval A γ δ s t r := rfl
lemma sectionSplit_inverse (j : J₀) (z : A) :
    (sectionSplit A γ δ s t).symm (j, z) = (j : R₀) + ι₀ z := rfl
lemma sectionSplit_section (z : A) : sectionSplit A γ δ s t (ι₀ z) = (0, z) := by
  apply Prod.ext
  · exact sectionProjection_coefficient A γ δ s t z
  · exact (sectionEvaluationKernel A γ δ s t 0).2 z

-- Arbitrary section ideal projection regression.
example (j : J₀) : sectionProjection A γ δ s t (j : R₀) = j :=
  sectionProjection_ideal A γ δ s t j

-- Nonreduced coefficient regression from the inherited split interface.
example :
    let u := AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)
    let e := sectionSplit (ZMod 4) 0 0 1 0
    (e u).2 = 1 ∧ ((e u).1 : Ring (ZMod 4) 0 0 1 0) =
      u - coefficientHom (ZMod 4) 0 0 1 0 1 := by
  constructor
  · simp [sectionSplit_second, sectionEval]
  · simp [sectionSplit_first, sectionEval]

-- Zero coefficient-ring regression.
example (r : Ring (ZMod 1) 0 0 0 0) : sectionSplit (ZMod 1) 0 0 0 0 r = (0, 0) :=
by
  have : Subsingleton (Ring (ZMod 1) 0 0 0 0) := Module.subsingleton (ZMod 1) _
  exact Subsingleton.elim _ _

-- Zero-ring projection regression.
example (r : Ring (ZMod 1) 0 0 0 0) : sectionProjection (ZMod 1) 0 0 0 0 r = 0 := by
  have : Subsingleton (Ring (ZMod 1) 0 0 0 0) := Module.subsingleton (ZMod 1) _
  exact Subsingleton.elim _ _

-- Nonreduced projection at a nonzero section.
example :
    (sectionProjection (ZMod 4) 0 0 1 0
      (AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)) : Ring (ZMod 4) 0 0 1 0) =
        AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0) - coefficientHom (ZMod 4) 0 0 1 0 1 := by
  rw [sectionProjection_coe]
  simp [sectionEval]

-- The actual ideal retraction is not R-linear.
example :
    let Φ := fun r : Ring ℚ 1 0 0 0 => (sectionProjection ℚ 1 0 0 0 r : Ring ℚ 1 0 0 0)
    ¬ ∀ r z : Ring ℚ 1 0 0 0, Φ (r * z) = r * Φ z := by
  dsimp
  let w := polynomial ℚ 1 0 0 0
  have hu : (AdjoinRoot.root w : AdjoinRoot w) ≠ 0 := by
    apply AdjoinRoot.mk_ne_zero_of_natDegree_lt
    · unfold w polynomial
      monicity <;> norm_num
    · exact Polynomial.X_ne_zero
    · have hw : w.natDegree = 2 := by
        unfold w polynomial
        compute_degree!
      rw [Polynomial.natDegree_X, hw]
      decide
  intro h
  have he := h (AdjoinRoot.root w) 1
  rw [mul_one, sectionProjection_coe, sectionProjection_coe] at he
  simp [w, sectionEval, coefficientHom] at he
  exact hu he

-- The same non-R-linearity for the first coordinate of the inherited split.
example :
    let Φ := fun r : Ring ℚ 1 0 0 0 => ((sectionSplit ℚ 1 0 0 0 r).1 : Ring ℚ 1 0 0 0)
    ¬ ∀ r z : Ring ℚ 1 0 0 0, Φ (r * z) = r * Φ z := by
  dsimp
  let w := polynomial ℚ 1 0 0 0
  have hu : (AdjoinRoot.root w : AdjoinRoot w) ≠ 0 := by
    apply AdjoinRoot.mk_ne_zero_of_natDegree_lt
    · unfold w polynomial
      monicity <;> norm_num
    · exact Polynomial.X_ne_zero
    · have hw : w.natDegree = 2 := by
        unfold w polynomial
        compute_degree!
      rw [Polynomial.natDegree_X, hw]
      decide
  intro h
  have he := h (AdjoinRoot.root w) 1
  rw [mul_one, sectionSplit_first, sectionSplit_first] at he
  simp [w, sectionEval, coefficientHom] at he
  exact hu he

end
end PolynomialModel
end NodeSectionFactorization
end TauCeti.ModuliCurves

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionEval
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionEvaluationKernel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientHom_eq_algebraMap
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionEval_smul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_coe
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_ideal
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_coefficient
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit_first
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit_second
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit_section

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
local notation "J₀" => (Ideal.span {c₀, d₀} : Ideal R₀)
local notation "D₀" => J₀ →ₗ[R₀] R₀

theorem polynomialMonic : (w₀).Monic := by
  unfold polynomial
  monicity <;> norm_num

lemma sectionPolynomialFree : Module.Free (Polynomial A) R₀ :=
  (polynomialMonic A γ δ s t).free_adjoinRoot

theorem sectionCoordinateRegular : Function.Injective (fun r : R₀ => d₀ * r) := by
  let : Module.Free (Polynomial A) R₀ := sectionPolynomialFree A γ δ s t
  have h : IsSMulRegular R₀ (Polynomial.X - Polynomial.C t) :=
    (Polynomial.monic_X_sub_C t).isRegular.isSMulRegular
  change Function.Injective (fun r : R₀ => (Polynomial.X - Polynomial.C t) • r) at h
  simpa only [Algebra.smul_def, AdjoinRoot.algebraMap_eq, map_sub,
    coefficientHom, RingHom.comp_apply] using h

lemma sectionRelation : c₀ * b₀ + d₀ * a₀ = 0 := by
  have h := AdjoinRoot.mk_self (f := w₀)
  change AdjoinRoot.mk w₀ (Polynomial.X ^ 2 +
    Polynomial.C (Polynomial.C γ * Polynomial.X) * Polynomial.X +
    Polynomial.C (Polynomial.C δ * Polynomial.X ^ 2 - Polynomial.C (NodeForm γ δ s t))) = 0 at h
  simp only [map_add,map_mul,map_pow,AdjoinRoot.mk_C,AdjoinRoot.mk_X,map_sub] at h
  change u₀ ^ 2 + (ι₀ γ * v₀) * u₀ +
    (ι₀ δ * v₀ ^ 2 - ι₀ (NodeForm γ δ s t)) = 0 at h
  simp only [NodeForm, map_add, map_mul, map_pow] at h
  linear_combination h

lemma dualGenerator_divisibility (j : J₀) : ∃ z : R₀, d₀ * z = b₀ * (j : R₀) := by
  obtain ⟨x,y,hj⟩ := Ideal.mem_span_pair.mp j.property
  refine ⟨-a₀ * x + b₀ * y, ?_⟩
  have h := sectionRelation A γ δ s t
  rw [← hj]
  linear_combination -x * h

noncomputable def dualGenerator : D₀ where
  toFun j := Classical.choose (dualGenerator_divisibility A γ δ s t j)
  map_add' j k := by
    apply sectionCoordinateRegular A γ δ s t
    dsimp only
    rw [Classical.choose_spec (dualGenerator_divisibility A γ δ s t (j+k)),mul_add,
      Classical.choose_spec (dualGenerator_divisibility A γ δ s t j),
      Classical.choose_spec (dualGenerator_divisibility A γ δ s t k)]
    change b₀ * ((j : R₀)+(k : R₀)) = _
    ring
  map_smul' r j := by
    apply sectionCoordinateRegular A γ δ s t
    dsimp only
    change d₀ * Classical.choose (dualGenerator_divisibility A γ δ s t (r • j)) =
      d₀ * (r * Classical.choose (dualGenerator_divisibility A γ δ s t j))
    rw [Classical.choose_spec (dualGenerator_divisibility A γ δ s t (r • j))]
    change b₀ * (r * (j : R₀)) = _
    calc
      _ = r * (b₀ * (j : R₀)) := by ring
      _ = r * (d₀ * Classical.choose (dualGenerator_divisibility A γ δ s t j)) :=
        by rw [Classical.choose_spec (dualGenerator_divisibility A γ δ s t j)]
      _ = _ := by ring

lemma dualGenerator_spec (j : J₀) :
    d₀ * dualGenerator A γ δ s t j = b₀ * (j : R₀) :=
  Classical.choose_spec (dualGenerator_divisibility A γ δ s t j)

theorem dualGeneratorUnique (ε η : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀))
    (hη : ∀ j : J₀, d₀ * η j = b₀ * (j : R₀)) : ε = η := by
  ext j
  apply sectionCoordinateRegular A γ δ s t
  dsimp only
  rw [hε,hη]

theorem dualGenerator_existsUnique : ∃! ε : D₀, ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀) := by
  exact ⟨dualGenerator A γ δ s t, dualGenerator_spec A γ δ s t,
    fun ε hε => dualGeneratorUnique A γ δ s t ε _ hε (dualGenerator_spec A γ δ s t)⟩

lemma sectionFirst_mem : c₀ ∈ J₀ := Ideal.subset_span (Set.mem_insert _ _)

lemma sectionSecond_mem : d₀ ∈ J₀ :=
  Ideal.subset_span (Set.mem_insert_of_mem _ (Set.mem_singleton _))

theorem dualGeneratorValues (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    ε ⟨c₀, sectionFirst_mem A γ δ s t⟩ = -a₀ ∧
      ε ⟨d₀, sectionSecond_mem A γ δ s t⟩ = b₀ := by
  constructor
  · apply sectionCoordinateRegular A γ δ s t
    dsimp only
    rw [hε]
    change b₀ * c₀ = d₀ * -a₀
    linear_combination sectionRelation A γ δ s t
  · apply sectionCoordinateRegular A γ δ s t
    dsimp only
    rw [hε]
    exact mul_comm _ _

noncomputable def dualCorrectionMap : R₀ →ₗ[A] R₀ :=
  (dualGenerator A γ δ s t).restrictScalars A ∘ₗ sectionProjection A γ δ s t

lemma dualCorrectionMap_apply (r : R₀) :
    dualCorrectionMap A γ δ s t r =
      dualGenerator A γ δ s t (sectionProjection A γ δ s t r) := rfl

lemma dualCorrectionMap_spec (r : R₀) :
    d₀ * dualCorrectionMap A γ δ s t r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)) := by
  rw [dualCorrectionMap_apply, dualGenerator_spec, sectionProjection_coe]

lemma dualCorrectionMap_product (r z : R₀) :
    dualCorrectionMap A γ δ s t (r*z) = r * dualCorrectionMap A γ δ s t z +
      ι₀ (sectionEval A γ δ s t z) * dualCorrectionMap A γ δ s t r := by
  apply sectionCoordinateRegular A γ δ s t
  dsimp only
  rw [mul_add]
  have h1 := dualCorrectionMap_spec A γ δ s t z
  have h2 := dualCorrectionMap_spec A γ δ s t r
  have h3 := dualCorrectionMap_spec A γ δ s t (r*z)
  rw [(sectionEval A γ δ s t).map_mul, (ι₀).map_mul] at h3
  linear_combination h3-r*h1-ι₀ (sectionEval A γ δ s t z)*h2

lemma dualCorrectionMap_values :
    dualCorrectionMap A γ δ s t c₀ = -a₀ ∧ dualCorrectionMap A γ δ s t d₀ = b₀ := by
  have h1 := sectionProjection_ideal A γ δ s t ⟨c₀, sectionFirst_mem A γ δ s t⟩
  have h2 := sectionProjection_ideal A γ δ s t ⟨d₀, sectionSecond_mem A γ δ s t⟩
  rw [dualCorrectionMap_apply, dualCorrectionMap_apply,h1,h2]
  exact dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)

theorem dualScalarCorrection :
    let ev : R₀ →+* A := sectionEval A γ δ s t
    ∃ K : R₀ →ₗ[A] R₀,
      (∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (ev r))) ∧
      (∀ r z : R₀, K (r*z) = r*K z + ι₀ (ev z)*K r) ∧ K c₀ = -a₀ ∧ K d₀ = b₀ := by
  exact ⟨dualCorrectionMap A γ δ s t,dualCorrectionMap_spec A γ δ s t,
    dualCorrectionMap_product A γ δ s t,dualCorrectionMap_values A γ δ s t⟩

theorem dualScalarCorrectionConstants (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (z : A) : K (ι₀ z) = 0 := by
  apply sectionCoordinateRegular A γ δ s t
  dsimp only
  rw [hK,(sectionEvaluationKernel A γ δ s t 0).2,sub_self,mul_zero,mul_zero]

theorem dualScalarCorrectionUnique (K L : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (hL : ∀ r : R₀, d₀ * L r = b₀ * (r - ι₀ (sectionEval A γ δ s t r))) : K = L := by
  ext r
  apply sectionCoordinateRegular A γ δ s t
  dsimp only
  rw [hK,hL]

lemma dualCorrectionMap_coefficient (z : A) : dualCorrectionMap A γ δ s t (ι₀ z) = 0 :=
  dualScalarCorrectionConstants A γ δ s t _ (dualCorrectionMap_spec A γ δ s t) z

-- NodeSectionFactorization.PolynomialModel.dualGeneratorSecond
example (ε : D₀) (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    ε ⟨d₀,sectionSecond_mem A γ δ s t⟩ = b₀ :=
  (dualGeneratorValues A γ δ s t ε hε).2

-- NodeSectionFactorization.PolynomialModel.dualZeroBase
example [Subsingleton A] : Subsingleton D₀ ∧ Subsingleton (R₀ × A) := by
  have : Subsingleton R₀ := Module.subsingleton A R₀
  exact ⟨inferInstance,inferInstance⟩

-- NodeSectionFactorization.PolynomialModel.correctionFirst
example (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r))) :
    K c₀ = -a₀ := by
  have h := dualScalarCorrectionUnique A γ δ s t K _ hK (dualCorrectionMap_spec A γ δ s t)
  rw [h]
  exact (dualCorrectionMap_values A γ δ s t).1

-- NodeSectionFactorization.PolynomialModel.correctionSecond
example (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r))) :
    K d₀ = b₀ := by
  have h := dualScalarCorrectionUnique A γ δ s t K _ hK (dualCorrectionMap_spec A γ δ s t)
  rw [h]
  exact (dualCorrectionMap_values A γ δ s t).2

-- NodeSectionFactorization.PolynomialModel.correctionConstants
example (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (z : A) : K (ι₀ z) = 0 :=
  dualScalarCorrectionConstants A γ δ s t K hK z

-- NodeSectionFactorization.PolynomialModel.dualGenerator.canonicalNonreduced
example :
    let u := AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)
    dualGenerator (ZMod 4) 0 0 1 0
      ⟨AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) Polynomial.X -
        coefficientHom (ZMod 4) 0 0 1 0 0, sectionSecond_mem (ZMod 4) 0 0 1 0⟩ = u+1 := by
  simpa only [map_one, map_zero, zero_mul, add_zero] using
    (dualGeneratorValues (ZMod 4) 0 0 1 0 _ (dualGenerator_spec (ZMod 4) 0 0 1 0)).2

-- NodeSectionFactorization.PolynomialModel.dualGenerator.canonicalSignThree
example :
    let u := AdjoinRoot.root (polynomial (ZMod 3) 1 0 0 0)
    dualGenerator (ZMod 3) 1 0 0 0
      ⟨u - coefficientHom (ZMod 3) 1 0 0 0 0, sectionFirst_mem (ZMod 3) 1 0 0 0⟩ = -u ∧
      dualGenerator (ZMod 3) 1 0 0 0
        ⟨AdjoinRoot.of (polynomial (ZMod 3) 1 0 0 0) Polynomial.X -
          coefficientHom (ZMod 3) 1 0 0 0 0, sectionSecond_mem (ZMod 3) 1 0 0 0⟩ = u ∧ u ≠ -u := by
  dsimp only
  have hv := dualGeneratorValues (ZMod 3) 1 0 0 0 _ (dualGenerator_spec (ZMod 3) 1 0 0 0)
  refine ⟨?_,?_,?_⟩
  · calc
      _ = -(coefficientHom (ZMod 3) 1 0 0 0 0 *
        AdjoinRoot.of (polynomial (ZMod 3) 1 0 0 0) Polynomial.X +
        coefficientHom (ZMod 3) 1 0 0 0 0 * coefficientHom (ZMod 3) 1 0 0 0 0 +
        coefficientHom (ZMod 3) 1 0 0 0 1 * AdjoinRoot.root (polynomial (ZMod 3) 1 0 0 0)) := hv.1
      _ = _ := by simp
  · calc
      _ = AdjoinRoot.root (polynomial (ZMod 3) 1 0 0 0) + coefficientHom (ZMod 3) 1 0 0 0 0 +
        coefficientHom (ZMod 3) 1 0 0 0 1 * coefficientHom (ZMod 3) 1 0 0 0 0 := hv.2
      _ = _ := by simp
  ·
    let w := polynomial (ZMod 3) 1 0 0 0
    have hne : AdjoinRoot.mk w ((Polynomial.X + Polynomial.X) : Polynomial (Polynomial (ZMod 3))) ≠ 0 := by
      apply AdjoinRoot.mk_ne_zero_of_natDegree_lt (polynomialMonic (ZMod 3) 1 0 0 0)
      · intro hz
        have h := congrArg (fun p : Polynomial (Polynomial (ZMod 3)) => (p.coeff 1).coeff 0) hz
        norm_num at h
        exact (by decide : (2 : ZMod 3) ≠ 0) h
      · have hw : w.natDegree = 2 := by
          unfold w polynomial
          compute_degree!
        rw [hw]
        exact lt_of_le_of_lt (Polynomial.natDegree_add_le _ _) (by simp)
    intro h
    apply hne
    rw [map_add,AdjoinRoot.mk_X]
    exact eq_neg_iff_add_eq_zero.mp h

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.canonicalCharacteristicTwo
example :
    let u := AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0)
    dualCorrectionMap (ZMod 2) 1 0 0 0 u = u := by
  simpa only [map_zero,map_one,zero_mul,one_mul,zero_add,add_zero,sub_zero,
    ZModModule.neg_eq_self] using (dualCorrectionMap_values (ZMod 2) 1 0 0 0).1

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.canonicalProduct
example (r : R₀) : dualCorrectionMap A γ δ s t (r*d₀) = r*b₀ := by
  rw [dualCorrectionMap_product,(dualCorrectionMap_values A γ δ s t).2]
  have hd := (sectionEvaluationKernel A γ δ s t d₀).1.mpr (sectionSecond_mem A γ δ s t)
  rw [hd,map_zero,zero_mul,add_zero]

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel


#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonic
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionPolynomialFree
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionCoordinateRegular
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRelation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_divisibility
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_spec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGeneratorUnique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_existsUnique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionFirst_mem
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSecond_mem
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGeneratorValues
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_spec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_product
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_values
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarCorrection
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarCorrectionConstants
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarCorrectionUnique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_coefficient

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

def coefficientMap {A' : Type*} [CommRing A'] (f : A →+* A') :
    R₀ →+* Ring A' (f γ) (f δ) (f s) (f t) :=
  AdjoinRoot.map (Polynomial.mapRingHom f) w₀
    (polynomial A' (f γ) (f δ) (f s) (f t)) (by
      have h : (w₀).map (Polynomial.mapRingHom f) =
          polynomial A' (f γ) (f δ) (f s) (f t) := by simp [polynomial,NodeForm]
      rw [h])

theorem coefficientMapValues {A' : Type*} [CommRing A'] (f : A →+* A') (z : A) :
    coefficientMap A γ δ s t f u₀ = AdjoinRoot.root (polynomial A' (f γ) (f δ) (f s) (f t)) ∧
    coefficientMap A γ δ s t f v₀ = AdjoinRoot.of (polynomial A' (f γ) (f δ) (f s) (f t)) Polynomial.X ∧
    coefficientMap A γ δ s t f (ι₀ z) = coefficientHom A' (f γ) (f δ) (f s) (f t) (f z) := by
  simp [coefficientMap,coefficientHom]

theorem coefficientMapEvaluation {A' : Type*} [CommRing A'] (f : A →+* A') (r : R₀) :
    sectionEval A' (f γ) (f δ) (f s) (f t) (coefficientMap A γ δ s t f r) =
      f (sectionEval A γ δ s t r) := by
  have h : (sectionEval A' (f γ) (f δ) (f s) (f t)).comp (coefficientMap A γ δ s t f) =
      f.comp (sectionEval A γ δ s t) := by
    apply AdjoinRoot.ringHom_ext
    · ext z <;> simp [coefficientMap,sectionEval]
    · simp [coefficientMap,sectionEval]
  exact RingHom.congr_fun h r

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
  have hv := coefficientMapValues A γ δ s t f
  simp only [map_sub,map_add,map_mul,(hv s).1,(hv s).2.1]
  simp only [(hv δ).2.2,(hv s).2.2,(hv t).2.2,(hv γ).2.2,and_self]

-- Actual semilinear restriction; this is not a tensor equivalence.
def idealCoefficientMap : J₀ →ₛₗ[φ] J₁ where
  toFun j := ⟨φ (j : R₀), ((sectionEvaluationKernel A' (f γ) (f δ) (f s) (f t) _).1).mp (by
    rw [coefficientMapEvaluation,((sectionEvaluationKernel A γ δ s t _).1).mpr j.property,map_zero])⟩
  map_add' j k := by apply Subtype.ext; exact map_add φ _ _
  map_smul' r j := by apply Subtype.ext; exact map_mul φ _ _

lemma idealCoefficientMap_coe (j : J₀) :
    (idealCoefficientMap A γ δ s t f j : R₁) = φ (j : R₀) := rfl

lemma idealCoefficientMap_first :
    idealCoefficientMap A γ δ s t f ⟨c₀,sectionFirst_mem A γ δ s t⟩ =
      ⟨c₁,sectionFirst_mem A' (f γ) (f δ) (f s) (f t)⟩ := by
  apply Subtype.ext
  exact (coefficientMapCoordinates A γ δ s t f).1

lemma idealCoefficientMap_second :
    idealCoefficientMap A γ δ s t f ⟨d₀,sectionSecond_mem A γ δ s t⟩ =
      ⟨d₁,sectionSecond_mem A' (f γ) (f δ) (f s) (f t)⟩ := by
  apply Subtype.ext
  exact (coefficientMapCoordinates A γ δ s t f).2.1

lemma sectionProjection_coefficient_naturality (r : R₀) :
    idealCoefficientMap A γ δ s t f (sectionProjection A γ δ s t r) =
      sectionProjection A' (f γ) (f δ) (f s) (f t) (φ r) := by
  apply Subtype.ext
  rw [idealCoefficientMap_coe,sectionProjection_coe,sectionProjection_coe,map_sub,
    (coefficientMapValues A γ δ s t f _).2.2,coefficientMapEvaluation]

lemma dualGenerator_coefficient_naturality (j : J₀) :
    φ (dualGenerator A γ δ s t j) =
      dualGenerator A' (f γ) (f δ) (f s) (f t) (idealCoefficientMap A γ δ s t f j) := by
  apply sectionCoordinateRegular A' (f γ) (f δ) (f s) (f t)
  change d₁ * φ (dualGenerator A γ δ s t j) = _
  calc
    _ = φ (d₀ * dualGenerator A γ δ s t j) := by
      rw [map_mul,(coefficientMapCoordinates A γ δ s t f).2.1]
    _ = φ (b₀ * (j : R₀)) := by rw [dualGenerator_spec]
    _ = b₁ * (idealCoefficientMap A γ δ s t f j : R₁) := by
      rw [map_mul,(coefficientMapCoordinates A γ δ s t f).2.2.2,idealCoefficientMap_coe]
    _ = _ := (dualGenerator_spec A' (f γ) (f δ) (f s) (f t) _).symm

lemma dualCorrectionMap_coefficient_naturality (r : R₀) :
    φ (dualCorrectionMap A γ δ s t r) =
      dualCorrectionMap A' (f γ) (f δ) (f s) (f t) (φ r) := by
  rw [dualCorrectionMap_apply,dualCorrectionMap_apply,
    dualGenerator_coefficient_naturality,sectionProjection_coefficient_naturality]

theorem coefficientMapIdentity : coefficientMap A γ δ s t (RingHom.id A) = RingHom.id R₀ := by
  apply AdjoinRoot.ringHom_ext
  · ext z <;> simp [coefficientMap]
  · simp [coefficientMap]

theorem coefficientMapComposition {A'' : Type*} [CommRing A''] (g : A' →+* A'') :
    (coefficientMap A' (f γ) (f δ) (f s) (f t) g).comp (coefficientMap A γ δ s t f) =
      coefficientMap A γ δ s t (g.comp f) := by
  apply AdjoinRoot.ringHom_ext
  · ext z <;> simp [coefficientMap]
  · simp [coefficientMap]

lemma idealCoefficientMap_identity (j : J₀) :
    idealCoefficientMap A γ δ s t (RingHom.id A) j = j := by
  apply Subtype.ext
  rw [idealCoefficientMap_coe,coefficientMapIdentity]
  rfl

lemma idealCoefficientMap_comp {A'' : Type*} [CommRing A''] (g : A' →+* A'') (j : J₀) :
    idealCoefficientMap A' (f γ) (f δ) (f s) (f t) g (idealCoefficientMap A γ δ s t f j) =
      idealCoefficientMap A γ δ s t (g.comp f) j := by
  apply Subtype.ext
  simp only [idealCoefficientMap_coe]
  exact RingHom.congr_fun (coefficientMapComposition A γ δ s t f g) (j : R₀)

lemma idealCoefficientMap_smul (r : R₀) (j : J₀) :
    idealCoefficientMap A γ δ s t f (r • j) = φ r • idealCoefficientMap A γ δ s t f j :=
  (idealCoefficientMap A γ δ s t f).map_smulₛₗ r j

theorem correctionCoefficientNaturality
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
  apply sectionCoordinateRegular A' (f γ) (f δ) (f s) (f t)
  change d₁ * φ (K r) = d₁ * K' (φ r)
  calc
    _ = φ (d₀ * K r) := by rw [map_mul,(coefficientMapCoordinates A γ δ s t f).2.1]
    _ = φ (b₀ * (r - ι₀ (sectionEval A γ δ s t r))) := by rw [hK]
    _ = b₁ * (φ r - ι₁ (sectionEval A' (f γ) (f δ) (f s) (f t) (φ r))) := by
      rw [map_mul,map_sub,(coefficientMapCoordinates A γ δ s t f).2.2.2,
        (coefficientMapValues A γ δ s t f _).2.2,coefficientMapEvaluation]
    _ = _ := (hK' (φ r)).symm

-- NodeSectionFactorization.PolynomialModel.idealCoefficientMap.identity
example (j : J₀) : idealCoefficientMap A γ δ s t (RingHom.id A) j = j :=
  idealCoefficientMap_identity A γ δ s t j

-- NodeSectionFactorization.PolynomialModel.idealCoefficientMap.generators
example :
    idealCoefficientMap A γ δ s t f ⟨c₀,sectionFirst_mem A γ δ s t⟩ =
      ⟨c₁,sectionFirst_mem A' (f γ) (f δ) (f s) (f t)⟩ ∧
    idealCoefficientMap A γ δ s t f ⟨d₀,sectionSecond_mem A γ δ s t⟩ =
      ⟨d₁,sectionSecond_mem A' (f γ) (f δ) (f s) (f t)⟩ :=
  ⟨idealCoefficientMap_first A γ δ s t f,idealCoefficientMap_second A γ δ s t f⟩

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
  dsimp only
  constructor
  · intro h
    have hv := congrArg (fun j : Ideal.span {AdjoinRoot.root (polynomial ℤ 1 0 0 0) -
        coefficientHom ℤ 1 0 0 0 0,
        AdjoinRoot.of (polynomial ℤ 1 0 0 0) Polynomial.X -
        coefficientHom ℤ 1 0 0 0 0} => (j : Ring ℤ 1 0 0 0)) h
    have hz : (2 : Ring ℤ 1 0 0 0) = 0 := by
      apply sectionCoordinateRegular ℤ 1 0 0 0
      change _ * 2 = _ * 0
      simpa only [Submodule.coe_smul,smul_eq_mul,Submodule.coe_zero,mul_comm,mul_zero,zero_mul] using hv
    have hi := congrArg (sectionEval ℤ 1 0 0 0) hz
    simp only [map_ofNat,map_zero] at hi
    exact (by decide : (2 : ℤ) ≠ 0) hi
  · apply Subtype.ext
    change coefficientMap ℤ 1 0 0 0 (Int.castRingHom (ZMod 2)) (2 * _) = 0
    have hz := (coefficientMapValues ℤ 1 0 0 0 (Int.castRingHom (ZMod 2)) (2 : ℤ)).2.2
    have hf : (Int.castRingHom (ZMod 2)) (2 : ℤ) = 0 := by decide
    have hc : coefficientHom ℤ 1 0 0 0 (2 : ℤ) = (2 : Ring ℤ 1 0 0 0) := by
      simp only [map_ofNat]
    have hzero : coefficientMap ℤ 1 0 0 0 (Int.castRingHom (ZMod 2)) 2 = 0 := by
      exact (congrArg (coefficientMap ℤ 1 0 0 0 (Int.castRingHom (ZMod 2))) hc.symm).trans
        (hz.trans (by simp only [hf,map_zero]))
    rw [map_mul,hzero,zero_mul]

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.coefficientIdentity
example (r : R₀) :
    coefficientMap A γ δ s t (RingHom.id A) (dualCorrectionMap A γ δ s t r) =
      dualCorrectionMap A γ δ s t r := by
  rw [coefficientMapIdentity]; rfl

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.coefficientProjection
example (j : J₀) :
    φ (dualCorrectionMap A γ δ s t (j : R₀)) =
      dualGenerator A' (f γ) (f δ) (f s) (f t) (idealCoefficientMap A γ δ s t f j) := by
  rw [dualCorrectionMap_apply,sectionProjection_ideal,dualGenerator_coefficient_naturality]

-- NodeSectionFactorization.PolynomialModel.dualCorrectionMap.nonflatCharacteristicTwo
example :
    let u := AdjoinRoot.root (polynomial ℤ 1 0 0 0)
    coefficientMap ℤ 1 0 0 0 (Int.castRingHom (ZMod 2))
      (dualCorrectionMap ℤ 1 0 0 0 u) =
        AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0) := by
  dsimp only
  have hk : dualCorrectionMap ℤ 1 0 0 0 (AdjoinRoot.root (polynomial ℤ 1 0 0 0)) =
      -AdjoinRoot.root (polynomial ℤ 1 0 0 0) := by
    simpa only [map_zero,map_one,zero_mul,one_mul,zero_add,add_zero,sub_zero] using
      (dualCorrectionMap_values ℤ 1 0 0 0).1
  rw [hk,map_neg,(coefficientMapValues ℤ 1 0 0 0 (Int.castRingHom (ZMod 2)) 0).1]
  exact ZModModule.neg_eq_self _



end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMap
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapValues
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapEvaluation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapCoordinates
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_coe
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_first
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_second
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_coefficient_naturality
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_coefficient_naturality
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_coefficient_naturality
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapIdentity
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapComposition
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_identity
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_comp
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_smul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.correctionCoefficientNaturality

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open Polynomial
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "F₀" => polynomial A γ δ s t
local notation "R₀" => Ring A γ δ s t
local notation "u₀" => AdjoinRoot.root F₀

lemma polynomialNatDegree [Nontrivial A] : (F₀).natDegree = 2 := by
  unfold polynomial
  simpa only [map_one, one_mul] using (Polynomial.natDegree_quadratic
    (a := (1 : Polynomial A)) (b := C γ * X)
    (c := C δ * X ^ 2 - C (NodeForm γ δ s t)) one_ne_zero)

def polynomialBasisTwo [Nontrivial A] : Module.Basis (Fin 2) (Polynomial A) R₀ :=
  (AdjoinRoot.powerBasis' (polynomialMonic A γ δ s t)).basis.reindex
    (finCongr (polynomialNatDegree A γ δ s t))

lemma polynomialBasisTwo_apply [Nontrivial A] (i : Fin 2) :
    polynomialBasisTwo A γ δ s t i = u₀ ^ (i : ℕ) := by
  rw [polynomialBasisTwo, Module.Basis.reindex_apply,
    (AdjoinRoot.powerBasis' (polynomialMonic A γ δ s t)).basis_eq_pow]
  rfl

def polynomialCoordinates : R₀ ≃ₗ[Polynomial A] Polynomial A × Polynomial A := by
  classical
  by_cases h : Nontrivial A
  · letI := h
    exact (polynomialBasisTwo A γ δ s t).equivFun.trans
      (LinearEquiv.finTwoArrow (Polynomial A) (Polynomial A))
  · letI : Subsingleton A := not_nontrivial_iff_subsingleton.mp h
    letI : Subsingleton R₀ := Module.subsingleton A R₀
    exact LinearEquiv.ofSubsingleton _ _

lemma polynomialCoordinates_symm (p q : Polynomial A) :
    (polynomialCoordinates A γ δ s t).symm (p,q) =
      AdjoinRoot.of F₀ p + u₀ * AdjoinRoot.of F₀ q := by
  classical
  unfold polynomialCoordinates
  split
  · rename_i h
    have := h
    simp [LinearEquiv.trans_symm, Module.Basis.equivFun_symm_apply,
      Fin.sum_univ_two, polynomialBasisTwo_apply, Algebra.smul_def,
      AdjoinRoot.algebraMap_eq, mul_comm]
  · rename_i h
    have : Subsingleton A := not_nontrivial_iff_subsingleton.mp h
    have : Subsingleton R₀ := Module.subsingleton A R₀
    exact Subsingleton.elim _ _

lemma polynomialCoordinates_reconstruction (r : R₀) :
    AdjoinRoot.of F₀ (polynomialCoordinates A γ δ s t r).1 +
      u₀ * AdjoinRoot.of F₀ (polynomialCoordinates A γ δ s t r).2 = r := by
  rw [← polynomialCoordinates_symm]
  exact (polynomialCoordinates A γ δ s t).symm_apply_apply r

lemma polynomialCoordinates_unique (r : R₀) :
    ∃! z : Polynomial A × Polynomial A,
      AdjoinRoot.of F₀ z.1 + u₀ * AdjoinRoot.of F₀ z.2 = r := by
  refine ⟨polynomialCoordinates A γ δ s t r, polynomialCoordinates_reconstruction A γ δ s t r, ?_⟩
  intro z hz
  apply (polynomialCoordinates A γ δ s t).symm.injective
  rcases z with ⟨p,q⟩
  simpa only [polynomialCoordinates_symm, LinearEquiv.symm_apply_apply] using hz

lemma polynomialCoordinates_of (p : Polynomial A) :
    polynomialCoordinates A γ δ s t (AdjoinRoot.of F₀ p) = (p,0) := by
  apply (polynomialCoordinates A γ δ s t).symm.injective
  simp [polynomialCoordinates_symm]

lemma polynomialCoordinates_root :
    polynomialCoordinates A γ δ s t u₀ = (0,1) := by
  apply (polynomialCoordinates A γ δ s t).symm.injective
  simp [polynomialCoordinates_symm]

def polynomialBasis : Module.Basis (Fin 2) (Polynomial A) R₀ :=
  Module.Basis.ofEquivFun ((polynomialCoordinates A γ δ s t).trans
    (LinearEquiv.finTwoArrow (Polynomial A) (Polynomial A)).symm)

lemma polynomialBasis_apply (i : Fin 2) :
    polynomialBasis A γ δ s t i = u₀ ^ (i : ℕ) := by
  fin_cases i <;> simp [polynomialBasis, Module.Basis.coe_ofEquivFun,
    polynomialCoordinates_symm, LinearEquiv.finTwoArrow]

def polynomialMonomialBasis : Module.Basis (ℕ × Fin 2) A R₀ :=
  (Polynomial.basisMonomials A).smulTower (polynomialBasis A γ δ s t)

lemma polynomialMonomialBasis_apply (n : ℕ) (i : Fin 2) :
    polynomialMonomialBasis A γ δ s t (n,i) =
      (AdjoinRoot.of F₀ (Polynomial.X : Polynomial A)) ^ n * u₀ ^ (i : ℕ) := by
  simp [polynomialMonomialBasis, Module.Basis.smulTower_apply,
    polynomialBasis_apply, Polynomial.coe_basisMonomials,
    Polynomial.monomial_one_right_eq_X_pow, Algebra.smul_def, AdjoinRoot.algebraMap_eq]

lemma normalForm (r : R₀) :
    ∃! p : Polynomial A × Polynomial A,
      r = AdjoinRoot.of F₀ p.1 + u₀ * AdjoinRoot.of F₀ p.2 := by
  simpa only [eq_comm] using polynomialCoordinates_unique A γ δ s t r

lemma normalFormFree : Module.Free (Polynomial A) R₀ ∧ Module.Free A R₀ :=
  ⟨Module.Free.of_basis (polynomialBasis A γ δ s t),
    Module.Free.of_basis (polynomialMonomialBasis A γ δ s t)⟩

-- test: NodeSectionFactorization.PolynomialModel.coordinatesZeroRing
example (r : Ring (ZMod 1) 0 0 0 0) :
    polynomialCoordinates (ZMod 1) 0 0 0 0 r = (0,0) := by
  exact Subsingleton.elim _ _
-- test: NodeSectionFactorization.PolynomialModel.coordinatesCharacteristicTwoRoot
example : polynomialCoordinates (ZMod 2) 1 0 0 0
    (AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0)) = (0,1) :=
  polynomialCoordinates_root (ZMod 2) 1 0 0 0
-- test: NodeSectionFactorization.PolynomialModel.coordinatesNonreducedPolynomial
example : polynomialCoordinates (ZMod 4) 0 0 0 0
    (AdjoinRoot.of (polynomial (ZMod 4) 0 0 0 0) (C 2 * X ^ 9)) = (C 2 * X ^ 9,0) :=
  polynomialCoordinates_of (ZMod 4) 0 0 0 0 _
-- test: NodeSectionFactorization.PolynomialModel.basisConstant
example : polynomialBasis A γ δ s t 0 = 1 := by
  simp [polynomialBasis_apply]
-- test: NodeSectionFactorization.PolynomialModel.basisRoot
example : polynomialBasis A γ δ s t 1 = u₀ := by
  simp [polynomialBasis_apply]
-- test: NodeSectionFactorization.PolynomialModel.basisZeroRing
example : polynomialBasis (ZMod 1) 0 0 0 0 1 = 0 := by
  have : Subsingleton (Ring (ZMod 1) 0 0 0 0) :=
    Module.subsingleton (ZMod 1) _
  exact Subsingleton.elim _ _
-- test: NodeSectionFactorization.PolynomialModel.monomialBasisUntruncated
example : polynomialMonomialBasis (ZMod 2) 1 0 0 0 (37,0) =
    AdjoinRoot.of (polynomial (ZMod 2) 1 0 0 0) (X : Polynomial (ZMod 2)) ^ 37 := by
  simp [polynomialMonomialBasis_apply]
-- test: NodeSectionFactorization.PolynomialModel.monomialBasisNonreduced
example : polynomialMonomialBasis (ZMod 4) 0 0 0 0 (3,1) =
    AdjoinRoot.of (polynomial (ZMod 4) 0 0 0 0) (X : Polynomial (ZMod 4)) ^ 3 *
      AdjoinRoot.root (polynomial (ZMod 4) 0 0 0 0) := by
  simp [polynomialMonomialBasis_apply]
-- test: NodeSectionFactorization.PolynomialModel.monomialBasisZeroRing
example : polynomialMonomialBasis (ZMod 1) 0 0 0 0 (37,1) = 0 := by
  have : Subsingleton (Ring (ZMod 1) 0 0 0 0) :=
    Module.subsingleton (ZMod 1) _
  exact Subsingleton.elim _ _

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialNatDegree
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasisTwo
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasisTwo_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_symm
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_reconstruction
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_unique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_of
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_root
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.normalForm
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.normalFormFree
END ARCHIVED CHECKED POLYNOMIAL COORDINATES
-/
