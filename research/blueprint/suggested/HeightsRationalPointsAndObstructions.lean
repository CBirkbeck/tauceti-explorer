import Mathlib.Order.Filter.ZeroAndBoundedAtFilter
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Pi
import Mathlib.Analysis.Normed.Group.Bounded
import Mathlib.Order.Northcott
import Mathlib.Topology.Algebra.RestrictedProduct.TopologicalSpace
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.Algebra.Azumaya.Basic
import Mathlib.Algebra.Azumaya.Matrix
import Mathlib.Algebra.BrauerGroup.Defs
import Mathlib.Algebra.Quaternion
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.RingTheory.FiniteType
import Mathlib.RingTheory.MvPolynomial.Basic
import TauCeti.Algebra.BrauerGroup.BaseChange
import TauCeti.Algebra.BrauerGroup.Group

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline.
-/

-- Baseline names omitted by the textual declaration index.
#check isBounded_iff_forall_norm_le
#check Northcott.finite_le

noncomputable section
namespace TauCeti
universe u v w

/-- The native quotient by uniformly bounded real functions. -/
abbrev HeightClass (X : Type u) :=
  (X → ℝ) ⧸ Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)

namespace HeightClass
variable {X : Type u} {Y : Type v} {Z : Type w}

/-- The native quotient projection, with its linear structure. -/
abbrev mk : (X → ℝ) →ₗ[ℝ] HeightClass X :=
  (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)).mkQ

lemma bounded_top_iff (h : X → ℝ) :
    h ∈ Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X) ↔
      ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |h x| ≤ C := by sorry

lemma mk_eq_mk_iff (h g : X → ℝ) :
    mk h = mk g ↔ ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |h x - g x| ≤ C := by sorry

lemma mk_eq_mk_iff_isBounded (h g : X → ℝ) :
    mk h = mk g ↔ Bornology.IsBounded (Set.range (h - g)) := by sorry

lemma mk_eq_zero_iff (h : X → ℝ) :
    mk h = 0 ↔ ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |h x| ≤ C := by sorry

lemma mk_surjective : Function.Surjective (mk : (X → ℝ) → HeightClass X) := by sorry

lemma mk_zero : mk (0 : X → ℝ) = 0 := by sorry
lemma mk_add (h g : X → ℝ) : mk (h + g) = mk h + mk g := by sorry
lemma mk_smul (c : ℝ) (h : X → ℝ) : mk (c • h) = c • mk h := by sorry
lemma mk_const (c : ℝ) : mk (fun _ : X => c) = 0 := by sorry
lemma mk_of_finite [Finite X] (h : X → ℝ) : mk h = 0 := by sorry

/-- Reuse the native linear quotient lift; no second lift construction. -/
lemma liftQ_mk {V : Type v} [AddCommGroup V] [Module ℝ V]
    (L : (X → ℝ) →ₗ[ℝ] V)
    (hL : Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X) ≤ LinearMap.ker L)
    (h : X → ℝ) :
    (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)).liftQ L hL (mk h) = L h := by sorry

lemma linearMap_ext {V : Type v} [AddCommGroup V] [Module ℝ V]
    (L M : HeightClass X →ₗ[ℝ] V) (h : ∀ f, L (mk f) = M (mk f)) : L = M := by sorry

/-- Pullback along a function, with no topology on its domain. -/
def pullback (f : X → Y) : HeightClass Y →ₗ[ℝ] HeightClass X :=
  (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter Y)).mapQ
    (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X))
    (LinearMap.pi fun x => LinearMap.proj (f x)) (by sorry)

lemma pullback_mk (f : X → Y) (h : Y → ℝ) :
    pullback f (mk h) = mk (h ∘ f) := by sorry
lemma pullback_id : pullback (id : X → X) = LinearMap.id := by sorry
lemma pullback_comp (f : X → Y) (g : Y → Z) :
    pullback (g ∘ f) = (pullback f).comp (pullback g) := by sorry
lemma pullback_add (f : X → Y) (a b : HeightClass Y) :
    pullback f (a + b) = pullback f a + pullback f b := by sorry
lemma pullback_smul (f : X → Y) (c : ℝ) (a : HeightClass Y) :
    pullback f (c • a) = c • pullback f a := by sorry
