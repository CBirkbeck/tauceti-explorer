import Mathlib.Algebra.Algebra.Rat
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.CategoryTheory.Linear.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.RingTheory.Bialgebra.Equiv
import Mathlib.RingTheory.HopfAlgebra.TensorProduct
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.RingTheory.MvPolynomial.Symmetric.FundamentalTheorem
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Coordinate.HopfAlgebra
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.StandardComodule
import TauCeti.Algebra.AlgebraicGroup.Symplectic.Basic
import TauCeti.Algebra.AlgebraicGroup.Symplectic.StandardComodule
import TauCeti.Algebra.AlgebraicGroup.Symplectic.DiagonalTorus.Basic
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Weight
import TauCeti.Algebra.Coalgebra.Comodule.BaseChange
import TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.Subcoalgebra
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Product
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Preadditive
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Symmetric
import TauCeti.Algebra.Coalgebra.Subcomodule.Comap
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal
import TauCeti.RepresentationTheory.ClassicalGroups.ExteriorPower
import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ClassicalGroupsPartII.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every new construction and proof is unchecked.
The packet and REV-DESIGN-ClassicalGroupsPartII review record the independent
review's contract corrections and source-issue checks.

Baseline: TauCeti f790474821cf4256814db967cb154e7af3d0c369;
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.
Not compiled: no existing shared build was found at BOTH commits.
The review's lean-check attempt stopped at a missing TauCeti import object,
before elaborating these signatures; it does not establish compilation.

The general similitude carrier belongs to ArithmeticStatistics:ST.5. The inline
matrix subtype below specifies the points of its coordinate presentation; it
does not introduce another general similitude group or group law.
The finite-comodule category and SplitK0 are existing library objects.
The generic instance signatures marked RG1 are requested supplier interfaces.

Gap CG.0/central-cover: the scheme-level fppf quotient and kernel-trivial
representation-descent signatures await ReductiveGroups interfaces. They are
omitted, not replaced by opaque proposition fields. The actual coordinate map,
algebraically closed point lifting, and lattice parity are stated below.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits MonoidalCategory
open scoped TensorProduct

namespace TauCeti.GSpCharacter

universe u v

instance rankOnePositive : Fact (0 < 1) := ⟨by sorry⟩
instance rankTwoPositive : Fact (0 < 2) := ⟨by sorry⟩

/-! CG.0: coordinates, the central lattice, and the reciprocal Weyl action. -/

abbrev Weight (g : ℕ) := ℤ × (Fin g → ℤ)

def multiplierWeight (g : ℕ) : Weight g := (1, 0)

def standardWeight {g : ℕ} (i : Fin g) : Weight g := (0, Pi.single i 1)

def centralDegree (g : ℕ) : Weight g →+ ℤ := by sorry

lemma centralDegree_apply {g : ℕ} (λ : Weight g) :
    centralDegree g λ = 2 * λ.1 + ∑ i, λ.2 i := by sorry

abbrev DominantWeight (g : ℕ) :=
  {λ : Weight g // Antitone λ.2 ∧ ∀ i, 0 ≤ λ.2 i}

def coverWeight (g : ℕ) : Weight g →+ ((Fin g → ℤ) × ℤ) := by sorry

lemma coverWeight_apply {g : ℕ} (λ : Weight g) :
    coverWeight g λ = (λ.2, centralDegree g λ) := by sorry

def simpleRoot {g : ℕ} (i : Fin g) : Weight g :=
  if h : i.val+1 < g then standardWeight i - standardWeight ⟨i.val+1,h⟩
  else 2 • standardWeight i - multiplierWeight g

def RootLE {g : ℕ} (μ λ : Weight g) : Prop :=
  ∃ a : Fin g → ℕ, λ - μ = ∑ i, a i • simpleRoot i

abbrev Laurent (g : ℕ) := MonoidAlgebra ℤ (Multiplicative (Weight g))

def monomial {g : ℕ} (λ : Weight g) : Laurent g :=
  MonoidAlgebra.single (Multiplicative.ofAdd λ) 1

def t (g : ℕ) : Laurent g := monomial (multiplierWeight g)

def tInv (g : ℕ) : Laurent g := monomial (-multiplierWeight g)

def z {g : ℕ} (i : Fin g) : Laurent g := monomial (standardWeight i)

def pairedZ {g : ℕ} (i : Fin g) : Laurent g :=
  monomial (multiplierWeight g - standardWeight i)

def permWeight {g : ℕ} (σ : Equiv.Perm (Fin g)) : Weight g ≃+ Weight g := by sorry

def flipWeight {g : ℕ} (i : Fin g) : Weight g ≃+ Weight g := by sorry

lemma permWeight_apply {g : ℕ} (σ : Equiv.Perm (Fin g)) (λ : Weight g) :
    permWeight σ λ = (λ.1, fun i => λ.2 (σ.symm i)) := by sorry

lemma flipWeight_apply {g : ℕ} (i : Fin g) (λ : Weight g) :
    flipWeight i λ = (λ.1 + λ.2 i, Function.update λ.2 i (-λ.2 i)) := by sorry

def permLaurent {g : ℕ} (σ : Equiv.Perm (Fin g)) : Laurent g ≃ₐ[ℤ] Laurent g := by sorry

def flipLaurent {g : ℕ} (i : Fin g) : Laurent g ≃ₐ[ℤ] Laurent g := by sorry

def invariantSubring (g : ℕ) : Subring (Laurent g) := by sorry

lemma mem_invariantSubring {g : ℕ} (f : Laurent g) :
    f ∈ invariantSubring g ↔
      (∀ σ : Equiv.Perm (Fin g), permLaurent σ f = f) ∧
      (∀ i : Fin g, flipLaurent i f = f) := by sorry

def coordinateHopfAlgebra (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : _root_.CommHopfAlgCat.{u} K := by sorry

variable {K : Type u} [Field K] [CharZero K]
variable {g : ℕ} [Fact (0 < g)]

def matrixEntry (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)]
    (a b : Fin (g + g)) : coordinateHopfAlgebra K g := by sorry

def multiplierCoordinate (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : (coordinateHopfAlgebra K g)ˣ := by sorry

def pointsEquiv (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)]
    (A : Type v) [CommRing A] [Algebra K A] :
    (coordinateHopfAlgebra K g →ₐ[K] A) ≃
      {h : Matrix.GeneralLinearGroup (Fin (g + g)) A //
        ∃ s : Aˣ, (h : Matrix _ _ A) * TauCeti.JFin g A *
          (h : Matrix _ _ A).transpose = (s : A) • TauCeti.JFin g A} := by sorry

def coordinateHopfAlgebra_rank_one (K : Type u) [Field K] [CharZero K] :
    coordinateHopfAlgebra K 1 ≅ TauCeti.GeneralLinear.coordinateHopfAlgebra K 2 := by sorry

def torusRestriction (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)] :
    coordinateHopfAlgebra K g →ₐc[K] MonoidAlgebra K (Multiplicative (Weight g)) := by sorry

