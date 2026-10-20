import Mathlib
import TauCeti.InformationTheory.Coding.Basic

/-!
# FiniteFieldsAndCharacterSums: representative target signatures

The roadmap is README.md. This file records light definitions and milestone theorem
signatures on the pinned Mathlib and Tau Ceti carriers; it is not exhaustive. Characters
are zero-extended on nonunits, Gauss sums are unnormalized, and Fourier coefficients
use the factor 1/q and the conjugate additive character. Polynomial laws are distinguished
from their functions on finite fields. Code distances concern nonzero words.
-/

noncomputable section
open scoped BigOperators TensorProduct
open Polynomial
attribute [local instance] Classical.propDecidable

namespace TauCetiRoadmap.FiniteFieldsAndCharacterSums

/-! ## Layer 0: finite-field presentations and comparisons -/
section FF0
variable {F : Type*} [Field F] [Fintype F]
/-- Successive q-power residues modulo a monic polynomial, starting with X modulo f. -/
noncomputable def frobResidue (f : F[X]) : ℕ → F[X]
  | 0 => X %ₘ f
  | k + 1 => (frobResidue f k) ^ Fintype.card F %ₘ f

/-- Rabin’s criterion uses the degree and its prime divisors, with normalized coprimality. -/
theorem rabin_irreducible_iff_frobResidue {f : F[X]} (hf : f.Monic) (hn : 0 < f.natDegree) :
    Irreducible f ↔
      frobResidue f f.natDegree = X %ₘ f ∧
        ∀ s ∈ f.natDegree.primeFactors, IsCoprime (frobResidue f (f.natDegree / s) - X) f := by
  sorry

/-- An irreducible degree-d polynomial has gcd(d,n) equal-degree factors over the degree-n extension. -/
theorem factorization_over_extension (E : Type*) [Field E] [Algebra F E] [Finite E]
    {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) :
    ∃ s : Finset E[X],
      s.card = Nat.gcd f.natDegree (Module.finrank F E) ∧
      (∀ g ∈ s, g.Monic ∧ Irreducible g ∧
        g.natDegree = f.natDegree / Nat.gcd f.natDegree (Module.finrank F E)) ∧
      ∏ g ∈ s, g = f.map (algebraMap F E) := by
  sorry

/-- Explicit Frobenius coordinates identify a tensor product with gcd(m,n) copies of the compositum. -/
theorem tensorProduct_comparison (K L M : Type*) [Field K] [Field L] [Field M]
    [Algebra F K] [Algebra F L] [Algebra F M] [Finite K] [Finite L] [Finite M]
    (ιK : K →ₐ[F] M) (ιL : L →ₐ[F] M)
    (hM : Module.finrank F M = Nat.lcm (Module.finrank F K) (Module.finrank F L)) :
    ∃ e : K ⊗[F] L ≃ₐ[F]
      (Fin (Nat.gcd (Module.finrank F K) (Module.finrank F L)) → M),
      ∀ a b i, e (a ⊗ₜ b) i =
        (ιK a) ^ (Fintype.card F ^ (i : ℕ)) * ιL b := by sorry

/-- Normality is detected by every irreducible divisor of the Frobenius annihilator. -/
theorem normal_iff_forall_irreducible_factor (E : Type*) [Field E] [Algebra F E]
    [Finite E] (α : E) :
    LinearIndependent F (fun i : Fin (Module.finrank F E) =>
      (FiniteField.frobeniusAlgHom F E)^[i] α) ↔
      ∀ h : F[X], h.Monic → Irreducible h → h ∣ X ^ Module.finrank F E - 1 →
        aeval (FiniteField.frobeniusAlgHom F E).toLinearMap
          ((X ^ Module.finrank F E - 1) /ₘ h) α ≠ 0 := by sorry


/-- Remainder evaluation excludes the spurious constant term modulo X. -/
example (k : ℕ) : frobResidue (X : F[X]) k = 0 := by
  induction k with
  | zero => simp [frobResidue]
  | succ k ih => simp [frobResidue, ih, Fintype.card_ne_zero]
end FF0

/-! ## Intermediate fields and elementary polynomial counts -/
section IntermediateFields
variable (F E : Type*) [Field F] [Fintype F] [Field E] [Algebra F E]
variable [FiniteDimensional F E]