lemma pullback_const (y : Y) : pullback (fun _ : X => y) = 0 := by sorry

lemma pullback_injective_of_surjective (f : X → Y) (hf : Function.Surjective f) :
    Function.Injective (pullback f) := by sorry

lemma northcott_of_le_add (h g : X → ℝ) (C : ℝ) (H : ∀ x, h x ≤ g x + C)
    [Northcott h] : Northcott g := by sorry

lemma northcott_congr {h g : X → ℝ} (H : mk h = mk g) :
    Northcott h ↔ Northcott g := by sorry

lemma northcott_of_pullback_eq (f : X → Y) [Filter.TendstoCofinite f]
    (h : Y → ℝ) (g : X → ℝ) [Northcott h]
    (H : mk g = pullback f (mk h)) : Northcott g := by sorry

-- TauCeti.HeightClass.tests.empty
example (h : Empty → ℝ) : mk h = 0 := by sorry
-- TauCeti.HeightClass.tests.alternating
example : mk (fun n : ℕ => (-1 : ℝ)^n) = 0 := by sorry
-- TauCeti.HeightClass.tests.unbounded
example : mk (fun n : ℕ => (n : ℝ)) ≠ 0 := by sorry
-- TauCeti.HeightClass.tests.affine_shift
example : mk (fun n : ℕ => (n : ℝ) + 7) = mk (fun n : ℕ => (n : ℝ)) := by sorry
-- TauCeti.HeightClass.tests.native_quotient
example (h : X → ℝ) : mk h = (Submodule.Quotient.mk h : HeightClass X) := by sorry
-- TauCeti.HeightClass.tests.not_constants_only
example : ¬ ∃ c : ℝ, ∀ n : ℕ, (-1 : ℝ)^n = c := by sorry
-- TauCeti.HeightClass.tests.not_ring_quotient
example : mk (fun _ : ℕ => (1 : ℝ)) = mk (fun _ : ℕ => (0 : ℝ)) ∧
    mk (fun n : ℕ => (1 : ℝ) * n) ≠ mk (fun n : ℕ => (0 : ℝ) * n) := by sorry

-- TauCeti.HeightClass.pullback_tests.double
example : pullback (fun n : ℕ => 2*n) (mk (fun n : ℕ => (n : ℝ))) =
    2 • mk (fun n : ℕ => (n : ℝ)) := by sorry
-- TauCeti.HeightClass.pullback_tests.constant
example : pullback (fun _ : ℕ => (0 : ℕ)) (mk (fun n : ℕ => (n : ℝ))) = 0 := by sorry
-- TauCeti.HeightClass.pullback_tests.composition
example : pullback ((fun n : ℕ => 2*n) ∘ (fun n : ℕ => n+1))
    (mk (fun n : ℕ => (n : ℝ)^2)) =
    pullback (fun n : ℕ => n+1) (pullback (fun n : ℕ => 2*n)
      (mk (fun n : ℕ => (n : ℝ)^2))) := by sorry
-- TauCeti.HeightClass.pullback_tests.noninjective
example : ¬ Function.Injective (pullback (fun _ : ℕ => (0 : ℕ))) := by sorry

-- Representative invariance and finite-fiber acceptance cases.
example : Northcott (fun n : ℕ => (n : ℝ) + (-1 : ℝ)^n) := by sorry
example : Northcott (fun n : ℕ => (n : ℝ)) ∧
    ¬ Northcott (fun _ : ℕ => (0 : ℝ)) := by sorry
example : Northcott (fun n : ℕ => (n : ℝ)) ∧
    ¬ Northcott (fun n : ℕ => -(n : ℝ)) := by sorry
example : Northcott (fun p : ℕ × Fin 2 => (p.1 : ℝ)) := by sorry
example : ¬ Northcott (fun p : ℕ × ℕ => (p.1 : ℝ)) := by sorry

end HeightClass
end TauCeti

/-! ## RP.2: adelic points and the Brauer–Manin pairing (affine case)

