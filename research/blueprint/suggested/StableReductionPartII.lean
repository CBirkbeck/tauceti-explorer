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

/- BEGIN ARCHIVED RELATIVE CRITERION Native.lean
import Mathlib.CategoryTheory.Abelian.Ext
import Mathlib.CategoryTheory.Abelian.Projective.Ext
import Mathlib.Algebra.Category.ModuleCat.Ext.HasExt
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.CategoryTheory.Abelian.Projective.Resolution
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.LinearAlgebra.LeftExact
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.RingTheory.Flat.Equalizer
import Mathlib.RingTheory.Flat.Basic
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
import Mathlib.LinearAlgebra.TensorProduct.Pi
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

lemma polynomialBasis_zero : polynomialBasis A γ δ s t 0 = 1 := by
  simp [polynomialBasis_apply]

lemma polynomialBasis_one : polynomialBasis A γ δ s t 1 = u₀ := by
  simp [polynomialBasis_apply]

lemma polynomialMonomialBasis_tower : polynomialMonomialBasis A γ δ s t =
    (Polynomial.basisMonomials A).smulTower (polynomialBasis A γ δ s t) := rfl

lemma polynomialMonomialBasis_repr (r : R₀) (n : ℕ) (i : Fin 2) :
    (polynomialMonomialBasis A γ δ s t).repr r (n,i) =
      (Polynomial.basisMonomials A).repr ((polynomialBasis A γ δ s t).repr r i) n := by
  exact Module.Basis.smulTower_repr _ _ _ _

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
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis_one
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_tower
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_repr

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
  have hm := (E₀).map_smul p r
  change E₀ (p • r) = (p * (E₀ r).1, p * (E₀ r).2) at hm
  simpa only [Algebra.smul_def, AdjoinRoot.algebraMap_eq] using hm

lemma polynomialCoordinates_second_mul (r : R₀) :
    E₀ (d₀ * r) =
      ((X - C t) * (E₀ r).1, (X - C t) * (E₀ r).2) := by
  have hd : d₀ = AdjoinRoot.of F₀ (X - C t) := by
    simp [map_sub,coefficientHom]
  rw [hd,polynomialCoordinates_coefficient_mul]

lemma polynomialCoordinates_root_mul (r : R₀) :
    E₀ (u₀ * r) =
      ((C (NodeForm γ δ s t) - C δ * X ^ 2) * (E₀ r).2,
       (E₀ r).1 - (C γ * X) * (E₀ r).2) := by
  have hrel := AdjoinRoot.mk_self (f := F₀)
  change AdjoinRoot.mk F₀ (X ^ 2 + C (C γ * X) * X +
    C (C δ * X ^ 2 - C (NodeForm γ δ s t))) = 0 at hrel
  simp only [map_add,map_mul,map_pow,AdjoinRoot.mk_C,AdjoinRoot.mk_X,map_sub] at hrel
  have hroot : u₀ ^ 2 =
      AdjoinRoot.of F₀ (C (NodeForm γ δ s t) - C δ * X ^ 2) -
        u₀ * AdjoinRoot.of F₀ (C γ * X) := by
    simp only [map_sub,map_mul,map_pow]
    linear_combination hrel
  apply (E₀).symm.injective
  rw [LinearEquiv.symm_apply_apply,polynomialCoordinates_symm]
  calc
    u₀ * r = u₀ * (AdjoinRoot.of F₀ (E₀ r).1 +
        u₀ * AdjoinRoot.of F₀ (E₀ r).2) := by
      rw [polynomialCoordinates_reconstruction]
    _ = _ := by
      simp only [map_mul,map_sub,map_pow] at hroot ⊢
      linear_combination (AdjoinRoot.of F₀ (E₀ r).2) * hroot

lemma polynomialCoordinates_first_mul (r : R₀) :
    (E₀ (c₀ * r)).2 =
      (E₀ r).1 - (C s + C γ * X) * (E₀ r).2 := by
  rw [sub_mul,map_sub]
  change (E₀ (u₀ * r)).2 - (E₀ (AdjoinRoot.of F₀ (C s) * r)).2 = _
  rw [polynomialCoordinates_root_mul,polynomialCoordinates_coefficient_mul]
  dsimp only
  ring

lemma dualValue_commutes (h : D₀) (j k : J₀) :
    (j : R₀) * h k = (k : R₀) * h j := by
  have hjk : (j : R₀) • k = (k : R₀) • j := by
    apply Subtype.ext
    exact mul_comm _ _
  simpa only [map_smul,smul_eq_mul] using congrArg h hjk

lemma dualValue_at_second (h : D₀) :
    let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
    ((E₀ (h jd)).1).eval t =
      (s + γ * t) * ((E₀ (h jd)).2).eval t := by
  dsimp only
  let jc : J₀ := ⟨c₀,sectionFirst_mem A γ δ s t⟩
  let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
  have hcomm := dualValue_commutes A γ δ s t h jc jd
  have he := congrArg (fun r : R₀ => ((E₀ r).2).eval t) hcomm
  change ((E₀ (c₀ * h jd)).2).eval t = ((E₀ (d₀ * h jc)).2).eval t at he
  rw [polynomialCoordinates_first_mul,polynomialCoordinates_second_mul] at he
  simp only [eval_sub,eval_add,eval_mul,eval_C,eval_X,sub_self,zero_mul] at he
  exact sub_eq_zero.mp he

lemma polynomialCoordinates_dualNumerator : E₀ b₀ = (C (s + γ * t), 1) := by
  have hb : b₀ = u₀ + AdjoinRoot.of F₀ (C (s + γ * t)) := by
    simp only [map_add,map_mul,coefficientHom,RingHom.comp_apply]
    ring
  rw [hb,map_add,polynomialCoordinates_root,polynomialCoordinates_of]
  apply Prod.ext <;> simp

lemma dualValue_decomposition (h : D₀) :
    let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
    ∃ z : R₀ × A, h jd = d₀ * z.1 + ι₀ z.2 * b₀ := by
  dsimp only
  let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
  let p := (E₀ (h jd)).1
  let q := (E₀ (h jd)).2
  let α := q.eval t
  have hpval : p.eval t = (s + γ * t) * α := dualValue_at_second A γ δ s t h
  obtain ⟨p₀,hp₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := p) (a := t)
  obtain ⟨q₀,hq₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := q) (a := t)
  let r := AdjoinRoot.of F₀ p₀ + u₀ * AdjoinRoot.of F₀ q₀
  have hr : E₀ r = (p₀,q₀) := by
    simpa only [polynomialCoordinates_symm] using (E₀).apply_symm_apply (p₀,q₀)
  refine ⟨(r,α),?_⟩
  apply (E₀).injective
  rw [map_add,polynomialCoordinates_second_mul]
  change E₀ (h jd) =
    ((X-C t)*(E₀ r).1,(X-C t)*(E₀ r).2) + E₀ (AdjoinRoot.of F₀ (C α) * b₀)
  rw [polynomialCoordinates_coefficient_mul,polynomialCoordinates_dualNumerator,hr]
  apply Prod.ext
  · change p = (X-C t)*p₀ + C α * C (s+γ*t)
    rw [hpval] at hp₀
    rw [←hp₀,←map_mul]
    ring
  · change q = (X-C t)*q₀ + C α * 1
    rw [mul_one,←hq₀]
    exact (sub_add_cancel _ _).symm

lemma dualNormalForm_exists (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (h : D₀) :
    ∃ z : R₀ × A, ∀ j : J₀,
      h j = z.1 * (j : R₀) + ι₀ z.2 * ε j := by
  obtain ⟨z,hz⟩ := dualValue_decomposition A γ δ s t h
  refine ⟨z,?_⟩
  intro j
  let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
  have hc := dualValue_commutes A γ δ s t h j jd
  apply sectionCoordinateRegular A γ δ s t
  change d₀ * h j = d₀ * (z.1 * (j : R₀) + ι₀ z.2 * ε j)
  change (j : R₀) * h jd = d₀ * h j at hc
  rw [←hc,hz]
  linear_combination -(ι₀ z.2) * hε j

lemma dualValue_coordinates_unique (z z' : R₀ × A)
    (hz : d₀ * z.1 + ι₀ z.2 * b₀ = d₀ * z'.1 + ι₀ z'.2 * b₀) : z = z' := by
  have hval (r : R₀) (α : A) :
      ((E₀ (d₀ * r + ι₀ α * b₀)).2).eval t = α := by
    rw [map_add,polynomialCoordinates_second_mul]
    change ((X-C t)*(E₀ r).2 +
      (E₀ (AdjoinRoot.of F₀ (C α) * b₀)).2).eval t = α
    rw [polynomialCoordinates_coefficient_mul,polynomialCoordinates_dualNumerator]
    simp
  have he := congrArg (fun r : R₀ => ((E₀ r).2).eval t) hz
  rw [hval,hval] at he
  apply Prod.ext
  · apply sectionCoordinateRegular A γ δ s t
    rw [he] at hz
    exact add_right_cancel hz
  · exact he

theorem dualNormalForm (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (h : D₀) :
    ∃! p : R₀ × A, ∀ j : J₀,
      h j = p.1 * (j : R₀) + ι₀ p.2 * ε j := by
  obtain ⟨p,hp⟩ := dualNormalForm_exists A γ δ s t ε hε h
  refine ⟨p,hp,?_⟩
  intro z hz
  let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
  have hεd : ε jd = b₀ := by
    apply sectionCoordinateRegular A γ δ s t
    change d₀ * ε jd = d₀ * b₀
    rw [hε]
    change b₀ * d₀ = d₀ * b₀
    ring
  apply dualValue_coordinates_unique A γ δ s t
  have hc := (hz jd).symm.trans (hp jd)
  change z.1 * d₀ + ι₀ z.2 * ε jd = p.1 * d₀ + ι₀ p.2 * ε jd at hc
  rw [hεd] at hc
  simpa only [mul_comm d₀] using hc

def dualMultiplication : R₀ →ₗ[R₀] D₀ where
  toFun r :=
    { toFun := fun j => r * (j : R₀)
      map_add' := by intro j k; exact mul_add _ _ _
      map_smul' := by intro z j; change r * (z * (j : R₀)) = z * (r * (j : R₀)); ring }
  map_add' := by intro r z; ext j; exact add_mul _ _ _
  map_smul' := by intro z r; ext j; exact mul_assoc _ _ _

lemma dualMultiplicationApply (r : R₀) (j : J₀) :
    dualMultiplication A γ δ s t r j = r * (j : R₀) := rfl

theorem dualNormalEquiv (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    ∃ e : D₀ ≃ₗ[A] (R₀ × A), ∀ (p : R₀ × A) (j : J₀),
      e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j := by
  let f : R₀ × A →ₗ[A] D₀ :=
    { toFun := fun p => dualMultiplication A γ δ s t p.1 + p.2 • ε
      map_add' := by intro p q; simp only [Prod.fst_add,Prod.snd_add,map_add,add_smul]; abel
      map_smul' := by
        intro a p
        change dualMultiplication A γ δ s t (a • p.1) + (a*p.2) • ε =
          a • (dualMultiplication A γ δ s t p.1 + p.2 • ε)
        rw [←smul_smul,smul_add]
        congr 1
        exact (dualMultiplication A γ δ s t).map_smul_of_tower a p.1 }
  have hf (p : R₀ × A) (j : J₀) : f p j = p.1 * (j : R₀) + ι₀ p.2 * ε j := by
    change p.1 * (j : R₀) + p.2 • ε j = _
    rw [Algebra.smul_def,←coefficientHom_eq_algebraMap]
  have hbij : Function.Bijective f := by
    constructor
    · intro p q hpq
      obtain ⟨z,hz,hunique⟩ := dualNormalForm A γ δ s t ε hε (f p)
      have hp : ∀ j : J₀, f p j = p.1 * (j : R₀) + ι₀ p.2 * ε j := hf p
      have hq : ∀ j : J₀, f p j = q.1 * (j : R₀) + ι₀ q.2 * ε j := by
        intro j; rw [hpq]; exact hf q j
      exact (hunique p hp).trans (hunique q hq).symm
    · intro h
      obtain ⟨p,hp,-⟩ := dualNormalForm A γ δ s t ε hε h
      refine ⟨p,?_⟩
      ext j
      exact (hf p j).trans (hp j).symm
  refine ⟨(LinearEquiv.ofBijective f hbij).symm,?_⟩
  intro p j
  exact hf p j

lemma dualGenerator_action (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (z : R₀) (j : J₀) :
    (z - ι₀ (sectionEval A γ δ s t z)) * ε j = K z * (j : R₀) := by
  apply sectionCoordinateRegular A γ δ s t
  change d₀ * ((z - ι₀ (sectionEval A γ δ s t z)) * ε j) = d₀ * (K z * (j : R₀))
  linear_combination (z - ι₀ (sectionEval A γ δ s t z)) * hε j - (j : R₀) * hK z

theorem dualScalarAction (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j)
    (z : R₀) (h : D₀) :
    e (z • h) = (z * (e h).1 + ι₀ (e h).2 * K z, sectionEval A γ δ s t z * (e h).2) := by
  apply e.symm.injective
  rw [LinearEquiv.symm_apply_apply]
  ext j
  rw [he]
  have hh : h j = (e h).1 * (j : R₀) + ι₀ (e h).2 * ε j := by
    simpa only [LinearEquiv.symm_apply_apply] using he (e h) j
  change z * h j = _
  rw [hh,map_mul]
  linear_combination (ι₀ (e h).2) * dualGenerator_action A γ δ s t ε hε K hK z j

theorem dualResidue (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    let ev : R₀ →+* A := sectionEval A γ δ s t
    ∃ ρ : D₀ →ₗ[A] A,
      Function.Surjective ρ ∧ ρ ε = 1 ∧
      (∀ (r : R₀) (h : D₀), ρ (r • h) = ev r * ρ h) ∧
      (∀ h : D₀, ρ h = 0 ↔ ∃ r : R₀, ∀ j : J₀, h j = r * (j : R₀)) := by
  dsimp only
  obtain ⟨e,he⟩ := dualNormalEquiv A γ δ s t ε hε
  let ρ := (LinearMap.snd A R₀ A).comp e.toLinearMap
  have hρ (h : D₀) : ρ h = (e h).2 := rfl
  have hgen : e ε = (0,1) := by
    apply e.symm.injective
    rw [LinearEquiv.symm_apply_apply]
    ext j
    rw [he]
    simp
  refine ⟨ρ,?_,?_,?_,?_⟩
  · intro a
    refine ⟨e.symm (0,a),?_⟩
    rw [hρ,LinearEquiv.apply_symm_apply]
  · rw [hρ,hgen]
  · intro r h
    rw [hρ,hρ,dualScalarAction A γ δ s t ε hε
      (dualCorrectionMap A γ δ s t) (dualCorrectionMap_spec A γ δ s t) e he]
  · intro h
    constructor
    · intro hz
      refine ⟨(e h).1,?_⟩
      intro j
      have hh := he (e h) j
      rw [LinearEquiv.symm_apply_apply] at hh
      change (e h).2 = 0 at hz
      simpa only [hz,map_zero,zero_mul,add_zero] using hh
    · rintro ⟨r,hr⟩
      have hh : h = e.symm (r,0) := by
        ext j
        rw [he,hr]
        simp
      rw [hh,hρ,LinearEquiv.apply_symm_apply]

theorem dualNormalEquivInclusion (ε : D₀)
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    ∀ h : D₀, (∀ j : J₀, h j = (j : R₀)) → e h = (1, 0) := by
  intro h hh
  apply e.symm.injective
  rw [LinearEquiv.symm_apply_apply]
  ext j
  rw [he,hh]
  simp

theorem dualNormalEquivGenerator (ε : D₀)
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    e ε = (0, 1) := by
  apply e.symm.injective
  rw [LinearEquiv.symm_apply_apply]
  ext j
  rw [he]
  simp

theorem dualResidueGenerator (ε : D₀) (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    (e ε).2 = 1 := by rw [dualNormalEquivGenerator A γ δ s t ε e he]

theorem dualResidueInclusion (ρ : D₀ →ₗ[A] A)
    (hker : ∀ h : D₀, ρ h = 0 ↔ ∃ r : R₀, ∀ j : J₀, h j = r * (j : R₀))
    (r : R₀) (h : D₀) (hh : ∀ j : J₀, h j = r * (j : R₀)) : ρ h = 0 :=
  (hker h).mpr ⟨r,hh⟩

lemma dualMultiplicationInjective : Function.Injective (dualMultiplication A γ δ s t) := by
  intro r z hz
  apply sectionCoordinateRegular A γ δ s t
  have hd := congrArg (fun h : D₀ => h ⟨d₀,sectionSecond_mem A γ δ s t⟩) hz
  change d₀ * r = d₀ * z
  simpa only [dualMultiplicationApply,mul_comm d₀] using hd

-- Existing test: normalInclusion, using an actually constructed equivalence.
example : ∃ e : D₀ ≃ₗ[A] (R₀ × A),
    e (dualMultiplication A γ δ s t 1) = (1,0) := by
  obtain ⟨e,he⟩ := dualNormalEquiv A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  refine ⟨e,?_⟩
  apply dualNormalEquivInclusion A γ δ s t (dualGenerator A γ δ s t) e he
  intro j
  simp only [dualMultiplicationApply,one_mul]

-- Existing test: normalGenerator, actual canonical epsilon over a nonreduced ring.
example : ∃ e : (sectionIdeal (ZMod 4) 0 0 0 0 →ₗ[Ring (ZMod 4) 0 0 0 0]
    Ring (ZMod 4) 0 0 0 0) ≃ₗ[ZMod 4] (Ring (ZMod 4) 0 0 0 0 × ZMod 4),
    e (dualGenerator (ZMod 4) 0 0 0 0) = (0,1) := by
  obtain ⟨e,he⟩ := dualNormalEquiv (ZMod 4) 0 0 0 0
    (dualGenerator (ZMod 4) 0 0 0 0) (dualGenerator_spec (ZMod 4) 0 0 0 0)
  refine ⟨e,?_⟩
  exact dualNormalEquivGenerator (ZMod 4) 0 0 0 0 _ e he

-- Existing test: normalRoundTrip, with the constructed inverse's formula.
example : ∃ e : D₀ ≃ₗ[A] (R₀ × A),
    (∀ p, e (e.symm p) = p) ∧
    (∀ p j, e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * dualGenerator A γ δ s t j) := by
  obtain ⟨e,he⟩ := dualNormalEquiv A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  exact ⟨e,e.apply_symm_apply,he⟩

-- Existing test: residueGenerator, actual surjective residue over the zero ring too.
example : ∃ ρ : D₀ →ₗ[A] A,
    Function.Surjective ρ ∧ ρ (dualGenerator A γ δ s t) = 1 := by
  obtain ⟨ρ,hs,hg,-,-⟩ := dualResidue A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  exact ⟨ρ,hs,hg⟩

-- Existing test: residueInclusion, with the actual multiplication image.
example : ∃ ρ : D₀ →ₗ[A] A,
    Function.Surjective ρ ∧ ∀ r, ρ (dualMultiplication A γ δ s t r) = 0 := by
  obtain ⟨ρ,hs,-,-,hk⟩ := dualResidue A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  exact ⟨ρ,hs,fun r => (hk _).mpr ⟨r,dualMultiplicationApply A γ δ s t r⟩⟩

-- Existing non-example: residueNoRingSplit, proved for every nonzero coefficient ring.
example [Nontrivial A] (ρ : D₀ →ₗ[A] A) :
    let ev : R₀ →+* A := sectionEval A γ δ s t
    ¬ ∃ σ : A →ₗ[A] D₀,
      (∀ (r : R₀) (z : A), σ (ev r * z) = r • σ z) ∧
      Function.RightInverse σ ρ := by
  dsimp only
  rintro ⟨σ,hσ,hright⟩
  have hd := hσ d₀ 1
  have hev : sectionEval A γ δ s t d₀ = 0 := by
    simp [sectionEval,coefficientHom]
  rw [hev,zero_mul,map_zero] at hd
  have hz : σ 1 = 0 := by
    ext j
    apply sectionCoordinateRegular A γ δ s t
    change d₀ * σ 1 j = d₀ * 0
    have h := congrArg (fun h : D₀ => h j) hd
    simpa only [LinearMap.zero_apply,LinearMap.smul_apply,smul_eq_mul,mul_zero] using h.symm
  have h1 := hright 1
  rw [hz,map_zero] at h1
  exact zero_ne_one h1

-- New construction tests: multiplicationZero, multiplicationOne, multiplicationFaithful.
example : dualMultiplication A γ δ s t 0 = 0 := map_zero _
example (j : J₀) : dualMultiplication A γ δ s t 1 j = (j : R₀) := by
  simp only [dualMultiplicationApply,one_mul]
example (r : R₀) : dualMultiplication A γ δ s t r = 0 ↔ r = 0 := by
  rw [←(dualMultiplication A γ δ s t).map_zero]
  exact ⟨fun h => dualMultiplicationInjective A γ δ s t h, fun h => congrArg _ h⟩

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_coefficient_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_second_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_root_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_first_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_commutes
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_at_second
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_dualNumerator
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_decomposition
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalForm_exists
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_coordinates_unique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalForm
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplication
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplicationApply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquiv
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_action
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarAction
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidue
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquivInclusion
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquivGenerator
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidueGenerator
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidueInclusion
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplicationInjective

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open scoped TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "R₀" => Ring A γ δ s t
local notation "J₀" => (Ideal.span {AdjoinRoot.root (polynomial A γ δ s t) - coefficientHom A γ δ s t s,
  AdjoinRoot.of (polynomial A γ δ s t) (Polynomial.X : Polynomial A) - coefficientHom A γ δ s t t} : Ideal R₀)
local notation "D₀" => J₀ →ₗ[R₀] R₀

lemma sectionIdeal_coefficient_projective : Module.Projective A J₀ := by
  have : Module.Free A R₀ := (normalFormFree A γ δ s t).2
  exact Module.Projective.of_split (((J₀).subtype).restrictScalars A)
    (sectionProjection A γ δ s t) (by
      apply LinearMap.ext
      intro j
      exact sectionProjection_ideal A γ δ s t j)

lemma sectionIdeal_flat : Module.Flat A J₀ := by
  have := sectionIdeal_coefficient_projective A γ δ s t
  infer_instance

lemma sectionDual_coefficient_free : Module.Free A D₀ := by
  have : Module.Free A R₀ := (normalFormFree A γ δ s t).2
  obtain ⟨e,he⟩ := dualNormalEquiv A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  exact Module.Free.of_equiv e.symm

lemma sectionDual_flat : Module.Flat A D₀ := by
  have := sectionDual_coefficient_free A γ δ s t
  infer_instance

lemma sectionProjection_lTensor_retraction (M : Type*) [AddCommGroup M] [Module A M] :
    ((sectionProjection A γ δ s t).lTensor M).comp
      ((((J₀).subtype).restrictScalars A).lTensor M) = LinearMap.id := by
  rw [← LinearMap.lTensor_comp]
  have h : (sectionProjection A γ δ s t).comp
      (((J₀).subtype).restrictScalars A) = LinearMap.id := by
    apply LinearMap.ext
    intro j
    exact sectionProjection_ideal A γ δ s t j
  rw [h]
  exact LinearMap.lTensor_id M J₀

lemma sectionIdeal_lTensor_injective (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective ((((J₀).subtype).restrictScalars A).lTensor M) := by
  intro x y h
  have hh := congrArg ((sectionProjection A γ δ s t).lTensor M) h
  simpa only [← LinearMap.comp_apply,
    sectionProjection_lTensor_retraction, LinearMap.id_apply] using hh


-- Coefficient projectivity is available over the nonreduced ring Z/4.
-- NodeSectionFactorization.PolynomialModel.coefficientProjectiveNonreduced
example : Module.Projective (ZMod 4)
    (Ideal.span {AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0) - coefficientHom (ZMod 4) 0 0 1 0 1,
      AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (Polynomial.X : Polynomial (ZMod 4)) -
        coefficientHom (ZMod 4) 0 0 1 0 0} : Ideal (Ring (ZMod 4) 0 0 1 0)) :=
  sectionIdeal_coefficient_projective (ZMod 4) 0 0 1 0

-- No nontriviality assumption is hidden in the coefficient-flatness proof.
-- NodeSectionFactorization.PolynomialModel.coefficientIdealFlatZero
example : Module.Flat (ZMod 1)
    (Ideal.span {AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0) - coefficientHom (ZMod 1) 0 0 0 0 0,
      AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (Polynomial.X : Polynomial (ZMod 1)) -
        coefficientHom (ZMod 1) 0 0 0 0 0} : Ideal (Ring (ZMod 1) 0 0 0 0)) :=
  sectionIdeal_flat (ZMod 1) 0 0 0 0

-- The actual dual is free over coefficients, including nonreduced coefficients.
-- NodeSectionFactorization.PolynomialModel.coefficientDualFreeNonreduced
example : Module.Free (ZMod 4)
    ((Ideal.span {AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0) - coefficientHom (ZMod 4) 0 0 1 0 1,
      AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (Polynomial.X : Polynomial (ZMod 4)) -
        coefficientHom (ZMod 4) 0 0 1 0 0} : Ideal (Ring (ZMod 4) 0 0 1 0)) →ₗ[Ring (ZMod 4) 0 0 1 0]
        Ring (ZMod 4) 0 0 1 0) :=
  sectionDual_coefficient_free (ZMod 4) 0 0 1 0

-- NodeSectionFactorization.PolynomialModel.coefficientDualFlatZero
example : Module.Flat (ZMod 1)
    ((Ideal.span {AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0) - coefficientHom (ZMod 1) 0 0 0 0 0,
      AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (Polynomial.X : Polynomial (ZMod 1)) -
        coefficientHom (ZMod 1) 0 0 0 0 0} : Ideal (Ring (ZMod 1) 0 0 0 0)) →ₗ[Ring (ZMod 1) 0 0 0 0]
        Ring (ZMod 1) 0 0 0 0) :=
  sectionDual_flat (ZMod 1) 0 0 0 0

-- Tensoring the inclusion with the torsion Z-module Z/2 stays injective.
-- NodeSectionFactorization.PolynomialModel.tensorInclusionTorsion
example : Function.Injective
    ((((Ideal.span {AdjoinRoot.root (polynomial ℤ 0 0 0 0) - coefficientHom ℤ 0 0 0 0 0,
      AdjoinRoot.of (polynomial ℤ 0 0 0 0) (Polynomial.X : Polynomial ℤ) - coefficientHom ℤ 0 0 0 0 0} :
        Ideal (Ring ℤ 0 0 0 0)).subtype).restrictScalars ℤ).lTensor (ZMod 2)) :=
  sectionIdeal_lTensor_injective ℤ 0 0 0 0 (ZMod 2)

-- Retraction holds pointwise on every tensor, without assuming M is flat.
-- NodeSectionFactorization.PolynomialModel.tensorRetractionPointwise
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] J₀) :
    ((sectionProjection A γ δ s t).lTensor M)
      ((((J₀).subtype).restrictScalars A).lTensor M z) = z := by
  change (((sectionProjection A γ δ s t).lTensor M).comp
    ((((J₀).subtype).restrictScalars A).lTensor M)) z = z
  rw [sectionProjection_lTensor_retraction]
  rfl

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_coefficient_projective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_flat
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDual_coefficient_free
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDual_flat
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_lTensor_retraction
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_lTensor_injective

namespace TauCeti.ModuliCurves.NodeSectionFactorization
variable {R : Type*} [CommRing R]
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
end TauCeti.ModuliCurves.NodeSectionFactorization

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
  let p := (E₀ x).1
  let q := (E₀ x).2
  let α := q.eval t
  have hpval : p.eval t = (s + γ*t)*α := by
    have he := congrArg (fun z : R₀ => ((E₀ z).2).eval t) h
    rw [polynomialCoordinates_first_mul,polynomialCoordinates_second_mul] at he
    simp only [eval_sub,eval_add,eval_mul,eval_C,eval_X,sub_self,zero_mul] at he
    exact sub_eq_zero.mp he
  obtain ⟨p₀,hp₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := p) (a := t)
  obtain ⟨q₀,hq₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := q) (a := t)
  let r := AdjoinRoot.of F₀ p₀ + u₀ * AdjoinRoot.of F₀ q₀
  have hr : E₀ r = (p₀,q₀) := by
    simpa only [polynomialCoordinates_symm] using (E₀).apply_symm_apply (p₀,q₀)
  have hx : x = d₀ * r + ι₀ α * b₀ := by
    apply (E₀).injective
    rw [map_add,polynomialCoordinates_second_mul]
    change E₀ x = ((X-C t)*(E₀ r).1,(X-C t)*(E₀ r).2) +
      E₀ (AdjoinRoot.of F₀ (C α) * b₀)
    rw [polynomialCoordinates_coefficient_mul,polynomialCoordinates_dualNumerator,hr]
    apply Prod.ext
    · change p = (X-C t)*p₀ + C α * C (s+γ*t)
      rw [hpval] at hp₀
      rw [←hp₀,←map_mul]
      ring
    · change q = (X-C t)*q₀ + C α * 1
      rw [mul_one,←hq₀]
      exact (sub_add_cancel _ _).symm
  refine ⟨r,α,hx,?_⟩
  apply sectionCoordinateRegular A γ δ s t
  change d₀ * y = d₀ * (c₀ * r - ι₀ α * a₀)
  rw [hx] at h
  linear_combination -h + ι₀ α * sectionRelation A γ δ s t

lemma polynomialCoordinates_first : E₀ c₀ = (-C s,1) := by
  rw [map_sub,polynomialCoordinates_root]
  change (0,1) - E₀ (AdjoinRoot.of F₀ (C s)) = _
  rw [polynomialCoordinates_of]
  simp

lemma polynomialCoordinates_numerator_mul (r : R₀) :
    (E₀ (b₀ * r)).2 = (E₀ r).1 + (C (s+γ*t) - C γ * X) * (E₀ r).2 := by
  have hb : b₀ = u₀ + AdjoinRoot.of F₀ (C (s+γ*t)) := by
    simp only [map_add,map_mul,coefficientHom,RingHom.comp_apply]
    ring
  rw [hb,add_mul,map_add,polynomialCoordinates_root_mul,polynomialCoordinates_coefficient_mul]
  change (E₀ r).1-(C γ*X)*(E₀ r).2+C (s+γ*t)*(E₀ r).2 = _
  ring

lemma sectionDualSyzygy (x y : R₀) (h : d₀ * x = b₀ * y) :
    ∃ r : R₀, ∃ α : A,
      x = b₀ * r - ι₀ α * a₀ ∧ y = d₀ * r + ι₀ α * c₀ := by
  let p := (E₀ y).1
  let q := (E₀ y).2
  let α := q.eval t
  have hpval : p.eval t = -s*α := by
    have he := congrArg (fun z : R₀ => ((E₀ z).2).eval t) h
    rw [polynomialCoordinates_second_mul,polynomialCoordinates_numerator_mul] at he
    simp only [eval_sub,eval_add,eval_mul,eval_C,eval_X,sub_self,zero_mul] at he
    change 0 = p.eval t + (s+γ*t-γ*t)*α at he
    linear_combination -he
  obtain ⟨p₀,hp₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := p) (a := t)
  obtain ⟨q₀,hq₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := q) (a := t)
  let r := AdjoinRoot.of F₀ p₀ + u₀ * AdjoinRoot.of F₀ q₀
  have hr : E₀ r = (p₀,q₀) := by
    simpa only [polynomialCoordinates_symm] using (E₀).apply_symm_apply (p₀,q₀)
  have hy : y = d₀ * r + ι₀ α * c₀ := by
    apply (E₀).injective
    rw [map_add,polynomialCoordinates_second_mul]
    change E₀ y = ((X-C t)*(E₀ r).1,(X-C t)*(E₀ r).2) +
      E₀ (AdjoinRoot.of F₀ (C α) * c₀)
    rw [polynomialCoordinates_coefficient_mul,polynomialCoordinates_first,hr]
    apply Prod.ext
    · change p = (X-C t)*p₀ + C α * (-C s)
      rw [hpval] at hp₀
      rw [←hp₀,map_mul,map_neg]
      ring
    · change q = (X-C t)*q₀ + C α * 1
      rw [mul_one,←hq₀]
      exact (sub_add_cancel _ _).symm
  refine ⟨r,α,?_,hy⟩
  apply sectionCoordinateRegular A γ δ s t
  change d₀ * x = d₀ * (b₀ * r - ι₀ α * a₀)
  rw [hy] at h
  linear_combination h + ι₀ α * sectionRelation A γ δ s t

def idealPresentation : (Fin 2 → R₀) →ₗ[R₀] J₀ where
  toFun z := ⟨c₀*z 0-d₀*z 1, Ideal.mem_span_pair.mpr ⟨z 0,-z 1,by ring⟩⟩
  map_add' z w := by
    apply Subtype.ext
    change c₀*(z 0+w 0)-d₀*(z 1+w 1) = (c₀*z 0-d₀*z 1)+(c₀*w 0-d₀*w 1)
    ring
  map_smul' r z := by
    apply Subtype.ext
    change c₀*(r*z 0)-d₀*(r*z 1) = r*(c₀*z 0-d₀*z 1)
    ring

lemma idealPresentation_apply (z : Fin 2 → R₀) :
    (idealPresentation A γ δ s t z : R₀) = c₀*z 0-d₀*z 1 := rfl

lemma idealPresentation_surjective : Function.Surjective (idealPresentation A γ δ s t) := by
  intro j
  obtain ⟨x,y,hj⟩ := Ideal.mem_span_pair.mp j.property
  refine ⟨![x,-y],?_⟩
  apply Subtype.ext
  rw [idealPresentation_apply]
  simp only [Matrix.cons_val_zero,Matrix.cons_val_one]
  linear_combination hj

lemma right_mulVec (z : Fin 2 → R₀) :
    (Ψ₀).mulVecLin z = ![d₀*z 0-b₀*z 1,c₀*z 0+a₀*z 1] := by
  ext i
  fin_cases i
  · simp [right,Matrix.mulVec,dotProduct,Fin.sum_univ_two]
    ring
  · simp [right,Matrix.mulVec,dotProduct,Fin.sum_univ_two]

lemma left_mulVec (z : Fin 2 → R₀) :
    (Φ₀).mulVecLin z = ![a₀*z 0+b₀*z 1,-c₀*z 0+d₀*z 1] := by
  ext i
  fin_cases i <;> simp [left,Matrix.mulVec,dotProduct,Fin.sum_univ_two]

lemma idealPresentation_kernel :
    LinearMap.ker (idealPresentation A γ δ s t) = LinearMap.range (Ψ₀).mulVecLin := by
  ext z
  simp only [LinearMap.mem_ker,LinearMap.mem_range]
  constructor
  · intro hz
    have h : c₀*z 0 = d₀*z 1 := by
      have hh := congrArg (fun j : J₀ => (j : R₀)) hz
      change c₀*z 0-d₀*z 1=0 at hh
      exact sub_eq_zero.mp hh
    obtain ⟨r,α,hx,hy⟩ := sectionIdealSyzygy A γ δ s t (z 0) (z 1) h
    refine ⟨![r,-ι₀ α],?_⟩
    rw [right_mulVec]
    ext i
    fin_cases i
    · change d₀*r-b₀*(-ι₀ α)=z 0
      linear_combination -hx
    · change c₀*r+a₀*(-ι₀ α)=z 1
      linear_combination -hy
  · rintro ⟨w,rfl⟩
    apply Subtype.ext
    rw [idealPresentation_apply,right_mulVec]
    simp only [Matrix.cons_val_zero,Matrix.cons_val_one]
    change c₀*(d₀*w 0-b₀*w 1)-d₀*(c₀*w 0+a₀*w 1)=0
    linear_combination -(w 1)*sectionRelation A γ δ s t

def dualPresentation : (Fin 2 → R₀) →ₗ[R₀] D₀ where
  toFun z := dualMultiplication A γ δ s t (z 0) - z 1 • dualGenerator A γ δ s t
  map_add' z w := by
    ext j
    change (z 0+w 0)*(j : R₀)-(z 1+w 1)*dualGenerator A γ δ s t j =
      (z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j)+
      (w 0*(j : R₀)-w 1*dualGenerator A γ δ s t j)
    ring
  map_smul' r z := by
    ext j
    change (r*z 0)*(j : R₀)-(r*z 1)*dualGenerator A γ δ s t j =
      r*(z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j)
    ring

lemma dualPresentation_apply (z : Fin 2 → R₀) (j : J₀) :
    dualPresentation A γ δ s t z j = z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j := rfl

lemma dualPresentation_surjective : Function.Surjective (dualPresentation A γ δ s t) := by
  intro h
  obtain ⟨z,hz,-⟩ := dualNormalForm A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t) h
  refine ⟨![z.1,-ι₀ z.2],?_⟩
  ext j
  rw [dualPresentation_apply]
  simp only [Matrix.cons_val_zero,Matrix.cons_val_one]
  linear_combination -hz j

lemma dualPresentation_zero_iff (z : Fin 2 → R₀) :
    dualPresentation A γ δ s t z = 0 ↔ d₀*z 0=b₀*z 1 := by
  constructor
  · intro hz
    have hd := congrArg (fun h : D₀ => h ⟨d₀,sectionSecond_mem A γ δ s t⟩) hz
    rw [dualPresentation_apply,(dualGeneratorValues A γ δ s t _
      (dualGenerator_spec A γ δ s t)).2] at hd
    change z 0*d₀-z 1*b₀=0 at hd
    linear_combination hd
  · intro hz
    ext j
    apply sectionCoordinateRegular A γ δ s t
    rw [dualPresentation_apply]
    change d₀*(z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j)=d₀*0
    linear_combination (j : R₀)*hz - z 1*dualGenerator_spec A γ δ s t j

lemma dualPresentation_kernel :
    LinearMap.ker (dualPresentation A γ δ s t) = LinearMap.range (Φ₀).mulVecLin := by
  ext z
  simp only [LinearMap.mem_ker,LinearMap.mem_range,dualPresentation_zero_iff]
  constructor
  · intro hz
    obtain ⟨r,α,hx,hy⟩ := sectionDualSyzygy A γ δ s t (z 0) (z 1) hz
    refine ⟨![-ι₀ α,r],?_⟩
    rw [left_mulVec]
    ext i
    fin_cases i
    · change a₀*(-ι₀ α)+b₀*r=z 0
      linear_combination -hx
    · change -c₀*(-ι₀ α)+d₀*r=z 1
      linear_combination -hy
  · rintro ⟨w,rfl⟩
    rw [left_mulVec]
    simp only [Matrix.cons_val_zero,Matrix.cons_val_one]
    linear_combination (w 0)*sectionRelation A γ δ s t

theorem cokernelIdeal :
    ∃ e : ((Fin 2 → R₀) ⧸ LinearMap.range (Ψ₀).mulVecLin) ≃ₗ[R₀] J₀,
      ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀*z 0-d₀*z 1 := by
  let e := (Submodule.quotEquivOfEq _ _ (idealPresentation_kernel A γ δ s t).symm).trans
    ((idealPresentation A γ δ s t).quotKerEquivOfSurjective
      (idealPresentation_surjective A γ δ s t))
  refine ⟨e,?_⟩
  intro z
  simp only [e,LinearEquiv.trans_apply,Submodule.quotEquivOfEq_mk,
    LinearMap.quotKerEquivOfSurjective_apply_mk,idealPresentation_apply]

