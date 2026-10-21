import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.LocalCondition
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.TwoTorsion
import TauCeti.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Descent
import TauCeti.NumberTheory.ModularForms.SturmBound
import TauCeti.LinearAlgebra.Matrix.Echelon.KernelBasis

/-!
# ComputationalNumberTheory: representative target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It records the
definitions and the theorem signatures of the roadmap that can be stated against the pinned
Mathlib and Tau Ceti APIs, so that contributors and reviewers converge on names and forms. Every
`sorry` marks a target. Definitions here have real bodies; algorithms whose construction is the
content of a target (root isolation, integral bases, Miller bases, enclosures of special
functions, the Fincke–Pohst recursion, residual polynomials) are README targets only.

Design choices made explicit here:
* certificates are structures bundling finite data with the propositions a checker verifies;
  executable checkers return `Bool`, and soundness theorems turn acceptance into the intrinsic
  statement about Mathlib or Tau Ceti carriers;
* a RAM step is a partial function: `none` is an error, `some none` a normal halt;
* rational intervals are Mathlib's `NonemptyInterval ℚ`, with the signed product and the field
  reciprocal defined here because Mathlib's operations are the monotone and group ones;
* a finite field is presented as `AdjoinRoot f` over a finite field, with `f` certified
  irreducible by Rabin's criterion;
* elliptic curves over `ℚ` are in the form `a₁ = a₃ = 0`, and local images are subgroups of Tau
  Ceti's square-class group `W.M`.
-/

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

noncomputable section

open Polynomial

namespace TauCetiRoadmap.ComputationalNumberTheory

/-! ## Layer CN.0: Exact presentations and computation models -/

section RAM

/-- **RAM instruction** (README 0.1). Operands are integer literals or `(indirect, address)` pairs;
operations `0, 1, 2, 3` are addition, subtraction, multiplication and floor division; comparisons
`0, …, 5` are `=, ≠, <, >, ≤, ≥`. -/
inductive RAMInstruction where
  | arithmetic (op : Fin 4) (dst : Bool × ℕ) (a b : ℤ ⊕ (Bool × ℕ))
  | branch (cmp : Fin 6) (a b : ℤ ⊕ (Bool × ℕ)) (target : ℕ)
  | halt
  deriving DecidableEq

/-- **RAM operand evaluation** (README 0.2). A negative indirect address is an error, never
truncated to zero. -/
def ramRead (m : ℕ → ℤ) : ℤ ⊕ (Bool × ℕ) → Option ℤ
  | .inl z => some z
  | .inr (false, i) => some (m i)
  | .inr (true, i) => if 0 ≤ m i then some (m (m i).toNat) else none

/-- Resolution of a destination, with the same convention for indirect addresses. -/
def ramDest (m : ℕ → ℤ) : Bool × ℕ → Option ℕ
  | (false, i) => some i
  | (true, i) => if 0 ≤ m i then some (m i).toNat else none

/-- The arithmetic table; floor division rounds toward `−∞` and a zero denominator is an error. -/
def ramArith (op : Fin 4) (x y : ℤ) : Option ℤ :=
  if op.val = 0 then some (x + y) else if op.val = 1 then some (x - y)
  else if op.val = 2 then some (x * y) else if y = 0 then none else some (Int.fdiv x y)

/-- The comparison table. -/
def ramCompare (cmp : Fin 6) (x y : ℤ) : Bool :=
  if cmp.val = 0 then decide (x = y) else if cmp.val = 1 then decide (x ≠ y)
  else if cmp.val = 2 then decide (x < y) else if cmp.val = 3 then decide (y < x)
  else if cmp.val = 4 then decide (x ≤ y) else decide (y ≤ x)

/-- **Partial RAM transition** (README 0.3): `none` is an error, `some none` is a normal halt and
`some (some c)` is the next configuration. -/
def ramStep (P : List RAMInstruction) (c : ℕ × (ℕ → ℤ)) : Option (Option (ℕ × (ℕ → ℤ))) :=
  match P[c.1]? with
  | none => none
  | some .halt => some none
  | some (.arithmetic op dst a b) =>
      (ramDest c.2 dst).bind fun d => (ramRead c.2 a).bind fun x => (ramRead c.2 b).bind fun y =>
        (ramArith op x y).map fun z => some (c.1 + 1, Function.update c.2 d z)
  | some (.branch cmp a b t) =>
      (ramRead c.2 a).bind fun x => (ramRead c.2 b).map fun y =>
        some (if ramCompare cmp x y then t else c.1 + 1, c.2)

example : ramRead (fun _ => 0) (.inl (-3)) = some (-3) := rfl

example : ramRead (fun _ => -1) (.inr (true, 0)) = none := rfl

/-- Floor division of `3` by `−2` writes `−2`, not `−1`. -/
example : ramStep [.arithmetic 3 (false, 0) (.inl 3) (.inl (-2))] (0, fun _ => 0) =
    some (some (1, Function.update (fun _ => 0) 0 (-2))) := rfl

example (m : ℕ → ℤ) : ramStep [.halt] (0, m) = some none := rfl

/-- **A finite successful RAM execution** (README 0.4). Its instruction count is `length`,
including the final halt; magnitude bounds are separate predicates. -/
structure RAMExecution (P : List RAMInstruction) where
  length : ℕ
  length_pos : 0 < length
  config : Fin length → ℕ × (ℕ → ℤ)
  first_pc : (config ⟨0, length_pos⟩).1 = 0
  step : ∀ (i : ℕ) (h : i + 1 < length),
    ramStep P (config ⟨i, by omega⟩) = some (some (config ⟨i + 1, h⟩))
  final : ramStep P (config ⟨length - 1, by omega⟩) = some none

/-- **Bit cost of an execution** (README 0.5): the sum of an explicit per-configuration charge. -/
def RAMExecution.bitCost {P : List RAMInstruction} (e : RAMExecution P)
    (C : ℕ × (ℕ → ℤ) → ℕ) : ℕ :=
  ∑ i, C (e.config i)

/-- **Bounded charges give a total bound** (README 0.6). -/
theorem RAMExecution.bitCost_le {P : List RAMInstruction} (e : RAMExecution P)
    (C : ℕ × (ℕ → ℤ) → ℕ) (B : ℕ) (h : ∀ i, C (e.config i) ≤ B) :
    e.bitCost C ≤ e.length * B := by
  sorry

/-- The halt-only program has an execution of length one, and the unit charge recovers it. -/
example : ∃ e : RAMExecution [.halt], e.length = 1 ∧ e.bitCost (fun _ => 1) = 1 :=
  ⟨{ length := 1, length_pos := one_pos, config := fun _ => (0, fun _ => 0), first_pc := rfl,
     step := fun i h => absurd h (by omega), final := rfl }, rfl, by simp [RAMExecution.bitCost]⟩

/-- **Polynomial magnitude bound** (README 0.7): every stored integer of the execution, on `n`
input cells, has absolute value at most `A·(n + length)^b + C`. -/
def PolynomialRAMMagnitude {P : List RAMInstruction} (e : RAMExecution P) (n A b C : ℕ) : Prop :=
  ∀ i j, ((e.config i).2 j).natAbs ≤ A * (n + e.length) ^ b + C

/-- A halt trace with a stored `7` fails the uniform bound `6`, even in an unused cell. -/
example : ∃ e : RAMExecution [.halt], e.length = 1 ∧
    ¬ PolynomialRAMMagnitude e 0 0 0 6 := by
  sorry

end RAM

section Algebraic

/-- **Isolated algebraic root certificate** (README 0.8): a nonzero rational polynomial and a
closed rational rectangle containing exactly one of its complex roots. Repeated roots are allowed;
uniqueness concerns distinct roots. -/
structure AlgebraicRootCertificate where
  poly : ℚ[X]
  poly_ne_zero : poly ≠ 0
  re : NonemptyInterval ℚ
  im : NonemptyInterval ℚ
  isolates : ∃! z : ℂ, aeval z poly = 0 ∧ ((re.fst : ℝ) ≤ z.re ∧ z.re ≤ re.snd) ∧
    ((im.fst : ℝ) ≤ z.im ∧ z.im ≤ im.snd)

/-- The decoded value of a certificate: the unique root in its rectangle. -/
def AlgebraicRootCertificate.value (c : AlgebraicRootCertificate) : ℂ :=
  c.isolates.exists.choose

theorem AlgebraicRootCertificate.value_mem_algebraicClosure (c : AlgebraicRootCertificate) :
    c.value ∈ algebraicClosure ℚ ℂ := by
  sorry

theorem AlgebraicRootCertificate.value_unique (c : AlgebraicRootCertificate) (z : ℂ)
    (hz : aeval z c.poly = 0) (hre : (c.re.fst : ℝ) ≤ z.re ∧ z.re ≤ c.re.snd)
    (him : (c.im.fst : ℝ) ≤ z.im ∧ z.im ≤ c.im.snd) : z = c.value := by
  sorry

/-- **Exact arithmetic of isolated algebraic numbers** (README 0.10–0.12). -/
theorem algebraic_add_certificate (a b : AlgebraicRootCertificate) :
    ∃ c : AlgebraicRootCertificate, c.value = a.value + b.value := by
  sorry

theorem algebraic_mul_certificate (a b : AlgebraicRootCertificate) :
    ∃ c : AlgebraicRootCertificate, c.value = a.value * b.value := by
  sorry

theorem algebraic_inv_certificate (a : AlgebraicRootCertificate) (ha : a.value ≠ 0) :
    ∃ c : AlgebraicRootCertificate, c.value = a.value⁻¹ := by
  sorry