Stand-ins: `TauCeti.BrauerManin.localInvariantFinite` and `localInvariantInfinite` stand for the
local invariant maps requested from ClassFieldTheory Layer 5; the hypothesis `hrec` of
`diagonal_mem_brauerManinSet` is the reciprocity law requested from ClassFieldTheory Layer 10.
They are not constructions of this roadmap. -/

noncomputable section
namespace TauCeti
universe u v w

open scoped TensorProduct

section Points
variable (R : Type u) (A : Type v) (B : Type w) [CommRing R] [CommRing A] [Algebra R A]
  [CommRing B] [Algebra R B]

/-- RP.2/points-topology: `B`-valued points of `Spec A`. The topology is an instance on this
type synonym only; no instance is put on `A →ₐ[R] B`. -/
def Points : Type (max v w) := A →ₐ[R] B

namespace Points

instance : FunLike (Points R A B) A B := inferInstanceAs (FunLike (A →ₐ[R] B) A B)
instance : AlgHomClass (Points R A B) R A B := inferInstanceAs (AlgHomClass (A →ₐ[R] B) R A B)

/-- Points as algebra maps. -/
def ofAlgHom {R A B} [CommRing R] [CommRing A] [Algebra R A] [CommRing B] [Algebra R B]
    (φ : A →ₐ[R] B) : Points R A B := φ