theorem cokernelIdealGenerators
    (e : ((Fin 2 → R₀) ⧸ LinearMap.range (Ψ₀).mulVecLin) ≃ₗ[R₀] J₀)
    (he : ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀*z 0-d₀*z 1) :
    (e (Submodule.Quotient.mk (fun i => if i=0 then 1 else 0)) : R₀) = c₀ ∧
    (e (Submodule.Quotient.mk (fun i => if i=0 then 0 else 1)) : R₀) = -d₀ := by
  constructor <;> rw [he] <;> simp

theorem cokernelIdealUnique
    (e f : ((Fin 2 → R₀) ⧸ LinearMap.range (Ψ₀).mulVecLin) ≃ₗ[R₀] J₀)
    (he : ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀*z 0-d₀*z 1)
    (hf : ∀ z : Fin 2 → R₀, (f (Submodule.Quotient.mk z) : R₀) = c₀*z 0-d₀*z 1) : e=f := by
  apply LinearEquiv.toLinearMap_injective
  apply LinearMap.ext
  intro z
  induction z using Submodule.Quotient.induction_on
  rename_i z
  apply Subtype.ext
  exact (he z).trans (hf z).symm

theorem cokernelDual :
    ∃ e : ((Fin 2 → R₀) ⧸ LinearMap.range (Φ₀).mulVecLin) ≃ₗ[R₀] D₀,
      ∀ (z : Fin 2 → R₀) (j : J₀),
        d₀*e (Submodule.Quotient.mk z) j = (d₀*z 0-b₀*z 1)*(j : R₀) := by
  let e := (Submodule.quotEquivOfEq _ _ (dualPresentation_kernel A γ δ s t).symm).trans
    ((dualPresentation A γ δ s t).quotKerEquivOfSurjective
      (dualPresentation_surjective A γ δ s t))
  refine ⟨e,?_⟩
  intro z j
  simp only [e,LinearEquiv.trans_apply,Submodule.quotEquivOfEq_mk,
    LinearMap.quotKerEquivOfSurjective_apply_mk,dualPresentation_apply]
  linear_combination -z 1*dualGenerator_spec A γ δ s t j

theorem cokernelDualGenerators (ε : D₀)
    (hε : ∀ j : J₀, d₀*ε j=b₀*(j : R₀))
    (e : ((Fin 2 → R₀) ⧸ LinearMap.range (Φ₀).mulVecLin) ≃ₗ[R₀] D₀)
    (he : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀*e (Submodule.Quotient.mk z) j=(d₀*z 0-b₀*z 1)*(j : R₀)) :
    (∀ j : J₀, e (Submodule.Quotient.mk (fun i => if i=0 then 1 else 0)) j=(j : R₀)) ∧
    e (Submodule.Quotient.mk (fun i => if i=0 then 0 else 1)) = -ε := by
  constructor
  · intro j
    apply sectionCoordinateRegular A γ δ s t
    dsimp only
    rw [he]
    simp
  · ext j
    apply sectionCoordinateRegular A γ δ s t
    dsimp only
    rw [he]
    change (d₀*0-b₀*1)*(j : R₀)=d₀*(-ε j)
    linear_combination hε j

theorem cokernelDualUnique
    (e f : ((Fin 2 → R₀) ⧸ LinearMap.range (Φ₀).mulVecLin) ≃ₗ[R₀] D₀)
    (he : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀*e (Submodule.Quotient.mk z) j=(d₀*z 0-b₀*z 1)*(j : R₀))
    (hf : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀*f (Submodule.Quotient.mk z) j=(d₀*z 0-b₀*z 1)*(j : R₀)) : e=f := by
  apply LinearEquiv.toLinearMap_injective
  apply LinearMap.ext
  intro z
  induction z using Submodule.Quotient.induction_on
  rename_i z
  ext j
  apply sectionCoordinateRegular A γ δ s t
  dsimp only
  exact (he z j).trans (hf z j).symm

lemma quotientLeftExact : LinearMap.ker (Φ₀).mulVecLin = LinearMap.range (Ψ₀).mulVecLin := by
  rw [←idealPresentation_kernel]
  ext z
  simp only [LinearMap.mem_ker]
  constructor
  · intro hz
    have hh := congrArg (fun w : Fin 2 → R₀ => w 1) hz
    rw [left_mulVec] at hh
    apply Subtype.ext
    rw [idealPresentation_apply]
    change c₀*z 0-d₀*z 1=0
    change -c₀*z 0+d₀*z 1=0 at hh
    linear_combination -hh
  · intro hz
    have hrange : z ∈ LinearMap.range (Ψ₀).mulVecLin := by
      rw [←idealPresentation_kernel]
      exact hz
    obtain ⟨w,rfl⟩ := hrange
    rw [right_mulVec,left_mulVec]
    ext i
    fin_cases i
    · change a₀*(d₀*w 0-b₀*w 1)+b₀*(c₀*w 0+a₀*w 1)=0
      linear_combination (w 0)*sectionRelation A γ δ s t
    · change -c₀*(d₀*w 0-b₀*w 1)+d₀*(c₀*w 0+a₀*w 1)=0
      linear_combination (w 1)*sectionRelation A γ δ s t

lemma quotientRightExact : LinearMap.ker (Ψ₀).mulVecLin = LinearMap.range (Φ₀).mulVecLin := by
  rw [←dualPresentation_kernel]
  ext z
  simp only [LinearMap.mem_ker,dualPresentation_zero_iff]
  constructor
  · intro hz
    have hh := congrArg (fun w : Fin 2 → R₀ => w 0) hz
    rw [right_mulVec] at hh
    change d₀*z 0-b₀*z 1=0 at hh
    exact sub_eq_zero.mp hh
  · intro hz
    have hrange : z ∈ LinearMap.range (Φ₀).mulVecLin := by
      rw [←dualPresentation_kernel]
      exact (dualPresentation_zero_iff A γ δ s t z).mpr hz
    obtain ⟨w,rfl⟩ := hrange
    rw [left_mulVec,right_mulVec]
    ext i
    fin_cases i
    · change d₀*(a₀*w 0+b₀*w 1)-b₀*(-c₀*w 0+d₀*w 1)=0
      linear_combination (w 0)*sectionRelation A γ δ s t
    · change c₀*(a₀*w 0+b₀*w 1)+a₀*(-c₀*w 0+d₀*w 1)=0
      linear_combination (w 1)*sectionRelation A γ δ s t

lemma transposeLeft_mulVec (z : Fin 2 → R₀) :
    ((Φ₀).transpose).mulVecLin z = ![a₀*z 0-c₀*z 1,b₀*z 0+d₀*z 1] := by
  ext i
  fin_cases i
  · simp [left,Matrix.vecMul,dotProduct,Fin.sum_univ_two,sub_eq_add_neg]
    ring
  · simp [left,Matrix.vecMul,dotProduct,Fin.sum_univ_two]
    ring

lemma transposeRight_mulVec (z : Fin 2 → R₀) :
    ((Ψ₀).transpose).mulVecLin z = ![d₀*z 0+c₀*z 1,-b₀*z 0+a₀*z 1] := by
  ext i
  fin_cases i
  · simp [right,Matrix.vecMul,dotProduct,Fin.sum_univ_two]
    ring
  · simp [right,Matrix.vecMul,dotProduct,Fin.sum_univ_two]
    ring

lemma quotientTransposeLeftExact :
    LinearMap.ker ((Φ₀).transpose).mulVecLin = LinearMap.range ((Ψ₀).transpose).mulVecLin := by
  ext z
  simp only [LinearMap.mem_ker,LinearMap.mem_range]
  constructor
  · intro hz
    have hh := congrArg (fun w : Fin 2 → R₀ => w 1) hz
    rw [transposeLeft_mulVec] at hh
    have h : d₀*(-z 1)=b₀*z 0 := by
      change b₀*z 0+d₀*z 1=0 at hh
      linear_combination -hh
    obtain ⟨r,α,hx,hy⟩ := sectionDualSyzygy A γ δ s t (-z 1) (z 0) h
    refine ⟨![r,ι₀ α],?_⟩
    rw [transposeRight_mulVec]
    ext i
    fin_cases i
    · change d₀*r+c₀*ι₀ α=z 0
      linear_combination -hy
    · change -b₀*r+a₀*ι₀ α=z 1
      linear_combination hx
  · rintro ⟨w,rfl⟩
    rw [transposeRight_mulVec,transposeLeft_mulVec]
    ext i
    fin_cases i
    · change a₀*(d₀*w 0+c₀*w 1)-c₀*(-b₀*w 0+a₀*w 1)=0
      linear_combination (w 0)*sectionRelation A γ δ s t
    · change b₀*(d₀*w 0+c₀*w 1)+d₀*(-b₀*w 0+a₀*w 1)=0
      linear_combination (w 1)*sectionRelation A γ δ s t

lemma quotientTransposeRightExact :
    LinearMap.ker ((Ψ₀).transpose).mulVecLin = LinearMap.range ((Φ₀).transpose).mulVecLin := by
  ext z
  simp only [LinearMap.mem_ker,LinearMap.mem_range]
  constructor
  · intro hz
    have hh := congrArg (fun w : Fin 2 → R₀ => w 0) hz
    rw [transposeRight_mulVec] at hh
    have h : c₀*(-z 1)=d₀*z 0 := by
      change d₀*z 0+c₀*z 1=0 at hh
      linear_combination -hh
    obtain ⟨r,α,hx,hy⟩ := sectionIdealSyzygy A γ δ s t (-z 1) (z 0) h
    refine ⟨![-ι₀ α,-r],?_⟩
    rw [transposeLeft_mulVec]
    ext i
    fin_cases i
    · change a₀*(-ι₀ α)-c₀*(-r)=z 0
      linear_combination -hy
    · change b₀*(-ι₀ α)+d₀*(-r)=z 1
      linear_combination hx
  · rintro ⟨w,rfl⟩
    rw [transposeLeft_mulVec,transposeRight_mulVec]
    ext i
    fin_cases i
    · change d₀*(a₀*w 0-c₀*w 1)+c₀*(b₀*w 0+d₀*w 1)=0
      linear_combination (w 0)*sectionRelation A γ δ s t
    · change -b₀*(a₀*w 0-c₀*w 1)+a₀*(b₀*w 0+d₀*w 1)=0
      linear_combination (w 1)*sectionRelation A γ δ s t

theorem quotientExact :
    LinearMap.ker (Φ₀).mulVecLin = LinearMap.range (Ψ₀).mulVecLin ∧
    LinearMap.ker (Ψ₀).mulVecLin = LinearMap.range (Φ₀).mulVecLin ∧
    LinearMap.ker ((Φ₀).transpose).mulVecLin = LinearMap.range ((Ψ₀).transpose).mulVecLin ∧
    LinearMap.ker ((Ψ₀).transpose).mulVecLin = LinearMap.range ((Φ₀).transpose).mulVecLin :=
  ⟨quotientLeftExact A γ δ s t,quotientRightExact A γ δ s t,
    quotientTransposeLeftExact A γ δ s t,quotientTransposeRightExact A γ δ s t⟩

-- NodeSectionFactorization.PolynomialModel.idealPresentationFirst
example : (idealPresentation A γ δ s t ![1,0] : R₀)=c₀ := by
  simp [idealPresentation_apply]
-- NodeSectionFactorization.PolynomialModel.idealPresentationSecond
example : (idealPresentation A γ δ s t ![0,1] : R₀)=-d₀ := by
  simp [idealPresentation_apply]
-- NodeSectionFactorization.PolynomialModel.idealPresentationZero
example : idealPresentation A γ δ s t 0=0 := map_zero _
-- NodeSectionFactorization.PolynomialModel.dualPresentationFirst
example (j : J₀) : dualPresentation A γ δ s t ![1,0] j=(j : R₀) := by
  simp [dualPresentation_apply]
-- NodeSectionFactorization.PolynomialModel.dualPresentationSecond
example : dualPresentation A γ δ s t ![0,1] = -dualGenerator A γ δ s t := by
  ext j
  simp [dualPresentation_apply]
-- NodeSectionFactorization.PolynomialModel.dualPresentationZero
example : dualPresentation A γ δ s t 0=0 := map_zero _
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
  dsimp only
  obtain ⟨e,he⟩ := cokernelIdeal (ZMod 4) 0 0 1 0
  exact ⟨e,cokernelIdealGenerators (ZMod 4) 0 0 1 0 e he⟩
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
  dsimp only
  obtain ⟨e,he⟩ := cokernelDual (ZMod 3) 1 0 0 0
  exact ⟨e,(cokernelDualGenerators (ZMod 3) 1 0 0 0 _
    (dualGenerator_spec (ZMod 3) 1 0 0 0) e he).2⟩
-- NodeSectionFactorization.PolynomialModel.actualIdealCokernelZeroBase
example :
    let B := Ring (ZMod 1) 0 0 0 0
    let ι := coefficientHom (ZMod 1) 0 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (X : Polynomial (ZMod 1))
    let β := right (ι 0) (ι 0) u v (ι 0) (ι 0)
    Nonempty (((Fin 2 → B) ⧸ LinearMap.range β.mulVecLin) ≃ₗ[B] Ideal.span {u-ι 0,v-ι 0}) := by
  obtain ⟨e,-⟩ := cokernelIdeal (ZMod 1) 0 0 0 0
  exact ⟨e⟩
-- NodeSectionFactorization.PolynomialModel.actualDualCokernelCharacteristicTwo
example :
    let B := Ring (ZMod 2) 1 0 0 0
    let ι := coefficientHom (ZMod 2) 1 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 2) 1 0 0 0) (X : Polynomial (ZMod 2))
    let α := left (ι 1) (ι 0) u v (ι 0) (ι 0)
    Nonempty (((Fin 2 → B) ⧸ LinearMap.range α.mulVecLin) ≃ₗ[B]
      (Ideal.span {u-ι 0,v-ι 0} →ₗ[B] B)) := by
  obtain ⟨e,-⟩ := cokernelDual (ZMod 2) 1 0 0 0
  exact ⟨e⟩
-- NodeSectionFactorization.PolynomialModel.actualComplexNonreduced
example :
    let ι := coefficientHom (ZMod 4) 0 0 1 0
    let u := AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)
    let v := AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (X : Polynomial (ZMod 4))
    let α := left (ι 0) (ι 0) u v (ι 1) (ι 0)
    let β := right (ι 0) (ι 0) u v (ι 1) (ι 0)
    LinearMap.ker α.mulVecLin=LinearMap.range β.mulVecLin ∧
      LinearMap.ker β.transpose.mulVecLin=LinearMap.range α.transpose.mulVecLin := by
  have h := quotientExact (ZMod 4) 0 0 1 0
  exact ⟨h.1,h.2.2.2⟩
-- NodeSectionFactorization.PolynomialModel.actualComplexZeroBase
example :
    let ι := coefficientHom (ZMod 1) 0 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (X : Polynomial (ZMod 1))
    let α := left (ι 0) (ι 0) u v (ι 0) (ι 0)
    let β := right (ι 0) (ι 0) u v (ι 0) (ι 0)
    LinearMap.ker β.mulVecLin=LinearMap.range α.mulVecLin :=
  (quotientExact (ZMod 1) 0 0 0 0).2.1

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.left
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.right
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealSyzygy
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_first
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_numerator_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualSyzygy
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_surjective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.right_mulVec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.left_mulVec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_kernel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_surjective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_zero_iff
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_kernel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdeal
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdealGenerators
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdealUnique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDual
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDualGenerators
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDualUnique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientLeftExact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientRightExact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_mulVec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_mulVec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeLeftExact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeRightExact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientExact

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
  have : Module.Flat A D₀ := sectionDual_flat A γ δ s t
  apply LinearMap.lTensor_injective_of_exact_of_flat
    ((dualPresentation A γ δ s t).restrictScalars A)
    (dualPresentation_surjective A γ δ s t)
    (LinearMap.range ΦA).subtype (Submodule.injective_subtype _)
  intro z
  constructor
  · intro hz
    have h : z ∈ LinearMap.range (Φ₀).mulVecLin := by
      rw [← dualPresentation_kernel A γ δ s t]
      exact hz
    exact ⟨⟨z,h⟩,rfl⟩
  · rintro ⟨w,rfl⟩
    have h : (w : Fin 2 → R₀) ∈ LinearMap.ker (dualPresentation A γ δ s t) := by
      rw [dualPresentation_kernel A γ δ s t]
      exact w.property
    exact h

lemma rightImage_lTensor_injective (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective ((LinearMap.range ΨA).subtype.lTensor M) := by
  have : Module.Flat A J₀ := sectionIdeal_flat A γ δ s t
  apply LinearMap.lTensor_injective_of_exact_of_flat
    ((idealPresentation A γ δ s t).restrictScalars A)
    (idealPresentation_surjective A γ δ s t)
    (LinearMap.range ΨA).subtype (Submodule.injective_subtype _)
  intro z
  constructor
  · intro hz
    have h : z ∈ LinearMap.range (Ψ₀).mulVecLin := by
      rw [← idealPresentation_kernel A γ δ s t]
      exact hz
    exact ⟨⟨z,h⟩,rfl⟩
  · rintro ⟨w,rfl⟩
    have h : (w : Fin 2 → R₀) ∈ LinearMap.ker (idealPresentation A γ δ s t) := by
      rw [idealPresentation_kernel A γ δ s t]
      exact w.property
    exact h

lemma quotientLeft_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨA).lTensor M) ((ΦA).lTensor M) := by
  have h : Function.Exact ΨA ΦA :=
    (LinearMap.exact_iff.mpr (quotientLeftExact A γ δ s t) :
      Function.Exact (Ψ₀).mulVecLin (Φ₀).mulVecLin)
  have hr : Function.Exact ΨA (ΦA).rangeRestrict := by
    rw [LinearMap.exact_iff,LinearMap.ker_rangeRestrict]
    exact LinearMap.exact_iff.mp h
  have ht := _root_.lTensor_exact M hr (ΦA).surjective_rangeRestrict
  have he : Function.Exact ((ΨA).lTensor M)
      (((LinearMap.range ΦA).subtype.lTensor M).comp ((ΦA).rangeRestrict.lTensor M)) :=
    (leftImage_lTensor_injective A γ δ s t M).comp_exact_iff_exact.mpr ht
  have hf : ((LinearMap.range ΦA).subtype.lTensor M).comp ((ΦA).rangeRestrict.lTensor M) =
      (ΦA).lTensor M := by
    rw [←LinearMap.lTensor_comp,LinearMap.subtype_comp_rangeRestrict]
  rwa [hf] at he

lemma quotientRight_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦA).lTensor M) ((ΨA).lTensor M) := by
  have h : Function.Exact ΦA ΨA :=
    (LinearMap.exact_iff.mpr (quotientRightExact A γ δ s t) :
      Function.Exact (Φ₀).mulVecLin (Ψ₀).mulVecLin)
  have hr : Function.Exact ΦA (ΨA).rangeRestrict := by
    rw [LinearMap.exact_iff,LinearMap.ker_rangeRestrict]
    exact LinearMap.exact_iff.mp h
  have ht := _root_.lTensor_exact M hr (ΨA).surjective_rangeRestrict
  have he : Function.Exact ((ΦA).lTensor M)
      (((LinearMap.range ΨA).subtype.lTensor M).comp ((ΨA).rangeRestrict.lTensor M)) :=
    (rightImage_lTensor_injective A γ δ s t M).comp_exact_iff_exact.mpr ht
  have hf : ((LinearMap.range ΨA).subtype.lTensor M).comp ((ΨA).rangeRestrict.lTensor M) =
      (ΨA).lTensor M := by
    rw [←LinearMap.lTensor_comp,LinearMap.subtype_comp_rangeRestrict]
  rwa [hf] at he
open TensorProduct

def sectionRotation : (Fin 2 → R₀) ≃ₗ[R₀] (Fin 2 → R₀) where
  toFun z := ![-z 1,z 0]
  invFun z := ![z 1,-z 0]
  left_inv z := by ext i; fin_cases i <;> simp
  right_inv z := by ext i; fin_cases i <;> simp
  map_add' z w := by ext i; fin_cases i <;> simp [add_comm]
  map_smul' r z := by ext i; fin_cases i <;> simp

lemma sectionRotation_apply (z : Fin 2 → R₀) :
    sectionRotation A γ δ s t z = ![-z 1,z 0] := rfl
lemma sectionRotation_symm_apply (z : Fin 2 → R₀) :
    (sectionRotation A γ δ s t).symm z = ![z 1,-z 0] := rfl
lemma sectionRotation_square (z : Fin 2 → R₀) :
    sectionRotation A γ δ s t (sectionRotation A γ δ s t z) = -z := by
  ext i
  fin_cases i <;> simp [sectionRotation_apply]

lemma transposeLeft_rotation :
    ((Φ₀).transpose).mulVecLin.comp (sectionRotation A γ δ s t).toLinearMap =
      (sectionRotation A γ δ s t).toLinearMap.comp (Ψ₀).mulVecLin := by
  apply LinearMap.ext
  intro z
  change ((Φ₀).transpose).mulVecLin (sectionRotation A γ δ s t z) =
    sectionRotation A γ δ s t ((Ψ₀).mulVecLin z)
  rw [sectionRotation_apply,transposeLeft_mulVec,right_mulVec,sectionRotation_apply]
  ext i
  fin_cases i <;> simp <;> ring
lemma transposeRight_rotation :
    ((Ψ₀).transpose).mulVecLin.comp (sectionRotation A γ δ s t).toLinearMap =
      (sectionRotation A γ δ s t).toLinearMap.comp (Φ₀).mulVecLin := by
  apply LinearMap.ext
  intro z
  change ((Ψ₀).transpose).mulVecLin (sectionRotation A γ δ s t z) =
    sectionRotation A γ δ s t ((Φ₀).mulVecLin z)
  rw [sectionRotation_apply,transposeRight_mulVec,left_mulVec,sectionRotation_apply]
  ext i
  fin_cases i <;> simp <;> ring

local notation "ΦTA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Matrix.transpose (Φ₀))))
local notation "ΨTA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Matrix.transpose (Ψ₀))))
local notation "pA" => (LinearEquiv.restrictScalars A (sectionRotation A γ δ s t))

lemma transposeLeft_lTensor_rotation (M : Type*) [AddCommGroup M] [Module A M] :
    ((ΦTA).lTensor M).comp ((pA).lTensor M).toLinearMap =
      ((pA).lTensor M).toLinearMap.comp ((ΨA).lTensor M) := by
  have h : (ΦTA).comp (pA).toLinearMap = (pA).toLinearMap.comp ΨA := by
    apply LinearMap.ext
    intro z
    exact LinearMap.congr_fun (transposeLeft_rotation A γ δ s t) z
  simpa only [LinearMap.lTensor_comp,LinearEquiv.coe_lTensor] using
    congrArg (LinearMap.lTensor M) h

lemma transposeRight_lTensor_rotation (M : Type*) [AddCommGroup M] [Module A M] :
    ((ΨTA).lTensor M).comp ((pA).lTensor M).toLinearMap =
      ((pA).lTensor M).toLinearMap.comp ((ΦA).lTensor M) := by
  have h : (ΨTA).comp (pA).toLinearMap = (pA).toLinearMap.comp ΦA := by
    apply LinearMap.ext
    intro z
    exact LinearMap.congr_fun (transposeRight_rotation A γ δ s t) z
  simpa only [LinearMap.lTensor_comp,LinearEquiv.coe_lTensor] using
    congrArg (LinearMap.lTensor M) h

lemma quotientTransposeLeft_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨTA).lTensor M) ((ΦTA).lTensor M) :=
  Function.Exact.of_ladder_linearEquiv_of_exact
    (transposeRight_lTensor_rotation A γ δ s t M)
    (transposeLeft_lTensor_rotation A γ δ s t M)
    (quotientRight_lTensor_exact A γ δ s t M)

lemma quotientTransposeRight_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦTA).lTensor M) ((ΨTA).lTensor M) :=
  Function.Exact.of_ladder_linearEquiv_of_exact
    (transposeLeft_lTensor_rotation A γ δ s t M)
    (transposeRight_lTensor_rotation A γ δ s t M)
    (quotientLeft_lTensor_exact A γ δ s t M)

local notation "PJA" => (LinearMap.restrictScalars A (idealPresentation A γ δ s t))
local notation "PDA" => (LinearMap.restrictScalars A (dualPresentation A γ δ s t))

lemma idealPresentation_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨA).lTensor M) ((PJA).lTensor M) := by
  have h : Function.Exact ΨA PJA :=
    (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t) :
      Function.Exact (Ψ₀).mulVecLin (idealPresentation A γ δ s t))
  exact _root_.lTensor_exact M h (idealPresentation_surjective A γ δ s t)
lemma dualPresentation_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦA).lTensor M) ((PDA).lTensor M) := by
  have h : Function.Exact ΦA PDA :=
    (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t) :
      Function.Exact (Φ₀).mulVecLin (dualPresentation A γ δ s t))
  exact _root_.lTensor_exact M h (dualPresentation_surjective A γ δ s t)

def tensorCokernelIdeal (M : Type*) [AddCommGroup M] [Module A M] :
    ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΨA).lTensor M)) ≃ₗ[A] (M ⊗[A] J₀) :=
  _root_.lTensor.equiv (f := ΨA) (g := PJA) M
    (by exact (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t) :
      Function.Exact (Ψ₀).mulVecLin (idealPresentation A γ δ s t))) (idealPresentation_surjective A γ δ s t)
lemma tensorCokernelIdeal_mk (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk z) = (PJA).lTensor M z := rfl
lemma tensorCokernelIdeal_tmul (M : Type*) [AddCommGroup M] [Module A M]
    (m : M) (z : Fin 2 → R₀) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) =
      m ⊗ₜ[A] idealPresentation A γ δ s t z := rfl
lemma tensorCokernelIdeal_inverse (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelIdeal A γ δ s t M).symm ((PJA).lTensor M z) = Submodule.Quotient.mk z :=
  by
    rw [←tensorCokernelIdeal_mk]
    exact (tensorCokernelIdeal A γ δ s t M).symm_apply_apply (Submodule.Quotient.mk z)
lemma tensorCokernelIdeal_unique (M : Type*) [AddCommGroup M] [Module A M]
    (e : ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΨA).lTensor M)) ≃ₗ[A] (M ⊗[A] J₀))
    (he : ∀ z, e (Submodule.Quotient.mk z) = (PJA).lTensor M z) :
    e = tensorCokernelIdeal A γ δ s t M := by
  ext z
  induction z using Submodule.Quotient.induction_on
  rename_i z
  exact (he z).trans (tensorCokernelIdeal_mk A γ δ s t M z).symm

def tensorCokernelDual (M : Type*) [AddCommGroup M] [Module A M] :
    ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΦA).lTensor M)) ≃ₗ[A] (M ⊗[A] D₀) :=
  _root_.lTensor.equiv (f := ΦA) (g := PDA) M
    (by exact (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t) :
      Function.Exact (Φ₀).mulVecLin (dualPresentation A γ δ s t))) (dualPresentation_surjective A γ δ s t)
lemma tensorCokernelDual_mk (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk z) = (PDA).lTensor M z := rfl
lemma tensorCokernelDual_tmul (M : Type*) [AddCommGroup M] [Module A M]
    (m : M) (z : Fin 2 → R₀) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) =
      m ⊗ₜ[A] dualPresentation A γ δ s t z := rfl
lemma tensorCokernelDual_inverse (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelDual A γ δ s t M).symm ((PDA).lTensor M z) = Submodule.Quotient.mk z :=
  by
    rw [←tensorCokernelDual_mk]
    exact (tensorCokernelDual A γ δ s t M).symm_apply_apply (Submodule.Quotient.mk z)
lemma tensorCokernelDual_unique (M : Type*) [AddCommGroup M] [Module A M]
    (e : ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΦA).lTensor M)) ≃ₗ[A] (M ⊗[A] D₀))
    (he : ∀ z, e (Submodule.Quotient.mk z) = (PDA).lTensor M z) :
    e = tensorCokernelDual A γ δ s t M := by
  ext z
  induction z using Submodule.Quotient.induction_on
  rename_i z
  exact (he z).trans (tensorCokernelDual_mk A γ δ s t M z).symm

-- NodeSectionFactorization.PolynomialModel.rotationFirstBasis
example  : sectionRotation A γ δ s t ![1,0] = ![0,1] := by simp [sectionRotation_apply]

-- NodeSectionFactorization.PolynomialModel.rotationNonreducedSquare
example (z : Fin 2 → Ring (ZMod 4) 1 0 1 0) :
    sectionRotation (ZMod 4) 1 0 1 0 (sectionRotation (ZMod 4) 1 0 1 0 z) = -z := sectionRotation_square _ _ _ _ _ z

-- NodeSectionFactorization.PolynomialModel.rotationZeroRing
example (z : Fin 2 → Ring (ZMod 1) 0 0 0 0) :
    (sectionRotation (ZMod 1) 0 0 0 0).symm (sectionRotation (ZMod 1) 0 0 0 0 z) = z := (sectionRotation _ _ _ _ _).symm_apply_apply z

-- NodeSectionFactorization.PolynomialModel.tensorIdealZero
example (M : Type*) [AddCommGroup M] [Module A M] :
    tensorCokernelIdeal A γ δ s t M 0 = 0 := map_zero _

-- NodeSectionFactorization.PolynomialModel.tensorIdealPureTensor
example (M : Type*) [AddCommGroup M] [Module A M] (m : M) (z : Fin 2 → R₀) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) = m ⊗ₜ[A] idealPresentation A γ δ s t z := tensorCokernelIdeal_tmul _ _ _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.tensorIdealRepresentativeRoundTrip
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelIdeal A γ δ s t M).symm ((idealPresentation A γ δ s t).restrictScalars A |>.lTensor M <| z) = Submodule.Quotient.mk z := tensorCokernelIdeal_inverse _ _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.tensorDualZero
example (M : Type*) [AddCommGroup M] [Module A M] :
    tensorCokernelDual A γ δ s t M 0 = 0 := map_zero _

-- NodeSectionFactorization.PolynomialModel.tensorDualPureTensor
example (M : Type*) [AddCommGroup M] [Module A M] (m : M) (z : Fin 2 → R₀) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) = m ⊗ₜ[A] dualPresentation A γ δ s t z := tensorCokernelDual_tmul _ _ _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.tensorDualRepresentativeRoundTrip
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelDual A γ δ s t M).symm ((dualPresentation A γ δ s t).restrictScalars A |>.lTensor M <| z) = Submodule.Quotient.mk z := tensorCokernelDual_inverse _ _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.tensorIdealTorsionNegativeGenerator
example  :
    tensorCokernelIdeal ℤ 1 0 1 0 (ZMod 2) (Submodule.Quotient.mk ((1 : ZMod 2) ⊗ₜ[ℤ] ![0,1])) =
      (1 : ZMod 2) ⊗ₜ[ℤ] (-⟨AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X - coefficientHom ℤ 1 0 1 0 0, sectionSecond_mem ℤ 1 0 1 0⟩) := by
  rw [tensorCokernelIdeal_tmul]
  congr 1
  apply Subtype.ext
  simp [idealPresentation_apply]

-- NodeSectionFactorization.PolynomialModel.tensorDualTorsionNegativeGenerator
example  :
    tensorCokernelDual ℤ 1 0 1 0 (ZMod 2) (Submodule.Quotient.mk ((1 : ZMod 2) ⊗ₜ[ℤ] ![0,1])) =
      (1 : ZMod 2) ⊗ₜ[ℤ] (-dualGenerator ℤ 1 0 1 0) := by
  rw [tensorCokernelDual_tmul]
  congr 1
  ext j
  simp [dualPresentation_apply]

-- NodeSectionFactorization.PolynomialModel.tensorTorsionLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2)) := quotientLeft_lTensor_exact ℤ 1 0 1 0 (ZMod 2)

-- NodeSectionFactorization.PolynomialModel.tensorTorsionRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2)) := quotientRight_lTensor_exact ℤ 1 0 1 0 (ZMod 2)

-- NodeSectionFactorization.PolynomialModel.tensorTorsionTransposeLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2)) := quotientTransposeLeft_lTensor_exact ℤ 1 0 1 0 (ZMod 2)

-- NodeSectionFactorization.PolynomialModel.tensorTorsionTransposeRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2)) := quotientTransposeRight_lTensor_exact ℤ 1 0 1 0 (ZMod 2)

-- NodeSectionFactorization.PolynomialModel.tensorZeroRingLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (right ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1))
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (left ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1)) := quotientLeft_lTensor_exact (ZMod 1) 0 0 0 0 (ZMod 1)

-- NodeSectionFactorization.PolynomialModel.tensorZeroRingRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (left ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1))
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (right ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1)) := quotientRight_lTensor_exact (ZMod 1) 0 0 0 0 (ZMod 1)

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.leftImage_lTensor_injective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.rightImage_lTensor_injective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientLeft_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientRight_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_symm_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_square
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_rotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_rotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_lTensor_rotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_lTensor_rotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeLeft_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeRight_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_mk
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_tmul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_unique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_mk
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_tmul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_unique

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
  ext j
  change d₀ * ε₀ j = b₀ * (1 * (j : R₀))
  simpa only [one_mul] using dualGenerator_spec A γ δ s t j

lemma sectionBidual_relation (F : Module.Dual R₀ D₀) :
    d₀ * F ε₀ = b₀ * F one₀ := by
  have h := congrArg F (dualGenerator_module_relation A γ δ s t)
  simpa only [map_smul, smul_eq_mul] using h

lemma sectionBidual_value_mem (F : Module.Dual R₀ D₀) : F one₀ ∈ J₀ := by
  obtain ⟨r,α,_,hy⟩ := sectionDualSyzygy A γ δ s t (F ε₀) (F one₀)
    (sectionBidual_relation A γ δ s t F)
  apply Ideal.mem_span_pair.mpr
  exact ⟨ι₀ α,r,by rw [hy]; ring⟩

def sectionBidualInverse : Module.Dual R₀ D₀ →ₗ[R₀] J₀ where
  toFun F := ⟨F one₀, sectionBidual_value_mem A γ δ s t F⟩
  map_add' _ _ := Subtype.ext rfl
  map_smul' _ _ := Subtype.ext rfl

lemma sectionBidualInverse_value (F : Module.Dual R₀ D₀) :
    (sectionBidualInverse A γ δ s t F : R₀) = F one₀ := rfl

lemma sectionBidualInverse_eval (j : J₀) :
    sectionBidualInverse A γ δ s t (Module.Dual.eval R₀ J₀ j) = j := by
  apply Subtype.ext
  change 1 * (j : R₀) = j
  exact one_mul _

lemma sectionBidual_eval_inverse (F : Module.Dual R₀ D₀) :
    Module.Dual.eval R₀ J₀ (sectionBidualInverse A γ δ s t F) = F := by
  let j := sectionBidualInverse A γ δ s t F
  have hone : F one₀ = (j : R₀) := rfl
  have heps : F ε₀ = ε₀ j := by
    apply sectionCoordinateRegular A γ δ s t
    change d₀ * F ε₀ = d₀ * ε₀ j
    rw [sectionBidual_relation, dualGenerator_spec, hone]
  ext h
  obtain ⟨z,rfl⟩ := dualPresentation_surjective A γ δ s t h
  have hmul : dualMultiplication A γ δ s t (z 0) = z 0 • one₀ := by
    ext y
    change z 0 * (y : R₀) = z 0 * (1 * (y : R₀))
    rw [one_mul]
  change dualPresentation A γ δ s t z j = F (dualPresentation A γ δ s t z)
  rw [dualPresentation_apply]
  change z 0 * (j : R₀) - z 1 * ε₀ j =
    F (dualMultiplication A γ δ s t (z 0) - z 1 • ε₀)
  rw [hmul,map_sub,map_smul,map_smul]
  change _ = z 0 * F one₀ - z 1 * F ε₀
  rw [hone,heps]

theorem sectionIdealReflexive : Module.IsReflexive R₀ J₀ := by
  constructor
  exact ⟨Function.LeftInverse.injective (sectionBidualInverse_eval A γ δ s t),
    Function.RightInverse.surjective (sectionBidual_eval_inverse A γ δ s t)⟩

def sectionBidualEquiv : J₀ ≃ₗ[R₀] Module.Dual R₀ D₀ := by
  let : Module.IsReflexive R₀ J₀ := sectionIdealReflexive A γ δ s t
  exact Module.evalEquiv R₀ J₀

lemma sectionBidualEquiv_apply (j : J₀) (h : D₀) :
    sectionBidualEquiv A γ δ s t j h = h j := rfl

lemma sectionBidualEquiv_inverse (F : Module.Dual R₀ D₀) :
    (sectionBidualEquiv A γ δ s t).symm F = sectionBidualInverse A γ δ s t F := by
  apply (sectionBidualEquiv A γ δ s t).injective
  rw [LinearEquiv.apply_symm_apply]
  exact (sectionBidual_eval_inverse A γ δ s t F).symm

lemma sectionBidualEquiv_native :
    (sectionBidualEquiv A γ δ s t).toLinearMap = Module.Dual.eval R₀ J₀ := rfl

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_zero
example : sectionBidualInverse A γ δ s t 0 = 0 := map_zero _

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_first
example : sectionBidualInverse A γ δ s t
    (Module.Dual.eval R₀ J₀ ⟨c₀,sectionFirst_mem A γ δ s t⟩) =
      ⟨c₀,sectionFirst_mem A γ δ s t⟩ := sectionBidualInverse_eval _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_second
example : sectionBidualInverse A γ δ s t
    (Module.Dual.eval R₀ J₀ ⟨d₀,sectionSecond_mem A γ δ s t⟩) =
      ⟨d₀,sectionSecond_mem A γ δ s t⟩ := sectionBidualInverse_eval _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_epsilon_first
