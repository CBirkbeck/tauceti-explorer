import Mathlib.Algebra.BigOperators.Finprod
import Mathlib.Algebra.GCDMonoid.Finset
import Mathlib.Algebra.Group.ForwardDiff
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Convex.Function
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Combinatorics.Nullstellensatz
import Mathlib.FieldTheory.Separable
import Mathlib.LinearAlgebra.Matrix.Echelon.Decomposition
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Cyclotomic.Ideal
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.RingTheory.Binomial
import Mathlib.RingTheory.DedekindDomain.Factorization
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Localization.Basic
import Mathlib.RingTheory.Polynomial.Content
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.RingTheory.Polynomial.Resultant.Basic

/-!
# Classical arithmetic, layer CA.3 (continuation): suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ClassicalArithmeticCompletion--CA.3.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation: every proof is `sorry`.

It continues `research/blueprint/suggested/ClassicalArithmeticCompletion.lean`, whose CA.3
declarations (`intValuedPolynomials`, `characteristicIdeal`, `slopedValuation`, …) it uses. Since
the two files are elaborated separately, the two declarations it needs from there,
`intValuedPolynomials` and `characteristicIdeal`, are restated verbatim at the top; when the parts
are assembled they are the same declarations.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The file imports only Mathlib.

Conventions pinned here (and in the document):
* `Int(D)` is the `D`-subalgebra of `K[X]` of polynomials mapping `D` into `D`, for `K` the
  fraction field of `D`; its `n`-th characteristic ideal is the `D`-submodule of `K` of leading
  coefficients of degree-`n` members, with `0`;
* the norm of a maximal ideal `𝔪` of a Dedekind domain is `Nat.card (D ⧸ 𝔪)`;
* `legendreExponent q n = ∑_{k ≥ 1} ⌊n / q^k⌋`;
* the Newton polygon of a finite point family `(i, y i)` is recorded by its supporting values
  `μ_r = min_i (y i + r i)`: the parameter `r` is the valuation of the roots in the polynomial case,
  and the geometric slope in the `(i, y)` plane is `-r`.
-/

noncomputable section

open Polynomial

namespace TauCeti.ClassicalArithmetic

/-! ## Inputs restated from the main CA.3 file -/

section Inputs

/-- **The ring `Int(D)`** (CA.3/integer-valued-polynomials, main file). -/
def intValuedPolynomials (D K : Type*) [CommRing D] [IsDomain D] [Field K] [Algebra D K]
    [IsFractionRing D K] : Subalgebra D K[X] where
  carrier := {f | ∀ a : D, f.eval (algebraMap D K a) ∈ (algebraMap D K).range}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  algebraMap_mem' := sorry

/-- **The characteristic ideals of `Int(D)`** (CA.3/characteristic-ideals-of-int, main file). -/
def characteristicIdeal (D K : Type*) [CommRing D] [IsDomain D] [Field K] [Algebra D K]
    [IsFractionRing D K] (n : ℕ) : Submodule D K where
  carrier := {c | c = 0 ∨ ∃ f ∈ intValuedPolynomials D K, f.natDegree = n ∧ f.leadingCoeff = c}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

end Inputs

/-! ## Localization and Newton sequences -/

section Localization

variable {D K : Type*} [CommRing D] [IsDomain D] [Field K] [Algebra D K] [IsFractionRing D K]

/-- **Integer-valued polynomials commute with localization** (CA.3/int-valued-localization),
part (i): a polynomial that maps `D` into `S⁻¹D` maps `S⁻¹D` into `S⁻¹D`. Here `A` is the
localization of `D` at `S`, sitting inside `K`. -/
theorem eval_mem_of_forall_eval_mem_localization (S : Submonoid D) (A : Type*) [CommRing A]
    [IsDomain A] [Algebra D A] [IsLocalization S A] [Algebra A K] [IsScalarTower D A K]
    {f : K[X]} (hf : ∀ a : D, f.eval (algebraMap D K a) ∈ (algebraMap A K).range) (x : A) :
    f.eval (algebraMap A K x) ∈ (algebraMap A K).range := by
  sorry

/-- **Integer-valued polynomials commute with localization** (CA.3/int-valued-localization),
part (ii): for Noetherian `D`, `Int(S⁻¹D) = S⁻¹ Int(D)`. -/
theorem mem_intValuedPolynomials_localization_iff [IsNoetherianRing D] (S : Submonoid D)
    (A : Type*) [CommRing A] [IsDomain A] [Algebra D A] [IsLocalization S A] [Algebra A K]
    [IsScalarTower D A K] [IsFractionRing A K] {f : K[X]} :
    f ∈ intValuedPolynomials A K ↔ ∃ s ∈ S, C (algebraMap D K s) * f ∈ intValuedPolynomials D K := by
  sorry

/-- Part (iii): the characteristic ideals localize. -/
theorem mem_characteristicIdeal_localization_iff [IsNoetherianRing D] (S : Submonoid D)
    (A : Type*) [CommRing A] [IsDomain A] [Algebra D A] [IsLocalization S A] [Algebra A K]
    [IsScalarTower D A K] [IsFractionRing A K] (n : ℕ) (c : K) :
    c ∈ characteristicIdeal A K n ↔ ∃ s ∈ S, algebraMap D K s * c ∈ characteristicIdeal D K n := by
  sorry

/-- The generalized binomial polynomial `∏_{k<n} (X - a_k)/(a_n - a_k)` of a sequence in `D`. -/
def genBinomial (a : ℕ → D) (n : ℕ) : K[X] :=
  ∏ k ∈ Finset.range n,
    C (algebraMap D K (a n) - algebraMap D K (a k))⁻¹ * (X - C (algebraMap D K (a k)))

/-- **Newton sequences** (CA.3/newton-sequence-criterion): for an injective sequence, the
generalized binomials are integer-valued iff they form a regular basis of `Int(D)`. -/
theorem genBinomial_mem_iff_isBasis {a : ℕ → D} (ha : Function.Injective a) :
    (∀ n, genBinomial (K := K) a n ∈ intValuedPolynomials D K) ↔
      ∃ b : Module.Basis ℕ D (intValuedPolynomials D K), ∀ n, (b n : K[X]) = genBinomial a n := by
  sorry

/-- **Newton sequences**: the test-set form of the criterion. -/
theorem genBinomial_mem_iff_testSet {a : ℕ → D} (ha : Function.Injective a) :
    (∀ n, genBinomial (K := K) a n ∈ intValuedPolynomials D K) ↔
      ∀ (n : ℕ) (f : K[X]), f.natDegree ≤ n →
        (f ∈ intValuedPolynomials D K ↔
          ∀ k ≤ n, f.eval (algebraMap D K (a k)) ∈ (algebraMap D K).range) := by
  sorry

