/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These signatures suggest names and Lean forms so contributors and reviewers can converge.
The admitted proofs describe intended targets. They are not completed formalizations.
The README specifies finite verifiers and algorithm termination beyond these signatures.
-/
import TauCeti.NumberTheory.ModularForms.SturmBound
import TauCeti.NumberTheory.ModularForms.LFunction
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Recurrence
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
open scoped BigOperators
open Polynomial Module


open scoped nonZeroDivisors MatrixGroups
open _root_.UpperHalfPlane _root_.ModularForm

/-! ## CN.0 -/

/- RAM instruction -/
inductive RAMInstruction where
 | arithmetic (op : Fin 4) (dst : Bool × ℕ) (a b : ℤ ⊕ (Bool × ℕ))
 | branch (cmp : Fin 6) (a b : ℤ ⊕ (Bool × ℕ)) (target : ℕ)
 | halt
 deriving DecidableEq
theorem ramInstruction_halt_ne_arithmetic (op : Fin 4) (dst : Bool × ℕ) (a b : ℤ ⊕ (Bool × ℕ)) : RAMInstruction.halt ≠ .arithmetic op dst a b := by sorry
theorem ramInstruction_branch_injective (cmp : Fin 6) (a b : ℤ ⊕ (Bool × ℕ)) (i j : ℕ) : RAMInstruction.branch cmp a b i = .branch cmp a b j ↔ i=j := by sorry
theorem ramInstruction_arithmetic_injective (op oq : Fin 4) (dst : Bool × ℕ) (a b : ℤ ⊕ (Bool × ℕ)) : RAMInstruction.arithmetic op dst a b = .arithmetic oq dst a b ↔ op=oq := by sorry
-- TauCeti.Computational.test_ram_halt
example : ([RAMInstruction.halt]).length = 1 := by sorry
-- TauCeti.Computational.test_ram_assignment
example : ∃ i : RAMInstruction, i = .arithmetic 0 (false,0) (.inl 2) (.inl 3) := by sorry
-- TauCeti.Computational.test_ram_branch_distinct
example : RAMInstruction.branch 0 (.inl 1) (.inl 1) 0 ≠ .branch 0 (.inl 1) (.inl 1) 1 := by sorry

/- RAM operand evaluation -/
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

/- Partial RAM transition -/
def ramStep (P : List RAMInstruction) (c : ℕ × (ℕ → ℤ)) : Except String (Option (ℕ × (ℕ → ℤ))) := by sorry
theorem ramStep_halt (P : List RAMInstruction) (pc : ℕ) (m : ℕ → ℤ) (h : P[pc]?=some .halt) : ramStep P (pc,m)=.ok none := by sorry
theorem ramStep_empty (pc : ℕ) (m : ℕ → ℤ) : ∃ e, ramStep [] (pc,m)=.error e := by sorry
theorem ramStep_deterministic (P : List RAMInstruction) (c : ℕ × (ℕ → ℤ)) (a b : Except String (Option (ℕ × (ℕ → ℤ)))) (ha : ramStep P c=a) (hb : ramStep P c=b) : a=b := by sorry
-- TauCeti.Computational.test_ram_add
example : ramStep [.arithmetic 0 (false,0) (.inl 2) (.inl 3)] (0,fun _ => 0) = .ok (some (1,Function.update (fun _ => 0) 0 5)) := by sorry
-- TauCeti.Computational.test_ram_floor
example : ramStep [.arithmetic 3 (false,0) (.inl 3) (.inl (-2))] (0,fun _ => 0) = .ok (some (1,Function.update (fun _ => 0) 0 (-2))) := by sorry
-- TauCeti.Computational.test_ram_halts
example : ramStep [.halt] (0,fun _ => 0)=.ok none := by sorry

/- Finite RAM execution -/
structure RAMExecution (P : List RAMInstruction) where
 length : ℕ
 positive : 0 < length
 config : Fin length → ℕ × (ℕ → ℤ)
 initial : (config ⟨0,positive⟩).1=0
 transition : ∀ (i : ℕ) (h : i+1 < length), ramStep P (config ⟨i,by sorry⟩) = .ok (some (config ⟨i+1,h⟩))
 halts : ramStep P (config ⟨length-1,by sorry⟩) = .ok none
theorem RAMExecution.instructionCount_pos {P : List RAMInstruction} (e : RAMExecution P) : 0 < e.length := by sorry
theorem RAMExecution.first_pc {P : List RAMInstruction} (e : RAMExecution P) : (e.config ⟨0,e.positive⟩).1=0 := by sorry
theorem RAMExecution.final_halts {P : List RAMInstruction} (e : RAMExecution P) : ramStep P (e.config ⟨e.length-1,by sorry⟩)=.ok none := by sorry
-- TauCeti.Computational.test_ram_execution_halt
example : ∃ e : RAMExecution [.halt], e.length=1 := by sorry
-- TauCeti.Computational.test_ram_execution_empty
example : IsEmpty (RAMExecution []) := by sorry
-- TauCeti.Computational.test_ram_execution_loop
example : IsEmpty (RAMExecution [.branch 0 (.inl 0) (.inl 0) 0]) := by sorry

/- Cost of a RAM execution -/
def bitCost {P : List RAMInstruction} (C : (ℕ × (ℕ → ℤ)) → ℕ) (e : RAMExecution P) : ℕ := ∑ i, C (e.config i)
theorem bitCost_one {P : List RAMInstruction} (e : RAMExecution P) : bitCost (fun _ => 1) e=e.length := by sorry
theorem bitCost_add {P : List RAMInstruction} (C D : (ℕ × (ℕ → ℤ)) → ℕ) (e : RAMExecution P) : bitCost (fun c => C c+D c) e=bitCost C e+bitCost D e := by sorry
theorem bitCost_mono {P : List RAMInstruction} (C D : (ℕ × (ℕ → ℤ)) → ℕ) (e : RAMExecution P) (h : ∀ c, C c ≤ D c) : bitCost C e ≤ bitCost D e := by sorry
-- TauCeti.Computational.test_bitCost_zero
example {P : List RAMInstruction} (e : RAMExecution P) : bitCost (fun _ => 0) e=0 := by sorry
-- TauCeti.Computational.test_bitCost_two
example {P : List RAMInstruction} (e : RAMExecution P) : bitCost (fun _ => 2) e=2*e.length := by sorry
-- TauCeti.Computational.test_bitCost_not_unit
example {P : List RAMInstruction} (e : RAMExecution P) : e.length < bitCost (fun _ => 2) e := by sorry

/- Bounded instruction costs give a total bound -/
theorem bitCost_le {P : List RAMInstruction} (C : (ℕ × (ℕ → ℤ)) → ℕ) (e : RAMExecution P) (B : ℕ) (h : ∀ i, C (e.config i) ≤ B) : bitCost C e ≤ e.length*B := by sorry

/- Isolated algebraic root certificate -/
structure AlgebraicRootCertificate where
 polynomial : Polynomial ℚ
 nonzero : polynomial ≠ 0
 re : NonemptyInterval ℚ
 im : NonemptyInterval ℚ
 isolates : ∃! z : ℂ, aeval z polynomial=0 ∧ (re.fst:ℝ) ≤ z.re ∧ z.re ≤ re.snd ∧ (im.fst:ℝ) ≤ z.im ∧ z.im ≤ im.snd
def AlgebraicRootCertificate.value (c : AlgebraicRootCertificate) : algebraicClosure ℚ ℂ := by sorry
theorem AlgebraicRootCertificate.value_spec (c : AlgebraicRootCertificate) :
 aeval (c.value:ℂ) c.polynomial=0 ∧ (c.re.fst:ℝ) ≤ (c.value:ℂ).re ∧ (c.value:ℂ).re ≤ c.re.snd ∧ (c.im.fst:ℝ) ≤ (c.value:ℂ).im ∧ (c.value:ℂ).im ≤ c.im.snd := by sorry
theorem AlgebraicRootCertificate.value_unique (c : AlgebraicRootCertificate) (z : ℂ)
 (h : aeval z c.polynomial=0 ∧ (c.re.fst:ℝ) ≤ z.re ∧ z.re ≤ c.re.snd ∧ (c.im.fst:ℝ) ≤ z.im ∧ z.im ≤ c.im.snd) : z=c.value := by sorry
-- TauCeti.Computational.test_algebraic_zero
example : ∃ c : AlgebraicRootCertificate, c.polynomial=X ∧ (c.value:ℂ)=0 := by sorry
-- TauCeti.Computational.test_algebraic_repeated
example : ∃ c : AlgebraicRootCertificate, c.polynomial=X^2 ∧ (c.value:ℂ)=0 := by sorry
-- TauCeti.Computational.test_algebraic_ambiguous
example : ¬ ∃! z : ℂ, aeval z (X^2-1:Polynomial ℚ)=0 ∧ (-2:ℝ) ≤ z.re ∧ z.re ≤ 2 ∧ z.im=0 := by sorry

/- Exact rational root presentation -/
def rationalRootCertificate (r : ℚ) : AlgebraicRootCertificate := by sorry
theorem rationalRootCertificate_value (r : ℚ) : ((rationalRootCertificate r).value:ℂ)=(r:ℂ) := by sorry
theorem rationalRootCertificate_add (r s : ℚ) : (rationalRootCertificate (r+s)).value=(rationalRootCertificate r).value+(rationalRootCertificate s).value := by sorry
theorem rationalRootCertificate_mul (r s : ℚ) : (rationalRootCertificate (r*s)).value=(rationalRootCertificate r).value*(rationalRootCertificate s).value := by sorry
-- TauCeti.Computational.test_rational_zero
example : (rationalRootCertificate 0).value=0 := by sorry
-- TauCeti.Computational.test_rational_half
example : (rationalRootCertificate (1/2)).value+(rationalRootCertificate (1/3)).value=(rationalRootCertificate (5/6)).value := by sorry
-- TauCeti.Computational.test_rational_distinct
example : (rationalRootCertificate (1/2)).value≠(rationalRootCertificate (1/3)).value := by sorry

/- Addition of isolated algebraic numbers -/
theorem algebraic_add_certificate (a b : AlgebraicRootCertificate) : ∃ c : AlgebraicRootCertificate, c.value=a.value+b.value := by sorry

/- Multiplication of isolated algebraic numbers -/
theorem algebraic_mul_certificate (a b : AlgebraicRootCertificate) : ∃ c : AlgebraicRootCertificate, c.value=a.value*b.value := by sorry

/- Inversion of a nonzero algebraic number -/
theorem algebraic_inv_certificate (a : AlgebraicRootCertificate) (ha : a.value≠0) : ∃ c : AlgebraicRootCertificate, c.value=a.value⁻¹ := by sorry

/- Canonical finite p-adic approximation -/
structure PadicApproximation (p : ℕ) where
 precision : ℤ
 valuation : ℤ
 mantissa : ℕ
 canonical : (valuation=precision ∧ mantissa=0) ∨
   (valuation < precision ∧ 0 < mantissa ∧ mantissa < p^((precision-valuation).toNat) ∧ ¬p∣mantissa)
