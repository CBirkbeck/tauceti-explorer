/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HabiroNahmSeries.md is definitive. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.
No implementation is claimed; every packet node remains unchecked.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The base signatures and six reviewed refinements appear in layer order, with one
import block. Scoped sections preserve each packet's declaration namespace and
local notation. HB8Refinement.Imported consists of adapters to the base signatures;
it is not a second ownership plan. Unavailable Gaussian completions, Bloch/K3,
Rogers, regulator, Habiro module and cohomology carriers remain explicit omissions.
The reader records their exact owner contracts and all unresolved proof obligations.

Analytic A is rational and positive definite, with rational powers evaluated on the
upper half-plane. Formal A is integral with diagonal signs and no positivity.
The signed integral class, arithmetic root descent, corrected all-order Gaussian
identification and full coefficient-algebra descent retain the reader's conditions.
The powered and unpowered auxiliary products have different covariance laws.
-/

import Mathlib.Algebra.MvPolynomial.Degrees
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Ring.Equiv
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Complex.Periodic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.Fourier.PoissonSummation
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Analysis.Meromorphic.Order
import Mathlib.Analysis.Meromorphic.TrailingCoefficient
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Analysis.SpecialFunctions.Complex.Circle
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Summable
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Combinatorics.Enumerative.Pentagonal.EulerFunction
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Finsupp.Weight
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.PNat.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Algebra
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.KummerExtension
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.GroupTheory.FiniteAbelian.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.Matrix.Symmetric
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Integral.IntervalIntegral.TrapezoidalRule
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.NumberTheory.ModularForms.BoundedAtCusp
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.ModularForms.Cusps
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.NumberTheory.ModularForms.Discriminant
import Mathlib.NumberTheory.ModularForms.EisensteinSeries.Basic
import Mathlib.NumberTheory.ModularForms.NormTrace
import Mathlib.NumberTheory.ModularForms.QExpansion
import Mathlib.NumberTheory.ModularForms.SlashInvariantForms
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.ZetaValues
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Algebraic.Defs
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.MvPowerSeries.Expand
import Mathlib.RingTheory.MvPowerSeries.PiTopology
import Mathlib.RingTheory.MvPowerSeries.Substitution
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.PowerSeries.PiTopology
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RingTheory.Unramified.Finite
import Mathlib.Topology.Instances.AddCircle.Defs

section PartHB34

/-!
# HB.3–HB.4: Nahm equations, Bloch classes and root-of-unity asymptotics (checker A)

Mathlib-only.  Objects owned by other roadmaps (the Bloch groups of K3BlochGroups, the cyclic
quantum dilogarithm and `P_ζ`, `R_ζ`, `η_ζ` of HabiroNumberFields HB.2, the Dedekind sum and the
eta multiplier of QSeriesPartitionsAndMockModularForms QM.1, the q-Pochhammer symbols of QM.0)
are either written out here in plain Mathlib terms (when a few lines suffice, so that the
statements below have real types) or left out; the packet imports them by node id.
Every body is `sorry`; no statement is `True` and no predicate is `sorry`.
-/

open Complex Real Matrix Filter Asymptotics Topology
open scoped BigOperators

noncomputable section

namespace HabiroNahmSeries.HB34

variable {N : ℕ}

/-! ## HB.3/nahm-data -/

/-- An analytic Nahm datum `(A, B, C)`: `A` symmetric positive definite over `ℚ`. -/
structure NahmDatum (N : ℕ) where
  A : Matrix (Fin N) (Fin N) ℚ
  B : Fin N → ℚ
  C : ℚ
  isSymm : A.IsSymm
  posDef : (A.map ((↑) : ℚ → ℝ)).PosDef

/-- A formal Nahm datum: a symmetric integral matrix, no positivity. -/
structure FormalNahmDatum (N : ℕ) where
  A : Matrix (Fin N) (Fin N) ℤ
  isSymm : A.IsSymm

/-- `Q(n) = ½ nᵗ A n + B n + C`. -/
def NahmDatum.Q (P : NahmDatum N) (n : Fin N → ℤ) : ℚ :=
  (1 / 2 : ℚ) * ∑ i, ∑ j, P.A i j * n i * n j + ∑ i, P.B i * n i + P.C

/-- The real matrix `A`. -/
def NahmDatum.Areal (P : NahmDatum N) : Matrix (Fin N) (Fin N) ℝ := P.A.map ((↑) : ℚ → ℝ)

def NahmDatum.IsDenominator (P : NahmDatum N) (d : ℕ) : Prop :=
  0 < d ∧ ∀ n : Fin N → ℤ, ∃ t : ℤ, (d : ℚ) * P.Q n = t

def NahmDatum.IsStrongDenominator (P : NahmDatum N) (D : ℕ) : Prop :=
  0 < D ∧ ∀ k l : Fin N → ℤ, (∀ i, (D : ℤ) ∣ k i - l i) → ∃ t : ℤ, P.Q k - P.Q l = t

theorem NahmDatum.isStrongDenominator_two_mul (P : NahmDatum N) {d : ℕ}
    (hd : P.IsDenominator d) : P.IsStrongDenominator (2 * d) := sorry

