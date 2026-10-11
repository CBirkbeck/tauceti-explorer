/-
This file is not the roadmap and is not exhaustive. The accompanying reader is
its definitive specification. These suggested Lean forms help contributors and
reviewers converge on names and signatures. Every proof is unchecked.

The accepted R09.7 packet owns the core algorithm. The definitions in the
`Imported` namespace below are pin-only signature adapters for those owners and
StableReduction, not additional blueprint nodes. Packaging must import their
actual declarations, in particular current `IdealSheafData.IsEffectiveCartier`.
No general resolution, coefficient-presentation, or ordinary blowup is replanned.
-/
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.Ideal.Colon
import Mathlib.RingTheory.MvPowerSeries.Derivative
import Mathlib.AlgebraicTopology.FundamentalGroupoid.FundamentalGroup
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.CircleMap

noncomputable section
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry TopologicalSpace
open scoped BigOperators
set_option linter.unusedVariables false

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ResolutionInterfaces

namespace Imported
-- R09.7/snc-boundary: labelled globally smooth branches, including empty labels.
abbrev affine (k : Type) [Field k] (n : ℕ) := Spec (.of (MvPolynomial (Fin n) k))
def affineToBase (k : Type) [Field k] (n : ℕ) : affine k n ⟶ Spec (.of k) :=
  Spec.map (CommRingCat.ofHom MvPolynomial.C)
def coordinateIdeal (k : Type) [Field k] (n : ℕ) (i : Fin n) :
    (affine k n).IdealSheafData :=
  (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk (Ideal.span ({MvPolynomial.X i} : Set _))))).ker
def coordinateCentre (k : Type) [Field k] (n : ℕ) (I : Finset (Fin n)) :
    (affine k n).IdealSheafData :=
  (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk
    (Ideal.span (MvPolynomial.X '' (I : Set (Fin n))))))).ker

