import Mathlib.Algebra.Ring.Hom.Defs
import Mathlib.Algebra.Group.Units.Defs
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.RingTheory.AdjoinRoot

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
StableReductionPartII.md is definitive. These suggested Lean forms help
contributors and reviewers converge on names and signatures.

CHECKPOINT: the explicit ring and matrix interfaces below are supplemented by
native polynomial-quotient/module candidates in NodeSectionFactorization.PolynomialModel.
Those candidates still need integration into the packet's prototypeCoverage and
baseline ledgers; they are not counted as completed canonical exports. See the
2026-10-02 continuation in handoff/DESIGN-StableReductionPartII.md for the full
proof, source/pin receipts, counterexamples and exact remaining integration work.
This file was not compiled: no existing built Lake environment at both pinned
commits was available. No project or cache was created. Comments are omissions,
not declarations or proofs.

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
    NodeForm γ δ x y = x ^ 2 + γ * x * y + δ * y ^ 2 := by
  sorry

-- NodeForm.map
theorem map (φ : R →+* S) (γ δ x y : R) :
    φ (NodeForm γ δ x y) = NodeForm (φ γ) (φ δ) (φ x) (φ y) := by
  sorry

/-- The polynomial correction identity; power-series ideal membership is a supplier input. -/
-- NodeForm.linearCorrection
theorem linearCorrection (γ δ x y ε u v : R) (hε : ε ^ 2 = 0) :
    NodeForm γ δ (x + ε * (-2 * δ * u + γ * v))
      (y + ε * (γ * u - 2 * v)) =
      NodeForm γ δ x y + ε * discriminant γ δ * (x * u + y * v) := by
  sorry

-- NodeForm.split
example (x y : R) : NodeForm (0 : R) (-1) x y = x ^ 2 - y ^ 2 := by
  sorry

example (h2 : IsUnit (2 : R)) : Nondegenerate (0 : R) (-1) := by
  sorry

-- NodeForm.characteristicTwo
example (h2 : (2 : R) = 0) (x y : R) :
    Nondegenerate (1 : R) 0 ∧ NodeForm (1 : R) 0 x y = x ^ 2 + x * y := by
  sorry

-- NodeForm.doubleLineExcluded
example : ¬ Nondegenerate (0 : ℤ) 0 := by
  sorry

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
      Matrix.scalar (Fin 2) (NodeForm γ δ x y - NodeForm γ δ s t) := by
  sorry

-- NodeSectionFactorization.atOrigin
example (γ δ x y : R) :
    left γ δ x y 0 0 = Matrix.of (fun i j =>
      if i = 0 then
        if j = 0 then δ * y + γ * x else x
      else
        if j = 0 then -x else y) := by
  sorry

-- NodeSectionFactorization.characteristicTwo
example (h2 : (2 : R) = 0) (x y s t : R) :
    left 1 0 x y s t * right 1 0 x y s t =
      Matrix.scalar (Fin 2) (x ^ 2 + x * y - (s ^ 2 + s * t)) := by
  sorry

-- NodeSectionFactorization.repeatedRootExcluded
example : ¬ NodeForm.Nondegenerate (0 : ℤ) 0 := by
  sorry

/-
Candidate signatures for the local polynomial-model proof in MC.2.
The polynomial and its quotient are native Mathlib objects, not opaque carriers.
These candidates are not yet counted in the packet's prototypeCoverage ledger.
-/
namespace PolynomialModel

open Polynomial

variable (A : Type*) [CommRing A] (γ δ s t : A)

-- The inner variable is Y and the outer variable is X.
local notation "w₀" =>
  ((Polynomial.X : Polynomial (Polynomial A)) ^ 2 +
    Polynomial.C (Polynomial.C γ * Polynomial.X) * Polynomial.X +
    Polynomial.C (Polynomial.C δ * Polynomial.X ^ 2 -
      Polynomial.C (NodeForm γ δ s t)))
local notation "R₀" => AdjoinRoot w₀
local notation "ι₀" =>
  ((AdjoinRoot.of w₀).comp (Polynomial.C : A →+* Polynomial A))
