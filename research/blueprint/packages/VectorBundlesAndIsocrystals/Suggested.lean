/-
This file is not the roadmap and is not exhaustive. README.md is definitive.
The statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. Proofs using sorry claim no implementation.

Scope: finite isocrystals, Fargues–Fontaine bundles and Banach–Colmez spaces.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

FiniteIsocrystal extends the native WittVector isocrystal class by finiteness
and general coefficients. CurveBundle specializes current Tau Ceti's finite locally free category;
its generic schematic infrastructure is imported, not reconstructed. Categorical cohomology is taken after derived
sections, not from cokernels of raw sections. Algebraic component interfaces
and numerical slope profiles do not construct the perfectoid site, the curve,
period sheaves, sympathetic algebras or diamond geometry. Conditions whose
supplier types are unavailable are omitted and specified in the contract
indexes below. They are not represented by arbitrary proposition fields.

The finite-presentation and line-class comparisons use the native modules
TauCeti.Algebra.Category.ModuleCat.Sheaf.FinitePresentation,
TauCeti.AlgebraicGeometry.LineBundle.Basic and
TauCeti.AlgebraicGeometry.LineBundle.Class when those interfaces are available.
Their signatures are indexed here rather than imitating their definitions.
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
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.Algebra.Homology.Linear
import Mathlib.Algebra.Homology.ShortComplex.Linear
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Limits.Shapes.Biproducts
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Data.Rat.Lemmas
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Topology.Bornology.Basic
import Mathlib.Topology.Constructions
import Mathlib.CategoryTheory.Limits.FunctorCategory.Basic
import Mathlib.CategoryTheory.Limits.FunctorCategory.BinaryBiproducts
import Mathlib.Algebra.Module.Submodule.Map
import Mathlib.Topology.Spectral.Basic
import Mathlib.Topology.Homeomorph.Quotient
import Mathlib.Analysis.Normed.Module.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic

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

/-! ## Schematic bundle supplier

CurveBundle on the schematic curve specializes the current Tau Ceti category
TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf. Its free sheaves, finite
presentation, pullback and rank are imports, not new generic constructions.
Those modules postdate this file's pinned baseline, so their executable aliases
and examples are omitted here. The full contracts below retain the curve's
analytic/schematic comparison and its nonempty geometric stalk test.
-/

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
README.md until its genuine carriers and hypotheses can be expressed.
The test index similarly distinguishes examples from unavailable geometry.

No placeholder proposition or invented curve predicate is used to make the
source-level theorem appear to elaborate. The geometric realization is specified in README.md.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block
Finite isocrystals over the completed maximal unramified coefficient field
Infrastructure for omitted parts: Import the completed coefficient field, extended arithmetic
Frobenius and fixed field from ReductiveGroupsPartII RG2.0.4, and the ramified Witt
comparison from RF0. Their native coefficient specialization and categorical E-linearity
are unavailable at the executable baseline; no parallel completion is constructed here.

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
The typed class conversion and intertwiner test are present. The full morphism/isomorphism naturality proof obligation is the mathematical contract in README.md.

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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction
Coefficient extension and induction adjunction
THEOREM coefficientAdjunction [omitted signature]
For finite separable E′/E of residue degree f, ramification degree e and total degree n=ef, identify the coefficient fields compatibly. Pull D to D⊗_{L_E}L_E′ with Frobenius Φ^f⊗σ_E′; induction is the f cyclic conjugate copies of restriction of scalars, with wraparound given by Φ′. Pull and induction are adjoint in both directions: Hom(Pull D,D′)≅Hom(D,Ind D′) and Hom(Ind D′,D)≅Hom(D′,Pull D). The reverse adjunction uses the perfect separable trace pairing and the identification of finite cyclic induction with coinduction; no division by n is required. Pull preserves rank and scales slopes by n; induction multiplies rank by n and divides isoclinic slopes by n. At the bundle stage they compare to pullback/pushforward along the finite étale coefficient curve map, with its two trace adjunctions.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB0/finite-galois-descent
Finite Galois descent of isocrystals
THEOREM isocrystalGaloisDescent [omitted signature]
Let L′/L be finite Galois and let σ′ be a coefficient automorphism extending σ. Finite L-vector spaces with bijective σ-semilinear Φ are equivalent to finite L′-vector spaces with bijective σ′-semilinear Φ′ and a semilinear Galois descent action ρ satisfying Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′ for every g∈Gal(L′/L). The descended module is the invariant module and Φ′ restricts to a bijective σ-semilinear Φ. Ordinary commutation with each ρ_g is sufficient only when σ′ centralizes the Galois group. This is module descent with Frobenius, not classification over arbitrary perfect residue fields.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles
Finite locally free bundles on the curve
Infrastructure: current Tau Ceti FiniteLocallyFreeSheaf supplies the schematic
category, finite local-basis comparison, free sheaves, tensor, dual, ranks and
functorial pullbacks. These supplier modules postdate the pinned baseline.
The analytic FF curve comparison still needs AdicSpacesPartII R3.

API CurveBundle [omitted signature: current Tau Ceti supplier]
A structure-sheaf module with a single finite locally free local generator witness.
The schematic specialization imports TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.
Its finite local-basis witness is characterized by
SheafOfModules.isFiniteLocallyFree_iff_exists_isLocallyFreeData_isFiniteType.
The analytic specialization still requires the AdicSpacesPartII R3 carrier.

API CurveBundle.ofFree [omitted signature: current Tau Ceti supplier]
The free sheaf of finite rank n.

API CurveBundle.ext [omitted signature: current Tau Ceti supplier]
Bundle morphisms are equal iff the underlying sheaf morphisms are equal.

API CurveBundle.pullback [omitted signature: current Tau Ceti supplier]
Pullback along curve-base change, with identity and composition isomorphisms.
Schematic pullback, identity and composition comparisons import
FiniteLocallyFreeSheaf.pullback, pullbackId and pullbackComp.

API CurveBundle.tensorDual [omitted signature: current Tau Ceti supplier]
Tensor, unit, dual and evaluation from the structure-sheaf module category.

API CurveBundle.finitePresentation [omitted signature: current Tau Ceti supplier]
Apply the pinned finite-presentation theorem to the same finite locally free witness.

TEST curveBundle_zero [omitted example: current Tau Ceti supplier]
The free sheaf on the empty family is a bundle of rank 0.

TEST curveBundle_free_two [omitted example: current Tau Ceti supplier]
O_X⊕O_X is a bundle of rank 2.

TEST curveBundle_not_infinite [omitted example: current Tau Ceti supplier]
On a nonempty geometric curve, a free sheaf on an infinite constant basis is not finite locally free; test its nonzero residue-field stalk. The nonempty hypothesis excludes the empty scheme, where the zero sheaf admits every vacuous presentation.

TEST curveBundle_schematic [omitted example: current Tau Ceti supplier]
For a scheme, forgetting CurveBundle returns its Scheme.Modules object with the pinned finite locally free data.

-/

/-
Node: VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent
Annular Frobenius descent for bundles
THEOREM annularBundleDescent [omitted signature]
For affinoid perfectoid S of characteristic p over F_q, finite locally free bundles on X_S are equivalent, exactly and tensorially, to finite projective bundles on the RF0 closed annuli with compatible overlap identifications and bijective Frobenius identification under radius rescaling. Restriction to a fundamental annular range and Frobenius translates gives the inverse. Cohomology on Y_S is acyclic in positive degrees by sousperfectoid annular acyclicity and dense restriction maps.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains
Classical points and annular Dedekind rings
THEOREM classicalPointPid [omitted signature]
For complete algebraically closed perfectoid C/F_q and a connected affinoid U=Spa(B,B⁺) in Y_C, Spm(B) identifies with the classical points of U, whose residue fields are untilts of C over E. B is a PID. On X_C, classical points are Frobenius orbits and affinoid chart rings are Dedekind domains; their PID upgrade is obtained from geometric Picard degree, rather than assumed as an early analytic input.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison
Untilts and completed local rings
THEOREM completedLocalUntilt [omitted signature]
At a classical point x of the geometric curve, identify the completed local ring with the RF2 untilt period DVR, whose residue field is C_x♯. At E=Q_p this is B_dR⁺(C_x♯). A uniformizer t_x depends on a choice of generator; neither its equality with a global t nor the equality of every untilt with a fixed C♯ is asserted.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB1/picard-degree
Picard group of the geometric curve
THEOREM picardDegreeEquivalence [omitted signature]
At complete algebraically closed C, the map Z→Pic(X_C), n↦[O(n)], is an isomorphism of groups. Every classical point has divisor class [O(1)]. Use the existing invertible-sheaf and line-bundle-class carriers, adding dual inverses and the curve-specific integer classification; a commutative monoid of classes in the baseline is not already this Picard computation.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/independence-of-positive-twist
Independence of the ample line bundle
THEOREM ampleLineIndependence [omitted signature]
Two line bundles satisfying the axiomatic generation/vanishing hypotheses on the same X yield canonically isomorphic Proj schemes, with the same locally ringed map from X and the same finite locally free equivalence. The identification is functorial and obeys the cocycle law for three choices. No arbitrary choice of line bundle without these hypotheses is included.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence
Prüfer charts and coherent Frobenius correspondence
THEOREM pruferCoherentComparison [omitted signature]
For an absolute analytic characteristic-p field F in the KL setting, every positive homogeneous chart ring P_F[f^{-1}]_0 is Prüfer. Coherent sheaves on Proj(P_F) correspond to finitely presented R̃_F-modules with invertible Frobenius linearization. Finite locally free objects correspond to finite projective Frobenius modules. The claim is absolute; Prüfer or Bézout hypotheses are not silently imposed on arbitrary relative bases.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
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
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations
Positive line ampleness and finite-type presentations
THEOREM positiveLineAmple [omitted signature]
For every integer e>0, O_alg(e) is globally ample. Every finite-type quasi-coherent G on X_S^alg is a quotient of a finite sum of integer twists O_alg(e_i). On each of the two affine charts take finitely many local generators and multiply by sufficiently high powers of its homogeneous section to extend them globally; use both charts and a common maximum exponent.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion
Cohomological criterion for tensor global ampleness
THEOREM cohomologicalAmplenessCriterion [omitted signature]
For a bundle F on X_S^alg the following are equivalent: (a) F is globally ample; (b) for every finite-type quasi-coherent G, H¹(F^{⊗n}⊗G)=0 for all sufficiently large n; (c) for every e∈Z, H¹(F^{⊗n}(e))=0 for all sufficiently large n. Thresholds may depend on G or e. The implication (c)⇒(a) must produce one positive power independently of e, then apply the power criterion.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness
Positive twists of globally étale bundles
THEOREM globallyEtalePositiveAmple [omitted signature]
In the KL coefficient setting, if F corresponds to a Robba Frobenius module with a global finite locally free étale integral model, then for every integer n>0, H¹(F(n))=0 and F(n) is globally ample. The global model hypothesis is stronger than pointwise purity. General-E specialization requires the normalized RF0 comparison; no converse to this theorem is asserted.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness
Affine nonvanishing loci of ample line sections
THEOREM ampleSectionAffine [omitted signature]
If L is a globally ample line bundle on X_S^alg and s∈Γ(L), the open nonvanishing locus D(s) is affine, including the empty case. Its coordinate ring is the degree-zero localization of ⊕_{n≥0}Γ(L^{⊗n}) at s. This yields intrinsic Proj reconstruction and the canonical independence comparison for ample choices.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability
Stability of rational standard bundles
THEOREM standardBundleStable [omitted signature]
For every λ=d/h in lowest terms, O_{X_C}(λ) is stable of rank h, degree d and slope λ. If a saturated subbundle F has rank r<h and degree s, then s/r≤λ by the wedge/H⁰ argument; equality would force h|r and is impossible.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category
Fixed-slope abelian finite-length category
THEOREM fixedSlopeAbelian [omitted signature]
For each λ∈Q, semistable bundles of slope λ together with the zero bundle form an E-linear abelian finite-length category. Its simple objects are the stable bundles. Kernels and cokernels inside this category are saturated bundle kernels and quotients; a nonzero map between stable equal-slope objects is an isomorphism. This statement precedes classification and does not yet identify all simple objects with O(λ).
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change
Base change of the geometric HN filtration
THEOREM hnBaseChange [omitted signature]
For an extension of complete algebraically closed perfectoid fields C⊂C′, the pullback of every threshold HN piece is the corresponding threshold piece on X_C′. For finite separable E′/E of degree n, the finite coefficient curve map f satisfies (f*V)^{≥λ}=f*(V^{≥λ/n}); ranks are preserved and degrees/slopes multiply by n. In particular f*O(1)=O(n). These are geometric-field and coefficient changes with different normalizations.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma
Nonzero sections of the key rank-one extension
THEOREM keyExtensionSection [omitted signature]
Let C be complete algebraically closed and let 0→O(−1)→V→O(1/n)→0 be a bundle extension on X_C, n≥1. After an extension C′/C of complete algebraically closed perfectoid fields, H⁰(X_C′,V)≠0. The proof applies in both mixed and equal characteristic and does not require a prior claim that the negative Banach–Colmez quotient is nonperfectoid in equal characteristic.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles
Geometric classification of vector bundles
THEOREM geometricBundleClassification [omitted signature]
For complete algebraically closed perfectoid C/F_q, every bundle on X_C is a finite direct sum of O(λ), uniquely up to permutation of reduced rational slopes and multiplicities. The HN filtration splits, and every semistable slope-λ bundle is O(λ)^{⊕m}. After choosing the embedding k=bar F_q→C, the finite-isocrystal functor induces a bijection on isomorphism classes in this geometric setting, but is not fully faithful on all morphisms and is not asserted to classify relative bundles on arbitrary S.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus
Hom and extension calculus for geometric bundles
THEOREM bundleHomExt [omitted signature]
For geometric standard bundles on X_C^alg, compute Ext in the abelian category of structure-sheaf modules (equivalently QCoh for these finite locally free inputs), with Ext¹ also classifying bundle extensions. Hom(O(λ),O(μ))=H⁰(O(λ)∨⊗O(μ)) vanishes for λ>μ, and Ext¹(O(λ),O(μ))=H¹(O(λ)∨⊗O(μ)) vanishes for λ≤μ. The tensor decomposes into h_λh_μ/h_{μ−λ} copies of O(μ−λ). Ext^i between these bundles vanishes for i>1. Equal-slope End(O(λ)) need not be E when its denominator exceeds one.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison
Stable-bundle division endomorphism comparison
THEOREM stableBundleEnd [omitted signature]
The natural E-algebra map End_Φ(D(−d,h))→End_{X_C}(O(d/h)) is an isomorphism for each reduced rational slope. Both identify with D_{d/h}, of dimension h² and invariant d/h mod Z. This full endomorphism comparison on one simple block coexists with the failure of full faithfulness between different slopes.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification
Coherent sheaves on the geometric curve
THEOREM geometricCoherentClassification [omitted signature]
Every coherent sheaf F on X_C^alg is, noncanonically, a direct sum T⊕V with T its torsion subsheaf and V a finite sum of O(λ). T has finite support at closed untilt points and each local piece is a finite sum of O_x/(t_x^{n_j}), n_j>0. The torsion-free quotient is locally free because the curve is regular and one-dimensional; the split is not claimed canonical. This specializes CN Theorem 3.9(iii) at E=Q_p and applies to the general-E geometric curve using its DVR charts.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/

/-
Node: VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras
Geometric simple connectivity via finite étale algebras
THEOREM finiteEtaleConstantAlgebras [omitted signature]
For complete algebraically closed perfectoid C, every finite étale O_{X_C}-algebra B is canonically O_{X_C}⊗_E A with A=H⁰(X_C,B) a finite étale E-algebra. Thus finite étale covers of X_C are exactly coefficient-field covers; after base change to an algebraic closure of E they split. The statement is not that X_C has no nontrivial covers over nonalgebraically closed E. Export this theorem to VStackSheavesAndLisseCategories:VS1 for its divisor and Weil-map construction.
Unavailable hypothesis/carrier: the actual FF coefficient/period curve and its source-specific descent, degree, coherent-sheaf or diamond comparison. These hypotheses are stated precisely in README.md, not replaced by predicates on arbitrary schemes.
-/


noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped ZeroObject
universe u v w
namespace TauCeti.BanachColmez

/-! Derived hypercohomology. Cohomology is computed *after* RGamma. -/
section Sections
variable {C : Type u} [Category.{v} C] [Abelian C]
variable (RGamma : C ⥤ CochainComplex C ℤ)

/-- Object-level positive section sheaf. The FF bundle embedding in C is omitted. -/
def BC (E : C) : C := ((RGamma.obj E).homology (0 : ℤ))
/-- Negative bundles only in the roadmap; the missing HN predicate is omitted. -/
def BCneg (E : C) : C := ((RGamma.obj E).homology (1 : ℤ))
/-- K is already the image of the two-term complex under derived sections.
The universal H⁰(E₁) condition is omitted until the relative curve exists. -/
def BCcomplex (K : CochainComplex C ℤ) : C := K.homology (0 : ℤ)
namespace BC
/-- The whole homology functor supplies both identity and composition. -/
def map : C ⥤ C := RGamma ⋙ HomologicalComplex.homologyFunctor C (.up ℤ) 0
/-- E-module structure: with the coefficient field acting linearly on the owner
category (E-module v-sheaves) and on derived sections, `map` is additive and
linear. The E-module v-sheaf structure itself is the owner category's. -/
theorem module (K : Type w) [Field K] [Linear K C] [RGamma.Additive]
    [RGamma.Linear K] : ∃ _ : (map RGamma).Additive, (map RGamma).Linear K := by sorry
/-- Exact sequence: `s` is the short exact sequence of derived-section complexes
of 0→E′→E→E″→0 (producing it from the bundle sequence is the omitted
derived-section interface). Degree-zero and degree-one cohomology then form
BC(E′)→BC(E)→BC(E″)→H¹(E′)→H¹(E), exact at the three middle places. -/
theorem exactSequence (s : ShortComplex (CochainComplex C ℤ)) (hs : s.ShortExact) :
    (ShortComplex.mk (HomologicalComplex.homologyMap s.f 0)
      (HomologicalComplex.homologyMap s.g 0) (by
        rw [← HomologicalComplex.homologyMap_comp, s.zero,
          HomologicalComplex.homologyMap_zero])).Exact ∧
    (ShortComplex.mk _ _ (hs.comp_δ 0 1 (by simp))).Exact ∧
    (ShortComplex.mk _ _ (hs.δ_comp 0 1 (by simp))).Exact :=
  ⟨hs.homology_exact₂ 0, hs.homology_exact₃ 0 1 (by simp), hs.homology_exact₁ 0 1 (by simp)⟩
/-- Requires the omitted additive derived-section interface. -/
def directSum (K L : CochainComplex C ℤ) :
    BCcomplex (K ⊞ L) ≅ BCcomplex K ⊞ BCcomplex L := by sorry
end BC
namespace BCtest
/-- Zero *derived* complex. -/
example : BCcomplex (0 : CochainComplex C ℤ) ≅ (0 : C) := by sorry
-- Name: BCtest.zero.
/-- constantSections: sections on two connected components are a product.
The identification of components of Perf_S is omitted. -/
example (E : Type u) [Field E] :
    Module.finrank E (Fin 2 → E) = 2 := by sorry
-- Name: BCtest.constantSections.
/-- hypercohomology: the actual negative contribution is H¹, not a cokernel
of raw H⁰. Here K is its derived-section complex; shift identification omitted. -/
example (E : C) (K : CochainComplex C ℤ)
    (comparison : K.homology (0 : ℤ) ≅ (RGamma.obj E).homology (1 : ℤ))
    (h : ¬ IsZero ((RGamma.obj E).homology (1 : ℤ))) :
    ¬ IsZero (BCcomplex K) := by sorry
