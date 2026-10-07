/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. Proof placeholders are not implementations. Missing supplier-owned conditions and
partial native comparison signatures are identified by comments and the packet
signatureOmissions fields and the reader's per-node signature boundaries.
Raw-function sketches are not unconditional claims; the nine recorded proof gaps
remain open after the reader revision.
Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/
import Mathlib.LinearAlgebra.QuadraticForm.Basis
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Data.Int.ModEq
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.NumberTheory.ModularForms.JacobiTheta.TwoVariable
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Analysis.Complex.SqrtDeriv
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.Data.ZMod.Basic
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.Analysis.Distribution.SchwartzSpace.Basic


namespace TauCeti.Jacobi.GenusTwo

-- Native integral quadratic forms encode half-integral symmetric matrices.
-- Integral index arithmetic is reused by the analytic constructions below.
local notation "V" => Fin 2 → ℤ
local notation "FData" => QuadraticForm ℤ V × V

/-- Integral shift from BFH (2.9), with a=m/N and c=N^(1-j). -/
def fourierShift (a c : ℤ) (l : V) (p : FData) : FData :=
  (p.1 + c • (a • QuadraticMap.linMulLin (dotProductBilin ℤ ℤ l)
      (dotProductBilin ℤ ℤ l) -
    QuadraticMap.linMulLin (dotProductBilin ℤ ℤ p.2)
      (dotProductBilin ℤ ℤ l)),
   p.2 - (2 * a) • l)

lemma fourierShift_fst_apply (a c : ℤ) (l : V) (p : FData) (x : V) :
    (fourierShift a c l p).1 x =
      p.1 x + c * (a * (l ⬝ᵥ x)^2 - (p.2 ⬝ᵥ x) * (l ⬝ᵥ x)) := by sorry

lemma fourierShift_snd (a c : ℤ) (l : V) (p : FData) :
    (fourierShift a c l p).2 = p.2 - (2 * a) • l := by sorry

lemma fourierShift_zero (a c : ℤ) (p : FData) :
    fourierShift a c 0 p = p := by sorry

lemma fourierShift_add (a c : ℤ) (l k : V) (p : FData) :
    fourierShift a c (l + k) p = fourierShift a c k (fourierShift a c l p) := by sorry

lemma fourierShift_neg (a c : ℤ) (l : V) (p : FData) :
    fourierShift a c (-l) (fourierShift a c l p) = p := by sorry

-- Test: fourierShift_zero_data; j=0 at level N=8 and a=1.
example : fourierShift 1 8 ![1,0] (0,0) =
    (8 • QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2,0]) := by sorry

-- Test: fourierShift_other_cusp; the same shift at j=1 has c=1.
example : fourierShift 1 1 ![1,0] (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2,0]) := by sorry

-- Test: fourierShift_mixed_term; integral x₀x₁ has half-integral matrix entries.
example : fourierShift 1 1 ![0,1]
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, ![1,0]) =
    (QuadraticMap.proj (R := ℤ) (1 : Fin 2) 1, ![1,-2]) := by sorry

/-- The quadratic form represented by BFH's matrix U divided by N. -/
def fourierDiscriminant (a c : ℤ) (p : FData) : QuadraticForm ℤ V :=
  (4 * a) • p.1 - c • QuadraticMap.linMulLin
    (dotProductBilin ℤ ℤ p.2) (dotProductBilin ℤ ℤ p.2)

lemma fourierDiscriminant_apply (a c : ℤ) (p : FData) (x : V) :
    fourierDiscriminant a c p x = 4 * a * p.1 x - c * (p.2 ⬝ᵥ x)^2 := by sorry

lemma fourierDiscriminant_zero (a c : ℤ) :
    fourierDiscriminant a c (0,0) = 0 := by sorry

lemma fourierDiscriminant_zero_vector (a c : ℤ) (Q : QuadraticForm ℤ V) :
    fourierDiscriminant a c (Q,0) = (4 * a) • Q := by sorry

-- Test: fourierDiscriminant_mixed; detects the factor 4 and off-diagonal convention.
example : fourierDiscriminant 1 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, 0) ![1,1] = 4 := by sorry

-- Test: fourierDiscriminant_negative; no positivity condition on Fourier data.
example : fourierDiscriminant 1 8 (0, ![1,0]) ![1,0] = -8 := by sorry

-- Test: fourierDiscriminant_zero_index; a=0 forgets the quadratic form.
example : fourierDiscriminant 0 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) =
    fourierDiscriminant 0 1 (0,0) := by sorry

lemma fourierDiscriminant_shift (a c : ℤ) (l : V) (p : FData) :
    fourierDiscriminant a c (fourierShift a c l p) =
      fourierDiscriminant a c p := by sorry

lemma fourierShift_modEq (a c : ℤ) (l : V) (p : FData) (i : Fin 2) :
    Int.ModEq (2 * a) ((fourierShift a c l p).2 i) (p.2 i) := by sorry

lemma eq_of_fourierDiscriminant_eq (a c : ℤ) (ha : a ≠ 0)
    (p q : FData) (hR : p.2 = q.2)
    (hD : fourierDiscriminant a c p = fourierDiscriminant a c q) :
    p = q := by sorry

lemma fourierShift_injective (a c : ℤ) (ha : a ≠ 0) (p : FData) :
    Function.Injective (fun l : V => fourierShift a c l p) := by sorry

theorem exists_fourierShift_iff (a c : ℤ) (ha : a ≠ 0) (p q : FData) :
    (∃ l : V, fourierShift a c l p = q) ↔
    fourierDiscriminant a c p = fourierDiscriminant a c q ∧
      ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i) := by sorry

theorem existsUnique_fourierRepresentative (a c : ℤ) (ha : a ≠ 0)
    (p : FData) (nu : V) (hnu : ∀ i, Int.ModEq (2 * a) (p.2 i) (nu i)) :
    ∃! Q : QuadraticForm ℤ V,
      fourierDiscriminant a c (Q,nu) = fourierDiscriminant a c p := by sorry

lemma coefficient_eq_of_fourierInvariants {A : Type*} (a c : ℤ) (ha : a ≠ 0)
    (B : FData → A) (hB : ∀ (l : V) (p : FData), B (fourierShift a c l p) = B p)
    (p q : FData) (hD : fourierDiscriminant a c p = fourierDiscriminant a c q)
    (hR : ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i)) : B p = B q := by sorry

-- Acceptance: arbitrary integral c, including zero and negative values.
example (p : FData) (l : V) :
    fourierDiscriminant (-1) 0 (fourierShift (-1) 0 l p) =
      fourierDiscriminant (-1) 0 p := by sorry

