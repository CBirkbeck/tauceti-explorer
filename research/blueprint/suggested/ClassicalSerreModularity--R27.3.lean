import Mathlib.Algebra.Ring.Parity
import Mathlib.Analysis.Complex.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.KrullTopology
import Mathlib.GroupTheory.Solvable
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.DirichletDensity
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Frobenius
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.Tactic.NormNum.GCD
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.Ring
import Mathlib.Topology.Algebra.Constructions
import Mathlib.Topology.Instances.Matrix

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
local Weil–Deligne types and the modularity comparison. Statements needing those are comments below,
except for six nodes of R27.1 and R27.6, which the last part of the file states as Lean theorems
against typed stand-ins (its section "Imported interfaces").
The checked examples test the arithmetic of the Khare–Wintenberger and Dieulefait–Pacetti arguments,
including an exact check of the two integral lattices of Lemma 2.3 over `ℤ[ζ]`.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

Fix revision: Codex codex-5ebb6f, 30 September 2026, Refs #5142. Independent REV-FIX records needs_changes (2 October 2026, Refs #5143).
No compilation was performed for that revision: no existing build was found at the pins. Historical
compilation in reviewHistory is not a check of it. Supplier signature sketches in the block below are
comments.
Lemma 8.2 imports the early R01.3/R01.4 definitions/classification; no level-one theorem or R15.6.
Its stage-component promotion is still a maintainer gap, not an implemented stage split.

Red-team fix FIX-RT-BP-ClassicalSerreModularity--R27.3: Claude claude-eZ1A2V, 6 October 2026, Refs #5715.
It ties the residual of `dihedralType` to its standard lattice, chooses the lattice of Lemma 2.3 by the
residual case at 2, and bounds the dyadic conductor in Theorem 3.4. That revision was elaborated with
`lake env lean` against Mathlib `082e2d3`, with no errors or warnings. Tau Ceti is named in comments only
and is not imported, because the shared build is not at the Tau Ceti pin.

Fix revision (round 3): Claude claude-c9TlsS, 6 October 2026, Refs #5870. It adds Lean statements, each
proved by `sorry`, for six nodes that had none: R27.1 Lemma 8.2 (`lemma_8_2`, `lemma_8_2_trace_eq_zero`)
and, in R27.6, the reductions of an Artin representation (`artin_reduction_ker_eq`,
`artin_reduction_finrank_fixedVectors`, `artin_reduction_isAbsIrreducible`, `artin_reduction_conductor`),
weight one for residual representations unramified at `ℓ` (`unramified_residual_arises_in_weight_one`),
the reduction of Katz forms of weight one (`weight_one_reduction_bijective`), Khare's descent
(`weight_one_descent`, `weight_one_descent_galoisRep`) and odd Artin representations
(`odd_artin_weight_one`). A Galois representation is a homomorphism from `Gal(ℚ̄/ℚ)` to `GL (Fin 2) k`;
Frobenius elements, inertia groups, complex conjugations and the Dirichlet density are Mathlib's. The
Artin conductor, Katz cusp forms with their operators, newforms of weight one and the Deligne–Serre
representation are opaque stand-ins for objects of other roadmaps. Each docstring says what it leaves
out of its node. Nothing is formalised: these are suggested signatures. The file elaborates with
`lake env lean` against Mathlib `082e2d3` with no errors, and its only warnings are
`declaration uses sorry`.

Independent review REV-FIX-RT-BP-ClassicalSerreModularity--R27.3: Claude claude-s4pYIP, 7 October 2026,
Refs #5716. It names Newform's nebentypus field `χ` in the `serre_strong` sketch and marks the planned
names there. The file elaborates with `lake env lean` against Mathlib `082e2d3` with no errors; its only
warnings are the 23 `declaration uses sorry` of the round-3 statements.

