import Mathlib.AlgebraicGeometry.Morphisms.FlatRank
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.ZariskisMainTheorem
import Mathlib.CategoryTheory.Subobject.Lattice
import Mathlib.CategoryTheory.Limits.Shapes.ZeroObjects
import Mathlib.CategoryTheory.Yoneda
import Mathlib.CategoryTheory.Comma.Over.Pullback
import Mathlib.Algebra.Category.ModuleCat.Stalk
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.Algebra.TrivSqZeroExt.Basic
import TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.Basic
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic
import TauCeti.AlgebraicGeometry.Modules.TensorProduct

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
document is definitive. These statements suggest Lean forms so that contributors
and reviewers converge on names and signatures. Admitted statements do not claim
implementation or verify their mathematics.

The `Imported` namespace contains data signatures supplied by other roadmaps,
except the explicitly marked evaluation-cokernel helper. Its support, projective bundles and twists are the contracts
listed in the packet. No missing mathematical condition is represented by an
uninterpreted proposition. The fixed-polynomial predicate below uses the native
cohomology and explicit eventual finiteness and vanishing, so `finrank` junk values
cannot pass for an Euler characteristic.
-/

open CategoryTheory Limits Opposite AlgebraicGeometry
open TauCeti.AlgebraicGeometry
open scoped ZeroObject

universe u

noncomputable section

namespace TauCeti.AlgebraicGeometry.Moduli

namespace Imported

/-- SF.0/coherent-scheme-support: the annihilator ideal, with its native subscheme. -/
def support {X : Scheme.{u}} (F : FinitelyPresentedSheaf X) : X.IdealSheafData := by
  sorry

/-- Pullback of a finite local presentation, using the native module pullback. -/
def pullbackFP {X Y : Scheme.{u}} (f : X ⟶ Y) (E : FinitelyPresentedSheaf Y) :
    FinitelyPresentedSheaf X :=
  ⟨(Scheme.Modules.pullback f).obj E.obj, by sorry⟩

/-- R09.1/Jacobian A: pullback preserves the native invertible-sheaf property. -/
def pullbackLine {X Y : Scheme.{u}} (f : X ⟶ Y) (L : InvertibleSheaf Y) :
    InvertibleSheaf X :=
  ⟨(Scheme.Modules.pullback f).obj L.obj, by sorry⟩

end Imported

/-- Relative flatness is expressed using actual section modules and actual scalar maps. -/
def IsFlatOver {X S : Scheme.{u}} (f : X ⟶ S) (F : X.Modules) : Prop :=
  ∀ (U : S.Opens) (_ : IsAffineOpen U) (V : X.Opens) (_ : IsAffineOpen V)
    (e : V ≤ f ⁻¹ᵁ U),
    letI : Module Γ(S, U) Γ(F, V) :=
      Module.compHom Γ(F, V) (f.appLE U V e).hom
    Module.Flat Γ(S, U) Γ(F, V)

namespace IsFlatOver

theorem affine_iff {X S : Scheme.{u}} (f : X ⟶ S) (F : X.Modules) :
    IsFlatOver f F ↔
      ∀ (U : S.Opens) (_ : IsAffineOpen U) (V : X.Opens) (_ : IsAffineOpen V)
        (e : V ≤ f ⁻¹ᵁ U),
        letI : Module Γ(S, U) Γ(F, V) :=
          Module.compHom Γ(F, V) (f.appLE U V e).hom
        Module.Flat Γ(S, U) Γ(F, V) := by
  sorry

theorem baseChange {X S T : Scheme.{u}} (f : X ⟶ S) (g : T ⟶ S)
    (F : X.Modules) [F.IsQuasicoherent] (h : IsFlatOver f F) :
    IsFlatOver (pullback.snd f g) ((Scheme.Modules.pullback (pullback.fst f g)).obj F) := by
  sorry

theorem iso_iff {X S : Scheme.{u}} (f : X ⟶ S) {F G : X.Modules} (e : F ≅ G) :
    IsFlatOver f F ↔ IsFlatOver f G := by
  sorry

theorem structureSheaf_iff {X S : Scheme.{u}} (f : X ⟶ S) :
    IsFlatOver f (SheafOfModules.unit X.ringCatSheaf) ↔ Flat f := by
  sorry

-- IsFlatOver.test_zero
example {X S : Scheme.{u}} (f : X ⟶ S) : IsFlatOver f (0 : X.Modules) := by
  sorry

-- IsFlatOver.test_identity
example (X : Scheme.{u}) :
    IsFlatOver (𝟙 X) (SheafOfModules.unit X.ringCatSheaf) := by
  sorry

-- IsFlatOver.test_dualNumbers
example (k : Type u) [Field k] :
    let f := Spec.map (CommRingCat.ofHom ((TrivSqZeroExt.fstHom k k k).toRingHom))
    ¬ IsFlatOver f (SheafOfModules.unit (Spec (.of k)).ringCatSheaf) := by
  sorry

-- IsFlatOver.test_baseChange_closedPoint
example (k : Type u) [Field k] :
    let f := Spec.map (CommRingCat.ofHom ((TrivSqZeroExt.fstHom k k k).toRingHom))
    IsFlatOver (pullback.snd f f) ((Scheme.Modules.pullback (pullback.fst f f)).obj
      (SheafOfModules.unit (Spec (.of k)).ringCatSheaf)) := by
  sorry

end IsFlatOver

/-- An explicit native tensor expression for the positive twists read in the Hilbert tail.
This is notation for the imported twisting interface, not a second twisting target. -/
private def positiveTwist {X : Scheme.{u}} (L F : X.Modules) (n : ℕ) : X.Modules :=
  Scheme.Modules.tensorProduct X F
    ((fun M : X.Modules => Scheme.Modules.tensorProduct X M L)^[n]
      (SheafOfModules.unit X.ringCatSheaf))

/-- Fixed polynomial on residue-field fibres, with the exact finiteness and vanishing
needed to read the eventual H⁰ dimension as the Euler characteristic. -/
def Imported.HasFiberPolynomial {X S : Scheme.{u}} (f : X ⟶ S) (L F : X.Modules)
    (P : Polynomial ℚ) : Prop :=
  ∀ s : S,
    letI := f.fiberOverSpecResidueField s
    ∃ n₀ : ℕ, ∀ n ≥ n₀,
      let M := positiveTwist
        ((Scheme.Modules.pullback (f.fiberι s)).obj L)
        ((Scheme.Modules.pullback (f.fiberι s)).obj F) n
      FiniteDimensional (S.residueField s) (Scheme.Modules.Cohomology M 0) ∧
      (∀ i : ℕ, 0 < i → Subsingleton (Scheme.Modules.Cohomology M i)) ∧
      (Module.finrank (S.residueField s) (Scheme.Modules.Cohomology M 0) : ℚ) = P.eval (n : ℚ)

/-- An actual quotient map, before passing to its moduli equivalence class. -/
structure QuotFamily {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ) where
  target : FinitelyPresentedSheaf X
  quotient : E.obj ⟶ target.obj
  epi : Epi quotient
  flat : IsFlatOver f target.obj
  properSupport : IsProper ((Imported.support target).subschemeι ≫ f)
  polynomial : Imported.HasFiberPolynomial f L.obj target.obj P

attribute [instance] QuotFamily.epi

def quotientEquivalent {X S : Scheme.{u}} {f : X ⟶ S}
    {E : FinitelyPresentedSheaf X} {L : InvertibleSheaf X} {P : Polynomial ℚ}
    (q q' : QuotFamily f E L P) : Prop :=
  ∃ e : q.target.obj ≅ q'.target.obj, q.quotient ≫ e.hom = q'.quotient

def QuotFamily.kernel {X S : Scheme.{u}} {f : X ⟶ S}
    {E : FinitelyPresentedSheaf X} {L : InvertibleSheaf X} {P : Polynomial ℚ}
    (q : QuotFamily f E L P) : Subobject E.obj :=
  Subobject.mk (kernel.ι q.quotient)

theorem quotientEquivalent_iff_kernel_eq {X S : Scheme.{u}} {f : X ⟶ S}
    {E : FinitelyPresentedSheaf X} {L : InvertibleSheaf X} {P : Polynomial ℚ}
    (q q' : QuotFamily f E L P) :
    quotientEquivalent q q' ↔ q.kernel = q'.kernel := by
  sorry

namespace Imported

def freeFP (X : Scheme.{u}) (r : ℕ) : FinitelyPresentedSheaf X :=
  ⟨SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin r)), by sorry⟩

def unitFP (X : Scheme.{u}) : FinitelyPresentedSheaf X :=
  (InvertibleSheaf.toFinitelyPresented X).obj (InvertibleSheaf.trivial X)

/-- The imported coherent-module projective bundle, in the quotient convention. -/
def projectiveBundle {S : Scheme.{u}} (V : FinitelyPresentedSheaf S) : Over S := by
  sorry

def projectiveO1 {S : Scheme.{u}} (V : FinitelyPresentedSheaf S) :
    InvertibleSheaf (projectiveBundle V).left := by
  sorry

