import Mathlib

/-!
# Modularity and Langlands extensions: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
statable against the pinned Mathlib APIs and is not exhaustive. The definitions retain repeated
Hodge numbers, reverse the actual-degree Frobenius polynomial, compare projective images using
one embedded finite field and one conjugation, and impose the orthogonal determinant constraint
before a central quotient. Weight functions are numerical data; attachment to an automorphic
representation is a separate comparison in the README.
-/

namespace TauCetiRoadmap.ModularityAndLanglandsExtensions

open scoped BigOperators MatrixGroups

/-! ## Layer 0: assertions and realization comparisons -/

namespace LanglandsRegister

/-- The four predicted Hodge numbers, as a list retaining repetitions. -/
def singularWeightHodgeList (k : ℕ) (r : ℤ) : List ℤ :=
  [0, r - 2, r + k - 1, k + 2 * r - 3]

/-- The prediction has four positions even when two values coincide. -/
theorem singularWeightHodgeList_length (k : ℕ) (r : ℤ) :
    (singularWeightHodgeList k r).length = 4 := sorry

/-- Nonnegativity of `k` makes the remaining pairwise difference `k + 1` nonzero. -/
theorem singularWeightHodgeList_nodup_iff (k : ℕ) (r : ℤ) :
    (singularWeightHodgeList k r).Nodup ↔
      r ≠ 2 ∧ (k : ℤ) + r ≠ 1 ∧ (k : ℤ) + 2 * r ≠ 3 := sorry

/-- At `r = 2` both pairs coincide. -/
theorem singularWeightHodgeList_r_two (k : ℕ) :
    singularWeightHodgeList k 2 = [0, 0, (k : ℤ) + 1, (k : ℤ) + 1] := sorry

example : singularWeightHodgeList 2 1 = [0, -1, 2, 1] ∧
    (singularWeightHodgeList 2 1).Nodup := by
  norm_num [singularWeightHodgeList]

example : singularWeightHodgeList 0 2 = [0, 0, 1, 1] ∧
    ¬ (singularWeightHodgeList 3 2).Nodup := by
  norm_num [singularWeightHodgeList]

open Polynomial

/-- Mathlib's reverse, specialized to the Frobenius-to-Euler normalization comparison. -/
noncomputable def reciprocalEulerPolynomial {R : Type*} [Semiring R] (Q : R[X]) : R[X] :=
  Q.reverse

/-- A monic characteristic polynomial gives an Euler polynomial with constant term one. -/
theorem reciprocalEulerPolynomial_coeff_zero {R : Type*} [Semiring R]
    (Q : R[X]) (h : Q.Monic) : (reciprocalEulerPolynomial Q).coeff 0 = 1 := sorry

/-- Reverse evaluation uses the inverse of a nonzero field element. -/
theorem reciprocalEulerPolynomial_eval {K : Type*} [Field K] (Q : K[X])
    (x : K) (hx : x ≠ 0) :
    (reciprocalEulerPolynomial Q).eval x * x⁻¹ ^ Q.natDegree = Q.eval x⁻¹ := sorry

/-- The reverse characteristic polynomial of an invertible matrix is the Euler denominator. -/
theorem reciprocalEulerPolynomial_matrix {K : Type*} [Field K]
    {n : ℕ} (A : Matrix.GeneralLinearGroup (Fin n) K) (x : K) :
    (reciprocalEulerPolynomial A.val.charpoly).eval x = (1 - x • A.val).det := sorry

example : reciprocalEulerPolynomial (X - 1 : ℚ[X]) = 1 - X ∧
    (X - 1 : ℚ[X]).eval (1 / 2) ≠ (1 - X : ℚ[X]).eval (1 / 2) := sorry

example (a q : ℚ) : reciprocalEulerPolynomial (X ^ 2 - C a * X + C q) =
    1 - C a * X + C q * X ^ 2 ∧ reciprocalEulerPolynomial (1 : ℚ[X]) = 1 := sorry