def SNCAt {k : Type} [Field k] {X : Scheme} (s : X ⟶ Spec (.of k))
    {m : ℕ} (E : Fin m → X.IdealSheafData) (a : X) : Prop :=
  ∃ (n : ℕ) (V : Scheme) (j : V ⟶ X) (p : V ⟶ affine k n)
    (active : Finset (Fin m)) (index : {i // i ∈ active} → Fin n),
    IsOpenImmersion j ∧ Etale p ∧ j ≫ s = p ≫ affineToBase k n ∧
    a ∈ Set.range j ∧ Function.Injective index ∧
    (∀ i, i ∈ active ↔ a ∈ (E i).support) ∧
    (∀ i (hi : i ∈ active), (E i).comap j =
      (coordinateIdeal k n (index ⟨i, hi⟩)).comap p) ∧
    (∀ i, i ∉ active → (E i).comap j = ⊤)
def SNCBoundary {k : Type} [Field k] {X : Scheme} (s : X ⟶ Spec (.of k))
    {m : ℕ} (E : Fin m → X.IdealSheafData) : Prop :=
  Smooth s ∧ QuasiCompact s ∧ (∀ a, SNCAt s E a) ∧
    (∀ i, Smooth ((E i).subschemeι ≫ s))

-- R09.7/permissible-centre, specialized to an ideal on the whole ambient scheme.
def CoordinateCentre {k : Type} [Field k] {X : Scheme}
    (s : X ⟶ Spec (.of k)) {m : ℕ} (E : Fin m → X.IdealSheafData)
    (C : X.IdealSheafData) : Prop :=
  Smooth (C.subschemeι ≫ s) ∧
  ∀ a : C.subscheme, ∃ (n : ℕ) (V : Scheme) (j : V ⟶ X)
    (p : V ⟶ affine k n) (I : Finset (Fin n))
    (active : Finset (Fin m)) (index : {i // i ∈ active} → Fin n),
    IsOpenImmersion j ∧ Etale p ∧ j ≫ s = p ≫ affineToBase k n ∧
    C.subschemeι a ∈ Set.range j ∧ Function.Injective index ∧
    C.comap j = (coordinateCentre k n I).comap p ∧
    (∀ i, i ∈ active ↔ C.subschemeι a ∈ (E i).support) ∧
    (∀ i (hi : i ∈ active), (E i).comap j =
      (coordinateIdeal k n (index ⟨i, hi⟩)).comap p) ∧
    (∀ i, i ∉ active → (E i).comap j = ⊤)

-- Current Tau Ceti supplies this notion natively; it is absent at the pin.
def CartierIdeal {X : Scheme} (I : X.IdealSheafData) : Prop :=
  ∀ a : X, ∃ (U : X.affineOpens), a ∈ U.1 ∧
    ∃ e : X.presheaf.obj (.op U.1), IsRegular e ∧ I.ideal U = Ideal.span ({e} : Set _)
-- StableReduction Layer 4 universal-property signature adapter.
def IsBlowupOf {X Y : Scheme} (C : X.IdealSheafData) (p : Y ⟶ X) : Prop :=
  CartierIdeal (C.comap p) ∧ ∀ (Z : Scheme) (f : Z ⟶ X),
    CartierIdeal (C.comap f) → ∃! g : Z ⟶ Y, g ≫ p = f

def idealComplement {X : Scheme} (I : X.IdealSheafData) : X.Opens :=
  ⟨(I.support : Set X)ᶜ, I.support.isClosed.isOpen_compl⟩
-- Imported ordinary strict-transform closure, with actual scheme structure.
def strictIdeal {X Y : Scheme} (I C : X.IdealSheafData) (p : Y ⟶ X) :
    Y.IdealSheafData :=
  (((I.comap p).subschemeι ⁻¹ᵁ (p ⁻¹ᵁ idealComplement C)).ι ≫
    (I.comap p).subschemeι).ker

attribute [local instance] MvPolynomial.gradedAlgebra
def projective (k : Type) [Field k] (n : ℕ) : Scheme :=
  Proj (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k)
def degreeZeroConstants (k : Type) [Field k] (n : ℕ) :
    k →+* MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k 0 where
  toFun r := ⟨MvPolynomial.C r, by sorry⟩
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry
def projectiveToBase (k : Type) [Field k] (n : ℕ) : projective k n ⟶ Spec (.of k) :=
  Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k) ≫
    Spec.map (CommRingCat.ofHom (degreeZeroConstants k n))
structure SNCCompactification {k : Type} [Field k] {U : Scheme}
    (s : U ⟶ Spec (.of k)) where
  total : Scheme
  toBase : total ⟶ Spec (.of k)
  dimension : ℕ
  embedding : total ⟶ projective k dimension
  closed : IsClosedImmersion embedding
  over_base : embedding ≫ projectiveToBase k dimension = toBase
  openEmbedding : U ⟶ total
  openImmersion : IsOpenImmersion openEmbedding
  open_over_base : openEmbedding ≫ toBase = s
  dense : Dense (Set.range openEmbedding)
  labels : ℕ
  boundary : Fin labels → total.IdealSheafData
  snc : SNCBoundary toBase boundary
  complement : (⋃ i, (boundary i).support : Set total) = (Set.range openEmbedding)ᶜ
end Imported
open Imported

/-! R09.7a/finite-blowup-tower. The initial equality is used only to identify year
zero with the given scheme, and never hides an arbitrary scheme carrier. -/
structure BlowupTower (X : Scheme) where
  length : ℕ
  space : Fin (length + 1) → Scheme
  initial : space 0 = X
  centre : (i : Fin length) → (space i.castSucc).IdealSheafData
  centre_fg : ∀ i U, ((centre i).ideal U).FG
  step : (i : Fin length) → space i.succ ⟶ space i.castSucc
  blowup : ∀ i, IsBlowupOf (centre i) (step i)
  proper : ∀ i, IsProper (step i)
namespace BlowupTower
variable {X : Scheme}
def identity (X : Scheme) : BlowupTower X := by sorry
def between (T : BlowupTower X) (i j : Fin (T.length + 1)) (h : i ≤ j) :
    T.space j ⟶ T.space i := by sorry
def toBase (T : BlowupTower X) (i : Fin (T.length + 1)) : T.space i ⟶ X :=
  T.between 0 i (Fin.zero_le i) ≫ eqToHom T.initial
lemma toBase_zero (T : BlowupTower X) : T.toBase 0 = eqToHom T.initial := by sorry
lemma toBase_succ (T : BlowupTower X) (i : Fin T.length) :
    T.toBase i.succ = T.step i ≫ T.toBase i.castSucc := by sorry
def exceptional (T : BlowupTower X) (i : Fin T.length) : (T.space i.succ).IdealSheafData :=
  (T.centre i).comap (T.step i)
lemma exceptional_cartier (T : BlowupTower X) (i : Fin T.length) :
    CartierIdeal (T.exceptional i) := by sorry
def restrict (T : BlowupTower X) (W : X.Opens) : BlowupTower W.toScheme := by sorry
lemma restrict_length (T : BlowupTower X) (W : X.Opens) :
    (T.restrict W).length = T.length := by sorry
-- This is a native comparison, not a redefinition of scheme pullback.
def restrictComparison (T : BlowupTower X) (W : X.Opens) (i : Fin (T.length + 1)) :
    (T.restrict W).space (Fin.cast (by sorry) i) ≅ pullback (T.toBase i) W.ι := by sorry

def single {Y : Scheme} (C : X.IdealSheafData) (p : Y ⟶ X)
    (hfg : ∀ U, (C.ideal U).FG) (hb : IsBlowupOf C p) (hp : IsProper p) :
    BlowupTower X := by sorry
lemma single_length {Y : Scheme} (C : X.IdealSheafData) (p : Y ⟶ X)
    (hfg : ∀ U, (C.ideal U).FG) (hb : IsBlowupOf C p) (hp : IsProper p) :
    (single C p hfg hb hp).length = 1 := by sorry
end BlowupTower

namespace BlowupTowerTests
-- identity
example (X : Scheme) : (BlowupTower.identity X).length = 0 := by sorry
example (X : Scheme) : HEq ((BlowupTower.identity X).toBase 0) (𝟙 X) := by sorry
-- oneStep: equality is after the initial and endpoint identifications.
example {X Y : Scheme} (C : X.IdealSheafData) (p : Y ⟶ X)
    (hfg : ∀ U, (C.ideal U).FG) (hb : IsBlowupOf C p) (hp : IsProper p) :
    let T := BlowupTower.single C p hfg hb hp
    ∃ e : T.space (Fin.last T.length) ≅ Y, T.toBase (Fin.last T.length) = e.hom ≫ p ∧
      HEq (T.exceptional (Fin.cast (by sorry) (0 : Fin 1))) ((C.comap p).comap e.hom) := by sorry
-- cartierCentre
example {X Y : Scheme} (C : X.IdealSheafData) (p : Y ⟶ X)
    (hc : CartierIdeal C) (hnot : C ≠ ⊤) (hb : IsBlowupOf C p) :
    IsIso p ∧ C.comap p ≠ ⊤ := by sorry
end BlowupTowerTests

structure MarkedTower {k : Type} [Field k] {M : Scheme}
    (s : M ⟶ Spec (.of k)) where
  tower : BlowupTower M
  mark : ℕ
  mark_pos : 0 < mark
  initialLabels : ℕ
  ideal : (i : Fin (tower.length + 1)) → (tower.space i).IdealSheafData
  boundary : (i : Fin (tower.length + 1)) → Fin (initialLabels + i.val) →
    (tower.space i).IdealSheafData
  snc : ∀ i, SNCBoundary (tower.toBase i ≫ s) (boundary i)
  permissible : ∀ i, CoordinateCentre (tower.toBase i.castSucc ≫ s)
    (boundary i.castSucc) (tower.centre i)
  divisible : ∀ i, ideal i.castSucc ≤ tower.centre i ^ mark
  controlled_eq : ∀ i, (ideal i.castSucc).comap (tower.step i) =
    tower.exceptional i ^ mark * ideal i.succ
  old_boundary : ∀ (i : Fin tower.length) (j : ℕ) (h : j < initialLabels + i.val),
    boundary i.succ ⟨j, by sorry⟩ = strictIdeal (boundary i.castSucc ⟨j, h⟩)
      (tower.centre i) (tower.step i)
  new_boundary : ∀ i, boundary i.succ ⟨initialLabels + i.val, by sorry⟩ =
    tower.exceptional i
namespace MarkedTower
variable {k : Type} [Field k] {M : Scheme} {s : M ⟶ Spec (.of k)}
lemma controlled (T : MarkedTower s) (i : Fin T.tower.length) :
    (T.ideal i.castSucc).comap (T.tower.step i) =
      T.tower.exceptional i ^ T.mark * T.ideal i.succ := by sorry
lemma oldBoundary (T : MarkedTower s) (i : Fin T.tower.length)
    (j : ℕ) (h : j < T.initialLabels + i.val) :
    T.boundary i.succ ⟨j, by sorry⟩ = strictIdeal (T.boundary i.castSucc ⟨j, h⟩)
      (T.tower.centre i) (T.tower.step i) := by sorry
lemma newBoundary (T : MarkedTower s) (i : Fin T.tower.length) :
    T.boundary i.succ ⟨T.initialLabels + i.val, by sorry⟩ = T.tower.exceptional i := by sorry
lemma totalTransform (T : MarkedTower s) :
    (T.ideal 0).comap (T.tower.between 0 (Fin.last T.tower.length) (by sorry)) =
      (∏ i : Fin T.tower.length,
        (T.tower.exceptional i).comap
          (T.tower.between i.succ (Fin.last T.tower.length) (by sorry)) ^ T.mark) *
        T.ideal (Fin.last T.tower.length) := by sorry
end MarkedTower
namespace MarkedTowerTests
-- cartierDivision: a native marked-tower certificate plus the local colon calculation.
example (k : Type) [Field k] [CharZero k] :
    ∃ T : MarkedTower (affineToBase k 2),
      T.tower.length = 1 ∧ T.initialLabels = 0 ∧ T.mark = 2 ∧
      T.ideal 0 = (coordinateIdeal k 2 0 ^ 2 * coordinateIdeal k 2 1).comap
        (T.tower.toBase 0) ∧
      T.ideal (Fin.last T.tower.length) = (coordinateIdeal k 2 1).comap
        (T.tower.toBase (Fin.last T.tower.length)) ∧
      T.tower.centre ⟨0, by sorry⟩ = (coordinateIdeal k 2 0).comap
        (T.tower.toBase (Fin.cast (by sorry) (0 : Fin 2))) := by sorry
example (k : Type) [Field k] :
    (Ideal.span ({MvPolynomial.X (0 : Fin 2) ^ 2 * MvPolynomial.X (1 : Fin 2)} :
      Set (MvPolynomial (Fin 2) k))).colon
      ({MvPolynomial.X (0 : Fin 2) ^ 2} : Set _) =
      Ideal.span ({MvPolynomial.X (1 : Fin 2)} : Set _) := by sorry
-- deadLabel
example {X Y : Scheme} (C : X.IdealSheafData) (p : Y ⟶ X) (h : IsBlowupOf C p) :
    strictIdeal C C p = ⊤ := by sorry
-- twoYears
example {k : Type} [Field k] {M : Scheme} {s : M ⟶ Spec (.of k)}
    (T : MarkedTower s) (h : T.tower.length = 2) :
    let i₀ : Fin T.tower.length := ⟨0, by sorry⟩
    let i₁ : Fin T.tower.length := ⟨1, by sorry⟩
    (T.ideal 0).comap (T.tower.between 0 (Fin.last T.tower.length) (by sorry)) =
      ((T.tower.exceptional i₀).comap
        (T.tower.between i₀.succ (Fin.last T.tower.length) (by sorry))) ^ T.mark *
      ((T.tower.exceptional i₁).comap
        (T.tower.between i₁.succ (Fin.last T.tower.length) (by sorry))) ^ T.mark *
      T.ideal (Fin.last T.tower.length) := by sorry
end MarkedTowerTests

/-! R09.7b. The native completion existence/reflection theorem remains the
SF.0 request. This calculation states the exact derivative/restriction bridge
it must supply, rather than assuming unrelated formal germs have descended. -/
def contactExponent {σ : Type*} [DecidableEq σ] (q : ℕ) (a : σ →₀ ℕ) :
    Option σ →₀ ℕ := Finsupp.single none q + a.embDomain Function.Embedding.some
def contactCoefficient {σ K : Type*} [DecidableEq σ] [Field K]
    (f : MvPowerSeries (Option σ) K) (q : ℕ) : MvPowerSeries σ K :=
  fun a => MvPowerSeries.coeff (contactExponent q a) f

theorem coefficientCompletionComparison {σ k K R B : Type*} [DecidableEq σ]
    [Field k] [CharZero k] [Field K] [CharZero K] [Algebra k K] [CommRing R] [CommRing B] [Algebra k R] [Algebra k B]
    (δ : Derivation k R R) (φ : R →ₐ[k] MvPowerSeries (Option σ) K)
    (ψ : R →ₐ[k] B) (γ : B →ₐ[k] MvPowerSeries σ K)
    (hδ : ∀ f, φ (δ f) = MvPowerSeries.pderiv K none (φ f))
    (hψ : ∀ f, γ (ψ f) = contactCoefficient (φ f) 0) (f : R) (q : ℕ) :
    γ (ψ ((q.factorial : k)⁻¹ • (δ^[q]) f)) = contactCoefficient (φ f) q := by sorry
-- Common-mark ideal extension, with actual ideal-map operations.
theorem coefficientCompletionIdeal {ι σ k K R B : Type*} [Fintype ι]
    [DecidableEq σ] [Field k] [CharZero k] [Field K] [CharZero K] [Algebra k K] [CommRing R] [CommRing B]
    [Algebra k R] [Algebra k B] (δ : Derivation k R R)
    (φ : R →ₐ[k] MvPowerSeries (Option σ) K) (ψ : R →ₐ[k] B)
    (γ : B →ₐ[k] MvPowerSeries σ K)
    (hδ : ∀ f, φ (δ f) = MvPowerSeries.pderiv K none (φ f))
    (hψ : ∀ f, γ (ψ f) = contactCoefficient (φ f) 0)
    (f : ι → R) (d : ι → ℕ) (L : ℕ) (hL : 0 < L)
    (hd : ∀ i, 0 < d i) (hdiv : ∀ i (q : Fin (d i)), d i - q.val ∣ L) :
    Ideal.map γ.toRingHom
      (Ideal.span (Set.range fun iq : (i : ι) × Fin (d i) =>
        ψ (((iq.2.val.factorial : k)⁻¹) • (δ^[iq.2.val]) (f iq.1)) ^
          (L / (d iq.1 - iq.2.val)))) =
    Ideal.span (Set.range fun iq : (i : ι) × Fin (d i) =>
      contactCoefficient (φ (f iq.1)) iq.2.val ^ (L / (d iq.1 - iq.2.val))) := by sorry
-- Strict q<d guard: adding the q=d coefficient of z² would introduce a unit.
example (K : Type) [Field K] [CharZero K] :
    contactCoefficient (MvPowerSeries.X (none : Option (Fin 1)) ^ 2 :
      MvPowerSeries (Option (Fin 1)) K) 2 = 1 := by sorry

/-! R09.7c output certificates. The accepted algorithm constructs these objects;
the arbitrary carriers of a proper morphism cannot substitute for a tower. -/
structure PrincipalizationTower {k : Type} [Field k] {M : Scheme}
    (s : M ⟶ Spec (.of k)) (J : M.IdealSheafData) where
  tower : BlowupTower M
  boundary : (i : Fin (tower.length + 1)) → Fin i.val → (tower.space i).IdealSheafData
  snc : ∀ i, SNCBoundary (tower.toBase i ≫ s) (boundary i)
  permissible : ∀ i, CoordinateCentre (tower.toBase i.castSucc ≫ s)
    (boundary i.castSucc) (tower.centre i)
  old_boundary : ∀ (i : Fin tower.length) (j : ℕ) (h : j < i.val),
    boundary i.succ ⟨j, by sorry⟩ = strictIdeal (boundary i.castSucc ⟨j, h⟩)
      (tower.centre i) (tower.step i)
  new_boundary : ∀ i, boundary i.succ ⟨i.val, by sorry⟩ = tower.exceptional i
  centres_away : ∀ i, ((tower.centre i).support : Set (tower.space i.castSucc)) ⊆
    ((J.comap (tower.toBase i.castSucc)).support : Set _)
  totalIdeal : (tower.space (Fin.last tower.length)).IdealSheafData
  total_eq : totalIdeal = J.comap (tower.toBase (Fin.last tower.length))
  weakIdeal : (tower.space (Fin.last tower.length)).IdealSheafData
  weak_isUnit : weakIdeal = ⊤
  exponents : Fin tower.length → ℕ
  factorization : totalIdeal =
    (∏ j : Fin tower.length, boundary (Fin.last tower.length) j ^ exponents j) * weakIdeal
  cartier : CartierIdeal totalIdeal
  preserved : IsIso (tower.toBase (Fin.last tower.length) ∣_ idealComplement J)
namespace PrincipalizationTower
variable {k : Type} [Field k] {M : Scheme} {s : M ⟶ Spec (.of k)} {J : M.IdealSheafData}
lemma totalIdeal_eq (P : PrincipalizationTower s J) :
    P.totalIdeal = J.comap (P.tower.toBase (Fin.last P.tower.length)) := by sorry
lemma weakIdeal_eq (P : PrincipalizationTower s J) : P.weakIdeal = ⊤ := by sorry
lemma preservedOpen (P : PrincipalizationTower s J) :
    IsIso (P.tower.toBase (Fin.last P.tower.length) ∣_ idealComplement J) := by sorry
def ofUnit (s : M ⟶ Spec (.of k)) [Smooth s] [QuasiCompact s] :
    PrincipalizationTower s ⊤ := by sorry
-- The witness exists by the aggregate algorithm, not by the output fields alone.
theorem exists_of_generically_nonzero [CharZero k] (s : M ⟶ Spec (.of k))
    [Smooth s] [QuasiCompact s] (J : M.IdealSheafData)
    (hJ : ∀ U, (J.ideal U).FG)
    (hgeneric : Dense ((J.support : Set M)ᶜ)) :
    Nonempty (PrincipalizationTower s J) := by sorry
end PrincipalizationTower
namespace PrincipalizationTowerTests
-- unit
example {k : Type} [Field k] {M : Scheme} (s : M ⟶ Spec (.of k))
    [Smooth s] [QuasiCompact s] :
    (PrincipalizationTower.ofUnit s).tower.length = 0 ∧
      HEq ((PrincipalizationTower.ofUnit s).tower.toBase
        (Fin.last (PrincipalizationTower.ofUnit s).tower.length)) (𝟙 M) := by sorry
-- coordinateMonomial: two identity Cartier blowups retain both birth labels.
def monomialIdeal (k : Type) [Field k] : (affine k 2).IdealSheafData :=
  coordinateIdeal k 2 0 ^ 2 * coordinateIdeal k 2 1 ^ 3
example (k : Type) [Field k] [CharZero k] :
    ∃ P : PrincipalizationTower (affineToBase k 2) (monomialIdeal k),
      P.tower.length = 2 ∧ IsIso (P.tower.toBase (Fin.last P.tower.length)) ∧
      P.weakIdeal = ⊤ ∧
      P.exponents ⟨0, by sorry⟩ = 2 ∧ P.exponents ⟨1, by sorry⟩ = 3 ∧
      P.boundary (Fin.last P.tower.length) ⟨0, by sorry⟩ =
        (coordinateIdeal k 2 0).comap (P.tower.toBase (Fin.last P.tower.length)) ∧
      P.boundary (Fin.last P.tower.length) ⟨1, by sorry⟩ =
        (coordinateIdeal k 2 1).comap (P.tower.toBase (Fin.last P.tower.length)) := by sorry
-- nativePullback
example {k : Type} [Field k] {M : Scheme} {s : M ⟶ Spec (.of k)} {J : M.IdealSheafData}
    (P : PrincipalizationTower s J) :
    P.totalIdeal = J.comap (P.tower.toBase (Fin.last P.tower.length)) := by sorry
end PrincipalizationTowerTests

structure EmbeddedTower {k : Type} [Field k] {M X : Scheme}
    (s : M ⟶ Spec (.of k)) (i : X ⟶ M)
    [LocallyOfFinitePresentation (i ≫ s)] where
  tower : BlowupTower M
  strictIdeal : (j : Fin (tower.length + 1)) → (tower.space j).IdealSheafData
  initial_strict : strictIdeal 0 = i.ker.comap (eqToHom tower.initial)
  next_strict : ∀ j, strictIdeal j.succ = Imported.strictIdeal
    (strictIdeal j.castSucc) (tower.centre j) (tower.step j)
  strictMap : (j : Fin tower.length) → (strictIdeal j.succ).subscheme ⟶
    (strictIdeal j.castSucc).subscheme
  square : ∀ j, (strictIdeal j.succ).subschemeι ≫ tower.step j =
    strictMap j ≫ (strictIdeal j.castSucc).subschemeι
  boundary : (j : Fin (tower.length + 1)) → Fin j.val → (tower.space j).IdealSheafData
  snc : ∀ j, SNCBoundary (tower.toBase j ≫ s) (boundary j)
  old_boundary : ∀ (j : Fin tower.length) (r : ℕ) (h : r < j.val),
    boundary j.succ ⟨r, by sorry⟩ = Imported.strictIdeal (boundary j.castSucc ⟨r, h⟩)
      (tower.centre j) (tower.step j)
  new_boundary : ∀ j, boundary j.succ ⟨j.val, by sorry⟩ = tower.exceptional j
  toInput : (strictIdeal (Fin.last tower.length)).subscheme ⟶ X
  output_square : (strictIdeal (Fin.last tower.length)).subschemeι ≫
    tower.toBase (Fin.last tower.length) = toInput ≫ i
  proper : IsProper toInput
  preserved : IsIso (toInput ∣_ (i ≫ s).smoothLocus)
  endpoint_snc : SNCBoundary
    ((strictIdeal (Fin.last tower.length)).subschemeι ≫
      tower.toBase (Fin.last tower.length) ≫ s)
    (fun r => (boundary (Fin.last tower.length) r).comap
      (strictIdeal (Fin.last tower.length)).subschemeι)
namespace EmbeddedTower
variable {k : Type} [Field k] {M X : Scheme}
variable {s : M ⟶ Spec (.of k)} {i : X ⟶ M}
variable [LocallyOfFinitePresentation (i ≫ s)]
lemma strictIdeal_eq (P : EmbeddedTower s i) (j : Fin P.tower.length) :
    P.strictIdeal j.succ = Imported.strictIdeal (P.strictIdeal j.castSucc)
      (P.tower.centre j) (P.tower.step j) := by sorry
lemma square_eq (P : EmbeddedTower s i) (j : Fin P.tower.length) :
    (P.strictIdeal j.succ).subschemeι ≫ P.tower.step j =
      P.strictMap j ≫ (P.strictIdeal j.castSucc).subschemeι := by sorry
lemma smoothEndpoint (P : EmbeddedTower s i) :
    SNCBoundary ((P.strictIdeal (Fin.last P.tower.length)).subschemeι ≫
      P.tower.toBase (Fin.last P.tower.length) ≫ s)
      (fun r => (P.boundary (Fin.last P.tower.length) r).comap
        (P.strictIdeal (Fin.last P.tower.length)).subschemeι) := by sorry
lemma preservedOpen (P : EmbeddedTower s i) :
    IsIso (P.toInput ∣_ (i ≫ s).smoothLocus) := by sorry
def identity (s : M ⟶ Spec (.of k)) (i : X ⟶ M) [IsClosedImmersion i]
    [Smooth s] [QuasiCompact s] [Smooth (i ≫ s)] : EmbeddedTower s i := by sorry
theorem exists_of_reduced [CharZero k] [IsReduced X]
    (s : M ⟶ Spec (.of k)) (i : X ⟶ M) [IsClosedImmersion i]
    [Smooth s] [QuasiCompact s] [LocallyOfFinitePresentation (i ≫ s)] :
    Nonempty (EmbeddedTower s i) := by sorry
-- The complete pair/resolved-open and canonical whole-tower comparison predicates
-- remain the accepted owners. They are not replaced by arbitrary Prop fields.
end EmbeddedTower
namespace EmbeddedTowerTests
-- identity
example {k : Type} [Field k] {M X : Scheme} (s : M ⟶ Spec (.of k)) (i : X ⟶ M)
    [IsClosedImmersion i] [Smooth s] [QuasiCompact s] [Smooth (i ≫ s)] :
    (EmbeddedTower.identity s i).tower.length = 0 ∧
      IsIso (EmbeddedTower.identity s i).toInput := by sorry
-- avoidsCentre
example {M Y : Scheme} (I C : M.IdealSheafData) (p : Y ⟶ M)
    (h : Disjoint I.support C.support) (hb : IsBlowupOf C p) :
    Imported.strictIdeal I C p = I.comap p ∧ IsIso (pullback.snd p I.subschemeι) := by sorry
-- containsCentre: the centre's strict transform is empty, its total transform isn't.
example (k : Type) [Field k] {Y : Scheme} (p : Y ⟶ affine k 2)
    (hb : IsBlowupOf (coordinateCentre k 2 Finset.univ) p) :
    Imported.strictIdeal (coordinateCentre k 2 Finset.univ)
      (coordinateCentre k 2 Finset.univ) p = ⊤ ∧
      (coordinateCentre k 2 Finset.univ).comap p ≠ ⊤ := by sorry
end EmbeddedTowerTests

/-! R09.7d. Native output of branch-stratum strictification. The complete
normalization/distinct-branch stratification and its stack atlas signature are
omitted until those supplier carriers exist; the reader specifies their centres.
This output is not asserted for an arbitrary singular divisor. -/
structure BoundaryRefinement {k : Type} [Field k] {Y : Scheme}
    (s : Y ⟶ Spec (.of k)) (D : Y.IdealSheafData) where
  tower : BlowupTower Y
  labelCount : ℕ
  boundary : Fin labelCount → (tower.space (Fin.last tower.length)).IdealSheafData
  snc : SNCBoundary (tower.toBase (Fin.last tower.length) ≫ s) boundary
  supported : ∀ i, ((tower.centre i).support : Set (tower.space i.castSucc)) ⊆
    ((D.comap (tower.toBase i.castSucc)).support : Set _)
  complement : (⋃ j, ((boundary j).support : Set (tower.space (Fin.last tower.length)))) =
    ((D.comap (tower.toBase (Fin.last tower.length))).support : Set (tower.space (Fin.last tower.length)))
  preserved : IsIso (tower.toBase (Fin.last tower.length) ∣_ idealComplement D)
namespace BoundaryRefinement
variable {k : Type} [Field k] {Y : Scheme} {s : Y ⟶ Spec (.of k)} {D : Y.IdealSheafData}
lemma «open» (P : BoundaryRefinement s D) :
    IsIso (P.tower.toBase (Fin.last P.tower.length) ∣_ idealComplement D) ∧
      (⋃ j, ((P.boundary j).support : Set (P.tower.space (Fin.last P.tower.length)))) =
        ((D.comap (P.tower.toBase (Fin.last P.tower.length))).support : Set (P.tower.space (Fin.last P.tower.length))) := by sorry
-- The localChart API is the actual coordinate substitution for each boundary branch.
def pivotSubstitution (n : ℕ) (k : Type) [Field k] (I : Finset (Fin n)) (p : Fin n) :
    MvPolynomial (Fin n) k →ₐ[k] MvPolynomial (Fin n) k :=
  MvPolynomial.aeval fun i => if i = p then MvPolynomial.X p
    else if i ∈ I then MvPolynomial.X p * MvPolynomial.X i else MvPolynomial.X i
lemma localChart (n : ℕ) (k : Type) [Field k] (I : Finset (Fin n)) (p : Fin n) (hp : p ∈ I)
    (i : Fin n) :
    pivotSubstitution n k I p (MvPolynomial.X i) =
      if i = p then MvPolynomial.X p
      else if i ∈ I then MvPolynomial.X p * MvPolynomial.X i else MvPolynomial.X i := by sorry
lemma labels (P : BoundaryRefinement s D) :
    ∀ j, Smooth ((P.boundary j).subschemeι ≫
      P.tower.toBase (Fin.last P.tower.length) ≫ s) := by sorry
-- Full year/label comparison is supplied by branch-stratum descent; this signature
-- pins the native base-change square without asserting the algorithm predicate.
theorem etaleComparison {V : Scheme} (P : BoundaryRefinement s D) (v : V ⟶ Y) [Etale v] [QuasiCompact v] :
    ∃ Q : BoundaryRefinement (v ≫ s) (D.comap v),
      ∃ e : Q.tower.space (Fin.last Q.tower.length) ≅
        pullback (P.tower.toBase (Fin.last P.tower.length)) v,
      e.hom ≫ pullback.snd _ _ = Q.tower.toBase (Fin.last Q.tower.length) := by sorry
def empty (s : Y ⟶ Spec (.of k)) [Smooth s] [QuasiCompact s] :
    BoundaryRefinement s ⊤ := by sorry
end BoundaryRefinement
namespace BoundaryRefinementTests
-- empty
example {k : Type} [Field k] {Y : Scheme} (s : Y ⟶ Spec (.of k))
    [Smooth s] [QuasiCompact s] : (BoundaryRefinement.empty s).tower.length = 0 := by sorry
-- axes: native output and distinct reduced/total boundary equations.
example (k : Type) [Field k] [CharZero k] :
    ∃ P : BoundaryRefinement (affineToBase k 2)
      (coordinateIdeal k 2 0 * coordinateIdeal k 2 1),
      P.tower.length = 1 ∧ P.labelCount = 3 ∧
      P.tower.centre ⟨0, by sorry⟩ = (coordinateCentre k 2 Finset.univ).comap
        (P.tower.toBase (Fin.cast (by sorry) (0 : Fin 2))) := by sorry
example (k : Type) [Field k] :
    BoundaryRefinement.pivotSubstitution 2 k Finset.univ 0
      (MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2)) =
      (MvPolynomial.X (0 : Fin 2)) ^ 2 * MvPolynomial.X (1 : Fin 2) ∧
    (Ideal.span ({(MvPolynomial.X (0 : Fin 2)) ^ 2 * MvPolynomial.X (1 : Fin 2)} :
      Set (MvPolynomial (Fin 2) k))).radical =
      Ideal.span ({MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2)} : Set _) := by sorry
-- nodal: use the irreducible curve y²=x²(x+1), not a globally split pair of lines.
def nodalEquation (k : Type) [Field k] : MvPolynomial (Fin 2) k :=
  MvPolynomial.X 1 ^ 2 - MvPolynomial.X 0 ^ 2 * (MvPolynomial.X 0 + 1)
def nodalIdeal (k : Type) [Field k] : (affine k 2).IdealSheafData :=
  (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk
    (Ideal.span ({nodalEquation k} : Set _))))).ker
