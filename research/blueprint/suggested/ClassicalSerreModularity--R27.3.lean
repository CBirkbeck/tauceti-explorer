import Mathlib.Algebra.Ring.Parity
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic.NormNum.GCD
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.Ring

/-!
# Suggested Lean forms: ClassicalSerreModularity, part R27.3 (R27.3–R27.6, R33.1–R33.4)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`ClassicalSerreModularity--R27.3`) is definitive. The statements suggest Lean forms so that
contributors and reviewers converge on names and signatures.

The analytic carriers are in the pinned libraries and are reused, not restated: Mathlib's
`ModularForm Γ k` and `CuspForm Γ k` (`Mathlib/NumberTheory/ModularForms/Basic.lean`) and Tau Ceti's
`HeckeRing.GL2.Newform N k` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`: a good Hecke
eigenform in the new subspace with `a₁ = 1`). What the pins lack is the arithmetic interface: Galois
representations attached to newforms, Serre's weight and level `k(ρ̄)`, `N(ρ̄)`, compatible systems,
local Weil–Deligne types and the modularity comparison. Statements needing those are comments below.
The checked examples test the arithmetic of the Khare–Wintenberger and Dieulefait–Pacetti arguments,
including an exact check of the two integral lattices of Lemma 2.3 over `ℤ[ζ]`.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

Fix revision: Codex codex-5ebb6f, 30 September 2026, Refs #5142. Independent REV-FIX records needs_changes (2 October 2026, Refs #5143).
No compilation was performed: no existing build was found at the pins. Historical compilation
in reviewHistory is not a check of this revision. Supplier signature sketches below are comments.
Lemma 8.2 imports the early R01.3/R01.4 definitions/classification; no level-one theorem or R15.6.
Its stage-component promotion is still a maintainer gap, not an implemented stage split.

Red-team fix FIX-RT-BP-ClassicalSerreModularity--R27.3: Claude claude-eZ1A2V, 6 October 2026, Refs #5715.
It ties the residual of `dihedralType` to its standard lattice, chooses the lattice of Lemma 2.3 by the
residual case at 2, and bounds the dyadic conductor in Theorem 3.4. This revision was elaborated with
`lake env lean` against Mathlib `082e2d3`, with no errors or warnings. Tau Ceti is named in comments only
and is not imported, because the shared build is not at the Tau Ceti pin.

```
-- R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes  (𝔽_p coefficients, not 𝔽̄_p)
theorem lemma_8_2 {p : ℕ} [Fact p.Prime] (hp : p % 4 = 1) (ρ̄ : GaloisRep ℚ (ZMod p) 2)
    (hS : IsSType ρ̄) (hns : ¬ IsSolvable (image ρ̄)) :
    ∃ Q : Set ℕ, 0 < dirichletDensity Q ∧ ∀ q ∈ Q, q.Prime ∧ IsUnramifiedAt ρ̄ q ∧
      ProjFrobConjComplexConj ρ̄ q ∧ (∀ ℓ, ℓ.Prime → ℓ ≤ p - 1 → q % ℓ = 1) ∧ q % 8 = 1 ∧ q % p = p - 1
-- R27.3/double-induction-assembly and R27.3/d0-from-all-lr
theorem hypL_all : ∀ r ≥ 1, HypL r
theorem hypD_zero : HypD 0
-- R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice
theorem raising_levels (r : ℕ) (hD : HypD r) (ρ̄ : GaloisRep ℚ 𝔽 2) (hS : IsSType ρ̄)
    (hN : ¬ 2 ^ (r + 1) ∣ serreLevel ρ̄) (hk : ringChar 𝔽 = 2 → r = 0 → serreWeight ρ̄ = 2) : IsModular ρ̄
-- Inside its proof the dyadic conductor is a chain of bounds, never an equality with N(ρ̄):
--   v₂ (serreLevel ρ̄′_s) ≤ a₂ (second system) = v₂ (serreLevel ρ̄_{p′}) ≤ a₂ (first system) ≤ r,
-- with a₂ (first system) = 1 for p = 2, k(ρ̄) = 4 (Steinberg: unramified part, rank-one monodromy).
-- R27.4/strong-form-by-minimal-lifts
theorem arises_of_modular (ρ̄ : GaloisRep ℚ 𝔽 2) (hS : IsSType ρ̄) (hmod : IsModular ρ̄)
    (hk : ringChar 𝔽 = 2 → serreWeight ρ̄ = 2) :
    ArisesFrom ρ̄ (CuspForms (Γ₁ (serreLevel ρ̄)) (serreWeight ρ̄))