/-- StableReduction L2/R09.1 supplies this embedding and its polarization. -/
structure ProjectiveEmbedding {X S : Scheme.{u}} (f : X ⟶ S)
    (L : InvertibleSheaf X) where
  ambient : FinitelyPresentedSheaf S
  embedding : X ⟶ (projectiveBundle ambient).left
  closed : IsClosedImmersion embedding
  over : embedding ≫ (projectiveBundle ambient).hom = f
  polarization : L.obj ≅ (pullbackLine embedding (projectiveO1 ambient)).obj

/-- A concrete projectivity predicate, with no admitted proposition body. -/
def IsProjective {X S : Scheme.{u}} (f : X ⟶ S) : Prop :=
  ∃ (V : FinitelyPresentedSheaf S) (j : X ⟶ (projectiveBundle V).left),
    IsClosedImmersion j ∧ j ≫ (projectiveBundle V).hom = f

def zeroFamily {X S : Scheme.{u}} (f : X ⟶ S) (E : FinitelyPresentedSheaf X)
    (L : InvertibleSheaf X) : QuotFamily f E L 0 := by
  sorry

/-- Two coordinate epimorphisms, an example fixture using native free sheaves. -/
def coordinateFamily (k : Type u) [Field k] (i : Fin 2) :
    QuotFamily (𝟙 (Spec (.of k))) (freeFP (Spec (.of k)) 2)
      (InvertibleSheaf.trivial (Spec (.of k))) 1 := by
  sorry

end Imported

namespace QuotFamily

theorem quotient_is_epi {X S : Scheme.{u}} {f : X ⟶ S}
    {E : FinitelyPresentedSheaf X} {L : InvertibleSheaf X} {P : Polynomial ℚ}
    (q : QuotFamily f E L P) : Epi q.quotient := by
  sorry

def pullback {X S T : Scheme.{u}} {f : X ⟶ S}
    {E : FinitelyPresentedSheaf X} {L : InvertibleSheaf X} {P : Polynomial ℚ}
    (q : QuotFamily f E L P) (g : T ⟶ S) :
    QuotFamily (Limits.pullback.snd f g)
      (Imported.pullbackFP (Limits.pullback.fst f g) E)
      (Imported.pullbackLine (Limits.pullback.fst f g) L) P := by
  sorry

-- QuotFamily.test_zero
example {X S : Scheme.{u}} (f : X ⟶ S) (E : FinitelyPresentedSheaf X)
    (L : InvertibleSheaf X) : IsZero (Imported.zeroFamily f E L).target.obj := by
  sorry

-- QuotFamily.test_two_coordinate_quotients
example (k : Type u) [Field k] :
    (Imported.coordinateFamily k 0).kernel ≠ (Imported.coordinateFamily k 1).kernel := by
  sorry

-- QuotFamily.test_nonflat_source_allowed
example (k : Type u) [Field k] :
    let f := Spec.map (CommRingCat.ofHom ((TrivSqZeroExt.fstHom k k k).toRingHom))
    ¬ Flat f ∧ Nonempty (QuotFamily (Limits.pullback.snd f f)
      (Imported.pullbackFP (Limits.pullback.fst f f) (Imported.unitFP _))
      (Imported.pullbackLine (Limits.pullback.fst f f) (InvertibleSheaf.trivial _)) 1) := by
  sorry

-- QuotFamily.test_nonproper_support_excluded
example (k : Type u) [Field k] :
    let f := Spec.map (CommRingCat.ofHom (Polynomial.C : k →+* Polynomial k))
    ¬ IsProper f ∧ ∀ (P : Polynomial ℚ)
      (q : QuotFamily f (Imported.unitFP _) (InvertibleSheaf.trivial _) P),
        ¬ Nonempty (q.target.obj ≅ (Imported.unitFP _).obj) := by
  sorry

end QuotFamily

private def quotientSetoid {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ) :
    Setoid (QuotFamily f E L P) where
  r := quotientEquivalent
  iseqv := by sorry

abbrev QuotPoints {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ) :=
  Quotient (quotientSetoid f E L P)

private def testQuotPoints {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ)
    (T : Over S) :=
  QuotPoints (pullback.snd f T.hom)
    (Imported.pullbackFP (pullback.fst f T.hom) E)
    (Imported.pullbackLine (pullback.fst f T.hom) L) P