local notation "u₀" => AdjoinRoot.root w₀
local notation "v₀" => AdjoinRoot.of w₀ (Polynomial.X : Polynomial A)
local notation "α₀" => left (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "β₀" => right (ι₀ γ) (ι₀ δ) u₀ v₀ (ι₀ s) (ι₀ t)
local notation "J₀" => (Ideal.span {u₀ - ι₀ s, v₀ - ι₀ t} : Ideal R₀)

/-- Monic division gives a unique pair of coefficient polynomials over any base ring. -/
theorem normalForm (r : R₀) :
    ∃! p : Polynomial A × Polynomial A,
      r = AdjoinRoot.of w₀ p.1 + u₀ * AdjoinRoot.of w₀ p.2 := by
  sorry

/-- The section's Y-coordinate difference is regular; the base need not be a domain. -/
theorem sectionCoordinateRegular :
    Function.Injective (fun r : R₀ => (v₀ - ι₀ t) * r) := by
  sorry

/-- Candidate for the exactness part of
`StableReductionPartII:MC.2/node-factorization-exact`.

The four equalities explicitly include the dual complex. The source-bound
hypotheses are retained even though monic lift-and-cancel proves these
particular equalities over every commutative base ring. -/
theorem quotientExact [IsNoetherianRing A] (hΔ : NodeForm.Nondegenerate γ δ) :
    LinearMap.ker α₀.mulVecLin = LinearMap.range β₀.mulVecLin ∧
    LinearMap.ker β₀.mulVecLin = LinearMap.range α₀.mulVecLin ∧
    LinearMap.ker α₀.transpose.mulVecLin = LinearMap.range β₀.transpose.mulVecLin ∧
    LinearMap.ker β₀.transpose.mulVecLin = LinearMap.range α₀.transpose.mulVecLin := by
  sorry

/-- Candidate for `NodeSectionFactorization.cokernels`.

The cokernel of the RIGHT matrix is the section ideal. The cokernel of the
LEFT matrix is its actual R-linear dual. The displayed formulas fix the maps,
not merely the abstract isomorphism classes. Multiplication by `v₀ - ι₀ t`
avoids division in the statement of the dual map; `sectionCoordinateRegular`
makes that characterization unambiguous. -/
theorem cokernels [IsNoetherianRing A] (hΔ : NodeForm.Nondegenerate γ δ) :
    ∃ (eJ : ((Fin 2 → R₀) ⧸ LinearMap.range β₀.mulVecLin) ≃ₗ[R₀] J₀)
      (eD : ((Fin 2 → R₀) ⧸ LinearMap.range α₀.mulVecLin) ≃ₗ[R₀]
        (J₀ →ₗ[R₀] R₀)),
      (∀ z : Fin 2 → R₀,
        (eJ (Submodule.Quotient.mk z) : R₀) =
          (u₀ - ι₀ s) * z 0 - (v₀ - ι₀ t) * z 1) ∧
      (∀ (z : Fin 2 → R₀) (j : J₀),
        (v₀ - ι₀ t) * (eD (Submodule.Quotient.mk z) j) =
          ((v₀ - ι₀ t) * z 0 - (u₀ + ι₀ s + ι₀ γ * ι₀ t) * z 1) *
            (j : R₀)) := by
  sorry

/-- A characteristic-two test on the quotient, not just on the polynomial products. -/
example (h2 : (2 : A) = 0) :
    let f : Polynomial (Polynomial A) :=
      Polynomial.X ^ 2 + Polynomial.C Polynomial.X * Polynomial.X
    let B := AdjoinRoot f
    let u : B := AdjoinRoot.root f
    let v : B := AdjoinRoot.of f Polynomial.X
    LinearMap.ker (left 1 0 u v 0 0).mulVecLin =
      LinearMap.range (right 1 0 u v 0 0).mulVecLin := by
  sorry

end PolynomialModel

/-- A non-example: unit discriminant and vanishing products in an arbitrary ring
are insufficient for exactness. All coordinates are specialized in Z, rather
than kept in the actual polynomial quotient. -/
example :
    NodeForm.Nondegenerate (1 : ℤ) 0 ∧
    left (1 : ℤ) 0 0 0 0 0 * right 1 0 0 0 0 0 = 0 ∧
    LinearMap.ker (left (1 : ℤ) 0 0 0 0 0).mulVecLin ≠
      LinearMap.range (right (1 : ℤ) 0 0 0 0 0).mulVecLin := by
  sorry

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
Suggested Lean type interfaces. The two local algebra entries now have candidates
above, but their final export/packet integration remains open. This ledger does
not count candidate signatures as completed exports.
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
API: NodeSectionFactorization.cokernels
  A native candidate is now in PolynomialModel.cokernels; reconcile the final export and packet ledger.
node: StableReductionPartII:MC.2/node-factorization-exact
  PolynomialModel.quotientExact supplies a candidate for the exactness clause; split/integrate the cokernel clause and proof-helper nodes.
node: StableReductionPartII:MC.2/dual-section-ideal
  Requires supplier types and the precise statement in the reader.
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