-- R27.5/hypothesis-H-and-theorem-9-1
-- Import the dyadic theorem R22.6/hypothesis-h, including the Breuil–Kisin comparison.
theorem serre_of_hypH (hH2 : HypothesisH2) (ρ̄ : GaloisRep ℚ 𝔽 2) (hS : IsSType ρ̄) : IsModular ρ̄
-- R27.6/full-classical-serre-theorem
theorem serre_strong (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄) (hirr : IsAbsIrreducible ρ̄) :
    ∃ (f : HeckeRing.GL2.Newform (serreLevel ρ̄) (serreWeight ρ̄)) (λ : Ideal f.coeffRing), λ.LiesOver p ∧
      Nonempty (residualRep f λ ≃ ρ̄) ∧ det ρ̄ = f.character.reduce λ * cyclotomic p ^ (serreWeight ρ̄ - 1)
-- R27.6/odd-artin-weight-one-modularity: explicit Corollary 10.2(ii) export for ML.1.
-- The early Gross/Coleman–Voloch/Khare descent input is an open proof contract.
-- Do not import all of ML.1 in reverse, and do not treat weight >= 2 as weight-one modularity.
theorem odd_artin_weight_one (ρ : ComplexArtinRep ℚ 2) (hodd : IsOdd ρ)
    (hirr : IsIrreducible ρ) : ∃ f : WeightOneCuspidalNewform, Nonempty (deligneSerreRep f ≃ ρ)
-- R33.2/dp-lift-existence-and-good-dihedral-insertion is ONLY Paso 2:
-- apply R24.3's general Theorem 1.9(4), after the Paso 1 weight-two system and
-- Lemma 1.15 prime-field conditions select its crystalline-at-q alternative.
theorem paso_two_insertion (d : WeightTwoSystemAtSplitPrime q) (hN : Lemma115Conditions d N)
    (localType : DihedralInertialType q N) : Nonempty (PasoTwoCompatibleSystem d N localType)
-- R33.2/dihedral-local-type-at-n
def levelTwoCharacter (q N : ℕ) (hq : q ∣ N + 1) : (Gal ℚ_[N]² →* (ℤ̄_[q])ˣ) := …
-- normalised to be trivial on the Frobenius attached to N, so that the image of the induction is
-- dihedral of order 2q (without it the image has order 2q²; review of 2026-09-29)
theorem levelTwoCharacter_artin (q N : ℕ) (hq : q ∣ N + 1) : levelTwoCharacter q N hq (artin N) = 1
theorem levelTwoCharacter_orderOf (q N : ℕ) [Fact q.Prime] (hq : q ∣ N + 1) (hN : ¬ q ∣ N - 1) :
    orderOf (levelTwoCharacter q N hq) = q ∧ ¬ FactorsThroughLevelOne (levelTwoCharacter q N hq)
def dihedralType (q N : ℕ) (hq : q ∣ N + 1) : GaloisRep ℚ_[N] ℤ̄_[q] 2 := induced (levelTwoCharacter q N hq)
theorem dihedralType_irreducible (q N : ℕ) [Fact q.Prime] (hq : q ∣ N + 1) (hN : ¬ q ∣ N - 1) :
    (dihedralType q N hq).IsIrreducible
-- the basis is e₁ = 1 ⊗ 1, e₂ = s ⊗ 1 of the standard lattice Ind 𝒪(κ); s acts by the swap, as κ(s²) = 1
def dihedralType.standardLattice (q N : ℕ) (hq : q ∣ N + 1) : StableLattice (dihedralType q N hq) := …
-- the split residual statement is about the standard lattice only
theorem dihedralType_standardLattice_residual (q N : ℕ) (hq : q ∣ N + 1) :
    (dihedralType.standardLattice q N hq).reduction ≃ unramifiedSum 1 (unramifiedQuadratic N)
theorem dihedralType_residual_semisimplification (q N : ℕ) (hq : q ∣ N + 1)
    (Λ : StableLattice (dihedralType q N hq)) :
    Λ.reduction.semisimplification ≃ unramifiedSum 1 (unramifiedQuadratic N)