```
-- R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes  (𝔽_p coefficients, not 𝔽̄_p):
-- stated in Lean at the end of the file (`lemma_8_2`, `lemma_8_2_trace_eq_zero`).
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
-- `HeckeRing.GL2.Newform` is Tau Ceti's; its nebentypus is the field `χ : (ZMod N)ˣ →* ℂˣ`.
-- `coeffRing`, `residualRep` and the reduction of `χ` modulo `λ` are planned names of the missing
-- arithmetic interface, not Tau Ceti declarations.
theorem serre_strong (ρ̄ : GaloisRep ℚ (F̄ p) 2) (hodd : IsOdd ρ̄) (hirr : IsAbsIrreducible ρ̄) :
    ∃ (f : HeckeRing.GL2.Newform (serreLevel ρ̄) (serreWeight ρ̄)) (λ : Ideal f.coeffRing), λ.LiesOver p ∧
      Nonempty (residualRep f λ ≃ ρ̄) ∧ det ρ̄ = f.χ.reduce λ * cyclotomic p ^ (serreWeight ρ̄ - 1)
-- R27.6/odd-artin-weight-one-modularity: explicit Corollary 10.2(ii) export for ML.1.
-- The early Gross/Coleman–Voloch/Khare descent input is an open proof contract.
-- Do not import all of ML.1 in reverse, and do not treat weight >= 2 as weight-one modularity.
-- Stated in Lean at the end of the file (`odd_artin_weight_one`), with the four nodes of R27.6 it uses.
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

set_option autoImplicit false

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

/-! ## Statements for R27.1 Lemma 8.2 and the weight-one nodes of R27.6

Suggested signatures, each proved by `sorry`. -/

noncomputable section

namespace TauCeti.SerreConjecture

open NumberField
open scoped TensorProduct

universe u

/-! ## Conventions -/

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` and the nodes of R27.6 below
(convention): the absolute Galois group `G_ℚ = Gal(ℚ̄/ℚ)`, with Mathlib's Krull topology. -/
abbrev GQ : Type := AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` (convention): the ring `ℤ̄` of
algebraic integers, on which `G_ℚ` acts. -/
abbrev IntBar : Type := 𝓞 (AlgebraicClosure ℚ)

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` (convention): `σ` is an
arithmetic Frobenius element at some prime of `ℤ̄` containing `r`, that is, `σ x ≡ x ^ r` modulo
that prime for every algebraic integer `x`. For a prime number `r` these are the elements `Frob_r`
of the sources, for all choices of a prime above `r` and of a lift from the residue field. -/
def IsFrobAt (σ : GQ) (r : ℕ) : Prop :=
  ∃ Q : Ideal IntBar, Q.IsPrime ∧ (r : IntBar) ∈ Q ∧ IsArithFrobAt ℤ σ Q

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` (convention): `ρ` is unramified
at `r`, that is, trivial on the inertia group of every prime of `ℤ̄` containing `r`. -/
def IsUnramifiedAt {H : Type*} [Group H] (ρ : GQ →* H) (r : ℕ) : Prop :=
  ∀ Q : Ideal IntBar, Q.IsPrime → (r : IntBar) ∈ Q → Q.toAddSubgroup.inertia GQ ≤ ρ.ker

/-- `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity` (convention): `ρ` is odd, that is,
`det ρ(c) = −1` for every complex conjugation `c`: every `c` which some embedding `φ : ℚ̄ → ℂ`
carries to complex conjugation. All such `c` are conjugate in `G_ℚ`, so one of them suffices. -/
def IsOdd {k : Type*} [CommRing k] (ρ : GQ →* GL (Fin 2) k) : Prop :=
  ∀ (φ : AlgebraicClosure ℚ →+* ℂ) (c : GQ), ComplexEmbedding.IsConj φ c →
    Matrix.det (ρ c : Matrix (Fin 2) (Fin 2) k) = -1

/-- `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity` (convention): irreducibility of a
two-dimensional representation, as no line of `k²` being stable. Over an algebraically closed
field this is absolute irreducibility. -/
def IsIrreducible {G k : Type*} [Group G] [Field k] (ρ : G →* GL (Fin 2) k) : Prop :=
  ∀ v : Fin 2 → k, v ≠ 0 → ∃ g : G, ∀ a : k, (ρ g : Matrix (Fin 2) (Fin 2) k).mulVec v ≠ a • v

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type` (convention): absolute irreducibility in
Burnside's form, the matrices `ρ(g)` span `M₂(k)`. This is equivalent to irreducibility over every
extension field of `k`. -/
def IsAbsIrreducible {G k : Type*} [Group G] [Field k] (ρ : G →* GL (Fin 2) k) : Prop :=
  Submodule.span k (Set.range fun g : G => (ρ g : Matrix (Fin 2) (Fin 2) k)) = ⊤

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` (convention): `ρ_proj(a)` and
`ρ_proj(b)` are conjugate in the projective image `ρ_proj(G)`, that is, `ρ(a)` is a scalar multiple
of `ρ(τ b τ⁻¹)` for some `τ`. The scalar is a unit because `ρ(a)` is invertible. -/
def IsProjConj {G k : Type*} [Group G] [CommRing k] (ρ : G →* GL (Fin 2) k) (a b : G) : Prop :=
  ∃ (τ : G) (z : k),
    (ρ a : Matrix (Fin 2) (Fin 2) k) = z • (ρ (τ * b * τ⁻¹) : Matrix (Fin 2) (Fin 2) k)

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type` (convention): the vectors of `R²` fixed
by a subgroup `H`. -/
def fixedVectors {G R : Type*} [Group G] [CommRing R] (ρ : G →* GL (Fin 2) R) (H : Subgroup G) :
    Submodule R (Fin 2 → R) where
  carrier := {v | ∀ h ∈ H, (ρ h : Matrix (Fin 2) (Fin 2) R).mulVec v = v}
  add_mem' hv hw h hh := by rw [Matrix.mulVec_add, hv h hh, hw h hh]
  zero_mem' h _ := Matrix.mulVec_zero _
  smul_mem' a v hv h hh := by rw [Matrix.mulVec_smul, hv h hh]

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type` (convention): the reduction of a
representation over a local ring modulo the maximal ideal. -/
def residualRep {G O : Type*} [Group G] [CommRing O] [IsLocalRing O] (ρ : G →* GL (Fin 2) O) :
    G →* GL (Fin 2) (IsLocalRing.ResidueField O) :=
  (Matrix.GeneralLinearGroup.map (IsLocalRing.residue O)).comp ρ

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type` (convention): the representation over
the fraction field. -/
def genericRep {G O : Type*} [Group G] [CommRing O] [IsDomain O] (ρ : G →* GL (Fin 2) O) :
    G →* GL (Fin 2) (FractionRing O) :=
  (Matrix.GeneralLinearGroup.map (algebraMap O (FractionRing O))).comp ρ

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` (convention): the nonzero
primes of `ℤ = 𝓞 ℚ` generated by an element of a set `S` of natural numbers, the form in which
Mathlib's Dirichlet density takes a set of rational primes. -/
def primesOfRat (S : Set ℕ) : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ)) :=
  {v | Ideal.absNorm v.asIdeal ∈ S}

/-- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes` (convention): the level
`N′` of the weight-one statements, `N` if `N ≥ 5` and `5N` otherwise. -/
def auxLevel (N : ℕ) : ℕ := if 5 ≤ N then N else 5 * N

