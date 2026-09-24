import Mathlib.Algebra.LinearRecurrence
import Mathlib.Algebra.Module.Lattice
import Mathlib.Algebra.Module.PID
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.Polynomial.Module.AEval
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.QuadraticAlgebra.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic
import Mathlib.Analysis.Analytic.Order
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Analysis.Complex.TaylorSeries
import Mathlib.Analysis.Real.OfDigits
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Computability.DFA
import Mathlib.Data.Int.GCD
import Mathlib.Data.Int.ModEq
import Mathlib.Data.Nat.Digits.Defs
import Mathlib.Data.Nat.DvdSequence
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Nat.Fib.Basic
import Mathlib.Data.Nat.ModEq
import Mathlib.Data.Nat.Squarefree
import Mathlib.Data.Nat.Totient
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Galois.Abelian
import Mathlib.FieldTheory.Galois.NormalBasis
import Mathlib.FieldTheory.KummerExtension
import Mathlib.FieldTheory.KummerPolynomial
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.FieldTheory.Minpoly.IsConjRoot
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Eigenspace.Charpoly
import Mathlib.LinearAlgebra.FreeModule.Finite.CardQuotient
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.Charpoly.Minpoly
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.LinearAlgebra.Trace
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.DiophantineApproximation.Basic
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.NumberTheory.FrobeniusNumber
import Mathlib.NumberTheory.FundamentalDiscriminant
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.JacobiSum.Basic
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic
import Mathlib.NumberTheory.LegendreSymbol.QuadraticReciprocity
import Mathlib.NumberTheory.LegendreSymbol.ZModChar
import Mathlib.NumberTheory.LucasLehmer
import Mathlib.NumberTheory.MahlerMeasure
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.House
import Mathlib.NumberTheory.NumberField.Ideal.Basic
import Mathlib.NumberTheory.NumberField.Ideal.KummerDedekind
import Mathlib.NumberTheory.NumberField.Units.Regulator
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Pell
import Mathlib.NumberTheory.PythagoreanTriples
import Mathlib.NumberTheory.RamificationInertia.Galois
import Mathlib.NumberTheory.Real.GoldenRatio
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.NumberTheory.SumFourSquares
import Mathlib.NumberTheory.SumTwoSquares
import Mathlib.NumberTheory.Zsqrtd.Basic
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.FDRep
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Algebraic.Defs
import Mathlib.RingTheory.Binomial
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Discriminant
import Mathlib.RingTheory.Frobenius
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.RingTheory.IntegralClosure.IntegralRestrict
import Mathlib.RingTheory.IsGaloisGroup.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.MvPolynomial.Expand
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.RingTheory.Polynomial.Cyclotomic.Roots
import Mathlib.RingTheory.Polynomial.Dickson
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.RingTheory.RootsOfUnity.EnoughRootsOfUnity
import Mathlib.RingTheory.Trace.Basic
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.ZMod.UnitsCyclic

/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ClassicalArithmeticCompletion.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ClassicalArithmeticCompletion: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports Mathlib only and elaborates at the Mathlib pin: the only messages are
`declaration uses 'sorry'` warnings. Where a node imports a Tau Ceti declaration, the
section says so in a comment and states locally only what the prototype needs.

One section per layer, CA.0 to CA.7, in the order of the roadmap; later sections use the
declarations of earlier ones (CA.5 uses CA.3's Hermite normal form, CA.3's rational
canonical form uses the companion block that CA.2 defines). Everything the pinned
libraries already contain -- quadratic reciprocity, Euler's criterion, Gauss and Jacobi
sums, the linear recurrence API, the elementary-divisor structure theorem, Pell, the
two- and four-square theorems, the Mahler measure of a polynomial, the house, the
normal basis theorem -- is imported, not restated.
-/

-- ===== CA.0 =====

/-!
## CA.0 Divisibility and multiplicative arithmetic

The layer is built: greatest common divisors with Bézout and the extended Euclidean algorithm,
unique factorisation, congruences, the Chinese remainder theorem for coprime moduli, valuations
with Legendre's formula, arithmetic functions, Dirichlet convolution and Möbius inversion are
all in the pinned Mathlib and are imported, not restated. The uniqueness half of the Chinese
remainder theorem at non-coprime moduli is `Int.modEq_and_modEq_iff_modEq_lcm`. The one
statement prototyped here is its existence half over the integers; `Nat.chineseRemainder'` is
the natural-number form.
-/

namespace TauCeti.ClassicalArithmetic

section CA0

/-- `CA.0/crt-at-non-coprime-moduli-over-the-integers`: two congruences `x ≡ a [ZMOD m]` and
`x ≡ b [ZMOD n]` have a common integer solution exactly when `a ≡ b` modulo `gcd m n`. No sign
or coprimality hypothesis is needed: congruence modulo `0` is equality, and `Int.gcd` is taken
on absolute values. When a solution exists, the solution set is one class modulo `lcm m n`, by
`Int.modEq_and_modEq_iff_modEq_lcm`. -/
theorem int_exists_modEq_and_modEq_iff (m n a b : ℤ) :
    (∃ x : ℤ, x ≡ a [ZMOD m] ∧ x ≡ b [ZMOD n]) ↔ a ≡ b [ZMOD (Int.gcd m n : ℤ)] := by
  sorry

/-- Acceptance: `x ≡ 1 [ZMOD 4]` and `x ≡ 3 [ZMOD 6]` are compatible, since `1 ≡ 3 [ZMOD 2]`
(`x = 9`). -/
example : ∃ x : ℤ, x ≡ 1 [ZMOD 4] ∧ x ≡ 3 [ZMOD 6] := by
  sorry

/-- Acceptance: `x ≡ 0 [ZMOD 4]` and `x ≡ 1 [ZMOD 6]` are incompatible, since the residues
differ modulo `gcd 4 6 = 2`; the product criterion `mod 24` is never the right one. -/
example : ¬ ∃ x : ℤ, x ≡ 0 [ZMOD 4] ∧ x ≡ 1 [ZMOD 6] := by
  sorry

/-- Acceptance: for `m = n` the criterion is `a ≡ b [ZMOD m]`. -/
example (m a b : ℤ) : (∃ x : ℤ, x ≡ a [ZMOD m] ∧ x ≡ b [ZMOD m]) ↔ a ≡ b [ZMOD m] := by
  sorry

end CA0

end TauCeti.ClassicalArithmetic


-- ===== CA.1 =====

/-!
## CA.1 Residues and reciprocity

Built and imported, not restated: Euler's criterion (`ZMod.euler_criterion`,
`FiniteField.isSquare_iff`), quadratic reciprocity for the Legendre and Jacobi symbols with both
supplementary laws (`legendreSym.quadratic_reciprocity`, `jacobiSym.quadratic_reciprocity`,
`legendreSym.at_neg_one`, `legendreSym.at_two`), the characters `ZMod.χ₄`, `ZMod.χ₈`, `ZMod.χ₈'`,
Gauss and Jacobi sums with their product identities, the cyclicity criterion
`ZMod.isCyclic_units_iff`, `ZMod.orderOf_five`, Dirichlet characters with their conductor and
primitivity, and `Int.IsFundamentalDiscr`.

Imported from Tau Ceti (not built locally, so not imported here): the prime-discriminant
characters `TauCeti.Multiquadratic.primeDiscriminantCharFun` and the genus characters
`TauCeti.Multiquadratic.genusCharFun` (from which `kroneckerCharacter` is bundled), the
prime-discriminant factorisation of a fundamental discriminant, `fundamentalDiscriminant`, and
`Rat.exists_squarefree_int_mul_sq`.

Imported from roadmaps (not built at the pin): the norm-equation Hilbert symbol of
Quadratic Form Invariants 6C, restated below as `normEquationSymbol` only so that the comparison
statements elaborate; the degree-`n` norm-residue symbol of `K2SymbolsBrauer:T.7`; the local and
global Artin maps of Class Field Theory, Layers 6 and 11. The three theorems that need the last two
(the tame formula, the degree-`n` Hilbert product formula and the power reciprocity law) cannot be
stated with the pinned libraries and are recorded as comments with their intended form.
-/

open NumberField

namespace TauCeti.ClassicalArithmetic

section CA1

/-! ### Units modulo a power of two -/

/-- The unit `5` modulo `2 ^ (e + 3)`. -/
def unitsTwoPowFive (e : ℕ) : (ZMod (2 ^ (e + 3)))ˣ :=
  ZMod.unitOfCoprime 5 (Nat.Coprime.pow_right _ (by norm_num))

/-- `CA.1/unit-group-of-a-power-of-two`: the units modulo `2 ^ (e + 3)` are `{±1} × ⟨5⟩`,
with `-1 ↦ (1, 0)` and `5 ↦ (0, 1)`. -/
noncomputable def unitsTwoPowEquiv (e : ℕ) :
    (ZMod (2 ^ (e + 3)))ˣ ≃* Multiplicative (ZMod 2 × ZMod (2 ^ (e + 1))) := sorry

theorem unitsTwoPowEquiv_symm_apply (e : ℕ) (s : ZMod 2) (k : ZMod (2 ^ (e + 1))) :
    (unitsTwoPowEquiv e).symm (Multiplicative.ofAdd (s, k)) =
      (-1) ^ s.val * unitsTwoPowFive e ^ k.val := by
  sorry

@[simp] theorem unitsTwoPowEquiv_neg_one (e : ℕ) :
    unitsTwoPowEquiv e (-1) = Multiplicative.ofAdd (1, 0) := by
  sorry

@[simp] theorem unitsTwoPowEquiv_five (e : ℕ) :
    unitsTwoPowEquiv e (unitsTwoPowFive e) = Multiplicative.ofAdd (0, 1) := by
  sorry

theorem neg_one_notMem_zpowers_unitsTwoPowFive (e : ℕ) :
    (-1 : (ZMod (2 ^ (e + 3)))ˣ) ∉ Subgroup.zpowers (unitsTwoPowFive e) := by
  sorry

/-- Agreement with Mathlib's `ZMod.orderOf_five`, read in the unit group. -/
theorem orderOf_unitsTwoPowFive (e : ℕ) : orderOf (unitsTwoPowFive e) = 2 ^ (e + 1) := by
  sorry

/-- Unit test `unitsTwoPow_test_eight_klein`: modulo `8` every unit squares to one. -/
example : ∀ u : (ZMod 8)ˣ, u ^ 2 = 1 := by
  sorry

/-- Unit test `unitsTwoPow_test_sixteen_order_five`: modulo `16` the class of `5` has order
`4 = 2 ^ (4 - 2)`, not `8`. -/
example : orderOf (unitsTwoPowFive 1) = 4 := by
  sorry

/-- Unit test `unitsTwoPow_test_not_cyclic`: for `e ≥ 3` the group is not cyclic, so no single
generator exists. -/
example (e : ℕ) : ¬ IsCyclic (ZMod (2 ^ (e + 3)))ˣ := by
  sorry

/-- Unit test `unitsTwoPow_test_four_cyclic`: modulo `4` the group is cyclic of order two, which
is why the decomposition starts at `2 ^ 3`. -/
example : IsCyclic (ZMod 4)ˣ := by
  sorry

/-- Unit test `unitsTwoPow_test_seven_not_generator`: modulo `16` the class of `7` has order `2`,
so `7` cannot replace `5` as the generator of the cyclic factor. -/
example : orderOf (ZMod.unitOfCoprime 7 (by norm_num) : (ZMod 16)ˣ) = 2 := by
  sorry

/-- `CA.1/squares-modulo-a-power-of-two`: a unit modulo `2 ^ (e + 3)` is a square exactly when it
is `1` modulo `8`. -/
theorem isSquare_units_two_pow_iff (e : ℕ) (u : (ZMod (2 ^ (e + 3)))ˣ) :
    IsSquare u ↔ ZMod.unitsMap (pow_dvd_pow 2 (by omega : 3 ≤ e + 3)) u = 1 := by
  sorry

/-- `CA.1/principal-units-modulo-an-odd-prime-power-are-squares`. -/
theorem isSquare_of_unitsMap_eq_one {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) (k : ℕ)
    (u : (ZMod (p ^ (k + 1)))ˣ)
    (hu : ZMod.unitsMap (dvd_pow_self p (Nat.succ_ne_zero k)) u = 1) : IsSquare u := by
  sorry

/-! ### Power residue criteria -/

/-- `CA.1/power-residue-criterion-in-a-cyclic-group`: the `d`-th powers are the kernel of
raising to the power `N / gcd N d`. -/
theorem range_powMonoidHom_eq_ker (G : Type*) [CommGroup G] [IsCyclic G] [Finite G] (d : ℕ) :
    (powMonoidHom d : G →* G).range =
      (powMonoidHom (Nat.card G / (Nat.card G).gcd d) : G →* G).ker := by
  sorry

theorem mem_range_powMonoidHom_iff {G : Type*} [CommGroup G] [IsCyclic G] [Finite G] (d : ℕ)
    (a : G) :
    a ∈ (powMonoidHom d : G →* G).range ↔ a ^ (Nat.card G / (Nat.card G).gcd d) = 1 := by
  sorry

/-- `CA.1/power-residue-criterion-in-a-finite-field`. -/
theorem exists_pow_eq_iff_pow_eq_one {F : Type*} [Field F] [Fintype F] (n : ℕ) {a : F}
    (ha : a ≠ 0) :
    (∃ b : F, b ^ n = a) ↔
      a ^ ((Fintype.card F - 1) / (Fintype.card F - 1).gcd n) = 1 := by
  sorry

/-! ### The squarefree part of a rational number -/

/-- `CA.1/squarefree-part-of-a-rational`: the signed squarefree integer in the square class of a
nonzero rational; `0` at `0`. -/
noncomputable def ratSquarefreePart (u : ℚ) : ℤ := sorry

theorem squarefree_ratSquarefreePart {u : ℚ} (hu : u ≠ 0) : Squarefree (ratSquarefreePart u) := by
  sorry

theorem exists_eq_ratSquarefreePart_mul_sq {u : ℚ} (hu : u ≠ 0) :
    ∃ c : ℚ, c ≠ 0 ∧ u = ratSquarefreePart u * c ^ 2 := by
  sorry

theorem ratSquarefreePart_eq_iff {u : ℚ} (hu : u ≠ 0) {d : ℤ} (hd : Squarefree d) :
    ratSquarefreePart u = d ↔ ∃ c : ℚ, c ≠ 0 ∧ u = d * c ^ 2 := by
  sorry

theorem ratSquarefreePart_mul_sq {u t : ℚ} (hu : u ≠ 0) (ht : t ≠ 0) :
    ratSquarefreePart (u * t ^ 2) = ratSquarefreePart u := by
  sorry

theorem ratSquarefreePart_intCast_of_squarefree {d : ℤ} (hd : Squarefree d) :
    ratSquarefreePart d = d := by
  sorry

theorem prime_dvd_ratSquarefreePart_iff {u : ℚ} (hu : u ≠ 0) {p : ℕ} [Fact p.Prime] :
    (p : ℤ) ∣ ratSquarefreePart u ↔ Odd (padicValRat p u) := by
  sorry

theorem ratSquarefreePart_pos_iff {u : ℚ} : 0 < ratSquarefreePart u ↔ 0 < u := by
  sorry

@[simp] theorem ratSquarefreePart_zero : ratSquarefreePart 0 = 0 := by
  sorry

/-- Unit test `ratSquarefreePart_test_eight_ninths`: `8 / 9 = 2 · (2 / 3) ^ 2`. -/
example : ratSquarefreePart (8 / 9) = 2 := by
  sorry

/-- Unit test `ratSquarefreePart_test_neg_twelve`: `-12 = -3 · 2 ^ 2`; the sign is kept. -/
example : ratSquarefreePart (-12) = -3 := by
  sorry

/-- Unit test `ratSquarefreePart_test_one`: the square class of `1` is represented by `1`. -/
example : ratSquarefreePart 1 = 1 := by
  sorry

/-- Unit test `ratSquarefreePart_test_neg_one`: `-1` is not a square, so its part is `-1` and
not `1`; a definition through absolute values fails here. -/
example : ratSquarefreePart (-1) = -1 := by
  sorry

/-! ### Primitivity of the prime-discriminant characters and of products -/

/-- `CA.1/dyadic-characters-are-primitive`: `χ₄`, `χ₈` and `χ₈'` are primitive. -/
theorem isPrimitive_chi4 : DirichletCharacter.IsPrimitive (ZMod.χ₄ : DirichletCharacter ℤ 4) := by
  sorry

theorem isPrimitive_chi8 : DirichletCharacter.IsPrimitive (ZMod.χ₈ : DirichletCharacter ℤ 8) := by
  sorry

theorem isPrimitive_chi8' : DirichletCharacter.IsPrimitive (ZMod.χ₈' : DirichletCharacter ℤ 8) := by
  sorry

/-- `CA.1/legendre-character-is-primitive`. -/
theorem isPrimitive_quadraticChar_zmod (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    DirichletCharacter.IsPrimitive (quadraticChar (ZMod p) : DirichletCharacter ℤ p) := by
  sorry

/-- `CA.1/primitivity-of-a-product-at-coprime-levels`. -/
theorem isPrimitive_changeLevel_mul_of_coprime {R : Type*} [CommMonoidWithZero R] {m n : ℕ}
    (χ : DirichletCharacter R m) (ψ : DirichletCharacter R n) (hχ : χ.IsPrimitive)
    (hψ : ψ.IsPrimitive) (hmn : m.Coprime n) :
    (DirichletCharacter.changeLevel (dvd_mul_right m n) χ *
      DirichletCharacter.changeLevel (dvd_mul_left n m) ψ).IsPrimitive := by
  sorry

/-! ### The Kronecker character of a fundamental discriminant -/

/-- `CA.1/kronecker-character`: for a fundamental discriminant `D`, the quadratic Dirichlet
character `n ↦ (D / n)` of level `|D|`, the product of the prime-discriminant characters of the
factorisation of `D` (Tau Ceti's `genusCharFun`, bundled). Its value at a `D` that is not a
fundamental discriminant is not specified. -/
noncomputable def kroneckerCharacter (D : ℤ) : DirichletCharacter ℤ D.natAbs := sorry

theorem kroneckerCharacter_apply_prime {D : ℤ} (hD : Int.IsFundamentalDiscr D) {q : ℕ}
    [Fact q.Prime] (hq : q ≠ 2) : kroneckerCharacter D q = legendreSym q D := by
  sorry

theorem kroneckerCharacter_apply_two {D : ℤ} (hD : Int.IsFundamentalDiscr D) :
    kroneckerCharacter D 2 = if 2 ∣ D then 0 else if D % 8 = 1 then 1 else -1 := by
  sorry

theorem kroneckerCharacter_apply_neg_one {D : ℤ} (hD : Int.IsFundamentalDiscr D) :
    kroneckerCharacter D (-1) = D.sign := by
  sorry

theorem kroneckerCharacter_isQuadratic {D : ℤ} (hD : Int.IsFundamentalDiscr D) :
    (kroneckerCharacter D).IsQuadratic := by
  sorry

theorem kroneckerCharacter_apply_eq_zero_iff {D : ℤ} (hD : Int.IsFundamentalDiscr D) (n : ℤ) :
    kroneckerCharacter D n = 0 ↔ ¬ IsCoprime n D := by
  sorry

theorem kroneckerCharacter_natCast_eq_jacobiSym {D : ℤ} (hD : Int.IsFundamentalDiscr D) {n : ℕ}
    (hn : Odd n) : kroneckerCharacter D n = jacobiSym D n := by
  sorry

theorem kroneckerCharacter_mul {D₁ D₂ : ℤ} (hD₁ : Int.IsFundamentalDiscr D₁)
    (hD₂ : Int.IsFundamentalDiscr D₂) (h : IsCoprime D₁ D₂) (n : ℤ) :
    kroneckerCharacter (D₁ * D₂) n = kroneckerCharacter D₁ n * kroneckerCharacter D₂ n := by
  sorry

@[simp] theorem kroneckerCharacter_one : kroneckerCharacter 1 = 1 := by
  sorry

theorem kroneckerCharacter_neg_four (n : ℤ) : kroneckerCharacter (-4) n = ZMod.χ₄ n := by
  sorry

theorem kroneckerCharacter_eight (n : ℤ) : kroneckerCharacter 8 n = ZMod.χ₈ n := by
  sorry

theorem kroneckerCharacter_neg_eight (n : ℤ) : kroneckerCharacter (-8) n = ZMod.χ₈' n := by
  sorry

/-- At the odd prime discriminant `p* = (-1) ^ ((p - 1) / 2) * p` the character is the Legendre
symbol modulo `p`. -/
theorem kroneckerCharacter_oddPrimeDiscr {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) (n : ℤ) :
    kroneckerCharacter ((-1) ^ ((p - 1) / 2) * p) n = legendreSym p n := by
  sorry

/-- Unit test `kroneckerCharacter_test_five_two`: `(5 / 2) = -1`, since `5 ≡ 5 (mod 8)`. -/
example : kroneckerCharacter 5 2 = -1 := by
  sorry

/-- Unit test `kroneckerCharacter_test_neg_three_two`: `(-3 / 2) = -1`, whereas Mathlib's
`jacobiSym (-3) 2` is `1`; the Kronecker character is not the Jacobi symbol at even arguments. -/
example : kroneckerCharacter (-3) 2 = -1 ∧ jacobiSym (-3) 2 = 1 := by
  sorry

/-- Unit test `kroneckerCharacter_test_twelve`: `(12 / 5) = -1`, `(12 / 7) = -1`,
`(12 / 11) = 1`. -/
example : kroneckerCharacter 12 5 = -1 ∧ kroneckerCharacter 12 7 = -1 ∧
    kroneckerCharacter 12 11 = 1 := by
  sorry

/-- Unit test `kroneckerCharacter_test_one`: the discriminant `1` gives the trivial character of
level `1`. -/
example : kroneckerCharacter 1 = 1 := by
  sorry

/-- `CA.1/kronecker-character-is-primitive`: the conductor of `kroneckerCharacter D` is `|D|`. -/
theorem kroneckerCharacter_isPrimitive {D : ℤ} (hD : Int.IsFundamentalDiscr D) :
    (kroneckerCharacter D).IsPrimitive := by
  sorry

/-! ### The primitive quadratic character of a rational square class -/

/-- The fundamental discriminant of the square class of `u`: `d` if `d ≡ 1 (mod 4)` and `4 d`
otherwise, for `d = ratSquarefreePart u` (Tau Ceti's `fundamentalDiscriminant d`). -/
noncomputable def squareclassDiscr (u : ℚ) : ℤ :=
  if ratSquarefreePart u % 4 = 1 then ratSquarefreePart u else 4 * ratSquarefreePart u

/-- `CA.1/quadratic-character-of-a-squareclass`: the primitive quadratic Dirichlet character
attached to the square class of `u ∈ ℚˣ`, of conductor `|squareclassDiscr u|`. -/
noncomputable def squareclassCharacter (u : ℚ) :
    DirichletCharacter ℤ (squareclassDiscr u).natAbs :=
  kroneckerCharacter (squareclassDiscr u)

theorem isFundamentalDiscr_squareclassDiscr {u : ℚ} (hu : u ≠ 0) :
    Int.IsFundamentalDiscr (squareclassDiscr u) := by
  sorry

theorem squareclassCharacter_isPrimitive {u : ℚ} (hu : u ≠ 0) :
    (squareclassCharacter u).IsPrimitive := by
  sorry

theorem squareclassCharacter_apply_prime {u : ℚ} (hu : u ≠ 0) {p : ℕ} [Fact p.Prime]
    (hp : p ≠ 2) (hpu : padicValRat p u = 0) :
    squareclassCharacter u p = legendreSym p (u.num * u.den) := by
  sorry

theorem squareclassDiscr_mul_sq {u t : ℚ} (hu : u ≠ 0) (ht : t ≠ 0) :
    squareclassDiscr (u * t ^ 2) = squareclassDiscr u := by
  sorry

@[simp] theorem squareclassDiscr_one : squareclassDiscr 1 = 1 := by
  sorry

theorem odd_prime_dvd_squareclassDiscr_iff {u : ℚ} (hu : u ≠ 0) {p : ℕ} [Fact p.Prime]
    (hp : p ≠ 2) : (p : ℤ) ∣ squareclassDiscr u ↔ Odd (padicValRat p u) := by
  sorry

theorem ordCompl_two_squareclassDiscr_eq_one_iff {u : ℚ} (hu : u ≠ 0) :
    ordCompl[2] (squareclassDiscr u).natAbs = 1 ↔
      ∃ ω ∈ ({1, -1, 2, -2} : Finset ℤ), ∃ t : ℚ, t ≠ 0 ∧ u = ω * t ^ 2 := by
  sorry

theorem factorization_two_squareclassDiscr {u : ℚ} (hu : u ≠ 0) :
    (squareclassDiscr u).natAbs.factorization 2 =
      if ratSquarefreePart u % 4 = 1 then 0
      else if ratSquarefreePart u % 4 = 3 then 2 else 3 := by
  sorry

theorem squareclassCharacter_apply_neg_one {u : ℚ} (hu : u ≠ 0) :
    squareclassCharacter u (-1) = if 0 < u then 1 else -1 := by
  sorry

theorem squareclassCharacter_mul {u v : ℚ} (hu : u ≠ 0) (hv : v ≠ 0) (n : ℤ)
    (hn : IsCoprime n (2 * u.num * u.den * v.num * v.den)) :
    squareclassCharacter (u * v) n = squareclassCharacter u n * squareclassCharacter v n := by
  sorry

/-- Unit test `squareclassCharacter_test_neg_one`: the square class of `-1` gives `χ₄`. -/
example : squareclassDiscr (-1) = -4 ∧ ∀ n : ℤ, squareclassCharacter (-1) n = ZMod.χ₄ n := by
  sorry

/-- Unit test `squareclassDiscr_test_two`: the square class of `2` has discriminant `8`. -/
example : squareclassDiscr 2 = 8 := by
  sorry

/-- Unit test `squareclassDiscr_test_eight_ninths`: `8 / 9` lies in the class of `2`. -/
example : squareclassDiscr (8 / 9) = 8 := by
  sorry

/-- Unit test `squareclassDiscr_test_three`: the class of `3` has conductor `12`, not `3`. -/
example : squareclassDiscr 3 = 12 := by
  sorry

/-- Unit test `squareclassDiscr_test_five`: the class of `5` has conductor `5`. -/
example : squareclassDiscr 5 = 5 := by
  sorry

/-- Unit test `squareclassDiscr_test_one`: the class of `1` has conductor `1`. -/
example : (squareclassDiscr 1).natAbs = 1 := by
  sorry

/-- `CA.1/primitive-characters-agreeing-at-almost-all-primes-are-equal`. -/
theorem eq_of_isPrimitive_of_apply_prime_eq {R : Type*} [CommRing R] [Nontrivial R] {N M : ℕ}
    [NeZero N] [NeZero M] (χ : DirichletCharacter R N) (ψ : DirichletCharacter R M)
    (hχ : χ.IsPrimitive) (hψ : ψ.IsPrimitive) (S : Finset ℕ)
    (h : ∀ p : ℕ, p.Prime → p ∉ S → χ p = ψ p) :
    N = M ∧ ∀ n : ℤ, χ n = ψ n := by
  sorry

/-! ### Conductors of primitive quadratic characters -/

/-- `CA.1/quadratic-conductor-is-not-twice-odd`. -/
theorem factorization_two_ne_one_of_isPrimitive {R : Type*} [CommRing R] {N : ℕ} [NeZero N]
    (χ : DirichletCharacter R N) (hχ : χ.IsPrimitive) :
    N.factorization 2 ≠ 1 := by
  sorry

/-- `CA.1/odd-part-of-a-quadratic-conductor-is-squarefree`. -/
theorem squarefree_ordCompl_two_of_isQuadratic {R : Type*} [CommRing R] {N : ℕ} [NeZero N]
    (χ : DirichletCharacter R N) (hq : χ.IsQuadratic) (hχ : χ.IsPrimitive) :
    Squarefree (ordCompl[2] N) := by
  sorry

/-- `CA.1/two-adic-conductor-bound` (Bennett–Siksek): the conductor `N` of a primitive quadratic
Dirichlet character satisfies `v₂(N) ≤ 3`, that is `N ≤ 8 · N^odd`. -/
theorem factorization_two_le_three_of_isQuadratic {R : Type*} [CommRing R] {N : ℕ} [NeZero N]
    (χ : DirichletCharacter R N) (hq : χ.IsQuadratic) (hχ : χ.IsPrimitive) :
    N.factorization 2 ≤ 3 := by
  sorry

/-! ### The Hilbert symbol of `ℚ` read in Mathlib's residue symbols

`normEquationSymbol K a b` is Quadratic Form Invariants 6C's `hilbertSymbol`: `1` when
`b = x ^ 2 - a * y ^ 2` has a solution in `K`, and `-1` otherwise. It is restated here only because
that roadmap is not built at the pin; it is replaced by the import once it is. -/

/-- Stand-in for Quadratic Form Invariants 6C's `hilbertSymbol` (its item 1, verbatim). -/
noncomputable def normEquationSymbol (K : Type*) [Field K] (a b : K) : ℤ :=
  open Classical in if ∃ x y : K, b = x ^ 2 - a * y ^ 2 then 1 else -1

/-- `CA.1/hilbert-symbol`, the odd-prime reading: for `u`, `w` prime to `p`,
`(p ^ α u, p ^ β w)_p = (-1) ^ (α β (p - 1) / 2) (u / p) ^ β (w / p) ^ α`. -/
theorem normEquationSymbol_padic_odd {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) {u w : ℤ}
    (hu : ¬ (p : ℤ) ∣ u) (hw : ¬ (p : ℤ) ∣ w) (α β : ℕ) :
    normEquationSymbol ℚ_[p] ((p : ℚ_[p]) ^ α * u) ((p : ℚ_[p]) ^ β * w) =
      (-1) ^ (α * β * ((p - 1) / 2)) * legendreSym p u ^ β * legendreSym p w ^ α := by
  sorry

/-- The archimedean value, imported from Global Quadratic Forms 4.4 and recorded for the reader:
`(a, b)_∞ = -1` exactly when `a < 0` and `b < 0`. -/
theorem normEquationSymbol_real {a b : ℝ} (ha : a ≠ 0) (hb : b ≠ 0) :
    normEquationSymbol ℝ a b = if a < 0 ∧ b < 0 then -1 else 1 := by
  sorry

/-- `CA.1/dyadic-hilbert-symbol-via-chi4-chi8`: for odd `u`, `w`,
`(2 ^ α u, 2 ^ β w)_2 = s(u, w) χ₈(w) ^ α χ₈(u) ^ β` with `s(u, w) = -1` exactly when
`χ₄(u) = χ₄(w) = -1`. -/
theorem normEquationSymbol_padic_two {u w : ℤ} (hu : Odd u) (hw : Odd w) (α β : ℕ) :
    normEquationSymbol ℚ_[2] ((2 : ℚ_[2]) ^ α * u) ((2 : ℚ_[2]) ^ β * w) =
      (if ZMod.χ₄ u = -1 ∧ ZMod.χ₄ w = -1 then -1 else 1) * ZMod.χ₈ w ^ α *
        ZMod.χ₈ u ^ β := by
  sorry

/-- Acceptance: `(-1, -1)_2 = -1`. -/
example : normEquationSymbol ℚ_[2] (-1) (-1) = -1 := by
  sorry

/-- Acceptance: `(2, 5)_2 = -1`. -/
example : normEquationSymbol ℚ_[2] 2 5 = -1 := by
  sorry

/-! ### The `n`-th power residue symbol -/

variable {K : Type*} [Field K] [NumberField K]

/-- `CA.1/norm-of-a-prime-is-one-modulo-n`. -/
theorem absNorm_modEq_one {n : ℕ} [NeZero n] {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ n)
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal] (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) :
    Ideal.absNorm 𝔭 ≡ 1 [MOD n] := by
  sorry

/-- `CA.1/power-residue-symbol`: for `𝔭 ∤ n`, the multiplicative character of the residue field
`𝓞 K ⧸ 𝔭` with values in the `n`-th roots of unity of `𝓞 K` characterised by
`(x / 𝔭)_n ≡ x ^ ((N 𝔭 - 1) / n) (mod 𝔭)`. When `𝔭 ∣ n` it is the trivial character. -/
noncomputable def powerResidueSymbol (n : ℕ) [NeZero n] [HasEnoughRootsOfUnity (𝓞 K) n]
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal] : MulChar (𝓞 K ⧸ 𝔭) (𝓞 K) := sorry

/-- `CA.1/power-residue-symbol-of-an-ideal`: for an ideal `𝔞` prime to `n` with factorisation
`𝔭₁ ⋯ 𝔭ᵣ`, `(α / 𝔞)_n = ∏ (α / 𝔭ᵢ)_n`. Its value at an ideal not prime to `n` is not specified. -/
noncomputable def powerResidueSymbolIdeal (n : ℕ) [NeZero n] [HasEnoughRootsOfUnity (𝓞 K) n]
    (𝔞 : Ideal (𝓞 K)) (α : 𝓞 K) : 𝓞 K := sorry

variable (n : ℕ) [NeZero n] [HasEnoughRootsOfUnity (𝓞 K) n]

theorem powerResidueSymbol_spec (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) {x : 𝓞 K ⧸ 𝔭} (hx : x ≠ 0) :
    Ideal.Quotient.mk 𝔭 (powerResidueSymbol n 𝔭 x) = x ^ ((Ideal.absNorm 𝔭 - 1) / n) := by
  sorry

theorem powerResidueSymbol_mem_rootsOfUnity (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) {x : 𝓞 K ⧸ 𝔭} (hx : x ≠ 0) :
    ∃ μ ∈ rootsOfUnity n (𝓞 K), (μ : 𝓞 K) = powerResidueSymbol n 𝔭 x := by
  sorry

theorem powerResidueSymbol_eq_iff (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) {x : 𝓞 K ⧸ 𝔭} (hx : x ≠ 0) {μ : (𝓞 K)ˣ}
    (hμ : μ ∈ rootsOfUnity n (𝓞 K)) :
    powerResidueSymbol n 𝔭 x = μ ↔
      Ideal.Quotient.mk 𝔭 (μ : 𝓞 K) = x ^ ((Ideal.absNorm 𝔭 - 1) / n) := by
  sorry

theorem powerResidueSymbol_zeta (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ n) :
    powerResidueSymbol n 𝔭 (Ideal.Quotient.mk 𝔭 ζ) = ζ ^ ((Ideal.absNorm 𝔭 - 1) / n) := by
  sorry

theorem powerResidueSymbol_pow_div (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) {d : ℕ} [NeZero d] [HasEnoughRootsOfUnity (𝓞 K) d]
    (hd : d ∣ n) (x : 𝓞 K ⧸ 𝔭) :
    powerResidueSymbol n 𝔭 x ^ (n / d) = powerResidueSymbol d 𝔭 x := by
  sorry

theorem orderOf_powerResidueSymbol (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) : orderOf (powerResidueSymbol n 𝔭) = n := by
  sorry

theorem powerResidueSymbol_of_not_coprime (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : ¬ (Ideal.absNorm 𝔭).Coprime n) : powerResidueSymbol n 𝔭 = 1 := by
  sorry

/-- Unit test `powerResidueSymbol_test_one`: for `n = 1` the symbol is the trivial character. -/
example [HasEnoughRootsOfUnity (𝓞 K) 1] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal] :
    powerResidueSymbol 1 𝔭 = 1 := by
  sorry

/-- Unit test `powerResidueSymbol_test_zeta_norm_four`: at a prime of norm `4` in a field
containing a primitive cube root of unity `ζ`, `(ζ / 𝔭)_3 = ζ ^ ((4 - 1) / 3) = ζ`. -/
example [HasEnoughRootsOfUnity (𝓞 K) 3] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : Ideal.absNorm 𝔭 = 4) {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ 3) :
    powerResidueSymbol 3 𝔭 (Ideal.Quotient.mk 𝔭 ζ) = ζ := by
  sorry

/-- Unit test `powerResidueSymbol_test_zeta_norm_seven`: at a prime of norm `7`,
`(ζ / 𝔭)_3 = ζ ^ 2`. -/
example [HasEnoughRootsOfUnity (𝓞 K) 3] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : Ideal.absNorm 𝔭 = 7) {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ 3) :
    powerResidueSymbol 3 𝔭 (Ideal.Quotient.mk 𝔭 ζ) = ζ ^ 2 := by
  sorry

/-- Unit test `powerResidueSymbol_test_not_sign`: the cubic symbol takes values that are not
`±1`, so a `±1`-valued "is a cube" indicator is not this object. -/
example [HasEnoughRootsOfUnity (𝓞 K) 3] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : Ideal.absNorm 𝔭 = 4) {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ 3) :
    powerResidueSymbol 3 𝔭 (Ideal.Quotient.mk 𝔭 ζ) ≠ 1 ∧
      powerResidueSymbol 3 𝔭 (Ideal.Quotient.mk 𝔭 ζ) ≠ -1 := by
  sorry

/-- Unit test `powerResidueSymbol_test_two_quadraticChar`: for `n = 2` the symbol is the
quadratic character of the residue field. -/
example [HasEnoughRootsOfUnity (𝓞 K) 2] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    [Fintype (𝓞 K ⧸ 𝔭)] [DecidableEq (𝓞 K ⧸ 𝔭)] (h𝔭 : (Ideal.absNorm 𝔭).Coprime 2)
    (x : 𝓞 K ⧸ 𝔭) :
    letI := Ideal.Quotient.field 𝔭
    powerResidueSymbol 2 𝔭 x = ((quadraticChar (𝓞 K ⧸ 𝔭) x : ℤ) : 𝓞 K) := by
  sorry

/-- `CA.1/power-residue-euler-criterion`. -/
theorem powerResidueSymbol_eq_one_iff (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) {x : 𝓞 K ⧸ 𝔭} (hx : x ≠ 0) :
    powerResidueSymbol n 𝔭 x = 1 ↔ ∃ y, y ^ n = x := by
  sorry

theorem powerResidueSymbolIdeal_of_isMaximal (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) (α : 𝓞 K) :
    powerResidueSymbolIdeal n 𝔭 α = powerResidueSymbol n 𝔭 (Ideal.Quotient.mk 𝔭 α) := by
  sorry

theorem powerResidueSymbolIdeal_mul_right {𝔞 𝔟 : Ideal (𝓞 K)}
    (h𝔞 : (Ideal.absNorm 𝔞).Coprime n) (h𝔟 : (Ideal.absNorm 𝔟).Coprime n) (α : 𝓞 K) :
    powerResidueSymbolIdeal n (𝔞 * 𝔟) α =
      powerResidueSymbolIdeal n 𝔞 α * powerResidueSymbolIdeal n 𝔟 α := by
  sorry

theorem powerResidueSymbolIdeal_mul_left {𝔞 : Ideal (𝓞 K)} (h𝔞 : (Ideal.absNorm 𝔞).Coprime n)
    (α β : 𝓞 K) :
    powerResidueSymbolIdeal n 𝔞 (α * β) =
      powerResidueSymbolIdeal n 𝔞 α * powerResidueSymbolIdeal n 𝔞 β := by
  sorry

@[simp] theorem powerResidueSymbolIdeal_top (α : 𝓞 K) :
    powerResidueSymbolIdeal n ⊤ α = 1 := by
  sorry

theorem powerResidueSymbolIdeal_eq_zero_iff {𝔞 : Ideal (𝓞 K)}
    (h𝔞 : (Ideal.absNorm 𝔞).Coprime n) (α : 𝓞 K) :
    powerResidueSymbolIdeal n 𝔞 α = 0 ↔ ¬ IsCoprime (Ideal.span {α}) 𝔞 := by
  sorry

theorem powerResidueSymbolIdeal_congr {𝔞 : Ideal (𝓞 K)} (h𝔞 : (Ideal.absNorm 𝔞).Coprime n)
    {α β : 𝓞 K} (h : α - β ∈ 𝔞) :
    powerResidueSymbolIdeal n 𝔞 α = powerResidueSymbolIdeal n 𝔞 β := by
  sorry

/-- Unit test `powerResidueSymbolIdeal_test_top`: the unit ideal gives `1`. -/
example (α : 𝓞 K) : powerResidueSymbolIdeal n ⊤ α = 1 := by
  sorry

/-- Unit test `powerResidueSymbolIdeal_test_sq`: at `𝔭 ^ 2` the symbol is the square of the
symbol at `𝔭`. -/
example (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal] (h𝔭 : (Ideal.absNorm 𝔭).Coprime n) (α : 𝓞 K) :
    powerResidueSymbolIdeal n (𝔭 ^ 2) α =
      powerResidueSymbol n 𝔭 (Ideal.Quotient.mk 𝔭 α) ^ 2 := by
  sorry

/-- Unit test `powerResidueSymbolIdeal_test_not_residue`: as for the Jacobi symbol, the value `1`
at a composite ideal does not make `α` a residue: a quadratic nonresidue modulo `𝔭` has symbol
`1` at `𝔭 ^ 2`. -/
example [HasEnoughRootsOfUnity (𝓞 K) 2] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (h𝔭 : (Ideal.absNorm 𝔭).Coprime 2) {α : 𝓞 K}
    (hα : powerResidueSymbol 2 𝔭 (Ideal.Quotient.mk 𝔭 α) = -1) :
    powerResidueSymbolIdeal 2 (𝔭 ^ 2) α = 1 ∧
      ¬ ∃ y : 𝓞 K ⧸ 𝔭 ^ 2, y ^ 2 = Ideal.Quotient.mk (𝔭 ^ 2) α := by
  sorry

/-- `CA.1/power-residue-symbol-galois-equivariance`: `σ ((α / 𝔞)_n) = (σ α / σ 𝔞)_n` for every
ring automorphism `σ` of `𝓞 K`. -/
theorem powerResidueSymbolIdeal_map_ringEquiv (σ : 𝓞 K ≃+* 𝓞 K) {𝔞 : Ideal (𝓞 K)}
    (h𝔞 : (Ideal.absNorm 𝔞).Coprime n) (α : 𝓞 K) :
    σ (powerResidueSymbolIdeal n 𝔞 α) = powerResidueSymbolIdeal n (𝔞.map σ) (σ α) := by
  sorry

/-- `CA.1/power-residue-symbol-and-frobenius`: an arithmetic Frobenius at a prime above `𝔭 ∤ n α`
moves an `n`-th root of `α` by the power residue symbol. -/
theorem powerResidueSymbol_frobenius {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal] (h𝔭 : (Ideal.absNorm 𝔭).Coprime n)
    (𝔓 : Ideal (𝓞 L)) [𝔓.IsPrime] [𝔓.LiesOver 𝔭] (σ : 𝓞 L ≃ₐ[𝓞 K] 𝓞 L)
    (hσ : IsArithFrobAt (𝓞 K) σ 𝔓) {α : 𝓞 K} (hα : α ∉ 𝔭) {β : 𝓞 L}
    (hβ : β ^ n = algebraMap (𝓞 K) (𝓞 L) α) :
    σ β = algebraMap (𝓞 K) (𝓞 L) (powerResidueSymbol n 𝔭 (Ideal.Quotient.mk 𝔭 α)) * β := by
  sorry

/-! ### Degree-`n` Hilbert symbols and the power reciprocity law

These three theorems need the degree-`n` norm-residue symbol `(a, b)_v = Art_v(a)(ⁿ√b) / ⁿ√b`
(`K2SymbolsBrauer:T.7`), the local Artin map with its Frobenius normalisation (Class Field Theory,
Layer 6) and global Artin reciprocity (Class Field Theory, Layer 11). None of these is in the pinned
libraries, and a local stand-in would restate class field theory, so they are not prototyped.
Intended forms, with `hilbertSymbolDeg n v a b` for that symbol at a place `v` of `K`:

* `CA.1/tame-hilbert-symbol-formula`: for a finite place `v` with `𝔭_v ∤ n`,
  `hilbertSymbolDeg n v a b = (((-1) ^ (v a * v b) * b ^ (v a) / a ^ (v b)) / 𝔭_v)_n`, the unit
  inside the symbol being read in the residue field through `powerResidueSymbol`.
* `CA.1/hilbert-product-formula-of-degree-n`: for `a b : Kˣ`, the symbol is `1` at all but finitely
  many places and `∏ᶠ v, hilbertSymbolDeg n v a b = 1`.
* `CA.1/power-reciprocity-law`: for nonzero `a b : 𝓞 K` with `(a)`, `(b)`, `(n)` pairwise coprime,
  `powerResidueSymbolIdeal n (span {b}) a * (powerResidueSymbolIdeal n (span {a}) b)⁻¹ =
    ∏ v ∣ n ∞, hilbertSymbolDeg n v a b`. -/

/-! ### Cubic reciprocity -/

/-- `CA.1/primary-eisenstein-integer`: `π ≡ 2 (mod 3)` in `𝓞 K` (meaningful for `K = ℚ(ζ₃)`). -/
def IsPrimaryEisenstein (π : 𝓞 K) : Prop :=
  Ideal.Quotient.mk (Ideal.span {(3 : 𝓞 K)}) π = 2

theorem isPrimaryEisenstein_add_mul_iff [IsCyclotomicExtension {3} ℚ K] {ζ : 𝓞 K}
    (hζ : IsPrimitiveRoot ζ 3) (a b : ℤ) :
    IsPrimaryEisenstein ((a : 𝓞 K) + (b : 𝓞 K) * ζ) ↔ a % 3 = 2 ∧ b % 3 = 0 := by
  sorry

theorem exists_unique_associated_isPrimaryEisenstein [IsCyclotomicExtension {3} ℚ K]
    {π : 𝓞 K} (hπ : Prime π) (h3 : Ideal.absNorm (Ideal.span {π}) ≠ 3) :
    ∃! π' : 𝓞 K, Associated π π' ∧ IsPrimaryEisenstein π' := by
  sorry

theorem IsPrimaryEisenstein.neg_mul {α β : 𝓞 K} (hα : IsPrimaryEisenstein α)
    (hβ : IsPrimaryEisenstein β) : IsPrimaryEisenstein (-(α * β)) := by
  sorry

theorem isPrimaryEisenstein_intCast_iff (a : ℤ) : IsPrimaryEisenstein (a : 𝓞 K) ↔ a % 3 = 2 := by
  sorry

/-- Unit test `isPrimaryEisenstein_test_two`: the rational prime `2` is primary. -/
example : IsPrimaryEisenstein (2 : 𝓞 K) := by
  sorry

/-- Unit test `isPrimaryEisenstein_test_norm_seven`: `-1 - 3ζ`, of norm `7`, is primary. -/
example [IsCyclotomicExtension {3} ℚ K] {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ 3) :
    IsPrimaryEisenstein (-1 - 3 * ζ) := by
  sorry

/-- Unit test `isPrimaryEisenstein_test_three_add_zeta`: `3 + ζ`, of norm `7`, is not primary. -/
example [IsCyclotomicExtension {3} ℚ K] {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ 3) :
    ¬ IsPrimaryEisenstein (3 + ζ) := by
  sorry

/-- Unit test `isPrimaryEisenstein_test_one_sub_zeta`: the prime `1 - ζ` above `3` is not
primary, which is why primes of norm `3` are excluded. -/
example [IsCyclotomicExtension {3} ℚ K] {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ 3) :
    ¬ IsPrimaryEisenstein (1 - ζ) := by
  sorry

/-- `CA.1/cubic-jacobi-sum-of-a-primary-prime`: `J(χ_π, χ_π) = π`. -/
theorem jacobiSum_powerResidueSymbol_three [IsCyclotomicExtension {3} ℚ K]
    [HasEnoughRootsOfUnity (𝓞 K) 3] {π : 𝓞 K} (hπ : Prime π) (hprim : IsPrimaryEisenstein π)
    {p : ℕ} (hp : p.Prime) (hp3 : p % 3 = 1) (hN : Ideal.absNorm (Ideal.span {π}) = p)
    [(Ideal.span {π}).IsMaximal] [Fintype (𝓞 K ⧸ Ideal.span {π})] :
    jacobiSum (powerResidueSymbol 3 (Ideal.span {π})) (powerResidueSymbol 3 (Ideal.span {π})) =
      π := by
  sorry

/-- `CA.1/cubic-gauss-sum-cube`: `g(χ_π) ^ 3 = p π` for any embedding into `ℂ` and any
primitive additive character. -/
theorem gaussSum_powerResidueSymbol_three_pow_three [IsCyclotomicExtension {3} ℚ K]
    [HasEnoughRootsOfUnity (𝓞 K) 3] {π : 𝓞 K} (hπ : Prime π) (hprim : IsPrimaryEisenstein π)
    {p : ℕ} (hp : p.Prime) (hp3 : p % 3 = 1) (hN : Ideal.absNorm (Ideal.span {π}) = p)
    [(Ideal.span {π}).IsMaximal] [Fintype (𝓞 K ⧸ Ideal.span {π})] (φ : 𝓞 K →+* ℂ)
    (ψ : AddChar (𝓞 K ⧸ Ideal.span {π}) ℂ) (hψ : ψ.IsPrimitive) :
    gaussSum ((powerResidueSymbol 3 (Ideal.span {π})).ringHomComp φ) ψ ^ 3 = p * φ π := by
  sorry

/-- `CA.1/cubic-reciprocity`: for primary primes of distinct norms different from `3`,
`(π₂ / π₁)_3 = (π₁ / π₂)_3`. -/
theorem cubic_reciprocity [IsCyclotomicExtension {3} ℚ K] [HasEnoughRootsOfUnity (𝓞 K) 3]
    {π₁ π₂ : 𝓞 K} (h₁ : Prime π₁) (h₂ : Prime π₂) (hp₁ : IsPrimaryEisenstein π₁)
    (hp₂ : IsPrimaryEisenstein π₂) (hN₁ : Ideal.absNorm (Ideal.span {π₁}) ≠ 3)
    (hN₂ : Ideal.absNorm (Ideal.span {π₂}) ≠ 3)
    (hN : Ideal.absNorm (Ideal.span {π₁}) ≠ Ideal.absNorm (Ideal.span {π₂})) :
    powerResidueSymbolIdeal 3 (Ideal.span {π₁}) π₂ =
      powerResidueSymbolIdeal 3 (Ideal.span {π₂}) π₁ := by
  sorry

/-- `CA.1/cubic-supplement-for-one-minus-zeta`: for a primary prime `π = a + b ζ` of norm
different from `3`, with `a = 3 m - 1`, `(1 - ζ / π)_3 = ζ ^ (2 m)`. -/
theorem cubic_supplement_one_sub_zeta [IsCyclotomicExtension {3} ℚ K]
    [HasEnoughRootsOfUnity (𝓞 K) 3] {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ 3) {a b m : ℤ}
    (hπ : Prime ((a : 𝓞 K) + (b : 𝓞 K) * ζ))
    (hprim : IsPrimaryEisenstein ((a : 𝓞 K) + (b : 𝓞 K) * ζ))
    (hN : Ideal.absNorm (Ideal.span {(a : 𝓞 K) + (b : 𝓞 K) * ζ}) ≠ 3) (hm : a = 3 * m - 1) :
    powerResidueSymbolIdeal 3 (Ideal.span {(a : 𝓞 K) + (b : 𝓞 K) * ζ}) (1 - ζ) =
      ζ ^ ((2 * m) % 3).toNat := by
  sorry

/-! ### Eisenstein reciprocity -/

/-- `CA.1/primary-element-of-a-cyclotomic-ring`: `α` is prime to `l` and congruent to a rational
integer modulo `(1 - ζ) ^ 2` (meaningful for `K = ℚ(ζ_l)`, `l` an odd prime). -/
def IsEisensteinPrimary (l : ℕ) (ζ : 𝓞 K) (α : 𝓞 K) : Prop :=
  IsCoprime α (l : 𝓞 K) ∧ ∃ c : ℤ, α - c ∈ Ideal.span {(1 - ζ) ^ 2}

theorem exists_unique_zeta_pow_mul_isEisensteinPrimary {l : ℕ} [Fact l.Prime] (hl : l ≠ 2)
    [IsCyclotomicExtension {l} ℚ K] {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ l) {α : 𝓞 K}
    (hα : IsCoprime α (l : 𝓞 K)) :
    ∃! c : ZMod l, IsEisensteinPrimary l ζ (ζ ^ c.val * α) := by
  sorry

theorem isEisensteinPrimary_intCast {l : ℕ} (ζ : 𝓞 K) {a : ℤ} (ha : IsCoprime (a : 𝓞 K) l) :
    IsEisensteinPrimary l ζ (a : 𝓞 K) := by
  sorry

theorem IsEisensteinPrimary.mul {l : ℕ} {ζ α β : 𝓞 K} (hα : IsEisensteinPrimary l ζ α)
    (hβ : IsEisensteinPrimary l ζ β) : IsEisensteinPrimary l ζ (α * β) := by
  sorry

/-- Unit test `isEisensteinPrimary_test_one`: `1` is primary. -/
example {l : ℕ} (ζ : 𝓞 K) : IsEisensteinPrimary l ζ 1 := by
  sorry

/-- Unit test `isEisensteinPrimary_test_two`: for an odd prime `l`, the rational integer `2` is
primary. -/
example {l : ℕ} [Fact l.Prime] (hl : l ≠ 2) [IsCyclotomicExtension {l} ℚ K] {ζ : 𝓞 K}
    (hζ : IsPrimitiveRoot ζ l) : IsEisensteinPrimary l ζ 2 := by
  sorry

/-- Unit test `isEisensteinPrimary_test_zeta`: `ζ` itself is not primary; the normalising power
of `ζ` is unique modulo `l`. -/
example {l : ℕ} [Fact l.Prime] (hl : l ≠ 2) [IsCyclotomicExtension {l} ℚ K] {ζ : 𝓞 K}
    (hζ : IsPrimitiveRoot ζ l) : ¬ IsEisensteinPrimary l ζ ζ := by
  sorry

/-- Unit test `isEisensteinPrimary_test_one_sub_zeta`: `1 - ζ` is not prime to `l`, hence not
primary. -/
example {l : ℕ} [Fact l.Prime] (hl : l ≠ 2) [IsCyclotomicExtension {l} ℚ K] {ζ : 𝓞 K}
    (hζ : IsPrimitiveRoot ζ l) : ¬ IsEisensteinPrimary l ζ (1 - ζ) := by
  sorry

/-- `CA.1/eisenstein-reciprocity`: for an odd prime `l`, a primary nonunit `α ∈ ℤ[ζ_l]` and a
rational integer `a ≠ ±1` prime to `l` and to `α`, `(α / a)_l = (a / α)_l`. -/
theorem eisenstein_reciprocity {l : ℕ} [Fact l.Prime] (hl : l ≠ 2)
    [IsCyclotomicExtension {l} ℚ K] [NeZero l] [HasEnoughRootsOfUnity (𝓞 K) l] {ζ : 𝓞 K}
    (hζ : IsPrimitiveRoot ζ l) {α : 𝓞 K} (hα : IsEisensteinPrimary l ζ α) (hαu : ¬ IsUnit α)
    {a : ℤ} (ha : a ≠ 1 ∧ a ≠ -1) (hal : IsCoprime a (l : ℤ)) (hcop : IsCoprime (a : 𝓞 K) α) :
    powerResidueSymbolIdeal l (Ideal.span {(a : 𝓞 K)}) α =
      powerResidueSymbolIdeal l (Ideal.span {α}) (a : 𝓞 K) := by
  sorry

end CA1

end TauCeti.ClassicalArithmetic


-- ===== CA.2 =====

/-
CA.2 Sequences and generating functions: the suggested-Lean section of
BP-ClassicalArithmeticCompletion (continuation). This file is not the roadmap and is not
exhaustive; the roadmap document is definitive, and these statements suggest Lean forms so that
contributors and reviewers converge on names and signatures. They claim no implementation.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti is not imported (it is not built
here); the one Tau Ceti declaration a test compares against, `TauCeti.companionFinTwo`, is written
out by its body in that test.
-/

noncomputable section

namespace TauCeti.ClassicalArithmetic

/-! ## CA.2 Sequences and generating functions -/

section CA2

open Polynomial Finset
open scoped Polynomial PowerSeries LaurentSeries

/-! ### Linearly generated sequences and their minimal polynomial (Shoup §18.1) -/

namespace Sequence

variable {F : Type*} [Field F] {V : Type*} [AddCommGroup V] [Module F V]

/-- Shoup's pairing `g ⋆ s = ∑ⱼ gⱼ • sⱼ` of a polynomial with a sequence. -/
def star (g : F[X]) (s : ℕ → V) : V := g.sum fun j a => a • s j

/-- `g` is a generating polynomial of `s`: `(X ^ i * g) ⋆ s = 0` for every `i` (Shoup (18.1)). -/
def IsGeneratingPoly (s : ℕ → V) (g : F[X]) : Prop := ∀ i : ℕ, star (X ^ i * g) s = 0

variable (F) in
/-- `s` satisfies a linear recurrence with constant coefficients in `F` (Shoup §18.1). The
length `k` may be `0`, in which case `s = 0`. -/
def IsLinearlyGenerated (s : ℕ → V) : Prop :=
  ∃ (k : ℕ) (c : Fin k → F), ∀ i : ℕ, s (k + i) = ∑ j : Fin k, c j • s (j + i)

variable (F) in
/-- The ideal of generating polynomials of `s` (Shoup Theorem 18.1). -/
def generatingIdeal (s : ℕ → V) : Ideal F[X] := by sorry

variable (F) in
/-- The minimal polynomial of `s`: the monic generator of `generatingIdeal F s`, and `0` when
`s` is not linearly generated. -/
def minPoly (s : ℕ → V) : F[X] := by sorry

theorem star_add (g h : F[X]) (s : ℕ → V) : star (g + h) s = star g s + star h s := by sorry

theorem mem_generatingIdeal (s : ℕ → V) (g : F[X]) :
    g ∈ generatingIdeal F s ↔ IsGeneratingPoly s g := by sorry

theorem minPoly_dvd (s : ℕ → V) (g : F[X]) : IsGeneratingPoly s g ↔ minPoly F s ∣ g := by sorry

theorem minPoly_monic (s : ℕ → V) (h : IsLinearlyGenerated F s) : (minPoly F s).Monic := by sorry

theorem isLinearlyGenerated_iff (s : ℕ → V) : IsLinearlyGenerated F s ↔ minPoly F s ≠ 0 := by
  sorry

theorem minPoly_of_powers {A : Type*} [Ring A] [Algebra F A] (α : A) :
    minPoly F (fun i => α ^ i) = minpoly F α := by sorry

theorem isSolution_iff_charPoly_mem (E : LinearRecurrence F) (u : ℕ → F) :
    E.IsSolution u ↔ E.charPoly ∈ generatingIdeal F u := by sorry

/-- Unit test `Sequence.minPoly_zero`: the zero sequence has minimal polynomial `1`. -/
example : minPoly F (0 : ℕ → V) = 1 := by sorry

/-- Unit test `Sequence.isGeneratingPoly_one_iff`: `1` is a generating polynomial only of the
zero sequence (Shoup Exercise 18.1). -/
example (s : ℕ → V) : IsGeneratingPoly s (1 : F[X]) ↔ s = 0 := by sorry

/-- Unit test `Sequence.minPoly_fib`: the Fibonacci sequence has minimal polynomial
`X ^ 2 - X - 1`. -/
example : minPoly ℚ (fun n => (Nat.fib n : ℚ)) = X ^ 2 - X - 1 := by sorry

/-- Unit test `Sequence.minPoly_geom`: a geometric sequence has minimal polynomial `X - a`,
agreeing with `minpoly F a`. -/
example (a : F) : minPoly F (fun n => a ^ n) = X - C a := by sorry

/-- Unit test `Sequence.not_isLinearlyGenerated_two_pow_sq`: `n ↦ 2 ^ (n ^ 2)` grows too fast to
satisfy a linear recurrence over `ℚ`. -/
example : ¬ IsLinearlyGenerated ℚ (fun n => (2 : ℚ) ^ (n ^ 2)) := by sorry

end Sequence

/-! ### Rational power series (Stanley §4.1) -/

namespace PowerSeries

variable {K : Type*} [Field K]

/-- A formal power series is rational when `f * Q = P` for polynomials `P`, `Q` with
`Q(0) ≠ 0`. -/
def IsRational (f : K⟦X⟧) : Prop :=
  ∃ P Q : K[X], Q.coeff 0 ≠ 0 ∧ f * (Q : K⟦X⟧) = (P : K⟦X⟧)

theorem IsRational.polynomial (p : K[X]) : IsRational (p : K⟦X⟧) := by sorry

theorem IsRational.inv {f : K⟦X⟧} (hf : IsRational f) : IsRational f⁻¹ := by sorry

/-- The rational power series form a subring of `K⟦X⟧`. -/
def IsRational.subring (K : Type*) [Field K] : Subring K⟦X⟧ := by sorry

theorem isRational_iff_mem_range (f : K⟦X⟧) :
    IsRational f ↔ ∃ r : RatFunc K,
      (HahnSeries.ofPowerSeries ℤ K f : LaurentSeries K) = (r : LaurentSeries K) := by sorry

theorem isRational_mk_iff (a : ℕ → K) :
    IsRational (_root_.PowerSeries.mk a) ↔ Sequence.IsLinearlyGenerated K a := by sorry

/-- Unit test `PowerSeries.isRational_mk_one`: the geometric series `∑ Xⁿ` is rational,
`(1 - X) * ∑ Xⁿ = 1`. -/
example : IsRational (_root_.PowerSeries.mk fun _ => (1 : K)) := by sorry

/-- Unit test `PowerSeries.mk_fib_mul`: the Fibonacci series times `1 - X - X ^ 2` is `X`. -/
example : _root_.PowerSeries.mk (fun n => (Nat.fib n : ℚ)) * (1 - _root_.PowerSeries.X -
    _root_.PowerSeries.X ^ 2) = _root_.PowerSeries.X := by sorry

/-- Unit test `PowerSeries.not_isRational_exp`: the exponential series is not rational. -/
example : ¬ IsRational (_root_.PowerSeries.exp ℚ) := by sorry

end PowerSeries

/-! ### The recurrence of a monic polynomial -/

namespace LinearRecurrence

variable {R : Type*} [CommRing R]

/-- The recurrence whose characteristic polynomial is the monic polynomial `p`:
order `p.natDegree` and coefficients `-p.coeff i`. -/
def ofMonic (p : R[X]) : _root_.LinearRecurrence R := ⟨p.natDegree, fun i => -p.coeff i⟩

@[simp] theorem order_ofMonic (p : R[X]) : (ofMonic p).order = p.natDegree := rfl

theorem charPoly_ofMonic {p : R[X]} (hp : p.Monic) : (ofMonic p).charPoly = p := by sorry

theorem ofMonic_charPoly [Nontrivial R] (E : _root_.LinearRecurrence R) :
    ofMonic E.charPoly = E := by sorry

theorem isSolution_ofMonic_iff {K : Type*} [Field K] {p : K[X]} (hp : p.Monic) (u : ℕ → K) :
    (ofMonic p).IsSolution u ↔ Sequence.IsGeneratingPoly u p := by sorry

/-- Unit test `LinearRecurrence.isSolution_ofMonic_fib`: Fibonacci solves the recurrence of
`X ^ 2 - X - 1`. -/
example : (ofMonic (X ^ 2 - X - 1 : ℚ[X])).IsSolution (fun n => (Nat.fib n : ℚ)) := by sorry

/-- Unit test `LinearRecurrence.isSolution_ofMonic_one`: the order-zero recurrence of `1` has
only the zero solution. -/
example [Nontrivial R] (u : ℕ → R) : (ofMonic (1 : R[X])).IsSolution u ↔ u = 0 := by sorry

/-- Unit test `LinearRecurrence.isSolution_ofMonic_X`: the recurrence of `X` (zero constant term)
says exactly that the sequence vanishes from index `1` on. -/
example [Nontrivial R] (u : ℕ → R) :
    (ofMonic (X : R[X])).IsSolution u ↔ ∀ n, u (n + 1) = 0 := by sorry

/-! ### Exponential-polynomial solutions and the closed form (Evertse Theorem 8.17) -/

/-- `n ↦ n ^ j * θ ^ n` solves `E` once `(X - θ) ^ (j + 1)` divides the characteristic
polynomial. -/
theorem isSolution_pow_mul_geom {K : Type*} [Field K] [CharZero K]
    (E : _root_.LinearRecurrence K) (θ : K) (j : ℕ) (h : (X - C θ) ^ (j + 1) ∣ E.charPoly) :
    E.IsSolution (fun n => (n : K) ^ j * θ ^ n) := by sorry

end LinearRecurrence

/-- Exponential polynomials in distinct nonzero bases are linearly independent: if
`∑_{θ ∈ S} g_θ(n) θⁿ = 0` for every `n`, every `g_θ` is zero. -/
theorem exponentialPolynomial_eq_zero {K : Type*} [Field K] [CharZero K] (S : Finset K)
    (hS : ∀ θ ∈ S, θ ≠ 0) (g : K → K[X])
    (h : ∀ n : ℕ, ∑ θ ∈ S, (g θ).eval (n : K) * θ ^ n = 0) : ∀ θ ∈ S, g θ = 0 := by sorry

namespace LinearRecurrence

/-- **Evertse, Theorem 8.17.** A solution of a complex linear recurrence whose characteristic
polynomial has nonzero constant term is `u h = ∑ g_θ(h) θ ^ h` over the distinct roots `θ`, with
`deg g_θ < mult θ`, and the `g_θ` are unique. -/
theorem existsUnique_closedForm (E : _root_.LinearRecurrence ℂ) (h0 : E.charPoly.coeff 0 ≠ 0)
    (u : ℕ → ℂ) (hu : E.IsSolution u) :
    ∃! g : ℂ → ℂ[X], (∀ θ, (g θ).degree < (E.charPoly.rootMultiplicity θ : WithBot ℕ)) ∧
      ∀ h : ℕ, u h = ∑ θ ∈ E.charPoly.roots.toFinset, (g θ).eval (h : ℂ) * θ ^ h := by sorry

/-- The converse of Evertse's Theorem 8.17: an exponential polynomial solves the recurrence of
`∏_{θ ∈ S} (X - θ) ^ e_θ` as soon as `deg g_θ < e_θ`. -/
theorem isSolution_closedForm (S : Finset ℂ) (e : ℂ → ℕ) (g : ℂ → ℂ[X])
    (hg : ∀ θ ∈ S, (g θ).degree < (e θ : WithBot ℕ)) :
    (ofMonic (∏ θ ∈ S, (X - C θ) ^ e θ)).IsSolution
      (fun h => ∑ θ ∈ S, (g θ).eval (h : ℂ) * θ ^ h) := by sorry

end LinearRecurrence

/-- **Stanley, Theorem 4.1.1.** For `Q = 1 + α₁x + ⋯ + α_d x^d` with `α_d ≠ 0`, the generating
function of `f` is `P / Q` with `deg P < d`, iff `f` satisfies the recurrence of `Q`, iff `f` is
an exponential polynomial in the reciprocal roots of `Q` with `deg P_γ < mult`. -/
theorem generatingFunction_tfae (Q : ℂ[X]) (hQ0 : Q.coeff 0 = 1) (hQd : 1 ≤ Q.natDegree)
    (f : ℕ → ℂ) :
    List.TFAE
      [∃ P : ℂ[X], P.degree < (Q.natDegree : WithBot ℕ) ∧
          _root_.PowerSeries.mk (fun n => f n) * (Q : ℂ⟦X⟧) = (P : ℂ⟦X⟧),
        ∀ n : ℕ, ∑ i ∈ range (Q.natDegree + 1), Q.coeff i * f (n + Q.natDegree - i) = 0,
        ∃ P : ℂ → ℂ[X], (∀ γ, (P γ).degree < (Q.rootMultiplicity γ⁻¹ : WithBot ℕ)) ∧
          ∀ n : ℕ, f n = ∑ γ ∈ Q.roots.toFinset.image (·⁻¹), (P γ).eval (n : ℂ) * γ ^ n] := by
  sorry

/-! ### Companion matrices -/

namespace Polynomial

variable {R : Type*} [CommRing R]

/-- The companion matrix of `p`: ones on the subdiagonal and `-p.coeff i` in the last column,
the matrix of multiplication by `X` on `R[X] ⧸ (p)` in the basis `1, X, …, X ^ (d - 1)`. -/
def companion (p : R[X]) : Matrix (Fin p.natDegree) (Fin p.natDegree) R :=
  Matrix.of fun i j =>
    if (i : ℕ) = j + 1 then 1 else if (j : ℕ) + 1 = p.natDegree then -p.coeff i else 0

@[simp] theorem companion_apply (p : R[X]) (i j : Fin p.natDegree) :
    companion p i j =
      if (i : ℕ) = j + 1 then 1 else if (j : ℕ) + 1 = p.natDegree then -p.coeff i else 0 := rfl

theorem leftMulMatrix_root_eq_companion {p : R[X]} (hp : p.Monic) :
    Algebra.leftMulMatrix (AdjoinRoot.powerBasis' hp).basis (AdjoinRoot.root p) =
      companion p := by sorry

theorem toLin'_companion_transpose (p : R[X]) :
    Matrix.toLin' (companion p).transpose = (LinearRecurrence.ofMonic p).tupleSucc := by sorry

theorem det_companion {p : R[X]} (hp : p.Monic) :
    (companion p).det = (-1) ^ p.natDegree * p.coeff 0 := by sorry

theorem minpoly_companion {K : Type*} [Field K] {p : K[X]} (hp : p.Monic) :
    minpoly K (companion p) = p := by sorry

theorem hasEigenvalue_companion_iff {K : Type*} [Field K] {p : K[X]} (hp : p.Monic) (q : K) :
    Module.End.HasEigenvalue (Matrix.toLin' (companion p)) q ↔ p.IsRoot q := by sorry

/-- Unit test `Polynomial.companion_fib`: the companion matrix of `X ^ 2 - X - 1`. -/
example (h : (X ^ 2 - X - 1 : ℤ[X]).natDegree = 2) :
    (companion (X ^ 2 - X - 1 : ℤ[X])).reindex (finCongr h) (finCongr h) = !![0, 1; 1, 1] := by
  sorry

/-- Unit test `Polynomial.companion_quadratic`: for `X ^ 2 - t X + d` the companion matrix is
`!![0, -d; 1, t]`, the body of Tau Ceti's `TauCeti.companionFinTwo t d`
(`TauCeti.companionFinTwo_def`; Tau Ceti is not built here, so the body is written out). -/
example (t d : R) (h : (X ^ 2 - C t * X + C d : R[X]).natDegree = 2) :
    (companion (X ^ 2 - C t * X + C d)).reindex (finCongr h) (finCongr h) = !![0, -d; 1, t] := by
  sorry

/-- Unit test `Polynomial.charpoly_companion_one`: the companion matrix of `1` is the empty
matrix, with characteristic polynomial `1`. -/
example [Nontrivial R] : (companion (1 : R[X])).charpoly = 1 := by sorry

/-- Unit test `Polynomial.companion_ne_transpose`: the orientation is pinned; for `X ^ 2 + 1` the
companion matrix is not its own transpose. -/
example : companion (X ^ 2 + 1 : ℤ[X]) ≠ (companion (X ^ 2 + 1 : ℤ[X])).transpose := by sorry

/-- **The characteristic polynomial of the companion matrix** of a monic `p` is `p`, over any
commutative ring. -/
theorem charpoly_companion {p : R[X]} (hp : p.Monic) : (companion p).charpoly = p := by sorry

/-- Roots in `R` are exactly the eigenvalues in `R` of the transposed companion matrix, with
eigenvector `(1, q, …, q ^ (d - 1))`; no extension of scalars. -/
theorem isRoot_iff_companion_transpose_mulVec {p : R[X]} (hp : p.Monic)
    (hd : 0 < p.natDegree) (q : R) :
    p.IsRoot q ↔ (companion p).transpose.mulVec (fun i => q ^ (i : ℕ)) =
      q • (fun i : Fin p.natDegree => q ^ (i : ℕ)) := by sorry

end Polynomial

namespace LinearRecurrence

variable {R : Type*} [CommRing R]

/-- The state-vector form of a recurrence: `u` solves the recurrence of `p` iff every state
vector `(u n, …, u (n + d - 1))` is the `n`-th power of the transposed companion matrix applied
to the initial state. -/
theorem isSolution_iff_state_eq_pow_mulVec {p : R[X]} (hp : 0 < p.natDegree) (u : ℕ → R) :
    (ofMonic p).IsSolution u ↔
      ∀ n : ℕ, (fun i : Fin p.natDegree => u (n + i)) =
        ((Polynomial.companion p).transpose ^ n).mulVec (fun i => u i) := by sorry

end LinearRecurrence

/-! ### Lucas sequences (Carmichael 1913; Bala 2014) -/

section Lucas

variable {R : Type*} [CommRing R]

/-- The Lucas sequence of the first kind: `U₀ = 0`, `U₁ = 1`, `U_{n+2} = P U_{n+1} - Q U_n`. -/
def lucasU (P Q : R) : ℕ → R
  | 0 => 0
  | 1 => 1
  | n + 2 => P * lucasU P Q (n + 1) - Q * lucasU P Q n

/-- The Lucas sequence of the second kind: `V₀ = 2`, `V₁ = P`, `V_{n+2} = P V_{n+1} - Q V_n`. -/
def lucasV (P Q : R) : ℕ → R
  | 0 => 2
  | 1 => P
  | n + 2 => P * lucasV P Q (n + 1) - Q * lucasV P Q n

@[simp] theorem lucasU_zero (P Q : R) : lucasU P Q 0 = 0 := rfl
@[simp] theorem lucasU_one (P Q : R) : lucasU P Q 1 = 1 := rfl
theorem lucasU_add_two (P Q : R) (n : ℕ) :
    lucasU P Q (n + 2) = P * lucasU P Q (n + 1) - Q * lucasU P Q n := rfl

theorem isSolution_lucasU (P Q : R) :
    (⟨2, ![-Q, P]⟩ : LinearRecurrence R).IsSolution (lucasU P Q) := by sorry

theorem lucasU_mul_sub {α β P Q : R} (hP : α + β = P) (hQ : α * β = Q) (n : ℕ) :
    (α - β) * lucasU P Q n = α ^ n - β ^ n := by sorry

theorem map_lucasU {S : Type*} [CommRing S] (f : R →+* S) (P Q : R) (n : ℕ) :
    f (lucasU P Q n) = lucasU (f P) (f Q) n := by sorry

theorem lucasU_succ_eq_eval_dickson (P Q : R) (n : ℕ) :
    lucasU P Q (n + 1) = (dickson 2 Q n).eval P := by sorry

theorem lucasU_two_mul (P Q : R) (n : ℕ) : lucasU P Q (2 * n) = lucasU P Q n * lucasV P Q n := by
  sorry

theorem lucasU_one_neg_one (n : ℕ) : lucasU (1 : ℤ) (-1) n = Nat.fib n := by sorry

/-- Unit test `lucasU_three_two`: `U_n(3, 2) = 2 ^ n - 1`, the Mersenne numbers. -/
example (n : ℕ) : lucasU (3 : ℤ) 2 n = 2 ^ n - 1 := by sorry

/-- Unit test `lucasU_two_one`: for the repeated root `α = β = 1`, `U_n(2, 1) = n`. -/
example (n : ℕ) : lucasU (2 : ℤ) 1 n = n := by sorry

/-- Unit test `lucasU_fib`: `U_n(1, -1)` is Mathlib's `Nat.fib n`. -/
example (n : ℕ) : lucasU (1 : ℤ) (-1) n = Nat.fib n := by sorry

/-- Unit test `lucasU_zero_one_two`: with `P = 0`, `Q = 1` the even terms vanish, so
`U_2(0, 1) = 0` while `U_3(0, 1) = -1`. -/
example : lucasU (0 : ℤ) 1 2 = 0 ∧ lucasU (0 : ℤ) 1 3 = -1 := by sorry

@[simp] theorem lucasV_zero (P Q : R) : lucasV P Q 0 = 2 := rfl
@[simp] theorem lucasV_one (P Q : R) : lucasV P Q 1 = P := rfl
theorem lucasV_add_two (P Q : R) (n : ℕ) :
    lucasV P Q (n + 2) = P * lucasV P Q (n + 1) - Q * lucasV P Q n := rfl

theorem lucasV_eq_add_pow {α β P Q : R} (hP : α + β = P) (hQ : α * β = Q) (n : ℕ) :
    lucasV P Q n = α ^ n + β ^ n := by sorry

theorem lucasV_eq_eval_dickson (P Q : R) (n : ℕ) : lucasV P Q n = (dickson 1 Q n).eval P := by
  sorry

theorem lucasV_sq_sub (P Q : R) (n : ℕ) :
    lucasV P Q n ^ 2 - (P ^ 2 - 4 * Q) * lucasU P Q n ^ 2 = 4 * Q ^ n := by sorry

theorem map_lucasV {S : Type*} [CommRing S] (f : R →+* S) (P Q : R) (n : ℕ) :
    f (lucasV P Q n) = lucasV (f P) (f Q) n := by sorry

/-- Unit test `lucasV_three_two`: `V_n(3, 2) = 2 ^ n + 1`. -/
example (n : ℕ) : lucasV (3 : ℤ) 2 n = 2 ^ n + 1 := by sorry

/-- Unit test `lucasV_two_one`: for the repeated root, `V_n(2, 1) = 2`. -/
example (n : ℕ) : lucasV (2 : ℤ) 1 n = 2 := by sorry

/-- Unit test `lucasV_lucas_numbers`: `V_n(1, -1)` are the Lucas numbers `2, 1, 3, 4, 7, 11`. -/
example : (List.range 6).map (lucasV (1 : ℤ) (-1)) = [2, 1, 3, 4, 7, 11] := by sorry

/-- Unit test `lucasV_dickson`: `V_n(P, Q)` is the Dickson polynomial of the first kind
`D_n(x, Q)` at `x = P`. -/
example (P Q : ℤ) (n : ℕ) : lucasV P Q n = (dickson 1 Q n).eval P := by sorry

/-- Unit test `lucasV_lucasLehmer`: `V_{2^i}(4, 1)` is Mathlib's Lucas–Lehmer sequence. -/
example (i : ℕ) : lucasV (4 : ℤ) 1 (2 ^ i) = LucasLehmer.s i := by sorry

/-- The addition formula `U_{m+n+1} = U_{m+1} U_{n+1} - Q U_m U_n`. -/
theorem lucasU_add_add_one (P Q : R) (m n : ℕ) :
    lucasU P Q (m + n + 1) = lucasU P Q (m + 1) * lucasU P Q (n + 1) -
      Q * lucasU P Q m * lucasU P Q n := by sorry

/-- `U_{mn}(P, Q) = U_m(P, Q) · U_n(V_m(P, Q), Q^m)`; in particular `U_m ∣ U_{mn}`. -/
theorem lucasU_mul (P Q : R) (m n : ℕ) :
    lucasU P Q (m * n) = lucasU P Q m * lucasU (lucasV P Q m) (Q ^ m) n := by sorry

/-- For coprime `P`, `Q`: `U_{n+1}` is coprime to `Q` and to `U_n`. -/
theorem isCoprime_lucasU {P Q : ℤ} (h : IsCoprime P Q) (n : ℕ) :
    IsCoprime (lucasU P Q (n + 1)) Q ∧ IsCoprime (lucasU P Q (n + 1)) (lucasU P Q n) := by sorry

/-- **Strong divisibility of Lucas sequences.** For coprime integers `P`, `Q`,
`gcd(U_m, U_n) = |U_{gcd(m, n)}|`. -/
theorem gcd_lucasU {P Q : ℤ} (h : IsCoprime P Q) (m n : ℕ) :
    Int.gcd (lucasU P Q m) (lucasU P Q n) = (lucasU P Q (Nat.gcd m n)).natAbs := by sorry

end Lucas

/-! ### Euler zigzag numbers (Stanley §1.6.1) -/

/-- The Euler zigzag numbers `1, 1, 1, 2, 5, 16, 61, 272, …` (OEIS A000111), by Stanley's
recursion `E_{n+1} = ∑_{j odd} C(n, j) E_j E_{n-j}` for `n ≥ 1`. -/
def zigzag : ℕ → ℕ
  | 0 => 1
  | 1 => 1
  | n + 2 => ∑ j : Fin (n + 2),
      if Odd (j : ℕ) then (n + 1).choose j * zigzag j * zigzag (n + 1 - j) else 0
decreasing_by all_goals (have := j.isLt; omega)

theorem two_mul_zigzag_succ {n : ℕ} (hn : 1 ≤ n) :
    2 * zigzag (n + 1) = ∑ k ∈ range (n + 1), n.choose k * zigzag k * zigzag (n - k) := by sorry

/-- The exponential generating series `∑ E_n Xⁿ / n!` over a `ℚ`-algebra. -/
def zigzagPowerSeries (A : Type*) [CommRing A] [Algebra ℚ A] : A⟦X⟧ :=
  PowerSeries.mk fun n => algebraMap ℚ A (zigzag n / n.factorial)

/-- The classical (signed) Euler numbers of DLMF §24.2(ii): `sech t = ∑ E_n tⁿ / n!`. -/
def eulerNumber (n : ℕ) : ℤ := if Even n then (-1) ^ (n / 2) * zigzag n else 0

theorem zigzag_odd_eq_bernoulli (n : ℕ) :
    (zigzag (2 * n + 1) : ℚ) = (-1) ^ n * 2 ^ (2 * n + 2) * (2 ^ (2 * n + 2) - 1) *
      bernoulli (2 * n + 2) / (2 * n + 2) := by sorry

/-- Unit test `zigzag_values`: the first eight zigzag numbers. -/
example : (List.range 8).map zigzag = [1, 1, 1, 2, 5, 16, 61, 272] := by sorry

/-- Unit test `zigzag_three_bernoulli`: the tangent number `E_3 = 2` against Mathlib's
`bernoulli 4 = -1/30`. -/
example : (zigzag 3 : ℚ) = -(2 ^ 4 * (2 ^ 4 - 1) * bernoulli 4 / 4) := by sorry

/-- Unit test `eulerNumber_two`: the signed Euler number `E_2 = -1` (DLMF), while the zigzag
number is `1`; the two conventions differ in sign. -/
example : eulerNumber 2 = -1 ∧ zigzag 2 = 1 := by sorry

/-- **André's theorem.** The zigzag number `E_n` counts the alternating permutations
`w(1) > w(2) < w(3) > ⋯` of `n` letters. -/
theorem card_alternating_perm (n : ℕ) :
    Nat.card {w : Equiv.Perm (Fin n) //
      ∀ (i : ℕ) (h : i + 1 < n), (w ⟨i + 1, h⟩ < w ⟨i, by omega⟩ ↔ Even i)} = zigzag n := by
  sorry

/-- **Stanley, Proposition 1.6.1 (formal).** `(∑ E_n Xⁿ / n!) · cos X = 1 + sin X`: the series is
`sec X + tan X`. -/
theorem zigzagPowerSeries_mul_cos (A : Type*) [CommRing A] [Algebra ℚ A] :
    zigzagPowerSeries A * PowerSeries.cos A = 1 + PowerSeries.sin A := by sorry

/-! ### Formal identities and their analytic specialisations -/

/-- The Taylor series at `0` of a complex function, `∑ f⁽ⁿ⁾(0) Xⁿ / n!`. -/
def taylorPowerSeries (f : ℂ → ℂ) : ℂ⟦X⟧ :=
  PowerSeries.mk fun n => iteratedDeriv n f 0 / n.factorial

theorem coeff_taylorPowerSeries (f : ℂ → ℂ) (n : ℕ) :
    PowerSeries.coeff n (taylorPowerSeries f) = iteratedDeriv n f 0 / n.factorial := by sorry

theorem taylorPowerSeries_add {f g : ℂ → ℂ} (hf : AnalyticAt ℂ f 0) (hg : AnalyticAt ℂ g 0) :
    taylorPowerSeries (f + g) = taylorPowerSeries f + taylorPowerSeries g := by sorry

theorem taylorPowerSeries_mul {f g : ℂ → ℂ} (hf : AnalyticAt ℂ f 0) (hg : AnalyticAt ℂ g 0) :
    taylorPowerSeries (f * g) = taylorPowerSeries f * taylorPowerSeries g := by sorry

theorem taylorPowerSeries_const (c : ℂ) :
    taylorPowerSeries (fun _ => c) = PowerSeries.C c := by sorry

theorem taylorPowerSeries_id : taylorPowerSeries id = PowerSeries.X := by sorry

theorem taylorPowerSeries_exp : taylorPowerSeries Complex.exp = PowerSeries.exp ℂ := by sorry

theorem taylorPowerSeries_sin : taylorPowerSeries Complex.sin = PowerSeries.sin ℂ := by sorry

theorem taylorPowerSeries_cos : taylorPowerSeries Complex.cos = PowerSeries.cos ℂ := by sorry

theorem eventuallyEq_zero_of_taylorPowerSeries_eq_zero {f : ℂ → ℂ} (hf : AnalyticAt ℂ f 0)
    (h : taylorPowerSeries f = 0) : f =ᶠ[nhds 0] 0 := by sorry

theorem hasSum_taylorPowerSeries {f : ℂ → ℂ} {r : ℝ}
    (hf : DifferentiableOn ℂ f (Metric.ball 0 r)) {z : ℂ} (hz : z ∈ Metric.ball (0 : ℂ) r) :
    HasSum (fun n => PowerSeries.coeff n (taylorPowerSeries f) * z ^ n) (f z) := by sorry

/-- Unit test `taylorPowerSeries_geometric`: the Taylor series of `z ↦ 1 / (1 - z)` is
`∑ Xⁿ`. -/
example : taylorPowerSeries (fun z => 1 / (1 - z)) = PowerSeries.mk fun _ => 1 := by sorry

/-- Unit test `taylorPowerSeries_one`: the constant function `1` has Taylor series `1`. -/
example : taylorPowerSeries (fun _ => 1) = 1 := by sorry

/-- Unit test `taylorPowerSeries_sq`: the Taylor series of `z ↦ z ^ 2` is `X ^ 2`, not `2 X ^ 2`:
the coefficients are divided by `n!`. -/
example : taylorPowerSeries (fun z => z ^ 2) = PowerSeries.X ^ 2 := by sorry

/-- **Formal identities specialise on a disc.** If `F · T(g) = T(h)` in `ℂ⟦X⟧`, where `g`, `h`
are holomorphic on the disc `|z| < r` and `g` has no zero there, then `∑ Fₙ zⁿ = h(z) / g(z)`
for `|z| < r`. -/
theorem hasSum_of_mul_taylorPowerSeries_eq {r : ℝ} {g h : ℂ → ℂ}
    (hg : DifferentiableOn ℂ g (Metric.ball 0 r)) (hh : DifferentiableOn ℂ h (Metric.ball 0 r))
    (hg0 : ∀ z ∈ Metric.ball (0 : ℂ) r, g z ≠ 0) (F : ℂ⟦X⟧)
    (hF : F * taylorPowerSeries g = taylorPowerSeries h) {z : ℂ}
    (hz : z ∈ Metric.ball (0 : ℂ) r) :
    HasSum (fun n => PowerSeries.coeff n F * z ^ n) (h z / g z) := by sorry

/-- **The Bernoulli generating function on its disc of convergence.** For `|z| < 2π`,
`∑ B_n zⁿ / n! = z / (e^z - 1)` (and `1` at `z = 0`), with Mathlib's `bernoulli` (`B₁ = -1/2`). -/
theorem hasSum_bernoulli_mul_pow {z : ℂ} (hz : ‖z‖ < 2 * Real.pi) :
    HasSum (fun n => (bernoulli n : ℂ) * z ^ n / n.factorial)
      (if z = 0 then 1 else z / (Complex.exp z - 1)) := by sorry

/-- **`sec z + tan z` on its disc of convergence.** For `|z| < π / 2`,
`∑ E_n zⁿ / n! = 1 / cos z + tan z`. -/
theorem hasSum_zigzag_mul_pow {z : ℂ} (hz : ‖z‖ < Real.pi / 2) :
    HasSum (fun n => (zigzag n : ℂ) * z ^ n / n.factorial)
      (1 / Complex.cos z + Complex.tan z) := by sorry

/-! ### Radix expansions -/

namespace PadicInt

variable {p : ℕ} [Fact p.Prime]

/-- The `p`-adic digit expansion `x = ∑ dᵢ pⁱ`, `0 ≤ dᵢ < p`, as an equivalence. -/
def digitsEquiv : ℤ_[p] ≃ (ℕ → Fin p) := by sorry

theorem hasSum_digitsEquiv (x : ℤ_[p]) :
    HasSum (fun i => ((digitsEquiv x i : ℕ) : ℤ_[p]) * (p : ℤ_[p]) ^ i) x := by sorry

theorem sum_digitsEquiv_eq_appr (x : ℤ_[p]) (n : ℕ) :
    ∑ i ∈ range n, (digitsEquiv x i : ℕ) * p ^ i = x.appr n := by sorry

theorem digitsEquiv_apply (x : ℤ_[p]) (i : ℕ) :
    (digitsEquiv x i : ℕ) = (PadicInt.toZModPow (i + 1) x).val / p ^ i := by sorry

theorem digitsEquiv_symm_apply (d : ℕ → Fin p) :
    HasSum (fun i => ((d i : ℕ) : ℤ_[p]) * (p : ℤ_[p]) ^ i) (digitsEquiv.symm d) := by sorry

theorem continuous_digitsEquiv :
    Continuous (digitsEquiv (p := p)) ∧ Continuous (digitsEquiv (p := p)).symm := by sorry

/-- Unit test `PadicInt.digitsEquiv_neg_one`: every digit of `-1` is `p - 1`. -/
example (i : ℕ) : (digitsEquiv (-1 : ℤ_[p]) i : ℕ) = p - 1 := by sorry

/-- Unit test `PadicInt.digitsEquiv_natCast`: the digits of a natural number are its base-`p`
digits (Mathlib's `Nat.digits`), padded with zeros. -/
example (n i : ℕ) : (digitsEquiv (n : ℤ_[p]) i : ℕ) = (Nat.digits p n).getD i 0 := by sorry

/-- Unit test `PadicInt.digitsEquiv_zero`: all digits of `0` vanish. -/
example (i : ℕ) : (digitsEquiv (0 : ℤ_[p]) i : ℕ) = 0 := by sorry

/-- Unit test `PadicInt.digitsEquiv_not_additive`: digits do not add (carries): in `ℤ_[2]` the
digit of `1 + 1` at position `1` is `1`, while each summand has digit `0` there. -/
example : (digitsEquiv (1 + 1 : ℤ_[2]) 1 : ℕ) = 1 ∧ (digitsEquiv (1 : ℤ_[2]) 1 : ℕ) = 0 := by
  sorry

end PadicInt

namespace Real

/-- The canonical expansion is recovered from any base-`b` expansion that does not end in the
digit `b - 1`. -/
theorem digits_ofDigits {b : ℕ} [NeZero b] (hb : 2 ≤ b) (d : ℕ → Fin b)
    (hd : ∀ N, ∃ i ≥ N, (d i : ℕ) ≠ b - 1) : _root_.Real.digits (_root_.Real.ofDigits d) b = d := by
  sorry

/-- **Uniqueness of base-`b` expansions.** Two digit sequences have the same value iff they are
equal or they agree up to a position `n`, where one has digit one larger, followed by all `0`s
in it and all `(b - 1)`s in the other. -/
theorem ofDigits_eq_ofDigits_iff {b : ℕ} (hb : 2 ≤ b) (d e : ℕ → Fin b) :
    _root_.Real.ofDigits d = _root_.Real.ofDigits e ↔ d = e ∨
      ∃ (x y : ℕ → Fin b) (n : ℕ), ((x = d ∧ y = e) ∨ (x = e ∧ y = d)) ∧
        (∀ i < n, x i = y i) ∧ (x n : ℕ) = y n + 1 ∧
        ∀ i > n, (x i : ℕ) = 0 ∧ (y i : ℕ) = b - 1 := by sorry

end Real

/-! ### Automatic sequences -/

/-- A deterministic finite automaton with output (Bridy §2.1): a transition function, an initial
state and an output function. Finiteness of the states is imposed where it is used. -/
structure DFAO (α : Type*) (σ : Type*) (Δ : Type*) where
  /-- The transition function. -/
  step : σ → α → σ
  /-- The initial state. -/
  start : σ
  /-- The output function. -/
  output : σ → Δ

namespace DFAO

variable {α σ Δ : Type*} (M : DFAO α σ Δ)

/-- Run the automaton from `s` on a word, reading it from the head of the list. -/
def evalFrom (s : σ) : List α → σ := List.foldl M.step s

/-- Run the automaton from its initial state. -/
def eval : List α → σ := M.evalFrom M.start

/-- The acceptor DFA recognising the words with output in `S`. -/
def toDFA (S : Set Δ) : DFA α σ := ⟨M.step, M.start, M.output ⁻¹' S⟩

theorem evalFrom_append (s : σ) (x y : List α) :
    M.evalFrom s (x ++ y) = M.evalFrom (M.evalFrom s x) y := by sorry

theorem eval_toDFA (S : Set Δ) (x : List α) : (M.toDFA S).eval x = M.eval x := by sorry

theorem mem_accepts_toDFA (S : Set Δ) (x : List α) :
    x ∈ (M.toDFA S).accepts ↔ M.output (M.eval x) ∈ S := by sorry

/-- Change the output alphabet along `f`. -/
def mapOutput {Δ' : Type*} (f : Δ → Δ') : DFAO α σ Δ' := ⟨M.step, M.start, f ∘ M.output⟩

/-- The product automaton, outputting pairs. -/
def prod {τ Δ' : Type*} (N : DFAO α τ Δ') : DFAO α (σ × τ) (Δ × Δ') :=
  ⟨fun s a => (M.step s.1 a, N.step s.2 a), (M.start, N.start), fun s => (M.output s.1, N.output s.2)⟩

/-- Unit test `DFAO.parity_eval`: the two-state parity automaton on binary words outputs the
parity of the number of ones. -/
example (w : List (Fin 2)) :
    (⟨fun s a => s + ((a : ℕ) : ZMod 2), 0, id⟩ : DFAO (Fin 2) (ZMod 2) (ZMod 2)).eval w =
      ((w.map fun a => (a : ℕ)).sum : ZMod 2) := by sorry

/-- Unit test `DFAO.eval_nil`: on the empty word the automaton stays in its initial state. -/
example : M.eval [] = M.start := by sorry

/-- Unit test `DFAO.toDFA_accepts`: the acceptor for `S = Set.univ` accepts every word. -/
example (x : List α) : x ∈ (M.toDFA Set.univ).accepts := by sorry

end DFAO

/-- `a` is `k`-automatic: some DFAO with finitely many states reads the base-`k` digits of `n`,
least significant digit first (Mathlib's `Nat.digits` order), and outputs `a n`. -/
def IsAutomatic (k : ℕ) [NeZero k] {Δ : Type*} (a : ℕ → Δ) : Prop :=
  ∃ (σ : Type) (_ : Fintype σ) (M : DFAO (Fin k) σ Δ),
    ∀ n, a n = M.output (M.eval ((Nat.digits k n).map (Fin.ofNat k)))

/-- The `k`-kernel of `a`: the subsequences `n ↦ a (k ^ e * n + r)` with `r < k ^ e`. -/
def kernel (k : ℕ) {Δ : Type*} (a : ℕ → Δ) : Set (ℕ → Δ) :=
  {b | ∃ e r : ℕ, r < k ^ e ∧ b = fun n => a (k ^ e * n + r)}

section Automatic

variable {k : ℕ} [NeZero k] {Δ : Type*}

theorem IsAutomatic.map {Δ' : Type*} {a : ℕ → Δ} (ha : IsAutomatic k a) (f : Δ → Δ') :
    IsAutomatic k (f ∘ a) := by sorry

theorem IsAutomatic.prod {Δ' : Type*} {a : ℕ → Δ} {b : ℕ → Δ'} (ha : IsAutomatic k a)
    (hb : IsAutomatic k b) : IsAutomatic k (fun n => (a n, b n)) := by sorry

theorem IsAutomatic.finite_range {a : ℕ → Δ} (ha : IsAutomatic k a) : (Set.range a).Finite := by
  sorry

theorem isAutomatic_const (d : Δ) : IsAutomatic k (fun _ => d) := by sorry

theorem isAutomatic_of_eventually_periodic {a : ℕ → Δ} {N p : ℕ} (hp : 0 < p)
    (h : ∀ n ≥ N, a (n + p) = a n) : IsAutomatic k a := by sorry

theorem self_mem_kernel (a : ℕ → Δ) : a ∈ kernel k a := by sorry

theorem kernel_subset (a : ℕ → Δ) {b : ℕ → Δ} (hb : b ∈ kernel k a) : kernel k b ⊆ kernel k a := by
  sorry

/-- Unit test `isAutomatic_const_two`: a constant sequence is `2`-automatic. -/
example (d : Δ) : IsAutomatic 2 (fun _ => d) := by sorry

/-- Unit test `not_isAutomatic_id`: `n ↦ n` takes infinitely many values, so it is not
automatic in any base. -/
example : ¬ IsAutomatic 2 (fun n : ℕ => n) := by sorry

/-- Unit test `kernel_const`: the `k`-kernel of a constant sequence is a single sequence. -/
example (d : Δ) : kernel 3 (fun _ => d) = {fun _ => d} := by sorry

/-- Unit test `kernel_parity`: the `2`-kernel of `n ↦ n % 2` is `{n ↦ n % 2, 0, 1}`. -/
example : kernel 2 (fun n : ℕ => n % 2) = {fun n => n % 2, fun _ => 0, fun _ => 1} := by sorry

/-- Unit test `kernel_two_mul_add_one_mem`: `n ↦ a (2 * n + 1)` lies in the `2`-kernel of `a`
(`e = 1`, `r = 1 < 2 ^ 1`). -/
example (a : ℕ → Δ) : (fun n => a (2 * n + 1)) ∈ kernel 2 a := by sorry

/-- Unit test `isAutomatic_parity`: `n ↦ n mod 2` is `2`-automatic (read the last digit). -/
example : IsAutomatic 2 (fun n : ℕ => n % 2) := by sorry

/-- **Eilenberg's theorem.** A sequence is `k`-automatic iff its `k`-kernel is finite. -/
theorem isAutomatic_iff_finite_kernel (hk : 2 ≤ k) (a : ℕ → Δ) :
    IsAutomatic k a ↔ (kernel k a).Finite := by sorry

/-- Automaticity does not depend on the reading direction: reading the most significant digit
first gives the same class. -/
theorem isAutomatic_iff_reverse (hk : 2 ≤ k) (a : ℕ → Δ) :
    IsAutomatic k a ↔ ∃ (σ : Type) (_ : Fintype σ) (M : DFAO (Fin k) σ Δ),
      ∀ n, a n = M.output (M.eval ((Nat.digits k n).map (Fin.ofNat k)).reverse) := by sorry

/-- `k`-automatic and `k ^ m`-automatic are the same for `m ≥ 1`. -/
theorem isAutomatic_pow_iff (hk : 2 ≤ k) {m : ℕ} (hm : 0 < m) (a : ℕ → Δ) :
    IsAutomatic (k ^ m) a ↔ IsAutomatic k a := by sorry

/-- **Cobham's characterisation.** A sequence is `k`-automatic iff it is a letter-to-letter image
`τ ∘ s` of the fixed point `s` of a `k`-uniform morphism `φ` of a finite alphabet, that is
`s (k * n + r) = φ (s n) r`. -/
theorem isAutomatic_iff_uniformMorphism (hk : 2 ≤ k) (a : ℕ → Δ) :
    IsAutomatic k a ↔ ∃ (Γ : Type) (_ : Fintype Γ) (φ : Γ → Fin k → Γ) (s : ℕ → Γ) (τ : Γ → Δ),
      (∀ (n : ℕ) (r : Fin k), s (k * n + r) = φ (s n) r) ∧ a = τ ∘ s := by sorry

end Automatic

/-- The Thue–Morse sequence: the parity of the binary digit sum. -/
def thueMorse (n : ℕ) : ZMod 2 := ((Nat.digits 2 n).sum : ZMod 2)

theorem thueMorse_two_mul (n : ℕ) : thueMorse (2 * n) = thueMorse n := by sorry

theorem thueMorse_two_mul_add_one (n : ℕ) : thueMorse (2 * n + 1) = 1 + thueMorse n := by sorry

theorem isAutomatic_thueMorse : IsAutomatic 2 thueMorse := by sorry

theorem kernel_thueMorse : kernel 2 thueMorse = {thueMorse, fun n => 1 + thueMorse n} := by sorry

theorem thueMorse_algebraic :
    (1 + PowerSeries.X) ^ 3 * (PowerSeries.mk thueMorse) ^ 2 +
      (1 + PowerSeries.X) ^ 2 * PowerSeries.mk thueMorse + PowerSeries.X = 0 := by sorry

/-- Unit test `kernel_thueMorse_eq_pair`: the `2`-kernel of the Thue–Morse sequence is
`{t, 1 + t}`. -/
example : kernel 2 thueMorse = {thueMorse, fun n => 1 + thueMorse n} := by sorry

/-- Unit test `thueMorse_values`: `0, 1, 1, 0, 1, 0, 0, 1`. -/
example : (List.range 8).map thueMorse = [0, 1, 1, 0, 1, 0, 0, 1] := by sorry

/-- Unit test `thueMorse_two_pow`: `t (2 ^ j) = 1`. -/
example (j : ℕ) : thueMorse (2 ^ j) = 1 := by sorry

/-- Unit test `thueMorse_not_eventually_periodic`: the Thue–Morse sequence is not eventually
periodic, so it is not the coefficient sequence of a rational series over `𝔽₂`. -/
example : ¬ ∃ N p : ℕ, 0 < p ∧ ∀ n ≥ N, thueMorse (n + p) = thueMorse n := by sorry

/-! ### Christol's theorem -/

namespace LaurentSeries

variable {K : Type*} [Field K]

/-- The Cartier operator `Λ_r` of modulus `q`: `∑ aₙ Xⁿ ↦ ∑ a_{qn+r} Xⁿ`. -/
def cartier (q r : ℕ) (f : K⸨X⸩) : K⸨X⸩ := by sorry

theorem coeff_cartier (q r : ℕ) (f : K⸨X⸩) (n : ℤ) :
    (cartier q r f).coeff n = f.coeff (q * n + r) := by sorry

theorem cartier_add (q r : ℕ) (f g : K⸨X⸩) : cartier q r (f + g) = cartier q r f + cartier q r g := by
  sorry

theorem cartier_smul (q r : ℕ) (c : K) (f : K⸨X⸩) : cartier q r (c • f) = c • cartier q r f := by
  sorry

theorem cartier_ofPowerSeries (q r : ℕ) (a : ℕ → K) :
    cartier q r (HahnSeries.ofPowerSeries ℤ K (PowerSeries.mk a)) =
      HahnSeries.ofPowerSeries ℤ K (PowerSeries.mk fun n => a (q * n + r)) := by sorry

theorem cartier_pow_card_mul [Fintype K] (r : ℕ) (g h : K⸨X⸩) :
    cartier (Fintype.card K) r (g ^ Fintype.card K * h) = g * cartier (Fintype.card K) r h := by
  sorry

theorem eq_sum_single_mul_cartier_pow [Fintype K] (f : K⸨X⸩) :
    f = ∑ r ∈ range (Fintype.card K),
      HahnSeries.single (r : ℤ) (1 : K) * (cartier (Fintype.card K) r f) ^ Fintype.card K := by
  sorry

theorem natDegree_cartier_le (q r : ℕ) (hq : 0 < q) (P : K[X]) :
    ∃ P' : K[X], P'.natDegree ≤ P.natDegree / q ∧
      cartier q r (P : K⸨X⸩) = (P' : K⸨X⸩) := by sorry

/-- Unit test `LaurentSeries.cartier_single`: `Λ_r (X ^ m) = X ^ ((m - r) / q)` when
`m ≡ r (mod q)`, and `0` otherwise. -/
example (q r : ℕ) (hq : 0 < q) (hr : r < q) (m : ℤ) :
    cartier q r (HahnSeries.single m (1 : K)) =
      if (q : ℤ) ∣ m - r then HahnSeries.single ((m - r) / q) 1 else 0 := by sorry

/-- Unit test `LaurentSeries.cartier_one_zero`: with modulus `1`, `Λ_0` is the identity. -/
example (f : K⸨X⸩) : cartier 1 0 f = f := by sorry

/-- Unit test `LaurentSeries.cartier_pow_card`: over a finite field, `Λ_0 (g ^ q) = g`. -/
example [Fintype K] (g : K⸨X⸩) : cartier (Fintype.card K) 0 (g ^ Fintype.card K) = g := by sorry

end LaurentSeries

section Christol

variable {K : Type*} [Field K] [Fintype K]

/-- **Ore's lemma.** An algebraic power series over a finite field `𝔽_q` satisfies a relation
`∑ aᵢ f ^ (q ^ i) = 0` with polynomial coefficients and `a₀ ≠ 0`. -/
theorem exists_ore_relation (f : K⟦X⟧) (hf : IsAlgebraic K[X] f) :
    ∃ (m : ℕ) (a : Fin (m + 1) → K[X]), a 0 ≠ 0 ∧
      ∑ i, (a i : K⟦X⟧) * f ^ (Fintype.card K ^ (i : ℕ)) = 0 := by sorry

/-- Algebraic power series over `𝔽_q` have `q`-automatic coefficients
(Christol–Kamae–Mendès France–Rauzy, §7). -/
theorem isAutomatic_of_isAlgebraic [NeZero (Fintype.card K)] (f : K⟦X⟧)
    (hf : IsAlgebraic K[X] f) : IsAutomatic (Fintype.card K) (fun n => PowerSeries.coeff n f) := by
  sorry

/-- Power series over `𝔽_q` with `q`-automatic coefficients are algebraic (Bridy,
Proposition 2.13). -/
theorem isAlgebraic_of_isAutomatic [NeZero (Fintype.card K)] (a : ℕ → K)
    (ha : IsAutomatic (Fintype.card K) a) : IsAlgebraic K[X] (PowerSeries.mk a) := by sorry

/-- **Christol's theorem.** Over a finite field of characteristic `p`, a power series is
algebraic over `𝔽_q(X)` iff its coefficient sequence is `p`-automatic. -/
theorem christol {p : ℕ} [Fact p.Prime] [CharP K p] (a : ℕ → K) :
    IsAlgebraic K[X] (PowerSeries.mk a) ↔ IsAutomatic p a := by sorry

end Christol

/-! ### Farey sequences and the Stern–Brocot tree -/

/-- The mediant `(a + c) / (b + d)` of `a / b` and `c / d` written in lowest terms. -/
def mediant (x y : ℚ) : ℚ := (x.num + y.num : ℚ) / ((x.den + y.den : ℕ) : ℚ)

theorem mediant_comm (x y : ℚ) : mediant x y = mediant y x := by sorry

theorem mediant_mem_Ioo {x y : ℚ} (h : x < y) : x < mediant x y ∧ mediant x y < y := by sorry

theorem mediant_self (x : ℚ) : mediant x x = x := by sorry

theorem den_mediant_of_det {x y : ℚ} (h : y.num * x.den - x.num * y.den = 1) :
    (mediant x y).den = x.den + y.den ∧ (mediant x y).num = x.num + y.num := by sorry

/-- Unit test `mediant_zero_one`: the mediant of `0/1` and `1/1` is `1/2`. -/
example : mediant 0 1 = 1 / 2 := by sorry

/-- Unit test `mediant_third_twothirds`: the mediant of `1/3` and `2/3` is `3/6 = 1/2`: a
mediant need not be in lowest terms, and it is not the average of the denominators. -/
example : mediant (1 / 3) (2 / 3) = 1 / 2 ∧ (mediant (1 / 3) (2 / 3)).den = 2 := by sorry

/-- Unit test `mediant_ne_average`: the mediant of `0` and `1/2` is `1/3`, not the midpoint
`1/4`. -/
example : mediant 0 (1 / 2) = 1 / 3 := by sorry

/-- The Farey sequence `F_n`: the rationals in `[0, 1]` with denominator at most `n`. -/
def fareySeq (n : ℕ) : Finset ℚ :=
  ((range (n + 1) ×ˢ Icc 1 n).image fun p : ℕ × ℕ => (p.1 : ℚ) / p.2).filter (· ≤ 1)

theorem mem_fareySeq {n : ℕ} {x : ℚ} : x ∈ fareySeq n ↔ 0 ≤ x ∧ x ≤ 1 ∧ 1 ≤ n ∧ x.den ≤ n := by
  sorry

theorem card_fareySeq {n : ℕ} (hn : 1 ≤ n) :
    (fareySeq n).card = 1 + ∑ k ∈ Icc 1 n, Nat.totient k := by sorry

theorem fareySeq_mono {m n : ℕ} (h : m ≤ n) : fareySeq m ⊆ fareySeq n := by sorry

theorem one_sub_mem_fareySeq {n : ℕ} {x : ℚ} (hx : x ∈ fareySeq n) : 1 - x ∈ fareySeq n := by
  sorry

/-- Unit test `fareySeq_three`: `F_3 = {0, 1/3, 1/2, 2/3, 1}`. -/
example : fareySeq 3 = {0, 1 / 3, 1 / 2, 2 / 3, 1} := by sorry

/-- Unit test `card_fareySeq_seven`: `F_7` has `19` terms. -/
example : (fareySeq 7).card = 19 := by sorry

/-- Unit test `fareySeq_zero`: `F_0` is empty. -/
example : fareySeq 0 = ∅ := by sorry

/-- Unit test `fareySeq_one`: `F_1 = {0, 1}`; `2/4` and `1/2` are the same term of `F_4`. -/
example : fareySeq 1 = {0, 1} ∧ (2 / 4 : ℚ) = 1 / 2 := by sorry

/-- Between fractions with `c b - a d = 1`, every fraction has denominator at least `b + d`, and
the only one with denominator `b + d` is the mediant. -/
theorem den_ge_of_mem_Ioo {x y z : ℚ} (h : y.num * x.den - x.num * y.den = 1)
    (hz : x < z ∧ z < y) : x.den + y.den ≤ z.den ∧ (z.den = x.den + y.den → z = mediant x y) := by
  sorry

/-- **Farey neighbours.** Consecutive terms `a/b < c/d` of `F_n` satisfy `b c - a d = 1` and
`b + d > n`. -/
theorem fareySeq_neighbours {n : ℕ} {x y : ℚ} (hx : x ∈ fareySeq n) (hy : y ∈ fareySeq n)
    (hxy : x < y) (hadj : ∀ z ∈ fareySeq n, ¬ (x < z ∧ z < y)) :
    y.num * x.den - x.num * y.den = 1 ∧ n < x.den + y.den := by sorry

/-- **The mediant property.** The middle one of three consecutive terms of `F_n` is the mediant of
its neighbours, reduced to lowest terms. -/
theorem fareySeq_mediant {n : ℕ} {x y z : ℚ} (hx : x ∈ fareySeq n) (hy : y ∈ fareySeq n)
    (hz : z ∈ fareySeq n) (hxy : x < y) (hyz : y < z)
    (hadj : ∀ w ∈ fareySeq n, ¬ (x < w ∧ w < y) ∧ ¬ (y < w ∧ w < z)) : y = mediant x z := by sorry

/-- The bounding pair `((a, b), (c, d))` of the Stern–Brocot node reached along a path
(`false` = left, `true` = right), starting from `((0, 1), (1, 0))`. -/
def sternBrocotBounds (w : List Bool) : (ℕ × ℕ) × (ℕ × ℕ) :=
  w.foldl (fun B t => if t then ((B.1.1 + B.2.1, B.1.2 + B.2.2), B.2)
    else (B.1, (B.1.1 + B.2.1, B.1.2 + B.2.2))) ((0, 1), (1, 0))

/-- The Stern–Brocot node along a path: the mediant of its bounds. -/
def sternBrocot (w : List Bool) : ℚ :=
  (((sternBrocotBounds w).1.1 + (sternBrocotBounds w).2.1 : ℕ) : ℚ) /
    (((sternBrocotBounds w).1.2 + (sternBrocotBounds w).2.2 : ℕ) : ℚ)

theorem sternBrocotBounds_det (w : List Bool) :
    ((sternBrocotBounds w).2.1 * (sternBrocotBounds w).1.2 : ℤ) -
      (sternBrocotBounds w).1.1 * (sternBrocotBounds w).2.2 = 1 := by sorry

theorem den_sternBrocot (w : List Bool) :
    (sternBrocot w).den = (sternBrocotBounds w).1.2 + (sternBrocotBounds w).2.2 := by sorry

theorem sternBrocot_lt_append_true (w v : List Bool) :
    sternBrocot w < sternBrocot (w ++ true :: v) := by sorry

theorem sternBrocot_append_false_lt (w v : List Bool) :
    sternBrocot (w ++ false :: v) < sternBrocot w := by sorry

/-- Unit test `sternBrocot_nil`: the root is `1/1`. -/
example : sternBrocot [] = 1 := by sorry

/-- Unit test `sternBrocot_small`: left child `1/2`, right child `2/1`, and `left, right` is
`2/3`. -/
example : sternBrocot [false] = 1 / 2 ∧ sternBrocot [true] = 2 ∧ sternBrocot [false, true] = 2 / 3 := by
  sorry

/-- Unit test `sternBrocot_ne_three_sixths`: nodes are in lowest terms; the node `1/2` is never
written `3/6`. -/
example : (sternBrocot [false]).den = 2 := by sorry

/-- **Every positive rational occurs exactly once** in the Stern–Brocot tree, in lowest terms. -/
theorem sternBrocot_bijective :
    Function.Injective sternBrocot ∧ Set.range sternBrocot = {x : ℚ | 0 < x} := by sorry

end CA2

end TauCeti.ClassicalArithmetic


-- ===== CA.3 =====

/-!
## CA.3 Polynomial and matrix arithmetic

Suggested forms for the declarations of layer CA.3 (see the roadmap document, section CA.3).
The layer's Tau Ceti inputs (`Matrix.exists_smith_normal_form_of_det_ne_zero`,
`Matrix.smith_normal_form_unique`, `Matrix.invariant_factor_zero_eq_gcd`, `TauCeti.ringChooseSpan`,
`TauCeti.ringChooseSpanBasisX`, `TauCeti.exists_forall_sum_mul_choose_eq`, `TauCeti.rouche_add`,
`TauCeti.exists_det_ne_zero_mul_eq_mul_companionFinTwo`) would be imported from
`TauCeti.LinearAlgebra.Matrix.SmithNormalForm`, `TauCeti.RingTheory.Binomial`,
`TauCeti.RingTheory.Polynomial.BinomialBasis`, `TauCeti.Analysis.Complex.Conformal.Rouche` and
`TauCeti.LinearAlgebra.Matrix.RationalCanonicalFormFinTwo`; Tau Ceti is not built in the
environment that checked this file, so the statements below are phrased in Mathlib vocabulary and
the proofs that would use those modules are `sorry`.

Conventions pinned here (and in the document):
* an integer matrix `A : Matrix (Fin m) (Fin n) ℤ` acts on columns; its lattice is the column span
  `LinearMap.range A.mulVecLin ⊆ ℤ^m`, and unimodular transformations act on the right;
* invariant factors of an integer matrix are positive natural numbers `d 0 ∣ d 1 ∣ ⋯`;
* the Hermite normal form is column-style and upper: the pivot of a column is its lowest nonzero
  entry, pivots are positive and move strictly down from left to right, and every entry to the
  right of a pivot in the pivot's row lies in `[0, pivot)`;
* the companion block of a monic `f` is the matrix of multiplication by `X` on `K[X]/(f)` in the
  basis `1, X, …, X^(deg f - 1)`, i.e. ones on the subdiagonal and `-coeff f i` in the last column;
* the Newton polygon is recorded by slope multiplicities in the orientation in which the slope of a
  linear factor `X - c` is `v c`.
-/

noncomputable section

open Polynomial

namespace TauCeti.ClassicalArithmetic

section CA3

/-! ### Smith normal form -/

namespace IntMatrix

variable {m n : ℕ}

/-- The `m × n` integer matrix carrying `d 0, …, d (r - 1)` on its leading diagonal and zeros
elsewhere. -/
def smithDiag (m n : ℕ) {r : ℕ} (d : Fin r → ℕ) : Matrix (Fin m) (Fin n) ℤ :=
  Matrix.of fun i j => if h : (i : ℕ) = j ∧ (i : ℕ) < r then (d ⟨i, h.2⟩ : ℤ) else 0

/-- **Smith normal form certificate** (CA.3/smith-normal-form-certificate). The transformation
matrices come with explicit inverses, so that a checker verifies unimodularity by two matrix
products and the reconstruction equation by one. -/
structure SmithCertificate (A : Matrix (Fin m) (Fin n) ℤ) where
  /-- The row transformation. -/
  P : Matrix (Fin m) (Fin m) ℤ
  /-- Its inverse. -/
  Pinv : Matrix (Fin m) (Fin m) ℤ
  /-- The column transformation. -/
  Q : Matrix (Fin n) (Fin n) ℤ
  /-- Its inverse. -/
  Qinv : Matrix (Fin n) (Fin n) ℤ
  /-- The number of nonzero invariant factors. -/
  rank : ℕ
  rank_le_left : rank ≤ m
  rank_le_right : rank ≤ n
  /-- The invariant factors. -/
  d : Fin rank → ℕ
  d_pos : ∀ i, 0 < d i
  d_dvd : ∀ i j : Fin rank, i ≤ j → d i ∣ d j
  P_mul_Pinv : P * Pinv = 1
  Pinv_mul_P : Pinv * P = 1
  Q_mul_Qinv : Q * Qinv = 1
  Qinv_mul_Q : Qinv * Q = 1
  reconstruction : P * A * Q = smithDiag m n d

namespace SmithCertificate

variable {A : Matrix (Fin m) (Fin n) ℤ}

/-- The certificate reconstructs `A` from the diagonal. -/
theorem eq_reconstruct (c : SmithCertificate A) : A = c.Pinv * smithDiag m n c.d * c.Qinv := by
  sorry

/-- The row transformation is unimodular. -/
theorem isUnit_det_P (c : SmithCertificate A) : IsUnit c.P.det := by
  sorry

/-- The column transformation is unimodular. -/
theorem isUnit_det_Q (c : SmithCertificate A) : IsUnit c.Q.det := by
  sorry

/-- The row transformation as an element of `GL_m(ℤ)`. -/
def toGLP (c : SmithCertificate A) : GL (Fin m) ℤ :=
  ⟨c.P, c.Pinv, c.P_mul_Pinv, c.Pinv_mul_P⟩

/-- The number of invariant factors is the rank of `A` over `ℚ`. -/
theorem rank_eq_rank (c : SmithCertificate A) :
    c.rank = (A.map (Int.castRingHom ℚ)).rank := by
  sorry

/-- The first invariant factor is the gcd of the entries of `A`. -/
theorem d_zero_eq_gcd (c : SmithCertificate A) (h : 0 < c.rank) :
    (c.d ⟨0, h⟩ : ℤ) = Finset.univ.gcd fun p : Fin m × Fin n => A p.1 p.2 := by
  sorry

/-- A certificate for `A` gives one for its transpose. -/
def transpose (c : SmithCertificate A) : SmithCertificate A.transpose where
  P := c.Q.transpose
  Pinv := c.Qinv.transpose
  Q := c.P.transpose
  Qinv := c.Pinv.transpose
  rank := c.rank
  rank_le_left := c.rank_le_right
  rank_le_right := c.rank_le_left
  d := c.d
  d_pos := c.d_pos
  d_dvd := c.d_dvd
  P_mul_Pinv := sorry
  Pinv_mul_P := sorry
  Q_mul_Qinv := sorry
  Qinv_mul_Q := sorry
  reconstruction := sorry

end SmithCertificate

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithCertificate_two_by_three`: every Smith
certificate of the matrix with rows `(2, 4, 6)` and `(3, 6, 9)` has exactly one invariant factor,
equal to `1`. -/
example (c : SmithCertificate !![(2 : ℤ), 4, 6; 3, 6, 9]) :
    ∃ h : c.rank = 1, c.d ⟨0, by omega⟩ = 1 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithCertificate_chain_not_automatic`: every
Smith certificate of `diag(2, 3)` has invariant factors `1, 6`, not `2, 3`. -/
example (c : SmithCertificate !![(2 : ℤ), 0; 0, 3]) :
    ∃ h : c.rank = 2, c.d ⟨0, by omega⟩ = 1 ∧ c.d ⟨1, by omega⟩ = 6 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithCertificate_zero`: a Smith certificate of
the zero `2 × 3` matrix has no invariant factors. -/
example (c : SmithCertificate (0 : Matrix (Fin 2) (Fin 3) ℤ)) : c.rank = 0 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithCertificate_rational_transform`: the
rational matrices `diag(1/2, 1/3)` diagonalise `diag(2, 3)` to the identity, which is not its Smith
form: over `ℚ` every nonsingular matrix is equivalent to the identity, over `ℤ` it is not. -/
example : (!![(1 / 2 : ℚ), 0; 0, 1 / 3] * !![(2 : ℚ), 0; 0, 3] = 1) ∧
    ¬ ∃ c : SmithCertificate !![(2 : ℤ), 0; 0, 3], ∀ i, c.d i = 1 := by
  sorry

/-- The quantity that the Smith reduction decreases: the least absolute value of a nonzero entry
(zero for the zero matrix). -/
def pivotMeasure (A : Matrix (Fin m) (Fin n) ℤ) : ℕ :=
  sInf {k : ℕ | 0 < k ∧ ∃ i j, (A i j).natAbs = k}

/-- **Termination of the Euclidean step.** If an entry of the row or column of a pivot of least
absolute value is not divisible by the pivot, a unimodular row or column operation produces a
matrix with a strictly smaller least nonzero absolute value. -/
theorem exists_unimodular_pivotMeasure_lt (A : Matrix (Fin m) (Fin n) ℤ) {i₀ : Fin m} {j₀ : Fin n}
    (hpiv : 0 < (A i₀ j₀).natAbs ∧ (A i₀ j₀).natAbs = pivotMeasure A)
    (hnd : (∃ j, ¬ A i₀ j₀ ∣ A i₀ j) ∨ (∃ i, ¬ A i₀ j₀ ∣ A i j₀)) :
    ∃ (U : GL (Fin m) ℤ) (V : GL (Fin n) ℤ),
      pivotMeasure ((U : Matrix (Fin m) (Fin m) ℤ) * A * (V : Matrix (Fin n) (Fin n) ℤ)) <
        pivotMeasure A := by
  sorry

/-- **The Smith normal form algorithm** (CA.3/smith-normal-form-of-an-integer-matrix), defined by
well-founded recursion on the size of the matrix and `pivotMeasure`. -/
def smithNormalForm (A : Matrix (Fin m) (Fin n) ℤ) : SmithCertificate A := by
  sorry

/-- The invariant factors of an integer matrix, as a list. -/
def smithInvariantFactors (A : Matrix (Fin m) (Fin n) ℤ) : List ℕ :=
  List.ofFn (smithNormalForm A).d

/-- The invariant factors form a divisibility chain. -/
theorem smithInvariantFactors_chain (A : Matrix (Fin m) (Fin n) ℤ) :
    (smithInvariantFactors A).IsChain (· ∣ ·) := by
  sorry

/-- The list does not depend on the certificate. -/
theorem smithInvariantFactors_eq_of_certificate {A : Matrix (Fin m) (Fin n) ℤ}
    (c : SmithCertificate A) : smithInvariantFactors A = List.ofFn c.d := by
  sorry

/-- The invariant factors are invariant under unimodular equivalence. -/
theorem smithInvariantFactors_mul_mul (A : Matrix (Fin m) (Fin n) ℤ) (U : GL (Fin m) ℤ)
    (V : GL (Fin n) ℤ) :
    smithInvariantFactors ((U : Matrix (Fin m) (Fin m) ℤ) * A * (V : Matrix (Fin n) (Fin n) ℤ)) =
      smithInvariantFactors A := by
  sorry

/-- For a square matrix, the product of the invariant factors is `|det A|` when `det A ≠ 0`. -/
theorem prod_smithInvariantFactors (A : Matrix (Fin n) (Fin n) ℤ) (hA : A.det ≠ 0) :
    (smithInvariantFactors A).prod = A.det.natAbs := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_two_by_three`. -/
example : smithInvariantFactors !![(2 : ℤ), 4, 6; 3, 6, 9] = [1] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_diag_two_three`. -/
example : smithInvariantFactors !![(2 : ℤ), 0; 0, 3] = [1, 6] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_singular_square`. -/
example : smithInvariantFactors !![(2 : ℤ), 0; 0, 0] = [2] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_zero`. -/
example : smithInvariantFactors (0 : Matrix (Fin 2) (Fin 3) ℤ) = [] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_length_of_det_ne_zero`:
a nonsingular square matrix has `n` invariant factors (the case Tau Ceti's
`Matrix.exists_smith_normal_form_of_det_ne_zero` covers). -/
example (A : Matrix (Fin 3) (Fin 3) ℤ) (hA : A.det ≠ 0) : (smithInvariantFactors A).length = 3 := by
  sorry

/-- **Uniqueness of the Smith normal form** (CA.3/smith-invariant-factors-unique): any two
certificates of the same matrix have the same invariant factors. -/
theorem SmithCertificate.invariantFactors_unique {A : Matrix (Fin m) (Fin n) ℤ}
    (c₁ c₂ : SmithCertificate A) : List.ofFn c₁.d = List.ofFn c₂.d := by
  sorry

/-- **The cokernel of an integer matrix** (CA.3/cokernel-of-an-integer-matrix): with a Smith
certificate, `ℤ^m / A ℤ^n ≅ ⊕ ℤ/dᵢ ⊕ ℤ^(m - rank)`. -/
theorem SmithCertificate.nonempty_cokernel_equiv {A : Matrix (Fin m) (Fin n) ℤ}
    (c : SmithCertificate A) :
    Nonempty (((Fin m → ℤ) ⧸ LinearMap.range A.mulVecLin) ≃ₗ[ℤ]
      (Π i : Fin c.rank, ZMod (c.d i)) × (Fin (m - c.rank) → ℤ)) := by
  sorry

end IntMatrix

/-- **Smith normal form over a principal ideal domain** (CA.3/smith-normal-form-over-a-pid):
existence of invertible `P`, `Q` and a divisibility chain of nonzero `d i` with `P A Q` diagonal.
Over `ℤ` the algorithm `IntMatrix.smithNormalForm` computes such a form. -/
theorem exists_smith_normal_form_of_pid {R : Type*} [CommRing R] [IsDomain R]
    [IsPrincipalIdealRing R] {m n : ℕ} (A : Matrix (Fin m) (Fin n) R) :
    ∃ (P : GL (Fin m) R) (Q : GL (Fin n) R) (r : ℕ) (d : Fin r → R), r ≤ m ∧ r ≤ n ∧
      (∀ i, d i ≠ 0) ∧ (∀ i j : Fin r, i ≤ j → d i ∣ d j) ∧
      (P : Matrix (Fin m) (Fin m) R) * A * (Q : Matrix (Fin n) (Fin n) R) =
        Matrix.of fun (i : Fin m) (j : Fin n) =>
          if h : (i : ℕ) = j ∧ (i : ℕ) < r then d ⟨i, h.2⟩ else 0 := by
  sorry

/-! ### Invariant factors of finitely generated modules over a PID -/

/-- **The structure theorem in invariant-factor form** (CA.3/invariant-factor-decomposition). -/
theorem exists_invariantFactor_decomposition (R M : Type*) [CommRing R] [IsDomain R]
    [IsPrincipalIdealRing R] [AddCommGroup M] [Module R M] [Module.Finite R M] :
    ∃ (r k : ℕ) (a : Fin k → R), (∀ i, a i ≠ 0 ∧ ¬ IsUnit (a i)) ∧
      (∀ i j : Fin k, i ≤ j → a i ∣ a j) ∧
      Nonempty (M ≃ₗ[R] (Fin r → R) × (Π i, R ⧸ Ideal.span {a i})) := by
  sorry

/-- **Uniqueness of the invariant factors** (CA.3/invariant-factors-unique). -/
theorem invariantFactors_unique {R M : Type*} [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]
    [AddCommGroup M] [Module R M] {r k r' k' : ℕ} {a : Fin k → R} {b : Fin k' → R}
    (ha : ∀ i, a i ≠ 0 ∧ ¬ IsUnit (a i)) (hb : ∀ i, b i ≠ 0 ∧ ¬ IsUnit (b i))
    (hac : ∀ i j : Fin k, i ≤ j → a i ∣ a j) (hbc : ∀ i j : Fin k', i ≤ j → b i ∣ b j)
    (e : M ≃ₗ[R] (Fin r → R) × (Π i, R ⧸ Ideal.span {a i}))
    (e' : M ≃ₗ[R] (Fin r' → R) × (Π i, R ⧸ Ideal.span {b i})) :
    r = r' ∧ ∃ h : k = k', ∀ i, Associated (a i) (b (Fin.cast h i)) := by
  sorry

/-! ### Hermite normal form -/

namespace IntMatrix

variable {m n k : ℕ}

/-- **Hermite normal form** (CA.3/is-hermite-normal-form), column-style and upper, with no zero
columns: the pivot `p j` of column `j` is its lowest nonzero entry, pivots are positive, move
strictly down, and every entry to the right of a pivot in its row is reduced modulo it. -/
def IsHermiteNormalForm (H : Matrix (Fin m) (Fin k) ℤ) : Prop :=
  ∃ p : Fin k → Fin m, StrictMono p ∧ (∀ j, 0 < H (p j) j) ∧ (∀ j i, p j < i → H i j = 0) ∧
    ∀ j j', j < j' → 0 ≤ H (p j) j' ∧ H (p j) j' < H (p j) j

namespace IsHermiteNormalForm

variable {H : Matrix (Fin m) (Fin k) ℤ}

/-- The pivot rows are determined by `H`: the pivot of column `j` is its lowest nonzero entry. -/
theorem pivot_unique (hH : IsHermiteNormalForm H) {p q : Fin k → Fin m}
    (hp : StrictMono p ∧ (∀ j, 0 < H (p j) j) ∧ (∀ j i, p j < i → H i j = 0))
    (hq : StrictMono q ∧ (∀ j, 0 < H (q j) j) ∧ (∀ j i, q j < i → H i j = 0)) : p = q := by
  sorry

/-- The columns of a matrix in Hermite normal form are linearly independent. -/
theorem linearIndependent_cols (hH : IsHermiteNormalForm H) :
    LinearIndependent ℤ fun j => fun i => H i j := by
  sorry

/-- A square matrix in Hermite normal form is upper triangular with positive diagonal. -/
theorem isUpperTriangular {H : Matrix (Fin m) (Fin m) ℤ} (hH : IsHermiteNormalForm H) :
    H.IsUpperTriangular ∧ ∀ i, 0 < H i i := by
  sorry

/-- The determinant of a square matrix in Hermite normal form is the product of its diagonal. -/
theorem det_eq_prod_diag {H : Matrix (Fin m) (Fin m) ℤ} (hH : IsHermiteNormalForm H) :
    H.det = ∏ i, H i i := by
  sorry

/-- The identity matrix is in Hermite normal form. -/
theorem one : IsHermiteNormalForm (1 : Matrix (Fin m) (Fin m) ℤ) := by
  sorry

end IsHermiteNormalForm

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.isHermiteNormalForm_three_two`: the matrix with
columns `(3, 0)` and `(2, 1)` is in Hermite normal form. -/
example : IsHermiteNormalForm !![(3 : ℤ), 2; 0, 1] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.not_isHermiteNormalForm_unreduced`: the entry
`4` to the right of the pivot `3` is not reduced. -/
example : ¬ IsHermiteNormalForm !![(3 : ℤ), 4; 0, 1] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.not_isHermiteNormalForm_negative_pivot`. -/
example : ¬ IsHermiteNormalForm !![(2 : ℤ), 0; 0, -1] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.isHermiteNormalForm_empty`: the `m × 0` matrix
is in Hermite normal form (the zero lattice). -/
example : IsHermiteNormalForm (Matrix.of fun (_ : Fin 3) (j : Fin 0) => j.elim0 : Matrix (Fin 3) (Fin 0) ℤ) := by
  sorry

/-- **Hermite normal form certificate** (CA.3/hermite-normal-form-certificate): `A * U` is the
Hermite matrix `H` followed by zero columns, with `U` unimodular and its inverse explicit. -/
structure HermiteCertificate (A : Matrix (Fin m) (Fin n) ℤ) where
  /-- The rank of the column lattice. -/
  rank : ℕ
  rank_le : rank ≤ n
  /-- The Hermite basis of the column lattice. -/
  H : Matrix (Fin m) (Fin rank) ℤ
  isHNF : IsHermiteNormalForm H
  /-- The column transformation. -/
  U : Matrix (Fin n) (Fin n) ℤ
  /-- Its inverse. -/
  Uinv : Matrix (Fin n) (Fin n) ℤ
  U_mul_Uinv : U * Uinv = 1
  Uinv_mul_U : Uinv * U = 1
  reconstruction : ∀ i j, (A * U) i j = if h : (j : ℕ) < rank then H i ⟨j, h⟩ else 0

/-- The Hermite matrix padded with zero columns to the shape of `A`. -/
def hermitePad {rank : ℕ} (H : Matrix (Fin m) (Fin rank) ℤ) : Matrix (Fin m) (Fin n) ℤ :=
  Matrix.of fun i j => if h : (j : ℕ) < rank then H i ⟨j, h⟩ else 0

namespace HermiteCertificate

variable {A : Matrix (Fin m) (Fin n) ℤ}

/-- The certificate reconstructs `A`. -/
theorem eq_reconstruct (c : HermiteCertificate A) : A = hermitePad c.H * c.Uinv := by
  sorry

/-- `A` and its Hermite matrix have the same column lattice. -/
theorem range_eq (c : HermiteCertificate A) :
    LinearMap.range A.mulVecLin = LinearMap.range c.H.mulVecLin := by
  sorry

/-- The number of Hermite columns is the rank of `A` over `ℚ`. -/
theorem rank_eq_rank (c : HermiteCertificate A) :
    c.rank = (A.map (Int.castRingHom ℚ)).rank := by
  sorry

/-- The column transformation is unimodular. -/
theorem isUnit_det_U (c : HermiteCertificate A) : IsUnit c.U.det := by
  sorry

end HermiteCertificate

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.hermiteCertificate_one`: every certificate of
the identity has the identity as its Hermite matrix. -/
example (c : HermiteCertificate (1 : Matrix (Fin 2) (Fin 2) ℤ)) :
    ∃ h : c.rank = 2, ∀ i j, c.H i j = if (i : ℕ) = j then 1 else 0 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.hermiteCertificate_zero`: a certificate of the
zero matrix has rank zero. -/
example (c : HermiteCertificate (0 : Matrix (Fin 2) (Fin 3) ℤ)) : c.rank = 0 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.hermiteCertificate_not_rational`: the
certificate is over `ℤ`: `diag(2, 1)` has Hermite matrix `diag(2, 1)`, not the identity. -/
example (c : HermiteCertificate !![(2 : ℤ), 0; 0, 1]) :
    ∃ h : c.rank = 2, c.H ⟨0, by omega⟩ ⟨0, by omega⟩ = 2 := by
  sorry

/-- **The Hermite normal form algorithm** (CA.3/hermite-normal-form). -/
def hermiteNormalForm (A : Matrix (Fin m) (Fin n) ℤ) : HermiteCertificate A := by
  sorry

/-- The Hermite basis of the column lattice of `A`. -/
def hermiteBasis (A : Matrix (Fin m) (Fin n) ℤ) :
    Matrix (Fin m) (Fin (hermiteNormalForm A).rank) ℤ :=
  (hermiteNormalForm A).H

/-- **Termination of the Hermite reduction.** A matrix whose bottom row is nonzero outside its
first `j` columns is carried by a unimodular column operation to one whose bottom-row entries in
those columns have strictly smaller total absolute value, until a single nonzero entry is left. -/
theorem exists_unimodular_bottomRow_decrease (A : Matrix (Fin (m + 1)) (Fin n) ℤ)
    (h : 2 ≤ (Finset.univ.filter fun j => A (Fin.last m) j ≠ 0).card) :
    ∃ V : GL (Fin n) ℤ, ∑ j, ((A * (V : Matrix (Fin n) (Fin n) ℤ)) (Fin.last m) j).natAbs <
      ∑ j, (A (Fin.last m) j).natAbs := by
  sorry

/-- Membership in the column lattice is decided by the Hermite basis. -/
theorem mem_range_iff_hermite (A : Matrix (Fin m) (Fin n) ℤ) (v : Fin m → ℤ) :
    v ∈ LinearMap.range A.mulVecLin ↔ v ∈ LinearMap.range (hermiteBasis A).mulVecLin := by
  sorry

/-- The Hermite basis depends only on the column lattice. -/
theorem hermiteBasis_eq_of_range_eq {A : Matrix (Fin m) (Fin n) ℤ} {B : Matrix (Fin m) (Fin k) ℤ}
    (h : LinearMap.range A.mulVecLin = LinearMap.range B.mulVecLin) :
    ∃ e : (hermiteNormalForm A).rank = (hermiteNormalForm B).rank,
      hermiteBasis A = (hermiteBasis B).submatrix id (Fin.cast e) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.hermiteBasis_stein_example`: the column lattice
of the transpose of `!![1,2,3;4,5,6;7,8,9]` has Hermite basis with columns `(2, 1, 0)` and
`(-3, 0, 3)`. -/
example : ∃ h : (hermiteNormalForm !![(1 : ℤ), 4, 7; 2, 5, 8; 3, 6, 9]).rank = 2,
    hermiteBasis !![(1 : ℤ), 4, 7; 2, 5, 8; 3, 6, 9] =
      (!![(2 : ℤ), -3; 1, 0; 0, 3]).submatrix id (Fin.cast h) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.hermiteBasis_unimodular`: a unimodular matrix
has the identity as Hermite basis. -/
example (U : GL (Fin 2) ℤ) : ∃ h : (hermiteNormalForm (U : Matrix (Fin 2) (Fin 2) ℤ)).rank = 2,
    hermiteBasis (U : Matrix (Fin 2) (Fin 2) ℤ) = (1 : Matrix (Fin 2) (Fin 2) ℤ).submatrix id
      (Fin.cast h) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.IntMatrix.hermiteBasis_rank_deficient`: the `1 × 2`
matrix `(6, 10)` has Hermite basis `(2)`. -/
example : ∃ h : (hermiteNormalForm !![(6 : ℤ), 10]).rank = 1,
    hermiteBasis !![(6 : ℤ), 10] = (!![(2 : ℤ)]).submatrix id (Fin.cast h) := by
  sorry

/-- **Uniqueness of the Hermite normal form** (CA.3/hermite-normal-form-unique). -/
theorem IsHermiteNormalForm.eq_of_range_eq {k' : ℕ} {H : Matrix (Fin m) (Fin k) ℤ}
    {H' : Matrix (Fin m) (Fin k') ℤ} (hH : IsHermiteNormalForm H) (hH' : IsHermiteNormalForm H')
    (h : LinearMap.range H.mulVecLin = LinearMap.range H'.mulVecLin) :
    ∃ e : k = k', H = H'.submatrix id (Fin.cast e) := by
  sorry

/-- **Every sublattice of `ℤ^m` has a unique Hermite basis**
(CA.3/hermite-basis-of-a-sublattice). -/
theorem existsUnique_hermiteBasis (L : Submodule ℤ (Fin m → ℤ)) :
    ∃! H : Σ k, Matrix (Fin m) (Fin k) ℤ,
      IsHermiteNormalForm H.2 ∧ LinearMap.range H.2.mulVecLin = L := by
  sorry

/-- **Index of a full sublattice** (CA.3/index-eq-prod-hermite-pivots). -/
theorem index_range_eq_prod_diag {H : Matrix (Fin m) (Fin m) ℤ} (hH : IsHermiteNormalForm H) :
    (LinearMap.range H.mulVecLin).toAddSubgroup.index = ∏ i, (H i i).natAbs := by
  sorry

end IntMatrix

/-! ### Rational canonical form -/

section RationalCanonicalForm

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- **Invariant factors of an endomorphism** (CA.3/invariant-factors-of-an-endomorphism): the
invariant factors of the `K[X]`-module `V` on which `X` acts by `T`, as monic polynomials
`a₁ ∣ a₂ ∣ ⋯`. -/
def invariantFactors (T : V →ₗ[K] V) : List K[X] := by
  sorry

namespace InvariantFactors

/-- Each invariant factor is monic of positive degree. -/
theorem monic (T : V →ₗ[K] V) : ∀ f ∈ invariantFactors T, f.Monic ∧ 0 < f.natDegree := by
  sorry

/-- The invariant factors form a divisibility chain. -/
theorem chain (T : V →ₗ[K] V) : (invariantFactors T).IsChain (· ∣ ·) := by
  sorry

/-- Their product is the characteristic polynomial. -/
theorem prod_eq_charpoly (T : V →ₗ[K] V) : (invariantFactors T).prod = T.charpoly := by
  sorry

/-- The last one is the minimal polynomial. -/
theorem getLast_eq_minpoly (T : V →ₗ[K] V) (h : invariantFactors T ≠ []) :
    (invariantFactors T).getLast h = minpoly K T := by
  sorry

/-- There are none exactly on the zero space. -/
theorem eq_nil_iff (T : V →ₗ[K] V) : invariantFactors T = [] ↔ Subsingleton V := by
  sorry

/-- The `K[X]`-module `V_T` is the direct sum of the cyclic modules of the invariant factors. -/
theorem nonempty_aeval_equiv (T : V →ₗ[K] V) :
    Nonempty (Module.AEval' T ≃ₗ[K[X]]
      (Π i : Fin (invariantFactors T).length, K[X] ⧸ Ideal.span {(invariantFactors T).get i})) := by
  sorry

/-- Conjugate endomorphisms have the same invariant factors. -/
theorem conj {W : Type*} [AddCommGroup W] [Module K W] [FiniteDimensional K W] (T : V →ₗ[K] V)
    (e : V ≃ₗ[K] W) :
    invariantFactors ((e : V →ₗ[K] W) ∘ₗ T ∘ₗ (e.symm : W →ₗ[K] V)) = invariantFactors T := by
  sorry

end InvariantFactors

/-- Unit test `TauCeti.ClassicalArithmetic.invariantFactors_zero_map`: the zero map on `K²` has
invariant factors `X, X`. -/
example : invariantFactors (0 : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ)) = [X, X] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.invariantFactors_id`: the identity of `K²` has invariant
factors `X - 1, X - 1`, not its characteristic polynomial `(X - 1)²`. -/
example : invariantFactors (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ)) = [X - 1, X - 1] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.invariantFactors_nilpotent_block`: the nilpotent `2 × 2`
Jordan block has the single invariant factor `X²`. -/
example : invariantFactors (Matrix.toLin' !![(0 : ℚ), 0; 1, 0]) = [X ^ 2] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.invariantFactors_nonscalar_two`: a non-scalar `2 × 2`
matrix has its characteristic polynomial as its only invariant factor (the case covered by Tau
Ceti's `exists_det_ne_zero_mul_eq_mul_companionFinTwo`). -/
example (A : Matrix (Fin 2) (Fin 2) ℚ) (hA : ∀ c : ℚ, A ≠ Matrix.scalar (Fin 2) c) :
    invariantFactors (Matrix.toLin' A) = [A.charpoly] := by
  sorry

/-- **The rational canonical basis** (CA.3/rational-canonical-form): a basis of `V` indexed by the
blocks of the invariant factors. -/
def rationalCanonicalBasis (T : V →ₗ[K] V) :
    Module.Basis (Σ i : Fin (invariantFactors T).length,
      Fin ((invariantFactors T).get i).natDegree) K V := by
  sorry

/-- The matrix of `T` in the rational canonical basis is block diagonal, the `i`-th block being the
companion block of the `i`-th invariant factor. -/
theorem toMatrix_rationalCanonicalBasis (T : V →ₗ[K] V) :
    LinearMap.toMatrix (rationalCanonicalBasis T) (rationalCanonicalBasis T) T =
      Matrix.blockDiagonal' fun i =>
        Algebra.leftMulMatrix
          (AdjoinRoot.powerBasis' ((InvariantFactors.monic T _ (List.get_mem _ i)).1)).basis
          (AdjoinRoot.root ((invariantFactors T).get i)) := by
  sorry

/-- The vectors of each block are `v, T v, …, T^(d-1) v` for one cyclic vector `v`. -/
theorem rationalCanonicalBasis_succ (T : V →ₗ[K] V) (i : Fin (invariantFactors T).length)
    (j : ℕ) (hj : j + 1 < ((invariantFactors T).get i).natDegree) :
    rationalCanonicalBasis T ⟨i, ⟨j + 1, hj⟩⟩ = T (rationalCanonicalBasis T ⟨i, ⟨j, by omega⟩⟩) := by
  sorry

/-- The matrix form: every square matrix is similar to the block diagonal of the companion blocks of
its invariant factors. -/
theorem Matrix.exists_conj_rationalCanonicalForm {n : ℕ} (A : Matrix (Fin n) (Fin n) K) :
    ∃ (P : GL (Fin n) K) (e : Fin n ≃ Σ i : Fin (invariantFactors (Matrix.toLin' A)).length,
        Fin ((invariantFactors (Matrix.toLin' A)).get i).natDegree),
      ((P⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) * A * (P : Matrix (Fin n) (Fin n) K) =
        (Matrix.blockDiagonal' fun i =>
          Algebra.leftMulMatrix
            (AdjoinRoot.powerBasis' ((InvariantFactors.monic _ _ (List.get_mem _ i)).1)).basis
            (AdjoinRoot.root ((invariantFactors (Matrix.toLin' A)).get i))).submatrix e e := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.rationalCanonicalBasis_companion_convention`: the
companion block of `X² + 1` is the matrix with rows `(0, -1)` and `(1, 0)`. -/
example : Algebra.leftMulMatrix (AdjoinRoot.powerBasis' (g := (X ^ 2 + 1 : ℚ[X]))
      (by monicity!)).basis (AdjoinRoot.root (X ^ 2 + 1 : ℚ[X])) =
    (!![(0 : ℚ), -1; 1, 0]).submatrix (Fin.cast (by simp)) (Fin.cast (by simp)) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.rationalCanonicalBasis_id`: for the identity of `K²` the
rational canonical form has two `1 × 1` blocks. -/
example : (invariantFactors (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ))).length = 2 ∧
    ∀ i, ((invariantFactors (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ))).get i).natDegree = 1 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.rationalCanonicalBasis_block_charpoly`: each block has the
invariant factor as characteristic polynomial (Mathlib's `charpoly_leftMulMatrix`). -/
example (T : V →ₗ[K] V) (i : Fin (invariantFactors T).length) :
    (Algebra.leftMulMatrix
        (AdjoinRoot.powerBasis' ((InvariantFactors.monic T _ (List.get_mem _ i)).1)).basis
        (AdjoinRoot.root ((invariantFactors T).get i))).charpoly = (invariantFactors T).get i := by
  sorry

/-- **Rational canonical form classifies similarity** (CA.3/similarity-by-invariant-factors). -/
theorem Matrix.isConj_iff_invariantFactors_eq {n : ℕ} (A B : Matrix (Fin n) (Fin n) K) :
    (∃ P : GL (Fin n) K,
        ((P⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) * A * (P : Matrix (Fin n) (Fin n) K) = B) ↔
      invariantFactors (Matrix.toLin' A) = invariantFactors (Matrix.toLin' B) := by
  sorry

end RationalCanonicalForm

/-! ### Integer-valued polynomials -/

section IntegerValued

/-- **The ring `Int(D)` of integer-valued polynomials** (CA.3/integer-valued-polynomials): the
polynomials over the fraction field `K` of `D` that map `D` into `D`, as a `D`-subalgebra of
`K[X]`. -/
def intValuedPolynomials (D K : Type*) [CommRing D] [IsDomain D] [Field K] [Algebra D K]
    [IsFractionRing D K] : Subalgebra D K[X] where
  carrier := {f | ∀ a : D, f.eval (algebraMap D K a) ∈ (algebraMap D K).range}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  algebraMap_mem' := sorry

namespace IntValuedPolynomials

variable {D K : Type*} [CommRing D] [IsDomain D] [Field K] [Algebra D K] [IsFractionRing D K]

/-- Membership. -/
theorem mem_iff {f : K[X]} :
    f ∈ intValuedPolynomials D K ↔ ∀ a : D, f.eval (algebraMap D K a) ∈ (algebraMap D K).range :=
  Iff.rfl

/-- Polynomials with coefficients in `D` are integer-valued. -/
theorem map_mem (f : D[X]) : f.map (algebraMap D K) ∈ intValuedPolynomials D K := by
  sorry

/-- A constant is integer-valued exactly when it lies in `D`. -/
theorem C_mem_iff (c : K) : C c ∈ intValuedPolynomials D K ↔ c ∈ (algebraMap D K).range := by
  sorry

/-- `Int(D)` is closed under composition. -/
theorem comp_mem {f g : K[X]} (hf : f ∈ intValuedPolynomials D K)
    (hg : g ∈ intValuedPolynomials D K) : f.comp g ∈ intValuedPolynomials D K := by
  sorry

/-- The binomial polynomials are integer-valued on `ℤ`. -/
theorem ringChoose_X_mem (n : ℕ) : Ring.choose (X : ℚ[X]) n ∈ intValuedPolynomials ℤ ℚ := by
  sorry

/-- Over a field, every polynomial is integer-valued. -/
theorem eq_top_of_field : intValuedPolynomials K K = ⊤ := by
  sorry

end IntValuedPolynomials

/-- Unit test `TauCeti.ClassicalArithmetic.intValuedPolynomials_half_choose_two`: `X(X-1)/2` is
integer-valued but not in `ℤ[X]`. -/
example : (C (1 / 2 : ℚ) * X * (X - 1)) ∈ intValuedPolynomials ℤ ℚ ∧
    ∀ f : ℤ[X], f.map (Int.castRingHom ℚ) ≠ C (1 / 2 : ℚ) * X * (X - 1) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.intValuedPolynomials_not_half_X`. -/
example : C (1 / 2 : ℚ) * X ∉ intValuedPolynomials ℤ ℚ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.intValuedPolynomials_fermat_three`: `(X³ - X)/3` is
integer-valued, by Fermat's little theorem. -/
example : C (1 / 3 : ℚ) * (X ^ 3 - X) ∈ intValuedPolynomials ℤ ℚ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.intValuedPolynomials_constant`: the constant `1/2` is not
integer-valued. -/
example : C (1 / 2 : ℚ) ∉ intValuedPolynomials ℤ ℚ := by
  sorry

/-- **Pólya's theorem** (CA.3/polya-binomial-basis): the binomial polynomials form a `ℤ`-basis of
`Int(ℤ)`. -/
theorem exists_basis_intValuedPolynomials_int :
    ∃ b : Module.Basis ℕ ℤ (intValuedPolynomials ℤ ℚ), ∀ n, (b n : ℚ[X]) = Ring.choose X n := by
  sorry

/-- **Values at consecutive integers** (CA.3/integer-valued-iff-consecutive-values). -/
theorem mem_intValuedPolynomials_int_iff {f : ℚ[X]} {n : ℕ} (hf : f.natDegree ≤ n) (a : ℤ) :
    f ∈ intValuedPolynomials ℤ ℚ ↔
      ∀ k ≤ n, f.eval ((a + k : ℤ) : ℚ) ∈ (Int.castRingHom ℚ).range := by
  sorry

/-- **`Int(ℤ)` is not Noetherian** (CA.3/integer-valued-polynomials-not-noetherian). -/
theorem not_isNoetherianRing_intValuedPolynomials_int :
    ¬ IsNoetherianRing (intValuedPolynomials ℤ ℚ) := by
  sorry

/-- **The binomial polynomials are irreducible in `Int(ℤ)`**
(CA.3/binomial-polynomial-irreducible). -/
theorem irreducible_ringChoose_X {n : ℕ} (hn : 1 ≤ n) :
    Irreducible (⟨Ring.choose (X : ℚ[X]) n, IntValuedPolynomials.ringChoose_X_mem n⟩ :
      intValuedPolynomials ℤ ℚ) := by
  sorry

/-- **The characteristic ideals of `Int(D)`** (CA.3/characteristic-ideals-of-int): the leading
coefficients of the degree-`n` integer-valued polynomials, together with `0`, as a `D`-submodule
of `K`. -/
def characteristicIdeal (D K : Type*) [CommRing D] [IsDomain D] [Field K] [Algebra D K]
    [IsFractionRing D K] (n : ℕ) : Submodule D K where
  carrier := {c | c = 0 ∨ ∃ f ∈ intValuedPolynomials D K, f.natDegree = n ∧ f.leadingCoeff = c}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

namespace CharacteristicIdeal

variable {D K : Type*} [CommRing D] [IsDomain D] [Field K] [Algebra D K] [IsFractionRing D K]

/-- Membership. -/
theorem mem_iff (n : ℕ) (c : K) : c ∈ characteristicIdeal D K n ↔
    c = 0 ∨ ∃ f ∈ intValuedPolynomials D K, f.natDegree = n ∧ f.leadingCoeff = c :=
  Iff.rfl

/-- The characteristic ideals increase with `n` (multiply by `X`). -/
theorem mono (n : ℕ) : characteristicIdeal D K n ≤ characteristicIdeal D K (n + 1) := by
  sorry

/-- They contain `1` (the monomial `Xⁿ` is integer-valued). -/
theorem one_mem (n : ℕ) : (1 : K) ∈ characteristicIdeal D K n := by
  sorry

/-- The degree-zero ideal is `D`. -/
theorem zero_eq : characteristicIdeal D K 0 = (Algebra.linearMap D K).range := by
  sorry

end CharacteristicIdeal

/-- Unit test `TauCeti.ClassicalArithmetic.characteristicIdeal_int`: over `ℤ` the `n`-th
characteristic ideal is `(1/n!) ℤ`. -/
example (n : ℕ) : characteristicIdeal ℤ ℚ n = Submodule.span ℤ {((n.factorial : ℚ))⁻¹} := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.characteristicIdeal_field`: over a field every
characteristic ideal is the whole field. -/
example (n : ℕ) : characteristicIdeal ℚ ℚ n = ⊤ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.characteristicIdeal_int_not_integral`: `1/2` is a
leading coefficient of an integer-valued quadratic, so the ideal is not `ℤ`. -/
example : (1 / 2 : ℚ) ∈ characteristicIdeal ℤ ℚ 2 ∧ (1 / 2 : ℚ) ∉ characteristicIdeal ℤ ℚ 1 := by
  sorry

/-- **Regular bases and characteristic ideals** (CA.3/regular-basis-iff-characteristic-ideals-principal):
`Int(D)` has a `D`-basis with exactly one polynomial of each degree if and only if every
characteristic ideal is principal. -/
theorem exists_regular_basis_iff (D K : Type*) [CommRing D] [IsDomain D] [Field K] [Algebra D K]
    [IsFractionRing D K] :
    (∃ b : Module.Basis ℕ D (intValuedPolynomials D K), ∀ n, (b n : K[X]).natDegree = n) ↔
      ∀ n, (characteristicIdeal D K n).IsPrincipal := by
  sorry

end IntegerValued

/-! ### Irreducibility criteria -/

section Capelli

variable {K : Type*} [Field K]

/-- **The two-power case of Capelli's theorem** (CA.3/capelli-two-power-case). -/
theorem X_pow_two_pow_sub_C_irreducible {a : K} (h2 : ∀ b : K, b ^ 2 ≠ a)
    (h4 : ∀ b : K, -4 * b ^ 4 ≠ a) (k : ℕ) : Irreducible (X ^ (2 ^ k) - C a) := by
  sorry

/-- **Capelli's theorem** (CA.3/capelli-theorem). -/
theorem X_pow_sub_C_irreducible_iff_capelli {n : ℕ} (hn : n ≠ 0) {a : K} :
    Irreducible (X ^ n - C a) ↔
      (∀ p : ℕ, p.Prime → p ∣ n → ∀ b : K, b ^ p ≠ a) ∧ (4 ∣ n → ∀ b : K, -4 * b ^ 4 ≠ a) := by
  sorry

end Capelli

section Perron

/-- **Analytic order of a polynomial** (CA.3/analytic-order-of-a-polynomial). -/
theorem analyticOrderNatAt_eval_eq_rootMultiplicity {p : ℂ[X]} (hp : p ≠ 0) (z : ℂ) :
    analyticOrderNatAt (fun w => p.eval w) z = p.rootMultiplicity z := by
  sorry

/-- **Perron's root location** (CA.3/perron-root-location): exactly one root, with multiplicity,
lies outside the open unit disc. -/
theorem perron_card_roots_one_le_norm {f : ℂ[X]} (hmon : f.Monic) (h2 : 2 ≤ f.natDegree)
    (h0 : f.coeff 0 ≠ 0)
    (hP : 1 + ∑ i ∈ Finset.range (f.natDegree - 1), ‖f.coeff i‖ < ‖f.coeff (f.natDegree - 1)‖) :
    (f.roots.filter fun z => 1 ≤ ‖z‖).card = 1 := by
  sorry

/-- **Perron's criterion** (CA.3/perron-criterion). -/
theorem perron_irreducible {f : ℤ[X]} (hmon : f.Monic) (h2 : 2 ≤ f.natDegree) (h0 : f.coeff 0 ≠ 0)
    (hP : 1 + ∑ i ∈ Finset.range (f.natDegree - 1), |f.coeff i| < |f.coeff (f.natDegree - 1)|) :
    Irreducible f := by
  sorry

end Perron

section Cohn

/-- **The Pólya–Szegő prime-value criterion** (CA.3/polya-szego-prime-value-criterion). -/
theorem irreducible_of_prime_eval_of_re_lt {f : ℤ[X]} {b : ℤ} (hp : Prime (f.eval b))
    (hb : f.eval (b - 1) ≠ 0)
    (hroots : ∀ z ∈ (f.map (Int.castRingHom ℂ)).roots, z.re < (b : ℝ) - 1 / 2) :
    Irreducible f := by
  sorry

/-- **Root location of a digit polynomial** (CA.3/digit-polynomial-root-location). -/
theorem digitPolynomial_roots_re_lt {b : ℕ} (hb : 2 ≤ b) {f : ℤ[X]} (hf : f ≠ 0)
    (hcoeff : ∀ i, 0 ≤ f.coeff i ∧ f.coeff i ≤ (b : ℤ) - 1) :
    ∀ z ∈ (f.map (Int.castRingHom ℂ)).roots, z.re < (b : ℝ) - 1 / 2 := by
  sorry

/-- **Cohn's irreducibility criterion** (CA.3/cohn-irreducibility-criterion), in every base
`b ≥ 2`: the polynomial whose coefficients are the base-`b` digits of a prime is irreducible. -/
theorem cohn_irreducible {b p : ℕ} (hb : 2 ≤ b) (hp : p.Prime) :
    Irreducible ((Nat.digits b p).mapIdx (fun i a => C (a : ℤ) * X ^ i)).sum := by
  sorry

end Cohn

section NewtonPolygon

variable {K : Type*} [Field K] (v : AddValuation K (WithTop ℝ))

/-- **The sloped valuation** (CA.3/sloped-valuation): `v_r(f) = min_i (v(aᵢ) + r i)`, and `⊤` for
`f = 0`. -/
def slopedValuation (r : ℝ) (f : K[X]) : WithTop ℝ :=
  f.support.inf fun i => v (f.coeff i) + ((r * i : ℝ) : WithTop ℝ)

namespace SlopedValuation

/-- The zero polynomial. -/
theorem zero (r : ℝ) : slopedValuation v r 0 = ⊤ := by
  sorry

/-- A monomial. -/
theorem C_mul_X_pow (r : ℝ) (c : K) (n : ℕ) (hc : c ≠ 0) :
    slopedValuation v r (C c * X ^ n) = v c + ((r * n : ℝ) : WithTop ℝ) := by
  sorry

/-- Every term bounds the sloped valuation from above. -/
theorem le_coeff (r : ℝ) (f : K[X]) (i : ℕ) :
    slopedValuation v r f ≤ v (f.coeff i) + ((r * i : ℝ) : WithTop ℝ) := by
  sorry

/-- The ultrametric inequality. -/
theorem min_le_add (r : ℝ) (f g : K[X]) :
    min (slopedValuation v r f) (slopedValuation v r g) ≤ slopedValuation v r (f + g) := by
  sorry

/-- For `r = 0` it is the Gauss valuation `min_i v(aᵢ)`. -/
theorem zero_slope (f : K[X]) : slopedValuation v 0 f = f.support.inf fun i => v (f.coeff i) := by
  sorry

end SlopedValuation

/-- Unit test `TauCeti.ClassicalArithmetic.slopedValuation_X`. -/
example (r : ℝ) : slopedValuation v r X = ((r : ℝ) : WithTop ℝ) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.slopedValuation_X_sub_C`: for `X - c` the minimum is
attained at both ends exactly when `r = v c`. -/
example (c : K) (hc : c ≠ 0) (r : ℝ) :
    slopedValuation v r (X - C c) = min (v c) ((r : ℝ) : WithTop ℝ) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.slopedValuation_zero_poly`. -/
example (r : ℝ) : slopedValuation v r (0 : K[X]) = ⊤ := by
  sorry

/-- **Gauss's lemma for sloped valuations** (CA.3/sloped-valuation-mul). -/
theorem slopedValuation_mul (r : ℝ) (f g : K[X]) :
    slopedValuation v r (f * g) = slopedValuation v r f + slopedValuation v r g := by
  sorry

/-- **The Newton polygon, by slope multiplicities** (CA.3/newton-slope-multiplicity): the width of
the edge of slope `r`, the distance between the least and the greatest index attaining
`slopedValuation v r f`. -/
def newtonSlopeMultiplicity (r : ℝ) (f : K[X]) : ℕ :=
  if h : (f.support.filter fun i =>
      v (f.coeff i) + ((r * i : ℝ) : WithTop ℝ) = slopedValuation v r f).Nonempty then
    (f.support.filter fun i =>
      v (f.coeff i) + ((r * i : ℝ) : WithTop ℝ) = slopedValuation v r f).max' h -
    (f.support.filter fun i =>
      v (f.coeff i) + ((r * i : ℝ) : WithTop ℝ) = slopedValuation v r f).min' h
  else 0

namespace NewtonSlopeMultiplicity

/-- A linear factor has one slope, the valuation of its root. -/
theorem X_sub_C (c : K) (hc : c ≠ 0) (r : ℝ) :
    newtonSlopeMultiplicity v r (X - C c) = if v c = ((r : ℝ) : WithTop ℝ) then 1 else 0 := by
  sorry

/-- Scaling by a nonzero constant does not change the polygon. -/
theorem C_mul (c : K) (hc : c ≠ 0) (r : ℝ) (f : K[X]) :
    newtonSlopeMultiplicity v r (C c * f) = newtonSlopeMultiplicity v r f := by
  sorry

/-- Only finitely many slopes occur, and their widths add up to `deg f - ord₀ f`. -/
theorem finite_support (f : K[X]) : {r : ℝ | newtonSlopeMultiplicity v r f ≠ 0}.Finite := by
  sorry

/-- A monomial has no slopes. -/
theorem C_mul_X_pow (c : K) (n : ℕ) (r : ℝ) : newtonSlopeMultiplicity v r (C c * X ^ n) = 0 := by
  sorry

end NewtonSlopeMultiplicity

/-- Unit test `TauCeti.ClassicalArithmetic.newtonSlopeMultiplicity_sq_sub_uniformizer`: if
`v π = 1` then `X² - π` has the single slope `1/2` with width `2`. -/
example (π : K) (hπ : v π = ((1 : ℝ) : WithTop ℝ)) :
    newtonSlopeMultiplicity v (1 / 2) (X ^ 2 - C π) = 2 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.newtonSlopeMultiplicity_orientation`: the slope is the
valuation of the root, not its negative. -/
example (π : K) (hπ : v π = ((1 : ℝ) : WithTop ℝ)) :
    newtonSlopeMultiplicity v (-1 / 2) (X ^ 2 - C π) = 0 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.newtonSlopeMultiplicity_zero_poly`. -/
example (r : ℝ) : newtonSlopeMultiplicity v r (0 : K[X]) = 0 := by
  sorry

/-- **Dumas's theorem** (CA.3/dumas-theorem). -/
theorem newtonSlopeMultiplicity_mul {f g : K[X]} (hf : f ≠ 0) (hg : g ≠ 0) (r : ℝ) :
    newtonSlopeMultiplicity v r (f * g) =
      newtonSlopeMultiplicity v r f + newtonSlopeMultiplicity v r g := by
  sorry

/-- **Slopes are valuations of roots** (CA.3/newton-slopes-of-a-split-polynomial). -/
theorem newtonSlopeMultiplicity_of_eq_prod {f : K[X]} {c : K} {s : Multiset K} (hc : c ≠ 0)
    (hs : (0 : K) ∉ s) (hf : f = C c * (s.map fun a => X - C a).prod) (r : ℝ) :
    newtonSlopeMultiplicity v r f = (s.filter fun a => v a = ((r : ℝ) : WithTop ℝ)).card := by
  sorry

/-- **The Eisenstein–Dumas criterion** (CA.3/eisenstein-dumas-criterion). -/
theorem irreducible_of_eisensteinDumas (w : AddValuation K (WithTop ℤ)) {f : K[X]}
    (hdeg : 1 ≤ f.natDegree) (h0 : f.coeff 0 ≠ 0)
    (hgcd : Int.gcd ((w (f.coeff 0)).untopD 0 - (w f.leadingCoeff).untopD 0) f.natDegree = 1)
    (hbelow : ∀ i ≤ f.natDegree, f.coeff i ≠ 0 →
      (f.natDegree : ℤ) * (w (f.coeff i)).untopD 0 ≥
        (f.natDegree - i : ℤ) * (w (f.coeff 0)).untopD 0 +
          (i : ℤ) * (w f.leadingCoeff).untopD 0) :
    Irreducible f := by
  sorry

end NewtonPolygon

end CA3

end TauCeti.ClassicalArithmetic


-- ===== CA.4 =====

/-!
## CA.4 Classical Diophantine equations

Suggested forms for the declarations of layer CA.4; the roadmap document is definitive.
What the pinned libraries already contain is imported, not restated: Mathlib's `Pell`
(solutions of x² − dy² = 1 and the fundamental solution), `Nat.eq_sq_add_sq_iff`,
`Nat.sum_four_squares`, `PythagoreanTriple`, the x⁴ + y⁴ = z² theorem (`Fermat42`),
`Int.gcd_dvd_iff` and `FrobeniusNumber`. The Jacobi triple product identity used in the
proof of the four-square theorem is supplied by `QSeriesPartitionsAndMockModularForms:QM.0`
and is not prototyped here.
-/

open scoped LinearAlgebra.Projectivization

namespace TauCeti.ClassicalArithmetic

noncomputable section CA4

open _root_.Matrix

/-! ### Integer linear systems (`CA.4/integer-linear-systems`) -/

namespace Matrix

variable {n m : ℕ}

/-- The integer solution set of `A x = b`. -/
def intSolutionSet (A : _root_.Matrix (Fin n) (Fin m) ℤ) (b : Fin n → ℤ) : Set (Fin m → ℤ) :=
  {x | A *ᵥ x = b}

/-- The integer system `A x = b` has a solution. -/
def IntSolvable (A : _root_.Matrix (Fin n) (Fin m) ℤ) (b : Fin n → ℤ) : Prop :=
  (intSolutionSet A b).Nonempty

theorem intSolutionSet_zero (A : _root_.Matrix (Fin n) (Fin m) ℤ) :
    intSolutionSet A 0 = (LinearMap.ker A.mulVecLin : Set (Fin m → ℤ)) := by sorry

/-- The divisibility criterion, for any unimodular diagonalisation `P A Q = D` with diagonal
entries `d i` (a Smith normal form in the sense of CA.3 is one choice). -/
theorem intSolvable_iff (A : _root_.Matrix (Fin n) (Fin m) ℤ) (b : Fin n → ℤ)
    (P : _root_.Matrix (Fin n) (Fin n) ℤ) (Q : _root_.Matrix (Fin m) (Fin m) ℤ)
    (hP : IsUnit P.det) (hQ : IsUnit Q.det) (d : ℕ → ℤ)
    (hD : ∀ i j, (P * A * Q) i j = if (i : ℕ) = j then d i else 0) :
    IntSolvable A b ↔ ∀ i : Fin n, if (i : ℕ) < m then d i ∣ (P *ᵥ b) i else (P *ᵥ b) i = 0 := by
  sorry

/-- The columns of `Q` at the free indices form a basis of the kernel. -/
theorem intKernel_basis (A : _root_.Matrix (Fin n) (Fin m) ℤ)
    (P : _root_.Matrix (Fin n) (Fin n) ℤ) (Q : _root_.Matrix (Fin m) (Fin m) ℤ)
    (hP : IsUnit P.det) (hQ : IsUnit Q.det) (d : ℕ → ℤ)
    (hD : ∀ i j, (P * A * Q) i j = if (i : ℕ) = j then d i else 0) :
    LinearIndependent ℤ (fun j : {j : Fin m // n ≤ (j : ℕ) ∨ d j = 0} => fun i => Q i j) ∧
      Submodule.span ℤ (Set.range fun j : {j : Fin m // n ≤ (j : ℕ) ∨ d j = 0} => fun i => Q i j) =
        LinearMap.ker A.mulVecLin := by
  sorry

theorem intSolutionSet_eq (A : _root_.Matrix (Fin n) (Fin m) ℤ) (b : Fin n → ℤ)
    {x₀ : Fin m → ℤ} (hx₀ : x₀ ∈ intSolutionSet A b) :
    intSolutionSet A b = (fun k => x₀ + k) '' (LinearMap.ker A.mulVecLin : Set (Fin m → ℤ)) := by
  sorry

/-- One equation in two unknowns: Mathlib's `Int.gcd_dvd_iff`. -/
theorem intSolvable_one_by_two_iff (a b : ℤ) (k : ℕ) :
    IntSolvable !![a, b] ![(k : ℤ)] ↔ Int.gcd a b ∣ k := by sorry

/-- Unit test `Matrix.intSolutionSet_six_ten_four`: the solutions of 6x + 10y = 4. -/
example : intSolutionSet !![6, 10] ![4] = Set.range fun t : ℤ => ![-1 + 5 * t, 1 - 3 * t] := by
  sorry

/-- Unit test `Matrix.not_intSolvable_six_ten_three`: no integer solution, but a rational one. -/
example : ¬ IntSolvable !![6, 10] ![3] ∧
    ∃ x : Fin 2 → ℚ, (!![6, 10] : _root_.Matrix (Fin 1) (Fin 2) ℚ) *ᵥ x = ![3] := by sorry

/-- Unit test `Matrix.intKernel_six_ten`: the kernel is spanned by (5, −3), not by (10, −6). -/
example : LinearMap.ker (!![6, 10] : _root_.Matrix (Fin 1) (Fin 2) ℤ).mulVecLin =
      Submodule.span ℤ {![5, -3]} ∧
    LinearMap.ker (!![6, 10] : _root_.Matrix (Fin 1) (Fin 2) ℤ).mulVecLin ≠
      Submodule.span ℤ {![10, -6]} := by sorry

/-- Unit test `Matrix.intSolutionSet_zero_matrix`: the zero matrix. -/
example (b : Fin n → ℤ) :
    intSolutionSet (0 : _root_.Matrix (Fin n) (Fin m) ℤ) b = if b = 0 then Set.univ else ∅ := by
  sorry

/-- Unit test `Matrix.intSolvable_one_by_two_compat`: agreement with `Int.gcd_dvd_iff`. -/
example (a b : ℤ) (k : ℕ) :
    IntSolvable !![a, b] ![(k : ℤ)] ↔ ∃ x y : ℤ, (k : ℤ) = a * x + b * y := by sorry

end Matrix

/-! ### Quartic descent (`CA.4/fermat-right-triangle-*`, `CA.4/quartic-descent-…`) -/

/-- CA.4/fermat-right-triangle-descent-step. -/
theorem fermat_right_triangle_descent_step {x y z : ℤ} (hx : 0 < x) (hy : 0 < y) (hz : 0 < z)
    (hxy : Int.gcd x y = 1) (hxz : Int.gcd x z = 1) (hyz : Int.gcd y z = 1) (hodd : Odd z)
    (h : x ^ 4 - y ^ 4 = z ^ 2) :
    ∃ x' y' z' : ℤ, 0 < x' ∧ 0 < y' ∧ 0 < z' ∧ Int.gcd x' y' = 1 ∧ Int.gcd x' z' = 1 ∧
      Int.gcd y' z' = 1 ∧ Odd z' ∧ x' ^ 4 - y' ^ 4 = z' ^ 2 ∧ x' < x := by sorry

/-- CA.4/fermat-right-triangle-theorem: x⁴ − y⁴ = z² has no solution in positive integers. -/
theorem fermat_right_triangle {x y z : ℤ} (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) :
    x ^ 4 - y ^ 4 ≠ z ^ 2 := by sorry

/-- CA.4/quartic-descent-t4-plus-v4-equals-2u2 (Bennett–Siksek, §6, p. 372). -/
theorem quartic_descent_eq_two_mul_sq {T V U : ℕ} (hT : 0 < T) (hV : 0 < V) (hU : 0 < U)
    (hgcd : Nat.gcd (Nat.gcd T V) U = 1) (h : T ^ 4 + V ^ 4 = 2 * U ^ 2) :
    T = 1 ∧ V = 1 ∧ U = 1 := by sorry

/-! ### The Markoff equation (`CA.4/markoff-*`) -/

/-- The Markoff surface `X(R)`: x₀² + x₁² + x₂² = 3x₀x₁x₂. -/
def markoffSet (R : Type*) [CommRing R] : Set (Fin 3 → R) :=
  {x | x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 = 3 * x 0 * x 1 * x 2}

/-- Its nonzero locus `X*(R)`. -/
def markoffSetNonzero (R : Type*) [CommRing R] : Set (Fin 3 → R) :=
  markoffSet R \ {0}

section MarkoffSetAPI

variable {R S : Type*} [CommRing R] [CommRing S]

theorem markoffSet.mem_iff (x : Fin 3 → R) :
    x ∈ markoffSet R ↔ x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 = 3 * x 0 * x 1 * x 2 := by sorry

theorem markoffSetNonzero.mem_iff (x : Fin 3 → R) :
    x ∈ markoffSetNonzero R ↔ x ∈ markoffSet R ∧ x ≠ 0 := by sorry

theorem markoffSet.zero_mem : (0 : Fin 3 → R) ∈ markoffSet R := by sorry

theorem markoffSet.ones_mem : (fun _ => (1 : R)) ∈ markoffSet R := by sorry

theorem markoffSet.map_mem (f : R →+* S) {x : Fin 3 → R} (hx : x ∈ markoffSet R) :
    f ∘ x ∈ markoffSet S := by sorry

theorem markoffSet.comp_perm_mem_iff (σ : Equiv.Perm (Fin 3)) (x : Fin 3 → R) :
    x ∘ σ.symm ∈ markoffSet R ↔ x ∈ markoffSet R := by sorry

end MarkoffSetAPI

/-- Unit test `markoffSet_int_examples`. -/
example : (![1, 1, 1] : Fin 3 → ℤ) ∈ markoffSet ℤ ∧ (![1, 1, 2] : Fin 3 → ℤ) ∈ markoffSet ℤ ∧
    (![1, 2, 5] : Fin 3 → ℤ) ∈ markoffSet ℤ ∧ (![2, 5, 29] : Fin 3 → ℤ) ∈ markoffSet ℤ := by
  sorry

/-- Unit test `markoffSet_three_three_three`: the coefficient is 3, not 1. -/
example : (![3, 3, 3] : Fin 3 → ℤ) ∉ markoffSet ℤ ∧ (3 : ℤ) ^ 2 + 3 ^ 2 + 3 ^ 2 = 3 * 3 * 3 := by
  sorry

/-- Unit test `zero_not_mem_markoffSetNonzero`. -/
example (R : Type*) [CommRing R] :
    (0 : Fin 3 → R) ∈ markoffSet R ∧ (0 : Fin 3 → R) ∉ markoffSetNonzero R := by sorry

/-- Unit test `markoffSetNonzero_zmod_five`: a nonzero triple with a zero coordinate. -/
example : (![0, 1, 2] : Fin 3 → ZMod 5) ∈ markoffSetNonzero (ZMod 5) := by sorry

/-- Unit test `card_markoffSetNonzero_zmod_three`. -/
example : (markoffSetNonzero (ZMod 3)).ncard = 8 := by sorry

/-- Unit test `card_markoffSetNonzero_zmod_two`. -/
example : (markoffSetNonzero (ZMod 2)).ncard = 4 := by sorry

/-- The positive Markoff triples `M`. -/
def positiveMarkoffTriples : Set (Fin 3 → ℤ) :=
  {x | x ∈ markoffSet ℤ ∧ ∀ i, 0 < x i}

theorem positiveMarkoffTriples.mem_iff (x : Fin 3 → ℤ) :
    x ∈ positiveMarkoffTriples ↔ x ∈ markoffSet ℤ ∧ ∀ i, 0 < x i := by sorry

theorem positiveMarkoffTriples.subset_markoffSet :
    positiveMarkoffTriples ⊆ markoffSetNonzero ℤ := by sorry

theorem positiveMarkoffTriples.comp_perm_mem_iff (σ : Equiv.Perm (Fin 3)) (x : Fin 3 → ℤ) :
    x ∘ σ.symm ∈ positiveMarkoffTriples ↔ x ∈ positiveMarkoffTriples := by sorry

theorem positiveMarkoffTriples.mem_iff_nat (x : Fin 3 → ℤ) :
    x ∈ positiveMarkoffTriples ↔ ∃ a b c : ℕ, 0 < a ∧ 0 < b ∧ 0 < c ∧
      a ^ 2 + b ^ 2 + c ^ 2 = 3 * a * b * c ∧ x = ![(a : ℤ), b, c] := by sorry

/-- Unit test `positiveMarkoffTriples_examples`. -/
example : (![1, 1, 1] : Fin 3 → ℤ) ∈ positiveMarkoffTriples ∧
    (![1, 1, 2] : Fin 3 → ℤ) ∈ positiveMarkoffTriples ∧
    (![1, 2, 5] : Fin 3 → ℤ) ∈ positiveMarkoffTriples ∧
    (![2, 5, 29] : Fin 3 → ℤ) ∈ positiveMarkoffTriples ∧
    (![5, 13, 194] : Fin 3 → ℤ) ∈ positiveMarkoffTriples := by sorry

/-- Unit test `neg_neg_one_not_mem_positiveMarkoffTriples`: a signed solution is not in `M`. -/
example : (![-1, -1, 1] : Fin 3 → ℤ) ∈ markoffSet ℤ ∧
    (![-1, -1, 1] : Fin 3 → ℤ) ∉ positiveMarkoffTriples := by sorry

/-- Unit test `zero_not_mem_positiveMarkoffTriples`. -/
example : (0 : Fin 3 → ℤ) ∉ positiveMarkoffTriples := by sorry

/-- Unit test `one_one_three_not_mem_positiveMarkoffTriples`. -/
example : (![1, 1, 3] : Fin 3 → ℤ) ∉ positiveMarkoffTriples := by sorry

/-- The Vieta move `R_i`: replace `x i` by `3 x(i+1) x(i+2) − x i`. -/
def markoffVieta {R : Type*} [CommRing R] (i : Fin 3) (x : Fin 3 → R) : Fin 3 → R :=
  Function.update x i (3 * x (i + 1) * x (i + 2) - x i)

section MarkoffVietaAPI

variable {R S : Type*} [CommRing R] [CommRing S]

theorem markoffVieta_apply_self (i : Fin 3) (x : Fin 3 → R) :
    markoffVieta i x i = 3 * x (i + 1) * x (i + 2) - x i := by sorry

theorem markoffVieta_apply_of_ne {i j : Fin 3} (h : j ≠ i) (x : Fin 3 → R) :
    markoffVieta i x j = x j := by sorry

theorem markoffVieta_add_self (i : Fin 3) (x : Fin 3 → R) :
    markoffVieta i x i + x i = 3 * x (i + 1) * x (i + 2) := by sorry

theorem markoffVieta_zero (i : Fin 3) : markoffVieta i (0 : Fin 3 → R) = 0 := by sorry

theorem markoffVieta_map (f : R →+* S) (i : Fin 3) (x : Fin 3 → R) :
    f ∘ markoffVieta i x = markoffVieta i (f ∘ x) := by sorry

end MarkoffVietaAPI

/-- The integer Markoff graph on `M`: `x ~ y` iff `x ≠ y` and `y = R_i x` for some `i`. -/
def markoffGraph : SimpleGraph positiveMarkoffTriples :=
  SimpleGraph.fromRel fun x y => ∃ i, markoffVieta i x.1 = y.1

theorem markoffGraph_adj_iff (x y : positiveMarkoffTriples) :
    markoffGraph.Adj x y ↔ x ≠ y ∧ ∃ i, markoffVieta i x.1 = y.1 := by sorry

/-- Unit test `markoffVieta_two_ones`. -/
example : markoffVieta 2 (![1, 1, 1] : Fin 3 → ℤ) = ![1, 1, 2] ∧
    markoffVieta 0 (![1, 1, 1] : Fin 3 → ℤ) = ![2, 1, 1] := by sorry

/-- Unit test `markoffVieta_two_one_two_five`: the move is not a sign change. -/
example : markoffVieta 2 (![1, 2, 5] : Fin 3 → ℤ) = ![1, 2, 1] ∧
    markoffVieta 2 (![1, 2, 5] : Fin 3 → ℤ) ≠ ![1, 2, -5] := by sorry

/-- Unit test `markoffVieta_zero_eq`. -/
example : ∀ i : Fin 3, markoffVieta i (0 : Fin 3 → ℤ) = 0 := by sorry

/-- Unit test `markoffVieta_zmod_three`: over 𝔽₃ the move is a sign change. -/
example : markoffVieta 2 (![1, 1, 1] : Fin 3 → ZMod 3) = ![1, 1, -1] := by sorry

/-- Unit test `markoffVieta_cast_compat`: the move commutes with reduction modulo 7. -/
example : (Int.castRingHom (ZMod 7)) ∘ markoffVieta 2 (![2, 5, 29] : Fin 3 → ℤ) =
      markoffVieta 2 ((Int.castRingHom (ZMod 7)) ∘ (![2, 5, 29] : Fin 3 → ℤ)) ∧
    markoffVieta 2 (![2, 5, 29] : Fin 3 → ℤ) = ![2, 5, 1] := by sorry

/-- CA.4/markoff-vieta-involutive. -/
theorem markoffVieta_markoffVieta {R : Type*} [CommRing R] (i : Fin 3) (x : Fin 3 → R) :
    markoffVieta i (markoffVieta i x) = x := by sorry

/-- CA.4/markoff-vieta-preserves-equation. -/
theorem markoffVieta_mem_markoffSet_iff {R : Type*} [CommRing R] (i : Fin 3) (x : Fin 3 → R) :
    markoffVieta i x ∈ markoffSet R ↔ x ∈ markoffSet R := by sorry

/-- CA.4/markoff-vieta-permutes-nonzero-locus. -/
theorem markoffVieta_bijOn_nonzero {R : Type*} [CommRing R] (i : Fin 3) :
    Set.BijOn (markoffVieta i) (markoffSetNonzero R) (markoffSetNonzero R) := by sorry

/-- CA.4/markoff-permutation-equivariance: `P_σ ∘ R_i = R_{σ i} ∘ P_σ` with `P_σ x = x ∘ σ⁻¹`. -/
theorem markoffVieta_comp_perm {R : Type*} [CommRing R] (σ : Equiv.Perm (Fin 3)) (i : Fin 3)
    (x : Fin 3 → R) : markoffVieta (σ i) (x ∘ σ.symm) = markoffVieta i x ∘ σ.symm := by sorry

/-- CA.4/markoff-vieta-preserves-positivity. -/
theorem markoffVieta_mem_positiveMarkoffTriples {x : Fin 3 → ℤ} (hx : x ∈ positiveMarkoffTriples)
    (i : Fin 3) : markoffVieta i x ∈ positiveMarkoffTriples ∧
      markoffVieta i x i * x i = x (i + 1) ^ 2 + x (i + 2) ^ 2 := by sorry

/-- CA.4/markoff-descent-inequality. -/
theorem markoff_descent {a b c : ℤ} (ha : 1 ≤ a) (hab : a ≤ b) (hbc : b ≤ c)
    (h : a ^ 2 + b ^ 2 + c ^ 2 = 3 * a * b * c) (hne : ¬ (a = 1 ∧ b = 1 ∧ c = 1)) :
    0 < 3 * a * b - c ∧ 3 * a * b - c ≤ b ∧ 3 * a * b - c < c ∧ b < c ∧
      c < 3 * b * c - a ∧ c < 3 * a * c - b := by sorry

/-- CA.4/markoff-root-generation (Markoff's theorem). -/
theorem markoff_root_generation {x : Fin 3 → ℤ} (hx : x ∈ positiveMarkoffTriples) :
    ∃ w : List (Fin 3), w.foldr markoffVieta ![1, 1, 1] = x := by sorry

/-- CA.4/markoff-tree: the positive Markoff graph is a tree. -/
theorem markoffGraph_isTree : markoffGraph.IsTree := by sorry

/-- CA.4/markoff-triple-coordinates-coprime (Frobenius). -/
theorem markoff_triple_coprime {x : Fin 3 → ℤ} (hx : x ∈ positiveMarkoffTriples) :
    Int.gcd (x 0) (x 1) = 1 ∧ Int.gcd (x 1) (x 2) = 1 ∧ Int.gcd (x 0) (x 2) = 1 := by sorry

/-- Reduction of triples modulo `p`. -/
def markoffReduce (p : ℕ) (x : Fin 3 → ℤ) : Fin 3 → ZMod p :=
  fun i => (x i : ZMod p)

section MarkoffReduceAPI

theorem markoffReduce_apply (p : ℕ) (x : Fin 3 → ℤ) (i : Fin 3) :
    markoffReduce p x i = (x i : ZMod p) := by sorry

theorem markoffReduce_mem_markoffSet (p : ℕ) {x : Fin 3 → ℤ} (hx : x ∈ markoffSet ℤ) :
    markoffReduce p x ∈ markoffSet (ZMod p) := by sorry

theorem markoffReduce_markoffVieta (p : ℕ) (i : Fin 3) (x : Fin 3 → ℤ) :
    markoffReduce p (markoffVieta i x) = markoffVieta i (markoffReduce p x) := by sorry

theorem markoffReduce_comp_perm (p : ℕ) (σ : Equiv.Perm (Fin 3)) (x : Fin 3 → ℤ) :
    markoffReduce p (x ∘ σ.symm) = markoffReduce p x ∘ σ.symm := by sorry

theorem markoffReduce_ones (p : ℕ) : markoffReduce p (fun _ => 1) = fun _ => 1 := by sorry

theorem markoffReduce_mem_markoffSetNonzero {p : ℕ} (hp : p.Prime) {x : Fin 3 → ℤ}
    (hx : x ∈ positiveMarkoffTriples) : markoffReduce p x ∈ markoffSetNonzero (ZMod p) := by
  sorry

end MarkoffReduceAPI

/-- Unit test `markoffReduce_two_five_twentynine_two`. -/
example : markoffReduce 2 ![2, 5, 29] = ![0, 1, 1] := by sorry

/-- Unit test `markoffReduce_one_two_five_five`. -/
example : markoffReduce 5 ![1, 2, 5] = ![1, 2, 0] ∧
    (![1, 2, 0] : Fin 3 → ZMod 5) ∈ markoffSetNonzero (ZMod 5) := by sorry

/-- Unit test `markoffReduce_three_eq_neg_ones`. -/
example : markoffReduce 3 ![2, 5, 29] = ![-1, -1, -1] := by sorry

/-- Unit test `markoffReduce_one_trivial`: modulo 1 every reduction is zero. -/
example (x : Fin 3 → ℤ) : markoffReduce 1 x = 0 := by sorry

/-- Unit test `markoffReduce_vieta_compat`. -/
example : markoffReduce 7 (markoffVieta 1 ![2, 1, 1]) = markoffVieta 1 (markoffReduce 7 ![2, 1, 1]) ∧
    markoffVieta 1 (markoffReduce 7 ![2, 1, 1]) = ![2, 5, 1] := by sorry

/-- Strong approximation at `p`: reduction `M → X*(𝔽_p)` is onto. Only the definition belongs
to CA.4; the theorems about it belong to the ArithmeticDynamics Part II on Markoff actions. -/
def MarkoffStrongApproximation (p : ℕ) : Prop :=
  Set.SurjOn (markoffReduce p) positiveMarkoffTriples (markoffSetNonzero (ZMod p))

theorem markoffStrongApproximation_iff (p : ℕ) :
    MarkoffStrongApproximation p ↔
      ∀ y ∈ markoffSetNonzero (ZMod p), ∃ x ∈ positiveMarkoffTriples, markoffReduce p x = y := by
  sorry

theorem markoffStrongApproximation_iff_orbit {p : ℕ} (hp : p.Prime) :
    MarkoffStrongApproximation p ↔
      ∀ y ∈ markoffSetNonzero (ZMod p), ∃ w : List (Fin 3), w.foldr markoffVieta (fun _ => 1) = y := by
  sorry

theorem not_surjOn_markoffReduce_markoffSet (p : ℕ) [Fact p.Prime] :
    ¬ Set.SurjOn (markoffReduce p) positiveMarkoffTriples (markoffSet (ZMod p)) := by sorry

/-- Unit test `markoffStrongApproximation_two`. -/
example : MarkoffStrongApproximation 2 := by sorry

/-- Unit test `markoffStrongApproximation_three`. -/
example : MarkoffStrongApproximation 3 := by sorry

/-- Unit test `not_surjOn_markoffSet_zmod_five`: the origin has no preimage. -/
example : ¬ Set.SurjOn (markoffReduce 5) positiveMarkoffTriples (markoffSet (ZMod 5)) := by sorry

/-- Unit test `markoffStrongApproximation_iff_compat`: the definition is `Set.SurjOn`. -/
example (p : ℕ) : MarkoffStrongApproximation p ↔
    Set.SurjOn (markoffReduce p) positiveMarkoffTriples (markoffSetNonzero (ZMod p)) := by sorry

/-! ### Legendre's three-square theorem (`CA.4/three-squares-*`, Ankeny's proof) -/

/-- CA.4/three-squares-necessary-condition. -/
theorem not_sum_three_sq_of_eq {n a b : ℕ} (h : n = 4 ^ a * (8 * b + 7)) :
    ¬ ∃ x y z : ℤ, x ^ 2 + y ^ 2 + z ^ 2 = n := by sorry

/-- CA.4/three-squares-squarefree-reduction. -/
theorem exists_three_sq_reduction {n : ℕ} (hn : 0 < n) (h : ¬ ∃ a b : ℕ, n = 4 ^ a * (8 * b + 7)) :
    ∃ a k m : ℕ, n = 4 ^ a * k ^ 2 * m ∧ Odd k ∧ Squarefree m ∧
      m % 8 ∈ ({1, 2, 3, 5, 6} : Finset ℕ) := by sorry

/-- CA.4/three-squares-auxiliary-prime (Ankeny, §1 (1)–(3) and §2). -/
theorem exists_ankeny_prime {m : ℕ} (hm0 : 0 < m) (hsq : Squarefree m)
    (hm : m % 8 ∈ ({1, 2, 3, 5, 6} : Finset ℕ)) :
    ∃ q : ℕ, q.Prime ∧ q % 4 = 1 ∧ ¬ q ∣ m ∧ jacobiSym (-m) q = 1 ∧
      (m % 8 = 3 → ∀ p ∈ m.primeFactors, jacobiSym (-2 * q) p = 1) ∧
      (m % 8 ≠ 3 → (∀ p ∈ m.primeFactors, p ≠ 2 → jacobiSym (-q) p = 1) ∧
        (Even m → jacobiSym (-2) q = (-1) ^ ((m / 2 - 1) / 2))) := by sorry

/-- CA.4/three-squares-lattice-point, case m ≡ 3 (mod 8) (Ankeny §1 (4)–(12)). -/
theorem ankeny_lattice_point_three {m q : ℕ} (hm0 : 0 < m) (hsq : Squarefree m) (hm : m % 8 = 3)
    (hq : q.Prime) (hq4 : q % 4 = 1) (hqm : ¬ q ∣ m)
    (hcond : ∀ p ∈ m.primeFactors, jacobiSym (-2 * q) p = 1) :
    ∃ b h R x y : ℤ, Odd b ∧ b ^ 2 - 4 * q * h = -m ∧
      R ^ 2 + 2 * (q * x ^ 2 + b * x * y + h * y ^ 2) = m ∧
      4 * q * (q * x ^ 2 + b * x * y + h * y ^ 2) = (2 * q * x + b * y) ^ 2 + m * y ^ 2 := by sorry

/-- CA.4/three-squares-lattice-point, cases m ≡ 1, 2, 5, 6 (mod 8) (Ankeny §2). -/
theorem ankeny_lattice_point_other {m q : ℕ} (hm0 : 0 < m) (hsq : Squarefree m)
    (hm : m % 8 ∈ ({1, 2, 5, 6} : Finset ℕ)) (hq : q.Prime) (hq4 : q % 4 = 1) (hqm : ¬ q ∣ m)
    (hcond : ∀ p ∈ m.primeFactors, p ≠ 2 → jacobiSym (-q) p = 1)
    (heven : Even m → jacobiSym (-2) q = (-1) ^ ((m / 2 - 1) / 2)) :
    ∃ b h R x y : ℤ, b ^ 2 - q * h = -m ∧ R ^ 2 + (q * x ^ 2 + 2 * b * x * y + h * y ^ 2) = m ∧
      q * (q * x ^ 2 + 2 * b * x * y + h * y ^ 2) = (q * x + b * y) ^ 2 + m * y ^ 2 := by sorry

/-- CA.4/three-squares-remainder-sum-of-two-squares, in the form used: the remainder `m − R²`
is a sum of two squares. -/
theorem ankeny_remainder_sum_two_sq {m q : ℕ} {b h R x y : ℤ} (hm0 : 0 < m) (hsq : Squarefree m)
    (hq : q.Prime) (hq4 : q % 4 = 1) (hqm : ¬ q ∣ m)
    (hcase : (m % 8 = 3 ∧ (∀ p ∈ m.primeFactors, jacobiSym (-2 * q) p = 1) ∧
        b ^ 2 - 4 * q * h = -m ∧ R ^ 2 + 2 * (q * x ^ 2 + b * x * y + h * y ^ 2) = m) ∨
      (m % 8 ≠ 3 ∧ (∀ p ∈ m.primeFactors, p ≠ 2 → jacobiSym (-q) p = 1) ∧
        b ^ 2 - q * h = -m ∧ R ^ 2 + (q * x ^ 2 + 2 * b * x * y + h * y ^ 2) = m)) :
    ∃ s t : ℤ, (m : ℤ) - R ^ 2 = s ^ 2 + t ^ 2 := by sorry

/-- CA.4/three-squares-squarefree-case. -/
theorem sum_three_sq_of_squarefree {m : ℕ} (hm0 : 0 < m) (hsq : Squarefree m)
    (hm : m % 8 ∈ ({1, 2, 3, 5, 6} : Finset ℕ)) : ∃ x y z : ℕ, x ^ 2 + y ^ 2 + z ^ 2 = m := by
  sorry

/-- CA.4/legendre-three-square-theorem. -/
theorem sum_three_squares_iff (n : ℕ) :
    (∃ x y z : ℕ, x ^ 2 + y ^ 2 + z ^ 2 = n) ↔ ¬ ∃ a b : ℕ, n = 4 ^ a * (8 * b + 7) := by sorry

/-! ### Representation numbers (`CA.4/sum-of-squares-representation-count` and consumers) -/

/-- `r_k(n)`: the number of `x ∈ ℤᵏ` with `x₁² + ⋯ + x_k² = n`, with order and signs. -/
def sumSquaresCount (k n : ℕ) : ℕ :=
  Nat.card {x : Fin k → ℤ // ∑ i, x i ^ 2 = (n : ℤ)}

theorem sumSquaresCount_finite (k n : ℕ) :
    {x : Fin k → ℤ | ∑ i, x i ^ 2 = (n : ℤ)}.Finite := by sorry

theorem sumSquaresCount_zero_right (k : ℕ) : sumSquaresCount k 0 = 1 := by sorry

theorem sumSquaresCount_zero_left (n : ℕ) : sumSquaresCount 0 n = if n = 0 then 1 else 0 := by
  sorry

theorem sumSquaresCount_pos_iff (k n : ℕ) :
    0 < sumSquaresCount k n ↔ ∃ x : Fin k → ℤ, ∑ i, x i ^ 2 = (n : ℤ) := by sorry

theorem sumSquaresCount_add (k l n : ℕ) :
    sumSquaresCount (k + l) n =
      ∑ p ∈ Finset.HasAntidiagonal.antidiagonal n, sumSquaresCount k p.1 * sumSquaresCount l p.2 := by sorry

theorem sumSquaresCount_two_pos_iff (n : ℕ) :
    0 < sumSquaresCount 2 n ↔ ∀ q ∈ n.primeFactors, q % 4 = 3 → Even (padicValNat q n) := by
  sorry

theorem sumSquaresCount_four_pos (n : ℕ) : 0 < sumSquaresCount 4 n := by sorry

/-- Unit test `sumSquaresCount_two_five`. -/
example : sumSquaresCount 2 5 = 8 := by sorry

/-- Unit test `sumSquaresCount_two_twentyfive`. -/
example : sumSquaresCount 2 25 = 12 := by sorry

/-- Unit test `sumSquaresCount_two_two`: order and signs are counted. -/
example : sumSquaresCount 2 2 = 4 := by sorry

/-- Unit test `sumSquaresCount_two_zero`. -/
example : sumSquaresCount 2 0 = 1 := by sorry

/-- Unit test `sumSquaresCount_four_one`. -/
example : sumSquaresCount 4 1 = 8 := by sorry

/-- Unit test `sumSquaresCount_two_three`: agreement with `Nat.eq_sq_add_sq_iff`. -/
example : sumSquaresCount 2 3 = 0 ∧
    ¬ ∀ q ∈ (3 : ℕ).primeFactors, q % 4 = 3 → Even (padicValNat q 3) := by sorry

/-- CA.4/gaussian-norm-count-multiplicative. -/
theorem gaussian_norm_count_mul {m n : ℕ} (hm : 0 < m) (hn : 0 < n) (hmn : Nat.Coprime m n) :
    sumSquaresCount 2 n = Nat.card {z : GaussianInt // z.norm = n} ∧ 4 ∣ sumSquaresCount 2 n ∧
      sumSquaresCount 2 (m * n) / 4 = (sumSquaresCount 2 m / 4) * (sumSquaresCount 2 n / 4) := by
  sorry

/-- CA.4/gaussian-norm-count-prime-power. -/
theorem gaussian_norm_count_prime_pow {p : ℕ} (hp : p.Prime) (k : ℕ) :
    ((sumSquaresCount 2 (p ^ k) / 4 : ℕ) : ℤ) =
      ∑ j ∈ Finset.range (k + 1), (ZMod.χ₄ (p : ZMod 4)) ^ j := by sorry

/-- CA.4/jacobi-two-square-theorem. -/
theorem jacobi_two_square {n : ℕ} (hn : 0 < n) :
    (sumSquaresCount 2 n : ℤ) = 4 * ∑ d ∈ n.divisors, ZMod.χ₄ (d : ZMod 4) := by sorry

/-- CA.4/hirschhorn-sixth-power-identity, coefficientwise (truncating the product does not
change the coefficient of `x^N`). -/
theorem hirschhorn_sixth_power (N : ℕ) :
    2 * PowerSeries.coeff N
        (∏ n ∈ Finset.range (N + 1), (1 - PowerSeries.X ^ (n + 1)) ^ 6 : PowerSeries ℤ) =
      ∑ p ∈ ((Finset.Icc (-(N : ℤ) - 1) N) ×ˢ (Finset.Icc (-(N : ℤ)) N)).filter
          (fun p => p.1 ^ 2 + p.1 + p.2 ^ 2 = (N : ℤ)),
        ((2 * p.1 + 1) ^ 2 - (2 * p.2) ^ 2) := by sorry

/-- CA.4/theta-fourth-power-lambert-series, coefficientwise, with `θ = Σ x^{n²}` written as
`Σ r₁(n) xⁿ`. -/
theorem theta_fourth_power_coeff (N : ℕ) :
    PowerSeries.coeff N ((PowerSeries.mk fun n => (sumSquaresCount 1 n : ℤ)) ^ 4) =
      if N = 0 then 1 else 8 * ∑ d ∈ N.divisors with ¬ 4 ∣ d, (d : ℤ) := by sorry

/-- CA.4/jacobi-four-square-theorem. -/
theorem jacobi_four_square {n : ℕ} (hn : 0 < n) :
    sumSquaresCount 4 n = 8 * ∑ d ∈ n.divisors with ¬ 4 ∣ d, d := by sorry

/-! ### Pell-type equations (`CA.4/generalised-pell-*`, `CA.4/negative-pell-*`) -/

/-- The solutions of x² − dy² = n, as elements of `ℤ√d` of norm `n`. -/
def pellNormSet (d n : ℤ) : Set (ℤ√d) :=
  {z | Zsqrtd.norm z = n}

section PellNormSetAPI

variable {d : ℤ}

theorem mem_pellNormSet_iff (n x y : ℤ) :
    (⟨x, y⟩ : ℤ√d) ∈ pellNormSet d n ↔ x ^ 2 - d * y ^ 2 = n := by sorry

theorem pellNormSet.mul_mem {n n' : ℤ} {z w : ℤ√d} (hz : z ∈ pellNormSet d n)
    (hw : w ∈ pellNormSet d n') : z * w ∈ pellNormSet d (n * n') := by sorry

theorem pellNormSet.solution_mul_mem {n : ℤ} (a : Pell.Solution₁ d) {z : ℤ√d}
    (hz : z ∈ pellNormSet d n) : (a : ℤ√d) * z ∈ pellNormSet d n := by sorry

theorem pellNormSet.star_mem {n : ℤ} {z : ℤ√d} (hz : z ∈ pellNormSet d n) :
    star z ∈ pellNormSet d n ∧ -z ∈ pellNormSet d n := by sorry

theorem pellNormSet_one : pellNormSet d 1 = (unitary (ℤ√d) : Set (ℤ√d)) := by sorry

theorem pellNormSet_zero (hd : ∀ k : ℤ, d ≠ k * k) : pellNormSet d 0 = {0} := by sorry

end PellNormSetAPI

/-- Unit test `mem_pellNormSet_six_three`. -/
example : (⟨3, 1⟩ : ℤ√6) ∈ pellNormSet 6 3 ∧ (⟨27, 11⟩ : ℤ√6) ∈ pellNormSet 6 3 := by sorry

/-- Unit test `pellNormSet_three_neg_one`. -/
example : pellNormSet 3 (-1) = ∅ := by sorry

/-- Unit test `pellNormSet_zero_of_not_square`. -/
example : pellNormSet 2 0 = {0} := by sorry

/-- Unit test `pellNormSet_one_compat`: agreement with Mathlib's carrier of `Pell.Solution₁`. -/
example (d : ℤ) (z : ℤ√d) : z ∈ pellNormSet d 1 ↔ z ∈ unitary (ℤ√d) := by sorry

/-- CA.4/negative-pell-solution-ordering. -/
theorem negativePell_ordering {d : ℤ} (hd : 0 < d) (hns : ¬ IsSquare d) {x y a b : ℤ}
    (hx : 1 ≤ x) (hy : 1 ≤ y) (ha : 1 ≤ a) (hb : 1 ≤ b) (h : x ^ 2 - d * y ^ 2 = -1)
    (h' : a ^ 2 - d * b ^ 2 = -1) :
    ((a : ℝ) + b * Real.sqrt d < x + y * Real.sqrt d ↔ a < x ∧ b < y) ∧ (a < x ∧ b < y ↔ a < x ∨ b < y) := by
  sorry

/-- CA.4/negative-pell-least-solution-squares-to-fundamental. -/
theorem negativePell_sq_isFundamental {d : ℤ} (hd : 0 < d) (hns : ¬ IsSquare d) {x₁ y₁ : ℤ}
    (hx : 0 < x₁) (hy : 0 < y₁) (h : x₁ ^ 2 - d * y₁ ^ 2 = -1)
    (hmin : ∀ x y : ℤ, 0 < x → 0 < y → x ^ 2 - d * y ^ 2 = -1 → y₁ ≤ y) :
    ∃ a : Pell.Solution₁ d, Pell.IsFundamental a ∧ (a : ℤ√d) = (⟨x₁, y₁⟩ : ℤ√d) ^ 2 := by sorry

/-- CA.4/negative-pell-classification. -/
theorem negativePell_classification {d : ℤ} (hd : 0 < d) (hns : ¬ IsSquare d) {x₁ y₁ : ℤ}
    (hx : 0 < x₁) (hy : 0 < y₁) (h : x₁ ^ 2 - d * y₁ ^ 2 = -1)
    (hmin : ∀ x y : ℤ, 0 < x → 0 < y → x ^ 2 - d * y ^ 2 = -1 → y₁ ≤ y)
    (ε : (ℤ√d)ˣ) (hε : (ε : ℤ√d) = ⟨x₁, y₁⟩) (x y : ℤ) :
    (x ^ 2 - d * y ^ 2 = -1 ↔ ∃ k : ℤ, Odd k ∧
        ((⟨x, y⟩ : ℤ√d) = ((ε ^ k : (ℤ√d)ˣ) : ℤ√d) ∨ (⟨x, y⟩ : ℤ√d) = -((ε ^ k : (ℤ√d)ˣ) : ℤ√d))) ∧
      (x ^ 2 - d * y ^ 2 = 1 ↔ ∃ k : ℤ, Even k ∧
        ((⟨x, y⟩ : ℤ√d) = ((ε ^ k : (ℤ√d)ˣ) : ℤ√d) ∨ (⟨x, y⟩ : ℤ√d) = -((ε ^ k : (ℤ√d)ˣ) : ℤ√d))) := by
  sorry

/-- CA.4/negative-pell-local-obstruction. -/
theorem negativePell_no_solution {d : ℤ}
    (h : 4 ∣ d ∨ ∃ p : ℕ, p.Prime ∧ p % 4 = 3 ∧ (p : ℤ) ∣ d) (x y : ℤ) :
    x ^ 2 - d * y ^ 2 ≠ -1 := by sorry

/-- CA.4/chebyshev-bound-generalised-pell. -/
theorem chebyshev_bound {d : ℤ} (hd : 0 < d) (hns : ¬ IsSquare d) {a b : ℤ} (ha : 0 < a)
    (hb : 0 < b) (hab : a ^ 2 - d * b ^ 2 = 1) (u : (ℤ√d)ˣ) (hu : (u : ℤ√d) = ⟨a, b⟩)
    {n : ℤ} (hn : n ≠ 0) {x y : ℤ} (h : x ^ 2 - d * y ^ 2 = n) :
    ∃ x' y' : ℤ, ∃ k : ℤ, x' ^ 2 - d * y' ^ 2 = n ∧
      (⟨x, y⟩ : ℤ√d) = (⟨x', y'⟩ : ℤ√d) * ((u ^ k : (ℤ√d)ˣ) : ℤ√d) ∧
      |(x' : ℝ)| ≤ Real.sqrt |(n : ℝ)| *
          (Real.sqrt (a + b * Real.sqrt d) + 1 / Real.sqrt (a + b * Real.sqrt d)) / 2 ∧
      |(y' : ℝ)| ≤ Real.sqrt |(n : ℝ)| *
          (Real.sqrt (a + b * Real.sqrt d) + 1 / Real.sqrt (a + b * Real.sqrt d)) /
            (2 * Real.sqrt d) := by sorry

/-- CA.4/generalised-pell-finite-classes-and-bounded-search, part (b): the complete finite
search. -/
theorem generalisedPell_solvable_iff_box {d : ℤ} (hd : 0 < d) (hns : ¬ IsSquare d) {a b : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hab : a ^ 2 - d * b ^ 2 = 1) {n : ℤ} (hn : n ≠ 0) :
    (∃ x y : ℤ, x ^ 2 - d * y ^ 2 = n) ↔
      ∃ x y : ℤ, x ^ 2 - d * y ^ 2 = n ∧
        |(x : ℝ)| ≤ Real.sqrt |(n : ℝ)| *
            (Real.sqrt (a + b * Real.sqrt d) + 1 / Real.sqrt (a + b * Real.sqrt d)) / 2 ∧
        |(y : ℝ)| ≤ Real.sqrt |(n : ℝ)| *
            (Real.sqrt (a + b * Real.sqrt d) + 1 / Real.sqrt (a + b * Real.sqrt d)) /
              (2 * Real.sqrt d) := by sorry

/-- CA.4/small-norm-solutions-are-convergents (Lagrange; Conrad, Pell II, Theorem 5.1). -/
theorem small_norm_convergent {d : ℕ} (hns : ¬ IsSquare d) {n : ℤ} (hn : n ≠ 0)
    (hlt : |(n : ℝ)| < Real.sqrt d) {x y : ℕ} (hx : 0 < x) (hy : 0 < y)
    (h : (x : ℤ) ^ 2 - d * (y : ℤ) ^ 2 = n) :
    ∃ k, ((x : ℚ) / y) = Real.convergent (Real.sqrt d) k := by sorry

/-- CA.4/pell-unit-solutions-are-convergents. -/
theorem pell_unit_convergent {d : ℕ} (hd : 1 < d) (hns : ¬ IsSquare d) {x y : ℕ} (hx : 0 < x)
    (hy : 0 < y) (h : (x : ℤ) ^ 2 - d * (y : ℤ) ^ 2 = 1 ∨ (x : ℤ) ^ 2 - d * (y : ℤ) ^ 2 = -1) :
    ∃ k, (Real.convergent (Real.sqrt d) k).num = x ∧ (Real.convergent (Real.sqrt d) k).den = y := by
  sorry

/-- CA.4/small-norm-pell-decision-by-convergents. -/
theorem small_norm_pell_decision {d : ℕ} (hd : 1 < d) (hns : ¬ IsSquare d) {n : ℤ} (hn : n ≠ 0)
    (hlt : |(n : ℝ)| < Real.sqrt d) {a b : ℤ} (ha : 0 < a) (hb : 0 < b)
    (hab : a ^ 2 - d * b ^ 2 = 1) :
    (∃ x y : ℤ, 0 < x ∧ 0 < y ∧ x ^ 2 - d * y ^ 2 = n) ↔
      IsSquare n ∨ ∃ k g : ℕ, 0 < g ∧ ((g : ℤ) ^ 2 ∣ n) ∧
        (g * (Real.convergent (Real.sqrt d) k).den : ℝ) ≤
          Real.sqrt |(n : ℝ)| *
            (Real.sqrt (a + b * Real.sqrt d) + 1 / Real.sqrt (a + b * Real.sqrt d)) /
              (2 * Real.sqrt d) ∧
        (Real.convergent (Real.sqrt d) k).num ^ 2 -
            d * ((Real.convergent (Real.sqrt d) k).den : ℤ) ^ 2 = n / (g : ℤ) ^ 2 := by sorry

/-! ### Exponential equations (`CA.4/ramanujan-nagell-*`, Levi ben Gershon) -/

/-- The ring `ℤ[(1 + √−7)/2]`, with `θ = (1 + √−7)/2` satisfying `θ² = θ − 2`. -/
abbrev RamanujanNagellRing := QuadraticAlgebra ℤ (-2) 1

/-- `θ = (1 + √−7)/2`. -/
def rnTheta : RamanujanNagellRing := ⟨0, 1⟩

/-- `θ′ = (1 − √−7)/2 = 1 − θ`. -/
def rnTheta' : RamanujanNagellRing := ⟨1, -1⟩

/-- CA.4/ramanujan-nagell-ring-norm-euclidean. -/
theorem rnRing_norm_euclidean (α β : RamanujanNagellRing) (hβ : β ≠ 0) :
    ∃ q r : RamanujanNagellRing, α = β * q + r ∧
      (QuadraticAlgebra.norm r).natAbs < (QuadraticAlgebra.norm β).natAbs := by sorry

/-- CA.4/ramanujan-nagell-ring-units-and-primes. -/
theorem rnRing_units_and_primes :
    (∀ u : RamanujanNagellRingˣ, (u : RamanujanNagellRing) = 1 ∨ (u : RamanujanNagellRing) = -1) ∧
      rnTheta * rnTheta' = 2 ∧ rnTheta + rnTheta' = 1 ∧ (rnTheta - rnTheta') ^ 2 = -7 ∧
      Prime rnTheta ∧ Prime rnTheta' ∧ ¬ Associated rnTheta rnTheta' := by sorry

/-- CA.4/ramanujan-nagell-even-case. -/
theorem ramanujanNagell_even {x : ℤ} {n : ℕ} (hn : Even n) (h : x ^ 2 + 7 = 2 ^ n) :
    n = 4 ∧ (x = 3 ∨ x = -3) := by sorry

/-- CA.4/ramanujan-nagell-factorisation. -/
theorem ramanujanNagell_factor {x : ℤ} {n : ℕ} (hn : Odd n) (h5 : 5 ≤ n) (hx : 0 < x)
    (h : x ^ 2 + 7 = 2 ^ n) :
    rnTheta ^ (n - 2) - rnTheta' ^ (n - 2) = rnTheta - rnTheta' ∨
      rnTheta ^ (n - 2) - rnTheta' ^ (n - 2) = -(rnTheta - rnTheta') := by sorry

/-- CA.4/ramanujan-nagell-sign. -/
theorem ramanujanNagell_sign {m : ℕ} (hm : Odd m) (h3 : 3 ≤ m)
    (h : rnTheta ^ m - rnTheta' ^ m = rnTheta - rnTheta' ∨
      rnTheta ^ m - rnTheta' ^ m = -(rnTheta - rnTheta')) :
    rnTheta ^ m - rnTheta' ^ m = -(rnTheta - rnTheta') := by sorry

/-- CA.4/ramanujan-nagell-residues-mod-42. -/
theorem ramanujanNagell_mod_42 {m : ℕ} (hm : Odd m)
    (h : rnTheta ^ m - rnTheta' ^ m = -(rnTheta - rnTheta')) :
    m % 42 = 3 ∨ m % 42 = 5 ∨ m % 42 = 13 := by sorry

/-- CA.4/ramanujan-nagell-one-per-class. -/
theorem ramanujanNagell_one_per_class {m m' : ℕ} (hm : Odd m) (hm' : Odd m') (hlt : m < m')
    (hmod : m % 42 = m' % 42) (h : rnTheta ^ m - rnTheta' ^ m = -(rnTheta - rnTheta'))
    (h' : rnTheta ^ m' - rnTheta' ^ m' = -(rnTheta - rnTheta')) : False := by sorry

/-- CA.4/ramanujan-nagell-theorem. -/
theorem ramanujanNagell (x : ℤ) (n : ℕ) :
    x ^ 2 + 7 = 2 ^ n ↔
      (x.natAbs, n) ∈ ({(1, 3), (3, 4), (5, 5), (11, 7), (181, 15)} : Finset (ℕ × ℕ)) := by sorry

/-- CA.4/powers-of-two-and-three-differing-by-one (Levi ben Gershon). -/
theorem two_pow_sub_three_pow_eq_one_iff (a b : ℕ) :
    ((2 : ℤ) ^ a - 3 ^ b = 1 ∨ (2 : ℤ) ^ a - 3 ^ b = -1) ↔
      (a, b) ∈ ({(1, 0), (1, 1), (2, 1), (3, 2)} : Finset (ℕ × ℕ)) := by sorry

/-! ### Numerical semigroups (`CA.4/numerical-semigroup` and consumers) -/

namespace AddSubmonoid

/-- A numerical semigroup: a submonoid of `ℕ` with finite complement. -/
def IsNumericalSemigroup (S : AddSubmonoid ℕ) : Prop :=
  ((S : Set ℕ)ᶜ).Finite

/-- The gaps `ℕ ∖ S`. -/
def numericalGaps (S : AddSubmonoid ℕ) : Set ℕ :=
  (S : Set ℕ)ᶜ

/-- The genus `g(S)`, the number of gaps. -/
def numericalGenus (S : AddSubmonoid ℕ) : ℕ :=
  (numericalGaps S).ncard

open Classical in
/-- The Frobenius number `F(S)`: the largest gap, and `−1` for `S = ℕ`. -/
def numericalFrobenius (S : AddSubmonoid ℕ) : ℤ :=
  if (numericalGaps S).Nonempty then ((sSup (numericalGaps S) : ℕ) : ℤ) else -1

/-- The multiplicity `m(S)`, the least positive element. -/
def numericalMultiplicity (S : AddSubmonoid ℕ) : ℕ :=
  sInf {s | s ∈ S ∧ 0 < s}

theorem isNumericalSemigroup_iff_setGcd (S : AddSubmonoid ℕ) :
    IsNumericalSemigroup S ↔ Nat.setGcd (S : Set ℕ) = 1 := by sorry

theorem mem_of_numericalFrobenius_lt {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) {x : ℕ}
    (hx : numericalFrobenius S < x) : x ∈ S := by sorry

theorem numericalGenus_eq_zero_iff {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) :
    numericalGenus S = 0 ↔ S = ⊤ := by sorry

theorem frobeniusNumber_numericalFrobenius {s : Set ℕ}
    (hS : IsNumericalSemigroup (_root_.AddSubmonoid.closure s))
    (hne : _root_.AddSubmonoid.closure s ≠ ⊤) :
    FrobeniusNumber (numericalFrobenius (_root_.AddSubmonoid.closure s)).toNat s := by sorry

theorem isNumericalSemigroup_closure_pair_iff (a b : ℕ) :
    IsNumericalSemigroup (_root_.AddSubmonoid.closure ({a, b} : Set ℕ)) ↔ Nat.gcd a b = 1 := by sorry

/-- Unit test `numericalGenus_three_five`. -/
example : numericalGaps (_root_.AddSubmonoid.closure ({3, 5} : Set ℕ)) = {1, 2, 4, 7} ∧
    numericalGenus (_root_.AddSubmonoid.closure ({3, 5} : Set ℕ)) = 4 ∧
    numericalFrobenius (_root_.AddSubmonoid.closure ({3, 5} : Set ℕ)) = 7 := by sorry

/-- Unit test `numericalFrobenius_five_seven_nine`. -/
example : numericalFrobenius (_root_.AddSubmonoid.closure ({5, 7, 9} : Set ℕ)) = 13 ∧
    numericalGenus (_root_.AddSubmonoid.closure ({5, 7, 9} : Set ℕ)) = 8 := by sorry

/-- Unit test `numericalFrobenius_top`. -/
example : numericalGenus (⊤ : AddSubmonoid ℕ) = 0 ∧ numericalFrobenius (⊤ : AddSubmonoid ℕ) = -1 := by
  sorry

/-- Unit test `not_isNumericalSemigroup_two_four`. -/
example : ¬ IsNumericalSemigroup (_root_.AddSubmonoid.closure ({2, 4} : Set ℕ)) := by sorry

/-- Unit test `numericalFrobenius_pair_compat`: agreement with `frobeniusNumber_pair`. -/
example : numericalFrobenius (_root_.AddSubmonoid.closure ({3, 5} : Set ℕ)) = ((3 * 5 - 3 - 5 : ℕ) : ℤ) ∧
    FrobeniusNumber (3 * 5 - 3 - 5) {3, 5} := by sorry

/-- The Apéry set `Ap(S, n) = {s ∈ S | s − n ∉ S}`. -/
def aperySet (S : AddSubmonoid ℕ) (n : ℕ) : Set ℕ :=
  {s | s ∈ S ∧ ¬ (n ≤ s ∧ s - n ∈ S)}

theorem mem_aperySet_iff (S : AddSubmonoid ℕ) (n s : ℕ) :
    s ∈ aperySet S n ↔ s ∈ S ∧ (n ≤ s → s - n ∉ S) := by sorry

theorem zero_mem_aperySet (S : AddSubmonoid ℕ) {n : ℕ} (hn : 0 < n) : 0 ∈ aperySet S n := by
  sorry

theorem mem_aperySet_iff_isLeast {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) {n : ℕ}
    (hn : n ∈ S) (hn0 : 0 < n) (w : ℕ) :
    w ∈ aperySet S n ↔ IsLeast {s | s ∈ S ∧ s % n = w % n} w := by sorry

theorem ncard_aperySet {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) {n : ℕ} (hn : n ∈ S)
    (hn0 : 0 < n) : (aperySet S n).ncard = n := by sorry

theorem aperySet_mod_bijOn {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) {n : ℕ}
    (hn : n ∈ S) (hn0 : 0 < n) : Set.BijOn (· % n) (aperySet S n) (Set.Iio n) := by sorry

/-- Unit test `aperySet_three_five`. -/
example : aperySet (_root_.AddSubmonoid.closure ({3, 5} : Set ℕ)) 3 = {0, 5, 10} := by sorry

/-- Unit test `aperySet_five_nine_twentyone`. -/
example : aperySet (_root_.AddSubmonoid.closure ({5, 9, 21} : Set ℕ)) 5 = {0, 9, 18, 21, 27} := by sorry

/-- Unit test `aperySet_top_one`. -/
example : aperySet (⊤ : AddSubmonoid ℕ) 1 = {0} := by sorry

/-- Unit test `ncard_aperySet_of_not_mem`: for `6 ∉ S` the count is not 6. -/
example : (aperySet (_root_.AddSubmonoid.closure ({5, 9, 21} : Set ℕ)) 6).ncard = 9 := by sorry

/-- CA.4/apery-set-unique-decomposition. -/
theorem aperySet_unique_decomposition {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) {n : ℕ}
    (hn : n ∈ S) (hn0 : 0 < n) {s : ℕ} (hs : s ∈ S) :
    ∃! kw : ℕ × ℕ, kw.2 ∈ aperySet S n ∧ s = kw.1 * n + kw.2 := by sorry

/-- CA.4/selmer-frobenius-formula. -/
theorem selmer_frobenius {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) {n : ℕ} (hn : n ∈ S)
    (hn0 : 0 < n) : numericalFrobenius S = (sSup (aperySet S n) : ℕ) - n := by sorry

/-- CA.4/selmer-genus-formula. -/
theorem selmer_genus {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) {n : ℕ} (hn : n ∈ S)
    (hn0 : 0 < n) : 2 * n * numericalGenus S + n * (n - 1) = 2 * ∑ᶠ w ∈ aperySet S n, w := by
  sorry

/-- CA.4/sylvester-gap-count. -/
theorem sylvester_gap_count {a b : ℕ} (ha : 0 < a) (hb : 0 < b) (hab : Nat.gcd a b = 1) :
    aperySet (_root_.AddSubmonoid.closure ({a, b} : Set ℕ)) a = Set.image (· * b) (Set.Iio a) ∧
      numericalFrobenius (_root_.AddSubmonoid.closure ({a, b} : Set ℕ)) = (a : ℤ) * b - a - b ∧
      2 * numericalGenus (_root_.AddSubmonoid.closure ({a, b} : Set ℕ)) = (a - 1) * (b - 1) := by sorry

/-- CA.4/genus-frobenius-inequality. -/
theorem numericalFrobenius_add_one_le {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) :
    numericalFrobenius S + 1 ≤ 2 * numericalGenus S := by sorry

/-- `S` is symmetric: every integer `x ∉ S` has `F(S) − x ∈ S`. -/
def IsSymmetricNumerical (S : AddSubmonoid ℕ) : Prop :=
  ∀ x : ℤ, x ∉ (Nat.cast '' (S : Set ℕ) : Set ℤ) →
    numericalFrobenius S - x ∈ (Nat.cast '' (S : Set ℕ) : Set ℤ)

theorem isSymmetricNumerical_iff {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) :
    IsSymmetricNumerical S ↔
      ∀ x : ℕ, (x : ℤ) ≤ numericalFrobenius S →
        (x ∈ S ↔ (numericalFrobenius S - x).toNat ∉ S) := by sorry

theorem IsSymmetricNumerical.odd_frobenius {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S)
    (h : IsSymmetricNumerical S) (hne : S ≠ ⊤) : Odd (numericalFrobenius S) := by sorry

theorem isSymmetricNumerical_top : IsSymmetricNumerical (⊤ : AddSubmonoid ℕ) := by sorry

/-- Unit test `isSymmetricNumerical_three_five`. -/
example : IsSymmetricNumerical (_root_.AddSubmonoid.closure ({3, 5} : Set ℕ)) := by sorry

/-- Unit test `not_isSymmetricNumerical_three_four_five`. -/
example : ¬ IsSymmetricNumerical (_root_.AddSubmonoid.closure ({3, 4, 5} : Set ℕ)) := by sorry

/-- Unit test `not_isSymmetricNumerical_five_seven_nine`. -/
example : ¬ IsSymmetricNumerical (_root_.AddSubmonoid.closure ({5, 7, 9} : Set ℕ)) := by sorry

/-- Unit test `isSymmetricNumerical_top_test`. -/
example : IsSymmetricNumerical (⊤ : AddSubmonoid ℕ) ∧ numericalFrobenius (⊤ : AddSubmonoid ℕ) = -1 := by
  sorry

/-- CA.4/symmetric-iff-genus. -/
theorem isSymmetricNumerical_iff_genus {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) :
    IsSymmetricNumerical S ↔ 2 * (numericalGenus S : ℤ) = numericalFrobenius S + 1 := by sorry

/-- CA.4/two-generator-semigroup-symmetric. -/
theorem isSymmetricNumerical_pair {a b : ℕ} (ha : 0 < a) (hb : 0 < b) (hab : Nat.gcd a b = 1) :
    IsSymmetricNumerical (_root_.AddSubmonoid.closure ({a, b} : Set ℕ)) := by sorry

/-- CA.4/apery-set-summand-closed. -/
theorem mem_aperySet_of_add_mem {S : AddSubmonoid ℕ} {n x y : ℕ} (hx : x ∈ S) (hy : y ∈ S)
    (hxy : x + y ∈ aperySet S n) : x ∈ aperySet S n ∧ y ∈ aperySet S n := by sorry

/-- CA.4/symmetric-iff-apery-pairing, in the equivalent involution form: `w ↦ max Ap − w`
maps `Ap(S, n)` to itself (for the sorted Apéry set this is `aᵢ + a_{n−1−i} = a_{n−1}`). -/
theorem isSymmetricNumerical_iff_apery {S : AddSubmonoid ℕ} (hS : IsNumericalSemigroup S) {n : ℕ}
    (hn : n ∈ S) (hn0 : 0 < n) :
    IsSymmetricNumerical S ↔ ∀ w ∈ aperySet S n, sSup (aperySet S n) - w ∈ aperySet S n := by
  sorry

end AddSubmonoid

/-! ### Egyptian fractions (`CA.4/egyptian-*`, `CA.4/greedy-*`, Sylvester's sequence) -/

/-- `D` is an Egyptian fraction expansion of `r`: distinct positive denominators. -/
def IsEgyptianExpansion (r : ℚ) (D : Finset ℕ) : Prop :=
  0 ∉ D ∧ ∑ d ∈ D, (1 : ℚ) / d = r

theorem isEgyptianExpansion_empty_iff (r : ℚ) : IsEgyptianExpansion r ∅ ↔ r = 0 := by sorry

theorem isEgyptianExpansion_singleton {n : ℕ} (hn : n ≠ 0) :
    IsEgyptianExpansion (1 / n) {n} := by sorry

theorem IsEgyptianExpansion.union {r s : ℚ} {D E : Finset ℕ} (hD : IsEgyptianExpansion r D)
    (hE : IsEgyptianExpansion s E) (h : Disjoint D E) : IsEgyptianExpansion (r + s) (D ∪ E) := by
  sorry

theorem IsEgyptianExpansion.split {r : ℚ} {D : Finset ℕ} {n : ℕ} (hD : IsEgyptianExpansion r D)
    (hn : n ∈ D) (h1 : n + 1 ∉ D) (h2 : n * (n + 1) ∉ D) :
    IsEgyptianExpansion r (insert (n + 1) (insert (n * (n + 1)) (D.erase n))) := by sorry

theorem IsEgyptianExpansion.pos {r : ℚ} {D : Finset ℕ} (hD : IsEgyptianExpansion r D)
    (hne : D.Nonempty) : 0 < r := by sorry

/-- Unit test `isEgyptianExpansion_five_sixths`. -/
example : IsEgyptianExpansion (5 / 6) {2, 3} := by sorry

/-- Unit test `isEgyptianExpansion_one`. -/
example : IsEgyptianExpansion 1 {2, 3, 6} := by sorry

/-- Unit test `isEgyptianExpansion_zero_iff`. -/
example (D : Finset ℕ) : IsEgyptianExpansion 0 D ↔ D = ∅ := by sorry

/-- Unit test `not_isEgyptianExpansion_two_thirds_three`. -/
example : ¬ IsEgyptianExpansion (2 / 3) {3} := by sorry

/-- Unit test `isEgyptianExpansion_compat_sum`. -/
example (r : ℚ) (D : Finset ℕ) :
    IsEgyptianExpansion r D ↔ 0 ∉ D ∧ ∑ d ∈ D, ((d : ℚ))⁻¹ = r := by sorry

/-- CA.4/greedy-egyptian-step. -/
theorem greedy_egyptian_step {m n : ℕ} (hm : 0 < m) (hmn : m < n) (hcop : Nat.Coprime m n) :
    (m : ℚ) / n - 1 / ⌈(n : ℚ) / m⌉₊ = ((m * ⌈(n : ℚ) / m⌉₊ - n : ℕ) : ℚ) / (n * ⌈(n : ℚ) / m⌉₊) ∧
      m * ⌈(n : ℚ) / m⌉₊ - n < m ∧ 2 ≤ ⌈(n : ℚ) / m⌉₊ := by sorry

/-- The greedy expansion with fuel: at most `fuel` steps. -/
def egyptianGreedyAux : ℕ → ℚ → List ℕ
  | 0, _ => []
  | fuel + 1, r => if r ≤ 0 then [] else ⌈1 / r⌉₊ :: egyptianGreedyAux fuel (r - 1 / ⌈1 / r⌉₊)

/-- The Fibonacci–Sylvester greedy expansion of `r`; `num r` steps suffice. -/
def egyptianGreedy (r : ℚ) : List ℕ :=
  egyptianGreedyAux r.num.natAbs r

theorem egyptianGreedy_sum {r : ℚ} (h0 : 0 < r) (h1 : r ≤ 1) :
    ((egyptianGreedy r).map fun c : ℕ => (1 : ℚ) / c).sum = r := by sorry

theorem egyptianGreedy_sorted (r : ℚ) : (egyptianGreedy r).Pairwise (· < ·) := by sorry

theorem egyptianGreedy_length_le (r : ℚ) : (egyptianGreedy r).length ≤ r.num.natAbs := by sorry

theorem egyptianGreedy_head {r : ℚ} (h0 : 0 < r) :
    (egyptianGreedy r).head? = some ⌈1 / r⌉₊ := by sorry

theorem egyptianGreedy_isEgyptianExpansion {r : ℚ} (h0 : 0 < r) (h1 : r ≤ 1) :
    IsEgyptianExpansion r (egyptianGreedy r).toFinset := by sorry

/-- Unit test `egyptianGreedy_five_thirtyone`. -/
example : egyptianGreedy (5 / 31) = [7, 55, 3979, 23744683, 1127619917796295] := by sorry

/-- Unit test `egyptianGreedy_four_thirteen`. -/
example : egyptianGreedy (4 / 13) = [4, 18, 468] := by sorry

/-- Unit test `egyptianGreedy_unit`. -/
example {n : ℕ} (hn : 1 ≤ n) : egyptianGreedy (1 / n) = [n] := by sorry

/-- Unit test `egyptianGreedy_not_shortest`: the greedy expansion is not the shortest. -/
example : (egyptianGreedy (5 / 31)).length = 5 ∧ IsEgyptianExpansion (5 / 31) {7, 62, 434} := by
  sorry

/-- Unit test `egyptianGreedy_two_sevenths`. -/
example : egyptianGreedy (2 / 7) = [4, 28] := by sorry

/-- CA.4/positive-rational-egyptian-expansion. -/
theorem exists_isEgyptianExpansion {r : ℚ} (hr : 0 < r) : ∃ D : Finset ℕ, IsEgyptianExpansion r D := by
  sorry

/-- Sylvester's sequence `2, 3, 7, 43, 1807, …`. -/
def sylvesterSeq : ℕ → ℕ
  | 0 => 2
  | k + 1 => sylvesterSeq k ^ 2 - sylvesterSeq k + 1

theorem sylvesterSeq_succ_eq_prod (k : ℕ) :
    sylvesterSeq (k + 1) = (∏ j ∈ Finset.range (k + 1), sylvesterSeq j) + 1 := by sorry

theorem sylvesterSeq_strictMono : StrictMono sylvesterSeq := by sorry

theorem sylvesterSeq_coprime {i j : ℕ} (h : i ≠ j) : Nat.Coprime (sylvesterSeq i) (sylvesterSeq j) := by
  sorry

theorem sylvesterSeq_sub_one_ge {k : ℕ} (hk : 1 ≤ k) : 2 ^ (2 ^ (k - 1)) ≤ sylvesterSeq k - 1 := by
  sorry

/-- Unit test `sylvesterSeq_values`. -/
example : sylvesterSeq 0 = 2 ∧ sylvesterSeq 1 = 3 ∧ sylvesterSeq 2 = 7 ∧ sylvesterSeq 3 = 43 ∧
    sylvesterSeq 4 = 1807 := by sorry

/-- Unit test `sylvesterSeq_zero_test`. -/
example : sylvesterSeq 0 = 2 := by sorry

/-- Unit test `sylvesterSeq_prod_compat`. -/
example : sylvesterSeq 4 = sylvesterSeq 0 * sylvesterSeq 1 * sylvesterSeq 2 * sylvesterSeq 3 + 1 := by
  sorry

/-- Unit test `sylvesterSeq_not_linear`. -/
example : sylvesterSeq 3 ≠ 2 * sylvesterSeq 2 + 1 := by sorry

/-- CA.4/sylvester-egyptian-identity. -/
theorem sum_one_div_sylvesterSeq (k : ℕ) :
    ∑ j ∈ Finset.range k, (1 : ℚ) / sylvesterSeq j = 1 - 1 / ((sylvesterSeq k : ℚ) - 1) := by sorry

/-! ### Routing interface (`CA.4/primitive-zero-of-a-form` and consumers) -/

/-- A primitive integer zero of `F`: `F(x) = 0` and the coordinates have gcd 1. -/
def IsPrimitiveZero {n : ℕ} (F : MvPolynomial (Fin (n + 1)) ℤ) (x : Fin (n + 1) → ℤ) : Prop :=
  MvPolynomial.eval x F = 0 ∧ Finset.univ.gcd x = 1

section PrimitiveZeroAPI

variable {n e : ℕ} {F : MvPolynomial (Fin (n + 1)) ℤ}

theorem IsPrimitiveZero.neg (hF : F.IsHomogeneous e) {x : Fin (n + 1) → ℤ}
    (hx : IsPrimitiveZero F x) : IsPrimitiveZero F (-x) := by sorry

theorem exists_isPrimitiveZero_smul (hF : F.IsHomogeneous e) {x : Fin (n + 1) → ℤ} (hx : x ≠ 0)
    (h0 : MvPolynomial.eval x F = 0) :
    ∃ (g : ℕ) (y : Fin (n + 1) → ℤ), 0 < g ∧ x = (g : ℤ) • y ∧ IsPrimitiveZero F y := by sorry

theorem exists_isPrimitiveZero_of_rat (hF : F.IsHomogeneous e) {ξ : Fin (n + 1) → ℚ} (hξ : ξ ≠ 0)
    (h0 : MvPolynomial.eval ξ (F.map (Int.castRingHom ℚ)) = 0) :
    ∃ (c : ℚ) (y : Fin (n + 1) → ℤ), IsPrimitiveZero F y ∧ ξ = c • fun i => (y i : ℚ) := by sorry

theorem IsPrimitiveZero.ne_zero {x : Fin (n + 1) → ℤ} (hx : IsPrimitiveZero F x) : x ≠ 0 := by
  sorry

end PrimitiveZeroAPI

open MvPolynomial in
theorem isPrimitiveZero_iff_pythagorean (a b c : ℤ) :
    IsPrimitiveZero (X 0 ^ 2 + X 1 ^ 2 - X 2 ^ 2 : MvPolynomial (Fin 3) ℤ) ![a, b, c] ↔
      PythagoreanTriple a b c ∧ Finset.univ.gcd ![a, b, c] = 1 := by sorry

open MvPolynomial in
/-- Unit test `isPrimitiveZero_three_four_five`. -/
example : IsPrimitiveZero (X 0 ^ 2 + X 1 ^ 2 - X 2 ^ 2 : MvPolynomial (Fin 3) ℤ) ![3, 4, 5] := by
  sorry

open MvPolynomial in
/-- Unit test `not_isPrimitiveZero_six_eight_ten`. -/
example : MvPolynomial.eval ![6, 8, 10] (X 0 ^ 2 + X 1 ^ 2 - X 2 ^ 2 : MvPolynomial (Fin 3) ℤ) = 0 ∧
    ¬ IsPrimitiveZero (X 0 ^ 2 + X 1 ^ 2 - X 2 ^ 2 : MvPolynomial (Fin 3) ℤ) ![6, 8, 10] := by sorry

/-- Unit test `not_isPrimitiveZero_zero`. -/
example {n : ℕ} (F : MvPolynomial (Fin (n + 1)) ℤ) : ¬ IsPrimitiveZero F 0 := by sorry

open MvPolynomial in
/-- Unit test `isPrimitiveZero_pythagorean_compat`. -/
example : IsPrimitiveZero (X 0 ^ 2 + X 1 ^ 2 - X 2 ^ 2 : MvPolynomial (Fin 3) ℤ) ![5, 12, 13] ∧
    PythagoreanTriple 5 12 13 := by sorry

/-- CA.4/primitive-zeros-and-rational-projective-points. -/
theorem primitiveZero_projectivization {n e : ℕ} {F : MvPolynomial (Fin (n + 1)) ℤ}
    (hF : F.IsHomogeneous e) (he : 1 ≤ e) :
    ∃ f : {x // IsPrimitiveZero F x} → ℙ ℚ (Fin (n + 1) → ℚ),
      (∀ x, MvPolynomial.eval (f x).rep (F.map (Int.castRingHom ℚ)) = 0) ∧
      (∀ P : ℙ ℚ (Fin (n + 1) → ℚ), MvPolynomial.eval P.rep (F.map (Int.castRingHom ℚ)) = 0 →
        ∃ x, f x = P) ∧
      (∀ x y, f x = f y ↔ x.1 = y.1 ∨ x.1 = -y.1) := by sorry

/-- CA.4/local-solubility-of-a-primitive-zero. -/
theorem IsPrimitiveZero.locally_soluble {n : ℕ} {F : MvPolynomial (Fin (n + 1)) ℤ}
    {x : Fin (n + 1) → ℤ} (hx : IsPrimitiveZero F x) (p : ℕ) [Fact p.Prime] (k : ℕ) :
    MvPolynomial.eval (fun i => (x i : ZMod (p ^ k))) (F.map (Int.castRingHom _)) = 0 ∧
      (∃ i, ¬ (p : ℤ) ∣ x i) ∧
      MvPolynomial.eval (fun i => (x i : ℤ_[p])) (F.map (Int.castRingHom _)) = 0 ∧
      (∃ i, IsUnit (x i : ℤ_[p])) ∧
      MvPolynomial.eval (fun i => (x i : ℝ)) (F.map (Int.castRingHom ℝ)) = 0 := by sorry

/-- CA.4/rational-points-of-y2-x3-plus-x: the only affine rational point of y² = x³ + x is
(0, 0). -/
theorem rat_points_y_sq_eq_x_cube_add_x (x y : ℚ) :
    (WeierstrassCurve.mk 0 0 0 1 0 : WeierstrassCurve ℚ).toAffine.Equation x y ↔ x = 0 ∧ y = 0 := by
  sorry

end CA4

end TauCeti.ClassicalArithmetic


-- ===== CA.5 =====

/-!
## CA.5 Number-field arithmetic handoff

Suggested forms for the comparison declarations of layer CA.5 (see the roadmap document, section
CA.5). This section uses the matrix normal forms of section `CA3` (`IntMatrix.SmithCertificate`,
`IntMatrix.IsHermiteNormalForm`) and must follow it in the merged file. The Tau Ceti inputs it
rests on (`IsDedekindDomain.HeightOneSpectrum.classGroupMk`,
`ClassGroup.mk0_mem_closure_of_count_eq`,
`TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr`,
`NumberField.discr_eq_of_integralBasis`, `NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`,
`NumberField.discr_eq_of_squarefree_of_mod_four_eq_one`,
`NumberField.discr_eq_four_mul_of_mod_four_ne_one`) would be imported from
`TauCeti.RingTheory.ClassGroup.HeightOneSpectrum`, `TauCeti.NumberTheory.NumberField.Index.Discriminant`,
`TauCeti.NumberTheory.NumberField.Discriminant.OfIntegralBasis` and
`TauCeti.NumberTheory.NumberField.Quadratic.RingOfIntegers`; Tau Ceti is not built in the
environment that checked this file, so the statements are phrased in Mathlib vocabulary.

The certified-output interpretation of `ComputationalNumberTheory:CN.2`
(CA.5/certified-number-field-output-interpretation) is not prototyped here: its statement is about
the certificate types that layer defines, which do not exist yet.
-/

noncomputable section

open Polynomial NumberField
open scoped nonZeroDivisors

namespace TauCeti.ClassicalArithmetic

section CA5

variable {K : Type*} [Field K] [NumberField K]

/-! ### Class groups from generators and relations -/

/-- **Small primes generate the class group** (CA.5/class-group-generated-by-small-primes): the
classes of the nonzero primes of absolute norm at most Mathlib's Minkowski bound
`(4/π)^r₂ · n!/nⁿ · √|d_K|` generate the class group. -/
theorem closure_classes_primes_norm_le_eq_top :
    Subgroup.closure {C : ClassGroup (𝓞 K) | ∃ P : (Ideal (𝓞 K))⁰, (P : Ideal (𝓞 K)).IsPrime ∧
      ((Ideal.absNorm (P : Ideal (𝓞 K)) : ℝ) ≤
        (4 / Real.pi) ^ NumberField.InfinitePlace.nrComplexPlaces K *
          ((Nat.factorial (Module.finrank ℚ K) : ℝ) / (Module.finrank ℚ K : ℝ) ^ (Module.finrank ℚ K) *
            √|(NumberField.discr K : ℝ)|)) ∧
      ClassGroup.mk0 P = C} = ⊤ := by
  sorry

/-- **The class-group presentation** (CA.5/class-group-presentation): `e ↦ ∏ [Iᵢ]^eᵢ`. -/
def classGroupPresentation {N : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰) :
    Multiplicative (Fin N → ℤ) →* ClassGroup (𝓞 K) where
  toFun e := ∏ i, ClassGroup.mk0 (I i) ^ (Multiplicative.toAdd e i)
  map_one' := sorry
  map_mul' := sorry

/-- The relation lattice: the exponent vectors whose ideal product is principal. -/
def relationLattice {N : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰) : Submodule ℤ (Fin N → ℤ) where
  carrier := {e | classGroupPresentation I (Multiplicative.ofAdd e) = 1}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

namespace ClassGroupPresentation

variable {N : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰)

/-- A basis vector goes to the class of the corresponding ideal. -/
theorem single (i : Fin N) :
    classGroupPresentation I (Multiplicative.ofAdd (Pi.single i 1)) = ClassGroup.mk0 (I i) := by
  sorry

/-- Membership in the relation lattice. -/
theorem mem_relationLattice_iff (e : Fin N → ℤ) :
    e ∈ relationLattice I ↔ classGroupPresentation I (Multiplicative.ofAdd e) = 1 :=
  Iff.rfl

/-- A nonnegative relation is a principal product of ideals. -/
theorem mem_relationLattice_iff_isPrincipal (e : Fin N → ℤ) (he : ∀ i, 0 ≤ e i) :
    e ∈ relationLattice I ↔
      Submodule.IsPrincipal (∏ i, (I i : Ideal (𝓞 K)) ^ (e i).toNat) := by
  sorry

/-- The presentation is surjective exactly when the classes of the `Iᵢ` generate. -/
theorem surjective_iff :
    Function.Surjective (classGroupPresentation I) ↔
      Subgroup.closure (Set.range fun i => ClassGroup.mk0 (I i)) = ⊤ := by
  sorry

/-- A surjective presentation identifies the class group with `ℤ^N / Λ`. -/
def classGroupEquiv (hs : Function.Surjective (classGroupPresentation I)) :
    Additive (ClassGroup (𝓞 K)) ≃+ ((Fin N → ℤ) ⧸ relationLattice I) := by
  sorry

/-- The relation lattice then has index the class number. -/
theorem index_relationLattice (hs : Function.Surjective (classGroupPresentation I)) :
    (relationLattice I).toAddSubgroup.index = classNumber K := by
  sorry

end ClassGroupPresentation

/-- Unit test `TauCeti.ClassicalArithmetic.relationLattice_empty`: with no generators every vector
is a relation. -/
example (I : Fin 0 → (Ideal (𝓞 K))⁰) : relationLattice I = ⊤ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.relationLattice_classNumber_one`: in a field of class
number one every vector is a relation. -/
example {N : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰) (h : classNumber K = 1) : relationLattice I = ⊤ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.relationLattice_principal_generator`: a principal ideal
among the generators gives a unit relation, although the ideal need not be the unit ideal. -/
example {N : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰) (i : Fin N)
    (h : Submodule.IsPrincipal (I i : Ideal (𝓞 K))) : Pi.single i 1 ∈ relationLattice I := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.relationLattice_order`: the order of a class gives a
relation, and no smaller multiple does. -/
example {N : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰) (i : Fin N) (k : ℤ) :
    k • Pi.single i 1 ∈ relationLattice I ↔ (orderOf (ClassGroup.mk0 (I i)) : ℤ) ∣ k := by
  sorry

/-- **The class group of a relation matrix** (CA.5/class-group-of-a-relation-matrix). -/
theorem nonempty_classGroup_equiv_of_relationMatrix {N R : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰)
    (hgen : Function.Surjective (classGroupPresentation I)) (A : Matrix (Fin N) (Fin R) ℤ)
    (hA : LinearMap.range A.mulVecLin = relationLattice I) (c : IntMatrix.SmithCertificate A) :
    c.rank = N ∧ Nonempty (Additive (ClassGroup (𝓞 K)) ≃+ Π i : Fin c.rank, ZMod (c.d i)) ∧
      classNumber K = ∏ i, c.d i := by
  sorry

/-- **Found relations bound the class number** (CA.5/class-number-divides-relation-determinant). -/
theorem classNumber_mul_relIndex_eq_natAbs_det {N : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰)
    (hgen : Function.Surjective (classGroupPresentation I)) (A : Matrix (Fin N) (Fin N) ℤ)
    (hA : LinearMap.range A.mulVecLin ≤ relationLattice I) (hdet : A.det ≠ 0) :
    classNumber K * (LinearMap.range A.mulVecLin).toAddSubgroup.relIndex
      (relationLattice I).toAddSubgroup = A.det.natAbs := by
  sorry

/-! ### Units -/

/-- **A regulator bound certifies a fundamental system** (CA.5/fundamental-units-from-regulator-bound). -/
theorem closure_sup_torsion_eq_top_of_regOfFamily_lt_two_mul
    {u : Fin (NumberField.Units.rank K) → (𝓞 K)ˣ} (hu : NumberField.Units.IsMaxRank u) {L : ℝ}
    (hL : L ≤ NumberField.Units.regulator K) (hlt : NumberField.Units.regOfFamily u < 2 * L) :
    Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤ := by
  sorry

/-- **The class-number–regulator certificate** (CA.5/class-number-regulator-certificate). -/
theorem relations_and_units_complete_of_lt_two_mul {N : ℕ} (I : Fin N → (Ideal (𝓞 K))⁰)
    (hgen : Function.Surjective (classGroupPresentation I)) (A : Matrix (Fin N) (Fin N) ℤ)
    (hA : LinearMap.range A.mulVecLin ≤ relationLattice I) (hdet : A.det ≠ 0)
    {u : Fin (NumberField.Units.rank K) → (𝓞 K)ˣ} (hu : NumberField.Units.IsMaxRank u) {hstar : ℝ}
    (hlow : hstar ≤ classNumber K * NumberField.Units.regulator K)
    (hlt : A.det.natAbs * NumberField.Units.regOfFamily u < 2 * hstar) :
    LinearMap.range A.mulVecLin = relationLattice I ∧
      Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤ := by
  sorry

/-! ### Ideals given by integer matrices -/

variable {n : ℕ}

/-- The `ℤ`-submodule of `𝓞 K` spanned by the columns of an integer matrix read in the basis `ω`. -/
def latticeOfMatrix (ω : Module.Basis (Fin n) ℤ (𝓞 K)) (H : Matrix (Fin n) (Fin n) ℤ) :
    Submodule ℤ (𝓞 K) :=
  Submodule.span ℤ (Set.range fun j => ∑ i, H i j • ω i)

/-- **The Hermite matrix of an ideal** (CA.5/ideal-hermite-matrix): the unique matrix in Hermite
normal form whose columns are the `ω`-coordinates of a `ℤ`-basis of `I`. -/
def idealHermiteMatrix (ω : Module.Basis (Fin n) ℤ (𝓞 K)) (I : (Ideal (𝓞 K))⁰) :
    Matrix (Fin n) (Fin n) ℤ := by
  sorry

namespace IdealHermiteMatrix

variable (ω : Module.Basis (Fin n) ℤ (𝓞 K))

/-- It is in Hermite normal form. -/
theorem isHermiteNormalForm (I : (Ideal (𝓞 K))⁰) :
    IntMatrix.IsHermiteNormalForm (idealHermiteMatrix ω I) := by
  sorry

/-- Its columns span the ideal. -/
theorem latticeOfMatrix_eq (I : (Ideal (𝓞 K))⁰) :
    latticeOfMatrix ω (idealHermiteMatrix ω I) = (I : Ideal (𝓞 K)).restrictScalars ℤ := by
  sorry

/-- It characterises the ideal. -/
theorem injective : Function.Injective (idealHermiteMatrix ω) := by
  sorry

/-- The interpretation of a certified matrix: a matrix is the Hermite matrix of `I` exactly when it
is in Hermite normal form and its columns span `I`. -/
theorem eq_iff (I : (Ideal (𝓞 K))⁰) (H : Matrix (Fin n) (Fin n) ℤ) :
    idealHermiteMatrix ω I = H ↔
      IntMatrix.IsHermiteNormalForm H ∧ latticeOfMatrix ω H = (I : Ideal (𝓞 K)).restrictScalars ℤ := by
  sorry

/-- With `ω 0 = 1`, the upper left entry generates `I ∩ ℤ`. -/
theorem comap_eq_span_corner (hn : 0 < n) (hω : ω ⟨0, hn⟩ = 1) (I : (Ideal (𝓞 K))⁰) :
    Ideal.comap (algebraMap ℤ (𝓞 K)) (I : Ideal (𝓞 K)) =
      Ideal.span {idealHermiteMatrix ω I ⟨0, hn⟩ ⟨0, hn⟩} := by
  sorry

/-- Membership of an element, read from its coordinates. -/
theorem mem_iff (I : (Ideal (𝓞 K))⁰) (x : 𝓞 K) :
    x ∈ (I : Ideal (𝓞 K)) ↔
      ω.equivFun x ∈ LinearMap.range (idealHermiteMatrix ω I).mulVecLin := by
  sorry

end IdealHermiteMatrix

/-- Unit test `TauCeti.ClassicalArithmetic.idealHermiteMatrix_top`: the unit ideal has the identity
matrix. -/
example (ω : Module.Basis (Fin n) ℤ (𝓞 K)) :
    idealHermiteMatrix ω ⟨⊤, mem_nonZeroDivisors_of_ne_zero (by simp)⟩ = 1 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.idealHermiteMatrix_intCast`: the ideal generated by a
positive integer `m` has the scalar matrix `m`. -/
example (ω : Module.Basis (Fin n) ℤ (𝓞 K)) (m : ℕ) (hm : 0 < m) :
    idealHermiteMatrix ω ⟨Ideal.span {(m : 𝓞 K)},
      mem_nonZeroDivisors_of_ne_zero (by simp; omega)⟩ = Matrix.scalar (Fin n) (m : ℤ) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.idealHermiteMatrix_one_add_i`: in `ℤ[i]` with basis
`(1, i)`, the ideal `(1 + i)` has Hermite matrix with columns `(2, 0)` and `(1, 1)`. -/
example (ω : Module.Basis (Fin 2) ℤ (𝓞 K)) (θ : 𝓞 K) (hθ : θ ^ 2 = -1) (h0 : ω 0 = 1)
    (h1 : ω 1 = θ) (hI : Ideal.span {1 + θ} ≠ ⊥) :
    idealHermiteMatrix ω ⟨Ideal.span {1 + θ}, mem_nonZeroDivisors_of_ne_zero hI⟩ =
      !![(2 : ℤ), 1; 0, 1] := by
  sorry

/-- **The norm of an ideal is the product of its Hermite pivots**
(CA.5/ideal-norm-eq-prod-hermite-diagonal). -/
theorem absNorm_eq_prod_diag_idealHermiteMatrix (ω : Module.Basis (Fin n) ℤ (𝓞 K))
    (I : (Ideal (𝓞 K))⁰) :
    Ideal.absNorm (I : Ideal (𝓞 K)) = ∏ i, (idealHermiteMatrix ω I i i).natAbs := by
  sorry

/-- **Which Hermite matrices are ideals** (CA.5/hermite-matrix-of-an-ideal-criterion). -/
theorem exists_idealHermiteMatrix_eq_iff (ω : Module.Basis (Fin n) ℤ (𝓞 K))
    {H : Matrix (Fin n) (Fin n) ℤ} (hH : IntMatrix.IsHermiteNormalForm H) :
    (∃ I : (Ideal (𝓞 K))⁰, idealHermiteMatrix ω I = H) ↔
      ∀ j, ∀ x ∈ latticeOfMatrix ω H, ω j * x ∈ latticeOfMatrix ω H := by
  sorry

/-! ### Presentations: discriminants, indices and Dedekind–Kummer -/

/-- **Discriminant of a sublattice basis** (CA.5/discriminant-of-a-sublattice-basis). -/
theorem discr_eq_index_sq_mul_discr (b : Fin n → 𝓞 K) (hb : LinearIndependent ℤ b)
    (hn : n = Module.finrank ℚ K) :
    Algebra.discr ℤ b =
      ((Submodule.span ℤ (Set.range b)).toAddSubgroup.index : ℤ) ^ 2 * NumberField.discr K := by
  sorry

/-- **The index of `ℤ[√d]`** (CA.5/index-of-the-order-z-sqrt-d). -/
theorem index_adjoin_sqrt {θ : 𝓞 K} {d : ℤ} (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) :
    (Algebra.adjoin ℤ {θ}).toSubring.toAddSubgroup.index = if d % 4 = 1 then 2 else 1 := by
  sorry

/-- **Dedekind–Kummer for a monogenic presentation**
(CA.5/kummer-dedekind-for-a-monogenic-presentation): if `𝓞 K = ℤ[θ]`, the primes over every
rational prime correspond to the monic irreducible factors of `minpoly ℤ θ mod p`. -/
def primesOverEquivMonicFactorsModOfAdjoinEqTop {θ : 𝓞 K}
    (hθ : Algebra.adjoin ℤ {θ} = ⊤) (p : ℕ) [Fact p.Prime] :
    Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 K) ≃ RingOfIntegers.monicFactorsMod θ p := by
  sorry

/-- The residue degrees match the degrees of the factors, at every prime. -/
theorem inertiaDeg_primesOverEquivMonicFactorsModOfAdjoinEqTop_symm {θ : 𝓞 K}
    (hθ : Algebra.adjoin ℤ {θ} = ⊤) (p : ℕ) [Fact p.Prime] {Q : (ZMod p)[X]}
    (hQ : Q ∈ RingOfIntegers.monicFactorsMod θ p) :
    Ideal.inertiaDeg ((primesOverEquivMonicFactorsModOfAdjoinEqTop hθ p).symm ⟨Q, hQ⟩ :
      Ideal (𝓞 K)) ℤ = Q.natDegree := by
  sorry

/-- The ramification indices are the multiplicities of the factors, at every prime. -/
theorem ramificationIdx_primesOverEquivMonicFactorsModOfAdjoinEqTop_symm {θ : 𝓞 K}
    (hθ : Algebra.adjoin ℤ {θ} = ⊤) (p : ℕ) [Fact p.Prime] {Q : (ZMod p)[X]}
    (hQ : Q ∈ RingOfIntegers.monicFactorsMod θ p) :
    Ideal.ramificationIdx ((primesOverEquivMonicFactorsModOfAdjoinEqTop hθ p).symm ⟨Q, hQ⟩ :
      Ideal (𝓞 K)) ℤ = multiplicity Q ((minpoly ℤ θ).map (Int.castRingHom (ZMod p))) := by
  sorry

/-- The prime attached to a factor `Q` is `(p, Q(θ))`. -/
theorem primesOverEquivMonicFactorsModOfAdjoinEqTop_symm_apply_eq_span {θ : 𝓞 K}
    (hθ : Algebra.adjoin ℤ {θ} = ⊤) (p : ℕ) [Fact p.Prime] {Q : ℤ[X]}
    (hQ : Q.map (Int.castRingHom (ZMod p)) ∈ RingOfIntegers.monicFactorsMod θ p) :
    ((primesOverEquivMonicFactorsModOfAdjoinEqTop hθ p).symm
      ⟨Q.map (Int.castRingHom (ZMod p)), hQ⟩ : Ideal (𝓞 K)) = Ideal.span {(p : 𝓞 K), aeval θ Q} := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_three`: `3` is inert in `ℤ[i]`. -/
example {θ : 𝓞 K} (hθ : Algebra.adjoin ℤ {θ} = ⊤) (hmin : minpoly ℤ θ = X ^ 2 + 1)
    [Fact (Nat.Prime 3)] : Nat.card (Ideal.primesOver (Ideal.span {(3 : ℤ)}) (𝓞 K)) = 1 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_five`: `5` splits in `ℤ[i]`. -/
example {θ : 𝓞 K} (hθ : Algebra.adjoin ℤ {θ} = ⊤) (hmin : minpoly ℤ θ = X ^ 2 + 1)
    [Fact (Nat.Prime 5)] : Nat.card (Ideal.primesOver (Ideal.span {(5 : ℤ)}) (𝓞 K)) = 2 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_two`: `2` ramifies in `ℤ[i]`:
one prime, with ramification index `2`, although `2` divides the discriminant. -/
example {θ : 𝓞 K} (hθ : Algebra.adjoin ℤ {θ} = ⊤) (hmin : minpoly ℤ θ = X ^ 2 + 1)
    [Fact (Nat.Prime 2)] :
    Nat.card (Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)) = 1 ∧
      ∀ P : Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K),
        Ideal.ramificationIdx (P : Ideal (𝓞 K)) ℤ = 2 := by
  sorry

/-! ### Quadratic presentations and units -/

/-- **`ℤ√d` inside the ring of integers** (CA.5/zsqrtd-into-the-ring-of-integers). -/
def zsqrtdToRingOfIntegers {d : ℤ} (θ : 𝓞 K) (hθ : θ * θ = d) : ℤ√d →+* 𝓞 K :=
  Zsqrtd.lift ⟨θ, hθ⟩

namespace ZsqrtdToRingOfIntegers

variable {d : ℤ} {θ : 𝓞 K} (hθ : θ * θ = d)

/-- `√d` goes to `θ`. -/
theorem sqrtd : zsqrtdToRingOfIntegers θ hθ ⟨0, 1⟩ = θ := by
  sorry

/-- The image is `ℤ[θ]`. -/
theorem range_eq : (zsqrtdToRingOfIntegers θ hθ).range = (Algebra.adjoin ℤ {θ}).toSubring := by
  sorry

/-- The map is injective when `d` is not a square. -/
theorem injective (hd : ¬ IsSquare d) : Function.Injective (zsqrtdToRingOfIntegers θ hθ) := by
  sorry

/-- It is bijective exactly when `d ≢ 1 (mod 4)`. -/
theorem bijective_iff (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (hsf : Squarefree d) :
    Function.Bijective (zsqrtdToRingOfIntegers θ hθ) ↔ d % 4 ≠ 1 := by
  sorry

/-- It carries the norm form of `ℤ√d` to the field norm. -/
theorem norm (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (x : ℤ√d) : Algebra.norm ℤ (zsqrtdToRingOfIntegers θ hθ x) = x.norm := by
  sorry

end ZsqrtdToRingOfIntegers

/-- Unit test `TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_gaussian`: for `d = -1` the map
is an isomorphism onto the ring of integers of `ℚ(i)`. -/
example {θ : 𝓞 K} (hθ : θ * θ = ((-1 : ℤ) : 𝓞 K)) (hmin : minpoly ℤ θ = X ^ 2 - C (-1))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    Function.Bijective (zsqrtdToRingOfIntegers (d := -1) θ hθ) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_five_not_surjective`: for `d = 5`
the map misses `(1 + √5)/2`. -/
example {θ : 𝓞 K} (hθ : θ * θ = ((5 : ℤ) : 𝓞 K)) (hmin : minpoly ℤ θ = X ^ 2 - C 5)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    ¬ Function.Surjective (zsqrtdToRingOfIntegers (d := 5) θ hθ) := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_norm_example`: `3 + 2√d` has norm
`9 - 4d`. -/
example {d : ℤ} {θ : 𝓞 K} (hθ : θ * θ = d) (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    Algebra.norm ℤ (zsqrtdToRingOfIntegers θ hθ ⟨3, 2⟩) = 9 - 4 * d := by
  sorry

/-- **Pell solutions are the norm-one units** (CA.5/pell-solutions-are-norm-one-units). -/
theorem nonempty_pell_mulEquiv_normOneUnits {d : ℤ} {θ : 𝓞 K} (hθ : θ * θ = d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (hsf : Squarefree d) (hd4 : d % 4 ≠ 1) (hpos : 0 < d) :
    Nonempty (Pell.Solution₁ d ≃* (Units.map (Algebra.norm ℤ : 𝓞 K →* ℤ)).ker) := by
  sorry

/-- **The negative Pell equation and units of norm `-1`**
(CA.5/negative-pell-iff-unit-of-norm-minus-one). -/
theorem exists_neg_pell_iff_exists_unit_norm_neg_one {d : ℤ} {θ : 𝓞 K} (hθ : θ * θ = d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (hsf : Squarefree d) (hd4 : d % 4 ≠ 1) (hpos : 0 < d) :
    (∃ x y : ℤ, x ^ 2 - d * y ^ 2 = -1) ↔ ∃ u : (𝓞 K)ˣ, Algebra.norm ℤ (u : 𝓞 K) = -1 := by
  sorry

/-! ### Worked comparisons -/

/-- **The class group of `ℚ(√-14)`** (CA.5/class-group-of-q-sqrt-minus-14): cyclic of order `4`. -/
theorem nonempty_classGroup_sqrt_neg_fourteen {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 2 - C (-14))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    Nonempty (Additive (ClassGroup (𝓞 K)) ≃+ ZMod 4) := by
  sorry

/-- **The class group of `ℚ(√-30)`** (CA.5/class-group-of-q-sqrt-minus-30): `ℤ/2 × ℤ/2`, not
cyclic, with the same class number `4` as `ℚ(√-14)`. -/
theorem nonempty_classGroup_sqrt_neg_thirty {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 2 - C (-30))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    Nonempty (Additive (ClassGroup (𝓞 K)) ≃+ ZMod 2 × ZMod 2) := by
  sorry

end CA5

end TauCeti.ClassicalArithmetic


-- ===== CA.6 =====

/-! ## CA.6 Special algebraic numbers and Mahler measure

Conventions (pinned in the roadmap document, section CA.6):

* For an algebraic integer `α` the Mahler measure `M(α)` is Mathlib's `Polynomial.mahlerMeasure` of
  `minpoly ℤ α` mapped to `ℂ[X]`; this is written out below. For an arbitrary algebraic number the
  roadmap uses `DiophantineApproximation.mahlerMeasure` (the Mahler measure of the primitive minimal
  polynomial, DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number), which
  is not built at the pinned commits. Statements about arbitrary algebraic numbers are therefore given
  through `NumberField.absMulHeight₁ α ^ deg α`, which equals `M(α)` by
  DiophantineApproximationAndTranscendence:DT.0/height-comparisons.
* The house `⌈α⌉` is DT.0's `DiophantineApproximation.house` (not built); below it appears either as
  Mathlib's `NumberField.house` for an element of a number field, or through the complex roots of
  `minpoly ℤ α`.
* The canonical height of a polarised endomorphism is ArithmeticDynamics:DY.1's (not built); the
  comparison for the power map is stated through Tate's limit of `NumberField.absLogHeight₁`.
-/

namespace TauCeti.ClassicalArithmetic

section CA6

open Polynomial Filter Topology
open scoped IntermediateField

/-! ### Pisot numbers (CA.6/pisot-number) -/

/-- A **Pisot number**: a real algebraic integer `θ > 1` all of whose other complex conjugates lie
in the open unit disc `|z| < 1`. Degree-one Pisot numbers are the integers `n ≥ 2`. -/
def IsPisot (θ : ℝ) : Prop :=
  IsIntegral ℤ θ ∧ 1 < θ ∧ ∀ z ∈ (minpoly ℤ θ).aroots ℂ, z ≠ (θ : ℂ) → ‖z‖ < 1

theorem IsPisot.isIntegral {θ : ℝ} (h : IsPisot θ) : IsIntegral ℤ θ := h.1

theorem IsPisot.one_lt {θ : ℝ} (h : IsPisot θ) : 1 < θ := h.2.1

theorem IsPisot.norm_lt_one {θ : ℝ} (h : IsPisot θ) {z : ℂ} (hz : z ∈ (minpoly ℤ θ).aroots ℂ)
    (hne : z ≠ θ) : ‖z‖ < 1 := h.2.2 z hz hne

theorem IsPisot.eq_of_one_le_norm {θ : ℝ} (h : IsPisot θ) {z : ℂ}
    (hz : z ∈ (minpoly ℤ θ).aroots ℂ) (h1 : 1 ≤ ‖z‖) : z = θ := by sorry

theorem isPisot_iff_minpoly_rat {θ : ℝ} :
    IsPisot θ ↔ IsIntegral ℤ θ ∧ 1 < θ ∧
      ∀ z ∈ (minpoly ℚ θ).aroots ℂ, z ≠ (θ : ℂ) → ‖z‖ < 1 := by sorry

theorem isPisot_natCast_iff (n : ℕ) : IsPisot (n : ℝ) ↔ 2 ≤ n := by sorry

/-- Unit test `IsPisot.test_goldenRatio`: the golden ratio is a Pisot number. -/
example : IsPisot Real.goldenRatio := by sorry

/-- Unit test `IsPisot.test_two`: the degree-one Pisot number `2`. -/
example : IsPisot 2 := by sorry

/-- Unit test `IsPisot.test_not_one`: `1` is not a Pisot number (the inequality `1 < θ` is strict). -/
example : ¬ IsPisot 1 := by sorry

/-- Unit test `IsPisot.test_not_threeHalves`: `3/2` is not a Pisot number (not an algebraic
integer, although it has no other conjugate). -/
example : ¬ IsPisot (3 / 2) := by sorry

/-- Unit test `IsPisot.test_not_sqrtTwo`: `√2` is not a Pisot number (its conjugate `-√2`). -/
example : ¬ IsPisot (Real.sqrt 2) := by sorry

/-- Unit test `IsPisot.test_mahlerMeasure_goldenRatio`: `M(X² - X - 1) = φ`. -/
example : ((minpoly ℤ Real.goldenRatio).map (Int.castRingHom ℂ)).mahlerMeasure =
    Real.goldenRatio := by sorry

/-! ### Salem numbers (CA.6/salem-number) -/

/-- A **Salem number**: a real algebraic integer `τ > 1` all of whose other complex conjugates lie
in the closed unit disc `|z| ≤ 1`, at least one of them on the unit circle. -/
def IsSalem (τ : ℝ) : Prop :=
  IsIntegral ℤ τ ∧ 1 < τ ∧ (∀ z ∈ (minpoly ℤ τ).aroots ℂ, z ≠ (τ : ℂ) → ‖z‖ ≤ 1) ∧
    ∃ z ∈ (minpoly ℤ τ).aroots ℂ, ‖z‖ = 1

theorem IsSalem.isIntegral {τ : ℝ} (h : IsSalem τ) : IsIntegral ℤ τ := h.1

theorem IsSalem.one_lt {τ : ℝ} (h : IsSalem τ) : 1 < τ := h.2.1

theorem IsSalem.norm_le_one {τ : ℝ} (h : IsSalem τ) {z : ℂ} (hz : z ∈ (minpoly ℤ τ).aroots ℂ)
    (hne : z ≠ τ) : ‖z‖ ≤ 1 := h.2.2.1 z hz hne

theorem IsSalem.exists_norm_eq_one {τ : ℝ} (h : IsSalem τ) :
    ∃ z ∈ (minpoly ℤ τ).aroots ℂ, ‖z‖ = 1 := h.2.2.2

theorem IsSalem.not_isPisot {τ : ℝ} (h : IsSalem τ) : ¬ IsPisot τ := by sorry

theorem IsSalem.isConjRoot_inv {τ : ℝ} (h : IsSalem τ) : IsConjRoot ℚ τ τ⁻¹ := by sorry

theorem IsSalem.four_le_natDegree {τ : ℝ} (h : IsSalem τ) : 4 ≤ (minpoly ℤ τ).natDegree := by sorry

theorem IsSalem.even_natDegree {τ : ℝ} (h : IsSalem τ) : Even (minpoly ℤ τ).natDegree := by sorry

/-- Unit test `IsSalem.test_quartic`: the largest real root `2.1537…` of
`X⁴ - 3X³ + 3X² - 3X + 1` is a Salem number. -/
example : IsSalem (sSup {x : ℝ | x ^ 4 - 3 * x ^ 3 + 3 * x ^ 2 - 3 * x + 1 = 0}) := by sorry

/-- Unit test `IsSalem.test_not_two`: the integer `2` is not a Salem number. -/
example : ¬ IsSalem 2 := by sorry

/-- Unit test `IsSalem.test_not_quadraticUnit`: the reciprocal quadratic unit `(3 + √5)/2` is not a
Salem number (its other conjugate lies strictly inside the unit disc). -/
example : ¬ IsSalem ((3 + Real.sqrt 5) / 2) := by sorry

/-- Unit test `IsSalem.test_not_goldenRatio`: the golden ratio is not a Salem number. -/
example : ¬ IsSalem Real.goldenRatio := by sorry

/-- Unit test `IsSalem.test_mahlerMeasure_quartic`: the Mahler measure of
`X⁴ - 3X³ + 3X² - 3X + 1` is its largest real root. -/
example : ((X ^ 4 - 3 * X ^ 3 + 3 * X ^ 2 - 3 * X + 1 : ℤ[X]).map (Int.castRingHom ℂ)).mahlerMeasure =
    sSup {x : ℝ | x ^ 4 - 3 * x ^ 3 + 3 * x ^ 2 - 3 * x + 1 = 0} := by sorry

/-! ### The classification and its certificates -/

open scoped Classical in
/-- CA.6/pisot-and-salem-numbers: the classification of a real algebraic integer `τ > 1` by the
moduli of the roots of its minimal polynomial. `τ` is Pisot iff it is the only root outside the open
unit disc and no root lies on the circle; `τ` is Salem iff it is the only root of modulus `> 1` and
some root lies on the circle. -/
theorem pisot_salem_classification {τ : ℝ} (hτ : IsIntegral ℤ τ) (h1 : 1 < τ) :
    (IsPisot τ ↔ ((minpoly ℤ τ).aroots ℂ).countP (fun z => 1 < ‖z‖) = 1 ∧
        ((minpoly ℤ τ).aroots ℂ).countP (fun z => ‖z‖ = 1) = 0) ∧
      (IsSalem τ ↔ ((minpoly ℤ τ).aroots ℂ).countP (fun z => 1 < ‖z‖) = 1 ∧
        0 < ((minpoly ℤ τ).aroots ℂ).countP (fun z => ‖z‖ = 1)) := by sorry

/-- CA.6/pisot-certificate: a real root `θ > 1` of a monic integer polynomial all of whose other
roots lie in the open unit disc is a Pisot number; no irreducibility is needed. -/
theorem isPisot_of_aeval_eq_zero {P : ℤ[X]} (hP : P.Monic) {θ : ℝ} (h1 : 1 < θ)
    (hroot : aeval θ P = 0) (hconj : ∀ z ∈ (P.aroots ℂ).erase (θ : ℂ), ‖z‖ < 1) :
    IsPisot θ := by sorry

/-- CA.6/reciprocal-iff-reverse: a nonzero algebraic integer is conjugate to its inverse iff its
minimal polynomial over `ℤ` is reciprocal, `X^d P(1/X) = ±P(X)`. -/
theorem isConjRoot_inv_iff_reverse {K : Type*} [Field K] [CharZero K] {α : K}
    (hα : IsIntegral ℤ α) (h0 : α ≠ 0) :
    IsConjRoot ℚ α α⁻¹ ↔ (minpoly ℤ α).reverse = minpoly ℤ α ∨
      (minpoly ℤ α).reverse = -minpoly ℤ α := by sorry

/-- CA.6/salem-number-conjugates (Salem's lemma): the usual definition of a Salem number agrees
with the one of degree at least 4, conjugate to its inverse, all other conjugates on the circle. -/
theorem isSalem_iff_conjugates {τ : ℝ} :
    IsSalem τ ↔ IsIntegral ℤ τ ∧ 1 < τ ∧ 4 ≤ (minpoly ℤ τ).natDegree ∧ IsConjRoot ℚ τ τ⁻¹ ∧
      ∀ z ∈ (minpoly ℤ τ).aroots ℂ, z ≠ (τ : ℂ) → z ≠ (τ : ℂ)⁻¹ → ‖z‖ = 1 := by sorry

/-- CA.6/salem-minpoly-reciprocal: the minimal polynomial of a Salem number is reciprocal. -/
theorem IsSalem.reverse_minpoly {τ : ℝ} (h : IsSalem τ) :
    (minpoly ℤ τ).reverse = minpoly ℤ τ := by sorry

/-- CA.6/salem-number-pow: positive powers of a Salem number are Salem numbers of the same degree. -/
theorem IsSalem.pow {τ : ℝ} (h : IsSalem τ) {n : ℕ} (hn : 0 < n) :
    IsSalem (τ ^ n) ∧ (minpoly ℤ (τ ^ n)).natDegree = (minpoly ℤ τ).natDegree := by sorry

/-- CA.6/pisot-number-pow: positive powers of a Pisot number are Pisot numbers. -/
theorem IsPisot.pow {θ : ℝ} (h : IsPisot θ) {n : ℕ} (hn : 0 < n) : IsPisot (θ ^ n) := by sorry

/-- CA.6/salem-number-iff-trace (Salem, Proposition 3(i) of Smyth's Salem survey): `τ > 1` is a
Salem number iff `α = τ + τ⁻¹` is an irrational algebraic integer all of whose other conjugates are
real and lie in `(-2, 2)`. -/
theorem isSalem_iff_add_inv {τ : ℝ} (h1 : 1 < τ) :
    IsSalem τ ↔ IsIntegral ℤ (τ + τ⁻¹) ∧ Irrational (τ + τ⁻¹) ∧
      ∀ z ∈ (minpoly ℤ (τ + τ⁻¹)).aroots ℂ, z ≠ ((τ + τ⁻¹ : ℝ) : ℂ) → z.im = 0 ∧ |z.re| < 2 := by
  sorry

/-- CA.6/salem-number-in-field (Proposition 3(ii)): a Salem number in `ℚ(τ)` generates `ℚ(τ)`, and a
larger one divided by `τ` is again a Salem number. -/
theorem IsSalem.div_of_mem_adjoin {τ τ' : ℝ} (hτ : IsSalem τ) (hτ' : IsSalem τ') (hmem : τ' ∈ ℚ⟮τ⟯) :
    ℚ⟮τ'⟯ = ℚ⟮τ⟯ ∧ (τ < τ' → IsSalem (τ' / τ)) := by sorry

/-- CA.6/salem-numbers-in-field-powers (Proposition 3(iii)): the Salem numbers of `ℚ(τ)` are the
positive powers of the smallest one. -/
theorem IsSalem.exists_pow_generator {τ : ℝ} (hτ : IsSalem τ) :
    ∃ τ₁ : ℝ, IsSalem τ₁ ∧ τ₁ ∈ ℚ⟮τ⟯ ∧
      ∀ τ' ∈ ℚ⟮τ⟯, IsSalem τ' ↔ ∃ n : ℕ, 0 < n ∧ τ' = τ₁ ^ n := by sorry

/-- CA.6/salem-number-near-integers (Proposition 4): for a Salem number `τ` and `ε > 0` some `c > 0`
has `‖c τⁿ‖ < ε` for every `n`, where `‖·‖` is the distance to the nearest integer. -/
theorem IsSalem.exists_near_integers {τ : ℝ} (hτ : IsSalem τ) {ε : ℝ} (hε : 0 < ε) :
    ∃ c : ℝ, 0 < c ∧ ∀ n : ℕ, |c * τ ^ n - round (c * τ ^ n)| < ε := by sorry

/-- CA.6/pisot-number-pow-near-integer: the powers of a Pisot number tend to integers. -/
theorem IsPisot.tendsto_dist_round {θ : ℝ} (h : IsPisot θ) :
    Tendsto (fun n : ℕ => |θ ^ n - round (θ ^ n)|) atTop (𝓝 0) := by sorry

/-- CA.6/mahler-measure-of-pisot-or-salem: a real algebraic integer `τ > 1` whose other conjugates lie
in the closed unit disc (a Pisot or a Salem number) has `M(τ) = ⌈τ⌉ = τ`. -/
theorem mahlerMeasure_eq_self_of_norm_le_one {τ : ℝ} (hτ : IsIntegral ℤ τ) (h1 : 1 < τ)
    (hconj : ∀ z ∈ (minpoly ℤ τ).aroots ℂ, z ≠ (τ : ℂ) → ‖z‖ ≤ 1) :
    ((minpoly ℤ τ).map (Int.castRingHom ℂ)).mahlerMeasure = τ ∧
      ∀ z ∈ (minpoly ℤ τ).aroots ℂ, ‖z‖ ≤ τ := by sorry

/-- CA.6/reciprocal-pisot-numbers: a Pisot number conjugate to its inverse is a quadratic unit with
minimal polynomial `X² - aX + 1`, `a ≥ 3`. -/
theorem IsPisot.minpoly_of_isConjRoot_inv {θ : ℝ} (h : IsPisot θ) (hrec : IsConjRoot ℚ θ θ⁻¹) :
    ∃ a : ℤ, 3 ≤ a ∧ minpoly ℤ θ = X ^ 2 - C a * X + 1 := by sorry

/-! ### The smallest Pisot number (CA.6/plastic-number) -/

/-- The **plastic number** `θ₀ = 1.3247…`, the real root of `X³ - X - 1`. -/
noncomputable def plasticNumber : ℝ := sSup {x : ℝ | x ^ 3 - x - 1 = 0}

theorem plasticNumber_cube : plasticNumber ^ 3 = plasticNumber + 1 := by sorry

theorem eq_plasticNumber_of_cube {x : ℝ} (hx : x ^ 3 = x + 1) : x = plasticNumber := by sorry

theorem plasticNumber_mem_Ioo : plasticNumber ∈ Set.Ioo (1.3247 : ℝ) 1.3248 := by sorry

theorem minpoly_plasticNumber : minpoly ℤ plasticNumber = X ^ 3 - X - 1 := by sorry

theorem isPisot_plasticNumber : IsPisot plasticNumber := by sorry

theorem plasticNumber_not_isConjRoot_inv : ¬ IsConjRoot ℚ plasticNumber plasticNumber⁻¹ := by sorry

theorem mahlerMeasure_plasticNumber :
    ((X ^ 3 - X - 1 : ℤ[X]).map (Int.castRingHom ℂ)).mahlerMeasure = plasticNumber := by sorry

/-- Unit test `plasticNumber.test_lt_goldenRatio`: `θ₀ < φ`. -/
example : plasticNumber < Real.goldenRatio := by sorry

/-- Unit test `plasticNumber.test_goldenRatio_lt_sq`: `φ < θ₀²`. -/
example : Real.goldenRatio < plasticNumber ^ 2 := by sorry

/-- Unit test `plasticNumber.test_neg_isRoot`: `-θ₀` is the real root of `X³ - X + 1`, so defining
`θ₀` from that polynomial gives a negative number. -/
example : (-plasticNumber) ^ 3 - (-plasticNumber) + 1 = 0 ∧ -plasticNumber < 0 := by sorry

/-- Unit test `plasticNumber.test_irrational`: `θ₀` is irrational, so it is not one of the
degree-one Pisot numbers. -/
example : Irrational plasticNumber := by sorry

/-- CA.6/plastic-number-least-pisot (Siegel): `θ₀` is the smallest Pisot number. -/
theorem plasticNumber_le_of_isPisot {θ : ℝ} (h : IsPisot θ) : plasticNumber ≤ θ := by sorry

/-! ### Lehmer's number (CA.6/lehmer-number) -/

/-- **Lehmer's number** `τ₁₀ = 1.17628…`, the largest real root of Lehmer's polynomial
`L = X¹⁰ + X⁹ - X⁷ - X⁶ - X⁵ - X⁴ - X³ + X + 1`. -/
noncomputable def lehmerNumber : ℝ :=
  sSup {x : ℝ | x ^ 10 + x ^ 9 - x ^ 7 - x ^ 6 - x ^ 5 - x ^ 4 - x ^ 3 + x + 1 = 0}

theorem lehmerNumber_isRoot :
    lehmerNumber ^ 10 + lehmerNumber ^ 9 - lehmerNumber ^ 7 - lehmerNumber ^ 6 - lehmerNumber ^ 5 -
      lehmerNumber ^ 4 - lehmerNumber ^ 3 + lehmerNumber + 1 = 0 := by sorry

theorem one_lt_lehmerNumber : 1 < lehmerNumber := by sorry

theorem lehmerNumber_mem_Ioo : lehmerNumber ∈ Set.Ioo (1.17628 : ℝ) 1.17629 := by sorry

theorem eq_lehmerNumber_of_isRoot {x : ℝ} (hx1 : 1 < x)
    (hx : x ^ 10 + x ^ 9 - x ^ 7 - x ^ 6 - x ^ 5 - x ^ 4 - x ^ 3 + x + 1 = 0) :
    x = lehmerNumber := by sorry

theorem inv_lehmerNumber_isRoot :
    lehmerNumber⁻¹ ^ 10 + lehmerNumber⁻¹ ^ 9 - lehmerNumber⁻¹ ^ 7 - lehmerNumber⁻¹ ^ 6 -
      lehmerNumber⁻¹ ^ 5 - lehmerNumber⁻¹ ^ 4 - lehmerNumber⁻¹ ^ 3 + lehmerNumber⁻¹ + 1 = 0 := by
  sorry

theorem lehmerNumber_add_inv_isRoot :
    (lehmerNumber + lehmerNumber⁻¹) ^ 5 + (lehmerNumber + lehmerNumber⁻¹) ^ 4 -
      5 * (lehmerNumber + lehmerNumber⁻¹) ^ 3 - 5 * (lehmerNumber + lehmerNumber⁻¹) ^ 2 +
      4 * (lehmerNumber + lehmerNumber⁻¹) + 3 = 0 := by sorry

theorem mahlerMeasure_lehmerPolynomial :
    ((X ^ 10 + X ^ 9 - X ^ 7 - X ^ 6 - X ^ 5 - X ^ 4 - X ^ 3 + X + 1 : ℤ[X]).map
      (Int.castRingHom ℂ)).mahlerMeasure = lehmerNumber := by sorry

/-- Unit test `lehmerNumber.test_lt_plasticNumber`: `τ₁₀ < θ₀`: there are Salem numbers below the
smallest Pisot number. -/
example : lehmerNumber < plasticNumber := by sorry

/-- Unit test `lehmerNumber.test_add_inv_bounds`: `2 < τ₁₀ + τ₁₀⁻¹ < 2.03`. -/
example : 2 < lehmerNumber + lehmerNumber⁻¹ ∧ lehmerNumber + lehmerNumber⁻¹ < 2.03 := by sorry

/-- Unit test `lehmerNumber.test_not_isPisot`: Lehmer's number is not a Pisot number. -/
example : ¬ IsPisot lehmerNumber := by sorry

/-- Unit test `lehmerNumber.test_inv_lt_one`: the other real root `τ₁₀⁻¹` of `L` lies in `(0, 1)`. -/
example : 0 < lehmerNumber⁻¹ ∧ lehmerNumber⁻¹ < 1 := by sorry

/-- CA.6/lehmer-number-is-salem: Lehmer's number is a Salem number with minimal polynomial `L`. -/
theorem isSalem_lehmerNumber : IsSalem lehmerNumber ∧
    minpoly ℤ lehmerNumber = X ^ 10 + X ^ 9 - X ^ 7 - X ^ 6 - X ^ 5 - X ^ 4 - X ^ 3 + X + 1 := by
  sorry

/-! ### Mahler measure, house and absolute height -/

open scoped Classical in
/-- CA.6/house-mahler-measure-comparison (Smyth's survey, (6)): for an algebraic integer `α` with
`r > 0` conjugates of modulus `> 1`, `M(α)^{1/d} ≤ M(α)^{1/r} ≤ ⌈α⌉ ≤ M(α)`. -/
theorem house_mahlerMeasure_comparison {K : Type*} [Field K] [NumberField K] {α : K}
    (hα : IsIntegral ℤ α) (hr : 0 < ((minpoly ℤ α).aroots ℂ).countP (fun z => 1 < ‖z‖)) :
    ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure ^ ((1 : ℝ) / (minpoly ℤ α).natDegree) ≤
        ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure ^
          ((1 : ℝ) / ((minpoly ℤ α).aroots ℂ).countP (fun z => 1 < ‖z‖)) ∧
      ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure ^
          ((1 : ℝ) / ((minpoly ℤ α).aroots ℂ).countP (fun z => 1 < ‖z‖)) ≤ NumberField.house α ∧
      NumberField.house α ≤ ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure := by sorry

/-- CA.6/mahler-measure-of-unit-le-house: for a nonzero algebraic unit `α` of degree `d`,
`M(α) ≤ max(⌈α⌉, ⌈α⁻¹⌉)^{d/2}`. -/
theorem mahlerMeasure_le_max_house_pow {K : Type*} [Field K] [NumberField K] {α : K} (h0 : α ≠ 0)
    (hα : IsIntegral ℤ α) (hα' : IsIntegral ℤ α⁻¹) :
    ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure ≤
      max (NumberField.house α) (NumberField.house α⁻¹) ^ (((minpoly ℤ α).natDegree : ℝ) / 2) := by
  sorry

/-- CA.6/one-add-weil-height-le-house (Smyth's survey, (9)): `⌈α⌉ ≥ 1 + h(α)` for a nonzero
algebraic integer, with `h` the absolute logarithmic Weil height. -/
theorem one_add_absLogHeight₁_le_house {K : Type*} [Field K] [NumberField K] {α : K}
    (hα : IsIntegral ℤ α) (h0 : α ≠ 0) :
    1 + NumberField.absLogHeight₁ α ≤ NumberField.house α := by sorry

/-- CA.6/unit-of-mahler-measure-lt-two: an algebraic number with `M(α) < 2` is an algebraic unit. -/
theorem isIntegral_inv_of_mahlerMeasure_lt_two {K : Type*} [Field K] [CharZero K] {α : K}
    (hα : IsAlgebraic ℚ α) (h0 : α ≠ 0)
    (h : NumberField.absMulHeight₁ α ^ (minpoly ℚ α).natDegree < 2) :
    IsIntegral ℤ α ∧ IsIntegral ℤ α⁻¹ := by sorry

/-! ### Smyth's theorem -/

/-- CA.6/smyth-integer-power-series: for a monic `P ∈ ℤ[X]` with `P(0) = ±1`, the quotient
`F = P(0) P / P*` (with `P* = X^d P(1/X)` the reverse) has integer Maclaurin coefficients, and it is
constant iff `P` is reciprocal. -/
theorem smyth_quotient_series {P : ℤ[X]} (hP : P.Monic) (hunit : IsUnit (P.coeff 0)) :
    ∃ F : PowerSeries ℤ, F * (P.reverse : PowerSeries ℤ) = PowerSeries.C (P.coeff 0) * (P : PowerSeries ℤ) ∧
      ((∃ c : ℤ, F = PowerSeries.C c) ↔ (P.reverse = P ∨ P.reverse = -P)) := by sorry

/-- CA.6/smyth-nonreciprocal-lower-bound (**Smyth's theorem**): a nonzero algebraic integer that is
not conjugate to its inverse has `M(α) ≥ θ₀ = 1.3247…`. -/
theorem smyth_nonreciprocal {α : ℂ} (hα : IsIntegral ℤ α) (h0 : α ≠ 0)
    (hnr : ¬ IsConjRoot ℚ α α⁻¹) :
    plasticNumber ≤ ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure := by sorry

/-! ### Dobrowolski's lower bounds -/

/-- CA.6/frobenius-congruence-integer-polynomial: `f(X)^p ≡ f(X^p) (mod p)` in `ℤ[X₁, …, Xₙ]`. -/
theorem mvPolynomial_pow_sub_expand_dvd {σ : Type*} (p : ℕ) [Fact p.Prime] (f : MvPolynomial σ ℤ) :
    (p : MvPolynomial σ ℤ) ∣ f ^ p - MvPolynomial.expand p f := by sorry

/-- CA.6/power-sum-frobenius-congruence: the power sums `s_n` of the roots of a monic integer
polynomial are integers and `s_{np} ≡ s_n (mod p)`. -/
theorem power_sum_modEq {P : ℤ[X]} (hP : P.Monic) (p : ℕ) [Fact p.Prime] (n : ℕ) :
    ∃ a b : ℤ, ((P.aroots ℂ).map (· ^ n)).sum = a ∧ ((P.aroots ℂ).map (· ^ (n * p))).sum = b ∧
      b ≡ a [ZMOD p] := by sorry

/-- CA.6/multiset-eq-of-power-sums-eq: in characteristic zero, two multisets of the same size `d`
with the same power sums `p₁, …, p_d` are equal. -/
theorem multiset_eq_of_power_sums_eq {K : Type*} [Field K] [CharZero K] {s t : Multiset K}
    (hcard : Multiset.card s = Multiset.card t)
    (h : ∀ k ∈ Finset.Icc 1 (Multiset.card s), (s.map (· ^ k)).sum = (t.map (· ^ k)).sum) :
    s = t := by sorry

/-- CA.6/conjugate-powers-root-of-unity (Dobrowolski): if `α^k` and `α^l` are conjugate for distinct
positive `k, l`, then `α = 0` or `α` is a root of unity. -/
theorem eq_zero_or_pow_eq_one_of_isConjRoot_pow {K : Type*} [Field K] [CharZero K] {α : K}
    (hα : IsAlgebraic ℚ α) {k l : ℕ} (hk : 0 < k) (hl : 0 < l) (hkl : k ≠ l)
    (h : IsConjRoot ℚ (α ^ k) (α ^ l)) : α = 0 ∨ ∃ n : ℕ, 0 < n ∧ α ^ n = 1 := by sorry

/-- CA.6/dobrowolski-house-bound (Dobrowolski 1978): a nonzero algebraic integer of degree `d` that is
not a root of unity has `⌈α⌉ > 1 + 1/(4 e d²)`. -/
theorem dobrowolski_house {α : ℂ} (hα : IsIntegral ℤ α) (h0 : α ≠ 0)
    (hroot : ∀ n : ℕ, 0 < n → α ^ n ≠ 1) :
    ∃ z ∈ (minpoly ℤ α).aroots ℂ,
      1 + 1 / (4 * Real.exp 1 * ((minpoly ℤ α).natDegree : ℝ) ^ 2) < ‖z‖ := by sorry

/-- CA.6/norm-minpoly-pow-prime-dvd: `N_{K/ℚ}(f_α(α^p))` is an integer divisible by `p^{[K:ℚ]}`. -/
theorem norm_aeval_minpoly_pow_prime_dvd {K : Type*} [Field K] [NumberField K] {α : K}
    (hα : IsIntegral ℤ α) (p : ℕ) [Fact p.Prime] :
    ∃ m : ℤ, Algebra.norm ℚ (aeval (α ^ p) (minpoly ℤ α)) = m ∧
      (p : ℤ) ^ Module.finrank ℚ K ∣ m := by sorry

/-- CA.6/exists-prime-power-not-root: if all powers of `α` have the degree `d` of `α`, `α` is not a
root of unity, and `F ≠ 0` has degree `N ≥ 13d`, then some prime `p` with
`x < p ≤ 2x`, `x = 3(N/d) log(N/d)`, has `F(α^p) ≠ 0`. -/
theorem exists_prime_aeval_pow_ne_zero {K : Type*} [Field K] [NumberField K] {α : K}
    (hα : IsIntegral ℤ α) (h0 : α ≠ 0) (hroot : ∀ n : ℕ, 0 < n → α ^ n ≠ 1)
    (hdeg : ∀ n : ℕ, 0 < n → (minpoly ℚ (α ^ n)).natDegree = (minpoly ℚ α).natDegree)
    {F : ℤ[X]} (hF : F ≠ 0) (hN : 13 * (minpoly ℚ α).natDegree ≤ F.natDegree) :
    ∃ p : ℕ, p.Prime ∧
      3 * ((F.natDegree : ℝ) / (minpoly ℚ α).natDegree) *
          Real.log ((F.natDegree : ℝ) / (minpoly ℚ α).natDegree) < p ∧
      (p : ℝ) ≤ 6 * ((F.natDegree : ℝ) / (minpoly ℚ α).natDegree) *
          Real.log ((F.natDegree : ℝ) / (minpoly ℚ α).natDegree) ∧
      aeval (α ^ p) F ≠ 0 := by sorry

/-- CA.6/degree-drop-mahler-measure: if some power of the algebraic integer `α` has smaller degree
and `M(α) > 1`, an algebraic integer `β` of smaller degree has `1 < M(β) ≤ M(α)`. -/
theorem exists_lower_degree_mahlerMeasure_le {α : ℂ} (hα : IsIntegral ℤ α) {n : ℕ} (hn : 0 < n)
    (hdeg : (minpoly ℤ (α ^ n)).natDegree < (minpoly ℤ α).natDegree)
    (hM : 1 < ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure) :
    ∃ β : ℂ, IsIntegral ℤ β ∧ (minpoly ℤ β).natDegree < (minpoly ℤ α).natDegree ∧
      1 < ((minpoly ℤ β).map (Int.castRingHom ℂ)).mahlerMeasure ∧
      ((minpoly ℤ β).map (Int.castRingHom ℂ)).mahlerMeasure ≤
        ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure := by sorry

/-- CA.6/dobrowolski-auxiliary-polynomial: for `M ≥ 3`, `N ≥ 10`, `dM < N/2` there is a nonzero
`F ∈ ℤ[X]` of degree `≤ N`, divisible by `f_α^M`, with coefficients at most
`N^{2dM²/N} M(α)^{2M}` in absolute value. -/
theorem exists_dobrowolski_auxiliary_polynomial {α : ℂ} (hα : IsIntegral ℤ α) {N M : ℕ}
    (hM : 3 ≤ M) (hN : 10 ≤ N) (hdMN : 2 * ((minpoly ℤ α).natDegree * M) < N) :
    ∃ F : ℤ[X], F ≠ 0 ∧ F.natDegree ≤ N ∧ (minpoly ℤ α) ^ M ∣ F ∧
      ∀ i, (|F.coeff i| : ℝ) ≤ (N : ℝ) ^ ((2 * (minpoly ℤ α).natDegree * M ^ 2 : ℝ) / N) *
        ((minpoly ℤ α).map (Int.castRingHom ℂ)).mahlerMeasure ^ (2 * M) := by sorry

/-- CA.6/dobrowolski-lower-bound (**Dobrowolski's theorem**, with the constant of the source read):
a nonzero algebraic number of degree `d ≥ 2` that is not a root of unity has
`M(α) ≥ 1 + (1/11700) (log log d / log d)³`. Here `M(α) = absMulHeight₁ α ^ d`
(DiophantineApproximationAndTranscendence:DT.0/height-comparisons). -/
theorem dobrowolski {K : Type*} [Field K] [CharZero K] {α : K} (hα : IsAlgebraic ℚ α)
    (h0 : α ≠ 0) (hroot : ∀ n : ℕ, 0 < n → α ^ n ≠ 1) (hd : 2 ≤ (minpoly ℚ α).natDegree) :
    1 + (1 / 11700) * (Real.log (Real.log (minpoly ℚ α).natDegree) /
        Real.log (minpoly ℚ α).natDegree) ^ 3 ≤
      NumberField.absMulHeight₁ α ^ (minpoly ℚ α).natDegree := by sorry

/-! ### The Schinzel–Zassenhaus conjecture (Dimitrov) -/

/-- The polynomial `P_m = ∏ (X - αᵢ^m)` attached to a monic polynomial `P = ∏ (X - αᵢ)`: the
characteristic polynomial of multiplication by `x^m` on `R[x]/(P)`. -/
noncomputable def rootPowPoly {R : Type*} [CommRing R] (P : R[X]) (hP : P.Monic) (m : ℕ) : R[X] :=
  (Algebra.leftMulMatrix (AdjoinRoot.powerBasis' hP).basis (AdjoinRoot.root P ^ m)).charpoly

theorem rootPowPoly_monic {R : Type*} [CommRing R] [Nontrivial R] (P : R[X]) (hP : P.Monic)
    (m : ℕ) : (rootPowPoly P hP m).Monic := by sorry

theorem natDegree_rootPowPoly {R : Type*} [CommRing R] [Nontrivial R] (P : R[X]) (hP : P.Monic)
    (m : ℕ) : (rootPowPoly P hP m).natDegree = P.natDegree := by sorry

theorem rootPowPoly_one {R : Type*} [CommRing R] (P : R[X]) (hP : P.Monic) :
    rootPowPoly P hP 1 = P := by sorry

theorem rootPowPoly_zero {R : Type*} [CommRing R] (P : R[X]) (hP : P.Monic) :
    rootPowPoly P hP 0 = (X - 1) ^ P.natDegree := by sorry

theorem map_rootPowPoly {R S : Type*} [CommRing R] [CommRing S] [Nontrivial S] (f : R →+* S)
    (P : R[X]) (hP : P.Monic) (m : ℕ) :
    rootPowPoly (P.map f) (hP.map f) m = (rootPowPoly P hP m).map f := by sorry

theorem rootPowPoly_eq_prod_roots {K : Type*} [Field K] (P : K[X]) (hP : P.Monic)
    (hsplit : Multiset.card P.roots = P.natDegree) (m : ℕ) :
    rootPowPoly P hP m = (P.roots.map fun a => X - C (a ^ m)).prod := by sorry

theorem rootPowPoly_rootPowPoly {R : Type*} [CommRing R] [Nontrivial R] (P : R[X]) (hP : P.Monic)
    (m n : ℕ) :
    rootPowPoly (rootPowPoly P hP m) (rootPowPoly_monic P hP m) n = rootPowPoly P hP (m * n) := by
  sorry

theorem rootPowPoly_eq_minpoly_pow {K L : Type*} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] (α : L) (m : ℕ) :
    rootPowPoly (minpoly K α) (minpoly.monic (Algebra.IsIntegral.isIntegral α)) m =
      minpoly K (α ^ m) ^ (Module.finrank K K⟮α⟯ / Module.finrank K K⟮α ^ m⟯) := by sorry

theorem rootPowPoly_two_comp_X_sq {R : Type*} [CommRing R] (P : R[X]) (hP : P.Monic) :
    (rootPowPoly P hP 2).comp (X ^ 2) = (-1) ^ P.natDegree * (P * P.comp (-X)) := by sorry

/-- Unit test `rootPowPoly.test_X_sub_C`: `(X - a)_m = X - a^m`. -/
example (a : ℤ) (m : ℕ) : rootPowPoly (X - C a) (monic_X_sub_C a) m = X - C (a ^ m) := by sorry

/-- Unit test `rootPowPoly.test_X_sq_sub_two`: `(X² - 2)_2 = (X - 2)²`. -/
example : rootPowPoly (X ^ 2 - C 2 : ℤ[X]) (monic_X_pow_sub_C 2 (by norm_num)) 2 = (X - C 2) ^ 2 := by
  sorry

/-- Unit test `rootPowPoly.test_cyclotomic_three`: `(Φ₃)_2 = Φ₃` (odd level). -/
example : rootPowPoly (cyclotomic 3 ℤ) (cyclotomic.monic 3 ℤ) 2 = cyclotomic 3 ℤ := by sorry

/-- Unit test `rootPowPoly.test_one`: the empty product, `1_m = 1`. -/
example (m : ℕ) : rootPowPoly (1 : ℤ[X]) monic_one m = 1 := by sorry

/-- Unit test `rootPowPoly.test_ne_comp`: `P_2` is not `P(X²)`: for `P = X² + 1`,
`P_2 = (X + 1)² ≠ X⁴ + 1`. -/
example : rootPowPoly (X ^ 2 + C 1 : ℤ[X]) (monic_X_pow_add_C 1 (by norm_num)) 2 = (X + 1) ^ 2 ∧
    rootPowPoly (X ^ 2 + C 1 : ℤ[X]) (monic_X_pow_add_C 1 (by norm_num)) 2 ≠
      (X ^ 2 + C 1 : ℤ[X]).comp (X ^ 2) := by sorry

/-- CA.6/root-power-polynomial-congruence (Arnold, Smyth; Dimitrov Lemma 2.1): `P₄ ≡ P₂ (mod 4)`. -/
theorem C_four_dvd_rootPowPoly_four_sub_two {P : ℤ[X]} (hP : P.Monic) :
    (C 4 : ℤ[X]) ∣ rootPowPoly P hP 4 - rootPowPoly P hP 2 := by sorry

/-- CA.6/sqrt-one-add-four-integral (Dimitrov (3)): `√(1 + 4Y)` has integer coefficients. -/
theorem exists_sq_eq_one_add_four_mul_X :
    ∃ T : PowerSeries ℤ, PowerSeries.constantCoeff T = 1 ∧
      T ^ 2 = 1 + PowerSeries.C 4 * PowerSeries.X := by sorry

/-- CA.6/integral-square-root-power-series (Dimitrov Proposition 2.2): if `Q ∈ ℤ[X]` has `Q(0) = 1`
and is a square modulo 4, then `√Q ∈ 1 + X ℤ⟦X⟧`. -/
theorem exists_sq_eq_of_sq_add_four_mul {Q : ℤ[X]} (hQ0 : Q.coeff 0 = 1)
    (hsq : ∃ U V : ℤ[X], Q = U ^ 2 + C 4 * V) :
    ∃ S : PowerSeries ℤ, PowerSeries.constantCoeff S = 1 ∧ S ^ 2 = (Q : PowerSeries ℤ) := by sorry

/-- CA.6/root-power-polynomial-square-cyclotomic (Dimitrov Lemma 2.3). -/
theorem rootPowPoly_square_tfae {P : ℤ[X]} (hP : P.Monic) (hirr : Irreducible P)
    (hdeg : 1 < P.natDegree) (hsq : ¬ IsSquare (rootPowPoly P hP 2)) :
    List.TFAE [∃ N : ℕ, Odd N ∧ P = cyclotomic N ℤ,
      rootPowPoly P hP 2 = rootPowPoly P hP 4,
      IsSquare (rootPowPoly P hP 2 * rootPowPoly P hP 4),
      IsSquare (algebraMap ℚ[X] (RatFunc ℚ)
        ((rootPowPoly P hP 2 * rootPowPoly P hP 4).map (Int.castRingHom ℚ)))] := by sorry

/-- CA.6/schinzel-zassenhaus-dimitrov (**Dimitrov's theorem**, the Schinzel–Zassenhaus conjecture):
a monic irreducible non-cyclotomic `P ∈ ℤ[X]` of degree `n > 1` has a root of modulus at least
`2^{1/(4n)}`. -/
theorem schinzel_zassenhaus {P : ℤ[X]} (hP : P.Monic) (hirr : Irreducible P)
    (hdeg : 1 < P.natDegree) (hcyc : ∀ N : ℕ, P ≠ cyclotomic N ℤ) :
    ∃ z ∈ P.aroots ℂ, (2 : ℝ) ^ ((1 : ℝ) / (4 * P.natDegree)) ≤ ‖z‖ := by sorry

/-! ### Heights and the power map -/

/-- CA.6/abs-log-height-pow: `h(αⁿ) = n h(α)` for the absolute logarithmic Weil height. -/
theorem absLogHeight₁_pow {K : Type*} [Field K] [CharZero K] (α : K) (n : ℕ) :
    NumberField.absLogHeight₁ (α ^ n) = n * NumberField.absLogHeight₁ α := by sorry

/-- CA.6/weil-height-eq-zero-iff (Kronecker for the Weil height): an algebraic number has height
zero iff it is zero or a root of unity. -/
theorem absLogHeight₁_eq_zero_iff {K : Type*} [Field K] [CharZero K] {α : K}
    (hα : IsAlgebraic ℚ α) :
    NumberField.absLogHeight₁ α = 0 ↔ α = 0 ∨ ∃ n : ℕ, 0 < n ∧ α ^ n = 1 := by sorry

/-- CA.6/canonical-height-power-map: for the power map `x ↦ x^d`, `d ≥ 2`, Tate's sequence
`d^{-n} h(f^n(α))` is constant, so the canonical height of ArithmeticDynamics:DY.1 is the Weil height:
`ĥ_{x^d}(α) = h(α) = log M(α) / deg α`. -/
theorem tendsto_absLogHeight₁_iterate_pow {K : Type*} [Field K] [CharZero K] (α : K) {d : ℕ}
    (hd : 2 ≤ d) :
    (∀ n : ℕ, NumberField.absLogHeight₁ ((fun x : K => x ^ d)^[n] α) / (d : ℝ) ^ n =
        NumberField.absLogHeight₁ α) ∧
      Tendsto (fun n : ℕ => NumberField.absLogHeight₁ ((fun x : K => x ^ d)^[n] α) / (d : ℝ) ^ n)
        atTop (𝓝 (NumberField.absLogHeight₁ α)) := by sorry

/-! Lehmer's problem, whether `inf {M(α) : M(α) > 1} > 1`, is a conjecture and is not stated here as
a target; see the roadmap document, section CA.6. -/

end CA6

end TauCeti.ClassicalArithmetic


-- ===== CA.7 =====

/-
CA.7 Integral Galois modules and orders: suggested Lean section for
BP-ClassicalArithmeticCompletion (continuation). This section is not the roadmap and is not
exhaustive; the roadmap document is definitive. The statements suggest Lean forms so that
contributors and reviewers converge on names and signatures. They claim no implementation.

Elaborated against Mathlib 082e2d3; the only messages are `declaration uses 'sorry'` warnings.

Tau Ceti is not built here. Ring `K₀` is Tau Ceti's `TauCeti.SplitK0` of
`TauCeti.finiteProjectiveModules`; the stand-in `RingK0` below names what is needed locally.
The lemma nodes `local-tame-split-extension`, `normal-integral-basis-of-split-extension` and
`completed-ring-of-integers-is-induced` need the local-field and completion carriers of the Tau Ceti
roadmaps LocalFieldsRamification and NumberFieldArithmetic, and are not stated in this section.
-/

noncomputable section

namespace TauCeti.ClassicalArithmetic

section CA7

/-! ## CA.7 Integral Galois modules and orders -/

open NumberField
open scoped TensorProduct

namespace IntegralGaloisModule

variable (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B] [Group G]
  [MulSemiringAction G B] [SMulCommClass G A B]

/-- The `A`-linear representation of `G` on `B` given by the action. -/
def galoisRep : Representation A G B :=
  Representation.ofDistribMulAction A G B

@[simp] theorem galoisRep_apply (g : G) (x : B) : galoisRep A B G g x = g • x := by sorry

/-- `B` as a left module over the group ring `A[G]`. -/
abbrev GroupRingModule : Type _ := (galoisRep A B G).asModule

/-- The identification of `B` with its group-ring module. -/
def toGroupRingModule : B ≃ₗ[A] GroupRingModule A B G :=
  (galoisRep A B G).asModuleEquiv.symm

@[simp] theorem single_smul (g : G) (a : A) (x : B) :
    MonoidAlgebra.single g a • toGroupRingModule A B G x =
      toGroupRingModule A B G (a • g • x) := by sorry

@[simp] theorem of_smul (g : G) (x : B) :
    MonoidAlgebra.of A G g • toGroupRingModule A B G x = toGroupRingModule A B G (g • x) := by
  sorry

instance isScalarTower : IsScalarTower A (MonoidAlgebra A G) (GroupRingModule A B G) := by
  sorry

theorem norm_smul [Fintype G] (x : B) :
    (∑ g : G, MonoidAlgebra.of A G g) • toGroupRingModule A B G x =
      toGroupRingModule A B G (∑ g : G, g • x) := by sorry

theorem mem_range_algebraMap_iff [IsGaloisGroup G A B] (x : B) :
    x ∈ Set.range (algebraMap A B) ↔ ∀ g : G, g • x = x := by sorry

theorem sum_smul_mem_range_algebraMap [IsGaloisGroup G A B] [Fintype G] (x : B) :
    ∑ g : G, g • x ∈ Set.range (algebraMap A B) := by sorry

theorem galoisRep_numberField_apply {K L : Type*} [Field K] [Field L] [NumberField K]
    [NumberField L] [Algebra K L] [IsGalois K L] (σ : L ≃ₐ[K] L) (x : 𝓞 L) :
    ((galoisRep (𝓞 K) (𝓞 L) (L ≃ₐ[K] L) σ x : 𝓞 L) : L) = σ (x : L) := by sorry

/-- Unit test `IntegralGaloisModule.galoisRep_test_trivialGroup`: for the trivial group the
norm element acts as the identity. -/
example [Fintype G] [Subsingleton G] (x : B) :
    (∑ g : G, MonoidAlgebra.of A G g) • toGroupRingModule A B G x = toGroupRingModule A B G x := by
  sorry

/-- Unit test `IntegralGaloisModule.galoisRep_test_augmentationKillsInvariants`: `g - 1` kills
the image of `A`. -/
example [IsGaloisGroup G A B] (g : G) (a : A) :
    (MonoidAlgebra.of A G g - 1) • toGroupRingModule A B G (algebraMap A B a) = 0 := by sorry

/-- Unit test `IntegralGaloisModule.galoisRep_test_normIsTrace`: for number fields the norm
element acts as the trace. -/
example {K L : Type*} [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]
    [IsGalois K L] (x : 𝓞 L) :
    ∑ σ : L ≃ₐ[K] L, σ • x = algebraMap (𝓞 K) (𝓞 L) (Algebra.intTrace (𝓞 K) (𝓞 L) x) := by
  sorry

end IntegralGaloisModule

namespace NormalBasis

variable (K L : Type*) [Field K] [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]

/-- `θ` is a normal basis generator: its Galois conjugates are `K`-linearly independent. -/
def IsGenerator (θ : L) : Prop := LinearIndependent K (fun σ : L ≃ₐ[K] L ↦ σ θ)

theorem isGenerator_normalBasis_one : IsGenerator K L (IsGalois.normalBasis K L 1) := by sorry

variable {K L}

theorem isGenerator_iff_span (θ : L) :
    IsGenerator K L θ ↔ Submodule.span K (Set.range fun σ : L ≃ₐ[K] L ↦ σ θ) = ⊤ := by sorry

/-- The normal basis defined by a generator. -/
def basisOfGenerator {θ : L} (h : IsGenerator K L θ) : Module.Basis (L ≃ₐ[K] L) K L := by sorry

@[simp] theorem basisOfGenerator_apply {θ : L} (h : IsGenerator K L θ) (σ : L ≃ₐ[K] L) :
    basisOfGenerator h σ = σ θ := by sorry

/-- The `K[G]`-linear isomorphism `K[G] ≃ L`, `x ↦ x • θ`. -/
def equivOfGenerator {θ : L} (h : IsGenerator K L θ) :
    MonoidAlgebra K (L ≃ₐ[K] L) ≃ₗ[K] L := by sorry

@[simp] theorem equivOfGenerator_single {θ : L} (h : IsGenerator K L θ) (σ : L ≃ₐ[K] L)
    (c : K) : equivOfGenerator h (MonoidAlgebra.single σ c) = c • σ θ := by sorry

theorem equivOfGenerator_mul {θ : L} (h : IsGenerator K L θ)
    (x y : MonoidAlgebra K (L ≃ₐ[K] L)) :
    equivOfGenerator h (x * y) =
      (IntegralGaloisModule.galoisRep K L (L ≃ₐ[K] L)).asAlgebraHom x (equivOfGenerator h y) := by
  sorry

variable (K L) in
/-- The normal basis map of Mathlib's normal basis. -/
def equiv : MonoidAlgebra K (L ≃ₐ[K] L) ≃ₗ[K] L :=
  equivOfGenerator (isGenerator_normalBasis_one K L)

theorem isGenerator_iff_exists_unit {θ : L} (h : IsGenerator K L θ) (β : L) :
    IsGenerator K L β ↔
      ∃ u : (MonoidAlgebra K (L ≃ₐ[K] L))ˣ, β = equivOfGenerator h (u : MonoidAlgebra K _) := by
  sorry

/-- Unit test `NormalBasis.test_trivialGroup`: over the trivial group every nonzero element is a
normal basis generator. -/
example [Subsingleton (L ≃ₐ[K] L)] (θ : L) : IsGenerator K L θ ↔ θ ≠ 0 := by sorry

/-- Unit test `NormalBasis.test_one_not_generator`: `1` is not a normal basis generator of a
nontrivial extension. -/
example [Nontrivial (L ≃ₐ[K] L)] : ¬ IsGenerator K L 1 := by sorry

/-- Unit test `NormalBasis.test_quadratic_generator`: in a quadratic extension, `1 + x` is a
normal basis generator when the nontrivial automorphism negates `x ≠ 0`, as for `1 + i`. -/
example (hL : Nat.card (L ≃ₐ[K] L) = 2) (σ : L ≃ₐ[K] L) (hσ : σ ≠ 1) (x : L) (hx : x ≠ 0)
    (hσx : σ x = -x) : IsGenerator K L (1 + x) := by sorry

/-- Unit test `NormalBasis.test_equiv_single_one`: the normal basis map sends `σ` to the
conjugate of Mathlib's normal basis generator. -/
example (σ : L ≃ₐ[K] L) :
    equiv K L (MonoidAlgebra.single σ 1) = σ (IsGalois.normalBasis K L 1) := by sorry

end NormalBasis

namespace IntegralGaloisModule

variable (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B] [Group G] [Fintype G]
  [MulSemiringAction G B] [IsGaloisGroup G A B]

/-- `α` generates a normal integral basis: its conjugates form an `A`-basis of `B`. -/
def IsNIBGenerator (α : B) : Prop :=
  LinearIndependent A (fun g : G ↦ g • α) ∧ Submodule.span A (Set.range fun g : G ↦ g • α) = ⊤

/-- `B` has a normal integral basis over `A`. -/
def HasNIB : Prop := ∃ α : B, IsNIBGenerator A B G α

variable {A B G}

/-- The normal integral basis defined by a generator. -/
def IsNIBGenerator.basis {α : B} (h : IsNIBGenerator A B G α) : Module.Basis G A B := by sorry

@[simp] theorem IsNIBGenerator.basis_apply {α : B} (h : IsNIBGenerator A B G α) (g : G) :
    h.basis g = g • α := by sorry

theorem isNIBGenerator_iff_bijective (α : B) :
    IsNIBGenerator A B G α ↔
      Function.Bijective fun x : MonoidAlgebra A G ↦ x • toGroupRingModule A B G α := by sorry

theorem IsNIBGenerator.unit_smul {α : B} (h : IsNIBGenerator A B G α)
    (u : (MonoidAlgebra A G)ˣ) :
    IsNIBGenerator A B G
      ((toGroupRingModule A B G).symm ((u : MonoidAlgebra A G) • toGroupRingModule A B G α)) := by
  sorry

theorem IsNIBGenerator.exists_unit {α β : B} (hα : IsNIBGenerator A B G α)
    (hβ : IsNIBGenerator A B G β) :
    ∃ u : (MonoidAlgebra A G)ˣ,
      toGroupRingModule A B G β = (u : MonoidAlgebra A G) • toGroupRingModule A B G α := by sorry

theorem IsNIBGenerator.isGenerator {K L : Type*} [Field K] [Field L] [NumberField K]
    [NumberField L] [Algebra K L] [IsGalois K L] {α : 𝓞 L}
    (h : IsNIBGenerator (𝓞 K) (𝓞 L) (L ≃ₐ[K] L) α) : NormalBasis.IsGenerator K L (α : L) := by
  sorry

/-- Unit test `IntegralGaloisModule.nib_test_trivialGroup`: over the trivial group a generator is
exactly a unit. -/
example [IsDomain A] [Subsingleton G] (α : B) : IsNIBGenerator A B G α ↔ IsUnit α := by sorry

/-- Unit test `IntegralGaloisModule.nib_test_one_not_generator`: `1` never generates a normal
integral basis of a nontrivial extension. -/
example [Nontrivial A] [Nontrivial G] : ¬ IsNIBGenerator A B G 1 := by sorry

/-- Unit test `IntegralGaloisModule.nib_test_cyclotomicPrime`: `ζ_p` generates a normal integral
basis of `ℚ(ζ_p)/ℚ` for an odd prime `p`. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (L : Type*) [Field L] [NumberField L]
    [IsCyclotomicExtension {p} ℚ L] [IsGalois ℚ L] :
    IsNIBGenerator (𝓞 ℚ) (𝓞 L) (L ≃ₐ[ℚ] L)
      ((IsCyclotomicExtension.zeta_spec p ℚ L).toInteger) := by sorry

end IntegralGaloisModule

namespace IntegralGaloisModule

/-! ### Tame ramification and the trace -/

section Tame

variable (A B : Type*) [CommRing A] [CommRing B] [Algebra A B]

/-- `B/A` is tamely ramified at the prime `P` of `B`: the residue extension is separable and the
residue characteristic does not divide the ramification index. -/
def IsTamelyRamifiedAt (P : Ideal B) [P.IsPrime] : Prop :=
  Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P) ∧ ¬ ringChar (A ⧸ P.under A) ∣ P.ramificationIdx A

/-- `B/A` is tamely ramified: tame at every nonzero prime of `B`. -/
def IsTamelyRamified : Prop :=
  ∀ (P : Ideal B) [P.IsPrime], P ≠ ⊥ → IsTamelyRamifiedAt A B P

variable {A B}

theorem isTamelyRamifiedAt_iff_of_finite [Module.Finite A B] (P : Ideal B) [P.IsMaximal]
    [(P.under A).IsMaximal] [Finite (A ⧸ P.under A)] :
    IsTamelyRamifiedAt A B P ↔ ¬ ringChar (A ⧸ P.under A) ∣ P.ramificationIdx A := by sorry

theorem isTamelyRamifiedAt_of_ramificationIdx_eq_one (P : Ideal B) [P.IsPrime]
    [Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P)] (he : P.ramificationIdx A = 1) :
    IsTamelyRamifiedAt A B P := by sorry

theorem isTamelyRamified_trans_iff (C : Type*) [CommRing C] [Algebra B C] [Algebra A C]
    [IsScalarTower A B C] [IsDedekindDomain A] [IsDedekindDomain B] [IsDedekindDomain C]
    [Module.Finite A B] [Module.Finite B C] [Module.IsTorsionFree A B]
    [Module.IsTorsionFree B C] :
    IsTamelyRamified A C ↔ IsTamelyRamified A B ∧ IsTamelyRamified B C := by sorry

theorem isTamelyRamified_numberField_iff {K L : Type*} [Field K] [Field L] [NumberField K]
    [NumberField L] [Algebra K L] :
    IsTamelyRamified (𝓞 K) (𝓞 L) ↔
      ∀ (P : Ideal (𝓞 L)) [P.IsPrime], P ≠ ⊥ →
        ¬ ringChar (𝓞 K ⧸ P.under (𝓞 K)) ∣ P.ramificationIdx (𝓞 K) := by sorry

/-- Unit test `IntegralGaloisModule.tame_test_self`: the trivial extension is tamely ramified. -/
example (A : Type*) [CommRing A] [IsDedekindDomain A] : IsTamelyRamified A A := by sorry

/-- Unit test `IntegralGaloisModule.tame_test_cyclotomicPrime`: `ℚ(ζ_p)/ℚ` is tamely ramified for
an odd prime `p`, the ramification index at `p` being `p - 1`. -/
example (p : ℕ) [Fact p.Prime] (L : Type*) [Field L] [NumberField L]
    [IsCyclotomicExtension {p} ℚ L] : IsTamelyRamified (𝓞 ℚ) (𝓞 L) := by sorry

/-- Unit test `IntegralGaloisModule.tame_test_gaussian_not_tame`: `ℚ(i)/ℚ` is wildly ramified at
`2`. -/
example (L : Type*) [Field L] [NumberField L] [IsCyclotomicExtension {4} ℚ L] :
    ¬ IsTamelyRamified (𝓞 ℚ) (𝓞 L) := by sorry

end Tame

section Trace

variable (A B : Type*) [CommRing A] [CommRing B] [Algebra A B] [IsDedekindDomain A]
  [IsDedekindDomain B] [Module.Finite A B] [Module.IsTorsionFree A B]

theorem intTrace_eq_sum_smul (G : Type*) [Group G] [Fintype G] [MulSemiringAction G B]
    [IsGaloisGroup G A B] (x : B) :
    algebraMap A B (Algebra.intTrace A B x) = ∑ g : G, g • x := by sorry

theorem trace_quotient_eq_ramificationIdxIn_mul_sum (G : Type*) [Group G] [Finite G]
    [MulSemiringAction G B] [IsGaloisGroup G A B] (p : Ideal A) [p.IsMaximal] (hp : p ≠ ⊥)
    (x : B) :
    Algebra.trace (A ⧸ p) (B ⧸ p.map (algebraMap A B)) (Ideal.Quotient.mk _ x) =
      (p.ramificationIdxIn B : A ⧸ p) *
        ∑ᶠ P : p.primesOver B, Algebra.trace (A ⧸ p) (B ⧸ P.1) (Ideal.Quotient.mk P.1 x) := by
  sorry

theorem range_intTrace_le_iff (G : Type*) [Group G] [Finite G] [MulSemiringAction G B]
    [IsGaloisGroup G A B] (p : Ideal A) [p.IsMaximal] (hp : p ≠ ⊥) :
    LinearMap.range (Algebra.intTrace A B) ≤ p ↔
      ∃ P : p.primesOver B, ¬ IsTamelyRamifiedAt A B P.1 := by sorry

theorem isTamelyRamified_iff_intTrace_surjective (G : Type*) [Group G] [Finite G]
    [MulSemiringAction G B] [IsGaloisGroup G A B] :
    IsTamelyRamified A B ↔ Function.Surjective (Algebra.intTrace A B) := by sorry

variable {A B} (G : Type*) [Group G] [Fintype G] [MulSemiringAction G B] [IsGaloisGroup G A B]

theorem HasNIB.intTrace_surjective (h : HasNIB A B G) :
    Function.Surjective (Algebra.intTrace A B) := by sorry

/-- Speiser: a Galois extension with a normal integral basis is tamely ramified. -/
theorem HasNIB.isTamelyRamified (h : HasNIB A B G) : IsTamelyRamified A B := by sorry

end Trace

theorem IsNIBGenerator.intTrace {K F L : Type*} [Field K] [Field F] [Field L] [NumberField K]
    [NumberField F] [NumberField L] [Algebra K F] [Algebra F L] [Algebra K L]
    [IsScalarTower K F L] [IsGalois K L] [IsGalois K F] {α : 𝓞 L}
    (h : IsNIBGenerator (𝓞 K) (𝓞 L) (L ≃ₐ[K] L) α) :
    IsNIBGenerator (𝓞 K) (𝓞 F) (F ≃ₐ[K] F) (Algebra.intTrace (𝓞 F) (𝓞 L) α) := by sorry

theorem HasNIB.intTrace_surjective_of_tower {K F L : Type*} [Field K] [Field F] [Field L]
    [NumberField K] [NumberField F] [NumberField L] [Algebra K F] [Algebra F L] [Algebra K L]
    [IsScalarTower K F L] [IsGalois K L] (h : HasNIB (𝓞 K) (𝓞 L) (L ≃ₐ[K] L)) :
    Function.Surjective (Algebra.intTrace (𝓞 F) (𝓞 L)) := by sorry

/-- The rational normal basis need not be integral: `ℚ(i)/ℚ` has no normal integral basis. -/
theorem not_hasNIB_gaussian (L : Type*) [Field L] [NumberField L]
    [IsCyclotomicExtension {4} ℚ L] [IsGalois ℚ L] :
    ¬ HasNIB (𝓞 ℚ) (𝓞 L) (L ≃ₐ[ℚ] L) := by sorry

theorem isGenerator_one_add_zeta_four (L : Type*) [Field L] [NumberField L]
    [IsCyclotomicExtension {4} ℚ L] [IsGalois ℚ L] :
    NormalBasis.IsGenerator ℚ L (1 + IsCyclotomicExtension.zeta 4 ℚ L) := by sorry

/-! ### Projectivity -/

/-- Rim's criterion: an `R`-projective `R[G]`-module with an averaging endomorphism is
`R[G]`-projective. -/
theorem projective_of_averaging (R G M : Type*) [CommRing R] [Group G] [Fintype G]
    [AddCommGroup M] [Module (MonoidAlgebra R G) M] [Module R M]
    [IsScalarTower R (MonoidAlgebra R G) M] [Module.Projective R M] (φ : M →ₗ[R] M)
    (hφ : ∀ m : M,
      ∑ g : G, MonoidAlgebra.of R G g • φ (MonoidAlgebra.of R G g⁻¹ • m) = m) :
    Module.Projective (MonoidAlgebra R G) M := by sorry

section Projective

variable (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B] [IsDedekindDomain A]
  [IsDedekindDomain B] [Module.Finite A B] [Module.IsTorsionFree A B] [Group G] [Fintype G]
  [MulSemiringAction G B] [IsGaloisGroup G A B]

/-- Ullom: a tamely ramified Galois extension has projective integers over the group ring. -/
theorem projective_of_isTamelyRamified (h : IsTamelyRamified A B) :
    Module.Projective (MonoidAlgebra A G) (GroupRingModule A B G) := by sorry

theorem intTrace_surjective_of_projective
    [Module.Projective (MonoidAlgebra A G) (GroupRingModule A B G)] :
    Function.Surjective (Algebra.intTrace A B) := by sorry

end Projective

/-! ### Local theory: complete discrete valuation rings with finite residue field -/

section Local

variable (A B G : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
  [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [Finite (IsLocalRing.ResidueField A)]
  [CommRing B] [IsDedekindDomain B] [Algebra A B] [Module.Finite A B] [Module.IsTorsionFree A B]
  [Group G] [Fintype G] [MulSemiringAction G B] [IsGaloisGroup G A B]

theorem local_hasNIB_of_unramified
    (h : ∀ (P : Ideal B) [P.IsPrime], P ≠ ⊥ → P.ramificationIdx A = 1) : HasNIB A B G := by
  sorry

theorem local_isNIBGenerator_of_pow_eq_uniformizer (π : B) (ϖ : A) (hϖ : Irreducible ϖ)
    (hπ : π ^ Nat.card G = algebraMap A B ϖ)
    (htame : ¬ ringChar (IsLocalRing.ResidueField A) ∣ Nat.card G) (u : Fin (Nat.card G) → Aˣ) :
    IsNIBGenerator A B G (∑ j, (u j : A) • π ^ (j : ℕ)) := by sorry

theorem local_exists_uniformizer_pow_eq [IsLocalRing B] (h : IsTamelyRamified A B) (ϖ : A)
    (hϖ : Irreducible ϖ) :
    ∃ π v : B, Irreducible π ∧
      v ^ (Nat.card (IsLocalRing.ResidueField B) - 1) = 1 ∧
      π ^ (IsLocalRing.maximalIdeal B).ramificationIdx A = v * algebraMap A B ϖ ∧
      (IsLocalRing.maximalIdeal B).ramificationIdx A ∣
        Nat.card (IsLocalRing.ResidueField B) - 1 := by sorry

/-- Noether's theorem for local fields. -/
theorem local_noether : HasNIB A B G ↔ IsTamelyRamified A B := by sorry

end Local

end IntegralGaloisModule

/-! ### Locally free lattices and Noether's theorem -/

namespace LocallyFree

open IsDedekindDomain

variable (A K : Type*) [CommRing A] [IsDedekindDomain A] [Field K] [Algebra A K]
  [IsFractionRing A K]
variable (Λ M : Type*) [Ring Λ] [Algebra A Λ] [AddCommGroup M] [Module Λ M] [Module A M]
  [IsScalarTower A Λ M]

/-- `M` is a locally free `Λ`-lattice of rank `n`: finitely generated over `A`, and at every
nonzero prime `v` of `A` the completion `Â_v ⊗ M` is isomorphic to `(Â_v ⊗ Λ)ⁿ`, compatibly with
the action of `Λ`. -/
def IsLocallyFreeOfRank (n : ℕ) : Prop :=
  Module.Finite A M ∧
    ∀ v : HeightOneSpectrum A,
      ∃ e : (v.adicCompletionIntegers K) ⊗[A] M ≃ₗ[v.adicCompletionIntegers K]
          (v.adicCompletionIntegers K) ⊗[A] (Fin n → Λ),
        ∀ (l : Λ) (x : (v.adicCompletionIntegers K) ⊗[A] M),
          e ((DistribSMul.toLinearMap A M l).baseChange _ x) =
            (DistribSMul.toLinearMap A (Fin n → Λ) l).baseChange _ (e x)

variable {A K Λ M}

theorem IsLocallyFreeOfRank.of_free [Module.Finite A Λ] (n : ℕ) :
    IsLocallyFreeOfRank A K Λ (Fin n → Λ) n := by sorry

theorem IsLocallyFreeOfRank.prod {N : Type*} [AddCommGroup N] [Module Λ N] [Module A N]
    [IsScalarTower A Λ N] {n m : ℕ} (hM : IsLocallyFreeOfRank A K Λ M n)
    (hN : IsLocallyFreeOfRank A K Λ N m) : IsLocallyFreeOfRank A K Λ (M × N) (n + m) := by sorry

theorem IsLocallyFreeOfRank.of_linearEquiv {N : Type*} [AddCommGroup N] [Module Λ N]
    [Module A N] [IsScalarTower A Λ N] {n : ℕ} (e : M ≃ₗ[Λ] N)
    (hM : IsLocallyFreeOfRank A K Λ M n) : IsLocallyFreeOfRank A K Λ N n := by sorry

theorem IsLocallyFreeOfRank.finrank [Module.Finite A Λ] {n : ℕ}
    (hM : IsLocallyFreeOfRank A K Λ M n) :
    Module.finrank K (K ⊗[A] M) = n * Module.finrank K (K ⊗[A] Λ) := by sorry

open IntegralGaloisModule in
theorem isLocallyFreeOfRank_one_groupRing_iff (B G : Type*) [CommRing B] [Algebra A B]
    [Group G] [Fintype G] [MulSemiringAction G B] [SMulCommClass G A B] [Module.Finite A B] :
    IsLocallyFreeOfRank A K (MonoidAlgebra A G) (GroupRingModule A B G) 1 ↔
      ∀ v : HeightOneSpectrum A,
        ∃ b : Module.Basis G (v.adicCompletionIntegers K) ((v.adicCompletionIntegers K) ⊗[A] B),
          ∀ g : G, b g = (galoisRep A B G g).baseChange _ (b 1) := by sorry

theorem IsLocallyFreeOfRank.projective [Module.Finite A Λ] {n : ℕ}
    (hM : IsLocallyFreeOfRank A K Λ M n) : Module.Projective Λ M := by sorry

/-- Unit test `LocallyFree.test_self`: `Λ` is locally free of rank one over itself. -/
example [Module.Finite A Λ] : IsLocallyFreeOfRank A K Λ (Fin 1 → Λ) 1 := by sorry

/-- Unit test `LocallyFree.test_rank_zero`: a locally free lattice of rank zero is zero. -/
example (h : IsLocallyFreeOfRank A K Λ M 0) : Subsingleton M := by sorry

/-- Unit test `LocallyFree.test_ideal_not_free`: a nonprincipal ideal of a Dedekind domain is
locally free of rank one over the domain but not free. -/
example (I : Ideal A) (hI : I ≠ ⊥) (hnp : ¬ I.IsPrincipal) :
    IsLocallyFreeOfRank A K A I 1 ∧ ¬ Module.Free A I := by sorry

/-- Unit test `LocallyFree.test_gaussian_not_locallyFree`: `ℤ[i]` is not locally free of rank one
over `ℤ[Gal(ℚ(i)/ℚ)]`, since the completion at `2` has no normal integral basis. -/
example (L : Type*) [Field L] [NumberField L] [IsCyclotomicExtension {4} ℚ L] [IsGalois ℚ L] :
    ¬ IsLocallyFreeOfRank (𝓞 ℚ) ℚ (MonoidAlgebra (𝓞 ℚ) (L ≃ₐ[ℚ] L))
      (IntegralGaloisModule.GroupRingModule (𝓞 ℚ) (𝓞 L) (L ≃ₐ[ℚ] L)) 1 := by sorry

theorem submodule_eq_of_baseChange_surjective {V : Type*} [AddCommGroup V] [Module A V]
    {N P : Submodule A V} (hNP : N ≤ P) [Module.Finite A P]
    (h : ∀ v : HeightOneSpectrum A,
      Function.Surjective ((Submodule.inclusion hNP).baseChange (v.adicCompletionIntegers K))) :
    N = P := by sorry

/-- Local freeness does not imply freeness. -/
theorem not_free_of_not_isPrincipal (I : Ideal A) (hI : I ≠ ⊥) (hnp : ¬ I.IsPrincipal) :
    IsLocallyFreeOfRank A K A I 1 ∧ ¬ Module.Free A I := by sorry

end LocallyFree

namespace IntegralGaloisModule

open LocallyFree

variable (K L : Type*) [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- Noether: a tamely ramified extension of number fields has locally free integers. -/
theorem isLocallyFreeOfRank_one_of_isTamelyRamified (h : IsTamelyRamified (𝓞 K) (𝓞 L)) :
    IsLocallyFreeOfRank (𝓞 K) K (MonoidAlgebra (𝓞 K) (L ≃ₐ[K] L))
      (GroupRingModule (𝓞 K) (𝓞 L) (L ≃ₐ[K] L)) 1 := by sorry

/-- **Noether's theorem.** -/
theorem noether :
    [IsTamelyRamified (𝓞 K) (𝓞 L),
      IsLocallyFreeOfRank (𝓞 K) K (MonoidAlgebra (𝓞 K) (L ≃ₐ[K] L))
        (GroupRingModule (𝓞 K) (𝓞 L) (L ≃ₐ[K] L)) 1,
      Module.Projective (MonoidAlgebra (𝓞 K) (L ≃ₐ[K] L))
        (GroupRingModule (𝓞 K) (𝓞 L) (L ≃ₐ[K] L))].TFAE := by sorry

theorem isLocallyFreeOfRank_intGroupRing_of_isTamelyRamified (h : IsTamelyRamified (𝓞 K) (𝓞 L)) :
    IsLocallyFreeOfRank ℤ ℚ (MonoidAlgebra ℤ (L ≃ₐ[K] L))
      (GroupRingModule ℤ (𝓞 L) (L ≃ₐ[K] L)) (Module.finrank ℚ K) := by sorry

end IntegralGaloisModule

/-! ### Orders, maximal orders and the associated order -/

namespace IntegralOrder

open scoped Pointwise

variable (R F E : Type*) [CommRing R] [Field F] [Algebra R F] [IsFractionRing R F] [Ring E]
  [Algebra F E] [Algebra R E] [IsScalarTower R F E] [FiniteDimensional F E]

/-- An `R`-order in the finite-dimensional `F`-algebra `E`: a subring that is an `R`-lattice. -/
def IsOrder (Λ : Subalgebra R E) : Prop := Submodule.IsLattice F (Subalgebra.toSubmodule Λ)

variable {R F E}

theorem isOrder_iff (Λ : Subalgebra R E) :
    IsOrder R F E Λ ↔
      (Subalgebra.toSubmodule Λ).FG ∧ Submodule.span F (Λ : Set E) = ⊤ := by sorry

theorem IsOrder.isIntegral {Λ : Subalgebra R E} (h : IsOrder R F E Λ) (x : Λ) :
    IsIntegral R x := by sorry

theorem isOrder_of_isIntegral [IsNoetherianRing R] [IsIntegrallyClosed R] (Λ : Subalgebra R E)
    (hspan : Submodule.span F (Λ : Set E) = ⊤) (hint : ∀ x : Λ, IsIntegral R x)
    (hsep : ∀ x : E, (∀ y : E, LinearMap.trace F E (LinearMap.mulLeft F (x * y)) = 0) → x = 0) :
    IsOrder R F E Λ := by sorry

variable (R F) in
/-- The group ring `R[G]` as a subalgebra of the group algebra `F[G]`. -/
def groupRingSubalgebra (G : Type*) [Group G] : Subalgebra R (MonoidAlgebra F G) :=
  (MonoidAlgebra.lift R (MonoidAlgebra F G) G (MonoidAlgebra.of F G)).range

theorem groupRing_isOrder (G : Type*) [Group G] [Fintype G] :
    IsOrder R F (MonoidAlgebra F G) (groupRingSubalgebra R F G) := by sorry

theorem integralClosure_isOrder [IsNoetherianRing R] [IsIntegrallyClosed R] (L : Type*) [Field L]
    [Algebra F L] [Algebra R L] [IsScalarTower R F L] [FiniteDimensional F L]
    [Algebra.IsSeparable F L] :
    IsOrder R F L (integralClosure R L) := by sorry

/-- Unit test `IntegralOrder.order_test_base`: `R` itself is an order in `F`. -/
example : IsOrder R F F ⊥ := by sorry

/-- Unit test `IntegralOrder.order_test_not_finitelyGenerated`: `ℤ[1/2]` is a subring of `ℚ`
spanning it, but not an order. -/
example : ¬ IsOrder ℤ ℚ ℚ (Algebra.adjoin ℤ {(1 / 2 : ℚ)}) := by sorry

/-- Unit test `IntegralOrder.order_test_groupRing`: the integral group ring of a finite group is
an order in the rational group algebra. -/
example (G : Type*) [Group G] [Fintype G] :
    IsOrder ℤ ℚ (MonoidAlgebra ℚ G) (groupRingSubalgebra ℤ ℚ G) := by sorry

variable (R) in
/-- The left order `{x ∈ E | x M ⊆ M}` of an `R`-submodule `M` of `E`. -/
def leftOrder (M : Submodule R E) : Subalgebra R E := by sorry

theorem mem_leftOrder_iff (M : Submodule R E) (x : E) :
    x ∈ leftOrder R M ↔ ∀ m ∈ M, x * m ∈ M := by sorry

theorem leftOrder_isOrder [IsNoetherianRing R] (M : Submodule R E) [Submodule.IsLattice F M] :
    IsOrder R F E (leftOrder R M) := by sorry

theorem leftOrder_eq_self {Λ : Subalgebra R E} (h : IsOrder R F E Λ) :
    leftOrder R (Subalgebra.toSubmodule Λ) = Λ := by sorry

theorem leftOrder_smul {E' : Type*} [Field E'] [Algebra F E'] [Algebra R E'] [IsScalarTower R F E']
    (M : Submodule R E') (a : E'ˣ) : leftOrder R (a • M) = leftOrder R M := by sorry

/-- Unit test `IntegralOrder.leftOrder_test_self`: the left order of `R` in `F` is `R`. -/
example : leftOrder R (Subalgebra.toSubmodule (⊥ : Subalgebra R F)) = ⊥ := by sorry

/-- Unit test `IntegralOrder.leftOrder_test_top_contains`: every left order contains `R`. -/
example (M : Submodule R E) : (⊥ : Subalgebra R E) ≤ leftOrder R M := by sorry

/-- Unit test `IntegralOrder.leftOrder_test_scale`: in a field, rescaling a lattice does not change
its left order. -/
example (M : Submodule ℤ ℚ) :
    leftOrder ℤ (Units.mk0 (2 : ℚ) two_ne_zero • M) = leftOrder ℤ M := by sorry

variable (R F E) in
/-- A maximal `R`-order: an order not properly contained in another order. -/
def IsMaximalOrder (Λ : Subalgebra R E) : Prop :=
  IsOrder R F E Λ ∧ ∀ Λ' : Subalgebra R E, IsOrder R F E Λ' → Λ ≤ Λ' → Λ' = Λ

omit [IsFractionRing R F] [FiniteDimensional F E] in
theorem IsMaximalOrder.eq_of_le {Λ Λ' : Subalgebra R E} (h : IsMaximalOrder R F E Λ)
    (h' : IsOrder R F E Λ') (hle : Λ ≤ Λ') : Λ' = Λ := h.2 Λ' h' hle

theorem exists_isMaximalOrder_ge [IsNoetherianRing R] [IsIntegrallyClosed R]
    (hsep : ∀ x : E, (∀ y : E, LinearMap.trace F E (LinearMap.mulLeft F (x * y)) = 0) → x = 0)
    {Λ : Subalgebra R E} (h : IsOrder R F E Λ) :
    ∃ Λ' : Subalgebra R E, Λ ≤ Λ' ∧ IsMaximalOrder R F E Λ' := by sorry

theorem integralClosure_isMaximalOrder [IsDedekindDomain R] (L : Type*) [Field L] [Algebra F L]
    [Algebra R L] [IsScalarTower R F L] [FiniteDimensional F L] [Algebra.IsSeparable F L] :
    IsMaximalOrder R F L (integralClosure R L) := by sorry

theorem groupRing_not_isMaximalOrder (G : Type*) [Group G] [Fintype G] [Nontrivial G]
    [NeZero (Fintype.card G : F)] (hR : ¬ IsUnit (Fintype.card G : R)) :
    ¬ IsMaximalOrder R F (MonoidAlgebra F G) (groupRingSubalgebra R F G) := by sorry

/-- Unit test `IntegralOrder.maximalOrder_test_ringOfIntegers`: `𝓞_K` is a maximal `ℤ`-order. -/
example (K : Type*) [Field K] [NumberField K] :
    IsMaximalOrder ℤ ℚ K (integralClosure ℤ K) := by sorry

/-- Unit test `IntegralOrder.maximalOrder_test_integers`: `ℤ` is the maximal order of `ℚ`. -/
example : IsMaximalOrder ℤ ℚ ℚ ⊥ := by sorry

/-- Unit test `IntegralOrder.maximalOrder_test_groupRing_not_maximal`: `ℤ[G]` is not maximal for
a nontrivial finite group. -/
example (G : Type*) [Group G] [Fintype G] [Nontrivial G] :
    ¬ IsMaximalOrder ℤ ℚ (MonoidAlgebra ℚ G) (groupRingSubalgebra ℤ ℚ G) := by sorry

/-- The maximal order of `ℚ[C_p]` is `ℤ[C_p][e]` with `e` the averaging idempotent, and it has
index `p` over `ℤ[C_p]`. -/
theorem maximalOrder_cyclic_prime (p : ℕ) [Fact p.Prime] (G : Type*) [CommGroup G] [Fintype G]
    [IsCyclic G] (hG : Fintype.card G = p) :
    IsMaximalOrder ℤ ℚ (MonoidAlgebra ℚ G)
        (Algebra.adjoin ℤ (Set.range (MonoidAlgebra.of ℚ G) ∪
          {(1 / (p : ℚ)) • ∑ g : G, MonoidAlgebra.of ℚ G g})) ∧
      (Subalgebra.toSubmodule (groupRingSubalgebra ℤ ℚ G)).toAddSubgroup.relIndex
          (Subalgebra.toSubmodule (Algebra.adjoin ℤ (Set.range (MonoidAlgebra.of ℚ G) ∪
            {(1 / (p : ℚ)) • ∑ g : G, MonoidAlgebra.of ℚ G g}))).toAddSubgroup = p := by
  sorry

end IntegralOrder

namespace IntegralGaloisModule

open IntegralOrder

variable (A K L B : Type*) [CommRing A] [CommRing B] [Algebra A B] [Field K] [Field L]
  [Algebra A K] [IsFractionRing A K] [Algebra K L] [Algebra A L] [IsScalarTower A K L]
  [Algebra B L] [IsScalarTower A B L] [IsIntegralClosure B A L] [FiniteDimensional K L]
  [IsGalois K L]

/-- The associated order `{x ∈ K[G] | x 𝓞_L ⊆ 𝓞_L}`. -/
def associatedOrder : Subalgebra A (MonoidAlgebra K (L ≃ₐ[K] L)) where
  carrier := {x | ∀ b : B, (galoisRep K L (L ≃ₐ[K] L)).asAlgebraHom x (algebraMap B L b) ∈
    Set.range (algebraMap B L)}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

variable {A K L B}

theorem mem_associatedOrder_iff (x : MonoidAlgebra K (L ≃ₐ[K] L)) :
    x ∈ associatedOrder A K L B ↔
      ∀ b : B, (galoisRep K L (L ≃ₐ[K] L)).asAlgebraHom x (algebraMap B L b) ∈
        Set.range (algebraMap B L) := by sorry

theorem groupRingSubalgebra_le_associatedOrder :
    groupRingSubalgebra A K (L ≃ₐ[K] L) ≤ associatedOrder A K L B := by sorry

theorem associatedOrder_isOrder [IsDedekindDomain A] [Module.Finite A B] :
    IsOrder A K (MonoidAlgebra K (L ≃ₐ[K] L)) (associatedOrder A K L B) := by sorry

theorem associatedOrder_eq_of_free {Γ : Subalgebra A (MonoidAlgebra K (L ≃ₐ[K] L))} (α : B)
    (hΓ : ∀ b : B, ∃! x : Γ,
      (galoisRep K L (L ≃ₐ[K] L)).asAlgebraHom (x : MonoidAlgebra K (L ≃ₐ[K] L))
        (algebraMap B L α) = algebraMap B L b) :
    Γ = associatedOrder A K L B := by sorry

theorem associatedOrder_eq_groupRing_iff [IsDedekindDomain A] [IsDedekindDomain B]
    [Module.Finite A B] [Module.IsTorsionFree A B] [MulSemiringAction (L ≃ₐ[K] L) B]
    [IsGaloisGroup (L ≃ₐ[K] L) A B] :
    associatedOrder A K L B = groupRingSubalgebra A K (L ≃ₐ[K] L) ↔ IsTamelyRamified A B := by
  sorry

/-- The associated order of `ℚ(i)/ℚ` is the maximal order `ℤ e₁ ⊕ ℤ e₋₁`. -/
theorem associatedOrder_gaussian (L : Type*) [Field L] [NumberField L]
    [IsCyclotomicExtension {4} ℚ L] [IsGalois ℚ L] (σ : L ≃ₐ[ℚ] L) (hσ : σ ≠ 1) :
    (1 / 2 : ℚ) • (MonoidAlgebra.of ℚ _ 1 + MonoidAlgebra.of ℚ _ σ) ∈
      associatedOrder ℤ ℚ L (𝓞 L) := by sorry

/-- Unit test `IntegralGaloisModule.associatedOrder_test_trivial`: for `L = K` the associated
order is `A`. -/
example [Subsingleton (L ≃ₐ[K] L)] :
    associatedOrder A K L B = groupRingSubalgebra A K (L ≃ₐ[K] L) := by sorry

/-- Unit test `IntegralGaloisModule.associatedOrder_test_contains_groupRing`: the associated order
contains the image of every group element. -/
example (σ : L ≃ₐ[K] L) : MonoidAlgebra.of K _ σ ∈ associatedOrder A K L B := by sorry

/-- Unit test `IntegralGaloisModule.associatedOrder_test_gaussian_strict`: for `ℚ(i)/ℚ` the
associated order is strictly larger than `ℤ[G]`. -/
example (L : Type*) [Field L] [NumberField L] [IsCyclotomicExtension {4} ℚ L] [IsGalois ℚ L] :
    groupRingSubalgebra ℤ ℚ (L ≃ₐ[ℚ] L) < associatedOrder ℤ ℚ L (𝓞 L) := by sorry

end IntegralGaloisModule

/-! ### The Hilbert–Speiser theorem -/

namespace IntegralGaloisModule

/-- Arithmetically disjoint composita: normal integral bases multiply. -/
theorem isNIBGenerator_mul_of_isCoprime_discr {N : Type*} [Field N] [NumberField N]
    (K₁ K₂ : IntermediateField ℚ N) [IsGalois ℚ K₁] [IsGalois ℚ K₂] [IsGalois ℚ N]
    (hdisc : IsCoprime (NumberField.discr K₁) (NumberField.discr K₂)) (htop : K₁ ⊔ K₂ = ⊤)
    {α₁ : 𝓞 K₁} {α₂ : 𝓞 K₂} (h₁ : IsNIBGenerator (𝓞 ℚ) (𝓞 K₁) (K₁ ≃ₐ[ℚ] K₁) α₁)
    (h₂ : IsNIBGenerator (𝓞 ℚ) (𝓞 K₂) (K₂ ≃ₐ[ℚ] K₂) α₂) :
    IsNIBGenerator (𝓞 ℚ) (𝓞 N) (N ≃ₐ[ℚ] N)
      (algebraMap (𝓞 K₁) (𝓞 N) α₁ * algebraMap (𝓞 K₂) (𝓞 N) α₂) := by sorry

theorem isNIBGenerator_zeta_prime (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (L : Type*) [Field L]
    [NumberField L] [IsCyclotomicExtension {p} ℚ L] [IsGalois ℚ L] :
    IsNIBGenerator (𝓞 ℚ) (𝓞 L) (L ≃ₐ[ℚ] L) (IsCyclotomicExtension.zeta_spec p ℚ L).toInteger := by
  sorry

theorem isNIBGenerator_zeta_of_squarefree (n : ℕ) [NeZero n] (hodd : Odd n) (hsq : Squarefree n)
    (L : Type*) [Field L] [NumberField L] [IsCyclotomicExtension {n} ℚ L] [IsGalois ℚ L] :
    IsNIBGenerator (𝓞 ℚ) (𝓞 L) (L ≃ₐ[ℚ] L) (IsCyclotomicExtension.zeta_spec n ℚ L).toInteger := by
  sorry

/-- The Gauss period `Tr_{ℚ(ζ_n)/K}(ζ_n)` generates a normal integral basis of `K/ℚ`. -/
theorem isNIBGenerator_gaussPeriod (n : ℕ) [NeZero n] (hodd : Odd n) (hsq : Squarefree n)
    (L : Type*) [Field L] [NumberField L] [IsCyclotomicExtension {n} ℚ L] [IsGalois ℚ L]
    (K : IntermediateField ℚ L) [IsGalois ℚ K] :
    IsNIBGenerator (𝓞 ℚ) (𝓞 K) (K ≃ₐ[ℚ] K)
      (Algebra.intTrace (𝓞 K) (𝓞 L) (IsCyclotomicExtension.zeta_spec n ℚ L).toInteger) := by
  sorry

/-- A tamely ramified abelian number field lies in a cyclotomic field of odd squarefree level. -/
theorem exists_odd_squarefree_of_isTamelyRamified (K : Type*) [Field K] [NumberField K]
    [IsAbelianGalois ℚ K] (h : IsTamelyRamified (𝓞 ℚ) (𝓞 K)) :
    ∃ n : ℕ, Odd n ∧ Squarefree n ∧ Nonempty (K →ₐ[ℚ] CyclotomicField n ℚ) := by sorry

/-- **The Hilbert–Speiser theorem.** -/
theorem hilbertSpeiser (K : Type*) [Field K] [NumberField K] [IsAbelianGalois ℚ K] :
    [HasNIB (𝓞 ℚ) (𝓞 K) (K ≃ₐ[ℚ] K), IsTamelyRamified (𝓞 ℚ) (𝓞 K),
      ∃ n : ℕ, Odd n ∧ Squarefree n ∧ Nonempty (K →ₐ[ℚ] CyclotomicField n ℚ)].TFAE := by sorry

end IntegralGaloisModule

/-! ### Resolvents and discriminants -/

namespace GaloisResolvent

variable {K L E : Type*} [Field K] [Field L] [Field E] [Algebra K L] [FiniteDimensional K L]
  [IsGalois K L] [Algebra L E]

variable (K E) in
/-- The resolvent `⟨a | χ⟩ = ∑_σ χ(σ⁻¹) σ(a)`. -/
def resolvent (a : L) (χ : (L ≃ₐ[K] L) →* Eˣ) : E :=
  ∑ σ : L ≃ₐ[K] L, ((χ σ⁻¹ : Eˣ) : E) * algebraMap L E (σ a)

variable (K) in
/-- The resolvend `∑_σ σ(a) σ⁻¹ ∈ L[G]`. -/
def resolvend (a : L) : MonoidAlgebra L (L ≃ₐ[K] L) :=
  ∑ σ : L ≃ₐ[K] L, MonoidAlgebra.single σ⁻¹ (σ a)

theorem resolvent_smul (a : L) (χ : (L ≃ₐ[K] L) →* Eˣ) (τ : L ≃ₐ[K] L) :
    resolvent K E (τ a) χ = ((χ τ : Eˣ) : E) * resolvent K E a χ := by sorry

theorem resolvent_one (a : L) :
    resolvent K E a 1 = algebraMap L E (algebraMap K L (Algebra.trace K L a)) := by sorry

theorem resolvent_add (a b : L) (χ : (L ≃ₐ[K] L) →* Eˣ) :
    resolvent K E (a + b) χ = resolvent K E a χ + resolvent K E b χ := by sorry

theorem resolvend_smul (a : L) (τ : L ≃ₐ[K] L) :
    resolvend K (τ a) = MonoidAlgebra.single τ 1 * resolvend K a := by sorry

omit [IsGalois K L] in
theorem isGenerator_iff_forall_resolvent_ne_zero [IsAbelianGalois K L]
    (hE : Nat.card ((L ≃ₐ[K] L) →* Eˣ) = Nat.card (L ≃ₐ[K] L)) (a : L) :
    NormalBasis.IsGenerator K L a ↔ ∀ χ : (L ≃ₐ[K] L) →* Eˣ, resolvent K E a χ ≠ 0 := by sorry

/-- Unit test `GaloisResolvent.resolvent_test_trivial`: for the trivial character the resolvent
is the trace. -/
example (a : L) : resolvent K L a 1 = algebraMap K L (Algebra.trace K L a) := by sorry

/-- Unit test `GaloisResolvent.resolvent_test_base`: the resolvent of an element of `K` at a
nontrivial character vanishes. -/
example (c : K) (χ : (L ≃ₐ[K] L) →* Eˣ) (hχ : χ ≠ 1) :
    resolvent K E (algebraMap K L c) χ = 0 := by sorry

/-- Unit test `GaloisResolvent.resolvent_test_quadratic`: in a quadratic extension with `σ x = -x`,
the resolvent of `1 + x` at the sign character is `2x`. -/
example (σ : L ≃ₐ[K] L) (hσ : σ ≠ 1) (hL : Nat.card (L ≃ₐ[K] L) = 2) (x : L) (hx : σ x = -x)
    (χ : (L ≃ₐ[K] L) →* Lˣ) (hχ : ((χ σ : Lˣ) : L) = -1) :
    resolvent K L (1 + x) χ = 2 * x := by sorry

/-- Dedekind's factorisation of the group determinant of a finite abelian group. -/
theorem det_groupMatrix_eq_finprod (G : Type*) [CommGroup G] [Fintype G] [DecidableEq G]
    (hE : Nat.card (G →* Eˣ) = Nat.card G) (X : G → E) :
    (Matrix.of fun g h : G ↦ X (g * h⁻¹)).det = ∏ᶠ χ : G →* Eˣ, ∑ g : G, ((χ g : Eˣ) : E) * X g := by
  sorry

omit [IsGalois K L] in
open scoped Classical in
/-- The discriminant of a normal basis is the product of the squared resolvents. -/
theorem discr_conjugates_eq_finprod_resolvent_sq [IsAbelianGalois K L] [Algebra K E]
    [IsScalarTower K L E] (hE : Nat.card ((L ≃ₐ[K] L) →* Eˣ) = Nat.card (L ≃ₐ[K] L)) (a : L) :
    algebraMap K E (Algebra.discr K fun σ : L ≃ₐ[K] L ↦ σ a) =
      ∏ᶠ χ : (L ≃ₐ[K] L) →* Eˣ, resolvent K E a χ ^ 2 := by sorry

open scoped Classical in
/-- Over `ℚ`, `θ` generates a normal integral basis exactly when the discriminant of its
conjugates is the field discriminant. -/
theorem isNIBGenerator_iff_discr_eq (K : Type*) [Field K] [NumberField K] [IsGalois ℚ K]
    (θ : 𝓞 K) :
    IntegralGaloisModule.IsNIBGenerator (𝓞 ℚ) (𝓞 K) (K ≃ₐ[ℚ] K) θ ↔
      Algebra.discr ℚ (fun σ : K ≃ₐ[ℚ] K ↦ σ (θ : K)) = NumberField.discr K := by sorry

end GaloisResolvent

/-! ### Locally free class groups and the Fröhlich–Taylor theorems

Ring `K₀` is Tau Ceti's `TauCeti.SplitK0 (TauCeti.finiteProjectiveModules Λ).FullSubcategory`
(`TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`,
`TauCeti/Algebra/Category/ModuleCat/CartanMap.lean`), with the ring-level interface of
`KTheoryLowDegrees:Z.1`. Tau Ceti is not built here, so `RingK0` below is a local stand-in for that
declaration: what is needed locally is the abelian group and the class of a finitely generated
projective module. -/

universe uGM

namespace LocallyFree

/-- Local stand-in for Tau Ceti's ring `K₀` (see the note above). -/
def RingK0 (Λ : Type uGM) [Ring Λ] : Type uGM := by sorry

instance (Λ : Type uGM) [Ring Λ] : AddCommGroup (RingK0 Λ) := by sorry

/-- Local stand-in for the class of a finitely generated projective module in ring `K₀`. -/
def RingK0.of {Λ : Type uGM} [Ring Λ] (P : Type uGM) [AddCommGroup P] [Module Λ P]
    [Module.Finite Λ P] [Module.Projective Λ P] : RingK0 Λ := by sorry

end LocallyFree

namespace LocallyFree

variable (A K : Type uGM) [CommRing A] [IsDedekindDomain A] [Field K] [Algebra A K]
  [IsFractionRing A K] (Λ : Type uGM) [Ring Λ] [Algebra A Λ]

/-- The locally free class group `Cl(Λ)`: the subgroup of `K₀(Λ)` generated by the classes
`[M] - n[Λ]` of locally free `Λ`-lattices `M` of rank `n`. -/
def classGroup : AddSubgroup (RingK0 Λ) :=
  AddSubgroup.closure {x | ∃ (M : Type uGM) (_ : AddCommGroup M) (_ : Module Λ M) (_ : Module A M)
    (_ : IsScalarTower A Λ M) (n : ℕ) (_ : IsLocallyFreeOfRank A K Λ M n)
    (_ : Module.Finite Λ M) (_ : Module.Projective Λ M), x = RingK0.of M - n • RingK0.of Λ}

variable {A K Λ}

/-- The class `[M] - n[Λ]` of a locally free lattice of rank `n`. -/
def classOf (M : Type uGM) [AddCommGroup M] [Module Λ M] [Module A M] [IsScalarTower A Λ M] (n : ℕ)
    (h : IsLocallyFreeOfRank A K Λ M n) : classGroup A K Λ := by sorry

theorem classOf_eq_zero_iff (M : Type uGM) [AddCommGroup M] [Module Λ M] [Module A M]
    [IsScalarTower A Λ M] (n : ℕ) (h : IsLocallyFreeOfRank A K Λ M n) :
    classOf M n h = 0 ↔ ∃ k : ℕ, Nonempty ((M × (Fin k → Λ)) ≃ₗ[Λ] (Fin (n + k) → Λ)) := by sorry

theorem classOf_prod (M N : Type uGM) [AddCommGroup M] [Module Λ M] [Module A M]
    [IsScalarTower A Λ M] [AddCommGroup N] [Module Λ N] [Module A N] [IsScalarTower A Λ N]
    (n m : ℕ) (hM : IsLocallyFreeOfRank A K Λ M n) (hN : IsLocallyFreeOfRank A K Λ N m) :
    classOf (M × N) (n + m) (hM.prod hN) = classOf M n hM + classOf N m hN := by sorry

theorem classOf_free [Module.Finite A Λ] (n : ℕ) :
    classOf (A := A) (K := K) (Fin n → Λ) n (IsLocallyFreeOfRank.of_free n) = 0 := by sorry

theorem exists_classOf_eq (x : classGroup A K Λ) :
    ∃ (M : Type uGM) (_ : AddCommGroup M) (_ : Module Λ M) (_ : Module A M)
      (_ : IsScalarTower A Λ M) (h : IsLocallyFreeOfRank A K Λ M 1), classOf M 1 h = x := by sorry

/-- Extension of scalars along a morphism of `A`-orders. -/
def classGroupMap {Λ' : Type uGM} [Ring Λ'] [Algebra A Λ'] [Module.Finite A Λ'] (f : Λ →ₐ[A] Λ') :
    classGroup A K Λ →+ classGroup A K Λ' := by sorry

/-- The kernel group `D(Λ)` relative to an order `Λ'` containing `Λ` (a maximal order). -/
def kernelGroup {Λ' : Type uGM} [Ring Λ'] [Algebra A Λ'] [Module.Finite A Λ'] (f : Λ →ₐ[A] Λ') :
    AddSubgroup (classGroup A K Λ) := (classGroupMap f).ker

/-- For `Λ = A` the locally free class group is the ideal class group. -/
def classGroupSelfEquiv : classGroup A K A ≃+ Additive (ClassGroup A) := by
  sorry

/-- Unit test `LocallyFree.classGroup_test_integers`: `Cl(ℤ)` is trivial. -/
example (x : classGroup ℤ ℚ ℤ) : x = 0 := by sorry

/-- Unit test `LocallyFree.classGroup_test_ideal`: the class of a nonprincipal ideal is nonzero. -/
example (I : Ideal A) (hI : I ≠ ⊥) (hnp : ¬ I.IsPrincipal) :
    classOf (K := K) I 1 (not_free_of_not_isPrincipal (K := K) I hI hnp).1 ≠ 0 := by sorry

/-- Unit test `LocallyFree.classGroup_test_cyclicTwo`: `Cl(ℤ[C₂])` is trivial. -/
example (G : Type) [Group G] [Fintype G] (hG : Fintype.card G = 2)
    (x : classGroup ℤ ℚ (MonoidAlgebra ℤ G)) : x = 0 := by sorry

end LocallyFree

namespace IntegralGaloisModule

open LocallyFree

variable (K L : Type) [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]
  [IsGalois K L]

/-- The Galois module class `[𝓞_L] ∈ Cl(𝓞_K[G])` of a tamely ramified extension. -/
def ringOfIntegersClass (h : IsTamelyRamified (𝓞 K) (𝓞 L)) :
    classGroup (𝓞 K) K (MonoidAlgebra (𝓞 K) (L ≃ₐ[K] L)) :=
  classOf (GroupRingModule (𝓞 K) (𝓞 L) (L ≃ₐ[K] L)) 1
    (isLocallyFreeOfRank_one_of_isTamelyRamified K L h)

/-- The class `[𝓞_L] ∈ Cl(ℤ[G])` obtained by restricting scalars to `ℤ[G]`. -/
def ringOfIntegersClassInt (h : IsTamelyRamified (𝓞 K) (𝓞 L)) :
    classGroup ℤ ℚ (MonoidAlgebra ℤ (L ≃ₐ[K] L)) :=
  classOf (GroupRingModule ℤ (𝓞 L) (L ≃ₐ[K] L)) (Module.finrank ℚ K)
    (isLocallyFreeOfRank_intGroupRing_of_isTamelyRamified K L h)

variable {K L}

theorem ringOfIntegersClass_eq_zero_of_hasNIB (h : IsTamelyRamified (𝓞 K) (𝓞 L))
    (hN : HasNIB (𝓞 K) (𝓞 L) (L ≃ₐ[K] L)) : ringOfIntegersClass K L h = 0 := by sorry

theorem ringOfIntegersClass_eq_zero_iff (h : IsTamelyRamified (𝓞 K) (𝓞 L)) :
    ringOfIntegersClass K L h = 0 ↔
      ∃ k : ℕ, Nonempty ((GroupRingModule (𝓞 K) (𝓞 L) (L ≃ₐ[K] L) ×
        (Fin k → MonoidAlgebra (𝓞 K) (L ≃ₐ[K] L))) ≃ₗ[MonoidAlgebra (𝓞 K) (L ≃ₐ[K] L)]
          (Fin (1 + k) → MonoidAlgebra (𝓞 K) (L ≃ₐ[K] L))) := by sorry

theorem classGroupMap_augmentation_ringOfIntegersClass (h : IsTamelyRamified (𝓞 K) (𝓞 L)) :
    classGroupMap (MonoidAlgebra.lift (𝓞 K) (𝓞 K) (L ≃ₐ[K] L) 1) (ringOfIntegersClass K L h) =
      0 := by sorry

/-- Unit test `IntegralGaloisModule.ringOfIntegersClass_test_trivial`: for `L = K` the class is
zero. -/
example [Subsingleton (L ≃ₐ[K] L)] (h : IsTamelyRamified (𝓞 K) (𝓞 L)) :
    ringOfIntegersClass K L h = 0 := by sorry

/-- Unit test `IntegralGaloisModule.ringOfIntegersClass_test_cyclotomic`: for `ℚ(ζ_p)/ℚ` the class
is zero. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (L : Type) [Field L] [NumberField L]
    [IsCyclotomicExtension {p} ℚ L] [IsGalois ℚ L] (h : IsTamelyRamified (𝓞 ℚ) (𝓞 L)) :
    ringOfIntegersClass ℚ L h = 0 := by sorry

/-- Unit test `IntegralGaloisModule.ringOfIntegersClass_test_intZero`: over `K = ℚ` a normal
integral basis makes the integral class vanish. -/
example (L : Type) [Field L] [NumberField L] [IsGalois ℚ L] (h : IsTamelyRamified (𝓞 ℚ) (𝓞 L))
    (hN : HasNIB (𝓞 ℚ) (𝓞 L) (L ≃ₐ[ℚ] L)) : ringOfIntegersClassInt ℚ L h = 0 := by sorry

/-- Fröhlich: `[𝓞_L]` lies in the kernel group `D(ℤ[G])`. -/
theorem ringOfIntegersClassInt_mem_kernelGroup (h : IsTamelyRamified (𝓞 K) (𝓞 L))
    {Λ' : Type} [Ring Λ'] [Module.Finite ℤ Λ']
    (f : MonoidAlgebra ℤ (L ≃ₐ[K] L) →ₐ[ℤ] Λ')
    (hmax : IntegralOrder.IsMaximalOrder ℤ ℚ (MonoidAlgebra ℚ (L ≃ₐ[K] L))
      (IntegralOrder.groupRingSubalgebra ℤ ℚ (L ≃ₐ[K] L))) :
    ringOfIntegersClassInt K L h ∈ kernelGroup (K := ℚ) f := by sorry

/-- **Taylor's theorem** (Fröhlich's conjecture), part (a): `[𝓞_L]` has order at most two. -/
theorem two_nsmul_ringOfIntegersClassInt (h : IsTamelyRamified (𝓞 K) (𝓞 L)) :
    2 • ringOfIntegersClassInt K L h = 0 := by sorry

/-- Taylor's theorem without irreducible symplectic characters: `𝓞_L` is stably free. -/
theorem ringOfIntegersClassInt_eq_zero_of_noSymplectic (h : IsTamelyRamified (𝓞 K) (𝓞 L))
    (hG : ∀ V : FDRep ℂ (L ≃ₐ[K] L), CategoryTheory.Simple V →
      ∀ β : LinearMap.BilinForm ℂ V,
        (∀ (g : L ≃ₐ[K] L) (x y : V), β (V.ρ g x) (V.ρ g y) = β x y) → β.IsAlt → β = 0) :
    ringOfIntegersClassInt K L h = 0 := by sorry

/-- Taylor's corollary: for a group of odd order `𝓞_L` is free over `ℤ[G]`. -/
theorem free_intGroupRing_of_odd_card (h : IsTamelyRamified (𝓞 K) (𝓞 L))
    (hodd : Odd (Nat.card (L ≃ₐ[K] L))) :
    Module.Free (MonoidAlgebra ℤ (L ≃ₐ[K] L)) (GroupRingModule ℤ (𝓞 L) (L ≃ₐ[K] L)) ∧
      Module.finrank (MonoidAlgebra ℤ (L ≃ₐ[K] L)) (GroupRingModule ℤ (𝓞 L) (L ≃ₐ[K] L)) =
        Module.finrank ℚ K := by sorry

end IntegralGaloisModule

end CA7

end TauCeti.ClassicalArithmetic