def torusMatrix (K : Type u) [Field K] [CharZero K] (g : ℕ) :
    Matrix (Fin (g + g)) (Fin (g + g)) (MonoidAlgebra K (Multiplicative (Weight g))) :=
  Matrix.diagonal fun a =>
    if h : a.val < g then MonoidAlgebra.single (Multiplicative.ofAdd (standardWeight ⟨a.val,h⟩)) 1
    else MonoidAlgebra.single
      (Multiplicative.ofAdd (multiplierWeight g - standardWeight ⟨a.val - g, by sorry⟩)) 1

lemma torusRestriction_matrixEntry (a b : Fin (g + g)) :
    torusRestriction K g (matrixEntry K g a b) = torusMatrix K g a b := by sorry

lemma torusRestriction_multiplier :
    torusRestriction K g (multiplierCoordinate K g : coordinateHopfAlgebra K g) =
      MonoidAlgebra.single (Multiplicative.ofAdd (multiplierWeight g)) 1 := by sorry

def diagonalMatrix {A : Type v} [CommRing A] (g : ℕ) (s : Aˣ) (a : Fin g → Aˣ) :
    Matrix (Fin (g + g)) (Fin (g + g)) A :=
  Matrix.diagonal fun i => if h : i.val < g then a ⟨i.val,h⟩
    else (s * (a ⟨i.val - g, by sorry⟩)⁻¹ : Aˣ)

/-- Coordinate map of (a,c) ↦ ca; the second factor is the G_m coordinate Hopf algebra. -/
def centralCover (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)] :
    coordinateHopfAlgebra K g →ₐc[K]
      (TauCeti.Symplectic.coordinateHopfAlgebra K g ⊗[K]
        MonoidAlgebra K (Multiplicative ℤ)) := by sorry

lemma centralCover_entry (a b : Fin (g + g)) :
    centralCover K g (matrixEntry K g a b) =
      (TauCeti.Symplectic.coordinateMap K g).hom
        (TauCeti.GeneralLinear.genericMatrix K (g+g) a b) ⊗ₜ[K]
        MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℤ)) 1 := by sorry

lemma centralCover_point_lift [IsAlgClosed K]
    (h : Matrix.GeneralLinearGroup (Fin (g + g)) K)
    (s : Kˣ) (hs : (h : Matrix _ _ K) * TauCeti.JFin g K *
      (h : Matrix _ _ K).transpose = (s : K) • TauCeti.JFin g K) :
    ∃ (c : Kˣ) (a : Matrix.GeneralLinearGroup (Fin (g + g)) K),
      c ^ 2 = s ∧ (a : Matrix _ _ K) * TauCeti.JFin g K *
        (a : Matrix _ _ K).transpose = TauCeti.JFin g K ∧
      (h : Matrix _ _ K) = (c : K) • (a : Matrix _ _ K) := by sorry

lemma centralCover_weight_parity (a : Fin g → ℤ) (d : ℤ) :
    (∃ λ : Weight g, coverWeight g λ = (a,d)) ↔ Even (d - ∑ i, a i) := by sorry

/-! CG.1: reuse finite comodules and SplitK0, then construct rational models. -/

abbrev RatRep (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)] :=
  TauCeti.FGComoduleCat.{u,u,u} K (coordinateHopfAlgebra K g)

def weightSpace (M : RatRep K g) (λ : Weight g) : Submodule K M :=
  TauCeti.DiagonalizableGroup.weightSpace M
    (torusRestriction K g : coordinateHopfAlgebra K g →ₗc[K]
      MonoidAlgebra K (Multiplicative (Weight g))) (Multiplicative.ofAdd λ)

/-- RG1 supplier signature: size only, not a new category of representations. -/
instance ratRepEssentiallySmall : EssentiallySmall.{u} (RatRep K g) := by sorry

/-- RG1 supplier signature: compatibility of the existing tensor and additive structures. -/
instance ratRepMonoidalPreadditive : MonoidalPreadditive (RatRep K g) := by sorry

/-- RG1 supplier signature: the existing comodule Hom spaces are K-linear. -/
instance ratRepLinear : Linear K (RatRep K g) := by sorry

instance ratRepHomFinite (M N : RatRep K g) : Module.Finite K (M ⟶ N) := by sorry

abbrev repRing (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)] :=
  TauCeti.SplitK0 (RatRep K g)

def classOf (M : RatRep K g) : repRing K g := TauCeti.SplitK0.of M

lemma classOf_tensor (M N : RatRep K g) :
    classOf (M ⊗ N) = classOf M * classOf N := by sorry

def dimension (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)] :
    repRing K g →+* ℤ := by sorry

lemma dimension_classOf (M : RatRep K g) :
    dimension K g (classOf M) = (Module.finrank K M : ℤ) := by sorry

def standard (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)] :
    RatRep K g := by sorry

def standardCoordinates (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)] :
    standard K g ≃ₗ[K] (Fin (g + g) → K) := by sorry

def unitTensorCoordinates (M : RatRep K g) : (K ⊗[K] M) ≃ₗ[K] M := by sorry

lemma standard_finrank : Module.finrank K (standard K g) = g + g := by sorry

lemma standard_coaction (v : standard K g) :
    TensorProduct.map (standardCoordinates K g).toLinearMap LinearMap.id
      (TauCeti.Comodule.coact (R := K) (C := coordinateHopfAlgebra K g) v) =
        ∑ a : Fin (g + g), (Pi.single a (1 : K)) ⊗ₜ[K]
          (∑ b : Fin (g + g), standardCoordinates K g v b • matrixEntry K g a b) := by sorry

lemma standard_point_action (f : coordinateHopfAlgebra K g →ₐ[K] K)
    (v : standard K g) :
    standardCoordinates K g
      (unitTensorCoordinates (standard K g)
        (TauCeti.Comodule.endOfPoint (standard K g) f (1 ⊗ₜ[K] v))) =
      ((pointsEquiv K g K f).1 : Matrix _ _ K).mulVec (standardCoordinates K g v) := by sorry

