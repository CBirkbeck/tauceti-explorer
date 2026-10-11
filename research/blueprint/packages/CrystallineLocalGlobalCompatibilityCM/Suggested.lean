import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.Logic.Equiv.Fin.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Tactic.NormNum
import TauCeti.RingTheory.Ideal.ArtinRees

/-!
# CrystallineLocalGlobalCompatibilityCM: representative target signatures

README.md is the roadmap and is definitive. This file records definitions,
theorem signatures and example checks statable against the pinned library APIs;
it is not exhaustive. All new proofs use `sorry`.

The signatures fix block exchange rather than full reversal, descending block
exponents including negative central shifts, inverse scalar rescaling, integral
finite-coset transfer, coefficient-valued duals, and the floor/ceiling degree
bound. Algebraic image ranges use the supplied actions; DVR matrix constructions
use the supplied local uniformizer and fraction field. Arithmetic smoothness,
completed towers, integral dual-Weyl lattices and Galois deformation conditions
have the exact supplier contracts stated in README.md.

Fin (n+n) represents Fin (2*n) through its canonical arithmetic identification.
The finite-group criterion retains the cubic tetrahedral exception. Its
quaternion examples distinguish that case in characteristic seven.
-/

open scoped TensorProduct BigOperators

noncomputable section
namespace TauCetiRoadmap.CrystallineLocalGlobalCompatibilityCM
namespace CrystallineCM

/-! ## Layer 0: Siegel parahorics and integral coefficient actions -/

/- The Siegel exchange is the existing block permutation. -/
/-- The Siegel permutation exchanges the two n-blocks without reversing either block. -/
abbrev WeylElements (n : ℕ) : Equiv.Perm (Fin (n+n)) := finAddFlip

/-- For the Siegel exchange e on Fin(2n), e(i)=i+n for i<n and i−n otherwise. -/
theorem WeylElements_apply (n : ℕ) (i : Fin (n+n)) :
    ((WeylElements n) i).val = if i.val < n then i.val+n else i.val-n := by
  sorry

/-- e∘e=id, so conjugation twice returns the original Levi action. -/
theorem WeylElements_involutive (n : ℕ) : Function.Involutive (WeylElements n) := by
  sorry

/-- Conjugation by the exchange permutation matrix sends diag(A,D) to diag(D,A), without transpose or inversion. -/
theorem WeylElements_levi_conjugation {R : Type*} [CommRing R] (n : ℕ)
    (A D : Matrix (Fin n) (Fin n) R) :
    (WeylElements n).permMatrix R *
      (Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks A 0 0 D)) *
      (WeylElements n).permMatrix R =
      Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks D 0 0 A) := by
  sorry

-- CrystallineCM.WeylElements_test_n_one
example : WeylElements 1 0 = 1 ∧ WeylElements 1 1 = 0 := by
  sorry
-- CrystallineCM.WeylElements_test_n_zero
example : WeylElements 0 = Equiv.refl (Fin (0+0)) := by
  sorry
-- CrystallineCM.WeylElements_test_not_reverse
example : WeylElements 2 0 = 2 ∧ WeylElements 2 1 = 3 ∧
    WeylElements 2 2 = 0 ∧ WeylElements 2 3 = 1 ∧
    WeylElements 2 ≠ Fin.revPerm := by
  sorry

/- Positive central exponents on the t Levi blocks. -/
/-- Descending integral exponents on the central blocks, including negative scalar shifts. -/
def PositiveCentralCocharacters (t : ℕ) : AddSubmonoid (Fin t → ℤ) where
  carrier := {a | Antitone a}
  zero_mem' := by sorry
  add_mem' := by sorry

/-- A block-central tuple belongs to X_Q iff a₁≥⋯≥a_t. -/
theorem PositiveCentralCocharacters_mem_iff (t : ℕ) (a : Fin t → ℤ) :
    a ∈ PositiveCentralCocharacters t ↔ ∀ i j, i ≤ j → a j ≤ a i := by
  sorry

/-- X_Q is closed under addition, and evaluation sends addition to multiplication of diagonal matrices. -/
theorem PositiveCentralCocharacters_add (t : ℕ) (a b : Fin t → ℤ)
    (ha : a ∈ PositiveCentralCocharacters t) (hb : b ∈ PositiveCentralCocharacters t)
    {E : Type*} [Field E] (π : E) (hπ : π ≠ 0) :
    a+b ∈ PositiveCentralCocharacters t ∧
      ∀ i, π ^ ((a+b) i) = π ^ (a i) * π ^ (b i) := by
  sorry

/-- The k-th tuple (1,…,1,0,…,0) belongs; k=t is the invertible scalar tuple. -/
theorem PositiveCentralCocharacters_partial (t k : ℕ) (hk : k ≤ t) :
    (fun i : Fin t => if i.val < k then (1 : ℤ) else 0) ∈
      PositiveCentralCocharacters t := by
  sorry

-- CrystallineCM.PositiveCentralCocharacters_test_two_blocks
example : ![(1 : ℤ),0] ∈ PositiveCentralCocharacters 2 ∧
    ![(-1 : ℤ),-2] ∈ PositiveCentralCocharacters 2 ∧
    ![(0 : ℤ),1] ∉ PositiveCentralCocharacters 2 := by
  sorry
-- CrystallineCM.PositiveCentralCocharacters_test_central_scalar
example (t : ℕ) (a : ℤ) : (fun _ : Fin t => a) ∈ PositiveCentralCocharacters t := by
  sorry
-- CrystallineCM.PositiveCentralCocharacters_test_root_pairing
-- Simple-root pairing is a_i-a_(i+1) under the imported GL block-root dictionary.
example (t : ℕ) (a : Fin (t+1) → ℤ) :
    a ∈ PositiveCentralCocharacters (t+1) ↔
      ∀ i : Fin t, 0 ≤ a i.castSucc - a i.succ := by
  sorry

/- Entrywise integral block conditions for the Siegel parahoric. -/
/-- Integral block congruences: lower-left depth c and diagonal identity depth b. -/
def ParahoricPVBC {R : Type*} [CommRing R] (n b c : ℕ) (π : R)
    (hbc : b ≤ c) : Subgroup (Matrix.GeneralLinearGroup (Fin (n+n)) R) where
  carrier := {g | ∀ i j : Fin n,
    g (Fin.natAdd n i) (Fin.castAdd n j) ∈ (Ideal.span {π}) ^ c ∧
    g (Fin.castAdd n i) (Fin.castAdd n j) - (if i=j then 1 else 0) ∈
      (Ideal.span {π}) ^ b ∧
    g (Fin.natAdd n i) (Fin.natAdd n j) - (if i=j then 1 else 0) ∈
      (Ideal.span {π}) ^ b}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- g=(A B;C D) belongs iff C is divisible by ϖ_v^c and A−1,D−1 by ϖ_v^b. -/
theorem ParahoricPVBC_mem_iff {R : Type*} [CommRing R] (n b c : ℕ) (π : R)
    (hbc : b ≤ c) (g : Matrix.GeneralLinearGroup (Fin (n+n)) R) :
    g ∈ ParahoricPVBC n b c π hbc ↔ ∀ i j : Fin n,
      g (Fin.natAdd n i) (Fin.castAdd n j) ∈ (Ideal.span {π}) ^ c ∧
      g (Fin.castAdd n i) (Fin.castAdd n j) - (if i=j then 1 else 0) ∈
        (Ideal.span {π}) ^ b ∧
      g (Fin.natAdd n i) (Fin.natAdd n j) - (if i=j then 1 else 0) ∈
        (Ideal.span {π}) ^ b := by
  sorry

/-- For b′≥b,c′≥c satisfying validity, P(b′,c′)⊂P(b,c). -/
theorem ParahoricPVBC_antitone_depth {R : Type*} [CommRing R]
    (n b c b' c' : ℕ) (π : R) (hbc : b ≤ c) (hb'c' : b' ≤ c')
    (hb : b ≤ b') (hc : c ≤ c') :
    ParahoricPVBC n b' c' π hb'c' ≤ ParahoricPVBC n b c π hbc := by
  sorry

-- The surjective block-reduction map with this kernel gives the advertised quotient.
/-- The block-diagonal reduction gives P(0,c)/P(b,c)≅GL_n(O_v/ϖ_v^b)×GL_n(O_v/ϖ_v^b), for c≥b. -/
theorem ParahoricPVBC_levi_quotient {R : Type*} [CommRing R] [IsLocalRing R]
    (n b c : ℕ) (π : R) (hπ : π ∈ IsLocalRing.maximalIdeal R)
    (hbc : b ≤ c) (hc : 1 ≤ c) :
    ∃ f : ParahoricPVBC n 0 c π (Nat.zero_le c) →*
      (Matrix.GeneralLinearGroup (Fin n) (R ⧸ (Ideal.span {π}) ^ b) ×
       Matrix.GeneralLinearGroup (Fin n) (R ⧸ (Ideal.span {π}) ^ b)),
      Function.Surjective f ∧ ∀ g, f g = 1 ↔ g.val ∈ ParahoricPVBC n b c π hbc := by
  sorry

-- CrystallineCM.ParahoricPVBC_test_b_zero
example {R : Type*} [CommRing R] (n : ℕ) (π : R)
    (g : Matrix.GeneralLinearGroup (Fin (n+n)) R) :
    g ∈ ParahoricPVBC n 0 1 π (by decide) ↔
      ∀ i j : Fin n, g (Fin.natAdd n i) (Fin.castAdd n j) ∈ Ideal.span {π} := by
  sorry
-- CrystallineCM.ParahoricPVBC_test_n_one
example :
    let u := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![(1 : ZMod 3),1;0,1]) (by sorry)
    let l := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![(1 : ZMod 3),0;1,1]) (by sorry)
    u ∈ ParahoricPVBC 1 1 1 (0 : ZMod 3) (by decide) ∧
    l ∉ ParahoricPVBC 1 1 1 (0 : ZMod 3) (by decide) := by
  sorry