example : sectionBidualEquiv A γ δ s t ⟨c₀,sectionFirst_mem A γ δ s t⟩ ε₀ = -a₀ :=
  (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).1

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_epsilon_second
example : sectionBidualEquiv A γ δ s t ⟨d₀,sectionSecond_mem A γ δ s t⟩ ε₀ = b₀ :=
  (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_negative_generator
example : sectionBidualEquiv A γ δ s t (-⟨d₀,sectionSecond_mem A γ δ s t⟩) ε₀ = -b₀ := by
  rw [sectionBidualEquiv_apply, map_neg,
    (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2]

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_nonreduced
example : Module.IsReflexive (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0) :=
  sectionIdealReflexive _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_zeroRing
example : Module.IsReflexive (Ring (ZMod 1) 0 0 0 0) (sectionIdeal (ZMod 1) 0 0 0 0) :=
  sectionIdealReflexive _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_roundtrip
example (F : Module.Dual R₀ D₀) :
    sectionBidualEquiv A γ δ s t (sectionBidualInverse A γ δ s t F) = F :=
  sectionBidual_eval_inverse _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_dual
example : Module.IsReflexive R₀ D₀ := by
  let : Module.IsReflexive R₀ J₀ := sectionIdealReflexive A γ δ s t
  infer_instance

#print axioms dualGenerator_module_relation
#print axioms sectionBidual_relation
#print axioms sectionBidual_value_mem
#print axioms sectionBidualInverse
#print axioms sectionBidualInverse_value
#print axioms sectionBidualInverse_eval
#print axioms sectionBidual_eval_inverse
#print axioms sectionIdealReflexive
#print axioms sectionBidualEquiv
#print axioms sectionBidualEquiv_apply
#print axioms sectionBidualEquiv_inverse
#print axioms sectionBidualEquiv_native
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

def sectionDualTensorHom : D₀ ⊗[A] M →ₗ[R₀] (J₀ →ₗ[R₀] N₀) :=
  AlgebraTensorModule.lift
    { toFun := fun h =>
        { toFun := fun m =>
            { toFun := fun j => h j ⊗ₜ[A] m
              map_add' := by intros; simp [TensorProduct.add_tmul]
              map_smul' := by intros; simp [TensorProduct.smul_tmul'] }
          map_add' := by
            intro m n
            apply LinearMap.ext
            intro j
            exact TensorProduct.tmul_add _ _ _
          map_smul' := by
            intro a m
            apply LinearMap.ext
            intro j
            exact TensorProduct.tmul_smul _ _ _ }
      map_add' := by
        intro h k
        apply LinearMap.ext
        intro m
        apply LinearMap.ext
        intro j
        exact TensorProduct.add_tmul _ _ _
      map_smul' := by
        intro r h
        apply LinearMap.ext
        intro m
        apply LinearMap.ext
        intro j
        exact (TensorProduct.smul_tmul' r (h j) m).symm }

lemma sectionDualTensorHom_tmul (h : D₀) (m : M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m := rfl

def sectionFreeTensorHom :
    (Fin 2 → R₀) ⊗[A] M ≃ₗ[A] ((Fin 2 → R₀) →ₗ[R₀] N₀) :=
  (TensorProduct.piLeft A M (fun _ : Fin 2 => R₀)).trans
    (LinearEquiv.restrictScalars A (LinearEquiv.symm
      (LinearEquiv.piRing R₀ N₀ (Fin 2) R₀)))

lemma sectionFreeTensorHom_tmul (z w : Fin 2 → R₀) (m : M) :
    sectionFreeTensorHom A γ δ s t M (z ⊗ₜ[A] m) w =
      (w 0 * z 0 + w 1 * z 1) ⊗ₜ[A] m := by
  simp [sectionFreeTensorHom, TensorProduct.piLeft, LinearEquiv.piRing_symm_apply,
    Fin.sum_univ_two, TensorProduct.smul_tmul', ← TensorProduct.add_tmul]

lemma sectionFreeTensorHom_matrix (W : Matrix (Fin 2) (Fin 2) R₀)
    (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionFreeTensorHom A γ δ s t M
      (((W.transpose.mulVecLin).restrictScalars A).rTensor M z) =
    (sectionFreeTensorHom A γ δ s t M z).comp W.mulVecLin := by
  induction z using TensorProduct.induction_on with
  | zero => simp
  | add z w hz hw =>
    simp only [map_add, hz, hw]
    rfl
  | tmul z m =>
    ext w
    simp only [LinearMap.rTensor_tmul, LinearMap.restrictScalars_apply,
      sectionFreeTensorHom_tmul, LinearMap.comp_apply]
    congr 1
    simp [Matrix.mulVec, Matrix.vecMul, dotProduct, Fin.sum_univ_two]
    ring

def sectionIdealHomCoordinates : (J₀ →ₗ[R₀] N₀) →ₗ[A] (Fin 2 → R₀) ⊗[A] M :=
  (sectionFreeTensorHom A γ δ s t M).symm.toLinearMap.comp
    ((LinearMap.lcomp R₀ N₀ (idealPresentation A γ δ s t)).restrictScalars A)

lemma sectionIdealHomCoordinates_injective :
    Function.Injective (sectionIdealHomCoordinates A γ δ s t M) := by
  intro h k hhk
  have he : h.comp (idealPresentation A γ δ s t) =
      k.comp (idealPresentation A γ δ s t) :=
    (sectionFreeTensorHom A γ δ s t M).symm.injective hhk
  ext j
  obtain ⟨z,rfl⟩ := idealPresentation_surjective A γ δ s t j
  exact LinearMap.congr_fun he z

lemma sectionIdealHomCoordinates_relation (h : J₀ →ₗ[R₀] N₀) :
    ((ΨTA).rTensor M) (sectionIdealHomCoordinates A γ δ s t M h) = 0 := by
  apply (sectionFreeTensorHom A γ δ s t M).injective
  rw [sectionFreeTensorHom_matrix]
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M h) =
      h.comp (idealPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _, map_zero]
  change ((h.comp (idealPresentation A γ δ s t)).comp (Ψ₀).mulVecLin) = 0
  apply LinearMap.ext
  intro z
  change h (idealPresentation A γ δ s t ((Ψ₀).mulVecLin z)) = 0
  have hz : idealPresentation A γ δ s t ((Ψ₀).mulVecLin z) = 0 :=
    (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t)).apply_apply_eq_zero z
  rw [hz, map_zero]

lemma sectionIdealPresentation_generators (z : Fin 2 → R₀) :
    idealPresentation A γ δ s t z =
    z 0 • (⟨c₀,sectionFirst_mem A γ δ s t⟩ : J₀) -
      z 1 • (⟨d₀,sectionSecond_mem A γ δ s t⟩ : J₀) := by
  apply Subtype.ext
  change c₀*z 0-d₀*z 1 = z 0*c₀-z 1*d₀
  ring

lemma sectionIdealHomCoordinates_presentation (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionIdealHomCoordinates A γ δ s t M
      (sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z)) =
    -((pA).rTensor M) ((ΨA).rTensor M z) := by
  apply (sectionFreeTensorHom A γ δ s t M).injective
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M
        (sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z))) =
      (sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z)).comp
        (idealPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _]
  induction z using TensorProduct.induction_on with
  | zero => simp
  | add z w hz hw =>
    simp only [map_add,LinearMap.add_comp,hz,hw,map_neg,neg_add]
  | tmul z m =>
    simp only [LinearMap.rTensor_tmul,LinearMap.restrictScalars_apply,
      LinearEquiv.rTensor_tmul,LinearEquiv.restrictScalars_apply,
      ← TensorProduct.neg_tmul]
    apply LinearMap.ext
    intro w
    change dualPresentation A γ δ s t z (idealPresentation A γ δ s t w) ⊗ₜ[A] m =
      sectionFreeTensorHom A γ δ s t M
        ((-sectionRotation A γ δ s t ((Ψ₀).mulVecLin z)) ⊗ₜ[A] m) w
    rw [sectionFreeTensorHom_tmul]
    congr 1
    rw [sectionIdealPresentation_generators,map_sub,map_smul,map_smul,
      dualPresentation_apply,dualPresentation_apply,
      (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).1,
      (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2]
    simp only [smul_eq_mul,sectionRotation_apply,right_mulVec,
      Matrix.cons_val_zero,Matrix.cons_val_one,Pi.neg_apply]
    ring

lemma transposeLeft_rTensor_rotation :
    ((ΦTA).rTensor M).comp ((pA).rTensor M).toLinearMap =
      ((pA).rTensor M).toLinearMap.comp ((ΨA).rTensor M) := by
  have h : (ΦTA).comp (pA).toLinearMap = (pA).toLinearMap.comp ΨA := by
    apply LinearMap.ext
    intro z
    exact LinearMap.congr_fun (transposeLeft_rotation A γ δ s t) z
  simpa only [LinearMap.rTensor_comp,LinearEquiv.coe_rTensor] using
    congrArg (LinearMap.rTensor M) h

lemma sectionDualTensorHom_injective :
    Function.Injective (sectionDualTensorHom A γ δ s t M) := by
  intro x y hxy
  apply sub_eq_zero.mp
  obtain ⟨z,hz⟩ := LinearMap.rTensor_surjective M
    (show Function.Surjective PDA from dualPresentation_surjective A γ δ s t) (x-y)
  have hzero : sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z) = 0 := by
    rw [hz,map_sub,hxy,sub_self]
  have hψ : ((ΨA).rTensor M) z = 0 := by
    have hc := sectionIdealHomCoordinates_presentation A γ δ s t M z
    rw [hzero,map_zero] at hc
    have hp : ((pA).rTensor M) (((ΨA).rTensor M) z) = 0 := by
      exact neg_eq_zero.mp hc.symm
    exact ((pA).rTensor M).injective (hp.trans (map_zero _).symm)
  have he : Function.Exact ((ΦA).rTensor M) ((ΨA).rTensor M) :=
    (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (quotientRight_lTensor_exact A γ δ s t M)
  obtain ⟨w,hw⟩ := (he z).mp hψ
  have hpd : ((PDA).rTensor M) z = 0 := by
    rw [←hw]
    exact ((LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (dualPresentation_lTensor_exact A γ δ s t M)).apply_apply_eq_zero w
  exact hz.symm.trans hpd

lemma sectionDualTensorHom_surjective :
    Function.Surjective (sectionDualTensorHom A γ δ s t M) := by
  intro h
  have he : Function.Exact ((ΦTA).rTensor M) ((ΨTA).rTensor M) :=
    (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (quotientTransposeRight_lTensor_exact A γ δ s t M)
  obtain ⟨w,hw⟩ := (he _).mp (sectionIdealHomCoordinates_relation A γ δ s t M h)
  refine ⟨((PDA).rTensor M) (-((pA).rTensor M).symm w),?_⟩
  apply sectionIdealHomCoordinates_injective A γ δ s t M
  rw [sectionIdealHomCoordinates_presentation,map_neg,map_neg,neg_neg,←hw]
  have hr := LinearMap.congr_fun (transposeLeft_rTensor_rotation A γ δ s t M)
    (((pA).rTensor M).symm w)
  simpa only [LinearMap.comp_apply,LinearEquiv.coe_coe,
    LinearEquiv.apply_symm_apply] using hr.symm

def sectionDualTensorHomEquiv : D₀ ⊗[A] M ≃ₗ[R₀] (J₀ →ₗ[R₀] N₀) :=
  LinearEquiv.ofBijective (sectionDualTensorHom A γ δ s t M)
    ⟨sectionDualTensorHom_injective A γ δ s t M,
      sectionDualTensorHom_surjective A γ δ s t M⟩

lemma sectionDualTensorHomEquiv_tmul (h : D₀) (m : M) (j : J₀) :
    sectionDualTensorHomEquiv A γ δ s t M (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m := rfl

lemma sectionDualTensorHom_natural {M' : Type*} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : D₀ →ₗ[R₀] D₀) f x) j =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionDualTensorHom A γ δ s t M x j) := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | add x y hx hy => simp_all
  | tmul h m => rfl

def sectionIdealTensorHom : J₀ ⊗[A] M →ₗ[R₀] (D₀ →ₗ[R₀] N₀) :=
  AlgebraTensorModule.lift
    { toFun := fun j =>
        { toFun := fun m =>
            { toFun := fun h => h j ⊗ₜ[A] m
              map_add' := by intros; simp [TensorProduct.add_tmul]
              map_smul' := by intros; simp [TensorProduct.smul_tmul'] }
          map_add' := by
            intro m n
            apply LinearMap.ext
            intro h
            exact TensorProduct.tmul_add _ _ _
          map_smul' := by
            intro a m
            apply LinearMap.ext
            intro h
            exact TensorProduct.tmul_smul _ _ _ }
      map_add' := by
        intro j k
        apply LinearMap.ext
        intro m
        apply LinearMap.ext
        intro h
        change h (j+k) ⊗ₜ[A] m = h j ⊗ₜ[A] m + h k ⊗ₜ[A] m
        rw [map_add,TensorProduct.add_tmul]
      map_smul' := by
        intro r j
        apply LinearMap.ext
        intro m
        apply LinearMap.ext
        intro h
        change h (r • j) ⊗ₜ[A] m = r • (h j ⊗ₜ[A] m)
        rw [map_smul,TensorProduct.smul_tmul'] }

lemma sectionIdealTensorHom_tmul (j : J₀) (m : M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m := rfl

def sectionDualHomCoordinates : (D₀ →ₗ[R₀] N₀) →ₗ[A] (Fin 2 → R₀) ⊗[A] M :=
  (sectionFreeTensorHom A γ δ s t M).symm.toLinearMap.comp
    ((LinearMap.lcomp R₀ N₀ (dualPresentation A γ δ s t)).restrictScalars A)

lemma sectionDualHomCoordinates_injective :
    Function.Injective (sectionDualHomCoordinates A γ δ s t M) := by
  intro h k hhk
  have he : h.comp (dualPresentation A γ δ s t) =
      k.comp (dualPresentation A γ δ s t) :=
    (sectionFreeTensorHom A γ δ s t M).symm.injective hhk
  ext j
  obtain ⟨z,rfl⟩ := dualPresentation_surjective A γ δ s t j
  exact LinearMap.congr_fun he z

lemma sectionDualHomCoordinates_relation (h : D₀ →ₗ[R₀] N₀) :
    ((ΦTA).rTensor M) (sectionDualHomCoordinates A γ δ s t M h) = 0 := by
  apply (sectionFreeTensorHom A γ δ s t M).injective
  rw [sectionFreeTensorHom_matrix]
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M h) =
      h.comp (dualPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _, map_zero]
  apply LinearMap.ext
  intro z
  change h (dualPresentation A γ δ s t ((Φ₀).mulVecLin z)) = 0
  have hz : dualPresentation A γ δ s t ((Φ₀).mulVecLin z) = 0 :=
    (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t)).apply_apply_eq_zero z
  rw [hz,map_zero]

lemma sectionDualHomCoordinates_presentation (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionDualHomCoordinates A γ δ s t M
      (sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z)) =
    ((pA).rTensor M) ((ΦA).rTensor M z) := by
  apply (sectionFreeTensorHom A γ δ s t M).injective
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M
        (sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z))) =
      (sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z)).comp
        (dualPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _]
  induction z using TensorProduct.induction_on with
  | zero => simp
  | add z w hz hw =>
    simp only [map_add,LinearMap.add_comp,hz,hw]
  | tmul z m =>
    simp only [LinearMap.rTensor_tmul,LinearMap.restrictScalars_apply,
      LinearEquiv.rTensor_tmul,LinearEquiv.restrictScalars_apply]
    apply LinearMap.ext
    intro w
    change dualPresentation A γ δ s t w (idealPresentation A γ δ s t z) ⊗ₜ[A] m =
      sectionFreeTensorHom A γ δ s t M
        (sectionRotation A γ δ s t ((Φ₀).mulVecLin z) ⊗ₜ[A] m) w
    rw [sectionFreeTensorHom_tmul]
    congr 1
    rw [sectionIdealPresentation_generators,map_sub,map_smul,map_smul,
      dualPresentation_apply,dualPresentation_apply,
      (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).1,
      (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2]
    simp only [smul_eq_mul,sectionRotation_apply,left_mulVec,
      Matrix.cons_val_zero,Matrix.cons_val_one]
    ring

lemma transposeRight_rTensor_rotation :
    ((ΨTA).rTensor M).comp ((pA).rTensor M).toLinearMap =
      ((pA).rTensor M).toLinearMap.comp ((ΦA).rTensor M) := by
  have h : (ΨTA).comp (pA).toLinearMap = (pA).toLinearMap.comp ΦA := by
    apply LinearMap.ext
    intro z
    exact LinearMap.congr_fun (transposeRight_rotation A γ δ s t) z
  simpa only [LinearMap.rTensor_comp,LinearEquiv.coe_rTensor] using
    congrArg (LinearMap.rTensor M) h

lemma sectionIdealTensorHom_injective :
    Function.Injective (sectionIdealTensorHom A γ δ s t M) := by
  intro x y hxy
  apply sub_eq_zero.mp
  obtain ⟨z,hz⟩ := LinearMap.rTensor_surjective M
    (show Function.Surjective PJA from idealPresentation_surjective A γ δ s t) (x-y)
  have hzero : sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z) = 0 := by
    rw [hz,map_sub,hxy,sub_self]
  have hφ : ((ΦA).rTensor M) z = 0 := by
    have hc := sectionDualHomCoordinates_presentation A γ δ s t M z
    rw [hzero,map_zero] at hc
    exact ((pA).rTensor M).injective (hc.symm.trans (map_zero _).symm)
  have he : Function.Exact ((ΨA).rTensor M) ((ΦA).rTensor M) :=
    (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (quotientLeft_lTensor_exact A γ δ s t M)
  obtain ⟨w,hw⟩ := (he z).mp hφ
  have hpj : ((PJA).rTensor M) z = 0 := by
    rw [←hw]
    exact ((LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (idealPresentation_lTensor_exact A γ δ s t M)).apply_apply_eq_zero w
  exact hz.symm.trans hpj

lemma sectionIdealTensorHom_surjective :
    Function.Surjective (sectionIdealTensorHom A γ δ s t M) := by
  intro h
  have he : Function.Exact ((ΨTA).rTensor M) ((ΦTA).rTensor M) :=
    (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (quotientTransposeLeft_lTensor_exact A γ δ s t M)
  obtain ⟨w,hw⟩ := (he _).mp (sectionDualHomCoordinates_relation A γ δ s t M h)
  refine ⟨((PJA).rTensor M) (((pA).rTensor M).symm w),?_⟩
  apply sectionDualHomCoordinates_injective A γ δ s t M
  rw [sectionDualHomCoordinates_presentation,←hw]
  have hr := LinearMap.congr_fun (transposeRight_rTensor_rotation A γ δ s t M)
    (((pA).rTensor M).symm w)
  simpa only [LinearMap.comp_apply,LinearEquiv.coe_coe,
    LinearEquiv.apply_symm_apply] using hr.symm

def sectionIdealTensorHomEquiv : J₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀) :=
  LinearEquiv.ofBijective (sectionIdealTensorHom A γ δ s t M)
    ⟨sectionIdealTensorHom_injective A γ δ s t M,
      sectionIdealTensorHom_surjective A γ δ s t M⟩

lemma sectionIdealTensorHomEquiv_tmul (j : J₀) (m : M) (h : D₀) :
    sectionIdealTensorHomEquiv A γ δ s t M (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m := rfl

lemma sectionIdealTensorHom_natural {M' : Type*} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : J₀ →ₗ[R₀] J₀) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionIdealTensorHom A γ δ s t M x h) := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | add x y hx hy => simp_all
  | tmul j m => rfl

lemma sectionDualTensorHomEquiv_inverse (h : D₀) (m : M) :
    (sectionDualTensorHomEquiv A γ δ s t M).symm
      (sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m)) = h ⊗ₜ[A] m :=
  (sectionDualTensorHomEquiv A γ δ s t M).symm_apply_apply _

lemma sectionIdealTensorHomEquiv_inverse (j : J₀) (m : M) :
    (sectionIdealTensorHomEquiv A γ δ s t M).symm
      (sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m)) = j ⊗ₜ[A] m :=
  (sectionIdealTensorHomEquiv A γ δ s t M).symm_apply_apply _

lemma sectionDualTensorHomEquiv_unique
    (e : D₀ ⊗[A] M ≃ₗ[R₀] (J₀ →ₗ[R₀] N₀))
    (he : ∀ (h : D₀) (m : M) (j : J₀), e (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m) :
    e = sectionDualTensorHomEquiv A γ δ s t M := by
  apply LinearEquiv.toLinearMap_injective
  apply TensorProduct.AlgebraTensorModule.ext
  intro h m
  apply LinearMap.ext
  intro j
  exact he h m j

lemma sectionIdealTensorHomEquiv_unique
    (e : J₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀))
    (he : ∀ (j : J₀) (m : M) (h : D₀), e (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m) :
    e = sectionIdealTensorHomEquiv A γ δ s t M := by
  apply LinearEquiv.toLinearMap_injective
  apply TensorProduct.AlgebraTensorModule.ext
  intro j m
  apply LinearMap.ext
  intro h
  exact he j m h

lemma sectionDualTensorHom_unit (x : D₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionDualTensorHom A γ δ s t A x) =
    (AlgebraTensorModule.rid A R₀ D₀) x := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | add x y hx hy =>
    simp only [map_add,LinearMap.comp_add,hx,hy]
  | tmul h a =>
    apply LinearMap.ext
    intro j
    simp only [LinearMap.comp_apply,sectionDualTensorHom_tmul,
      LinearEquiv.coe_coe,AlgebraTensorModule.rid_tmul,LinearMap.smul_apply]

lemma sectionIdealTensorHom_unit (x : J₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionIdealTensorHom A γ δ s t A x) =
    Module.Dual.eval R₀ J₀ ((AlgebraTensorModule.rid A R₀ J₀) x) := by
  induction x using TensorProduct.induction_on with
  | zero =>
    rw [(sectionIdealTensorHom A γ δ s t A).map_zero,
      (AlgebraTensorModule.rid A R₀ J₀).map_zero,
      (Module.Dual.eval R₀ J₀).map_zero,LinearMap.comp_zero]
  | add x y hx hy =>
    simp only [map_add,LinearMap.comp_add,hx,hy]
  | tmul j a =>
    apply LinearMap.ext
    intro h
    simp only [LinearMap.comp_apply,sectionIdealTensorHom_tmul,
      LinearEquiv.coe_coe,AlgebraTensorModule.rid_tmul,Module.Dual.eval_apply]
    exact ((h.restrictScalars A).map_smul a j).symm

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_zero
example : sectionDualTensorHom A γ δ s t M 0 = 0 := map_zero _

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_inclusion
example (j : J₀) (m : M) :
    sectionDualTensorHom A γ δ s t M (dualMultiplication A γ δ s t 1 ⊗ₜ[A] m) j =
    (j : R₀) ⊗ₜ[A] m := by
  rw [sectionDualTensorHom_tmul,dualMultiplicationApply,one_mul]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_negative_epsilon
example (m : M) :
    sectionDualTensorHom A γ δ s t M ((-dualGenerator A γ δ s t : D₀) ⊗ₜ[A] m)
      ⟨c₀,sectionFirst_mem A γ δ s t⟩ =
    (ι₀ δ * v₀ + ι₀ δ * ι₀ t + ι₀ γ * u₀) ⊗ₜ[A] m := by
  rw [sectionDualTensorHom_tmul,LinearMap.neg_apply,
    (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).1,neg_neg]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_zero
example : sectionIdealTensorHom A γ δ s t M 0 = 0 := map_zero _

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_inclusion
example (j : J₀) (m : M) :
    sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m) (dualMultiplication A γ δ s t 1) =
    (j : R₀) ⊗ₜ[A] m := by
  rw [sectionIdealTensorHom_tmul,dualMultiplicationApply,one_mul]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_negative_second
example (m : M) :
    sectionIdealTensorHom A γ δ s t M
      ((-⟨d₀,sectionSecond_mem A γ δ s t⟩ : J₀) ⊗ₜ[A] m)
      (dualGenerator A γ δ s t) =
    (-(u₀ + ι₀ s + ι₀ γ * ι₀ t)) ⊗ₜ[A] m := by
  rw [sectionIdealTensorHom_tmul,map_neg,
    (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_zero
example : sectionIdealHomCoordinates A γ δ s t M 0 = 0 := map_zero _

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_negative_second
example (h : J₀ →ₗ[R₀] N₀) :
    sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M h) (Pi.single (1 : Fin 2) (1 : R₀)) =
    -h ⟨d₀,sectionSecond_mem A γ δ s t⟩ := by
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M h) =
      h.comp (idealPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _]
  have hj : idealPresentation A γ δ s t (Pi.single (1 : Fin 2) (1 : R₀)) =
      -⟨d₀,sectionSecond_mem A γ δ s t⟩ := by
    apply Subtype.ext
    simp [idealPresentation_apply]
  change h (idealPresentation A γ δ s t (Pi.single (1 : Fin 2) (1 : R₀))) = _
  rw [hj,map_neg]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_faithful
example (h k : J₀ →ₗ[R₀] N₀)
    (hk : sectionIdealHomCoordinates A γ δ s t M h =
      sectionIdealHomCoordinates A γ δ s t M k) : h = k :=
  sectionIdealHomCoordinates_injective A γ δ s t M hk

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_zero
example : sectionDualHomCoordinates A γ δ s t M 0 = 0 := map_zero _

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_negative_epsilon
example (h : D₀ →ₗ[R₀] N₀) :
    sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M h) (Pi.single (1 : Fin 2) (1 : R₀)) =
    -h (dualGenerator A γ δ s t) := by
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M h) =
      h.comp (dualPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _]
  have hd : dualPresentation A γ δ s t (Pi.single (1 : Fin 2) (1 : R₀)) =
      -dualGenerator A γ δ s t := by
    ext j
    simp [dualPresentation_apply]
  change h (dualPresentation A γ δ s t (Pi.single (1 : Fin 2) (1 : R₀))) = _
  rw [hd,map_neg]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_faithful
example (h k : D₀ →ₗ[R₀] N₀)
    (hk : sectionDualHomCoordinates A γ δ s t M h =
      sectionDualHomCoordinates A γ δ s t M k) : h = k :=
  sectionDualHomCoordinates_injective A γ δ s t M hk

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_inverse
example (h : D₀) (m : M) :
    (sectionDualTensorHomEquiv A γ δ s t M).symm
      (sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m)) = h ⊗ₜ[A] m :=
  sectionDualTensorHomEquiv_inverse A γ δ s t M h m

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_ring_action
example (r : R₀) (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHomEquiv A γ δ s t M (r • x) j =
    r • sectionDualTensorHomEquiv A γ δ s t M x j := by
  rw [map_smul,LinearMap.smul_apply]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_torsion
example : Function.Bijective (sectionDualTensorHom ℤ 0 0 0 0 (ZMod 3)) :=
  ⟨sectionDualTensorHom_injective ℤ 0 0 0 0 (ZMod 3),
   sectionDualTensorHom_surjective ℤ 0 0 0 0 (ZMod 3)⟩

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_inverse
example (j : J₀) (m : M) :
    (sectionIdealTensorHomEquiv A γ δ s t M).symm
      (sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m)) = j ⊗ₜ[A] m :=
  sectionIdealTensorHomEquiv_inverse A γ δ s t M j m

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_ring_action
example (r : R₀) (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHomEquiv A γ δ s t M (r • x) h =
    r • sectionIdealTensorHomEquiv A γ δ s t M x h := by
  rw [map_smul,LinearMap.smul_apply]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_torsion
example : Function.Bijective (sectionIdealTensorHom ℤ 0 0 0 0 (ZMod 3)) :=
  ⟨sectionIdealTensorHom_injective ℤ 0 0 0 0 (ZMod 3),
   sectionIdealTensorHom_surjective ℤ 0 0 0 0 (ZMod 3)⟩

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_naturality
example {M' : Type*} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : D₀ →ₗ[R₀] D₀) f x) j =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionDualTensorHom A γ δ s t M x j) :=
  sectionDualTensorHom_natural A γ δ s t M f x j

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_naturality
example {M' : Type*} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : J₀ →ₗ[R₀] J₀) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionIdealTensorHom A γ δ s t M x h) :=
  sectionIdealTensorHom_natural A γ δ s t M f x h

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_unit
example (x : D₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionDualTensorHom A γ δ s t A x) =
    (AlgebraTensorModule.rid A R₀ D₀) x :=
  sectionDualTensorHom_unit A γ δ s t x

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_bidual
example (x : J₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionIdealTensorHom A γ δ s t A x) =
    Module.Dual.eval R₀ J₀ ((AlgebraTensorModule.rid A R₀ J₀) x) :=
  sectionIdealTensorHom_unit A γ δ s t x

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_nonreduced
example : Function.Bijective (sectionDualTensorHom (ZMod 4) 0 0 0 0 (ZMod 4)) :=
  ⟨sectionDualTensorHom_injective (ZMod 4) 0 0 0 0 (ZMod 4),
   sectionDualTensorHom_surjective (ZMod 4) 0 0 0 0 (ZMod 4)⟩

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_zero_ring
example : Function.Bijective (sectionIdealTensorHom (ZMod 1) 0 0 0 0 (ZMod 1)) :=
  ⟨sectionIdealTensorHom_injective (ZMod 1) 0 0 0 0 (ZMod 1),
   sectionIdealTensorHom_surjective (ZMod 1) 0 0 0 0 (ZMod 1)⟩
#print axioms sectionDualTensorHom
#print axioms sectionDualTensorHom_tmul
#print axioms sectionFreeTensorHom
#print axioms sectionFreeTensorHom_tmul
#print axioms sectionFreeTensorHom_matrix
#print axioms sectionIdealHomCoordinates
#print axioms sectionIdealHomCoordinates_injective
#print axioms sectionIdealHomCoordinates_relation
#print axioms sectionIdealPresentation_generators
#print axioms sectionIdealHomCoordinates_presentation
#print axioms transposeLeft_rTensor_rotation
#print axioms sectionDualTensorHom_injective
#print axioms sectionDualTensorHom_surjective
#print axioms sectionDualTensorHomEquiv
#print axioms sectionDualTensorHomEquiv_tmul
#print axioms sectionDualTensorHom_natural
#print axioms sectionIdealTensorHom
#print axioms sectionIdealTensorHom_tmul
#print axioms sectionDualHomCoordinates
#print axioms sectionDualHomCoordinates_injective
#print axioms sectionDualHomCoordinates_relation
#print axioms sectionDualHomCoordinates_presentation
#print axioms transposeRight_rTensor_rotation
#print axioms sectionIdealTensorHom_injective
#print axioms sectionIdealTensorHom_surjective
#print axioms sectionIdealTensorHomEquiv
#print axioms sectionIdealTensorHomEquiv_tmul
#print axioms sectionIdealTensorHom_natural
#print axioms sectionDualTensorHomEquiv_inverse
#print axioms sectionIdealTensorHomEquiv_inverse
#print axioms sectionDualTensorHomEquiv_unique
#print axioms sectionIdealTensorHomEquiv_unique
#print axioms sectionDualTensorHom_unit
#print axioms sectionIdealTensorHom_unit

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

def sectionHomDifferential (dual : Bool) (n : ℕ) : H₀ →ₗ[R₀] H₀ :=
  LinearMap.lcomp R₀ N₀ (if (n % 2 = 0) = (dual = true) then (Φ₀).mulVecLin else (Ψ₀).mulVecLin)

lemma sectionHomLeftRight_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin)
      (LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin) := by
  have h := (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
    (quotientTransposeRight_lTensor_exact A γ δ s t M)
  change Function.Exact
    ((LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin).restrictScalars A)
    ((LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin).restrictScalars A)
  apply Function.Exact.of_ladder_linearEquiv_of_exact (H := h)
    (e₁ := sectionFreeTensorHom A γ δ s t M)
    (e₂ := sectionFreeTensorHom A γ δ s t M)
    (e₃ := sectionFreeTensorHom A γ δ s t M)
  · apply LinearMap.ext
    intro z
    exact (sectionFreeTensorHom_matrix A γ δ s t M Φ₀ z).symm
  · apply LinearMap.ext
    intro z
    exact (sectionFreeTensorHom_matrix A γ δ s t M Ψ₀ z).symm

lemma sectionHomRightLeft_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin)
      (LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin) := by
  have h := (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
    (quotientTransposeLeft_lTensor_exact A γ δ s t M)
  change Function.Exact
    ((LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin).restrictScalars A)
    ((LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin).restrictScalars A)
  apply Function.Exact.of_ladder_linearEquiv_of_exact (H := h)
    (e₁ := sectionFreeTensorHom A γ δ s t M)
    (e₂ := sectionFreeTensorHom A γ δ s t M)
    (e₃ := sectionFreeTensorHom A γ δ s t M)
  · apply LinearMap.ext
    intro z
    exact (sectionFreeTensorHom_matrix A γ δ s t M Ψ₀ z).symm
  · apply LinearMap.ext
    intro z
    exact (sectionFreeTensorHom_matrix A γ δ s t M Φ₀ z).symm

lemma sectionHomDifferential_exact (dual : Bool) (n : ℕ) :
    Function.Exact (sectionHomDifferential A γ δ s t M dual n)
      (sectionHomDifferential A γ δ s t M dual (n+1)) := by
  have hn : n % 2 = 0 ∨ n % 2 = 1 := by omega
  cases dual <;> rcases hn with hn | hn <;>
    simp [sectionHomDifferential, hn, show (n+1)%2 = 1-n%2 by omega,
      sectionHomLeftRight_exact, sectionHomRightLeft_exact]

lemma sectionHomDifferential_sq (dual : Bool) (n : ℕ) :
    (sectionHomDifferential A γ δ s t M dual (n+1)).comp
      (sectionHomDifferential A γ δ s t M dual n) = 0 := by
  exact (sectionHomDifferential_exact A γ δ s t M dual n).linearMap_comp_eq_zero

def sectionHomCochain (coeff : Type v_cochain) [AddCommGroup coeff] [Module A coeff] (dual : Bool) : CochainComplex (ModuleCat.{max u_cochain v_cochain} R₀) ℕ :=
  CochainComplex.of (fun _ => ModuleCat.of R₀ ((Fin 2 → R₀) →ₗ[R₀] R₀ ⊗[A] coeff))
    (fun n => ModuleCat.ofHom (R := R₀) (sectionHomDifferential A γ δ s t coeff dual n))
    (fun n => ModuleCat.hom_ext (sectionHomDifferential_sq A γ δ s t coeff dual n))

lemma sectionHomCochain_d (dual : Bool) (n : ℕ) :
    HEq ((sectionHomCochain A γ δ s t M dual).d n (n+1))
      (ModuleCat.ofHom (R := R₀) (X := H₀) (Y := H₀) (sectionHomDifferential A γ δ s t M dual n)) := by
  exact heq_of_eq (CochainComplex.of_d (fun _ : ℕ => ModuleCat.of R₀ H₀)
    (fun k => ModuleCat.ofHom (R := R₀) (sectionHomDifferential A γ δ s t M dual k)) n)

lemma sectionHomCochain_exactAt (dual : Bool) (n : ℕ) :
    (sectionHomCochain A γ δ s t M dual).ExactAt (n+1) := by
  rw [HomologicalComplex.exactAt_iff' _ n (n+1) (n+2) (by simp) (by simp)]
  rw [CategoryTheory.ShortComplex.moduleCat_exact_iff]
  intro h hh
  have hd := eq_of_heq (sectionHomCochain_d A γ δ s t M dual (n+1))
  have hd₀ := eq_of_heq (sectionHomCochain_d A γ δ s t M dual n)
  change (sectionHomCochain A γ δ s t M dual).d (n+1) (n+2) h = 0 at hh
  rw [hd] at hh
  obtain ⟨h₀,h₀eq⟩ := (sectionHomDifferential_exact A γ δ s t M dual n h).mp hh
  refine ⟨h₀,?_⟩
  change (sectionHomCochain A γ δ s t M dual).d n (n+1) h₀ = h
  rw [hd₀]
  exact h₀eq

lemma sectionHomCochain_isZero_homology (dual : Bool) (n : ℕ) :
    CategoryTheory.Limits.IsZero ((sectionHomCochain A γ δ s t M dual).homology (n+1)) :=
  (sectionHomCochain_exactAt A γ δ s t M dual n).isZero_homology

lemma sectionHomDifferential_ideal_zero :
    sectionHomDifferential A γ δ s t M false 0 =
      LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin := rfl

lemma sectionHomDifferential_dual_zero :
    sectionHomDifferential A γ δ s t M true 0 =
      LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin := rfl

lemma sectionHomDifferential_periodic (dual : Bool) (n : ℕ) :
    sectionHomDifferential A γ δ s t M dual (n+2) =
      sectionHomDifferential A γ δ s t M dual n := by
  simp only [sectionHomDifferential, Nat.add_mod, Nat.mod_self, add_zero, Nat.mod_mod]

lemma sectionHomCochain_X (dual : Bool) (n : ℕ) :
    (sectionHomCochain A γ δ s t M dual).X n = ModuleCat.of R₀ H₀ := rfl

lemma sectionHomCochain_shape (dual : Bool) (i j : ℕ) (h : i+1 ≠ j) :
    (sectionHomCochain A γ δ s t M dual).d i j = 0 :=
  (sectionHomCochain A γ δ s t M dual).shape i j h

lemma sectionHomIdeal_augmentation_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (idealPresentation A γ δ s t))
      (sectionHomDifferential A γ δ s t M false 0) :=
  LinearMap.exact_lcomp_of_exact_of_surjective N₀
    (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t))
    (idealPresentation_surjective A γ δ s t)

lemma sectionHomDual_augmentation_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (dualPresentation A γ δ s t))
      (sectionHomDifferential A γ δ s t M true 0) :=
  LinearMap.exact_lcomp_of_exact_of_surjective N₀
    (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t))
    (dualPresentation_surjective A γ δ s t)

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_ideal_signed_column
example (m : M) :
    sectionHomDifferential A 0 0 0 0 M false 0
      (sectionFreeTensorHom A 0 0 0 0 M (![0,1] ⊗ₜ[A] m)) (![1,0]) =
      AdjoinRoot.root (polynomial A 0 0 0 0) ⊗ₜ[A] m := by
  simp [sectionHomDifferential, sectionFreeTensorHom_tmul, right, Matrix.vecHead]

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_dual_negative_column
example (m : M) :
    sectionHomDifferential A 0 0 0 0 M true 0
      (sectionFreeTensorHom A 0 0 0 0 M (![0,1] ⊗ₜ[A] m)) (![1,0]) =
      (-AdjoinRoot.root (polynomial A 0 0 0 0)) ⊗ₜ[A] m := by
  simp [sectionHomDifferential, sectionFreeTensorHom_tmul, left, Matrix.vecHead]

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_two_period
example (dual : Bool) (n : ℕ) :
    sectionHomDifferential A γ δ s t M dual (n+2) =
      sectionHomDifferential A γ δ s t M dual n :=
  sectionHomDifferential_periodic A γ δ s t M dual n

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_torsion_coefficient
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain ℤ 1 0 1 0 (ZMod 2) false).homology 3) :=
  sectionHomCochain_isZero_homology ℤ 1 0 1 0 (ZMod 2) false 2

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_nonreduced_base
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain (ZMod 4) 0 0 1 0 (ZMod 4) true).homology 2) :=
  sectionHomCochain_isZero_homology (ZMod 4) 0 0 1 0 (ZMod 4) true 1

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_zero_ring
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain (ZMod 1) 0 0 0 0 (ZMod 1) false).homology 1) :=
  sectionHomCochain_isZero_homology (ZMod 1) 0 0 0 0 (ZMod 1) false 0

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_actual_differential
example (n : ℕ) :
    HEq ((sectionHomCochain A γ δ s t M false).d n (n+1))
      (ModuleCat.ofHom (R := R₀) (X := H₀) (Y := H₀) (sectionHomDifferential A γ δ s t M false n)) :=
  sectionHomCochain_d A γ δ s t M false n

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_degree_zero_ideal
example (h : H₀) : sectionHomDifferential A γ δ s t M false 0 h = 0 ↔
    ∃ f : (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀) →ₗ[R₀] N₀, f.comp (idealPresentation A γ δ s t) = h :=
  sectionHomIdeal_augmentation_exact A γ δ s t M h

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_degree_zero_dual
example (h : H₀) : sectionHomDifferential A γ δ s t M true 0 h = 0 ↔
    ∃ f : Module.Dual R₀ (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀) →ₗ[R₀] N₀, f.comp (dualPresentation A γ δ s t) = h :=
  sectionHomDual_augmentation_exact A γ δ s t M h

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomLeftRight_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomRightLeft_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_sq
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_d
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_exactAt
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_isZero_homology
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_ideal_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_dual_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_periodic
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_X
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_shape
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomIdeal_augmentation_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDual_augmentation_exact

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

