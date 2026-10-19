import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.House
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Data.Set.Card
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic

/-!
# Compact number-field models and degree-sensitive field counts

This file is not the roadmap and is not exhaustive. The definitive document is
`../readmes/EffectiveBoundsPartII.md`. These signatures suggest forms for selected
milestones expressible at the pins. Discharging them finishes neither a layer nor
this roadmap. Proofs are deliberately left as `sorry`; no data definition is admitted.

The completed EffectiveBounds infrastructure is imported. Generic coefficient
geometry, interpolation, successive minima and Jacobian-open scheme constructions
remain imported mathematical targets in the reader. They are not implemented here.

The four light definitions below use only existing carriers: finite sums, a kernel
of native evaluation, an evaluated Jacobian determinant, and a coefficient-box set.
The final signature bounds any finite family of pairwise nonisomorphic degree-n
number fields. The ST.0 isomorphism-family carrier and the passage from this bound
to its cardinality are specified in the reader, since that carrier is not at the pins.
-/

noncomputable section

open scoped BigOperators

universe u v

namespace NumberField.CompactModel

/-! EB.0: the strict dimension threshold and Proposition 1. -/

/-- The field multiplication argument; equality in the dimension threshold is excluded. -/
theorem span_products_eq_top
    {k : Type u} {K : Type v} [Field k] [Field K] [Algebra k K]
    [FiniteDimensional k K] (V : Submodule k K)
    (hV : Module.finrank k K < 2 * Module.finrank k V) :
    Submodule.span k {x : K | ∃ a ∈ V, ∃ b ∈ V, a * b = x} = ⊤ := by
  sorry

/-- Couveignes, Proposition 1, p. 490: independent integral elements, with no
claim that they are an integral basis. -/
theorem exists_short_integers (K : Type u) [Field K] [NumberField K] :
    ∃ α : Fin (Module.finrank ℚ K) → 𝓞 K,
      LinearIndependent ℚ (fun i => (α i : K)) ∧
      ∀ i, NumberField.house (α i : K) ≤ NumberField.rootDiscr K ^ 2 := by
  sorry

/-! EB.1: integer parameter sums on the existing ring carrier. -/

/-- Integer combinations of an integral family. The independence and height
hypotheses belong to its theorems, not to the finite-sum operation. -/
def parameterizedGenerators {R : Type u} [CommRing R] {n r : ℕ}
    (α : Fin n → R) (u : Fin n → Fin r → ℤ) : Fin r → R :=
  fun j => ∑ i, (u i j : R) * α i

lemma parameterizedGenerators_apply {R : Type u} [CommRing R] {n r : ℕ}
    (α : Fin n → R) (u : Fin n → Fin r → ℤ) (j : Fin r) :
    parameterizedGenerators α u j = ∑ i, (u i j : R) * α i := by
  sorry

/-- The height estimate is valid before the generic first-jet specialization. -/
theorem parameterizedGenerators_house_le
    {K : Type u} [Field K] [NumberField K] {n r D : ℕ}
    (α : Fin n → 𝓞 K) (u : Fin n → Fin r → ℤ)
    (hα : ∀ i, NumberField.house (α i : K) ≤ NumberField.rootDiscr K ^ 2)
    (hu : ∀ i j, 0 ≤ u i j ∧ u i j ≤ (D : ℤ)) (j : Fin r) :
    NumberField.house ((parameterizedGenerators α u j : 𝓞 K) : K) ≤
      (n : ℝ) * D * NumberField.rootDiscr K ^ 2 := by
  sorry

example : parameterizedGenerators (fun _ : Fin 1 => (1 : ℤ))
    (fun (_ : Fin 1) (_ : Fin 1) => (3 : ℤ)) (0 : Fin 1) = 3 := by
  sorry

example {R : Type u} [CommRing R] {n r : ℕ} (α : Fin n → R) :
    parameterizedGenerators α (fun _ _ => 0) = (fun _ : Fin r => 0) := by
  sorry

/-! EB.2: a real-bodied kernel over the native bounded polynomial module. -/

/-- The integral relations of bounded total degree, using native evaluation. -/
def relationLattice {R : Type u} [CommRing R] {r : ℕ}
    (κ : Fin r → R) (d : ℕ) :
    Submodule ℤ (MvPolynomial.restrictTotalDegree (Fin r) ℤ d) :=
  LinearMap.ker
    (((MvPolynomial.aeval κ : MvPolynomial (Fin r) ℤ →ₐ[ℤ] R).toLinearMap).comp
      (MvPolynomial.restrictTotalDegree (Fin r) ℤ d).subtype)

