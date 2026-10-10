/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/IntegralHeckeAndGaloisDeterminantsPartII.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every proof is `sorry`; nothing here claims to be formalised.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

Scope of the prototype. The local layers IHR.1–IHR.4 are prototyped against actual
carriers: `GL (Fin n) K` over the fraction field `K` of a discrete valuation ring `𝒪`,
Mathlib's Hecke coset modules `𝕋 ⊤ U R` (`Mathlib/NumberTheory/HeckeRing/Defs.lean`) with
Tau Ceti's convolution ring structure (`HeckeCosetModule.instRingHeckeRing`,
`TauCeti/NumberTheory/HeckeRing/Associativity.lean`), Mathlib's group algebras, polynomials,
resultants and Jordan–Chevalley decomposition. The Weil group and the Artin map are not in
the pinned libraries (Tau Ceti ClassFieldTheory layers 7 and 9 plan them): they enter as an
explicit group `W` with the reciprocity homomorphism `rec : W →* Kˣ`, σ ↦ Art⁻¹(σ|ab).
ArithmeticLocallySymmetricSpaces ALS.0's Iwahori subgroups are written out once, below,
because the pinned libraries do not contain them; they are owned by ALS.0.

The global layers IHR.5–IHR.7 need carriers that the pinned libraries do not contain:
Chenevier determinants (IntegralHeckeAndGaloisDeterminants IHG.0), derived Hecke images
(IHG.2), arithmetic locally symmetric spaces and their complexes (ALS.0–ALS.6), absolute
Galois groups with Frobenius elements at places, and the Galois representations of
AutomorphicGaloisRepresentationsPartII. No such object is replaced by a `Prop` field or by
a placeholder. Their declarations are listed at the end of the file with their names and
their mathematical obligations, as the omission ledger; the local determinant E_v is
prototyped through the matrix representation whose determinant it is.

Compilation. Independently checked with the genuine Tau Ceti convolution import at the
pinned baseline. The present declarations elaborate with `sorry` warnings only. This does
not close the omission ledger or verify the mathematical truth of a `sorry` declaration.
The packet review records the remaining signature coverage as G2.
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
def SiegelParahoric.leviEmbed : GL (Fin n) K × GL (Fin n) K →* GL (Fin n ⊕ Fin n) K := sorry

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

/-- ramifiedHeckePoly_depends_on_inertia -/
example (R : Type*) [CommRing R] [Nontrivial R] (hq : IsUnit (q 𝒪 : R))
    (hk : 2 < q 𝒪) : ∃ u : 𝒪ˣ, ramifiedHeckePoly (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := 1) ⊥) R hq
      (Units.map (algebraMap 𝒪 K).toMonoidHom u) ≠
        (X - 1 : (HeckeAlg (ofTorusSubgroup (𝒪 := 𝒪) (K := K) (n := 1) ⊥).toSubgroup R)[X]) := sorry

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

/-- SiegelParahoric.level_top -/
example : level 𝒪 K n ⊤ = parahoric 𝒪 K n ∧ level 𝒪 K n ⊥ = parahoricOne 𝒪 K n := sorry

/-- SiegelParahoric.inter_levi_parahoric -/
example : (parahoric 𝒪 K n).comap (leviEmbed K n) =
    (sphericalLevel 𝒪 K n).prod (iwahori 𝒪 K n) := sorry

end SiegelParahoric

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

/-! ## Omission ledger

Every definition, construction, API item and unit test of the packet appears above under its
packet name, or below, where it is omitted because its carrier is absent from the pinned
libraries (the reason is given per layer). Theorem nodes are stated above under the Lean names
`tame_double_coset_invertible`, `tame_double_coset_mul_of_positive` (IHR.1/tame-double-coset-invertible)
and `factorization_tangent_trivial_iff` (the tangent-space form of IHR.4/factorization-etale); the
other theorem nodes are listed below with the Lean names they take.

* IHR.1 — coefficient change of Hecke coset modules, invariants of smooth modules
  (SmoothRepresentationsOfLocalGroups SR.0), ALS.4's Satake map, q_v^{1/2} for Bernstein's
  normalization, smooth and Steinberg representations, IHG.3's spherical carrier and the levels
  Iw_v(b, c) beyond those of ALS.0 are not in the pinned libraries.
  - IHR.1/tame-iwahori-level: `TameIwahoriLevel.not_iwahori_one_two`.
  - IHR.1/tame-torus-embedding: `tameEmbedding_map`, `tameEmbedding_restrict_level`,
    `tameEmbedding_satake`, `tameEmbedding_iwahori`.
  - IHR.1/tame-hecke-operators: `tameOperator_eq_bernstein`, `weilCharacter_inertia`,
    `tameOperator_twist`, `tameOperator_unnormalized_wrong`, `tameOperator_central_character`.
  - IHR.1/ramified-hecke-polynomial: `ramifiedHeckePoly_restrict_level`,
    `ramifiedHeckePoly_twist`, `ramifiedHeckePoly_map`, `ramifiedHeckePoly_steinberg`,
    `ramifiedHeckePoly_spherical`.