/-- **Newton sequences**: the characteristic ideals of a Newton sequence. -/
theorem characteristicIdeal_eq_span_of_newton {a : ℕ → D} (ha : Function.Injective a)
    (hN : ∀ n, genBinomial (K := K) a n ∈ intValuedPolynomials D K) (n : ℕ) :
    characteristicIdeal D K n =
      Submodule.span D {(algebraMap D K (∏ k ∈ Finset.range n, (a n - a k)))⁻¹} := by
  sorry

/-- Non-example for the criterion: in `ℤ`, a sequence starting `0, 2` is not a Newton sequence,
since its first binomial is `X / 2`. -/
example (a : ℕ → ℤ) (h0 : a 0 = 0) (h1 : a 1 = 2) :
    genBinomial (K := ℚ) a 1 ∉ intValuedPolynomials ℤ ℚ := by
  sorry

end Localization

/-! ## The Legendre exponent -/

/-- **The Legendre exponent** (CA.3/legendre-exponent): `w_q(n) = ∑_{k ≥ 1} ⌊n / q^k⌋`; the terms
with `k > n` vanish for `q ≥ 2`. -/
def legendreExponent (q n : ℕ) : ℕ :=
  ∑ k ∈ Finset.Icc 1 n, n / q ^ k

namespace LegendreExponent

/-- `w_q(n) = ∑_{l ≤ n} v_q(l)`, with `v_q(l)` the multiplicity of `q` in `l`. -/
theorem eq_sum_multiplicity {q : ℕ} (hq : 2 ≤ q) (n : ℕ) :
    (legendreExponent q n : ℕ∞) = ∑ l ∈ Finset.Icc 1 n, emultiplicity q l := by
  sorry

/-- `w_q(n + 1) = w_q(n) + v_q(n + 1)`. -/
theorem succ {q : ℕ} (hq : 2 ≤ q) (n : ℕ) :
    (legendreExponent q (n + 1) : ℕ∞) = legendreExponent q n + emultiplicity q (n + 1) := by
  sorry

/-- `w_q(n) = 0 ↔ n < q`. -/
theorem eq_zero_iff {q : ℕ} (hq : 2 ≤ q) (n : ℕ) : legendreExponent q n = 0 ↔ n < q := by
  sorry

/-- `w_q(q) = 1`. -/
theorem self {q : ℕ} (hq : 2 ≤ q) : legendreExponent q q = 1 := by
  sorry

/-- Superadditivity. -/
theorem add_le (q m n : ℕ) : legendreExponent q m + legendreExponent q n ≤ legendreExponent q (m + n) := by
  sorry

/-- For a prime, Legendre's formula. -/
theorem prime_eq_padicValNat {p : ℕ} [Fact p.Prime] (n : ℕ) :
    legendreExponent p n = padicValNat p n.factorial := by
  sorry

end LegendreExponent

/-- Unit test `TauCeti.ClassicalArithmetic.legendreExponent_two_four`. -/
example : legendreExponent 2 4 = 3 ∧ legendreExponent 3 10 = 4 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.legendreExponent_four_four`. -/
example : legendreExponent 4 4 = 1 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.legendreExponent_lt`. -/
example (q n : ℕ) (h : n < q) : legendreExponent q n = 0 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.legendreExponent_five_factorial`. -/
example : legendreExponent 5 26 = 6 ∧ padicValNat 5 (Nat.factorial 26) = 6 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.legendreExponent_four_eight_ne`: the base-`4` exponent
is not the `2`-adic valuation of `8!`. -/
example : legendreExponent 4 8 = 2 ∧ padicValNat 2 (Nat.factorial 8) = 7 := by
  sorry

/-! ## The v-ordering of a discrete valuation ring -/

section VOrdering

variable {V : Type*} [CommRing V] [IsDomain V] [IsDiscreteValuationRing V]

/-- **The v-ordering of a DVR** (CA.3/v-ordering-of-a-dvr): for a uniformizer `π` and
representatives `r : Fin q → V` of the residue classes, `a_n = ∑_i r(n_i) π^i` over the base-`q`
digits `n_i` of `n`. -/
def dvrVOrdering (π : V) {q : ℕ} (hq : 0 < q) (r : Fin q → V) (n : ℕ) : V :=
  ∑ i ∈ Finset.range (Nat.digits q n).length, r ⟨n / q ^ i % q, Nat.mod_lt _ hq⟩ * π ^ i

/-- Data for the theorems below: a uniformizer, finite residue field of cardinality `q`, and a
system of representatives with `r 0 = 0`. -/
structure VOrderingData (V : Type*) [CommRing V] [IsDomain V] [IsDiscreteValuationRing V] where
  /-- The cardinality of the residue field. -/
  q : ℕ
  two_le : 2 ≤ q
  card_residue : Nat.card (IsLocalRing.ResidueField V) = q
  /-- The uniformizer. -/
  π : V
  irreducible : Irreducible π
  /-- The representatives of the residue classes. -/
  r : Fin q → V
  r_zero : r ⟨0, by omega⟩ = 0
  r_bijective : Function.Bijective fun i => IsLocalRing.residue V (r i)

namespace VOrderingData

variable (d : VOrderingData V)

/-- The v-ordering attached to the data. -/
def seq (n : ℕ) : V := dvrVOrdering d.π (by have := d.two_le; omega) d.r n

theorem seq_zero : d.seq 0 = 0 := by
  sorry

/-- (a) `v(a_n - a_m) = v_q(n - m)`. -/
theorem addVal_seq_sub {n m : ℕ} (h : n ≠ m) :
    IsDiscreteValuationRing.addVal V (d.seq n - d.seq m) = emultiplicity (d.q : ℤ) ((n : ℤ) - m) := by
  sorry

theorem seq_injective : Function.Injective d.seq := by
  sorry

/-- (c) `v(∏_{k<n} (a_n - a_k)) = w_q(n)`. -/
theorem addVal_prod_seq (n : ℕ) :
    IsDiscreteValuationRing.addVal V (∏ k ∈ Finset.range n, (d.seq n - d.seq k)) =
      legendreExponent d.q n := by
  sorry

/-- (d) The v-ordering property. -/
theorem le_addVal_prod_sub_seq (x : V) (n : ℕ) :
    (legendreExponent d.q n : ℕ∞) ≤
      IsDiscreteValuationRing.addVal V (∏ k ∈ Finset.range n, (x - d.seq k)) := by
  sorry

/-- (b) `q^h` consecutive terms form a complete system of representatives modulo `𝔪^h`. -/
theorem bijective_mod_pow (s h : ℕ) :
    Function.Bijective fun k : Fin (d.q ^ h) =>
      Ideal.Quotient.mk (IsLocalRing.maximalIdeal V ^ h) (d.seq (s + k)) := by
  sorry

end VOrderingData

