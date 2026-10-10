/-
# Arithmetic locally symmetric spaces: suggested forms

This file is not the roadmap and is not exhaustive. README.md is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. Proofs and construction obligations use `sorry`.

The quotient adapters below use existing library types. `Datum` packages only
quotient inputs; arithmetic reductivity, neatness and properness require the
specific structures described in README.md. An adapter covers only its stated
algebraic or topological part. The final catalogue identifies conditions whose
supplier interfaces cannot yet be expressed here; its comments are mathematical
specifications, not declarations or executable examples.
-/

import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.ConstMulAction
import Mathlib.Topology.Homotopy.Contractible
import Mathlib.Analysis.Complex.UpperHalfPlane.Topology
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RepresentationTheory.Rep.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Ideal.Maximal
import TauCeti.NumberTheory.HeckeRing.Associativity
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.AlgebraicTopology.UniversalCover.Classification.MonodromyEquivalence
import TauCeti.AlgebraicTopology.Singular.Relative


open CategoryTheory CategoryTheory.Limits
open scoped Pointwise Matrix

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

universe u v w
noncomputable section
namespace TauCeti.LocallySymmetric

/-! ## ALS.0: topological quotient adapters -/

section SymmetricSpace
variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- Adapter: the quotient by the actual split-centre-corrected subgroup KA.
The arithmetic construction of KA and the smooth structure are in the catalogue. -/
abbrev symmetricSpace (KA : Subgroup G) : Type u := G ⧸ KA

variable {G}

def symmetricSpace.basepoint (KA : Subgroup G) : symmetricSpace G KA :=
  QuotientGroup.mk 1

theorem symmetricSpace.basepoint_stabilizer (KA : Subgroup G) :
    MulAction.stabilizer G (symmetricSpace.basepoint KA) = KA := by sorry

theorem symmetricSpace.stabilizer_eq (KA : Subgroup G) (g : G) :
    MulAction.stabilizer G (g • symmetricSpace.basepoint KA) =
      KA.map (MulAut.conj g).toMonoidHom := by sorry

/-- Adapter: topological part of the conjugate-Cartan comparison. -/
def symmetricSpace.isoOfCartan (KA : Subgroup G) (h : G) :
    symmetricSpace G KA ≃ₜ symmetricSpace G (KA.map (MulAut.conj h).toMonoidHom) := by sorry

theorem symmetricSpace.isoOfCartan_mk (KA : Subgroup G) (h g : G) :
    symmetricSpace.isoOfCartan KA h (QuotientGroup.mk g) =
      QuotientGroup.mk (g * h⁻¹) := by sorry

/-- Adapter: product homeomorphism, before the smooth comparison. -/
def symmetricSpace.prod {H : Type u} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] (KA : Subgroup G) (LA : Subgroup H) :
    symmetricSpace (G × H) (KA.prod LA) ≃ₜ
      symmetricSpace G KA × symmetricSpace H LA := by sorry

/-- Adapter: the quotient map, without identifying KA0 with K∞°A∞. -/
def symmetricSpace.connectedVariant (KA0 KA : Subgroup G) (h : KA0 ≤ KA) :
    C(symmetricSpace G KA0, symmetricSpace G KA) := by sorry

/-- Genuine quotient test: the split-centre correction makes GL₁/ℚ a point.
Every nonzero real scalar is a sign times a positive scalar, so KA = G. -/
-- adapter-test: symmetricSpace_GL1 (r₁=1, r₂=0 specialization; full test in catalogue)
example : Subsingleton (symmetricSpace ℝˣ ⊤) := by sorry

/-- The exact GL₂ stabilizer of i, including positive real scalars. -/
def orthogonalTimesScalars : Subgroup (GL (Fin 2) ℝ) where
  carrier := {g | ∃ c : ℝ, 0 < c ∧
    (g : Matrix (Fin 2) (Fin 2) ℝ).transpose *
      (g : Matrix (Fin 2) (Fin 2) ℝ) = c • 1}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- Full topological GL₂/ℚ quotient, with the negative-determinant action to be
compared to the smooth arithmetic symmetric-space construction. -/
def glTwoUpperHalfPlane :
    symmetricSpace (GL (Fin 2) ℝ) orthogonalTimesScalars ≃ₜ UpperHalfPlane := by sorry

end SymmetricSpace

/-- Inputs for the double quotient only. All fields are mathematical data or
existing structures, with no replacement for a missing arithmetic predicate. -/
structure Datum where
  GF : Type u
  Gf : Type u
  Ginf : Type u
  Xinf : Type u
  [groupGF : Group GF]
  [groupGf : Group Gf]
  [topGf : TopologicalSpace Gf]
  [topGroupGf : IsTopologicalGroup Gf]
  [groupGinf : Group Ginf]
  [topXinf : TopologicalSpace Xinf]
  [actionXinf : MulAction Ginf Xinf]
  [continuousActionXinf : ContinuousConstSMul Ginf Xinf]
  toFinite : GF →* Gf
  toInf : GF →* Ginf

attribute [instance] Datum.groupGF Datum.groupGf Datum.topGf Datum.topGroupGf
  Datum.groupGinf Datum.topXinf Datum.actionXinf Datum.continuousActionXinf

section DoubleQuotient
variable (D : Datum.{u})

def quotientRelation (K : Subgroup D.Gf) : Setoid (D.Xinf × (D.Gf ⧸ K)) where
  r a b := ∃ γ : D.GF, b = (D.toInf γ • a.1, D.toFinite γ • a.2)
  iseqv := by sorry

-- signature: LocallySymmetric.X
/-- The arithmetic double quotient, when the supplier's arithmetic datum is
inserted. The inherited topology is the quotient topology. -/
def X (K : Subgroup D.Gf) : Type u := Quotient (quotientRelation D K)

instance (K : Subgroup D.Gf) : TopologicalSpace (X D K) :=
  inferInstanceAs (TopologicalSpace (Quotient (quotientRelation D K)))

variable {D}

-- signature: LocallySymmetric.X.mk
def X.mk (K : Subgroup D.Gf) (x : D.Xinf) (g : D.Gf) : X D K :=
  Quotient.mk _ (x, (g : D.Gf ⧸ K))

-- signature: LocallySymmetric.X.mk_eq_mk_iff
theorem X.mk_eq_mk_iff (K : Subgroup D.Gf) (x x' : D.Xinf) (g g' : D.Gf) :
    X.mk K x g = X.mk K x' g' ↔
      ∃ γ : D.GF, ∃ k ∈ K, x' = D.toInf γ • x ∧ g' = D.toFinite γ * g * k := by sorry