example (k : Type) [Field k] [CharZero k] :
    (¬ SNCBoundary (affineToBase k 2) (fun _ : Fin 1 => nodalIdeal k)) ∧
    ∃ P : BoundaryRefinement (affineToBase k 2) (nodalIdeal k),
      P.tower.length = 1 ∧ P.labelCount = 2 ∧
      P.tower.centre ⟨0, by sorry⟩ = (coordinateCentre k 2 Finset.univ).comap
        (P.tower.toBase (Fin.cast (by sorry) (0 : Fin 2))) := by sorry
example (k : Type) [Field k] [CharZero k] :
    BoundaryRefinement.pivotSubstitution 2 k Finset.univ 0 (nodalEquation k) =
      MvPolynomial.X 0 ^ 2 * (MvPolynomial.X 1 ^ 2 - MvPolynomial.X 0 - 1) := by sorry
end BoundaryRefinementTests

structure FiniteCoverCompactification {k : Type} [Field k] {U V : Scheme}
    {s : U ⟶ Spec (.of k)} (C : SNCCompactification s) (f : V ⟶ U) where
  source : SNCCompactification (f ≫ s)
  map : source.total ⟶ C.total
  over_base : map ≫ C.toBase = source.toBase
  proper : IsProper map
  dominant : Dense (Set.range map)
  square : IsPullback source.openEmbedding f map C.openEmbedding