/-- Unit test `TauCeti.ClassicalArithmetic.dvrVOrdering_int_eq`: in `ℤ_(p)` with `π = p` and
`r i = i`, the v-ordering is `n ↦ n`. -/
example (p : ℕ) [hp : Fact p.Prime] (n : ℕ) :
    dvrVOrdering ((p : ℤ) : Localization.AtPrime (Ideal.span {(p : ℤ)})) hp.out.pos
      (fun i => ((i : ℕ) : Localization.AtPrime (Ideal.span {(p : ℤ)}))) n = n := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.dvrVOrdering_gaussian`: with `q = 2` and representatives
`0, 1` (as for `ℤ[i]` localized at `1 + i`), `a₂ = π`, `a₃ = 1 + π`, `a₄ = π²`, and in a DVR with
uniformizer `π` the valuation of `a₄ − a₀` is `2`. -/
example (π : V) : dvrVOrdering π two_pos ![0, 1] 2 = π ∧ dvrVOrdering π two_pos ![0, 1] 3 = 1 + π ∧
    dvrVOrdering π two_pos ![0, 1] 4 = π ^ 2 := by
  sorry

example (π : V) (hπ : Irreducible π) :
    IsDiscreteValuationRing.addVal V (dvrVOrdering π two_pos ![0, 1] 4 - dvrVOrdering π two_pos ![0, 1] 0) = 2 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.natCast_not_vOrdering_inert`: if `3` is a uniformizer and
`2` a unit (as in `ℤ[i]` localized at `3`, residue field of cardinality `9`), the sequence `n ↦ n`
violates property (c): `v(3 · 2 · 1) = 1`, while `w_9(3) = 0`. -/
example (h3 : Irreducible (3 : V)) (h2 : IsUnit (2 : V)) :
    IsDiscreteValuationRing.addVal V (∏ k ∈ Finset.range 3, ((3 : V) - k)) ≠ legendreExponent 9 3 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.dvrVOrdering_first_terms`. -/
example (π : V) {q : ℕ} (hq : 0 < q) (r : Fin q → V) (hr : r ⟨0, hq⟩ = 0) :
    dvrVOrdering π hq r 0 = 0 ∧ ∀ i : Fin q, 0 < (i : ℕ) → dvrVOrdering π hq r i = r i := by
  sorry

/-- **Regular basis of `Int(V)`** (CA.3/local-regular-basis-of-int-dvr): the characteristic ideals
of a DVR with residue field of cardinality `q`. -/
theorem characteristicIdeal_dvr {K : Type*} [Field K] [Algebra V K] [IsFractionRing V K]
    (d : VOrderingData V) (n : ℕ) :
    characteristicIdeal V K n =
      Submodule.span V {(algebraMap V K d.π ^ legendreExponent d.q n)⁻¹} := by
  sorry

/-- **Regular basis of `Int(V)`**: the generalized binomials of the v-ordering form a regular
basis. -/
theorem exists_basis_genBinomial_dvr {K : Type*} [Field K] [Algebra V K] [IsFractionRing V K]
    (d : VOrderingData V) :
    ∃ b : Module.Basis ℕ V (intValuedPolynomials V K), ∀ n, (b n : K[X]) = genBinomial d.seq n := by
  sorry

/-- An infinite residue field gives `Int(V) = V[X]`. -/
theorem intValuedPolynomials_eq_of_infinite_residueField {K : Type*} [Field K] [Algebra V K]
    [IsFractionRing V K] [Infinite (IsLocalRing.ResidueField V)] (f : K[X]) :
    f ∈ intValuedPolynomials V K ↔ ∀ i, f.coeff i ∈ (algebraMap V K).range := by
  sorry

end VOrdering

/-! ## Factorial ideals and the ideals `Π_q` -/

section Factorial

open IsDedekindDomain

variable (D : Type*) [CommRing D] [IsDedekindDomain D]

/-- The norm `N(𝔪) = |D/𝔪|` of a maximal ideal. -/
abbrev residueCard (v : HeightOneSpectrum D) : ℕ := Nat.card (D ⧸ v.asIdeal)

/-- **The factorial ideal** (CA.3/factorial-ideal): `n!_D = ∏_𝔪 𝔪^{w_{N(𝔪)}(n)}`. -/
def factorialIdeal (n : ℕ) : Ideal D :=
  ∏ᶠ v : HeightOneSpectrum D, v.asIdeal ^ legendreExponent (residueCard D v) n

/-- **The ideal `Π_q(D)`** (CA.3/polya-ideal): the product of the maximal ideals of norm `q`. -/
def polyaIdeal (q : ℕ) : Ideal D :=
  ∏ᶠ v : {v : HeightOneSpectrum D // residueCard D v = q}, v.1.asIdeal

variable {D}
variable (K : Type*) [Field K] [Algebra D K] [IsFractionRing D K]

/-- Hypotheses of the global theory: `D` is not a field and its residue fields are finite. -/
def FiniteResidueFields : Prop := ∀ v : HeightOneSpectrum D, Finite (D ⧸ v.asIdeal)

/-- **The local formula for the characteristic ideals**
(CA.3/characteristic-ideals-of-a-dedekind-domain): the exponent of `𝔪` in `I_n(D)` is
`-w_{N(𝔪)}(n)`. -/
theorem characteristicIdeal_eq_finprod (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D))
    (n : ℕ) :
    characteristicIdeal D K n =
      ((∏ᶠ v : HeightOneSpectrum D,
          (v.asIdeal : FractionalIdeal (nonZeroDivisors D) K) ^
            (-(legendreExponent (residueCard D v) n : ℤ)) : FractionalIdeal (nonZeroDivisors D) K) :
        Submodule D K) := by
  sorry

/-- Only finitely many maximal ideals have norm at most `n`. -/
theorem finite_setOf_residueCard_le (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D))
    (n : ℕ) : {v : HeightOneSpectrum D | residueCard D v ≤ n}.Finite := by
  sorry

namespace FactorialIdeal

/-- The exponent of `𝔪` in `n!_D`. -/
theorem count_factorialIdeal (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D))
    (v : HeightOneSpectrum D) (n : ℕ) :
    FractionalIdeal.count K v (factorialIdeal D n : FractionalIdeal (nonZeroDivisors D) K) =
      legendreExponent (residueCard D v) n := by
  sorry

/-- `n!_D = I_n(D)⁻¹`, stated as `n!_D · I_n(D) = D` in the submodules of `K`. -/
theorem mul_characteristicIdeal (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D))
    (n : ℕ) :
    ((factorialIdeal D n : FractionalIdeal (nonZeroDivisors D) K) : Submodule D K) *
      characteristicIdeal D K n = 1 := by
  sorry

theorem zero_eq_top : factorialIdeal D 0 = ⊤ := by
  sorry

theorem one_eq_top : factorialIdeal D 1 = ⊤ := by
  sorry

/-- `n!_ℤ = (n!)`. -/
theorem int (n : ℕ) : factorialIdeal ℤ n = Ideal.span {((n.factorial : ℕ) : ℤ)} := by
  sorry

theorem mul_dvd (hfin : FiniteResidueFields (D := D)) (m n : ℕ) :
    factorialIdeal D m * factorialIdeal D n ∣ factorialIdeal D (m + n) := by
  sorry

theorem dvd_succ (hfin : FiniteResidueFields (D := D)) (n : ℕ) :
    factorialIdeal D n ∣ factorialIdeal D (n + 1) := by
  sorry

/-- `n!_D = ∏_{2 ≤ q ≤ n} Π_q(D)^{w_q(n)}`. -/
theorem eq_prod_polyaIdeal (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D)) (n : ℕ) :
    factorialIdeal D n = ∏ q ∈ Finset.Icc 2 n, polyaIdeal D q ^ legendreExponent q n := by
  sorry

/-- `(n + 1)!_D = n!_D · ∏_q Π_q(D)^{v_q(n + 1)}`. -/
theorem succ (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D)) (n : ℕ) :
    factorialIdeal D (n + 1) =
      factorialIdeal D n * ∏ q ∈ Finset.Icc 2 (n + 1), polyaIdeal D q ^ multiplicity q (n + 1) := by
  sorry

end FactorialIdeal

namespace PolyaIdeal

/-- The exponent of `𝔪` in `Π_q(D)`. -/
theorem count_polyaIdeal (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D))
    (v : HeightOneSpectrum D) (q : ℕ) :
    FractionalIdeal.count K v (polyaIdeal D q : FractionalIdeal (nonZeroDivisors D) K) =
      if residueCard D v = q then 1 else 0 := by
  sorry

theorem eq_top_iff (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D)) (q : ℕ) :
    polyaIdeal D q = ⊤ ↔ ∀ v : HeightOneSpectrum D, residueCard D v ≠ q := by
  sorry

theorem eq_top_of_not_isPrimePow (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D))
    {q : ℕ} (hq : ¬ IsPrimePow q) : polyaIdeal D q = ⊤ := by
  sorry

theorem isCoprime (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D)) {q q' : ℕ}
    (h : q ≠ q') : IsCoprime (polyaIdeal D q) (polyaIdeal D q') := by
  sorry

end PolyaIdeal

/-- **Factorial ideals and the `Π_q` generate the same free group** (CA.3/factorial-group-basis):
the recursive inversion for a prime power `q = p^f`. -/
theorem polyaIdeal_prime_pow_eq (hD : ¬ IsField D) (hfin : FiniteResidueFields (D := D))
    {p : ℕ} (hp : p.Prime) {f : ℕ} (hf : 1 ≤ f) :
    (polyaIdeal D (p ^ f) : FractionalIdeal (nonZeroDivisors D) K) =
      (factorialIdeal D (p ^ f) : FractionalIdeal (nonZeroDivisors D) K) *
        (factorialIdeal D (p ^ f - 1) : FractionalIdeal (nonZeroDivisors D) K)⁻¹ *
        ∏ j ∈ Finset.Ico 1 f,
          (polyaIdeal D (p ^ j) : FractionalIdeal (nonZeroDivisors D) K) ^ (-((f / j : ℕ) : ℤ)) := by
  sorry

/-- **Factorial ideals and the `Π_q` generate the same free group**: freeness. -/
theorem eq_zero_of_prod_polyaIdeal_zpow_eq_one (hD : ¬ IsField D)
    (hfin : FiniteResidueFields (D := D)) (s : Finset ℕ) (c : ℕ → ℤ)
    (h : ∏ q ∈ s, (polyaIdeal D q : FractionalIdeal (nonZeroDivisors D) K) ^ c q = 1) :
    ∀ q ∈ s, polyaIdeal D q ≠ ⊤ → c q = 0 := by
  sorry

/-- **The Pólya–Ostrowski criterion** (CA.3/polya-ostrowski-criterion). -/
theorem exists_regular_basis_iff_factorialIdeal_isPrincipal (hD : ¬ IsField D)
    (hfin : FiniteResidueFields (D := D)) :
    (∃ b : Module.Basis ℕ D (intValuedPolynomials D K), ∀ n, (b n : K[X]).natDegree = n) ↔
      ∀ n, (factorialIdeal D n).IsPrincipal := by
  sorry

/-- **The Pólya–Ostrowski criterion**, the form with the ideals `Π_q`. -/
theorem forall_factorialIdeal_isPrincipal_iff (hD : ¬ IsField D)
    (hfin : FiniteResidueFields (D := D)) :
    (∀ n, (factorialIdeal D n).IsPrincipal) ↔ ∀ q, (polyaIdeal D q).IsPrincipal := by
  sorry

end Factorial

/-- Unit test `TauCeti.ClassicalArithmetic.factorialIdeal_int_eq`. -/
example (n : ℕ) : factorialIdeal ℤ n = Ideal.span {((n.factorial : ℕ) : ℤ)} := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.factorialIdeal_zero_one`. -/
example (D : Type*) [CommRing D] [IsDedekindDomain D] :
    factorialIdeal D 0 = ⊤ ∧ factorialIdeal D 1 = ⊤ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.factorialIdeal_gaussian_four`: in `ℤ[i]`, `2! = (1 + i)` and
`4! = (1 + i)³`. -/
example : factorialIdeal GaussianInt 2 = Ideal.span {(⟨1, 1⟩ : GaussianInt)} ∧
    factorialIdeal GaussianInt 4 = Ideal.span {(⟨1, 1⟩ : GaussianInt) ^ 3} := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.polyaIdeal_gaussian`. -/
