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