namespace FiniteCoverCompactification
variable {k : Type} [Field k] {U V : Scheme} {s : U ⟶ Spec (.of k)}
variable {C : SNCCompactification s} {f : V ⟶ U}
lemma openSquare (P : FiniteCoverCompactification C f) :
    IsPullback P.source.openEmbedding f P.map C.openEmbedding := by sorry
lemma projective (P : FiniteCoverCompactification C f) :
    IsClosedImmersion P.source.embedding ∧ IsProper P.map ∧
      Dense (Set.range P.map) ∧ Smooth P.source.toBase := by sorry
lemma pullbackBoundary (P : FiniteCoverCompactification C f)
    [IsIntegral P.source.total] (a : P.source.total) :
    ∃ W : P.source.total.affineOpens, a ∈ W.1 ∧
      ∀ i, ∃ e : Fin P.source.labels → ℕ,
        ((C.boundary i).comap P.map).ideal W =
          ∏ j : Fin P.source.labels, (P.source.boundary j).ideal W ^ e j := by sorry
-- As with all Cartier factorization, a common neighbourhood is shrunk to remove
-- components not meeting the chosen point. No flatness of the resolved map is used.
def identity (C : SNCCompactification s) : FiniteCoverCompactification C (𝟙 U) := by sorry
-- Native existence form. The scalar and integral hypotheses are intentionally visible.
theorem exists_over_model [CharZero k] (C : SNCCompactification s) (f : V ⟶ U)
    [Etale f] [IsFinite f] [IsIntegral U] [IsIntegral V]
    (hsurj : Function.Surjective f) : Nonempty (FiniteCoverCompactification C f) := by sorry
