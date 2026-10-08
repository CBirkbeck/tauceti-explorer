import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.Trace.Basic
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.Symmetric
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Algebra.Lie.Basic
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.Data.Nat.ModEq
import Mathlib.Geometry.Manifold.Complex
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.Topology.Connected.Clopen
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Weight
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Basic
import TauCeti.Algebra.Coalgebra.Comodule.Finite.TensorProduct
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Dual
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Coordinate.HopfAlgebra
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic
import TauCeti.Geometry.Hodge.Polarization
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.Geometry.Manifold.VectorBundle.Basic
import Mathlib.Analysis.Complex.Exponential
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing
import Mathlib.Topology.Algebra.ProperAction.Basic
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.Geometry.Hodge.Decomposition
import TauCeti.Geometry.Hodge.WeilOperator
import TauCeti.Geometry.Hodge.TensorProduct
import TauCeti.Geometry.Hodge.Dual
import TauCeti.Geometry.Hodge.Tate.Twist

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. These are unproved interfaces, not implementation claims.

The complete hypotheses are in the packet. At the pinned libraries there is no common
interface for an algebraic S-map, its rational group, real orbit, quotient charts and
connected adjoint datum. The following sections explicitly omit unavailable conditions,
using actual linear maps, comodules, local coefficient systems, schemes and group maps.
They do not replace those conditions with arbitrary proposition fields.

Supplier sketches in namespace `Supplier` expose the requested algebraic/analytic data
using pinned carriers. They belong to the owners named in the packet, not to new local
roadmap targets. Missing comparison hypotheses are identified next to each declaration.
The local targets retain their stated conclusions: lawful real comodules and a categorical
equivalence; complex homogeneous manifolds and bounded symmetric domains; a glued flat
holomorphic bundle with a horizontal filtration; rational torus immersions and compatible
connected adjoint data; and the actual cocharacters, domains and Cartan group of the examples.
No statement claims implementation or supplier closure.

REV-ShimuraData~2 records nine residual named prototypes in its review report:
hilbertDeterminantMap, siegelRootConvention, siegelWeylPermutations,
kostantSequenceGeometry, gsp4CgRoots, gsp4Kostant, gsp4Unitary,
gsp4PilloniConvention and iwahoriNeat. Their current auxiliary calculations do
not state the full conclusions assigned to those names in the packet. They must
be replaced during revision; omitted unavailable hypotheses are a separate matter.

Deligne 1979: type (p,q) means character (-p,-q), μ(z)=h_C(z,1). The diagonal
restriction acts by t^(-n); inverse diagonal weight acts by t^n. h(i) is inverse to
the pinned Weil operator. For the limit t→0 convention, filtration stabilizer is P(μ⁻¹).
-/

noncomputable section
open scoped TensorProduct
open CategoryTheory
namespace TauCeti.Shimura

/- D0: supplied identifications, without reconstructing restriction of scalars. -/
theorem delignePointsTopology {S : Type*} [Group S] [TopologicalSpace S]
    [IsTopologicalGroup S] (e : S ≃ₜ* ℂˣ) : Continuous e ∧ Continuous e.symm := by sorry

theorem deligneLiePoints (x : ℂ) :
    (x * star (1 : ℂ) + (1 : ℂ) * star x).re = 2 * x.re := by sorry

theorem hilbertRealPoints {ι A : Type*} [Fintype ι] [Group A]
    (e : A ≃* (ι → Matrix.GeneralLinearGroup (Fin 2) ℝ)) :
    Function.Bijective e := by sorry

theorem hilbertAdelicPoints {A B : Type*} [Group A] [Group B]
    (e : A ≃* B) : e.toMonoidHom.ker = ⊥ := by sorry