/-- `X² − 1` has two roots in `[−2, 2] × [0, 0]`, so no certificate isolates it there. -/
example : ¬ ∃ c : AlgebraicRootCertificate, c.poly = X ^ 2 - 1 ∧
    c.re = NonemptyInterval.pure (0 : ℚ) + ⟨(-2, 2), by norm_num⟩ ∧ c.im = NonemptyInterval.pure 0 := by
  sorry

end Algebraic

section Padic

/-- **Canonical finite `p`-adic approximation** (README 0.14): either the zero ball `(N, N, 0)` or
`v < N` with a mantissa `0 < s < p^(N − v)` prime to `p`. -/
structure PadicApproximation (p : ℕ) where
  precision : ℤ
  valuation : ℤ
  mantissa : ℕ
  canonical : (valuation = precision ∧ mantissa = 0) ∨
    (valuation < precision ∧ 0 < mantissa ∧ mantissa < p ^ (precision - valuation).toNat ∧
      ¬ p ∣ mantissa)

/-- The exact rational centre `p^v · s`. -/
def PadicApproximation.center {p : ℕ} (a : PadicApproximation p) : ℚ :=
  (p : ℚ) ^ a.valuation * a.mantissa

/-- The closed ball of radius `p^(−N)` around the centre, in Mathlib's `ℚ_[p]`. -/
def PadicApproximation.denotation {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) :
    Set ℚ_[p] :=
  {x | ‖x - (a.center : ℚ_[p])‖ ≤ (p : ℝ) ^ (-a.precision)}

theorem PadicApproximation.center_mem {p : ℕ} [Fact p.Prime] (a : PadicApproximation p) :
    (a.center : ℚ_[p]) ∈ a.denotation := by
  sorry

/-- At `p = 3`, `(N, v, s) = (0, −1, 1)` is canonical with centre `1/3`. -/
example : (⟨0, -1, 1, Or.inr (by decide)⟩ : PadicApproximation 3).center = 1 / 3 := by
  norm_num [PadicApproximation.center]

/-- A nonzero mantissa divisible by `p` is not canonical. -/
example : ¬ ∃ a : PadicApproximation 3, a.valuation < a.precision ∧ a.mantissa = 3 := by
  rintro ⟨⟨N, v, s, h⟩, hv, rfl⟩
  rcases h with ⟨h1, h2⟩ | ⟨-, -, -, h4⟩
  · simp at h2
  · exact h4 (dvd_refl 3)

end Padic

section FiniteFields

variable {F : Type*} [Field F] [Fintype F]

/-- **Rabin irreducibility certificate** (README 0.15), as the proposition its checker verifies:
`f` is monic of positive degree `n`, divides `X^(q^n) − X`, and is coprime to `X^(q^(n/s)) − X`
for every prime `s ∣ n`. The executable certificate stores the residue and the Bézout pairs. -/
structure RabinCertificate (f : F[X]) : Prop where
  monic : f.Monic
  natDegree_pos : 0 < f.natDegree
  dvd_frobenius : f ∣ X ^ (Fintype.card F ^ f.natDegree) - X
  coprime : ∀ s ∈ f.natDegree.primeFactors,
    IsCoprime (X ^ (Fintype.card F ^ (f.natDegree / s)) - X) f

theorem RabinCertificate.irreducible {f : F[X]} (h : RabinCertificate f) : Irreducible f := by
  sorry

theorem RabinCertificate.of_irreducible {f : F[X]} (hm : f.Monic) (hf : Irreducible f) :
    RabinCertificate f := by
  sorry

example : RabinCertificate (X ^ 2 + X + 1 : (ZMod 2)[X]) := by
  sorry

/-- `X² + 1 = (X − 2)(X − 3)` over `ZMod 5`: rejected. -/
example [Fact (Nat.Prime 5)] : ¬ RabinCertificate (X ^ 2 + 1 : (ZMod 5)[X]) := fun h => by
  sorry

/-- The linear Rabin test compares two reduced remainders, both equal to `2`. -/
example [Fact (Nat.Prime 5)] :
    (X ^ 5 %ₘ (X - C 2) : (ZMod 5)[X]) = C 2 ∧
      (X %ₘ (X - C 2) : (ZMod 5)[X]) = C 2 := by
  sorry

/-- **Certified presentation of a finite field** (README 0.16). -/
structure FiniteFieldPresentation (F K : Type*) [Field F] [Fintype F] [Field K] [Algebra F K] where
  poly : F[X]
  rabin : RabinCertificate poly
  root : K
  aeval_root : aeval root poly = 0
  finrank_eq : Module.finrank F K = poly.natDegree