/-- Intermediate fields correspond to degree divisors and are the appropriate Frobenius fixed fields. -/
theorem intermediateField_divisor_correspondence :
    ∃ e : IntermediateField F E ≃ {d : ℕ // d ∣ Module.finrank F E},
      (∀ K, (e K).val = Module.finrank F K) ∧
      (∀ d x, x ∈ e.symm d ↔ x ^ (Fintype.card F ^ d.val) = x) ∧
      ∀ K L, K ≤ L ↔ (e K).val ∣ (e L).val := by sorry

/-- A finite field extension has one intermediate field of each divisor degree. -/
theorem existsUnique_intermediateField_finrank {d : ℕ} (hd : d ∣ Module.finrank F E) :
    ∃! K : IntermediateField F E, Module.finrank F K = d := by sorry


end IntermediateFields

section ElementaryCensus
variable (F : Type*) [Field F] [Fintype F] [DecidableEq F]
/-- Enumerate monic degree-n polynomials by their n lower coefficients; degree zero contains 1. -/
def monicOfDegree (n : ℕ) : Finset F[X] := by
  classical
  exact Finset.univ.image fun v : Fin n → F =>
    X ^ n + ((degreeLTEquiv F n).symm v : F[X])

/-- The irreducible members of the monic degree-n census. -/
def monicIrreducibles (n : ℕ) : Finset F[X] := by
  classical
  exact (monicOfDegree F n).filter Irreducible

/-- Gauss’s product formula partitions X^(q^n)-X by irreducible degree divisors. -/
theorem gauss_product_formula (n : ℕ) (hn : 0 < n) :
    ∏ d ∈ n.divisors, ∏ f ∈ monicIrreducibles F d, f =
      X ^ (Fintype.card F ^ n) - X := by sorry

/-- Counting degrees in Gauss’s product formula gives the irreducible census identity. -/
theorem gauss_count_formula (n : ℕ) (hn : 0 < n) :
    ∑ d ∈ n.divisors, d * (monicIrreducibles F d).card = Fintype.card F ^ n := by sorry

/-- The irreducible census lies between q^n/(2n) and q^n/n for positive n. -/
theorem irreducible_count_bounds (n : ℕ) (hn : 0 < n) :
    (Fintype.card F : ℚ) ^ n / (2 * n) ≤ ((monicIrreducibles F n).card : ℚ) ∧
      ((monicIrreducibles F n).card : ℚ) ≤ (Fintype.card F : ℚ) ^ n / n := by sorry

/-- Fixing the constant coefficient leaves n-1 free coordinates when n is positive. -/
theorem card_monic_prescribed_constant (n : ℕ) (b : F) :
    ((monicOfDegree F n).filter fun f => f.coeff 0 = b).card =
      if n = 0 then (if b = 1 then 1 else 0) else Fintype.card F ^ (n - 1) := by
  sorry


example : monicOfDegree (ZMod 3) 0 = {1} := by
  classical
  simp [monicOfDegree]
  funext i
  exact Fin.elim0 i
example : monicIrreducibles (ZMod 3) 0 = ∅ := by
  classical
  have h : monicOfDegree (ZMod 3) 0 = {1} := by
    simp [monicOfDegree]
    funext i
    exact Fin.elim0 i
  simp [monicIrreducibles, h]
end ElementaryCensus

/-! ## Linearized polynomial laws -/
/-- Supported exponents are powers q^i, including q^0=1 and excluding a constant term. -/
def IsLinearized {K : Type*} [CommSemiring K] (q : ℕ) (L : K[X]) : Prop :=
  ∀ n ∈ L.support, ∃ i, n = q ^ i

/-- Build a q-linearized polynomial law from finitely supported coefficients. -/
noncomputable def linearizedOf {K : Type*} [CommSemiring K] (q : ℕ) (a : ℕ →₀ K) :
    K[X] :=
  a.sum fun i c => C c * X ^ (q ^ i)

example {K : Type*} [CommSemiring K] (q : ℕ) :
    linearizedOf q (0 : ℕ →₀ K) = 0 := by
  simp [linearizedOf]

section Linearized
variable {F K E : Type*} [Field F] [Fintype F] [CommRing K] [CommRing E]
variable [Algebra F K] [Algebra K E] [Algebra F E] [IsScalarTower F K E]

/-- Evaluation of a q-linearized law is additive and linear over its finite base field. -/
theorem linearized_evaluation {L : K[X]} (hL : IsLinearized (Fintype.card F) L) :
    (∀ x y : E, aeval (x + y) L = aeval x L + aeval y L) ∧
    (∀ (a : F) (x : E), aeval (a • x) L = a • aeval x L) := by sorry

/-- Composition preserves the q-linearized support condition over commutative coefficient algebras. -/
theorem linearized_comp {L M : K[X]} (hL : IsLinearized (Fintype.card F) L)
    (hM : IsLinearized (Fintype.card F) M) :
    IsLinearized (Fintype.card F) (L.comp M) := by sorry
example : IsLinearized 2 (0 : (ZMod 2)[X]) := by
  simp [IsLinearized]
example : ¬ IsLinearized 2 (1 : (ZMod 2)[X]) := by
  intro h
  obtain ⟨i, hi⟩ := h 0 (by simp)
  have : 0 < 2 ^ i := Nat.pow_pos (by decide)
  omega
end Linearized


/-! ## Layer 1: characters, Fourier transport and Gauss identities -/
section CanonicalCharacter
variable (F : Type*) [CommRing F] [Fintype F] (p : ℕ) [Fact p.Prime]
variable [Algebra (ZMod p) F]
/-- Compose the relative trace with the character determined by a specified p-th root. -/
noncomputable def traceAddChar {R : Type*} [CommMonoid R] (ζ : R) (hζ : ζ ^ p = 1) : AddChar F R :=
  (AddChar.zmodChar p hζ).compAddMonoidHom (Algebra.trace (ZMod p) F).toAddMonoidHom

/-- The positive-exponential trace character, with the prime base specified explicitly. -/
noncomputable def canonicalAddChar : AddChar F ℂ :=
  (ZMod.stdAddChar (N := p)).compAddMonoidHom (Algebra.trace (ZMod p) F).toAddMonoidHom

/-- The trace character on a finite field is primitive. -/
theorem isPrimitive_canonicalAddChar {K : Type*} [Field K] [Fintype K] [Algebra (ZMod p) K] :
    (canonicalAddChar K p).IsPrimitive := by
  sorry

/-- An integer representative of the trace gives the positive complex exponential. -/
theorem canonicalAddChar_eq_exp (x : F) (t : ℤ) (ht : (t : ZMod p) = Algebra.trace (ZMod p) F x) :
    canonicalAddChar F p x = Complex.exp (2 * Real.pi * Complex.I * t / p) := by
  sorry

example {R : Type*} [CommMonoid R] (ζ : R) (hζ : ζ ^ p = 1) :
    traceAddChar F p ζ hζ 0 = 1 := by simp

example : canonicalAddChar F p 0 = 1 := by simp

end CanonicalCharacter
/-- A primitive character identifies field elements with all additive characters by multiplicative shifts. -/
theorem bijective_mulShift_of_isPrimitive {F : Type*} [Field F] [Fintype F] {R : Type*}
    [CommRing R] [IsDomain R] {ψ : AddChar F R} (hψ : ψ.IsPrimitive) :
    Function.Bijective ψ.mulShift := by
  sorry

section CharacterLifts
variable {F : Type*} [Field F] [Fintype F]
variable (E : Type*) [Field E] [Fintype E] [Algebra F E]

/-- Lift a zero-extended multiplicative character through the relative norm on units. -/
def liftNorm (χ : MulChar F ℂ) : MulChar E ℂ :=
  MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map (Algebra.norm F (S := E))))

/-- Lift an additive character through the relative trace. -/
def liftTrace (ψ : AddChar F ℂ) : AddChar E ℂ :=
  ψ.compAddMonoidHom (Algebra.trace F E).toAddMonoidHom

/-- Hasse–Davenport lifting includes the zero-extended trivial multiplicative character. -/
theorem hasseDavenport_lifting (χ : MulChar F ℂ) (ψ : AddChar F ℂ)
    (hψ : ψ.IsPrimitive) :
    gaussSum (liftNorm E χ) (liftTrace E ψ) =
      (-1 : ℂ) ^ (Module.finrank F E - 1) * gaussSum χ ψ ^ Module.finrank F E := by sorry
example (χ : MulChar F ℂ) : liftNorm E χ 0 = 0 := by
  exact (liftNorm E χ).map_zero

example (ψ : AddChar F ℂ) : liftTrace E ψ 0 = 1 := by simp

end CharacterLifts