lemma mem_relationLattice {R : Type u} [CommRing R] {r d : ℕ}
    (κ : Fin r → R) (f : MvPolynomial.restrictTotalDegree (Fin r) ℤ d) :
    f ∈ relationLattice κ d ↔
      MvPolynomial.eval₂ (Int.castRingHom R) κ
        (f : MvPolynomial (Fin r) ℤ) = 0 := by
  sorry

/-- The full rank formula uses rational value surjectivity, not integral surjectivity. -/
theorem relationLattice_rank
    {K : Type u} [Field K] [NumberField K] {r d : ℕ}
    (κ : Fin r → 𝓞 K)
    (hval : Function.Surjective
      (fun f : MvPolynomial.restrictTotalDegree (Fin r) ℚ d =>
        (MvPolynomial.aeval (fun j => (κ j : K)) :
          MvPolynomial (Fin r) ℚ →ₐ[ℚ] K) (f : MvPolynomial (Fin r) ℚ))) :
    Module.finrank ℤ (relationLattice κ d) =
      Nat.choose (d + r) d - Module.finrank ℚ K := by
  sorry

example {r : ℕ} (κ : Fin r → ℤ) : relationLattice κ 0 = ⊥ := by
  sorry

example (f : MvPolynomial.restrictTotalDegree (Fin 1) ℤ 2) :
    f ∈ relationLattice (fun _ : Fin 1 => (0 : ℤ)) 2 ↔
      (f : MvPolynomial (Fin 1) ℤ).coeff 0 = 0 := by
  sorry

/-! EB.3–EB.4: native derivatives and the arithmetic model milestone. -/

/-- Evaluate the determinant of the square matrix of first partial derivatives. -/
def jacobianAt {R : Type u} [CommRing R] {r : ℕ} (κ : Fin r → R)
    (E : Fin r → MvPolynomial (Fin r) ℤ) : R :=
  Matrix.det (fun i j =>
    MvPolynomial.eval₂ (Int.castRingHom R) κ (MvPolynomial.pderiv j (E i)))

lemma jacobianAt_map {R : Type u} {S : Type v} [CommRing R] [CommRing S]
    {r : ℕ} (f : R →+* S) (κ : Fin r → R)
    (E : Fin r → MvPolynomial (Fin r) ℤ) :
    f (jacobianAt κ E) = jacobianAt (f ∘ κ) E := by
  sorry

example : jacobianAt (fun _ : Fin 1 => (3 : ℚ))
    (fun _ : Fin 1 => MvPolynomial.X (0 : Fin 1) ^ 2 - MvPolynomial.C (2 : ℤ)) =
      6 := by
  sorry

example : jacobianAt (fun _ : Fin 1 => (0 : ℚ))
    (fun _ : Fin 1 => MvPolynomial.X (0 : Fin 1) ^ 2) = 0 := by
  sorry

example (κ : Fin 0 → ℚ) (E : Fin 0 → MvPolynomial (Fin 0) ℤ) :
    jacobianAt κ E = 1 := by
  sorry

/-- Proposition 2, p. 495, in arithmetic form. The field-as-component conclusion
is supplied from this evaluation by SF.0/jacobian-etale-algebra in the reader. -/
theorem exists_explicit_small_model
    (K : Type u) [Field K] [NumberField K] (r d : ℕ)
    (hr : 1 ≤ r) (hd : 5 ≤ d)
    (hM : Module.finrank ℚ K * (r + 1) ≤ Nat.choose (d + r) d) :
    let n := Module.finrank ℚ K
    let M := Nat.choose (d + r) d
    let ell := M - n
    ∃ κ : Fin r → 𝓞 K, ∃ E : Fin r → MvPolynomial (Fin r) ℤ,
      (∀ i, (E i).totalDegree ≤ d) ∧
      (∀ i a, |((E i).coeff a : ℝ)| ≤
        (ell : ℝ) ^ ((ell : ℝ) / (2 * n)) * Real.sqrt (M : ℝ) *
          ((n : ℝ) ^ 2 * d * (r + 1)) ^ d * NumberField.rootDiscr K ^ (2 * d)) ∧
      (∀ i, MvPolynomial.eval₂ (Int.castRingHom K) (fun j => (κ j : K)) (E i) = 0) ∧
      jacobianAt (fun j => (κ j : K)) E ≠ 0 ∧
      Function.Surjective (MvPolynomial.aeval (fun j => (κ j : K)) :
        MvPolynomial (Fin r) ℚ →ₐ[ℚ] K) ∧
      (∀ j, NumberField.house (κ j : K) ≤
        (n : ℝ) ^ 2 * d * (r + 1) * NumberField.rootDiscr K ^ 2) := by
  sorry