/-! ## Imported interfaces

Nothing in this section is planned by this packet. Each declaration stands in for an object that
another roadmap (named in its docstring) owns; the owner's definition governs. An opaque `def` is a
data type, a number or a map whose body is `sorry`; no condition is a `Prop`-valued placeholder. -/

section ImportedInterfaces

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type`, imported from
ArithmeticGaloisRepresentations R01.3 (stand-in, opaque): the Artin conductor of a two-dimensional representation of `G_ℚ` with open kernel over a field `k`, taken away from the
characteristic of `k`: `∏ r ^ n(r, ρ)` over the primes `r ≠ char k`, with
`n(r, ρ) = ∑_{i ≥ 0} [G₀ : Gᵢ]⁻¹ dim V / V^{Gᵢ}`. In characteristic zero it is the Artin conductor,
and in characteristic `ℓ` it is Serre's level `N(ρ̄)`. Only `CommRing k` is asked for, so that the
fraction field and the residue field of a local ring are accepted without unfolding instances. -/
def artinConductor {k : Type*} [CommRing k] (ρ : GQ →* GL (Fin 2) k) : ℕ := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`, imported from
AlgebraicModularFormsAndSerreWeights R15.1 (stand-in, opaque): Katz cusp forms
`S_k(Γ₁(N); A)` of level `N` and weight `k` with coefficients in a ring `A` in which `N` is
invertible. For `N ≥ 5` this is `H⁰(X₁(N)_A, ω^k ⊗ 𝒪(−cusps))`. -/
def KatzCuspForms (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] : Type u := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`, imported from R15.1
(opaque): the addition of Katz cusp forms. -/
instance (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] : AddCommGroup (KatzCuspForms N k A) := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`, imported from R15.1
(opaque): the `A`-module structure of Katz cusp forms. -/
instance (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] : Module A (KatzCuspForms N k A) := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`, imported from
R15.1–R15.2 (stand-in, opaque): the Hecke operator `T_r` on Katz cusp forms, for a prime `r`
not dividing `N` and invertible in `A`. The operators at the other primes are not used. -/
def katzHecke (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] (r : ℕ) :
    KatzCuspForms N k A →ₗ[A] KatzCuspForms N k A := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`, imported from