* IHR.2 — irreducible admissible representations, parabolic induction (SR.2), the local Langlands
  correspondence (ET.6) and Weil–Deligne representations (R01.2) are not in the pinned libraries.
  - IHR.2/tame-principal-series-criterion: `tame_principal_series_criterion` (theorem).
  - IHR.2/tame-hecke-centre: `tame_hecke_centre` (theorem).
  - IHR.2/tame-local-langlands-charpoly: `tame_local_langlands_charpoly` (theorem).
  - IHR.2/spherical-specialization: `spherical_specialization` (theorem).
* IHR.3 — the unitary group G̃ with ι_v and ι_{v^c} (TC.3, IG.0), the localized Satake isomorphism
  of Lemma 2.1.13 (SR.1) and admissible representations of G̃ are not in the pinned libraries.
  - IHR.3/siegel-parahoric-level: `SiegelParahoric.iwahoriDecomposition`,
    `SiegelParahoric.rank_one`, `SiegelParahoric.not_conjugate_place`.
  - IHR.3/unitary-tame-level: `UnitaryTameLevel`, `UnitaryTameLevel.toGL`,
    `UnitaryTameLevel.IsBlockDecomposable`, `UnitaryTameLevel.inter_levi`,
    `UnitaryTameLevel.iota_conj`, `UnitaryTameLevel.iwahoriDecomposition`,
    `UnitaryTameLevel.iwOneOne_inter`, `UnitaryTameLevel.iwZeroOne_inter`,
    `UnitaryTameLevel.diagonal_not_decomposable`, `UnitaryTameLevel.toGL_tame`.
  - IHR.3/siegel-strongly-positive-invertible: `siegel_strongly_positive_invertible` (theorem).
  - IHR.3/siegel-transfer-operators: `siegelFullPoly_coeff`, `siegelTransfer_level`,
    `siegelConjPoly_not_v`.
  - IHR.3/unitary-tame-hecke-polynomial: `unitaryTamePoly`, `unitaryTamePoly_eq_map`,
    `unitaryTamePoly_coeff`, `unitaryTamePoly_conj`, `unitaryTamePoly_rank_one`,
    `unitaryTamePoly_inertia`, `unitaryTamePoly_classical`, `unitaryTamePoly_not_siegel`.
  - IHR.3/siegel-transfer-local-langlands: `siegel_transfer_local_langlands` (theorem).
  - IHR.3/satake-transform-tame-level: `satake_transform_tame_level` (theorem).
  - IHR.3/satake-transform-siegel-level: `satake_transform_siegel_level` (theorem).
* IHR.4 — the Satake map, rec^T, Weil–Deligne representations, continuous representations of
  G_{F_v}, and étale morphisms of the factorization algebra over ℤ[s_1, …, s_n] are not in the
  pinned libraries.
  - IHR.4/siegel-resultant: `siegelResultant_satake`, `siegelResultant_classical_vanishing`.
  - IHR.4/factorization-etale: `factorization_etale` (theorem; only its tangent-space form is
    stated above).
  - IHR.4/resultant-kills-inertia: `resultant_kills_inertia` (theorem).
  - IHR.4/resultant-inertia-galois: `resultant_inertia_galois` (theorem).
* IHR.5 — adelic Hecke algebras H(GL_n(A_F^∞), K) ⊗ O, the complexes RΓ(X_K, 𝒱_λ) (ALS.1), their
  Hecke actions (ALS.3) and derived Hecke images (IHG.2) are not in the pinned libraries.
  - IHR.5/ramified-hecke-algebra: `ramifiedHeckeAlgebra`, `ramifiedHeckeAlgebra.commRing`,
    `ramifiedHeckeImage`, `ramifiedHeckeImage.finite`, `ramifiedHeckeImage.spherical_le`,
    `ramifiedHeckeImage.localization`, `ramifiedHeckeImage.localization_semilocal`,
    `ramifiedHeckeImage.toCohomology`, `ramifiedHeckeImage.limit`, `ramifiedHeckeImage.map`,
    `ramifiedHeckeAlgebra_empty`, `ramifiedHeckeAlgebra_rank_one`,
    `ramifiedHeckeAlgebra_spherical_image`, `ramifiedHeckeAlgebra_not_local`.
  - IHR.5/unitary-ramified-hecke-algebra: `unitaryRamifiedHeckeAlgebra`,
    `unitaryRamifiedHeckeAlgebra.commRing`, `unitaryRamifiedHeckeImage`,
    `unitaryRamifiedHeckeImage.finite`, `unitaryRamifiedHeckeImage.triangle_equivariant`,
    `unitaryRamifiedHeckeAlgebra.fullPoly`, `unitaryRamifiedHeckeImage.localization`,
    `unitaryRamifiedHeckeAlgebra_empty`, `unitaryRamifiedHeckeAlgebra_split_both`,
    `unitaryRamifiedHeckeAlgebra_contains_resultant`,
    `unitaryRamifiedHeckeAlgebra_siegel_not_tame`.
  - IHR.5/ramified-satake-homomorphism: `ramifiedSatake`, `ramifiedSatake_unramified`,
    `ramifiedSatake_fullPoly`, `ramifiedSatake_siegelPoly`, `ramifiedSatake_resultant`,
    `ramifiedSatake_restrict_spherical`, `ramifiedSatake_positive`, `ramifiedSatake_empty`,
    `ramifiedSatake_rank_one`, `ramifiedSatake_frobenius_rank_one`,
    `ramifiedSatake_not_normalized`.
  - IHR.5/ramified-twisting: `ramified_twisting` (theorem).
  - IHR.5/ramified-hecke-duality: `ramified_hecke_duality` (theorem).
  - IHR.5/ramified-level-change: `ramified_level_change` (theorem).
