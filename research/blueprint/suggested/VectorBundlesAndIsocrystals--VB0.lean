/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/VectorBundlesAndIsocrystals--VB0.md` and its packet
give the definitive mathematical plan, including supplier contracts and gaps.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

Scope: VB0, VB1, VB2, VB2:ampleness and VB2:classification.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
implementationStatus = unchecked. Proofs and construction obligations use sorry.

The algebraic interfaces below elaborate against pinned Mathlib; the Tau Ceti
source contracts are identified below. The final indexed
omission section gives every remaining planned name and its exact mathematical
contract. G-LEAN records unavailable period-space, untilt, Robba topology,
curve-degree and diamond carriers. An omission is not a theorem with a weaker
hypothesis. In particular, no arbitrary proposition stands in for classification,
cohomology vanishing, ampleness, or an unavailable geometric hypothesis.

FiniteIsocrystal is the finite general-coefficient extension of Mathlib's
WittVector.Isocrystal; its Frobenius is SEMILINEAR. CurveBundle packages a single
local generator witness which is BOTH finite and free; it reuses Scheme.Modules
and Tau Ceti's finite-presentation theorem. RobbaPhiModule below is the algebraic
interface over an already supplied ring with Frobenius. It does not construct
RF0's period rings or a Robba topology. FrobeniusComplex uses E-linear maps:
semilinearity over a larger coefficient ring does not make phi - 1 linear there.
-/
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Bezout
import Mathlib.RingTheory.TensorProduct.Finite
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Homology.HomologicalComplexAbelian
import Mathlib.Algebra.Homology.HomologySequence
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
/- Pinned Tau Ceti modules read in source but absent from the shared compiled
   build (not rebuilt here):
   TauCeti.Algebra.Category.ModuleCat.Sheaf.FinitePresentation
   TauCeti.AlgebraicGeometry.LineBundle.Basic
   TauCeti.AlgebraicGeometry.LineBundle.Class
   The first supplies CurveBundle.finitePresentation; line-class comparisons
   needing the other two are indexed as omissions. -/
import Mathlib.Topology.Algebra.Group.Basic

noncomputable section

open CategoryTheory
open CategoryTheory.Limits
open scoped ZeroObject TensorProduct

namespace TauCeti.FFBundles

universe u

instance equivInvPair (R : Type u) [CommRing R] (σ : R ≃+* R) :
    RingHomInvPair σ.toRingHom σ.symm.toRingHom := RingHomInvPair.of_ringEquiv σ

instance equivInvPairSymm (R : Type u) [CommRing R] (σ : R ≃+* R) :
    RingHomInvPair σ.symm.toRingHom σ.toRingHom := RingHomInvPair.of_ringEquiv σ.symm

/-! ## Finite general-coefficient isocrystals -/

/-- The specified coefficient automorphism is part of the object type. -/
structure FiniteIsocrystal (L : Type u) [Field L] (σ : L ≃+* L) where
  V : Type u
  [addCommGroup : AddCommGroup V]
  [module : Module L V]
  [finite : Module.Finite L V]
  frobenius : V ≃ₛₗ[σ.toRingHom] V

attribute [instance] FiniteIsocrystal.addCommGroup FiniteIsocrystal.module
  FiniteIsocrystal.finite

namespace FiniteIsocrystal

variable {L : Type u} [Field L] {σ : L ≃+* L}

/-- L-linear maps satisfying the actual Frobenius intertwining equation.
Their additive and E-linear structures use coefficients fixed by σ. They are
not generally an L-vector subspace of the space of L-linear maps. -/
structure Hom (D D' : FiniteIsocrystal L σ) where
  linearMap : D.V →ₗ[L] D'.V
  intertwines : ∀ x, D'.frobenius (linearMap x) = linearMap (D.frobenius x)

/-- A linear equivalence with the intertwining equation, not just an
equivalence of underlying vector spaces. -/
structure Equiv (D D' : FiniteIsocrystal L σ) where
  linearEquiv : D.V ≃ₗ[L] D'.V
  intertwines : ∀ x, D'.frobenius (linearEquiv x) = linearEquiv (D.frobenius x)

/-- Finite direct sum; its concrete carrier has one coordinate for each block. -/
def directSum (blocks : List (FiniteIsocrystal L σ)) : FiniteIsocrystal L σ where
  V := ∀ i : Fin blocks.length, (blocks.get i).V
  frobenius := by sorry

/-- Semilinear tensor Frobenius. -/
def tensor (D D' : FiniteIsocrystal L σ) : FiniteIsocrystal L σ where
  V := D.V ⊗[L] D'.V
  frobenius := by sorry

/-- Endomorphisms as a subring of the linear endomorphism ring. Scalars fixed
by σ give the coefficient algebra structure; arbitrary L-scalars do not. -/
def EndRing (D : FiniteIsocrystal L σ) : Subring (Module.End L D.V) where
  carrier := { f | ∀ x, D.frobenius (f x) = f (D.frobenius x) }
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry
  mul_mem' := by sorry

lemma Hom.ext {D D' : FiniteIsocrystal L σ} (f g : Hom D D')
    (h : ∀ x, f.linearMap x = g.linearMap x) : f = g := by
  sorry

/-- Identities and composition are inherited from linear maps. The abelian and
E-linear extensions require the fixed coefficient embedding; see the index. -/
@[instance_reducible]
def category : Category (FiniteIsocrystal L σ) where
  Hom := Hom
  id D := ⟨LinearMap.id, by sorry⟩
  comp f g := ⟨g.linearMap.comp f.linearMap, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

instance : Category (FiniteIsocrystal L σ) := category

/-- Keep the coefficient embedding and the specified Frobenius together.
RF0 supplies L and σ. Local-field completion is not constructed here. -/
def coeffFrobenius (E : Type u) [Field E] [Algebra E L]
    (hfix : ∀ a : E, σ (algebraMap E L a) = algebraMap E L a) :
    { pair : (E →+* L) × (L ≃+* L) // ∀ a, pair.2 (pair.1 a) = pair.1 a } :=
  ⟨(algebraMap E L, σ), hfix⟩

/-- Forget finiteness in the Q_p specialization to the pinned isocrystal class. -/
@[instance_reducible]
def toWitt (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p]
    (D : FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k)) : WittVector.Isocrystal p k D.V where
  toModule := D.module
  frob := by sorry

/-- The inverse specialization keeps the existing class and adds finiteness. -/
def ofWitt (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] (V : Type u) [AddCommGroup V]
    [WittVector.Isocrystal p k V] [Module.Finite (FractionRing (WittVector p k)) V] :
    FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k) where
  V := V
  frobenius := by sorry

/-- The empty coordinate space gives the rank-zero object. -/
def zero (L : Type u) [Field L] (σ : L ≃+* L) : FiniteIsocrystal L σ where
  V := Fin 0 → L
  frobenius := by sorry

end FiniteIsocrystal

section IsocrystalTests

variable (L : Type u) [Field L] (σ : L ≃+* L)

-- test: finiteIsocrystal_zero
example : Module.finrank L (FiniteIsocrystal.zero L σ).V = 0 := by
  sorry

-- test: finiteIsocrystal_requires_bijective
example : ¬ Function.Bijective (fun _ : L => (0 : L)) := by
  sorry

-- test: finiteIsocrystal_witt
-- The morphism comparison below uses the actual pinned intertwiner.
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] (V W : Type u) [AddCommGroup V] [AddCommGroup W]
    [WittVector.Isocrystal p k V] [WittVector.Isocrystal p k W]
    [Module.Finite (FractionRing (WittVector p k)) V]
    [Module.Finite (FractionRing (WittVector p k)) W] :
    Nonempty (FiniteIsocrystal.Hom (FiniteIsocrystal.ofWitt p k V)
      (FiniteIsocrystal.ofWitt p k W) ≃ WittVector.IsocrystalHom p k V W) := by
  sorry

-- The unramified degree-two coefficient comparison is omitted until the
-- local-field supplier provides E′/E and its residue-degree normalization.
-- An identity asserting σ.trans σ = σ² would not test that contract.

end IsocrystalTests

/-! ## Rational standard blocks -/

/-- D(s,r) is the coordinate space with the cyclic semilinear Frobenius.
No simplicity claim is built into its carrier. Coprimality is required only
for the simple-block statements. -/
def SlopeBlock (L : Type u) [Field L] (σ : L ≃+* L)
    (π : L) (_hπ : π ≠ 0) (s : ℤ) (r : ℕ) (_hr : 0 < r) :
    FiniteIsocrystal L σ where
  V := Fin r → L
  frobenius := by sorry

instance wittRankOneFinite (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [CharP k p] [PerfectRing k p] (s : ℤ) :
    Module.Finite (FractionRing (WittVector p k))
      (WittVector.StandardOneDimIsocrystal p k s) := by
  sorry

namespace SlopeBlock

variable {L : Type u} [Field L] (σ : L ≃+* L)
  (π : L) (hπ : π ≠ 0) (s : ℤ) (r : ℕ) (hr : 0 < r)

/-- The actual coordinate basis vector, without another basis carrier. -/
def basisVector (i : Fin r) : (SlopeBlock L σ π hπ s r hr).V :=
  Pi.single i 1

lemma frobenius_basis (i : Fin r) :
    (SlopeBlock L σ π hπ s r hr).frobenius (basisVector σ π hπ s r hr i) =
      if h : i.val + 1 < r then basisVector σ π hπ s r hr ⟨i.val + 1, h⟩
      else π ^ s • basisVector σ π hπ s r hr ⟨0, hr⟩ := by
  sorry

/-- The σ^r on coefficients is explicit. The uniformizer is fixed by σ. -/
lemma iterate (hσπ : σ π = π) (x : (SlopeBlock L σ π hπ s r hr).V) :
    ((SlopeBlock L σ π hπ s r hr).frobenius : _ → _)^[r] x =
      π ^ s • (fun i => (σ : L → L)^[r] (x i)) := by
  sorry

lemma rank : Module.finrank L (SlopeBlock L σ π hπ s r hr).V = r := by
  sorry

/-- Numerical slope label. The Dieudonné–Manin theorem supplies its agreement
with the valuation-theoretic slope, rather than this formula proving it. -/
def slope : ℚ := (s : ℚ) / r

lemma rankOneWitt (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] (s : ℤ) :
    Nonempty (FiniteIsocrystal.Equiv
      (SlopeBlock (FractionRing (WittVector p k))
        (WittVector.FractionRing.frobenius p k) (p : FractionRing (WittVector p k))
        (WittVector.FractionRing.p_nonzero p k) s 1 (by decide))
      (FiniteIsocrystal.ofWitt p k (WittVector.StandardOneDimIsocrystal p k s))) := by
  sorry

end SlopeBlock

section BlockTests

variable (L : Type u) [Field L] (σ : L ≃+* L) (π : L) (hπ : π ≠ 0)

-- test: slopeBlock_half
example : Module.finrank L (SlopeBlock L σ π hπ 1 2 (by decide)).V = 2 ∧
    SlopeBlock.slope (1 : ℤ) (2 : ℕ) = 1 / 2 := by
  sorry

-- test: slopeBlock_wraparound
example (hσπ : σ π = π) :
    ((SlopeBlock L σ π hπ (-1) 2 (by decide)).frobenius : _ → _)^[2]
      (Pi.single (0 : Fin 2) 1) = π ^ (-1 : ℤ) • Pi.single (0 : Fin 2) 1 := by
  sorry

-- test: slopeBlock_rankOne
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] :
    ∀ x : WittVector.StandardOneDimIsocrystal p k (-2),
      (WittVector.Isocrystal.frobenius p k (V := WittVector.StandardOneDimIsocrystal p k (-2))).toFun x = (p : FractionRing (WittVector p k)) ^
        (-2 : ℤ) • WittVector.FractionRing.frobeniusRingHom p k x := by
  sorry

-- test: slopeBlock_not_simple
-- Full decomposition is indexed below; this checks its rank/slope input.
example : Module.finrank L (SlopeBlock L σ π hπ 2 2 (by decide)).V = 2 ∧
    SlopeBlock.slope (2 : ℤ) (2 : ℕ) = 1 := by
  sorry

end BlockTests

/-! ## Higher-rank Witt specialization of the named VB0 theorems

The signatures here state genuine new higher-rank results in the supported
Q_p specialization. The general-E and equal-characteristic signatures require
RF0's coefficient comparison and are explicitly indexed below. These are not
claims that Mathlib's rank-one classification already proves the general case.
-/

/-- A reduced rational block label with positive denominator. -/
structure RationalBlockIndex where
  numerator : ℤ
  denominator : ℕ
  positive : 0 < denominator
  coprime : Nat.Coprime numerator.natAbs denominator

namespace RationalBlockIndex

def slope (i : RationalBlockIndex) : ℚ := (i.numerator : ℚ) / i.denominator

def ofRational (lam : ℚ) : RationalBlockIndex where
  numerator := lam.num
  denominator := lam.den
  positive := by sorry
  coprime := by sorry

end RationalBlockIndex

section HigherRankWitt

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
  [PerfectRing k p] [IsAlgClosed k]

abbrev wittBlock (i : RationalBlockIndex) :=
  SlopeBlock (FractionRing (WittVector p k)) (WittVector.FractionRing.frobenius p k)
    (p : FractionRing (WittVector p k)) (WittVector.FractionRing.p_nonzero p k)
    i.numerator i.denominator i.positive

theorem dieudonneManinIsocrystals
    (D : FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k)) :
    ∃ blocks : List RationalBlockIndex,
      Nonempty (FiniteIsocrystal.Equiv D
        (FiniteIsocrystal.directSum (blocks.map (wittBlock p k)))) := by
  sorry

theorem isocrystalTensorSlopes (i j : RationalBlockIndex) :
    let t := RationalBlockIndex.ofRational (i.slope + j.slope)
    Nonempty (FiniteIsocrystal.Equiv
      (FiniteIsocrystal.tensor (wittBlock p k i) (wittBlock p k j))
      (FiniteIsocrystal.directSum (List.replicate
        (i.denominator * j.denominator / t.denominator) (wittBlock p k t)))) := by
  sorry

/-- Schur's division property; the coefficient-algebra and Brauer comparisons
need the fixed-field identification in the omitted general-E contract. -/
theorem isocrystalEndDivision (i : RationalBlockIndex)
    (f : FiniteIsocrystal.EndRing (wittBlock p k i)) (hf : f ≠ 0) : IsUnit f := by
  sorry

-- Full Witt specialization of test: slopeBlock_not_simple.
example : Nonempty (FiniteIsocrystal.Equiv
    (SlopeBlock (FractionRing (WittVector p k)) (WittVector.FractionRing.frobenius p k)
      (p : FractionRing (WittVector p k)) (WittVector.FractionRing.p_nonzero p k)
      2 2 (by decide))
    (FiniteIsocrystal.directSum (List.replicate 2
      (SlopeBlock (FractionRing (WittVector p k)) (WittVector.FractionRing.frobenius p k)
        (p : FractionRing (WittVector p k)) (WittVector.FractionRing.p_nonzero p k)
        1 1 (by decide))))) := by
  sorry

end HigherRankWitt

/-! ## Finite locally free schematic module sheaves -/

/-- One witness, two predicates. The scheme is supplied by RF3/VB2; no curve
or site is reconstructed. This is the schematic carrier of CurveBundle. -/
structure CurveBundle (X : AlgebraicGeometry.Scheme.{u}) where
  sheaf : X.Modules
  generators : sheaf.LocalGeneratorsData
  finite : generators.IsFiniteType
  free : generators.IsLocallyFreeData

namespace CurveBundle

variable {X : AlgebraicGeometry.Scheme.{u}}

instance (V : CurveBundle X) : V.generators.IsFiniteType := V.finite
instance (V : CurveBundle X) : V.generators.IsLocallyFreeData := V.free

/-- Morphisms forget witness choices. -/
instance : Category (CurveBundle X) where
  Hom V W := V.sheaf ⟶ W.sheaf
  id V := 𝟙 V.sheaf
  comp f g := f ≫ g

/-- The finite free sheaf. -/
def ofFree (X : AlgebraicGeometry.Scheme.{u}) (n : ℕ) : CurveBundle X where
  sheaf := SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin n))
  generators := (SheafOfModules.free.generatingSections (R := X.ringCatSheaf)
    (ULift.{u} (Fin n))).localGeneratorsData
  finite := by sorry
  free := by infer_instance

lemma ext {V W : CurveBundle X} (f g : V ⟶ W)
    (h : ∀ U : X.Opens, f.app U = g.app U) : f = g := by
  sorry

/-- Apply the pinned theorem, not a second finite-presentation definition. -/
lemma finitePresentation (V : CurveBundle X) : V.sheaf.IsFinitePresentation := by
  sorry

/-- Pullback is the existing module-sheaf pullback; the new obligation is
preservation of the paired finite locally free witness. -/
def pullback {Y : AlgebraicGeometry.Scheme.{u}} (f : X ⟶ Y)
    (V : CurveBundle Y) : CurveBundle X where
  sheaf := (AlgebraicGeometry.Scheme.Modules.pullback f).obj V.sheaf
  generators := by sorry
  finite := by sorry
  free := by sorry

end CurveBundle

section BundleTests

variable (X : AlgebraicGeometry.Scheme.{u})

-- test: curveBundle_zero
example : Nonempty ((CurveBundle.ofFree X 0).sheaf ≅
    (0 : X.Modules)) := by
  sorry

-- test: curveBundle_free_two
example : (CurveBundle.ofFree X 2).sheaf =
    SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin 2)) := by
  sorry

-- test: curveBundle_schematic
example (V : CurveBundle X) : V.generators.IsFiniteType ∧
    V.generators.IsLocallyFreeData ∧ V.sheaf.IsFinitePresentation := by
  sorry

-- test: curveBundle_not_infinite
example (hX : Nonempty X) :
    ¬ (SheafOfModules.free (R := X.ringCatSheaf)
      (ULift.{u} ℕ)).IsFiniteType := by
  sorry

end BundleTests

/-! ## Algebraic Frobenius modules over the supplied tilted Robba ring -/

/-- This interface is parameterized by the actual ring and its automorphism.
Finite projectivity and an invertible semilinear map express the invertible
Frobenius linearization. The LF topology is not silently added to this carrier. -/
structure RobbaPhiModule (R : Type u) [CommRing R] (φ : R ≃+* R) where
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module R M]
  [finite : Module.Finite R M]
  [projective : Module.Projective R M]
  frobenius : M ≃ₛₗ[φ.toRingHom] M

attribute [instance] RobbaPhiModule.addCommGroup RobbaPhiModule.module
  RobbaPhiModule.finite RobbaPhiModule.projective

namespace RobbaPhiModule

variable {R : Type u} [CommRing R] {φ : R ≃+* R}

structure Hom (M N : RobbaPhiModule R φ) where
  linearMap : M.M →ₗ[R] N.M
  intertwines : ∀ x, N.frobenius (linearMap x) = linearMap (M.frobenius x)

/-- The rank-one trivial Frobenius module, independent of any Bézout theorem. -/
def trivial (R : Type u) [CommRing R] (φ : R ≃+* R) : RobbaPhiModule R φ where
  M := R
  frobenius := φ.toSemilinearEquiv

/-- Semilinear Frobenius on scalar extension. The compatibility of coefficient
Frobenius is an equation of the actual coefficient embeddings. -/
def tensorFrobenius {R₀ : Type u} [CommRing R₀] [Algebra R₀ R]
    (φ₀ : R₀ ≃+* R₀)
    (_hc : ∀ a, φ (algebraMap R₀ R a) = algebraMap R₀ R (φ₀ a))
    (N : Type u) [AddCommGroup N] [Module R₀ N]
    (F : N ≃ₛₗ[φ₀.toRingHom] N) :
    (R ⊗[R₀] N) ≃ₛₗ[φ.toRingHom] (R ⊗[R₀] N) := by
  sorry

/-- The integral ring and its Frobenius are supplied by RF0. The model is
finite projective, hence a finite locally free module on its affine spectrum.
Its scalar extension is identified with M by an actual intertwining map. -/
structure GlobalEtaleModel (D : RobbaPhiModule R φ)
    (R₀ : Type u) [CommRing R₀] [Algebra R₀ R] (φ₀ : R₀ ≃+* R₀)
    (hc : ∀ a, φ (algebraMap R₀ R a) = algebraMap R₀ R (φ₀ a)) where
  N : Type u
  [addCommGroup : AddCommGroup N]
  [module : Module R₀ N]
  [finite : Module.Finite R₀ N]
  [projective : Module.Projective R₀ N]
  frobenius : N ≃ₛₗ[φ₀.toRingHom] N
  identification : (R ⊗[R₀] N) ≃ₗ[R] D.M
  intertwines : ∀ x, D.frobenius (identification x) =
    identification (tensorFrobenius φ₀ hc N frobenius x)

/-- This predicate uses existence of the specified integral model; it does not
replace existence by pointwise slope zero. -/
def isGloballyEtale (D : RobbaPhiModule R φ)
    (R₀ : Type u) [CommRing R₀] [Algebra R₀ R] (φ₀ : R₀ ≃+* R₀)
    (hc : ∀ a, φ (algebraMap R₀ R a) = algebraMap R₀ R (φ₀ a)) : Prop :=
  Nonempty (GlobalEtaleModel D R₀ φ₀ hc)

/-- Coefficient-compatible base change, without an added purity equivalence. -/
def baseChange (D : RobbaPhiModule R φ) (S : Type u) [CommRing S]
    [Algebra R S] (ψ : S ≃+* S)
    (_hc : ∀ a, ψ (algebraMap R S a) = algebraMap R S (φ a)) :
    RobbaPhiModule S ψ where
  M := S ⊗[R] D.M
  frobenius := by sorry

/-- Rank-one module with a unit Frobenius multiplier, used to test its lattice. -/
def rankOneUnit (R : Type u) [CommRing R] (φ : R ≃+* R) (_a : Rˣ) :
    RobbaPhiModule R φ where
  M := R
  frobenius := by sorry

lemma rankOneUnit_apply (a : Rˣ) (x : R) :
    (rankOneUnit R φ a).frobenius x = (a : R) * φ x := by
  sorry

end RobbaPhiModule

section RobbaTests

variable (R : Type u) [CommRing R] (φ : R ≃+* R)

-- test: robbaPhi_trivial
example (R₀ : Type u) [CommRing R₀] [Algebra R₀ R] (φ₀ : R₀ ≃+* R₀)
    (hc : ∀ a, φ (algebraMap R₀ R a) = algebraMap R₀ R (φ₀ a)) :
    (RobbaPhiModule.trivial R φ).frobenius = φ.toSemilinearEquiv ∧
      RobbaPhiModule.isGloballyEtale (RobbaPhiModule.trivial R φ) R₀ φ₀ hc := by
  sorry

-- test: robbaPhi_noninvertible
example [Nontrivial R] : ¬ Function.Bijective (fun _ : R => (0 : R)) := by
  sorry

-- test: robbaPhi_finite_projective
-- The absolute ring's Bézout theorem is a supplier input, expressed here as
-- its actual algebraic hypothesis rather than a predicate named "good ring".
example [IsDomain R] [IsBezout R] (D : RobbaPhiModule R φ) :
    Module.Free R D.M := by
  sorry

-- test: robbaPhi_unit_lattice
example (R₀ : Type u) [CommRing R₀] [Algebra R₀ R] (φ₀ : R₀ ≃+* R₀)
    (hc : ∀ a, φ (algebraMap R₀ R a) = algebraMap R₀ R (φ₀ a)) (a : R₀ˣ) :
    RobbaPhiModule.isGloballyEtale
      (RobbaPhiModule.baseChange (RobbaPhiModule.rankOneUnit R₀ φ₀ a) R φ hc)
      R₀ φ₀ hc := by
  sorry

end RobbaTests

/-! ## The E-linear two-term Frobenius complex -/

section FrobeniusCohomology

variable {E : Type u} [Field E] {M : Type u} [AddCommGroup M] [Module E M]

/-- An E-linear Frobenius map on annular sections gives the genuine differential.
The curve comparison is separate, because RF and descent carriers are absent. -/
def FrobeniusComplex (φ : M →ₗ[E] M) : CochainComplex (ModuleCat E) ℤ := by
  sorry

namespace FrobeniusComplex

/-- This term iso fixes degrees 0 and 1; all other terms are zero. -/
def termIso (φ : M →ₗ[E] M) (n : ℤ) :
    (FrobeniusComplex φ).X n ≅
      if n = 0 ∨ n = 1 then ModuleCat.of E M else (0 : ModuleCat E) := by
  sorry

/-- The cochain differential is φ - 1, not an L-linear map when φ is only
L-semilinear. -/
lemma differential (φ : M →ₗ[E] M) :
    (FrobeniusComplex φ).d 0 1 ≫ (termIso φ 1).hom ≫
      eqToHom (by simp) = (termIso φ 0).hom ≫ eqToHom (by simp) ≫
        ModuleCat.ofHom (φ - LinearMap.id) := by
  sorry

/-- Kernel in degree zero. -/
def H0 (φ : M →ₗ[E] M) : Submodule E M := (φ - LinearMap.id).ker

/-- Quotient by the image in degree one. -/
abbrev H1 (φ : M →ₗ[E] M) : Type u := M ⧸ (φ - LinearMap.id).range

/-- The cohomology identifications are part of the construction obligation. -/
def H0Iso (φ : M →ₗ[E] M) :
    (FrobeniusComplex φ).homology 0 ≅ ModuleCat.of E (H0 φ) := by
  sorry

def H1Iso (φ : M →ₗ[E] M) :
    (FrobeniusComplex φ).homology 1 ≅ ModuleCat.of E (H1 φ) := by
  sorry

/-- An intertwiner induces the actual cochain map. -/
def map {N : Type u} [AddCommGroup N] [Module E N]
    (φ : M →ₗ[E] M) (ψ : N →ₗ[E] N) (f : M →ₗ[E] N)
    (_hf : ψ.comp f = f.comp φ) : FrobeniusComplex φ ⟶ FrobeniusComplex ψ := by
  sorry

end FrobeniusComplex

-- test: frobeniusComplex_zero
example (φ : (Fin 0 → E) →ₗ[E] (Fin 0 → E)) :
    Subsingleton (FrobeniusComplex.H0 φ) ∧ Subsingleton (FrobeniusComplex.H1 φ) := by
  sorry

-- test: frobeniusComplex_identity
example : Nonempty (FrobeniusComplex.H0 (LinearMap.id : M →ₗ[E] M) ≃ₗ[E] M) ∧
    Nonempty (FrobeniusComplex.H1 (LinearMap.id : M →ₗ[E] M) ≃ₗ[E] M) := by
  sorry

-- test: frobeniusComplex_kernel
example (φ : M →ₗ[E] M) (x : M) : x ∈ FrobeniusComplex.H0 φ ↔ φ x = x := by
  sorry

-- test: frobeniusComplex_degree
example (φ : M →ₗ[E] M) (n : ℤ) (h0 : n ≠ 0) (h1 : n ≠ 1) :
    (FrobeniusComplex φ).X n ≅ (0 : ModuleCat E) := by
  sorry

end FrobeniusCohomology

/-! ## Algebraic twisted invariants -/

section TwistedInvariants

variable {E : Type u} [Field E] {M : Type u} [AddCommGroup M] [Module E M]

/-- The algebraic kernel underlying Γ_n. Its Banach topology needs the annular
norm theorem indexed below; the algebraic construction does not assert it. -/
def TwistedInvariant (φ : M →ₗ[E] M) (π : E) (n : ℤ) : Submodule E M :=
  (φ - (π ^ n) • LinearMap.id).ker

namespace TwistedInvariant

/-- Algebraic restriction of an intertwiner. Continuity is indexed separately. -/
def map {N : Type u} [AddCommGroup N] [Module E N]
    (φ : M →ₗ[E] M) (ψ : N →ₗ[E] N) (π : E) (n : ℤ) (f : M →ₗ[E] N)
    (_hf : ψ.comp f = f.comp φ) :
    TwistedInvariant φ π n →ₗ[E] TwistedInvariant ψ π n := by
  sorry

end TwistedInvariant

-- test: twistedInvariant_zero
example (φ : (Fin 0 → E) →ₗ[E] (Fin 0 → E)) (π : E) (n : ℤ) :
    Subsingleton (TwistedInvariant φ π n) := by
  sorry

-- test: twistedInvariant_n_zero
example (φ : M →ₗ[E] M) (π : E) :
    TwistedInvariant φ π 0 = FrobeniusComplex.H0 φ := by
  sorry

-- test: twistedInvariant_sign
-- KL6.3.17's displayed M(n) identification has the opposite sign; see E15.
example (π : E) (hπ : π ≠ 0) (hπ2 : π ^ 2 ≠ 1) :
    TwistedInvariant (π • (LinearMap.id : E →ₗ[E] E)) π 1 = ⊤ ∧
      (π • (LinearMap.id : E →ₗ[E] E) - π⁻¹ • LinearMap.id).ker = ⊥ := by
  sorry

-- test: twistedInvariant_change_radius
-- Indexed below: this needs actual annular seminorms and admissible radii.
-- test: twistedInvariant_not_exact_norm
-- Indexed below: topology equality is weaker than numerical norm equality.

end TwistedInvariants

/-! ## Frobenius-commuting continuous actions

The LF topology is supplied on M, rather than manufactured by the action
definition. The coefficient ring and the module action are both recorded.
The full LF-versus-invariant-Banach-topology equivalence needs the missing
Robba norm theorem, and is indexed below, not asserted for arbitrary M.
-/

section ContinuousActions

variable (E R M G : Type u) [Field E] [CommRing R] [Algebra E R]
  [AddCommGroup M] [Module E M] [Module R M] [IsScalarTower E R M]
  [TopologicalSpace M] [Group G] [TopologicalSpace G]

structure ContinuousPhiAction (φ : M ≃ₗ[E] M) where
  coefficients : G →* (R ≃ₐ[E] R)
  action : G →* (M ≃ₗ[E] M)
  semilinear : ∀ (g : G) (a : R) (x : M),
    action g (a • x) = coefficients g a • action g x
  commutes : ∀ (g : G) (x : M), φ (action g x) = action g (φ x)
  continuous : Continuous (fun gx : G × M => action gx.1 gx.2)

namespace ContinuousPhiAction

variable {E R M G}

/-- The genuine action on the algebraic invariant submodule. Continuity of
the induced topology is included; the canonical annular Banach topology is
the separate TwistedInvariant.norm obligation. -/
def restrictInvariants {φ : M ≃ₗ[E] M} (A : ContinuousPhiAction E R M G φ)
    (π : E) (n : ℤ) : G →* (TwistedInvariant φ.toLinearMap π n ≃ₗ[E]
      TwistedInvariant φ.toLinearMap π n) := by
  sorry

lemma restrictInvariants_continuous {φ : M ≃ₗ[E] M}
    (A : ContinuousPhiAction E R M G φ) (π : E) (n : ℤ) :
    Continuous (fun gx : G × TwistedInvariant φ.toLinearMap π n =>
      restrictInvariants A π n gx.1 gx.2) := by
  sorry

/-- The trivial action is E-linear, coefficient-semilinear and continuous. -/
def trivial (φ : M ≃ₗ[E] M) : ContinuousPhiAction E R M G φ where
  coefficients := 1
  action := 1
  semilinear := by sorry
  commutes := by sorry
  continuous := by sorry

/-- For a finite discrete group, continuity of every individual action map
implies joint continuity. No conclusion is drawn about a non-discrete group. -/
def ofFiniteDiscrete [Finite G] [DiscreteTopology G] (φ : M ≃ₗ[E] M)
    (τ : G →* (R ≃ₐ[E] R)) (ρ : G →* (M ≃ₗ[E] M))
    (hsem : ∀ (g : G) (a : R) (x : M), ρ g (a • x) = τ g a • ρ g x)
    (hcomm : ∀ (g : G) (x : M), φ (ρ g x) = ρ g (φ x))
    (_hcont : ∀ g, Continuous (ρ g : M → M)) :
    ContinuousPhiAction E R M G φ where
  coefficients := τ
  action := ρ
  semilinear := hsem
  commutes := hcomm
  continuous := by sorry

end ContinuousPhiAction

-- test: continuousPhiAction_trivial
example (φ : M ≃ₗ[E] M) :
    ∀ (g : G) (x : M), (ContinuousPhiAction.trivial (R := R) (G := G) φ).action g x = x := by
  sorry

-- test: continuousPhiAction_all_weights
example (φ : M ≃ₗ[E] M) (π : E) :
    ∀ n : ℤ, Continuous (fun gx : G × TwistedInvariant φ.toLinearMap π n =>
      ContinuousPhiAction.restrictInvariants
        (ContinuousPhiAction.trivial (R := R) (G := G) φ) π n gx.1 gx.2) := by
  sorry

-- test: continuousPhiAction_finite
example [Finite G] [DiscreteTopology G] (φ : M ≃ₗ[E] M)
    (τ : G →* (R ≃ₐ[E] R)) (ρ : G →* (M ≃ₗ[E] M))
    (hsem : ∀ (g : G) (a : R) (x : M), ρ g (a • x) = τ g a • ρ g x)
    (hcomm : ∀ (g : G) (x : M), φ (ρ g x) = ρ g (φ x))
    (hcont : ∀ g, Continuous (ρ g : M → M)) :
    Nonempty (ContinuousPhiAction E R M G φ) := by
  sorry

-- test: continuousPhiAction_requires_commutation
-- Coordinate swap does not commute with diag(1,a), even if all maps are
-- continuous. This checks the defining equation rather than just continuity.
example (a : E) (ha : a ≠ 1) :
    ¬ ∀ x : Fin 2 → E,
      (fun i : Fin 2 => if i = 0 then x 1 else a * x 0) =
        (fun i : Fin 2 => if i = 0 then a * x 1 else x 0) := by
  sorry

end ContinuousActions

/-! ## Numerical HN polygon interface

The input is the ranked degree data of the HN graded pieces. Obtaining these
pieces from the curve filtration is the omitted HNFiltration contract. These
signatures check rank weighting, endpoint and ordering without inventing a
replacement for a curve, a subbundle, or semistability.
-/

structure HNPolygon where
  pieces : List (ℕ × ℤ)
  positive : ∀ p ∈ pieces, 0 < p.1
  decreasing : pieces.Pairwise (fun a b => (a.2 : ℚ) / a.1 > (b.2 : ℚ) / b.1)

namespace HNPolygon

def vertices (P : HNPolygon) : List (ℕ × ℤ) :=
  P.pieces.scanl (fun a b => (a.1 + b.1, a.2 + b.2)) (0, 0)

def totalRank (P : HNPolygon) : ℕ := (P.pieces.map Prod.fst).sum
def totalDegree (P : HNPolygon) : ℤ := (P.pieces.map Prod.snd).sum

lemma endpoint (P : HNPolygon) : P.vertices.getLast! = (P.totalRank, P.totalDegree) := by
  sorry

/-- Continuous piecewise linear interpolation, extended constantly past the
two endpoints. The concavity assertion is restricted to its actual domain. -/
def evaluate (P : HNPolygon) (_x : ℚ) : ℚ := by
  sorry

lemma vertex_evaluate (P : HNPolygon) (v : ℕ × ℤ) (hv : v ∈ P.vertices) :
    P.evaluate v.1 = v.2 := by
  sorry

lemma concave (P : HNPolygon) (x y t : ℚ)
    (hx : 0 ≤ x ∧ x ≤ P.totalRank) (hy : 0 ≤ y ∧ y ≤ P.totalRank)
    (ht : 0 ≤ t ∧ t ≤ 1) :
    t * P.evaluate x + (1 - t) * P.evaluate y ≤
      P.evaluate (t * x + (1 - t) * y) := by
  sorry

/-- Merge the ranked slope multisets and coalesce equal slopes. -/
def directSum (_P _Q : HNPolygon) : HNPolygon := by
  sorry

def slopeMultiplicity (P : HNPolygon) (s : ℚ) : ℕ :=
  ((P.pieces.filter (fun a => (a.2 : ℚ) / a.1 = s)).map Prod.fst).sum

lemma directSum_multiplicity (P Q : HNPolygon) (s : ℚ) :
    (P.directSum Q).slopeMultiplicity s = P.slopeMultiplicity s + Q.slopeMultiplicity s := by
  sorry

def zero : HNPolygon := ⟨[], by sorry, by sorry⟩
def half : HNPolygon := ⟨[(2, 1)], by sorry, by sorry⟩
def split : HNPolygon := ⟨[(1, 1), (1, -1)], by sorry, by sorry⟩

end HNPolygon

-- test: hnPolygon_zero
example : HNPolygon.zero.vertices = [(0, 0)] := by
  sorry

-- test: hnPolygon_half
-- Input: the standard-bundle degree theorem supplies the graded pair (2,1).
example : HNPolygon.half.vertices = [(0, 0), (2, 1)] := by
  sorry

-- test: hnPolygon_split
-- Input: the split filtration has graded pairs (1,1),(1,-1).
example : HNPolygon.split.vertices = [(0, 0), (1, 1), (2, 0)] := by
  sorry

-- test: hnPolygon_not_slope_only
example : HNPolygon.split.vertices ≠ [(0, 0), (2, 0)] := by
  sorry

end TauCeti.FFBundles

/-! ## Complete contract index and explicit omissions

Every planned name is indexed here. "Typed specialization" means the preceding
code states its algebraic, schematic or Q_p specialization; it does not certify
the missing comparison with the FF curve. "Omitted signature" has no Lean
declaration: the following mathematical contract remains in the definitive
packet/document until its genuine carriers and hypotheses can be expressed.
The test index similarly distinguishes examples from unavailable geometry.

No placeholder proposition or invented curve predicate is used to make the
source-level theorem appear to elaborate. G-LEAN is the common refinement.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block
Finite isocrystals over the completed maximal unramified coefficient field
Infrastructure for omitted parts: General-E fixed-field/coefficient comparison and categorical E-linearity.

API FiniteIsocrystal [typed specialization]
A finite L-module with a σ-semilinear equivalence.

API FiniteIsocrystal.Hom [typed specialization]
The E-vector subspace of L-linear maps intertwining the two Frobenius equivalences; scalars are restricted through the specified σ-fixed E embedding, not arbitrary L-scalars.

API FiniteIsocrystal.Hom.ext [typed specialization]
Intertwining morphisms agree iff their underlying functions agree.

API FiniteIsocrystal.category [typed specialization]
Identity and composition are inherited from linear maps; the category is E-linear abelian.
The typed category covers identities and composition. Its E-linear abelian structure requires the specified fixed coefficient embedding and is omitted.

API FiniteIsocrystal.toWitt [typed specialization]
For E=Q_p and σ=p-Frobenius, forget finiteness to the existing WittVector.Isocrystal class; arrows and isomorphisms agree.
The typed class conversion and intertwiner test are present. The full morphism/isomorphism naturality proof obligation is the packet contract.

API FiniteIsocrystal.coeffFrobenius [typed specialization]
Return the specified σ together with the E-coefficient embedding; do not infer it from L.

TEST finiteIsocrystal_zero [example specialization]
The zero module has rank 0 and an invertible semilinear zero-to-zero map.

TEST finiteIsocrystal_witt [example specialization]
For Q_p the finite subcategory embeds fully faithfully into WittVector.IsocrystalHom and IsocrystalEquiv.

TEST finiteIsocrystal_requires_bijective [example specialization]
The zero Frobenius map on nonzero L is not an isocrystal.

TEST finiteIsocrystal_unramified_frobenius [omitted example]
For the unramified degree-two E′, the coefficient automorphism is σ², not σ.

-/

/-
Node: VectorBundlesAndIsocrystals:VB0/rational-standard-block
Rational standard Frobenius blocks
Infrastructure for omitted parts: RF0 general-E/equal-characteristic coefficient identification and higher-rank Witt comparison.

API SlopeBlock [typed specialization]
D(s,r), with r>0 and π≠0.

API SlopeBlock.frobenius_basis [typed specialization]
Evaluate Φ on the cyclic basis, including the π^s wraparound.

API SlopeBlock.iterate [typed specialization]
Φ^r=π^sσ^r, with σ^r acting coefficientwise.

API SlopeBlock.rank [typed specialization]
The L-rank is r.

API SlopeBlock.slope [typed specialization]
The rational isocrystal slope is s/r.
The numerical label is typed. Its identification with valuation-theoretic slope uses the omitted general-E Dieudonne-Manin contract.

API SlopeBlock.rankOneWitt [typed specialization]
At E=Q_p, r=1, D(s,1) identifies with StandardOneDimIsocrystal s.

TEST slopeBlock_half [example specialization]
D(1,2) has rank 2 and isocrystal slope 1/2.

TEST slopeBlock_wraparound [example specialization]
On D(−1,2), Φ²(e_0)=π^{-1}e_0, ruling out a coefficient-linear or unsigned shift.

TEST slopeBlock_rankOne [example specialization]
D(−2,1) is the pinned rank-one block with exponent −2.

TEST slopeBlock_not_simple [example specialization]
D(2,2) has slope 1 and is not simple: it is two copies of D(1,1).

-/

/-
Node: VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals
Dieudonné–Manin classification of finite isocrystals
THEOREM dieudonneManinIsocrystals [typed Q_p specialization]
Over L with algebraically closed residue field bar F_q, every finite E-isocrystal is a finite direct sum of coprime D(s,r); the multiset of rational slopes with block multiplicities is unique. The coprime blocks are simple, Hom between distinct slopes is zero, and every isocrystal short exact sequence splits. This asserts no analogous classification over an arbitrary perfect residue field without descent data.
Only the actual Witt coefficient specialization above is typed; general E and equal characteristic are not asserted by those signatures.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes
Tensor and dual calculus for isocrystals
THEOREM isocrystalTensorSlopes [typed Q_p specialization]
Finite isocrystals form a rigid exact E-linear tensor category. Tensor Frobenius is Φ_D⊗Φ_D′ and dual Frobenius is ℓ↦σ∘ℓ∘Φ_D^{-1}. Tensor slopes are pairwise sums, dual slopes are negatives. If a,b have reduced denominators h_a,h_b,h_{a+b}, then D_a⊗D_b≅D_{a+b}^{⊕h_a h_b/h_{a+b}}.
Only the actual Witt coefficient specialization above is typed; general E and equal characteristic are not asserted by those signatures.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra
Division endomorphisms of a simple isocrystal
THEOREM isocrystalEndDivision [typed Q_p specialization]
For coprime (s,r), End_Φ(D(s,r)) is a central division algebra over E of dimension r². With E_r/E unramified degree r and arithmetic σ, it has presentation ⊕_{i=0}^{r−1}E_r Π^i, Π^r=π^{−s}, Πx=σ(x)Π. Its arithmetic Brauer invariant is computed later by the separate brauer-invariant-sign node. The bundle endomorphism comparison is a separate classification-layer node.
Only the actual Witt coefficient specialization above is typed; general E and equal characteristic are not asserted by those signatures.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/slope-division-algebra
Slope-labelled cyclic algebra
Infrastructure for omitted parts: Local fields Layer 2 unramified coefficient field and Class field theory Layer 5 cyclic algebra, arithmetic Frobenius and local invariant carriers.

API SlopeDivisionAlgebra [omitted signature]
The cyclic algebra D_λ for the reduced pair of λ.

API SlopeDivisionAlgebra.generator [omitted signature]
The element Π with Π^h=π^d.

API SlopeDivisionAlgebra.commutation [omitted signature]
Πx=σ(x)Π for x∈E_h; specify arithmetic Frobenius.

API SlopeDivisionAlgebra.basis [omitted signature]
E-basis obtained from an E-basis of E_h times Π^i, 0≤i<h.

API SlopeDivisionAlgebra.isocrystalEnd [omitted signature]
E-algebra equivalence with End_Φ(D(−d,h)).

TEST slopeDivision_integer [omitted example]
D_3≅E because the reduced denominator is one.

TEST slopeDivision_half [omitted example]
D_{1/2} has dimension 4 and Π²=π.

TEST slopeDivision_negative [omitted example]
D_{−1/3} uses Π³=π^{−1}, not π, and has invariant −1/3.

TEST slopeDivision_end [omitted example]
D_{1/3}≅End_Φ(D(−1,3)), not End_Φ(D(1,3)).

-/

/-
Node: VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign
Arithmetic Brauer invariant and slope normalization
THEOREM slopeBrauerInvariant [omitted signature]
Under the algebraic-to-cohomological Brauer comparison and the arithmetic local invariant inv_E:Br(E)≃Q/Z, inv_E[D_λ]=λ mod Z. Restriction to finite E′/E multiplies this invariant by [E′:E]; the opposite algebra negates it. This fixes the choice Πx=σ(x)Π with arithmetic, not geometric, Frobenius.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction
Coefficient extension and induction adjunction
THEOREM coefficientAdjunction [omitted signature]
For finite separable E′/E of residue degree f, ramification degree e and total degree n=ef, identify the coefficient fields compatibly. Pull D to D⊗_{L_E}L_E′ with Frobenius Φ^f⊗σ_E′; induction is the f cyclic conjugate copies of restriction of scalars, with wraparound given by Φ′. Pull and induction are adjoint in both directions: Hom(Pull D,D′)≅Hom(D,Ind D′) and Hom(Ind D′,D)≅Hom(D′,Pull D). The reverse adjunction uses the perfect separable trace pairing and the identification of finite cyclic induction with coinduction; no division by n is required. Pull preserves rank and scales slopes by n; induction multiplies rank by n and divides isoclinic slopes by n. At the bundle stage they compare to pullback/pushforward along the finite étale coefficient curve map, with its two trace adjunctions.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/finite-galois-descent
Finite Galois descent of isocrystals
THEOREM isocrystalGaloisDescent [omitted signature]
Let L′/L be finite Galois and let σ′ be a coefficient automorphism extending σ. Finite L-vector spaces with bijective σ-semilinear Φ are equivalent to finite L′-vector spaces with bijective σ′-semilinear Φ′ and a semilinear Galois descent action ρ satisfying Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′ for every g∈Gal(L′/L). The descended module is the invariant module and Φ′ restricts to a bijective σ-semilinear Φ. Ordinary commutation with each ρ_g is sufficient only when σ′ centralizes the Galois group. This is module descent with Frobenius, not classification over arbitrary perfect residue fields.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles
Finite locally free bundles on the curve
Infrastructure for omitted parts: AdicSpacesPartII R3 ringed-site bundle carrier; Tau Ceti sheaf tensor/dual modules and paired-witness transport.

API CurveBundle [typed specialization]
A structure-sheaf module with a single finite locally free local generator witness.
The schematic specialization is typed. The analytic ringed-site specialization requires the AdicSpacesPartII R3 carrier.

API CurveBundle.ofFree [typed specialization]
The free sheaf of finite rank n.

API CurveBundle.ext [typed specialization]
Bundle morphisms are equal iff the underlying sheaf morphisms are equal.

API CurveBundle.pullback [typed specialization]
Pullback along curve-base change, with identity and composition isomorphisms.
The object pullback is typed. Identity/composition natural isomorphisms use the existing Scheme.Modules API and remain indexed obligations.

API CurveBundle.tensorDual [omitted signature]
Tensor, unit, dual and evaluation from the structure-sheaf module category.

API CurveBundle.finitePresentation [typed specialization]
Apply the pinned finite-presentation theorem to the same finite locally free witness.

TEST curveBundle_zero [example specialization]
The free sheaf on the empty family is a bundle of rank 0.

TEST curveBundle_free_two [example specialization]
O_X⊕O_X is a bundle of rank 2.

TEST curveBundle_not_infinite [example specialization]
On a nonempty geometric curve, a free sheaf on an infinite constant basis is not finite locally free; test its nonzero residue-field stalk. The nonempty hypothesis excludes the empty scheme, where the zero sheaf admits every vacuous presentation.

TEST curveBundle_schematic [example specialization]
For a scheme, forgetting CurveBundle returns its Scheme.Modules object with the pinned finite locally free data.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent
Annular Frobenius descent for bundles
THEOREM annularBundleDescent [omitted signature]
For affinoid perfectoid S of characteristic p over F_q, finite locally free bundles on X_S are equivalent, exactly and tensorially, to finite projective bundles on the RF0 closed annuli with compatible overlap identifications and bijective Frobenius identification under radius rescaling. Restriction to a fundamental annular range and Frobenius translates gives the inverse. Cohomology on Y_S is acyclic in positive degrees by sousperfectoid annular acyclicity and dense restriction maps.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/tilted-robba-ring
Relative tilted Robba ring from curve annuli
Infrastructure for omitted parts: RF0 annular Frechet/LF topology, cofinal limits, and radius-rescaling coefficient Frobenius.

API TiltedRobba [omitted signature]
The annular inverse-limit/filtered-union ring.

API TiltedRobba.restrict [omitted signature]
Cofinal radius restriction maps, compatible with composition.

API TiltedRobba.frobenius [omitted signature]
Coefficient-semilinear ring automorphism with radius rescaling q.

API TiltedRobba.seminorm [omitted signature]
The family of annular seminorms on fixed-radius Fréchet pieces.

API TiltedRobba.compareCS [omitted signature]
For E=Q_p identify the ring, Frobenius and topology with CS17 3.2.10.

TEST tiltedRobba_cofinal [omitted example]
Using s_j→0 in a fixed r inverse limit produces the same ring and topology.

TEST tiltedRobba_zero_section [omitted example]
The zero compatible annular family has all seminorms zero.

TEST tiltedRobba_frobenius_radius [omitted example]
At Q_p, Frobenius moves the outer radius r to r/p in the CS convention.

TEST tiltedRobba_not_algebraic_union [omitted example]
Replacing the fixed-r inverse limit by an algebraic union loses compatible sections defined on all sufficiently small inner radii.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules
Finite projective Frobenius modules and integral models
Infrastructure for omitted parts: The actual tilted/integral Robba rings, their coefficient-compatible topologies and perfectoid base maps.

API RobbaPhiModule [typed specialization]
Finite projective M with invertible Frobenius linearization.
Typed over a supplied ring and its automorphism; identifying that ring with TiltedRobba is omitted.

API RobbaPhiModule.Hom [typed specialization]
R̃-linear maps commuting with Frobenius.

API RobbaPhiModule.baseChange [typed specialization]
Base change of modules and linearizations under coefficient-compatible perfectoid maps.
Algebraic scalar extension is typed. Continuity for actual perfectoid maps needs the omitted LF-topology comparison.

API RobbaPhiModule.GlobalEtaleModel [typed specialization]
An integral finite locally free model and Frobenius identification.
Typed over a supplied integral coefficient ring. Its identification with the RF0 integral Robba ring is omitted.

API RobbaPhiModule.isGloballyEtale [typed specialization]
Existence of such a global model; independent of presentation.

TEST robbaPhi_trivial [example specialization]
The rank-one ring with its own Frobenius has its evident integral étale model.

TEST robbaPhi_noninvertible [example specialization]
Zero linearization on a nonzero free module is excluded.

TEST robbaPhi_finite_projective [example specialization]
Over an absolute field the module is free by the field Bézout theorem, while its definition remains finite projective.

TEST robbaPhi_unit_lattice [example specialization]
A rank-one Frobenius multiplier that is an integral unit preserves an invertible rank-one integral model.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence
Exact tensor equivalence of Robba modules and curve bundles
THEOREM robbaBundleEquivalence [omitted signature]
For affinoid perfectoid characteristic-p S, RobbaPhiModule(R̃_S)≃Bun(X_S) is an exact tensor equivalence, commuting with base change and duals. Spread a finite presentation to sufficiently small annuli, extend across Frobenius translates, then descend to X_S. Its inverse takes compatible annular sections. For Q_p this is CS17 3.3.4. The general-E coefficient comparison is requested from RF0; this analytic equivalence does not require Proj/GAGA.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology
Two-term Frobenius complex for curve cohomology
Infrastructure for omitted parts: RF1 quotient curve, annular derived sections and Frobenius descent for the canonical derived comparison.

API FrobeniusComplex [typed specialization]
The E-linear two-term complex in degrees 0 and 1.

API FrobeniusComplex.differential [typed specialization]
The differential sends x to φ(x)−x.

API FrobeniusComplex.H0 [typed specialization]
H⁰=ker(φ−1).

API FrobeniusComplex.H1 [typed specialization]
H¹=coker(φ−1).

API FrobeniusComplex.map [typed specialization]
A Frobenius-equivariant bundle morphism induces a cochain map.

API FrobeniusComplex.compareDerived [omitted signature]
Canonical quasi-isomorphism with RΓ(X_S,V), compatible with pullback.

TEST frobeniusComplex_zero [example specialization]
For the zero module both terms and both cohomology groups vanish.

TEST frobeniusComplex_identity [example specialization]
For φ=id on a nonzero E-vector space the differential is zero, so H⁰ and H¹ both equal that space.

TEST frobeniusComplex_kernel [example specialization]
H⁰ consists precisely of φ-fixed vectors, not all vectors.

TEST frobeniusComplex_degree [example specialization]
The cokernel occupies degree 1, and cannot represent H⁰(V) for an arbitrary V.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology
V-descent of bundles and their derived cohomology
THEOREM bundleVDescent [omitted signature]
On Perf/F_q, S↦Bun(X_S) is a v-stack. For any perfectoid S and V∈Bun(X_S), T↦RΓ(X_T,V_T) on Perf/S is a derived v-sheaf. In the affinoid case this follows after completed tensoring with the perfectoid completed coefficient extension E_∞, where closed annuli become affinoid perfectoid, and descending the finite projective module data. Both arrows and effective objects descend.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor
The exact tensor isocrystal-to-bundle functor
Infrastructure for omitted parts: The actual analytic curve, quotient sheaves, RF3 rank-one twists and Frobenius descent functor.

API bundleOfIsocrystal [omitted signature]
For S over the fixed k=bar F_q, the analytic Frobenius-descended bundle E_S(D), retaining the coefficient embedding.

API bundleOfIsocrystal.map [omitted signature]
Descend an intertwining linear map; preserve identity and composition.

API bundleOfIsocrystal.tensorDual [omitted signature]
Exact tensor structure and dual compatibility.

API standardBundle [omitted signature]
For S/F_q, descend the cyclic matrix for (−d,h); over k compare with E_S(D(−d,h)).

API standardBundle.integerTwist [omitted signature]
O(n) identifies with RF3 rank-one twists, with their tensor laws.

API standardBundle.baseChange [omitted signature]
Perfectoid pullback preserves the cyclic standard bundle; general E_S(D) pullback retains the chosen k-embedding. At a geometric point, coefficient pullback multiplies λ by [E′:E], as proved with degree and scalar extension.

TEST standardBundle_zero [omitted example]
O(0) is the tensor unit of rank 1, rather than the rank-zero bundle.

TEST standardBundle_half_sign [omitted example]
Over geometric C/k, D(1,2) maps to O(−1/2), rank 2; the degree −1 check belongs after geometric degree is constructed.

TEST standardBundle_integer [omitted example]
D(−2,1) maps to the RF3 twist O(2).

TEST standardBundle_tensor_half [omitted example]
Over geometric C/k, O(1/2)⊗O(1/2)≅O(1)^{⊕4}; rank 4 detects omission of the tensor multiplicity.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/cohomology-of-twists
Slope-sensitive cohomology of standard bundles
THEOREM standardBundleCohomology [omitted signature]
For λ<0, H⁰(X_S,O(λ))=0 and the v-sheaf H¹(O(λ)) is locally spatial, partially proper and cohomologically smooth. For λ=0, the degree-zero v-sheaf is constant E and the pro-étale sheafification of degree-one cohomology is zero; RΓ_proét(S,E)≃RΓ(X_S,O). For λ>0 and affinoid S, H¹(X_S,O(λ))=0; its H⁰ v-sheaf is locally spatial, partially proper and cohomologically smooth. After base change to the fixed algebraically closed k, the positive H⁰ v-sheaf is a d-dimensional perfectoid open ball in mixed characteristic only for 0<λ=d/h≤[E:Q_p]; in equal characteristic every positive λ has this description. Nonaffinoid global H¹ vanishing is not asserted. The negative λ=−1 presentation is (A¹_{S♯})^diamond/E on an untilt cover.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains
Classical points and annular Dedekind rings
THEOREM classicalPointPid [omitted signature]
For complete algebraically closed perfectoid C/F_q and a connected affinoid U=Spa(B,B⁺) in Y_C, Spm(B) identifies with the classical points of U, whose residue fields are untilts of C over E. B is a PID. On X_C, classical points are Frobenius orbits and affinoid chart rings are Dedekind domains; their PID upgrade is obtained from geometric Picard degree, rather than assumed as an early analytic input.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover
Elementary algebraization at a geometric point
Infrastructure for omitted parts: Geometric perfectoid/untilt data, classical-point sections, RF3 homogeneous charts and their cover proof G-GEOM.

API geometricCurveMap [omitted signature]
The global map α_C formed from the proved geometric-point covering.

API geometricCurveMap.chart [omitted signature]
On D(f), the map is the RF3 map to D_+(f).

API geometricCurveMap.compatible [omitted signature]
The chart maps agree on D(fg) under homogeneous localization.

API geometricBundleAlgebraization [omitted signature]
Exact tensor equivalence of analytic and schematic finite locally free bundles at C.

API geometricCurveMap.closedPoints [omitted signature]
Classical points map bijectively to schematic closed points.

TEST geometricCurveMap_nonvanishing [omitted example]
A nonzero divisor section is nonvanishing at every nonclassical point.

TEST geometricCurveMap_separates [omitted example]
The section vanishing at x cannot alone define a chart containing x; use a section with a distinct zero divisor.

TEST geometricCurveMap_overlap [omitted example]
The maps for f and g agree on D(fg).

-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point
Regular noetherian geometric curve and PID complements
THEOREM geometricCurveRegular [omitted signature]
For complete algebraically closed perfectoid C, X_C^alg=Proj(P_C) is connected, regular, noetherian and one-dimensional. Classical points correspond bijectively to its closed points; for every classical x the complement of x in X_C^alg is affine with PID coordinate ring. Degree-one untilt divisor sections cut out Spec(C♯) and their nonvanishing complements give these charts.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison
Untilts and completed local rings
THEOREM completedLocalUntilt [omitted signature]
At a classical point x of the geometric curve, identify the completed local ring with the RF2 untilt period DVR, whose residue field is C_x♯. At E=Q_p this is B_dR⁺(C_x♯). A uniformizer t_x depends on a choice of generator; neither its equality with a global t nor the equality of every untilt with a fixed C♯ is asserted.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/picard-degree
Picard group of the geometric curve
THEOREM picardDegreeEquivalence [omitted signature]
At complete algebraically closed C, the map Z→Pic(X_C), n↦[O(n)], is an isomorphism of groups. Every classical point has divisor class [O(1)]. Use the existing invertible-sheaf and line-bundle-class carriers, adding dual inverses and the curve-specific integer classification; a commutative monoid of classes in the baseline is not already this Picard computation.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism
Rank, determinant degree and rational slope
Infrastructure for omitted parts: Completed geometric FF curve, finite bundle determinant, integer Picard equivalence and connected stalk rank.

API bundleRank [omitted signature]
Constant finite rank on X_C.

API bundleDegree [omitted signature]
Integer Picard degree of the determinant.

API bundleSlope [omitted signature]
Rational degree/rank for a nonzero bundle.

API bundleDegree.exact [omitted signature]
Degree and rank add in short exact sequences.

API bundleDegree.tensorDual [omitted signature]
Tensor determinant formula and dual sign.

API bundleDegree.standard [omitted signature]
For λ=d/h reduced, rank O(λ)=h and degree O(λ)=d.

TEST bundleDegree_zero [omitted example]
Rank and degree of the zero bundle are both zero; no slope is requested.

TEST bundleDegree_half [omitted example]
O(1/2) has (rank,degree,slope)=(2,1,1/2).

TEST bundleDegree_dual [omitted example]
O(1/2)∨ has rank 2, degree −1 and slope −1/2.

TEST bundleDegree_directSum [omitted example]
O(1)⊕O(−1) has rank 2 and degree 0, although its HN slopes are 1 and −1.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree
Saturation and torsion degree on the geometric curve
Infrastructure for omitted parts: Geometric noetherian regular FF scheme, coherent subsheaves, generic fiber and local DVR-length degree.

API bundleSaturation [omitted signature]
The saturated inverse image inside V.

API bundleSaturation.universal [omitted signature]
Smallest saturated subsheaf containing F; its quotient is torsion free.

API bundleSaturation.idempotent [omitted signature]
Saturating an already saturated subsheaf does nothing.

API torsionDegree [omitted signature]
Finite sum of local DVR lengths times point degree.

API torsionDegree.exact [omitted signature]
Torsion degree is additive in short exact sequences.

API genericIso_degree [omitted signature]
Generic bundle injection has nonnegative degree defect, zero precisely for an isomorphism.

TEST saturation_zero [omitted example]
The zero subbundle of a torsion-free bundle is saturated.

TEST saturation_divisor [omitted example]
The image O(−1)⊂O cut out by one classical point saturates to O, with torsion degree 1.

TEST torsionDegree_length_two [omitted example]
O_x/(t_x²) has degree 2, not degree 1.

TEST saturation_not_same_rank [omitted example]
Equal generic rank does not make O(−1)→O an isomorphism; its degree defect is positive.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/geometric-semistability
Stable and semistable geometric bundles
Infrastructure for omitted parts: Actual geometric bundles, bundleRank/bundleDegree and proper nonzero saturated subbundle carrier.

API BundleSemistable [omitted signature]
Nonzero V and the weak inequalities for proper saturated subbundles.

API BundleStable [omitted signature]
Nonzero V and the strict inequalities.

API BundleStable.semistable [omitted signature]
Stable implies semistable.

API BundleSemistable.iso [omitted signature]
Stability and semistability are invariant under bundle isomorphisms.

API BundleSemistable.saturation [omitted signature]
Equivalent test using coherent subsheaves of smaller positive rank.

TEST bundleSemistable_line [omitted example]
Every line bundle is stable: there is no proper positive-rank saturated subbundle.

TEST bundleSemistable_equal_sum [omitted example]
O⊕O is semistable of slope 0 but is not stable.

TEST bundleSemistable_unequal_sum [omitted example]
O(1)⊕O(−1) is not semistable: O(1) has slope 1>0.

TEST bundleStable_zero [omitted example]
The zero bundle is not stable and is never assigned a finite slope.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration
Harder–Narasimhan filtration of geometric bundles
Infrastructure for omitted parts: Actual saturated subobjects, semistability, degree bounds G-HN and their filtration category.

API HNFiltration [omitted signature]
The unique saturated finite decreasing-slope filtration.

API HNFiltration.threshold [omitted signature]
V^{≥λ} for a rational threshold λ.

API HNFiltration.graded [omitted signature]
Semistable graded bundles and their ranks and degrees.

API HNFiltration.unique [omitted signature]
Every filtration satisfying these properties equals the canonical one.

API HNFiltration.functorial [omitted signature]
Every bundle morphism preserves each threshold piece.

API HNFiltration.semistable [omitted signature]
A nonzero bundle is semistable iff it has one HN slope.

TEST hnFiltration_zero [omitted example]
The zero bundle has no nonzero HN graded pieces.

TEST hnFiltration_two_slopes [omitted example]
O(1)⊕O(−1) has descending HN slopes 1,−1 and rank-one pieces.

TEST hnFiltration_equal_slopes [omitted example]
O⊕O has one slope-zero piece of rank 2, rather than two strictly decreasing equal slopes.

TEST hnFiltration_threshold [omitted example]
For O(1)⊕O(−1), the threshold ≥0 is O(1).

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon
Rank-normalized Harder–Narasimhan polygon
Infrastructure for omitted parts: The actual HN graded-bundle input and its rank/degree bridge; the numerical polygon interface is typed.

API HNPolygon [typed specialization]
The rational piecewise-linear polygon from HN graded data.
Typed from positive ranked degree pieces with decreasing slopes. Its input from HNFiltration.graded is omitted.

API HNPolygon.vertices [typed specialization]
Cumulative rank and degree vertices.

API HNPolygon.endpoint [typed specialization]
Endpoint (rank V,deg V).
The ranked degree sum endpoint is typed. The identification of those totals with bundleRank and bundleDegree is omitted.

API HNPolygon.concave [typed specialization]
The polygon has decreasing segment slopes.

API HNPolygon.directSum [typed specialization]
Direct sum merges the descending slope multisets, weighted by ranks.
The polygon merge and ranked multiplicities are typed. Identification with the HN polygon of a curve-bundle direct sum is omitted.

TEST hnPolygon_zero [example specialization]
The zero polygon has only (0,0).

TEST hnPolygon_half [example specialization]
For O(1/2) the endpoint is (2,1), not (1,1/2).

TEST hnPolygon_split [example specialization]
For O(1)⊕O(−1), vertices are (0,0),(1,1),(2,0).

TEST hnPolygon_not_slope_only [example specialization]
The polygon of O(1)⊕O(−1) is not the horizontal rank-two degree-zero segment.

-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation
Global generation and vanishing after positive twists
THEOREM positiveTwistGeneration [omitted signature]
For affinoid perfectoid S/F_q and V∈Bun(X_S), there is n_0 such that for every n≥n_0, V(n) is generated by finitely many global sections and H^i(X_S,V(n))=0 for all i>0. The bound depends on V and the chosen affinoid S. On a general perfectoid base the assertion is local on S; no uniform global bound is asserted. The quantitative proof uses the two half-annulus contraction estimates of KL6.2.2–6.2.4, not the defective estimate (II.2.1) in FS.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists
Global Proj map and compatible schematic twists
Infrastructure for omitted parts: RF3 graded Proj charts, general-affinoid cover from positiveTwistGeneration, Tau Ceti invertible-sheaf/tensor carriers.

API curveProjMap [omitted signature]
Global α_S after homogeneous chart coverage.

API curveProjMap.chart [omitted signature]
Its restriction is the RF3 homogeneous localization chart map.

API algebraicTwist [omitted signature]
Invertible O_alg(n), obtained from compatible sufficiently large shifts.

API algebraicTwist.pullback [omitted signature]
α_S*O_alg(n)≅O(n).

API algebraicTwist.add [omitted signature]
O_alg(n+m)≅O_alg(n)⊗O_alg(m), coherently.

API algebraicTwist.largeShift [omitted signature]
For large n it agrees with the Proj graded shift sheaf.

TEST algebraicTwist_zero [omitted example]
O_alg(0) is the structure-sheaf tensor unit.

TEST algebraicTwist_consecutive [omitted example]
O_alg(a+1)⊗O_alg(a)∨ pulls back to O(1).

TEST algebraicTwist_inverse [omitted example]
O_alg(−1) is the dual of O_alg(1).

TEST curveProjMap_coverage [omitted example]
A map on the union of D(f) is not called curveProjMap before the union is proved to be X_S.

-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence
GAGA for the relative schematic curve
THEOREM curveGaga [omitted signature]
Let X be a locally ringed spectral space with line bundle O(1) such that every finite locally free V has V(n) globally generated and H^i(X,V(n))=0 for all i>0 and all sufficiently large n. The homogeneous chart maps define a global α:X→Proj⊕Γ(X,O(n)); pullback gives an exact tensor equivalence of finite locally free bundles and comparison isomorphisms on all bundle cohomology. Apply this to X_S for affinoid perfectoid S via GG and GMap. No coherent-sheaf equivalence on arbitrary nonnoetherian S is inferred from this bundle statement.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/independence-of-positive-twist
Independence of the ample line bundle
THEOREM ampleLineIndependence [omitted signature]
Two line bundles satisfying the axiomatic generation/vanishing hypotheses on the same X yield canonically isomorphic Proj schemes, with the same locally ringed map from X and the same finite locally free equivalence. The identification is functorial and obeys the cocycle law for three choices. No arbitrary choice of line bundle without these hypotheses is included.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence
Prüfer charts and coherent Frobenius correspondence
THEOREM pruferCoherentComparison [omitted signature]
For an absolute analytic characteristic-p field F in the KL setting, every positive homogeneous chart ring P_F[f^{-1}]_0 is Prüfer. Coherent sheaves on Proj(P_F) correspond to finitely presented R̃_F-modules with invertible Frobenius linearization. Finite locally free objects correspond to finite projective Frobenius modules. The claim is absolute; Prüfer or Bézout hypotheses are not silently imposed on arbitrary relative bases.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants
Norm topology on twisted Frobenius invariants
Infrastructure for omitted parts: Actual annular norms and admissible radii, KL6.3.17 norm equivalence and completeness, not merely the induced module topology.

API TwistedInvariant [typed specialization]
The kernel of φ−π^n as an E-vector space.

API TwistedInvariant.norm [omitted signature]
Banach topology at a fixed n from any admissible annular norm.

API TwistedInvariant.radiusEquiv [omitted signature]
Different sufficiently small radii induce equivalent norms.

API TwistedInvariant.map [typed specialization]
Intertwining module maps act continuously on Γ_n.
Algebraic restriction is typed. Continuity for the canonical annular Banach topologies is omitted.

API TwistedInvariant.presentationIndependent [omitted signature]
The topological vector space is independent of projective presentation.

TEST twistedInvariant_zero [example specialization]
For M=0 the invariant Banach space is zero.

TEST twistedInvariant_n_zero [example specialization]
At n=0 the space is ker(φ−1).

TEST twistedInvariant_change_radius [omitted example]
Two admissible radii induce the same open subsets of Γ_n.

TEST twistedInvariant_not_exact_norm [omitted example]
Rescaling the chosen module norm changes its numeric values but leaves the invariant topology unchanged.

TEST twistedInvariant_sign [example specialization]
On the rank-one module with φ=π·id, π≠0 and π²≠1, Γ_1 is the whole space while ker(φ−π^{-1}) is zero. This detects the sign mismatch in KL6.3.17.

-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/continuous-frobenius-group-actions
Continuous profinite actions on Frobenius modules
Infrastructure for omitted parts: Actual Robba LF topology and invariant Banach topologies for KL6.3.18; arbitrary-module topologies do not justify the converse criterion.

API ContinuousPhiAction [typed specialization]
Frobenius-commuting semilinear G-action, whose coefficient action fixes E, with a jointly LF-continuous action map.
Typed for the supplied module topology and coefficient action. Identifying the supplied topology with the Robba LF topology is omitted.

API ContinuousPhiAction.restrictInvariants [typed specialization]
Continuous E-linear action on Γ_n for each n.
The induced-subspace continuous action is typed. The canonical annular Banach topology requires TwistedInvariant.norm.

API ContinuousPhiAction.invariantCriterion [omitted signature]
LF continuity iff every twisted-invariant action is continuous.

API ContinuousPhiAction.baseChange [omitted signature]
Continuous scalar extension along an E-algebra map compatible with the coefficient actions and Frobenius preserves the action.

TEST continuousPhiAction_trivial [example specialization]
The trivial group action is continuous and commutes with φ.

TEST continuousPhiAction_all_weights [example specialization]
The criterion quantifies over all integers n, including negative and zero twists.

TEST continuousPhiAction_finite [example specialization]
A finite discrete group acting by continuous semilinear automorphisms yields a continuous action.

TEST continuousPhiAction_requires_commutation [example specialization]
A continuous module action that does not commute with φ does not restrict to the invariant spaces and is excluded.

-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension
Two affine charts and cohomological dimension one
THEOREM curveCohomologicalDimension [omitted signature]
In the relative KL setting choose a fixed analytic coefficient field L and two homogeneous sections f_1,f_2 of the same positive degree whose images generate the unit ideal in the tilted Robba ring. Their D_+(f_i) cover Proj(P_R), each is affine and their intersection is affine. Every quasi-coherent sheaf G has H^i=0 for i>1; Čech cohomology on this two-open cover computes H⁰ and H¹. The degree-one normalization is the one used by KL 8.8.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness
Tensor global ampleness and rational-local ampleness
Infrastructure for omitted parts: Actual finite-type quasi-coherent FF sheaves, tensor powers, finite global generators and strongly rational base covers.

API BundleGloballyAmple [omitted signature]
∀ finite-type G, eventually every F^{⊗n}⊗G is finitely globally generated.

API BundleAmple [omitted signature]
Global ampleness after a strong rational cover of S.

API BundleGloballyAmple.iso [omitted signature]
The predicates are invariant under bundle isomorphism.

API BundleGloballyAmple.tensorPower [omitted signature]
Positive powers preserve and detect the predicate.

API BundleAmple.refine [omitted signature]
A refinement of the witnessing strong rational cover is also a witness.

TEST bundleAmple_positive_line [omitted example]
O(1) is globally ample.

TEST bundleAmple_unit_fails [omitted example]
O is not globally ample: tensor with O(−1) has no global sections on the geometric curve.

TEST bundleAmple_zero [omitted example]
Under the tensor-power definition the zero bundle is globally ample: for n≥1 its tensor power times every G is zero, generated by the empty finite family. No positive-rank hypothesis is added.

TEST bundleAmple_threshold [omitted example]
For O(1) tested against O(−m), a generation bound grows with m; a common threshold for all m is not required.

-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion
Power criterion for tensor global ampleness
THEOREM amplenessPowerCriterion [omitted signature]
For every positive integer m, F is globally ample iff F^{⊗m} is globally ample, with the same statement for rational-local ampleness. The test sheaf remains every finite-type quasi-coherent G.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations
Positive line ampleness and finite-type presentations
THEOREM positiveLineAmple [omitted signature]
For every integer e>0, O_alg(e) is globally ample. Every finite-type quasi-coherent G on X_S^alg is a quotient of a finite sum of integer twists O_alg(e_i). On each of the two affine charts take finitely many local generators and multiply by sufficiently high powers of its homogeneous section to extend them globally; use both charts and a common maximum exponent.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion
Cohomological criterion for tensor global ampleness
THEOREM cohomologicalAmplenessCriterion [omitted signature]
For a bundle F on X_S^alg the following are equivalent: (a) F is globally ample; (b) for every finite-type quasi-coherent G, H¹(F^{⊗n}⊗G)=0 for all sufficiently large n; (c) for every e∈Z, H¹(F^{⊗n}(e))=0 for all sufficiently large n. Thresholds may depend on G or e. The implication (c)⇒(a) must produce one positive power independently of e, then apply the power criterion.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness
Positive twists of globally étale bundles
THEOREM globallyEtalePositiveAmple [omitted signature]
In the KL coefficient setting, if F corresponds to a Robba Frobenius module with a global finite locally free étale integral model, then for every integer n>0, H¹(F(n))=0 and F(n) is globally ample. The global model hypothesis is stronger than pointwise purity. General-E specialization requires the normalized RF0 comparison; no converse to this theorem is asserted.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness
Affine nonvanishing loci of ample line sections
THEOREM ampleSectionAffine [omitted signature]
If L is a globally ample line bundle on X_S^alg and s∈Γ(L), the open nonvanishing locus D(s) is affine, including the empty case. Its coordinate ring is the degree-zero localization of ⊕_{n≥0}Γ(L^{⊗n}) at s. This yields intrinsic Proj reconstruction and the canonical independence comparison for ample choices.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability
Stability of rational standard bundles
THEOREM standardBundleStable [omitted signature]
For every λ=d/h in lowest terms, O_{X_C}(λ) is stable of rank h, degree d and slope λ. If a saturated subbundle F has rank r<h and degree s, then s/r≤λ by the wedge/H⁰ argument; equality would force h|r and is impossible.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category
Fixed-slope abelian finite-length category
THEOREM fixedSlopeAbelian [omitted signature]
For each λ∈Q, semistable bundles of slope λ together with the zero bundle form an E-linear abelian finite-length category. Its simple objects are the stable bundles. Kernels and cokernels inside this category are saturated bundle kernels and quotients; a nonzero map between stable equal-slope objects is an isomorphism. This statement precedes classification and does not yet identify all simple objects with O(λ).
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change
Base change of the geometric HN filtration
THEOREM hnBaseChange [omitted signature]
For an extension of complete algebraically closed perfectoid fields C⊂C′, the pullback of every threshold HN piece is the corresponding threshold piece on X_C′. For finite separable E′/E of degree n, the finite coefficient curve map f satisfies (f*V)^{≥λ}=f*(V^{≥λ/n}); ranks are preserved and degrees/slopes multiply by n. In particular f*O(1)=O(n). These are geometric-field and coefficient changes with different normalizations.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma
Nonzero sections of the key rank-one extension
THEOREM keyExtensionSection [omitted signature]
Let C be complete algebraically closed and let 0→O(−1)→V→O(1/n)→0 be a bundle extension on X_C, n≥1. After an extension C′/C of complete algebraically closed perfectoid fields, H⁰(X_C′,V)≠0. The proof applies in both mixed and equal characteristic and does not require a prior claim that the negative Banach–Colmez quotient is nonperfectoid in equal characteristic.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles
Geometric classification of vector bundles
THEOREM geometricBundleClassification [omitted signature]
For complete algebraically closed perfectoid C/F_q, every bundle on X_C is a finite direct sum of O(λ), uniquely up to permutation of reduced rational slopes and multiplicities. The HN filtration splits, and every semistable slope-λ bundle is O(λ)^{⊕m}. After choosing the embedding k=bar F_q→C, the finite-isocrystal functor induces a bijection on isomorphism classes in this geometric setting, but is not fully faithful on all morphisms and is not asserted to classify relative bundles on arbitrary S.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus
Hom and extension calculus for geometric bundles
THEOREM bundleHomExt [omitted signature]
For geometric standard bundles on X_C^alg, compute Ext in the abelian category of structure-sheaf modules (equivalently QCoh for these finite locally free inputs), with Ext¹ also classifying bundle extensions. Hom(O(λ),O(μ))=H⁰(O(λ)∨⊗O(μ)) vanishes for λ>μ, and Ext¹(O(λ),O(μ))=H¹(O(λ)∨⊗O(μ)) vanishes for λ≤μ. The tensor decomposes into h_λh_μ/h_{μ−λ} copies of O(μ−λ). Ext^i between these bundles vanishes for i>1. Equal-slope End(O(λ)) need not be E when its denominator exceeds one.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison
Stable-bundle division endomorphism comparison
THEOREM stableBundleEnd [omitted signature]
The natural E-algebra map End_Φ(D(−d,h))→End_{X_C}(O(d/h)) is an isomorphism for each reduced rational slope. Both identify with D_{d/h}, of dimension h² and invariant d/h mod Z. This full endomorphism comparison on one simple block coexists with the failure of full faithfulness between different slopes.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification
Coherent sheaves on the geometric curve
THEOREM geometricCoherentClassification [omitted signature]
Every coherent sheaf F on X_C^alg is, noncanonically, a direct sum T⊕V with T its torsion subsheaf and V a finite sum of O(λ). T has finite support at closed untilt points and each local piece is a finite sum of O_x/(t_x^{n_j}), n_j>0. The torsion-free quotient is locally free because the curve is regular and one-dimensional; the split is not claimed canonical. This specializes CN Theorem 3.9(iii) at E=Q_p and applies to the general-E geometric curve using its DVR charts.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras
Geometric simple connectivity via finite étale algebras
THEOREM finiteEtaleConstantAlgebras [omitted signature]
For complete algebraically closed perfectoid C, every finite étale O_{X_C}-algebra B is canonically O_{X_C}⊗_E A with A=H⁰(X_C,B) a finite étale E-algebra. Thus finite étale covers of X_C are exactly coefficient-field covers; after base change to an algebraic closure of E they split. The statement is not that X_C has no nontrivial covers over nonalgebraically closed E. Export this theorem to VStackSheavesAndLisseCategories:VS1 for its divisor and Weil-map construction.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in the packet, not replaced by predicates on arbitrary schemes.
-/
