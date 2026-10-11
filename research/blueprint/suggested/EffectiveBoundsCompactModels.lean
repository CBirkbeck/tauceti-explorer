import Mathlib.NumberTheory.NumberField.House
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.Combinatorics.Nullstellensatz
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic

/-!
This file is not the roadmap and is not exhaustive. The definitive document is
`EffectiveBoundsCompactModels.md`. These signatures suggest Lean forms so that
contributors and reviewers converge on names and signatures. All proofs remain
unimplemented. GN owns the generic lattice results, GI owns bounded coefficient
coordinates and first jets, SF owns Jacobian localization and isolated Bézout,
and ST.0 owns the isomorphism-class carrier. The local abbreviations below expose
those native expressions without introducing alternative supplier structures.
-/
noncomputable section
open scoped BigOperators NumberField ENNReal Classical
open Module MeasureTheory MeasureTheory.Measure MvPolynomial NumberField.InfinitePlace
set_option linter.unusedVariables false
set_option autoImplicit false

namespace NumberField.CompactModel

variable (K : Type*) [Field K] [NumberField K]

-- CM.0
 def canonicalMeasure : Measure (mixedEmbedding.mixedSpace K) :=
  (2 : ℝ≥0∞) ^ nrComplexPlaces K • volume

 theorem canonicalMeasure_apply (U : Set (mixedEmbedding.mixedSpace K)) :
    canonicalMeasure K U = (2 : ℝ≥0∞) ^ nrComplexPlaces K * volume U := by sorry

 theorem canonicalMeasure_haar : IsAddHaarMeasure (canonicalMeasure K) := by sorry

 theorem canonicalMeasure_unitBody :
    canonicalMeasure K {x | ‖x‖ ≤ 1} =
      (2 : ℝ≥0∞) ^ nrRealPlaces K *
        (ENNReal.ofReal (2 * Real.pi)) ^ nrComplexPlaces K ∧
    (2 : ℝ≥0∞) ^ finrank ℚ K ≤ canonicalMeasure K {x | ‖x‖ ≤ 1} := by sorry

-- canonicalMeasure_totallyReal
example (h : nrComplexPlaces K = 0) : canonicalMeasure K = volume := by sorry
-- canonicalMeasure_oneComplex
example (h : nrComplexPlaces K = 1) : canonicalMeasure K = (2 : ℝ≥0∞) • volume := by sorry
-- canonicalMeasure_rationalBody
example : canonicalMeasure ℚ {x | ‖x‖ ≤ 1} = 2 := by sorry

 theorem canonicalCovolume :
    ZLattice.covolume (mixedEmbedding.integerLattice K) (canonicalMeasure K) =
      Real.sqrt |(discr K : ℝ)| ∧
    Real.sqrt |(discr K : ℝ)| =
      (rootDiscr K) ^ ((finrank ℚ K : ℝ) / 2) ∧ 1 ≤ rootDiscr K := by sorry

 theorem firstHalfMinima : ∃ ω : Fin (finrank ℚ K) → 𝓞 K,
    LinearIndependent ℚ (fun i => (ω i : K)) ∧
    Monotone (fun i => house (ω i : K)) ∧
    (∀ i, 1 ≤ house (ω i : K)) ∧
    (∏ i, house (ω i : K)) ≤ (rootDiscr K) ^ ((finrank ℚ K : ℝ) / 2) ∧
    ∀ i, i.val < finrank ℚ K / 2 + 1 → house (ω i : K) ≤ rootDiscr K := by sorry

 theorem productSpan {k F : Type*} [Field k] [Field F] [Algebra k F]
    [FiniteDimensional k F] (V : Submodule k F)
    (h : finrank k F < 2 * finrank k V) :
    Submodule.span k {x | ∃ a ∈ V, ∃ b ∈ V, x = a * b} = ⊤ := by sorry

 theorem shortIntegers : ∃ α : Fin (finrank ℚ K) → 𝓞 K,
    LinearIndependent ℚ (fun i => (α i : K)) ∧
    ∀ i, house (α i : K) ≤ (rootDiscr K) ^ 2 := by sorry

-- shortIntegers_nonBasis: a short family in Q(i) can have strict integral index.
example (i : 𝓞 K) (hi : i^2 = -1) (b : Basis (Fin 2) ℤ (𝓞 K))
    (h0 : b 0 = 1) (h1 : b 1 = i) :
    let α : Fin 2 → 𝓞 K := fun j => if j = 0 then 1 else 2*i
    LinearIndependent ℚ (fun j => (α j : K)) ∧
    (∀ j, house (α j : K) ≤ (rootDiscr K)^2) ∧
    Submodule.span ℤ (Set.range α) ≠ ⊤ := by sorry