/-- In the basis `e², eē, ē²`, conjugation fixes the middle line of `Sym² H¹`. -/
example : Matrix.trace (!![0, 0, 1; 0, 1, 0; 1, 0, 0] : Matrix (Fin 3) (Fin 3) ℤ) = 1 ∧
    Matrix.det (!![0, 0, 1; 0, 1, 0; 1, 0, 0] : Matrix (Fin 3) (Fin 3) ℤ) = -1 := by
  norm_num [Matrix.trace, Matrix.det_fin_three, Fin.sum_univ_succ, Matrix.cons_val']
  decide

end LanglandsRegister

/-! ## Layer 1: weight one, low-rank lifts and residual image conditions -/

namespace SymmetricPower

/-- The NT II finite-field image condition uses the same field and conjugation in both inclusions.
`n` is the rank of the symmetric power, whose degree is `n - 1`. -/
def ProjectiveImageSandwich {G k K : Type*} [Group G] [Field k] [Fintype k]
    [Field K] (p a n : ℕ) (ι : k →+* K)
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) : Prop :=
  Nat.Prime p ∧ 1 ≤ a ∧ 1 ≤ n ∧ Fintype.card k = p ^ a ∧
  Fintype.card k > max 5 (2 * n - 1) ∧
  ∃ c : PGL(2, K),
    ((Matrix.ProjGenLinGroup.map ι).comp
      (Matrix.ProjectiveSpecialLinearGroup.toPGL (n := Fin 2) (R := k))).range ≤
        ((MulAut.conj c).toMonoidHom.comp (Matrix.ProjGenLinGroup.mk.comp ρ)).range ∧
    ((MulAut.conj c).toMonoidHom.comp (Matrix.ProjGenLinGroup.mk.comp ρ)).range ≤
      (Matrix.ProjGenLinGroup.map (n := Fin 2) ι).range

