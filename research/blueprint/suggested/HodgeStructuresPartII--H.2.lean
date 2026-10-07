/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HodgeStructuresPartII--H.2.md` is definitive.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. All proof bodies are placeholders, not implementations.

Scope: HodgeStructuresPartII:H.2. This is a fibre and rank-one prototype.
`ComplexPVHS` below is the full finite-dimensional complex object OVER A POINT,
not a weakened global variation. `MixedVariation` is an alias of the existing
rational fibre object, also over a point. Constant-family constructions are
explicitly labelled. No global variation theorem is asserted for these objects.

The native library lacks the supplier analytic/global carriers, real mixed
objects and algebraic monodromy groups listed in packet gaps G1–G18. Their
signatures are omitted, with each planned name and exact reason recorded at the
end. No unknown condition is represented by an opaque proposition or fake field.
-/
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.Geometry.Hodge.Polarization
import TauCeti.Geometry.Hodge.Mixed.Basic
import TauCeti.Geometry.Hodge.Mixed.Morphism
import TauCeti.Geometry.Hodge.Mixed.Strictness
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.Complex.FiniteDimensional
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log

open CategoryTheory
open scoped TensorProduct

noncomputable section
namespace TauCeti.Hodge.Variation

universe u v w

/-! Complex PVHS over a point. No real form or lattice is present. -/
section Complex
variable (V : Type u) [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]

structure ComplexPVHS (n : ℤ) where
  finiteRank : Module.Finite ℂ V
  piece : ℤ → Submodule ℂ V
  finitePieces : Set.Finite {p | piece p ≠ ⊥}
  decomposition : DirectSum.IsInternal piece
  hermitianForm : V →ₗ[ℂ] V →ₛₗ[starRingEnd ℂ] ℂ
  hermitian : ∀ x y, hermitianForm x y = star (hermitianForm y x)
  nondegenerate : ∀ x, (∀ y, hermitianForm x y = 0) → x = 0
  orthogonal : ∀ p q, p ≠ q → ∀ x ∈ piece p, ∀ y ∈ piece q,
    hermitianForm x y = 0
  positive : ∀ p, ∀ x ∈ piece p, x ≠ 0 →
    0 < ((p.negOnePow : ℂ) * hermitianForm x x).re

variable {V} {n : ℤ}

/-- Pointwise F, using the actual direct-sum grading. -/
def ComplexPVHS.hodgeFiltration (A : ComplexPVHS V n) (a : ℤ) : Submodule ℂ V :=
  ⨆ p, ⨆ (_ : a ≤ p), A.piece p

/-- Constant-family shadow of forgetting the variation. -/
def ComplexPVHS.localSystem (A : ComplexPVHS V n) (X : TopCat) :
    TauCeti.LocalCoefficientSystem ℂ X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor X).obj (ModuleCat.of ℂ V)

/-- Pullback of a point's Hodge data is unchanged. Global holomorphic pullback is G1. -/
def ComplexPVHS.pullback (A : ComplexPVHS V n) {X Y : TopCat} (_ : C(X, Y)) :
    ComplexPVHS V n := A

/-- Pointwise constructor from an ACTUAL native real-conjugation fibre and Hermitian data.
The missing global and real-bilinear polarization signatures are G1/G2. -/
def ComplexPVHS.ofReal [FiniteDimensional ℂ V] (ω : Conjugation V) (hs : HodgeStructureOn V ω n)
    (ψ : V →ₗ[ℂ] V →ₛₗ[starRingEnd ℂ] ℂ)
    (hherm : ∀ x y, ψ x y = star (ψ y x))
    (hnd : ∀ x, (∀ y, ψ x y = 0) → x = 0)
    (horth : ∀ p q, p ≠ q → ∀ x ∈ hs.piece p, ∀ y ∈ hs.piece q, ψ x y = 0)
    (hpos : ∀ p, ∀ x ∈ hs.piece p, x ≠ 0 →
      0 < ((p.negOnePow : ℂ) * ψ x x).re) : ComplexPVHS V n := by
  sorry

variable {V' : Type v} [AddCommGroup V'] [Module ℂ V'] [FiniteDimensional ℂ V']

def ComplexPVHS.hom (A : ComplexPVHS V n) (B : ComplexPVHS V' n) :=
  {f : V →ₗ[ℂ] V' // ∀ p, (A.piece p).map f ≤ B.piece p}

/-- The rank-one complex point object of type (p,n-p). -/
def complexLine (n p : ℤ) : ComplexPVHS ℂ n := by
  sorry

/-- ComplexPVHSTest.lineFiltration -/
example (n p a : ℤ) :
    (complexLine n p).hodgeFiltration a = if a ≤ p then ⊤ else ⊥ := by
  sorry

/-- ComplexPVHSTest.zeroRank -/
example (A : ComplexPVHS (Fin 0 → ℂ) n) (p : ℤ) : A.piece p = ⊥ := by
  sorry

/-- ComplexPVHSTest.noRealSymmetry: a real weight-zero one-dimensional fibre
cannot have only type (1,-1). The native opposedness supplies the obstruction. -/
example (ω : Conjugation ℂ) (hs : HodgeStructureOn ℂ ω 0)
    (hF : hs.F 1 = ⊤) : False := by
  sorry

/-- ComplexPVHSTest.nativeRealFiber: the constructor respects native F. -/
example (ω : Conjugation V) (hs : HodgeStructureOn V ω n)
    (ψ : V →ₗ[ℂ] V →ₛₗ[starRingEnd ℂ] ℂ)
    (hherm : ∀ x y, ψ x y = star (ψ y x))
    (hnd : ∀ x, (∀ y, ψ x y = 0) → x = 0)
    (horth : ∀ p q, p ≠ q → ∀ x ∈ hs.piece p, ∀ y ∈ hs.piece q, ψ x y = 0)
    (hpos : ∀ p, ∀ x ∈ hs.piece p, x ≠ 0 →
      0 < ((p.negOnePow : ℂ) * ψ x x).re) (a : ℤ) :
    (ComplexPVHS.ofReal ω hs ψ hherm hnd horth hpos).hodgeFiltration a = hs.F a := by
  sorry

/-! Realification uses native REAL complexification conjugation, not lattice conjugation. -/
variable [Module ℝ V] [IsScalarTower ℝ ℂ V]

def ComplexPVHS.realification (A : ComplexPVHS V n) :
    HodgeStructureOn (ℂ ⊗[ℝ] V) (complexificationConjugation V) n := by
  sorry

/-- Pointwise real-linear comparison; the second output has conjugate complex action.
Its complex-linear packaging awaits the coefficient interface in G2. -/
def ComplexPVHS.realificationComplexEquiv (A : ComplexPVHS V n) :
    (ℂ ⊗[ℝ] V) ≃ₗ[ℝ] (V × V) := by
  sorry

def ComplexPVHS.realificationInclusion (A : ComplexPVHS V n) :
    V →ₗ[ℂ] (ℂ ⊗[ℝ] V) := by
  sorry

variable [Module ℝ V'] [IsScalarTower ℝ ℂ V']

def ComplexPVHS.realificationMap {A : ComplexPVHS V n} {B : ComplexPVHS V' n}
    (f : A.hom B) :
    {g : (ℂ ⊗[ℝ] V) →ₗ[ℂ] (ℂ ⊗[ℝ] V') //
      ∀ p, ((A.realification).F p).map g ≤ (B.realification).F p} := by
  sorry

/-- RealificationTest.rankOne -/
example : Module.finrank ℝ ℂ = 2 := by
  sorry

/-- RealificationTest.typeSwap -/
example : ((complexLine 0 1).realification).piece 1 ≠ ⊥ ∧
    ((complexLine 0 1).realification).piece (-1) ≠ ⊥ := by
  sorry

/-- RealificationTest.alreadyReal: realifying C = R tensor C doubles its real model. -/
example : Module.finrank ℂ (ℂ ⊗[ℝ] ℂ) = 2 := by
  sorry
end Complex

/-! Rational mixed variation over a point: reuse the existing carrier and maps. -/
section Mixed
variable {VZ : Type u} {VQ : Type v} {VC : Type w}
variable [AddCommGroup VZ] [AddCommGroup VQ] [Module ℚ VQ]
variable [AddCommGroup VC] [Module ℂ VC]
variable [FiniteDimensional ℚ VQ]
variable {iQ : VZ →ₗ[ℤ] VQ} {iC : VZ →ₗ[ℤ] VC}
variable (hQ : IsBaseChange ℚ iQ) (hC : IsBaseChange ℂ iC)

abbrev MixedVariation [FiniteDimensional ℚ VQ] := MixedHodgeStructure hQ hC

variable {hQ hC}

def MixedVariation.localSystem (A : MixedVariation hQ hC) (X : TopCat) :
    TauCeti.LocalCoefficientSystem ℚ X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor X).obj (ModuleCat.of ℚ VQ)

def MixedVariation.fiber (A : MixedVariation hQ hC) : MixedHodgeStructure hQ hC := A

abbrev MixedVariation.hom (A B : MixedVariation hQ hC) := MixedHodgeStructure.Hom A B

def MixedVariation.pullback (A : MixedVariation hQ hC) {X Y : TopCat} (_ : C(X,Y)) :
    MixedVariation hQ hC := A

def MixedVariation.ofPure {n : ℤ} (A : HodgeStructure hC n) : MixedVariation hQ hC :=
  MixedHodgeStructure.ofPure (hℚ := hQ) A

/-- MixedVariationTest.pureWeight: the actual native concentrated W. -/
example {n k : ℤ} (A : HodgeStructure hC n) :
    (MixedVariation.ofPure (hQ := hQ) A).WQ k = if n ≤ k then ⊤ else ⊥ := by
  sorry

/-- MixedVariationTest.zero -/
example [Subsingleton VQ] (A : MixedVariation hQ hC) (k : ℤ) : A.WQ k = ⊥ := by
  sorry

/-- MixedVariationTest.nativeFiber: point morphisms are the SAME native Hom type. -/
example (A B : MixedVariation hQ hC) :
    MixedVariation.hom A B = MixedHodgeStructure.Hom A B := by
  sorry

def MixedVariation.graded (A : MixedVariation hQ hC) (k : ℤ) :
    HodgeStructure (TauCeti.isBaseChange_ratTensorMap ℂ (weightGradedRat A.WQ k)) k :=
  A.gradedHodgeStructure k

theorem MixedVariation.gradedFiber (A : MixedVariation hQ hC) (k : ℤ) :
    (A.graded k).F = gradedF hQ hC A.WQ A.WQ_monotone A.F k := by
  sorry

def MixedVariation.gradedMap {A B : MixedVariation hQ hC} (f : A.hom B) (k : ℤ) :
    HodgeStructure.Hom (A.graded k) (B.graded k) := by
  sorry

/-- GradedVariationTest.pure -/
example {n : ℤ} (A : HodgeStructure hC n) :
    (MixedVariation.ofPure (hQ := hQ) A).WQ n = ⊤ ∧
    (MixedVariation.ofPure (hQ := hQ) A).WQ (n-1) = ⊥ := by
  sorry

/-- GradedVariationTest.otherWeight -/
example {n k : ℤ} (A : HodgeStructure hC n) (hk : k ≠ n) :
    Subsingleton (weightGradedRat (MixedVariation.ofPure (hQ := hQ) A).WQ k) := by
  sorry

/-- GradedVariationTest.native -/
example (A : MixedVariation hQ hC) (k : ℤ) : A.graded k = A.gradedHodgeStructure k := by
  sorry

/-- Rational graded polarization over a point. Actual rational forms and complex
base change are data; the fibre positivity condition is not an opaque predicate. -/
structure GradedPolarization (A : MixedVariation hQ hC) where
  rationalForm : ∀ k, LinearMap.BilinForm ℚ (weightGradedRat A.WQ k)
  complexForm : ∀ k, LinearMap.BilinForm ℂ (ℂ ⊗[ℚ] weightGradedRat A.WQ k)
  baseChange : ∀ k x y, complexForm k (1 ⊗ₜ[ℚ] x) (1 ⊗ₜ[ℚ] y) =
    (rationalForm k x y : ℂ)
  parity : ∀ k x y, rationalForm k y x = (k.negOnePow : ℚ) * rationalForm k x y
  nondegenerate : ∀ k, (rationalForm k).Nondegenerate
  orthogonal : ∀ k p, ∀ x ∈ (A.graded k).F p,
    ∀ y ∈ (A.graded k).F (k+1-p), complexForm k x y = 0
  positive : ∀ k p, ∀ x ∈ (A.graded k).piece p, x ≠ 0 →
    0 < (Complex.I ^ (2*p-k) * complexForm k x
      (latticeConj (TauCeti.isBaseChange_ratTensorMap ℂ (weightGradedRat A.WQ k)) x)).re

/-- Projection at a point; flatness of the family form is omitted (G1). -/
def GradedPolarization.gradedForm {A : MixedVariation hQ hC} (Q : GradedPolarization A)
    (k : ℤ) : LinearMap.BilinForm ℚ (weightGradedRat A.WQ k) := Q.rationalForm k

def GradedPolarization.pullback {A : MixedVariation hQ hC} (Q : GradedPolarization A)
    {X Y : TopCat} (_ : C(X,Y)) : GradedPolarization A := Q

/-- GradedPolarizationTest.tate: positivity on the actual (-1,-1) grade. -/
example {A : MixedVariation hQ hC} (Q : GradedPolarization A)
    (x : ℂ ⊗[ℚ] weightGradedRat A.WQ (-2))
    (hx : x ∈ (A.graded (-2)).piece (-1)) (hne : x ≠ 0) :
    0 < (Q.complexForm (-2) x
      (latticeConj (TauCeti.isBaseChange_ratTensorMap ℂ (weightGradedRat A.WQ (-2))) x)).re := by
  sorry

/-- GradedPolarizationTest.noWholeForm: two mixed weights cannot be a single
concentrated pure weight. This is the pointwise weight obstruction. -/
example {A : MixedVariation hQ hC} (_Q : GradedPolarization A)
    (hb : A.WQ (-2) ≠ ⊥) (ht : A.WQ (-2) ≠ ⊤) :
    ¬ ∃ n : ℤ, ∀ k, A.WQ k = if n ≤ k then ⊤ else ⊥ := by
  sorry

/-- GradedPolarizationTest.zeroGrade -/
example {A : MixedVariation hQ hC} (Q : GradedPolarization A) (k : ℤ)
    [Subsingleton (weightGradedRat A.WQ k)] : Q.gradedForm k = 0 := by
  sorry

/-- Native strictness regression: the fixed-part inclusion, when supplied as an
ACTUAL MHS morphism, is automatically strict. No existence theorem is faked. -/
example {A B : MixedVariation hQ hC} (f : A.hom B) (p : ℤ) :
    LinearMap.range f.toLinearMap ⊓ B.F p = (A.F p).map f.toLinearMap := by
  sorry
end Mixed

/-! Necessary algebraic residue/weight data; this is NOT the admissibility predicate.
The graded-centred quotient isomorphisms and holomorphic limiting flag are omitted
(G3–G5). A value of this structure therefore never licenses a global theorem. -/
section Disc
variable (V : Type u) [AddCommGroup V] [Module ℝ V]

structure AdmissibleDisc where
  N : Module.End ℝ V
  nilpotent : ∃ m : ℕ, N ^ m = 0
  W : ℤ → Submodule ℝ V
  W_monotone : Monotone W
  W_top : ∃ k, W k = ⊤
  W_bot : ∃ k, W k = ⊥
  M : ℤ → Submodule ℝ V
  M_monotone : Monotone M
  M_top : ∃ k, M k = ⊤
  M_bot : ∃ k, M k = ⊥
  preservesWeight : ∀ k, (W k).map N ≤ W k
  lowersRelative : ∀ k, (M k).map N ≤ M (k-2)
  F : ℤ → Submodule ℂ (ℂ ⊗[ℝ] V)
  F_antitone : Antitone F
  F_top : ∃ p, F p = ⊤
  F_bot : ∃ p, F p = ⊥

variable {V}

def AdmissibleDisc.limitFiltration (A : AdmissibleDisc V) := A.F

def AdmissibleDisc.relativeWeight (A : AdmissibleDisc V) := A.M

/-- Only the necessary algebraic data are ramified here. The admissibility
invariance theorem is omitted (G5), and not asserted for this partial carrier. -/
def AdmissibleDisc.finiteCover (A : AdmissibleDisc V) (e : ℕ) : AdmissibleDisc V := by
  sorry

/-- Necessary boundary data for the constant real weight-zero line. -/
def constantDiscLine : AdmissibleDisc ℝ := by
  sorry

/-- AdmissibleDiscTest.constant: explicit weight-zero boundary values. -/
example : constantDiscLine.N = 0 ∧ constantDiscLine.M 0 = ⊤ ∧
    constantDiscLine.M (-1) = ⊥ ∧ constantDiscLine.F 0 = ⊤ ∧
    constantDiscLine.F 1 = ⊥ := by
  sorry

/-- AdmissibleDiscTest.ramification: the explicitly retained algebraic part. -/
example (A : AdmissibleDisc V) (e : ℕ) : (A.finiteCover e).N = e • A.N := by
  sorry

/-- AdmissibleDiscTest.noRelative: exact linear obstruction, no variation assumed. -/
example (a e : V) (W M : ℤ → Submodule ℝ V) (N : Module.End ℝ V)
    (hM : M = W) (h0 : e ∈ W 0) (hbottom : W (-2) = ⊥)
    (hN : N e = a) (ha : a ≠ 0)
    (hlower : ∀ k, (M k).map N ≤ M (k-2)) : False := by
  sorry
end Disc

/-! Canonical extension rank-one local NORMAL-FORM data. Analytic O-bundles,
restriction and gluing are omitted (G1/G7), not asserted from a residue alone. -/
structure CanonicalExtension where
  residueValue : ℂ
  lower : 0 ≤ residueValue.re
  upper : residueValue.re < 1

def CanonicalExtension.residue (A : CanonicalExtension) : ℂ := A.residueValue

def lineMonodromy (a : ℂ) : ℂ := Complex.exp (-2 * Real.pi * Complex.I * a)

def CanonicalExtension.map (A B : CanonicalExtension) (c : ℂ)
    (_ : A.residue * c = c * B.residue) : ℂ →ₗ[ℂ] ℂ := by
  sorry

theorem CanonicalExtension.unique (A B : CanonicalExtension)
    (h : lineMonodromy A.residue = lineMonodromy B.residue) : A = B := by
  sorry

theorem CanonicalExtension.unipotentResidue (A : CanonicalExtension) :
    lineMonodromy A.residue = 1 ↔ A.residue = 0 := by
  sorry

/-- CanonicalExtensionTest.trivial -/
example : lineMonodromy 0 = 1 := by
  sorry

/-- CanonicalExtensionTest.minusOne -/
example : lineMonodromy (1/2) = -1 := by
  sorry

/-- CanonicalExtensionTest.integerShift -/
example : ¬ (0 ≤ (3/2 : ℂ).re ∧ (3/2 : ℂ).re < 1) := by
  sorry

/-- CanonicalExtensionTest.tensorCorrection -/
example : (3/4 : ℂ) + 3/4 - 1 = 1/2 ∧
    lineMonodromy ((3/4 : ℂ) + 3/4) = lineMonodromy (1/2) := by
  sorry

/-- Residue normalization on a ramified rank-one logarithmic chart. -/
theorem residue_monodromy_rankOne (a : ℂ) (e : ℕ) :
    lineMonodromy (e * a) = lineMonodromy a ^ e := by
  sorry

/-! Constant/product-family Gauss–Manin shadow. M is the supplied cohomology
module; this does not construct R^q f_* or pretend to prove de Rham comparison. -/
def GaussManin (R : Type u) [Ring R] (X : TopCat) (M : ModuleCat R) :
    TauCeti.LocalCoefficientSystem R X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor X).obj M

namespace GaussManin
variable {R : Type u} [Ring R] {X Y : TopCat} (M : ModuleCat R)

/-- GaussManin.localSystem: constant-family specialization. -/
def localSystem (X : TopCat) : TauCeti.LocalCoefficientSystem R X := GaussManin R X M

/-- GaussManin.baseChange: native constant pullback comparison. -/
def baseChange (f : C(X,Y)) :
    (TauCeti.LocalCoefficientSystem.pullback f).obj (GaussManin R Y M) ≅
    GaussManin R X M := by
  sorry

/-- GaussManin.fiber: the supplied product-family cohomology fibre. -/
def fiber (x : X) : ((GaussManin R X M).obj (FundamentalGroupoid.mk x)) ≃ₗ[R] M := by
  sorry
end GaussManin

/-- GaussManinTest.product: constant cohomology data of a product family. -/
example {R : Type u} [Ring R] (X : TopCat) (M : ModuleCat R)
    (x : FundamentalGroupoid X) : (GaussManin R X M).obj x = M := by
  sorry

/-- GaussManinTest.degreeZero: the connected proper fibre's supplied H^0 is Q. -/
example (X : TopCat) (x : FundamentalGroupoid X) :
    (GaussManin ℚ X (ModuleCat.of ℚ ℚ)).obj x = ModuleCat.of ℚ ℚ := by
  sorry

/-- GaussManinTest.nativeTransport: native path transport is identity on the
constant family, not a second independently supplied transport action. -/
example {R : Type u} [Ring R] (X : TopCat) (M : ModuleCat R) (x : X)
    (γ : Path.Homotopic.Quotient x x) (v : M) :
    TauCeti.LocalCoefficientSystem.transport (GaussManin R X M) γ v = v := by
  sorry

/-! Fixed-part linear tests use native invariants. The full mixed-Hodge construction
and all of its signatures are omitted until global variation carriers exist. -/
section Invariants
variable {K G V : Type*} [Field K] [Group G] [AddCommGroup V] [Module K V]

/-- MixedFixedPartTest.constant: underlying linear assertion. -/
example : (Representation.trivial K G V).invariants = ⊤ := by
  sorry

/-- MixedFixedPartTest.nontrivialLine: no spurious fixed vector of a nontrivial character. -/
example (ρ : Representation K G K) (g : G) (h : ρ g 1 ≠ 1) : ρ.invariants = ⊥ := by
  sorry

/-- MixedFixedPartTest.nativeInvariant: exact native membership criterion. -/
example (ρ : Representation K G V) (v : V) :
    v ∈ ρ.invariants ↔ ∀ g, ρ g v = v := by
  sorry
end Invariants

end TauCeti.Hodge.Variation

/-! Planned signatures omitted until the indicated supplier/gap is supplied.
Each name appears here for review; these are mathematical specifications, NOT
opaque Lean declarations or predicates. The pointwise signatures above do not
assert the full global statements below.

MixedVariationTest.nonflatWeight (test; G1/G2)
On a disc the moving line span((1,z)) in the trivial rank-two flat bundle cannot serve as W_0, although it is a holomorphic line subbundle.

GradedPolarization.ofPure (api; G1/G2; L1/L2 requests)
On ofPure(V,n), a graded polarization is the pure polarization on V; zero other grades.

GradedPolarization.dual (api; G1/G2; L1/L2 requests)
The dual variation has weights −k, with the corresponding dual pure forms.

AdmissibleDisc.reparametrize (api; G1/G3/G4/G5)
Changing s by a holomorphic coordinate with nonzero derivative conjugates F_∞ by exp(cN) and leaves M unchanged.

AdmissibleDiscTest.essentialSingularity (test; G1/G3/G4/G5)
The Hodge–Tate extension with weights zero and two and period coordinate exp(1/s), T=1, has relative M=W but no limiting flag, hence is not admissible.

AdmissibleVariation (declaration; G1/G5/G6)
For a graded-polarizable real/rational VMHS on a smooth quasiprojective S with quasi-unipotent boundary monodromy, admissibility means that for every holomorphic disc map f:Δ→Sbar into a smooth SNC compactification with f(Δ*)⊂S, f*V satisfies the punctured-disc finite-cover criterion. Maps tangent to or meeting several boundary components are included. Kashiwara’s theorem makes this independent of the SNC compactification and stable under holomorphic pullback. This packet specifies the quasi-unipotent convention; its identification with the more general real mixed-Hodge-module convention used in LL24 for arbitrary unitary coefficients remains an explicit gap.

AdmissibleVariation.curveTest (api; G1/G5/G6)
Every permitted disc pullback is admissible.

AdmissibleVariation.pullback (api; G1/G5/G6)
Holomorphic pullback between smooth algebraic bases preserves admissibility, with all boundary arcs tested.

AdmissibleVariation.compactificationIndependent (api; G1/G5/G6)
The predicate is the same for any smooth SNC compactification.

AdmissibleVariation.constant (api; G1/G5/G6)
A constant graded-polarizable MHS gives an admissible variation.

AdmissibleVariationTest.point (test; G1/G5/G6)
Over a point a graded-polarizable MHS is admissible.

AdmissibleVariationTest.curve (test; G1/G5/G6)
On a smooth curve the definition is exactly admissibility at every puncture of its smooth completion.

AdmissibleVariationTest.productArc (test; G1/G5/G6)
For commuting unipotent boundary T_1,T_2, the arc (s^a,s^b) has N=aN_1+bN_2 and requires M(N,W), including a,b>0.

AdmissibleDisc.limitMixedHodgeStructure (declaration; G2/G3/G4)
For an admissible unipotent punctured-disc mixed variation, (V_R,M(N,W),F_∞) is a real MHS, N is a morphism to its Tate twist by −1 (equivalently type (−1,−1)), and the induced pure-graded limits agree with the imported monodromy filtrations centred at their original weights. This is a consequence of the two admissibility conditions, not a third independent axiom.

AdmissibleVariation.tensorHom (declaration; G1/G2/G5)
Admissible graded-polarizable real/rational variations are closed under tensor product, dual and internal Hom. Tensor W and F are convolution filtrations, N=N_V⊗1+1⊗N_U and relative M is the convolution of the relative filtrations; dual/Hom use the corresponding dual weight shifts and commutator N. The flat evaluation Hom(V,U)⊗V→U is a mixed-variation morphism. All statements are in the quasi-unipotent convention of this packet.

CanonicalExtension.restrict (api; G1/G7)
Restriction of (Ebar,∇bar) to U is the supplied flat bundle.

CanonicalExtension.exact (declaration; G1/G7)
For a fixed logarithm branch represented by 0≤Re(α)<1, canonical extension is exact on finite-rank complex local systems on a fixed SNC complement: a short exact sequence gives a short exact sequence of locally free logarithmic bundles with connection. The restriction identifications commute with all maps. Exactness does not imply compatibility with tensor products or ordinary dual bundles.

CanonicalExtension.residueMonodromy (declaration; G1/G7; rank-one scalar adapter is present)
In the commuting logarithmic frame ∇=d+Σ A_i dz_i/z_i of the canonical extension, positive local loops have T_i=exp(−2πi A_i). On a unipotent block N_i=log T_i=−2πi A_i. Under s=t^e, the pulled-back residue is eA; if its eigenvalues leave the strip, recanonicalization shifts them by integers. In the unipotent case no shift occurs and N becomes eN.

CanonicalExtension.unipotentTensor (declaration; G1; H.0 global tensor/dual suppliers)
For local systems with unipotent local monodromy on the same SNC complement, canonical extension commutes with tensor products, duals and internal Hom. Residues on the tensor are A⊗1+1⊗B, on the dual −A transpose, and on Hom B∘f−f∘A. They are nilpotent, so remain in the strip. These comparisons are coherent and restrict to the ordinary flat tensor/dual/Hom comparisons.

FilteredExtension (declaration; G1/G5/G8)
For an admissible unipotent mixed variation on Δ*, extend F by its untwisted limiting flag inside the canonical extension. The resulting Fbar^p are holomorphic subbundles, restrict to F^p, have locally free Gr^W Gr_F, and satisfy logarithmic transversality ∇bar Fbar^p⊂Fbar^(p−1)⊗Ω¹(log{0}). For quasi-unipotent monodromy use a finite cover and the corresponding canonical-eigenvalue normalization; the descended filtration is the intersection/saturated extension determined by the original F and Ebar, not an arbitrarily chosen limit flag. Global SNC gluing requires the multi-variable admissibility extension theorem, recorded separately as a gap.

FilteredExtension.restrict (api; G1/G5/G8)
Fbar^p restricts to F^p under the canonical extension identification.

FilteredExtension.limit (api; G1/G5/G8)
The fibre of Fbar at zero is the untwisted F_∞ in the unipotent frame.

FilteredExtension.graded (api; G1/G5/G8)
Weight-graded Fbar is the extended pure-graded filtration; intersections/quotients are locally free.

FilteredExtension.map (api; G1/G5/G8)
A mixed-variation map extends and preserves Fbar; identities/composites agree.

FilteredExtension.exact (api; G1/G5/G8)
Every Fbar^p sequence attached to a short exact sequence of admissible variations is exact.

FilteredExtensionTest.constant (test; G1/G5/G8)
For a constant type-(0,0) line, Fbar^0=O_Δ and Fbar^1=0.

FilteredExtensionTest.limit (test; G1/G5/G8)
For a unipotent nilpotent-orbit model F(z)=exp(zN)F_∞ satisfying admissibility, the untwisted Fbar is constant with fibre F_∞.

FilteredExtensionTest.noEssential (test; G1/G5/G8)
The period coordinate exp(1/s) Hodge–Tate example cannot be supplied as an admissible input.

canonicalLogComparison (declaration; G7; C5/E1 suppliers)
For U=X\D as above and its canonical extension, the analytic logarithmic complex DR_log(Ebar)=[Ebar→Ebar⊗Ω¹_X(log D)→…] is quasi-isomorphic to Rj_*L. Thus H^q(X,DR_log(Ebar))≅H^q(U,L). The strip excludes positive integer residue eigenvalues, as required by Del70 II.6.10. The coefficient/log comparison engine belongs to ComplexComparisonPartII:C5; this node is its canonical-strip adapter, not a new generic de Rham comparison theory.

GaussManin.deRhamEquiv (api; G1/G7; C5 relative-cohomology supplier)
Its associated holomorphic bundle is the relative (logarithmic) de Rham hypercohomology bundle, carrying the compared connection.

geometricPureVariation (declaration; G1/G9)
If f:X→S is smooth projective of relative dimension d over a smooth complex algebraic base with a relative ample class, the torsion-free degree-q integral cohomology local system with Hodge filtration induced from relative de Rham cohomology is a polarized integral VHS of weight q. Use the primitive Lefschetz decomposition and its signed cup-product forms to polarize the full cohomology. The fibre is the imported cohomological pure Hodge structure, the connection is Gauss–Manin, and Griffiths transversality holds. Projectivity/relative polarization is explicit; smooth proper complex fibres are not automatically treated as projective polarized ones.

unitaryCurveFiber (declaration; G2/G10/G11)
For a smooth projective complex curve C, reduced D, U=C\D, and finite-rank orthogonal real local system V_R with complexification V, H¹(U,V_R) has a functorial graded-polarizable real MHS with only weights 1 and 2. W_1 is the image of H¹(C,j_*V_R), W_2=H¹(U,V_R), and F¹ is the image of H⁰(C,Ebar⊗Ω¹_C(log D)) in logarithmic hypercohomology; F⁰=H_C, F²=0. Canonical extension uses [0,1). For arbitrary unitary complex V, apply realification V⊕V dual and project to V to obtain weight/Hodge/conjugate-Hodge filtrations, without asserting a real structure on H¹(U,V) itself.

unitaryCurveFamily (declaration; G1/G6/G15)
Let π:C→M be a smooth proper family of curves over a smooth quasiprojective base with disjoint sections D and U=C\D, and let V_R be a finite-rank orthogonal real local system on U. R¹π°_*V_R, its Gauss–Manin bundle and the fibrewise filtrations of the preceding node form a graded-polarizable real VMHS: W_1=R¹π_*j_*V_R included into R¹π°_*V_R, W_2 is the whole system, and F¹=im π_*(Ebar⊗Ω¹_(C/M)(log D)). Under quasi-unipotent boundary monodromy on M this is admissible in this packet’s finite-cover convention. LL24 asserts admissibility for arbitrary unitary real coefficients using real mixed Hodge modules; retaining that broader claim requires the recorded real-exponent convention gap and mixed-Hodge-module direct-image engine.

unitaryBigrading (declaration; G1/G2)
For the complex unitary curve cohomology system H_V of the preceding family, let conjugate F be induced using V dual ≅conjugate V. Define H^(1,0)=F¹∩W_1, H^(0,1)=conjugate F¹∩W_1 and H^(1,1)=F¹∩conjugate F¹. Then H_V is the direct sum of these three smooth subbundles; conjugation exchanges H_V^(p,q) with H_(V dual)^(q,p). In general these summands are not flat local subsystems.

curveCohomologyMHS (declaration; G1/G11)
For a smooth algebraic curve S with smooth projective completion Sbar and finite boundary, and an admissible graded-polarizable real/rational VMHS V, H^i(S,V) carries a natural functorial mixed Hodge structure. The evaluation H⁰(S,V)→V_s is a mixed Hodge morphism and its image is a mixed Hodge substructure independent of s under parallel transport. The comparison uses the logarithmic two-term complex of the canonical extension, with its Hodge filtration and the corrected boundary weight filtration; W is not simply the original coefficient W with no cohomological shift.

MixedFixedPart (declaration; G1/G2/G12)
For an admissible graded-polarizable real/rational VMHS V on a connected smooth quasiprojective S, the native monodromy invariant subspace I_s=(ρ_s).invariants≅H⁰(S,V) has the induced mixed Hodge structure W_k I=I∩W_k V_s, F^p I_C=I_C∩F^p V_s. These filtrations are independent of s under native path transport. The evaluation of the constant system I into V is a mixed-variation morphism; it identifies I with the largest constant sub-local system. Constancy of the underlying system alone does not supply the assertion without admissibility.

MixedFixedPart.structure (api; G1/G2/G12)
MHS on the native invariant module with induced W and F.

MixedFixedPart.evaluation (api; G1/G2/G12)
Strict injection of the constant invariant MHS system into V.

MixedFixedPart.transport (api; G1/G2/G12)
Native path transport identifies the MHS on I_s and I_t, independently of path on invariants.

MixedFixedPart.map (api; G1/G2/G12)
A mixed-variation morphism restricts to a mixed Hodge map of invariants; identity/composition laws.

MixedFixedPart.constantUniversal (api; G1/G2/G12)
Any mixed-variation map from a constant MHS factors uniquely through the evaluation map.

MixedFixedPartTest.twoWeights (test; G1/G2/G12)
For constant Q(0)⊕Q(1), the fixed MHS has weights zero and minus two; it is not a pure weight-zero Hodge structure.

complexFixedPart (declaration; G1/G13)
For a complex PVHS L on a connected smooth quasiprojective S, its invariant space H⁰(S,L) decomposes into constant Hodge types, and the flat inclusion of this constant complex polarized Hodge structure into L preserves the smooth decomposition. The induced Hermitian form is nondegenerate with the required type signs. This theorem does not assume a lattice or quasi-unipotent boundary monodromy.

complexSemisimple (declaration; G1/G14; RG1/RG6)
The underlying finite-rank complex local system of a complex PVHS on a smooth connected quasiprojective complex variety is semisimple. Consequently it is a finite direct sum of irreducible complex local systems, and its algebraic monodromy group is reductive. This is different from semisimplicity of the category of Hodge subobjects, and different from semisimplicity of the connected algebraic monodromy group.

isotypicHodge (declaration; G1/G14; RG1/RG4)
For a complex PVHS L on smooth connected quasiprojective S, write its semisimple local system as ⊕_i S_i⊗M_i with pairwise nonisomorphic irreducible S_i and M_i=Hom_loc(S_i,L). Each S_i supports a complex PVHS unique up to integral renumbering of the single Hodge index; choose its weight consistently with this renumbering. Each M_i then has a constant complex polarized Hodge structure and evaluation ⊕S_i⊗M_i→L is a Hodge isomorphism. For fixed total weight, shifts on S_i and M_i are opposite; a shift need not be an integral real Tate twist. The statement concerns complex type grading, without adding a real or integral structure.

IrreducibleRealForm (declaration; G1/G2; real-form/descent carrier)
Given an irreducible complex local system L occurring in the complexification of a graded-polarizable real VMHS, choose a pure weight-graded quotient in which L occurs and its complex PVHS from isotypic decomposition. If L admits an actual real form, choose that form and the compatible real Hodge grading (weight may be renumbered). Otherwise use the canonical real form of L⊕conjugate(L). Call the resulting real PVHS tilde L. A self-conjugate irreducible representation can be quaternionic; an isomorphism L≅conjugate L alone is not enough to choose the first branch. Choices are recorded and unique only up to the appropriate isomorphism/renumbering.

IrreducibleRealForm.variation (api; G1/G2; real-form/descent carrier)
Chosen real PVHS tilde L with the displayed branch.

IrreducibleRealForm.complexification (api; G1/G2; real-form/descent carrier)
Compare with L or L⊕conjugate L, respecting flat maps and Hodge type.

IrreducibleRealForm.choiceInvariant (api; G1/G2; real-form/descent carrier)
Changing real form or Hodge shift yields the corresponding isomorphism and compensating multiplicity Hodge shift, rather than literal equality.

IrreducibleRealFormTest.realLine (test; G1/G2; real-form/descent carrier)
A trivial complex line with chosen ordinary real form has real rank one in the first branch.

IrreducibleRealFormTest.nonrealCharacter (test; G1/G2; real-form/descent carrier)
A line character whose image is not contained in R* has no real form and yields a real rank-two doubled variation.

IrreducibleRealFormTest.quaternionic (test; G1/G2; real-form/descent carrier)
For an irreducible L with a conjugate-linear intertwiner J satisfying J²=−1 and no involutive one, self-conjugacy does not permit the real-form branch.

irreducibleEvaluation (declaration; G1/G2/G6)
Let V be an admissible graded-polarizable real VMHS on smooth connected quasiprojective S, and let irreducible complex L have Hom_loc(L,V_C)≠0. For the chosen tilde L, assuming its pure variation is admissible in the same convention, Q=H⁰(S,Hom(tilde L,V)) is a nonzero constant real MHS and the flat evaluation Q⊗tilde L→V is a nonzero mixed-variation morphism. Q is allowed to be mixed and the map is not asserted surjective. LL24 asserts the same conclusion in its general real-admissibility convention without the extra finite-cover hypothesis; matching those conventions is recorded as a gap.

AlgebraicMonodromy (declaration; G18; RG0/RG3)
For a finite-rank K-local system L, K=Q,R,C, on connected S with base point s, define G_mon(L,s) as the Zariski closure over K of the native representation π₁(S,s)→GL(L_s). Its geometric identity component G_mon° is used for connected-monodromy statements. The coefficient field, base point and fibre identification are retained; path transport identifies groups by conjugation. Passing to a finite connected topological cover replaces the image by a finite-index subgroup and leaves G_mon° unchanged. Generic closed subgroup schemes, geometric components and representation theory belong to ReductiveGroups.

AlgebraicMonodromy.group (api; G18; RG0/RG3)
The K-Zariski closure of native monodromy inside GL(L_s).

AlgebraicMonodromy.identityComponent (api; G18; RG0/RG3)
The geometric identity component with its K-form in characteristic zero.

AlgebraicMonodromy.transport (api; G18; RG0/RG3)
Path transport conjugates closures; composites give coherent conjugacies.

AlgebraicMonodromy.finiteCover (api; G18; RG0/RG3)
Finite connected covers leave the identity component unchanged.

AlgebraicMonodromy.invariants (api; G18; RG0/RG3)
A vector/tensor is fixed by the closure iff fixed by every native monodromy element.

AlgebraicMonodromyTest.trivial (test; G18; RG0/RG3)
A constant system has the trivial algebraic group.

AlgebraicMonodromyTest.finite (test; G18; RG0/RG3)
A line with image {1,−1} has finite closure μ₂ and trivial identity component.

AlgebraicMonodromyTest.unipotent (test; G18; RG0/RG3)
The Z representation m↦[[1,m],[0,1]] over Q has closure G_a, which is connected and unipotent.

AlgebraicMonodromyTest.unitaryInfinite (test; G18; RG0/RG3)
For the complex rank-one Z character m↦exp(2πiθm), θ irrational, the closure is G_m; unitarity does not force finite image or a semisimple connected algebraic group.

finiteDeterminant (declaration; G1/G16)
For a polarizable integral VHS on a smooth connected quasiprojective complex variety, every irreducible complex constituent of its underlying local system has finite-order determinant character. A merely complex or rational polarized variation without a preserved lattice does not satisfy this conclusion in general.

connectedMonodromySemisimple (declaration; G1/G14/G16/G18)
For a polarizable integral VHS on a connected smooth quasiprojective complex variety, the geometric connected algebraic monodromy group G_mon° is semisimple. In particular this holds for the torsion-free cohomology local systems of smooth projective polarized families. Without a preserved lattice only reductivity follows from complex PVHS semisimplicity; an irrational unitary line has G_mon°=G_m.

mixedMonodromyRadical (declaration; G1/G17/G18)
For an admissible graded-polarizable integral VMHS on a connected smooth quasiprojective base, G_mon° has semisimple graded quotient and unipotent radical equal to the kernel of its action on ⊕_k Gr^W_k V. In particular its connected solvable radical is unipotent; the whole connected group need not be semisimple. Integral means a finite free Z-local system whose rational variation and W are as above; no integral splitting of W is assumed.
-/