def sectionChainDifferential (dual : Bool) (n : ℕ) : F₀ →ₗ[R₀] F₀ :=
  if (n % 2 = 0) = (dual = true) then (Φ₀).mulVecLin else (Ψ₀).mulVecLin

lemma sectionChainDifferential_exact (dual : Bool) (n : ℕ) :
    Function.Exact (sectionChainDifferential A γ δ s t dual (n+1))
      (sectionChainDifferential A γ δ s t dual n) := by
  have hl := LinearMap.exact_iff.mpr (quotientLeftExact A γ δ s t)
  have hr := LinearMap.exact_iff.mpr (quotientRightExact A γ δ s t)
  have hn : n % 2 = 0 ∨ n % 2 = 1 := by omega
  cases dual <;> rcases hn with hn | hn <;>
    simp [sectionChainDifferential, hn, show (n+1)%2 = 1-n%2 by omega, hl, hr]

lemma sectionChainDifferential_sq (dual : Bool) (n : ℕ) :
    (sectionChainDifferential A γ δ s t dual n).comp
      (sectionChainDifferential A γ δ s t dual (n+1)) = 0 :=
  (sectionChainDifferential_exact A γ δ s t dual n).linearMap_comp_eq_zero

def sectionChain (dual : Bool) : ChainComplex (ModuleCat.{u_resolution} R₀) ℕ :=
  ChainComplex.of (fun _ => ModuleCat.of R₀ F₀)
    (fun n => ModuleCat.ofHom (R := R₀) (sectionChainDifferential A γ δ s t dual n))
    (fun n => ModuleCat.hom_ext (sectionChainDifferential_sq A γ δ s t dual n))

lemma sectionChain_d (dual : Bool) (n : ℕ) :
    HEq ((sectionChain A γ δ s t dual).d (n+1) n)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (sectionChainDifferential A γ δ s t dual n)) := by
  exact heq_of_eq (ChainComplex.of_d (fun _ : ℕ => ModuleCat.of R₀ F₀)
    (fun k => ModuleCat.ofHom (R := R₀) (sectionChainDifferential A γ δ s t dual k)) n)

lemma sectionChain_exactAt (dual : Bool) (n : ℕ) :
    (sectionChain A γ δ s t dual).ExactAt (n+1) := by
  rw [HomologicalComplex.exactAt_iff' _ (n+2) (n+1) n (by simp) (by simp)]
  rw [CategoryTheory.ShortComplex.moduleCat_exact_iff]
  intro z hz
  change (sectionChain A γ δ s t dual).d (n+1) n z = 0 at hz
  rw [eq_of_heq (sectionChain_d A γ δ s t dual n)] at hz
  obtain ⟨w,hw⟩ := (sectionChainDifferential_exact A γ δ s t dual n z).mp hz
  refine ⟨w,?_⟩
  change (sectionChain A γ δ s t dual).d (n+2) (n+1) w = z
  rw [eq_of_heq (sectionChain_d A γ δ s t dual (n+1))]
  exact hw

lemma sectionChain_projective (dual : Bool) (n : ℕ) :
    CategoryTheory.Projective ((sectionChain A γ δ s t dual).X n) := by
  change CategoryTheory.Projective (ModuleCat.of R₀ F₀)
  infer_instance

lemma sectionChainIdeal_augmentation_zero :
    (idealPresentation A γ δ s t).comp
      (sectionChainDifferential A γ δ s t false 0) = 0 :=
  (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t)).linearMap_comp_eq_zero

lemma sectionChainDual_augmentation_zero :
    (dualPresentation A γ δ s t).comp
      (sectionChainDifferential A γ δ s t true 0) = 0 :=
  (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t)).linearMap_comp_eq_zero

def sectionIdealAugmentation : sectionChain A γ δ s t false ⟶
    (ChainComplex.single₀ (ModuleCat.{u_resolution} R₀)).obj (ModuleCat.of R₀ J₀) :=
  (ChainComplex.toSingle₀Equiv _ _).symm ⟨ModuleCat.ofHom (idealPresentation A γ δ s t), by
    rw [eq_of_heq (sectionChain_d A γ δ s t false 0)]
    exact ModuleCat.hom_ext (sectionChainIdeal_augmentation_zero A γ δ s t)⟩

def sectionDualAugmentation : sectionChain A γ δ s t true ⟶
    (ChainComplex.single₀ (ModuleCat.{u_resolution} R₀)).obj (ModuleCat.of R₀ D₀) :=
  (ChainComplex.toSingle₀Equiv _ _).symm ⟨ModuleCat.ofHom (dualPresentation A γ δ s t), by
    rw [eq_of_heq (sectionChain_d A γ δ s t true 0)]
    exact ModuleCat.hom_ext (sectionChainDual_augmentation_zero A γ δ s t)⟩

lemma sectionIdealAugmentation_zero :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) := by
  exact heq_of_eq (ChainComplex.toSingle₀Equiv_symm_apply_f_zero _ _)

lemma sectionDualAugmentation_zero :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) := by
  exact heq_of_eq (ChainComplex.toSingle₀Equiv_symm_apply_f_zero _ _)

set_option backward.isDefEq.respectTransparency false in
lemma sectionIdealAugmentation_quasiIso : QuasiIso (sectionIdealAugmentation A γ δ s t) := by
  have he : (ShortComplex.mk
      (ModuleCat.ofHom (sectionChainDifferential A γ δ s t false 0))
      (ModuleCat.ofHom (idealPresentation A γ δ s t))
      (ModuleCat.hom_ext (sectionChainIdeal_augmentation_zero A γ δ s t))).Exact ∧
      Epi (ModuleCat.ofHom (idealPresentation A γ δ s t)) := by
    constructor
    · rw [ShortComplex.moduleCat_exact_iff]
      intro z hz
      exact (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t) z).mp hz
    · exact (ModuleCat.epi_iff_surjective _).mpr (idealPresentation_surjective A γ δ s t)
  refine ⟨fun n => ?_⟩
  cases n with
  | zero =>
    rw [ChainComplex.quasiIsoAt₀_iff, ShortComplex.quasiIso_iff_of_zeros']
    · refine (ShortComplex.exact_and_epi_g_iff_of_iso ?_).2 he
      exact ShortComplex.isoMk (Iso.refl _) (Iso.refl _) (Iso.refl _)
        (by simp [eq_of_heq (sectionChain_d A γ δ s t false 0), Category.id_comp, Category.comp_id]) (by simp [sectionIdealAugmentation, Category.id_comp, Category.comp_id])
    all_goals rfl
  | succ n =>
    rw [quasiIsoAt_iff_exactAt']
    · exact sectionChain_exactAt A γ δ s t false n
    · apply ChainComplex.exactAt_succ_single_obj

set_option backward.isDefEq.respectTransparency false in
lemma sectionDualAugmentation_quasiIso : QuasiIso (sectionDualAugmentation A γ δ s t) := by
  have he : (ShortComplex.mk
      (ModuleCat.ofHom (sectionChainDifferential A γ δ s t true 0))
      (ModuleCat.ofHom (dualPresentation A γ δ s t))
      (ModuleCat.hom_ext (sectionChainDual_augmentation_zero A γ δ s t))).Exact ∧
      Epi (ModuleCat.ofHom (dualPresentation A γ δ s t)) := by
    constructor
    · rw [ShortComplex.moduleCat_exact_iff]
      intro z hz
      exact (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t) z).mp hz
    · exact (ModuleCat.epi_iff_surjective _).mpr (dualPresentation_surjective A γ δ s t)
  refine ⟨fun n => ?_⟩
  cases n with
  | zero =>
    rw [ChainComplex.quasiIsoAt₀_iff, ShortComplex.quasiIso_iff_of_zeros']
    · refine (ShortComplex.exact_and_epi_g_iff_of_iso ?_).2 he
      exact ShortComplex.isoMk (Iso.refl _) (Iso.refl _) (Iso.refl _)
        (by simp [eq_of_heq (sectionChain_d A γ δ s t true 0), Category.id_comp, Category.comp_id]) (by simp [sectionDualAugmentation, Category.id_comp, Category.comp_id])
    all_goals rfl
  | succ n =>
    rw [quasiIsoAt_iff_exactAt']
    · exact sectionChain_exactAt A γ δ s t true n
    · apply ChainComplex.exactAt_succ_single_obj

def sectionIdealResolution : ProjectiveResolution (ModuleCat.of R₀ J₀) where
  complex := sectionChain A γ δ s t false
  projective := sectionChain_projective A γ δ s t false
  π := sectionIdealAugmentation A γ δ s t
  quasiIso := sectionIdealAugmentation_quasiIso A γ δ s t

def sectionDualResolution : ProjectiveResolution (ModuleCat.of R₀ D₀) where
  complex := sectionChain A γ δ s t true
  projective := sectionChain_projective A γ δ s t true
  π := sectionDualAugmentation A γ δ s t
  quasiIso := sectionDualAugmentation_quasiIso A γ δ s t

lemma sectionChainDifferential_ideal_zero :
    sectionChainDifferential A γ δ s t false 0 = (Ψ₀).mulVecLin := rfl

lemma sectionChainDifferential_dual_zero :
    sectionChainDifferential A γ δ s t true 0 = (Φ₀).mulVecLin := rfl

lemma sectionChainDifferential_periodic (dual : Bool) (n : ℕ) :
    sectionChainDifferential A γ δ s t dual (n+2) =
      sectionChainDifferential A γ δ s t dual n := by
  simp only [sectionChainDifferential, Nat.add_mod, Nat.mod_self, add_zero, Nat.mod_mod]

lemma sectionChain_X (dual : Bool) (n : ℕ) :
    (sectionChain A γ δ s t dual).X n = ModuleCat.of R₀ F₀ := rfl

lemma sectionChain_finiteFree (dual : Bool) (n : ℕ) :
    Module.Free R₀ ((sectionChain A γ δ s t dual).X n) ∧
      Module.Finite R₀ ((sectionChain A γ δ s t dual).X n) := by
  constructor
  · change Module.Free R₀ F₀
    infer_instance
  · change Module.Finite R₀ F₀
    infer_instance

lemma sectionChain_shape (dual : Bool) (i j : ℕ) (h : j+1 ≠ i) :
    (sectionChain A γ δ s t dual).d i j = 0 :=
  (sectionChain A γ δ s t dual).shape i j h

lemma sectionResolutionHom_d (M : Type*) [AddCommGroup M] [Module A M]
    (dual : Bool) (n : ℕ) :
    HEq (LinearMap.lcomp R₀ (R₀ ⊗[A] M) ((sectionChain A γ δ s t dual).d (n+1) n).hom)
      (sectionHomDifferential A γ δ s t M dual n) := by
  apply heq_of_eq
  rw [eq_of_heq (sectionChain_d A γ δ s t dual n)]
  have hn : n % 2 = 0 ∨ n % 2 = 1 := by omega
  cases dual <;> rcases hn with hn | hn <;>
    simp [sectionChainDifferential, sectionHomDifferential, hn]
  all_goals rfl

lemma sectionIdealResolution_complex :
    (sectionIdealResolution A γ δ s t).complex = sectionChain A γ δ s t false := rfl

lemma sectionIdealResolution_augmentation :
    HEq ((sectionIdealResolution A γ δ s t).π) (sectionIdealAugmentation A γ δ s t) := HEq.rfl

lemma sectionDualResolution_complex :
    (sectionDualResolution A γ δ s t).complex = sectionChain A γ δ s t true := rfl

lemma sectionDualResolution_augmentation :
    HEq ((sectionDualResolution A γ δ s t).π) (sectionDualAugmentation A γ δ s t) := HEq.rfl

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_ideal_signed_column
example : sectionChainDifferential A 0 0 0 0 false 0 (![1,0]) 1 =
    AdjoinRoot.root (polynomial A 0 0 0 0) := by
  simp [sectionChainDifferential, right, Matrix.mulVec, dotProduct]

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_dual_negative_column
example : sectionChainDifferential A 0 0 0 0 true 0 (![1,0]) 1 =
    -AdjoinRoot.root (polynomial A 0 0 0 0) := by
  simp [sectionChainDifferential, left, Matrix.mulVec, dotProduct, Fin.sum_univ_two]

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_two_period
example (dual : Bool) (n : ℕ) : sectionChainDifferential A γ δ s t dual (n+2) =
    sectionChainDifferential A γ δ s t dual n :=
  sectionChainDifferential_periodic A γ δ s t dual n

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_nonreduced_exact
example : (sectionChain (ZMod 4) 0 0 1 0 false).ExactAt 2 :=
  sectionChain_exactAt (ZMod 4) 0 0 1 0 false 1

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_finite_projective
example (dual : Bool) (n : ℕ) :
    CategoryTheory.Projective ((sectionChain A γ δ s t dual).X n) ∧
      Module.Finite R₀ ((sectionChain A γ δ s t dual).X n) :=
  ⟨sectionChain_projective A γ δ s t dual n, (sectionChain_finiteFree A γ δ s t dual n).2⟩

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_hom_coefficient_differential
example (M : Type*) [AddCommGroup M] [Module A M] (dual : Bool) (n : ℕ) :
    HEq (LinearMap.lcomp R₀ (R₀ ⊗[A] M) ((sectionChain A γ δ s t dual).d (n+1) n).hom)
      (sectionHomDifferential A γ δ s t M dual n) :=
  sectionResolutionHom_d A γ δ s t M dual n

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_first_generator
example :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) ∧
      (idealPresentation A γ δ s t (![1,0]) : R₀) = u₀ - ι₀ s := by
  refine ⟨sectionIdealAugmentation_zero A γ δ s t,?_⟩
  simp [idealPresentation]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_second_signed_generator
example :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) ∧
      (idealPresentation A γ δ s t (![0,1]) : R₀) = -(v₀ - ι₀ t) := by
  refine ⟨sectionIdealAugmentation_zero A γ δ s t,?_⟩
  simp [idealPresentation]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_positive_component_zero
example (n : ℕ) : (sectionIdealAugmentation A γ δ s t).f (n+1) = 0 := by
  exact (HomologicalComplex.isZero_single_obj_X _ _ _ _ (by simp)).eq_of_tgt _ _

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_first_generator
example (j : J₀) :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) ∧
      dualPresentation A γ δ s t (![1,0]) j = (j : R₀) := by
  refine ⟨sectionDualAugmentation_zero A γ δ s t,?_⟩
  simp [dualPresentation_apply]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_second_signed_generator
example (j : J₀) :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) ∧
      dualPresentation A γ δ s t (![0,1]) j = -dualGenerator A γ δ s t j := by
  refine ⟨sectionDualAugmentation_zero A γ δ s t,?_⟩
  simp [dualPresentation_apply]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_positive_component_zero
example (n : ℕ) : (sectionDualAugmentation A γ δ s t).f (n+1) = 0 := by
  exact (HomologicalComplex.isZero_single_obj_X _ _ _ _ (by simp)).eq_of_tgt _ _

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_starting_psi
example : HEq ((sectionIdealResolution A γ δ s t).complex.d 1 0)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Ψ₀).mulVecLin) := by
  apply heq_of_eq
  change (sectionChain A γ δ s t false).d 1 0 = _
  rw [eq_of_heq (sectionChain_d A γ δ s t false 0), sectionChainDifferential_ideal_zero]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_next_phi
example : HEq ((sectionIdealResolution A γ δ s t).complex.d 2 1)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Φ₀).mulVecLin) := by
  apply heq_of_eq
  change (sectionChain A γ δ s t false).d 2 1 = _
  rw [eq_of_heq (sectionChain_d A γ δ s t false 1)]
  rfl

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_zero_ring_quasiIso
example : QuasiIso (sectionIdealResolution (ZMod 1) 0 0 0 0).π :=
  (sectionIdealResolution (ZMod 1) 0 0 0 0).quasiIso

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_starting_phi
example : HEq ((sectionDualResolution A γ δ s t).complex.d 1 0)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Φ₀).mulVecLin) := by
  apply heq_of_eq
  change (sectionChain A γ δ s t true).d 1 0 = _
  rw [eq_of_heq (sectionChain_d A γ δ s t true 0), sectionChainDifferential_dual_zero]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_next_psi
example : HEq ((sectionDualResolution A γ δ s t).complex.d 2 1)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Ψ₀).mulVecLin) := by
  apply heq_of_eq
  change (sectionChain A γ δ s t true).d 2 1 = _
  rw [eq_of_heq (sectionChain_d A γ δ s t true 1)]
  rfl

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_nonreduced_quasiIso
example : QuasiIso (sectionDualResolution (ZMod 4) 0 0 1 0).π :=
  (sectionDualResolution (ZMod 4) 0 0 1 0).quasiIso

lemma sectionIdealResolution_quasiIso :
    QuasiIso (sectionIdealResolution A γ δ s t).π :=
  (sectionIdealResolution A γ δ s t).quasiIso

lemma sectionDualResolution_quasiIso :
    QuasiIso (sectionDualResolution A γ δ s t).π :=
  (sectionDualResolution A γ δ s t).quasiIso

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_sq
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_d
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_exactAt
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_projective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainIdeal_augmentation_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDual_augmentation_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_quasiIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_quasiIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_ideal_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_dual_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_periodic
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_X
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_finiteFree
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_shape
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHom_d
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_complex
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_augmentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_complex
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_augmentation

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_quasiIso

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_quasiIso

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

set_option backward.isDefEq.respectTransparency false in
def sectionResolutionHomIso (dual : Bool) :
    (sectionChain A γ δ s t dual).linearYonedaObj R₀ (ModuleCat.of R₀ N₀) ≅
      sectionHomCochain A γ δ s t M dual :=
  HomologicalComplex.Hom.isoOfComponents
    (fun _ => (ModuleCat.homLinearEquiv (S := R₀)).toModuleIso)
    (by
      intro i j hij
      obtain rfl : j = i+1 := hij.symm
      apply ModuleCat.hom_ext
      apply LinearMap.ext
      intro h
      rw [eq_of_heq (sectionHomCochain_d A γ δ s t M dual i)]
      change sectionHomDifferential A γ δ s t M dual i h.hom =
        h.hom.comp ((sectionChain A γ δ s t dual).d (i+1) i).hom
      exact congrArg (fun f => f h.hom) (eq_of_heq
        (sectionResolutionHom_d A γ δ s t M dual i)).symm)

lemma sectionResolutionHomIso_apply (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).hom.f n h) h.hom := HEq.rfl

lemma sectionResolutionHomIso_inv_apply (dual : Bool) (n : ℕ)
    :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).inv.f n)
      (ModuleCat.ofHom (ModuleCat.homLinearEquiv (S := R₀)
        (M := ModuleCat.of R₀ F₀) (N := ModuleCat.of R₀ N₀)).symm.toLinearMap) := HEq.rfl

set_option backward.isDefEq.respectTransparency false in
lemma sectionResolutionHom_exact (dual : Bool) (n : ℕ) :
    Function.Exact
      (fun h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀ =>
        (sectionChain A γ δ s t dual).d (n+1) n ≫ h)
      (fun h : (sectionChain A γ δ s t dual).X (n+1) ⟶ ModuleCat.of R₀ N₀ =>
        (sectionChain A γ δ s t dual).d (n+2) (n+1) ≫ h) := by
  intro h
  constructor
  · intro hh
    have hc : sectionHomDifferential A γ δ s t M dual (n+1) h.hom = 0 := by
      rw [← eq_of_heq (sectionResolutionHom_d A γ δ s t M dual (n+1))]
      exact congrArg ModuleCat.Hom.hom hh
    obtain ⟨g,hg⟩ := (sectionHomDifferential_exact A γ δ s t M dual n h.hom).mp hc
    refine ⟨ModuleCat.ofHom g, ?_⟩
    apply ModuleCat.hom_ext
    change g.comp ((sectionChain A γ δ s t dual).d (n+1) n).hom = h.hom
    exact (congrArg (fun f => f g) (eq_of_heq
      (sectionResolutionHom_d A γ δ s t M dual n))).trans hg
  · rintro ⟨g,rfl⟩
    simp [← Category.assoc, HomologicalComplex.d_comp_d]

def sectionIdealDerivedExtIso (n : ℕ) :
    ((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) n).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀) ≅
      (sectionHomCochain A γ δ s t M false).homology n :=
  (sectionIdealResolution A γ δ s t).isoExt n (ModuleCat.of R₀ N₀) ≪≫
    (HomologicalComplex.homologyFunctor _ _ n).mapIso
      (sectionResolutionHomIso A γ δ s t M false)

def sectionDualDerivedExtIso (n : ℕ) :
    ((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) n).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀) ≅
      (sectionHomCochain A γ δ s t M true).homology n :=
  (sectionDualResolution A γ δ s t).isoExt n (ModuleCat.of R₀ N₀) ≪≫
    (HomologicalComplex.homologyFunctor _ _ n).mapIso
      (sectionResolutionHomIso A γ δ s t M true)

lemma sectionIdealDerivedExtIso_inverse (n : ℕ) :
    (sectionIdealDerivedExtIso A γ δ s t M n).hom ≫
      (sectionIdealDerivedExtIso A γ δ s t M n).inv = 𝟙 _ :=
  (sectionIdealDerivedExtIso A γ δ s t M n).hom_inv_id

lemma sectionDualDerivedExtIso_inverse (n : ℕ) :
    (sectionDualDerivedExtIso A γ δ s t M n).hom ≫
      (sectionDualDerivedExtIso A γ δ s t M n).inv = 𝟙 _ :=
  (sectionDualDerivedExtIso A γ δ s t M n).hom_inv_id

lemma sectionIdealDerivedExtIso_zero (n : ℕ) :
    (sectionIdealDerivedExtIso A γ δ s t M n).hom 0 = 0 :=
  map_zero (sectionIdealDerivedExtIso A γ δ s t M n).hom.hom

lemma sectionDualDerivedExtIso_zero (n : ℕ) :
    (sectionDualDerivedExtIso A γ δ s t M n).hom 0 = 0 :=
  map_zero (sectionDualDerivedExtIso A γ δ s t M n).hom.hom

lemma sectionIdealDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀)) :=
  Limits.IsZero.of_iso (sectionHomCochain_isZero_homology A γ δ s t M false n)
    (sectionIdealDerivedExtIso A γ δ s t M (n+1))

lemma sectionDualDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀)) :=
  Limits.IsZero.of_iso (sectionHomCochain_isZero_homology A γ δ s t M true n)
    (sectionDualDerivedExtIso A γ δ s t M (n+1))

lemma sectionIdealExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ J₀) (ModuleCat.of R₀ N₀) (n+1)) :
    α = 0 := by
  let P := sectionIdealResolution A γ δ s t
  obtain ⟨f,hf,rfl⟩ := P.extMk_surjective α (n+2) rfl
  apply (P.extMk_eq_zero_iff f (n+2) rfl hf n rfl).mpr
  exact (sectionResolutionHom_exact A γ δ s t M false n f).mp hf

lemma sectionDualExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ D₀) (ModuleCat.of R₀ N₀) (n+1)) :
    α = 0 := by
  let P := sectionDualResolution A γ δ s t
  obtain ⟨f,hf,rfl⟩ := P.extMk_surjective α (n+2) rfl
  apply (P.extMk_eq_zero_iff f (n+2) rfl hf n rfl).mpr
  exact (sectionResolutionHom_exact A γ δ s t M true n f).mp hf

lemma sectionResolutionHomIso_natural {M' : Type u_ext} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M' dual).hom.f n
      (h ≫ ModuleCat.ofHom (AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f)))
      ((AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f).comp h.hom) := HEq.rfl

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_actual_components
example (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).hom.f n h) h.hom :=
  sectionResolutionHomIso_apply A γ δ s t M dual n h

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_inverse
example (dual : Bool) (n : ℕ) :
    ((sectionResolutionHomIso A γ δ s t M dual).inv ≫
      (sectionResolutionHomIso A γ δ s t M dual).hom).f n =
        𝟙 ((sectionHomCochain A γ δ s t M dual).X n) := by
  exact congrArg (fun f => f.f n) (sectionResolutionHomIso A γ δ s t M dual).inv_hom_id

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_naturality
example {M' : Type u_ext} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M' dual).hom.f n
      (h ≫ ModuleCat.ofHom (AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f)))
      ((AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f).comp h.hom) :=
  sectionResolutionHomIso_natural A γ δ s t M f dual n h

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_degree_zero
example (x : (( _root_.Ext R₀ (ModuleCat.{u_ext} R₀) 0).obj
    (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀)) :
    (sectionIdealDerivedExtIso A γ δ s t M 0).inv
      ((sectionIdealDerivedExtIso A γ δ s t M 0).hom x) = x := by
  exact congrArg (fun f => f x) (sectionIdealDerivedExtIso A γ δ s t M 0).hom_inv_id

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_nonflat
example : Limits.IsZero (((_root_.Ext (Ring ℤ 1 0 1 0)
    (ModuleCat.{0} (Ring ℤ 1 0 1 0)) 3).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal ℤ 1 0 1 0)))).obj
        (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2))) :=
  sectionIdealDerivedExt_isZero ℤ 1 0 1 0 (ZMod 2) 2

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_zero_ring
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 1) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 1) 0 0 0 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal (ZMod 1) 0 0 0 0)))).obj
        (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0 ⊗[ZMod 1] ZMod 1))) :=
  sectionIdealDerivedExt_isZero (ZMod 1) 0 0 0 0 (ZMod 1) 0

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_degree_zero
example (x : (( _root_.Ext R₀ (ModuleCat.{u_ext} R₀) 0).obj
    (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀)) :
    (sectionDualDerivedExtIso A γ δ s t M 0).inv
      ((sectionDualDerivedExtIso A γ δ s t M 0).hom x) = x := by
  exact congrArg (fun f => f x) (sectionDualDerivedExtIso A γ δ s t M 0).hom_inv_id

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_nonreduced
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 4) 0 0 1 0)
    (ModuleCat.{0} (Ring (ZMod 4) 0 0 1 0)) 2).obj
      (Opposite.op (ModuleCat.of _ (Module.Dual (Ring (ZMod 4) 0 0 1 0)
        (sectionIdeal (ZMod 4) 0 0 1 0))))).obj
        (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0 ⊗[ZMod 4] ZMod 4))) :=
  sectionDualDerivedExt_isZero (ZMod 4) 0 0 1 0 (ZMod 4) 1

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_nonflat
example : Limits.IsZero (((_root_.Ext (Ring ℤ 1 0 1 0)
    (ModuleCat.{0} (Ring ℤ 1 0 1 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))))).obj
        (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2))) :=
  sectionDualDerivedExt_isZero ℤ 1 0 1 0 (ZMod 2) 0

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealExt.test_nonflat
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))
    (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2)) 4) : α = 0 :=
  sectionIdealExt_eq_zero ℤ 1 0 1 0 (ZMod 2) 3 α

-- test: NodeSectionFactorization.PolynomialModel.sectionDualExt.test_nonreduced
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 4) 0 0 1 0)
      (Module.Dual (Ring (ZMod 4) 0 0 1 0) (sectionIdeal (ZMod 4) 0 0 1 0)))
    (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0 ⊗[ZMod 4] ZMod 4)) 2) : α = 0 :=
  sectionDualExt_eq_zero (ZMod 4) 0 0 1 0 (ZMod 4) 1 α

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealExt.test_zero_ring
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 1) 0 0 0 0) (sectionIdeal (ZMod 1) 0 0 0 0))
    (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0 ⊗[ZMod 1] ZMod 1)) 1) : α = 0 :=
  sectionIdealExt_eq_zero (ZMod 1) 0 0 0 0 (ZMod 1) 0 α

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_inv_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHom_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExt_isZero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExt_isZero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealExt_eq_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualExt_eq_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_natural

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
    Module.Dual R₀ D₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀) :=
  (AlgebraTensorModule.congr (sectionBidualEquiv A γ δ s t).symm
    (LinearEquiv.refl A M)).trans (sectionIdealTensorHomEquiv A γ δ s t M)

lemma sectionBidualTensorHomEquiv_tmul (F : Module.Dual R₀ D₀) (m : M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M (F ⊗ₜ[A] m) h = F h ⊗ₜ[A] m := by
  change h ((sectionBidualEquiv A γ δ s t).symm F) ⊗ₜ[A] m = _
  have he := congrArg (fun G : Module.Dual R₀ D₀ => G h)
    ((sectionBidualEquiv A γ δ s t).apply_symm_apply F)
  exact congrArg (fun r : R₀ => r ⊗ₜ[A] m) he

lemma sectionBidualTensorHomEquiv_inverse (F : Module.Dual R₀ D₀) (m : M) :
    (sectionBidualTensorHomEquiv A γ δ s t M).symm
      (sectionBidualTensorHomEquiv A γ δ s t M (F ⊗ₜ[A] m)) = F ⊗ₜ[A] m :=
  (sectionBidualTensorHomEquiv A γ δ s t M).symm_apply_apply _

lemma sectionBidualTensorHomEquiv_unique
    (e : Module.Dual R₀ D₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀))
    (he : ∀ F m h, e (F ⊗ₜ[A] m) h = F h ⊗ₜ[A] m) :
    e = sectionBidualTensorHomEquiv A γ δ s t M := by
  apply LinearEquiv.toLinearMap_injective
  apply AlgebraTensorModule.ext
  intro F m
  ext h
  exact (he F m h).trans (sectionBidualTensorHomEquiv_tmul A γ δ s t M F m h).symm

lemma sectionBidualTensorHomEquiv_natural
    {M' : Type u_rel} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : Module.Dual R₀ D₀ ⊗[A] M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : Module.Dual R₀ D₀ →ₗ[R₀] _) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionBidualTensorHomEquiv A γ δ s t M x h) := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | tmul F m => simp [sectionBidualTensorHomEquiv_tmul]
  | add x y hx hy => simp [hx, hy]

lemma sectionBidualTensorHomEquiv_evaluation (x : J₀ ⊗[A] M) :
    sectionBidualTensorHomEquiv A γ δ s t M
      (AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀) x) =
        sectionIdealTensorHomEquiv A γ δ s t M x := by
  induction x using TensorProduct.induction_on with
  | zero =>
    rw [(AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀)).map_zero,
      (sectionBidualTensorHomEquiv A γ δ s t M).map_zero]
    exact (sectionIdealTensorHomEquiv A γ δ s t M).map_zero.symm
  | tmul j m => ext h; exact sectionBidualTensorHomEquiv_tmul A γ δ s t M _ m h
  | add x y hx hy =>
    rw [(AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀)).map_add,
      (sectionBidualTensorHomEquiv A γ δ s t M).map_add, hx, hy]
    exact ((sectionIdealTensorHomEquiv A γ δ s t M).map_add x y).symm

lemma sectionIdealAbsoluteDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ R₀)) := by
  let e := (AlgebraTensorModule.rid A R₀ R₀).toModuleIso
  exact Limits.IsZero.of_iso (sectionIdealDerivedExt_isZero A γ δ s t A n)
    (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).mapIso e.symm)

lemma sectionDualAbsoluteDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ R₀)) := by
  let e := (AlgebraTensorModule.rid A R₀ R₀).toModuleIso
  exact Limits.IsZero.of_iso (sectionDualDerivedExt_isZero A γ δ s t A n)
    (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).mapIso e.symm)

set_option backward.defeqAttrib.useBackward true in
lemma sectionIdealAbsoluteExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ J₀) (ModuleCat.of R₀ R₀) (n+1)) :
    α = 0 := by
  let e := (CategoryTheory.Abelian.extFunctorObj (ModuleCat.of R₀ J₀) (n+1)).mapIso
    ((AlgebraTensorModule.rid A R₀ R₀).toModuleIso)
  have hz := sectionIdealExt_eq_zero A γ δ s t A n (e.inv α)
  apply e.addCommGroupIsoToAddEquiv.symm.injective
  change e.inv α = e.inv 0
  rw [hz]
  exact (map_zero e.inv.hom).symm

set_option backward.defeqAttrib.useBackward true in
lemma sectionDualAbsoluteExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ D₀) (ModuleCat.of R₀ R₀) (n+1)) :
    α = 0 := by
  let e := (CategoryTheory.Abelian.extFunctorObj (ModuleCat.of R₀ D₀) (n+1)).mapIso
    ((AlgebraTensorModule.rid A R₀ R₀).toModuleIso)
  have hz := sectionDualExt_eq_zero A γ δ s t A n (e.inv α)
  apply e.addCommGroupIsoToAddEquiv.symm.injective
  change e.inv α = e.inv 0
  rw [hz]
  exact (map_zero e.inv.hom).symm

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_unit
example (F : Module.Dual R₀ D₀) (h : D₀) :
    AlgebraTensorModule.rid A R₀ R₀
      (sectionBidualTensorHomEquiv A γ δ s t A (F ⊗ₜ[A] 1) h) = F h := by
  rw [sectionBidualTensorHomEquiv_tmul, AlgebraTensorModule.rid_tmul, one_smul]

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_torsion
example (F : Module.Dual (Ring ℤ 1 0 1 0)
    (Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0)))
    (h : Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0)) :
    sectionBidualTensorHomEquiv ℤ 1 0 1 0 (ZMod 2) (F ⊗ₜ[ℤ] 1) h = F h ⊗ₜ[ℤ] 1 :=
  sectionBidualTensorHomEquiv_tmul ℤ 1 0 1 0 (ZMod 2) F 1 h

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_inverse_nonreduced
example (F : Module.Dual (Ring (ZMod 4) 0 0 0 0)
    (Module.Dual (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0))) :
    (sectionBidualTensorHomEquiv (ZMod 4) 0 0 0 0 (ZMod 4)).symm
      (sectionBidualTensorHomEquiv (ZMod 4) 0 0 0 0 (ZMod 4) (F ⊗ₜ[ZMod 4] 1)) =
        F ⊗ₜ[ZMod 4] 1 :=
  sectionBidualTensorHomEquiv_inverse (ZMod 4) 0 0 0 0 (ZMod 4) F 1

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv_evaluation.test_native
example (j : J₀) (m : M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M
      (AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀) (j ⊗ₜ[A] m)) h =
        h j ⊗ₜ[A] m :=
  sectionBidualTensorHomEquiv_tmul A γ δ s t M _ m h

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAbsoluteDerivedExt.test_zero_ring
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 1) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 1) 0 0 0 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal (ZMod 1) 0 0 0 0)))).obj
        (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0))) :=
  sectionIdealAbsoluteDerivedExt_isZero (ZMod 1) 0 0 0 0 0

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAbsoluteDerivedExt.test_nonreduced
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 4) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 4) 0 0 0 0)) 2).obj
      (Opposite.op (ModuleCat.of _
        (Module.Dual (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0))))).obj
        (ModuleCat.of _ (Ring (ZMod 4) 0 0 0 0))) :=
  sectionDualAbsoluteDerivedExt_isZero (ZMod 4) 0 0 0 0 1

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAbsoluteExt.test_integral
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))
    (ModuleCat.of _ (Ring ℤ 1 0 1 0)) 3) : α = 0 :=
  sectionIdealAbsoluteExt_eq_zero ℤ 1 0 1 0 2 α

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAbsoluteExt.test_nonreduced
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 4) 0 0 1 0)
      (Module.Dual (Ring (ZMod 4) 0 0 1 0) (sectionIdeal (ZMod 4) 0 0 1 0)))
    (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0)) 4) : α = 0 :=
  sectionDualAbsoluteExt_eq_zero (ZMod 4) 0 0 1 0 3 α

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv_tmul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv_unique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv_natural
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv_evaluation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAbsoluteDerivedExt_isZero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAbsoluteDerivedExt_isZero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAbsoluteExt_eq_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAbsoluteExt_eq_zero
END ARCHIVED RELATIVE CRITERION Native.lean -/

/- BEGIN ARCHIVED RELATIVE CRITERION IncomingNative.lean
import Mathlib.CategoryTheory.Abelian.Ext
import Mathlib.CategoryTheory.Abelian.Projective.Ext
import Mathlib.Algebra.Category.ModuleCat.Ext.HasExt
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.CategoryTheory.Abelian.Projective.Resolution
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.LinearAlgebra.LeftExact
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.RingTheory.Flat.Equalizer
import Mathlib.RingTheory.Flat.Basic
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
import Mathlib.LinearAlgebra.TensorProduct.Pi
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

lemma polynomialBasis_zero : polynomialBasis A γ δ s t 0 = 1 := by
  simp [polynomialBasis_apply]

lemma polynomialBasis_one : polynomialBasis A γ δ s t 1 = u₀ := by
  simp [polynomialBasis_apply]

lemma polynomialMonomialBasis_tower : polynomialMonomialBasis A γ δ s t =
    (Polynomial.basisMonomials A).smulTower (polynomialBasis A γ δ s t) := rfl

lemma polynomialMonomialBasis_repr (r : R₀) (n : ℕ) (i : Fin 2) :
    (polynomialMonomialBasis A γ δ s t).repr r (n,i) =
      (Polynomial.basisMonomials A).repr ((polynomialBasis A γ δ s t).repr r i) n := by
  exact Module.Basis.smulTower_repr _ _ _ _

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
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis_one
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_tower
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_repr

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
  have hm := (E₀).map_smul p r
  change E₀ (p • r) = (p * (E₀ r).1, p * (E₀ r).2) at hm
  simpa only [Algebra.smul_def, AdjoinRoot.algebraMap_eq] using hm

lemma polynomialCoordinates_second_mul (r : R₀) :
    E₀ (d₀ * r) =
      ((X - C t) * (E₀ r).1, (X - C t) * (E₀ r).2) := by
  have hd : d₀ = AdjoinRoot.of F₀ (X - C t) := by
    simp [map_sub,coefficientHom]
  rw [hd,polynomialCoordinates_coefficient_mul]

lemma polynomialCoordinates_root_mul (r : R₀) :
    E₀ (u₀ * r) =
      ((C (NodeForm γ δ s t) - C δ * X ^ 2) * (E₀ r).2,
       (E₀ r).1 - (C γ * X) * (E₀ r).2) := by
  have hrel := AdjoinRoot.mk_self (f := F₀)
  change AdjoinRoot.mk F₀ (X ^ 2 + C (C γ * X) * X +
    C (C δ * X ^ 2 - C (NodeForm γ δ s t))) = 0 at hrel
  simp only [map_add,map_mul,map_pow,AdjoinRoot.mk_C,AdjoinRoot.mk_X,map_sub] at hrel
  have hroot : u₀ ^ 2 =
      AdjoinRoot.of F₀ (C (NodeForm γ δ s t) - C δ * X ^ 2) -
        u₀ * AdjoinRoot.of F₀ (C γ * X) := by
    simp only [map_sub,map_mul,map_pow]
    linear_combination hrel
  apply (E₀).symm.injective
  rw [LinearEquiv.symm_apply_apply,polynomialCoordinates_symm]
  calc
    u₀ * r = u₀ * (AdjoinRoot.of F₀ (E₀ r).1 +
        u₀ * AdjoinRoot.of F₀ (E₀ r).2) := by
      rw [polynomialCoordinates_reconstruction]
    _ = _ := by
      simp only [map_mul,map_sub,map_pow] at hroot ⊢
      linear_combination (AdjoinRoot.of F₀ (E₀ r).2) * hroot

lemma polynomialCoordinates_first_mul (r : R₀) :
    (E₀ (c₀ * r)).2 =
      (E₀ r).1 - (C s + C γ * X) * (E₀ r).2 := by
  rw [sub_mul,map_sub]
  change (E₀ (u₀ * r)).2 - (E₀ (AdjoinRoot.of F₀ (C s) * r)).2 = _
  rw [polynomialCoordinates_root_mul,polynomialCoordinates_coefficient_mul]
  dsimp only
  ring