example : polyaIdeal GaussianInt 2 = Ideal.span {(⟨1, 1⟩ : GaussianInt)} ∧
    polyaIdeal GaussianInt 5 = Ideal.span {(5 : GaussianInt)} ∧
    polyaIdeal GaussianInt 9 = Ideal.span {(3 : GaussianInt)} ∧ polyaIdeal GaussianInt 3 = ⊤ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.polyaIdeal_int`. -/
example (p : ℕ) (hp : p.Prime) :
    polyaIdeal ℤ p = Ideal.span {(p : ℤ)} ∧ polyaIdeal ℤ 4 = ⊤ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.polyaIdeal_six`. -/
example (D : Type*) [CommRing D] [IsDedekindDomain D] (hD : ¬ IsField D)
    (hfin : FiniteResidueFields (D := D)) : polyaIdeal D 6 = ⊤ := by
  sorry

/-! ## Pólya fields and the Pólya group -/

section Polya

open NumberField

variable (K : Type*) [Field K] [NumberField K]

/-- **Pólya fields** (CA.3/polya-field): `Int(𝓞_K)` has a regular basis. -/
def IsPolyaField : Prop :=
  ∃ b : Module.Basis ℕ (𝓞 K) (intValuedPolynomials (𝓞 K) K), ∀ n, (b n : K[X]).natDegree = n

/-- **The Pólya group** (CA.3/polya-group): the subgroup of the class group generated by the
classes of the factorial ideals. -/
def polyaGroup : Subgroup (ClassGroup (𝓞 K)) :=
  Subgroup.closure
    {c | ∃ (n : ℕ) (I : nonZeroDivisors (Ideal (𝓞 K))), (I : Ideal (𝓞 K)) = factorialIdeal (𝓞 K) n ∧
      c = ClassGroup.mk0 I}