/-- The algebra map `F[X]/(f) → K` sending the class of `X` to the root. -/
def FiniteFieldPresentation.lift {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : AdjoinRoot P.poly →ₐ[F] K :=
  AdjoinRoot.liftAlgHom P.poly (Algebra.ofId F K) P.root P.aeval_root

theorem FiniteFieldPresentation.bijective {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : Function.Bijective P.lift := by
  sorry

/-- The isomorphism `F[X]/(f) ≃ₐ[F] K` sending the class of `X` to the root. -/
def FiniteFieldPresentation.equiv {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : AdjoinRoot P.poly ≃ₐ[F] K :=
  AlgEquiv.ofBijective P.lift P.bijective

theorem FiniteFieldPresentation.equiv_root {K : Type*} [Field K] [Algebra F K]
    (P : FiniteFieldPresentation F K) : P.equiv (AdjoinRoot.root P.poly) = P.root := by
  simp only [FiniteFieldPresentation.equiv, FiniteFieldPresentation.lift, AlgEquiv.ofBijective_apply]
  exact AdjoinRoot.liftAlgHom_root _ _ _ _

theorem FiniteFieldPresentation.exists (K : Type*) [Field K] [Algebra F K] [FiniteDimensional F K] :
    Nonempty (FiniteFieldPresentation F K) := by
  sorry

/-- The degree-one presentation over the prime field has the prescribed polynomial and root. -/
example [Fact (Nat.Prime 5)] : ∃ P : FiniteFieldPresentation (ZMod 5) (ZMod 5),
    P.poly = X - C 2 ∧ P.root = 2 := by
  sorry

/-- **Change of presentation with an explicit inverse** (README 0.17). -/
structure PresentationChange (f g : F[X]) where
  b : F[X]
  c : F[X]
  dvd_b : g ∣ f.comp b
  dvd_c : f ∣ g.comp c
  dvd_inv : f ∣ b.comp c - X

theorem exists_presentationChange {f g : F[X]} (hfm : f.Monic) (hgm : g.Monic) (hf : Irreducible f)
    (hg : Irreducible g) (hdeg : f.natDegree = g.natDegree) : Nonempty (PresentationChange f g) := by
  sorry

/-- Over `ZMod 3`, `(X + 2, X + 1)` changes `X² + 1` into `X² + X + 2`. -/
example : Nonempty (PresentationChange (X ^ 2 + 1 : (ZMod 3)[X]) (X ^ 2 + X + 2)) :=
  ⟨⟨X + 2, X + 1, by sorry, by sorry, by sorry⟩⟩

end FiniteFields

/-! ## Layer CN.1: Primality and factorization certificates -/

section Primality

/-- **Recursive Pratt certificate** (README 1.1): the leaf `2`, or a node `(n, a, children)`
whose children certify the prime factors of `n − 1`, repeated with multiplicity. -/
inductive PrattCertificate where
  | two
  | node (n a : ℕ) (children : List PrattCertificate)

/-- The value: `2` at the leaf and the stored `n` at a node. -/
def PrattCertificate.value : PrattCertificate → ℕ
  | .two => 2
  | .node n _ _ => n

/-- The local conditions at a node: `n ≥ 3`, `0 < a < n`, the child values multiply to `n − 1`,
`a^(n−1) ≡ 1` and `a^((n−1)/q) ≢ 1 (mod n)` for every child value `q`. -/
def PrattCertificate.nodeOK (n a : ℕ) (cs : List PrattCertificate) : Bool :=
  decide (3 ≤ n) && decide (0 < a) && decide (a < n) &&
    decide ((cs.map PrattCertificate.value).prod = n - 1) && decide (a ^ (n - 1) % n = 1) &&
    cs.all fun c => decide (a ^ ((n - 1) / c.value) % n ≠ 1)

mutual
/-- **Pratt certificate checker** (README 1.2), by structural recursion on the finite tree. -/
def PrattCertificate.check : PrattCertificate → Bool
  | .two => true
  | .node n a cs => PrattCertificate.nodeOK n a cs && PrattCertificate.checkList cs
/-- All children are accepted. -/
def PrattCertificate.checkList : List PrattCertificate → Bool
  | [] => true
  | c :: cs => PrattCertificate.check c && PrattCertificate.checkList cs
end

example : (PrattCertificate.node 3 2 [.two]).check = true := by decide

/-- Three factors `2` and witness `2` do not certify `9`. -/
example : (PrattCertificate.node 9 2 [.two, .two, .two]).check = false := by decide

/-- **Soundness of Pratt certificates** (README 1.3). -/
theorem PrattCertificate.sound (c : PrattCertificate) (h : c.check = true) : c.value.Prime := by
  sorry

/-- **Completeness of Pratt certificates** (README 1.4). -/
theorem PrattCertificate.complete (n : ℕ) (hn : n.Prime) :
    ∃ c : PrattCertificate, c.check = true ∧ c.value = n := by
  sorry

mutual
/-- **Bit size of a Pratt tree** (README 1.5): one tag bit, the binary lengths of `n`, `a` and the
child count, and the sizes of all children, repeated children charged repeatedly. -/
def prattBitSize : PrattCertificate → ℕ
  | .two => 1
  | .node n a cs => 1 + (Nat.log 2 n + 1) + (Nat.log 2 a + 1) + (Nat.log 2 cs.length + 1) +
      prattBitSizeList cs
/-- The total size of a list of trees. -/
def prattBitSizeList : List PrattCertificate → ℕ
  | [] => 0
  | c :: cs => prattBitSize c + prattBitSizeList cs
end

example : prattBitSize (.node 3 2 [.two]) = 7 := by decide

/-- **Quadratic size of Pratt certificates** (README 1.6). -/
theorem pratt_small_certificate : ∃ C : ℕ, ∀ n : ℕ, n.Prime →
    ∃ c : PrattCertificate, c.check = true ∧ c.value = n ∧
      prattBitSize c ≤ C * (Nat.log 2 n + 1) ^ 2 := by
  sorry

/-- **Strong Miller–Rabin liar** (README 1.7): with `n − 1 = 2^h·t`, `t` odd, either `a^t = 1` or
`a^(t·2^j) = −1` in `ZMod n` for some `j < h`. The sample space is `1, …, n − 1`. -/
def StrongLiar (n a : ℕ) : Prop :=
  1 < n ∧ Odd n ∧ 0 < a ∧ a < n ∧
    ((a : ZMod n) ^ ((n - 1) / 2 ^ (n - 1).factorization 2) = 1 ∨
      ∃ j < (n - 1).factorization 2,
        (a : ZMod n) ^ ((n - 1) / 2 ^ (n - 1).factorization 2 * 2 ^ j) = -1)

/-- `2047 = 23 · 89` is composite and passes the strong test to base `2`. -/
example : StrongLiar 2047 2 ∧ ¬ (2047).Prime := by
  sorry

/-- **Prime inputs pass every admissible base** (README 1.8). -/
theorem strongLiar_of_prime (n a : ℕ) (hn : n.Prime) (hodd : Odd n) (ha : 0 < a) (han : a < n) :
    StrongLiar n a := by
  sorry

/-- **The Miller–Rabin bound** (README 1.9): an odd composite `n` has at most `(n − 1)/4` strong
liars among `1, …, n − 1`. -/
theorem strongLiar_card_le (n : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime) :
    4 * Nat.card {a : ℕ // StrongLiar n a} ≤ n - 1 := by
  sorry

/-- **Independent rounds** (README 1.10). -/
theorem millerRabin_rounds_bound (n k : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime) :
    4 ^ k * Nat.card {t : Fin k → ℕ // ∀ i, StrongLiar n (t i)} ≤ (n - 1) ^ k := by
  sorry

/-- The least `k ≥ 1` with `n^k ≡ 1 (mod r)`, found by search below `r`; `0` when there is none. -/
def aksOrder (n r : ℕ) : ℕ :=
  (((List.range r).map (· + 1)).find? fun k => n ^ k % r == 1).getD 0

/-- The binary length `⌊log₂ n⌋ + 1`. -/
def aksLen (n : ℕ) : ℕ := Nat.log 2 n + 1

/-- **AKS order parameter** (README 1.11): the least `r ≥ 2` with `gcd(n, r) > 1` or with the order
of `n` modulo `r` above `4·len(n)²`; `r = n` always qualifies, and inputs `n ≤ 1` give `0`. -/
def aksParameter (n : ℕ) : ℕ :=
  if n ≤ 1 then 0 else
    (((List.range (n + 1)).find? fun r =>
      2 ≤ r && (Nat.gcd n r != 1 || 4 * aksLen n ^ 2 < aksOrder n r))).getD n

example : aksParameter 2 = 2 ∧ aksParameter 9 = 3 := by decide

/-- **AKS polynomial congruences** (README 1.12): `(X + j)^n ≡ X^n + j` modulo `X^r − 1` over
`ZMod n` for `1 ≤ j ≤ ℓ`. -/
def AKSIdentities (n r ℓ : ℕ) : Prop :=
  ∀ j : ℕ, 1 ≤ j → j ≤ ℓ →
    (X + C (j : ZMod n)) ^ n %ₘ (X ^ r - 1) = (X ^ n + C (j : ZMod n)) %ₘ (X ^ r - 1)

/-- Characteristic five gives the prime identity; an empty range also passes at composite nine. -/
example : AKSIdentities 5 2 3 ∧ AKSIdentities 9 2 0 := by
  sorry

/-- **Shoup's AKS test** (README 1.13), as the proposition its Boolean algorithm decides: reject
`n ≤ 1` and perfect powers, accept when the parameter is `n`, reject a common factor, and
otherwise run the identities up to `2·len(n)·⌊√r⌋ + 1`. -/
def AKSAccepts (n : ℕ) : Prop :=
  1 < n ∧ (¬ ∃ a b : ℕ, 1 < a ∧ 1 < b ∧ a ^ b = n) ∧
    (aksParameter n = n ∨ (Nat.gcd n (aksParameter n) = 1 ∧
      AKSIdentities n (aksParameter n) (2 * aksLen n * Nat.sqrt (aksParameter n) + 1)))

/-- The primality wrapper accepts `2` and rejects the perfect power `9`. -/
example : AKSAccepts 2 ∧ ¬ AKSAccepts 9 := by
  sorry

/-- **Correctness of AKS** (README 1.14). -/
theorem aks_correct (n : ℕ) : AKSAccepts n ↔ n.Prime := by
  sorry

/-- **Pocklington's prime-divisor congruence** (README 1.15): under the witness hypotheses every
prime divisor `p` of `n` satisfies `F ∣ p − 1`. -/
theorem pocklington_prime_divisor (n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1)
    (h : ∀ q, q.Prime → q ∣ F →
      ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n)
    (p : ℕ) (hp : p.Prime) (hpn : p ∣ n) : F ∣ p - 1 := by
  sorry

/-- **Pocklington's criterion** (README 1.16): if `F ∣ n − 1`, `n < F²`, and every prime
`q ∣ F` has a witness `a` with `a^(n−1) ≡ 1` and `gcd(a^((n−1)/q) − 1, n) = 1`, then `n` is
prime. The witness may depend on `q` (a natural number; an integer witness reduces modulo `n`),
and `F` need not be coprime to `(n − 1)/F`. -/
theorem pocklington_prime (n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1) (hF2 : n < F ^ 2)
    (h : ∀ q, q.Prime → q ∣ F →
      ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n) :
    n.Prime := by
  sorry

/-- **Finite Pocklington certificate** (README 1.17): Pratt trees for the certified part `F` of
`n − 1`, one witness per occurrence. -/
structure PocklingtonCertificate where
  entries : List (PrattCertificate × ℕ)

/-- The certified part `F`. -/
def PocklingtonCertificate.factor (c : PocklingtonCertificate) : ℕ :=
  (c.entries.map fun e => e.1.value).prod

/-- The finite checker: bounds, divisibility, recursive Pratt checks and the gcd tests. -/
def PocklingtonCertificate.check (c : PocklingtonCertificate) (n : ℕ) : Bool :=
  decide (1 < n) && decide (1 < c.factor) && decide (c.factor ∣ n - 1) &&
    decide (n < c.factor ^ 2) &&
    c.entries.all fun e => e.1.check && decide (e.2 ^ (n - 1) % n = 1) &&
      decide (Nat.gcd (e.2 ^ ((n - 1) / e.1.value) - 1) n = 1)

/-- `F = 8` with witness `3` certifies `17`; the single factor `2` does not, since `2² ≤ 17`. -/
example : (PocklingtonCertificate.mk [(.two, 3), (.two, 3), (.two, 3)]).check 17 = true ∧
    (PocklingtonCertificate.mk [(.two, 3)]).check 17 = false := by decide

/-- **Soundness of Pocklington certificates** (README 1.18). -/
theorem PocklingtonCertificate.sound (c : PocklingtonCertificate) (n : ℕ)
    (h : c.check n = true) : n.Prime := by
  sorry

/-- **Integer factorization with prime certificates** (README 1.19). -/
structure IntegerFactorCertificate where
  negative : Bool
  factors : List PrattCertificate

/-- The signed product of the certified primes. -/
def IntegerFactorCertificate.value (c : IntegerFactorCertificate) : ℤ :=
  (if c.negative then -1 else 1) * (c.factors.map fun q => (q.value : ℤ)).prod

/-- Acceptance: every tree is accepted and the product is `z`. -/
def IntegerFactorCertificate.check (c : IntegerFactorCertificate) (z : ℤ) : Bool :=
  c.factors.all PrattCertificate.check && decide (c.value = z)

example : (IntegerFactorCertificate.mk false [.two, .two, .node 3 2 [.two]]).check 12 = true := by
  decide

example : (IntegerFactorCertificate.mk true []).check (-1) = true := by decide

/-- **Soundness** (README 1.20): an accepted certificate lists primes whose signed product is `z`. -/
theorem IntegerFactorCertificate.sound (c : IntegerFactorCertificate) (z : ℤ)
    (h : c.check z = true) : c.value = z ∧ z ≠ 0 ∧ ∀ q ∈ c.factors, q.value.Prime := by
  sorry

/-- **Completeness** (README 1.21). -/
theorem IntegerFactorCertificate.complete (z : ℤ) (hz : z ≠ 0) :
    ∃ c : IntegerFactorCertificate, c.check z = true := by
  sorry

end Primality

section Factorization

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

/-- **Factorization certificate over a finite field** (README 1.22): a nonzero constant and
distinct Rabin-certified monic factors with positive exponents whose product is `f`. -/
structure FiniteFieldFactorCertificate (f : F[X]) where
  lead : F
  lead_ne_zero : lead ≠ 0
  factors : List (F[X] × ℕ)
  rabin : ∀ g ∈ factors, RabinCertificate g.1
  exp_pos : ∀ g ∈ factors, 0 < g.2
  nodup : (factors.map Prod.fst).Nodup
  eq_prod : f = C lead * (factors.map fun g => g.1 ^ g.2).prod

/-- Multiplicity two is stored as an exponent on the single distinct linear factor. -/
example [Fact (Nat.Prime 3)] :
    ∃ c : FiniteFieldFactorCertificate ((X - 1) ^ 2 : (ZMod 3)[X]),
      c.factors = [(X - 1, 2)] ∧ c.lead = 1 := by
  sorry

/-- **Soundness** (README 1.23): the certified factors are Mathlib's normalized factors. -/
theorem FiniteFieldFactorCertificate.sound {f : F[X]} (c : FiniteFieldFactorCertificate f) :
    f ≠ 0 ∧ f.leadingCoeff = c.lead ∧
      UniqueFactorizationMonoid.normalizedFactors f =
        (c.factors.map fun g => Multiset.replicate g.2 g.1).sum := by
  sorry

/-- **Completeness** (README 1.24). -/
theorem FiniteFieldFactorCertificate.complete {f : F[X]} (hf : f ≠ 0) :
    Nonempty (FiniteFieldFactorCertificate f) := by
  sorry

/-- **Transport along a change of presentation** (README 1.25). -/
theorem transport_finite_factorization {K : Type*} [Field K] [Fintype K] [DecidableEq K]
    (e : F ≃+* K) {f : F[X]} (c : FiniteFieldFactorCertificate f) :
    ∃ c' : FiniteFieldFactorCertificate (f.map e.toRingHom),
      c'.factors = c.factors.map fun g => (g.1.map e.toRingHom, g.2) := by
  sorry

end Factorization

/-- **Hensel lifting modulo `p^k`** (README 1.26): a coprime monic factorization modulo `p` of a
monic `f ∈ ℤ[X]` lifts uniquely to a monic factorization modulo `p^k`. -/
theorem henselLift (p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 1 ≤ k) (f : ℤ[X]) (hf : f.Monic)
    (g₀ h₀ : (ZMod p)[X]) (hg₀ : g₀.Monic) (hh₀ : h₀.Monic) (hcop : IsCoprime g₀ h₀)
    (hfac : f.map (Int.castRingHom (ZMod p)) = g₀ * h₀) :
    ∃! gh : (ZMod (p ^ k))[X] × (ZMod (p ^ k))[X],
      gh.1.Monic ∧ gh.2.Monic ∧
      gh.1.map (ZMod.castHom (dvd_pow_self p (by omega)) (ZMod p)) = g₀ ∧
      gh.2.map (ZMod.castHom (dvd_pow_self p (by omega)) (ZMod p)) = h₀ ∧
      f.map (Int.castRingHom (ZMod (p ^ k))) = gh.1 * gh.2 := by
  sorry

/-- **Rational polynomial factor certificate** (README 1.27): a nonzero scalar and monic
irreducible factors over `ℚ`, with multiplicity by repetition. -/
structure RationalFactorCertificate (f : ℚ[X]) where
  lead : ℚ
  lead_ne_zero : lead ≠ 0
  factors : List ℚ[X]
  monic : ∀ g ∈ factors, g.Monic
  irreducible : ∀ g ∈ factors, Irreducible g
  eq_prod : f = C lead * factors.prod

/-- The zero polynomial has no factor certificate. -/
example (c : RationalFactorCertificate 0) : False := by
  sorry

/-- **Certified rational factorization** (README 1.28): every nonzero rational polynomial has a
certificate, and the scalar is its leading coefficient. -/
theorem certifiedRationalFactorization (f : ℚ[X]) (hf : f ≠ 0) :
    ∃ c : RationalFactorCertificate f, c.lead = f.leadingCoeff := by
  sorry

/-! ## Layer CN.2: Certified computations in number fields -/

section NumberFields

open NumberField
open scoped nonZeroDivisors

variable {K : Type*} [Field K] [NumberField K]

/-- **Finite order basis certificate** (README 2.1): a `ℚ`-basis of `K`, integer coordinates of
`1` and integer structure constants. Maximality is not asserted. -/
structure OrderBasisCertificate (K : Type*) [Field K] [NumberField K] (n : ℕ) where
  basis : Fin n → K
  linearIndependent : LinearIndependent ℚ basis
  span_eq_top : Submodule.span ℚ (Set.range basis) = ⊤
  oneCoord : Fin n → ℤ
  one_eq : ∑ i, (oneCoord i : K) * basis i = 1
  structureConst : Fin n → Fin n → Fin n → ℤ
  mul_eq : ∀ i j, basis i * basis j = ∑ k, (structureConst i j k : K) * basis k

/-- The integer span of the certified basis. -/
def OrderBasisCertificate.lattice {n : ℕ} (b : OrderBasisCertificate K n) : Submodule ℤ K :=
  Submodule.span ℤ (Set.range b.basis)

theorem OrderBasisCertificate.mul_mem {n : ℕ} (b : OrderBasisCertificate K n) {x y : K}
    (hx : x ∈ b.lattice) (hy : y ∈ b.lattice) : x * y ∈ b.lattice := by
  sorry

/-- **Multiplier ring of a lattice** (README 2.2): `{x ∈ K | x·I ⊆ I}` for any `ℤ`-submodule `I`;
the zero lattice has the whole field as multiplier ring. -/
def multiplierRing {L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L) : Subalgebra ℤ L where
  carrier := {x | ∀ y ∈ I, x * y ∈ I}
  mul_mem' {a b} ha hb y hy := by rw [mul_assoc]; exact ha _ (hb y hy)
  add_mem' {a b} ha hb y hy := by rw [add_mul]; exact I.add_mem (ha y hy) (hb y hy)
  algebraMap_mem' r y hy := by
    rw [algebraMap_int_eq, eq_intCast, ← zsmul_eq_mul]
    exact I.smul_mem r hy

theorem mem_multiplierRing {L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L) (x : L) :
    x ∈ multiplierRing I ↔ ∀ y ∈ I, x * y ∈ I := Iff.rfl

example : multiplierRing (⊥ : Submodule ℤ ℚ) = ⊤ := by
  ext x; simp [mem_multiplierRing]

/-- `1/2` does not stabilize `ℤ ⊆ ℚ`. -/
example : (1 / 2 : ℚ) ∉ multiplierRing (Submodule.span ℤ {(1 : ℚ)}) := by
  sorry

/-- The order certificate for `ℚ` has basis `[1]`, and its integer span excludes `1/2`. -/
example : ∃ b : OrderBasisCertificate ℚ 1,
    b.basis = (fun _ => 1) ∧ (1 / 2 : ℚ) ∉ b.lattice := by
  sorry

/-- **Local maximality of an order** (README 2.3): every integral element has a multiple prime to
`p` in `R`. -/
def IsPMaximal (R : Subalgebra ℤ K) (p : ℕ) : Prop :=
  ∀ x : K, IsIntegral ℤ x → ∃ a : ℤ, ¬ (p : ℤ) ∣ a ∧ (a : K) * x ∈ R

/-- At `p = 1` no denominator passes. -/
example : ¬ IsPMaximal (⊥ : Subalgebra ℤ ℚ) 1 := by
  intro h
  obtain ⟨a, ha, -⟩ := h 1 isIntegral_one
  simp at ha

/-- **Nilradical from a Frobenius kernel** (README 2.4). -/
theorem nilpotent_iff_frobenius_zero (p : ℕ) [Fact p.Prime] {A : Type*} [CommRing A]
    [Algebra (ZMod p) A] [FiniteDimensional (ZMod p) A] (k : ℕ)
    (hk : Module.finrank (ZMod p) A ≤ p ^ k) (x : A) : IsNilpotent x ↔ x ^ (p ^ k) = 0 := by
  sorry

/-- **The `p`-radical in field coordinates** (README 2.5): the radical of `pR` in `R`, viewed as
a lattice in `K`. For a prime `p` and an order `R` it is the set of `x ∈ R` with a positive power
in `pR`. -/
def pRadicalLattice (R : Subalgebra ℤ K) (p : ℕ) : Submodule ℤ K :=
  ((Ideal.span {(p : R)}).radical.restrictScalars ℤ).map (R.val.toLinearMap.restrictScalars ℤ)

theorem mem_pRadicalLattice (R : Subalgebra ℤ K) (p : ℕ) (hp : p.Prime)
    (hR : (Subalgebra.toSubmodule R).FG) (x : K) :
    x ∈ pRadicalLattice R p ↔ x ∈ R ∧ ∃ k ≥ 1, ∃ y ∈ R, x ^ k = (p : K) * y := by
  sorry

/-- In the usual integer order of `ℚ`, the `3`-radical contains `3` and excludes `1`. -/
example : (3 : ℚ) ∈ pRadicalLattice (⊥ : Subalgebra ℤ ℚ) 3 ∧
    (1 : ℚ) ∉ pRadicalLattice (⊥ : Subalgebra ℤ ℚ) 3 := by
  sorry

/-- **Multiplier criterion for `p`-maximality** (README 2.6), for an order `R` (finitely generated,
spanning `K` over `ℚ`). -/
theorem pRadical_multiplier_eq_iff (R : Subalgebra ℤ K)
    (hfg : (Subalgebra.toSubmodule R).FG) (hspan : Submodule.span ℚ (R : Set K) = ⊤)
    (p : ℕ) [Fact p.Prime] :
    multiplierRing (pRadicalLattice R p) = R ↔ IsPMaximal R p := by
  sorry

/-- **Integral basis certificate** (README 2.7): an order basis whose lattice is the ring of
integers. -/
structure IntegralBasisCertificate (K : Type*) [Field K] [NumberField K] (n : ℕ)
    extends OrderBasisCertificate K n where
  maximal : ∀ x : K, IsIntegral ℤ x ↔ x ∈ toOrderBasisCertificate.lattice

/-- The maximal order of `ℚ` is certified by the singleton basis `[1]`. -/
example : ∃ b : IntegralBasisCertificate ℚ 1, b.basis = (fun _ => 1) := by
  sorry

/-- **The integral-basis algorithm terminates with a certificate** (README 2.8). -/
theorem integralBasisAlgorithm {n : ℕ} (b : OrderBasisCertificate K n) :
    ∃ c : IntegralBasisCertificate K n, b.lattice ≤ c.lattice := by
  sorry

/-- **Prime-ideal decomposition certificate** (README 2.9). -/
structure PrimeIdealFactorCertificate (K : Type*) [Field K] [NumberField K] (p : ℕ) where
  factors : List (Ideal (𝓞 K) × ℕ)
  distinct : (factors.map Prod.fst).Nodup
  prime : ∀ x ∈ factors, x.1.IsPrime ∧ x.1 ≠ ⊥ ∧ 0 < x.2
  product : Ideal.span {(p : 𝓞 K)} = (factors.map fun x => x.1 ^ x.2).prod

theorem PrimeIdealFactorCertificate.nonempty {p : ℕ} (hp : p.Prime)
    (c : PrimeIdealFactorCertificate K p) : c.factors ≠ [] := by
  sorry

/-- The rational prime `2` has exactly one prime ideal factor, with exponent one, in `ℚ`. -/
example : ∃ c : PrimeIdealFactorCertificate ℚ 2,
    c.factors = [(Ideal.span {(2 : 𝓞 ℚ)}, 1)] := by
  sorry

/-- **Checked class-group relation lattice** (README 2.10). -/
def classRelationLattice {n : ℕ} (I : Fin n → (Ideal (𝓞 K))⁰) : AddSubgroup (Fin n → ℤ) where
  carrier := {a | ∏ i, ClassGroup.mk0 (I i) ^ a i = 1}
  zero_mem' := by simp
  add_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Pi.add_apply, zpow_add, Finset.prod_mul_distrib] at *
    rw [ha, hb, one_mul]
  neg_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq, Pi.neg_apply, zpow_neg, Finset.prod_inv_distrib] at *
    rw [ha, inv_one]

/-- A factor base containing only the unit ideal has every exponent as a checked relation. -/
example : classRelationLattice (K := K) (n := 1) (fun _ => 1) = ⊤ := by
  sorry

/-- **Relation quotient covers the class group** (README 2.11). -/
theorem classNumber_dvd_relation_index {n : ℕ} (I : Fin n → (Ideal (𝓞 K))⁰)
    (L : AddSubgroup (Fin n → ℤ)) (hL : L ≤ classRelationLattice I)
    (hgen : Subgroup.closure (Set.range fun i => ClassGroup.mk0 (I i)) = ⊤) (hfin : L.FiniteIndex) :
    classNumber K ∣ L.index := by
  sorry

/-- **Minkowski factor bases generate** (README 2.12). -/
theorem minkowski_factorBase_generates {n : ℕ} (I : Fin n → (Ideal (𝓞 K))⁰) (B : ℝ)
    (hB : (4 / Real.pi) ^ InfinitePlace.nrComplexPlaces K *
      ((Module.finrank ℚ K).factorial / (Module.finrank ℚ K : ℝ) ^ (Module.finrank ℚ K) *
        Real.sqrt |(discr K : ℝ)|) ≤ B)
    (hcover : ∀ P : (Ideal (𝓞 K))⁰, (P : Ideal (𝓞 K)).IsPrime →
      (Ideal.absNorm (P : Ideal (𝓞 K)) : ℝ) ≤ B → P ∈ Set.range I) :
    Subgroup.closure (Set.range fun i => ClassGroup.mk0 (I i)) = ⊤ := by
  sorry

/-- **Unit stopping bound** (README 2.13): the regulator quotient is the unit index, so a value
below `2` proves generation together with the torsion. -/
theorem units_complete_of_regulator_bound (u : Fin (Units.rank K) → (𝓞 K)ˣ)
    (hu : Units.IsMaxRank u) (h : Units.regOfFamily u < 2 * Units.regulator K) :
    Subgroup.closure (Set.range u) ⊔ Units.torsion K = ⊤ := by
  sorry

/-- **Joint class and unit stopping bound** (README 2.14). -/
theorem joint_class_unit_bound (u : Fin (Units.rank K) → (𝓞 K)ˣ) (hu : Units.IsMaxRank u)
    (h h' : ℕ) (hh : 0 < h) (hh' : 0 < h') (hd : h ∣ h')
    (hb : (h' : ℝ) * Units.regOfFamily u < 2 * h * Units.regulator K) :
    h' = h ∧ Subgroup.closure (Set.range u) ⊔ Units.torsion K = ⊤ := by
  sorry

/-- A zero purported relation quotient passes the scalar inequality but cannot have order one. -/
example : (1 : ℕ) ∣ 0 ∧ (0 : ℝ) < 2 * 1 ∧ (0 : ℕ) ≠ 1 := by
  norm_num

/-- **Certified completion of class and unit computations** (README 2.15). -/
theorem certified_class_unit_complete {n : ℕ} (I : Fin n → (Ideal (𝓞 K))⁰)
    (L : AddSubgroup (Fin n → ℤ)) (hL : L ≤ classRelationLattice I)
    (hgen : Subgroup.closure (Set.range fun i => ClassGroup.mk0 (I i)) = ⊤) (hfin : L.FiniteIndex)
    (u : Fin (Units.rank K) → (𝓞 K)ˣ) (hu : Units.IsMaxRank u)
    (hb : (L.index : ℝ) * Units.regOfFamily u < 2 * classNumber K * Units.regulator K) :
    L.index = classNumber K ∧ Subgroup.closure (Set.range u) ⊔ Units.torsion K = ⊤ := by
  sorry

end NumberFields

section Newton

/-- **Exact `φ`-adic expansion** (README 2.16): the `i`-th coefficient of `f` in base `φ` is
`(f /ₘ φ^i) %ₘ φ`. -/
def phiExpansion {R : Type*} [CommRing R] (φ f : R[X]) (i : ℕ) : R[X] :=
  (f /ₘ φ ^ i) %ₘ φ

theorem phiExpansion_reconstruct {R : Type*} [CommRing R] (φ f : R[X]) (hφ : φ.Monic)
    (hm : 0 < φ.natDegree) :
    f = ∑ i ∈ Finset.range (f.natDegree / φ.natDegree + 1), phiExpansion φ f i * φ ^ i := by
  sorry

example (f : ℤ[X]) (i : ℕ) : phiExpansion X f i = C (f.coeff i) := by
  sorry

/-- **Gauss valuation of a coefficient** (README 2.17): `⊤` for the zero polynomial. -/
def coefficientValuation (p : ℕ) (a : ℤ[X]) : WithTop ℕ :=
  a.support.inf fun i => ((padicValInt p (a.coeff i) : ℕ) : WithTop ℕ)

example (p : ℕ) : coefficientValuation p 0 = ⊤ := by simp [coefficientValuation]

/-- **A finite negative `φ`-Newton side** (README 2.18): from `(s, u)` to `(s + e·d, u − h·d)`,
slope `−h/e`, `gcd(e, h) = 1`, endpoints on the line and every point on or above it. The theorems
that use it assume `p` prime and `φ` monic of positive degree. -/
def IsPhiNewtonSide (p : ℕ) (φ f : ℤ[X]) (s u e h d : ℕ) : Prop :=
  0 < e ∧ 0 < h ∧ 0 < d ∧ Nat.Coprime e h ∧ h * d ≤ u ∧
    coefficientValuation p (phiExpansion φ f s) = u ∧
    coefficientValuation p (phiExpansion φ f (s + e * d)) = (u - h * d : ℕ) ∧
    ∀ i, ∀ v : ℕ, coefficientValuation p (phiExpansion φ f i) = v →
      e * u + h * s ≤ e * v + h * i ∧ (e * v + h * i = e * u + h * s → s ≤ i ∧ i ≤ s + e * d)

/-- `X² − 3` has slope `−1/2`; assigning slope `−1` fails the endpoint data. -/
example : IsPhiNewtonSide 3 X (X ^ 2 - 3) 0 1 2 1 1 ∧
    ¬ IsPhiNewtonSide 3 X (X ^ 2 - 3) 0 1 1 1 2 := by
  sorry

/-- **Squares of units in `ℚ_p`** (README 2.22, the case `L = ℚ_p`): a unit is a square exactly
when it is a square modulo `4p`. -/
theorem isSquare_iff_isSquare_mod (p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ) :
    IsSquare (u : ℚ_[p]) ↔ ∃ w : ℤ_[p], (u : ℤ_[p]) - w ^ 2 ∈ Ideal.span {(4 * p : ℤ_[p])} := by
  sorry

end Newton

/-- **Finite local expansion certificate** (README 2.21). -/
structure LocalExpansionCertificate (L : Type*) [NormedField L] (π x : L) (N : ℕ) where
  pi_ne_zero : π ≠ 0
  norm_pi_lt_one : ‖π‖ < 1
  valuation : ℤ
  digits : Fin N → L
  digits_le : ∀ i, ‖digits i‖ ≤ 1
  error_le : ‖x - π ^ valuation * ∑ i, digits i * π ^ (i : ℕ)‖ ≤ ‖π‖ ^ (valuation + N)

/-- Zero has an empty expansion at precision zero with the `3`-adic uniformizer. -/
example : Nonempty (LocalExpansionCertificate ℚ_[3] 3 0 0) := by
  sorry

/-! ## Layer CN.3: Exact modular and elliptic arithmetic data -/

section Modular

open scoped MatrixGroups
open _root_.UpperHalfPlane _root_.ModularForm

/-- **Integral `q`-expansion lattice at level one** (README 3.1): the forms whose width-one
`q`-expansion coefficients are all integers (the set is already a lattice, so it is its own span).
It lives on the `q`-expansion side, distinct from the integral modular-symbol module. -/
def integralModularLattice (k : ℤ) : Submodule ℤ (ModularForm 𝒮ℒ k) :=
  Submodule.span ℤ {f | ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a}

theorem mem_integralModularLattice (k : ℤ) (f : ModularForm 𝒮ℒ k) :
    f ∈ integralModularLattice k ↔ ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a := by
  sorry

/-- **Integral cusp-form lattice** (README 3.2). -/
def integralCuspLattice (k : ℤ) : Submodule ℤ (CuspForm 𝒮ℒ k) :=
  Submodule.span ℤ {f | ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a}

theorem mem_integralCuspLattice (k : ℤ) (f : CuspForm 𝒮ℒ k) :
    f ∈ integralCuspLattice k ↔ ∀ n, ∃ a : ℤ, (qExpansion 1 f).coeff n = a := by
  sorry

example : ModularForm.E₄ ∈ integralModularLattice 4 := by
  sorry

example : ((1 / 2 : ℂ) • CuspForm.discriminant) ∉ integralCuspLattice 12 := by
  sorry

/-- **The Miller basis exists** (README 3.3): for even `k` there is a `ℤ`-basis of the integral
cusp lattice whose first `d` coefficients form the identity matrix. -/
theorem exists_millerBasis (k : ℕ) (hk : Even k) :
    ∃ b : Module.Basis (Fin (Module.finrank ℂ (CuspForm 𝒮ℒ (k : ℤ)))) ℤ (integralCuspLattice k),
      ∀ i j, (qExpansion 1 (b i : CuspForm 𝒮ℒ (k : ℤ))).coeff (j.val + 1) =
        if i = j then 1 else 0 := by
  sorry

/-- **Level-one congruence Sturm bound** (README 3.4). -/
theorem levelOne_congruence_sturm (k : ℕ) (p : ℕ) (hp : p.Prime)
    (f : integralModularLattice (k : ℤ))
    (h : ∀ n ≤ k / 12, ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : ModularForm 𝒮ℒ (k : ℤ))).coeff n = a) :
    ∀ n, ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : ModularForm 𝒮ℒ (k : ℤ))).coeff n = a := by
  sorry

/-- **Level-one Hecke recurrence** (README 3.6): the coefficient formula of `T_p` on level-one cusp
forms, as a predicate on a supplied endomorphism. -/
def HasLevelOnePrimeRecurrence (k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k : ℤ))) : Prop :=
  ∀ (f : CuspForm 𝒮ℒ (k : ℤ)) (m : ℕ), (qExpansion 1 (T f)).coeff m =
    (qExpansion 1 f).coeff (p * m) + if p ∣ m then (p : ℂ) ^ (k - 1) * (qExpansion 1 f).coeff (m / p) else 0