-- Name: BCtest.hypercohomology.
end BCtest
end Sections

/-! Classical presentations: genuine short exact complexes and finite modules. -/
section Presentations
variable {K : Type u} [Field K]
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- The sympathetic domain and the Q_p specialization are not yet instantiated. -/
abbrev SympatheticVS (Sympath : Type u) [Category.{v} Sympath] :=
    Sympath ⥤ ModuleCat K
namespace SympatheticVS
/-- A constant functor, with its maps; finite dimensionality is explicit. -/
def constant (S : Type u) [Category.{v} S] (V : ModuleCat K)
    [FiniteDimensional K V] : SympatheticVS (K := K) S := by sorry
/-- Coordinatewise additive functor of the algebra-value functor supplied by
PeriodRings. Sympathetic/connected/spectral/p-root conditions are omitted. -/
def additive (S : Type u) [Category.{v} S] (A : S ⥤ ModuleCat K)
    (d : ℕ) : SympatheticVS (K := K) S := by sorry
/-- Objectwise short exactness, using the pinned ShortExact. -/
def exact (S : Type u) [Category.{v} S]
    (s : ShortComplex (S ⥤ ModuleCat K)) : Prop :=
    ∀ a : S, (s.map ((evaluation S (ModuleCat K)).obj a)).ShortExact
end SympatheticVS

/-- Both exact sequences retain their actual arrows, Y and their endpoints. -/
structure BCPresentation (constant : ModuleCat K ⥤ C) (V : ℕ → C) (W : C) where
  dim : ℕ
  V₁ : ModuleCat K
  V₂ : ModuleCat K
  finite₁ : FiniteDimensional K V₁
  finite₂ : FiniteDimensional K V₂
  Y : C
  first : ShortComplex C
  second : ShortComplex C
  firstLeft : first.X₁ ≅ constant.obj V₁
  firstMiddle : first.X₂ ≅ Y
  firstRight : first.X₃ ≅ V dim
  secondLeft : second.X₁ ≅ constant.obj V₂
  secondMiddle : second.X₂ ≅ Y
  secondRight : second.X₃ ≅ W
  firstExact : first.ShortExact
  secondExact : second.ShortExact
namespace BCPresentation
variable {constant : ModuleCat K ⥤ C} {V : ℕ → C} {W : C}
def height (P : BCPresentation constant V W) : ℤ :=
  (Module.finrank K P.V₁ : ℤ) - (Module.finrank K P.V₂ : ℤ)
/-- Additivity of the constant-space functor makes stabilization preserve
both short exact complexes. This algebraic construction does not establish
independence of arbitrary presentations. -/
def stabilize [constant.Additive] (P : BCPresentation constant V W) (T : ModuleCat K)
    [FiniteDimensional K T] :
    {Q : BCPresentation constant V W // Q.dim = P.dim ∧ Q.height = P.height ∧
      Module.finrank K Q.V₁ = Module.finrank K P.V₁ + Module.finrank K T ∧
      Module.finrank K Q.V₂ = Module.finrank K P.V₂ + Module.finrank K T} := by sorry
end BCPresentation
/-- Numerical core of a presentation, not the BC object or its realization. -/
def presentationDimension (d v₁ v₂ : ℕ) : ℕ × ℤ := (d, (v₁ : ℤ) - v₂)
namespace BCPresentationTest
-- The geometric identifications V_d, constant Q_p^h and V₁/Q_p are omitted.
example (d : ℕ) : presentationDimension d 0 0 = (d, 0) := by sorry -- additive
example (h : ℕ) : presentationDimension 0 h 0 = (0, (h : ℤ)) := by sorry -- constant
example : presentationDimension 1 0 1 = (1, -1) := by sorry -- quotient
example (d a b : ℕ) : presentationDimension d (a+1) (b+1) =
    presentationDimension d a b := by sorry -- stabilize
end BCPresentationTest
end Presentations

/-! Curvature is expressed by actual Hom spaces, monos and finite filtrations. -/
section Curvature
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- Finite iterated extensions of the additive generator. -/
inductive AffineClosure (Ga : C) : C → Prop
  | zero : AffineClosure Ga 0
  | iso {X Y : C} : AffineClosure Ga X → (X ≅ Y) → AffineClosure Ga Y
  | step (s : ShortComplex C) : s.ShortExact → AffineClosure Ga s.X₁ →
      (s.X₃ ≅ Ga) → AffineClosure Ga s.X₂
namespace BCCurvature
def positive (Ga W : C) : Prop := ∀ f : W ⟶ Ga, f = 0
def nonnegative (BdRplus W : C) : Prop := ∀ f : W ⟶ BdRplus, f = 0
def affine (Ga W : C) : Prop := AffineClosure Ga W
/-- The supplier supplies the actual d-fold BdRplus powers. -/
def negative (powers : ℕ → C) (W : C) : Prop :=
  ∃ d, ∃ f : W ⟶ powers d, Mono f
/-- BdRplus-modules and their restriction-of-scalars functor are supplied. -/
def nonpositive {D : Type u} [Category.{v} D] (forget : D ⥤ C) (W : C) : Prop :=
  ∃ M : D, ∃ f : W ⟶ forget.obj M, Mono f
theorem iso (Ga BdRplus : C) (powers : ℕ → C)
    {D : Type u} [Category.{v} D] (forget : D ⥤ C) {X Y : C} (e : X ≅ Y) :
    (positive Ga X ↔ positive Ga Y) ∧
    (nonnegative BdRplus X ↔ nonnegative BdRplus Y) ∧
    (affine Ga X ↔ affine Ga Y) ∧
    (negative powers X ↔ negative powers Y) ∧
    (nonpositive forget X ↔ nonpositive forget Y) := by sorry
end BCCurvature
end Curvature

/-! Canonical filtration: intersection-of-kernel signatures at module values.
The corresponding subfunctors and BC universal properties need period VS. -/
section Filtration
variable {K : Type u} [Field K]
variable {S : Type u} [Category.{v} S]
variable (W : S ⥤ ModuleCat K) (B : ℕ → S ⥤ ModuleCat K)
variable (D : S ⥤ ModuleCat K) (a : S)
/-- Submodule-valued component of the actual subfunctors. -/
structure BCCanonicalFiltration where
  positivePart : Submodule K (W.obj a)
  nonnegativePart : Submodule K (W.obj a)
  nested : positivePart ≤ nonnegativePart
namespace BCCanonicalFiltration
/-- Intersect kernels of *natural VS maps*, not all linear maps at C. -/
def positive : Submodule K (W.obj a) :=
  ⨅ m, ⨅ f : W ⟶ B m, LinearMap.ker (f.app a).hom
def nonnegative : Submodule K (W.obj a) :=
  ⨅ f : W ⟶ D, LinearMap.ker (f.app a).hom
/-- Every natural map preserves the component submodules. -/
theorem map (W' : S ⥤ ModuleCat K) (f : W ⟶ W') :
    (positive W B a).map (f.app a).hom ≤ positive W' B a ∧
    (nonnegative W D a).map (f.app a).hom ≤ nonnegative W' D a := by sorry
/-- Component universal property. Identifying nonpositive VS targets with
those annihilated by the positive subfunctor is omitted. -/
theorem nonpositiveQuotient {Z : Type u} [AddCommGroup Z] [Module K Z]
    (f : (W.obj a) →ₗ[K] Z) (h : positive W B a ≤ LinearMap.ker f) :
    ∃! g : ((W.obj a) ⧸ positive W B a) →ₗ[K] Z,
      g.comp (positive W B a).mkQ = f := by sorry
/-- The actual affine graded component; geometric maximality is omitted. -/
def affinePart (F : BCCanonicalFiltration W a) :
    F.nonnegativePart ⧸ (F.positivePart.comap F.nonnegativePart.subtype) := by sorry
end BCCanonicalFiltration
end Filtration

/-! Numerical HN invariants, preserving the dimension/height convention. -/
structure BCHNInvariants where
  rank : ℕ
  degree : ℤ
  isZero : Bool
namespace BCHNInvariants
/-- Numerical conversion only: degrees give dimension, ranks give minus
height. `isZero` here tests vanishing of all input numbers; agreement with the
zero coherent object needs the omitted geometric invariant comparison. -/
def fromHeart (deg₀ degNeg : ℤ) (rank₀ rankNeg : ℕ) (_h : 0 ≤ deg₀-degNeg) :
    BCHNInvariants where
  rank := (deg₀ - degNeg).toNat
  degree := (rankNeg : ℤ) - rank₀
  isZero := decide (deg₀ = 0 ∧ degNeg = 0 ∧ rank₀ = 0 ∧ rankNeg = 0)
/-- none belongs to the zero object; a nonzero dimension-zero object has −∞. -/
def slope (I : BCHNInvariants) : Option (WithBot ℚ) :=
  if I.isZero then none else if I.rank = 0 then some ⊥
  else some (((I.degree : ℚ) / I.rank : ℚ) : WithBot ℚ)
/-- U_{h,d}: curve slope d/h, BC slope −h/d. Nonzero d is essential. -/
theorem standard (h : ℕ) (d : ℤ) (hh : 0 < h) (hd : d ≠ 0) :
    ((- (h : ℚ)) / d) = -1 / ((d : ℚ) / h) := by sorry
end BCHNInvariants
namespace BCHNInvariantsTest
example : (BCHNInvariants.mk 0 0 true).slope = none := by sorry -- zero
example : (BCHNInvariants.mk 0 (-1) false).slope = some ⊥ := by sorry -- rational
example : (BCHNInvariants.mk 1 0 false).slope = some (0 : WithBot ℚ) := by sorry -- affine
example : (BCHNInvariants.mk 1 (-2) false).slope = some ((-2 : ℚ) : WithBot ℚ) := by sorry -- inversion
example : (BCHNInvariants.mk 1 1 false).slope = some (1 : WithBot ℚ) := by sorry -- negative
end BCHNInvariantsTest

/-! Pointwise and relative ampleness: positive slope profiles only. -/
def PointwiseAmple {X : Type u} (slopes : X → List ℚ) : Prop :=
  ∀ x, ∀ a ∈ slopes x, 0 < a
namespace PointwiseAmple
theorem pullback {X Y : Type u} (slopes : X → List ℚ) (f : Y → X)
    (h : PointwiseAmple slopes) : PointwiseAmple (slopes ∘ f) := by sorry
/-- Tensor slopes are the pairwise sums, with multiplicities. -/
theorem tensor {X : Type u} (s t : X → List ℚ)
    (hs : PointwiseAmple s) (ht : PointwiseAmple t) :
    PointwiseAmple (fun x => (s x).flatMap (fun a => (t x).map (a + ·))) := by sorry
/-- Requires the missing Proj/Robba equivalence; equality of its matched
slope profiles is the supported comparison input. -/
theorem projComparison {X : Type u} (s t : X → List ℚ) (h : s = t) :
    PointwiseAmple s ↔ PointwiseAmple t := by sorry
end PointwiseAmple
namespace PointwiseAmpleTest
example : PointwiseAmple (fun _ : Unit => [1]) := by sorry -- positive
example : ¬ PointwiseAmple (fun _ : Unit => [0]) := by sorry -- unit
example : ¬ PointwiseAmple (fun _ : Unit => [2,-1]) := by sorry -- mixed
example : PointwiseAmple (fun _ : Unit => []) := by sorry -- zero
end PointwiseAmpleTest
/-- All supplied affinoid-chart profiles. Their Proj ampleness comparison is
omitted; the mathematical definition quantifies over all perfectoid pullbacks. -/
def RelativeAmple {I X : Type u} (charts : I → X → List ℚ) : Prop :=
  ∀ i, PointwiseAmple (charts i)
namespace RelativeAmple
theorem fibreCriterion {I X : Type u} [Nonempty I] (s : X → List ℚ) :
    RelativeAmple (fun _ : I => s) ↔ PointwiseAmple s := by sorry
theorem pullback {I X Y : Type u} (s : I → X → List ℚ) (f : Y → X)
    (h : RelativeAmple s) : RelativeAmple (fun i => s i ∘ f) := by sorry
theorem surjectiveDescent {I X Y : Type u} (s : I → X → List ℚ)
    (f : Y → X) (h : Function.Surjective f) :
    RelativeAmple s ↔ RelativeAmple (fun i => s i ∘ f) := by sorry
/-- The semicontinuity/openness conditions of the geometric slope function
are not yet expressible, so only its explicitly defined locus is supplied. -/
def openLocus {I X : Type u} (s : I → X → List ℚ) : Set X :=
    {x | ∀ i, ∀ a ∈ s i x, 0 < a}
end RelativeAmple
namespace RelativeAmpleTest
example (s : Unit → List ℚ) : RelativeAmple (fun _ : Unit => s) ↔
    PointwiseAmple s := by sorry -- affinoid
example (a : ℕ) (h : 0 < a) :
    RelativeAmple (fun _ _ : Unit => [(1 : ℚ)/a]) := by sorry -- untiltLine
example : ¬ RelativeAmple (fun _ _ : Unit => [0]) := by sorry -- unit
end RelativeAmpleTest

/-! Pure-model lattice interface. Boundedness is commensurability with a
finite R-submodule, as in KL Definition 7.3.1, p. 147; it is not generic
bornological boundedness. The period rings and localization are suppliers.
The lattice is not assumed finitely generated. This is normalized lattice data:
`generates` expresses only B-span, not the tensor identification M₀⊗B≅M.
The actual integral coefficient Frobenius, its restriction/linearization on the
lattice and scalar-extension isomorphism remain omitted. Thus bijectivity on
the underlying set is not asserted to establish a pure model over period rings. -/
section PureModels
variable {R B M : Type u} [CommRing R] [Field B] [Algebra R B]
variable [AddCommGroup M] [Module B M] [Module R M] [IsScalarTower R B M]
structure PureModel (p : B) (F : M ≃+ M) (c : ℤ) (d : ℕ) where
  uniformizerNonzero : p ≠ 0
  lattice : Submodule R M
  bounded : ∃ N : Submodule R M, Module.Finite R N ∧ ∃ n : ℕ,
    (∀ x ∈ lattice, p^n • x ∈ N) ∧ (∀ x ∈ N, p^n • x ∈ lattice)
  generates : Submodule.span B (lattice : Set M) = ⊤
  coefficientFrobenius : B ≃+* B
  fixedUniformizer : coefficientFrobenius p = p
  semilinear : ∀ b x, F (b • x) = coefficientFrobenius b • F x
  exponent : ℕ
  exponentPositive : 0 < exponent
  denominatorMultiple : exponent ∣ d
  denominatorPositive : 0 < d
  frobenius : Set.BijOn (fun x => p^c • (F^[d]) x)
    (lattice : Set M) (lattice : Set M)
namespace PureModel
/-- The supported criterion is normalized Frobenius bijectivity at c=0.
The comparison with the geometric étale module category is omitted. -/
theorem etale (p : B) (F : M ≃+ M) (d : ℕ)
    (P : PureModel (R := R) p F 0 d) :
    Set.BijOn (fun x => (F^[d]) x) (P.lattice : Set M) (P.lattice : Set M) := by sorry
/-- On a trivializing vector the normalization forces φ^d=p^{-c}.
The conclusion that every geometric Robba slope is c/d is omitted. -/
theorem fibreSlope (p : B) (hp : p ≠ 0) (F : M ≃+ M) (c : ℤ) (d : ℕ)
    (x : M) (hx : p^c • (F^[d]) x = x) :
    (F^[d]) x = p^(-c) • x := by sorry
end PureModel
namespace PureModelTest
-- Named tests state the normalization core; integral period lattices are omitted.
example (p : B) (hp : p ≠ 0) (d : ℕ) (hd : 0 < d) (N : Submodule R M)
    (bounded : ∃ N₀ : Submodule R M, Module.Finite R N₀ ∧ ∃ n : ℕ,
      (∀ x ∈ N, p^n • x ∈ N₀) ∧ (∀ x ∈ N₀, p^n • x ∈ N))
    (generates : Submodule.span B (N : Set M) = ⊤) :
    ∃ P : PureModel (R := R) p (AddEquiv.refl M) 0 d, P.lattice = N := by sorry -- unit
example [Subsingleton M] (p : B) (hp : p ≠ 0) (F : M ≃+ M) (c : ℤ) (d : ℕ) (hd : 0 < d) :
    Nonempty (PureModel (R := R) p F c d) := by sorry -- zero
example (p : B) (hp : p ≠ 0) (c : ℤ) (x : M) : p^c • (p^(-c) • x) = x := by sorry -- scaled
end PureModelTest
end PureModels

/-! Twisted-local-system fibres with *actual* coefficient semilinearity.
The site, sheaf local constancy and arithmetic Frobenius of Q_{p^d} are omitted. -/
section Twisted
variable {L V : Type u} [Field L] [AddCommGroup V] [Module L V]
structure TwistedLocalSystem (p : L) (σ : L ≃+* L) (c : ℤ) (d : ℕ) where
  finite : FiniteDimensional L V
  frobenius : V ≃+ V
  semilinear : ∀ a x, frobenius (a • x) = σ a • frobenius x
  coefficientPeriod : ∀ a, (σ^[d]) a = a
  fixedUniformizer : σ p = p
  denominatorPositive : 0 < d
  iterate : ∀ x, p^c • (frobenius^[d]) x = x