namespace PolyaGroup

/-- The Pólya group is generated by the classes of the `Π_q`. -/
theorem eq_closure_polyaIdeal :
    polyaGroup K = Subgroup.closure
      {c | ∃ (q : ℕ) (I : nonZeroDivisors (Ideal (𝓞 K))), (I : Ideal (𝓞 K)) = polyaIdeal (𝓞 K) q ∧
        c = ClassGroup.mk0 I} := by
  sorry

/-- `Po(K) = ⊥` iff `K` is a Pólya field. -/
theorem eq_bot_iff : polyaGroup K = ⊥ ↔ IsPolyaField K := by
  sorry

theorem card_dvd_classNumber : Nat.card (polyaGroup K) ∣ classNumber K := by
  sorry

theorem eq_bot_of_classNumber_eq_one (h : classNumber K = 1) : polyaGroup K = ⊥ := by
  sorry

theorem rat : polyaGroup ℚ = ⊥ := by
  sorry

end PolyaGroup

namespace IsPolyaField

theorem iff_factorialIdeal_isPrincipal :
    IsPolyaField K ↔ ∀ n, (factorialIdeal (𝓞 K) n).IsPrincipal := by
  sorry

theorem iff_polyaIdeal_isPrincipal :
    IsPolyaField K ↔ ∀ q, (polyaIdeal (𝓞 K) q).IsPrincipal := by
  sorry

theorem of_classNumber_eq_one (h : classNumber K = 1) : IsPolyaField K := by
  sorry

theorem rat : IsPolyaField ℚ := by
  sorry

end IsPolyaField

/-- **Ostrowski's theorem** (CA.3/polya-group-of-a-galois-field): in a Galois field,
`Π_{p^f}^e = p 𝓞_K`. -/
theorem polyaIdeal_pow_ramificationIdxIn [IsGalois ℚ K] {p : ℕ} (hp : p.Prime) :
    polyaIdeal (𝓞 K) (p ^ (Ideal.span {(p : ℤ)}).inertiaDegIn (𝓞 K)) ^
        (Ideal.span {(p : ℤ)}).ramificationIdxIn (𝓞 K) = Ideal.span {(p : 𝓞 K)} := by
  sorry

/-- **Ostrowski's theorem**: the other `Π_{p^j}` are trivial. -/
theorem polyaIdeal_prime_pow_eq_top [IsGalois ℚ K] {p : ℕ} (hp : p.Prime) {j : ℕ}
    (hj : j ≠ (Ideal.span {(p : ℤ)}).inertiaDegIn (𝓞 K)) : polyaIdeal (𝓞 K) (p ^ j) = ⊤ := by
  sorry

/-- **Ostrowski's theorem**: `|Po(K)|` divides the product of the ramification indices. -/
theorem card_polyaGroup_dvd_prod_ramificationIdxIn [IsGalois ℚ K] :
    Nat.card (polyaGroup K) ∣
      ∏ p ∈ (discr K).natAbs.primeFactors, (Ideal.span {(p : ℤ)}).ramificationIdxIn (𝓞 K) := by
  sorry

/-- **Ostrowski's theorem**: a Galois field whose degree is prime to its class number is a Pólya
field. -/
theorem isPolyaField_of_coprime [IsGalois ℚ K] (h : (Module.finrank ℚ K).Coprime (classNumber K)) :
    IsPolyaField K := by
  sorry

/-- **The imaginary quadratic Pólya fields** (CA.3/imaginary-quadratic-polya-fields). -/
theorem isPolyaField_iff_of_sq_eq {d : ℤ} (hd : d < 0) (hsq : Squarefree d)
    (hK : Module.finrank ℚ K = 2) {θ : K} (hθ : θ ^ 2 = d) :
    IsPolyaField K ↔ d = -1 ∨ d = -2 ∨ ∃ p : ℕ, p.Prime ∧ p % 4 = 3 ∧ d = -p := by
  sorry

/-- **Zantema's theorem** (CA.3/cyclotomic-fields-are-polya): cyclotomic fields are Pólya fields. -/
theorem isPolyaField_of_isCyclotomicExtension (n : ℕ) [NeZero n] [IsCyclotomicExtension {n} ℚ K] :
    IsPolyaField K := by
  sorry

/-- **Zantema's theorem**, the explicit generator at a prime dividing `n = p^(k+1) m`. -/
theorem polyaIdeal_eq_span_zeta_sub_one {n p k m : ℕ} [NeZero n] [IsCyclotomicExtension {n} ℚ K]
    [NeZero (p ^ (k + 1))] (hp : p.Prime) (hn : n = p ^ (k + 1) * m) (hm : ¬ p ∣ m) {ζ : K}
    (hζ : IsPrimitiveRoot ζ (p ^ (k + 1))) :
    polyaIdeal (𝓞 K) (p ^ orderOf (p : ZMod m)) = Ideal.span {hζ.toInteger - 1} := by
  sorry

end Polya

/-- Unit test `TauCeti.ClassicalArithmetic.polyaGroup_rat_test`. -/
example : polyaGroup ℚ = ⊥ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.isPolyaField_rat_test`. -/
example : IsPolyaField ℚ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.not_isPolyaField_sqrt_neg_five`: an imaginary
quadratic field with two ramified primes is not a Pólya field (here `ℚ(√-5)`). -/
example (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) {θ : K}
    (hθ : θ ^ 2 = -5) : ¬ IsPolyaField K := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.isPolyaField_sqrt_neg_23`: `ℚ(√-23)` is a Pólya field
although its class number is `3`. -/
example (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) {θ : K}
    (hθ : θ ^ 2 = -23) : IsPolyaField K ∧ NumberField.classNumber K = 3 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.polyaGroup_sqrt_neg_23_ne_classGroup`. -/
example (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) {θ : K}
    (hθ : θ ^ 2 = -23) : polyaGroup K = ⊥ ∧ Nat.card (ClassGroup (NumberField.RingOfIntegers K)) = 3 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.factorialIdeal_sqrt_neg_five_two` and
`TauCeti.ClassicalArithmetic.polyaIdeal_sqrt_neg_five`: in `ℚ(√-5)`, `2! = Π₂ = (2, 1 + √-5)` is not
principal, although `Π₂² = (2)`. -/
example (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) {θ : K}
    (hθ : θ ^ 2 = -5) :
    factorialIdeal (NumberField.RingOfIntegers K) 2 = polyaIdeal (NumberField.RingOfIntegers K) 2 ∧
    ¬ (polyaIdeal (NumberField.RingOfIntegers K) 2).IsPrincipal ∧
    polyaIdeal (NumberField.RingOfIntegers K) 2 ^ 2 = Ideal.span {(2 : NumberField.RingOfIntegers K)} := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.isPolyaField_gaussian`: `ℚ(i)` is a Pólya field. -/