-- CrystallineCM.ParahoricPVBC_test_diagonal_not_unipotent
example :
    let g := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![(2 : ZMod 3),0;0,1]) (by sorry)
    g ∈ ParahoricPVBC 1 0 1 (0 : ZMod 3) (by decide) ∧
    g ∉ ParahoricPVBC 1 1 1 (0 : ZMod 3) (by decide) := by
  sorry

/- The positive Siegel monoid in the split matrix model over a DVR. -/
private def blockParahoric {O I : Type*} [CommRing O] [Fintype I] [DecidableEq I]
    {t : ℕ} (block : I → Fin t) (π : O) :
    Subgroup (Matrix.GeneralLinearGroup I O) where
  carrier := {g | ∀ i j, block j < block i → g i j ∈ Ideal.span {π}}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

private def blockCentralMatrix {K I : Type*} [Field K] [Fintype I] [DecidableEq I]
    {t : ℕ} (block : I → Fin t) (πK : Kˣ) (a : Fin t → ℤ) :
    Matrix.GeneralLinearGroup I K where
  val := Matrix.diagonal (fun i => (πK ^ a (block i)).val)
  inv := Matrix.diagonal (fun i => ((πK ^ a (block i))⁻¹).val)
  val_inv := by sorry
  inv_val := by sorry

private def uniformizerUnit {O K : Type*} [CommRing O] [IsDomain O]
    [Field K] [Algebra O K] [IsFractionRing O K]
    (π : O) (hπ : Irreducible π) : Kˣ :=
  Units.mk0 (algebraMap O K π) (by sorry)

section PositiveParahoric
variable {O K I : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Field K] [Algebra O K] [IsFractionRing O K] [Fintype I] [DecidableEq I]
  {t : ℕ}

/-- The union of compact parahoric double cosets of positive block-central
cocharacters, in the split matrix model over a DVR and its fraction field.
The integral subgroup is the inverse image of the block upper-triangular
parabolic modulo the local uniformizer. This definition asserts no topology. -/
def PositiveParahoricMonoid (block : I → Fin t) (π : O) (hπ : Irreducible π) :
    Submonoid (Matrix.GeneralLinearGroup I K) where
  carrier := {g | ∃ a : Fin t → ℤ, a ∈ PositiveCentralCocharacters t ∧
    ∃ q₁ q₂ : blockParahoric block π,
      g = Matrix.GeneralLinearGroup.map (algebraMap O K) q₁.val *
        blockCentralMatrix block (uniformizerUnit (K := K) π hπ) a *
        Matrix.GeneralLinearGroup.map (algebraMap O K) q₂.val}
  one_mem' := by sorry
  mul_mem' := by sorry

/-- Each g∈𝒬ν(ϖ)𝒬 with ν∈X_Q maps to Δ̃^Q. -/
theorem PositiveParahoricMonoid_double_coset (block : I → Fin t)
    (π : O) (hπ : Irreducible π) (a : Fin t → ℤ) (ha : a ∈ PositiveCentralCocharacters t)
    (q₁ q₂ : blockParahoric block π) :
    Matrix.GeneralLinearGroup.map (algebraMap O K) q₁.val *
      blockCentralMatrix block (uniformizerUnit (K := K) π hπ) a *
      Matrix.GeneralLinearGroup.map (algebraMap O K) q₂.val ∈
        PositiveParahoricMonoid (K := K) block π hπ := by
  sorry

private def positiveLeviMonoid {M : Type*} [Group M] (block : I → Fin t)
    (π : O) (hπ : Irreducible π) (ι : M →* Matrix.GeneralLinearGroup I K) :
    Submonoid M := (PositiveParahoricMonoid block π hπ).comap ι

/-- Pullback along the actual Levi homomorphism retains its multiplication. -/
theorem PositiveParahoricMonoid_levi_intersection {M : Type*} [Group M]
    (block : I → Fin t) (π : O) (hπ : Irreducible π)
    (ι : M →* Matrix.GeneralLinearGroup I K) (g h : M) :
    (g ∈ positiveLeviMonoid block π hπ ι ↔
      ι g ∈ PositiveParahoricMonoid block π hπ) ∧
      ι (g*h) = ι g * ι h := by
  sorry

private def positiveLeviInverted {M : Type*} [Group M] (D : Submonoid M) (u : D) :
    Submonoid M := Submonoid.closure ((D : Set M) ∪ {((u : M)⁻¹)})

private def positiveLeviInclusion {M : Type*} [Group M] (D : Submonoid M) (u : D) :
    D →* positiveLeviInverted D u where
  toFun g := ⟨g.val, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- Invert one central Siegel element in the positive Levi monoid. The target
may be an endomorphism monoid; invertibility is required only at this element. -/
theorem PositiveParahoricMonoid_localization {M T : Type*} [Group M] [Monoid T]
    (block : I → Fin t) (π : O) (hπ : Irreducible π)
    (ι : M →* Matrix.GeneralLinearGroup I K)
    (u : positiveLeviMonoid block π hπ ι)
    (hu : ∀ g : positiveLeviMonoid block π hπ ι, Commute u g)
    (f : positiveLeviMonoid block π hπ ι →* T) (hfu : IsUnit (f u)) :
    ∃! f' : positiveLeviInverted (positiveLeviMonoid block π hπ ι) u →* T,
      f'.comp (positiveLeviInclusion (positiveLeviMonoid block π hπ ι) u) = f := by
  sorry

-- CrystallineCM.PositiveParahoricMonoid_test_identity
example (block : I → Fin t) (π : O) (hπ : Irreducible π)
    (q : blockParahoric block π) :
    Matrix.GeneralLinearGroup.map (algebraMap O K) q.val ∈
      PositiveParahoricMonoid (K := K) block π hπ ∧
      1 ∈ PositiveParahoricMonoid (K := K) block π hπ := by
  sorry

-- CrystallineCM.PositiveParahoricMonoid_test_negative_central
example (block : I → Fin t) (π : O) (hπ : Irreducible π) :
    Matrix.GeneralLinearGroup.scalar I (uniformizerUnit (K := K) π hπ)⁻¹ ∈
      PositiveParahoricMonoid (K := K) block π hπ := by
  sorry

private def siegelBlock (n : ℕ) (i : Fin (n+n)) : Fin 2 :=
  if i.val < n then 0 else 1

-- CrystallineCM.PositiveParahoricMonoid_test_partial_inverse
example (n : ℕ) (hn : 0 < n) (π : O) (hπ : Irreducible π) :
    blockCentralMatrix (siegelBlock n) (uniformizerUnit (K := K) π hπ)
      ![(0 : ℤ),1] ∉ PositiveParahoricMonoid (K := K) (siegelBlock n) π hπ := by
  sorry

end PositiveParahoric

/- Lowest-weight scaling from the supplied exponent maps, CN §2.1.13. -/
section LowestWeightScaling
variable {D E Emb : Type*} [Monoid D] [Field E] [Fintype Emb] {r : ℕ}

/-- The character from the supplied central-exponent map; the Weyl permutation
acts on the weight by inverse reindexing. Compact elements have exponent zero.
The arithmetic double-coset exponent map is a separate required input. -/
def LowestWeightScalingCharacter (π : Emb → Eˣ) (lam : Emb → Fin r → ℤ)
    (w : Equiv.Perm (Fin r)) (ν : D →* Multiplicative (Fin r → ℤ)) : D →* Eˣ where
  toFun g := ∏ τ, π τ ^ (∑ i, (ν g).toAdd i * lam τ (w.symm i))
  map_one' := by sorry
  map_mul' := by sorry

/-- α̃(q)=1 for q∈𝒬. -/
theorem LowestWeightScalingCharacter_compact (π : Emb → Eˣ)
    (lam : Emb → Fin r → ℤ) (w : Equiv.Perm (Fin r))
    (ν : D →* Multiplicative (Fin r → ℤ)) (q : D) (hq : ν q = 1) :
    LowestWeightScalingCharacter π lam w ν q = 1 := by
  sorry

/-- α̃(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀λ̃_τ⟩}. -/
theorem LowestWeightScalingCharacter_cocharacter (π : Emb → Eˣ)
    (lam : Emb → Fin r → ℤ) (w : Equiv.Perm (Fin r))
    (ν : D →* Multiplicative (Fin r → ℤ)) (a : Fin r → ℤ)
    (g : D) (hg : ν g = Multiplicative.ofAdd a) :
    LowestWeightScalingCharacter π lam w ν g =
      ∏ τ, π τ ^ (∑ i, a i * lam τ (w.symm i)) := by
  sorry

/-- Each of α̃ and α_λ is multiplicative on its own monoid; the Levi character extends uniquely when ũ_n is inverted. Their relation in coefficient comparison uses the explicit w₀^P block exchange, rather than equality by restriction. -/
theorem LowestWeightScalingCharacter_mul (π : Emb → Eˣ)
    (lam : Emb → Fin r → ℤ) (w : Equiv.Perm (Fin r))
    (ν : D →* Multiplicative (Fin r → ℤ)) (g h : D) :
    LowestWeightScalingCharacter π lam w ν (g*h) =
      LowestWeightScalingCharacter π lam w ν g *
        LowestWeightScalingCharacter π lam w ν h := by
  sorry