lemma dualValue_commutes (h : D₀) (j k : J₀) :
    (j : R₀) * h k = (k : R₀) * h j := by
  have hjk : (j : R₀) • k = (k : R₀) • j := by
    apply Subtype.ext
    exact mul_comm _ _
  simpa only [map_smul,smul_eq_mul] using congrArg h hjk

lemma dualValue_at_second (h : D₀) :
    let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
    ((E₀ (h jd)).1).eval t =
      (s + γ * t) * ((E₀ (h jd)).2).eval t := by
  dsimp only
  let jc : J₀ := ⟨c₀,sectionFirst_mem A γ δ s t⟩
  let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
  have hcomm := dualValue_commutes A γ δ s t h jc jd
  have he := congrArg (fun r : R₀ => ((E₀ r).2).eval t) hcomm
  change ((E₀ (c₀ * h jd)).2).eval t = ((E₀ (d₀ * h jc)).2).eval t at he
  rw [polynomialCoordinates_first_mul,polynomialCoordinates_second_mul] at he
  simp only [eval_sub,eval_add,eval_mul,eval_C,eval_X,sub_self,zero_mul] at he
  exact sub_eq_zero.mp he

lemma polynomialCoordinates_dualNumerator : E₀ b₀ = (C (s + γ * t), 1) := by
  have hb : b₀ = u₀ + AdjoinRoot.of F₀ (C (s + γ * t)) := by
    simp only [map_add,map_mul,coefficientHom,RingHom.comp_apply]
    ring
  rw [hb,map_add,polynomialCoordinates_root,polynomialCoordinates_of]
  apply Prod.ext <;> simp

lemma dualValue_decomposition (h : D₀) :
    let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
    ∃ z : R₀ × A, h jd = d₀ * z.1 + ι₀ z.2 * b₀ := by
  dsimp only
  let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
  let p := (E₀ (h jd)).1
  let q := (E₀ (h jd)).2
  let α := q.eval t
  have hpval : p.eval t = (s + γ * t) * α := dualValue_at_second A γ δ s t h
  obtain ⟨p₀,hp₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := p) (a := t)
  obtain ⟨q₀,hq₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := q) (a := t)
  let r := AdjoinRoot.of F₀ p₀ + u₀ * AdjoinRoot.of F₀ q₀
  have hr : E₀ r = (p₀,q₀) := by
    simpa only [polynomialCoordinates_symm] using (E₀).apply_symm_apply (p₀,q₀)
  refine ⟨(r,α),?_⟩
  apply (E₀).injective
  rw [map_add,polynomialCoordinates_second_mul]
  change E₀ (h jd) =
    ((X-C t)*(E₀ r).1,(X-C t)*(E₀ r).2) + E₀ (AdjoinRoot.of F₀ (C α) * b₀)
  rw [polynomialCoordinates_coefficient_mul,polynomialCoordinates_dualNumerator,hr]
  apply Prod.ext
  · change p = (X-C t)*p₀ + C α * C (s+γ*t)
    rw [hpval] at hp₀
    rw [←hp₀,←map_mul]
    ring
  · change q = (X-C t)*q₀ + C α * 1
    rw [mul_one,←hq₀]
    exact (sub_add_cancel _ _).symm

lemma dualNormalForm_exists (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (h : D₀) :
    ∃ z : R₀ × A, ∀ j : J₀,
      h j = z.1 * (j : R₀) + ι₀ z.2 * ε j := by
  obtain ⟨z,hz⟩ := dualValue_decomposition A γ δ s t h
  refine ⟨z,?_⟩
  intro j
  let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
  have hc := dualValue_commutes A γ δ s t h j jd
  apply sectionCoordinateRegular A γ δ s t
  change d₀ * h j = d₀ * (z.1 * (j : R₀) + ι₀ z.2 * ε j)
  change (j : R₀) * h jd = d₀ * h j at hc
  rw [←hc,hz]
  linear_combination -(ι₀ z.2) * hε j

lemma dualValue_coordinates_unique (z z' : R₀ × A)
    (hz : d₀ * z.1 + ι₀ z.2 * b₀ = d₀ * z'.1 + ι₀ z'.2 * b₀) : z = z' := by
  have hval (r : R₀) (α : A) :
      ((E₀ (d₀ * r + ι₀ α * b₀)).2).eval t = α := by
    rw [map_add,polynomialCoordinates_second_mul]
    change ((X-C t)*(E₀ r).2 +
      (E₀ (AdjoinRoot.of F₀ (C α) * b₀)).2).eval t = α
    rw [polynomialCoordinates_coefficient_mul,polynomialCoordinates_dualNumerator]
    simp
  have he := congrArg (fun r : R₀ => ((E₀ r).2).eval t) hz
  rw [hval,hval] at he
  apply Prod.ext
  · apply sectionCoordinateRegular A γ δ s t
    rw [he] at hz
    exact add_right_cancel hz
  · exact he

theorem dualNormalForm (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (h : D₀) :
    ∃! p : R₀ × A, ∀ j : J₀,
      h j = p.1 * (j : R₀) + ι₀ p.2 * ε j := by
  obtain ⟨p,hp⟩ := dualNormalForm_exists A γ δ s t ε hε h
  refine ⟨p,hp,?_⟩
  intro z hz
  let jd : J₀ := ⟨d₀,sectionSecond_mem A γ δ s t⟩
  have hεd : ε jd = b₀ := by
    apply sectionCoordinateRegular A γ δ s t
    change d₀ * ε jd = d₀ * b₀
    rw [hε]
    change b₀ * d₀ = d₀ * b₀
    ring
  apply dualValue_coordinates_unique A γ δ s t
  have hc := (hz jd).symm.trans (hp jd)
  change z.1 * d₀ + ι₀ z.2 * ε jd = p.1 * d₀ + ι₀ p.2 * ε jd at hc
  rw [hεd] at hc
  simpa only [mul_comm d₀] using hc

def dualMultiplication : R₀ →ₗ[R₀] D₀ where
  toFun r :=
    { toFun := fun j => r * (j : R₀)
      map_add' := by intro j k; exact mul_add _ _ _
      map_smul' := by intro z j; change r * (z * (j : R₀)) = z * (r * (j : R₀)); ring }
  map_add' := by intro r z; ext j; exact add_mul _ _ _
  map_smul' := by intro z r; ext j; exact mul_assoc _ _ _

lemma dualMultiplicationApply (r : R₀) (j : J₀) :
    dualMultiplication A γ δ s t r j = r * (j : R₀) := rfl

theorem dualNormalEquiv (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    ∃ e : D₀ ≃ₗ[A] (R₀ × A), ∀ (p : R₀ × A) (j : J₀),
      e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j := by
  let f : R₀ × A →ₗ[A] D₀ :=
    { toFun := fun p => dualMultiplication A γ δ s t p.1 + p.2 • ε
      map_add' := by intro p q; simp only [Prod.fst_add,Prod.snd_add,map_add,add_smul]; abel
      map_smul' := by
        intro a p
        change dualMultiplication A γ δ s t (a • p.1) + (a*p.2) • ε =
          a • (dualMultiplication A γ δ s t p.1 + p.2 • ε)
        rw [←smul_smul,smul_add]
        congr 1
        exact (dualMultiplication A γ δ s t).map_smul_of_tower a p.1 }
  have hf (p : R₀ × A) (j : J₀) : f p j = p.1 * (j : R₀) + ι₀ p.2 * ε j := by
    change p.1 * (j : R₀) + p.2 • ε j = _
    rw [Algebra.smul_def,←coefficientHom_eq_algebraMap]
  have hbij : Function.Bijective f := by
    constructor
    · intro p q hpq
      obtain ⟨z,hz,hunique⟩ := dualNormalForm A γ δ s t ε hε (f p)
      have hp : ∀ j : J₀, f p j = p.1 * (j : R₀) + ι₀ p.2 * ε j := hf p
      have hq : ∀ j : J₀, f p j = q.1 * (j : R₀) + ι₀ q.2 * ε j := by
        intro j; rw [hpq]; exact hf q j
      exact (hunique p hp).trans (hunique q hq).symm
    · intro h
      obtain ⟨p,hp,-⟩ := dualNormalForm A γ δ s t ε hε h
      refine ⟨p,?_⟩
      ext j
      exact (hf p j).trans (hp j).symm
  refine ⟨(LinearEquiv.ofBijective f hbij).symm,?_⟩
  intro p j
  exact hf p j

lemma dualGenerator_action (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (z : R₀) (j : J₀) :
    (z - ι₀ (sectionEval A γ δ s t z)) * ε j = K z * (j : R₀) := by
  apply sectionCoordinateRegular A γ δ s t
  change d₀ * ((z - ι₀ (sectionEval A γ δ s t z)) * ε j) = d₀ * (K z * (j : R₀))
  linear_combination (z - ι₀ (sectionEval A γ δ s t z)) * hε j - (j : R₀) * hK z

theorem dualScalarAction (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) (K : R₀ →ₗ[A] R₀)
    (hK : ∀ r : R₀, d₀ * K r = b₀ * (r - ι₀ (sectionEval A γ δ s t r)))
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j)
    (z : R₀) (h : D₀) :
    e (z • h) = (z * (e h).1 + ι₀ (e h).2 * K z, sectionEval A γ δ s t z * (e h).2) := by
  apply e.symm.injective
  rw [LinearEquiv.symm_apply_apply]
  ext j
  rw [he]
  have hh : h j = (e h).1 * (j : R₀) + ι₀ (e h).2 * ε j := by
    simpa only [LinearEquiv.symm_apply_apply] using he (e h) j
  change z * h j = _
  rw [hh,map_mul]
  linear_combination (ι₀ (e h).2) * dualGenerator_action A γ δ s t ε hε K hK z j

theorem dualResidue (ε : D₀)
    (hε : ∀ j : J₀, d₀ * ε j = b₀ * (j : R₀)) :
    let ev : R₀ →+* A := sectionEval A γ δ s t
    ∃ ρ : D₀ →ₗ[A] A,
      Function.Surjective ρ ∧ ρ ε = 1 ∧
      (∀ (r : R₀) (h : D₀), ρ (r • h) = ev r * ρ h) ∧
      (∀ h : D₀, ρ h = 0 ↔ ∃ r : R₀, ∀ j : J₀, h j = r * (j : R₀)) := by
  dsimp only
  obtain ⟨e,he⟩ := dualNormalEquiv A γ δ s t ε hε
  let ρ := (LinearMap.snd A R₀ A).comp e.toLinearMap
  have hρ (h : D₀) : ρ h = (e h).2 := rfl
  have hgen : e ε = (0,1) := by
    apply e.symm.injective
    rw [LinearEquiv.symm_apply_apply]
    ext j
    rw [he]
    simp
  refine ⟨ρ,?_,?_,?_,?_⟩
  · intro a
    refine ⟨e.symm (0,a),?_⟩
    rw [hρ,LinearEquiv.apply_symm_apply]
  · rw [hρ,hgen]
  · intro r h
    rw [hρ,hρ,dualScalarAction A γ δ s t ε hε
      (dualCorrectionMap A γ δ s t) (dualCorrectionMap_spec A γ δ s t) e he]
  · intro h
    constructor
    · intro hz
      refine ⟨(e h).1,?_⟩
      intro j
      have hh := he (e h) j
      rw [LinearEquiv.symm_apply_apply] at hh
      change (e h).2 = 0 at hz
      simpa only [hz,map_zero,zero_mul,add_zero] using hh
    · rintro ⟨r,hr⟩
      have hh : h = e.symm (r,0) := by
        ext j
        rw [he,hr]
        simp
      rw [hh,hρ,LinearEquiv.apply_symm_apply]

theorem dualNormalEquivInclusion (ε : D₀)
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    ∀ h : D₀, (∀ j : J₀, h j = (j : R₀)) → e h = (1, 0) := by
  intro h hh
  apply e.symm.injective
  rw [LinearEquiv.symm_apply_apply]
  ext j
  rw [he,hh]
  simp

theorem dualNormalEquivGenerator (ε : D₀)
    (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    e ε = (0, 1) := by
  apply e.symm.injective
  rw [LinearEquiv.symm_apply_apply]
  ext j
  rw [he]
  simp

theorem dualResidueGenerator (ε : D₀) (e : D₀ ≃ₗ[A] (R₀ × A))
    (he : ∀ (p : R₀ × A) (j : J₀), e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * ε j) :
    (e ε).2 = 1 := by rw [dualNormalEquivGenerator A γ δ s t ε e he]

theorem dualResidueInclusion (ρ : D₀ →ₗ[A] A)
    (hker : ∀ h : D₀, ρ h = 0 ↔ ∃ r : R₀, ∀ j : J₀, h j = r * (j : R₀))
    (r : R₀) (h : D₀) (hh : ∀ j : J₀, h j = r * (j : R₀)) : ρ h = 0 :=
  (hker h).mpr ⟨r,hh⟩

lemma dualMultiplicationInjective : Function.Injective (dualMultiplication A γ δ s t) := by
  intro r z hz
  apply sectionCoordinateRegular A γ δ s t
  have hd := congrArg (fun h : D₀ => h ⟨d₀,sectionSecond_mem A γ δ s t⟩) hz
  change d₀ * r = d₀ * z
  simpa only [dualMultiplicationApply,mul_comm d₀] using hd

-- Existing test: normalInclusion, using an actually constructed equivalence.
example : ∃ e : D₀ ≃ₗ[A] (R₀ × A),
    e (dualMultiplication A γ δ s t 1) = (1,0) := by
  obtain ⟨e,he⟩ := dualNormalEquiv A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  refine ⟨e,?_⟩
  apply dualNormalEquivInclusion A γ δ s t (dualGenerator A γ δ s t) e he
  intro j
  simp only [dualMultiplicationApply,one_mul]

-- Existing test: normalGenerator, actual canonical epsilon over a nonreduced ring.
example : ∃ e : (sectionIdeal (ZMod 4) 0 0 0 0 →ₗ[Ring (ZMod 4) 0 0 0 0]
    Ring (ZMod 4) 0 0 0 0) ≃ₗ[ZMod 4] (Ring (ZMod 4) 0 0 0 0 × ZMod 4),
    e (dualGenerator (ZMod 4) 0 0 0 0) = (0,1) := by
  obtain ⟨e,he⟩ := dualNormalEquiv (ZMod 4) 0 0 0 0
    (dualGenerator (ZMod 4) 0 0 0 0) (dualGenerator_spec (ZMod 4) 0 0 0 0)
  refine ⟨e,?_⟩
  exact dualNormalEquivGenerator (ZMod 4) 0 0 0 0 _ e he

-- Existing test: normalRoundTrip, with the constructed inverse's formula.
example : ∃ e : D₀ ≃ₗ[A] (R₀ × A),
    (∀ p, e (e.symm p) = p) ∧
    (∀ p j, e.symm p j = p.1 * (j : R₀) + ι₀ p.2 * dualGenerator A γ δ s t j) := by
  obtain ⟨e,he⟩ := dualNormalEquiv A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  exact ⟨e,e.apply_symm_apply,he⟩

-- Existing test: residueGenerator, actual surjective residue over the zero ring too.
example : ∃ ρ : D₀ →ₗ[A] A,
    Function.Surjective ρ ∧ ρ (dualGenerator A γ δ s t) = 1 := by
  obtain ⟨ρ,hs,hg,-,-⟩ := dualResidue A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  exact ⟨ρ,hs,hg⟩

-- Existing test: residueInclusion, with the actual multiplication image.
example : ∃ ρ : D₀ →ₗ[A] A,
    Function.Surjective ρ ∧ ∀ r, ρ (dualMultiplication A γ δ s t r) = 0 := by
  obtain ⟨ρ,hs,-,-,hk⟩ := dualResidue A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  exact ⟨ρ,hs,fun r => (hk _).mpr ⟨r,dualMultiplicationApply A γ δ s t r⟩⟩

-- Existing non-example: residueNoRingSplit, proved for every nonzero coefficient ring.
example [Nontrivial A] (ρ : D₀ →ₗ[A] A) :
    let ev : R₀ →+* A := sectionEval A γ δ s t
    ¬ ∃ σ : A →ₗ[A] D₀,
      (∀ (r : R₀) (z : A), σ (ev r * z) = r • σ z) ∧
      Function.RightInverse σ ρ := by
  dsimp only
  rintro ⟨σ,hσ,hright⟩
  have hd := hσ d₀ 1
  have hev : sectionEval A γ δ s t d₀ = 0 := by
    simp [sectionEval,coefficientHom]
  rw [hev,zero_mul,map_zero] at hd
  have hz : σ 1 = 0 := by
    ext j
    apply sectionCoordinateRegular A γ δ s t
    change d₀ * σ 1 j = d₀ * 0
    have h := congrArg (fun h : D₀ => h j) hd
    simpa only [LinearMap.zero_apply,LinearMap.smul_apply,smul_eq_mul,mul_zero] using h.symm
  have h1 := hright 1
  rw [hz,map_zero] at h1
  exact zero_ne_one h1

-- New construction tests: multiplicationZero, multiplicationOne, multiplicationFaithful.
example : dualMultiplication A γ δ s t 0 = 0 := map_zero _
example (j : J₀) : dualMultiplication A γ δ s t 1 j = (j : R₀) := by
  simp only [dualMultiplicationApply,one_mul]
example (r : R₀) : dualMultiplication A γ δ s t r = 0 ↔ r = 0 := by
  rw [←(dualMultiplication A γ δ s t).map_zero]
  exact ⟨fun h => dualMultiplicationInjective A γ δ s t h, fun h => congrArg _ h⟩

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_coefficient_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_second_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_root_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_first_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_commutes
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_at_second
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_dualNumerator
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_decomposition
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalForm_exists
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_coordinates_unique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalForm
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplication
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplicationApply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquiv
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_action
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarAction
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidue
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquivInclusion
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquivGenerator
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidueGenerator
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidueInclusion
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplicationInjective

namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
noncomputable section
open scoped TensorProduct
variable (A : Type*) [CommRing A] (γ δ s t : A)
local notation "R₀" => Ring A γ δ s t
local notation "J₀" => (Ideal.span {AdjoinRoot.root (polynomial A γ δ s t) - coefficientHom A γ δ s t s,
  AdjoinRoot.of (polynomial A γ δ s t) (Polynomial.X : Polynomial A) - coefficientHom A γ δ s t t} : Ideal R₀)
local notation "D₀" => J₀ →ₗ[R₀] R₀

lemma sectionIdeal_coefficient_projective : Module.Projective A J₀ := by
  have : Module.Free A R₀ := (normalFormFree A γ δ s t).2
  exact Module.Projective.of_split (((J₀).subtype).restrictScalars A)
    (sectionProjection A γ δ s t) (by
      apply LinearMap.ext
      intro j
      exact sectionProjection_ideal A γ δ s t j)

lemma sectionIdeal_flat : Module.Flat A J₀ := by
  have := sectionIdeal_coefficient_projective A γ δ s t
  infer_instance

lemma sectionDual_coefficient_free : Module.Free A D₀ := by
  have : Module.Free A R₀ := (normalFormFree A γ δ s t).2
  obtain ⟨e,he⟩ := dualNormalEquiv A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t)
  exact Module.Free.of_equiv e.symm

lemma sectionDual_flat : Module.Flat A D₀ := by
  have := sectionDual_coefficient_free A γ δ s t
  infer_instance

lemma sectionProjection_lTensor_retraction (M : Type*) [AddCommGroup M] [Module A M] :
    ((sectionProjection A γ δ s t).lTensor M).comp
      ((((J₀).subtype).restrictScalars A).lTensor M) = LinearMap.id := by
  rw [← LinearMap.lTensor_comp]
  have h : (sectionProjection A γ δ s t).comp
      (((J₀).subtype).restrictScalars A) = LinearMap.id := by
    apply LinearMap.ext
    intro j
    exact sectionProjection_ideal A γ δ s t j
  rw [h]
  exact LinearMap.lTensor_id M J₀

lemma sectionIdeal_lTensor_injective (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective ((((J₀).subtype).restrictScalars A).lTensor M) := by
  intro x y h
  have hh := congrArg ((sectionProjection A γ δ s t).lTensor M) h
  simpa only [← LinearMap.comp_apply,
    sectionProjection_lTensor_retraction, LinearMap.id_apply] using hh


-- Coefficient projectivity is available over the nonreduced ring Z/4.
-- NodeSectionFactorization.PolynomialModel.coefficientProjectiveNonreduced
example : Module.Projective (ZMod 4)
    (Ideal.span {AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0) - coefficientHom (ZMod 4) 0 0 1 0 1,
      AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (Polynomial.X : Polynomial (ZMod 4)) -
        coefficientHom (ZMod 4) 0 0 1 0 0} : Ideal (Ring (ZMod 4) 0 0 1 0)) :=
  sectionIdeal_coefficient_projective (ZMod 4) 0 0 1 0

-- No nontriviality assumption is hidden in the coefficient-flatness proof.
-- NodeSectionFactorization.PolynomialModel.coefficientIdealFlatZero
example : Module.Flat (ZMod 1)
    (Ideal.span {AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0) - coefficientHom (ZMod 1) 0 0 0 0 0,
      AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (Polynomial.X : Polynomial (ZMod 1)) -
        coefficientHom (ZMod 1) 0 0 0 0 0} : Ideal (Ring (ZMod 1) 0 0 0 0)) :=
  sectionIdeal_flat (ZMod 1) 0 0 0 0

-- The actual dual is free over coefficients, including nonreduced coefficients.
-- NodeSectionFactorization.PolynomialModel.coefficientDualFreeNonreduced
example : Module.Free (ZMod 4)
    ((Ideal.span {AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0) - coefficientHom (ZMod 4) 0 0 1 0 1,
      AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (Polynomial.X : Polynomial (ZMod 4)) -
        coefficientHom (ZMod 4) 0 0 1 0 0} : Ideal (Ring (ZMod 4) 0 0 1 0)) →ₗ[Ring (ZMod 4) 0 0 1 0]
        Ring (ZMod 4) 0 0 1 0) :=
  sectionDual_coefficient_free (ZMod 4) 0 0 1 0

-- NodeSectionFactorization.PolynomialModel.coefficientDualFlatZero
example : Module.Flat (ZMod 1)
    ((Ideal.span {AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0) - coefficientHom (ZMod 1) 0 0 0 0 0,
      AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (Polynomial.X : Polynomial (ZMod 1)) -
        coefficientHom (ZMod 1) 0 0 0 0 0} : Ideal (Ring (ZMod 1) 0 0 0 0)) →ₗ[Ring (ZMod 1) 0 0 0 0]
        Ring (ZMod 1) 0 0 0 0) :=
  sectionDual_flat (ZMod 1) 0 0 0 0

-- Tensoring the inclusion with the torsion Z-module Z/2 stays injective.
-- NodeSectionFactorization.PolynomialModel.tensorInclusionTorsion
example : Function.Injective
    ((((Ideal.span {AdjoinRoot.root (polynomial ℤ 0 0 0 0) - coefficientHom ℤ 0 0 0 0 0,
      AdjoinRoot.of (polynomial ℤ 0 0 0 0) (Polynomial.X : Polynomial ℤ) - coefficientHom ℤ 0 0 0 0 0} :
        Ideal (Ring ℤ 0 0 0 0)).subtype).restrictScalars ℤ).lTensor (ZMod 2)) :=
  sectionIdeal_lTensor_injective ℤ 0 0 0 0 (ZMod 2)

-- Retraction holds pointwise on every tensor, without assuming M is flat.
-- NodeSectionFactorization.PolynomialModel.tensorRetractionPointwise
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] J₀) :
    ((sectionProjection A γ δ s t).lTensor M)
      ((((J₀).subtype).restrictScalars A).lTensor M z) = z := by
  change (((sectionProjection A γ δ s t).lTensor M).comp
    ((((J₀).subtype).restrictScalars A).lTensor M)) z = z
  rw [sectionProjection_lTensor_retraction]
  rfl

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_coefficient_projective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_flat
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDual_coefficient_free
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDual_flat
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_lTensor_retraction
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_lTensor_injective

namespace TauCeti.ModuliCurves.NodeSectionFactorization
variable {R : Type*} [CommRing R]
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
end TauCeti.ModuliCurves.NodeSectionFactorization

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
  let p := (E₀ x).1
  let q := (E₀ x).2
  let α := q.eval t
  have hpval : p.eval t = (s + γ*t)*α := by
    have he := congrArg (fun z : R₀ => ((E₀ z).2).eval t) h
    rw [polynomialCoordinates_first_mul,polynomialCoordinates_second_mul] at he
    simp only [eval_sub,eval_add,eval_mul,eval_C,eval_X,sub_self,zero_mul] at he
    exact sub_eq_zero.mp he
  obtain ⟨p₀,hp₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := p) (a := t)
  obtain ⟨q₀,hq₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := q) (a := t)
  let r := AdjoinRoot.of F₀ p₀ + u₀ * AdjoinRoot.of F₀ q₀
  have hr : E₀ r = (p₀,q₀) := by
    simpa only [polynomialCoordinates_symm] using (E₀).apply_symm_apply (p₀,q₀)
  have hx : x = d₀ * r + ι₀ α * b₀ := by
    apply (E₀).injective
    rw [map_add,polynomialCoordinates_second_mul]
    change E₀ x = ((X-C t)*(E₀ r).1,(X-C t)*(E₀ r).2) +
      E₀ (AdjoinRoot.of F₀ (C α) * b₀)
    rw [polynomialCoordinates_coefficient_mul,polynomialCoordinates_dualNumerator,hr]
    apply Prod.ext
    · change p = (X-C t)*p₀ + C α * C (s+γ*t)
      rw [hpval] at hp₀
      rw [←hp₀,←map_mul]
      ring
    · change q = (X-C t)*q₀ + C α * 1
      rw [mul_one,←hq₀]
      exact (sub_add_cancel _ _).symm
  refine ⟨r,α,hx,?_⟩
  apply sectionCoordinateRegular A γ δ s t
  change d₀ * y = d₀ * (c₀ * r - ι₀ α * a₀)
  rw [hx] at h
  linear_combination -h + ι₀ α * sectionRelation A γ δ s t

lemma polynomialCoordinates_first : E₀ c₀ = (-C s,1) := by
  rw [map_sub,polynomialCoordinates_root]
  change (0,1) - E₀ (AdjoinRoot.of F₀ (C s)) = _
  rw [polynomialCoordinates_of]
  simp

lemma polynomialCoordinates_numerator_mul (r : R₀) :
    (E₀ (b₀ * r)).2 = (E₀ r).1 + (C (s+γ*t) - C γ * X) * (E₀ r).2 := by
  have hb : b₀ = u₀ + AdjoinRoot.of F₀ (C (s+γ*t)) := by
    simp only [map_add,map_mul,coefficientHom,RingHom.comp_apply]
    ring
  rw [hb,add_mul,map_add,polynomialCoordinates_root_mul,polynomialCoordinates_coefficient_mul]
  change (E₀ r).1-(C γ*X)*(E₀ r).2+C (s+γ*t)*(E₀ r).2 = _
  ring

lemma sectionDualSyzygy (x y : R₀) (h : d₀ * x = b₀ * y) :
    ∃ r : R₀, ∃ α : A,
      x = b₀ * r - ι₀ α * a₀ ∧ y = d₀ * r + ι₀ α * c₀ := by
  let p := (E₀ y).1
  let q := (E₀ y).2
  let α := q.eval t
  have hpval : p.eval t = -s*α := by
    have he := congrArg (fun z : R₀ => ((E₀ z).2).eval t) h
    rw [polynomialCoordinates_second_mul,polynomialCoordinates_numerator_mul] at he
    simp only [eval_sub,eval_add,eval_mul,eval_C,eval_X,sub_self,zero_mul] at he
    change 0 = p.eval t + (s+γ*t-γ*t)*α at he
    linear_combination -he
  obtain ⟨p₀,hp₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := p) (a := t)
  obtain ⟨q₀,hq₀⟩ := Polynomial.X_sub_C_dvd_sub_C_eval (p := q) (a := t)
  let r := AdjoinRoot.of F₀ p₀ + u₀ * AdjoinRoot.of F₀ q₀
  have hr : E₀ r = (p₀,q₀) := by
    simpa only [polynomialCoordinates_symm] using (E₀).apply_symm_apply (p₀,q₀)
  have hy : y = d₀ * r + ι₀ α * c₀ := by
    apply (E₀).injective
    rw [map_add,polynomialCoordinates_second_mul]
    change E₀ y = ((X-C t)*(E₀ r).1,(X-C t)*(E₀ r).2) +
      E₀ (AdjoinRoot.of F₀ (C α) * c₀)
    rw [polynomialCoordinates_coefficient_mul,polynomialCoordinates_first,hr]
    apply Prod.ext
    · change p = (X-C t)*p₀ + C α * (-C s)
      rw [hpval] at hp₀
      rw [←hp₀,map_mul,map_neg]
      ring
    · change q = (X-C t)*q₀ + C α * 1
      rw [mul_one,←hq₀]
      exact (sub_add_cancel _ _).symm
  refine ⟨r,α,?_,hy⟩
  apply sectionCoordinateRegular A γ δ s t
  change d₀ * x = d₀ * (b₀ * r - ι₀ α * a₀)
  rw [hy] at h
  linear_combination h + ι₀ α * sectionRelation A γ δ s t

def idealPresentation : (Fin 2 → R₀) →ₗ[R₀] J₀ where
  toFun z := ⟨c₀*z 0-d₀*z 1, Ideal.mem_span_pair.mpr ⟨z 0,-z 1,by ring⟩⟩
  map_add' z w := by
    apply Subtype.ext
    change c₀*(z 0+w 0)-d₀*(z 1+w 1) = (c₀*z 0-d₀*z 1)+(c₀*w 0-d₀*w 1)
    ring
  map_smul' r z := by
    apply Subtype.ext
    change c₀*(r*z 0)-d₀*(r*z 1) = r*(c₀*z 0-d₀*z 1)
    ring

lemma idealPresentation_apply (z : Fin 2 → R₀) :
    (idealPresentation A γ δ s t z : R₀) = c₀*z 0-d₀*z 1 := rfl

lemma idealPresentation_surjective : Function.Surjective (idealPresentation A γ δ s t) := by
  intro j
  obtain ⟨x,y,hj⟩ := Ideal.mem_span_pair.mp j.property
  refine ⟨![x,-y],?_⟩
  apply Subtype.ext
  rw [idealPresentation_apply]
  simp only [Matrix.cons_val_zero,Matrix.cons_val_one]
  linear_combination hj

lemma right_mulVec (z : Fin 2 → R₀) :
    (Ψ₀).mulVecLin z = ![d₀*z 0-b₀*z 1,c₀*z 0+a₀*z 1] := by
  ext i
  fin_cases i
  · simp [right,Matrix.mulVec,dotProduct,Fin.sum_univ_two]
    ring
  · simp [right,Matrix.mulVec,dotProduct,Fin.sum_univ_two]

lemma left_mulVec (z : Fin 2 → R₀) :
    (Φ₀).mulVecLin z = ![a₀*z 0+b₀*z 1,-c₀*z 0+d₀*z 1] := by
  ext i
  fin_cases i <;> simp [left,Matrix.mulVec,dotProduct,Fin.sum_univ_two]

lemma idealPresentation_kernel :
    LinearMap.ker (idealPresentation A γ δ s t) = LinearMap.range (Ψ₀).mulVecLin := by
  ext z
  simp only [LinearMap.mem_ker,LinearMap.mem_range]
  constructor
  · intro hz
    have h : c₀*z 0 = d₀*z 1 := by
      have hh := congrArg (fun j : J₀ => (j : R₀)) hz
      change c₀*z 0-d₀*z 1=0 at hh
      exact sub_eq_zero.mp hh
    obtain ⟨r,α,hx,hy⟩ := sectionIdealSyzygy A γ δ s t (z 0) (z 1) h
    refine ⟨![r,-ι₀ α],?_⟩
    rw [right_mulVec]
    ext i
    fin_cases i
    · change d₀*r-b₀*(-ι₀ α)=z 0
      linear_combination -hx
    · change c₀*r+a₀*(-ι₀ α)=z 1
      linear_combination -hy
  · rintro ⟨w,rfl⟩
    apply Subtype.ext
    rw [idealPresentation_apply,right_mulVec]
    simp only [Matrix.cons_val_zero,Matrix.cons_val_one]
    change c₀*(d₀*w 0-b₀*w 1)-d₀*(c₀*w 0+a₀*w 1)=0
    linear_combination -(w 1)*sectionRelation A γ δ s t

def dualPresentation : (Fin 2 → R₀) →ₗ[R₀] D₀ where
  toFun z := dualMultiplication A γ δ s t (z 0) - z 1 • dualGenerator A γ δ s t
  map_add' z w := by
    ext j
    change (z 0+w 0)*(j : R₀)-(z 1+w 1)*dualGenerator A γ δ s t j =
      (z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j)+
      (w 0*(j : R₀)-w 1*dualGenerator A γ δ s t j)
    ring
  map_smul' r z := by
    ext j
    change (r*z 0)*(j : R₀)-(r*z 1)*dualGenerator A γ δ s t j =
      r*(z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j)
    ring

lemma dualPresentation_apply (z : Fin 2 → R₀) (j : J₀) :
    dualPresentation A γ δ s t z j = z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j := rfl

lemma dualPresentation_surjective : Function.Surjective (dualPresentation A γ δ s t) := by
  intro h
  obtain ⟨z,hz,-⟩ := dualNormalForm A γ δ s t
    (dualGenerator A γ δ s t) (dualGenerator_spec A γ δ s t) h
  refine ⟨![z.1,-ι₀ z.2],?_⟩
  ext j
  rw [dualPresentation_apply]
  simp only [Matrix.cons_val_zero,Matrix.cons_val_one]
  linear_combination -hz j

lemma dualPresentation_zero_iff (z : Fin 2 → R₀) :
    dualPresentation A γ δ s t z = 0 ↔ d₀*z 0=b₀*z 1 := by
  constructor
  · intro hz
    have hd := congrArg (fun h : D₀ => h ⟨d₀,sectionSecond_mem A γ δ s t⟩) hz
    rw [dualPresentation_apply,(dualGeneratorValues A γ δ s t _
      (dualGenerator_spec A γ δ s t)).2] at hd
    change z 0*d₀-z 1*b₀=0 at hd
    linear_combination hd
  · intro hz
    ext j
    apply sectionCoordinateRegular A γ δ s t
    rw [dualPresentation_apply]
    change d₀*(z 0*(j : R₀)-z 1*dualGenerator A γ δ s t j)=d₀*0
    linear_combination (j : R₀)*hz - z 1*dualGenerator_spec A γ δ s t j

lemma dualPresentation_kernel :
    LinearMap.ker (dualPresentation A γ δ s t) = LinearMap.range (Φ₀).mulVecLin := by
  ext z
  simp only [LinearMap.mem_ker,LinearMap.mem_range,dualPresentation_zero_iff]
  constructor
  · intro hz
    obtain ⟨r,α,hx,hy⟩ := sectionDualSyzygy A γ δ s t (z 0) (z 1) hz
    refine ⟨![-ι₀ α,r],?_⟩
    rw [left_mulVec]
    ext i
    fin_cases i
    · change a₀*(-ι₀ α)+b₀*r=z 0
      linear_combination -hx
    · change -c₀*(-ι₀ α)+d₀*r=z 1
      linear_combination -hy
  · rintro ⟨w,rfl⟩
    rw [left_mulVec]
    simp only [Matrix.cons_val_zero,Matrix.cons_val_one]
    linear_combination (w 0)*sectionRelation A γ δ s t

theorem cokernelIdeal :
    ∃ e : ((Fin 2 → R₀) ⧸ LinearMap.range (Ψ₀).mulVecLin) ≃ₗ[R₀] J₀,
      ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀*z 0-d₀*z 1 := by
  let e := (Submodule.quotEquivOfEq _ _ (idealPresentation_kernel A γ δ s t).symm).trans
    ((idealPresentation A γ δ s t).quotKerEquivOfSurjective
      (idealPresentation_surjective A γ δ s t))
  refine ⟨e,?_⟩
  intro z
  simp only [e,LinearEquiv.trans_apply,Submodule.quotEquivOfEq_mk,
    LinearMap.quotKerEquivOfSurjective_apply_mk,idealPresentation_apply]

theorem cokernelIdealGenerators
    (e : ((Fin 2 → R₀) ⧸ LinearMap.range (Ψ₀).mulVecLin) ≃ₗ[R₀] J₀)
    (he : ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀*z 0-d₀*z 1) :
    (e (Submodule.Quotient.mk (fun i => if i=0 then 1 else 0)) : R₀) = c₀ ∧
    (e (Submodule.Quotient.mk (fun i => if i=0 then 0 else 1)) : R₀) = -d₀ := by
  constructor <;> rw [he] <;> simp

theorem cokernelIdealUnique
    (e f : ((Fin 2 → R₀) ⧸ LinearMap.range (Ψ₀).mulVecLin) ≃ₗ[R₀] J₀)
    (he : ∀ z : Fin 2 → R₀, (e (Submodule.Quotient.mk z) : R₀) = c₀*z 0-d₀*z 1)
    (hf : ∀ z : Fin 2 → R₀, (f (Submodule.Quotient.mk z) : R₀) = c₀*z 0-d₀*z 1) : e=f := by
  apply LinearEquiv.toLinearMap_injective
  apply LinearMap.ext
  intro z
  induction z using Submodule.Quotient.induction_on
  rename_i z
  apply Subtype.ext
  exact (he z).trans (hf z).symm

theorem cokernelDual :
    ∃ e : ((Fin 2 → R₀) ⧸ LinearMap.range (Φ₀).mulVecLin) ≃ₗ[R₀] D₀,
      ∀ (z : Fin 2 → R₀) (j : J₀),
        d₀*e (Submodule.Quotient.mk z) j = (d₀*z 0-b₀*z 1)*(j : R₀) := by
  let e := (Submodule.quotEquivOfEq _ _ (dualPresentation_kernel A γ δ s t).symm).trans
    ((dualPresentation A γ δ s t).quotKerEquivOfSurjective
      (dualPresentation_surjective A γ δ s t))
  refine ⟨e,?_⟩
  intro z j
  simp only [e,LinearEquiv.trans_apply,Submodule.quotEquivOfEq_mk,
    LinearMap.quotKerEquivOfSurjective_apply_mk,dualPresentation_apply]
  linear_combination -z 1*dualGenerator_spec A γ δ s t j

theorem cokernelDualGenerators (ε : D₀)
    (hε : ∀ j : J₀, d₀*ε j=b₀*(j : R₀))
    (e : ((Fin 2 → R₀) ⧸ LinearMap.range (Φ₀).mulVecLin) ≃ₗ[R₀] D₀)
    (he : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀*e (Submodule.Quotient.mk z) j=(d₀*z 0-b₀*z 1)*(j : R₀)) :
    (∀ j : J₀, e (Submodule.Quotient.mk (fun i => if i=0 then 1 else 0)) j=(j : R₀)) ∧
    e (Submodule.Quotient.mk (fun i => if i=0 then 0 else 1)) = -ε := by
  constructor
  · intro j
    apply sectionCoordinateRegular A γ δ s t
    dsimp only
    rw [he]
    simp
  · ext j
    apply sectionCoordinateRegular A γ δ s t
    dsimp only
    rw [he]
    change (d₀*0-b₀*1)*(j : R₀)=d₀*(-ε j)
    linear_combination hε j