@[ext] theorem NahmDatum.ext' {P P' : NahmDatum N} (hA : P.A = P'.A) (hB : P.B = P'.B)
    (hC : P.C = P'.C) : P = P' := sorry

/-- A positive definite formal datum as an analytic datum with `B = 0`, `C = 0`. -/
def FormalNahmDatum.toNahmDatum (F : FormalNahmDatum N)
    (h : (F.A.map ((↑) : ℤ → ℝ)).PosDef) : NahmDatum N where
  A := F.A.map ((↑) : ℤ → ℚ)
  B := 0
  C := 0
  isSymm := sorry
  posDef := sorry

theorem FormalNahmDatum.toNahmDatum_injective {F F' : FormalNahmDatum N}
    (h : (F.A.map ((↑) : ℤ → ℝ)).PosDef) (h' : (F'.A.map ((↑) : ℤ → ℝ)).PosDef)
    (e : F.toNahmDatum h = F'.toNahmDatum h') : F = F' := sorry

-- test `rogers_ramanujan_is_analytic` (computation)
example : ∃ P : NahmDatum 1, P.A = !![2] ∧ P.B = ![0] ∧ P.C = -1 / 60 ∧ P.IsDenominator 60 :=
  sorry
-- test `knot_matrix_not_posdef` (non-example)
example : ¬ (!![1, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℝ).PosDef := sorry
-- test `half_integral_not_formal` (non-example)
example : (!![3 / 2, 1 / 2; 1 / 2, 3 / 2] : Matrix (Fin 2) (Fin 2) ℝ).PosDef := sorry
-- test `strong_denominator_not_multiple` (non-example): `Q(n) = n²/4`
example (P : NahmDatum 1) (hA : P.A = !![1 / 2]) (hB : P.B = 0) (hC : P.C = 0) :
    P.IsStrongDenominator 2 ∧ ¬ P.IsDenominator 2 := sorry


-- NahmDatum.posDef: the field `posDef` of `NahmDatum` (positive definiteness of `A` over `ℝ`).

-- test `strong_denominator_two` (computation)
example (P : NahmDatum 1) (hA : P.A = !![2]) (hB : P.B = 0) (hC : P.C = 0) :
    P.IsDenominator 1 ∧ P.IsStrongDenominator 1 ∧ P.IsStrongDenominator 2 := sorry

-- test `toNahmDatum_injective` (characterisation): `FormalNahmDatum.toNahmDatum_injective` above, and
-- the image has `B = 0` and `C = 0`
example (F : FormalNahmDatum N) (h : (F.A.map ((↑) : ℤ → ℝ)).PosDef) :
    (F.toNahmDatum h).B = 0 ∧ (F.toNahmDatum h).C = 0 := sorry

/-! ## HB.3/nahm-equations -/

/-- Nahm's equations on the open cube, with real powers. -/
def NahmEq (A : Matrix (Fin N) (Fin N) ℝ) (X : Fin N → ℝ) : Prop :=
  (∀ i, 0 < X i ∧ X i < 1) ∧ ∀ i, 1 - X i = ∏ j, X j ^ A i j

/-- The signed Laurent form `1 - zᵢ = εᵢ ∏ⱼ zⱼ^{aᵢⱼ}` over a commutative ring. CGZ: `ε = 1`;
GSWZ (41): `εᵢ = (-1)^{aᵢᵢ}`. -/
def SignedNahmEq {R : Type*} [CommRing R] (A : Matrix (Fin N) (Fin N) ℤ) (ε : Fin N → ℤˣ)
    (z : Fin N → Rˣ) : Prop :=
  ∀ i, 1 - (z i : R) = ((ε i : ℤ) : R) * ((∏ j, z j ^ A i j : Rˣ) : R)

theorem NahmEq.pos {A : Matrix (Fin N) (Fin N) ℝ} {X : Fin N → ℝ} (h : NahmEq A X) (i : Fin N) :
    0 < X i ∧ X i < 1 := h.1 i

theorem NahmEq.iff_signedNahmEq (A : Matrix (Fin N) (Fin N) ℤ) (X : Fin N → ℝ)
    (hX : ∀ i, 0 < X i) :
    NahmEq (A.map ((↑) : ℤ → ℝ)) X ↔
      (∀ i, X i < 1) ∧ SignedNahmEq A 1 (fun i => Units.mk0 (X i) (hX i).ne') := sorry

theorem SignedNahmEq.map {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    {A : Matrix (Fin N) (Fin N) ℤ} {ε : Fin N → ℤˣ} {z : Fin N → Rˣ} (h : SignedNahmEq A ε z) :
    SignedNahmEq A ε (fun i => Units.map f.toMonoidHom (z i)) := sorry

theorem SignedNahmEq.gswz_eq_cgz_of_even {R : Type*} [CommRing R] (A : Matrix (Fin N) (Fin N) ℤ)
    (hA : ∀ i, Even (A i i)) (z : Fin N → Rˣ) :
    SignedNahmEq A (fun i => (-1) ^ (A i i).natAbs) z ↔ SignedNahmEq A 1 z := sorry

theorem NahmEq.perm (A : Matrix (Fin N) (Fin N) ℝ) (σ : Equiv.Perm (Fin N)) (X : Fin N → ℝ) :
    NahmEq A X ↔ NahmEq (A.submatrix σ σ) (X ∘ σ) := sorry

-- test `golden_ratio` (computation)
example : NahmEq (!![2] : Matrix (Fin 1) (Fin 1) ℝ) ![(√5 - 1) / 2] := sorry
-- test `boundary_rejected` (non-example)
example (A : Matrix (Fin N) (Fin N) ℝ) (X : Fin N → ℝ) (i : Fin N) (h : X i = 1) : ¬ NahmEq A X :=
  sorry
-- test `sign_convention` (non-example): for `A = (3)` the CGZ root of `X³ + X - 1` is not a root
-- of the GSWZ polynomial `z³ - z + 1`
example (x : ℝ) (hx : x ^ 3 + x - 1 = 0) : x ^ 3 - x + 1 ≠ 0 := sorry


-- test `eight_five_five_four` (computation): the distinguished point of `A = (8 5; 5 4)`
example : ∃ X : Fin 2 → ℝ, NahmEq (!![8, 5; 5, 4] : Matrix (Fin 2) (Fin 2) ℝ) X ∧
    |X 0 - 0.884829| < 1e-6 ∧ |X 1 - 0.789393| < 1e-6 := sorry

-- test `permutation_equivariance` (compatibility)
example (X : Fin 2 → ℝ) (h : NahmEq (!![4, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℝ) X) :
    NahmEq (!![1, 1; 1, 4] : Matrix (Fin 2) (Fin 2) ℝ) ![X 1, X 0] := sorry

/-! ## HB.3/distinguished-solution -/

theorem existsUnique_nahmEq (A : Matrix (Fin N) (Fin N) ℝ) (hA : A.PosDef) :
    ∃! X, NahmEq A X := sorry

def distinguishedSolution (A : Matrix (Fin N) (Fin N) ℝ) (hA : A.PosDef) : Fin N → ℝ :=
  (existsUnique_nahmEq A hA).exists.choose

theorem nahmEq_distinguishedSolution (A : Matrix (Fin N) (Fin N) ℝ) (hA : A.PosDef) :
    NahmEq A (distinguishedSolution A hA) := sorry

/-- `Ã = A + diag(z/(1-z))` is positive definite at the distinguished solution. -/
theorem posDef_hessian (A : Matrix (Fin N) (Fin N) ℝ) (hA : A.PosDef) :
    (A + Matrix.diagonal fun i =>
      distinguishedSolution A hA i / (1 - distinguishedSolution A hA i)).PosDef := sorry

-- acceptance: uniqueness fails without positivity
example : ¬ ∃! X, NahmEq (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℝ) X := sorry

/-! ## HB.3/nondegenerate-solution-and-discriminant and algebraicity -/

/-- GSWZ's `δ(z) = ∏ⱼ zⱼ^{-aⱼⱼ} det(diag(1 - z) A + diag z)`. -/
def nahmDiscriminant {K : Type*} [Field K] (A : Matrix (Fin N) (Fin N) ℤ) (z : Fin N → Kˣ) : K :=
  ((∏ j, z j ^ (-A j j) : Kˣ) : K) *
    (Matrix.diagonal (fun i => 1 - (z i : K)) * A.map ((↑) : ℤ → K) +
      Matrix.diagonal (fun i => (z i : K))).det

def IsNondegenerate {K : Type*} [Field K] (A : Matrix (Fin N) (Fin N) ℤ) (z : Fin N → Kˣ) : Prop :=
  nahmDiscriminant A z ≠ 0

theorem nahmDiscriminant_map {K L : Type*} [Field K] [Field L] (f : K →+* L)
    (A : Matrix (Fin N) (Fin N) ℤ) (z : Fin N → Kˣ) :
    nahmDiscriminant A (fun i => Units.map f.toMonoidHom (z i)) = f (nahmDiscriminant A z) := sorry

-- test `degenerate_line` (non-example)
example (t : ℝ) (ht0 : t ≠ 0) (ht1 : t ≠ 1) :
    nahmDiscriminant (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ)
      ![Units.mk0 t ht0, Units.mk0 (1 - t) (sub_ne_zero.2 (Ne.symm ht1))] = 0 := sorry

/-- Non-degeneracy is the invertibility of the logarithmic Jacobian `diag(1 - z) A + diag z`. -/
theorem isNondegenerate_iff_jacobian {K : Type*} [Field K] (A : Matrix (Fin N) (Fin N) ℤ)
    (z : Fin N → Kˣ) :
    IsNondegenerate A z ↔
      (Matrix.diagonal (fun i => 1 - (z i : K)) * A.map ((↑) : ℤ → K) +
        Matrix.diagonal (fun i => (z i : K))).det ≠ 0 := sorry

/-- The distinguished solution of a positive definite integral `A` is non-degenerate. -/
theorem isNondegenerate_distinguished (A : Matrix (Fin N) (Fin N) ℤ)
    (hA : (A.map ((↑) : ℤ → ℝ)).PosDef) (z : Fin N → ℝˣ)
    (hz : ∀ i, (z i : ℝ) = distinguishedSolution (A.map ((↑) : ℤ → ℝ)) hA i) :
    IsNondegenerate A z := sorry

-- test `discriminant_golden` (computation): `δ = z⁻²(2 - z)` for `A = (2)`
example (z : Fin 1 → ℝˣ) (hz : (z 0 : ℝ) = (√5 - 1) / 2) :
    nahmDiscriminant (!![2] : Matrix (Fin 1) (Fin 1) ℤ) z = ((z 0 : ℝ) ^ 2)⁻¹ * (2 - z 0) := sorry

-- test `discriminant_cubic_norm` (computation): GSWZ sign, `z³ - z + 1 = 0`, norm `±23`
example (K : Type*) [Field K] [NumberField K] (z : Fin 1 → Kˣ) (hz : (z 0 : K) ^ 3 - z 0 + 1 = 0) :
    Algebra.norm ℚ (nahmDiscriminant (!![3] : Matrix (Fin 1) (Fin 1) ℤ) z) = 23 ∨
      Algebra.norm ℚ (nahmDiscriminant (!![3] : Matrix (Fin 1) (Fin 1) ℤ) z) = -23 := sorry

-- test `distinguished_positive` (computation)
example (z : Fin 2 → ℝˣ) (hz : NahmEq (!![8, 5; 5, 4] : Matrix (Fin 2) (Fin 2) ℝ) fun i => (z i : ℝ)) :
    0 < nahmDiscriminant (!![8, 5; 5, 4] : Matrix (Fin 2) (Fin 2) ℤ) z := sorry

/-- HB.3/nondegenerate-points-are-algebraic. -/
theorem isAlgebraic_of_jacobian_ne_zero (f : Fin N → MvPolynomial (Fin N) ℚ) (p : Fin N → ℂ)
    (hp : ∀ i, MvPolynomial.aeval p (f i) = 0)
    (hJ : (Matrix.of fun i j => MvPolynomial.aeval p (MvPolynomial.pderiv j (f i))).det ≠ 0)
    (i : Fin N) : IsAlgebraic ℚ (p i) := sorry

/-- HB.3/algebraicity-and-the-nahm-field. -/
theorem isAlgebraic_distinguishedSolution (P : NahmDatum N) (i : Fin N) :
    IsAlgebraic ℚ (distinguishedSolution P.Areal P.posDef i) := sorry

/-! ## HB.3/bloch-class-of-a-solution and the Suslin obstruction -/

/-- CGZ's boundary `Σᵢ Xᵢ ∧ (1 - Xᵢ)` in the exterior square `⋀²_ℤ Fˣ`. -/
def cgzBoundary {F : Type*} [Field F] (X : Fin N → F) (hX : ∀ i, X i ≠ 0 ∧ X i ≠ 1) :
    ↥(⋀[ℤ]^2 (Additive Fˣ)) :=
  ∑ i, exteriorPower.ιMulti ℤ 2
    ![Additive.ofMul (Units.mk0 (X i) (hX i).1),
      Additive.ofMul (Units.mk0 (1 - X i) (sub_ne_zero.2 (hX i).2.symm))]

theorem cgzBoundary_eq_zero {F : Type*} [Field F] (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (X : Fin N → F) (hX : ∀ i, X i ≠ 0 ∧ X i ≠ 1)
    (h : SignedNahmEq A 1 (fun i => Units.mk0 (X i) (hX i).1)) : cgzBoundary X hX = 0 := sorry

/-- Suslin's target: the antisymmetric quotient `M ⊗ M / ⟨a ⊗ b + b ⊗ a⟩`. -/
abbrev AntisymSquare (M : Type*) [AddCommGroup M] : Type _ :=
  (TensorProduct ℤ M M) ⧸ LinearMap.range (LinearMap.id + (TensorProduct.comm ℤ M M).toLinearMap)

def antisymBoundary {F : Type*} [Field F] (X : Fin N → F) (hX : ∀ i, X i ≠ 0 ∧ X i ≠ 1) :
    AntisymSquare (Additive Fˣ) :=
  ∑ i, Submodule.Quotient.mk
    (Additive.ofMul (Units.mk0 (X i) (hX i).1) ⊗ₜ[ℤ]
      Additive.ofMul (Units.mk0 (1 - X i) (sub_ne_zero.2 (hX i).2.symm)))

/-- HB.3/suslin-obstruction-of-the-nahm-element: the boundary is `y ∧ y`, `y = ∏ Xᵢ^{aᵢᵢ}`. -/
theorem antisymBoundary_eq {F : Type*} [Field F] (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (X : Fin N → F) (hX : ∀ i, X i ≠ 0 ∧ X i ≠ 1)
    (h : SignedNahmEq A 1 (fun i => Units.mk0 (X i) (hX i).1)) :
    antisymBoundary X hX =
      Submodule.Quotient.mk
        (Additive.ofMul (∏ i, Units.mk0 (X i) (hX i).1 ^ A i i) ⊗ₜ[ℤ]
          Additive.ofMul (∏ i, Units.mk0 (X i) (hX i).1 ^ A i i)) := sorry

-- test `half_not_suslin` (non-example): for `A = (1)`, `X = 1/2`
example (h : ∀ i : Fin 1, (![1 / 2] : Fin 1 → ℚ) i ≠ 0 ∧ (![1 / 2] : Fin 1 → ℚ) i ≠ 1) :
    antisymBoundary (![1 / 2] : Fin 1 → ℚ) h ≠ 0 := sorry


-- test `boundary_vanishes` (computation): `X ∧ (1 - X) = 0` for `A = (2)` over a field with `X² + X = 1`
example {F : Type*} [Field F] (X : F) (hX : X ^ 2 + X - 1 = 0) (h : ∀ i : Fin 1, (![X] : Fin 1 → F) i ≠ 0 ∧ (![X] : Fin 1 → F) i ≠ 1) :
    cgzBoundary (![X] : Fin 1 → F) h = 0 := sorry

-- test `half_is_cgz_bloch` (computation): `[1/2]` has vanishing CGZ boundary (A = (1))
example (h : ∀ i : Fin 1, (![1 / 2] : Fin 1 → ℚ) i ≠ 0 ∧ (![1 / 2] : Fin 1 → ℚ) i ≠ 1) :
    cgzBoundary (![1 / 2] : Fin 1 → ℚ) h = 0 := sorry

-- The Bloch-group items need the CGZ Bloch group `B_CGZ(F)` of K3BlochGroups V.3, which is not in the
-- pinned libraries (the HB.5 part below has a stand-in `CGZBlochGroup` for its own statements):
-- nahmElement: not stated; needs the free abelian group `ℤ[F]` of K3BlochGroups V.3 (`Finsupp`-based there).
-- nahmElement_boundary: not stated; `cgzBoundary_eq_zero` above is its content in `⋀²_ℤ Fˣ`.
-- nahmBlochClass_eq_sum: not stated; needs `B_CGZ(F)` of K3BlochGroups V.3.
-- nahmBlochClass_map: not stated; needs the functoriality `cgzBloch.map` of K3BlochGroups V.3.
-- nahmBlochClass_clearDenominators: not stated; needs `B_CGZ(F) ⊗ ℚ` of K3BlochGroups V.3.
-- Test torsion_example: not stated; needs `B_CGZ(F)` and the five-term certificate of K3BlochGroups V.6.
-- Test map_compatibility: not stated; needs `cgzBloch.map` of K3BlochGroups V.3.

/-! ## HB.3/embeddings-and-regulator-evaluations (the Rogers value) -/

/-- `Li₂` on `[0,1]` by its series. -/
def dilog (x : ℝ) : ℝ := ∑' k : ℕ, x ^ (k + 1) / ((k : ℝ) + 1) ^ 2

/-- CGZ's Rogers dilogarithm on `(0,1)`: `π²/6` minus the standard one. -/
def rogersCGZ (x : ℝ) : ℝ := π ^ 2 / 6 - dilog x - Real.log x * Real.log (1 - x) / 2

/-- GZ's normalisation (8) is the negative of CGZ's. -/
theorem rogersGZ_eq_neg (x : ℝ) :
    dilog x + Real.log x * Real.log (1 - x) / 2 - π ^ 2 / 6 = -rogersCGZ x := sorry

-- test `rogers_at_golden` (computation): `π²/15`, not `π²/10`
example : rogersCGZ ((√5 - 1) / 2) = π ^ 2 / 15 := sorry
-- test `rogers_nahm_rank_two` (computation)
example (h : (!![4, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℝ).PosDef) :
    ∑ i, rogersCGZ (distinguishedSolution _ h i) = 7 * π ^ 2 / 60 := sorry


-- test `rogers_normalisation` (computation): `L(0) = π²/6`, `L(1) = 0`, and `L + L_std = π²/6`
example : rogersCGZ 0 = π ^ 2 / 6 ∧ rogersCGZ 1 = 0 ∧
    ∀ x, 0 < x → x < 1 → rogersCGZ x + (dilog x + Real.log x * Real.log (1 - x) / 2) = π ^ 2 / 6 := sorry

-- The regulator items need the Bloch–Wigner function on all of `ℂ` (Polylogarithms:P.1/bloch-wigner-dilogarithm)
-- and the Bloch group (K3BlochGroups V.3), neither in the pinned libraries:
-- nahmRegulator: not stated; needs `Polylogarithms:P.1/bloch-wigner-dilogarithm` and `NumberField.ComplexEmbedding`.
-- nahmRegulator_conj: not stated; needs nahmRegulator.
-- nahmRegulator_eq_cgzBloch: not stated; needs nahmRegulator and `B_CGZ(F)`.
-- rogersValue_rat_of_torsion: not stated; needs `B_CGZ(F)` (torsion of the class).
-- Test regulator_vanishes_torsion: not stated; needs nahmRegulator.
-- Test regulator_nonzero_nontorsion: not stated; needs nahmRegulator.

/-! ## HB.4/q-pochhammer-symbols (analytic evaluation; the formal symbols are QM.0's) -/

def qPochhammerFin (x q : ℂ) (n : ℕ) : ℂ := ∏ j ∈ Finset.range n, (1 - q ^ j * x)

def qPochhammerInfFun (x q : ℂ) : ℂ := ∏' n : ℕ, (1 - q ^ n * x)

theorem multipliable_qPochhammerInfFun (x q : ℂ) (hq : ‖q‖ < 1) :
    Multipliable fun n : ℕ => 1 - q ^ n * x := sorry

theorem qPochhammerInfFun_self (q : ℂ) (hq : ‖q‖ < 1) :
    qPochhammerInfFun q q = eulerFunction q := sorry

theorem qPochhammerInfFun_shift (x q : ℂ) (hq : ‖q‖ < 1) :
    qPochhammerInfFun x q = (1 - x) * qPochhammerInfFun (q * x) q := sorry

theorem log_qPochhammerInfFun (x q : ℂ) (hx : ‖x‖ < 1) (hq : ‖q‖ < 1) :
    Complex.log (qPochhammerInfFun x q) =
      -∑' l : ℕ, x ^ (l + 1) / (((l : ℂ) + 1) * (1 - q ^ (l + 1))) := sorry

/-! ## HB.4/analytic-nahm-sum -/

/-- `f_{A,B,C}(τ) = Σₙ e(τ Q(n)) / ∏ᵢ (q;q)_{nᵢ}`, `q = e(τ)`, for `Im τ > 0`. -/
def nahmSum (P : NahmDatum N) (τ : ℂ) : ℂ :=
  ∑' n : Fin N → ℕ,
    Complex.exp (2 * π * I * τ * (P.Q fun i => (n i : ℤ))) /
      ∏ i, qPochhammerFin (Complex.exp (2 * π * I * τ)) (Complex.exp (2 * π * I * τ)) (n i)

theorem nahmSum_summable (P : NahmDatum N) (τ : ℂ) (hτ : 0 < τ.im) :
    Summable fun n : Fin N → ℕ =>
      Complex.exp (2 * π * I * τ * (P.Q fun i => (n i : ℤ))) /
        ∏ i, qPochhammerFin (Complex.exp (2 * π * I * τ)) (Complex.exp (2 * π * I * τ)) (n i) :=
  sorry

theorem nahmSum_analytic (P : NahmDatum N) :
    DifferentiableOn ℂ (nahmSum P) {τ | 0 < τ.im} := sorry

theorem nahmSum_shift_C (P : NahmDatum N) (τ : ℂ) :
    nahmSum P τ = Complex.exp (2 * π * I * P.C * τ) * nahmSum { P with C := 0 } τ := sorry


/-- The holomorphic function on the upper half-plane attached to the series. -/
def nahmSum_upperHalfPlane (P : NahmDatum N) : UpperHalfPlane → ℂ := fun τ => nahmSum P τ

/-- The series depends only on the datum `(A, B, C)`. -/
theorem nahmSum_congr {P P' : NahmDatum N} (hA : P.A = P'.A) (hB : P.B = P'.B) (hC : P.C = P'.C) :
    nahmSum P = nahmSum P' := sorry

-- test `C_shift` (compatibility): `nahmSum_shift_C` above.

-- test `product_of_blocks` (compatibility): `f_{diag(2,2),0,0} = G(q)²`
example (P : NahmDatum 2) (hA : P.A = !![2, 0; 0, 2]) (hB : P.B = 0) (hC : P.C = 0)
    (Q : NahmDatum 1) (hQA : Q.A = !![2]) (hQB : Q.B = 0) (hQC : Q.C = 0) (τ : ℂ) (hτ : 0 < τ.im) :
    nahmSum P τ = nahmSum Q τ ^ 2 := sorry

-- The coefficient statements need the Nahm sum as a formal Puiseux series in `q` (the q-series of
-- QSeriesPartitionsAndMockModularForms QM.0); here it is the analytic function of `τ`:
-- nahmSum_coeff: not stated; needs the formal q-series form of the Nahm sum (QM.0).
-- Test rogers_ramanujan_series: not stated; needs nahmSum_coeff.
-- Test leading_term: not stated; needs nahmSum_coeff.
-- Test negative_B: not stated; needs nahmSum_coeff.

/-! ## HB.4/cyclic-dilogarithm-interface (the polynomial is HabiroNumberFields HB.2's) -/

def cyclicDilog (ζ x : ℂ) (m : ℕ) : ℂ := ∏ t ∈ Finset.Ico 1 m, (1 - ζ ^ t * x) ^ t

/-- The principal `m`-th root `exp((1/m) Σ t Log(1 - ζᵗ x))`. -/
def cyclicDilogRoot (ζ x : ℂ) (m : ℕ) : ℂ :=
  Complex.exp ((∑ t ∈ Finset.Ico 1 m, (t : ℂ) * Complex.log (1 - ζ ^ t * x)) / m)

theorem cyclicDilog_mul_root {ζ : ℂ} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (x : ℂ) :
    cyclicDilog ζ (ζ * x) m * (1 - x ^ m) = cyclicDilog ζ x m * (1 - x) ^ m := sorry

theorem cyclicDilog_one_pow_24 {ζ : ℂ} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) :
    cyclicDilog ζ 1 m ^ 24 = (m : ℂ) ^ (12 * m) := sorry

-- non-example: the packet's `D_ζ(1)^{24m} = m^{12m}` fails for `m = 3`
example : cyclicDilog (Complex.exp (2 * π * I / 3)) 1 3 ^ 72 ≠ (3 : ℂ) ^ 36 := sorry

theorem cyclicDilogRoot_zeta_pow {ζ : ℂ} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (θ : ℝ)
    (hθ : 0 < θ ∧ θ < 1) (k : ℕ) :
    cyclicDilogRoot ζ (ζ ^ k * θ) m =
      qPochhammerFin θ ζ k * cyclicDilogRoot ζ θ m / ((1 - (θ : ℂ) ^ m) ^ ((k : ℂ) / m)) := sorry

/-- The Dedekind sum `s(a,m) = Σ_{t=1}^{m-1} (t/m - 1/2)({at/m} - 1/2)`, `gcd(a,m) = 1`. -/
def dedekindSum (a : ℤ) (m : ℕ) : ℚ :=
  ∑ t ∈ Finset.Ico 1 m, ((t : ℚ) / m - 1 / 2) * (Int.fract ((a * t : ℚ) / m) - 1 / 2)

theorem cyclicDilogRoot_one (a : ℤ) (m : ℕ) (hm : 0 < m) (ha : IsCoprime a m) :
    cyclicDilogRoot (Complex.exp (2 * π * I * a / m)) 1 m =
      Real.sqrt m * Complex.exp (π * I * dedekindSum a m) := sorry

/-! ## HB.4/euler-function-at-a-root-of-unity -/

theorem eulerFunction_radial (a : ℤ) (m : ℕ) (hm : 0 < m) (ha : IsCoprime a m) :
    ∃ c > 0, (fun ε : ℝ =>
        (eulerFunction (Complex.exp (2 * π * I * a / m) * Real.exp (-ε / m)))⁻¹ -
          Complex.exp (π * I * dedekindSum a m) * Real.sqrt (ε / (2 * π)) *
            Real.exp (π ^ 2 / (6 * m * ε) - ε / (24 * m)))
      =O[𝓝[>] 0] fun ε : ℝ => Real.sqrt ε * Real.exp (π ^ 2 / (6 * m * ε) - c / ε) := sorry

/-! ## HB.4/pochhammer-radial-asymptotics (GZ Lemma 2.1 with a uniform remainder) -/

def dilogC (z : ℂ) : ℂ := ∑' k : ℕ, z ^ (k + 1) / ((k : ℂ) + 1) ^ 2

/-- `Li_{-s}(y) = Σ k^s y^k` for `|y| < 1`. -/
def polylogNeg (s : ℕ) (y : ℂ) : ℂ := ∑' k : ℕ, ((k : ℂ) + 1) ^ s * y ^ (k + 1)

/-- `c_r(ν) = -Σ_{t=1}^{m} (B_r(1 - (t+ν)/m) - δ_{r,2} ν²/m²) Li_{2-r}(ζᵗ w)/r!`, `r ≥ 2`. -/
def psiCoeff (m : ℕ) (ζ w : ℂ) (ν : ℝ) (r : ℕ) : ℂ :=
  -∑ t ∈ Finset.Icc 1 m,
    ((((Polynomial.bernoulli r).map (algebraMap ℚ ℂ)).eval (1 - ((t : ℂ) + ν) / m) -
        (if r = 2 then (ν : ℂ) ^ 2 / (m : ℂ) ^ 2 else 0)) *
      polylogNeg (r - 2) (ζ ^ t * w)) / (r.factorial : ℂ)

theorem log_qPochhammer_radial {ζ : ℂ} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 0 < m)
    (w₀ : ℝ) (hw₀ : w₀ < 1) (K : ℕ) (hK : 2 ≤ K) :
    ∃ C : ℝ, ∀ (w : ℂ) (ε ν : ℝ), ‖w‖ ≤ w₀ → 0 < ε → ε ≤ 1 → |ν| * ε ≤ 1 →
      ‖Complex.log
          (qPochhammerInfFun (ζ * Real.exp (-ε / m) * w * Real.exp (-ν * ε / m))
            (ζ * Real.exp (-ε / m))) -
        (-dilogC (w ^ m) / (m * ε) - ((ν : ℂ) / m - 1 / 2) * Complex.log (1 - w ^ m) -
          (ε * ν ^ 2 / (2 * m) : ℝ) * (w ^ m / (1 - w ^ m)) -
          Complex.log (cyclicDilogRoot ζ w m) - Complex.log (1 - w)) -
        ∑ r ∈ Finset.Icc 2 K, psiCoeff m ζ w ν r * (ε : ℂ) ^ (r - 1)‖ ≤
        C * ε⁻¹ * (ε * (1 + |ν|)) ^ (K + 1) := sorry

/-! ## HB.4/euler-maclaurin-with-remainder -/

theorem euler_maclaurin (K : ℕ) (hK : 1 ≤ K) (φ : ℝ → ℂ) (hφ : ContDiff ℝ K φ)
    (hint : ∀ j ≤ K, MeasureTheory.IntegrableOn (iteratedDeriv j φ) (Set.Ici 0))
    (β ε : ℝ) (hβ : 0 ≤ β ∧ β < 1) (hε : 0 < ε) :
    ‖∑' j : ℕ, φ ((j + β) * ε) - (ε⁻¹ * ∫ y in Set.Ici (0 : ℝ), φ y) +
        ∑ r ∈ Finset.Icc 1 K, ((bernoulliFun r β / r.factorial : ℝ) : ℂ) * (ε : ℂ) ^ (r - 1) *
          iteratedDeriv (r - 1) φ 0‖ ≤
      (⨆ y : ℝ, |bernoulliFun K (Int.fract y)|) / K.factorial * ε ^ (K - 1) *
        ∫ y in Set.Ici (0 : ℝ), ‖iteratedDeriv K φ y‖ := sorry

/-! ## HB.4/formal-gaussian-integration and HB.4/gaussian-moments -/

/-- `Δ_{Λ⁻¹} = Σ (Λ⁻¹)ᵢⱼ ∂ᵢ∂ⱼ` on polynomials. -/
def gaussLaplacian (L : Matrix (Fin N) (Fin N) ℝ) :
    MvPolynomial (Fin N) ℝ →ₗ[ℝ] MvPolynomial (Fin N) ℝ :=
  ∑ i, ∑ j, L i j • ((MvPolynomial.pderiv i).toLinearMap ∘ₗ (MvPolynomial.pderiv j).toLinearMap)

/-- The formal Gaussian bracket at `h = 1`: `Σₙ (Δ_{Λ⁻¹}ⁿ f)(0)/(2ⁿ n!)` (a finite sum). -/
def formalGaussian (Λ : Matrix (Fin N) (Fin N) ℝ) (f : MvPolynomial (Fin N) ℝ) : ℝ :=
  ∑ n ∈ Finset.range (f.totalDegree + 1),
    ((2 : ℝ) ^ n * n.factorial)⁻¹ * MvPolynomial.eval 0 ((gaussLaplacian Λ⁻¹)^[n] f)

theorem formalGaussian_const (Λ : Matrix (Fin N) (Fin N) ℝ) (c : ℝ) :
    formalGaussian Λ (MvPolynomial.C c) = c := sorry

theorem formalGaussian_sq (Λ : Matrix (Fin N) (Fin N) ℝ) (hΛ : Λ.IsSymm) (i j : Fin N) :
    formalGaussian Λ (MvPolynomial.X i * MvPolynomial.X j) = Λ⁻¹ i j := sorry

-- test `fourth_moment` (computation)
example : formalGaussian (1 : Matrix (Fin 1) (Fin 1) ℝ) (MvPolynomial.X 0 ^ 4) = 3 := sorry
-- test `odd_vanishes` (degenerate)
example : formalGaussian (1 : Matrix (Fin 1) (Fin 1) ℝ) (MvPolynomial.X 0 ^ 3) = 0 := sorry
-- test `off_diagonal_second_moment` (computation)
example : formalGaussian (!![2, 1; 1, 2] : Matrix (Fin 2) (Fin 2) ℝ)
    (MvPolynomial.X 0 * MvPolynomial.X 1) = -1 / 3 := sorry

theorem integral_mul_gaussian (Λ : Matrix (Fin N) (Fin N) ℝ) (hΛ : Λ.PosDef)
    (f : MvPolynomial (Fin N) ℝ) :
    ∫ x : Fin N → ℝ, MvPolynomial.eval x f * Real.exp (-(x ⬝ᵥ Λ.mulVec x) / 2) =
      (2 * π) ^ ((N : ℝ) / 2) * Λ.det ^ (-(1 / 2 : ℝ)) * formalGaussian Λ f := sorry


/-- The bracket of an odd polynomial vanishes. -/
theorem formalGaussian_odd (Λ : Matrix (Fin N) (Fin N) ℝ) (f : MvPolynomial (Fin N) ℝ)
    (hf : ∀ n ∈ f.support, Odd (n.sum fun _ e => e)) : formalGaussian Λ f = 0 := sorry

/-- Linearity in the integrand. -/
theorem formalGaussian_linear (Λ : Matrix (Fin N) (Fin N) ℝ) : IsLinearMap ℝ (formalGaussian Λ) := sorry

/-- An invertible linear change of the variable `w = M v`. -/
theorem formalGaussian_changeOfVariables (Λ M : Matrix (Fin N) (Fin N) ℝ) (hM : IsUnit M.det)
    (f : MvPolynomial (Fin N) ℝ) :
    formalGaussian (M.transpose * Λ * M)
        (MvPolynomial.aeval (fun i => ∑ j, M i j • MvPolynomial.X j) f) = formalGaussian Λ f := sorry

-- formalGaussian_translate: not stated; the translation rule multiplies the integrand by `e^{wᵗΛc}`, a
-- formal power series in the loop parameter, which a polynomial bracket cannot take (it needs the
-- `ℝ[[h]]`-valued bracket of HB.8's Gaussian collection).

-- test `second_moment` (computation): with `Λ = 1` in one variable the bracket of `w²` is `h = 1`
example : formalGaussian (1 : Matrix (Fin 1) (Fin 1) ℝ) (MvPolynomial.X 0 ^ 2) = 1 := sorry

-- test `diagonal_factorises` (compatibility)
example (a b : ℝ) (f g : Polynomial ℝ) :
    formalGaussian (Matrix.diagonal ![a, b])
        (Polynomial.aeval (MvPolynomial.X 0) f * Polynomial.aeval (MvPolynomial.X 1) g) =
      formalGaussian (!![a] : Matrix (Fin 1) (Fin 1) ℝ) (Polynomial.aeval (MvPolynomial.X 0) f) *
        formalGaussian (!![b] : Matrix (Fin 1) (Fin 1) ℝ) (Polynomial.aeval (MvPolynomial.X 0) g) := sorry

-- test `gz_normalisation` (compatibility): `integral_mul_gaussian` above.

/-! ## HB.4/lattice-sums-by-poisson-summation -/

theorem tsum_lattice_mul_gaussian (Λ : Matrix (Fin N) (Fin N) ℝ) (hΛ : Λ.PosDef)
    (f : MvPolynomial (Fin N) ℝ) :
    ∃ c > 0, ∀ x₀ : Fin N → ℝ, (fun s : ℝ =>
        (∑' n : Fin N → ℤ,
          MvPolynomial.eval (fun i => s * (n i + x₀ i)) f *
            Real.exp (-(s ^ 2) * ((fun i => (n i : ℝ) + x₀ i) ⬝ᵥ
              Λ.mulVec (fun i => (n i : ℝ) + x₀ i)) / 2)) -
          s⁻¹ ^ N * ∫ x : Fin N → ℝ, MvPolynomial.eval x f * Real.exp (-(x ⬝ᵥ Λ.mulVec x) / 2))
      =O[𝓝[>] 0] fun s : ℝ => Real.exp (-c / s ^ 2) := sorry

/-! ## HB.4/gauss-sum-and-congruence-splitting -/

/-- `G(Q, a/m) = D^{-N} Σ_{k mod D} e(ᾱ Q(k))`, `ᾱ = a m⁻¹ mod D`, `D` a strong denominator
divisible by a denominator. -/
def gaussSum (P : NahmDatum N) (a : ℤ) (m D : ℕ) : ℂ :=
  ((D : ℂ) ^ N)⁻¹ * ∑ k : Fin N → Fin D,
    Complex.exp (2 * π * I * (((a : ZMod D) * (m : ZMod D)⁻¹).val : ℂ) *
      (P.Q fun i => ((k i : ℕ) : ℤ)))

theorem gaussSum_of_integral (P : NahmDatum N) (hQ : ∀ n, ∃ t : ℤ, P.Q n = t) (a : ℤ) (m D : ℕ)
    (hD : 0 < D) : gaussSum P a m D = 1 := sorry

theorem gaussSum_independent (P : NahmDatum N) (a : ℤ) (m d D D' : ℕ) (hd : P.IsDenominator d)
    (hD : d ∣ D) (hD' : d ∣ D') (hDs : P.IsStrongDenominator D) (hDs' : P.IsStrongDenominator D')
    (hm : Nat.Coprime m D) (hm' : Nat.Coprime m D') : gaussSum P a m D = gaussSum P a m D' := sorry

-- test `vanishing` (computation): `A = (1)`, `B = 0`, `α = 1/3`, `D = 2`
example (P : NahmDatum 1) (hA : P.A = !![1]) (hB : P.B = 0) (hC : P.C = 0) :
    gaussSum P 1 3 2 = 0 := sorry


/-- `G(Q, α)` depends only on `ᾱ` modulo a denominator: `α ↦ α + d`. -/
theorem gaussSum_periodic (P : NahmDatum N) (a : ℤ) (m d D : ℕ) (hd : P.IsDenominator d) (hD : d ∣ D)
    (hDs : P.IsStrongDenominator D) (hm : Nat.Coprime m D) :
    gaussSum P (a + d * m) m D = gaussSum P a m D := sorry

-- nahmSum_split: not stated; needs the congruence pieces `f^{[k,k′]}` as functions of `ε`, which are not
-- defined here (GZ (25)-(26)).
-- nahmSum_split_finite: not stated; needs nahmSum_split.
-- Test splitting_recovers: not stated; needs nahmSum_split.

-- test `integral_Q` (computation): `A = (2)`, `B = 0`
example (P : NahmDatum 1) (hA : P.A = !![2]) (hB : P.B = 0) (hC : P.C = 0) (a : ℤ) (m D : ℕ)
    (hD : 0 < D) : gaussSum P a m D = 1 := sorry

-- test `rank_one_nonreal` (computation): `A = (2/3)`, `B = 1/3`, `α = 1/5`
example (P : NahmDatum 1) (hA : P.A = !![2 / 3]) (hB : P.B = ![1 / 3]) (hC : P.C = 0) :
    gaussSum P 1 5 6 = Complex.exp (2 * π * I / 12) / (Real.sqrt 3 : ℂ) := sorry

-- test `independence` (characterisation): `D = 2d` and `D = 4d` give the same value
example (P : NahmDatum N) (a : ℤ) (m d : ℕ) (hd : P.IsDenominator d)
    (h2 : P.IsStrongDenominator (2 * d)) (h4 : P.IsStrongDenominator (4 * d)) (hm : Nat.Coprime m (4 * d)) :
    gaussSum P a m (2 * d) = gaussSum P a m (4 * d) := sorry

-- test `not_modulo_small_D` (non-example): for `Q(n) = n²/4`, `c = 1` and `c = 3` differ modulo 2
example : (∑ k : Fin 2, Complex.exp (2 * π * I * 1 * ((k : ℕ) : ℂ) ^ 2 / 4)) / 2 ≠
    (∑ k : Fin 2, Complex.exp (2 * π * I * 3 * ((k : ℕ) : ℂ) ^ 2 / 4)) / 2 := sorry

/-! ## HB.4/radial-asymptotic-expansion (corrected GZ Theorem 3.1) -/

/-- `Q̄(k) = Q(k)` reduced modulo `m` through the inverse of its denominator. -/
def qbar (P : NahmDatum N) (m : ℕ) (k : Fin N → ℤ) : ZMod m :=
  ((P.Q k).num : ZMod m) * ((P.Q k).den : ZMod m)⁻¹

/-- `Λ = Σ L(zᵢ)` (CGZ normalisation) `= L(ξ_A)`. -/
def nahmLambda (P : NahmDatum N) : ℝ :=
  ∑ i, rogersCGZ (distinguishedSolution P.Areal P.posDef i)

/-- The constant term `χ_α^N m^{-N/2} c(Q) G(Q,α) S_{Q,ζ}(0)` with `χ_α = e(s(a,m)/2)`. -/
def radialConstant (P : NahmDatum N) (a : ℤ) (m D : ℕ) : ℂ :=
  let z := distinguishedSolution P.Areal P.posDef
  let θ : Fin N → ℝ := fun i => z i ^ (1 / (m : ℝ))
  let ζ : ℂ := Complex.exp (2 * π * I * a / m)
  let At : Matrix (Fin N) (Fin N) ℝ := P.Areal + Matrix.diagonal fun i => z i / (1 - z i)
  Complex.exp (π * I * dedekindSum a m) ^ N * (((m : ℝ) ^ (-(N : ℝ) / 2) : ℝ) : ℂ) *
    ((At.det ^ (-(1 / 2 : ℝ)) * ∏ i, θ i ^ (P.B i : ℝ) * (1 - z i) ^ ((1 : ℝ) / 2 - 1 / m) : ℝ) :
      ℂ) *
    gaussSum P a m D * (∏ i, (cyclicDilogRoot ζ (ζ * θ i) m)⁻¹) *
    ∑ k : Fin N → Fin m, ζ ^ (qbar P m fun i => ((k i : ℕ) : ℤ)).val *
      ∏ i, ((θ i ^ ((P.Areal.mulVec fun j => ((k j : ℕ) : ℝ)) i) : ℝ) : ℂ) /
        qPochhammerFin (ζ * θ i) ζ (k i)

theorem nahmSum_radial_expansion (P : NahmDatum N) (hC : P.C = 0) (a : ℤ) (m d : ℕ)
    (hm : Odd m) (ham : IsCoprime a m) (hd : P.IsDenominator d) (hmd : Nat.Coprime m d) :
    ∃ c : ℕ → ℂ, c 0 = radialConstant P a m (2 * d) ∧ ∀ K : ℕ,
      (fun ε : ℝ => Complex.exp (-(nahmLambda P) / (m * ε)) *
          nahmSum P ((a : ℂ) / m + I * ε / (2 * π * m)) -
        ∑ k ∈ Finset.range K, c k * (ε : ℂ) ^ k) =O[𝓝[>] 0] fun ε : ℝ => (ε : ℂ) ^ K := sorry

-- acceptance (computation): Andrews–Gordon `n = 5`, `A = (2)`, `α = 1/5`
example (P : NahmDatum 1) (hA : P.A = !![2]) (hB : P.B = 0) (hC : P.C = 0) :
    radialConstant P 1 5 2 = Complex.exp (2 * π * I * (5 / 24 - 1 / 8 + 1 / 60 - 1 / 100)) :=
  sorry
-- non-example: GZ's printed `χ = e(binom(m-1,2) α/12)` is wrong at `α = 2/3`
example : Complex.exp (π * I * dedekindSum 2 3) ≠ Complex.exp (2 * π * I * (2 / 3 / 12)) := sorry


/-! ## HB.3/embeddings-and-regulator-evaluations (continued): the Rogers value -/

/-- `L(ξ_A) = Σᵢ L(Xᵢ)` in `ℝ/(π²/2)ℤ` for the distinguished solution (CGZ normalisation). -/
def rogersValue (P : NahmDatum N) : AddCircle (π ^ 2 / 2) := (nahmLambda P : AddCircle (π ^ 2 / 2))

/-- `rogersValue = -Σ L_GZ(Xᵢ) = Λ`, with GZ's `L_GZ = Li₂ + ½ log · log(1 - ·) - π²/6`. -/
theorem rogersValue_eq_neg_gz (P : NahmDatum N) :
    rogersValue P = ((-∑ i, (dilog (distinguishedSolution P.Areal P.posDef i) +
      Real.log (distinguishedSolution P.Areal P.posDef i) *
        Real.log (1 - distinguishedSolution P.Areal P.posDef i) / 2 - π ^ 2 / 6) : ℝ) :
      AddCircle (π ^ 2 / 2)) := sorry

/-! ## HB.4/kummer-invariance-of-the-expansion (at `ε = 0`) -/

/-- `T(θ) = Σ_k ζ^{Q̄(k)} ∏ᵢ θᵢ^{(Ak)ᵢ}/(ζθᵢ;ζ)_{kᵢ}` for `A` with natural entries and
`Q̄(k) = ½ kᵗAk + Bk` computed in `ZMod m` (`m` odd). -/
def kummerSum {m : ℕ} (A : Matrix (Fin N) (Fin N) ℕ) (B : Fin N → ZMod m) (ζ : ℂ)
    (θ : Fin N → ℂ) : ℂ :=
  ∑ k : Fin N → Fin m,
    ζ ^ ((2 : ZMod m)⁻¹ * ∑ i, ∑ j, (A i j : ZMod m) * ((k i : ℕ) : ZMod m) * ((k j : ℕ) : ZMod m) +
        ∑ i, B i * ((k i : ℕ) : ZMod m)).val *
      ∏ i, θ i ^ (∑ j, A i j * (k j : ℕ)) / qPochhammerFin (ζ * θ i) ζ (k i)

/-- Constant-term naming target only. Symmetry and admissible nonzero coordinates are
explicit; this does not supply the missing all-order automorphism identity. -/
theorem kummerSum_invariant {m : ℕ} (hm : Odd m) (A : Matrix (Fin N) (Fin N) ℕ)
    (hA : A.IsSymm) (B : Fin N → ZMod m) {ζ : ℂ} (hζ : IsPrimitiveRoot ζ m) (θ : Fin N → ℂ)
    (hN : ∀ i, 1 - θ i ^ m = ∏ j, (θ j ^ m) ^ A i j)
    (hθ : ∀ i, θ i ≠ 0) (hθm : ∀ i, θ i ^ m ≠ 1) (s : Fin N → ℕ) :
    kummerSum A B ζ (fun i => ζ ^ s i * θ i) ^ m / ∏ i, cyclicDilog ζ (ζ * (ζ ^ s i * θ i)) m =
      kummerSum A B ζ θ ^ m / ∏ i, cyclicDilog ζ (ζ * θ i) m := sorry

/-! ### HB.3–HB.4 items without a Lean form here -/

-- HB.3/general-nondegenerate-class: not stated; the ring `R[δ^{-1/2}]` over `O_K[1/Δ]` is constructible from
-- Mathlib (`IsLocalization.Away`, `AdjoinRoot`), but the node's class `ξ ∈ K₃(K)` needs K3BlochGroups V.4/V.5.
-- nahmRing: not stated; `R[δ^{-1/2}] = R[T]/(δT² - 1)` with `R = O_K[1/Δ]`, left to the node's owner with the class.
-- nahmRing.deltaInv: not stated; needs nahmRing.
-- nahmRing.involution: not stated; needs nahmRing.
-- nahmRing.involution_sq: not stated; needs nahmRing.
-- nahmRing.class: not stated; needs `K₃(K)` (K3BlochGroups V.4/V.5).
-- nahmRing.delta_isUnit: not stated; needs nahmRing.
-- Test cubic_ring: not stated; needs nahmRing.
-- Test quartic_ring: not stated; needs nahmRing.
-- Test involution_nontrivial: not stated; needs nahmRing.involution.
-- Test delta_unit: not stated; needs nahmRing.delta_isUnit.
-- Test sign_not_cgz: not stated; needs nahmRing.
-- HB.3/torsion-criterion-by-regulators: not stated; needs `B_CGZ(F)` (K3BlochGroups V.3) and the Bloch–Wigner
--   function (Polylogarithms P.1), with Borel's injectivity (BorelRegulators R.4).
-- HB.3/torsion-in-the-algebraic-closure: not stated; needs `B(ℚ̄)` and its unique divisibility (K3BlochGroups V.4).
-- HB.4/summand-asymptotics: not stated; the corrected GZ Proposition 2.2 expands the summand along
--   `n = ε⁻¹ log(1/z) + ε^{-1/2} x` in `ε^{1/2}`, and needs the ψ-series of `log_qPochhammer_radial` as a formal
--   series in `x` and `ε^{1/2}`, which is not set up here.
-- HB.4/summand-tail-bound: not stated; needs the summand of HB.4/summand-asymptotics.
-- HB.4/poisson-summation-and-remainders: not stated; it combines `tsum_lattice_mul_gaussian` with the summand
--   expansion, which is not set up here.
-- HB.4/galois-equivariance-of-the-expansion: not stated; needs the all-orders series `S_{Q,ζ}(ε)` as a formal
--   power series, of which `radialConstant` is the constant term.
-- HB.4/simplified-form-and-the-unit: not stated; needs `P_ζ` of HabiroNumberFields HB.2.
-- HB.4/unit-corollary-and-nonvanishing: not stated; needs `P_ζ` and `R_ζ` of HabiroNumberFields HB.2.
-- HB.4/andrews-gordon-radial-constant: not stated; needs the Andrews–Gordon identity at every odd modulus
--   (requested from QSeriesPartitionsAndMockModularForms QM.0) and the Rogers value of CGZ (47).
-- HB.4/acceptance-andrews-gordon: not stated; needs `R_ζ` and `η_ζ` of HabiroNumberFields HB.2 (CGZ Theorem 7.4).

end HabiroNahmSeries.HB34

end

end PartHB34

/-! ## HB.3: reviewed refinements -/

noncomputable section AssemblyHB3
open scoped BigOperators

namespace TauCeti.Nahm

variable {n : ℕ}

/-- For M integral, Pᵢ=(1-Xᵢ^d)∏ⱼXⱼ^((-Mᵢⱼ).toNat)-εᵢ∏ⱼXⱼ^(Mᵢⱼ.toNat).
    The datum d>0 is imposed by the equivalence theorem, not by this polynomial. -/
def clearingPolynomial (d : ℕ) (M : Matrix (Fin n) (Fin n) ℤ)
    (ε : Fin n → ℤ) (i : Fin n) : MvPolynomial (Fin n) ℚ := by
  sorry

lemma clearingPolynomial.eval {K : Type*} [Field K] [Algebra ℚ K]
    (d : ℕ) (M : Matrix (Fin n) (Fin n) ℤ) (ε : Fin n → ℤ)
    (y : Fin n → K) (i : Fin n) :
    MvPolynomial.aeval y (clearingPolynomial d M ε i) =
      (1 - y i ^ d) * (∏ j, y j ^ (-M i j).toNat) -
        (ε i : K) * (∏ j, y j ^ (M i j).toNat) := by
  sorry

lemma clearingPolynomial.zero_iff {K : Type*} [Field K] [Algebra ℚ K]
    (d : ℕ) (hd : 0 < d) (M : Matrix (Fin n) (Fin n) ℤ)
    (ε : Fin n → ℤ) (y : Fin n → K) (hy : ∀ j, y j ≠ 0) (i : Fin n) :
    MvPolynomial.aeval y (clearingPolynomial d M ε i) = 0 ↔
      1 - y i ^ d = (ε i : K) * ∏ j, y j ^ M i j := by
  sorry

lemma clearingPolynomial.nonnegative (d : ℕ) (M : Matrix (Fin n) (Fin n) ℤ)
    (hM : ∀ i j, 0 ≤ M i j) (ε : Fin n → ℤ) (i : Fin n) :
    clearingPolynomial d M ε i = 1 - MvPolynomial.X i ^ d -
      MvPolynomial.C (ε i : ℚ) * ∏ j, MvPolynomial.X j ^ (M i j).toNat := by
  sorry

lemma clearingPolynomial.map (d : ℕ) (M : Matrix (Fin n) (Fin n) ℤ)
    (ε : Fin n → ℤ) {K L : Type*} [Field K] [Field L]
    [Algebra ℚ K] [Algebra ℚ L] (φ : K →ₐ[ℚ] L)
    (y : Fin n → K) (i : Fin n) :
    φ (MvPolynomial.aeval y (clearingPolynomial d M ε i)) =
      MvPolynomial.aeval (fun j => φ (y j)) (clearingPolynomial d M ε i) := by
  sorry

lemma clearingPolynomial.reindex (d : ℕ) (M : Matrix (Fin n) (Fin n) ℤ)
    (ε : Fin n → ℤ) (e : Fin n ≃ Fin n) (i : Fin n) :
    MvPolynomial.rename e (clearingPolynomial d M ε i) =
      clearingPolynomial d (fun a b => M (e.symm a) (e.symm b))
        (fun a => ε (e.symm a)) (e i) := by
  sorry

-- clearingPolynomial_rank_one: A=(2), d=1, ε=1.
example : clearingPolynomial 1 (fun _ _ : Fin 1 => 2) (fun _ => 1) 0 =
    1 - MvPolynomial.X 0 - MvPolynomial.X 0 ^ 2 := by
  sorry

-- clearingPolynomial_negative_entry: negative exponents are cleared on the left.
example : clearingPolynomial 1 (fun _ _ : Fin 1 => -1) (fun _ => 1) 0 =
    (1 - MvPolynomial.X 0) * MvPolynomial.X 0 - 1 := by
  sorry

-- clearingPolynomial_zero_denominator: d=0 cannot encode root lifting.
example : clearingPolynomial 0 (fun _ _ : Fin 1 => 0) (fun _ => 1) 0 = -1 := by
  sorry

-- clearingPolynomial_boundary_zero: cleared polynomials have spurious nonunit zeros.
example (i : Fin 2) : MvPolynomial.aeval (fun _ : Fin 2 => (0 : ℚ))
    (clearingPolynomial 1 (fun i j : Fin 2 => if i = j then -1 else 1)
      (fun _ => 1) i) = 0 := by
  sorry

-- clearingPolynomial_aeval_compatibility: the existing evaluation is used literally.
example (y : Fin 1 → ℚ) : MvPolynomial.aeval y
    (clearingPolynomial 1 (fun _ _ : Fin 1 => 2) (fun _ => 1) 0) =
    1 - y 0 - y 0 ^ 2 := by
  sorry

/-- Exact Jacobian factorization at a unit zero of the cleared system. -/
theorem clearingJacobian {K : Type*} [Field K] [Algebra ℚ K]
    (d : ℕ) (hd : 0 < d) (M : Matrix (Fin n) (Fin n) ℤ)
    (ε : Fin n → ℤ) (y : Fin n → K) (hy : ∀ j, y j ≠ 0)
    (hx : ∀ i, 1 - y i ^ d ≠ 0)
    (hf : ∀ i, MvPolynomial.aeval y (clearingPolynomial d M ε i) = 0) :
    let J : Matrix (Fin n) (Fin n) K := fun i j =>
      MvPolynomial.aeval y (MvPolynomial.pderiv j (clearingPolynomial d M ε i))
    let c : Fin n → K := fun i => (1 - y i ^ d) * ∏ j, y j ^ (-M i j).toNat
    let B : Matrix (Fin n) (Fin n) K :=
      (show Matrix (Fin n) (Fin n) K from fun i j => (M i j : K)) +
        Matrix.diagonal (fun i => (d : K) * y i ^ d / (1 - y i ^ d))
    J = -(Matrix.diagonal c * B * Matrix.diagonal (fun j => (y j)⁻¹)) ∧
      Matrix.det J = (-1 : K) ^ n * (∏ i, c i) *
        (∏ j, (y j)⁻¹) * Matrix.det B ∧
      (Matrix.det J ≠ 0 ↔ Matrix.det B ≠ 0) := by
  sorry

/-- The missing commutative-algebra bridge behind the imported algebraicity result.
    Generation is as a field; generation as an algebra is not assumed. -/
theorem coordinateFieldUnramified {k L : Type*} [Field k] [Field L] [Algebra k L]
    (p : Fin n → L) (f : Fin n → MvPolynomial (Fin n) k)
    (hgen : IntermediateField.adjoin k (Set.range p) = ⊤)
    (hf : ∀ i, MvPolynomial.aeval p (f i) = 0)
    (hJ : Matrix.det (fun i j => MvPolynomial.aeval p (MvPolynomial.pderiv j (f i))) ≠ 0) :
    Algebra.FormallyUnramified k L ∧ Module.Finite k L := by
  sorry

/-- Positive coherent roots yᵢ=xᵢ^(1/d), with their coordinate field Q(y). -/
def positiveRootLift (d : ℕ) (x : Fin n → ℝ) : Fin n → ℝ := by
  sorry

lemma positiveRootLift.eq_rpow (d : ℕ) (x : Fin n → ℝ) (i : Fin n) :
    positiveRootLift d x i = Real.rpow (x i) (1 / (d : ℝ)) := by
  sorry

lemma positiveRootLift.pow (d : ℕ) (hd : 0 < d) (x : Fin n → ℝ)
    (hx : ∀ i, 0 ≤ x i) (i : Fin n) : positiveRootLift d x i ^ d = x i := by
  sorry

lemma positiveRootLift.mem_cube (d : ℕ) (hd : 0 < d) (x : Fin n → ℝ)
    (hx : ∀ i, x i ∈ Set.Ioo 0 1) (i : Fin n) :
    positiveRootLift d x i ∈ Set.Ioo 0 1 := by
  sorry

lemma positiveRootLift.one (x : Fin n → ℝ) (hx : ∀ i, 0 ≤ x i) :
    positiveRootLift 1 x = x := by
  sorry

lemma positiveRootLift.unique (d : ℕ) (hd : 0 < d) (x y : Fin n → ℝ)
    (hx : ∀ i, 0 ≤ x i) (hy : ∀ i, 0 ≤ y i)
    (hp : ∀ i, y i ^ d = x i) : y = positiveRootLift d x := by
  sorry

lemma positiveRootLift.equations (d : ℕ) (hd : 0 < d)
    (M : Matrix (Fin n) (Fin n) ℤ) (x : Fin n → ℝ)
    (hx : ∀ i, x i ∈ Set.Ioo 0 1)
    (heq : ∀ i, 1 - x i = ∏ j, Real.rpow (x j) ((M i j : ℝ) / d)) (i : Fin n) :
    1 - x i = ∏ j, positiveRootLift d x j ^ M i j := by
  sorry

lemma positiveRootLift.field_le (d : ℕ) (hd : 0 < d) (x : Fin n → ℝ)
    (hx : ∀ i, 0 ≤ x i) :
    IntermediateField.adjoin ℚ (Set.range x) ≤
      IntermediateField.adjoin ℚ (Set.range (positiveRootLift d x)) := by
  sorry

lemma positiveRootLift.finite (d : ℕ) (hd : 0 < d)
    (M : Matrix (Fin n) (Fin n) ℤ)
    (hA : Matrix.PosDef (fun i j => (M i j : ℝ) / d))
    (x : Fin n → ℝ) (hx : ∀ i, x i ∈ Set.Ioo 0 1)
    (heq : ∀ i, 1 - x i = ∏ j, Real.rpow (x j) ((M i j : ℝ) / d)) :
    Module.Finite ℚ (IntermediateField.adjoin ℚ (Set.range (positiveRootLift d x))) := by
  sorry

-- positiveRootLift_rank_one_half: x=(3-√5)/2 for A=(1/2), not for A=(2).
example : positiveRootLift 2 (fun _ : Fin 1 => (3 - Real.sqrt 5) / 2) 0 =
    (Real.sqrt 5 - 1) / 2 := by
  sorry

-- positiveRootLift_denominator_one.
example : positiveRootLift 1 (fun _ : Fin 1 => (1 / 2 : ℝ)) 0 = 1 / 2 := by
  sorry

-- positiveRootLift_empty: both coordinate fields are Q.
example : IntermediateField.adjoin ℚ
    (Set.range (positiveRootLift 2 (fun i : Fin 0 => Fin.elim0 i))) =
    (⊥ : IntermediateField ℚ ℝ) := by
  sorry

-- positiveRootLift_negative_branch: the chosen root is positive, not the other square root.
example : positiveRootLift 2 (fun _ : Fin 1 => (1 / 4 : ℝ)) 0 ≠ -1 / 2 := by
  sorry

/-- Coherent roots give the exact exterior boundary zero in the root field.
    The integral class is then supplied by K3BlochGroups:V.3/cgz-bloch-group. -/
theorem coherentRootBoundary {K : Type*} [Field K]
    (d : ℕ) (M : Matrix (Fin n) (Fin n) ℤ) (hM : ∀ i j, M i j = M j i)
    (y t : Fin n → Kˣ) (ht : ∀ i, (t i : K) = 1 - (y i : K) ^ d)
    (heq : ∀ i, t i = ∏ j, y j ^ M i j) :
    ∑ i, exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (y i ^ d), Additive.ofMul (t i)] = 0 := by
  sorry

/-- The diagonal signs in GSWZ (41) leave a genuine possible 2-torsion boundary.
    Read the inner product variable as z_i, correcting the printed z_j (E36). -/
theorem signedBoundaryObstruction {K : Type*} [Field K]
    (M : Matrix (Fin n) (Fin n) ℤ) (hM : ∀ i j, M i j = M j i)
    (z t : Fin n → Kˣ) (ht : ∀ i, (t i : K) = 1 - (z i : K))
    (heq : ∀ i, t i = (-1 : Kˣ) ^ M i i * ∏ j, z j ^ M i j) :
    (∑ i, exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (z i), Additive.ofMul (t i)]) =
      ∑ i, M i i • exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (z i), Additive.ofMul (-1 : Kˣ)] ∧
    (2 : ℕ) • (∑ i, exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (z i), Additive.ofMul (t i)]) = 0 := by
  sorry

/-
regulatorConventionComparison (exact mathematical interface; missing supplier types):
Let F=Q(x), E=Q(y) be the finite fields in positiveRootLift, A=M/d symmetric,
and c_d the integral CGZ class represented by d sum[x_i] in F. Let beta be
the integral class represented by sum[x_i] in E (coherentRootBoundary).
Then the image of c_d equals d beta, so the rationalized F class c_d/d maps
to beta. For every embedding tau:E→C, the Bloch-Wigner value of beta is
sum_i D(tau(x_i)), equal to the value at tau restricted to F of c_d/d.
All embeddings of F extend to E. If beta maps to zero over Qbar, each
embedding E→C extends across Qbar/E, so every regulator value is zero.
Consequently, using the imported Borel
criterion, c_d/d=0 iff beta is torsion iff beta maps to zero over Qbar.
At the preferred real embedding, L_CGZ(x)=pi²/6-L_std(x), with period pi²/2;
L(0)=pi²/6, L(1)=0, L(infinity)=-pi²/6. The circle-valued map is applied
to beta or c_d, never Q-linearly extended. Torsion of c_d implies
sum_i L_CGZ(x_i)∈Q pi². A=(1/2), (1), (2) give respectively
pi²/10, pi²/12, pi²/15. These require the Rogers API requested from
Polylogarithms:P.1, regulator injectivity from BorelRegulators:R.4 and
unique divisibility from K3BlochGroups:V.4. No such types are invented here.
The signed GSWZ integral class requires the separate V.3 convention request;
signedBoundaryObstruction supplies only twice the class in the CGZ kernel.
-/

end TauCeti.Nahm

end AssemblyHB3

/-! ## HB.4: reviewed refinements -/

noncomputable section AssemblyHB4
open scoped BigOperators Topology
open Filter Asymptotics MeasureTheory

namespace TauCeti.Nahm.Radial

variable {N : ℕ}

namespace Expressions

-- Parent HB.4/q-pochhammer-symbols, finite quantum factorial convention.
def qFinite (q : ℂ) (n : ℕ) : ℂ := ∏ j ∈ Finset.range n, (1 - q ^ (j + 1))

def quadratic (A : Matrix (Fin N) (Fin N) ℝ) (x : Fin N → ℝ) : ℝ :=
  ∑ i, ∑ j, x i * A i j * x j

-- Parent HB.4/analytic-nahm-sum, restricted to real data for estimates.
def Qreal (A : Matrix (Fin N) (Fin N) ℝ) (B : Fin N → ℝ) (C : ℝ)
    (n : Fin N → ℕ) : ℝ :=
  quadratic A (fun i ↦ (n i : ℝ)) / 2 + (∑ i, B i * n i) + C

def phaseFreeTerm (A : Matrix (Fin N) (Fin N) ℝ) (B : Fin N → ℝ)
    (C : ℝ) (ζ : ℂ) (m : ℕ) (ε : ℝ) (n : Fin N → ℕ) : ℂ :=
  (Real.exp (-ε * Qreal A B C n / m) : ℂ) /
    ∏ i, qFinite (ζ * (Real.exp (-ε / m) : ℂ)) (n i)

def nahmFunction (A : Matrix (Fin N) (Fin N) ℝ) (B : Fin N → ℝ)
    (C : ℝ) (τ : ℂ) : ℂ :=
  ∑' n : Fin N → ℕ,
    Complex.exp (2 * Real.pi * Complex.I * τ * (Qreal A B C n : ℂ)) /
      ∏ i, qFinite (Complex.exp (2 * Real.pi * Complex.I * τ)) (n i)

-- Polylogarithms:P.1/classical-polylogarithm, real value on [0,1].
def li2Real (x : ℝ) : ℝ := ∑' k : ℕ, x ^ (k + 1) / (k + 1 : ℝ) ^ 2

def growth (z : Fin N → ℝ) : ℝ :=
  N * Real.pi ^ 2 / 6 - (∑ i, li2Real (z i)) -
    (∑ i, Real.log (z i) * Real.log (1 - z i)) / 2

def hessian (A : Matrix (Fin N) (Fin N) ℝ) (z : Fin N → ℝ) :
    Matrix (Fin N) (Fin N) ℝ :=
  A + Matrix.diagonal (fun i ↦ z i / (1 - z i))

def deviation (z : Fin N → ℝ) (ε : ℝ) (n : Fin N → ℕ) (i : Fin N) : ℝ :=
  Real.sqrt ε * ((n i : ℝ) + Real.log (z i) / ε)

def sqSize (x : Fin N → ℝ) : ℝ := ∑ i, x i ^ 2

-- Parent Bernoulli/polylogarithm log-product interface, explicit finite truncation.
def liSeries (r : ℤ) (w : ℂ) : ℂ :=
  ∑' l : ℕ, w ^ (l + 1) * (l + 1 : ℂ) ^ (-r)

def logProduct (ζ : ℂ) (m : ℕ) (w : ℂ) (ν ε : ℝ) : ℂ :=
  ∑' j : ℕ, Complex.log (1 - ζ ^ (j + 1) * w *
    (Real.exp (-((j + 1 : ℝ) + ν) * ε / m) : ℂ))

def bernoulliTrunc (ζ : ℂ) (m : ℕ) (w : ℂ) (ν ε : ℝ) (J : ℕ) : ℂ :=
  - ∑ r ∈ Finset.range (J + 1), ∑ t ∈ Finset.range m,
    (Polynomial.bernoulli r).eval₂ (algebraMap ℚ ℂ)
        (1 - (((t + 1 : ℕ) : ℂ) + (ν : ℂ)) / (m : ℂ)) *
      liSeries (2 - (r : ℤ)) (ζ ^ (t + 1) * w) *
      (ε : ℂ) ^ ((r : ℤ) - 1) / (r.factorial : ℂ)

end Expressions

open Expressions

/-- New construction: coherent coefficient base Q(z_i^(1/d),ζ). -/
def radialBaseField (d : ℕ) (z : Fin N → ℝ) (ζ : ℂ) : IntermediateField ℚ ℂ := by
  sorry

/-- New construction: Q(z_i^(1/d),ζ,z_i^(1/(dm))). -/
def radialKummerField (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    IntermediateField ℚ ℂ := by
  sorry

-- These characterizations pin the construction to the existing field API.
lemma radialBaseField_eq_adjoin (d : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    radialBaseField d z ζ = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (Real.rpow (z i) (1 / (d : ℝ)) : ℂ)) ∪ {ζ}) := by
  sorry

lemma radialKummerField_eq_adjoin (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    radialKummerField d m z ζ = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (Real.rpow (z i) (1 / (d : ℝ)) : ℂ)) ∪ {ζ} ∪
        Set.range (fun i ↦ (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ))) := by
  sorry

-- The projection and compatibility part of the packet API.
lemma radialBaseField.root_mem (d : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    (∀ i, (Real.rpow (z i) (1 / (d : ℝ)) : ℂ) ∈ radialBaseField d z ζ) ∧
      ζ ∈ radialBaseField d z ζ := by
  sorry

lemma radialKummerField.base_le (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ) :
    radialBaseField d z ζ ≤ radialKummerField d m z ζ := by
  sorry

lemma radialKummerField.radical_mem (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ) (i : Fin N) :
    (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) ∈
      radialKummerField d m z ζ := by
  sorry

lemma radialKummerField.theta_mem (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (ζ : ℂ) (i : Fin N) :
    (Real.rpow (z i) (1 / (m : ℝ)) : ℂ) ∈ radialKummerField d m z ζ := by
  sorry

lemma radialKummerField.eq_theta_adjoin (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (hcop : Nat.Coprime d m) (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (ζ : ℂ) :
    radialKummerField d m z ζ = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (Real.rpow (z i) (1 / (d : ℝ)) : ℂ)) ∪ {ζ} ∪
        Set.range (fun i ↦ (Real.rpow (z i) (1 / (m : ℝ)) : ℂ))) := by
  sorry

-- Minimality permits using the fields without unfolding either construction.
lemma radialBaseField_le_iff (d : ℕ) (z : Fin N → ℝ) (ζ : ℂ)
    (L : IntermediateField ℚ ℂ) :
    radialBaseField d z ζ ≤ L ↔
      (∀ i, (Real.rpow (z i) (1 / (d : ℝ)) : ℂ) ∈ L) ∧ ζ ∈ L := by
  sorry

lemma radialKummerField_le_iff (d m : ℕ) (z : Fin N → ℝ) (ζ : ℂ)
    (L : IntermediateField ℚ ℂ) :
    radialKummerField d m z ζ ≤ L ↔ radialBaseField d z ζ ≤ L ∧
      ∀ i, (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) ∈ L := by
  sorry

lemma radialKummerField.radical_pow (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (i : Fin N) :
    (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) ^ m =
        (Real.rpow (z i) (1 / (d : ℝ)) : ℂ) ∧
      (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) ^ d =
        (Real.rpow (z i) (1 / (m : ℝ)) : ℂ) := by
  sorry

lemma radialKummerField.finite_galois (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (ζ : ℂ) (hζ : IsPrimitiveRoot ζ m) :
    let E := radialBaseField d z ζ
    let H := radialKummerField d m z ζ
    letI : Algebra E H :=
      (IntermediateField.inclusion (radialKummerField.base_le d m z ζ)).toRingHom.toAlgebra
    FiniteDimensional E H ∧ IsGalois E H := by
  sorry

lemma radialKummerField.automorphism_radical (d m : ℕ) (hd : 0 < d) (hm : 0 < m)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i) (ζ : ℂ) (hζ : IsPrimitiveRoot ζ m)
    (σ : radialKummerField d m z ζ ≃+* radialKummerField d m z ζ)
    (hfix : ∀ x : radialKummerField d m z ζ,
      (x : ℂ) ∈ radialBaseField d z ζ → σ x = x) :
    ∀ (i : Fin N) (x : radialKummerField d m z ζ),
      (x : ℂ) = (Real.rpow (z i) (1 / ((d * m : ℕ) : ℝ)) : ℂ) →
      ∃ s : Fin m, (σ x : ℂ) = ζ ^ (s : ℕ) * (x : ℂ) := by
  sorry

-- radialFields_order_one (degenerate).
example (d : ℕ) (hd : 0 < d) (z : Fin N → ℝ) :
    radialKummerField d 1 z 1 = radialBaseField d z 1 := by
  sorry

-- radialFields_integral_case (compatibility).
example (z : Fin N → ℝ) :
    radialBaseField 1 z 1 = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (z i : ℂ))) ∧
    radialKummerField 1 1 z 1 = IntermediateField.adjoin ℚ
      (Set.range (fun i ↦ (z i : ℂ))) := by
  sorry

-- radialFields_trivial_coordinates (computation).
example (d m : ℕ) (hd : 0 < d) (hm : 0 < m) (ζ : ℂ) :
    radialBaseField d (fun _ : Fin N ↦ 1) ζ = IntermediateField.adjoin ℚ {ζ} ∧
    radialKummerField d m (fun _ : Fin N ↦ 1) ζ = IntermediateField.adjoin ℚ {ζ} := by
  sorry

-- radialFields_nontrivial_radical (non-example).
example :
    radialBaseField 2 (fun _ : Fin 1 ↦ (1 / 4 : ℝ))
        (Complex.exp (2 * Real.pi * Complex.I / 3)) <
      radialKummerField 2 3 (fun _ : Fin 1 ↦ (1 / 4 : ℝ))
        (Complex.exp (2 * Real.pi * Complex.I / 3)) := by
  sorry

-- analytic-convergence-and-branch-comparison: product component.
theorem analytic_product_convergence (w q : ℂ) (hq : ‖q‖ < 1) :
    Multipliable (fun j : ℕ ↦ 1 - w * q ^ j) ∧
      ((∏' j : ℕ, (1 - w * q ^ j)) ≠ 0 ↔ ∀ j : ℕ, 1 - w * q ^ j ≠ 0) := by
  sorry

theorem analytic_nahm_convergence (A : Matrix (Fin N) (Fin N) ℝ) (hA : A.PosDef)
    (B : Fin N → ℝ) (C : ℝ) (τ : ℂ) (hτ : 0 < τ.im) :
    Summable (fun n : Fin N → ℕ ↦
      Complex.exp (2 * Real.pi * Complex.I * τ * (Qreal A B C n : ℂ)) /
        ∏ i, qFinite (Complex.exp (2 * Real.pi * Complex.I * τ)) (n i)) := by
  sorry

theorem analytic_nahm_holomorphic (A : Matrix (Fin N) (Fin N) ℝ) (hA : A.PosDef)
    (B : Fin N → ℝ) (C : ℝ) :
    DifferentiableOn ℂ (nahmFunction A B C) {τ : ℂ | 0 < τ.im} := by
  sorry

theorem nahm_C_shift (A : Matrix (Fin N) (Fin N) ℝ) (B : Fin N → ℝ)
    (C : ℝ) (τ : ℂ) :
    nahmFunction A B C τ = Complex.exp (2 * Real.pi * Complex.I * C * τ) *
      nahmFunction A B 0 τ := by
  sorry

-- compact-pochhammer-remainder: the guard keeps every factor away from zero.
theorem compact_pochhammer_remainder (m : ℕ) (hm : 0 < m) (ζ : ℂ)
    (hζ : IsPrimitiveRoot ζ m) (ρ : ℝ) (hρ : 0 < ρ) (hρ1 : ρ < 1)
    (J : ℕ) (hJ : 1 ≤ J) :
    ∃ C ε₀ : ℝ, 0 < C ∧ 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ →
      ∀ (w : ℂ) (ν : ℝ), ‖w‖ ≤ ρ → |ν| * ε / m ≤ -Real.log ρ / 2 →
        ‖logProduct ζ m w ν ε - bernoulliTrunc ζ m w ν ε J‖ ≤
          C / ε * (ε * (1 + |ν|)) ^ (J + 1) := by
  sorry

-- finite-product-modulus-estimate: its all-n statement includes n=0.
theorem finite_product_modulus_estimate (m : ℕ) (hm : 0 < m) (ζ : ℂ)
    (hζ : IsPrimitiveRoot ζ m) :
    ∃ C ε₀ : ℝ, 0 < C ∧ 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ → ∀ n : ℕ,
      |Real.log ‖qFinite (ζ * (Real.exp (-ε / m) : ℂ)) n‖ -
          (li2Real (Real.exp (-ε * n)) - Real.pi ^ 2 / 6) / (m * ε)| ≤
        C * (1 + |Real.log ε|) := by
  sorry

-- saddlepoint-global-domination: actual concrete Nahm equations are hypotheses.
theorem saddlepoint_global_domination (A : Matrix (Fin N) (Fin N) ℝ)
    (hA : A.PosDef) (B : Fin N → ℝ) (C : ℝ) (z : Fin N → ℝ)
    (hz : ∀ i, 0 < z i ∧ z i < 1)
    (hNahm : ∀ i, 1 - z i = ∏ j, Real.rpow (z j) (A i j))
    (m : ℕ) (hm : 0 < m) (ζ : ℂ) (hζ : IsPrimitiveRoot ζ m) :
    (hessian A z).PosDef ∧ 0 < Matrix.det (hessian A z) ∧
    ∃ c M L ε₀ : ℝ, 0 < c ∧ 0 < M ∧ 0 < L ∧ 0 < ε₀ ∧
      ∀ ε : ℝ, 0 < ε → ε < ε₀ → ∀ n : Fin N → ℕ,
        ‖(Real.exp (-growth z / (m * ε)) : ℂ) * phaseFreeTerm A B C ζ m ε n‖ ≤
          M * Real.rpow ε (-L) * Real.exp (-c * sqSize (deviation z ε n)) := by
  sorry

-- poisson-covolume-comparison: uniform in the lattice shift, absolute error.
theorem poisson_covolume_comparison (H : Matrix (Fin N) (Fin N) ℝ) (hH : H.PosDef)
    (m : ℕ) (hm : 0 < m) (P : MvPolynomial (Fin N) ℂ) (K : ℕ) :
    ∃ C ε₀ : ℝ, 0 < C ∧ 0 < ε₀ ∧ ∀ ε : ℝ, 0 < ε → ε < ε₀ →
      ∀ b : Fin N → ℝ,
        ‖((m : ℝ) * Real.sqrt ε) ^ N *
            (∑' v : Fin N → ℤ,
              MvPolynomial.eval (fun i ↦ ((b i + m * Real.sqrt ε * v i : ℝ) : ℂ)) P *
                (Real.exp (-quadratic H (fun i ↦ b i + m * Real.sqrt ε * v i) /
                  (2 * m)) : ℂ)) -
          (∫ x : Fin N → ℝ, MvPolynomial.eval (fun i ↦ (x i : ℂ)) P *
            (Real.exp (-quadratic H x / (2 * m)) : ℂ))‖ ≤ C * ε ^ K := by
  sorry

-- The parent CRT subsums have concrete signatures even before its carrier API exists.
theorem cancellation_safe_congruence_remainder (A : Matrix (Fin N) (Fin N) ℚ)
    (hA : (A.map (fun x ↦ (x : ℝ))).PosDef) (B : Fin N → ℚ)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i ∧ z i < 1)
    (hNahm : ∀ i, 1 - z i = ∏ j, Real.rpow (z j) (A i j : ℝ))
    (d m D : ℕ) (hd : 0 < d) (hm : 0 < m) (hD : 0 < D)
    (hodd : Odd m) (hcop : Nat.Coprime m D) (hdD : d ∣ D)
    (hden : ∀ v : Fin N → ℤ,
      ∃ r : ℤ, (d : ℚ) * ((∑ i, ∑ j, (v i : ℚ) * A i j * v j) / 2 +
        ∑ i, B i * v i) = r)
    (ζ : ℂ) (hζ : IsPrimitiveRoot ζ m)
    (k : Fin N → Fin m) (k' : Fin N → Fin D) (K : ℕ) :
    (fun ε : ℝ ↦ (Real.exp (-growth z / (m * ε)) : ℂ) *
      ((∑' n : Fin N → ℕ,
          if (∀ i, n i % m = (k i : ℕ)) ∧ (∀ i, n i % D = (k' i : ℕ)) then
            phaseFreeTerm (A.map (fun x ↦ (x : ℝ))) (fun i ↦ (B i : ℝ)) 0 ζ m ε n
          else 0) - (D : ℂ)⁻¹ ^ N *
        (∑' n : Fin N → ℕ,
          if ∀ i, n i % m = (k i : ℕ) then
            phaseFreeTerm (A.map (fun x ↦ (x : ℝ))) (fun i ↦ (B i : ℝ)) 0 ζ m ε n
          else 0))) =O[𝓝[>] (0 : ℝ)] (fun ε : ℝ ↦ ε ^ K) := by
  sorry

-- radial-analytic-remainder-comparison: existence part of the analytic target.
-- The exact chi*c*G*S coefficient identification is specified below, rather
-- than replacing the missing formal Gaussian series by unconstrained data.
theorem radial_analytic_remainder (A : Matrix (Fin N) (Fin N) ℚ)
    (hA : (A.map (fun x ↦ (x : ℝ))).PosDef) (B : Fin N → ℚ)
    (z : Fin N → ℝ) (hz : ∀ i, 0 < z i ∧ z i < 1)
    (hNahm : ∀ i, 1 - z i = ∏ j, Real.rpow (z j) (A i j : ℝ))
    (d m : ℕ) (hd : 0 < d) (hm : 0 < m) (hodd : Odd m)
    (hcop : Nat.Coprime d m)
    (hden : ∀ v : Fin N → ℤ,
      ∃ r : ℤ, (d : ℚ) * ((∑ i, ∑ j, (v i : ℚ) * A i j * v j) / 2 +
        ∑ i, B i * v i) = r)
    (a : ℤ) (hprim : IsPrimitiveRoot (Complex.exp (2 * Real.pi * Complex.I * a / m)) m) :
    ∃ c : ℕ → ℂ, ∀ K : ℕ,
      (fun ε : ℝ ↦ (Real.exp (-growth z / (m * ε)) : ℂ) *
        nahmFunction (A.map (fun x ↦ (x : ℝ))) (fun i ↦ (B i : ℝ)) 0
          ((a : ℂ) / m + Complex.I * (ε : ℂ) / (2 * Real.pi * m)) -
        ∑ j ∈ Finset.range K, c j * (ε : ℂ) ^ j) =O[𝓝[>] (0 : ℝ)]
          (fun ε : ℝ ↦ ε ^ K) := by
  sorry

-- nonzero-unit-series-descent-comparison: coefficientwise root recursion.
theorem nonzero_unit_series_descent (K : IntermediateField ℚ ℂ) (m : ℕ) (hm : 0 < m)
    (Φ : PowerSeries ℂ) (hΦ : PowerSeries.coeff 0 Φ ≠ 0)
    (hpow : ∀ j, PowerSeries.coeff j (Φ ^ m) ∈ K) :
    ∀ j, PowerSeries.coeff j
      (PowerSeries.C (PowerSeries.coeff 0 Φ)⁻¹ * Φ) ∈ K := by
  sorry

-- Concrete analytic acceptance cases.
example : 1 - (Real.sqrt 5 - 1) / 2 = ((Real.sqrt 5 - 1) / 2) ^ 2 := by
  sorry

example :
    (fun ε : ℝ ↦ (Real.exp (-Real.pi ^ 2 / (15 * ε)) : ℂ) *
      nahmFunction (fun _ _ : Fin 1 ↦ 2) (fun _ ↦ 0) 0
        (Complex.I * (ε : ℂ) / (2 * Real.pi)) -
      ((Real.rpow ((2 + ((Real.sqrt 5 - 1) / 2) /
          (1 - (Real.sqrt 5 - 1) / 2)) * (1 - (Real.sqrt 5 - 1) / 2)) (-1 / 2) : ℂ) *
        (1 - (ε : ℂ) / 60))) =O[𝓝[>] (0 : ℝ)] (fun ε : ℝ ↦ ε ^ 2) := by
  sorry

/-!
Remaining named interfaces; their unavailable supplier types are not replaced.

compact-pochhammer-remainder / compact_pochhammer_remainder:
For |w|<=rho<1, |nu|epsilon/m<=-log(rho)/2, the r<=J Bernoulli
log-product truncation has error <=C epsilon^(-1)[epsilon(1+|nu|)]^(J+1).
The factorwise logs and the parent psi supply the truncation function.

uniform-local-saddle-remainder / uniform_local_saddle_remainder:
R_k(x,t)=exp[-B.x*t/m-(C+N/24)t^2/m+sum_i psi_i(x_i/t,t^2)].
Its t^p coefficient has degree<=3p and parity p. On |x_i|<=epsilon^(-1/12),
J=12(K+1), P=4(K+1) give an absolute polynomial-Gaussian error whose
lattice-scaled sum is O(epsilon^K); odd p vanishes under the parent bracket.

cancellation-safe-congruence-remainder / cancellation_safe_congruence_remainder:
The signature above states the flat difference for the concrete restricted tsums.
Its estimate is independent of the strong-denominator phase used later in CRT;
the full congruence carrier and Gauss-sum API remain the parent's construction.

radial-analytic-remainder-comparison / radial_analytic_remainder:
The coefficients in the existence signature above equal those of
chi^N m^(-N/2)c(Q)G(Q,a/m)S(Q,zeta,epsilon), with the exact corrected
integrand and factorwise-log root convention in the reader. Multiplying by
exp(2*pi*i*a*C/m)exp(-C epsilon/m) gives the general C statement.

coefficientwise-kummer-descent-interface / coefficientwise_kummer_descent:
With E=Q(y,zeta), H_rad=E(eta), eta_i=z_i^(1/(dm)), theta_i=eta_i^d,
C(theta)=product_i D_zeta(zeta theta_i), prove coefficientwise
sigma(C(theta)^(-1)T(eta,epsilon)^m)=C(theta)^(-1)T(eta,epsilon)^m
for every actual E-automorphism. sigma(eta_i)=zeta^s_i eta_i and
sigma(theta_i)=zeta^(d*s_i)theta_i. This is the recorded proof gap; the
source states descent but does not prove this formal Gaussian identity.

cgz-normalization-and-field-comparison / cgz_normalization_and_field_comparison:
omega=m^(-N/2)det(H)^(-1/2)product(1-z_i)^(1/2)>0;
Phi=G product(theta_i^B_i (1-z_i)^(-1/m))S; mu=chi^N.
Then the radial formula is mu*omega*exp(Lambda/(m epsilon))*(Phi+O).
Conditional on the missing automorphism identity, Phi^m has coefficients
in Q(y,zeta,zeta_D). The constant near-unit class and eigenspace need the
exact arithmetic compatibility described in the packet: F_G=Q(y,zeta_D),
K=F_G(zeta), H_G=K(eta), and the cyclotomic character of Aut_{F_G}(K).
The constant class is formed in H_G^*/H_G^{*m}; its descended class, when
proved, must be in the inverse-character eigenspace of K^*/K^{*m}.

nonzero-unit-series-descent-comparison / nonzero_unit_series_descent:
The compiled signature states the recursion component. Given the actual
near-unit representative epsilon_beta and a compatible root with
root(epsilon_beta)*Phi_0 in K, its product with Phi also has coefficients
in K. The nonzero constant, representative and arithmetic supplier
conditions, including gcd(m,w_F)=1 for the base F before adjoining zeta
(F=F_G in the Gauss-enlarged application), must all be retained.

andrews-gordon-owner-and-acceptance-comparison / andrews_gordon_owner_comparison:
For odd n=2r+3, A_ij=2min(i,j), B=0, import the existing QM.0 identities:
product classes exclude 0,±(r+1) mod n. The positive solution has coordinates
1-[sin(pi/n)/sin(pi*j/n)]^2 for j=2,...,r+1, in that order.
The Rogers supplier gives Lambda=(n-3)pi^2/(6n). The parent supplies the
radial constant exp(2*pi*i*(n/24-1/8+1/(12n)-1/(4n^2))).
These q-series and Rogers objects are not redefined here.
-/

end TauCeti.Nahm.Radial

end AssemblyHB4

section PartHB5

/-!
# HB.5a–HB.5: modular functions at the cusps and the Nahm implication (checker B)

This is not the roadmap and is not exhaustive; the packet is definitive. Only Mathlib is
imported. Objects owned by other nodes (Nahm sums, the Rogers dilogarithm, the CGZ Bloch group)
appear as local stand-ins in the shape HB.5 uses, each tied to the HB.3–HB.4 declaration above by
a bridge lemma. Every body is `sorry`.
-/

noncomputable section

open UpperHalfPlane Complex Filter Asymptotics Matrix.SpecialLinearGroup OnePoint
open scoped MatrixGroups ModularForm Topology Real Pointwise Manifold

namespace HabiroNahmSeries.HB5


/-! ## HB.5a/finite-index-subgroups -/

-- HB.5a/finite-index-subgroups: a comparison node; Mathlib's `Subgroup.FiniteIndex`,
-- `Subgroup.isArithmetic_iff_finiteIndex`, `Subgroup.index_inf_le`, `CongruenceSubgroup.instFiniteIndexGamma`
-- and `Subgroup.exists_pow_mem_of_index_ne_zero` are used as they are, and nothing new is stated.

/-! ## HB.5a/cusps-and-scaling-matrices (Mathlib supplies cusps, `isCusp_SL2Z_iff'`, finiteness) -/

/-- For coprime `b d`, an element of `SL(2, ℤ)` with first column `(b, d)`. -/
def scalingMatrixOfCoprime {b d : ℤ} (h : IsCoprime b d) : SL(2, ℤ) := sorry

theorem scalingMatrixOfCoprime_zero_zero {b d : ℤ} (h : IsCoprime b d) :
    scalingMatrixOfCoprime h 0 0 = b := sorry

theorem scalingMatrixOfCoprime_one_zero {b d : ℤ} (h : IsCoprime b d) :
    scalingMatrixOfCoprime h 1 0 = d := sorry

/-- Two scaling matrices of the same cusp differ by `±T^k`. -/
theorem eq_mul_T_zpow_of_smul_infty_eq {g g' : SL(2, ℤ)}
    (h : mapGL ℝ g • (∞ : OnePoint ℝ) = mapGL ℝ g' • (∞ : OnePoint ℝ)) :
    ∃ k : ℤ, g' = g * ModularGroup.T ^ k ∨ g' = -(g * ModularGroup.T ^ k) := sorry

-- test `S_smul_infty` (computation)
example : mapGL ℝ ModularGroup.S • (∞ : OnePoint ℝ) = ((0 : ℝ) : OnePoint ℝ) := sorry

-- test `card_cuspOrbits_Gamma_two` (computation)
example : Nat.card (CuspOrbits
    ((CongruenceSubgroup.Gamma 2 : Subgroup SL(2, ℤ)) : Subgroup (GL (Fin 2) ℝ))) = 3 := sorry

-- test `scalingMatrix_not_unique` (non-example)
example : mapGL ℝ ModularGroup.T • (∞ : OnePoint ℝ) = mapGL ℝ (1 : SL(2, ℤ)) • (∞ : OnePoint ℝ) ∧
    ModularGroup.T ≠ 1 := sorry


theorem scalingMatrixOfCoprime_smul_infty {b d : ℤ} (h : IsCoprime b d) (hd : d ≠ 0) :
    mapGL ℝ (scalingMatrixOfCoprime h) • (∞ : OnePoint ℝ) = (((b : ℝ) / d : ℝ) : OnePoint ℝ) := sorry

/-- In weight zero, `(f ∣ g (±T^k))(τ) = (f ∣ g)(τ + k)`. -/
theorem slash_mul_T_zpow_weight_zero (f : ℍ → ℂ) (g : SL(2, ℤ)) (k : ℤ) (τ : ℍ) :
    (f ∣[(0 : ℤ)] (g * ModularGroup.T ^ k)) τ = (f ∣[(0 : ℤ)] g) ((ModularGroup.T ^ k) • τ) ∧
      (f ∣[(0 : ℤ)] (g * -(ModularGroup.T ^ k))) τ = (f ∣[(0 : ℤ)] g) ((ModularGroup.T ^ k) • τ) :=
  sorry

-- test `one_smul_infty` (degenerate)
example : mapGL ℝ (1 : SL(2, ℤ)) • (∞ : OnePoint ℝ) = ∞ := sorry

-- test `scalingMatrix_two_five` (computation)
example : ∃ g : SL(2, ℤ), (g : Matrix (Fin 2) (Fin 2) ℤ) = !![2, 1; 5, 3] ∧
    mapGL ℝ g • (∞ : OnePoint ℝ) = (((2 : ℝ) / 5 : ℝ) : OnePoint ℝ) := sorry

/-! ## HB.5a/cusp-width -/

theorem exists_cuspWidth (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (g : SL(2, ℤ)) :
    ∃ n : ℕ, 0 < n ∧
      (g * ModularGroup.T ^ n * g⁻¹ ∈ Γ ∨ -(g * ModularGroup.T ^ n * g⁻¹) ∈ Γ) := sorry

open Classical in
/-- The classical width of `Γ` at the cusp `g • ∞`. -/
def cuspWidth (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (g : SL(2, ℤ)) : ℕ :=
  Nat.find (exists_cuspWidth Γ g)

section Width

variable (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (g : SL(2, ℤ))

theorem cuspWidth_pos : 0 < cuspWidth Γ g := sorry

theorem cuspWidth_spec (n : ℕ) :
    cuspWidth Γ g ∣ n ↔
      (g * ModularGroup.T ^ n * g⁻¹ ∈ Γ ∨ -(g * ModularGroup.T ^ n * g⁻¹) ∈ Γ) := sorry

@[simp] theorem cuspWidth_mul_T_zpow (k : ℤ) :
    cuspWidth Γ (g * ModularGroup.T ^ k) = cuspWidth Γ g := sorry

@[simp] theorem cuspWidth_neg : cuspWidth Γ (-g) = cuspWidth Γ g := sorry

theorem cuspWidth_mem_mul {γ : SL(2, ℤ)} (hγ : γ ∈ Γ) :
    cuspWidth Γ (γ * g) = cuspWidth Γ g := sorry

/-- Compatibility with Mathlib's classical width at `∞` of the conjugate group `g⁻¹ Γ g`. -/
theorem cuspWidth_eq_widthInfty :
    (cuspWidth Γ g : ℝ) =
      (ConjAct.toConjAct (mapGL ℝ g)⁻¹ • (Γ : Subgroup (GL (Fin 2) ℝ))).widthInfty := sorry

/-- The strict width (Mathlib's `strictWidthInfty` of the conjugate, Tau Ceti's orbit width)
is the classical width or twice it. -/
theorem strictWidth_eq_cuspWidth_or_two_mul :
    (ConjAct.toConjAct (mapGL ℝ g)⁻¹ • (Γ : Subgroup (GL (Fin 2) ℝ))).strictWidthInfty
        = cuspWidth Γ g ∨
      (ConjAct.toConjAct (mapGL ℝ g)⁻¹ • (Γ : Subgroup (GL (Fin 2) ℝ))).strictWidthInfty
        = 2 * cuspWidth Γ g := sorry

end Width

-- test `cuspWidth_top` (degenerate)
example (g : SL(2, ℤ)) : cuspWidth ⊤ g = 1 := sorry

-- test `cuspWidth_Gamma` (computation)
example (N : ℕ) [NeZero N] (g : SL(2, ℤ)) : cuspWidth (CongruenceSubgroup.Gamma N) g = N := sorry

-- test `cuspWidth_Gamma0_prime` (computation)
example (p : ℕ) [NeZero p] (hp : p.Prime) :
    cuspWidth (CongruenceSubgroup.Gamma0 p) 1 = 1 ∧
      cuspWidth (CongruenceSubgroup.Gamma0 p) ModularGroup.S = p := sorry

-- test `sum_cuspWidth_Gamma_three_ne_index` (non-example): four cusps of width 3, index 24
example : (CongruenceSubgroup.Gamma 3).index = 24 ∧
    Nat.card (CuspOrbits
      ((CongruenceSubgroup.Gamma 3 : Subgroup SL(2, ℤ)) : Subgroup (GL (Fin 2) ℝ))) = 4 ∧
    ∀ g : SL(2, ℤ), cuspWidth (CongruenceSubgroup.Gamma 3) g = 3 := sorry


-- sum_cuspWidth_eq_index_adjoinNegOne: not stated; it needs a scaling matrix for each element of Mathlib's
-- `CuspOrbits`, and the pinned API gives the orbits without a representative map.

-- test `cuspWidth_eq_widthInfty_Gamma0` (compatibility)
example (N : ℕ) [NeZero N] : cuspWidth (CongruenceSubgroup.Gamma0 N) 1 = 1 := sorry

/-! ## HB.5a/modular-function-of-finite-index -/

/-- Weight-zero `Γ`-invariant functions, meromorphic on `ℍ` and at every cusp. -/
structure ModularFunction (Γ : Subgroup SL(2, ℤ)) where
  toFun : ℍ → ℂ
  slash_eq' : ∀ γ ∈ Γ, toFun ∣[(0 : ℤ)] γ = toFun
  meromorphicOn' : MeromorphicOn (toFun ∘ ofComplex) {z : ℂ | 0 < z.im}
  meromorphicAt_cusp' : ∀ (g : SL(2, ℤ)) (h : ℝ), 0 < h →
    Function.Periodic ((toFun ∣[(0 : ℤ)] g) ∘ ofComplex) h →
    MeromorphicAt (Function.Periodic.cuspFunction h ((toFun ∣[(0 : ℤ)] g) ∘ ofComplex)) 0

namespace ModularFunction

variable {Γ : Subgroup SL(2, ℤ)}

instance : FunLike (ModularFunction Γ) ℍ ℂ where
  coe f := f.toFun
  coe_injective f g h := by cases f; cases g; congr

@[ext] theorem ext {f g : ModularFunction Γ} (h : ∀ τ, f τ = g τ) : f = g := sorry

theorem slash_eq (f : ModularFunction Γ) {γ : SL(2, ℤ)} (hγ : γ ∈ Γ) :
    (⇑f) ∣[(0 : ℤ)] γ = ⇑f := sorry

/-- The constant modular function. -/
def const (Γ : Subgroup SL(2, ℤ)) (c : ℂ) : ModularFunction Γ := sorry

-- test `ModularFunction.const_apply` (computation)
@[simp] theorem const_apply (c : ℂ) (τ : ℍ) : const Γ c τ = c := sorry

instance instCommRing : CommRing (ModularFunction Γ) := sorry

instance : Algebra ℂ (ModularFunction Γ) := sorry

/-- The coercion to functions is an injective `ℂ`-algebra map (the modular functions are NOT a
field in this representation). -/
def coeAlgHom : ModularFunction Γ →ₐ[ℂ] (ℍ → ℂ) := sorry

theorem coeAlgHom_injective : Function.Injective (coeAlgHom (Γ := Γ)) := sorry

/-- A modular function for `Γ` is one for every subgroup of `Γ`. -/
def restrict {Γ' : Subgroup SL(2, ℤ)} (h : Γ' ≤ Γ) (f : ModularFunction Γ) :
    ModularFunction Γ' := sorry

/-- Weight-zero Mathlib modular forms are modular functions. -/
def ofModularForm (f : ModularForm (Γ : Subgroup (GL (Fin 2) ℝ)) 0) : ModularFunction Γ :=
  sorry

theorem meromorphicAt_cuspFunction (f : ModularFunction Γ) (g : SL(2, ℤ)) {h : ℝ}
    (hh : 0 < h) (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h) :
    MeromorphicAt (Function.Periodic.cuspFunction h (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex)) 0 :=
  sorry

theorem eq_const_of_holomorphic_of_bounded [Γ.FiniteIndex] (f : ModularFunction Γ)
    (hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) (⇑f))
    (hb : ∀ c : OnePoint ℝ, IsCusp c (Γ : Subgroup (GL (Fin 2) ℝ)) → OnePoint.IsBoundedAt c (⇑f) 0) :
    ∃ c : ℂ, f = const Γ c := sorry

/-- `f ∘ ofComplex` is meromorphic on the open upper half-plane. -/
theorem meromorphicOn (f : ModularFunction Γ) :
    MeromorphicOn (⇑f ∘ ofComplex) {z : ℂ | 0 < z.im} := sorry

/-- Meromorphy at `0` of the cusp function for one period gives it for every period. -/
theorem meromorphicAt_cuspFunction_iff_of_period (f : ModularFunction Γ) (g : SL(2, ℤ)) {h h' : ℝ}
    (hh : 0 < h) (hh' : 0 < h')
    (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h)
    (hper' : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h') :
    MeromorphicAt (Function.Periodic.cuspFunction h (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex)) 0 ↔
      MeromorphicAt (Function.Periodic.cuspFunction h' (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex)) 0 := sorry

-- test `ofModularForm_const` (characterisation)
example [Γ.FiniteIndex] (f : ModularForm (Γ : Subgroup (GL (Fin 2) ℝ)) 0) :
    ∃ c : ℂ, ofModularForm f = const Γ c := sorry

end ModularFunction

/-- `j = E₄³ / Δ` from Mathlib's `ModularForm.E₄` and `ModularForm.discriminant`. -/
def jInvariant (τ : ℍ) : ℂ := (ModularForm.E₄ τ) ^ 3 / ModularForm.discriminant τ

def jModularFunction : ModularFunction (⊤ : Subgroup SL(2, ℤ)) := sorry

theorem coe_jModularFunction : ⇑jModularFunction = jInvariant := sorry

-- test `inv_jInvariant_modularFunction` (characterisation): poles in `ℍ` are allowed
example : ∃ f : ModularFunction (⊤ : Subgroup SL(2, ℤ)),
    ⇑f = (fun τ ↦ (jInvariant τ)⁻¹) ∧ ¬ MDifferentiable 𝓘(ℂ) 𝓘(ℂ) (⇑f) := sorry

-- test `exp_jInvariant_not_modularFunction` (non-example): essential singularity at `∞`
example : ¬ ∃ f : ModularFunction (⊤ : Subgroup SL(2, ℤ)),
    ⇑f = fun τ ↦ Complex.exp (jInvariant τ) := sorry


-- test `jInvariant_modularFunction` (computation): `jModularFunction` with `coe_jModularFunction` above,
-- and its order `-1` and leading coefficient `1` at `∞` are the test `orderAtCusp_jInvariant` below.

/-! ## HB.5a/laurent-expansion-at-a-cusp -/

/-- The order at the cusp `g • ∞`, read in the period `h`. -/
def orderAtCusp (f : ℍ → ℂ) (g : SL(2, ℤ)) (h : ℝ) : WithTop ℤ :=
  meromorphicOrderAt (Function.Periodic.cuspFunction h ((f ∣[(0 : ℤ)] g) ∘ ofComplex)) 0

/-- The leading Laurent coefficient at the cusp `g • ∞`, read in the period `h`. -/
def leadingCoeffAtCusp (f : ℍ → ℂ) (g : SL(2, ℤ)) (h : ℝ) : ℂ :=
  meromorphicTrailingCoeffAt (Function.Periodic.cuspFunction h ((f ∣[(0 : ℤ)] g) ∘ ofComplex)) 0

theorem orderAtCusp_eq_top_iff {Γ : Subgroup SL(2, ℤ)} (f : ModularFunction Γ)
    (g : SL(2, ℤ)) {h : ℝ} (hh : 0 < h)
    (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h) :
    orderAtCusp f g h = ⊤ ↔ ∀ᶠ τ in atImInfty, ((⇑f) ∣[(0 : ℤ)] g) τ = 0 := sorry

theorem leadingCoeffAtCusp_ne_zero {Γ : Subgroup SL(2, ℤ)} (f : ModularFunction Γ)
    (g : SL(2, ℤ)) {h : ℝ} (hh : 0 < h)
    (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h)
    (hne : orderAtCusp f g h ≠ ⊤) : leadingCoeffAtCusp f g h ≠ 0 := sorry

theorem orderAtCusp_mul_period {Γ : Subgroup SL(2, ℤ)} (f : ModularFunction Γ)
    (g : SL(2, ℤ)) {h : ℝ} (hh : 0 < h)
    (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h) (m : ℕ) (hm : 0 < m) :
    orderAtCusp f g (m * h) = (m : WithTop ℤ) * orderAtCusp f g h := sorry

@[simp] theorem orderAtCusp_mul_T_zpow (f : ℍ → ℂ) (g : SL(2, ℤ)) (h : ℝ) (k : ℤ) :
    orderAtCusp f (g * ModularGroup.T ^ k) h = orderAtCusp f g h := sorry

-- test `orderAtCusp_zero` (degenerate)
example (g : SL(2, ℤ)) (h : ℝ) : orderAtCusp 0 g h = ⊤ ∧ leadingCoeffAtCusp 0 g h = 0 := sorry

-- test `orderAtCusp_jInvariant` (computation)
example : orderAtCusp jInvariant 1 1 = ((-1 : ℤ) : WithTop ℤ) ∧
    leadingCoeffAtCusp jInvariant 1 1 = 1 := sorry

-- test `orderAtCusp_two_mul` (characterisation): the rate order/period is period-independent
example : orderAtCusp jInvariant 1 2 = ((-2 : ℤ) : WithTop ℤ) := sorry


theorem tendsto_leadingCoeffAtCusp {Γ : Subgroup SL(2, ℤ)} (f : ModularFunction Γ) (g : SL(2, ℤ))
    {h : ℝ} (hh : 0 < h) (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h)
    {n₀ : ℤ} (hn₀ : orderAtCusp f g h = n₀) :
    Tendsto (fun τ : ℍ ↦ Function.Periodic.qParam h τ ^ (-n₀) * ((⇑f) ∣[(0 : ℤ)] g) τ) atImInfty
      (𝓝 (leadingCoeffAtCusp f g h)) := sorry

theorem orderAtCusp_mul {Γ : Subgroup SL(2, ℤ)} (f f' : ModularFunction Γ) (g : SL(2, ℤ)) {h : ℝ}
    (hh : 0 < h) (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h)
    (hper' : Function.Periodic (((⇑f') ∣[(0 : ℤ)] g) ∘ ofComplex) h) :
    orderAtCusp (fun τ ↦ f τ * f' τ) g h = orderAtCusp f g h + orderAtCusp f' g h ∧
      leadingCoeffAtCusp (fun τ ↦ f τ * f' τ) g h = leadingCoeffAtCusp f g h * leadingCoeffAtCusp f' g h :=
  sorry

-- test `orderAtCusp_const` (computation)
example (c : ℂ) (hc : c ≠ 0) (g : SL(2, ℤ)) {h : ℝ} (hh : 0 < h) :
    orderAtCusp (fun _ ↦ c) g h = 0 ∧ leadingCoeffAtCusp (fun _ ↦ c) g h = c := sorry

-- Test orderAtCusp_eq_tauceti: not stated; it compares with Tau Ceti's `qExpansionOrderAtCusp`, and this
-- file imports Mathlib only.

/-! ## HB.5a/local-parameter-and-laurent-expansion -/

/-- `f ∣ g = F ∘ q_h` near `i∞` with `F(q) = qⁿ⁰ G(q)`, `G` analytic at `0`, `G(0) = a_{g,h}(f)`. -/
theorem ModularFunction.eq_qParam_zpow_mul {Γ : Subgroup SL(2, ℤ)} (f : ModularFunction Γ)
    (g : SL(2, ℤ)) {h : ℝ} (hh : 0 < h) (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h)
    {n₀ : ℤ} (hn₀ : orderAtCusp f g h = n₀) :
    ∃ G : ℂ → ℂ, AnalyticAt ℂ G 0 ∧ G 0 = leadingCoeffAtCusp f g h ∧
      ∀ᶠ τ in atImInfty, ((⇑f) ∣[(0 : ℤ)] g) τ =
        Function.Periodic.qParam h τ ^ n₀ * G (Function.Periodic.qParam h τ) := sorry

/-! ## HB.5a/radial-growth-at-a-cusp -/

/-- Uniform growth at a cusp (along `atImInfty`, i.e. uniformly in `Re τ`). -/
theorem ModularFunction.isBigO_sub_leading {Γ : Subgroup SL(2, ℤ)} (f : ModularFunction Γ)
    (g : SL(2, ℤ)) {h : ℝ} (hh : 0 < h)
    (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h)
    {n₀ : ℤ} (hn₀ : orderAtCusp f g h = n₀) :
    (fun τ : ℍ ↦ ((⇑f) ∣[(0 : ℤ)] g) τ -
        leadingCoeffAtCusp f g h * Function.Periodic.qParam h (τ : ℂ) ^ n₀)
      =O[atImInfty] fun τ ↦ Real.exp (-2 * π * (n₀ + 1) * τ.im / h) := sorry

/-- Radial growth at the finite cusp `b/d`, `g = (b β; d δ)`: rate `-2π n₀/(h d² y)`, phase
`e(-n₀ δ/(d h))`. -/
theorem ModularFunction.tendsto_radial {Γ : Subgroup SL(2, ℤ)} (f : ModularFunction Γ)
    (g : SL(2, ℤ)) (hd : 0 < g 1 0) {h : ℝ} (hh : 0 < h)
    (hper : Function.Periodic (((⇑f) ∣[(0 : ℤ)] g) ∘ ofComplex) h)
    {n₀ : ℤ} (hn₀ : orderAtCusp f g h = n₀) :
    Tendsto (fun y : ℝ ↦ f (ofComplex ((g 0 0 : ℂ) / (g 1 0 : ℂ) + y * Complex.I)) /
        (Complex.exp (-2 * π * Complex.I * n₀ * (g 1 1 : ℂ) / ((g 1 0 : ℂ) * h)) *
          Real.exp (-2 * π * n₀ / (h * (g 1 0 : ℝ) ^ 2 * y))))
      (𝓝[>] 0) (𝓝 (leadingCoeffAtCusp f g h)) := sorry

/-! ## HB.5a/supplier-interface -/

/-- CGZ's transport identity, as an identity of complex numbers. -/
theorem transport_identity (a b c d : ℤ) (hdet : a * d - b * c = 1) (hd : d ≠ 0) (h : ℝ) :
    let ħ : ℂ := ((h / (2 * π) : ℝ) : ℂ)
    let ε : ℂ := d * h / (1 - Complex.I * c * ħ)
    let w : ℂ := Complex.I * ε / (2 * π)
    (a * w + b) / (c * w + d) = (b + Complex.I * ħ) / d := sorry

theorem re_inv_transportParam (c d : ℤ) (hd : 0 < d) {h : ℝ} (hh : 0 < h) :
    (1 / ((d : ℂ) * h / (1 - Complex.I * c * ((h / (2 * π) : ℝ) : ℂ)))).re = 1 / (d * h) := sorry

theorem isCoprime_lowerRight_of_mem_Gamma {M : ℕ} {γ : SL(2, ℤ)}
    (hγ : γ ∈ CongruenceSubgroup.Gamma M) : IsCoprime (γ 1 1) (M : ℤ) := sorry

theorem infinite_lowerRight_of_finiteIndex (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (M : ℕ)
    [NeZero M] :
    {d : ℕ | 0 < d ∧ ∃ γ ∈ Γ ⊓ CongruenceSubgroup.Gamma M,
      γ 1 1 = d ∨ γ 1 1 = -(d : ℤ)}.Infinite := sorry

/-! ## HB.5 — stand-ins for HB.3/HB.4 objects in the shape HB.5 uses (bridge lemmas below) -/

/-- Stand-in for `HB.4/q-pochhammer-symbols`: `(q; q)_n`. -/
abbrev qFactorial (q : ℂ) (n : ℕ) : ℂ := HB34.qPochhammerFin q q n

/-- `Q(n) = ½ nᵀAn + Bn + C`. -/
def nahmQ {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ) (n : Fin r → ℕ) : ℚ :=
  (1 / 2 : ℚ) * ∑ i, ∑ j, (n i : ℚ) * A i j * n j + ∑ i, B i * n i + C

/-- Stand-in for `HB.4/analytic-nahm-sum`: `τ ↦ f_{A,B,C}(e(τ))`. -/
def nahmSum {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ) (τ : ℍ) : ℂ :=
  ∑' n : Fin r → ℕ, Complex.exp (2 * π * Complex.I * (nahmQ A B C n : ℂ) * τ) /
    ∏ i, qFactorial (Complex.exp (2 * π * Complex.I * τ)) (n i)

/-- CGZ's "modular": invariance under a finite-index subgroup, nothing at the cusps. -/
def IsModularNahmSum {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ) : Prop :=
  ∃ Γ : Subgroup SL(2, ℤ), Γ.FiniteIndex ∧
    ∀ γ ∈ Γ, ∀ τ : ℍ, nahmSum A B C (γ • τ) = nahmSum A B C τ

/-- The Rogers dilogarithm in the CGZ normalisation on `(0, 1)` (`HB.3/embeddings-and-regulator-evaluations`). -/
abbrev rogersL : ℝ → ℝ := HB34.rogersCGZ

/-- Stand-in for `HB.3/distinguished-solution`. -/
def IsDistinguishedNahmSolution {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) (X : Fin r → ℝ) : Prop :=
  (∀ i, 0 < X i ∧ X i < 1) ∧ ∀ i, 1 - X i = ∏ j, X j ^ ((A i j : ℚ) : ℝ)

/-- `λ = L(ξ_A)/(4π²)`; `C₀(A) = -λ`. -/
def nahmLambda {r : ℕ} (X : Fin r → ℝ) : ℝ := (∑ i, rogersL (X i)) / (4 * π ^ 2)

/-- Bridge to HB.4: for an analytic Nahm datum the stand-in Nahm sum is `HB34.nahmSum`. -/
theorem nahmSum_eq_HB34 {r : ℕ} (P : HB34.NahmDatum r) (τ : ℍ) :
    nahmSum P.A P.B P.C τ = HB34.nahmSum P τ := sorry

/-- Bridge to HB.3: the distinguished solution of `HB.3/distinguished-solution` is distinguished here. -/
theorem isDistinguished_HB34 {r : ℕ} (P : HB34.NahmDatum r) :
    IsDistinguishedNahmSolution P.A (HB34.distinguishedSolution P.Areal P.posDef) := sorry

/-- Bridge to HB.4: `λ = Λ/(4π²)` with `Λ = HB34.nahmLambda`. -/
theorem nahmLambda_eq_HB34 {r : ℕ} (P : HB34.NahmDatum r) :
    nahmLambda (HB34.distinguishedSolution P.Areal P.posDef) = HB34.nahmLambda P / (4 * π ^ 2) := sorry

-- tests of HB.5/nahm-conjecture-statement (computation, degenerate)
example : rogersL (1 / 2) = π ^ 2 / 12 := sorry
example : rogersL ((Real.sqrt 5 - 1) / 2) = π ^ 2 / 15 := sorry
example : IsDistinguishedNahmSolution !![(2 : ℚ)] ![(Real.sqrt 5 - 1) / 2] := sorry
-- test `rank_one_lambda` (computation): `A = (2)` gives `λ = 1/60`
example : nahmLambda ![(Real.sqrt 5 - 1) / 2] = 1 / 60 := sorry
-- test `rank_zero` (degenerate)
example (C : ℚ) : IsModularNahmSum (r := 0) 0 0 C ↔ C = 0 := sorry

/-! ## HB.5/nahm-sum-meromorphic-at-every-cusp -/

theorem norm_nahmSum_le {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (hA : (A.map ((↑) : ℚ → ℝ)).PosDef) (τ : ℍ) :
    ‖nahmSum A B C τ‖ ≤ ‖nahmSum A B C (ofComplex ((τ.im : ℂ) * Complex.I))‖ := sorry

theorem exists_modularFunction_of_isModularNahmSum {r : ℕ} {A : Matrix (Fin r) (Fin r) ℚ}
    {B : Fin r → ℚ} {C : ℚ} (hA : (A.map ((↑) : ℚ → ℝ)).PosDef)
    (hmod : IsModularNahmSum A B C) :
    ∃ (Γ : Subgroup SL(2, ℤ)) (_ : Γ.FiniteIndex) (f : ModularFunction Γ),
      ⇑f = nahmSum A B C := sorry

/-! ## HB.5/expansion-at-one (uniform in the complex parameter) -/

theorem nahmLambda_rat_of_isModular {r : ℕ} {A : Matrix (Fin r) (Fin r) ℚ} {B : Fin r → ℚ}
    {C : ℚ} (hA : (A.map ((↑) : ℚ → ℝ)).PosDef) {X : Fin r → ℝ}
    (hX : IsDistinguishedNahmSolution A X) (hmod : IsModularNahmSum A B C) :
    ∃ q : ℚ, nahmLambda X = q := sorry

theorem nahmSum_expansion_at_one {r : ℕ} {A : Matrix (Fin r) (Fin r) ℚ} {B : Fin r → ℚ}
    {C : ℚ} (hA : (A.map ((↑) : ℚ → ℝ)).PosDef) {X : Fin r → ℝ}
    (hX : IsDistinguishedNahmSolution A X) (hmod : IsModularNahmSum A B C) :
    ∃ K : ℂ, K ≠ 0 ∧ ∃ κ : ℝ, 0 < κ ∧
      (fun ε : ℂ ↦ nahmSum A B C (ofComplex (Complex.I * ε / (2 * π))) *
          Complex.exp (-(4 * π ^ 2 * nahmLambda X : ℝ) / ε) - K)
        =O[Filter.comap (fun ε : ℂ ↦ (1 / ε).re) atTop]
          fun ε ↦ Real.exp (-κ * (1 / ε).re) := sorry

/-! ## HB.5/comparison-of-expansions (the corrected constant, abstracted from HB.4's `Φ`) -/

theorem comparison_constant {F : ℂ → ℂ} {K μ ω : ℂ} {Φ : ℝ → ℂ} {C lam : ℚ} {b c d : ℤ}
    (hd : 0 < d) (hμ : μ ≠ 0) (hω : ω ≠ 0)
    (h1 : Tendsto (fun h : ℝ ↦
        F ((d : ℂ) * h / (1 - Complex.I * c * ((h / (2 * π) : ℝ) : ℂ))) *
          Complex.exp (-((4 * π ^ 2 * lam : ℝ) : ℂ) /
            ((d : ℂ) * h / (1 - Complex.I * c * ((h / (2 * π) : ℝ) : ℂ))))) (𝓝[>] 0) (𝓝 K))
    (h2 : Tendsto (fun h : ℝ ↦
        F ((d : ℂ) * h / (1 - Complex.I * c * ((h / (2 * π) : ℝ) : ℂ))) *
          Complex.exp (-((4 * π ^ 2 * lam : ℝ) : ℂ) / ((d : ℂ) * h)) -
        Complex.exp (2 * π * Complex.I * (C : ℂ) * b / d) * μ * ω * Φ h) (𝓝[>] 0) (𝓝 0))
    (hΦ : ContinuousWithinAt Φ (Set.Ioi 0) 0) :
    Φ 0 = μ⁻¹ * ω⁻¹ * Complex.exp (-2 * π * Complex.I * (C : ℂ) * b / d) *
      Complex.exp (-2 * π * Complex.I * (lam : ℂ) * c / d) * K := sorry

/-! ## HB.5/torsion-from-unbounded-orders -/

theorem isOfFinAddOrder_of_infinite_dvd {G : Type*} [AddCommGroup G] [AddGroup.FG G] (x : G)
    (h : {n : ℕ | ∃ y : G, n • y = x}.Infinite) : IsOfFinAddOrder x := sorry

-- test (computation): in `ℤ` such an element is `0`
example (x : ℤ) (h : {n : ℕ | ∃ y : ℤ, n • y = x}.Infinite) : x = 0 := sorry
-- test (degenerate): every element of a finite group
example {G : Type*} [AddCommGroup G] [Finite G] (x : G) : IsOfFinAddOrder x := sorry
-- test (non-example): one `n` is not enough
example : (∃ y : ℤ, (1 : ℕ) • y = 1) ∧ ¬ IsOfFinAddOrder (1 : ℤ) := sorry

/-! ## HB.5 — stand-in for `K3BlochGroups:V.3/cgz-bloch-group` (`Option F` is `ℙ¹(F)`) -/

abbrev BlochChains (F : Type*) : Type _ := Option F →₀ ℤ

/-- `[X] ↦ X ∧ (1 - X)`, and `[0], [1], [∞] ↦ 0`. -/
def blochBoundary (F : Type*) [Field F] : BlochChains F →+ ⋀[ℤ]^2 (Additive Fˣ) := sorry

/-- The subgroup generated by the five-term elements `ξ_{X,Y}`. -/
def fiveTermRelations (F : Type*) [Field F] : AddSubgroup (BlochChains F) := sorry

abbrev CGZBlochGroup (F : Type*) [Field F] : Type _ :=
  (blochBoundary F).ker ⧸ (fiveTermRelations F).addSubgroupOf (blochBoundary F).ker

def CGZBlochGroup.map {F K : Type*} [Field F] [Field K] (σ : F →+* K) :
    CGZBlochGroup F →+ CGZBlochGroup K := sorry

/-! ## HB.5/torsion-criterion-for-the-cgz-bloch-group -/

theorem isOfFinAddOrder_of_infinite_odd_dvd {F : Type*} [Field F] [NumberField F]
    (x : CGZBlochGroup F) (h : {n : ℕ | Odd n ∧ ∃ y, n • y = x}.Infinite) :
    IsOfFinAddOrder x := sorry

/-! ## HB.5/excluded-primes-and-hypotheses -/

/-- `M = 2 D M_F` with `M_F` supplied by HabiroNumberFields HB.1/the-excluded-primes (here a
parameter): every admissible order is odd and prime to `D` and `M_F`. -/
theorem admissible_orders {D MF : ℕ} (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex]
    [NeZero (2 * D * MF)] :
    {d : ℕ | 0 < d ∧ ∃ γ ∈ Γ ⊓ CongruenceSubgroup.Gamma (2 * D * MF),
        γ 1 1 = d ∨ γ 1 1 = -(d : ℤ)}.Infinite ∧
      ∀ d : ℕ, (∃ γ ∈ Γ ⊓ CongruenceSubgroup.Gamma (2 * D * MF),
          γ 1 1 = d ∨ γ 1 1 = -(d : ℤ)) → Odd d ∧ Nat.Coprime d D ∧ Nat.Coprime d MF := sorry

/-! ## HB.5/modularity-implies-torsion (CGZ Theorem 7.5) and HB.5/introductory-formulation -/

abbrev nahmField {r : ℕ} (X : Fin r → ℝ) : IntermediateField ℚ ℝ :=
  IntermediateField.adjoin ℚ (Set.range X)

/-- Stand-in for `HB.3/bloch-class-of-a-solution` (denominators cleared for rational `A`). -/
def nahmBlochClass {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) (X : Fin r → ℝ)
    (hX : IsDistinguishedNahmSolution A X) : CGZBlochGroup (nahmField X) := sorry

theorem isOfFinAddOrder_nahmBlochClass_of_isModular {r : ℕ} {A : Matrix (Fin r) (Fin r) ℚ}
    (hA : (A.map ((↑) : ℚ → ℝ)).PosDef) {X : Fin r → ℝ} (hX : IsDistinguishedNahmSolution A X)
    {B : Fin r → ℚ} {C : ℚ} (hmod : IsModularNahmSum A B C) :
    IsOfFinAddOrder (nahmBlochClass A X hX) := sorry

theorem nahmBlochClass_map_eq_zero_of_isModular {r : ℕ} {A : Matrix (Fin r) (Fin r) ℚ}
    (hA : (A.map ((↑) : ℚ → ℝ)).PosDef) {X : Fin r → ℝ} (hX : IsDistinguishedNahmSolution A X)
    {B : Fin r → ℚ} {C : ℚ} (hmod : IsModularNahmSum A B C)
    (σ : nahmField X →+* AlgebraicClosure ℚ) :
    CGZBlochGroup.map σ (nahmBlochClass A X hX) = 0 := sorry


/-! ## HB.5/nahm-conjecture-statement (the three properties) -/

/-- (b): the class of the distinguished solution is torsion, i.e. vanishes in `B(ℚ̄)`. -/
def NahmProperty.b {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) : Prop :=
  ∀ (X : Fin r → ℝ) (hX : IsDistinguishedNahmSolution A X), IsOfFinAddOrder (nahmBlochClass A X hX)

/-- (c): some `f_{A,B,C}` is modular. -/
def NahmProperty.c {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) : Prop :=
  ∃ (B : Fin r → ℚ) (C : ℚ), IsModularNahmSum A B C

/-- The theorem of this layer (CGZ Theorem 7.5): (c) implies (b) for positive definite `A`. -/
theorem NahmConjecture.cImpB {r : ℕ} (A : Matrix (Fin r) (Fin r) ℚ) (hA : (A.map ((↑) : ℚ → ℝ)).PosDef) :
    NahmProperty.c A → NahmProperty.b A := sorry

/-- Zagier's matrix: (b) holds and (c) fails. -/
def NahmProperty.b_not_imp_c : Matrix (Fin 2) (Fin 2) ℚ := !![8, 5; 5, 4]

/-- The Vlasenko–Zwegers matrix: (c) holds and (a) fails. -/
def NahmProperty.c_not_imp_a : Matrix (Fin 2) (Fin 2) ℚ := !![3 / 2, 1 / 2; 1 / 2, 3 / 2]

-- Property (a) quantifies over every complex solution, whose classes live in `B(ℂ)` (K3BlochGroups V.3 over
-- `ℂ`); the stand-in here covers the distinguished real solution only:
-- NahmProperty.a: not stated; needs the Bloch class of every complex solution in `B(ℂ)`.
-- NahmProperty.a_imp_b: not stated; needs NahmProperty.a.
-- NahmConjecture.aImpC: not stated; a conjecture (CGZ §7.1), and it needs NahmProperty.a.
-- Test a_implies_b: not stated; needs NahmProperty.a.

-- test `rogers_ramanujan_all_three` (computation): (b) and (c) for `A = (2)`; (a) needs NahmProperty.a
example : NahmProperty.b !![(2 : ℚ)] ∧ NahmProperty.c !![(2 : ℚ)] := sorry

-- test `zagier_matrix_b_not_c` (non-example): the failure of (c) rests on Zagier's survey (gap)
example : NahmProperty.b NahmProperty.b_not_imp_c ∧ ¬ NahmProperty.c NahmProperty.b_not_imp_c := sorry

-- test `vlasenko_zwegers_c_not_a` (non-example): (c) holds; the failure of (a) needs NahmProperty.a
example : NahmProperty.c NahmProperty.c_not_imp_a := sorry

/-! ## HB.5/boundaries-of-the-implication -/

-- HB.5/boundaries-of-the-implication: records what is not proved (the converse, modular forms of non-zero
-- weight, the congruence property); no statement follows, so nothing is stated.

/-! ## HB.5/valuation-bound-at-every-cusp (restricted to the cusps the proof reaches) -/

theorem nahmSum_orderAtCusp_ge {r : ℕ} {A : Matrix (Fin r) (Fin r) ℚ} {B : Fin r → ℚ} {C : ℚ}
    (hA : (A.map ((↑) : ℚ → ℝ)).PosDef) {X : Fin r → ℝ} (hX : IsDistinguishedNahmSolution A X)
    (hmod : IsModularNahmSum A B C) {D : ℕ} (hD : ∀ n, ((D : ℚ) * nahmQ A B C n).den = 1)
    (g : SL(2, ℤ)) (hc : 0 < g 1 0) (hodd : Odd (g 1 0)) (hcop : IsCoprime (g 1 0) (D : ℤ))
    {h : ℕ} (hh : 0 < h)
    (hper : Function.Periodic ((nahmSum A B C ∣[(0 : ℤ)] g) ∘ ofComplex) h) :
    ((orderAtCusp (nahmSum A B C) g h).untop₀ : ℝ) / h ≥ -nahmLambda X := sorry

end HabiroNahmSeries.HB5

end

end PartHB5

/-! ## HB.5: reviewed refinements -/

noncomputable section AssemblyHB5

open scoped BigOperators
open Matrix

namespace TauCeti.Nahm.HB5

-- The polynomial Q from the existing analytic Nahm datum, written literally.
local notation "qval" => fun {r : ℕ}
  (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ) (x : Fin r → ℚ) =>
    (1 / 2 : ℚ) * (x ⬝ᵥ Matrix.mulVec A x) + (B ⬝ᵥ x) + C

-- Finite specializations (q;q)_N of the QM.0/q-pochhammer supplier.
local notation "pfin" => fun (q : ℝ) (N : ℕ) =>
  ∏ j ∈ Finset.range N, (1 - q ^ (j + 1))
local notation "pcfin" => fun (q : ℂ) (N : ℕ) =>
  ∏ j ∈ Finset.range N, (1 - q ^ (j + 1))

variable {r : ℕ}

/-- HB.5/residue-class-majorant. The analytic API requires positive t and A.
The definition is total, following the baseline real tsum convention. -/
noncomputable def residueMajorant
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) : ℝ := by
  sorry

lemma residueMajorant_eq_tsum
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) :
    residueMajorant A B C m t =
      ∑' n : Fin r → ℕ,
        Real.exp (-t * (qval A B C (fun i => (n i : ℚ)) : ℝ)) /
          ∏ i, pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (n i / (m : ℕ)) := by
  sorry

lemma residueMajorant_summable
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    Summable (fun n : Fin r → ℕ =>
      Real.exp (-t * (qval A B C (fun i => (n i : ℚ)) : ℝ)) /
        ∏ i, pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (n i / (m : ℕ))) := by
  sorry

lemma residueMajorant_pos
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    0 < residueMajorant A B C m t := by
  sorry

lemma residueMajorant_quadratic_split
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (ℓ : Fin r → ℕ) (s : Fin r → Fin (m : ℕ))
    (hA : A.transpose = A) :
    qval A B C (fun i => ((m : ℕ) : ℚ) * (ℓ i : ℚ) + ((s i : ℕ) : ℚ)) =
      ((m : ℕ) : ℚ) ^ 2 *
        qval A
          (fun i => (A.mulVec (fun j => ((s j : ℕ) : ℚ)) i + B i) / ((m : ℕ) : ℚ))
          0 (fun i => (ℓ i : ℚ)) +
      qval A B C (fun i => ((s i : ℕ) : ℚ)) := by
  sorry

-- Every shifted f on the right is its literal positive real Nahm series.
lemma residueMajorant_split
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    residueMajorant A B C m t =
      ∑ s : Fin r → Fin (m : ℕ),
        Real.exp (-t * (qval A B C (fun i => ((s i : ℕ) : ℚ)) : ℝ)) *
          ∑' ℓ : Fin r → ℕ,
            Real.exp (-((m : ℕ) : ℝ) ^ 2 * t *
              (qval A
                (fun i => (A.mulVec (fun j => ((s j : ℕ) : ℚ)) i + B i) /
                  ((m : ℕ) : ℚ))
                0 (fun i => (ℓ i : ℚ)) : ℝ)) /
              ∏ i, pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (ℓ i) := by
  sorry

lemma residueMajorant_order_one
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    residueMajorant A B C 1 t =
      ∑' n : Fin r → ℕ,
        Real.exp (-t * (qval A B C (fun i => (n i : ℚ)) : ℝ)) /
          ∏ i, pfin (Real.exp (-t)) (n i) := by
  sorry

lemma residueMajorant_rank_zero
    (A : Matrix (Fin 0) (Fin 0) ℚ) (B : Fin 0 → ℚ) (C : ℚ)
    (m : ℕ+) (t : ℝ) :
    residueMajorant A B C m t = Real.exp (-t * (C : ℝ)) := by
  sorry

lemma residueMajorant_shift_constant
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C u : ℚ)
    (m : ℕ+) (t : ℝ) (hA : A.PosDef) (ht : 0 < t) :
    residueMajorant A B (C + u) m t =
      Real.exp (-t * (u : ℝ)) * residueMajorant A B C m t := by
  sorry

-- Test: majorant_rank_one_even_order. Distinguishes m² from m and both B-shifts.
example (t : ℝ) (ht : 0 < t) :
    residueMajorant (r := 1) (fun _ _ => 2) (fun _ => 1) (11 / 60) 2 t =
      Real.exp (-t * (11 / 60 : ℝ)) *
        (∑' ℓ : ℕ, Real.exp (-4 * t * ((ℓ : ℝ) ^ 2 + (ℓ : ℝ) / 2)) /
          pfin (Real.exp (-4 * t)) ℓ) +
      Real.exp (-t * (131 / 60 : ℝ)) *
        (∑' ℓ : ℕ, Real.exp (-4 * t * ((ℓ : ℝ) ^ 2 + 3 * (ℓ : ℝ) / 2)) /
          pfin (Real.exp (-4 * t)) ℓ) := by
  sorry

-- Test: majorant_empty_rank. The empty-rank construction retains C.
example :
    residueMajorant (r := 0) (fun _ _ => 0) (fun _ => 0) 7 2 (Real.log 2) =
      (1 / 128 : ℝ) := by
  sorry

-- Test: majorant_original_axis. Exact compatibility with the original series.
example (t : ℝ) (ht : 0 < t) :
    residueMajorant (r := 1) (fun _ _ => 2) (fun _ => 1) (11 / 60) 1 t =
      ∑' n : ℕ, Real.exp (-t * ((n : ℝ) ^ 2 + (n : ℝ) + 11 / 60)) /
        pfin (Real.exp (-t)) n := by
  sorry

-- Test: majorant_constant_shift. A nonzero q^C factor must survive.
example (t : ℝ) (ht : 0 < t) :
    residueMajorant (r := 1) (fun _ _ => 2) (fun _ => 1) (71 / 60) 2 t =
      Real.exp (-t) *
        residueMajorant (r := 1) (fun _ _ => 2) (fun _ => 1) (11 / 60) 2 t := by
  sorry

/-- HB.5/block-product-lower-bound; uniform in N,t and primitive ζ. -/
theorem rootProduct_lower_bound (m : ℕ+) :
    ∃ c : ℝ, 0 < c ∧
      ∀ ζ : ℂ, IsPrimitiveRoot ζ (m : ℕ) →
        ∀ t : ℝ, 0 < t → t ≤ 1 → ∀ N : ℕ,
          c * pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (N / (m : ℕ)) ≤
            ‖pcfin (ζ * (Real.exp (-t) : ℂ)) N‖ := by
  sorry

lemma rootProduct_order_one (t : ℝ) (ht : 0 < t) (N : ℕ) :
    ‖pcfin (Real.exp (-t) : ℂ) N‖ = pfin (Real.exp (-t)) N := by
  sorry

lemma rootProduct_order_two (t : ℝ) (ht : 0 < t) (N : ℕ) :
    pfin (Real.exp (-4 * t)) (N / 2) ≤ ‖pcfin (-(Real.exp (-t) : ℂ)) N‖ := by
  sorry

/-- The exact majorant inequality from HB.5/growth-at-all-roots-of-unity.
`hblock` is the concrete finite-product estimate, not an abstract analytic predicate.
The left side is the parent f(α+it/(2π)), written as its literal complex series. -/
lemma nahmRoot_le_majorant
    (A : Matrix (Fin r) (Fin r) ℚ) (B : Fin r → ℚ) (C : ℚ)
    (m : ℕ+) (α : ℚ) (t c : ℝ) (hA : A.PosDef) (ht : 0 < t) (hc : 0 < c)
    (hζ : IsPrimitiveRoot (Complex.exp (2 * (Real.pi : ℂ) * Complex.I * (α : ℂ)))
      (m : ℕ))
    (hblock : ∀ N : ℕ,
      c * pfin (Real.exp (-((m : ℕ) : ℝ) ^ 2 * t)) (N / (m : ℕ)) ≤
        ‖pcfin (Complex.exp (2 * (Real.pi : ℂ) * Complex.I * (α : ℂ) - (t : ℂ))) N‖) :
    ‖∑' n : Fin r → ℕ,
      Complex.exp ((2 * (Real.pi : ℂ) * Complex.I * (α : ℂ) - (t : ℂ)) *
        (qval A B C (fun i => (n i : ℚ)) : ℂ)) /
      ∏ i, pcfin
        (Complex.exp (2 * (Real.pi : ℂ) * Complex.I * (α : ℂ) - (t : ℂ))) (n i)‖ ≤
        c⁻¹ ^ r * residueMajorant A B C m t := by
  sorry

/-
Signatures omitted because their honest supplier carriers are absent at the baseline:

* nahmRoot_exponential_bound: the preceding majorant inequality is O(exp(Λ/(m²t)))
  at 0+, with Λ the parent complementary Rogers value of the distinguished solution.
  Needs the actual Rogers-value and distinguished-solution definitions, not a free Λ.

* nahm_cusp_valuation_lower_bound, nahm_cusp_zero_valuation,
  nahm_infinity_valuation: for the parent finite-index weight-zero modular function,
  normalized cusp valuation v_P is at least -Λ/(4π²), equals that at zero, and is
  min Q(n) at infinity. Requires the parent Laurent-expansion and width carriers.

* nahm_constant_kummer_class: take a strong denominator D divisible by 24 and the
  fixed E = F(X_i^(1/D), ζ_D). Write ν_a = e(r(n-1)(n-2)a/(24n)), the multiplier
  of published GZ (17), and μ_a = e(r s(a,n)/2). Use the rescaled series
  Φ_Ded = (ν_a/μ_a) Φ_GZ; its explicit Gauss/product/S formula carries this ratio.
  The ratio belongs to E_n, so its nth power changes no Kummer class.
  With the integral symbol η_E in this fixed extension E,
  the corrected nonzero constant u has [u^n]=R_ζ(η_E)^(-1) in E_n×/(E_n×)^n.
  Requires B_CGZ, R_ζ and the corrected HB.4 constant-term object; its coefficient
  and eigenspace inputs are the one explicit packet gap, not fields of a fake record.

* nahm_modular_constant_comparison, nahm_constant_fixed_power: u equals
  μ_b^(-1) ω_d^(-1) e(-Cb/d) e(-λc/d) K, and u^s belongs to F_d× for a fixed
  s divisible by 24, 2den(B), den(C), den(λ). Requires the actual expansion objects,
  Dedekind sum and embedded Nahm number field. Φ has the specified multiplier
  rescaling; Gauss phases remain inside it. The unrescaled GZ series uses ν_b.

* nahm_rational_bloch_bridge: bounded powers for an unbounded set of good n force
  the original rationalized ξ_F to be zero. Only η_E is reduced modulo n; apply
  good-order R injectivity, the parent CGZ/Suslin torsion criterion and extension
  of embeddings before descending through the regulator criterion. Torsion maps
  to zero by the lower HB.3 algebraically closed target result; the parent
  introductory-formulation is a consequence, not a proof prerequisite.

The parent named endpoints modularity-implies-torsion and introductory-formulation
retain ownership of the conclusions; they are not redeclared in this follow-up.
-/

end TauCeti.Nahm.HB5

end AssemblyHB5

section PartHB8

/-!
# HB.8: admissible series and formal Gaussian integration (checker C)

Proofs are `sorry`; a few data definitions whose construction is routine but long
(the Laurent expansion at a root of unity, the automorphism q ↦ q⁻¹, the Frobenius
q ↦ q^l on Laurent series) are also `sorry`. No statement is `True`, and no
`Prop` is defined as `sorry`.

Conventions. `Qq = ℚ(q) = RatFunc ℚ`; series in t = (t₀,…,t_{N-1}) are
`MvPowerSeries (Fin N) _`; multi-indices are `Fin N →₀ ℕ`. Expansions at a root of
unity ζ of order m are written in T = t^{1/m}: we substitute t ↦ T^m instead of
using fractional powers, so Φ_m(T^m, x) = F(T, ζ + x).
-/

noncomputable section

open scoped LaurentPolynomial RatFunc

namespace HabiroNahmSeries.HB8

/-! ### The formal ambient: ℚ(q), multi-indices, logarithm and exponential -/

/-- The field `ℚ(q)` in which GSWZ Definition 1.7 places the coefficients. -/
abbrev Qq : Type := RatFunc ℚ

/-- The indeterminate `q`. -/
def q : Qq := RatFunc.X

theorem q_ne_zero : q ≠ 0 := sorry

/-- Multi-indices `n ∈ ℕ^N`. -/
abbrev Idx (N : ℕ) : Type := Fin N →₀ ℕ

variable {N : ℕ}

/-- `L(q^l) ∈ ℚ(q)` for an integral Laurent polynomial `L`. -/
def evalQPow (L : ℤ[T;T⁻¹]) (l : ℕ) : Qq :=
  LaurentPolynomial.eval₂ (Int.castRingHom Qq) (Units.mk0 (q ^ l) (pow_ne_zero l q_ne_zero)) L

/-- Coordinatewise quotient `n / l` of a multi-index. -/
def Idx.divNat (n : Idx N) (l : ℕ) : Idx N := n.mapRange (· / l) (Nat.zero_div l)

/-- GSWZ (27): the series `-∑_{n ≠ 0} ∑_{l ≥ 1} L_n(q^l) t^{l n} / (l (1 - q^l))`;
its coefficient at `e` is the finite sum over the `l ≥ 1` dividing every `e i`. -/
def admissibleLog (L : Idx N → ℤ[T;T⁻¹]) : MvPowerSeries (Fin N) Qq :=
  fun e => -∑ l ∈ (Finset.Icc 1 (Finsupp.degree e)).filter (fun l => ∀ i, l ∣ e i),
    evalQPow (L (Idx.divNat e l)) l / ((l : Qq) * (1 - q ^ l))

/-- The formal logarithm `log (1 + (F - 1))`; meaningful when `constantCoeff F = 1`. -/
def mvLog {R : Type*} [CommRing R] [Algebra ℚ R] (F : MvPowerSeries (Fin N) R) :
    MvPowerSeries (Fin N) R :=
  PowerSeries.subst (F - 1) (PowerSeries.log ℚ)

/-- The formal exponential; meaningful when `constantCoeff G = 0`. -/
def mvExp {R : Type*} [CommRing R] [Algebra ℚ R] (G : MvPowerSeries (Fin N) R) :
    MvPowerSeries (Fin N) R :=
  PowerSeries.subst G (PowerSeries.exp ℚ)

/-- The automorphism `q ↦ q⁻¹` of `ℚ(q)`. -/
def qInv : Qq ≃ₐ[ℚ] Qq := sorry

theorem qInv_q : qInv q = q⁻¹ := sorry

/-- The shift `σ_j : t_j ↦ q t_j` (Mathlib's `MvPowerSeries.rescale`). -/
def shift (j : Fin N) : MvPowerSeries (Fin N) Qq →+* MvPowerSeries (Fin N) Qq :=
  MvPowerSeries.rescale (Function.update 1 j q)

/-! ### Formal Pochhammer symbol (new node `HB.8/formal-pochhammer-symbol`) -/

/-- The primitive `m`-th root of unity of `CyclotomicField m ℚ`: Mathlib's `IsCyclotomicExtension.zeta`, with
the instance `CyclotomicField.isCyclotomicExtension` passed explicitly (instance search does not find it at the
pinned commit). -/
def zetaQ (m : ℕ) [NeZero m] : CyclotomicField m ℚ :=
  @IsCyclotomicExtension.zeta m _ ℚ (CyclotomicField m ℚ) _ _ _ (CyclotomicField.isCyclotomicExtension m ℚ)

theorem zetaQ_spec (m : ℕ) [NeZero m] : IsPrimitiveRoot (zetaQ m) m :=
  @IsCyclotomicExtension.zeta_spec m _ ℚ (CyclotomicField m ℚ) _ _ _ (CyclotomicField.isCyclotomicExtension m ℚ)

/-- Euler's series `(x;q)_∞ = ∑_k (-1)^k q^{k(k-1)/2} x^k / (q;q)_k ∈ ℚ(q)[[x]]`. -/
def eulerPoch : PowerSeries Qq :=
  PowerSeries.mk fun k => (-1) ^ k * q ^ (k * (k - 1) / 2) / ∏ j ∈ Finset.range k, (1 - q ^ (j + 1))

/-- `(c t^n; q)_∞` for a coefficient `c` and a nonzero multi-index `n`. -/
def poch (c : Qq) (n : Idx N) : MvPowerSeries (Fin N) Qq :=
  PowerSeries.subst (MvPowerSeries.monomial n c) eulerPoch

theorem mvLog_poch (n : Idx N) (hn : n ≠ 0) :
    mvLog (poch 1 n) =
      fun e => -∑ l ∈ (Finset.Icc (1 : ℕ) (Finsupp.degree e)).filter (fun l => e = l • n),
        1 / (((l : ℕ) : Qq) * (1 - q ^ l)) := sorry

theorem poch_shift_one (j : Fin N) :
    (1 - MvPowerSeries.X j) * shift j (poch 1 (Finsupp.single j 1)) = poch 1 (Finsupp.single j 1) :=
  sorry

theorem map_qInv_poch (j : Fin N) :
    MvPowerSeries.map qInv.toRingHom (poch 1 (Finsupp.single j 1)) *
      poch q (Finsupp.single j 1) = 1 := sorry


-- poch_toLaurentSeries: not stated; its target is QSeriesPartitionsAndMockModularForms QM.0's product
-- `∏ⱼ (1 - qʲ x)` in `ℤ((q))⟦x⟧`, which this file does not import.

-- test `euler_coeff_two` (computation)
example : PowerSeries.coeff 2 eulerPoch = q / ((1 - q) * (1 - q ^ 2)) := sorry

-- test `log_formula` (characterisation): `mvLog_poch` above.

-- test `qinv_identity` (compatibility): `(x; q⁻¹)_∞ (qx; q)_∞ = 1`
example : MvPowerSeries.map qInv.toRingHom (poch (N := 1) 1 (Finsupp.single 0 1)) *
    poch (N := 1) q (Finsupp.single 0 1) = 1 := sorry

-- Test not_the_analytic_product: not stated; it concerns the divergence of `∏ⱼ (1 - q⁻ʲ x)` in `ℤ((q))⟦x⟧`,
-- whose topology is not set up in this file.

/-! ### Admissible series (node `HB.8/admissible-series`) -/

/-- GSWZ Definition 1.7. -/
def Admissible (F : MvPowerSeries (Fin N) Qq) : Prop :=
  MvPowerSeries.constantCoeff F = 1 ∧
    ∃ L : Idx N → ℤ[T;T⁻¹], L 0 = 0 ∧ mvLog F = admissibleLog L

/-- The Laurent polynomials `L_n` of an admissible series. -/
def Admissible.L {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) : Idx N → ℤ[T;T⁻¹] :=
  Classical.choose hF.2

theorem Admissible.mvLog_eq {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) :
    mvLog F = admissibleLog hF.L := sorry

theorem Admissible.L_unique {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F)
    (L : Idx N → ℤ[T;T⁻¹]) (h0 : L 0 = 0) (h : mvLog F = admissibleLog L) : L = hF.L := sorry

theorem admissible_one : Admissible (1 : MvPowerSeries (Fin N) Qq) := sorry

theorem Admissible.mul {F G : MvPowerSeries (Fin N) Qq} (hF : Admissible F)
    (hG : Admissible G) : Admissible (F * G) := sorry

theorem Admissible.L_mul {F G : MvPowerSeries (Fin N) Qq} (hF : Admissible F)
    (hG : Admissible G) : (hF.mul hG).L = hF.L + hG.L := sorry

theorem Admissible.inv {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) :
    Admissible F⁻¹ := sorry

/-- GSWZ (61): admissibility is invariant under `q ↦ q⁻¹`; `L_n` becomes `-q L_n(q⁻¹)`. -/
theorem Admissible.map_qInv {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) :
    Admissible (MvPowerSeries.map qInv.toRingHom F) := sorry

theorem Admissible.L_map_qInv {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) (n : Idx N) :
    hF.map_qInv.L n = -LaurentPolynomial.T 1 * LaurentPolynomial.invert (hF.L n) := sorry

/-- Admissibility is invariant under `σ_j`; `L_n` becomes `q^{n_j} L_n`. -/
theorem Admissible.shift {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) (j : Fin N) :
    Admissible (shift j F) := sorry

theorem admissible_poch (n : Idx N) (hn : n ≠ 0) : Admissible (poch 1 n) := sorry

-- unit test `pochhammer_admissible` (computation)
example : ∃ h : Admissible (poch (N := 1) 1 (Finsupp.single 0 1)),
    h.L = fun n => if n = Finsupp.single 0 1 then 1 else 0 := sorry

-- unit test `qinv_pochhammer` (computation): (t;q⁻¹)_∞ = 1/(qt;q)_∞ has L₁ = -q
example : ∃ h : Admissible (MvPowerSeries.map qInv.toRingHom (poch (N := 1) 1 (Finsupp.single 0 1))),
    h.L (Finsupp.single 0 1) = -LaurentPolynomial.T 1 := sorry

-- unit test `neg_t_not_admissible` (non-example): (-t;q)_∞ has L₂ = 1/(1+q)
example : ¬ Admissible (MvPowerSeries.rescale (fun _ => (-1 : Qq))
    (poch (N := 1) 1 (Finsupp.single 0 1))) := sorry

-- unit test `integral_exponents_not_admissible` (non-example): ∏_{i ≥ 0} (q^i t;q)_∞
example : ¬ Admissible (mvExp (N := 1) (fun e => -∑ l ∈ (Finset.Icc 1 (e 0)).filter
    (fun l => e = Finsupp.single 0 l), 1 / ((l : Qq) * (1 - q ^ l) ^ 2))) := sorry


-- test `product_admissible` (compatibility): `Admissible.L_mul` above.

/-! ### The product expansion over ℤ((q)) (node `HB.8/product-expansion-and-dt-exponents`) -/

/-- The Frobenius `q ↦ q^l` on Laurent series. -/
def lsFrob {R : Type*} [CommRing R] (l : ℕ) (hl : 0 < l) : LaurentSeries R →+* LaurentSeries R :=
  sorry

/-- `-∑_{n ≠ 0} ∑_{l ≥ 1} L_n(q^l) t^{l n} / (l (1 - q^l))` for Laurent-series `L_n`. -/
def admissibleLogLS (L : Idx N → LaurentSeries ℚ) : MvPowerSeries (Fin N) (LaurentSeries ℚ) :=
  fun e => -∑ l ∈ (Finset.Icc 1 (Finsupp.degree e)).filter (fun l => ∀ i, l ∣ e i),
    if hl : 0 < l then lsFrob l hl (L (Idx.divNat e l)) / ((l : LaurentSeries ℚ) *
      (1 - (HahnSeries.single (1 : ℤ) (1 : ℚ)) ^ l)) else 0

/-- The coefficient map `ℤ((q)) → ℚ((q))`. -/
def lsCast : LaurentSeries ℤ →+* LaurentSeries ℚ := sorry

/-- Existence and uniqueness of the generalised DT exponents (GSWZ (28), proof of Theorem 6,
first paragraph): `c_{n,·}` are the coefficients of `L_n ∈ ℤ((q))`; `c_{n,i} = 0` for `i ≪ 0`
is automatic because `L_n` is a Laurent series. -/
theorem exists_unique_dt_exponents (F : MvPowerSeries (Fin N) (LaurentSeries ℤ))
    (hF : MvPowerSeries.constantCoeff F = 1) :
    ∃! L : Idx N → LaurentSeries ℤ, L 0 = 0 ∧
      mvLog (MvPowerSeries.map lsCast F) = admissibleLogLS (fun n => lsCast (L n)) := sorry

/-- Admissibility is finite support of the DT exponents (GSWZ §1.6 after (28)). -/
theorem admissible_iff_finite_support (F : MvPowerSeries (Fin N) Qq)
    (hF : MvPowerSeries.constantCoeff F = 1) :
    Admissible F ↔ ∃ L : Idx N → LaurentSeries ℤ, L 0 = 0 ∧ (∀ n, (L n).support.Finite) ∧
      mvLog (MvPowerSeries.map (algebraMap Qq (LaurentSeries ℚ)) F) =
        admissibleLogLS (fun n => lsCast (L n)) := sorry

/-! ### Laurent expansion at a root of unity (new node `HB.8/laurent-expansion-at-a-root-of-unity`) -/

/-- `f(q) ↦ f(ζ + x) ∈ K((x))` for a field `K ⊇ ℚ` and `ζ ∈ K`. -/
def expandAt {K : Type*} [Field K] [Algebra ℚ K] (ζ : K) : Qq →+* LaurentSeries K := sorry

theorem expandAt_q {K : Type*} [Field K] [Algebra ℚ K] (ζ : K) :
    expandAt ζ q = HahnSeries.C ζ + HahnSeries.single 1 1 := sorry

theorem expandAt_injective {K : Type*} [Field K] [Algebra ℚ K] (ζ : K) :
    Function.Injective (expandAt ζ) := sorry

/-- `Φ_m(T^m, x) = F(T, ζ_m + x)`: the collection of GSWZ (30), in the variable `T = t^{1/m}`. -/
def admissibleExpansion (m : ℕ) [NeZero m] (F : MvPowerSeries (Fin N) Qq) :
    MvPowerSeries (Fin N) (LaurentSeries (CyclotomicField m ℚ)) :=
  MvPowerSeries.map (expandAt (zetaQ m)) F


-- expandAt_taylor: not stated; it compares with HabiroCyclotomicCompletions HC.3's Taylor map at `ζ`.

-- test `expand_one_sub_q_at_one` (computation): `E₁(1/(1 - q)) = -x⁻¹`
example : expandAt (1 : ℚ) (1 / (1 - q)) = -HahnSeries.single (-1) 1 := sorry

-- test `expand_polynomial` (computation): `E_ζ(q²) = ζ² + 2ζx + x²`
example {K : Type*} [Field K] [Algebra ℚ K] (ζ : K) :
    expandAt ζ (q ^ 2) = HahnSeries.C (ζ ^ 2) + HahnSeries.C (2 * ζ) * HahnSeries.single 1 1 +
      HahnSeries.single 2 1 := sorry

-- test `expand_injective` (characterisation): `expandAt_injective` above.

/-! ### Potential, discriminant and constants (node `HB.8/expansion-at-roots-of-unity`) -/

/-- The formal polylogarithm `Li_s(X) = ∑_{k ≥ 1} X^k / k^s` (P.1's `polylogSeries`). -/
def polylogSeries (s : ℤ) : PowerSeries ℚ :=
  PowerSeries.mk fun k => if k = 0 then 0 else ((k : ℚ) ^ s)⁻¹

/-- `Li_s(c t^n)` as a multivariable series. -/
def polylogAt {R : Type*} [CommRing R] [Algebra ℚ R] (s : ℤ) (c : R) (n : Idx N) :
    MvPowerSeries (Fin N) R :=
  PowerSeries.subst (MvPowerSeries.monomial n c) (polylogSeries s)

/-- `L_n(1)` and `L_n'(1)`. -/
def valOne (L : ℤ[T;T⁻¹]) : ℚ := LaurentPolynomial.eval₂ (Int.castRingHom ℚ) 1 L
def derivOne (L : ℤ[T;T⁻¹]) : ℚ := ∑ i ∈ L.coeff.support, (L.coeff i : ℚ) * i

/-- GSWZ (65): `V(t) = ∑_n L_n(1) Li₂(t^n)` (coefficientwise a finite sum). -/
def potential {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) : MvPowerSeries (Fin N) ℚ :=
  fun e => ∑ n ∈ (Finset.Iic e).filter (· ≠ 0), valOne (hF.L n) * MvPowerSeries.coeff e (polylogAt 2 1 n)

/-- GSWZ (66): `log δ(t) = ∑_n (L_n(1) - 2 L_n'(1)) Li₁(t^n)`. -/
def logDiscriminantSeries {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) :
    MvPowerSeries (Fin N) ℚ :=
  fun e => ∑ n ∈ (Finset.Iic e).filter (· ≠ 0),
    (valOne (hF.L n) - 2 * derivOne (hF.L n)) * MvPowerSeries.coeff e (polylogAt 1 1 n)

/-- GSWZ (67) WITH THE SIGN CORRECTED (first term `+ (m-1)/(2m)`), written in `T = t^{1/m}`:
`u_m(T^m) = (m-1)/(2m) ∑ L_n(1) Li₁(T^{mn}) + (1-m)/m ∑ L_n'(1) Li₁(T^{mn})
            - ∑_{j=1}^{m-1} ∑_n L_n(ζ^j)/(1-ζ^j) ∑_{k mod m} ζ^{-kj}/m Li₁(ζ^k T^n)`. -/
def logConstantSeries (m : ℕ) [NeZero m] {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) :
    MvPowerSeries (Fin N) (CyclotomicField m ℚ) := sorry

/-- Extraction of the `x^j` coefficient of every `t`-coefficient. -/
def coeffX {K : Type*} [Field K] (j : ℤ) (G : MvPowerSeries (Fin N) (LaurentSeries K)) :
    MvPowerSeries (Fin N) K :=
  fun e => (MvPowerSeries.coeff e G).coeff j

/-- `V(T^m)`: the substitution `t ↦ T^m` of a rational series into `K[[T]]`. -/
def substPow {K : Type*} [Field K] [Algebra ℚ K] (m : ℕ) (V : MvPowerSeries (Fin N) ℚ) :
    MvPowerSeries (Fin N) K :=
  MvPowerSeries.subst (fun i => (MvPowerSeries.X i : MvPowerSeries (Fin N) K) ^ m) V

/-- GSWZ Lemma 2.3, polar part: the `x^{-1}` coefficient of `log F(T, ζ_m + x)` is `ζ_m V(T^m)/m²`. -/
theorem admissibleExpansion_polar (m : ℕ) [NeZero m] {F : MvPowerSeries (Fin N) Qq}
    (hF : Admissible F) :
    coeffX (-1) (mvLog (admissibleExpansion m F)) =
      MvPowerSeries.C (zetaQ m /
        (m : CyclotomicField m ℚ) ^ 2) * substPow m (potential hF) := sorry

/-- GSWZ Lemma 2.3, constant term, with the CORRECTED `u_m` of `logConstantSeries`:
`V(T^m)/(2m²) - ½ log δ(T^m) + u_m(T)`. -/
theorem admissibleExpansion_constant (m : ℕ) [NeZero m] {F : MvPowerSeries (Fin N) Qq}
    (hF : Admissible F) :
    coeffX 0 (mvLog (admissibleExpansion m F)) =
      MvPowerSeries.C (1 / (2 * (m : CyclotomicField m ℚ) ^ 2)) * substPow m (potential hF) -
        MvPowerSeries.C (1 / 2 : CyclotomicField m ℚ) * substPow m (logDiscriminantSeries hF) +
        logConstantSeries m hF := sorry

/-- GSWZ Corollary 2.4(a): `V` determines the values `L_n(1)`. -/
theorem potential_inj_valOne {F G : MvPowerSeries (Fin N) Qq} (hF : Admissible F)
    (hG : Admissible G) : potential hF = potential hG ↔ ∀ n, valOne (hF.L n) = valOne (hG.L n) :=
  sorry

-- unit test `pochhammer_constant_m_two` (computation): for (t;q)_∞ and m = 2,
-- U₂ = (1 + t^{1/2})^{-1/2}, i.e. u₂(T) = -½ log(1+T); the printed (67) gives (1 - t^{1/2})^{1/2}.
example (h : Admissible (poch (N := 1) 1 (Finsupp.single 0 1))) :
    logConstantSeries 2 h = -(1 / 2 : CyclotomicField 2 ℚ) •
      mvLog (1 + MvPowerSeries.X 0) := sorry

-- unit test `same_potential_different_series` (non-example for "V determines F"):
example (h₁ : Admissible (poch (N := 1) 1 (Finsupp.single 0 1)))
    (h₂ : Admissible (poch (N := 1) q (Finsupp.single 0 1))) :
    potential h₁ = potential h₂ ∧ logDiscriminantSeries h₁ ≠ logDiscriminantSeries h₂ := sorry


/-- `Φ_m(0, x) = 1`. -/
theorem admissibleExpansion_zero (m : ℕ) [NeZero m] {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) :
    MvPowerSeries.constantCoeff (admissibleExpansion m F) = 1 := sorry

-- test `pochhammer_potential` (computation): for `(t;q)_∞` the potential is `Li₂(t)`
example (h : Admissible (poch (N := 1) 1 (Finsupp.single 0 1))) :
    potential h = polylogAt 2 (1 : ℚ) (Finsupp.single 0 1) := sorry

-- test `constant_term_one` (degenerate)
example (m : ℕ) [NeZero m] : admissibleExpansion m (1 : MvPowerSeries (Fin N) Qq) = 1 := sorry

-- Test polar_part_three: not stated separately; it is the case `A = (3)`, `m = 2` of
-- `admissibleExpansion_polar` above, and needs the coefficients `V = t + 5t²/4 + 28t³/9 + …` of `potential`.

/-! ### The Dwork quotient (node `HB.8/dwork-quotient-admissible`) -/

/-- `c ∈ K` is `p`-integral: a quotient of an algebraic integer by an integer prime to `p`. -/
def PIntegral {K : Type*} [Field K] [NumberField K] (p : ℕ) (c : K) : Prop :=
  ∃ a : NumberField.RingOfIntegers K, ∃ s : ℤ, ¬ (p : ℤ) ∣ s ∧ c = (a : K) / s

/-- The Frobenius `q ↦ q^p` of `ℚ(q)`. -/
def frobQ (p : ℕ) : Qq →+* Qq := sorry

/-- GSWZ Lemma 2.5 (75), in `T = t^{1/m}` and after multiplying by `x`: every coefficient of
`x · [log F(T^p, q^p) - p log F(T, q)]` at `q = ζ_m + x` lies in `p ℤ_(p)[ζ_m]`. -/
theorem Admissible.dwork (m p : ℕ) [NeZero m] [Fact p.Prime] (hmp : Nat.Coprime m p)
    {F : MvPowerSeries (Fin N) Qq} (hF : Admissible F) (e : Idx N) (j : ℤ) :
    ∃ c : CyclotomicField m ℚ, PIntegral p c ∧
      (MvPowerSeries.coeff e
        (MvPowerSeries.C (HahnSeries.single 1 1) *
          MvPowerSeries.map (expandAt (zetaQ m))
            (mvLog (MvPowerSeries.map (frobQ p)
                (MvPowerSeries.subst (fun i => (MvPowerSeries.X i : MvPowerSeries (Fin N) Qq) ^ p) F)) -
              (p : Qq) • mvLog F))).coeff j = p * c := sorry

-- acceptance `dwork_fails_p_dividing_m` (non-example): for F = (t;q)_∞, m = p = 2 the difference
-- has no pole at x = 0 but its coefficient 2/(1 - q) = 1/(1 - x/2) at t^{1/2} is not 2-integral.

/-! ### The series F_A (node `HB.8/series-F-A`) -/

/-- The diagonal pairing `diag(A)·n`. -/
def diagDot (A : Matrix (Fin N) (Fin N) ℤ) (n : Idx N) : ℤ := ∑ j, A j j * n j

/-- The quadratic form `nᵀ A n`. -/
def quadForm (A : Matrix (Fin N) (Fin N) ℤ) (n : Idx N) : ℤ := ∑ i, ∑ j, (n i : ℤ) * A i j * n j

/-- GSWZ (31). -/
def seriesFA (A : Matrix (Fin N) (Fin N) ℤ) : MvPowerSeries (Fin N) Qq := fun n =>
  (-1) ^ (diagDot A n).natAbs * q ^ ((quadForm A n + diagDot A n) / 2) /
    ∏ j, ∏ r ∈ Finset.range (n j), (1 - q ^ (r + 1))

theorem seriesFA_constantCoeff (A : Matrix (Fin N) (Fin N) ℤ) :
    MvPowerSeries.constantCoeff (seriesFA A) = 1 := sorry

theorem even_quadForm_add_diagDot (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (n : Idx N) :
    Even (quadForm A n + diagDot A n) := sorry

/-- GSWZ (33). -/
theorem seriesFA_qdiff (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (j : Fin N) :
    seriesFA A - shift j (seriesFA A) =
      MvPowerSeries.C ((-1) ^ (A j j).natAbs * q ^ (A j j)) * MvPowerSeries.X j *
        MvPowerSeries.rescale (fun i => q ^ (A i j)) (seriesFA A) := sorry

theorem seriesFA_unique (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (G : MvPowerSeries (Fin N) Qq) (h0 : MvPowerSeries.constantCoeff G = 1)
    (h : ∀ j, G - shift j G = MvPowerSeries.C ((-1) ^ (A j j).natAbs * q ^ (A j j)) *
      MvPowerSeries.X j * MvPowerSeries.rescale (fun i => q ^ (A i j)) G) :
    G = seriesFA A := sorry

/-- GSWZ (78). -/
theorem seriesFA_reflect (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) :
    MvPowerSeries.map qInv.toRingHom (seriesFA (1 - A)) = seriesFA A := sorry

-- unit test `rank_one_three` (computation)
example : seriesFA (N := 1) !![3] - shift 0 (seriesFA !![3]) +
    MvPowerSeries.C (q ^ 3) * MvPowerSeries.X 0 *
      MvPowerSeries.rescale (fun _ => q ^ 3) (seriesFA !![3]) = 0 := sorry

-- unit test `zero_matrix` (degenerate)
example : seriesFA (N := 2) 0 * (poch 1 (Finsupp.single 0 1) * poch 1 (Finsupp.single 1 1)) = 1 :=
  sorry

-- unit test `reflection_three` (computation)
example : MvPowerSeries.map qInv.toRingHom (seriesFA (N := 1) !![-2]) = seriesFA !![3] := sorry


/-- `F₀ = ∏ⱼ (tⱼ;q)_∞⁻¹`. -/
theorem seriesFA_zero :
    seriesFA (0 : Matrix (Fin N) (Fin N) ℤ) * ∏ j, poch 1 (Finsupp.single j 1) = 1 := sorry

-- test `sign_normalisation` (non-example to dropping the sign): `F_(1) = (qt;q)_∞`
example : seriesFA (N := 1) !![1] = poch q (Finsupp.single 0 1) := sorry

/-! ### Ratios and the corrected Riccati system (new node `HB.8/ratio-riccati-system`) -/

/-- `G_j = F_A(σ_j t)/F_A(t)`. -/
def ratioFA (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) : MvPowerSeries (Fin N) Qq :=
  shift j (seriesFA A) * (seriesFA A)⁻¹

/-- The CORRECTED system replacing GSWZ (89):
`1 - G_j = (-q)^{A_jj} t_j · F_A(∏_i σ_i^{A_ij} t)/F_A(t)`. -/
theorem one_sub_ratioFA (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (j : Fin N) :
    1 - ratioFA A j = MvPowerSeries.C ((-q) ^ (A j j)) * MvPowerSeries.X j *
      (MvPowerSeries.rescale (fun i => q ^ (A i j)) (seriesFA A) * (seriesFA A)⁻¹) := sorry

/-- The ratios have integral Laurent-polynomial coefficients. -/
theorem ratioFA_coeff_mem (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (j : Fin N)
    (e : Idx N) : ∃ P : ℤ[T;T⁻¹], MvPowerSeries.coeff e (ratioFA A j) = evalQPow P 1 := sorry

/-! ### Integral plethystic logarithm over ℤ[q^{±1}] (new node `HB.8/integral-plethystic-logarithm`) -/

/-- `∑_{n ≠ 0} ∑_{l ≥ 1} M_n(q^l) t^{l n} / l`. -/
def plethysticLog (M : Idx N → ℤ[T;T⁻¹]) : MvPowerSeries (Fin N) Qq :=
  fun e => ∑ l ∈ (Finset.Icc 1 (Finsupp.degree e)).filter (fun l => ∀ i, l ∣ e i),
    evalQPow (M (Idx.divNat e l)) l / (l : Qq)

theorem exists_unique_plethysticLog (G : MvPowerSeries (Fin N) Qq)
    (hG : MvPowerSeries.constantCoeff G = 1)
    (hint : ∀ e, ∃ P : ℤ[T;T⁻¹], MvPowerSeries.coeff e G = evalQPow P 1) :
    ∃! M : Idx N → ℤ[T;T⁻¹], M 0 = 0 ∧ mvLog G = plethysticLog M := sorry

/-! ### Pole location (new node `HB.8/pole-location-lemma`) -/

/-- If `L · [n_i]_q` is an integral Laurent polynomial for every `i` with `n_i ≠ 0` and `L` is not,
then `L` has a pole at a primitive `a`-th root of unity with `1 < a` and `a ∣ n_i` for all `i`. -/
theorem pole_of_not_laurent (n : Idx N) (hn : n ≠ 0) (L : Qq)
    (h : ∀ i, n i ≠ 0 → ∃ P : ℤ[T;T⁻¹], L * ∑ r ∈ Finset.range (n i), q ^ r = evalQPow P 1)
    (hL : ¬ ∃ P : ℤ[T;T⁻¹], L = evalQPow P 1) :
    ∃ a : ℕ, 1 < a ∧ (∀ i, a ∣ n i) ∧
      Polynomial.cyclotomic a ℚ ∣ RatFunc.denom L := sorry

/-! ### The potential lemma and Theorem 6 (nodes `HB.8/potential-pole-lemma`,
`HB.8/finite-support-theorem`) -/

/-- The `x^{-1}` coefficient (in `LaurentSeries`) of each `t`-coefficient. -/
def residueSeries {K : Type*} [Field K] (G : MvPowerSeries (Fin N) (LaurentSeries K)) :
    MvPowerSeries (Fin N) K :=
  fun e => (MvPowerSeries.coeff e G).coeff (-1)

/-- GSWZ Lemma 2.6 (79): `log F_A(t, ζ_m + x) = ζ_m V(t^m)/(m² x) + O(x⁰)` with one `V`. -/
theorem potential_pole_lemma (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) :
    ∃ V : MvPowerSeries (Fin N) ℚ, ∀ (m : ℕ) [NeZero m],
      residueSeries (mvLog (admissibleExpansion m (seriesFA A))) =
        MvPowerSeries.C (zetaQ m /
          (m : CyclotomicField m ℚ) ^ 2) * substPow m V := sorry

/-- GSWZ Theorem 6. -/
theorem seriesFA_admissible (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) :
    Admissible (seriesFA A) := sorry

-- test `rank_one_three_L` (computation)
example (h : Admissible (seriesFA (N := 1) !![3])) :
    h.L (Finsupp.single 0 1) = LaurentPolynomial.T 3 ∧
    h.L (Finsupp.single 0 2) = LaurentPolynomial.T 7 ∧
    h.L (Finsupp.single 0 3) =
      LaurentPolynomial.T 10 + LaurentPolynomial.T 11 + LaurentPolynomial.T 13 := sorry

-- acceptance `dt_exponent_twenty` (computation, stress test)
example (h : Admissible (seriesFA (N := 1) !![3])) : (h.L (Finsupp.single 0 20)).coeff 142 = 44549701024 :=
  sorry

-- acceptance `dt_support_not_exact` (non-example to the word "exactly")
example (h : Admissible (seriesFA (N := 1) !![3])) : (h.L (Finsupp.single 0 3)).coeff 12 = 0 := sorry

/-! ### The t-deformed Nahm equations (node `HB.8/t-deformed-nahm-equations`) -/

/-- The unique solution `z(t) ∈ (1 + t ℤ[[t]])^N` of `1 - z_j = (-1)^{A_jj} t_j ∏_i z_i^{A_ij}`
(GSWZ (34) with the index corrected to `z_i`). -/
def tNahmSolution (A : Matrix (Fin N) (Fin N) ℤ) : Fin N → (MvPowerSeries (Fin N) ℤ)ˣ := sorry

theorem tNahmSolution_spec (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) :
    1 - (tNahmSolution A j : MvPowerSeries (Fin N) ℤ) =
      MvPowerSeries.C ((-1) ^ (A j j).natAbs) * MvPowerSeries.X j *
        ((∏ i, tNahmSolution A i ^ (A i j) : (MvPowerSeries (Fin N) ℤ)ˣ) : MvPowerSeries (Fin N) ℤ) :=
  sorry

theorem tNahmSolution_constantCoeff (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) :
    MvPowerSeries.constantCoeff (tNahmSolution A j : MvPowerSeries (Fin N) ℤ) = 1 := sorry

/-- GSWZ (36): `δ(t) = ∏ z_j^{-A_jj} det(diag(1 - z) A + diag z)`. -/
def tDiscriminant (A : Matrix (Fin N) (Fin N) ℤ) : MvPowerSeries (Fin N) ℤ :=
  ((∏ j, tNahmSolution A j ^ (-A j j) : (MvPowerSeries (Fin N) ℤ)ˣ) : MvPowerSeries (Fin N) ℤ) *
    Matrix.det (Matrix.diagonal (fun j => 1 - (tNahmSolution A j : MvPowerSeries (Fin N) ℤ)) *
        A.map (Int.castRingHom _) +
      Matrix.diagonal (fun j => (tNahmSolution A j : MvPowerSeries (Fin N) ℤ)))

theorem tDiscriminant_constantCoeff (A : Matrix (Fin N) (Fin N) ℤ) :
    MvPowerSeries.constantCoeff (tDiscriminant A) = 1 := sorry

-- unit test `rank_one_three_solution` (computation): 1, 1, 3, 12, 55, 273
example : ∀ k < 6, MvPowerSeries.coeff (Finsupp.single 0 k)
    (tNahmSolution (N := 1) !![3] 0 : MvPowerSeries (Fin 1) ℤ) = [1, 1, 3, 12, 55, 273].getD k 0 :=
  sorry

-- unit test `zero_matrix_discriminant` (degenerate; replaces the false "δ = 1")
example : tDiscriminant (N := 2) 0 = (1 - MvPowerSeries.X 0) * (1 - MvPowerSeries.X 1) := sorry

-- unit test `rank_one_three_discriminant` (computation): δ = 1 - 5t - 3t² - 10t³ - 42t⁴ - …
example : ∀ k < 5, MvPowerSeries.coeff (Finsupp.single 0 k) (tDiscriminant (N := 1) !![3]) =
    [1, -5, -3, -10, -42].getD k 0 := sorry


/-- Uniqueness: a solution in `1 + t ℤ⟦t⟧` is `z(t)`. -/
theorem tNahmSolution_unique (A : Matrix (Fin N) (Fin N) ℤ) (z : Fin N → (MvPowerSeries (Fin N) ℤ)ˣ)
    (hz0 : ∀ j, MvPowerSeries.constantCoeff (z j : MvPowerSeries (Fin N) ℤ) = 1)
    (hz : ∀ j, 1 - (z j : MvPowerSeries (Fin N) ℤ) =
      MvPowerSeries.C ((-1) ^ (A j j).natAbs) * MvPowerSeries.X j *
        ((∏ i, z i ^ (A i j) : (MvPowerSeries (Fin N) ℤ)ˣ) : MvPowerSeries (Fin N) ℤ)) :
    z = tNahmSolution A := sorry

-- jacobian_eq_discriminant: not stated; it needs the Jacobian of the system in the variables `z`, i.e.
-- partial derivatives of power series in the unknowns, which are not set up here.

-- Test index_slip: not stated; it compares with the solution of the misprinted system
-- `1 - z_j = ±t_j z_j^{Σᵢ A_ij}`, which is not defined here.

/-! ### The rings S and S^(m) (node `HB.8/ring-S-and-its-level-m-variants`) -/

/-- The ring `S` of GSWZ (35): variables `t_j, t_j', z_j, z_j', w` with `t t' = 1`, `z z' = 1`,
the equations (34) and `w² δ = 1`. The relations are written with nonnegative exponents. -/
abbrev SVars (N : ℕ) : Type := (Fin N ⊕ Fin N) ⊕ ((Fin N ⊕ Fin N) ⊕ Unit)

def ringSRelations (A : Matrix (Fin N) (Fin N) ℤ) : Set (MvPolynomial (SVars N) ℤ) := sorry

def ringS (A : Matrix (Fin N) (Fin N) ℤ) : Type :=
  MvPolynomial (SVars N) ℤ ⧸ Ideal.span (ringSRelations A)

instance (A : Matrix (Fin N) (Fin N) ℤ) : CommRing (ringS A) :=
  inferInstanceAs (CommRing (MvPolynomial (SVars N) ℤ ⧸ Ideal.span (ringSRelations A)))

instance ringSAlgebra (A : Matrix (Fin N) (Fin N) ℤ) : Algebra (MvPolynomial (Fin N) ℤ) (ringS A) :=
  sorry

/-- After inverting 2, `S` is étale over `ℤ[t]` (GSWZ after (36)). -/
theorem ringS_etale (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) :
    Algebra.Etale (MvPolynomial (Fin N) ℤ) (Localization.Away (2 : ringS A)) := sorry


-- ringSm: not stated; needs `ζ_m` and `t^{±1/m}` adjoined to `ringS A` (a tensor product with `ℤ[ζ_m]` and a
-- Kummer extension).
-- ringS_toPowerSeries: not stated; its target is a completion `ℤ[1/2]((t))` in which `t⁻¹` exists.
-- ringS_specialise: not stated; its target `R[δ^{-1/2}]` is HB.3/general-nondegenerate-class, not stated in
-- the HB.3–HB.4 part.

-- test `ringS_zero_matrix` (degenerate): for `A = 0`, `z = 1 - t` in `S`
example : (Ideal.Quotient.mk (Ideal.span (ringSRelations (N := 1) 0))
      (MvPolynomial.X (Sum.inr (Sum.inl (Sum.inl 0)))) : ringS (N := 1) 0) =
    Ideal.Quotient.mk _ (1 - MvPolynomial.X (Sum.inl (Sum.inl 0))) := sorry

-- Test ringS_etale_three: not stated; it needs the element `δ` of `ringS !![3]`, whose presentation
-- `ringSRelations` is left abstract here.
-- Test ringS_not_etale_without_delta: not stated; it needs the ring before inverting `δ`.

/-! ### Level m admissibility, CORRECTED (node `HB.8/level-m-admissible-series`) -/

/-- The allowed denominators of the corrected definition: `Φ_d` with `m ∤ d`, or `m ∣ d` and
`gcd(d/m, m) > 1`. GSWZ Definition 2.8 allows only `m ∤ d`, which Theorem 7 violates. -/
def LevelAllowed (m d : ℕ) : Prop := ¬ m ∣ d ∨ (m ∣ d ∧ 1 < Nat.gcd (d / m) m)

/-- `L ∈ ℤ[1/m, q^{±1}, Φ_d^{-1} : LevelAllowed m d]`, as an element of `ℚ(q)`. -/
def InLevelRing (m : ℕ) (L : Qq) : Prop :=
  ∃ (P : ℤ[T;T⁻¹]) (k : ℕ) (D : Finset ℕ) (e : ℕ → ℕ), (∀ d ∈ D, 0 < d ∧ LevelAllowed m d) ∧
    L * (m : Qq) ^ k * ∏ d ∈ D, (algebraMap (Polynomial ℚ) Qq (Polynomial.cyclotomic d ℚ)) ^ e d =
      evalQPow P 1

/-- Lemma 2.7 (90) for general `N`: `log F = -∑_n ∑_{(l,m)=1} L_n(q^l) t^{l n}/(l (1 - q^{m l}))`. -/
def levelLog (m : ℕ) (L : Idx N → Qq) : MvPowerSeries (Fin N) Qq :=
  fun e => -∑ l ∈ (Finset.Icc 1 (Finsupp.degree e)).filter (fun l => Nat.Coprime l m ∧ ∀ i, l ∣ e i),
    RatFunc.eval RatFunc.C (q ^ l) (L (Idx.divNat e l)) /
      ((l : Qq) * (1 - q ^ (m * l)))

def LevelAdmissible (m : ℕ) [NeZero m] (F : MvPowerSeries (Fin N) Qq) : Prop :=
  MvPowerSeries.constantCoeff F = 1 ∧
    ∃ L : Idx N → Qq, L 0 = 0 ∧ mvLog F = levelLog m L ∧ (∀ n, InLevelRing m (L n)) ∧
      ∀ n, ∃ r : ℚ, (∃ k : ℕ, ∃ z : ℤ, r = z / (m : ℚ) ^ k) ∧
        RatFunc.eval (algebraMap ℚ (CyclotomicField m ℚ))
          (zetaQ m) (L n) =
          algebraMap ℚ (CyclotomicField m ℚ) r

theorem levelAdmissible_one_iff (F : MvPowerSeries (Fin N) Qq) :
    LevelAdmissible 1 F ↔ Admissible F := sorry

-- unit test `pochhammer_level_m` (compatibility): (t;q²)_∞ is level-2 admissible in the CORRECTED
-- sense (its L₂ = 1/(2(1+q²)) has a Φ₄-pole, allowed since gcd(4/2, 2) = 2 > 1; forbidden by GSWZ (93))
example : LevelAdmissible 2 (mvExp (N := 1) (fun e => -∑ l ∈ (Finset.Icc 1 (e 0)).filter
    (fun l => e = Finsupp.single 0 l), 1 / ((l : Qq) * (1 - q ^ (2 * l))))) := sorry

-- unit test `building_block_m_two` (computation): (t;q²)_∞ (t²;q⁴)_∞^{-1/2} has L₁ = 1, L_n = 0 (n ≥ 2)
-- unit test `value_condition` (non-example): m = 3, L₁ = q (the block (qt;q³)_∞(q³t³;q⁹)_∞^{-1/3})
-- satisfies membership but L₁(ζ₃) = ζ₃ ∉ ℤ[1/3].


/-- The `L_n` of a level-`m` admissible series. -/
def LevelAdmissible.L {m : ℕ} [NeZero m] {F : MvPowerSeries (Fin N) Qq} (h : LevelAdmissible m F) :
    Idx N → Qq :=
  h.2.choose

theorem LevelAdmissible.L_unique {m : ℕ} [NeZero m] {F : MvPowerSeries (Fin N) Qq}
    (h : LevelAdmissible m F) (L : Idx N → Qq) (h0 : L 0 = 0) (hL : mvLog F = levelLog m L) :
    L = h.L := sorry

-- levelBuildingBlock_eq_prod: not stated; it needs Pochhammer symbols with base `q^{dm}` and rational powers
-- `(·)^{μ(d)/d}` of power series (as `mvExp` of a multiple of `mvLog`), which are not set up here.

-- test `level_one` (characterisation): `levelAdmissible_one_iff` above.

/-! ### Congruence sums (new node `HB.8/congruence-sum-series`) and corrected Theorem 7 -/

/-- GSWZ (32): `F_{A,m,k}(t,q) = ∑_{n ≡ k (m)} (-1)^{diag(A)(n-k)} q^{(nᵀAn - kᵀAk + diag(A)(n-k))/2}
t^{n-k} / ∏_j (q^{k_j+1};q)_{n_j-k_j}`. -/
def congruenceSum (A : Matrix (Fin N) (Fin N) ℤ) (m : ℕ) (k : Idx N) : MvPowerSeries (Fin N) Qq :=
  fun e =>
    let n : Idx N := e + k
    if ∀ j, m ∣ e j then
      (-1) ^ (diagDot A e).natAbs * q ^ ((quadForm A n - quadForm A k + diagDot A e) / 2) /
        ∏ j, ∏ r ∈ Finset.range (e j), (1 - q ^ (k j + 1 + r))
    else 0

/-- The order-`m` equation with the CORRECT sign `(-1)^{A_jj m}` (GSWZ (98) omits it, (137) and
(165) print `(-1)^{A_jj m(m+1)/2}`), for `H = t^k F_{A,m,k}`. -/
theorem congruenceSum_qdiff (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (m : ℕ) [NeZero m]
    (k : Idx N) (hk : ∀ j, k j < m) (j : Fin N) :
    let H := MvPowerSeries.monomial k 1 * congruenceSum A m k
    ∑ ℓ ∈ Finset.range (m + 1),
        MvPowerSeries.C ((-1) ^ ℓ * q⁻¹ ^ (ℓ * (ℓ - 1) / 2) *
          ((∏ r ∈ Finset.range m, (1 - q⁻¹ ^ (r + 1))) /
            ((∏ r ∈ Finset.range ℓ, (1 - q⁻¹ ^ (r + 1))) *
             ∏ r ∈ Finset.range (m - ℓ), (1 - q⁻¹ ^ (r + 1))))) *
          (⇑(shift j))^[ℓ] H =
      MvPowerSeries.C ((-1) ^ ((A j j).natAbs * m) * q ^ (A j j * ((m * (m + 1) / 2 : ℕ) : ℤ))) *
        MvPowerSeries.X j ^ m * MvPowerSeries.rescale (fun i => q ^ ((m : ℤ) * A i j)) H := sorry

/-- Corrected GSWZ Theorem 7, in `T = t^{1/m}`: `F_{A,m,k}(T, q)` is a series in `T^m`;
the statement is that `F_{A,m,k}(t^{1/m}, q)` is level-`m` admissible in the corrected sense. -/
theorem congruenceSum_levelAdmissible (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (m : ℕ) [NeZero m] (k : Idx N) (hk : ∀ j, k j < m) :
    ∃ G : MvPowerSeries (Fin N) Qq, LevelAdmissible m G ∧
      MvPowerSeries.subst (fun i => (MvPowerSeries.X i : MvPowerSeries (Fin N) Qq) ^ m) G =
        congruenceSum A m k := sorry

-- test `congruence_sum_needs_corrected_ring` (non-example to GSWZ (93)): for `A = 0`, `m = 2`, `k = 0` the
-- coefficient `L₂` of `F_{0,2,0}(t^{1/2},q) = ∑_j t^j/(q;q)_{2j}` has the factor `Φ₄` in its denominator;
-- the series is level-2 admissible in the corrected sense only.
example : ∃ G : MvPowerSeries (Fin 1) Qq, LevelAdmissible 2 G ∧
    MvPowerSeries.subst (fun i => (MvPowerSeries.X i : MvPowerSeries (Fin 1) Qq) ^ 2) G =
      congruenceSum 0 2 0 := sorry

/-- `F_{A,1,0} = F_A`. -/
theorem congruenceSum_one (A : Matrix (Fin N) (Fin N) ℤ) : congruenceSum A 1 0 = seriesFA A := sorry

-- test `m_one` (degenerate): with `congruenceSum_one`, the system `congruenceSum_qdiff` at `m = 1` is
-- `seriesFA_qdiff`.

-- test `zero_matrix_m_two` (computation): `F_{0,2,0} = (1/(t;q)_∞ + 1/(-t;q)_∞)/2`
example : (2 : MvPowerSeries (Fin 1) Qq) * congruenceSum 0 2 0 =
    (poch 1 (Finsupp.single 0 1))⁻¹ +
      (MvPowerSeries.rescale (fun _ => (-1 : Qq)) (poch 1 (Finsupp.single 0 1)))⁻¹ := sorry

-- congruenceSum_unique: not stated; it needs the solution space `t^k K((x))⟦t^m⟧` of the order-`m` system.
-- congruenceSum_split: not stated; it needs the weights `w_{k'}` of the splitting into classes modulo `am`.
-- Test sign_m_three: not stated; it checks that the printed (98) fails at order `t⁴`, and the printed
-- system is not defined here (`congruenceSum_qdiff` has the corrected sign).

/-! ### The Gaussian side of GSWZ §2.5–2.7 and the remaining HB.8 nodes -/

-- These need the formal Gaussian bracket with coefficients in `ℚ(ζ_m, z^{1/m})⟦t⟧` and a loop parameter
-- (GSWZ (115)-(118)); the HB.3–HB.4 part has `formalGaussian` for real polynomial integrands only.
-- HB.8/fgi-collection: not stated; needs that bracket.
-- fgiFactor: not stated; needs the regularised Pochhammer factor ψ of GSWZ (Psikdef) over that ring.
-- fgiFactor_mem: not stated; needs fgiFactor.
-- fgiIntegral: not stated; needs the bracket.
-- fgiIntegral_periodic: not stated; needs fgiIntegral (it is HB.8/periodicity-of-the-gaussian-integrals).
-- fgiCollection: not stated; needs fgiIntegral.
-- fgiCollection_prefactor: not stated; needs fgiCollection.
-- fgiRefined: not stated; needs fgiIntegral.
-- Test m_one: not stated; needs fgiCollection (the `m = 1` case of HB.8/fgi-collection).
-- Test critical_point: not stated; needs the phase function of GSWZ (115).
-- Test lambda_determinant: not stated; needs `Λ(t)`, which is defined from fgiFactor.
-- Test refined_relation: not stated; needs fgiRefined and `CS_{A,m,k}`.
-- HB.8/periodicity-of-the-gaussian-integrals: not stated; needs fgiIntegral.
-- HB.8/q-difference-for-the-gaussian-collection: not stated; needs fgiCollection.
-- HB.8/gaussian-pieces-are-power-series-in-t: not stated; needs fgiRefined.
-- HB.8/identification-theorem: not stated; needs fgiRefined and `CS_{A,m,k}` (GSWZ Theorem 8).
-- HB.8/fgi-coefficients-in-S: not stated; needs fgiCollection and the map `ringS A → ℚ(z)⟦t⟧`.
-- HB.8/residues-of-congruence-sums: not stated; needs the expansion of `congruenceSum` at `ζ_{am}` for
--   `gcd(a, m) > 1` (the corrected `admissibleExpansion_polar` at level `m`).
-- HB.8/congruence-sums-are-level-m-admissible: `congruenceSum_levelAdmissible` above (corrected Theorem 7).
-- HB.8/wkb-algebraicity: not stated; needs the WKB recursion of GSWZ §2.6 for the ratios `ratioFA`.
-- HB.8/equality-of-invariants: not stated; needs fgiCollection (its potential, discriminant and constants).
-- HB.8/potential-determines-the-matrix: not stated; it needs the Hessian identity (169) in the variables
--   `log z`, i.e. derivatives of `potential` along `tNahmSolution`.
-- HB.8/acceptance-rank-one: its displays are the tests `rank_one_three`, `rank_one_three_solution`,
--   `rank_one_three_discriminant` and `rank_one_three_L` above; the product identity is not stated.
-- HB.8/dwork-quotient-level-m: not stated; the level-`m` analogue of `Admissible.dwork` needs the Frobenius
--   `q ↦ q^p` on the corrected level ring.
-- HB.8/admissible-recognition: not stated; it recognises admissibility from the expansions at all roots
--   of unity, and needs `admissibleExpansion` at every level.

end HabiroNahmSeries.HB8

end

end PartHB8

/-! ## HB.8: reviewed refinements -/

noncomputable section AssemblyHB8
open scoped LaurentPolynomial RatFunc
open Finset

namespace HabiroNahmSeries.HB8Refinement

abbrev Qq := RatFunc ℚ
abbrev Idx (N : ℕ) := Fin N →₀ ℕ
abbrev Series (N : ℕ) (R : Type*) := MvPowerSeries (Fin N) R
variable {N : ℕ}

namespace Imported

/-- These are aliases/adapters to the assembled base signatures, not new owners. -/
abbrev q : Qq := HabiroNahmSeries.HB8.q
theorem q_ne_zero : q ≠ 0 := HabiroNahmSeries.HB8.q_ne_zero

def evalLaurent (P : ℤ[T;T⁻¹]) : Qq := HabiroNahmSeries.HB8.evalQPow P 1

def mvLog {R : Type*} [CommRing R] [Algebra ℚ R] (F : Series N R) : Series N R :=
  HabiroNahmSeries.HB8.mvLog F

def shiftBy (a : Fin N → ℤ) : Series N Qq →+* Series N Qq :=
  MvPowerSeries.rescale (fun i => q ^ a i)

def shift (j : Fin N) : Series N Qq →+* Series N Qq := HabiroNahmSeries.HB8.shift j

def diagDot (A : Matrix (Fin N) (Fin N) ℤ) (n : Idx N) : ℤ :=
  HabiroNahmSeries.HB8.diagDot A n

def quad (A : Matrix (Fin N) (Fin N) ℤ) (n : Idx N) : ℤ :=
  HabiroNahmSeries.HB8.quadForm A n

/-- Adapter for HB.8/series-F-A, with signed integer q-exponent. -/
def seriesFA (A : Matrix (Fin N) (Fin N) ℤ) : Series N Qq :=
  HabiroNahmSeries.HB8.seriesFA A

def ratio (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) : Series N Qq :=
  HabiroNahmSeries.HB8.ratioFA A j

def signedRatio (A : Matrix (Fin N) (Fin N) ℤ) (a : Fin N → ℤ) : Series N Qq :=
  shiftBy a (seriesFA A) * (seriesFA A)⁻¹

/-- Adapter for HB.8/t-deformed-nahm-equations, after scalar extension to ℚ. -/
def nahmUnit (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) : (Series N ℚ)ˣ :=
  Units.map (MvPowerSeries.map (Int.castRingHom ℚ)).toMonoidHom
    (HabiroNahmSeries.HB8.tNahmSolution A j)

/-- Adapter for HB.8/laurent-expansion-at-a-root-of-unity: q ↦ ζ+x. -/
def expandAt {K : Type*} [Field K] [Algebra ℚ K] (ζ : K) :
    Qq →+* LaurentSeries K := HabiroNahmSeries.HB8.expandAt ζ

/-- Polylogarithms:P.1/classical-polylogarithm, API polylogSeries, weight two. -/
def li2 : PowerSeries ℚ := PowerSeries.mk fun n => if n = 0 then 0 else 1 / (n : ℚ)^2

/-- q ↦ q^ℓ for ℓ positive, used by the parent plethystic coefficient API. -/
def adams (ℓ : ℕ) (_hℓ : ℓ ≠ 0) : Qq →+* Qq := HabiroNahmSeries.HB8.frobQ ℓ

def divIndex (n : Idx N) (ℓ : ℕ) : Idx N := HabiroNahmSeries.HB8.Idx.divNat n ℓ

/-- Adapter for HB.8/congruence-sum-series; e is the exponent after removing t^k. -/
def congruenceSum (A : Matrix (Fin N) (Fin N) ℤ) (m : ℕ) (k : Idx N) : Series N Qq :=
  HabiroNahmSeries.HB8.congruenceSum A m k

end Imported
open Imported

def euler {R : Type*} [Semiring R] (j : Fin N) (F : Series N R) : Series N R :=
  fun n => (n j : R) * MvPowerSeries.coeff n F

def evalSeries {K : Type} [Field K] [Algebra ℚ K] (ζ : K) (F : Series N Qq) :
    Series N K := fun n => RatFunc.eval (K := ℚ) (algebraMap ℚ K) ζ
      (MvPowerSeries.coeff n F)

def powSubst {R : Type*} [CommRing R] (m : ℕ) (hm : m ≠ 0) (F : Series N R) :
    Series N R := MvPowerSeries.expand m hm F

def residueAt {K : Type*} [Field K] [Algebra ℚ K] (ζ : K) (F : Series N Qq) :
    Series N K := fun n => (expandAt ζ (MvPowerSeries.coeff n F)).coeff (-1)

/- refinement-signed-shifts. The cocycle and Riccati identities are the imported
ratio API; this theorem supplies the missing simultaneous signed induction. -/
theorem signedShift_integral (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (a : Fin N → ℤ) (n : Idx N) :
    ∃ P : ℤ[T;T⁻¹], MvPowerSeries.coeff n (signedRatio A a) = evalLaurent P := sorry

/- refinement-orbit-ratio: construction, five API items and four unit tests. -/
def orbitRatio (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) (m : ℕ) : Series N Qq :=
  ∏ s ∈ range m, MvPowerSeries.rescale (Function.update 1 j (q ^ s)) (ratio A j)

theorem orbitRatio_quotient (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) (m : ℕ) :
    orbitRatio A j m =
      MvPowerSeries.rescale (Function.update 1 j (q ^ m)) (seriesFA A) * (seriesFA A)⁻¹ :=
  sorry

theorem orbitRatio_add (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) (m n : ℕ) :
    orbitRatio A j (m+n) = orbitRatio A j m *
      MvPowerSeries.rescale (Function.update 1 j (q ^ m)) (orbitRatio A j n) := sorry

theorem orbitRatio_integral (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (j : Fin N) (m : ℕ) (n : Idx N) :
    ∃ P : ℤ[T;T⁻¹], MvPowerSeries.coeff n (orbitRatio A j m) = evalLaurent P := sorry

theorem orbitRatio_one (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) :
    orbitRatio A j 1 = ratio A j := sorry

-- orbitRatio_zero (degenerate)
example (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) : orbitRatio A j 0 = 1 := sorry

-- orbitRatio_zeroMatrix (computation)
example (j : Fin N) : orbitRatio 0 j 2 =
    (1 - MvPowerSeries.X j) * (1 - MvPowerSeries.C q * MvPowerSeries.X j) := sorry

-- orbitRatio_root_zeroMatrix (computation)
example {K : Type} [Field K] [Algebra ℚ K] (m : ℕ) (hm : m ≠ 0)
    (ζ : K) (hζ : IsPrimitiveRoot ζ m) (j : Fin N) :
    evalSeries ζ (orbitRatio 0 j m) = 1 - MvPowerSeries.X j ^ m := sorry

-- orbitRatio_rescale (compatibility with Mathlib rescale)
example (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) (m : ℕ) :
    MvPowerSeries.rescale (Function.update 1 j (q ^ m)) (seriesFA A) =
      orbitRatio A j m * seriesFA A := sorry

/- refinement-orbit-nahm -/
theorem orbitRatio_at_root {K : Type} [Field K] [Algebra ℚ K]
    (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (m : ℕ) (hm : m ≠ 0)
    (ζ : K) (hζ : IsPrimitiveRoot ζ m) (j : Fin N) :
    evalSeries ζ (orbitRatio A j m) = powSubst m hm
      (MvPowerSeries.map (algebraMap ℚ K) (nahmUnit A j : Series N ℚ)) := sorry

/- refinement-residue-potential: construction, five API items and four tests. -/
def residuePotential (A : Matrix (Fin N) (Fin N) ℤ) : Series N ℚ :=
  residueAt (1 : ℚ) (mvLog (seriesFA A))

theorem residuePotential_constantCoeff (A : Matrix (Fin N) (Fin N) ℤ) :
    MvPowerSeries.constantCoeff (residuePotential A) = 0 := sorry

theorem residuePotential_euler (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (j : Fin N) : euler j (residuePotential A) = mvLog (nahmUnit A j : Series N ℚ) := sorry

theorem residuePotential_unique (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (W : Series N ℚ) (h0 : MvPowerSeries.constantCoeff W = 0)
    (hW : ∀ j, euler j W = mvLog (nahmUnit A j : Series N ℚ)) :
    W = residuePotential A := sorry

theorem residuePotential_coeff (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (n : Idx N) (j : Fin N) (hn : n j ≠ 0) :
    MvPowerSeries.coeff n (residuePotential A) =
      MvPowerSeries.coeff n (mvLog (nahmUnit A j : Series N ℚ)) / (n j : ℚ) := sorry

-- residuePotential_rankZero (degenerate)
example (A : Matrix (Fin 0) (Fin 0) ℤ) : residuePotential A = 0 := sorry

-- residuePotential_zeroMatrix (computation)
example : residuePotential (0 : Matrix (Fin N) (Fin N) ℤ) =
    -∑ j, PowerSeries.subst (MvPowerSeries.X j : Series N ℚ) li2 := sorry

-- residuePotential_three (computation)
example : ∀ k < 5, MvPowerSeries.coeff (Finsupp.single 0 k)
    (residuePotential (N := 1) !![3]) = [0, 1, 5/4, 28/9, 165/16].getD k 0 := sorry

-- residuePotential_logCompatibility (compatibility)
example (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (j : Fin N) :
    MvPowerSeries.coeff (Finsupp.single j 1) (residuePotential A) =
      -((-1 : ℚ) ^ (A j j).natAbs) := sorry

/- refinement-all-root-residue: residue equality and the entire pole bound. -/
theorem allRoot_residue {K : Type*} [Field K] [Algebra ℚ K]
    (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (m : ℕ) (hm : m ≠ 0)
    (ζ : K) (hζ : IsPrimitiveRoot ζ m) :
    residueAt ζ (mvLog (seriesFA A)) = MvPowerSeries.C (ζ / (m : K)^2) *
      powSubst m hm (MvPowerSeries.map (algebraMap ℚ K) (residuePotential A)) ∧
    ∀ n : Idx N, ∀ k : ℤ, k < -1 →
      (expandAt ζ (MvPowerSeries.coeff n (mvLog (seriesFA A)))).coeff k = 0 := sorry

/- refinement-critical-value -/
theorem residuePotential_criticalValue (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) :
    residuePotential A =
      -∑ j, PowerSeries.subst (1 - (nahmUnit A j : Series N ℚ)) li2 -
      (1/2 : ℚ) • ∑ i, ∑ j, (A i j : ℚ) •
        (mvLog (nahmUnit A i : Series N ℚ) * mvLog (nahmUnit A j : Series N ℚ)) := sorry

/- refinement-restricted-adams: the rational-function signature. The completed
Z[1/m]((q)) version additionally uses the imported parent product topology. -/
def restrictedLog (m : ℕ) (L : Idx N → Qq) : Series N Qq := fun n =>
  -∑ ℓ ∈ (Icc 1 (Finsupp.degree n)).filter
      (fun ℓ => (∀ i, ℓ ∣ n i) ∧ Nat.Coprime ℓ m),
    if hℓ : ℓ ≠ 0 then
      adams ℓ hℓ (L (divIndex n ℓ)) / ((ℓ : Qq) * (1 - q ^ (m * ℓ)))
    else 0

def restrictedCoeffs (m : ℕ) (F : Series N Qq) : Idx N → Qq := sorry

theorem restrictedCoeffs_log (m : ℕ) (hm : m ≠ 0) (F : Series N Qq)
    (hF : MvPowerSeries.constantCoeff F = 1) :
    restrictedCoeffs m F 0 = 0 ∧ mvLog F = restrictedLog m (restrictedCoeffs m F) := sorry

theorem restrictedCoeffs_unique (m : ℕ) (hm : m ≠ 0) (F : Series N Qq)
    (hF : MvPowerSeries.constantCoeff F = 1) (L : Idx N → Qq)
    (h0 : L 0 = 0) (hL : mvLog F = restrictedLog m L) :
    L = restrictedCoeffs m F := sorry

theorem restrictedCoeffs_recursion (m : ℕ) (hm : m ≠ 0) (F : Series N Qq)
    (hF : MvPowerSeries.constantCoeff F = 1) (n : Idx N) (hn : n ≠ 0) :
    restrictedCoeffs m F n = -(1-q^m) * (MvPowerSeries.coeff n (mvLog F) +
      ∑ ℓ ∈ (Icc 2 (Finsupp.degree n)).filter
          (fun ℓ => (∀ i, ℓ ∣ n i) ∧ Nat.Coprime ℓ m),
        if hℓ : ℓ ≠ 0 then
          adams ℓ hℓ (restrictedCoeffs m F (divIndex n ℓ)) /
            ((ℓ : Qq) * (1-q^(m*ℓ))) else 0) := sorry

-- The parent ordinary coefficient family is specified by restrictedLog 1.
-- restrictedCoeffs_one (compatibility with HB.8/admissible-series)
theorem restrictedCoeffs_one (F : Series N Qq) (hF : MvPowerSeries.constantCoeff F = 1)
    (L : Idx N → Qq) (h0 : L 0 = 0) (hL : mvLog F = restrictedLog 1 L) :
    restrictedCoeffs 1 F = L := sorry

theorem restrictedCoeffs_mul (m : ℕ) (hm : m ≠ 0) (F G : Series N Qq)
    (hF : MvPowerSeries.constantCoeff F = 1)
    (hG : MvPowerSeries.constantCoeff G = 1) :
    restrictedCoeffs m (F * G) = restrictedCoeffs m F + restrictedCoeffs m G := sorry

-- restrictedCoeffs_unit (degenerate)
example (m : ℕ) (hm : m ≠ 0) : restrictedCoeffs (N := N) m 1 = 0 := sorry

-- restrictedCoeffs_linear (mixed monomial computation)
example (m : ℕ) (hm : m ≠ 0) :
    restrictedCoeffs m (1 + MvPowerSeries.X 0 * MvPowerSeries.X 1 : Series 2 Qq)
      (Finsupp.single 0 1 + Finsupp.single 1 1) = -(1-q^m) := sorry

-- restrictedCoeffs_two (computation)
example : restrictedCoeffs 2 (1 + MvPowerSeries.X 0 * MvPowerSeries.X 1 : Series 2 Qq)
    (Finsupp.single 0 2 + Finsupp.single 1 2) = (1-q^2)/2 := sorry

-- restrictedCoeffs_mOne (compatibility)
example : restrictedCoeffs 1 (1 + MvPowerSeries.X 0 * MvPowerSeries.X 1 : Series 2 Qq)
    (Finsupp.single 0 2 + Finsupp.single 1 2) = 1-q := sorry

/- refinement-finite-support. Finiteness in i is encoded by the LaurentPolynomial
carrier; it is not replaced by integrality of unrestricted exponents. -/
theorem seriesFA_finiteSupport (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) :
    ∃ L : Idx N → ℤ[T;T⁻¹], L 0 = 0 ∧
      mvLog (seriesFA A) = restrictedLog 1 (fun n => evalLaurent (L n)) := sorry

/- refinement-congruence-uniqueness -/
def higherDifference (j : Fin N) : ℕ → Series N Qq → Series N Qq
  | 0 => id
  | m+1 => fun F => higherDifference j m F -
      MvPowerSeries.C (q ^ (-(m : ℤ))) * shift j (higherDifference j m F)

theorem congruenceSolution_unique (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (m : ℕ) (hm : m ≠ 0) (k : Idx N) (hk : ∀ j, k j < m)
    (H : Series N Qq) (h0 : MvPowerSeries.coeff k H = 1)
    (hsupp : ∀ n, ¬ (∀ j, ∃ b : ℕ, n j = k j + m*b) → MvPowerSeries.coeff n H = 0)
    (hrec : ∀ j, higherDifference j m H =
      MvPowerSeries.C ((-1) ^ ((A j j).natAbs*m) *
        q ^ (A j j * ((m*(m+1)/2 : ℕ) : ℤ))) * MvPowerSeries.X j ^ m *
        shiftBy (fun i => (m : ℤ)*A i j) H) :
    H = MvPowerSeries.monomial k 1 * congruenceSum A m k := sorry

/- Gaussian signatures cannot yet be stated in the required coefficient completion.
Each omitted name is an explicit packet theorem, not a Prop-valued stub:

HabiroNahmSeries.HB8Refinement.gaussianLocal_normalization
  needs the h,w augmentation completion and the Bernoulli expansion of a Pochhammer
  factor; its exact four coefficients and counterchecks are in the packet/reader.
HabiroNahmSeries.HB8Refinement.gaussianAffine_system
  needs HB.4/formal-gaussian-integration over the formal rational-function coefficient
  ring and the corrected global prefactors (G1); it is not an analytic Gaussian.
HabiroNahmSeries.HB8Refinement.gaussianCS_regular
  needs the corrected CS in its x-first completion and the change to K((x))[[t]] (G2).
HabiroNahmSeries.HB8Refinement.gaussianIdentification
  needs both previous completions and the corrected refined normalization (G1,G2).
HabiroNahmSeries.HB8Refinement.congruenceRoot_residue
  needs that identification for c=m*a, gcd(a,m)=1 (G1,G2).
HabiroNahmSeries.HB8Refinement.congruenceSum_correctedLevel
  needs the parent R_m localization and its evaluation API, and the complete corrected
  pole/value argument (G3). This is not the false printed Definition 2.8.

The completed-coefficient integrality assertion for restrictedCoeffs needs the parent
Z[1/m]((q)) inclusion/product module. The rational-function construction, its API and all
twelve tests have signatures above. No assertion that these omitted objects already
exist is made by elaboration of this file.
-/

end HabiroNahmSeries.HB8Refinement

end AssemblyHB8

section PartHB910

/-! # HB.9–HB.10: Habiro integrality and the worked examples (checker D)

The rank-one series, the Dwork difference at `q = 1 + x`, the coefficient ring and its Frobenius,
and the numerical facts behind the examples (tests of the named nodes). -/

open PowerSeries
open scoped PowerSeries.WithPiTopology

namespace HabiroNahmSeries.HB910

/-- The rank-one GSWZ series `F_A(t,q) = Σ (-1)^{an} q^{(an²+an)/2} tⁿ/(q;q)_n` for `a ≥ 0`,
as a power series in `t` over `ℤ⟦q⟧`. -/
noncomputable def qFactorial (n : ℕ) : PowerSeries ℤ := ∏ i ∈ Finset.range n, (1 - X ^ (i + 1))

noncomputable def rankOneSeries (a : ℕ) : PowerSeries (PowerSeries ℤ) :=
  PowerSeries.mk fun n =>
    (-1) ^ (a * n) * X ^ ((a * n ^ 2 + a * n) / 2) * invOfUnit (qFactorial n) 1

/-- `HB.10/rank-one-product-identities` (i): Euler, `F_0 = (t;q)_∞⁻¹`. -/
theorem rankOneSeries_zero_mul_pochhammer :
    HasProd (fun j : ℕ => (1 - C (X ^ j) * X : PowerSeries (PowerSeries ℤ)))
      (invOfUnit (rankOneSeries 0) 1) := by sorry

/-- `HB.10/rank-one-product-identities` (ii): Euler, `F_1 = (qt;q)_∞`. -/
theorem rankOneSeries_one :
    HasProd (fun j : ℕ => (1 - C (X ^ (j + 1)) * X : PowerSeries (PowerSeries ℤ)))
      (rankOneSeries 1) := by sorry

/-- `HB.10/rank-one-product-identities` (iii): the q-difference equation (33) for `N = 1`. -/
theorem rankOneSeries_qdiff (a : ℕ) :
    rankOneSeries a - rescale (X : PowerSeries ℤ) (rankOneSeries a) =
      C ((-1) ^ a * X ^ a) * X * rescale ((X : PowerSeries ℤ) ^ a) (rankOneSeries a) := by sorry

/-- The power-series solution of `1 - z = (-1)^a t z^a`, `z(0) = 1`. -/
noncomputable def zSeries (a : ℕ) : PowerSeries ℤ := sorry

theorem zSeries_spec (a : ℕ) : 1 - zSeries a = (-1) ^ a * X * zSeries a ^ a := by sorry

/-- `HB.10/rank-one-product-identities` (iv), test: GSWZ (239). -/
example : (Finset.range 7).image (fun n => coeff n (zSeries 3)) = {1, 1, 3, 12, 55, 273, 1428} := by sorry

/-! ### Theorem 4 in rank one, `m = 1`, in its p-integral form -/

/-- `F_A(t, 1+x)` as a power series in `t` over Laurent series in `x` (`a : ℤ`). -/
noncomputable def atOne (a : ℤ) (q : RatFunc ℚ) : PowerSeries (LaurentSeries ℚ) :=
  PowerSeries.mk fun n =>
    ((((-1 : RatFunc ℚ) ^ (a * n).natAbs) * q ^ ((a * n ^ 2 + a * n) / 2) /
      ∏ i ∈ Finset.range n, (1 - q ^ (i + 1)) : RatFunc ℚ) : LaurentSeries ℚ)

/-- The Dwork difference `log F(t^p, q^p) - p log F(t, q)` at `q = 1 + x`. -/
noncomputable def dworkDiff (a : ℤ) (p : ℕ) : PowerSeries (LaurentSeries ℚ) :=
  logOf (PowerSeries.mk fun n => if p ∣ n then coeff (n / p) (atOne a ((1 + RatFunc.X) ^ p)) else 0)
    - (p : LaurentSeries ℚ) • logOf (atOne a (1 + RatFunc.X))

/-- `HB.9/frobenius-congruence`, test (necessary condition of GSWZ (39), `N = m = 1`, `p` odd):
the pole is at most simple and every coefficient is `p` times a `p`-adic integer. -/
theorem dworkDiff_pIntegral (a : ℤ) (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (j : ℕ) (r : ℤ) :
    (r < -1 → (coeff j (dworkDiff a p)).coeff r = 0) ∧
      ‖(((coeff j (dworkDiff a p)).coeff r / p : ℚ) : ℚ_[p])‖ ≤ 1 := by sorry

/-- The pole is really there: the `x⁻¹` coefficient at `t¹` is `-p` for `a = 1`
(rules out the reading `p·x`). -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) : (coeff 1 (dworkDiff 1 p)).coeff (-1) = -p := by sorry

/-! ### The coefficient ring, its Frobenius and the specialisation (rank one) -/

/-- `ℤ[t^{±1}]`-algebra `ℤ[t^{±1}][z]/(1 - z - (-1)^a t z^a)` before inverting `z`, `δ`,
adjoining `δ^{-1/2}`. -/
noncomputable def nahmRingPre (a : ℕ) : Type :=
  AdjoinRoot (1 - Polynomial.X - Polynomial.C ((-1) ^ a * LaurentPolynomial.T 1) * Polynomial.X ^ a :
    Polynomial (LaurentPolynomial ℤ))

/-- `HB.9/frobenius-on-the-coefficient-ring`: the Frobenius lift on the `p`-adic completion of the
coefficient ring (`S` with `δ`, `z` inverted and `δ^{-1/2}` adjoined), `t ↦ t^p`. -/
noncomputable def frobeniusCoeff (S : Type) [CommRing S] (p : ℕ) :
    AdicCompletion (Ideal.span {(p : S)}) S →+* AdicCompletion (Ideal.span {(p : S)}) S := sorry

-- test `frobeniusCoeff_congr` (compatibility): the case `A = (3)`, `p = 7` of the lemma below.
theorem frobeniusCoeff_sub_pow_mem (S : Type) [CommRing S] (p : ℕ)
    (s : AdicCompletion (Ideal.span {(p : S)}) S) :
    frobeniusCoeff S p s - s ^ p ∈
      Ideal.span {(p : AdicCompletion (Ideal.span {(p : S)}) S)} := by sorry

/-- `HB.9/specialisation-at-one`, test (A = (3)): `(2z²+3z-9)·δ = 27t - 4` over `ℚ(t)`. -/
example :
    let P : Polynomial (RatFunc ℚ) := Polynomial.C RatFunc.X * Polynomial.X ^ 3 - Polynomial.X + 1
    let z : AdjoinRoot P := AdjoinRoot.root P
    let t : AdjoinRoot P := AdjoinRoot.of P RatFunc.X
    (2 * z ^ 2 + 3 * z - 9) * (-t * z ^ 2 - t * z + 1 - 3 * t) = 27 * t - 4 := by sorry

/-- `HB.10/cubic-example`, test, and test `specOne_cubic_delta` (computation) of `HB.9/specialisation-at-one`:
at `t = 1`, `(2z²+3z-9)·δ = 23` with `δ = -z²-z-2`, so `1/δ = (2z²+3z-9)/23`. -/
example :
    let P : Polynomial ℚ := Polynomial.X ^ 3 - Polynomial.X + 1
    let z : AdjoinRoot P := AdjoinRoot.root P
    (2 * z ^ 2 + 3 * z - 9) * (-z ^ 2 - z - 2) = 23 := by sorry

/-- `HB.10/cubic-example`, test: the field has discriminant `-23`. -/
theorem discr_cubic (K : Type*) [Field K] [NumberField K] (z : K) (hz : z ^ 3 - z + 1 = 0)
    (hgen : IntermediateField.adjoin ℚ {z} = ⊤) : NumberField.discr K = -23 := by sorry

/-- `HB.10/nonabelian-quartic-example`, test: the Nahm equations (256) hold on the first orbit (257). -/
example :
    let P : Polynomial ℚ := Polynomial.X ^ 4 + Polynomial.X ^ 3 + 3 * Polynomial.X ^ 2 - 3 * Polynomial.X - 1
    let z₁ : AdjoinRoot P := AdjoinRoot.root P
    let z₂ : AdjoinRoot P := AdjoinRoot.of P (1 / 5 : ℚ) * (-9 * z₁ ^ 3 - 6 * z₁ ^ 2 - 25 * z₁ + 37)
    1 - z₁ = z₁ ^ 8 * z₂ ^ 5 ∧ 1 - z₂ = z₁ ^ 5 * z₂ ^ 4 := by sorry

/-- `HB.10/nonabelian-quartic-example`, test: the field discriminant is `-5²·19`, not `-5⁴·19`. -/
theorem discr_quartic (F : Type*) [Field F] [NumberField F] (z : F)
    (hz : z ^ 4 + z ^ 3 + 3 * z ^ 2 - 3 * z - 1 = 0)
    (hgen : IntermediateField.adjoin ℚ {z} = ⊤) : NumberField.discr F = -475 := by sorry

/-- `HB.10/knot-series-pair-example`, test: `-24α²+32α-26 = -2(2α²-2α+3)²` (GSWZ (280) is false). -/
example :
    let P : Polynomial ℚ := Polynomial.X ^ 3 - Polynomial.X ^ 2 + 1
    let α : AdjoinRoot P := AdjoinRoot.root P
    32 * α - 24 * α ^ 2 - 26 = -2 * (2 * α ^ 2 - 2 * α + 3) ^ 2 := by sorry

/-- `HB.10/modularity-examples-and-their-lesson`, test (289). -/
theorem gaussSum_normSq (m : ℕ) [NeZero m] :
    (1 / (m : ℂ)) * (∑ k : ZMod m, Complex.exp (2 * Real.pi * Complex.I * (k.val ^ 2 : ℕ) / m)) *
      (∑ k : ZMod m, Complex.exp (-2 * Real.pi * Complex.I * (k.val ^ 2 : ℕ) / m)) =
      if m % 4 = 2 then 0 else if m % 4 = 0 then 2 else 1 := by sorry

/-- (290) corrected: the value is `-½(1+i^{-m})²`, i.e. `-2` when `4 ∣ m`. -/
theorem gaussSum_sq (m : ℕ) [NeZero m] :
    (Complex.I / m) * (∑ k : ZMod m, Complex.exp (2 * Real.pi * Complex.I * (k.val ^ 2 : ℕ) / m)) ^ 2 =
      -(1 / 2) * (1 + Complex.I ^ (-(m : ℤ))) ^ 2 := by sorry

/-- `HB.10/figure-eight-example`, test: `δ = (2 - ζ₆)/ζ₆` squares to `-3`. -/
example (ζ : ℂ) (hζ : ζ ^ 2 - ζ + 1 = 0) : ((2 - ζ) / ζ) ^ 2 = -3 := by sorry

/-! ### HB.9–HB.10 items without a Lean form here

The Habiro ring `H_R` and its K₃-indexed modules `H_{R,ξ}` (HabiroNumberFields HB.6, HB.7), the units
`ε_m(ξ)` (HabiroNumberFields HB.2) and the p-adic dilogarithm `D_p` (PadicHodgeRegulators D.1) are not in the
pinned libraries, and the presentation of `S` (HB.8's `ringS`) is left abstract; the items below need them. -/

-- frobeniusCoeff_t: not stated; needs the elements `t^{1/m}` and `ζ_m` of the completion of `S^{(m)}[z^{1/m}]`.
-- frobeniusCoeff_unique: not stated; needs frobeniusCoeff_t.
-- frobeniusCoeff_embed: not stated; needs the embedding `ι` of `S` into `ℚ(ζ_m)⟦t^{1/m}⟧`.
-- frobeniusCoeff_z: not stated; needs the element `z` of the completed ring.
-- frobeniusCoeff_specOne: not stated; needs specOne.
-- Test frobeniusCoeff_A_zero: not stated; needs the presentation of `S` for `A = 0`.
-- Test frobeniusCoeff_z_series: not stated; needs frobeniusCoeff_embed.
-- Test frobeniusCoeff_not_id: not stated; needs frobeniusCoeff_t.
-- specOne: not stated; needs `R[δ^{-1/2}]` of HB.3/general-nondegenerate-class and the presentation of `S`.
-- specOne_level: not stated; needs specOne.
-- specOne_z: not stated; needs specOne.
-- specOne_frobenius: not stated; needs specOne and frobeniusCoeff.
-- specOne_galois: not stated; needs specOne_level.
-- Test specOne_zero: not stated; needs specOne.
-- Test specOne_needs_sqrt: not stated; needs specOne.
-- descendant: not stated; needs the collection `f_{A,z}` of HB.9/module-membership, valued in `δ^{-1/2}ε_m(ξ)^{1/m}K[ζ_m]⟦x⟧`.
-- descendant_zero: not stated; needs descendant.
-- descendant_constantCoeff: not stated; needs descendant.
-- descendant_mem: not stated; needs descendant and `H_{R,ξ}` (HabiroNumberFields HB.7).
-- descendant_nahmSum: not stated; needs descendant and the asymptotic series of HB.4.
-- Test descendant_nu_zero: not stated; needs descendant.
-- Test descendant_cubic_constant: not stated; needs descendant.
-- Test descendant_not_ring_map: not stated; needs specOne.
-- Test descendant_quartic_integrality: not stated; needs descendant.
-- HB.9/descendants-by-specialisation: the items above.
-- HB.9/dwork-difference-for-the-gaussian-data: not stated; needs HB.8's Gaussian collection and `S_p`.
-- HB.9/habiro-module-interface: a comparison with HabiroNumberFields HB.6/HB.7; nothing new is stated.
-- HB.9/constant-term-is-the-unit: not stated; needs `ε_m(ξ)` (HabiroNumberFields HB.2) and the collection.
-- HB.9/gluing-by-uniqueness-of-q-difference-solutions: not stated; needs `H_R` (HabiroNumberFields HB.6).
-- HB.9/potential-and-the-p-adic-dilogarithm: not stated; needs `D_p` (PadicHodgeRegulators D.1) and specOne.
-- HB.9/module-membership: not stated; needs `H_{R,ξ}` (HabiroNumberFields HB.7) and the collection (GSWZ Theorem 5).
-- HB.9/p-adic-regulator-input: a comparison with PadicHodgeRegulators D.3/D.4; nothing new is stated.
-- HB.9/torsion-powers-lie-in-the-ring: not stated; needs `H_R` and the Bloch class (GSWZ Corollary 1.11(b)).
-- HB.9/bloch-torsion-converse: not stated; needs `H_R` and the Bloch class.
-- HB.9/hypotheses-that-cannot-be-dropped: records non-implications; nothing is stated.
-- HB.9/verifying-the-defining-conditions: a comparison with HabiroNumberFields HB.7's conditions; nothing new.
-- HB.9/constant-terms-of-the-series: not stated; needs the collection and `ε_m(ξ)`.
-- HB.9/symmetrisation-lies-in-the-ring: not stated; needs `H_{R[δ^{-1}]}` (GSWZ Corollary 1.11(a)).
-- HB.10/symmetrisation-and-residue-formula: not stated; needs the residue collection of GSWZ Theorem 11.
-- HB.10/descendant-elements-of-the-habiro-ring: not stated; needs descendant and `H_R` (GSWZ Theorem 12).
-- HB.10/knot-matrices-and-the-topological-boundary records formal Nahm data and module membership.
-- QT.5 supplies triangulations/gluing and owns the manifold-volume comparison. QT.6 owns the
-- full Neumann-Zagier datum, knot-series identification and triangulation/choice invariance;
-- QT.7 owns quantum modularity. Neither QT.6 nor QT.7 is a prerequisite of this formal node.
-- A_4_1 = !![1, 1; 1, 1] kills (1,-1), so HB.4's positive-definite analytic theorem does not
-- apply. The HB.8 formal route uses the non-degenerate Hessian at the chosen solution.
-- HB.10/p-adic-computations-example: an application; its factorisation of `α³ - α² + 1` modulo 5 is not stated.
-- HB.10/export-interfaces-and-non-consequences: no new theorem is asserted by this interface.
-- QT.6 imports HB.4/euler-maclaurin-with-remainder, formal-gaussian-integration and
-- radial-asymptotic-expansion (positive-definite analytic data, stated root-order/branch
-- hypotheses), or HB.8/fgi-collection and identification-theorem (formal non-degenerate data),
-- then HB.9/module-membership with its excluded primes and coefficient ring. QT.6 owns the
-- Dimofte-Garoufalidis/state-integral comparison, contours, Faddeev function and 2-3 invariance.
-- Habiro-module membership alone proves none of those topological/analytic assertions.
-- Use HB.8/refinement-gaussian-identification with its G1 prefactor and G2 regularity
-- obligations; the historical identification-theorem is not an unconditional export.
-- HB.9 retains signed Kummer-orientation and all-order integral-gluing obligations, and
-- HB.4's coefficient-field clause needs coefficientwise Kummer descent. The figure-eight
-- regulator computation is numerical; QT.5 owns its comparison with manifold volume.

end HabiroNahmSeries.HB910

end PartHB910

/-! ## HB.9: reviewed refinements -/

noncomputable section AssemblyHB9

namespace TauCeti.HabiroNahmHB9

open scoped BigOperators

section Transfer
variable {S T : Type*} [CommRing S] [CommRing T] [IsDomain T]

/-- Divisibility at the first power is an explicit hypothesis, not a consequence
of étaleness. This is applied separately to a jointly faithful set of factors. -/
theorem saturation_transfer (ι : S →+* T) (p : S) (hp : ι p ≠ 0)
    (hsat : ∀ a : S, (∃ b : T, ι a = ι p * b) → ∃ c : S, a = p * c)
    (n : ℕ) (a : S) (b : T) (hab : ι a = (ι p) ^ n * b) :
    ∃ c : S, a = p ^ n * c := by
  sorry

-- followup-branch-loss: the full algebra has two square-root factors.
example (z T : ZMod 5) (h : T ^ 2 = z ^ 4) :
    T = z ^ 2 ∨ T = -(z ^ 2) := by
  sorry

example (z : ZMod 5) (hz : z ≠ 0) :
    z ^ 2 - (-(z ^ 2)) ≠ 0 := by
  sorry

example (z : ZMod 5) : (z ^ 2) - z ^ 2 = 0 := by
  sorry
end Transfer

section FirstJet
variable {I L E : Type*} [Fintype I] [Field L] [CharZero L]
    [Field E] [CharZero E]

/-- The finite contraction polynomial for diagonal cubic/quartic vertices.
The covariance is Λ⁻¹, rather than its negative. -/
def gaussianFirstJet (C : I → I → L) (b Q T U : I → L) (c : L) : L :=
  c + (1 / 2 : L) * (∑ i, Q i * C i i)
    + (1 / 2 : L) * (∑ i, ∑ j, b i * b j * C i j)
    + (1 / 2 : L) * (∑ i, ∑ j, T i * b j * C i i * C i j)
    + (1 / 8 : L) * (∑ i, U i * (C i i) ^ 2)
    + (1 / 8 : L) * (∑ i, ∑ j, T i * T j * C i i * C j j * C i j)
    + (1 / 12 : L) * (∑ i, ∑ j, T i * T j * (C i j) ^ 3)

theorem gaussianFirstJet_map (f : L →+* E) (C : I → I → L)
    (b Q T U : I → L) (c : L) :
    f (gaussianFirstJet C b Q T U c) =
      gaussianFirstJet (fun i j => f (C i j)) (fun i => f (b i))
        (fun i => f (Q i)) (fun i => f (T i)) (fun i => f (U i)) (f c) := by
  sorry

theorem gaussianFirstJet_zero_covariance (b Q T U : I → L) (c : L) :
    gaussianFirstJet (fun _ _ => 0) b Q T U c = c := by
  sorry

theorem gaussianFirstJet_integral (O : Subring L)
    (h2 : (2 : L)⁻¹ ∈ O) (h3 : (3 : L)⁻¹ ∈ O)
    (C : I → I → L) (b Q T U : I → L) (c : L)
    (hC : ∀ i j, C i j ∈ O) (hb : ∀ i, b i ∈ O) (hQ : ∀ i, Q i ∈ O)
    (hT : ∀ i, T i ∈ O) (hU : ∀ i, U i ∈ O) (hc : c ∈ O) :
    gaussianFirstJet C b Q T U c ∈ O := by
  sorry

-- gaussianFirstJet_linear
example : gaussianFirstJet (I := Fin 1) (L := ℚ) (fun _ _ => 1)
    (fun _ => 1) (fun _ => 0) (fun _ => 0) (fun _ => 0) 0 = 1 / 2 := by
  sorry

-- gaussianFirstJet_cubic
example : gaussianFirstJet (I := Fin 1) (L := ℚ) (fun _ _ => 1)
    (fun _ => 0) (fun _ => 0) (fun _ => 1) (fun _ => 0) 0 = 5 / 24 := by
  sorry

-- gaussianFirstJet_quartic
example : gaussianFirstJet (I := Fin 1) (L := ℚ) (fun _ _ => 1)
    (fun _ => 0) (fun _ => 0) (fun _ => 0) (fun _ => 1) 0 = 1 / 8 := by
  sorry

-- gaussianFirstJet_empty
example (C : Fin 0 → Fin 0 → L) (b Q T U : Fin 0 → L) (c : L) :
    gaussianFirstJet C b Q T U c = c := by
  sorry

-- gaussianFirstJet_mixed: the cubic-linear term contributes 1/2.
example : gaussianFirstJet (I := Fin 1) (L := ℚ) (fun _ _ => 1)
    (fun _ => 1) (fun _ => 0) (fun _ => 1) (fun _ => 0) 0 = 29 / 24 := by
  sorry
end FirstJet

section Auxiliary
variable {I L E : Type*} [Fintype I] [DecidableEq I]
    [Field L] [Field E]

/-- Rescale before expanding. For γ=2 the coefficient scale is q^(2μ),
not q^(4μ). F⁺ and F⁻ are the imported F_A at q^γ and q⁻¹. -/
def auxiliaryProduct (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries I L :=
  (∏ i : Fin γ, MvPowerSeries.expand γ hγ
    (MvPowerSeries.rescale (fun j => (q : L) ^ ((γ : ℤ) * μ i j)) Fp)) *
    MvPowerSeries.rescale (fun j => (q : L) ^ (-ν j)) Fm

theorem auxiliaryProduct_constantCoeff (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries.constantCoeff (auxiliaryProduct q γ hγ Fp Fm μ ν) =
      (MvPowerSeries.constantCoeff Fp) ^ γ * MvPowerSeries.constantCoeff Fm := by
  sorry

theorem auxiliaryProduct_one (q : Lˣ) (Fp Fm : MvPowerSeries I L)
    (μ : Fin 1 → I → ℤ) (ν : I → ℤ) :
    auxiliaryProduct q 1 (by decide) Fp Fm μ ν =
      MvPowerSeries.rescale (fun j => (q : L) ^ (μ 0 j)) Fp *
        MvPowerSeries.rescale (fun j => (q : L) ^ (-ν j)) Fm := by
  sorry

theorem auxiliaryProduct_covariance (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) (j : I) :
    MvPowerSeries.rescale (fun l => if l = j then (q : L) else 1)
      (auxiliaryProduct q γ hγ Fp Fm μ ν) =
      auxiliaryProduct q γ hγ Fp Fm
        (μ + fun _ => Pi.single j 1) (ν - Pi.single j 1) := by
  sorry

theorem auxiliaryProduct_map (f : L →+* E) (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries.map f (auxiliaryProduct q γ hγ Fp Fm μ ν) =
      auxiliaryProduct (Units.map f.toMonoidHom q) γ hγ
        (MvPowerSeries.map f Fp) (MvPowerSeries.map f Fm) μ ν := by
  sorry

-- auxiliaryProduct_units
example (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    auxiliaryProduct q γ hγ (1 : MvPowerSeries I L) 1 μ ν = 1 := by
  sorry

-- auxiliaryProduct_gamma_two
example : auxiliaryProduct (I := Fin 1) (Units.mk0 (2 : ℚ) (by decide))
    2 (by decide) (MvPowerSeries.X 0) 1 (fun _ _ => 1) (fun _ => 0) =
    MvPowerSeries.C 16 * (MvPowerSeries.X 0) ^ 4 := by
  sorry

-- auxiliaryProduct_inverse_shift
example : auxiliaryProduct (I := Fin 1) (Units.mk0 (2 : ℚ) (by decide))
    1 (by decide) 1 (MvPowerSeries.X 0) (fun _ _ => 0) (fun _ => 1) =
    MvPowerSeries.C (1 / 2 : ℚ) * MvPowerSeries.X 0 := by
  sorry

-- auxiliaryProduct_two_coordinates
example : auxiliaryProduct (I := Fin 2) (Units.mk0 (2 : ℚ) (by decide))
    1 (by decide) (MvPowerSeries.X 0 + MvPowerSeries.X 1) 1
    (fun _ j => if j = 0 then 1 else -1) (fun _ => 0) =
    MvPowerSeries.C 2 * MvPowerSeries.X 0 +
      MvPowerSeries.C (1 / 2 : ℚ) * MvPowerSeries.X 1 := by
  sorry

-- auxiliaryProduct_covariance_test
example : MvPowerSeries.rescale (fun _ : Fin 1 => (2 : ℚ))
    (auxiliaryProduct (Units.mk0 (2 : ℚ) (by decide)) 2 (by decide)
      (MvPowerSeries.X 0) 1 (fun _ _ => 0) (fun _ => 0)) =
    auxiliaryProduct (Units.mk0 (2 : ℚ) (by decide)) 2 (by decide)
      (MvPowerSeries.X 0) 1 (fun _ _ => 1) (fun _ => 0) := by
  sorry

/-- The positive and negative recurrences are explicit assumptions on the imported
series. No unavailable `NahmSeries` object is represented by theorem fields. -/
theorem auxiliary_product_system (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (A : I → I → ℤ) (Fp Fm : MvPowerSeries I L)
    (hp : ∀ j, Fp - MvPowerSeries.rescale
      (fun l => if l = j then (q : L) ^ γ else 1) Fp =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ ((γ : ℤ) * A j j)) *
        MvPowerSeries.X j * MvPowerSeries.rescale
          (fun l => (q : L) ^ ((γ : ℤ) * A l j)) Fp)
    (hm : ∀ j, Fm - MvPowerSeries.rescale
      (fun l => if l = j then (q : L)⁻¹ else 1) Fm =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-A j j)) *
        MvPowerSeries.X j * MvPowerSeries.rescale
          (fun l => (q : L) ^ (-A l j)) Fm)
    (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    (∀ i j, auxiliaryProduct q γ hγ Fp Fm μ ν -
      auxiliaryProduct q γ hγ Fp Fm (μ + Pi.single i (Pi.single j 1)) ν =
      MvPowerSeries.C ((-1 : L) ^ (A j j) *
        (q : L) ^ ((γ : ℤ) * (A j j + μ i j))) *
        (MvPowerSeries.X j) ^ γ *
          auxiliaryProduct q γ hγ Fp Fm (μ + Pi.single i (fun l => A l j)) ν) ∧
    (∀ j, auxiliaryProduct q γ hγ Fp Fm μ ν -
      auxiliaryProduct q γ hγ Fp Fm μ (ν + Pi.single j 1) =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-(A j j + ν j))) *
        MvPowerSeries.X j *
          auxiliaryProduct q γ hγ Fp Fm μ (ν + fun l => A l j)) := by
  sorry

/-- Total-degree induction: the first two equations remove parameter dependence,
and covariance kills each positive-degree coefficient. -/
theorem auxiliary_product_unique (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (A : I → I → ℤ)
    (G H : (Fin γ → I → ℤ) → (I → ℤ) → MvPowerSeries I L)
    (hq : ∀ n : ℕ, 0 < n → (q : L) ^ n ≠ 1)
    (hzero : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν, MvPowerSeries.constantCoeff (F μ ν) = 1)
    (hplus : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν i j,
      F μ ν - F (μ + Pi.single i (Pi.single j 1)) ν =
        MvPowerSeries.C ((-1 : L) ^ (A j j) *
          (q : L) ^ ((γ : ℤ) * (A j j + μ i j))) *
          (MvPowerSeries.X j) ^ γ * F (μ + Pi.single i (fun l => A l j)) ν)
    (hminus : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν j,
      F μ ν - F μ (ν + Pi.single j 1) =
        MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-(A j j + ν j))) *
          MvPowerSeries.X j * F μ (ν + fun l => A l j))
    (hcov : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν j,
      MvPowerSeries.rescale (fun l => if l = j then (q : L) else 1) (F μ ν) =
        F (μ + fun _ => Pi.single j 1) (ν - Pi.single j 1)) :
    G = H := by
  sorry
end Auxiliary

section UnpoweredAuxiliary
variable {I L E : Type*} [Fintype I] [DecidableEq I] [Field L] [Field E]

/-- The original unpowered product, whose common volume cancels.
Its covariance uses q^γ; inserting t^γ would change that volume. -/
def unpoweredAuxiliaryProduct (q : Lˣ) (γ : ℕ)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries I L :=
  (∏ i : Fin γ, MvPowerSeries.rescale
    (fun j => (q : L) ^ ((γ : ℤ) * μ i j)) Fp) *
    MvPowerSeries.rescale (fun j => (q : L) ^ (-ν j)) Fm

theorem unpoweredAuxiliaryProduct_constantCoeff (q : Lˣ) (γ : ℕ)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries.constantCoeff (unpoweredAuxiliaryProduct q γ Fp Fm μ ν) =
      (MvPowerSeries.constantCoeff Fp) ^ γ * MvPowerSeries.constantCoeff Fm := by
  sorry

theorem unpoweredAuxiliaryProduct_covariance (q : Lˣ) (γ : ℕ)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) (j : I) :
    MvPowerSeries.rescale (fun l => if l = j then (q : L) ^ γ else 1)
      (unpoweredAuxiliaryProduct q γ Fp Fm μ ν) =
      unpoweredAuxiliaryProduct q γ Fp Fm
        (μ + fun _ => Pi.single j 1) (ν - (γ : ℤ) • Pi.single j 1) := by
  sorry

theorem unpoweredAuxiliaryProduct_map (f : L →+* E) (q : Lˣ) (γ : ℕ)
    (Fp Fm : MvPowerSeries I L) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    MvPowerSeries.map f (unpoweredAuxiliaryProduct q γ Fp Fm μ ν) =
      unpoweredAuxiliaryProduct (Units.map f.toMonoidHom q) γ
        (MvPowerSeries.map f Fp) (MvPowerSeries.map f Fm) μ ν := by
  sorry

-- unpoweredAuxiliaryProduct_gamma_two: t² distinguishes it from t⁴.
example : unpoweredAuxiliaryProduct (I := Fin 1)
    (Units.mk0 (2 : ℚ) (by decide)) 2
    (MvPowerSeries.X 0) 1 (fun _ _ => 1) (fun _ => 0) =
    MvPowerSeries.C 16 * (MvPowerSeries.X 0) ^ 2 := by
  sorry

-- unpoweredAuxiliaryProduct_units
example (q : Lˣ) (γ : ℕ) (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    unpoweredAuxiliaryProduct q γ (1 : MvPowerSeries I L) 1 μ ν = 1 := by
  sorry

-- unpoweredAuxiliaryProduct_inverse_shift
example : unpoweredAuxiliaryProduct (I := Fin 1)
    (Units.mk0 (2 : ℚ) (by decide)) 1
    1 (MvPowerSeries.X 0) (fun _ _ => 0) (fun _ => 1) =
    MvPowerSeries.C (1 / 2 : ℚ) * MvPowerSeries.X 0 := by
  sorry

/-- The positive and negative recurrences are explicit assumptions on the imported
series. No unavailable `NahmSeries` object is represented by theorem fields. -/
theorem unpowered_product_system (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (A : I → I → ℤ) (Fp Fm : MvPowerSeries I L)
    (hp : ∀ j, Fp - MvPowerSeries.rescale
      (fun l => if l = j then (q : L) ^ γ else 1) Fp =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ ((γ : ℤ) * A j j)) *
        MvPowerSeries.X j * MvPowerSeries.rescale
          (fun l => (q : L) ^ ((γ : ℤ) * A l j)) Fp)
    (hm : ∀ j, Fm - MvPowerSeries.rescale
      (fun l => if l = j then (q : L)⁻¹ else 1) Fm =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-A j j)) *
        MvPowerSeries.X j * MvPowerSeries.rescale
          (fun l => (q : L) ^ (-A l j)) Fm)
    (μ : Fin γ → I → ℤ) (ν : I → ℤ) :
    (∀ i j, unpoweredAuxiliaryProduct q γ Fp Fm μ ν -
      unpoweredAuxiliaryProduct q γ Fp Fm (μ + Pi.single i (Pi.single j 1)) ν =
      MvPowerSeries.C ((-1 : L) ^ (A j j) *
        (q : L) ^ ((γ : ℤ) * (A j j + μ i j))) *
        MvPowerSeries.X j *
          unpoweredAuxiliaryProduct q γ Fp Fm (μ + Pi.single i (fun l => A l j)) ν) ∧
    (∀ j, unpoweredAuxiliaryProduct q γ Fp Fm μ ν -
      unpoweredAuxiliaryProduct q γ Fp Fm μ (ν + Pi.single j 1) =
      MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-(A j j + ν j))) *
        MvPowerSeries.X j *
          unpoweredAuxiliaryProduct q γ Fp Fm μ (ν + fun l => A l j)) := by
  sorry

/-- Total-degree induction: the first two equations remove parameter dependence,
and q^γ covariance kills each positive-degree coefficient. -/
theorem unpowered_product_unique (q : Lˣ) (γ : ℕ) (hγ : γ ≠ 0)
    (A : I → I → ℤ)
    (G H : (Fin γ → I → ℤ) → (I → ℤ) → MvPowerSeries I L)
    (hq : ∀ n : ℕ, 0 < n → (q : L) ^ n ≠ 1)
    (hzero : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν, MvPowerSeries.constantCoeff (F μ ν) = 1)
    (hplus : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν i j,
      F μ ν - F (μ + Pi.single i (Pi.single j 1)) ν =
        MvPowerSeries.C ((-1 : L) ^ (A j j) *
          (q : L) ^ ((γ : ℤ) * (A j j + μ i j))) *
          MvPowerSeries.X j * F (μ + Pi.single i (fun l => A l j)) ν)
    (hminus : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν j,
      F μ ν - F μ (ν + Pi.single j 1) =
        MvPowerSeries.C ((-1 : L) ^ (A j j) * (q : L) ^ (-(A j j + ν j))) *
          MvPowerSeries.X j * F μ (ν + fun l => A l j))
    (hcov : ∀ F ∈ ({G, H} : Set ((Fin γ → I → ℤ) → (I → ℤ) →
      MvPowerSeries I L)), ∀ μ ν j,
      MvPowerSeries.rescale (fun l => if l = j then (q : L) ^ γ else 1) (F μ ν) =
        F (μ + fun _ => Pi.single j 1) (ν - (γ : ℤ) • Pi.single j 1)) :
    G = H := by
  sorry
end UnpoweredAuxiliary

section PotentialSign
variable {I L : Type*} [Fintype I] [Field L] [CharZero L]

/-- An algebraic consequence of the actual reflection and Nahm logarithm
identities. It does not define a substitute p-adic dilogarithm. -/
theorem coleman_potential_sign (A : I → I → ℤ) (z : I → L)
    (li₂ log : L → L)
    (hreflect : ∀ j, li₂ (z j) + li₂ (1 - z j) =
      -log (z j) * log (1 - z j))
    (hnahm : ∀ j, log (1 - z j) = ∑ i, (A i j : L) * log (z i)) :
    -(∑ j, li₂ (1 - z j)) - (1 / 2 : L) *
      (∑ i, ∑ j, (A i j : L) * log (z i) * log (z j)) =
    ∑ j, (li₂ (z j) + (1 / 2 : L) * log (z j) * log (1 - z j)) := by
  sorry
end PotentialSign

/-!
Named omissions, as required by PROTOCOL §13. These cannot yet be stated against
the pins because their mathematical carriers are imported planning nodes.

* followup-regularisation-jet / regularisation_jet:
  The actual fgiFactor and the Gaussian weight completion are from
  HabiroNahmSeries:HB.8/fgi-collection. Correct the pole to
  Li₂(θ^m)/(m²h)+Li₁(θ^m)w/(mh)+Li₀(θ^m)w²/(2h), with the constant-log sign
  fixed in E64. These are identities of the imported logarithmic expansion,
  not signatures for an invented function. B₁ and B₂ keep their Mathlib meanings.

* followup-refined-linear-integrality / refined_linear_integrality:
  For the principal-part-free refined Ω piece, normalize by its nonzero
  individual constant, then coeff 1 = ζ_m⁻¹ * gaussianFirstJet C b Q T₃ U₄ c
  in the full local coefficient algebra, with c including N/24 and the finite
  Pochhammer jet. The exact data are in the packet and reader. Missing carriers:
  corrected fgiRefined, S_p^(m), the Kummer torsor and B_p[ζ_m]. A possibly zero
  sum of constants is never inverted. E64/E65 must be reconciled at all orders
  by the HB.8 owner before this is used with identification.

* followup-modified-potential-formula / modified_potential_formula:
  W_p = p Σℓ₂(y_j) + p Σβ_jℓ₁(y_j) − pηᵗAη/2
        − Σ_j Σ_(r≥2) p^(r−1)β_j^r Li_(2−r)(y_j^p)/r! ∈ pS_p.
  Missing carriers are the actual completed coefficient algebra and its lifted
  Frobenius, and integralModifiedPolylog from ColemanIntegration L2. No general
  logarithm on S_p units is postulated; η is the log of φ(z)/z^p in 1+pS_p.

* followup-regulator-specialisation / regulator_specialisation:
  specOne(W_p)=φ_p(D_p ξ)/p−pD_p ξ, with ξ=Σ[z_j]. The exact main theorem uses
  actual Coleman functions, K₃/Bloch classes, Frobenius and specOne. These are
  imported HB.3/HB.6/HB.8/HB.9 and requested D.1/D.3/D.4 objects. The preceding
  typed lemma supplies its algebraic sign reduction, without pretending that
  an arbitrary function is the Coleman dilogarithm.

* followup-integral-gluing-contract / integral_product_gluing:
  The actual unpowered Gaussian auxiliary product is required to have integral coefficients in
  S^(m)[1/(Δγ)][[x]], at primes p∤Δγ, and satisfies the HB.6 coefficient-Frobenius root gluing on
  all components. The family is identified using unpowered_product_unique;
  integrality and the faithful coefficient model are separate recorded gaps.
  The imported all-root-order symmetrization and torsion-power corollaries also
  need the separate Corollary 1.11 extension argument recorded in
  G-all-order-gluing; membership restricted to orders prime to Δ does not
  supply that argument.

* followup-kummer-orientation-contract / gaussian_constant_kummer_comparison:
  Match the full corrected U_m(1) with the fixed ε_m=c_ζ², including the inverse
  cyclic prefactor, monomials and k-sum. Missing carriers are HB.2's actual
  Kummer quotient/torsor and signed finite Chern comparison. Do not choose the
  sign by imposing the desired answer as a field of a structure.

* followup-etale-module-contract / etale_habiro_membership:
  Extend the existing HB.7 indexed module to B=R[T]/(δT²−1) and full finite
  products, prove actual Kummer descent, and consume its effective global descent.
  No private HabiroModule is defined here. The imported theorem names
  frobeniusCongruence and moduleMembership remain at their accepted owner IDs.
  They are omitted as Lean signatures until the actual completed S and indexed
  H_(B,ξ)|_Δ objects exist. Theorems 4 and 5 retain every hypothesis in the reader.

* followup-descendant-pullback-contract / descendant_etale_pullback:
  Use t_j^(1/m)=q^ν_j, hence t_j=q^(mν_j), and the unique formal étale lift at
  the selected t=1 point. Its logarithmic derivative is Λ⁻¹(mν/ζ_m).
  Missing carriers are HB.8's actual formal étale coefficient algebra, its
  completed lift and the indexed-module pullback/gluing. The ν=0, m=2 ν=1 and
  m=1 ν=−1 acceptance computations are mathematical tests in the reader;
  this node is a comparison, not a replacement descendant definition.

All definition/construction API names and all thirteen named tests of this packet
appear above with real finite-sum/power-series carriers. The unavailable named
results have these explicit omissions instead of dummy Prop-valued fields.
-/

end TauCeti.HabiroNahmHB9

end AssemblyHB9

/-! ## HB.10: reviewed refinements -/

noncomputable section AssemblyHB10

open scoped NumberField
open Finset Module

namespace HabiroNahmExamples

/-- The domain excludes order zero. Each order has a constant Taylor series. -/
def rationalGaussTaylor (m : ℕ+) : PowerSeries ℤ := by sorry

lemma rationalGaussTaylor_eq (m : ℕ+) :
    rationalGaussTaylor m = PowerSeries.C
      (if 4 ∣ (m : ℕ) then (2 : ℤ) else if 2 ∣ (m : ℕ) then 0 else 1) := by sorry

lemma rationalGaussTaylor_coeff_zero (m : ℕ+) :
    PowerSeries.coeff 0 (rationalGaussTaylor m) =
      (if 4 ∣ (m : ℕ) then (2 : ℤ) else if 2 ∣ (m : ℕ) then 0 else 1) := by sorry

lemma rationalGaussTaylor_coeff_succ (m : ℕ+) (n : ℕ) :
    PowerSeries.coeff (n + 1) (rationalGaussTaylor m) = 0 := by sorry

lemma rationalGaussTaylor_map (R : Type*) [CommRing R] (m : ℕ+) :
    PowerSeries.map (Int.castRingHom R) (rationalGaussTaylor m) =
      PowerSeries.C
        (if 4 ∣ (m : ℕ) then (2 : R) else if 2 ∣ (m : ℕ) then 0 else 1) := by sorry

lemma rationalGaussTaylor_gauss_product (m : ℕ+) (ζ : ℂ)
    (hζ : IsPrimitiveRoot ζ (m : ℕ)) :
    PowerSeries.map (Int.castRingHom ℂ) (rationalGaussTaylor m) =
      PowerSeries.C
        (((m : ℕ) : ℂ)⁻¹ *
          (∑ k ∈ range (m : ℕ), ζ ^ (k ^ 2)) *
          (∑ k ∈ range (m : ℕ), ζ ^ (-((k ^ 2 : ℕ) : ℤ)))) := by sorry

-- rationalGaussTaylor_one
example : rationalGaussTaylor 1 = PowerSeries.C 1 := by sorry

-- rationalGaussTaylor_two
example : rationalGaussTaylor 2 = PowerSeries.C 0 := by sorry

-- rationalGaussTaylor_four
example : rationalGaussTaylor 4 = PowerSeries.C 2 := by sorry

-- rationalGaussTaylor_positive_degree
example : PowerSeries.coeff 1 (rationalGaussTaylor 4) = 0 := by sorry

-- rationalGaussTaylor_complex_four
example :
    (∑ k ∈ range 4, Complex.I ^ (k ^ 2)) = 2 + 2 * Complex.I ∧
    (∑ k ∈ range 4, Complex.I ^ (-((k ^ 2 : ℕ) : ℤ))) = 2 - 2 * Complex.I ∧
    (4 : ℂ)⁻¹ * (2 + 2 * Complex.I) * (2 - 2 * Complex.I) = 2 := by sorry

/-- This is the exact constant equality used in every odd-prime gluing square. -/
theorem rationalGaussTaylor_odd_prime (p m : ℕ+)
    (hp : Nat.Prime (p : ℕ)) (hp2 : (p : ℕ) ≠ 2) :
    rationalGaussTaylor (p * m) = rationalGaussTaylor m := by sorry

/-- The m=1 to m=2 equation fails over Z. H_Z itself is an imported carrier. -/
theorem rationalGaussTaylor_two_obstruction :
    PowerSeries.coeff 0 (rationalGaussTaylor 1) ≠
      PowerSeries.coeff 0 (rationalGaussTaylor 2) := by sorry

section Quartic

variable {K L : Type*} [Field K] [CharZero K] [Field L] [CharZero L]

/-- A selected root, with its root equation as input; the vector has two entries. -/
def quarticCoordinates (u : K) (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0) :
    Fin 2 → K := by sorry

lemma quarticCoordinates_zero (u : K)
    (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0) :
    quarticCoordinates u hu 0 = u := by sorry

lemma quarticCoordinates_one (u : K)
    (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0) :
    quarticCoordinates u hu 1 = (-9 * u ^ 3 - 6 * u ^ 2 - 25 * u + 37) / 5 := by sorry

lemma quarticCoordinates_ext (u u' : K)
    (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0)
    (hu' : u' ^ 4 + u' ^ 3 + 3 * u' ^ 2 - 3 * u' - 1 = 0) :
    quarticCoordinates u hu = quarticCoordinates u' hu' ↔ u = u' := by sorry

/-- The image-root proof follows from hu by applying σ; it is an explicit input. -/
lemma quarticCoordinates_map (σ : K →+* L) (u : K)
    (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0)
    (hσu : (σ u) ^ 4 + (σ u) ^ 3 + 3 * (σ u) ^ 2 - 3 * σ u - 1 = 0) :
    (fun i => σ (quarticCoordinates u hu i)) = quarticCoordinates (σ u) hσu := by sorry

-- quarticCoordinates_first_equation
example (u : K) (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0) :
    1 - quarticCoordinates u hu 0 =
      (quarticCoordinates u hu 0) ^ 8 * (quarticCoordinates u hu 1) ^ 5 := by sorry

-- quarticCoordinates_second_equation
example (u : K) (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0) :
    1 - quarticCoordinates u hu 1 =
      (quarticCoordinates u hu 0) ^ 5 * (quarticCoordinates u hu 1) ^ 4 := by sorry

-- quarticCoordinates_missing_five
example (u : K) (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0) :
    quarticCoordinates u hu 1 ≠ -9 * u ^ 3 - 6 * u ^ 2 - 25 * u + 37 := by sorry

-- quarticCoordinates_zero_not_root
example : ¬ ((0 : ℚ) ^ 4 + 0 ^ 3 + 3 * 0 ^ 2 - 3 * 0 - 1 = 0) := by sorry

/-- Exact GSWZ discriminant certificate, including every nonzero denominator. -/
theorem quarticCoordinateCertificate (u : K)
    (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0) :
    let v := quarticCoordinates u hu 1
    let δ := (753 - 505 * u - 124 * u ^ 2 - 186 * u ^ 3) / 5
    1 - u = u ^ 8 * v ^ 5 ∧ 1 - v = u ^ 5 * v ^ 4 ∧
    u ≠ 0 ∧ v ≠ 0 ∧ 1 - u ≠ 0 ∧ 1 - v ≠ 0 ∧ δ ≠ 0 ∧
    δ * ((18 + 45 * u - 44 * u ^ 2 + 9 * u ^ 3) / 475) = 1 ∧
    (1 - u) * (1 - v) * ((8 + u / (1 - u)) * (4 + v / (1 - v)) - 25) =
      δ * u ^ 8 * v ^ 4 := by sorry

end Quartic

/-- The field degree and discriminant are imported facts of the selected orbit. -/
theorem quarticIntegralBasis {F : Type*} [Field F] [NumberField F]
    (u : F) (hu : u ^ 4 + u ^ 3 + 3 * u ^ 2 - 3 * u - 1 = 0)
    (hdegree : Module.finrank ℚ F = 4) (hdiscr : NumberField.discr F = -475) :
    ∃ b : Basis (Fin 4) ℤ (𝓞 F),
      (b 0 : F) = 1 ∧ (b 1 : F) = u ∧ (b 2 : F) = u ^ 2 ∧
      (b 3 : F) = (u ^ 3 - u ^ 2 + 2) / 5 := by sorry

/-- The three ordinary-binomial profiles needed for the corrected q-Lucas numerator.
The Gaussian-polynomial statement is imported from QM.0 and is not invented here. -/
theorem cubicRootConstant_lagrange (z : PowerSeries ℚ)
    (hz0 : PowerSeries.coeff 0 z = 1)
    (hz : z = 1 + PowerSeries.X * z ^ 3) (a : Fin 3) :
    z ^ (a.val + 1) * (PowerSeries.C 3 - PowerSeries.C 2 * z)⁻¹ =
      PowerSeries.mk (fun h => (Nat.choose (3 * h + a.val) h : ℚ)) := by sorry

/-- The cubic delta inverse used for the precise coefficient-ring export. -/
theorem cubicDeltaInverse {K : Type*} [Field K] [CharZero K] (z : K)
    (hz : z ^ 3 - z + 1 = 0) :
    (-z ^ 2 - z - 2) * ((2 * z ^ 2 + 3 * z - 9) / 23) = 1 := by sorry

/-- This is composition of supplied equivalences, with no fake cohomology type. -/
theorem etaleNahmCohomologyExport_apply
    {Hrel HR Hzero : Type*} [CommRing Hrel] [CommRing HR] [CommRing Hzero]
    (κ : Hrel ≃+* HR) (d : Hzero ≃+* Hrel) (s : HR) :
    (κ.symm.trans d.symm) s = d.symm (κ.symm s) := by sorry

/-- Owner naturality squares imply the concrete export preserves Taylor maps. -/
theorem etaleNahmCohomologyExport_taylor
    {Hrel HR Hzero R : Type*}
    [CommRing Hrel] [CommRing HR] [CommRing Hzero] [CommRing R]
    (κ : Hrel ≃+* HR) (d : Hzero ≃+* Hrel)
    (τrel : Hrel →+* PowerSeries R) (τR : HR →+* PowerSeries R)
    (τzero : Hzero →+* PowerSeries R)
    (hκ : ∀ r, τR (κ r) = τrel r)
    (hd : ∀ h, τrel (d h) = τzero h) (s : HR) :
    τzero ((κ.symm.trans d.symm) s) = τR s := by sorry

/-
The complete cubic Laurent symmetrisation, small-prime membership criterion,
rational/cubic cohomology applications, restricted quartic module application,
Picard transport and higher geometric comparison use owner carriers absent
from the pinned libraries. Their exact statements and five proof obligations
are in the packet and reader. No assertion of an all-coefficient gluing proof,
60-torsion K3 lift, or naive-to-algebraic equivalence is made by this file.
-/

end HabiroNahmExamples

end AssemblyHB10
