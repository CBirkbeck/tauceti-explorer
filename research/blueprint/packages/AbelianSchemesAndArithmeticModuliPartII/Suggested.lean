import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.GroupTheory.Solvable
import Mathlib.GroupTheory.Index
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Analysis.Calculus.ContDiff.Defs
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Geometry.Manifold.ChartedSpace
import Mathlib.Topology.Homotopy.Contractible
import Mathlib.Topology.LocallyFinite
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.Algebra.Module.Submodule.EqLocus
import Mathlib.Algebra.Module.Submodule.Lattice
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.DirectSum.Module
import Mathlib.RingTheory.DividedPowerAlgebra.Init
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Topology.Maps.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.RingTheory.MvPolynomial.Symmetric.NewtonIdentities
import TauCeti.LinearAlgebra.TensorProduct.Symmetric

/-!
This file is not the roadmap and is not exhaustive. The README is definitive.
These suggested forms help contributors and reviewers converge on names and
signatures. No implementation is claimed: definitions, structures, API lemmas
and examples use `sorry`.

The native signatures use Mathlib's tensor powers, divided power algebra,
circle quotient, polynomial resultants and DVR valuation, and Tau Ceti's
flip-fixed tensor square. The final comments identify the geometric signatures
whose required owner interfaces are not yet available at the pinned libraries.
A condition that cannot yet be stated is omitted, never represented by a
`Prop` field or an invented geometric carrier. These omissions do not weaken
the mathematical targets in the README.
-/

set_option autoImplicit false

noncomputable section
namespace AbelianArithmetic
variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- The invariant submodule, as opposed to the symmetric-power quotient. -/
def tensorSymmetricPower (n : ℕ) : Submodule R (TensorPower R n M) := by
  sorry

lemma tensorSymmetricPower_mem (n : ℕ) (t : TensorPower R n M) :
    t ∈ tensorSymmetricPower R M n ↔
      ∀ σ : Equiv.Perm (Fin n),
        PiTensorProduct.reindex R (fun _ : Fin n => M) σ t = t := by
  sorry

lemma tensorSymmetricPower_diagonal (n : ℕ) (v : M) :
    PiTensorProduct.tprod R (fun _ : Fin n => v) ∈ tensorSymmetricPower R M n := by
  sorry

def tensorSymmetricPower_map {N : Type*} [AddCommGroup N] [Module R N]
    (n : ℕ) (f : M →ₗ[R] N) :
    ↥(tensorSymmetricPower R M n) →ₗ[R] ↥(tensorSymmetricPower R N n) := by
  sorry

lemma tensorSymmetricPower_ext (n : ℕ) (x y : ↥(tensorSymmetricPower R M n)) :
    x = y ↔ (x : TensorPower R n M) = (y : TensorPower R n M) := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricPower_zero
example : tensorSymmetricPower R M 0 = ⊤ := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricPower_one
example : tensorSymmetricPower R M 1 = ⊤ := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricPower_nonfixed
example : PiTensorProduct.tprod ℤ
    (fun i : Fin 2 => fun j : Fin 2 => if i = j then (1 : ℤ) else 0)
      ∉ tensorSymmetricPower ℤ (Fin 2 → ℤ) 2 := by
  sorry

/-- Structural carrier alias only; all proposed maps and facts remain unproved. -/
abbrev degreeCompletion := ∀ n : ℕ, ↥(tensorSymmetricPower R M n)

def degreeCompletion_component (n : ℕ) (c : degreeCompletion R M) :
    ↥(tensorSymmetricPower R M n) := by
  sorry

lemma degreeCompletion_component_apply (n : ℕ) (c : degreeCompletion R M) :
    degreeCompletion_component R M n c = c n := by
  sorry

lemma degreeCompletion_ext (c d : degreeCompletion R M) :
    c = d ↔ ∀ n, degreeCompletion_component R M n c =
      degreeCompletion_component R M n d := by
  sorry

lemma degreeCompletion_zero (n : ℕ) :
    degreeCompletion_component R M n (0 : degreeCompletion R M) = 0 := by
  sorry

-- Test AbelianArithmetic.degreeCompletion_zero_component
example : degreeCompletion_component R M 0 (0 : degreeCompletion R M) = 0 := by
  sorry

-- Test AbelianArithmetic.degreeCompletion_single
example (n : ℕ) (x : ↥(tensorSymmetricPower R M n)) :
    degreeCompletion_component R M n
      (Function.update (0 : degreeCompletion R M) n x) = x ∧
      ∀ m, m ≠ n → degreeCompletion_component R M m
        (Function.update (0 : degreeCompletion R M) n x) = 0 := by
  sorry

-- Test AbelianArithmetic.degreeCompletion_product
example : degreeCompletion R M = (∀ n : ℕ, ↥(tensorSymmetricPower R M n)) := by
  sorry

/-! P0: shuffle coefficients and native comparisons. -/

open scoped TensorProduct DirectSum

/-- Diagonal tensor as an element of the invariant submodule. -/
def dividedTensor (n : ℕ) (v : M) : ↥(tensorSymmetricPower R M n) := by
  sorry

lemma dividedTensor_coe (n : ℕ) (v : M) :
    (dividedTensor R M n v : TensorPower R n M) =
      PiTensorProduct.tprod R (fun _ : Fin n => v) := by
  sorry

/-- The bilinear sum over (m,n)-shuffles, rather than concatenation. -/
def shuffleDividedPowers (m n : ℕ) :
    ↥(tensorSymmetricPower R M m) →ₗ[R]
      ↥(tensorSymmetricPower R M n) →ₗ[R]
        ↥(tensorSymmetricPower R M (m + n)) := by
  sorry

abbrev tensorSymmetricAlgebra :=
  DirectSum ℕ (fun n => ↥(tensorSymmetricPower R M n))

/-- The ring operations are those induced by the shuffle maps and the degree-zero unit. -/
instance tensorSymmetricAlgebra_commRing : CommRing (tensorSymmetricAlgebra R M) := by
  sorry

instance tensorSymmetricAlgebra_algebra : Algebra R (tensorSymmetricAlgebra R M) := by
  sorry

def tensorSymmetricAlgebra_include (n : ℕ) :
    ↥(tensorSymmetricPower R M n) →ₗ[R] tensorSymmetricAlgebra R M :=
  DirectSum.lof R ℕ (fun n => ↥(tensorSymmetricPower R M n)) n

lemma tensorSymmetricAlgebra_mul (m n : ℕ)
    (x : ↥(tensorSymmetricPower R M m)) (y : ↥(tensorSymmetricPower R M n)) :
    tensorSymmetricAlgebra_include R M m x * tensorSymmetricAlgebra_include R M n y =
      tensorSymmetricAlgebra_include R M (m + n) (shuffleDividedPowers R M m n x y) := by
  sorry

lemma tensorSymmetricAlgebra_unit :
    (1 : tensorSymmetricAlgebra R M) =
      tensorSymmetricAlgebra_include R M 0 (dividedTensor R M 0 0) := by
  sorry

lemma tensorSymmetricAlgebra_divided (m n : ℕ) (v : M) :
    shuffleDividedPowers R M m n (dividedTensor R M m v) (dividedTensor R M n v) =
      (Nat.choose (m + n) m : R) • dividedTensor R M (m + n) v := by
  sorry

/-- Comparison on arbitrary modules; an isomorphism is stated only under freeness. -/
def dividedPowerComparison :
    DividedPowerAlgebra R M →ₐ[R] tensorSymmetricAlgebra R M := by
  sorry

lemma dividedPowerComparison_dp (n : ℕ) (v : M) :
    dividedPowerComparison R M (DividedPowerAlgebra.dp R n v) =
      tensorSymmetricAlgebra_include R M n (dividedTensor R M n v) := by
  sorry

def dividedPowerComparisonEquiv [Module.Free R M] :
    DividedPowerAlgebra R M ≃ₐ[R] tensorSymmetricAlgebra R M := by
  sorry

lemma dividedPowerComparisonEquiv_toAlgHom [Module.Free R M] :
    (dividedPowerComparisonEquiv R M).toAlgHom = dividedPowerComparison R M := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricAlgebra_zero_degree
example : ∃ e : ↥(tensorSymmetricPower R M 0) ≃ₗ[R] R,
    ∀ x, tensorSymmetricAlgebra_include R M 0 x = algebraMap R _ (e x) := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricAlgebra_char_two
example :
    let v := dividedTensor (ZMod 2) (ZMod 2) 1 1
    shuffleDividedPowers (ZMod 2) (ZMod 2) 1 1 v v = 0 ∧
      dividedTensor (ZMod 2) (ZMod 2) 2 1 ≠ 0 := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricAlgebra_free
example [Module.Free R M] :
    Function.Bijective (dividedPowerComparison R M) := by
  sorry

/-- Binary tensor adapter; its pure-tensor equation pins the native equivalence. -/
def tensorSquareEquiv : TensorPower R 2 M ≃ₗ[R] M ⊗[R] M := by
  sorry

lemma tensorSquareEquiv_tprod (v : Fin 2 → M) :
    tensorSquareEquiv R M (PiTensorProduct.tprod R v) = v 0 ⊗ₜ[R] v 1 := by
  sorry

theorem degreeTwoInvariant :
    (tensorSymmetricPower R M 2).map (tensorSquareEquiv R M).toLinearMap =
      TauCeti.symmetricTensors R M := by
  sorry