end FiniteCoverCompactification
namespace FiniteCoverCompactificationTests
-- identity
example {k : Type} [Field k] {U : Scheme} {s : U ⟶ Spec (.of k)}
    (C : SNCCompactification s) :
    (FiniteCoverCompactification.identity C).source = C ∧
      HEq (FiniteCoverCompactification.identity C).map (𝟙 C.total) := by sorry
-- Test fixtures: the standard charts [t:1] and [1:t] of the native Proj P¹.
-- Their construction comes from Proj.awayι; these are not new blueprint nodes.
def lineChart (k : Type) [Field k] (p : Fin 2) : affine k 1 ⟶ projective k 1 := by sorry
def lineOrigin (k : Type) [Field k] : Spec (.of k) ⟶ affine k 1 :=
  Spec.map (CommRingCat.ofHom (MvPolynomial.eval (fun _ => 0)))
def lineBoundary (k : Type) [Field k] (p : Fin 2) : (projective k 1).IdealSheafData :=
  (lineOrigin k ≫ lineChart k p).ker
lemma lineChart_boundary (k : Type) [Field k] (p q : Fin 2) :
    (lineBoundary k p).comap (lineChart k q) =
      if p = q then coordinateIdeal k 1 0 else ⊤ := by sorry
def linePower (k : Type) [Field k] (e : ℕ) (he : 0 < e) :
    projective k 1 ⟶ projective k 1 := by sorry