theorem cokernelDualUnique
    (e f : ((Fin 2 → R₀) ⧸ LinearMap.range (Φ₀).mulVecLin) ≃ₗ[R₀] D₀)
    (he : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀*e (Submodule.Quotient.mk z) j=(d₀*z 0-b₀*z 1)*(j : R₀))
    (hf : ∀ (z : Fin 2 → R₀) (j : J₀),
      d₀*f (Submodule.Quotient.mk z) j=(d₀*z 0-b₀*z 1)*(j : R₀)) : e=f := by
  apply LinearEquiv.toLinearMap_injective
  apply LinearMap.ext
  intro z
  induction z using Submodule.Quotient.induction_on
  rename_i z
  ext j
  apply sectionCoordinateRegular A γ δ s t
  dsimp only
  exact (he z j).trans (hf z j).symm

lemma quotientLeftExact : LinearMap.ker (Φ₀).mulVecLin = LinearMap.range (Ψ₀).mulVecLin := by
  rw [←idealPresentation_kernel]
  ext z
  simp only [LinearMap.mem_ker]
  constructor
  · intro hz
    have hh := congrArg (fun w : Fin 2 → R₀ => w 1) hz
    rw [left_mulVec] at hh
    apply Subtype.ext
    rw [idealPresentation_apply]
    change c₀*z 0-d₀*z 1=0
    change -c₀*z 0+d₀*z 1=0 at hh
    linear_combination -hh
  · intro hz
    have hrange : z ∈ LinearMap.range (Ψ₀).mulVecLin := by
      rw [←idealPresentation_kernel]
      exact hz
    obtain ⟨w,rfl⟩ := hrange
    rw [right_mulVec,left_mulVec]
    ext i
    fin_cases i
    · change a₀*(d₀*w 0-b₀*w 1)+b₀*(c₀*w 0+a₀*w 1)=0
      linear_combination (w 0)*sectionRelation A γ δ s t
    · change -c₀*(d₀*w 0-b₀*w 1)+d₀*(c₀*w 0+a₀*w 1)=0
      linear_combination (w 1)*sectionRelation A γ δ s t

lemma quotientRightExact : LinearMap.ker (Ψ₀).mulVecLin = LinearMap.range (Φ₀).mulVecLin := by
  rw [←dualPresentation_kernel]
  ext z
  simp only [LinearMap.mem_ker,dualPresentation_zero_iff]
  constructor
  · intro hz
    have hh := congrArg (fun w : Fin 2 → R₀ => w 0) hz
    rw [right_mulVec] at hh
    change d₀*z 0-b₀*z 1=0 at hh
    exact sub_eq_zero.mp hh
  · intro hz
    have hrange : z ∈ LinearMap.range (Φ₀).mulVecLin := by
      rw [←dualPresentation_kernel]
      exact (dualPresentation_zero_iff A γ δ s t z).mpr hz
    obtain ⟨w,rfl⟩ := hrange
    rw [left_mulVec,right_mulVec]
    ext i
    fin_cases i
    · change d₀*(a₀*w 0+b₀*w 1)-b₀*(-c₀*w 0+d₀*w 1)=0
      linear_combination (w 0)*sectionRelation A γ δ s t
    · change c₀*(a₀*w 0+b₀*w 1)+a₀*(-c₀*w 0+d₀*w 1)=0
      linear_combination (w 1)*sectionRelation A γ δ s t

lemma transposeLeft_mulVec (z : Fin 2 → R₀) :
    ((Φ₀).transpose).mulVecLin z = ![a₀*z 0-c₀*z 1,b₀*z 0+d₀*z 1] := by
  ext i
  fin_cases i
  · simp [left,Matrix.vecMul,dotProduct,Fin.sum_univ_two,sub_eq_add_neg]
    ring
  · simp [left,Matrix.vecMul,dotProduct,Fin.sum_univ_two]
    ring

lemma transposeRight_mulVec (z : Fin 2 → R₀) :
    ((Ψ₀).transpose).mulVecLin z = ![d₀*z 0+c₀*z 1,-b₀*z 0+a₀*z 1] := by
  ext i
  fin_cases i
  · simp [right,Matrix.vecMul,dotProduct,Fin.sum_univ_two]
    ring
  · simp [right,Matrix.vecMul,dotProduct,Fin.sum_univ_two]
    ring

lemma quotientTransposeLeftExact :
    LinearMap.ker ((Φ₀).transpose).mulVecLin = LinearMap.range ((Ψ₀).transpose).mulVecLin := by
  ext z
  simp only [LinearMap.mem_ker,LinearMap.mem_range]
  constructor
  · intro hz
    have hh := congrArg (fun w : Fin 2 → R₀ => w 1) hz
    rw [transposeLeft_mulVec] at hh
    have h : d₀*(-z 1)=b₀*z 0 := by
      change b₀*z 0+d₀*z 1=0 at hh
      linear_combination -hh
    obtain ⟨r,α,hx,hy⟩ := sectionDualSyzygy A γ δ s t (-z 1) (z 0) h
    refine ⟨![r,ι₀ α],?_⟩
    rw [transposeRight_mulVec]
    ext i
    fin_cases i
    · change d₀*r+c₀*ι₀ α=z 0
      linear_combination -hy
    · change -b₀*r+a₀*ι₀ α=z 1
      linear_combination hx
  · rintro ⟨w,rfl⟩
    rw [transposeRight_mulVec,transposeLeft_mulVec]
    ext i
    fin_cases i
    · change a₀*(d₀*w 0+c₀*w 1)-c₀*(-b₀*w 0+a₀*w 1)=0
      linear_combination (w 0)*sectionRelation A γ δ s t
    · change b₀*(d₀*w 0+c₀*w 1)+d₀*(-b₀*w 0+a₀*w 1)=0
      linear_combination (w 1)*sectionRelation A γ δ s t

lemma quotientTransposeRightExact :
    LinearMap.ker ((Ψ₀).transpose).mulVecLin = LinearMap.range ((Φ₀).transpose).mulVecLin := by
  ext z
  simp only [LinearMap.mem_ker,LinearMap.mem_range]
  constructor
  · intro hz
    have hh := congrArg (fun w : Fin 2 → R₀ => w 0) hz
    rw [transposeRight_mulVec] at hh
    have h : c₀*(-z 1)=d₀*z 0 := by
      change d₀*z 0+c₀*z 1=0 at hh
      linear_combination -hh
    obtain ⟨r,α,hx,hy⟩ := sectionIdealSyzygy A γ δ s t (-z 1) (z 0) h
    refine ⟨![-ι₀ α,-r],?_⟩
    rw [transposeLeft_mulVec]
    ext i
    fin_cases i
    · change a₀*(-ι₀ α)-c₀*(-r)=z 0
      linear_combination -hy
    · change b₀*(-ι₀ α)+d₀*(-r)=z 1
      linear_combination hx
  · rintro ⟨w,rfl⟩
    rw [transposeLeft_mulVec,transposeRight_mulVec]
    ext i
    fin_cases i
    · change d₀*(a₀*w 0-c₀*w 1)+c₀*(b₀*w 0+d₀*w 1)=0
      linear_combination (w 0)*sectionRelation A γ δ s t
    · change -b₀*(a₀*w 0-c₀*w 1)+a₀*(b₀*w 0+d₀*w 1)=0
      linear_combination (w 1)*sectionRelation A γ δ s t

theorem quotientExact :
    LinearMap.ker (Φ₀).mulVecLin = LinearMap.range (Ψ₀).mulVecLin ∧
    LinearMap.ker (Ψ₀).mulVecLin = LinearMap.range (Φ₀).mulVecLin ∧
    LinearMap.ker ((Φ₀).transpose).mulVecLin = LinearMap.range ((Ψ₀).transpose).mulVecLin ∧
    LinearMap.ker ((Ψ₀).transpose).mulVecLin = LinearMap.range ((Φ₀).transpose).mulVecLin :=
  ⟨quotientLeftExact A γ δ s t,quotientRightExact A γ δ s t,
    quotientTransposeLeftExact A γ δ s t,quotientTransposeRightExact A γ δ s t⟩

-- NodeSectionFactorization.PolynomialModel.idealPresentationFirst
example : (idealPresentation A γ δ s t ![1,0] : R₀)=c₀ := by
  simp [idealPresentation_apply]
-- NodeSectionFactorization.PolynomialModel.idealPresentationSecond
example : (idealPresentation A γ δ s t ![0,1] : R₀)=-d₀ := by
  simp [idealPresentation_apply]
-- NodeSectionFactorization.PolynomialModel.idealPresentationZero
example : idealPresentation A γ δ s t 0=0 := map_zero _
-- NodeSectionFactorization.PolynomialModel.dualPresentationFirst
example (j : J₀) : dualPresentation A γ δ s t ![1,0] j=(j : R₀) := by
  simp [dualPresentation_apply]
-- NodeSectionFactorization.PolynomialModel.dualPresentationSecond
example : dualPresentation A γ δ s t ![0,1] = -dualGenerator A γ δ s t := by
  ext j
  simp [dualPresentation_apply]
-- NodeSectionFactorization.PolynomialModel.dualPresentationZero
example : dualPresentation A γ δ s t 0=0 := map_zero _
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
  dsimp only
  obtain ⟨e,he⟩ := cokernelIdeal (ZMod 4) 0 0 1 0
  exact ⟨e,cokernelIdealGenerators (ZMod 4) 0 0 1 0 e he⟩
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
  dsimp only
  obtain ⟨e,he⟩ := cokernelDual (ZMod 3) 1 0 0 0
  exact ⟨e,(cokernelDualGenerators (ZMod 3) 1 0 0 0 _
    (dualGenerator_spec (ZMod 3) 1 0 0 0) e he).2⟩
-- NodeSectionFactorization.PolynomialModel.actualIdealCokernelZeroBase
example :
    let B := Ring (ZMod 1) 0 0 0 0
    let ι := coefficientHom (ZMod 1) 0 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (X : Polynomial (ZMod 1))
    let β := right (ι 0) (ι 0) u v (ι 0) (ι 0)
    Nonempty (((Fin 2 → B) ⧸ LinearMap.range β.mulVecLin) ≃ₗ[B] Ideal.span {u-ι 0,v-ι 0}) := by
  obtain ⟨e,-⟩ := cokernelIdeal (ZMod 1) 0 0 0 0
  exact ⟨e⟩
-- NodeSectionFactorization.PolynomialModel.actualDualCokernelCharacteristicTwo
example :
    let B := Ring (ZMod 2) 1 0 0 0
    let ι := coefficientHom (ZMod 2) 1 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 2) 1 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 2) 1 0 0 0) (X : Polynomial (ZMod 2))
    let α := left (ι 1) (ι 0) u v (ι 0) (ι 0)
    Nonempty (((Fin 2 → B) ⧸ LinearMap.range α.mulVecLin) ≃ₗ[B]
      (Ideal.span {u-ι 0,v-ι 0} →ₗ[B] B)) := by
  obtain ⟨e,-⟩ := cokernelDual (ZMod 2) 1 0 0 0
  exact ⟨e⟩
-- NodeSectionFactorization.PolynomialModel.actualComplexNonreduced
example :
    let ι := coefficientHom (ZMod 4) 0 0 1 0
    let u := AdjoinRoot.root (polynomial (ZMod 4) 0 0 1 0)
    let v := AdjoinRoot.of (polynomial (ZMod 4) 0 0 1 0) (X : Polynomial (ZMod 4))
    let α := left (ι 0) (ι 0) u v (ι 1) (ι 0)
    let β := right (ι 0) (ι 0) u v (ι 1) (ι 0)
    LinearMap.ker α.mulVecLin=LinearMap.range β.mulVecLin ∧
      LinearMap.ker β.transpose.mulVecLin=LinearMap.range α.transpose.mulVecLin := by
  have h := quotientExact (ZMod 4) 0 0 1 0
  exact ⟨h.1,h.2.2.2⟩
-- NodeSectionFactorization.PolynomialModel.actualComplexZeroBase
example :
    let ι := coefficientHom (ZMod 1) 0 0 0 0
    let u := AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)
    let v := AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) (X : Polynomial (ZMod 1))
    let α := left (ι 0) (ι 0) u v (ι 0) (ι 0)
    let β := right (ι 0) (ι 0) u v (ι 0) (ι 0)
    LinearMap.ker β.mulVecLin=LinearMap.range α.mulVecLin :=
  (quotientExact (ZMod 1) 0 0 0 0).2.1

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.left
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.right
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealSyzygy
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_first
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_numerator_mul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualSyzygy
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_surjective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.right_mulVec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.left_mulVec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_kernel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_surjective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_zero_iff
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_kernel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdeal
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdealGenerators
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdealUnique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDual
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDualGenerators
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDualUnique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientLeftExact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientRightExact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_mulVec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_mulVec
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeLeftExact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeRightExact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientExact

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
  have : Module.Flat A D₀ := sectionDual_flat A γ δ s t
  apply LinearMap.lTensor_injective_of_exact_of_flat
    ((dualPresentation A γ δ s t).restrictScalars A)
    (dualPresentation_surjective A γ δ s t)
    (LinearMap.range ΦA).subtype (Submodule.injective_subtype _)
  intro z
  constructor
  · intro hz
    have h : z ∈ LinearMap.range (Φ₀).mulVecLin := by
      rw [← dualPresentation_kernel A γ δ s t]
      exact hz
    exact ⟨⟨z,h⟩,rfl⟩
  · rintro ⟨w,rfl⟩
    have h : (w : Fin 2 → R₀) ∈ LinearMap.ker (dualPresentation A γ δ s t) := by
      rw [dualPresentation_kernel A γ δ s t]
      exact w.property
    exact h

lemma rightImage_lTensor_injective (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Injective ((LinearMap.range ΨA).subtype.lTensor M) := by
  have : Module.Flat A J₀ := sectionIdeal_flat A γ δ s t
  apply LinearMap.lTensor_injective_of_exact_of_flat
    ((idealPresentation A γ δ s t).restrictScalars A)
    (idealPresentation_surjective A γ δ s t)
    (LinearMap.range ΨA).subtype (Submodule.injective_subtype _)
  intro z
  constructor
  · intro hz
    have h : z ∈ LinearMap.range (Ψ₀).mulVecLin := by
      rw [← idealPresentation_kernel A γ δ s t]
      exact hz
    exact ⟨⟨z,h⟩,rfl⟩
  · rintro ⟨w,rfl⟩
    have h : (w : Fin 2 → R₀) ∈ LinearMap.ker (idealPresentation A γ δ s t) := by
      rw [idealPresentation_kernel A γ δ s t]
      exact w.property
    exact h

lemma quotientLeft_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨA).lTensor M) ((ΦA).lTensor M) := by
  have h : Function.Exact ΨA ΦA :=
    (LinearMap.exact_iff.mpr (quotientLeftExact A γ δ s t) :
      Function.Exact (Ψ₀).mulVecLin (Φ₀).mulVecLin)
  have hr : Function.Exact ΨA (ΦA).rangeRestrict := by
    rw [LinearMap.exact_iff,LinearMap.ker_rangeRestrict]
    exact LinearMap.exact_iff.mp h
  have ht := _root_.lTensor_exact M hr (ΦA).surjective_rangeRestrict
  have he : Function.Exact ((ΨA).lTensor M)
      (((LinearMap.range ΦA).subtype.lTensor M).comp ((ΦA).rangeRestrict.lTensor M)) :=
    (leftImage_lTensor_injective A γ δ s t M).comp_exact_iff_exact.mpr ht
  have hf : ((LinearMap.range ΦA).subtype.lTensor M).comp ((ΦA).rangeRestrict.lTensor M) =
      (ΦA).lTensor M := by
    rw [←LinearMap.lTensor_comp,LinearMap.subtype_comp_rangeRestrict]
  rwa [hf] at he

lemma quotientRight_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦA).lTensor M) ((ΨA).lTensor M) := by
  have h : Function.Exact ΦA ΨA :=
    (LinearMap.exact_iff.mpr (quotientRightExact A γ δ s t) :
      Function.Exact (Φ₀).mulVecLin (Ψ₀).mulVecLin)
  have hr : Function.Exact ΦA (ΨA).rangeRestrict := by
    rw [LinearMap.exact_iff,LinearMap.ker_rangeRestrict]
    exact LinearMap.exact_iff.mp h
  have ht := _root_.lTensor_exact M hr (ΨA).surjective_rangeRestrict
  have he : Function.Exact ((ΦA).lTensor M)
      (((LinearMap.range ΨA).subtype.lTensor M).comp ((ΨA).rangeRestrict.lTensor M)) :=
    (rightImage_lTensor_injective A γ δ s t M).comp_exact_iff_exact.mpr ht
  have hf : ((LinearMap.range ΨA).subtype.lTensor M).comp ((ΨA).rangeRestrict.lTensor M) =
      (ΨA).lTensor M := by
    rw [←LinearMap.lTensor_comp,LinearMap.subtype_comp_rangeRestrict]
  rwa [hf] at he
open TensorProduct

def sectionRotation : (Fin 2 → R₀) ≃ₗ[R₀] (Fin 2 → R₀) where
  toFun z := ![-z 1,z 0]
  invFun z := ![z 1,-z 0]
  left_inv z := by ext i; fin_cases i <;> simp
  right_inv z := by ext i; fin_cases i <;> simp
  map_add' z w := by ext i; fin_cases i <;> simp [add_comm]
  map_smul' r z := by ext i; fin_cases i <;> simp

lemma sectionRotation_apply (z : Fin 2 → R₀) :
    sectionRotation A γ δ s t z = ![-z 1,z 0] := rfl
lemma sectionRotation_symm_apply (z : Fin 2 → R₀) :
    (sectionRotation A γ δ s t).symm z = ![z 1,-z 0] := rfl
lemma sectionRotation_square (z : Fin 2 → R₀) :
    sectionRotation A γ δ s t (sectionRotation A γ δ s t z) = -z := by
  ext i
  fin_cases i <;> simp [sectionRotation_apply]

lemma transposeLeft_rotation :
    ((Φ₀).transpose).mulVecLin.comp (sectionRotation A γ δ s t).toLinearMap =
      (sectionRotation A γ δ s t).toLinearMap.comp (Ψ₀).mulVecLin := by
  apply LinearMap.ext
  intro z
  change ((Φ₀).transpose).mulVecLin (sectionRotation A γ δ s t z) =
    sectionRotation A γ δ s t ((Ψ₀).mulVecLin z)
  rw [sectionRotation_apply,transposeLeft_mulVec,right_mulVec,sectionRotation_apply]
  ext i
  fin_cases i <;> simp <;> ring
lemma transposeRight_rotation :
    ((Ψ₀).transpose).mulVecLin.comp (sectionRotation A γ δ s t).toLinearMap =
      (sectionRotation A γ δ s t).toLinearMap.comp (Φ₀).mulVecLin := by
  apply LinearMap.ext
  intro z
  change ((Ψ₀).transpose).mulVecLin (sectionRotation A γ δ s t z) =
    sectionRotation A γ δ s t ((Φ₀).mulVecLin z)
  rw [sectionRotation_apply,transposeRight_mulVec,left_mulVec,sectionRotation_apply]
  ext i
  fin_cases i <;> simp <;> ring

local notation "ΦTA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Matrix.transpose (Φ₀))))
local notation "ΨTA" => (LinearMap.restrictScalars A (Matrix.mulVecLin (Matrix.transpose (Ψ₀))))
local notation "pA" => (LinearEquiv.restrictScalars A (sectionRotation A γ δ s t))

lemma transposeLeft_lTensor_rotation (M : Type*) [AddCommGroup M] [Module A M] :
    ((ΦTA).lTensor M).comp ((pA).lTensor M).toLinearMap =
      ((pA).lTensor M).toLinearMap.comp ((ΨA).lTensor M) := by
  have h : (ΦTA).comp (pA).toLinearMap = (pA).toLinearMap.comp ΨA := by
    apply LinearMap.ext
    intro z
    exact LinearMap.congr_fun (transposeLeft_rotation A γ δ s t) z
  simpa only [LinearMap.lTensor_comp,LinearEquiv.coe_lTensor] using
    congrArg (LinearMap.lTensor M) h

lemma transposeRight_lTensor_rotation (M : Type*) [AddCommGroup M] [Module A M] :
    ((ΨTA).lTensor M).comp ((pA).lTensor M).toLinearMap =
      ((pA).lTensor M).toLinearMap.comp ((ΦA).lTensor M) := by
  have h : (ΨTA).comp (pA).toLinearMap = (pA).toLinearMap.comp ΦA := by
    apply LinearMap.ext
    intro z
    exact LinearMap.congr_fun (transposeRight_rotation A γ δ s t) z
  simpa only [LinearMap.lTensor_comp,LinearEquiv.coe_lTensor] using
    congrArg (LinearMap.lTensor M) h

lemma quotientTransposeLeft_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨTA).lTensor M) ((ΦTA).lTensor M) :=
  Function.Exact.of_ladder_linearEquiv_of_exact
    (transposeRight_lTensor_rotation A γ δ s t M)
    (transposeLeft_lTensor_rotation A γ δ s t M)
    (quotientRight_lTensor_exact A γ δ s t M)

lemma quotientTransposeRight_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦTA).lTensor M) ((ΨTA).lTensor M) :=
  Function.Exact.of_ladder_linearEquiv_of_exact
    (transposeLeft_lTensor_rotation A γ δ s t M)
    (transposeRight_lTensor_rotation A γ δ s t M)
    (quotientLeft_lTensor_exact A γ δ s t M)

local notation "PJA" => (LinearMap.restrictScalars A (idealPresentation A γ δ s t))
local notation "PDA" => (LinearMap.restrictScalars A (dualPresentation A γ δ s t))

lemma idealPresentation_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΨA).lTensor M) ((PJA).lTensor M) := by
  have h : Function.Exact ΨA PJA :=
    (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t) :
      Function.Exact (Ψ₀).mulVecLin (idealPresentation A γ δ s t))
  exact _root_.lTensor_exact M h (idealPresentation_surjective A γ δ s t)
lemma dualPresentation_lTensor_exact (M : Type*) [AddCommGroup M] [Module A M] :
    Function.Exact ((ΦA).lTensor M) ((PDA).lTensor M) := by
  have h : Function.Exact ΦA PDA :=
    (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t) :
      Function.Exact (Φ₀).mulVecLin (dualPresentation A γ δ s t))
  exact _root_.lTensor_exact M h (dualPresentation_surjective A γ δ s t)

def tensorCokernelIdeal (M : Type*) [AddCommGroup M] [Module A M] :
    ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΨA).lTensor M)) ≃ₗ[A] (M ⊗[A] J₀) :=
  _root_.lTensor.equiv (f := ΨA) (g := PJA) M
    (by exact (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t) :
      Function.Exact (Ψ₀).mulVecLin (idealPresentation A γ δ s t))) (idealPresentation_surjective A γ δ s t)
lemma tensorCokernelIdeal_mk (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk z) = (PJA).lTensor M z := rfl
lemma tensorCokernelIdeal_tmul (M : Type*) [AddCommGroup M] [Module A M]
    (m : M) (z : Fin 2 → R₀) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) =
      m ⊗ₜ[A] idealPresentation A γ δ s t z := rfl
lemma tensorCokernelIdeal_inverse (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelIdeal A γ δ s t M).symm ((PJA).lTensor M z) = Submodule.Quotient.mk z :=
  by
    rw [←tensorCokernelIdeal_mk]
    exact (tensorCokernelIdeal A γ δ s t M).symm_apply_apply (Submodule.Quotient.mk z)
lemma tensorCokernelIdeal_unique (M : Type*) [AddCommGroup M] [Module A M]
    (e : ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΨA).lTensor M)) ≃ₗ[A] (M ⊗[A] J₀))
    (he : ∀ z, e (Submodule.Quotient.mk z) = (PJA).lTensor M z) :
    e = tensorCokernelIdeal A γ δ s t M := by
  ext z
  induction z using Submodule.Quotient.induction_on
  rename_i z
  exact (he z).trans (tensorCokernelIdeal_mk A γ δ s t M z).symm

def tensorCokernelDual (M : Type*) [AddCommGroup M] [Module A M] :
    ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΦA).lTensor M)) ≃ₗ[A] (M ⊗[A] D₀) :=
  _root_.lTensor.equiv (f := ΦA) (g := PDA) M
    (by exact (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t) :
      Function.Exact (Φ₀).mulVecLin (dualPresentation A γ δ s t))) (dualPresentation_surjective A γ δ s t)
lemma tensorCokernelDual_mk (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk z) = (PDA).lTensor M z := rfl
lemma tensorCokernelDual_tmul (M : Type*) [AddCommGroup M] [Module A M]
    (m : M) (z : Fin 2 → R₀) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) =
      m ⊗ₜ[A] dualPresentation A γ δ s t z := rfl
lemma tensorCokernelDual_inverse (M : Type*) [AddCommGroup M] [Module A M]
    (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelDual A γ δ s t M).symm ((PDA).lTensor M z) = Submodule.Quotient.mk z :=
  by
    rw [←tensorCokernelDual_mk]
    exact (tensorCokernelDual A γ δ s t M).symm_apply_apply (Submodule.Quotient.mk z)
lemma tensorCokernelDual_unique (M : Type*) [AddCommGroup M] [Module A M]
    (e : ((M ⊗[A] (Fin 2 → R₀)) ⧸ LinearMap.range ((ΦA).lTensor M)) ≃ₗ[A] (M ⊗[A] D₀))
    (he : ∀ z, e (Submodule.Quotient.mk z) = (PDA).lTensor M z) :
    e = tensorCokernelDual A γ δ s t M := by
  ext z
  induction z using Submodule.Quotient.induction_on
  rename_i z
  exact (he z).trans (tensorCokernelDual_mk A γ δ s t M z).symm

-- NodeSectionFactorization.PolynomialModel.rotationFirstBasis
example  : sectionRotation A γ δ s t ![1,0] = ![0,1] := by simp [sectionRotation_apply]

-- NodeSectionFactorization.PolynomialModel.rotationNonreducedSquare
example (z : Fin 2 → Ring (ZMod 4) 1 0 1 0) :
    sectionRotation (ZMod 4) 1 0 1 0 (sectionRotation (ZMod 4) 1 0 1 0 z) = -z := sectionRotation_square _ _ _ _ _ z

-- NodeSectionFactorization.PolynomialModel.rotationZeroRing
example (z : Fin 2 → Ring (ZMod 1) 0 0 0 0) :
    (sectionRotation (ZMod 1) 0 0 0 0).symm (sectionRotation (ZMod 1) 0 0 0 0 z) = z := (sectionRotation _ _ _ _ _).symm_apply_apply z

-- NodeSectionFactorization.PolynomialModel.tensorIdealZero
example (M : Type*) [AddCommGroup M] [Module A M] :
    tensorCokernelIdeal A γ δ s t M 0 = 0 := map_zero _

-- NodeSectionFactorization.PolynomialModel.tensorIdealPureTensor
example (M : Type*) [AddCommGroup M] [Module A M] (m : M) (z : Fin 2 → R₀) :
    tensorCokernelIdeal A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) = m ⊗ₜ[A] idealPresentation A γ δ s t z := tensorCokernelIdeal_tmul _ _ _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.tensorIdealRepresentativeRoundTrip
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelIdeal A γ δ s t M).symm ((idealPresentation A γ δ s t).restrictScalars A |>.lTensor M <| z) = Submodule.Quotient.mk z := tensorCokernelIdeal_inverse _ _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.tensorDualZero
example (M : Type*) [AddCommGroup M] [Module A M] :
    tensorCokernelDual A γ δ s t M 0 = 0 := map_zero _

-- NodeSectionFactorization.PolynomialModel.tensorDualPureTensor
example (M : Type*) [AddCommGroup M] [Module A M] (m : M) (z : Fin 2 → R₀) :
    tensorCokernelDual A γ δ s t M (Submodule.Quotient.mk (m ⊗ₜ[A] z)) = m ⊗ₜ[A] dualPresentation A γ δ s t z := tensorCokernelDual_tmul _ _ _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.tensorDualRepresentativeRoundTrip
example (M : Type*) [AddCommGroup M] [Module A M] (z : M ⊗[A] (Fin 2 → R₀)) :
    (tensorCokernelDual A γ δ s t M).symm ((dualPresentation A γ δ s t).restrictScalars A |>.lTensor M <| z) = Submodule.Quotient.mk z := tensorCokernelDual_inverse _ _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.tensorIdealTorsionNegativeGenerator
example  :
    tensorCokernelIdeal ℤ 1 0 1 0 (ZMod 2) (Submodule.Quotient.mk ((1 : ZMod 2) ⊗ₜ[ℤ] ![0,1])) =
      (1 : ZMod 2) ⊗ₜ[ℤ] (-⟨AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X - coefficientHom ℤ 1 0 1 0 0, sectionSecond_mem ℤ 1 0 1 0⟩) := by
  rw [tensorCokernelIdeal_tmul]
  congr 1
  apply Subtype.ext
  simp [idealPresentation_apply]

-- NodeSectionFactorization.PolynomialModel.tensorDualTorsionNegativeGenerator
example  :
    tensorCokernelDual ℤ 1 0 1 0 (ZMod 2) (Submodule.Quotient.mk ((1 : ZMod 2) ⊗ₜ[ℤ] ![0,1])) =
      (1 : ZMod 2) ⊗ₜ[ℤ] (-dualGenerator ℤ 1 0 1 0) := by
  rw [tensorCokernelDual_tmul]
  congr 1
  ext j
  simp [dualPresentation_apply]

-- NodeSectionFactorization.PolynomialModel.tensorTorsionLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2)) := quotientLeft_lTensor_exact ℤ 1 0 1 0 (ZMod 2)

-- NodeSectionFactorization.PolynomialModel.tensorTorsionRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin (right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)))).lTensor (ZMod 2)) := quotientRight_lTensor_exact ℤ 1 0 1 0 (ZMod 2)

-- NodeSectionFactorization.PolynomialModel.tensorTorsionTransposeLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2)) := quotientTransposeLeft_lTensor_exact ℤ 1 0 1 0 (ZMod 2)

-- NodeSectionFactorization.PolynomialModel.tensorTorsionTransposeRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((left ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2))
    ((LinearMap.restrictScalars ℤ (Matrix.mulVecLin ((right ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0) (AdjoinRoot.root (polynomial ℤ 1 0 1 0)) (AdjoinRoot.of (polynomial ℤ 1 0 1 0) Polynomial.X) ((coefficientHom ℤ 1 0 1 0) 1) ((coefficientHom ℤ 1 0 1 0) 0)).transpose))).lTensor (ZMod 2)) := quotientTransposeRight_lTensor_exact ℤ 1 0 1 0 (ZMod 2)

-- NodeSectionFactorization.PolynomialModel.tensorZeroRingLeftExact
example  : Function.Exact
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (right ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1))
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (left ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1)) := quotientLeft_lTensor_exact (ZMod 1) 0 0 0 0 (ZMod 1)

-- NodeSectionFactorization.PolynomialModel.tensorZeroRingRightExact
example  : Function.Exact
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (left ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1))
    ((LinearMap.restrictScalars (ZMod 1) (Matrix.mulVecLin (right ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0) (AdjoinRoot.root (polynomial (ZMod 1) 0 0 0 0)) (AdjoinRoot.of (polynomial (ZMod 1) 0 0 0 0) Polynomial.X) ((coefficientHom (ZMod 1) 0 0 0 0) 0) ((coefficientHom (ZMod 1) 0 0 0 0) 0)))).lTensor (ZMod 1)) := quotientRight_lTensor_exact (ZMod 1) 0 0 0 0 (ZMod 1)

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.leftImage_lTensor_injective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.rightImage_lTensor_injective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientLeft_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientRight_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_symm_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_square
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_rotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_rotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_lTensor_rotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_lTensor_rotation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeLeft_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeRight_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_lTensor_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_mk
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_tmul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_unique
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_mk
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_tmul
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_unique

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
  ext j
  change d₀ * ε₀ j = b₀ * (1 * (j : R₀))
  simpa only [one_mul] using dualGenerator_spec A γ δ s t j

lemma sectionBidual_relation (F : Module.Dual R₀ D₀) :
    d₀ * F ε₀ = b₀ * F one₀ := by
  have h := congrArg F (dualGenerator_module_relation A γ δ s t)
  simpa only [map_smul, smul_eq_mul] using h

lemma sectionBidual_value_mem (F : Module.Dual R₀ D₀) : F one₀ ∈ J₀ := by
  obtain ⟨r,α,_,hy⟩ := sectionDualSyzygy A γ δ s t (F ε₀) (F one₀)
    (sectionBidual_relation A γ δ s t F)
  apply Ideal.mem_span_pair.mpr
  exact ⟨ι₀ α,r,by rw [hy]; ring⟩

def sectionBidualInverse : Module.Dual R₀ D₀ →ₗ[R₀] J₀ where
  toFun F := ⟨F one₀, sectionBidual_value_mem A γ δ s t F⟩
  map_add' _ _ := Subtype.ext rfl
  map_smul' _ _ := Subtype.ext rfl

lemma sectionBidualInverse_value (F : Module.Dual R₀ D₀) :
    (sectionBidualInverse A γ δ s t F : R₀) = F one₀ := rfl

lemma sectionBidualInverse_eval (j : J₀) :
    sectionBidualInverse A γ δ s t (Module.Dual.eval R₀ J₀ j) = j := by
  apply Subtype.ext
  change 1 * (j : R₀) = j
  exact one_mul _

lemma sectionBidual_eval_inverse (F : Module.Dual R₀ D₀) :
    Module.Dual.eval R₀ J₀ (sectionBidualInverse A γ δ s t F) = F := by
  let j := sectionBidualInverse A γ δ s t F
  have hone : F one₀ = (j : R₀) := rfl
  have heps : F ε₀ = ε₀ j := by
    apply sectionCoordinateRegular A γ δ s t
    change d₀ * F ε₀ = d₀ * ε₀ j
    rw [sectionBidual_relation, dualGenerator_spec, hone]
  ext h
  obtain ⟨z,rfl⟩ := dualPresentation_surjective A γ δ s t h
  have hmul : dualMultiplication A γ δ s t (z 0) = z 0 • one₀ := by
    ext y
    change z 0 * (y : R₀) = z 0 * (1 * (y : R₀))
    rw [one_mul]
  change dualPresentation A γ δ s t z j = F (dualPresentation A γ δ s t z)
  rw [dualPresentation_apply]
  change z 0 * (j : R₀) - z 1 * ε₀ j =
    F (dualMultiplication A γ δ s t (z 0) - z 1 • ε₀)
  rw [hmul,map_sub,map_smul,map_smul]
  change _ = z 0 * F one₀ - z 1 * F ε₀
  rw [hone,heps]

theorem sectionIdealReflexive : Module.IsReflexive R₀ J₀ := by
  constructor
  exact ⟨Function.LeftInverse.injective (sectionBidualInverse_eval A γ δ s t),
    Function.RightInverse.surjective (sectionBidual_eval_inverse A γ δ s t)⟩

def sectionBidualEquiv : J₀ ≃ₗ[R₀] Module.Dual R₀ D₀ := by
  let : Module.IsReflexive R₀ J₀ := sectionIdealReflexive A γ δ s t
  exact Module.evalEquiv R₀ J₀

lemma sectionBidualEquiv_apply (j : J₀) (h : D₀) :
    sectionBidualEquiv A γ δ s t j h = h j := rfl

lemma sectionBidualEquiv_inverse (F : Module.Dual R₀ D₀) :
    (sectionBidualEquiv A γ δ s t).symm F = sectionBidualInverse A γ δ s t F := by
  apply (sectionBidualEquiv A γ δ s t).injective
  rw [LinearEquiv.apply_symm_apply]
  exact (sectionBidual_eval_inverse A γ δ s t F).symm

lemma sectionBidualEquiv_native :
    (sectionBidualEquiv A γ δ s t).toLinearMap = Module.Dual.eval R₀ J₀ := rfl

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_zero
example : sectionBidualInverse A γ δ s t 0 = 0 := map_zero _

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_first
example : sectionBidualInverse A γ δ s t
    (Module.Dual.eval R₀ J₀ ⟨c₀,sectionFirst_mem A γ δ s t⟩) =
      ⟨c₀,sectionFirst_mem A γ δ s t⟩ := sectionBidualInverse_eval _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_second
example : sectionBidualInverse A γ δ s t
    (Module.Dual.eval R₀ J₀ ⟨d₀,sectionSecond_mem A γ δ s t⟩) =
      ⟨d₀,sectionSecond_mem A γ δ s t⟩ := sectionBidualInverse_eval _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_epsilon_first