/-- Adjoining the inverse of one selected operator, with its extended exponent
map, constructs a unique character. Other positive operators need not become
invertible, and the selected Weyl permutation is unchanged. -/
theorem LowestWeightScalingCharacter_extension (π : Emb → Eˣ)
    (lam : Emb → Fin r → ℤ) (w : Equiv.Perm (Fin r))
    (ν : D →* Multiplicative (Fin r → ℤ))
    {H : Type*} [Monoid H] (j : D →* H)
    (νH : H →* Multiplicative (Fin r → ℤ)) (hν : νH.comp j = ν)
    (u : D) (uH : Hˣ) (hu : (uH : H) = j u)
    (hgen : Submonoid.closure (Set.range j ∪ {((uH⁻¹ : Hˣ) : H)}) = ⊤) :
    (∃! χ : H →* Eˣ, χ.comp j = LowestWeightScalingCharacter π lam w ν) ∧
      LowestWeightScalingCharacter π lam w νH (uH⁻¹ : Hˣ) =
        (LowestWeightScalingCharacter π lam w ν u)⁻¹ := by
  sorry

-- CrystallineCM.LowestWeightScalingCharacter_test_zero_weight
example (π : Emb → Eˣ) (w : Equiv.Perm (Fin r))
    (ν : D →* Multiplicative (Fin r → ℤ)) :
    LowestWeightScalingCharacter π (fun _ _ => 0) w ν = 1 := by
  sorry

-- CrystallineCM.LowestWeightScalingCharacter_test_rank_one
example (π : Eˣ) (a b : ℤ) :
    LowestWeightScalingCharacter (fun _ : Unit => π)
      (fun _ => ![a,b]) Fin.revPerm
      (MonoidHom.id (Multiplicative (Fin 2 → ℤ)))
      (Multiplicative.ofAdd ![1,0]) = π ^ b := by
  simp [LowestWeightScalingCharacter, Fin.sum_univ_two, Fin.revPerm]

-- CrystallineCM.LowestWeightScalingCharacter_test_compact_value
example (π : Emb → Eˣ) (lam : Emb → Fin r → ℤ)
    (w : Equiv.Perm (Fin r)) (ν : D →* Multiplicative (Fin r → ℤ))
    (K : Submonoid D) (hK : ∀ q : K, ν q = 1) (q : K) :
    LowestWeightScalingCharacter π lam w ν q = 1 := by
  sorry

-- CrystallineCM.LowestWeightScalingCharacter_test_distinct_weyl
example :
    let π := Units.mk0 (2 : ℚ) (by decide)
    let lam : Unit → Fin 4 → ℤ := fun _ => ![1,1,0,0]
    let ν := MonoidHom.id (Multiplicative (Fin 4 → ℤ))
    let a : Multiplicative (Fin 4 → ℤ) := Multiplicative.ofAdd ![1,1,0,0]
    let αU := LowestWeightScalingCharacter (fun _ : Unit => π) lam Fin.revPerm ν
    let αL := LowestWeightScalingCharacter (fun _ : Unit => π) lam
      (WeylElements 2 * Fin.revPerm) ν
    (αU a : ℚ) = 1 ∧ (αL a : ℚ) = 4 ∧ αU a ≠ αL a := by
  have hU : (∑ i : Fin 4, (![1,1,0,0] : Fin 4 → ℤ) i *
      (![1,1,0,0] : Fin 4 → ℤ) i.rev) = 0 := by
    simp only [Fin.sum_univ_succ]
    decide
  have hL : (∑ i : Fin 4, (![1,1,0,0] : Fin 4 → ℤ) i *
      (![1,1,0,0] : Fin 4 → ℤ) ((WeylElements 2 * Fin.revPerm).symm i)) = 2 := by
    simp only [Fin.sum_univ_succ]
    decide
  norm_num [LowestWeightScalingCharacter, hU, hL]
  intro h
  have hc := congrArg (fun u : ℚˣ => (u : ℚ)) h
  norm_num at hc

end LowestWeightScaling

/- Rescaling a representation by the supplied character. -/
/-- Multiply the supplied representation by the inverse of its supplied scalar character. -/
def RescaledActions {E G V : Type*} [Field E] [Monoid G] [AddCommGroup V] [Module E V]
    (ρ : Representation E G V) (α : G →* Eˣ) : Representation E G V where
  toFun g := ((α g)⁻¹ : Eˣ).val • ρ g
  map_one' := by sorry
  map_mul' := by sorry

/-- ρ_scaled(g)x=α(g)^{-1}ρ(g)x. -/
theorem RescaledActions_apply {E G V : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] (ρ : Representation E G V) (α : G →* Eˣ)
    (g : G) (x : V) : RescaledActions ρ α g x = ((α g)⁻¹ : Eˣ).val • ρ g x := by
  sorry

/-- ρ_scaled is a monoid representation: its identity is identity and products act by composed operators. -/
theorem RescaledActions_one_mul {E G V : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] (ρ : Representation E G V) (α : G →* Eˣ)
    (g h : G) : RescaledActions ρ α 1 = 1 ∧
      RescaledActions ρ α (g*h) = RescaledActions ρ α g * RescaledActions ρ α h := by
  sorry

/-- An E-linear ρ-intertwiner for the same character α remains an intertwiner after rescaling. -/
theorem RescaledActions_intertwiner {E G V W : Type*} [Field E] [Monoid G]
    [AddCommGroup V] [Module E V] [AddCommGroup W] [Module E W]
    (ρ : Representation E G V) (σ : Representation E G W) (α : G →* Eˣ)
    (f : V →ₗ[E] W) (hf : ∀ g x, f (ρ g x) = σ g (f x)) :
    ∀ g x, f (RescaledActions ρ α g x) = RescaledActions σ α g (f x) := by
  sorry

-- CrystallineCM.RescaledActions_test_trivial_character
example {E G V : Type*} [Field E] [Monoid G] [AddCommGroup V] [Module E V]
    (ρ : Representation E G V) : RescaledActions ρ (1 : G →* Eˣ) = ρ := by
  sorry

private def scalarRep : Representation ℚ ℚˣ ℚ where
  toFun g := g.val • LinearMap.id
  map_one' := by sorry
  map_mul' := by sorry

-- CrystallineCM.RescaledActions_test_scalar
example (x : ℚ) :
    RescaledActions scalarRep (MonoidHom.id ℚˣ) (Units.mk0 (2 : ℚ) (by sorry)) x = x := by
  sorry
-- CrystallineCM.RescaledActions_test_inverse_required
example :
    let g := Units.mk0 (2 : ℚ) (by sorry)
    RescaledActions scalarRep (MonoidHom.id ℚˣ) g 1 = 1 ∧
      g.val • (scalarRep g 1) = 4 ∧ g.val • (scalarRep g 1) ≠ 1 := by
  sorry

/-! ## Layer 1: P-ordinary functors and completed level control -/

/- CN §2.2.2, equation (2.2.1), p.26: degree-zero transfer core.
For the arithmetic application, c(u)=gug⁻¹ and A is the raw g-action.
Finite index and the intertwining equation are explicit mathematical inputs.
The smooth monoid category and its derived functor remain supplier interfaces. -/
/-- The finite left-coset sum applies the raw intertwining operator to invariant vectors. -/
def UnipotentTransferAction
    {R U V : Type*} [CommRing R] [Group U] [AddCommGroup V] [Module R V]
    (ρ : Representation R U V) (c : U →* U) (hc : Finite (U ⧸ c.range))
    (A : Module.End R V) (hA : ∀ u, A ∘ₗ ρ u = ρ (c u) ∘ₗ A) :
    Module.End R ρ.invariants := by
  letI := hc
  letI := Fintype.ofFinite (U ⧸ c.range)
  exact {
    toFun := fun v => ⟨∑ q : U ⧸ c.range, ρ q.out (A v), by sorry⟩
    map_add' := by sorry
    map_smul' := by sorry }

/-- Replacing any representative n by an element of its same left coset does not change T_g on U₀-invariants. -/
theorem UnipotentTransferAction_independent
    {R U V : Type*} [CommRing R] [Group U] [AddCommGroup V] [Module R V]
    (ρ : Representation R U V) (c : U →* U) (hc : Finite (U ⧸ c.range))
    (A : Module.End R V) (hA : ∀ u, A ∘ₗ ρ u = ρ (c u) ∘ₗ A)
    (r : U ⧸ c.range → U) (hr : ∀ q, QuotientGroup.mk (r q) = q)
    (v : ρ.invariants) :
    letI := hc
    letI := Fintype.ofFinite (U ⧸ c.range)
    (UnipotentTransferAction ρ c hc A hA v : V) =
      ∑ q : U ⧸ c.range, ρ (r q) (A v) := by
  sorry

/-- T_{gh}=T_g∘T_h and T_1=id. -/
theorem UnipotentTransferAction_mul
    {R U V : Type*} [CommRing R] [Group U] [AddCommGroup V] [Module R V]
    (ρ : Representation R U V) (c d : U →* U)
    (hc : Finite (U ⧸ c.range)) (hd : Finite (U ⧸ d.range))
    (hcd : Finite (U ⧸ (c.comp d).range))
    (hci : Function.Injective c) (hdi : Function.Injective d)
    (A B : Module.End R V)
    (hA : ∀ u, A ∘ₗ ρ u = ρ (c u) ∘ₗ A)
    (hB : ∀ u, B ∘ₗ ρ u = ρ (d u) ∘ₗ B) :
    UnipotentTransferAction ρ (c.comp d) hcd (A ∘ₗ B) (by sorry) =
      UnipotentTransferAction ρ c hc A hA * UnipotentTransferAction ρ d hd B hB ∧
    UnipotentTransferAction ρ (MonoidHom.id U) (by sorry) (LinearMap.id) (by sorry) = 1 := by
  sorry

/-- When g normalizes U₀, T_g is the usual g-action because the quotient has one element. -/
theorem UnipotentTransferAction_compact
    {R U V : Type*} [CommRing R] [Group U] [AddCommGroup V] [Module R V]
    (ρ : Representation R U V) (c : U →* U) (hc : Finite (U ⧸ c.range))
    (A : Module.End R V) (hA : ∀ u, A ∘ₗ ρ u = ρ (c u) ∘ₗ A)
    (hcs : Function.Surjective c) (v : ρ.invariants) :
    (UnipotentTransferAction ρ c hc A hA v : V) = A v := by
  sorry

-- CrystallineCM.UnipotentTransferAction_test_trivial_u
example {R V : Type*} [CommRing R] [AddCommGroup V] [Module R V]
    (A : Module.End R V)
    (v : (Representation.trivial R PUnit V).invariants) :
    (UnipotentTransferAction (Representation.trivial R PUnit V)
      (MonoidHom.id PUnit) (by infer_instance) A (by sorry) v : V) = A v := by
  sorry

private def padicTransferContraction (p : ℕ) [Fact p.Prime] :
    Multiplicative ℤ_[p] →* Multiplicative ℤ_[p] where
  toFun z := Multiplicative.ofAdd ((p : ℤ_[p]) * z.toAdd)
  map_one' := by simp
  map_mul' := by simp [mul_add]

/- This equivalence is the additive residue-field quotient. The underlying
contraction is multiplication by p on Z_p, so its image is p Z_p. -/
private def padicTransferResidueEquiv (p : ℕ) [Fact p.Prime] :
    (Multiplicative ℤ_[p] ⧸ (padicTransferContraction p).range) ≃ ZMod p := by
  sorry

private theorem padicTransferResidueEquiv_apply (p : ℕ) [Fact p.Prime]
    (z : ℤ_[p]) :
    padicTransferResidueEquiv p (QuotientGroup.mk (Multiplicative.ofAdd z)) =
      PadicInt.toZMod z := by
  sorry

private theorem padicTransferFinite (p : ℕ) [Fact p.Prime] :
    Finite (Multiplicative ℤ_[p] ⧸ (padicTransferContraction p).range) := by
  let := Fintype.ofEquiv (ZMod p) (padicTransferResidueEquiv p).symm
  infer_instance

-- CrystallineCM.UnipotentTransferAction_test_index_p
example (p : ℕ) [Fact p.Prime]
    (v : (Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p)).invariants) :
    (UnipotentTransferAction
      (Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p))
      (padicTransferContraction p) (padicTransferFinite p) (LinearMap.id) (by sorry) v :
      ZMod p) = (p : ZMod p) * v ∧
    (UnipotentTransferAction
      (Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p))
      (padicTransferContraction p) (padicTransferFinite p) (LinearMap.id) (by sorry) v :
      ZMod p) = 0 := by
  sorry

