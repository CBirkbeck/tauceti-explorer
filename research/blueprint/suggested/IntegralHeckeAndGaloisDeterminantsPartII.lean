/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/IntegralHeckeAndGaloisDeterminantsPartII.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every proof is `sorry`; nothing here claims to be formalised.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

What is stated here. Every declaration of the roadmap whose carriers exist at the pins:
`GL (Fin n) K` over the fraction field `K` of a discrete valuation ring `𝒪` with finite residue
field, Mathlib's Hecke coset modules `𝕋 ⊤ U R` (`Mathlib/NumberTheory/HeckeRing/Defs.lean`) with
Tau Ceti's convolution ring structure (`HeckeCosetModule.instRingHeckeRing`,
`TauCeti/NumberTheory/HeckeRing/Associativity.lean`), group algebras, polynomials, resultants,
the étale locus of an algebra, and Jordan–Chevalley decomposition. The Weil group and the Artin
map are not in the pinned libraries (Tau Ceti ClassFieldTheory layers 7 and 9 plan them): they
enter as an explicit group `W` with the reciprocity homomorphism `rec : W →* Kˣ`,
σ ↦ Art⁻¹(σ|ab). ArithmeticLocallySymmetricSpaces ALS.0's Iwahori subgroups are written out
once, below, because the pinned libraries do not contain them; they are owned by ALS.0. The
quasi-split unitary group is not at the pins either, so its levels and operators at a split
place are stated on the `GL_{2n}(F_v)` side of `ι_v`.

What is not stated here. A statement whose carriers are not at the pins is a target of the
roadmap document, not a Lean declaration: smooth and admissible representations and the
action of Hecke algebras on their invariants (SmoothRepresentationsOfLocalGroups), the local
Langlands correspondence and Weil–Deligne representations (EndoscopicTransferAndUnitaryTraceComparison
ET.6, ArithmeticGaloisRepresentations R01.2), Satake maps of parabolic Hecke algebras
(ArithmeticLocallySymmetricSpaces ALS.4), the unitary group and `ι_{v^c}`
(TorsionCohomologyInfrastructure TC.3), Chenevier determinants (IntegralHeckeAndGaloisDeterminants
IHG.0), arithmetic locally symmetric spaces with their complexes and derived Hecke images
(ALS.0–ALS.6, IHG.2), absolute Galois groups of number fields with Frobenius elements at places,
and Galois representations attached to automorphic representations
(AutomorphicGaloisRepresentationsPartII). No such object is replaced by a `Prop` field or a
placeholder; the closing comment lists those declarations by name, layer by layer.
-/
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.OrderOfVanishing.Noetherian
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.Data.Matrix.Block
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.RingTheory.Polynomial.Vieta
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.LinearAlgebra.JordanChevalley
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.NumberTheory.HeckeRing.Defs
import Mathlib.LinearAlgebra.Matrix.Reindex
import Mathlib.Algebra.Ring.Subring.Basic
import Mathlib.RingTheory.Etale.Locus
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import TauCeti.NumberTheory.HeckeRing.Associativity

set_option autoImplicit false
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

noncomputable section

open Polynomial
open scoped HeckeCosetModule

namespace TauCeti.RamifiedHecke

/-! ## Carriers and conventions -/

section KOnly

variable (K : Type*) [Field K] (n : ℕ)

/-- Upper unipotent matrices `N_n(F_v)`. -/
def upperUnipotent : Subgroup (GL (Fin n) K) where
  carrier := {g | (g : Matrix (Fin n) (Fin n) K).BlockTriangular id ∧
    ∀ i, (g : Matrix (Fin n) (Fin n) K) i i = 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- Lower unipotent matrices `N̄_n(F_v)`. -/
def lowerUnipotent : Subgroup (GL (Fin n) K) where
  carrier := {g | (g : Matrix (Fin n) (Fin n) K).BlockTriangular OrderDual.toDual ∧
    ∀ i, (g : Matrix (Fin n) (Fin n) K) i i = 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The block-diagonal Levi `GL_n × GL_n ↪ GL_{2n}` (first factor the `A`-block). -/
def SiegelParahoric.leviEmbed : GL (Fin n) K × GL (Fin n) K →* GL (Fin n ⊕ Fin n) K where
  toFun x := ⟨Matrix.fromBlocks (x.1 : Matrix (Fin n) (Fin n) K) 0 0 (x.2 : Matrix (Fin n) (Fin n) K),
    Matrix.fromBlocks ((x.1⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) 0 0
      ((x.2⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K), sorry, sorry⟩
  map_one' := sorry
  map_mul' := sorry

/-- The unipotent radical `N_P` of the Siegel parabolic `ι_v(P)`: block upper unitriangular. -/
def siegelUnipotent : Subgroup (GL (Fin n ⊕ Fin n) K) where
  carrier := {g | ∀ i j, (g : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) K) (Sum.inl i) (Sum.inl j) =
      (1 : Matrix (Fin n) (Fin n) K) i j ∧
    (g : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) K) (Sum.inr i) (Sum.inr j) =
      (1 : Matrix (Fin n) (Fin n) K) i j ∧
    (g : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) K) (Sum.inr i) (Sum.inl j) = 0}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The opposite unipotent radical `N̄_P`: block lower unitriangular. -/
def siegelOppUnipotent : Subgroup (GL (Fin n ⊕ Fin n) K) where
  carrier := {g | ∀ i j, (g : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) K) (Sum.inl i) (Sum.inl j) =
      (1 : Matrix (Fin n) (Fin n) K) i j ∧
    (g : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) K) (Sum.inr i) (Sum.inr j) =
      (1 : Matrix (Fin n) (Fin n) K) i j ∧
    (g : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) K) (Sum.inl i) (Sum.inr j) = 0}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- A subgroup `U` of `GL_{2n}(F_v)` has an Iwahori decomposition with respect to the Siegel
parabolic `ι_v(P) = M ⋉ N_P`: every element of `U` is uniquely a product of elements of
`U ∩ N̄_P`, `U ∩ M` and `U ∩ N_P`, in this order. -/
def HasSiegelIwahoriDecomposition (U : Subgroup (GL (Fin n ⊕ Fin n) K)) : Prop :=
  let f : (U ⊓ siegelOppUnipotent K n : Subgroup (GL (Fin n ⊕ Fin n) K)) ×
      U.comap (SiegelParahoric.leviEmbed K n) ×
      (U ⊓ siegelUnipotent K n : Subgroup (GL (Fin n ⊕ Fin n) K)) → GL (Fin n ⊕ Fin n) K :=
    fun x => (x.1 : GL (Fin n ⊕ Fin n) K) *
      SiegelParahoric.leviEmbed K n (x.2.1 : GL (Fin n) K × GL (Fin n) K) *
      (x.2.2 : GL (Fin n ⊕ Fin n) K)
  Function.Injective f ∧ Set.range f = (U : Set (GL (Fin n ⊕ Fin n) K))

/-- The reindexing `GL(Fin n ⊕ Fin n) ≃* GL(Fin (n + n))`, which moves the Siegel blocks to the
first and last `n` coordinates. -/
def toFinIndex : GL (Fin n ⊕ Fin n) K →* GL (Fin (n + n)) K :=
  Units.map (Matrix.reindexAlgEquiv K K finSumFinEquiv).toRingEquiv.toMonoidHom

/-- The block-diagonal Levi `GL_n × GL_n ↪ GL_{2n}` on the index `Fin (n + n)`. -/
def leviEmbedFin : GL (Fin n) K × GL (Fin n) K →* GL (Fin (n + n)) K :=
  (toFinIndex K n).comp (SiegelParahoric.leviEmbed K n)

end KOnly


section Carriers

variable (𝒪 : Type*) [CommRing 𝒪] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
  (K : Type*) [Field K] [Algebra 𝒪 K] [IsFractionRing 𝒪 K] (n : ℕ)

/-- Generic DVR order on the fraction field, restricted to units. This wraps Mathlib's
`Ring.ordFrac`; for a nonarchimedean local field use the already implemented
`TauCeti.normalizedValuation`, rather than planning another valuation. -/
def valuationZ : Kˣ →* Multiplicative ℤ :=
  WithZero.unitsWithZeroEquiv.toMonoidHom.comp
    (Units.map (Ring.ordFrac 𝒪 (K := K)).toMonoidHom)

/-- The residue cardinality `q_v`. -/
abbrev q : ℕ := Nat.card (IsLocalRing.ResidueField 𝒪)

/-- `GL_n(O_{F_v}) → GL_n(F_v)`. -/
def toGLK : GL (Fin n) 𝒪 →* GL (Fin n) K := Matrix.GeneralLinearGroup.map (algebraMap 𝒪 K)

/-- Reduction `GL_n(O_{F_v}) → GL_n(k(v))`. -/
def reduce : GL (Fin n) 𝒪 →* GL (Fin n) (IsLocalRing.ResidueField 𝒪) :=
  Matrix.GeneralLinearGroup.map (IsLocalRing.residue 𝒪)

/-- Diagonal matrices `(ι → Lˣ) →* GL ι L`. -/
def diagGL {ι : Type*} [Fintype ι] [DecidableEq ι] (L : Type*) [CommRing L] :
    (ι → Lˣ) →* GL ι L where
  toFun t := ⟨Matrix.diagonal (fun i => (t i : L)), Matrix.diagonal (fun i => ((t i)⁻¹ : Lˣ)),
    sorry, sorry⟩
  map_one' := sorry
  map_mul' := sorry