R15.1–R15.2 (stand-in, opaque): the diamond operator `⟨d⟩` on Katz cusp forms, for a unit `d` of
`ℤ/N`. -/
def katzDiamond (N : ℕ) (k : ℤ) (A : Type u) [CommRing A] (d : ZMod N) :
    KatzCuspForms N k A →ₗ[A] KatzCuspForms N k A := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`, imported from R15.2
(stand-in, opaque): the base-change map `B ⊗_A S_k(Γ₁(N); A) → S_k(Γ₁(N); B)`. -/
def katzBaseChange (N : ℕ) (k : ℤ) (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    B ⊗[A] KatzCuspForms N k A →ₗ[B] KatzCuspForms N k B := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`, imported from Tau Ceti
ModularForms, Layer 4 (stand-in, opaque): the normalised cuspidal newforms of weight one, of all levels and characters. At the Tau Ceti pin the type is
`Σ N, HeckeRing.GL2.Newform N 1`. -/
def WeightOneNewform : Type := sorry

namespace WeightOneNewform

/-- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes` (imported, opaque): the
level of the newform. -/
def level (f : WeightOneNewform) : ℕ := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes` (imported, opaque): the
character of the newform, a Dirichlet character modulo its level. -/
def character (f : WeightOneNewform) : DirichletCharacter ℂ f.level := sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes` (imported, opaque): the
Fourier coefficient `a_n(f)`; for a prime `r` it is the eigenvalue of `T_r`. -/
def coeff (f : WeightOneNewform) (n : ℕ) : ℂ := sorry

/-- `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity`, imported from
AutomorphicGaloisRepresentations R19.1 (stand-in, opaque): the Deligne–Serre representation
`ρ_f : G_ℚ → GL₂(ℂ)`, in a chosen basis. Only its conjugacy class is determined by `f`. -/
def galoisRep (f : WeightOneNewform) : GQ →* GL (Fin 2) ℂ := sorry

end WeightOneNewform

end ImportedInterfaces

/-! ## R27.1: Lemma 8.2 -/

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`: the primes of the lemma for
`ρ̄` and a complex conjugation `c`, namely the primes `q` at which `ρ̄` is unramified, such that (i) `ρ̄_proj(Frob_q)` and `ρ̄_proj(c)` are conjugate in the projective image,
(ii) `q ≡ 1` modulo every prime `ℓ ≤ p − 1` and modulo `8`, and (iii) `q ≡ −1` modulo `p`. -/
def auxiliaryPrimes {p : ℕ} (ρ : GQ →* GL (Fin 2) (ZMod p)) (c : GQ) : Set ℕ :=
  {q | q.Prime ∧ IsUnramifiedAt ρ q ∧ (∃ σ : GQ, IsFrobAt σ q ∧ IsProjConj ρ σ c) ∧
    (∀ ℓ : ℕ, ℓ.Prime → ℓ ≤ p - 1 → q % ℓ = 1) ∧ q % 8 = 1 ∧ q % p = p - 1}

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes` (KW I Lemma 8.2,
Dieulefait–Pacetti Lemma 1.15): for `p ≡ 1 mod 4` and `ρ̄ : G_ℚ → GL₂(𝔽_p)` continuous (open
kernel), odd and of non-solvable image, the set of primes `q` satisfying (i)–(iii) has a positive
Dirichlet density. The coefficients are the prime field `ZMod p`. Absolute irreducibility, the third
condition of S-type, is not a hypothesis because a non-solvable subgroup of `GL₂(𝔽_p)` stabilises
no line over `𝔽̄_p`. The node asks for some set of positive density; this states it for the set of
all such primes. Left out: the description of `ρ̄|_{D_q}` as an unramified twist of `diag(χ̄_p, 1)`
(the trace-zero consequence is the next statement). -/
theorem lemma_8_2 {p : ℕ} [Fact p.Prime] (hp : p % 4 = 1) (ρ : GQ →* GL (Fin 2) (ZMod p))
    (hcont : IsOpen (ρ.ker : Set GQ)) (hns : ¬ Group.IsSolvable ρ.range)
    {φ : AlgebraicClosure ℚ →+* ℂ} {c : GQ} (hc : ComplexEmbedding.IsConj φ c)
    (hodd : Matrix.det (ρ c : Matrix (Fin 2) (Fin 2) (ZMod p)) = -1) :
    ∃ δ : ℝ, 0 < δ ∧ NumberField.Set.HasDirichletDensity (primesOfRat (auxiliaryPrimes ρ c)) δ := by
  sorry

/-- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`, the
consequences: at a prime `q` of Lemma 8.2 every Frobenius element has trace zero, and `p ∣ q + 1`. -/
theorem lemma_8_2_trace_eq_zero {p : ℕ} [Fact p.Prime] (ρ : GQ →* GL (Fin 2) (ZMod p))
    {φ : AlgebraicClosure ℚ →+* ℂ} {c : GQ} (hc : ComplexEmbedding.IsConj φ c)
    (hodd : Matrix.det (ρ c : Matrix (Fin 2) (Fin 2) (ZMod p)) = -1) {q : ℕ}
    (hq : q ∈ auxiliaryPrimes ρ c) {σ : GQ} (hσ : IsFrobAt σ q) :
    Matrix.trace (ρ σ : Matrix (Fin 2) (Fin 2) (ZMod p)) = 0 ∧ p ∣ q + 1 := by
  sorry

