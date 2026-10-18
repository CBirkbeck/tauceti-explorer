import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.DualNumber

/-!
This file is not the roadmap and is not exhaustive. The companion README is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures; they claim no implementation.

The native fibre data below use actual invertible sheaves and module pullback
at the atlas pins. There is no assertion that pullback preserves rank one
hidden in an arbitrary carrier. Both lines are already native rank-one objects;
their comparison is an isomorphism of their underlying native modules.

WORKERS.md's fixed shape permits light real-bodied definitions, end statements
statable at the pins, and a few examples. The README specifies the stack,
coherence, degree, quotient and gerbe targets and their full API and tests.
The geometric omission ledger at the end identifies every omitted family.
-/

noncomputable section

open CategoryTheory AlgebraicGeometry

namespace TauCeti.RamifiedClassField.GC0

universe u

variable {Y Z : Scheme.{u}} (i : Z ⟶ Y)

/-- Native data over a scheme arrow; use `R × S ⟶ X × S` in the roadmap. -/
structure RootPicardData where
  line : TauCeti.AlgebraicGeometry.InvertibleSheaf Y
  rootLine : TauCeti.AlgebraicGeometry.InvertibleSheaf Z
  squareIso :
    (TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct rootLine rootLine).obj ≅
      (Scheme.Modules.pullback i).obj line.obj

namespace RootPicardData

variable {i}

/-- Isomorphisms preserve the square identification; arbitrary module maps are excluded. -/
structure Iso (a b : RootPicardData i) where
  lineIso : a.line ≅ b.line
  rootIso : a.rootLine ≅ b.rootLine
  compatibility :
    ((TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft
        (K := a.rootLine) rootIso).hom.hom ≫
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrRight
        (L := b.rootLine) rootIso).hom.hom) ≫ b.squareIso.hom =
    a.squareIso.hom ≫ (Scheme.Modules.pullback i).map lineIso.hom.hom

end RootPicardData

/-- A section along the root locus, with no global section on `Y`. -/
structure RootPicardSectionData where
  root : RootPicardData i
  sectionOnRoot : Γ(root.rootLine.obj, (⊤ : Z.Opens))

namespace RootPicardSectionData

variable {i}

/-- In addition to the square, an arrow preserves the root section. -/
structure Iso (a b : RootPicardSectionData i) where
  rootIso : RootPicardData.Iso a.root b.root
  section_eq :
    rootIso.rootIso.hom.hom.app (⊤ : Z.Opens) a.sectionOnRoot = b.sectionOnRoot

def zero (a : RootPicardData i) : RootPicardSectionData i := ⟨a, 0⟩

theorem zero_forget (a : RootPicardData i) : (zero a).root = a := by
  sorry

theorem zero_section (a : RootPicardData i) : (zero a).sectionOnRoot = 0 := by
  sorry

end RootPicardSectionData

/-- The square action gives an arrow of root data with the underlying line fixed. -/
theorem square_frame_compatibility (A : Type*) [CommRing A] (u gamma : Aˣ) :
    (u ^ 2 * gamma)⁻¹ * u ^ 2 = gamma⁻¹ := by
  sorry

/-- The root-section coordinate has weight one and its square has weight two. -/
theorem section_square_covariance (A : Type*) [CommRing A] (u : Aˣ) (a : A) :
    ((u : A) * a) ^ 2 = (u : A) ^ 2 * a ^ 2 := by
  sorry

/-- A frame section kills the relative stabilizer over any commutative ring. -/
theorem frame_relative_stabilizer_iff (A : Type*) [CommRing A] (v a : Aˣ) :
    (v ^ 2 = 1 ∧ v * a = a) ↔ v = 1 := by
  sorry

/-- Nonempty split root loci with frame sections also kill the ordinary scalar. -/
theorem frame_full_stabilizer_iff (A : Type*) [CommRing A]
    (r : ℕ) (hr : 0 < r) (c : Aˣ) (v a : Fin r → Aˣ) :
    (∀ j, v j ^ 2 = c ∧ v j * a j = a j) ↔
      c = 1 ∧ v = fun _ => 1 := by
  sorry

example (a : RootPicardData i) : (RootPicardSectionData.zero a).root = a := by
  sorry

example : (-1 : ZMod 5) ^ 2 = 1 ∧ (-1 : ZMod 5) * 0 = 0 := by
  sorry

example : (-1 : ZMod 5) * 1 ≠ 1 := by
  sorry

example : (DualNumber.eps : DualNumber (ZMod 5)) ≠ 0 ∧
    (DualNumber.eps : DualNumber (ZMod 5)) ^ 2 = 0 := by
  sorry

example : (2 : ZMod 5) ^ 2 = 4 ∧ (2 : ZMod 5) * 1 = 2 := by
  sorry

/-- With no root coordinates, the stabilizer equations leave a nontrivial scalar. -/
example : ∃ c : (ZMod 5)ˣ, c ≠ 1 ∧
    ∀ j : Fin 0, (1 : (ZMod 5)ˣ) ^ 2 = c ∧
      (1 : (ZMod 5)ˣ) * 1 = 1 := by
  sorry

/-!
Geometric omission ledger; all names denote README targets, not simulated data:
* native-root-fibres: nativeFibres, nativeIso, pullback, baseChange,
  descent, forget; tests empty, negative, nonsquareArrow, nontrivialRoot.
* root-tensor-coherence: tensor, unit, dual and coherent pullback.
* root-degree-components: degree, component, tensor degree, dual degree;
  no chosen degree-one point.
* root-frame-action: frameAtlas, rescale, frameChange, frameBaseChange,
  frameTorsor;
  tests empty, weights, nonsplit, torsorDescent.
* square-quotient-comparison: squareQuotient, its unit/counit and descent.
* relative-root-gerbe: relativeGerbe, relativeInertia and localNeutrality.
* native-root-section-fibres: nativeSectionFibres, sectionIso, forgetSection,
  RootPicardSectionData.zero, sectionPullback, squareEvaluation, sectionTensor;
  tests negative, zero, nilpotent, empty, emptyBase.
* section-quotient-comparison: sectionQuotient, sectionAffineCharts,
  zeroSection and its compatibility with the two quotient maps.
* root-stabilizers: fullStabilizer, relativeStabilizer, sectionStabilizer;
  only the coordinate frame consequences are stated above. Full triviality
  requires a nonempty root locus; the Fin 0 example retains ordinary scalars.

The absent ingredients are the actual scheme-site stack/quotient adapters,
finite-etale restriction-of-scalars/frame functors, coherent invertible-sheaf
pullback/dual/section interfaces and the family degree dictionary. Exact supplier
contracts are in the README. Native RootPicardData and RootPicardSectionData
above only expose fibre data; no groupoid or stack instance is claimed here.
Imported parent GC.0 families rootPicard (object, degree, tensor, forget;
tests empty_R, degree_minus_one, stabilizer), square-action-quotient,
rootPicardSection (object, forget, squareEvaluation; tests zero, empty_R,
weights) retain their full README contracts.
-/

end TauCeti.RamifiedClassField.GC0