/-- ALS.0's Iwahori subgroup `Iw_v` (owned by ArithmeticLocallySymmetricSpaces ALS.0). -/
def iwahori : Subgroup (GL (Fin n) K) :=
  Subgroup.map (toGLK 𝒪 K n)
    { carrier := {g | ((reduce 𝒪 n g : GL (Fin n) (IsLocalRing.ResidueField 𝒪)) :
          Matrix (Fin n) (Fin n) (IsLocalRing.ResidueField 𝒪)).BlockTriangular id}
      mul_mem' := sorry
      one_mem' := sorry
      inv_mem' := sorry }

/-- ALS.0's pro-`ℓ` Iwahori subgroup `Iw_{v,1}` (owned by ALS.0). -/
def iwahoriOne : Subgroup (GL (Fin n) K) :=
  Subgroup.map (toGLK 𝒪 K n)
    { carrier := {g | ((reduce 𝒪 n g : GL (Fin n) (IsLocalRing.ResidueField 𝒪)) :
          Matrix (Fin n) (Fin n) (IsLocalRing.ResidueField 𝒪)).BlockTriangular id ∧
          ∀ i, ((reduce 𝒪 n g : GL (Fin n) (IsLocalRing.ResidueField 𝒪)) :
            Matrix (Fin n) (Fin n) (IsLocalRing.ResidueField 𝒪)) i i = 1}
      mul_mem' := sorry
      one_mem' := sorry
      inv_mem' := sorry }



/-- The local Hecke algebra `H(G, U) ⊗ R`, as the Hecke coset module with Tau Ceti's
convolution product (volume of `U` equal to 1). -/
abbrev HeckeAlg {G : Type*} [Group G] (U : Subgroup G) (R : Type*) [CommRing R] :=
  𝕋 (⊤ : Submonoid G) U R

/-- The double coset operator `[UgU]`. -/
def dc {G : Type*} [Group G] (U : Subgroup G) (R : Type*) [CommRing R] (g : G) :
    HeckeAlg U R :=
  HeckeCosetModule.of (Finsupp.single (HeckeCoset.mk U U ⟨g, Submonoid.mem_top g⟩) 1)

/-- `Iw_v(1, 2)`: reduction modulo `ϖ_v` unipotent upper triangular, and the strictly lower
entries in `ϖ_v² O_{F_v}` (ACC+ §2.2.5, p. 922). -/
def iwahoriOneTwo : Subgroup (GL (Fin n) K) :=
  Subgroup.map (toGLK 𝒪 K n)
    { carrier := {g | ((reduce 𝒪 n g : GL (Fin n) (IsLocalRing.ResidueField 𝒪)) :
          Matrix (Fin n) (Fin n) (IsLocalRing.ResidueField 𝒪)).BlockTriangular id ∧
          (∀ i, ((reduce 𝒪 n g : GL (Fin n) (IsLocalRing.ResidueField 𝒪)) :
            Matrix (Fin n) (Fin n) (IsLocalRing.ResidueField 𝒪)) i i = 1) ∧
          ∀ i j, j < i → (g : Matrix (Fin n) (Fin n) 𝒪) i j ∈ IsLocalRing.maximalIdeal 𝒪 ^ 2}
      mul_mem' := sorry
      one_mem' := sorry
      inv_mem' := sorry }

/-- Coefficient change `H(G, U) ⊗ R → H(G, U) ⊗ R'` along a ring map, coefficientwise on the
basis of double cosets. -/
def heckeMap {G : Type*} [Group G] (U : Subgroup G) [IsHeckeTriple (⊤ : Submonoid G) U U]
    {R R' : Type*} [CommRing R] [CommRing R'] (f : R →+* R') : HeckeAlg U R →+* HeckeAlg U R' where
  toFun x := HeckeCosetModule.of (Finsupp.mapRange f f.map_zero (HeckeCosetModule.of.symm x))
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

end Carriers

/-! ## IHR.1 — Pro-ℓ-Iwahori levels and the ramified Hecke operators -/

section IHR1

variable {𝒪 : Type*} [CommRing 𝒪] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
  {K : Type*} [Field K] [Algebra 𝒪 K] [IsFractionRing 𝒪 K] {n : ℕ}

variable [hfinite : Finite (IsLocalRing.ResidueField 𝒪)]

include hfinite

variable (𝒪 K n) in
/-- IHR.1/tame-iwahori-level: an open compact `I_v` with `Iw_{v,1} ≤ I_v ≤ Iw_v`. -/
structure TameIwahoriLevel where
  toSubgroup : Subgroup (GL (Fin n) K)
  iwahoriOne_le : iwahoriOne 𝒪 K n ≤ toSubgroup
  le_iwahori : toSubgroup ≤ iwahori 𝒪 K n

namespace TameIwahoriLevel

/-- The diagonal of the reduction, `d : Iw_v → (k(v)ˣ)ⁿ`, with kernel `Iw_{v,1}`. -/
def diagRed : iwahori 𝒪 K n →* (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ) := sorry

/-- `ofTorusSubgroup A = d⁻¹(A)`. -/
def ofTorusSubgroup (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    TameIwahoriLevel 𝒪 K n where
  toSubgroup := (A.comap diagRed).map (iwahori 𝒪 K n).subtype
  iwahoriOne_le := sorry
  le_iwahori := sorry

/-- `A(I_v) = d(I_v)`. -/
def torusSubgroup (I : TameIwahoriLevel 𝒪 K n) :
    Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ) :=
  (I.toSubgroup.subgroupOf (iwahori 𝒪 K n)).map diagRed

instance : PartialOrder (TameIwahoriLevel 𝒪 K n) :=
  PartialOrder.lift TameIwahoriLevel.toSubgroup
    (fun I J h => by cases I; cases J; cases h; rfl)

/-- Tame Iwahori levels correspond to subgroups of `(k(v)ˣ)ⁿ`. -/
def orderIsoTorusSubgroup :
    TameIwahoriLevel 𝒪 K n ≃o Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ) := sorry

theorem orderIsoTorusSubgroup_apply (I : TameIwahoriLevel 𝒪 K n) :
    orderIsoTorusSubgroup I = I.torusSubgroup := sorry

theorem orderIsoTorusSubgroup_symm_apply (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    (orderIsoTorusSubgroup (K := K)).symm A = ofTorusSubgroup A := sorry

/-- The torus part `T_{I_v} = I_v ∩ T_n(F_v)`. -/
def torusPart (I : TameIwahoriLevel 𝒪 K n) : Subgroup (Fin n → Kˣ) :=
  I.toSubgroup.comap (diagGL K)

theorem iwahoriDecomposition (I : TameIwahoriLevel 𝒪 K n) :
    Function.Injective (fun x : (I.toSubgroup ⊓ lowerUnipotent K n : Subgroup (GL (Fin n) K)) ×
        I.torusPart × (I.toSubgroup ⊓ upperUnipotent K n : Subgroup (GL (Fin n) K)) =>
        (x.1 : GL (Fin n) K) * diagGL K (x.2.1 : Fin n → Kˣ) * (x.2.2 : GL (Fin n) K)) ∧
      Set.range (fun x : (I.toSubgroup ⊓ lowerUnipotent K n : Subgroup (GL (Fin n) K)) ×
        I.torusPart × (I.toSubgroup ⊓ upperUnipotent K n : Subgroup (GL (Fin n) K)) =>
        (x.1 : GL (Fin n) K) * diagGL K (x.2.1 : Fin n → Kˣ) * (x.2.2 : GL (Fin n) K)) =
        (I.toSubgroup : Set (GL (Fin n) K)) := sorry

instance normal_iwahori (I : TameIwahoriLevel 𝒪 K n) :
    (I.toSubgroup.subgroupOf (iwahori 𝒪 K n)).Normal := sorry

theorem index_iwahori (I : TameIwahoriLevel 𝒪 K n) :
    (I.toSubgroup.subgroupOf (iwahori 𝒪 K n)).index * Nat.card I.torusSubgroup =
      (q 𝒪 - 1) ^ n := sorry

instance isHeckeTriple (I : TameIwahoriLevel 𝒪 K n) :
    IsHeckeTriple (⊤ : Submonoid (GL (Fin n) K)) I.toSubgroup I.toSubgroup := sorry

end TameIwahoriLevel

open TameIwahoriLevel

/-- TameIwahoriLevel.ofTorusSubgroup_top -/
example : (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n) ⊤).toSubgroup = iwahori 𝒪 K n := sorry

/-- TameIwahoriLevel.ofTorusSubgroup_bot -/
example : (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n) ⊥).toSubgroup = iwahoriOne 𝒪 K n := sorry

/-- TameIwahoriLevel.rank_one -/
example (A : Subgroup (Fin 1 → (IsLocalRing.ResidueField 𝒪)ˣ)) (g : GL (Fin 1) K) :
    g ∈ (ofTorusSubgroup (K := K) A).toSubgroup ↔
      ∃ u : 𝒪ˣ, algebraMap 𝒪 K u = (g : Matrix (Fin 1) (Fin 1) K) 0 0 ∧
        (fun _ => Units.map (IsLocalRing.residue 𝒪).toMonoidHom u) ∈ A := sorry

/-- TameIwahoriLevel.not_iwahori_one_two -/
example : iwahoriOneTwo 𝒪 K 2 < iwahoriOne 𝒪 K 2 ∧
    ¬ ∃ I : TameIwahoriLevel 𝒪 K 2, I.toSubgroup = iwahoriOneTwo 𝒪 K 2 := sorry

/-- TameIwahoriLevel.not_parahoric -/
example (hn : 2 ≤ n) : ¬ ∃ I : TameIwahoriLevel 𝒪 K n, I.toSubgroup = (toGLK 𝒪 K n).range :=
  sorry

/-! ### IHR.1/tame-torus-quotient -/

/-- `Ξ_v = T_n(F_v)/T_{I_v}`. -/
abbrev TameTorus (I : TameIwahoriLevel 𝒪 K n) := (Fin n → Kˣ) ⧸ I.torusPart

namespace TameTorus

variable (I : TameIwahoriLevel 𝒪 K n)

/-- The quotient map `T_n(F_v) → Ξ_v`. -/
def mk : (Fin n → Kˣ) →* TameTorus I := QuotientGroup.mk' I.torusPart

/-- The valuation `Ξ_v → ℤⁿ`. -/
def valuation : TameTorus I →* (Fin n → Multiplicative ℤ) := sorry

theorem valuation_mk (t : Fin n → Kˣ) :
    valuation I (mk I t) = fun i => valuationZ 𝒪 K (t i) := sorry

theorem exact (t : Fin n → Kˣ) :
    valuation I (mk I t) = 1 ↔ ∃ u : Fin n → 𝒪ˣ, mk I t = mk I (fun i => Units.map (algebraMap 𝒪 K).toMonoidHom (u i)) :=
  sorry

/-- The positive cone `Ξ_v^+` (valuations non-increasing). -/
def positive : Submonoid (TameTorus I) where
  carrier := {x | ∀ i j : Fin n, i ≤ j →
    Multiplicative.toAdd (valuation I x j) ≤ Multiplicative.toAdd (valuation I x i)}
  mul_mem' := sorry
  one_mem' := sorry

/-- The strongly positive element `z_v = diag(ϖ^{n−1}, …, ϖ, 1)` for a uniformizer `ϖ`. -/
def strongPos (ϖ : Kˣ) : TameTorus I := mk I (fun i => ϖ ^ (n - 1 - (i : ℕ)))

theorem isPositive_iff (t : Fin n → Kˣ) :
    mk I t ∈ positive I ↔
      ∀ g ∈ (I.toSubgroup ⊓ upperUnipotent K n : Subgroup (GL (Fin n) K)),
        diagGL K t * g * (diagGL K t)⁻¹ ∈ (I.toSubgroup ⊓ upperUnipotent K n : Subgroup _) := sorry

theorem exists_strongPos_pow_mul_mem (ϖ : Kˣ) (hϖ : valuationZ 𝒪 K ϖ = Multiplicative.ofAdd 1)
    (x : TameTorus I) : ∃ k : ℕ, strongPos I ϖ ^ k * x ∈ positive I := sorry

/-- Functoriality in the level. -/
def map {I J : TameIwahoriLevel 𝒪 K n} (h : I ≤ J) : TameTorus I →* TameTorus J :=
  QuotientGroup.map _ _ (MonoidHom.id _) sorry

theorem map_id : map (le_refl I) = MonoidHom.id (TameTorus I) := sorry

theorem map_comp {I J L : TameIwahoriLevel 𝒪 K n} (h₁ : I ≤ J) (h₂ : J ≤ L) :
    (map h₂).comp (map h₁) = map (h₁.trans h₂) := sorry

end TameTorus

/-- The group algebra `R[Ξ_v]` is commutative; this instance fixes the semiring structure used by
polynomials over it. -/
instance TameTorus.instCommRingGroupAlgebra (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R] :
    CommRing (MonoidAlgebra R (TameTorus I)) := MonoidAlgebra.commRing

/-- TameTorus.valuation_bijective_iwahori -/
example : Function.Bijective (TameTorus.valuation (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n) ⊤)) := sorry

/-- TameTorus.rank_one -/
example (I : TameIwahoriLevel 𝒪 K 1) : TameTorus.positive I = ⊤ := sorry

/-- TameTorus.torsion_iwahoriOne -/
example : Nat.card (TameTorus.valuation (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n) ⊥)).ker = (q 𝒪 - 1) ^ n :=
  sorry