-- R33.3/dp-dyadic-transition-and-the-order-three-type (q = 3, N = 2, coefficients ℤ₃[ζ], π = ζ − 1)
def orderThreeCharacter : Gal ℚ_[2]² →* (ℤ_[3][ζ₃])ˣ := levelTwoCharacter 3 2 (by norm_num)
def orderThreeType : GaloisRep ℚ_[2] ℤ_[3][ζ₃] 2 := dihedralType 3 2 (by norm_num)
def orderThreeType.standardLattice : StableLattice orderThreeType := dihedralType.standardLattice 3 2 _
def orderThreeType.adaptedLattice : StableLattice orderThreeType := span {e₁ + e₂, π • e₂}
theorem orderThreeType_standardLattice_reduction :
    orderThreeType.standardLattice.reduction ≃ unramifiedSum 1 (unramifiedQuadratic 2)
theorem orderThreeType_adaptedLattice_reduction :
    ¬ orderThreeType.adaptedLattice.reduction.IsUnramified ∧
      finrank (orderThreeType.adaptedLattice.reduction.inertiaInvariants) = 1
theorem orderThreeType_exists_lattice_reduction_iso (ρ̄₃ : GaloisRep ℚ (F̄ 3) 2)
    (hD : SteinbergResidualShapeAtTwo ρ̄₃) :
    ∃ Λ ∈ ({orderThreeType.standardLattice, orderThreeType.adaptedLattice} : Set _),
      Nonempty (Λ.reduction ⊗ hD.twist ≃ ρ̄₃.restrict (decompositionGroup 2))
theorem orderThreeType_isCompatible (ρ̄₃ : GaloisRep ℚ (F̄ 3) 2) (hD : SteinbergResidualShapeAtTwo ρ̄₃) :
    IsCompatibleInertialType (orderThreeType.restrict (inertiaGroup 2)) ρ̄₃
theorem typeChangeAtTwo (sys : AlmostStrictlyCompatibleSystem) (h : Lemma23Hypotheses sys) :
    sys.IsModular ↔ (lemma23System sys h).IsModular
-- Unit tests about Galois representations, kept as statements until the interfaces exist:
-- R33.2 residual_trace_zero, unnormalised_character; R33.3 steinberg_nonexample, needs_unramified_at_3.
-- The arithmetic and lattice tests of both nodes are the checked examples below.
-- R33.4/dp-odd-characteristic-assembly
theorem serre_weak_odd {p : ℕ} (hp : p ≠ 2) (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄)
    (hirr : IsIrreducible ρ̄) : IsModular ρ̄