/-! ## R27.6: reductions of an Artin representation -/

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type`, part (b), faithfulness: for a
finite group `G` whose order is invertible in the residue field of a local ring `O`, reduction
modulo the maximal ideal does not change the kernel of `ρ : G → GL₂(O)`. So the reduction cuts out
the same field. -/
theorem artin_reduction_ker_eq {G O : Type*} [Group G] [Finite G] [CommRing O] [IsLocalRing O]
    (hG : (Nat.card G : IsLocalRing.ResidueField O) ≠ 0) (ρ : G →* GL (Fin 2) O) :
    (residualRep ρ).ker = ρ.ker := by
  sorry

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type`, part (b), invariants: under the
same hypothesis, for every subgroup `H` the invariants `(O²)^H` are free of rank
`dim (k²)^H` (`dim (ρ̄_λ)^H = dim ρ^H`). -/
theorem artin_reduction_finrank_fixedVectors {G O : Type*} [Group G] [Finite G] [CommRing O]
    [IsLocalRing O] (hG : (Nat.card G : IsLocalRing.ResidueField O) ≠ 0) (ρ : G →* GL (Fin 2) O)
    (H : Subgroup G) :
    Module.Free O (fixedVectors ρ H) ∧
      Module.finrank (IsLocalRing.ResidueField O) (fixedVectors (residualRep ρ) H) =
        Module.finrank O (fixedVectors ρ H) := by
  sorry

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type`, part (b), irreducibility: for a
discrete valuation ring `O`, if the order of `G` is invertible in the residue field and `ρ` is
absolutely irreducible over the fraction field, then its reduction is absolutely irreducible. -/
theorem artin_reduction_isAbsIrreducible {G O : Type*} [Group G] [Finite G] [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] (hG : (Nat.card G : IsLocalRing.ResidueField O) ≠ 0)
    (ρ : G →* GL (Fin 2) O) (hirr : IsAbsIrreducible (genericRep ρ)) :
    IsAbsIrreducible (residualRep ρ) := by
  sorry

/-- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type`, part (c), ramification and
conductor: for a representation of `G_ℚ` with open kernel over a discrete valuation ring `O` of
characteristic zero and residue characteristic `ℓ`, with `ℓ` prime to the order of the image and to
the Artin conductor `N`, the reduction is unramified at `ℓ` and has conductor `N`.

