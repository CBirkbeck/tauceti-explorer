import Mathlib

/-!
# QSeriesPartitionsAndMockModularForms: representative target signatures

The roadmap is `README.md`; it is normative and exhaustive. This file records the light
definitions and the theorem signatures that can be stated against the pinned Mathlib and
Tau Ceti, together with proved `example` checks of the kept definitions. It is not
exhaustive: the harmonic Maass forms, Zwegers' completions, indefinite theta functions,
quantum modular forms, vertex algebras and the moonshine module have no carrier at the
pins and are README targets only.

Design choices made explicit here:
* the q-Pochhammer symbol takes an arbitrary base, and its infinite version is defined
  coefficientwise in `R⟦X⟧`, so that it exists for every base and agrees with the
  coefficientwise product when the base has positive order (README §0.1);
* the Dedekind sum is the rational number `Σ_{r<k} (r/k)(fract(hr/k) − 1/2)`, and the eta
  multiplier is defined from it by cases on the sign of `c`, normalised by the principal
  square root of `cτ + d` (README §§1.1–1.2);
* the Kloosterman sums of the partition function are defined from the Dedekind sum, so
  that Rademacher's formula and Lehmer's theory are stated on one carrier (README §2.4);
* the crank and the rank are integer-valued functions on Mathlib's `Nat.Partition`
  (README §5.6).
-/

noncomputable section

namespace TauCetiRoadmap.QSeriesPartitionsAndMockModularForms

open Finset Filter
open scoped Topology

/-! ## Layer 0: formal q-series and partitions -/

section Layer0

/-- The partition function `p(n)`: the number of partitions of `n`, as the cardinality of
Mathlib's finite type `Nat.Partition n` (README §0.1). -/
def partitionCount (n : ℕ) : ℕ := Fintype.card n.Partition

-- The empty partition is counted, alongside the unique partition of one.
example : partitionCount 0 = 1 ∧ partitionCount 1 = 1 := by
  simp [partitionCount]

/-- The finite q-Pochhammer symbol `(a; b)_n = ∏_{i<n} (1 − a bⁱ)` with an arbitrary base `b`
in a commutative ring (README §0.1). For `b = q` it is the evaluation of
HabiroCyclotomicCompletions' `pochhammer`. -/
def qPochhammer {R : Type*} [CommRing R] (a b : R) (n : ℕ) : R :=
  ∏ i ∈ range n, (1 - a * b ^ i)

/-- The infinite q-Pochhammer symbol `(a; b)_∞ ∈ R⟦X⟧`, defined coefficientwise: its `m`-th
coefficient is that of `(a; b)_{m+1}`. When `constantCoeff b = 0` it is the coefficientwise
product `∏_{i ≥ 0} (1 − a bⁱ)` (`hasProd_qPochhammerInf`, README §0.1). -/
def qPochhammerInf {R : Type*} [CommRing R] (a b : PowerSeries R) : PowerSeries R :=
  PowerSeries.mk fun m ↦ PowerSeries.coeff m (qPochhammer a b (m + 1))

-- The factor with index zero is retained and the base enters as a power.
example (a q : ℤ) : qPochhammer a q 2 = (1 - a) * (1 - a * q) := by
  simp [qPochhammer, Finset.prod_range_succ]

-- `(0; b)_∞ = 1` and `(1; q)_∞ = 0`: a product starting at index one would fail the second.
example : qPochhammerInf (0 : PowerSeries ℤ) PowerSeries.X = 1 := by
  ext n
  simp [qPochhammerInf, qPochhammer]