def PadicApproximation.center {p : ℕ} (a : PadicApproximation p) : ℚ := (p:ℚ)^a.valuation*a.mantissa
def PadicApproximation.denotation {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : Set ℚ_[p] := {x | ‖x-(a.center:ℚ_[p])‖ ≤ (p:ℝ)^(-a.precision)}
theorem PadicApproximation.center_mem {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : (a.center:ℚ_[p])∈a.denotation := by sorry
theorem PadicApproximation.zero_mem_iff {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : (0:ℚ_[p])∈a.denotation ↔ a.mantissa=0 := by sorry
-- TauCeti.Computational.test_padic_zero_ball
example (p : ℕ) (a : PadicApproximation p) (h : a.mantissa=0) : a.valuation=a.precision := by sorry
-- TauCeti.Computational.test_padic_negative_precision
example : ∃ a : PadicApproximation 3, a.precision=0 ∧ a.valuation= -1 ∧ a.mantissa=1 ∧ a.center=1/3 := by sorry
-- TauCeti.Computational.test_padic_nonunit_mantissa
example (p : ℕ) [Fact p.Prime] (a : PadicApproximation p) (h : p∣a.mantissa) : a.mantissa=0 := by sorry

/- Polynomial magnitude bound for RAM memory -/
def PolynomialRAMMagnitude {P : List RAMInstruction} (e : RAMExecution P) (n A b C : ℕ) : Prop := ∀ i j, ((e.config i).2 j).natAbs  ≤  A*(n+e.length)^b+C
theorem polynomialRAMMagnitude_iff {P : List RAMInstruction} (e : RAMExecution P) (n A b C : ℕ) : PolynomialRAMMagnitude e n A b C ↔ ∀ i j, ((e.config i).2 j).natAbs ≤ A*(n+e.length)^b+C := by sorry
theorem polynomialRAMMagnitude_mono_constant {P : List RAMInstruction} (e : RAMExecution P) (n A b C D : ℕ) (h : C ≤ D) : PolynomialRAMMagnitude e n A b C → PolynomialRAMMagnitude e n A b D := by sorry
theorem polynomialRAMMagnitude_mono_input {P : List RAMInstruction} (e : RAMExecution P) (n m A b C : ℕ) (h : n ≤ m) : PolynomialRAMMagnitude e n A b C → PolynomialRAMMagnitude e m A b C := by sorry
-- TauCeti.Computational.test_ram_zero_bound
example {P : List RAMInstruction} (e : RAMExecution P) (h : ∀ i j, (e.config i).2 j=0) : PolynomialRAMMagnitude e 0 0 0 0 := by sorry
-- TauCeti.Computational.test_ram_magnitude_projection
example {P : List RAMInstruction} (e : RAMExecution P) (h : PolynomialRAMMagnitude e 1 2 3 4) (i : Fin e.length) : ((e.config i).2 0).natAbs ≤ 2*(1+e.length)^3+4 := by sorry
-- TauCeti.Computational.test_ram_nonzero_excluded
example {P : List RAMInstruction} (e : RAMExecution P) (i : Fin e.length) (j : ℕ) (h : (e.config i).2 j≠0) : ¬PolynomialRAMMagnitude e 0 0 0 0 := by sorry

/- Equality of isolated algebraic numbers -/
def algebraicEqual (a b : AlgebraicRootCertificate) : Bool := by sorry
theorem algebraicEqual_iff (a b : AlgebraicRootCertificate) : algebraicEqual a b=true ↔ a.value=b.value := by sorry
theorem algebraicEqual_refl (a : AlgebraicRootCertificate) : algebraicEqual a a=true := by sorry
theorem algebraicEqual_symm (a b : AlgebraicRootCertificate) : algebraicEqual a b=algebraicEqual b a := by sorry
-- TauCeti.Computational.test_algebraic_equal_zero
example : algebraicEqual (rationalRootCertificate 0) (rationalRootCertificate 0)=true := by sorry
-- TauCeti.Computational.test_algebraic_equal_fraction
example : algebraicEqual (rationalRootCertificate (2/4)) (rationalRootCertificate (1/2))=true := by sorry
-- TauCeti.Computational.test_algebraic_unequal_fraction
example : algebraicEqual (rationalRootCertificate (1/2)) (rationalRootCertificate (1/3))=false := by sorry

/-! ## CN.1 -/

/- Recursive Pratt certificate -/
inductive PrattCertificate where
 | two : PrattCertificate
 | node (n a : ℕ) (children : List PrattCertificate) : PrattCertificate

def PrattCertificate.value : PrattCertificate → ℕ
 | .two => 2
 | .node n _ _ => n
theorem PrattCertificate.value_two : PrattCertificate.two.value = 2 := by sorry
theorem PrattCertificate.value_node (n a : ℕ) (cs : List PrattCertificate) : (PrattCertificate.node n a cs).value=n := by sorry
theorem PrattCertificate.node_injective (n m a b : ℕ) (cs ds : List PrattCertificate) : PrattCertificate.node n a cs = .node m b ds ↔ n=m ∧ a=b ∧ cs=ds := by sorry
-- TauCeti.Computational.test_pratt_leaf
example : PrattCertificate.two.value = 2 := by sorry
-- TauCeti.Computational.test_pratt_three
example : (PrattCertificate.node 3 2 [.two]).value = 3 := by sorry
-- TauCeti.Computational.test_pratt_untrusted
example : (PrattCertificate.node 1 0 []).value = 1 := by sorry

/- Pratt certificate checker -/
def PrattCertificate.check : PrattCertificate → Bool := by sorry
theorem PrattCertificate.check_two : PrattCertificate.two.check=true := by sorry
theorem PrattCertificate.check_node_iff (n a : ℕ) (cs : List PrattCertificate) :
 (PrattCertificate.node n a cs).check=true ↔ 3 ≤ n ∧ 0 < a ∧ a < n ∧
 (∀ c∈cs, c.check=true) ∧ (cs.map PrattCertificate.value).prod=n-1 ∧
 a^(n-1)%n=1 ∧ ∀ c∈cs, a^((n-1)/c.value)%n≠1 := by sorry
theorem PrattCertificate.check_value_ge_two (c : PrattCertificate) (h : c.check=true) : 2 ≤ c.value := by sorry
-- TauCeti.Computational.test_pratt_check_three
example : (PrattCertificate.node 3 2 [.two]).check=true := by sorry
-- TauCeti.Computational.test_pratt_check_one
example : (PrattCertificate.node 1 0 []).check=false := by sorry
-- TauCeti.Computational.test_pratt_check_nine
example : (PrattCertificate.node 9 2 [.two,.two,.two]).check=false := by sorry

/- Soundness of Pratt certificates -/
theorem PrattCertificate.sound (c : PrattCertificate) (h : c.check=true) : Nat.Prime c.value := by sorry

/- Completeness of Pratt certificates -/
theorem PrattCertificate.complete (n : ℕ) (hn : Nat.Prime n) : ∃ c : PrattCertificate, c.value=n ∧ c.check=true := by sorry

/- Strong Miller–Rabin liar -/
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

/- Prime inputs pass every admissible base -/
theorem strongLiar_of_prime (n a : ℕ) (hp : Nat.Prime n) (ho : Odd n) (ha : 0 < a) (han : a < n) : StrongLiar n a := by sorry

/- Miller–Rabin strong-liar bound -/
theorem strongLiar_card_le (n : ℕ) (hn : 1 < n) (ho : Odd n) (hc : ¬Nat.Prime n) :
 4 * Nat.card {a : Fin n // StrongLiar n a.val}  ≤  n-1 := by sorry

/- Error bound for independent Miller–Rabin rounds -/
theorem millerRabin_rounds_bound (n k : ℕ) (hn : 1 < n) (ho : Odd n) (hc : ¬Nat.Prime n) :
 4^k * Nat.card {a : Fin k → Fin (n-1) // ∀ i, StrongLiar n ((a i).val+1)}  ≤  (n-1)^k := by sorry

/- AKS order parameter -/
def aksParameter (n : ℕ) : ℕ := by sorry
theorem aksParameter_valid (n : ℕ) (hn : 1 < n) :
 1 < aksParameter n ∧ aksParameter n ≤ n ∧
 (1 < Nat.gcd n (aksParameter n) ∨ Nat.Coprime n (aksParameter n) ∧
 4*(Nat.log2 n+1)^2  <  orderOf (n:ZMod (aksParameter n))) := by sorry
theorem aksParameter_minimal (n r : ℕ) (hn : 1 < n) (hr : 1 < r) (h : r < aksParameter n) :
 Nat.gcd n r=1 ∧ orderOf (n:ZMod r) ≤ 4*(Nat.log2 n+1)^2 := by sorry
theorem aksParameter_small (n : ℕ) (h : n ≤ 1) : aksParameter n=0 := by sorry
-- TauCeti.Computational.test_aksParameter_two
example : aksParameter 2=2 := by sorry
-- TauCeti.Computational.test_aksParameter_nine
example : aksParameter 9=3 := by sorry
-- TauCeti.Computational.test_aksParameter_one
example : aksParameter 1=0 := by sorry

/- AKS polynomial congruences -/
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

/- Shoup’s AKS algorithm -/
def aks (n : ℕ) : Bool := by sorry
theorem aks_small (n : ℕ) (h : n ≤ 1) : aks n=false := by sorry
theorem aks_perfect_power (a b : ℕ) (ha : 1 < a) (hb : 1 < b) : aks (a^b)=false := by sorry
theorem aks_check_iff (n : ℕ) (hn : 1 < n)
 (hpow : ¬∃ a b : ℕ, 1 < a ∧ 1 < b ∧ a^b=n)
 (hr : aksParameter n < n) (hc : Nat.Coprime n (aksParameter n)) :
 aks n=true ↔ AKSIdentities n (aksParameter n) (2*(Nat.log2 n+1)*Nat.sqrt (aksParameter n)+1) := by sorry
-- TauCeti.Computational.test_aks_two
example : aks 2=true := by sorry
-- TauCeti.Computational.test_aks_one
example : aks 1=false := by sorry
-- TauCeti.Computational.test_aks_nine
example : aks 9=false := by sorry

/- Correctness of the AKS algorithm -/
theorem aks_correct (n : ℕ) : aks n=true ↔ Nat.Prime n := by sorry

/- Pocklington prime-divisor congruence -/
theorem pocklington_prime_divisor (n F : ℕ) (hn : 1 < n) (hF : 1 < F) (hdiv : F∣n-1)
 (hw : ∀ q : ℕ, Nat.Prime q → q∣F → ∃ a : ℤ,
  (a:ZMod n)^(n-1)=1 ∧ Int.gcd (a^((n-1)/q)-1) (n:ℤ)=1)
 (p : ℕ) (hp : Nat.Prime p) (hpn : p∣n) : F∣p-1 := by sorry

/- Pocklington primality criterion -/
theorem pocklington_prime (n F : ℕ) (hn : 1 < n) (hF : 1 < F) (hdiv : F∣n-1)
 (hlarge : n < F^2) (hw : ∀ q : ℕ, Nat.Prime q → q∣F → ∃ a : ℤ,
  (a:ZMod n)^(n-1)=1 ∧ Int.gcd (a^((n-1)/q)-1) (n:ℤ)=1) : Nat.Prime n := by sorry

/- Integer factorization with prime certificates -/
structure IntegerFactorCertificate where
 negative : Bool
 factors : List PrattCertificate
def IntegerFactorCertificate.value (c : IntegerFactorCertificate) : ℤ := (if c.negative then -1 else 1)*(c.factors.map (fun q => (q.value:ℤ))).prod
def IntegerFactorCertificate.check (c : IntegerFactorCertificate) (z : ℤ) : Bool := c.factors.all PrattCertificate.check && decide (c.value=z)
theorem IntegerFactorCertificate.check_iff (c : IntegerFactorCertificate) (z : ℤ) : c.check z=true ↔ c.value=z ∧ ∀ q∈c.factors, q.check=true := by sorry
-- TauCeti.Computational.test_integer_factor_unit
example : (IntegerFactorCertificate.mk true []).check (-1)=true := by sorry
-- TauCeti.Computational.test_integer_factor_twelve
example : (IntegerFactorCertificate.mk false [.two,.two,.node 3 2 [.two]]).check 12=true := by sorry
-- TauCeti.Computational.test_integer_factor_zero
example (c : IntegerFactorCertificate) : c.check 0=false := by sorry

/- Soundness of integer factorization certificates -/
theorem IntegerFactorCertificate.sound (c : IntegerFactorCertificate) (z : ℤ) (h : c.check z=true) :
 z≠0 ∧ c.value=z ∧ (∀ q∈c.factors, Nat.Prime q.value) ∧
 ∀ p : ℕ, Nat.Prime p → (p∣z.natAbs ↔ ∃ q∈c.factors, q.value=p) := by sorry

/- Every nonzero integer admits a factor certificate -/
theorem IntegerFactorCertificate.complete (z : ℤ) (hz : z≠0) : ∃ c : IntegerFactorCertificate, c.check z=true := by sorry

/- Finite Pocklington certificate -/
structure PocklingtonCertificate where
 entries : List (PrattCertificate × ℤ)
def PocklingtonCertificate.factor (c : PocklingtonCertificate) : ℕ := (c.entries.map (fun x => x.1.value)).prod
def PocklingtonCertificate.check (c : PocklingtonCertificate) (n : ℕ) : Bool := by sorry
theorem PocklingtonCertificate.check_iff (c : PocklingtonCertificate) (n : ℕ) : c.check n=true ↔
 1 < n ∧ 1 < c.factor ∧ c.factor∣n-1 ∧ n < c.factor^2 ∧
 ∀ x∈c.entries, x.1.check=true ∧ (x.2:ZMod n)^(n-1)=1 ∧ Int.gcd (x.2^((n-1)/x.1.value)-1) (n:ℤ)=1 := by sorry
-- TauCeti.Computational.test_pocklington_seventeen
example : (PocklingtonCertificate.mk [(.two,3),(.two,3),(.two,3)]).check 17=true := by sorry
-- TauCeti.Computational.test_pocklington_empty
example (n : ℕ) : (PocklingtonCertificate.mk []).check n=false := by sorry
-- TauCeti.Computational.test_pocklington_insufficient
example : (PocklingtonCertificate.mk [(.two,3)]).check 17=false := by sorry

/- Soundness of finite Pocklington certificates -/
theorem PocklingtonCertificate.sound (c : PocklingtonCertificate) (n : ℕ) (h : c.check n=true) : Nat.Prime n := by sorry

/- Transport of certified finite-field factors -/
theorem transport_finite_factorization {F K : Type*} [Field F] [Field K] [Finite F] [Finite K]
 (e : F ≃+* K) (f : Polynomial F) (hf : f≠0) (c : F) (hc : c≠0) (gs : List (Polynomial F))
 (hg : ∀ g∈gs, g.Monic ∧ Irreducible g) (hprod : f=C c*gs.prod) :
 f.map e.toRingHom=C (e c)*(gs.map (fun g => g.map e.toRingHom)).prod ∧
 ∀ g∈gs, (g.map e.toRingHom).Monic ∧ Irreducible (g.map e.toRingHom) := by sorry

/- Rational polynomial factor certificate -/
structure RationalFactorCertificate (f : Polynomial ℚ) where
 scalar : ℚ
 nonzero : scalar≠0
 factors : List (Polynomial ℚ)
 irreducible : ∀ g∈factors, g.Monic ∧ Irreducible g
 product : f=C scalar*factors.prod
theorem RationalFactorCertificate.reconstruct {f : Polynomial ℚ} (c : RationalFactorCertificate f) : f=C c.scalar*c.factors.prod := by sorry
theorem RationalFactorCertificate.input_nonzero {f : Polynomial ℚ} (c : RationalFactorCertificate f) : f≠0 := by sorry
theorem RationalFactorCertificate.leadingCoeff {f : Polynomial ℚ} (c : RationalFactorCertificate f) : c.scalar=f.leadingCoeff := by sorry
-- TauCeti.Computational.test_rational_factor_one
example : Nonempty (RationalFactorCertificate (1:Polynomial ℚ)) := by sorry
-- TauCeti.Computational.test_rational_factor_repeated
example : ∃ c : RationalFactorCertificate ((X-1)^2), c.factors=[X-1,X-1] := by sorry
-- TauCeti.Computational.test_rational_factor_zero
example : IsEmpty (RationalFactorCertificate (0:Polynomial ℚ)) := by sorry

/- Certified rational polynomial factorization -/
def certifiedRationalFactorization (f : Polynomial ℚ) (hf : f≠0) : RationalFactorCertificate f := by sorry
theorem certifiedRationalFactorization_product (f : Polynomial ℚ) (hf : f≠0) : f=C (certifiedRationalFactorization f hf).scalar*(certifiedRationalFactorization f hf).factors.prod := by sorry
theorem certifiedRationalFactorization_irreducible (f : Polynomial ℚ) (hf : f≠0) (g : Polynomial ℚ) (hg : g∈(certifiedRationalFactorization f hf).factors) : g.Monic ∧ Irreducible g := by sorry
theorem certifiedRationalFactorization_scalar (f : Polynomial ℚ) (hf : f≠0) : (certifiedRationalFactorization f hf).scalar=f.leadingCoeff := by sorry
-- TauCeti.Computational.test_factorization_constant
example : (certifiedRationalFactorization (C 2:Polynomial ℚ) (by sorry)).factors=[] := by sorry
-- TauCeti.Computational.test_factorization_repeated
example : (certifiedRationalFactorization ((X-1)^2:Polynomial ℚ) (by sorry)).factors=[X-1,X-1] := by sorry
-- TauCeti.Computational.test_factorization_Q_not_C
example : (certifiedRationalFactorization (X^2+1:Polynomial ℚ) (by sorry)).factors=[X^2+1] := by sorry

/- Bit size of a Pratt tree -/
def prattBitSize : PrattCertificate → ℕ := by sorry
theorem prattBitSize_two : prattBitSize .two=1 := by sorry
theorem prattBitSize_node (n a : ℕ) (cs : List PrattCertificate) : prattBitSize (.node n a cs)=1+(Nat.log2 n+1)+(Nat.log2 a+1)+(Nat.log2 cs.length+1)+(cs.map prattBitSize).sum := by sorry
theorem prattBitSize_pos (c : PrattCertificate) : 0 < prattBitSize c := by sorry
-- TauCeti.Computational.test_size_leaf
example : prattBitSize .two=1 := by sorry
-- TauCeti.Computational.test_size_three
example : prattBitSize (.node 3 2 [.two])=7 := by sorry
-- TauCeti.Computational.test_size_repeated
example : prattBitSize (.node 5 2 [.two,.two])=10 := by sorry

/- Quadratic bit-size bound for Pratt certificates -/
theorem pratt_small_certificate : ∃ C : ℕ, ∀ n : ℕ, n.Prime → ∃ c : PrattCertificate, c.value=n ∧ c.check=true ∧ prattBitSize c ≤ C*(Nat.log2 n+1)^2 := by sorry

/-! ## CN.2 -/

/- Multiplier ring of an integral lattice -/
def multiplierRing {K : Type*} [Field K] [CharZero K] (I : Submodule ℤ K) : Subalgebra ℤ K := by sorry
theorem mem_multiplierRing {K : Type*} [Field K] [CharZero K] (I : Submodule ℤ K) (x : K) : x∈multiplierRing I ↔ ∀ y∈I, x*y∈I := by sorry
theorem multiplierRing_zero {K : Type*} [Field K] [CharZero K] : multiplierRing (⊥ : Submodule ℤ K)=⊤ := by sorry
theorem multiplierRing_smul {K : Type*} [Field K] [CharZero K] (I : Submodule ℤ K) (a : K) (ha : a≠0) : multiplierRing (Submodule.map (LinearMap.mul ℤ K a) I)=multiplierRing I := by sorry
-- TauCeti.Computational.test_multiplier_zero
example : multiplierRing (⊥ : Submodule ℤ ℚ)=⊤ := by sorry
-- TauCeti.Computational.test_multiplier_Z
example (x : ℚ) : x∈multiplierRing (Submodule.span ℤ ({1}:Set ℚ)) ↔ ∃ z : ℤ, (z:ℚ)=x := by sorry
-- TauCeti.Computational.test_multiplier_half
example : (1/2:ℚ)∉multiplierRing (Submodule.span ℤ ({1}:Set ℚ)) := by sorry

/- Local maximality of an order -/
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

/- Nilradical from a Frobenius kernel -/
theorem nilpotent_iff_frobenius_zero (p k : ℕ) [Fact p.Prime]
 (A : Type*) [CommRing A] [Algebra (ZMod p) A] [FiniteDimensional (ZMod p) A]
 (h : Module.finrank (ZMod p) A  ≤  p^k) (x : A) : IsNilpotent x ↔ x^(p^k)=0 := by sorry

/- Fundamental units from a regulator index bound -/
theorem units_complete_of_regulator_bound (K : Type*) [Field K] [NumberField K]
 (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
 (hu : NumberField.Units.IsMaxRank u)
 (h : NumberField.Units.regOfFamily u  <  2 * NumberField.Units.regulator K) :
 Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤ := by sorry

/- Joint class and unit stopping bound -/
theorem joint_class_unit_bound (K : Type*) [Field K] [NumberField K]
 (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
 (hu : NumberField.Units.IsMaxRank u) (h h' : ℕ) (hh : 0 < h) (hd : h∣h')
 (hh' : 0 < h') (hb : (h':ℝ)*NumberField.Units.regOfFamily u  <
 2*(h:ℝ)*NumberField.Units.regulator K) :
 h'=h ∧ Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤ := by sorry

/- Finite order basis certificate -/
structure OrderBasisCertificate (K : Type*) [Field K] [NumberField K] (n : ℕ) where
 basis : Basis (Fin n) ℚ K
 oneCoordinates : Fin n → ℤ
 multiplication : Fin n → Fin n → Fin n → ℤ
 one_eq : ∑ i, (oneCoordinates i:K)*basis i=1
 mul_eq : ∀ i j, basis i*basis j=∑ k, (multiplication i j k:K)*basis k
def OrderBasisCertificate.order {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : Subalgebra ℤ K := by sorry
theorem OrderBasisCertificate.mem_order {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) (x : K) : x∈b.order ↔ ∃ c : Fin n → ℤ, x=∑ i, (c i:K)*b.basis i := by sorry
theorem OrderBasisCertificate.coordinates_unique {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) (c d : Fin n → ℤ) (h : (∑ i, (c i:K)*b.basis i)=∑ i, (d i:K)*b.basis i) : c=d := by sorry
-- TauCeti.Computational.test_order_Q
example : ∃ b : OrderBasisCertificate ℚ 1, b.basis 0=1 ∧ b.order=⊥ := by sorry
-- TauCeti.Computational.test_order_rank_zero
example (K : Type*) [Field K] [NumberField K] : IsEmpty (OrderBasisCertificate K 0) := by sorry
-- TauCeti.Computational.test_order_half
example : ¬∃ b : OrderBasisCertificate ℚ 1, b.basis 0=1/2 := by sorry

/- Order coordinates imply integrality -/
theorem OrderBasisCertificate.isIntegral {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) (x : K) (h : x∈b.order) : IsIntegral ℤ x := by sorry

/- The p-radical in field coordinates -/
def pRadicalLattice {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) : Submodule ℤ K := by sorry
theorem mem_pRadicalLattice {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) (x : K) : x∈pRadicalLattice R p ↔ x∈R ∧ ∃ k : ℕ, 0 < k ∧ ∃ y∈R, x^k=(p:K)*y := by sorry
theorem pRadicalLattice_contains_p {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) : (p:K)∈pRadicalLattice R p := by sorry
theorem pRadicalLattice_mul {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) (r x : K) (hr : r∈R) (hx : x∈pRadicalLattice R p) : r*x∈pRadicalLattice R p := by sorry
-- TauCeti.Computational.test_pRadical_zero
example {K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) : pRadicalLattice R 0=⊥ := by sorry
-- TauCeti.Computational.test_pRadical_Z
example (p : ℕ) (hp : Nat.Prime p) (z : ℤ) : (z:ℚ)∈pRadicalLattice (⊥ : Subalgebra ℤ ℚ) p ↔ (p:ℤ)∣z := by sorry
-- TauCeti.Computational.test_pRadical_one_not
example (p : ℕ) (hp : Nat.Prime p) : (1:ℚ)∉pRadicalLattice (⊥ : Subalgebra ℤ ℚ) p := by sorry

/- Multiplier criterion for p-maximality -/
theorem pRadical_multiplier_eq_iff {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (b : OrderBasisCertificate K n) (p : ℕ) (hp : Nat.Prime p) :
 multiplierRing (pRadicalLattice b.order p)=b.order ↔ IsPMaximal b.order p := by sorry

/- Integral basis certificate -/
structure IntegralBasisCertificate (K : Type*) [Field K] [NumberField K] where
 rank : ℕ
 orderBasis : OrderBasisCertificate K rank
 maximal : ∀ x : K, x∈orderBasis.order ↔ IsIntegral ℤ x
theorem IntegralBasisCertificate.mem_iff {K : Type*} [Field K] [NumberField K] (b : IntegralBasisCertificate K) (x : K) : x∈b.orderBasis.order ↔ IsIntegral ℤ x := by sorry
theorem IntegralBasisCertificate.rank_eq {K : Type*} [Field K] [NumberField K] (b : IntegralBasisCertificate K) : b.rank=Module.finrank ℚ K := by sorry
def IntegralBasisCertificate.integerBasis {K : Type*} [Field K] [NumberField K] (b : IntegralBasisCertificate K) : Basis (Fin b.rank) ℤ (NumberField.RingOfIntegers K) := by sorry
-- TauCeti.Computational.test_integral_basis_Q
example : ∃ b : IntegralBasisCertificate ℚ, b.rank=1 := by sorry
-- TauCeti.Computational.test_integral_basis_rank_zero
example {K : Type*} [Field K] [NumberField K] (b : IntegralBasisCertificate K) : 0 < b.rank := by sorry
-- TauCeti.Computational.test_integral_basis_half
example (b : IntegralBasisCertificate ℚ) : (1/2:ℚ)∉b.orderBasis.order := by sorry

/- Certified integral-basis algorithm -/
def integralBasisAlgorithm {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : IntegralBasisCertificate K := by sorry
theorem integralBasisAlgorithm_contains {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : b.order ≤ (integralBasisAlgorithm b).orderBasis.order := by sorry
theorem integralBasisAlgorithm_maximal {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) (x : K) : x∈(integralBasisAlgorithm b).orderBasis.order ↔ IsIntegral ℤ x := by sorry
theorem integralBasisAlgorithm_rank {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : (integralBasisAlgorithm b).rank=n := by sorry
-- TauCeti.Computational.test_integral_basis_algorithm_Q
example {n : ℕ} (b : OrderBasisCertificate ℚ n) : (integralBasisAlgorithm b).orderBasis.order=⊥ := by sorry
-- TauCeti.Computational.test_integral_basis_algorithm_one
example {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : (1:K)∈(integralBasisAlgorithm b).orderBasis.order := by sorry
-- TauCeti.Computational.test_integral_basis_algorithm_idempotent
example {K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) : (integralBasisAlgorithm (integralBasisAlgorithm b).orderBasis).orderBasis.order=(integralBasisAlgorithm b).orderBasis.order := by sorry

/- Prime-ideal decomposition certificate -/
structure PrimeIdealFactorCertificate (K : Type*) [Field K] [NumberField K] (p : ℕ) where
 factors : List (Ideal (NumberField.RingOfIntegers K) × ℕ)
 distinct : (factors.map Prod.fst).Nodup
 prime : ∀ x∈factors, x.1.IsPrime ∧ x.1≠⊥ ∧ 0 < x.2
 product : Ideal.span ({(p:NumberField.RingOfIntegers K)}:Set (NumberField.RingOfIntegers K))=(factors.map (fun x => x.1^x.2)).prod
theorem PrimeIdealFactorCertificate.reconstruct {K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p) : Ideal.span ({(p:NumberField.RingOfIntegers K)}:Set (NumberField.RingOfIntegers K))=(c.factors.map (fun x => x.1^x.2)).prod := by sorry
theorem PrimeIdealFactorCertificate.exponent_pos {K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p) (x) (h : x∈c.factors) : 0 < x.2 := by sorry
theorem PrimeIdealFactorCertificate.nonempty {K : Type*} [Field K] [NumberField K] {p : ℕ} (hp : p.Prime) (c : PrimeIdealFactorCertificate K p) : c.factors≠[] := by sorry
-- TauCeti.Computational.test_prime_factor_Q
example (p : ℕ) (hp : p.Prime) : ∃ c : PrimeIdealFactorCertificate ℚ p, c.factors.length=1 ∧ ∀ x∈c.factors, x.2=1 := by sorry
-- TauCeti.Computational.test_prime_factor_zero_exponent
example {K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p) (I : Ideal (NumberField.RingOfIntegers K)) : (I,0)∉c.factors := by sorry
-- TauCeti.Computational.test_prime_factor_bottom
example {K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p) (e : ℕ) : (⊥,e)∉c.factors := by sorry

/- Checked class-group relation lattice -/
def classRelationLattice {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) : Submodule ℤ (Fin n → ℤ) := by sorry
theorem mem_classRelationLattice {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (a : Fin n → ℤ) :
 a∈classRelationLattice I ↔ ∏ i, (ClassGroup.mk0 (I i))^(a i)=1 := by sorry
theorem classRelationLattice_zero {K : Type*} [Field K] [NumberField K] {n : ℕ} (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) : (0:Fin n → ℤ)∈classRelationLattice I := by sorry
theorem classRelationLattice_neg {K : Type*} [Field K] [NumberField K] {n : ℕ} (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (a : Fin n → ℤ) : -a∈classRelationLattice I ↔ a∈classRelationLattice I := by sorry
-- TauCeti.Computational.test_relations_empty
example {K : Type*} [Field K] [NumberField K] (I : Fin 0 → (Ideal (NumberField.RingOfIntegers K))⁰) : classRelationLattice I=⊤ := by sorry
-- TauCeti.Computational.test_relations_unit_ideals
example {K : Type*} [Field K] [NumberField K] (n : ℕ) : classRelationLattice (fun _ : Fin n => (1:(Ideal (NumberField.RingOfIntegers K))⁰))=⊤ := by sorry
-- TauCeti.Computational.test_relations_subtraction
example {K : Type*} [Field K] [NumberField K] {n : ℕ} (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (a b : Fin n → ℤ) (ha : a∈classRelationLattice I) (hb : b∈classRelationLattice I) : a-b∈classRelationLattice I := by sorry

/- Relation quotient covers the class group -/
theorem classNumber_dvd_relation_index {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (L : Submodule ℤ (Fin n → ℤ))
 (hL : L ≤ classRelationLattice I)
 (hgen : Subgroup.closure (Set.range (fun i => ClassGroup.mk0 (I i)))=⊤)
 (hfin : Finite ((Fin n → ℤ) ⧸ L)) :
 NumberField.classNumber K ∣ Nat.card ((Fin n → ℤ) ⧸ L) := by sorry

/- Certified Minkowski factor-base generation -/
theorem minkowski_factorBase_generates {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (B : ℝ)
 (hB : (4/Real.pi)^NumberField.InfinitePlace.nrComplexPlaces K *
 ((Module.finrank ℚ K).factorial / (Module.finrank ℚ K:ℝ)^(Module.finrank ℚ K) * Real.sqrt |(NumberField.discr K:ℝ)|)  ≤  B)
 (hcover : ∀ P : (Ideal (NumberField.RingOfIntegers K))⁰, (P:Ideal (NumberField.RingOfIntegers K)).IsPrime →
 (Ideal.absNorm (P:Ideal (NumberField.RingOfIntegers K)):ℝ) ≤ B → P∈Set.range I) :
 Subgroup.closure (Set.range (fun i => ClassGroup.mk0 (I i)))=⊤ := by sorry

/- Certified completion of class and unit computations -/
theorem certified_class_unit_complete {K : Type*} [Field K] [NumberField K] {n : ℕ}
 (I : Fin n → (Ideal (NumberField.RingOfIntegers K))⁰) (L : Submodule ℤ (Fin n → ℤ))
 (hL : L ≤ classRelationLattice I) (hgen : Subgroup.closure (Set.range (fun i => ClassGroup.mk0 (I i)))=⊤)
 (hfin : Finite ((Fin n → ℤ) ⧸ L))
 (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
 (hu : NumberField.Units.IsMaxRank u)
 (hb : (Nat.card ((Fin n → ℤ) ⧸ L):ℝ)*NumberField.Units.regOfFamily u  <
 2*(NumberField.classNumber K:ℝ)*NumberField.Units.regulator K) :
 Nat.card ((Fin n → ℤ) ⧸ L)=NumberField.classNumber K ∧
 Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K=⊤ := by sorry

/- Exact φ-adic polynomial expansion -/
def phiExpansion {R : Type*} [CommRing R] (φ : Polynomial R) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (f : Polynomial R) : ℕ → Polynomial R := by sorry
theorem phiExpansion_reconstruct {R : Type*} [CommRing R] (φ : Polynomial R) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (f : Polynomial R) : f=∑ i∈Finset.range (f.natDegree/φ.natDegree+1), phiExpansion φ hφ hm f i*φ^i := by sorry
theorem phiExpansion_degree {R : Type*} [CommRing R] (φ : Polynomial R) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (f : Polynomial R) (i : ℕ) : (phiExpansion φ hφ hm f i).natDegree < φ.natDegree := by sorry
theorem phiExpansion_eventually_zero {R : Type*} [CommRing R] (φ : Polynomial R) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (f : Polynomial R) (i : ℕ) (hi : f.natDegree/φ.natDegree < i) : phiExpansion φ hφ hm f i=0 := by sorry
-- TauCeti.Computational.test_phi_zero
example (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) : phiExpansion φ hφ hm 0=0 := by sorry
-- TauCeti.Computational.test_phi_X
example (f : Polynomial ℤ) (i : ℕ) : phiExpansion X (by sorry) (by sorry) f i=C (f.coeff i) := by sorry
-- TauCeti.Computational.test_phi_shift
example : phiExpansion (X-1:Polynomial ℤ) (by sorry) (by sorry) (X^2) 1=C 2 := by sorry

/- Valuation of a φ-coefficient -/
def coefficientValuation (p : ℕ) (a : Polynomial ℤ) : WithTop ℕ := by sorry
theorem coefficientValuation_zero (p : ℕ) : coefficientValuation p 0=⊤ := by sorry
theorem coefficientValuation_const (p : ℕ) (a : ℤ) (ha : a≠0) : coefficientValuation p (C a)=((padicValInt p a:ℕ):WithTop ℕ) := by sorry
theorem coefficientValuation_ge_iff (p : ℕ) (hp : p.Prime) (a : Polynomial ℤ) (N : ℕ) : (N:WithTop ℕ) ≤ coefficientValuation p a ↔ ∀ i, (p:ℤ)^N∣a.coeff i := by sorry
-- TauCeti.Computational.test_gauss_zero
example : coefficientValuation 3 0=⊤ := by sorry
-- TauCeti.Computational.test_gauss_three
example : coefficientValuation 3 (C 3*X+C 9)=1 := by sorry
-- TauCeti.Computational.test_gauss_missing_coefficient
example : coefficientValuation 3 (X^2)=0 := by sorry

/- Finite local expansion certificate -/
structure LocalExpansionCertificate (L : Type*) [NormedField L] (π x : L) (N : ℕ) where
 valuation : ℤ
 digits : Fin N → L
 integral : ∀ i, ‖digits i‖ ≤ 1
 remainder : ‖x-π^valuation*(∑ i, digits i*π^i.val)‖ ≤ ‖π‖^(valuation+(N:ℤ))
def LocalExpansionCertificate.center {L : Type*} [NormedField L] {π x : L} {N : ℕ} (c : LocalExpansionCertificate L π x N) : L := π^c.valuation*(∑ i, c.digits i*π^i.val)
theorem LocalExpansionCertificate.error_bound {L : Type*} [NormedField L] {π x : L} {N : ℕ} (c : LocalExpansionCertificate L π x N) : ‖x-c.center‖ ≤ ‖π‖^(c.valuation+(N:ℤ)) := by sorry
theorem LocalExpansionCertificate.integral_digits {L : Type*} [NormedField L] {π x : L} {N : ℕ} (c : LocalExpansionCertificate L π x N) (i : Fin N) : ‖c.digits i‖ ≤ 1 := by sorry
-- TauCeti.Computational.test_local_zero
example {L : Type*} [NormedField L] (π : L) (hπ : π≠0) (N : ℕ) : ∃ c : LocalExpansionCertificate L π 0 N, c.valuation=0 ∧ c.digits=0 := by sorry
-- TauCeti.Computational.test_local_inverse_uniformizer
example {L : Type*} [NormedField L] (π : L) (hπ : π≠0) : ∃ c : LocalExpansionCertificate L π π⁻¹ 1, c.valuation= -1 ∧ c.digits 0=1 := by sorry
-- TauCeti.Computational.test_local_false_zero_approximation
example {L : Type*} [NormedField L] (π : L) (hπ : ‖π‖ < 1) : ¬∃ c : LocalExpansionCertificate L π 1 1, c.valuation=0 ∧ c.digits=0 := by sorry

/- A finite negative φ-Newton side -/
def IsPhiNewtonSide (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree)
 (f : Polynomial ℤ) (s u e h d : ℕ) : Prop :=
 0 < e ∧ 0 < h ∧ 0 < d ∧ Nat.Coprime e h ∧ h*d ≤ u ∧
 coefficientValuation p (phiExpansion φ hφ hm f s)=(u:WithTop ℕ) ∧
 coefficientValuation p (phiExpansion φ hφ hm f (s+e*d))=((u-h*d:ℕ):WithTop ℕ) ∧
 (∀ i, ((e*u+h*s:ℕ):WithTop ℕ) ≤ (e:WithTop ℕ)*coefficientValuation p (phiExpansion φ hφ hm f i)+(h*i:ℕ)) ∧
 (∀ i, (e:WithTop ℕ)*coefficientValuation p (phiExpansion φ hφ hm f i)+(h*i:ℕ)=((e*u+h*s:ℕ):WithTop ℕ) → s ≤ i ∧ i ≤ s+e*d)
theorem phiSide_denominator_pos (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : 0 < e := by sorry
theorem phiSide_left_nonzero (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : phiExpansion φ hφ hm f s≠0 := by sorry
theorem phiSide_length_pos (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : 0 < e*d := by sorry
-- TauCeti.Computational.test_phiSide_eisenstein
example : IsPhiNewtonSide 3 X (by sorry) (by sorry) (X^2-3) 0 1 2 1 1 := by sorry
-- TauCeti.Computational.test_phiSide_zero
example (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (s u e h d : ℕ) : ¬IsPhiNewtonSide p φ hφ hm 0 s u e h d := by sorry
-- TauCeti.Computational.test_phiSide_wrong_slope
example : ¬IsPhiNewtonSide 3 X (by sorry) (by sorry) (X^2-3) 0 2 1 1 2 := by sorry

/- Residual polynomial of a φ-Newton side -/
def phiResidualPolynomial (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree)
 (f : Polynomial ℤ) (s u e h d : ℕ) : Polynomial (AdjoinRoot (φ.map (Int.castRingHom (ZMod p)))) :=
 ∑ j∈Finset.range (d+1), monomial j (AdjoinRoot.mk (φ.map (Int.castRingHom (ZMod p)))
 (((phiExpansion φ hφ hm f (s+e*j)).sum (fun i a => monomial i (a/(p:ℤ)^(u-h*j)))).map (Int.castRingHom (ZMod p))))
theorem phiResidual_degree_le (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (f : Polynomial ℤ) (s u e h d : ℕ) : (phiResidualPolynomial p φ hφ hm f s u e h d).natDegree ≤ d := by sorry
theorem phiResidual_degree (p : ℕ) [Fact p.Prime] (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : (phiResidualPolynomial p φ hφ hm f s u e h d).natDegree=d := by sorry
theorem phiResidual_constant_ne_zero (p : ℕ) [Fact p.Prime] (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (f : Polynomial ℤ) (s u e h d : ℕ) (H : IsPhiNewtonSide p φ hφ hm f s u e h d) : (phiResidualPolynomial p φ hφ hm f s u e h d).coeff 0≠0 := by sorry
-- TauCeti.Computational.test_residual_eisenstein
example : phiResidualPolynomial 3 X (by sorry) (by sorry) (X^2-3) 0 1 2 1 1=X-1 := by sorry
-- TauCeti.Computational.test_residual_zero
example (p : ℕ) (φ : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (s u e h d : ℕ) : phiResidualPolynomial p φ hφ hm 0 s u e h d=0 := by sorry
-- TauCeti.Computational.test_residual_repeated
example : phiResidualPolynomial 3 X (by sorry) (by sorry) ((X-3)^2) 0 2 1 1 2=(X-1)^2 := by sorry

/- Ore residual irreducibility criterion -/
theorem ore_residual_irreducible (p : ℕ) [Fact p.Prime]
 (φ f : Polynomial ℤ) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (hf : f.Monic)
 (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (e h d : ℕ)
 (H : IsPhiNewtonSide p φ hφ hm f 0 (h*d) e h d)
 (hred : f.map (Int.castRingHom (ZMod p))=(φ.map (Int.castRingHom (ZMod p)))^(e*d))
 (hR : Irreducible (phiResidualPolynomial p φ hφ hm f 0 (h*d) e h d)) :
 Irreducible (f.map (Int.castRingHom ℚ_[p])) := by sorry
-- Intrinsic ramification/residue-degree conclusions require the owner's local-extension
-- carrier and normalization bridge; those conclusions are omitted here, as the README specifies.

/-! ## CN.3 -/

/- Integral q-expansion lattice -/
def integralModularLattice (k : ℤ) : Submodule ℤ (ModularForm 𝒮ℒ k) := by sorry
theorem mem_integralModularLattice (k : ℤ) (f : ModularForm 𝒮ℒ k) : f∈integralModularLattice k ↔ ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n=(a:ℂ) := by sorry
theorem integralModularLattice_zero (k : ℤ) : (0:ModularForm 𝒮ℒ k)∈integralModularLattice k := by sorry
theorem integralModularLattice_ext (k : ℤ) (f g : integralModularLattice k) (h : (f:ModularForm 𝒮ℒ k)=(g:ModularForm 𝒮ℒ k)) : f=g := by sorry
-- TauCeti.Computational.test_integral_modular_zero
example : (0:ModularForm 𝒮ℒ 0)∈integralModularLattice 0 := by sorry
-- TauCeti.Computational.test_integral_E4
example : ModularForm.E₄∈integralModularLattice 4 := by sorry
-- TauCeti.Computational.test_half_E4
example : ((1/2:ℂ) • ModularForm.E₄)∉integralModularLattice 4 := by sorry

/- Integral cusp-form lattice -/
def integralCuspLattice (k : ℤ) : Submodule ℤ (CuspForm 𝒮ℒ k) := by sorry
theorem mem_integralCuspLattice (k : ℤ) (f : CuspForm 𝒮ℒ k) : f∈integralCuspLattice k ↔ ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n=(a:ℂ) := by sorry
theorem integralCuspLattice_coeff_zero (k : ℤ) (f : integralCuspLattice k) : (qExpansion 1 (f:CuspForm 𝒮ℒ k)).coeff 0=0 := by sorry
theorem integralCuspLattice_ext (k : ℤ) (f g : integralCuspLattice k) (h : (f:CuspForm 𝒮ℒ k)=(g:CuspForm 𝒮ℒ k)) : f=g := by sorry
-- TauCeti.Computational.test_integral_delta
example : CuspForm.discriminant∈integralCuspLattice 12 := by sorry
-- TauCeti.Computational.test_cusp_weight_zero
example : integralCuspLattice 0=⊥ := by sorry
-- TauCeti.Computational.test_half_delta
example : ((1/2:ℂ) • CuspForm.discriminant)∉integralCuspLattice 12 := by sorry

/- Integral Miller basis -/
def millerBasis (k : ℕ) (hk : Even k) :
 Basis (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) ℤ (integralCuspLattice (k:ℤ)) := by sorry
theorem millerBasis_coeff (k : ℕ) (hk : Even k)
 (i j : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) :
 (qExpansion 1 ((millerBasis k hk i : integralCuspLattice (k:ℤ)):CuspForm 𝒮ℒ (k:ℤ))).coeff (j.val+1)
 = if i=j then 1 else 0 := by sorry
theorem millerBasis_repr (k : ℕ) (hk : Even k) (f : integralCuspLattice (k:ℤ))
 (i : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) :
 (((millerBasis k hk).repr f i : ℤ):ℂ) = (qExpansion 1 (f:CuspForm 𝒮ℒ (k:ℤ))).coeff (i.val+1) := by sorry
theorem millerBasis_unique (k : ℕ) (hk : Even k)
 (b : Basis (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) ℤ (integralCuspLattice (k:ℤ)))
 (h : ∀ i j, (qExpansion 1 (b i:CuspForm 𝒮ℒ (k:ℤ))).coeff (j.val+1) = if i=j then 1 else 0) : b=millerBasis k hk := by sorry
-- TauCeti.Computational.test_miller_weight_zero
example : Module.finrank ℂ (CuspForm 𝒮ℒ 0)=0 := by sorry
-- TauCeti.Computational.test_miller_delta
example (i : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (12:ℤ)))) : (millerBasis 12 (by sorry) i : CuspForm 𝒮ℒ 12) = CuspForm.discriminant := by sorry
-- TauCeti.Computational.test_miller_weight_two
example : Module.finrank ℂ (CuspForm 𝒮ℒ 2)=0 := by sorry

/- Level-one congruence Sturm bound -/
theorem levelOne_congruence_sturm (k p : ℕ) (hp : Nat.Prime p)
 (f : integralModularLattice (k:ℤ))
 (h : ∀ n ≤ k/12, ∃ a : ℤ, (p:ℤ)∣a ∧ (qExpansion 1 (f:ModularForm 𝒮ℒ (k:ℤ))).coeff n=(a:ℂ)) :
 ∀ n, ∃ a : ℤ, (p:ℤ)∣a ∧ (qExpansion 1 (f:ModularForm 𝒮ℒ (k:ℤ))).coeff n=(a:ℂ) := by sorry

/- The coefficient at 107 of ΔE₄²E₆ -/
theorem weight26_coeff_107 :
 (qExpansion 1 (fun z : ℍ => ModularForm.discriminant z * ModularForm.E₄ z ^ 2 * ModularForm.E₆ z)).coeff 107
 = (35830422465487817813321292:ℂ) := by sorry

/- Ordinary reduction at 107 -/
theorem weight26_ordinary_107 : (35830422465487817813321292:ZMod 107) = -1 := by sorry

/- Level-one Hecke recurrence contract -/
def HasLevelOnePrimeRecurrence (k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) : Prop :=
 ∀ (f : CuspForm 𝒮ℒ (k:ℤ)) (m : ℕ), (qExpansion 1 (T f)).coeff m=
 (qExpansion 1 f).coeff (p*m) + if p∣m then (p:ℂ)^(k-1)*(qExpansion 1 f).coeff (m/p) else 0
theorem heckeRecurrence_coeff_one (k p : ℕ) (hp : 1 < p) (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (h : HasLevelOnePrimeRecurrence k p T) (f : CuspForm 𝒮ℒ (k:ℤ)) : (qExpansion 1 (T f)).coeff 1=(qExpansion 1 f).coeff p := by sorry
theorem heckeRecurrence_unique (k p : ℕ) (T U : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T) (hU : HasLevelOnePrimeRecurrence k p U) : T=U := by sorry
theorem heckeRecurrence_preserves_integrality (k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (h : HasLevelOnePrimeRecurrence k p T) (f : CuspForm 𝒮ℒ (k:ℤ)) (hf : f∈integralCuspLattice (k:ℤ)) : T f∈integralCuspLattice (k:ℤ) := by sorry
-- TauCeti.Computational.test_hecke_weight_two
example : HasLevelOnePrimeRecurrence 2 2 0 := by sorry
-- TauCeti.Computational.test_hecke_delta
example : HasLevelOnePrimeRecurrence 12 2 ((-24:ℂ) • (LinearMap.id:Module.End ℂ (CuspForm 𝒮ℒ 12))) := by sorry
-- TauCeti.Computational.test_hecke_zero_wrong
example : ¬HasLevelOnePrimeRecurrence 12 2 0 := by sorry

/- Integral Hecke matrix in the Miller basis -/
def integralHeckeMatrix (k p : ℕ) (hk : Even k)
 (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T) :
 Matrix (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) ℤ := by sorry
theorem integralHeckeMatrix_entry (k p : ℕ) (hk : Even k)
 (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T)
 (i j : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) :
 ((integralHeckeMatrix k p hk T hT i j:ℤ):ℂ)=
 (qExpansion 1 (T (millerBasis k hk j:CuspForm 𝒮ℒ (k:ℤ)))).coeff (i.val+1) := by sorry
theorem integralHeckeMatrix_repr (k p : ℕ) (hk : Even k)
 (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T)
 (f g : integralCuspLattice (k:ℤ)) (hg : (g:CuspForm 𝒮ℒ (k:ℤ))=T (f:CuspForm 𝒮ℒ (k:ℤ))) :
 (millerBasis k hk).repr g=Finsupp.equivFunOnFinite.symm ((integralHeckeMatrix k p hk T hT).mulVec (fun i => (millerBasis k hk).repr f i)) := by sorry
theorem integralHeckeMatrix_unique (k p : ℕ) (hk : Even k)
 (T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ))) (hT : HasLevelOnePrimeRecurrence k p T)
 (A : Matrix (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)))) ℤ)
 (hA : ∀ i j, (A i j:ℂ)=(qExpansion 1 (T (millerBasis k hk j:CuspForm 𝒮ℒ (k:ℤ)))).coeff (i.val+1)) : A=integralHeckeMatrix k p hk T hT := by sorry
-- TauCeti.Computational.test_hecke_matrix_empty
example (T : Module.End ℂ (CuspForm 𝒮ℒ 2)) (hT : HasLevelOnePrimeRecurrence 2 2 T) : (integralHeckeMatrix 2 2 (by sorry) T hT).det=1 := by sorry
-- TauCeti.Computational.test_hecke_matrix_delta
example (T : Module.End ℂ (CuspForm 𝒮ℒ 12)) (hT : HasLevelOnePrimeRecurrence 12 2 T) : (integralHeckeMatrix 12 2 (by sorry) T hT).det= -24 := by sorry
-- TauCeti.Computational.test_hecke_matrix_ordinary
example : (-24:ZMod 2)=0 := by sorry

/- Nonordinary determinant at weight 38 and prime 79 -/
theorem weight38_nonordinary_det (T : Module.End ℂ (CuspForm 𝒮ℒ 38))
 (hT : HasLevelOnePrimeRecurrence 38 79 T) :
 ((integralHeckeMatrix 38 79 (by sorry) T hT).det:ZMod 79)=0 ∧ Nat.Coprime 37 80 := by sorry

/- Certified nonordinary weight-prime pair -/
def NonordinaryLevelOnePair (k p : ℕ) : Prop :=
 p.Prime ∧ 2 ≤ k ∧ ∃ hk : Even k, ∃ T : Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ)),
 ∃ hT : HasLevelOnePrimeRecurrence k p T, ((integralHeckeMatrix k p hk T hT).det:ZMod p)=0
theorem nonordinary_pair_prime {k p : ℕ} (h : NonordinaryLevelOnePair k p) : p.Prime := by sorry
theorem nonordinary_pair_even {k p : ℕ} (h : NonordinaryLevelOnePair k p) : Even k ∧ 2 ≤ k := by sorry
theorem nonordinary_pair_nonzero_dimension {k p : ℕ} (h : NonordinaryLevelOnePair k p) : 0 < Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)) := by sorry
-- TauCeti.Computational.test_nonordinary_38_79
example : NonordinaryLevelOnePair 38 79 := by sorry
-- TauCeti.Computational.test_nonordinary_weight_two
example (p : ℕ) : ¬NonordinaryLevelOnePair 2 p := by sorry
-- TauCeti.Computational.test_nonordinary_26_107
example : ¬NonordinaryLevelOnePair 26 107 := by sorry

/- The first two nonordinary level-one primes -/
theorem small_nonordinary_primes (p : ℕ) (hp : p ≤ 79) :
 (∃ k : ℕ, k < p ∧ NonordinaryLevelOnePair k p) ↔ p=59 ∨ p=79 := by sorry

/- Nonordinary pairs below 200 -/
theorem nonordinary_pairs_lt_200 (p k : ℕ) (hp : p < 200) (hk : k < p) :
 NonordinaryLevelOnePair k p ↔ (p,k)∈([(59,16),(59,46),(79,38),(79,44),(107,28),(107,82),(131,40),(131,94),(139,36),(139,106),(151,60),(151,94),(173,24),(173,152),(193,72),(193,124)] : List (ℕ×ℕ)) := by sorry

/- Complete companion eigensystem at weight 82 -/
theorem weight82_companion_system [Fact (Nat.Prime 107)]
 (a : ℕ → ℤ)
 (ha : ∀ n, (a n:ℂ)=(qExpansion 1 (fun z : ℍ => ModularForm.discriminant z * ModularForm.E₄ z^2 * ModularForm.E₆ z)).coeff n)
 (T : ℕ → Module.End ℂ (CuspForm 𝒮ℒ 82))
 (hT : ∀ ℓ, ℓ.Prime → HasLevelOnePrimeRecurrence 82 ℓ (T ℓ)) :
 ∃ v : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ 82)) → AlgebraicClosure (ZMod 107), v≠0 ∧
 ∀ (ℓ : ℕ) (hℓ : ℓ.Prime), ℓ≠107 →
 (fun i => ∑ j, ((integralHeckeMatrix 82 ℓ (by sorry) (T ℓ) (hT ℓ hℓ) i j:ℤ):AlgebraicClosure (ZMod 107))*v j)
 = fun i => (ℓ:AlgebraicClosure (ZMod 107))^81*(a ℓ:AlgebraicClosure (ZMod 107))*v i := by sorry

/- Ordinary level-one companion pair -/
def OrdinaryCompanionPair (p k : ℕ) [Fact p.Prime] : Prop :=
 let F := AlgebraicClosure (ZMod p)
 2 ≤ k ∧ k < p ∧ ∃ hk : Even k, ∃ hk' : Even (p+1-k),
 ∃ T : ℕ → Module.End ℂ (CuspForm 𝒮ℒ (k:ℤ)),
 ∃ U : ℕ → Module.End ℂ (CuspForm 𝒮ℒ ((p+1-k:ℕ):ℤ)),
 ∃ hT : ∀ ℓ, ℓ.Prime → HasLevelOnePrimeRecurrence k ℓ (T ℓ),
 ∃ hU : ∀ ℓ, ℓ.Prime → HasLevelOnePrimeRecurrence (p+1-k) ℓ (U ℓ),
 ∃ v : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ))) → F,
 ∃ w : Fin (Module.finrank ℂ (CuspForm 𝒮ℒ ((p+1-k:ℕ):ℤ))) → F,
 ∃ a : ℕ → F, v≠0 ∧ w≠0 ∧ a p≠0 ∧
 (∀ (ℓ : ℕ) (hℓ : ℓ.Prime),
   (fun i => ∑ j, ((integralHeckeMatrix k ℓ hk (T ℓ) (hT ℓ hℓ) i j:ℤ):F)*v j)=fun i => a ℓ*v i) ∧
 (∀ (ℓ : ℕ) (hℓ : ℓ.Prime), ℓ≠p →
   (fun i => ∑ j, ((integralHeckeMatrix (p+1-k) ℓ hk' (U ℓ) (hU ℓ hℓ) i j:ℤ):F)*w j)=
     fun i => (ℓ:F)^(p-k)*a ℓ*w i)
theorem ordinaryCompanionPair_weight (p k : ℕ) [Fact p.Prime] (h : OrdinaryCompanionPair p k) : 2 ≤ k ∧ k < p ∧ Even k := by sorry
theorem ordinaryCompanionPair_dimension (p k : ℕ) [Fact p.Prime] (h : OrdinaryCompanionPair p k) : 0 < Module.finrank ℂ (CuspForm 𝒮ℒ (k:ℤ)) := by sorry
theorem ordinaryCompanionPair_companion_dimension (p k : ℕ) [Fact p.Prime] (h : OrdinaryCompanionPair p k) : 0 < Module.finrank ℂ (CuspForm 𝒮ℒ ((p+1-k:ℕ):ℤ)) := by sorry
-- TauCeti.Computational.test_companion_107
example [Fact (Nat.Prime 107)] : OrdinaryCompanionPair 107 26 := by sorry
-- TauCeti.Computational.test_companion_low_prime
example [Fact (Nat.Prime 2)] (k : ℕ) : ¬OrdinaryCompanionPair 2 k := by sorry
-- TauCeti.Computational.test_companion_weight_two
example (p : ℕ) [Fact p.Prime] : ¬OrdinaryCompanionPair p 2 := by sorry

/- Corrected ordinary companion witnesses -/
theorem corrected_ordinary_companion_list (p k : ℕ) [Fact p.Prime]
 (h : (p,k)∈([(107,26),(139,20),(173,68),(179,30),(191,30),(193,48)] : List (ℕ×ℕ))) :
 OrdinaryCompanionPair p k ∧ Nat.Coprime (k-1) (p-1) := by sorry

/- Exact equality of certified modular data -/
def modularDataEqual (B : ℕ) (a b : Fin (B+1) → AlgebraicRootCertificate) : Bool := by
 classical
 exact decide (∀ i, algebraicEqual (a i) (b i)=true)
theorem modularDataEqual_iff (B : ℕ) (a b : Fin (B+1) → AlgebraicRootCertificate) : modularDataEqual B a b=true ↔ ∀ i, (a i).value=(b i).value := by sorry
theorem modularDataEqual_sound (Γ : Subgroup SL(2,ℤ)) [Γ.FiniteIndex] (k : ℤ)
 (f g : ModularForm (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)) k)
 (a b : Fin ((k*Γ.index).toNat/12+1) → AlgebraicRootCertificate)
 (ha : ∀ i, ((a i).value:ℂ)=(qExpansion (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f).coeff i.val)
 (hb : ∀ i, ((b i).value:ℂ)=(qExpansion (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)).strictWidthInfty g).coeff i.val)
 (H : modularDataEqual ((k*Γ.index).toNat/12) a b=true) : f=g := by sorry
theorem modularDataEqual_symm (B : ℕ) (a b : Fin (B+1) → AlgebraicRootCertificate) : modularDataEqual B a b=modularDataEqual B b a := by sorry
-- TauCeti.Computational.test_modular_data_constant
example : modularDataEqual 0 (fun _ => rationalRootCertificate 0) (fun _ => rationalRootCertificate 1)=false := by sorry
-- TauCeti.Computational.test_modular_data_equal
example (B : ℕ) (a : Fin (B+1) → AlgebraicRootCertificate) : modularDataEqual B a a=true := by sorry
-- TauCeti.Computational.test_modular_data_delta
example : modularDataEqual 1 (fun i => rationalRootCertificate (if i.val=0 then 0 else 1)) (fun _ => rationalRootCertificate 0)=false := by sorry

/-! ## CN.4 -/

/- Rational interval multiplication -/
def intervalMul (I J : NonemptyInterval ℚ) : NonemptyInterval ℚ :=
  ⟨(min (min (I.fst*J.fst) (I.fst*J.snd)) (min (I.snd*J.fst) (I.snd*J.snd)),
    max (max (I.fst*J.fst) (I.fst*J.snd)) (max (I.snd*J.fst) (I.snd*J.snd))), by sorry⟩
theorem intervalMul_lower (I J : NonemptyInterval ℚ) :
 (intervalMul I J).fst = min (min (I.fst*J.fst) (I.fst*J.snd)) (min (I.snd*J.fst) (I.snd*J.snd)) := by sorry
theorem intervalMul_comm (I J : NonemptyInterval ℚ) : intervalMul I J = intervalMul J I := by sorry
theorem intervalMul_pure (a b : ℚ) : intervalMul (NonemptyInterval.pure a) (NonemptyInterval.pure b) = NonemptyInterval.pure (a*b) := by sorry
-- TauCeti.Computational.test_intervalMul_signed
example : intervalMul ⟨(-2,3), by sorry⟩ ⟨(-4,5), by sorry⟩ = ⟨(-12,15), by sorry⟩ := by sorry
-- TauCeti.Computational.test_intervalMul_zero
example (I : NonemptyInterval ℚ) : intervalMul (NonemptyInterval.pure 0) I = NonemptyInterval.pure 0 := by sorry
-- TauCeti.Computational.test_intervalMul_crossing
example : (intervalMul ⟨(-1,1), by sorry⟩ ⟨(-1,1), by sorry⟩).fst = -1 := by sorry

/- Enclosure under multiplication -/
theorem intervalMul_sound (I J : NonemptyInterval ℚ) (x y : ℝ)
 (hx : (I.fst:ℝ)  ≤  x ∧ x  ≤  (I.snd:ℝ)) (hy : (J.fst:ℝ)  ≤  y ∧ y  ≤  (J.snd:ℝ)) :
 ((intervalMul I J).fst:ℝ)  ≤  x*y ∧ x*y  ≤  ((intervalMul I J).snd:ℝ) := by sorry

/- Partial interval reciprocal -/
def intervalInv (I : NonemptyInterval ℚ) : Option (NonemptyInterval ℚ) :=
 if h : I.fst  ≤  0 ∧ 0  ≤  I.snd then none else some ⟨(I.snd⁻¹,I.fst⁻¹), by sorry⟩
theorem intervalInv_involutive (I J : NonemptyInterval ℚ) (h : intervalInv I=some J) : intervalInv J=some I := by sorry
theorem intervalInv_none (I : NonemptyInterval ℚ) : intervalInv I = none ↔ I.fst  ≤  0 ∧ 0  ≤  I.snd := by sorry
theorem intervalInv_endpoints (I J : NonemptyInterval ℚ) (h : intervalInv I = some J) : J.fst = I.snd⁻¹ ∧ J.snd = I.fst⁻¹ := by sorry
-- TauCeti.Computational.test_intervalInv_positive
example : intervalInv ⟨(2,4), by sorry⟩ = some ⟨(1/4,1/2), by sorry⟩ := by sorry
-- TauCeti.Computational.test_intervalInv_zero
example : intervalInv (NonemptyInterval.pure 0) = none := by sorry
-- TauCeti.Computational.test_intervalInv_negative
example : intervalInv ⟨(-4,-2), by sorry⟩ = some ⟨(-1/2,-1/4), by sorry⟩ := by sorry

/- Enclosure under reciprocal -/
theorem intervalInv_sound (I J : NonemptyInterval ℚ) (x : ℝ)
 (h : intervalInv I = some J) (hx : (I.fst:ℝ)  ≤  x ∧ x  ≤  (I.snd:ℝ)) :
 x ≠ 0 ∧ (J.fst:ℝ)  ≤  x⁻¹ ∧ x⁻¹  ≤  (J.snd:ℝ) := by sorry

/- Outward dyadic rounding -/
def dyadicHull (p : ℕ) (I : NonemptyInterval ℚ) : NonemptyInterval ℚ :=
 ⟨(((⌊(2:ℚ)^p*I.fst⌋:ℤ):ℚ)/(2:ℚ)^p,
    ((⌈(2:ℚ)^p*I.snd⌉:ℤ):ℚ)/(2:ℚ)^p), by sorry⟩
theorem dyadicHull_grid (p : ℕ) (I : NonemptyInterval ℚ) : (∃ a : ℤ, (dyadicHull p I).fst=(a:ℚ)/(2:ℚ)^p) ∧ ∃ b : ℤ, (dyadicHull p I).snd=(b:ℚ)/(2:ℚ)^p := by sorry
theorem dyadicHull_contains (p : ℕ) (I : NonemptyInterval ℚ) : (dyadicHull p I).fst  ≤  I.fst ∧ I.snd  ≤  (dyadicHull p I).snd := by sorry
theorem dyadicHull_idempotent (p : ℕ) (I : NonemptyInterval ℚ) : dyadicHull p (dyadicHull p I) = dyadicHull p I := by sorry
-- TauCeti.Computational.test_dyadicHull_third
example : dyadicHull 2 (NonemptyInterval.pure (1/3)) = ⟨(1/4,1/2), by sorry⟩ := by sorry
-- TauCeti.Computational.test_dyadicHull_negative
example : dyadicHull 0 (NonemptyInterval.pure (-1/3)) = ⟨(-1,0), by sorry⟩ := by sorry
-- TauCeti.Computational.test_dyadicHull_zero
example (p : ℕ) : dyadicHull p (NonemptyInterval.pure 0) = NonemptyInterval.pure 0 := by sorry

/- Width added by dyadic rounding -/
theorem dyadicHull_width (p : ℕ) (I : NonemptyInterval ℚ) :
 (dyadicHull p I).snd - (dyadicHull p I).fst  <  I.snd-I.fst + 2/(2:ℚ)^p := by sorry

/- Unique integer extraction -/
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

/- Recovery of a known integral value -/
theorem uniqueInteger_sound (I : NonemptyInterval ℚ) (z w : ℤ)
 (hz : (I.fst:ℝ)  ≤  (z:ℝ) ∧ (z:ℝ)  ≤  (I.snd:ℝ)) (h : uniqueInteger I = some w) : z=w := by sorry

/- Entrywise lower bounds on effective vectors -/
theorem effectiveGram_lower {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℝ) (x : Fin n → ℝ)
 (h : ∀ i j, B i j  ≤  A i j) (hx : ∀ i, 0  ≤  x i) :
 (∑ i, ∑ j, B i j*x i*x j)  ≤  ∑ i, ∑ j, A i j*x i*x j := by sorry

/- Loewner lower bounds on unrestricted vectors -/
theorem loewnerGram_lower {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℝ)
 (h : ∀ x : Fin n → ℝ, 0  ≤  ∑ i, ∑ j, (A i j-B i j)*x i*x j) (x : Fin n → ℝ) :
 (∑ i, ∑ j, B i j*x i*x j)  ≤  ∑ i, ∑ j, A i j*x i*x j := by sorry

/- Rational witness of Gram negativity -/
structure NegativeGramCertificate {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) where
 vector : Fin n → ℚ
 nonneg : ∀ i, 0  ≤  vector i
 nonzero : vector ≠ 0
 upper_neg : (∑ i, ∑ j, (I i j).snd*vector i*vector j)  <  0
theorem NegativeGramCertificate.upper_negative {n : ℕ} {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I) : (∑ i, ∑ j, (I i j).snd*c.vector i*c.vector j) < 0 := by sorry
theorem NegativeGramCertificate.vector_ne_zero {n : ℕ} {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I) : c.vector ≠ 0 := by sorry
def NegativeGramCertificate.scale {n : ℕ} {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I) (r : ℚ) (hr : 0 < r) : NegativeGramCertificate I := by sorry
theorem NegativeGramCertificate.scale_vector {n : ℕ} {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I) (r : ℚ) (hr : 0 < r) : (c.scale r hr).vector=fun i => r*c.vector i := by sorry
-- TauCeti.Computational.test_negativeGram_one
example : Nonempty (NegativeGramCertificate (n:=1) (fun _ _ => ⟨(-2,-1), by sorry⟩)) := by sorry
-- TauCeti.Computational.test_negativeGram_zero_dim
example (I : Matrix (Fin 0) (Fin 0) (NonemptyInterval ℚ)) : IsEmpty (NegativeGramCertificate I) := by sorry
-- TauCeti.Computational.test_negativeGram_crossing
example : IsEmpty (NegativeGramCertificate (n:=1) (fun _ _ => ⟨(-1,1), by sorry⟩)) := by sorry

/- Soundness of the negativity certificate -/
theorem NegativeGramCertificate.sound {n : ℕ}
 {I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)} (c : NegativeGramCertificate I)
 (A : Matrix (Fin n) (Fin n) ℝ)
 (hA : ∀ i j, ((I i j).fst:ℝ)  ≤  A i j ∧ A i j  ≤  ((I i j).snd:ℝ)) :
 (∑ i, ∑ j, A i j*(c.vector i:ℝ)*(c.vector j:ℝ))  <  0 := by sorry

/- Normalize a rational p-adic ball -/
def padicNormalize (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ) : PadicApproximation p := by sorry
theorem padicNormalize_precision (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ) : (padicNormalize p c N).precision=N := by sorry
theorem padicNormalize_denotation (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ) : (padicNormalize p c N).denotation={x : ℚ_[p] | ‖x-(c:ℚ_[p])‖ ≤ (p:ℝ)^(-N)} := by sorry
theorem padicNormalize_valuation (p : ℕ) [Fact p.Prime] (c : ℚ) (N : ℤ) : (padicNormalize p c N).valuation=if c=0 then N else min (padicValRat p c) N := by sorry
theorem padicNormalize_id {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : padicNormalize p a.center a.precision=a := by sorry
-- TauCeti.Computational.test_normalize_zero
example [Fact (Nat.Prime 3)] : (padicNormalize 3 0 5).valuation=5 ∧ (padicNormalize 3 0 5).mantissa=0 := by sorry
-- TauCeti.Computational.test_normalize_five
example [Fact (Nat.Prime 3)] : (padicNormalize 3 5 1).mantissa=2 := by sorry
-- TauCeti.Computational.test_normalize_cancellation
example [Fact (Nat.Prime 3)] : (padicNormalize 3 9 2).valuation=2 ∧ (padicNormalize 3 9 2).mantissa=0 := by sorry

/- Certified p-adic addition -/
def padicAdd {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) : PadicApproximation p := padicNormalize p (a.center+b.center) (min a.precision b.precision)
theorem padicAdd_precision {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) : (padicAdd a b).precision=min a.precision b.precision := by sorry
theorem padicAdd_sound {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) (x y : ℚ_[p]) (hx : x∈a.denotation) (hy : y∈b.denotation) : x+y∈(padicAdd a b).denotation := by sorry
theorem padicAdd_comm {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) : padicAdd a b=padicAdd b a := by sorry
-- TauCeti.Computational.test_padic_add_zero
example {p : ℕ} [Fact p.Prime] : (0:ℚ_[p])∈(padicAdd (padicNormalize p 0 0) (padicNormalize p 0 0)).denotation := by sorry
-- TauCeti.Computational.test_padic_add_centres
example {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) : ((a.center+b.center:ℚ):ℚ_[p])∈(padicAdd a b).denotation := by sorry
-- TauCeti.Computational.test_padic_add_unequal_precision
example [Fact (Nat.Prime 3)] : (padicAdd (padicNormalize 3 0 2) (padicNormalize 3 1 5)).precision=2 := by sorry

/- Certified p-adic multiplication -/
def padicMul {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) : PadicApproximation p := padicNormalize p (a.center*b.center) (min (a.valuation+b.precision) (a.precision+b.valuation))
theorem padicMul_precision {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) : (padicMul a b).precision=min (a.valuation+b.precision) (a.precision+b.valuation) := by sorry
theorem padicMul_sound {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) (x y : ℚ_[p]) (hx : x∈a.denotation) (hy : y∈b.denotation) : x*y∈(padicMul a b).denotation := by sorry
theorem padicMul_comm {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) : padicMul a b=padicMul b a := by sorry
-- TauCeti.Computational.test_padic_mul_zero
example {p : ℕ} [Fact p.Prime] : (0:ℚ_[p])∈(padicMul (padicNormalize p 0 0) (padicNormalize p 0 0)).denotation := by sorry
-- TauCeti.Computational.test_padic_mul_centres
example {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) : ((a.center*b.center:ℚ):ℚ_[p])∈(padicMul a b).denotation := by sorry
-- TauCeti.Computational.test_padic_mul_unequal_precision
example [Fact (Nat.Prime 3)] : (padicMul (padicNormalize 3 0 2) (padicNormalize 3 1 5)).precision=2 := by sorry
-- TauCeti.Computational.test_padic_mul_negative_valuation
example [Fact (Nat.Prime 3)] : let c := padicMul (padicNormalize 3 3 4) (padicNormalize 3 (1/3) 2); c.precision=3 ∧ c.center=1 := by sorry

/- Partial p-adic inversion -/
def padicInverse {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : Option (PadicApproximation p) := if a.mantissa=0 then none else some (padicNormalize p a.center⁻¹ (a.precision-2*a.valuation))
theorem padicInverse_none_iff {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) : padicInverse a=none ↔ (0:ℚ_[p])∈a.denotation := by sorry
theorem padicInverse_precision {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) (h : padicInverse a=some b) : b.precision=a.precision-2*a.valuation := by sorry
theorem padicInverse_sound {p : ℕ} [Fact p.Prime] (a b : PadicApproximation p) (h : padicInverse a=some b) (x : ℚ_[p]) (hx : x∈a.denotation) : x≠0 ∧ x⁻¹∈b.denotation := by sorry
-- TauCeti.Computational.test_padic_inverse_zero
example {p : ℕ} [Fact p.Prime] (N : ℤ) : padicInverse (padicNormalize p 0 N)=none := by sorry
-- TauCeti.Computational.test_padic_inverse_unit
example [Fact (Nat.Prime 3)] (b : PadicApproximation 3) (h : padicInverse (padicNormalize 3 1 4)=some b) : b.precision=4 := by sorry
-- TauCeti.Computational.test_padic_inverse_loss
example [Fact (Nat.Prime 3)] (b : PadicApproximation 3) (h : padicInverse (padicNormalize 3 3 4)=some b) : b.precision=2 := by sorry

/- Rational complex-box denotation -/
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

/- Odlyzko tail kernel -/
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

/- Geometric bound for the Odlyzko tail -/
theorem ctTailKernel_tail (α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ) :
 Summable (fun n : ℕ => ctTailKernel (α*(b+n))) ∧
 0 ≤ (∑' n : ℕ, ctTailKernel (α*(b+n)))-(∑ n∈Finset.range N, ctTailKernel (α*(b+n))) ∧
 (∑' n : ℕ, ctTailKernel (α*(b+n)))-(∑ n∈Finset.range N, ctTailKernel (α*(b+n)))
  ≤ ctTailKernel (α*(b+N))/(1-Real.exp (-α)) := by sorry

/- Alternating Odlyzko tail bound -/
theorem ctTailKernel_alternating_tail (α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ) :
 |(∑' n : ℕ, (-1:ℝ)^n*ctTailKernel (α*(b+n)))-
 (∑ n∈Finset.range N, (-1:ℝ)^n*ctTailKernel (α*(b+n)))|  ≤  ctTailKernel (α*(b+N)) := by sorry

/- Closed scalar formulas for CT evaluation -/
def ctExplicitFormula (ℓ : ℝ) (w : ℕ) : Fin 8 → ℝ :=
 let φ : ℂ → ℂ := fun z => (Complex.digamma ((z+1)/2)-Complex.digamma (z/2))/2
 let z₀ : ℂ := 1/2 + Complex.I*(Real.pi/ℓ:ℝ)
 let z₁ : ℂ := 1 + Complex.I*(Real.pi/ℓ:ℝ)
 let bF : ℝ := 1/2+(w:ℝ)/4
 let bG : ℝ := (1+(w:ℝ))/2
 let zF : ℂ := bF + Complex.I*(Real.pi/(2*ℓ):ℝ)
 let zG : ℂ := bG + Complex.I*(Real.pi/ℓ:ℝ)
 ![4*(φ z₀).re-4/Real.pi*(φ z₀).im+4/ℓ*(deriv φ z₀).re+
      4*ℓ*(∑' n : ℕ, (-1:ℝ)^n*ctTailKernel (ℓ*((n:ℝ)+1/2))),
   8*ℓ/Real.pi^2,
   Real.log Real.pi-(Complex.digamma zF).re+1/Real.pi*(Complex.digamma zF).im-
      1/(2*ℓ)*(deriv Complex.digamma zF).re+2*ℓ*(∑' n : ℕ, ctTailKernel (2*ℓ*(bF+n))),
   1+2*Real.pi/ℓ*(φ z₁).im+2*Real.pi/ℓ^2*(deriv φ z₁).im+
      2*ℓ*(∑' n : ℕ, (-1:ℝ)^(n+2)*(n+1)*ctTailKernel (ℓ*(n+1))),
   8*ℓ/Real.pi^2,
   4*Real.pi^2*ℓ*(1+Real.cosh (ℓ/2))/(ℓ^2/4+Real.pi^2)^2,
   Real.log (2*Real.pi)-(Complex.digamma zG).re+1/Real.pi*(Complex.digamma zG).im-
      1/ℓ*(deriv Complex.digamma zG).re+ℓ*(∑' n : ℕ, ctTailKernel (ℓ*(bG+n))),
   (φ z₀).re-1/Real.pi*(φ z₀).im+1/ℓ*(deriv φ z₀).re+
      ℓ*(∑' n : ℕ, (-1:ℝ)^n*ctTailKernel (ℓ*((n:ℝ)+1/2)))]
theorem ctExplicitFormula_shared_value (ℓ : ℝ) (w : ℕ) : ctExplicitFormula ℓ w 1=ctExplicitFormula ℓ w 4 := by sorry
theorem ctExplicitFormula_fourier (ℓ : ℝ) (w : ℕ) : ctExplicitFormula ℓ w 1=8*ℓ/Real.pi^2 := by sorry
theorem ctExplicitFormula_G_imag (ℓ : ℝ) (w : ℕ) : ctExplicitFormula ℓ w 5=4*Real.pi^2*ℓ*(1+Real.cosh (ℓ/2))/(ℓ^2/4+Real.pi^2)^2 := by sorry
-- TauCeti.Computational.test_ct_fourier_positive
example (ℓ : ℝ) (h : 0 < ℓ) (w : ℕ) : 0 < ctExplicitFormula ℓ w 1 := by sorry
-- TauCeti.Computational.test_ct_fourier_zero
example (w : ℕ) : ctExplicitFormula 0 w 1=0 := by sorry
-- TauCeti.Computational.test_ct_fourier_linear
example (ℓ : ℝ) (w : ℕ) : ctExplicitFormula (2*ℓ) w 1=2*ctExplicitFormula ℓ w 1 := by sorry

/- Certified rational enclosures of CT quantities -/
def ctEnclosure (ℓ : ℚ) (hℓ : 0 < ℓ) (w : ℕ) (q : Fin 8) (P : ℕ) : NonemptyInterval ℚ := by sorry
theorem ctEnclosure_sound (ℓ : ℚ) (hℓ : 0 < ℓ) (w : ℕ) (q : Fin 8) (P : ℕ) : ((ctEnclosure ℓ hℓ w q P).fst:ℝ) ≤ ctExplicitFormula (ℓ:ℝ) w q ∧ ctExplicitFormula (ℓ:ℝ) w q ≤ ((ctEnclosure ℓ hℓ w q P).snd:ℝ) := by sorry
theorem ctEnclosure_width (ℓ : ℚ) (hℓ : 0 < ℓ) (w : ℕ) (q : Fin 8) (P : ℕ) : (ctEnclosure ℓ hℓ w q P).snd-(ctEnclosure ℓ hℓ w q P).fst ≤ 1/(2:ℚ)^P := by sorry
theorem ctEnclosure_shared (ℓ : ℚ) (hℓ : 0 < ℓ) (w P : ℕ) : ctEnclosure ℓ hℓ w 1 P=ctEnclosure ℓ hℓ w 4 P := by sorry
-- TauCeti.Computational.test_ct_enclosure_unit
example (w : ℕ) : 4/5 < (ctEnclosure 1 (by sorry) w 1 8).fst ∧ (ctEnclosure 1 (by sorry) w 1 8).snd < 41/50 := by sorry
-- TauCeti.Computational.test_ct_enclosure_weight_zero
example (ℓ : ℚ) (hℓ : 0 < ℓ) (P : ℕ) : (ctEnclosure ℓ hℓ 0 2 P).fst ≤ (ctEnclosure ℓ hℓ 0 2 P).snd := by sorry
-- TauCeti.Computational.test_ct_enclosure_not_exact
example (w P : ℕ) : (ctEnclosure 1 (by sorry) w 1 P).fst < (ctEnclosure 1 (by sorry) w 1 P).snd := by sorry

/- Complete isolation of rational-polynomial roots -/
def isolatePolynomialRoots (f : Polynomial ℚ) (hf : f≠0) : List AlgebraicRootCertificate := by sorry
theorem isolatePolynomialRoots_polynomial (f : Polynomial ℚ) (hf : f≠0) (c : AlgebraicRootCertificate) (hc : c∈isolatePolynomialRoots f hf) : c.polynomial=f := by sorry
theorem isolatePolynomialRoots_complete (f : Polynomial ℚ) (hf : f≠0) (z : ℂ) : aeval z f=0 ↔ ∃ c∈isolatePolynomialRoots f hf, (c.value:ℂ)=z := by sorry
theorem isolatePolynomialRoots_nodup (f : Polynomial ℚ) (hf : f≠0) : ((isolatePolynomialRoots f hf).map AlgebraicRootCertificate.value).Nodup := by sorry
theorem isolatePolynomialRoots_disjoint (f : Polynomial ℚ) (hf : f≠0) (a b : AlgebraicRootCertificate) (ha : a∈isolatePolynomialRoots f hf) (hb : b∈isolatePolynomialRoots f hf) (hab : a≠b) : Disjoint (complexBoxSet (a.re,a.im)) (complexBoxSet (b.re,b.im)) := by sorry
-- TauCeti.Computational.test_isolate_constant
example : isolatePolynomialRoots (1:Polynomial ℚ) (by sorry)=[] := by sorry
-- TauCeti.Computational.test_isolate_repeated
example : (isolatePolynomialRoots (X^2:Polynomial ℚ) (by sorry)).length=1 := by sorry
-- TauCeti.Computational.test_isolate_complex
example : (isolatePolynomialRoots (X^2+1:Polynomial ℚ) (by sorry)).length=2 := by sorry

/- Certified continued Dirichlet L-values -/
def dirichletLBox (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)
 (z : ℚ × ℚ) (hz : χ≠1 ∨ (z.1:ℂ)+(z.2:ℂ)*Complex.I≠1) (P : ℕ) :
 NonemptyInterval ℚ × NonemptyInterval ℚ := by sorry
theorem dirichletLBox_sound (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (z : ℚ × ℚ) (hz : χ≠1 ∨ (z.1:ℂ)+(z.2:ℂ)*Complex.I≠1) (P : ℕ) : DirichletCharacter.LFunction χ ((z.1:ℂ)+(z.2:ℂ)*Complex.I)∈complexBoxSet (dirichletLBox q χ hχ z hz P) := by sorry
theorem dirichletLBox_width (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (z : ℚ × ℚ) (hz : χ≠1 ∨ (z.1:ℂ)+(z.2:ℂ)*Complex.I≠1) (P : ℕ) : (dirichletLBox q χ hχ z hz P).1.snd-(dirichletLBox q χ hχ z hz P).1.fst ≤ 1/(2:ℚ)^P ∧ (dirichletLBox q χ hχ z hz P).2.snd-(dirichletLBox q χ hχ z hz P).2.fst ≤ 1/(2:ℚ)^P := by sorry
theorem dirichletLBox_nonvanishing (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (z : ℚ × ℚ) (hz : χ≠1 ∨ (z.1:ℂ)+(z.2:ℂ)*Complex.I≠1) (P : ℕ) (h : (0:ℂ)∉complexBoxSet (dirichletLBox q χ hχ z hz P)) : DirichletCharacter.LFunction χ ((z.1:ℂ)+(z.2:ℂ)*Complex.I)≠0 := by sorry
-- TauCeti.Computational.test_lbox_zeta_two
example (P : ℕ) : riemannZeta 2∈complexBoxSet (dirichletLBox 1 1 (by sorry) (2,0) (by sorry) P) := by sorry
-- TauCeti.Computational.test_lbox_pole
example : ¬((1:DirichletCharacter ℂ 1)≠1 ∨ ((1:ℚ):ℂ)+((0:ℚ):ℂ)*Complex.I≠1) := by sorry
-- TauCeti.Computational.test_lbox_critical_line
example (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (P : ℕ) : DirichletCharacter.LFunction χ (1/2)∈complexBoxSet (dirichletLBox q χ hχ (1/2,0) (by sorry) P) := by sorry

/- Platt’s finite-conductor zero certificate target -/
theorem platt_bounded_height (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)
 (hχ : χ.IsPrimitive) (hq : q ≤ 400000) (s : ℂ) (hs : 0 < s.re ∧ s.re < 1)
 (ht : |s.im| ≤ max (100000000/(q:ℝ)) ((if Even q then 75000000 else 37500000)/(q:ℝ)+200))
 (hz : DirichletCharacter.LFunction χ s=0) : s.re=1/2 := by sorry

/- Platt’s central nonvanishing target -/
theorem platt_central_nonvanishing (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (hq : q ≤ 2000000) : DirichletCharacter.LFunction χ (1/2)≠0 := by sorry

/- No real zeros for conductor at most 400000 -/
theorem small_conductor_no_real_zero (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (hq : q ≤ 400000) (s : ℝ) (hs : 0 < s ∧ s < 1) : DirichletCharacter.LFunction χ (s:ℂ)≠0 := by sorry

/- Effective vectors from a certified ellipsoid cover -/
def effectiveEllipsoidCover {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ)
 (S : Finset (Fin n → ℤ)) : Finset (Fin n → ℤ) := by
 classical
 exact S.filter (fun x => (∀ i, 0 ≤ x i) ∧ (∑ i, ∑ j, B i j*(x i:ℚ)*(x j:ℚ)) ≤ c)
theorem mem_effectiveEllipsoidCover {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ) (S : Finset (Fin n → ℤ)) (x : Fin n → ℤ) : x∈effectiveEllipsoidCover B c S ↔ x∈S ∧ (∀ i, 0 ≤ x i) ∧ (∑ i, ∑ j, B i j*(x i:ℚ)*(x j:ℚ)) ≤ c := by sorry
theorem effectiveEllipsoidCover_subset {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ) (S : Finset (Fin n → ℤ)) : effectiveEllipsoidCover B c S⊆S := by sorry
theorem effectiveEllipsoidCover_complete {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ) (S : Finset (Fin n → ℤ)) (hS : ∀ x : Fin n → ℤ, (∑ i, ∑ j, B i j*(x i:ℚ)*(x j:ℚ)) ≤ c → x∈S) (x : Fin n → ℤ) (hx : ∀ i, 0 ≤ x i) (hB : (∑ i, ∑ j, B i j*(x i:ℚ)*(x j:ℚ)) ≤ c) : x∈effectiveEllipsoidCover B c S := by sorry
-- TauCeti.Computational.test_effective_cover_zero
example {n : ℕ} (B : Matrix (Fin n) (Fin n) ℚ) (c : ℚ) (hc : 0 ≤ c) : (0:Fin n → ℤ)∈effectiveEllipsoidCover B c {0} := by sorry
-- TauCeti.Computational.test_effective_cover_negative
example : (fun _ : Fin 1 => (-1:ℤ))∉effectiveEllipsoidCover (fun _ _ => (1:ℚ)) 2 {fun _ => (-1:ℤ)} := by sorry
-- TauCeti.Computational.test_effective_cover_boundary
example : (fun _ : Fin 1 => (1:ℤ))∈effectiveEllipsoidCover (fun _ _ => (1:ℚ)) 1 {fun _ => (1:ℤ)} := by sorry

/- Finite Gram-negativity checker -/
def checkNegativeGram {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) : Bool := by
 classical
 exact decide ((∀ i, 0 ≤ t i) ∧ t≠0 ∧ (∑ i, ∑ j, (I i j).snd*t i*t j) < 0)
theorem checkNegativeGram_iff {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) : checkNegativeGram I t=true ↔ (∀ i, 0 ≤ t i) ∧ t≠0 ∧ (∑ i, ∑ j, (I i j).snd*t i*t j) < 0 := by sorry
theorem checkNegativeGram_certificate {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) (h : checkNegativeGram I t=true) : ∃ c : NegativeGramCertificate I, c.vector=t := by sorry
theorem checkNegativeGram_scale {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) (r : ℚ) (hr : 0 < r) : checkNegativeGram I (fun i => r*t i)=checkNegativeGram I t := by sorry
-- TauCeti.Computational.test_check_negative
example : checkNegativeGram (n:=1) (fun _ _ => ⟨(-2,-1),by sorry⟩) (fun _ => 1)=true := by sorry
-- TauCeti.Computational.test_check_zero_vector
example {n : ℕ} (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) : checkNegativeGram I 0=false := by sorry
-- TauCeti.Computational.test_check_ambiguous_sign
example : checkNegativeGram (n:=1) (fun _ _ => ⟨(-2,1),by sorry⟩) (fun _ => 1)=false := by sorry

/- Finite family of Gram certificates -/
def checkGramDataset
 (rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : Bool :=
 rows.all (fun r => checkNegativeGram r.2.1 r.2.2)
theorem checkGramDataset_iff (rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : checkGramDataset rows=true ↔ ∀ r∈rows, checkNegativeGram r.2.1 r.2.2=true := by sorry
theorem checkGramDataset_append (a b : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : checkGramDataset (a++b)=(checkGramDataset a && checkGramDataset b) := by sorry
theorem checkGramDataset_perm (a b : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) (h : a.Perm b) : checkGramDataset a=checkGramDataset b := by sorry
-- TauCeti.Computational.test_dataset_empty
example : checkGramDataset []=true := by sorry
-- TauCeti.Computational.test_dataset_single
example : checkGramDataset [⟨1,((fun _ _ => ⟨(-2,-1),by sorry⟩),(fun _ => 1))⟩]=true := by sorry
-- TauCeti.Computational.test_dataset_bad_row
example (rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : checkGramDataset (rows++[⟨1,((fun _ _ => ⟨(-2,-1),by sorry⟩),(fun _ => 0))⟩])=false := by sorry

/- Correct multiplicity lift for Gram witnesses -/
theorem multiplicityGram_lift {n : ℕ} (m : Fin n → ℕ) (hm : ∀ i, 0 < m i)
 (A : ℝ) (K : Matrix (Fin n) (Fin n) ℝ) (t : Fin n → ℝ) :
 (∑ i : (Σ j : Fin n, Fin (m j)), ∑ j : (Σ k : Fin n, Fin (m k)),
 ((if i=j then A else 0)-K i.1 j.1)*(t i.1/(m i.1:ℝ))*(t j.1/(m j.1:ℝ)))
 = ∑ i, ∑ j, ((if i=j then A/(m i:ℝ) else 0)-K i j)*t i*t j := by sorry

/- Certified cusp-form L-value enclosure -/
def cuspLBox (k : ℕ) (hk : 0 < (k:ℤ)) (f : CuspForm 𝒮ℒ (k:ℤ))
 (hf : f∈integralCuspLattice k) (z : ℚ × ℚ) (P : ℕ) : NonemptyInterval ℚ × NonemptyInterval ℚ := by sorry
theorem cuspLBox_contains (k : ℕ) (hk : 0 < (k:ℤ)) (f : CuspForm 𝒮ℒ (k:ℤ)) (hf : f∈integralCuspLattice k) (z : ℚ × ℚ) (P : ℕ) : ModularForm.L hk f ((z.1:ℂ)+(z.2:ℂ)*Complex.I)∈complexBoxSet (cuspLBox k hk f hf z P) := by sorry
theorem cuspLBox_width (k : ℕ) (hk : 0 < (k:ℤ)) (f : CuspForm 𝒮ℒ (k:ℤ)) (hf : f∈integralCuspLattice k) (z : ℚ × ℚ) (P : ℕ) : let B:=cuspLBox k hk f hf z P; B.1.snd-B.1.fst ≤ (2:ℚ)^(-(P:ℤ)) ∧ B.2.snd-B.2.fst ≤ (2:ℚ)^(-(P:ℤ)) := by sorry
theorem cuspLBox_excludes_zero (k : ℕ) (hk : 0 < (k:ℤ)) (f : CuspForm 𝒮ℒ (k:ℤ)) (hf : f∈integralCuspLattice k) (z : ℚ × ℚ) (P : ℕ) (H : (0:ℂ)∉complexBoxSet (cuspLBox k hk f hf z P)) : ModularForm.L hk f ((z.1:ℂ)+(z.2:ℂ)*Complex.I)≠0 := by sorry
-- TauCeti.Computational.test_cuspL_zero
example (P : ℕ) : (0:ℂ)∈complexBoxSet (cuspLBox 12 (by sorry) 0 (by sorry) (1,0) P) := by sorry
-- TauCeti.Computational.test_cuspL_precision
example (f : CuspForm 𝒮ℒ 12) (hf : f∈integralCuspLattice 12) : let B:=cuspLBox 12 (by sorry) f hf (1,0) 8; B.1.snd-B.1.fst ≤ 1/256 ∧ B.2.snd-B.2.fst ≤ 1/256 := by sorry
-- TauCeti.Computational.test_cuspL_no_zero_inference
example : (0:ℂ)∈complexBoxSet (⟨(-1,1),by sorry⟩,⟨(-1,1),by sorry⟩) ∧ (1:ℂ)∈complexBoxSet (⟨(-1,1),by sorry⟩,⟨(-1,1),by sorry⟩) := by sorry

-- TauCeti.Computational.test_cuspL_singleton_zero
example : ∀ z ∈ complexBoxSet (NonemptyInterval.pure 0, NonemptyInterval.pure 0), z=(0:ℂ) := by sorry

end TauCeti.Computational