Left out of the node by the four statements: part (a) (a model over a number field `E` and a stable
lattice at each place; here the lattice is the given `O²`, and the Frobenius identities of (a) are
the reduction of a trace and of a determinant), the independence of the lattice, the character
`ε(ρ̄_λ) = ε mod λ`, Serre's weight `k(ρ̄_λ) = ℓ` and Edixhoven's weight `1`
(AlgebraicModularFormsAndSerreWeights R15.4), and part (d) (the density `|C| / |G|` of the set
`P_c`, an instance of the Chebotarev density theorem, and the eigenvalues `1, −1` of
`ρ̄_λ(Frob_ℓ)` for `ℓ ∈ P_c`). Oddness of the reduction for odd `ℓ` is immediate. -/
theorem artin_reduction_conductor {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [CharZero O] {ℓ : ℕ} (hℓ : ℓ.Prime) [CharP (IsLocalRing.ResidueField O) ℓ]
    (ρ : GQ →* GL (Fin 2) O) (hcont : IsOpen (ρ.ker : Set GQ)) (hG : ¬ ℓ ∣ Nat.card ρ.range)
    (hN : ¬ ℓ ∣ artinConductor (genericRep ρ)) :
    IsUnramifiedAt (residualRep ρ) ℓ ∧
      artinConductor (residualRep ρ) = artinConductor (genericRep ρ) := by
  sorry

/-! ## R27.6: weight one -/

/-- `ClassicalSerreModularity:R27.6/unramified-residual-representations-arise-in-weight-one`: for an
odd prime `ℓ`, a representation `ρ̄ : G_ℚ → GL₂(𝔽̄_ℓ)` that is continuous (open kernel), irreducible,
odd and unramified at `ℓ`, and whose Frobenius at `ℓ` has two distinct eigenvalues
(`tr² ≠ 4 det`), arises from a nonzero Katz cusp form `h` of weight one and level `N(ρ̄)` over
`𝔽̄_ℓ`: `T_r h = tr ρ̄(Frob_r) h` and `⟨r⟩ h = det ρ̄(Frob_r) h` for every prime `r ∤ N(ρ̄) ℓ`. The
second equation says that the diamond operators act through `ε = det ρ̄`, since every unit class
modulo `N(ρ̄)` contains such a prime. Left out: the remark that the hypothesis on the Frobenius at
`ℓ` can be dropped for `ℓ > 2`. -/
theorem unramified_residual_arises_in_weight_one {ℓ : ℕ} [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (ρ : GQ →* GL (Fin 2) (AlgebraicClosure (ZMod ℓ))) (hcont : IsOpen (ρ.ker : Set GQ))
    (hirr : IsIrreducible ρ) (hodd : IsOdd ρ) (hur : IsUnramifiedAt ρ ℓ) {σ : GQ}
    (hσ : IsFrobAt σ ℓ)
    (hdist : Matrix.trace (ρ σ : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod ℓ))) ^ 2 ≠
      4 * Matrix.det (ρ σ : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod ℓ)))) :
    ∃ h : KatzCuspForms (artinConductor ρ) 1 (AlgebraicClosure (ZMod ℓ)), h ≠ 0 ∧
      ∀ r : ℕ, r.Prime → ¬ r ∣ artinConductor ρ * ℓ → ∀ τ : GQ, IsFrobAt τ r →
        katzHecke _ 1 _ r h =
            Matrix.trace (ρ τ : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod ℓ))) • h ∧
          katzDiamond _ 1 _ (r : ZMod (artinConductor ρ)) h =
            Matrix.det (ρ τ : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod ℓ))) • h := by
  sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`: for
`N ≥ 5` there is a finite set `B` of primes such that, for every prime `ℓ ∤ N` outside `B` and
every discrete valuation ring `O` of characteristic zero (flat over `ℤ_(ℓ)`) with residue field `k`
of characteristic `ℓ`, the base-change map `k ⊗_O S₁(N; O) → S₁(N; k)` is bijective and commutes
with `T_r` for the primes `r ∤ Nℓ` and with the diamond operators. Left out: that `B` can be taken
to be the set of primes `ℓ` with `H¹(X₁(N), ω ⊗ 𝒪(−cusps))[ℓ] ≠ 0`. -/
theorem weight_one_reduction_bijective (N : ℕ) (hN : 5 ≤ N) :
    ∃ B : Finset ℕ, ∀ ℓ : ℕ, ℓ.Prime → ¬ ℓ ∣ N → ℓ ∉ B →
      ∀ (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CharZero O]
        [CharP (IsLocalRing.ResidueField O) ℓ],
        Function.Bijective (katzBaseChange N 1 O (IsLocalRing.ResidueField O)) ∧
        (∀ r : ℕ, r.Prime → ¬ r ∣ N * ℓ → ∀ x,
          katzBaseChange N 1 O (IsLocalRing.ResidueField O)
              ((katzHecke N 1 O r).baseChange (IsLocalRing.ResidueField O) x) =
            katzHecke N 1 (IsLocalRing.ResidueField O) r
              (katzBaseChange N 1 O (IsLocalRing.ResidueField O) x)) ∧
        ∀ d : ZMod N, IsUnit d → ∀ x,
          katzBaseChange N 1 O (IsLocalRing.ResidueField O)
              ((katzDiamond N 1 O d).baseChange (IsLocalRing.ResidueField O) x) =
            katzDiamond N 1 (IsLocalRing.ResidueField O) d
              (katzBaseChange N 1 O (IsLocalRing.ResidueField O) x) := by
  sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`: the hypothesis of