namespace TwistedLocalSystem
/-- Pullback fibre via a linear equivalence. Site pullback descent is omitted. -/
def pullback {V' : Type u} [AddCommGroup V'] [Module L V']
    (p : L) (σ : L ≃+* L) (c : ℤ) (d : ℕ)
    (T : TwistedLocalSystem (V := V) p σ c d) (e : V ≃ₗ[L] V') :
    TwistedLocalSystem (V := V') p σ c d := by sorry
/-- Numeric equal-slope core only; unramified coefficient extension and the
natural equivalence of étale sheaf categories are omitted. -/
theorem reindex (c e : ℤ) (d f : ℕ) (hd : d ≠ 0) (hf : f ≠ 0)
    (h : c * (f : ℤ) = e * (d : ℤ)) :
    (c : ℚ)/d = (e : ℚ)/f := by sorry
end TwistedLocalSystem
namespace TwistedLocalSystemTest
example (p : L) (T : TwistedLocalSystem (V := V) p (RingEquiv.refl L) 0 1)
    (x : V) : T.frobenius x = x := by sorry -- zeroSlope
/-- For c≠0 and p a uniformizer the p^c≠1 hypothesis is supplied by valuation. -/
example (p : L) (c : ℤ) (h : p^c ≠ 1) :
    ¬ ∀ x : L, p^c * x = x := by sorry -- nonzeroTwist
example : (1 : ℚ)/2 = (2 : ℚ)/4 := by sorry -- reindex
end TwistedLocalSystemTest
end Twisted

/-! Tilted coherent heart, using the pinned derived category. -/
section Heart
variable {C : Type u} [Category.{v} C] [Abelian C] [HasDerivedCategory.{w} C]
variable (slopes : C → List (WithTop ℚ))
/-- Coh_X is a supplier. The profile includes torsion slope +∞. -/
def TiltCondition (K : DerivedCategory C) : Prop :=
  (∀ i : ℤ, i ≠ -1 → i ≠ 0 → IsZero ((DerivedCategory.homologyFunctor C i).obj K)) ∧
  (∀ a ∈ slopes ((DerivedCategory.homologyFunctor C (-1)).obj K), a < 0) ∧
  (∀ a ∈ slopes ((DerivedCategory.homologyFunctor C 0).obj K), 0 ≤ a)
abbrev BCTiltedHeart := ObjectProperty.FullSubcategory (TiltCondition slopes)
namespace BCTiltedHeart
/-- The underlying object is the actual degree-zero embedding. Zero and
isomorphism compatibility of profiles are ordinary explicit hypotheses. -/
def positive
    (zeroProfile : ∀ Z : C, IsZero Z → slopes Z = [])
    (isoProfile : ∀ {X Y : C}, (X ≅ Y) → slopes X = slopes Y)
    (E : C) (h : ∀ a ∈ slopes E, 0 ≤ a) : BCTiltedHeart slopes :=
  ⟨(DerivedCategory.singleFunctor C 0).obj E, by sorry⟩
/-- Places a negative sheaf at degree −1, equivalently E[1]. -/
def negative
    (zeroProfile : ∀ Z : C, IsZero Z → slopes Z = [])
    (isoProfile : ∀ {X Y : C}, (X ≅ Y) → slopes X = slopes Y)
    (E : C) (h : ∀ a ∈ slopes E, a < 0) : BCTiltedHeart slopes :=
  ⟨(DerivedCategory.singleFunctor C (-1)).obj E, by sorry⟩
/-- Off-diagonal Hom is Ext¹(E₀,F₋₁); there is no opposite off-diagonal. -/
def homMatrix (E₀ E₁ F₀ F₁ : C) :
    (((DerivedCategory.singleFunctor C 0).obj E₀ ⊞ (DerivedCategory.singleFunctor C (-1)).obj E₁ ⟶
      (DerivedCategory.singleFunctor C 0).obj F₀ ⊞ (DerivedCategory.singleFunctor C (-1)).obj F₁) ≃
      (E₀ ⟶ F₀) × (E₁ ⟶ F₁) ×
      ((DerivedCategory.singleFunctor C 0).obj E₀ ⟶ (DerivedCategory.singleFunctor C (-1)).obj F₁)) := by sorry
end BCTiltedHeart
namespace BCTiltedHeartTest
-- Source-specific identifications O(1), O(−1), torsion and O are omitted.
-- The actual single-degree derived objects and their slope profiles remain.
example
    (zeroProfile : ∀ Z : C, IsZero Z → slopes Z = [])
    (isoProfile : ∀ {X Y : C}, (X ≅ Y) → slopes X = slopes Y)
    (E : C) (h : slopes E = [1]) :
    TiltCondition slopes ((DerivedCategory.singleFunctor C 0).obj E) := by sorry -- positive
example
    (zeroProfile : ∀ Z : C, IsZero Z → slopes Z = [])
    (isoProfile : ∀ {X Y : C}, (X ≅ Y) → slopes X = slopes Y)
    (E : C) (h : slopes E = [(-1 : ℚ)]) :
    TiltCondition slopes ((DerivedCategory.singleFunctor C (-1)).obj E) ∧
    ¬ TiltCondition slopes ((DerivedCategory.singleFunctor C 0).obj E) := by sorry -- negative
example
    (zeroProfile : ∀ Z : C, IsZero Z → slopes Z = [])
    (isoProfile : ∀ {X Y : C}, (X ≅ Y) → slopes X = slopes Y)
    (E : C) (h : slopes E = [⊤]) :
    TiltCondition slopes ((DerivedCategory.singleFunctor C 0).obj E) := by sorry -- torsion
example
    (zeroProfile : ∀ Z : C, IsZero Z → slopes Z = [])
    (isoProfile : ∀ {X Y : C}, (X ≅ Y) → slopes X = slopes Y)
    (E : C) (h : slopes E = [0]) :
    ¬ TiltCondition slopes ((DerivedCategory.singleFunctor C (-1)).obj E) := by sorry -- shift
end BCTiltedHeartTest
end Heart

/-! Generated abelian extension closure, without arbitrary ambient subobjects. -/
section Abstract
variable {C : Type u} [Category.{v} C] [Abelian C]
inductive AbstractBC (Qp Ga : C) : C → Prop
  | rational : AbstractBC Qp Ga Qp
  | additive : AbstractBC Qp Ga Ga
  | zero : AbstractBC Qp Ga 0
  | iso {X Y : C} : AbstractBC Qp Ga X → (X ≅ Y) → AbstractBC Qp Ga Y
  | kernel {X Y : C} (f : X ⟶ Y) : AbstractBC Qp Ga X → AbstractBC Qp Ga Y →
      AbstractBC Qp Ga (Limits.kernel f)
  | cokernel {X Y : C} (f : X ⟶ Y) : AbstractBC Qp Ga X → AbstractBC Qp Ga Y →
      AbstractBC Qp Ga (Limits.cokernel f)
  | extension (s : ShortComplex C) : s.ShortExact → AbstractBC Qp Ga s.X₁ →
      AbstractBC Qp Ga s.X₃ → AbstractBC Qp Ga s.X₂
namespace AbstractBC
theorem kernelCokernel (Qp Ga : C) {X Y : C} (f : X ⟶ Y)
    (hX : AbstractBC Qp Ga X) (hY : AbstractBC Qp Ga Y) :
    AbstractBC Qp Ga (Limits.kernel f) ∧ AbstractBC Qp Ga (Limits.cokernel f) := by sorry
end AbstractBC
namespace AbstractBCTest
example (Qp Ga : C) : AbstractBC Qp Ga Qp ∧ AbstractBC Qp Ga Ga := by sorry -- generators
example (Qp Ga : C) : AbstractBC Qp Ga 0 := by sorry -- zero
example (Qp Ga : C) (f : Qp ⟶ Ga) : AbstractBC Qp Ga (Limits.cokernel f) := by sorry -- quotient
/-- Evaluation forgets the category's Dimension invariant; the topological
isomorphism C≅C⊕Q_p requires the sympathetic evaluation supplier. -/
example : presentationDimension 1 0 0 ≠ presentationDimension 1 1 0 := by sorry -- points
end AbstractBCTest
end Abstract

/-! Scalar quotient at field-valued points. V-sheafification, torsors and
relative base change are omitted, not replaced by a set-theoretic quotient. -/
section Projectivization
variable {E V : Type u} [Field E] [AddCommGroup V] [Module E V]
def punctured := {v : V // v ≠ 0}
def scalarOrbit : Setoid (punctured (V := V)) where
  r x y := ∃ a : Eˣ, (a : E) • x.val = y.val
  iseqv := by sorry
/-- This is only the objectwise scalar-orbit carrier of BCProjectivization. -/
def BCProjectivization := Quotient (scalarOrbit (E := E) (V := V))
namespace BCProjectivization
/-- Pointwise freeness; the sheaf torsor statement is omitted. -/
theorem torsor (x : punctured (V := V)) (a : Eˣ) :
    (a : E) • x.val = x.val ↔ a = 1 := by sorry
/-- The universal property of invariant maps, using the pinned quotient. -/
def lift {Z : Type u} (f : punctured (V := V) → Z)
    (h : ∀ x y, (scalarOrbit (E := E)).r x y → f x = f y) :
    BCProjectivization (E := E) (V := V) → Z := by sorry
/-- Comparison along a supplied semilinear equivalence; v-base change omitted. -/
def baseChange {E' V' : Type u} [Field E'] [AddCommGroup V'] [Module E' V']
    (r : E ≃+* E') (e : V ≃+ V')
    (semilinear : ∀ a x, e (a • x) = r a • e x) :
    BCProjectivization (E := E) (V := V) ≃ BCProjectivization (E := E') (V := V') := by sorry
end BCProjectivization
namespace BCProjectivizationTest
example (h : Subsingleton V) : IsEmpty (BCProjectivization (E := E) (V := V)) := by sorry -- zero
example : Nonempty (BCProjectivization (E := E) (V := E) ≃ Unit) := by sorry -- line
/-- unitTwist: the scalar fibres give the divisor comparison. The untilt and
actual Div¹ realization are omitted; neither invariant maps nor point orbits
alone are substituted for the v-sheaf quotient. -/
example (Div : Type u) (divisor : punctured (V := V) → Div)
    (surjective : Function.Surjective divisor)
    (fibres : ∀ x y, divisor x = divisor y ↔ (scalarOrbit (E := E)).r x y) :
    Nonempty (BCProjectivization (E := E) (V := V) ≃ Div) := by sorry
end BCProjectivizationTest
end Projectivization

/-! Quantitative topology: this theorem needs no FF or diamond carrier. -/
section Contraction
variable {X : Type u} [TopologicalSpace X]
def fixedSet (γ : X ≃ₜ X) : Set X := {x | γ x = x}
abbrev movedSet (γ : X ≃ₜ X) := {x : X // x ∉ fixedSet γ}
def movedIterate (γ : X ≃ₜ X) (n : ℤ) (x : movedSet γ) : movedSet γ :=
  ⟨(γ^n) x.val, by sorry⟩
def contractingOrbit (γ : X ≃ₜ X) : Setoid (movedSet γ) where
  r x y := ∃ n : ℤ, movedIterate γ n x = y
  iseqv := by sorry
local instance : TopologicalSpace ℤ := ⊥
/-- FS II.2.17 with all its topological hypotheses. Generalization chains
use the pinned orientation y ⤳ x. Int has the discrete topology. -/
theorem ContractingActionLemma (γ : X ≃ₜ X)
    (locallySpectral : ∀ x : X, ∃ U : Set X,
      x ∈ U ∧ IsOpen U ∧ SpectralSpace U)
    (taut : ∀ U : Set X, IsOpen U → IsCompact U → IsCompact (closure U))
    (chains : ∀ x y z : X, Specializes y x → Specializes z x →
      Specializes y z ∨ Specializes z y)
    (fixedSpectral : SpectralSpace (fixedSet γ))
    (contracts : ∀ x : X, ∀ U : Set X, IsOpen U → fixedSet γ ⊆ U →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (γ^n) x ∈ U)
    (escapes : ∀ x : movedSet γ, ∀ U : Set X, IsOpen U → IsCompact U →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (γ^(-(n : ℤ))) x.val ∉ U) :
    IsClosed (fixedSet γ) ∧
    (∀ x : movedSet γ, ∀ n : ℤ, movedIterate γ n x = x → n = 0) ∧
    Topology.IsClosedEmbedding
      (fun z : movedSet γ × ℤ => (z.1, movedIterate γ z.2 z.1)) ∧
    SpectralSpace (Quotient (contractingOrbit γ)) := by sorry
end Contraction

/-! Additional discriminating components of the source's unit tests. -/
section VSExamples
variable {K : Type u} [Field K] {S : Type u} [Category.{v} S]
variable (A : S ⥤ ModuleCat K) (a : S)
namespace SympatheticVSTest
example : (SympatheticVS.constant S (ModuleCat.of K K)).obj a ≅ ModuleCat.of K K := by sorry -- constants
example : SympatheticVS.additive S A 0 ≅ (0 : S ⥤ ModuleCat K) := by sorry -- zero
example (d e : ℕ) : SympatheticVS.additive S A (d+e) ≅
    SympatheticVS.additive S A d ⊞ SympatheticVS.additive S A e := by sorry -- finiteSum
/-- evaluation: actual injectivity of the evaluation map on an algebra.
The analytic spectrum Spm Λ and the spherical closure are omitted. -/
example (Λ C : Type u) (spm : Type u) (evaluate : Λ → spm → C)
    (h : Function.Injective evaluate) (x y : Λ)
    (same : ∀ z, evaluate x z = evaluate y z) : x = y := by sorry
end SympatheticVSTest
end VSExamples

section CurvatureExamples
variable {C : Type u} [Category.{v} C] [Abelian C]
variable (Ga BdRplus : C)
namespace BCCurvatureTest
/-- All five geometric predicates hold at zero. Here the three Hom/filtration
predicates require no period-module realization. -/
example : BCCurvature.positive Ga (0 : C) ∧
    BCCurvature.nonnegative BdRplus (0 : C) ∧ BCCurvature.affine Ga (0 : C) := by sorry -- zero
end BCCurvatureTest
end CurvatureExamples

section LatticeMonodromy
variable {R Kp V : Type u} [CommRing R] [NormedField Kp] [Algebra R Kp]
variable [NormedAddCommGroup V] [NormedSpace Kp V]
variable [Module R V] [IsScalarTower R Kp V] [Nontrivial V]
/-- PureModelTest.localNotGlobal: the actual bounded-lattice obstruction.
The perfected Tate curve supplies the omitted monodromy representation. -/
example (p : Kp) (hp : p ≠ 0) (hnorm : ‖p‖ ≠ 1) :
    ¬ ∃ N : Submodule R V, Bornology.IsBounded (N : Set V) ∧
      Submodule.span Kp (N : Set V) = ⊤ ∧
      Set.BijOn (fun x : V => p • x) (N : Set V) (N : Set V) := by sorry
end LatticeMonodromy

/-! Generic categorical and numerical components. Source-specific exactness,
equivalences, resolutions and geometric comparisons are omitted in the full
contract index below, rather than asserted for arbitrary categories. -/
section CategoricalTheorems
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- Generated kernel/cokernel/extension closure is abelian. The independent
Dimension formula belongs to BCPresentation.dimension and the contract index. -/
@[instance_reducible]
def DimensionAbelian (Qp Ga : C) :
    Abelian (ObjectProperty.FullSubcategory (AbstractBC Qp Ga)) := by sorry
/-- Monos preserve negative curvature; quotients preserve positive curvature. -/
theorem CurvatureSubquotients (Ga : C) (powers : ℕ → C) {U W Q : C}
    (i : U ⟶ W) [Mono i] (q : W ⟶ Q) [Epi q] :
    (BCCurvature.negative powers W → BCCurvature.negative powers U) ∧
    (BCCurvature.positive Ga W → BCCurvature.positive Ga Q) := by sorry
end CategoricalTheorems

section NumericalTheorems
/-- BC dimensions of B_m and of the standard positive/negative spaces.
Their geometric identities are omitted; the sign and integer formulas remain. -/
theorem StandardDimensionExamples (h m : ℕ) (d : ℤ) :
    presentationDimension m 0 0 = (m,0) ∧
    (if 0 ≤ d then (d,(h : ℤ)) else (-d,-(h : ℤ))) =
      (|d|, if 0 ≤ d then (h : ℤ) else -(h : ℤ)) := by sorry
/-- The embedding/no-V₁ condition is a categorical statement in the full
contract. Its numerical consequence excludes the zero object. -/
theorem EmbeddingHeightBound (dim : ℕ) (height : ℤ)
    (h : (dim : ℤ) < height) :
    (dim = 0 ∨ -(height : ℚ)/(dim : ℚ) < -1) := by sorry
/-- All geometric smoothness and degree-local-constancy clauses are omitted. -/
theorem PositiveRangeDimension (d₀ d₁ : ℤ) (r₀ r₁ : ℕ) (h : 0 ≤ d₀-d₁) :
    ((BCHNInvariants.fromHeart d₀ d₁ r₀ r₁ h).rank,
      (BCHNInvariants.fromHeart d₀ d₁ r₀ r₁ h).degree) =
        ((d₀-d₁).toNat, (r₁ : ℤ)-r₀) := by sorry
/-- Only the normalization core: the untilt line has slope 1/a, not 1. -/
theorem UntiltPositiveLine (a : ℕ) (ha : 0 < a) : 0 < (1 : ℚ)/a := by sorry
/-- Retains the finite coefficient extension in the BC dimension. -/
theorem SemistablePeriodExample (extensionDegree : ℕ) :
    presentationDimension extensionDegree 2 0 = (extensionDegree,2) := by sorry
/-- Equal rational slope, not identical coefficient fields or fibre ranks. -/
theorem PurityDenominatorIndependence (c e : ℤ) (d f : ℕ)
    (hd : d ≠ 0) (hf : f ≠ 0) :
    (c : ℚ)/d = (e : ℚ)/f ↔ c*(f : ℤ) = e*(d : ℤ) := by sorry
end NumericalTheorems

section RelativeSignatures
variable {X : Type u} [TopologicalSpace X]
/-- Surjective descent of the every-fibre slope condition. -/
theorem SurjectivePurityDescent {Y : Type u} (f : Y → X)
    (hf : Function.Surjective f) (s : X → List ℚ) (a : ℚ) :
    (∀ x, ∀ b ∈ s x, b=a) ↔ (∀ y, ∀ b ∈ s (f y), b=a) := by sorry
end RelativeSignatures

section AmplenessComparison
/-- Supplied profile agrees with every-chart profile; Proj ample criterion omitted. -/
theorem AmpleIffPointwise {I X : Type u} [Nonempty I] (s : X → List ℚ) :
    RelativeAmple (fun _ : I => s) ↔ PointwiseAmple s := by sorry
end AmplenessComparison


section RemainingProfiles
/-- Positive F eventually dominates fixed G: exact finite-profile slope sums.
Compact-base uniform boundedness is omitted; here both profiles are finite. -/
theorem PositiveTensorDomination (s t : List ℚ) (hs : ∀ a ∈ s, 0 < a) :
    ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      ∀ a ∈ s, ∀ b ∈ t, 0 < n*a+b := by sorry
/-- The actual two-out-of-three pure slope criterion on an exact sequence
with the HN multiset identity. The KL geometric model equivalence is omitted. -/
theorem PureTwoOutOfThree (s t u : List ℚ) (a : ℚ) (h : t.Perm (s++u)) :
    ((∀ b ∈ s, b=a) ∧ (∀ b ∈ u, b=a) → ∀ b ∈ t, b=a) ∧
    ((∀ b ∈ s, b=a) ∧ (∀ b ∈ t, b=a) → ∀ b ∈ u, b=a) ∧
    ((∀ b ∈ t, b=a) ∧ (∀ b ∈ u, b=a) → ∀ b ∈ s, b=a) := by sorry
/-- Only the every-fibre common-slope predicate; constructing local pure
models over each of the three coefficient rings is omitted. -/
theorem AllRingsPointwisePurity {X : Type u} (slopes : X → List ℚ)
    (a : ℚ) (h : ∀ x, ∀ b ∈ slopes x, b=a) :
    ∀ x, ∀ b ∈ slopes x, ∀ c ∈ slopes x, b=c := by sorry
/-- Concrete monodromy obstruction on a rational line; constructing its
Tate-curve sheaf and the ring-level/ sheaf-level distinction is omitted. -/
theorem LocalGlobalPurityCounterexamples (p : ℚ) (hp : p ≠ 0) (h : p ≠ 1) :
    Function.Bijective (fun x : ℚ => p*x) ∧ ¬ ∀ x : ℚ, p*x=x := by sorry
end RemainingProfiles


end TauCeti.BanachColmez

/-! Full contract index

`[component signature]` and `[component example]` refer only to the explicitly
typed algebraic, categorical or numerical component above. They do not identify
an arbitrary category, functor, height or profile with the geometric source.
`[omitted signature]` and `[omitted example]` have no executable assertion; the
full target below and its source/hypotheses specify what is needed. In particular,
short-complex formation does not imply exactness, arbitrary categories are not
equivalent, and arbitrary slope functions are not semicontinuous.

The scalar-orbit quotient is pointwise, not a v-sheaf quotient. SympatheticVS
is only a functor-category interface until the specified sympathetic domain is
constructed. PureModel records bounded normalized lattice data, with its
scalar-extension and integral linearization clauses omitted. Fibre semilinearity
is not the local-system sheaf condition. Numerical examples do not construct
O(−1), the untilt point or the Tate-curve local system. ContractingActionLemma
retains all topological hypotheses of FS Lemma II.2.17, pp.72–74.

CN contracts assume E=Q_p and C the completion of an algebraic closure of a
complete discretely valued characteristic-zero K with perfect countable residue
field. SW’s abstract BC category allows arbitrary complete algebraically closed
C/Q_p. Relative FS statements allow general local E.

VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition
Sources: FS-geometrization, Definition I.3.5, p. 19; two-term definition after II.2.1, p. 58; FS-geometrization, Two-term definition after Proposition II.2.1, p. 58.
Declaration: BC [component signature]
Contract: For a perfectoid S/F_q and a bundle E on X_S, BC(E)(T)=H⁰(X_T,E_T). If E has
only negative geometric slopes, BCneg(E)(T)=H¹(X_T,E_T). For a complex [E₁→E₀] in
COHOMOLOGICAL degrees −1,0 with H⁰(X_T,E₁,T)=0 for EVERY T/S, BCcomplex(T)=H⁰
RΓ(X_T,[E₁→E₀]_T), the degree-zero hypercohomology v-sheaf. No representability is
assumed. FS calls these homological degrees [0,1].
Hypotheses: S belongs to Perf_Fq; coefficients are the fixed local field E with
uniformizer π. Derived v-descent is imported from the companion; the universal H⁰
vanishing prevents negative cohomology of the section complex.
API BC [component signature]: The v-sheaf T↦H⁰(X_T,E_T).
API BCneg [component signature]: For universally negative slopes, T↦H¹(X_T,E_T).
API BCcomplex [component signature]: Degree-zero hypercohomology of [E₁→E₀] in degrees −1,0, with universal
H⁰(E₁) vanishing.
API BC.module [component signature]: BC(E), BCneg(E) and BCcomplex are sheaves of E-modules on Perf_S, E
acting through O_{X_T}, and BC.map is E-linear. This scalar action is the one
BCProjectivization divides out.
API BC.map [component signature]: A bundle or complex map induces the corresponding E-linear map of v-sheaves;
identity and composition are preserved.
API BC.exactSequence [component signature]: A short exact sequence 0→E′→E→E″→0 of bundles gives an exact
sequence of E-module v-sheaves 0→BC(E′)→BC(E)→BC(E″)→H¹(E′)→H¹(E)→H¹(E″)→0 (Prop. II.2.1
and the two-term complex); for [E₁→E₀] with E₁ universally negative it gives
0→BC(E₀)→BCcomplex→BCneg(E₁)→H¹(E₀).
Missing interface for BC.baseChange: Actual relative derived sections and its restriction/base-change comparison are unavailable; arbitrary functors need not commute.
API BC.baseChange [omitted signature]: For U→S, restriction of BCcomplex on Perf_U is BCcomplex of the
pulled-back complex.
API BC.directSum [component signature]: BCcomplex(K⊕L)≅BCcomplex(K)⊕BCcomplex(L) in the abelian category of
E-module v-sheaves.
Test BCtest.zero [component example] (degenerate): The zero complex has zero BC v-sheaf.
Missing fixture for BCtest.single: The actual degree-zero/shifted curve embeddings and their derived-section comparison are unavailable; arbitrary functors need not recover H⁰ and H¹.
Test BCtest.single [omitted example] (compatibility): BCcomplex([0→E])=BC(E) and BCcomplex([E→0])=BCneg(E)
when E is negative.
Test BCtest.constantSections [component example] (computation): For S the disjoint union of two geometric
points, BC(O)(S)=E², not E; BC(O) is the constant SHEAF underline E.
Test BCtest.hypercohomology [component example] (non-example): For [O(−1)→0] over a geometric point,
BCcomplex=H¹(O(−1))≠0 although the cokernel of the map of H⁰ groups is zero.
Direct imports: VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles,
VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology,
VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology,
mathlib:CategoryTheory.Sheaf, mathlib:CategoryTheory.ShortComplex.homology.

VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover
Sources: FS-geometrization, Proposition II.2.2, p. 60; SW13-moduli, Theorem A, p. 3; SW13-moduli, Proposition 3.1.3(iii), p. 22; SW13-moduli, Lemma 3.5.1, p. 29.
Declaration: LubinTateUniversalCover [omitted signature]
Missing interface: Actual Lubin–Tate universal cover, untilt, eigensection module and logarithm/evaluation maps are required.
Contract: Let S = Spa(R,R^+) be affinoid perfectoid over F_q with untilt S^sharp over E,
and let O_{X_S}(1) correspond to the isocrystal (E, pi^{-1}). Then X -> sum over i in Z
of pi^i [X^{q^{-i}}] defines a natural isomorphism G-tilde(R^{sharp+}) = R^{circ circ}
-> H^0(X_S, O(1)) = H^0(Y_S, O_{Y_S})^{phi = pi}, and the evaluation map H^0(X_S,O(1))
-> R^sharp at S^sharp is the logarithm map log_G : G-tilde(R^{sharp+}) -> G(R^{sharp+})
-> R^sharp.
Hypotheses: G = G_LT is the Lubin-Tate formal O_E-module over O_E-breve, normalized by M
= W_{O_E}(k) with F = sigma/pi in Dieudonne theory (with the SW20 renormalisation
dividing F by p and base changing along W(k) tensor_{Z_p} O_E -> W_{O_E}(k)); under this
normalisation G is already defined over O_E. G-tilde = inverse limit of G along
multiplication by pi, isomorphic to Spf O_E[[X-tilde^{1/p^infty}]]; for pi-adically
complete A one has G-tilde(A) = G-tilde(A/pi) = Hom_{O_E}(E/O_E, G(A/pi))[1/pi] = the
topologically nilpotent elements of A^flat. The equal-characteristic case is a direct
power-series computation with the condition r_i = r_{i+1}^q. In the p-adic case the
proof replaces B_{R,[1,infty]} by the crystalline period ring B^+_crys of R^{sharp+}/pi
and cites [SW13, Theorem A]. SW13 Theorem A establishes full faithfulness of Dieudonné
theory after passing to isogenies for f-semiperfect R; it also establishes integral full
faithfulness when R=S/J with S perfect and J regular. Here f-semiperfect means Frobenius
is surjective and lim_Phi R has a finitely generated ideal of definition; O_C/p is the
motivating example. The deduction of the displayed identity B^{phi=pi}_{R,[1,infty]} =
Hom_{O_E}(E/O_E, G(R^{sharp+}/pi))[1/pi] from that full-faithfulness statement is NOT
written out in Fargues-Scholze. The explicit-formula compatibility is [SW13, Lemma
3.5.1], read: the map G-tilde(R) -> M(G)(S)[1/p] coming from Dieudonne theory agrees
with q log, proved by functoriality reduction to G = Q_p/Z_p. The perfectoid-ball shape
of the universal cover is [SW13, Proposition 3.1.3(iii)], read: if R is perfect of
characteristic p, G connected and Lie G free of dimension d, then G-tilde = Spf
R[[X_1^{1/p^infty}, ..., X_d^{1/p^infty}]].
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition,
VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent,
VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology,
VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology,
RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence,
FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1,
FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence.

VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence
Sources: FS-geometrization, Propositions II.2.3–II.2.4, pp. 60–61.
Declaration: FundamentalExactSequence [omitted signature]
Missing interface: The actual O→O(1)→O_untilt sequence with untilt over E_infty is required; a short complex alone is not short exact.
Contract: For any perfectoid S with untilt S^sharp over E_infty, the above construction
gives an exact sequence 0 -> O_{X_S} -> O_{X_S}(1) -> O_{S^sharp} -> 0 of
O_{X_S}-modules. Consequently there is a well-defined map BC(O(1)) minus {0} -> Div^1
sending a nonzero section f to V(f), and it descends to an isomorphism (BC(O(1)) minus
{0})/E^times = Div^1. The scalar E×-torsor is the Lubin–Tate Tate-module torsor; its
comparison with the divisor-to-Weil-group map imports VS1 and arithmetic local
reciprocity, rather than reproving class field theory.
Hypotheses: For II.2.3 the untilt S^sharp must be over E_infty (the completion of the
union of the Lubin-Tate level fields E_n), not merely over E; this is what supplies the
canonical nonzero section. The check that the map O_{X_S} -> I(1) is an isomorphism is
done on geometric points. The vanishing locus computation identifies the zeroes of the
logarithm on G-tilde^ad_E minus {0} with the disjoint union over n of Spa E_n, each a
simple zero. Corollary II.2.4 uses BC(O(1)) = Spd F_q[[X^{1/p^infty}]], so BC(O(1))
minus {0} = Spa F_q((X^{1/p^infty})) = Spd E_infty, and the map to Div^1 is Spd E_infty
-> Spd E -> Spd E/phi^Z, a quotient first by O_E^times and then by pi^Z.
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover,
VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles,
RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate,
RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness,
VStackSheavesAndLisseCategories:VS1.

VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC
Sources: FS-geometrization, Proposition II.2.16, p. 72.
Declaration: PropernessOfProjectivizedBc [omitted signature]
Missing interface: The relative BC v-sheaf, its scalar sheaf quotient and the partially proper/proper morphisms are required.
Contract: For a bundle E on X_S with S perfectoid over F_q, its section v-sheaf
BC(E)(T)=H⁰(X_T,E_T) is a locally spatial diamond and is partially proper over S.
Removing its zero section and taking the E^×-quotient yields a locally spatial diamond
proper over S. Ampleness in II.2.6 and positive-twist geometry in II.2.5(iii) supply the
proof without the bundle classification theorem.
Hypotheses: S may be assumed qcqs for the second part. The presentation 0 -> E ->
O_{X_S}(n)^m -> O_{X_S}(n')^{m'} is obtained by applying Thm. II.2.6 to E^dual and
dualising, with n, n' > 0 - the positivity of n, n' is what lets II.2.5(iii) apply. It
suffices to treat (BC(E) minus {0})/pi^Z because the O_E^times-action is free, so ECD
Proposition 11.24 (last part) applies. The contracting-action criterion is checked by
formally reducing to BC(O_{X_S}(n)^m) and then to A^1_{S^sharp} by evaluating sections
at a collection of untilts.
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition,
VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma,
DiamondsAndVStacks:D5/relative-representability, DiamondEtaleCohomology:C4,
VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization.

VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma
Sources: FS-geometrization, Lemma II.2.17, pp. 72–74.
Declaration: ContractingActionLemma [component signature]
Contract: Suppose X is locally spectral and taut, and the generalizations of each point
are linearly ordered by specialization. An automorphism γ has a spectral fixed locus X₀.
Assume that for every x∈X and every open neighborhood U of X₀, γⁿ(x) lies in U for all
sufficiently large n, and that the negative orbit of every point outside X₀ eventually
avoids each quasicompact open of X. Then X₀ is closed. On its complement, the γ^Z-action
is free and totally discontinuous: its action map (X∖X₀)×Z→(X∖X₀)² is a closed
immersion. The orbit space (X∖X₀)/γ^Z is spectral.
Hypotheses: X taut locally spectral; generalization sets totally ordered chains
(automatic for locally spatial diamonds by ECD Prop. 11.19, and tautness holds if X is
partially proper over a spatial diamond by ECD Prop. 18.10). X_0 must be a spectral
space, and both convergence conditions (i) and (ii) are needed. Total discontinuity is
in the strong sense: the action map (X minus X_0) x Z -> (X minus X_0) x (X minus X_0)
is a closed immersion.
Direct imports: mathlib:SpectralSpace, mathlib:Specializes,
DiamondsAndVStacks:D0/locally-spectral-space,
tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition,
DiamondEtaleCohomology:C4.

VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution
Sources: FS-geometrization, Proposition II.3.1, pp. 75–76; Corollary II.3.3(i), p. 78.
Declaration: PositiveSlopeResolution [omitted signature]
Missing interface: Actual relative curve bundles, rank/degree and standard slope-1/r bundles on an analytic cover are required.
Contract: If all geometric slopes of a bundle E are ≥1/r, r≥1, then analytically locally
on S there is 0→O^m→F→E→0 with F fibrewise semistable of SLOPE 1/r. On a constant-rank
n, degree d component, rank(F)=dr and m=dr−n. This extends FS II.3.1’s geometric
construction via II.3.3(i). Rank-zero E is treated separately.
Hypotheses: r is a positive integer; standard O(1/r) has rank r and degree 1.
Analytic-local existence is distinguished from the strict-positive étale-local
presentation in the next node.
Direct imports:
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus,
VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles,
VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence,
VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon.

VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces
Sources: FS-geometrization, Proposition II.3.5, pp. 79–81.
Declaration: FamiliesOfBanachColmezSpaces [omitted signature]
Missing interface: The actual derived boundary maps, universal negative source slopes and positive target slopes with the specified locality are required.
Contract: For [E₁→E₀] in degrees −1,0, with E₁ negative at every geometric point of S,
BCcomplex is a locally spatial diamond partially proper over S; its punctured
E×-quotient is locally spatial and proper over S. If E₀ is everywhere strictly positive,
BCcomplex→S is cohomologically smooth. In this positive range,
0→BC(E₀)→BCcomplex→BCneg(E₁)→0 is exact as E-module v-sheaves. Neither unpunctured
absolute spatiality nor perfectoid representability is asserted.
Hypotheses: E_1 must have only NEGATIVE slopes at all geometric points; this is what
makes H^0(X_T,E_1) = 0 (Prop. II.3.4(i)) so that the two-term complex has a well-defined
H_0. Part (iii) additionally requires all slopes of E_0 to be POSITIVE. All assertions
are etale-local, in fact v-local, on S. The reduction replaces [E_1 -> E_0] by a
quasi-isomorphic [E'_1 -> O_{X_S}(-d)^m] obtained from a surjection O_{X_S}(-d)^m -> E_0
with d > 0 given by Thm. II.2.6; E'_1 still has only negative slopes. Separatedness of
BC(O_{X_S}(-d)^m[1]) from Prop. II.2.5(i) is used to reduce (i) and (ii) to BC(E'_1[1]).
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition,
VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution,
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation,
VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma,
DiamondSixOperations:S4, DiamondSixOperations:S5,
DiamondsAndVStacks:D5/relative-representability,
VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations,
VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing,
VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization.

VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality
Sources: FS-geometrization, Proposition II.3.7, pp. 82–83.
Declaration: AbsoluteBcSpatiality [omitted signature]
Missing interface: The actual punctured absolute BC space attached to a nonzero pure isocrystal, with its sign and scalar action, is required.
Contract: On the absolute site Perf_k, with k an algebraic closure of F_q, take a
nonzero isocrystal D whose slopes all have the same strict sign. If they are negative,
put W=BC(E(D)); if positive, put W=BC(E(D)[1]). These choices reflect the reversal of
slopes under E. The open punctured sheaf W∖{0} is a spatial diamond and is
cohomologically smooth over the absolute base. The map (W∖{0})/E^×→∗ is proper,
cohomologically smooth, and representable in spatial diamonds. This relative
representability condition does not make every absolute total quotient spatial: for
positive d the π^Z-quotient of punctured BC(O(d)) fails quasiseparatedness.
Hypotheses: D has slopes of a single sign; mixed-sign isocrystals are not covered by
this statement. One works on Perf_k with k algebraically closed. The proof of (i)
chooses, by Dieudonne-Manin, a basis in which phi is E-rational and U = phi^N is
diagonal with entries powers of pi for some N > 0 - i.e. D is DECENT in the sense of
Rapoport-Zink Definition 1.8. Since U = φ^N and BC(D) (resp. BC(D[1])) is already
defined on Perf_Fq, the action of U agrees with that of Frob^N. The hypotheses of Lemma
II.2.17 are checked for U^{-1} (resp. U) after base change to Spa F_q((t^{1/p^∞})),
because that lemma needs a spatial base; the quotient statement is translated back using
that the absolute Frobenius acts trivially on topological spaces. Surjectivity of the
sum map is checked on geometric points using Prop. II.2.9 (every element of P_d is a
product of elements of P_1).
Direct imports:
VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces,
VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals,
DiamondsAndVStacks:D5/spatial-v-sheaf-criterion,
DiamondsAndVStacks:D5/relative-representability, DiamondSixOperations:S4,
DiamondSixOperations:S5,
VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison,
DiamondsAndVStacks:D5,
VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma,
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
DiamondsAndVStacks:D3/locally-profinite-torsors.

VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon
Sources: FS-geometrization, Theorem II.2.19(i) and proof, p. 74.
Declaration: SemicontinuityOfHnPolygon [omitted signature]
Missing interface: Actual constant-rank relative FF bundles, geometric fibre HN polygons and the proper projectivized-BC argument are required.
Contract: For a constant-rank n bundle E on X_S, the concave HN polygon, horizontal
coordinate rank and decreasing slopes repeated with their ranks, is upper semicontinuous
on |S|: for every x∈[0,n] its ordinate is upper semicontinuous. Rank and total degree
are locally constant. This is FS II.2.19(i), including equal-characteristic coefficient
fields. The polygon is the UPPER boundary of the convex hull of the exterior-power
section points; do not replace it by KL’s convex lower polygon.
Hypotheses: S is perfectoid over F_q; rank n is constant on the component considered.
Geometric-point values are invariant under extension of the complete algebraically
closed field.
Direct imports:
VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC,
VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon,
VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles,
VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change.

VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting
Sources: FS-geometrization, Theorem II.2.19(ii) and proof, pp. 74–75.
Declaration: RelativeHnFiltrationAndProetaleSplitting [omitted signature]
Missing interface: Actual constant fibre polygon, saturated subbundles, HN graded pieces, standard blocks and pro-étale cover are required; an arbitrary flag is insufficient.
Contract: Assume the HN polygon of E is constant on S. Then there exists a global
separated exhaustive decreasing Harder-Narasimhan filtration E^{>= lambda} in E
specialising to the HN filtration at each point; and after replacing S by a PRO-ETALE
cover the filtration can be split, with isomorphisms E^lambda =
O_{X_S}(lambda)^{n_lambda} for integers n_lambda >= 0.
Hypotheses: S is perfectoid over F_q, the bundle has constant rank and constant
geometric HN polygon. Splitting is PRO-ÉTALE local; it is not asserted étale local or
globally split.
Direct imports: VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon,
VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC,
VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles,
VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus,
DiamondsAndVStacks:D3/locally-profinite-torsors, DiamondEtaleCohomology:C4,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology.

VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems
Sources: FS-geometrization, Corollary II.2.20, p. 75.
Declaration: SlopeZeroLocalSystems [omitted signature]
Missing interface: The actual pro-étale E-local-system and relative bundle categories with every geometric slope zero are required.
Contract: There is an exact tensor equivalence between finite-rank pro-étale E-local
systems on S and vector bundles on X_S whose EVERY geometric HN slope is zero, via
L↦L⊗_E O_X. The quasi-inverse is T↦H⁰(X_T,E_T); it commutes with perfectoid base change
and coefficient extension with its normalized Frobenius. Locally constant rank is
handled componentwise. Total degree zero alone does not suffice.
Hypotheses: Every geometric fibre is semistable of slope zero. On each component of
locally constant rank its HN polygon is therefore the fixed zero polygon. Fibrewise
triviality does not trivialize the descent datum globally. Full faithfulness is proved
by pro-étale descent, reducing to L trivial, and then by Prop. II.2.5(ii):
H⁰(X_S,O)=underline E(S), the locally constant E-valued functions on |S|, and
RΓ(X_S,O)=RΓ_proét(S,E). Essential surjectivity is Thm. II.2.19(ii) applied with a
single slope 0. A local system is not the same as a globally trivial bundle: the descent
datum is the content.
Direct imports:
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology,
DiamondsAndVStacks:D3/locally-profinite-torsors, mathlib:CategoryTheory.Equivalence,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists.

VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations
Sources: FS-geometrization, Corollary II.3.3(i)–(iv), pp. 78–79; II.3.2 proof, pp. 76–78.
Declaration: StrictPositiveEtalePresentations [omitted signature]
Missing interface: Actual relative curve bundles, standard twists, étale covers and the source-specific direct-summand E′ variants are required.
Contract: Let S∈Perf_Fq, E a bundle on X_S and r≥1. (a) If all HN slopes of E at all
geometric points are >1/r, then étale locally on S, for some m≥0, there is
0→G→O(1/r)^m→E→0 with G fibrewise SEMISTABLE of slope 0 (FS II.3.2, II.3.3(iii)). (b) If
all slopes are ≥1/r, then locally on S there is 0→O(1/(2r))^m→F→E′→0 with F fibrewise
semistable of slope 1/r and E a direct summand of E′ (II.3.3(ii)). (c) If all slopes are
>1/r, then étale locally on S there is 0→G→O(1/r)^m→E′→0 with G fibrewise semistable of
slope 1/(2r) and E a direct summand of E′ (II.3.3(iv)). Claims (b) and (c) retain E′. On
a component where E has constant degree d, the sequence in (a) forces m=d, since O(1/r)
has rank r and degree 1 (FS print m=dr, E29). Fibrewise semistability, not merely degree
zero, is what the subsequent separatedness and pro-étale trivialization arguments use.
Hypotheses: r≥1; finite constant ranks and degrees after passing to components. The
analytic and étale topologies in the three assertions are distinct.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution,
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent,
VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC,
VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles,
VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon.

VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing
Sources: FS-geometrization, Proposition II.3.4(i)–(iii), p. 79.
Declaration: RelativeCohomologyVanishing [omitted signature]
Missing interface: Actual relative FF derived sections and geometric slopes with the distinct global/pro-étale/étale vanishing conditions are required.
Contract: For a bundle E on X_S: everywhere negative slopes imply H⁰(X_S,E)=0,
universally after perfectoid base change; everywhere nonnegative slopes imply
H¹(X_S,E)=0 after some pro-étale cover of S; everywhere positive slopes imply an étale
cover S′→S such that H¹(X_T,E_T)=0 for EVERY affinoid perfectoid T/S′. The second
assertion is local vanishing of cohomology, not vanishing on every original S.
Hypotheses: S∈Perf_Fq; slope assertions hold at all geometric points.
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition,
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution,
VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology.

VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison
Sources: FS-geometrization, Proposition II.3.6, pp. 81–82.
Declaration: DivisorSectionComparison [omitted signature]
Missing interface: Actual Div^d, degree-d sections, symmetric-power cover and the v-sheaf scalar quotient are required.
Contract: For d≥1, the already owned absolute divisor v-sheaf Div^d of degree-d relative
Cartier divisors is (BC(O(d))∖{0})/E^×. It is proper over ∗, representable in spatial
diamonds and cohomologically smooth. The sum map (Div¹)^d→Div^d is a quasi-pro-étale
cover identifying Div^d=(Div¹)^d/Σ_d as v-sheaves; in particular Div^d is a diamond (ECD
Propositions 11.4, 11.6).
Hypotheses: Absolute curve over k=bar F_q; coefficient field E as in FS; d positive
integral.
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence,
VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC,
RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf,
DiamondsAndVStacks:D5/spatial-v-sheaf-criterion, DiamondsAndVStacks:D5,
DiamondSixOperations:S5,
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
DiamondsAndVStacks:D3/locally-profinite-torsors.

VectorBundlesAndIsocrystals:VB3:general-BC/punctured-absolute-quotients
Sources: FS-geometrization, Remarks II.3.10–II.3.11, pp. 83–84; FS-geometrization, Proof of Lemma II.2.15 and footnote 5, p. 71.
Declaration: PuncturedAbsoluteQuotients [omitted signature]
Missing interface: The actual punctured absolute BC(O(d)), d≥1, with uniformizer action is required; arbitrary contracting-orbit spaces may be quasiseparated.
Contract: For d≥1 on Perf_k, punctured BC(O(d)) is a spatial diamond. Write
Q=(BC(O(d))∖{0})/π^Z. Although Q is not quasiseparated, Q→∗ is representable in spatial
diamonds. The full scalar quotient identifies with Div^d, and Div^d→∗ is both proper and
representable in spatial diamonds. For equal-characteristic E, punctured positive
absolute spaces, corresponding to negative isocrystal slopes, are perfectoid; the
negative absolute spaces are spatial diamonds. For p-adic E the relative space
BC(O_{X_C}(−1)[1]) cannot be perfectoid, by the argument of FS II.2.15. The
corresponding equal-characteristic assertion is left unresolved in footnote 5 of that
source.
Hypotheses: Use punctured spaces throughout; absolute spatiality and relative spatial
representability are different assertions.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality,
VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison,
DiamondsAndVStacks:D5/relative-representability, DiamondsAndVStacks:D5,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists.

VectorBundlesAndIsocrystals:VB3:general-BC/negative-quaternion-example
Sources: FS-geometrization, Example II.3.12, p. 84.
Declaration: NegativeQuaternionExample [omitted signature]
Missing interface: The actual quaternion division algebra, reduced norm, independent section locus and negative BC space are required.
Contract: Over Perf_k, the absolute punctured BC(O(−1)[1])∖{0} classifies extensions
0→O(−1)→E→O→0 that are non-split fiberwise; geometrically E≅O(−1/2). It identifies with
(BC(O(1/2))∖{0})/SL₁(D), where D is the quaternion division algebra over E (invariant
1/2) and SL₁(D) its reduced-norm-one group. After base change to Spa C with a chosen
untilt C♯/E, BC(O(−1)[1])×_k Spa C≅(A¹_{C♯})^♢/E and the punctured space becomes
(Ω_{C♯})^♢/E with Ω = A¹_E∖E = P¹_E∖P¹(E). The latter description uses the untilt and is
not an identification with a perfectoid quotient space.
Hypotheses: The nonzero extension has fixed determinant; the acting group is SL₁(D), not
D×.
Direct imports:
VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles,
VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus,
VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison,
VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign,
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence,
VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality,
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
DiamondsAndVStacks:D3/locally-profinite-torsors.

VectorBundlesAndIsocrystals:VB3:general-BC/negative-sl2-example
Sources: FS-geometrization, Example II.3.13, p. 85.
Declaration: NegativeSl2Example [omitted signature]
Missing interface: The actual independent-pair section locus, untilt and negative BC extension construction are required.
Contract: Over Perf_k, the absolute punctured BC(O(−2)[1])∖{0}≅U/SL₂(E), where
U⊂(BC(O(1))∖{0})² is the open locus of pairs of sections that are fiberwise nonzero and
E-linearly independent, U=(BC(O(1))∖{0})²∖(E^××1).Δ. The corresponding extension
0→O(−1)→O²→O(1)→0 is specified by a surjection and its determinant trivialization;
changing the determinant-preserving basis gives SL₂(E), not GL₂(E).
Hypotheses: Nonzero extension class; determinant fixed.
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover,
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence,
VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles,
VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus,
VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality,
VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting,
DiamondsAndVStacks:D3/locally-profinite-torsors.

VectorBundlesAndIsocrystals:VB4/annular-basis-approximation
Sources: KL15, §7.1, Lemmas 7.1.1–7.1.2, pp. 145–146.
Declaration: AnnularBasisApproximation [omitted signature]
Missing interface: A given annular basis of the actual phi-module with its radius and invertible Frobenius matrix bounds is required; arbitrary modules have no specified rank.
Contract: For a φ^a-module M over ℛ̃_R, write M_r for its radius-r model. A basis of the
annular restriction M_[r/q,r] extends as a basis of M_r if its Frobenius matrix is
invertible over ℛ̃_R^{r/q} (Lemma 7.1.1). For the quantitative version (Lemma 7.1.2),
fix h≥0 and D=diag(p^{d₁},…,p^{d_n}), with integer exponents satisfying |d_i−d_j|≤h.
Suppose the annular basis e_i has Frobenius matrix F over ℛ̃_R^{[r/q,r/q]} and
λ(α^{r/q})(FD−I)<p^{−h}. There is a change-of-basis matrix U with v_j=Σ_i U_ij e_i
giving a basis of M_r; its Frobenius matrix F′ satisfies F′D−I∈p Mat_n(ℛ̃_R^{int,r/q}).
The bounds on this change are λ(α^{r/q})(U−I)<p^{−h} and λ(α^r)(D⁻¹UD−I)<p^{−h}.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent,
VectorBundlesAndIsocrystals:VB1/tilted-robba-ring.

VectorBundlesAndIsocrystals:VB4/pure-models
Sources: KL15, §7.3, Definitions 7.3.1 and 7.3.4, Lemma 7.3.3 and Remarks 7.3.2, 7.3.5, 7.3.11, pp. 147–152.
Declaration: PureModel [component signature]
Contract: Choose integers c,d with d>0 and a|d. For a φ^a-module M, let A₀=W(R) when M
has ℰ̃_R coefficients, and A₀=ℛ̃^int_R for bounded or full Robba coefficients. A
(c,d)-pure model is an A₀-submodule M₀⊂M satisfying three conditions: there exist a
finitely generated A₀-submodule N₀⊂M and n≥0 with p^nM₀⊂N₀ and p^nN₀⊂M₀; extension from
A₀ to the coefficient ring identifies M₀ with M; and the Frobenius on M restricts to an
isomorphism (p^cφ^d)^*M₀≅M₀. Thus boundedness means commensurability with a finitely
generated submodule, and the required stability is under φ^d after inverting p, without
imposing φ^a-stability at this point (Remark 7.3.2). Such a model implies pointwise
slope c/d. The adjectives free and locally free refer to finite free and finite locally
free A₀-modules; finite presentation implies local freeness. A local model at β is a
model after rational localization R→R′ through a neighborhood of β. Lemma 7.3.3 equates
existence of free and locally free local models, and for bounded Robba coefficients
allows this existence test after extension to ℰ̃_R. Define purity of slope s at β by
existence of a locally free local model with c/d=s; for nonzero rank s=μ(M,β), while
rank zero is pure of every slope. Purity means this condition at every β; compactness
then gives finitely many local models. Étaleness is slope-zero purity, and an étale
model has c=0. Global purity requires a locally free model over the original base.
Distinguish five properties: (a) global purity; (b) existence of a pure model; (c)
purity; (d) existence of local pure models; (e) pointwise purity. For ℰ̃_R and ℛ̃^bd_R,
properties (b),(c),(d),(e) are equivalent, whereas (a) is stronger. For ℛ̃_R, the
equivalent properties are (c),(d),(e), with (b) stronger and (a) stronger still. KL
Corollaries 7.3.9 and 8.5.14 supply the equivalences. Examples 8.5.17 and 8.5.18
distinguish the global conditions, with the ring-level use of the nodal example subject
to G-PATCH. Extension from ℛ̃^bd_R to ℛ̃_R does not detect purity over the bounded
coefficient ring.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
API PureModel [component signature]: A bounded integral submodule generating the ambient Frobenius module,
with p^cφ^d linearization invertible.
API PureModel.lattice [component signature]: The integral lattice is a Submodule of the restricted-scalars
module, with its actual inclusion.
Missing interface for PureModel.baseChange: Rational localization of the actual period rings, boundedness under localization, scalar extension and compatible normalized Frobenius are unavailable; an arbitrary semilinear map and F′ do not define base change.
API PureModel.baseChange [omitted signature]: Rational localization transports the pure model, its
boundedness and its Frobenius isomorphism.
API PureModel.etale [component signature]: A (0,d)-pure model is an étale model; globally pure means a
globally finite locally free such model.
API PureModel.fibreSlope [component signature]: On a nonzero fibre a (c,d)-pure model forces the Robba slope
c/d, with p^cφ^d=1 on a trivializing basis.
Test PureModelTest.unit [component example] (computation): The trivial φ-module with unit integral lattice
is (0,a)-pure.
Test PureModelTest.zero [component example] (degenerate): The zero module is pure of every slope; it has no
distinguished numeric slope.
Test PureModelTest.scaled [component example] (computation): A rank-one action φ^d=p^{−c} with standard
lattice is (c,d)-pure, detecting the sign of p^c.
Test PureModelTest.localNotGlobal [component example] (non-example): The perfected Tate-curve local system
with p monodromy is locally étale but has no global integral étale model.
Direct imports: VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules,
VectorBundlesAndIsocrystals:VB1/tilted-robba-ring, mathlib:Submodule.

VectorBundlesAndIsocrystals:VB4/pure-model-trivialization
Sources: KL15, §7.3, Proposition 7.3.6, p. 149.
Declaration: PureModelTrivialization [omitted signature]
Missing interface: A free actual pure model of its specified rank and the completed faithfully finite-étale coefficient extension are required.
Contract: If a φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) has a free (c,d)-pure model
M_0, there is an R-algebra S, the completed direct limit of faithfully finite étale
R-subalgebras, such that M_0 ⊗ W(S) (resp. M_0 ⊗ ℛ̃^int_S) has a basis fixed by p^cφ^d.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/pure-models.

VectorBundlesAndIsocrystals:VB4/purity-openness
Sources: KL15, §7.3, Theorem 7.3.7 and Corollaries 7.3.8–7.3.10, pp. 150–151.
Declaration: PurityOpenness [omitted signature]
Missing interface: Actual relative Robba modules, rational localizations and extension of a fibre pure model are required.
Contract: Take a φ^a-module M over ℛ̃_R with nonzero rank at every point, and β in its
pure locus. For integers c,d with d>0 divisible by a and c/d=μ(M,β), a (c,d)-pure model
of the fibre over ℛ̃_{ℋ(β)} spreads to a free pure model on a rational neighborhood of β
with the same parameters. For arbitrary rank, this implies openness of both purity and
étaleness on ℳ(R), equivalence of pointwise and local purity (and of pointwise and local
étaleness), and detection of purity at β by the existence of a local pure model without
a local-freeness assumption.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/annular-basis-approximation,
VectorBundlesAndIsocrystals:VB4/pure-models.

VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form
Sources: KL15, §7.4, Lemma 7.4.4, pp. 152–153.
Declaration: DiagonalGaugeNormalForm [omitted signature]
Missing interface: Actual near-identity integral Frobenius matrix, diagonal uniformizer powers and finite-étale coefficient extension are required.
Contract: For a φ^a-module over ℛ̃^bd_R, suppose its chosen Frobenius matrix is AD, with
D diagonal, D_ii∈p^Z, and A−I∈p Mat(ℛ̃^int_R). One can find an R-algebra S formed as a
union of faithfully finite étale R-subalgebras and U∈GL_n(W(S)), U≡I mod p, satisfying
U⁻¹ADφ^a(U)=D. Completion of this union is unnecessary. At every β, the generic slope
multiset is {−v_p(D_ii)/a}_i.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/annular-basis-approximation.

VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity
Sources: KL15, §7.4, Theorem 7.4.5, p. 153.
Declaration: RobbaPolygonSemicontinuity [omitted signature]
Missing interface: Actual relative Robba Frobenius modules, residue-field fibres and locally constant rank/degree are required.
Contract: For any φ^a-module M over ℛ̃_R, β ↦ the slope polygon of M ⊗ ℛ̃_{ℋ(β)} is
lower semicontinuous on ℳ(R): where the rank is constant, for each x ∈ [0, rank M] the
y-coordinate of the polygon at x is a lower semicontinuous function of β, and it is
locally constant at x = rank M.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/annular-basis-approximation,
VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form,
VectorBundlesAndIsocrystals:VB4/pure-models,
PadicDifferentialEquationsAndRigidCohomology:RD.2/special-polygon-above-generic,
VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles,
VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence,
VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change.

VectorBundlesAndIsocrystals:VB4/bounded-polygons-dense-locus
Sources: KL15, §7.4, Proposition 7.4.6 and Corollary 7.4.7, pp. 153–154.
Declaration: BoundedPolygonsDenseLocus [omitted signature]
Missing interface: Actual relative Robba modules with bounded fibre polygons, semicontinuity and locally constant rank/degree are required.
Contract: For any φ^a-module M over ℛ̃_R, the slope polygons of M at the points of ℳ(R)
are bounded above and below (all slopes are at least −N/a for N as in Proposition 6.2.4,
and the sum of the slopes is continuous). Hence the polygon takes finitely many values
locally, and there is an open dense U ⊆ ℳ(R) on which it is locally constant.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports:
VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation,
VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity.

VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule
Sources: KL15, §7.4, Lemma 7.4.8 and Theorem 7.4.9, pp. 154–155.
Declaration: ConstantVertexSubmodule [omitted signature]
Missing interface: Actual relative Robba module, a proper constant polygon vertex with strict adjacent slope gap, and saturated Frobenius quotient are required.
Contract: (7.4.8) Let A be an n × n matrix over ℛ̃^int_R invertible over ℛ̃^bd_R, x_1,
…, x_n ∈ ℛ̃^bd_R, and y_1, …, y_n ∈ ℰ̃_R with y_i − x_i = Σ_j A_{ij}φ^a(y_j). Then all
y_i lie in ℛ̃^bd_R iff their images lie in ℛ̃^bd_{ℋ(β)} for every β ∈ ℳ(R). (7.4.9) Let
M over ℛ̃_R have constant rank n and slopes μ_1(M,β) ≥ ⋯ ≥ μ_n(M,β) at β. If for some m
∈ {1, …, n−1} and all β we have μ_m(M,β) > μ_{m+1}(M,β) and μ_1 + ⋯ + μ_m constant,
there is a unique φ^a-submodule N of rank m with M/N a φ^a-module such that at every β
the slopes of N are μ_1, …, μ_m and those of M/N are μ_{m+1}, …, μ_n.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity,
VectorBundlesAndIsocrystals:VB4/pure-models,
PadicDifferentialEquationsAndRigidCohomology:RD.2/coincident-polygons-common-filtration,
VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form.

VectorBundlesAndIsocrystals:VB4/robba-constant-polygon-filtration
Sources: KL15, §7.4, Corollary 7.4.10, p. 155.
Declaration: RobbaConstantPolygonFiltration [omitted signature]
Missing interface: Actual constant fibre polygon, canonical Frobenius-stable submodules and pure graded pieces are required; an arbitrary two-step flag is insufficient.
Contract: If the slope polygon of a φ^a-module M over ℛ̃_R is constant on ℳ(R), there is
a unique filtration 0 = M_0 ⊂ ⋯ ⊂ M_l = M by φ^a-submodules whose quotients are
φ^a-modules pure of constant slope with μ(M_1/M_0) > ⋯ > μ(M_l/M_{l−1}).
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule,
VectorBundlesAndIsocrystals:VB4/purity-openness.

VectorBundlesAndIsocrystals:VB4/negative-frobenius-cohomology-detection
Sources: KL15, §7.4, Corollary 7.4.11 and Remark 7.4.12, pp. 155–156.
Declaration: NegativeFrobeniusCohomologyDetection [omitted signature]
Missing interface: Actual negative-slope relative Robba modules and the canonical geometric-fibre H¹ restriction maps are required.
Contract: If M over ℛ̃_R has everywhere negative slopes, then H^0_{φ^a}(M) = 0,
H^0_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) = 0 for all β ∈ ℳ(R), and H^1_{φ^a}(M) → ∏_β H^1_{φ^a}(M ⊗
ℛ̃_{ℋ(β)}) is injective. For any M this applies to M(n) for n small enough (by
Proposition 7.4.6); the injectivity also holds for n large, since then H^1_{φ^a}(M(n)) =
0 by Proposition 6.2.2.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology,
VectorBundlesAndIsocrystals:VB4/robba-constant-polygon-filtration,
VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule,
VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists.

VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison
Sources: KL15, §8.5, Remark 8.5.10, p. 172 (arXiv 1301.0792v5).
Declaration: RingSheafFrobeniusComparison [omitted signature]
Missing interface: The actual full Robba ring and Frobenius-sheaf categories are required; bounded/integral cases have different comparison strengths.
Contract: Let (R, R⁺) be a perfect uniform adic Banach algebra over 𝔽_p and X = Spa(R,
R⁺). For ∗ ∈ {ℰ̃, ℛ̃^bd, ℛ̃}, the natural functor from φ^d-modules over ∗_R to
φ^d-modules over the sheaf ∗_X (called local φ^d-modules over ∗_R) is fully faithful
(Theorem 5.3.3). For ∗ = ℛ̃ it is an equivalence of categories (Corollary 6.3.13); for ∗
= ℰ̃ and ∗ = ℛ̃^bd it is not (Example 8.5.17). A φ^d-module over ∗_R is pure (resp.
étale) if and only if the corresponding φ^d-module over ∗_X is.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence,
VectorBundlesAndIsocrystals:VB4/pure-models.

VectorBundlesAndIsocrystals:VB4/adic-purity-loci
Sources: KL15, §8.5, Lemma 8.5.11, p. 173 (arXiv 1301.0792v5).
Declaration: AdicPurityLoci [omitted signature]
Missing interface: Actual perfectoid/adic coefficient space and module fibres, with the period-model purity and partial-properness comparisons, are required.
Contract: For a φ^d-module M on ℛ̃_X, where X is perfect uniform over F_{p^d}, purity
and étaleness define open subspaces of X. If X lies over an analytic field, these opens
are partially proper in the sense of KL Definition 8.2.11. When X is taut, both
subspaces are taut as well, by Lemma 8.2.12. The loci concern the module M, rather than
its coefficient sheaf.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/purity-openness.

VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems
Sources: KL15, §8.5, Theorem 8.5.12, p. 173 (arXiv 1301.0792v5).
Declaration: PureModulesLocalSystems [omitted signature]
Missing interface: The six specified ring/site categories and normalized twisted local-system descent are required.
Contract: Fix c∈Z and a perfectoid space X over Q_{p^d}, with characteristic-p partner
X′ over F_{p^d}. Twisted étale (c,d)-Q_p-local systems on X, on X′, and on any adic X₀′
with inverse perfection X′ give equivalent categories. Each is also equivalent to the
category of (c,d)-pure φ-modules for any of the three coefficient sheaves ℰ̃_{X′},
ℛ̃^bd_{X′}, or ℛ̃_{X′}. These are sheaf-coefficient equivalences; they do not assert
descent to the corresponding global coefficient rings.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/pure-models,
VectorBundlesAndIsocrystals:VB4/pure-model-trivialization,
VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison,
VectorBundlesAndIsocrystals:VB4/twisted-local-systems,
VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems,
mathlib:CategoryTheory.Equivalence.

VectorBundlesAndIsocrystals:VB4/purity-denominator-independence
Sources: KL15, §8.5, Corollary 8.5.13, p. 173 (arXiv 1301.0792v5).
Declaration: PurityDenominatorIndependence [component signature]
Contract: Let X be perfect uniform over F_{p^d}, and use any of the coefficient sheaves
ℰ̃_X, ℛ̃^bd_X, ℛ̃_X for a φ^d-module M. At a fixed point x, purity with slope s is
independent of the presentation of s: it is equivalent to (c′,d′)-purity at x for all
integers c′,d′ satisfying d′>0, d|d′, and c′/d′=s.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems.

VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity
Sources: KL15, §8.5, Corollary 8.5.14, p. 173 (arXiv 1301.0792v5).
Declaration: AllRingsPointwisePurity [component signature]
Contract: Let (R, R⁺) be as in Hypothesis 5.0.1 (a perfect uniform adic Banach algebra
over 𝔽_p that is a Banach algebra over an analytic field) and M a φ^d-module over ℰ̃_R,
ℛ̃^bd_R or ℛ̃_R. If M is pointwise pure (M ⊗ ℋ(β) is pure for every β ∈ ℳ(R)), then M is
pure (it admits a locally free local pure model at every β ∈ ℳ(R)).
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/purity-openness,
VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems.

VectorBundlesAndIsocrystals:VB4/surjective-purity-descent
Sources: KL15, §8.5, Corollaries 8.5.15–8.5.16, p. 174 (arXiv 1301.0792v5).
Declaration: SurjectivePurityDescent [component signature]
Contract: Consider a bounded map (R,R⁺)→(S,S⁺) between perfect uniform adic Banach
F_{p^d}-algebras, with surjective induced map of adic spectra. For a local φ^d-module M,
purity is equivalent to purity after scalar extension from R to S, for each of ℰ̃,
bounded Robba, and full Robba coefficients. For full Robba sheaves, KL Corollary 8.5.16
gives the analogous equivalence under any surjective map of perfectoid adic spaces.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity.

VectorBundlesAndIsocrystals:VB4/local-global-purity-counterexamples
Sources: KL15, §8.5, Examples 8.5.17–8.5.18, pp. 174–175 (arXiv 1301.0792v5).
Declaration: LocalGlobalPurityCounterexamples [component signature]
Contract: KL constructs a rational local system with p-monodromy by identifying the two
boundary circles of a punctured annulus over K=F_p((q)), |q|=ω<1. Its affinoid algebra
is B=K{ω²/T,T,U/ω^{−2}}/(U(T−q)−1); the boundaries have algebras B₁=K{ω²/T,T/ω²} and
B₂=K{1/T,T}. Substitution T↦q²T identifies B₁ with B₂, in that direction, and gives an
affinoid chart in the Tate curve of parameter q² over K. Identify one boundary generator
with p times the other and pass to completed perfections R,S,S₁,S₂ of A,B,B₁,B₂. The
resulting Q_p local system cannot come from an étale module over ℰ̃_R or ℛ̃^bd_R: a
putative invariant section would satisfy x₂=pσ_q(x₁), hence belong to every p^mW(S) and
vanish. It does come from an étale full Robba module and from étale ℰ̃_X and ℛ̃^bd_X
sheaves on X=Spa(R,R°). Thus sheaf descent does not imply descent to the bounded
coefficient rings, and the full Robba module has no étale model. The separate nodal
example 8.5.18 gives locally étale sheaves without a global étale lattice. Its stronger
bounded-ring interpretation remains the obligation G-PATCH.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison,
VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems.

VectorBundlesAndIsocrystals:VB4/pure-two-out-of-three
Sources: KL15, §8.6, Lemma 8.6.3, p. 176 (arXiv 1301.0792v5).
Declaration: PureTwoOutOfThree [component signature]
Contract: Under KL Hypothesis 8.6.1, (c,d)-purity has the two-out-of-three property for
0→M₁→M→M₂→0 in φ-modules over ℛ̃_R: purity of any pair among M₁,M,M₂ forces purity of
the remaining term.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct.
Direct imports: VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity.

VectorBundlesAndIsocrystals:VB4/pointwise-ampleness
Sources: KL15, §8.8, Definition 8.8.10, pp. 182–183 (arXiv 1301.0792v5).
Declaration: PointwiseAmple [component signature]
Contract: In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a
perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform
characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding
characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and
8.3.5. For F on Proj(P_R), use the fibrewise HN polygon as its slope-polygon function on
ℳ(R); compose with the retraction for its interpretation on Spa(R,R⁺). Via Theorem
6.3.12 and Remark 4.2.18, this agrees with the polygon of the associated Robba
φ^a-module. Define the pointwise ample locus by strict positivity of every fibre slope.
Theorem 7.4.5 makes this locus open. Call F pointwise ample when the locus is all of
ℳ(R).
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid
untilt over Q_p, q=p^a.
API PointwiseAmple [component signature]: At β the predicate that all slopes of the fibre polygon are strictly
positive.
Missing interface for PointwiseAmple.isOpen: Openness requires fibre polygons of a relative Robba module and KL semicontinuity; arbitrary profiles need not have open positivity loci.
API PointwiseAmple.isOpen [omitted signature]: The set of β∈ℳ(R) at which F is pointwise ample is open (KL
Theorem 7.4.5), and so is its preimage in Spa(R,R⁺) under the retraction.
API PointwiseAmple.pullback [component signature]: The predicate is preserved under residue-field extension
and perfectoid pullback.
API PointwiseAmple.tensor [component signature]: Tensor products of positive fibres are positive, with slopes
added with their multiplicities.
API PointwiseAmple.projComparison [component signature]: The predicate agrees for a Proj bundle and its full
Robba module under the companion equivalence.
Test PointwiseAmpleTest.positive [component example] (computation): O(1) is pointwise ample.
Test PointwiseAmpleTest.unit [component example] (non-example): O is not pointwise ample: its slope is zero.
Test PointwiseAmpleTest.mixed [component example] (non-example): O(2)⊕O(−1) has positive total degree but is
not pointwise ample.
Test PointwiseAmpleTest.zero [component example] (degenerate): The zero bundle satisfies the every-slope
predicate vacuously; it has no positive rank or numerical slope.
Direct imports: VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon,
VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness,
VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity.

VectorBundlesAndIsocrystals:VB4/positive-tensor-domination
Sources: KL15, §8.8, Lemma 8.8.11 and its proof, p. 183 (arXiv 1301.0792v5).
Declaration: PositiveTensorDomination [component signature]
Contract: In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a
perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform
characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding
characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and
8.3.5. Suppose F on Proj(P_R) is pointwise ample and G is any bundle there. Tensor
powers of F eventually dominate G: some integer n₀ has F^{⊗n}⊗G pointwise ample for
every n≥n₀.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid
untilt over Q_p, q=p^a.
Direct imports: VectorBundlesAndIsocrystals:VB4/bounded-polygons-dense-locus,
VectorBundlesAndIsocrystals:VB4/pointwise-ampleness.

VectorBundlesAndIsocrystals:VB4/geometric-positive-generation
Sources: KL15, §8.8, Lemma 8.8.12(a)–(b) and its proof, p. 183 (arXiv 1301.0792v5).
Declaration: GeometricPositiveGeneration [omitted signature]
Missing interface: Actual analytic-field curve fibre, positive slopes, evaluation map and coherent cohomology are required.
Contract: In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a
perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform
characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding
characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and
8.3.5. If R=L is an analytic field and F on Proj(P_L) is ample, then H¹(Proj(P_L),F)=0
and the evaluation map from its global sections generates F. Both claims use the
analytic-field hypothesis of KL Lemma 8.8.12.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid
untilt over Q_p, q=p^a.
Direct imports: VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence,
VectorBundlesAndIsocrystals:VB4/pointwise-ampleness,
VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness,
VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness,
VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation,
VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles.

VectorBundlesAndIsocrystals:VB4/nonnegative-extension
Sources: KL15, §8.8, Lemma 8.8.13 and its proof, pp. 183–185 (arXiv 1301.0792v5).
Declaration: NonnegativeExtension [omitted signature]
Missing interface: Actual period-module bundle extension with O(-1) kernel and KL hypotheses at the chosen point is required; the identity extension is insufficient.
Contract: In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a
perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform
characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding
characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and
8.3.5. Suppose that at a chosen β∈ℳ(R), the slopes of F on Proj(P_R) are nonnegative and
at least one is positive. F admits a vector-bundle extension 0→O(−1)→G→F→0 for which
every slope of G at β remains nonnegative.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid
untilt over Q_p, q=p^a.
Direct imports: VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity,
VectorBundlesAndIsocrystals:VB4/geometric-positive-generation.

VectorBundlesAndIsocrystals:VB4/etale-at-point-resolution
Sources: KL15, §8.8, Corollary 8.8.14, p. 185 (arXiv 1301.0792v5).
Declaration: EtaleAtPointResolution [omitted signature]
Missing interface: Actual perfectoid point, relative Robba/Proj comparison and an étale-at-that-point middle term are required.
Contract: In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a
perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform
characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding
characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and
8.3.5. When the slopes of F on Proj(P_R) at a chosen β∈ℳ(R) are nonnegative, there are
bundles H,G and an exact sequence 0→H→G→F→0 with G étale at β.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid
untilt over Q_p, q=p^a.
Direct imports: VectorBundlesAndIsocrystals:VB4/nonnegative-extension,
VectorBundlesAndIsocrystals:VB4/purity-openness.

VectorBundlesAndIsocrystals:VB4/ample-iff-pointwise
Sources: KL15, §8.8, Theorem 8.8.15 and Remark 8.8.16, p. 185 (arXiv 1301.0792v5).
Declaration: AmpleIffPointwise [component signature]
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), a vector
bundle F on Proj(P_R) is ample if and only if it is pointwise ample (all its slopes at
every β ∈ ℳ(R) are positive).
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid
untilt over Q_p, q=p^a.
Direct imports: VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness,
VectorBundlesAndIsocrystals:VB4/positive-tensor-domination,
VectorBundlesAndIsocrystals:VB4/etale-at-point-resolution,
VectorBundlesAndIsocrystals:VB4/pointwise-ampleness,
VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness,
VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion,
VectorBundlesAndIsocrystals:VB4/purity-openness.

VectorBundlesAndIsocrystals:VB4/relative-ampleness
Sources: KL15, §8.8, Definition 8.8.17, pp. 185–186 (arXiv 1301.0792v5).
Declaration: RelativeAmple [component signature]
Contract: In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a
perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform
characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding
characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and
8.3.5. For a bundle F on FF_X, define ampleness by testing every affinoid map
f:Spa(A,A⁺)→X: under the comparison of Theorem 8.7.7, the pullback bundle on FF_R must
yield an ample bundle on Proj(P_R). This is equivalent to positivity of all slopes at
every point of X. In particular, on an affinoid base the Proj and analytic-curve notions
agree. Ampleness descends under surjective maps of perfectoid bases and is local on the
base. Its locus is open, including on the real quotient: an ample fibre over ℋ(x)
extends over a partially proper open neighborhood of x.
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid
untilt over Q_p, q=p^a.
API RelativeAmple [component signature]: A bundle on FF_X is ample if all perfectoid affinoid pullbacks are
ample in the already owned Proj sense.
API RelativeAmple.fibreCriterion [component signature]: Relative ampleness is equivalent to every geometric
fibre slope being strictly positive.
API RelativeAmple.pullback [component signature]: Perfectoid pullback preserves ampleness.
API RelativeAmple.surjectiveDescent [component signature]: A bundle is ample iff its pullback along a
surjective perfectoid map is ample.
API RelativeAmple.openLocus [component signature]: The ample locus is a partially proper open subset on a base
over an analytic field.
Test RelativeAmpleTest.affinoid [component example] (compatibility): On an affinoid perfectoid untilt,
relative ampleness agrees with the companion Proj ampleness.
Test RelativeAmpleTest.untiltLine [component example] (computation): The untilt divisor line L_X is
relatively ample; in KL normalization its slope is 1/a.
Test RelativeAmpleTest.unit [component example] (non-example): The unit bundle is not relatively ample on a
nonempty base.
Direct imports: RelativeFarguesFontaine:RF1,
VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness,
VectorBundlesAndIsocrystals:VB4/ample-iff-pointwise.

VectorBundlesAndIsocrystals:VB4/untilt-positive-line
Sources: KL15, §8.8, Lemma 8.8.19 and its proof, p. 186 (arXiv 1301.0792v5).
Declaration: UntiltPositiveLine [component signature]
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5) with X =
Spa(A, A⁺), write z = [z̄] + p z_1. Let M be the φ^a-module over ℛ̃_R free on one
generator v with φ^a(v) = z_1^{−1} z v; it is globally étale. The convergent product u =
∏_{n≥0} φ^{an}(1 + p^{−1} z_1^{−1}[z̄]) ∈ ℛ̃⁺_R satisfies φ^a(u) = p z_1 z^{−1} u in
ℛ̃_R, so uv defines an inclusion ℛ̃_R → M(1) of φ^a-modules, and M(1) is the φ^a-module
corresponding to L_X. Hence the φ^a-module corresponding to L_X is globally pure of
slope 1/a, i.e. globally (1, a)-pure (printed 'slope 1'; see source issue).
Hypotheses: KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra
over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral
coefficients are kept distinct. KL Hypothesis 8.7.1: mixed characteristic, perfectoid
untilt over Q_p, q=p^a.
Direct imports:
RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate,
VectorBundlesAndIsocrystals:VB4/pure-models,
VectorBundlesAndIsocrystals:VB4/relative-ampleness.

VectorBundlesAndIsocrystals:VB4/twisted-local-systems
Sources: KL15, Definition 8.5.7, p. 172.
Declaration: TwistedLocalSystem [component signature]
Contract: For c∈Z and d>0, a (c,d)-Q_p local system is an étale local system of
finite-dimensional Q_{p^d}-vector spaces equipped with a Frobenius-semilinear
automorphism τ such that p^c τ^d=1. Scheme-side isogeny (c,d)-Z_p local systems carry
the same data on an isogeny Z_{p^d} local system. The categories for proportional pairs
(c,d) are naturally equivalent, not literally equal.
Hypotheses: Q_{p^d}/Q_p unramified; τ acts semilinearly for arithmetic Frobenius. Étale
rational local systems need not admit a global integral lattice.
API TwistedLocalSystem [component signature]: Finite-rank Q_{p^d} étale local system with
arithmetic-Frobenius-semilinear τ and p^cτ^d=1.
API TwistedLocalSystem.frobenius [component signature]: The specified semilinear automorphism τ, with its
coefficient Frobenius.
API TwistedLocalSystem.iterate [component signature]: For every section v, p^c τ^d(v)=v.
API TwistedLocalSystem.pullback [component signature]: Pullback transports τ and its equation; identities and
composition agree.
API TwistedLocalSystem.reindex [component signature]: Pairs of positive denominator with the same c/d give
naturally equivalent categories by unramified scalar extension/descent.
Test TwistedLocalSystemTest.zeroSlope [component example] (compatibility): At (0,1), τ=1 and the object is
an ordinary Q_p local system.
Test TwistedLocalSystemTest.nonzeroTwist [component example] (non-example): For c≠0,d=1, τ=1 on a nonzero
Q_p line fails p^cτ=1.
Test TwistedLocalSystemTest.reindex [component example] (compatibility): The categories for (1,2) and (2,4)
are equivalent; the coefficient fields and underlying vector-space ranks are not
literally identical.
Direct imports: DiamondsAndVStacks:D3,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality,
mathlib:ModuleCat.

VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems
Sources: KL15, Theorems 8.5.3–8.5.6, pp. 169–171; SW20, Theorem 12.3.4, book p. 104.
Declaration: IntegralFrobeniusLocalSystems [omitted signature]
Missing interface: The actual integral Frobenius-model and Z_p-local-system categories, with lattices and rationalization, are required.
Contract: For a perfect uniform adic Banach pair over F_{p^d}, étale Z_{p^d} local
systems on Spec(R), on its inverse-perfecting complete subring, and on the corresponding
untilt agree with φ^d-modules over W(R) and the integral relative Robba ring; the ring
functor is scalar extension. The equivalence globalizes to perfectoid X and its
tilt/inverse perfection. Over an algebraically closed complete C/Q_p, φ-modules over the
integral Robba ring and W(C♭) agree with finite free Z_p modules (SW12.3.4). Taking
isogenies yields globally pure models, not all rational étale local systems.
Hypotheses: KL Theorems 8.5.3–8.5.6, with integral finite projective modules. The
absolute SW12.3.4 is restricted to E=Q_p and C algebraically closed.
Direct imports: VectorBundlesAndIsocrystals:VB4/pure-model-trivialization,
VectorBundlesAndIsocrystals:VB4/twisted-local-systems,
FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2, PerfectoidSpaces:P3.

VectorBundlesAndIsocrystals:VB4/integral-boundary-realization
Sources: SW20, Proposition 22.3.2, book p. 209.
Declaration: IntegralBoundaryRealization [omitted signature]
Missing interface: The actual Z_p-local-system and phi^{-1}-module categories on Y_[0,r], including the characteristic-p boundary, are required.
Contract: For S∈Perf, finite free Z_p local systems on S_proét are equivalent to
φ^{-1}-modules on Y_[0,r](S), including the characteristic-p boundary. Restriction to
Y_(0,r] realizes the rationalized local system L[1/p], which has all Newton slopes zero.
This distinguishes integral lattices at the boundary from a slope-zero bundle on the
open curve.
Hypotheses: Use an affinoid characteristic-p perfectoid base S=Spa(R,R⁺). Choose and fix
a pseudouniformizer ϖ∈R for the construction of the SW space Y_[0,r](S). r>0; the
integral period space and φ^{-1} pullback conventions are those of SW Lecture 22. Finite
rank is locally constant; no boundary deletion in the integral comparison.
Direct imports: VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems,
VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems,
RelativeFarguesFontaine:RF0:integral-Y, DiamondsAndVStacks:D3/locally-profinite-torsors.

VectorBundlesAndIsocrystals:VB4/integral-group-torsors
Sources: SW20, Proposition 22.6.1, book p. 213; Theorems 19.5.1–19.5.2,
book pp. 178–180.
Declaration: IntegralGroupTorsors [omitted signature]
Missing interface: Smooth affine integral G with connected fibres, actual G(Z_p)-torsors
and phi^{-1}-G-torsors on Y_[0,r] are required. The target includes reconstruction from
exact tensor functors on the exact category of finite free Z_p-representations, for
Z_p-schemes and analytic sousperfectoid Z_p-spaces. Extend the functor to the coordinate
Hopf algebra by filtered colimits, reconstruct the faithfully flat torsor, and use Lang's
lemma with connected fibres for pro-etale local identification with the forgetful functor.
The field-valued dictionary alone does not supply this integral reconstruction.
Contract: For a smooth affine group scheme G/Z_p with connected fibres, pro-étale
G(Z_p)-torsors on S are equivalent to φ^{-1}-G-torsors on Y_[0,r](S). For G=GL_n this is
the integral local-system equivalence. Connectedness of fibres and the integral boundary
are retained; extensions requiring a parahoric model are not inferred from this theorem.
Hypotheses: Use an affinoid characteristic-p perfectoid base S=Spa(R,R⁺). Choose and fix
a pseudouniformizer ϖ∈R for the construction of the SW space Y_[0,r](S). S perfectoid;
r>0; smooth affine integral model with connected fibres.
Direct imports: VectorBundlesAndIsocrystals:VB4/integral-boundary-realization,
tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules,
tauceti:TauCetiRoadmap/ReductiveGroupsPartII:RG2.3.1 (smooth affine integral models),
tauceti:TauCetiRoadmap/ReductiveGroupsPartII:RG2.3.7 (Lang's theorem),
RelativeFarguesFontaine:RF0:integral-Y, DiamondsAndVStacks:D3/locally-profinite-torsors.

VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces
Sources: CN25, §3.1.1 with footnote 6, p. 12.
Declaration: SympatheticVS [component signature]
Contract: Use the category of connected spectral C-Banach algebras whose p-power map is
onto the open unit neighborhood of 1. CN further require faithful evaluation on C-valued
spectral points and a dense C-linear subspace with a countable basis. Write O_Λ for the
unit ball. These extra requirements exclude the spherical-closure example in footnote 6
and permit the Hahn–Banach arguments under the standing countability assumption. A
sympathetic Vector Space is a covariant functor from this category to Q_p-vector spaces.
Exactness means exactness after evaluation at each algebra Λ.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
API SympatheticVS [component signature]: A covariant functor from the stated sympathetic C-Banach algebras to
ModuleCat Q_p.
API SympatheticVS.constant [component signature]: The constant functor of a finite-dimensional Q_p vector
space.
API SympatheticVS.additive [component signature]: V_d evaluates to Λ^d and maps by the C-algebra homomorphism
in every coordinate.
API SympatheticVS.exact [component signature]: A short complex is short exact iff its evaluated ModuleCat
complex is short exact at every Λ.
Missing interface for SympatheticVS.periodTargets: The sympathetic period-ring functors BdR+, BdR and B_m, with their specified maps, are unavailable; choosing arbitrary functors does not identify these objects.
API SympatheticVS.periodTargets [omitted signature]: The source period Rings BdR⁺ and BdR and the quotients
B_m are VS targets via the R06.1 period-functor construction.
Test SympatheticVSTest.constants [component example] (computation): The constant Q_p functor evaluates to
Q_p at C, whereas V₁ evaluates to C.
Test SympatheticVSTest.zero [component example] (degenerate): V₀ is the zero functor.
Test SympatheticVSTest.finiteSum [component example] (compatibility): V_{d+e}≅V_d⊕V_e coordinatewise.
Test SympatheticVSTest.evaluation [component example] (non-example): The C-valued spectrum-injectivity
condition excludes the spherical-closure example singled out by footnote 6; p-root
surjectivity alone is insufficient.
Direct imports: mathlib:NormedAlgebra, mathlib:ModuleCat.

VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations
Sources: CN25, §3.1.1, pp. 12–13.
Declaration: BCPresentation [component signature]
Contract: A sympathetic Vector Space W admits a finite Banach–Colmez presentation when
some Y fits into 0→V₁→Y→V_d→0 and 0→V₂→Y→W→0, where V_d(Λ)=Λ^d and V₁,V₂ are constant
finite-dimensional Q_p spaces. Such W is a BC object. The presentation assigns dim(W)=d
and ht(W)=dim_Qp(V₁)−dim_Qp(V₂), so Dimension is the pair (dim,ht). Independence of
these integers from Y and the two sequences is the separate Dimension theorem.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
API BCPresentation [component signature]: Y and exact 0→V₁→Y→V_d→0, 0→V₂→Y→W→0 with finite Q_p spaces V₁,V₂.
API BCPresentation.dim [component signature]: The natural number d.
API BCPresentation.height [component signature]: The integer finrank_Qp(V₁)−finrank_Qp(V₂).
Missing interface for BCPresentation.dimension: Presentation independence requires realized sympathetic Banach–Colmez spaces and their Dimension invariant, not arbitrary constant/additive functors.
API BCPresentation.dimension [omitted signature]: The pair (d,height) is independent of the presentation by
DimensionAbelian.
API BCPresentation.stabilize [component signature]: Adding the same finite Q_p vector space to Y,V₁,V₂ gives
another presentation of W and the same Dimension.
Test BCPresentationTest.additive [component example] (computation): The tautological presentation of V_d has
Dimension (d,0).
Test BCPresentationTest.constant [component example] (computation): A finite Q_p vector space of dimension h
has Dimension (0,h).
Test BCPresentationTest.quotient [component example] (computation): The cokernel V₁/Q_p of a nonzero Q_p→V₁
map has Dimension (1,−1).
Test BCPresentationTest.stabilize [component example] (compatibility): Increasing both finite Q_p dimensions
by one leaves height unchanged.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces,
mathlib:CategoryTheory.ShortComplex.ShortExact, mathlib:Module.finrank.

VectorBundlesAndIsocrystals:VB3:general-BC/exact-banach-points
Sources: CN25, Remark 3.1, p. 13; FF18-courbes, §8.4.1, main text pp. 245–247.
Declaration: ExactBanachPoints [omitted signature]
Missing interface: Evaluation at sympathetic algebras on the realized BC category, including the strict Banach exactness theorem, is required; zero preservation alone is insufficient.
Contract: Evaluation at C is faithful on BC objects. Evaluation at any sympathetic
algebra Λ gives a Q_p-Banach space; BC morphisms evaluate to continuous strict linear
maps, and BC short exact sequences evaluate to strict short exact sequences.
Nonetheless, the topology of W(C) alone cannot recover Dimension: C and C⊕Q_p have
isomorphic topological Q_p-vector spaces but different BC Dimensions.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations,
VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian.

VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian
Sources: CN25, Proposition 3.2, p. 13; FF18-courbes, Preface, Theorem 2.12(i)–(ii), printed pp. 16–17.
Declaration: DimensionAbelian [component signature]
Contract: BC is an abelian category. The presentation invariant Dim=(dim,ht) is well
defined and additive in short exact sequences. In particular, any BC map f has BC
kernel, image and cokernel, with Dim(W₁)=Dim(ker f)+Dim(im f) and Dim(W₂)=Dim(im
f)+Dim(coker f). A zero-dimensional object has nonnegative height. If W is built from an
increasing filtration with V₁ as every successive quotient, each BC subobject of W also
has nonnegative height.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence,
VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations,
mathlib:CategoryTheory.Abelian.

VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples
Sources: CN25, Example 3.3, p. 13.
Declaration: StandardDimensionExamples [component signature]
Contract: For integers h≥1, d∈Z and m≥1, the period objects B_m=B⁺_dR/t^m and U_{h,d}
belong to BC. Their Dimensions are Dim(B_m)=(m,0), Dim(U_{h,d})=(d,h) for d≥0, and
Dim(U_{h,d})=(−d,−h) for d<0. In particular U_{1,0}=Q_p has Dimension (0,1); the
zero-slope case is retained in the nonnegative branch.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence,
RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature
Sources: CN25, Definition 3.5, p. 13.
Declaration: BCCurvature.positive [component signature]
Contract: Use five curvature classes for W∈BC. Positive curvature means Hom(W,V₁)=0;
nonnegative curvature means Hom(W,BdR⁺)=0. Curvature zero, also called affine, means a
finite successive extension of V₁. Negative curvature means that W embeds in BdR^d for
some d, equivalently in (BdR⁺)^d. Nonpositive curvature means an embedding into a
B⁺_dR-Module, interpreted as a period Vector Space with a B⁺_dR action. The distinctions
between strict and weak signs are part of the definition.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
API BCCurvature.positive [component signature]: Hom_VS(W,V₁)=0.
API BCCurvature.nonnegative [component signature]: Hom_VS(W,BdR⁺)=0.
API BCCurvature.affine [component signature]: A finite filtration with V₁ quotients.
API BCCurvature.negative [component signature]: An injection into (BdR⁺)^d for some finite d, equivalently
BdR^d.
API BCCurvature.nonpositive [component signature]: An injection into a VS carrying a BdR⁺-Module structure.
API BCCurvature.iso [component signature]: Every curvature predicate is invariant under BC isomorphism.
Missing fixture for BCCurvatureTest.rational: The named BC object, its actual period realization and Dimension height are unavailable; arbitrary objects and heights do not satisfy this fixture.
Test BCCurvatureTest.rational [omitted example] (computation): Q_p has strict negative curvature and
height one.
Missing fixture for BCCurvatureTest.affine: The named BC object, its actual period realization and Dimension height are unavailable; arbitrary objects and heights do not satisfy this fixture.
Test BCCurvatureTest.affine [omitted example] (computation): V₁ has curvature zero and height zero.
Missing fixture for BCCurvatureTest.shifted: The named BC object, its actual period realization and Dimension height are unavailable; arbitrary objects and heights do not satisfy this fixture.
Test BCCurvatureTest.shifted [omitted example] (computation): H¹(O(−1)) has positive curvature and height
−1.
Missing fixture for BCCurvatureTest.otherPoint: The named BC object, its actual period realization and Dimension height are unavailable; arbitrary objects and heights do not satisfy this fixture.
Test BCCurvatureTest.otherPoint [omitted example] (non-example): At x≠∞, U₁/Q_p t_x has height zero and
positive curvature but not curvature zero.
Test BCCurvatureTest.zero [component example] (degenerate): The zero object satisfies all five predicates;
strict height inequalities require nonzero objects.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces,
VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations,
RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration,
PadicHodgeTheory:R06.1.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hom-orthogonality
Sources: CN25, Remark 3.6, p. 13.
Declaration: CurvatureHomOrthogonality [omitted signature]
Missing interface: The actual sympathetic period targets and curvature comparison are required; arbitrary additive generators and powers are unrelated.
Contract: Hom_BC(W,W′) vanishes for either of the following curvature pairs: (>0,≤0) or
(≥0,<0). The classes of nonpositive and of strictly negative curvature are each
preserved under VS subobjects. Dually, nonnegative and strictly positive curvature are
each preserved under VS quotients.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/curvature,
VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation.

VectorBundlesAndIsocrystals:VB3:general-BC/canonical-curvature-filtration
Sources: CN25, Proposition 3.7 and Remark 3.8, pp. 13–14; CN25, §3.2.8, p. 18.
Declaration: BCCanonicalFiltration [component signature]
Contract: The canonical curvature filtration of a BC object W is uniquely specified by
W_{>0}⊂W_{≥0}⊂W: the subobject has curvature >0, the middle quotient has curvature 0,
and the final quotient has curvature <0. Define W_{>0}=∩_{m≥1, f:W→B_m}ker f and
W_{≥0}=∩_{f:W→B_dR}ker f. The HN description verifies the middle quotient condition. Set
W_{≤0}=W/W_{>0} and W_{=0}=W_{≥0}/W_{>0}; they are respectively the maximal
nonpositive-curvature quotient and its maximal affine subobject. In the decomposition
(3.14), W_{>0} consists of the U_{−1/λ_i} with λ_i>0 together with all H⁰(X,F_x) for
x≠∞; W_{≤0} consists of the U_{−1/λ_i} with λ_i<0 and H⁰(X,F_∞). Thus
W_{<0}=⊕_{λ_i<0}U_{−1/λ_i} and W_{=0}=H⁰(X,F_∞). Strictly negative curvature is
equivalent to strictly negative BC HN slopes; strictly positive BC HN slopes imply
positive curvature. This is Plût’s filtration, described through Le Bras’s HN
equivalence.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
API BCCanonicalFiltration [component signature]: Subobjects W_{>0}≤W_{≥0}≤W with positive, affine and negative
graded pieces.
API BCCanonicalFiltration.positive [component signature]: W_{>0} is the intersection of kernels of all W→B_m.
API BCCanonicalFiltration.nonnegative [component signature]: W_{≥0} is the intersection of kernels of all
W→BdR.
API BCCanonicalFiltration.map [component signature]: Every BC map preserves these subobjects.
API BCCanonicalFiltration.nonpositiveQuotient [component signature]: Every map from W to a
nonpositive-curvature BC factors uniquely through W/W_{>0}.
API BCCanonicalFiltration.affinePart [component signature]: W_{≥0}/W_{>0} is the maximal affine subobject of
W/W_{>0}.
Missing fixture for BCCanonicalFiltrationTest.rational: The actual constant/additive/negative BC object and period functors are unavailable; arbitrary functors have different intersections of kernels.
Test BCCanonicalFiltrationTest.rational [omitted example] (computation): For Q_p, W_{>0}=W_{≥0}=0.
Missing fixture for BCCanonicalFiltrationTest.affine: The actual constant/additive/negative BC object and period functors are unavailable; arbitrary functors have different intersections of kernels.
Test BCCanonicalFiltrationTest.affine [omitted example] (computation): For V₁, W_{>0}=0 and W_{≥0}=W.
Missing fixture for BCCanonicalFiltrationTest.positive: The actual constant/additive/negative BC object and period functors are unavailable; arbitrary functors have different intersections of kernels.
Test BCCanonicalFiltrationTest.positive [omitted example] (computation): For H¹(O(−1)), W_{>0}=W_{≥0}=W.
Missing fixture for BCCanonicalFiltrationTest.otherPoint: The actual constant/additive/negative BC object and period functors are unavailable; arbitrary functors have different intersections of kernels.
Test BCCanonicalFiltrationTest.otherPoint [omitted example] (non-example): For torsion at x≠∞, W_{>0}=W
despite BC HN slope zero; HN cut at zero alone is insufficient.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/curvature,
VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition,
VectorBundlesAndIsocrystals:VB3:general-BC/artinian-bc,
VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing.

VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height
Sources: CN25, Remark 3.11, p. 15.
Declaration: EulerPoincareHeight [omitted signature]
Missing interface: Derived sections of the actual coherent FF curve and the actual BC height/coherent rank compatibility are required.
Contract: For every coherent sheaf F on the geometric curve,
ht(H⁰(X,F))−ht(H¹(X,F))=rk(F). For a standard block O(λ), where λ=d/h is reduced with
h>0, the difference is h. Additivity and coherent-sheaf classification extend this
calculation from standard blocks to all F; torsion has rank and Euler height zero.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples,
VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification.

VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart
Sources: CN25, §3.2.4, p. 15.
Declaration: BCTiltedHeart [component signature]
Contract: Coh⁻_X is the full subcategory of Dᵇ(Coh_X) with cohomology only in degrees −1
and 0, H^{−1} of negative slopes and H⁰ of nonnegative slopes INCLUDING torsion sheaves.
It is the torsion-pair tilt heart, hence abelian. Objects split noncanonically as
H⁰⊕H^{−1}[1] because the curve has cohomological dimension one. For such a
zero-differential representative BC(F)=H⁰(X,H⁰F)⊕H¹(X,H^{−1}F), noncanonically; general
morphisms include Ext¹(H⁰F,H^{−1}G).
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
API BCTiltedHeart [component signature]: Objects K∈Dᵇ(Coh_X) with HⁱK=0 except i=−1,0, H^{-1} negative and H⁰
nonnegative including torsion.
API BCTiltedHeart.positive [component signature]: A coherent sheaf of nonnegative slopes enters in degree
zero.
API BCTiltedHeart.negative [component signature]: A negative bundle enters with shift [1].
Missing interface for BCTiltedHeart.split: Splitting requires the coherent FF curve and Ext² vanishing; arbitrary abelian categories do not have this property.
API BCTiltedHeart.split [omitted signature]: K is isomorphic to H⁰K⊕H^{-1}K[1], noncanonically, using Ext²=0
on the curve.
API BCTiltedHeart.homMatrix [component signature]: Morphisms between these decompositions have diagonal Hom
and off-diagonal Ext¹(E₀,F₋₁).
Test BCTiltedHeartTest.positive [component example] (computation): O(1) in degree zero belongs to the heart.
Test BCTiltedHeartTest.negative [component example] (computation): O(−1)[1] belongs, while O(−1) in degree
zero does not.
Test BCTiltedHeartTest.torsion [component example] (compatibility): The torsion skyscraper at any untilt
point belongs in degree zero.
Test BCTiltedHeartTest.shift [component example] (non-example): O[1] is excluded, since its H^{-1} has slope
zero rather than negative.
Direct imports: mathlib:DerivedCategory, SchemeAndStackFoundations:SF.0,
VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism,
VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification,
VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension.

VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence
Sources: CN25, Theorem 3.12, p. 15.
Declaration: LeBrasEquivalence [omitted signature]
Missing interface: The realized sympathetic BC category and curve hypercohomology comparison are unavailable; arbitrary categories cannot be equivalent.
Contract: The functor BC realises an equivalence of categories Coh^-_X ≃ BC. In its
pro-étale sheaf realization every BC object is a diamond (SW Theorem 15.2.12); no
perfectoid representability is inferred.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition,
VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart,
VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations,
DiamondsAndVStacks:D3,
VectorBundlesAndIsocrystals:VB3:general-BC/abstract-banach-colmez-category,
VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces,
mathlib:CategoryTheory.Equivalence.

VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-invariants
Sources: CN25, §3.2.5, p. 16.
Declaration: BCHNInvariants [component signature]
Contract: On the tilted coherent heart, assign rk⁻([E₋₁→E₀])=deg(E₀)−deg(E₋₁) and
deg⁻([E₋₁→E₀])=rk(E₋₁)−rk(E₀). Under Le Bras these become dim and −ht, defining the BC
HN structure. A nonzero torsion object has slope zero. Write W_{≥λ},W_{>λ} for the HN
pieces and W_{>−∞}=∪_λW_{≥λ}. For reduced λ=d/h with h>0, let U_λ=U_{h,d}; scaling the
pair by e≥1 gives e copies. For λ≥0 use H⁰(O(λ)), and for λ<0 use H¹(O(λ)), equivalently
BC(O(λ)[1]). For λ≠0 the standard block has rk⁻=sign(λ)d, deg⁻=−sign(λ)h and µ⁻=−1/λ.
The boundary U₀=Q_p instead has rk⁻=0, deg⁻=−1 and µ⁻=−∞; the zero object has no HN
slopes. See E35 for the missing nonzero condition in the source formula.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
API BCHNInvariants [component signature]: BC rank=dim, BC degree=−ht, with the zero object assigned no slope.
API BCHNInvariants.fromHeart [component signature]: For E₋₁[1]⊕E₀, rank=deg E₀−deg E₋₁ and degree=rank
E₋₁−rank E₀.
API BCHNInvariants.slope [component signature]: For positive dimension use −ht/dim; a nonzero dimension-zero
object has slope −∞.
API BCHNInvariants.standard [component signature]: For a nonzero standard curve slope λ, BC slope of U_λ is
−1/λ.
Missing interface for BCHNInvariants.additive: Additivity requires the actual Dimension/HN invariant of a realized BC object, not an arbitrary function on objects.
API BCHNInvariants.additive [omitted signature]: Rank and degree add in a BC short exact sequence; slope
does not simply add.
Test BCHNInvariantsTest.rational [component example] (computation): Q_p has rank zero, degree −1 and slope
−∞.
Test BCHNInvariantsTest.affine [component example] (computation): V₁ has rank one, degree zero and slope
zero.
Test BCHNInvariantsTest.inversion [component example] (computation): U_{2,1} has BC rank one, degree −2 and
slope −2, while O(1/2) has curve rank two and degree one.
Test BCHNInvariantsTest.negative [component example] (computation): U_{1,−1}=H¹(O(−1)) has BC rank one,
degree one and slope one.
Test BCHNInvariantsTest.zero [component example] (degenerate): The zero object has BC rank and degree zero
and no slope; it is not assigned the slope −∞ of a nonzero finite Q_p space.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian,
VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence,
VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism.

VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition
Sources: CN25, Remark 3.13 and (3.14), p. 16.
Declaration: BcHnDecomposition [omitted signature]
Missing interface: The realized finite BC category and actual HN graded pieces, torsion supports and connected/étale quotient are required; W⊕0 is insufficient.
Contract: The object U₀=Q_p has BC slope −∞. The diamond realization of W identifies its
identity component with W_{>−∞} and its component quotient W_{−∞} with the maximal étale
quotient, a finite-dimensional Q_p-space. The BC HN filtration admits a noncanonical
splitting. Consequently W≅(⊕_i U_{−1/λ_i})⊕(⊕_x H⁰(X,F_x)), where λ_i∈Q∪{−∞} are nonzero
and the torsion sheaves F_x have finite support. Each U_{−1/λ_i} has BC slope λ_i; each
nonzero torsion summand has BC slope 0. These are precisely the slopes of W. In the
hypercohomology sequence of §3.2.4, the H¹(X,E_{−1}) term is the positive-slope HN
subobject of BC([E_{−1}→E₀]).
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-invariants,
VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification,
VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence,
DiamondsAndVStacks:D5/relative-representability.

VectorBundlesAndIsocrystals:VB3:general-BC/artinian-bc
Sources: CN25, Remark 3.15, p. 16.
Declaration: ArtinianBc [omitted signature]
Missing interface: The realized finite BC category and its finite Dimension/connected–étale decomposition are required.
Contract: Every descending chain W₀ ⊇ W₁ ⊇ ⋯ of BC subobjects stabilizes. In the
dimension-height argument, dim(W_n) first becomes constant; the quotients W_N/W_n then
have dimension zero and come from the maximal finite Q_p quotient of W_N, so their
heights are bounded and eventually constant. A second argument reduces via a
presentation to V_d and inducts on d: a proper subobject of V₁ is finite-dimensional
over Q_p. The latter argument also proves the artinian property for almost
C-representations.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition,
VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian.

VectorBundlesAndIsocrystals:VB3:general-BC/embedding-height-bound
Sources: CN25, Lemma 3.16, pp. 16–17.
Declaration: EmbeddingHeightBound [component signature]
Contract: For a NONZERO sub-BC W⊂V_N which contains no subobject isomorphic to V₁,
dim(W)<ht(W); all its BC HN slopes are <−1. The zero object has no slopes but does not
satisfy the strict numerical inequality. Include finite Q_p summands (slope −∞) in the
proof.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition,
VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian,
VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus.

VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus
Sources: CN25, §3.2.4 and §3.2.6, pp. 15,17.
Declaration: BcMorphismCalculus [omitted signature]
Missing interface: The actual standard BC objects, endomorphism division algebras and period morphism formulas are required.
Contract: For zero-map tilted-heart representatives E₋₁[1]⊕E₀ and F₋₁[1]⊕F₀, BC
morphisms are triangular matrices with diagonal Hom(E₋₁,F₋₁), Hom(E₀,F₀) and
off-diagonal Ext¹(E₀,F₋₁). End_BC(U_λ)=End(O(λ))=D_λ. For λ=d/h≥0 in lowest terms
Hom_BC(U_λ,V₁) has C-dimension h with basis θ∘φ^i, 0≤i<h. All tensor multiplicities and
Brauer signs are imported from the companion, not the unqualified rank-one-looking
formula in the review paper.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence,
VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison,
VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign,
VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus,
RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration.

VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization
Sources: CN25, §3.2.7, pp. 17–18.
Declaration: TorsionPointRealization [omitted signature]
Missing interface: The actual coherent sheaves supported at the chosen untilt point and finite-length completed-DVR modules are required.
Contract: At a closed untilt point x, torsion coherent sheaves supported at x are
equivalent to finite-length B⁺_dR(C_x)-modules via global sections. The indecomposable
modules are B_m(C_x)=B⁺_dR(C_x)/t_x^m, m≥1. The divisor sequence
0→O→O(m)→i_{x,*}B_m(C_x)→0 has first map t_x^m; H¹(O)=0 therefore identifies the BC
realization with U_m/Q_p t_x^m. Its endomorphism ring is B_m(C_x), giving C_x when m=1.
For x≠∞ its Hom to V₁ vanishes because the supports are disjoint. At the chosen point ∞,
write t_x=t; a finite-length module M is realized by the functor Λ↦M⊗_{B⁺_dR}B⁺_dR(Λ),
rather than an extension of scalars from a ring to itself.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence,
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence,
VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison,
VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification.

VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence
Sources: CN25, Proposition 3.17, p. 18.
Declaration: AffineFiniteLengthEquivalence [omitted signature]
Missing interface: The actual sympathetic realization of finite-length BdR+-modules at the distinguished point is required.
Contract: Finite-length modules over the ring B⁺_dR form a category equivalent to the
curvature-zero full subcategory of BC. The realization of M is the period Vector Space
Λ↦M⊗_{B⁺_dR}B⁺_dR(Λ), using the period-ring functor on sympathetic algebras; this is not
a scalar extension of the ring to itself.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization,
VectorBundlesAndIsocrystals:VB3:general-BC/curvature.

VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing
Sources: CN25, Corollary 3.18, p. 18.
Declaration: TorsionVsHomVanishing [omitted signature]
Missing interface: A finite BC object realized by a BdR+-module killed by t^r, r≥1, and the actual sympathetic BdR+/BdR functors are required; maps remain arbitrary VS maps.
Contract: The curvature-zero BC category is closed under kernels and cokernels of its
morphisms. Let W be a BC object carrying a B⁺_dR-Module structure with t^rW=0 for some
r≥1. Then every VS natural map W→B⁺_dR or W→B_dR is zero. The BC hypothesis permits the
finite-length realization used in Corollary 3.18. For B⁺_dR, compare maps to all
B⁺_dR/t^k and take their inverse limit, obtaining Hom into a torsion-free module. For
B_dR, the remaining bounded-image argument must place each arbitrary VS map inside
t^{-N}B⁺_dR for some N; this is G-HOM. The maps are not assumed period-linear.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports:
VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence,
VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus, PadicHodgeTheory:R06.1.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation
Sources: CN25, §3.2.8 and Corollary 3.19, p. 18.
Declaration: CurvatureHnCharacterisation [omitted signature]
Missing interface: Actual nonnegative coherent bundles, distinguished-point torsion and the curve-to-BC sections equivalence are required.
Contract: A BC object has curvature <0 exactly when it is H⁰(X,E) for a vector bundle E
with nonnegative curve slopes. Curvature ≤0 permits, in addition, a torsion coherent
summand supported at ∞ in E. Both curvature classes are stable under extensions within
BC.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/curvature,
VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition,
VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization,
VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature-height-signs
Sources: CN25, Corollary 3.20 and footnote 9, p. 18.
Declaration: CurvatureHeightSigns [omitted signature]
Missing interface: The actual BC height and period/curve curvature realization are required; arbitrary height functions have no sign constraint.
Contract: Curvature zero implies height zero; NONZERO strictly negative-curvature BC
objects have strictly positive height; positive-curvature objects have height ≤0. A
nonzero torsion object at x≠∞ has height zero and strictly positive curvature, so ≤
cannot be strengthened to <.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports:
VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation,
VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature-subquotients
Sources: CN25, Corollary 3.21, p. 18; corrected (iv).
Declaration: CurvatureSubquotients [component signature]
Contract: Negative/nonpositive curvature is preserved by sub-BCs; positive/nonnegative
curvature is preserved by quotients. A height-zero subobject of a nonpositive-curvature
object has curvature zero. The printed dual quotient assertion is false: a height-zero
quotient of a nonnegative-curvature BC has HN slope zero (torsion support), and has
curvature zero if and only if its support is at ∞.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports:
VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation,
VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian.

VectorBundlesAndIsocrystals:VB3:general-BC/torsion-subobjects-height
Sources: CN25, Remark 3.22, p. 19.
Declaration: TorsionSubobjectsHeight [omitted signature]
Missing interface: A finite BC target realized by a torsion BdR+-module and its actual height are required.
Contract: For any BC inclusion U⊂W with W a torsion B⁺_dR-Module, ht(U) is nonnegative.
Equality holds precisely when U is itself a torsion B⁺_dR-Module. An alternative to HN
theory is induction on the length of W: subobjects of V₁ are V₁ or finite-dimensional
Q_p-spaces, and the period-module class is extension closed. With Proposition 2.5, the
same induction applies to almost C-representations.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/curvature-subquotients,
VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence.

VectorBundlesAndIsocrystals:VB3:general-BC/generating-image-cokernel
Sources: CN25, Proposition 3.23, p. 19.
Declaration: GeneratingImageCokernel [omitted signature]
Missing interface: The actual BdR+-module target, a generating image over BdR+, BC height and the nonzero cokernel are required.
Contract: Suppose f : W₁ → W₂ is a BC morphism, W₂ is a finite-length BdR⁺-module, and
the BdR⁺-span of im(f) equals W₂. Any nonzero BC cokernel of f has positive curvature
and negative height. After quotienting W₁ by ker(f), represent f by a coherent map F₁ →
F₂ on X with H¹(F_i)=0 and F₂ supported at ∞. Generation implies surjectivity of this
coherent map, while injectivity on BC sections gives H⁰(ker(F₁ → F₂))=0. Its cohomology
sequence identifies the BC cokernel with H¹ of that kernel. A nonzero cokernel excludes
the torsion case, where the BdR⁺-linear map would already be surjective on sections; the
kernel is therefore a nonzero bundle with strictly negative slopes. Its H¹ has the
asserted curvature and height.
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports:
VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation,
VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height,
VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence.

VectorBundlesAndIsocrystals:VB3:general-BC/nonpositive-curvature-extensions
Sources: CN25, Lemma 3.24, p. 19.
Declaration: NonpositiveCurvatureExtensions [omitted signature]
Missing interface: Finite constant Q_p spaces, finite-length BdR+-modules and their realized BC curvature comparison are required.
Contract: A BC object W has curvature ≤0 exactly when it admits a BC short exact
sequence 0→V→W→M→0 with V finite-dimensional over Q_p and M affine (curvature 0). For
existence, decompose W into torsion at ∞ and U_{d_i/h_i} with d_i/h_i≥0; their
fundamental sequences 0→Q_p^{h_i}→U_{d_i/h_i}→B_{d_i}→0 give V=⊕_i Q_p^{h_i}. The
reverse implication follows from extension stability in CN Corollary 3.19(ii).
Hypotheses: E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure
of a complete discretely valued field K of characteristic 0 whose perfect residue field
is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic
closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field
C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm
Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for
any algebraically closed nonarchimedean C/Q_p.
Direct imports:
VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation,
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence,
VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples.

VectorBundlesAndIsocrystals:VB3:general-BC/abstract-banach-colmez-category
Sources: SW20, Definition 15.2.1, book p. 133; SW20, Theorem 15.2.12, book p. 139.
Declaration: AbstractBC [component signature]
Contract: For fixed C/Q_p algebraically closed and complete, BC is the smallest strictly
full abelian subcategory of sheaves of Q_p-modules on Perf_C,proét, stable under
extensions and containing underline Q_p and the additive untilt sheaf G_a. Equivalently
close these generators under finite biproducts, kernels and cokernels of morphisms
BETWEEN BC objects, extensions and isomorphisms. Do not require closure under every
ambient subobject.
Hypotheses: The untilt additive sheaf is over Perf_C; Frobenius coefficients are Q_p
here.
API AbstractBC [component signature]: The generated abelian extension-closed strictly full subcategory of
Q_p-module sheaves containing Q_p and G_a.
API AbstractBC.rational [component signature]: The constant sheaf Q_p is a member.
API AbstractBC.additive [component signature]: The untilt additive sheaf G_a is a member.
API AbstractBC.kernelCokernel [component signature]: Kernels and cokernels of maps between member objects
remain members, computed in the ambient abelian sheaf category.
API AbstractBC.extension [component signature]: A short exact extension of two members is a member.
Missing interface for AbstractBC.leBras: The realized sympathetic BC category and curve hypercohomology comparison are unavailable; arbitrary categories cannot be equivalent.
API AbstractBC.leBras [omitted signature]: Degree-zero hypercohomology induces the exact equivalence with
BCTiltedHeart; sympathetic values agree with the presentation realization.
Test AbstractBCTest.generators [component example] (computation): The two generators are Q_p and G_a, with
Dimensions (0,1) and (1,0).
Test AbstractBCTest.zero [component example] (degenerate): The zero sheaf is in AbstractBC.
Test AbstractBCTest.quotient [component example] (compatibility): The cokernel G_a/Q_p belongs and is
BC(O(−1)[1]) after choosing ∞.
Test AbstractBCTest.points [component example] (non-example): C and C⊕Q_p are isomorphic as topological
Q_p-vector spaces but their BC Dimensions (1,0) and (1,1) differ.
Direct imports: mathlib:CategoryTheory.Sheaf, mathlib:CategoryTheory.Abelian,
DiamondsAndVStacks:D6/etale-site-comparison, DiamondsAndVStacks:D3.

VectorBundlesAndIsocrystals:VB3:general-BC/semistable-period-example
Sources: CDN20, §2.1.2, Proposition 2.5 and Lemma 2.7, author preprint pp. 21–23.
Declaration: SemistablePeriodExample [component signature]
Contract: For the supercuspidal rank-two slope-1/2 L-(φ,N,G_F)-module M of CDN §2.1.2,
X_st⁺(M)=(B_cris⁺⊗M)^{φ=p} is a positive Banach–Colmez space of L-Dimension ([L:Q_p],2).
The one-dimensional multiplicity conclusion of Lemma 2.7 also uses the
admissibility/p-adic Hodge representation input; it is not deduced from Dimension for an
arbitrary rank-two module.
Hypotheses: Retain the paper’s supercuspidal hypothesis, coefficient action, and
normalization of L-Dimension. No extension to arbitrary rank-two M or a new
local-Langlands theorem is claimed.
Direct imports: VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples,
VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian,
VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces,
PadicHodgeTheory:R06.2.

VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization
Sources: FS-geometrization, Propositions II.2.16 and II.3.5, pp. 72,80.
Declaration: BCProjectivization [component signature]
Contract: For an E-module BC v-sheaf W over S, define W× as the complement of its zero
section and PBC(W)=W×/underline E×, the v-sheaf quotient of the scalar action. The
quotient map is an E×-torsor on this punctured locus. Representability and properness
are separate theorems. Apply to both section and two-term hypercohomology objects.
Hypotheses: W is an E-module v-sheaf; the zero section is closed in the locally spatial
cases where complement is used.
API BCProjectivization [component signature]: The v-sheaf quotient of punctured W by scalar E×.
API BCProjectivization.torsor [component signature]: W×→PBC(W) is an underline E× torsor.
API BCProjectivization.lift [component signature]: An E×-invariant map W×→Z descends uniquely to PBC(W).
API BCProjectivization.baseChange [component signature]: Perfectoid base change commutes with scalar
projectivization.
Test BCProjectivizationTest.zero [component example] (degenerate): PBC(0) is empty.
Test BCProjectivizationTest.line [component example] (computation): PBC(underline E)=S.
Test BCProjectivizationTest.unitTwist [component example] (compatibility): PBC(BC(O(1)))≅Div¹, with the
fundamental scalar torsor.
Missing fixture for BCProjectivizationTest.absolute: The actual punctured absolute BC(O(d)), d≥1, with uniformizer action is required; arbitrary contracting-orbit spaces may be quasiseparated.
Test BCProjectivizationTest.absolute [omitted example] (non-example): Punctured BC(O(d)) is spatial while
its π^Z-quotient is not quasiseparated; ordinary properness does not imply total
absolute spatiality.
Direct imports:
VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition,
DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products,
DiamondsAndVStacks:D5/relative-representability.

VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension
Sources: FS-geometrization, Definition I.3.5 and examples, p. 19; II.3.5, pp. 79–81; CN25, Example 3.3 and §3.2.5, pp. 13,16.
Declaration: PositiveRangeDimension [component signature]
Contract: For bundles E₀,E₁ with E₀ everywhere positive and E₁ everywhere negative, the
cohomologically smooth relative BCcomplex([E₁→E₀]) has locally constant dimension
deg(E₀)−deg(E₁), componentwise. In particular a positive bundle E has BC dimension
deg(E); a negative bundle has shifted BC dimension −deg(E). Geometrically these are the
first entries of the BC Dimension; height is rank(E₀)−rank(E₁). Slope-zero section
sheaves are locally profinite of dimension zero via the E-local-system equivalence.
Hypotheses: Use the canonical geometric degree and fixed coefficient field E. Diamond
relative dimension is the cohomologically smooth dimension, not the rank or height; the
numeric Dimension comparison is classical Q_p over fixed C.
Direct imports:
VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces,
VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution,
VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations,
VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems,
VectorBundlesAndIsocrystals:VB1/cohomology-of-twists,
VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples,
DiamondSixOperations:S5.

-/