example (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) {θ : K}
    (hθ : θ ^ 2 = -1) : IsPolyaField K := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.card_polyaGroup_dvd_sqrt_neg_23`. -/
example (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) {θ : K}
    (hθ : θ ^ 2 = -23) : Nat.card (polyaGroup K) ∣ NumberField.classNumber K := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.polyaGroup_sqrt_neg_five`. -/
example (K : Type*) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) {θ : K}
    (hθ : θ ^ 2 = -5) : polyaGroup K = ⊤ ∧ Nat.card (polyaGroup K) = 2 := by
  sorry

/-! ## Factor bounds -/

section FactorBounds

/-- The Euclidean norm of the coefficient vector of an integer polynomial. -/
def l2Norm (f : ℤ[X]) : ℝ :=
  Real.sqrt (∑ i ∈ f.support, ((f.coeff i : ℤ) : ℝ) ^ 2)

/-- **Mignotte's inequality for irreducible integer factors**
(CA.3/mignotte-irreducible-factor-l2-bound), as quoted by Bary-Soroker–Koukoulopoulos–Kozma. -/
theorem l2Norm_le_of_irreducible_dvd {A I : ℤ[X]} (hA : A ≠ 0) (hI : Irreducible I) (hdvd : I ∣ A)
    (hm : 1 ≤ I.natDegree) :
    l2Norm I ≤ Real.exp (Real.sqrt I.natDegree) *
      (I.natDegree + 2 * Real.sqrt I.natDegree + 2) ^ (1 + Real.sqrt I.natDegree) *
      l2Norm A ^ (1 + Real.sqrt I.natDegree) := by
  sorry

/-- The classical consequence of the Mahler-measure API: `‖I‖₂ ≤ C(2m, m)^{1/2} ‖A‖₂`. -/
theorem l2Norm_le_sqrt_choose_mul_of_dvd {A I : ℤ[X]} (hA : A ≠ 0) (hdvd : I ∣ A) :
    l2Norm I ≤ Real.sqrt ((2 * I.natDegree).choose I.natDegree) * l2Norm A := by
  sorry

/-- **Size of an irreducible factor at an integer point** (CA.3/irreducible-factor-evaluation-bound;
Bary-Soroker–Koukoulopoulos–Kozma, Lemma 3.4). -/
theorem abs_eval_le_of_irreducible_dvd {A I : ℤ[X]} {H : ℝ} (hH : 1 ≤ H)
    (hcoeff : ∀ i, |(A.coeff i : ℝ)| ≤ H) (hn : 1 ≤ A.natDegree) (hI : Irreducible I)
    (hdvd : I ∣ A) (hm : 1 ≤ I.natDegree) {N : ℤ} (hN : 2 ≤ N) :
    |((I.eval N : ℤ) : ℝ)| ≤ (N : ℝ) ^ I.natDegree *
      Real.exp (4 * (1 + Real.sqrt I.natDegree) *
        Real.log (14 * Real.sqrt A.natDegree * H)) := by
  sorry

/-- The corrected coefficient norm `‖A‖₂ ≤ H √(n + 1)`. -/
theorem l2Norm_le_of_abs_coeff_le {A : ℤ[X]} {H : ℝ} (hcoeff : ∀ i, |(A.coeff i : ℝ)| ≤ H) :
    l2Norm A ≤ H * Real.sqrt (A.natDegree + 1) := by
  sorry

end FactorBounds

/-! ## Squarefree integral combinations -/

section Squarefree

/-- **The primitive gcd** (CA.3/primitive-polynomial-gcd): the primitive part of the gcd in the GCD
monoid `ℤ[X]` (whose normalization makes the leading coefficient positive). -/
def primitiveGcd (s : Finset ℤ[X]) : ℤ[X] :=
  (s.gcd id).primPart

namespace PrimitiveGcd

theorem isPrimitive (s : Finset ℤ[X]) (hs : s.Nonempty) (h0 : (0 : ℤ[X]) ∉ s) :
    (primitiveGcd s).IsPrimitive := by
  sorry

theorem leadingCoeff_pos (s : Finset ℤ[X]) (hs : s.Nonempty) (h0 : (0 : ℤ[X]) ∉ s) :
    0 < (primitiveGcd s).leadingCoeff := by
  sorry

theorem dvd (s : Finset ℤ[X]) {Q : ℤ[X]} (hQ : Q ∈ s) : primitiveGcd s ∣ Q := by
  sorry

theorem dvd_primitiveGcd (s : Finset ℤ[X]) {H : ℤ[X]} (hH : H.IsPrimitive)
    (h : ∀ Q ∈ s, H.map (Int.castRingHom ℚ) ∣ Q.map (Int.castRingHom ℚ)) : H ∣ primitiveGcd s := by
  sorry

theorem natDegree_eq (s : Finset ℤ[X]) (h0 : (0 : ℤ[X]) ∉ s) :
    (primitiveGcd s).natDegree = (s.gcd (Polynomial.map (Int.castRingHom ℚ))).natDegree := by
  sorry

/-- The quotients `Q / G` have no common nonconstant primitive factor. -/
theorem quotients_coprime (s : Finset ℤ[X]) {H : ℤ[X]} (hH : H.IsPrimitive)
    (h : ∀ Q ∈ s, H * primitiveGcd s ∣ Q) (hs : s.Nonempty) (h0 : (0 : ℤ[X]) ∉ s) : IsUnit H := by
  sorry

end PrimitiveGcd