theorem datumMapPoints {A B C D : Type*} [Group A] [Group B] [Group C] [Group D]
    (f : A →* B) (g : C →* D) (e : A ≃* C) (e' : B ≃* D)
    (h : ∀ a, e' (f a) = g (e a)) : e'.toMonoidHom.comp f = g.comp e.toMonoidHom := by sorry

/- D1: no Deligne-torus construction here; RG2.0a supplies it. -/
-- The Hopf splitting π is supplied by RG2.0a; this is the comodule dictionary it feeds.
theorem deligneTorus {W C : Type*} [AddCommGroup W] [Module ℂ W]
    [AddCommGroup C] [Module ℂ C] [Coalgebra ℂ C] [Comodule ℂ C W]
    (π : C →ₗc[ℂ] MonoidAlgebra ℂ (Multiplicative (ℤ×ℤ))) :
    DirectSum.IsInternal (DiagonalizableGroup.weightSpace W π) := by sorry

private def splitCharacter (a b : ℤ) (x : ℂˣ × ℂˣ) : ℂˣ := x.1^a*x.2^b
theorem deligneTorusPoints (z : ℂˣ) (p q : ℤ) :
    splitCharacter (-p) (-q) (z,star z) = z^(-p)*star z^(-q) ∧
    splitCharacter (-p) (-q) (z,1) = z^(-p) := by sorry

theorem weightNormCocharacters (t : ℝˣ) (p q : ℤ) :
    t ^ (-p) * t ^ (-q) = t ^ (-(p+q)) := by sorry

section Grading
variable (V : Type*) [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]

/-- The grading is real; pure objects use the pinned canonical conjugation. -/
structure GradedRealHodge (V : Type*) [AddCommGroup V] [Module ℝ V]
    [Module.Finite ℝ V] where
  weight : ℤ → Submodule ℝ V
  internal : DirectSum.IsInternal weight
  finiteSupport : {n | weight n ≠ ⊥}.Finite
  pure : ∀ n, Hodge.HodgeStructureOn (ℂ ⊗[ℝ] weight n)
    (Hodge.complexificationConjugation (weight n)) n

def gradedRealHodge := GradedRealHodge V

def gradedMk (weight : ℤ → Submodule ℝ V)
    (internal : DirectSum.IsInternal weight)
    (finiteSupport : {n | weight n ≠ ⊥}.Finite)
    (pure : ∀ n, Hodge.HodgeStructureOn (ℂ ⊗[ℝ] weight n)
      (Hodge.complexificationConjugation (weight n)) n) : gradedRealHodge V :=
  ⟨weight, internal, finiteSupport, pure⟩

lemma gradedExt (H K : gradedRealHodge V) (hweight : H.weight = K.weight)
    (hpure : ∀ n, HEq (H.pure n) (K.pure n)) : H = K := by sorry

lemma gradedWeight (H : gradedRealHodge V) (m n : ℤ) (h : m ≠ n) :
    Disjoint (H.weight m) (H.weight n) := by sorry
lemma gradedPure (H : gradedRealHodge V) (n : ℤ) :
    ∀ p, IsCompl ((H.pure n).F p)
      (((H.pure n).F (n+1-p)).map
        (Hodge.complexificationConjugation (H.weight n)).toEquiv.toLinearMap) := by sorry
lemma gradedSupport (H : gradedRealHodge V) :
    {n | H.weight n ≠ ⊥}.Finite ∧ (⨆ n, H.weight n) = ⊤ := by sorry
end Grading

def tateGrading (m : ℤ) : gradedRealHodge ℝ := sorry

def twoWeightGrading : gradedRealHodge (ℝ × ℝ) := sorry
-- TauCeti.Shimura.tests.gradedZero
example (H : gradedRealHodge (Fin 0 → ℝ)) (n : ℤ) : H.weight n = ⊥ := by sorry
-- TauCeti.Shimura.tests.gradedTwoWeights
example : Module.finrank ℝ (twoWeightGrading.weight 0) = 1 ∧
    Module.finrank ℝ (twoWeightGrading.weight (-2)) = 1 := by sorry
-- TauCeti.Shimura.tests.gradedTate
example : (tateGrading 1).weight (-2) = ⊤ := by sorry

/- R1/RG2.0a supplier signatures. `deligneCoordinate` is their descended real Hopf
algebra. It is not constructed again by D1. `split` includes scalar extension and the
specified Hopf splitting, with the Galois action conjugating coefficients and swapping
characters. Its carrier comparison and descent naturality are the explicit R1 leaf. -/
namespace Supplier
 def deligneCoordinate : CommHopfAlgCat ℝ := sorry
 abbrev SRep := FGComoduleCat ℝ deligneCoordinate
 abbrev SplitCoordinate := MonoidAlgebra ℂ (Multiplicative (ℤ × ℤ))
 def split (M : SRep) : FGComoduleCat ℂ SplitCoordinate := sorry
 def splitCarrier (M : SRep) : (ℂ ⊗[ℝ] M) ≃ₗ[ℂ] split M := sorry
 def splitTensorConjugation {W : Type*} [AddCommGroup W] [Module ℂ W]
     (ω : Hodge.Conjugation W) :
     (W ⊗[ℂ] SplitCoordinate) →ₗ[ℝ] (W ⊗[ℂ] SplitCoordinate) := sorry
 lemma splitTensorConjugation_tmul {W : Type*} [AddCommGroup W] [Module ℂ W]
     (ω : Hodge.Conjugation W) (v : W) (a b : ℤ) (c : ℂ) :
     splitTensorConjugation ω (v ⊗ₜ[ℂ] MonoidAlgebra.single (Multiplicative.ofAdd (a,b)) c) =
       ω v ⊗ₜ[ℂ] MonoidAlgebra.single (Multiplicative.ofAdd (b,a)) (star c) := by sorry
 def trivialRep : SRep := sorry
 def normRep (m : ℤ) : SRep := sorry
 -- Underlying real space C; h(z) acts by multiplication by z.
 def standardRep : SRep := sorry
 abbrev repTensor (M N : SRep) : SRep := FGComoduleCat.tensor ℝ deligneCoordinate M N
 abbrev repDual (M : SRep) : SRep := FGComoduleCat.dual ℝ deligneCoordinate M
 def repSum (M N : SRep) : SRep := sorry
end Supplier

section SplitRepresentation
variable {W C : Type*} [AddCommGroup W] [Module ℂ W] [Module.Finite ℂ W]
    [CommRing C] [Algebra ℂ C] [Coalgebra ℂ C] [Comodule ℂ C W]
    (π : C →ₗc[ℂ] Supplier.SplitCoordinate)
def hodgePiece (p q : ℤ) : Submodule ℂ W :=
  DiagonalizableGroup.weightSpace W π (Multiplicative.ofAdd (-p,-q))
lemma hodgePieceAction (p q : ℤ) (v : W) : v ∈ hodgePiece π p q ↔
    TensorProduct.map LinearMap.id π.toLinearMap (Comodule.coact (R := ℂ) (C := C) (M := W) v) =
      v ⊗ₜ[ℂ] MonoidAlgebra.single (Multiplicative.ofAdd (-p,-q)) 1 := by sorry
/- The hypothesis is the Galois equation on the split coaction, not the desired
weight-space equality. R1 supplies it for the complexification of a real comodule. -/
lemma conjHodgePiece (ω : Hodge.Conjugation W)
    (hc : ∀ v, Supplier.splitTensorConjugation ω
       (TensorProduct.map LinearMap.id π.toLinearMap (Comodule.coact v)) =
       TensorProduct.map LinearMap.id π.toLinearMap (Comodule.coact (ω v)))
    (p q : ℤ) : (hodgePiece π p q).map ω.toEquiv.toLinearMap = hodgePiece π q p := by sorry
lemma hodgePieceInternal :
    DirectSum.IsInternal (fun x : ℤ × ℤ => hodgePiece π x.1 x.2) ∧
    {x : ℤ × ℤ | hodgePiece π x.1 x.2 ≠ ⊥}.Finite := by sorry
lemma conjugationPieces (ω : Hodge.Conjugation W)
    (hc : ∀ v, Supplier.splitTensorConjugation ω
       (TensorProduct.map LinearMap.id π.toLinearMap (Comodule.coact v)) =
       TensorProduct.map LinearMap.id π.toLinearMap (Comodule.coact (ω v)))
    (p q : ℤ) : (hodgePiece π p q).map ω.toEquiv.toLinearMap = hodgePiece π q p := by sorry
end SplitRepresentation

def representationPiece (M : Supplier.SRep) (p q : ℤ) : Submodule ℂ (Supplier.split M) :=
  hodgePiece (CoalgHom.id ℂ Supplier.SplitCoordinate) p q
-- TauCeti.Shimura.tests.pieceTrivial
example : representationPiece Supplier.trivialRep 0 0 = ⊤ ∧
    representationPiece Supplier.trivialRep 1 0 = ⊥ := by sorry
-- TauCeti.Shimura.tests.pieceNorm
example : representationPiece (Supplier.normRep 1) (-1) (-1) = ⊤ ∧
    representationPiece (Supplier.normRep 1) 1 1 = ⊥ := by sorry
-- TauCeti.Shimura.tests.pieceStandard
example : Module.finrank ℂ (representationPiece Supplier.standardRep (-1) 0) = 1 ∧
    Module.finrank ℂ (representationPiece Supplier.standardRep 0 (-1)) = 1 ∧
    representationPiece Supplier.standardRep 0 0 = ⊥ := by sorry

section PureComparison
variable {W : Type*} [AddCommGroup W] [Module ℂ W]
    (ω : Hodge.Conjugation W) (n : ℤ) (H : ℤ → Submodule ℂ W)
    (hH : Hodge.IsHodgeDecomposition ω n H)
def hodgeOfRepresentation : Hodge.HodgeStructureOn W ω n := Hodge.HodgeStructureOn.ofDecomposition hH
lemma hodgeOfRepresentationPiece (p : ℤ) : (hodgeOfRepresentation ω n H hH).piece p = H p := by sorry
lemma hodgeOfRepresentationFiltration (p : ℤ) :
    (hodgeOfRepresentation ω n H hH).F p = ⨆ q, ⨆ (_ : p ≤ q), H q := by sorry
lemma hodgeOfRepresentationOpposed (p : ℤ) : IsCompl
    ((hodgeOfRepresentation ω n H hH).F p)
    (((hodgeOfRepresentation ω n H hH).F (n+1-p)).map ω.toEquiv.toLinearMap) := by sorry
end PureComparison
-- TauCeti.Shimura.tests.pureTateFiltration
example : (Hodge.tate 1).F (-1) = ⊤ ∧ (Hodge.tate 1).F 0 = ⊥ := by sorry
-- TauCeti.Shimura.tests.pureZero
example (ω : Hodge.Conjugation (Fin 0 → ℂ)) (n p : ℤ)
    (H : Hodge.HodgeStructureOn (Fin 0 → ℂ) ω n) : H.F p = ⊥ := by sorry
-- TauCeti.Shimura.tests.pureElliptic
example {W : Type*} [AddCommGroup W] [Module ℂ W] (ω : Hodge.Conjugation W)
    (H : Hodge.HodgeStructureOn W ω (-1)) (h : H.F (-1) = ⊤ ∧ H.F 1 = ⊥) :
    H.piece 0 = H.F 0 := by sorry

def gradedPiece {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (H : gradedRealHodge V) (p q : ℤ) : Submodule ℂ (ℂ ⊗[ℝ] V) :=
  ((H.pure (p+q)).piece p).map ((H.weight (p+q)).subtype.baseChange ℂ)

/-- Unlike a bare linear map this result has the actual counit and coassociativity laws.
R1's effective descent supplies its real coaction; the split formula determines it uniquely. -/
def representationOfHodge {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (H : gradedRealHodge V) : Comodule ℝ Supplier.deligneCoordinate V := sorry

def gradedRepresentation {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (H : gradedRealHodge V) : Supplier.SRep :=
  letI := representationOfHodge H
  FGComoduleCat.of (R := ℝ) (C := Supplier.deligneCoordinate) V
lemma representationOfHodgePiece {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (H : gradedRealHodge V) (p q : ℤ) :
    (representationPiece (gradedRepresentation H) p q).comap
      (Supplier.splitCarrier (gradedRepresentation H)).toLinearMap = gradedPiece H p q := by sorry
lemma representationOfHodgeReal {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (H : gradedRealHodge V) (p q : ℤ) :
    (gradedPiece H p q).map (Hodge.complexificationConjugation V).toEquiv.toLinearMap =
      gradedPiece H q p := by sorry
lemma representationOfHodgeCounit {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (H : gradedRealHodge V) :
    Coalgebra.counit.lTensor V ∘ₗ (representationOfHodge H).coact =
      (TensorProduct.mk ℝ V ℝ).flip 1 := by sorry

def gradedOfRepresentation (M : Supplier.SRep) : gradedRealHodge M := sorry
lemma representationOfHodgePure {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (H : gradedRealHodge V) : gradedOfRepresentation (gradedRepresentation H) = H := by sorry
lemma comparisonRoundtrip (M : Supplier.SRep) :
    (representationOfHodge (gradedOfRepresentation M)).coact =
      Comodule.coact (R := ℝ) (C := Supplier.deligneCoordinate) (M := M) := by sorry

/-- Objects and morphisms of the new graded category, built on the existing pure carriers. -/
structure GradedHodgeCat where
  V : ModuleCat ℝ
  finite : Module.Finite ℝ V
  H : @GradedRealHodge V inferInstance inferInstance finite
attribute [instance] GradedHodgeCat.finite
structure GradedHodgeHom (H K : GradedHodgeCat) where
  linear : H.V →ₗ[ℝ] K.V
  preserves : ∀ p q, gradedPiece H.H p q ≤ (gradedPiece K.H p q).comap (linear.baseChange ℂ)
instance gradedHodgeCategory : Category GradedHodgeCat where
  Hom := GradedHodgeHom
  id H := ⟨LinearMap.id, by sorry⟩
  comp f g := ⟨g.linear.comp f.linear, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

def representationHodgeFunctor : Supplier.SRep ⥤ GradedHodgeCat where
  obj M := ⟨ModuleCat.of ℝ M, inferInstance, gradedOfRepresentation M⟩
  map f := ⟨f.hom.toLinearMap, by sorry⟩
  map_id := by sorry
  map_comp := by sorry
def hodgeRepresentationFunctor : GradedHodgeCat ⥤ Supplier.SRep where
  obj H := gradedRepresentation H.H
  map f := FGComoduleCat.ofHom ⟨f.linear, by sorry⟩
  map_id := by sorry
  map_comp := by sorry
def representationHodgeEquivalence : Supplier.SRep ≌ GradedHodgeCat where
  functor := representationHodgeFunctor
  inverse := hodgeRepresentationFunctor
  unitIso := sorry
  counitIso := sorry
  functor_unitIso_comp := by sorry
lemma comparisonMorphism (M N : Supplier.SRep) (f : M ⟶ N) :
    (representationHodgeEquivalence.functor.map f).linear =
      ((forget₂ Supplier.SRep (SemimoduleCat ℝ)).map f).hom := by sorry
lemma comparisonNaturality (M N : Supplier.SRep) (f : M ⟶ N) :
    representationHodgeEquivalence.unitIso.hom.app M ≫
      representationHodgeEquivalence.inverse.map (representationHodgeEquivalence.functor.map f) =
      f ≫ representationHodgeEquivalence.unitIso.hom.app N := by sorry

def gradedTensor (H K : GradedHodgeCat) : GradedHodgeCat := sorry
def gradedDual (H : GradedHodgeCat) : GradedHodgeCat := sorry
def gradedTateTwist (H : GradedHodgeCat) (m : ℤ) : GradedHodgeCat := sorry
lemma tensorComparison (M N : Supplier.SRep) : Nonempty
    (representationHodgeEquivalence.functor.obj (Supplier.repTensor M N) ≅
      gradedTensor (representationHodgeEquivalence.functor.obj M) (representationHodgeEquivalence.functor.obj N)) := by sorry
lemma dualComparison (M : Supplier.SRep) : Nonempty
    (representationHodgeEquivalence.functor.obj (Supplier.repDual M) ≅
      gradedDual (representationHodgeEquivalence.functor.obj M)) := by sorry
lemma tateComparison (M : Supplier.SRep) (m : ℤ) : Nonempty
    (representationHodgeEquivalence.functor.obj (Supplier.repTensor M (Supplier.normRep m)) ≅
      gradedTateTwist (representationHodgeEquivalence.functor.obj M) m) := by sorry
-- TauCeti.Shimura.tests.inverseTrivial
example : representationPiece (gradedRepresentation (tateGrading 0)) 0 0 = ⊤ := by sorry
-- TauCeti.Shimura.tests.inverseTate
example : representationPiece (gradedRepresentation (tateGrading 1)) (-1) (-1) = ⊤ := by sorry
-- TauCeti.Shimura.tests.inverseTwoWeights
example : Module.finrank ℂ (representationPiece (gradedRepresentation twoWeightGrading) 0 0) = 1 ∧
    Module.finrank ℂ (representationPiece (gradedRepresentation twoWeightGrading) (-1) (-1)) = 1 := by sorry

lemma weilOperatorSign {W : Type*} [AddCommGroup W] [Module ℂ W] {ω : Hodge.Conjugation W}
    {n : ℤ} (H : Hodge.HodgeStructureOn W ω n) (hI : W →ₗ[ℂ] W)
    (hh : ∀ p v, v ∈ H.piece p → hI v = Complex.I ^ (n-2*p) • v) :
    hI.comp H.weilOperator = LinearMap.id := by sorry

namespace Supplier
 abbrev RealSMap (O : CommHopfAlgCat ℚ) :=
   CommHopfAlgCat.baseChange (K := ℝ) O ⟶ deligneCoordinate
 def gmCoordinate (k : Type*) [Field k] : CommHopfAlgCat k := sorry
 def inverseDiagonal : deligneCoordinate ⟶ gmCoordinate ℝ := sorry
 def weightMap {O : CommHopfAlgCat ℚ} (h : RealSMap O) :
     CommHopfAlgCat.baseChange (K := ℝ) O ⟶ gmCoordinate ℝ := sorry
 abbrev GL (n : ℕ) := GeneralLinear.coordinateHopfAlgebra ℚ n
 def realCoordinates (n : ℕ) : (ℝ ⊗[ℚ] (Fin n → ℚ)) ≃ₗ[ℝ] (Fin n → ℝ) := sorry
 def rationalWeightPiece {n : ℕ} (h : RealSMap (GL n)) (m : ℤ) :
     Submodule ℝ (Fin n → ℝ) := sorry
 def ellipticHodgeMap (τ : ℂ) (hτ : 0 < τ.im) : RealSMap (GL 2) := sorry
 def trivialHodgeMap : RealSMap (GL 1) := sorry
 def tateHodgeMap (m : ℤ) : RealSMap (GL 1) := sorry
 def ellipticHomology (τ : ℂ) (hτ : 0 < τ.im) : ModuleCat ℚ := sorry
 def ellipticHomologyHodge (τ : ℂ) (hτ : 0 < τ.im) : Supplier.SRep := sorry
 def mapRepresentation {n : ℕ} (h : RealSMap (GL n)) : Supplier.SRep := sorry
end Supplier
-- Here real-to-rational descent is the conclusion. Scalar extension of the cocharacter
-- and of each rational subspace is retained; no coverage hypothesis replaces the iff.
lemma rationalWeightCriterion {n : ℕ} (h : Supplier.RealSMap (Supplier.GL n)) :
    (∃ w : Supplier.GL n ⟶ Supplier.gmCoordinate ℚ,
       CommHopfAlgCat.baseChangeMap (K := ℝ) w = Supplier.weightMap h) ↔
    ∃ W : ℤ → Submodule ℚ (Fin n → ℚ), DirectSum.IsInternal W ∧
      ∀ m, ((W m).baseChange ℝ).map (Supplier.realCoordinates n).toLinearMap = Supplier.rationalWeightPiece h m := by sorry
lemma testObjects : (Hodge.tate 0).piece 0 = ⊤ := by sorry
lemma tateTestObject : (Hodge.tate 1).piece (-1) = ⊤ := by sorry
-- The geometric comparison uses H₁(C/(Z+τZ),Q), supplied by H0. No matrix action is
-- passed off as that homology object. The result is an isomorphism of S-comodules.
lemma ellipticHomologyObject (τ : ℂ) (hτ : 0 < τ.im) : Nonempty
    (Supplier.ellipticHomologyHodge τ hτ ≅ Supplier.mapRepresentation (Supplier.ellipticHodgeMap τ hτ)) := by sorry
private def ellipticMu (z : ℂ) : Matrix (Fin 2) (Fin 2) ℂ := Matrix.diagonal ![z,1]
lemma adjointGl2Object (z : ℂ) (hz : z ≠ 0) :
    ellipticMu z * !![0,1;0,0] * ellipticMu z⁻¹ = z • !![0,1;0,0] ∧
    ellipticMu z * !![0,0;1,0] * ellipticMu z⁻¹ = z⁻¹ • !![0,0;1,0] := by sorry

/- The Hopf ideal is the ideal of the rational algebraic subgroup, with reverse subgroup
order. Its quotient is the coordinate algebra of MT. Hopf ideal suprema already exist;
R0/R3 still owe finite-type subgroup representability and identification with MT(V). -/
def mumfordTateGroup (O : CommHopfAlgCat ℚ) (h : Supplier.RealSMap O) : HopfIdeal ℚ O :=
  sSup {I | ∀ a ∈ I, h.hom (1 ⊗ₜ[ℚ] a) = 0}
lemma mumfordTateMinimal (O : CommHopfAlgCat ℚ) (h : Supplier.RealSMap O)
    (I : HopfIdeal ℚ O) (hI : ∀ a ∈ I, h.hom (1 ⊗ₜ[ℚ] a) = 0) :
    I ≤ mumfordTateGroup O h := by sorry
lemma mumfordTateWeight (O : CommHopfAlgCat ℚ) (h : Supplier.RealSMap O) :
    ∀ a ∈ mumfordTateGroup O h, (Supplier.weightMap h).hom (1 ⊗ₜ[ℚ] a) = 0 := by sorry
lemma mumfordTateIsomorphism (O P : CommHopfAlgCat ℚ) (e : O ≅ P) (h : Supplier.RealSMap P)
    (a : O) : a ∈ mumfordTateGroup O (CommHopfAlgCat.baseChangeMap (K := ℝ) e.hom ≫ h) ↔
      e.hom a ∈ mumfordTateGroup P h := by sorry
namespace Supplier
 def mtCoordinate (O : CommHopfAlgCat ℚ) [Algebra.FiniteType ℚ O] (h : RealSMap O) : FiniteTypeCommHopfAlgCat ℚ := sorry
 def identitySubgroupIdeal (O : CommHopfAlgCat ℚ) : HopfIdeal ℚ O := sorry
 def cmEllipticIdeal : HopfIdeal ℚ (GL 2) := sorry
end Supplier
-- TauCeti.Shimura.tests.mtTrivial
example : mumfordTateGroup (Supplier.GL 1) Supplier.trivialHodgeMap =
    Supplier.identitySubgroupIdeal (Supplier.GL 1) := by sorry
-- TauCeti.Shimura.tests.mtTate
example : mumfordTateGroup (Supplier.GL 1) (Supplier.tateHodgeMap 1) = ⊥ := by sorry
-- TauCeti.Shimura.tests.mtCmElliptic
example : mumfordTateGroup (Supplier.GL 2) (Supplier.ellipticHodgeMap Complex.I (by sorry)) =
    Supplier.cmEllipticIdeal ∧ Supplier.cmEllipticIdeal ≠ ⊥ := by sorry
lemma mumfordTateConnected (O : CommHopfAlgCat ℚ) [Algebra.FiniteType ℚ O] (h : Supplier.RealSMap O) :
    geometricallyConnectedCommHopfAlgProperty ℚ (Supplier.mtCoordinate O h).obj := by sorry
-- Polarizability/semisimplicity of the rational Hodge representation is a required H1/R6
-- supplier hypothesis omitted here. The conclusion is about this MT, not an arbitrary Hmt.
lemma mumfordTateReductive (O : CommHopfAlgCat ℚ) [Algebra.FiniteType ℚ O] (h : Supplier.RealSMap O) :
    reductiveCommHopfAlgProperty ℚ (Supplier.mtCoordinate O h) := by sorry

namespace Supplier
 structure PolarizedH1 where
   rank : ℕ
   h : RealSMap (GL rank)
   psi : LinearMap.BilinForm ℚ (Fin rank → ℚ)
   alternating : ∀ v, psi v v = 0
   nondegenerate : psi.Nondegenerate
 -- The weight-one Hodge object, its compatibility with h, and the full Hodge–Riemann
 -- polarization condition on psi are omitted H0/H1 supplier hypotheses, not implied
 -- by alternating/nondegenerate. These suppliers include that geometric input.
 def ellipticH1 (τ : ℂ) (hτ : 0 < τ.im) : PolarizedH1 := sorry
 -- H¹(E_i × E_i,Q) with the product polarization.
 def productEllipticH1 : PolarizedH1 := sorry
 def similitudeIdeal {n : ℕ} (ψ : LinearMap.BilinForm ℚ (Fin n → ℚ)) : HopfIdeal ℚ (GL n) := sorry
 def basisChangeH1 (A : PolarizedH1) (e : (Fin A.rank → ℚ) ≃ₗ[ℚ] (Fin A.rank → ℚ)) : PolarizedH1 := sorry
 def realHodgeComodule {n : ℕ} (h : RealSMap (GL n)) :
     Comodule ℝ deligneCoordinate (Fin n → ℝ) := sorry
 def realLinearMap {m n : ℕ} (f : (Fin m → ℚ) →ₗ[ℚ] (Fin n → ℚ)) :
     (Fin m → ℝ) →ₗ[ℝ] (Fin n → ℝ) := sorry
 structure RationalHodgeIsogeny (A B : PolarizedH1) where
   linear : (Fin A.rank → ℚ) ≃ₗ[ℚ] (Fin B.rank → ℚ)
   respects : (realHodgeComodule B.h).coact.comp (realLinearMap linear.toLinearMap) =
     (TensorProduct.map (realLinearMap linear.toLinearMap) LinearMap.id).comp
       (realHodgeComodule A.h).coact
end Supplier

def hodgeGeneric (A : Supplier.PolarizedH1) : Prop :=
  mumfordTateGroup (Supplier.GL A.rank) A.h = Supplier.similitudeIdeal A.psi
lemma hodgeGenericBasis (A : Supplier.PolarizedH1)
    (e : (Fin A.rank → ℚ) ≃ₗ[ℚ] (Fin A.rank → ℚ)) :
    hodgeGeneric (Supplier.basisChangeH1 A e) ↔ hodgeGeneric A := by sorry
lemma hodgeGenericIsogeny (A B : Supplier.PolarizedH1) (e : Supplier.RationalHodgeIsogeny A B) :
    hodgeGeneric A ↔ hodgeGeneric B := by sorry
lemma hodgeGenericElliptic (τ : ℂ) (hτ : 0 < τ.im) :
    hodgeGeneric (Supplier.ellipticH1 τ hτ) ↔
      ¬ ∃ a b c : ℚ, a ≠ 0 ∧ (a : ℂ)*τ^2 + b*τ + c = 0 := by sorry
-- TauCeti.Shimura.tests.genericCmFalse
example : ¬ hodgeGeneric (Supplier.ellipticH1 Complex.I (by sorry)) := by sorry
-- TauCeti.Shimura.tests.genericNonCmElliptic
example (τ : ℂ) (hτ : 0 < τ.im) (htrans : ¬ IsAlgebraic ℚ τ) :
    hodgeGeneric (Supplier.ellipticH1 τ hτ) := by sorry
-- TauCeti.Shimura.tests.genericProductFalse
example : ¬ hodgeGeneric Supplier.productEllipticH1 := by sorry


/- D2 supplier carriers for the geometric conclusions. The topology of X is the real
homogeneous quotient topology. Real group/Lie comparisons, SV1–SV2 and integration of
F⁰g are the explicit ALS/LieGroups prerequisites, omitted where no common API exists. -/
open scoped Manifold
abbrev ComplexModel (d : ℕ) := EuclideanSpace ℂ (Fin d)
structure ComplexManifoldOn (X : Type*) [TopologicalSpace X] (d : ℕ) where
  charts : ChartedSpace (ComplexModel d) X
  manifold : letI := charts; IsManifold (𝓘(ℂ, ComplexModel d)) 1 X

def Holomorphic {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] {d e : ℕ}
    (A : ComplexManifoldOn X d) (B : ComplexManifoldOn Y e) (f : X → Y) : Prop :=
  letI := A.charts
  letI := B.charts
  MDifferentiable (𝓘(ℂ, ComplexModel d)) (𝓘(ℂ, ComplexModel e)) f

/-- Bounded-domain realization with actual holomorphic point symmetries. Dimension zero
uses the open singleton in C⁰. These are outputs, not premises of the domain theorem. -/
structure BoundedSymmetricDomain (d : ℕ) where
  domain : Set (ComplexModel d)
  open_domain : IsOpen domain
  connected : IsConnected domain
  bounded : Bornology.IsBounded domain
  symmetry : ∀ z : domain, domain ≃ₜ domain
  holomorphic : ∀ z : domain, DifferentiableOn ℂ
    (fun w => if hw : w ∈ domain then (symmetry z ⟨w,hw⟩).val else 0) domain
  involutive : ∀ z : domain, Function.Involutive (symmetry z)
  fixes : ∀ z : domain, symmetry z z = z
  differential : ∀ z : domain, fderiv ℂ
    (fun w => if hw : w ∈ domain then (symmetry z ⟨w,hw⟩).val else 0) z.val =
      -ContinuousLinearMap.id ℂ _
namespace Supplier
 def complexStructureOperator {X : Type*} [TopologicalSpace X] {d : ℕ}
     (A : ComplexManifoldOn X d) (x : X) :
     letI := A.charts
     Module.End ℝ (TangentSpace (𝓘(ℝ, ComplexModel d)) x) := sorry
 def orbitTangent {X : Type*} [TopologicalSpace X] (x : X) : ModuleCat ℝ := sorry
end Supplier

section Tangent
variable {T : Type*} [AddCommGroup T] [Module ℝ T] [FiniteDimensional ℝ T]
    (H : Hodge.HodgeStructureOn (ℂ ⊗[ℝ] T) (Hodge.complexificationConjugation T) 0)
def hodgeTangentOperator : T →ₗ[ℝ] T := sorry
lemma hodgeTangentSquare (h0 : H.piece 0 = ⊥)
    (hother : ∀ p : ℤ, p ≠ -1 → p ≠ 1 → H.piece p = ⊥) :
    (hodgeTangentOperator H).comp (hodgeTangentOperator H) = -LinearMap.id := by sorry
lemma hodgeTangentPositive (v : ℂ ⊗[ℝ] T) (hv : v ∈ H.piece (-1)) :
    (hodgeTangentOperator H).baseChange ℂ v = Complex.I • v := by sorry
lemma hodgeTangentEquivariant (a : T ≃ₗ[ℝ] T)
    (ha : ∀ p, (H.piece p).map (a.toLinearMap.baseChange ℂ) = H.piece p) :
    a.toLinearMap.comp (hodgeTangentOperator H) = (hodgeTangentOperator H).comp a.toLinearMap := by sorry
-- TauCeti.Shimura.tests.tangentGl2
example (e : T ≃ₗ[ℝ] ℂ) (h : ∀ v, e (hodgeTangentOperator H v) = Complex.I * e v) :
    ∀ v, e ((hodgeTangentOperator H).comp (hodgeTangentOperator H) v) = -e v := by sorry
-- TauCeti.Shimura.tests.tangentTorus
example [Subsingleton T] : hodgeTangentOperator H = 0 := by sorry
-- TauCeti.Shimura.tests.tangentProduct
example (J K : T →ₗ[ℝ] T) (hJ : J.comp J = -LinearMap.id)
    (hK : K.comp K = -LinearMap.id) :
    (J.prodMap K).comp (J.prodMap K) = -LinearMap.id := by sorry
end Tangent

lemma cartanAdjointCriterion {𝔤 : Type*} [AddCommGroup 𝔤] [Module ℝ 𝔤]
    (B : 𝔤 →ₗ[ℝ] 𝔤 →ₗ[ℝ] ℝ) (θ : 𝔤 ≃ₗ[ℝ] 𝔤) :
    (∀ x, x ≠ 0 → 0 < -B x (θ x)) ↔ (∀ x, x ≠ 0 → B x (θ x) < 0) := by sorry
lemma shimuraCartanInvolution {G : Type*} [Group G] (h : ℂˣ →* G)
    (i : ℂˣ) (hi : i*i = -1) (hz : h (-1) ∈ Subgroup.center G) :
    ∀ g, h i * (h i * g * (h i)⁻¹) * (h i)⁻¹ = g := by sorry
lemma stabilizerH {G : Type*} [Group G] (h : ℂˣ →* G) (g : G) :
    (∀ z, g * h z * g⁻¹ = h z) ↔ g ∈ Subgroup.centralizer (Set.range h) := by sorry
-- δ is the differential of the orbit map, not the quotient projection. Exactness and
-- local quotient chart identifications are L2/AF supplier hypotheses.
lemma tangentQuotient {𝔤 : Type*} [AddCommGroup 𝔤] [Module ℝ 𝔤]
    {X : Type*} [TopologicalSpace X] (h : X) (𝔨 : Submodule ℝ 𝔤)
    (δ : 𝔤 →ₗ[ℝ] Supplier.orbitTangent h)
    (kerδ : δ.ker = 𝔨) (ontoδ : Function.Surjective δ) :
    ∃ e : (𝔤 ⧸ 𝔨) ≃ₗ[ℝ] Supplier.orbitTangent h, e.toLinearMap.comp 𝔨.mkQ = δ := by sorry
-- Equivariance is the hypothesis. Scalar eigen-equations characterize the pieces; degree
-- addition follows by bilinearity, not by assuming closure of those same pieces.
lemma adjointBracket {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤]
    (ρ : (ℂˣ × ℂˣ) →* (𝔤 ≃ₗ[ℂ] 𝔤))
    (equivariant : ∀ z x y, ρ z ⁅x,y⁆ = ⁅ρ z x, ρ z y⁆)
    (p q r s : ℤ) (x y : 𝔤)
    (hx : ∀ z, ρ z x = (z.1^(-p)*z.2^(-q) : ℂˣ) • x)
    (hy : ∀ z, ρ z y = (z.1^(-r)*z.2^(-s) : ℂˣ) • y) :
    ∀ z, ρ z ⁅x,y⁆ = (z.1^(-(p+r))*z.2^(-(q+s)) : ℂˣ) • ⁅x,y⁆ := by sorry
lemma filtrationLieSubalgebra {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤]
    (F : ℤ → Submodule ℂ 𝔤)
    (hF : ∀ p q x y, x ∈ F p → y ∈ F q → ⁅x,y⁆ ∈ F (p+q)) :
    ∀ x y, x ∈ F 0 → y ∈ F 0 → ⁅x,y⁆ ∈ F 0 := by sorry

-- Complete geometric conclusion. X is the specified h-orbit, and H is its adjoint
-- quotient Hodge structure. The R0/L2 identification T_hX = g/k and the L4 complex
-- quotient input relating F⁰g to charts are omitted hypotheses, not alternative conclusions.
lemma hodgeIntegrability {X : Type*} [TopologicalSpace X] (d : ℕ) (h : X)
    {T : Type*} [AddCommGroup T] [Module ℝ T] [FiniteDimensional ℝ T]
    (H : Hodge.HodgeStructureOn (ℂ ⊗[ℝ] T) (Hodge.complexificationConjugation T) 0)
    (h0 : H.piece 0 = ⊥)
    (hother : ∀ p : ℤ, p ≠ -1 → p ≠ 1 → H.piece p = ⊥) :
    ∃ A : ComplexManifoldOn X d,
      letI := A.charts
      ∃ e : T ≃ₗ[ℝ] TangentSpace (𝓘(ℝ, ComplexModel d)) h,
        ∀ v, e (hodgeTangentOperator H v) = Supplier.complexStructureOperator A h (e v) := by sorry
-- The orbit has the subspace topology in the function space of real points. The faithful
-- algebraic representation and local quotient-chart comparison are omitted supplier
-- hypotheses. Closed-subgroup separation and second countability are already in Mathlib.
def realHodgeOrbit {G : Type*} [Group G] [TopologicalSpace G] (h : ℂˣ →* G) :=
  {φ : ℂˣ → G // ∃ g : G, ∀ z, φ z = g * h z * g⁻¹}
lemma quotientSeparation {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [SecondCountableTopology G] (h : ℂˣ →* G)
    (hK : IsClosed (Subgroup.centralizer (Set.range h) : Set G)) :
    T2Space (G ⧸ Subgroup.centralizer (Set.range h)) ∧
    SecondCountableTopology (G ⧸ Subgroup.centralizer (Set.range h)) ∧
    ∃ e : (G ⧸ Subgroup.centralizer (Set.range h)) ≃ₜ realHodgeOrbit h,
      ∀ g z, (e (QuotientGroup.mk g)).val z = g * h z * g⁻¹ := by sorry
lemma compactRealFactor {T : Type*} [AddCommGroup T] [Module ℝ T]
    (J : T →ₗ[ℝ] T) (hJ : J.comp J = -LinearMap.id) (htriv : J = 0) :
    ∀ x : T, x = 0 := by sorry
lemma hodgeOrbitFiniteComponents {G X : Type*} [TopologicalSpace G]
    [TopologicalSpace X] [Finite (ConnectedComponents G)] (orbit : G → X)
    (hcont : Continuous orbit) (hsurj : Function.Surjective orbit) :
    Finite (ConnectedComponents X) := by sorry

namespace Supplier
 def componentAtlas {X : Type*} [TopologicalSpace X] {d : ℕ}
     (A : ComplexManifoldOn X d) (x : X) :
     ComplexManifoldOn {y : X // y ∈ connectedComponent x} d := sorry
 def boundedDomainAtlas {d : ℕ} (D : BoundedSymmetricDomain d) :
     ComplexManifoldOn D.domain d := sorry
end Supplier
-- SV1–SV3, Cartan symmetric-space comparisons, the actual orbit dimension and the
-- holomorphic quotient comparison are missing supplier hypotheses. Each component
-- is realized by a bounded symmetric domain, including C⁰ for a point factor.
lemma hermitianDomainComponents {X : Type*} [TopologicalSpace X] (d : ℕ)
    (A : ComplexManifoldOn X d) :
    Finite (ConnectedComponents X) ∧
    ∀ x : X, ∃ D : BoundedSymmetricDomain d,
      ∃ e : {y : X // y ∈ connectedComponent x} ≃ₜ D.domain,
        Holomorphic (Supplier.componentAtlas A x) (Supplier.boundedDomainAtlas D) e ∧
        Holomorphic (Supplier.boundedDomainAtlas D) (Supplier.componentAtlas A x) e.symm := by sorry
-- The faithful filtration map is the actual period/flag map supplied from its S-action.
-- The tangent faithfulness/tensor-generation conditions are omitted. Compatible atlases,
-- rather than equality of arbitrary chosen chart atlases, express uniqueness.
lemma uniqueComplexStructure {X F : Type*} [TopologicalSpace X] [TopologicalSpace F]
    {d e : ℕ} (A K : ComplexManifoldOn X d) (flagAtlas : ComplexManifoldOn F e)
    (period : X → F) (hA : Holomorphic A flagAtlas period)
    (hK : Holomorphic K flagAtlas period) :
    Holomorphic A K id ∧ Holomorphic K A id := by sorry

/- D3 analytic supplier sketch. Flat frames are glued by locally constant complex-linear
transition functions obtained from the real local system. This describes L⊗O_B and its
connection, rather than just its fibers. The general sheaf/vector-bundle realization and
comparison with Mathlib VectorBundleCore are the explicitly open analytic supplier leaf. -/
namespace Supplier
abbrev RealFiber {B : TopCat} (L : LocalCoefficientSystem ℝ B) (b : B) :=
  L.obj (FundamentalGroupoid.mk b)
abbrev ComplexFiber {B : TopCat} (L : LocalCoefficientSystem ℝ B) (b : B) :=
  ℂ ⊗[ℝ] RealFiber L b
structure FlatHolomorphicBundle (B : TopCat) {d : ℕ} (A : ComplexManifoldOn B d) where
  L : LocalCoefficientSystem ℝ B
  finite : ∀ b, Module.Finite ℝ (RealFiber L b)
  index : Type
  cover : index → Set B
  open_cover : ∀ i, IsOpen (cover i)
  covers : ∀ b, ∃ i, b ∈ cover i
  rank : index → ℕ
  frame : ∀ i b, b ∈ cover i → ComplexFiber L b ≃ₗ[ℂ] (Fin (rank i) → ℂ)
  flat_transition : ∀ i j, IsLocallyConstant
    (fun b : cover i ∩ cover j =>
      (frame j b b.property.2).symm.trans (frame i b b.property.1))
  transport_frame : ∀ i (b c : B) (hb : b ∈ cover i) (hc : c ∈ cover i)
    (γ : Path b c) (hγ : Set.range γ ⊆ cover i),
    (frame i c hc).toLinearMap ∘ₗ
      (LocalCoefficientSystem.transport L (Path.Homotopic.Quotient.mk γ)).toLinearMap.baseChange ℂ =
      (frame i b hb).toLinearMap
attribute [instance] FlatHolomorphicBundle.finite

def localCoordinate {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d}
    (E : FlatHolomorphicBundle B A) (i : E.index) (s : ∀ b, ComplexFiber E.L b)
    (b : B) : Fin (E.rank i) → ℂ :=
  if hb : b ∈ E.cover i then E.frame i b hb (s b) else 0

def HolomorphicSectionOn {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d}
    (E : FlatHolomorphicBundle B A) (U : Set B) (s : ∀ b, ComplexFiber E.L b) : Prop :=
  letI := A.charts
  ∀ i, MDifferentiableOn (𝓘(ℂ, ComplexModel d)) (𝓘(ℂ, Fin (E.rank i) → ℂ))
    (localCoordinate E i s) (U ∩ E.cover i)
-- Defined in flat coordinates by d; cocycle/flatness and sheaf restriction/gluing are
-- analytic supplier results. This is a connection on local holomorphic sections.
def connection {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d}
    (E : FlatHolomorphicBundle B A) (s : ∀ b, ComplexFiber E.L b) (b : B) :
    ComplexModel d →ₗ[ℂ] ComplexFiber E.L b := sorry

def flatBundleOfLocalSystem {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d)
    (L : LocalCoefficientSystem ℝ B) (finite : ∀ b, Module.Finite ℝ (RealFiber L b)) :
    FlatHolomorphicBundle B A := sorry
end Supplier

structure FilteredFlatBundle (B : TopCat) {d : ℕ} (A : ComplexManifoldOn B d) (n : ℤ) where
  flat : Supplier.FlatHolomorphicBundle B A
  fiber : ∀ b, Hodge.HodgeStructureOn (Supplier.ComplexFiber flat.L b)
    (Hodge.complexificationConjugation (Supplier.RealFiber flat.L b)) n
  filtrationRank : flat.index → ℤ → ℕ
  filtrationFrame : ∀ i p, Fin (filtrationRank i p) → ∀ b, Supplier.ComplexFiber flat.L b
  holomorphicFrame : ∀ i p k, Supplier.HolomorphicSectionOn flat (flat.cover i) (filtrationFrame i p k)
  spans : ∀ i p b, b ∈ flat.cover i →
    Submodule.span ℂ (Set.range (fun k => filtrationFrame i p k b)) = (fiber b).F p
  independent : ∀ i p b, b ∈ flat.cover i → LinearIndependent ℂ (fun k => filtrationFrame i p k b)

def HorizontalBundle {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (F : FilteredFlatBundle B A n) : Prop :=
  ∀ U, IsOpen U → ∀ p s, Supplier.HolomorphicSectionOn F.flat U s →
    (∀ b ∈ U, s b ∈ (F.fiber b).F p) →
    ∀ b ∈ U, ∀ t, Supplier.connection F.flat s b t ∈ (F.fiber b).F (p-1)
structure Variation (B : TopCat) {d : ℕ} (A : ComplexManifoldOn B d) (n : ℤ) where
  filtered : FilteredFlatBundle B A n
  horizontal : HorizontalBundle filtered
abbrev variation := Variation

def variationMk {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (F : FilteredFlatBundle B A n) (h : HorizontalBundle F) : variation B A n := ⟨F,h⟩
lemma variationExt {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H K : variation B A n) (h : H.filtered = K.filtered) : H = K := by sorry
lemma variationFiber {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : variation B A n) (b : B) (p : ℤ) :
    IsCompl ((H.filtered.fiber b).F p) (((H.filtered.fiber b).F (n+1-p)).map
      (Hodge.complexificationConjugation (Supplier.RealFiber H.filtered.flat.L b)).toEquiv.toLinearMap) := by sorry
structure VariationHom {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H K : variation B A n) where
  localMap : H.filtered.flat.L ⟶ K.filtered.flat.L
  filtration : ∀ b p, (H.filtered.fiber b).F p ≤ ((K.filtered.fiber b).F p).comap
    ((localMap.app (FundamentalGroupoid.mk b)).hom.baseChange ℂ)
  connection : ∀ s b t,
    (localMap.app (FundamentalGroupoid.mk b)).hom.baseChange ℂ
      (Supplier.connection H.filtered.flat s b t) =
    Supplier.connection K.filtered.flat
      (fun c => (localMap.app (FundamentalGroupoid.mk c)).hom.baseChange ℂ (s c)) b t

def variationMorphism {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    {H K L : variation B A n} (f : VariationHom H K) (g : VariationHom K L) : VariationHom H L := sorry

def pullbackVariation {B C : TopCat} {d e : ℕ}
    (A : ComplexManifoldOn B d) (A' : ComplexManifoldOn C e) (f : C(B,C))
    (hf : Holomorphic A A' f) {n : ℤ} (H : variation C A' n) : variation B A n := sorry
lemma variationPullback {B C : TopCat} {d e : ℕ}
    (A : ComplexManifoldOn B d) (A' : ComplexManifoldOn C e) (f : C(B,C))
    (hf : Holomorphic A A' f) {n : ℤ} (H : variation C A' n) :
    (pullbackVariation A A' f hf H).filtered.flat.L =
      (LocalCoefficientSystem.pullback f).obj H.filtered.flat.L := by sorry

def constantVariation {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d)
    {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V] {n : ℤ}
    (H : Hodge.HodgeStructureOn (ℂ ⊗[ℝ] V) (Hodge.complexificationConjugation V) n) :
    variation B A n := sorry
-- TauCeti.Shimura.tests.variationConstant
example {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d)
    {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V] {n : ℤ}
    (H : Hodge.HodgeStructureOn (ℂ ⊗[ℝ] V) (Hodge.complexificationConjugation V) n) :
    (constantVariation A H).filtered.flat.L =
      (LocalCoefficientSystem.constantFunctor B).obj (ModuleCat.of ℝ V) := by sorry
namespace Supplier
 def upperPlane : TopCat := TopCat.of {z : ℂ // 0 < z.im}
 def upperPlaneAtlas : ComplexManifoldOn upperPlane 1 := sorry
 def ellipticVariation : variation upperPlane upperPlaneAtlas 1 := sorry
 def ellipticFiberBasis (τ : upperPlane) : ComplexFiber ellipticVariation.filtered.flat.L τ ≃ₗ[ℂ] (Fin 2 → ℂ) := sorry
 def smallDisk : TopCat := TopCat.of {z : ℂ // ‖z‖ < (1/2 : ℝ)}
 def smallDiskAtlas : ComplexManifoldOn smallDisk 1 := sorry
 -- The real rank-four constant system has conjugation e0↔e3, e1↔e2.
 -- F³(z)=C(e0+ze3), F²(z)=F³(z)+Ce1, F¹(z)=F³(z)^⊥ for the fixed
 -- skew pairing Q(e0,e3)=i,Q(e1,e2)=-i. H1 supplies positivity near 0.
 def nonhorizontalFlag : FilteredFlatBundle smallDisk smallDiskAtlas 3 := sorry
end Supplier
-- TauCeti.Shimura.tests.variationElliptic
example (τ : Supplier.upperPlane) :
    ((Supplier.ellipticVariation.filtered.fiber τ).F 1).map
      (Supplier.ellipticFiberBasis τ).toLinearMap = Submodule.span ℂ {![τ.val,1]} ∧
    HorizontalBundle Supplier.ellipticVariation.filtered := by sorry
-- TauCeti.Shimura.tests.variationNonHorizontal
example : ¬ HorizontalBundle Supplier.nonhorizontalFlag ∧
    ¬ ∃ H : variation Supplier.smallDisk Supplier.smallDiskAtlas 3,
      H.filtered = Supplier.nonhorizontalFlag := by sorry

structure IntegralVariationFibers (B : TopCat) {d : ℕ} (A : ComplexManifoldOn B d) (n : ℤ) where
  lattice : LocalCoefficientSystem ℤ B
  free : ∀ b, Module.Free ℤ (lattice.obj (FundamentalGroupoid.mk b))
  finite : ∀ b, Module.Finite ℤ (lattice.obj (FundamentalGroupoid.mk b))
  realVariation : variation B A n
  realComparison : ∀ b, Supplier.RealFiber realVariation.filtered.flat.L b ≃ₗ[ℝ]
    (ℝ ⊗[ℤ] lattice.obj (FundamentalGroupoid.mk b))
  integralHodge : ∀ b, Hodge.HodgeStructure
    (Hodge.isBaseChange_complexificationMap (V := lattice.obj (FundamentalGroupoid.mk b))) n
  pairing : ∀ b, LinearMap.BilinForm ℤ (lattice.obj (FundamentalGroupoid.mk b))
  polarization : ∀ b, Hodge.IsPolarization Hodge.isBaseChange_complexificationMap (integralHodge b) (pairing b)
  -- Scalar-extension agreement of integralHodge with realVariation.filtered.fiber,
  -- and naturality of realComparison, are exact H0 supplier comparison hypotheses
  -- omitted here; they must be restored before implementation.
  parallel : ∀ (b c : B) (γ : Path.Homotopic.Quotient b c) x y,
    pairing c (LocalCoefficientSystem.transport lattice γ x)
      (LocalCoefficientSystem.transport lattice γ y) = pairing b x y
abbrev polarizedIntegralVariation := IntegralVariationFibers

def integralVariationMk {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    := @IntegralVariationFibers.mk B d A n
lemma integralVariationExt {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H K : polarizedIntegralVariation B A n) (hL : H.lattice = K.lattice)
    (hV : H.realVariation = K.realVariation) (hcmp : HEq H.realComparison K.realComparison)
    (hHS : HEq H.integralHodge K.integralHodge) (hQ : HEq H.pairing K.pairing) : H = K := by sorry
-- Rationalization carries the induced flat filtration/connection and the rationalized form;
-- its bundle comparison is supplied by the analytic/H0 scalar-extension API.
open scoped ComplexOrder
namespace Supplier
 def rationalFormOnRealFiber {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
     (L : LocalCoefficientSystem ℚ B) (V : variation B A n)
     (e : ∀ b, (ℝ ⊗[ℚ] L.obj (FundamentalGroupoid.mk b)) ≃ₗ[ℝ] RealFiber V.filtered.flat.L b)
     (Q : ∀ b, LinearMap.BilinForm ℚ (L.obj (FundamentalGroupoid.mk b))) (b : B) :
     LinearMap.BilinForm ℂ (ComplexFiber V.filtered.flat.L b) := sorry
end Supplier
structure RationalPolarizedVariation (B : TopCat) {d : ℕ} (A : ComplexManifoldOn B d) (n : ℤ) where
  localSystem : LocalCoefficientSystem ℚ B
  finite : ∀ b, Module.Finite ℚ (localSystem.obj (FundamentalGroupoid.mk b))
  realVariation : variation B A n
  realComparison : ∀ b, (ℝ ⊗[ℚ] localSystem.obj (FundamentalGroupoid.mk b)) ≃ₗ[ℝ]
    Supplier.RealFiber realVariation.filtered.flat.L b
  pairing : ∀ b, LinearMap.BilinForm ℚ (localSystem.obj (FundamentalGroupoid.mk b))
  symm_weight : ∀ b x y, pairing b y x = (n.negOnePow : ℚ)*pairing b x y
  nondegenerate : ∀ b, (pairing b).Nondegenerate
  orthogonal : ∀ b p x, x ∈ (realVariation.filtered.fiber b).F p →
    ∀ y ∈ (realVariation.filtered.fiber b).F (n+1-p),
      Supplier.rationalFormOnRealFiber localSystem realVariation realComparison pairing b x y = 0
  positive : ∀ b p x, x ∈ (realVariation.filtered.fiber b).piece p → x ≠ 0 →
    0 < Complex.I^(2*p-n)*Supplier.rationalFormOnRealFiber localSystem realVariation realComparison pairing b x
      (Hodge.complexificationConjugation (Supplier.RealFiber realVariation.filtered.flat.L b) x)
  parallel : ∀ (b c : B) (γ : Path.Homotopic.Quotient b c) x y,
    pairing c (LocalCoefficientSystem.transport localSystem γ x)
      (LocalCoefficientSystem.transport localSystem γ y) = pairing b x y
-- Naturality of realComparison and scalar-extension agreement remain H0 supplier conditions.
def integralVariationRational {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : polarizedIntegralVariation B A n) : RationalPolarizedVariation B A n := sorry
lemma integralVariationPairing {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : polarizedIntegralVariation B A n) (b : B) :
    Hodge.IsPolarization Hodge.isBaseChange_complexificationMap (H.integralHodge b) (H.pairing b) := by sorry

def integralVariationPullback {B C : TopCat} {d e : ℕ}
    (A : ComplexManifoldOn B d) (A' : ComplexManifoldOn C e) (f : C(B,C))
    (hf : Holomorphic A A' f) {n : ℤ} (H : polarizedIntegralVariation C A' n) :
    polarizedIntegralVariation B A n := sorry
namespace Supplier
 def integralTate {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d) (m : ℤ) :
     polarizedIntegralVariation B A (-2*m) := sorry
 def scalePolarization {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
     (H : polarizedIntegralVariation B A n) (k : ℕ) (hk : 0 < k) :
     polarizedIntegralVariation B A n := sorry
 def puncturedDisk : TopCat := sorry
 def puncturedDiskAtlas : ComplexManifoldOn puncturedDisk 1 := sorry
 def integralEllipticCusp : polarizedIntegralVariation puncturedDisk puncturedDiskAtlas 1 := sorry
 def cuspBasepoint : puncturedDisk := sorry
 def cuspLoop : Path.Homotopic.Quotient cuspBasepoint cuspBasepoint := sorry
 def cuspBasis : (integralEllipticCusp.lattice.obj (FundamentalGroupoid.mk (cuspBasepoint))) ≃ₗ[ℤ] (Fin 2 → ℤ) := sorry
end Supplier
-- TauCeti.Shimura.tests.integralConstantTate
example {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d) (b : B) :
    (Supplier.integralTate A 1).pairing b ≠ 0 ∧
    ((Supplier.integralTate A 1).integralHodge b).F (-1) = ⊤ := by sorry
-- TauCeti.Shimura.tests.integralScaledPairing
example {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : polarizedIntegralVariation B A n) (b : B) :
    (Supplier.scalePolarization H 2 (by sorry)).pairing b = 2 • H.pairing b := by sorry
-- TauCeti.Shimura.tests.integralMonodromy
example (v : Fin 2 → ℤ) :
    Supplier.cuspBasis (LocalCoefficientSystem.transport Supplier.integralEllipticCusp.lattice
      Supplier.cuspLoop (Supplier.cuspBasis.symm v)) = (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℤ) *ᵥ v := by sorry

lemma flatBundleLocal {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d)
    (L : LocalCoefficientSystem ℝ B) (finite : ∀ b, Module.Finite ℝ (Supplier.RealFiber L b)) :
    ∃ E : Supplier.FlatHolomorphicBundle B A, E.L = L ∧
      ∀ i s b (hb : b ∈ E.cover i),
        letI := A.charts
        (E.frame i b hb).toLinearMap.comp (Supplier.connection E s b) =
          (mfderiv (𝓘(ℂ, ComplexModel d)) (𝓘(ℂ, Fin (E.rank i) → ℂ))
            (Supplier.localCoordinate E i s) b).toLinearMap := by sorry

def Horizontal {T V : Type*} [AddCommGroup T] [Module ℂ T] [AddCommGroup V] [Module ℂ V]
    (F : ℤ → Submodule ℂ V) (d : T →ₗ[ℂ] Module.End ℂ V) : Prop :=
  ∀ p t v, v ∈ F p → d t v ∈ F (p-1)
lemma transversalityTangent {T V : Type*} [AddCommGroup T] [Module ℂ T]
    [AddCommGroup V] [Module ℂ V] (F : ℤ → Submodule ℂ V)
    (d : T →ₗ[ℂ] Module.End ℂ V) : Horizontal F d ↔
      ∀ p t, F p ≤ (F (p-1)).comap (d t) := by sorry

namespace Supplier
 def restrictRepresentation (O : CommHopfAlgCat ℚ)
     (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) O))
     (h : RealSMap O) : SRep := sorry
 def pureRepresentationHodge (M : SRep) (n : ℤ) :
     Hodge.HodgeStructureOn (ℂ ⊗[ℝ] M) (Hodge.complexificationConjugation M) n := sorry
 def tensorVariation {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {m n : ℤ}
     (H : variation B A m) (K : variation B A n) : variation B A (m+n) := sorry
 def tensorGroupRep {O : CommHopfAlgCat ℚ}
     (ρ σ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) O)) :
     FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) O) := sorry
end Supplier
-- h is the actual algebraic S-map at each orbit point; ρ is a G-comodule. Orbit/SV,
-- holomorphic quotient charts and purity of ρ∘h in weight n are omitted hypotheses.
def homogeneousVariation {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d)
    (O : CommHopfAlgCat ℚ) (h : B → Supplier.RealSMap O)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) O)) (n : ℤ) : variation B A n := sorry
lemma homogeneousFiber {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d)
    (O : CommHopfAlgCat ℚ) (h : B → Supplier.RealSMap O)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) O)) (n : ℤ) (b : B) :
    HEq ((homogeneousVariation A O h ρ n).filtered.fiber b)
      (Supplier.pureRepresentationHodge (Supplier.restrictRepresentation O ρ (h b)) n) := by sorry
lemma homogeneousTensor {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d)
    (O : CommHopfAlgCat ℚ) (h : B → Supplier.RealSMap O)
    (ρ σ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) O)) (m n : ℤ) :
    ∃ f : VariationHom (homogeneousVariation A O h (Supplier.tensorGroupRep ρ σ) (m+n))
      (Supplier.tensorVariation (homogeneousVariation A O h ρ m) (homogeneousVariation A O h σ n)),
    ∀ b, Function.Bijective (f.localMap.app (FundamentalGroupoid.mk b)) := by sorry

-- The derivative comparison d(period)=dρ modulo F⁰End is an R2/flag supplier input.
-- The hypotheses below express action equivariance and the adjoint three-type decomposition,
-- and do not assume the desired filtration bound.
section HorizontalAction
variable {𝔤 V : Type*} [AddCommGroup 𝔤] [Module ℂ 𝔤] [AddCommGroup V] [Module ℂ V]
def actionPiece (ρ : (ℂˣ × ℂˣ) →* (V ≃ₗ[ℂ] V)) (p q : ℤ) : Submodule ℂ V where
  carrier := {v | ∀ z, ρ z v = ((z.1^(-p)*z.2^(-q) : ℂˣ) : ℂ) • v}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
def actionFiltration (ρ : (ℂˣ × ℂˣ) →* (V ≃ₗ[ℂ] V)) (p : ℤ) : Submodule ℂ V :=
  ⨆ a : ℤ, ⨆ b : ℤ, ⨆ (_ : p ≤ a), actionPiece ρ a b
lemma homogeneousHorizontal (ad : (ℂˣ × ℂˣ) →* (𝔤 ≃ₗ[ℂ] 𝔤))
    (ρ : (ℂˣ × ℂˣ) →* (V ≃ₗ[ℂ] V)) (dρ : 𝔤 →ₗ[ℂ] Module.End ℂ V)
    (equivariant : ∀ z x v, ρ z (dρ x v) = dρ (ad z x) (ρ z v))
    (SV1 : (⨆ p : ℤ, ⨆ (_ : p = -1 ∨ p = 0 ∨ p = 1), actionPiece ad p (-p)) = ⊤) :
    Horizontal (actionFiltration ρ) dρ := by sorry
lemma homogeneousTransversality (ad : (ℂˣ × ℂˣ) →* (𝔤 ≃ₗ[ℂ] 𝔤))
    (ρ : (ℂˣ × ℂˣ) →* (V ≃ₗ[ℂ] V)) (dρ : 𝔤 →ₗ[ℂ] Module.End ℂ V)
    (equivariant : ∀ z x v, ρ z (dρ x v) = dρ (ad z x) (ρ z v))
    (SV1 : (⨆ p : ℤ, ⨆ (_ : p = -1 ∨ p = 0 ∨ p = 1), actionPiece ad p (-p)) = ⊤) :
    ∀ x p, actionFiltration ρ p ≤ (actionFiltration ρ (p-1)).comap (dρ x) := by sorry
end HorizontalAction
-- Homogeneous concrete tests occur after the datum examples below.

-- Pointwise filtration stabilizer. Algebraicity/parabolic representability is omitted.
def filtrationParabolic {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : ℤ → Submodule ℂ V) : Subgroup (V ≃ₗ[ℂ] V) := sorry
namespace Supplier
 def parabolicLie {V : Type*} [AddCommGroup V] [Module ℂ V]
     (F : ℤ → Submodule ℂ V) : LieSubalgebra ℂ (Module.End ℂ V) := sorry
 def filtrationLevi {V : Type*} [AddCommGroup V] [Module ℂ V]
     (H : ℤ → Submodule ℂ V) : Subgroup (V ≃ₗ[ℂ] V) := sorry
end Supplier
-- Lie(P_F) is computed by differentiating the filtration stabilizer in its faithful
-- representation; R2/R7 supply that Lie comparison, not an automorphism membership test.
lemma filtrationParabolicLie {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : ℤ → Submodule ℂ V) (a : Module.End ℂ V) : a ∈ Supplier.parabolicLie F ↔
      ∀ p, F p ≤ (F p).comap a := by sorry
lemma filtrationParabolicLevi {V : Type*} [AddCommGroup V] [Module ℂ V]
    (H : ℤ → Submodule ℂ V) (internal : DirectSum.IsInternal H)
    (μ : ℂˣ →* (V ≃ₗ[ℂ] V))
    (weights : ∀ p v, v ∈ H p → ∀ z, μ z v = ((z : ℂ)^(-p)) • v) :
    Supplier.filtrationLevi H = Subgroup.centralizer (Set.range μ) := by sorry
lemma filtrationParabolicConjugate {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : ℤ → Submodule ℂ V) (a b : V ≃ₗ[ℂ] V) :
    b ∈ filtrationParabolic F ↔ a*b*a⁻¹ ∈ filtrationParabolic (fun p => (F p).map a.toLinearMap) := by sorry
-- TauCeti.Shimura.tests.parabolicGl2
example (a : (Fin 2 → ℂ) ≃ₗ[ℂ] (Fin 2 → ℂ)) :
    a ∈ filtrationParabolic (fun p => if p ≤ 0 then ⊤ else if p = 1 then Submodule.span ℂ {![1,0]} else ⊥) ↔
    ∃ c : ℂ, c ≠ 0 ∧ a ![1,0] = c • ![1,0] := by sorry
-- TauCeti.Shimura.tests.parabolicTorus
example : filtrationParabolic (fun _ : ℤ => (⊤ : Submodule ℂ ℂ)) = ⊤ := by sorry
-- The Siegel test below uses GSp and an isotropic Lagrangian.

-- Quotient points only; the scheme, projectivity and reflex descent need R7/SF.
def compactDual (G : Type*) [Group G] (P : Subgroup G) := G ⧸ P
lemma compactDualBasepoint {G : Type*} [Group G] (P : Subgroup G) (g : G) :
    (QuotientGroup.mk g : compactDual G P) = QuotientGroup.mk 1 ↔ g ∈ P := by sorry
lemma compactDualChangePoint {G : Type*} [Group G] (P : Subgroup G) (g : G) :
    Nonempty (compactDual G P ≃ compactDual G (P.map (MulAut.conj g).toMonoidHom)) := by sorry
-- This is the tangent space of the supplied complex flag manifold at its basepoint.
-- Identification of g and F⁰g with Lie(G) and Lie(P) is an R2/R7 hypothesis omitted here.
lemma compactDualTangent {G : Type*} [Group G] [TopologicalSpace G]
    (P : Subgroup G) {e : ℕ} (A : ComplexManifoldOn (compactDual G P) e)
    {𝔤 : Type*} [AddCommGroup 𝔤] [Module ℂ 𝔤] (F : Submodule ℂ 𝔤) :
    letI := A.charts
    Nonempty ((𝔤 ⧸ F) ≃ₗ[ℂ] TangentSpace (𝓘(ℂ, ComplexModel e))
      (QuotientGroup.mk 1 : compactDual G P)) := by sorry
-- TauCeti.Shimura.tests.dualGl2
example (P : Subgroup ((Fin 2 → ℂ) ≃ₗ[ℂ] (Fin 2 → ℂ)))
    (hP : ∀ a, a ∈ P ↔ (Submodule.span ℂ {![1,0]}).map a.toLinearMap = Submodule.span ℂ {![1,0]}) :
    Nonempty (compactDual _ P ≃ {L : Submodule ℂ (Fin 2 → ℂ) // Module.finrank ℂ L = 1}) := by sorry
-- TauCeti.Shimura.tests.dualTorus
example {G : Type*} [Group G] : Subsingleton (compactDual G ⊤) := by sorry
-- The Lagrangian compact-dual and Borel-map statements occur below after the datum carrier.

-- Supplier G_C action on its actual cocharacter carrier A, not a representative μ field.
def cocharacterClass {G A : Type*} [Group G] [MulAction G A] (μ : A) : Set A := MulAction.orbit G μ
lemma cocharacterClassIndependent {G A : Type*} [Group G] [MulAction G A] (μ : A) (g : G) :
    cocharacterClass (g • μ) = cocharacterClass μ := by sorry
lemma cocharacterClassGalois {G A : Type*} [Group G] [MulAction G A] (μ : A)
    (σ : A ≃ A) (τ : G ≃* G) (h : ∀ g a, σ (g • a) = τ g • σ a) :
    σ '' cocharacterClass μ = cocharacterClass (σ μ) := by sorry
lemma cocharacterClassMap {G H A B : Type*} [Group G] [Group H]
    [MulAction G A] [MulAction H B] (f : G →* H) (φ : A → B)
    (h : ∀ g a, φ (g • a) = f g • φ a) (μ : A) : φ '' cocharacterClass μ ⊆ cocharacterClass (φ μ) := by sorry
-- TauCeti.Shimura.tests.classTorus
example {A : Type*} (μ : A) : @cocharacterClass PUnit A inferInstance inferInstance μ = {μ} := by sorry
-- TauCeti.Shimura.tests.classProduct
example {G H A B : Type*} [Group G] [Group H] [MulAction G A] [MulAction H B]
    (μ : A) (ν : B) : cocharacterClass (G := G×H) (μ,ν) = cocharacterClass μ ×ˢ cocharacterClass ν := by sorry

abbrev Qbar := AlgebraicClosure ℚ
-- A is the supplier conjugacy-class carrier; its Galois action must be the algebraic one.
def reflexField {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (c : A) : IntermediateField ℚ Qbar :=
  IntermediateField.fixedField (MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) c)
-- A class of algebraic cocharacters is defined over a finite field K. This makes its
-- stabilizer closed/open; the equality below concerns automorphisms fixing E, rather
-- than membership of one algebraic number in E.
lemma reflexStabilizer {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A] (c : A)
    (K : IntermediateField ℚ Qbar) [FiniteDimensional ℚ K]
    (hK : K.fixingSubgroup ≤ MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) c)
    (σ : Qbar ≃ₐ[ℚ] Qbar) : σ ∈ (reflexField c).fixingSubgroup ↔ σ • c = c := by sorry
lemma reflexMap {A B : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    [MulAction (Qbar ≃ₐ[ℚ] Qbar) B] (f : A → B) (c : A)
    (hf : ∀ σ a, f (σ • a) = σ • f a) : reflexField (f c) ≤ reflexField c := by sorry
lemma reflexProduct {A B : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    [MulAction (Qbar ≃ₐ[ℚ] Qbar) B] (a : A) (b : B)
    (Ka Kb : IntermediateField ℚ Qbar)
    [FiniteDimensional ℚ Ka] [FiniteDimensional ℚ Kb]
    (ha : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) a = Ka.fixingSubgroup)
    (hb : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) b = Kb.fixingSubgroup) :
    reflexField (a,b) = reflexField a ⊔ reflexField b := by sorry
-- Reflex tests below instantiate actual GL₂ and CM cocharacters.
lemma reflexStabilizerOpen {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    (c : A) (K : IntermediateField ℚ Qbar) [FiniteDimensional ℚ K]
    (hK : K.fixingSubgroup ≤ MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) c) : reflexField c ≤ K := by sorry
lemma reflexFinite {A : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    (c : A) (K : IntermediateField ℚ Qbar) [FiniteDimensional ℚ K]
    (hK : K.fixingSubgroup ≤ MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) c) :
    FiniteDimensional ℚ (reflexField c) := by sorry
-- X is the complex compact dual. The effective Galois descent datum and projectivity
-- are unavailable supplier conditions, omitted here. The conclusion retains the actual
-- scalar-extension comparison over ℂ; a scheme already given over E is not a descent proof.
theorem reflexFlagDescent (X : AlgebraicGeometry.Scheme) (E : IntermediateField ℚ Qbar)
    (ι : E →+* ℂ)
    (xToC : X ⟶ AlgebraicGeometry.Spec (CommRingCat.of ℂ)) :
    ∃ (Y : AlgebraicGeometry.Scheme)
      (yToE : Y ⟶ AlgebraicGeometry.Spec (CommRingCat.of E)),
      ∃ e : CategoryTheory.Limits.pullback yToE
          (AlgebraicGeometry.Spec.map (CommRingCat.ofHom ι)) ≅ X,
        e.hom ≫ xToC = CategoryTheory.Limits.pullback.snd yToE
          (AlgebraicGeometry.Spec.map (CommRingCat.ofHom ι)) := by sorry

/- General Kostant combinatorics with supplier Coxeter data. The Coxeter/parabolic hypotheses
on `len` and `M` are omitted from these signatures; minimality itself is explicit. -/
def kostantRepresentatives {W : Type*} [Group W] (M : Subgroup W) (len : W → ℕ) : Set W :=
  {w | ∀ m ∈ M, len w ≤ len (m*w)}
lemma kostantUnique {W : Type*} [Group W] (M : Subgroup W) (len : W → ℕ) (w : W) :
    ∃! u, u ∈ kostantRepresentatives M len ∧ ∃ m ∈ M, w = m*u := by sorry
lemma kostantPositive {W R : Type*} [Group W] [MulAction W R]
    (M : Subgroup W) (len : W → ℕ) (positive leviPositive : Set R) (w : W) :
    w ∈ kostantRepresentatives M len ↔ ∀ α ∈ leviPositive, w⁻¹ • α ∈ positive := by sorry
lemma kostantLengthAdd {W : Type*} [Group W] (M : Subgroup W) (len : W → ℕ)
    (u w : W) (hu : u ∈ M) (hw : w ∈ kostantRepresentatives M len) : len (u*w) = len u + len w := by sorry
-- TauCeti.Shimura.tests.kostantBorel
example {W : Type*} [Group W] (len : W → ℕ) : kostantRepresentatives ⊥ len = Set.univ := by sorry
-- TauCeti.Shimura.tests.kostantWholeGroup
example {W : Type*} [Group W] (len : W → ℕ) (hzero : ∀ w, len w = 0 ↔ w = 1) :
    kostantRepresentatives ⊤ len = {1} := by sorry
private def a2Length (w : Equiv.Perm (Fin 3)) : ℕ :=
  (Finset.univ.filter (fun p : Fin 3 × Fin 3 => p.1 < p.2 ∧ w p.2 < w p.1)).card
-- TauCeti.Shimura.tests.kostantA2Left
example : kostantRepresentatives (Subgroup.closure {Equiv.swap (0 : Fin 3) 1}) a2Length =
    {1, Equiv.swap (1 : Fin 3) 2, Equiv.swap (1 : Fin 3) 2 * Equiv.swap (0 : Fin 3) 1} := by sorry
lemma kostantConeCriterion {W A : Type*} [Group W] [MulAction W A]
    (M : Subgroup W) (len : W → ℕ) (C CM : Set A) (w : W) :
    w ∈ kostantRepresentatives M len ↔ (fun a => w • a) '' C ⊆ CM := by sorry
lemma kostantCones {W A : Type*} [Group W] [MulAction W A]
    (M : Subgroup W) (len : W → ℕ) (C CM : Set A) :
    CM = ⋃ w ∈ kostantRepresentatives M len, (fun a => w • a) '' C := by sorry
lemma kostantInvolution {W : Type*} [Group W] (M : Subgroup W) (len : W → ℕ)
    (wM wG w : W) (hM : wM*wM=1) (hG : wG*wG=1)
    (hw : w ∈ kostantRepresentatives M len) :
    wM*w*wG ∈ kostantRepresentatives M len ∧ wM*(wM*w*wG)*wG = w := by sorry
-- Scheme cells and their base-change-compatible affine isomorphisms are supplied by RG9.
lemma bruhatIntegral {W : Type*} (len : W → ℕ) (cells : W → AlgebraicGeometry.Scheme)
    (affineSpace : ℕ → AlgebraicGeometry.Scheme) (w : W) : Nonempty (cells w ≅ affineSpace (len w)) := by sorry

-- Underlying loci; schematic closures/flatness/base change are absent, explicitly requested.
def schubertFamilies {X W : Type*} [TopologicalSpace X] [Preorder W]
    (cells oppositeCells : W → Set X) (w : W) : Set X × Set X × Set X :=
  (closure (cells w), closure (oppositeCells w), ⋃ v, ⋃ (_ : w ≤ v), cells v)
lemma schubertClosure {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (w : W) : (schubertFamilies C C' w).1 = ⋃ v, ⋃ (_ : v ≤ w), C v := by sorry
lemma oppositeSchubertClosure {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (w : W) : (schubertFamilies C C' w).2.1 = ⋃ v, ⋃ (_ : w ≤ v), C' v := by sorry
lemma schubertUpperOpen {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (w : W) : IsOpen (schubertFamilies C C' w).2.2 := by sorry
-- Rank-one locus tests, with C0={∞}, C1=complement and reversed opposite fixed point.
-- TauCeti.Shimura.tests.schubertRankOne
example {X : Type*} [TopologicalSpace X] [T1Space X] (∞ : X)
    (C C' : Bool → Set X) (h0 : C false = {∞}) :
    (schubertFamilies C C' false).1 = {∞} := by sorry
-- TauCeti.Shimura.tests.schubertOppositeRankOne
example {X : Type*} [TopologicalSpace X] [T1Space X] (∞ z : X) (h : z ≠ ∞)
    (C C' : Bool → Set X) (h1 : C true = {∞}ᶜ) (h' : C' true = {z}) :
    (schubertFamilies C C' true).2.1 ⊆ (schubertFamilies C C' true).2.2 := by sorry
-- TauCeti.Shimura.tests.schubertTrivialFlag
example : schubertFamilies (fun _ : Unit => (Set.univ : Set Unit))
    (fun _ => Set.univ) () = (Set.univ,Set.univ,Set.univ) := by sorry
lemma bruhatClosureOrder {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C : W → Set X) (u v : W) : u ≤ v ↔ C u ⊆ closure (C v) := by sorry
lemma oppositeIntersection {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (u v : W) :
    (closure (C' u) ∩ C v).Nonempty ↔ u ≤ v := by sorry
lemma oppositeInsideUpper {X W : Type*} [TopologicalSpace X] [Preorder W]
    (C C' : W → Set X) (w : W) (cover : ⋃ v, C v = Set.univ)
    (incidence : ∀ v, (closure (C' w) ∩ C v).Nonempty → w ≤ v) :
    (schubertFamilies C C' w).2.1 ⊆ (schubertFamilies C C' w).2.2 := by sorry

private def mobius (M : Matrix (Fin 2) (Fin 2) ℝ) (z : ℂ) : ℂ :=
  ((M 0 0 : ℂ)*z + M 0 1) / ((M 1 0 : ℂ)*z + M 1 1)

/- D4 retains rational coordinate Hopf algebras and actual real algebraic S-maps.
The complete SV axioms are in the packet. SV1–SV3 and analytic point topology are omitted
hypotheses where the supplier does not yet provide a common interface; rationality of
special-pair tori and morphisms is retained and is never replaced by abstract point groups. -/
namespace Supplier
abbrev Points (O : CommHopfAlgCat ℚ) (k : Type*) [Field k] [Algebra ℚ k] := WithConv (O →ₐ[ℚ] k)
def pointMap {O P : CommHopfAlgCat ℚ} (f : P ⟶ O) (k : Type*) [Field k] [Algebra ℚ k] :
    Points O k →* Points P k := sorry
def realSPoints {O : CommHopfAlgCat ℚ} (h : RealSMap O) : ℂˣ →* Points O ℝ := sorry
end Supplier

def conjugateHom {G : Type*} [Group G] (g : G) (h : ℂˣ →* G) : ℂˣ →* G :=
  (MulAut.conj g).toMonoidHom.comp h
structure DatumOrbit (G : Type*) [Group G] where
  X : Set (ℂˣ →* G)
  nonempty : X.Nonempty
  full : ∀ h ∈ X, X = {k | ∃ g, k = conjugateHom g h}
structure PointDatum where
  coordinate : FiniteTypeCommHopfAlgCat ℚ
  reductive : reductiveCommHopfAlgProperty ℚ coordinate
  G : Type
  [group : Group G]
  realPoints : G ≃* Supplier.Points coordinate.obj ℝ
  orbit : @DatumOrbit G group
  algebraic : ∀ h ∈ orbit.X, ∃ u : Supplier.RealSMap coordinate.obj,
    h = realPoints.symm.toMonoidHom.comp (Supplier.realSPoints u)
attribute [instance] PointDatum.group
abbrev shimuraDatum := PointDatum

def pointDatumOfHom {G : Type} [Group G] (O : FiniteTypeCommHopfAlgCat ℚ)
    (reductive : reductiveCommHopfAlgProperty ℚ O)
    (e : G ≃* Supplier.Points O.obj ℝ) (h : Supplier.RealSMap O.obj) : shimuraDatum :=
  { coordinate := O
    reductive := reductive
    G := G
    group := inferInstance
    realPoints := e
    orbit := { X := {k | ∃ g, k = conjugateHom g (e.symm.toMonoidHom.comp (Supplier.realSPoints h))}
               nonempty := by sorry
               full := by sorry }
    algebraic := by sorry }
lemma datumConjugate (D : shimuraDatum) (h : ℂˣ →* D.G) (hh : h ∈ D.orbit.X) (g : D.G) :
    conjugateHom g h ∈ D.orbit.X := by sorry
lemma datumNoBasepoint (D : shimuraDatum) (h k : ℂˣ →* D.G)
    (hh : h ∈ D.orbit.X) (hk : k ∈ D.orbit.X) :
    {l | ∃ g, l = conjugateHom g h} = {l | ∃ g, l = conjugateHom g k} := by sorry
lemma datumWeightCentral (D : shimuraDatum) (h : ℂˣ →* D.G)
    (hh : h ∈ D.orbit.X) (d : ℝˣ →* ℂˣ)
    (central : ∀ t, h (d t) ∈ Subgroup.center D.G) (k : ℂˣ →* D.G) (hk : k ∈ D.orbit.X) :
    k.comp d = h.comp d := by sorry
-- TauCeti.Shimura.tests.datumTorus
example (D : shimuraDatum) [CommGroup D.G] (h : ℂˣ →* D.G) (hh : h ∈ D.orbit.X) : D.orbit.X = {h} := by sorry
-- TauCeti.Shimura.tests.datumEmptyFalse
example : ¬ ∃ D : shimuraDatum, D.orbit.X = ∅ := by sorry
-- SV3 cannot be encoded yet: the forbidden trivial rational-factor projection is retained.
-- TauCeti.Shimura.tests.datumCompactRationalFalse
example {G : Type*} [Group G] : Set.range (1 : ℂˣ →* G) = {1} := by sorry
lemma axiomsConjugation (D : shimuraDatum) (h : ℂˣ →* D.G) (hh : h ∈ D.orbit.X) (g : D.G) :
    conjugateHom g h ∈ D.orbit.X := by sorry
lemma weightCentral {G : Type*} [Group G] (h : ℂˣ →* G) (d : ℝˣ →* ℂˣ)
    (hcentral : ∀ t, h (d t) ∈ Subgroup.center G) (g : G) :
    (conjugateHom g h).comp d = h.comp d := by sorry

def rationalPointMap (D E : shimuraDatum) (f : E.coordinate.obj ⟶ D.coordinate.obj) : D.G →* E.G :=
  E.realPoints.symm.toMonoidHom.comp ((Supplier.pointMap f ℝ).comp D.realPoints.toMonoidHom)
structure DatumMorphism (D E : shimuraDatum) where
  coordinate : E.coordinate.obj ⟶ D.coordinate.obj
  orbit : ∀ h ∈ D.orbit.X, (rationalPointMap D E coordinate).comp h ∈ E.orbit.X
abbrev datumMorphism := DatumMorphism
def DatumMorphism.val {D E : shimuraDatum} (f : datumMorphism D E) : D.G →* E.G :=
  rationalPointMap D E f.coordinate
def identityMorphism (D : shimuraDatum) : datumMorphism D D := sorry
def composeMorphism {D E F : shimuraDatum} (f : datumMorphism D E) (g : datumMorphism E F) : datumMorphism D F := sorry
lemma datumMorphismIdentity (D : shimuraDatum) : (identityMorphism D).coordinate = 𝟙 D.coordinate.obj := by sorry
lemma datumMorphismComp {D E F : shimuraDatum} (f : datumMorphism D E) (g : datumMorphism E F) :
    (composeMorphism f g).coordinate = g.coordinate ≫ f.coordinate := by sorry
namespace Supplier
 def datumDomain (D : shimuraDatum) : TopCat := sorry
 def datumDomainPoint (D : shimuraDatum) : datumDomain D ≃ {h // h ∈ D.orbit.X} := sorry
 def datumDimension (D : shimuraDatum) : ℕ := sorry
 def datumAtlas (D : shimuraDatum) : ComplexManifoldOn (datumDomain D) (datumDimension D) := sorry
 def datumDomainMap {D E : shimuraDatum} (f : datumMorphism D E) : datumDomain D → datumDomain E := sorry
end Supplier
lemma datumMorphismHolomorphic {D E : shimuraDatum} (f : datumMorphism D E) :
    Holomorphic (Supplier.datumAtlas D) (Supplier.datumAtlas E) (Supplier.datumDomainMap f) := by sorry
-- Morphism concrete tests occur with the actual datum models below.
def datumCategory : Category shimuraDatum where
  Hom := datumMorphism
  id := identityMorphism
  comp := composeMorphism
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
attribute [local instance] datumCategory
lemma datumCategoryExt {D E : shimuraDatum} (f g : datumMorphism D E)
    (h : f.coordinate = g.coordinate) : f = g := by sorry
lemma datumCategoryForget {D E F : shimuraDatum} (f : datumMorphism D E) (g : datumMorphism E F) :
    (composeMorphism f g).val = g.val.comp f.val := by sorry
lemma datumCategoryIso {D E : shimuraDatum} (e : E.coordinate.obj ≅ D.coordinate.obj)
    (h : ∀ u, u ∈ D.orbit.X ↔ (rationalPointMap D E e.hom).comp u ∈ E.orbit.X) :
    Nonempty (D ≅ E) := by sorry
-- TauCeti.Shimura.tests.categoryTorusIdentity
example (D : shimuraDatum) (h : ℂˣ →* D.G) : (identityMorphism D).val.comp h = h := by sorry
-- TauCeti.Shimura.tests.categoryOrbitSame
example {G : Type*} [Group G] (h : ℂˣ →* G) (g : G) :
    {l | ∃ k, l = conjugateHom k (conjugateHom g h)} = {l | ∃ k, l = conjugateHom k h} := by sorry

def productDatum (D E : shimuraDatum) : shimuraDatum := sorry
lemma productDomain (D E : shimuraDatum) :
    Nonempty (Supplier.datumDomain (productDatum D E) ≃ₜ (Supplier.datumDomain D × Supplier.datumDomain E)) := by sorry
lemma productMaps (D E : shimuraDatum) :
    ∃ f : datumMorphism (productDatum D E) D, ∃ g : datumMorphism (productDatum D E) E,
      Function.Bijective (fun x => (f.val x,g.val x)) ∧
      ∀ (F : shimuraDatum) (φ : datumMorphism F D) (ψ : datumMorphism F E),
        ∃! u : datumMorphism F (productDatum D E),
          composeMorphism u f = φ ∧ composeMorphism u g = ψ := by sorry
-- TauCeti.Shimura.tests.categoryProductProjection
example (D E F : shimuraDatum) (φ : datumMorphism F D) (ψ : datumMorphism F E) :
    ∃ p₁ : datumMorphism (productDatum D E) D, ∃ p₂ : datumMorphism (productDatum D E) E,
      ∃ u : datumMorphism F (productDatum D E),
        composeMorphism u p₁ = φ ∧ composeMorphism u p₂ = ψ := by sorry
lemma productReflex {A B : Type*} [MulAction (Qbar ≃ₐ[ℚ] Qbar) A]
    [MulAction (Qbar ≃ₐ[ℚ] Qbar) B] (a : A) (b : B)
    (Ka Kb : IntermediateField ℚ Qbar) [FiniteDimensional ℚ Ka] [FiniteDimensional ℚ Kb]
    (ha : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) a = Ka.fixingSubgroup)
    (hb : MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) b = Kb.fixingSubgroup) :
    reflexField (a,b) = reflexField a ⊔ reflexField b := by sorry

namespace Supplier
 def adjointCoordinate (D : shimuraDatum) : ReductiveCommHopfAlgCat ℚ := sorry
 def adjointQuotient (D : shimuraDatum) : (adjointCoordinate D).obj.obj ⟶ D.coordinate.obj := sorry
 def derivedCoordinate (D : shimuraDatum) : ReductiveCommHopfAlgCat ℚ := sorry
 def adjointQuotientOfDerived (D : shimuraDatum) :
     (adjointCoordinate D).obj.obj ⟶ (derivedCoordinate D).obj.obj := sorry
end Supplier

def datumRepresentative (D : shimuraDatum) : Supplier.RealSMap D.coordinate.obj :=
  Classical.choose (D.algebraic (Classical.choose D.orbit.nonempty) (Classical.choose_spec D.orbit.nonempty))
def adjointDatum (D : shimuraDatum) : shimuraDatum :=
  pointDatumOfHom (Supplier.adjointCoordinate D).obj (Supplier.adjointCoordinate D).property
    (MulEquiv.refl (Supplier.Points (Supplier.adjointCoordinate D).obj.obj ℝ))
    (CommHopfAlgCat.baseChangeMap (K := ℝ) (Supplier.adjointQuotient D) ≫ datumRepresentative D)
lemma adjointMorphism (D : shimuraDatum) :
    ∃ f : datumMorphism D (adjointDatum D), HEq f.coordinate (Supplier.adjointQuotient D) := by sorry
-- R6's joint adjoint/abelian finite kernel, the algebraic S-map continuity, and central
-- weight supply injectivity. No surjectivity on full real orbits is assumed.
lemma adjointDomainInjective (D : shimuraDatum) :
    ∃ f : datumMorphism D (adjointDatum D), Function.Injective (Supplier.datumDomainMap f) ∧
      ∀ x ∈ Set.range (Supplier.datumDomainMap f),
        connectedComponent x ⊆ Set.range (Supplier.datumDomainMap f) := by sorry
lemma adjointIdempotent (D : shimuraDatum) : Nonempty (adjointDatum (adjointDatum D) ≅ adjointDatum D) := by sorry

structure CentralIsogenyCoordinates (O P : CommHopfAlgCat ℚ) where
  coordinate : P ⟶ O
  onto : Function.Surjective (Supplier.pointMap coordinate Qbar)
  central : (Supplier.pointMap coordinate Qbar).ker ≤ Subgroup.center (Supplier.Points O Qbar)
  finite : Finite (Supplier.pointMap coordinate Qbar).ker
lemma centralIsogenyLift (E : shimuraDatum) (O : FiniteTypeCommHopfAlgCat ℚ)
    (f : CentralIsogenyCoordinates O.obj E.coordinate.obj)
    (h₂ : Supplier.RealSMap E.coordinate.obj) (hmem : Supplier.realSPoints h₂ ∈
      (fun h => E.realPoints.toMonoidHom.comp h) '' E.orbit.X)
    (h₁ : Supplier.RealSMap O.obj)
    (hlift : CommHopfAlgCat.baseChangeMap (K := ℝ) f.coordinate ≫ h₁ = h₂) :
    ∃ D : shimuraDatum, D.coordinate = O ∧
      Nonempty (datumMorphism D E) ∧ Nonempty (adjointDatum D ≅ adjointDatum E) ∧
      ∀ k : Supplier.RealSMap O.obj,
        CommHopfAlgCat.baseChangeMap (K := ℝ) f.coordinate ≫ k = h₂ → k = h₁ := by sorry

/-- Rational torus, rational closed immersion, and algebraic real factorization. -/
structure TorusFactorization (D : shimuraDatum) where
  T : TorusCommHopfAlgCat ℚ
  coordinate : D.coordinate.obj ⟶ T.obj.obj
  closed : Function.Surjective coordinate.hom
  h : Supplier.RealSMap T.obj.obj
  point_mem : D.realPoints.symm.toMonoidHom.comp
    (Supplier.realSPoints (CommHopfAlgCat.baseChangeMap (K := ℝ) coordinate ≫ h)) ∈ D.orbit.X
abbrev specialPair := TorusFactorization

def specialPairHom {D : shimuraDatum} (p : specialPair D) : ℂˣ →* D.G :=
  D.realPoints.symm.toMonoidHom.comp
    (Supplier.realSPoints (CommHopfAlgCat.baseChangeMap (K := ℝ) p.coordinate ≫ p.h))
lemma specialPairPoint {D : shimuraDatum} (p : specialPair D) : specialPairHom p ∈ D.orbit.X := by sorry
lemma specialPairSubdatum {D : shimuraDatum} (p : specialPair D) :
    ∃ T : shimuraDatum, T.coordinate = p.T.obj ∧
      Subsingleton (Supplier.datumDomain T) ∧ Nonempty (datumMorphism T D) := by sorry
lemma specialPairEnlarge {D : shimuraDatum} (p : specialPair D) (U : TorusCommHopfAlgCat ℚ)
    (i : U.obj.obj ⟶ p.T.obj.obj) (f : D.coordinate.obj ⟶ U.obj.obj)
    (hf : Function.Surjective f.hom) (commutes : f ≫ i = p.coordinate) :
    ∃ q : specialPair D, q.T = U ∧ specialPairHom q = specialPairHom p := by sorry
-- Special-pair tests occur below with actual rational torus/elliptic models.
def specialPoint (D : shimuraDatum) (h : ℂˣ →* D.G) : Prop := ∃ p : specialPair D, specialPairHom p = h
lemma specialPointFactor (D : shimuraDatum) (h : ℂˣ →* D.G) :
    specialPoint D h ↔ ∃ p : specialPair D, specialPairHom p = h := by sorry
lemma specialPointMap {D E : shimuraDatum} (f : datumMorphism D E) (h : ℂˣ →* D.G)
    (hh : specialPoint D h) : specialPoint E (f.val.comp h) := by sorry
lemma specialPointTorus (D : shimuraDatum) (h : ℂˣ →* D.G) (hh : h ∈ D.orbit.X)
    (torus : torusCommHopfAlgProperty ℚ D.coordinate) : specialPoint D h := by sorry
lemma specialImage {D E : shimuraDatum} (f : datumMorphism D E) (p : specialPair D) :
    ∃ q : specialPair E, specialPairHom q = f.val.comp (specialPairHom p) := by sorry

/-- Connected adjoint witnesses contain actual components of the canonical adjoint datum.
The map is the rational algebraic adjoint isomorphism; it is not an independent full-orbit map. -/
structure AdjointComponentIso (H D : shimuraDatum) where
  coordinate : (adjointDatum D).coordinate.obj ≅ (adjointDatum H).coordinate.obj
  h₀ : Supplier.datumDomain (adjointDatum H)
  d₀ : Supplier.datumDomain (adjointDatum D)
  componentMap : {x : Supplier.datumDomain (adjointDatum H) // x ∈ connectedComponent h₀} ≃ₜ
    {y : Supplier.datumDomain (adjointDatum D) // y ∈ connectedComponent d₀}
  algebraic : ∀ x,
    (Supplier.datumDomainPoint (adjointDatum D) (componentMap x).val).val =
      (rationalPointMap (adjointDatum H) (adjointDatum D) coordinate.hom).comp
        (Supplier.datumDomainPoint (adjointDatum H) x.val).val
  -- The component map is biholomorphic by the D2 algebraic orbit comparison.
  -- No map of the full real orbits is required by this connected datum witness.
structure AbelianTypeWitness (H D : shimuraDatum) where
  derived : CentralIsogenyCoordinates (Supplier.derivedCoordinate H).obj.obj (Supplier.derivedCoordinate D).obj.obj
  adjoint : AdjointComponentIso H D
  -- The canonical identifications of adjointDatum.coordinate with adjointCoordinate are
  -- R6 supplier comparisons. After these identifications this is the commuting square:
  induced : adjoint.coordinate.hom ≫ Supplier.adjointQuotientOfDerived H =
    Supplier.adjointQuotientOfDerived D ≫ derived.coordinate

def hodgeType (S : ℕ → shimuraDatum) (D : shimuraDatum) : Prop :=
  ∃ g : ℕ, 0 < g ∧ ∃ f : datumMorphism D (S g), Function.Surjective f.coordinate.hom
lemma hodgeTypeWitness (S : ℕ → shimuraDatum) (D : shimuraDatum) :
    hodgeType S D ↔ ∃ g : ℕ, 0 < g ∧ ∃ f : datumMorphism D (S g), Function.Surjective f.coordinate.hom := by sorry
lemma hodgeTypeIsomorphism (S : ℕ → shimuraDatum) (D E : shimuraDatum) (e : D ≅ E) :
    hodgeType S D ↔ hodgeType S E := by sorry
namespace Supplier
 def datumWeight (D : shimuraDatum) :
     CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj ⟶ gmCoordinate ℝ := sorry
end Supplier
-- S must be the actual Siegel models with their rational scalar weight; this supplier
-- qualification is omitted. The result is rational cocharacter descent, not centrality.
lemma hodgeTypeRationalWeight (S : ℕ → shimuraDatum) (D : shimuraDatum) (hD : hodgeType S D) :
    ∃ w : D.coordinate.obj ⟶ Supplier.gmCoordinate ℚ,
      CommHopfAlgCat.baseChangeMap (K := ℝ) w = Supplier.datumWeight D := by sorry

def abelianType (S : ℕ → shimuraDatum) (D : shimuraDatum) : Prop :=
  ∃ H : shimuraDatum, hodgeType S H ∧ Nonempty (AbelianTypeWitness H D)
lemma hodgeTypeAbelian (S : ℕ → shimuraDatum) (D : shimuraDatum) (h : hodgeType S D) : abelianType S D := by sorry
lemma abelianTypeIsomorphism (S : ℕ → shimuraDatum) (D E : shimuraDatum) (e : D ≅ E) :
    abelianType S D ↔ abelianType S E := by sorry
lemma abelianTypeCentral (S : ℕ → shimuraDatum) (D E : shimuraDatum)
    (e : AbelianTypeWitness D E) (e' : AbelianTypeWitness E D) :
    abelianType S D ↔ abelianType S E := by sorry

def preabelianType (S : ℕ → shimuraDatum) (D : shimuraDatum) : Prop :=
  ∃ H : shimuraDatum, hodgeType S H ∧ Nonempty (AdjointComponentIso H D)
lemma abelianTypePreabelian (S : ℕ → shimuraDatum) (D : shimuraDatum) : abelianType S D → preabelianType S D := by sorry
lemma preabelianTypeAdjoint (S : ℕ → shimuraDatum) (D E : shimuraDatum) (e : AdjointComponentIso D E) :
    preabelianType S D ↔ preabelianType S E := by sorry
lemma preabelianTypeIsomorphism (S : ℕ → shimuraDatum) (D E : shimuraDatum) (e : AdjointComponentIso D E) :
    preabelianType S D ↔ preabelianType S E := by sorry
lemma typeImplications (S : ℕ → shimuraDatum) (D : shimuraDatum) :
    (hodgeType S D → abelianType S D) ∧ (abelianType S D → preabelianType S D) := by sorry
-- Type tests are instantiated on the D5 models below.

namespace Supplier
abbrev Cocharacter (O : CommHopfAlgCat ℚ) :=
  CommHopfAlgCat.baseChange (K := Qbar) O ⟶ gmCoordinate Qbar
-- R4/R7 supply the conjugation and algebraic Galois actions and their compatibility.
def cocharacterConjugation (O : CommHopfAlgCat ℚ) : MulAction (Points O Qbar) (Cocharacter O) := sorry
attribute [instance] cocharacterConjugation
abbrev CocharacterClass (O : CommHopfAlgCat ℚ) := Quotient (MulAction.orbitRel (Points O Qbar) (Cocharacter O))
def classGaloisAction (O : CommHopfAlgCat ℚ) : MulAction (Qbar ≃ₐ[ℚ] Qbar) (CocharacterClass O) := sorry
attribute [instance] classGaloisAction
def muClass {O : CommHopfAlgCat ℚ} (μ : Cocharacter O) : CocharacterClass O := Quotient.mk _ μ
def classFromS {O : CommHopfAlgCat ℚ} (h : RealSMap O) : CocharacterClass O := sorry
-- The underlying filtration at x is the one of restrictRepresentation O ρ h_x.
-- Native R7/L8 supply the algebraic parabolic, flag manifold and comparison to the
-- homogeneous quotient. The period map here is that constructed map, not arbitrary f.
def flagParabolic (D : shimuraDatum)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj)) :
    Subgroup (Points D.coordinate.obj ℂ) := sorry
def complexPointTopology (O : CommHopfAlgCat ℚ) : TopologicalSpace (Points O ℂ) := sorry
attribute [instance] complexPointTopology
def flagDimension (D : shimuraDatum) : ℕ := sorry
def flagAtlas (D : shimuraDatum)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj)) :
    ComplexManifoldOn (compactDual (Points D.coordinate.obj ℂ) (flagParabolic D ρ)) (flagDimension D) := sorry
def periodMap (D : shimuraDatum)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj)) :
    datumDomain D → compactDual (Points D.coordinate.obj ℂ) (flagParabolic D ρ) := sorry
def representationPointAction (D : shimuraDatum)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj)) :
    Points D.coordinate.obj ℂ →* ((ℂ ⊗[ℝ] ρ) ≃ₗ[ℂ] (ℂ ⊗[ℝ] ρ)) := sorry
end Supplier
lemma borelTangent (D : shimuraDatum)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj))
    (faithful : Function.Injective (Supplier.representationPointAction D ρ))
    (x : Supplier.datumDomain D) :
    letI := (Supplier.datumAtlas D).charts
    letI := (Supplier.flagAtlas D ρ).charts
    ∃ e : TangentSpace (𝓘(ℂ, ComplexModel (Supplier.datumDimension D))) x ≃ₗ[ℂ]
        TangentSpace (𝓘(ℂ, ComplexModel (Supplier.flagDimension D))) (Supplier.periodMap D ρ x),
      e.toLinearMap = (mfderiv (𝓘(ℂ, ComplexModel (Supplier.datumDimension D)))
        (𝓘(ℂ, ComplexModel (Supplier.flagDimension D))) (Supplier.periodMap D ρ) x).toLinearMap := by sorry
-- SV1 and the central (not necessarily rational) weight are essential omitted conditions.
-- The filtration plus canonical conjugation recovers all types in each constant weight
-- summand; faithfulness recovers the algebraic S-action. No injectivity is assumed here.
lemma borelInjective (D : shimuraDatum)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj))
    (faithful : Function.Injective (Supplier.representationPointAction D ρ)) :
    Function.Injective (Supplier.periodMap D ρ) := by sorry
lemma borelEmbedding (D : shimuraDatum)
    (ρ : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj))
    (faithful : Function.Injective (Supplier.representationPointAction D ρ)) :
    Topology.IsOpenEmbedding (Supplier.periodMap D ρ) ∧
      Holomorphic (Supplier.datumAtlas D) (Supplier.flagAtlas D ρ) (Supplier.periodMap D ρ) := by sorry

/- D5: generated eigenvalue subgroups, not a condition on individual eigenvalues. -/
def neat (eigenvalues : Set ℂˣ) : Prop :=
  ∀ u ∈ Subgroup.closure eigenvalues, ∀ n : ℕ, 0 < n → u^n = 1 → u = 1
lemma neatIdentity : neat {1} := by sorry
lemma neatSubgroup (A B : Set ℂˣ) (h : A ⊆ Subgroup.closure B) (hB : neat B) : neat A := by sorry
-- Algebraic tensor-generation of representations supplies these two inclusions.
lemma neatRepresentation (A B : Set ℂˣ)
    (hAB : A ⊆ Subgroup.closure B) (hBA : B ⊆ Subgroup.closure A) : neat A ↔ neat B := by sorry
-- TauCeti.Shimura.tests.neatOne
example : neat {(1 : ℂˣ)} := by sorry
-- TauCeti.Shimura.tests.neatMinusOne
example : ¬ neat {(-1 : ℂˣ)} := by sorry
-- TauCeti.Shimura.tests.neatProductEigenvalues
example : ¬ neat {(2 : ℂˣ), -(2 : ℂˣ)⁻¹} ∧
    (∀ n : ℕ, 0 < n → (2 : ℂˣ)^n ≠ 1) ∧
    (∀ n : ℕ, 0 < n → (-(2 : ℂˣ)⁻¹)^n ≠ 1) := by sorry
lemma neatRepresentationIndependence (A B : Set ℂˣ)
    (hAB : A ⊆ Subgroup.closure B) (hBA : B ⊆ Subgroup.closure A) : neat A ↔ neat B := by sorry

-- Rational/adelic point maps and compact openness of K are supplier conditions omitted here.
def neatLevel {Q A : Type*} [Group Q] [Group A] (ι : Q →* A)
    (eigen : Q → Set ℂˣ) (K : Subgroup A) : Prop :=
  ∀ a : A, ∀ q : Q, a⁻¹ * ι q * a ∈ K → neat (eigen q)
lemma neatLevelConjugate {Q A : Type*} [Group Q] [Group A] (ι : Q →* A)
    (eigen : Q → Set ℂˣ) (K : Subgroup A) (a : A) :
    neatLevel ι eigen (K.map (MulAut.conj a).toMonoidHom) ↔ neatLevel ι eigen K := by sorry
lemma neatLevelShrink {Q A : Type*} [Group Q] [Group A] (ι : Q →* A)
    (eigen : Q → Set ℂˣ) (K L : Subgroup A) (h : L ≤ K) :
    neatLevel ι eigen K → neatLevel ι eigen L := by sorry
lemma neatLevelGamma {Q A : Type*} [Group Q] [Group A] (ι : Q →* A)
    (eigen : Q → Set ℂˣ) (K : Subgroup A) (h : neatLevel ι eigen K) (a : A) :
    ∀ q ∈ K.comap ((MulAut.conj a⁻¹).toMonoidHom.comp ι), neat (eigen q) := by sorry
abbrev RationalFiniteAdeles := IsDedekindDomain.FiniteAdeleRing ℤ ℚ
abbrev RationalAdelicGl2 := Matrix.GeneralLinearGroup (Fin 2) RationalFiniteAdeles
def rationalGl2Diagonal : Matrix.GeneralLinearGroup (Fin 2) ℚ →* RationalAdelicGl2 :=
  Matrix.GeneralLinearGroup.map (algebraMap ℚ RationalFiniteAdeles)
def rationalGl2Eigenvalues (M : Matrix.GeneralLinearGroup (Fin 2) ℚ) : Set ℂˣ :=
  {u | ((M : Matrix (Fin 2) (Fin 2) ℚ).map (algebraMap ℚ ℂ)).charpoly.IsRoot (u : ℂ)}
namespace Supplier
 -- AA.1 supplies GL₂(Ẑ): both a matrix and its inverse are integral at every finite place.
 def gl2IntegralAdelic : Subgroup RationalAdelicGl2 := sorry
 -- AA.1 supplies the reduction kernel GL₂(Ẑ) → GL₂(ℤ/Nℤ), as a subgroup of GL₂(𝔸f).
 -- The integrality/reduction comparison and compact openness are omitted supplier conditions.
 def gl2PrincipalLevel (N : ℕ) : Subgroup RationalAdelicGl2 := sorry
end Supplier
-- Principal-level congruence uses the D5 calculation and AA.3 rational lattice comparison.
-- V0 is a downstream arithmeticity consumer; the signature retains its N≥3 input.
-- TauCeti.Shimura.tests.levelPrincipal
example : neatLevel rationalGl2Diagonal rationalGl2Eigenvalues (Supplier.gl2PrincipalLevel 3) := by sorry
-- TauCeti.Shimura.tests.levelFullGl2False
example : ¬ neatLevel rationalGl2Diagonal rationalGl2Eigenvalues Supplier.gl2IntegralAdelic := by sorry
-- TauCeti.Shimura.tests.levelConjugate
example {Q A : Type*} [Group Q] [Group A] (ι : Q →* A) (eigen : Q → Set ℂˣ)
    (K : Subgroup A) (h : neatLevel ι eigen K) (a : A) :
    neatLevel ι eigen (K.map (MulAut.conj a).toMonoidHom) := by sorry

-- Local generated eigenvalue subgroups are pulled back to Qbarˣ by compatible embeddings.
def adelicNeat {ι : Type*} (localGroups : ι → Subgroup Qbarˣ) : Prop :=
  ∀ u ∈ ⨅ i, localGroups i, ∀ n : ℕ, 0 < n → u^n = 1 → u = 1
lemma adelicNeatRational {ι : Type*} [Nonempty ι] (L : ι → Subgroup Qbarˣ)
    (R : Subgroup Qbarˣ) (h : ∀ i, R ≤ L i) (hL : adelicNeat L) :
    ∀ u ∈ R, ∀ n : ℕ, 0 < n → u^n = 1 → u = 1 := by sorry
lemma adelicNeatConjugate {ι : Type*} (L M : ι → Subgroup Qbarˣ)
    (h : ∀ i, L i = M i) : adelicNeat L ↔ adelicNeat M := by sorry
lemma primeToPNeatInsert {ι : Type*} (L : ι → Subgroup Qbarˣ) (P : Subgroup Qbarˣ)
    (h : adelicNeat L) : adelicNeat (fun i : Option ι => i.elim P L) := by sorry
-- TauCeti.Shimura.tests.adelicIdentity
example : adelicNeat (fun _ : Unit => (⊥ : Subgroup Qbarˣ)) := by sorry
-- TauCeti.Shimura.tests.adelicRationalMinusOne
example : ¬ adelicNeat (fun _ : Unit => Subgroup.closure {(-1 : Qbarˣ)}) := by sorry
-- TauCeti.Shimura.tests.primeToPInsert
example (P : Subgroup Qbarˣ) : adelicNeat (fun i : Option Unit => i.elim P (fun _ => ⊥)) := by sorry

-- Stabilizer of the supplied component is an actual subgroup; real-adjoint identification omitted.
def componentSubgroup {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (a : A) (C : Set X) : Subgroup Q :=
  (MulAction.stabilizer Q C) ⊓ K.comap ((MulAut.conj a⁻¹).toMonoidHom.comp ι)
lemma componentGammaMem {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (a : A) (C : Set X) (q : Q) :
    q ∈ componentSubgroup ι K a C ↔ q • C = C ∧ a⁻¹ * ι q * a ∈ K := by sorry
lemma componentGammaShrink {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K L : Subgroup A) (a : A) (C : Set X) (h : L ≤ K) :
    componentSubgroup ι L a C ≤ componentSubgroup ι K a C := by sorry
lemma componentGammaRepresentative {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (a : A) (C : Set X) (q : Q)
    (hq : q • C = C) (k : K) :
    componentSubgroup ι K (ι q * a * k) C =
      (componentSubgroup ι K a C).map (MulAut.conj q).toMonoidHom := by sorry
-- Determinant positivity is the component condition; principal congruence uses the D5
-- calculation with the AA.3 lattice comparison, before downstream V0 arithmeticity.
-- TauCeti.Shimura.tests.gammaTorus
example {Q A : Type*} [Group Q] [Group A] (ι : Q →* A) (K : Subgroup A) :
    componentSubgroup (X := Unit) ι K 1 Set.univ = K.comap ι := by sorry
-- TauCeti.Shimura.tests.gammaConjugate
example {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (a : A) (C : Set X) (q : Q) (hq : q • C = C) :
    componentSubgroup ι K (ι q * a) C = (componentSubgroup ι K a C).map (MulAut.conj q).toMonoidHom := by sorry
lemma effectiveKernel {Γ X : Type*} [Group Γ] [MulAction Γ X] (γ : Γ) :
    γ ∈ (MulAction.toPermHom Γ X).ker ↔ ∀ x : X, γ • x = x := by sorry
-- The effective image is an algebraic quotient over ℝ, not an arbitrary group homomorphism.
-- R1 supplies algebraic tensor-generation/eigenvalue comparison for subfields of ℂ.
namespace Supplier
 def rationalEigenvalues (O : FiniteTypeCommHopfAlgCat ℚ)
     (ρ : FGComoduleCat ℚ O.obj) (q : Points O.obj ℚ) : Set ℂˣ := sorry
 def realEigenvalues (P : FiniteTypeCommHopfAlgCat ℝ)
     (ρ : FGComoduleCat ℝ P.obj) (q : WithConv (P.obj →ₐ[ℝ] ℝ)) : Set ℂˣ := sorry
 def realPointMap {O P : CommHopfAlgCat ℝ} (f : P ⟶ O) :
     WithConv (O →ₐ[ℝ] ℝ) →* WithConv (P →ₐ[ℝ] ℝ) := sorry
 def scalarPoints (O : CommHopfAlgCat ℚ) :
     Points O ℚ →* WithConv ((CommHopfAlgCat.baseChange (K := ℝ) O) →ₐ[ℝ] ℝ) := sorry
 def rationalRepresentationPoints (O : CommHopfAlgCat ℚ) (ρ : FGComoduleCat ℚ O) :
     Points O ℚ →* (ρ ≃ₗ[ℚ] ρ) := sorry
 def realRepresentationPoints (O : CommHopfAlgCat ℝ) (ρ : FGComoduleCat ℝ O) :
     WithConv (O →ₐ[ℝ] ℝ) →* (ρ ≃ₗ[ℝ] ρ) := sorry
end Supplier
-- Discreteness and properness supply finite stabilizers; those analytic leaves remain explicit.
lemma effectiveFree (O : FiniteTypeCommHopfAlgCat ℚ) (P : FiniteTypeCommHopfAlgCat ℝ)
    (q : P.obj ⟶ CommHopfAlgCat.baseChange (K := ℝ) O.obj)
    (ρ : FGComoduleCat ℚ O.obj) (ρ' : FGComoduleCat ℝ P.obj)
    (faithful : Function.Injective (Supplier.rationalRepresentationPoints O.obj ρ))
    (faithful' : Function.Injective (Supplier.realRepresentationPoints P.obj ρ'))
    (Γ : Subgroup (Supplier.Points O.obj ℚ))
    (hneat : ∀ γ : Γ, neat (Supplier.rationalEigenvalues O ρ γ))
    (X : Type*) [MulAction (Γ.map ((Supplier.realPointMap q).comp (Supplier.scalarPoints O.obj))) X]
    (finiteStab : ∀ x : X, Finite (MulAction.stabilizer
      (Γ.map ((Supplier.realPointMap q).comp (Supplier.scalarPoints O.obj))) x)) :
    ∀ x : X, MulAction.stabilizer
      (Γ.map ((Supplier.realPointMap q).comp (Supplier.scalarPoints O.obj))) x = ⊥ := by sorry

-- R4 supplies rational torus groups; RG2.0a supplies S and its real points.
def torusDatum (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj) : shimuraDatum :=
  pointDatumOfHom T.obj (by sorry) (MulEquiv.refl _) h
lemma torusDomain (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj) :
    (torusDatum T h).orbit.X = {Supplier.realSPoints h} ∧
      Supplier.datumDimension (torusDatum T h) = 0 := by sorry
lemma torusReflex (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj) :
    reflexField (Supplier.classFromS h) = IntermediateField.fixedField
      (MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) (Supplier.classFromS h)) := by sorry
lemma torusMap (T U : TorusCommHopfAlgCat ℚ)
    (h : Supplier.RealSMap T.obj.obj) (k : Supplier.RealSMap U.obj.obj)
    (f : U.obj.obj ⟶ T.obj.obj) :
    (∃ m : datumMorphism (torusDatum T h) (torusDatum U k), m.coordinate = f) ↔
      CommHopfAlgCat.baseChangeMap (K := ℝ) f ≫ h = k := by sorry
namespace Supplier
 def trivialTorus : TorusCommHopfAlgCat ℚ := sorry
 def trivialSMap : RealSMap trivialTorus.obj.obj := sorry
 def normTorus : TorusCommHopfAlgCat ℚ := sorry
 def normSMap : RealSMap normTorus.obj.obj := sorry
end Supplier
-- TauCeti.Shimura.tests.torusTrivial
example : Subsingleton (Supplier.datumDomain (torusDatum Supplier.trivialTorus Supplier.trivialSMap)) := by sorry
-- TauCeti.Shimura.tests.torusNorm
example : reflexField (Supplier.classFromS Supplier.normSMap) = ⊥ := by sorry

-- CM.0 supplies CM field/type data. These are actual subsets of algebraic embeddings.
-- No CM.0 dependency enters D1 or D4; their elliptic endomorphism calculation is separate.
namespace Supplier
 -- CM.0 supplies the algebraic closure in C and its canonical complex conjugation.
 def qbarEmbedding : Qbar →ₐ[ℚ] ℂ := sorry
 def qbarConjugation : Qbar ≃ₐ[ℚ] Qbar := sorry
 lemma qbarConjugation_realization (x : Qbar) :
     qbarEmbedding (qbarConjugation x) = star (qbarEmbedding x) := by sorry
 structure CMType where
   field : IntermediateField ℚ Qbar
   finite : FiniteDimensional ℚ field
   realSubfield : IntermediateField ℚ field
   quadratic : Module.finrank realSubfield field = 2
   totallyReal : ∀ e : realSubfield →ₐ[ℚ] ℂ, ∀ x, (e x).im = 0
   totallyImaginary : ∀ e : field →ₐ[ℚ] ℂ, ∃ x, (e x).im ≠ 0
   embeddings : Finset (field →ₐ[ℚ] Qbar)
   choosesPair : ∀ e, (e ∈ embeddings ↔ qbarConjugation.toAlgHom.comp e ∉ embeddings)
 attribute [instance] CMType.finite
 def cmTorusCoordinate (Φ : CMType) : TorusCommHopfAlgCat ℚ := sorry
 def cmSMap (Φ : CMType) : RealSMap (cmTorusCoordinate Φ).obj.obj := sorry
 def cmMu (Φ : CMType) : Cocharacter (cmTorusCoordinate Φ).obj.obj := sorry
 def conjugateCMType (Φ : CMType) : CMType :=
   { Φ with embeddings := Φ.embeddings.map ⟨fun e => qbarConjugation.toAlgHom.comp e, by sorry⟩
            choosesPair := by sorry }
 def qbarI : Qbar := sorry
 lemma qbarI_realization : qbarEmbedding qbarI = Complex.I := by sorry
 def imaginaryQuadraticField : IntermediateField ℚ Qbar := IntermediateField.adjoin ℚ {qbarI}
 def imaginaryQuadraticType : CMType :=
   { field := imaginaryQuadraticField
     finite := by sorry
     realSubfield := ⊥
     quadratic := by sorry
     totallyReal := by sorry
     totallyImaginary := by sorry
     embeddings := sorry
     choosesPair := by sorry }
 def cmTypeGaloisAction (Φ : CMType) (σ : Qbar ≃ₐ[ℚ] Qbar) :
     Finset (Φ.field →ₐ[ℚ] Qbar) := Φ.embeddings.map ⟨fun e => σ.toAlgHom.comp e, by sorry⟩
 def cmSplitEvaluation (Φ : CMType) (μ : Cocharacter (cmTorusCoordinate Φ).obj.obj)
     (e : Φ.field →ₐ[ℚ] Qbar) : ℤ := sorry
end Supplier
def cmTorus (Φ : Supplier.CMType) : shimuraDatum :=
  torusDatum (Supplier.cmTorusCoordinate Φ) (Supplier.cmSMap Φ)
lemma cmTorusMu (Φ : Supplier.CMType) (e : Φ.field →ₐ[ℚ] Qbar) :
    Supplier.cmSplitEvaluation Φ (Supplier.cmMu Φ) e = if e ∈ Φ.embeddings then 1 else 0 := by sorry
lemma cmTorusReflex (Φ : Supplier.CMType) (σ : Qbar ≃ₐ[ℚ] Qbar) :
    σ ∈ MulAction.stabilizer (Qbar ≃ₐ[ℚ] Qbar) (Supplier.classFromS (Supplier.cmSMap Φ)) ↔
      Supplier.cmTypeGaloisAction Φ σ = Φ.embeddings := by sorry
lemma cmTorusSpecial (Φ : Supplier.CMType) :
    specialPoint (cmTorus Φ) (Supplier.realSPoints (Supplier.cmSMap Φ)) := by sorry
-- TauCeti.Shimura.tests.torusCm
example : reflexField (Supplier.classFromS (Supplier.cmSMap Supplier.imaginaryQuadraticType)) =
    Supplier.imaginaryQuadraticField ∧ Supplier.imaginaryQuadraticField ≠ ⊥ := by sorry
-- TauCeti.Shimura.tests.cmImaginaryQuadratic
example : reflexField (Supplier.classFromS (Supplier.cmSMap Supplier.imaginaryQuadraticType)) =
    Supplier.imaginaryQuadraticField := by sorry
-- TauCeti.Shimura.tests.cmConjugateType
example : reflexField (Supplier.classFromS (Supplier.cmSMap
    (Supplier.conjugateCMType Supplier.imaginaryQuadraticType))) = Supplier.imaginaryQuadraticField := by sorry
-- TauCeti.Shimura.tests.cmWeight
example (Φ : Supplier.CMType) : ∃ w : (Supplier.cmTorusCoordinate Φ).obj.obj ⟶ Supplier.gmCoordinate ℚ,
    CommHopfAlgCat.baseChangeMap (K := ℝ) w = Supplier.weightMap (Supplier.cmSMap Φ) := by sorry

-- Homology convention: J(x,y)=(y,-x), h(a+bi)=aI+bJ.
def gl2Matrix (z : ℂ) : Matrix (Fin 2) (Fin 2) ℝ := !![z.re,z.im; -z.im,z.re]
def gl2Hom : ℂˣ →* Matrix.GeneralLinearGroup (Fin 2) ℝ where
  toFun z := { val := gl2Matrix (z : ℂ)
               inv := gl2Matrix ((z⁻¹ : ℂˣ) : ℂ)
               val_inv := by sorry
               inv_val := by sorry }
  map_one' := by sorry
  map_mul' := by sorry
namespace Supplier
 abbrev gl2Coordinate := GeneralLinear.finiteTypeCoordinateHopfAlgebra ℚ 2
 def gl2Reductive : reductiveCommHopfAlgProperty ℚ gl2Coordinate := by sorry
 def gl2Points : Matrix.GeneralLinearGroup (Fin 2) ℝ ≃* Points gl2Coordinate.obj ℝ := sorry
 def gl2SMap : RealSMap gl2Coordinate.obj := sorry
 def gl2Mu : Cocharacter gl2Coordinate.obj := sorry
 -- R0/R7's point evaluation of the algebraic cocharacter under the standard GL₂ comparison.
 def gl2CocharacterMatrix (μ : Cocharacter gl2Coordinate.obj) (z : Qbarˣ) :
     Matrix (Fin 2) (Fin 2) Qbar := sorry
 def gl2AdjointRep : SRep := sorry
 def projectiveTopology : TopologicalSpace (Projectivization ℂ (Fin 2 → ℂ)) := sorry
 def datumDual (D : shimuraDatum) : TopCat := sorry
 def datumDualScheme (D : shimuraDatum) : AlgebraicGeometry.Scheme := sorry
 def datumDualDimension (D : shimuraDatum) : ℕ := sorry
end Supplier
attribute [local instance] Supplier.projectiveTopology
-- Supplier compatibility: gl2Coordinate is the pinned coordinate Hopf algebra for n=2,
-- gl2Points (gl2Hom z)=realSPoints gl2SMap z, and gl2Mu(z)=diag(z,1).
def gl2Datum : shimuraDatum := pointDatumOfHom Supplier.gl2Coordinate
  Supplier.gl2Reductive Supplier.gl2Points Supplier.gl2SMap
-- TauCeti.Shimura.tests.classGl2
example (μ : Supplier.Cocharacter Supplier.gl2Coordinate.obj)
    (hμ : μ ∈ cocharacterClass Supplier.gl2Mu) (z : Qbarˣ) :
    (Supplier.gl2CocharacterMatrix μ z).charpoly =
      (Polynomial.X - Polynomial.C (z : Qbar)) * (Polynomial.X - Polynomial.C 1) := by sorry
abbrev HalfPlanes := {z : ℂ // z.im ≠ 0}
lemma gl2Domain : Nonempty (Supplier.datumDomain gl2Datum ≃ₜ HalfPlanes) ∧
    Supplier.datumDimension gl2Datum = 1 ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain gl2Datum)) = 2 := by sorry
lemma gl2ReflexDual : reflexField (Supplier.classFromS Supplier.gl2SMap) = ⊥ ∧
    Nonempty (Supplier.datumDual gl2Datum ≃ₜ Projectivization ℂ (Fin 2 → ℂ)) ∧
    Supplier.datumDualDimension gl2Datum = 1 := by sorry
lemma gl2Determinant (z : ℂ) : (gl2Matrix z).det = z.re^2 + z.im^2 := by sorry
-- TauCeti.Shimura.tests.gl2AtI
example : gl2Matrix Complex.I = !![0,1; -1,0] ∧
    Supplier.datumDimension gl2Datum = 1 := by sorry
-- TauCeti.Shimura.tests.gl2Negative
example : mobius !![1,0; 0,-1] Complex.I = -Complex.I ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain gl2Datum)) = 2 := by sorry
lemma gl2Types : Module.finrank ℂ (representationPiece Supplier.gl2AdjointRep (-1) 1) = 1 ∧
    Module.finrank ℂ (representationPiece Supplier.gl2AdjointRep 0 0) = 2 ∧
    Module.finrank ℂ (representationPiece Supplier.gl2AdjointRep 1 (-1)) = 1 ∧
    ∀ p q, p+q ≠ 0 ∨ 1 < |p| → representationPiece Supplier.gl2AdjointRep p q = ⊥ := by sorry
lemma gl2Scalar (t : ℝ) : gl2Matrix (t : ℂ) = t • (1 : Matrix (Fin 2) (Fin 2) ℝ) := by sorry

-- Standard symplectic coordinates V=ℝ^g×ℝ^g.
def standardPsi (g : ℕ) (x y : (Fin g → ℝ) × (Fin g → ℝ)) : ℝ :=
  ∑ i, (x.1 i * y.2 i - x.2 i * y.1 i)
def standardJ (g : ℕ) : Module.End ℝ ((Fin g → ℝ) × (Fin g → ℝ)) where
  toFun x := (x.2,-x.1)
  map_add' := by sorry
  map_smul' := by sorry
def siegelLinearMap (g : ℕ) (a b : ℝ) : Module.End ℝ ((Fin g → ℝ) × (Fin g → ℝ)) :=
  a • LinearMap.id + b • standardJ g
def realSiegelGroup (g : ℕ) : Subgroup
    (((Fin g → ℝ) × (Fin g → ℝ)) ≃ₗ[ℝ] ((Fin g → ℝ) × (Fin g → ℝ))) where
  carrier := {a | ∃ c : ℝˣ, ∀ x y, standardPsi g (a x) (a y) = (c : ℝ) * standardPsi g x y}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
def siegelHom (g : ℕ) : ℂˣ →* realSiegelGroup g where
  toFun z := ⟨{ toLinearMap := siegelLinearMap g (z : ℂ).re (z : ℂ).im
                invFun := siegelLinearMap g ((z⁻¹ : ℂˣ) : ℂ).re ((z⁻¹ : ℂˣ) : ℂ).im
                left_inv := by sorry
                right_inv := by sorry }, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry
namespace Supplier
 def gspCoordinate (g : ℕ) : FiniteTypeCommHopfAlgCat ℚ := sorry
 def gspReductive (g : ℕ) : reductiveCommHopfAlgProperty ℚ (gspCoordinate g) := by sorry
 def gspPoints (g : ℕ) : realSiegelGroup g ≃* Points (gspCoordinate g).obj ℝ := sorry
 def siegelSMap (g : ℕ) : RealSMap (gspCoordinate g).obj := sorry
 def siegelMu (g : ℕ) : Cocharacter (gspCoordinate g).obj := sorry
 def siegelAdjointRep (g : ℕ) : SRep := sorry
end Supplier
def siegelDatum (g : ℕ) : shimuraDatum := pointDatumOfHom (Supplier.gspCoordinate g)
  (Supplier.gspReductive g) (Supplier.gspPoints g) (Supplier.siegelSMap g)
def PositiveImaginary (g : ℕ) (Z : Matrix (Fin g) (Fin g) ℂ) : Prop :=
  ∀ x : Fin g → ℝ, x ≠ 0 → 0 < ∑ i, ∑ j, x i * (Z i j).im * x j
abbrev SiegelHalfSpaces (g : ℕ) := {Z : Matrix (Fin g) (Fin g) ℂ //
  Z.transpose = Z ∧ (PositiveImaginary g Z ∨ PositiveImaginary g (-Z))}
lemma siegelSimilitude (g : ℕ) (a b : ℝ) (x y : (Fin g → ℝ) × (Fin g → ℝ)) :
    standardPsi g (siegelLinearMap g a b x) (siegelLinearMap g a b y) = (a^2+b^2)*standardPsi g x y := by sorry
lemma siegelGeometry (g : ℕ) (hg : 0 < g) :
    Nonempty (Supplier.datumDomain (siegelDatum g) ≃ₜ SiegelHalfSpaces g) ∧
      Supplier.datumDimension (siegelDatum g) = g*(g+1)/2 ∧
      Nat.card (ConnectedComponents (Supplier.datumDomain (siegelDatum g))) = 2 := by sorry
lemma standardJSquare (g : ℕ) : (standardJ g).comp (standardJ g) = -LinearMap.id := by sorry
lemma siegelReflex (g : ℕ) : reflexField (Supplier.classFromS (Supplier.siegelSMap g)) = ⊥ := by sorry
-- TauCeti.Shimura.tests.gl2RankOneSiegel
example : Nonempty (gl2Datum ≅ siegelDatum 1) := by sorry
-- TauCeti.Shimura.tests.siegelGenusOne
example : Nonempty (Supplier.datumDomain (siegelDatum 1) ≃ₜ HalfPlanes) ∧
    Supplier.datumDimension (siegelDatum 1) = 1 := by sorry
-- TauCeti.Shimura.tests.siegelGenusTwo
example : Supplier.datumDimension (siegelDatum 2) = 3 := by sorry
-- TauCeti.Shimura.tests.siegelBothSigns
example : ∃ Z : SiegelHalfSpaces 2, ∃ W : SiegelHalfSpaces 2,
    PositiveImaginary 2 Z.val ∧ PositiveImaginary 2 (-W.val) := by sorry
-- The algebraic Lie(GSp) comparison is an R6 leaf; these pieces are its actual adjoint S-coaction.
lemma siegelLieTypes (g : ℕ) (hg : 0 < g) :
    Module.finrank ℂ (representationPiece (Supplier.siegelAdjointRep g) (-1) 1) = g*(g+1)/2 ∧
    Module.finrank ℂ (representationPiece (Supplier.siegelAdjointRep g) 0 0) = g*g+1 ∧
    Module.finrank ℂ (representationPiece (Supplier.siegelAdjointRep g) 1 (-1)) = g*(g+1)/2 ∧
    ∀ p q, (p,q) ∉ ({(-1,1),(0,0),(1,-1)} : Set (ℤ×ℤ)) →
      representationPiece (Supplier.siegelAdjointRep g) p q = ⊥ := by sorry
-- Tangent/flag schemes are supplied by R7. This isotropic carrier distinguishes GSp from GL.
def complexPsi (g : ℕ) (x y : (Fin g → ℂ) × (Fin g → ℂ)) : ℂ :=
  ∑ i, (x.1 i*y.2 i-x.2 i*y.1 i)
abbrev LagrangianGrassmannian (g : ℕ) :=
  {L : Submodule ℂ ((Fin g → ℂ) × (Fin g → ℂ)) //
    Module.finrank ℂ L = g ∧ ∀ x ∈ L, ∀ y ∈ L, complexPsi g x y = 0}
namespace Supplier
 def lagrangianTopology (g : ℕ) : TopologicalSpace (LagrangianGrassmannian g) := sorry
end Supplier
attribute [local instance] Supplier.lagrangianTopology
lemma siegelReflexDual (g : ℕ) (hg : 0 < g) :
    reflexField (Supplier.classFromS (Supplier.siegelSMap g)) = ⊥ ∧
    Nonempty (Supplier.datumDual (siegelDatum g) ≃ₜ LagrangianGrassmannian g) ∧
    Supplier.datumDualDimension (siegelDatum g) = g*(g+1)/2 := by sorry

-- RG2.0a supplies affine restriction of scalars; R7/D3 supply the projective flag variety.
namespace Supplier
 structure TotallyRealField where
   field : IntermediateField ℚ Qbar
   finite : FiniteDimensional ℚ field
   totallyReal : ∀ e : field →ₐ[ℚ] ℂ, ∀ x, (e x).im = 0
 attribute [instance] TotallyRealField.finite
 abbrev RealEmbeddings (F : TotallyRealField) := F.field →ₐ[ℚ] ℝ
 def embeddingsFintype (F : TotallyRealField) : Fintype (RealEmbeddings F) := by infer_instance
 attribute [local instance] embeddingsFintype
 def hilbertCoordinate (F : TotallyRealField) : FiniteTypeCommHopfAlgCat ℚ := sorry
 def hilbertReductive (F : TotallyRealField) : reductiveCommHopfAlgProperty ℚ (hilbertCoordinate F) := by sorry
 def hilbertSMap (F : TotallyRealField) : RealSMap (hilbertCoordinate F).obj := sorry
 def hilbertPoints (F : TotallyRealField) : (RealEmbeddings F → Matrix.GeneralLinearGroup (Fin 2) ℝ) ≃*
     Points (hilbertCoordinate F).obj ℝ := sorry
 def rationalField : TotallyRealField :=
   { field := ⊥
     finite := by sorry
     totallyReal := by sorry }
 def qbarSqrtTwo : Qbar := sorry
 lemma qbarSqrtTwo_realization : qbarEmbedding qbarSqrtTwo = (Real.sqrt 2 : ℂ) := by sorry
 def quadraticRealField : TotallyRealField :=
   { field := IntermediateField.adjoin ℚ {qbarSqrtTwo}
     finite := by sorry
     totallyReal := by sorry }
 def rationalBasis (F : TotallyRealField) : Basis (Fin (Module.finrank ℚ F.field)) ℚ F.field := sorry
end Supplier
attribute [local instance] Supplier.embeddingsFintype
abbrev HilbertRealGroup (ι : Type) := ι → Matrix.GeneralLinearGroup (Fin 2) ℝ
def hilbertHom (ι : Type) : ℂˣ →* HilbertRealGroup ι where
  toFun z _ := gl2Hom z
  map_one' := by sorry
  map_mul' := by sorry
def hilbertDatum (F : Supplier.TotallyRealField) : shimuraDatum :=
  pointDatumOfHom (Supplier.hilbertCoordinate F) (Supplier.hilbertReductive F)
    (Supplier.hilbertPoints F) (Supplier.hilbertSMap F)
lemma hilbertDomain (F : Supplier.TotallyRealField) :
    Nonempty (Supplier.datumDomain (hilbertDatum F) ≃ₜ (Supplier.RealEmbeddings F → HalfPlanes)) ∧
    Supplier.datumDimension (hilbertDatum F) = Module.finrank ℚ F.field ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain (hilbertDatum F))) = 2^(Module.finrank ℚ F.field) := by sorry
-- The scheme comparison with nonaffine Res(P¹) remains the explicit representability gap.
lemma hilbertReflexDual (F : Supplier.TotallyRealField) :
    reflexField (Supplier.classFromS (Supplier.hilbertSMap F)) = ⊥ ∧
    Nonempty (Supplier.datumDual (hilbertDatum F) ≃ₜ
      (Supplier.RealEmbeddings F → Projectivization ℂ (Fin 2 → ℂ))) := by sorry
lemma hilbertDeterminantMap (F : Supplier.TotallyRealField) (z : ℂˣ) (i : Supplier.RealEmbeddings F) :
    (gl2Matrix (z : ℂ)).det = (z : ℂ).re^2 + (z : ℂ).im^2 := by sorry
-- TauCeti.Shimura.tests.hilbertRational
example : Nonempty (hilbertDatum Supplier.rationalField ≅ gl2Datum) := by sorry
-- TauCeti.Shimura.tests.hilbertQuadratic
example : Supplier.datumDimension (hilbertDatum Supplier.quadraticRealField) = 2 ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain (hilbertDatum Supplier.quadraticRealField))) = 4 := by sorry

def hilbertStarGroup (ι : Type) [Fintype ι] : Subgroup (HilbertRealGroup ι) :=
  { carrier := {M | ∃ c : ℝˣ, ∀ i, (M i).det = c}
    one_mem' := by sorry
    mul_mem' := by sorry
    inv_mem' := by sorry }
def hilbertStarHom (ι : Type) [Fintype ι] : ℂˣ →* hilbertStarGroup ι where
  toFun z := ⟨hilbertHom ι z, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry
namespace Supplier
 def hilbertStarCoordinate (F : TotallyRealField) : FiniteTypeCommHopfAlgCat ℚ := sorry
 def hilbertStarReductive (F : TotallyRealField) : reductiveCommHopfAlgProperty ℚ (hilbertStarCoordinate F) := by sorry
 def hilbertStarPoints (F : TotallyRealField) : hilbertStarGroup (RealEmbeddings F) ≃*
     Points (hilbertStarCoordinate F).obj ℝ := sorry
 def hilbertStarSMap (F : TotallyRealField) : RealSMap (hilbertStarCoordinate F).obj := sorry
end Supplier
def hilbertStarDatum (F : Supplier.TotallyRealField) : shimuraDatum :=
  pointDatumOfHom (Supplier.hilbertStarCoordinate F) (Supplier.hilbertStarReductive F)
    (Supplier.hilbertStarPoints F) (Supplier.hilbertStarSMap F)
abbrev SameSignHalfPlanes (F : Supplier.TotallyRealField) :=
  {z : Supplier.RealEmbeddings F → HalfPlanes //
    (∀ i, 0 < (z i).val.im) ∨ (∀ i, (z i).val.im < 0)}
lemma hilbertStarPoints (F : Supplier.TotallyRealField) (M : HilbertRealGroup (Supplier.RealEmbeddings F)) :
    M ∈ hilbertStarGroup (Supplier.RealEmbeddings F) ↔ ∃ c : ℝˣ, ∀ i, (M i).det = c := by sorry
lemma hilbertStarDomain (F : Supplier.TotallyRealField) :
    Nonempty (Supplier.datumDomain (hilbertStarDatum F) ≃ₜ SameSignHalfPlanes F) ∧
    Supplier.datumDimension (hilbertStarDatum F) = Module.finrank ℚ F.field ∧
    reflexField (Supplier.classFromS (Supplier.hilbertStarSMap F)) = ⊥ ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain (hilbertStarDatum F))) = 2 := by sorry
lemma hilbertStarInclusion (F : Supplier.TotallyRealField) :
    ∃ f : datumMorphism (hilbertStarDatum F) (hilbertDatum F),
      Function.Surjective f.coordinate.hom ∧ ∀ M, f.val M = M.val := by sorry
-- TauCeti.Shimura.tests.starRational
example : Nonempty (hilbertStarDatum Supplier.rationalField ≅ gl2Datum) := by sorry
-- TauCeti.Shimura.tests.starQuadratic
example : Supplier.datumDimension (hilbertStarDatum Supplier.quadraticRealField) = 2 ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain (hilbertStarDatum Supplier.quadraticRealField))) = 2 := by sorry
-- TauCeti.Shimura.tests.starMixedSignFalse
example (M : HilbertRealGroup (Fin 2)) (h0 : ((M 0).det : ℝ) = 1) (h1 : ((M 1).det : ℝ) = -1) :
    M ∉ hilbertStarGroup (Fin 2) := by sorry

section Trace
variable {F : Type*} [Field F] [Algebra ℚ F] [FiniteDimensional ℚ F]
def tracePsi (x y : F × F) : ℚ := Algebra.trace ℚ F (x.1*y.2-x.2*y.1)
lemma hilbertTraceForm (x : F × F) (hx : x ≠ 0) : ∃ y, tracePsi x y ≠ 0 := by sorry
def traceLinearAction (M : Matrix.GeneralLinearGroup (Fin 2) F) : (F×F) ≃ₗ[ℚ] (F×F) := sorry
lemma traceLinearSimilitude (M : Matrix.GeneralLinearGroup (Fin 2) F) (c : ℚ)
    (hc : (M.det : F) = algebraMap ℚ F c) (x y : F×F) :
    tracePsi (traceLinearAction M x) (traceLinearAction M y) = c * tracePsi x y := by sorry
lemma traceLinearFormula (M : Matrix.GeneralLinearGroup (Fin 2) F) (x : F×F) :
    traceLinearAction M x = ((M : Matrix _ _ F) 0 0*x.1+(M : Matrix _ _ F) 0 1*x.2,
      (M : Matrix _ _ F) 1 0*x.1+(M : Matrix _ _ F) 1 1*x.2) := by sorry
lemma traceLinearFaithful : Function.Injective (traceLinearAction (F := F)) := by sorry
-- TauCeti.Shimura.tests.hilbertNonHodge
example (M : Matrix.GeneralLinearGroup (Fin 2) Supplier.quadraticRealField.field)
    (hn : ∀ c : ℚ, (M.det : Supplier.quadraticRealField.field) ≠ algebraMap ℚ _ c) :
    ¬ ∃ c : ℚ, ∀ x y : Supplier.quadraticRealField.field × Supplier.quadraticRealField.field,
      tracePsi (traceLinearAction M x) (traceLinearAction M y) = c*tracePsi x y := by sorry
-- TauCeti.Shimura.tests.traceNonscalarFalse
example (M : Matrix.GeneralLinearGroup (Fin 2) F)
    (hn : ∀ c : ℚ, (M.det : F) ≠ algebraMap ℚ F c) :
    ¬ ∃ c : ℚ, ∀ x y : F×F,
      tracePsi (traceLinearAction M x) (traceLinearAction M y) = c*tracePsi x y := by sorry
end Trace

def hilbertTraceEmbedding (F : Supplier.TotallyRealField) :
    datumMorphism (hilbertStarDatum F) (siegelDatum (Module.finrank ℚ F.field)) := sorry
lemma traceEmbeddingSimilitude (F : Supplier.TotallyRealField)
    (M : hilbertStarGroup (Supplier.RealEmbeddings F)) (c : ℝˣ)
    (hc : ∀ i, (M.val i).det = c) (x y : (Fin (Module.finrank ℚ F.field) → ℝ) × (Fin (Module.finrank ℚ F.field) → ℝ)) :
    standardPsi _ (((hilbertTraceEmbedding F).val M).val x) (((hilbertTraceEmbedding F).val M).val y) =
      (c : ℝ)*standardPsi _ x y := by sorry
-- A rational symplectic basis need not take this point to the standard Siegel point.
-- It takes it into that full real conjugacy orbit, with positive trace polarization.
lemma traceEmbeddingHodge (F : Supplier.TotallyRealField) :
    ∃ k : realSiegelGroup (Module.finrank ℚ F.field),
      (hilbertTraceEmbedding F).val.comp (hilbertStarHom (Supplier.RealEmbeddings F)) =
        conjugateHom k (siegelHom (Module.finrank ℚ F.field)) := by sorry
lemma traceEmbeddingClosed (F : Supplier.TotallyRealField) :
    Function.Surjective (hilbertTraceEmbedding F).coordinate.hom ∧
      Function.Injective (hilbertTraceEmbedding F).val := by sorry
-- TauCeti.Shimura.tests.traceRational
example : Function.Bijective (hilbertTraceEmbedding Supplier.rationalField).val := by sorry
-- TauCeti.Shimura.tests.traceQuadratic
example : Supplier.datumDimension (hilbertStarDatum Supplier.quadraticRealField) = 2 ∧
    Supplier.datumDimension (siegelDatum 2) = 3 ∧
    Function.Injective (Supplier.datumDomainMap (hilbertTraceEmbedding Supplier.quadraticRealField)) := by sorry

-- Late example tests instantiate the D3/D4 interfaces on the D5 algebraic models.
namespace Supplier
 def ellipticBasis (τ : ℂ) (hτ : 0 < τ.im) : Matrix.GeneralLinearGroup (Fin 2) ℝ := sorry
 def normCoordinateMap : normTorus.obj.obj ⟶ (cmTorusCoordinate imaginaryQuadraticType).obj.obj := sorry
 def standardGroupRep (D : shimuraDatum) : FGComoduleCat ℝ
     (CommHopfAlgCat.baseChange (K := ℝ) D.coordinate.obj) := sorry
 def domainSMap (D : shimuraDatum) : datumDomain D → RealSMap D.coordinate.obj := sorry
 def onePoint : TopCat := TopCat.of Unit
 def onePointAtlas : ComplexManifoldOn onePoint 0 := sorry
 def trivialGroupRep : FGComoduleCat ℝ (CommHopfAlgCat.baseChange (K := ℝ) trivialTorus.obj.obj) := sorry
 -- Rational adjoint conjugation by diag(2,1), restricted to the upper component.
 def scalingAdjointComponent : AdjointComponentIso gl2Datum gl2Datum := sorry
 def datumDualAtlas (D : shimuraDatum) : ComplexManifoldOn (datumDual D) (datumDualDimension D) := sorry
 def standardLagrangian (g : ℕ) : LagrangianGrassmannian g :=
   ⟨LinearMap.range (LinearMap.inl ℂ (Fin g → ℂ) (Fin g → ℂ)), by sorry⟩
 def siegelFlagStabilizer (g : ℕ) : Subgroup (Points (gspCoordinate g).obj ℂ) := sorry
 def standardComplexRep (g : ℕ) : Points (gspCoordinate g).obj ℂ →*
     (((Fin g → ℂ) × (Fin g → ℂ)) ≃ₗ[ℂ] ((Fin g → ℂ) × (Fin g → ℂ))) := sorry
end Supplier
-- ellipticBasis τ has matrix [im τ, re τ;0,1], hence sends i to τ.
def ellipticGl2Point (τ : ℂ) (hτ : 0 < τ.im) : ℂˣ →* gl2Datum.G :=
  conjugateHom (Supplier.ellipticBasis τ hτ) gl2Hom
-- TauCeti.Shimura.tests.specialPairTorusSelf
example (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj) :
    ∃ p : specialPair (torusDatum T h), p.T = T ∧ specialPairHom p = Supplier.realSPoints h := by sorry
-- TauCeti.Shimura.tests.specialPairCmElliptic
example : ∃ p : specialPair gl2Datum, specialPairHom p = gl2Hom := by sorry
-- TauCeti.Shimura.tests.specialPairTrivial
example : ∃ p : specialPair (torusDatum Supplier.trivialTorus Supplier.trivialSMap),
    p.T = Supplier.trivialTorus := by sorry
-- TauCeti.Shimura.tests.specialTorusAll
example (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj)
    (k : ℂˣ →* (torusDatum T h).G) (hk : k ∈ (torusDatum T h).orbit.X) :
    specialPoint (torusDatum T h) k := by sorry
-- TauCeti.Shimura.tests.specialGl2Cm
example : specialPoint gl2Datum gl2Hom := by sorry
-- TauCeti.Shimura.tests.specialGl2NonCm
example : ¬ specialPoint gl2Datum (ellipticGl2Point ((Real.sqrt 2 : ℂ)+Complex.I) (by sorry)) := by sorry
-- TauCeti.Shimura.tests.morphismProjection
example (D E : shimuraDatum) : ∃ f : datumMorphism (productDatum D E) D,
    Function.Surjective f.val := by sorry
-- TauCeti.Shimura.tests.morphismTorusNorm
example : ∃ f : datumMorphism (cmTorus Supplier.imaginaryQuadraticType)
    (torusDatum Supplier.normTorus Supplier.normSMap), f.coordinate = Supplier.normCoordinateMap := by sorry
-- TauCeti.Shimura.tests.morphismNonAlgebraicFalse
-- z↦exp(log|z|) with irrational exponent is a continuous point homomorphism, not algebraic.
example (a : ℝ) (ha : Irrational a) :
    ¬ ∃ f : Supplier.normTorus.obj.obj ⟶ Supplier.normTorus.obj.obj,
      ∀ t : ℝˣ, 0 < (t : ℝ) →
        ((Supplier.pointMap f ℝ) (Supplier.realSPoints Supplier.normSMap
          (Units.map (algebraMap ℝ ℂ).toMonoidHom t))) =
          Supplier.realSPoints Supplier.normSMap
            (Units.map (algebraMap ℝ ℂ).toMonoidHom
              ⟨Real.rpow (t : ℝ) a, Real.rpow (t : ℝ) (-a), by sorry, by sorry⟩) := by sorry
-- TauCeti.Shimura.tests.hodgeTypeSiegel
example (g : ℕ) (hg : 0 < g) : hodgeType siegelDatum (siegelDatum g) := by sorry
-- TauCeti.Shimura.tests.hodgeTypeGl2
example : hodgeType siegelDatum gl2Datum := by sorry
-- TauCeti.Shimura.tests.hodgeTypeHilbertStar
example (F : Supplier.TotallyRealField) : hodgeType siegelDatum (hilbertStarDatum F) := by sorry
-- TauCeti.Shimura.tests.abelianSiegel
example (g : ℕ) (hg : 0 < g) : abelianType siegelDatum (siegelDatum g) := by sorry
-- TauCeti.Shimura.tests.abelianTorus
example (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj) :
    abelianType siegelDatum (torusDatum T h) := by sorry
-- TauCeti.Shimura.tests.abelianAdjointOnlyCaveat
-- Conjugation by diag(2,1) preserves the upper component of PGL₂, but does not
-- induce the identity on SL₂. A connected adjoint witness alone cannot fill that square.
example : Supplier.scalingAdjointComponent.coordinate.hom ≫ Supplier.adjointQuotientOfDerived gl2Datum ≠
    Supplier.adjointQuotientOfDerived gl2Datum := by sorry
-- TauCeti.Shimura.tests.preabelianSiegel
example (g : ℕ) (hg : 0 < g) : preabelianType siegelDatum (siegelDatum g) := by sorry
-- TauCeti.Shimura.tests.preabelianTorus
example (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj) :
    preabelianType siegelDatum (torusDatum T h) := by sorry
-- TauCeti.Shimura.tests.preabelianComponent
example : preabelianType siegelDatum (hilbertDatum Supplier.quadraticRealField) ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain (hilbertDatum Supplier.quadraticRealField))) = 4 ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain (hilbertStarDatum Supplier.quadraticRealField))) = 2 := by sorry
-- TauCeti.Shimura.tests.reflexGl2
example : reflexField (Supplier.classFromS Supplier.gl2SMap) = ⊥ := by sorry
-- TauCeti.Shimura.tests.reflexCm
example : reflexField (Supplier.classFromS (Supplier.cmSMap Supplier.imaginaryQuadraticType)) =
    Supplier.imaginaryQuadraticField := by sorry
-- TauCeti.Shimura.tests.reflexProductCm
example : reflexField (Supplier.classFromS Supplier.gl2SMap,
    Supplier.classFromS (Supplier.cmSMap Supplier.imaginaryQuadraticType)) =
      Supplier.imaginaryQuadraticField := by sorry
-- TauCeti.Shimura.tests.homogeneousTrivial
example : ∀ b : Supplier.onePoint,
    ((homogeneousVariation Supplier.onePointAtlas Supplier.trivialTorus.obj.obj
      (fun _ => Supplier.trivialSMap) Supplier.trivialGroupRep 0).filtered.fiber b).F 0 = ⊤ := by sorry
-- TauCeti.Shimura.tests.homogeneousSiegel
example (g : ℕ) (hg : 0 < g) (b : Supplier.datumDomain (siegelDatum g)) :
    Module.finrank ℂ (((homogeneousVariation (Supplier.datumAtlas (siegelDatum g))
      (siegelDatum g).coordinate.obj (Supplier.domainSMap (siegelDatum g))
      (Supplier.standardGroupRep (siegelDatum g)) (-1)).filtered.fiber b).piece (-1)) = g ∧
    HorizontalBundle (homogeneousVariation (Supplier.datumAtlas (siegelDatum g))
      (siegelDatum g).coordinate.obj (Supplier.domainSMap (siegelDatum g))
      (Supplier.standardGroupRep (siegelDatum g)) (-1)).filtered := by sorry
-- TauCeti.Shimura.tests.homogeneousTorus
example (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj) :
    Supplier.datumDimension (torusDatum T h) = 0 ∧
    Subsingleton (Supplier.datumDomain (torusDatum T h)) := by sorry
-- TauCeti.Shimura.tests.parabolicSiegel
example (a : Supplier.Points (Supplier.gspCoordinate 2).obj ℂ) :
    a ∈ Supplier.siegelFlagStabilizer 2 ↔
      (Supplier.standardLagrangian 2).val.map (Supplier.standardComplexRep 2 a).toLinearMap =
        (Supplier.standardLagrangian 2).val := by sorry
-- TauCeti.Shimura.tests.dualSiegel
example : Supplier.datumDualDimension (siegelDatum 2) = 3 ∧
    Nonempty (Supplier.datumDual (siegelDatum 2) ≃ LagrangianGrassmannian 2) ∧
    ∀ L : LagrangianGrassmannian 2, ∀ x ∈ L.val, ∀ y ∈ L.val, complexPsi 2 x y = 0 := by sorry

/- Absolute roots and Weyl actions are imported from native R7; RG2.5 supplies dualization. Here only datum-dependent convention comparisons are used. -/
lemma siegelRootConvention (g : ℕ) (i : Fin g) :
    ((g : ℚ)-2*(i.val+1)+1)/2 - ((g : ℚ)+1)/2 = -(i.val+1 : ℚ) := by sorry
-- Cyclic order sends g+1,...,2g,1,...,g to 0,...,2g-1.
def cyclicSiegelRank (g : ℕ) (i : Fin (2*g)) : ℕ := (i.val+g) % (2*g)
lemma siegelWeylPermutations (g : ℕ) : Fintype.card (Fin g → Bool) = 2^g := by sorry

def kostantSequence (g : ℕ) (S : Finset (Fin g)) (i : ℕ) : ℕ :=
  (S.filter (fun j => j.val < i)).card
lemma kostantSequenceZero (g : ℕ) (S : Finset (Fin g)) : kostantSequence g S 0 = 0 := by sorry
lemma kostantSequenceStep (g : ℕ) (S : Finset (Fin g)) (i : Fin g) :
    kostantSequence g S (i.val+1) = kostantSequence g S i.val + if i ∈ S then 1 else 0 := by sorry
lemma kostantSequenceInjective (g : ℕ) : Function.Injective (fun S : Finset (Fin g) => kostantSequence g S) := by sorry
-- TauCeti.Shimura.tests.sequenceGenusOne
example : (kostantSequence 1 ∅ 1, kostantSequence 1 {0} 1) = (0,1) := by sorry
-- TauCeti.Shimura.tests.sequenceGenusTwo
example : (kostantSequence 2 ∅ 1,kostantSequence 2 ∅ 2) = (0,0) ∧
    (kostantSequence 2 {1} 1,kostantSequence 2 {1} 2) = (0,1) ∧
    (kostantSequence 2 {0} 1,kostantSequence 2 {0} 2) = (1,1) ∧
    (kostantSequence 2 {0,1} 1,kostantSequence 2 {0,1} 2) = (1,2) := by sorry
-- TauCeti.Shimura.tests.sequenceStepFalse
example : ¬ ∃ S : Finset (Fin 2), kostantSequence 2 S 1 = 0 ∧ kostantSequence 2 S 2 = 2 := by sorry
-- Scheme cell identification omitted; rank equalities supplied by RG9's cell coordinates.
lemma kostantSequenceGeometry {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (L : Submodule K V) (E : ℕ → Submodule K V)
    (g : ℕ) (S : Finset (Fin g)) (rank : ∀ i, Module.finrank K (L ⊓ E i) = kostantSequence g S i) :
    ∀ i, Module.finrank K (L ⊓ E i) = kostantSequence g S i := by sorry

abbrev CGWeight := ℚ × ℚ × ℚ
def cgToParity (x : ℤ × ℤ × ℤ) : ℤ × ℤ × ℤ := (x.1,x.2.1,x.1+x.2.1+2*x.2.2)
def cgWeyl (i : Fin 4) (x : CGWeight) : CGWeight :=
  match i.val with
  | 0 => x
  | 1 => (x.1,-x.2.1,x.2.1+x.2.2)
  | 2 => (x.2.1,-x.1,x.1+x.2.2)
  | _ => (-x.2.1,-x.1,x.1+x.2.1+x.2.2)
lemma gsp4CgRoots (a b c : ℤ) : (cgToParity (a,b,c)).1 + (cgToParity (a,b,c)).2.1 ≡
    (cgToParity (a,b,c)).2.2 [ZMOD 2] := by sorry
lemma gsp4Kostant (a b c : ℚ) : cgWeyl 2 (a,b,c) = (b,-a,a+c) ∧ cgWeyl 3 (a,b,c) = (-b,-a,a+b+c) := by sorry
def cgDominant : Set CGWeight := {x | x.2.1 ≤ x.1 ∧ 0 ≤ x.2.1}
lemma gsp4ConeReversal (i : Fin 4) :
    (fun x : CGWeight => (-x.2.1,-x.1,-x.2.2)) '' (cgWeyl i '' cgDominant) =
      cgWeyl ⟨3-i.val, by omega⟩ '' cgDominant := by sorry

private def cgJ : Matrix (Fin 4) (Fin 4) ℝ :=
  !![0,0,0,1; 0,0,1,0; 0,-1,0,0; -1,0,0,0]
lemma gsp4Centralizer (M : Matrix (Fin 4) (Fin 4) ℝ) (ν : ℝ) (hν : ν ≠ 0)
    (hsp : M.transpose * cgJ * M = ν • cgJ)
    (hcentral : M*cgJ = cgJ*M) : M.transpose*M = ν • (1 : Matrix _ _ ℝ) ∧ 0 < ν := by sorry
-- Block Cayley transform supplies the unitary group identification; Lie-group structure omitted.
lemma gsp4Unitary (A B : Matrix (Fin 2) (Fin 2) ℝ)
    (h1 : A.transpose*A+B.transpose*B=1) (h2 : A.transpose*B=B.transpose*A) :
    (A.map (algebraMap ℝ ℂ) + Complex.I • B.map (algebraMap ℝ ℂ)).conjTranspose *
      (A.map (algebraMap ℝ ℂ) + Complex.I • B.map (algebraMap ℝ ℂ)) = 1 := by sorry

-- The compact Cartan is a real matrix subgroup. Its character lattice is a separate object.
def cgRotationMatrix (r a b : ℝ) : Matrix (Fin 4) (Fin 4) ℝ :=
  !![r*Real.cos a,0,0,r*Real.sin a;
     0,r*Real.cos b,r*Real.sin b,0;
     0,-r*Real.sin b,r*Real.cos b,0;
     -r*Real.sin a,0,0,r*Real.cos a]
def gsp4CompactCartan : Subgroup (Matrix.GeneralLinearGroup (Fin 4) ℝ) where
  carrier := {M | ∃ r : ℝ, 0 < r ∧ ∃ a b : ℝ, (M : Matrix _ _ ℝ) = cgRotationMatrix r a b}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
def positiveUnits : Subgroup ℝˣ where
  carrier := {r | 0 < (r : ℝ)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
def unitCircle : Subgroup ℂˣ where
  carrier := {u | u*star u = 1}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
def compactCartanCharacterLattice : AddSubgroup (ℤ×ℤ×ℤ) where
  carrier := {x | x.1+x.2.1 ≡ x.2.2 [ZMOD 2]}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
lemma compactCartanRank : Nonempty (gsp4CompactCartan ≃* (positiveUnits × unitCircle × unitCircle)) ∧
    Nonempty (compactCartanCharacterLattice ≃+ (ℤ×ℤ×ℤ)) := by sorry
lemma compactCartanParity (a b c : ℤ) :
    (a,b,c) ∈ compactCartanCharacterLattice ↔ a+b ≡ c [ZMOD 2] := by sorry
namespace Supplier
 -- Complexification of the rotation/scalar map: diagonal after the specified Cayley basis.
 -- Its diagonal entries are r/u,r/v,r*v,r*u; kernel is {(1,1,1),(-1,-1,-1)}.
 def complexCartanMap : (ℂˣ×ℂˣ×ℂˣ) →* Matrix.GeneralLinearGroup (Fin 4) ℂ := sorry
 def compactCartanComplexPoints : gsp4CompactCartan →* complexCartanMap.range := sorry
 def complexCartanExponential (a b u : ℂ) : complexCartanMap.range := sorry
end Supplier
lemma compactCartanEmbedding (a b c : ℤ) :
    (∃ χ : Supplier.complexCartanMap.range →* ℂˣ, ∀ t : ℂˣ×ℂˣ×ℂˣ,
      χ ⟨Supplier.complexCartanMap t, by sorry⟩ = t.1^a*t.2.1^b*t.2.2^c) ↔
        (a,b,c) ∈ compactCartanCharacterLattice := by sorry
-- TauCeti.Shimura.tests.cartanParityTrue
example : (1,0,1) ∈ compactCartanCharacterLattice ∧
    (0,1,1) ∈ compactCartanCharacterLattice ∧ (0,0,2) ∈ compactCartanCharacterLattice := by sorry
-- TauCeti.Shimura.tests.cartanParityFalse
example : (1,0,0) ∉ compactCartanCharacterLattice ∧
    ¬ ∃ χ : Supplier.complexCartanMap.range →* ℂˣ,
      ∀ t : ℂˣ×ℂˣ×ℂˣ, χ ⟨Supplier.complexCartanMap t, by sorry⟩ = t.1 := by sorry
-- TauCeti.Shimura.tests.cartanRank
example : Nonempty (gsp4CompactCartan ≃* (positiveUnits × unitCircle × unitCircle)) ∧
    Function.Bijective (fun x : ℤ×ℤ×ℤ =>
      (⟨(x.1,x.2.1,x.1+x.2.1+2*x.2.2), by sorry⟩ : compactCartanCharacterLattice)) := by sorry
-- The LieGroups layer7 exponential dictionary is omitted; a,b are angular coordinates
-- and u is the scalar logarithm. All three coordinates are complex after complexification.
lemma gsp4ExpKernel (a b u : ℂ) : Supplier.complexCartanExponential a b u = 1 ↔
    ∃ m n k : ℤ, a = Real.pi*m ∧ b = Real.pi*n ∧ u = Real.pi*Complex.I*k ∧
      m ≡ k [ZMOD 2] ∧ n ≡ k [ZMOD 2] := by sorry
lemma compactCartanExtraKernel :
    Supplier.complexCartanExponential Real.pi Real.pi (Real.pi*Complex.I) = 1 ∧
    Complex.exp (Real.pi*Complex.I) = -1 := by sorry

private def cayleyInverseMatrix : Matrix (Fin 4) (Fin 4) ℂ :=
  (1/2 : ℂ) • !![1,0,0,Complex.I; 0,1,Complex.I,0; 0,Complex.I,1,0; Complex.I,0,0,1]
def gsp4CayleyBasis : Matrix (Fin 4) (Fin 4) ℂ :=
  !![1,0,0,-Complex.I; 0,1,-Complex.I,0; 0,-Complex.I,1,0; -Complex.I,0,0,1]
lemma cayleyInverse : gsp4CayleyBasis * cayleyInverseMatrix = 1 := by sorry
lemma cayleyHodgeLines : (cgJ.map (algebraMap ℝ ℂ)) * gsp4CayleyBasis =
    gsp4CayleyBasis * Matrix.diagonal ![-Complex.I,-Complex.I,Complex.I,Complex.I] := by sorry
lemma cayleyConjugation (i j : Fin 4) : star (gsp4CayleyBasis i j) =
    Complex.I * gsp4CayleyBasis i ⟨3-j.val, by omega⟩ := by sorry
-- TauCeti.Shimura.tests.cayleyProduct
example : cayleyInverseMatrix * gsp4CayleyBasis = 1 := by sorry
-- TauCeti.Shimura.tests.cayleyColumn
example : (fun i => gsp4CayleyBasis i 0) = ![1,0,0,-Complex.I] := by sorry
-- TauCeti.Shimura.tests.cayleyWrongSign
example : ( !![1,0,0,Complex.I; 0,1,Complex.I,0; 0,-Complex.I,1,0; -Complex.I,0,0,1] : Matrix (Fin 4) (Fin 4) ℂ).det = 0 := by sorry
lemma gsp4CayleyAction (A B : Matrix (Fin 2) (Fin 2) ℝ)
    (S : Matrix (Fin 2) (Fin 2) ℝ) (hS : S = !![0,1;1,0]) :
    cayleyInverseMatrix * (Matrix.reindex finSumFinEquiv finSumFinEquiv
      (Matrix.fromBlocks (S*A*S) (S*B) (-B*S) A)).map (algebraMap ℝ ℂ) * gsp4CayleyBasis =
      Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks ((S*A*S).map (algebraMap ℝ ℂ) - Complex.I • (S*B*S).map (algebraMap ℝ ℂ)) 0 0
        (A.map (algebraMap ℝ ℂ) + Complex.I • B.map (algebraMap ℝ ℂ))) := by sorry
-- Absolute root and dual lattices come from R7; RG2.5 supplies dualization.
-- This is half the sum for the corrected lower Borel; simples have coroots f₂−f₁,−f₂.
lemma gsp4PilloniConvention :
    ((-1 : ℚ)+(-2)+(-1)+0)/2 = -2 ∧
    ((1 : ℚ)+0+(-1)+(-2))/2 = -1 := by sorry

/- Local valuations use Mathlib's existing AddValuation. The absolutely-unramified
local field, extended normalized valuation and Iw₁ characteristic-polynomial comparison
are LF.0/RG2.3 inputs. The polynomial calculation and generated subgroup bound are retained. -/
lemma localEigenvalueBound {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ))
    (y : K) (a : Fin 4 → K) (ha : ∀ i, (1 : WithTop ℚ) ≤ v (a i))
    (hroot : y^4 + ∑ i : Fin 4, a i * y^i.val = 0) :
    (1/4 : WithTop ℚ) ≤ v y := by sorry
lemma localProductsBound {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ))
    (eigen : Set Kˣ) (heigen : ∀ x ∈ eigen, (1/4 : WithTop ℚ) ≤ v ((x : K)-1)) :
    ∀ x ∈ Subgroup.closure eigen, (1/4 : WithTop ℚ) ≤ v ((x : K)-1) := by sorry
lemma localTorsionGap {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (l : ℕ) (hl : 5 < l)
    (ζ : Kˣ) (hζ : ζ ≠ 1) (n : ℕ) (hn : 0 < n) (htors : ζ^n=1)
    (cyclotomic : v ((ζ : K)-1) ≤ (1/(l-1) : WithTop ℚ)) :
    v ((ζ : K)-1) < (1/4 : WithTop ℚ) := by sorry
lemma iwahoriNeat {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (eigen : Set Kˣ)
    (hbound : ∀ x ∈ Subgroup.closure eigen, (1/4 : WithTop ℚ) ≤ v ((x : K)-1))
    (htors : ∀ x : Kˣ, x ≠ 1 → ∀ n : ℕ, 0 < n → x^n=1 → v ((x : K)-1) < (1/4 : WithTop ℚ)) :
    ∀ x ∈ Subgroup.closure eigen, ∀ n : ℕ, 0 < n → x^n=1 → x=1 := by sorry

-- Rational adelic lattice conjugation and generated eigenvalue identification are omitted.
-- For det M=1 the two eigenvalues are inverses, so this calculation excludes every torsion product.
lemma gl2IntegralTorsionRoot (N : ℕ) (hN : 3 ≤ N) (M B : Matrix (Fin 2) (Fin 2) ℤ)
    (hM : M = 1 + (N : ℤ) • B) (hdet : M.det = 1)
    (λ : ℂ) (hroot : (M.map (algebraMap ℤ ℂ)).charpoly.IsRoot λ)
    (n : ℕ) (hn : 0 < n) (htors : λ^n = 1) : λ = 1 := by sorry
lemma gl2CongruenceNeat (N : ℕ) (hN : 3 ≤ N) :
    neatLevel rationalGl2Diagonal rationalGl2Eigenvalues (Supplier.gl2PrincipalLevel N) := by sorry

/- Product and adjoint tests use the actual datum constructors, after their models are defined. -/
namespace Supplier
 -- AA.1 and the GL₂ real-points comparison give the rational Möbius action on both half-planes.
 def rationalGl2Action : MulAction (Matrix.GeneralLinearGroup (Fin 2) ℚ) HalfPlanes := sorry
end Supplier
-- TauCeti.Shimura.tests.gammaGl2
example (N : ℕ) (hN : 0 < N) (q : Matrix.GeneralLinearGroup (Fin 2) ℚ) :
    letI := Supplier.rationalGl2Action
    q ∈ componentSubgroup rationalGl2Diagonal (Supplier.gl2PrincipalLevel N) 1
      {z : HalfPlanes | 0 < z.val.im} ↔
      0 < (q.det : ℚ) ∧ ∃ M : Matrix.GeneralLinearGroup (Fin 2) ℤ,
        Matrix.GeneralLinearGroup.map (algebraMap ℤ ℚ) M = q ∧
        ∀ i j, (N : ℤ) ∣ (M : Matrix _ _ ℤ) i j - (1 : Matrix _ _ ℤ) i j := by sorry
-- TauCeti.Shimura.tests.productTorus
example (T U : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj)
    (k : Supplier.RealSMap U.obj.obj) :
    Supplier.datumDimension (productDatum (torusDatum T h) (torusDatum U k)) = 0 ∧
    Subsingleton (Supplier.datumDomain (productDatum (torusDatum T h) (torusDatum U k))) := by sorry
-- TauCeti.Shimura.tests.productGl2
example : Supplier.datumDimension (productDatum gl2Datum gl2Datum) = 2 ∧
    Nat.card (ConnectedComponents (Supplier.datumDomain (productDatum gl2Datum gl2Datum))) = 4 := by sorry
-- TauCeti.Shimura.tests.productUnit
example (D : shimuraDatum) :
    Nonempty (productDatum D (torusDatum Supplier.trivialTorus Supplier.trivialSMap) ≅ D) := by sorry
-- TauCeti.Shimura.tests.adjointTorus
example (T : TorusCommHopfAlgCat ℚ) (h : Supplier.RealSMap T.obj.obj) :
    Nonempty (adjointDatum (torusDatum T h) ≅ torusDatum Supplier.trivialTorus Supplier.trivialSMap) := by sorry
-- TauCeti.Shimura.tests.adjointGl2
example : Nonempty (Supplier.datumDomain (adjointDatum gl2Datum) ≃ₜ HalfPlanes) := by sorry
-- TauCeti.Shimura.tests.adjointComponentCaveat
example : Nat.card (ConnectedComponents
      (Supplier.datumDomain (adjointDatum (hilbertStarDatum Supplier.quadraticRealField)))) = 4 ∧
    ∃ f : datumMorphism (hilbertStarDatum Supplier.quadraticRealField)
        (adjointDatum (hilbertStarDatum Supplier.quadraticRealField)),
      Function.Injective (Supplier.datumDomainMap f) ∧
      ¬ Function.Surjective (Supplier.datumDomainMap f) := by sorry

/- Additional category and morphism APIs expose the carriers used by the comparisons. -/
def gradedHodgeCatOf {V : Type*} [AddCommGroup V] [Module ℝ V] [Module.Finite ℝ V]
    (H : gradedRealHodge V) : GradedHodgeCat := ⟨ModuleCat.of ℝ V, inferInstance, H⟩
lemma gradedHodgeHomExt {H K : GradedHodgeCat} (f g : GradedHodgeHom H K)
    (he : f.linear = g.linear) : f = g := by sorry
lemma gradedHodgeComposition {H K L : GradedHodgeCat} (f : H ⟶ K) (g : K ⟶ L) :
    (f ≫ g).linear = g.linear.comp f.linear := by sorry
-- TauCeti.Shimura.tests.gradedCategoryIdentity
example (H : GradedHodgeCat) : (𝟙 H : H ⟶ H).linear = LinearMap.id := by sorry
-- TauCeti.Shimura.tests.gradedCategoryZero
example : Module.finrank ℝ (gradedHodgeCatOf (tateGrading 0)).V = 1 ∧
    gradedPiece (tateGrading 0) 0 0 = ⊤ ∧
    ∀ p q, (p ≠ 0 ∨ q ≠ 0) → gradedPiece (tateGrading 0) p q = ⊥ := by sorry
-- TauCeti.Shimura.tests.gradedCategoryWrongType
example : ¬ ∃ f : GradedHodgeHom (gradedHodgeCatOf (tateGrading 0))
    (gradedHodgeCatOf (tateGrading 1)), f.linear = LinearMap.id := by sorry

lemma gradedOfRepresentationPiece (M : Supplier.SRep) (p q : ℤ) :
    gradedPiece (gradedOfRepresentation M) p q =
      (representationPiece M p q).comap (Supplier.splitCarrier M).toLinearMap := by sorry
lemma gradedOfRepresentationFinite (M : Supplier.SRep) :
    {n | (gradedOfRepresentation M).weight n ≠ ⊥}.Finite := by sorry
lemma gradedOfRepresentationMorphism {M N : Supplier.SRep} (f : M ⟶ N) (p q : ℤ) :
    gradedPiece (gradedOfRepresentation M) p q ≤
      (gradedPiece (gradedOfRepresentation N) p q).comap (f.hom.toLinearMap.baseChange ℂ) := by sorry
-- TauCeti.Shimura.tests.forwardTrivial
example : (gradedOfRepresentation Supplier.trivialRep).weight 0 = ⊤ := by sorry
-- TauCeti.Shimura.tests.forwardTate
example : (gradedOfRepresentation (Supplier.normRep 1)).weight (-2) = ⊤ ∧
    (gradedOfRepresentation (Supplier.normRep 1)).weight 2 = ⊥ := by sorry
-- TauCeti.Shimura.tests.forwardTwoWeights
example : Module.finrank ℝ ((gradedOfRepresentation
    (Supplier.repSum Supplier.trivialRep (Supplier.normRep 1))).weight 0) = 1 ∧
    Module.finrank ℝ ((gradedOfRepresentation
    (Supplier.repSum Supplier.trivialRep (Supplier.normRep 1))).weight (-2)) = 1 := by sorry

def variationHomMk {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    {H K : variation B A n} := @VariationHom.mk B d A n H K
lemma variationHomExt {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    {H K : variation B A n} (f g : VariationHom H K) (he : f.localMap = g.localMap) : f = g := by sorry
def variationHomIdentity {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : variation B A n) : VariationHom H H := ⟨𝟙 _, by sorry, by sorry⟩
def variationHomZero {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H K : variation B A n) : VariationHom H K := ⟨0, by sorry, by sorry⟩
lemma variationHomCompMap {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    {H K L : variation B A n} (f : VariationHom H K) (g : VariationHom K L) :
    (variationMorphism f g).localMap = f.localMap ≫ g.localMap := by sorry
-- TauCeti.Shimura.tests.variationHomIdentity
example {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : variation B A n) : (variationHomIdentity H).localMap = 𝟙 _ := by sorry
-- TauCeti.Shimura.tests.variationHomZero
example {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H K : variation B A n) : (variationHomZero H K).localMap = 0 := by sorry
-- TauCeti.Shimura.tests.variationHomReject
example {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H K : variation B A n) (f : H.filtered.flat.L ⟶ K.filtered.flat.L)
    (b : B) (p : ℤ) (x : Supplier.ComplexFiber H.filtered.flat.L b)
    (hx : x ∈ (H.filtered.fiber b).F p)
    (hbad : (f.app (FundamentalGroupoid.mk b)).hom.baseChange ℂ x ∉ (K.filtered.fiber b).F p) :
    ¬ ∃ u : VariationHom H K, u.localMap = f := by sorry

def rationalVariationMk {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    := @RationalPolarizedVariation.mk B d A n
lemma rationalVariationExt {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H K : RationalPolarizedVariation B A n) (hL : H.localSystem = K.localSystem)
    (hV : H.realVariation = K.realVariation) (he : HEq H.realComparison K.realComparison)
    (hQ : HEq H.pairing K.pairing) : H = K := by sorry
lemma rationalVariationParallel {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : RationalPolarizedVariation B A n) (b c : B) (γ : Path.Homotopic.Quotient b c) x y :
    H.pairing c (LocalCoefficientSystem.transport H.localSystem γ x)
      (LocalCoefficientSystem.transport H.localSystem γ y) = H.pairing b x y := by sorry
-- TauCeti.Shimura.tests.rationalTate
example {B : TopCat} {d : ℕ} (A : ComplexManifoldOn B d) (b : B) :
    ((integralVariationRational (Supplier.integralTate A 1)).realVariation.filtered.fiber b).F (-1) = ⊤ ∧
    (integralVariationRational (Supplier.integralTate A 1)).pairing b ≠ 0 := by sorry
-- TauCeti.Shimura.tests.rationalScaled
example {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : polarizedIntegralVariation B A n) (b : B) :
    HEq ((integralVariationRational (Supplier.scalePolarization H 2 (by sorry))).pairing b)
      (2 • (integralVariationRational H).pairing b) := by sorry
-- TauCeti.Shimura.tests.rationalNegativeFalse
example {B : TopCat} {d : ℕ} {A : ComplexManifoldOn B d} {n : ℤ}
    (H : RationalPolarizedVariation B A n) (b : B) (p : ℤ)
    (x : Supplier.ComplexFiber H.realVariation.filtered.flat.L b)
    (hx : x ∈ (H.realVariation.filtered.fiber b).piece p) (hne : x ≠ 0) :
    ¬ 0 < Complex.I^(2*p-n)*(-Supplier.rationalFormOnRealFiber H.localSystem H.realVariation
      H.realComparison H.pairing b x (Hodge.complexificationConjugation
        (Supplier.RealFiber H.realVariation.filtered.flat.L b) x)) := by sorry

end TauCeti.Shimura