example : sectionBidualEquiv A γ δ s t ⟨c₀,sectionFirst_mem A γ δ s t⟩ ε₀ = -a₀ :=
  (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).1

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_epsilon_second
example : sectionBidualEquiv A γ δ s t ⟨d₀,sectionSecond_mem A γ δ s t⟩ ε₀ = b₀ :=
  (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_negative_generator
example : sectionBidualEquiv A γ δ s t (-⟨d₀,sectionSecond_mem A γ δ s t⟩) ε₀ = -b₀ := by
  rw [sectionBidualEquiv_apply, map_neg,
    (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2]

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_nonreduced
example : Module.IsReflexive (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0) :=
  sectionIdealReflexive _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_zeroRing
example : Module.IsReflexive (Ring (ZMod 1) 0 0 0 0) (sectionIdeal (ZMod 1) 0 0 0 0) :=
  sectionIdealReflexive _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_roundtrip
example (F : Module.Dual R₀ D₀) :
    sectionBidualEquiv A γ δ s t (sectionBidualInverse A γ δ s t F) = F :=
  sectionBidual_eval_inverse _ _ _ _ _ _

-- NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_dual
example : Module.IsReflexive R₀ D₀ := by
  let : Module.IsReflexive R₀ J₀ := sectionIdealReflexive A γ δ s t
  infer_instance

#print axioms dualGenerator_module_relation
#print axioms sectionBidual_relation
#print axioms sectionBidual_value_mem
#print axioms sectionBidualInverse
#print axioms sectionBidualInverse_value
#print axioms sectionBidualInverse_eval
#print axioms sectionBidual_eval_inverse
#print axioms sectionIdealReflexive
#print axioms sectionBidualEquiv
#print axioms sectionBidualEquiv_apply
#print axioms sectionBidualEquiv_inverse
#print axioms sectionBidualEquiv_native
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

def sectionDualTensorHom : D₀ ⊗[A] M →ₗ[R₀] (J₀ →ₗ[R₀] N₀) :=
  AlgebraTensorModule.lift
    { toFun := fun h =>
        { toFun := fun m =>
            { toFun := fun j => h j ⊗ₜ[A] m
              map_add' := by intros; simp [TensorProduct.add_tmul]
              map_smul' := by intros; simp [TensorProduct.smul_tmul'] }
          map_add' := by
            intro m n
            apply LinearMap.ext
            intro j
            exact TensorProduct.tmul_add _ _ _
          map_smul' := by
            intro a m
            apply LinearMap.ext
            intro j
            exact TensorProduct.tmul_smul _ _ _ }
      map_add' := by
        intro h k
        apply LinearMap.ext
        intro m
        apply LinearMap.ext
        intro j
        exact TensorProduct.add_tmul _ _ _
      map_smul' := by
        intro r h
        apply LinearMap.ext
        intro m
        apply LinearMap.ext
        intro j
        exact (TensorProduct.smul_tmul' r (h j) m).symm }

lemma sectionDualTensorHom_tmul (h : D₀) (m : M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m := rfl

def sectionFreeTensorHom :
    (Fin 2 → R₀) ⊗[A] M ≃ₗ[A] ((Fin 2 → R₀) →ₗ[R₀] N₀) :=
  (TensorProduct.piLeft A M (fun _ : Fin 2 => R₀)).trans
    (LinearEquiv.restrictScalars A (LinearEquiv.symm
      (LinearEquiv.piRing R₀ N₀ (Fin 2) R₀)))

lemma sectionFreeTensorHom_tmul (z w : Fin 2 → R₀) (m : M) :
    sectionFreeTensorHom A γ δ s t M (z ⊗ₜ[A] m) w =
      (w 0 * z 0 + w 1 * z 1) ⊗ₜ[A] m := by
  simp [sectionFreeTensorHom, TensorProduct.piLeft, LinearEquiv.piRing_symm_apply,
    Fin.sum_univ_two, TensorProduct.smul_tmul', ← TensorProduct.add_tmul]

lemma sectionFreeTensorHom_matrix (W : Matrix (Fin 2) (Fin 2) R₀)
    (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionFreeTensorHom A γ δ s t M
      (((W.transpose.mulVecLin).restrictScalars A).rTensor M z) =
    (sectionFreeTensorHom A γ δ s t M z).comp W.mulVecLin := by
  induction z using TensorProduct.induction_on with
  | zero => simp
  | add z w hz hw =>
    simp only [map_add, hz, hw]
    rfl
  | tmul z m =>
    ext w
    simp only [LinearMap.rTensor_tmul, LinearMap.restrictScalars_apply,
      sectionFreeTensorHom_tmul, LinearMap.comp_apply]
    congr 1
    simp [Matrix.mulVec, Matrix.vecMul, dotProduct, Fin.sum_univ_two]
    ring

def sectionIdealHomCoordinates : (J₀ →ₗ[R₀] N₀) →ₗ[A] (Fin 2 → R₀) ⊗[A] M :=
  (sectionFreeTensorHom A γ δ s t M).symm.toLinearMap.comp
    ((LinearMap.lcomp R₀ N₀ (idealPresentation A γ δ s t)).restrictScalars A)

lemma sectionIdealHomCoordinates_injective :
    Function.Injective (sectionIdealHomCoordinates A γ δ s t M) := by
  intro h k hhk
  have he : h.comp (idealPresentation A γ δ s t) =
      k.comp (idealPresentation A γ δ s t) :=
    (sectionFreeTensorHom A γ δ s t M).symm.injective hhk
  ext j
  obtain ⟨z,rfl⟩ := idealPresentation_surjective A γ δ s t j
  exact LinearMap.congr_fun he z

lemma sectionIdealHomCoordinates_relation (h : J₀ →ₗ[R₀] N₀) :
    ((ΨTA).rTensor M) (sectionIdealHomCoordinates A γ δ s t M h) = 0 := by
  apply (sectionFreeTensorHom A γ δ s t M).injective
  rw [sectionFreeTensorHom_matrix]
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M h) =
      h.comp (idealPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _, map_zero]
  change ((h.comp (idealPresentation A γ δ s t)).comp (Ψ₀).mulVecLin) = 0
  apply LinearMap.ext
  intro z
  change h (idealPresentation A γ δ s t ((Ψ₀).mulVecLin z)) = 0
  have hz : idealPresentation A γ δ s t ((Ψ₀).mulVecLin z) = 0 :=
    (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t)).apply_apply_eq_zero z
  rw [hz, map_zero]

lemma sectionIdealPresentation_generators (z : Fin 2 → R₀) :
    idealPresentation A γ δ s t z =
    z 0 • (⟨c₀,sectionFirst_mem A γ δ s t⟩ : J₀) -
      z 1 • (⟨d₀,sectionSecond_mem A γ δ s t⟩ : J₀) := by
  apply Subtype.ext
  change c₀*z 0-d₀*z 1 = z 0*c₀-z 1*d₀
  ring

lemma sectionIdealHomCoordinates_presentation (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionIdealHomCoordinates A γ δ s t M
      (sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z)) =
    -((pA).rTensor M) ((ΨA).rTensor M z) := by
  apply (sectionFreeTensorHom A γ δ s t M).injective
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M
        (sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z))) =
      (sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z)).comp
        (idealPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _]
  induction z using TensorProduct.induction_on with
  | zero => simp
  | add z w hz hw =>
    simp only [map_add,LinearMap.add_comp,hz,hw,map_neg,neg_add]
  | tmul z m =>
    simp only [LinearMap.rTensor_tmul,LinearMap.restrictScalars_apply,
      LinearEquiv.rTensor_tmul,LinearEquiv.restrictScalars_apply,
      ← TensorProduct.neg_tmul]
    apply LinearMap.ext
    intro w
    change dualPresentation A γ δ s t z (idealPresentation A γ δ s t w) ⊗ₜ[A] m =
      sectionFreeTensorHom A γ δ s t M
        ((-sectionRotation A γ δ s t ((Ψ₀).mulVecLin z)) ⊗ₜ[A] m) w
    rw [sectionFreeTensorHom_tmul]
    congr 1
    rw [sectionIdealPresentation_generators,map_sub,map_smul,map_smul,
      dualPresentation_apply,dualPresentation_apply,
      (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).1,
      (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2]
    simp only [smul_eq_mul,sectionRotation_apply,right_mulVec,
      Matrix.cons_val_zero,Matrix.cons_val_one,Pi.neg_apply]
    ring

lemma transposeLeft_rTensor_rotation :
    ((ΦTA).rTensor M).comp ((pA).rTensor M).toLinearMap =
      ((pA).rTensor M).toLinearMap.comp ((ΨA).rTensor M) := by
  have h : (ΦTA).comp (pA).toLinearMap = (pA).toLinearMap.comp ΨA := by
    apply LinearMap.ext
    intro z
    exact LinearMap.congr_fun (transposeLeft_rotation A γ δ s t) z
  simpa only [LinearMap.rTensor_comp,LinearEquiv.coe_rTensor] using
    congrArg (LinearMap.rTensor M) h

lemma sectionDualTensorHom_injective :
    Function.Injective (sectionDualTensorHom A γ δ s t M) := by
  intro x y hxy
  apply sub_eq_zero.mp
  obtain ⟨z,hz⟩ := LinearMap.rTensor_surjective M
    (show Function.Surjective PDA from dualPresentation_surjective A γ δ s t) (x-y)
  have hzero : sectionDualTensorHom A γ δ s t M ((PDA).rTensor M z) = 0 := by
    rw [hz,map_sub,hxy,sub_self]
  have hψ : ((ΨA).rTensor M) z = 0 := by
    have hc := sectionIdealHomCoordinates_presentation A γ δ s t M z
    rw [hzero,map_zero] at hc
    have hp : ((pA).rTensor M) (((ΨA).rTensor M) z) = 0 := by
      exact neg_eq_zero.mp hc.symm
    exact ((pA).rTensor M).injective (hp.trans (map_zero _).symm)
  have he : Function.Exact ((ΦA).rTensor M) ((ΨA).rTensor M) :=
    (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (quotientRight_lTensor_exact A γ δ s t M)
  obtain ⟨w,hw⟩ := (he z).mp hψ
  have hpd : ((PDA).rTensor M) z = 0 := by
    rw [←hw]
    exact ((LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (dualPresentation_lTensor_exact A γ δ s t M)).apply_apply_eq_zero w
  exact hz.symm.trans hpd

lemma sectionDualTensorHom_surjective :
    Function.Surjective (sectionDualTensorHom A γ δ s t M) := by
  intro h
  have he : Function.Exact ((ΦTA).rTensor M) ((ΨTA).rTensor M) :=
    (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (quotientTransposeRight_lTensor_exact A γ δ s t M)
  obtain ⟨w,hw⟩ := (he _).mp (sectionIdealHomCoordinates_relation A γ δ s t M h)
  refine ⟨((PDA).rTensor M) (-((pA).rTensor M).symm w),?_⟩
  apply sectionIdealHomCoordinates_injective A γ δ s t M
  rw [sectionIdealHomCoordinates_presentation,map_neg,map_neg,neg_neg,←hw]
  have hr := LinearMap.congr_fun (transposeLeft_rTensor_rotation A γ δ s t M)
    (((pA).rTensor M).symm w)
  simpa only [LinearMap.comp_apply,LinearEquiv.coe_coe,
    LinearEquiv.apply_symm_apply] using hr.symm

def sectionDualTensorHomEquiv : D₀ ⊗[A] M ≃ₗ[R₀] (J₀ →ₗ[R₀] N₀) :=
  LinearEquiv.ofBijective (sectionDualTensorHom A γ δ s t M)
    ⟨sectionDualTensorHom_injective A γ δ s t M,
      sectionDualTensorHom_surjective A γ δ s t M⟩

lemma sectionDualTensorHomEquiv_tmul (h : D₀) (m : M) (j : J₀) :
    sectionDualTensorHomEquiv A γ δ s t M (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m := rfl

lemma sectionDualTensorHom_natural {M' : Type*} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : D₀ →ₗ[R₀] D₀) f x) j =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionDualTensorHom A γ δ s t M x j) := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | add x y hx hy => simp_all
  | tmul h m => rfl

def sectionIdealTensorHom : J₀ ⊗[A] M →ₗ[R₀] (D₀ →ₗ[R₀] N₀) :=
  AlgebraTensorModule.lift
    { toFun := fun j =>
        { toFun := fun m =>
            { toFun := fun h => h j ⊗ₜ[A] m
              map_add' := by intros; simp [TensorProduct.add_tmul]
              map_smul' := by intros; simp [TensorProduct.smul_tmul'] }
          map_add' := by
            intro m n
            apply LinearMap.ext
            intro h
            exact TensorProduct.tmul_add _ _ _
          map_smul' := by
            intro a m
            apply LinearMap.ext
            intro h
            exact TensorProduct.tmul_smul _ _ _ }
      map_add' := by
        intro j k
        apply LinearMap.ext
        intro m
        apply LinearMap.ext
        intro h
        change h (j+k) ⊗ₜ[A] m = h j ⊗ₜ[A] m + h k ⊗ₜ[A] m
        rw [map_add,TensorProduct.add_tmul]
      map_smul' := by
        intro r j
        apply LinearMap.ext
        intro m
        apply LinearMap.ext
        intro h
        change h (r • j) ⊗ₜ[A] m = r • (h j ⊗ₜ[A] m)
        rw [map_smul,TensorProduct.smul_tmul'] }

lemma sectionIdealTensorHom_tmul (j : J₀) (m : M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m := rfl

def sectionDualHomCoordinates : (D₀ →ₗ[R₀] N₀) →ₗ[A] (Fin 2 → R₀) ⊗[A] M :=
  (sectionFreeTensorHom A γ δ s t M).symm.toLinearMap.comp
    ((LinearMap.lcomp R₀ N₀ (dualPresentation A γ δ s t)).restrictScalars A)

lemma sectionDualHomCoordinates_injective :
    Function.Injective (sectionDualHomCoordinates A γ δ s t M) := by
  intro h k hhk
  have he : h.comp (dualPresentation A γ δ s t) =
      k.comp (dualPresentation A γ δ s t) :=
    (sectionFreeTensorHom A γ δ s t M).symm.injective hhk
  ext j
  obtain ⟨z,rfl⟩ := dualPresentation_surjective A γ δ s t j
  exact LinearMap.congr_fun he z

lemma sectionDualHomCoordinates_relation (h : D₀ →ₗ[R₀] N₀) :
    ((ΦTA).rTensor M) (sectionDualHomCoordinates A γ δ s t M h) = 0 := by
  apply (sectionFreeTensorHom A γ δ s t M).injective
  rw [sectionFreeTensorHom_matrix]
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M h) =
      h.comp (dualPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _, map_zero]
  apply LinearMap.ext
  intro z
  change h (dualPresentation A γ δ s t ((Φ₀).mulVecLin z)) = 0
  have hz : dualPresentation A γ δ s t ((Φ₀).mulVecLin z) = 0 :=
    (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t)).apply_apply_eq_zero z
  rw [hz,map_zero]

lemma sectionDualHomCoordinates_presentation (z : (Fin 2 → R₀) ⊗[A] M) :
    sectionDualHomCoordinates A γ δ s t M
      (sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z)) =
    ((pA).rTensor M) ((ΦA).rTensor M z) := by
  apply (sectionFreeTensorHom A γ δ s t M).injective
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M
        (sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z))) =
      (sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z)).comp
        (dualPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _]
  induction z using TensorProduct.induction_on with
  | zero => simp
  | add z w hz hw =>
    simp only [map_add,LinearMap.add_comp,hz,hw]
  | tmul z m =>
    simp only [LinearMap.rTensor_tmul,LinearMap.restrictScalars_apply,
      LinearEquiv.rTensor_tmul,LinearEquiv.restrictScalars_apply]
    apply LinearMap.ext
    intro w
    change dualPresentation A γ δ s t w (idealPresentation A γ δ s t z) ⊗ₜ[A] m =
      sectionFreeTensorHom A γ δ s t M
        (sectionRotation A γ δ s t ((Φ₀).mulVecLin z) ⊗ₜ[A] m) w
    rw [sectionFreeTensorHom_tmul]
    congr 1
    rw [sectionIdealPresentation_generators,map_sub,map_smul,map_smul,
      dualPresentation_apply,dualPresentation_apply,
      (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).1,
      (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2]
    simp only [smul_eq_mul,sectionRotation_apply,left_mulVec,
      Matrix.cons_val_zero,Matrix.cons_val_one]
    ring

lemma transposeRight_rTensor_rotation :
    ((ΨTA).rTensor M).comp ((pA).rTensor M).toLinearMap =
      ((pA).rTensor M).toLinearMap.comp ((ΦA).rTensor M) := by
  have h : (ΨTA).comp (pA).toLinearMap = (pA).toLinearMap.comp ΦA := by
    apply LinearMap.ext
    intro z
    exact LinearMap.congr_fun (transposeRight_rotation A γ δ s t) z
  simpa only [LinearMap.rTensor_comp,LinearEquiv.coe_rTensor] using
    congrArg (LinearMap.rTensor M) h

lemma sectionIdealTensorHom_injective :
    Function.Injective (sectionIdealTensorHom A γ δ s t M) := by
  intro x y hxy
  apply sub_eq_zero.mp
  obtain ⟨z,hz⟩ := LinearMap.rTensor_surjective M
    (show Function.Surjective PJA from idealPresentation_surjective A γ δ s t) (x-y)
  have hzero : sectionIdealTensorHom A γ δ s t M ((PJA).rTensor M z) = 0 := by
    rw [hz,map_sub,hxy,sub_self]
  have hφ : ((ΦA).rTensor M) z = 0 := by
    have hc := sectionDualHomCoordinates_presentation A γ δ s t M z
    rw [hzero,map_zero] at hc
    exact ((pA).rTensor M).injective (hc.symm.trans (map_zero _).symm)
  have he : Function.Exact ((ΨA).rTensor M) ((ΦA).rTensor M) :=
    (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (quotientLeft_lTensor_exact A γ δ s t M)
  obtain ⟨w,hw⟩ := (he z).mp hφ
  have hpj : ((PJA).rTensor M) z = 0 := by
    rw [←hw]
    exact ((LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (idealPresentation_lTensor_exact A γ δ s t M)).apply_apply_eq_zero w
  exact hz.symm.trans hpj

lemma sectionIdealTensorHom_surjective :
    Function.Surjective (sectionIdealTensorHom A γ δ s t M) := by
  intro h
  have he : Function.Exact ((ΨTA).rTensor M) ((ΦTA).rTensor M) :=
    (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
      (quotientTransposeLeft_lTensor_exact A γ δ s t M)
  obtain ⟨w,hw⟩ := (he _).mp (sectionDualHomCoordinates_relation A γ δ s t M h)
  refine ⟨((PJA).rTensor M) (((pA).rTensor M).symm w),?_⟩
  apply sectionDualHomCoordinates_injective A γ δ s t M
  rw [sectionDualHomCoordinates_presentation,←hw]
  have hr := LinearMap.congr_fun (transposeRight_rTensor_rotation A γ δ s t M)
    (((pA).rTensor M).symm w)
  simpa only [LinearMap.comp_apply,LinearEquiv.coe_coe,
    LinearEquiv.apply_symm_apply] using hr.symm

def sectionIdealTensorHomEquiv : J₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀) :=
  LinearEquiv.ofBijective (sectionIdealTensorHom A γ δ s t M)
    ⟨sectionIdealTensorHom_injective A γ δ s t M,
      sectionIdealTensorHom_surjective A γ δ s t M⟩

lemma sectionIdealTensorHomEquiv_tmul (j : J₀) (m : M) (h : D₀) :
    sectionIdealTensorHomEquiv A γ δ s t M (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m := rfl

lemma sectionIdealTensorHom_natural {M' : Type*} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : J₀ →ₗ[R₀] J₀) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionIdealTensorHom A γ δ s t M x h) := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | add x y hx hy => simp_all
  | tmul j m => rfl

lemma sectionDualTensorHomEquiv_inverse (h : D₀) (m : M) :
    (sectionDualTensorHomEquiv A γ δ s t M).symm
      (sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m)) = h ⊗ₜ[A] m :=
  (sectionDualTensorHomEquiv A γ δ s t M).symm_apply_apply _

lemma sectionIdealTensorHomEquiv_inverse (j : J₀) (m : M) :
    (sectionIdealTensorHomEquiv A γ δ s t M).symm
      (sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m)) = j ⊗ₜ[A] m :=
  (sectionIdealTensorHomEquiv A γ δ s t M).symm_apply_apply _

lemma sectionDualTensorHomEquiv_unique
    (e : D₀ ⊗[A] M ≃ₗ[R₀] (J₀ →ₗ[R₀] N₀))
    (he : ∀ (h : D₀) (m : M) (j : J₀), e (h ⊗ₜ[A] m) j = h j ⊗ₜ[A] m) :
    e = sectionDualTensorHomEquiv A γ δ s t M := by
  apply LinearEquiv.toLinearMap_injective
  apply TensorProduct.AlgebraTensorModule.ext
  intro h m
  apply LinearMap.ext
  intro j
  exact he h m j

lemma sectionIdealTensorHomEquiv_unique
    (e : J₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀))
    (he : ∀ (j : J₀) (m : M) (h : D₀), e (j ⊗ₜ[A] m) h = h j ⊗ₜ[A] m) :
    e = sectionIdealTensorHomEquiv A γ δ s t M := by
  apply LinearEquiv.toLinearMap_injective
  apply TensorProduct.AlgebraTensorModule.ext
  intro j m
  apply LinearMap.ext
  intro h
  exact he j m h

lemma sectionDualTensorHom_unit (x : D₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionDualTensorHom A γ δ s t A x) =
    (AlgebraTensorModule.rid A R₀ D₀) x := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | add x y hx hy =>
    simp only [map_add,LinearMap.comp_add,hx,hy]
  | tmul h a =>
    apply LinearMap.ext
    intro j
    simp only [LinearMap.comp_apply,sectionDualTensorHom_tmul,
      LinearEquiv.coe_coe,AlgebraTensorModule.rid_tmul,LinearMap.smul_apply]

lemma sectionIdealTensorHom_unit (x : J₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionIdealTensorHom A γ δ s t A x) =
    Module.Dual.eval R₀ J₀ ((AlgebraTensorModule.rid A R₀ J₀) x) := by
  induction x using TensorProduct.induction_on with
  | zero =>
    rw [(sectionIdealTensorHom A γ δ s t A).map_zero,
      (AlgebraTensorModule.rid A R₀ J₀).map_zero,
      (Module.Dual.eval R₀ J₀).map_zero,LinearMap.comp_zero]
  | add x y hx hy =>
    simp only [map_add,LinearMap.comp_add,hx,hy]
  | tmul j a =>
    apply LinearMap.ext
    intro h
    simp only [LinearMap.comp_apply,sectionIdealTensorHom_tmul,
      LinearEquiv.coe_coe,AlgebraTensorModule.rid_tmul,Module.Dual.eval_apply]
    exact ((h.restrictScalars A).map_smul a j).symm

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_zero
example : sectionDualTensorHom A γ δ s t M 0 = 0 := map_zero _

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_inclusion
example (j : J₀) (m : M) :
    sectionDualTensorHom A γ δ s t M (dualMultiplication A γ δ s t 1 ⊗ₜ[A] m) j =
    (j : R₀) ⊗ₜ[A] m := by
  rw [sectionDualTensorHom_tmul,dualMultiplicationApply,one_mul]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_negative_epsilon
example (m : M) :
    sectionDualTensorHom A γ δ s t M ((-dualGenerator A γ δ s t : D₀) ⊗ₜ[A] m)
      ⟨c₀,sectionFirst_mem A γ δ s t⟩ =
    (ι₀ δ * v₀ + ι₀ δ * ι₀ t + ι₀ γ * u₀) ⊗ₜ[A] m := by
  rw [sectionDualTensorHom_tmul,LinearMap.neg_apply,
    (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).1,neg_neg]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_zero
example : sectionIdealTensorHom A γ δ s t M 0 = 0 := map_zero _

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_inclusion
example (j : J₀) (m : M) :
    sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m) (dualMultiplication A γ δ s t 1) =
    (j : R₀) ⊗ₜ[A] m := by
  rw [sectionIdealTensorHom_tmul,dualMultiplicationApply,one_mul]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_negative_second
example (m : M) :
    sectionIdealTensorHom A γ δ s t M
      ((-⟨d₀,sectionSecond_mem A γ δ s t⟩ : J₀) ⊗ₜ[A] m)
      (dualGenerator A γ δ s t) =
    (-(u₀ + ι₀ s + ι₀ γ * ι₀ t)) ⊗ₜ[A] m := by
  rw [sectionIdealTensorHom_tmul,map_neg,
    (dualGeneratorValues A γ δ s t _ (dualGenerator_spec A γ δ s t)).2]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_zero
example : sectionIdealHomCoordinates A γ δ s t M 0 = 0 := map_zero _

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_negative_second
example (h : J₀ →ₗ[R₀] N₀) :
    sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M h) (Pi.single (1 : Fin 2) (1 : R₀)) =
    -h ⟨d₀,sectionSecond_mem A γ δ s t⟩ := by
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionIdealHomCoordinates A γ δ s t M h) =
      h.comp (idealPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _]
  have hj : idealPresentation A γ δ s t (Pi.single (1 : Fin 2) (1 : R₀)) =
      -⟨d₀,sectionSecond_mem A γ δ s t⟩ := by
    apply Subtype.ext
    simp [idealPresentation_apply]
  change h (idealPresentation A γ δ s t (Pi.single (1 : Fin 2) (1 : R₀))) = _
  rw [hj,map_neg]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_faithful
example (h k : J₀ →ₗ[R₀] N₀)
    (hk : sectionIdealHomCoordinates A γ δ s t M h =
      sectionIdealHomCoordinates A γ δ s t M k) : h = k :=
  sectionIdealHomCoordinates_injective A γ δ s t M hk

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_zero
example : sectionDualHomCoordinates A γ δ s t M 0 = 0 := map_zero _

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_negative_epsilon
example (h : D₀ →ₗ[R₀] N₀) :
    sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M h) (Pi.single (1 : Fin 2) (1 : R₀)) =
    -h (dualGenerator A γ δ s t) := by
  rw [show sectionFreeTensorHom A γ δ s t M
      (sectionDualHomCoordinates A γ δ s t M h) =
      h.comp (dualPresentation A γ δ s t) from
    (sectionFreeTensorHom A γ δ s t M).apply_symm_apply _]
  have hd : dualPresentation A γ δ s t (Pi.single (1 : Fin 2) (1 : R₀)) =
      -dualGenerator A γ δ s t := by
    ext j
    simp [dualPresentation_apply]
  change h (dualPresentation A γ δ s t (Pi.single (1 : Fin 2) (1 : R₀))) = _
  rw [hd,map_neg]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_faithful
example (h k : D₀ →ₗ[R₀] N₀)
    (hk : sectionDualHomCoordinates A γ δ s t M h =
      sectionDualHomCoordinates A γ δ s t M k) : h = k :=
  sectionDualHomCoordinates_injective A γ δ s t M hk

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_inverse
example (h : D₀) (m : M) :
    (sectionDualTensorHomEquiv A γ δ s t M).symm
      (sectionDualTensorHom A γ δ s t M (h ⊗ₜ[A] m)) = h ⊗ₜ[A] m :=
  sectionDualTensorHomEquiv_inverse A γ δ s t M h m

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_ring_action
example (r : R₀) (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHomEquiv A γ δ s t M (r • x) j =
    r • sectionDualTensorHomEquiv A γ δ s t M x j := by
  rw [map_smul,LinearMap.smul_apply]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_torsion
example : Function.Bijective (sectionDualTensorHom ℤ 0 0 0 0 (ZMod 3)) :=
  ⟨sectionDualTensorHom_injective ℤ 0 0 0 0 (ZMod 3),
   sectionDualTensorHom_surjective ℤ 0 0 0 0 (ZMod 3)⟩

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_inverse
example (j : J₀) (m : M) :
    (sectionIdealTensorHomEquiv A γ δ s t M).symm
      (sectionIdealTensorHom A γ δ s t M (j ⊗ₜ[A] m)) = j ⊗ₜ[A] m :=
  sectionIdealTensorHomEquiv_inverse A γ δ s t M j m

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_ring_action
example (r : R₀) (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHomEquiv A γ δ s t M (r • x) h =
    r • sectionIdealTensorHomEquiv A γ δ s t M x h := by
  rw [map_smul,LinearMap.smul_apply]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_torsion
example : Function.Bijective (sectionIdealTensorHom ℤ 0 0 0 0 (ZMod 3)) :=
  ⟨sectionIdealTensorHom_injective ℤ 0 0 0 0 (ZMod 3),
   sectionIdealTensorHom_surjective ℤ 0 0 0 0 (ZMod 3)⟩

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_naturality
example {M' : Type*} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : D₀ ⊗[A] M) (j : J₀) :
    sectionDualTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : D₀ →ₗ[R₀] D₀) f x) j =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionDualTensorHom A γ δ s t M x j) :=
  sectionDualTensorHom_natural A γ δ s t M f x j

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_naturality
example {M' : Type*} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : J₀ ⊗[A] M) (h : D₀) :
    sectionIdealTensorHom A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : J₀ →ₗ[R₀] J₀) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionIdealTensorHom A γ δ s t M x h) :=
  sectionIdealTensorHom_natural A γ δ s t M f x h

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_unit
example (x : D₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionDualTensorHom A γ δ s t A x) =
    (AlgebraTensorModule.rid A R₀ D₀) x :=
  sectionDualTensorHom_unit A γ δ s t x

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_bidual
example (x : J₀ ⊗[A] A) :
    (AlgebraTensorModule.rid A R₀ R₀).toLinearMap.comp
      (sectionIdealTensorHom A γ δ s t A x) =
    Module.Dual.eval R₀ J₀ ((AlgebraTensorModule.rid A R₀ J₀) x) :=
  sectionIdealTensorHom_unit A γ δ s t x

-- test: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_nonreduced
example : Function.Bijective (sectionDualTensorHom (ZMod 4) 0 0 0 0 (ZMod 4)) :=
  ⟨sectionDualTensorHom_injective (ZMod 4) 0 0 0 0 (ZMod 4),
   sectionDualTensorHom_surjective (ZMod 4) 0 0 0 0 (ZMod 4)⟩

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_zero_ring
example : Function.Bijective (sectionIdealTensorHom (ZMod 1) 0 0 0 0 (ZMod 1)) :=
  ⟨sectionIdealTensorHom_injective (ZMod 1) 0 0 0 0 (ZMod 1),
   sectionIdealTensorHom_surjective (ZMod 1) 0 0 0 0 (ZMod 1)⟩
#print axioms sectionDualTensorHom
#print axioms sectionDualTensorHom_tmul
#print axioms sectionFreeTensorHom
#print axioms sectionFreeTensorHom_tmul
#print axioms sectionFreeTensorHom_matrix
#print axioms sectionIdealHomCoordinates
#print axioms sectionIdealHomCoordinates_injective
#print axioms sectionIdealHomCoordinates_relation
#print axioms sectionIdealPresentation_generators
#print axioms sectionIdealHomCoordinates_presentation
#print axioms transposeLeft_rTensor_rotation
#print axioms sectionDualTensorHom_injective
#print axioms sectionDualTensorHom_surjective
#print axioms sectionDualTensorHomEquiv
#print axioms sectionDualTensorHomEquiv_tmul
#print axioms sectionDualTensorHom_natural
#print axioms sectionIdealTensorHom
#print axioms sectionIdealTensorHom_tmul
#print axioms sectionDualHomCoordinates
#print axioms sectionDualHomCoordinates_injective
#print axioms sectionDualHomCoordinates_relation
#print axioms sectionDualHomCoordinates_presentation
#print axioms transposeRight_rTensor_rotation
#print axioms sectionIdealTensorHom_injective
#print axioms sectionIdealTensorHom_surjective
#print axioms sectionIdealTensorHomEquiv
#print axioms sectionIdealTensorHomEquiv_tmul
#print axioms sectionIdealTensorHom_natural
#print axioms sectionDualTensorHomEquiv_inverse
#print axioms sectionIdealTensorHomEquiv_inverse
#print axioms sectionDualTensorHomEquiv_unique
#print axioms sectionIdealTensorHomEquiv_unique
#print axioms sectionDualTensorHom_unit
#print axioms sectionIdealTensorHom_unit

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

def sectionHomDifferential (dual : Bool) (n : ℕ) : H₀ →ₗ[R₀] H₀ :=
  LinearMap.lcomp R₀ N₀ (if (n % 2 = 0) = (dual = true) then (Φ₀).mulVecLin else (Ψ₀).mulVecLin)

lemma sectionHomLeftRight_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin)
      (LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin) := by
  have h := (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
    (quotientTransposeRight_lTensor_exact A γ δ s t M)
  change Function.Exact
    ((LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin).restrictScalars A)
    ((LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin).restrictScalars A)
  apply Function.Exact.of_ladder_linearEquiv_of_exact (H := h)
    (e₁ := sectionFreeTensorHom A γ δ s t M)
    (e₂ := sectionFreeTensorHom A γ δ s t M)
    (e₃ := sectionFreeTensorHom A γ δ s t M)
  · apply LinearMap.ext
    intro z
    exact (sectionFreeTensorHom_matrix A γ δ s t M Φ₀ z).symm
  · apply LinearMap.ext
    intro z
    exact (sectionFreeTensorHom_matrix A γ δ s t M Ψ₀ z).symm

lemma sectionHomRightLeft_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin)
      (LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin) := by
  have h := (LinearMap.rTensor_exact_iff_lTensor_exact M).mpr
    (quotientTransposeLeft_lTensor_exact A γ δ s t M)
  change Function.Exact
    ((LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin).restrictScalars A)
    ((LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin).restrictScalars A)
  apply Function.Exact.of_ladder_linearEquiv_of_exact (H := h)
    (e₁ := sectionFreeTensorHom A γ δ s t M)
    (e₂ := sectionFreeTensorHom A γ δ s t M)
    (e₃ := sectionFreeTensorHom A γ δ s t M)
  · apply LinearMap.ext
    intro z
    exact (sectionFreeTensorHom_matrix A γ δ s t M Ψ₀ z).symm
  · apply LinearMap.ext
    intro z
    exact (sectionFreeTensorHom_matrix A γ δ s t M Φ₀ z).symm

lemma sectionHomDifferential_exact (dual : Bool) (n : ℕ) :
    Function.Exact (sectionHomDifferential A γ δ s t M dual n)
      (sectionHomDifferential A γ δ s t M dual (n+1)) := by
  have hn : n % 2 = 0 ∨ n % 2 = 1 := by omega
  cases dual <;> rcases hn with hn | hn <;>
    simp [sectionHomDifferential, hn, show (n+1)%2 = 1-n%2 by omega,
      sectionHomLeftRight_exact, sectionHomRightLeft_exact]

lemma sectionHomDifferential_sq (dual : Bool) (n : ℕ) :
    (sectionHomDifferential A γ δ s t M dual (n+1)).comp
      (sectionHomDifferential A γ δ s t M dual n) = 0 := by
  exact (sectionHomDifferential_exact A γ δ s t M dual n).linearMap_comp_eq_zero

def sectionHomCochain (coeff : Type v_cochain) [AddCommGroup coeff] [Module A coeff] (dual : Bool) : CochainComplex (ModuleCat.{max u_cochain v_cochain} R₀) ℕ :=
  CochainComplex.of (fun _ => ModuleCat.of R₀ ((Fin 2 → R₀) →ₗ[R₀] R₀ ⊗[A] coeff))
    (fun n => ModuleCat.ofHom (R := R₀) (sectionHomDifferential A γ δ s t coeff dual n))
    (fun n => ModuleCat.hom_ext (sectionHomDifferential_sq A γ δ s t coeff dual n))

lemma sectionHomCochain_d (dual : Bool) (n : ℕ) :
    HEq ((sectionHomCochain A γ δ s t M dual).d n (n+1))
      (ModuleCat.ofHom (R := R₀) (X := H₀) (Y := H₀) (sectionHomDifferential A γ δ s t M dual n)) := by
  exact heq_of_eq (CochainComplex.of_d (fun _ : ℕ => ModuleCat.of R₀ H₀)
    (fun k => ModuleCat.ofHom (R := R₀) (sectionHomDifferential A γ δ s t M dual k)) n)

lemma sectionHomCochain_exactAt (dual : Bool) (n : ℕ) :
    (sectionHomCochain A γ δ s t M dual).ExactAt (n+1) := by
  rw [HomologicalComplex.exactAt_iff' _ n (n+1) (n+2) (by simp) (by simp)]
  rw [CategoryTheory.ShortComplex.moduleCat_exact_iff]
  intro h hh
  have hd := eq_of_heq (sectionHomCochain_d A γ δ s t M dual (n+1))
  have hd₀ := eq_of_heq (sectionHomCochain_d A γ δ s t M dual n)
  change (sectionHomCochain A γ δ s t M dual).d (n+1) (n+2) h = 0 at hh
  rw [hd] at hh
  obtain ⟨h₀,h₀eq⟩ := (sectionHomDifferential_exact A γ δ s t M dual n h).mp hh
  refine ⟨h₀,?_⟩
  change (sectionHomCochain A γ δ s t M dual).d n (n+1) h₀ = h
  rw [hd₀]
  exact h₀eq

lemma sectionHomCochain_isZero_homology (dual : Bool) (n : ℕ) :
    CategoryTheory.Limits.IsZero ((sectionHomCochain A γ δ s t M dual).homology (n+1)) :=
  (sectionHomCochain_exactAt A γ δ s t M dual n).isZero_homology

lemma sectionHomDifferential_ideal_zero :
    sectionHomDifferential A γ δ s t M false 0 =
      LinearMap.lcomp R₀ N₀ (Ψ₀).mulVecLin := rfl

lemma sectionHomDifferential_dual_zero :
    sectionHomDifferential A γ δ s t M true 0 =
      LinearMap.lcomp R₀ N₀ (Φ₀).mulVecLin := rfl

lemma sectionHomDifferential_periodic (dual : Bool) (n : ℕ) :
    sectionHomDifferential A γ δ s t M dual (n+2) =
      sectionHomDifferential A γ δ s t M dual n := by
  simp only [sectionHomDifferential, Nat.add_mod, Nat.mod_self, add_zero, Nat.mod_mod]

lemma sectionHomCochain_X (dual : Bool) (n : ℕ) :
    (sectionHomCochain A γ δ s t M dual).X n = ModuleCat.of R₀ H₀ := rfl

lemma sectionHomCochain_shape (dual : Bool) (i j : ℕ) (h : i+1 ≠ j) :
    (sectionHomCochain A γ δ s t M dual).d i j = 0 :=
  (sectionHomCochain A γ δ s t M dual).shape i j h

lemma sectionHomIdeal_augmentation_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (idealPresentation A γ δ s t))
      (sectionHomDifferential A γ δ s t M false 0) :=
  LinearMap.exact_lcomp_of_exact_of_surjective N₀
    (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t))
    (idealPresentation_surjective A γ δ s t)

lemma sectionHomDual_augmentation_exact :
    Function.Exact (LinearMap.lcomp R₀ N₀ (dualPresentation A γ δ s t))
      (sectionHomDifferential A γ δ s t M true 0) :=
  LinearMap.exact_lcomp_of_exact_of_surjective N₀
    (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t))
    (dualPresentation_surjective A γ δ s t)

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_ideal_signed_column
example (m : M) :
    sectionHomDifferential A 0 0 0 0 M false 0
      (sectionFreeTensorHom A 0 0 0 0 M (![0,1] ⊗ₜ[A] m)) (![1,0]) =
      AdjoinRoot.root (polynomial A 0 0 0 0) ⊗ₜ[A] m := by
  simp [sectionHomDifferential, sectionFreeTensorHom_tmul, right, Matrix.vecHead]

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_dual_negative_column
example (m : M) :
    sectionHomDifferential A 0 0 0 0 M true 0
      (sectionFreeTensorHom A 0 0 0 0 M (![0,1] ⊗ₜ[A] m)) (![1,0]) =
      (-AdjoinRoot.root (polynomial A 0 0 0 0)) ⊗ₜ[A] m := by
  simp [sectionHomDifferential, sectionFreeTensorHom_tmul, left, Matrix.vecHead]

-- test: NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_two_period
example (dual : Bool) (n : ℕ) :
    sectionHomDifferential A γ δ s t M dual (n+2) =
      sectionHomDifferential A γ δ s t M dual n :=
  sectionHomDifferential_periodic A γ δ s t M dual n

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_torsion_coefficient
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain ℤ 1 0 1 0 (ZMod 2) false).homology 3) :=
  sectionHomCochain_isZero_homology ℤ 1 0 1 0 (ZMod 2) false 2

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_nonreduced_base
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain (ZMod 4) 0 0 1 0 (ZMod 4) true).homology 2) :=
  sectionHomCochain_isZero_homology (ZMod 4) 0 0 1 0 (ZMod 4) true 1

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_zero_ring
example : CategoryTheory.Limits.IsZero
    ((sectionHomCochain (ZMod 1) 0 0 0 0 (ZMod 1) false).homology 1) :=
  sectionHomCochain_isZero_homology (ZMod 1) 0 0 0 0 (ZMod 1) false 0

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_actual_differential
example (n : ℕ) :
    HEq ((sectionHomCochain A γ δ s t M false).d n (n+1))
      (ModuleCat.ofHom (R := R₀) (X := H₀) (Y := H₀) (sectionHomDifferential A γ δ s t M false n)) :=
  sectionHomCochain_d A γ δ s t M false n

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_degree_zero_ideal
example (h : H₀) : sectionHomDifferential A γ δ s t M false 0 h = 0 ↔
    ∃ f : (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀) →ₗ[R₀] N₀, f.comp (idealPresentation A γ δ s t) = h :=
  sectionHomIdeal_augmentation_exact A γ δ s t M h