/-! EB.5: coefficient boxes on native polynomial carriers. -/

/-- The set of ordered systems with bounded total degree and coefficients. -/
def boundedEquationSystems (r d C : ℕ) : Set (Fin r → MvPolynomial (Fin r) ℤ) :=
  {E | (∀ i, (E i).totalDegree ≤ d) ∧ ∀ i a, |(E i).coeff a| ≤ (C : ℤ)}

theorem boundedEquationSystems_finite (r d C : ℕ) :
    (boundedEquationSystems r d C).Finite := by
  sorry

theorem coefficient_box_card (r d C : ℕ) :
    (boundedEquationSystems r d C).ncard =
      (2 * C + 1) ^ (r * Nat.choose (d + r) d) := by
  sorry

example (d C : ℕ) : (boundedEquationSystems 0 d C).ncard = 1 := by
  sorry

example (r d : ℕ) : boundedEquationSystems r d 0 = {fun _ => 0} := by
  sorry

/-- Theorem 1, p. 487: the same rank r(n) can be used for all fields of degree n.
The reader specifies its least-central-binomial choice and all component geometry. -/
theorem exists_logarithmic_small_model :
    ∃ Q : ℝ, 3 ≤ Q ∧
      ∀ (K : Type u) [Field K] [NumberField K],
        let n := Module.finrank ℚ K
        Q < (n : ℝ) →
        ∃ r : ℕ, 5 ≤ r ∧
          n * (r + 1) ≤ Nat.choose (2 * r) r ∧
          (∀ s : ℕ, 0 < s → s < r → Nat.choose (2 * s) s < n * (s + 1)) ∧
          (r : ℝ) ≤ Q * Real.log (n : ℝ) ∧
          (Nat.choose (2 * r) r : ℝ) ≤ Q * n * Real.log (n : ℝ) ∧
          ∃ κ : Fin r → 𝓞 K, ∃ E : Fin r → MvPolynomial (Fin r) ℤ,
            (∀ i, (E i).totalDegree ≤ r) ∧
            (∀ i a, |((E i).coeff a : ℝ)| ≤
              ((n : ℝ) * NumberField.rootDiscr K) ^ (Q * Real.log (n : ℝ))) ∧
            (∀ i, MvPolynomial.eval₂ (Int.castRingHom K)
              (fun j => (κ j : K)) (E i) = 0) ∧
            jacobianAt (fun j => (κ j : K)) E ≠ 0 ∧
            Function.Surjective (MvPolynomial.aeval (fun j => (κ j : K)) :
              MvPolynomial (Fin r) ℚ →ₐ[ℚ] K) := by
  sorry

/-- Theorem 2, p. 488, as a bound for every finite set of representatives.
The isomorphism-family carrier itself belongs to ArithmeticStatistics:ST.0. -/
theorem discriminant_count_bound :
    ∃ Q : ℝ, 3 ≤ Q ∧ ∀ n H : ℕ, Q < (n : ℝ) → 1 ≤ H →
      ∀ (ι : Type u) [Fintype ι] (K : ι → Type v)
        [∀ i, Field (K i)] [∀ i, NumberField (K i)],
        (∀ i, Module.finrank ℚ (K i) = n) →
        (∀ i, |NumberField.discr (K i)| ≤ (H : ℤ)) →
        (∀ i j, i ≠ j → IsEmpty (K i ≃ₐ[ℚ] K j)) →
        (Fintype.card ι : ℝ) ≤
          (n : ℝ) ^ (Q * n * (Real.log (n : ℝ)) ^ 3) *
            (H : ℝ) ^ (Q * (Real.log (n : ℝ)) ^ 3) := by
  sorry

end NumberField.CompactModel
