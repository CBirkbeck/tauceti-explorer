import Mathlib.Algebra.Squarefree.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.JacobiSum.Basic
import Mathlib.NumberTheory.LegendreSymbol.Basic
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic
import Mathlib.NumberTheory.MulChar.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.Completion.InfinitePlace
import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.RingTheory.Ideal.Norm.RelNorm
import Mathlib.RingTheory.RootsOfUnity.EnoughRootsOfUnity

/-!
# Suggested Lean forms: ClassicalArithmeticCompletion, CA.1 (continuation)

This file is not the roadmap and is not exhaustive. The roadmap document
(`research/blueprint/readmes/ClassicalArithmeticCompletion--CA.1.md`) is definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every theorem and example is deliberately unproved; no implementation is claimed.
Pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` (not imported: nothing used here is at the pin).

The first-pass declarations this part builds on (`normEquationSymbol`, `ratSquarefreePart`,
`powerResidueSymbol`, `powerResidueSymbolIdeal`, `IsPrimaryEisenstein`, `IsEisensteinPrimary`) are
restated verbatim from `ClassicalArithmeticCompletion.lean` so that this file elaborates on its own;
the assembly keeps one copy.

Not stated in Lean, because their carriers are not in the pinned libraries: the degree-`n`
norm-residue symbol (it needs the local Artin map of Class Field Theory, Layers 6–7, and the
archimedean Artin map of Layer 10) with its theorems, and the Gauss sum `g(P)` itself (it lives in
`ℚ(ζ_m, ζ_p)` and is constructed with the trace character of the residue field). Their intended
forms are in the comment blocks below.
-/

open NumberField

noncomputable section

namespace TauCeti.ClassicalArithmetic

section CA1Continuation

/-! ## First-pass declarations, restated -/

/-- Stand-in for Quadratic Form Invariants 6C's `hilbertSymbol` (restated from the first pass). -/
noncomputable def normEquationSymbol (K : Type*) [Field K] (a b : K) : ℤ :=
  open Classical in if ∃ x y : K, b = x ^ 2 - a * y ^ 2 then 1 else -1

/-- First pass, `CA.1/squarefree-part-of-a-rational`. -/
noncomputable def ratSquarefreePart (u : ℚ) : ℤ := sorry

variable {K : Type*} [Field K] [NumberField K]

/-- First pass, `CA.1/power-residue-symbol`. -/
noncomputable def powerResidueSymbol (n : ℕ) [NeZero n] [HasEnoughRootsOfUnity (𝓞 K) n]
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal] : MulChar (𝓞 K ⧸ 𝔭) (𝓞 K) := sorry

/-- First pass, `CA.1/power-residue-symbol-of-an-ideal`. -/
noncomputable def powerResidueSymbolIdeal (n : ℕ) [NeZero n] [HasEnoughRootsOfUnity (𝓞 K) n]
    (𝔞 : Ideal (𝓞 K)) (α : 𝓞 K) : 𝓞 K := sorry

/-- First pass, `CA.1/primary-eisenstein-integer`. -/
def IsPrimaryEisenstein (π : 𝓞 K) : Prop :=
  Ideal.Quotient.mk (Ideal.span {(3 : 𝓞 K)}) π = 2

/-- First pass, `CA.1/primary-element-of-a-cyclotomic-ring`. -/
def IsEisensteinPrimary (l : ℕ) (ζ : 𝓞 K) (α : 𝓞 K) : Prop :=
  IsCoprime α (l : 𝓞 K) ∧ ∃ c : ℤ, α - c ∈ Ideal.span {(1 - ζ) ^ 2}

/-! ## The degree-`n` norm-residue symbol (README targets)

Intended forms, for a nonarchimedean local field `F` (`[ValuativeRel F] [TopologicalSpace F]
[IsNonarchimedeanLocalField F]`) containing a primitive `n`-th root of unity, with
`TauCetiRoadmap.ClassFieldTheory.artinMap F : Fˣ →* Field.absoluteGaloisGroupAbelianization F`:

* `normResidueSymbol (n : ℕ) [NeZero n] (a b : Fˣ) : rootsOfUnity n F`, characterised by
  `normResidueSymbol_spec`: for `β` in the algebraic closure with `β ^ n = b`, every lift of
  `artinMap F a` sends `β` to `normResidueSymbol n a b * β` (`CA.1/local-norm-residue-symbol`).
* `normResidueSymbol_mul_left`, `normResidueSymbol_mul_right`, `normResidueSymbol_one_sub_self`
  (`(1 - a, a) = 1`, `(-a, a) = 1`), `normResidueSymbol_swap` (`(b, a) = (a, b)⁻¹`)
  (`CA.1/norm-residue-symbol-steinberg-and-skew-symmetry`).
* `normResidueSymbol_eq_one_iff_mem_normGroup`, `normResidueSymbol_eq_one_forall_iff`
  (`CA.1/norm-residue-symbol-norm-criterion`).
* `normResidueSymbol_pow_of_dvd`, `normResidueSymbol_norm`, `normResidueSymbol_map_ringEquiv`
  (`CA.1/norm-residue-symbol-functoriality`).
* `normResidueSymbol_tame`: for residue characteristic prime to `n`, the value is the root of unity
  congruent to `((-1) ^ (v a * v b) * b ^ (v a) * a ^ (-(v b))) ^ ((q - 1) / n)`.
* `normResidueSymbol_two_eq_hilbertSymbol` and `normResidueSymbol_eq_localSymbol`:
  `muNRepEquivZMod ζ (normResidueSymbol n a b) = ε * localSymbol (kummerCupPairing ζ hζ)
  (h2MuEquivZMod_mixed ..) (kummerClass n F a) (kummerClass n F b)` with one universal `ε = ±1`
  (`CA.1/norm-residue-symbol-and-the-cohomological-symbol`).
* `archNormResidueSymbol (w : InfinitePlace K) (n : ℕ) (a b : w.Completionˣ)`, from
  `infiniteArtinAt`; `archNormResidueSymbol_complex`, `archNormResidueSymbol_real`,
  `archNormResidueSymbol_spec`, `archNormResidueSymbol_eq_one_iff`,
  `archNormResidueSymbol_mul_left`, `archNormResidueSymbol_two_compat`
  (`CA.1/archimedean-norm-residue-symbol`).
* `hilbertSymbolAt (n : ℕ) (v : Place K) (a b : Kˣ) : rootsOfUnity n (𝓞 K)` at finite places
  through `v.adicCompletion K` and at infinite places through `w.Completion`, with
  `hilbertSymbolAt_finite`, `hilbertSymbolAt_infinite`, `hilbertSymbolAt_tame`,
  `hilbertSymbolAt_eq_one_of_unit`, `hilbertSymbolAt_galois`, `hilbertSymbolAt_two`
  (`CA.1/norm-residue-symbol-at-a-place`); this is `hilbertSymbolDeg` of the first pass.

Unit tests, as intended `example`s: `normResidueSymbol_test_one` (`n = 1`),
`normResidueSymbol_test_pow_right` (`(a, c ^ n) = 1`), `normResidueSymbol_test_Q7_cube`
(`(7, 2)` in `ℚ_[7]`, `n = 3`, is the cube root of unity `≡ 4 mod 7`),
`normResidueSymbol_test_Q7_swap` (`(2, 7) ≡ 2 mod 7`), `normResidueSymbol_test_units`
(`(2, 3) = 1` in `ℚ_[7]`, `n = 3`), `normResidueSymbol_test_Q2_quadratic` (`(-1, -1) = -1` in
`ℚ_[2]`); `archNormResidueSymbol_test_neg_neg`, `archNormResidueSymbol_test_complex`,
`archNormResidueSymbol_test_sign_product`, `archNormResidueSymbol_test_n_one`;
`hilbertSymbolAt_test_Q_odd`, `hilbertSymbolAt_test_infinite_cubic`,
`hilbertSymbolAt_test_conjugate_places`, `hilbertSymbolAt_test_Q_infinite`.
-/

/-! ## Quadratic reciprocity in a number field (FIMR §2)

For `n = 2` the degree-2 norm-residue symbol at a place is the norm-equation symbol, which is
stated at the pin; the dyadic and archimedean factors are therefore real definitions here. -/

/-- `μ_∞(a, b)`: the product of the quadratic symbols over the infinite places. -/
noncomputable def archQuadFactor (a b : K) : ℤ :=
  ∏ w : InfinitePlace K, normEquationSymbol w.Completion (a : w.Completion) (b : w.Completion)

/-- `μ₂(a, b)`: the product of the quadratic symbols over the dyadic places. -/
noncomputable def dyadicQuadFactor (a b : K) : ℤ :=
  ∏ᶠ (v : IsDedekindDomain.HeightOneSpectrum (𝓞 K)) (_ : (2 : 𝓞 K) ∈ v.asIdeal),
    normEquationSymbol (v.adicCompletion K) (a : v.adicCompletion K) (b : v.adicCompletion K)

variable [HasEnoughRootsOfUnity (𝓞 K) 2]

/-- `CA.1/completed-quadratic-residue-symbol`: `|a/b| = μ_∞(a, b) (a/b)`. -/
noncomputable def completedQuadSym (a b : 𝓞 K) : 𝓞 K :=
  (archQuadFactor (a : K) (b : K) : 𝓞 K) * powerResidueSymbolIdeal 2 (Ideal.span {b}) a

theorem completedQuadSym_of_totallyPositive {a b : 𝓞 K}
    (hb : ∀ (w : InfinitePlace K) (hw : w.IsReal), 0 < w.embedding_of_isReal hw (b : K)) :
    completedQuadSym a b = powerResidueSymbolIdeal 2 (Ideal.span {b}) a := by
  sorry

theorem completedQuadSym_mul_left {a a' b : 𝓞 K} (ha : a ≠ 0) (ha' : a' ≠ 0)
    (hb : IsCoprime b 2) :
    completedQuadSym (a * a') b = completedQuadSym a b * completedQuadSym a' b := by
  sorry

/-- `CA.1/quadratic-reciprocity-in-a-number-field` (`completedQuadSym_reciprocity`). -/
theorem completedQuadSym_reciprocity {a b : 𝓞 K} (ha0 : a ≠ 0) (hb0 : b ≠ 0)
    (ha : IsCoprime a 2) (hb : IsCoprime b 2) (hab : IsCoprime a b) :
    powerResidueSymbolIdeal 2 (Ideal.span {b}) a =
      ((dyadicQuadFactor (a : K) (b : K) * archQuadFactor (a : K) (b : K) : ℤ) : 𝓞 K) *
        powerResidueSymbolIdeal 2 (Ideal.span {a}) b := by
  sorry

/-- `CA.1/dyadic-hilbert-factor-depends-on-residues-mod-eight`. -/
theorem dyadicQuadFactor_congr {a a' b b' : 𝓞 K} (ha : IsCoprime a 2) (hb : IsCoprime b 2)
    (haa : a - a' ∈ Ideal.span {(8 : 𝓞 K)}) (hbb : b - b' ∈ Ideal.span {(8 : 𝓞 K)}) :
    dyadicQuadFactor (a : K) (b : K) = dyadicQuadFactor (a' : K) (b' : K) := by
  sorry

/-- `CA.1/completed-quadratic-residue-symbol-periodicity` (`completedQuadSym_periodic`). -/
theorem completedQuadSym_periodic {a b d : 𝓞 K} (ha : a ≠ 0) (hb : IsCoprime b 2)
    (hd : IsCoprime d 2) (hbd : b - d ∈ Ideal.span {8 * a}) :
    completedQuadSym a b = completedQuadSym a d := by
  sorry

/-- Unit test `completedQuadSym_test_neg_neg`: over `ℚ`, `|(-1)/(-3)| = 1`. -/
example [HasEnoughRootsOfUnity (𝓞 ℚ) 2] : completedQuadSym (K := ℚ) (-1) (-3) = 1 := by
  sorry

/-- Unit test `completedQuadSym_test_neg_pos`: over `ℚ`, `|(-1)/3| = -1`. -/
example [HasEnoughRootsOfUnity (𝓞 ℚ) 2] : completedQuadSym (K := ℚ) (-1) 3 = -1 := by
  sorry

/-- Unit test `completedQuadSym_test_unit`: `|a/1| = 1`. -/
example {a : 𝓞 K} (ha : a ≠ 0) : completedQuadSym a 1 = 1 := by
  sorry

/-- Unit test `completedQuadSym_test_not_plain`: over `ℚ`, `|(-1)/(-3)| ≠ ((-1)/(-3))`. -/
example [HasEnoughRootsOfUnity (𝓞 ℚ) 2] :
    completedQuadSym (K := ℚ) (-1) (-3) ≠ powerResidueSymbolIdeal 2 (Ideal.span {-3}) (-1) := by
  sorry

/-- `completedQuadSym_rat`: over `ℚ`, `|a/b|` is the Jacobi symbol of `|b|`, negated when
`a` and `b` are both negative. -/
theorem completedQuadSym_rat [HasEnoughRootsOfUnity (𝓞 ℚ) 2] {a b : ℤ} (hb : Odd b) :
    completedQuadSym (K := ℚ) (a : 𝓞 ℚ) (b : 𝓞 ℚ) =
      (((if a < 0 ∧ b < 0 then -1 else 1) * jacobiSym a b.natAbs : ℤ) : 𝓞 ℚ) := by
  sorry

/-! ## Norm compatibility of the power residue symbol (Koymans–Milovic §5) -/

omit [HasEnoughRootsOfUnity (𝓞 K) 2] in
/-- `CA.1/norm-compatibility-of-the-power-residue-symbol`. -/
theorem powerResidueSymbolIdeal_relNorm {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (n : ℕ) [NeZero n] [HasEnoughRootsOfUnity (𝓞 K) n] [HasEnoughRootsOfUnity (𝓞 L) n]
    (x : 𝓞 K) {𝔄 : Ideal (𝓞 L)} (h𝔄 : 𝔄 ≠ ⊥) (hn : (Ideal.absNorm 𝔄).Coprime n) :
    powerResidueSymbolIdeal (K := L) n 𝔄 (algebraMap (𝓞 K) (𝓞 L) x) =
      algebraMap (𝓞 K) (𝓞 L) (powerResidueSymbolIdeal n (Ideal.relNorm (𝓞 K) 𝔄) x) := by
  sorry

omit [HasEnoughRootsOfUnity (𝓞 K) 2]

/-! ## Biquadratic reciprocity in `ℤ[i]`

`K` is `ℚ(i)` (`IsCyclotomicExtension {4} ℚ K`) and `ζ` the primitive 4th root of unity `i`;
the quartic symbol is the first pass's `powerResidueSymbolIdeal 4`. -/

/-- `CA.1/primary-gaussian-integer`: `α ≡ 1 (mod (1 + i) ^ 3)`. -/
def IsPrimaryGaussian (ζ : 𝓞 K) (α : 𝓞 K) : Prop :=
  (1 + ζ) ^ 3 ∣ α - 1

section Quartic

variable [IsCyclotomicExtension {4} ℚ K] {ζ : 𝓞 K}

theorem isPrimaryGaussian_add_mul_iff (hζ : IsPrimitiveRoot ζ 4) (a b : ℤ) :
    IsPrimaryGaussian ζ ((a : 𝓞 K) + (b : 𝓞 K) * ζ) ↔
      (a % 4 = 1 ∧ b % 4 = 0) ∨ (a % 4 = 3 ∧ b % 4 = 2) := by
  sorry

theorem exists_unique_unit_mul_isPrimaryGaussian (hζ : IsPrimitiveRoot ζ 4) {α : 𝓞 K}
    (hα : Odd (Ideal.absNorm (Ideal.span {α}))) :
    ∃! k : Fin 4, IsPrimaryGaussian ζ (ζ ^ (k : ℕ) * α) := by
  sorry

theorem IsPrimaryGaussian.mul {α β : 𝓞 K} (hα : IsPrimaryGaussian ζ α)
    (hβ : IsPrimaryGaussian ζ β) : IsPrimaryGaussian ζ (α * β) := by
  sorry

/-- Complex conjugation is any ring automorphism with `σ ζ = ζ ^ 3`. -/
theorem IsPrimaryGaussian.conj (hζ : IsPrimitiveRoot ζ 4) (σ : 𝓞 K ≃+* 𝓞 K) (hσ : σ ζ = ζ ^ 3)
    {α : 𝓞 K} (hα : IsPrimaryGaussian ζ α) : IsPrimaryGaussian ζ (σ α) := by
  sorry

theorem isPrimaryGaussian_intCast_iff (hζ : IsPrimitiveRoot ζ 4) (m : ℤ) :
    IsPrimaryGaussian ζ (m : 𝓞 K) ↔ m % 4 = 1 := by
  sorry

theorem IsPrimaryGaussian.div_intCast (hζ : IsPrimitiveRoot ζ 4) {m : ℤ} {β : 𝓞 K}
    (h : IsPrimaryGaussian ζ ((m : 𝓞 K) * β)) (hm : m % 4 = 1) : IsPrimaryGaussian ζ β := by
  sorry

theorem IsPrimaryGaussian.norm_sub_one_div_four (hζ : IsPrimitiveRoot ζ 4) {a b : ℤ}
    (h : IsPrimaryGaussian ζ ((a : 𝓞 K) + (b : 𝓞 K) * ζ)) :
    ((a ^ 2 + b ^ 2 - 1) / 4) % 2 = ((a - 1) / 2) % 2 := by
  sorry

theorem IsPrimaryGaussian.exists_prod_primary_primes (hζ : IsPrimitiveRoot ζ 4) {α : 𝓞 K}
    (hα : IsPrimaryGaussian ζ α) (hu : ¬ IsUnit α) :
    ∃ s : Multiset (𝓞 K), (∀ π ∈ s, Prime π ∧ IsPrimaryGaussian ζ π) ∧ s.prod = α := by
  sorry

/-- Unit test `isPrimaryGaussian_test_neg_three`. -/
example (hζ : IsPrimitiveRoot ζ 4) : IsPrimaryGaussian ζ (-3) := by
  sorry

/-- Unit test `isPrimaryGaussian_test_norm_five`: `-1 + 2i` and `-1 - 2i` are primary. -/
example (hζ : IsPrimitiveRoot ζ 4) :
    IsPrimaryGaussian ζ (-1 + 2 * ζ) ∧ IsPrimaryGaussian ζ (-1 - 2 * ζ) := by
  sorry

/-- Unit test `isPrimaryGaussian_test_one_add_two_i`: `1 + 2i` is not primary. -/
example (hζ : IsPrimitiveRoot ζ 4) : ¬ IsPrimaryGaussian ζ (1 + 2 * ζ) := by
  sorry

/-- Unit test `isPrimaryGaussian_test_three`: `3` is not primary. -/
example (hζ : IsPrimitiveRoot ζ 4) : ¬ IsPrimaryGaussian ζ 3 := by
  sorry

/-- Unit test `isPrimaryGaussian_test_one_add_i`: `1 + i` is not primary. -/
example (hζ : IsPrimitiveRoot ζ 4) : ¬ IsPrimaryGaussian ζ (1 + ζ) := by
  sorry

/-- Unit test `isPrimaryGaussian_test_one`: the unit `1` satisfies the congruence. -/
example : IsPrimaryGaussian ζ 1 := by
  sorry

variable [HasEnoughRootsOfUnity (𝓞 K) 4]

/-- `CA.1/quartic-character-of-coprime-rational-integers`. -/
theorem powerResidueSymbolIdeal_four_intCast {a m : ℤ} (ha : Odd a) (ha1 : a ≠ 1 ∧ a ≠ -1)
    (hcop : IsCoprime a m) :
    powerResidueSymbolIdeal 4 (Ideal.span {(a : 𝓞 K)}) (m : 𝓞 K) = 1 := by
  sorry

/-- `CA.1/quartic-supplement-for-i-and-minus-one`. -/
theorem powerResidueSymbolIdeal_four_zeta (hζ : IsPrimitiveRoot ζ 4) {a b : ℤ}
    (h : IsPrimaryGaussian ζ ((a : 𝓞 K) + (b : 𝓞 K) * ζ)) :
    powerResidueSymbolIdeal 4 (Ideal.span {(a : 𝓞 K) + (b : 𝓞 K) * ζ}) ζ =
      ζ ^ ((-((a - 1) / 2)) % 4).toNat ∧
    powerResidueSymbolIdeal 4 (Ideal.span {(a : 𝓞 K) + (b : 𝓞 K) * ζ}) (-1) =
      (-1) ^ ((b / 2) % 2).toNat := by
  sorry

/-- `CA.1/quartic-jacobi-sum-of-a-primary-prime`: `-χ(-1) J(χ, χ) = π`. -/
theorem jacobiSum_powerResidueSymbol_four (hζ : IsPrimitiveRoot ζ 4) {π : 𝓞 K} (hπ : Prime π)
    (hprim : IsPrimaryGaussian ζ π) {p : ℕ} (hp : p.Prime) (hp4 : p % 4 = 1)
    (hN : Ideal.absNorm (Ideal.span {π}) = p) [(Ideal.span {π}).IsMaximal]
    [Fintype (𝓞 K ⧸ Ideal.span {π})] :
    -(powerResidueSymbol 4 (Ideal.span {π}) (-1)) *
      jacobiSum (powerResidueSymbol 4 (Ideal.span {π})) (powerResidueSymbol 4 (Ideal.span {π})) =
        π := by
  sorry

/-- `CA.1/quartic-gauss-sum-fourth-power`: `g(χ_π, ψ) ^ 4 = p · π ^ 2` after any injective
ring map into a domain. -/
theorem gaussSum_powerResidueSymbol_four_pow_four (hζ : IsPrimitiveRoot ζ 4) {π : 𝓞 K}
    (hπ : Prime π) (hprim : IsPrimaryGaussian ζ π) {p : ℕ} (hp : p.Prime) (hp4 : p % 4 = 1)
    (hN : Ideal.absNorm (Ideal.span {π}) = p) [(Ideal.span {π}).IsMaximal]
    [Fintype (𝓞 K ⧸ Ideal.span {π})] {R : Type*} [CommRing R] [IsDomain R] (φ : 𝓞 K →+* R)
    (hφ : Function.Injective φ) (ψ : AddChar (𝓞 K ⧸ Ideal.span {π}) R) (hψ : ψ.IsPrimitive) :
    gaussSum ((powerResidueSymbol 4 (Ideal.span {π})).ringHomComp φ) ψ ^ 4 = p * φ π ^ 2 := by
  sorry

/-- `CA.1/quartic-reciprocity-with-a-rational-denominator` (b): for `a ≡ 1 (mod 4)`. -/
theorem quartic_reciprocity_intCast (hζ : IsPrimitiveRoot ζ 4) {a : ℤ} (ha : a % 4 = 1)
    {lam : 𝓞 K} (hlam : IsPrimaryGaussian ζ lam) (hcop : IsCoprime (a : 𝓞 K) lam) :
    powerResidueSymbolIdeal 4 (Ideal.span {lam}) (a : 𝓞 K) =
      powerResidueSymbolIdeal 4 (Ideal.span {(a : 𝓞 K)}) lam := by
  sorry

/-- `CA.1/quartic-reciprocity-for-coprime-coordinates`. -/
theorem quartic_reciprocity_coprime_coords (hζ : IsPrimitiveRoot ζ 4) {a b c d : ℤ}
    (hπ : IsPrimaryGaussian ζ ((a : 𝓞 K) + (b : 𝓞 K) * ζ))
    (hlam : IsPrimaryGaussian ζ ((c : 𝓞 K) + (d : 𝓞 K) * ζ))
    (hab : IsCoprime a b) (hcd : IsCoprime c d)
    (hcop : IsCoprime ((a : 𝓞 K) + (b : 𝓞 K) * ζ) ((c : 𝓞 K) + (d : 𝓞 K) * ζ)) :
    powerResidueSymbolIdeal 4 (Ideal.span {(a : 𝓞 K) + (b : 𝓞 K) * ζ})
        ((c : 𝓞 K) + (d : 𝓞 K) * ζ) =
      powerResidueSymbolIdeal 4 (Ideal.span {(c : 𝓞 K) + (d : 𝓞 K) * ζ})
          ((a : 𝓞 K) + (b : 𝓞 K) * ζ) * (-1) ^ (((a - 1) / 2) * ((c - 1) / 2)).natAbs := by
  sorry

/-- `CA.1/quartic-reciprocity`: for coprime primary `λ, π`,
`(λ/π)_4 = (π/λ)_4 · (-1) ^ (((Nλ - 1)/4) ((Nπ - 1)/4))`. -/
theorem quartic_reciprocity (hζ : IsPrimitiveRoot ζ 4) {π lam : 𝓞 K}
    (hπ : IsPrimaryGaussian ζ π) (hlam : IsPrimaryGaussian ζ lam) (hcop : IsCoprime π lam) :
    powerResidueSymbolIdeal 4 (Ideal.span {π}) lam =
      powerResidueSymbolIdeal 4 (Ideal.span {lam}) π *
        (-1) ^ (((Ideal.absNorm (Ideal.span {lam}) - 1) / 4) *
          ((Ideal.absNorm (Ideal.span {π}) - 1) / 4)) := by
  sorry

/-- `CA.1/quartic-supplement-for-one-plus-i`. -/
theorem powerResidueSymbolIdeal_four_one_add_zeta (hζ : IsPrimitiveRoot ζ 4) {a b : ℤ}
    (h : IsPrimaryGaussian ζ ((a : 𝓞 K) + (b : 𝓞 K) * ζ)) :
    powerResidueSymbolIdeal 4 (Ideal.span {(a : 𝓞 K) + (b : 𝓞 K) * ζ}) (1 + ζ) =
      ζ ^ (((a - b - b ^ 2 - 1) / 4) % 4).toNat := by
  sorry

/-- Acceptance (parent source issue E203): `π = -1 + 2i`, `λ = -3`: both symbols are `-i`. -/
example (hζ : IsPrimitiveRoot ζ 4) :
    powerResidueSymbolIdeal 4 (Ideal.span {-1 + 2 * ζ}) (-3) = ζ ^ 3 ∧
      powerResidueSymbolIdeal 4 (Ideal.span {(-3 : 𝓞 K)}) (-1 + 2 * ζ) = ζ ^ 3 := by
  sorry

end Quartic

/-! ## The inputs of Eisenstein reciprocity

`K = ℚ(ζ_m)`. The Gauss sum `g(P) = g(χ_P, ψ)`, with `χ_P = (·/P)_m⁻¹` and the trace character
`ψ`, lives in `ℚ(ζ_m, ζ_p)`; its `m`-th power `Φ(P)` lies in `𝓞_K`. Intended form of the
characterisation `stickelbergerPhi_prime`: for an injective ring map `ι : 𝓞 K →+* R` into the
ring of integers `R` of `ℚ(ζ_{mp})` and a primitive additive character `ψ` of `𝓞 K ⧸ P` with
values in `R`, `ι (stickelbergerPhi m P) = gaussSum (((powerResidueSymbol m P)⁻¹).ringHomComp ι) ψ ^ m`.
The automorphisms `σ_t : ζ ↦ ζ ^ t` of `𝓞 K` are passed as a family `σ` with `σ t ζ = ζ ^ t`. -/

/-- `CA.1/stickelberger-gauss-sum-power`: `Φ(A)`, multiplicative in the ideal `A` prime to `m`. -/
noncomputable def stickelbergerPhi (m : ℕ) (A : Ideal (𝓞 K)) : 𝓞 K := sorry

section Stickelberger

variable {m : ℕ} [NeZero m] [IsCyclotomicExtension {m} ℚ K] {ζ : 𝓞 K}

theorem stickelbergerPhi_mul {A B : Ideal (𝓞 K)} (hA : (Ideal.absNorm A).Coprime m)
    (hB : (Ideal.absNorm B).Coprime m) :
    stickelbergerPhi m (A * B) = stickelbergerPhi m A * stickelbergerPhi m B := by
  sorry

@[simp] theorem stickelbergerPhi_top : stickelbergerPhi (K := K) m ⊤ = 1 := by
  sorry

theorem stickelbergerPhi_norm_sq {A : Ideal (𝓞 K)} (hA : (Ideal.absNorm A).Coprime m)
    (φ : K →+* ℂ) : ‖φ (stickelbergerPhi m A)‖ ^ 2 = (Ideal.absNorm A : ℝ) ^ m := by
  sorry

theorem stickelbergerPhi_galois {A : Ideal (𝓞 K)} (hA : (Ideal.absNorm A).Coprime m)
    (σ : 𝓞 K ≃+* 𝓞 K) : σ (stickelbergerPhi m A) = stickelbergerPhi m (A.map σ) := by
  sorry

theorem stickelbergerPhi_modEq {l : ℕ} [Fact l.Prime] (hl : l ≠ 2)
    [IsCyclotomicExtension {l} ℚ K] {P : Ideal (𝓞 K)} [P.IsMaximal]
    (hP : (Ideal.absNorm P).Coprime l) :
    stickelbergerPhi l P + 1 ∈ Ideal.span {(l : 𝓞 K)} := by
  sorry

/-- `CA.1/stickelberger-relation` (`span_stickelbergerPhi`): `(Φ(A)) = A ^ γ`,
`γ = Σ_{t < m, (t, m) = 1} t σ_t⁻¹`. -/
theorem span_stickelbergerPhi (hζ : IsPrimitiveRoot ζ m) (σ : ℕ → (𝓞 K ≃+* 𝓞 K))
    (hσ : ∀ t, (σ t) ζ = ζ ^ t) {A : Ideal (𝓞 K)} (hA : (Ideal.absNorm A).Coprime m) :
    Ideal.span {stickelbergerPhi m A} =
      ∏ t ∈ (Finset.range m).filter (fun t => t.Coprime m), (A.map (σ t).symm) ^ t := by
  sorry

/-- `CA.1/stickelberger-unit-factor-is-a-root-of-unity`: `Φ(α) = ± ζ ^ i · α ^ γ`. -/
theorem stickelbergerPhi_span_singleton (hζ : IsPrimitiveRoot ζ m) (σ : ℕ → (𝓞 K ≃+* 𝓞 K))
    (hσ : ∀ t, (σ t) ζ = ζ ^ t) {α : 𝓞 K} (hα : IsCoprime α (m : 𝓞 K)) :
    ∃ (e : ℤˣ) (i : ℕ), stickelbergerPhi m (Ideal.span {α}) =
      (e : 𝓞 K) * ζ ^ i *
        ∏ t ∈ (Finset.range m).filter (fun t => t.Coprime m), ((σ t).symm α) ^ t := by
  sorry

/-- `CA.1/gauss-sum-power-residue-identity`: `(Φ(P)/P')_m = (N P'/P)_m`. -/
theorem powerResidueSymbolIdeal_stickelbergerPhi [HasEnoughRootsOfUnity (𝓞 K) m]
    {P P' : Ideal (𝓞 K)} [P.IsMaximal] [P'.IsMaximal]
    (hP : (Ideal.absNorm P).Coprime m) (hP' : (Ideal.absNorm P').Coprime m)
    (hPP' : (Ideal.absNorm P).Coprime (Ideal.absNorm P')) :
    powerResidueSymbolIdeal m P' (stickelbergerPhi m P) =
      powerResidueSymbolIdeal m P (Ideal.absNorm P' : 𝓞 K) := by
  sorry

end Stickelberger

section EisensteinInputs

variable {l : ℕ} [Fact l.Prime] [IsCyclotomicExtension {l} ℚ K] {ζ : 𝓞 K}

/-- `CA.1/stickelberger-unit-factor-of-a-primary-element`: for primary `α`, `Φ(α) = ± α ^ γ`. -/
theorem stickelbergerPhi_of_isEisensteinPrimary (hl : l ≠ 2) (hζ : IsPrimitiveRoot ζ l)
    (σ : ℕ → (𝓞 K ≃+* 𝓞 K)) (hσ : ∀ t, (σ t) ζ = ζ ^ t) {α : 𝓞 K}
    (hα : IsEisensteinPrimary l ζ α) :
    ∃ e : ℤˣ, stickelbergerPhi l (Ideal.span {α}) =
      (e : 𝓞 K) * ∏ t ∈ (Finset.range l).filter (fun t => t.Coprime l), ((σ t).symm α) ^ t := by
  sorry

/-- `CA.1/eisenstein-reciprocity-at-ideal-norms`: `(α / N 𝔅)_l = (N 𝔅 / α)_l`. -/
theorem eisenstein_reciprocity_absNorm (hl : l ≠ 2) [HasEnoughRootsOfUnity (𝓞 K) l]
    (hζ : IsPrimitiveRoot ζ l) {α : 𝓞 K} (hα : IsEisensteinPrimary l ζ α) (hαu : ¬ IsUnit α)
    {𝔅 : Ideal (𝓞 K)} (h𝔅 : (Ideal.absNorm 𝔅).Coprime l)
    (hcop : IsCoprime (Ideal.absNorm 𝔅 : 𝓞 K) α) :
    powerResidueSymbolIdeal l (Ideal.span {(Ideal.absNorm 𝔅 : 𝓞 K)}) α =
      powerResidueSymbolIdeal l (Ideal.span {α}) (Ideal.absNorm 𝔅 : 𝓞 K) := by
  sorry

end EisensteinInputs

/-- Unit test `stickelbergerPhi_test_top`: `Φ(𝓞_K) = 1`. -/
example (m : ℕ) : stickelbergerPhi (K := K) m ⊤ = 1 := by
  sorry

/-- Unit test `stickelbergerPhi_test_quadratic`: for `m = 2` (`K = ℚ`), `Φ((5)) = 5` and
`Φ((3)) = -3`. -/
example [IsCyclotomicExtension {2} ℚ K] :
    stickelbergerPhi 2 (Ideal.span {(5 : 𝓞 K)}) = 5 ∧
      stickelbergerPhi 2 (Ideal.span {(3 : 𝓞 K)}) = -3 := by
  sorry

/-- Unit test `stickelbergerPhi_test_cubic`: for `m = 3` and `π = -1 - 3ω` of norm `7`,
`Φ((π)) = 7 π̄`, with `σ` the conjugation `ω ↦ ω ^ 2`. -/
example [IsCyclotomicExtension {3} ℚ K] {ω : 𝓞 K} (hω : IsPrimitiveRoot ω 3)
    (σ : 𝓞 K ≃+* 𝓞 K) (hσ : σ ω = ω ^ 2) :
    stickelbergerPhi 3 (Ideal.span {-1 - 3 * ω}) = 7 * σ (-1 - 3 * ω) := by
  sorry

/-- Unit test `stickelbergerPhi_test_inverse_character`: in the cubic test, `Φ((π)) ≠ 7 π`. -/
example [IsCyclotomicExtension {3} ℚ K] {ω : 𝓞 K} (hω : IsPrimitiveRoot ω 3) :
    stickelbergerPhi 3 (Ideal.span {-1 - 3 * ω}) ≠ 7 * (-1 - 3 * ω) := by
  sorry

/-! ## Zeros of a binary quadratic form on `ℙ¹(𝔽_p)` -/

/-- The zeros of `m x² + r x y + n y²` on `ℙ¹(𝔽_p)`, read on a representative (the form is
homogeneous). -/
def binaryQuadraticZeros {p : ℕ} [Fact p.Prime] (m r n : ZMod p) :
    Set (Projectivization (ZMod p) (Fin 2 → ZMod p)) :=
  {x | m * x.rep 0 ^ 2 + r * x.rep 0 * x.rep 1 + n * x.rep 1 ^ 2 = 0}

/-- `CA.1/projective-zeros-of-a-binary-quadratic-form`. -/
theorem ncard_binaryQuadraticZeros {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) {m r n : ZMod p}
    (h : ¬ (m = 0 ∧ r = 0 ∧ n = 0)) :
    ((binaryQuadraticZeros m r n).ncard : ℤ) = 1 + quadraticChar (ZMod p) (r ^ 2 - 4 * m * n) := by
  sorry

/-- Acceptance: `x² + y²` has no zeros over `𝔽_3` and two over `𝔽_5`. -/
example : (binaryQuadraticZeros (p := 3) 1 0 1).ncard = 0 := by
  sorry

example [Fact (Nat.Prime 5)] : (binaryQuadraticZeros (p := 5) 1 0 1).ncard = 2 := by
  sorry

/-- Acceptance: `y²` has the single zero `[1 : 0]`. -/
example : (binaryQuadraticZeros (p := 3) 0 0 1).ncard = 1 := by
  sorry

/-! ## Supporting lemmas for the first-pass targets -/

/-- `CA.1/nonzero-root-count-of-a-power-equation`. -/
theorem card_units_pow_eq {F : Type*} [Field F] [Fintype F] (n : ℕ) {a : Fˣ}
    (ha : ∃ y : Fˣ, y ^ n = a) :
    Nat.card {x : Fˣ // x ^ n = a} = (Fintype.card F - 1).gcd n := by
  sorry

theorem card_pow_eq_of_pos {F : Type*} [Field F] [Fintype F] {n : ℕ} (hn : 0 < n) {a : Fˣ}
    (ha : ∃ y : Fˣ, y ^ n = a) :
    Nat.card {x : F // x ^ n = (a : F)} = (Fintype.card F - 1).gcd n := by
  sorry

/-- Acceptance: for `n = 0` the field count is `q`, one more than the unit count. -/
example : Nat.card {x : ZMod 5 // x ^ 0 = 1} = 5 := by
  sorry

/-- `CA.1/squarefree-part-signed-uniqueness`. -/
theorem squarefree_int_eq_of_mul_sq_eq {d d' : ℤ} (hd : Squarefree d) (hd' : Squarefree d')
    {c c' : ℚ} (hc : c ≠ 0) (hc' : c' ≠ 0) (h : (d : ℚ) * c ^ 2 = d' * c' ^ 2)
    (h0 : (d : ℚ) * c ^ 2 ≠ 0) : d = d' := by
  sorry

/-- `CA.1/squarefree-part-of-a-square-multiple` (the first pass's API item, promoted). -/
theorem ratSquarefreePart_mul_sq {u t : ℚ} (hu : u ≠ 0) (ht : t ≠ 0) :
    ratSquarefreePart (u * t ^ 2) = ratSquarefreePart u := by
  sorry

/-- `CA.1/prime-divides-squarefree-part-iff-odd-valuation` (the first pass's API item). -/
theorem prime_dvd_ratSquarefreePart_iff {u : ℚ} (hu : u ≠ 0) {p : ℕ} [Fact p.Prime] :
    (p : ℤ) ∣ ratSquarefreePart u ↔ Odd (padicValRat p u) := by
  sorry

section Cubic

variable [IsCyclotomicExtension {3} ℚ K] {ω : 𝓞 K}

/-- `CA.1/primary-eisenstein-coordinate-criterion` (the first pass's API item, promoted). -/
theorem isPrimaryEisenstein_add_mul_iff (hω : IsPrimitiveRoot ω 3) (a b : ℤ) :
    IsPrimaryEisenstein ((a : 𝓞 K) + (b : 𝓞 K) * ω) ↔ a % 3 = 2 ∧ b % 3 = 0 := by
  sorry

/-- `CA.1/unique-primary-associate-of-an-eisenstein-prime` (the first pass's API item, promoted). -/
theorem exists_unique_associated_isPrimaryEisenstein {π : 𝓞 K} (hπ : Prime π)
    (h3 : Ideal.absNorm (Ideal.span {π}) ≠ 3) :
    ∃! π' : 𝓞 K, Associated π π' ∧ IsPrimaryEisenstein π' := by
  sorry

variable [HasEnoughRootsOfUnity (𝓞 K) 3]

/-- `CA.1/gauss-sum-cube-of-a-cubic-character`: for `χ` of order `3`, `g(χ) ^ 3 = q J(χ, χ)`. -/
theorem gaussSum_pow_three_of_orderOf_eq_three {F R : Type*} [Field F] [Fintype F] [CommRing R]
    [IsDomain R] {χ : MulChar F R} (hχ : orderOf χ = 3) {ψ : AddChar F R} (hψ : ψ.IsPrimitive) :
    χ (-1) = 1 ∧ gaussSum χ ψ ^ 3 = Fintype.card F * jacobiSum χ χ := by
  sorry

/-- `CA.1/cubic-jacobi-sum-is-primary`. -/
theorem jacobiSum_powerResidueSymbol_three_isPrimary {π : 𝓞 K} (hπ : Prime π)
    (hprim : IsPrimaryEisenstein π) {p : ℕ} (hp : p.Prime) (hp3 : p % 3 = 1)
    (hN : Ideal.absNorm (Ideal.span {π}) = p) [(Ideal.span {π}).IsMaximal]
    [Fintype (𝓞 K ⧸ Ideal.span {π})] :
    IsPrimaryEisenstein
      (jacobiSum (powerResidueSymbol 3 (Ideal.span {π})) (powerResidueSymbol 3 (Ideal.span {π}))) := by
  sorry

/-- `CA.1/cubic-jacobi-sum-norm-and-divisibility`: `π ∣ J(χ_π, χ_π)` and `N(J) = p`. -/
theorem jacobiSum_powerResidueSymbol_three_dvd {π : 𝓞 K} (hπ : Prime π)
    (hprim : IsPrimaryEisenstein π) {p : ℕ} (hp : p.Prime) (hp3 : p % 3 = 1)
    (hN : Ideal.absNorm (Ideal.span {π}) = p) [(Ideal.span {π}).IsMaximal]
    [Fintype (𝓞 K ⧸ Ideal.span {π})] :
    π ∣ jacobiSum (powerResidueSymbol 3 (Ideal.span {π})) (powerResidueSymbol 3 (Ideal.span {π})) ∧
      Ideal.absNorm (Ideal.span {jacobiSum (powerResidueSymbol 3 (Ideal.span {π}))
        (powerResidueSymbol 3 (Ideal.span {π}))}) = p := by
  sorry

/-- `CA.1/cubic-reciprocity-with-two-rational-primes`: `(n / q)_3 = 1`. -/
theorem powerResidueSymbolIdeal_three_intCast {q : ℕ} (hq : q.Prime) (hq3 : q % 3 = 2) {n : ℤ}
    (hn : IsCoprime n q) :
    powerResidueSymbolIdeal 3 (Ideal.span {(q : 𝓞 K)}) (n : 𝓞 K) = 1 := by
  sorry

/-- `CA.1/cubic-reciprocity-rational-and-complex-prime`. -/
theorem cubic_reciprocity_natCast {q : ℕ} (hq : q.Prime) (hq3 : q % 3 = 2) {π : 𝓞 K}
    (hπ : Prime π) (hprim : IsPrimaryEisenstein π) (hN : Ideal.absNorm (Ideal.span {π}) % 3 = 1) :
    powerResidueSymbolIdeal 3 (Ideal.span {π}) (q : 𝓞 K) =
      powerResidueSymbolIdeal 3 (Ideal.span {(q : 𝓞 K)}) π := by
  sorry

/-- `CA.1/cubic-reciprocity-two-complex-primes`. -/
theorem cubic_reciprocity_of_norm_prime {π₁ π₂ : 𝓞 K} (h₁ : Prime π₁) (h₂ : Prime π₂)
    (hp₁ : IsPrimaryEisenstein π₁) (hp₂ : IsPrimaryEisenstein π₂)
    (hN₁ : (Ideal.absNorm (Ideal.span {π₁})).Prime) (hN₂ : (Ideal.absNorm (Ideal.span {π₂})).Prime)
    (hN : Ideal.absNorm (Ideal.span {π₁}) ≠ Ideal.absNorm (Ideal.span {π₂}))
    (h3₁ : Ideal.absNorm (Ideal.span {π₁}) ≠ 3) (h3₂ : Ideal.absNorm (Ideal.span {π₂}) ≠ 3) :
    powerResidueSymbolIdeal 3 (Ideal.span {π₁}) π₂ =
      powerResidueSymbolIdeal 3 (Ideal.span {π₂}) π₁ := by
  sorry

/-- `CA.1/cubic-reciprocity-with-a-rational-integer`. -/
theorem cubic_reciprocity_intCast {π : 𝓞 K} (hπ : Prime π) (hprim : IsPrimaryEisenstein π)
    (h3 : Ideal.absNorm (Ideal.span {π}) ≠ 3) {A : ℤ} (hA3 : ¬ (3 : ℤ) ∣ A)
    (hAπ : IsCoprime (A : 𝓞 K) π) :
    powerResidueSymbolIdeal 3 (Ideal.span {π}) (A : 𝓞 K) =
      powerResidueSymbolIdeal 3 (Ideal.span {(A : 𝓞 K)}) π := by
  sorry

end Cubic

/-- `CA.1/normalising-root-of-unity-of-a-cyclotomic-integer`: `α ≡ a + b λ (mod λ²)` and
`ζ ^ c ≡ 1 - c λ (mod λ²)`, with `λ = 1 - ζ`. -/
theorem exists_intCast_add_mul_one_sub_mem {l : ℕ} [Fact l.Prime] [IsCyclotomicExtension {l} ℚ K]
    {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ l) (α : 𝓞 K) :
    ∃ a b : ℤ, α - (a + b * (1 - ζ)) ∈ Ideal.span {(1 - ζ) ^ 2} := by
  sorry

theorem zeta_pow_sub_mem {l : ℕ} [Fact l.Prime] [IsCyclotomicExtension {l} ℚ K]
    {ζ : 𝓞 K} (hζ : IsPrimitiveRoot ζ l) (c : ℕ) :
    ζ ^ c - (1 - c * (1 - ζ)) ∈ Ideal.span {(1 - ζ) ^ 2} := by
  sorry

end CA1Continuation

end TauCeti.ClassicalArithmetic