Khare's descent at one prime `ℓ`, namely a place `λ ∣ ℓ` of `E` with an embedding of
its residue field in `𝔽̄_ℓ`, given together as a ring homomorphism `χ : 𝓞_E → 𝔽̄_ℓ`, and a nonzero
Katz cusp form `h` of type `(N, 1, ε mod λ)` over `𝔽̄_ℓ` with `T_r h = (t_r mod λ) h` for every
prime `r ∤ Nℓ`. -/
def OccursInWeightOneModulo (N : ℕ) {E : Type*} [Field E] [NumberField E]
    (ε : DirichletCharacter (𝓞 E) N) (t : ℕ → 𝓞 E) (ℓ : ℕ) [Fact ℓ.Prime] : Prop :=
  ∃ (χ : 𝓞 E →+* AlgebraicClosure (ZMod ℓ)) (h : KatzCuspForms N 1 (AlgebraicClosure (ZMod ℓ))),
    h ≠ 0 ∧ (∀ d : ZMod N, IsUnit d → katzDiamond N 1 _ d h = χ (ε d) • h) ∧
      ∀ r : ℕ, r.Prime → ¬ r ∣ N * ℓ → katzHecke N 1 _ r h = χ (t r) • h

/-- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes` (Khare's
descent): let `N ≥ 1`, `E ⊂ ℂ` a number field, `ε` a Dirichlet character modulo `N` with values in
`𝓞_E` and `(t_r)` a family in `𝓞_E`. If for infinitely many primes `ℓ` the family occurs in weight
one modulo `ℓ`, there is a normalised newform `f` of weight one, of level dividing `N′`, with
character induced by `ε` (the two characters agree on the integers prime to `N′`) and with
`a_r(f) = t_r` for every prime `r ∤ N′`. The family is indexed by all natural numbers; only its
values at the primes `r ∤ N` are used. The last sentence of the node is the next statement. -/
theorem weight_one_descent (N : ℕ) (hN : 0 < N) {E : Type*} [Field E] [NumberField E]
    (ι : E →+* ℂ) (ε : DirichletCharacter (𝓞 E) N) (t : ℕ → 𝓞 E)
    (h : {ℓ : ℕ | ∃ _ : Fact ℓ.Prime, OccursInWeightOneModulo N ε t ℓ}.Infinite) :
    ∃ f : WeightOneNewform, f.level ∣ auxLevel N ∧
      (∀ d : ℕ, d.Coprime (auxLevel N) → f.character (d : ZMod f.level) = ι (ε (d : ZMod N))) ∧
      ∀ r : ℕ, r.Prime → ¬ r ∣ auxLevel N → f.coeff r = ι (t r) := by
  sorry

/-- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`, the last
sentence: if moreover `ρ : G_ℚ → GL₂(ℂ)` is continuous and unramified outside `N` with
`tr ρ(Frob_r) = t_r` and `det ρ(Frob_r) = ε(r)` for the primes `r ∤ N`, then `ρ` is isomorphic to
the Deligne–Serre representation of such an `f`. Semisimplicity is not a hypothesis: a continuous
`ρ` has finite image. -/
theorem weight_one_descent_galoisRep (N : ℕ) (hN : 0 < N) {E : Type*} [Field E] [NumberField E]
    (ι : E →+* ℂ) (ε : DirichletCharacter (𝓞 E) N) (t : ℕ → 𝓞 E)
    (h : {ℓ : ℕ | ∃ _ : Fact ℓ.Prime, OccursInWeightOneModulo N ε t ℓ}.Infinite)
    (ρ : GQ →* GL (Fin 2) ℂ) (hcont : Continuous ρ)
    (hρ : ∀ r : ℕ, r.Prime → ¬ r ∣ N → IsUnramifiedAt ρ r ∧ ∀ τ : GQ, IsFrobAt τ r →
      Matrix.trace (ρ τ : Matrix (Fin 2) (Fin 2) ℂ) = ι (t r) ∧
        Matrix.det (ρ τ : Matrix (Fin 2) (Fin 2) ℂ) = ι (ε (r : ZMod N))) :
    ∃ f : WeightOneNewform, f.level ∣ auxLevel N ∧
      (∀ d : ℕ, d.Coprime (auxLevel N) → f.character (d : ZMod f.level) = ι (ε (d : ZMod N))) ∧
      (∀ r : ℕ, r.Prime → ¬ r ∣ auxLevel N → f.coeff r = ι (t r)) ∧
      ∃ g : GL (Fin 2) ℂ, ∀ σ : GQ, f.galoisRep σ = g * ρ σ * g⁻¹ := by
  sorry

/-- `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity` (KW I Corollary 10.2(ii)): a
continuous, odd, irreducible `ρ : G_ℚ → GL₂(ℂ)` is isomorphic to the Deligne–Serre representation of
a normalised cuspidal newform `f` of weight one, of level dividing `N′` for `N` the Artin conductor
of `ρ`, whose character is `det ρ` (`ε_f(r) = det ρ(Frob_r)` for the primes `r ∤ N′`). -/
theorem odd_artin_weight_one (ρ : GQ →* GL (Fin 2) ℂ) (hcont : Continuous ρ)
    (hirr : IsIrreducible ρ) (hodd : IsOdd ρ) :
    ∃ f : WeightOneNewform, f.level ∣ auxLevel (artinConductor ρ) ∧
      (∀ r : ℕ, r.Prime → ¬ r ∣ auxLevel (artinConductor ρ) → ∀ τ : GQ, IsFrobAt τ r →
        f.character (r : ZMod f.level) = Matrix.det (ρ τ : Matrix (Fin 2) (Fin 2) ℂ)) ∧
      ∃ g : GL (Fin 2) ℂ, ∀ σ : GQ, f.galoisRep σ = g * ρ σ * g⁻¹ := by
  sorry

end TauCeti.SerreConjecture

end
