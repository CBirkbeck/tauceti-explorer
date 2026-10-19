/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These signatures suggest names and Lean forms so contributors and reviewers can converge.
These are milestones on existing library carriers and light real-bodied
predicates/functions, with a few examples. No implementation is claimed.
RAM programs, algebraic/p-adic certificates, search procedures, order/basis
certificates, integral Hecke matrices and certified enclosures remain README
targets with their full API/tests; their new carriers and algorithms are not
introduced as admitted data here. CN.5's generic certificate schema is also a
README target. The finite-field algorithms have their single owner in FF.3.
-/
import Mathlib.NumberTheory.ModularForms.LFunction
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Analysis.SpecialFunctions.Gamma.Digamma
import Mathlib.FieldTheory.AlgebraicClosure
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Data.Nat.Factors
import Mathlib.NumberTheory.LucasPrimality
import Mathlib.NumberTheory.CarmichaelNumber
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Padics.Hensel
import Mathlib.NumberTheory.NumberField.Units.Regulator
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.NumberTheory.ModularForms.LevelOne.DimensionFormula

noncomputable section
namespace TauCeti.Computational
open scoped BigOperators MatrixGroups
open Polynomial Module UpperHalfPlane ModularForm


/- ComputationalNumberTheory:CN.0/ram-operand-evaluation -/
def ramRead (m : ℕ → ℤ) : (ℤ ⊕ (Bool × ℕ)) → Option ℤ
 | .inl z => some z
 | .inr (false,i) => some (m i)
 | .inr (true,i) => if 0 ≤ m i then some (m (m i).toNat) else none
theorem ramRead_literal (m : ℕ → ℤ) (z : ℤ) : ramRead m (.inl z)=some z := by sorry
theorem ramRead_direct (m : ℕ → ℤ) (i : ℕ) : ramRead m (.inr (false,i))=some (m i) := by sorry
theorem ramRead_indirect (m : ℕ → ℤ) (i : ℕ) : ramRead m (.inr (true,i)) = if 0 ≤ m i then some (m (m i).toNat) else none := by sorry
-- TauCeti.Computational.test_ram_literal_negative
example : ramRead (fun _ => 0) (.inl (-3))=some (-3) := by sorry
-- TauCeti.Computational.test_ram_zero_memory
example : ramRead (fun _ => 0) (.inr (true,0))=some 0 := by sorry
-- TauCeti.Computational.test_ram_negative_address
example : ramRead (fun _ => -1) (.inr (true,0))=none := by sorry

/- ComputationalNumberTheory:CN.1/strong-liar -/
def StrongLiar (n a : ℕ) : Prop :=
 let h := (n-1).factorization 2
 let t := (n-1)/2^h
 1 < n ∧ Odd n ∧ 0 < a ∧ a < n ∧
 ((a:ZMod n)^t=1 ∨ ∃ j < h, (a:ZMod n)^(t*2^j) = -1)
theorem strongLiar_iff (n a : ℕ) : StrongLiar n a ↔
 1 < n ∧ Odd n ∧ 0 < a ∧ a < n ∧
 ((a:ZMod n)^((n-1)/2^((n-1).factorization 2))=1 ∨
 ∃ j < (n-1).factorization 2, (a:ZMod n)^(((n-1)/2^((n-1).factorization 2))*2^j) = -1) := by sorry
theorem strongLiar_coprime {n a : ℕ} (h : StrongLiar n a) : Nat.Coprime a n := by sorry
theorem strongLiar_one (n : ℕ) (hn : 1 < n) (ho : Odd n) : StrongLiar n 1 := by sorry
-- TauCeti.Computational.test_strongLiar_prime
example : StrongLiar 7 3 := by sorry
-- TauCeti.Computational.test_strongLiar_one_input
example : ¬StrongLiar 1 0 := by sorry
-- TauCeti.Computational.test_strongLiar_composite
example : StrongLiar 2047 2 ∧ ¬Nat.Prime 2047 := by sorry

/- ComputationalNumberTheory:CN.1/strong-liar-prime -/
theorem strongLiar_of_prime (n a : ℕ) (hp : Nat.Prime n) (ho : Odd n) (ha : 0 < a) (han : a < n) : StrongLiar n a := by sorry