/-- Postcomposition with an algebra map of value rings (no topology). -/
def map {R A B B' : Type*} [CommRing R] [CommRing A] [Algebra R A] [CommRing B] [Algebra R B]
    [CommRing B'] [Algebra R B'] (h : B →ₐ[R] B') (x : Points R A B) : Points R A B' :=
  h.comp (x : A →ₐ[R] B)

variable [TopologicalSpace B]

/-- The points topology: induced from the product topology on `A → B`. -/
instance topologicalSpace : TopologicalSpace (Points R A B) :=
  TopologicalSpace.induced (fun φ : Points R A B => (φ : A → B)) inferInstance

variable {R A B}

theorem continuous_eval (a : A) : Continuous fun φ : Points R A B => φ a := by sorry

theorem continuous_iff {Z : Type*} [TopologicalSpace Z] (f : Z → Points R A B) :
    Continuous f ↔ ∀ a, Continuous fun z => f z a := by sorry

theorem isEmbedding_coe : Topology.IsEmbedding (fun φ : Points R A B => (φ : A → B)) := by sorry

/-- Precomposition with an algebra map of coordinate rings. -/
def precomp {A' : Type*} [CommRing A'] [Algebra R A'] (g : A' →ₐ[R] A) :
    C(Points R A B, Points R A' B) := sorry

/-- Postcomposition with a continuous algebra map of value rings. -/
def postcomp {B' : Type*} [CommRing B'] [Algebra R B'] [TopologicalSpace B'] (h : B →ₐ[R] B')
    (hh : Continuous h) : C(Points R A B, Points R A B') := sorry

variable [IsTopologicalRing B]

def tensorHomeomorph (A' : Type*) [CommRing A'] [Algebra R A'] :
    Points R (A ⊗[R] A') B ≃ₜ Points R A B × Points R A' B := sorry

def polynomialHomeomorph : Points R (Polynomial R) B ≃ₜ B := sorry

def unitsHomeomorph :
    Points R (MvPolynomial (Fin 2) R ⧸
      Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - 1}) B ≃ₜ Bˣ := sorry

/-- RP.2/points-topology-presentation. -/
theorem isEmbedding_generators {n : ℕ} (π : MvPolynomial (Fin n) R →ₐ[R] A)
    (hπ : Function.Surjective π) :
    Topology.IsEmbedding (fun φ : Points R A B => fun i => φ (π (MvPolynomial.X i))) := by sorry

theorem range_generators {n : ℕ} (π : MvPolynomial (Fin n) R →ₐ[R] A)
    (hπ : Function.Surjective π) :
    Set.range (fun φ : Points R A B => fun i => φ (π (MvPolynomial.X i))) =
      {b | ∀ f ∈ RingHom.ker π, MvPolynomial.aeval b f = 0} := by sorry

theorem isClosedEmbedding_generators [T1Space B] {n : ℕ} (π : MvPolynomial (Fin n) R →ₐ[R] A)
    (hπ : Function.Surjective π) :
    Topology.IsClosedEmbedding
      (fun φ : Points R A B => fun i => φ (π (MvPolynomial.X i))) := by sorry

instance [T2Space B] : T2Space (Points R A B) := by sorry

theorem locallyCompactSpace [T2Space B] [LocallyCompactSpace B] [Algebra.FiniteType R A] :
    LocallyCompactSpace (Points R A B) := by sorry

/-- RP.2/points-topology-base-change (orientation corrected; sourceIssues E8). -/
theorem isEmbedding_postcomp [Algebra.FiniteType R A] {B' : Type*} [CommRing B'] [Algebra R B']
    [TopologicalSpace B'] [IsTopologicalRing B'] (h : B →ₐ[R] B') (hh : Topology.IsEmbedding h) :
    Topology.IsEmbedding (postcomp (A := A) h hh.continuous) := by sorry

theorem isClosedEmbedding_postcomp [Algebra.FiniteType R A] {B' : Type*} [CommRing B']
    [Algebra R B'] [TopologicalSpace B'] [IsTopologicalRing B'] (h : B →ₐ[R] B')
    (hh : Topology.IsClosedEmbedding h) :
    Topology.IsClosedEmbedding (postcomp (A := A) h hh.continuous) := by sorry

theorem isOpenEmbedding_postcomp [Algebra.FiniteType R A] {B' : Type*} [CommRing B']
    [Algebra R B'] [TopologicalSpace B'] [IsTopologicalRing B'] (h : B →ₐ[R] B')
    (hh : Topology.IsOpenEmbedding h) :
    Topology.IsOpenEmbedding (postcomp (A := A) h hh.continuous) := by sorry

theorem discrete_range_postcomp [Algebra.FiniteType R A] {B' : Type*} [CommRing B']
    [Algebra R B'] [TopologicalSpace B'] [IsTopologicalRing B'] (h : B →ₐ[R] B')
    (hh : Continuous h) (hd : DiscreteTopology (Set.range h)) :
    DiscreteTopology (Set.range (postcomp (A := A) h hh)) := by sorry

end Points
end Points

-- TauCeti.Points.tests.base
example (R B : Type) [CommRing R] [CommRing B] [Algebra R B] :
    Subsingleton (Points R R B) := by sorry
-- TauCeti.Points.tests.zero_ring
example (R B : Type) [CommRing R] [CommRing B] [Algebra R B] [Nontrivial B] :
    IsEmpty (Points R PUnit B) := by sorry
-- TauCeti.Points.tests.polynomial_real
example : Nonempty (Points ℤ (Polynomial ℤ) ℝ ≃ₜ ℝ) := by sorry
-- TauCeti.Points.tests.units_real
example : Nonempty (Points ℤ (MvPolynomial (Fin 2) ℤ ⧸
    Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - 1}) ℝ ≃ₜ {x : ℝ // x ≠ 0}) := by sorry
-- TauCeti.Points.tests.not_discrete
example (p : ℕ) [Fact p.Prime] : ¬ DiscreteTopology (Points ℤ (Polynomial ℤ) ℚ_[p]) := by sorry

section Adelic
open NumberField IsDedekindDomain

variable (K : Type) [Field K] [NumberField K] (A : Type) [CommRing A] [Algebra K A]

/-- RP.2/adelic-points. -/
abbrev AdelicPoints := Points K A (AdeleRing (𝓞 K) K)

namespace AdelicPoints

def diagonal : Points K A K → AdelicPoints K A :=
  Points.map (Algebra.ofId K (AdeleRing (𝓞 K) K))

def finiteProj (v : HeightOneSpectrum (𝓞 K)) :
    C(AdelicPoints K A, Points K A (v.adicCompletion K)) := sorry

def infiniteProj (w : InfinitePlace K) : C(AdelicPoints K A, Points K A w.Completion) := sorry

theorem ext {x y : AdelicPoints K A} (hf : ∀ v, finiteProj K A v x = finiteProj K A v y)
    (hi : ∀ w, infiniteProj K A w x = infiniteProj K A w y) : x = y := by sorry

theorem diagonal_injective : Function.Injective (diagonal K A) := by sorry

instance t2Space : T2Space (AdelicPoints K A) := by sorry

/-- Needs compactness of the local integers (recorded gap). -/
theorem locallyCompactSpace [Algebra.FiniteType K A] : LocallyCompactSpace (AdelicPoints K A) := by
  sorry

/-- RP.2/rational-points-discrete. -/
theorem isClosed_range_diagonal [Algebra.FiniteType K A] :
    IsClosed (Set.range (diagonal K A)) := by sorry

theorem discreteTopology_range_diagonal [Algebra.FiniteType K A] :
    DiscreteTopology (Set.range (diagonal K A)) := by sorry

variable [Algebra (𝓞 K) A] [IsScalarTower (𝓞 K) K A]

/-- RP.2/integral-model. -/
structure IntegralModel where
  carrier : Subalgebra (𝓞 K) A
  fg : carrier.FG
  span : Algebra.adjoin K (carrier : Set A) = ⊤

namespace IntegralModel
variable {K A}

def integralPoints (M : IntegralModel K A) (v : HeightOneSpectrum (𝓞 K)) :
    Set (Points K A (v.adicCompletion K)) :=
  {x | ∀ a ∈ M.carrier, x a ∈ v.adicCompletionIntegers K}

theorem isOpen_integralPoints (M : IntegralModel K A) (v : HeightOneSpectrum (𝓞 K)) :
    IsOpen (M.integralPoints v) := by sorry

/-- RP.2/integral-model-exists-unique (a). -/
theorem nonempty [Algebra.FiniteType K A] : Nonempty (IntegralModel K A) := by sorry

/-- RP.2/integral-model-exists-unique (b). -/
theorem eventually_integralPoints_eq (M M' : IntegralModel K A) :
    ∀ᶠ v in Filter.cofinite, M.integralPoints v = M'.integralPoints v := by sorry

end IntegralModel

/-- RP.2/adelic-points-restricted-product. -/
def restrictedProductHomeomorph [Algebra.FiniteType K A] (M : IntegralModel K A) :
    AdelicPoints K A ≃ₜ (Π w : InfinitePlace K, Points K A w.Completion) ×
      RestrictedProduct (fun v : HeightOneSpectrum (𝓞 K) => Points K A (v.adicCompletion K))
        (fun v => M.integralPoints v) Filter.cofinite := sorry

theorem eventually_mem_integralPoints (M : IntegralModel K A) (x : AdelicPoints K A) :
    ∀ᶠ v in Filter.cofinite, finiteProj K A v x ∈ M.integralPoints v := by sorry

/-- RP.2/adelic-points-nonempty-iff. -/
theorem nonempty_iff [Algebra.FiniteType K A] (M : IntegralModel K A) :
    Nonempty (AdelicPoints K A) ↔
      (∀ w : InfinitePlace K, Nonempty (Points K A w.Completion)) ∧
      (∀ v : HeightOneSpectrum (𝓞 K), Nonempty (Points K A (v.adicCompletion K))) ∧
      ∀ᶠ v in Filter.cofinite, (M.integralPoints v).Nonempty := by sorry

end AdelicPoints
end Adelic

-- TauCeti.AdelicPoints.tests.point
example (K : Type) [Field K] [NumberField K] : Subsingleton (AdelicPoints K K) := by sorry
-- TauCeti.AdelicPoints.tests.affine_line
example (K : Type) [Field K] [NumberField K] :
    Nonempty (AdelicPoints K (Polynomial K) ≃ₜ
      NumberField.AdeleRing (NumberField.RingOfIntegers K) K) := by sorry
-- TauCeti.AdelicPoints.tests.multiplicative_group
example (K : Type) [Field K] [NumberField K] :
    Nonempty (AdelicPoints K (MvPolynomial (Fin 2) K ⧸
      Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - 1}) ≃ₜ
        (NumberField.AdeleRing (NumberField.RingOfIntegers K) K)ˣ) := by sorry
-- TauCeti.AdelicPoints.tests.no_real_point
example : IsEmpty (AdelicPoints ℚ (Polynomial ℚ ⧸ Ideal.span {Polynomial.X ^ 2 + 1})) := by sorry
-- TauCeti.AdelicPoints.IntegralModel.tests.affine_line, .base, .rescaled, .no_integral_point:
--   stated in the packet; their Lean form needs the subalgebras ℤ[X], ℤ[X/2] ⊆ ℚ[X] and
--   ℤ[1/3] ⊆ ℚ[X]/(3X − 1), omitted here.

/-- RP.2/azumaya-base-change. -/
theorem IsAzumaya.baseChange (R 𝒜 S : Type*) [CommRing R] [Ring 𝒜] [Algebra R 𝒜] [CommRing S]
    [Algebra R S] [IsAzumaya R 𝒜] : IsAzumaya S (S ⊗[R] 𝒜) := by sorry

theorem IsAzumaya.isSimpleRing_of_field (L 𝒜 : Type*) [Field L] [Ring 𝒜] [Algebra L 𝒜]
    [IsAzumaya L 𝒜] : IsSimpleRing 𝒜 := by sorry

section Brauer

/-- RP.2/brauer-evaluation: the Brauer class of `L ⊗[A, x] 𝒜`. -/
def BrauerManin.eval {K A L : Type} [Field K] [CommRing A] [Algebra K A] [Field L] [Algebra K L]
    (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜] (x : Points K A L) :
    BrauerGroup.{0, 0} L := sorry

namespace BrauerManin
variable {K A L : Type} [Field K] [CommRing A] [Algebra K A] [Field L] [Algebra K L]
  (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜]

theorem eval_baseChange {L' : Type} [Field L'] [Algebra K L'] [Algebra L L']
    [IsScalarTower K L L'] (x : Points K A L) :
    eval 𝒜 (Points.map (IsScalarTower.toAlgHom K L L') x) =
      TauCeti.BrauerGroup.baseChange L L' (eval 𝒜 x) := by sorry

theorem eval_self (x : Points K A L) : eval A x = 1 := by sorry

theorem eval_tensor (𝒜' : Type) [Ring 𝒜'] [Algebra A 𝒜'] [IsAzumaya A 𝒜']
    [IsAzumaya A (𝒜 ⊗[A] 𝒜')] (x : Points K A L) :
    eval (𝒜 ⊗[A] 𝒜') x = eval 𝒜 x * eval 𝒜' x := by sorry

theorem eval_op [IsAzumaya A 𝒜ᵐᵒᵖ] (x : Points K A L) : eval 𝒜ᵐᵒᵖ x = (eval 𝒜 x)⁻¹ := by sorry

end BrauerManin

-- TauCeti.BrauerManin.tests.matrix
example {K A L : Type} [Field K] [CommRing A] [Algebra K A] [Field L] [Algebra K L] (n : ℕ)
    [NeZero n] [IsAzumaya A (Matrix (Fin n) (Fin n) A)] (x : Points K A L) :
    BrauerManin.eval (Matrix (Fin n) (Fin n) A) x = 1 := by sorry
-- TauCeti.BrauerManin.tests.hamilton_real
example [IsAzumaya ℚ ℍ[ℚ]] :
    BrauerManin.eval ℍ[ℚ] (Points.ofAlgHom (Algebra.ofId ℚ ℝ) : Points ℚ ℚ ℝ) ≠ 1 := by sorry
-- TauCeti.BrauerManin.tests.alg_closed
example {K A L : Type} [Field K] [CommRing A] [Algebra K A] [Field L] [Algebra K L]
    [IsAlgClosed L] (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜] (x : Points K A L) :
    BrauerManin.eval 𝒜 x = 1 := by sorry
-- TauCeti.BrauerManin.tests.trivial is `BrauerManin.eval_self`; .depends_on_point needs the
--   quaternion algebra (−1, t) over ℚ[t, 1/t], omitted here.

-- TauCeti.BrauerManin.exists_azumaya_model (RP.2/azumaya-spreading-out): not stated here; it needs
--   the localisation A₀[1/N] of an integral model as a subalgebra of A with its algebra
--   structures, which the suggested IntegralModel does not yet package.

open NumberField IsDedekindDomain in
/-- RP.2/azumaya-complete-dvr-split. -/
theorem BrauerManin.azumaya_split_of_adicCompletionIntegers (K : Type) [Field K] [NumberField K]
    (v : HeightOneSpectrum (𝓞 K)) (𝒜₀ : Type) [Ring 𝒜₀] [Algebra (v.adicCompletionIntegers K) 𝒜₀]
    [IsAzumaya (v.adicCompletionIntegers K) 𝒜₀] :
    ∃ (n : ℕ) (_ : NeZero n), Nonempty (𝒜₀ ≃ₐ[v.adicCompletionIntegers K]
      Matrix (Fin n) (Fin n) (v.adicCompletionIntegers K)) := by sorry

section Pairing
open NumberField IsDedekindDomain
variable (K : Type) [Field K] [NumberField K] (A : Type) [CommRing A] [Algebra K A]
  [Algebra.FiniteType K A]

/-- Stand-in for the local invariant requested from ClassFieldTheory Layer 5 (finite places). -/
def BrauerManin.localInvariantFinite (v : HeightOneSpectrum (𝓞 K)) :
    BrauerGroup.{0, 0} (v.adicCompletion K) →* Multiplicative (AddCircle (1 : ℚ)) := sorry

/-- Stand-in for the local invariant at an infinite place (½ at a ramified real place, else 0). -/
def BrauerManin.localInvariantInfinite (w : InfinitePlace K) :
    BrauerGroup.{0, 0} w.Completion →* Multiplicative (AddCircle (1 : ℚ)) := sorry

namespace BrauerManin
variable (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜]

/-- RP.2/brauer-evaluation-finite-support. -/
theorem finite_eval_ne_one (x : AdelicPoints K A) :
    Set.Finite {v : HeightOneSpectrum (𝓞 K) | eval 𝒜 (AdelicPoints.finiteProj K A v x) ≠ 1} := by
  sorry

/-- RP.2/brauer-manin-pairing. -/
def pairing (x : AdelicPoints K A) : AddCircle (1 : ℚ) := sorry

def brauerSet : Set (AdelicPoints K A) := {x | pairing K A 𝒜 x = 0}

/-- Bundled Azumaya algebras over `A`, indexing the Brauer–Manin set. -/
structure AzumayaAlgebra where
  carrier : Type
  [ring : Ring carrier]
  [algebra : Algebra A carrier]
  [isAzumaya : IsAzumaya A carrier]

def brauerManinSet : Set (AdelicPoints K A) :=
  ⋂ 𝒜 : AzumayaAlgebra A,
    letI := 𝒜.ring; letI := 𝒜.algebra; letI := 𝒜.isAzumaya; brauerSet K A 𝒜.carrier

theorem pairing_self (x : AdelicPoints K A) : pairing K A A x = 0 := by sorry

/-- RP.2/rational-points-in-brauer-manin-set; `hrec` is the requested reciprocity law. -/
theorem diagonal_mem_brauerManinSet
    (hrec : ∀ β : BrauerGroup.{0, 0} K,
      (∏ᶠ v : HeightOneSpectrum (𝓞 K),
          localInvariantFinite K v (TauCeti.BrauerGroup.baseChange K (v.adicCompletion K) β)) *
        (∏ w : InfinitePlace K,
          localInvariantInfinite K w (TauCeti.BrauerGroup.baseChange K w.Completion β)) = 1)
    (x : Points K A K) : AdelicPoints.diagonal K A x ∈ brauerManinSet K A := by sorry

end BrauerManin
end Pairing

-- TauCeti.BrauerManin.tests.pairing_trivial is `BrauerManin.pairing_self`.
-- TauCeti.BrauerManin.tests.empty
example : ¬ ((Nonempty (AdelicPoints ℚ (Polynomial ℚ ⧸ Ideal.span {Polynomial.X ^ 2 + 1}))) ∧
    BrauerManin.brauerManinSet ℚ (Polynomial ℚ ⧸ Ideal.span {Polynomial.X ^ 2 + 1}) = ∅) := by
  sorry
-- TauCeti.BrauerManin.tests.brauer_set_subset
example (K : Type) [Field K] [NumberField K] (A : Type) [CommRing A] [Algebra K A]
    [Algebra.FiniteType K A] (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜] :
    BrauerManin.brauerManinSet K A ⊆ BrauerManin.brauerSet K A 𝒜 := by sorry

end Brauer
end TauCeti
