import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.FieldTheory.IntermediateField.Adjoin.Algebra
import Mathlib.RingTheory.Unramified.Finite
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.LinearAlgebra.ExteriorPower.Basic

/-!
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/HabiroNahmSeries--HB.3.md. These statements suggest
Lean forms so that contributors and reviewers converge on names and signatures.
All bodies are planning placeholders; no implementation is claimed.

The twelve accepted HB.3 declarations in HabiroNahmSeries.json are imported
mathematically, not redeclared here. There is no compiled Bloch-group or Rogers
API at the pinned baseline. Their exact interfaces are recorded in comments at
the end, without introducing replacement types or proposition-valued objects.
-/

noncomputable section
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