def QuotFunctor {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ) :
    (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := testQuotPoints f E L P T.unop
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

namespace QuotFunctor

theorem points {X S : Scheme.{u}} (f : X ⟶ S) (E : FinitelyPresentedSheaf X)
    (L : InvertibleSheaf X) (P : Polynomial ℚ) (T : Over S) :
    (QuotFunctor f E L P).obj (op T) = testQuotPoints f E L P T := by
  sorry

/-- The canonical cartesian transport includes the pullback associativity isomorphism. -/
private def pullClass {X S : Scheme.{u}} (f : X ⟶ S) (E : FinitelyPresentedSheaf X)
    (L : InvertibleSheaf X) (P : Polynomial ℚ) {T T' : Over S} (g : T' ⟶ T) :
    testQuotPoints f E L P T → testQuotPoints f E L P T' := by
  sorry

theorem map_class {X S : Scheme.{u}} (f : X ⟶ S) (E : FinitelyPresentedSheaf X)
    (L : InvertibleSheaf X) (P : Polynomial ℚ) {T T' : Over S} (g : T' ⟶ T)
    (q : testQuotPoints f E L P T) :
    (QuotFunctor f E L P).map g.op q = pullClass f E L P g q := by
  sorry

theorem zero_polynomial {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X)
    (_h : Imported.ProjectiveEmbedding f L) (T : Over S) :
    Nonempty (Unique ((QuotFunctor f E L 0).obj (op T))) := by
  sorry

theorem fpqc_injective {X S T : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ)
    (g : T ⟶ S) [Flat g] [Surjective g] [QuasiCompact g] :
    Function.Injective ((QuotFunctor f E L P).map
      (Over.homMk g : Over.mk g ⟶ Over.mk (𝟙 S)).op) := by
  sorry

-- QuotFunctor.test_point
example (k : Type u) [Field k] :
    Nonempty (uliftYoneda.{u + 1}.obj (Over.mk (𝟙 (Spec (.of k)))) ≅
      QuotFunctor (𝟙 (Spec (.of k))) (Imported.unitFP _)
        (InvertibleSheaf.trivial _) 1) := by
  sorry

-- QuotFunctor.test_zero
example {X S : Scheme.{u}} (f : X ⟶ S) (E : FinitelyPresentedSheaf X)
    (L : InvertibleSheaf X) (h : Imported.ProjectiveEmbedding f L) (T : Over S) :
    Nonempty (Unique ((QuotFunctor f E L 0).obj (op T))) := by
  sorry

-- QuotFunctor.test_coordinate_classes
example (k : Type u) [Field k] :
    (Quotient.mk (quotientSetoid (𝟙 (Spec (.of k))) (Imported.freeFP _ 2)
      (InvertibleSheaf.trivial _) 1) (Imported.coordinateFamily k 0)) ≠
      (Quotient.mk (quotientSetoid (𝟙 (Spec (.of k))) (Imported.freeFP _ 2)
      (InvertibleSheaf.trivial _) 1) (Imported.coordinateFamily k 1)) := by
  sorry

-- QuotFunctor.test_unit_rescaling
example {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} (q q' : QuotFamily f E L P)
    (e : q.target.obj ≅ q'.target.obj) (h : q.quotient ≫ e.hom = q'.quotient) :
    (Quotient.mk _ q : QuotPoints f E L P) = Quotient.mk _ q' := by
  sorry

-- QuotFunctor.test_negative_polynomial
example (k : Type u) [Field k] :
    IsEmpty ((QuotFunctor (𝟙 (Spec (.of k))) (Imported.unitFP _)
      (InvertibleSheaf.trivial _) (-1)).obj (op (Over.mk (𝟙 (Spec (.of k)))))) := by
  sorry

-- QuotFunctor.test_nonintegral_polynomial
example (k : Type u) [Field k] :
    IsEmpty ((QuotFunctor (𝟙 (Spec (.of k))) (Imported.unitFP _)
      (InvertibleSheaf.trivial _) (Polynomial.C (1 / 2 : ℚ))).obj
        (op (Over.mk (𝟙 (Spec (.of k)))))) := by
  sorry

-- QuotFunctor.test_empty_base
-- The fibre-polynomial condition is vacuous on the empty test scheme, for every P.
example {X S : Scheme.{u}} (f : X ⟶ S) (E : FinitelyPresentedSheaf X)
    (L : InvertibleSheaf X) (P : Polynomial ℚ) :
    Nonempty (Unique ((QuotFunctor f E L P).obj (op (Over.mk (Scheme.emptyTo S))))) := by
  sorry

end QuotFunctor

structure HilbertFamily {X S : Scheme.{u}} (f : X ⟶ S)
    (L : InvertibleSheaf X) (P : Polynomial ℚ) where
  ideal : X.IdealSheafData
  finitePresentation : LocallyOfFinitePresentation (ideal.subschemeι ≫ f)
  proper : IsProper (ideal.subschemeι ≫ f)
  flat : Flat (ideal.subschemeι ≫ f)
  polynomial : Imported.HasFiberPolynomial (ideal.subschemeι ≫ f)
    ((Scheme.Modules.pullback ideal.subschemeι).obj L.obj)
    (SheafOfModules.unit ideal.subscheme.ringCatSheaf) P

def HilbertFunctor {X S : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X)
    (P : Polynomial ℚ) : (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} (HilbertFamily (pullback.snd f T.unop.hom)
    (Imported.pullbackLine (pullback.fst f T.unop.hom) L) P)
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

namespace HilbertFunctor

theorem points {X S : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X)
    (P : Polynomial ℚ) (T : Over S) :
    (HilbertFunctor f L P).obj (op T) = ULift.{u + 1} (HilbertFamily (pullback.snd f T.hom)
      (Imported.pullbackLine (pullback.fst f T.hom) L) P) := by
  sorry

theorem pullback {X S : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X)
    (P : Polynomial ℚ) {T T' : Over S} (g : T' ⟶ T)
    (Z : (HilbertFunctor f L P).obj (op T)) :
    ((HilbertFunctor f L P).map g.op Z).down.ideal =
      Z.down.ideal.comap (pullback.map f T'.hom f T.hom (𝟙 X) g.left (𝟙 S)
        (by simp) (by simp [g.w])) := by
  sorry

theorem ideal_iff {X S : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X)
    (P : Polynomial ℚ) (T : Over S) (Z Z' : (HilbertFunctor f L P).obj (op T)) :
    Z = Z' ↔ Z.down.ideal = Z'.down.ideal := by
  sorry

-- HilbertFunctor.test_empty
example {X S : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X)
    (h : Imported.ProjectiveEmbedding f L) (T : Over S) :
    Unique ((HilbertFunctor f L 0).obj (op T)) := by
  sorry

-- HilbertFunctor.test_point
example (k : Type u) [Field k] (T : Over (Spec (.of k))) :
    Unique ((HilbertFunctor (𝟙 (Spec (.of k))) (InvertibleSheaf.trivial _) 1).obj
      (op T)) := by
  sorry

-- HilbertFunctor.test_double_point
example (k : Type u) [Field k] :
    let X := Spec (CommRingCat.of (TrivSqZeroExt k k))
    let f := Spec.map (CommRingCat.ofHom (algebraMap k (TrivSqZeroExt k k)))
    let L := InvertibleSheaf.trivial X
    let T := Over.mk (𝟙 (Spec (.of k)))
    ∃ Z₁ : (HilbertFunctor f L 1).obj (op T),
      ∃ Z₂ : (HilbertFunctor f L 2).obj (op T), Z₁.down.ideal ≠ Z₂.down.ideal := by
  sorry

end HilbertFunctor

def hilbertQuotIso {X S : Scheme.{u}} (f : X ⟶ S) (L : InvertibleSheaf X)
    (P : Polynomial ℚ) : HilbertFunctor f L P ≅ QuotFunctor f (Imported.unitFP X) L P := by
  sorry

namespace Imported

def IsLocallyClosedImmersion {X S : Scheme.{u}} (f : X ⟶ S) : Prop :=
  ∃ (V : Scheme.{u}) (i : X ⟶ V) (j : V ⟶ S),
    IsClosedImmersion i ∧ IsOpenImmersion j ∧ i ≫ j = f

def FlatPolynomialPullback {X S T : Scheme.{u}} (f : X ⟶ S)
    (L : InvertibleSheaf X) (F : FinitelyPresentedSheaf X) (P : Polynomial ℚ)
    (g : T ⟶ S) : Prop :=
  IsFlatOver (pullback.snd f g) ((Scheme.Modules.pullback (pullback.fst f g)).obj F.obj) ∧
  HasFiberPolynomial (pullback.snd f g)
    ((Scheme.Modules.pullback (pullback.fst f g)).obj L.obj)
    ((Scheme.Modules.pullback (pullback.fst f g)).obj F.obj) P

/-- The rank-quotient Grassmannian itself is supplied by ModularCurves 0G. -/
def grassmannian (S : Scheme.{u}) (N r : ℕ) : Over S := by
  sorry

structure ProjectivePresentation {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) where
  embedding : ProjectiveEmbedding f L
  generators : ℕ
  twist : ℕ
  map : (freeFP X generators).obj ⟶ positiveTwist L.obj E.obj twist
  epi : Epi map

/-- R09.2 evaluation cokernel used by recovery; the universal Grassmann quotient
and its kernel are supplied by ModularCurves 0G. This helper is new R09.2 data. -/
def recoveredQuotient {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X)
    (m N r : ℕ) (evaluation : (freeFP X N).obj ⟶ positiveTwist L.obj E.obj m)
    (T : Over S) (v : T ⟶ grassmannian S N r) :
    FinitelyPresentedSheaf (pullback f T.hom) := by
  sorry

/-- The induced source map to the R09.2 evaluation cokernel. -/
def recoveredMap {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X)
    (m N r : ℕ) (evaluation : (freeFP X N).obj ⟶ positiveTwist L.obj E.obj m)
    (T : Over S) (v : T ⟶ grassmannian S N r) :
    (pullbackFP (pullback.fst f T.hom) E).obj ⟶
      (recoveredQuotient f E L m N r evaluation T v).obj := by
  sorry

end Imported

structure FlatteningStrata {X S : Scheme.{u}} (f : X ⟶ S)
    (L : InvertibleSheaf X) (F : FinitelyPresentedSheaf X) where
  polynomials : Finset (Polynomial ℚ)
  stratum : Polynomial ℚ → Over S
  locallyClosed : ∀ P, Imported.IsLocallyClosedImmersion (stratum P).hom
  factorization : ∀ (P : Polynomial ℚ) (T : Over S),
    (Nonempty (T ⟶ stratum P)) ↔ Imported.FlatPolynomialPullback f L F P T.hom
  pointPartition : ∀ s : S, ∃! P : Polynomial ℚ,
    P ∈ polynomials ∧ s ∈ Set.range (stratum P).hom

theorem flattening_strata_exists {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S]
    (L : InvertibleSheaf X) (F : FinitelyPresentedSheaf X)
    (h : Imported.ProjectiveEmbedding f L) : Nonempty (FlatteningStrata f L F) := by
  sorry

namespace FlatteningStrata

theorem factor_iff {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {F : FinitelyPresentedSheaf X} (σ : FlatteningStrata f L F)
    (P : Polynomial ℚ) (T : Over S) :
    Nonempty (T ⟶ σ.stratum P) ↔ Imported.FlatPolynomialPullback f L F P T.hom := by
  sorry

theorem unique_factor {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {F : FinitelyPresentedSheaf X} (σ : FlatteningStrata f L F)
    (P : Polynomial ℚ) (T : Over S) : Subsingleton (T ⟶ σ.stratum P) := by
  sorry

theorem baseChange {X S T : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {F : FinitelyPresentedSheaf X} (σ : FlatteningStrata f L F)
    (g : T ⟶ S) (P : Polynomial ℚ) (T' : Over T) :
    Nonempty (T' ⟶ Over.mk (pullback.snd (σ.stratum P).hom g)) ↔
      Imported.FlatPolynomialPullback f L F P (T'.hom ≫ g) := by
  sorry

theorem partition {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {F : FinitelyPresentedSheaf X} (σ : FlatteningStrata f L F) :
    ∀ s : S, ∃! P : Polynomial ℚ,
      P ∈ σ.polynomials ∧ s ∈ Set.range (σ.stratum P).hom := by
  sorry

-- FlatteningStrata.test_flat
example {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {F : FinitelyPresentedSheaf X} (σ : FlatteningStrata f L F) (P : Polynomial ℚ)
    (h : IsFlatOver f F.obj) (hP : Imported.HasFiberPolynomial f L.obj F.obj P) :
    IsIso (σ.stratum P).hom := by
  sorry

-- FlatteningStrata.test_zero
example {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {F : FinitelyPresentedSheaf X} (σ : FlatteningStrata f L F) (h : IsZero F.obj) :
    IsIso (σ.stratum 0).hom := by
  sorry

-- FlatteningStrata.test_dualNumbers
example (k : Type u) [Field k] (F : FinitelyPresentedSheaf
    (Spec (CommRingCat.of (TrivSqZeroExt k k))))
    (e : F.obj ≅ (Scheme.Modules.pushforward
      (Spec.map (CommRingCat.ofHom ((TrivSqZeroExt.fstHom k k k).toRingHom)))).obj
      (SheafOfModules.unit (Spec (.of k)).ringCatSheaf))
    (σ : FlatteningStrata (𝟙 _) (InvertibleSheaf.trivial _) F) :
    Nonempty (σ.stratum 1 ≅ Over.mk
      (Spec.map (CommRingCat.ofHom ((TrivSqZeroExt.fstHom k k k).toRingHom)))) := by
  sorry

end FlatteningStrata

structure QuotGrassmannData {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ) where
  twist : ℕ
  ambientRank : ℕ
  rank : ℕ
  evaluation : (Imported.freeFP X ambientRank).obj ⟶ positiveTwist L.obj E.obj twist
  /-- Numerical rank is forced only where a family over a nonempty base exists.
  For inadmissible P the representing locus is empty, with its unique empty-base point. -/
  rank_eq : ∀ (T : Over S), Nonempty T.left →
    Nonempty ((QuotFunctor f E L P).obj (op T)) → P.eval (twist : ℚ) = (rank : ℚ)
  transformation : QuotFunctor f E L P ⟶
    uliftYoneda.{u + 1}.obj (Imported.grassmannian S ambientRank rank)

def quotGrassmannMap {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S] [IsAffine S]
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ)
    (h : Imported.ProjectivePresentation f E L) : QuotGrassmannData f E L P := by
  sorry

namespace quotGrassmannMap

theorem rank {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} (d : QuotGrassmannData f E L P)
    (T : Over S) (hT : Nonempty T.left)
    (hq : Nonempty ((QuotFunctor f E L P).obj (op T))) :
    P.eval (d.twist : ℚ) = (d.rank : ℚ) := by
  sorry

theorem injective {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} [IsNoetherian S] [IsAffine S]
    (h : Imported.ProjectivePresentation f E L) (T : Over S) :
    Function.Injective ((quotGrassmannMap f E L P h).transformation.app (op T)) := by
  sorry

theorem baseChange {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} (d : QuotGrassmannData f E L P)
    {T T' : Over S} (g : T' ⟶ T) :
    (QuotFunctor f E L P).map g.op ≫ d.transformation.app (op T') =
      d.transformation.app (op T) ≫
        (uliftYoneda.{u + 1}.obj (Imported.grassmannian S d.ambientRank d.rank)).map g.op := by
  sorry

theorem recovery {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} [IsNoetherian S] [IsAffine S]
    (h : Imported.ProjectivePresentation f E L) (T : Over S)
    (q : QuotFamily (pullback.snd f T.hom)
      (Imported.pullbackFP (pullback.fst f T.hom) E)
      (Imported.pullbackLine (pullback.fst f T.hom) L) P) :
    let d := quotGrassmannMap f E L P h
    ∃ e : q.target.obj ≅ (Imported.recoveredQuotient f E L
      d.twist d.ambientRank d.rank d.evaluation T (d.transformation.app (op T)
        (Quotient.mk _ q)).down).obj,
      q.quotient ≫ e.hom = Imported.recoveredMap f E L d.twist d.ambientRank d.rank
        d.evaluation T (d.transformation.app (op T) (Quotient.mk _ q)).down := by
  sorry

-- quotGrassmannMap.test_point
example (k : Type u) [Field k] (p r : ℕ) :
    Nonempty (QuotFunctor (𝟙 (Spec (.of k))) (Imported.freeFP _ p)
      (InvertibleSheaf.trivial _) (Polynomial.C (r : ℚ)) ≅
        uliftYoneda.{u + 1}.obj (Imported.grassmannian (Spec (.of k)) p r)) := by
  sorry

-- quotGrassmannMap.test_zero
example {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S] [IsAffine S]
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X)
    (h : Imported.ProjectivePresentation f E L) :
    (quotGrassmannMap f E L 0 h).rank = 0 := by
  sorry

-- quotGrassmannMap.test_coordinates
-- In particular, this distinguishes the two coordinate quotients of k².
example {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} [IsNoetherian S] [IsAffine S]
    (h : Imported.ProjectivePresentation f E L) (T : Over S)
    (q q' : QuotFamily (pullback.snd f T.hom)
      (Imported.pullbackFP (pullback.fst f T.hom) E)
      (Imported.pullbackLine (pullback.fst f T.hom) L) P)
    (hne : q.kernel ≠ q'.kernel) :
    (quotGrassmannMap f E L P h).transformation.app (op T) (Quotient.mk _ q) ≠
      (quotGrassmannMap f E L P h).transformation.app (op T) (Quotient.mk _ q') := by
  sorry

end quotGrassmannMap

structure QuotScheme {X S : Scheme.{u}} (f : X ⟶ S)
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ) where
  base : Over S
  representation : uliftYoneda.{u + 1}.obj base ≅ QuotFunctor f E L P
  projective : Imported.IsProjective base.hom

theorem quot_projective {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S]
    (E : FinitelyPresentedSheaf X) (L : InvertibleSheaf X) (P : Polynomial ℚ)
    (h : Imported.ProjectiveEmbedding f L) : Nonempty (QuotScheme f E L P) := by
  sorry

namespace QuotScheme

theorem represent {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} (Q : QuotScheme f E L P) (T : Over S) :
    Nonempty ((T ⟶ Q.base) ≃ (QuotFunctor f E L P).obj (op T)) := by
  sorry

def universal {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} (Q : QuotScheme f E L P) :
    QuotFamily (pullback.snd f Q.base.hom)
      (Imported.pullbackFP (pullback.fst f Q.base.hom) E)
      (Imported.pullbackLine (pullback.fst f Q.base.hom) L) P := by
  sorry

theorem pullback_universal {X S : Scheme.{u}} {f : X ⟶ S}
    {E : FinitelyPresentedSheaf X} {L : InvertibleSheaf X} {P : Polynomial ℚ}
    (Q : QuotScheme f E L P) (T : Over S) (t : T ⟶ Q.base) :
    Q.representation.hom.app (op T) (ULift.up t) =
      (QuotFunctor f E L P).map t.op (Quotient.mk _ Q.universal) := by
  sorry

theorem baseChange {X S T : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} {P : Polynomial ℚ} (Q : QuotScheme f E L P) (g : T ⟶ S) :
    Nonempty (uliftYoneda.{u + 1}.obj (Over.mk (pullback.snd Q.base.hom g)) ≅
      QuotFunctor (pullback.snd f g) (Imported.pullbackFP (pullback.fst f g) E)
        (Imported.pullbackLine (pullback.fst f g) L) P) := by
  sorry

-- QuotScheme.test_point
example (k : Type u) [Field k]
    (Q : QuotScheme (𝟙 (Spec (.of k))) (Imported.unitFP _) (InvertibleSheaf.trivial _) 1) :
    Nonempty (Q.base ≅ Over.mk (𝟙 (Spec (.of k)))) ∧ IsIso Q.universal.quotient := by
  sorry

-- QuotScheme.test_zero
example {X S : Scheme.{u}} {f : X ⟶ S} {E : FinitelyPresentedSheaf X}
    {L : InvertibleSheaf X} (h : Imported.ProjectiveEmbedding f L)
    (Q : QuotScheme f E L 0) :
    Nonempty (Q.base ≅ Over.mk (𝟙 S)) ∧ IsZero Q.universal.target.obj := by
  sorry

-- QuotScheme.test_nonflat_parameter
example (k : Type u) [Field k] :
    let f := Spec.map (CommRingCat.ofHom ((TrivSqZeroExt.fstHom k k k).toRingHom))
    ∀ Q : QuotScheme f (Imported.unitFP _) (InvertibleSheaf.trivial _) 1,
      Nonempty (Q.base ≅ Over.mk f) ∧ ¬ Flat Q.base.hom ∧
        IsFlatOver (pullback.snd f Q.base.hom) Q.universal.target.obj := by
  sorry

end QuotScheme

structure HilbertScheme {X S : Scheme.{u}} (f : X ⟶ S)
    (L : InvertibleSheaf X) (P : Polynomial ℚ) where
  base : Over S
  representation : uliftYoneda.{u + 1}.obj base ≅ HilbertFunctor f L P
  projective : Imported.IsProjective base.hom

namespace HilbertScheme

def ofQuot {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {P : Polynomial ℚ} (Q : QuotScheme f (Imported.unitFP X) L P) : HilbertScheme f L P where
  base := Q.base
  representation := Q.representation ≪≫ (hilbertQuotIso f L P).symm
  projective := Q.projective

theorem represent {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {P : Polynomial ℚ} (H : HilbertScheme f L P) (T : Over S) :
    Nonempty ((T ⟶ H.base) ≃ (HilbertFunctor f L P).obj (op T)) := by
  sorry

def universal {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {P : Polynomial ℚ} (H : HilbertScheme f L P) :
    HilbertFamily (pullback.snd f H.base.hom)
      (Imported.pullbackLine (pullback.fst f H.base.hom) L) P :=
  (H.representation.hom.app (op H.base) (ULift.up (𝟙 H.base))).down

theorem pullback_universal {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {P : Polynomial ℚ} (H : HilbertScheme f L P) (T : Over S) (t : T ⟶ H.base) :
    H.representation.hom.app (op T) (ULift.up t) =
      (HilbertFunctor f L P).map t.op (ULift.up H.universal) := by
  sorry

theorem baseChange {X S T : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {P : Polynomial ℚ} (H : HilbertScheme f L P) (g : T ⟶ S) :
    Nonempty (uliftYoneda.{u + 1}.obj (Over.mk (pullback.snd H.base.hom g)) ≅
      HilbertFunctor (pullback.snd f g) (Imported.pullbackLine (pullback.fst f g) L) P) := by
  sorry

theorem quot_compat {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    {P : Polynomial ℚ} (H : HilbertScheme f L P) (Q : QuotScheme f (Imported.unitFP X) L P) :
    ∃ e : H.base ≅ Q.base,
      uliftYoneda.{u + 1}.map e.hom ≫ Q.representation.hom =
        H.representation.hom ≫ (hilbertQuotIso f L P).hom := by
  sorry

-- HilbertScheme.test_point
example (k : Type u) [Field k]
    (H : HilbertScheme (𝟙 (Spec (.of k))) (InvertibleSheaf.trivial _) 1) :
    Nonempty (H.base ≅ Over.mk (𝟙 (Spec (.of k)))) ∧ H.universal.ideal = ⊥ := by
  sorry

-- HilbertScheme.test_empty
example {X S : Scheme.{u}} {f : X ⟶ S} {L : InvertibleSheaf X}
    (h : Imported.ProjectiveEmbedding f L) (H : HilbertScheme f L 0) :
    Nonempty (H.base ≅ Over.mk (𝟙 S)) ∧ IsEmpty H.universal.ideal.subscheme := by
  sorry

-- HilbertScheme.test_double_point
example (k : Type u) [Field k] :
    let f := Spec.map (CommRingCat.ofHom (algebraMap k (TrivSqZeroExt k k)))
    ∀ H : HilbertScheme f (InvertibleSheaf.trivial _) 1,
      Nonempty (H.base ≅ Over.mk f) := by
  sorry

end HilbertScheme

theorem hilbert_one_iso {X S : Scheme.{u}} (f : X ⟶ S) [LocallyOfFinitePresentation f]
    (L : InvertibleSheaf X) (h : Imported.ProjectiveEmbedding f L) :
    Nonempty (uliftYoneda.{u + 1}.obj (Over.mk f) ≅ HilbertFunctor f L 1) := by
  sorry

private def baseChangeObject {S : Scheme.{u}} (X T : Over S) : Over T.left :=
  Over.mk (pullback.snd X.hom T.hom)

/-- The cartesian pullback of a specified native morphism, used by the examples. -/
private def baseChangeMorphism {S : Scheme.{u}} (X Y T : Over S) (a : X ⟶ Y) :
    baseChangeObject X T ⟶ baseChangeObject Y T :=
  Over.homMk (pullback.map X.hom T.hom Y.hom T.hom a.left (𝟙 T.left) (𝟙 S)
    (by simp) (by simp)) (by simp [baseChangeObject, pullback.map, pullback.lift_snd])

private def pullHom {S : Scheme.{u}} (X Y : Over S) {T T' : Over S} (g : T' ⟶ T) :
    (baseChangeObject X T ⟶ baseChangeObject Y T) →
      (baseChangeObject X T' ⟶ baseChangeObject Y T') := by
  sorry

def HomFunctor {S : Scheme.{u}} (X Y : Over S) : (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} (baseChangeObject X T.unop ⟶ baseChangeObject Y T.unop)
  map g := ↾fun a => ULift.up (pullHom X Y g.unop a.down)
  map_id := by sorry
  map_comp := by sorry

private structure AllHilbertFamily {X S : Scheme.{u}} (f : X ⟶ S) where
  ideal : X.IdealSheafData
  flat : Flat (ideal.subschemeι ≫ f)
  proper : IsProper (ideal.subschemeι ≫ f)
  finitePresentation : LocallyOfFinitePresentation (ideal.subschemeι ≫ f)

private def AllHilbertFunctor {X S : Scheme.{u}} (f : X ⟶ S) :
    (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} (AllHilbertFamily (pullback.snd f T.unop.hom))
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

namespace HomFunctor

theorem points {S : Scheme.{u}} (X Y T : Over S) :
    (HomFunctor X Y).obj (op T) =
      ULift.{u + 1} (baseChangeObject X T ⟶ baseChangeObject Y T) := by
  sorry

theorem pullback {S : Scheme.{u}} (X Y : Over S) {T T' : Over S} (g : T' ⟶ T)
    (a : (HomFunctor X Y).obj (op T)) :
    (HomFunctor X Y).map g.op a = ULift.up (pullHom X Y g a.down) := by
  sorry

def graph {S : Scheme.{u}} (X Y : Over S) [IsProper X.hom] [Flat X.hom]
    [LocallyOfFinitePresentation X.hom] [IsSeparated Y.hom]
    [LocallyOfFinitePresentation Y.hom] :
    HomFunctor X Y ⟶ AllHilbertFunctor (pullback.fst X.hom Y.hom ≫ X.hom) := by
  sorry

theorem graph_injective {S : Scheme.{u}} (X Y : Over S) [IsProper X.hom]
    [Flat X.hom] [LocallyOfFinitePresentation X.hom] [IsSeparated Y.hom]
    [LocallyOfFinitePresentation Y.hom] (T : Over S) :
    Function.Injective ((graph X Y).app (op T)) := by
  sorry

-- HomFunctor.test_terminal
example {S : Scheme.{u}} (X T : Over S) :
    Nonempty (Unique ((HomFunctor X (Over.mk (𝟙 S))).obj (op T))) := by
  sorry

-- HomFunctor.test_empty_source
example {S : Scheme.{u}} (Y T : Over S) :
    Nonempty (Unique ((HomFunctor (Over.mk (Scheme.emptyTo S)) Y).obj (op T))) := by
  sorry

-- HomFunctor.test_nongraph
example (k : Type u) [Field k] :
    let X := Over.mk (𝟙 (Spec (.of k)))
    let Y := Over.mk (Spec.map (CommRingCat.ofHom (algebraMap k (k × k))))
    letI : IsProper X.hom := by change IsProper (𝟙 _); infer_instance
    letI : Flat X.hom := by change Flat (𝟙 _); infer_instance
    letI : LocallyOfFinitePresentation X.hom := by
      change LocallyOfFinitePresentation (𝟙 _); infer_instance
    letI : IsSeparated Y.hom := by sorry
    letI : LocallyOfFinitePresentation Y.hom := by sorry
    let f := pullback.fst X.hom Y.hom ≫ X.hom
    ∀ a : (HomFunctor X Y).obj (op X),
      ((graph X Y).app (op X) a).down.ideal ≠
        (⊥ : (Limits.pullback f X.hom).IdealSheafData) := by
  sorry

-- HomFunctor.test_two_points
example (k : Type u) [Field k] :
    let X := Over.mk (𝟙 (Spec (.of k)))
    let Y := Over.mk (Spec.map (CommRingCat.ofHom (algebraMap k (k × k))))
    Nonempty ((HomFunctor X Y).obj (op X) ≃ Bool) := by
  sorry

end HomFunctor

namespace Imported

structure QuasiProjectiveEmbedding {X S : Scheme.{u}} (f : X ⟶ S)
    (L : InvertibleSheaf X) where
  ambient : FinitelyPresentedSheaf S
  embedding : X ⟶ (projectiveBundle ambient).left
  locallyClosed : IsLocallyClosedImmersion embedding
  over : embedding ≫ (projectiveBundle ambient).hom = f
  polarization : L.obj ≅ (pullbackLine embedding (projectiveO1 ambient)).obj

def tensorLine {X : Scheme.{u}} (L M : InvertibleSheaf X) : InvertibleSheaf X :=
  ⟨Scheme.Modules.tensorProduct X L.obj M.obj, by sorry⟩

def IsGraphPolynomial {S : Scheme.{u}} (X Y T : Over S)
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left)
    (P : Polynomial ℚ) (a : baseChangeObject X T ⟶ baseChangeObject Y T) : Prop :=
  let LX' := pullbackLine (pullback.fst X.hom T.hom) LX
  let LY' := pullbackLine (pullback.fst Y.hom T.hom) LY
  HasFiberPolynomial (baseChangeObject X T).hom
    (tensorLine LX' (pullbackLine a.left LY')).obj
    (SheafOfModules.unit (baseChangeObject X T).left.ringCatSheaf) P

def FixedHomFunctor {S : Scheme.{u}} (X Y : Over S)
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left) (P : Polynomial ℚ) :
    (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} {a : baseChangeObject X T.unop ⟶ baseChangeObject Y T.unop //
    IsGraphPolynomial X Y T.unop LX LY P a}
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

def projectiveLine (k : Type u) [Field k] : Over (Spec (.of k)) :=
  projectiveBundle (freeFP (Spec (.of k)) 2)

/-- The projective-line map [x:y] ↦ [x²:y²], retaining its degree-two scheme map. -/
def squareMap (k : Type u) [Field k] : projectiveLine k ⟶ projectiveLine k := by
  sorry

end Imported

/-- The map induced on the two families by an arbitrary base change. -/
private def pullFamilyMap {X Y S T : Scheme.{u}} (p : X ⟶ S) (q : Y ⟶ S)
    (a : X ⟶ Y) (ha : a ≫ q = p) (g : T ⟶ S) : pullback p g ⟶ pullback q g :=
  pullback.map p g q g a (𝟙 T) (𝟙 S) (by simpa using ha.symm) (by simp)

theorem isomorphism_locus {X Y S : Scheme.{u}} (p : X ⟶ S) (q : Y ⟶ S)
    [IsProper p] [IsProper q] [Flat p] [Flat q]
    [LocallyOfFinitePresentation p] [LocallyOfFinitePresentation q]
    (a : X ⟶ Y) (ha : a ≫ q = p) :
    ∃ U : S.Opens, ∀ (T : Scheme.{u}) (g : T ⟶ S),
      IsIso (pullFamilyMap p q a ha g) ↔ Set.range g ⊆ (U : Set S) := by
  sorry

theorem hom_representable {S : Scheme.{u}} [IsNoetherian S] (X Y : Over S)
    [Flat X.hom] [LocallyOfFinitePresentation X.hom]
    [LocallyOfFinitePresentation Y.hom] [IsSeparated Y.hom]
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left)
    (hX : Imported.ProjectiveEmbedding X.hom LX)
    (hY : Imported.QuasiProjectiveEmbedding Y.hom LY) :
    ∃ H : Over S, Nonempty (uliftYoneda.{u + 1}.obj H ≅ HomFunctor X Y) ∧
      IsSeparated H.hom ∧ LocallyOfFinitePresentation H.hom := by
  sorry

theorem hom_representable_fixed {S : Scheme.{u}} [IsNoetherian S] (X Y : Over S)
    [Flat X.hom] [LocallyOfFinitePresentation X.hom]
    [LocallyOfFinitePresentation Y.hom] [IsSeparated Y.hom]
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left)
    (hX : Imported.ProjectiveEmbedding X.hom LX)
    (hY : Imported.QuasiProjectiveEmbedding Y.hom LY) (P : Polynomial ℚ) :
    ∃ H : Over S, Nonempty (uliftYoneda.{u + 1}.obj H ≅
      Imported.FixedHomFunctor X Y LX LY P) ∧ IsSeparated H.hom ∧
      LocallyOfFinitePresentation H.hom ∧ QuasiCompact H.hom := by
  sorry

private def pullIso {S : Scheme.{u}} (X Y : Over S) {T T' : Over S} (g : T' ⟶ T) :
    (baseChangeObject X T ≅ baseChangeObject Y T) →
      (baseChangeObject X T' ≅ baseChangeObject Y T') := by
  sorry

def IsomFunctor {S : Scheme.{u}} (X Y : Over S) : (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} (baseChangeObject X T.unop ≅ baseChangeObject Y T.unop)
  map g := ↾fun e => ULift.up (pullIso X Y g.unop e.down)
  map_id := by sorry
  map_comp := by sorry

namespace IsomFunctor

theorem points {S : Scheme.{u}} (X Y T : Over S) :
    (IsomFunctor X Y).obj (op T) =
      ULift.{u + 1} (baseChangeObject X T ≅ baseChangeObject Y T) := by
  sorry

def inverse {S : Scheme.{u}} (X Y : Over S) : IsomFunctor X Y ≅ IsomFunctor Y X := by
  sorry

def toHom {S : Scheme.{u}} (X Y : Over S) : IsomFunctor X Y ⟶ HomFunctor X Y := by
  sorry

theorem toHom_injective {S : Scheme.{u}} (X Y T : Over S) :
    Function.Injective ((toHom X Y).app (op T)) := by
  sorry

theorem toHom_apply {S : Scheme.{u}} (X Y T : Over S)
    (e : (IsomFunctor X Y).obj (op T)) :
    (toHom X Y).app (op T) e = ULift.up e.down.hom := by
  sorry

theorem pullback {S : Scheme.{u}} (X Y : Over S) {T T' : Over S} (g : T' ⟶ T)
    (e : (IsomFunctor X Y).obj (op T)) :
    ((IsomFunctor X Y).map g.op e).down = pullIso X Y g e.down := by
  sorry

-- IsomFunctor.test_empty
example {S : Scheme.{u}} (T : Over S) :
    Nonempty (Unique ((IsomFunctor (Over.mk (Scheme.emptyTo S))
      (Over.mk (Scheme.emptyTo S))).obj (op T))) := by
  sorry

-- IsomFunctor.test_two_points
example (k : Type u) [Field k] :
    let X := Over.mk (Spec.map (CommRingCat.ofHom (algebraMap k (k × k))))
    let T := Over.mk (𝟙 (Spec (.of k)))
    Nonempty ((IsomFunctor X X).obj (op T) ≃ Bool) := by
  sorry

-- IsomFunctor.test_nonlinear_map
example (k : Type u) [Field k] :
    let X := Imported.projectiveLine k
    let T := Over.mk (𝟙 (Spec (.of k)))
    ∀ e : (IsomFunctor X X).obj (op T),
      (toHom X X).app (op T) e ≠ ULift.up (baseChangeMorphism X X T (Imported.squareMap k)) := by
  sorry

end IsomFunctor

theorem isom_representable {S : Scheme.{u}} [IsNoetherian S] (X Y : Over S)
    [Flat X.hom] [Flat Y.hom] [LocallyOfFinitePresentation X.hom]
    [LocallyOfFinitePresentation Y.hom]
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left)
    (hX : Imported.ProjectiveEmbedding X.hom LX)
    (hY : Imported.ProjectiveEmbedding Y.hom LY) :
    ∃ H : Over S, Nonempty (uliftYoneda.{u + 1}.obj H ≅ IsomFunctor X Y) ∧
      IsSeparated H.hom ∧ LocallyOfFinitePresentation H.hom := by
  sorry

private def SheafIsomFunctor {X S : Scheme.{u}} (f : X ⟶ S)
    (E F : FinitelyPresentedSheaf X) : (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} (((Scheme.Modules.pullback (pullback.fst f T.unop.hom)).obj E.obj) ≅
    ((Scheme.Modules.pullback (pullback.fst f T.unop.hom)).obj F.obj))
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

theorem sheaf_isom_affine {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S]
    [LocallyOfFinitePresentation f] (L : InvertibleSheaf X)
    (h : Imported.ProjectiveEmbedding f L) (E F : FinitelyPresentedSheaf X)
    (hE : IsFlatOver f E.obj) (hF : IsFlatOver f F.obj) :
    ∃ H : Over S, Nonempty (uliftYoneda.{u + 1}.obj H ≅ SheafIsomFunctor f E F) ∧
      IsAffineHom H.hom ∧ LocallyOfFinitePresentation H.hom := by
  sorry

structure PolarizedPair {S : Scheme.{u}} (X Y T : Over S)
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left) where
  schemeIso : baseChangeObject X T ≅ baseChangeObject Y T
  lineIso : (Imported.pullbackLine schemeIso.hom.left
    (Imported.pullbackLine (pullback.fst Y.hom T.hom) LY)).obj ≅
      (Imported.pullbackLine (pullback.fst X.hom T.hom) LX).obj

def PolarizedIsomFunctor {S : Scheme.{u}} (X Y : Over S)
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left) :
    (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} (PolarizedPair X Y T.unop LX LY)
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

namespace PolarizedIsomFunctor

theorem points {S : Scheme.{u}} (X Y T : Over S) (LX : InvertibleSheaf X.left)
    (LY : InvertibleSheaf Y.left) :
    (PolarizedIsomFunctor X Y LX LY).obj (op T) = ULift.{u + 1} (PolarizedPair X Y T LX LY) := by
  sorry

def forget {S : Scheme.{u}} (X Y : Over S) (LX : InvertibleSheaf X.left)
    (LY : InvertibleSheaf Y.left) : PolarizedIsomFunctor X Y LX LY ⟶ IsomFunctor X Y := by
  sorry

theorem pullback {S : Scheme.{u}} (X Y : Over S) (LX : InvertibleSheaf X.left)
    (LY : InvertibleSheaf Y.left) {T T' : Over S} (g : T' ⟶ T)
    (a : (PolarizedIsomFunctor X Y LX LY).obj (op T)) :
    (forget X Y LX LY).app (op T') ((PolarizedIsomFunctor X Y LX LY).map g.op a) =
      (IsomFunctor X Y).map g.op ((forget X Y LX LY).app (op T) a) := by
  sorry

theorem fiber {S : Scheme.{u}} (X Y T : Over S) (LX : InvertibleSheaf X.left)
    (LY : InvertibleSheaf Y.left) (e : baseChangeObject X T ≅ baseChangeObject Y T) :
    Nonempty ({a : PolarizedPair X Y T LX LY // a.schemeIso = e} ≃
      ((Imported.pullbackLine e.hom.left
        (Imported.pullbackLine (pullback.fst Y.hom T.hom) LY)).obj ≅
          (Imported.pullbackLine (pullback.fst X.hom T.hom) LX).obj)) := by
  sorry

-- PolarizedIsomFunctor.test_point
example (k : Type u) [Field k] :
    let X := Over.mk (𝟙 (Spec (.of k)))
    let L := InvertibleSheaf.trivial X.left
    Nonempty ((PolarizedIsomFunctor X X L L).obj (op X) ≃ kˣ) := by
  sorry

-- PolarizedIsomFunctor.test_disconnected
example (k : Type u) [Field k] :
    let X := Over.mk (Spec.map (CommRingCat.ofHom (algebraMap k (k × k))))
    let T := Over.mk (𝟙 (Spec (.of k)))
    let L := InvertibleSheaf.trivial X.left
    Nonempty ({a : (PolarizedIsomFunctor X X L L).obj (op T) //
      a.down.schemeIso = Iso.refl _} ≃ (kˣ × kˣ)) := by
  sorry

-- PolarizedIsomFunctor.test_empty
example {S : Scheme.{u}} (T : Over S) :
    let X := Over.mk (Scheme.emptyTo S)
    Nonempty (Unique ((PolarizedIsomFunctor X X (InvertibleSheaf.trivial _)
      (InvertibleSheaf.trivial _)).obj (op T))) := by
  sorry

-- PolarizedIsomFunctor.test_degree_mismatch
example (k : Type u) [Field k] :
    let X := Imported.projectiveLine k
    let L := Imported.projectiveO1 (Imported.freeFP (Spec (.of k)) 2)
    IsEmpty ((PolarizedIsomFunctor X X L (Imported.tensorLine L L)).obj
      (op (Over.mk (𝟙 (Spec (.of k)))))) := by
  sorry

end PolarizedIsomFunctor

theorem polarized_isom_representable {S : Scheme.{u}} [IsNoetherian S] (X Y : Over S)
    [Flat X.hom] [Flat Y.hom] [LocallyOfFinitePresentation X.hom]
    [LocallyOfFinitePresentation Y.hom]
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left)
    (hX : Imported.ProjectiveEmbedding X.hom LX)
    (hY : Imported.ProjectiveEmbedding Y.hom LY) :
    ∃ H : Over S, Nonempty (uliftYoneda.{u + 1}.obj H ≅ PolarizedIsomFunctor X Y LX LY) ∧
      IsSeparated H.hom ∧ LocallyOfFinitePresentation H.hom ∧ QuasiCompact H.hom := by
  sorry

private def SheafHomFunctor {X S : Scheme.{u}} (f : X ⟶ S)
    (E F : FinitelyPresentedSheaf X) : (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} (((Scheme.Modules.pullback (pullback.fst f T.unop.hom)).obj E.obj) ⟶
    ((Scheme.Modules.pullback (pullback.fst f T.unop.hom)).obj F.obj))
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

theorem sheaf_hom_affine {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S]
    [LocallyOfFinitePresentation f] (L : InvertibleSheaf X)
    (h : Imported.ProjectiveEmbedding f L) (E F : FinitelyPresentedSheaf X)
    (hF : IsFlatOver f F.obj) :
    ∃ H : Over S, Nonempty (uliftYoneda.{u + 1}.obj H ≅ SheafHomFunctor f E F) ∧
      IsAffineHom H.hom ∧ LocallyOfFinitePresentation H.hom := by
  sorry

/-- Nitsure 3.5: the zero condition is a closed subscheme on every test base. -/
theorem sheaf_hom_zero_locus {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S]
    [LocallyOfFinitePresentation f] (L : InvertibleSheaf X)
    (h : Imported.ProjectiveEmbedding f L) (E F : FinitelyPresentedSheaf X)
    (hF : IsFlatOver f F.obj) (a : E.obj ⟶ F.obj) :
    ∃ I : S.IdealSheafData, ∀ (T : Scheme.{u}) (g : T ⟶ S),
      (∃ g' : T ⟶ I.subscheme, g' ≫ I.subschemeι = g) ↔
        (Scheme.Modules.pullback (pullback.fst f g)).map a = 0 := by
  sorry

/-- The proper invertible-source case, using native internal Hom and the
proper flat-sheaf cohomology contract without a coherent-source resolution. -/
theorem line_isom_affine {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S]
    [IsProper f] [LocallyOfFinitePresentation f] (L M : InvertibleSheaf X)
    (hL : IsFlatOver f L.obj) (hM : IsFlatOver f M.obj) :
    ∃ H : Over S,
      Nonempty (uliftYoneda.{u + 1}.obj H ≅ SheafIsomFunctor f
        ⟨L.obj, by sorry⟩
        ⟨M.obj, by sorry⟩) ∧
      IsAffineHom H.hom ∧ LocallyOfFinitePresentation H.hom := by
  sorry

private def FixedIsomFunctor {S : Scheme.{u}} (X Y : Over S)
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left) (P : Polynomial ℚ) :
    (Over S)ᵒᵖ ⥤ Type (u + 1) where
  obj T := ULift.{u + 1} {e : baseChangeObject X T.unop ≅ baseChangeObject Y T.unop //
    Imported.IsGraphPolynomial X Y T.unop LX LY P e.hom}
  map := by sorry
  map_id := by sorry
  map_comp := by sorry

theorem isom_representable_fixed {S : Scheme.{u}} [IsNoetherian S] (X Y : Over S)
    [Flat X.hom] [Flat Y.hom] [LocallyOfFinitePresentation X.hom]
    [LocallyOfFinitePresentation Y.hom]
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left)
    (hX : Imported.ProjectiveEmbedding X.hom LX)
    (hY : Imported.ProjectiveEmbedding Y.hom LY) (P : Polynomial ℚ) :
    ∃ H : Over S, Nonempty (uliftYoneda.{u + 1}.obj H ≅ FixedIsomFunctor X Y LX LY P) ∧
      IsSeparated H.hom ∧ LocallyOfFinitePresentation H.hom ∧ QuasiCompact H.hom := by
  sorry

theorem polarized_forget_affine {S : Scheme.{u}} (X Y : Over S)
    (LX : InvertibleSheaf X.left) (LY : InvertibleSheaf Y.left)
    (H K : Over S) (eH : uliftYoneda.{u + 1}.obj H ≅ IsomFunctor X Y)
    (eK : uliftYoneda.{u + 1}.obj K ≅ PolarizedIsomFunctor X Y LX LY)
    [IsNoetherian S] [IsProper X.hom] [Flat X.hom] [Flat Y.hom]
    [LocallyOfFinitePresentation X.hom] [LocallyOfFinitePresentation Y.hom] :
    ∃ a : K ⟶ H, IsAffineHom a.left ∧ LocallyOfFinitePresentation a.left ∧
      (uliftYoneda.{u + 1}.map a) ≫ eH.hom =
        eK.hom ≫ PolarizedIsomFunctor.forget X Y LX LY := by
  sorry

namespace Imported

def projectiveSpace (S : Scheme.{u}) (n : ℕ) : Over S :=
  projectiveBundle (freeFP S (n + 1))

def fpPushforward {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f]
    [IsNoetherian X] [IsNoetherian Y] (F : FinitelyPresentedSheaf X) :
    FinitelyPresentedSheaf Y :=
  ⟨(Scheme.Modules.pushforward f).obj F.obj, by sorry⟩

def higherPushforward {X Y : Scheme.{u}} (f : X ⟶ Y) (F : X.Modules) (i : ℕ) :
    Y.Modules := by
  sorry

def twistFP {X : Scheme.{u}} (L : InvertibleSheaf X) (F : FinitelyPresentedSheaf X)
    (n : ℕ) : FinitelyPresentedSheaf X :=
  ⟨positiveTwist L.obj F.obj n, by sorry⟩

/-- The annihilator ideal supports this native finite-presentation sheaf. -/
def SupportedOn {X : Scheme.{u}} (F : FinitelyPresentedSheaf X) (I : X.IdealSheafData) : Prop :=
  (support F).support ≤ I.support

set_option backward.isDefEq.respectTransparency false in
/-- This is actual annihilation of each section module on affine opens. -/
def KilledBy {X : Scheme.{u}} (F : FinitelyPresentedSheaf X) (I : X.IdealSheafData) : Prop :=
  ∀ U : X.affineOpens, ∀ r ∈ I.ideal U, ∀ m : Γ(F.obj, U.1), r • m = 0

set_option backward.defeqAttrib.useBackward true in
set_option backward.isDefEq.respectTransparency false in
private noncomputable instance moduleStalk {X : Scheme.{u}} (F : X.Modules) (x : X) :
    Module (X.presheaf.stalk x)
      ↑(TopCat.Presheaf.stalk (C := Ab.{u}) (Scheme.Modules.presheaf F) x) := by
  change Module (X.presheaf.stalk x) ↑(TopCat.Presheaf.stalk F.val.presheaf x)
  infer_instance

private noncomputable instance residueAlgebra (X : Scheme.{u}) (x : X) :
    Algebra (X.presheaf.stalk x) (X.residueField x) :=
  (X.residue x).hom.toAlgebra

set_option backward.defeqAttrib.useBackward true in
set_option backward.isDefEq.respectTransparency false in
def GenericRankOne {X : Scheme.{u}} (F : FinitelyPresentedSheaf X) (I : X.IdealSheafData) : Prop :=
  SupportedOn F I ∧ ∀ η : X, IsGenericPoint η (I.support : Set X) →
    Nonempty ((TopCat.Presheaf.stalk (C := Ab.{u}) (Scheme.Modules.presheaf (X := X) F.obj) η) ≃ₗ[X.presheaf.stalk η] X.residueField η)

set_option backward.defeqAttrib.useBackward true in
set_option backward.isDefEq.respectTransparency false in
def GenericNonzero {X : Scheme.{u}} (F : FinitelyPresentedSheaf X) (I : X.IdealSheafData) : Prop :=
  SupportedOn F I ∧ ∀ η : X, IsGenericPoint η (I.support : Set X) →
    ∃ r : ℕ, 0 < r ∧ Nonempty ((TopCat.Presheaf.stalk (C := Ab.{u}) (Scheme.Modules.presheaf (X := X) F.obj) η) ≃ₗ[X.presheaf.stalk η]
      (Fin r → X.residueField η))

def fpKernel {X : Scheme.{u}} [IsNoetherian X] {F G : FinitelyPresentedSheaf X}
    (a : F.obj ⟶ G.obj) : FinitelyPresentedSheaf X :=
  ⟨kernel a, by sorry⟩

def fpCokernel {X : Scheme.{u}} [IsNoetherian X] {F G : FinitelyPresentedSheaf X}
    (a : F.obj ⟶ G.obj) : FinitelyPresentedSheaf X :=
  ⟨cokernel a, by sorry⟩

end Imported

structure ChowModification {X S : Scheme.{u}} (f : X ⟶ S) where
  source : Scheme.{u}
  map : source ⟶ X
  proper : IsProper map
  surjective : Surjective map
  projective : Imported.IsProjective map
  isoOpen : X.Opens
  dense : Dense (isoOpen : Set X)
  isoOverOpen : IsIso (pullback.snd map (X.ofRestrict (TopologicalSpace.Opens.isOpenEmbedding isoOpen)))
  dimension : ℕ
  embedding : source ⟶ (Imported.projectiveSpace S dimension).left
  immersion : Imported.IsLocallyClosedImmersion embedding
  embeddingOver : embedding ≫ (Imported.projectiveSpace S dimension).hom = map ≫ f

theorem chow_modification_exists {X S : Scheme.{u}} (f : X ⟶ S) [IsNoetherian S]
    [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] : Nonempty (ChowModification f) := by
  sorry

namespace ChowModification

theorem cover {X S : Scheme.{u}} {f : X ⟶ S} (d : ChowModification f) :
    IsProper d.map ∧ Surjective d.map ∧ Imported.IsProjective d.map ∧
      Imported.IsLocallyClosedImmersion d.embedding := by
  sorry

theorem iso_open {X S : Scheme.{u}} {f : X ⟶ S} (d : ChowModification f) :
    Dense (d.isoOpen : Set X) ∧ IsIso (pullback.snd d.map (X.ofRestrict (TopologicalSpace.Opens.isOpenEmbedding d.isoOpen))) := by
  sorry

theorem proper_source {X S : Scheme.{u}} {f : X ⟶ S} [IsProper f]
    (d : ChowModification f) : Imported.IsProjective (d.map ≫ f) := by
  sorry

theorem baseChange {X S T : Scheme.{u}} {f : X ⟶ S} (d : ChowModification f) (g : T ⟶ S) :
    let a := pullFamilyMap (d.map ≫ f) f d.map rfl g
    IsProper a ∧ Surjective a ∧ Imported.IsProjective a ∧
      IsIso (pullback.snd a ((pullback f g).ofRestrict
        (TopologicalSpace.Opens.isOpenEmbedding ((pullback.fst f g) ⁻¹ᵁ d.isoOpen)))) := by
  sorry

-- ChowModification.test_projective
example {X S : Scheme.{u}} (f : X ⟶ S) (n : ℕ)
    (j : X ⟶ (Imported.projectiveSpace S n).left) [IsClosedImmersion j]
    (hj : j ≫ (Imported.projectiveSpace S n).hom = f) :
    ∃ d : ChowModification f, ∃ e : d.source ≅ X, e.hom = d.map ∧ d.isoOpen = ⊤ := by
  sorry

-- ChowModification.test_empty
example (S : Scheme.{u}) :
    ∃ d : ChowModification (Scheme.emptyTo S), IsEmpty d.source := by
  sorry

-- ChowModification.test_disjoint
example (k : Type u) [Field k] :
    let X := Spec (.of (k × k))
    let f := Spec.map (CommRingCat.ofHom (algebraMap k (k × k)))
    ∀ d : ChowModification f, ¬ ∃ e : d.source ≅ Spec (.of k),
      e.hom ≫ Spec.map (CommRingCat.ofHom (RingHom.fst k k)) = d.map := by
  sorry

-- ChowModification.test_density_basechange
example (X : Scheme.{u}) (d : ChowModification (𝟙 X)) (x : X)
    (hx : x ∉ d.isoOpen) :
    let g := X.fromSpecResidueField x
    let a := pullFamilyMap (d.map ≫ 𝟙 X) (𝟙 X) d.map rfl g
    Surjective a ∧ ((pullback.fst (𝟙 X) g) ⁻¹ᵁ d.isoOpen) = ⊥ := by
  sorry

end ChowModification

private def ExactClass (X : Scheme.{u}) (K : FinitelyPresentedSheaf X → Prop) : Prop :=
  (∀ F, IsZero F.obj → K F) ∧
  (∀ F G, Nonempty (F.obj ≅ G.obj) → (K F ↔ K G)) ∧
  (∀ (F G H : FinitelyPresentedSheaf X) (a : F.obj ⟶ G.obj) (b : G.obj ⟶ H.obj)
    (hab : a ≫ b = 0), (ShortComplex.mk a b hab).ShortExact →
      (K F ∧ K G → K H) ∧ (K F ∧ K H → K G) ∧ (K G ∧ K H → K F))

private def SummandClosed (X : Scheme.{u}) (K : FinitelyPresentedSheaf X → Prop) : Prop :=
  ∀ F G, Nonempty (Retract F.obj G.obj) → K G → K F

theorem coherent_support_filtration {X : Scheme.{u}} [IsNoetherian X]
    (F : FinitelyPresentedSheaf X) (I : X.IdealSheafData)
    (h : Imported.SupportedOn F I) : ∃ n : ℕ, Imported.KilledBy F (I ^ n) := by
  sorry

set_option backward.defeqAttrib.useBackward true in
set_option backward.isDefEq.respectTransparency false in
/-- The integral-support finite filtration, as actual native subobjects. -/
theorem coherent_integral_filtration {X : Scheme.{u}} [IsNoetherian X]
    (F : FinitelyPresentedSheaf X) :
    ∃ n : ℕ, ∃ c : Fin (n + 1) → Subobject (C := X.Modules) F.obj,
      c 0 = ⊥ ∧ c (Fin.last n) = ⊤ ∧ Monotone c ∧
      ∀ j : Fin n, ∃ h : c j.castSucc ≤ c j.succ,
        ∃ (I : X.IdealSheafData) (G : FinitelyPresentedSheaf I.subscheme),
          IsIntegral I.subscheme ∧
          Nonempty (cokernel (Subobject.ofLE (c j.castSucc) (c j.succ) h) ≅
            (Scheme.Modules.pushforward I.subschemeι).obj G.obj) ∧
          ∀ η : I.subscheme, IsGenericPoint η (Set.univ : Set I.subscheme) →
            Nonempty ((TopCat.Presheaf.stalk (C := Ab.{u}) (Scheme.Modules.presheaf (X := I.subscheme) G.obj) η) ≃ₗ[I.subscheme.presheaf.stalk η]
              I.subscheme.residueField η) := by
  sorry

theorem coherent_devissage {X : Scheme.{u}} [IsNoetherian X]
    (K : FinitelyPresentedSheaf X → Prop) (hK : ExactClass X K)
    (witness : ∀ I : X.IdealSheafData, IsIntegral I.subscheme →
      ∃ F : FinitelyPresentedSheaf X, K F ∧ Imported.GenericRankOne F I) :
    ∀ F : FinitelyPresentedSheaf X, K F := by
  sorry

theorem coherent_devissage_summands {X : Scheme.{u}} [IsNoetherian X]
    (K : FinitelyPresentedSheaf X → Prop) (hK : ExactClass X K) (hS : SummandClosed X K)
    (witness : ∀ I : X.IdealSheafData, IsIntegral I.subscheme →
      ∃ F : FinitelyPresentedSheaf X, K F ∧ Imported.GenericNonzero F I) :
    ∀ F : FinitelyPresentedSheaf X, K F := by
  sorry

theorem generic_projective_test_sheaves (k : Type u) [Field k]
    (X : Over (Spec (.of k))) [IsProper X.hom] [IsNoetherian X.left]
    (I : X.left.IdealSheafData) [IsIntegral I.subscheme] :
    ∃ (Y : Scheme.{u}) (g : Y ⟶ I.subscheme), ∃ hg : IsProper g,
      ∃ hY : IsNoetherian Y, ∃ hZ : IsNoetherian I.subscheme,
        ∃ (L : InvertibleSheaf Y) (hL : Imported.ProjectiveEmbedding (g ≫ I.subschemeι ≫ X.hom) L)
          (n : ℕ),
          (∀ q : ℕ, 0 < q → IsZero (Imported.higherPushforward g
            (Imported.twistFP L (Imported.unitFP Y) n).obj q)) ∧
          Imported.GenericRankOne
            (Imported.fpPushforward I.subschemeι
              (@Imported.fpPushforward Y I.subscheme g hg hY hZ
                (Imported.twistFP L (Imported.unitFP Y) n))) I := by
  sorry

theorem chow_unit_support {X Y : Scheme.{u}} [IsNoetherian X] [IsNoetherian Y]
    (π : Y ⟶ X) [IsProper π] (U : X.Opens)
    (hU : IsIso (pullback.snd π (X.ofRestrict (TopologicalSpace.Opens.isOpenEmbedding U)))) (F : FinitelyPresentedSheaf X)
    (D : X.IdealSheafData) (hD : (D.support : Set X) = (U : Set X)ᶜ) :
    let G := Imported.fpPushforward π (Imported.pullbackFP π F)
    let a : F.obj ⟶ G.obj := (Scheme.Modules.pullbackPushforwardAdjunction π).unit.app F.obj
    Imported.SupportedOn (Imported.fpKernel a) D ∧
      Imported.SupportedOn (Imported.fpCokernel a) D ∧
      (∃ n : ℕ, Imported.KilledBy (Imported.fpKernel a) (D ^ n)) ∧
      (∃ n : ℕ, Imported.KilledBy (Imported.fpCokernel a) (D ^ n)) := by
  sorry

end TauCeti.AlgebraicGeometry.Moduli