/-- Unit test `TauCeti.ClassicalArithmetic.primitiveGcd_two_four`. -/
example : primitiveGcd {2 * X, 4 * X} = X := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.primitiveGcd_ne_gcdMonoid`: the content is discarded. -/
example : ({2 * X, 4 * X} : Finset ℤ[X]).gcd id = 2 * X ∧ primitiveGcd {2 * X, 4 * X} = X := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.natDegree_primitiveGcd_eq`. -/
example : primitiveGcd {X ^ 2 - 1, X ^ 2 + X} = X + 1 ∧
    (primitiveGcd {X ^ 2 - 1, X ^ 2 + X}).natDegree =
      (({X ^ 2 - 1, X ^ 2 + X} : Finset ℤ[X]).gcd (Polynomial.map (Int.castRingHom ℚ))).natDegree := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.primitiveGcd_single`. -/
example : primitiveGcd {-6 * X - 4} = 3 * X + 2 := by
  sorry

/-- **A bounded squarefree integral combination** (CA.3/squarefree-integral-combination; Smith,
Lemma 2.10). The polynomials are `Q 0, …, Q k`, with `Q 0` taking the coefficient `1`. -/
theorem exists_squarefree_combination {k n : ℕ} (Q : Fin (k + 1) → ℤ[X]) (hQ : ∀ i, Q i ≠ 0)
    (hdeg : ∀ i, (Q i).natDegree ≤ n) (hn : ∃ i, (Q i).natDegree = n) :
    ∃ b : Fin k → ℕ,
      (∑ j, b j ≤ 2 * (n - (primitiveGcd (Finset.univ.image Q)).natDegree)) ∧
      ∃ R : ℤ[X], Q 0 + ∑ j : Fin k, (b j : ℤ[X]) * Q j.succ = primitiveGcd (Finset.univ.image Q) * R ∧
        R.natDegree = n - (primitiveGcd (Finset.univ.image Q)).natDegree ∧
        Squarefree (R.map (Int.castRingHom ℚ)) := by
  sorry

/-- Unit test from the acceptance list: `X² + b X⁰` is squarefree for `b = 1` but not for `b = 0`. -/
example : ¬ Squarefree ((X ^ 2 : ℚ[X])) ∧ Squarefree ((X ^ 2 + 1 : ℚ[X])) := by
  sorry

end Squarefree

/-! ## Fujiwara's root bound -/

section Fujiwara

/-- **Fujiwara's weighted root bound** (CA.3/fujiwara-weighted-root-bound), for
`f = ∑_{k ≤ n} a k X^(n - k)` with `a 0 ≠ 0`. -/
theorem norm_le_of_fujiwara_weights {n : ℕ} (hn : 1 ≤ n) (a : ℕ → ℂ) (ha : a 0 ≠ 0)
    (w : ℕ → ℝ) (hw : ∀ k ∈ Finset.Icc 1 n, 0 < w k)
    (hsum : ∑ k ∈ Finset.Icc 1 n, (w k)⁻¹ ≤ 1) {α : ℂ}
    (hα : ∑ k ∈ Finset.range (n + 1), a k * α ^ (n - k) = 0) :
    ∃ k ∈ Finset.Icc 1 n, ‖α‖ ≤ (w k * ‖a k / a 0‖) ^ ((k : ℝ)⁻¹) := by
  sorry

/-- **Fujiwara's root bound** (CA.3/fujiwara-root-bound) for a monic polynomial: every root `θ`
satisfies `‖θ‖ ≤ 2 · max(‖a_1‖, …, ‖a_{n-1}‖^{1/(n-1)}, ‖a_n / 2‖^{1/n})`, stated as a bound by
one of the terms. -/
theorem norm_le_fujiwara {f : ℂ[X]} (hf : f.Monic) (hn : 1 ≤ f.natDegree) {θ : ℂ}
    (hθ : f.IsRoot θ) :
    (∃ k ∈ Finset.Ico 1 f.natDegree,
        ‖θ‖ ≤ 2 * ‖f.coeff (f.natDegree - k)‖ ^ ((k : ℝ)⁻¹)) ∨
      ‖θ‖ ≤ 2 * ‖f.coeff 0 / 2‖ ^ ((f.natDegree : ℝ)⁻¹) := by
  sorry

end Fujiwara

/-- Unit test from the acceptance list: for `X² − 4` the corrected bound is `2√2 ≥ 2`, while the
form without the factor `2` would give `√2 < 2`. -/
example : (2 : ℝ) ≤ 2 * ‖((4 : ℂ) / 2)‖ ^ ((2 : ℝ)⁻¹) ∧ ‖((4 : ℂ) / 2)‖ ^ ((2 : ℝ)⁻¹) < 2 := by
  sorry

/-! ## The Gregory–Newton expansion -/

/-- **The Gregory–Newton expansion** (CA.3/newton-forward-difference-expansion). -/
theorem eq_sum_fwdDiff_mul_choose (f : ℚ[X]) {N : ℕ} (hN : f.natDegree ≤ N) :
    f = ∑ k ∈ Finset.range (N + 1),
      C ((fwdDiff 1)^[k] (fun x : ℚ => f.eval x) 0) * Ring.choose (X : ℚ[X]) k := by
  sorry

/-- Unit test from the acceptance list: `X² = (X choose 1) + 2 (X choose 2)`. -/
example : (X ^ 2 : ℚ[X]) = Ring.choose (X : ℚ[X]) 1 + 2 * Ring.choose (X : ℚ[X]) 2 := by
  sorry

/-! ## The lower Newton polygon of a finite point family -/

section NewtonPolygon

variable (I : Finset ℕ) (hI : I.Nonempty) (y : ℕ → ℝ)

/-- **The supporting value** `μ_r = min_{i ∈ I} (y i + r i)`
(CA.3/newton-polygon-of-a-point-family). -/
def newtonSupport (r : ℝ) : ℝ := I.inf' hI fun i => y i + r * i

open Classical in
/-- The contact set of the supporting line of parameter `r`. -/
def newtonContact (r : ℝ) : Finset ℕ := I.filter fun i => y i + r * i = newtonSupport I hI y r

/-- The width `m_r = max C_r − min C_r` of the side of parameter `r`. -/
def newtonWidth (r : ℝ) : ℕ :=
  (newtonContact I hI y r).sup id - ((newtonContact I hI y r).min).untopD 0

namespace NewtonPolygon

theorem newtonSupport_le {i : ℕ} (hi : i ∈ I) (r : ℝ) : newtonSupport I hI y r ≤ y i + r * i := by
  sorry

theorem mem_newtonContact_iff (r : ℝ) (i : ℕ) :
    i ∈ newtonContact I hI y r ↔ i ∈ I ∧ y i + r * i = newtonSupport I hI y r := by
  sorry

theorem newtonContact_nonempty (r : ℝ) : (newtonContact I hI y r).Nonempty := by
  sorry

theorem finite_setOf_newtonWidth_pos : {r : ℝ | 0 < newtonWidth I hI y r}.Finite := by
  sorry

/-- The widths add up to the span of `I`. -/
theorem sum_newtonWidth :
    ∑ᶠ r : ℝ, newtonWidth I hI y r = I.sup id - (I.min).untopD 0 := by
  sorry

/-- **Slope ordering.** -/
theorem max_newtonContact_le_min {r r' : ℝ} (h : r < r') :
    (newtonContact I hI y r').sup id ≤ ((newtonContact I hI y r).min).untopD 0 := by
  sorry

theorem concaveOn_newtonSupport : ConcaveOn ℝ Set.univ (newtonSupport I hI y) := by
  sorry

/-- The two ends of the side of parameter `r` lie on its supporting line. -/
theorem newtonSide_endpoints (r : ℝ) :
    y ((newtonContact I hI y r).sup id) =
      y (((newtonContact I hI y r).min).untopD 0) - r * newtonWidth I hI y r := by
  sorry

/-- Compatibility with the sloped valuation of the main CA.3 file
(`slopedValuation v r f = f.support.inf fun i => v (f.coeff i) + r i`): for `f ≠ 0`, with the points
`(i, v (aᵢ))` on the support. -/
theorem newtonSupport_polynomial {K : Type*} [Field K] (v : AddValuation K (WithTop ℝ))
    (hv : ∀ x : K, x ≠ 0 → v x ≠ ⊤) {f : K[X]} (hf : f.support.Nonempty) (r : ℝ) :
    ((newtonSupport f.support hf (fun i => (v (f.coeff i)).untopD 0) r : ℝ) : WithTop ℝ) =
      f.support.inf fun i => v (f.coeff i) + ((r * i : ℝ) : WithTop ℝ) := by
  sorry

end NewtonPolygon

end NewtonPolygon

/-- Unit test `TauCeti.ClassicalArithmetic.newtonWidth_example`: the points `(0, 2), (2, 1), (5, 0)`. -/
example :
    newtonWidth {0, 2, 5} (by simp) (fun i => if i = 0 then 2 else if i = 2 then 1 else 0) (1 / 2) = 2 ∧
    newtonWidth {0, 2, 5} (by simp) (fun i => if i = 0 then 2 else if i = 2 then 1 else 0) (1 / 3) = 3 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.newtonWidth_singleton`. -/