/-- Exterior and symmetric tensor functors are imported CG1/RG1 interfaces. -/
def exteriorStandard (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] (k : ℕ) : RatRep K g := by sorry

def exteriorCoordinates (k : ℕ) :
    exteriorStandard K g k ≃ₗ[K] (⋀[K]^k (standard K g)) := by sorry

def tensorStandard (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] (d : ℕ) : RatRep K g := by sorry

lemma tensorStandard_zero : Nonempty (tensorStandard K g 0 ≅ 𝟙_ (RatRep K g)) := by sorry

lemma tensorStandard_succ (d : ℕ) :
    Nonempty (tensorStandard K g (d+1) ≅ tensorStandard K g d ⊗ standard K g) := by sorry

def multiplier (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] (m : ℤ) : RatRep K g := by sorry

def multiplierCoordinates (m : ℤ) : multiplier K g m ≃ₗ[K] K := by sorry

lemma multiplier_coaction (m : ℤ) (v : multiplier K g m) :
    TensorProduct.map (multiplierCoordinates m).toLinearMap LinearMap.id
      (TauCeti.Comodule.coact (R := K) (C := coordinateHopfAlgebra K g) v) =
        multiplierCoordinates m v ⊗ₜ[K]
          ((multiplierCoordinate K g) ^ m : (coordinateHopfAlgebra K g)ˣ) := by sorry

lemma multiplier_tensor (m n : ℤ) :
    Nonempty (multiplier K g m ⊗ multiplier K g n ≅ multiplier K g (m+n)) := by sorry