-- test: NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_degree_zero_dual
example (h : H₀) : sectionHomDifferential A γ δ s t M true 0 h = 0 ↔
    ∃ f : Module.Dual R₀ (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀) →ₗ[R₀] N₀, f.comp (dualPresentation A γ δ s t) = h :=
  sectionHomDual_augmentation_exact A γ δ s t M h

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomLeftRight_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomRightLeft_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_sq
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_d
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_exactAt
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_isZero_homology
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_ideal_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_dual_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_periodic
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_X
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_shape
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomIdeal_augmentation_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDual_augmentation_exact

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

def sectionChainDifferential (dual : Bool) (n : ℕ) : F₀ →ₗ[R₀] F₀ :=
  if (n % 2 = 0) = (dual = true) then (Φ₀).mulVecLin else (Ψ₀).mulVecLin

lemma sectionChainDifferential_exact (dual : Bool) (n : ℕ) :
    Function.Exact (sectionChainDifferential A γ δ s t dual (n+1))
      (sectionChainDifferential A γ δ s t dual n) := by
  have hl := LinearMap.exact_iff.mpr (quotientLeftExact A γ δ s t)
  have hr := LinearMap.exact_iff.mpr (quotientRightExact A γ δ s t)
  have hn : n % 2 = 0 ∨ n % 2 = 1 := by omega
  cases dual <;> rcases hn with hn | hn <;>
    simp [sectionChainDifferential, hn, show (n+1)%2 = 1-n%2 by omega, hl, hr]

lemma sectionChainDifferential_sq (dual : Bool) (n : ℕ) :
    (sectionChainDifferential A γ δ s t dual n).comp
      (sectionChainDifferential A γ δ s t dual (n+1)) = 0 :=
  (sectionChainDifferential_exact A γ δ s t dual n).linearMap_comp_eq_zero

def sectionChain (dual : Bool) : ChainComplex (ModuleCat.{u_resolution} R₀) ℕ :=
  ChainComplex.of (fun _ => ModuleCat.of R₀ F₀)
    (fun n => ModuleCat.ofHom (R := R₀) (sectionChainDifferential A γ δ s t dual n))
    (fun n => ModuleCat.hom_ext (sectionChainDifferential_sq A γ δ s t dual n))

lemma sectionChain_d (dual : Bool) (n : ℕ) :
    HEq ((sectionChain A γ δ s t dual).d (n+1) n)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (sectionChainDifferential A γ δ s t dual n)) := by
  exact heq_of_eq (ChainComplex.of_d (fun _ : ℕ => ModuleCat.of R₀ F₀)
    (fun k => ModuleCat.ofHom (R := R₀) (sectionChainDifferential A γ δ s t dual k)) n)

lemma sectionChain_exactAt (dual : Bool) (n : ℕ) :
    (sectionChain A γ δ s t dual).ExactAt (n+1) := by
  rw [HomologicalComplex.exactAt_iff' _ (n+2) (n+1) n (by simp) (by simp)]
  rw [CategoryTheory.ShortComplex.moduleCat_exact_iff]
  intro z hz
  change (sectionChain A γ δ s t dual).d (n+1) n z = 0 at hz
  rw [eq_of_heq (sectionChain_d A γ δ s t dual n)] at hz
  obtain ⟨w,hw⟩ := (sectionChainDifferential_exact A γ δ s t dual n z).mp hz
  refine ⟨w,?_⟩
  change (sectionChain A γ δ s t dual).d (n+2) (n+1) w = z
  rw [eq_of_heq (sectionChain_d A γ δ s t dual (n+1))]
  exact hw

lemma sectionChain_projective (dual : Bool) (n : ℕ) :
    CategoryTheory.Projective ((sectionChain A γ δ s t dual).X n) := by
  change CategoryTheory.Projective (ModuleCat.of R₀ F₀)
  infer_instance

lemma sectionChainIdeal_augmentation_zero :
    (idealPresentation A γ δ s t).comp
      (sectionChainDifferential A γ δ s t false 0) = 0 :=
  (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t)).linearMap_comp_eq_zero

lemma sectionChainDual_augmentation_zero :
    (dualPresentation A γ δ s t).comp
      (sectionChainDifferential A γ δ s t true 0) = 0 :=
  (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t)).linearMap_comp_eq_zero

def sectionIdealAugmentation : sectionChain A γ δ s t false ⟶
    (ChainComplex.single₀ (ModuleCat.{u_resolution} R₀)).obj (ModuleCat.of R₀ J₀) :=
  (ChainComplex.toSingle₀Equiv _ _).symm ⟨ModuleCat.ofHom (idealPresentation A γ δ s t), by
    rw [eq_of_heq (sectionChain_d A γ δ s t false 0)]
    exact ModuleCat.hom_ext (sectionChainIdeal_augmentation_zero A γ δ s t)⟩

def sectionDualAugmentation : sectionChain A γ δ s t true ⟶
    (ChainComplex.single₀ (ModuleCat.{u_resolution} R₀)).obj (ModuleCat.of R₀ D₀) :=
  (ChainComplex.toSingle₀Equiv _ _).symm ⟨ModuleCat.ofHom (dualPresentation A γ δ s t), by
    rw [eq_of_heq (sectionChain_d A γ δ s t true 0)]
    exact ModuleCat.hom_ext (sectionChainDual_augmentation_zero A γ δ s t)⟩

lemma sectionIdealAugmentation_zero :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) := by
  exact heq_of_eq (ChainComplex.toSingle₀Equiv_symm_apply_f_zero _ _)

lemma sectionDualAugmentation_zero :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) := by
  exact heq_of_eq (ChainComplex.toSingle₀Equiv_symm_apply_f_zero _ _)

set_option backward.isDefEq.respectTransparency false in
lemma sectionIdealAugmentation_quasiIso : QuasiIso (sectionIdealAugmentation A γ δ s t) := by
  have he : (ShortComplex.mk
      (ModuleCat.ofHom (sectionChainDifferential A γ δ s t false 0))
      (ModuleCat.ofHom (idealPresentation A γ δ s t))
      (ModuleCat.hom_ext (sectionChainIdeal_augmentation_zero A γ δ s t))).Exact ∧
      Epi (ModuleCat.ofHom (idealPresentation A γ δ s t)) := by
    constructor
    · rw [ShortComplex.moduleCat_exact_iff]
      intro z hz
      exact (LinearMap.exact_iff.mpr (idealPresentation_kernel A γ δ s t) z).mp hz
    · exact (ModuleCat.epi_iff_surjective _).mpr (idealPresentation_surjective A γ δ s t)
  refine ⟨fun n => ?_⟩
  cases n with
  | zero =>
    rw [ChainComplex.quasiIsoAt₀_iff, ShortComplex.quasiIso_iff_of_zeros']
    · refine (ShortComplex.exact_and_epi_g_iff_of_iso ?_).2 he
      exact ShortComplex.isoMk (Iso.refl _) (Iso.refl _) (Iso.refl _)
        (by simp [eq_of_heq (sectionChain_d A γ δ s t false 0), Category.id_comp, Category.comp_id]) (by simp [sectionIdealAugmentation, Category.id_comp, Category.comp_id])
    all_goals rfl
  | succ n =>
    rw [quasiIsoAt_iff_exactAt']
    · exact sectionChain_exactAt A γ δ s t false n
    · apply ChainComplex.exactAt_succ_single_obj

set_option backward.isDefEq.respectTransparency false in
lemma sectionDualAugmentation_quasiIso : QuasiIso (sectionDualAugmentation A γ δ s t) := by
  have he : (ShortComplex.mk
      (ModuleCat.ofHom (sectionChainDifferential A γ δ s t true 0))
      (ModuleCat.ofHom (dualPresentation A γ δ s t))
      (ModuleCat.hom_ext (sectionChainDual_augmentation_zero A γ δ s t))).Exact ∧
      Epi (ModuleCat.ofHom (dualPresentation A γ δ s t)) := by
    constructor
    · rw [ShortComplex.moduleCat_exact_iff]
      intro z hz
      exact (LinearMap.exact_iff.mpr (dualPresentation_kernel A γ δ s t) z).mp hz
    · exact (ModuleCat.epi_iff_surjective _).mpr (dualPresentation_surjective A γ δ s t)
  refine ⟨fun n => ?_⟩
  cases n with
  | zero =>
    rw [ChainComplex.quasiIsoAt₀_iff, ShortComplex.quasiIso_iff_of_zeros']
    · refine (ShortComplex.exact_and_epi_g_iff_of_iso ?_).2 he
      exact ShortComplex.isoMk (Iso.refl _) (Iso.refl _) (Iso.refl _)
        (by simp [eq_of_heq (sectionChain_d A γ δ s t true 0), Category.id_comp, Category.comp_id]) (by simp [sectionDualAugmentation, Category.id_comp, Category.comp_id])
    all_goals rfl
  | succ n =>
    rw [quasiIsoAt_iff_exactAt']
    · exact sectionChain_exactAt A γ δ s t true n
    · apply ChainComplex.exactAt_succ_single_obj

def sectionIdealResolution : ProjectiveResolution (ModuleCat.of R₀ J₀) where
  complex := sectionChain A γ δ s t false
  projective := sectionChain_projective A γ δ s t false
  π := sectionIdealAugmentation A γ δ s t
  quasiIso := sectionIdealAugmentation_quasiIso A γ δ s t

def sectionDualResolution : ProjectiveResolution (ModuleCat.of R₀ D₀) where
  complex := sectionChain A γ δ s t true
  projective := sectionChain_projective A γ δ s t true
  π := sectionDualAugmentation A γ δ s t
  quasiIso := sectionDualAugmentation_quasiIso A γ δ s t

lemma sectionChainDifferential_ideal_zero :
    sectionChainDifferential A γ δ s t false 0 = (Ψ₀).mulVecLin := rfl

lemma sectionChainDifferential_dual_zero :
    sectionChainDifferential A γ δ s t true 0 = (Φ₀).mulVecLin := rfl

lemma sectionChainDifferential_periodic (dual : Bool) (n : ℕ) :
    sectionChainDifferential A γ δ s t dual (n+2) =
      sectionChainDifferential A γ δ s t dual n := by
  simp only [sectionChainDifferential, Nat.add_mod, Nat.mod_self, add_zero, Nat.mod_mod]

lemma sectionChain_X (dual : Bool) (n : ℕ) :
    (sectionChain A γ δ s t dual).X n = ModuleCat.of R₀ F₀ := rfl

lemma sectionChain_finiteFree (dual : Bool) (n : ℕ) :
    Module.Free R₀ ((sectionChain A γ δ s t dual).X n) ∧
      Module.Finite R₀ ((sectionChain A γ δ s t dual).X n) := by
  constructor
  · change Module.Free R₀ F₀
    infer_instance
  · change Module.Finite R₀ F₀
    infer_instance

lemma sectionChain_shape (dual : Bool) (i j : ℕ) (h : j+1 ≠ i) :
    (sectionChain A γ δ s t dual).d i j = 0 :=
  (sectionChain A γ δ s t dual).shape i j h

lemma sectionResolutionHom_d (M : Type*) [AddCommGroup M] [Module A M]
    (dual : Bool) (n : ℕ) :
    HEq (LinearMap.lcomp R₀ (R₀ ⊗[A] M) ((sectionChain A γ δ s t dual).d (n+1) n).hom)
      (sectionHomDifferential A γ δ s t M dual n) := by
  apply heq_of_eq
  rw [eq_of_heq (sectionChain_d A γ δ s t dual n)]
  have hn : n % 2 = 0 ∨ n % 2 = 1 := by omega
  cases dual <;> rcases hn with hn | hn <;>
    simp [sectionChainDifferential, sectionHomDifferential, hn]
  all_goals rfl

lemma sectionIdealResolution_complex :
    (sectionIdealResolution A γ δ s t).complex = sectionChain A γ δ s t false := rfl

lemma sectionIdealResolution_augmentation :
    HEq ((sectionIdealResolution A γ δ s t).π) (sectionIdealAugmentation A γ δ s t) := HEq.rfl

lemma sectionDualResolution_complex :
    (sectionDualResolution A γ δ s t).complex = sectionChain A γ δ s t true := rfl

lemma sectionDualResolution_augmentation :
    HEq ((sectionDualResolution A γ δ s t).π) (sectionDualAugmentation A γ δ s t) := HEq.rfl

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_ideal_signed_column
example : sectionChainDifferential A 0 0 0 0 false 0 (![1,0]) 1 =
    AdjoinRoot.root (polynomial A 0 0 0 0) := by
  simp [sectionChainDifferential, right, Matrix.mulVec, dotProduct]

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_dual_negative_column
example : sectionChainDifferential A 0 0 0 0 true 0 (![1,0]) 1 =
    -AdjoinRoot.root (polynomial A 0 0 0 0) := by
  simp [sectionChainDifferential, left, Matrix.mulVec, dotProduct, Fin.sum_univ_two]

-- test: NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_two_period
example (dual : Bool) (n : ℕ) : sectionChainDifferential A γ δ s t dual (n+2) =
    sectionChainDifferential A γ δ s t dual n :=
  sectionChainDifferential_periodic A γ δ s t dual n

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_nonreduced_exact
example : (sectionChain (ZMod 4) 0 0 1 0 false).ExactAt 2 :=
  sectionChain_exactAt (ZMod 4) 0 0 1 0 false 1

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_finite_projective
example (dual : Bool) (n : ℕ) :
    CategoryTheory.Projective ((sectionChain A γ δ s t dual).X n) ∧
      Module.Finite R₀ ((sectionChain A γ δ s t dual).X n) :=
  ⟨sectionChain_projective A γ δ s t dual n, (sectionChain_finiteFree A γ δ s t dual n).2⟩

-- test: NodeSectionFactorization.PolynomialModel.sectionChain.test_hom_coefficient_differential
example (M : Type*) [AddCommGroup M] [Module A M] (dual : Bool) (n : ℕ) :
    HEq (LinearMap.lcomp R₀ (R₀ ⊗[A] M) ((sectionChain A γ δ s t dual).d (n+1) n).hom)
      (sectionHomDifferential A γ δ s t M dual n) :=
  sectionResolutionHom_d A γ δ s t M dual n

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_first_generator
example :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) ∧
      (idealPresentation A γ δ s t (![1,0]) : R₀) = u₀ - ι₀ s := by
  refine ⟨sectionIdealAugmentation_zero A γ δ s t,?_⟩
  simp [idealPresentation]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_second_signed_generator
example :
    HEq ((sectionIdealAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := J₀) (idealPresentation A γ δ s t)) ∧
      (idealPresentation A γ δ s t (![0,1]) : R₀) = -(v₀ - ι₀ t) := by
  refine ⟨sectionIdealAugmentation_zero A γ δ s t,?_⟩
  simp [idealPresentation]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_positive_component_zero
example (n : ℕ) : (sectionIdealAugmentation A γ δ s t).f (n+1) = 0 := by
  exact (HomologicalComplex.isZero_single_obj_X _ _ _ _ (by simp)).eq_of_tgt _ _

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_first_generator
example (j : J₀) :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) ∧
      dualPresentation A γ δ s t (![1,0]) j = (j : R₀) := by
  refine ⟨sectionDualAugmentation_zero A γ δ s t,?_⟩
  simp [dualPresentation_apply]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_second_signed_generator
example (j : J₀) :
    HEq ((sectionDualAugmentation A γ δ s t).f 0)
      (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := D₀) (dualPresentation A γ δ s t)) ∧
      dualPresentation A γ δ s t (![0,1]) j = -dualGenerator A γ δ s t j := by
  refine ⟨sectionDualAugmentation_zero A γ δ s t,?_⟩
  simp [dualPresentation_apply]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_positive_component_zero
example (n : ℕ) : (sectionDualAugmentation A γ δ s t).f (n+1) = 0 := by
  exact (HomologicalComplex.isZero_single_obj_X _ _ _ _ (by simp)).eq_of_tgt _ _

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_starting_psi
example : HEq ((sectionIdealResolution A γ δ s t).complex.d 1 0)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Ψ₀).mulVecLin) := by
  apply heq_of_eq
  change (sectionChain A γ δ s t false).d 1 0 = _
  rw [eq_of_heq (sectionChain_d A γ δ s t false 0), sectionChainDifferential_ideal_zero]

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_next_phi
example : HEq ((sectionIdealResolution A γ δ s t).complex.d 2 1)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Φ₀).mulVecLin) := by
  apply heq_of_eq
  change (sectionChain A γ δ s t false).d 2 1 = _
  rw [eq_of_heq (sectionChain_d A γ δ s t false 1)]
  rfl

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_zero_ring_quasiIso
example : QuasiIso (sectionIdealResolution (ZMod 1) 0 0 0 0).π :=
  (sectionIdealResolution (ZMod 1) 0 0 0 0).quasiIso

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_starting_phi
example : HEq ((sectionDualResolution A γ δ s t).complex.d 1 0)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Φ₀).mulVecLin) := by
  apply heq_of_eq
  change (sectionChain A γ δ s t true).d 1 0 = _
  rw [eq_of_heq (sectionChain_d A γ δ s t true 0), sectionChainDifferential_dual_zero]

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_next_psi
example : HEq ((sectionDualResolution A γ δ s t).complex.d 2 1)
    (ModuleCat.ofHom (R := R₀) (X := F₀) (Y := F₀) (Ψ₀).mulVecLin) := by
  apply heq_of_eq
  change (sectionChain A γ δ s t true).d 2 1 = _
  rw [eq_of_heq (sectionChain_d A γ δ s t true 1)]
  rfl

-- test: NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_nonreduced_quasiIso
example : QuasiIso (sectionDualResolution (ZMod 4) 0 0 1 0).π :=
  (sectionDualResolution (ZMod 4) 0 0 1 0).quasiIso

lemma sectionIdealResolution_quasiIso :
    QuasiIso (sectionIdealResolution A γ δ s t).π :=
  (sectionIdealResolution A γ δ s t).quasiIso

lemma sectionDualResolution_quasiIso :
    QuasiIso (sectionDualResolution A γ δ s t).π :=
  (sectionDualResolution A γ δ s t).quasiIso

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_sq
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_d
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_exactAt
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_projective
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainIdeal_augmentation_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDual_augmentation_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_quasiIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_quasiIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_ideal_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_dual_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_periodic
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_X
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_finiteFree
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_shape
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHom_d
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_complex
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_augmentation
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_complex
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_augmentation

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_quasiIso

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_quasiIso

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

set_option backward.isDefEq.respectTransparency false in
def sectionResolutionHomIso (dual : Bool) :
    (sectionChain A γ δ s t dual).linearYonedaObj R₀ (ModuleCat.of R₀ N₀) ≅
      sectionHomCochain A γ δ s t M dual :=
  HomologicalComplex.Hom.isoOfComponents
    (fun _ => (ModuleCat.homLinearEquiv (S := R₀)).toModuleIso)
    (by
      intro i j hij
      obtain rfl : j = i+1 := hij.symm
      apply ModuleCat.hom_ext
      apply LinearMap.ext
      intro h
      rw [eq_of_heq (sectionHomCochain_d A γ δ s t M dual i)]
      change sectionHomDifferential A γ δ s t M dual i h.hom =
        h.hom.comp ((sectionChain A γ δ s t dual).d (i+1) i).hom
      exact congrArg (fun f => f h.hom) (eq_of_heq
        (sectionResolutionHom_d A γ δ s t M dual i)).symm)

lemma sectionResolutionHomIso_apply (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).hom.f n h) h.hom := HEq.rfl

lemma sectionResolutionHomIso_inv_apply (dual : Bool) (n : ℕ)
    :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).inv.f n)
      (ModuleCat.ofHom (ModuleCat.homLinearEquiv (S := R₀)
        (M := ModuleCat.of R₀ F₀) (N := ModuleCat.of R₀ N₀)).symm.toLinearMap) := HEq.rfl

set_option backward.isDefEq.respectTransparency false in
lemma sectionResolutionHom_exact (dual : Bool) (n : ℕ) :
    Function.Exact
      (fun h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀ =>
        (sectionChain A γ δ s t dual).d (n+1) n ≫ h)
      (fun h : (sectionChain A γ δ s t dual).X (n+1) ⟶ ModuleCat.of R₀ N₀ =>
        (sectionChain A γ δ s t dual).d (n+2) (n+1) ≫ h) := by
  intro h
  constructor
  · intro hh
    have hc : sectionHomDifferential A γ δ s t M dual (n+1) h.hom = 0 := by
      rw [← eq_of_heq (sectionResolutionHom_d A γ δ s t M dual (n+1))]
      exact congrArg ModuleCat.Hom.hom hh
    obtain ⟨g,hg⟩ := (sectionHomDifferential_exact A γ δ s t M dual n h.hom).mp hc
    refine ⟨ModuleCat.ofHom g, ?_⟩
    apply ModuleCat.hom_ext
    change g.comp ((sectionChain A γ δ s t dual).d (n+1) n).hom = h.hom
    exact (congrArg (fun f => f g) (eq_of_heq
      (sectionResolutionHom_d A γ δ s t M dual n))).trans hg
  · rintro ⟨g,rfl⟩
    simp [← Category.assoc, HomologicalComplex.d_comp_d]

def sectionIdealDerivedExtIso (n : ℕ) :
    ((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) n).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀) ≅
      (sectionHomCochain A γ δ s t M false).homology n :=
  (sectionIdealResolution A γ δ s t).isoExt n (ModuleCat.of R₀ N₀) ≪≫
    (HomologicalComplex.homologyFunctor _ _ n).mapIso
      (sectionResolutionHomIso A γ δ s t M false)

def sectionDualDerivedExtIso (n : ℕ) :
    ((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) n).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀) ≅
      (sectionHomCochain A γ δ s t M true).homology n :=
  (sectionDualResolution A γ δ s t).isoExt n (ModuleCat.of R₀ N₀) ≪≫
    (HomologicalComplex.homologyFunctor _ _ n).mapIso
      (sectionResolutionHomIso A γ δ s t M true)

lemma sectionIdealDerivedExtIso_inverse (n : ℕ) :
    (sectionIdealDerivedExtIso A γ δ s t M n).hom ≫
      (sectionIdealDerivedExtIso A γ δ s t M n).inv = 𝟙 _ :=
  (sectionIdealDerivedExtIso A γ δ s t M n).hom_inv_id

lemma sectionDualDerivedExtIso_inverse (n : ℕ) :
    (sectionDualDerivedExtIso A γ δ s t M n).hom ≫
      (sectionDualDerivedExtIso A γ δ s t M n).inv = 𝟙 _ :=
  (sectionDualDerivedExtIso A γ δ s t M n).hom_inv_id

lemma sectionIdealDerivedExtIso_zero (n : ℕ) :
    (sectionIdealDerivedExtIso A γ δ s t M n).hom 0 = 0 :=
  map_zero (sectionIdealDerivedExtIso A γ δ s t M n).hom.hom

lemma sectionDualDerivedExtIso_zero (n : ℕ) :
    (sectionDualDerivedExtIso A γ δ s t M n).hom 0 = 0 :=
  map_zero (sectionDualDerivedExtIso A γ δ s t M n).hom.hom

lemma sectionIdealDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀)) :=
  Limits.IsZero.of_iso (sectionHomCochain_isZero_homology A γ δ s t M false n)
    (sectionIdealDerivedExtIso A γ δ s t M (n+1))

lemma sectionDualDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_ext} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀)) :=
  Limits.IsZero.of_iso (sectionHomCochain_isZero_homology A γ δ s t M true n)
    (sectionDualDerivedExtIso A γ δ s t M (n+1))

lemma sectionIdealExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ J₀) (ModuleCat.of R₀ N₀) (n+1)) :
    α = 0 := by
  let P := sectionIdealResolution A γ δ s t
  obtain ⟨f,hf,rfl⟩ := P.extMk_surjective α (n+2) rfl
  apply (P.extMk_eq_zero_iff f (n+2) rfl hf n rfl).mpr
  exact (sectionResolutionHom_exact A γ δ s t M false n f).mp hf

lemma sectionDualExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ D₀) (ModuleCat.of R₀ N₀) (n+1)) :
    α = 0 := by
  let P := sectionDualResolution A γ δ s t
  obtain ⟨f,hf,rfl⟩ := P.extMk_surjective α (n+2) rfl
  apply (P.extMk_eq_zero_iff f (n+2) rfl hf n rfl).mpr
  exact (sectionResolutionHom_exact A γ δ s t M true n f).mp hf

lemma sectionResolutionHomIso_natural {M' : Type u_ext} [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M' dual).hom.f n
      (h ≫ ModuleCat.ofHom (AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f)))
      ((AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f).comp h.hom) := HEq.rfl

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_actual_components
example (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M dual).hom.f n h) h.hom :=
  sectionResolutionHomIso_apply A γ δ s t M dual n h

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_inverse
example (dual : Bool) (n : ℕ) :
    ((sectionResolutionHomIso A γ δ s t M dual).inv ≫
      (sectionResolutionHomIso A γ δ s t M dual).hom).f n =
        𝟙 ((sectionHomCochain A γ δ s t M dual).X n) := by
  exact congrArg (fun f => f.f n) (sectionResolutionHomIso A γ δ s t M dual).inv_hom_id

-- test: NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_naturality
example {M' : Type u_ext} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (dual : Bool) (n : ℕ)
    (h : (sectionChain A γ δ s t dual).X n ⟶ ModuleCat.of R₀ N₀) :
    HEq ((sectionResolutionHomIso A γ δ s t M' dual).hom.f n
      (h ≫ ModuleCat.ofHom (AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f)))
      ((AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f).comp h.hom) :=
  sectionResolutionHomIso_natural A γ δ s t M f dual n h

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_degree_zero
example (x : (( _root_.Ext R₀ (ModuleCat.{u_ext} R₀) 0).obj
    (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ N₀)) :
    (sectionIdealDerivedExtIso A γ δ s t M 0).inv
      ((sectionIdealDerivedExtIso A γ δ s t M 0).hom x) = x := by
  exact congrArg (fun f => f x) (sectionIdealDerivedExtIso A γ δ s t M 0).hom_inv_id

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_nonflat
example : Limits.IsZero (((_root_.Ext (Ring ℤ 1 0 1 0)
    (ModuleCat.{0} (Ring ℤ 1 0 1 0)) 3).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal ℤ 1 0 1 0)))).obj
        (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2))) :=
  sectionIdealDerivedExt_isZero ℤ 1 0 1 0 (ZMod 2) 2

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_zero_ring
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 1) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 1) 0 0 0 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal (ZMod 1) 0 0 0 0)))).obj
        (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0 ⊗[ZMod 1] ZMod 1))) :=
  sectionIdealDerivedExt_isZero (ZMod 1) 0 0 0 0 (ZMod 1) 0

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_degree_zero
example (x : (( _root_.Ext R₀ (ModuleCat.{u_ext} R₀) 0).obj
    (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ N₀)) :
    (sectionDualDerivedExtIso A γ δ s t M 0).inv
      ((sectionDualDerivedExtIso A γ δ s t M 0).hom x) = x := by
  exact congrArg (fun f => f x) (sectionDualDerivedExtIso A γ δ s t M 0).hom_inv_id

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_nonreduced
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 4) 0 0 1 0)
    (ModuleCat.{0} (Ring (ZMod 4) 0 0 1 0)) 2).obj
      (Opposite.op (ModuleCat.of _ (Module.Dual (Ring (ZMod 4) 0 0 1 0)
        (sectionIdeal (ZMod 4) 0 0 1 0))))).obj
        (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0 ⊗[ZMod 4] ZMod 4))) :=
  sectionDualDerivedExt_isZero (ZMod 4) 0 0 1 0 (ZMod 4) 1

-- test: NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_nonflat
example : Limits.IsZero (((_root_.Ext (Ring ℤ 1 0 1 0)
    (ModuleCat.{0} (Ring ℤ 1 0 1 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))))).obj
        (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2))) :=
  sectionDualDerivedExt_isZero ℤ 1 0 1 0 (ZMod 2) 0

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealExt.test_nonflat
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))
    (ModuleCat.of _ (Ring ℤ 1 0 1 0 ⊗[ℤ] ZMod 2)) 4) : α = 0 :=
  sectionIdealExt_eq_zero ℤ 1 0 1 0 (ZMod 2) 3 α

-- test: NodeSectionFactorization.PolynomialModel.sectionDualExt.test_nonreduced
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 4) 0 0 1 0)
      (Module.Dual (Ring (ZMod 4) 0 0 1 0) (sectionIdeal (ZMod 4) 0 0 1 0)))
    (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0 ⊗[ZMod 4] ZMod 4)) 2) : α = 0 :=
  sectionDualExt_eq_zero (ZMod 4) 0 0 1 0 (ZMod 4) 1 α

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealExt.test_zero_ring
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 1) 0 0 0 0) (sectionIdeal (ZMod 1) 0 0 0 0))
    (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0 ⊗[ZMod 1] ZMod 1)) 1) : α = 0 :=
  sectionIdealExt_eq_zero (ZMod 1) 0 0 0 0 (ZMod 1) 0 α

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel

#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_inv_apply
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHom_exact
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_inverse
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExt_isZero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExt_isZero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealExt_eq_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualExt_eq_zero
#print axioms TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_natural
END ARCHIVED RELATIVE CRITERION IncomingNative.lean -/

/- BEGIN ARCHIVED RELATIVE CRITERION FullCanonical.lean
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
END ARCHIVED RELATIVE CRITERION FullCanonical.lean -/

/- BEGIN ARCHIVED RELATIVE CRITERION NewNative.lean
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
    Module.Dual R₀ D₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀) :=
  (AlgebraTensorModule.congr (sectionBidualEquiv A γ δ s t).symm
    (LinearEquiv.refl A M)).trans (sectionIdealTensorHomEquiv A γ δ s t M)

lemma sectionBidualTensorHomEquiv_tmul (F : Module.Dual R₀ D₀) (m : M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M (F ⊗ₜ[A] m) h = F h ⊗ₜ[A] m := by
  change h ((sectionBidualEquiv A γ δ s t).symm F) ⊗ₜ[A] m = _
  have he := congrArg (fun G : Module.Dual R₀ D₀ => G h)
    ((sectionBidualEquiv A γ δ s t).apply_symm_apply F)
  exact congrArg (fun r : R₀ => r ⊗ₜ[A] m) he

lemma sectionBidualTensorHomEquiv_inverse (F : Module.Dual R₀ D₀) (m : M) :
    (sectionBidualTensorHomEquiv A γ δ s t M).symm
      (sectionBidualTensorHomEquiv A γ δ s t M (F ⊗ₜ[A] m)) = F ⊗ₜ[A] m :=
  (sectionBidualTensorHomEquiv A γ δ s t M).symm_apply_apply _

lemma sectionBidualTensorHomEquiv_unique
    (e : Module.Dual R₀ D₀ ⊗[A] M ≃ₗ[R₀] (D₀ →ₗ[R₀] N₀))
    (he : ∀ F m h, e (F ⊗ₜ[A] m) h = F h ⊗ₜ[A] m) :
    e = sectionBidualTensorHomEquiv A γ δ s t M := by
  apply LinearEquiv.toLinearMap_injective
  apply AlgebraTensorModule.ext
  intro F m
  ext h
  exact (he F m h).trans (sectionBidualTensorHomEquiv_tmul A γ δ s t M F m h).symm

lemma sectionBidualTensorHomEquiv_natural
    {M' : Type u_rel} [AddCommGroup M'] [Module A M'] (f : M →ₗ[A] M')
    (x : Module.Dual R₀ D₀ ⊗[A] M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M'
      (AlgebraTensorModule.map (LinearMap.id : Module.Dual R₀ D₀ →ₗ[R₀] _) f x) h =
    AlgebraTensorModule.map (LinearMap.id : R₀ →ₗ[R₀] R₀) f
      (sectionBidualTensorHomEquiv A γ δ s t M x h) := by
  induction x using TensorProduct.induction_on with
  | zero => simp
  | tmul F m => simp [sectionBidualTensorHomEquiv_tmul]
  | add x y hx hy => simp [hx, hy]

lemma sectionBidualTensorHomEquiv_evaluation (x : J₀ ⊗[A] M) :
    sectionBidualTensorHomEquiv A γ δ s t M
      (AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀) x) =
        sectionIdealTensorHomEquiv A γ δ s t M x := by
  induction x using TensorProduct.induction_on with
  | zero =>
    rw [(AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀)).map_zero,
      (sectionBidualTensorHomEquiv A γ δ s t M).map_zero]
    exact (sectionIdealTensorHomEquiv A γ δ s t M).map_zero.symm
  | tmul j m => ext h; exact sectionBidualTensorHomEquiv_tmul A γ δ s t M _ m h
  | add x y hx hy =>
    rw [(AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀)).map_add,
      (sectionBidualTensorHomEquiv A γ δ s t M).map_add, hx, hy]
    exact ((sectionIdealTensorHomEquiv A γ δ s t M).map_add x y).symm

lemma sectionIdealAbsoluteDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).obj (ModuleCat.of R₀ R₀)) := by
  let e := (AlgebraTensorModule.rid A R₀ R₀).toModuleIso
  exact Limits.IsZero.of_iso (sectionIdealDerivedExt_isZero A γ δ s t A n)
    (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ J₀))).mapIso e.symm)

lemma sectionDualAbsoluteDerivedExt_isZero (n : ℕ) :
    Limits.IsZero (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).obj (ModuleCat.of R₀ R₀)) := by
  let e := (AlgebraTensorModule.rid A R₀ R₀).toModuleIso
  exact Limits.IsZero.of_iso (sectionDualDerivedExt_isZero A γ δ s t A n)
    (((_root_.Ext R₀ (ModuleCat.{u_rel} R₀) (n+1)).obj
      (Opposite.op (ModuleCat.of R₀ D₀))).mapIso e.symm)

set_option backward.defeqAttrib.useBackward true in
lemma sectionIdealAbsoluteExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ J₀) (ModuleCat.of R₀ R₀) (n+1)) :
    α = 0 := by
  let e := (CategoryTheory.Abelian.extFunctorObj (ModuleCat.of R₀ J₀) (n+1)).mapIso
    ((AlgebraTensorModule.rid A R₀ R₀).toModuleIso)
  have hz := sectionIdealExt_eq_zero A γ δ s t A n (e.inv α)
  apply e.addCommGroupIsoToAddEquiv.symm.injective
  change e.inv α = e.inv 0
  rw [hz]
  exact (map_zero e.inv.hom).symm

set_option backward.defeqAttrib.useBackward true in
lemma sectionDualAbsoluteExt_eq_zero (n : ℕ)
    (α : CategoryTheory.Abelian.Ext (ModuleCat.of R₀ D₀) (ModuleCat.of R₀ R₀) (n+1)) :
    α = 0 := by
  let e := (CategoryTheory.Abelian.extFunctorObj (ModuleCat.of R₀ D₀) (n+1)).mapIso
    ((AlgebraTensorModule.rid A R₀ R₀).toModuleIso)
  have hz := sectionDualExt_eq_zero A γ δ s t A n (e.inv α)
  apply e.addCommGroupIsoToAddEquiv.symm.injective
  change e.inv α = e.inv 0
  rw [hz]
  exact (map_zero e.inv.hom).symm

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_unit
example (F : Module.Dual R₀ D₀) (h : D₀) :
    AlgebraTensorModule.rid A R₀ R₀
      (sectionBidualTensorHomEquiv A γ δ s t A (F ⊗ₜ[A] 1) h) = F h := by
  rw [sectionBidualTensorHomEquiv_tmul, AlgebraTensorModule.rid_tmul, one_smul]

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_torsion
example (F : Module.Dual (Ring ℤ 1 0 1 0)
    (Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0)))
    (h : Module.Dual (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0)) :
    sectionBidualTensorHomEquiv ℤ 1 0 1 0 (ZMod 2) (F ⊗ₜ[ℤ] 1) h = F h ⊗ₜ[ℤ] 1 :=
  sectionBidualTensorHomEquiv_tmul ℤ 1 0 1 0 (ZMod 2) F 1 h

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv.test_inverse_nonreduced
example (F : Module.Dual (Ring (ZMod 4) 0 0 0 0)
    (Module.Dual (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0))) :
    (sectionBidualTensorHomEquiv (ZMod 4) 0 0 0 0 (ZMod 4)).symm
      (sectionBidualTensorHomEquiv (ZMod 4) 0 0 0 0 (ZMod 4) (F ⊗ₜ[ZMod 4] 1)) =
        F ⊗ₜ[ZMod 4] 1 :=
  sectionBidualTensorHomEquiv_inverse (ZMod 4) 0 0 0 0 (ZMod 4) F 1

-- test: NodeSectionFactorization.PolynomialModel.sectionBidualTensorHomEquiv_evaluation.test_native
example (j : J₀) (m : M) (h : D₀) :
    sectionBidualTensorHomEquiv A γ δ s t M
      (AlgebraTensorModule.rTensor A M (Module.Dual.eval R₀ J₀) (j ⊗ₜ[A] m)) h =
        h j ⊗ₜ[A] m :=
  sectionBidualTensorHomEquiv_tmul A γ δ s t M _ m h

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAbsoluteDerivedExt.test_zero_ring
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 1) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 1) 0 0 0 0)) 1).obj
      (Opposite.op (ModuleCat.of _ (sectionIdeal (ZMod 1) 0 0 0 0)))).obj
        (ModuleCat.of _ (Ring (ZMod 1) 0 0 0 0))) :=
  sectionIdealAbsoluteDerivedExt_isZero (ZMod 1) 0 0 0 0 0

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAbsoluteDerivedExt.test_nonreduced
example : Limits.IsZero (((_root_.Ext (Ring (ZMod 4) 0 0 0 0)
    (ModuleCat.{0} (Ring (ZMod 4) 0 0 0 0)) 2).obj
      (Opposite.op (ModuleCat.of _
        (Module.Dual (Ring (ZMod 4) 0 0 0 0) (sectionIdeal (ZMod 4) 0 0 0 0))))).obj
        (ModuleCat.of _ (Ring (ZMod 4) 0 0 0 0))) :=
  sectionDualAbsoluteDerivedExt_isZero (ZMod 4) 0 0 0 0 1

-- test: NodeSectionFactorization.PolynomialModel.sectionIdealAbsoluteExt.test_integral
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring ℤ 1 0 1 0) (sectionIdeal ℤ 1 0 1 0))
    (ModuleCat.of _ (Ring ℤ 1 0 1 0)) 3) : α = 0 :=
  sectionIdealAbsoluteExt_eq_zero ℤ 1 0 1 0 2 α

-- test: NodeSectionFactorization.PolynomialModel.sectionDualAbsoluteExt.test_nonreduced
example (α : CategoryTheory.Abelian.Ext
    (ModuleCat.of (Ring (ZMod 4) 0 0 1 0)
      (Module.Dual (Ring (ZMod 4) 0 0 1 0) (sectionIdeal (ZMod 4) 0 0 1 0)))
    (ModuleCat.of _ (Ring (ZMod 4) 0 0 1 0)) 4) : α = 0 :=
  sectionDualAbsoluteExt_eq_zero (ZMod 4) 0 0 1 0 3 α

end
end TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel
END ARCHIVED RELATIVE CRITERION NewNative.lean -/

/- BEGIN ARCHIVED RELATIVE CRITERION NewAdmitted.lean
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
END ARCHIVED RELATIVE CRITERION NewAdmitted.lean -/
