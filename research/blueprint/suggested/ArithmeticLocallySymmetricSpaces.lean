import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.ConstMulAction
import Mathlib.Topology.Homotopy.Contractible
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
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

/-!
# Arithmetic locally symmetric spaces: suggested forms, revision 2

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticLocallySymmetricSpaces.md` is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. Proofs and construction obligations are `sorry`; this is
not an implementation. Every packet node has implementationStatus = "unchecked".

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.
This revision was not compiled: no existing shared build at both pins was found.

The generic quotient, congruence-preimage, representation and ring-image forms
below use actual library types. `Datum` packages quotient inputs only; it is not
a definition of an arithmetic reductive group, neatness, or properness. No
arithmetic properness theorem is asserted for an arbitrary `Datum`.

A form labelled "adapter" covers the indicated algebraic/topological part only.
It is not counted as the full packet signature. The final omission catalogue
lists every missing definition, API item, test and theorem with its exact
mathematical specification and the earlier interface it needs. In particular,
comments in that catalogue are not signatures or executable tests. Conditions
that cannot yet be stated are left out as protocol section 13 requires; there
are no invented proposition fields or stand-in library instances.

The actual Tau Ceti convolution ring, local-coefficient-system alias, covering
classification and relative singular-chain functor are imported above. The
arithmetic sheaf/monodromy comparisons remain separate obligations.
-/

open CategoryTheory CategoryTheory.Limits
open scoped Pointwise Matrix

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

universe u
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
-- test: symmetricSpace_GL1 (r₁=1, r₂=0 specialization; full test in catalogue)
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
variable {R : Type u} [CommRing R] {n : Type u} [Fintype n] [DecidableEq n] [LinearOrder n]

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

local instance : Fact (Nat.Prime 3) := ⟨by sorry⟩
local instance : Fact (Nat.Prime 7) := ⟨by sorry⟩

/-- diag(1,2) has diagonal ratio of order 3 in F₇×. -/
def modSevenTwo : GL (Fin 2) (ZMod 7) :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 0; 0, 2] (by sorry)

-- adapter-test: gammaP_ne_gamma1 (the p=3, q=7 clause)
example : modSevenTwo ∈ gammaPPreimage (0 : Ideal (ZMod 7)) 3 ∧
    modSevenTwo ∉ gamma1Preimage (0 : Ideal (ZMod 7)) := by sorry

end MatrixLevel

section Iwahori
variable {R : Type u} [CommRing R] [IsLocalRing R]
  {n : Type u} [Fintype n] [DecidableEq n] [LinearOrder n]

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
def endpointMonodromy {Π Γ : Type u} [Group Π] [Group Γ]
    (δ : Π →* Γᵐᵒᵖ) (ρ : Representation R Γ V) : Representation R Π V :=
  ρ.comp ((oppositeInverse Γ).comp δ)

theorem endpointMonodromy_value {Π Γ : Type u} [Group Π] [Group Γ]
    (δ : Π →* Γᵐᵒᵖ) (ρ : Representation R Γ V) (ℓ : Π) (v : V) :
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
def basis (R : Type u) [CommRing R] (g : G) (r : R) :
    HeckeRing (⊤ : Submonoid G) U R :=
  HeckeCosetModule.single R (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) r

-- signature: LocallySymmetric.Hecke.invariantsModule
@[instance_reducible] def invariantsModule {M : Type u} [AddCommGroup M]
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

-- signature: LocallySymmetric.Hecke.invariantsFunctor
def invariantsFunctor : Rep ℤ G ⥤ ModuleCat (HeckeRing (⊤ : Submonoid G) U ℤ) := by sorry

def invariantsObject {M : Type u} [AddCommGroup M] (ρ : Representation ℤ G M) :
    ModuleCat (HeckeRing (⊤ : Submonoid G) U ℤ) :=
  letI := invariantsModule U ρ
  ModuleCat.of _ (Representation.invariants (ρ.comp U.subtype))

def invariantsFunctor_objIso (M : Rep ℤ G) :
    (invariantsFunctor U).obj M ≅ invariantsObject U M.ρ := by sorry

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

/-- This tests changed residue eigenvalues, exactly as the corrected packet
states. It does not assert that Frobenius-conjugate eigensystems have different
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
## Exact omissions

Each entry below is an unfilled signature obligation, not an axiom and not an
executable test. It is grouped by the earlier missing interface. Existing
adapters are called out explicitly where they cover only part of an obligation.
The reader and packet remain the full mathematical specifications.
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution — Cartan involutions of real reductive groups

Mathematical specification:
Let H be a connected linear algebraic group over ℝ, with complex conjugation g ↦ ḡ on H(ℂ). An
involution θ of H, as an algebraic group over ℝ, is a Cartan involution if the twisted real form
H^(θ)(ℝ) = {g ∈ H(ℂ) : g = θ(ḡ)} is compact. For a connected reductive group G over a number field F
we apply this to H = (Res_{F/ℚ} G)_ℝ, so that H(ℝ) = G(F_∞) = ∏_{v|∞} G(F_v); a Cartan involution of
G(F_∞) is a product of Cartan involutions of the factors G_{F_v}. Its fixed group K_θ = G(F_∞)^θ is
the associated maximal compact subgroup (see maximal-compact-subgroup).

OMITTED SIGNATURE: LocallySymmetric.IsCartanInvolution
The predicate on an involution θ of G_ℝ: the twisted real form G^(θ)(ℝ) is compact.

OMITTED SIGNATURE: LocallySymmetric.IsCartanInvolution.exists
Every connected reductive group over ℝ has a Cartan involution (Satake; Milne Theorem 1.16).

OMITTED SIGNATURE: LocallySymmetric.IsCartanInvolution.conj
Any two Cartan involutions θ, θ′ of G differ by ad(g) for some g ∈ G(ℝ): θ′ = ad(g) ∘ θ ∘ ad(g)⁻¹.

OMITTED SIGNATURE: LocallySymmetric.IsCartanInvolution.transposeInverse
If G ⊂ GL_n is stable under g ↦ gᵗ, then g ↦ (gᵗ)⁻¹ restricts to a Cartan involution of G; for G =
GL_n it is Cartan with fixed group O(n).

OMITTED SIGNATURE: LocallySymmetric.IsCartanInvolution.prod
For G = G₁ × G₂, θ₁ × θ₂ is Cartan if and only if θ₁ and θ₂ are; for Res_{F/ℚ}G Cartan involutions
are products over v | ∞.

OMITTED SIGNATURE: LocallySymmetric.IsCartanInvolution.killing
For a semisimple real group, the induced involution is Cartan iff (X, Y) ↦ −B(X, dθ(Y)) is positive
definite. For a reductive group this criterion tests only the derived subgroup; compactness of the
twisted central torus is a separate condition.

OMITTED FULL EXAMPLE: cartanInvolution_GL_transposeInverse (computation)
For G = GL_n over ℝ, θ(g) = (gᵗ)⁻¹ is a Cartan involution and G(ℝ)^θ = O(n).

OMITTED FULL EXAMPLE: cartanInvolution_SL2_adjoint (computation)
For G = SL_2 and θ = ad((0, 1; −1, 0)), the twisted form is SU(2), compact (Milne Example 1.15), so
θ is Cartan.

OMITTED FULL EXAMPLE: cartanInvolution_compact_id (degenerate)
If G(ℝ) is compact (e.g. G = SO(n) or a norm-one torus), the identity is a Cartan involution and the
only one.

OMITTED FULL EXAMPLE: not_cartanInvolution_id_GL2 (non-example)
The identity of GL_2 is not a Cartan involution: its twisted form is GL_2(ℝ), which is not compact.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
mathlib:Matrix.GeneralLinearGroup;
tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup — Maximal compact subgroups from Cartan involutions

Mathematical specification:
Let G be connected reductive over a number field F and θ a Cartan involution of G(F_∞). Then K_∞ =
G(F_∞)^θ is a maximal compact subgroup of G(F_∞), it meets every connected component of G(F_∞),
every compact subgroup of G(F_∞) is contained in a G(F_∞)-conjugate of K_∞, and with 𝔭 the
(−1)-eigenspace of dθ on 𝔤 = Lie G(F_∞), the map K_∞ × 𝔭 → G(F_∞), (k, X) ↦ k·exp X, is a
diffeomorphism.

OMITTED theorem signature: LocallySymmetric.maximalCompact.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution;
tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space — The symmetric space of G with the split-centre correction

Mathematical specification:
Let G be connected reductive over a number field F, 𝐆 = Res_{F/ℚ} G, A_𝐆 the maximal ℚ-split torus
in the centre of 𝐆 and A_∞ = A_𝐆(ℝ)°. Fix a Cartan involution θ with maximal compact K_∞ = G(F_∞)^θ.
The symmetric space of G is X^G = G(F_∞)/K_∞A_∞, a homogeneous space for the left action of G(F_∞)
whose point stabilizers are the conjugates g K_∞ A_∞ g⁻¹. Equivalently X^G is the space of type S−Q
for 𝐆 in the sense of Borel–Serre: the isotropy groups are K·S(ℝ) with S a maximal ℚ-split torus of
the radical normalized by K. It is independent of θ up to G(F_∞)-equivariant isomorphism, and d_G =
dim X^G = dim G(F_∞) − dim K_∞ − dim A_∞. The split-centre correction is part of the definition: for
GL_n, X = GL_n(F_∞)/K_∞ℝ^×_{>0} (ACC+ writes K_∞ℝ^×, which agrees since −1 ∈ K_∞).

OMITTED SIGNATURE: LocallySymmetric.symmetricSpace
X^G = G(F_∞)/K_∞A_∞ as a topological space (smooth manifold) with its left G(F_∞)-action.

OMITTED SIGNATURE: LocallySymmetric.symmetricSpace.basepoint
The base point x₀ = [1] with stabilizer K_∞A_∞.

OMITTED SIGNATURE: LocallySymmetric.symmetricSpace.stabilizer_eq
Stab(g·x₀) = g K_∞A_∞ g⁻¹ for all g ∈ G(F_∞).

OMITTED SIGNATURE: LocallySymmetric.symmetricSpace.isoOfCartan
For Cartan involutions θ, θ′ = ad(h)θad(h)⁻¹ the map gK_θA_∞ ↦ g h⁻¹K_θ′A_∞ is a G(F_∞)-equivariant
diffeomorphism.

OMITTED SIGNATURE: LocallySymmetric.symmetricSpace.dim_eq
dim X^G = dim G(F_∞) − dim K_∞ − dim A_∞; e.g. 2 for GL_2/ℚ, 3 for GL_2 over an imaginary quadratic
field, n(n+1)/2 − 1 for GL_n/ℚ.

OMITTED SIGNATURE: LocallySymmetric.symmetricSpace.prod
X^{G₁×G₂} ≅ X^{G₁} × X^{G₂} equivariantly when A_{G₁×G₂} = A_{G₁} × A_{G₂}.

OMITTED SIGNATURE: LocallySymmetric.symmetricSpace.connectedVariant
X̃^G = G(F_∞)/K_∞°A_∞ with the covering X̃^G → X^G whose deck group is π_0(K_∞) = π_0(G(F_∞)); for
GL_{2,ℚ}, X̃ = ℍ^± (Scholze's X̃_K uses this variant).

OMITTED FULL EXAMPLE: symmetricSpace_GL2_Q (computation)
For G = GL_{2,ℚ}, X^G ≅ ℍ (upper half-plane) G(ℝ)-equivariantly, with g acting by z ↦ (az+b)/(cz+d)
if det g > 0 and z ↦ (az̄+b)/(cz̄+d) if det g < 0; dim X = 2.

OMITTED FULL EXAMPLE: symmetricSpace_GL1 (degenerate)
For G = GL_{1,F}, X^G = (F⊗ℝ)^×/(K_∞ℝ_{>0}) ≅ ℝ^{r₁+r₂−1}; it is a point exactly when F is ℚ or
imaginary quadratic.

OMITTED FULL EXAMPLE: symmetricSpace_SL2_compat (compatibility)
For G = SL_{2,ℚ}, X^G = SL_2(ℝ)/SO(2) is identified with Mathlib's UpperHalfPlane through g ↦ g·i,
equivariantly for the Möbius action.

OMITTED FULL EXAMPLE: symmetricSpace_not_without_centre (non-example)
Without the split-centre factor, GL_2(ℝ)/O(2) ≅ ℍ × ℝ_{>0} has dimension 3 and every γ ∈ GL_2(ℤ)
acts trivially on the ℝ_{>0} factor (|det γ| = 1), so Γ\(GL_2(ℝ)/O(2)) ≅ (Γ\ℍ) × ℝ_{>0} has infinite
volume; for the anisotropic unit group of a definite quaternion algebra the quotient would be
noncompact.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution;
ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup;
AdelicAlgebraicGroups:AA.2/split-centre
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible — The symmetric space is contractible with proper action

Mathematical specification:
X^G is diffeomorphic to Euclidean space of dimension d_G: with 𝔞_G = Lie A_∞ ⊂ 𝔭, the map 𝔭/𝔞_G →
X^G, X ↦ exp(X)·x₀, is a diffeomorphism. In particular X^G is contractible and orientable. The
induced action of G(F_∞)/A_∞ is proper, with compact point stabilizers K_∞A_∞/A_∞ and their
conjugates. A subgroup Γ acts properly discontinuously with finite stabilizers if its image in
G(F_∞)/A_∞ is discrete and its kernel Γ ∩ A_∞ is finite. Discreteness of Γ in G(F_∞) and Γ ∩ A_∞ = 1
alone do not imply this projected discreteness.

OMITTED theorem signature: LocallySymmetric.symmetricSpace_contractible.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space;
ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup;
tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions;
mathlib:ContractibleSpace; mathlib:ProperlyDiscontinuousSMul
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space — The arithmetic locally symmetric space X_K

Mathematical specification:
For a compact open subgroup K ⊂ G(A_F^∞) put X_K = X^G_K = G(F)\(X^G × G(A_F^∞)/K), with G(F) acting
diagonally (through G(F) → G(F_∞) on X^G) and the quotient topology. Write 𝔛_G = G(F)\(X^G ×
G(A_F^∞)^δ), with G(A_F^∞) discrete, a right G(A_F^∞)-space with X_K = 𝔛_G/K. Right translation by g
∈ G(A_F^∞) induces homeomorphisms r_g : X_{gKg⁻¹} → X_K, [x, h] ↦ [x, hg], and for K′ ⊂ K the
projection π_{K′,K} : X_{K′} → X_K. Under X^G × G(A_F^∞)/K = G(A_F)/K_∞A_∞K, X_K is the level
quotient of AdelicAlgebraicGroups AA.4 for the archimedean subgroup K_∞A_∞.

GENERIC SIGNATURE ABOVE: LocallySymmetric.X
X_K = G(F)\(X^G × G(A^∞)/K) as a topological space.

GENERIC SIGNATURE ABOVE: LocallySymmetric.X.mk
The class [x, g] ∈ X_K of (x, g) ∈ X^G × G(A^∞).

GENERIC SIGNATURE ABOVE: LocallySymmetric.X.mk_eq_mk_iff
[x, g] = [x′, g′] iff there are γ ∈ G(F), k ∈ K with x′ = γx and g′ = γ g k.

GENERIC SIGNATURE ABOVE: LocallySymmetric.X.translate
r_g : X_{gKg⁻¹} → X_K, [x, h] ↦ [x, hg], a homeomorphism with r_1 = id and r_g ∘ r_h = r_{hg}.

GENERIC SIGNATURE ABOVE: LocallySymmetric.X.levelMap
π_{K′,K} : X_{K′} → X_K for K′ ⊂ K, with π_{K,K} = id, π_{K′,K} ∘ π_{K″,K′} = π_{K″,K}, and r_g ∘ π
= π ∘ r_g.

OMITTED SIGNATURE: LocallySymmetric.X.equivLevelQuotient
X_K ≃ AA.4's level quotient G(F)\G(A_F)/K_∞A_∞K, compatibly with right translations.

OMITTED FULL EXAMPLE: X_GL1_Q (computation)
For G = GL_{1,ℚ} and K = Ẑ^×, X_K is a single point: ℚ^×\(pt × A_f^×/Ẑ^×) = ℚ^×\(ℚ^×_{>0}·Ẑ^×)/Ẑ^×
is one class.

EXECUTABLE EXAMPLE ABOVE: X_trivialGroup (degenerate)
For G trivial, X_K is a point for the unique K.

OMITTED FULL EXAMPLE: X_GL2_levelOne (compatibility)
For G = GL_{2,ℚ} and K = GL_2(Ẑ), X_K ≅ GL_2(ℤ)\ℍ = (SL_2(ℤ)\ℍ)/(z ↦ −z̄) as topological spaces (one
component since det GL_2(Ẑ) = Ẑ^× and A_f^× = ℚ^×_{>0}Ẑ^×), where ℍ is identified with
GL_2(ℝ)/O(2)ℝ_{>0} as in symmetricSpace_GL2_Q.

OMITTED FULL EXAMPLE: X_not_coarse_of_discrete (non-example)
X_K is not G(F)\G(A_F^∞)/K (a finite set): forgetting X^G loses all positive-dimensional topology;
for GL_{2,ℚ} and K = GL_2(Ẑ) that set is a point while X_K is the modular curve.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space; AdelicAlgebraicGroups:AA.4/level-quotient;
AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition — Finite decomposition of X_K into arithmetic quotients

Mathematical specification:
Let K ⊂ G(A_F^∞) be compact open and g_1, …, g_s representatives of the finite set G(F)\G(A_F^∞)/K.
Put Γ_i = G(F) ∩ g_iKg_i⁻¹, viewed in G(F_∞). Then [x] ↦ [x, g_i] on the i-th summand is a
homeomorphism ⊔_{i=1}^s Γ_i\X^G ≅ X_K. The stabilizer of [x, g_i] in the G(F)-action on X^G ×
G(A^∞)/K is identified with Stab_{Γ_i}(x) = Γ_i ∩ Stab_{G(F_∞)}(x); changing g_i to γ g_i k replaces
Γ_i by γΓ_iγ⁻¹. The connected components of X_K are the images Γ_i\X^G.

OMITTED theorem signature: LocallySymmetric.component_decomposition.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space;
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible;
AdelicAlgebraicGroups:AA.3/component-decomposition; AdelicAlgebraicGroups:AA.3/class-number-finite
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers — Proper discontinuity and finite stabilizers at arbitrary level

Mathematical specification:
For every compact open K and g ∈ G(A^∞), Γ_{g,K} = G(F) ∩ gKg⁻¹ is a discrete subgroup of G(F_∞)
acting properly discontinuously on X^G. Precisely: the G(F)-action on X^G × G(A^∞)/K is properly
discontinuous; the stabilizer of (x, hK) is Γ_{h,K} ∩ Stab_{G(F_∞)}(x), a finite group; and the
finite central subgroup Z_K = Z(F) ∩ K_∞A_∞K lies in every stabilizer and acts trivially. Hence X_K
is the coarse quotient of the action groupoid 𝒳_K (AdelicAlgebraicGroups
AA.4/level-quotient-groupoid for K_∞A_∞), whose automorphism groups are these finite stabilizers; at
points with trivial stabilizer X_K is locally homeomorphic to X^G.

OMITTED theorem signature: LocallySymmetric.properlyDiscontinuous_arithmeticSubgroup.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition;
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible;
AdelicAlgebraicGroups:AA.4/level-quotient-groupoid;
AdelicAlgebraicGroups:AA.1/rational-points-discrete; mathlib:ProperlyDiscontinuousSMul;
mathlib:CategoryTheory.ActionCategory; AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap;
AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold — At neat level X_K is a manifold and each component is a K(Γ, 1)

Mathematical specification:
Let K be neat (AdelicAlgebraicGroups AA.4/neat-level). Then every Γ_{g,K} is torsion-free, meets A_∞
trivially and acts freely and properly discontinuously on X^G; G(F) × K^δ acts freely and properly
discontinuously on X^G × G(A^∞)^δ: every point has a neighbourhood U with γU·k ∩ U = ∅ for (γ,k) ≠
(1,1); X^G × G(A^∞)/K → X_K is a covering map; X_K is a smooth manifold of dimension d_G, each
component Γ_i\X^G is an Eilenberg–MacLane space K(Γ_i, 1); and for K′ ⊂ K normal, π_{K′,K} : X_{K′}
→ X_K is a finite covering with free K/K′-action (a Galois covering on each component when X_{K′} is
connected over it).

OMITTED theorem signature: LocallySymmetric.neatLevel_manifold.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers;
AdelicAlgebraicGroups:AA.4/neat-level; AdelicAlgebraicGroups:AA.4/neat-torsion-free;
AdelicAlgebraicGroups:AA.4/level-covering-map; AdelicAlgebraicGroups:AA.4/level-action-free-at-neat;
mathlib:IsCoveringMap
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/neatness-iwahori-criterion — Two pro-v Iwahori factors of distinct residue characteristic force neatness

Mathematical specification:
Let K = ∏_v K_v ⊂ GL_n(Ô_F) be compact open and suppose there are finite places v, v′ of F with
distinct residue characteristics q ≠ q′ such that K_v = Iw_{v,1} and K_{v′} = Iw_{v′,1} (pro-v
Iwahori subgroups, standard-level-subgroups). Then K is neat. More generally the conclusion holds
whenever K_v and K_{v′} are pro-q and pro-q′ groups with q ≠ q′ whose elements have all eigenvalues
≡ 1 modulo the maximal ideal.

OMITTED theorem signature: LocallySymmetric.neat_of_two_iwahori.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups;
AdelicAlgebraicGroups:AA.4/neat-level; AdelicAlgebraicGroups:AA.4/neat-element
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups — Standard level subgroups: Iwahori, Γ0, Γ1, Γp and Taylor–Wiles levels

Mathematical specification:
Let v be a finite place of F with ring of integers O_v, uniformizer ϖ_v, residue field k_v. (i) Iw_v
⊂ GL_n(O_v) is the subgroup of matrices upper triangular mod ϖ_v and Iw_{v,1} ⊂ Iw_v the pro-v
Iwahori, unipotent upper triangular mod ϖ_v; Iw_v/Iw_{v,1} ≅ (k_v^×)^n. (ii) For n = 2 and c ≥ 1,
inside PGL_2(O_v): Γ_0(v^c) = {g ≡ (1 ∗; 0 ∗) mod ϖ_v^c}, Γ_1(v^c) = {g ≡ (1 ∗; 0 1) mod ϖ_v^c},
Γ_p(v^c) = {g ≡ (1 ∗; 0 d) mod ϖ_v^c with d of p-power order}. (iii) For PGL_n with n ≥ 2, the (1,
n−1)-parahoric K_0(v) = image of {g ∈ GL_n(O_v) : g stabilizes a fixed line ℓ ⊂ k_v^n mod ϖ_v}, i.e.
g ≡ (1 ∗; 0 GL_{n−1}) mod ϖ_v, and its normal subgroup K_1(v) = {g ≡ (1 ∗; 0 SL_{n−1})} with
K_0(v)/K_1(v) ≅ k_v^×. (iv) For a finite set Q of places and a level K with K_v maximal at v ∈ Q,
K_0(Q) and K_1(Q) replace K_v by K_0(v), K_1(v) for v ∈ Q; K_1(Q) ⊂ K_0(Q) is normal with quotient
Δ_Q = ∏_{v∈Q} k_v^×; Y_0(Q) = X_{K_0(Q)}, Y_1(Q) = X_{K_1(Q)}. For Δ a quotient of Δ_Q, K_Δ(Q) is
the preimage of ker(Δ_Q → Δ) and Y_Δ(Q) = X_{K_Δ(Q)}.

GENERIC SIGNATURE ABOVE: LocallySymmetric.iwahori
Iw_v as a compact open subgroup of GL_n(O_v), with Iw_v ⊃ Iw_{v,1} = iwahoriOne.

OMITTED SIGNATURE: LocallySymmetric.gamma0
Γ_0(v^c) as a compact open subgroup of PGL_2(O_v), equivalently upper-triangular reduction modulo
ϖ_v^c; the normalized projective representative has top-left entry 1.

OMITTED SIGNATURE: LocallySymmetric.taylorWilesLevel
K_0(Q) ⊃ K_1(Q) for a finite set Q of places where K is maximal, and the subgroup K_Δ(Q) for a
quotient Δ of Δ_Q.

OMITTED SIGNATURE: LocallySymmetric.taylorWilesLevel.quotientEquiv
K_1(Q) is normal in K_0(Q) and K_0(Q)/K_1(Q) ≅ Δ_Q = ∏_{v∈Q} k_v^×.

GENERIC SIGNATURE ABOVE: LocallySymmetric.iwahori.index
[GL_n(O_v) : Iw_v] = #(GL_n/B)(k_v) and [Iw_v : Iw_{v,1}] = (q_v − 1)^n.

OMITTED SIGNATURE: LocallySymmetric.iwahori.eq_parahoric
Iw_v and K_0(v) are the O_v-points of the parahoric group schemes of ReductiveGroupsPartII RG2.3 for
the standard alcove and the (1, n−1) facet.

GENERIC SIGNATURE ABOVE: LocallySymmetric.iwahoriOne
Iw_{v,1} is the inverse image of the upper unipotent subgroup under reduction GL_n(O_v) → GL_n(k_v);
it is normal in Iw_v, and the diagonal reduction identifies Iw_v/Iw_{v,1} with (k_v^×)^n.

OMITTED SIGNATURE: LocallySymmetric.gamma1
Γ_1(v^c) ⊂ PGL_2(O_v) is the image of matrices whose lower-left entry is 0 and whose diagonal
entries agree modulo ϖ_v^c; equivalently normalize the top-left entry to 1 and require lower-right
entry 1.

OMITTED SIGNATURE: LocallySymmetric.gammaP
Γ_p(v^c) ⊂ Γ_0(v^c) is the inverse image of the p-primary subgroup of (O_v/ϖ_v^c)^× under the ratio
of diagonal entries; Γ_1 is the kernel of that ratio. For c=1, Γ_p/Γ_1 is the p-primary subgroup of
k_v^×.

EXECUTABLE EXAMPLE ABOVE: iwahori_index_GL2 (computation)
[GL_2(Z_p) : Iw_p] = p + 1 (Iw_p is the stabilizer of a line in F_p²).

OMITTED FULL EXAMPLE: gamma0_eq_congruenceSubgroup (compatibility)
For F = ℚ and v = p, intersecting the GL_2-preimage of the projective Γ_0(p^c) with SL_2(ℤ) gives
Mathlib CongruenceSubgroup.Gamma0 (p^c). For projective Γ_1 the diagonal entries are a common unit a
with a² ≡ 1 mod p^c. For odd p this gives ±Gamma1; for p = 2 and c ≥ 3 extra solutions occur (e.g. a
= 3 mod 8), so the unqualified ±Gamma1 assertion fails.

OMITTED FULL EXAMPLE: taylorWiles_quotient_trivial_n1 (degenerate)
For Q = ∅, Δ_Q is trivial and K_0(Q) = K_1(Q) = K. For PGL_1 the ambient group is trivial and so is
its level quotient; the formula Δ_Q = ∏ k_v^× applies only to n ≥ 2.

OMITTED FULL EXAMPLE: gammaP_ne_gamma1 (non-example)
For c = 1, [Γ_p(v) : Γ_1(v)] is the p-primary part of q_v − 1; the inclusion is strict iff p divides
q_v − 1. For example p = 3, q_v = 7 gives index 3; p = 3, q_v = 5 gives equality. It is not the
prime-to-p part.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space; ReductiveGroupsPartII:RG2.3;
mathlib:Matrix.GeneralLinearGroup
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system — The orientation local system of X_K and its character

Mathematical specification:
For compact open K, the orientation local system o_K on X_K is the descent of the G(F_∞)-equivariant
orientation sheaf of X^G: the orientation character ε : G(F_∞) → {±1} sends g to the sign of
det(dg_{x₀} composed with the parallel transport back), equivalently ε(g) = sign det(Ad(g) | 𝔭/𝔞_G)
computed after moving g into K_∞A_∞ by the Cartan decomposition (ε is trivial on the identity
component and ε(k) = sign det(Ad(k)|𝔭) for k ∈ K_∞). Then o_K = (X^G × G(A^∞)/K × ℤ(ε))/G(F) with
G(F) acting on ℤ(ε) through ε, a rank-one local system of ℤ-modules on the orbifold X_K; at neat
level it is the orientation local system of the manifold X_K of Tau Ceti's AlgebraicTopology stage
6. For G = Res_{F/ℚ}GL_m, ε(γ) = sign(N_{F/ℚ} det γ)^{m−1} for γ ∈ GL_m(F).

OMITTED SIGNATURE: LocallySymmetric.orientationCharacter
ε : G(F_∞) → {±1}, the action of G(F_∞) on the orientations of X^G.

OMITTED SIGNATURE: LocallySymmetric.orientationSystem
o_K, the rank-one local system on X_K descended from ℤ(ε).

OMITTED SIGNATURE: LocallySymmetric.orientationSystem.monodromy
On Γ_i\X^G, the coefficient action is ε|Γ_i. Fix the endpoint convention of localSystem.monodromy: a
lifted loop ends at δ(ℓ)x₀, and its Tau Ceti monodromy is ε(δ(ℓ)⁻¹)=ε(δ(ℓ)).

OMITTED SIGNATURE: LocallySymmetric.orientationSystem.pullback
π_{K′,K}^* o_K ≅ o_{K′} and r_g^* o_K ≅ o_{gKg⁻¹}.

OMITTED SIGNATURE: LocallySymmetric.orientationSystem.eq_manifold
At neat level o_K is isomorphic to the orientation local system of the manifold X_K from Tau Ceti's
AlgebraicTopology stage 6.

OMITTED SIGNATURE: LocallySymmetric.orientationCharacter_GL
For G = Res_{F/ℚ}GL_m, ε(γ) = sign(N_{F/ℚ}(det γ))^{m−1}.

OMITTED FULL EXAMPLE: orientationCharacter_GL2_Q (computation)
For G = GL_{2,ℚ}, ε(g) = sign det g: diag(−1, 1) acts on ℍ by z ↦ −z̄, reversing orientation.

OMITTED FULL EXAMPLE: orientationCharacter_connected (degenerate)
If G(F_∞) is connected (e.g. GL_n or PGL_n over an imaginary CM field), ε is trivial and o_K ≅ ℤ for
every K.

OMITTED FULL EXAMPLE: orientationSystem_GL_formula (characterisation)
For γ ∈ GL_m(O_F), ε(γ) = sign(N_{F/ℚ} det γ)^{m−1}; for m odd ε is trivial.

OMITTED FULL EXAMPLE: orientation_not_trivial_at_neat_PGL2 (non-example)
Neat level does not force orientability: for G = PGL_{2,ℚ} and K = K(5)K(13)∏_{p≠5,13}PGL_2(Z_p),
the class of (57, 455; 455, 3632) (det −1) lies in Γ_{1,K} and ε of it is −1 (see
nonorientable-neat-example).

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold;
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality;
tauceti:TauCeti.LocalCoefficientSystem;
tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.0/nonorientable-neat-example — A nonorientable neat arithmetic quotient for PGL_2 over ℚ

Mathematical specification:
Let G = PGL_{2,ℚ}, so X^G ≅ ℍ with PGL_2(ℝ) acting holomorphically for det > 0 and
antiholomorphically for det < 0. Let K = K(5)·K(13)·∏_{p≠5,13} PGL_2(Z_p) with K(p) = ker(PGL_2(Z_p)
→ PGL_2(F_p)). Then K is neat, and γ = [(57, 455; 455, 3632)] ∈ PGL_2(ℚ) (det = −1, the matrix ≡
57·I mod 65 with 57² ≡ −1 mod 65) lies in Γ_{1,K} = PGL_2(ℚ) ∩ K and reverses orientation. Hence the
component Γ_{1,K}\ℍ of X_K is a nonorientable surface and o_K is nontrivial. In contrast, at the
non-neat level GL_2(Ẑ) for GL_{2,ℚ}, the orbifold X_K has nontrivial orientation character det on
GL_2(ℤ), while every neat level of GL_{2,ℚ} (or of Res_{F/ℚ}GL_m) gives an orientable X_K, since
neatness forces N_{F/ℚ} det γ = 1.

OMITTED theorem signature: LocallySymmetric.nonorientable_neat_example.

Earlier interface needed:
AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan
involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient
and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and
congruence-preimage forms do not supply those hypotheses.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system;
ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold; AdelicAlgebraicGroups:AA.4/neat-element;
ArithmeticLocallySymmetricSpaces:ALS.0/neatness-iwahori-criterion
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system — Arithmetic local systems from coefficient modules

Mathematical specification:
Let R be a commutative ring, S a finite set of finite places, K = K_S K^S a compact open subgroup
and V an R-module with commuting actions of G(F) and of K_S (an R[G(F) × K_S]-module), finite free
(or finite projective) over R. Pull V back from a point to a G(F) × G^S × K_S-equivariant sheaf on
X^G × G(A^∞)^δ (G(F) acting through its action on V, G^S trivially, K_S through its action on V),
descend along the free G(F)-action to a G^S × K_S-equivariant sheaf V on 𝔛_G, and, for K neat, along
the free K-action to a sheaf V_K on X_K. Concretely V_K is the sheaf of locally constant sections of
G(F)\(X^G × G(A^∞) × V)/K → X_K with commuting left G(F)-action and right K-action (x,g,v) ↦
(γx,γgk,γ·k_S⁻¹·v); this is not written as a left action of G(F) × K with its ordinary product law.
On the component Γ_i\X^G it is the local system with Γ_i-equivariant coefficient representation Γ_i
→ Aut_R(V), γ ↦ ρ_{G(F)}(γ)ρ_{K_S}((g_i⁻¹γg_i)_S). Fix x₀ and lift a loop ℓ at its image in Γ_i\X^G
from x₀ to δ(ℓ)x₀. Tau Ceti multiplies loops by g*h=h followed by g, so δ is an antihomomorphism to
Γ_i (a homomorphism to Γ_iᵐᵒᵖ). In the diagonal associated bundle (γx,ρ_Γ(γ)v)∼(x,v), parallel
transport sends v to ρ_Γ(δ(ℓ)⁻¹)v. This inverts the entire slice representation, not only the K_S
factor, and is a homomorphism for Tau Ceti’s multiplication. Two cases are used: V an R[K_S]-module
with trivial G(F)-action (p-adic weights, NT16's M_G), and V an R[G(F)]-module with trivial
K_S-action (rational representations); for an algebraic representation the two agree after inverting
p.

OMITTED SIGNATURE: LocallySymmetric.localSystem
V ↦ V_K, the sheaf on X_K (neat K), and V ↦ V_𝔛, the G^S × K_S-equivariant sheaf on 𝔛_G (any K).

OMITTED SIGNATURE: LocallySymmetric.localSystem.stalk
The stalk of V_K at [x, g] is identified with V; changing the representative by (γ, k) acts by
γ·k_S⁻¹.

OMITTED SIGNATURE: LocallySymmetric.localSystem.monodromy
Fix x₀ and lift a loop ℓ at its image in Γ_i\X^G from x₀ to δ(ℓ)x₀. Tau Ceti multiplies loops by
g*h=h followed by g, so δ is an antihomomorphism to Γ_i (a homomorphism to Γ_iᵐᵒᵖ). In the diagonal
associated bundle (γx,ρ_Γ(γ)v)∼(x,v), parallel transport sends v to ρ_Γ(δ(ℓ)⁻¹)v. This inverts the
entire slice representation, not only the K_S factor, and is a homomorphism for Tau Ceti’s
multiplication.

OMITTED SIGNATURE: LocallySymmetric.localSystem.map
An R[G(F) × K_S]-linear map V → W induces V_K → W_K, functorially (identity and composition), exact
in V.

OMITTED SIGNATURE: LocallySymmetric.localSystem.tensor
(V ⊗_R W)_K ≅ V_K ⊗_R W_K and Hom_R(V, W)_K ≅ ℋom(V_K, W_K); in particular (V^∨)_K ≅ ℋom(V_K, R).

OMITTED SIGNATURE: LocallySymmetric.localSystem.pullback
π_{K′,K}^* V_K ≅ V_{K′} for K′ ⊂ K and r_g^* V_K ≅ V_{gKg⁻¹} with the action of g_S on V when g ∈
G_S.

OMITTED SIGNATURE: LocallySymmetric.localSystem.constant
For V = R with trivial actions, V_K is the constant sheaf R (Tau Ceti's constantFunctor on each
component).

OMITTED FULL EXAMPLE: localSystem_trivial (degenerate)
For V = R with trivial G(F)- and K_S-actions, V_K ≅ the constant sheaf R_{X_K}.

OMITTED FULL EXAMPLE: localSystem_monodromy_GL1 (computation)
For G = GL_{1,F} with F real quadratic and V = R(χ), χ the sign of the first real embedding on F^×,
the monodromy on the circle O_F^{×}∩K\ℝ is χ of a generator; it is −1 exactly when the generator is
negative at that embedding.

OMITTED FULL EXAMPLE: localSystem_eq_LocalCoefficientSystem (compatibility)
At neat level the construction gives TauCeti.LocalCoefficientSystem via the above whole-inverse
endpoint convention. For K-factor matrices A=(1,1;0,1), B=(1,0;1,1), AB≠BA and (AB)⁻¹=B⁻¹A⁻¹≠A⁻¹B⁻¹;
the convention still gives a homomorphism, whereas inverting only one factor in the ordinary slice
product fails.

OMITTED FULL EXAMPLE: localSystem_not_constant_of_trivial_stalk (non-example)
A rank-one system may have trivial stalks and nontrivial monodromy. At non-neat GL_2(Ẑ), R(sign det)
is an orbifold coefficient system; it is not asserted to descend to a local system on the coarse
quotient. A manifold example is the real-quadratic GL_1 sign character in localSystem_monodromy_GL1.

Earlier interface needed:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold;
ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space;
SchemeAndStackFoundations:key/equivariant-sheaf-cohomology; tauceti:TauCeti.LocalCoefficientSystem;
tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation;
tauceti:TauCeti.CoveringSpace.monodromyEquivalence;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes — Betti complexes RΓ(X_K, V), RΓ_c(X_K, V) and their equivariant models

Mathematical specification:
For compact open K choose a normal finite-index neat K₀⊂K, put Q=K/K₀, Y=X_{K₀} and let Ȳ=X̄_{K₀} be
its compact Borel–Serre closure with the Q-action and equivariant coefficient extension V̄. The
objects C=RΓ(Ȳ,V̄), C_c=RΓ(Ȳ,j_!V), C_∂=RΓ(∂Ȳ,i^*V̄) live in D(R[Q]), obtained from equivariant
sheaves before forgetting Q. Define RΓ(X_K,V)=RΓ(Q,C), RΓ_c(X_K,V)=RΓ(Q,C_c), RΓ(∂X̄_K,V)=RΓ(Q,C_∂).
At neat K these agree with ordinary sheaf cohomology and compact support by free descent and the
interior homotopy equivalence. At arbitrary K they compute groupoid cohomology, not coarse
cohomology; group invariants are derived and can be unbounded. For K′⊲K choose K₀⊂K′ and define
RΓ_{K/K′}(X_{K′},V)=RΓ(K′/K₀,C) in D(R[K/K′]) using the equivariant derived functor, with analogous
support and boundary objects. Intersecting two choices of K₀ and composing derived invariants gives
canonical choice-independence and refinement compatibilities. For ordinary cohomology this agrees
with NT16’s discrete equivariant model RΓ(K,RΓ(𝔛_G,V_𝔛)).

OMITTED SIGNATURE: LocallySymmetric.RΓ
RΓ(X_K,V)=RΓ(Q,RΓ(Ȳ,V̄)) in D(R), Q=K/K₀ for a neat normal refinement; naturally identified with the
ordinary NT16 equivariant invariant-sections model.

OMITTED SIGNATURE: LocallySymmetric.RΓc
RΓ_c(X_K,V)=RΓ(Q,RΓ(Ȳ,j_!V)) in D(R), independent of the chosen neat normal refinement by
equivariant finite-cover descent; at neat K this is ordinary compact support.

OMITTED SIGNATURE: LocallySymmetric.RΓrel
For K₀⊂K′⊲K, RΓ_{K/K′}(X_{K′},V)=RΓ(K′/K₀,RΓ(Ȳ,V̄)) in D(R[K/K′]); the residual action is retained
in the equivariant derived construction.

OMITTED SIGNATURE: LocallySymmetric.RΓ.isoSheafCohomology
For neat K, RΓ(X_K, V) ≅ RΓ(X_K, V_K) (sheaf cohomology, Mathlib's Sheaf.H in degree i).

OMITTED SIGNATURE: LocallySymmetric.RΓrel.forget
The image of RΓ_{K/K′}(X_{K′}, V) under D(R[K/K′]) → D(R) is RΓ(X_{K′}, V).

OMITTED SIGNATURE: LocallySymmetric.RΓc.forgetSupports
The natural map RΓ_c(X_K, V) → RΓ(X_K, V).

OMITTED SIGNATURE: LocallySymmetric.RΓ.map
V ↦ RΓ(X_K, V) and V ↦ RΓ_c(X_K, V) are triangulated functors of V (short exact sequences of
coefficient modules give triangles).

OMITTED FULL EXAMPLE: RΓ_point (degenerate)
If X_K is a finite set of points (G a torus with T(ℝ)/A_∞ compact), RΓ(X_K, V) = ⊕_{x} V^{Stab(x)}
concentrated in degree 0 for |Stab(x)| invertible in R.

OMITTED FULL EXAMPLE: H1_modularCurve_levelGamma1_5 (computation)
For G = SL_{2,ℚ} (A_G trivial) at the neat level giving Γ_1(5)\ℍ (a sphere minus four cusps), H^0 =
R, H^1 ≅ R^3, H^i = 0 for i ≥ 2, and H^1_c ≅ R^3, H^2_c ≅ R.

OMITTED FULL EXAMPLE: RΓ_eq_groupCohomology_levelOne (compatibility)
For G = SL_{2,ℚ} and K = SL_2(Ẑ), H^i(X_K, ℤ) is group cohomology H^i(SL_2(ℤ), ℤ): ℤ, 0, ℤ/12, 0,
ℤ/12, … (2-periodic from degree 2), not the cohomology of the coarse space SL_2(ℤ)\ℍ ≅ ℂ.

OMITTED FULL EXAMPLE: RΓ_ne_coarse (non-example)
At non-neat level H^*(X_K, ℤ) differs from the singular cohomology of the coarse quotient: for
SL_2(ℤ), H^2(X_K, ℤ) = ℤ/12 while H^2(SL_2(ℤ)\ℍ, ℤ) = 0.

Earlier interface needed:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system;
SchemeAndStackFoundations:key/equivariant-sheaf-cohomology; mathlib:DerivedCategory;
mathlib:CategoryTheory.Sheaf.H; ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact;
SchemeAndStackFoundations:SF.2/linearized-sheaf; SchemeAndStackFoundations:SF.2/enough-injectives;
SchemeAndStackFoundations:SF.2/invariants-acyclic; SchemeAndStackFoundations:SF.2/support;
SchemeAndStackFoundations:SF.2/localization
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison — Sheaf cohomology of arithmetic local systems agrees with singular cochains

Mathematical specification:
For neat K and V finite projective, there are natural isomorphisms in D(R) RΓ(X_K, V_K) ≅ C^•(X_K;
V_K) and RΓ_c(X_K, V_K) ≅ C^•_c(X_K; V_K) := colim_C C^•(X_K, X_K ∖ C; V_K) (C compact), where C^•
are the singular cochains with local coefficients of Tau Ceti's AlgebraicTopology stages 2 and 6;
they are compatible with pullback along level maps and translations, with the forget-supports map,
and, on X̄_K (ALS.2), with the relative cochains of the pair (X̄_K, ∂X̄_K). Equivalently, writing X̃
= X^G × G(A^∞)/K′ for the universal-cover side, RΓ(X_K, V_K) ≅ Hom_{ℤ[Γ_i]}(C_•(X^G), V) on each
component.

OMITTED theorem signature: LocallySymmetric.sheaf_singular_comparison.

Earlier interface needed:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes;
ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality;
mathlib:AlgebraicTopology.singularChainComplexFunctor; tauceti:TopPair.singularChainComplexFunctor
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison — Betti cohomology as group cohomology of the arithmetic groups

Mathematical specification:
For every compact open K (neat or not) and V finite projective over R there is a natural isomorphism
RΓ(X_K, V) ≅ ⊕_{i=1}^s RΓ(Γ_i, V), with Γ_i = G(F) ∩ g_iKg_i⁻¹ acting on V by γ ↦
ρ_{G(F)}(γ)ρ_{K_S}((g_i⁻¹γg_i)_S), as the slice representation of arithmetic-local-system and
RΓ(Γ_i, −) group cohomology (Mathlib's groupCohomology in each degree). At neat level each Γ_i\X^G
is a K(Γ_i, 1) and this is the comparison of the sheaf cohomology of the local system with group
cohomology. In particular H^*(X_K, V) is the orbifold cohomology of X_K, and differs from the
cohomology of the coarse quotient by terms killed by the orders of the stabilizers: if every
stabilizer order is invertible in R, H^*(X_K, V) ≅ H^*(Γ\X^G, (π_*V)^stabilizer). When stabilizer
orders are invertible, the invariant pushforward to the coarse quotient is generally a constructible
sheaf; it is a local system only under an additional descent condition such as trivial stabilizer
action on the fibres.

OMITTED theorem signature: LocallySymmetric.group_cohomology_comparison.

Earlier interface needed:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes;
ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition;
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible; mathlib:groupCohomology;
mathlib:Rep
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model — Bounded finite projective models from a finite equivariant cell structure

Mathematical specification:
Suppose the Borel–Serre closure of X^G × G(A^∞)^δ has a G(F) × K-invariant cell structure with
finitely many cell orbits and trivial cell stabilizers for the full group G(F) × K, as at good neat
K. For K′ normal in K, its cellular chains C_• are bounded finite free ℤ[G(F) × K]-modules. For
finite projective R-coefficients V, RΓ_{K/K′}(X_{K′}, V) is computed by Hom_{ℤ[G(F)×K′]}(C_•, V), a
bounded finite projective R[K/K′]-complex. Hence it is perfect over R[K/K′]; for K′ = K, RΓ(X_K, V)
is perfect over R with amplitude in [0,d_G]. The analogous relative cell model computes RΓ_c.
Freeness only for G(F) × K′ does not imply perfectness over R[K/K′] when K has stabilizers.

OMITTED theorem signature: LocallySymmetric.finite_complex_model.

Earlier interface needed:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes;
ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations;
DeformationAndDerivedPatchingAlgebra:P7/perfect-object; mathlib:Module.Projective
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change — Derived coefficient change and the universal-coefficient spectral sequence

Mathematical specification:
Let R be noetherian, R → R′ a ring map, K neat and V a finite projective R-module with
R[G(F)×K_S]-action (or, more generally, a bounded complex of such of uniform Tor-amplitude in [a,
b]). Then (i) RΓ(X_K, V) ⊗^L_R R′ ≅ RΓ(X_K, V ⊗_R R′) and RΓ_c(X_K, V) ⊗^L_R R′ ≅ RΓ_c(X_K, V ⊗_R
R′) naturally in D(R′), compatibly with level maps; (ii) there is a convergent spectral sequence
E_2^{i,j} = Tor^R_{−i}(H^j(X_K, V), R′) ⇒ H^{i+j}(X_K, V ⊗_R R′), with every Tor term present; for
R′ = R/ϖ^m and R a discrete valuation ring it degenerates to the short exact sequences 0 → H^j(X_K,
V)/ϖ^m → H^j(X_K, V/ϖ^m) → H^{j+1}(X_K, V)[ϖ^m] → 0. Torsion-free cochains do not imply torsion-free
cohomology: H^{j+1}(X_K, V)[ϖ^m] can be nonzero.

OMITTED theorem signature: LocallySymmetric.coefficient_change.

Earlier interface needed:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model;
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes;
DeformationAndDerivedPatchingAlgebra:P7/perfect-object; mathlib:Module.Flat;
mathlib:DerivedCategory; ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback — Pullback and translation on Betti complexes

Mathematical specification:
For K′ ⊂ K compact open and g ∈ G(A^∞) define in D(R): the pullback π^*_{K′,K} : RΓ(X_K, V) →
RΓ(X_{K′}, V) (restriction of derived invariants from K to K′, equal to sheaf pullback along
π_{K′,K} at neat level), and the translation r_g^* : RΓ(X_K, V) → RΓ(X_{gKg⁻¹}, V) induced by the
isomorphism of equivariant sheaves V_𝔛 ≅ g^*V_𝔛 (for g ∈ G^S; for g_S ≠ 1 one needs V to carry a
compatible action of a monoid containing g_S). They satisfy π^*_{K″,K′} ∘ π^*_{K′,K} = π^*_{K″,K},
r_h^* ∘ r_g^* = r_{hg}^*, r_k^* = id for k ∈ K, and r_g^* ∘ π^* = π^* ∘ r_g^*; the same maps exist
on RΓ_c (proper level maps at neat level) and on RΓ_{K/K′}.

OMITTED SIGNATURE: LocallySymmetric.RΓ.pullback
π^*_{K′,K} : RΓ(X_K, V) → RΓ(X_{K′}, V), with pullback_id and pullback_comp.

OMITTED SIGNATURE: LocallySymmetric.RΓ.translate
r_g^* : RΓ(X_K, V) → RΓ(X_{gKg⁻¹}, V) with translate_one, translate_mul and translate_of_mem (r_k^*
= id for k ∈ K).

OMITTED SIGNATURE: LocallySymmetric.RΓ.translate_pullback
r_g^* ∘ π^*_{K′,K} = π^*_{gK′g⁻¹, gKg⁻¹} ∘ r_g^*.

OMITTED SIGNATURE: LocallySymmetric.RΓ.pullback_eq_sheafPullback
At neat level π^* is the sheaf pullback along π_{K′,K} and r_g^* the pullback along r_g.

OMITTED SIGNATURE: LocallySymmetric.RΓc.pullback
The same maps on RΓ_c (level maps are proper at neat level), commuting with forget-supports.

OMITTED FULL EXAMPLE: pullback_H0 (computation)
In degree 0, π^*_{K′,K} : R^{π_0(X_K)} → R^{π_0(X_{K′})} is the map induced by π_0(π_{K′,K}) (each
component pulled back to the union of the components over it).

OMITTED FULL EXAMPLE: translate_of_mem (degenerate)
For k ∈ K, r_k^* = id on RΓ(X_K, V).

OMITTED FULL EXAMPLE: pullback_injective_rational (characterisation)
If K is neat and [K : K′] is invertible in R then π^* is split injective on H^*, with left inverse
[K : K′]⁻¹·(trace) (see ALS.3/level-trace).

OMITTED FULL EXAMPLE: pullback_not_iso (non-example)
π^* is not an isomorphism in general: for GL_{2,ℚ}, π^* : H^1(X_{K(3)}, ℚ) → H^1(X_{K(9)}, ℚ) has a
nonzero cokernel (the genus grows).

Earlier interface needed:
Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear
equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports
with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison.
These are needed before geometric RΓ, supported RΓ, and finite models can be named.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes;
ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology;
tauceti:TauCeti.LocalCoefficientSystem.pullback
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face — Geodesic action and the boundary face e(P)

Mathematical specification:
Let 𝐆 = Res_{F/ℚ}G and P a rational parabolic subgroup of 𝐆 (equivalently an F-parabolic of G) with
unipotent radical N_P and Levi quotient L_P = P/N_P. Let S_P be the maximal ℚ-split central torus of
the Levi quotient L_P, modulo the image of the maximal ℚ-split central torus of 𝐆 (equivalently the
split-radical quotient Rd(P)/(R_u(P)·Rd(𝐆)) in NT16's convention), and A_P = S_P(ℝ)°. For x ∈ X^G
let L′_x ⊂ P_ℝ be the unique Levi subgroup stable under the Cartan involution attached to the
maximal compact subgroup of Stab(x). The geodesic action of A_P on X^G is a • x = a_x·x with a_x ∈
L′_x(ℝ) the lift of a; it is free, commutes with P(ℝ) and with the action of P(ℚ). The boundary face
is e(P) = A_P\X^G, a space of type S−Q for P, with e(P) ≅ N_P(ℝ) × X_{L_P} (X_{L_P} the symmetric
space of L_P with its own split centre already removed) via a choice of horospherical
trivialization; transport the P(ℝ)-action to this product (the Levi action includes the conjugation
action on N_P); dim e(P) = d_G − dim A_P. For P = 𝐆, e(𝐆) = X^G.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.geodesicAction
The action A_P × X^G → X^G, (a, x) ↦ a • x.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.geodesicAction_free
The geodesic action is free and proper, and commutes with the left action of P(ℝ).

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.face
e(P) = A_P\X^G with its P(ℝ)-action (a space of type S−Q for P).

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.faceEquiv
A horospherical trivialization identifies e(P) with N_P(ℝ) × X_{L_P}; transport the P(ℝ)-action to
this product, including the Levi conjugation action on N_P.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.face_conj
For γ ∈ 𝐆(ℚ)=G(F), x ↦ γx induces e(P) ≅ e(γPγ⁻¹) compatibly with the geodesic actions.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.face_dim
dim e(P) = d_G − dim A_P.

OMITTED FULL EXAMPLE: face_SL2_borel (computation)
For SL_{2,ℚ} and the upper triangular Borel B, e(B) ≅ N_B(ℝ) ≅ ℝ (X_{L_B} is a point) and dim e(B) =
2 − 1 = 1.

OMITTED FULL EXAMPLE: face_whole_group (degenerate)
For P = 𝐆, A_P = 1 (in this convention A_𝐆 is already divided out) and e(𝐆) = X^G.

OMITTED FULL EXAMPLE: face_GL3_minimal (computation)
For GL_{3,ℚ} and the Borel B, A_B ≅ ℝ_{>0}², X^G has dimension 5 and e(B) ≅ N_B(ℝ) (a Heisenberg
group, dimension 3) has dimension 5 − 2 = 3.

OMITTED FULL EXAMPLE: geodesicAction_ne_leftAction (non-example)
The geodesic action is not the left action of A_P ⊂ P(ℝ) through a fixed Levi: for SL_{2,ℚ} the left
action of diag(a, a⁻¹) on ℍ, z ↦ a²z, moves horizontally displaced points along rays through 0,
whereas the geodesic action moves every point vertically.

Earlier interface needed:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
AC.3 nilmanifold carrier; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space;
ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution;
AdelicAlgebraicGroups:AA.3/horospherical-decomposition;
AdelicAlgebraicGroups:AA.3/minimal-parabolic-data; tauceti:TauCeti.Cocharacter.parabolic;
tauceti:TauCeti.Cocharacter.leviDecompositionMulEquiv
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification — The Borel–Serre partial compactification X̄^G

Mathematical specification:
As a set X̄^G=⊔_{P rational parabolic, including G} e(P), with e(G)=X^G. For Δ_P the simple relative
roots, let Ā_P=(0,∞]^{Δ_P}; reciprocals of the root coordinates identify it analytically with
[0,∞)^{Δ_P}. The associated corner X^G(P)=X^G×^{A_P}Ā_P is an analytic manifold with corners and
equals ⊔_{Q⊇P}e(Q). If P⊂Q, the root-factorization A_P=A_{P,Q}×A_Q gives the analytic open embedding
X^G(Q)→X^G(P) of Borel–Serre 5.3. Glue these embeddings: X^G(P)∩X^G(Q)=X^G(R), where R is the
smallest rational parabolic containing P and Q (R may be G). This is an atlas of open corners, with
cocycle identities from the root-factorizations. The interior is X^G; closure(e(P))=⊔_{Q⊂P}e(Q), and
e(P) meets closure(e(Q)) exactly when P⊂Q. The rational action extends analytically by
γe(P)=e(γPγ⁻¹). The inclusion of the interior is a homotopy equivalence, so X̄^G is contractible.
Set 𝔛̄_G=G(F)\(X̄^G×G(A^∞)^δ), X̄_K=G(F)\(X̄^G×G(A^∞)/K), with boundary the union of
proper-parabolic faces.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.bordification
X̄^G as a topological space (manifold with corners) containing X^G as an open dense subset.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.corner
X^G(P)=⊔_{Q⊇P}e(Q)≅X^G×^{A_P}Ā_P is open; X(P)∩X(Q)=X(R) for the smallest rational parabolic R
containing P,Q. Nested embeddings are analytic and satisfy the cocycle identity.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.boundary
∂X̄^G = ⊔_{P proper} e(P), closed in X̄^G.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.closure_face
The closure of e(P) in X̄^G is ⊔_{Q ⊂ P} e(Q).

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.smul
𝐆(ℚ)=G(F) acts analytically on X̄^G extending its action on X^G, with γ·e(P) = e(γPγ⁻¹).

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.contractible
X̄^G is contractible and the inclusion X^G → X̄^G is a homotopy equivalence.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.adelic
X̄_K = G(F)\(X̄^G × G(A^∞)/K) and ∂X̄_K, with the open immersion j_K : X_K → X̄_K.

OMITTED FULL EXAMPLE: bordification_SL2 (computation)
For SL_{2,ℚ}, ∂X̄ = ⊔_{c∈ℙ¹(ℚ)} e(P_c) with each e(P_c) ≅ ℝ, and SL_2(ℤ)\∂X̄ is a single circle (one
cusp, the circle N(ℤ)\N(ℝ)).

OMITTED FULL EXAMPLE: bordification_anisotropic (degenerate)
If G is anisotropic over F (no proper F-parabolics), X̄^G = X^G and ∂X̄^G = ∅.

OMITTED FULL EXAMPLE: bordification_interior (characterisation)
The interior is X^G and e(P) has codimension |Δ_P| in X^G(P). For two distinct minimal parabolics of
SL₂, their open corners intersect in X^G=X^G(G), although their boundary faces are disjoint.

OMITTED FULL EXAMPLE: bordification_ne_onePoint (non-example)
X̄_K is not the one-point (or Baily–Borel) compactification: for a modular curve each cusp is
replaced by a circle, so the boundary has Euler characteristic 0 and H^1(∂X̄_K, ℤ) has rank equal to
the number of cusps.

Earlier interface needed:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
AC.3 nilmanifold carrier; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face; mathlib:ModelWithCorners;
mathlib:ContractibleSpace; AdelicAlgebraicGroups:AA.3/positive-root-coordinates
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact — Compactness of the Borel–Serre quotient and the interior homotopy equivalence

Mathematical specification:
Every arithmetic subgroup Γ ⊂ 𝐆(ℚ) acts properly discontinuously on X̄^G with compact Hausdorff
quotient Γ\X̄^G. Consequently, for every compact open K, X̄_K is compact Hausdorff; if K is neat,
X̄_K is a compact smooth manifold with corners with interior X_K and boundary ∂X̄_K, and the
inclusion j_K : X_K → X̄_K is a homotopy equivalence. At neat K, ∂X̄_K = X̄_K ∖ X_K is a compact
topological manifold of dimension d_G − 1; its original corner strata give a finite stratification,
rather than a smooth boundary obtained by treating intersecting faces as disjoint (empty iff G is
F-anisotropic modulo centre).

OMITTED theorem signature: LocallySymmetric.BorelSerre.compactSpace_adelic.

Earlier interface needed:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
AC.3 nilmanifold carrier; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification;
ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition;
ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold;
AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover; AdelicAlgebraicGroups:AA.3/finitely-many-cusps;
AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation — Finite triangulations and finiteness of Betti cohomology

Mathematical specification:
For neat K, X̄_K admits a finite triangulation, and it pulls back to a G(F) × K-invariant
triangulation of X̄^G × G(A^∞) with finitely many orbits of simplices and free action of G(F) × K′
for every neat K′ ⊂ K. Consequently: (i) X_K has the homotopy type of a finite CW complex; (ii) for
K′ ⊂ K normal and both neat and V finite projective over a noetherian ring R, RΓ_{K/K′}(X_{K′}, V)
and RΓ_{c,K/K′}(X_{K′}, V) are perfect in D(R[K/K′]) and RΓ(X_K, V), RΓ_c(X_K, V), RΓ(∂X̄_K, V) are
perfect in D(R); (iii) H^*(X_K, V) and H^*_c(X_K, V) are finitely generated R-modules, zero outside
[0, d_G].

OMITTED theorem signature: LocallySymmetric.BorelSerre.finite_relative_triangulation.

Earlier interface needed:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
AC.3 nilmanifold carrier; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact;
ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations;
DeformationAndDerivedPatchingAlgebra:P7/perfect-object;
tauceti:TauCetiRoadmap/GeometricTopology#layer-11-triangulations-pl-structures-and-collapse
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification — The stratification of the Borel–Serre boundary by parabolic classes

Mathematical specification:
Let P_1, …, P_s represent the G(F)-conjugacy classes of proper F-parabolic subgroups of G. For a
rational parabolic P put 𝔛_P = P(F)\(e(P) × P(A^∞)^δ) and, for compact open K, X^P_K = P(F)\(e(P) ×
G(A^∞)/K). The maps j_{P_i} : Ind_{P_i^∞}^{G^∞} 𝔛_{P_i} = P_i(F)\(G(A^∞) × e(P_i)) → ∂𝔛̄_G are
G(A^∞)-equivariant locally closed immersions and ⊔_i Ind 𝔛_{P_i} → ∂𝔛̄_G is a continuous bijection;
at level K, ⊔_i X^{P_i}_K → ∂X̄_K is a continuous bijection onto a finite stratification by locally
closed strata, the stratum of P lying in the closure of that of Q iff P is conjugate into Q. For P
maximal, X^P_K is open in ∂X̄_K. X^P_K decomposes further over P(F)\G(A^∞)/K into quotients Γ_P\e(P)
with Γ_P = P(F) ∩ gKg⁻¹.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratum
X^P_K = P(F)\(e(P) × G(A^∞)/K) with its locally closed immersion j_P : X^P_K → ∂X̄_K (depending only
on the G(F)-class of P up to isomorphism).

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratum_bijective
⊔_{i} X^{P_i}_K → ∂X̄_K is a continuous bijection, P_i running over representatives of G(F)-classes
of proper parabolics.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratum_closure
The closure of the stratum of P is the union of the strata of the parabolics conjugate into P.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratum_isOpen_of_maximal
For P maximal, j_P is an open immersion.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratum_components
X^P_K ≅ ⊔_{g ∈ P(F)\G(A^∞)/K} Γ_{P,g}\e(P) with Γ_{P,g} = P(F) ∩ gKg⁻¹.

OMITTED FULL EXAMPLE: stratum_SL2_cusps (computation)
For SL_{2,ℚ} at neat level K, the strata are the cusps of X_K, each a circle Γ_N\N(ℝ) ≅ ℝ/ℤ·h (h the
cusp width).

OMITTED FULL EXAMPLE: stratum_anisotropic_empty (degenerate)
If G has no proper F-parabolic, there are no strata and ∂X̄_K = ∅.

OMITTED FULL EXAMPLE: stratum_GL3_poset (characterisation)
For GL_{3,F} there are three classes of proper parabolics (two maximal, one Borel); the Borel
stratum lies in the closure of both maximal strata, which are open in ∂X̄_K.

OMITTED FULL EXAMPLE: stratum_not_disjoint_union_topologically (non-example)
∂X̄_K is not the topological disjoint union of the strata: for GL_3 the closure of a maximal stratum
meets the Borel stratum, so the bijection ⊔ X^{P_i}_K → ∂X̄_K is not a homeomorphism.

Earlier interface needed:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
AC.3 nilmanifold carrier; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact;
AdelicAlgebraicGroups:AA.3/finitely-many-cusps;
AdelicAlgebraicGroups:AA.3/parabolic-double-cosets-finite;
AdelicAlgebraicGroups:AA.3/minimal-parabolic-data
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration — Boundary strata fibre over Levi quotients with nilmanifold fibres

Mathematical specification:
Let P = M ⋉ N be a rational parabolic. Distinguish the P-space Y^P_L = P(F)\(e(P) × P(A^∞)/L) from
the induced G-stratum X^P_K of boundary-stratification. The latter decomposes over representatives g
of P(A^∞)\G(A^∞)/K as a disjoint union of Y^P_{L_g}, where L_g = P(A^∞) ∩ gKg⁻¹. For each good neat
L_g decomposed as L_{M,g} ⋉ L_{N,g}, the projection e(P) ≅ N(ℝ) × X_M → X_M induces a proper
submersion Y^P_{L_g} → X^M_{L_{M,g}}. Here X_M already has its own split centre removed. On an
arithmetic component the fibre is the compact nilmanifold Γ_{N,g}\N(ℝ); its monodromy is induced by
the extension 1 → Γ_{N,g} → Γ_{P,g} → Γ_{M,g} → 1. The local system R^qπ_*V has stalk H^q(Γ_{N,g},
V). A global stratum with multiple g is not assigned one untransported Levi base. Nondecomposed
levels require a separate comparison after refinement.

OMITTED theorem signature: LocallySymmetric.BorelSerre.stratum_nilmanifold_fibration.

Earlier interface needed:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
AC.3 nilmanifold carrier; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification;
ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face; AdditiveCombinatorics:AC.3;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent;
AdelicAlgebraicGroups:AA.3/unipotent-class-number-one
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence — The stratification filtration of ∂X̄_K and its spectral sequence

Mathematical specification:
Let B=∂X̄_K at neat K. For p≥0 set Z_p=union of strata of relative parabolic rank ≥p+1, with Z_0=B
and Z_{r+1}=∅, and U_p=Z_p\Z_{p+1}. Put O_p=B\Z_{p+1}, O_{−1}=∅, F_p=RΓ_c(O_p,V), A_p=RΓ_c(U_p,V).
Open/closed localization gives F_{p−1}→F_p→A_p→F_{p−1}[1]. Its exact couple has
D_1^{p,q}=H^{p+q}_c(O_p,V), E_1^{p,q}=⊕_{rk P=p+1}H^{p+q}_c(X^P_K,V), i of bidegree (1,−1), j of
bidegree (0,0), k of bidegree (−1,2). Thus d_r has bidegree (−r,r+1), and finite convergence gives
H^{p+q}(B,V) with the filtration induced by the O_p. Reindexing (s,t)=(−p,q+2p) preserves s+t=p+q
and gives the usual differential bidegree (r,1−r). Separately, for G=Res_{F/ℚ}GL_N, the ordinary
closed-cover/flag resolution of Harder–Raghuram §4.1 gives E_1^{p,q}=⊕_{[P],rk
P=p+1}H^q(X^P_K,V)⇒H^{p+q}(B,V), d_1:(p,q)→(p+1,q). Order maximal standard parabolics; its d_1 is
the alternating restriction to intersections, with sign (−1)^j when the j-th vertex is deleted.
Compactified strata and all arithmetic translates/transported levels are included in this
resolution; a single untransported Γ_P is not the global stratum. The two sequences have different
indexing and maps and are not identified by relabelling their E_1 pages. Both constructions are
finite, natural in coefficients and compatible with level maps and translations.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratFiltration
The closed filtration Z_k of ∂X̄_K by unions of strata of parabolic rank ≥ k + 1.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratSpectralSequence
The spectral sequence E_1^{p,q} = ⊕_{rk P = p+1} H^{p+q}_c(X^P_K, V) ⇒ H^{p+q}(∂X̄_K, V).

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratSpectralSequence_d1
For the compact-support exact couple, d₁:E₁^{p,q}→E₁^{p−1,q+2} is j∘k, the connecting map of
F_{p−1}→F_p→A_p followed by its quotient to A_{p−1}; it goes from higher-rank to lower-rank strata
with total degree +1.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.stratSpectralSequence_map
Natural in V and compatible with π_{K′,K} and r_g.

OMITTED SIGNATURE: LocallySymmetric.BorelSerre.mayerVietorisSpectralSequence
For Res_{F/ℚ}GL_N the ordinary flag/closed-cover sequence has E₁^{p,q}=⊕_{rk P=p+1}H^q(X^P_K,V), d₁
of bidegree (1,0), with alternating restriction signs (−1)^j from deletion in the ordered
maximal-parabolic simplex. Its global strata include all transported levels.

OMITTED FULL EXAMPLE: stratSS_SL2 (computation)
For SL_{2,ℚ} at neat level with c cusps, E_1 = E_∞ = ⊕_{c} H^*(S^1, V), so H^0(∂X̄_K, ℤ) = ℤ^c and
H^1(∂X̄_K, ℤ) = ℤ^c for trivial V.

OMITTED FULL EXAMPLE: stratSS_empty (degenerate)
For G F-anisotropic the filtration is empty and the spectral sequence is zero.

OMITTED FULL EXAMPLE: stratSS_rank_one_collapse (characterisation)
If the F-rank of G modulo centre is 1, all proper parabolics are minimal and maximal, the strata are
closed and open, and H^*(∂X̄_K, V) = ⊕_P H^*(X^P_K, V).

OMITTED FULL EXAMPLE: stratSS_E1_not_complex (non-example)
For rank ≥2 the compact-support d₁ is a localization connecting map of degree (−1,2), while the
ordinary GL_N flag d₁ is an alternating restriction of degree (1,0). The ordinary degree-zero
restriction from a connected maximal stratum to a nonempty incident Borel stratum sends 1 to 1.
Neither E₁ page alone is asserted to be the boundary cohomology.

Earlier interface needed:
AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing;
AC.3 nilmanifold carrier; E1 supported localization and a typed exact-couple/spectral-sequence
interface. Arbitrary subgroups of a Lie group are not rational parabolic data.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact;
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants — Hecke rings acting on invariants and on derived invariants

Mathematical specification:
Let Δ be a group (or monoid), U ⊂ Δ a subgroup with (Δ, U) a Hecke pair (IsHeckeTriple Δ U U), and
𝕋(Δ, U) = 𝕋 Δ U ℤ the Hecke ring (Mathlib's HeckeRing with Tau Ceti's convolution ring structure).
For a ℤ[Δ]-module M define the 𝕋(Δ, U)-module structure on M^U by [UαU]·m = Σ_i α_i m where UαU =
⊔_i α_iU; equivalently [UαU] acts as M^U → M^{U∩αUα⁻¹} → M^U, m ↦ α·m followed by the trace
tr_{U/U∩αUα⁻¹}. This defines a left exact functor Γ_U : Mod(ℤ[Δ]) → Mod(𝕋(Δ, U)) whose composite
with the forgetful functor is U-invariants, and its right derived functor RΓ_U : D⁺(ℤ[Δ]) → D⁺(𝕋(Δ,
U)) lifts RΓ(U, −). For a locally profinite G and compact open U, 𝕋(G, U) is the ring H(G, U) of
compactly supported U-biinvariant ℤ-valued functions under convolution for the Haar measure with
vol(U) = 1; over R, H(G, U) ⊗ R.

GENERIC SIGNATURE ABOVE: LocallySymmetric.Hecke.invariantsModule
M^U is a module over 𝕋(Δ, U) via [UαU]·m = Σ α_i m.

GENERIC SIGNATURE ABOVE: LocallySymmetric.Hecke.smul_eq_trace
[UαU]·m = tr_{U/U∩αUα⁻¹}(α·m) for m ∈ M^U.

GENERIC SIGNATURE ABOVE: LocallySymmetric.Hecke.invariantsFunctor
Γ_U : Mod(ℤ[Δ]) ⥤ Mod(𝕋(Δ, U)), left exact, with Γ_U ⋙ forget = U-invariants.

OMITTED SIGNATURE: LocallySymmetric.Hecke.derivedInvariants
RΓ_U : D⁺(ℤ[Δ]) → D⁺(𝕋(Δ, U)) with forget ∘ RΓ_U ≅ RΓ(U, −).

GENERIC SIGNATURE ABOVE: LocallySymmetric.Hecke.one_smul
[U1U]·m = m.

OMITTED SIGNATURE: LocallySymmetric.Hecke.eq_heckeAlgebra
For G locally profinite and U compact open, 𝕋(G, U) ≅ H(G, U) (compactly supported U-biinvariant
functions, vol(U) = 1), [UαU] ↦ 1_{UαU}.

OMITTED FULL EXAMPLE: hecke_one_smul (degenerate)
[U1U] acts as the identity on M^U, and for Δ = U the functor Γ_U is ordinary invariants.

OMITTED FULL EXAMPLE: hecke_Tp_permutation (computation)
For Δ = GL_2(ℚ_p), U = GL_2(Z_p) and M = ℤ[Δ/U] (formal sums of lattices in ℚ_p²), T_p = [U diag(p,
1) U] sends the U-fixed element [Z_p²] to Σ [L′] over the p + 1 lattices L′ ⊂ Z_p² with Z_p²/L′ ≅
F_p (the cosets α_iU of U diag(p,1) U).

EXECUTABLE EXAMPLE ABOVE: hecke_degree_eq_index (compatibility)
On the trivial module M = ℤ, [UαU] acts by the degree #(UαU/U) = [U : U ∩ αUα⁻¹] (Tau Ceti's
HeckeCoset.degree_eq_relIndex).

OMITTED FULL EXAMPLE: hecke_not_pointwise (non-example)
The action is not α·m for a single representative: on M = ℤ[Δ/U] with Δ = GL_2(ℚ_p), applying only
diag(p, 1) gives one lattice, not the sum of p + 1.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
mathlib:IsHeckeTriple; mathlib:HeckeCoset; mathlib:HeckeRing;
tauceti:HeckeCosetModule.instRingHeckeRing; tauceti:HeckeCoset.degree_eq_relIndex;
SmoothRepresentationsOfLocalGroups:SR.1; mathlib:DerivedCategory
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action — The Hecke action on RΓ(X_K, V) in the derived category

Mathematical specification:
Let S be finite, K=K_SK^S compact open, R commutative and V finite projective with commuting G(F)
and K_S actions. Derived equivariant invariant sections give a ring homomorphism
T_K:H(G^S,K^S)⊗R→End_{D(R)}(RΓ(X_K,V)), and analogous homomorphisms for compact support,
compactification and boundary. All coefficient/support maps intertwine these endomorphisms in D(R).
In the discrete NT16 setup the derived left-exact Hecke-invariants functor of
hecke-action-on-invariants also provides a lift to D⁺(H⊗R); its comparison with a chosen geometric
equivariant model must use the derived-composite acyclicity, not just equality on cohomology. For
K′⊲K with K′^S=K^S the relative object lives in D(R[K/K′]), and H⊗R acts through End_{D(R[K/K′])};
applying derived K/K′ invariants recovers T_K. This relative endomorphism action is the ACC+
(2.1.5)–(2.1.6) conclusion. A strict lift to D(H⊗R[K/K′]) requires the additional compatible
enhancement requested below. The same distinction holds for monoid Hecke actions with compatible
coefficient actions.

OMITTED SIGNATURE: LocallySymmetric.heckeObject
The object RΓ(X_K,V) with its ring homomorphism H⊗R→End_D(R); the discrete derived Hecke-invariants
construction supplies a D(H⊗R) lift whose forgetful object is identified by the injective-resolution
comparison.

OMITTED SIGNATURE: LocallySymmetric.heckeAction
T_K : H(G^S, K^S) ⊗ R →+* End_{D(R)}(RΓ(X_K, V)).

OMITTED SIGNATURE: LocallySymmetric.heckeAction_c
The same for RΓ_c(X_K, V), RΓ(X̄_K, V) and RΓ(∂X̄_K, V).

OMITTED SIGNATURE: LocallySymmetric.heckeActionRel
H⊗R→End_{D(R[K/K′])}(RΓ_{K/K′}(X_{K′},V)), recovering heckeAction after RΓ(K/K′,−). A compatible
strict D(H⊗R[K/K′]) lift is an enhancement obligation, not a consequence of this homomorphism alone.

OMITTED SIGNATURE: LocallySymmetric.heckeAction_one
T_K([K]) = id.

OMITTED SIGNATURE: LocallySymmetric.heckeAction_natural
For a coefficient-linear V→W, the induced morphism in D(R) intertwines T_K(t) for every t; it is a
morphism of D(H⊗R) objects when the specified compatible lift is used.

OMITTED FULL EXAMPLE: heckeAction_one (degenerate)
T_K([K]) is the identity of RΓ(X_K, V).

OMITTED FULL EXAMPLE: heckeAction_H0 (computation)
For V = R, on H^0(X_K, R) = Fun(G(F)\G(A^∞)/K, R) the operator [KgK] is f ↦ (x ↦ Σ_i f(x g_i)) with
KgK = ⊔ g_iK.

OMITTED FULL EXAMPLE: heckeAction_modularCurve_Tp (compatibility)
For GL_{2,ℚ}, K = K_1(N), p ∤ N and V = ℂ, T_K([K diag(p,1) K]) on H^1(X_K, ℂ) agrees, under the
Eichler–Shimura isomorphism, with the classical T_p on weight-two forms (normalised by the right
coset decomposition).

OMITTED FULL EXAMPLE: heckeAction_not_on_cochains (non-example)
The geometric formulas give operators up to chain homotopy on a chosen singular cochain complex. A
ring homomorphism to End_D(R) does not by itself specify a strict D(H⊗R) lift; the latter needs the
equivariant-derived-invariants construction and its comparison.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants;
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification;
SchemeAndStackFoundations:key/equivariant-sheaf-cohomology; EnhancedDerivedSheaves:E1
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula — Hecke operators as correspondences: representative independence

Mathematical specification:
For g ∈ G^S put K_g = K ∩ gKg⁻¹ and let p_1 = π_{K_g,K} : X_{K_g} → X_K and p_2 = π_{g⁻¹K_gg,K} ∘
r_g : X_{K_g} → X_{g⁻¹K_gg} → X_K (AdelicAlgebraicGroups AA.4/hecke-correspondence). For neat K, the
image of [KgK] under T_K equals θ(g) = p_{1*} ∘ (p_1^*V ≅ p_2^*V) ∘ p_2^*, the composite RΓ(X_K, V)
→ RΓ(X_{K_g}, p_2^*V) ≅ RΓ(X_{K_g}, p_1^*V) → RΓ(X_K, V) with p_{1*} the trace of the finite
covering p_1 (level-trace). It depends only on the double coset KgK. On singular cochains
(sheaf-singular-comparison) and for KgK = ⊔_i g_iK it is given by summing the translates by the g_i
of the pulled-back cochain.

OMITTED theorem signature: LocallySymmetric.hecke_operator_formula.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action;
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace;
ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback;
ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison;
AdelicAlgebraicGroups:AA.4/hecke-correspondence;
AdelicAlgebraicGroups:AA.4/hecke-degree-double-coset
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/level-trace — Trace along level maps and the groupoid correction

Mathematical specification:
For K′ ⊂ K compact open define the trace π_{K′,K*} : RΓ(X_{K′}, V) → RΓ(X_K, V) as the corestriction
(transfer) RΓ(K′, M) → RΓ(K, M) applied to M = RΓ(𝔛_G, V_𝔛), the derived version of m ↦ Σ_{k ∈ K/K′}
k·m. At neat level it is the trace of the finite covering π_{K′,K} (Tau Ceti AlgebraicTopology stage
5 transfer; adjunction π_! = π_*, π^! = π^*), and the same construction gives traces on RΓ_c and
RΓ(∂X̄). Then π_* ∘ π^* = [K : K′] on RΓ(X_K, V) for every K′ ⊂ K, and π^* ∘ π_* = Σ_{k ∈ K/K′}
r_k^* for K′ normal in K. At non-neat level the trace is the corestriction of group cohomology of
the Γ_i (ALS.1/group-cohomology-comparison), and on cohomology of the coarse quotients the degrees
acquire the stabilizer weights of AdelicAlgebraicGroups AA.4/level-map-fibre-mass: the fibre of π
over x has Σ_{y↦x} 1/|Γ_y| = [K : K′]/|Γ_x| (up to the central correction).

OMITTED SIGNATURE: LocallySymmetric.RΓ.trace
π_{K′,K*} : RΓ(X_{K′}, V) → RΓ(X_K, V), the corestriction / covering trace.

OMITTED SIGNATURE: LocallySymmetric.RΓ.trace_pullback
π_* ∘ π^* = [K : K′]·id.

OMITTED SIGNATURE: LocallySymmetric.RΓ.pullback_trace
For K′ ⊲ K, π^* ∘ π_* = Σ_{k ∈ K/K′} r_k^*.

OMITTED SIGNATURE: LocallySymmetric.RΓ.trace_comp
π_{K′,K*} ∘ π_{K″,K′*} = π_{K″,K*}.

OMITTED SIGNATURE: LocallySymmetric.RΓ.trace_eq_coveringTransfer
At neat level the trace is the transfer of the finite covering X_{K′} → X_K (Tau Ceti
AlgebraicTopology stage 5).

OMITTED SIGNATURE: LocallySymmetric.RΓ.trace_c
Traces on RΓ_c and RΓ(∂X̄), compatible with forget-supports and restriction to the boundary.

OMITTED FULL EXAMPLE: trace_pullback_H0 (computation)
On H^0(X_K, R) = Fun(π_0(X_K), R), π_*π^* is multiplication by [K : K′].

OMITTED FULL EXAMPLE: trace_self (degenerate)
For K′ = K, π_* = id.

OMITTED FULL EXAMPLE: trace_eq_transfer (compatibility)
At neat level and in degree 0, π_* sends f to x ↦ Σ_{y ∈ π⁻¹(x)} f(y), the covering transfer of AT
stage 5.

OMITTED FULL EXAMPLE: trace_coarse_fails (non-example)
On coarse quotients the naive degree is wrong: for SL_2(ℤ) ⊃ Γ(2)·{±1} with quotient S_3, the fibre
of ℍ/Γ(2) → ℍ/SL_2(ℤ) over the image of i has 3 points, not [PSL_2(ℤ) : Γ̄(2)] = 6; the weighted
count Σ 1/|Γ_y| = 6/|Γ̄_i| = 3 is the correct one.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback;
ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent;
AdelicAlgebraicGroups:AA.4/level-map-fibre-mass;
tauceti:TauCeti.card_fiber_orbitOfCosetTranslate_mul_cardStabilizerOnOrbit;
mathlib:Subgroup.relIndex; EnhancedDerivedSheaves:E1;
ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition — Composition of Hecke correspondences, coherence and change of level

Mathematical specification:
The endomorphism action T_K:H(G^S,K^S)⊗R→End_{D(R)}(RΓ(X_K,V)) preserves Tau Ceti convolution: if
[KgK][KhK]=Σ_jc_j[Kγ_jK], then θ(g)∘θ(h)=Σ_jc_jθ(γ_j). With the compatible discrete derived
Hecke-invariants lift, this holds in D(H⊗R). For K′⊂K with K′^S=K^S, pullback and trace intertwine
all these operators; the coherent enhancement lifts those maps simultaneously, with their
Mackey/composition identities. The same statements for compact support and boundary use the
compactified equivariant support model and trace. At non-neat level the endomorphism identities hold
on groupoid complexes; a stronger strict lift is the specified enhancement obligation, not a
consequence of an action on each H^i.

OMITTED theorem signature: LocallySymmetric.hecke_composition.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action;
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula;
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace; tauceti:HeckeCosetModule.instRingHeckeRing;
AdelicAlgebraicGroups:AA.4/hecke-cartesian
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility — Hecke compatibility with supports, boundary, coefficients and cup products

Mathematical specification:
The maps RΓ_c(X_K, V) → RΓ(X_K, V) → RΓ(∂X̄_K, V) and the restriction RΓ(X̄_K, V) → RΓ(∂X̄_K, V) are
morphisms in D(R) intertwining every Hecke endomorphism, and lift to D(H(G^S,K^S)⊗R) when the
compatible discrete enhancement is used; so are the coefficient maps of ALS.1 (induced by
R[G(F)×K_S]-linear V → W, and the base change isomorphisms of ALS.1/coefficient-change). For cup
products: π^* is multiplicative, the trace satisfies the projection formula π_*(π^*a ∪ b) = a ∪
π_*b, and for a class c ∈ H^0(X_K, W) represented by a G^S-equivariant map R → H^0(𝔛_G, W)(χ) with
character χ of G^S, cup product with c satisfies c ∪ T(t)(x) = T(f_χ(t))(c ∪ x) (character-twist).
In general T(t) is not a ring endomorphism of H^*(X_K, R). Coefficient base-change isomorphisms here
have exactly ALS.1/coefficient-change’s neatness/perfectness hypotheses; arbitrary-level derived
invariants require the extra averaging or base-change comparison recorded at boundary-triangle.

OMITTED theorem signature: LocallySymmetric.hecke_support_boundary_compatibility.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action;
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace;
ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality;
EnhancedDerivedSheaves:E1
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison — Topological and discrete set-ups give the same Hecke actions

Mathematical specification:
Let 𝔛^top_G be 𝔛_G with G(A^∞) carrying its locally profinite topology (the limit lim_K X_K), and
𝔛^dis_G = G(F)\(X^G × G(A^∞)^δ), with π_dis : 𝔛^dis_G → 𝔛^top_G. (i) The square of derived functors
D⁺Sh_{G^S×K_S}(𝔛^top) → D⁺_sm(G^S × K_S, R) → D⁺(H(G^S, K^S) ⊗ R) and D⁺Sh_{G^S×K_S}(𝔛^top) →
D⁺Sh_{K}(𝔛^top) ≃ D⁺Sh(X_K) → D⁺(R) commutes compatibly with the forgetful functor (CN23 Proposition
2.1.3). (ii) RΓ(𝔛^top, −) has bounded cohomological dimension: R^iΓ(𝔛^top, 𝔉) = 0 for i > dim X_K
(CN23 Lemma 2.1.4). (iii) RΓ(K, −) ∘ RΓ(𝔛^top, −) ≅ RΓ(K^dis, −) ∘ RΓ(𝔛^dis, −) ∘ π_dis^* as
functors to D⁺(H(G^S, K^S) ⊗ R); in particular both set-ups give the same Hecke actions on
RΓ_{(c)}(X_K, V) (CN23 Lemma 2.1.5).

OMITTED theorem signature: LocallySymmetric.discrete_topological_comparison.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action;
ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold; SmoothRepresentationsOfLocalGroups:SR.0;
SchemeAndStackFoundations:key/equivariant-sheaf-cohomology
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra — The derived Hecke algebra T^S(K, V) of an arithmetic complex

Mathematical specification:
Let O be the ring of integers of a finite extension E/ℚ_p, S ⊃ S_p finite with K_v hyperspecial for
v ∉ S, and T^S = H(G^S, K^S) ⊗_ℤ O, a commutative O-algebra. For neat K and V a finite O-module with
O[K_S]-action, write T^S(K, V) for the image of T^S in End_{D(O)}(RΓ(X_K, V)) (ACC+'s T^S(K, λ) for
V = V_λ; NT16's T^S(C^•)); similarly T^S_c(K, V) for RΓ_c and T^S_∂(K, V) for RΓ(∂X̄_K, V). It is a
commutative finite O-algebra with surjections T^S(K, V) → T^S(H^*(X_K, V)) with nilpotent kernel,
and for V finite free over O, T^S(K, V) ≅ lim_N T^S(K, V/ϖ^N). It is the instance of
IntegralHeckeAndGaloisDeterminants IHG.2/derived-hecke-image for the complex RΓ(X_K, V).

GENERIC SIGNATURE ABOVE: LocallySymmetric.derivedHeckeAlgebra
T^S(K, V) := image of T^S → End_{D(O)}(RΓ(X_K, V)), with variants for RΓ_c and RΓ(∂X̄_K, V).

OMITTED SIGNATURE: LocallySymmetric.derivedHeckeAlgebra.commRing
T^S(K, V) is a commutative O-algebra, finite as an O-module.

OMITTED SIGNATURE: LocallySymmetric.derivedHeckeAlgebra.toCohomology
The surjection T^S(K, V) → T^S(H^*(X_K, V)), with nilpotent kernel (index of nilpotence ≤ d_G + 1).

OMITTED SIGNATURE: LocallySymmetric.derivedHeckeAlgebra.limit
T^S(K, V) ≅ lim_N T^S(K, V/ϖ^N) for V O-flat.

OMITTED SIGNATURE: LocallySymmetric.derivedHeckeAlgebra.eq_derivedHeckeImage
T^S(K, V) is IHG.2's derived Hecke image of the complex RΓ(X_K, V) with its T^S-action.

OMITTED SIGNATURE: LocallySymmetric.derivedHeckeAlgebra.maximalIdeals_finite
T^S(K, V) has finitely many maximal ideals, all with residue field finite over k.

EXECUTABLE EXAMPLE ABOVE: derivedHeckeAlgebra_zeroComplex (degenerate)
If RΓ(X_K, V) = 0 then T^S(K, V) = 0.

OMITTED FULL EXAMPLE: derivedHeckeAlgebra_GL1 (computation)
For G=GL₁/ℚ, principal level K(3)={u∈Ẑ×:u≡1 mod 3}, and constant O-coefficients, X_K is one point
with trivial arithmetic stabilizer and the derived Hecke image is O. At the non-neat level Ẑ× the
same assertion requires 2 invertible in O; otherwise the C₂ stabilizer gives higher groupoid
cohomology. More generally a finite component group C acting regularly on functions has image O[C],
not a product of copies of O. General number fields can have positive-dimensional unit tori, so
degree-zero finite-set cohomology is not asserted for GL₁/F.

OMITTED FULL EXAMPLE: derivedHeckeAlgebra_surj_cohomology (characterisation)
The map T^S(K, V) → T^S(H^*(X_K, V)) is surjective with nilpotent kernel; it can fail to be
injective (an endomorphism of a complex can act by zero on cohomology without being zero).

OMITTED FULL EXAMPLE: derivedHeckeAlgebra_ne_cohomologyAlgebra (non-example)
Generic derived-image test: over a DVR O with residue field k, the perfect complex C = k[0] ⊕ k[1]
has a nonzero off-diagonal ghost in Hom_D(O)(k,k[1]) = Ext^1_O(k,k). Its square is zero and it acts
as zero on cohomology. Let T = O[ε]/(ε²) send ε to this ghost; the derived image has nonzero
nilpotent kernel over its cohomological image. This tests the generic IHG.2 input, not an asserted
arithmetic realization. A lone complex [O →(ϖ) O] is quasi-isomorphic to one k and does not provide
that ghost.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation;
IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image;
DeformationAndDerivedPatchingAlgebra:P7/perfect-object
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/character-twist — Twisting Hecke algebras and coefficients by a character of det

Mathematical specification:
Let G = GL_{n,F}, K ⊂ GL_n(A_F^∞) good and ψ : G_F → O^× a continuous character with ψ∘Art_{F_v}
trivial on det(K_v) for all v ∉ S. Define f_ψ : H(G^S, K^S) ⊗_ℤ O → H(G^S, K^S) ⊗_ℤ O by f_ψ(f)(g) =
ψ(Art_F(det g))⁻¹ f(g); it is an O-algebra isomorphism with inverse f_{ψ⁻¹}. If K_v = GL_n(O_{F_v})
for v ∉ S, then f_ψ(T_{v,i}) = ψ(Frob_v)^{−i} T_{v,i}, and for a maximal ideal 𝔪 ⊂ T^S, 𝔪(ψ) :=
f_ψ(𝔪). For an O[K_S]-module V, V(ψ^{−1,S}) is V with g ∈ G^S additionally acting by ψ(det g)⁻¹ (on
the equivariant sheaf on 𝔛_G). More generally, for any G and a character χ : G(A^∞) → O^× trivial on
G(F) and K^S, f_χ(f)(g) = χ(g)⁻¹f(g).

GENERIC SIGNATURE ABOVE: LocallySymmetric.twistHecke
f_ψ : H(G^S, K^S) ⊗ O ≃ₐ H(G^S, K^S) ⊗ O, f ↦ (g ↦ ψ(Art_F(det g))⁻¹ f(g)).

GENERIC SIGNATURE ABOVE: LocallySymmetric.twistHecke_T
f_ψ(T_{v,i}) = ψ(Frob_v)^{−i} T_{v,i} for v ∉ S with K_v hyperspecial.

GENERIC SIGNATURE ABOVE: LocallySymmetric.twistHecke_mul
f_ψ ∘ f_{ψ′} = f_{ψψ′} and f_1 = id.

GENERIC SIGNATURE ABOVE: LocallySymmetric.twistMaximalIdeal
𝔪(ψ) = f_ψ(𝔪) for maximal ideals of T^S.

GENERIC SIGNATURE ABOVE: LocallySymmetric.twistCoefficients
V ↦ V(ψ^{−1,S}), the coefficient module with G^S acting through ψ(det)⁻¹.

EXECUTABLE EXAMPLE ABOVE: twistHecke_trivial (degenerate)
f_1 = id.

EXECUTABLE EXAMPLE ABOVE: twistHecke_T_GL1 (computation)
For n = 1, T_{v,1} = [ϖ_v K_v] and f_ψ(T_{v,1}) = ψ(Frob_v)⁻¹ T_{v,1}.

EXECUTABLE EXAMPLE ABOVE: twistHecke_mul (characterisation)
f_ψ is an O-algebra automorphism with f_ψ ∘ f_{ψ⁻¹} = id.

EXECUTABLE EXAMPLE ABOVE: twistHecke_not_identity_on_maximalIdeals (non-example)
For a fixed O-valued eigensystem φ with residue eigenvalues in k = O/ϖ, if ψ(Frob_v) ≠ 1 in k and
φ(T_{v,1}) ≠ 0, twisting changes that eigenvalue and its k-valued eigensystem. For residue fields
larger than k, two changed eigensystems can be Frobenius-conjugate and define the same maximal
ideal; nontrivial ψ alone does not prove that every such ideal moves.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action;
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra;
tauceti:HeckeCosetModule.instRingHeckeRing
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/twisting-isomorphism — Twisting RΓ(X_K, V) by a character, and its Hecke algebras

Mathematical specification:
Let G = GL_{n,F}, K ⊂ GL_n(A_F^∞) good, S ⊃ S_p, and ψ : G_F → O^× continuous with (1) ψ∘Art_{F_v}
trivial on det(K_v) for every finite v ∤ p, and (2) some m = (m_τ) ∈ ℤ^{Hom(F,E)} with
ψ(Art_{F_v}(k)) = ∏_{τ ∈ Hom_{ℚ_p}(F_v, E)} τ(k)^{−m_τ} for all v | p and k ∈ det(K_v). Let O(m) be
the rank-one O[K_p]-module on which k acts by ∏_τ τ(det k)^{m_τ}. Then for every finite free
O[K_S]-module V there is an isomorphism RΓ(X_K, V) ≅ RΓ(X_K, V ⊗ O(m)) in D(O), equivariant for
H(G^S, K^S) ⊗ O acting in the usual way on the source and through f_ψ on the target. If K_v =
GL_n(O_{F_v}) for v ∉ S, f_ψ descends to an isomorphism T^S(K, V) ≅ T^S(K, V ⊗ O(m)), and 𝔪 is in
the support of H^*(X_K, V) iff 𝔪(ψ) is in the support of H^*(X_K, V ⊗ O(m)). (ACC+ states this for V
= V_λ, where V_λ ⊗ O(m) = V_{λ+μ} with μ_τ = (m_τ, …, m_τ).)

OMITTED theorem signature: LocallySymmetric.twisting_isomorphism.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/character-twist;
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility;
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.3/degeneracy-old-forms — Degeneracy maps at Γ0(x)-level and the old-space splitting

Mathematical specification:
Let G = PGL_{2,F}, K a level and x ∉ S a place with K_x = PGL_2(O_x); let K_0(x) ⊂ K be the
Γ_0(x)-level at x (standard-level-subgroups), Y = X_K, Y_0(x) = X_{K_0(x)}. The two degeneracy maps
Y_0(x) → Y (π and π ∘ r_{diag(ϖ_x, 1)}) induce φ : H^*(Y, A)^2 → H^*(Y_0(x), A) (sum of the two
pullbacks) and φ^∨ : H^*(Y_0(x), A) → H^*(Y, A)^2 (the two traces), for A = O/ϖ^n, and φ^∨ ∘ φ =
(N(x)+1, T_x; T_x, N(x)+1), with determinant (N(x)+1)² − T_x². If 𝔪 is a maximal ideal with T_x² −
(1 + N(x))² ∉ 𝔪 (e.g. x a Taylor–Wiles prime: N(x) ≡ 1 mod p and the Frobenius eigenvalues α_x ≠
β_x, α_xβ_x ≡ 1), then φ^∨ ∘ φ is invertible after localization at 𝔪 and H^*(Y_0(x), A)_𝔪 ≅ H^*(Y,
A)^2_𝔪 ⊕ W for a T-stable W, and H^*(Y_0(x), A)_{𝔪̃} ≅ H^*(Y, A)_{𝔪̃} ⊕ W_{𝔪̃} for 𝔪̃ = (𝔪, U_x −
α_x).

OMITTED theorem signature: LocallySymmetric.degeneracy_old_forms.

Earlier interface needed:
SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison;
bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic
RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action
alone is not a strict D(H⊗R[Q]) object.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace;
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula;
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition;
ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle — The boundary exact triangle RΓ_c → RΓ → RΓ_∂

Mathematical specification:
For every compact open K and V finite projective with R[G(F) × K_S]-action there is an exact
triangle RΓ_c(X_K, V) → RΓ(X_K, V) → RΓ(∂X̄_K, V) → RΓ_c(X_K, V)[1] in D(R) with Hecke-equivariant
arrows and connecting map; the compatible enhanced model lifts the whole triangle, not three
independent Hecke actions, functorial in V (R[G(F)×K_S]-linear maps) and in the level (pullbacks and
traces of ALS.1/level-pullback and ALS.3/level-trace), and compatible with coefficient change at
neat K under ALS.1/coefficient-change; for general K this compatibility requires |K/K₀| invertible
in both coefficient rings or the derived-invariants base-change hypothesis, and is not automatic. It
is obtained from j_!j^*V → V → i_*i^*V on X̄^G × G(A^∞) and the identification RΓ(X̄_K, V) ≅ RΓ(X_K,
V) given by the homotopy equivalence j_K.

OMITTED theorem signature: LocallySymmetric.boundary_triangle.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact;
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility;
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace;
ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent;
EnhancedDerivedSheaves:E1
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps — Restriction to P, integration along N and the unnormalized Satake map

Mathematical specification:
For a local reductive G, P=M⋉N and compact open U with G=PU, U_P=U∩P=U_N⋊U_M, restriction
r_P:H(G,U)→H(P,U_P) and integration r_M(f)(m)=∫_N f(mn)dn (vol(U_N)=1) are algebra homomorphisms,
and their composite S is the integral unnormalized Satake map (NT16 Lemmas 2.4 and 2.7). A separate
monoid form uses both Iwahori decomposition product bijections U_N×U_M×U_Nbar→U and the reversed
order. Define Δ_M by mU_Nm⁻¹⊂U_N and U_Nbar⊂mU_Nbar m⁻¹, Δ=U_NΔ_MU_Nbar and Δ_P=Δ∩P. ACC+ Lemmas
2.1.10–2.1.11 give r_P:H(Δ,U)→H(Δ_P,U_P), r_M:H(Δ_P,U_P)→H(Δ_M,U_M) and
S([UmU])=[U_N:mU_Nm⁻¹][U_MmU_M]=|δ_P(m)|⁻¹[U_MmU_M] for m∈Δ_M. This single-term formula is confined
to the positive Iwahori-monoid branch. At hyperspecial U the transform has the full usual sum; its
relation to normalized Satake is δ_P^{1/2}S, with q-half coefficients adjoined separately. Parabolic
induction and its derived invariants compare through r_P under the NT16 hypotheses.

OMITTED SIGNATURE: LocallySymmetric.Hecke.restrictParabolic
r_P : H(G, U) →ₐ H(P, U_P), restriction of functions.

OMITTED SIGNATURE: LocallySymmetric.Hecke.integrateUnipotent
r_M : H(P, U_P) →ₐ H(M, U_M), integration along N with vol(U_N) = 1.

OMITTED SIGNATURE: LocallySymmetric.Hecke.satakeUnnormalized
S = r_M ∘ r_P : H(G, U) →ₐ H(M, U_M).

OMITTED SIGNATURE: LocallySymmetric.Hecke.satakeUnnormalized_basis
In the ACC+ positive Iwahori-monoid setting (both Iwahori product decompositions, Δ_M positivity and
Δ=U_NΔ_MU_Nbar), S([UmU])=|δ_P(m)|⁻¹[U_MmU_M]. This is not a single-term formula for the
hyperspecial spherical transform.

OMITTED SIGNATURE: LocallySymmetric.Hecke.satake_compat_normalized
For hyperspecial U, S agrees with SmoothRepresentationsOfLocalGroups SR.4's Satake transform
composed with the δ_P^{−1/2} twist (the q-half normalization recorded separately).

OMITTED SIGNATURE: LocallySymmetric.Hecke.parabolicInduction_invariants
For V = Ind_{P}^{G} W, V^U ≅ r_P^*(W^{U_P}) as H(G, U)-modules (NT16 Lemma 2.4(3)), and RΓ_U Ind ≅
r_P^* RΓ_{U_P} (NT16 Corollary 2.6).

OMITTED FULL EXAMPLE: satake_GL2_Tp (computation)
For GL_2, upper Borel B, U = GL_2(Z_p) and S(f)(t) = ∫_N f(tn)dn with vol(N(Z_p)) = 1: S(T_p) =
p·[diag(p,1)] + [diag(1,p)] in H(T(ℚ_p),T(Z_p)).

OMITTED FULL EXAMPLE: satake_one (degenerate)
S([U]) = [U_M], and for P = G, S = id.

OMITTED FULL EXAMPLE: satake_compat_SR4 (compatibility)
δ_B^{1/2}·S(T_p) = p^{1/2}([diag(p,1)] + [diag(1,p)]), the normalized Satake transform of SR.4
(after inverting p^{1/2}).

OMITTED FULL EXAMPLE: satake_unnormalized_not_W_invariant (non-example)
For p > 1, p[diag(p,1)] + [diag(1,p)] is not invariant under swapping diagonal entries;
δ_B^{1/2}·S(T_p) is Weyl-invariant.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants;
SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.4;
ReductiveGroupsPartII:RG2.4
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison — Hecke action on boundary strata through parabolic restriction

Mathematical specification:
Let P=M⋉N be a proper rational parabolic and K a good neat level. Write the induced G-stratum
X^P_K=⊔_g Y^P_{L_g}, g∈P(A^∞)\G(A^∞)/K, L_g=P(A^∞)∩gKg⁻¹; for decomposed L_g=L_{M,g}⋉L_{N,g} use its
own Levi base X^M_{L_{M,g}}. Restriction RΓ(∂X̄_K,B)→RΓ(X^P_K,B) is Hecke-equivariant for the
induced parabolic action. For P maximal extension by zero RΓ_c(X^P_K,B)→RΓ(∂X̄_K,B) followed by
restriction is the forget-supports map. At the distinguished component g=1 with G^S=P^SK^S and K_P
decomposed, evaluation on that component identifies the induced-invariants action with pullback
through r_P. For a coefficient direct summand A⊂B^{K_{N,S}}, the projection to the Levi and this
inclusion give i:r_M^*RΓ(X^M_{K_M},A)→RΓ(Y^P_{K_P},B), with a splitting s after forgetting the Hecke
action, s∘i=1 (NT16 Proposition 3.4). If G^S≠P^SK^S, evaluation is only the split morphism of ACC+
Lemma 2.1.14; it is not an identification of the entire induced stratum with Y^P_{K_P}. Other
components use the transported levels and corresponding coefficient actions. Consequently all global
stratum formulas must be summed/induced across g, and the split Levi summand has Hecke action
through S=r_M∘r_P.

OMITTED theorem signature: LocallySymmetric.boundary_stratum_hecke_comparison.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps;
ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification;
ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration;
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action; SmoothRepresentationsOfLocalGroups:SR.2
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est — Nomizu–van Est: cohomology of unipotent arithmetic groups is Lie algebra cohomology

Mathematical specification:
Let N be a unipotent group over ℚ (the unipotent radical of a rational parabolic), 𝔫 = Lie N, Γ_N ⊂
N(ℚ) an arithmetic subgroup (a lattice in N(ℝ)) and V a finite-dimensional rational representation
of N over a field E of characteristic 0. Then the inclusion of N(ℝ)-invariant forms gives natural
isomorphisms H^*(𝔫, V) ≅ H^*(Γ_N\N(ℝ), V) ≅ H^*(Γ_N, V), the Lie algebra cohomology carries its
algebraic M-action, while the fixed nilmanifold comparison is equivariant for the normalizer of Γ_N
in M(ℚ). Other Levi/commensurator elements require transported lattices and the corresponding
pullback/trace maps; a fixed arithmetic lattice need not be preserved by all of M. This is a
characteristic-zero statement: for integral or mod-p coefficients H^*(Γ_N, V) is not given by
𝔫-cohomology in general, and integral boundary statements must not assume it
(ALS.4/boundary-stratum-cohomology-formula keeps the two regimes separate).

OMITTED theorem signature: LocallySymmetric.nomizu_van_est.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration; AdditiveCombinatorics:AC.3;
AutomorphicFormsOnReductiveGroups:AF.1; mathlib:groupCohomology
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula — Cohomology of a boundary stratum via van Est and Kostant

Mathematical specification:
Let G be connected reductive over F, P=M⋉N proper, K good neat, E characteristic 0 containing all
coefficient embeddings, and V_λ algebraic. For each transported decomposed level L_g from
stratum-nilmanifold-fibration, Leray/Hochschild–Serre gives
E₂^{a,b}=H^a(X^M_{L_{M,g}},H^b(𝔫,V_λ)~)⇒H^{a+b}(Y^P_{L_g},V_λ), by Nomizu–van Est. Kostant
identifies H^b(𝔫,V_λ)=⊕_{w∈W^P,ℓ(w)=b}V^M_{w(λ+ρ)−ρ}; this describes the E₂ page for general
reductive G and does not assert degeneration. For G=Res_{F/ℚ}GL_N, Harder–Raghuram §4.2, (4.2) and
Proposition 4.3 supply the degeneration and the natural cohomological decomposition
H^q(X^P_K,V_λ)=⊕_g⊕_{w∈W^P}H^{q−ℓ(w)}(X^M_{L_{M,g}},V^M_{w·λ}), with the transported-component and
real-component invariants of that source. Over all levels this is its algebraic unnormalized
induction from π₀(P(ℝ))×P(A^∞) to π₀(G(ℝ))×G(A^∞). At eligible hyperspecial components the Hecke
action is through the integral unnormalized S=r_M∘r_P; conversion to normalized induction multiplies
by the explicit modulus half-character. A general reductive direct-sum/derived splitting requires a
separate Levi-equivariant nilpotent-cochain formality theorem; E₂ degeneration alone would give only
an associated graded, not a canonical splitting. No integral Kostant decomposition is asserted.

OMITTED theorem signature: LocallySymmetric.boundary_stratum_cohomology_formula.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison;
ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps;
ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration;
AutomorphicFormsOnReductiveGroups:AF.1; SmoothRepresentationsOfLocalGroups:SR.2
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre — The integral Leray–Hochschild–Serre spectral sequence of a stratum

Mathematical specification:
For neat decomposed K and P=M⋉N, write X^P_K=⊔_gY^P_{L_g}, with all levels and arithmetic groups
transported as in stratum-nilmanifold-fibration. For each component the discrete extension
1→Γ_{N,g}→Γ_{P,g}→Γ_{M,g}→1 gives E₂^{a,b}=H^a(Γ_{M,g},H^b(Γ_{N,g},V))⇒H^{a+b}(Γ_{P,g},V),
equivalently the Leray sequence on the Levi base with the indicated local coefficient sheaf. Sum
these sequences across g. They are Hecke-compatible through the induced parabolic action and the r_M
comparison where its hypotheses hold. Coefficient base change is a derived map of spectral
sequences, retaining Tor terms; it is not an isomorphism of E₂ pages without flatness. In the
special NT16 Lemma 4.5 setting, N is an F-unipotent group, Γ_N is a congruence subgroup N(F)∩U_N,
and k has the stated p-residue coefficients with trivial N-action. The comparison with U_{N,S} uses
the discrete groups and the arithmetic acyclicity argument in that lemma. The pro-p topology of
U_{N,S} does not by itself identify its continuous cohomology with this discrete cohomology; no
general discrete/profinite comparison is claimed here.

OMITTED theorem signature: LocallySymmetric.levi_hochschild_serre.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison; mathlib:groupCohomology;
ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence — Gluing over strata: convergence and Hecke compatibility of the boundary spectral sequence

Mathematical specification:
The compact-support exact couple of stratification-spectral-sequence is Hecke-equivariant, finite
and convergent, with d_r:(p,q)→(p−r,q+r+1). Each global term is the sum/induction over its
transported P-spaces. Exact localization of this finite filtration shows: if H^*_c(X^P_K,V)_𝔪=0 for
every proper P, then H^*(∂X̄_K,V)_𝔪=0. If only open maximal-parabolic strata survive, extension by
zero identifies their direct sum of compact-support complexes with the localized boundary complex.
To deduce the compact-support hypothesis from ordinary-stratum vanishing at neat level over a field,
use the individual early Verdier duality and Hecke-adjoint nodes: H^*(X^P_K,V^∨⊗o_P)_{𝔪^∨}=0 implies
H^*_c(X^P_K,V)_𝔪=0, where 𝔪^∨ is transported through the inverse-double-coset involution. Over O
first reduce coefficients modulo ϖ, use this field duality and finite-perfectness, then derived
Nakayama. Ordinary vanishing for V at 𝔪 is sufficient only when an additional argument supplies the
required dual-coefficient/inverse-ideal vanishing (as in NT16 Lemmas 4.1 and 4.4). For GL_N the
separate ordinary flag sequence also converges, with alternating-restriction d₁:(p,q)→(p+1,q); it is
not substituted for the support argument in NT16’s proof.

OMITTED theorem signature: LocallySymmetric.boundary_gluing_convergence.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison;
ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal — Localizing perfect Hecke complexes at a maximal ideal

Mathematical specification:
Let C be a perfect complex of O-modules with a homomorphism T^S → End_{D(O)}(C) and T^S(C) its
(commutative, finite) image. For a maximal ideal 𝔪 ⊂ T^S(C) let e_𝔪 ∈ T^S(C) be the idempotent of
the factor T^S(C)_𝔪 in T^S(C) = ∏_𝔪 T^S(C)_𝔪. Since idempotents split in D(O), C ≅ C_𝔪 ⊕ C′ with e_𝔪
acting as the projector onto C_𝔪, unique up to unique isomorphism; T^S(C)_𝔪 ≅ T^S(C_𝔪) and H^*(C)_𝔪
≅ H^*(C_𝔪). For a maximal ideal 𝔪 of T^S, C_𝔪 := C_{𝔪T^S(C)} (zero if 𝔪 is not in the support).
Localization is functorial for T^S-equivariant maps between such complexes, exact (carries exact
triangles of T^S-complexes to exact triangles), and commutes with coefficient change O → O/ϖ^m.

OMITTED SIGNATURE: LocallySymmetric.heckeLocalize
C ↦ C_𝔪, the e_𝔪-summand of a perfect T^S-complex, with inclusion and projection maps.

OMITTED SIGNATURE: LocallySymmetric.heckeLocalize.cohomology
H^*(C_𝔪) ≅ H^*(C)_𝔪 as T^S-modules.

OMITTED SIGNATURE: LocallySymmetric.heckeLocalize.heckeAlgebra
T^S(C_𝔪) ≅ T^S(C)_𝔪.

OMITTED SIGNATURE: LocallySymmetric.heckeLocalize.triangle
Localization carries T^S-equivariant exact triangles to exact triangles (e.g. the boundary
triangle).

OMITTED SIGNATURE: LocallySymmetric.heckeLocalize.eq_zero_iff
C_𝔪 = 0 iff 𝔪 is not in the support of H^*(C).

OMITTED SIGNATURE: LocallySymmetric.heckeLocalize.reduction
(C ⊗^L O/ϖ^m)_𝔪 ≅ C_𝔪 ⊗^L O/ϖ^m.

OMITTED FULL EXAMPLE: heckeLocalize_unsupported (degenerate)
If 𝔪 ∉ Supp H^*(C), then C_𝔪 ≅ 0.

OMITTED FULL EXAMPLE: heckeLocalize_module (compatibility)
If C = M[0] for a finite T^S-module M, C_𝔪 = M_𝔪[0], the localization of commutative algebra.

OMITTED FULL EXAMPLE: heckeLocalize_sum (characterisation)
C ≅ ⊕_𝔪 C_𝔪 over the finitely many maximal ideals of T^S(C).

OMITTED FULL EXAMPLE: heckeLocalize_not_tensor (non-example)
A ring homomorphism T^S→End_D(O)(C) does not itself specify a strict cochain T^S-action. With a
specified compatible lift to D(T^S), derived tensor with T^S_𝔪 computes localization. The geometric
relative ring action alone does not provide this lift.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra;
IntegralHeckeAndGaloisDeterminants:IHG.2/derived-idempotent-splitting;
mathlib:CategoryTheory.IsIdempotentComplete; DeformationAndDerivedPatchingAlgebra:P7/perfect-object
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal — Galois type, Eisenstein and non-Eisenstein maximal ideals

Mathematical specification:
Let G = GL_{m,F}, S ⊃ S_p, T^S = T^S_{GL_m} generated by T_v^i (i = 1, …, m) and (T_v^m)⁻¹, v ∉ S. A
perfect T^S-complex C of O-modules is of S-Galois type if for each maximal ideal 𝔪 ⊂ T^S(C) there is
a continuous semisimple ρ̄_𝔪 : G_{F,S} → GL_m(T^S(C)/𝔪) with det(X − ρ̄_𝔪(Frob_v)) = X^m −
T_v^1X^{m−1} + … + (−1)^j q_v^{j(j−1)/2}T_v^jX^{m−j} + … + (−1)^m q_v^{m(m−1)/2}T_v^m for all v ∉ S.
Then 𝔪 is Eisenstein if ρ̄_𝔪 is absolutely reducible and non-Eisenstein otherwise; C is Eisenstein
if all its maximal ideals are. For PGL_2 over an imaginary quadratic F (CG18), a maximal ideal 𝔪 of
the Hecke algebra T_Q is Eisenstein if T_λ − 2 ∈ 𝔪 for all but finitely many primes λ splitting
completely in some fixed abelian extension of F; both definitions agree when ρ̄_𝔪 exists (reducible
semisimple ρ̄ with determinant conditions forces T_λ ≡ 2 on a density-one set of split λ).

OMITTED SIGNATURE: LocallySymmetric.IsGaloisType
A perfect T^S-complex C is of S-Galois type: residual representations ρ̄_𝔪 with the displayed
Frobenius characteristic polynomials exist for all 𝔪.

OMITTED SIGNATURE: LocallySymmetric.IsEisenstein
𝔪 is Eisenstein: ρ̄_𝔪 is absolutely reducible (for C of S-Galois type).

OMITTED SIGNATURE: LocallySymmetric.IsEisenstein.of_cohomology
S-Galois type and the Eisenstein property of C depend only on H^*(C) with its T^S-action.

OMITTED SIGNATURE: LocallySymmetric.IsEisensteinCG
CG18's notion for PGL_2/F: T_λ − 2 ∈ 𝔪 for almost all λ split in a fixed abelian extension.

OMITTED SIGNATURE: LocallySymmetric.IsEisenstein.iff_CG
For PGL_2 over imaginary quadratic F with ρ̄_𝔪 existing, the two notions agree.

OMITTED FULL EXAMPLE: eisenstein_H0 (computation)
For GL_2, the constant-functions eigensystem on H^0 has T_v^1 = 1 + q_v and T_v^2 = 1. Its Hecke
polynomial is X² − (1+q_v)X + q_v = (X−1)(X−q_v), so the associated residual representation is
reducible. The cyclotomic character or its inverse is fixed by the Frobenius convention; T_v^2 = q_v
would give the wrong determinant q_v².

OMITTED FULL EXAMPLE: eisenstein_GL1 (degenerate)
For m = 1 every maximal ideal of S-Galois type is non-Eisenstein (one-dimensional representations
are irreducible).

OMITTED FULL EXAMPLE: eisenstein_iff_CG_PGL2 (compatibility)
For PGL_2 over imaginary quadratic F, ρ̄_𝔪 reducible ⇔ T_λ − 2 ∈ 𝔪 for almost all λ split in a fixed
abelian extension (CG18 Definition 5.5).

OMITTED FULL EXAMPLE: nonEisenstein_not_vanishing (non-example)
Non-Eisenstein in the Hecke sense of a single group does not by itself kill boundary cohomology: for
groups whose Levi subgroups carry cuspidal cohomology (e.g. the Siegel parabolic of U(n,n) with Levi
Res_{F/F⁺}GL_n), boundary cohomology localized at a non-Eisenstein 𝔪̃ can be nonzero (ACC+ Theorem
2.4.2).

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal;
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra; mathlib:Matrix.GeneralLinearGroup
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/boundary-eigenvalue-criterion — Boundary vanishing by an eigenvalue argument

Mathematical specification:
Let K be neat and decomposed with respect to the standard parabolics, V finite projective over O and
𝔪 ⊂ T^S_G a maximal ideal. Suppose that for every proper standard parabolic P = M ⋉ N and every
maximal ideal 𝔪_M of T^S_M in the support of the Levi complexes RΓ(X^M_{K_M}, A) (A running over the
finitely many K_{M,S}-subquotients of the fibre cohomology H^b(Γ_N, V ⊗ k)), the pullback S^*(𝔪_M) =
S⁻¹(𝔪_M) ≠ 𝔪. Then RΓ(∂X̄_K, V)_𝔪 = 0, and (RΓ_c(X_K, V))_𝔪 → (RΓ(X_K, V))_𝔪 is an isomorphism. The
hypothesis is an actual eigenvalue condition on Levi Hecke eigensystems transported by the
unnormalized Satake map; the label non-Eisenstein proves nothing without it.

OMITTED theorem signature: LocallySymmetric.boundary_eigenvalue_criterion.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence;
ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle;
ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal;
ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein — Boundary cohomology of GL_n is Eisenstein

Mathematical specification:
Let F be a number field, G = GL_{n,F}, S ⊃ S_p, U ∈ J_{G,U^S} (neat, U_v = GL_n(O_{F_v}) for v ∉ S).
Assume ♠: for every 1 ≤ m ≤ n and every such level for GL_m, RΓ(X^U_{GL_m}, k) is of S-Galois type
(true for F totally real or imaginary CM by Scholze's theorem, supplied outside this roadmap). Then
for every smooth O[U_S]-module A, finite over O, RΓ(∂X̄^U_G, A) is Eisenstein; hence for every
non-Eisenstein maximal ideal 𝔪 ⊂ T^S(RΓ(X^U_G, A)), (RΓ_c(X^U_G, A))_𝔪 → (RΓ(X^U_G, A))_𝔪 is a
quasi-isomorphism. Variants: (a) for G = PGL_{n,F}, F imaginary CM, at the levels Y(K), Y_0(Q),
Y_1(Q) of CG18 §9 and O/ϖ^n coefficients, if r̄_𝔪 is absolutely irreducible then H^*(∂Y_?, O/ϖ^n)_𝔪
= 0 (the hypothesis omitted from the statement of CG20 Theorem 3.2/A.4,
PAPER-CALEGARI-GERAGHTY-20/E140); (b) for PGL_2 over imaginary quadratic F and non-Eisenstein 𝔪 in
the sense of CG18 Definition 5.5, H_i(Y_0(Q), μ)_𝔪 ≅ H_i^{BM}(Y_0(Q), μ)_𝔪 (CG18 Lemma 5.9(3)).

OMITTED theorem signature: LocallySymmetric.gln_boundary_eisenstein.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-eigenvalue-criterion;
ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison;
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization — Localized boundary cohomology of U(n, n) is the Siegel stratum

Mathematical specification:
Let F be CM with maximal totally real subfield F⁺, G̃ the quasi-split unitary group U(n, n) over F⁺
with Siegel parabolic P = G ⋉ U, G = Res_{F/F⁺}GL_n, K̃ good and decomposed with respect to P, K =
K̃ ∩ G(A^∞_{F⁺}), S = S^c. Let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein and 𝔪̃ = S^*(𝔪) ⊂ T̃^S. Then for
every λ̃ ∈ (ℤ^{2n}_+)^{Hom(F⁺,E)} there is a natural T̃^S-equivariant isomorphism RΓ(X̃^P_{K̃},
Ṽ_λ̃)_𝔪̃ ≅ RΓ(∂X̃_{K̃}, Ṽ_λ̃)_𝔪̃ in D(O): after localization only the Siegel stratum contributes.
The proof uses the Galois representations attached to Hecke eigensystems in the cohomology of the
Levi subgroups (S-Galois type for Res_{F/F⁺}GL_m, m ≤ n), as in gln-boundary-eisenstein.

OMITTED theorem signature: LocallySymmetric.siegel_stratum_localization.

Earlier interface needed:
SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1 Lie algebra
cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2
spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals.
Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence;
ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein;
ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal;
ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps;
ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge — X̄_K as a compact topological manifold with boundary

Mathematical specification:
For neat K, round X̄_K by Douady–Hérault Theorem and Definition 6.2: a positive boundary-defining
product function and a strictly outward vector field give a smooth manifold with boundary on the
same underlying topological space, whose smooth structure agrees away from corners of depth ≥2.
Proposition 4.2 supplies the topological collar of the full boundary; choices alter the smoothing,
not the underlying pair (X̄_K,∂X̄_K). Its interior is X_K and its boundary is a closed topological
(d_G−1)-manifold. The orientation system extends from the interior and restricts to the boundary
orientation system via the outward-normal convention, with a fixed sign if the inward normal is used
instead. Thus AlgebraicTopology stage 6 Poincaré–Lefschetz duality applies. Naturality of pair
cohomology, orientation sheaves and finite-cover transfers uses the original topological pair; it
does not require a functorial smoothing choice.

OMITTED theorem signature: LocallySymmetric.corner_boundary_bridge.

Earlier interface needed:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact;
ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality;
mathlib:ModelWithCorners
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality — Poincaré–Verdier duality for X_K with perfect coefficients and orientation twist

Mathematical specification:
Let K be neat, R noetherian, d = d_G, and V a bounded complex of finite projective R-modules with
R[G(F) × K_S]-action (a perfect coefficient complex); V^∨ = Hom_R(V, R). Then there is a natural
isomorphism in D(R) RHom_R(RΓ_c(X_K, V), R) ≅ RΓ(X_K, V^∨ ⊗ o_K)[d], and likewise RHom_R(RΓ(X_K, V),
R) ≅ RΓ_c(X_K, V^∨ ⊗ o_K)[d] and, for the closed (d−1)-manifold ∂X̄_K, RHom_R(RΓ(∂X̄_K, V), R) ≅
RΓ(∂X̄_K, V^∨ ⊗ o_K)[d − 1]. These are natural in V, compatible with coefficient change R → R′
(ALS.1/coefficient-change) and with pullback along level maps (π^* dual to the trace π_*). In each
degree they give the universal-coefficient sequences 0 → Ext^1_R(H^{d−i+1}_c(X_K, V), R) → H^i(X_K,
V^∨ ⊗ o_K) → Hom_R(H^{d−i}_c(X_K, V), R) → 0 when R is a Dedekind domain. When X_K is orientable
(e.g. G(F_∞) connected) o_K may be omitted, as in NT16 Proposition 3.7 and ACC+ Proposition 2.2.21.
The same oriented-manifold argument gives RHom_R(RΓ_c(Y^P_{L_g},V),R)≅RΓ(Y^P_{L_g},V^∨⊗o_{P,g})[d_P]
for each good neat transported P-space of boundary-stratification, with d_P=dim e(P) and its own
orientation system. Apply the generic E1 manifold Verdier comparison on that open stratum; do not
treat a nonreductive parabolic as a reductive G.

OMITTED theorem signature: LocallySymmetric.verdier_poincare_duality.

Earlier interface needed:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge;
ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model;
ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation; EnhancedDerivedSheaves:E1;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality;
DeformationAndDerivedPatchingAlgebra:P7/perfect-object;
ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification;
ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings — Evaluation, cup-product and relative duality pairings

Mathematical specification:
For neat K, R noetherian and V as in verdier-poincare-duality, define the cup-product pairings ⟨·,·⟩
: H^i_c(X_K, V) × H^{d−i}(X_K, V^∨ ⊗ o_K) → H^d_c(X_K, o_K) → R (cup product with the evaluation V ⊗
V^∨ → R, then the trace given by the fundamental class of the orientation local system) and the
relative pairing H^i(X̄_K, ∂X̄_K; V) × H^{d−i}(X̄_K; V^∨ ⊗ o_K) → R, identified with the first
through RΓ_c(X_K) ≅ RΓ(X̄_K, ∂X̄_K) and RΓ(X_K) ≅ RΓ(X̄_K); and the boundary pairing H^i(∂X̄_K, V) ×
H^{d−1−i}(∂X̄_K, V^∨ ⊗ o_K) → R. These pairings are the evaluations of the isomorphisms of
verdier-poincare-duality; over a field they are perfect.

OMITTED SIGNATURE: LocallySymmetric.dualityPairing
⟨·,·⟩ : H^i_c(X_K, V) × H^{d−i}(X_K, V^∨ ⊗ o_K) → R.

OMITTED SIGNATURE: LocallySymmetric.dualityPairing_relative
The relative pairing on (X̄_K, ∂X̄_K) and the boundary pairing on ∂X̄_K.

OMITTED SIGNATURE: LocallySymmetric.dualityPairing_perfect
Over a field the pairings are perfect.

OMITTED SIGNATURE: LocallySymmetric.dualityPairing_pullback_trace
⟨π^*x, y⟩_{K′} = ⟨x, π_*y⟩_K for K′ ⊂ K (pullback adjoint to trace).

OMITTED SIGNATURE: LocallySymmetric.dualityPairing_eq_evaluation
The pairing is the evaluation of RHom(RΓ_c(X_K, V), R) ≅ RΓ(X_K, V^∨ ⊗ o_K)[d] on cohomology.

OMITTED FULL EXAMPLE: pairing_surface_H0H2 (computation)
For a connected modular curve X_K and a field k, H^0(X_K, k) × H^2_c(X_K, k) → k is (a, b) ↦ a·∫b,
perfect with both sides k.

OMITTED FULL EXAMPLE: pairing_compact_case (degenerate)
If X_K is compact (G anisotropic), H^i_c = H^i and the pairing is classical Poincaré duality on a
closed manifold.

OMITTED FULL EXAMPLE: pairing_pullback_trace (characterisation)
⟨π^*x, y⟩_{K′} = ⟨x, π_*y⟩_K for K′ ⊂ K neat.

OMITTED FULL EXAMPLE: pairing_needs_orientation (non-example)
Without the twist by o_K the pairing H^2_c(X_K, F_3) × H^0(X_K, F_3) → F_3 vanishes identically on
the nonorientable component of ALS.0's PGL_2 example, since H^2_c of a nonorientable surface with
F_3 coefficients is 0.

Earlier interface needed:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality — Hecke adjoints: inverse double cosets and restriction/corestriction

Mathematical specification:
Under verdier-poincare-duality the transpose of the operator [Kg⁻¹K] on RHom_R(RΓ_c(X_K, V), R)
corresponds to [KgK] on RΓ(X_K, V^∨ ⊗ o_K) for g ∈ G^S, i.e. ⟨x, [KgK]y⟩ = ⟨[Kg⁻¹K]x, y⟩ (the
orientation character contributes nothing because g ∈ G^S acts on 𝔛_G through G(A^∞) and the
orientation of X^G is untouched); equivalently, the duality is equivariant when H(G^S, K^S) acts on
the left through the anti-involution ι([KgK]) = [Kg⁻¹K]. Restriction and corestriction are adjoint:
⟨π^*x, y⟩ = ⟨x, π_*y⟩. For GL_n with K_v = GL_n(O_{F_v}), T_v^i acting on H^* corresponds to
T_v^{n−i}(T_v^n)⁻¹ on H^*_c, and ι descends to an isomorphism T^S(RΓ_c(X_K, V)) ≅ T^S(RΓ(X_K, V^∨ ⊗
o_K)) with 𝔪 ↦ 𝔪^∨ = ι(𝔪). On transported P-spaces the same adjoint argument pairs compact and
ordinary dual-coefficient cohomology with o_{P,g}; rational component maps pull back the local
orientation sheaf, and the finite adelic correspondence preserves its archimedean factor.

OMITTED theorem signature: LocallySymmetric.hecke_adjoint_duality.

Earlier interface needed:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings;
ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula;
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace;
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-triangle-compatibility — Duality, the boundary triangle and coefficient change

Mathematical specification:
For neat K write C_c(V)→C(V)→B(V)→C_c(V)[1] for the boundary triangle and D=RHom_R(−,R).
Contravariant duality gives D B(V)→D C(V)→D C_c(V)→D B(V)[1]. Early duality identifies these terms
with B(V^∨⊗o)[d−1]→C_c(V^∨⊗o)[d]→C(V^∨⊗o)[d]→B(V^∨⊗o)[d]. This is the inverse rotation of the
shifted boundary triangle, with the negative rotated connecting arrow prescribed by the
triangulated-category sign convention. It is Hecke-equivariant after applying the
inverse-double-coset anti-involution ι on the dual side. For perfect complexes it commutes with
derived coefficient change and with localization, exchanging 𝔪 and 𝔪^∨; in particular
D(C_c(V)_𝔪)≅C(V^∨⊗o)_{𝔪^∨}[d].

OMITTED theorem signature: LocallySymmetric.duality_triangle_compatibility.

Earlier interface needed:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle;
ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal;
ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/non-neat-duality — Duality at non-neat level: stabilizer hypotheses

Mathematical specification:
Let K be arbitrary and K′ ⊂ K normal, neat and of finite index, with K′^S = K^S. The equivariant
complex RΓ_{K/K′}(X_{K′},V) is perfect over R after forgetting the finite-group action; it is not
generally perfect over R[K/K′] unless the full K-action is free (e.g. K neat). Derived finite-group
invariants compute orbifold RΓ(X_K,V). If |K/K′| is invertible in R, averaging makes this a direct
summand of the finite projective R-complex at K′, and yields finite-level duality
RHom_R(RΓ_c(X_K,V),R) ≅ RΓ(X_K,V^∨ ⊗ o_K)[d], Hecke-equivariantly, for the corresponding groupoid
support model. Invertibility of |K/K′| is sufficient and is not equivalent to invertibility of all
stabilizer orders. Without such a hypothesis orbifold cohomology can be unbounded. Use the
compactified equivariant support model of betti-complexes. A point with stabilizer C_p over F_p
gives H^*(C_p,F_p) in arbitrarily high degrees, testing the omitted modular averaging hypothesis.

OMITTED theorem signature: LocallySymmetric.non_neat_duality.

Earlier interface needed:
The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic
complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and
geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary
unrelated graded modules cannot state the pairing.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation;
ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison;
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace; EnhancedDerivedSheaves:E1
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5/early-duality-reexport — The early finite-level duality as an input to the characteristic-zero comparison

Mathematical specification:
The characteristic-zero comparisons of ALS.5 are compatible with the early structures: for neat K
and a finite-dimensional complex algebraic representation V of 𝐆, (i) the de Rham isomorphism of
de-rham-comparison carries the cup-product pairing of ALS.5:finite-level-duality/duality-pairings on
H^*_c × H^{d−*} to the pairing (α, β) ↦ ∫_{X_K} α ∧ β of compactly supported and arbitrary closed
forms (with the evaluation V ⊗ V^∨ → ℂ and the orientation twist), (ii) pullbacks and traces along
level maps correspond to pullback and fibre-integration of forms, and (iii) Hecke operators
correspond to the correspondence action on forms. No new duality is constructed here: the duality,
pairings and adjoints are those of ALS.5:finite-level-duality.

OMITTED theorem signature: LocallySymmetric.early_duality_reexport.

Earlier interface needed:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; AS.4/AS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; AG2.2/AG2.3 unitary parameter systems and AG2.4 GL systems. An arbitrary submodule of H*
cannot define cuspidal cohomology.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings;
ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality;
ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison — Betti, de Rham and relative Lie algebra cohomology in characteristic zero

Mathematical specification:
Let 𝔞_G = Lie(A_∞)⊗ℝℂ and 𝔪_G = Lie(G(F_∞))⊗ℝℂ / 𝔞_G. Use the central-character-twisted function
space whose diagonal A_∞ action with V is trivial, so the coefficient module descends to 𝔪_G. Let K
be neat and V a finite-dimensional complex (or real) algebraic representation of 𝐆 = Res_{F/ℚ}G,
with associated flat bundle 𝒱 on X_K. Then there are natural isomorphisms H^*(X_K, V) ≅
H^*_{dR}(X_K, 𝒱) ≅ H^*(Ω^•(X^G × G(A^∞)/K, V)^{G(F)}) ≅ H^*(𝔪_G, K_∞; C^∞(G(F)\G(A_F)/K) ⊗ V) (with
A_∞ acting on C^∞ through the central character twist making the A_∞-action compatible),
Hecke-equivariant for H(G^S, K^S), compatible with level maps, and similarly H^*_c(X_K, V) with
compactly supported forms. The last isomorphism identifies G(F)-invariant V-valued forms on X^G ×
G(A^∞)/K with (𝔪_G, K_∞)-cochains Hom_{K_∞}(∧^•(𝔤/(𝔨 + 𝔞_G)), C^∞ ⊗ V)
(AutomorphicFormsOnReductiveGroups AF.1a/invariant-forms-complex and relative-lie-cochain-complex).
This is the topological-to-smooth comparison that AutomorphicSpectralTheory AS.5 assigns to this
roadmap.

OMITTED theorem signature: LocallySymmetric.de_rham_comparison.

Earlier interface needed:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; AS.4/AS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; AG2.2/AG2.3 unitary parameter systems and AG2.4 GL systems. An arbitrary submodule of H*
cannot define cuspidal cohomology.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison;
ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system;
ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold;
AutomorphicFormsOnReductiveGroups:AF.1a/invariant-forms-complex;
AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison — Franke's comparison with automorphic forms

Mathematical specification:
Use 𝔪_G and the central-character convention of de-rham-comparison, with the split-centre directions
removed. For K neat and V a finite-dimensional complex algebraic representation, the inclusion of
the space 𝒜(G)^K of K-invariant automorphic forms (with the central twist fixed by V) into
C^∞(G(F)\G(A_F)/K) induces an isomorphism H^*(𝔪_G, K_∞; 𝒜(G)^K ⊗ V) ≅ H^*(𝔪_G, K_∞; C^∞ ⊗ V), hence
H^*(X_K, V) ≅ H^*(𝔪_G, K_∞; 𝒜(G)^K ⊗ V), Hecke-equivariantly. Franke's filtration of 𝒜(G) by
cuspidal support gives a decomposition H^*(X_K, V) = ⊕_{{P}} H^*_{{P}}(X_K, V) over associate
classes of parabolics, with the summand of {G} the cuspidal cohomology. The comparison of ordinary
cohomology with automorphic forms is supplied by AutomorphicSpectralTheory AS.5; this node records
its consequence for X_K.

OMITTED theorem signature: LocallySymmetric.automorphic_comparison.

Earlier interface needed:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; AS.4/AS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; AG2.2/AG2.3 unitary parameter systems and AG2.4 GL systems. An arbitrary submodule of H*
cannot define cuspidal cohomology.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison; AutomorphicSpectralTheory:AS.5
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology — Cuspidal cohomology

Mathematical specification:
Use 𝔪_G and the central-character convention of de-rham-comparison, with the split-centre directions
removed. For K neat and V a finite-dimensional complex algebraic representation of 𝐆, H^*_cusp(X_K,
V) := ⊕_π m(π) H^*(𝔪_G, K_∞; π_∞ ⊗ V) ⊗ (π^∞)^K, the sum over cuspidal automorphic representations π
of G(A_F) with central character on A_∞ inverse to that of V, m(π) the cuspidal multiplicity. The
inclusion of cusp forms into automorphic forms induces an injective, Hecke-equivariant map
H^*_cusp(X_K, V) → H^*(X_K, V) (Borel), whose image lies in the interior cohomology H^*_! = im(H^*_c
→ H^*); it is the {G}-summand of Franke's decomposition (automorphic-comparison).

OMITTED SIGNATURE: LocallySymmetric.cuspidalCohomology
H^*_cusp(X_K, V) as a Hecke-module with its map to H^*(X_K, V).

OMITTED SIGNATURE: LocallySymmetric.cuspidalCohomology_injective
The map H^*_cusp(X_K, V) → H^*(X_K, V) is injective and Hecke-equivariant.

OMITTED SIGNATURE: LocallySymmetric.cuspidalCohomology_le_interior
Its image lies in the interior cohomology im(H^*_c(X_K, V) → H^*(X_K, V)).

OMITTED SIGNATURE: LocallySymmetric.cuspidalCohomology_decomp
H^*_cusp(X_K, V) = ⊕_π m(π)H^*(𝔪_G, K_∞; π_∞ ⊗ V) ⊗ (π^∞)^K.

OMITTED SIGNATURE: LocallySymmetric.cuspidalCohomology_eq_franke
H^*_cusp is the {G}-summand of Franke's decomposition (automorphic-comparison).

OMITTED FULL EXAMPLE: cuspidal_GL2_weight2 (computation)
For the connected SL₂ component Γ₁(N)\ℍ with N≥5, constant ℂ coefficients and genus g, dim H¹_cusp=2
dim S₂(Γ₁(N))=2g. For a full GL₂ adelic quotient the real-component/central-character invariants
must also be included; no unconditional componentwise GL₂ two-dimensional formula is asserted.

OMITTED FULL EXAMPLE: cuspidal_torus (degenerate)
For G a torus, H^*_cusp(X_K, V) = H^*(X_K, V).

OMITTED FULL EXAMPLE: cuspidal_le_interior (characterisation)
Cuspidal cohomology maps into interior cohomology; for the connected modular curve Γ₁(N)\ℍ with
constant ℂ coefficients, both degree-one images have dimension 2g.

OMITTED FULL EXAMPLE: cuspidal_ne_ordinary (non-example)
For Γ₁(5)\ℍ (genus zero, four cusps), H¹_cusp=H¹_!=0 but H¹(X,ℂ)=ℂ³. This disproves a definition of
cuspidal cohomology as all ordinary cohomology. No strict interior-inclusion claim is made using
Saito–Kurokawa lifts, which are cuspidal CAP forms.

Earlier interface needed:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; AS.4/AS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; AG2.2/AG2.3 unitary parameter systems and AG2.4 GL systems. An arbitrary submodule of H*
cannot define cuspidal cohomology.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison; AutomorphicSpectralTheory:AS.5;
AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex; AutomorphicSpectralTheory:AS.4
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5/clozel-cohomological-gln — Regular algebraic cuspidal representations of GL_n contribute to cohomology

Mathematical specification:
Let F be totally real or CM and π a cuspidal automorphic representation of GL_n(A_F) with π_∞
regular L-algebraic, unramified outside S. Then π′ = π|·|^{(n+1)/2} is regular C-algebraic, i.e.
cohomological: there is an algebraic representation ξ of Res_{F/ℚ}GL_n over ℂ ≅ Q̄_p (extending to
Res_{O_F/ℤ}GL_n over Z̄_p) such that π′ occurs (its Hecke eigensystem away from S appears) in
H^i(X̃_K, M_{ξ,K}) ⊗_{Z̄_p} ℂ for some sufficiently small K = K_SK^S and some i, where X̃_K =
GL_n(F)\[(GL_n(F⊗ℝ)/ℝ_{>0}K_∞°) × GL_n(A_{F,f})/K] (equal to X_K for F CM, a (ℤ/2)^{[F:ℚ]}-cover for
F totally real); after choosing a quadratic character η : A_F^×/F^× → {±1} with prescribed
archimedean components, π′ ⊗ (η∘det) occurs in H^i(X_K, M_{ξ,K}) ⊗ ℂ.

OMITTED theorem signature: LocallySymmetric.clozel_cohomological_gln.

Earlier interface needed:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; AS.4/AS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; AG2.2/AG2.3 unitary parameter systems and AG2.4 GL systems. An arbitrary submodule of H*
cannot define cuspidal cohomology.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology;
ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison;
AutomorphicFormsOnReductiveGroups:AF.4; ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5/non-eisenstein-degree-range — Rational cohomology localized at a non-Eisenstein ideal is cuspidal and lives in [q₀, q₀ + l₀]

Mathematical specification:
Let F be an imaginary CM field with maximal totally real subfield F⁺, fix ι : Q̄_p ≅ ℂ, let q₀ = [F⁺
: ℚ]n(n−1)/2 and l₀ = [F⁺ : ℚ]n − 1, K ⊂ GL_n(A_F^∞) good and V_λ the O-lattice of highest weight λ.
(1) If π is cuspidal regular algebraic of weight ιλ with (π^∞)^K ≠ 0, the Hecke eigensystem of
(ι⁻¹π^∞)^K factors through T^S → T^S(K, λ). (2) If 𝔪 ⊂ T^S(K, V_λ) is a maximal ideal with ρ̄_𝔪
(assumed to exist, i.e. RΓ(X_K, V_λ) of S-Galois type) absolutely irreducible, then H^j(X_K,
V_λ)_𝔪[1/p] ≠ 0 only for j ∈ [q₀, q₀ + l₀], and if one of these groups is nonzero all are; and every
homomorphism f : T^S(K, V_λ)_𝔪 → Q̄_p is the eigensystem of (ι⁻¹π^∞)^K for a cuspidal regular
algebraic π of weight ιλ, with r_ι(π) residually ≅ ρ̄_𝔪.

OMITTED theorem signature: LocallySymmetric.non_eisenstein_degree_range.

Earlier interface needed:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; AS.4/AS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; AG2.2/AG2.3 unitary parameter systems and AG2.4 GL systems. An arbitrary submodule of H*
cannot define cuspidal cohomology.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison;
ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology;
ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal;
ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal;
AutomorphicGaloisRepresentationsPartII:AG2.4; AutomorphicFormsOnReductiveGroups:AF.4
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.5/unitary-middle-degree — Middle-degree rational cohomology of U(n, n) at 𝔪̃ is semisimple and cuspidal

Mathematical specification:
Let F be CM containing an imaginary quadratic field, G̃ = U(n, n) over F⁺, ρ half the sum of the
positive roots of Res_{F⁺/ℚ}G̃ (an element of X^*(Res_{F⁺/ℚ}T) ⊗ ℚ, T ⊂ G̃ the diagonal torus; ρ is
generally half-integral, while w(λ̃+ρ)−ρ is integral), ι : Q̄_p ≅ ℂ, and λ̃ ∈ (ℤ^{2n}_+)^{Hom(F⁺,E)}
such that for every w ∈ W^P (Kostant representatives for the Siegel parabolic) there is no cuspidal
automorphic representation of GL_n(A_F) of weight ιλ_w, λ_w = w(λ̃ + ρ) − ρ viewed as a GL_n/F
weight through the Siegel-Levi identification Res_{F/ℚ}GL_n ⊂ Res_{F⁺/ℚ}G̃ (the corresponding torus
character lattices identify (ℤ^{2n})^{Hom(F⁺,E)} with (ℤ^n)^{Hom(F,E)}). Let 𝔪̃ ⊂ T̃^S be a maximal
ideal in the support of H^*(X̃_{K̃}, Ṽ_λ̃) such that ρ̄_𝔪̃ is a direct sum of two n-dimensional
absolutely irreducible representations of G_F, S satisfying the conditions of ACC+ Theorem 2.3.8,
and d = ½ dim_ℝ X̃ = n²[F⁺ : ℚ]. Then H^d(X̃_{K̃}, Ṽ_λ̃)_𝔪̃[1/p] is a semisimple T̃^S[1/p]-module,
and every homomorphism T̃^S(H^d(X̃_{K̃}, Ṽ_λ̃)_𝔪̃) → Q̄_p is the eigensystem of (ι⁻¹π̃^∞)^{K̃} for a
cuspidal regular algebraic π̃ of G̃(A_{F⁺}) of weight ιλ̃.

OMITTED theorem signature: LocallySymmetric.unitary_middle_degree.

Earlier interface needed:
AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; AS.4/AS.5
discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological
modules; AG2.2/AG2.3 unitary parameter systems and AG2.4 GL systems. An arbitrary submodule of H*
cannot define cuspidal cohomology.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison;
ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula;
ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization;
AutomorphicGaloisRepresentationsPartII:AG2.2; AutomorphicGaloisRepresentationsPartII:AG2.3
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent — Finite-level descent along a normal inclusion of levels

Mathematical specification:
Let K′⊲K compact open, differing only at places in S′, and V finite projective with the needed
commuting coefficient actions. The relative compactified equivariant construction gives
C_{K′/K}=RΓ_{K/K′}(X_{K′},V) in D(R[K/K′]), with a ring homomorphism
H(G^{S∪S′},K^{S∪S′})⊗R→End_{D(R[K/K′])}(C_{K′/K}). There is a natural isomorphism
RΓ(K/K′,C_{K′/K})≅RΓ(X_K,V) in D(R), intertwining all these Hecke operators; its forgetful image is
RΓ(X_{K′},V). The same statements hold for compact support and boundary using betti-complexes,
compatibly with their exact triangle. For K″⊂K′ with both K″ and K′ normal in K choose a common neat
normal refinement inside K″: the two iterated derived-invariants identifications agree with direct
K/K″ descent, including the relative residual actions. If full K is good neat, the free full-level
finite cell model proves perfectness over R[K/K′] (R noetherian). If only K′ is neat, only
underlying R-perfectness is asserted. The stronger strict D(H⊗R[K/K′]) lift is an explicit
enhancement request. This node exports finite-level descent and refinement maps; assembly into level
systems is CC.0/CC.1, not a target of ALS.6.

OMITTED theorem signature: LocallySymmetric.finite_level_descent.

Earlier interface needed:
The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite
residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed
tower or continuous profinite comparison is assumed or imported.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action;
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle;
ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent;
EnhancedDerivedSheaves:E1
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre — The finite-cover Hochschild–Serre spectral sequence with Hecke action

Mathematical specification:
In the situation of finite-level-descent there is a convergent first-quadrant spectral sequence
E_2^{i,j} = H^i(K/K′, H^j(X_{K′}, V)) ⇒ H^{i+j}(X_K, V), natural in V, functorial for inclusions of
such pairs, and equivariant for H(G^{S∪S′}, K^{S∪S′}) ⊗ R acting on both sides (Hecke operators at
places where K and K′ agree); likewise for H^*_c and H^*(∂X̄), compatibly with the maps of the
boundary triangle, and the edge maps are π^* (E_2^{0,j} ← H^j) and restriction/corestriction
identities hold (res ∘ cor = Σ_{k∈K/K′} k, cor ∘ res = [K : K′]). At neat level it is the
Cartan–Leray spectral sequence of the regular covering X_{K′} → X_K; at non-neat level K it computes
the groupoid cohomology of X_K. If |K/K′| is invertible in R it degenerates: H^*(X_K, V) =
H^*(X_{K′}, V)^{K/K′}.

OMITTED theorem signature: LocallySymmetric.finite_cover_hochschild_serre.

Earlier interface needed:
The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite
residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed
tower or continuous profinite comparison is assumed or imported.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent;
ArithmeticLocallySymmetricSpaces:ALS.3/level-trace;
tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent;
mathlib:groupCohomology
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.6/lowest-degree-descent — The lowest nonvanishing localized degree descends along a p-group cover

Mathematical specification:
Let K′ ⊂ K be as in finite-level-descent, k a field of characteristic p, V a k[G(F)×K_{S∪S′}]-module
finite over k, and 𝔪 a maximal ideal of the Hecke algebra away from S ∪ S′ (and from the places
where K′ ≠ K), possibly enlarged by operators U_x commuting with the K/K′-action. Let i be the least
degree with H^i(X_{K′}, V)_𝔪 ≠ 0. If K/K′ is a p-group, or more generally K/K′ acts on H^i(X_{K′},
V)_𝔪 through a p-group quotient, then H^i(X_K, V)_𝔪 ≠ 0 and H^j(X_K, V)_𝔪 = 0 for j < i. In
particular, for the Taylor–Wiles covers of standard-level-subgroups the statement applies to Y_Δ(Q)
→ Y_0(Q) for Δ the maximal p-power quotient of Δ_Q (not to Y_1(Q) → Y_0(Q) itself unless Δ_Q is a
p-group or its prime-to-p part acts trivially after localization), as in the corrected form of
CG20's argument (PAPER-CALEGARI-GERAGHTY-20/E142).

OMITTED theorem signature: LocallySymmetric.lowest_degree_descent.

Earlier interface needed:
The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite
residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed
tower or continuous profinite comparison is assumed or imported.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre;
ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal;
ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups
-/

/-!
### ArithmeticLocallySymmetricSpaces:ALS.6/tower-acceptance-tests — Finite-cover acceptance tests for modular and compact quotients

Mathematical specification:
(i) Modular curves: for G = SL_{2,ℚ} (or GL_{2,ℚ}), N ≥ 3 and a prime p ∤ N, K′ = K(Np) ⊂ K = K(N)
is normal with K/K′ ≅ SL_2(F_p) (resp. GL_2(F_p) on the whole adelic cover; determinant-one
subgroups stabilize individual components); the finite-cover Hochschild–Serre spectral sequence for
X_{K′} → X_K with ℚ-coefficients degenerates, H^1(X_K, ℚ) = H^1(X_{K′}, ℚ)^{K/K′}, compatibly with
T_ℓ (ℓ ∤ Np), with H^1_c and with the boundary circles (cusps of X_{K′} over a cusp of X_K form a
K/K′-set with stabilizers the upper unipotent subgroup); dim H^1 = 2g + c − 1 per component. (ii)
Compact quotients: for G = D^×/ℚ^× with D an indefinite quaternion algebra over ℚ, ramified at a
nonempty set of primes, every X_K is compact (no proper ℚ-parabolics), ∂X̄_K = ∅, RΓ_c = RΓ, and for
neat K′ ⊲ K the spectral sequence of finite-cover-hochschild-serre with F_ℓ-coefficients, ℓ ∤
|K/K′|, degenerates to H^*(X_K, F_ℓ) = H^*(X_{K′}, F_ℓ)^{K/K′}, while for ℓ | |K/K′| nontrivial
differentials and higher group cohomology can occur.

OMITTED theorem signature: LocallySymmetric.finite_cover_acceptance_tests.

Earlier interface needed:
The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite
residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed
tower or continuous profinite comparison is assumed or imported.

Exact prerequisite references:
ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre;
ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle;
ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification;
ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition;
AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact; mathlib:CongruenceSubgroup.Gamma0;
mathlib:CongruenceSubgroup.Gamma1; mathlib:UpperHalfPlane
-/

end TauCeti.LocallySymmetric

/-
ALS.4 supplier correction: AF.1a is the unique cochain owner.
Nomizu-van Est needs absolute algebraic cochains over a characteristic-zero
field E, with the lattice/rational representation and normalizer hypotheses.
The boundary formula needs the AF.1a parabolic Kostant theorem with actual
Levi representations. The existing complex-relative cochain node over C does
not state these exact outputs; the AF.1a request and gap retain them.
No integral or mod-p Kostant comparison is inferred.
-/
