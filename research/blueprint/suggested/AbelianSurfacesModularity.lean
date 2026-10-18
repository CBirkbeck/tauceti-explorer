import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Set.Card

/-!
# Modularity of abelian surfaces — suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AbelianSurfacesModularity.md` is definitive; the statements below
suggest Lean forms for the parts of the plan that are statable at the pinned Mathlib and Tau Ceti,
so that contributors and reviewers converge on names and signatures.

What is statable here is the finite group theory of BCGP25 §§5.2, 8 and 9 (the explicit isomorphism
`S₆ ≅ Sp₄(F₂)`, the strongly odd involutions, the point stabiliser `S₅(b)`), the ordinary Weil
quartics of §9.2–§9.3, and a few arithmetic identities of §§9–10. The main theorems (Theorem A,
Theorem B, Theorems 9.5.1–9.5.5, 10.2.1, 10.3.9) need Galois representations of abelian surfaces,
GSp₄ automorphic representations and the odd-theta moduli, none of which exist at the pins; they are
targets of the roadmap document, not declarations here.
-/

namespace TauCeti.AbelianSurfacesModularity

open Matrix

/-! ## AM.2: the form `J`, the isomorphism `S₆ ≅ Sp₄(F₂)` and strongly odd involutions -/

/-- The alternating form `J = [[0, S], [-S, 0]]`, `S` anti-diagonal, of BCGP25 §1.8.7. -/
def bcgpJ (R : Type*) [CommRing R] : Matrix (Fin 4) (Fin 4) R :=
  !![0, 0, 0, 1; 0, 0, 1, 0; 0, -1, 0, 0; -1, 0, 0, 0]