theorem heckeRecurrence_unique (k p : ℕ) (T U : Module.End ℂ (CuspForm 𝒮ℒ (k : ℤ)))
    (hT : HasLevelOnePrimeRecurrence k p T) (hU : HasLevelOnePrimeRecurrence k p U) : T = U := by
  sorry

/-- At weight `12`, `T₂` acts on `Δ` by `−24`. -/
example : HasLevelOnePrimeRecurrence 12 2 ((-24 : ℂ) • LinearMap.id) := by
  sorry

/-- **The coefficient at `107` of `ΔE₄²E₆`** (README 3.8). -/
theorem weight26_coeff_107 :
    (qExpansion 1 (fun z : ℍ => ModularForm.discriminant z * ModularForm.E₄ z ^ 2 *
      ModularForm.E₆ z)).coeff 107 = (35830422465487817813321292 : ℂ) := by
  sorry

/-- **Ordinary reduction at `107`** (README 3.9). -/
theorem weight26_ordinary_107 : (35830422465487817813321292 : ZMod 107) = -1 := by decide

end Modular

section EllipticCurves

/-- **Point counts as a character sum** (README 3.17): in odd characteristic, for `a₁ = a₃ = 0`,
Tau Ceti's projective count is `q + 1 + Σ χ(f(x))`, the singular point included. -/
theorem pointCount_eq_charSum {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) (h₁ : W.a₁ = 0) (h₃ : W.a₃ = 0) :
    (W.pointCount : ℤ) = Fintype.card F + 1 +
      ∑ x : F, quadraticChar F (x ^ 3 + W.a₂ * x ^ 2 + W.a₄ * x + W.a₆) := by
  sorry