```
-/

namespace TauCeti.SerreConjecture.SuggestedTest

/-- `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`: for `p = 5` the prime `q = 409`
satisfies the three congruences (`409 ≡ 1 mod 8`, `≡ 1 mod 3`, `≡ −1 mod 5`). -/
example : Nat.Prime 409 ∧ 409 % 8 = 1 ∧ 409 % 3 = 1 ∧ 409 % 5 = 5 - 1 := by norm_num

/-- `R27.1/good-dihedral-prime-insertion` and `R33.2/dp-lift-existence-and-good-dihedral-insertion`:
for `p′ = q = 13` the prime `406561` is `1` modulo `8, 3, 5, 7, 11` and `−1` modulo `13`, and
`13 ∣ 406561 + 1`, `13 ∤ 406561 − 1`, so the inserted character has level 2. -/
example : Nat.Prime 406561 ∧ 406561 % 8 = 1 ∧ 406561 % 3 = 1 ∧ 406561 % 5 = 1 ∧ 406561 % 7 = 1 ∧
    406561 % 11 = 1 ∧ 406561 % 13 = 12 ∧ 13 ∣ 406561 + 1 ∧ ¬ 13 ∣ 406561 - 1 := by norm_num

/-- Paso 2's residual weight is two. At q = 13, the weight-q+1 Steinberg branch is different. -/
example : (2 : ℕ) ≠ 13 + 1 := by norm_num

/-- Lemma 8.2 uses that `−1` is a square modulo `p ≡ 1 mod 4`: `2² ≡ −1 mod 5`, `5² ≡ −1 mod 13`. -/
example : (2 ^ 2 + 1) % 5 = 0 ∧ (5 ^ 2 + 1) % 13 = 0 := by norm_num

/-- `R27.3/d0-from-all-lr`: `N = 6` satisfies `(D_1)(c)` (`4 ∤ 6`) but not `(D_0)(c)` (`2 ∣ 6`). -/
example : 2 ^ (0 + 1) ∣ 6 ∧ ¬ 2 ^ (1 + 1) ∣ 6 := by norm_num

/-- `R27.4/auxiliary-characteristic-choice`: a prime `p′ > 5` is at least 7, so the inertia orders
`p′ − 1` and `p′ + 1` are at least 6, with equality at `p′ = 7`. -/
example (p : ℕ) (hp : 7 ≤ p) : 6 ≤ p - 1 ∧ 6 ≤ p + 1 := by omega

example : 7 - 1 = 6 := by norm_num

/-- `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`: for `p′ = 13` the characteristic
`s` in which `(D_r)` is applied is `11`, the largest prime below `13`. -/
example : Nat.Prime 11 ∧ ¬ Nat.Prime 12 := by norm_num

/-- `R27.5/d1-by-the-prime-three` and `R33.3/dp-dyadic-transition-and-the-order-three-type` (test
`order_three_level_two`): an order-3 character of `I₂` has level 2, since `3 ∣ 2 + 1`, `|𝔽₄^×| = 3` and
`|𝔽₂^×| = 1`. -/
example : 3 ∣ 2 + 1 ∧ 2 ^ 2 - 1 = 3 ∧ 2 - 1 = 1 := by norm_num

/-- `R33.2/dihedral-local-type-at-n` (tests `level_two_q7_N13` and `level_one_nonexample`): `q = 7,
N = 13` gives level 2 (`7 ∣ 14`, `7 ∤ 12`), while `q = 3, N = 7` is a non-example (`3 ∣ 6 = N − 1`). -/
example : 7 ∣ 13 + 1 ∧ ¬ 7 ∣ 13 - 1 ∧ 3 ∣ 7 - 1 := by norm_num

/-- Source issue `E4` (test `residue_field_units` of `R33.2/dihedral-local-type-at-n`): the unit
group of `𝔽_{N²}` has order `N² − 1 = (N − 1)(N + 1)`; the field has `N²` elements (`25 ≠ 24` at
`N = 5`). -/
example (N : ℤ) : N ^ 2 - 1 = (N - 1) * (N + 1) := by ring

example : (5 : ℕ) ^ 2 - 1 = (5 - 1) * (5 + 1) ∧ (5 : ℕ) ^ 2 ≠ (5 - 1) * (5 + 1) := by norm_num

/-- `R27.5/dyadic-weight-two-claim`, `R33.3/remark-6-weight-two-after-type-change`, source issue `E6`
and test `ramification_index_three` of `R33.3/dp-dyadic-transition-and-the-order-three-type`: an odd
valuation stays odd in an extension of odd ramification index (so a très ramifiée class never becomes
a unit times a square there), and becomes even in index 2. -/
example (e v : ℕ) (he : Odd e) (hv : Odd v) : Odd (e * v) := he.mul hv

example (v : ℕ) : Even (2 * v) := even_two_mul v

/-- `R33.1/fontaine-laffaille-member-not-bad-dihedral`: `p > 2k` excludes both `p = 2k − 1` and
`p = 2k − 3` of Lemma 1.14. -/
example (p k : ℕ) (hk : 2 ≤ k) (hp : 2 * k < p) : p ≠ 2 * k - 1 ∧ p ≠ 2 * k - 3 := by omega

/-- The niveau-2 case of Lemma 1.14 is attained at `p = 7, k = 5`: the projective order of inertia is
`(p + 1)/gcd(p + 1, k − 1) = 8/4 = 2` and `p = 2k − 3`. -/
example : Nat.gcd (7 + 1) (5 - 1) = 4 ∧ (7 + 1) / 4 = 2 ∧ 7 = 2 * 5 - 3 := by norm_num

/-- `R33.3/paso-5-killing-the-good-dihedral-prime` (Remark 5): at level one a bad-dihedral
representation has `p = 2k − 1` with `k` even, so `p ≡ 3 mod 4`; `N ≡ 1 mod 8` and `p = 5` are not. -/
example (m : ℕ) (hm : 1 ≤ m) : (2 * (2 * m) - 1) % 4 = 3 := by omega

example (N : ℕ) (hN : N % 8 = 1) : N % 4 ≠ 3 := by omega

example : 5 % 4 ≠ 3 := by norm_num

/-- `R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`: the even weights in `[2, 6]`
are `2, 4, 6`, and `4 = 3 + 1` is the weight Berger–Li–Zhu needs at `p = 3`. -/
example : (Finset.Icc 2 6).filter (fun k => k % 2 = 0) = {2, 4, 6} ∧ 4 = 3 + 1 := by decide

/-! ### Lemma 2.3: the two integral lattices of the order-three type at 2

Elements `a + bζ` of `ℤ[ζ]`, `ζ² + ζ + 1 = 0`, and `2 × 2` matrices over it, with the products written
out, so that the lattice identities are checked exactly. Reduction modulo `π = ζ − 1` is
`ℤ[ζ]/(π) = 𝔽₃`, `ζ ↦ 1`. `D₀, F₀` give the action of a tame generator `σ` of `I₂` and of `Frob₂` on the
standard lattice `L₀`; `D₁, F₁` give it on the adapted lattice `L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂`, with change of
basis `P`. -/

/-- `a + bζ ∈ ℤ[ζ]`, `ζ² + ζ + 1 = 0`. -/
structure Eis where
  a : ℤ
  b : ℤ
  deriving DecidableEq

namespace Eis

/-- Addition in `ℤ[ζ]`. -/
def add (x y : Eis) : Eis := ⟨x.a + y.a, x.b + y.b⟩

/-- `(a + bζ)(c + dζ) = (ac − bd) + (ad + bc − bd)ζ`, since `ζ² = −1 − ζ`. -/
def mul (x y : Eis) : Eis := ⟨x.a * y.a - x.b * y.b, x.a * y.b + x.b * y.a - x.b * y.b⟩

/-- Reduction modulo `π = ζ − 1`. -/
def red (x : Eis) : ZMod 3 := ((x.a + x.b : ℤ) : ZMod 3)

end Eis

/-- `2 × 2` matrices over `ℤ[ζ]`, row by row. -/
structure M2 where
  e00 : Eis
  e01 : Eis
  e10 : Eis
  e11 : Eis
  deriving DecidableEq

namespace M2

/-- Matrix multiplication. -/
def mul (A B : M2) : M2 :=
  ⟨(A.e00.mul B.e00).add (A.e01.mul B.e10), (A.e00.mul B.e01).add (A.e01.mul B.e11),
   (A.e10.mul B.e00).add (A.e11.mul B.e10), (A.e10.mul B.e01).add (A.e11.mul B.e11)⟩

/-- Reduction modulo `π`, as a Mathlib matrix over `𝔽₃`. -/
def red (A : M2) : Matrix (Fin 2) (Fin 2) (ZMod 3) :=
  !![A.e00.red, A.e01.red; A.e10.red, A.e11.red]

end M2

/-- `0`, `1`, `ζ`, `ζ² = −1 − ζ` and `π = ζ − 1` in `ℤ[ζ]`. -/
def e0 : Eis := ⟨0, 0⟩
def e1 : Eis := ⟨1, 0⟩
def eζ : Eis := ⟨0, 1⟩
def eζ2 : Eis := ⟨-1, -1⟩
def eπ : Eis := ⟨-1, 1⟩

/-- The identity, the standard-lattice matrices, the change of basis and the adapted-lattice matrices. -/
def one : M2 := ⟨e1, e0, e0, e1⟩
def D₀ : M2 := ⟨eζ, e0, e0, eζ2⟩
def F₀ : M2 := ⟨e0, e1, e1, e0⟩
def P : M2 := ⟨e1, e0, e1, eπ⟩
def D₁ : M2 := ⟨eζ, e0, eζ, eζ2⟩
def F₁ : M2 := ⟨e1, eπ, e0, ⟨-1, 0⟩⟩

/-- `ζ² = −1 − ζ`, so `ζ² + ζ + 1 = 0`. -/
example : eζ.mul eζ = eζ2 ∧ (eζ.mul eζ).add (eζ.add e1) = e0 := by decide

/-- `standard_lattice_relations` (R33.3): `D₀³ = F₀² = 1` and `F₀D₀F₀⁻¹ = D₀²` (`F₀⁻¹ = F₀`), the tame
relation at 2, and `D₀ ≡ 1 mod π`. -/
example : D₀.mul (D₀.mul D₀) = one ∧ F₀.mul F₀ = one ∧ (F₀.mul D₀).mul F₀ = D₀.mul D₀ ∧ D₀.red = 1 := by
  decide

/-- `adapted_lattice_change_of_basis` (R33.3): `D₀P = PD₁` and `F₀P = PF₁`, so `L₁` is stable; and
`D₁³ = F₁² = 1`, `F₁D₁F₁⁻¹ = D₁²`. -/
example : D₀.mul P = P.mul D₁ ∧ F₀.mul P = P.mul F₁ ∧ D₁.mul (D₁.mul D₁) = one ∧ F₁.mul F₁ = one ∧
    (F₁.mul D₁).mul F₁ = D₁.mul D₁ := by
  decide

/-- `adapted_lattice_nonsplit` (R33.3) and `residual_depends_on_lattice` (R33.2): modulo `π`,
`D₁ ≡ (1 0; 1 1) ≠ 1` and `F₁ ≡ diag(1, −1)`, so the reduction of `L₁` is a non-split extension with
one-dimensional inertia invariants. -/
example : D₁.red = !![1, 0; 1, 1] ∧ F₁.red = !![1, 0; 0, -1] ∧ D₁.red ≠ 1 ∧
    (D₁.red - 1) * (D₁.red - 1) = 0 := by
  decide

/-- `standard_lattice_nonexample` (R33.3): the standard lattice reduces to the trivial inertia action,
with two-dimensional invariants, so it cannot realise a ramified `ρ̄₃|_{I₂}`; `L₁` above does. -/
example : D₀.red = 1 ∧ D₀.red ≠ D₁.red := by decide

/-- `split_case_standard_lattice` (R33.3): modulo `π`, `F₀` squares to `1` and is neither `1` nor `−1`,
so its eigenvalues are `1` and `−1`, and `−1 = 2 = χ̄₃(Frob₂)`; so `L₀` realises `γ ⊗ (η ⊕ 1)`. -/
example : F₀.red * F₀.red = 1 ∧ F₀.red ≠ 1 ∧ F₀.red ≠ -1 ∧ (2 : ZMod 3) = -1 := by decide

/-- Both lattices have Frobenius trace `0`, as Lemma 2.3 requires: `tr F₀ = 0` and `tr F₁ = 1 − 1 = 0`. -/
example : F₀.e00.add F₀.e11 = e0 ∧ F₁.e00.add F₁.e11 = e0 := by decide

/-! ### Theorem 3.4: the dyadic conductor chain -/

/-- `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`: the Steinberg parameter `(id, N)` with
`N ≠ 0` nilpotent of rank one has conductor exponent `2 − dim ker N = 1`. -/
example : !![(0 : ℤ), 1; 0, 0] * !![(0 : ℤ), 1; 0, 0] = 0 ∧ !![(0 : ℤ), 1; 0, 0] ≠ 0 ∧ 2 - 1 = 1 := by
  decide

/-- The chain of bounds: the final exponent `e₃` is at most `r` whenever each reduction lowers or keeps
the exponent and the minimal lift keeps it; equality with the original exponent is not needed. -/
example (r A e₁ e₂ e₃ : ℕ) (hA : A ≤ r) (h₁ : e₁ ≤ A) (h₂ : e₂ = e₁) (h₃ : e₃ ≤ e₂) : e₃ ≤ r := by
  omega

/-- The boundary case `p = 2`, `k(ρ̄) = 4`, `r = 1`: the original exponent is `0`, the first system's is
`A = 1 ≠ 0`, and the bound `A ≤ r` holds. With `r = 0`, excluded by the theorem, it would fail. -/
example : (0 : ℕ) ≠ 1 ∧ (1 : ℕ) ≤ 1 ∧ ¬ (1 : ℕ) ≤ 0 := by decide

/-! ### The analytic carriers at the pins -/

open scoped UpperHalfPlane in
/-- RT-BP-ClassicalSerreModularity--R27.3/3: Mathlib's `CuspForm Γ k` exists at the pin and is a
function on the upper half-plane; the attached Galois representation is what the pins lack. -/
example (Γ : Subgroup (GL (Fin 2) ℝ)) (k : ℤ) (f : CuspForm Γ k) : ℍ → ℂ := f

end TauCeti.SerreConjecture.SuggestedTest