/-- TameTorus.not_unramified_quotient -/
example (I : TameIwahoriLevel 𝒪 K n) (h : I ≠ ofTorusSubgroup ⊤) :
    (TameTorus.valuation I).ker ≠ ⊥ := sorry

/-- TameTorus.not_positive_antidominant -/
example (I : TameIwahoriLevel 𝒪 K 2) (ϖ : Kˣ) (hϖ : valuationZ 𝒪 K ϖ = Multiplicative.ofAdd 1) :
    TameTorus.mk I ![1, ϖ] ∉ TameTorus.positive I ∧ TameTorus.mk I ![ϖ, 1] ∈ TameTorus.positive I :=
  sorry

/-! ### IHR.1/tame-double-coset-invertible -/

theorem tame_double_coset_invertible (I : TameIwahoriLevel 𝒪 K n) {R : Type*} [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (t : Fin n → Kˣ) :
    IsUnit (dc I.toSubgroup R (diagGL K t)) := sorry

theorem tame_double_coset_mul_of_positive (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (t t' : Fin n → Kˣ) (ht : TameTorus.mk I t ∈ TameTorus.positive I)
    (ht' : TameTorus.mk I t' ∈ TameTorus.positive I) :
    dc I.toSubgroup R (diagGL K t) * dc I.toSubgroup R (diagGL K t') =
      dc I.toSubgroup R (diagGL K (t * t')) := sorry

/-! ### IHR.1/tame-torus-embedding -/

/-- `t : R[Ξ_v] →+* H(GL_n(F_v), I_v) ⊗ R`, for `q_v ∈ Rˣ`. -/
def tameEmbedding (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) : MonoidAlgebra R (TameTorus I) →+* HeckeAlg I.toSubgroup R := sorry

section tameEmbedding

variable (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R))

theorem tameEmbedding_of_isPositive (t : Fin n → Kˣ)
    (ht : TameTorus.mk I t ∈ TameTorus.positive I) :
    tameEmbedding I R hq (MonoidAlgebra.of R _ (TameTorus.mk I t)) =
      dc I.toSubgroup R (diagGL K t) := sorry

theorem tameEmbedding_injective : Function.Injective (tameEmbedding I R hq) := sorry

theorem tameEmbedding_commute (x y : MonoidAlgebra R (TameTorus I)) :
    Commute (tameEmbedding I R hq x) (tameEmbedding I R hq y) := sorry

theorem tameEmbedding_isUnit (x : TameTorus I) :
    IsUnit (tameEmbedding I R hq (MonoidAlgebra.of R _ x)) := sorry

/-- The degree character `deg : H(G, U) ⊗ R → R`, `[UgU] ↦ #(UgU/U)`. -/
def degree : HeckeAlg I.toSubgroup R →+* R := sorry

/-- The modulus character `|δ_{B_n}|⁻¹ : Ξ_v → ℤ[1/q]ˣ`, evaluated in `R`. -/
def modulusInv (hq : IsUnit (q 𝒪 : R)) : TameTorus I →* Rˣ :=
  { toFun := fun x => hq.unit ^ (∑ i : Fin n, ((n : ℤ) - 1 - 2 * (i : ℕ)) *
      Multiplicative.toAdd (TameTorus.valuation I x i))
    map_one' := sorry
    map_mul' := sorry }

theorem tameEmbedding_degree (x : TameTorus I) :
    degree I R (tameEmbedding I R hq (MonoidAlgebra.of R _ x)) = (modulusInv I R hq x : R) := sorry

/-- Coefficient change commutes with `t`. -/
theorem tameEmbedding_map {R' : Type*} [CommRing R'] (f : R →+* R') (hq' : IsUnit (q 𝒪 : R'))
    (x : MonoidAlgebra R (TameTorus I)) :
    heckeMap I.toSubgroup f (tameEmbedding I R hq x) =
      tameEmbedding I R' hq' (MonoidAlgebra.mapRingHom (TameTorus I) f x) := sorry

end tameEmbedding

/-- tameEmbedding_rank_one -/
example (I : TameIwahoriLevel 𝒪 K 1) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R))
    (t : Fin 1 → Kˣ) :
    tameEmbedding I R hq (MonoidAlgebra.of R _ (TameTorus.mk I t)) = dc I.toSubgroup R (diagGL K t) :=
  sorry

/-- tameEmbedding_degree_antidominant -/
example (I : TameIwahoriLevel 𝒪 K 2) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R))
    (ϖ : Kˣ) (hϖ : valuationZ 𝒪 K ϖ = Multiplicative.ofAdd 1) :
    degree I R (tameEmbedding I R hq (MonoidAlgebra.of R _ (TameTorus.mk I ![1, ϖ]))) *
      (q 𝒪 : R) = 1 := sorry

/-- tameEmbedding_center -/
example (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (ϖ : Kˣ) :
    tameEmbedding I R hq (MonoidAlgebra.of R _ (TameTorus.mk I (fun _ => ϖ))) =
      dc I.toSubgroup R (diagGL K (fun _ => ϖ)) := sorry

/-! ### IHR.1/tame-hecke-operators and IHR.1/ramified-hecke-polynomial

The operators are first defined in the commutative group algebra `O[Ξ_v]` (universal
versions) and then mapped by `t`. `rec : W →* Kˣ` is σ ↦ Art⁻¹(σ|ab), with Art sending
uniformizers to geometric Frobenius elements (Tau Ceti ClassFieldTheory layers 7 and 9). -/

section Operators

/-- The structure map `R → H(G, U) ⊗ R`, `r ↦ r·[U]`. -/
def heckeScalar {G : Type*} [Group G] (U : Subgroup G) [IsHeckeTriple (⊤ : Submonoid G) U U]
    (R : Type*) [CommRing R] : R →+* HeckeAlg U R := sorry

/-- `q_v^{(i−1)v(α)}[e_i(α)] ∈ R[Ξ_v]` (with `i : Fin n` zero-based, so the exponent is `i·v(α)`). -/
def tameOperatorUniv (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (α : Kˣ) : MonoidAlgebra R (TameTorus I) :=
  MonoidAlgebra.single (TameTorus.mk I (Pi.mulSingle i α))
    ((hq.unit ^ ((i : ℕ) * Multiplicative.toAdd (valuationZ 𝒪 K α)) : Rˣ) : R)

/-- `t_{v,i}(α)`. -/
def tameOperator (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (α : Kˣ) : HeckeAlg I.toSubgroup R :=
  tameEmbedding I R hq (tameOperatorUniv I R hq i α)

theorem tameOperator_mul (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (α β : Kˣ) :
    tameOperator I R hq i (α * β) = tameOperator I R hq i α * tameOperator I R hq i β := sorry

theorem tameOperator_one (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i : Fin n) : tameOperator I R hq i 1 = 1 := sorry

theorem tameOperator_units (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (u : 𝒪ˣ) :
    tameOperator I R hq i (Units.map (algebraMap 𝒪 K).toMonoidHom u) =
      dc I.toSubgroup R (diagGL K (Pi.mulSingle i (Units.map (algebraMap 𝒪 K).toMonoidHom u))) :=
  sorry

theorem tameOperator_uniformizer (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (ϖ : Kˣ)
    (hϖ : valuationZ 𝒪 K ϖ = Multiplicative.ofAdd 1) :
    tameOperator I R hq i ϖ =
      heckeScalar I.toSubgroup R ((hq.unit ^ (i : ℕ) : Rˣ) : R) *
        tameEmbedding I R hq (MonoidAlgebra.of R _ (TameTorus.mk I (Pi.mulSingle i ϖ))) := sorry

/-- `ψ_{v,i} : W → (H(GL_n(F_v), I_v) ⊗ R)ˣ`, σ ↦ t_{v,i}(rec σ). -/
def weilCharacter (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) {W : Type*} [Group W] (rec : W →* Kˣ) (i : Fin n) :
    W →* (HeckeAlg I.toSubgroup R)ˣ := sorry

theorem weilCharacter_apply (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) {W : Type*} [Group W] (rec : W →* Kˣ) (i : Fin n) (σ : W) :
    (weilCharacter I R hq rec i σ : HeckeAlg I.toSubgroup R) = tameOperator I R hq i (rec σ) :=
  sorry

/-- The multiset `{q_v^{(i−1)v(α)}[e_i(α)]}_i ⊂ R[Ξ_v]`. -/
def tameRootsUniv (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) : Multiset (MonoidAlgebra R (TameTorus I)) :=
  (Finset.univ : Finset (Fin n)).val.map (fun i => tameOperatorUniv I R hq i α)

/-- `e_{v,i}(α)`, computed in the commutative ring `R[Ξ_v]` and mapped by `t`. -/
def tameElemSymm (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i : ℕ) (α : Kˣ) : HeckeAlg I.toSubgroup R :=
  tameEmbedding I R hq ((tameRootsUniv I R hq α).esymm i)

theorem tameElemSymm_zero (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) : tameElemSymm I R hq 0 α = 1 := sorry

theorem tameElemSymm_top (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    tameElemSymm I R hq n α =
      heckeScalar I.toSubgroup R
          ((hq.unit ^ ((n * (n - 1) / 2 : ℕ) * Multiplicative.toAdd (valuationZ 𝒪 K α)) : Rˣ) : R) *
        dc I.toSubgroup R (diagGL K (fun _ => α)) := sorry

theorem tameOperator_restrict_level (I J : TameIwahoriLevel 𝒪 K n) (h : I ≤ J) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (α : Kˣ) :
    tameEmbedding J R hq (MonoidAlgebra.mapDomainRingHom R (TameTorus.map h)
      (tameOperatorUniv I R hq i α)) = tameOperator J R hq i α := sorry

theorem tameOperator_commute (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i j : Fin n) (α β : Kˣ) :
    Commute (tameOperator I R hq i α) (tameOperator I R hq j β) := sorry

/-- `P^{univ}_{v,σ}(X) ∈ R[Ξ_v][X]`, here indexed by `α = rec σ`. -/
def ramifiedHeckePolyUniv (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) : (MonoidAlgebra R (TameTorus I))[X] :=
  ((tameRootsUniv I R hq α).map (fun r => X - C r)).prod

/-- `P_{v,σ}(X) = ∏ (X − t_{v,i}(σ))`, the image of the universal polynomial under `t`. -/
def ramifiedHeckePoly (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) : (HeckeAlg I.toSubgroup R)[X] :=
  (ramifiedHeckePolyUniv I R hq α).map (tameEmbedding I R hq)

theorem ramifiedHeckePoly_monic (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) : (ramifiedHeckePoly I R hq α).Monic := sorry

theorem ramifiedHeckePoly_natDegree (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    [Nontrivial R] (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    (ramifiedHeckePoly I R hq α).natDegree = n := sorry

theorem ramifiedHeckePoly_coeff (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) (i : ℕ) (hi : i ≤ n) :
    (ramifiedHeckePoly I R hq α).coeff (n - i) = (-1) ^ i * tameElemSymm I R hq i α := sorry

theorem ramifiedHeckePoly_eq_prod (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    ramifiedHeckePoly I R hq α = (List.ofFn fun i : Fin n => X - C (tameOperator I R hq i α)).prod :=
  sorry

theorem ramifiedHeckePoly_coeff_zero_isUnit (I : TameIwahoriLevel 𝒪 K n) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    IsUnit ((ramifiedHeckePoly I R hq α).coeff 0) := sorry

/-- The twist `f_χ(f)(g) = χ(det g)⁻¹ f(g)` of `H(GL_n(F_v), I_v) ⊗ R` by a character `χ` of
`F_vˣ` trivial on `det(I_v)`: it multiplies the basis element `[I_v g I_v]` by `χ(det g)⁻¹`. -/
def heckeTwist (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R] (χ : Kˣ →* Rˣ)
    (hχ : ∀ g ∈ I.toSubgroup, χ (Matrix.GeneralLinearGroup.det g) = 1) :
    HeckeAlg I.toSubgroup R ≃+* HeckeAlg I.toSubgroup R where
  toFun x := HeckeCosetModule.of ((HeckeCosetModule.of.symm x).sum fun D r =>
    Finsupp.single D (r * (((χ (Matrix.GeneralLinearGroup.det (D.rep : GL (Fin n) K)))⁻¹ : Rˣ) : R)))
  invFun x := HeckeCosetModule.of ((HeckeCosetModule.of.symm x).sum fun D r =>
    Finsupp.single D (r * ((χ (Matrix.GeneralLinearGroup.det (D.rep : GL (Fin n) K)) : Rˣ) : R)))
  left_inv := sorry
  right_inv := sorry
  map_mul' := sorry
  map_add' := sorry

theorem tameOperator_twist (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (χ : Kˣ →* Rˣ)
    (hχ : ∀ g ∈ I.toSubgroup, χ (Matrix.GeneralLinearGroup.det g) = 1) (i : Fin n) (α : Kˣ) :
    heckeTwist I R χ hχ (tameOperator I R hq i α) =
      heckeScalar I.toSubgroup R (((χ α)⁻¹ : Rˣ) : R) * tameOperator I R hq i α := sorry

/-- `ψ_{v,i}` is trivial on the inertia elements whose reciprocity image `u ∈ O_{F_v}ˣ` has
`i`-th residue coordinate in `A(I_v)`; in particular on wild inertia (`u ≡ 1`), and on all of
inertia when `I_v = Iw_v`. -/
theorem weilCharacter_inertia (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) {W : Type*} [Group W] (rec : W →* Kˣ) (i : Fin n) (σ : W) (u : 𝒪ˣ)
    (hσ : rec σ = Units.map (algebraMap 𝒪 K).toMonoidHom u)
    (hu : Pi.mulSingle i (Units.map (IsLocalRing.residue 𝒪).toMonoidHom u) ∈ I.torusSubgroup) :
    weilCharacter I R hq rec i σ = 1 := sorry

theorem ramifiedHeckePoly_map (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) {R' : Type*} [CommRing R'] (f : R →+* R') (hq' : IsUnit (q 𝒪 : R'))
    (α : Kˣ) :
    (ramifiedHeckePoly I R hq α).map (heckeMap I.toSubgroup f) = ramifiedHeckePoly I R' hq' α :=
  sorry

/-- `f_χ(P_{v,σ})(X) = χ(σ)^{−n} P_{v,σ}(χ(σ) X)`. -/
theorem ramifiedHeckePoly_twist (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (χ : Kˣ →* Rˣ)
    (hχ : ∀ g ∈ I.toSubgroup, χ (Matrix.GeneralLinearGroup.det g) = 1) (α : Kˣ) :
    (ramifiedHeckePoly I R hq α).map (heckeTwist I R χ hχ).toRingHom =
      C (heckeScalar I.toSubgroup R ((((χ α) ^ n)⁻¹ : Rˣ) : R)) *
        (ramifiedHeckePoly I R hq α).comp (C (heckeScalar I.toSubgroup R ((χ α : Rˣ) : R)) * X) :=
  sorry

end Operators

/-- tameOperator_rank_one -/
example (I : TameIwahoriLevel 𝒪 K 1) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    tameOperator I R hq 0 α = dc I.toSubgroup R (diagGL K (fun _ => α)) := sorry

/-- tameOperator_iwahori_inertia -/
example (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (u : 𝒪ˣ) :
    tameOperator (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n) ⊤) R hq i
      (Units.map (algebraMap 𝒪 K).toMonoidHom u) = 1 := sorry

/-- tameOperator_rank_two -/
example (I : TameIwahoriLevel 𝒪 K 2) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (ϖ : Kˣ)
    (hϖ : valuationZ 𝒪 K ϖ = Multiplicative.ofAdd 1) :
    tameElemSymm I R hq 2 ϖ = heckeScalar I.toSubgroup R (q 𝒪 : R) * dc I.toSubgroup R (diagGL K ![ϖ, ϖ]) :=
  sorry

/-- ramifiedHeckePoly_rank_one -/
example (I : TameIwahoriLevel 𝒪 K 1) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    ramifiedHeckePoly I R hq α = X - C (dc I.toSubgroup R (diagGL K (fun _ => α))) := sorry

/-- ramifiedHeckePoly_iwahori_inertia -/
example (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (u : 𝒪ˣ) :
    ramifiedHeckePoly (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n) ⊤) R hq
      (Units.map (algebraMap 𝒪 K).toMonoidHom u) = (X - 1 : (HeckeAlg (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n) ⊤).toSubgroup R)[X]) ^ n :=
  sorry

/-- tameOperator_unnormalized_wrong -/
example (I : TameIwahoriLevel 𝒪 K 2) (R : Type*) [CommRing R] [IsDomain R] [CharZero R]
    (hq : IsUnit (q 𝒪 : R)) (ϖ : Kˣ) (hϖ : valuationZ 𝒪 K ϖ = Multiplicative.ofAdd 1) :
    tameEmbedding I R hq (MonoidAlgebra.of R _ (TameTorus.mk I (Pi.mulSingle 0 ϖ))) *
        tameEmbedding I R hq (MonoidAlgebra.of R _ (TameTorus.mk I (Pi.mulSingle 1 ϖ))) =
      dc I.toSubgroup R (diagGL K ![ϖ, ϖ]) ∧
    tameElemSymm I R hq 2 ϖ ≠ dc I.toSubgroup R (diagGL K ![ϖ, ϖ]) := sorry

/-- ramifiedHeckePoly_depends_on_inertia -/
example (R : Type*) [CommRing R] [Nontrivial R] (hq : IsUnit (q 𝒪 : R))
    (hk : 2 < q 𝒪) : ∃ u : 𝒪ˣ, ramifiedHeckePoly (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := 1) ⊥) R hq
      (Units.map (algebraMap 𝒪 K).toMonoidHom u) ≠
        (X - 1 : (HeckeAlg (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := 1) ⊥).toSubgroup R)[X]) := sorry

/-! ## IHR.2 — Tame Iwahori invariants

Only the centrality of the elementary symmetric operators is statable at the pins: the other
targets of the layer concern admissible representations, parabolic induction and the local
Langlands correspondence. -/

/-- IHR.2/tame-hecke-centre (ACC+ Proposition 2.2.9(2)): each `e_{v,i}(α)` is central in
`H(GL_n(F_v), I_v) ⊗ R` whenever `q_v` is a unit of `R` (the coefficients descend from
`ℤ[1/q_v]`, where centrality is checked after extending scalars to `ℂ`). -/
theorem tame_hecke_centre (I : TameIwahoriLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (i : ℕ) (α : Kˣ) :
    tameElemSymm I R hq i α ∈ Subring.center (HeckeAlg I.toSubgroup R) := sorry

end IHR1

/-! ## IHR.3 — Siegel-parahoric transfer (on the `GL_{2n}(F_v)` side of `ι_v`)

Blocks are indexed by `Fin n ⊕ Fin n`: the first block is the `A`-block (the `v^c`-factor of
the Levi through `D_{v^c} ↦ Ψ ᵗc(D_{v^c})⁻¹ Ψ`), the second the `D`-block (the `v`-factor). -/

section IHR3

variable (𝒪 : Type*) [CommRing 𝒪] [IsDomain 𝒪] [IsDiscreteValuationRing 𝒪]
  (K : Type*) [Field K] [Algebra 𝒪 K] [IsFractionRing 𝒪 K] (n : ℕ)

variable [hfinite : Finite (IsLocalRing.ResidueField 𝒪)]

include hfinite

/-- The block index of the Siegel parahoric: blocks of sizes `n, 1, …, 1`. -/
def siegelBlock : Fin n ⊕ Fin n → WithBot (Fin n) :=
  Sum.elim (fun _ => ⊥) (fun j => (j : WithBot (Fin n)))

/-- `GL_{2n}(O_{F_v}) → GL_{2n}(F_v)`, on the block index type. -/
def toGLK₂ : GL (Fin n ⊕ Fin n) 𝒪 →* GL (Fin n ⊕ Fin n) K :=
  Matrix.GeneralLinearGroup.map (algebraMap 𝒪 K)

/-- Reduction `GL_{2n}(O_{F_v}) → GL_{2n}(k(v))`, on the block index type. -/
def reduce₂ : GL (Fin n ⊕ Fin n) 𝒪 →* GL (Fin n ⊕ Fin n) (IsLocalRing.ResidueField 𝒪) :=
  Matrix.GeneralLinearGroup.map (IsLocalRing.residue 𝒪)

/-- `GL_n(O_{F_v})` as a subgroup of `GL_n(F_v)` (the hyperspecial level at `v^c`). -/
abbrev sphericalLevel : Subgroup (GL (Fin n) K) := (toGLK 𝒪 K n).range

instance sphericalLevel_isHeckeTriple :
    IsHeckeTriple (⊤ : Submonoid (GL (Fin n) K)) (sphericalLevel 𝒪 K n) (sphericalLevel 𝒪 K n) :=
  sorry

namespace SiegelParahoric

/-- `𝔭_v`: reduction block upper triangular with blocks `n, 1, …, 1`. -/
def parahoric : Subgroup (GL (Fin n ⊕ Fin n) K) :=
  Subgroup.map (toGLK₂ 𝒪 K n)
    { carrier := {g | ((reduce₂ 𝒪 n g : GL _ (IsLocalRing.ResidueField 𝒪)) :
          Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) (IsLocalRing.ResidueField 𝒪)).BlockTriangular
            (siegelBlock n)}
      mul_mem' := sorry
      one_mem' := sorry
      inv_mem' := sorry }

/-- `𝔭_{v,1} = ker(𝔭_v → B_n(k(v)) → T_n(k(v)))`. -/
def parahoricOne : Subgroup (GL (Fin n ⊕ Fin n) K) :=
  Subgroup.map (toGLK₂ 𝒪 K n)
    { carrier := {g | ((reduce₂ 𝒪 n g : GL _ (IsLocalRing.ResidueField 𝒪)) :
          Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) (IsLocalRing.ResidueField 𝒪)).BlockTriangular
            (siegelBlock n) ∧
          ∀ j, ((reduce₂ 𝒪 n g : GL _ (IsLocalRing.ResidueField 𝒪)) :
            Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) (IsLocalRing.ResidueField 𝒪))
              (Sum.inr j) (Sum.inr j) = 1}
      mul_mem' := sorry
      one_mem' := sorry
      inv_mem' := sorry }

instance parahoricOne_normal :
    ((parahoricOne 𝒪 K n).subgroupOf (parahoric 𝒪 K n)).Normal := sorry

/-- The Siegel parahoric level attached to `A ≤ T_n(k(v))`. -/
def level (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    Subgroup (GL (Fin n ⊕ Fin n) K) := sorry

theorem parahoricOne_le_level (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    parahoricOne 𝒪 K n ≤ level 𝒪 K n A ∧ level 𝒪 K n A ≤ parahoric 𝒪 K n := sorry

/-- `𝔭̃_v / 𝔭̃_{v,1} ≅ (k(v)ˣ)ⁿ`. -/
def quotientEquiv :
    (parahoric 𝒪 K n ⧸ (parahoricOne 𝒪 K n).subgroupOf (parahoric 𝒪 K n)) ≃*
      (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ) := sorry


theorem inter_levi (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    (level 𝒪 K n A).comap (leviEmbed K n) =
      (sphericalLevel 𝒪 K n).prod (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) A).toSubgroup :=
  sorry

instance isHeckeTriple (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    IsHeckeTriple (⊤ : Submonoid (GL (Fin n ⊕ Fin n) K)) (level 𝒪 K n A) (level 𝒪 K n A) :=
  sorry

/-- `q̃_v` has an Iwahori decomposition with respect to the Siegel parabolic. -/
theorem iwahoriDecomposition (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    HasSiegelIwahoriDecomposition K n (level 𝒪 K n A) := sorry

/-- SiegelParahoric.level_top -/
example : level 𝒪 K n ⊤ = parahoric 𝒪 K n ∧ level 𝒪 K n ⊥ = parahoricOne 𝒪 K n := sorry

/-- SiegelParahoric.inter_levi_parahoric -/
example : (parahoric 𝒪 K n).comap (leviEmbed K n) =
    (sphericalLevel 𝒪 K n).prod (iwahori 𝒪 K n) := sorry

/-- SiegelParahoric.rank_one: for `n = 1`, `𝔭_v` is the Iwahori subgroup of `GL_2(O_{F_v})` and
`𝔭_{v,1}` the part of it whose lower right entry is `≡ 1 mod ϖ_v`. -/
example (g : GL (Fin 1 ⊕ Fin 1) K) :
    (g ∈ parahoric 𝒪 K 1 ↔ ∃ h : GL (Fin 1 ⊕ Fin 1) 𝒪, toGLK₂ 𝒪 K 1 h = g ∧
      (h : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) 𝒪) (Sum.inr 0) (Sum.inl 0) ∈
        IsLocalRing.maximalIdeal 𝒪) ∧
    (g ∈ parahoricOne 𝒪 K 1 ↔ ∃ h : GL (Fin 1 ⊕ Fin 1) 𝒪, toGLK₂ 𝒪 K 1 h = g ∧
      (h : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) 𝒪) (Sum.inr 0) (Sum.inl 0) ∈
        IsLocalRing.maximalIdeal 𝒪 ∧
      (h : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) 𝒪) (Sum.inr 0) (Sum.inr 0) - 1 ∈
        IsLocalRing.maximalIdeal 𝒪) := sorry

end SiegelParahoric

/-! ### IHR.3/unitary-tame-level, on the `GL_{2n}(F_v)` side of `ι_v` -/

/-- A unitary tame level `Ĩ_v̄` (`Ĩw_v̄(1,1) ≤ Ĩ_v̄ ≤ Ĩw_v̄(0,1)`), recorded through its image
`ι_v(Ĩ_v̄)`, a tame Iwahori level of `GL_{2n}(F_v)`. The block of the first `n` coordinates is the
`v^c`-factor of the Levi and the block of the last `n` the `v`-factor. -/
structure UnitaryTameLevel where
  /-- `ι_v(Ĩ_v̄)`. -/
  toGL : TameIwahoriLevel 𝒪 K (n + n)

namespace UnitaryTameLevel

variable {𝒪 K n}

/-- Block-decomposability: the torus subgroup of `ι_v(Ĩ_v̄)` is a product `A′ × A″` for the first
and the last `n` coordinates. -/
def IsBlockDecomposable (I : UnitaryTameLevel 𝒪 K n) : Prop :=
  ∃ A' A'' : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ),
    ∀ t : Fin (n + n) → (IsLocalRing.ResidueField 𝒪)ˣ, t ∈ I.toGL.torusSubgroup ↔
      (fun i => t (Fin.castAdd n i)) ∈ A' ∧ (fun i => t (Fin.natAdd n i)) ∈ A''

/-- For a block-decomposable level with torus subgroup `A′ × A″`, the intersection with the
Levi is the product of the tame Iwahori levels with torus subgroups `A′` and `A″` (on the
`GL_{2n}(F_v)` side; transporting the first factor to `GL_n(F_{v^c})` is part of `ι_v`). -/
theorem inter_levi (I : UnitaryTameLevel 𝒪 K n) (A' A'' : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ))
    (h : ∀ t : Fin (n + n) → (IsLocalRing.ResidueField 𝒪)ˣ, t ∈ I.toGL.torusSubgroup ↔
      (fun i => t (Fin.castAdd n i)) ∈ A' ∧ (fun i => t (Fin.natAdd n i)) ∈ A'') :
    I.toGL.toSubgroup.comap (leviEmbedFin K n) =
      (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) A').toSubgroup.prod
        (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) A'').toSubgroup := sorry

/-- `Ĩ_v̄` has an Iwahori decomposition with respect to the Siegel parabolic. -/
theorem iwahoriDecomposition (I : UnitaryTameLevel 𝒪 K n) :
    HasSiegelIwahoriDecomposition K n (I.toGL.toSubgroup.comap (toFinIndex K n)) := sorry

end UnitaryTameLevel

/-- UnitaryTameLevel.iwOneOne_inter -/
example : (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n + n) ⊥).toSubgroup.comap
    (leviEmbedFin K n) = (iwahoriOne 𝒪 K n).prod (iwahoriOne 𝒪 K n) := sorry

/-- UnitaryTameLevel.iwZeroOne_inter -/
example : (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n + n) ⊤).toSubgroup.comap
    (leviEmbedFin K n) = (iwahori 𝒪 K n).prod (iwahori 𝒪 K n) := sorry

/-- UnitaryTameLevel.toGL_tame -/
example : (UnitaryTameLevel.mk (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n + n) ⊥)).toGL.toSubgroup =
    iwahoriOne 𝒪 K (n + n) := sorry

/-- UnitaryTameLevel.diagonal_not_decomposable: for `n = 1` and the diagonal torus subgroup
`{(a, a)}`, the level is not block-decomposable once `k(v)ˣ` is nontrivial. -/
example (hk : 2 < q 𝒪) :
    ¬ (UnitaryTameLevel.mk (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := 1 + 1)
      { carrier := {t | t 0 = t 1}
        mul_mem' := sorry
        one_mem' := sorry
        inv_mem' := sorry })).IsBlockDecomposable := sorry

/-! ### IHR.3/siegel-transfer-operators -/

/-- The Levi level `GL_n(O_{F_{v^c}}) × I_v`. -/
def leviLevel (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    Subgroup (GL (Fin n) K × GL (Fin n) K) :=
  (sphericalLevel 𝒪 K n).prod (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) A).toSubgroup

instance leviLevel_isHeckeTriple (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    IsHeckeTriple (⊤ : Submonoid (GL (Fin n) K × GL (Fin n) K)) (leviLevel 𝒪 K n A)
      (leviLevel 𝒪 K n A) := sorry

/-- `t : H(GL_n × GL_n, GL_n(O) × I_v) ⊗ R →+* H(G̃, q̃_v) ⊗ R` (Lemma 2.1.13 with Lemma 2.2.10). -/
def siegelTransfer (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) :
    HeckeAlg (leviLevel 𝒪 K n A) R →+* HeckeAlg (SiegelParahoric.level 𝒪 K n A) R := sorry

theorem siegelTransfer_injective (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ))
    (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) :
    Function.Injective (siegelTransfer 𝒪 K n A R hq) := sorry

/-- The inclusion of the `GL_n(F_v)`-factor `x ↦ 1 ⊗ x` into the Levi Hecke algebra. -/
def leviRight (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*) [CommRing R] :
    HeckeAlg (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n) A).toSubgroup R →+*
      HeckeAlg (leviLevel 𝒪 K n A) R := sorry

/-- The inclusion of the spherical `GL_n(F_{v^c})`-factor. -/
def leviLeft (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*) [CommRing R] :
    HeckeAlg (sphericalLevel 𝒪 K n) R →+* HeckeAlg (leviLevel 𝒪 K n A) R := sorry

/-- `‖σ‖_v^{m}` for `α = rec σ`, as a unit of `R` (`‖σ‖_v = q_v^{−v(α)}`). -/
def normPow {R : Type*} [CommRing R] (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) (m : ℤ) : Rˣ :=
  hq.unit ^ (-(Multiplicative.toAdd (valuationZ 𝒪 K α)) * m)

/-- `t_{v,i}(σ)` at the Siegel level: the image of `‖σ‖^{−n} t_{v,i}(σ)`. -/
def siegelOperator (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (α : Kˣ) :
    HeckeAlg (SiegelParahoric.level 𝒪 K n A) R :=
  siegelTransfer 𝒪 K n A R hq (leviRight 𝒪 K n A R
    (heckeScalar _ R ((normPow 𝒪 K hq α (-(n : ℤ)) : Rˣ) : R) *
      tameOperator (TameIwahoriLevel.ofTorusSubgroup A) R hq i α))

/-- `e_{v^c,i}(σ)`, from the unramified coefficients `esph i` supplied by IHG.3. -/
def siegelConjOperator (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (esph : ℕ → HeckeAlg (sphericalLevel 𝒪 K n) R)
    (i : ℕ) (α : Kˣ) : HeckeAlg (SiegelParahoric.level 𝒪 K n A) R :=
  siegelTransfer 𝒪 K n A R hq (leviLeft 𝒪 K n A R
    (heckeScalar _ R ((normPow 𝒪 K hq α ((i : ℤ) * ((n : ℤ) - 1)) : Rˣ) : R) * esph i))

/-- `P_{v,σ}(X)` at the Siegel level (2.2.11). -/
def siegelPoly (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) : (HeckeAlg (SiegelParahoric.level 𝒪 K n A) R)[X] :=
  (List.ofFn fun i : Fin n => X - C (siegelOperator 𝒪 K n A R hq i α)).prod

/-- `P_{v^c,σ}(X)` (2.2.12), with `e_{v^c,i}` (not `e_{v,i}`). -/
def siegelConjPoly (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (esph : ℕ → HeckeAlg (sphericalLevel 𝒪 K n) R)
    (α : Kˣ) : (HeckeAlg (SiegelParahoric.level 𝒪 K n A) R)[X] :=
  ∑ i ∈ Finset.range (n + 1), C ((-1) ^ i * siegelConjOperator 𝒪 K n A R hq esph i α) * X ^ (n - i)

/-- `P̃_{v,σ}(X) = P_{v^c,σ^{−c}}(X) P_{v,σ}(X)` (`αc` the element attached to `σ^{−c}`). -/
def siegelFullPoly (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (esph : ℕ → HeckeAlg (sphericalLevel 𝒪 K n) R)
    (α αc : Kˣ) : (HeckeAlg (SiegelParahoric.level 𝒪 K n A) R)[X] :=
  siegelConjPoly 𝒪 K n A R hq esph αc * siegelPoly 𝒪 K n A R hq α

theorem siegelPoly_monic (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) : (siegelPoly 𝒪 K n A R hq α).Monic := sorry

theorem siegelOperator_commute (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (i j : Fin n) (α β : Kˣ) :
    Commute (siegelOperator 𝒪 K n A R hq i α) (siegelOperator 𝒪 K n A R hq j β) := sorry

theorem siegelOperator_mul (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (i : Fin n) (α β : Kˣ) :
    siegelOperator 𝒪 K n A R hq i (α * β) =
      siegelOperator 𝒪 K n A R hq i α * siegelOperator 𝒪 K n A R hq i β := sorry

theorem siegelFullPoly_natDegree (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ))
    (R : Type*) [CommRing R] [Nontrivial R] (hq : IsUnit (q 𝒪 : R))
    (esph : ℕ → HeckeAlg (sphericalLevel 𝒪 K n) R) (hesph : esph 0 = 1) (α αc : Kˣ) :
    (siegelFullPoly 𝒪 K n A R hq esph α αc).natDegree = 2 * n := sorry

/-- `ẽ`-coefficients: the coefficient of `X^{2n−k}` in `P̃_{v,σ}` is
`(−1)^k Σ_{i+j=k} e_{v,i}(σ) e_{v^c,j}(σ^{−c})` at the Siegel level. -/
theorem siegelFullPoly_coeff (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*)
    [CommRing R] (hq : IsUnit (q 𝒪 : R)) (esph : ℕ → HeckeAlg (sphericalLevel 𝒪 K n) R)
    (hesph : ∀ j, n < j → esph j = 0) (α αc : Kˣ) (k : ℕ) (hk : k ≤ 2 * n) :
    (siegelFullPoly 𝒪 K n A R hq esph α αc).coeff (2 * n - k) =
      (-1) ^ k * ∑ ij ∈ Finset.antidiagonal k,
        siegelTransfer 𝒪 K n A R hq (leviRight 𝒪 K n A R
          (heckeScalar _ R ((normPow 𝒪 K hq α (-((n : ℤ) * ij.1)) : Rˣ) : R) *
            tameElemSymm (TameIwahoriLevel.ofTorusSubgroup A) R hq ij.1 α)) *
          siegelConjOperator 𝒪 K n A R hq esph ij.2 αc := sorry

/-- IHR.3/siegel-strongly-positive-invertible (ACC+ Lemma 2.2.10 and its tame analogue), on the
`GL_{2n}(F_v)` side: `ι_v(ϖ_v^{−c} 1_n, 1_n) = diag(ϖ_v 1_n, 1_n)` gives a unit double coset at
every Siegel level and at every unitary tame level, when `q_v` is a unit of `R`. -/
theorem siegel_strongly_positive_invertible (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ))
    (I : UnitaryTameLevel 𝒪 K n) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (ϖ : Kˣ)
    (hϖ : valuationZ 𝒪 K ϖ = Multiplicative.ofAdd 1) :
    IsUnit (dc (SiegelParahoric.level 𝒪 K n A) R
        (SiegelParahoric.leviEmbed K n (diagGL K (fun _ => ϖ), 1))) ∧
      IsUnit (dc I.toGL.toSubgroup R (diagGL K (fun i : Fin (n + n) => if (i : ℕ) < n then ϖ else 1))) :=
  sorry

/-! ### IHR.3/unitary-tame-hecke-polynomial -/

/-- `P̃_{v,σ}(X) = ∏_{i=1}^{2n}(X − t_{v,i}(σ))` (2.2.17) at a unitary tame level, on the
`GL_{2n}(F_v)` side of `ι_v`: the ramified Hecke polynomial of IHR.1 for `GL_{2n}`. -/
def unitaryTamePoly (I : UnitaryTameLevel 𝒪 K n) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R))
    (α : Kˣ) : (HeckeAlg I.toGL.toSubgroup R)[X] :=
  ramifiedHeckePoly I.toGL R hq α

theorem unitaryTamePoly_eq_map (I : UnitaryTameLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    unitaryTamePoly 𝒪 K n I R hq α = ramifiedHeckePoly I.toGL R hq α := sorry

theorem unitaryTamePoly_monic (I : UnitaryTameLevel 𝒪 K n) (R : Type*) [CommRing R] [Nontrivial R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    (unitaryTamePoly 𝒪 K n I R hq α).Monic ∧ (unitaryTamePoly 𝒪 K n I R hq α).natDegree = n + n :=
  sorry

theorem unitaryTamePoly_coeff (I : UnitaryTameLevel 𝒪 K n) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) (i : ℕ) (hi : i ≤ n + n) :
    (unitaryTamePoly 𝒪 K n I R hq α).coeff (n + n - i) = (-1) ^ i * tameElemSymm I.toGL R hq i α ∧
      tameElemSymm I.toGL R hq i α ∈ Subring.center (HeckeAlg I.toGL.toSubgroup R) := sorry

/-- unitaryTamePoly_rank_one -/
example (I : UnitaryTameLevel 𝒪 K 1) (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (α ϖ : Kˣ)
    (hϖ : valuationZ 𝒪 K ϖ = Multiplicative.ofAdd 1) :
    unitaryTamePoly 𝒪 K 1 I R hq α =
      (X - C (tameOperator I.toGL R hq 0 α)) * (X - C (tameOperator I.toGL R hq 1 α)) ∧
    tameOperator I.toGL R hq 1 ϖ = heckeScalar I.toGL.toSubgroup R (q 𝒪 : R) *
      tameEmbedding I.toGL R hq (MonoidAlgebra.of R _ (TameTorus.mk I.toGL (Pi.mulSingle 1 ϖ))) :=
  sorry

/-- unitaryTamePoly_inertia -/
example (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (u : 𝒪ˣ) :
    unitaryTamePoly 𝒪 K n (UnitaryTameLevel.mk (TameIwahoriLevel.ofTorusSubgroup ⊤)) R hq
      (Units.map (algebraMap 𝒪 K).toMonoidHom u) =
      (X - 1 : (HeckeAlg (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := n + n) ⊤).toSubgroup R)[X]) ^ (n + n) :=
  sorry

/-- unitaryTamePoly_not_siegel: for `n ≥ 2` a Siegel level is not a unitary tame level. -/
example (hn : 2 ≤ n) (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) :
    ¬ ∃ I : UnitaryTameLevel 𝒪 K n,
      I.toGL.toSubgroup = (SiegelParahoric.level 𝒪 K n A).map (toFinIndex K n) := sorry

/-- siegelOperator_rank_one -/
example (A : Subgroup (Fin 1 → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*) [CommRing R]
    (hq : IsUnit (q 𝒪 : R)) (α : Kˣ) :
    siegelOperator 𝒪 K 1 A R hq 0 α = siegelTransfer 𝒪 K 1 A R hq (leviRight 𝒪 K 1 A R
      (heckeScalar _ R ((normPow 𝒪 K hq α (-1) : Rˣ) : R) *
        dc (TameIwahoriLevel.ofTorusSubgroup (𝒪 := 𝒪) (K := K) A).toSubgroup R
          (diagGL K (fun _ => α)))) := sorry

/-- siegelFullPoly_monic_degree -/
example (A : Subgroup (Fin n → (IsLocalRing.ResidueField 𝒪)ˣ)) (R : Type*) [CommRing R]
    [Nontrivial R] (hq : IsUnit (q 𝒪 : R)) (esph : ℕ → HeckeAlg (sphericalLevel 𝒪 K n) R)
    (hesph : esph 0 = 1) (α αc : Kˣ) :
    (siegelFullPoly 𝒪 K n A R hq esph α αc).Monic ∧
      (siegelFullPoly 𝒪 K n A R hq esph α αc).natDegree = 2 * n := sorry

/-- siegelOperator_inertia_parahoric -/
example (R : Type*) [CommRing R] (hq : IsUnit (q 𝒪 : R)) (u : 𝒪ˣ) :
    siegelPoly 𝒪 K n ⊤ R hq (Units.map (algebraMap 𝒪 K).toMonoidHom u) =
      (X - 1 : (HeckeAlg (SiegelParahoric.level 𝒪 K n ⊤) R)[X]) ^ n := sorry

end IHR3

/-! ## IHR.4 — the resultant

`Res_v` is Mathlib's `Polynomial.resultant`, computed in the commutative ring `C_v` generated by
the transferred operators; here `C_v` is an arbitrary commutative ring receiving them. -/

section IHR4

variable {C : Type*} [CommRing C]

/-- `Res_v = resultant (P_{v^c,φ^{−c}}) (P_{v,φ})`. -/
def siegelResultant (Pc P : C[X]) : C := Polynomial.resultant Pc P

theorem siegelResultant_map {B : Type*} [CommRing B] (f : C →+* B) (Pc P : C[X]) (hPc : Pc.Monic) (hP : P.Monic) :
    f (siegelResultant Pc P) = Polynomial.resultant (Pc.map f) (P.map f) := sorry

theorem siegelResultant_bezout (Pc P : C[X]) (h : Pc.natDegree ≠ 0 ∨ P.natDegree ≠ 0) :
    ∃ a b : C[X], a.degree < P.natDegree ∧ b.degree < Pc.natDegree ∧
      Pc * a + P * b = Polynomial.C (siegelResultant Pc P) := sorry

theorem isUnit_siegelResultant_iff {B : Type*} [CommRing B] (f : C →+* B) (Pc P : C[X])
    (hPc : Pc.Monic) (hP : P.Monic) :
    IsUnit (f (siegelResultant Pc P)) ↔ IsCoprime (Pc.map f) (P.map f) := sorry

theorem siegelResultant_eq_prod_roots {κ : Type*} [Field κ] (f : C →+* κ) (Pc P : C[X])
    (hPc : Pc.Monic) (hP : P.Monic) (hs : (Pc.map f).Splits) (hs' : (P.map f).Splits) :
    f (siegelResultant Pc P) =
      (((Pc.map f).roots ×ˢ (P.map f).roots).map fun ij => ij.1 - ij.2).prod := sorry

/-- charpoly_factor_range: the linear algebra behind Corollary 2.2.15. -/
theorem charpoly_factor_range {κ V : Type*} [Field κ] [PerfectField κ] [AddCommGroup V]
    [Module κ V] [FiniteDimensional κ V] (a s : Module.End κ V) (f g : κ[X])
    (hs : s.IsSemisimple) (hsa : IsNilpotent (a - s)) (hc : Commute a s)
    (hchar : LinearMap.charpoly a = f * g) (hfg : IsCoprime f g) :
    LinearMap.range (aeval a f) = LinearMap.range (aeval s f) := sorry

/-- siegelResultant_rank_one -/
example (a b : C) : siegelResultant (X - Polynomial.C a) (X - Polynomial.C b) = a - b := sorry

/-- siegelResultant_rank_zero -/
example : siegelResultant (1 : C[X]) 1 = 1 := sorry

/-- siegelResultant_swap -/
example (Pc P : C[X]) :
    siegelResultant P Pc = (-1) ^ (Pc.natDegree * P.natDegree) * siegelResultant Pc P := sorry

/-- siegelResultant_classical_vanishing: coincident roots kill the resultant; the roots `a` and
`q_v a` give `a − q_v a = (1 − q_v)a`. -/
example (a qv : C) : siegelResultant (X - Polynomial.C a) (X - Polynomial.C a) = 0 ∧
    siegelResultant (X - Polynomial.C a) (X - Polynomial.C (qv * a)) = (1 - qv) * a := sorry

/-- siegelResultant_not_discriminant -/
example (a c : C) : siegelResultant (X - Polynomial.C a) (X - Polynomial.C c) ^ 2 = (a - c) ^ 2 ∧
    siegelResultant (X - Polynomial.C a) (X - Polynomial.C c) = a - c := sorry

/-! ### IHR.4/factorization-etale: the tangent space of the factorization scheme -/

/-- Over a field, the Sylvester map `(g₁, g₂) ↦ g₁ f₂ + f₁ g₂` on pairs of degrees `< n₁, n₂`
is injective exactly when the resultant of the monic factors is nonzero. -/
theorem factorization_tangent_trivial_iff {κ : Type*} [Field κ] (f₁ f₂ : κ[X]) (h₁ : f₁.Monic)
    (h₂ : f₂.Monic) :
    (∀ g₁ g₂ : κ[X], g₁.degree < f₁.natDegree → g₂.degree < f₂.natDegree →
      g₁ * f₂ + f₁ * g₂ = 0 → g₁ = 0 ∧ g₂ = 0) ↔ Polynomial.resultant f₁ f₂ ≠ 0 := sorry

/-! ### IHR.4/factorization-etale: the algebra of ordered factorizations -/

section Factorization

variable (n₁ n₂ : ℕ)

/-- The generic monic polynomial `F₁ = X^{n₁} + Σ_{i<n₁} a_i X^i` over `B = ℤ[a, b]`. -/
def genericMonicLeft : (MvPolynomial (Fin n₁ ⊕ Fin n₂) ℤ)[X] :=
  X ^ n₁ + ∑ i : Fin n₁, Polynomial.C (MvPolynomial.X (Sum.inl i)) * X ^ (i : ℕ)

/-- The generic monic polynomial `F₂ = X^{n₂} + Σ_{j<n₂} b_j X^j` over `B = ℤ[a, b]`. -/
def genericMonicRight : (MvPolynomial (Fin n₁ ⊕ Fin n₂) ℤ)[X] :=
  X ^ n₂ + ∑ j : Fin n₂, Polynomial.C (MvPolynomial.X (Sum.inr j)) * X ^ (j : ℕ)

/-- `A = ℤ[s_0, …, s_{n−1}] → B = ℤ[a, b]` (`n = n₁ + n₂`), sending `s_k` to the coefficient of
`X^k` in `F₁ F₂`: the generic monic polynomial of degree `n` goes to the product of the generic
factors. -/
def factorizationMap : MvPolynomial (Fin (n₁ + n₂)) ℤ →+* MvPolynomial (Fin n₁ ⊕ Fin n₂) ℤ :=
  MvPolynomial.eval₂Hom (Int.castRingHom _)
    (fun k => (genericMonicLeft n₁ n₂ * genericMonicRight n₁ n₂).coeff k)

/-- `B` is finite free over `A`, of rank `binom(n₁ + n₂, n₁)` (Thorne, Lemma 2.1). -/
theorem factorization_finite_free :
    letI := (factorizationMap n₁ n₂).toAlgebra
    Module.Free (MvPolynomial (Fin (n₁ + n₂)) ℤ) (MvPolynomial (Fin n₁ ⊕ Fin n₂) ℤ) ∧
      Module.Finite (MvPolynomial (Fin (n₁ + n₂)) ℤ) (MvPolynomial (Fin n₁ ⊕ Fin n₂) ℤ) ∧
      Module.finrank (MvPolynomial (Fin (n₁ + n₂)) ℤ) (MvPolynomial (Fin n₁ ⊕ Fin n₂) ℤ) =
        Nat.choose (n₁ + n₂) n₁ := sorry

/-- IHR.4/factorization-etale (Thorne, Proposition 2.3): `Spec B → Spec A` is étale exactly
away from the zero locus of `resultant(F₁, F₂)`. -/
theorem factorization_etale :
    letI := (factorizationMap n₁ n₂).toAlgebra
    Algebra.etaleLocus (MvPolynomial (Fin (n₁ + n₂)) ℤ) (MvPolynomial (Fin n₁ ⊕ Fin n₂) ℤ) =
      (PrimeSpectrum.basicOpen
        (Polynomial.resultant (genericMonicLeft n₁ n₂) (genericMonicRight n₁ n₂)) : Set _) := sorry

end Factorization

/-- factorization_rank_one: for `n₁ = n₂ = 1` the resultant of `X + a₀` and `X + b₀` is
`b₀ − a₀`, so the étale locus is the complement of the diagonal `a₀ = b₀`. -/
example : Polynomial.resultant (genericMonicLeft 1 1) (genericMonicRight 1 1) =
    MvPolynomial.X (Sum.inr 0) - MvPolynomial.X (Sum.inl 0) := sorry

end IHR4

/-! ## IHR.7 — the local determinant E_v, through its matrix representation -/

section IHR7

variable {A : Type*} [CommRing A] {W : Type*} [Group W] {n : ℕ}

/-- The diagonal representation `σ ↦ diag(ψ_{v,1}(σ), …, ψ_{v,n}(σ))` of `W_{F_v}`; its
determinant in the sense of IntegralHeckeAndGaloisDeterminants IHG.0 is `E_v`. -/
def weilDeterminant (ψ : Fin n → (W →* Aˣ)) : W →* GL (Fin n) A :=
  (diagGL A).comp (MonoidHom.pi ψ)

theorem weilDeterminant_charpoly (ψ : Fin n → (W →* Aˣ)) (σ : W) :
    ((weilDeterminant ψ σ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A).charpoly =
      ∏ i, (X - Polynomial.C ((ψ i σ : Aˣ) : A)) := sorry

theorem weilDeterminant_twist (ψ : Fin n → (W →* Aˣ)) (χ : W →* Aˣ) (σ : W) :
    ((weilDeterminant (fun i => ψ i * χ) σ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) =
      ((χ σ : Aˣ) : A) • ((weilDeterminant ψ σ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) :=
  sorry

theorem weilDeterminant_map {B : Type*} [CommRing B] (f : A →+* B) (ψ : Fin n → (W →* Aˣ))
    (σ : W) :
    Matrix.GeneralLinearGroup.map f (weilDeterminant ψ σ) =
      weilDeterminant (fun i => (Units.map f.toMonoidHom).comp (ψ i)) σ := sorry

/-- `E_v = ∏_i ψ_{v,i}` on determinants of the diagonal representation. -/
theorem weilDeterminant_eq_prod (ψ : Fin n → (W →* Aˣ)) (σ : W) :
    Matrix.GeneralLinearGroup.det (weilDeterminant ψ σ) = ∏ i, ψ i σ := sorry

/-- weilDeterminant_rank_one -/
example (ψ : Fin 1 → (W →* Aˣ)) (σ : W) :
    ((weilDeterminant ψ σ : GL (Fin 1) A) : Matrix (Fin 1) (Fin 1) A) 0 0 = ((ψ 0 σ : Aˣ) : A) :=
  sorry

/-- weilDeterminant_rank_zero -/
example (ψ : Fin 0 → (W →* Aˣ)) (σ : W) : weilDeterminant ψ σ = 1 := sorry

/-- weilDeterminant_compat_matrix -/
example (ψ : Fin n → (W →* Aˣ)) (σ : W) :
    ((weilDeterminant ψ σ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A) =
      Matrix.diagonal (fun i => ((ψ i σ : Aˣ) : A)) := sorry

end IHR7

/-! ## Statements of the roadmap that are not typed here

Each name below is a declaration of the roadmap document whose carriers are not in the pinned
libraries; the document states it in full. The reason is given once per layer.

* IHR.1 — the action of Hecke algebras on invariants of smooth modules
  (SmoothRepresentationsOfLocalGroups), ALS.4's Satake map, `q_v^{1/2}` for Bernstein's
  normalization, and smooth and Steinberg representations are not at the pins:
  `tameEmbedding_restrict_level`, `tameEmbedding_satake`, `tameEmbedding_iwahori`,
  `tameOperator_eq_bernstein`, `tameOperator_central_character`,
  `ramifiedHeckePoly_restrict_level`, `ramifiedHeckePoly_steinberg`,
  `ramifiedHeckePoly_spherical`.
* IHR.2 — admissible representations, parabolic induction (SR.2), the local Langlands
  correspondence (ET.6) and Weil–Deligne representations (R01.2) are not at the pins:
  `tame_principal_series_criterion`, `tame_local_langlands_charpoly`, `spherical_specialization`.
* IHR.3 — the unitary group with `ι_{v^c}` (TC.3), the parabolic Satake map of ALS.4 and
  admissible representations are not at the pins: `SiegelParahoric.not_conjugate_place`,
  `UnitaryTameLevel.iota_conj`, `siegelTransfer_level`, `siegelConjPoly_not_v`,
  `unitaryTamePoly_conj`, `unitaryTamePoly_classical`, `siegel_transfer_local_langlands`,
  `satake_transform_tame_level`, `satake_transform_siegel_level`.
* IHR.4 — the Satake map, `rec^T`, Weil–Deligne representations and continuous representations of
  `G_{F_v}` are not at the pins: `siegelResultant_satake`, `resultant_kills_inertia`,
  `resultant_inertia_galois`.
* IHR.5 — adelic Hecke algebras `H(GL_n(A_F^∞), K) ⊗ O`, the complexes `RΓ(X_K, 𝒱_λ)` (ALS.1),
  their Hecke actions (ALS.3) and derived Hecke images (IHG.2) are not at the pins:
  `ramifiedHeckeAlgebra`, `ramifiedHeckeAlgebra.commRing`, `ramifiedHeckeImage`,
  `ramifiedHeckeImage.finite`, `ramifiedHeckeImage.spherical_le`,
  `ramifiedHeckeImage.localization`, `ramifiedHeckeImage.localization_semilocal`,
  `ramifiedHeckeImage.toCohomology`, `ramifiedHeckeImage.limit`, `ramifiedHeckeImage.map`;
  `ramifiedHeckeAlgebra_empty`, `ramifiedHeckeAlgebra_rank_one`,
  `ramifiedHeckeAlgebra_spherical_image`, `ramifiedHeckeAlgebra_not_local`;
  `unitaryRamifiedHeckeAlgebra`, `unitaryRamifiedHeckeAlgebra.commRing`,
  `unitaryRamifiedHeckeAlgebra.fullPoly`, `unitaryRamifiedHeckeImage`,
  `unitaryRamifiedHeckeImage.finite`, `unitaryRamifiedHeckeImage.triangle_equivariant`,
  `unitaryRamifiedHeckeImage.localization`; `unitaryRamifiedHeckeAlgebra_empty`,
  `unitaryRamifiedHeckeAlgebra_split_both`, `unitaryRamifiedHeckeAlgebra_contains_resultant`,
  `unitaryRamifiedHeckeAlgebra_siegel_not_tame`; `ramifiedSatake`, `ramifiedSatake_unramified`,
  `ramifiedSatake_fullPoly`, `ramifiedSatake_siegelPoly`, `ramifiedSatake_resultant`,
  `ramifiedSatake_restrict_spherical`, `ramifiedSatake_positive`, `ramifiedSatake_empty`,
  `ramifiedSatake_rank_one`, `ramifiedSatake_frobenius_rank_one`, `ramifiedSatake_not_normalized`;
  `ramified_twisting`, `ramified_hecke_duality`, `ramified_level_change`.
* IHR.6 — Chenevier determinants (IHG.0), `G_{F,S}` with Frobenius elements, cuspidal automorphic
  representations of the unitary group and their Galois representations (AG2.2, AG2.5) are not
  at the pins: `classical_point_compatibility`, `dual_classical_point_compatibility`,
  `ramified_interpolation`, `compact_support_compatibility`, `cohomology_compatibility`,
  `boundary_compatibility`.
* IHR.7 — Chenevier determinants and Amitsur's formula (IHG.0), adelic levels of the unitary
  group, `G_F` and `G_{F⁺}` with Frobenius and inertia at places, finite-order idele class
  characters, and the Hecke-algebra-valued representations of TC.4 are not at the pins:
  `weilDeterminant_unique`, `weilDeterminant_residual`, `weilDeterminant_iwahori_unramified`,
  `weilDeterminant_not_frobenius_only`; `auxiliary_characters`; `decomposedUnitaryLevel` with
  `decomposedUnitaryLevel_inter`, `decomposedUnitaryLevel_decomposed`,
  `decomposedUnitaryLevel_good`, `decomposedUnitaryLevel_at_R`, `conjugate_into_integral`,
  `decomposedUnitaryLevel_unramified`, `decomposedUnitaryLevel_R1`,
  `decomposedUnitaryLevel_Rminus`, `decomposedUnitaryLevel_needs_conjugation`;
  `small_level_reduction`; `boundaryDeterminant` with `boundaryDeterminant_charpoly_frob`,
  `boundaryDeterminant_charpoly_weil`, `boundaryDeterminant_trace_relation`,
  `boundaryDeterminant_eq`, `boundaryDeterminant_nilpotence`, `boundaryDeterminant_rank_one_frob`,
  `boundaryDeterminant_empty`, `boundaryDeterminant_not_square`, `boundaryDeterminant_twist_law`;
  `determinant_restriction_at_R`, `unramified_at_conjugate`, `determinant_local_global`,
  `local_global_away_from_p`.

The final theorem, `local_global_away_from_p` (ACC+ Theorem 3.1.1), reads: for 𝔪 ⊂ T^S(K, λ)
non-Eisenstein there are N = N(n, [F : ℚ]), an ideal I_R ⊂ T^T_R(K, λ)_𝔪 with I_R^N = 0 and a
continuous ρ_{𝔪,R} : G_{F,T} → GL_n(T^T_R(K, λ)_𝔪/I_R) with det(X − ρ_{𝔪,R}(Frob_v)) = P_v(X) for
v ∉ T and det(X − ρ_{𝔪,R}(σ)) = P_{v,σ}(X) for v ∈ R and σ ∈ W_{F_v}.
-/

end TauCeti.RamifiedHecke