-- signature: LocallySymmetric.X.translate
def X.translate (K : Subgroup D.Gf) (g : D.Gf) :
    X D (K.map (MulAut.conj g).toMonoidHom) ≃ₜ X D K := by sorry

theorem X.translate_mk (K : Subgroup D.Gf) (g h : D.Gf) (x : D.Xinf) :
    X.translate K g (X.mk _ x h) = X.mk K x (h * g) := by sorry

-- signature: LocallySymmetric.X.levelMap
def X.levelMap {K' K : Subgroup D.Gf} (h : K' ≤ K) : C(X D K', X D K) := by sorry

theorem X.levelMap_mk {K' K : Subgroup D.Gf} (h : K' ≤ K) (x : D.Xinf) (g : D.Gf) :
    X.levelMap h (X.mk K' x g) = X.mk K x g := by sorry

theorem X.levelMap_self (K : Subgroup D.Gf) :
    X.levelMap (D := D) (le_refl K) = ContinuousMap.id _ := by sorry

theorem X.levelMap_comp {K'' K' K : Subgroup D.Gf} (h₁ : K'' ≤ K') (h₂ : K' ≤ K) :
    (X.levelMap (D := D) h₂).comp (X.levelMap h₁) = X.levelMap (h₁.trans h₂) := by sorry

/-- A full arithmetic instance is supplied by AA; this generic object only
computes the subgroup that occurs in the component decomposition. -/
def arithmeticSubgroup (K : Subgroup D.Gf) (g : D.Gf) : Subgroup D.GF :=
  (K.map (MulAut.conj g).toMonoidHom).comap D.toFinite

/-- A substantive degenerate test: both input spaces are points. -/
-- test: X_trivialGroup
example (K : Subgroup D.Gf) [Subsingleton D.Gf] [Subsingleton D.Xinf]
    [Nonempty D.Xinf] :
    Nonempty (X D K ≃ₜ PUnit) := by sorry

/-- Genuine quotient topology counterexample: the rational and finite groups
are trivial while the action space is ℝ. No arithmetic properness follows. -/
def pointGroupsRealSpace : Datum.{0} where
  GF := PUnit
  Gf := PUnit
  Ginf := PUnit
  Xinf := ℝ
  groupGF := by infer_instance
  groupGf := by infer_instance
  topGf := ⊥
  topGroupGf := by infer_instance
  groupGinf := by infer_instance
  topXinf := inferInstance
  actionXinf := { smul := fun _ x => x, one_smul := by sorry, mul_smul := by sorry }
  continuousActionXinf := by sorry
  toFinite := MonoidHom.id _
  toInf := MonoidHom.id _

example : Nonempty (X pointGroupsRealSpace ⊤ ≃ₜ ℝ) := by sorry

end DoubleQuotient

/-! ## ALS.0: actual matrix congruence-preimages -/
namespace MatrixLevel
variable {R : Type u} [CommRing R] {n : Type v} [Fintype n] [DecidableEq n] [LinearOrder n]

def upperTriangular (I : Ideal R) : Subgroup (GL n R) where
  carrier := {g | ∀ i j, j < i → (g : Matrix n n R) i j ∈ I}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def upperUnipotent (I : Ideal R) : Subgroup (GL n R) where
  carrier := {g | g ∈ upperTriangular I ∧
    ∀ i, (g : Matrix n n R) i i - 1 ∈ I}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- GL₂-preimage of projective Γ₀, not a replacement for PGL₂. -/
def gamma0Preimage (I : Ideal R) : Subgroup (GL (Fin 2) R) := upperTriangular I

/-- GL₂-preimage of projective Γ₁: diagonal entries agree, rather than equal 1. -/
def gamma1Preimage (I : Ideal R) : Subgroup (GL (Fin 2) R) where
  carrier := {g | g ∈ gamma0Preimage I ∧
    (g : Matrix (Fin 2) (Fin 2) R) 1 1 -
      (g : Matrix (Fin 2) (Fin 2) R) 0 0 ∈ I}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The ratio d/a of diagonal reductions. Upper triangular invertibility over
R/I makes both diagonal entries units. -/
def diagonalRatio (I : Ideal R) : gamma0Preimage I →* (R ⧸ I)ˣ := by sorry

theorem diagonalRatio_value (I : Ideal R) (g : gamma0Preimage I) :
    ((diagonalRatio I g : (R ⧸ I)ˣ) : R ⧸ I) *
      Ideal.Quotient.mk I ((g.val : Matrix (Fin 2) (Fin 2) R) 0 0) =
      Ideal.Quotient.mk I ((g.val : Matrix (Fin 2) (Fin 2) R) 1 1) := by sorry

/-- The p-primary subgroup, with its actual mathematical predicate. -/
def primaryUnits (p : ℕ) [Fact p.Prime] (S : Type u) [CommRing S] : Subgroup Sˣ where
  carrier := {z | ∃ m : ℕ, z ^ (p ^ m) = 1}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def gammaPPreimage (I : Ideal R) (p : ℕ) [Fact p.Prime] : Subgroup (GL (Fin 2) R) :=
  ((primaryUnits p (R ⧸ I)).comap (diagonalRatio I)).map (gamma0Preimage I).subtype

/-- Genuine projective Γ₁ counterexample at 2³: the common diagonal can be 3,
which is neither +1 nor −1. This tests the preimage construction itself. -/
def modEightThree : GL (Fin 2) (ZMod 8) :=
  Matrix.GeneralLinearGroup.mk'' !![3, 0; 0, 3] (by sorry)

-- adapter-test: gamma0_eq_congruenceSubgroup (projective Γ₁ clause)
example : modEightThree ∈ gamma1Preimage (0 : Ideal (ZMod 8)) ∧
    (3 : ZMod 8) ≠ 1 ∧ (3 : ZMod 8) ≠ -1 := by sorry

/-- diag(1,2) has diagonal ratio of order 3 in F₇×. -/
def modSevenTwo : GL (Fin 2) (ZMod 7) :=
  Matrix.GeneralLinearGroup.mk'' !![1, 0; 0, 2] (by sorry)

local instance : Fact (Nat.Prime 3) := ⟨by decide⟩

-- adapter-test: gammaP_ne_gamma1 (the p=3, q=7 clause)
example : modSevenTwo ∈ gammaPPreimage (0 : Ideal (ZMod 7)) 3 ∧
    modSevenTwo ∉ gamma1Preimage (0 : Ideal (ZMod 7)) := by sorry

end MatrixLevel

section Iwahori
variable {R : Type u} [CommRing R] [IsLocalRing R]
  {n : Type v} [Fintype n] [DecidableEq n] [LinearOrder n]

-- signature: LocallySymmetric.iwahori
def iwahori : Subgroup (GL n R) := MatrixLevel.upperTriangular (IsLocalRing.maximalIdeal R)

-- signature: LocallySymmetric.iwahoriOne
def iwahoriOne : Subgroup (GL n R) := MatrixLevel.upperUnipotent (IsLocalRing.maximalIdeal R)

theorem iwahoriOne_le : iwahoriOne (R := R) (n := n) ≤ iwahori := by sorry

/-- Actual diagonal-reduction homomorphism, before identifying the quotient. -/
def iwahoriDiagonal : iwahori (R := R) (n := n) →*
    (n → (IsLocalRing.ResidueField R)ˣ) := by sorry

theorem iwahoriDiagonal_kernel :
    (iwahoriDiagonal (R := R) (n := n)).ker =
      (iwahoriOne (R := R) (n := n)).subgroupOf iwahori := by sorry

-- signature: LocallySymmetric.iwahori.index
theorem iwahori.index [Finite (IsLocalRing.ResidueField R)] :
    (iwahori (R := R) (n := n)).index =
      Nat.card (GL n (IsLocalRing.ResidueField R) ⧸
        MatrixLevel.upperTriangular (0 : Ideal (IsLocalRing.ResidueField R))) ∧
    ((iwahoriOne (R := R) (n := n)).subgroupOf iwahori).index =
      (Nat.card (IsLocalRing.ResidueField R) - 1) ^ Fintype.card n := by sorry

-- test: iwahori_index_GL2
example (p : ℕ) [Fact p.Prime] :
    (iwahori (R := ℤ_[p]) (n := Fin 2)).index = p + 1 := by sorry

end Iwahori

/-! ## ALS.1: whole-slice representation and loop order -/
section SliceRepresentation
variable {D : Datum.{u}} {R : Type u} [CommRing R]
  {V : Type u} [AddCommGroup V] [Module R V]

/-- Slice representation: γ acts through (γ,g⁻¹γg). Inverting only its K-factor
would generally fail to define a representation. -/
def sliceHom (K : Subgroup D.Gf) (g : D.Gf) :
    arithmeticSubgroup (D := D) K g →* (D.GF × K) where
  toFun γ := (γ.val, ⟨g⁻¹ * D.toFinite γ.val * g, by sorry⟩)
  map_one' := by sorry
  map_mul' := by sorry

def sliceRepresentation (K : Subgroup D.Gf) (g : D.Gf)
    (ρ : Representation R (D.GF × K) V) :
    Representation R (arithmeticSubgroup (D := D) K g) V := ρ.comp (sliceHom K g)

/-- Opposite-group inverse is a homomorphism; inverse on Γ itself is not. -/
def oppositeInverse (Γ : Type u) [Group Γ] : Γᵐᵒᵖ →* Γ where
  toFun a := a.unop⁻¹
  map_one' := by sorry
  map_mul' := by sorry

/-- With Tau Ceti's loop multiplication, the deck endpoint δ lands in Γᵐᵒᵖ.
The monodromy is the inverse of the entire slice representation. -/
def endpointMonodromy {PiGroup Γ : Type u} [Group PiGroup] [Group Γ]
    (δ : PiGroup →* Γᵐᵒᵖ) (ρ : Representation R Γ V) : Representation R PiGroup V :=
  ρ.comp ((oppositeInverse Γ).comp δ)

theorem endpointMonodromy_value {PiGroup Γ : Type u} [Group PiGroup] [Group Γ]
    (δ : PiGroup →* Γᵐᵒᵖ) (ρ : Representation R Γ V) (ℓ : PiGroup) (v : V) :
    endpointMonodromy δ ρ ℓ v = ρ ((δ ℓ).unop⁻¹) v := by sorry

/-- Noncommuting matrices make the endpoint-order test detect a wrong convention.
This is an adapter test; the arithmetic sheaf comparison is in the catalogue. -/
def orderA : GL (Fin 2) ℚ :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 1; 0, 1] (by sorry)
def orderB : GL (Fin 2) ℚ :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 0; 1, 1] (by sorry)

-- adapter-test: localSystem_eq_LocalCoefficientSystem
example : orderA * orderB ≠ orderB * orderA ∧
    (orderB * orderA)⁻¹ = orderA⁻¹ * orderB⁻¹ ∧
    (orderB * orderA)⁻¹ ≠ orderB⁻¹ * orderA⁻¹ := by sorry

end SliceRepresentation

/-! ## ALS.3: actual convolution ring and invariants -/
namespace Hecke
variable {G : Type u} [Group G] (U : Subgroup G)
  [IsHeckeTriple (⊤ : Submonoid G) U U]

/-- An actual basis element of the pinned convolution ring. -/
def basis (R : Type v) [CommRing R] (g : G) (r : R) :
    HeckeRing (⊤ : Submonoid G) U R :=
  HeckeCosetModule.single R (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) r

-- signature: LocallySymmetric.Hecke.invariantsModule
@[instance_reducible] def invariantsModule {M : Type v} [AddCommGroup M] [Module ℤ M]
    (ρ : Representation ℤ G M) :
    Module (HeckeRing (⊤ : Submonoid G) U ℤ) (Representation.invariants (ρ.comp U.subtype)) := by sorry

-- signature: LocallySymmetric.Hecke.smul_eq_trace
theorem smul_eq_trace {M : Type u} [AddCommGroup M] (ρ : Representation ℤ G M)
    (g : G) (reps : Finset G)
    (hcover : ∀ x : G, x ∈ DoubleCoset.doubleCoset g (U : Set G) (U : Set G) ↔
      ∃ r ∈ reps, (x : G ⧸ U) = (r : G ⧸ U))
    (hdisjoint : (reps : Set G).Pairwise
      (fun r s => (r : G ⧸ U) ≠ (s : G ⧸ U)))
    (m : Representation.invariants (ρ.comp U.subtype)) :
    letI := invariantsModule U ρ
    ((basis U ℤ g 1 • m : Representation.invariants (ρ.comp U.subtype)) : M) =
      ∑ r ∈ reps, ρ r m := by sorry

/-- The carrier is the actual invariant submodule, with the convolution action above. -/
def invariantsObject (M : Rep.{v} ℤ G) :
    ModuleCat.{v} (HeckeRing (⊤ : Submonoid G) U ℤ) :=
  letI : Module ℤ M.V := M.hV2
  letI := invariantsModule U M.ρ
  ModuleCat.of _ (Representation.invariants (M.ρ.comp U.subtype))

/-- Restrict the given intertwiner; linearity for convolution is the obligation. -/
def invariantsMap {M N : Rep.{v} ℤ G} (f : M ⟶ N) :
    invariantsObject U M ⟶ invariantsObject U N := by
  letI : Module ℤ M.V := M.hV2
  letI : Module ℤ N.V := N.hV2
  letI := invariantsModule U M.ρ
  letI := invariantsModule U N.ρ
  exact ModuleCat.ofHom {
    toFun := fun m => ⟨f.hom m, by sorry⟩
    map_add' := by sorry
    map_smul' := by sorry }

-- signature: LocallySymmetric.Hecke.invariantsFunctor
def invariantsFunctor : Rep.{v} ℤ G ⥤ ModuleCat.{v} (HeckeRing (⊤ : Submonoid G) U ℤ) where
  obj := invariantsObject U
  map := invariantsMap U
  map_id := by sorry
  map_comp := by sorry

def invariantsFunctor_objIso (M : Rep.{v} ℤ G) :
    (invariantsFunctor U).obj M ≅ invariantsObject U M := Iso.refl _

-- signature: LocallySymmetric.Hecke.one_smul
theorem one_smul {M : Type u} [AddCommGroup M] (ρ : Representation ℤ G M)
    (m : Representation.invariants (ρ.comp U.subtype)) :
    letI := invariantsModule U ρ
    (1 : HeckeRing (⊤ : Submonoid G) U ℤ) • m = m := by sorry

-- adapter-test: hecke_one_smul
example {M : Type u} [AddCommGroup M] (ρ : Representation ℤ G M)
    (m : Representation.invariants (ρ.comp U.subtype)) :
    letI := invariantsModule U ρ
    (1 : HeckeRing (⊤ : Submonoid G) U ℤ) • m = m := by sorry

/-- Counts use [U : U∩gUg⁻¹], the pinned degree orientation. -/
-- test: hecke_degree_eq_index
example (g : G) (reps : Finset G) (z : ℤ)
    (hcover : ∀ x : G, x ∈ DoubleCoset.doubleCoset g (U : Set G) (U : Set G) ↔
      ∃ r ∈ reps, (x : G ⧸ U) = (r : G ⧸ U))
    (hdisjoint : (reps : Set G).Pairwise
      (fun r s => (r : G ⧸ U) ≠ (s : G ⧸ U))) :
    let ρ : Representation ℤ G ℤ := 1
    letI := invariantsModule U ρ
    let m : Representation.invariants (ρ.comp U.subtype) := ⟨z, by sorry⟩
    ((basis U ℤ g 1 • m : Representation.invariants (ρ.comp U.subtype)) : ℤ) =
      ((ConjAct.toConjAct g • U).relIndex U : ℤ) * z ∧
    reps.card = (ConjAct.toConjAct g • U).relIndex U := by sorry

end Hecke

/-! ## ALS.3: derived ring images -/
section DerivedImages
variable {R T : Type u} [CommRing R] [CommRing T]
  [HasDerivedCategory (ModuleCat.{u} R)]
  (C : DerivedCategory (ModuleCat.{u} R))

-- signature: LocallySymmetric.derivedHeckeAlgebra
/-- Supply C = RΓ(X_K,V) and its actual Hecke action to specialize this image. -/
def derivedHeckeAlgebra (α : T →+* End C) : Subring (End C) := α.range

/-- Algebraic part only: commutativity of the image does not prove finiteness. -/
@[instance_reducible] def derivedImageCommRing (α : T →+* End C) :
    CommRing (derivedHeckeAlgebra C α) := by sorry

/-- The action on all cohomological degrees, rather than a chosen single degree. -/
def cohomologyAction (α : T →+* End C) :
    T →+* (∀ i : ℤ, End ((DerivedCategory.homologyFunctor (ModuleCat R) i).obj C)) := by sorry

/-- Adapter: quotient onto the image on the whole graded cohomology. -/
def derivedHeckeAlgebra.toCohomology (α : T →+* End C) :
    derivedHeckeAlgebra C α →+* (cohomologyAction C α).range := by sorry

theorem derivedHeckeAlgebra.toCohomology_surjective (α : T →+* End C) :
    Function.Surjective (derivedHeckeAlgebra.toCohomology C α) := by sorry

-- test: derivedHeckeAlgebra_zeroComplex
example (α : T →+* End C) (hC : IsZero C) :
    Subsingleton (derivedHeckeAlgebra C α) := by sorry

end DerivedImages

/-! ## ALS.3: twisting the actual Hecke convolution algebra -/
section Twisting
variable {G : Type u} [Group G] (U : Subgroup G)
  [IsHeckeTriple (⊤ : Submonoid G) U U] (R : Type u) [CommRing R]

-- signature: LocallySymmetric.twistHecke
def twistHecke (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1) :
    HeckeRing (⊤ : Submonoid G) U R ≃+* HeckeRing (⊤ : Submonoid G) U R := by sorry

/-- Basis formula. In the arithmetic specialization χ(g)=ψ(Art(det g));
χ(diag(ϖ,…,ϖ,1,…,1))=ψ(Frob_v)^i supplies the stated T_{v,i} formula. -/
theorem twistHecke_basis (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1) (g : G) (r : R) :
    twistHecke U R χ hχ (Hecke.basis U R g r) =
      Hecke.basis U R g ((((χ g)⁻¹ : Rˣ) : R) * r) := by sorry

-- signature: LocallySymmetric.twistHecke_T
theorem twistHecke_T (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1) (g : G) :
    twistHecke U R χ hχ (Hecke.basis U R g 1) =
      Hecke.basis U R g (((χ g)⁻¹ : Rˣ) : R) := by sorry

-- signature: LocallySymmetric.twistHecke_mul
theorem twistHecke_mul (χ χ' : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1)
    (hχ' : ∀ u ∈ U, χ' u = 1) (t : HeckeRing (⊤ : Submonoid G) U R) :
    twistHecke U R χ hχ (twistHecke U R χ' hχ' t) =
      twistHecke U R (χ * χ') (by sorry) t := by sorry

-- signature: LocallySymmetric.twistMaximalIdeal
def twistMaximalIdeal (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1)
    (m : Ideal (HeckeRing (⊤ : Submonoid G) U R)) :
    Ideal (HeckeRing (⊤ : Submonoid G) U R) := m.map (twistHecke U R χ hχ)

-- signature: LocallySymmetric.twistCoefficients
/-- General coefficient module, not just a rank-one scalar representation. -/
def twistCoefficients {M : Type u} [AddCommGroup M] [Module R M]
    (χ : G →* Rˣ) (ρ : Representation R G M) : Representation R G M where
  toFun g := (((χ g)⁻¹ : Rˣ) : R) • ρ g
  map_one' := by sorry
  map_mul' := by sorry

-- test: twistHecke_trivial
example (t : HeckeRing (⊤ : Submonoid G) U R) :
    twistHecke U R 1 (by sorry) t = t := by sorry

-- test: twistHecke_T_GL1
example (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1) (g : G) :
    twistHecke U R χ hχ (Hecke.basis U R g 1) =
      Hecke.basis U R g (((χ g)⁻¹ : Rˣ) : R) := by sorry

-- test: twistHecke_mul
example (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1)
    (t : HeckeRing (⊤ : Submonoid G) U R) :
    twistHecke U R χ hχ (twistHecke U R χ⁻¹ (by sorry) t) = t := by sorry

/-- This tests changed residue eigenvalues, as specified for coefficient twisting. It does not assert that Frobenius-conjugate eigensystems have different
kernels in a larger residue field. -/
-- test: twistHecke_not_identity_on_maximalIdeals
example {k : Type u} [Field k] (κ : R →+* k)
    (φ : HeckeRing (⊤ : Submonoid G) U R →+* k)
    (hφ : ∀ r : R, φ (Hecke.basis U R 1 r) = κ r)
    (χ : G →* Rˣ) (hχ : ∀ u ∈ U, χ u = 1) (g : G)
    (hχg : κ (χ g) ≠ 1) (hvalue : φ (Hecke.basis U R g 1) ≠ 0) :
    φ (twistHecke U R χ hχ (Hecke.basis U R g 1)) ≠
      φ (Hecke.basis U R g 1) := by sorry

end Twisting

/-! ## ALS.4: a genuine residual-representation adapter -/
section Reducibility
variable {Γ k : Type u} [Group Γ] [Field k] [IsAlgClosed k]

/-- Absolute reducibility over an algebraically closed residue field.
The missing arithmetic Galois-type/maximal-ideal interface is not replaced. -/
def ResiduallyReducible {n : ℕ} (ρ : Γ →* GL (Fin n) k) : Prop :=
  ∃ W : Submodule k (Fin n → k), W ≠ ⊥ ∧ W ≠ ⊤ ∧
    ∀ g : Γ, ∀ v ∈ W, (ρ g : Matrix (Fin n) (Fin n) k).mulVec v ∈ W

-- adapter-test: eisenstein_GL1 (representation-theoretic clause)
example (ρ : Γ →* GL (Fin 1) k) : ¬ ResiduallyReducible ρ := by sorry

end Reducibility

/-!
## Signatures requiring earlier interfaces

The following inventory records mathematical obligations in README.md that
cannot yet be expressed using the typed suppliers in this file. None of these
names denotes a Lean declaration or an executable example. The adapters above
state only their explicit algebraic or topological parts.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution — Cartan involutions of real reductive groups

Unstated: LocallySymmetric.IsCartanInvolution
Unstated: LocallySymmetric.IsCartanInvolution.exists
Unstated: LocallySymmetric.IsCartanInvolution.conj
Unstated: LocallySymmetric.IsCartanInvolution.transposeInverse
Unstated: LocallySymmetric.IsCartanInvolution.prod
Unstated: LocallySymmetric.IsCartanInvolution.killing
Unstated: cartanInvolution_GL_transposeInverse (computation)
Unstated: cartanInvolution_SL2_adjoint (computation)
Unstated: cartanInvolution_compact_id (degenerate)
Unstated: not_cartanInvolution_id_GL2 (non-example)

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup — Maximal compact subgroups from Cartan involutions

Unstated: LocallySymmetric.maximalCompact.

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space — The symmetric space of G with the split-centre correction

Unstated: LocallySymmetric.symmetricSpace
Unstated: LocallySymmetric.symmetricSpace.basepoint
Unstated: LocallySymmetric.symmetricSpace.stabilizer_eq
Unstated: LocallySymmetric.symmetricSpace.isoOfCartan
Unstated: LocallySymmetric.symmetricSpace.dim_eq
Unstated: LocallySymmetric.symmetricSpace.prod
Unstated: LocallySymmetric.symmetricSpace.connectedVariant
Unstated: symmetricSpace_GL2_Q (computation)
Unstated: symmetricSpace_GL1 (degenerate)
Unstated: symmetricSpace_SL2_compat (compatibility)
Unstated: symmetricSpace_not_without_centre (non-example)

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible — The symmetric space is contractible with proper action

Unstated: LocallySymmetric.symmetricSpace_contractible.

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space — The arithmetic locally symmetric space X_K

Unstated: LocallySymmetric.X.equivLevelQuotient
Unstated: X_GL1_Q (computation)
Unstated: X_GL2_levelOne (compatibility)
Unstated: X_not_coarse_of_discrete (non-example)

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition — Finite decomposition of X_K into arithmetic quotients

Unstated: LocallySymmetric.component_decomposition.

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers — Proper discontinuity and finite stabilizers at arbitrary level

Unstated: LocallySymmetric.properlyDiscontinuous_arithmeticSubgroup.

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold — At neat level X_K is a manifold and each component is a K(Γ, 1)

Unstated: LocallySymmetric.neatLevel_manifold.

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/neatness-iwahori-criterion — Two pro-v Iwahori factors of distinct residue characteristic force neatness

Unstated: LocallySymmetric.neat_of_two_iwahori.

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups — Standard level subgroups: Iwahori, Γ0, Γ1, Γp and Taylor–Wiles levels

Unstated: LocallySymmetric.gamma0
Unstated: LocallySymmetric.taylorWilesLevel
Unstated: LocallySymmetric.taylorWilesLevel.quotientEquiv
Unstated: LocallySymmetric.iwahori.eq_parahoric
Unstated: LocallySymmetric.gamma1
Unstated: LocallySymmetric.gammaP
Unstated: gamma0_eq_congruenceSubgroup (compatibility)
Unstated: taylorWiles_quotient_trivial_n1 (degenerate)
Unstated: gammaP_ne_gamma1 (non-example)

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system — The orientation local system of X_K and its character

Unstated: LocallySymmetric.orientationCharacter
Unstated: LocallySymmetric.orientationSystem
Unstated: LocallySymmetric.orientationSystem.monodromy
Unstated: LocallySymmetric.orientationSystem.pullback
Unstated: LocallySymmetric.orientationSystem.eq_manifold
Unstated: LocallySymmetric.orientationCharacter_GL
Unstated: orientationCharacter_GL2_Q (computation)
Unstated: orientationCharacter_connected (degenerate)
Unstated: orientationSystem_GL_formula (characterisation)
Unstated: orientation_not_trivial_at_neat_PGL2 (non-example)

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.0/nonorientable-neat-example — A nonorientable neat arithmetic quotient for PGL_2 over ℚ

Unstated: LocallySymmetric.nonorientable_neat_example.

Required mathematical interface:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system — Arithmetic local systems from coefficient modules

Unstated: LocallySymmetric.localSystem
Unstated: LocallySymmetric.localSystem.stalk
Unstated: LocallySymmetric.localSystem.monodromy
Unstated: LocallySymmetric.localSystem.map
Unstated: LocallySymmetric.localSystem.tensor
Unstated: LocallySymmetric.localSystem.pullback
Unstated: LocallySymmetric.localSystem.constant
Unstated: localSystem_trivial (degenerate)
Unstated: localSystem_monodromy_GL1 (computation)
Unstated: localSystem_eq_LocalCoefficientSystem (compatibility)
Unstated: localSystem_not_constant_of_trivial_stalk (non-example)

Required mathematical interface:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes — Betti complexes RΓ(X_K, V), RΓ_c(X_K, V) and their equivariant models

Unstated: LocallySymmetric.RΓ
Unstated: LocallySymmetric.RΓc
Unstated: LocallySymmetric.RΓrel
Unstated: LocallySymmetric.RΓ.isoSheafCohomology
Unstated: LocallySymmetric.RΓrel.forget
Unstated: LocallySymmetric.RΓc.forgetSupports
Unstated: LocallySymmetric.RΓ.map
Unstated: RΓ_point (degenerate)
Unstated: H1_modularCurve_levelGamma1_5 (computation)
Unstated: RΓ_eq_groupCohomology_levelOne (compatibility)
Unstated: RΓ_ne_coarse (non-example)

Required mathematical interface:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison — Sheaf cohomology of arithmetic local systems agrees with singular cochains

Unstated: LocallySymmetric.sheaf_singular_comparison.

Required mathematical interface:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison — Betti cohomology as group cohomology of the arithmetic groups

Unstated: LocallySymmetric.group_cohomology_comparison.

Required mathematical interface:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model — Bounded finite projective models from a finite equivariant cell structure

Unstated: LocallySymmetric.finite_complex_model.

Required mathematical interface:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change — Derived coefficient change and the universal-coefficient spectral sequence

Unstated: LocallySymmetric.coefficient_change.

Required mathematical interface:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback — Pullback and translation on Betti complexes

Unstated: LocallySymmetric.RΓ.pullback
Unstated: LocallySymmetric.RΓ.translate
Unstated: LocallySymmetric.RΓ.translate_pullback
Unstated: LocallySymmetric.RΓ.pullback_eq_sheafPullback
Unstated: LocallySymmetric.RΓc.pullback
Unstated: pullback_H0 (computation)
Unstated: translate_of_mem (degenerate)
Unstated: pullback_injective_rational (characterisation)
Unstated: pullback_not_iso (non-example)

Required mathematical interface:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face — Geodesic action and the boundary face e(P)

Unstated: LocallySymmetric.BorelSerre.geodesicAction
Unstated: LocallySymmetric.BorelSerre.geodesicAction_free
Unstated: LocallySymmetric.BorelSerre.face
Unstated: LocallySymmetric.BorelSerre.faceEquiv
Unstated: LocallySymmetric.BorelSerre.face_conj
Unstated: LocallySymmetric.BorelSerre.face_dim
Unstated: face_SL2_borel (computation)
Unstated: face_whole_group (degenerate)
Unstated: face_GL3_minimal (computation)
Unstated: geodesicAction_ne_leftAction (non-example)

Required mathematical interface:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
the arithmetic nilmanifold carrier of ALS.2; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification — The Borel–Serre partial compactification X̄^G

Unstated: LocallySymmetric.BorelSerre.bordification
Unstated: LocallySymmetric.BorelSerre.corner
Unstated: LocallySymmetric.BorelSerre.boundary
Unstated: LocallySymmetric.BorelSerre.closure_face
Unstated: LocallySymmetric.BorelSerre.smul
Unstated: LocallySymmetric.BorelSerre.contractible
Unstated: LocallySymmetric.BorelSerre.adelic
Unstated: bordification_SL2 (computation)
Unstated: bordification_anisotropic (degenerate)
Unstated: bordification_interior (characterisation)
Unstated: bordification_ne_onePoint (non-example)

Required mathematical interface:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
the arithmetic nilmanifold carrier of ALS.2; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact — Compactness of the Borel–Serre quotient and the interior homotopy equivalence

Unstated: LocallySymmetric.BorelSerre.compactSpace_adelic.

Required mathematical interface:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
the arithmetic nilmanifold carrier of ALS.2; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation — Finite triangulations and finiteness of Betti cohomology

Unstated: LocallySymmetric.BorelSerre.finite_relative_triangulation.

Required mathematical interface:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
the arithmetic nilmanifold carrier of ALS.2; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification — The stratification of the Borel–Serre boundary by parabolic classes

Unstated: LocallySymmetric.BorelSerre.stratum
Unstated: LocallySymmetric.BorelSerre.stratum_bijective
Unstated: LocallySymmetric.BorelSerre.stratum_closure
Unstated: LocallySymmetric.BorelSerre.stratum_isOpen_of_maximal
Unstated: LocallySymmetric.BorelSerre.stratum_components
Unstated: stratum_SL2_cusps (computation)
Unstated: stratum_anisotropic_empty (degenerate)
Unstated: stratum_GL3_poset (characterisation)
Unstated: stratum_not_disjoint_union_topologically (non-example)

Required mathematical interface:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
the arithmetic nilmanifold carrier of ALS.2; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration — Boundary strata fibre over Levi quotients with nilmanifold fibres

Unstated: LocallySymmetric.BorelSerre.stratum_nilmanifold_fibration.

Required mathematical interface:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
the arithmetic nilmanifold carrier of ALS.2; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence — The stratification filtration of ∂X̄_K and its spectral sequence

Unstated: LocallySymmetric.BorelSerre.stratFiltration
Unstated: LocallySymmetric.BorelSerre.stratSpectralSequence
Unstated: LocallySymmetric.BorelSerre.stratSpectralSequence_d1
Unstated: LocallySymmetric.BorelSerre.stratSpectralSequence_map
Unstated: LocallySymmetric.BorelSerre.mayerVietorisSpectralSequence
Unstated: stratSS_SL2 (computation)
Unstated: stratSS_empty (degenerate)
Unstated: stratSS_rank_one_collapse (characterisation)
Unstated: stratSS_E1_not_complex (non-example)

Required mathematical interface:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
the arithmetic nilmanifold carrier of ALS.2; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants — Hecke rings acting on invariants and on derived invariants

Unstated: LocallySymmetric.Hecke.derivedInvariants
Unstated: LocallySymmetric.Hecke.eq_heckeAlgebra
Unstated: hecke_one_smul (degenerate)
Unstated: hecke_Tp_permutation (computation)
Unstated: hecke_not_pointwise (non-example)

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action — The Hecke action on RΓ(X_K, V) in the derived category

Unstated: LocallySymmetric.heckeObject
Unstated: LocallySymmetric.heckeAction
Unstated: LocallySymmetric.heckeAction_c
Unstated: LocallySymmetric.heckeActionRel
Unstated: LocallySymmetric.heckeAction_one
Unstated: LocallySymmetric.heckeAction_natural
Unstated: heckeAction_one (degenerate)
Unstated: heckeAction_H0 (computation)
Unstated: heckeAction_modularCurve_Tp (compatibility)
Unstated: heckeAction_not_on_cochains (non-example)

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula — Hecke operators as correspondences: representative independence

Unstated: LocallySymmetric.hecke_operator_formula.

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace — Trace along level maps and the groupoid correction

Unstated: LocallySymmetric.RΓ.trace
Unstated: LocallySymmetric.RΓ.trace_pullback
Unstated: LocallySymmetric.RΓ.pullback_trace
Unstated: LocallySymmetric.RΓ.trace_comp
Unstated: LocallySymmetric.RΓ.trace_eq_coveringTransfer
Unstated: LocallySymmetric.RΓ.trace_c
Unstated: trace_pullback_H0 (computation)
Unstated: trace_self (degenerate)
Unstated: trace_eq_transfer (compatibility)
Unstated: trace_coarse_fails (non-example)

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition — Composition of Hecke correspondences, coherence and change of level

Unstated: LocallySymmetric.hecke_composition.

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility — Hecke compatibility with supports, boundary, coefficients and cup products

Unstated: LocallySymmetric.hecke_support_boundary_compatibility.

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison — Topological and discrete set-ups give the same Hecke actions

Unstated: LocallySymmetric.discrete_topological_comparison.

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra — The derived Hecke algebra T^S(K, V) of an arithmetic complex

Unstated: LocallySymmetric.derivedHeckeAlgebra.commRing
Unstated: LocallySymmetric.derivedHeckeAlgebra.toCohomology
Unstated: LocallySymmetric.derivedHeckeAlgebra.limit
Unstated: LocallySymmetric.derivedHeckeAlgebra.eq_derivedHeckeImage
Unstated: LocallySymmetric.derivedHeckeAlgebra.maximalIdeals_finite
Unstated: derivedHeckeAlgebra_GL1 (computation)
Unstated: derivedHeckeAlgebra_surj_cohomology (characterisation)
Unstated: derivedHeckeAlgebra_ne_cohomologyAlgebra (non-example)

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/twisting-isomorphism — Twisting RΓ(X_K, V) by a character, and its Hecke algebras

Unstated: LocallySymmetric.twisting_isomorphism.

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.3/degeneracy-old-forms — Degeneracy maps at Γ0(x)-level and the old-space splitting

Unstated: LocallySymmetric.degeneracy_old_forms.

Required mathematical interface:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle — The boundary exact triangle RΓ_c → RΓ → RΓ_∂

Unstated: LocallySymmetric.boundary_triangle.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps — Restriction to P, integration along N and the unnormalized Satake map

Unstated: LocallySymmetric.Hecke.restrictParabolic
Unstated: LocallySymmetric.Hecke.integrateUnipotent
Unstated: LocallySymmetric.Hecke.satakeUnnormalized
Unstated: LocallySymmetric.Hecke.satakeUnnormalized_basis
Unstated: LocallySymmetric.Hecke.satake_compat_normalized
Unstated: LocallySymmetric.Hecke.parabolicInduction_invariants
Unstated: satake_GL2_Tp (computation)
Unstated: satake_one (degenerate)
Unstated: satake_compat_SR4 (compatibility)
Unstated: satake_unnormalized_not_W_invariant (non-example)

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison — Hecke action on boundary strata through parabolic restriction

Unstated: LocallySymmetric.boundary_stratum_hecke_comparison.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est — Nomizu–van Est: cohomology of unipotent arithmetic groups is Lie algebra cohomology

Unstated: LocallySymmetric.nomizu_van_est.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula — Cohomology of a boundary stratum via van Est and Kostant

Unstated: LocallySymmetric.boundary_stratum_cohomology_formula.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre — The integral Leray–Hochschild–Serre spectral sequence of a stratum

Unstated: LocallySymmetric.levi_hochschild_serre.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence — Gluing over strata: convergence and Hecke compatibility of the boundary spectral sequence

Unstated: LocallySymmetric.boundary_gluing_convergence.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal — Localizing perfect Hecke complexes at a maximal ideal

Unstated: LocallySymmetric.heckeLocalize
Unstated: LocallySymmetric.heckeLocalize.cohomology
Unstated: LocallySymmetric.heckeLocalize.heckeAlgebra
Unstated: LocallySymmetric.heckeLocalize.triangle
Unstated: LocallySymmetric.heckeLocalize.eq_zero_iff
Unstated: LocallySymmetric.heckeLocalize.reduction
Unstated: heckeLocalize_unsupported (degenerate)
Unstated: heckeLocalize_module (compatibility)
Unstated: heckeLocalize_sum (characterisation)
Unstated: heckeLocalize_not_tensor (non-example)

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal — Galois type, Eisenstein and non-Eisenstein maximal ideals

Unstated: LocallySymmetric.IsGaloisType
Unstated: LocallySymmetric.IsEisenstein
Unstated: LocallySymmetric.IsEisenstein.of_cohomology
Unstated: LocallySymmetric.IsEisensteinCG
Unstated: LocallySymmetric.IsEisenstein.iff_CG
Unstated: eisenstein_H0 (computation)
Unstated: eisenstein_GL1 (degenerate)
Unstated: eisenstein_iff_CG_PGL2 (compatibility)
Unstated: nonEisenstein_not_vanishing (non-example)

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-eigenvalue-criterion — Boundary vanishing by an eigenvalue argument

Unstated: LocallySymmetric.boundary_eigenvalue_criterion.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein — Boundary cohomology of GL_n is Eisenstein

Unstated: LocallySymmetric.gln_boundary_eisenstein.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization — Localized boundary cohomology of U(n, n) is the Siegel stratum

Unstated: LocallySymmetric.siegel_stratum_localization.

Required mathematical interface:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge — X̄_K as a compact topological manifold with boundary

Unstated: LocallySymmetric.corner_boundary_bridge.

Required mathematical interface:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality — Poincaré–Verdier duality for X_K with perfect coefficients and orientation twist

Unstated: LocallySymmetric.verdier_poincare_duality.

Required mathematical interface:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings — Evaluation, cup-product and relative duality pairings

Unstated: LocallySymmetric.dualityPairing
Unstated: LocallySymmetric.dualityPairing_relative
Unstated: LocallySymmetric.dualityPairing_perfect
Unstated: LocallySymmetric.dualityPairing_pullback_trace
Unstated: LocallySymmetric.dualityPairing_eq_evaluation
Unstated: pairing_surface_H0H2 (computation)
Unstated: pairing_compact_case (degenerate)
Unstated: pairing_pullback_trace (characterisation)
Unstated: pairing_needs_orientation (non-example)

Required mathematical interface:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality — Hecke adjoints: inverse double cosets and restriction/corestriction

Unstated: LocallySymmetric.hecke_adjoint_duality.

Required mathematical interface:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-triangle-compatibility — Duality, the boundary triangle and coefficient change

Unstated: LocallySymmetric.duality_triangle_compatibility.

Required mathematical interface:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/non-neat-duality — Duality at non-neat level: stabilizer hypotheses

Unstated: LocallySymmetric.non_neat_duality.

Required mathematical interface:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5/early-duality-reexport — The early finite-level duality as an input to the characteristic-zero comparison

Unstated: LocallySymmetric.early_duality_reexport.

Required mathematical interface:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; ALS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; the ALS.5 characteristic-zero unitary and GL parameter comparisons. An arbitrary submodule of H*
cannot define cuspidal cohomology.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison — Betti, de Rham and relative Lie algebra cohomology in characteristic zero

Unstated: LocallySymmetric.de_rham_comparison.

Required mathematical interface:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; ALS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; the ALS.5 characteristic-zero unitary and GL parameter comparisons. An arbitrary submodule of H*
cannot define cuspidal cohomology.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison — Franke's comparison with automorphic forms

Unstated: LocallySymmetric.automorphic_comparison.

Required mathematical interface:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; ALS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; the ALS.5 characteristic-zero unitary and GL parameter comparisons. An arbitrary submodule of H*
cannot define cuspidal cohomology.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology — Cuspidal cohomology

Unstated: LocallySymmetric.cuspidalCohomology
Unstated: LocallySymmetric.cuspidalCohomology_injective
Unstated: LocallySymmetric.cuspidalCohomology_le_interior
Unstated: LocallySymmetric.cuspidalCohomology_decomp
Unstated: LocallySymmetric.cuspidalCohomology_eq_franke
Unstated: cuspidal_GL2_weight2 (computation)
Unstated: cuspidal_torus (degenerate)
Unstated: cuspidal_le_interior (characterisation)
Unstated: cuspidal_ne_ordinary (non-example)

Required mathematical interface:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; ALS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; the ALS.5 characteristic-zero unitary and GL parameter comparisons. An arbitrary submodule of H*
cannot define cuspidal cohomology.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5/clozel-cohomological-gln — Regular algebraic cuspidal representations of GL_n contribute to cohomology

Unstated: LocallySymmetric.clozel_cohomological_gln.

Required mathematical interface:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; ALS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; the ALS.5 characteristic-zero unitary and GL parameter comparisons. An arbitrary submodule of H*
cannot define cuspidal cohomology.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5/non-eisenstein-degree-range — Rational cohomology localized at a non-Eisenstein ideal is cuspidal and lives in [q₀, q₀ + l₀]

Unstated: LocallySymmetric.non_eisenstein_degree_range.

Required mathematical interface:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; ALS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; the ALS.5 characteristic-zero unitary and GL parameter comparisons. An arbitrary submodule of H*
cannot define cuspidal cohomology.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.5/unitary-middle-degree — Middle-degree rational cohomology of U(n, n) at 𝔪̃ is semisimple and cuspidal

Unstated: LocallySymmetric.unitary_middle_degree.

Required mathematical interface:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; ALS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; the ALS.5 characteristic-zero unitary and GL parameter comparisons. An arbitrary submodule of H*
cannot define cuspidal cohomology.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent — Finite-level descent along a normal inclusion of levels

Unstated: LocallySymmetric.finite_level_descent.

Required mathematical interface:
The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite
residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed
tower or continuous profinite comparison is assumed or imported.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre — The finite-cover Hochschild–Serre spectral sequence with Hecke action

Unstated: LocallySymmetric.finite_cover_hochschild_serre.

Required mathematical interface:
The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite
residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed
tower or continuous profinite comparison is assumed or imported.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.6/lowest-degree-descent — The lowest nonvanishing localized degree descends along a p-group cover

Unstated: LocallySymmetric.lowest_degree_descent.

Required mathematical interface:
The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite
residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed
tower or continuous profinite comparison is assumed or imported.
-/

/-
ArithmeticLocallySymmetricSpaces:ALS.6/tower-acceptance-tests — Finite-cover acceptance tests for modular and compact quotients

Unstated: LocallySymmetric.finite_cover_acceptance_tests.

Required mathematical interface:
The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite
residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed
tower or continuous profinite comparison is assumed or imported.
-/

end TauCeti.LocallySymmetric