/-- Finite-projective multigrading, with total degree carried by the index subtype. -/
def invariantTensorMultigrading {ι : Type*} [Fintype ι] [DecidableEq ι]
    (N : ι → Type*) [∀ i, AddCommGroup (N i)] [∀ i, Module R (N i)]
    [∀ i, Module.Finite R (N i)] [∀ i, Module.Projective R (N i)] (k : ℕ) :
    ↥(tensorSymmetricPower R (DirectSum ι N) k) ≃ₗ[R]
      DirectSum {α : ι → ℕ // ∑ i, α i = k}
        (fun α => PiTensorProduct R (fun i => ↥(tensorSymmetricPower R (N i) (α.1 i)))) := by
  sorry

/-! The geometric layers P1–P4 follow on the parent sheaf and connection carriers. -/

-- F2: an ideal version supplies every ideal-power instance.
theorem monicCoefficientLift {D O : Type*} [CommRing D] [CommRing O]
    (φ : D →+* O) (I : Ideal O)
    (hφ : ∀ o : O, ∃ d : D, o - φ d ∈ I)
    (P : Polynomial O) (hP : P.Monic) :
    ∃ ψ : Polynomial D, ψ.Monic ∧ ψ.natDegree = P.natDegree ∧
      ∀ i, (ψ.map φ).coeff i - P.coeff i ∈ I := by
  sorry

-- F2: explicit m,n are deliberately retained.
theorem fixedResultantCongruence {O : Type*} [CommRing O]
    (I : Ideal O) (P Q Q' : Polynomial O) (m n : ℕ)
    (hQ : ∀ i, Q.coeff i - Q'.coeff i ∈ I) :
    Polynomial.resultant P Q m n - Polynomial.resultant P Q' m n ∈ I := by
  sorry

-- F2: the native valuation sends zero to zero,
-- so common nonzero resultants are essential hypotheses.
theorem padicResultantRecognition {p : ℕ} [Fact p.Prime]
    (P Q : Polynomial (PadicInt p)) (hP : P.Monic) (hQ : Q.Monic)
    (h : ∀ ψ : Polynomial ℤ, ψ.Monic →
      Polynomial.resultant P (ψ.map (Int.castRingHom (PadicInt p))) ≠ 0 →
      Polynomial.resultant Q (ψ.map (Int.castRingHom (PadicInt p))) ≠ 0 →
      PadicInt.valuation (Polynomial.resultant P (ψ.map (Int.castRingHom (PadicInt p)))) =
        PadicInt.valuation (Polynomial.resultant Q (ψ.map (Int.castRingHom (PadicInt p))))) :
    P = Q := by
  sorry


/-! B2: native group growth and local coordinate prerequisites. -/

/-- Not virtually solvable means no finite-index subgroup is solvable. -/
theorem titsFreeSubgroup {K : Type*} [Field K] [CharZero K] (n : ℕ)
    (Γ : Subgroup (Matrix.GeneralLinearGroup (Fin n) K))
    (hΓ : ∀ H : Subgroup Γ, H.FiniteIndex → ¬ Group.IsSolvable H) :
    ∃ f : FreeGroup (Fin 2) →* Γ, Function.Injective f := by
  sorry

/-- The height is explicit, nonnegative and submultiplicative; specialize it to a matrix norm. -/
theorem freeMatrixWordGrowth (n : ℕ)
    (f : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin n) ℤ)
    (hf : Function.Injective f) (ρ : Matrix.GeneralLinearGroup (Fin n) ℤ → ℝ)
    (hρ : ∀ a, 0 ≤ ρ a) (hunit : ρ 1 ≤ 1)
    (hmul : ∀ a b, ρ (a * b) ≤ ρ a * ρ b) (c : ℝ) (hc : 1 < c)
    (hgen : ∀ i, ρ (f (FreeGroup.of i)) ≤ c ∧ ρ ((f (FreeGroup.of i))⁻¹) ≤ c) :
    (∀ k : ℕ, ∃ s : Finset (Matrix.GeneralLinearGroup (Fin n) ℤ),
      2 ^ k ≤ s.card ∧ ∀ a ∈ s, ρ a ≤ c ^ k) ∧
    ∃ C : ℝ, 0 < C ∧ ∃ T₀ : ℝ, ∀ T ≥ T₀,
      ∃ s : Finset (Matrix.GeneralLinearGroup (Fin n) ℤ),
        C * T ^ (Real.log 2 / Real.log c) ≤ (s.card : ℝ) ∧ ∀ a ∈ s, ρ a ≤ T := by
  sorry

open scoped ContDiff

/-- The coordinate form is stated on genuine open partial homeomorphisms, with smooth inverses. -/
theorem constantRankLocal (m n r : ℕ) (hrm : r ≤ m) (hrn : r ≤ n)
    (k : ℕ∞ω) (hk : 1 ≤ k) (f : (Fin m → ℝ) → (Fin n → ℝ))
    (U : Set (Fin m → ℝ)) (hU : IsOpen U) (hf : ContDiffOn ℝ k f U)
    (hrank : ∀ x ∈ U, Module.finrank ℝ (LinearMap.range (fderiv ℝ f x).toLinearMap) = r)
    (x : Fin m → ℝ) (hx : x ∈ U) :
    ∃ a : OpenPartialHomeomorph (Fin m → ℝ) (Fin m → ℝ),
    ∃ b : OpenPartialHomeomorph (Fin n → ℝ) (Fin n → ℝ),
      x ∈ a.source ∧ a.source ⊆ U ∧ f x ∈ b.source ∧ a x = 0 ∧ b (f x) = 0 ∧
      ContDiffOn ℝ k a a.source ∧ ContDiffOn ℝ k a.symm a.target ∧
      ContDiffOn ℝ k b b.source ∧ ContDiffOn ℝ k b.symm b.target ∧
      ∀ y ∈ a.source, f y ∈ b.source ∧
        b (f y) = fun i => if h : i.val < r then a y ⟨i.val, Nat.lt_of_lt_of_le h hrm⟩ else 0 := by
  sorry

/-- A Riemann surface's underlying native charted space suffices for the topological refinement. -/
theorem riemannGoodCover {S ι : Type*} [TopologicalSpace S] [T2Space S]
    [SecondCountableTopology S] [ChartedSpace ℂ S]
    (C : ι → Set S) (hC : ∀ i, IsOpen (C i)) (hcover : ∀ x, ∃ i, x ∈ C i) :
    ∃ V : ℕ → Set S, LocallyFinite V ∧ (∀ x, ∃ j, x ∈ V j) ∧
      (∀ j, IsOpen (V j) ∧ IsCompact (closure (V j)) ∧
        ((V j).Nonempty → ∃ i, V j ⊆ C i) ∧
        ((V j).Nonempty → ∃ x : S, V j ⊆ (chartAt ℂ x).source)) ∧
      ∀ t : Finset ℕ, t.Nonempty → (⋂ j ∈ t, V j).Nonempty →
        ContractibleSpace ↥(⋂ j ∈ t, V j) := by
  sorry

/-! B2: genuine real tori and an equal-dimensional topological signature. -/

abbrev BettiTorus (n : ℕ) := Fin n → AddCircle (1 : ℝ)

/-- The integer pairing uses the native circle quotient. -/
def torusCharacter {n : ℕ} (m : Fin n → ℤ) : BettiTorus n →+ AddCircle (1 : ℝ) := by
  sorry

lemma torusCharacter_apply {n : ℕ} (m : Fin n → ℤ) (x : BettiTorus n) :
    torusCharacter m x = ∑ i, m i • x i := by
  sorry

def torusAnnihilator {n : ℕ} (H : AddSubgroup (BettiTorus n)) :
    AddSubgroup (Fin n → ℤ) := by
  sorry

lemma torusAnnihilator_mem {n : ℕ} (H : AddSubgroup (BettiTorus n)) (m : Fin n → ℤ) :
    m ∈ torusAnnihilator H ↔ ∀ x ∈ H, torusCharacter m x = 0 := by
  sorry

-- A disconnected subgroup has a nonsaturated character lattice.
example : torusAnnihilator (⊥ : AddSubgroup (BettiTorus 1)) = ⊤ := by
  sorry

example : torusAnnihilator (⊤ : AddSubgroup (BettiTorus 1)) = ⊥ := by
  sorry

example (m : Fin 1 → ℤ) :
    m ∈ torusAnnihilator (AddSubgroup.zmultiples
      (fun _ : Fin 1 => ((1 / 2 : ℝ) : AddCircle (1 : ℝ)))) ↔ Even (m 0) := by
  sorry

theorem closedTorusSubgroup_characters {n : ℕ} (H : AddSubgroup (BettiTorus n))
    (hH : IsClosed (H : Set (BettiTorus n))) (x : BettiTorus n) :
    x ∈ H ↔ ∀ m ∈ torusAnnihilator H, torusCharacter m x = 0 := by
  sorry

theorem countableClosedTorusSubgroups (n : ℕ) :
    Set.Countable {H : AddSubgroup (BettiTorus n) | IsClosed (H : Set (BettiTorus n))} := by
  sorry

theorem invarianceOfDomain (m : ℕ) (U : Set (Fin m → ℝ)) (hU : IsOpen U)
    (f : U → (Fin m → ℝ)) (hf : Continuous f) (hinj : Function.Injective f) :
    Topology.IsOpenEmbedding f := by
  sorry

/-! F2: DVR multiplicity and recognition, using the additive valuation with value ∞ at zero. -/

theorem shiftedFactorSlope {O K : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [Field K] [Algebra O K] [IsFractionRing O K]
    (π : O) (hπ : Irreducible π) (R S : Polynomial O)
    (hR : R.Monic) (hS : S.Monic) (hd : 0 < R.natDegree)
    (hcoprime : IsCoprime (R.map (algebraMap O K)) (S.map (algebraMap O K)))
    (e : ℕ) (ψ : ℕ → Polynomial O)
    (hψ : ∀ n, (ψ n).Monic ∧ (ψ n).natDegree = R.natDegree ∧
      ∀ i, (ψ n).coeff i - (R + Polynomial.C (π ^ n)).coeff i ∈
        Ideal.span {π ^ (2 * n)}) :
    ∃ N, ∀ n ≥ N,
      Polynomial.resultant (R ^ e * S) (ψ n) ≠ 0 ∧
      IsDiscreteValuationRing.addVal O (Polynomial.resultant (R ^ e * S) (ψ n)) =
        (n * R.natDegree * e : ℕ) +
          IsDiscreteValuationRing.addVal O (Polynomial.resultant S R) := by
  sorry

theorem resultantRecognition {D O : Type*} [CommRing D] [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] (φ : D →+* O) (π : O) (hπ : Irreducible π)
    (hφ : ∀ N : ℕ, ∀ o : O, ∃ d : D, o - φ d ∈ Ideal.span {π ^ N})
    (P Q : Polynomial O) (hP : P.Monic) (hQ : Q.Monic)
    (h : ∀ ψ : Polynomial D, ψ.Monic →
      Polynomial.resultant P (ψ.map φ) ≠ 0 →
      Polynomial.resultant Q (ψ.map φ) ≠ 0 →
      IsDiscreteValuationRing.addVal O (Polynomial.resultant P (ψ.map φ)) =
        IsDiscreteValuationRing.addVal O (Polynomial.resultant Q (ψ.map φ))) :
    P = Q := by
  sorry

/-! F6: evaluate the existing Newton recurrence and retain q-reciprocity. -/

theorem powerSumReconstruction (q g : ℕ) (P Q : Polynomial ℤ)
    (hP : P.Monic) (hQ : Q.Monic)
    (hdegP : P.natDegree = 2 * g) (hdegQ : Q.natDegree = 2 * g)
    (rootsP rootsQ : Fin (2 * g) → ℂ)
    (hrootsP : P.map (Int.castRingHom ℂ) =
      ∏ i, (Polynomial.X - Polynomial.C (rootsP i)))
    (hrootsQ : Q.map (Int.castRingHom ℂ) =
      ∏ i, (Polynomial.X - Polynomial.C (rootsQ i)))
    (hrecP : ∀ i ≤ g, P.coeff i = (q : ℤ) ^ (g - i) * P.coeff (2 * g - i))
    (hrecQ : ∀ i ≤ g, Q.coeff i = (q : ℤ) ^ (g - i) * Q.coeff (2 * g - i))
    (hsum : ∀ j, 1 ≤ j → j ≤ g → ∑ i, rootsP i ^ j = ∑ i, rootsQ i ^ j) :
    P = Q := by
  sorry

end AbelianArithmetic

/-! P1: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Universal vector extension of the dual
Needs the parent relative abelian-scheme, rigidified Picard and integrable-connection carriers, then the representing group constructed in P1.

Mathematical target: Let A/S be an abelian scheme over a noetherian base. Construct a smooth commutative S-group A♮ representing rigidified line bundles on A_T equipped with an integrable T-relative connection and satisfying the theorem of the square. Forgetting the connection gives an exact sequence 0 → V(ω_A) → A♮ → A∨ → 0. The universal line bundle with connection P♮ has underlying rigidified bundle (id_A × p)^*P. Thus the represented extension has quotient A∨ and vector kernel ω_A.
API signature omitted: AbelianArithmetic.universalVectorExtension_forget
  p sends a rigidified pair (L,∇) to the class of L in A∨.
API signature omitted: AbelianArithmetic.universalVectorExtension_kernel
  ker p is the vector group associated to ω_A.
API signature omitted: AbelianArithmetic.universalVectorExtension_represent
  Hom_S(T,A♮) is naturally the group of rigidified square-compatible line bundles with integrable relative connection on A_T.
API signature omitted: AbelianArithmetic.universalPoincare_pullback
  The underlying line bundle of P♮ equals (id×p)^*P with its rigidification.
Example omitted: AbelianArithmetic.universalVectorExtension_zero
  For the zero-dimensional abelian scheme the representing group and vector kernel are trivial.
Example omitted: AbelianArithmetic.universalVectorExtension_elliptic
  For an elliptic scheme the vector kernel has rank one and Lie(A♮) has rank two.
Example omitted: AbelianArithmetic.universalVectorExtension_dual
  The forgetful target is the imported dual A∨ and the underlying universal sheaf is the imported Poincaré sheaf, not a newly defined Picard functor.
Source: [KS: KS], Notation 2.2, PDF p.13
-/
/- Signature omitted: Lie and cotangent identifications
Needs the parent relative abelian-scheme, rigidified Picard and integrable-connection carriers, then the representing group constructed in P1.

Mathematical target: Lie(A♮/S)≃H¹_dR(A/S) identifies 0→ω_A→Lie(A♮)→Lie(A∨)→0 with the Hodge exact sequence. Its dual identifies H=(H¹_dR)∨ with ω_A♮ and the dual Gauss–Manin connection.
Source: [KS: KS], Notation 2.2 and equation(2.1.1), PDF p.13
-/

/-! P2: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Moments of a formal smooth group
Needs actual formal sheaves and inverse systems on the parent relative group/Poincaré carriers; a polynomial coefficient surrogate would not state this assertion.

Mathematical target: For a separated smooth commutative group G/S of finite presentation, with closed unit section e, its unit ideal J has J^n/J^(n+1)≃Sym^n(ω_G). Iterating the coproduct and projecting each factor O_G/J²→ω_G gives mom_n:O_G/J^(n+1)→⊕_{b≤n}TSym^b(ω_G), compatible with truncation; their inverse limit lands in degree completion. Over a Q-algebra the moment maps are isomorphisms.
API signature omitted: AbelianArithmetic.momentMap_truncate
  Projection from the n-th to the m-th formal neighborhood commutes with moments for m≤n.
API signature omitted: AbelianArithmetic.momentMap_degree_one
  The degree-one component is the canonical projection O_G/J²→ω_G.
API signature omitted: AbelianArithmetic.momentMap_functorial
  A homomorphism of smooth commutative groups commutes with moments through its invariant cotangent map.
Example omitted: AbelianArithmetic.momentMap_zero
  At n=0 the moment map is the identity of O_S.
Example omitted: AbelianArithmetic.momentMap_additive_char_zero
  For G_a over a Q-algebra, x^n maps to n! times the nth invariant divided tensor.
Example omitted: AbelianArithmetic.momentMap_additive_char_p
  For G_a over F_p, the degree-p associated-graded map sends x^p to zero because p!=0; the integral moment map is not automatically an isomorphism.
Source: [KS: KS], Equation(2.1.2), moment construction and Remark 2.3, PDF pp.13–14
-/
/- Signature omitted: Fourier–Mukai input for completed Poincaré cohomology
Needs actual formal sheaves and inverse systems on the parent relative group/Poincaré carriers; a polynomial coefficient surrogate would not state this assertion.

Mathematical target: For a noetherian S and an abelian scheme A/S of constant relative dimension d, establish the normalized Poincaré transform, its formal-functions comparison at the dual unit, and the derived/ordinary completion comparison. After twisting by Ω^d_A/S these identify Rπ_*(P̂ ⊗ Ω^d_A/S) with O_S[−d]. The assertion includes the inverse-limit comparison needed to compute completed, rather than only finite-level, cohomology.
Source: [KS: KS], Theorem 2.15 and its proof, PDF pp.18–19
-/
/- Signature omitted: Finite and completed Poincaré sheaves
Needs actual formal sheaves and inverse systems on the parent relative group/Poincaré carriers; a polynomial coefficient surrogate would not state this assertion.

Mathematical target: For a coherent sheaf F on a smooth group G with unit ideal J, construct its unit completion from the inverse system F ⊗ O_G/J^(n+1), restricted to the unit space. For A, put P^(n) = (id_A × π∨^(n))_*(P|_(A×A∨^(n))) and P̂ = lim_n P^(n). Perform the same construction on A♮ to obtain P♮^(n), P̂♮ and their integrable relative connections. The rigidifications identify degree zero with O_A, give compatible unit sections, and identify the associated-graded kernels with π^*Sym^n(ω_A∨) and π^*Sym^n(H), respectively. Construct the maps P^(n) → P♮^(n) and the finite-level change-of-coefficient comparison along the formal map A♮ → A∨. All limits use the specified finite pushforwards; tensor interchange with an arbitrary inverse limit is a separate assertion.
API signature omitted: AbelianArithmetic.completedPoincare_truncate
  P_hat→P(n) is the projection to the n-th infinitesimal dual neighborhood, and similarly for P♮.
API signature omitted: AbelianArithmetic.completedPoincare_unit
  Rigidification gives the compatible unit sections O_S→e^*P(n).
API signature omitted: AbelianArithmetic.completedPoincare_filtration
  The nth kernel is π^*Sym^n(ω_A∨), respectively π^*Sym^n(H) in the connection version.
Example omitted: AbelianArithmetic.completedPoincare_zero
  P(0)≃O_A and P♮(0)≃O_A with trivial relative connection.
Example omitted: AbelianArithmetic.completedPoincare_first
  P(1) is an extension of O_A by π^*ω_A∨ with the imported unit rigidification.
Example omitted: AbelianArithmetic.completedPoincare_base
  At every finite level the underlying sheaf is pushforward of the imported rigidified Poincaré sheaf restricted to A×A∨(n), rather than a tensor-power replacement.
Source: [KS: KS], Definitions 2.4/2.7 and equations(2.1.4)–(2.1.5), PDF pp.14–16
-/
/- Signature omitted: Isogeny functoriality of completed Poincaré sheaves
Needs actual formal sheaves and inverse systems on the parent relative group/Poincaré carriers; a polynomial coefficient surrogate would not state this assertion.

Mathematical target: For an isogeny φ : 𝒜 → ℬ, the isomorphisms (φ × id)^*𝒫_ℬ ≅ (id × φ^∨)^*𝒫_𝒜 and their ♮-versions (equation (2.2.1)) give canonical maps φ^{(n)}_# : 𝒫^{(n)}_𝒜 → φ^*𝒫^{(n)}_ℬ and 𝒫^{♮(n)}_𝒜 → φ^*𝒫^{♮(n)}_ℬ, isomorphisms if φ^∨ (resp. φ^♮) is étale (e.g. if deg φ is invertible), and in the limit φ_# : 𝒫̂_𝒜 → φ^*𝒫̂_ℬ, 𝒫̂^♮_𝒜 → φ^*𝒫̂^♮_ℬ.
Source: [KS: KS], Theorem 2.8 and proof, PDF p.16
-/
/- Signature omitted: Canonical torsion splittings and moments
Needs actual formal sheaves and inverse systems on the parent relative group/Poincaré carriers; a polynomial coefficient surrogate would not state this assertion.

Mathematical target: For an isogeny φ : 𝒜 → ℬ and a φ-torsion section x, φ_# induces φ_{#x} : x^*𝒫̂_𝒜 → x^*φ^*𝒫̂_ℬ ≅ e^*𝒫̂_ℬ ≅ 𝒪_{ℬ̂^∨}; if φ^∨ is étale, 𝒫̂_𝒜|_{ker φ} ≅ π^*_{ker φ}𝒪_{ℬ̂^∨} and there is a canonical ϱ_x : x^*𝒫̂_𝒜 ≅ 𝒪_{𝒜̂^∨}; the same for 𝒫̂^♮ when φ^♮ is étale. Composing with the moment map gives _ϱmom_x : x^*𝒫̂_𝒜 → TSym^̂(ω_{𝒜^∨}) and x^*𝒫̂^♮_𝒜 → TSym^̂(ℋ), with components _ϱmom^b_x.
Source: [KS: KS], Corollary 2.9 and Definition 2.10, PDF p.17
-/
/- Signature omitted: Equivariant structure under relative automorphisms
Needs actual formal sheaves and inverse systems on the parent relative group/Poincaré carriers; a polynomial coefficient surrogate would not state this assertion.

Mathematical target: If a discrete group Γ acts on 𝒜/𝒮 by automorphisms, (γ_#)^{-1} : γ^*𝒫̂ ≅ 𝒫̂ and γ^*𝒫̂^♮ ≅ 𝒫̂^♮ make 𝒫̂ and 𝒫̂^♮ Γ-equivariant sheaves.
Source: [KS: KS], Corollary 2.11, PDF p.17
-/
/- Signature omitted: Poincaré comultiplication and symmetric levels
Needs actual formal sheaves and inverse systems on the parent relative group/Poincaré carriers; a polynomial coefficient surrogate would not state this assertion.

Mathematical target: There are canonical 𝒫^{(n+m)} → 𝒫^{(n)} ⊗_{𝒪_𝒜} 𝒫^{(m)} and 𝒫̂ → 𝒫̂ ⊗̂ 𝒫̂, co-commutative, whose associated graded is induced by the diagonal of ω_{𝒜^∨} (Proposition 2.12, reflecting the partial group law of the Poincaré torsor, Remark 2.13); likewise for 𝒫^♮. Hence 𝒫^{(n)} → TSym^n_{𝒪_𝒜}(𝒫^{(1)}) and 𝒫^{♮(n)} → TSym^n(𝒫^{♮(1)}), isomorphisms if n! is invertible on 𝒮 (Corollary 2.14).
Source: [KS: KS], Proposition 2.12 and Corollary 2.14, PDF pp.17–18
-/
/- Signature omitted: Top cohomology of the ordinary completed Poincaré sheaf
Needs actual formal sheaves and inverse systems on the parent relative group/Poincaré carriers; a polynomial coefficient surrogate would not state this assertion.

Mathematical target: For an abelian scheme π:A→S of constant relative dimension d over a noetherian base, R^iπ_*(P_hat⊗Ω^d_A/S)≃O_S when i=d and is zero for i≠d, compatibly with the rigidification. This is the completed ordinary Poincaré sheaf. The connection/logarithm variant mentioned in Remark 2.16 is a separate comparison obligation; it is not asserted to have this identical underlying coherent-cohomology formula.
Source: [KS: KS], Theorem 2.15 and proof, PDF pp.18–19
-/

/-! P3: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Square-zero deformation and the logarithm class
Needs rigidified integrable-connection Ext, logarithm sheaves and their analytifications on the parent relative abelian scheme.

Mathematical target: For S=Spec k, char k=0, and finite-dimensional M, the universal connection identifies ker(A♮(k⊕M)→A♮(k))≃Lie(A♮)⊗M≃Hom(H,M) with Ext¹ of O_A by π^*M in integrable connections, compatibly with the split unit. Taking M=H and id_H gives Log¹.
Source: [KS: KS], Theorem 2.36 proof and equation(2.7.2), PDF pp.28–29
-/
/- Signature omitted: The smooth d+ν connection
Needs rigidified integrable-connection Ext, logarithm sheaves and their analytifications on the parent relative abelian scheme.

Mathematical target: Over C, for the Hodge/CM component conventions of §3.1, ν is the identity tensor in H⊗(ω⊕conj ω). On ⊕_{k≤n}TSym^k(H) the connection d+ν has the same rigidified first extension as P♮(1) and induces the higher symmetric constructions.
Source: [KS: KS], Definitions 3.2–3.3 and Theorem 3.5, PDF pp.30–32
-/
/- Signature omitted: Comparison with the logarithm sheaf
Needs rigidified integrable-connection Ext, logarithm sheaves and their analytifications on the parent relative abelian scheme.

Mathematical target: Let S = Spec k with char k = 0. Define Log^(1) as the integrable-connection extension of O_A by π^*H whose image in Hom_k(H,H) is id_H, together with a fixed splitting at e. Use the local-to-global sequence 0 → Ext¹_DS(O_S,H) → Ext¹_DA(O_A,π^*H) → Hom_DS(H,H) → 0 to characterize it. Set Log^(n) = Sym^n(Log^(1)) with the compatible unit sections and transition maps, and Log = lim_n Log^(n). Prove a canonical isomorphism of connections and unit splittings Log^(1) ≃ P♮^(1), and hence Log ≃ P̂♮. The square-zero tangent comparison sends ker(A♮(k⊕M) → A♮(k)) ≃ Lie(A♮) ⊗ M ≃ Hom_k(H,M) to the corresponding rigidified Ext class; at M = H it sends id_H to the first logarithm class.
Source: [KS: KS], Theorem 2.36, PDF pp.28–29
-/
/- Signature omitted: Smooth tensor model and Dolbeault resolutions
Needs rigidified integrable-connection Ext, logarithm sheaves and their analytifications on the parent relative abelian scheme.

Mathematical target: Over ℂ, with ℂ-bases (ū_1, …, ū_d, u_1, …, u_d) of ℋ ≅ conj(Lie(𝒜/ℂ)) ⊕ Lie(𝒜/ℂ) corresponding to ∂/∂z̄_i, ∂/∂z_i (the differential forms are the dual basis) (Definition 3.3), ν = ν^{1,0} + ν^{0,1} ∈ ℋ ⊗ (ω ⊕ ω̄) the identity (Definition 3.2), and the smooth pro-bundles 𝒫^{(n)}, 𝒫^{♮(n)} ⊗ 𝒞^∞ (Notation 3.4): there is a compatible system of horizontal isomorphisms (𝒫^{♮(n)}, ∇_{𝒞^∞}) ≅ (⊕_{k≤n} TSym^k(ℋ), d + ν) restricting to 𝒫^{(n)} ≅ ⊕_{k≤n} TSym^k(ℋ(Σ̄)) and compatible with the moment map along e. Corollary 3.6: 𝒫^{(n),an}[0] ≅ (𝒫^{(n)} ⊗ ℰ^{0,•}, ∇″) and (𝒫^{(n),an} ⊗ Ω^p)[0] ≅ (𝒫^{(n)} ⊗ ℰ^{p,•}, ∇″) (Dolbeault resolutions).
Source: [KS: KS], Definition 3.3, Theorem 3.5 and Corollary 3.6, PDF pp.31–33
-/

/-! P4: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Ordinary CM completion and completed base change
Needs the CM model, ordinary connected torsion and completed base-change/sheaf interfaces; Cp coefficients alone do not represent these geometric data.

Mathematical target: Start with the noetherian CM model (A/R,Σ,ω(A),ω(A∨),x) of Notation 5.1: Frac(R) is a number field containing L^Gal, p is prime and not a unit in R, d_L is a unit, Σ_p and conjugate Σ_p are disjoint, and x is killed by an ideal prime to p. Fix the indicated map R→O_Cp, base change and complete. The ordinary connected p-divisible subgroup is the formal part used by the infinitesimal trivialization; no noetherian assertion about O_Cp is used.
Source: [KS: KS], Notation 5.1 and Proposition 5.9, PDF pp.55–56,59–60
-/
/- Signature omitted: Ordinary infinitesimal trivialization and projected connection
Needs the CM model, ordinary connected torsion and completed base-change/sheaf interfaces; Cp coefficients alone do not represent these geometric data.

Mathematical target: In the ordinary CM setting over O_Cp, let C_n = A[𝔭_Σ^n]. Its formal filtered union is Â, while coordinate rings have the inverse-limit direction. Dual étaleness of [𝔭_Σ^n] permits the diagonal torsion splitting over A × C_n. Passing compatibly to the limit trivializes P̂ on Â with coefficient ring O_((A×A∨)^∧). The first levels become O_Â ⊗ (O_Cp ⊕ ω_A∨) and O_Â ⊗ (O_Cp ⊕ H). Moments give integral injections into the corresponding completed invariant-tensor coefficient modules. On the Cp generic fibre these are isomorphisms. Construct the Hodge retraction r of i : P̂ → P̂♮ and show that r ∇ i becomes the ordinary differential on the formal coefficient ring. The [p]_# calculation eliminates the unwanted Hodge component; the symbol for the retraction is distinct from the prime p.
Source: [KS: KS], Proposition 5.9, equations(5.2.1)–(5.2.4), Lemma 5.11, PDF pp.59–61
-/
/- Signature omitted: Torsion translations of the ordinary trivialization
Needs the CM model, ordinary connected torsion and completed base-change/sheaf interfaces; Cp coefficients alone do not represent these geometric data.

Mathematical target: For y ∈ 𝒜(𝒪_{ℂ_p}) in the kernel of an isogeny φ with étale dual, T_y^*𝒫̂ ≅ 𝒫̂ (always on the generic fibre; Lemma 5.12), and ϱ̂_y : T_y^*𝒫̂|_{𝒜̂} ≅ 𝒫̂|_{𝒜̂} ≅ 𝒪_{(𝒜×𝒜^∨)^∧} (Definition 5.13). Lemma 5.14: (1) mom_{Â^∨} ∘ e^*ϱ̂_y = mom_{Â^∨} ∘ ϱ_y = ϱmom_y; (2) ϱ̂_y ∘ p ∘ ∇ ∘ i = d_Â ∘ ϱ̂_y; (3) for s ∈ 𝒜̂[p^n](𝒪_{ℂ_p}) = 𝒜[𝔭_Σ^n](𝒪_{ℂ_p}), translation by s intertwines ϱ̂_y and ϱ̂_{y+s} with (T_s × id)^* (integrally). Integral translation assumes y killed by an isogeny with étale dual; the generic-fibre extension here is for torsion y, not for every point.
Source: [KS: KS], Lemmas 5.12/5.14 and Definition 5.13, PDF pp.62–63
-/

/-! B0: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Period-coordinate trivializations
Needs the relative analytic period bundle and its polarized-family uniformization from A5, C0 and M5–M6.

Mathematical target: For a polarized abelian scheme A→S of relative dimension g over a smooth irreducible quasi-projective complex variety S, choose connected simply connected U⊂S^an and a symplectic lattice frame of polarization type D=diag(d₁,…,d_g). Its period matrix Z gives (a,b,s)↦(Da+Z(s)b,s), and the inverse induces (b_U,π):A_U^an≃(R/Z)^(2g)×U as real analytic manifolds. b_U alone is projection to the torus.
API signature omitted: AbelianArithmetic.periodCoordinates_betti
  b_U is the torus-coordinate projection, excluding the base coordinate.
API signature omitted: AbelianArithmetic.periodCoordinates_fibre
  The restriction b_U:A_s^an→(R/Z)^(2g) is an analytic group isomorphism.
API signature omitted: AbelianArithmetic.periodCoordinates_leaf
  For fixed torus coordinate β, s↦(b_U,π)^−1(β,s) is holomorphic.
API signature omitted: AbelianArithmetic.periodCoordinates_transition
  Two choices on connected U differ by a constant element of GL_(2g)(Z); these are automorphisms, not arbitrary endomorphisms.
Example omitted: AbelianArithmetic.periodCoordinates_point
  Over a point the torus-coordinate map is the imported complex uniformization expressed in real period coordinates.
Example omitted: AbelianArithmetic.periodCoordinates_zero
  The zero section has Betti coordinate zero.
Example omitted: AbelianArithmetic.periodCoordinates_base_not_counted
  On a constant family over a positive-dimensional U, db_U annihilates the base directions although d(b_U,π) is invertible.
Source: [DGH: DGH], Proposition 2.1 and PropositionB.2 proof, PDF pp.8–9,41–42
-/
/- Signature omitted: Birational invariance of generic Betti rank
Needs the relative analytic period bundle and its polarized-family uniformization from A5, C0 and M5–M6.

Mathematical target: A birational base change between irreducible complex bases identifies generic real Betti rank on the corresponding dominating subvarieties.
Source: [DGH: DGH], LemmaB.3, PDF pp.42–43
-/

/-! B1: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: The descended Betti form
Needs differential forms and Betti differentials on the actual relative period bundle, with the regular-base and smooth-subvariety loci.

Mathematical target: For a principal polarization upstairs on C^g×H_g set Y=Im Z and ω_hat=i∂∂bar(2(Im w)^tY^−1(Im w)). In real coordinates w=a+Zb it equals 2∑ da_j∧db_j. It descends under the arithmetic semidirect action to the universal family and pulls back to A/S. For type D, in coordinates w=Da+Zb, the same calculation gives ω=2∑ d_j da_j∧db_j. On each fibre this is twice the translation-invariant form representing the polarization class; retain this factor-two normalization.
API signature omitted: AbelianArithmetic.bettiForm_pullback
  The form on A is the pullback of the universal Betti form in the chosen polarization type.
API signature omitted: AbelianArithmetic.bettiForm_closed
  dω=0 and ω has type (1,1).
API signature omitted: AbelianArithmetic.bettiForm_nonnegative
  ω is semipositive on each complex tangent space.
API signature omitted: AbelianArithmetic.bettiForm_scale
  For every N∈Z, [N]^*ω=N²ω.
Example omitted: AbelianArithmetic.bettiForm_elliptic
  For w=a+τb, the principal elliptic Betti form is 2 da∧db.
Example omitted: AbelianArithmetic.bettiForm_zero_multiplication
  [0]^*ω=0, while [−1]^*ω=ω.
Example omitted: AbelianArithmetic.bettiForm_single_fibre
  On a single fibre, with the source normalization, ω is twice the translation-invariant positive (1,1) form representing the principal polarization class.
Example omitted: AbelianArithmetic.bettiForm_nonprincipal_type
  For polarization type diag(1,2), in the corresponding period coordinates the two coordinate real two-tori have ω-periods 2 and 4; replacing D by the identity fails.
Source: [DGH: DGH], Lemmas 2.3–2.6, PDF pp.9–11
-/
/- Signature omitted: Pointwise kernel and rank identity
Needs differential forms and Betti differentials on the actual relative period bundle, with the regular-base and smooth-subvariety loci.

Mathematical target: At a smooth point x of a complex subvariety X, ker(ω|T_xX)=ker(db_U|T_xX), and the real rank of db_U is the rank of the restricted alternating form. Thus ω^dim_CX is nonzero exactly when rank_R db_U=2 dim_CX.
Source: [DGH: DGH], Equation(2.1) and Proposition 2.7, PDF pp.9–12
-/
/- Signature omitted: Non-degenerate subvarieties
Needs differential forms and Betti differentials on the actual relative period bundle, with the regular-base and smooth-subvariety loci.

Mathematical target: For a polarized abelian scheme A→S over an irreducible quasi-projective complex variety, an irreducible X⊂A is non-degenerate if there are a Betti neighborhood U⊂(S^sm)^an and x∈X^sm∩A_U with rank_R(db_U|X)_x=2 dim_C X. Equivalently the top restricted Betti form is nonzero somewhere on this regular-base locus. The dimension is total complex dimension, including base directions. For Qbar varieties use the fixed embedding into C. No condition is inferred for a subvariety entirely over the singular locus from a nonexistent manifold trivialization there.
API signature omitted: AbelianArithmetic.nonDegenerate_rank
  Non-degeneracy iff generic real Betti rank equals twice total complex dimension.
API signature omitted: AbelianArithmetic.nonDegenerate_form
  Non-degeneracy iff ω^dim_CX is nonzero on X^sm.
API signature omitted: AbelianArithmetic.nonDegenerate_smooth_point
  A non-degenerate X has a smooth nonvanishing point over a smooth point of π(X).
Example omitted: AbelianArithmetic.nonDegenerate_single_fibre
  Every irreducible subvariety of a single polarized abelian variety over a point is non-degenerate.
Example omitted: AbelianArithmetic.nonDegenerate_diagonal
  For an elliptic family E over a curve, Δ(E)⊂E×_S E has dim_C=2 and real Betti rank≤2, so is degenerate.
Example omitted: AbelianArithmetic.nonDegenerate_torsion
  A torsion section over a positive-dimensional base has locally constant Betti coordinates and is degenerate.
Source: [DGH: DGH], Definition 1.5 and DefinitionB.4, PDF pp.5,43
-/
/- Signature omitted: Betti-form criterion for maximal rank
Needs differential forms and Betti differentials on the actual relative period bundle, with the regular-base and smooth-subvariety loci.

Mathematical target: Let A → S be a principally polarized abelian scheme over a smooth irreducible complex quasi-projective variety, equipped with symplectic level-ℓ structure for some ℓ ≥ 3. Let X ⊆ A be irreducible of dimension d and Δ ⊆ S^an a nonempty open Betti domain meeting X^sm. Then the restricted top wedge ω^d is not identically zero on X^sm if and only if the maximum real rank of d(b_Δ|X^sm) on X^sm ∩ A_Δ equals 2d. On the universal family this is the same criterion with the universal form; the family statement is obtained by pullback.
Source: [DGH: DGH], Proposition 2.2(iii), Proposition 2.7 and equations(2.5)–(2.7), PDF pp.8,11–13
-/
/- Signature omitted: Non-vanishing of the top power of the Betti form on a non-degenerate subvariety
Needs differential forms and Betti differentials on the actual relative period bundle, with the regular-base and smooth-subvariety loci.

Mathematical target: Let X⊂A→S be non-degenerate in the regular-base sense of Definition B.4. Then there is z∈X^sm(C) over S^sm with (ω|_X)^(∧dim_C X)_z≠0. One may also choose π(z) in the regular locus of the reduced closure of π(X). The latter choice uses that X dominates this image and the maximal-rank locus meets its dense open preimage.
Source: [GGK: GGK], Proposition 5.2 proof, Step 1, equation(5.4), printed pp.212–213 (PDF pp.25–26)
-/

/-! B2: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Degeneracy over a curve
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: For an irreducible closed subvariety Y⊂A over a smooth irreducible complex curve S, a smooth point x∈Y^sm∩A_U is degenerate when it is not isolated in the local fibre of b_U restricted to Y^sm∩A_U. Y is curve-degenerate when these points contain a nonempty relatively open subset of this smooth locus. The vertical case is included in this definition; any curve-degenerate Y necessarily dominates S.
API signature omitted: AbelianArithmetic.curveDegenerate_point
  DegenerateAt(x) iff x is nonisolated in its local Betti fibre.
API signature omitted: AbelianArithmetic.curveDegenerate_open
  CurveDegenerate(Y) iff a nonempty open subset of Y consists of degenerate points.
API signature omitted: AbelianArithmetic.curveDegenerate_rank
  On the smooth generic constant-rank locus curve degeneracy is the failure of the total-dimension Betti rank criterion.
Example omitted: AbelianArithmetic.curveDegenerate_torsion
  A torsion section over a curve is curve-degenerate.
Example omitted: AbelianArithmetic.curveDegenerate_fibre
  A smooth subvariety contained in one fibre has isolated local Betti fibres and is not curve-degenerate.
Example omitted: AbelianArithmetic.curveDegenerate_full_family
  A constant abelian family over a curve is curve-degenerate, despite positive definite form on each individual fibre.
Source: [GH: GH], §5 definition and Lemma 6.2, PDF pp.18,31
-/
/- Signature omitted: Function-field trace and constant part
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: For K=C(S) and an abelian variety A/K, a C-trace is an abelian variety T/C with a K-homomorphism τ:T_K→A universal among maps from constant abelian varieties. In characteristic zero τ has finite kernel. Its image has a complementary abelian subvariety up to isogeny by imported Poincaré reducibility. Universal equivariant Hom, not all fibrewise Hom, detects this trace. Also construct the trace over Kbar/C for a chosen algebraic closure Kbar of K. The latter is the geometric trace used in Definition 1.2; it can grow after finite extension and is not identified with the K/C trace without an explicit descent argument.
API signature omitted: AbelianArithmetic.functionFieldTrace_map
  τ:T_K→A is the universal homomorphism from the constant trace.
API signature omitted: AbelianArithmetic.functionFieldTrace_universal
  For every B/C, Hom_C(B,T)→Hom_K(B_K,A), f↦τ∘f_K, is a bijection.
API signature omitted: AbelianArithmetic.functionFieldTrace_complement
  In characteristic zero there is an abelian complement B and a K-isogeny T_K×B→A.
Example omitted: AbelianArithmetic.functionFieldTrace_constant
  The C-trace of a constant B_K is B with identity map.
Example omitted: AbelianArithmetic.functionFieldTrace_zero
  The zero abelian variety has zero trace.
Example omitted: AbelianArithmetic.functionFieldTrace_nonconstant
  For a non-isotrivial elliptic variety over C(S), the trace is zero even though its complex fibres are nonzero elliptic curves.
Source: [GH: GH], Trace conventions; Lemma 5.6 and §5.4, PDF pp.2,25,28–29
-/
/- Signature omitted: Fixed homology and equivariant Hom
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: For an abelian scheme over a smooth irreducible complex algebraic curve, apply the fixed-part theorem to its polarized integral homology variation of weight −1 (equivalently the dual cohomology variation of weight +1). A nonzero integral homology class fixed by a finite-index monodromy subgroup yields a nonzero constant part over the corresponding connected finite étale cover. Use the equivariant Hodge-Hom comparison to algebraize the fixed substructure; unrestricted Hom of a single Hodge fibre is insufficient.
Source: [GH: GH], Lemma 5.6 proof, PDF p.25
-/
/- Signature omitted: Generically special subvarieties
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: For an irreducible closed Y⊂A dominating the smooth complex curve S, Y is GH generically special if its geometric generic fibre is a finite union of τ(Z_Kbar)+B+t, where τ is the Kbar/C geometric trace, Z is a closed irreducible subvariety of that constant trace over C, B is an abelian subvariety of A_Kbar and t is torsion. A Gao special-generically subvariety, used for degeneracy loci, instead uses a constant section and an abelian subgroup, not a general constant Z.
API signature omitted: AbelianArithmetic.genericallySpecial_components
  Each geometric generic irreducible component has the stated constant-variety plus torsion-coset description.
API signature omitted: AbelianArithmetic.genericallySpecial_constant
  A constant subvariety of a constant abelian family is generically special.
API signature omitted: AbelianArithmetic.genericallySpecial_torsion
  A torsion translate of an abelian subvariety is generically special.
Example omitted: AbelianArithmetic.genericallySpecial_constant_curve
  A constant genus≥2 curve in its constant Jacobian is GH generically special but is not itself a torsion coset.
Example omitted: AbelianArithmetic.genericallySpecial_torsion_point
  A torsion point of the geometric generic fibre gives a generically special torsion multisection after closure; its generic fibre is zero-dimensional, while its total dimension is one.
Example omitted: AbelianArithmetic.genericallySpecial_trace
  For a constant family with identity trace, every subvariety defined over C is supplied by the imported trace map.
Source: [GH: GH], Definition 1.2, PDF pp.2–3
-/
/- Signature omitted: Invariant definable sets of Ax-type
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: Let X ⊆ T^n be closed, definable and of Ax-type, and Γ ⊆ GL_n(ℤ) free on two generators with γ(X) = X for all γ ∈ Γ. Then either X lies in a finite union of proper closed subgroups of T^n, or there are a non-empty open U ⊆ X and a closed connected infinite subgroup G with U + G ⊆ X. Here definable means that the lift X̃=exp⁻¹(X)∩[0,1]^n is definable in the fixed o-minimal structure. Ax-type means that every continuous semialgebraic y:[0,1]→X̃, real analytic on (0,1), has exp(y([0,1])) contained in exp(y(0))+G⊆X for some closed subgroup G.
Source: [GH: GH], Ax-type definition and Lemma 5.2, PDF pp.18–20
-/
/- Signature omitted: Monodromy-invariant subvarieties of a fibre
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: Let A be a complex abelian variety and Γ ⊆ GL_{2g}(ℤ) act continuously on A^an via a Betti isomorphism, of monodromy type (every abelian subvariety is Γ-stable), containing a free subgroup of rank 2 and with no non-zero invariant vector in ℤ^{2g}. If Z ⊆ A is irreducible closed with Γ(Z(ℂ)) = Z(ℂ), then Z lies in a proper torsion coset, or Z + B = Z for some abelian subvariety B of positive dimension.
Source: [GH: GH], Proposition 5.3 and proof, PDF pp.21–22
-/
/- Signature omitted: Transport along nonisolated Betti fibres
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: Let A→S be an abelian scheme of relative dimension g≥1 over a smooth irreducible complex algebraic curve, and let Y⊂A be irreducible and closed. Glueing Betti maps along loops gives a homomorphism ρ̃ : π₁(S^an, s) → {homeomorphic group automorphisms of 𝒜_s^an} with ρ̃(h)_* = ρ(h), the monodromy on H₁(𝒜_s^an, ℤ). (i) If P ∈ Y^an over s is not isolated in its Betti fibre in Y, then ρ̃(h)(P) ∈ Y^an for all h, and if P has order N then dim_P Y ∩ 𝒜[N] ≥ 1. (ii) ρ̃ commutes with homomorphisms of abelian schemes.
Source: [GH: GH], Proposition 5.4 and proof, PDF pp.22–24
-/
/- Signature omitted: Free subgroups in curve monodromy
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: For an abelian scheme over a smooth irreducible complex algebraic curve, let Γ_s be its integral H₁ monodromy image and G_s its Zariski closure over Q. If G_s⁰ is nontrivial, every finite-index subgroup of Γ_s contains a free subgroup on two generators.
Source: [GH: GH], Lemma 5.5, PDF p.25
-/
/- Signature omitted: Invariant homology gives the function-field trace
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: For an abelian scheme A→S over a smooth irreducible complex algebraic curve, if H₁(A_s^an,Z) has a nonzero monodromy-invariant element, the C(S)/C-trace of its generic fibre is nonzero over C(S) itself.
Source: [GH: GH], Lemma 5.6, PDF p.25
-/
/- Signature omitted: Virtually invariant subvarieties in kernels
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: Let A→S be an abelian scheme of relative dimension g≥1 over a smooth irreducible complex algebraic curve. Let Y ⊆ 𝒜 be irreducible closed dominating S, virtually monodromy invariant (some component of Y_s is ρ̃-stable under a finite-index subgroup) above every point of an uncountable set of extendable points, and suppose the generic fibre of 𝒜 ×_S S′ has trivial trace for every finite étale S′ → S. Then there is a homomorphism 𝒜 → 𝒞 of abelian schemes over S whose kernel contains Y and has dimension dim Y. Here extendable means that every abelian subvariety of A_s is the fibre of an abelian subscheme, understood as the image of an endomorphism of A. All kernel dimensions in this assertion are total dimensions, including the base.
Source: [GH: GH], Extendability; Lemma 5.8 and proof, PDF pp.25–28
-/
/- Signature omitted: Curve degeneracy implies GH generic specialness
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: For an abelian scheme over a smooth irreducible complex algebraic curve S, an irreducible closed subvariety Y dominating S which is curve-degenerate is GH generically special.
Source: [GH: GH], Theorem 5.1 and §5.4 proof, PDF pp.18,28–30
-/
/- Signature omitted: Full-rank algebraic points outside generic specialness
Needs the trace, monodromy, polarized variation or definable-set interface specified in this target. The signatures must be added on those owner carriers with the stated hypotheses.

Mathematical target: Let F⊂C be algebraically closed, S/F a smooth irreducible curve, A→S an abelian scheme, and X⊂A an irreducible closed subvariety dominating S. If X is not GH generically special and Δ⊂S^an is any nonempty Betti neighborhood, there exists P∈X^sm(F) with π(P)∈Δ and P∈(X_{π(P)})^sm(F) such that rank_R d(b|X)_P=2 dim_C X.
Source: [GH: GH], §6 hypotheses and Lemma 6.2, PDF pp.30–31
-/

/-! B3: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Horizontal and vertical growth in mixed Ax–Schanuel
Needs the Kuga, weakly special closure, quotient and modular-map carriers supplied by LD.6 and the abelian-family interfaces. A free-standing dimension predicate would omit their content.

Mathematical target: Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the smallest Kuga subdatum containing pr_X⁺Z. Assume dim pr_X⁺Z>0. For the definable fundamental set F of §4.1 put Θ={p∈P(R):dim(p⁻¹B∩(F×M)∩Δ)=dim Z}. There are ε>0 and T_i→∞ such that for each i a connected semialgebraic block in Θ contains at least T_i^ε points of Γ of height at most T_i.
Source: [Gao–Ax: Gao–Ax], Theorem 4.1 setting and Theorem 5.2, PDF pp.14–19
-/
/- Signature omitted: Bigness of the rational stabilizer
Needs the Kuga, weakly special closure, quotient and modular-map carriers supplied by LD.6 and the abelian-family interfaces. A free-standing dimension predicate would omit their content.

Mathematical target: Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the smallest Kuga subdatum containing pr_X⁺Z. Put H=(Γ∩Stab_{P(R)⁺}(B))^{Zar,0}, with rational Zariski closure. Either dim B−dim Z≥dim(pr_X⁺Z)^biZar, or dim H>0.
Source: [Gao–Ax: Gao–Ax], Equation(5.1), Proposition 5.1 and proof, PDF pp.16,19–20
-/
/- Signature omitted: Normality and quotient induction
Needs the Kuga, weakly special closure, quotient and modular-map carriers supplied by LD.6 and the abelian-family interfaces. A free-standing dimension predicate would omit their content.

Mathematical target: Let M=Γ\X⁺ be a connected Kuga mixed Shimura variety with uniformization u, Δ=graph(u), and Z an irreducible analytic component of B∩Δ where B=Z^Zar. Replace the ambient datum (P,X⁺) by the smallest Kuga subdatum containing pr_X⁺Z. For the purpose of proving the dimension inequality one may replace (B,Z) by a very general pair in its Hilbert family, with no larger dimension defect and the same bi-algebraic closure, so that its rational stabilizer H is normal in P. The vector part V∩H is a G=P/V module and the reductive part acts trivially on V/(V∩H). Quotient by H and compare generic fibre dimensions to obtain the Ax–Schanuel inequality. Normality is not asserted for every original pair without this reduction.
Source: [Gao–Ax: Gao–Ax], Proposition 6.1, §§6–7, PDF pp.20–27
-/
/- Signature omitted: Finite weakly optimal quotient data
Needs the Kuga, weakly special closure, quotient and modular-map carriers supplied by LD.6 and the abelian-family interfaces. A free-standing dimension predicate would omit their content.

Mathematical target: For a fixed algebraic subvariety of a Kuga mixed Shimura variety, weakly optimal subvarieties have weakly special closures from a finite set of rational subdata and connected normal subgroups with semisimple reductive parts. Explicitly δ_ws(Z)=dim Z^biZar−dim Z, and Z⊂Y is weakly optimal if every larger irreducible closed Z′⊂Y has δ_ws(Z′)>δ_ws(Z). A finite list ((Q,Y⁺),N) suffices so that each Z^biZar=u(N(R)⁺y) for some y∈Y⁺. The points y need not come from a finite set.
Source: [Gao–Ax: Gao–Ax], Definition 8.1, Theorem 8.2 and §§8.1–8.3, PDF pp.27–32
-/
/- Signature omitted: Gao t-degeneracy loci
Needs the Kuga, weakly special closure, quotient and modular-map carriers supplied by LD.6 and the abelian-family interfaces. A free-standing dimension predicate would omit their content.

Mathematical target: For closed irreducible X in an abelian scheme A→S over an irreducible complex quasi-projective variety and t∈Z, define X^deg(t) as the union of positive-dimensional closed irreducible Y⊂X with dim⟨Y⟩_sg−dimπ(Y)<dimY+t. Here ⟨Y⟩_sg is the smallest special-generically closure inside A restricted to the reduced closure of π(Y): torsion plus constant section plus abelian subscheme after finite cover. X^deg(t) is a set before its Zariski closedness theorem.
API signature omitted: AbelianArithmetic.degeneracyLocus_member
  x∈X^deg(t) iff x lies on a positive-dimensional Y satisfying the strict dimension inequality.
API signature omitted: AbelianArithmetic.degeneracyLocus_mono
  For t≤u, X^deg(t)⊂X^deg(u).
API signature omitted: AbelianArithmetic.degeneracyLocus_zero
  Once closedness is proved, X minus X^deg(0) is a Zariski-open complement of algebraic degeneracy. It is not asserted to be exactly the pointwise full-Betti-rank locus.
Example omitted: AbelianArithmetic.degeneracyLocus_point
  For a zero-dimensional X all t-degeneracy loci are empty because no positive-dimensional Y exists.
Example omitted: AbelianArithmetic.degeneracyLocus_torsion_section
  A torsion section over a positive-dimensional base belongs to its 0-th degeneracy locus.
Example omitted: AbelianArithmetic.degeneracyLocus_strict
  If dim⟨Y⟩_sg−dimπY=dimY+t, that Y is excluded; replacing < with ≤ changes the definition.
Example omitted: AbelianArithmetic.degeneracyLocus_ramified_graph
  For a nonconstant branched map f:C→E from a smooth curve to an elliptic curve, its graph X⊂E×C has X^deg(0)=∅, while db|X vanishes at ramification points. Algebraic degeneracy does not equal the pointwise rank-drop set.
Source: [Gao–Betti: Gao–Betti], Definitions 1.5–1.6, PDF pp.4–5
-/
/- Signature omitted: Zariski closedness of degeneracy loci
Needs the Kuga, weakly special closure, quotient and modular-map carriers supplied by LD.6 and the abelian-family interfaces. A free-standing dimension predicate would omit their content.

Mathematical target: Let A → S be an abelian scheme over an irreducible complex quasi-projective variety, X ⊂ A closed and irreducible, and t any integer. Prove that the set X^deg(t) defined above is Zariski closed. The universal modular-image case uses finite normal quotient data and fibre-dimension loci. The passage to a general family must include exceptional and jumping modular fibres. A dense-open identity involving only the generic relative dimension is insufficient for this global assertion.
Source: [Gao–Betti: Gao–Betti], Theorem 7.1 and Lemma 9.1, PDF pp.16–18,22–23
-/
/- Signature omitted: Gao quotient criterion for Betti rank
Needs the Kuga, weakly special closure, quotient and modular-map carriers supplied by LD.6 and the abelian-family interfaces. A free-standing dimension predicate would omit their content.

Mathematical target: Let S be an irreducible complex algebraic variety and X⊂A→S a closed irreducible subvariety dominating S. After the indicated finite cover, translate the smallest torsion translate of an abelian subscheme containing X to obtain the group family A_X. For each integer l≥0, generic real Betti rank of X is <2l iff there is an abelian subscheme B⊂A_X with quotient p_B and its modular map ι/B such that dim((ι/B)∘p_B)(X)<l−dim(B/S).
Source: [Gao–Betti: Gao–Betti], Theorem 1.1, generic-rank criterion and §9.3, PDF pp.2,15–24
-/

/-! B4: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Non-degeneracy of a dominant fibre product
Needs fibre powers and their dominating irreducible components, modular maps, stabilizers and Betti differentials on the parent geometric carrier.

Mathematical target: For dominant irreducible X,Y⊂A→S with geometrically irreducible generic fibres, if X is non-degenerate then X×_S Y is non-degenerate in A×_S A. For general fibre products apply the assertion to each dominating component after the requisite finite cover.
Source: [Gao–Survey: Gao–Survey], Lemma 6.2 and proof, PDF p.15
-/
/- Signature omitted: The fibre-power dimension induction
Needs fibre powers and their dominating irreducible components, modular maps, stabilizers and Betti differentials on the parent geometric carrier.

Mathematical target: Let A→S be an abelian scheme over an irreducible complex quasi-projective variety, and X⊂A closed irreducible and dominant, with geometrically irreducible generic fibre, positive relative dimension, generating fibres and finite geometric generic stabilizer. For m≥1: (i) if m≥dim S and the modular map on X^[m] is generically finite, X^[m] has full total-dimension Betti rank; (ii) if m≥dim X and the modular map on D_m(X^[m+1]) is generically finite, that difference image has full total-dimension Betti rank. The exact dimension induction for both statements is the target.
Source: [Gao–Betti: Gao–Betti], Theorem 10.1(i)–(ii), AppendixB, PDF pp.26–29,33–35
-/
/- Signature omitted: Non-degeneracy of universal-curve difference images
Needs fibre powers and their dominating irreducible components, modular maps, stabilizers and Betti differentials on the parent geometric carrier.

Mathematical target: Let S be an irreducible variety over ℚ̄ with a quasi-finite morphism S → M_g, g ≥ 2, M ≥ 3g − 2 (Gao's theorem is stated over ℂ). Then D_M(C_S^{[M+1]}) ⊆ 𝔄_g^{[M]} ×_{A_g} S is non-degenerate.
Source: [DGH: DGH], Theorem 6.2 and proof, PDF pp.26–28
-/
/- Signature omitted: Non-degeneracy criterion for fibre powers
Needs fibre powers and their dominating irreducible components, modular maps, stabilizers and Betti differentials on the parent geometric carrier.

Mathematical target: Let A → S be an abelian scheme over an irreducible complex quasi-projective base and X ⊆ A an irreducible subvariety dominating S with (a) relative dimension ≥ 1, (b) X_s generating A_s for all s, (c) X_η of finite stabilizer. If m ≥ 1, m ≥ dim S and ι^{[m]}|_{X^{[m]}} (the moduli map to 𝔄_g^{[m]}) is generically finite, then X^{[m]} ⊆ A^{[m]} is non-degenerate. Work with a geometrically irreducible generic fibre, or select a dominating component after the quasi-finite étale cover in survey footnote 6; the whole reducible fibre product is not called irreducible.
Source: [Gao–Survey: Gao–Survey], Theorem 6.5(i) and footnote 6, PDF pp.16–17
-/
/- Signature omitted: Non-degeneracy is preserved by the difference construction
Needs fibre powers and their dominating irreducible components, modular maps, stabilizers and Betti differentials on the parent geometric carrier.

Mathematical target: If X^{[m]}_{S′} is non-degenerate, then so is D(X^{[m(M+2)]}_{S′}) = X^{[m]}_{S′} ×_{S′} D₀((X^{[m]}_{S′})^{[M+1]}) ⊆ A^{[m(M+1)]}_{S′}. For arbitrary abelian families the group-valued difference is the native group-law specialization; the curve case uses the imported Jacobian map. Choose the dominating irreducible components when needed.
Source: [Gao–Survey: Gao–Survey], Lemma 6.2 and §8.3 Step 1, PDF pp.15,22
-/

/-! F0: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Compact preimages and exact lattice limits
Needs the parent abelian-variety realization and arithmetic characteristic-polynomial interfaces, including the Galois modules and polarized-moduli finiteness hypotheses.

Mathematical target: Let L be a finite free Z_ℓ-lattice and u_j∈End_Zℓ(L) converge to u, with the compact images L_j=u_j(L) forming a decreasing sequence. Then u(L)=⋂_j L_j. In Tate Proposition 1, after passing to infinitely many isomorphic fixed-polarization models, L=X_n, L_j=X_j=(T∩W)+ℓ^jT along a cofinal subsequence, and u belongs to the closed finite-dimensional algebra E_ℓ. Finiteness of the models is a separate hypothesis, established over finite fields using polarized moduli.
Source: [Tate: Tate], Hyp(k,A,d,ℓ) and Proposition 1 proof, printed pp.136–137 (PDF pp.3–4)
-/
/- Signature omitted: Tate at a split Frobenius prime
Needs the parent abelian-variety realization and arithmetic characteristic-polynomial interfaces, including the Galois modules and polarized-moduli finiteness hypotheses.

Mathematical target: For abelian varieties over a finite field k of characteristic p and a prime ℓ≠p splitting the étale algebra Q[π] generated by Frobenius, Tate Proposition 2 identifies End_k(A)⊗Q_ℓ with the Frobenius commutant. Its dimension is ∑_P m_P² deg P and is independent of ℓ. Off-diagonal blocks give Hom_k(A,B)⊗Q_ℓ; the integral inclusion has torsion-free cokernel. These are k-rational Hom spaces, not unrestricted geometric Hom.
Source: [Tate: Tate], Lemmas 1–4, Proposition 2 and equations(4)–(5), printed pp.135–139 (PDF pp.2–6)
-/
/- Signature omitted: Frobenius polynomial and reciprocity
Needs the parent abelian-variety realization and arithmetic characteristic-polynomial interfaces, including the Galois modules and polarized-moduli finiteness hypotheses.

Mathematical target: For A/F_q of dimension g, P_A(X)=det(X−Frob_q|V_ℓA) is a monic polynomial in Z[X] of degree 2g, independent of ℓ, with all complex roots of absolute value √q and coefficients satisfying a_(2g−i)=q^(g−i)a_i for 0≤i≤g. Coefficients a_i are indexed in descending powers: P_A=∑_(i=0)^(2g) a_i X^(2g−i), with a_0=1 and a_(2g)=q^g.
API signature omitted: AbelianArithmetic.frobeniusPolynomial_integral
  P_A∈Z[X] is independent of ℓ≠p and has degree 2 dim A.
API signature omitted: AbelianArithmetic.frobeniusPolynomial_reciprocal
  Writing P_A=∑a_i X^(2g−i), a_(2g−i)=q^(g−i)a_i for 0≤i≤g, a_0=1 and a_(2g)=q^g.
API signature omitted: AbelianArithmetic.frobeniusPolynomial_product
  P_(A×B)=P_A P_B.
API signature omitted: AbelianArithmetic.frobeniusPolynomial_points
  #A(F_(q^r))=det(1−π^r) on V_ℓA.
Example omitted: AbelianArithmetic.frobeniusPolynomial_zero
  For the zero-dimensional abelian variety P_A=1 and the point count is 1.
Example omitted: AbelianArithmetic.frobeniusPolynomial_elliptic
  For an elliptic curve, P_A=X²−tX+q and #A(F_q)=q+1−t.
Example omitted: AbelianArithmetic.frobeniusPolynomial_native
  For ℓ≠p its image in Q_ℓ[X] is the imported characteristic polynomial of the Frobenius action on V_ℓA.
Source: [Waterhouse: Waterhouse], Chapter 2 opening, printed pp.526–528 (PDF pp.7–9)
-/
/- Signature omitted: Weil q-numbers
Needs the parent abelian-variety realization and arithmetic characteristic-polynomial interfaces, including the Galois modules and polarized-moduli finiteness hypotheses.

Mathematical target: For q=p^a with p prime and a≥1, a Weil q-number is an algebraic integer π whose image under every complex embedding of Q(π) has absolute value sqrt(q). Classification uses conjugacy classes of these numbers, not arbitrary reciprocal polynomials of degree 2g. Use the weight-one predicate of DWP.0 together with IsIntegral ℤ; the three interfaces below are its integral finite-field specializations, rather than a second purity predicate.
API signature omitted: AbelianArithmetic.weilQNumber_norm
  For every embedding σ:Q(π)→C, |σπ|²=q.
API signature omitted: AbelianArithmetic.weilQNumber_conjugate
  Algebraic conjugates of a Weil q-number are Weil q-numbers.
API signature omitted: AbelianArithmetic.weilQNumber_power
  π^r is a Weil q^r-number for r≥1.
Example omitted: AbelianArithmetic.weilQNumber_real
  ±sqrt(p) are Weil p-numbers and have minimal polynomial X²−p.
Example omitted: AbelianArithmetic.weilQNumber_one
  For q>1 the algebraic integer 1 is not a Weil q-number.
Example omitted: AbelianArithmetic.weilQNumber_frobenius
  Every Frobenius eigenvalue of the imported characteristic polynomial of A/F_q is a Weil q-number.
Source: [Waterhouse: Waterhouse], Chapter 2, printed pp.527–528 (PDF pp.8–9)
-/
/- Signature omitted: Tate full faithfulness over finite fields
Needs the parent abelian-variety realization and arithmetic characteristic-polynomial interfaces, including the Galois modules and polarized-moduli finiteness hypotheses.

Mathematical target: For A,B/F_q and ℓ≠p, Hom_Fq(A,B)⊗Z_ℓ→Hom_Gal(T_ℓA,T_ℓB) is an isomorphism; rationalizing gives the analogous Q_ℓ statement.
Source: [Tate: Tate], Main Theorem; Lemmas 1–3; conclusion of §2, printed pp.134–135,138–139 (PDF pp.1–2,5–6)
-/
/- Signature omitted: Tate’s isotropic image lemma
Needs the parent abelian-variety realization and arithmetic characteristic-polynomial interfaces, including the Galois modules and polarized-moduli finiteness hypotheses.

Mathematical target: Let A/k have a k-polarization θ of degree d², let ℓ≠char(k), and assume Tate’s Hyp(k,A,d,ℓ): only finitely many k-isomorphism classes B admitting a degree-d² k-polarization and an ℓ-power isogeny B→A. Every Galois-stable maximal isotropic Q_ℓ-subspace W⊆V_ℓ(A) for θ is the image of some u∈End_k(A)⊗Q_ℓ.
Source: [Tate: Tate], Proposition 1 and proof, printed pp.136–137 (PDF pp.3–4)
-/
/- Signature omitted: Point counts are isogeny invariant
Needs the parent abelian-variety realization and arithmetic characteristic-polynomial interfaces, including the Galois modules and polarized-moduli finiteness hypotheses.

Mathematical target: For A/F_q, #A(F_(q^r))=det(1−Frob_q^r|V_ℓA), so point counts are invariant under F_q-isogeny and multiply on products.
Source: [Tate: Tate], Theorem 1(c), printed p.139 (PDF p.6), with the determinant calculation from the parent characteristic-polynomial API
-/

/-! F1: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Degree from Dieudonné cokernel length
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: For an isogeny f:A→B of abelian varieties over a perfect field k of characteristic p>0, the contravariant map C(f):C(B)→C(A) is injective and length_W coker C(f)=v_p(deg f). For an endomorphism its determinant valuation gives the same value.
Source: [Milne: Milne], §1, printed pp.64–66 (PDF pp.2–4), scanned page images
-/
/- Signature omitted: Characteristic polynomial on the p-realization
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: For an abelian variety A over a perfect field k of characteristic p>0 and every u∈End_k(A), the W(k)-linear map C(u) on its contravariant Dieudonné module has characteristic polynomial in Z_p[X] equal to the image of the imported integer characteristic polynomial of u. No semisimplicity of arbitrary u is assumed.
Source: [Milne: Milne], §1, printed pp.65–66 (PDF pp.3–4), scanned page images
-/
/- Signature omitted: Rational and integral p-Tate comparison
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: For A,B/F_q, Hom(A,B)⊗Q_p≃Hom_(F,V)(C(B)[1/p],C(A)[1/p]); the integral map is an isomorphism onto the F,V-compatible integral morphisms after its injectivity and p-saturation are proved.
Source: [WM: WM], PartI Theorems 5–6 and PartII Theorem 1 proof, printed pp.56–57,60–61 (PDF pp.4–5,8–9), scans
-/
/- Signature omitted: Algebra acting on a Frobenius polynomial block
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: Let L/Q_p be unramified of degree a≥1 with arithmetic Frobenius σ, and let m∈Q_p[X] be monic irreducible with m(0)≠0. Put K=Q_p[X]/m and θ=X mod m. On ⊕_(0≤j<a)(L⊗Qp K)U^j define multiplication by U b=(σ⊗1)(b)U and U^a=θ. This defines a K-algebra B of dimension a². If a semilinear bijection F on an L-vector space V satisfies m(F^a)=0, the actions of L, θ↦F^a and U↦F define a B-module structure on V. The coefficient tensor L⊗Q_p K may be étale with several factors; preserve the σ action on all factors.
API signature omitted: AbelianArithmetic.frobeniusBlock_relation
  U c=σ(c)U and U^a=θ on L⊗_(Q_p)K; θ is the chosen q-Frobenius root.
API signature omitted: AbelianArithmetic.frobeniusBlock_dimension
  The algebra has K-dimension a² after the coefficient étale algebra is handled correctly.
API signature omitted: AbelianArithmetic.frobeniusBlock_action
  On the corresponding isocrystal block, the semilinear F gives an action of this cyclic algebra.
Example omitted: AbelianArithmetic.frobeniusBlock_prime
  For a=1 the block algebra is K, with U=θ.
Example omitted: AbelianArithmetic.frobeniusBlock_split
  After a splitting base extension it is a full a×a matrix algebra, with weighted cyclic U and diagonal coefficient action.
Example omitted: AbelianArithmetic.frobeniusBlock_product_coeff
  If L⊗Q_p K is a product, the construction retains every idempotent and its σ-permutation; it is not replaced by one arbitrarily selected coefficient field.
Source: [WM: WM], PartII proofs, printed pp.60–61 (PDF pp.8–9), scans
-/
/- Signature omitted: Integral Tate full faithfulness at the characteristic prime
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: For abelian varieties A,B/F_q, let C(A),C(B) be the contravariant Dieudonné modules of their p-divisible groups over W(F_q), with their F,V actions. The natural map Hom_Fq(A,B)⊗Z_p→Hom_{W(F_q),F,V}(C(B),C(A)) is an isomorphism.
Source: [WM: WM], PartI saturation and PartII Theorem 1, printed pp.56–57,60–61 (PDF pp.4–5,8–9), scans
-/
/- Signature omitted: Rational p-Tate comparison
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: For A,B/F_(p^a), Hom_k(A,B)⊗Q_p→Hom_(L,F)(C(B)[1/p],C(A)[1/p]) is an isomorphism of Q_p-vector spaces. For A=B it identifies End⁰_k(A)^op⊗Q_p with the equivariant endomorphism algebra.
Source: [WM: WM], PartII Theorem 1 proof, printed pp.60–61 (PDF pp.8–9), scans
-/
/- Signature omitted: Saturated injection on integral p-realization Hom groups
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: For A,B/F_(p^a), the natural map j:Hom_k(A,B)⊗Z_p→Hom_(W,F,V)(C(B),C(A)) is injective with p-saturated image. This statement does not assume rational p-Tate or equality of ranks.
Source: [WM: WM], PartI Theorems 3/5 and opening proof of Theorem 6, printed pp.55–57 (PDF pp.3–5), scans
-/
/- Signature omitted: Semisimplicity of the linear q-Frobenius realization
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: For A/F_(p^a), C(π_A)=F^a is an L-linear semisimple endomorphism of C(A)[1/p], where π_A is the q-power Frobenius. Its characteristic polynomial is P_A. No semisimplicity claim for arbitrary endomorphisms is included.
Source: [Milne: Milne], §1, printed p.66 (PDF p.4), scan
-/
/- Signature omitted: Central simplicity of a Frobenius block algebra
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: The algebra B in the Frobenius block construction above is central simple over K. For an algebraic closure Ω/K, B⊗K Ω≅M_a(Ω). In particular the conclusion includes the cases where L⊗Qp K is a product of fields.
Source: [WM: WM], PartII Theorem 2 proof, printed p.61 (PDF p.9), scan
-/
/- Signature omitted: Dimension of the semilinear Frobenius commutant
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: For A/F_(p^a), factor P_A=∏m_i^(e_i) over Q_p into distinct monic irreducibles of degrees d_i. For V=C(A)[1/p] and R=L[F,F^(-1)], dim_Qp End_R(V)=Σ_i d_i e_i².
Source: [WM: WM], PartII Theorem 1 proof, printed pp.60–61 (PDF pp.8–9), scans
-/
/- Signature omitted: Characteristic-prime invariant of a simple endomorphism algebra
Needs the actual contravariant Dieudonné/semilinear realization from R07.2 and the parent finite-field Hom carrier, together with the stated cyclic and local-invariant conventions.

Mathematical target: Let A/F_(p^a) be simple, with Frobenius π and center Q(π) of E=End⁰_k(A). For v|p put K=Q(π)_v, e_v=ord_v(p) and f_v its residue degree, with ord_v a uniformizer-normalized valuation. Then inv_v(E)=f_v ord_v(π)/a=[K:Q_p]ord_v(π)/ord_v(p^a) in Q/Z.
Source: [WM: WM], PartII Theorem 2 and proof, printed pp.60–61 (PDF pp.8–9), scans
-/

/-! F3: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Prime-to-p and p lattice spaces
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: Fix A₀/F_q. X^p is the restricted product of Frobenius-stable full Z_ℓ-lattices in V_ℓ(A₀), equal to T_ℓ(A₀) almost everywhere. X_p consists of full W(F_q)-lattices in C(A₀)[1/p] stable under F and V, where C is the contravariant Dieudonné functor. For Γ=End⁰_Fq(A₀)^× use the left action α·(Λ_p,(Λ_ℓ))=(C(α)⁻¹Λ_p,(α_ℓΛ_ℓ)).
API signature omitted: AbelianArithmetic.markedLattice_primeToP
  For each ℓ≠p choose a Frobenius-stable full Z_ℓ-lattice in V_ℓA equal to T_ℓA at all but finitely many ℓ.
API signature omitted: AbelianArithmetic.markedLattice_p
  At p choose a full F,V-stable W(F_q)-lattice in the contravariant isocrystal C(A₀)[1/p].
API signature omitted: AbelianArithmetic.markedLattice_action
  The left action of Γ is α_ℓ at ℓ≠p and C(α)⁻¹ at p. Contravariance reverses composition; taking inverses restores the left action.
Example omitted: AbelianArithmetic.markedLattice_identity
  The identity marking gives exactly T_ℓ(A₀) at ℓ≠p and C(A₀) at p.
Example omitted: AbelianArithmetic.markedLattice_zero
  The zero-dimensional abelian variety has one lattice tuple.
Example omitted: AbelianArithmetic.markedLattice_support
  A tuple differing from the standard lattice at infinitely many primes is excluded from the finite-support space.
Source: [Waterhouse: Waterhouse], §1.2 and §3.1, printed pp.525,530–531 (PDF pp.6,11–12)
-/
/- Signature omitted: Honda–Tate simple isogeny classification
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: Simple F_q-isogeny classes correspond to conjugacy classes of q-Weil algebraic integers π. The dimension is determined by 2 dim A=[Q(π):Q] sqrt([End⁰(A):Q(π)]), with the division-algebra local invariants prescribed by π.
Source: [Waterhouse: Waterhouse], Chapter 2, printed pp.526–528 (PDF pp.7–9)
-/
/- Signature omitted: Frobenius polynomial determines the isogeny class
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: Two abelian varieties over F_q are F_q-isogenous exactly when their Frobenius characteristic polynomials agree.
Source: [Tate: Tate], Theorem 1(c), printed p.139 (PDF p.6)
-/
/- Signature omitted: Commutative endomorphisms in the nonreal prime-field case
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: If A/F_p is simple and Q(Frob) has no real embedding, End⁰_Fp(A)=Q(Frob) is a CM field.
Source: [Waterhouse: Waterhouse], Chapter 2, printed pp.527–528 (PDF pp.8–9)
-/
/- Signature omitted: Realization of nonreal prime-field orders
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: In the preceding simple F_p-isogeny class, every order R in Q(Frob) containing Frob and p/Frob occurs as End_Fp(A′) for some A′ in that class.
Source: [Waterhouse: Waterhouse], Theorem 6.1 and proof, printed pp.550–551 (PDF pp.31–32)
-/
/- Signature omitted: Marked quasi-isogenies classified by lattices
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: Isomorphism classes of pairs (B,f:B→A₀ a rational quasi-isogeny over F_q), with (B,f)≅(B′,f′) when f′u=f for an F_q-isomorphism u:B→B′, correspond to X_p×X^p by Λ_ℓ=f_ℓ(T_ℓB) and Λ_p=C(f)⁻¹(C(B)). This bijection is equivariant for postcomposition on f and the action specified in the prime-to-p and p lattice spaces above.
Source: [Waterhouse: Waterhouse], §1.2 and §3.1, printed pp.525,530–531 (PDF pp.6,11–12)
-/
/- Signature omitted: Isomorphism classes as rational orbits
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: The underlying F_q-isomorphism classes in the isogeny class of A₀ are End⁰(A₀)^×\(X_p×X^p).
Source: [Waterhouse: Waterhouse], §3.1, printed pp.530–532 (PDF pp.11–13)
-/
/- Signature omitted: Prime-field p-realization Frobenius polynomial
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: For A/F_p the linear Frobenius F on C(A)⊗Q_p, and hence its transpose on D^lin(A), is semisimple and has characteristic polynomial equal to the intrinsic degree-2dim(A) Frobenius polynomial P_A(T)∈Z[T] occurring on every V_ℓ(A), ℓ≠p.
Source: [WM: WM], PartII, printed pp.60–61 (PDF pp.8–9), scans
-/
/- Signature omitted: Finite-support lattice tuples are realized over the prime field
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: Fix A₀/F_p. Let M_ℓ be full π-stable Z_ℓ-lattices in V_ℓ(A₀) for ℓ≠p and M_p a full F,V-stable Z_p-lattice in D^lin(A₀), equal to the reference realization lattices T₀,ℓ at all but finitely many primes. There exist B/F_p and a rational quasi-isogeny f:B→A₀ with transported realization lattices f_ℓ(T_ℓB)=M_ℓ, including D^lin at p.
Source: [Waterhouse: Waterhouse], §3.1 and Theorem 6.1 proof, printed pp.530–531,550–551 (PDF pp.11–12,31–32)
-/
/- Signature omitted: Prime-field marked and unmarked classification
Needs finite-field abelian varieties, Weil-number embeddings, the genuine realization lattices and finite flat quotients from the named owners.

Mathematical target: For A₀/F_p, the transport map is a bijection from isomorphism classes of marked pairs (B,f:B→A₀ a rational quasi-isogeny) to the finite-support lattice tuples of the finite-support prime-field realization theorem above. Here (B,f)≅(B′,f′) means an F_p-isomorphism u:B→B′ with f′u=f. Under this bijection Γ=End⁰_Fp(A₀)^× acts by postcomposition, and Γ-orbits are precisely underlying F_p-isomorphism classes in the isogeny class of A₀.
Source: [Waterhouse: Waterhouse], §3.1 and Theorem 6.1, printed pp.530–532,550–551 (PDF pp.11–13,31–32)
-/

/-! F4: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Adelic class set of the endomorphism group
Needs the unit algebraic group, restricted-product lattice action, integral orders and level double quotients from AA and GN.2 on the genuine realization space.

Mathematical target: For G=(End⁰(A₀))^× and an adelic lattice L, the global orbits inside its G(A_fin)-orbit are G(Q)\G(A_fin)/Stab(L).
API signature omitted: AbelianArithmetic.adelicClassSet_mk
  A finite adele in E^×(A_f) determines its double coset modulo left E^×(Q) and right K.
API signature omitted: AbelianArithmetic.adelicClassSet_equiv
  g,h have the same class iff h=e g k for e∈E^×(Q),k∈K.
API signature omitted: AbelianArithmetic.adelicClassSet_stabilizer
  K is the restricted product of the automorphism groups of the chosen local lattices, including the p-component.
Example omitted: AbelianArithmetic.adelicClassSet_rational
  Any rational unit e∈E^×(Q) has the identity class.
Example omitted: AbelianArithmetic.adelicClassSet_compact
  Changing a local lattice by conjugation replaces K by its conjugate and induces the corresponding class-set bijection.
Example omitted: AbelianArithmetic.adelicClassSet_notPic
  For a nonmaximal order R the entire full-lattice class monoid can include nonprojective lattices and need not be Pic(R). A single fixed local genus may have its own double-coset class set; in the commutative genus of R itself this is Pic(R).
Source: [LT: LT], §3 and §3.2(15), v1 pp.6,11
-/
/- Signature omitted: Finite-support adelic stabilizers in a prime-field isogeny class
Needs the unit algebraic group, restricted-product lattice action, integral orders and level double quotients from AA and GN.2 on the genuine realization space.

Mathematical target: For A₀/F_p and the prime-field lattice space X, use Tate full faithfulness at all primes to identify G(Q_ℓ), G the Q-algebraic unit group of End⁰_Fp(A₀), with the linear Frobenius centralizer. If λ₁,…,λ_m are all Frobenius root occurrences, let D_*=|∏_{i,j:λ_i≠λ_j}(λ_i−λ_j)|, a positive integer; equal values are omitted and unequal values retain their occurrence multiplicities. There is a compact open K₀=∏H₀,ℓ of G(A_f) such that every M∈X has Stab(M)=∏S_M,ℓ contained in a conjugate K_M=a_M K₀a_M^(−1), with a_M∈G(A_f) supported at finitely many places, S_M,ℓ=H_M,ℓ almost everywhere, and [K_M:Stab(M)]≤D_*. Moreover #G(A_f)\X≤D_*².
Source: [LT: LT], §§3.1–3.2.1, v1 pp.7–14; local orbit/stabilizer adaptation
-/
/- Signature omitted: The prime-field p-component reduction
Needs the unit algebraic group, restricted-product lattice action, integral orders and level double quotients from AA and GN.2 on the genuine realization space.

Mathematical target: For A₀/F_p, F is Q_p-linear and V=pF^(−1); hence the simultaneous centralizer of F,V is the centralizer of F, and its orbits on F,V-stable lattices form a subset of its orbits on F-stable lattices.
Source: [LT: LT], Remark 3.2, v1 p.11
-/
/- Signature omitted: Class-set comparison by reduced norms
Needs the unit algebraic group, restricted-product lattice action, integral orders and level double quotients from AA and GN.2 on the genuine realization space.

Mathematical target: Let K₀=Q(√p), D₀/K₀ the quaternion algebra ramified at both real places and split at every finite place, and d≥2. With maximal finite compact U₀,d=∏_v GL_(2d)(O_(K₀,v)), reduced norm identifies GL_d(D₀)(K₀)\GL_d(D₀)(A_(K₀,fin))/U₀,d with the narrow ideal class group Cl⁺(K₀). For each CM field K_i, determinant identifies GL_(n_i)(K_i)\GL_(n_i)(A_(K_i,fin))/GL_(n_i)(Ohat_(K_i)) with Cl(K_i). Their product gives the mixed class set. The d=1 quaternion factor remains its own class set; d=0 omits it.
Source: [LT: LT], §3.2.2(21), v1 p.14, maximal-compact and narrow-class conventions
-/
/- Signature omitted: Discriminant and ordered-root bounds
Needs the unit algebraic group, restricted-product lattice action, integral orders and level double quotients from AA and GN.2 on the genuine realization space.

Mathematical target: If K=Q(π), π is an integral p-Weil number of degree d, then |D_K|≤|disc minpoly(π)|≤(2√p)^(d(d−1)). More generally, for a monic integral polynomial of degree m all of whose root occurrences λ_i have modulus √p, the positive integer D_*=|∏_{i,j:λ_i≠λ_j}(λ_i−λ_j)| satisfies D_*≤(2√p)^{m(m−1)}. Unequal root values retain occurrence multiplicities; the ordinary discriminant may vanish.
Source: [Lee: Lee], §2.1 and §3.1–3.2, PDF pp.3,5–6, especially equation(11)
-/
/- Signature omitted: Conditional rational-orbit bound from local lattices
Needs the unit algebraic group, restricted-product lattice action, integral orders and level double quotients from AA and GN.2 on the genuine realization space.

Mathematical target: Let a group G_f with subgroup Γ act on a lattice space X, with at most D_*² G_f-orbits. Suppose h=#(Γ\G_f/K₀)<∞ for a fixed compact level K₀. For every orbit representative M assume Stab(M)=∏S_{M,ℓ}, contained in K_M=∏H_{M,ℓ}=a_M K₀ a_M⁻¹ with a_M∈G_f, equality S_{M,ℓ}=H_{M,ℓ} away from finitely many primes, and ∏[H_{M,ℓ}:S_{M,ℓ}]≤D_*. Then Γ\X is finite and #Γ\X≤D_*³h. If the relevant Weil-lattice tuple satisfies these assumptions and D_*≤(2√p)^{m(m−1)}, the resulting conditional bound is #Γ\X≤(2√p)^{3m(m−1)}h.
Source: [LT: LT], §3.2(15),(20)–(21),(28), v1 pp.11,14,16; coarse orbit-count adaptation
-/
/- Signature omitted: Coarse prime-field isomorphism count at fixed adelic level
Needs the unit algebraic group, restricted-product lattice action, integral orders and level double quotients from AA and GN.2 on the genuine realization space.

Mathematical target: For A₀/F_p of dimension g>0, put m=2g, take D_* and K₀ from the finite-support adelic stabilizer theorem above, and suppose h=#(G(Q)\G(A_f)/K₀) is finite. Then the number of F_p-isomorphism classes in the isogeny class of A₀ is at most D_*³h≤(2√p)^{3m(m−1)}h. Class-set finiteness is imported from AA.3 with its exact group hypotheses; no numerical bound on h is included.
Source: [Lee: Lee], §3.1(5)–(10), PDF pp.4–5; coarse orbit-count adaptation
-/

/-! F5: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Lang surjectivity for an abelian variety
Needs the line-bundle, Rosati, principal-polarization or arithmetic norm/mass carrier in this target; a count variable by itself does not state its arithmetic hypotheses.

Mathematical target: For B/F_q, the morphism Frob_q−1 on B is an étale surjective isogeny, hence H¹(F_q,B)=0 for the actual Galois torsor cohomology.
Source: [Conrad: Conrad], Theorem 2.6 proof, PDF p.8; explicit abelian specialization of Lang
-/
/- Signature omitted: Line-bundle realization over a finite field
Needs the line-bundle, Rosati, principal-polarization or arithmetic norm/mass carrier in this target; a count variable by itself does not state its arithmetic hypotheses.

Mathematical target: For A over a finite field, every symmetric isogeny A→A∨ is φ_L for some line bundle over that field.
Source: [Conrad: Conrad], Lemma 2.3 and Theorem 2.6, PDF pp.6–8
-/
/- Signature omitted: Units that are norms modulo norms of units (Lemmermeyer)
Needs the line-bundle, Rosati, principal-polarization or arithmetic norm/mass carrier in this target; a count variable by itself does not state its arithmetic hypotheses.

Mathematical target: Let L/K be a cyclic extension of number fields of prime degree. There is an exact sequence 1 → Am_st(L/K) → Am(L/K) → (E_K ∩ N_(L/K)L^×)/N_(L/K)E_L → 1, where Am(L/K) ⊂ Cl(L) is the group of ambiguous ideal classes and Am_st(L/K) its subgroup of strongly ambiguous classes. In particular (E_K ∩ N L^×)/N E_L is a subquotient of Cl(L) and its order is at most h(L).
Source: [Lemmermeyer: Lemmermeyer], Proposition 1 and proof, PDF pp.1–3
-/
/- Signature omitted: Squarefree nonreal polarization bound
Needs the line-bundle, Rosati, principal-polarization or arithmetic norm/mass carrier in this target; a count variable by itself does not state its arithmetic hypotheses.

Mathematical target: For A/F_p of dimension g, with no repeated simple F_p-isogeny factor and Frobenius polynomial coprime to X²−p, let n_A be the number of F_p-isomorphism classes of principal polarizations on A. There are absolute positive constants C₀,C with n_A≤C₀p^(Cg²). If A admits no principal polarization set n_A=0.
Source: [LT: LT], Proposition 4.11, Example 4.13 and Proposition 4.16, v1 pp.20–23
-/
/- Signature omitted: Density of primes splitting in a class-number-one CM field
Needs the line-bundle, Rosati, principal-polarization or arithmetic norm/mass carrier in this target; a count variable by itself does not state its arithmetic hypotheses.

Mathematical target: For the nine fields Q(√−d), d∈{1,2,3,7,11,19,43,67,163}, each of class number one, the defining square classes are independent in Q×/(Q×)². Outside the finite ramified-prime set, the rational primes splitting in at least one field have natural density 1−2^(−9).
Source: [LT: LT], Lemma 5.11, v1 p.33
-/
/- Signature omitted: Elliptic curve with class-number-one endomorphisms
Needs the line-bundle, Rosati, principal-polarization or arithmetic norm/mass carrier in this target; a count variable by itself does not state its arithmetic hypotheses.

Mathematical target: If a prime p splits in an imaginary quadratic class-number-one field L, there exists E/F_p with End_Fp(E)=O_L, obtained from a norm-p algebraic integer and Waterhouse order realization.
Source: [Waterhouse: Waterhouse], Chapter 2, Porism 4.3 and Theorem 6.1, printed pp.527–528,540,550–551
-/
/- Signature omitted: Elliptic point groups in odd characteristic
Needs the line-bundle, Rosati, principal-polarization or arithmetic norm/mass carrier in this target; a count variable by itself does not state its arithmetic hypotheses.

Mathematical target: Let p be an odd prime and E/F_p an elliptic curve. Then E(F_p) and E(F_(p²)) are not both p-groups. For p = 2 the statement is false exactly for the curves with trace a = ±1, for example y²+xy = x³+x²+1 (a = 1), with #E(F_2) = 2 and #E(F_4) = 8.
Source: [LT: LT], Lemma 5.19, v1 p.36, with the odd-characteristic restriction
-/
/- Signature omitted: Principal polarizations on CM elliptic powers
Needs the line-bundle, Rosati, principal-polarization or arithmetic norm/mass carrier in this target; a count variable by itself does not state its arithmetic hypotheses.

Mathematical target: Fix a prime p splitting in one of the imaginary quadratic fields K = Q(√−d) with d ∈ {1,2,3,7,11,19,43,67,163}. Construct E/F_p with End_Fp(E) = O_K. If N_p(g) counts F_p-isomorphism classes of principal polarizations on E^g, prove log N_p(g) = (1/2)g² log g + O_p(g²). The count is unweighted and uses the Hermitian orbit dictionary and its mass comparison.
Source: [LT: LT], §§5.3–5.5, equations(39),(51)–(56), v1 pp.26–33
-/

/-! F6: signatures requiring the preceding owner interfaces. -/

/- Signature omitted: Counting Weil polynomials by power sums
Needs the genuine Weil-polynomial/isogeny/isomorphism or principal-polarization counting carrier and the uniform quantitative hypotheses specified in the README.

Mathematical target: For q≥2 and g≥1, the number of monic q-reciprocal integer polynomials (q^gP(X)=X^(2g)P(q/X)) of degree 2g with constant q^g and all roots of absolute value √q is at most (4g+1)^g q^(g(g+1)/4).
Source: [LT: LT], Lemma 2.1 and proof, v1 p.5, power-sum counting adaptation
-/
/- Signature omitted: Asymptotic count of isogeny classes
Needs the genuine Weil-polynomial/isogeny/isomorphism or principal-polarization counting carrier and the uniform quantitative hypotheses specified in the README.

Mathematical target: For fixed q, the number of dimension-g F_q-isogeny classes is at most exp((log q)g²/4+O_q(g log g)).
Source: [LT: LT], Corollary 2.2, v1 p.5, using the power-sum count
-/
/- Signature omitted: DiPippo–Howe lower bound for isogeny classes
Needs the genuine Weil-polynomial/isogeny/isomorphism or principal-polarization counting carrier and the uniform quantitative hypotheses specified in the README.

Mathematical target: For n ≥ 1 and a prime power q, let O(q,n) be the set of ordinary n-dimensional F_q-isogeny classes. Put c₄ = e^(−3/2), c₅ = 2 + √2 and r(q) = φ(q)/q. Prove #O(q,n) > c₄(c₅n)^(−2 log 2/log q)(2^n/n!)(r(q)q^(n/2) − n)q^(n(n−1)/4). Combining this with the power-sum upper bound gives log #Isog(q,g) = (1/4)g² log q + o_q(g²) for every fixed prime power q as g → ∞.
Source: [DPH: DPH], Theorem 1.3; Lemmas 2.1.1/2.1.3/2.5.1–3; Proposition 3.1.1; §3.2, PDF pp.2,4,13–18
-/
/- Signature omitted: Coarse isomorphism counts and conditional numerical assembly
Needs the genuine Weil-polynomial/isogeny/isomorphism or principal-polarization counting carrier and the uniform quantitative hypotheses specified in the README.

Mathematical target: For a fixed prime p let B(p,g) be the number of F_p-isomorphism classes of g-dimensional abelian varieties. Prove the coarse asymptotic log B(p,g) = O_p(g²). Also prove the following conditional numerical assembly: if the maximal size I_p(g) of a dimension-g isogeny class satisfies I_p(g) ≤ 2^(34g²) p^(17g²(1+ε_g)) for an error ε_g → 0 uniform across those classes, then B(p,g) ≤ 2^(34g²) p^((69/4)g²(1+o(1))). The first assertion uses coarse uniform lattice and class-number estimates; the second explicitly assumes the sharper uniform estimate.
Source: [Lee: Lee], Theorem 1.1 and §3.1(5)–(10), contrasted with §3.2(11), PDF pp.1–9
-/
/- Signature omitted: Asymptotic exclusion of squarefree nonreal ppavs
Needs the genuine Weil-polynomial/isogeny/isomorphism or principal-polarization counting carrier and the uniform quantitative hypotheses specified in the README.

Mathematical target: Fix a prime p for which the CM elliptic-power polarization estimate of F5 holds, in particular a prime splitting in at least one of the nine class-number-one CM fields. As g → ∞, the proportion of dimension-g principally polarized F_p-isomorphism classes whose underlying variety has no repeated F_p-simple isogeny factor and whose Frobenius polynomial is coprime to X² − p tends to zero.
Source: [LT: LT], Proposition 4.17 and Lemma 5.11, v1 pp.22–23,33, using the Hermitian mass coefficient
-/
