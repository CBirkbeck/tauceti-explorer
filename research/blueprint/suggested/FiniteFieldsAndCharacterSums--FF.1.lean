/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive;
these suggested forms help contributors and reviewers converge on names and signatures.
Planning only: admitted signatures do not constitute formalisation.
Codex, codex-LExbxM. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

AC.0 owns the general Fourier transform. Its fourier_eq_basis_repr API identifies it
with the EXISTING native basis coordinates used below; no second transform is defined.
The predecessor owns the shift parametrisation; no second dual equivalence is defined.
The unconditional Hasse–Davenport target remains dependent on the two explicit Dwork
interfaces inherited through DirichletPadicLFunctions:L3. No p-adic stand-in is introduced.
-/
import Mathlib.Analysis.Fourier.FiniteAbelian.PontryaginDuality
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.JacobiSum.Basic
import Mathlib.RingTheory.Polynomial.DegreeLT
import Mathlib.Algebra.Polynomial.Eval.SMul
import Mathlib.Data.Nat.Digits.Defs
import Mathlib.Data.ZMod.Basic

noncomputable section
open scoped BigOperators
attribute [local instance] Classical.propDecidable

namespace TauCeti.FiniteFieldSums

variable {F : Type*} [Field F] [Fintype F]

-- Node: finite-field-fourier-transport. Both identities use the same dual reindexing.
theorem finiteField_fourier_transport (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (f g : F → ℂ) (x : F) :
    (∑ a : F, (AddChar.complexBasis F).repr f (ψ.mulShift a) * ψ (a * x) = f x) ∧
    ((Fintype.card F : ℂ)⁻¹ * ∑ y : F, f y * star (g y) =
      ∑ a : F, (AddChar.complexBasis F).repr f (ψ.mulShift a) *
        star ((AddChar.complexBasis F).repr g (ψ.mulShift a))) := by sorry

-- Node: multiplicative-fourier-boundary-coefficients. At zero the trivial χ needs correction.
theorem mulChar_fourier_boundary (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (χ : MulChar F ℂ) (a : F) :
    (AddChar.complexBasis F).repr (fun x => χ x) (ψ.mulShift a) =
      if a = 0 then
        if χ = 1 then ((Fintype.card F : ℂ) - 1) / (Fintype.card F : ℂ) else 0
      else (Fintype.card F : ℂ)⁻¹ * (χ⁻¹) (-a) * gaussSum χ ψ := by
  classical
  sorry

-- Node: digit-product-distribution. s and h below are local notation, not new definitions.
theorem digit_product_distribution (p f m b : ℕ) (hp : p.Prime) (hf : 0 < f)
    (hm : 0 < m) (hdiv : m ∣ p ^ f - 1) (hb : b < (p ^ f - 1) / m) :
    let d := (p ^ f - 1) / m
    let s := fun r => (Nat.digits p r).sum
    let h := fun r => ((Nat.digits p r).map Nat.factorial).prod
    (∑ j ∈ Finset.range m, s (b + j * d) =
      s (m * b) + ∑ j ∈ Finset.Ico 1 m, s (j * d)) ∧
    ((m : ZMod p) ^ s (m * b) * ∏ j ∈ Finset.range m, (h (b + j * d) : ZMod p) =
      (h (m * b) : ZMod p) * ∏ j ∈ Finset.Ico 1 m, (h (j * d) : ZMod p)) := by sorry

-- Node: hasse-davenport-product-completion. The target, not an assumption of its proof input.
theorem hasseDavenport_product (χ ρ : MulChar F ℂ) (ψ : AddChar F ℂ)
    (m : ℕ) (hm : 0 < m) (hdiv : m ∣ Fintype.card F - 1)
    (hρ : orderOf ρ = m) (hψ : ψ.IsPrimitive) :
    gaussSum (χ ^ m) ψ * ∏ j ∈ Finset.Ico 1 m, gaussSum (ρ ^ j) ψ =
      χ (m : F) ^ m * ∏ j ∈ Finset.range m, gaussSum (χ * ρ ^ j) ψ := by sorry

-- Node: projective-polynomial-evaluation. Option.none represents [1:0], some a represents [a:1].
-- This is the prescribed-degree section value; it is not Polynomial.leadingCoeff.
def projectiveEval (d : ℕ) (x : Option F) : Polynomial.degreeLT F (d + 1) →ₗ[F] F :=
  match x with
  | none => (Polynomial.lcoeff F d).comp (Polynomial.degreeLT F (d + 1)).subtype
  | some a => (Polynomial.leval a).comp (Polynomial.degreeLT F (d + 1)).subtype

lemma projectiveEval_some (d : ℕ) (a : F) (P : Polynomial.degreeLT F (d + 1)) :
    projectiveEval d (some a) P = (P : Polynomial F).eval a := by sorry

lemma projectiveEval_none (d : ℕ) (P : Polynomial.degreeLT F (d + 1)) :
    projectiveEval d none P = (P : Polynomial F).coeff d := by sorry

lemma projectiveEval_monomial (d : ℕ) (i : Fin (d + 1)) (c : F) (x : Option F) :
    projectiveEval d x
      ⟨Polynomial.monomial (i : ℕ) c, Polynomial.monomial_coe_mem_degreeLT i c⟩ =
      match x with
      | none => if (i : ℕ) = d then c else 0
      | some a => c * a ^ (i : ℕ) := by
  classical
  sorry

lemma projectiveEval_add (d : ℕ) (x : Option F)
    (P Q : Polynomial.degreeLT F (d + 1)) :
    projectiveEval d x (P + Q) = projectiveEval d x P + projectiveEval d x Q := by sorry

lemma projectiveEval_smul (d : ℕ) (x : Option F) (c : F)
    (P : Polynomial.degreeLT F (d + 1)) :
    projectiveEval d x (c • P) = c * projectiveEval d x P := by sorry

lemma projectiveEval_of_degree_lt (d : ℕ) (P : Polynomial.degreeLT F (d + 1))
    (hP : (P : Polynomial F).degree < d) : projectiveEval d none P = 0 := by sorry

-- Named definition tests: each comment is the packet test name.
-- projectiveEvalTests.lower_degree_infinity
example : projectiveEval (F := ZMod 3) 2 none
    ⟨Polynomial.monomial 1 1,
      Polynomial.monomial_coe_mem_degreeLT (⟨1, by decide⟩ : Fin 3) 1⟩ = 0 := by sorry
-- projectiveEvalTests.top_degree_infinity
example : projectiveEval (F := ZMod 3) 2 none
    ⟨Polynomial.monomial 2 1,
      Polynomial.monomial_coe_mem_degreeLT (⟨2, by decide⟩ : Fin 3) 1⟩ = 1 := by sorry
-- projectiveEvalTests.degree_zero_constant
example (c : F) : projectiveEval 0 none
    ⟨Polynomial.monomial 0 c,
      Polynomial.monomial_coe_mem_degreeLT (⟨0, by decide⟩ : Fin 1) c⟩ = c := by sorry
-- projectiveEvalTests.finite_zero_constant
example (d : ℕ) (P : Polynomial.degreeLT F (d + 1)) :
    projectiveEval d (some 0) P = (P : Polynomial F).coeff 0 := by sorry
-- projectiveEvalTests.finite_nonzero_linear
example : projectiveEval (F := ZMod 3) 2 (some 2)
    ⟨Polynomial.monomial 1 1,
      Polynomial.monomial_coe_mem_degreeLT (⟨1, by decide⟩ : Fin 3) 1⟩ = 2 := by sorry

-- Node: projective-two-evaluation-uniform. d ≥ 1, including one infinite point.
theorem projectiveEval_pair_uniform (d : ℕ) (hd : 1 ≤ d) (x y : Option F) (hxy : x ≠ y) :
    Function.Surjective (fun P : Polynomial.degreeLT F (d + 1) =>
      (projectiveEval d x P, projectiveEval d y P)) ∧
    ∀ u v : F, Nat.card {P : Polynomial.degreeLT F (d + 1) //
      projectiveEval d x P = u ∧ projectiveEval d y P = v} =
      Fintype.card F ^ (d - 1) := by sorry

-- Native finite enumeration via the existing coefficient equivalence, not a new carrier.
local instance degreeLTFintype (d : ℕ) : Fintype (Polynomial.degreeLT F (d + 1)) :=
  Fintype.ofEquiv (Fin (d + 1) → F) (Polynomial.degreeLTEquiv F (d + 1)).symm.toEquiv

-- Node: projective-two-point-character-sum; no squarefree or monic restriction.
theorem projectiveEval_character_correlation (d : ℕ) (hd : 1 ≤ d)
    (x y : Option F) (hxy : x ≠ y) (χ φ : MulChar F ℂ) (hχ : χ ≠ 1) :
    ∑ P : Polynomial.degreeLT F (d + 1),
      χ (projectiveEval d x P) * φ (projectiveEval d y P) = 0 := by sorry

-- Stronger uniform-fibre identity records the trivial-character boundary as well.
lemma projectiveEval_character_correlation_all (d : ℕ) (hd : 1 ≤ d)
    (x y : Option F) (hxy : x ≠ y) (χ φ : MulChar F ℂ) :
    ∑ P : Polynomial.degreeLT F (d + 1),
      χ (projectiveEval d x P) * φ (projectiveEval d y P) =
      (Fintype.card F : ℂ) ^ (d - 1) * (∑ u : F, χ u) * (∑ v : F, φ v) := by sorry

-- Node: gauss-sum-finite-product-factorisation. The product algebra uses native characters.
theorem gaussSum_finiteProduct {ι : Type*} [Fintype ι] (K : ι → Type*)
    [∀ i, Field (K i)] [∀ i, Fintype (K i)]
    (χ : MulChar (∀ i, K i) ℂ) (ψ : AddChar (∀ i, K i) ℂ)
    (χi : ∀ i, MulChar (K i) ℂ) (ψi : ∀ i, AddChar (K i) ℂ)
    (hχ : ∀ x, χ x = ∏ i, χi i (x i))
    (hψ : ∀ x, ψ x = ∏ i, ψi i (x i)) :
    gaussSum χ ψ = ∏ i, gaussSum (χi i) (ψi i) := by sorry

end TauCeti.FiniteFieldSums