-- CM.1
variable {K} {n r d : ℕ}
 def parameterTuple (α : Fin n → 𝓞 K) (u : Fin n → Fin r → ℤ) : Fin r → 𝓞 K :=
  fun j => ∑ i, u i j • α i

 theorem parameterTuple_apply (α : Fin n → 𝓞 K) (u : Fin n → Fin r → ℤ) (j) :
    parameterTuple α u j = ∑ i, u i j • α i := by sorry
 theorem parameterTuple_embedding (α : Fin n → 𝓞 K) (u : Fin n → Fin r → ℤ)
    (τ : K →+* ℂ) (j) :
    τ (parameterTuple α u j : K) = ∑ i, (u i j : ℂ) * τ (α i : K) := by sorry
 theorem parameterTuple_house (α : Fin n → 𝓞 K) (u : Fin n → Fin r → ℤ)
    (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (ha : ∀ i, house (α i : K) ≤ A) (hu : ∀ i j, |(u i j : ℝ)| ≤ B) (j) :
    house (parameterTuple α u j : K) ≤ n * B * A := by sorry
-- parameterTuple_zero
example (α : Fin n → 𝓞 K) : parameterTuple α (fun _ (_ : Fin r) => 0) = 0 := by sorry
-- parameterTuple_coordinate
example (α : Fin n → 𝓞 K) (i : Fin n) :
    parameterTuple α (fun k (_ : Fin 1) => if k = i then 1 else 0) 0 = α i := by sorry
-- parameterTuple_negative
example (α : Fin 1 → 𝓞 K) : parameterTuple α (fun _ (_ : Fin 1) => -1) 0 = -α 0 := by sorry

-- Native GI.0 bounded submodule and monomial index; no new public carrier.
private abbrev Bounded (R : Type*) [CommSemiring R] (r d : ℕ) :=
  MvPolynomial.restrictTotalDegree (Fin r) R d
private abbrev Monomials (r d : ℕ) :=
  {a : Fin r →₀ ℕ // a.sum (fun _ m => m) ≤ d}
-- The finiteness and cardinality are supplied by GI.0/monomial-count.
private instance monomialsFinite : Finite (Monomials r d) := by sorry
private instance monomialsFintype : Fintype (Monomials r d) := Fintype.ofFinite _
private abbrev Coeff (r d : ℕ) := Monomials r d → ℤ
private abbrev unitCoeff (a : Monomials r d) : Coeff r d :=
  fun b => if b = a then 1 else 0
private abbrev monomialValue (κ : Fin r → 𝓞 K) (a : Monomials r d) : 𝓞 K :=
  a.val.prod (fun j m => κ j ^ m)
-- The value of the GI.1 first-jet map in its native function coordinates.
private abbrev jetValue (κ : Fin r → 𝓞 K) (p : Bounded ℂ r d)
    (τ : K →+* ℂ) (j : Option (Fin r)) : ℂ :=
  match j with
  | none => MvPolynomial.eval (fun i => τ (κ i : K)) p.val
  | some i => MvPolynomial.eval (fun j => τ (κ j : K)) (pderiv i p.val)

 theorem parameterJetChoice (α : Fin (finrank ℚ K) → 𝓞 K)
    (hα : LinearIndependent ℚ (fun i => (α i : K)))
    (ha : ∀ i, house (α i : K) ≤ (rootDiscr K) ^ 2)
    (hr : 1 ≤ r) (hd : 5 ≤ d) (hM : finrank ℚ K * (r + 1) ≤ Nat.choose (d+r) d) :
    ∃ u : Fin (finrank ℚ K) → Fin r → ℤ,
      (∀ i j, 0 ≤ u i j ∧ u i j ≤ d * finrank ℚ K * (r+1)) ∧
      Function.Surjective (jetValue (parameterTuple α u) (d := d)) ∧
      Function.Injective (fun τ : K →+* ℂ => fun j => τ (parameterTuple α u j : K)) ∧
      (∀ τ : K →+* ℂ, ∀ j, ‖τ (parameterTuple α u j : K)‖ ≤
        (finrank ℚ K : ℝ)^2 * d * (r+1) * (rootDiscr K)^2) := by sorry

 theorem evaluationSurjective (κ : Fin r → 𝓞 K)
    (hj : Function.Surjective (jetValue κ (d := d))) :
    Function.Surjective (fun p : Bounded ℚ r d => aeval (fun j => (κ j : K)) p.val) ∧
    Function.Surjective (aeval (R := ℚ) (fun j => (κ j : K))) ∧
    Function.Surjective (fun p : {p : Bounded ℂ r d // ∀ τ, jetValue κ p τ none = 0} =>
      fun τ j => jetValue κ p.val τ (some j)) := by sorry

-- CM.2
 def evalIntegral (κ : Fin r → 𝓞 K) (d : ℕ) : Coeff r d →ₗ[ℤ] 𝓞 K where
  toFun c := ∑ a, c a • monomialValue κ a
  map_add' := by sorry
  map_smul' := by sorry
 theorem evalIntegral_apply (κ : Fin r → 𝓞 K) (c : Coeff r d) :
    evalIntegral κ d c = ∑ a, c a • monomialValue κ a := by sorry
 theorem evalIntegral_monomial (κ : Fin r → 𝓞 K) (a : Monomials r d) :
    evalIntegral κ d (unitCoeff a) = monomialValue κ a := by sorry
 theorem evalIntegral_polynomial (κ : Fin r → 𝓞 K) (p : Bounded ℤ r d) :
    evalIntegral κ d (fun a => p.val.coeff a.val) = aeval κ p.val := by sorry
-- evalIntegral_constants
example (κ : Fin r → 𝓞 K) (c : ℤ) : evalIntegral κ 0 (fun _ => c) = c := by sorry
-- evalIntegral_zeroTuple
example (c : Coeff r d) :
    evalIntegral (fun (_ : Fin r) => (0 : 𝓞 K)) d c = c ⟨0, by simp⟩ := by sorry
-- evalIntegral_square
example (κ : Fin 1 → 𝓞 K) (h : κ 0 = 2) :
    evalIntegral κ 2 (fun a => ((X (0 : Fin 1))^2 : MvPolynomial (Fin 1) ℤ).coeff a.val) = 4 := by sorry

 def relationLattice (κ : Fin r → 𝓞 K) (d : ℕ) : Submodule ℤ (Coeff r d) :=
  LinearMap.ker (evalIntegral κ d)
 theorem relationLattice_mem (κ : Fin r → 𝓞 K) (c : Coeff r d) :
    c ∈ relationLattice κ d ↔ evalIntegral κ d c = 0 := by sorry
 theorem relationLattice_saturated (κ : Fin r → 𝓞 K) (c : Coeff r d)
    (a : ℤ) (ha : a ≠ 0) (h : a • c ∈ relationLattice κ d) : c ∈ relationLattice κ d := by sorry
-- Native coordinate transports, used with GN.0 intrinsic covolumes.
private abbrev CoeffReal (r d : ℕ) := EuclideanSpace ℝ (Monomials r d)
private def realCoeff : Coeff r d →ₗ[ℤ] CoeffReal r d where
  toFun c := WithLp.toLp 2 (fun a => (c a : ℝ))
  map_add' := by sorry
  map_smul' := by sorry
private abbrev realSpan (L : Submodule ℤ (Coeff r d)) :=
  Submodule.span ℝ (Set.range (fun c : L => realCoeff c.val))
private abbrev intrinsicLatticeOf (L : Submodule ℤ (Coeff r d)) :=
  (L.map realCoeff).comap ((realSpan L).subtype.restrictScalars ℤ)
private abbrev intrinsicCovolumeOf (L : Submodule ℤ (Coeff r d)) :=
  ZLattice.covolume (intrinsicLatticeOf L)
    (stdOrthonormalBasis ℝ (realSpan L)).toBasis.addHaar
private abbrev relationSpan (κ : Fin r → 𝓞 K) (d : ℕ) := realSpan (relationLattice κ d)
private abbrev intrinsicCovolume (κ : Fin r → 𝓞 K) (d : ℕ) :=
  intrinsicCovolumeOf (relationLattice κ d)
private def evalReal (κ : Fin r → 𝓞 K) (d : ℕ) :
    CoeffReal r d →ₗ[ℝ] mixedEmbedding.mixedSpace K where
  toFun c := ∑ a, c a • mixedEmbedding K (monomialValue κ a : K)
  map_add' := by sorry
  map_smul' := by sorry
private abbrev evalMatrix (κ : Fin r → 𝓞 K) (d : ℕ) :
    Matrix (K →+* ℂ) (Monomials r d) ℂ := fun τ a => τ (monomialValue κ a : K)
 theorem relationLattice_rank (κ : Fin r → 𝓞 K)
    (he : Function.Surjective (fun p : Bounded ℚ r d => aeval (fun j => (κ j : K)) p.val)) :
    Module.finrank ℤ (relationLattice κ d) = Nat.choose (d+r) d - finrank ℚ K ∧
    relationSpan κ d = LinearMap.ker (evalReal κ d) := by sorry
-- relationLattice_zeroTuple
example (hd : 1 ≤ d) :
    (fun a => (X (0 : Fin 1) : MvPolynomial (Fin 1) ℤ).coeff a.val) ∈
      relationLattice (fun (_ : Fin 1) => (0 : 𝓞 K)) d := by sorry
-- relationLattice_constant
example (κ : Fin r → 𝓞 K) : (fun a => (1 : MvPolynomial (Fin r) ℤ).coeff a.val) ∉
    relationLattice κ d := by sorry
-- relationLattice_scaledQuadratic
example (i : 𝓞 K) (hi : i^2 = -1) :
    (fun a => ((X (0 : Fin 1))^2 + C 4 : MvPolynomial (Fin 1) ℤ).coeff a.val) ∈
      relationLattice (fun (_ : Fin 1) => 2*i) 2 ∧
    (fun a => ((X (0 : Fin 1))^2 + 1 : MvPolynomial (Fin 1) ℤ).coeff a.val) ∉
      relationLattice (fun (_ : Fin 1) => 2*i) 2 := by sorry

private def transposeEval (κ : Fin r → 𝓞 K) (d : ℕ) : Module.Dual ℤ (𝓞 K) →ₗ[ℤ] Coeff r d where
  toFun f a := (evalIntegral κ d).dualMap f (unitCoeff a)
  map_add' := by sorry
  map_smul' := by sorry
 def transposeImage (κ : Fin r → 𝓞 K) (d : ℕ) : Submodule ℤ (Coeff r d) :=
  LinearMap.range (transposeEval κ d)
 theorem transposeImage_mem (κ : Fin r → 𝓞 K) (v : Coeff r d) :
    v ∈ transposeImage κ d ↔ ∃ f : Module.Dual ℤ (𝓞 K), ∀ a, v a = f (monomialValue κ a) := by sorry
 theorem transposeImage_orthogonal (κ : Fin r → 𝓞 K) (v c : Coeff r d)
    (hv : v ∈ transposeImage κ d) (hc : c ∈ relationLattice κ d) : ∑ a, v a * c a = 0 := by sorry
private def orthogonalRelations (κ : Fin r → 𝓞 K) (d : ℕ) : Submodule ℤ (Coeff r d) where
  carrier := {v | ∀ c ∈ relationLattice κ d, ∑ a, v a * c a = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
 theorem transposeImage_finiteIndex (κ : Fin r → 𝓞 K)
    (he : Function.Surjective (fun p : Bounded ℚ r d => aeval (fun j => (κ j : K)) p.val)) :
    0 < (transposeImage κ d).toAddSubgroup.relIndex (orthogonalRelations κ d).toAddSubgroup := by sorry
-- transposeImage_rational
example (κ : Fin 1 → 𝓞 ℚ) (h : κ 0 = 2) (c : Coeff 1 1) :
    c ∈ transposeImage κ 1 ↔ ∃ z : ℤ, ∀ a, c a = z * (2 : ℤ) ^ a.val 0 := by sorry
-- transposeImage_strictIndex: basis hypotheses identify the genuine Q(i) integral lattice.
example (i : 𝓞 K) (hi : i^2 = -1) (b : Basis (Fin 2) ℤ (𝓞 K))
    (h0 : b 0 = 1) (h1 : b 1 = i) :
    (transposeImage (fun (_ : Fin 1) => 2*i) 1).toAddSubgroup.relIndex
      (orthogonalRelations (fun (_ : Fin 1) => 2*i) 1).toAddSubgroup = 2 := by sorry
-- transposeImage_constant
example (κ : Fin r → 𝓞 ℚ) : transposeImage κ 0 = ⊤ := by sorry


 theorem finiteIndexGram (κ : Fin r → 𝓞 K)
    (he : Function.Surjective (fun p : Bounded ℚ r d => aeval (fun j => (κ j : K)) p.val))
    (b : Basis (Fin (finrank ℚ K)) ℤ (𝓞 K)) :
    let q := (transposeImage κ d).toAddSubgroup.relIndex (orthogonalRelations κ d).toAddSubgroup
    let B : Matrix (Fin (finrank ℚ K)) (Monomials r d) ℝ :=
      fun i a => (b.repr (monomialValue κ a) i : ℝ)
    (q : ℝ)^2 * intrinsicCovolume κ d ^ 2 = intrinsicCovolumeOf (transposeImage κ d)^2 ∧
    intrinsicCovolumeOf (transposeImage κ d)^2 = Matrix.det (B * B.transpose) ∧
    Matrix.det (B * B.transpose) =
      (Matrix.det (evalMatrix κ d * (evalMatrix κ d).conjTranspose)).re / |(discr K : ℝ)| := by sorry

 theorem relationCovolume (κ : Fin r → 𝓞 K)
    (he : Function.Surjective (fun p : Bounded ℚ r d => aeval (fun j => (κ j : K)) p.val))
    (hr : 1 ≤ r) (hd : 5 ≤ d)
    (hk : ∀ τ : K →+* ℂ, ∀ j, ‖τ (κ j : K)‖ ≤
      (finrank ℚ K : ℝ)^2 * d * (r+1) * (rootDiscr K)^2) :
    intrinsicCovolume κ d ≤
      ((Nat.choose (d+r) d : ℝ) *
        (((finrank ℚ K : ℝ)^2 * d * (r+1))^d * (rootDiscr K)^(2*d))^2) ^
        ((finrank ℚ K : ℝ)/2) / Real.sqrt |(discr K : ℝ)| := by sorry

-- CM.3: convenient numeric expressions, with every exponent a real exponent where needed.
private abbrev explicitHeight (n r d : ℕ) (δ : ℝ) : ℝ :=
  ((Nat.choose (d+r) d - n : ℕ) : ℝ) ^
      (((Nat.choose (d+r) d - n : ℕ) : ℝ) / (2*n)) *
    Real.sqrt (Nat.choose (d+r) d) * ((n : ℝ)^2 * d * (r+1))^d * δ^(2*d)
private abbrev jacobian (E : Fin r → MvPolynomial (Fin r) ℤ) : MvPolynomial (Fin r) ℚ :=
  Matrix.det (fun i j => pderiv j (MvPolynomial.map (Int.castRingHom ℚ) (E i)))

 theorem shortRelations (κ : Fin r → 𝓞 K)
    (hj : Function.Surjective (jetValue κ (d := d)))
    (hr : 1 ≤ r) (hd : 5 ≤ d) (hM : finrank ℚ K * (r+1) ≤ Nat.choose (d+r) d)
    (hk : ∀ τ : K →+* ℂ, ∀ j, ‖τ (κ j : K)‖ ≤
      (finrank ℚ K : ℝ)^2 * d * (r+1) * (rootDiscr K)^2) :
    let ℓ := Nat.choose (d+r) d - finrank ℚ K
    ∃ E : Fin ℓ → relationLattice κ d,
      LinearIndependent ℝ (fun i => realCoeff (E i).val) ∧
      Monotone (fun i => ‖realCoeff (E i).val‖) ∧
      (∀ i, 1 ≤ ‖realCoeff (E i).val‖) ∧
      (∏ i, ‖realCoeff (E i).val‖) ≤
        (ℓ : ℝ)^((ℓ : ℝ)/2) *
          ((Nat.choose (d+r) d : ℝ) *
            (((finrank ℚ K : ℝ)^2*d*(r+1))^d*(rootDiscr K)^(2*d))^2) ^
            ((finrank ℚ K : ℝ)/2) ∧
      (∀ i, i.val < ℓ + 1 - finrank ℚ K →
        ‖realCoeff (E i).val‖ ≤ explicitHeight (finrank ℚ K) r d (rootDiscr K)) := by sorry

 theorem fullRankBlock {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (J : V →ₗ[ℂ] (Fin n → Fin r → ℂ))
    (hJ : Function.Surjective J) (U : Submodule ℂ V) (hn : 1 ≤ n)
    (hcodim : finrank ℂ V - finrank ℂ U < n) :
    ∃ i : Fin n, Function.Surjective (fun x : U => J x.val i) := by sorry

 theorem commonMinor_embeddings (κ : Fin r → 𝓞 K) (E : Fin r → MvPolynomial (Fin r) ℤ)
    (τ : K →+* ℂ) (h : τ (aeval (fun j => (κ j : K)) (jacobian E)) ≠ 0) :
    aeval (fun j => (κ j : K)) (jacobian E) ≠ 0 ∧
    ∀ σ : K →+* ℂ, σ (aeval (fun j => (κ j : K)) (jacobian E)) ≠ 0 := by sorry

 theorem commonMinor {k : ℕ} (κ : Fin r → 𝓞 K) (U : Fin k → Bounded ℤ r d)
    (H : ℝ) (hU : ∀ i, aeval κ (U i).val = 0)
    (hH : ∀ i a, |((U i).val.coeff a : ℝ)| ≤ H)
    (τ : K →+* ℂ)
    (hτ : Function.Surjective (fun c : Fin k → ℂ => fun j : Fin r =>
      ∑ i, c i * τ (aeval (fun j => (κ j : K))
        (pderiv j (MvPolynomial.map (Int.castRingHom ℚ) (U i).val))))) :
    ∃ f : Fin r → Fin k, Function.Injective f ∧
      (∀ i, (U (f i)).val.totalDegree ≤ d) ∧
      (∀ i a, |((U (f i)).val.coeff a : ℝ)| ≤ H) ∧
      ∀ σ : K →+* ℂ, σ (aeval (fun j => (κ j : K))
        (jacobian (fun i => (U (f i)).val))) ≠ 0 := by sorry

 abbrev modelAlgebra (E : Fin r → MvPolynomial (Fin r) ℤ) : Type :=
  Localization.Away (Ideal.Quotient.mk
    (Ideal.span (Set.range (fun i => MvPolynomial.map (Int.castRingHom ℚ) (E i)))) (jacobian E))
-- These are the native quotient/localization instances, not extra mathematical data.
instance (E : Fin r → MvPolynomial (Fin r) ℤ) : CommRing (modelAlgebra E) := by
  unfold modelAlgebra; infer_instance
instance (E : Fin r → MvPolynomial (Fin r) ℤ) : Algebra ℚ (modelAlgebra E) := by
  unfold modelAlgebra; infer_instance
 theorem modelAlgebra_finiteEtale (E : Fin r → MvPolynomial (Fin r) ℤ) :
    FiniteDimensional ℚ (modelAlgebra E) ∧ Algebra.FormallyEtale ℚ (modelAlgebra E) := by sorry
 theorem modelAlgebra_lift {A : Type*} [CommRing A] [Algebra ℚ A]
    (E : Fin r → MvPolynomial (Fin r) ℤ) (κ : Fin r → A)
    (hE : ∀ i, aeval κ (MvPolynomial.map (Int.castRingHom ℚ) (E i)) = 0)
    (hJ : IsUnit (aeval κ (jacobian E))) :
    ∃! φ : modelAlgebra E →ₐ[ℚ] A,
      φ.comp (IsScalarTower.toAlgHom ℚ
        (MvPolynomial (Fin r) ℚ ⧸ Ideal.span
          (Set.range (fun i => MvPolynomial.map (Int.castRingHom ℚ) (E i))))
        (modelAlgebra E)) =
      Ideal.Quotient.liftₐ _ (aeval κ) (by sorry) := by sorry
-- The exact direct-factor formulation uses native products and algebra equivalences.
 theorem modelAlgebra_fieldFactor (E : Fin r → MvPolynomial (Fin r) ℤ)
    (φ : modelAlgebra E →ₐ[ℚ] K) (hφ : Function.Surjective φ) :
    (RingHom.ker φ.toRingHom).IsMaximal ∧
    ∃ (B : Type) (_ : CommRing B) (_ : Algebra ℚ B)
      (e : modelAlgebra E ≃ₐ[ℚ] K × B), ∀ x, (e x).1 = φ x := by sorry
-- modelAlgebra_repeatedRoot
example : Subsingleton (modelAlgebra (fun (_ : Fin 1) => (X (0 : Fin 1))^2)) := by sorry
-- modelAlgebra_twoRational
example : Nonempty (modelAlgebra (fun (_ : Fin 1) => (X (0 : Fin 1))^2 - 1) ≃ₐ[ℚ] ℚ × ℚ) := by sorry
-- modelAlgebra_extraDimension
example : Subsingleton (modelAlgebra (fun i : Fin 2 =>
    if i = 0 then X 0 * X 1 else X 0 * (X 1 - 1))) := by sorry

 theorem explicitModel (hr : 1 ≤ r) (hd : 5 ≤ d)
    (hM : finrank ℚ K * (r+1) ≤ Nat.choose (d+r) d) :
    ∃ E : Fin r → MvPolynomial (Fin r) ℤ,
      (∀ i, (E i).totalDegree ≤ d) ∧
      (∀ i a, |((E i).coeff a : ℝ)| ≤ explicitHeight (finrank ℚ K) r d (rootDiscr K)) ∧
      ∃ φ : modelAlgebra E →ₐ[ℚ] K, Function.Surjective φ := by sorry

-- CM.4
private theorem centralParameter_exists (n : ℕ) :
    ∃ r : ℕ, 0 < r ∧ n*(r+1) ≤ Nat.choose (2*r) r := by sorry
 def centralParameter (n : ℕ) : ℕ := Nat.find (centralParameter_exists n)
 theorem centralParameter_spec (n : ℕ) :
    0 < centralParameter n ∧ n*(centralParameter n+1) ≤
      Nat.choose (2*centralParameter n) (centralParameter n) := by sorry
 theorem centralParameter_minimal (n s : ℕ) (hs : 0 < s) (h : s < centralParameter n) :
    Nat.choose (2*s) s < n*(s+1) := by sorry
 theorem centralParameter_mono : Monotone centralParameter := by sorry
-- centralParameter_one
example : centralParameter 1 = 1 := by sorry
-- centralParameter_two
example : centralParameter 2 = 2 := by sorry
-- centralParameter_three
example : centralParameter 3 = 3 := by sorry

 theorem centralEstimates (n : ℕ) (hn : 65536 ≤ n) (δ : ℝ) (hδ : 1 ≤ δ) :
    let r := centralParameter n
    5 ≤ r ∧ (r : ℝ) ≤ 3*Real.log n ∧
    n*(r+1) ≤ Nat.choose (2*r) r ∧
    (Nat.choose (2*r) r : ℝ) < 4*n*(r+1) ∧
    (Nat.choose (2*r) r : ℝ) ≤ 16*n*Real.log n ∧
    ((Nat.choose (2*r) r - n : ℕ) : ℝ)/(2*n) ≤ 8*Real.log n ∧
    Real.log (Nat.choose (2*r) r) ≤ 3*Real.log n ∧
    Real.log ((Nat.choose (2*r) r - n : ℕ) : ℝ) ≤ 3*Real.log n ∧
    Real.log ((r : ℝ)*(r+1)) ≤ 2*Real.log n ∧
    explicitHeight n r r δ ≤ ((n : ℝ)*δ)^(40*Real.log n) := by sorry

 theorem uniformModel (hn : 65536 ≤ finrank ℚ K) :
    let n := finrank ℚ K
    let r := centralParameter n
    (r : ℝ) ≤ 65536*Real.log n ∧
    (Nat.choose (2*r) r : ℝ) ≤ 65536*n*Real.log n ∧
    ∃ E : Fin r → MvPolynomial (Fin r) ℤ,
      (∀ i, (E i).totalDegree ≤ r) ∧
      (∀ i a, |((E i).coeff a : ℝ)| ≤ ((n : ℝ)*rootDiscr K)^(40*Real.log n)) ∧
      (∀ i a, |((E i).coeff a : ℝ)| ≤ ((n : ℝ)*rootDiscr K)^(65536*Real.log n)) ∧
      ∃ φ : modelAlgebra E →ₐ[ℚ] K, Function.Surjective φ := by sorry

-- CM.5
 def coefficientBox (r d B : ℕ) : Set (Fin r → MvPolynomial (Fin r) ℤ) :=
  {E | (∀ i, (E i).totalDegree ≤ d) ∧ ∀ i a, |(E i).coeff a| ≤ (B : ℤ)}
 theorem coefficientBox_mem (E : Fin r → MvPolynomial (Fin r) ℤ) (B : ℕ) :
    E ∈ coefficientBox r d B ↔
      (∀ i, (E i).totalDegree ≤ d) ∧ ∀ i a, |(E i).coeff a| ≤ (B : ℤ) := by sorry
 theorem coefficientBox_finite (r d B : ℕ) : (coefficientBox r d B).Finite := by sorry
 theorem coefficientBox_mono (r d e B C : ℕ) (hd : d ≤ e) (hB : B ≤ C) :
    coefficientBox r d B ⊆ coefficientBox r e C := by sorry
 theorem coefficientBox_floor (E : Fin r → MvPolynomial (Fin r) ℤ)
    (F : ℝ) (hF : 0 ≤ F) :
    E ∈ coefficientBox r d (Nat.floor F) ↔
      (∀ i, (E i).totalDegree ≤ d) ∧
      ∀ i a, |((E i).coeff a : ℝ)| ≤ F := by sorry
-- coefficientBox_zeroHeight
example : coefficientBox r d 0 = {0} := by sorry
-- coefficientBox_constants
example : (coefficientBox 1 0 1).ncard = 3 := by sorry
-- coefficientBox_endpoint
example : (fun (_ : Fin 1) => 2*X (0 : Fin 1) - C 2) ∈ coefficientBox 1 1 2 ∧
    (fun (_ : Fin 1) => 3*X (0 : Fin 1)) ∉ coefficientBox 1 1 2 := by sorry
 theorem coefficientBoxCard (r d B : ℕ) :
    (coefficientBox r d B).ncard = (2*B+1)^(r*Nat.choose (d+r) d) := by sorry

-- ST.0's native carrier is passed with its exact isomorphism relation.
private abbrev Embedded := {F : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ F}
private instance embeddedFD (F : Embedded) : FiniteDimensional ℚ F.val := F.prop
private instance embeddedNF (F : Embedded) : NumberField F.val := @NumberField.mk F.val _ inferInstance F.prop
variable (s : Setoid Embedded)
variable (hs : ∀ F G, s.r F G ↔ Nonempty (F.val ≃ₐ[ℚ] G.val))

 def componentClass (s : Setoid Embedded)
    (hs : ∀ F G, s.r F G ↔ Nonempty (F.val ≃ₐ[ℚ] G.val)) {A : Type*} [CommRing A] [Algebra ℚ A] [FiniteDimensional ℚ A]
    (p : {p : Ideal A // p.IsMaximal}) : Quotient s := by sorry
 theorem componentClass_quotient {A : Type*} [CommRing A] [Algebra ℚ A]
    [FiniteDimensional ℚ A] (F : Embedded) (φ : A →ₐ[ℚ] F.val)
    (hφ : Function.Surjective φ) (p : {p : Ideal A // p.IsMaximal})
    (hp : RingHom.ker φ.toRingHom = p.val) :
    componentClass s hs p = Quotient.mk s F := by sorry
 theorem componentClass_embedding
    (hs : ∀ F G, s.r F G ↔ Nonempty (F.val ≃ₐ[ℚ] G.val)) {A : Type*} [CommRing A] [Algebra ℚ A]
    [FiniteDimensional ℚ A] (p : {p : Ideal A // p.IsMaximal})
    (F G : Embedded) (eF : (A ⧸ p.val) ≃ₐ[ℚ] F.val) (eG : (A ⧸ p.val) ≃ₐ[ℚ] G.val) :
    Quotient.mk s F = Quotient.mk s G := by sorry
 theorem componentClass_finiteImage {A : Type*} [CommRing A] [Algebra ℚ A]
    [FiniteDimensional ℚ A] : (Set.range (componentClass s hs (A := A))).Finite := by sorry

-- Apply the generic component map using the SF.0 finite-dimensional conclusion.
private instance modelFD (E : Fin r → MvPolynomial (Fin r) ℤ) :
    FiniteDimensional ℚ (modelAlgebra E) := (modelAlgebra_finiteEtale E).1
private abbrev Components (E : Fin r → MvPolynomial (Fin r) ℤ) :=
  {p : Ideal (modelAlgebra E) // p.IsMaximal}
-- componentClass_repeatedRoot
example : IsEmpty (Components (fun (_ : Fin 1) => (X (0 : Fin 1))^2)) := by sorry
-- componentClass_twoRational
example : (Set.range (componentClass s hs
    (A := modelAlgebra (fun (_ : Fin 1) => (X (0 : Fin 1))^2-1)))).ncard = 1 := by sorry
-- componentClass_twoQuadratics
example : (Set.range (componentClass s hs
    (A := modelAlgebra (fun (_ : Fin 1) => ((X (0 : Fin 1))^2-C 2)*((X 0)^2-C 3))))).ncard = 2 := by sorry

 theorem isolatedComponents (E : Fin r → MvPolynomial (Fin r) ℤ)
    (hr : 1 ≤ r) (hdeg : ∀ i, (E i).totalDegree ≤ d) :
    Finite (Components E) ∧ Nat.card (Components E) ≤ d^r := by sorry

private abbrev cutoff (s : Setoid Embedded) (n : ℕ) (H : ℝ) : Set (Quotient s) :=
  Quotient.mk s '' {F : Embedded | finrank ℚ F.val = n ∧ |(discr F.val : ℝ)| ≤ H}
private abbrev ModelComponents (r d B : ℕ) :=
  Σ E : coefficientBox r d B, Components E.val

 theorem finiteSurjection (n : ℕ) (H : ℝ) (hn : 65536 ≤ n) (hH : 1 ≤ H) :
    let r := centralParameter n
    let B := Nat.floor (((n : ℝ)*H^((n : ℝ)⁻¹))^(40*Real.log n))
    cutoff s n H ⊆ Set.range (fun t : ModelComponents r r B => componentClass s hs t.2) ∧
    Finite (ModelComponents r r B) ∧
    Nat.card (ModelComponents r r B) ≤ (2*B+1)^(r*Nat.choose (2*r) r)*r^r := by sorry

 theorem fieldCount (hs : ∀ F G, s.r F G ↔ Nonempty (F.val ≃ₐ[ℚ] G.val)) (n : ℕ) (H : ℝ) (hn : 65536 ≤ n) (hH : 1 ≤ H) :
    (cutoff s n H).Finite ∧
    ((cutoff s n H).ncard : ℝ) ≤
      (n : ℝ)^(65536*n*(Real.log n)^3) * H^(65536*(Real.log n)^3) := by sorry

end NumberField.CompactModel