lemma linePower_chart (k : Type) [Field k] (e : ℕ) (he : 0 < e) (p : Fin 2) :
    lineChart k p ≫ linePower k e he =
      Spec.map (CommRingCat.ofHom
        (MvPolynomial.aeval (fun _ : Fin 1 => MvPolynomial.X (0 : Fin 1) ^ e)).toRingHom) ≫
      lineChart k p := by sorry
-- powerCover: native P¹ pullbacks at both boundary points, with the actual chart equation.
example (k : Type) [Field k] [CharZero k] (e : ℕ) (he : 0 < e) :
    IsFinite (linePower k e he) ∧ IsProper (linePower k e he) ∧
      ∀ p : Fin 2, (lineBoundary k p).comap (linePower k e he) = lineBoundary k p ^ e := by sorry
-- singularNormalization: the affine quadratic cone is singular despite being the
-- normal extension of the cover. Normalization identification remains the A0 request;
-- the signature here pins the actual singular scheme, not only a zero Jacobian.
def coneEquation (k : Type) [Field k] : MvPolynomial (Fin 3) k :=
  MvPolynomial.X 2 ^ 2 - MvPolynomial.X 0 * MvPolynomial.X 1
abbrev coneRing (k : Type) [Field k] :=
  MvPolynomial (Fin 3) k ⧸ Ideal.span ({coneEquation k} : Set _)