theorem frobeniusTrace_eq_neg_charSum {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) (h₁ : W.a₁ = 0) (h₃ : W.a₃ = 0) :
    W.frobeniusTrace = -∑ x : F, quadraticChar F (x ^ 3 + W.a₂ * x ^ 2 + W.a₄ * x + W.a₆) := by
  sorry

/-- `y² = x³ + x + 1` over `ZMod 5` has `9` points. -/
example [Fact (Nat.Prime 5)] : (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 5)).pointCount = 9 := by
  sorry

section LocalImage

variable {K : Type*} [Field K] [DecidableEq K] (W : WeierstrassCurve.Affine K) [W.IsElliptic]
  [W.IsCharNeTwoNF]

/-- **The subgroup generated by certified abscissae** (README 3.18): the classes of `x − T`, in
Tau Ceti's square-class group `W.M`, for a finite list of abscissae in the local field; a
certificate uses the images of rational abscissae. -/
def localImageSpan (xs : List K) : Subgroup W.M :=
  Subgroup.closure ((fun x => W.μX x) '' {x | x ∈ xs})

/-- An empty abscissa list generates the trivial local-image subgroup. -/
example : localImageSpan W [] = ⊥ := by
  sorry

/-- Each abscissa with `f(x)` a nonzero square is the class of an actual point. -/
theorem localImageSpan_le_range (xs : List K)
    (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x)) :
    localImageSpan W xs ≤ (WeierstrassCurve.Affine.μ (W := W)).range := by
  sorry