example : qPochhammerInf (1 : PowerSeries ℤ) PowerSeries.X = 0 := by
  ext n
  simp [qPochhammerInf, qPochhammer, Finset.prod_range_succ']

/-- Coefficientwise finiteness of `(a; b)_∞` (README §0.1, `coeff_qPochhammerInf`). -/
theorem coeff_qPochhammerInf {R : Type*} [CommRing R] (a b : PowerSeries R)
    (hb : PowerSeries.constantCoeff b = 0) {m n : ℕ} (hmn : m < n) :
    PowerSeries.coeff m (qPochhammerInf a b) = PowerSeries.coeff m (qPochhammer a b n) := sorry

/-- The first Rogers–Ramanujan identity on the unit disc (README §0.7). The formal identity in
`ℤ⟦q⟧` and the partition form are the companion targets there. -/
theorem rogers_ramanujan_first {q : ℂ} (hq : ‖q‖ < 1) :
    (∑' n : ℕ, q ^ (n * n) / qPochhammer q q n) =
      ∏' n : ℕ, ((1 - q ^ (5 * n + 1)) * (1 - q ^ (5 * n + 4)))⁻¹ := sorry

/-- The second Rogers–Ramanujan identity on the unit disc (README §0.7). -/
theorem rogers_ramanujan_second {q : ℂ} (hq : ‖q‖ < 1) :
    (∑' n : ℕ, q ^ (n * n + n) / qPochhammer q q n) =
      ∏' n : ℕ, ((1 - q ^ (5 * n + 2)) * (1 - q ^ (5 * n + 3)))⁻¹ := sorry

/-- Ramanujan's congruence modulo 5 (README §0.6). -/
theorem ramanujan_congruence_mod_five (n : ℕ) : 5 ∣ partitionCount (5 * n + 4) := sorry

/-- Ramanujan's congruence modulo 7 (README §0.6). -/
theorem ramanujan_congruence_mod_seven (n : ℕ) : 7 ∣ partitionCount (7 * n + 5) := sorry

/-- Bailey pairs relative to `a` with values in a field (README §0.9):
`β_n = Σ_{r ≤ n} α_r / ((q; q)_{n−r} (aq; q)_{n+r})`. The relation is meaningful when no
`1 − q^m` or `1 − aq^m` with `m ≥ 1` vanishes, which the theorems below assume. -/
def IsBaileyPairIn {K : Type*} [Field K] (q a : K) (α β : ℕ → K) : Prop :=
  ∀ n, β n = ∑ r ∈ range (n + 1), α r / (qPochhammer q q (n - r) * qPochhammer (a * q) q (n + r))

-- The relation at `n = 0` reads `β₀ = α₀`: the diagonal factor is `(aq; q)_0 = 1`.
example {K : Type*} [Field K] (q a : K) (α β : ℕ → K) (h : IsBaileyPairIn q a α β) :
    β 0 = α 0 := by
  simpa [qPochhammer] using h 0

/-- Bailey's lemma with two parameters (README §0.9; Andrews 1986, (2.3)–(2.6)). -/
theorem bailey_lemma_parameters {K : Type*} [Field K] (q a ρ₁ ρ₂ : K) (α β : ℕ → K)
    (hq : ∀ m : ℕ, 0 < m → q ^ m ≠ 1) (ha : ∀ m : ℕ, 0 < m → a * q ^ m ≠ 1)
    (hρ₁ : ρ₁ ≠ 0) (hρ₂ : ρ₂ ≠ 0)
    (h₁ : ∀ m : ℕ, 0 < m → a * q ^ m ≠ ρ₁) (h₂ : ∀ m : ℕ, 0 < m → a * q ^ m ≠ ρ₂)
    (h : IsBaileyPairIn q a α β) :
    IsBaileyPairIn q a
      (fun r ↦ qPochhammer ρ₁ q r * qPochhammer ρ₂ q r * (a * q / (ρ₁ * ρ₂)) ^ r * α r /
        (qPochhammer (a * q / ρ₁) q r * qPochhammer (a * q / ρ₂) q r))
      (fun n ↦ (∑ j ∈ range (n + 1), qPochhammer ρ₁ q j * qPochhammer ρ₂ q j *
          qPochhammer (a * q / (ρ₁ * ρ₂)) q (n - j) * (a * q / (ρ₁ * ρ₂)) ^ j * β j /
            qPochhammer q q (n - j)) /
        (qPochhammer (a * q / ρ₁) q n * qPochhammer (a * q / ρ₂) q n)) := sorry

/-- Andrews' partial-sum identity (README §0.9; Andrews 1986, Lemma 2 (4.3)), with
`(a; q)_j / (1 − a)` written as `(aq; q)_{j−1}` so that it holds at `a = 1`. -/
theorem andrews_lemma_two {K : Type*} [Field K] (a b q : K) (n : ℕ) (hb : b ≠ 0)
    (hq : ∀ m : ℕ, 0 < m → q ^ m ≠ 1) (h₁ : ∀ m : ℕ, 0 < m → a * q ^ m ≠ b) :
    1 + ∑ j ∈ Finset.Icc 1 n, qPochhammer (a * q) q (j - 1) * (1 - a * q ^ (2 * j)) *
        qPochhammer b q j * a ^ j * q ^ (j * j) / (b ^ j * qPochhammer q q j *
          qPochhammer (a * q / b) q j) =
      qPochhammer (a * q) q n / qPochhammer (a * q / b) q n *
        ∑ j ∈ range (n + 1), qPochhammer b q j * (a * q ^ (n + 1) / b) ^ j / qPochhammer q q j :=
  sorry

end Layer0

/-! ## Layer 1: theta, eta and Jacobi forms -/

section Layer1

/-- The Dedekind sum `s(h, k) = Σ_{r<k} (r/k)(fract(hr/k) − 1/2)` (README §1.1, Kong–Teo
(6.1)). For `gcd(h, k) = 1` this is the classical sawtooth sum; `s(h, 0) = s(h, 1) = 0`. -/
def dedekindSum (h : ℤ) (k : ℕ) : ℚ :=
  ∑ r ∈ range k, ((r : ℚ) / k) * (Int.fract ((h * r : ℚ) / k) - 1 / 2)

-- The term with `r = 0` vanishes, so `s(h, 1) = 0`.
example (h : ℤ) : dedekindSum h 1 = 0 := by
  simp [dedekindSum]

-- `s(1, 3) = (1/3)(1/3 − 1/2) + (2/3)(2/3 − 1/2) = 1/18`, which pins the weight `r/k`.
example : dedekindSum 1 3 = 1 / 18 := by
  have h1 : Int.fract ((1 : ℚ) / 3) = 1 / 3 := by
    rw [Int.fract_eq_iff]; norm_num; exact ⟨0, by simp⟩
  have h2 : Int.fract ((2 : ℚ) / 3) = 2 / 3 := by
    rw [Int.fract_eq_iff]; norm_num; exact ⟨0, by simp⟩
  simp only [dedekindSum, Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [h1, h2]

/-- Dedekind reciprocity (README §1.1). -/
theorem dedekind_reciprocity {h k : ℕ} (hh : 0 < h) (hk : 0 < k) (hhk : Nat.Coprime h k) :
    dedekindSum h k + dedekindSum k h =
      ((h : ℚ) ^ 2 + (k : ℚ) ^ 2 - 3 * h * k + 1) / (12 * h * k) := sorry

/-- The eta multiplier `v_η(γ)` on `SL(2, ℤ)` (README §1.2): for `c > 0` it is
`exp(πi((a + d)/(12c) + s(−d, c) − 1/4))`, for `c = 0` it is `exp(πib/12)` or
`−i·exp(−πib/12)` according as `d = 1` or `d = −1`, and for `c < 0` it is `i·v_η(−γ)`.
It is normalised by `η(γτ) = v_η(γ)(cτ + d)^{1/2}η(τ)` with the principal square root. -/
def etaMultiplier (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) : ℂ :=
  let a := γ 0 0; let b := γ 0 1; let c := γ 1 0; let d := γ 1 1
  if 0 < c then
    Complex.exp (Real.pi * Complex.I *
      (((a + d : ℤ) : ℂ) / (12 * c) + (dedekindSum (-d) c.toNat : ℂ) - 1 / 4))
  else if c = 0 then
    (if d = 1 then Complex.exp (Real.pi * Complex.I * b / 12)
      else -Complex.I * Complex.exp (-(Real.pi * Complex.I * b / 12)))
  else
    Complex.I * Complex.exp (Real.pi * Complex.I *
      (((a + d : ℤ) : ℂ) / (12 * c) + (dedekindSum d (-c).toNat : ℂ) - 1 / 4))

-- `v_η(T) = e^{πi/12}`, so `η(τ + 1) = e^{πi/12} η(τ)`.
example : etaMultiplier ModularGroup.T = Complex.exp (Real.pi * Complex.I / 12) := by
  simp [etaMultiplier, ModularGroup.T]

-- `v_η(S) = e^{−πi/4}`, so `η(−1/τ) = (−iτ)^{1/2} η(τ)` with principal roots.
example : etaMultiplier ModularGroup.S = Complex.exp (-(Real.pi * Complex.I / 4)) := by
  simp [etaMultiplier, ModularGroup.S, dedekindSum]
  ring_nf

/-- Dedekind's transformation law of `η` on all of `SL(2, ℤ)` (README §1.2). -/
theorem eta_transformation_law (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (τ : UpperHalfPlane) :
    ModularForm.eta ((γ • τ : UpperHalfPlane) : ℂ) =
      etaMultiplier γ * ((γ 1 0 : ℂ) * τ + γ 1 1) ^ (1 / 2 : ℂ) * ModularForm.eta τ := sorry

/-- The analytic Jacobi triple product on Mathlib's `jacobiTheta₂` (README §1.5); it is the
analytic triple product of GeometryOfNumbersAndQuadraticArithmetic §4.3 at `q = e(τ)` and
`a = −e(τ/2 + z)`. -/
theorem jacobi_triple_product_analytic (z : ℂ) (τ : UpperHalfPlane) :
    jacobiTheta₂ z τ = ∏' n : ℕ,
      (1 - Complex.exp (2 * Real.pi * Complex.I * (n + 1) * (τ : ℂ))) *
      (1 + Complex.exp (Real.pi * Complex.I * (2 * n + 1) * (τ : ℂ) +
        2 * Real.pi * Complex.I * z)) *
      (1 + Complex.exp (Real.pi * Complex.I * (2 * n + 1) * (τ : ℂ) -
        2 * Real.pi * Complex.I * z)) := sorry

end Layer1

/-! ## Layer 2: partition asymptotics and exact formulas -/

section Layer2

/-- The Kloosterman sum of the partition function,
`A_k(n) = Σ_{0 ≤ h < k, gcd(h, k) = 1} exp(πi s(h, k) − 2πinh/k)` (README §2.4). -/
def rademacherKloosterman (k : ℕ) (n : ℤ) : ℂ :=
  ∑ h ∈ (range k).filter (fun h ↦ Nat.Coprime h k),
    Complex.exp (Real.pi * Complex.I * (dedekindSum h k : ℂ) -
      2 * Real.pi * Complex.I * n * h / k)

-- `A_1(n) = 1` for every `n`: the single residue `h = 0` has `s(0, 1) = 0`.
example (n : ℤ) : rademacherKloosterman 1 n = 1 := by
  simp [rademacherKloosterman, dedekindSum]

/-- Rademacher's exact formula for `p(n)` (README §2.5):
`p(n) = (1/(π√2)) Σ_{k ≥ 1} A_k(n) √k · d/dn [sinh((π/k)√((2/3)(n − 1/24))) / √(n − 1/24)]`,
the series converging absolutely. `A_k(n)` is real, and its real part is used. -/
theorem rademacher_exact_formula (n : ℕ) (hn : 1 ≤ n) :
    (partitionCount n : ℝ) = 1 / (Real.pi * Real.sqrt 2) * ∑' k : ℕ,
      (rademacherKloosterman (k + 1) n).re * Real.sqrt (k + 1) *
        deriv (fun x : ℝ ↦ Real.sinh (Real.pi / (k + 1) * Real.sqrt (2 / 3 * (x - 1 / 24))) /
          Real.sqrt (x - 1 / 24)) n := sorry

/-- The Hardy–Ramanujan asymptotic `p(n) ~ e^{π√(2n/3)}/(4n√3)`, in normalised limit form
(README §2.6). -/
theorem hardy_ramanujan_asymptotic :
    Tendsto (fun n : ℕ ↦ (partitionCount n : ℝ) * (4 * Real.sqrt 3 * n) *
      Real.exp (-Real.pi * Real.sqrt (2 * n / 3))) atTop (𝓝 1) := sorry

end Layer2

/-! ## Layer 4: mock modular completions -/

section Layer4

/-- Zwegers' error function `E(x) = 2∫₀ˣ e^{−πu²} du` (README §4.1). -/
def zwegersE (x : ℝ) : ℝ := 2 * ∫ u in (0 : ℝ)..x, Real.exp (-Real.pi * u ^ 2)

-- `E(0) = 0`.
example : zwegersE 0 = 0 := by
  simp [zwegersE]

/-- `E` is odd (README §4.1, `zwegersE_neg`). -/
theorem zwegersE_neg (x : ℝ) : zwegersE (-x) = -zwegersE x := sorry

/-- Hickerson's double-sum identity for Ramanujan's seventh-order function
`F₀(q) = Σ q^{n²}/(q^{n+1}; q)_n`, analytic form (README §4.9). The right side sums over the
two cones `r, s ≥ 0` (sign `+`) and `r, s < 0` (sign `−`); the exponent
`(3r² + 8rs + 3s² + r + s)/2` is a nonnegative integer there. -/
theorem seventh_order_F0_hickerson {q : ℂ} (hq : ‖q‖ < 1) :
    (∏' n : ℕ, (1 - q ^ (n + 1))) * ∑' n : ℕ, q ^ (n * n) / qPochhammer (q ^ (n + 1)) q n =
      ∑' rs : ℤ × ℤ, if (0 ≤ rs.1 ↔ 0 ≤ rs.2) then
        (if 0 ≤ rs.1 then (1 : ℂ) else -1) * (-1 : ℂ) ^ (rs.1 + rs.2) *
          q ^ ((3 * rs.1 ^ 2 + 8 * rs.1 * rs.2 + 3 * rs.2 ^ 2 + rs.1 + rs.2) / 2).toNat
      else 0 := sorry

/-- Andrews' Hecke-type identity for Ramanujan's fifth-order function
`f₀(q) = Σ q^{n²}/(−q; q)_n` on the unit disc (README §4.10; Andrews 1986, (6.1)):
`(q; q)_∞ f₀(q) = Σ_{n ≥ 0} Σ_{|j| ≤ n} (−1)^j q^{n(5n+1)/2 − j²} (1 − q^{4n+2})`. -/
theorem fifth_order_f0_andrews {q : ℂ} (hq : ‖q‖ < 1) :
    (∏' n : ℕ, (1 - q ^ (n + 1))) * ∑' n : ℕ, q ^ (n * n) / qPochhammer (-q) q n =
      ∑' n : ℕ, ∑ j ∈ Finset.Icc (-(n : ℤ)) n, (-1 : ℂ) ^ j *
        q ^ (((n : ℤ) * (5 * n + 1) / 2 - j ^ 2).toNat) * (1 - q ^ (4 * n + 2)) := sorry

end Layer4

/-! ## Layer 5: arithmetic and quantum connections -/

section Layer5

/-- The relative-error form of the vertical-strip Stirling estimate (README §5.3); it is the
exponentiated form of ZerosOfLFunctions' `Complex.norm_Gamma_asymptotic`. -/
theorem gamma_vertical_decay (a b : ℝ) (hab : a ≤ b) :
    ∃ C : ℝ, 0 < C ∧ ∀ x ∈ Set.Icc a b, ∀ y : ℝ, 1 ≤ |y| →
      |‖Complex.Gamma ((x : ℂ) + y * Complex.I)‖ /
        (Real.sqrt (2 * Real.pi) * |y| ^ (x - 1 / 2) *
          Real.exp (-Real.pi * |y| / 2)) - 1| ≤ C / |y| := sorry

/-- Kontsevich's function at a root of unity, `F(ξ) = Σ_{n < ord ξ} (ξ; ξ)_n` (README §5.4); it
is the Habiro evaluation of the Kontsevich element. Away from roots of unity the order is zero
and the value is the empty sum. -/
def kontsevichValue (ξ : ℂ) : ℂ :=
  ∑ n ∈ range (orderOf ξ), qPochhammer ξ ξ n

example : kontsevichValue 1 = 1 := by
  simp [kontsevichValue, qPochhammer]

example : kontsevichValue (-1) = 3 := by
  norm_num [kontsevichValue, qPochhammer, Finset.sum_range_succ, Finset.prod_range_succ]

/-- The finite value does not depend on which positive period of `ξ` is used (README §5.4). -/
theorem kontsevichValue_eq_sum_range {ξ : ℂ} {M : ℕ} (hM : 0 < M) (hξ : ξ ^ M = 1) :
    kontsevichValue ξ = ∑ n ∈ range M, qPochhammer ξ ξ n := sorry

/-- The Andrews–Garvan crank (README §5.6): the largest part if there is no part `1`, and
otherwise the number of parts larger than the number `ω` of ones, minus `ω`. -/
def partitionCrank {n : ℕ} (l : n.Partition) : ℤ :=
  let ω := l.parts.count 1
  if ω = 0 then (l.parts.fold max 0 : ℕ)
  else ((l.parts.filter (fun x ↦ ω < x)).card : ℤ) - ω

/-- Dyson's rank (README §5.6): the largest part minus the number of parts. -/
def dysonRank {n : ℕ} (l : n.Partition) : ℤ :=
  (l.parts.fold max 0 : ℕ) - (l.parts.card : ℤ)

-- The one-part partition `(n)` has crank `n` and rank `n − 1`.
example : partitionCrank (Nat.Partition.indiscrete 4) = 4 := by
  decide

example : dysonRank (Nat.Partition.indiscrete 4) = 3 := by
  decide

/-- The crank divides the partitions of `5n + 4` into five classes of equal size
(Andrews–Garvan; README §5.6). The same holds modulo 7 for `7n + 5` and modulo 11 for
`11n + 6`. -/
theorem crank_mod_five (n : ℕ) (k : ZMod 5) :
    5 * (Finset.univ.filter fun l : (5 * n + 4).Partition ↦ (partitionCrank l : ZMod 5) = k).card =
      partitionCount (5 * n + 4) := sorry

/-- The crank explains Ramanujan's congruence modulo 11 (README §5.6). -/
theorem crank_mod_eleven (n : ℕ) (k : ZMod 11) :
    11 * (Finset.univ.filter fun l : (11 * n + 6).Partition ↦
      (partitionCrank l : ZMod 11) = k).card = partitionCount (11 * n + 6) := sorry

/-- The rank divides the partitions of `5n + 4` into five and those of `7n + 5` into seven
classes of equal size (Atkin–Swinnerton-Dyer; README §5.6). -/
theorem atkin_swinnerton_dyer_theorem (n : ℕ) :
    (∀ k : ZMod 5, 5 * (Finset.univ.filter fun l : (5 * n + 4).Partition ↦
      (dysonRank l : ZMod 5) = k).card = partitionCount (5 * n + 4)) ∧
    (∀ k : ZMod 7, 7 * (Finset.univ.filter fun l : (7 * n + 5).Partition ↦
      (dysonRank l : ZMod 7) = k).card = partitionCount (7 * n + 5)) := sorry

/-- Ramanujan's congruence modulo 11 (README §5.6). -/
theorem ramanujan_congruence_mod_eleven (n : ℕ) : 11 ∣ partitionCount (11 * n + 6) := sorry

end Layer5

/-! Not stated here, because their carriers are not at the pins: the general-base Euler and
Cauchy identities and the Bailey chain (formal statements with coefficientwise convergence),
the Bailey inversion and Andrews' Bailey pairs (their entries are Laurent polynomials in `q`),
the eta quotients, the theta multiplier of the theta group, Zwegers' ϑ, Jacobi forms and their
heat and index-raising operators; the Ford-circle contour and the complex Bessel functions;
the weight-k operators, harmonic Maass forms, the ξ-map, the Bruinier–Funke pairing and
Poincaré series; the Mordell integral, the Appell–Lerch sum and its completion, indefinite
theta functions, meromorphic Jacobi forms and the completed fifth- and seventh-order vectors;
radial limits, quantum modular forms, Eichler integrals, the Lawrence–Zagier series and the
traces of singular moduli; vertex algebras, lattice vertex algebras, physical states,
Borcherds algebras, the Monster Lie algebra, replicable functions, Hauptmoduln and the
monstrous moonshine theorem. -/

end TauCetiRoadmap.QSeriesPartitionsAndMockModularForms