* IHR.6 — Chenevier determinants (IHG.0), G_{F,S} with Frobenius elements, cuspidal automorphic
  representations of G̃ and r_ι(π̃) (AG2.2, AG2.5) are not in the pinned libraries.
  - IHR.6/classical-point-compatibility: `classical_point_compatibility` (theorem).
  - IHR.6/dual-classical-point-compatibility: `dual_classical_point_compatibility` (theorem).
  - IHR.6/ramified-interpolation: `ramified_interpolation` (theorem).
  - IHR.6/compact-support-compatibility: `compact_support_compatibility` (theorem).
  - IHR.6/cohomology-compatibility: `cohomology_compatibility` (theorem).
  - IHR.6/boundary-compatibility: `boundary_compatibility` (theorem).
* IHR.7 — Chenevier determinants and Amitsur's formula (IHG.0), adelic levels of G̃, G_{F,T} with
  Frobenius elements and the Hecke-algebra-valued representations of TC.4 are not in the pinned
  libraries.
  - IHR.7/ramified-local-determinant: `weilDeterminant_eq_prod`, `weilDeterminant_unique`,
    `weilDeterminant_residual`, `weilDeterminant_iwahori_unramified`,
    `weilDeterminant_not_frobenius_only`.
  - IHR.7/auxiliary-characters: `auxiliary_characters` (theorem).
  - IHR.7/decomposed-unitary-level: `decomposedUnitaryLevel`, `decomposedUnitaryLevel_inter`,
    `decomposedUnitaryLevel_decomposed`, `decomposedUnitaryLevel_good`,
    `decomposedUnitaryLevel_at_R`, `conjugate_into_integral`, `decomposedUnitaryLevel_unramified`,
    `decomposedUnitaryLevel_R1`, `decomposedUnitaryLevel_Rminus`,
    `decomposedUnitaryLevel_needs_conjugation`.
  - IHR.7/small-level-reduction: `small_level_reduction` (theorem).
  - IHR.7/boundary-determinant: `boundaryDeterminant`, `boundaryDeterminant_charpoly_frob`,
    `boundaryDeterminant_charpoly_weil`, `boundaryDeterminant_trace_relation`,
    `boundaryDeterminant_eq`, `boundaryDeterminant_nilpotence`,
    `boundaryDeterminant_rank_one_frob`, `boundaryDeterminant_empty`,
    `boundaryDeterminant_not_square`, `boundaryDeterminant_twist_law`.
  - IHR.7/determinant-restriction-at-R: `determinant_restriction_at_R` (theorem).
  - IHR.7/unramified-at-conjugate: `unramified_at_conjugate` (theorem).
  - IHR.7/determinant-local-global: `determinant_local_global` (theorem).
  - IHR.7/local-global-away-from-p: `local_global_away_from_p` (theorem).

The final theorem, `local_global_away_from_p` (ACC+ Theorem 3.1.1), reads: for 𝔪 ⊂ T^S(K, λ)
non-Eisenstein there are N = N(n, [F : ℚ]), an ideal I_R ⊂ T^T_R(K, λ)_𝔪 with I_R^N = 0 and a
continuous ρ_{𝔪,R} : G_{F,T} → GL_n(T^T_R(K, λ)_𝔪/I_R) with det(X − ρ_{𝔪,R}(Frob_v)) = P_v(X) for
v ∉ T and det(X − ρ_{𝔪,R}(σ)) = P_{v,σ}(X) for v ∈ R and σ ∈ W_{F_v}.
-/

end TauCeti.RamifiedHecke