-- CrystallineCM.UnipotentTransferAction_test_not_raw
example (p : ℕ) [Fact p.Prime] :
    let ρ := Representation.trivial (ZMod p) (Multiplicative ℤ_[p]) (ZMod p)
    let T := UnipotentTransferAction ρ (padicTransferContraction p)
      (padicTransferFinite p) (LinearMap.id) (by sorry)
    T = 0 ∧ T ≠ 1 := by
  sorry

/-! ## Layer 2: Weight independence and dual ordinary parts -/


/-! ## Layer 3: Bruhat induction and deep unipotent cohomology -/

/- The natural subquotient comparison of CN Lemma 2.3.18, p.43;
used in Proposition 4.2.6, pp.63–65.
Specialize the existing TauCeti.ArtinRees.exists_controlled_lift and Mathlib
Ideal.exists_pow_inf_eq_pow_smul. The quotient image and square retain the
chosen presentation f : N' → M; an unrelated abstract witness loses this data.
 -/
/- These are abbreviations for Mathlib's quotient image and its canonical map.
They do not choose an unrelated subquotient witness. -/
private abbrev adicSubmoduleImage (p : ℕ) [Fact p.Prime]
    {N : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    (N' : Submodule ℤ_[p] N) (e : ℕ) :=
  ((((Ideal.span {(p : ℤ_[p])}) ^ e) • (⊤ : Submodule ℤ_[p] N)).mkQ.comp
    N'.subtype).range

private abbrev adicSubmoduleImageMap (p : ℕ) [Fact p.Prime]
    {N : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    (N' : Submodule ℤ_[p] N) (e : ℕ) :
    N' →ₗ[ℤ_[p]] adicSubmoduleImage p N' e :=
  ((((Ideal.span {(p : ℤ_[p])}) ^ e) • (⊤ : Submodule ℤ_[p] N)).mkQ.comp
    N'.subtype).rangeRestrict

/-- Artin–Rees realizes a reduced subquotient in a sufficiently deep ambient coefficient quotient. -/
theorem subquotient_mod_p_pow (p : ℕ) [Fact p.Prime]
    {N M : Type*} [AddCommGroup N] [Module ℤ_[p] N] [Module.Finite ℤ_[p] N]
    [AddCommGroup M] [Module ℤ_[p] M] (N' : Submodule ℤ_[p] N)
    (f : N' →ₗ[ℤ_[p]] M) (hf : Function.Surjective f) (m : ℕ) (hm : 1 ≤ m) :
    ∃ m' : ℕ, m ≤ m' ∧
      ∃ g : adicSubmoduleImage p N' m' →ₗ[ℤ_[p]]
        (M ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M))),
      Function.Surjective g ∧
        g.comp (adicSubmoduleImageMap p N' m') =
          (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f := by
  sorry

/-- The Artin–Rees shift depends only on the chosen ambient submodule,
so it precedes both the quotient map and the coefficient depth. -/
theorem subquotient_mod_p_pow_uniform (p : ℕ) [Fact p.Prime]
    {N : Type*} [AddCommGroup N] [Module ℤ_[p] N] [Module.Finite ℤ_[p] N]
    (N' : Submodule ℤ_[p] N) :
    ∃ k₀ : ℕ, ∀ {M : Type*} [AddCommGroup M] [Module ℤ_[p] M]
      (f : N' →ₗ[ℤ_[p]] M), Function.Surjective f → ∀ m : ℕ, 1 ≤ m →
      ∃ g : adicSubmoduleImage p N' (m+k₀) →ₗ[ℤ_[p]]
        (M ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M))),
      Function.Surjective g ∧
        g.comp (adicSubmoduleImageMap p N' (m+k₀)) =
          (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f := by
  sorry

/-- At a fixed ambient depth, the comparison square determines its map uniquely.
This uses surjectivity onto the actual quotient image, not finite generation. -/
theorem subquotient_mod_p_pow_unique (p : ℕ) [Fact p.Prime]
    {N M : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    [AddCommGroup M] [Module ℤ_[p] M] (N' : Submodule ℤ_[p] N)
    (f : N' →ₗ[ℤ_[p]] M) (e m : ℕ)
    (g₁ g₂ : adicSubmoduleImage p N' e →ₗ[ℤ_[p]]
      (M ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M))))
    (hg₁ : g₁.comp (adicSubmoduleImageMap p N' e) =
      (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f)
    (hg₂ : g₂.comp (adicSubmoduleImageMap p N' e) =
      (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f) :
    g₁ = g₂ := by
  sorry

/-- The canonical comparison intertwines supplied Hecke or monoid actions.
The two generating maps must be equivariant for the same source action.
No arithmetic action is constructed by this scalar-linear descent statement. -/
theorem subquotient_mod_p_pow_equivariant (p : ℕ) [Fact p.Prime]
    {N M H : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    [AddCommGroup M] [Module ℤ_[p] M] [Monoid H]
    (N' : Submodule ℤ_[p] N) (f : N' →ₗ[ℤ_[p]] M) (e m : ℕ)
    (ρSub : Representation ℤ_[p] H N')
    (ρImage : Representation ℤ_[p] H (adicSubmoduleImage p N' e))
    (ρQuot : Representation ℤ_[p] H
      (M ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M))))
    (hImage : ∀ h, (ρImage h).comp (adicSubmoduleImageMap p N' e) =
      (adicSubmoduleImageMap p N' e).comp (ρSub h))
    (hQuot : ∀ h, (ρQuot h).comp
        ((((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f) =
      ((((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f).comp
        (ρSub h))
    (g : adicSubmoduleImage p N' e →ₗ[ℤ_[p]]
      (M ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M))))
    (hg : g.comp (adicSubmoduleImageMap p N' e) =
      (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f) :
    ∀ h, g.comp (ρImage h) = (ρQuot h).comp g := by
  sorry

-- A quotient of the entire ambient module needs no coefficient-depth increase.
example (p : ℕ) [Fact p.Prime]
    {N M : Type*} [AddCommGroup N] [Module ℤ_[p] N]
    [AddCommGroup M] [Module ℤ_[p] M]
    (f : (⊤ : Submodule ℤ_[p] N) →ₗ[ℤ_[p]] M)
    (hf : Function.Surjective f) (m : ℕ) :
    ∃ g : adicSubmoduleImage p (⊤ : Submodule ℤ_[p] N) m →ₗ[ℤ_[p]]
      (M ⧸ (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M))),
      Function.Surjective g ∧
        g.comp (adicSubmoduleImageMap p (⊤ : Submodule ℤ_[p] N) m) =
          (((Ideal.span {(p : ℤ_[p])}) ^ m) • (⊤ : Submodule ℤ_[p] M)).mkQ.comp f := by
  sorry

-- For pℤ_p⊂ℤ_p at m=1, the natural image in ℤ_p/pℤ_p vanishes,
-- but pℤ_p/p(pℤ_p) does not. No map can have the required square at m'=1.
example (p : ℕ) [Fact p.Prime] :
    let N' : Submodule ℤ_[p] ℤ_[p] := Ideal.span {(p : ℤ_[p])}
    ¬ ∃ g : adicSubmoduleImage p N' 1 →ₗ[ℤ_[p]]
      (N' ⧸ ((Ideal.span {(p : ℤ_[p])}) • (⊤ : Submodule ℤ_[p] N'))),
      g.comp (adicSubmoduleImageMap p N' 1) =
        ((Ideal.span {(p : ℤ_[p])}) • (⊤ : Submodule ℤ_[p] N')).mkQ := by
  sorry

-- Depth two repairs the same natural square. This is a quotient of the
-- actual image of pℤ_p in ℤ_p/p²ℤ_p, not an abstract isomorphic copy.
example (p : ℕ) [Fact p.Prime] :
    let N' : Submodule ℤ_[p] ℤ_[p] := Ideal.span {(p : ℤ_[p])}
    ∃ g : adicSubmoduleImage p N' 2 →ₗ[ℤ_[p]]
      (N' ⧸ ((Ideal.span {(p : ℤ_[p])}) • (⊤ : Submodule ℤ_[p] N'))),
      Function.Bijective g ∧
        g.comp (adicSubmoduleImageMap p N' 2) =
          ((Ideal.span {(p : ℤ_[p])}) • (⊤ : Submodule ℤ_[p] N')).mkQ := by
  sorry


/- The determinant-norm unit character, CN §2.3.1, p.37.
The input δ is the *actual* norm of the determinant on Lie U, supplied by PA.0/PA.2.
The normalization itself needs no smooth-category carrier. The codomain is ℤ_pˣ,
which maps into Oˣ under the coefficient algebra map. This does not construct δ
or its top-continuous-cohomology interpretation. -/
/-- The p-adic unit normalization of the supplied determinant-norm character. -/
def ChiCharacter (p : ℕ) [Fact p.Prime] {G : Type*} [Monoid G]
    (δ : G →* ℚ_[p]ˣ) : G →* ℤ_[p]ˣ where
  toFun g := PadicInt.mkUnits (u := ((δ g : ℚ_[p])⁻¹ *
    (p : ℚ_[p]) ^ (δ g : ℚ_[p]).valuation)) (by sorry)
  map_one' := by sorry
  map_mul' := by sorry

/-- χ(mm′)=χ(m)χ(m′) and χ(1)=1. -/
theorem ChiCharacter_mul (p : ℕ) [Fact p.Prime] {G : Type*} [Monoid G]
    (δ : G →* ℚ_[p]ˣ) (g h : G) :
    ChiCharacter p δ (g*h) = ChiCharacter p δ g * ChiCharacter p δ h ∧
      ChiCharacter p δ 1 = 1 := by
  sorry

/-- The normalization has p-adic valuation zero and therefore lies in Z_p×⊂O×. -/
theorem ChiCharacter_unit_value (p : ℕ) [Fact p.Prime] {G : Type*} [Monoid G]
    (δ : G →* ℚ_[p]ˣ) (g : G) :
    ((ChiCharacter p δ g : ℤ_[p]) : ℚ_[p]).valuation = 0 ∧
      ((ChiCharacter p δ g : ℤ_[p]) : ℚ_[p]) =
        (δ g : ℚ_[p])⁻¹ * (p : ℚ_[p]) ^ (δ g : ℚ_[p]).valuation := by
  sorry

-- The compact-Levi restriction has |δ|_p=1. The top-cohomology identification
-- still needs continuous unipotent cochains; this is its unit-character formula.
/-- Its restriction to compact Levi is the inverse determinant on top continuous unipotent cohomology; on the torus it agrees with the appropriate PA.2 orientation character. -/
theorem ChiCharacter_orientation (p : ℕ) [Fact p.Prime] {G : Type*} [Monoid G]
    (δ : G →* ℚ_[p]ˣ) (g : G) (u : ℤ_[p]ˣ)
    (hu : (δ g : ℚ_[p]) = ((u : ℤ_[p]) : ℚ_[p])) :
    ChiCharacter p δ g = u⁻¹ := by
  sorry

-- CrystallineCM.ChiCharacter_test_identity
example (p : ℕ) [Fact p.Prime] :
    ChiCharacter p (MonoidHom.id ℚ_[p]ˣ) 1 = 1 := by
  sorry

-- CrystallineCM.ChiCharacter_test_rank_one_unit
-- δ=det Ad|Lie U=a/d for the GL₂ upper-triangular radical.
example (p : ℕ) [Fact p.Prime] (a d : ℤ_[p]ˣ) :
    ChiCharacter p (Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom)
      (a * d⁻¹) = d * a⁻¹ := by
  sorry

-- CrystallineCM.ChiCharacter_test_uniformizer
example (p : ℕ) [Fact p.Prime] :
    ChiCharacter p (MonoidHom.id ℚ_[p]ˣ)
      (Units.mk0 (p : ℚ_[p]) (by sorry)) = 1 := by
  sorry

/-! ## Layer 4: Q-ordinary automorphic representations and Galois blocks -/


/-! ## Layer 5: The localized completed Siegel boundary -/


/-! ## Layer 6: Degree shifting and nilpotent Hecke comparisons -/

/- The floor/ceiling numerical bound, CN Lemma 4.2.5, p.62. -/
/-- The numerical degree shift retains the floor and ceiling conventions in odd dimension. -/
theorem degree_shift_bound (n D r q : ℕ) (hr : D ≤ 2*r) (hq : n^2*D/2 ≤ q) :
    n^2*D-q ≤ n^2*r := by
  sorry

-- Odd D and odd unitary dimension test the floor, not a mistaken ceiling premise.
example : 3^2*5-22 ≤ 3^2*3 := by
  sorry

/- Integral and torsion Hecke images, CN §4.2.1, p.61.
These definitions take the *actual* algebra action as data. The caller must
supply localized ordinary cohomology and its Hecke action. This algebraic core
does not produce that cohomology or assert a reduction map between the images. -/
section HeckeImages
variable {R H M : Type*} [CommRing R] [CommRing H] [Algebra R H]
  [AddCommGroup M] [Module R M]

/-- The integral Hecke image is the range of the actual supplied action. -/
abbrev HeckeImagesA (action : H →ₐ[R] Module.End R M) :
    Subalgebra R (Module.End R M) := action.range

/-- An endomorphism belongs to A(K,λ,q) iff it is the action of some element of the specified abstract ordinary Hecke algebra. -/
theorem HeckeImagesA_mem (action : H →ₐ[R] Module.End R M)
    (b : Module.End R M) : b ∈ HeckeImagesA action ↔ ∃ h : H, action h = b := by
  exact action.mem_range

/-- A map out of the abstract algebra factors through A iff it kills the annihilator of the displayed localized cohomology. -/
theorem HeckeImagesA_factor (action : H →ₐ[R] Module.End R M)
    {B : Type*} [Semiring B] [Algebra R B] (f : H →ₐ[R] B) :
    (∃! g : HeckeImagesA action →ₐ[R] B, g.comp action.rangeRestrict = f) ↔
      ∀ h : H, action h = 0 → f h = 0 := by
  sorry

-- Tensoring an actual module action supplies the map to the rational image.
-- The cohomology/base-change comparison is a separate arithmetic supplier.
/-- The map to its rational cohomology image is induced by tensoring the actual coefficient complex; injectivity requires the specified middle-degree input and is not unconditional for GL_n. -/
def HeckeImagesA_integral_to_rational (action : H →ₐ[R] Module.End R M)
    (E : Type*) [CommRing E] [Algebra R E] :
    HeckeImagesA action →ₐ[R]
      ((Module.End.baseChangeHom R E M).comp action).range := by
  sorry

/-- The integral image map evaluates on scalar tensors through the original Hecke operator. -/
theorem HeckeImagesA_integral_to_rational_apply
    (action : H →ₐ[R] Module.End R M)
    (E : Type*) [CommRing E] [Algebra R E] (h : H) :
    ((HeckeImagesA_integral_to_rational action E (action.rangeRestrict h)) :
      Module.End E (E ⊗[R] M)) = (action h).baseChange E := by
  sorry

-- An injection M→E⊗M detects an endomorphism from its scalar extension.
-- This hypothesis is supplied arithmetically in generic unitary middle degree;
-- it is not automatic for torsion integral cohomology.
/-- Injectivity follows when the module embeds into its scalar extension. -/
theorem HeckeImagesA_integral_to_rational_injective
    (action : H →ₐ[R] Module.End R M)
    (E : Type*) [CommRing E] [Algebra R E]
    (hinj : Function.Injective (fun x : M => (1 : E) ⊗ₜ[R] x)) :
    Function.Injective (HeckeImagesA_integral_to_rational action E) := by
  sorry

-- CrystallineCM.HeckeImagesA_test_zero_cohomology
example {Z : Type*} [AddCommGroup Z] [Module R Z] [Subsingleton Z]
    (action : H →ₐ[R] Module.End R Z) : Subsingleton (HeckeImagesA action) := by
  infer_instance

-- CrystallineCM.HeckeImagesA_test_scalar_image
-- Evaluate the polynomial Hecke operator on the coefficient line. The faithful
-- scalar action identifies its endomorphism image with this evaluation image.
example (a : R) :
    (Polynomial.aeval a).range = (⊤ : Subalgebra R R) ∧
      RingHom.ker (Polynomial.aeval a).toRingHom =
        Ideal.span {Polynomial.X - Polynomial.C a} := by
  sorry

-- CrystallineCM.HeckeImagesA_test_range
example (action : H →ₐ[R] Module.End R M) :
    HeckeImagesA action = action.range := rfl

/-- The torsion Hecke image is the range of its supplied torsion action. -/
abbrev TorsionHeckeImage {T : Type*} [AddCommGroup T] [Module R T]
    (torsionAction : H →ₐ[R] Module.End R T) :
    Subalgebra R (Module.End R T) := torsionAction.range

/-- b belongs iff b is the specified ordinary Hecke action on H^q(X_K,V_λ/ϖ^m)_m. -/
theorem TorsionHeckeImage_mem {T : Type*} [AddCommGroup T] [Module R T]
    (torsionAction : H →ₐ[R] Module.End R T) (b : Module.End R T) :
    b ∈ TorsionHeckeImage torsionAction ↔ ∃ h : H, torsionAction h = b := by
  exact torsionAction.mem_range

/-- Its tautological action on this module is injective as a map of algebras. -/
theorem TorsionHeckeImage_faithful {T : Type*} [AddCommGroup T] [Module R T]
    (torsionAction : H →ₐ[R] Module.End R T) :
    Function.Injective (TorsionHeckeImage torsionAction).val := by
  exact Subtype.val_injective

/-- An integral Hecke operator and its induced torsion operator agree on the image of H^q(V_λ)→H^q(V_λ/ϖ^m). -/
theorem TorsionHeckeImage_image_reduction {T : Type*}
    [AddCommGroup T] [Module R T]
    (integralAction : H →ₐ[R] Module.End R M)
    (torsionAction : H →ₐ[R] Module.End R T)
    (reduction : M →ₗ[R] T)
    (equivariance : ∀ h x, reduction (integralAction h x) =
      torsionAction h (reduction x)) (h : H) (y : T)
    (hy : y ∈ LinearMap.range reduction) :
    ∃ x : M, reduction x = y ∧
      reduction (integralAction h x) = torsionAction h y := by
  sorry

-- CrystallineCM.TorsionHeckeImage_test_zero
example {Z : Type*} [AddCommGroup Z] [Module R Z] [Subsingleton Z]
    (torsionAction : H →ₐ[R] Module.End R Z) :
    Subsingleton (TorsionHeckeImage torsionAction) := by
  infer_instance

-- CrystallineCM.TorsionHeckeImage_test_scalar_mod
-- The scalar endomorphisms of R/I identify the scalar image with R/I, not R.
example (I : Ideal R) : Function.Surjective (Ideal.Quotient.mk I) ∧
    RingHom.ker (Ideal.Quotient.mk I) = I := by
  sorry

-- CrystallineCM.TorsionHeckeImage_test_new_torsion
-- C=[ℤ₃ --3--> ℤ₃] in degrees 0,1 has H⁰=0, whereas its mod-3 H⁰
-- is ℤ/3. Use the actual degree-zero kernels and their scalar actions.
-- There is no unital algebra map at all from the zero integral image to
-- the nonzero torsion image, even though the coefficient actions intertwine.
example :
    letI : Algebra ℤ_[3] (ZMod 3) := (PadicInt.toZMod (p := 3)).toAlgebra
    let integralH0 := LinearMap.ker (LinearMap.lsmul ℤ_[3] ℤ_[3] (3 : ℤ_[3]))
    let torsionH0 := LinearMap.ker (LinearMap.lsmul (ZMod 3) (ZMod 3) (3 : ZMod 3))
    let integralAction := Algebra.ofId ℤ_[3] (Module.End ℤ_[3] integralH0)
    let torsionAction := Algebra.ofId ℤ_[3] (Module.End ℤ_[3] torsionH0)
    integralH0 = ⊥ ∧ torsionH0 = ⊤ ∧
      Subsingleton (HeckeImagesA integralAction) ∧
      Nontrivial (TorsionHeckeImage torsionAction) ∧
      ¬ Nonempty (HeckeImagesA integralAction →ₐ[ℤ_[3]]
        TorsionHeckeImage torsionAction) := by
  sorry
end HeckeImages

/- CN §4.2.1, pp.61,65; Propositions 4.2.2,4.2.4,4.2.11.
The integral, torsion and dual-coefficient modules are actual supplied modules,
with their actual localized Hecke actions. Their ranges are defined here;
their arithmetic construction is a supplier interface. In particular,
H^q(V^dual) is not identified with the linear dual of H^q(V) over O.
The perfect pairing below applies only where the appropriate shifted
Poincaré comparison supplies it. No cohomological degree is suppressed.
-/
section MiddleAndDualImages
variable {R H M : Type*} [CommRing R] [CommRing H] [Algebra R H]
  [AddCommGroup M] [Module R M]

/-- The unitary middle-degree image is the range of its supplied action. -/
abbrev UnitaryMiddleHeckeImage (middleAction : H →ₐ[R] Module.End R M) :
    Subalgebra R (Module.End R M) := HeckeImagesA middleAction

/-- b∈Ã iff it is an ordinary abstract Hecke action on the indicated integral unitary H^d. -/
theorem UnitaryMiddleHeckeImage_mem (middleAction : H →ₐ[R] Module.End R M)
    (b : Module.End R M) :
    b ∈ UnitaryMiddleHeckeImage middleAction ↔ ∃ h, middleAction h = b := by
  exact middleAction.mem_range

/-- Under the decomposed-generic middle-degree injection, the natural map Ã→Ã[1/p] is injective. -/
theorem UnitaryMiddleHeckeImage_rational_injective
    (middleAction : H →ₐ[R] Module.End R M)
    (E : Type*) [Field E] [Algebra R E]
    (hinj : Function.Injective (fun x : M => (1 : E) ⊗ₜ[R] x)) :
    Function.Injective (HeckeImagesA_integral_to_rational middleAction E) := by
  exact HeckeImagesA_integral_to_rational_injective middleAction E hinj

-- operators must list *all* the rescaled partial-block operators. This statement
-- only evaluates a supplied character; CL.7 provides its cuspidal realization.
/-- A characteristic-zero algebra character is evaluated on all rescaled partial operators, not only Ũ_n. -/
theorem UnitaryMiddleHeckeImage_character
    (middleAction : H →ₐ[R] Module.End R M)
    {E : Type*} [Field E] [Algebra R E] {ι : Type*}
    (operators : ι → H) (χ : UnitaryMiddleHeckeImage middleAction →ₐ[R] E) :
    ∀ i, (χ.comp middleAction.rangeRestrict) (operators i) =
      χ (middleAction.rangeRestrict (operators i)) := by
  intro i
  rfl

-- CrystallineCM.UnitaryMiddleHeckeImage_test_zero
example {Z : Type*} [AddCommGroup Z] [Module R Z] [Subsingleton Z]
    (middleAction : H →ₐ[R] Module.End R Z) :
    Subsingleton (UnitaryMiddleHeckeImage middleAction) := by
  infer_instance

-- CrystallineCM.UnitaryMiddleHeckeImage_test_torsion_free
-- Ambient genericity supplies hinj, rather than being assumed of every image.
example (middleAction : H →ₐ[R] Module.End R M)
    (E : Type*) [Field E] [Algebra R E]
    (hinj : Function.Injective (fun x : M => (1 : E) ⊗ₜ[R] x))
    (r : R) (hr : algebraMap R E r ≠ 0)
    (b : UnitaryMiddleHeckeImage middleAction) :
    r • (b : Module.End R M) = 0 → b = 0 := by
  sorry

-- Supplementary discriminator: equal Siegel values do not determine a
-- character on all partial operators. Both displayed partial values are units.
-- Cuspidal matching also requires the automorphic realization of Layer 7.
example :
    let action := Algebra.lmul ℚ (ℚ × ℚ)
    ∃ χ₁ χ₂ : UnitaryMiddleHeckeImage action →ₐ[ℚ] ℚ,
      χ₁ (action.rangeRestrict (1,1)) = 1 ∧
      χ₂ (action.rangeRestrict (1,1)) = 1 ∧
      χ₁ (action.rangeRestrict (1,2)) = 1 ∧
      χ₂ (action.rangeRestrict (1,2)) = 2 := by
  sorry

-- Use this same range construction separately for the integral, mod-varpi^m
-- and unitary-middle actions on their respective dual-coefficient cohomology.
-- The action argument already includes the inversion involution and ideal.
/-- The dual-coefficient image uses its own supplied action on the coefficient cohomology. -/
abbrev HeckeImagesDual (dualAction : H →ₐ[R] Module.End R M) :
    Subalgebra R (Module.End R M) := dualAction.range

/-- A^∨ uses the inverse-coset action on H^q(X_K,V_λ^∨)_{m^∨}, with the integral and mod-ϖ^m variants distinguished. -/
theorem HeckeImagesDual_coefficient (dualAction : H →ₐ[R] Module.End R M) :
    HeckeImagesDual dualAction = dualAction.range := rfl

-- Descend the actual adjoint actions to their faithful images. The supplied
-- perfect pairing need not be an integral arithmetic Poincaré pairing: this
-- signature also applies after inverting p, where the source uses it.
-- Pairing equivariance is a hypothesis on the abstract operators; the result
-- constructs the induced image-algebra isomorphism and its generator formula.
/-- Poincaré pairing identifies dual Hecke operators with the involution g↦g^{-1}. -/
theorem HeckeImagesDual_adjoint
    (action : H →ₐ[R] Module.End R M)
    {N : Type*} [AddCommGroup N] [Module R N]
    (dualAction : H →ₐ[R] Module.End R N) (ι : H ≃ₐ[R] H)
    (hι : Function.Involutive ι)
    (pairing : N ≃ₗ[R] Module.Dual R M)
    (hseparates : Function.Injective (Module.Dual.eval R M))
    (hadjoint : ∀ h y x,
      pairing (dualAction (ι h) y) x = pairing y (action h x)) :
    ∃ e : HeckeImagesA action ≃ₐ[R] HeckeImagesDual dualAction,
      ∀ h, e (action.rangeRestrict h) = dualAction.rangeRestrict (ι h) := by
  sorry

/-- Ã^∨ is the image on unitary middle-degree dual POrd, localized at S^*(m^∨). -/
theorem HeckeImagesDual_unitary (dualMiddleAction : H →ₐ[R] Module.End R M) :
    HeckeImagesDual dualMiddleAction = UnitaryMiddleHeckeImage dualMiddleAction := rfl

-- CrystallineCM.HeckeImagesDual_test_zero_cohomology
example {Z : Type*} [AddCommGroup Z] [Module R Z] [Subsingleton Z]
    (dualAction : H →ₐ[R] Module.End R Z) :
    Subsingleton (HeckeImagesDual dualAction) := by
  infer_instance

-- CrystallineCM.HeckeImagesDual_test_scalar_inverse
-- Use Mathlib's actual coefficient dual, including the inverse group element.
example (a : Rˣ) (φ : Module.Dual R R) (x : R) :
    let ρ : Representation R Rˣ R := {
      toFun := fun u => LinearMap.lsmul R R (u : R)
      map_one' := by sorry
      map_mul' := by sorry }
    ρ.dual a φ x = (↑(a⁻¹) : R) * φ x := by
  sorry

-- CrystallineCM.HeckeImagesDual_test_involution
-- Evaluation gives the double-dual compatibility without claiming that every
-- torsion module is reflexive. The maximal ideal is transported by comap.
example {G : Type*} [Group G] (ρ : Representation R G M) (g : G)
    (ι : H ≃ₐ[R] H) (hι : Function.Involutive ι) (m : Ideal H) :
    ρ.dual.dual g ∘ₗ Module.Dual.eval R M =
      Module.Dual.eval R M ∘ₗ ρ g ∧
    Ideal.comap ι.toRingHom (Ideal.comap ι.toRingHom m) = m := by
  sorry

-- A supplementary integral counterexample: the R-linear dual of a torsion
-- cohomology module can vanish. Thus H^q(V^dual) must come from the actual
-- dual-coefficient complex, not an unshifted Hom_R(H^q(V),R) substitute.
example : Subsingleton (Module.Dual ℤ (ZMod 3)) ∧
    ¬ Subsingleton (ZMod 3) := by
  sorry
end MiddleAndDualImages

/- Deep Levi and unitary levels, CN §4.2.1, pp.61–62.
The ambient group can be the adelic group. Integral component maps are defined
on K, not on the entire adelic group. R v is its actual local integer ring.
The arithmetic application supplies these maps and their split-place dictionary;
the construction below imposes exactly the displayed congruences.
-/
section DeepLevels

variable {G : Type*} [Group G] {ι κ : Type*}
variable {R : ι → Type*} [∀ v, CommRing (R v)]
variable (n : ℕ) (K : Subgroup G)

/-- Deep Levi congruences on the selected integral components of the given level. -/
def DeepLeviLevel
    (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin n) (R v))
    (below : ι → κ) (S : Set κ) (π : ∀ v, R v) (e : ℕ) : Subgroup G :=
  (⨅ v, ⨅ (_ : below v ∈ S),
    ((Matrix.GeneralLinearGroup.map
      (Ideal.Quotient.mk ((Ideal.span {π v}) ^ e))).ker.comap
        (component v))).map K.subtype

/-- g∈K(e,S̄) iff g∈K and every selected p-component is identity modulo its local ϖ_v^e. -/
theorem DeepLeviLevel_mem
    (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin n) (R v))
    (below : ι → κ) (S : Set κ) (π : ∀ v, R v) (e : ℕ) (g : G) :
    g ∈ DeepLeviLevel n K component below S π e ↔
      ∃ hg : g ∈ K, ∀ v, below v ∈ S → ∀ i j : Fin n,
        component v ⟨g, hg⟩ i j - (if i = j then 1 else 0) ∈
          (Ideal.span {π v}) ^ e := by
  sorry

/-- e′≥e implies K(e′,S̄)⊂K(e,S̄). -/
theorem DeepLeviLevel_antitone
    (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin n) (R v))
    (below : ι → κ) (S : Set κ) (π : ∀ v, R v)
    (e e' : ℕ) (he : e ≤ e') :
    DeepLeviLevel n K component below S π e' ≤
      DeepLeviLevel n K component below S π e := by
  sorry

/-- K(e,∅)=K. -/
theorem DeepLeviLevel_empty
    (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin n) (R v))
    (below : ι → κ) (π : ∀ v, R v) (e : ℕ) :
    DeepLeviLevel n K component below ∅ π e = K := by
  sorry

-- CrystallineCM.DeepLeviLevel_test_empty
example (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin n) (R v))
    (below : ι → κ) (π : ∀ v, R v) (e : ℕ) :
    DeepLeviLevel n K component below ∅ π e = K := by
  sorry

-- CrystallineCM.DeepLeviLevel_test_scalar
-- Bool labels the two conjugate places over one selected place of F⁺.
example (p : ℕ) [Fact p.Prime] (e : ℕ) (he : 1 ≤ e)
    (g : Bool → Matrix.GeneralLinearGroup (Fin 1) ℤ_[p]) :
    let component : ∀ _ : Bool,
        (⊤ : Subgroup (Bool → Matrix.GeneralLinearGroup (Fin 1) ℤ_[p])) →*
          Matrix.GeneralLinearGroup (Fin 1) ℤ_[p] :=
      fun v => { toFun := fun h => h.val v, map_one' := rfl, map_mul' := by intros; rfl }
    g ∈ DeepLeviLevel 1 ⊤ component (fun _ => ((): Unit))
      Set.univ (fun _ => (p : ℤ_[p])) e ↔
      ∀ v, ∃ a : ℤ_[p], g v 0 0 = 1 + (p : ℤ_[p]) ^ e * a := by
  sorry

-- CrystallineCM.DeepLeviLevel_test_local_uniformizer
-- In a ramified integral local domain with π²=p, 1+π has local depth 1
-- and fails depth 1 measured using p. No artificial local-field carrier is used.
example (p : ℕ) [Fact p.Prime] {A : Type*} [CommRing A] [IsDomain A]
    [IsLocalRing A] [CharZero A] (π : A) (hπ : π ≠ 0)
    (hmax : π ∈ IsLocalRing.maximalIdeal A) (hram : (p : A) = π ^ 2) :
    let component : ∀ _ : Unit,
        (⊤ : Subgroup (Matrix.GeneralLinearGroup (Fin 1) A)) →*
          Matrix.GeneralLinearGroup (Fin 1) A := fun _ => (⊤ : Subgroup _).subtype
    ∃ u : Aˣ, (u : A) = 1 + π ∧
      Matrix.GeneralLinearGroup.scalar (Fin 1) u ∈
        DeepLeviLevel 1 ⊤ component id Set.univ (fun _ => π) 1 ∧
      Matrix.GeneralLinearGroup.scalar (Fin 1) u ∉
        DeepLeviLevel 1 ⊤ component id Set.univ (fun _ => (p : A)) 1 := by
  sorry

/-- Deep unitary block congruences at the selected split places. -/
def DeepUnitaryLevel
    (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin (n+n)) (R v))
    (S : Set ι) (π : ∀ v, R v) (e : ℕ) : Subgroup G :=
  (⨅ v, ⨅ (_ : v ∈ S),
    (ParahoricPVBC n e e (π v) le_rfl).comap (component v)).map K.subtype

/-- A selected component lies in K̃(e,S̄) iff it lies in the original K̃ and its diagonal blocks reduce to identity and its lower-left block to zero modulo ϖ_ṽ^e. -/
theorem DeepUnitaryLevel_mem
    (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin (n+n)) (R v))
    (S : Set ι) (π : ∀ v, R v) (e : ℕ) (g : G) :
    g ∈ DeepUnitaryLevel n K component S π e ↔
      ∃ hg : g ∈ K, ∀ v, v ∈ S → ∀ i j : Fin n,
        component v ⟨g, hg⟩ (Fin.natAdd n i) (Fin.castAdd n j) ∈
            (Ideal.span {π v}) ^ e ∧
          component v ⟨g, hg⟩ (Fin.castAdd n i) (Fin.castAdd n j) -
            (if i = j then 1 else 0) ∈ (Ideal.span {π v}) ^ e ∧
          component v ⟨g, hg⟩ (Fin.natAdd n i) (Fin.natAdd n j) -
            (if i = j then 1 else 0) ∈ (Ideal.span {π v}) ^ e := by
  sorry

/-- U(O_{F⁺_{v̄}})⊂K̃(e,S̄) whenever it was contained in K̃. -/
theorem DeepUnitaryLevel_unipotent
    (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin (n+n)) (R v))
    (S : Set ι) (π : ∀ v, R v) (e : ℕ) (g : K)
    (hu : ∀ v, v ∈ S → ∀ i j : Fin n,
      component v g (Fin.natAdd n i) (Fin.castAdd n j) = 0 ∧
        component v g (Fin.castAdd n i) (Fin.castAdd n j) =
          (if i = j then 1 else 0) ∧
        component v g (Fin.natAdd n i) (Fin.natAdd n j) =
          (if i = j then 1 else 0)) :
    g.val ∈ DeepUnitaryLevel n K component S π e := by
  sorry

/-- K̃(e,∅)=K̃. -/
theorem DeepUnitaryLevel_empty
    (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin (n+n)) (R v))
    (π : ∀ v, R v) (e : ℕ) :
    DeepUnitaryLevel n K component ∅ π e = K := by
  sorry

-- CrystallineCM.DeepUnitaryLevel_test_empty
example (component : ∀ v, K →* Matrix.GeneralLinearGroup (Fin (n+n)) (R v))
    (π : ∀ v, R v) (e : ℕ) :
    DeepUnitaryLevel n K component ∅ π e = K := by
  sorry

-- CrystallineCM.DeepUnitaryLevel_test_upper_unipotent
example {A : Type*} [CommRing A] (π : A) (e : ℕ)
    (K : Subgroup (Matrix.GeneralLinearGroup (Fin (1+1)) A)) :
    let u := Matrix.GeneralLinearGroup.mk'' (!![(1 : A),1;0,1]) (by sorry)
    let component : ∀ _ : Unit, K →*
        Matrix.GeneralLinearGroup (Fin (1+1)) A := fun _ => K.subtype
    u ∈ K → u ∈ DeepUnitaryLevel 1 K component Set.univ (fun _ => π) e := by
  sorry

-- CrystallineCM.DeepUnitaryLevel_test_not_principal
example :
    let u := Matrix.GeneralLinearGroup.mkOfDetNeZero
      (!![(1 : ZMod 3),1;0,1]) (by decide)
    let component : ∀ _ : Unit,
        (⊤ : Subgroup (Matrix.GeneralLinearGroup (Fin (1+1)) (ZMod 3))) →*
          Matrix.GeneralLinearGroup (Fin (1+1)) (ZMod 3) :=
      fun _ => (⊤ : Subgroup _).subtype
    u ∈ DeepUnitaryLevel 1 ⊤ component Set.univ (fun _ => (0 : ZMod 3)) 1 ∧
      u ∉ DeepLeviLevel (1+1) ⊤ component id Set.univ (fun _ => (0 : ZMod 3)) 1 := by
  sorry

end DeepLevels

/-! ## Layer 7: Crystalline local–global compatibility -/


/-! ## Layer 8: Two-component patching and PGL₂ cohomology -/


/-! ## Layer 9: Barsotti–Tate automorphy lifting and solvable descent -/

/- The determinant-kernel criterion of CN Lemma 5.6.5, pp.85–86,
with the cubic tetrahedral exception retained.
Private notation expresses the projective image as the range of conjugation on
GL₂(K). Its kernel is the scalar subgroup of GL₂(K), so it is precisely the
projective matrix image; it is not the quotient by the centre of ρ(G).
The latter quotient would wrongly kill an abelian nonscalar projective image.
No absolute-Galois-group or Dickson-classification carrier is needed to *state*
this theorem. Its proof still uses the supplier's classification. -/
private abbrev projectiveMatrixImage {K G : Type*} [Field K] [Group G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) :=
  (MulAut.conj.comp ρ).range

private def determinantKernelHasLine {K G : Type*} [Field K] [Group G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) : Prop :=
  ∃ W : Submodule K (Fin 2 → K), Module.finrank K W = 1 ∧
    ∀ g : G, Matrix.GeneralLinearGroup.det (ρ g) = 1 →
      ∀ v ∈ W, (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec v ∈ W

/-- The trace-square hypothesis gives a determinant-kernel line, except in the cubic tetrahedral case. -/
theorem determinant_kernel_reducible_except_tetrahedral
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {K G : Type*}
    [Field K] [IsAlgClosed K] [CharP K p] [Group G] [Finite G]
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K)
    (hd : 1 < Nat.card (Matrix.GeneralLinearGroup.det.comp ρ).range)
    (htrace : ∀ g : G, Matrix.GeneralLinearGroup.det (ρ g) ≠ 1 →
      Matrix.trace (ρ g : Matrix (Fin 2) (Fin 2) K) ^ 2 =
        (1 + (Matrix.GeneralLinearGroup.det (ρ g) : K)) ^ 2) :
    determinantKernelHasLine ρ ∨
      (Nat.card (Matrix.GeneralLinearGroup.det.comp ρ).range = 3 ∧
        Nonempty (projectiveMatrixImage ρ ≃* alternatingGroup (Fin 4)) ∧
        ¬ determinantKernelHasLine ρ ∧
        Nonempty (projectiveMatrixImage
          (ρ.comp (Matrix.GeneralLinearGroup.det.comp ρ).ker.subtype) ≃*
            Multiplicative (ZMod 2 × ZMod 2))) := by
  sorry

-- Concrete anticommuting quaternion generators from the F₇ exception.
-- This finite calculation checks the exceptional source scope independently of
-- the unproved classification theorem above.
private def quaternionI : Matrix (Fin 2) (Fin 2) (ZMod 7) := !![0,1;-1,0]
private def quaternionJ : Matrix (Fin 2) (Fin 2) (ZMod 7) := !![2,3;3,-2]

example : quaternionI * quaternionI = -1 ∧
    quaternionJ * quaternionJ = -1 ∧
    quaternionI * quaternionJ = -(quaternionJ * quaternionI) := by
  decide

-- Over any algebraically closed odd-characteristic extension of F₇ the two
-- generators have no common invariant line: eigenvalues on such a line would
-- be nonzero and would have to both commute and anticommute.
example {K : Type*} [Field K] [CharP K 7] :
    ¬ ∃ v : Fin 2 → K, v ≠ 0 ∧ ∃ a b : K,
      (!![0,1;-1,0] : Matrix (Fin 2) (Fin 2) K).mulVec v = a • v ∧
      (!![2,3;3,-2] : Matrix (Fin 2) (Fin 2) K).mulVec v = b • v := by
  sorry


/- Prepared PGL₂ level components, CN Proposition 5.6.1, pp.82–83.
These component formulas use the supplied integral local groups and their actual
Iwahori/pro-v Iwahori subgroups. They do not construct those groups, prove
neatness, select a residual Hecke ideal, or construct the arithmetic complex.
The product is the subgroup of the product of integral local groups; it is not
a substitute for an unrestricted product of local-field adelic groups. -/
section PreparedLevelComponents
variable {Places : Type*} {G : Places → Type*} [∀ v, Group (G v)]

private def preparedLevelComponent (S cr st ramified : Set Places)
    (Iw proIw : ∀ v, Subgroup (G v)) (v : Places) : Subgroup (G v) := by
  classical
  exact if v ∉ S ∨ v ∈ cr then ⊤
    else if v ∈ ramified ∨ v ∈ st then Iw v else proIw v

private def preparedLevelProduct (S cr st ramified : Set Places)
    (Iw proIw : ∀ v, Subgroup (G v)) : Subgroup (∀ v, G v) :=
  Subgroup.pi Set.univ (preparedLevelComponent S cr st ramified Iw proIw)

/-- Membership is componentwise membership in the specified maximal, Iwahori or pro-v Iwahori subgroup; the auxiliary level is preserved. -/
theorem PreparedPGL2Level_level_components (S cr st ramified : Set Places)
    (Iw proIw : ∀ v, Subgroup (G v)) (g : ∀ v, G v) :
    g ∈ preparedLevelProduct S cr st ramified Iw proIw ↔
      ∀ v, g v ∈ preparedLevelComponent S cr st ramified Iw proIw v := by
  sorry

-- CrystallineCM.PreparedPGL2Level_test_auxiliary_level
-- S_p is partitioned into cr and st. These are the component hypotheses of
-- v ∈ S − (S_p ∪ R). The selected subgroup is proIw, preserving the auxiliary
-- component rather than replacing it by the entire integral local group.
example (S cr st ramified : Set Places) (Iw proIw : ∀ v, Subgroup (G v))
    (v : Places) (hvS : v ∈ S) (hvcr : v ∉ cr) (hvst : v ∉ st)
    (hvR : v ∉ ramified) :
    preparedLevelComponent S cr st ramified Iw proIw v = proIw v := by
  sorry

-- A supplied proper pro-v Iwahori stays proper at that auxiliary component.
example (S cr st ramified : Set Places) (Iw proIw : ∀ v, Subgroup (G v))
    (v : Places) (hvS : v ∈ S) (hvcr : v ∉ cr) (hvst : v ∉ st)
    (hvR : v ∉ ramified) (hproper : proIw v ≠ ⊤) :
    preparedLevelComponent S cr st ramified Iw proIw v ≠ ⊤ := by
  sorry

end PreparedLevelComponents

/- In the split-place dictionary the conjugate place is in the first block and
selected place in the second. The choice policy is stc → st: a sole ordinary
place must be selected, before specifying the partition. Only the three
oriented cases occur. These formulas do not construct a unitary parabolic. -/
private def preparedUnitaryPartition (st stc : Bool) : List ℕ :=
  if st then if stc then [1,1,1,1] else [2,1,1] else [2,2]

/-- The chosen lift ṽ and the cr/st flags determine exactly the displayed three partitions; a lone st branch is placed second in the split Levi dictionary. -/
theorem PreparedPGL2Level_unitary_partitions (st stc : Bool)
    (horient : stc = true → st = true) :
    (st = true → stc = false → preparedUnitaryPartition st stc = [2,1,1]) ∧
    (st = true → stc = true → preparedUnitaryPartition st stc = [1,1,1,1]) ∧
    (st = false → preparedUnitaryPartition st stc = [2,2] ∧ stc = false) ∧
    (preparedUnitaryPartition st stc).sum = 4 := by
  sorry

-- CrystallineCM.PreparedPGL2Level_test_mixed_orientation
example : preparedUnitaryPartition true false = [2,1,1] ∧
    (preparedUnitaryPartition true false).drop 1 = [1,1] ∧
    ¬ (true = true → false = true) := by
  sorry

-- CrystallineCM.PreparedPGL2Level_test_three_branches
example : preparedUnitaryPartition true true = [1,1,1,1] ∧
    preparedUnitaryPartition false false = [2,2] ∧
    preparedUnitaryPartition true false = [2,1,1] := by
  sorry

end CrystallineCM
end TauCetiRoadmap.CrystallineLocalGlobalCompatibilityCM

/-
Arithmetic targets with supplier-dependent carriers are specified in README.md:
POrdinaryFiniteLevel, OrdinaryMonoidLocalization, POrdinaryFunctors,
POrdinaryCompleted, ParahoricVariant, DualPOrdinary, InductionFiltrationFunctors,
BruhatStratumInduction, BruhatOpenCellInduction, QOrdinaryHecke,
QOrdinaryLocalSubspace, IotaQOrdinary, BoundaryCoefficientObject,
OrdHeckeAlgebras42, Pgl2Cohomology, TwoSystemPatchingData, Setup56,
DeformationProblemsSChi and TaylorWilesDeformationProblem, together with the
crystalline local–global and qualified Barsotti–Tate lifting theorems.
-/