def multiplierClass (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : (repRing K g)ˣ := by sorry

lemma multiplierClass_coe :
    (multiplierClass K g : repRing K g) = classOf (multiplier K g 1) := by sorry

lemma multiplierClass_inv_coe :
    ((multiplierClass K g)⁻¹ : repRing K g) = classOf (multiplier K g (-1)) := by sorry

def contraction (k : ℕ) (h₂ : 2 ≤ k) (hg : k ≤ g) :
    exteriorStandard K g k ⟶ multiplier K g 1 ⊗ exteriorStandard K g (k-2) := by sorry

def primitive (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] (k : Fin (g+1)) : RatRep K g := by sorry

def primitiveInclusion (k : Fin (g+1)) :
    primitive K g k ⟶ exteriorStandard K g k.val := by sorry

lemma primitiveInclusion_kernel (k : Fin (g+1)) (h₂ : 2 ≤ k.val) :
    Function.Injective (primitiveInclusion (K := K) k) ∧
    ∀ v : exteriorStandard K g k.val,
      (∃ w, primitiveInclusion k w = v) ↔ contraction k.val h₂ (by sorry) v = 0 := by sorry

def alternatingForm : LinearMap.BilinForm K (standard K g) := by sorry

lemma alternatingForm_coordinates (v w : standard K g) :
    alternatingForm v w =
      ∑ a : Fin (g + g), ∑ b : Fin (g + g),
        standardCoordinates K g v a * TauCeti.JFin g K a b *
          standardCoordinates K g w b := by sorry

def wedgeTwo (v w : standard K g) : exteriorStandard K g 2 :=
  (exteriorCoordinates 2).symm (exteriorPower.ιMulti K 2 ![v,w])

def multiplierTwoTarget :
    multiplier K g 1 ⊗ exteriorStandard K g 0 ≃ₗ[K] K := by sorry

lemma contraction_pair (hg : 2 ≤ g) (v w : standard K g) :
    multiplierTwoTarget ((contraction 2 (by sorry) hg).hom (wedgeTwo v w)) =
      alternatingForm v w := by sorry

abbrev Simple (M : RatRep K g) :=
  IsSimpleOrder (TauCeti.Subcomodule K (coordinateHopfAlgebra K g) M)

abbrev IsSummand (M N : RatRep K g) :=
  ∃ (i : M ⟶ N) (p : N ⟶ M), i ≫ p = 𝟙 M

def fundamentalIndex {g : ℕ} (i : Fin g) : Fin (g+1) := ⟨i.val+1, by sorry⟩

def fundamentalWeight {g : ℕ} (i : Fin g) : DominantWeight g :=
  ⟨(0, fun j => if j.val ≤ i.val then 1 else 0), by sorry⟩

def zeroWeight (g : ℕ) : DominantWeight g := ⟨(0,0), by sorry⟩

def twistWeight {g : ℕ} (n : ℤ) (λ : DominantWeight g) : DominantWeight g :=
  ⟨(λ.val.1+n, λ.val.2), by sorry⟩

lemma primitiveExteriorDecomposition :
    (∀ (k : ℕ) (h₂ : 2 ≤ k) (hg : k ≤ g),
      Function.Surjective (contraction (K := K) k h₂ hg).hom ∧
      Nonempty (exteriorStandard K g k ≅
        primitive K g ⟨k,by sorry⟩ ⊞
          (multiplier K g 1 ⊗ exteriorStandard K g (k-2)))) ∧
    (∀ i : Fin g, Simple (primitive K g (fundamentalIndex i)) ∧
      Module.finrank K (primitive K g (fundamentalIndex i)) =
        Nat.choose (g+g) (i.val+1) - (if i.val+1 < 2 then 0 else Nat.choose (g+g) (i.val-1)) ∧
      Module.finrank K (weightSpace (primitive K g (fundamentalIndex i)) (fundamentalWeight i).val) = 1 ∧
      (∀ μ : Weight g, weightSpace (primitive K g (fundamentalIndex i)) μ ≠ ⊥ →
        RootLE μ (fundamentalWeight i).val) ∧
      IsSummand (primitive K g (fundamentalIndex i)) (tensorStandard K g (i.val+1))) ∧
    IsSummand (multiplier K g 1) (tensorStandard K g 2) := by sorry

def scalarExtend (F : Type v) [Field F] [CharZero F]
    (K : Type u) [Field K] [CharZero K] [Algebra F K] (g : ℕ) [Fact (0 < g)] :
    RatRep F g ⥤ RatRep K g := by sorry

def coordinateBaseChange (F : Type v) [Field F] [CharZero F]
    (K : Type u) [Field K] [CharZero K] [Algebra F K] (g : ℕ) [Fact (0 < g)] :
    coordinateHopfAlgebra K g ≃ₐc[K] (K ⊗[F] coordinateHopfAlgebra F g) := by sorry

def baseChange (K : Type u) [Field K] [CharZero K] (g : ℕ) [Fact (0 < g)] :
    RatRep ℚ g ⥤ RatRep K g := scalarExtend ℚ K g

instance baseChangeAdditive : (baseChange K g).Additive := by sorry

instance baseChangeMonoidal : (baseChange K g).Monoidal := by sorry

instance baseChangeBraided : (baseChange K g).Braided := by sorry

def baseChangeCoordinates (M : RatRep ℚ g) :
    (baseChange K g).obj M ≃ₗ[K] (K ⊗[ℚ] M) := by sorry

instance scalarExtendAdditive {F : Type v} [Field F] [CharZero F] [Algebra F K] :
    (scalarExtend F K g).Additive := by sorry

instance scalarExtendMonoidal {F : Type v} [Field F] [CharZero F] [Algebra F K] :
    (scalarExtend F K g).Monoidal := by sorry

instance scalarExtendBraided {F : Type v} [Field F] [CharZero F] [Algebra F K] :
    (scalarExtend F K g).Braided := by sorry

def homBaseChange {F : Type v} [Field F] [CharZero F] [Algebra F K]
    (M N : RatRep F g) :
    (K ⊗[F] (M ⟶ N)) →ₗ[K]
      ((scalarExtend F K g).obj M ⟶ (scalarExtend F K g).obj N) := by sorry

lemma homAndWeightBaseChange {F : Type v} [Field F] [CharZero F] [Algebra F K]
    (M N : RatRep F g) :
    Function.Bijective (homBaseChange (K := K) M N) ∧
    (∀ λ : Weight g,
      Nonempty ((K ⊗[F] weightSpace M λ) ≃ₗ[K]
        weightSpace ((scalarExtend F K g).obj M) λ)) ∧
    (Nonempty ((scalarExtend F K g).obj M ≅ (scalarExtend F K g).obj N) ↔ Nonempty (M ≅ N)) ∧
    (∀ f : M ⟶ N, (scalarExtend F K g).map f = 0 ↔ f = 0) := by sorry

def irreducible (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] (λ : DominantWeight g) : RatRep K g := by sorry

lemma irreducible_zero :
    Nonempty (irreducible K g (zeroWeight g) ≅ 𝟙_ (RatRep K g)) := by sorry

lemma irreducible_multiplier_twist (n : ℤ) (λ : DominantWeight g) :
    Nonempty (multiplier K g n ⊗ irreducible K g λ ≅
      irreducible K g (twistWeight n λ)) := by sorry

lemma rationalHighestWeightClassification :
    (∀ λ : DominantWeight g, Simple (irreducible K g λ) ∧
      Module.finrank K (weightSpace (irreducible K g λ) λ.val) = 1 ∧
      ∀ μ : Weight g, weightSpace (irreducible K g λ) μ ≠ ⊥ → RootLE μ λ.val) ∧
    (∀ M : RatRep K g, Simple M → ∃! λ : DominantWeight g,
      Nonempty (M ≅ irreducible K g λ)) ∧
    (∀ λ : DominantWeight g,
      Function.Bijective (fun a : K => a • (𝟙 (irreducible K g λ)))) ∧
    (∀ M : RatRep K g, ∃ (n : ℕ) (a : Fin n → DominantWeight g),
      Nonempty (M ≅ ⨁ fun i : Fin n => irreducible K g (a i))) ∧
    (∀ M N : RatRep K g, Nonempty (M ≅ N) ↔
      ∀ λ : DominantWeight g, Module.finrank K (M ⟶ irreducible K g λ) =
        Module.finrank K (N ⟶ irreducible K g λ)) := by sorry

def scalarExtensionRingEquiv (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : repRing ℚ g ≃+* repRing K g := by sorry

lemma scalarExtensionRingEquiv_classOf (M : RatRep ℚ g) :
    scalarExtensionRingEquiv K g (classOf M) = classOf ((baseChange K g).obj M) := by sorry

/-! CG.2: integral formal characters and the full invariant polynomial ring. -/

def formalCharacter (M : RatRep K g) : Laurent g := by sorry

lemma formalCharacter_coeff (M : RatRep K g) (λ : Weight g) :
    (formalCharacter M).coeff (Multiplicative.ofAdd λ) =
      (Module.finrank K (weightSpace M λ) : ℤ) := by sorry

def restrictionCharacter (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : repRing K g →+* invariantSubring g := by sorry

lemma restrictionCharacter_classOf (M : RatRep K g) :
    (restrictionCharacter K g (classOf M) : Laurent g) = formalCharacter M := by sorry

def evaluateLaurent {A : Type v} [CommRing A] (g : ℕ)
    (s : Aˣ) (a : Fin g → Aˣ) : Laurent g →+* A := by sorry

lemma evaluateLaurent_monomial {A : Type v} [CommRing A] (s : Aˣ)
    (a : Fin g → Aˣ) (λ : Weight g) :
    evaluateLaurent g s a (monomial λ) =
      ((s ^ λ.1 * ∏ i, a i ^ λ.2 i : Aˣ) : A) := by sorry

def torusPoint {A : Type v} [CommRing A] [Algebra K A] (s : Aˣ) (a : Fin g → Aˣ) :
    coordinateHopfAlgebra K g →ₐ[K] A := by sorry

lemma torusPoint_matrix {A : Type v} [CommRing A] [Algebra K A]
    (s : Aˣ) (a : Fin g → Aˣ) :
    ((pointsEquiv K g A (torusPoint s a)).1 : Matrix _ _ A) = diagonalMatrix g s a := by sorry

instance tensorScalarFree (M : RatRep K g) {A : Type v} [CommRing A] [Algebra K A] :
    Module.Free A (A ⊗[K] M) := by sorry

instance tensorScalarFinite (M : RatRep K g) {A : Type v} [CommRing A] [Algebra K A] :
    Module.Finite A (A ⊗[K] M) := by sorry

lemma formalCharacter_evaluate (M : RatRep K g) {A : Type v}
    [CommRing A] [Algebra K A] (s : Aˣ) (a : Fin g → Aˣ) :
    evaluateLaurent g s a (formalCharacter M) =
      LinearMap.trace A (A ⊗[K] M) (TauCeti.Comodule.endOfPoint M (torusPoint s a)) := by sorry

lemma characterInjective : Function.Injective (restrictionCharacter K g) := by sorry

def exteriorCharacter (g : ℕ) (k : ℤ) : Laurent g := by sorry

def fundamentalCharacter {g : ℕ} (i : Fin g) : Laurent g :=
  exteriorCharacter g (i.val+1) - t g * exteriorCharacter g ((i.val+1 : ℤ)-2)

def pairSum {g : ℕ} (i : Fin g) : Laurent g := z i + pairedZ i

lemma exteriorCharacter_generating (k : ℕ) :
    (∏ i : Fin g, (1 + Polynomial.C (pairSum i) * Polynomial.X +
      Polynomial.C (t g) * Polynomial.X ^ 2)).coeff k = exteriorCharacter g (k : ℤ) := by sorry

lemma fundamentalCharacter_invariant (i : Fin g) :
    fundamentalCharacter i ∈ invariantSubring g := by sorry

abbrev MultLaurent := MonoidAlgebra ℤ (Multiplicative ℤ)

def coeffT : MultLaurent := MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℤ)) 1

def coeffTInv : MultLaurent := MonoidAlgebra.single (Multiplicative.ofAdd (-1 : ℤ)) 1

def coefficientIntoInvariant (g : ℕ) : MultLaurent →+* invariantSubring g := by sorry

instance invariantCoeffAlgebra (g : ℕ) : Algebra MultLaurent (invariantSubring g) :=
  (coefficientIntoInvariant g).toAlgebra

def fullInvariantEquiv (g : ℕ) :
    MvPolynomial (Fin g) MultLaurent ≃ₐ[MultLaurent] invariantSubring g := by sorry

lemma fullInvariantEquiv_variable (i : Fin g) :
    (fullInvariantEquiv g (MvPolynomial.X i) : Laurent g) = fundamentalCharacter i := by sorry

lemma fullInvariantEquiv_multiplier :
    (fullInvariantEquiv g (MvPolynomial.C coeffT) : Laurent g) = t g ∧
    (fullInvariantEquiv g (MvPolynomial.C coeffTInv) : Laurent g) = tInv g := by sorry

lemma primitiveCharacterIdentity :
    (∀ i : Fin g, formalCharacter (primitive K g (fundamentalIndex i)) = fundamentalCharacter i) ∧
    formalCharacter (multiplier K g 1) = t g ∧
    formalCharacter (exteriorStandard K g (g+g)) = t g ^ g := by sorry

def rationalCharacterEquiv (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : repRing K g ≃+* invariantSubring g := by sorry

lemma rationalCharacterEquiv_classOf (M : RatRep K g) :
    (rationalCharacterEquiv K g (classOf M) : Laurent g) = formalCharacter M := by sorry

def fundamentalInvariant (i : Fin g) : invariantSubring g :=
  ⟨fundamentalCharacter i, fundamentalCharacter_invariant i⟩

def multiplierInvariant (g : ℕ) : invariantSubring g := ⟨t g,by sorry⟩

def inverseMultiplierInvariant (g : ℕ) : invariantSubring g := ⟨tInv g,by sorry⟩

lemma rationalCharacterEquiv_fundamental :
    (∀ i : Fin g, (rationalCharacterEquiv K g).symm (fundamentalInvariant i) =
      classOf (primitive K g (fundamentalIndex i))) ∧
    (rationalCharacterEquiv K g).symm (multiplierInvariant g) =
      classOf (multiplier K g 1) := by sorry

/-! CG.3: an elementary exponent cone, integral invariants, and tensor constituents. -/

def positiveSubring (g : ℕ) : Subring (Laurent g) :=
  Subring.closure (Set.range (z (g := g)) ∪ Set.range (pairedZ (g := g)))

def positiveInvariantSubring (g : ℕ) : Subring (Laurent g) :=
  positiveSubring g ⊓ invariantSubring g

def coneValue {g : ℕ} (λ : Weight g) : ℤ := λ.1 + ∑ i, min (λ.2 i) 0

lemma mem_positiveSubring [Fact (0 < g)] (f : Laurent g) :
    f ∈ positiveSubring g ↔
      ∀ λ : Weight g, f.coeff (Multiplicative.ofAdd λ) ≠ 0 → 0 ≤ coneValue λ := by sorry

lemma positiveSubring_weyl_stable (f : Laurent g) (hf : f ∈ positiveSubring g) :
    (∀ σ : Equiv.Perm (Fin g), permLaurent σ f ∈ positiveSubring g) ∧
    (∀ i : Fin g, flipLaurent i f ∈ positiveSubring g) := by sorry

def positiveInvariantEquiv (g : ℕ) [Fact (0 < g)] :
    MvPolynomial (Option (Fin g)) ℤ ≃ₐ[ℤ] positiveInvariantSubring g := by sorry

lemma positiveInvariantEquiv_multiplier :
    (positiveInvariantEquiv g (MvPolynomial.X none) : Laurent g) = t g := by sorry

lemma positiveInvariantEquiv_variable (i : Fin g) :
    (positiveInvariantEquiv g (MvPolynomial.X (some i)) : Laurent g) =
      fundamentalCharacter i := by sorry

def TensorConstituent (M : RatRep K g) : Prop :=
  Simple M ∧ ∃ d : ℕ, IsSummand M (tensorStandard K g d)

def tensorConstituentSubring (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : Subring (repRing K g) :=
  Subring.closure {r | ∃ M : RatRep K g, TensorConstituent M ∧ r = classOf M}

lemma mem_tensorConstituentSubring (r : repRing K g) :
    r ∈ tensorConstituentSubring K g ↔
      r ∈ Submodule.span ℤ {r | ∃ M : RatRep K g, TensorConstituent M ∧ r = classOf M} := by sorry

lemma tensorConstituentSubring_tensor (M N S : RatRep K g)
    (hM : TensorConstituent M) (hN : TensorConstituent N)
    (hS : Simple S) (hMN : IsSummand S (M ⊗ N)) : TensorConstituent S := by sorry

lemma tensorConstituentCriterion (λ : DominantWeight g) (d : ℕ) :
    IsSummand (irreducible K g λ) (tensorStandard K g d) ↔
      0 ≤ λ.val.1 ∧ (d : ℤ) = centralDegree g λ.val := by sorry

def tensorMultiplier (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : tensorConstituentSubring K g :=
  ⟨classOf (multiplier K g 1),by sorry⟩

def tensorPrimitive (i : Fin g) : tensorConstituentSubring K g :=
  ⟨classOf (primitive K g (fundamentalIndex i)),by sorry⟩

def positiveMultiplier (g : ℕ) [Fact (0 < g)] : positiveInvariantSubring g :=
  ⟨t g,by sorry⟩

def positiveFundamental (i : Fin g) : positiveInvariantSubring g :=
  ⟨fundamentalCharacter i,by sorry⟩

def tensorCharacterEquiv (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] :
    tensorConstituentSubring K g ≃+* positiveInvariantSubring g := by sorry

lemma tensorCharacterEquiv_coe (r : tensorConstituentSubring K g) :
    (tensorCharacterEquiv K g r : Laurent g) =
      (rationalCharacterEquiv K g (r : repRing K g) : Laurent g) := by sorry

lemma tensorCharacterEquiv_generators :
    tensorCharacterEquiv K g (tensorMultiplier K g) = positiveMultiplier g ∧
    ∀ i : Fin g, tensorCharacterEquiv K g (tensorPrimitive i) = positiveFundamental i := by sorry

def tensorGenerator {g : ℕ} [Fact (0 < g)] (K : Type u) [Field K] [CharZero K]
    (o : Option (Fin g)) : repRing K g :=
  match o with
  | none => classOf (multiplier K g 1)
  | some i => classOf (primitive K g (fundamentalIndex i))

def exteriorClass (k : ℤ) : repRing K g :=
  if k < 0 then 0 else classOf (exteriorStandard K g k.toNat)

lemma integralTensorGeneration :
    tensorConstituentSubring K g = Subring.closure (Set.range (tensorGenerator K)) ∧
    (∀ i : Fin g, classOf (primitive K g (fundamentalIndex i)) =
      exteriorClass (K := K) (g := g) (i.val+1) -
        classOf (multiplier K g 1) * exteriorClass (K := K) (g := g) ((i.val+1 : ℤ)-2)) ∧
    Function.Injective (MvPolynomial.aeval (tensorGenerator (g := g) K)) ∧
    (∀ r : repRing K g, ∃ n : ℕ,
      (multiplierClass K g : repRing K g) ^ n * r ∈ tensorConstituentSubring K g) ∧
    ∃ e : MvPolynomial (Fin g) MultLaurent ≃+* repRing K g,
      (∀ i : Fin g, e (MvPolynomial.X i) = classOf (primitive K g (fundamentalIndex i))) ∧
      e (MvPolynomial.C coeffT) = classOf (multiplier K g 1) ∧
      e (MvPolynomial.C coeffTInv) = classOf (multiplier K g (-1)) := by sorry

/-! Named unit tests. The comment on each example is its packet test name. -/

def scalarPoint (c : Kˣ) : coordinateHopfAlgebra K g →ₐ[K] K := by sorry

lemma scalarPoint_matrix (c : Kˣ) :
    ((pointsEquiv K g K (scalarPoint (g := g) c)).1 : Matrix _ _ K) =
      (c : K) • (1 : Matrix (Fin (g+g)) (Fin (g+g)) K) := by sorry

def multiplierOneIdeal (K : Type u) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] : TauCeti.HopfIdeal K (coordinateHopfAlgebra K g) := by sorry

lemma multiplierOneIdeal_toIdeal :
    (multiplierOneIdeal K g).toIdeal =
      Ideal.span {((multiplierCoordinate K g : coordinateHopfAlgebra K g) - 1)} := by sorry

-- TauCeti.GSpCharacter.coordinate.test_rank_one
example (p : coordinateHopfAlgebra ℚ 1 →ₐ[ℚ] ℚ) :
    p (multiplierCoordinate ℚ 1 : coordinateHopfAlgebra ℚ 1) =
      Matrix.det ((pointsEquiv ℚ 1 ℚ p).1 : Matrix _ _ ℚ) := by sorry

-- TauCeti.GSpCharacter.coordinate.test_multiplier_one
example : Nonempty (TauCeti.CommHopfAlgCat.quotient (coordinateHopfAlgebra ℚ g)
    (multiplierOneIdeal ℚ g) ≅ TauCeti.Symplectic.coordinateHopfAlgebra ℚ g) := by sorry

-- TauCeti.GSpCharacter.coordinate.test_scalar
example : scalarPoint (g := g) (Units.mk0 (2 : ℚ) (by sorry))
    (multiplierCoordinate ℚ g : coordinateHopfAlgebra ℚ g) = 4 := by sorry

-- TauCeti.GSpCharacter.weight.test_multiplier_degree
example (i : Fin g) : centralDegree g (multiplierWeight g) = 2 ∧
    centralDegree g (standardWeight i) = 1 := by sorry

-- TauCeti.GSpCharacter.weight.test_negative_twist
example : (twistWeight (-1) (zeroWeight g)).val = (-1,0) ∧
    centralDegree g (twistWeight (-1) (zeroWeight g)).val = -2 := by sorry

-- TauCeti.GSpCharacter.weight.test_parity
example [Fact (0 < g)] : ¬ ∃ λ : Weight g,
    coverWeight g λ = ((fundamentalWeight (⟨0,by sorry⟩ : Fin g)).val.2,0) := by sorry

-- TauCeti.GSpCharacter.torus.test_rank_one
example : diagonalMatrix 1 (Units.mk0 (6 : ℚ) (by sorry))
    (fun _ => Units.mk0 (2 : ℚ) (by sorry)) = Matrix.diagonal ![(2 : ℚ),3] ∧
    Matrix.det (diagonalMatrix 1 (Units.mk0 (6 : ℚ) (by sorry))
      (fun _ => Units.mk0 (2 : ℚ) (by sorry))) = 6 := by sorry

-- TauCeti.GSpCharacter.torus.test_symplectic_fibre
example (a : Fin g → ℚˣ) : diagonalMatrix g 1 a =
    (((TauCeti.GLSymplecticFin.diagonal a : TauCeti.GLSymplecticFin g ℚ) :
      Matrix.GeneralLinearGroup (Fin (g+g)) ℚ) : Matrix _ _ ℚ) := by sorry

-- TauCeti.GSpCharacter.torus.test_scalar
example (c : ℚˣ) : diagonalMatrix g (c^2) (fun _ => c) =
    (c : ℚ) • (1 : Matrix (Fin (g+g)) (Fin (g+g)) ℚ) := by sorry

-- TauCeti.GSpCharacter.weyl.test_reciprocal
example (i : Fin g) : flipLaurent i (z i) = pairedZ i ∧
    flipLaurent i (pairedZ i) = z i := by sorry

-- TauCeti.GSpCharacter.weyl.test_multiplier
example (σ : Equiv.Perm (Fin g)) (i : Fin g) (n : ℤ) :
    permLaurent σ (t g) = t g ∧ flipLaurent i (t g) = t g ∧
    permLaurent σ 1 = 1 ∧ flipLaurent i 1 = 1 ∧
    permLaurent σ (n : Laurent g) = n ∧ flipLaurent i (n : Laurent g) = n := by sorry

-- TauCeti.GSpCharacter.weyl.test_standard_character
example : (∑ i : Fin g, pairSum i) ∈ invariantSubring g := by sorry

-- TauCeti.GSpCharacter.weyl.test_wrong_inversion
example : monomial (-standardWeight (0 : Fin 1)) + t 1 * z (0 : Fin 1) ≠
    pairSum (0 : Fin 1) := by sorry

-- TauCeti.GSpCharacter.ring.test_unit
example : classOf (𝟙_ (RatRep ℚ g)) = 1 ∧ dimension ℚ g 1 = 1 := by sorry

-- TauCeti.GSpCharacter.ring.test_zero
example : classOf (0 : RatRep ℚ g) = 0 ∧ dimension ℚ g 0 = 0 := by sorry

-- TauCeti.GSpCharacter.ring.test_biproduct
example (M N : RatRep ℚ g) : classOf (M ⊞ N) = classOf M + classOf N := by sorry

-- TauCeti.GSpCharacter.standard.test_rank_one
example (v : standard ℚ 1) :
    TensorProduct.map (standardCoordinates ℚ 1).toLinearMap
      (coordinateHopfAlgebra_rank_one ℚ).hom.hom.toLinearMap
      (TauCeti.Comodule.coact (R := ℚ) (C := coordinateHopfAlgebra ℚ 1) v) =
        TauCeti.GeneralLinear.standardCoact ℚ 2 (standardCoordinates ℚ 1 v) := by sorry

-- TauCeti.GSpCharacter.standard.test_exterior_zero
example : Nonempty (exteriorStandard ℚ g 0 ≅ 𝟙_ (RatRep ℚ g)) ∧
    Nonempty (exteriorStandard ℚ g (g+g+1) ≅ (0 : RatRep ℚ g)) := by sorry

-- TauCeti.GSpCharacter.standard.test_torus_weights
example : formalCharacter (standard ℚ 1) = pairSum (0 : Fin 1) ∧
    centralDegree 1 (standardWeight (0 : Fin 1)) = 1 ∧
    centralDegree 1 (multiplierWeight 1 - standardWeight (0 : Fin 1)) = 1 := by sorry

-- TauCeti.GSpCharacter.multiplier.test_zero
example : Nonempty (multiplier ℚ g 0 ≅ 𝟙_ (RatRep ℚ g)) := by sorry

-- TauCeti.GSpCharacter.multiplier.test_rank_one
example : Nonempty (multiplier ℚ 1 1 ≅ exteriorStandard ℚ 1 2) := by sorry

-- TauCeti.GSpCharacter.multiplier.test_negative
example : formalCharacter (multiplier ℚ g (-1)) = tInv g ∧
    ¬ ∃ d : ℕ, IsSummand (multiplier ℚ g (-1)) (tensorStandard ℚ g d) := by sorry

-- TauCeti.GSpCharacter.primitive.test_zero
example : Nonempty (primitive ℚ g ⟨0,by sorry⟩ ≅ 𝟙_ (RatRep ℚ g)) ∧
    Nonempty (primitive ℚ g ⟨1,by sorry⟩ ≅ standard ℚ g) := by sorry

-- TauCeti.GSpCharacter.primitive.test_rank_two
example : Module.finrank ℚ (primitive ℚ 2 ⟨2,by sorry⟩) = 5 := by sorry

-- TauCeti.GSpCharacter.primitive.test_twist
example (hg : 2 ≤ g) (v w : standard ℚ g) (a : multiplier ℚ g 1) :
    contraction 2 (by sorry) hg (wedgeTwo ((2 : ℚ) • v) ((2 : ℚ) • w)) =
      (4 : ℚ) • contraction 2 (by sorry) hg (wedgeTwo v w) ∧
    unitTensorCoordinates (multiplier ℚ g 1)
      (TauCeti.Comodule.endOfPoint (multiplier ℚ g 1)
        (scalarPoint (Units.mk0 (2 : ℚ) (by sorry))) (1 ⊗ₜ[ℚ] a)) = (4 : ℚ) • a := by sorry

-- TauCeti.GSpCharacter.irreducible.test_standard
example : Nonempty (irreducible ℚ g (fundamentalWeight (⟨0,by sorry⟩ : Fin g)) ≅ standard ℚ g) := by sorry

-- TauCeti.GSpCharacter.irreducible.test_multiplier_inverse
example : Nonempty (irreducible ℚ g (twistWeight (-1) (zeroWeight g)) ≅ multiplier ℚ g (-1)) := by sorry

/-- CG1/RG1 imported symmetric-power comodule, used for the GL₂ comparison only. -/
def symmetricStandard (K : Type) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] (d : ℕ) : RatRep K g := by sorry

def symmetricCoordinates (K : Type) [Field K] [CharZero K]
    (g : ℕ) [Fact (0 < g)] (d : ℕ) :
    symmetricStandard K g d ≃ₗ[K] (Sym[K]^d (standard K g)) := by sorry

-- TauCeti.GSpCharacter.irreducible.test_rank_one
example (m : ℤ) (d : ℕ) : Nonempty (
    irreducible ℚ 1 ⟨(m,fun _ => (d : ℤ)),by sorry⟩ ≅
      multiplier ℚ 1 m ⊗ symmetricStandard ℚ 1 d) := by sorry

-- TauCeti.GSpCharacter.baseChange.test_identity
example : scalarExtensionRingEquiv ℚ g = RingEquiv.refl (repRing ℚ g) := by sorry

-- TauCeti.GSpCharacter.baseChange.test_standard
example : scalarExtensionRingEquiv K g (classOf (standard ℚ g)) = classOf (standard K g) ∧
    scalarExtensionRingEquiv K g (classOf (multiplier ℚ g 1)) = classOf (multiplier K g 1) := by sorry

-- TauCeti.GSpCharacter.baseChange.test_simple
example (λ : DominantWeight g) : scalarExtensionRingEquiv K g (classOf (irreducible ℚ g λ)) =
    classOf (irreducible K g λ) := by sorry

-- TauCeti.GSpCharacter.character.test_unit
example : formalCharacter (𝟙_ (RatRep ℚ g)) = 1 ∧
    formalCharacter (0 : RatRep ℚ g) = 0 := by sorry

-- TauCeti.GSpCharacter.character.test_standard
example : formalCharacter (standard ℚ g) = ∑ i : Fin g, pairSum i := by sorry

-- TauCeti.GSpCharacter.character.test_multiplier_inverse
example : formalCharacter (multiplier ℚ g (-1)) = tInv g ∧
    (formalCharacter (multiplier ℚ g (-1))).coeff
      (Multiplicative.ofAdd (-multiplierWeight g)) = 1 := by sorry

-- TauCeti.GSpCharacter.character.test_dimension
example (M : RatRep ℚ g) : evaluateLaurent g (1 : ℚˣ) (fun _ => 1) (formalCharacter M) =
    (Module.finrank ℚ M : ℚ) := by sorry

-- TauCeti.GSpCharacter.exterior.test_negative
example : exteriorCharacter g (-1) = 0 ∧ exteriorCharacter g 0 = 1 := by sorry

-- TauCeti.GSpCharacter.exterior.test_first
example [Fact (0 < g)] : fundamentalCharacter (⟨0,by sorry⟩ : Fin g) = exteriorCharacter g 1 ∧
    exteriorCharacter g 1 = ∑ i : Fin g, pairSum i := by sorry

-- TauCeti.GSpCharacter.exterior.test_rank_two
example : exteriorCharacter 2 2 = pairSum (0 : Fin 2) * pairSum (1 : Fin 2) + 2 * t 2 ∧
    fundamentalCharacter (1 : Fin 2) = pairSum (0 : Fin 2) * pairSum (1 : Fin 2) + t 2 := by sorry

-- TauCeti.GSpCharacter.exterior.test_top
example : exteriorCharacter g (g+g) = t g ^ g := by sorry

-- TauCeti.GSpCharacter.fullInvariant.test_rank_one
example : (fullInvariantEquiv 1 (MvPolynomial.X (0 : Fin 1)) : Laurent 1) =
    pairSum (0 : Fin 1) := by sorry

-- TauCeti.GSpCharacter.fullInvariant.test_rank_two
example : (fullInvariantEquiv 2 (MvPolynomial.X (1 : Fin 2) - MvPolynomial.C coeffT) : Laurent 2) =
    pairSum (0 : Fin 2) * pairSum (1 : Fin 2) := by sorry

-- TauCeti.GSpCharacter.fullInvariant.test_integral
example (f : invariantSubring g) : ∃! p : MvPolynomial (Fin g) MultLaurent,
    fullInvariantEquiv g p = f := by sorry

-- TauCeti.GSpCharacter.characterEquiv.test_rank_one
example : (rationalCharacterEquiv ℚ 1 (classOf (standard ℚ 1)) : Laurent 1) = pairSum (0 : Fin 1) ∧
    (rationalCharacterEquiv ℚ 1 (classOf (multiplier ℚ 1 1)) : Laurent 1) = t 1 ∧
    (rationalCharacterEquiv ℚ 1 (classOf (multiplier ℚ 1 (-1))) : Laurent 1) = tInv 1 := by sorry

-- TauCeti.GSpCharacter.characterEquiv.test_unit
example : rationalCharacterEquiv ℚ g 1 = 1 ∧ (rationalCharacterEquiv ℚ g).symm 1 = 1 := by sorry

-- TauCeti.GSpCharacter.characterEquiv.test_inverse_multiplier
example : (rationalCharacterEquiv ℚ g).symm (inverseMultiplierInvariant g) =
    classOf (multiplier ℚ g (-1)) := by sorry

-- TauCeti.GSpCharacter.positive.test_multiplier
example [Fact (0 < g)] : t g ∈ positiveSubring g := by sorry

-- TauCeti.GSpCharacter.positive.test_inverse_multiplier
example : tInv g ∉ positiveSubring g ∧ coneValue (-multiplierWeight g) = -1 := by sorry

-- TauCeti.GSpCharacter.positive.test_signed_coefficients
example (i : Fin g) : -(pairSum i) ∈ positiveInvariantSubring g := by sorry

-- TauCeti.GSpCharacter.positive.test_boundary
example (i : Fin g) : pairedZ i ∈ positiveSubring g ∧
    coneValue (multiplierWeight g - standardWeight i) = 0 := by sorry

-- TauCeti.GSpCharacter.positiveInvariant.test_rank_one
example : (positiveInvariantEquiv 1 (MvPolynomial.X none) : Laurent 1) = t 1 ∧
    (positiveInvariantEquiv 1 (MvPolynomial.X (some (0 : Fin 1))) : Laurent 1) = pairSum (0 : Fin 1) := by sorry

-- TauCeti.GSpCharacter.positiveInvariant.test_inverse_excluded
example : ¬ ∃ p : MvPolynomial (Option (Fin g)) ℤ,
    (positiveInvariantEquiv g p : Laurent g) = tInv g := by sorry

-- TauCeti.GSpCharacter.positiveInvariant.test_constant
example : positiveInvariantEquiv g (1 : MvPolynomial (Option (Fin g)) ℤ) = 1 := by sorry

-- TauCeti.GSpCharacter.tensorSubring.test_degree_zero
example : TensorConstituent (𝟙_ (RatRep ℚ g)) ∧
    IsSummand (𝟙_ (RatRep ℚ g)) (tensorStandard ℚ g 0) ∧
    classOf (𝟙_ (RatRep ℚ g)) = 1 := by sorry

-- TauCeti.GSpCharacter.tensorSubring.test_rank_one_multiplier
example : IsSummand (multiplier ℚ 1 1) (tensorStandard ℚ 1 2) ∧
    classOf (multiplier ℚ 1 1) ∈ tensorConstituentSubring ℚ 1 := by sorry

-- TauCeti.GSpCharacter.tensorSubring.test_standard_only
example : classOf (multiplier ℚ 1 1) ∉
    Subring.closure {classOf (standard ℚ 1)} := by sorry

-- TauCeti.GSpCharacter.tensorCharacter.test_rank_one
example : tensorConstituentSubring ℚ 1 =
    Subring.closure {classOf (multiplier ℚ 1 1),classOf (standard ℚ 1)} ∧
    tensorCharacterEquiv ℚ 1 (tensorMultiplier ℚ 1) = positiveMultiplier 1 ∧
    tensorCharacterEquiv ℚ 1 (tensorPrimitive (K := ℚ) (0 : Fin 1)) = positiveFundamental (0 : Fin 1) := by sorry

-- TauCeti.GSpCharacter.tensorCharacter.test_inverse_multiplier
example : classOf (multiplier ℚ g (-1)) ∉ tensorConstituentSubring ℚ g := by sorry

-- TauCeti.GSpCharacter.tensorCharacter.test_boundary
example : tensorCharacterEquiv ℚ g 1 = 1 ∧ coneValue (0 : Weight g) = 0 := by sorry

end TauCeti.GSpCharacter