def coneToBase (k : Type) [Field k] : Spec (.of (coneRing k)) ⟶ Spec (.of k) :=
  Spec.map (CommRingCat.ofHom ((Ideal.Quotient.mk _).comp MvPolynomial.C))
example (k : Type) [Field k] [CharZero k] : ¬ Smooth (coneToBase k) := by sorry
end FiniteCoverCompactificationTests

/-! Analytic chart carriers use actual complex coordinate spaces. The scheme
analytification comparison remains the aggregate A0 supplier contract. -/
def polydisc {n : ℕ} (ε : Fin n → ℝ) : Set (Fin n → ℂ) := {z | ∀ i, ‖z i‖ < ε i}
abbrev PuncturedChart {n s : ℕ} (hs : s ≤ n) (ε : Fin n → ℝ) :=
  {z : Fin n → ℂ // z ∈ polydisc ε ∧ ∀ j : Fin s, z (j.castLE hs) ≠ 0}

structure MonomialBoundaryChart (n s m r : ℕ) (hs : s ≤ n) (hr : r ≤ m) where
  sourceRadius : Fin n → ℝ
  sourcePositive : ∀ i, 0 < sourceRadius i
  targetRadius : Fin m → ℝ
  targetPositive : ∀ i, 0 < targetRadius i
  map : (Fin n → ℂ) → (Fin m → ℂ)
  analytic : AnalyticOnNhd ℂ map (polydisc sourceRadius)
  mapsTo : Set.MapsTo map (polydisc sourceRadius) (polydisc targetRadius)
  exponents : Fin r → Fin s → ℕ
  units : Fin r → (Fin n → ℂ) → ℂ
  units_analytic : ∀ i, AnalyticOnNhd ℂ (units i) (polydisc sourceRadius)
  units_nonzero : ∀ i z, z ∈ polydisc sourceRadius → units i z ≠ 0
  equation : ∀ i z, z ∈ polydisc sourceRadius → map z (i.castLE hr) =
    units i z * ∏ j : Fin s, z (j.castLE hs) ^ exponents i j
namespace MonomialBoundaryChart
variable {n s m r : ℕ} {hs : s ≤ n} {hr : r ≤ m}
lemma equation_eq (C : MonomialBoundaryChart n s m r hs hr) (i : Fin r)
    (z : Fin n → ℂ) (hz : z ∈ polydisc C.sourceRadius) :
    C.map z (i.castLE hr) = C.units i z *
      ∏ j : Fin s, z (j.castLE hs) ^ C.exponents i j := by sorry
lemma exponentsUnique (C : MonomialBoundaryChart n s m r hs hr)
    (A : Fin r → Fin s → ℕ) (u : Fin r → (Fin n → ℂ) → ℂ)
    (hu : ∀ i, AnalyticOnNhd ℂ (u i) (polydisc C.sourceRadius))
    (hne : ∀ i z, z ∈ polydisc C.sourceRadius → u i z ≠ 0)
    (heq : ∀ i z, z ∈ polydisc C.sourceRadius → C.map z (i.castLE hr) =
      u i z * ∏ j : Fin s, z (j.castLE hs) ^ A i j) : A = C.exponents := by sorry
-- Composition needs the actual full-coordinate map, including nonboundary coordinates.
def compose {l t : ℕ} {ht : t ≤ l}
    (B : MonomialBoundaryChart m r l t hr ht)
    (A : MonomialBoundaryChart n s m r hs hr)
    (hR : A.targetRadius = B.sourceRadius) : MonomialBoundaryChart n s l t hs ht := by sorry
lemma compose_exponents {l t : ℕ} {ht : t ≤ l}
    (B : MonomialBoundaryChart m r l t hr ht)
    (A : MonomialBoundaryChart n s m r hs hr)
    (hR : A.targetRadius = B.sourceRadius) (i : Fin t) (j : Fin s) :
    (compose B A hR).exponents i j = ∑ a : Fin r, B.exponents i a * A.exponents a j := by sorry
def identity (n s : ℕ) (hs : s ≤ n) (ε : Fin n → ℝ) (hε : ∀ i, 0 < ε i) :
    MonomialBoundaryChart n s n s hs hs := by sorry

def power (e : ℕ) (he : 0 < e) : MonomialBoundaryChart 1 1 1 1 le_rfl le_rfl := by sorry
lemma power_exponent (e : ℕ) (he : 0 < e) : (power e he).exponents 0 0 = e := by sorry
-- Actual map on the punctured complex chart, with inherited topology.
def onComplement (C : MonomialBoundaryChart n s m r hs hr) :
    C(PuncturedChart hs C.sourceRadius, PuncturedChart hr C.targetRadius) := by sorry
lemma onComplement_val (C : MonomialBoundaryChart n s m r hs hr)
    (z : PuncturedChart hs C.sourceRadius) : (C.onComplement z).val = C.map z.val := by sorry
end MonomialBoundaryChart
namespace MonomialBoundaryChartTests
-- identity
example (n s : ℕ) (hs : s ≤ n) (ε : Fin n → ℝ) (hε : ∀ i, 0 < ε i)
    (i j : Fin s) : (MonomialBoundaryChart.identity n s hs ε hε).exponents i j =
      if i = j then 1 else 0 := by sorry
-- power
example (e : ℕ) (he : 0 < e) :
    (MonomialBoundaryChart.power e he).exponents 0 0 = e ∧
      (MonomialBoundaryChart.power e he).units 0 = (fun _ => 1) ∧
      ∀ z ∈ polydisc (MonomialBoundaryChart.power e he).sourceRadius,
        (MonomialBoundaryChart.power e he).map z 0 = z 0 ^ e := by sorry
-- puncturedUnit: the tempting exponent-zero unit is excluded on the full disc.
example : ¬ (∀ z : Fin 1 → ℂ, z ∈ polydisc (fun _ => 1) → z 0 ≠ 0) := by sorry
end MonomialBoundaryChartTests

-- The matrix is target-by-source; rows and columns must not be transposed.
def MeridianMap {r s : ℕ} (A : Fin r → Fin s → ℕ) : (Fin s → ℤ) →+ (Fin r → ℤ) where
  toFun v i := ∑ j, (A i j : ℤ) * v j
  map_zero' := by sorry
  map_add' := by sorry
namespace MeridianMap
variable {r s t : ℕ}
def basis (s : ℕ) (j : Fin s) : Fin s → ℤ := fun i => if i = j then 1 else 0
lemma column (A : Fin r → Fin s → ℕ) (j : Fin s) (i : Fin r) :
    MeridianMap A (basis s j) i = A i j := by sorry
lemma identity (r : ℕ) : MeridianMap (fun i j : Fin r => if i = j then 1 else 0) =
    AddMonoidHom.id (Fin r → ℤ) := by sorry
lemma compose (B : Fin t → Fin r → ℕ) (A : Fin r → Fin s → ℕ) :
    MeridianMap (fun i j => ∑ a : Fin r, B i a * A a j) =
      (MeridianMap B).comp (MeridianMap A) := by sorry
def stratumMatrix (r : ℕ) (I : Finset (Fin r)) (p : Fin r) : Fin r → Fin r → ℕ :=
  fun i j => if j = p then if i ∈ I then 1 else 0 else if i = j then 1 else 0
lemma blowupPivot (r : ℕ) (I : Finset (Fin r)) (p : Fin r) (hp : p ∈ I) :
    MeridianMap (stratumMatrix r I p) (basis r p) =
      fun i => if i ∈ I then 1 else 0 := by sorry
end MeridianMap
namespace MeridianMapTests
-- empty
example : MeridianMap (fun i : Fin 0 => Fin.elim0 i) =
    AddMonoidHom.id (Fin 0 → ℤ) := by sorry
-- axes
example :
    MeridianMap (MeridianMap.stratumMatrix 2 Finset.univ 0) ![1,0] = ![1,1] ∧
      MeridianMap (MeridianMap.stratumMatrix 2 Finset.univ 0) ![0,1] = ![0,1] := by sorry
-- power
example (e : ℕ) : MeridianMap (fun _ _ : Fin 1 => e) (fun _ => 1) 0 = e := by sorry
end MeridianMapTests

/-! The positive meridian is an actual based path, not an arbitrary formal
lattice generator. The membership condition explicitly keeps it in the chart. -/
def coordinateLoop {n : ℕ} (b : Fin n → ℂ) (j : Fin n) (t : unitInterval) : Fin n → ℂ :=
  fun i => if i = j then b i * Complex.exp (2 * Real.pi * (t : ℝ) * Complex.I) else b i

def positiveMeridian {n s : ℕ} (hs : s ≤ n) (ε : Fin n → ℝ)
    (b : PuncturedChart hs ε) (j : Fin s)
    (hloop : ∀ t, coordinateLoop b.val (j.castLE hs) t ∈ polydisc ε) :
    FundamentalGroup (PuncturedChart hs ε) b :=
  Path.Homotopic.Quotient.mk {
    toFun := fun t => ⟨coordinateLoop b.val (j.castLE hs) t, hloop t, by sorry⟩
    continuous_toFun := by sorry
    source' := by sorry
    target' := by sorry }
-- Coordinate loops actually stay in centred polydiscs.
lemma coordinateLoop_mem {n s : ℕ} (hs : s ≤ n) (ε : Fin n → ℝ)
    (b : PuncturedChart hs ε) (j : Fin s) (t : unitInterval) :
    coordinateLoop b.val (j.castLE hs) t ∈ polydisc ε := by sorry

theorem meridianComparison {n s m r : ℕ} {hs : s ≤ n} {hr : r ≤ m}
    (C : MonomialBoundaryChart n s m r hs hr) (b : PuncturedChart hs C.sourceRadius)
    (j : Fin s) :
    FundamentalGroup.map C.onComplement b
      (positiveMeridian hs C.sourceRadius b j (coordinateLoop_mem hs _ b j)) =
      (List.ofFn fun i : Fin r =>
        (positiveMeridian hr C.targetRadius (C.onComplement b) i
          (coordinateLoop_mem hr _ (C.onComplement b) i)) ^ C.exponents i j).prod := by sorry
lemma targetMeridians_commute {n s : ℕ} (hs : s ≤ n) (ε : Fin n → ℝ)
    (b : PuncturedChart hs ε) (i j : Fin s) :
    Commute (positiveMeridian hs ε b i (coordinateLoop_mem hs _ b i))
      (positiveMeridian hs ε b j (coordinateLoop_mem hs _ b j)) := by sorry

/-! Stable-curve stack carriers are not at the pin. The application signature on
those carriers is omitted until the R09.4/R09.5/SF.1 contracts are supplied. The
following is its precise conditional monodromy consequence on native groups;
`ρ` and the node-meridian identifications are supplied by the topological
consumer, not postulated as fields of a pretend moduli stack. -/
theorem stableCurveBoundaryInterface {n s m r : ℕ} {hs : s ≤ n} {hr : r ≤ m}
    (C : MonomialBoundaryChart n s m r hs hr) (b : PuncturedChart hs C.sourceRadius)
    {G : Type*} [Group G]
    (ρ : FundamentalGroup (PuncturedChart hr C.targetRadius) (C.onComplement b) →* G)
    (twists : Fin r → G)
    (htwists : ∀ i, ρ (positiveMeridian hr C.targetRadius (C.onComplement b) i
      (coordinateLoop_mem hr _ (C.onComplement b) i)) = twists i) (j : Fin s) :
    ρ (FundamentalGroup.map C.onComplement b
      (positiveMeridian hs C.sourceRadius b j (coordinateLoop_mem hs _ b j))) =
      (List.ofFn fun i : Fin r => twists i ^ C.exponents i j).prod := by sorry

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.ResolutionInterfaces