end LocalImage

/-- **The size check completes a local image at a prime** (README 3.19). -/
theorem localImageSpan_eq_range_of_card_padic (p : ℕ) [Fact p.Prime] [DecidableEq ℚ_[p]]
    (W : WeierstrassCurve.Affine ℚ_[p]) [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℚ_[p])
    (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x))
    (hcard : Nat.card (localImageSpan W xs) =
      (1 + Nat.card {x : ℚ_[p] // W.f.eval x = 0}) * (if p = 2 then 2 else 1)) :
    localImageSpan W xs = (WeierstrassCurve.Affine.μ (W := W)).range := by
  sorry

/-- **The size check at the real place** (README 3.19). -/
theorem localImageSpan_eq_range_of_card_real [DecidableEq ℝ] (W : WeierstrassCurve.Affine ℝ)
    [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℝ)
    (hxs : ∀ x ∈ xs, 0 < W.f.eval x)
    (hcard : 2 * Nat.card (localImageSpan W xs) = 1 + Nat.card {x : ℝ // W.f.eval x = 0}) :
    localImageSpan W xs = (WeierstrassCurve.Affine.μ (W := W)).range := by
  sorry

/-- **`p`-saturated subgroups** (README 3.22). -/
def IsPSaturated {A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) : Prop :=
  ∀ a : A, p • a ∈ G → a ∈ G

example {A : Type*} [AddCommGroup A] (p : ℕ) : IsPSaturated (⊤ : AddSubgroup A) p :=
  fun a _ => AddSubgroup.mem_top a

/-- `6ℤ` is `5`-saturated and not `2`-saturated in `ℤ`. -/
example : IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) 5 ∧
    ¬ IsPSaturated (AddSubgroup.zmultiples (6 : ℤ)) 2 := by
  sorry

theorem isPSaturated_iff_not_dvd_index {A : Type*} [AddCommGroup A] (G : AddSubgroup A)
    (p : ℕ) (hp : p.Prime) (hG : G.FiniteIndex) : IsPSaturated G p ↔ ¬ p ∣ G.index := by
  sorry

/-- **`p`-saturation by finitely many divisibility tests** (README 3.23): for generators `g`, no
combination with a coefficient prime to `p` is divisible by `p` in `A`, and `A[p] ⊆ G`, exactly
when `G` is `p`-saturated and the generators are independent modulo `pG`. -/
theorem isPSaturated_iff_forall_not_dvd {A : Type*} [AddCommGroup A] (p : ℕ) (hp : p.Prime)
    {m : ℕ} (g : Fin m → A) :
    ((∀ b : Fin m → ℤ, (∃ y : A, ∑ i, b i • g i = p • y) → ∀ i, (p : ℤ) ∣ b i) ∧
      ∀ a : A, p • a = 0 → a ∈ AddSubgroup.closure (Set.range g)) ↔
    (IsPSaturated (AddSubgroup.closure (Set.range g)) p ∧
      ∀ b : Fin m → ℤ, (∃ y ∈ AddSubgroup.closure (Set.range g), ∑ i, b i • g i = p • y) →
        ∀ i, (p : ℤ) ∣ b i) := by
  sorry

/-- **The quotient-generating saturation criterion** (README 3.23): the listed elements need
only generate `G / pG`, allowing prime-to-`p` torsion to be omitted. -/
theorem isPSaturated_iff_forall_not_dvd_of_span_quotient {A : Type*} [AddCommGroup A]
    (G : AddSubgroup A) (p : ℕ) (hp : p.Prime) {m : ℕ} (g : Fin m → A)
    (hg : ∀ i, g i ∈ G)
    (hgen : ∀ x ∈ G, ∃ b : Fin m → ℤ, ∃ y ∈ G, x = ∑ i, b i • g i + p • y) :
    ((∀ b : Fin m → ℤ, (∃ y : A, ∑ i, b i • g i = p • y) → ∀ i, (p : ℤ) ∣ b i) ∧
      ∀ a : A, p • a = 0 → a ∈ G) ↔
    (IsPSaturated G p ∧
      ∀ b : Fin m → ℤ, (∃ y ∈ G, ∑ i, b i • g i = p • y) → ∀ i, (p : ℤ) ∣ b i) := by
  sorry

/-- Prime-to-`2` torsion needs no generator in the quotient criterion. -/
example : IsPSaturated (⊤ : AddSubgroup (ZMod 3)) 2 ∧
    AddSubgroup.closure (Set.range (Fin.elim0 : Fin 0 → ZMod 3)) ≠ ⊤ := by
  sorry

/-- An empty candidate space cannot compensate for omitted ambient `2`-torsion. -/
example : ¬ IsPSaturated (⊥ : AddSubgroup (ZMod 2)) 2 := by
  sorry

/-- **Exact divisibility test** (README 3.24): `P = (x, y)` is divisible by `p` in `W(ℚ)` exactly
when a rational root `x₀` of `Φ_p − x·ΨSq_p` carries a point `Q` with `p•Q = P`. -/
theorem mem_nsmul_iff_exists_root (W : WeierstrassCurve ℚ) [W.IsElliptic] (p : ℕ) (hp : p.Prime)
    (x y : ℚ) (h : W.toAffine.Nonsingular x y) :
    (∃ Q : W.toAffine.Point, p • Q = .some x y h) ↔
      ∃ x₀ : ℚ, (W.Φ p - C x * W.ΨSq p).eval x₀ = 0 ∧
        ∃ (y₀ : ℚ) (h₀ : W.toAffine.Nonsingular x₀ y₀), p • (.some x₀ y₀ h₀ : W.toAffine.Point) = .some x y h := by
  sorry

/-- **The reduction sieve** (README 3.25), in the generality of any family of homomorphisms to
groups killed by `p`: a `p`-divisible combination dies in every target. -/
theorem saturationSieve_sound {A : Type*} [AddCommGroup A] (p : ℕ) {m : ℕ} (g : Fin m → A)
    {ι : Type*} (C : ι → Type*) [∀ i, AddCommGroup (C i)] (ψ : ∀ i, A →+ C i)
    (hC : ∀ i (c : C i), p • c = 0) (b : Fin m → ℤ) (hb : ∃ y : A, ∑ j, b j • g j = p • y) :
    ∀ i, ∑ j, b j • ψ i (g j) = 0 := by
  sorry

end EllipticCurves

/-! ## Layer CN.4: Validated numerics and finite analytic certificates -/

section Intervals

/-- **Signed rational interval product** (README 4.1): the hull of the four corner products.
Mathlib's `NonemptyInterval` product is the monotone one and does not apply here. -/
def intervalMul (I J : NonemptyInterval ℚ) : NonemptyInterval ℚ :=
  ⟨(min (min (I.fst * J.fst) (I.fst * J.snd)) (min (I.snd * J.fst) (I.snd * J.snd)),
    max (max (I.fst * J.fst) (I.fst * J.snd)) (max (I.snd * J.fst) (I.snd * J.snd))),
    (min_le_left _ _).trans ((min_le_left _ _).trans ((le_max_left _ _).trans (le_max_left _ _)))⟩

/-- **Enclosure under multiplication** (README 4.2). -/
theorem intervalMul_sound (I J : NonemptyInterval ℚ) (x y : ℝ)
    (hx : (I.fst : ℝ) ≤ x ∧ x ≤ I.snd) (hy : (J.fst : ℝ) ≤ y ∧ y ≤ J.snd) :
    ((intervalMul I J).fst : ℝ) ≤ x * y ∧ x * y ≤ (intervalMul I J).snd := by
  sorry

/-- `[−1, 1]·[−1, 1]` has lower endpoint `−1`, not `1`. -/
example : (intervalMul ⟨(-1, 1), by norm_num⟩ ⟨(-1, 1), by norm_num⟩).fst = -1 := by
  norm_num [intervalMul]

/-- **Partial interval reciprocal** (README 4.3): failure exactly when the interval contains `0`. -/
def intervalInv (I : NonemptyInterval ℚ) : Option (NonemptyInterval ℚ) :=
  if h : I.fst ≤ 0 ∧ 0 ≤ I.snd then none
  else some ⟨(I.snd⁻¹, I.fst⁻¹), by
    have hle := I.fst_le_snd
    by_cases h0 : 0 < I.fst
    · exact inv_anti₀ h0 hle
    · have hs : I.snd < 0 := by
        by_contra hs; exact h ⟨le_of_not_gt h0, le_of_not_gt hs⟩
      exact (inv_le_inv_of_neg hs (lt_of_le_of_lt hle hs)).2 hle⟩

/-- **Enclosure under reciprocal** (README 4.4). -/
theorem intervalInv_sound (I J : NonemptyInterval ℚ) (h : intervalInv I = some J) (x : ℝ)
    (hx : (I.fst : ℝ) ≤ x ∧ x ≤ I.snd) : x ≠ 0 ∧ (J.fst : ℝ) ≤ x⁻¹ ∧ x⁻¹ ≤ J.snd := by
  sorry

example : intervalInv (NonemptyInterval.pure 0) = none := by simp [intervalInv]

/-- **Outward dyadic rounding** (README 4.5): floor and ceiling on the `2^(−p)` grid. -/
def dyadicHull (p : ℕ) (I : NonemptyInterval ℚ) : NonemptyInterval ℚ :=
  ⟨((⌊2 ^ p * I.fst⌋ : ℚ) / 2 ^ p, (⌈2 ^ p * I.snd⌉ : ℚ) / 2 ^ p), by
    apply div_le_div_of_nonneg_right _ (by positivity)
    exact (Int.floor_le _).trans
      ((mul_le_mul_of_nonneg_left I.fst_le_snd (by positivity)).trans (Int.le_ceil _))⟩

/-- Outward rounding at precision zero sends `−1/3` to `[−1,0]`. -/
example : (dyadicHull 0 (NonemptyInterval.pure (-1 / 3))).fst = -1 ∧
    (dyadicHull 0 (NonemptyInterval.pure (-1 / 3))).snd = 0 := by
  norm_num [dyadicHull]

/-- **Width added by rounding** (README 4.6). -/
theorem dyadicHull_width (p : ℕ) (I : NonemptyInterval ℚ) :
    (dyadicHull p I).snd - (dyadicHull p I).fst < I.snd - I.fst + 2 / 2 ^ p := by
  sorry

/-- **Rational complex boxes** (README 4.7). -/
def complexBoxSet (R I : NonemptyInterval ℚ) : Set ℂ :=
  {z | ((R.fst : ℝ) ≤ z.re ∧ z.re ≤ R.snd) ∧ ((I.fst : ℝ) ≤ z.im ∧ z.im ≤ I.snd)}

/-- The singleton imaginary box contains `i` and excludes zero. -/
example : Complex.I ∈ complexBoxSet (NonemptyInterval.pure 0) (NonemptyInterval.pure 1) ∧
    0 ∉ complexBoxSet (NonemptyInterval.pure 0) (NonemptyInterval.pure 1) := by
  sorry

/-- **Unique integer extraction** (README 4.8). -/
def uniqueInteger (I : NonemptyInterval ℚ) : Option ℤ :=
  if ⌈I.fst⌉ = ⌊I.snd⌋ then some ⌈I.fst⌉ else none

/-- **Recovery of a known integral value** (README 4.9). -/
theorem uniqueInteger_sound (I : NonemptyInterval ℚ) (z w : ℤ)
    (hz : (I.fst : ℝ) ≤ z ∧ (z : ℝ) ≤ I.snd) (h : uniqueInteger I = some w) : z = w := by
  sorry

example : uniqueInteger (NonemptyInterval.pure 1) = some 1 := by simp [uniqueInteger]

end Intervals

section ExplicitFormula

open Real

/-- **The Odlyzko tail kernel** (README 4.14): `r(x) = 2π² e^(−x)/(x² + π²)²`. -/
def ctTailKernel (x : ℝ) : ℝ :=
  2 * π ^ 2 * exp (-x) / (x ^ 2 + π ^ 2) ^ 2

/-- The kernel's normalization at zero is `2/π²`. -/
example : ctTailKernel 0 = 2 / Real.pi ^ 2 := by
  sorry

theorem ctTailKernel_pos (x : ℝ) : 0 < ctTailKernel x := by
  unfold ctTailKernel; positivity

/-- **Geometric tail bound** (README 4.15). -/
theorem ctTailKernel_tail (α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ) :
    Summable (fun n : ℕ => ctTailKernel (α * (b + n))) ∧
      ∑' n : ℕ, ctTailKernel (α * (b + (N + n))) ≤ ctTailKernel (α * (b + N)) / (1 - exp (-α)) := by
  sorry

end ExplicitFormula

/-- **Complete isolation of the roots of a rational polynomial** (README 4.19). -/
theorem isolatePolynomialRoots (f : ℚ[X]) (hf : f ≠ 0) :
    ∃ l : List AlgebraicRootCertificate, (∀ c ∈ l, c.poly = f) ∧ (l.map (·.value)).Nodup ∧
      l.Pairwise (fun c d => Disjoint (complexBoxSet c.re c.im) (complexBoxSet d.re d.im)) ∧
      ∀ z : ℂ, aeval z f = 0 ↔ z ∈ l.map (·.value) := by
  sorry

/-- **Platt's bounded-height theorem** (README 4.22): for primitive characters of modulus
`q ≤ 400000`, zeros in the strip up to height `H(q)` lie on the critical line; the parity in `H(q)`
is that of the modulus. -/
theorem platt_bounded_height {q : ℕ} [NeZero q] (hq : q ≤ 400000) (χ : DirichletCharacter ℂ q)
    (hχ : χ.IsPrimitive) (s : ℂ) (hs : 0 < s.re ∧ s.re < 1)
    (ht : |s.im| ≤ if Even q then max (10 ^ 8 / (q : ℝ)) (7.5 * 10 ^ 7 / (q : ℝ) + 200)
      else max (10 ^ 8 / (q : ℝ)) (3.75 * 10 ^ 7 / (q : ℝ) + 200))
    (h0 : χ.LFunction s = 0) : s.re = 1 / 2 := by
  sorry

/-- **Platt's central nonvanishing** (README 4.23). -/
theorem platt_central_nonvanishing {q : ℕ} [NeZero q] (hq : q ≤ 2000000)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) : χ.LFunction (1 / 2) ≠ 0 := by
  sorry

/-- **No real zeros for conductor at most `400000`** (README 4.24). -/
theorem small_conductor_no_real_zero {q : ℕ} [NeZero q] (hq : q ≤ 400000)
    (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (s : ℝ) (hs : 0 < s ∧ s < 1) :
    χ.LFunction s ≠ 0 := by
  sorry

section Gram

variable {n : ℕ}

/-- **Entrywise lower bounds on effective vectors** (README 4.25). -/
theorem effectiveGram_lower (A B : Matrix (Fin n) (Fin n) ℝ) (hAB : ∀ i j, B i j ≤ A i j)
    (x : Fin n → ℝ) (hx : ∀ i, 0 ≤ x i) :
    ∑ i, ∑ j, B i j * x i * x j ≤ ∑ i, ∑ j, A i j * x i * x j := by
  sorry

open Matrix in
/-- **Loewner lower bounds** (README 4.28). -/
theorem loewnerGram_lower (A B : Matrix (Fin n) (Fin n) ℝ) (h : (A - B).PosSemidef)
    (x : Fin n → ℝ) : x ⬝ᵥ (B *ᵥ x) ≤ x ⬝ᵥ (A *ᵥ x) := by
  sorry

/-- **Rational witness of Gram negativity** (README 4.29): a nonzero nonnegative rational vector
whose quadratic form with the upper endpoints is negative. -/
structure NegativeGramCertificate (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) where
  vector : Fin n → ℚ
  nonneg : ∀ i, 0 ≤ vector i
  ne_zero : vector ≠ 0
  upper_neg : ∑ i, ∑ j, (I i j).snd * vector i * vector j < 0

/-- In dimension zero no nonzero negative Gram witness exists. -/
example (I : Matrix (Fin 0) (Fin 0) (NonemptyInterval ℚ)) :
    ¬ Nonempty (NegativeGramCertificate I) := by
  sorry

/-- **Soundness** (README 4.30): every real matrix inside the intervals is negative on the
witness. -/
theorem NegativeGramCertificate.sound (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ))
    (c : NegativeGramCertificate I) (A : Matrix (Fin n) (Fin n) ℝ)
    (hA : ∀ i j, ((I i j).fst : ℝ) ≤ A i j ∧ A i j ≤ (I i j).snd) :
    ∑ i, ∑ j, A i j * c.vector i * c.vector j < 0 := by
  sorry

/-- **Finite Gram-negativity checker** (README 4.32). -/
def checkNegativeGram (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) : Bool :=
  decide (∀ i, 0 ≤ t i) && decide (t ≠ 0) && decide (∑ i, ∑ j, (I i j).snd * t i * t j < 0)

/-- The one-dimensional interval `[−2, −1]` with vector `1` passes; `[−1, 1]` does not. -/
example : checkNegativeGram (n := 1) (fun _ _ => ⟨(-2, -1), by norm_num⟩) (fun _ => 1) = true ∧
    checkNegativeGram (n := 1) (fun _ _ => ⟨(-1, 1), by norm_num⟩) (fun _ => 1) = false := by
  sorry

theorem checkNegativeGram_certificate (I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ))
    (t : Fin n → ℚ) (h : checkNegativeGram I t = true) :
    ∃ c : NegativeGramCertificate I, c.vector = t := by
  sorry

end Gram

/-- **Finite family of Gram certificates** (README 4.33): every row's checker passes. -/
def checkGramDataset
    (rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ))) : Bool :=
  rows.all fun r => checkNegativeGram r.2.1 r.2.2