-- Acceptance: identical residue does not suffice without discriminant equality.
example : ¬ ∃ l : V, fourierShift 1 1 l (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by sorry

-- Acceptance: at a=0 the orbit criterion is false, even with equal vector data.
example : ¬ ∃ l : V, fourierShift 0 1 l (0,0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by sorry

-- Acceptance: discriminant equality alone cannot distinguish residue classes.
example : fourierDiscriminant 2 1 (0, ![1,0]) =
    fourierDiscriminant 2 1 (0, ![-1,0]) ∧
    ¬ ∃ l : V, fourierShift 2 1 l (0, ![1,0]) = (0, ![-1,0]) := by sorry

#check QuadraticMap.linMulLin
#check QuadraticMap.toQuadraticMap_toBilin
#check Int.modEq_iff_dvd


noncomputable section
open Matrix MeasureTheory
open scoped ComplexConjugate
attribute [local instance] Matrix.normedAddCommGroup Matrix.normedSpace
abbrev IVec := Fin 2 → ℤ
abbrev CVec := Fin 2 → ℂ
abbrev RVec := Fin 2 → ℝ
abbrev M2 (R : Type*) := Matrix (Fin 2) (Fin 2) R
abbrev I4 := Fin 2 ⊕ Fin 2
abbrev M4 (R : Type*) := Matrix I4 I4 R

-- Coordinate helpers, not additional mathematical targets.
def expTwoPi (z : ℂ) : ℂ := Complex.exp (2 * Real.pi * Complex.I * z)
def quad (Z : M2 ℂ) (w : CVec) : ℂ := w ⬝ᵥ (Z *ᵥ w)
def blockA (g : M4 ℝ) : M2 ℂ := fun i j => g (.inl i) (.inl j)
def blockB (g : M4 ℝ) : M2 ℂ := fun i j => g (.inl i) (.inr j)
def blockC (g : M4 ℝ) : M2 ℂ := fun i j => g (.inr i) (.inl j)
def blockD (g : M4 ℝ) : M2 ℂ := fun i j => g (.inr i) (.inr j)
def fractional (g : M4 ℝ) (Z : M2 ℂ) : M2 ℂ :=
  (blockA g * Z + blockB g) * (blockC g * Z + blockD g)⁻¹
def baseMatrix : M2 ℂ := Complex.I • (1 : M2 ℂ)
def baseImage (g : M4 ℝ) : M2 ℂ := fractional g baseMatrix
def symCoords (x : Fin 3 → ℝ) : M2 ℝ := !![x 2, x 1; x 1, x 0]
def unipotent (X : M2 ℝ) : M4 ℝ := Matrix.fromBlocks 1 X 0 1
def ivCast (v : IVec) : CVec := fun i => v i

-- MetaplecticAutomorphicForms:MP.8/siegel-space
abbrev SiegelSpace : Type := {Z : M2 ℂ // Zᵀ = Z ∧ (Z.map Complex.im).PosDef}
lemma siegelSpace_mem (Z : M2 ℂ) : (Zᵀ = Z ∧ (Z.map Complex.im).PosDef) ↔
    ∃ z : SiegelSpace, z.val = Z := by sorry
lemma siegelSpace_im_pos (z : SiegelSpace) : (z.val.map Complex.im).PosDef := by sorry
def siegelSpace_base : SiegelSpace := ⟨baseMatrix, by sorry⟩
-- Test: siegelSpace_diagonal
example : ∃ z : SiegelSpace, z.val = !![Complex.I,0;0,2*Complex.I] := by sorry
-- Test: siegelSpace_real
example : ¬ ∃ z : SiegelSpace, z.val = (1 : M2 ℂ) := by sorry
-- Test: siegelSpace_asymmetric
example : ¬ ∃ z : SiegelSpace, z.val = !![Complex.I,1;0,Complex.I] := by sorry


-- MetaplecticAutomorphicForms:MP.8/positive-similitudes
def positiveSimilitudes : Subgroup ((M4 ℝ)ˣ × ℝˣ) := by sorry
lemma positiveSimilitudes_mem (g : (M4 ℝ)ˣ) (mu : ℝˣ) :
    (g,mu) ∈ positiveSimilitudes ↔ 0 < (mu : ℝ) ∧
      (g : M4 ℝ)ᵀ * Matrix.J (Fin 2) ℝ * (g : M4 ℝ) =
        (mu : ℝ) • Matrix.J (Fin 2) ℝ := by sorry
lemma positiveSimilitudes_multiplier_mul (g h : positiveSimilitudes) :
    ((g*h).val.2 : ℝ) = (g.val.2 : ℝ)*(h.val.2 : ℝ) := by sorry
lemma positiveSimilitudes_symplectic (g : M4 ℝ) :
    gᵀ * Matrix.J (Fin 2) ℝ * g = Matrix.J (Fin 2) ℝ ↔
      g ∈ Matrix.symplecticGroup (Fin 2) ℝ := by sorry
-- Test: positiveSimilitudes_scalar
example : (2 • (1 : M4 ℝ))ᵀ * Matrix.J (Fin 2) ℝ * (2 • (1 : M4 ℝ)) =
    4 • Matrix.J (Fin 2) ℝ := by sorry
-- Test: positiveSimilitudes_reflection
example : ¬ ∃ mu : ℝ, 0 < mu ∧
    (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1))ᵀ * Matrix.J (Fin 2) ℝ *
      (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1)) = mu • Matrix.J (Fin 2) ℝ := by sorry
-- Test: positiveSimilitudes_base_action
example : fractional (2 • (1 : M4 ℝ)) baseMatrix = baseMatrix := by sorry


-- MetaplecticAutomorphicForms:MP.8/siegel-action
def siegelAction (g : positiveSimilitudes) (z : SiegelSpace) : SiegelSpace := by sorry
lemma siegelAction_apply (g : positiveSimilitudes) (z : SiegelSpace) :
    (siegelAction g z).val = fractional (g.val.1 : M4 ℝ) z.val := by sorry
def siegelFactor (g : positiveSimilitudes) (z : SiegelSpace) : ℂ :=
  (blockC (g.val.1 : M4 ℝ) * z.val + blockD (g.val.1 : M4 ℝ)).det / (g.val.2 : ℝ)
lemma siegelAction_one (z : SiegelSpace) : siegelAction 1 z = z := by sorry
lemma siegelAction_mul (g h : positiveSimilitudes) (z : SiegelSpace) :
    siegelAction (g*h) z = siegelAction g (siegelAction h z) := by sorry
lemma siegelFactor_cocycle (g h : positiveSimilitudes) (z : SiegelSpace) :
    siegelFactor (g*h) z = siegelFactor g (siegelAction h z)*siegelFactor h z := by sorry
-- Test: siegelAction_scalar (raw matrix version)
example : fractional (2 • (1 : M4 ℝ)) baseMatrix = baseMatrix := by sorry
-- Test: siegelAction_translation
example : fractional (unipotent (1 : M2 ℝ)) baseMatrix = (1+Complex.I) • (1 : M2 ℂ) := by sorry
-- Test: siegelAction_fourier
example : fractional (Matrix.J (Fin 2) ℝ) baseMatrix = baseMatrix := by sorry


-- MetaplecticAutomorphicForms:MP.8/similitude-cover
-- Continuous roots suffice: their nonvanishing implies holomorphy in the symmetric coordinates.
structure similitudeCover where
  base : positiveSimilitudes
  root : SiegelSpace → ℂ
  continuous_root : Continuous root
  square_root : ∀ z, root z ^ 2 = siegelFactor base z
instance : Group similitudeCover := by sorry
lemma similitudeCover_square (g : similitudeCover) (z : SiegelSpace) :
    g.root z ^ 2 = siegelFactor g.base z := by sorry
lemma similitudeCover_mul_root (g h : similitudeCover) (z : SiegelSpace) :
    (g*h).root z = g.root (siegelAction h.base z)*h.root z := by sorry
lemma similitudeCover_kernel (g : similitudeCover) (h : g.base = 1) :
    (∀ z, g.root z = 1) ∨ (∀ z, g.root z = -1) := by sorry
-- Test: similitudeCover_two_lifts
example : (fun _ : SiegelSpace => (1 : ℂ)) ≠ (fun _ : SiegelSpace => (-1 : ℂ)) := by sorry
-- Test: similitudeCover_base_branch
example : Complex.sqrt (-baseMatrix.det) = 1 := by sorry
-- Test: similitudeCover_scaled_branch
example : Complex.sqrt (-(2 • baseMatrix).det) = 2 := by sorry


-- MetaplecticAutomorphicForms:MP.8/compact-stabilizer
theorem compact_stabilizer (g : M4 ℝ) (h : g ∈ Matrix.symplecticGroup (Fin 2) ℝ) :
    fractional g baseMatrix = baseMatrix ↔ gᵀ * g = 1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/arithmetic-subgroup
def arithmeticGamma (N : ℕ) : Subgroup (Matrix.symplecticGroup (Fin 2) ℤ) := by sorry
lemma arithmeticGamma_mem (N : ℕ) (g : Matrix.symplecticGroup (Fin 2) ℤ) :
    g ∈ arithmeticGamma N ↔
    (∀ i j : Fin 2, (N : ℤ) ∣ (g : M4 ℤ) (.inr i) (.inl j)) ∧
      (N : ℤ) ∣ (g : M4 ℤ) (.inl 1) (.inl 0) ∧
      (N : ℤ) ∣ (g : M4 ℤ) (.inr 0) (.inr 1) := by sorry
lemma arithmeticGamma_one (N : ℕ) : (1 : Matrix.symplecticGroup (Fin 2) ℤ) ∈ arithmeticGamma N := by sorry
lemma arithmeticGamma_upper (N : ℕ) (X : M2 ℤ) (h : Xᵀ=X) :
    ∃ g : arithmeticGamma N, (g.val : M4 ℤ) = Matrix.fromBlocks 1 X 0 1 := by sorry
-- Test: arithmeticGamma_upper_example
example : ∃ g : arithmeticGamma 8, (g.val : M4 ℤ) =
    Matrix.fromBlocks 1 (!![0,1;1,0] : M2 ℤ) 0 1 := by sorry
-- Test: arithmeticGamma_lower_example
example : ¬ ∃ g : arithmeticGamma 8, (g.val : M4 ℤ) =
    Matrix.fromBlocks (1 : M2 ℤ) 0 1 1 := by sorry
-- Test: arithmeticGamma_level_one
example : arithmeticGamma 1 = ⊤ := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-slash
def bfhSlash (m : ℤ) (gamma : M4 ℝ) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (W : CVec) : ℂ :=
  let E := blockC gamma * baseImage g + blockD gamma
  expTwoPi (-m * quad (E⁻¹ * blockC gamma) W) * phi (gamma*g) (E⁻¹ᵀ *ᵥ W)
lemma bfhSlash_one (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m 1 phi (g.val.1 : M4 ℝ) W = phi (g.val.1 : M4 ℝ) W := by sorry
lemma bfhSlash_mul (m : ℤ) (phi : M4 ℝ → CVec → ℂ)
    (a b : Matrix.symplecticGroup (Fin 2) ℝ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (b : M4 ℝ) (bfhSlash m (a : M4 ℝ) phi) (g.val.1 : M4 ℝ) W =
      bfhSlash m ((a : M4 ℝ)*(b : M4 ℝ)) phi (g.val.1 : M4 ℝ) W := by sorry
lemma bfhSlash_fourier (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (Matrix.J (Fin 2) ℝ) phi (g.val.1 : M4 ℝ) W =
      expTwoPi (-m * quad (baseImage (g.val.1 : M4 ℝ))⁻¹ W) *
        phi (Matrix.J (Fin 2) ℝ * (g.val.1 : M4 ℝ)) ((baseImage (g.val.1 : M4 ℝ))⁻¹ *ᵥ W) := by sorry
-- Test: bfhSlash_zero
example (m : ℤ) (gamma g : M4 ℝ) (W : CVec) : bfhSlash m gamma (fun _ _ => 0) g W = 0 := by sorry
-- Test: bfhSlash_unipotent
example (m : ℤ) (B : M2 ℝ) (h : Bᵀ=B) (phi : M4 ℝ → CVec → ℂ) (g : positiveSimilitudes) (W : CVec) :
    bfhSlash m (unipotent B) phi (g.val.1 : M4 ℝ) W = phi (unipotent B*(g.val.1 : M4 ℝ)) W := by sorry
-- Test: bfhSlash_fourier_at_base
example (m : ℤ) (phi : M4 ℝ → CVec → ℂ) (W : CVec) :
    bfhSlash m (Matrix.J (Fin 2) ℝ) phi 1 W =
      expTwoPi (m * Complex.I * (W ⬝ᵥ W)) * phi (Matrix.J (Fin 2) ℝ) (-Complex.I • W) := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-translation
def bfhTranslate (m : ℤ) (l r : CVec) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (W : CVec) : ℂ :=
  expTwoPi (m * (quad (baseImage g) l + 2 * (W ⬝ᵥ l))) * phi g (W+baseImage g*ᵥl+r)
lemma bfhTranslate_zero (m : ℤ) (phi : M4 ℝ → CVec → ℂ) : bfhTranslate m 0 0 phi = phi := by sorry
lemma bfhTranslate_comp (m : ℤ) (l r k t : CVec) (phi : M4 ℝ → CVec → ℂ)
    (g : positiveSimilitudes) (W : CVec) :
    bfhTranslate m k t (bfhTranslate m l r phi) (g.val.1 : M4 ℝ) W =
      expTwoPi (2*m*(t ⬝ᵥ l)) * bfhTranslate m (l+k) (r+t) phi (g.val.1 : M4 ℝ) W := by sorry
lemma bfhTranslate_linear (m : ℤ) (l r : CVec) (phi psi : M4 ℝ → CVec → ℂ) :
    bfhTranslate m l r (phi+psi) = bfhTranslate m l r phi + bfhTranslate m l r psi := by sorry
-- Test: bfhTranslate_integer_phase
example : expTwoPi (2*(8 : ℂ)*((![1/8,0] : CVec) ⬝ᵥ ![1,0])) = 1 := by sorry
-- Test: bfhTranslate_real_phase
example : expTwoPi (2*((![1/4,0] : CVec) ⬝ᵥ ![1,0])) = -1 := by sorry
-- Test: bfhTranslate_constant_at_base
example : bfhTranslate 1 ![1,0] 0 (fun _ _ => 1) 1 0 = Complex.exp (-2*Real.pi) := by sorry


-- MetaplecticAutomorphicForms:MP.8/genus-two-theta
def genusTwoTheta (a : ℕ) (nu : IVec) (Z : M2 ℂ) (W : CVec) : ℂ :=
  ∑' R : IVec, if ∀ i, Int.ModEq (2*(a : ℤ)) (R i) (nu i) then
    expTwoPi (quad Z (ivCast R)/(4*a) + (ivCast R ⬝ᵥ W)) else 0
lemma genusTwoTheta_residue (a : ℕ) (nu l : IVec) (Z : M2 ℂ) (W : CVec) :
    genusTwoTheta a (nu+(2*(a : ℤ))•l) Z W = genusTwoTheta a nu Z W := by sorry
lemma genusTwoTheta_elliptic (a : ℕ) (ha : 0<a) (nu l r : IVec) (z : SiegelSpace) (W : CVec) :
    genusTwoTheta a nu z.val W = expTwoPi (a*(quad z.val (ivCast l)+2*(W ⬝ᵥ ivCast l))) *
      genusTwoTheta a nu z.val (W+z.val*ᵥivCast l+ivCast r) := by sorry
lemma genusTwoTheta_diagonal (a : ℕ) (ha : 0<a) (z : CVec) (hz : ∀ i, 0<(z i).im) (W : CVec) :
    genusTwoTheta a 0 (Matrix.diagonal z) W = ∏ i, jacobiTheta₂ (2*a*W i) (2*a*z i) := by sorry
-- Test: genusTwoTheta_negation
example (a : ℕ) (nu : IVec) (Z : M2 ℂ) (W : CVec) :
    genusTwoTheta a (-nu) Z (-W) = genusTwoTheta a nu Z W := by sorry
-- Test: genusTwoTheta_period
example (Z : M2 ℂ) (W : CVec) : genusTwoTheta 1 ![2,0] Z W = genusTwoTheta 1 0 Z W := by sorry
-- Test: genusTwoTheta_product
example : genusTwoTheta 1 0 baseMatrix 0 = jacobiTheta₂ 0 (2*Complex.I)^2 := by sorry


-- MetaplecticAutomorphicForms:MP.8/quadratic-matrix
def quadraticMatrix (Q : QuadraticForm ℤ IVec) : M2 ℚ :=
  let b : ℚ := Q ![1,1] - Q ![1,0] - Q ![0,1]
  !![(Q ![1,0] : ℚ), b/2; b/2, (Q ![0,1] : ℚ)]
lemma quadraticMatrix_symmetric (Q : QuadraticForm ℤ IVec) : (quadraticMatrix Q)ᵀ = quadraticMatrix Q := by sorry
lemma quadraticMatrix_eval (Q : QuadraticForm ℤ IVec) (x : IVec) :
    (fun i => (x i : ℚ)) ⬝ᵥ (quadraticMatrix Q *ᵥ (fun i => (x i : ℚ))) = (Q x : ℚ) := by sorry
lemma quadraticMatrix_injective : Function.Injective quadraticMatrix := by sorry
-- Test: quadraticMatrix_mixed
example : quadraticMatrix (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1) = !![0,1/2;1/2,0] := by sorry
-- Test: quadraticMatrix_square
example : quadraticMatrix (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0) = !![1,0;0,0] := by sorry
-- Test: quadraticMatrix_negative
example : quadraticMatrix (-QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0) = !![-1,0;0,0] := by sorry


-- MetaplecticAutomorphicForms:MP.8/fourier-coefficient
def fourierCoefficient (N : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) : ℂ :=
  let T : M2 ℂ := (quadraticMatrix Q).map (fun q : ℚ => (q : ℂ))
  (N : ℂ)^(-3*(j.val : ℤ)) *
    ∫ X : Fin 3 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 ((N : ℝ)^j.val)),
      ∫ W : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        phi (unipotent (symCoords X)*g) (fun i => W i) *
          expTwoPi (-((N : ℂ)^(-(j.val : ℤ)))*(T*(baseImage g+(symCoords X).map (fun x : ℝ => (x : ℂ)))).trace -
            (N : ℂ)^(1-j.val)*(ivCast R ⬝ᵥ (fun i => (W i : ℂ))))
lemma fourierCoefficient_zero (N : ℕ) (j : Fin 2) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (fun _ _ => 0) g Q R = 0 := by sorry
-- Integrability cannot be dropped from additive Bochner integration. This prototype
-- uses continuity on the compact boxes as a sufficient, fully expressible condition.
lemma fourierCoefficient_add (N : ℕ) (j : Fin 2) (phi psi : M4 ℝ → CVec → ℂ)
    (hp : Continuous (Function.uncurry phi)) (hq : Continuous (Function.uncurry psi))
    (g : positiveSimilitudes) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (phi+psi) (g.val.1 : M4 ℝ) Q R =
      fourierCoefficient N j phi (g.val.1 : M4 ℝ) Q R + fourierCoefficient N j psi (g.val.1 : M4 ℝ) Q R := by sorry
lemma fourierCoefficient_scalar (N : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (c : ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N j (c • phi) g Q R = c*fourierCoefficient N j phi g Q R := by sorry
-- Test: fourierCoefficient_constant
example (N : ℕ) (hN : 0<N) (j : Fin 2) (g : M4 ℝ) :
    fourierCoefficient N j (fun _ _ => 1) g 0 0 = 1 := by sorry
-- Test: fourierCoefficient_vector_mode
example (N : ℕ) (hN : 0<N) (j : Fin 2) (g : M4 ℝ) (R : IVec) :
    fourierCoefficient N j (fun _ W => expTwoPi ((N : ℂ)^(1-j.val)*(ivCast R ⬝ᵥ W))) g 0 R = 1 := by sorry
-- Test: fourierCoefficient_wrong_vector
example (N : ℕ) (hN : 0<N) (j : Fin 2) (g : M4 ℝ) (R : IVec) (hR : R≠0) :
    fourierCoefficient N j (fun _ _ => 1) g 0 R = 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-pairing


-- MetaplecticAutomorphicForms:MP.8/coefficient-shift-analytic


-- MetaplecticAutomorphicForms:MP.8/theta-decomposition


-- MetaplecticAutomorphicForms:MP.8/theta-fourier-transform


-- MetaplecticAutomorphicForms:MP.8/theta-component-fourier-law


-- MetaplecticAutomorphicForms:MP.8/bfh-jacobi-specialization
def isPositiveMatrix (g : M4 ℝ) : Prop :=
  ∃ mu : ℝ, 0<mu ∧ gᵀ * Matrix.J (Fin 2) ℝ * g = mu • Matrix.J (Fin 2) ℝ
def cuspGamma (j : Fin 2) (g : M4 ℤ) : M4 ℝ :=
  let h := g.map (fun x : ℤ => (x : ℝ))
  if j.val=0 then h else -(Matrix.J (Fin 2) ℝ)*h*Matrix.J (Fin 2) ℝ
structure bfhJacobiFunctions (N : ℕ) (m : ℤ) (j : Fin 2) where
  toFun : M4 ℝ → CVec → ℂ
  smooth : ∀ g W, isPositiveMatrix g → ContDiffAt ℝ ⊤ (Function.uncurry toFun) (g,W)
  holomorphic : ∀ g, isPositiveMatrix g → Differentiable ℂ (toFun g)
  gamma_invariant : ∀ gamma : arithmeticGamma N, ∀ g W, isPositiveMatrix g →
    bfhSlash m (cuspGamma j (gamma.val : M4 ℤ)) toFun g W = toFun g W
  translation_invariant : ∀ l r : IVec, ∀ g W, isPositiveMatrix g →
    bfhTranslate m ((N : ℂ)^(-(j.val : ℤ)) • ivCast l)
      ((N : ℂ)^((j.val : ℤ)-1) • ivCast r) toFun g W = toFun g W
def bfhJacobiFunctions_zero (N : ℕ) (m : ℤ) (j : Fin 2) : bfhJacobiFunctions N m j := by sorry
lemma bfhJacobiFunctions_translation (N : ℕ) (m : ℤ) (j : Fin 2) (phi : bfhJacobiFunctions N m j)
    (l r : IVec) (g : M4 ℝ) (W : CVec) (hg : isPositiveMatrix g) :
    bfhTranslate m ((N : ℂ)^(-(j.val : ℤ)) • ivCast l)
      ((N : ℂ)^((j.val : ℤ)-1) • ivCast r) phi.toFun g W = phi.toFun g W := by sorry
def bfhJacobiFunctions_fourier_cusp (N : ℕ) (hN : 0<N) (m : ℤ)
    (phi : bfhJacobiFunctions N m 0) : bfhJacobiFunctions N m 1 := by sorry
-- Test: bfhJacobiFunctions_zero_test
example (j : Fin 2) : ∃ phi : bfhJacobiFunctions 8 16 j, phi.toFun = fun _ _ => 0 := by sorry
-- Test: bfhJacobiFunctions_constant_zero_index
example (N : ℕ) (hN : 0<N) (j : Fin 2) :
    ∃ phi : bfhJacobiFunctions N 0 j, phi.toFun = fun _ _ => 1 := by sorry
-- Test: bfhJacobiFunctions_constant_positive_index
example : ¬ ∃ phi : bfhJacobiFunctions 8 16 0, phi.toFun = fun _ _ => 1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-components
-- The projection is defined on arbitrary coordinate functions. Its decomposition laws
-- require bfhJacobiFunctions, so regularity is not encoded as the desired conclusion.
def thetaComponent (N a : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu : IVec) : ℂ := by sorry
lemma thetaComponent_zero (N a : ℕ) (j : Fin 2) (g : M4 ℝ) (nu : IVec) :
    thetaComponent N a j (fun _ _ => 0) g nu = 0 := by sorry
lemma thetaComponent_residue (N a : ℕ) (ha : 0<a) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu l : IVec) :
    thetaComponent N a j phi g (nu+(2*(a : ℤ))•l) = thetaComponent N a j phi g nu := by sorry
-- Test: thetaComponent_basis
example (a : ℕ) (ha : 0<a) (mu nu : IVec) :
    thetaComponent 1 a 0 (fun g W => genusTwoTheta a mu (baseImage g) W) 1 nu =
      if (∀ i, Int.ModEq (2*(a : ℤ)) (mu i) (nu i)) then 1 else 0 := by sorry
lemma thetaComponent_scalar (N a : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (nu : IVec) (c : ℂ) : thetaComponent N a j (c • phi) g nu=c*thetaComponent N a j phi g nu := by sorry
-- Test: thetaComponent_zero_test
example (N a : ℕ) (j : Fin 2) (g : M4 ℝ) (nu : IVec) : thetaComponent N a j (fun _ _ => 0) g nu=0 := by sorry
-- Test: thetaComponent_period
example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) : thetaComponent 8 2 1 phi g ![0,5]=thetaComponent 8 2 1 phi g ![0,1] := by sorry
-- Fully expressible signatures for the preceding analytic theorems.
-- Gaussian orthogonality uses W=Z*l+r and the Jacobian det(Im Z).
theorem theta_pairing (a : ℕ) (ha : 0<a) (z : SiegelSpace) (mu nu : IVec) :
    (∫ l : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
      ∫ r : RVec in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        let W := z.val *ᵥ (fun i => (l i : ℂ)) + (fun i => (r i : ℂ))
        genusTwoTheta a mu z.val W * conj (genusTwoTheta a nu z.val W) *
          Complex.exp (-4*Real.pi*a*quad (((z.val.map Complex.im)⁻¹).map (fun x : ℝ => (x : ℂ)))
            (fun i => (W i).im)) * (z.val.map Complex.im).det) =
      if (∀ i, Int.ModEq (2*(a : ℤ)) (mu i) (nu i)) then
        (Real.sqrt (z.val.map Complex.im).det : ℂ)/(2*a) else 0 := by sorry
theorem coefficient_shift_analytic (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N ∣ m)
    (j : Fin 2) (phi : bfhJacobiFunctions N m j) (g : positiveSimilitudes)
    (l : IVec) (p : QuadraticForm ℤ IVec × IVec) :
    let q := fourierShift (m/N) ((N : ℤ)^(1-j.val)) l p
    fourierCoefficient N j phi.toFun (g.val.1 : M4 ℝ) q.1 q.2 =
      fourierCoefficient N j phi.toFun (g.val.1 : M4 ℝ) p.1 p.2 := by sorry
theorem theta_decomposition (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N ∣ m)
    (j : Fin 2) (phi : bfhJacobiFunctions N m j) (g : positiveSimilitudes) (W : CVec) :
    phi.toFun (g.val.1 : M4 ℝ) W =
      ∑ nu : Fin 2 → Fin (2*(m/N)),
        thetaComponent N (m/N) j phi.toFun (g.val.1 : M4 ℝ) (fun i => nu i) *
          genusTwoTheta (m/N) (fun i => nu i)
            ((N : ℂ)^(1-2*(j.val : ℤ)) • baseImage (g.val.1 : M4 ℝ))
            ((N : ℂ)^(1-j.val) • W) := by sorry
theorem theta_fourier_transform (a : ℕ) (ha : 0<a) (z : SiegelSpace) (W : CVec) (nu : IVec) :
    genusTwoTheta a nu (-z.val⁻¹) (z.val⁻¹ *ᵥ W) =
      expTwoPi (a*quad z.val⁻¹ W) * Complex.sqrt (-z.val.det)/(2*a) *
        ∑ mu : Fin 2 → Fin (2*a), expTwoPi (-(ivCast nu ⬝ᵥ (fun i => (mu i : ℂ)))/(2*a)) *
          genusTwoTheta a (fun i => mu i) z.val W := by sorry
theorem theta_component_fourier_law (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N ∣ m)
    (phi : bfhJacobiFunctions N m 0) (g : positiveSimilitudes) (nu : IVec) :
    thetaComponent N (m/N) 1 (bfhSlash m (Matrix.J (Fin 2) ℝ) phi.toFun) (g.val.1 : M4 ℝ) nu =
      Complex.sqrt (-(baseImage (g.val.1 : M4 ℝ)).det)/(2*m) *
        ∑ mu : Fin 2 → Fin (2*(m/N)),
          expTwoPi (-(N : ℂ)*(ivCast nu ⬝ᵥ (fun i => (mu i : ℂ)))/(2*m)) *
            thetaComponent N (m/N) 0 phi.toFun (Matrix.J (Fin 2) ℝ*(g.val.1 : M4 ℝ)) (fun i => mu i) := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-coefficient
def thetaCoefficient (N m : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ)
    (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) : ℂ := by sorry
lemma thetaCoefficient_recovered (N m : ℕ) (hN : 0<N) (hm : 0<m) (j : Fin 2)
    (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (nu : IVec)
    (U : M2 ℤ) (hU : U.map (fun x : ℤ => (x : ℚ)) =
      (4*(m : ℚ)) • quadraticMatrix Q - (N : ℚ)^(2-j.val) •
        Matrix.vecMulVec (fun i => (nu i : ℚ)) (fun i => (nu i : ℚ))) :
    thetaCoefficient N m j phi g U nu = fourierCoefficient N j phi g Q nu := by sorry
lemma thetaCoefficient_zero (N m : ℕ) (j : Fin 2) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) :
    thetaCoefficient N m j (fun _ _ => 0) g U nu=0 := by sorry
lemma thetaCoefficient_scalar (N m : ℕ) (j : Fin 2) (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) (c : ℂ) :
    thetaCoefficient N m j (c • phi) g U nu=c*thetaCoefficient N m j phi g U nu := by sorry
-- Test: thetaCoefficient_zero_test
example (N m : ℕ) (j : Fin 2) (g : M4 ℝ) (U : M2 ℤ) (nu : IVec) :
    thetaCoefficient N m j (fun _ _ => 0) g U nu = 0 := by sorry
-- Test: thetaCoefficient_parity
example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) : thetaCoefficient 8 16 1 phi g 1 0 = 0 := by sorry

-- Test: thetaCoefficient_integral_index
example (phi : M4 ℝ → CVec → ℂ) (g : M4 ℝ) :
    thetaCoefficient 8 16 1 phi g !![0,0;0,56] ![0,1]=fourierCoefficient 8 1 phi g (QuadraticMap.proj 1 1) ![0,1] := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-seed
abbrev KTwo := Matrix.unitaryGroup (Fin 2) ℂ
def rotationK (t : ℝ) : KTwo := ⟨(!![Real.cos t,Real.sin t;-Real.sin t,Real.cos t] : M2 ℂ), by sorry⟩
-- This finite matrix realization instantiates the imported continuous K-representation.
-- The two proof fields are defining input properties, not Whittaker conclusions.
structure BFHTestVector (k : ℕ) (d : ℕ) where
  sigma : KTwo →* (Matrix (Fin d) (Fin d) ℂ)ˣ
  continuous_sigma : Continuous (fun g => (sigma g : Matrix (Fin d) (Fin d) ℂ))
  v : Fin d → ℂ
  weight : ∀ t : ℝ, v ᵥ* (sigma (rotationK t) : Matrix (Fin d) (Fin d) ℂ) =
    Complex.exp (Complex.I*k*t) • v
  central : sigma ⟨(-1 : M2 ℂ), by sorry⟩ = 1
def bfhSeed (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (g : M4 ℝ) : Fin d → ℂ := by sorry
lemma bfhSeed_identity (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) :
    bfhSeed k d data F 1 = F 1 • data.v := by sorry
lemma bfhSeed_zero (k d : ℕ) (data : BFHTestVector k d) : bfhSeed k d data (fun _ => 0) = 0 := by sorry
lemma bfhSeed_scalar (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (c : ℂ) :
    bfhSeed k d data (c • F) = c • bfhSeed k d data F := by sorry
-- Test: bfhSeed_base
example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (h : F 1=1) :
    bfhSeed k d data F 1 = data.v := by sorry
-- Test: bfhSeed_zero_vector
example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) (h : data.v=0) :
    bfhSeed k d data F = 0 := by sorry
-- Test: bfhSeed_central
example (k d : ℕ) (data : BFHTestVector k d) (F : M2 ℝ → ℂ) :
    bfhSeed k d data F (2 • (1 : M4 ℝ)) = bfhSeed k d data F 1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/induced-seed-family
def inducedSeedFamily (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) : ℂ :=
  Complex.exp (s/2 * Real.log (baseImage g |>.map Complex.im |>.det)) * I g
lemma inducedSeedFamily_zero (I : M4 ℝ → ℂ) (g : positiveSimilitudes) :
    inducedSeedFamily I 0 (g.val.1 : M4 ℝ) = I (g.val.1 : M4 ℝ) := by sorry
lemma inducedSeedFamily_add (I : M4 ℝ → ℂ) (s t : ℂ) (g : positiveSimilitudes) :
    inducedSeedFamily I (s+t) (g.val.1 : M4 ℝ) =
      Complex.exp (t/2*Real.log (baseImage (g.val.1 : M4 ℝ) |>.map Complex.im |>.det)) *
        inducedSeedFamily I s (g.val.1 : M4 ℝ) := by sorry
lemma inducedSeedFamily_holomorphic (I : M4 ℝ → ℂ) (g : positiveSimilitudes) :
    Differentiable ℂ (fun s => inducedSeedFamily I s (g.val.1 : M4 ℝ)) := by sorry
-- Test: inducedSeedFamily_identity
example (I : M4 ℝ → ℂ) (s : ℂ) : inducedSeedFamily I s 1 = I 1 := by sorry
-- Test: inducedSeedFamily_levi
example (s : ℂ) : inducedSeedFamily (fun _ => 1) s
    (Matrix.fromBlocks (2 • (1 : M2 ℝ)) 0 0 ((1/2 : ℝ) • (1 : M2 ℝ))) = (4 : ℂ)^s := by sorry
-- Test: inducedSeedFamily_zero_seed
example (s : ℂ) (g : M4 ℝ) : inducedSeedFamily (fun _ => 0) s g = 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/jacobi-eisenstein
-- The quotient is constructed from the actual parabolic intersection.
def bfhParabolic (N : ℕ) : Subgroup (arithmeticGamma N) := by sorry
abbrev BFHCosets (N : ℕ) := (arithmeticGamma N) ⧸ bfhParabolic N
-- Native G/H is identified with H\G by inverse representatives.
def cosetMatrix (N : ℕ) (c : BFHCosets N) : M4 ℝ := by sorry
def jacobiSummand (_N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ)
    (gamma : M4 ℝ) (l : IVec) (g : M4 ℝ) (W : CVec) : ℂ :=
  bfhSlash m gamma (bfhTranslate m (ivCast l) 0 (fun h _ => inducedSeedFamily I s h)) g W
def jacobiEisenstein (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (W : CVec) : ℂ :=
  ∑' c : BFHCosets N, ∑' l : IVec, jacobiSummand N m I s (cosetMatrix N c) l g W
lemma jacobiEisenstein_zero (N : ℕ) (m : ℤ) (s : ℂ) : jacobiEisenstein N m (fun _ => 0) s = 0 := by sorry
lemma jacobiEisenstein_scalar (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s c : ℂ) :
    jacobiEisenstein N m (c • I) s = c • jacobiEisenstein N m I s := by sorry
lemma jacobiEisenstein_summand (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) (g : positiveSimilitudes) (W : CVec) :
    jacobiSummand N m I s 1 0 (g.val.1 : M4 ℝ) W = inducedSeedFamily I s (g.val.1 : M4 ℝ) := by sorry
-- Test: jacobiEisenstein_zero_test
example (N : ℕ) (m : ℤ) (s : ℂ) (g : M4 ℝ) (Q : QuadraticForm ℤ IVec) (R : IVec) :
    fourierCoefficient N 0 (jacobiEisenstein N m (fun _ => 0) s) g Q R = 0 := by sorry
-- Test: jacobiEisenstein_identity_term
example (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (s : ℂ) : jacobiSummand N m I s 1 0 1 0 = I 1 := by sorry
-- Test: jacobiEisenstein_nonzero_translation
example (N : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) :
    jacobiSummand N 1 I s 1 ![1,0] 1 0 = Complex.exp (-2*Real.pi)*I 1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-functions
def kappaX (x : Fin 3 → ℝ) : KTwo := by sorry
def transformedX (x : Fin 3 → ℝ) : ℝ := -x 1*(x 0+x 2)/(1+(x 0)^2+(x 1)^2)
def transformedY (x : Fin 3 → ℝ) : ℝ :=
  Real.sqrt (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)/(1+(x 0)^2+(x 1)^2)
def whittakerKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) (x : Fin 3 → ℝ) : ℂ :=
  let Z := (symCoords x).map (fun a : ℝ => (a : ℂ)) + baseMatrix
  Complex.sqrt (-Z.det) / ((‖Z.det‖ : ℂ)^s) * expTwoPi (eps*y1*x 0) *
    expTwoPi (y2*((transformedX x : ℂ)+Complex.I*transformedY x)) *
    ((transformedY x : ℂ)^((k : ℂ)/2)) * phi (kappaX x)
def whittakerFunction (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) : ℂ :=
  ((y1*y2 : ℝ) : ℂ)^(4-s) * (y2 : ℂ)^((k : ℂ)/2) * ∫ x : Fin 3 → ℝ, whittakerKernel k phi eps y1 y2 s x
lemma whittakerFunction_zero (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) :
    whittakerFunction k (fun _ => 0) eps y1 y2 s = 0 := by sorry
lemma whittakerFunction_scalar (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s c : ℂ) :
    whittakerFunction k (c • phi) eps y1 y2 s = c*whittakerFunction k phi eps y1 y2 s := by sorry
lemma whittakerFunction_degenerate_scale (k : ℕ) (phi : KTwo → ℂ) (y1 y2 : ℝ) (hy : 0<y1) (s : ℂ) :
    whittakerFunction k phi 0 y1 y2 s = (y1 : ℂ)^(4-s)*whittakerFunction k phi 0 1 y2 s := by sorry
-- Test: whittakerFunction_zero_test
example (k : ℕ) (y1 y2 : ℝ) (s : ℂ) : whittakerFunction k (fun _ => 0) 1 y1 y2 s = 0 := by sorry
-- Test: whittakerKernel_base
example (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s : ℂ) :
    whittakerKernel k (fun _ => 1) eps y1 y2 s 0 = Complex.exp (-2*Real.pi*y2) := by sorry
-- Test: whittakerFunction_degenerate_test
example (k : ℕ) (phi : KTwo → ℂ) (y2 : ℝ) (s : ℂ) :
    whittakerFunction k phi 0 2 y2 s = (2 : ℂ)^(4-s)*whittakerFunction k phi 0 1 y2 s := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-majorant
theorem whittaker_majorant (a b c : ℝ) (ha : 1/2<a) (hab : 3/2<2*a+b) (habc : 1<a+b+c) :
    Integrable (fun x : Fin 3 → ℝ =>
      (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)^(-a) *
      (1+(x 0)^2+(x 1)^2)^(-b) * (1+(x 0)^2)^(-c)) := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-initial-convergence
-- A genuine input property, not an assumed Whittaker conclusion.
def IsBFHMatrixCoefficient (k : ℕ) (phi : KTwo → ℂ) : Prop :=
  ∃ d : ℕ, ∃ data : BFHTestVector k d, ∃ T : (Fin d → ℂ) →ₗ[ℂ] ℂ,
    ∀ q, phi q = T (data.v ᵥ* (data.sigma q : Matrix (Fin d) (Fin d) ℂ))

theorem whittaker_initial_convergence (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ)
    (heps : eps ∈ ({-1,0,1} : Set ℤ)) (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2)
    (s : ℂ) (hs : 2<s.re) : Integrable (whittakerKernel k phi eps y1 y2 s) := by sorry


-- MetaplecticAutomorphicForms:MP.8/jacquet-two-parameter


def jacquetTwoParameter (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ := by sorry
def auxiliaryWhittaker (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ :=
  (Real.pi : ℂ)^(-r)*Complex.Gamma (r+(k : ℂ)/2)*jacquetTwoParameter k phi eps y1 y2 s r
lemma jacquetTwoParameter_linear (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r c : ℂ) :
    jacquetTwoParameter k (c • phi) eps y1 y2 s r = c*jacquetTwoParameter k phi eps y1 y2 s r := by sorry
lemma jacquetTwoParameter_normalization (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) :
    auxiliaryWhittaker k phi eps y1 y2 s r =
      (Real.pi : ℂ)^(-r)*Complex.Gamma (r+(k : ℂ)/2)*jacquetTwoParameter k phi eps y1 y2 s r := by sorry
lemma jacquetTwoParameter_specialize (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) (s : ℂ) (hs : (3+(k : ℝ))/2<s.re) :
    auxiliaryWhittaker k phi eps y1 y2 s ((k : ℂ)/2) = whittakerFunction k phi eps y1 y2 s := by sorry
-- Test: jacquetTwoParameter_zero
example (k : ℕ) (eps : ℤ) (y1 y2 : ℝ) (s r : ℂ) : jacquetTwoParameter k (fun _ => 0) eps y1 y2 s r=0 := by sorry
-- Test: jacquetTwoParameter_weight_two
example : (Real.pi : ℂ)^(-(1 : ℂ))*Complex.Gamma (1+(2 : ℂ)/2) = (Real.pi : ℂ)⁻¹ := by sorry
-- Test: jacquetTwoParameter_specialization_test
example (y : ℝ) (hy : 0<y) : (y : ℂ)^((2 : ℂ)/2)*Complex.exp (-y/2) = y*Complex.exp (-y/2) := by sorry


-- MetaplecticAutomorphicForms:MP.8/jacquet-r-reflection



theorem jacquet_r_reflection (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ Vc : (ℂ × ℂ) → ℂ, DifferentiableOn ℂ Vc {z | 5/2<(z.1+z.2).re ∧ 3/2<(z.1-z.2).re} ∧
      (∀ z, 1/2<z.2.re → 3/2<(z.1-z.2).re →
        Vc z = jacquetTwoParameter k phi eps y1 y2 z.1 z.2) ∧
      ∀ s r, 5/2<(s+r).re → 3/2<(s-r).re →
        5/2<(s+1-r).re → 3/2<(s-(1-r)).re →
        (∀ n : ℕ, r+(k : ℂ)/2 ≠ -(n : ℂ)) →
        (∀ n : ℕ, 1-r+(k : ℂ)/2 ≠ -(n : ℂ)) →
        (Real.pi : ℂ)^(-r)*Complex.Gamma (r+(k : ℂ)/2)*Vc (s,r) =
          (Real.pi : ℂ)^(-(1-r))*Complex.Gamma (1-r+(k : ℂ)/2)*Vc (s,1-r) := by sorry


-- MetaplecticAutomorphicForms:MP.8/jacquet-weyl-reflection


def torusK (t : ℝ) : KTwo := ⟨Matrix.diagonal ![1,Complex.exp (Complex.I*t)], by sorry⟩
-- Torus projections do not retain the original SO(2) weight-k vector condition.
def IsFiniteKMatrixCoefficient (phi : KTwo → ℂ) : Prop :=
  ∃ d : ℕ, ∃ sigma : KTwo →* (Matrix (Fin d) (Fin d) ℂ)ˣ,
    Continuous (fun q => (sigma q : Matrix (Fin d) (Fin d) ℂ)) ∧
    sigma ⟨(-1 : M2 ℂ), by sorry⟩ = 1 ∧
    ∃ v : Fin d → ℂ, ∃ T : (Fin d → ℂ) →ₗ[ℂ] ℂ,
      ∀ q, phi q = T (v ᵥ* (sigma q : Matrix (Fin d) (Fin d) ℂ))

-- The corrected pair follows the evaluated integrals (3.26)–(3.27), p.565.
-- Both integrals contain the inverse of the FIRST gamma argument below.
-- Cancellation leaves the second gamma factor; the negative pair itself is unchanged.
def jacquetGammaArguments (eps n : ℤ) (s r : ℂ) : ℂ × ℂ :=
  let e : ℂ := eps
  let t : ℂ := n
  ((s-r+e*t+(e-1)/2)/2, (s+r+e*t+(e+1)/2)/2)
def normalizedJacquet (k : ℕ) (phi : KTwo → ℂ) (eps n : ℤ) (y1 y2 : ℝ) (s r : ℂ) : ℂ :=
  (2 : ℂ)^(-s)*(Real.pi : ℂ)^(-s)*Complex.Gamma (jacquetGammaArguments eps n s r).1*
    Complex.Gamma (jacquetGammaArguments eps n s r).2*jacquetTwoParameter k phi eps y1 y2 s r
example (n : ℤ) (s r : ℂ) :
    jacquetGammaArguments 1 n s r = ((s-r+n)/2,(s+r+n+1)/2) := by sorry
example (n : ℤ) (s r : ℂ) :
    jacquetGammaArguments (-1) n s r = ((s-r-n-1)/2,(s+r-n)/2) := by sorry

-- Joint meromorphic topology is omitted; these native slice statements retain the
-- reflection-stable continuation domain and do not posit an empty chamber overlap.
theorem jacquet_weyl_reflection (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsFiniteKMatrixCoefficient phi) (eps n : ℤ) (heps : eps=1 ∨ eps=-1)
    (hn : ∀ t q, phi (torusK t*q)=Complex.exp (-Complex.I*n*t)*phi q)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ Vc : (ℂ × ℂ) → ℂ,
      (∀ r, 1/2<r.re → MeromorphicOn (fun s => Vc (s,r)) {s | 2<s.re}) ∧
      (∀ s, 2<s.re → MeromorphicOn (fun r => Vc (s,r)) {r | 1/2<r.re}) ∧
      (∀ s r, 2<s.re → 1/2<r.re → 3/2<(s-r).re →
        Vc (s,r)=jacquetTwoParameter k phi eps y1 y2 s r) ∧
      ∀ s r, 2<s.re → 1/2<r.re →
        (∀ j : ℕ, (jacquetGammaArguments eps n s r).1≠-(j : ℂ) ∧
          (jacquetGammaArguments eps n s r).2≠-(j : ℂ)) →
        (∀ j : ℕ, (jacquetGammaArguments eps n (r+3/2) (s-3/2)).1≠-(j : ℂ) ∧
          (jacquetGammaArguments eps n (r+3/2) (s-3/2)).2≠-(j : ℂ)) →
        (2 : ℂ)^(-s)*(Real.pi : ℂ)^(-s)*Complex.Gamma (jacquetGammaArguments eps n s r).1*
          Complex.Gamma (jacquetGammaArguments eps n s r).2*Vc (s,r)=
        (2 : ℂ)^(-(r+3/2))*(Real.pi : ℂ)^(-(r+3/2))*
          Complex.Gamma (jacquetGammaArguments eps n (r+3/2) (s-3/2)).1*
          Complex.Gamma (jacquetGammaArguments eps n (r+3/2) (s-3/2)).2*Vc (r+3/2,s-3/2) := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-continuation
theorem whittaker_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ W : ℂ → ℂ, DifferentiableOn ℂ W {s | 3/2<s.re} ∧
      ∀ s, 2<s.re → W s = whittakerFunction k phi eps y1 y2 s := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-rapid-decay


theorem whittaker_rapid_decay (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (eps : ℤ) (heps : eps=1 ∨ eps=-1) :
    ∃ W : ℝ → ℝ → ℂ → ℂ,
      (∀ y1 y2, 0<y1 → 0<y2 → DifferentiableOn ℂ (W y1 y2) {s | 3/2<s.re}) ∧
      (∀ y1 y2 s, 0<y1 → 0<y2 → 2<s.re → W y1 y2 s=whittakerFunction k phi eps y1 y2 s) ∧
      ∀ S : Set ℂ, IsCompact S → S⊆{s | 3/2<s.re} →
        ∃ C : ℝ, ∃ xi : SchwartzMap (ℝ × ℝ) ℝ,
          ∀ s∈S, ∀ y1 y2 : ℝ, 0<y1 → 0<y2 →
            ‖W y1 y2 s‖≤Real.rpow (y1*y2) (-C)*xi (y1,y2) := by sorry


-- MetaplecticAutomorphicForms:MP.8/degenerate-whittaker-continuation
theorem degenerate_whittaker_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ W : ℂ → ℂ, DifferentiableOn ℂ W {s | 3/2<s.re} ∧
      ∀ s, 2<s.re → W s = whittakerFunction k phi 0 y1 y2 s := by sorry


-- MetaplecticAutomorphicForms:MP.8/test-coefficient-algebra
def testPhi1 (x : Fin 3 → ℝ) : ℝ :=
  1 / Real.sqrt (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)
def testPhi2 (x : Fin 3 → ℝ) : ℝ :=
  (((symCoords x).det)^2-1)*x 0 /
    (1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)^2
def testPhi3 (x : Fin 3 → ℝ) : ℝ :=
  x 1*(1-(symCoords x).det)/(1+(x 0)^2+2*(x 1)^2+(x 2)^2+(x 0*x 2-(x 1)^2)^2)
-- The R_k closure/density signature awaits the supplier's topological representation API.
-- Chart signatures are concrete; global membership is not assumed as a field.
lemma testPhi1_det (x : Fin 3 → ℝ) :
    testPhi1 x = 1 / ‖((symCoords x).map (fun a : ℝ => (a : ℂ))+baseMatrix).det‖ := by sorry
-- Test: testCoefficientAlgebra_base
example : (testPhi1 0,testPhi2 0,testPhi3 0) = (1,0,0) := by sorry
-- Test: testCoefficientAlgebra_nonzero_phi2
example : testPhi2 ![1,0,0] = -1/4 := by sorry
-- Test: testCoefficientAlgebra_nonzero_phi3
example : testPhi3 ![0,1,0] = 1/2 := by sorry


-- The chart value is positive, but this global compact coefficient is signed.
def globalTestPhi1 (q : KTwo) : ℂ := (((q : M2 ℂ).map Complex.im).det : ℝ)
lemma globalTestPhi1_chart (x : Fin 3 → ℝ) :
    globalTestPhi1 (kappaX x) = (testPhi1 x : ℂ) := by sorry
def deltaZ (z : ℝ) : ℝ := Real.sqrt (1+z^2)
def kappaZ (z : ℝ) : KTwo :=
  ⟨Matrix.diagonal ![1,(1-Complex.I*z)/(deltaZ z : ℂ)], by sorry⟩
lemma globalTestPhi1_rotated (x : Fin 3 → ℝ) (z : ℝ) :
    globalTestPhi1 (kappaX x*kappaZ z) =
      (((1+z*x 0)/deltaZ z*testPhi1 x : ℝ) : ℂ) := by sorry
-- Test: testCoefficientAlgebra_negative_branch
example : globalTestPhi1 (kappaX ![-2,0,0]*kappaZ 1) =
    ((-1/(Real.sqrt 2*Real.sqrt 5) : ℝ) : ℂ) := by sorry

def testCoefficientAlgebra (k : ℕ) : Submodule ℂ (KTwo → ℂ) := by sorry
lemma testCoefficientAlgebra_mul (k : ℕ) (f g : KTwo → ℂ)
    (hf : f ∈ testCoefficientAlgebra 0) (hg : g ∈ testCoefficientAlgebra k) :
    f*g ∈ testCoefficientAlgebra k := by sorry
lemma testCoefficientAlgebra_dense (k : ℕ) (he : Even k) (f : KTwo → ℂ) (hf : Continuous f)
    (hw : ∀ t : ℝ, ∀ q : KTwo, f (rotationK t*q)=expTwoPi ((k : ℂ)*t/(2*Real.pi))*f q)
    (eps : ℝ) (heps : 0<eps) : ∃ g ∈ testCoefficientAlgebra k, ∀ q, ‖g q-f q‖<eps := by sorry
lemma testCoefficientAlgebra_chart :
    globalTestPhi1 ∈ testCoefficientAlgebra 0 ∧
    ∃ f2 ∈ testCoefficientAlgebra 0, ∃ f3 ∈ testCoefficientAlgebra 0,
      ∀ x, globalTestPhi1 (kappaX x)=(testPhi1 x : ℂ) ∧
        f2 (kappaX x)=(testPhi2 x : ℂ) ∧ f3 (kappaX x)=(testPhi3 x : ℂ) := by sorry


-- φ₁ is weight zero. Divisibility is multiplication in the concrete coefficient ring.
def HasBFHDivisor (k : ℕ) (phi : KTwo → ℂ) : Prop :=
  ∃ psi ∈ testCoefficientAlgebra k, ∀ q : KTwo, phi q = globalTestPhi1 q*psi q


-- MetaplecticAutomorphicForms:MP.8/test-coefficient-strip


theorem test_coefficient_strip (k : ℕ) (phi : KTwo → ℂ) (hp : phi∈testCoefficientAlgebra k)
    (eps : ℝ) (he : 0<eps) (he1 : eps<1) :
    ∃ F : KTwo → ℝ → ℝ → ℂ → ℂ, ∃ B : ℝ, 0≤B ∧
      (∀ q x3 x4, DifferentiableOn ℂ (F q x3 x4) {z | |z.im|<1}) ∧
      (∀ q (x1 x3 x4 : ℝ), F q x3 x4 (x1 : ℂ)=phi (kappaX ![x1,x3,x4]*q)) ∧
      (∀ q x3 x4 z, |z.im|≤eps → ‖F q x3 x4 z‖≤B) := by sorry


-- MetaplecticAutomorphicForms:MP.8/rotated-whittaker-bound


-- Use the actual compact product (3.38), with the full scalar W prefactor.
-- The published (3.31) chart equality is false on the negative branch.
-- A compact-transition and uniform-majorant proof remains a packet gap.
def rotatedWhittakerKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ)
    (y1 y2 : ℝ) (s : ℂ) (z : ℝ) (x : Fin 3 → ℝ) : ℂ :=
  ((y1*y2 : ℝ) : ℂ)^(4-s)*(y2 : ℂ)^((k : ℂ)/2)*
    whittakerKernel k (fun q => phi (q*kappaZ z)) eps y1 y2 s x
theorem rotated_whittaker_bound (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (hd : HasBFHDivisor k phi)
    (eps : ℤ) (heps : eps=1 ∨ eps=-1) (S : Set ℂ) (hS : IsCompact S) (hs : S⊆{s | 3/2<s.re}) :
    ∃ C B : ℝ, 0<C ∧ 0≤B ∧ ∀ s∈S, ∀ y1 y2 z : ℝ, 0<y1 → C<y2 →
      Integrable (rotatedWhittakerKernel k phi eps y1 y2 s z) ∧
      ‖∫ x : Fin 3 → ℝ, rotatedWhittakerKernel k phi eps y1 y2 s z x‖≤B*Real.rpow y1 (4-s.re) := by sorry


-- MetaplecticAutomorphicForms:MP.8/novodvorsky-transform
def novodvorskyKernel (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s : ℂ) (y1 y2 z : ℝ) : ℂ :=
  whittakerFunction k (fun q => phi (q*kappaZ z)) eps (y1/(1+z^2)) (deltaZ z*y2) s *
    expTwoPi (-eps*y1*z/(1+z^2)) * (y1 : ℂ)^(u-3/2) * Complex.sqrt (1+Complex.I*z)
def novodvorskyTransform (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s : ℂ) (y2 : ℝ) : ℂ :=
  ∫ y1 in Set.Ioi (0 : ℝ), (∫ z : ℝ, novodvorskyKernel k phi eps u s y1 y2 z) / y1
lemma novodvorskyTransform_zero (k : ℕ) (eps : ℤ) (u s : ℂ) (y2 : ℝ) :
    novodvorskyTransform k (fun _ => 0) eps u s y2 = 0 := by sorry
lemma novodvorskyTransform_scalar (k : ℕ) (phi : KTwo → ℂ) (eps : ℤ) (u s c : ℂ) (y2 : ℝ) :
    novodvorskyTransform k (c • phi) eps u s y2 = c*novodvorskyTransform k phi eps u s y2 := by sorry
lemma novodvorskyTransform_sign (y1 z : ℝ) :
    expTwoPi (-y1*z/(1+z^2)) * expTwoPi (y1*z/(1+z^2)) = 1 := by sorry
-- Test: novodvorskyTransform_zero_test
example (k : ℕ) (u s : ℂ) (y2 : ℝ) : novodvorskyTransform k (fun _ => 0) 1 u s y2 = 0 := by sorry
-- Test: novodvorskyTransform_root
example : Complex.sqrt (1+Complex.I*(0 : ℝ)) = 1 := by sorry
-- Test: novodvorskyTransform_sign_test
example : expTwoPi ((-1 : ℂ)/2) = -1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/novodvorsky-continuation


theorem novodvorsky_continuation (k : ℕ) (hk : 2≤k) (he : Even k)
    (phi : KTwo → ℂ) (hp : IsBFHMatrixCoefficient k phi) (hd : HasBFHDivisor k phi)
    (eps : ℤ) (heps : eps=1 ∨ eps=-1) (y2 : ℝ) (h2 : 0<y2) :
    ∃ F : (ℂ × ℂ) → ℂ,
      DifferentiableOn ℂ F {z | 3/2<z.2.re ∧ 0<(z.1-z.2+5/2).re} ∧
      ∀ s, 2<s.re → ∃ U : ℝ, ∀ u, U<u.re → F (u,s)=novodvorskyTransform k phi eps u s y2 := by sorry


-- MetaplecticAutomorphicForms:MP.8/tau-transform


-- The fixed compact product ηw⁻¹κ_z wJ is obtained from the BFH matrices, not chosen freely.
def tauCompactArgument (z : ℝ) : KTwo := by sorry
def tauKernel (k : ℕ) (phi : KTwo → ℂ) (s : ℂ) (y2 z : ℝ) : ℂ :=
  (deltaZ z : ℂ)^(-s+(k : ℂ)/2)*Complex.exp (-2*Real.pi*y2*deltaZ z)*
    Complex.sqrt (1+Complex.I*z)*phi (tauCompactArgument z)
def tauTransform (k : ℕ) (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ := ∫ z : ℝ, tauKernel k phi s y2 z
lemma tauTransform_zero (k : ℕ) (s : ℂ) (y2 : ℝ) : tauTransform k (fun _ => 0) s y2=0 := by sorry
lemma tauTransform_scalar (k : ℕ) (phi : KTwo → ℂ) (s c : ℂ) (y2 : ℝ) :
    tauTransform k (c • phi) s y2=c*tauTransform k phi s y2 := by sorry
lemma tauTransform_holomorphic (k : ℕ) (phi : KTwo → ℂ) (hp : Continuous phi) (y2 : ℝ) (h2 : 0<y2) :
    Differentiable ℂ (fun s => tauTransform k phi s y2) := by sorry
-- Test: tauTransform_zero_test
example (k : ℕ) (s : ℂ) (y2 : ℝ) : tauTransform k (fun _ => 0) s y2=0 := by sorry
-- Test: tauTransform_base_factor
example (k : ℕ) (s : ℂ) (y2 : ℝ) : tauKernel k (fun _ => 1) s y2 0=Complex.exp (-2*Real.pi*y2) := by sorry
-- Test: tauTransform_weight_two
example (z : ℝ) : (deltaZ z : ℂ)^(-(1 : ℂ)+(2 : ℂ)/2)=1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/degenerate-mellin-coefficients


-- Wc is the continued W⁰ family; its exact construction is supplied by the preceding continuation theorem.
def degenerateMellinCoefficients (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ :=
  ∫ z : ℝ, (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)
def degenerateMellinOpposite (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (s : ℂ) (y2 : ℝ) : ℂ := by sorry
-- Continued-family linearity, measurability and local holomorphic domination are
-- concrete hypotheses of the API below.
lemma degenerateMellinCoefficients_kernel (s : ℂ) (z : ℝ) :
    (deltaZ z : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*z) =
    ((Real.sqrt (1+z^2) : ℝ) : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*z) := by sorry
-- Test: degenerateMellinCoefficients_zero
example (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ) (hz : ∀ y s, Wc (fun _ => 0) y s=0) (s : ℂ) (y2 : ℝ) :
    degenerateMellinCoefficients Wc (fun _ => 0) s y2=0 := by sorry
-- Test: degenerateMellinCoefficients_s_two
example (z : ℝ) : (deltaZ z : ℂ)^(2*(2 : ℂ)-8)=(1+(z : ℂ)^2)^(-2 : ℂ) := by sorry
-- Test: degenerateMellinCoefficients_z_zero
example (s : ℂ) : (deltaZ 0 : ℂ)^(2*s-8)*Complex.sqrt (1+Complex.I*(0 : ℝ))=1 := by sorry


lemma degenerateMellinCoefficients_linear (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (hl : ∀ c phi y s, Wc (c • phi) y s=c*Wc phi y s)
    (phi : KTwo → ℂ) (s c : ℂ) (y2 : ℝ) :
    degenerateMellinCoefficients Wc (c • phi) s y2=c*degenerateMellinCoefficients Wc phi s y2 := by sorry
-- Holomorphy requires the continued W family and its compact-parameter integrable majorants.
lemma degenerateMellinCoefficients_holomorphic (Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ)
    (phi : KTwo → ℂ) (y2 : ℝ) (h2 : 0<y2)
    (hw : ∀ z : ℝ, DifferentiableOn ℂ (fun s =>
      (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)) {s | 3/2<s.re})
    (hmeas : ∀ s : ℂ, AEStronglyMeasurable (fun z : ℝ =>
      (deltaZ z : ℂ)^(2*s-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) s*Complex.sqrt (1+Complex.I*z)))
    (hdom : ∀ s : ℂ, 3/2<s.re → ∃ U : Set ℂ, IsOpen U ∧ s∈U ∧ U⊆{t | 3/2<t.re} ∧
      ∃ B : ℝ → ℝ, Integrable B ∧ ∀ t∈U, ∀ z : ℝ,
        ‖(deltaZ z : ℂ)^(2*t-8)*Wc (fun q => phi (q*kappaZ z)) (deltaZ z*y2) t*Complex.sqrt (1+Complex.I*z)‖≤B z) :
    DifferentiableOn ℂ (fun s => degenerateMellinCoefficients Wc phi s y2) {s | 3/2<s.re} := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-test-nonzero-f


theorem local_test_nonzero_f (k : ℕ) (hk : 2≤k) (he : Even k)
    (u s : ℂ) (hs : 3/2<s.re) (hu : 0<(u-s+5/2).re) :
    ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
      (∀ t y2, 0<y2 → tauTransform k phi t y2=0) ∧
      ∀ eps : ℤ, eps=1 ∨ eps=-1 → ∃ y2 : ℝ, 0<y2 ∧ ∃ F : (ℂ × ℂ) → ℂ,
        DifferentiableOn ℂ F {z | 3/2<z.2.re ∧ 0<(z.1-z.2+5/2).re} ∧ F (u,s)≠0 ∧
        ∀ t, 2<t.re → ∃ U : ℝ, ∀ v, U<v.re → F (v,t)=novodvorskyTransform k phi eps v t y2 := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-test-nonzero-tau


theorem local_test_nonzero_tau (k : ℕ) (hk : 2≤k) (he : Even k) (s : ℂ) (hs : 3/2<s.re) :
    ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
      ∃ y2 : ℝ, 0<y2 ∧ tauTransform k phi s y2≠0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-test-nonzero-m


theorem local_test_nonzero_m (k : ℕ) (hk : 2≤k) (he : Even k) :
    ∃ Wc : (KTwo → ℂ) → ℝ → ℂ → ℂ,
      (∀ psi, IsBFHMatrixCoefficient k psi → ∀ y, 0<y → DifferentiableOn ℂ (Wc psi y) {s | 3/2<s.re}) ∧
      (∀ psi, IsBFHMatrixCoefficient k psi → ∀ y s, 0<y → 2<s.re → Wc psi y s=whittakerFunction k psi 0 1 y s) ∧
      ∃ phi : KTwo → ℂ, IsBFHMatrixCoefficient k phi ∧ HasBFHDivisor k phi ∧
        (∀ s y, 0<y → tauTransform k phi s y=0) ∧
        ∃ y : ℝ, 0<y ∧ degenerateMellinCoefficients Wc phi 2 y≠0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/similitude-heisenberg-comparison


def symplecticPairing (w v : I4 → ℝ) : ℝ := w ⬝ᵥ (Matrix.J (Fin 2) ℝ *ᵥ v)
def heisenbergCoordinatesMul (x y : (I4 → ℝ) × ℝ) : (I4 → ℝ) × ℝ :=
  (x.1+y.1,x.2+y.2+symplecticPairing x.1 y.1/2)
def similitudeCoordinatesAction (g : positiveSimilitudes) (x : (I4 → ℝ) × ℝ) : (I4 → ℝ) × ℝ :=
  ((g.val.1 : M4 ℝ) *ᵥ x.1,(g.val.2 : ℝ)*x.2)
-- OMITTED CONDITION: the MP.6 native Jacobi equivalence and its arithmetic lattices.
theorem similitude_heisenberg_comparison (g : positiveSimilitudes) (x y : (I4 → ℝ) × ℝ) :
    similitudeCoordinatesAction g (heisenbergCoordinatesMul x y)=
      heisenbergCoordinatesMul (similitudeCoordinatesAction g x) (similitudeCoordinatesAction g y) := by sorry


-- MetaplecticAutomorphicForms:MP.8/full-real-cover


def coverConjugation : MulAut similitudeCover := by sorry
def coverReflectionAction : Multiplicative (ZMod 2) →* MulAut similitudeCover := by sorry
abbrev fullRealCover := SemidirectProduct similitudeCover (Multiplicative (ZMod 2)) coverReflectionAction
def fullRealProjection : fullRealCover →* (M4 ℝ)ˣ := by sorry
lemma fullRealCover_positive (g : similitudeCover) :
    fullRealProjection ⟨g,1⟩ = g.base.val.1 := by sorry
lemma fullRealCover_kernel (g : fullRealCover) (h : fullRealProjection g=1) :
    g.right=1 ∧ ((∀ z, g.left.root z=1) ∨ (∀ z, g.left.root z=-1)) := by sorry
lemma fullRealCover_reflection :
    (⟨1,Multiplicative.ofAdd (1 : ZMod 2)⟩ : fullRealCover)^2=1 := by sorry
-- Test: fullRealCover_reflection_test
example : (Matrix.fromBlocks (1 : M2 ℝ) 0 0 (-1))^2=(1 : M4 ℝ) := by sorry
-- Test: fullRealCover_base
example : -(baseMatrix.map star)=baseMatrix := by sorry
-- Test: fullRealCover_central
example (g : similitudeCover) (h : g.base=1) (hroot : ∀ z, g.root z=-1) :
    ∀ z, (coverConjugation g).root z=-1 := by sorry


-- MetaplecticAutomorphicForms:MP.8/arithmetic-adelic-comparison


-- arithmetic_adelic_comparison: signature omitted. MP.4 must supply the native
-- restricted product of local covers, rational splitting, dyadic compact-open lattice
-- stabilizer and rational-similitude extension before this comparison can be typed.
-- Its full statement, prerequisite request and exact gap are in the definitive packet.


-- MetaplecticAutomorphicForms:MP.8/theta-levi-transform


def bfhLevi (Q : M2 ℝ) : M4 ℝ := Matrix.fromBlocks Q 0 0 Q⁻¹ᵀ
theorem theta_levi_transform (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (n : ℤ) (hn : (N : ℤ)∣n) (phi : bfhJacobiFunctions N m 1) (g : positiveSimilitudes) (nu : IVec) :
    thetaComponent N (m/N) 1 phi.toFun (bfhLevi !![1,(n : ℝ);0,1]*(g.val.1 : M4 ℝ)) nu=
      thetaComponent N (m/N) 1 phi.toFun (g.val.1 : M4 ℝ) ((!![1,n;0,1] : M2 ℤ)ᵀ *ᵥ nu) := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-unipotent-transforms


-- The cover-valued lower-unipotent root law remains in the definitive packet;
-- this native signature is its upper-unipotent specialization.
theorem theta_unipotent_transforms (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (phi : bfhJacobiFunctions N m 1) (g : positiveSimilitudes) (r : ℤ)
    (Vv : M2 ℤ) (hv : Vvᵀ=Vv) (h00 : (N : ℤ)∣Vv 0 0) (h01 : (N : ℤ)∣Vv 0 1)
    (h11 : (4*(m : ℤ))∣Vv 1 1) :
    thetaComponent N (m/N) 1 phi.toFun (unipotent (Vv.map (fun z => (z : ℝ)))*(g.val.1 : M4 ℝ)) ![0,r]=
      thetaComponent N (m/N) 1 phi.toFun (g.val.1 : M4 ℝ) ![0,r] := by sorry


-- MetaplecticAutomorphicForms:MP.8/coefficient-levi-transform


-- Native quadratic-form congruence gives the exact yᵀTy matrix relation.
theorem coefficient_levi_transform (Q : QuadraticForm ℤ IVec) (y : M2 ℤ) :
    quadraticMatrix (Q.comp (Matrix.toLin' y))=
      (y.map (fun z : ℤ => (z : ℚ)))ᵀ*quadraticMatrix Q*(y.map (fun z : ℤ => (z : ℚ))) := by sorry
-- The actual B_j/C_j covariance additionally imports the cusp subgroup and residue transport.


-- MetaplecticAutomorphicForms:MP.8/matrix-mobius
def matrixMobius (H : M2 ℤ) : ℤ := by sorry
lemma matrixMobius_unimodular (H : (M2 ℤ)ˣ) : matrixMobius H = 1 := by sorry
lemma matrixMobius_smith (a b : ℕ) (ha : 0<a) (hb : 0<b) (hab : a∣b) :
    matrixMobius !![(a : ℤ),0;0,(b : ℤ)] =
      (Nat.gcd a b : ℤ)*ArithmeticFunction.moebius a*ArithmeticFunction.moebius b := by sorry
lemma matrixMobius_equiv (H : M2 ℤ) (U Vv : (M2 ℤ)ˣ) :
    matrixMobius ((U : M2 ℤ)*H*(Vv : M2 ℤ)) = matrixMobius H := by sorry
-- Test: matrixMobius_identity
example : matrixMobius (1 : M2 ℤ) = 1 := by sorry
-- Test: matrixMobius_scalar_prime
example (p : ℕ) (hp : p.Prime) : matrixMobius ((p : ℤ) • (1 : M2 ℤ)) = p := by sorry
-- Test: matrixMobius_square_prime
example (p : ℕ) (hp : p.Prime) : matrixMobius !![((p : ℤ)^2),0;0,1] = 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/primitive-symplectic-pairs
def primitivePair (C D : M2 ℤ) : Prop :=
  ∀ G : M2 ℚ, (∀ i j, ∃ z : ℤ, (G*C.map (fun z => (z : ℚ))) i j = z) →
    (∀ i j, ∃ z : ℤ, (G*D.map (fun z => (z : ℚ))) i j = z) →
    ∀ i j, ∃ z : ℤ, G i j = z
theorem primitive_symplectic_pairs (C D : M2 ℤ) (hs : C*Dᵀ=D*Cᵀ)
    (hr : ∀ v : Fin 2 → ℚ, v ᵥ* C.map (fun z => (z : ℚ)) = 0 → v ᵥ* D.map (fun z => (z : ℚ)) = 0 → v = 0) :
    primitivePair C D ↔ ∃ g : Matrix.symplecticGroup (Fin 2) ℤ,
      (∀ i j, (g : M4 ℤ) (.inr i) (.inl j)=C i j) ∧
      (∀ i j, (g : M4 ℤ) (.inr i) (.inr j)=D i j) := by sorry


-- MetaplecticAutomorphicForms:MP.8/matrix-mobius-divisor-identity


abbrev MatrixDivisors (C : M2 ℤ) := {L : Submodule ℤ IVec // LinearMap.range (Matrix.toLin' C) ≤ L}
-- Choose a Z-basis of the full lattice; the μ₂ value does not depend on this choice.
def matrixDivisorRepresentative (C : M2 ℤ) (L : MatrixDivisors C) : M2 ℤ := by sorry
theorem matrix_mobius_divisor_identity (C : M2 ℤ) (hc : C.det≠0) :
    (∑' L : MatrixDivisors C, (matrixMobius (matrixDivisorRepresentative C L) : ℂ))=
      if IsUnit C.det then 1 else 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/matrix-mobius-inversion


-- These computational sums range over the actual symmetric-pair translation quotient.
def symmetricPairSum (N : ℕ) (restricted primitive : Bool) (C : M2 ℤ) (h : M2 ℚ → ℂ) : ℂ := by sorry
def matrixDivisorQuotient (C : M2 ℤ) (L : MatrixDivisors C) : M2 ℤ := by sorry
theorem matrix_mobius_inversion (C : M2 ℤ) (hc : C.det≠0) (h : M2 ℚ → ℂ)
    (hp : ∀ X : M2 ℚ, Xᵀ=X → ∀ S : M2 ℤ, Sᵀ=S → h (X+S.map (fun z => (z : ℚ)))=h X) :
    symmetricPairSum 1 false true C h=
      ∑' L : MatrixDivisors C, (matrixMobius (matrixDivisorRepresentative C L) : ℂ)*
        symmetricPairSum 1 false false (matrixDivisorQuotient C L) h := by sorry


-- MetaplecticAutomorphicForms:MP.8/finite-exponential-sums


def finiteExponentialSums (j : Fin 2) (N : ℕ) (m : ℤ) (C : M2 ℤ)
    (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry
-- The phase on the cusp-one representatives, with the exact native quadratic-form dictionary.
def firstCuspPhase (N : ℕ) (m : ℤ) (C D : M2 ℤ) (T : QuadraticForm ℤ IVec) (R l : IVec) : ℂ :=
  let A := (C.map (fun z => (z : ℚ)))⁻¹ * D.map (fun z => (z : ℚ))
  expTwoPi (-(ivCast R ⬝ᵥ (A.map (fun q => (q : ℂ)) *ᵥ ivCast l)) +
    m*quad (A.map (fun q => (q : ℂ))) (ivCast l) +
    (1/(N : ℂ))*((quadraticMatrix T * A).trace : ℚ))
lemma finiteExponentialSums_well_defined (N : ℕ) (m : ℤ) (C D S : M2 ℤ)
    (hc : C.det≠0) (hd : C*Dᵀ=D*Cᵀ) (hs : Sᵀ=S) (T : QuadraticForm ℤ IVec) (R l h : IVec) :
    firstCuspPhase N m C (D+(N : ℤ) • (C*S)) T R (l+Cᵀ *ᵥ h)=firstCuspPhase N m C D T R l := by sorry
lemma finiteExponentialSums_identity (N : ℕ) (hN : 0<N) (m : ℤ)
    (T : QuadraticForm ℤ IVec) (R : IVec) : finiteExponentialSums 1 N m 1 T R=1 := by sorry
lemma finiteExponentialSums_bad_determinant (N : ℕ) (hN : 0<N) (m : ℤ) (C : M2 ℤ)
    (hc : C.det≠0) (hbad : 1<Int.gcd C.det N) (T : QuadraticForm ℤ IVec) (R : IVec) :
    finiteExponentialSums 1 N m C T R=0 := by sorry
-- Test: finiteExponentialSums_identity_test
example : finiteExponentialSums 1 1 1 1 0 0=1 := by sorry
-- Test: finiteExponentialSums_bad_prime
example (p N : ℕ) (hp : p.Prime) (hN : 0<N) (hd : p∣N) (T : QuadraticForm ℤ IVec) (R : IVec) :
    finiteExponentialSums 1 N 1 ((p : ℤ) • (1 : M2 ℤ)) T R=0 := by sorry
-- Test: finiteExponentialSums_gauss
example : finiteExponentialSums 1 1 1 (!![1,0;0,3] : M2 ℤ) 0 0=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/fourier-unfolding-kernel


def fourierUnfoldingKernel (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s : ℂ)
    (C : M2 ℤ) (T : M2 ℚ) (R : IVec) : ℂ :=
  (1/(2*m*(N : ℂ)^3)) * ∫ x : Fin 3 → ℝ,
    let Y := Q*Qᵀ
    let Z := (symCoords x).map (fun a : ℝ => (a : ℂ)) + Complex.I • Y.map (fun a : ℝ => (a : ℂ))
    Complex.sqrt (-Z.det) * Complex.exp (s/2*Real.log (Y.det/‖Z.det‖^2)) *
      I (Matrix.fromBlocks (0 : M2 ℝ) (-(C.map (fun z => (z : ℝ)))⁻¹ᵀ) (C.map (fun z => (z : ℝ))) 0 *
        Matrix.fromBlocks Q ((symCoords x)*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) *
      expTwoPi (quad Z (ivCast R)/(4*m) - (1/(N : ℂ))*((T.map (fun q => (q : ℂ))*Z).trace))
lemma fourierUnfoldingKernel_zero (N : ℕ) (m : ℤ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (fun _ => 0) Q s C T R=0 := by sorry
lemma fourierUnfoldingKernel_linear (N : ℕ) (m : ℤ) (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s c : ℂ)
    (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (c • I) Q s C T R=c*fourierUnfoldingKernel N m I Q s C T R := by sorry
lemma fourierUnfoldingKernel_discriminant (N : ℕ) (hN : 0<N) (m : ℤ) (hm : m≠0)
    (I : M4 ℝ → ℂ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (Uq : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m I Q s C ((1/(4*m : ℚ)) • (Uq+(N : ℚ) • Matrix.vecMulVec (fun i => (R i : ℚ)) (fun i => (R i : ℚ)))) R =
      fourierUnfoldingKernel N m I Q s C ((1/(4*m : ℚ)) • Uq) 0 := by sorry
-- Test: fourierUnfoldingKernel_zero_test
example (N : ℕ) (m : ℤ) (Q : M2 ℝ) (s : ℂ) (C : M2 ℤ) (T : M2 ℚ) (R : IVec) :
    fourierUnfoldingKernel N m (fun _ => 0) Q s C T R=0 := by sorry
-- Test: fourierUnfoldingKernel_base_root
example : Complex.sqrt (-baseMatrix.det)=1 := by sorry
-- Test: fourierUnfoldingKernel_shift_test
example (Z : M2 ℂ) : quad Z ![0,1]/(4*(16 : ℂ)) - (1/(8 : ℂ))*((!![0,0;0,(1/8 : ℂ)]*Z).trace)=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/cusp-one-unfolding


-- Quotient relation: left Γ⁰(N) multiplication on nonsingular C with N|C₁₂.
def firstCuspSetoid (N : ℕ) : Setoid {C : M2 ℤ // C.det≠0 ∧ (N : ℤ)∣C 0 1} := by sorry
abbrev FirstCuspClasses (N : ℕ) := Quotient (firstCuspSetoid N)
def firstCuspRepresentative (N : ℕ) (c : FirstCuspClasses N) : M2 ℤ := by sorry
-- OMITTED HYPOTHESES: I is the BFH elliptic newform seed with its exact covariance.
theorem cusp_one_unfolding (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (I : M4 ℝ → ℂ) (Q : M2 ℝ) (hQ : (Q*Qᵀ).PosDef)
    (X : M2 ℝ) (hX : Xᵀ=X) (T : QuadraticForm ℤ IVec) (R : IVec) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      fourierCoefficient N 1 (jacobiEisenstein N m I s) (Matrix.fromBlocks Q (X*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) T R=
      ∑' c : FirstCuspClasses N,
        finiteExponentialSums 1 N m (firstCuspRepresentative N c) T R *
          ((firstCuspRepresentative N c).det.natAbs : ℂ)^(-s)*
          fourierUnfoldingKernel N m I Q s (firstCuspRepresentative N c) (quadraticMatrix T) R := by sorry


-- MetaplecticAutomorphicForms:MP.8/cusp-zero-rank-expansion


def zeroCuspSetoid (N : ℕ) : Setoid {C : M2 ℤ // C.det≠0 ∧ ∀ i j, (N : ℤ)∣C i j} := by sorry
abbrev ZeroCuspClasses (N : ℕ) := Quotient (zeroCuspSetoid N)
def zeroCuspRepresentative (N : ℕ) (c : ZeroCuspClasses N) : M2 ℤ := by sorry
-- These are the original rank-C=1 and rank-C=0 terms of (5.4), before cancellation.
def rankOneCoefficient (N m : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry
def rankZeroCoefficient (N m : ℕ) (I : M4 ℝ → ℂ) (s : ℂ) (g : M4 ℝ) (T : QuadraticForm ℤ IVec) (R : IVec) : ℂ := by sorry
-- OMITTED HYPOTHESES: I is the specified BFH newform seed.
theorem cusp_zero_rank_expansion (N m : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (I : M4 ℝ → ℂ) (Q : M2 ℝ) (hQ : (Q*Qᵀ).PosDef)
    (X : M2 ℝ) (hX : Xᵀ=X) (T : QuadraticForm ℤ IVec) (R : IVec) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      fourierCoefficient N 0 (jacobiEisenstein N m I s) (Matrix.fromBlocks Q (X*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) T R=
      (∑' c : ZeroCuspClasses N, finiteExponentialSums 0 N m (zeroCuspRepresentative N c) T R *
        ((zeroCuspRepresentative N c).det.natAbs : ℂ)^(-s)*(N : ℂ)^3*
        fourierUnfoldingKernel N m I Q s (zeroCuspRepresentative N c) ((N : ℚ) • quadraticMatrix T) ((N : ℤ) • R)) +
      rankOneCoefficient N m I s (Matrix.fromBlocks Q (X*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) T R +
      rankZeroCoefficient N m I s (Matrix.fromBlocks Q (X*Q⁻¹ᵀ) 0 Q⁻¹ᵀ) T R := by sorry


-- MetaplecticAutomorphicForms:MP.8/whittaker-coefficient-extraction


-- j indexes the two actual theta-component families; cusp zero is extended by zero outside 4m|D.
def whittakerCoefficientExtraction (j : Fin 2) (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) : ℂ := by sorry
lemma whittakerCoefficientExtraction_linear (j : Fin 2) (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) (c : ℂ) :
    whittakerCoefficientExtraction j N m (c • C) D r q y1 y2=c*whittakerCoefficientExtraction j N m C D r q y1 y2 := by sorry
-- A native scalar period integral exposes the interval-independence API.
def periodCoefficient (N : ℕ) (q : ℤ) (f : ℝ → ℂ) (a : ℝ) : ℂ :=
  (1/(N : ℂ))*∫ x in Set.Icc a (a+N), f x*expTwoPi (-(q : ℂ)*x/N)
lemma whittakerCoefficientExtraction_period (N : ℕ) (hN : 0<N) (q : ℤ) (f : ℝ → ℂ)
    (hf : Continuous f) (hp : ∀ x, f (x+N)=f x) (a : ℝ) : periodCoefficient N q f a=periodCoefficient N q f 0 := by sorry
-- The zero extension is part of the computational definition.
lemma whittakerCoefficientExtraction_parity (N : ℕ) (m : ℤ)
    (C : M4 ℝ → M2 ℚ → IVec → ℂ) (D r : ℤ) (q : ℕ) (y1 y2 : ℝ) (h : ¬4*m∣D) :
    whittakerCoefficientExtraction 0 N m C D r q y1 y2=0 := by sorry
-- Test: whittakerCoefficientExtraction_zero
example (j : Fin 2) (N : ℕ) (m D r : ℤ) (q : ℕ) (y1 y2 : ℝ) :
    whittakerCoefficientExtraction j N m (fun _ _ _ => 0) D r q y1 y2=0 := by sorry
-- Test: whittakerCoefficientExtraction_frequency
example (N : ℕ) (hN : 0<N) (q : ℤ) (c : ℂ) : periodCoefficient N q (fun x => expTwoPi ((q : ℂ)*x/N)*c) 0=c := by sorry
-- Test: whittakerCoefficientExtraction_wrong_frequency
example (N : ℕ) (hN : 0<N) (q r : ℤ) (h : q≠r) (c : ℂ) :
    periodCoefficient N r (fun x => expTwoPi ((q : ℂ)*x/N)*c) 0=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-l-dirichlet-series


def bfhLTerm (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) (alpha beta delta : ℕ) : ℂ :=
  if 0<alpha ∧ 0<delta ∧ beta<N*delta ∧ N∣beta ∧ alpha∣q*delta then
    finiteExponentialSums 1 N m (!![(alpha : ℤ),(beta : ℤ);0,(delta : ℤ)])
      (n1 • QuadraticMap.proj 1 1) ![0,r] * ((alpha*delta : ℕ) : ℂ)^(-s) *
      ((alpha : ℂ)/delta)^((k : ℂ)/2) * a (q*delta/alpha) * expTwoPi ((q : ℂ)*beta/(N*alpha))
  else 0
def bfhLDirichletSeries (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) : ℂ :=
  ∑' t : ℕ × ℕ × ℕ, bfhLTerm N k m r n1 q a s t.1 t.2.1 t.2.2
lemma bfhLDirichletSeries_scalar (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s c : ℂ) :
    bfhLDirichletSeries N k m r n1 q (c • a) s=c*bfhLDirichletSeries N k m r n1 q a s := by sorry
lemma bfhLDirichletSeries_identity_term (N k : ℕ) (hN : 0<N) (m r n1 : ℤ) (q : ℕ) (a : ℕ → ℂ) (s : ℂ) :
    bfhLTerm N k m r n1 q a s 1 0 1=a q := by sorry
lemma bfhLDirichletSeries_specialize (N k : ℕ) (m r n1 : ℤ) (a : ℕ → ℂ) (s : ℂ) :
    bfhLDirichletSeries N k m r n1 1 a s=∑' t : ℕ × ℕ × ℕ, bfhLTerm N k m r n1 1 a s t.1 t.2.1 t.2.2 := by sorry
-- Test: bfhLDirichletSeries_zero
example (N k : ℕ) (m r n1 : ℤ) (q : ℕ) (s : ℂ) : bfhLDirichletSeries N k m r n1 q (fun _ => 0) s=0 := by sorry
-- Test: bfhLDirichletSeries_normalized_term
example (N k : ℕ) (hN : 0<N) (m r n1 : ℤ) (a : ℕ → ℂ) (ha : a 1=1) (s : ℂ) : bfhLTerm N k m r n1 1 a s 1 0 1=1 := by sorry
-- Test: bfhLDirichletSeries_divisibility
example (N k : ℕ) (m r n1 : ℤ) (a : ℕ → ℂ) (s : ℂ) : bfhLTerm N k m r n1 1 a s 2 0 1=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/bfh-p-dirichlet-series


-- The transformed cusp coefficient function is imported from upstream ModularForms layer 6; use its actual matrices here.
def bfhPDirichletSeries (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) : ℂ := by sorry
lemma bfhPDirichletSeries_scalar (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s c : ℂ) :
    bfhPDirichletSeries N k m D r q (c • aCusp) s=c*bfhPDirichletSeries N k m D r q aCusp s := by sorry
lemma bfhPDirichletSeries_residue (N k : ℕ) (hN : 0<N) (m D r : ℤ) (hm : (N : ℤ)∣m)
    (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries N k m D (r+2*m/N) q aCusp s=bfhPDirichletSeries N k m D r q aCusp s := by sorry
lemma bfhPDirichletSeries_parity (N k : ℕ) (m D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ)
    (h : ¬4*m∣D) : bfhPDirichletSeries N k m D r q aCusp s=0 := by sorry
-- Test: bfhPDirichletSeries_zero
example (N k : ℕ) (m D r : ℤ) (q : ℕ) (s : ℂ) : bfhPDirichletSeries N k m D r q (fun _ _ => 0) s=0 := by sorry
-- Test: bfhPDirichletSeries_residue_test
example (k : ℕ) (D r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries 8 k 16 D (r+4) q aCusp s=bfhPDirichletSeries 8 k 16 D r q aCusp s := by sorry
-- Test: bfhPDirichletSeries_nonintegral
example (k : ℕ) (r : ℤ) (q : ℕ) (aCusp : M2 ℤ → ℕ → ℂ) (s : ℂ) :
    bfhPDirichletSeries 8 k 16 1 r q aCusp s=0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/first-cusp-whittaker-expansion


-- OMITTED HYPOTHESES: C is the actual first-cusp theta coefficient family of the
-- BFH elliptic-newform Eisenstein series at s, and a is the original normalized f.
theorem first_cusp_whittaker_expansion (N m k : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (C : ℂ → M4 ℝ → M2 ℚ → IVec → ℂ) (a : ℕ → ℂ) (phi : KTwo → ℂ)
    (hp : IsBFHMatrixCoefficient k phi) (D r : ℤ) (hD : D≠0) (q : ℕ) (hq : 0<q)
    (hindex : (4*(m : ℤ))∣((N : ℤ)*(r^2-D)))
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      whittakerCoefficientExtraction 1 N m (C s) D r q y1 y2=
      (((q : ℂ)/N)*(D.natAbs : ℂ)/(4*m))^(s-4)*((q : ℂ)/N)^(-(k : ℂ)/2)*
        expTwoPi (Complex.I*y1*D/(4*m))*
        bfhLDirichletSeries N k m r ((N : ℤ)*(r^2-D)/(4*m)) q a s*
        whittakerFunction k phi D.sign ((D.natAbs : ℝ)*y1/(4*m)) ((q : ℝ)/N*y2) s := by sorry


-- MetaplecticAutomorphicForms:MP.8/opposite-cusp-whittaker-expansion


-- OMITTED HYPOTHESES: C is the actual opposite-cusp coefficient family, aCusp its
-- Fricke/cusp seed, and phiW(q)=T(vσ(qw)) with the specified w.
theorem opposite_cusp_whittaker_expansion (N m k : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (C : ℂ → M4 ℝ → M2 ℚ → IVec → ℂ) (aCusp : M2 ℤ → ℕ → ℂ) (phiW : KTwo → ℂ)
    (D r : ℤ) (hD : D≠0) (hindex : (4*(m : ℤ))∣D) (q : ℕ) (hq : 0<q)
    (y1 y2 : ℝ) (h1 : 0<y1) (h2 : 0<y2) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      whittakerCoefficientExtraction 0 N m (C s) D r q y1 y2=
      (N : ℂ)^3*(((q : ℂ)/N)*(D.natAbs : ℂ)/(4*m))^(s-4)*((q : ℂ)/N)^(-(k : ℂ)/2)*
        expTwoPi (Complex.I*y1*D/(4*m))*bfhPDirichletSeries N k m D r q aCusp s*
        whittakerFunction k phiW D.sign ((D.natAbs : ℝ)*y1/(4*m)) ((q : ℝ)/N*y2) s := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-prime-root-counts


-- n0 is a chosen integer representative of n1/N in the required p-power ring.
-- The CRT comparison proves representative independence before using these counts.
def localPrimeRootCounts (p a _b d : ℕ) (m r n0 : ℤ) : ℕ :=
  Nat.card {v : Fin (p^a) × Fin (p^d) //
    Int.ModEq (p^a) (m*(v.1.val : ℤ)^2) 0 ∧
    Int.ModEq (p^(min a d)) (2*m*v.1.val*v.2.val-r*v.1.val) 0 ∧
    Int.ModEq (p^d) (m*(v.2.val : ℤ)^2-r*v.2.val+n0) 0}
def thirdPrimeRootCounts (p a b d : ℕ) (m r n0 : ℤ) : ℕ :=
  Nat.card {v : Fin (p^b) × Fin (p^(a+d-b)) //
    Int.ModEq (p^b) (m*(v.1.val : ℤ)^2+r*v.1.val+n0) 0 ∧
    Int.ModEq (p^b) (2*m*v.1.val*v.2.val+r*v.2.val-r*(p : ℤ)^(a-b)*v.1.val-2*(p : ℤ)^(a-b)*n0) 0 ∧
    Int.ModEq (p^(a+d-b)) (m*(v.2.val : ℤ)^2-r*(p : ℤ)^(a-b)*v.2.val+(p : ℤ)^(2*(a-b))*n0) 0}
lemma localPrimeRootCounts_zero_exponents (p b : ℕ) (m r n0 : ℤ) : localPrimeRootCounts p 0 b 0 m r n0=1 := by sorry
lemma localPrimeRootCounts_finite (p a b d : ℕ) (m r n0 : ℤ) : localPrimeRootCounts p a b d m r n0≤p^a*p^d := by sorry
lemma localPrimeRootCounts_quadratic (p b d : ℕ) (m r n0 : ℤ) :
    localPrimeRootCounts p 0 b d m r n0=Nat.card {v : Fin (p^d) // Int.ModEq (p^d) (m*(v.val : ℤ)^2-r*v.val+n0) 0} := by sorry
-- Test: localPrimeRootCounts_base
example : localPrimeRootCounts 3 0 0 0 1 0 0=1 := by sorry
-- Test: localPrimeRootCounts_split
example : localPrimeRootCounts 3 0 0 1 1 0 (-1)=2 := by sorry
-- Test: localPrimeRootCounts_nonsplit
example : localPrimeRootCounts 3 0 0 1 1 0 1=0 := by sorry


-- Test: localPrimeRootCounts_mixed_modulus
example : localPrimeRootCounts 3 2 2 1 16 1 0=6 := by sorry

-- MetaplecticAutomorphicForms:MP.8/local-root-count-table


-- Prototype: the h=0, a=0 row, avoiding an untyped fundamental-character field.
theorem local_root_count_table (p d : ℕ) (hp : p.Prime) (hp2 : p≠2) (hd : 0<d)
    (m r n0 : ℤ) (hm : ¬(p : ℤ)∣m)
    (hD : ¬(p : ℤ)∣(r^2-4*m*n0)) :
    localPrimeRootCounts p 0 0 d m r n0=
      if ∃ x : Fin p, Int.ModEq p ((x.val : ℤ)^2) (r^2-4*m*n0) then 2 else 0 := by sorry


-- MetaplecticAutomorphicForms:MP.8/local-mobius-factors


-- S is the concrete unrestricted local sum; the μ₂-inverted value uses only these four divisors.
def invertedLocalSum (p a b d : ℕ) (S : ℕ → ℕ → ℕ → ℂ) : ℂ := by sorry
theorem local_mobius_factors (p a b d : ℕ) (hp : p.Prime) (hd : 0<d) (S : ℕ → ℕ → ℕ → ℂ) :
    invertedLocalSum p a b d S=
      if a=0 ∨ b=0 then S a b d-(p : ℂ)*S a b (d-1)
      else S a b d-(p : ℂ)^2*S (a-1) (b-1) d-(p : ℂ)*S a b (d-1)+
        (p : ℂ)^3*S (a-1) (b-1) (d-1) := by sorry


-- MetaplecticAutomorphicForms:MP.8/unramified-euler-factors


def unramifiedLocalSeries (p k : ℕ) (a : ℕ → ℂ) (Sp : ℕ → ℕ → ℕ → ℂ) (s : ℂ) : ℂ :=
  1 + ∑' d : ℕ, if 0<d then ∑ aa∈Finset.range (d+1),
    (p : ℂ)^(d-aa)*(Sp aa aa d-(if aa=0 then 0 else Sp aa (aa-1) d))*
      (p : ℂ)^(-((aa+d : ℕ) : ℂ)*s-((d-aa : ℕ) : ℂ)*k/2)*a (d-aa) else 0
-- a(j) denotes the original newform coefficient at p^j.
-- OMITTED HYPOTHESES: Sp(a,b,d) is the actual primitive exponential sum
-- for [[p^a,p^b],[0,p^d]], D is fundamental and chi=χ_D(p); p is away from 2mN.
-- The first exponent is fixed in the beta-difference; only b changes.
theorem unramified_euler_factors (p k : ℕ) (hp : p.Prime)
    (sig sig' : ℂ) (hprod : sig*sig'=(p : ℂ)^(k-1)) (chi : ℤ)
    (a : ℕ → ℂ) (ha0 : a 0=1) (ha1 : a 1=sig+sig')
    (harec : ∀ j, a (j+2)=(sig+sig')*a (j+1)-(p : ℂ)^(k-1)*a j)
    (Sp : ℕ → ℕ → ℕ → ℂ) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re →
      unramifiedLocalSeries p k a Sp s=
        ((1-sig^2*(p : ℂ)^(4-k-2*s))*(1-sig'^2*(p : ℂ)^(4-k-2*s))*(1-(p : ℂ)^(3-2*s)))/
        ((1-chi*sig*(p : ℂ)^(2-(k : ℂ)/2-s))*(1-chi*sig'*(p : ℂ)^(2-(k : ℂ)/2-s))) := by sorry


-- MetaplecticAutomorphicForms:MP.8/squarefactor-polynomial-bound


-- OMITTED HYPOTHESES: b is the finite Dirichlet polynomial produced by (7.35)
-- from the fixed normalized newform's local factors and its coefficient bound.
theorem squarefactor_polynomial_bound (b : ℂ → ℕ → ℂ) (eps : ℝ) (he : 0<eps) :
    ∃ C : ℝ, 0≤C ∧ ∀ s : ℝ, 2≤s → ∀ D1 : ℕ, 0<D1 →
      ‖b (s : ℂ) D1‖≤C*Real.rpow D1 (1/2+eps) := by sorry


-- MetaplecticAutomorphicForms:MP.8/theta-normal-convergence


-- The uniform Gaussian majorant is a native summable family, before derivative refinements.
theorem theta_normal_convergence (a : ℕ) (ha : 0<a) (nu : IVec)
    (S : Set (SiegelSpace × CVec)) (hS : IsCompact S) :
    ∃ B : IVec → ℝ, Summable B ∧ ∀ p∈S, ∀ R : IVec,
      (∀ i, Int.ModEq (2*(a : ℤ)) (R i) (nu i)) →
        ‖expTwoPi (quad p.1.val (ivCast R)/(4*a) + ivCast R ⬝ᵥ p.2)‖≤B R := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-induced-comparison


def genuineThetaLift (E : M4 ℝ → ℂ) (g : similitudeCover) : ℂ := g.root siegelSpace_base*E g.base.val.1
-- Native central-character part of the comparison. OMITTED INTERFACE: the normalized
-- adelic induced space Ind(π̃_f |det|^(s−2)), its section covariance and measures.
theorem genuine_induced_comparison (E : M4 ℝ → ℂ) (g z : similitudeCover)
    (hz : z.base=1) (hr : ∀ q, z.root q=-1) :
    genuineThetaLift E (g*z)=-genuineThetaLift E g := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-initial-convergence


-- The scalar coordinate conclusion is native. OMITTED CONDITIONS: I is the BFH
-- inducing section, the finite cover/arithmetic comparison and its AS.1 majorants.
theorem genuine_eisenstein_initial_convergence (N m : ℕ) (I : M4 ℝ → ℂ) :
    ∃ S : ℝ, ∀ s : ℂ, S<s.re → ∀ g : positiveSimilitudes, ∀ W : CVec,
      Summable (fun t : BFHCosets N × IVec =>
        jacobiSummand N m I s (cosetMatrix N t.1) t.2 g.val.1 W) := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-intertwining-operators


def coverUnipotent (x : Fin 3 → ℝ) : similitudeCover := by sorry
def coverFourier : similitudeCover := by sorry
-- Archimedean integral signature. The adelic restricted product and inducing-space
-- covariance are omitted until MP.4 and AS.2 supply the exact native interfaces.
def genuineIntertwiner (_s : ℂ) (F : similitudeCover → ℂ) (g : similitudeCover) : ℂ :=
  ∫ x : Fin 3 → ℝ, F (coverFourier⁻¹*coverUnipotent x*g)
def normalizedGenuineIntertwiner (s : ℂ) (F : similitudeCover → ℂ) : similitudeCover → ℂ := by sorry
lemma genuineIntertwiner_equivariant (s : ℂ) (F : similitudeCover → ℂ) (g h : similitudeCover) :
    genuineIntertwiner s (fun q => F (q*h)) g=genuineIntertwiner s F (g*h) := by sorry
lemma genuineIntertwiner_integral (s : ℂ) (F : similitudeCover → ℂ) (g : similitudeCover) :
    genuineIntertwiner s F g=∫ x : Fin 3 → ℝ, F (coverFourier⁻¹*coverUnipotent x*g) := by sorry
-- OMITTED HYPOTHESES: F is in the normalized genuine induced space and s avoids
-- the operator pole divisors; the normalization and π_f∨ identification are not yet typed.
lemma genuineIntertwiner_composition (s : ℂ) (F : similitudeCover → ℂ) :
    normalizedGenuineIntertwiner (4-s) (normalizedGenuineIntertwiner s F)=F := by sorry
-- Test: genuineIntertwiner_zero
example (s : ℂ) : genuineIntertwiner s (fun _ => 0)=0 := by sorry
-- Test: genuineIntertwiner_central_sign
example (s : ℂ) (F : similitudeCover → ℂ) (z : similitudeCover) (hz : ∀ g, F (g*z)=-F g) :
    ∀ g, genuineIntertwiner s F (g*z)=-genuineIntertwiner s F g := by sorry
-- Test: genuineIntertwiner_reflection
example (s : ℂ) : 4-(4-s)=s := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-constant-term


-- Euclidean archimedean integral coordinate. The adelic quotient and induced-space
-- covariance hypotheses are omitted until MP.4 and AS.1/2 provide native interfaces.
def genuineConstantTerm (E : similitudeCover → ℂ) (g : similitudeCover) : ℂ :=
  ∫ x in Set.pi Set.univ (fun _ : Fin 3 => Set.Icc (0 : ℝ) 1), E (coverUnipotent x*g)
-- OMITTED CONDITIONS: E is the genuine BFH Eisenstein sum of F, including rational
-- unipotent periodicity, cuspidal inducing data and the common convergence chamber.
theorem genuine_constant_term (s : ℂ) (F E : similitudeCover → ℂ) (g : similitudeCover) :
    genuineConstantTerm E g=F g+genuineIntertwiner s F g := by sorry


-- MetaplecticAutomorphicForms:MP.8/genuine-eisenstein-continuation


-- OMITTED CONDITIONS: E is the actual BFH sum with its induced covariance and
-- arithmetic data; the contragredient identification and operator topology are untyped.
theorem genuine_eisenstein_continuation
    (E : ℂ → (similitudeCover → ℂ) → similitudeCover → ℂ) :
    ∃ Ec : ℂ → (similitudeCover → ℂ) → similitudeCover → ℂ,
      (∀ F g, MeromorphicOn (fun s => Ec s F g) Set.univ) ∧
      (∃ S : ℝ, ∀ s F g, S<s.re → Ec s F g=E s F g) ∧
      ∀ s F g, Ec s F g=Ec (4-s) (normalizedGenuineIntertwiner s F) g := by sorry


-- MetaplecticAutomorphicForms:MP.8/opposite-cusp-zero-regularity


-- OMITTED HYPOTHESES: aCusp is the actual Fricke/cusp expansion of the normalized
-- weight-k newform at conductor M, with 8M|N, 4m|N² and N|m.
theorem opposite_cusp_zero_regularity (N k : ℕ) (m r : ℤ) (aCusp : M2 ℤ → ℕ → ℂ) :
    ∃ P : ℂ → ℂ, ∃ U : Set ℂ, IsOpen U ∧ (2 : ℂ)∈U ∧ DifferentiableOn ℂ P U ∧
      ∃ S : ℝ, ∀ s, S<s.re → P s=bfhPDirichletSeries N k m 0 r 1 aCusp s := by sorry


-- MetaplecticAutomorphicForms:MP.8/fourier-residue-interchanges


-- The meromorphic residue statement is applied to local denominator-cleared families.
-- This prototype records the holomorphic integral consequence; the residue topology
-- and infinite-sum extensions are omitted pending AS.2/MP.4 interfaces.
theorem fourier_residue_interchanges (f : ℂ → (Fin 3 → ℝ) → ℂ) (U : Set ℂ) (hU : IsOpen U)
    (hf : ∀ x, DifferentiableOn ℂ (fun s => f s x) U)
    (hm : ∀ s, AEStronglyMeasurable (f s))
    (hdom : ∀ s∈U, ∃ Vv : Set ℂ, IsOpen Vv ∧ s∈Vv ∧ Vv⊆U ∧
      ∃ B : (Fin 3 → ℝ) → ℝ, Integrable B ∧ ∀ t∈Vv, ∀ x, ‖f t x‖≤B x) :
    DifferentiableOn ℂ (fun s => ∫ x, f s x) U := by sorry


-- MetaplecticAutomorphicForms:MP.8/two-variable-twist-series


-- L is the computational coefficient argument; the BFH comparison fixes it to the
-- actual first-cusp Dirichlet series and imports its newform hypotheses.
def twoVariableTwistSeries (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s : ℂ) : ℂ :=
  ∑' D : ℤ, if 0<eps*D ∧ Int.ModEq (4*m/N) D (r^2) then
    L s D*(D.natAbs : ℂ)^(s-u-5/2) else 0
lemma twoVariableTwistSeries_scalar (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s c : ℂ) :
    twoVariableTwistSeries eps N m r (c • L) u s=c*twoVariableTwistSeries eps N m r L u s := by sorry
lemma twoVariableTwistSeries_congruence (eps : ℤ) (N : ℕ) (m r : ℤ) (L : ℂ → ℤ → ℂ) (u s : ℂ) :
    twoVariableTwistSeries eps N m r L u s=
      ∑' D : ℤ, if 0<eps*D ∧ Int.ModEq (4*m/N) D (r^2) then L s D*(D.natAbs : ℂ)^(s-u-5/2) else 0 := by sorry
lemma twoVariableTwistSeries_sign (D : ℤ) : ¬(0<D ∧ 0< -D) ∧ ¬0<(1 : ℤ)*0 := by sorry
-- Test: twoVariableTwistSeries_zero
example (eps : ℤ) (N : ℕ) (m r : ℤ) (u s : ℂ) : twoVariableTwistSeries eps N m r (fun _ _ => 0) u s=0 := by sorry
-- Test: twoVariableTwistSeries_modulus
example (u s : ℂ) : twoVariableTwistSeries 1 8 16 1 (fun _ D => if D=1 then 1 else 0) u s=1 := by sorry
-- Test: twoVariableTwistSeries_excluded
example : ¬Int.ModEq 8 (2 : ℤ) (1^2) ∧ ¬Int.ModEq 8 (-1 : ℤ) (1^2) ∧ ¬Int.ModEq 8 (0 : ℤ) (1^2) := by sorry


-- MetaplecticAutomorphicForms:MP.8/two-variable-polar-combination


def bfhPolarTerm (N k : ℕ) (_r : ℤ) (L0 P0 : ℂ → ℂ)
    (M Mt tau : ℂ → ℝ → ℂ) (y2 : ℝ) (u s : ℂ) : ℂ :=
  -(N : ℂ)^(-s+4+(k : ℂ)/2)*L0 s*M s ((N : ℝ)⁻¹*y2)/(u-s+5/2) +
  (N : ℂ)^(7-s-(k : ℂ)/2)*P0 s*(y2 : ℂ)^(2*s-5)*Mt s ((N : ℝ)⁻¹*y2)/(u+s-5/2) +
  (N : ℂ)^(-s)*(y2 : ℂ)^(3-s+(k : ℂ)/2)*tau s ((N : ℝ)⁻¹*y2)/(u-s+3/2)
-- OMITTED CONDITIONS: L,L0,P0 are the actual continued newform BFH coefficients;
-- F±,M,Mt,tau use a single fixed BFH finite K-type and the proven tail estimates.
theorem two_variable_polar_combination (N m k : ℕ) (hN : 0<N) (hm : 0<m) (hNm : N∣m)
    (r : ℤ) (L : ℂ → ℤ → ℂ) (L0 P0 : ℂ → ℂ)
    (Fp Fm : ℂ → ℂ → ℝ → ℂ) (M Mt tau : ℂ → ℝ → ℂ) (y2 : ℝ) (h2 : 0<y2) :
    ∃ A : (ℂ × ℂ) → ℂ,
      (∃ S U : ℝ, ∀ u s : ℂ, S<s.re → U<u.re →
        A (u,s)=(4*(m : ℂ))^(-s+u+5/2)*(N : ℂ)^(-s+4+(k : ℂ)/2)*
          (twoVariableTwistSeries 1 N m r L u s*Fp u s ((N : ℝ)⁻¹*y2)+
           twoVariableTwistSeries (-1) N m r L u s*Fm u s ((N : ℝ)⁻¹*y2))) ∧
      (∀ p : ℂ × ℂ, 3/2<p.2.re → 0<p.1.re → p.2.re-5/2<p.1.re →
        ∃ Vv : Set (ℂ × ℂ), IsOpen Vv ∧ p∈Vv ∧
          ∃ d H : (ℂ × ℂ) → ℂ, DifferentiableOn ℂ d Vv ∧ DifferentiableOn ℂ H Vv ∧
            (∀ U : Set (ℂ × ℂ), IsOpen U → U⊆Vv → U.Nonempty → ∃ q∈U, d q≠0) ∧
            ∀ q∈Vv, d q≠0 → A q=H q/d q) ∧
      ∃ Vv : Set (ℂ × ℂ), IsOpen Vv ∧ ((1/2 : ℂ),(2 : ℂ))∈Vv ∧
        DifferentiableOn ℂ (fun p => A p-bfhPolarTerm N k r L0 P0 M Mt tau y2 p.1 p.2) Vv := by sorry


-- MetaplecticAutomorphicForms:MP.8/bsd2-export


-- Native numerical normalization check in the actual determinant-root convention.
-- OMITTED INTERFACES: the continued upstream newform/twist and symmetric-square
-- L-functions, denominator nonvanishing, and the consumer's residue/noncancellation APIs.
theorem bsd2_export (s : ℂ) : (s-1/2)-3/2=s-2 ∧ -(s-2)+2=4-s := by sorry

end
end TauCeti.Jacobi.GenusTwo