/-- `M` preserves the form `J` (the defining condition of `Sp₄` for the paper's form). -/
def PreservesJ {R : Type*} [CommRing R] (M : Matrix (Fin 4) (Fin 4) R) : Prop :=
  Mᵀ * bcgpJ R * M = bcgpJ R

instance {R : Type*} [CommRing R] [DecidableEq R] (M : Matrix (Fin 4) (Fin 4) R) :
    Decidable (PreservesJ M) := by
  unfold PreservesJ; infer_instance

/-- `ι((12)(34)(56))` (Lemma 8.1.3). -/
def iotaTripleTransposition : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![1, 0, 1, 0; 0, 1, 0, 1; 0, 0, 1, 0; 0, 0, 0, 1]

/-- `ι((12))` (Lemma 8.1.3). -/
def iotaTransposition : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![1, 0, 0, 1; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]

/-- `ι((12345))` (Lemma 8.1.3). -/
def iotaFiveCycle : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![0, 0, 1, 1; 1, 1, 0, 0; 1, 1, 1, 0; 1, 0, 1, 1]

/-- `ι((12)(34))`, the square of `ι((1423)(56))` (Remark 5.2.8, Lemma 8.2.4). -/
def iotaDoubleTransposition : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![1, 0, 0, 1; 0, 1, 1, 0; 0, 0, 1, 0; 0, 0, 0, 1]

/-- `ι((12)(35)(46))`, the non-odd involution of Remark 5.2.8. -/
def iotaOtherTripleTransposition : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![1, 1, 0, 0; 0, 1, 0, 0; 0, 0, 1, 1; 0, 0, 0, 1]

/-- `ι((1423)(56))`, the element `σ` of the proof of Lemma 8.2.4. -/
def iotaSigma : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![0, 1, 0, 0; 1, 0, 0, 1; 0, 0, 0, 1; 0, 0, 1, 0]

/-- `ι((12)(345))`, computed in the convention of Lemma 8.1.3 (the matrix printed on p. 203 is
`ι((12)(354))`, source issue `AbelianSurfacesModularity/E2`). -/
def iotaOrderSixA : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![1, 0, 0, 1; 0, 1, 1, 0; 0, 1, 0, 0; 0, 0, 0, 1]

/-- `ι((125346))`, computed in the convention of Lemma 8.1.3. -/
def iotaOrderSixB : Matrix (Fin 4) (Fin 4) (ZMod 2) :=
  !![0, 1, 0, 1; 1, 0, 1, 0; 0, 1, 0, 0; 1, 0, 0, 0]

/-- The oddness criterion of Lemma 5.2.7 for an involution `A` of `Sp₄` in characteristic 2:
`A · J` has a non-zero diagonal entry. -/
def HasOddDiagonal (A : Matrix (Fin 4) (Fin 4) (ZMod 2)) : Prop :=
  ∃ i, (A * bcgpJ (ZMod 2)) i i ≠ 0

instance (A : Matrix (Fin 4) (Fin 4) (ZMod 2)) : Decidable (HasOddDiagonal A) := by
  unfold HasOddDiagonal; infer_instance

/-- A strongly residually odd involution of `Sp₄(F₂)` (AM.2/strong-odd-involutions). -/
def IsStronglyOddInvolution (A : Matrix (Fin 4) (Fin 4) (ZMod 2)) : Prop :=
  PreservesJ A ∧ A * A = 1 ∧ HasOddDiagonal A

instance (A : Matrix (Fin 4) (Fin 4) (ZMod 2)) : Decidable (IsStronglyOddInvolution A) := by
  unfold IsStronglyOddInvolution; infer_instance

/-- `SymplecticS6.iota_generators_symplectic`: the three matrices of Lemma 8.1.3 preserve `J`. -/
example : PreservesJ iotaTripleTransposition ∧ PreservesJ iotaTransposition ∧
    PreservesJ iotaFiveCycle := by
  decide

/-- The orders 2, 2 and 5 of the three generators. -/
example : iotaTripleTransposition * iotaTripleTransposition = 1 ∧
    iotaTransposition * iotaTransposition = 1 ∧ iotaFiveCycle ^ 5 = 1 ∧ iotaFiveCycle ≠ 1 := by
  decide

/-- `SymplecticS6.iota_order_six_classes`: `ι((12)(345))` has order 6, and `ι((125346))`
satisfies `(M² + M + 1)² = 0`; the two classes of elements of order 6 differ. -/
example : iotaOrderSixA ^ 6 = 1 ∧ iotaOrderSixA ^ 2 ≠ 1 ∧ iotaOrderSixA ^ 3 ≠ 1 ∧
    (iotaOrderSixB ^ 2 + iotaOrderSixB + 1) ^ 2 = 0 := by
  decide

/-- Lemma 8.2.4: `σ = ι((1423)(56))` squares to `ι((12)(34))`. -/
example : iotaSigma * iotaSigma = iotaDoubleTransposition := by
  decide

/-- Remark 5.2.8: transvections and the class of `ι((12)(34))` are strongly odd. -/
example : IsStronglyOddInvolution iotaTransposition ∧
    IsStronglyOddInvolution iotaDoubleTransposition := by
  decide

/-- Remark 5.2.8: the triple transposition `ι((12)(35)(46))` and the identity are not odd. -/
example : ¬ HasOddDiagonal iotaOtherTripleTransposition ∧ ¬ HasOddDiagonal 1 := by
  decide

/-- AM.2/siegel-parabolic-two-group: the triple transposition `ι((12)(34)(56))` is the element
`[[I, I], [0, I]]` of the Siegel unipotent radical; it commutes with `[[A, 0], [0, A]]`. -/
example (A : Matrix (Fin 2) (Fin 2) (ZMod 2)) :
    Matrix.fromBlocks A 0 0 A * Matrix.fromBlocks 1 1 0 1 =
      Matrix.fromBlocks 1 1 0 1 * Matrix.fromBlocks A 0 0 A := by
  simp [Matrix.fromBlocks_multiply]

/-- `S₅(b)`: the stabiliser of the sixth point (AM.2/s6-sp4-identification). -/
abbrev S5b : Subgroup (Equiv.Perm (Fin 6)) :=
  MulAction.stabilizer (Equiv.Perm (Fin 6)) (5 : Fin 6)

/-- `A₅(b) = S₅(b) ∩ A₆`. -/
abbrev A5b : Subgroup (Equiv.Perm (Fin 6)) :=
  S5b ⊓ alternatingGroup (Fin 6)

/-- A double transposition fixing the sixth point lies in `A₅(b)`. -/
example : (Equiv.swap (0 : Fin 6) 1 * Equiv.swap 2 3) ∈ A5b := by
  rw [Subgroup.mem_inf, MulAction.mem_stabilizer_iff, Equiv.Perm.mem_alternatingGroup]
  decide

/-- `SymplecticS6.iota`: the isomorphism `S₆ ≅ Sp₄(F₂)` of Lemma 8.1.3, as a homomorphism to
the matrix monoid, injective, landing in the matrices preserving `J`, with the stated values on
`(12)(34)(56)`, `(12)` and `(12345)` (0-indexed points). -/
theorem exists_iota :
    ∃ ι : Equiv.Perm (Fin 6) →* Matrix (Fin 4) (Fin 4) (ZMod 2),
      Function.Injective ι ∧ (∀ σ, PreservesJ (ι σ)) ∧
      ι (Equiv.swap 0 1 * Equiv.swap 2 3 * Equiv.swap 4 5) = iotaTripleTransposition ∧
      ι (Equiv.swap 0 1) = iotaTransposition ∧
      ι (Equiv.swap 0 1 * Equiv.swap 1 2 * Equiv.swap 2 3 * Equiv.swap 3 4) = iotaFiveCycle := by
  sorry

/-! ## AM.4–AM.5: ordinary Weil quartics -/

open Polynomial

/-- The quartic `X⁴ + aX³ + bX² + paX + p²` (Definition 9.2.4). -/
noncomputable def weilQuartic (p a b : ℤ) : ℤ[X] :=
  X ^ 4 + C a * X ^ 3 + C b * X ^ 2 + C (p * a) * X + C (p ^ 2)

/-- `OrdinaryWeilQuartic`: all complex roots have absolute value `√p` and `p ∤ b`. -/
def IsOrdinaryWeilQuartic (p a b : ℤ) : Prop :=
  (∀ z ∈ (weilQuartic p a b).aroots ℂ, ‖z‖ = Real.sqrt p) ∧ ¬ p ∣ b

/-- `OrdinaryWeilQuartic.reciprocal`: the coefficients satisfy `c₁ = p·c₃` and `c₀ = p²·c₄`,
i.e. `X⁴ Q(p/X) = p² Q(X)`. -/
theorem weilQuartic_reciprocal (p a b : ℤ) :
    (weilQuartic p a b).coeff 1 = p * (weilQuartic p a b).coeff 3 ∧
      (weilQuartic p a b).coeff 0 = p ^ 2 * (weilQuartic p a b).coeff 4 := by
  simp only [weilQuartic, coeff_add, coeff_C_mul, coeff_X_pow, coeff_X, coeff_C]
  norm_num

/-- `ordinaryWeilQuartic_count_two`: there are exactly 16 ordinary Weil quartics for `p = 2`
(Table 9.2.5). -/
theorem ncard_ordinaryWeilQuartic_two :
    {ab : ℤ × ℤ | IsOrdinaryWeilQuartic 2 ab.1 ab.2}.ncard = 16 := by
  sorry

/-- There are exactly 40 ordinary Weil quartics for `p = 3` (Table 9.3.3). -/
theorem ncard_ordinaryWeilQuartic_three :
    {ab : ℤ × ℤ | IsOrdinaryWeilQuartic 3 ab.1 ab.2}.ncard = 40 := by
  sorry

/-- `ordinaryWeilQuartic_x4_sub_x2_add_4`: `X⁴ − X² + 4` is an ordinary Weil quartic at 2. -/
example : IsOrdinaryWeilQuartic 2 0 (-1) := by
  sorry

/-- `not_ordinaryWeilQuartic_supersingular`: `(X² + 2)²` fails the ordinarity condition. -/
example : ¬ IsOrdinaryWeilQuartic 2 0 4 := by
  rintro ⟨-, h⟩
  exact h (by norm_num)

/-- `ordinaryWeilQuartic_prod_traces`: for elliptic curves over `F₃` with traces `−1` and `2`,
`Q = (X² + X + 3)(X² − 2X + 3)`, an ordinary Weil quartic with `a = −1`, `b = 4`. -/
example : weilQuartic 3 (-1) 4 = (X ^ 2 + X + 3) * (X ^ 2 - 2 * X + 3) := by
  simp only [weilQuartic, map_neg, map_one, map_mul, map_pow, map_ofNat]
  ring

/-! ## Arithmetic identities of §§9–10 -/

/-- The sizes of the ten outer classes of `PGSp₄(F₃)` add up to `|PSp₄(F₃)|` (Lemma 9.1.3). -/
example : 36 + 540 + 540 + 1620 + 1440 + 1440 + 4320 + 6480 + 5184 + 4320 = 25920 := by
  norm_num

/-- The density of the local conditions of §10.1. -/
example : ((768 - 144 : ℚ) / 2 ^ 11) * ((864 - 10) / 3 ^ 7) = 5551 / 46656 := by
  norm_num

/-- The counts of Table 9.3.3 and Lemma 9.3.1: ten ordinary curves over `F₃` have square `Q`. -/
example : 4 + 1 + 1 + 4 = 10 ∧ 4 + 24 + 1 + 8 + 48 + 8 + 48 = 141 := by
  norm_num

/-- The LMFDB total of §10.1. -/
example : 11384 + 359 = 11743 := by
  norm_num

end TauCeti.AbelianSurfacesModularity