example : checkGramDataset [] = true := rfl

/-- Appending a zero-vector row makes the entire dataset fail. -/
example : checkGramDataset
    [⟨1, (fun _ _ => ⟨(-2, -1), by norm_num⟩), (fun _ => 1)⟩,
     ⟨1, (fun _ _ => ⟨(-2, -1), by norm_num⟩), (fun _ => 0)⟩] = false := by
  sorry

/-- **The multiplicity lift** (README 4.34): `x_(i,r) = t_i/m_i` turns the block matrix
`A·δ − K_(ij)` into `β = (A/m_i)δ_ij − K_ij`. -/
theorem multiplicityGram_lift {n : ℕ} (m : Fin n → ℕ) (hm : ∀ i, 0 < m i) (A : ℝ)
    (Kmat : Matrix (Fin n) (Fin n) ℝ) (t : Fin n → ℝ) :
    ∑ a : (Σ i, Fin (m i)), ∑ b : (Σ i, Fin (m i)),
        ((if a = b then A else 0) - Kmat a.1 b.1) * (t a.1 / m a.1) * (t b.1 / m b.1) =
      ∑ i, ∑ j, ((if i = j then A / m i else 0) - Kmat i j) * t i * t j := by
  sorry

/-- The two-block witness has value `−34` in both normalizations. -/
example :
    (∑ i : Fin 2, ∑ j : Fin 2,
      (!![2, -2; -2, -2] : Matrix (Fin 2) (Fin 2) ℚ) i j *
        (![2, 3] : Fin 2 → ℚ) i * (![2, 3] : Fin 2 → ℚ) j) = -34 ∧
    (30 - (4 + 24 + 36) : ℚ) = -34 := by
  norm_num [Fin.sum_univ_two]