example (i₀ : ℕ) (y : ℕ → ℝ) (r : ℝ) : newtonWidth {i₀} (by simp) y r = 0 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.newtonSupport_eq_slopedValuation`: the points `(0, 1), (2, 0)`
of `X² − 2` over `ℚ₂` have the single side `r = 1/2` of width `2`. -/
example : newtonWidth {0, 2} (by simp) (fun i => if i = 0 then 1 else 0) (1 / 2) = 2 ∧
    ∀ r : ℝ, r ≠ 1 / 2 → newtonWidth {0, 2} (by simp) (fun i => if i = 0 then 1 else 0) r = 0 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.newtonContact_not_chord`: the points `(0,0), (1,-1), (2,0)`. -/
example :
    newtonContact {0, 1, 2} (by simp) (fun i => if i = 1 then -1 else 0) 0 = {1} ∧
    newtonContact {0, 1, 2} (by simp) (fun i => if i = 1 then -1 else 0) 1 = {0, 1} := by
  sorry

/-! ## Gauss–Jordan elimination and kernel bases -/

section GaussJordan

variable {F : Type*} [Field F] [DecidableEq F] {m n : ℕ}

/-- The output of Gauss–Jordan elimination (CA.3/gauss-jordan-reduced-echelon-form). -/
structure GaussJordanResult (A : Matrix (Fin m) (Fin n) F) where
  /-- The row transformation. -/
  P : Matrix (Fin m) (Fin m) F
  /-- Its inverse. -/
  P' : Matrix (Fin m) (Fin m) F
  /-- The reduced row echelon form. -/
  R : Matrix (Fin m) (Fin n) F
  /-- The pivot of each row (`⊤` for a zero row). -/
  pivot : Fin m → WithTop (Fin n)
  mul_eq : P * A = R
  mul_inv : P * P' = 1
  inv_mul : P' * P = 1
  isReducedRowEchelon : R.IsReducedRowEchelon
  isPivotedBy : R.IsPivotedBy pivot

/-- Existence of a Gauss–Jordan result; the roadmap asks for it as a terminating computation by
recursion on the columns. -/
theorem nonempty_gaussJordanResult (A : Matrix (Fin m) (Fin n) F) :
    Nonempty (GaussJordanResult A) := by
  sorry

/-- **Gauss–Jordan elimination**. -/
def gaussJordan (A : Matrix (Fin m) (Fin n) F) : GaussJordanResult A :=
  Classical.choice (nonempty_gaussJordanResult A)

/-- Uniqueness of the reduced row echelon form. -/
theorem IsReducedRowEchelon.eq_of_mul {R₁ R₂ : Matrix (Fin m) (Fin n) F}
    (h₁ : R₁.IsReducedRowEchelon) (h₂ : R₂.IsReducedRowEchelon) {Q : Matrix (Fin m) (Fin m) F}
    (hQ : IsUnit Q.det) (h : Q * R₁ = R₂) : R₁ = R₂ := by
  sorry

theorem card_pivots_gaussJordan (A : Matrix (Fin m) (Fin n) F) :
    (Finset.univ.filter fun i => (gaussJordan A).pivot i ≠ ⊤).card = A.rank := by
  sorry

theorem ker_toLin'_gaussJordan (A : Matrix (Fin m) (Fin n) F) :
    LinearMap.ker (Matrix.toLin' A) = LinearMap.ker (Matrix.toLin' (gaussJordan A).R) := by
  sorry

/-- The kernel vector attached to a free column `j` of a reduced echelon form `R` with pivot
function `pivot`: `1` at `j`, `0` at the other free columns, `-R i j` at the pivot of row `i`. -/
def kernelVector (R : Matrix (Fin m) (Fin n) F) (pivot : Fin m → WithTop (Fin n)) (j : Fin n) :
    Fin n → F := fun c =>
  if c = j then 1
  else if h : ∃ i, pivot i = (c : WithTop (Fin n)) then -R (Classical.choose h) j else 0

/-- **The kernel basis read off a reduced row echelon form**
(CA.3/kernel-basis-of-a-reduced-echelon-matrix). -/
theorem exists_basis_ker_of_isPivotedBy {R : Matrix (Fin m) (Fin n) F}
    {pivot : Fin m → WithTop (Fin n)} (hR : R.IsReducedRowEchelon) (hp : R.IsPivotedBy pivot) :
    ∃ b : Module.Basis {j : Fin n // ∀ i, pivot i ≠ (j : WithTop (Fin n))} F
        (LinearMap.ker (Matrix.toLin' R)),
      ∀ j, (b j : Fin n → F) = kernelVector R pivot j := by
  sorry

theorem finrank_ker_toLin' (A : Matrix (Fin m) (Fin n) F) :
    Module.finrank F (LinearMap.ker (Matrix.toLin' A)) = n - A.rank := by
  sorry

end GaussJordan

/-- Unit test `TauCeti.ClassicalArithmetic.gaussJordan_example_rat`. -/
example : (gaussJordan !![(1 : ℚ), 2, 1; 2, 4, 0]).R = !![1, 2, 0; 0, 0, 1] := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.gaussJordan_zero`. -/
example : (gaussJordan (0 : Matrix (Fin 2) (Fin 3) ℚ)).R = 0 ∧
    ∀ i, (gaussJordan (0 : Matrix (Fin 2) (Fin 3) ℚ)).pivot i = ⊤ := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.gaussJordan_zmod_two_rank`. -/
example : (gaussJordan !![(1 : ZMod 2), 1; 1, 1]).R = !![1, 1; 0, 0] ∧
    (!![(1 : ZMod 2), 1; 1, 1]).rank = 1 := by
  sorry

/-- Unit test `TauCeti.ClassicalArithmetic.not_isReducedRowEchelon_example`. -/
example : (!![(1 : ℚ), 2; 0, 1]).IsRowEchelon ∧ ¬ (!![(1 : ℚ), 2; 0, 1]).IsReducedRowEchelon := by
  sorry

/-- Acceptance example: the kernel of `[[1, 2, 1], [2, 4, 0]]` over `ℚ` is spanned by `(-2, 1, 0)`. -/
example : Matrix.toLin' !![(1 : ℚ), 2, 1; 2, 4, 0] ![-2, 1, 0] = 0 := by
  sorry

end TauCeti.ClassicalArithmetic