/- ComputationalNumberTheory:CN.1/miller-rabin-probabilistic-primality -/
theorem strongLiar_card_le (n : ℕ) (hn : 1 < n) (ho : Odd n) (hc : ¬Nat.Prime n) :
 4 * Nat.card {a : Fin n // StrongLiar n a.val}  ≤  n-1 := by sorry

/- ComputationalNumberTheory:CN.1/miller-rabin-independent-rounds -/
theorem millerRabin_rounds_bound (n k : ℕ) (hn : 1 < n) (ho : Odd n) (hc : ¬Nat.Prime n) :
 4^k * Nat.card {a : Fin k → Fin (n-1) // ∀ i, StrongLiar n ((a i).val+1)}  ≤  (n-1)^k := by sorry

/- ComputationalNumberTheory:CN.1/aks-polynomial-identities -/
def AKSIdentities (n r ell : ℕ) : Prop := ∀ j : ℕ, 1 ≤ j → j ≤ ell →
 ((X+C (j:ZMod n))^n) %ₘ (X^r-1) = (X^n+C (j:ZMod n)) %ₘ (X^r-1)
theorem aksIdentities_zero (n r : ℕ) : AKSIdentities n r 0 := by sorry
theorem aksIdentities_mono (n r ell m : ℕ) (h : m ≤ ell) : AKSIdentities n r ell → AKSIdentities n r m := by sorry
theorem aksIdentities_iff (n r ell : ℕ) : AKSIdentities n r ell ↔ ∀ j : ℕ, 1 ≤ j → j ≤ ell →
 ((X+C (j:ZMod n))^n) %ₘ (X^r-1) = (X^n+C (j:ZMod n)) %ₘ (X^r-1) := by sorry
-- TauCeti.Computational.test_aksIdentities_prime
example (r ell : ℕ) : AKSIdentities 5 r ell := by sorry
-- TauCeti.Computational.test_aksIdentities_vacuous
example : AKSIdentities 9 3 0 := by sorry
-- TauCeti.Computational.test_aksIdentities_not_prime
example : AKSIdentities 9 3 0 ∧ ¬Nat.Prime 9 := by sorry

/- ComputationalNumberTheory:CN.1/pocklington-prime-divisor -/
theorem pocklington_prime_divisor (n F : ℕ) (hn : 1 < n) (hF : 1 < F) (hdiv : F∣n-1)
 (hw : ∀ q : ℕ, Nat.Prime q → q∣F → ∃ a : ℤ,
  (a:ZMod n)^(n-1)=1 ∧ Int.gcd (a^((n-1)/q)-1) (n:ℤ)=1)
 (p : ℕ) (hp : Nat.Prime p) (hpn : p∣n) : F∣p-1 := by sorry

/- ComputationalNumberTheory:CN.1/pocklington-primality -/
theorem pocklington_prime (n F : ℕ) (hn : 1 < n) (hF : 1 < F) (hdiv : F∣n-1)
 (hlarge : n < F^2) (hw : ∀ q : ℕ, Nat.Prime q → q∣F → ∃ a : ℤ,
  (a:ZMod n)^(n-1)=1 ∧ Int.gcd (a^((n-1)/q)-1) (n:ℤ)=1) : Nat.Prime n := by sorry

/- ComputationalNumberTheory:CN.1/polynomial-factorization-over-finite-fields -/
-- FF.3 supplies factorization discovery, checking and soundness/completeness.
-- FF.0 supplies coefficient presentations. This is only transport along their
-- chosen ring equivalence: repetitions preserve multiplicities; constants have
-- an empty list; zero has a separate result. CN.0 owns costs and randomness.
theorem transport_finite_factorization {F K : Type*} [Field F] [Field K] [Finite F] [Finite K]
 (e : F ≃+* K) (f : Polynomial F) (hf : f≠0) (c : F) (hc : c≠0) (gs : List (Polynomial F))
 (hg : ∀ g∈gs, g.Monic ∧ Irreducible g) (hprod : f=C c*gs.prod) :
 f.map e.toRingHom=C (e c)*(gs.map (fun g => g.map e.toRingHom)).prod ∧
 ∀ g∈gs, (g.map e.toRingHom).Monic ∧ Irreducible (g.map e.toRingHom) := by sorry

-- Empty factor list for a nonzero constant.
example {F K : Type*} [Field F] [Field K] (e : F ≃+* K) (c : F) :
 (C c : Polynomial F).map e.toRingHom = C (e c) := by sorry
-- Repeated factors remain repeated under a presentation change.
example {F K : Type*} [Field F] [Field K] (e : F ≃+* K) :
 ((X - 1)^2 : Polynomial F).map e.toRingHom = (X - 1 : Polynomial K)^2 := by sorry
-- Zero cannot be represented by a nonzero scalar times monic factors.
example {F : Type*} [Field F] (c : F) (hc : c ≠ 0)
 (gs : List (Polynomial F)) (hg : ∀ g ∈ gs, g.Monic) :
 (0 : Polynomial F) ≠ C c * gs.prod := by sorry

/- ComputationalNumberTheory:CN.2/p-maximal-order -/
def IsPMaximal {K : Type*} [Field K] [CharZero K] (R : Subalgebra ℤ K) (p : ℕ) : Prop :=
 ∀ x : K, IsIntegral ℤ x → ∃ a : ℤ, ¬(p:ℤ) ∣ a ∧ (a:K)*x∈R
theorem isPMaximal_iff {K : Type*} [Field K] [CharZero K] (R : Subalgebra ℤ K) (p : ℕ) :
 IsPMaximal R p ↔ ∀ x : K, IsIntegral ℤ x → ∃ a : ℤ, ¬(p:ℤ) ∣ a ∧ (a:K)*x∈R := by sorry
theorem isPMaximal_mono {K : Type*} [Field K] [CharZero K] {R S : Subalgebra ℤ K} (p : ℕ) (h : R ≤ S) : IsPMaximal R p → IsPMaximal S p := by sorry
theorem isPMaximal_top {K : Type*} [Field K] [CharZero K] (p : ℕ) (hp : Nat.Prime p) : IsPMaximal (⊤ : Subalgebra ℤ K) p := by sorry
-- TauCeti.Computational.test_pMaximal_Z
example (p : ℕ) (hp : Nat.Prime p) : IsPMaximal (⊥ : Subalgebra ℤ ℚ) p := by sorry
-- TauCeti.Computational.test_pMaximal_one
example (R : Subalgebra ℤ ℚ) : ¬IsPMaximal R 1 := by sorry
-- TauCeti.Computational.test_pMaximal_overorder
example {K : Type*} [Field K] [CharZero K] (p : ℕ) (R S : Subalgebra ℤ K) (h : R ≤ S) (hr : IsPMaximal R p) : IsPMaximal S p := by sorry

/- ComputationalNumberTheory:CN.2/finite-algebra-frobenius-nilradical -/
theorem nilpotent_iff_frobenius_zero (p k : ℕ) [Fact p.Prime]
 (A : Type*) [CommRing A] [Algebra (ZMod p) A] [FiniteDimensional (ZMod p) A]
 (h : Module.finrank (ZMod p) A  ≤  p^k) (x : A) : IsNilpotent x ↔ x^(p^k)=0 := by sorry

/- ComputationalNumberTheory:CN.2/units-complete-of-regulator-bound -/
theorem units_complete_of_regulator_bound (K : Type*) [Field K] [NumberField K]
 (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
 (hu : NumberField.Units.IsMaxRank u)
 (h : NumberField.Units.regOfFamily u  <  2 * NumberField.Units.regulator K) :
 Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤ := by sorry

/- ComputationalNumberTheory:CN.2/joint-class-unit-index-certificate -/
theorem joint_class_unit_bound (K : Type*) [Field K] [NumberField K]
 (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
 (hu : NumberField.Units.IsMaxRank u) (h h' : ℕ) (hh : 0 < h) (hd : h∣h')
 (hh' : 0 < h') (hb : (h':ℝ)*NumberField.Units.regOfFamily u  <
 2*(h:ℝ)*NumberField.Units.regulator K) :
 h'=h ∧ Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤ := by sorry

/- ComputationalNumberTheory:CN.3/weight-26-coefficient-107 -/
theorem weight26_coeff_107 :
 (qExpansion 1 (fun z : ℍ => ModularForm.discriminant z * ModularForm.E₄ z ^ 2 * ModularForm.E₆ z)).coeff 107
 = (35830422465487817813321292:ℂ) := by sorry

/- ComputationalNumberTheory:CN.3/weight-26-ordinary-107 -/
theorem weight26_ordinary_107 : (35830422465487817813321292:ZMod 107) = -1 := by sorry

/- ComputationalNumberTheory:CN.3/level-one-prime-recurrence -/
def HasLevelOnePrimeRecurrence (k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) : Prop :=
 ∀ (f : CuspForm 𝒮ℒ (k:ℤ)) (m : ℕ), (qExpansion 1 (T f)).coeff m=
 (qExpansion 1 f).coeff (p*m) + if p∣m then (p:ℂ)^(k-1)*(qExpansion 1 f).coeff (m/p) else 0
theorem heckeRecurrence_coeff_one (k p : ℕ) (hp : 1 < p) (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (h : HasLevelOnePrimeRecurrence k p T) (f : CuspForm 𝒮ℒ (k:ℤ)) : (qExpansion 1 (T f)).coeff 1=(qExpansion 1 f).coeff p := by sorry
theorem heckeRecurrence_unique (k p : ℕ) (T U : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T) (hU : HasLevelOnePrimeRecurrence k p U) : T=U := by sorry
-- The integral-lattice preservation interface remains a README target.
-- TauCeti.Computational.test_hecke_weight_two
example : HasLevelOnePrimeRecurrence 2 2 0 := by sorry
-- TauCeti.Computational.test_hecke_delta
example : HasLevelOnePrimeRecurrence 12 2 ((-24:ℂ) • (LinearMap.id:Module.End ℂ (CuspForm 𝒮ℒ 12))) := by sorry
-- TauCeti.Computational.test_hecke_zero_wrong
example : ¬HasLevelOnePrimeRecurrence 12 2 0 := by sorry

/- ComputationalNumberTheory:CN.4/unique-integer-in-enclosure -/
def uniqueInteger (I : NonemptyInterval ℚ) : Option ℤ :=
 if (⌈I.fst⌉:ℤ) = (⌊I.snd⌋:ℤ) then some ⌈I.fst⌉ else none
theorem uniqueInteger_mem (I : NonemptyInterval ℚ) (z : ℤ) (h : uniqueInteger I=some z) : I.fst ≤ (z:ℚ) ∧ (z:ℚ) ≤ I.snd := by sorry
theorem uniqueInteger_iff (I : NonemptyInterval ℚ) (z : ℤ) : uniqueInteger I = some z ↔
 (I.fst  ≤  (z:ℚ) ∧ (z:ℚ)  ≤  I.snd) ∧ ∀ w : ℤ, I.fst  ≤  (w:ℚ) → (w:ℚ)  ≤  I.snd → w=z := by sorry
theorem uniqueInteger_pure (z : ℤ) : uniqueInteger (NonemptyInterval.pure (z:ℚ)) = some z := by sorry
-- TauCeti.Computational.test_uniqueInteger_one
example : uniqueInteger ⟨(3/4,5/4), by sorry⟩ = some 1 := by sorry
-- TauCeti.Computational.test_uniqueInteger_two
example : uniqueInteger ⟨(0,1), by sorry⟩ = none := by sorry
-- TauCeti.Computational.test_uniqueInteger_empty
example : uniqueInteger (NonemptyInterval.pure (1/2)) = none := by sorry

/- ComputationalNumberTheory:CN.4/integer-recovery-sound -/
theorem uniqueInteger_sound (I : NonemptyInterval ℚ) (z w : ℤ)
 (hz : (I.fst:ℝ)  ≤  (z:ℝ) ∧ (z:ℝ)  ≤  (I.snd:ℝ)) (h : uniqueInteger I = some w) : z=w := by sorry

/- ComputationalNumberTheory:CN.4/effective-gram-lower-bound -/
theorem effectiveGram_lower {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℝ) (x : Fin n → ℝ)
 (h : ∀ i j, B i j  ≤  A i j) (hx : ∀ i, 0  ≤  x i) :
 (∑ i, ∑ j, B i j*x i*x j)  ≤  ∑ i, ∑ j, A i j*x i*x j := by sorry

/- ComputationalNumberTheory:CN.4/loewner-gram-lower-bound -/
theorem loewnerGram_lower {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℝ)
 (h : ∀ x : Fin n → ℝ, 0  ≤  ∑ i, ∑ j, (A i j-B i j)*x i*x j) (x : Fin n → ℝ) :
 (∑ i, ∑ j, B i j*x i*x j)  ≤  ∑ i, ∑ j, A i j*x i*x j := by sorry

/- ComputationalNumberTheory:CN.4/complex-box-denotation -/
def complexBoxSet (B : NonemptyInterval ℚ × NonemptyInterval ℚ) : Set ℂ := {z | (B.1.fst:ℝ) ≤ z.re ∧ z.re ≤ B.1.snd ∧ (B.2.fst:ℝ) ≤ z.im ∧ z.im ≤ B.2.snd}
theorem mem_complexBoxSet (B : NonemptyInterval ℚ × NonemptyInterval ℚ) (z : ℂ) : z∈complexBoxSet B ↔ (B.1.fst:ℝ) ≤ z.re ∧ z.re ≤ B.1.snd ∧ (B.2.fst:ℝ) ≤ z.im ∧ z.im ≤ B.2.snd := by sorry
theorem complexBoxSet_nonempty (B : NonemptyInterval ℚ × NonemptyInterval ℚ) : (complexBoxSet B).Nonempty := by sorry
theorem complexBoxSet_mono (B C : NonemptyInterval ℚ × NonemptyInterval ℚ) (hr : C.1.fst ≤ B.1.fst ∧ B.1.snd ≤ C.1.snd) (hi : C.2.fst ≤ B.2.fst ∧ B.2.snd ≤ C.2.snd) : complexBoxSet B⊆complexBoxSet C := by sorry
-- TauCeti.Computational.test_box_zero
example : complexBoxSet (⟨(0,0),by sorry⟩,⟨(0,0),by sorry⟩)={0} := by sorry
-- TauCeti.Computational.test_box_i
example : Complex.I∈complexBoxSet (⟨(0,0),by sorry⟩,⟨(1,1),by sorry⟩) := by sorry
-- TauCeti.Computational.test_box_positive_nonzero
example (B : NonemptyInterval ℚ × NonemptyInterval ℚ) (h : 0 < B.1.fst) : (0:ℂ)∉complexBoxSet B := by sorry

/- ComputationalNumberTheory:CN.4/odlyzko-tail-kernel -/
def ctTailKernel (x : ℝ) : ℝ := 2*Real.pi^2*Real.exp (-x)/(x^2+Real.pi^2)^2
theorem ctTailKernel_pos (x : ℝ) : 0 < ctTailKernel x := by sorry
theorem ctTailKernel_zero : ctTailKernel 0=2/Real.pi^2 := by sorry
theorem ctTailKernel_geometric (x t : ℝ) (hx : 0 ≤ x) (ht : 0 ≤ t) : ctTailKernel (x+t) ≤ Real.exp (-t)*ctTailKernel x := by sorry
-- TauCeti.Computational.test_tail_kernel_zero
example : 0 < ctTailKernel 0 := by sorry
-- TauCeti.Computational.test_tail_kernel_one
example : ctTailKernel 1 < ctTailKernel 0 := by sorry
-- TauCeti.Computational.test_tail_kernel_not_even
example : ctTailKernel 1 < ctTailKernel (-1) := by sorry

/- ComputationalNumberTheory:CN.4/odlyzko-geometric-tail -/
theorem ctTailKernel_tail (α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ) :
 Summable (fun n : ℕ => ctTailKernel (α*(b+n))) ∧
 0 ≤ (∑' n : ℕ, ctTailKernel (α*(b+n)))-(∑ n∈Finset.range N, ctTailKernel (α*(b+n))) ∧
 (∑' n : ℕ, ctTailKernel (α*(b+n)))-(∑ n∈Finset.range N, ctTailKernel (α*(b+n)))
  ≤ ctTailKernel (α*(b+N))/(1-Real.exp (-α)) := by sorry

/- ComputationalNumberTheory:CN.4/odlyzko-alternating-tail -/
theorem ctTailKernel_alternating_tail (α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ) :
 |(∑' n : ℕ, (-1:ℝ)^n*ctTailKernel (α*(b+n)))-
 (∑ n∈Finset.range N, (-1:ℝ)^n*ctTailKernel (α*(b+n)))|  ≤  ctTailKernel (α*(b+N)) := by sorry

end TauCeti.Computational