/-!
## Targets stated only in README.md

The README states these targets with their hypotheses, sources and checks. Their statements
need constructions that are themselves targets (root isolation, the Miller basis and integral
Hecke matrices, residual polynomials, `p`-adic ball arithmetic, enclosures of special functions,
the Fincke–Pohst recursion and the saturation algorithm), so they are not stated here.

* `presentationChange` (0.17), `aks` (1.13), `millerBasis` (3.3): the executable maps and
  chosen basis are README constructions; the predicates, certificates and existence signatures are above.
* `rationalRootCertificate` (0.9), `algebraicEqual` (0.13), `phiResidualPolynomial` (2.19),
  `ore_residual_irreducible` (2.20), `card_padicRoots_eq` (2.23), `modularDataEqual` (3.5),
  `integralHeckeMatrix` (3.7), `weight38_nonordinary_det` (3.10),
  `NonordinaryLevelOnePair` (3.11), `small_nonordinary_primes` (3.12),
  `nonordinary_pairs_lt_200` (3.13), `weight82_companion_system` (3.14),
  `OrdinaryCompanionPair` (3.15), `corrected_ordinary_companion_list` (3.16),
  `LocalImageCertificate` (3.18), `exists_complete_localImageCertificate` (3.20), `localImage_of_good_odd` (3.21),
  `pSaturationTest` (3.26), `padicNormalize` (4.10), `padicAdd` (4.11), `padicMul` (4.12),
  `padicInverse` (4.13), `ctTailKernel_alternating_tail` (4.16), `ctExplicitFormula` (4.17),
  `ctEnclosure` (4.18), `dirichletLBox` (4.20), `cuspLBox` (4.21), `fpEnumeration` (4.26),
  `fpEnumeration_complete` (4.27), `effectiveEllipsoidCover` (4.31)
-/

end TauCetiRoadmap.ComputationalNumberTheory