/-- The strict field-size bound excludes the exceptional small projective images. -/
theorem ProjectiveImageSandwich.bound {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a n : ℕ} {ι : k →+* K}
    {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (h : ProjectiveImageSandwich p a n ι ρ) : p ^ a > max 5 (2 * n - 1) := sorry

/-- The same sandwich suffices at a smaller positive rank. -/
theorem ProjectiveImageSandwich.mono {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a m n : ℕ} {ι : k →+* K}
    {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (h : ProjectiveImageSandwich p a n ι ρ) (hm : 1 ≤ m) (hmn : m ≤ n) :
    ProjectiveImageSandwich p a m ι ρ := sorry

/-- Change of basis preserves the projective image condition. -/
theorem ProjectiveImageSandwich.conjugation {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a n : ℕ} {ι : k →+* K}
    {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (d : Matrix.GeneralLinearGroup (Fin 2) K) :
    ProjectiveImageSandwich p a n ι ((MulAut.conj d).toMonoidHom.comp ρ) ↔
      ProjectiveImageSandwich p a n ι ρ := sorry

section

local instance : Fact (Nat.Prime 7) := ⟨by decide⟩
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

example : ProjectiveImageSandwich 7 1 3 (RingHom.id (ZMod 7))
    (MonoidHom.id (Matrix.GeneralLinearGroup (Fin 2) (ZMod 7))) := sorry

example (ρ : Matrix.GeneralLinearGroup (Fin 2) (ZMod 5) →*
    Matrix.GeneralLinearGroup (Fin 2) (ZMod 5)) :
    ¬ ProjectiveImageSandwich 5 1 2 (RingHom.id (ZMod 5)) ρ := sorry

end

/-- A degree-zero finite-field parameter is excluded explicitly. -/
example {G k K : Type*} [Group G] [Field k] [Fintype k] [Field K]
    (p n : ℕ) (ι : k →+* K) (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) :
    ¬ ProjectiveImageSandwich p 0 n ι ρ := sorry

/-- Small characteristic is allowed by the bound; the prime need not exceed the rank. -/
example : (2 : ℕ) ^ 3 > max 5 (2 * 4 - 1) ∧ 2 ≤ 4 := by decide

end SymmetricPower

/-! ## Layer 2: controlled potential automorphy and compatible systems -/

/-! ## Layer 3: classical-group packets and symplectic descent -/

namespace Arthur

/-- The determinant-one condition on block signs, additively modulo two. -/
def orthogonalSignKernel {ι : Type*} [Fintype ι] (dim : ι → ℕ) :
    AddSubgroup (ι → ZMod 2) where
  carrier := {s | ∑ i, (dim i : ZMod 2) * s i = 0}
  zero_mem' := by simp
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_ofPred_eq, Pi.add_apply, mul_add, Finset.sum_add_distrib] at *
    rw [ha, hb, add_zero]
  neg_mem' := by
    intro a ha
    simp only [Set.mem_ofPred_eq, Pi.neg_apply, mul_neg, Finset.sum_neg_distrib]
    rw [ha, neg_zero]

/-- Membership in the kernel is exactly the weighted parity equation. -/
theorem orthogonalSignKernel_mem_iff {ι : Type*} [Fintype ι]
    (dim : ι → ℕ) (s : ι → ZMod 2) :
    s ∈ orthogonalSignKernel dim ↔ ∑ i, (dim i : ZMod 2) * s i = 0 := sorry

/-- Even-dimensional blocks impose no determinant constraint. -/
theorem orthogonalSignKernel_even {ι : Type*} [Fintype ι]
    (dim : ι → ℕ) (h : ∀ i, Even (dim i)) : orthogonalSignKernel dim = ⊤ := sorry

/-- A single odd-dimensional block must have positive sign. -/
theorem orthogonalSignKernel_one_odd (d : ℕ) (h : Odd d) :
    orthogonalSignKernel (fun (_ : Fin 1) => d) = ⊥ := sorry

example : orthogonalSignKernel (fun (_ : Fin 1) => 3) = ⊥ ∧
    orthogonalSignKernel (fun (i : Fin 0) => i.elim0) = ⊤ := sorry

example (s : Fin 2 → ZMod 2) :
    s ∈ orthogonalSignKernel (fun (_ : Fin 2) => 1) ↔ s 0 = s 1 := sorry

end Arthur

/-! ## Layer 4: symmetric powers, purity and equidistribution -/

namespace SymmetricPower

/-- A GL₂ weight function is parallel when the difference of its entries is independent of the
embedding. Attachment of this function to an automorphic representation is specified in README.md. -/
def IsParallelWeight {ι : Type*} (wt : ι → Fin 2 → ℤ) : Prop :=
  ∀ τ σ, wt τ 0 - wt τ 1 = wt σ 0 - wt σ 1

/-- The classical weight read from a numerical GL₂ weight at one embedding. -/
def parallelWeight {ι : Type*} (wt : ι → Fin 2 → ℤ) (τ : ι) : ℤ :=
  wt τ 0 - wt τ 1 + 2

/-- Adding a scalar to both entries at each embedding preserves parallel weight. -/
theorem IsParallelWeight.twist {ι : Type*} (wt : ι → Fin 2 → ℤ) (a : ι → ℤ) :
    IsParallelWeight (fun τ i => wt τ i + a τ) ↔ IsParallelWeight wt := sorry

/-- For a parallel weight the classical value is independent of the embedding. -/
theorem parallelWeight_independent {ι : Type*} {wt : ι → Fin 2 → ℤ}
    (h : IsParallelWeight wt) (τ σ : ι) : parallelWeight wt τ = parallelWeight wt σ := sorry

example : IsParallelWeight (fun (_ : Fin 2) (_ : Fin 2) => (0 : ℤ)) ∧
    parallelWeight (fun (_ : Fin 2) (_ : Fin 2) => (0 : ℤ)) 0 = 2 := by
  simp [IsParallelWeight, parallelWeight]

example : ¬ IsParallelWeight (fun (τ : Fin 2) (i : Fin 2) =>
    if i = 0 then if τ = 0 then (0 : ℤ) else 2 else 0) ∧
    parallelWeight (fun (τ : Fin 2) (i : Fin 2) =>
      if i = 0 then if τ = 0 then (0 : ℤ) else 2 else 0) 1 = 4 := sorry

end SymmetricPower

/-! ## Layer 5: generic transfers and Langlands conjectures -/

/-!
Definitions specified in README.md whose full mathematical objects are supplied by neighbouring
theories: EndpointRecord and Status; recArch, isobaricSum and baseChangeCR; partialL,
archimedeanFactor and completedL for compatible systems; IsAutomorphicNT; GSp4.lPacketOf and
monodromyRank; WeightTwoTwoConjecture and ExpectedSingularWeightHodge; IsAutomorphicArtin;
TwistedModularCurve; SymPowerLift, SymPowerExists and SP; the elliptic completedL; SatoTateGroup;
BianchiEigenform and its Fourier and parabolic-cohomology comparisons; IsSymplecticType and
IsOrthogonalType; GlobalParameter, ExtendedParameter and GSp4.IsDiscrete; IsFunctorialLift;
Functoriality, Reciprocity, LocalLanglands and CategoricalLLC; IsAccessibleRefinement and IsNRegular.
-/

end TauCetiRoadmap.ModularityAndLanglandsExtensions