section FourierAndProducts
variable {F : Type*} [Field F] [Fintype F]
/-- Transport the actual additive-character basis to field-indexed inversion and Parseval. -/
theorem finiteField_fourier_transport (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (f g : F → ℂ) (x : F) :
    (∑ a : F, (AddChar.complexBasis F).repr f (ψ.mulShift a) * ψ (a * x) = f x) ∧
    ((Fintype.card F : ℂ)⁻¹ * ∑ y : F, f y * star (g y) =
      ∑ a : F, (AddChar.complexBasis F).repr f (ψ.mulShift a) *
        star ((AddChar.complexBasis F).repr g (ψ.mulShift a))) := by sorry

/-- The field Fourier coefficients of a multiplicative character include the zero-frequency boundary. -/
theorem mulChar_fourier_boundary (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (χ : MulChar F ℂ) (a : F) :
    (AddChar.complexBasis F).repr (fun x => χ x) (ψ.mulShift a) =
      if a = 0 then
        if χ = 1 then ((Fintype.card F : ℂ) - 1) / (Fintype.card F : ℂ) else 0
      else (Fintype.card F : ℂ)⁻¹ * (χ⁻¹) (-a) * gaussSum χ ψ := by
  classical
  sorry

/-- Digit sums and digit factorials satisfy the distribution identities used in the product formula. -/
theorem digit_product_distribution (p f m b : ℕ) (hp : p.Prime) (hf : 0 < f)
    (hm : 0 < m) (hdiv : m ∣ p ^ f - 1) (hb : b < (p ^ f - 1) / m) :
    let d := (p ^ f - 1) / m
    let s := fun r => (Nat.digits p r).sum
    let h := fun r => ((Nat.digits p r).map Nat.factorial).prod
    (∑ j ∈ Finset.range m, s (b + j * d) =
      s (m * b) + ∑ j ∈ Finset.Ico 1 m, s (j * d)) ∧
    ((m : ZMod p) ^ s (m * b) * ∏ j ∈ Finset.range m, (h (b + j * d) : ZMod p) =
      (h (m * b) : ZMod p) * ∏ j ∈ Finset.Ico 1 m, (h (j * d) : ZMod p)) := by sorry

/-- The exact Hasse–Davenport product relation includes trivial factors and characteristic two. -/
theorem hasseDavenport_product (χ ρ : MulChar F ℂ) (ψ : AddChar F ℂ)
    (m : ℕ) (hm : 0 < m) (hdiv : m ∣ Fintype.card F - 1)
    (hρ : orderOf ρ = m) (hψ : ψ.IsPrimitive) :
    gaussSum (χ ^ m) ψ * ∏ j ∈ Finset.Ico 1 m, gaussSum (ρ ^ j) ψ =
      χ (m : F) ^ m * ∏ j ∈ Finset.range m, gaussSum (χ * ρ ^ j) ψ := by sorry

/-- Evaluate a binary form of prescribed ambient degree; infinity reads that degree’s coefficient. -/
def projectiveEval (d : ℕ) (x : Option F) : Polynomial.degreeLT F (d + 1) →ₗ[F] F :=
  match x with
  | none => (Polynomial.lcoeff F d).comp (Polynomial.degreeLT F (d + 1)).subtype
  | some a => (Polynomial.leval a).comp (Polynomial.degreeLT F (d + 1)).subtype

/-- Two distinct projective evaluations are onto and have equal fibres. -/
theorem projectiveEval_pair_uniform (d : ℕ) (hd : 1 ≤ d) (x y : Option F) (hxy : x ≠ y) :
    Function.Surjective (fun P : Polynomial.degreeLT F (d + 1) =>
      (projectiveEval d x P, projectiveEval d y P)) ∧
    ∀ u v : F, Nat.card {P : Polynomial.degreeLT F (d + 1) //
      projectiveEval d x P = u ∧ projectiveEval d y P = v} =
      Fintype.card F ^ (d - 1) := by sorry

example (d : ℕ) (P : Polynomial.degreeLT F (d + 1)) :
    projectiveEval d none P = (P : F[X]).coeff d := rfl

/-- Enumerate bounded-degree polynomials through their coefficient vectors. -/
local instance degreeLTFintype (d : ℕ) : Fintype (Polynomial.degreeLT F (d + 1)) :=
  Fintype.ofEquiv (Fin (d + 1) → F) (Polynomial.degreeLTEquiv F (d + 1)).symm.toEquiv
/-- Uniform two-evaluation fibres imply character orthogonality. -/
theorem projectiveEval_character_correlation (d : ℕ) (hd : 1 ≤ d)
    (x y : Option F) (hxy : x ≠ y) (χ φ : MulChar F ℂ) (hχ : χ ≠ 1) :
    ∑ P : Polynomial.degreeLT F (d + 1),
      χ (projectiveEval d x P) * φ (projectiveEval d y P) = 0 := by sorry

/-- A character sum on a finite product factors when its characters factor coordinatewise. -/
theorem gaussSum_finiteProduct {ι : Type*} [Fintype ι] (K : ι → Type*)
    [∀ i, Field (K i)] [∀ i, Fintype (K i)]
    (χ : MulChar (∀ i, K i) ℂ) (ψ : AddChar (∀ i, K i) ℂ)
    (χi : ∀ i, MulChar (K i) ℂ) (ψi : ∀ i, AddChar (K i) ℂ)
    (hχ : ∀ x, χ x = ∏ i, χi i (x i))
    (hψ : ∀ x, ψ x = ∏ i, ψi i (x i)) :
    gaussSum χ ψ = ∏ i, gaussSum (χi i) (ψi i) := by sorry


end FourierAndProducts

/-! ## Layer 2: character-sum estimates -/
namespace FF2
/-- The one-variable additive Weil bound with its essential prime-to-characteristic degree guard. -/
theorem additiveWeilBound {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (f : F[X]) (hd : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) :
    ‖∑ x : F, ψ (f.eval x)‖ ≤
      (f.natDegree - 1 : ℝ) * Real.sqrt (Fintype.card F) := by sorry

/-- A multiplicative character of order e detects powers modulo e, not arbitrary perfect powers. -/
theorem multiplicativeWeilBound {F K : Type*} [Field F] [Fintype F]
    [Field K] [IsAlgClosed K] [Algebra F K] [DecidableEq K]
    (χ : MulChar F ℂ) (e : ℕ) (he : 2 ≤ e) (hχ : orderOf χ = e)
    (g : F[X]) (hg : g ≠ 0)
    (hpower : ∀ (c : K) (h : K[X]), g.map (algebraMap F K) ≠ C c * h ^ e) :
    ‖∑ x : F, χ (g.eval x)‖ ≤
      ((g.map (algebraMap F K)).roots.toFinset.card - 1 : ℝ) *
        Real.sqrt (Fintype.card F) := by sorry

/-- A multiplicative character detects the unit congruence kernel of every nonzero ideal. -/
def IsPrimitiveMulChar {R : Type*} [CommRing R] (χ : MulChar R ℂ) : Prop :=
  ∀ I : Ideal R, I ≠ ⊥ → ∃ u : Rˣ, (u : R) - 1 ∈ I ∧ χ (u : R) ≠ 1

/-- On a field, multiplicative primitivity is equivalent to nontriviality. -/
theorem IsPrimitiveMulChar.field_iff {F : Type*} [Field F] [Fintype F]
    (χ : MulChar F ℂ) : IsPrimitiveMulChar χ ↔ χ ≠ 1 := by
  sorry

/-- On a finite ring, primitivity forbids descent to any proper nonzero quotient. -/
theorem IsPrimitiveMulChar.quotient_iff {R : Type*} [CommRing R] [Fintype R]
    [Nontrivial R] (χ : MulChar R ℂ) :
    IsPrimitiveMulChar χ ↔ χ ≠ 1 ∧
      ∀ I : Ideal R, I ≠ ⊥ → I ≠ ⊤ →
        ¬ ∃ f : (R ⧸ I)ˣ →* ℂˣ,
          χ.toUnitHom = f.comp (Units.map (Ideal.Quotient.mk I).toMonoidHom) := by
  sorry

/-- Primitive finite-ring Gauss sums vanish at nonunit frequencies and have squared norm equal to the ring cardinality. -/
theorem primitiveFiniteRingGaussNorm {R : Type*} [CommRing R] [Fintype R]
    [Nontrivial R] (χ : MulChar R ℂ) (ψ : AddChar R ℂ)
    (hχ : IsPrimitiveMulChar χ) (hψ : ψ.IsPrimitive) :
    (∀ a : R, gaussSum χ (ψ.mulShift a) = χ⁻¹ a * gaussSum χ ψ) ∧
      ‖gaussSum χ ψ‖ ^ 2 = (Fintype.card R : ℝ) ∧
      gaussSum χ ψ * gaussSum χ⁻¹ ψ⁻¹ = (Fintype.card R : ℂ) := by
  sorry

/-- Read coefficient degree(g)-1 in the canonical reduced representative. -/
def quotientTopCoefficient {F : Type*} [Field F] (g : Polynomial F) (hg : g.Monic)
    (r : AdjoinRoot g) : F :=
  (AdjoinRoot.modByMonicHom hg r).coeff (g.natDegree - 1)

/-- The top-coefficient pairing is perfect, also for nonreduced polynomial quotients. -/
theorem polynomialQuotientFrobeniusPairing {F : Type*} [Field F] [Fintype F]
    (g : Polynomial F) (hg : g.Monic) (hd : 0 < g.natDegree)
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) :
    (∀ r : AdjoinRoot g, r ≠ 0 →
      ∃ h : AdjoinRoot g, quotientTopCoefficient g hg (r * h) ≠ 0) ∧
    (∃ Ψ : AddChar (AdjoinRoot g) ℂ,
      (∀ r, Ψ r = ψ (quotientTopCoefficient g hg r)) ∧ Ψ.IsPrimitive) := by sorry

/-- The rank-k product-constrained additive sum; a nonzero product forces all coordinates to be units. -/
def hyperKloosterman {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (k : ℕ) (a : F) : ℂ :=
  ∑ x : Fin k → F, if ∏ i, x i = a then ψ (∑ i, x i) else 0

/-- An algebra equivalence preserves the trace-lifted hyper-Kloosterman sum. -/
theorem hyperKloosterman.extension {F K L : Type*} [Field F] [Field K] [Field L]
    [Fintype F] [Fintype K] [Fintype L] [Algebra F K] [Algebra F L]
    [FiniteDimensional F K] [FiniteDimensional F L]
    (e : K ≃ₐ[F] L) (ψ : AddChar F ℂ) (k : ℕ) (a : K) :
    hyperKloosterman (ψ.compAddMonoidHom (Algebra.trace F L).toAddMonoidHom) k (e a) =
      hyperKloosterman (ψ.compAddMonoidHom (Algebra.trace F K).toAddMonoidHom) k a := by
  sorry

/-- Deligne’s rank-k bound at a nonzero parameter, for a nontrivial additive character. -/
theorem hyperKloostermanBound {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (k : ℕ) (hk : 0 < k) (a : F) (ha : a ≠ 0) :
    ‖hyperKloosterman ψ k a‖ ≤
      (k : ℝ) * (Fintype.card F : ℝ) ^ (((k - 1 : ℕ) : ℝ) / 2) := by sorry


example {F : Type*} [Field F] [Fintype F] (ψ : AddChar F ℂ) (a : F) :
    hyperKloosterman ψ 1 a = ψ a := by
  classical
  unfold hyperKloosterman
  rw [Finset.sum_eq_single (fun _ : Fin 1 => a)]
  · simp
  · intro b _ hb
    have hb0 : b 0 ≠ a := by
      intro h
      apply hb
      funext i
      fin_cases i
      exact h
    simp [hb0]
  · simp
example {R : Type*} [CommRing R] [Nontrivial R] :
    ¬ IsPrimitiveMulChar (1 : MulChar R ℂ) := by
  intro h
  obtain ⟨u, _, hu⟩ := h ⊤ (by simp)
  exact hu (by simp)

example {F : Type*} [Field F] (g : F[X]) (hg : g.Monic) :
    quotientTopCoefficient g hg 0 = 0 := by
  simp [quotientTopCoefficient]

end FF2

/-! ## Layer 3: polynomial censuses and certified algorithms -/
section PolynomialCounts
variable (F : Type*) [Field F] [Fintype F] [DecidableEq F]
/-- The squarefree part of the monic census, including 1 in degree zero. -/
def monicSquarefreeOfDegree (n : ℕ) : Finset F[X] := by
  classical
  exact (monicOfDegree F n).filter Squarefree

/-- A monic polynomial has a unique squarefree-times-square decomposition; the two factors may meet. -/
theorem existsUnique_monic_squarefree_square {f : F[X]} (hf : f.Monic) :
    ∃! hm : F[X] × F[X],
      hm.1.Monic ∧ hm.2.Monic ∧ Squarefree hm.1 ∧
      f = hm.1 * hm.2 ^ 2 ∧ f.natDegree = hm.1.natDegree + 2 * hm.2.natDegree := by
  sorry

/-- The monic squarefree count has separate degree-zero and degree-one boundaries. -/
theorem card_monicSquarefreeOfDegree (n : ℕ) :
    (monicSquarefreeOfDegree F n).card =
      if n = 0 then 1 else if n = 1 then Fintype.card F
      else Fintype.card F ^ n - Fintype.card F ^ (n - 1) := by
  sorry

/-- Nonzero scalar multiples of the two squarefree degree censuses used for hyperelliptic equations. -/
def hyperellipticPolynomials (g : ℕ) : Finset F[X] := by
  classical
  exact ((Finset.univ : Finset Fˣ).product
    (monicSquarefreeOfDegree F (2 * g + 1) ∪
      monicSquarefreeOfDegree F (2 * g + 2))).image
    fun ah => C (ah.1 : F) * ah.2

/-- Count the literal equation polynomials, retaining the genus-zero boundary. -/
theorem card_hyperellipticPolynomials (g : ℕ) :
    (hyperellipticPolynomials F g).card = (Fintype.card F - 1) *
      ((monicSquarefreeOfDegree F (2 * g + 1)).card +
        (monicSquarefreeOfDegree F (2 * g + 2)).card) ∧
    (hyperellipticPolynomials F g).card =
      if g = 0 then Fintype.card F ^ 2 * (Fintype.card F - 1)
      else (Fintype.card F - 1) *
        (Fintype.card F ^ (2 * g + 2) - Fintype.card F ^ (2 * g)) := by
  sorry


example : monicSquarefreeOfDegree (ZMod 3) 0 = {1} := by
  classical
  have h : monicOfDegree (ZMod 3) 0 = {1} := by
    simp [monicOfDegree]
    funext i
    exact Fin.elim0 i
  simp [monicSquarefreeOfDegree, h]

example (g : ℕ) : (0 : F[X]) ∉ hyperellipticPolynomials F g := by
  classical
  intro hz
  obtain ⟨⟨a, h⟩, hm, heq⟩ := Finset.mem_image.mp hz
  have hmem := (Finset.mem_product.mp hm).2
  have hs : Squarefree h := by
    rcases Finset.mem_union.mp hmem with hmem | hmem
    · exact (Finset.mem_filter.mp hmem).2
    · exact (Finset.mem_filter.mp hmem).2
  exact (mul_ne_zero (Polynomial.C_ne_zero.mpr a.ne_zero) hs.ne_zero) heq

end PolynomialCounts

/-- Enough permitted Schoof primes occur below a logarithmic cutoff; the general Chebyshev bound is imported. -/
theorem schoof_auxiliary_prime_cutoff :
    ∃ C : ℝ, 0 < C ∧ ∀ q : ℕ, 2 ≤ q → ∀ p : ℕ, p.Prime → p ≤ q →
      ∃ L : ℕ, (L : ℝ) ≤ C * Real.log q ∧
        16 * q < (∏ l ∈ (Finset.range (L + 1)).filter
          (fun l => l.Prime ∧ l ≠ 2 ∧ l ≠ p), l) ^ 2 := by sorry

/-! ## Layer 4: rings, sequences and codes -/
section Codes
variable {F : Type*} [Field F] [DecidableEq F] {ι : Type*} [Fintype ι]
/-- A positive-dimensional linear code has a nonzero word meeting Singleton’s upper bound. -/
theorem exists_hammingNorm_le_singleton (C : Submodule F (ι → F)) (hk : 1 ≤ Module.finrank F C) :
    ∃ c ∈ C, c ≠ 0 ∧ hammingNorm c + Module.finrank F C ≤ Fintype.card ι + 1 := sorry

/-- The Singleton lower bound for every nonzero codeword, stated without a zero-code distance convention. -/
def IsMDS (C : Submodule F (ι → F)) : Prop :=
  ∀ c ∈ C, c ≠ 0 → Fintype.card ι + 1 ≤ hammingNorm c + Module.finrank F C

/-- Evaluate the existing degreeLT space at the specified indexed points. -/
noncomputable def reedSolomonEncode (α : ι → F) (k : ℕ) : degreeLT F k →ₗ[F] (ι → F) :=
  (LinearMap.pi fun i => Polynomial.leval (α i)) ∘ₗ (degreeLT F k).subtype

/-- The range of the polynomial evaluation map as a submodule. -/
noncomputable def reedSolomon (α : ι → F) (k : ℕ) : Submodule F (ι → F) :=
  LinearMap.range (reedSolomonEncode α k)

/-- Distinct evaluation points make the RS dimension equal to k when k is at most the length. -/
theorem finrank_reedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ}
    (hk : k ≤ Fintype.card ι) : Module.finrank F (reedSolomon α k) = k := sorry

/-- Positive-dimensional RS codes are MDS and attain the minimum nonzero weight. -/
theorem isMDS_reedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ} (hk1 : 1 ≤ k)
    (hk : k ≤ Fintype.card ι) :
    IsMDS (reedSolomon α k) ∧ ∃ c ∈ reedSolomon α k, hammingNorm c + k = Fintype.card ι + 1 := sorry

example : IsMDS (⊥ : Submodule F (ι → F)) := by
  intro c hc hne
  exact False.elim (hne (by simpa using hc))

example (α : ι → F) (k : ℕ) : reedSolomonEncode α k 0 = 0 := by simp

example (α : ι → F) (k : ℕ) : (0 : ι → F) ∈ reedSolomon α k := by simp

end Codes
section PrincipalUnits
variable [Fact (Nat.Prime 2)]
local notation "GR" => fun n r => TruncatedWittVector 2 n (GaloisField 2 r)
/-- Count power-of-two torsion in principal 2-units, with the nontrivial range guarded. -/
theorem principalTwoUnits_card_pow_eq_one (n r k : ℕ)
    (hn : 3 ≤ n) (hr : 1 ≤ r) (hk : 1 ≤ k) (hkn : k ≤ n - 2) :
    Nat.card {u : (GR n r)ˣ //
      (∃ a : GR n r, (u : GR n r) = 1 + 2 * a) ∧ u ^ (2 ^ k) = 1} =
      2 ^ (r * k + 1) := by sorry

end PrincipalUnits
/-! ## Trace sequences and Walsh correlation -/
/-- A finite field has at least two elements, so its multiplicative period is positive. -/
instance finiteFieldPeriodNeZero (E : Type*) [Field E] [Fintype E] :
    NeZero (Fintype.card E - 1) := ⟨by have := Fintype.one_lt_card (α := E); omega⟩
section Walsh
variable {F E : Type*} [Field F] [Fintype F] [Field E] [Fintype E]
variable [Algebra F E] [FiniteDimensional F E]
local notation "N" => Fintype.card E - 1
/-- The trace sequence driven by powers of a unit, indexed by the full multiplicative period. -/
def traceWord (α : Eˣ) (A : E) : ZMod N → F :=
  fun i => Algebra.trace F E (A * (α : E) ^ i.val)

/-- Shift a cyclic word by adding the shift to its argument. -/
def shiftWord {ι : Type*} {M : ℕ} [NeZero M] (t : ZMod M) (v : ZMod M → ι) : ZMod M → ι :=
  fun i => v (i + t)

/-- Cross-correlation conjugates the shifted second word. -/
def periodicCorr {M : ℕ} [NeZero M] (ψ : AddChar F ℂ)
    (b a : ZMod M → F) (t : ZMod M) : ℂ :=
  ∑ i : ZMod M, ψ (b i) * star (ψ (a (i + t)))

/-- The unnormalized trace Walsh transform, with conjugation on the linear phase. -/
def traceWalsh (ψ : AddChar F ℂ) (B : E → F) (y : E) : ℂ :=
  ∑ x : E, ψ (B x) * star (ψ (Algebra.trace F E (y * x)))

/-- Every trace Walsh coefficient has magnitude the square root of the extension cardinality. -/
def IsTraceBent (ψ : AddChar F ℂ) (B : E → F) : Prop :=
  ∀ y, ‖traceWalsh ψ B y‖ = Real.sqrt (Fintype.card E)

/-- A primitive driving element enumerates nonzero field elements; the omitted zero term supplies the correction. -/
theorem periodicCorr_traceWalsh (ψ : AddChar F ℂ) (B : E → F) (α : Eˣ)
    (hα : orderOf α = N) (t : ZMod N) :
    periodicCorr ψ (fun i => B ((α : E) ^ i.val)) (traceWord (F := F) α 1) t + ψ (B 0) =
      traceWalsh ψ B ((α : E) ^ t.val) := by sorry

/-- Bentness bounds the correlation plus its explicit missing-zero correction. -/
theorem bent_correlation_norm (ψ : AddChar F ℂ) (B : E → F)
    (hB : IsTraceBent ψ B) (α : Eˣ) (hα : orderOf α = N) (t : ZMod N) :
    ‖periodicCorr ψ (fun i => B ((α : E) ^ i.val))
      (traceWord (F := F) α 1) t + ψ (B 0)‖ = Real.sqrt (Fintype.card E) := by sorry
example {M : ℕ} [NeZero M] (t : ZMod M) (v : ZMod M → F) :
    shiftWord t (shiftWord (-t) v) = v := by
  funext i
  simp [shiftWord]
example (α : Eˣ) : traceWord (F := F) α 0 = 0 := by
  funext i
  simp [traceWord]

example {M : ℕ} [NeZero M] (b a : ZMod M → F) (t : ZMod M) :
    periodicCorr (1 : AddChar F ℂ) b a t = M := by
  simp [periodicCorr]

example :
    let ψ := AddChar.zmodChar 2 (ζ := (-1 : ℂ)) (by norm_num)
    let b : ZMod 3 → ZMod 2 := fun i => if i = 0 then 0 else 1
    let a : ZMod 3 → ZMod 2 := fun i => if i = 2 then 0 else 1
    periodicCorr ψ b a 0 = -1 ∧ periodicCorr ψ b a 2 = 3 := by
  have hs : (Finset.univ : Finset (ZMod 3)) = {0, 1, 2} := by decide
  norm_num [periodicCorr, hs, AddChar.zmodChar_apply, Finset.sum_insert,
    Finset.sum_singleton, show (0 : ZMod 3) ≠ 2 from by decide,
    show (1 : ZMod 3) ≠ 2 from by decide,
    show (2 : ZMod 3) ≠ 0 from by decide,
    show (1 : ZMod 2).val = 1 from by decide]

example (B : E → F) (y : E) :
    traceWalsh (1 : AddChar F ℂ) B y = Fintype.card E := by
  simp [traceWalsh]

example : ¬ IsTraceBent (1 : AddChar (ZMod 2) ℂ) (fun _ : ZMod 2 => 0) := by
  intro h
  have h0 := h 0
  norm_num [traceWalsh] at h0
  nlinarith [Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)]

end Walsh
section Geometric
variable {p : ℕ} [Fact p.Prime]
variable {L K : Type*} [Field L] [Fintype L] [Field K] [Fintype K]
variable [Algebra (ZMod p) L] [Algebra L K] [Algebra (ZMod p) K]
variable [IsScalarTower (ZMod p) L K] [FiniteDimensional (ZMod p) L]
variable [FiniteDimensional L K] [FiniteDimensional (ZMod p) K]
local notation "N" => Fintype.card K - 1
/-- Feed the relative trace of successive powers into a prime-alphabet function. -/
def geometricSequence (α : Kˣ) (f : L → ZMod p) : ZMod N → ZMod p :=
  fun i => f (Algebra.trace L K ((α : K) ^ i.val))

/-- The GMW feed is prime-field trace after a positive power permuting the intermediate field. -/
def gmwSequence (α : Kˣ) (h : ℕ) (_hh : 1 ≤ h)
    (_hcop : Nat.Coprime h (Fintype.card L - 1)) : ZMod N → ZMod p :=
  geometricSequence α (fun u : L => Algebra.trace (ZMod p) L (u^h))

/-- GMW words have full zero-shift correlation and correlation -1 at every other shift. -/
theorem gmw_autocorrelation (α : Kˣ) (hα : orderOf α = N) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (ψ : AddChar (ZMod p) ℂ) (hψ : ψ ≠ 1)
    (t : ZMod N) :
    periodicCorr ψ (gmwSequence α h hh hcop) (gmwSequence α h hh hcop) t =
      if t = 0 then (N : ℂ) else -1 := by sorry

/-- GMW block counts are uniform up to intermediate-extension degree, apart from the omitted all-zero input. -/
theorem gmw_block_count (α : Kˣ) (hα : orderOf α = N) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (j : ℕ) (hj : 1 ≤ j)
    (hjm : j ≤ Module.finrank L K) (w : Fin j → ZMod p) :
    Nat.card {i : ZMod N // ∀ k : Fin j, gmwSequence α h hh hcop (i + (k : ℕ)) = w k} =
      Fintype.card K / p^j - if w = 0 then 1 else 0 := by sorry

example (α : Kˣ) : geometricSequence α (fun _ : L => (0 : ZMod p)) = 0 := rfl

example (α : Kˣ) :
    gmwSequence (L := L) α 1 (by decide) (by simp) =
      geometricSequence α (Algebra.trace (ZMod p) L) := by
  funext i
  simp [gmwSequence, geometricSequence]

end Geometric
/-! ## Hermitian evaluation codes -/
section Hermitian
variable (p : ℕ) (K : Type*) [Field K]
/-- Affine solutions of y^p+y=x^(p+1), on the existing product carrier. -/
def HermitianPoints : Type _ := {z : K × K // z.2^p + z.2 = z.1^(p+1)}

/-- The finite affine solution subtype inherits its enumeration from K × K. -/
instance [Fintype K] : Fintype (HermitianPoints p K) :=
  Fintype.ofEquiv {z : K × K // z.2 ^ p + z.2 = z.1 ^ (p+1)} (Equiv.refl _)
/-- The span of the specified bounded monomials in the native bivariate polynomial ring. -/
def hermitianMessageSpace (l : ℕ) : Submodule K (MvPolynomial (Fin 2) K) :=
  Submodule.span K {f | ∃ i j : ℕ, i ≤ p ∧ i+j ≤ l ∧
    f = (MvPolynomial.X (0 : Fin 2))^i * (MvPolynomial.X (1 : Fin 2))^j}

/-- Restrict native polynomial evaluation to the Hermitian message submodule. -/
def hermitianEval (l : ℕ) : hermitianMessageSpace p K l →ₗ[K] (HermitianPoints p K → K) :=
  (LinearMap.pi fun z : HermitianPoints p K =>
    (MvPolynomial.aeval (fun i : Fin 2 => if i = 0 then z.val.1 else z.val.2)).toLinearMap).comp
      (hermitianMessageSpace p K l).subtype

/-- The Hermitian evaluation range on its actual affine point type. -/
def hermitianCode (l : ℕ) : TauCeti.LinearCode K (HermitianPoints p K) :=
  LinearMap.range (hermitianEval p K l)

example : ((⟨(0, 0), by simp⟩ : HermitianPoints 2 K) : K × K) = (0, 0) := rfl

example : (1 : MvPolynomial (Fin 2) K) ∈ hermitianMessageSpace p K 0 := by
  apply Submodule.subset_span
  exact ⟨0, 0, by omega, by omega, by simp⟩

example (l : ℕ) : hermitianEval p K l 0 = 0 := by simp

example (l : ℕ) : (0 : HermitianPoints p K → K) ∈ hermitianCode p K l := by simp

end Hermitian
/-- Over the field of p^2 elements the Hermitian affine curve has p^3 points. -/
theorem hermitianPoints_card (p : ℕ) [Fact p.Prime] (K : Type*) [Field K] [Fintype K]
    [CharP K p] (hK : Fintype.card K = p^2) : Fintype.card (HermitianPoints p K) = p^3 := by sorry

/-- Count the monomial basis by a finite sum, valid even below p-1. -/
theorem hermitianMessage_finrank (p : ℕ) (K : Type*) [Field K] (l : ℕ) :
    Module.finrank K (hermitianMessageSpace p K l) =
      ∑ i ∈ Finset.range (min p l + 1), (l-i+1) := by sorry

/-- Injectivity below the pole-degree threshold gives the exact dimension and designed distance. -/
theorem hermitianCode_parameters (p : ℕ) [Fact p.Prime] (K : Type*) [Field K] [Fintype K]
    [CharP K p] (hK : Fintype.card K = p^2) (l : ℕ) (hl : l*(p+1) < p^3) :
    Fintype.card (HermitianPoints p K) = p^3 ∧
    Module.finrank K (hermitianCode p K l) = ∑ i ∈ Finset.range (min p l+1), (l-i+1) ∧
    ∀ c ∈ hermitianCode p K l, c ≠ 0 → p^3-l*(p+1) ≤ hammingNorm c := by sorry


/-! ## Norm-one sums and the finite-plane spectrum -/
section SotoAndrade
variable {F K : Type*} [Field F] [Fintype F] [Field K] [Fintype K]
variable [Algebra F K] [FiniteDimensional F K]
/-- The multiplicative norm kernel for the specified extension. -/
def NormOneUnits (F K : Type*) [Field F] [Field K] [Algebra F K]
    [FiniteDimensional F K] : Subgroup Kˣ :=
  (Units.map (Algebra.norm F (S := K))).ker

/-- Extend a unit-group character by zero at zero, including the trivial unit character. -/
def unitCharZero (ε : Fˣ →* ℂˣ) (x : F) : ℂ :=
  if hx : x = 0 then 0 else (ε (Units.mk0 x hx) : ℂ)

/-- The trace-twisted character sum over the relative norm-one units. -/
def sotoAndradeSum (ε : Fˣ →* ℂˣ) (ω : NormOneUnits F K →* ℂˣ) (t : F) : ℂ :=
  ∑ u : NormOneUnits F K, unitCharZero ε (Algebra.trace F K (u.val : K) + t) * (ω u : ℂ)

/-- Katz’s quadratic norm-torus bound, with both exceptional configurations excluded. -/
theorem sotoAndrade_norm_le (h2 : Module.finrank F K = 2)
    (hodd : Odd (Fintype.card F)) (ε : Fˣ →* ℂˣ)
    (ω : NormOneUnits F K →* ℂˣ) (t : F)
    (htriv : ¬ (ε = 1 ∧ ω = 1))
    (hquad : ¬ (orderOf ε = 2 ∧ orderOf ω = 2 ∧ (t = 2 ∨ t = -2))) :
    ‖sotoAndradeSum ε ω t‖ ≤ 2 * Real.sqrt (Fintype.card F) ∧
      ((t = 2 ∨ t = -2) → ‖sotoAndradeSum ε ω t‖ ≤ Real.sqrt (Fintype.card F)) := by sorry

example (ε : Fˣ →* ℂˣ) : unitCharZero ε (0 : F) = 0 := by
  simp [unitCharZero]
example : (1 : (ZMod 3)ˣ) ∈ NormOneUnits (ZMod 3) (ZMod 3) := by
  exact (NormOneUnits (ZMod 3) (ZMod 3)).one_mem

example : sotoAndradeSum (F := ZMod 2) (K := ZMod 2) 1 1 1 = 0 := by
  classical
  unfold sotoAndradeSum
  apply Finset.sum_eq_zero
  intro u _
  have hu : u = 1 := Subsingleton.elim _ _
  subst u
  norm_num [unitCharZero, Algebra.trace_self]
  decide

end SotoAndrade
section Terras
variable {F K : Type*} [Field F] [Fintype F] [Field K] [Fintype K]
variable [Algebra F K] [FiniteDimensional F K]
/-- Coordinates x+y√δ with x in F and y a unit; the nonsquare δ is specified separately. -/
abbrev UpperHalfPlane (F : Type*) [Field F] := F × Fˣ

example : Fintype.card (UpperHalfPlane (ZMod 3)) = 6 := by decide

/-- Terras’s invariant pseudo-distance in split coordinates. -/
def upperHalfPlaneDistance (δ : F) (z w : UpperHalfPlane F) : F :=
  ((w.1-z.1)^2 - δ*((w.2 : F)-(z.2 : F))^2) / ((w.2 : F)*(z.2 : F))

/-- The adjacency matrix acts by summation with counting measure. -/
def terrasAdjacency (δ a : F) : (UpperHalfPlane F → ℂ) →ₗ[ℂ] (UpperHalfPlane F → ℂ) :=
  Matrix.toLin' (fun z w => if upperHalfPlaneDistance δ z w = a then (1 : ℂ) else 0)

/-- The mixed character sum left after counting the two horizontal square roots. -/
def principalSeriesSum (ε₂ χ : Fˣ →* ℂˣ) (δ a : F) : ℂ :=
  ∑ y : Fˣ, (χ y : ℂ) * unitCharZero ε₂ (a*(y : F) + δ*((y : F)-1)^2)

/-- Every mean-zero spherical eigenvalue has an explicit character-sum representative and the Ramanujan bound. -/
theorem terras_eigenvalue_character_sum (h2 : Module.finrank F K = 2)
    (hodd : Odd (Fintype.card F)) (δ a : F) (hδ : ¬ IsSquare δ)
    (ha0 : a ≠ 0) (ha4 : a ≠ 4*δ) (ε₂ : Fˣ →* ℂˣ) (hε₂ : orderOf ε₂ = 2)
    (eigenvalue : ℂ) (v : UpperHalfPlane F → ℂ) (hv : v ≠ 0) (hmean : ∑ z, v z = 0)
    (heig : terrasAdjacency δ a v = eigenvalue • v) :
    (∃ s : ℂ, (s = 1 ∨ s = -1) ∧
      ((∃ χ : Fˣ →* ℂˣ, χ ≠ 1 ∧ eigenvalue = s * principalSeriesSum ε₂ χ δ a) ∨
        (∃ ω : NormOneUnits F K →* ℂˣ, ω ≠ 1 ∧
          eigenvalue = s * sotoAndradeSum ε₂ ω (a/δ-2)))) ∧
      ‖eigenvalue‖ ≤ 2 * Real.sqrt (Fintype.card F) := by sorry

example (δ : F) (z : UpperHalfPlane F) : upperHalfPlaneDistance δ z z = 0 := by
  simp [upperHalfPlaneDistance]
example (δ a : F) : terrasAdjacency δ a 0 = 0 := by simp

example (ε₂ : Fˣ →* ℂˣ) (δ : F) : principalSeriesSum ε₂ 1 δ 0 =
    ∑ y : Fˣ, unitCharZero ε₂ (δ * ((y : F) - 1)^2) := by
  simp [principalSeriesSum]

end Terras
/-! ## Layer 5: arithmetic estimates and secret-sharing fibres -/
/-- The degree-normalized Weil bound at primes larger than the degree and not dividing the leading coefficient. -/
theorem norm_sum_stdAddChar_eval_le (f : ℤ[X]) (hd : 1 ≤ f.natDegree) (p : ℕ) [Fact p.Prime]
    (hlead : ¬ (p : ℤ) ∣ f.leadingCoeff) (hp : f.natDegree < p) :
    ‖∑ x : ZMod p, ZMod.stdAddChar ((f.map (Int.castRingHom (ZMod p))).eval x)‖ ≤
      (f.natDegree - 1 : ℝ) * Real.sqrt p := sorry

/-- A constant depending only on the integer polynomial absorbs the bad and small primes. -/
theorem norm_sum_stdAddChar_eval_le_uniform (f : ℤ[X]) (hd : 1 ≤ f.natDegree) (p : ℕ)
    [Fact p.Prime] :
    ‖∑ x : ZMod p, ZMod.stdAddChar ((f.map (Int.castRingHom (ZMod p))).eval x)‖ ≤
      max (f.natDegree - 1 : ℝ) (Real.sqrt (max f.natDegree f.leadingCoeff.natAbs)) * Real.sqrt p :=
  sorry

/-- The squarefree integer-polynomial quadratic sum bound at odd good primes. -/
theorem abs_sum_quadraticChar_eval_le (g : ℤ[X]) (hn : 1 ≤ g.natDegree) (hdisc : g.discr ≠ 0)
    (p : ℕ) [Fact p.Prime] (hp2 : p ≠ 2) (hp : ¬ (p : ℤ) ∣ g.leadingCoeff * g.discr) :
    |(∑ x : ZMod p, quadraticChar (ZMod p) ((g.map (Int.castRingHom (ZMod p))).eval x) : ℤ)| ≤
      (g.natDegree - 1 : ℝ) * Real.sqrt p := sorry

/-- The prime-modulus Kloosterman sum, indexed by units. -/
noncomputable def kloostermanModP (p : ℕ) [Fact p.Prime] (m n : ZMod p) : ℂ :=
  ∑ x : (ZMod p)ˣ, ZMod.stdAddChar (m * (x : ZMod p) + n * ((x⁻¹ : (ZMod p)ˣ) : ZMod p))

example (p : ℕ) [Fact p.Prime] : kloostermanModP p 0 0 = (p - 1 : ℕ) := by
  simp only [kloostermanModP, zero_mul, zero_add, AddChar.map_zero_eq_one,
    Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_one]
  rw [ZMod.card_units]

/-- Counting quadratic fibres gives the affine curve count as q plus a character sum. -/
theorem card_sq_eq_eval {F : Type*} [Field F] [Fintype F] [DecidableEq F] (hF : ringChar F ≠ 2)
    (g : F[X]) :
    (Fintype.card {xy : F × F // xy.2 ^ 2 = g.eval xy.1} : ℤ) =
      Fintype.card F + ∑ x : F, quadraticChar F (g.eval x) := sorry

/-- The quadratic point-count error uses the number of distinct geometric roots. -/
theorem abs_card_sq_eq_eval_sub_le {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) (g : F[X]) {K : Type*} [Field K] [IsAlgClosed K] [DecidableEq K] [Algebra F K]
    (hsq : ∀ (c : F) (h : K[X]), g.map (algebraMap F K) ≠ C (algebraMap F K c) * h ^ 2) :
    |((Fintype.card {xy : F × F // xy.2 ^ 2 = g.eval xy.1} : ℤ) - Fintype.card F : ℝ)| ≤
      ((g.map (algebraMap F K)).roots.toFinset.card - 1 : ℝ) * Real.sqrt (Fintype.card F) := sorry

/-- A nonsingular zero modulo p^m has p^(n-1) lifts to a zero modulo p^(m+1). -/
theorem card_lifts_of_nonsingular {n : ℕ} (F : MvPolynomial (Fin n) ℤ) (p : ℕ) [Fact p.Prime]
    (m : ℕ) (hm : 1 ≤ m) (x : Fin n → ZMod (p ^ m))
    (hx : MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0)
    (hgrad : ∃ i, MvPolynomial.eval (fun j => ((x j).val : ZMod p))
      (MvPolynomial.map (Int.castRingHom _) (MvPolynomial.pderiv i F)) ≠ 0) :
    Nat.card {y : Fin n → ZMod (p ^ (m + 1)) //
      (∀ j, ((y j).val : ZMod (p ^ m)) = x j) ∧
        MvPolynomial.eval y (MvPolynomial.map (Int.castRingHom _) F) = 0} = p ^ (n - 1) := sorry

/-- At a good prime, all zero fibres lift with the same p^(n-1) multiplicity. -/
theorem card_zeros_mod_prime_pow {n : ℕ} (F : MvPolynomial (Fin n) ℤ) (p : ℕ) [Fact p.Prime]
    (hgood : ∀ x : Fin n → ZMod p, MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0 →
      ∃ i, MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) (MvPolynomial.pderiv i F)) ≠ 0)
    (m : ℕ) (hm : 1 ≤ m) :
    Nat.card {y : Fin n → ZMod (p ^ m) // MvPolynomial.eval y (MvPolynomial.map (Int.castRingHom _) F) = 0} =
      p ^ ((m - 1) * (n - 1)) *
        Nat.card {x : Fin n → ZMod p // MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0} :=
  sorry

/-- Evaluate the fixed secret plus t-1 freely chosen positive-degree coefficients. -/
noncomputable def shamirShares {F : Type*} [Field F] {n t : ℕ} (x : Fin n → F) (s : F)
    (c : Fin (t - 1) → F) : Fin n → F :=
  fun i => (C s + ∑ j, C (c j) * X ^ ((j : ℕ) + 1)).eval (x i)

section Shamir
variable {F : Type*} [Field F] [Fintype F] [DecidableEq F] {n t : ℕ}
/-- Lagrange interpolation at zero reconstructs the secret from any t distinct shares. -/
theorem shamir_reconstruct (x : Fin n → F) (hx : Function.Injective x) (ht : 1 ≤ t) (s : F)
    (c : Fin (t - 1) → F) (S : Finset (Fin n)) (hS : S.card = t) :
    s = ∑ i ∈ S, shamirShares (t := t) x s c i * ∏ j ∈ S.erase i, x j / (x j - x i) := sorry

/-- Fewer than t nonzero evaluation points have equal coefficient fibres for every secret. -/
theorem shamir_card_fiber (x : Fin n → F) (hx : Function.Injective x) (hx0 : ∀ i, x i ≠ 0)
    (ht : 1 ≤ t)
    (S : Finset (Fin n)) (hS : S.card ≤ t - 1) (s : F) (v : S → F) :
    Nat.card {c : Fin (t - 1) → F // ∀ i : S, shamirShares (t := t) x s c i = v i} =
      Fintype.card F ^ (t - 1 - S.card) := sorry


local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

example : shamirShares (t := 2) (![1, 2, 3] : Fin 3 → ZMod 5) 3 ![1] =
    ![4, 0, 1] := by
  funext i
  fin_cases i <;> norm_num [shamirShares, Fin.sum_univ_succ] <;> decide
end Shamir

end TauCetiRoadmap.FiniteFieldsAndCharacterSums

/-
Definitions specified in README.md, including those whose constructions need new
carriers and are therefore stated only there:
* The Frobenius power residue X^(q^k) mod f.
* Rabin irreducibility certificates and their checker.
* Certified presentation of a finite field.
* Embeddings between presented finite fields from root certificates.
* Change of presentation with explicit inverse.
* Tensor product of finite fields.
* The minimal polynomial of an element under the Frobenius.
* The Frobenius normal basis and normal-basis coordinates.
* The finite set of monic polynomials of a given degree.
* The monic irreducible polynomials of a given degree.
* The number Π_F(n) of monic irreducible polynomials of degree n.
* The number of monic irreducibles with prescribed constant coefficient.
* q-linearized (additive) polynomials.
* The subspace polynomial of a finite F_q-subspace.
* The canonical additive character of a finite field.
* The norm lift of a multiplicative character to an extension.
* The trace lift of an additive character to an extension.
* Trivial-character and normalisation conventions for Gauss and Jacobi sums.
* Evaluation of a prescribed-degree binary form.
* The Gauss-sum weight on monic polynomials.
* The Teichmüller character of a prime of a number field.
* Jacobi sums of several multiplicative characters.
* Additive character sums over the finite extensions of F (companion sums).
* Multiplicative character sums over the finite extensions of F.
* The L-series of a function on monic polynomials over F.
* The root-sum character h ↦ ψ(Σ_{h(α)=0} f(α)) of an additive character and a polynomial.
* The root-product character h ↦ χ(Res(h, g)) of a multiplicative character and a polynomial.
* The L-function L(f, ψ; T) of a one-variable additive character sum.
* The L-function Z(g, χ; T) of a one-variable multiplicative character sum.
* Primitive multiplicative characters of finite rings.
* The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve.
* The pole degree at infinity on a Stepanov ring.
* The norm O(P, g) → F[X] and its degree.
* The Artin–Schreier reduced form f* of a polynomial.
* The Artin–Schreier sheaf L_ψ(f).
* The Kummer sheaf L_χ(g).
* Trace functions of lisse ℓ-adic sheaves on open subsets of the line.
* The modified pole order v*_x(f) of a rational function (Sommes trig. Exemple 3.5).
* Kloosterman sums over F and its extensions.
* Hyper-Kloosterman sums.
* The relative hyper-Kloosterman sheaf.
* The universal polynomial with smooth leading form.
* The one-variable Fourier–Deligne transform FT_ψ.
* The geometric Möbius stabilizer of a sheaf.
* The p-th root of a polynomial with zero derivative.
* Square-free decomposition.
* Algorithm SFD.
* Monic squarefree polynomials of degree n.
* Degree-indexed squarefree-square equivalence.
* Squarefree polynomials of adjacent odd and even degree.
* Distinct-degree factorization.
* Algorithm DDF.
* Algorithm IPT, the irreducibility test.
* Generating a Rabin irreducibility certificate.
* The splitting polynomial M_k.
* One refinement step of equal-degree splitting.
* Algorithm EDF (equal-degree factorization) as a round distribution.
* The Cantor–Zassenhaus algorithm.
* The Berlekamp subalgebra.
* The Berlekamp matrix.
* Algorithm B2 (splitting with a basis of B) as a round distribution.
* Berlekamp's factoring algorithm.
* Algorithm RIP (random irreducible polynomial) as an attempt distribution.
* Factorization certificate and its checker.
* Certified factorization over a finite field.
* The linear Hensel lifting algorithm.
* The cubic of a model in characteristic-not-two normal form.
* Point-count certificate.
* Schoof's representatives of maps on ℓ-torsion points.
* The representative of Frobenius.
* The chord rule on Schoof representatives.
* Algorithm 8.3: the trace modulo an odd prime ℓ.
* Schoof's algorithm.
* Basic irreducible polynomials over a local ring.
* The Galois ring GR(p^n, r).
* The Teichmüller section F_{p^r} → GR(p^n, r).
* The Frobenius automorphism of GR(p^n, r).
* The linearized q-associate of a polynomial.
* Frobenius Ore and linearized polynomial comparison.
* Reduced linearized composition algebra.
* Reduced evaluation and endomorphisms.
* Intermediate-field coefficient subalgebra.
* Permutation polynomials of a finite field.
* The least period of a purely periodic sequence.
* The order (period, exponent) of a polynomial over a finite field.
* Primitive polynomials over a finite field.
* m-sequences (maximal-length linear recurring sequences).
* Periodic cross-correlation and autocorrelation.
* Dirichlet and Legendre sequences.
* Trace Walsh transform.
* Bent functions for the trace transform.
* Trace decimation families.
* Small Kasami family.
* Geometric feed sequences.
* Gordon–Mills–Welch sequences.
* Homogeneous d-forms.
* Maximum distance separable (MDS) codes.
* Reed–Solomon codes.
* Generalized Reed–Solomon codes.
* Subfield subcodes.
* Primitive narrow-sense BCH codes.
* Evaluation of functions at a rational place.
* Algebraic geometry evaluation codes C_L(D, G).
* Algebraic geometry residue codes C_Ω(D, G).
* Words and the cyclic polynomial quotient.
* Cyclic linear codes.
* Cyclic-code ideal correspondence.
* Generator polynomial of a cyclic code.
* Check polynomial of a cyclic code.
* Hermitian monomial evaluation code.
* Terras's finite upper half-plane H_q.
* The fractional linear action of GL(2, F_q) on H_q.
* Terras's invariant pseudo-distance on H_q.
* The finite upper half-plane graphs X_q(δ, a).
* Hecke operators of a finite homogeneous space, with pinned measures.
* Soto–Andrade norm-one sums.
* Kloosterman sums modulo a prime.
* Shamir's secret sharing scheme.
* Lang character sheaf on the quadratic norm torus.
Their full signatures, APIs, checks and source locators are in README.md.
-/
