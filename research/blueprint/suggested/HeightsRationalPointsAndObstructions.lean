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
import Mathlib.NumberTheory.Height.Projectivization
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.Height.Northcott
import Mathlib.NumberTheory.Height.MvPolynomial
import Mathlib.GroupTheory.Descent
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.CategoryTheory.Monoidal.Cartesian.Grp
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.SiegelsLemma
import Mathlib.Analysis.Polynomial.MahlerMeasure
import Mathlib.LinearAlgebra.Dimension.Finrank
import TauCeti.Algebra.BrauerGroup.BaseChange
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight

/-!
# Heights, rational points and obstructions — suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document is definitive. The
statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. All proposed results are unproved prototypes at the pinned baseline (Mathlib
082e2d3, Tau Ceti f790474); every proof is `sorry`.

Conventions. Points of a `K`-scheme `X : Over (Spec K)` with values in a field `L` are the
hom-set `TauCeti.Pts X L`; points of an abelian variety form an additive group through Mathlib's
scoped `CategoryTheory.MonObj.Hom.commGroup`. Line-bundle classes are Tau Ceti's
`LineBundleClass`, written additively as `TauCeti.Pic`. Heights take values in
`TauCeti.HeightClass`, the quotient of real functions by bounded functions.

Stand-ins. A few carriers that other roadmaps own and the pins lack are declared with `sorry`
bodies and marked as stand-ins in their docstrings: `GaloisH1` (EllipticCurves Layer 7),
`SchemeBrauer` and its pullback (SchemeAndStackFoundations `key/scheme-brauer`), `localInv` and
`localInvInf` (ClassFieldTheory Layer 5), `TorsorH1`, `FieldH1` and the torsor operations (SF.1),
`Curve.genus` (SF.3), `negPullback`, `picPullback` and `transPullback` (pullback of line-bundle
classes). Statements whose carriers cannot be given honestly at the pins are listed by name at
the end of the file.
-/

-- Baseline names omitted by the textual declaration index.
#check isBounded_iff_forall_norm_le
#check Northcott.finite_le
#check @AddCommGroup.fg_of_descent'
#check @AddMonoid.finite_set_isOfFiniteOrder_of_descent

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

/-! ## RP.0: the height machine and canonical heights

Stand-ins for carriers owned elsewhere are marked as such: `TauCeti.Pts` is the set of points of
a scheme over `Spec K` with values in a field extension (a plain hom-set of Mathlib's `Over`
category), and `TauCeti.Pic` is Tau Ceti's monoid of line-bundle classes written additively. -/

open CategoryTheory _root_.AlgebraicGeometry Height
open scoped CategoryTheory.MonObj

noncomputable section
namespace TauCeti
universe u

/-- `L`-points of a `K`-scheme given as an object over `Spec K`. -/
abbrev Pts {K : Type u} [Field K] (X : Over (Spec (.of K))) (L : Type u) [Field L]
    [Algebra K L] : Type u :=
  Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K L))) ⟶ X

/-- Line-bundle classes of a scheme, written additively (Tau Ceti `LineBundleClass`). -/
abbrev Pic (X : Scheme.{u}) : Type (u + 1) := Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)

/-! ### RP.0/generalized-global-field -/

/-- A field with an admissible family of absolute values in Mathlib's sense whose
nonarchimedean members are discretely valued (Conrad, Definition 8.1). Excellence of the
valuation rings is automatic in characteristic zero and is not encoded. -/
class GeneralizedGlobalField (K : Type u) [Field K] extends AdmissibleAbsValues K where
  discrete : ∀ v ∈ nonarchAbsVal, ∃ c : ℝ, 0 < c ∧ c < 1 ∧
    ∀ x : K, x ≠ 0 → ∃ n : ℤ, v x = c ^ n

namespace GeneralizedGlobalField
variable (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]

/-- `TauCeti.GeneralizedGlobalField.ofNumberField`. -/
instance ofNumberField [NumberField K] : GeneralizedGlobalField K where
  toAdmissibleAbsValues := NumberField.instAdmissibleAbsValues
  discrete := sorry

/-- `TauCeti.GeneralizedGlobalField.extend`: the algebraic method of Conrad §8. -/
@[reducible] def extend [GeneralizedGlobalField K] [FiniteDimensional K L] : GeneralizedGlobalField L := sorry

/-- `TauCeti.GeneralizedGlobalField.extend_restrict`, in product form: the extended family
restricted to `K` is the original family to the power `[L : K]`. -/
theorem extend_restrict [GeneralizedGlobalField K] [FiniteDimensional K L] (x : K) :
    (letI := extend K L; mulHeight₁ (algebraMap K L x)) =
      mulHeight₁ x ^ Module.finrank K L := by sorry

/-- `TauCeti.GeneralizedGlobalField.extend_trans`. -/
theorem extend_trans (M : Type u) [Field M] [Algebra L M] [Algebra K M] [IsScalarTower K L M]
    [GeneralizedGlobalField K] [FiniteDimensional K L] [FiniteDimensional L M]
    [FiniteDimensional K M] :
    (letI := extend K L; extend L M) = extend K M := by sorry

/-- `TauCeti.GeneralizedGlobalField.extend_numberField`. -/
theorem extend_numberField [NumberField K] [NumberField L] [FiniteDimensional K L] :
    extend K L = ofNumberField L := by sorry

end GeneralizedGlobalField

/-- Test `GeneralizedGlobalField.test_rat_product_formula`. -/
example : mulHeight₁ (2 : ℚ) = 2 := by sorry
/-- Test `GeneralizedGlobalField.test_extend_self`. -/
example (K : Type u) [Field K] [GeneralizedGlobalField K] :
    GeneralizedGlobalField.extend K K = ‹GeneralizedGlobalField K› := by sorry
/-- Test `GeneralizedGlobalField.test_numberField`. -/
example : totalWeight (CyclotomicField 4 ℚ) = 2 := by sorry
/-- Test `GeneralizedGlobalField.test_no_archimedean`. -/
example : (∏ᶠ p : Nat.Primes, (padicNorm p 2 : ℚ)) ≠ 1 := by sorry

/-! ### RP.0/geometric-height-field

The polarized model `(V, N)` is recorded by the data the structure needs: the prime divisors of
`V` with their `N`-degrees and order functions. -/

/-- Polarization data of a finitely generated field `K/k`: prime divisors `D` of a normal
projective model with their `N`-degrees and valuations. -/
structure Polarization (k K : Type u) [Field k] [Field K] [Algebra k K] where
  PrimeDivisor : Type u
  degN : PrimeDivisor → ℕ
  degN_pos : ∀ D, 0 < degN D
  ord : PrimeDivisor → Valuation K (WithZero (Multiplicative ℤ))
  ord_const : ∀ D (c : k), c ≠ 0 → ord D (algebraMap k K c) = 1
  finite_support : ∀ x : K, x ≠ 0 → {D | ord D x ≠ 1}.Finite

namespace GeneralizedGlobalField
variable {k K : Type u} [Field k] [Field K] [Algebra k K]

/-- `TauCeti.GeneralizedGlobalField.ofPolarization`. -/
@[reducible] def ofPolarization (P : Polarization k K) : GeneralizedGlobalField K := sorry

/-- `TauCeti.GeneralizedGlobalField.ofPolarization_absVal`: `|x|_D = exp(−deg_N D · ord_D x)`. -/
theorem ofPolarization_absVal (P : Polarization k K) (D : P.PrimeDivisor) (x : K) (hx : x ≠ 0) :
    ∃ v ∈ (ofPolarization P).nonarchAbsVal,
      v x = Real.exp (-(P.degN D : ℝ) * (WithZero.unzero (by sorry : P.ord D x ≠ 0)).toAdd) := by
  sorry

/-- `TauCeti.GeneralizedGlobalField.ofPolarization_eq_one_iff`. -/
theorem ofPolarization_eq_one_iff [IsAlgClosed k] (P : Polarization k K) (x : K) (hx : x ≠ 0) :
    (∀ v ∈ (ofPolarization P).nonarchAbsVal, v x = 1) ↔ x ∈ Set.range (algebraMap k K) := by sorry

/-- `TauCeti.GeneralizedGlobalField.ofPolarization_curve`: for a curve the family does not
depend on `N`; here, two polarizations with the same divisors and orders give the same family. -/
theorem ofPolarization_curve (P P' : Polarization k K) (h : P.PrimeDivisor = P'.PrimeDivisor)
    (hdeg : ∀ D, P.degN D = P'.degN (cast h D)) (hord : ∀ D, P.ord D = P'.ord (cast h D)) :
    ofPolarization P = ofPolarization P' := by sorry

/-- `TauCeti.GeneralizedGlobalField.extend_ofPolarization` (Conrad, Lemma 8.6), recorded as the
statement that the extension of a polarized structure is again of polarized form. -/
theorem extend_ofPolarization (P : Polarization k K) (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra k L] [IsScalarTower k K L] :
    ∃ P' : Polarization k L, ∀ x : L, x ≠ 0 →
      (letI := ofPolarization P; letI := extend K L; mulHeight₁ x) =
        (letI := ofPolarization P'; mulHeight₁ x) := by sorry

end GeneralizedGlobalField

/-- Test `ofPolarization.test_projectiveLine`: the place at `t = 0` gives `|t|_0 = e⁻¹`. -/
example (k : Type u) [Field k] (P : Polarization k (RatFunc k)) (D : P.PrimeDivisor)
    (hD : P.degN D = 1) (h0 : P.ord D RatFunc.X = Multiplicative.ofAdd (1 : ℤ)) :
    ∃ v ∈ (GeneralizedGlobalField.ofPolarization P).nonarchAbsVal,
      v RatFunc.X = Real.exp (-1) := by sorry
/-- Test `ofPolarization.test_constants`. -/
example (k K : Type u) [Field k] [Field K] [Algebra k K] (P : Polarization k K) (c : k)
    (hc : c ≠ 0) : ∀ v ∈ (GeneralizedGlobalField.ofPolarization P).nonarchAbsVal,
      v (algebraMap k K c) = 1 := by sorry
/-! ### RP.0/normalized-height -/

/-- `TauCeti.normalizedHeight`: the normalised height on `ℙⁿ(K̄)`. -/
def normalizedHeight (K : Type u) [Field K] [GeneralizedGlobalField K] (n : ℕ) :
    Projectivization (AlgebraicClosure K) (Fin (n + 1) → AlgebraicClosure K) → ℝ := sorry

section NormalizedHeight
variable {K : Type u} [Field K] [GeneralizedGlobalField K] {n : ℕ}

/-- `TauCeti.normalizedHeight_of_mem`. -/
theorem normalizedHeight_of_mem (L : IntermediateField K (AlgebraicClosure K))
    [FiniteDimensional K L] (x : Fin (n + 1) → L) (hx : x ≠ 0) :
    normalizedHeight K n (Projectivization.mk _ (fun i => (x i : AlgebraicClosure K))
      (by sorry)) =
      (letI := GeneralizedGlobalField.extend K L; logHeight x) / Module.finrank K L := by sorry

/-- `TauCeti.normalizedHeight_algebraMap`. -/
theorem normalizedHeight_algebraMap (x : Fin (n + 1) → K) (hx : x ≠ 0) :
    normalizedHeight K n (Projectivization.mk _ (fun i => algebraMap K (AlgebraicClosure K) (x i))
      (by sorry)) = Projectivization.logHeight (Projectivization.mk K x hx) := by sorry

/-- `TauCeti.normalizedHeight_nonneg`. -/
theorem normalizedHeight_nonneg (x) : 0 ≤ normalizedHeight K n x := by sorry

/-- `TauCeti.normalizedHeight_galois`. -/
theorem normalizedHeight_galois (σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K)
    (v : Fin (n + 1) → AlgebraicClosure K) (hv : v ≠ 0) :
    normalizedHeight K n (Projectivization.mk _ (fun i => σ (v i)) (by sorry)) =
      normalizedHeight K n (Projectivization.mk _ v hv) := by sorry

end NormalizedHeight

/-- `TauCeti.absHeight_eq_absLogHeight₁`. -/
theorem absHeight_eq_absLogHeight₁ (x : AlgebraicClosure ℚ) :
    normalizedHeight ℚ 1 (Projectivization.mk _ ![x, 1] (by simp)) =
      NumberField.absLogHeight₁ x := by sorry

/-- Test `normalizedHeight.test_one_two`. -/
example : normalizedHeight ℚ 1 (Projectivization.mk _ ![1, 2] (by simp)) = Real.log 2 := by sorry
/-- Test `normalizedHeight.test_coordinate_point`. -/
example (K : Type u) [Field K] [GeneralizedGlobalField K] (n : ℕ) :
    normalizedHeight K n (Projectivization.mk _ (Pi.single 0 1) (by simp)) = 0 := by sorry
/-- Test `normalizedHeight.test_sqrt_two`. -/
example (s : AlgebraicClosure ℚ) (hs : s ^ 2 = 2) :
    normalizedHeight ℚ 1 (Projectivization.mk _ ![s, 1] (by simp)) = Real.log 2 / 2 := by sorry
/-- Test `normalizedHeight.test_relative_differs`: Mathlib's relative height over `ℚ(i)` of
`(2, 1)` is `2 log 2`. -/
example : logHeight (![2, 1] : Fin 2 → CyclotomicField 4 ℚ) = 2 * Real.log 2 := by sorry

/-! ### RP.0/extension-invariance -/

/-- `TauCeti.logHeight_baseChange` (RP.0/extension-invariance). -/
theorem logHeight_baseChange (K L : Type u) [Field K] [Field L] [Algebra K L]
    [GeneralizedGlobalField K] [FiniteDimensional K L] {n : ℕ} (x : Fin n → K) :
    (letI := GeneralizedGlobalField.extend K L; logHeight (fun i => algebraMap K L (x i))) =
      Module.finrank K L * logHeight x := by sorry

/-! ### RP.0/tuple-height-adapters -/

/-- `TauCeti.absLogHeight_tuple_le` (RP.0/tuple-height-adapters): both comparisons. -/
theorem absLogHeight_tuple_le {m : ℕ} (x : Fin m → AlgebraicClosure ℚ) :
    (∀ i, NumberField.absLogHeight₁ (x i) ≤
      normalizedHeight ℚ m (Projectivization.mk _ (Fin.cons 1 x) (by sorry))) ∧
    normalizedHeight ℚ m (Projectivization.mk _ (Fin.cons 1 x) (by sorry)) ≤
      ∑ i, NumberField.absLogHeight₁ (x i) := by sorry

/-- `TauCeti.absLogHeight_re_le` (RP.0/tuple-height-adapters): real parts of algebraic numbers. -/
theorem absLogHeight_re_le (x y : AlgebraicClosure ℚ)
    (hy : ∀ φ : AlgebraicClosure ℚ →+* ℂ, φ y = ((φ x).re : ℂ)) :
    NumberField.absLogHeight₁ y ≤ 2 * NumberField.absLogHeight₁ x + 2 * Real.log 2 := by sorry

/-! ### RP.0/northcott-projective -/

/-- `TauCeti.northcott_projectivization` (RP.0/northcott-projective, part (a)). -/
theorem northcott_projectivization (K : Type u) [Field K] [NumberField K] (n : ℕ) :
    Northcott (Projectivization.logHeight (K := K) («ι» := Fin (n + 1))) := by sorry

/-- `TauCeti.finite_normalizedHeight_le_of_degree_le` (RP.0/northcott-projective, part (b)). -/
theorem finite_normalizedHeight_le_of_degree_le (n D : ℕ) (B : ℝ) :
    {x : Projectivization (AlgebraicClosure ℚ) (Fin (n + 1) → AlgebraicClosure ℚ) |
      (∃ v : Fin (n + 1) → AlgebraicClosure ℚ, ∃ hv : v ≠ 0, x = Projectivization.mk _ v hv ∧
        Module.finrank ℚ (IntermediateField.adjoin ℚ (Set.range v)) ≤ D) ∧
      normalizedHeight ℚ n x ≤ B}.Finite := by sorry

/-- Test of RP.0/northcott-projective: eight points of `ℙ¹(ℚ)` have height at most `log 2`. -/
example : Set.ncard {x : Projectivization ℚ (Fin 2 → ℚ) |
    Projectivization.logHeight x ≤ Real.log 2} = 8 := by sorry

/-! ### RP.0/linear-change-bounded and RP.0/morphism-height-comparison -/

/-- `TauCeti.normalizedHeight_linearChange_bounded` (RP.0/linear-change-bounded). -/
theorem normalizedHeight_linearChange_bounded (K : Type u) [Field K] [GeneralizedGlobalField K]
    {n : ℕ} (T : (Fin (n + 1) → K) ≃ₗ[K] (Fin (n + 1) → K)) :
    ∃ C : ℝ, ∀ x : Fin (n + 1) → K, x ≠ 0 →
      |logHeight (T x) - logHeight x| ≤ C := by sorry

/-- `TauCeti.normalizedHeight_comp_veronese` (RP.0/morphism-height-comparison, the case of the
Veronese-type maps given by forms of degree `d` without common zero). -/
theorem normalizedHeight_comp_forms (K : Type u) [Field K] [GeneralizedGlobalField K] {n m d : ℕ}
    (F : Fin (m + 1) → MvPolynomial (Fin (n + 1)) K) (hF : ∀ i, (F i).IsHomogeneous d)
    (hnz : ∀ x : Fin (n + 1) → K, x ≠ 0 → (fun i => MvPolynomial.eval x (F i)) ≠ 0) :
    ∃ C : ℝ, ∀ x : Fin (n + 1) → K, x ≠ 0 →
      |logHeight (fun i => MvPolynomial.eval x (F i)) - d * logHeight x| ≤ C := by sorry

/-! ### RP.0/weil-height-machine -/

section HeightMachine
variable {K : Type u} [Field K] [GeneralizedGlobalField K]

/-- Points over `K̄` of a `K`-scheme. -/
abbrev barPts (X : Over (Spec (.of K))) : Type u := Pts X (AlgebraicClosure K)

/-- `TauCeti.weilHeight`: the height machine `Pic(X) → HeightClass(X(K̄))` for `X` projective. -/
def weilHeight (X : Over (Spec (.of K))) [IsProper X.hom] :
    Pic X.left →+ HeightClass (barPts X) := sorry

variable (X : Over (Spec (.of K))) [IsProper X.hom]

/-- `TauCeti.weilHeight_tensor`. -/
theorem weilHeight_tensor (L M : Pic X.left) :
    weilHeight X (L + M) = weilHeight X L + weilHeight X M := by sorry

/-- `TauCeti.weilHeight_pullback`: functoriality along a morphism `f : Y → X`. -/
theorem weilHeight_pullback (Y : Over (Spec (.of K))) [IsProper Y.hom] (f : Y ⟶ X)
    (fPic : Pic X.left →+ Pic Y.left) (L : Pic X.left) :
    weilHeight Y (fPic L) = HeightClass.pullback (fun y : barPts Y => y ≫ f) (weilHeight X L) := by
  sorry

end HeightMachine

/-- Test `weilHeight.test_projectiveSpace`. -/
example : normalizedHeight ℚ 1 (Projectivization.mk _ ![1, 2] (by simp)) * 2 = 2 * Real.log 2 := by
  sorry
/-- Test `weilHeight.test_trivial`. -/
example (K : Type u) [Field K] [GeneralizedGlobalField K] (X : Over (Spec (.of K)))
    [IsProper X.hom] : weilHeight X 0 = 0 := by sorry
/-- Test `weilHeight.test_point`. -/
example (K : Type u) [Field K] [GeneralizedGlobalField K] (L : Pic (Spec (.of K)))
    [IsProper (Over.mk (𝟙 (Spec (.of K)))).hom] :
    weilHeight (Over.mk (𝟙 (Spec (.of K)))) L = 0 := by sorry
/-- Test `weilHeight.test_mathlib_relative`. -/
example (K : Type u) [Field K] [GeneralizedGlobalField K] (n : ℕ) (x : Fin (n + 1) → K)
    (hx : x ≠ 0) :
    normalizedHeight K n (Projectivization.mk _ (fun i => algebraMap K _ (x i)) (by sorry)) =
      Projectivization.logHeight (Projectivization.mk K x hx) := by sorry
/-- Test `weilHeight.test_not_pointwise`: `h` and `h + 1` have the same class. -/
example (X : Type u) (h : X → ℝ) : HeightClass.mk h = HeightClass.mk (h + fun _ => 1) := by sorry

/-! ### RP.0/height-positivity-base-locus and RP.0/northcott-ample -/

/-- `TauCeti.weilHeight_bddBelow_off_baseLocus` (RP.0/height-positivity-base-locus). -/
theorem weilHeight_bddBelow_off_baseLocus {K : Type u} [Field K] [GeneralizedGlobalField K]
    (X : Over (Spec (.of K))) [IsProper X.hom] (L : Pic X.left) (B : Set (barPts X))
    (h : barPts X → ℝ) (hh : HeightClass.mk h = weilHeight X L) :
    BddBelow (h '' Bᶜ) := by sorry

/-! ### RP.0/tate-limit -/

/-- `TauCeti.tateLimit`: a real body, the telescoping series `f + Σ d^{-(m+1)} (f∘φ^{m+1} − d f∘φ^m)`. -/
def tateLimit {S : Type u} (φ : S → S) (d : ℝ) (f : S → ℝ) (s : S) : ℝ :=
  f s + ∑' m : ℕ, (d⁻¹) ^ (m + 1) * (f (φ^[m + 1] s) - d * f (φ^[m] s))

section TateLimit
variable {S : Type u} (φ : S → S) {d : ℝ} (f : S → ℝ)

/-- `TauCeti.tendsto_tateLimit`. -/
theorem tendsto_tateLimit (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    Filter.Tendsto (fun m : ℕ => (d⁻¹) ^ m * f (φ^[m] s)) Filter.atTop
      (nhds (tateLimit φ d f s)) := by sorry

/-- `TauCeti.abs_tateLimit_sub_le`. -/
theorem abs_tateLimit_sub_le (hd : 1 < d) {C : ℝ} (hf : ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    |tateLimit φ d f s - f s| ≤ C / (d - 1) := by sorry

/-- `TauCeti.tateLimit_comp`. -/
theorem tateLimit_comp (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    tateLimit φ d f (φ s) = d * tateLimit φ d f s := by sorry

/-- `TauCeti.tateLimit_unique`. -/
theorem tateLimit_unique (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (g : S → ℝ)
    (hg : ∀ s, g (φ s) = d * g s) (hb : ∃ C, ∀ s, |g s - f s| ≤ C) :
    g = tateLimit φ d f := by sorry

/-- `TauCeti.tateLimit_congr_bounded`. -/
theorem tateLimit_congr_bounded (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C)
    (f' : S → ℝ) (hb : ∃ C, ∀ s, |f' s - f s| ≤ C) :
    tateLimit φ d f' = tateLimit φ d f := by sorry

end TateLimit

/-- Test `tateLimit.test_constant`. -/
example : tateLimit (id : ℕ → ℕ) 2 (fun _ => 1) = fun _ => 0 := by sorry
/-- Test `tateLimit.test_exact`. -/
example {S : Type u} (φ : S → S) (d : ℝ) (f : S → ℝ) (h : ∀ s, f (φ s) = d * f s) :
    tateLimit φ d f = f := by sorry
/-- Test `tateLimit.test_elliptic`. -/
example {F : Type u} [Field F] [AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] :
    tateLimit (fun P : W.Point => 2 • P) 4 (fun P => P.naiveHeight / 2) =
      fun P => P.canonicalHeight := by sorry
/-- Test `tateLimit.test_d_one`: for `d = 1` the normalised iterates need not converge. -/
example : ¬ ∃ l : ℝ, Filter.Tendsto (fun m : ℕ => ((1 : ℝ)⁻¹) ^ m * ((Nat.succ^[m] 0 : ℕ) : ℝ))
    Filter.atTop (nhds l) := by sorry

/-! ### RP.0/neron-tate-height -/

/-- Points of an abelian variety over a field extension, as an additive group. -/
abbrev AbelianVariety.Points {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (L : Type u) [Field L] [Algebra K L] : Type u :=
  Additive (Pts A.toOver L)

section NeronTate
variable {K : Type u} [Field K] [GeneralizedGlobalField K]
  (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

/-- `TauCeti.neronTateHeight`: `ĥ_{K,L}` on `A(K̄)` for a line bundle `L`. -/
def neronTateHeight (L : Pic A.toScheme) : AbelianVariety.Points A (AlgebraicClosure K) → ℝ := sorry

variable {A}

/-- Stand-in for pullback of line-bundle classes along `[−1]` (AbelianSchemesAndArithmeticModuli
A1; Tau Ceti has no pullback of line-bundle classes at the pin). -/
def negPullback (A : TauCeti.AlgebraicGeometry.AbelianVariety K) : Pic A.toScheme →+ Pic A.toScheme :=
  sorry

/-- Symmetric line bundles: `[−1]* L ≅ L`. -/
def IsSymmetric (L : Pic A.toScheme) : Prop := negPullback A L = L

/-- `TauCeti.neronTateHeight_mem_weilHeight`. -/
theorem neronTateHeight_mem_weilHeight [IsProper A.toOver.hom] (L : Pic A.toScheme) :
    HeightClass.mk (neronTateHeight A L) = weilHeight A.toOver L := by sorry

/-- `TauCeti.neronTateHeight_zero`. -/
@[simp] theorem neronTateHeight_zero (L : Pic A.toScheme) : neronTateHeight A L 0 = 0 := by sorry

/-- `TauCeti.neronTateHeight_tensor`. -/
theorem neronTateHeight_tensor (L M : Pic A.toScheme) :
    neronTateHeight A (L + M) = neronTateHeight A L + neronTateHeight A M := by sorry

/-- `TauCeti.neronTateHeight_nsmul`. -/
theorem neronTateHeight_nsmul (L : Pic A.toScheme) (hL : IsSymmetric L) (n : ℤ) (a) :
    neronTateHeight A L (n • a) = (n : ℝ) ^ 2 * neronTateHeight A L a := by sorry

/-- `TauCeti.neronTateHeight_parallelogram`. -/
theorem neronTateHeight_parallelogram (L : Pic A.toScheme) (hL : IsSymmetric L) (a b) :
    neronTateHeight A L (a + b) + neronTateHeight A L (a - b) =
      2 * neronTateHeight A L a + 2 * neronTateHeight A L b := by sorry

/-- `TauCeti.neronTateHeight_add_of_antisymm`. -/
theorem neronTateHeight_add_of_antisymm (L : Pic A.toScheme) (hL : negPullback A L + L = 0) (a b) :
    neronTateHeight A L (a + b) = neronTateHeight A L a + neronTateHeight A L b := by sorry

/-- `TauCeti.neronTateHeight_eq_of_algEquiv`. -/
theorem neronTateHeight_eq_of_algEquiv (L L' : Pic A.toScheme) (hL : IsSymmetric L)
    (hL' : IsSymmetric L') (halg : ∃ M : Pic A.toScheme, L' = L + M ∧ negPullback A M + M = 0) :
    neronTateHeight A L = neronTateHeight A L' := by sorry

/-- `TauCeti.neronTateHeight_quadraticMap`. -/
def neronTateHeight_quadraticMap (L : Pic A.toScheme) (hL : IsSymmetric L) : QuadraticMap ℤ (AbelianVariety.Points A (AlgebraicClosure K)) ℝ :=
  sorry

end NeronTate

/-- Test `neronTateHeight.test_trivial`. -/
example {K : Type u} [Field K] [GeneralizedGlobalField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) : neronTateHeight A 0 = 0 := by sorry
/-- Test `neronTateHeight.test_elliptic` is stated through Tau Ceti's elliptic canonical height:
the comparison map from Weierstrass points to points of the associated abelian variety is
supplied by AbelianSchemesAndArithmeticModuli A0/field-and-elliptic-boundary. -/
example {F : Type u} [Field F] [NumberField F] [DecidableEq F] {W : WeierstrassCurve.Affine F}
    [W.IsElliptic] (P : W.Point) : 0 ≤ P.canonicalHeight := by sorry
/-- Test `neronTateHeight.test_product`: additivity over a product of line bundles. -/
example {K : Type u} [Field K] [GeneralizedGlobalField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (L M : Pic A.toScheme) (a) :
    neronTateHeight A (L + M) a = neronTateHeight A L a + neronTateHeight A M a := by sorry
/-- Test `neronTateHeight.test_torsion_translate`. -/
example {K : Type u} [Field K] [GeneralizedGlobalField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (L : Pic A.toScheme) (hL : IsSymmetric L) (a t)
    (ht : IsOfFinAddOrder t) :
    neronTateHeight A L (a + t) = neronTateHeight A L a := by sorry
/-- Test `neronTateHeight.test_naive_not_quadratic`: for `y² = x³ − 2` and `P = (3, 5)`,
`x(2P) = 129/100`. -/
example : logHeight₁ ((129 : ℚ) / 100) ≠ 4 * logHeight₁ (3 : ℚ) := by sorry

/-! ### RP.0/neron-tate-kernel-number-field and RP.0/neron-tate-bilinear-form -/

/-- `TauCeti.neronTateForm`. -/
def neronTateForm {K : Type u} [Field K] [GeneralizedGlobalField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (L : Pic A.toScheme) :
    LinearMap.BilinMap ℤ (AbelianVariety.Points A (AlgebraicClosure K)) ℝ := sorry

section NeronTateForm
variable {K : Type u} [Field K] [GeneralizedGlobalField K]
  {A : TauCeti.AlgebraicGeometry.AbelianVariety K} (L : Pic A.toScheme)

/-- `TauCeti.neronTateForm_self`. -/
theorem neronTateForm_self (a) : neronTateForm A L a a = 2 * neronTateHeight A L a := by sorry
/-- `TauCeti.neronTateForm_comm`. -/
theorem neronTateForm_comm (a b) : neronTateForm A L a b = neronTateForm A L b a := by sorry
/-- `TauCeti.neronTateForm_torsion`. -/
theorem neronTateForm_torsion (a t) (ht : IsOfFinAddOrder t) : neronTateForm A L a t = 0 := by sorry
/-- `TauCeti.neronTateHeight_sum_le`. -/
theorem neronTateHeight_sum_le {m : ℕ} (x : Fin m → AbelianVariety.Points A (AlgebraicClosure K)) :
    neronTateHeight A L (∑ i, x i) ≤ m * ∑ i, neronTateHeight A L (x i) := by sorry

end NeronTateForm

/-- Test `neronTateForm.test_elliptic`: Tau Ceti's pairing is half of the unhalved form. -/
example {F : Type u} [Field F] [AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P : W.Point) :
    2 * W.neronTatePairing P P = 2 * P.canonicalHeight := by sorry
/-- Test `neronTateForm.test_zero`. -/
example {K : Type u} [Field K] [GeneralizedGlobalField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (L : Pic A.toScheme) (b) :
    neronTateForm A L 0 b = 0 := by sorry
/-- Test `neronTateForm.test_sum_two`. -/
example {K : Type u} [Field K] [GeneralizedGlobalField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (L : Pic A.toScheme) (x y) :
    neronTateHeight A L (x + y) ≤ 2 * neronTateHeight A L x + 2 * neronTateHeight A L y := by sorry
/-- Test `neronTateForm.test_not_definite_on_torsion`. -/
example {K : Type u} [Field K] [GeneralizedGlobalField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (L : Pic A.toScheme) (t)
    (ht : IsOfFinAddOrder t) : neronTateForm A L t t = 0 := by sorry

end TauCeti

/-! ## RP.1: weak Mordell–Weil and descent

Stand-ins (owned elsewhere, absent at the pins): `TauCeti.GaloisH1` is the cohomology of a
discrete Galois module (TauCetiRoadmap EllipticCurves Layer 7 constructor) and
`TauCeti.AbelianVariety.galoisAction` the Galois action on points. Torsion subgroups have real
bodies. -/

open CategoryTheory _root_.AlgebraicGeometry Height
open scoped CategoryTheory.MonObj

noncomputable section
namespace TauCeti
universe u

/-- Stand-in for `H¹(Gal(K̄/K), M)` of a discrete module (EllipticCurves Layer 7). -/
def GaloisH1 (K : Type u) [Field K] (M : Type u) [AddCommGroup M] : Type u := sorry
instance (K : Type u) [Field K] (M : Type u) [AddCommGroup M] :
    AddCommGroup (GaloisH1 K M) := sorry

namespace AbelianVariety
variable {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

/-- The `n`-torsion of `A(L)` (a real body). -/
def torsion (n : ℕ) (L : Type u) [Field L] [Algebra K L] : AddSubgroup (Points A L) :=
  (nsmulAddMonoidHom n : Points A L →+ Points A L).ker

/-- The base-change map `A(K) → A(K̄)` (a stand-in for postcomposition with `Spec K̄ → Spec K`). -/
def toBar : Points A K →+ Points A (AlgebraicClosure K) := sorry

/-! ### RP.1/kummer-map -/

/-- `TauCeti.AbelianVariety.kummer` for `[n]` (for a general isogeny replace `torsion` by its
kernel): `A(K) → H¹(K, A[n])`. -/
def kummer (n : ℕ) : Points A K →+ GaloisH1 K (torsion A n (AlgebraicClosure K)) := sorry

/-- `TauCeti.AbelianVariety.kummer_injective`: the kernel is `nA(K)`. -/
theorem kummer_injective (n : ℕ) :
    (kummer A n).ker = (nsmulAddMonoidHom n : Points A K →+ Points A K).range := by sorry

/-- `TauCeti.AbelianVariety.kummer_eq_torsorClass`: recorded through the fibre description
`δ(b) = 0 ↔ b ∈ nA(K)`. -/
theorem kummer_eq_torsorClass (n : ℕ) (b : Points A K) :
    kummer A n b = 0 ↔ ∃ a, n • a = b := by sorry

/-- `TauCeti.AbelianVariety.kummer_comp`: `δ_{mn}` restricted to `nA(K)`. -/
theorem kummer_comp (m n : ℕ) (b : Points A K) (hb : kummer A (m * n) b = 0) :
    kummer A n b = 0 := by sorry

end AbelianVariety

/-- Test `kummer.test_zero`. -/
example {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (n : ℕ) :
    AbelianVariety.kummer A n 0 = 0 := by sorry
/-- Test `kummer.test_finite_field`: over a finite field every class is a Kummer class. -/
example {K : Type u} [Field K] [Finite K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (n : ℕ) : Function.Surjective (AbelianVariety.kummer A n) := by sorry
/-- Test `kummer.test_elliptic`: for `n = 2` the kernel is `2E(K)`, as for Tau Ceti's descent map. -/
example {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    (AbelianVariety.kummer A 2).ker = (nsmulAddMonoidHom 2 : _ →+ _).range := by sorry
/-- Test `kummer.test_not_surjective`: over `ℚ` the Kummer map is not surjective. -/
example (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (hA : Nontrivial (AbelianVariety.Points A ℚ)) :
    ¬ Function.Surjective (AbelianVariety.kummer A 2) := by sorry

/-! ### RP.1/selmer-group and its theorems -/

namespace AbelianVariety
variable {K : Type u} [Field K] [NumberField K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

/-- `TauCeti.AbelianVariety.kummerSelmerStructure`: local conditions at the places of `K`,
indexed here by finite places (archimedean conditions are part of the structure). -/
def kummerSelmerStructure (n : ℕ) :
    IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K) →
      AddSubgroup (GaloisH1 K (torsion A n (AlgebraicClosure K))) := sorry

/-- `TauCeti.AbelianVariety.selmerGroup`. -/
def selmerGroup (n : ℕ) : AddSubgroup (GaloisH1 K (torsion A n (AlgebraicClosure K))) := sorry

/-- `TauCeti.AbelianVariety.sha`. -/
def sha : AddSubgroup (GaloisH1 K (⊤ : AddSubgroup (Points A (AlgebraicClosure K)))) := sorry

/-- `TauCeti.AbelianVariety.kummer_mem_selmerGroup`. -/
theorem kummer_mem_selmerGroup (n : ℕ) (b : Points A K) : kummer A n b ∈ selmerGroup A n := by
  sorry

/-- `TauCeti.AbelianVariety.descent_exact` (RP.1/descent-sequence): the image of `A(K)` in the
Selmer group is the Kummer image; the quotient is `Ш[n]`. -/
theorem descent_exact (n : ℕ) :
    (kummer A n).range ≤ selmerGroup A n := by sorry

/-- `TauCeti.AbelianVariety.selmerGroup_finite` (RP.1/selmer-finite). -/
theorem selmerGroup_finite (n : ℕ) : Finite (selmerGroup A n) := by sorry

/-- `TauCeti.AbelianVariety.finite_quotient_nsmul` (RP.1/weak-mordell-weil). -/
theorem finite_quotient_nsmul (n : ℕ) :
    Finite (Points A K ⧸ (nsmulAddMonoidHom n : Points A K →+ Points A K).range) := by sorry

/-- `TauCeti.AbelianVariety.fg_points` (RP.1/mordell-weil). -/
theorem fg_points : AddGroup.FG (Points A K) := by sorry

/-- The torsion subgroup of `A(K)` is finite (RP.1/mordell-weil). -/
theorem finite_torsion : Finite {a : Points A K | IsOfFinAddOrder a} := by sorry

/-- `TauCeti.AbelianVariety.neronTateHeight_posDef` (RP.1/neron-tate-positive-definite), for
symmetric `L` (ampleness is not typed at the pins). -/
theorem neronTateHeight_posDef (L : Pic A.toScheme) (hL : IsSymmetric L) (a : Points A K)
    (ha : ¬ IsOfFinAddOrder a) : 0 < neronTateHeight A L (toBar A a) := by sorry

end AbelianVariety

/-- Test `selmerGroup.test_degree_one`. -/
example {K : Type u} [Field K] [NumberField K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    Subsingleton (AbelianVariety.selmerGroup A 1) := by sorry
/-- Test `selmerGroup.test_congruent_one`: for `y² = x³ − x` over `ℚ`, `#Sel² = 4` (stated for an
abelian variety `E` with four rational `2`-torsion points and rank zero). -/
example (E : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (h1 : E.dim = 1)
    (h2 : Nat.card (AbelianVariety.torsion E 2 ℚ) = 4)
    (h0 : ∀ a : AbelianVariety.Points E ℚ, IsOfFinAddOrder a) :
    Nat.card (AbelianVariety.selmerGroup E 2) ≥ 4 := by sorry
/-- Test `selmerGroup.test_elliptic`. -/
example (E : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (h1 : E.dim = 1) :
    Finite (AbelianVariety.selmerGroup E 2) := by sorry
/-- Test `selmerGroup.test_selmer_not_rank`: the Kummer image can be a proper subgroup. -/
example : ∃ E : TauCeti.AlgebraicGeometry.AbelianVariety ℚ,
    (AbelianVariety.kummer E 2).range < AbelianVariety.selmerGroup E 2 := by sorry

/-! ### RP.1/local-kummer-image-unramified, local-division-index, reduction-torsion-injective -/

/-- `TauCeti.AbelianVariety.card_quotient_two_padic` (RP.1/local-division-index): over a finite
extension `F/ℚ_p`, `#A(F)/2A(F) = |2|_F^{-g} · #A(F)[2]`, stated for `F = ℚ_p`. -/
theorem AbelianVariety.card_quotient_two_padic (p : ℕ) [Fact p.Prime]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ_[p]) (g : ℕ) (hg : A.dim = g) :
    Nat.card (AbelianVariety.Points A ℚ_[p] ⧸
        (nsmulAddMonoidHom 2 : AbelianVariety.Points A ℚ_[p] →+ _).range) =
      (if p = 2 then 2 ^ g else 1) * Nat.card (AbelianVariety.torsion A 2 ℚ_[p]) := by sorry

/-- `TauCeti.AbelianVariety.card_quotient_two_real` (RP.1/local-division-index, real case). -/
theorem AbelianVariety.card_quotient_two_real (A : TauCeti.AlgebraicGeometry.AbelianVariety ℝ)
    (g : ℕ) (hg : A.dim = g) :
    Nat.card (AbelianVariety.Points A ℝ ⧸
        (nsmulAddMonoidHom 2 : AbelianVariety.Points A ℝ →+ _).range) * 2 ^ g =
      Nat.card (AbelianVariety.torsion A 2 ℝ) := by sorry

/-! ### RP.1/kk-trace, lang-neron, function-field-neron-tate-kernel -/

/-- `TauCeti.AbelianVariety.trace`: the `K/k`-trace, an abelian variety over `k`. -/
def AbelianVariety.trace {k K : Type u} [Field k] [Field K] [Algebra k K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) : TauCeti.AlgebraicGeometry.AbelianVariety k :=
  sorry

/-- `TauCeti.AbelianVariety.traceMap` on points: `Tr(k) → A(K)`. -/
def AbelianVariety.traceMap {k K : Type u} [Field k] [Field K] [Algebra k K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    AbelianVariety.Points (AbelianVariety.trace (k := k) A) k →+ AbelianVariety.Points A K := sorry

section Trace
variable {k K : Type u} [Field k] [Field K] [Algebra k K]
  (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

/-- `TauCeti.AbelianVariety.trace_universal`, on points: maps from constant abelian varieties
factor through the trace (recorded for the map on `k`-points). -/
theorem AbelianVariety.trace_universal (C : TauCeti.AlgebraicGeometry.AbelianVariety k)
    (f : AbelianVariety.Points C k →+ AbelianVariety.Points A K) :
    ∃ g : AbelianVariety.Points C k →+ AbelianVariety.Points (AbelianVariety.trace (k := k) A) k,
      f = (AbelianVariety.traceMap A).comp g := by sorry

/-- `TauCeti.AbelianVariety.traceMap_ker_finite`. -/
theorem AbelianVariety.traceMap_ker_finite [CharZero k] :
    (AbelianVariety.traceMap (k := k) A).ker = ⊥ := by sorry

/-- `TauCeti.AbelianVariety.fg_points_mod_trace` (RP.1/lang-neron). -/
theorem AbelianVariety.fg_points_mod_trace [Algebra.EssFiniteType k K] :
    AddGroup.FG (AbelianVariety.Points A K ⧸ (AbelianVariety.traceMap (k := k) A).range) := by sorry

/-- `TauCeti.AbelianVariety.neronTateHeight_eq_zero_iff_trace` (RP.1/function-field-neron-tate-kernel),
for the generalized global field of a polarization and symmetric `L` (ampleness untyped). -/
theorem AbelianVariety.neronTateHeight_eq_zero_iff_trace (P : Polarization k K)
    (L : Pic A.toScheme) (hL : IsSymmetric L) (a : AbelianVariety.Points A K) :
    (letI := GeneralizedGlobalField.ofPolarization P;
      neronTateHeight A L (AbelianVariety.toBar A a)) = 0 ↔
      ∃ t ∈ (AbelianVariety.traceMap (k := k) A).range, IsOfFinAddOrder (a - t) := by sorry

end Trace

/-- Test `trace.test_zero`. -/
example {k K : Type u} [Field k] [Field K] [Algebra k K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (h : A.dim = 0) :
    (AbelianVariety.trace (k := k) A).dim = 0 := by sorry
/-- Test `trace.test_nonisotrivial_elliptic`: trace zero gives finitely generated points. -/
example (E : TauCeti.AlgebraicGeometry.AbelianVariety (RatFunc ℂ))
    (h : (AbelianVariety.trace (k := ℂ) E).dim = 0) : AddGroup.FG (AbelianVariety.Points E (RatFunc ℂ)) := by
  sorry

/-! ### RP.1/two-coverings, w2-odd-factorizations, selmer-set-two-covering -/

/-- `TauCeti.Hyperelliptic.W2`: the class `W[2]` of `y² = f(x)` in `H¹(K, J[2])`, for the
Jacobian `J` (an abelian variety supplied with the curve). -/
def Hyperelliptic.W2 {K : Type u} [Field K] (f : Polynomial K)
    (J : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    GaloisH1 K (AbelianVariety.torsion J 2 (AlgebraicClosure K)) := sorry

/-- `TauCeti.Hyperelliptic.W2_eq_zero_of_odd_factor` (RP.1/w2-odd-factorizations, the direction
that holds without the conjugate-pair case): a `K`-rational factorisation into odd-degree factors
gives a `K`-point of the torsor of halves of the hyperelliptic class, so `W[2] = 0`. -/
theorem Hyperelliptic.W2_eq_zero_of_odd_factor {K : Type u} [Field K] (f : Polynomial K)
    (J : TauCeti.AlgebraicGeometry.AbelianVariety K) (hf : Squarefree f) (hdeg : Even f.natDegree)
    (hodd : ∃ g h : Polynomial K, f = g * h ∧ Odd g.natDegree) : Hyperelliptic.W2 f J = 0 := by sorry

/-- `TauCeti.Hyperelliptic.selmerSetOfOrder`: the 2-Selmer set of order `k`, as a subset of
`H¹(K, J[4])` (stand-in coefficients). -/
def Hyperelliptic.selmerSetOfOrder {K : Type u} [Field K] (f : Polynomial K)
    (J : TauCeti.AlgebraicGeometry.AbelianVariety K) (k : ℕ) :
    Set (GaloisH1 K (AbelianVariety.torsion J 4 (AlgebraicClosure K))) := sorry

/-- Test `W2.test_rational_point`: an odd-degree factor (a rational Weierstrass point when
`deg g = 1`) kills `W[2]`. -/
example {K : Type u} [Field K] (f : Polynomial K) (J : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (a : K) (hf : Squarefree f) (hdeg : Even f.natDegree) (ha : f.IsRoot a) :
    Hyperelliptic.W2 f J = 0 := by sorry

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
      Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 - 1 : MvPolynomial (Fin 2) R)}) B ≃ₜ Bˣ := sorry

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
    Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 - 1 : MvPolynomial (Fin 2) ℤ)}) ℝ ≃ₜ {x : ℝ // x ≠ 0}) := by sorry
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
      Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 - 1 : MvPolynomial (Fin 2) K)}) ≃ₜ
        (NumberField.AdeleRing (NumberField.RingOfIntegers K) K)ˣ) := by sorry
-- TauCeti.AdelicPoints.tests.no_real_point
example : IsEmpty (AdelicPoints ℚ (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X ^ 2 + 1 : Polynomial ℚ)})) := by sorry
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
example [IsAzumaya ℚ (Quaternion ℚ)] :
    BrauerManin.eval (Quaternion ℚ) (Points.ofAlgHom (Algebra.ofId ℚ ℝ) : Points ℚ ℚ ℝ) ≠ 1 := by sorry
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

/-- RP.2/brauer-evaluation-finite-support. -/
theorem finite_eval_ne_one (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜] (x : AdelicPoints K A) :
    Set.Finite {v : HeightOneSpectrum (𝓞 K) | eval 𝒜 (AdelicPoints.finiteProj K A v x) ≠ 1} := by
  sorry

/-- RP.2/brauer-manin-pairing. -/
def pairing (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜] (x : AdelicPoints K A) :
    AddCircle (1 : ℚ) := sorry

def brauerSet (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜] : Set (AdelicPoints K A) :=
  {x | pairing K A 𝒜 x = 0}

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
example : ¬ ((Nonempty (AdelicPoints ℚ (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X ^ 2 + 1 : Polynomial ℚ)}))) ∧
    BrauerManin.brauerManinSet ℚ (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X ^ 2 + 1 : Polynomial ℚ)}) = ∅) := by
  sorry
-- TauCeti.BrauerManin.tests.brauer_set_subset
example (K : Type) [Field K] [NumberField K] (A : Type) [CommRing A] [Algebra K A]
    [Algebra.FiniteType K A] (𝒜 : Type) [Ring 𝒜] [Algebra A 𝒜] [IsAzumaya A 𝒜] :
    BrauerManin.brauerManinSet K A ⊆ BrauerManin.brauerSet K A 𝒜 := by sorry

end Brauer
end TauCeti

/-! ## RP.2 (continued): adelic points of schemes and Brauer–Manin obstructions

Stand-ins: `TauCeti.SchemeBrauer` for SchemeAndStackFoundations `key/scheme-brauer` (Azumaya
Brauer group of a scheme); `TauCeti.adelicPoints` for the glued adelic points of a separated
scheme of finite type (the affine case is `TauCeti.AdelicPoints` above, with a real body);
`TauCeti.localInv` for the ClassFieldTheory Layer 5 local invariant at an arbitrary place. -/

open CategoryTheory _root_.AlgebraicGeometry NumberField IsDedekindDomain
open scoped CategoryTheory.MonObj

noncomputable section
namespace TauCeti
universe u

/-- Stand-in for SchemeAndStackFoundations `key/scheme-brauer`. -/
def SchemeBrauer (X : Scheme.{u}) : Type u := sorry
instance (X : Scheme.{u}) : CommGroup (SchemeBrauer X) := sorry
/-- Stand-in for SchemeAndStackFoundations SF.2/pullback. -/
def SchemeBrauer.pullback {X Y : Scheme.{u}} (f : X ⟶ Y) : SchemeBrauer Y →* SchemeBrauer X :=
  sorry

/-! ### RP.2/adelic-points-general -/

/-- `TauCeti.adelicPoints`: `X(𝔸_K)` for `X` separated of finite type over a number field. -/
def adelicPoints (K : Type u) [Field K] [NumberField K] (X : Over (Spec (.of K))) : Type u := sorry
instance (K : Type u) [Field K] [NumberField K] (X : Over (Spec (.of K))) :
    TopologicalSpace (adelicPoints K X) := sorry

namespace adelicPoints
variable {K : Type u} [Field K] [NumberField K] (X : Over (Spec (.of K)))

/-- `TauCeti.adelicPoints.diagonal`. -/
def diagonal : Pts X K → adelicPoints K X := sorry
/-- `TauCeti.adelicPoints.proj` at a finite place. -/
def proj (v : HeightOneSpectrum (𝓞 K)) : adelicPoints K X → Pts X (v.adicCompletion K) := sorry
/-- `TauCeti.adelicPoints.map`. -/
def map {Y : Over (Spec (.of K))} (f : X ⟶ Y) : C(adelicPoints K X, adelicPoints K Y) := sorry
/-- `TauCeti.adelicPoints.homeomorph_pi_of_proper`: for proper `X`, the product of local points
(finite places shown; archimedean factors analogous). -/
def homeomorph_pi_of_proper [IsProper X.hom] :
    adelicPoints K X ≃ (Π v : HeightOneSpectrum (𝓞 K), Pts X (v.adicCompletion K)) ×
      (Π w : InfinitePlace K, Pts X w.Completion) := sorry
/-- `TauCeti.adelicPoints.isOpenEmbedding_of_open`. -/
theorem isOpenEmbedding_of_open {U : Over (Spec (.of K))} (j : U ⟶ X)
    (hj : IsOpenImmersion j.left) : Topology.IsOpenEmbedding (map U j) := by sorry
/-- `TauCeti.adelicPoints.isClosedEmbedding_of_closed`. -/
theorem isClosedEmbedding_of_closed {Z : Over (Spec (.of K))} (i : Z ⟶ X)
    (hi : IsClosedImmersion i.left) : Topology.IsClosedEmbedding (map Z i) := by sorry

end adelicPoints

/-- Test `adelicPoints.test_point`. -/
example (K : Type u) [Field K] [NumberField K] :
    Subsingleton (adelicPoints K (Over.mk (𝟙 (Spec (.of K))))) := by sorry

/-! ### RP.2/scheme-brauer-evaluation -/

/-- `TauCeti.SchemeBrauer.eval`: `α(x) ∈ Br(L)` for `x ∈ X(L)`, in Mathlib's Brauer group of
central simple `L`-algebras (Tau Ceti group structure). -/
def SchemeBrauer.eval {K : Type u} [Field K] {X : Over (Spec (.of K))} (L : Type u) [Field L]
    [Algebra K L] : SchemeBrauer X.left → Pts X L → BrauerGroup.{u, u} L := sorry

section Eval
variable {K : Type u} [Field K] {X : Over (Spec (.of K))} (L : Type u) [Field L] [Algebra K L]

/-- `TauCeti.SchemeBrauer.eval_mul`. -/
theorem SchemeBrauer.eval_mul (α β : SchemeBrauer X.left) (x : Pts X L) :
    SchemeBrauer.eval L (α * β) x = SchemeBrauer.eval L α x * SchemeBrauer.eval L β x := by sorry
/-- `TauCeti.SchemeBrauer.eval_pullback`. -/
theorem SchemeBrauer.eval_pullback {Y : Over (Spec (.of K))} (f : X ⟶ Y) (α : SchemeBrauer Y.left)
    (x : Pts X L) :
    SchemeBrauer.eval L (SchemeBrauer.pullback f.left α) x = SchemeBrauer.eval L α (x ≫ f) := by sorry
/-- `TauCeti.SchemeBrauer.eval_baseChange`. -/
theorem SchemeBrauer.eval_baseChange (L' : Type u) [Field L'] [Algebra K L'] [Algebra L L']
    [IsScalarTower K L L'] (α : SchemeBrauer X.left) (x : Pts X L)
    (j : Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K L'))) ⟶
      Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K L))))
    (hj : j.left = Spec.map (CommRingCat.ofHom (algebraMap L L'))) :
    SchemeBrauer.eval L' α (j ≫ x) =
      TauCeti.BrauerGroup.baseChange L L' (SchemeBrauer.eval L α x) := by sorry
/-- `TauCeti.SchemeBrauer.eval_constant`. -/
theorem SchemeBrauer.eval_one (x : Pts X L) : SchemeBrauer.eval L 1 x = 1 := by sorry

end Eval

/-! ### RP.2/brauer-local-constancy, brauer-manin-general, brauer-manin-set-closed -/

/-- Stand-in for the ClassFieldTheory Layer 5 local invariant at a finite place, on Brauer groups
of completions. -/
def localInv {K : Type u} [Field K] [NumberField K] (v : HeightOneSpectrum (𝓞 K)) :
    BrauerGroup.{u, u} (v.adicCompletion K) →* Multiplicative (AddCircle (1 : ℚ)) := sorry

/-- `TauCeti.SchemeBrauer.eval_locallyConstant` (RP.2/brauer-local-constancy), at a finite place. -/
theorem SchemeBrauer.eval_locallyConstant {K : Type u} [Field K] [NumberField K]
    {X : Over (Spec (.of K))} (v : HeightOneSpectrum (𝓞 K)) (α : SchemeBrauer X.left)
    [TopologicalSpace (Pts X (v.adicCompletion K))] :
    IsLocallyConstant (SchemeBrauer.eval (v.adicCompletion K) α) := by sorry

/-- Stand-in for the local invariant at an infinite place (ClassFieldTheory Layer 5). -/
def localInvInf {K : Type u} [Field K] [NumberField K] (w : InfinitePlace K) :
    BrauerGroup.{u, u} w.Completion →* Multiplicative (AddCircle (1 : ℚ)) := sorry

/-- `TauCeti.brauerManinPairing`. -/
def brauerManinPairing {K : Type u} [Field K] [NumberField K] (X : Over (Spec (.of K))) :
    adelicPoints K X → SchemeBrauer X.left →* Multiplicative (AddCircle (1 : ℚ)) := sorry

/-- `TauCeti.brauerManinSet`. -/
def brauerManinSet {K : Type u} [Field K] [NumberField K] (X : Over (Spec (.of K)))
    (B : Subgroup (SchemeBrauer X.left)) : Set (adelicPoints K X) :=
  {x | ∀ α ∈ B, brauerManinPairing X x α = 1}

section BM
variable {K : Type u} [Field K] [NumberField K] (X : Over (Spec (.of K)))

/-- `TauCeti.brauerManinPairing_diagonal`. -/
theorem brauerManinPairing_diagonal (x : Pts X K) (α : SchemeBrauer X.left) :
    brauerManinPairing X (adelicPoints.diagonal X x) α = 1 := by sorry
/-- `TauCeti.brauerManinPairing_constant`. -/
theorem brauerManinPairing_constant (β : SchemeBrauer (Spec (.of K))) (x : adelicPoints K X) :
    brauerManinPairing X x (SchemeBrauer.pullback X.hom β) = 1 := by sorry
/-- `TauCeti.brauerManinSet_antitone`. -/
theorem brauerManinSet_antitone {B B' : Subgroup (SchemeBrauer X.left)} (h : B ≤ B') :
    brauerManinSet X B' ⊆ brauerManinSet X B := by sorry
/-- `TauCeti.brauerManinPairing_continuous`. -/
theorem brauerManinPairing_continuous (α : SchemeBrauer X.left) :
    IsLocallyConstant (fun x => brauerManinPairing X x α) := by sorry
/-- `TauCeti.brauerManinSet_affine`: on affine `X` it is the set of `BrauerManin.brauerManinSet`
(recorded as diagonal membership). -/
theorem brauerManinSet_affine (x : Pts X K) :
    adelicPoints.diagonal X x ∈ brauerManinSet X ⊤ := by sorry
/-- `TauCeti.isClosed_brauerManinSet` (RP.2/brauer-manin-set-closed). -/
theorem isClosed_brauerManinSet (B : Subgroup (SchemeBrauer X.left)) :
    IsClosed (brauerManinSet X B) := by sorry
/-- `TauCeti.closure_diagonal_subset` (RP.2/brauer-manin-set-closed). -/
theorem closure_diagonal_subset :
    closure (Set.range (adelicPoints.diagonal X)) ⊆ brauerManinSet X ⊤ := by sorry
/-- `TauCeti.brauerManinSet_map` (RP.2/brauer-manin-functoriality). -/
theorem brauerManinSet_map {Y : Over (Spec (.of K))} (f : X ⟶ Y) (B : Subgroup (SchemeBrauer Y.left)) :
    adelicPoints.map X f '' brauerManinSet X (B.map (SchemeBrauer.pullback f.left)) ⊆
      brauerManinSet Y B := by sorry

end BM

/-- Test `brauerManinSet.test_empty_B`. -/
example {K : Type u} [Field K] [NumberField K] (X : Over (Spec (.of K))) :
    brauerManinSet X ⊥ = Set.univ := by sorry

/-! ### RP.2/algebraic-brauer-group, unramified-brauer-group, b-omega -/

/-- `TauCeti.brauerZero`: the image of `Br K`. -/
def brauerZero {K : Type u} [Field K] (X : Over (Spec (.of K))) : Subgroup (SchemeBrauer X.left) :=
  (SchemeBrauer.pullback X.hom).range

/-- `TauCeti.brauerOne`: the kernel of base change to `K̄`, for a supplied base-change map. -/
def brauerOne {K : Type u} [Field K] (X : Over (Spec (.of K))) {Xbar : Scheme.{u}}
    (p : Xbar ⟶ X.left) : Subgroup (SchemeBrauer X.left) :=
  (SchemeBrauer.pullback p).ker

/-- `TauCeti.brauerZero_le_brauerOne`, when `p` factors through `Spec K̄`. -/
theorem brauerZero_le_brauerOne {K : Type u} [Field K] (X : Over (Spec (.of K))) {Xbar : Scheme.{u}}
    (p : Xbar ⟶ X.left) (q : Xbar ⟶ Spec (.of (AlgebraicClosure K)))
    (hq : p ≫ X.hom = q ≫ Spec.map (CommRingCat.ofHom (algebraMap K (AlgebraicClosure K)))) :
    brauerZero X ≤ brauerOne X p := by sorry

/-- `TauCeti.brauerManinPairing_brauerZero`. -/
theorem brauerManinPairing_brauerZero {K : Type u} [Field K] [NumberField K]
    (X : Over (Spec (.of K))) (x : adelicPoints K X) (α) (hα : α ∈ brauerZero X) :
    brauerManinPairing X x α = 1 := by sorry

/-- `TauCeti.brauerZero_injective_of_point`. -/
theorem brauerZero_injective_of_point {K : Type u} [Field K] (X : Over (Spec (.of K)))
    (x : Pts X K) : Function.Injective (SchemeBrauer.pullback X.hom) := by sorry

/-- Test `brauerOne.test_point`. -/
example (K : Type u) [Field K] :
    brauerZero (Over.mk (𝟙 (Spec (.of K)))) = ⊤ := by sorry

/-! ### RP.2/cyclic-norm-class, cyclic-norm-one-place, product-norm-assembly -/

/-- `TauCeti.cyclicAlgebraClass`: the class of the cyclic algebra `(χ, a)` for a cyclic
extension `L/F` of degree `r` with a chosen generator `σ` of its Galois group. -/
def cyclicAlgebraClass (F L : Type u) [Field F] [Field L] [Algebra F L] [IsGalois F L]
    (σ : L ≃ₐ[F] L) (a : Fˣ) : BrauerGroup.{u, u} F := sorry

section Cyclic
variable (F L : Type u) [Field F] [Field L] [Algebra F L] [IsGalois F L] [FiniteDimensional F L]
  (σ : L ≃ₐ[F] L) (hσ : ∀ τ : L ≃ₐ[F] L, τ ∈ Subgroup.zpowers σ)

/-- `TauCeti.cyclicAlgebraClass_eq_one_iff`: split exactly when `a` is a norm. -/
theorem cyclicAlgebraClass_eq_one_iff (a : Fˣ) :
    cyclicAlgebraClass F L σ a = 1 ↔ ∃ b : L, Algebra.norm F b = a := by sorry
/-- `TauCeti.cyclicAlgebraClass_mul`. -/
theorem cyclicAlgebraClass_mul (a b : Fˣ) :
    cyclicAlgebraClass F L σ (a * b) = cyclicAlgebraClass F L σ a * cyclicAlgebraClass F L σ b := by
  sorry
/-- `TauCeti.cyclicAlgebraClass_inv`: killed by the degree. -/
theorem cyclicAlgebraClass_inv (a : Fˣ) :
    cyclicAlgebraClass F L σ a ^ Module.finrank F L = 1 := by sorry

end Cyclic

/-- Test `cyclicAlgebraClass.test_one`. -/
example (F L : Type u) [Field F] [Field L] [Algebra F L] [IsGalois F L] (σ : L ≃ₐ[F] L) :
    cyclicAlgebraClass F L σ 1 = 1 := by sorry

/-- `TauCeti.isNorm_of_local_norm_off_one_place` (RP.2/cyclic-norm-one-place), recorded for the
finite places: an element that is a local norm at all finite places but one, and at every
archimedean place, is a global norm. The local norm conditions are stated through the local
invariant stand-in. -/
theorem isNorm_of_local_norm_off_one_place (K : Type u) [Field K] [NumberField K] (L : Type u)
    [Field L] [Algebra K L] [IsGalois K L] [FiniteDimensional K L] (σ : L ≃ₐ[K] L)
    (hσ : ∀ τ : L ≃ₐ[K] L, τ ∈ Subgroup.zpowers σ) (a : Kˣ) (v₀ : HeightOneSpectrum (𝓞 K))
    (hloc : ∀ v ≠ v₀, localInv v (TauCeti.BrauerGroup.baseChange K (v.adicCompletion K)
      (cyclicAlgebraClass K L σ a)) = 1)
    (hinf : ∀ w : InfinitePlace K, localInvInf w (TauCeti.BrauerGroup.baseChange K w.Completion
      (cyclicAlgebraClass K L σ a)) = 1) :
    ∃ b : L, Algebra.norm K b = a := by sorry

end TauCeti

/-! ## RP.3: torsor descent and comparison of obstructions

Stand-in: `TauCeti.TorsorH1 X G` for the pointed set of fppf `G`-torsor classes over a scheme
(SchemeAndStackFoundations SF.1/torsor-cohomology), with its evaluation at points. -/

open CategoryTheory _root_.AlgebraicGeometry NumberField IsDedekindDomain
open scoped CategoryTheory.MonObj

noncomputable section
namespace TauCeti
universe u

/-- Stand-in for SF.1/torsor-cohomology: classes of `G`-torsors over `X`, for a group scheme `G`
over the base field given as a group object over `Spec K`. -/
def TorsorH1 {K : Type u} [Field K] (X : Over (Spec (.of K))) (G : Over (Spec (.of K)))
    [GrpObj G] : Type u := sorry

/-- Stand-in: `H¹(L, G)` for a field extension `L/K`. -/
def FieldH1 {K : Type u} [Field K] (L : Type u) [Field L] [Algebra K L] (G : Over (Spec (.of K)))
    [GrpObj G] : Type u := sorry
instance {K : Type u} [Field K] (L : Type u) [Field L] [Algebra K L] (G : Over (Spec (.of K)))
    [GrpObj G] : Inhabited (FieldH1 L G) := ⟨sorry⟩

namespace Torsor
variable {K : Type u} [Field K] {X : Over (Spec (.of K))} {G : Over (Spec (.of K))} [GrpObj G]

/-- `TauCeti.Torsor.eval` (RP.3/torsor-evaluation). -/
def eval (ζ : TorsorH1 X G) (L : Type u) [Field L] [Algebra K L] : Pts X L → FieldH1 L G := sorry

/-- `TauCeti.Torsor.twist`: the twisted torsor class `ζ^τ` (under the inner form, recorded with
the same `G` for commutative `G`). -/
def twist (ζ : TorsorH1 X G) (τ : FieldH1 K G) : TorsorH1 X G := sorry

/-- Stand-in for pullback of torsor classes along `f : Y → X` (SF.1). -/
def pullback {Y : Over (Spec (.of K))} (f : Y ⟶ X) : TorsorH1 X G → TorsorH1 Y G := sorry

/-- Stand-in: the image `f(Z(K)) ⊆ X(K)` of the rational points of the total space. -/
def image (ζ : TorsorH1 X G) : Set (Pts X K) := sorry

/-- `TauCeti.Torsor.eval_pullback`. -/
theorem eval_pullback {Y : Over (Spec (.of K))} (f : Y ⟶ X) (ζ : TorsorH1 X G)
    (L : Type u) [Field L] [Algebra K L] (y : Pts Y L) :
    eval (pullback f ζ) L y = eval ζ L (y ≫ f) := by sorry

/-- `TauCeti.Torsor.twist_twist`: twisting by the trivial class is the identity. -/
theorem twist_default (ζ : TorsorH1 X G) : twist ζ default = ζ := by sorry

/-- `TauCeti.Torsor.eval_eq_trivial_iff` and RP.3/descent-partition (Poonen Theorem 8.4.1):
`x` lies in the image of the twist by `τ` exactly when its fibre class is `τ`. -/
theorem mem_image_twist_iff (ζ : TorsorH1 X G) (τ : FieldH1 K G) (x : Pts X K) :
    x ∈ image (twist ζ τ) ↔ eval ζ K x = τ := by sorry

/-- `TauCeti.Torsor.selmerSet` (RP.3/selmer-set-of-torsor). -/
def selmerSet [NumberField K] (ζ : TorsorH1 X G) : Set (FieldH1 K G) := sorry

/-- `TauCeti.Torsor.selmerSet_finite`. -/
theorem selmerSet_finite [NumberField K] [IsProper X.hom] (ζ : TorsorH1 X G) :
    (selmerSet ζ).Finite := by sorry

/-- `TauCeti.Torsor.rationalPoints_eq_iUnion_selmer`: every rational point has fibre class in
the Selmer set. -/
theorem eval_mem_selmerSet [NumberField K] (ζ : TorsorH1 X G) (x : Pts X K) :
    eval ζ K x ∈ selmerSet ζ := by sorry

end Torsor

/-! ### RP.3/descent-set, etale-brauer-set and their comparisons -/

section Descent
variable {K : Type u} [Field K] [NumberField K] (X : Over (Spec (.of K)))

/-- `TauCeti.descentSet`: `X(𝔸)^f` for a torsor class. -/
def descentSet {G : Over (Spec (.of K))} [GrpObj G] (ζ : TorsorH1 X G) : Set (adelicPoints K X) :=
  sorry

/-- `TauCeti.descentObstructionSet`: `X(𝔸)^{descent}`, the intersection over all torsors under
smooth affine groups (the indexing family of groups is a stand-in parameter). -/
def descentObstructionSet (𝒢 : Type u) (G : 𝒢 → Over (Spec (.of K))) [∀ i, GrpObj (G i)] :
    Set (adelicPoints K X) :=
  ⋂ i, ⋂ ζ : TorsorH1 X (G i), descentSet X ζ

/-- `TauCeti.etaleBrauerSet`: `X(𝔸)^{ét,Br}` (indexing family of finite étale groups as a
stand-in parameter). -/
def etaleBrauerSet (𝒢 : Type u) (G : 𝒢 → Over (Spec (.of K))) [∀ i, GrpObj (G i)] :
    Set (adelicPoints K X) := sorry

/-- `TauCeti.diagonal_mem_descentSet`. -/
theorem diagonal_mem_descentSet {G : Over (Spec (.of K))} [GrpObj G] (ζ : TorsorH1 X G)
    (x : Pts X K) : adelicPoints.diagonal X x ∈ descentSet X ζ := by sorry

/-- `TauCeti.isClosed_descentSet`. -/
theorem isClosed_descentSet [IsProper X.hom] {G : Over (Spec (.of K))} [GrpObj G]
    (ζ : TorsorH1 X G) : IsClosed (descentSet X ζ) := by sorry

/-- `TauCeti.etaleBrauerSet_subset_brauerManinSet`. -/
theorem etaleBrauerSet_subset_brauerManinSet (𝒢 : Type u) (G : 𝒢 → Over (Spec (.of K)))
    [∀ i, GrpObj (G i)] : etaleBrauerSet X 𝒢 G ⊆ brauerManinSet X ⊤ := by sorry

/-- `TauCeti.diagonal_mem_etaleBrauerSet`. -/
theorem diagonal_mem_etaleBrauerSet (𝒢 : Type u) (G : 𝒢 → Over (Spec (.of K)))
    [∀ i, GrpObj (G i)] (x : Pts X K) : adelicPoints.diagonal X x ∈ etaleBrauerSet X 𝒢 G := by sorry

end Descent

end TauCeti

/-! ## RP.4: curves — the Parshin construction, Faltings' theorem and integral points

Stand-in: `TauCeti.Curve.genus` for the arithmetic genus of a proper curve (SchemeAndStackFoundations
SF.3; Tau Ceti has the genus of a function field but not of a scheme at the pin). -/

open CategoryTheory _root_.AlgebraicGeometry
open scoped CategoryTheory.MonObj

noncomputable section
namespace TauCeti
universe u

/-- Stand-in for the genus of a proper curve over a field (SF.3). -/
def Curve.genus {K : Type u} [Field K] (C : Over (Spec (.of K))) : ℕ := sorry

/-- The standing hypotheses on a nice curve: proper, smooth, geometrically irreducible, of
dimension one. -/
class Curve.IsNice {K : Type u} [Field K] (C : Over (Spec (.of K))) : Prop where
  proper : IsProper C.hom
  smooth : Smooth C.hom
  geomIrred : GeometricallyIrreducible C.hom
  dim_eq : topologicalKrullDim C.left = 1

/-- `TauCeti.Curve.finite_surjective_hom` (RP.4/de-franchis). -/
theorem Curve.finite_surjective_hom {K : Type u} [Field K] (C' C : Over (Spec (.of K)))
    [Curve.IsNice C'] [Curve.IsNice C] (hg : 2 ≤ Curve.genus C) :
    {f : C' ⟶ C | Function.Surjective f.left.base}.Finite := by sorry

/-- `TauCeti.Curve.finite_rationalPoints` (RP.4/mordell-faltings; the same declaration as
MordellLawrenceVenkatesh LV.11/faltings-theorem). -/
theorem Curve.finite_rationalPoints {K : Type u} [Field K] [NumberField K] (C : Over (Spec (.of K)))
    [Curve.IsNice C] (hg : 2 ≤ Curve.genus C) : Finite (Pts C K) := by sorry

/-- Test of RP.4/mordell-faltings: genus at least two is needed (`ℙ¹` and positive-rank elliptic
curves have infinitely many points); recorded for a nice curve of genus zero with a point. -/
example {K : Type u} [Field K] [NumberField K] (C : Over (Spec (.of K))) [Curve.IsNice C]
    (hg : Curve.genus C = 0) (P : Pts C K) : Infinite (Pts C K) := by sorry

end TauCeti

/-! ## RP.5: subvarieties of abelian varieties and special sets

Subvarieties are closed immersions into `A`; their `K̄`-points are a subset of `A(K̄)`. Cosets,
stabilizers, the Ueno locus and the essential minimum have real bodies. -/

open CategoryTheory _root_.AlgebraicGeometry
open scoped CategoryTheory.MonObj Pointwise TensorProduct

noncomputable section
namespace TauCeti
universe u

namespace AbelianVariety
variable {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

/-- A closed subvariety of `A`: a closed immersion over `Spec K`. -/
structure ClosedSubvariety where
  carrier : Over (Spec (.of K))
  incl : carrier ⟶ A.toOver
  closed : IsClosedImmersion incl.left

variable {A}

/-- `K̄`-points of a closed subvariety, as a subset of `A(K̄)`. -/
def ClosedSubvariety.points (Y : ClosedSubvariety A) : Set (Points A (AlgebraicClosure K)) :=
  Set.range fun y : Pts Y.carrier (AlgebraicClosure K) => Additive.ofMul (y ≫ Y.incl)

variable (A) in
/-- `TauCeti.AbelianVariety.AbelianSubvariety`: an abelian variety with a closed immersion that
is a homomorphism. -/
structure AbelianSubvariety where
  toAV : TauCeti.AlgebraicGeometry.AbelianVariety K
  incl : toAV.toOver ⟶ A.toOver
  hom : IsMonHom incl
  closed : IsClosedImmersion incl.left

/-- Its `K̄`-points, a subset of `A(K̄)`. -/
def AbelianSubvariety.points (B : AbelianSubvariety A) : Set (Points A (AlgebraicClosure K)) :=
  Set.range fun b : Pts B.toAV.toOver (AlgebraicClosure K) => Additive.ofMul (b ≫ B.incl)

/-- `TauCeti.AbelianVariety.IsCoset`. -/
def IsCoset (Y : ClosedSubvariety A) : Prop :=
  ∃ (B : AbelianSubvariety A) (x : Points A (AlgebraicClosure K)), Y.points = x +ᵥ B.points

/-- `TauCeti.AbelianVariety.IsTorsionCoset`. -/
def IsTorsionCoset (Y : ClosedSubvariety A) : Prop :=
  ∃ (B : AbelianSubvariety A) (x : Points A (AlgebraicClosure K)),
    IsOfFinAddOrder x ∧ Y.points = x +ᵥ B.points

/-- `TauCeti.AbelianVariety.stab` (RP.5/stabilizer), on `K̄`-points. -/
def stab (Y : ClosedSubvariety A) : AddSubgroup (Points A (AlgebraicClosure K)) where
  carrier := {a | a +ᵥ Y.points = Y.points}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- `TauCeti.AbelianVariety.add_stab`. -/
theorem add_stab (Y : ClosedSubvariety A) (a : Points A (AlgebraicClosure K)) (ha : a ∈ stab Y) :
    a +ᵥ Y.points = Y.points := ha

/-- `TauCeti.AbelianVariety.uenoLocus` (RP.5/ueno-locus). -/
def uenoLocus (Y : ClosedSubvariety A) : Set (Points A (AlgebraicClosure K)) :=
  {y | ∃ (B : AbelianSubvariety A) (x : Points A (AlgebraicClosure K)),
    0 < B.toAV.dim ∧ x +ᵥ B.points ⊆ Y.points ∧ y ∈ x +ᵥ B.points}

/-- `TauCeti.AbelianVariety.uenoLocus_translate`. -/
theorem uenoLocus_translate (Y Y' : ClosedSubvariety A) (P : Points A (AlgebraicClosure K))
    (h : Y'.points = (-P) +ᵥ Y.points) : uenoLocus Y' = (-P) +ᵥ uenoLocus Y := by sorry

/-- `TauCeti.AbelianVariety.uenoLocus_subset`. -/
theorem uenoLocus_subset (Y : ClosedSubvariety A) : uenoLocus Y ⊆ Y.points := by sorry

/-- `TauCeti.AbelianVariety.maximalCosets_finite` (Bogomolov; Rémond): the abelian subvarieties
of positive dimension maximal among those with a translate in `Y` have finitely many point sets. -/
theorem maximalCosets_finite (Y : ClosedSubvariety A) :
    {S : Set (Points A (AlgebraicClosure K)) | ∃ B : AbelianSubvariety A, 0 < B.toAV.dim ∧
      S = B.points ∧ (∃ x : Points A (AlgebraicClosure K), x +ᵥ B.points ⊆ Y.points) ∧
      ∀ B' : AbelianSubvariety A, B.points ⊆ B'.points → (∃ x : Points A (AlgebraicClosure K), x +ᵥ B'.points ⊆ Y.points) →
        B'.points = B.points}.Finite := by sorry

/-- `TauCeti.AbelianVariety.manin_mumford` (RP.5/manin-mumford): torsion points of `Y` lie in
finitely many torsion cosets contained in `Y` (characteristic zero). -/
theorem manin_mumford [CharZero K] (Y : ClosedSubvariety A) :
    ∃ T : Set (Points A (AlgebraicClosure K) × AbelianSubvariety A), T.Finite ∧
      (∀ p ∈ T, IsOfFinAddOrder p.1 ∧ p.1 +ᵥ p.2.points ⊆ Y.points) ∧
      {y ∈ Y.points | IsOfFinAddOrder y} ⊆ ⋃ p ∈ T, p.1 +ᵥ p.2.points := by sorry

/-- `TauCeti.AbelianVariety.mordell_lang` (RP.5/mordell-lang): for `Γ` of finite rank,
`Y ∩ Γ` lies in finitely many cosets contained in `Y`. -/
theorem mordell_lang [CharZero K] (Y : ClosedSubvariety A)
    (Γ : AddSubgroup (Points A (AlgebraicClosure K))) (hΓ : FiniteDimensional ℚ (ℚ ⊗[ℤ] Γ)) :
    ∃ T : Set (Points A (AlgebraicClosure K) × AbelianSubvariety A), T.Finite ∧
      (∀ p ∈ T, p.1 +ᵥ p.2.points ⊆ Y.points) ∧
      (Y.points ∩ Γ) ⊆ ⋃ p ∈ T, p.1 +ᵥ p.2.points := by sorry

/-- `TauCeti.AbelianVariety.faltings_subvariety` (RP.5/faltings-subvarieties): over a number
field, `Y(K) ∖ Z(Y)` is finite. -/
theorem faltings_subvariety [NumberField K] (Y : ClosedSubvariety A) :
    ((Y.points ∩ Set.range (toBar A)) \ uenoLocus Y).Finite := by sorry

/-- `TauCeti.AbelianVariety.essentialMinimum` (RP.5/essential-minimum): the supremum over closed
subvarieties `Z` not containing `Y` of the infimum of `ĥ_L` on `Y ∖ Z`. -/
def essentialMinimum [GeneralizedGlobalField K] (L : Pic A.toScheme) (Y : ClosedSubvariety A) : ℝ :=
  ⨆ Z : {Z : ClosedSubvariety A // ¬ Y.points ⊆ Z.points},
    ⨅ y : (Y.points \ Z.1.points : Set _), neronTateHeight A L y

/-- `TauCeti.AbelianVariety.bogomolov` (RP.5/bogomolov): for `Y` irreducible and not a torsion
coset, points of small height lie in a proper closed subvariety. -/
theorem bogomolov [NumberField K] (L : Pic A.toScheme) (hL : IsSymmetric L) (Y : ClosedSubvariety A)
    (hY : IrreducibleSpace Y.carrier.left) (hnt : ¬ IsTorsionCoset Y) :
    ∃ ε > (0 : ℝ), ∃ Z : ClosedSubvariety A, ¬ Y.points ⊆ Z.points ∧
      {y ∈ Y.points | neronTateHeight A L y < ε} ⊆ Z.points := by sorry

variable (A) in
/-- `TauCeti.AbelianVariety.faltingsZhang` (RP.5/faltings-zhang-map), on points. -/
def faltingsZhang (M : ℕ) : (Fin (M + 1) → Points A (AlgebraicClosure K)) →+
    (Fin M → Points A (AlgebraicClosure K)) where
  toFun P := fun i => P i.succ - P 0
  map_zero' := by sorry
  map_add' := by sorry

variable (A) in
/-- `TauCeti.AbelianVariety.faltingsZhang_apply`. -/
theorem faltingsZhang_apply (M : ℕ) (P : Fin (M + 1) → Points A (AlgebraicClosure K)) (i : Fin M) :
    faltingsZhang A M P i = P i.succ - P 0 := rfl

variable (A) in
/-- `TauCeti.AbelianVariety.faltingsZhang_diag`. -/
theorem faltingsZhang_diag (M : ℕ) (P : Points A (AlgebraicClosure K)) :
    faltingsZhang A M (fun _ => P) = 0 := by sorry

end AbelianVariety

/-- Test `faltingsZhang.test_M1`. -/
example {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (P Q : AbelianVariety.Points A (AlgebraicClosure K)) :
    AbelianVariety.faltingsZhang A 1 ![P, Q] 0 = Q - P := by sorry
/-- Test `faltingsZhang.test_kernel`. -/
example {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (M : ℕ)
    (P : Fin (M + 1) → AbelianVariety.Points A (AlgebraicClosure K)) :
    AbelianVariety.faltingsZhang A M P = 0 ↔ ∀ i, P i = P 0 := by sorry

/-! ### RP.5/finite-rank-subgroup -/

/-- `TauCeti.HasFiniteRank`: `Γ ⊗ ℚ` is finite-dimensional. -/
def HasFiniteRank (G : Type u) [AddCommGroup G] : Prop := FiniteDimensional ℚ (ℚ ⊗[ℤ] G)

/-- `TauCeti.HasFiniteRank.of_fg`. -/
theorem HasFiniteRank.of_fg (G : Type u) [AddCommGroup G] (h : AddGroup.FG G) : HasFiniteRank G := by
  sorry

/-- `TauCeti.HasFiniteRank.mono`. -/
theorem HasFiniteRank.mono {G : Type u} [AddCommGroup G] (H : AddSubgroup G) (h : HasFiniteRank G) :
    HasFiniteRank H := by sorry

/-- `TauCeti.finiteRank_iff_le_divisionHull`. -/
theorem finiteRank_iff_le_divisionHull {G : Type u} [AddCommGroup G] (Γ : AddSubgroup G) :
    HasFiniteRank Γ ↔ ∃ Γ₀ : AddSubgroup G, AddGroup.FG Γ₀ ∧
      ∀ x ∈ Γ, ∃ N : ℕ, 0 < N ∧ N • x ∈ Γ₀ := by sorry

/-- Test `HasFiniteRank.test_fg`. -/
example (r : ℕ) : HasFiniteRank (Fin r → ℤ) := by sorry
/-- Test `HasFiniteRank.test_not_fg`. -/
example : HasFiniteRank ℚ ∧ ¬ AddGroup.FG ℚ := by sorry

end TauCeti

/-! ## RP.6: rational-point classification and the register of conjectures -/

open CategoryTheory _root_.AlgebraicGeometry NumberField IsDedekindDomain
open scoped CategoryTheory.MonObj

noncomputable section
namespace TauCeti
universe u

section LocalGlobal
variable {K : Type u} [Field K] [NumberField K] (X : Over (Spec (.of K)))

/-- `TauCeti.IsLocallySoluble`. -/
def IsLocallySoluble : Prop :=
  (∀ v : HeightOneSpectrum (𝓞 K), Nonempty (Pts X (v.adicCompletion K))) ∧
    ∀ w : InfinitePlace K, Nonempty (Pts X w.Completion)

/-- `TauCeti.SatisfiesHassePrinciple`. -/
def SatisfiesHassePrinciple : Prop := Nonempty (adelicPoints K X) → Nonempty (Pts X K)

/-- `TauCeti.adelicPoints_nonempty_iff_locallySoluble`. -/
theorem adelicPoints_nonempty_iff_locallySoluble [IsProper X.hom] :
    Nonempty (adelicPoints K X) ↔ IsLocallySoluble X := by sorry

/-- `TauCeti.IsLocallySoluble.of_rationalPoint`. -/
theorem IsLocallySoluble.of_rationalPoint (x : Pts X K) : IsLocallySoluble X := by sorry

end LocalGlobal

/-- Test `IsLocallySoluble.test_point`. -/
example (K : Type u) [Field K] [NumberField K] :
    IsLocallySoluble (Over.mk (𝟙 (Spec (.of K)))) ∧
      SatisfiesHassePrinciple (Over.mk (𝟙 (Spec (.of K)))) := by sorry

/-- `TauCeti.Curve.genusZero_infinite` (RP.6/genus-zero-classification): a nice genus-zero curve
with a rational point has infinitely many. -/
theorem Curve.genusZero_infinite {K : Type u} [Field K] [NumberField K] (C : Over (Spec (.of K)))
    [Curve.IsNice C] (hg : Curve.genus C = 0) (P : Pts C K) : Infinite (Pts C K) := by sorry

/-- `TauCeti.Curve.genusZero_hasse` (RP.6/genus-zero-classification). -/
theorem Curve.genusZero_hasse {K : Type u} [Field K] [NumberField K] (C : Over (Spec (.of K)))
    [Curve.IsNice C] (hg : Curve.genus C = 0) : SatisfiesHassePrinciple C := by sorry

/-- `TauCeti.Curve.higherGenus_finite` (RP.6/higher-genus-classification). -/
theorem Curve.higherGenus_finite {K : Type u} [Field K] [NumberField K] (C : Over (Spec (.of K)))
    [Curve.IsNice C] (hg : 2 ≤ Curve.genus C) : Finite (Pts C K) :=
  Curve.finite_rationalPoints C hg

/-- `TauCeti.ShaFinitenessConjecture` (RP.6/conjecture-register (d)); no theorem assumes it. -/
def ShaFinitenessConjecture : Prop :=
  ∀ (K : Type u) [Field K] [NumberField K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K),
    Finite (AbelianVariety.sha A)

end TauCeti

/-! ## Further typed API and tests (RP.0, RP.1, RP.2, RP.3, RP.5) -/

open CategoryTheory _root_.AlgebraicGeometry NumberField IsDedekindDomain
open scoped CategoryTheory.MonObj Pointwise

noncomputable section
namespace TauCeti
universe u

/-! ### RP.0: functoriality of Néron–Tate heights, with stand-in pullbacks of line-bundle classes -/

section NTPullback
variable {K : Type u} [Field K] [GeneralizedGlobalField K]

/-- Stand-in for pullback of line-bundle classes along a morphism of abelian varieties (Tau Ceti
has no pullback of `LineBundleClass` at the pin). -/
def picPullback {A B : TauCeti.AlgebraicGeometry.AbelianVariety K} (f : A.toOver ⟶ B.toOver) :
    Pic B.toScheme →+ Pic A.toScheme := sorry

/-- `TauCeti.neronTateHeight_pullback`. -/
theorem neronTateHeight_pullback {A B : TauCeti.AlgebraicGeometry.AbelianVariety K}
    (f : A.toOver ⟶ B.toOver) (M : Pic B.toScheme)
    (a : AbelianVariety.Points A (AlgebraicClosure K)) :
    neronTateHeight A (picPullback f M) a =
      neronTateHeight B M (Additive.ofMul (a.toMul ≫ f)) -
        neronTateHeight B M (Additive.ofMul ((0 : AbelianVariety.Points A (AlgebraicClosure K)).toMul ≫ f)) := by
  sorry

/-- Stand-in for pullback of line-bundle classes along translation by a `K̄`-point. -/
def transPullback (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (a : AbelianVariety.Points A (AlgebraicClosure K)) : Pic A.toScheme →+ Pic A.toScheme := sorry

/-- `TauCeti.neronTateHeight_translate`. -/
theorem neronTateHeight_translate (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (L : Pic A.toScheme)
    (a x : AbelianVariety.Points A (AlgebraicClosure K)) :
    neronTateHeight A (transPullback A a L) x = neronTateHeight A L (x + a) - neronTateHeight A L a := by
  sorry

end NTPullback

/-! ### RP.1: `W[2]` is a Selmer element outside the Kummer image -/

/-- Test `W2.test_not_selmer_zero`. -/
example : ∃ (f : Polynomial ℚ) (J : TauCeti.AlgebraicGeometry.AbelianVariety ℚ),
    Hyperelliptic.W2 f J ∈ AbelianVariety.selmerGroup J 2 ∧
      Hyperelliptic.W2 f J ∉ (AbelianVariety.kummer J 2).range := by sorry

/-! ### RP.2: tests of adelic points and Brauer sets -/

/-- Test `adelicPoints.test_affine_line`. -/
example (K : Type u) [Field K] [NumberField K] :
    Nonempty (adelicPoints K (Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K (Polynomial K))))) ≃
      AdeleRing (𝓞 K) K) := by sorry
/-- Test `SchemeBrauer.eval.test_trivial` (the unit class evaluates to `1`): see `SchemeBrauer.eval_one`. -/
example {K : Type u} [Field K] {X : Over (Spec (.of K))} (L : Type u) [Field L] [Algebra K L]
    (x : Pts X L) : SchemeBrauer.eval L (1 : SchemeBrauer X.left) x = 1 := SchemeBrauer.eval_one L x
/-- Test `brauerManinSet.test_nonempty_no_point`. -/
example : ∃ X : Over (Spec (.of ℚ)), (brauerManinSet X ⊤).Nonempty ∧ IsEmpty (Pts X ℚ) := by sorry
/-- Test `brauerOne.test_conic_no_point`. -/
example : ∃ X : Over (Spec (.of ℚ)), IsEmpty (Pts X ℚ) ∧
    ¬ Function.Injective (SchemeBrauer.pullback X.hom) := by sorry

/-! ### RP.3: torsor classes, descent sets and the étale–Brauer set -/

namespace Torsor
variable {K : Type u} [Field K] {X : Over (Spec (.of K))} {G : Over (Spec (.of K))} [GrpObj G]

/-- Stand-in: the trivial torsor class. -/
instance : Inhabited (TorsorH1 X G) := ⟨sorry⟩

/-- Stand-in for restriction `H¹(K, G) → H¹(L, G)`. -/
def res (L : Type u) [Field L] [Algebra K L] : FieldH1 K G → FieldH1 L G := sorry

/-- Test `Torsor.twist.test_trivial`: twisting by the trivial class returns the torsor. -/
example (ζ : TorsorH1 X G) : twist ζ default = ζ := twist_default ζ

/-- Test `Torsor.eval.test_point_not_lift`: a point whose fibre class is nontrivial does not lift
to the total space over `K`. -/
example (ζ : TorsorH1 X G) (x : Pts X K) (h : eval ζ K x ≠ default) :
    x ∉ image (twist ζ default) := by sorry

/-- `TauCeti.Torsor.mem_selmerSet_iff`. -/
theorem mem_selmerSet_iff [NumberField K] (ζ : TorsorH1 X G) (τ : FieldH1 K G) :
    τ ∈ selmerSet ζ ↔ ∀ v : HeightOneSpectrum (𝓞 K),
      ∃ y : Pts X (v.adicCompletion K), eval ζ (v.adicCompletion K) y = res (v.adicCompletion K) τ := by
  sorry

end Torsor

section DescentSets
variable {K : Type u} [Field K] [NumberField K]

/-- `TauCeti.descentSet_map`. -/
theorem descentSet_map {X X' : Over (Spec (.of K))} (π : X' ⟶ X) {G : Over (Spec (.of K))} [GrpObj G]
    (ζ : TorsorH1 X G) :
    adelicPoints.map X' π '' descentSet X' (Torsor.pullback π ζ) ⊆ descentSet X ζ := by sorry

/-- Test `descentSet.test_trivial`. -/
example (X : Over (Spec (.of K))) {G : Over (Spec (.of K))} [GrpObj G] :
    descentSet X (default : TorsorH1 X G) = Set.univ := by sorry

/-- `TauCeti.etaleDescentSet`: `X(𝔸)^{ét,descent}` (indexing family as a stand-in parameter). -/
def etaleDescentSet (X : Over (Spec (.of K))) (𝒢 : Type u) (G : 𝒢 → Over (Spec (.of K)))
    [∀ i, GrpObj (G i)] : Set (adelicPoints K X) := sorry

/-- Test `etaleBrauerSet.test_empty`. -/
example (X : Over (Spec (.of K))) (𝒢 : Type u) (G : 𝒢 → Over (Spec (.of K))) [∀ i, GrpObj (G i)]
    (h : IsEmpty (adelicPoints K X)) : etaleBrauerSet X 𝒢 G = ∅ := by sorry

/-- Test `descentSet.test_nonempty_no_point`: Poonen's threefold. -/
example : ∃ (X : Over (Spec (.of ℚ))) (𝒢 : Type) (G : 𝒢 → Over (Spec (.of ℚ)))
    (_ : ∀ i, GrpObj (G i)), (etaleBrauerSet X 𝒢 G).Nonempty ∧ IsEmpty (Pts X ℚ) := by sorry

end DescentSets

/-! ### RP.5: cosets, stabilizers, generated and minimal torsion subvarieties -/

namespace AbelianVariety
variable {K : Type u} [Field K] {A : TauCeti.AlgebraicGeometry.AbelianVariety K}

/-- `TauCeti.AbelianVariety.IsTorsionSubvariety`: a finite union of torsion cosets. -/
def IsTorsionSubvariety (Y : ClosedSubvariety A) : Prop :=
  ∃ T : Set (Points A (AlgebraicClosure K) × AbelianSubvariety A), T.Finite ∧
    (∀ p ∈ T, IsOfFinAddOrder p.1) ∧ Y.points = ⋃ p ∈ T, p.1 +ᵥ p.2.points

/-- `TauCeti.AbelianVariety.quotient`: `A/B` (a construction of this roadmap; stand-in body). -/
def quotient (B : AbelianSubvariety A) : TauCeti.AlgebraicGeometry.AbelianVariety K := sorry
/-- The projection `A(K̄) → (A/B)(K̄)`. -/
def quotientMap (B : AbelianSubvariety A) :
    Points A (AlgebraicClosure K) →+ Points (quotient B) (AlgebraicClosure K) := sorry
/-- `TauCeti.AbelianVariety.quotient_ker`. -/
theorem quotient_ker (B : AbelianSubvariety A) : ((quotientMap B).ker : Set _) = B.points := by sorry
/-- `TauCeti.AbelianVariety.exists_complement`. -/
theorem exists_complement (B : AbelianSubvariety A) :
    ∃ B' : AbelianSubvariety A, B.points + B'.points = Set.univ ∧ (B.points ∩ B'.points).Finite := by
  sorry

/-- Test `AbelianSubvariety.test_zero`: the quotient by an abelian subvariety with all points is
zero-dimensional. -/
example (B : AbelianSubvariety A) (h : B.points = Set.univ) : (quotient B).dim = 0 := by sorry
/-- Test `AbelianSubvariety.test_torsion_not_abelian`. -/
example (hA : 0 < A.dim) :
    ¬ ∃ B : AbelianSubvariety A, B.points = (torsion A 2 (AlgebraicClosure K) : Set _) := by sorry
/-- Test `IsTorsionCoset.test_point`. -/
example (Y : ClosedSubvariety A) (t : Points A (AlgebraicClosure K)) (hY : Y.points = {t})
    (ht : IsOfFinAddOrder t) : IsTorsionCoset Y := by sorry

/-- `TauCeti.AbelianVariety.stabZero`: `Stab⁰(Y)` (stand-in body). -/
def stabZero (Y : ClosedSubvariety A) : AbelianSubvariety A := sorry
/-- The points of an abelian subvariety as a subgroup of `A(K̄)`. -/
def AbelianSubvariety.toAddSubgroup (B : AbelianSubvariety A) :
    AddSubgroup (Points A (AlgebraicClosure K)) where
  carrier := B.points
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry
/-- `TauCeti.AbelianVariety.stab_quotient_finite`: `Stab⁰(Y)` has finite index in `Stab(Y)`. -/
theorem stab_quotient_finite (Y : ClosedSubvariety A) :
    ((stabZero Y).toAddSubgroup.addSubgroupOf (stab Y)).FiniteIndex := by sorry
/-- Test `stab.test_coset`. -/
example (Y : ClosedSubvariety A) (B : AbelianSubvariety A) (x : Points A (AlgebraicClosure K))
    (hY : Y.points = x +ᵥ B.points) : (stab Y : Set _) ⊇ B.points := by sorry
/-- Test `stab.test_point`. -/
example (Y : ClosedSubvariety A) (x : Points A (AlgebraicClosure K)) (hY : Y.points = {x}) :
    stab Y = ⊥ := by sorry

/-- `TauCeti.AbelianVariety.generatedBy`: the abelian subvariety generated by `Y − Y` (stand-in). -/
def generatedBy (Y : ClosedSubvariety A) : AbelianSubvariety A := sorry
/-- `TauCeti.AbelianVariety.Generates`. -/
def Generates (Y : ClosedSubvariety A) : Prop := (generatedBy Y).points = Set.univ
/-- `TauCeti.AbelianVariety.generatedBy_eq_sum`: the `g`-fold sum of `Y − Y`. -/
theorem generatedBy_eq_sum (Y : ClosedSubvariety A) (hY : IrreducibleSpace Y.carrier.left) (g : ℕ)
    (hg : A.dim = g) :
    (generatedBy Y).points = (Finset.range g).sum (fun _ => Y.points - Y.points) := by sorry
/-- `TauCeti.AbelianVariety.subset_generatedBy_add`. -/
theorem subset_generatedBy_add (Y : ClosedSubvariety A) (hY : IrreducibleSpace Y.carrier.left) :
    ∃ Q : Points A (AlgebraicClosure K), Y.points ⊆ Q +ᵥ (generatedBy Y).points := by sorry
/-- Test `generatedBy.test_point`. -/
example (Y : ClosedSubvariety A) (x : Points A (AlgebraicClosure K)) (hY : Y.points = {x}) :
    (generatedBy Y).points = {0} := by sorry
/-- Test `generatedBy.test_coset`. -/
example (Y : ClosedSubvariety A) (B : AbelianSubvariety A) (x : Points A (AlgebraicClosure K))
    (hY : Y.points = x +ᵥ B.points) : (generatedBy Y).points = B.points := by sorry

/-- `TauCeti.AbelianVariety.minimalTorsionCoset`: the intersection of the torsion cosets
containing `Y` (a real body). -/
def minimalTorsionCoset (Y : ClosedSubvariety A) : Set (Points A (AlgebraicClosure K)) :=
  ⋂₀ {S | ∃ (B : AbelianSubvariety A) (x : Points A (AlgebraicClosure K)),
    IsOfFinAddOrder x ∧ S = x +ᵥ B.points ∧ Y.points ⊆ S}
/-- `TauCeti.AbelianVariety.subset_minimalTorsionCoset`. -/
theorem subset_minimalTorsionCoset (Y : ClosedSubvariety A) : Y.points ⊆ minimalTorsionCoset Y := by
  sorry
/-- `TauCeti.AbelianVariety.minimalTorsionCoset_le`. -/
theorem minimalTorsionCoset_le (Y : ClosedSubvariety A) (B : AbelianSubvariety A)
    (x : Points A (AlgebraicClosure K)) (hx : IsOfFinAddOrder x) (h : Y.points ⊆ x +ᵥ B.points) :
    minimalTorsionCoset Y ⊆ x +ᵥ B.points := by sorry
/-- `TauCeti.AbelianVariety.isTorsionCoset_iff`. -/
theorem isTorsionCoset_iff (Y : ClosedSubvariety A) (hY : IrreducibleSpace Y.carrier.left) :
    IsTorsionCoset Y ↔ Y.points = minimalTorsionCoset Y := by sorry
/-- Test `minimalTorsionCoset.test_torsion_point`. -/
example (Y : ClosedSubvariety A) (t : Points A (AlgebraicClosure K)) (hY : Y.points = {t})
    (ht : IsOfFinAddOrder t) : minimalTorsionCoset Y = {t} := by sorry
/-- Test `minimalTorsionCoset.test_subgroup`. -/
example (Y : ClosedSubvariety A) (B : AbelianSubvariety A) (hY : Y.points = B.points) :
    minimalTorsionCoset Y = B.points := by sorry
/-- Test `minimalTorsionCoset.test_translate`. -/
example (Y : ClosedSubvariety A) (B : AbelianSubvariety A) (x : Points A (AlgebraicClosure K))
    (hY : Y.points = x +ᵥ B.points) (hx : ∀ n : ℕ, 0 < n → n • x ∉ B.points) :
    minimalTorsionCoset Y ≠ Y.points := by sorry

/-- Test `uenoLocus.test_abelian`. -/
example (Y : ClosedSubvariety A) (hY : Y.points = Set.univ) (hd : 0 < A.dim) :
    uenoLocus Y = Set.univ := by sorry

section EssMin
variable [GeneralizedGlobalField K] (L : Pic A.toScheme)

/-- `TauCeti.AbelianVariety.essentialMinimum_eq_zero_iff`. -/
theorem essentialMinimum_eq_zero_iff (hL : IsSymmetric L) (Y : ClosedSubvariety A) :
    essentialMinimum L Y = 0 ↔ ∀ ε > (0 : ℝ), ∀ Z : ClosedSubvariety A, ¬ Y.points ⊆ Z.points →
      ∃ y ∈ Y.points \ Z.points, neronTateHeight A L y < ε := by sorry
/-- `TauCeti.AbelianVariety.essentialMinimum_translate_torsion`. -/
theorem essentialMinimum_translate_torsion (hL : IsSymmetric L) (Y Y' : ClosedSubvariety A)
    (t : Points A (AlgebraicClosure K)) (ht : IsOfFinAddOrder t) (h : Y'.points = t +ᵥ Y.points) :
    essentialMinimum L Y' = essentialMinimum L Y := by sorry
/-- Test `essentialMinimum.test_torsion_coset`. -/
example (hL : IsSymmetric L) (Y : ClosedSubvariety A) (hY : IsTorsionCoset Y) :
    essentialMinimum L Y = 0 := by sorry
/-- Test `essentialMinimum.test_point`. -/
example (Y : ClosedSubvariety A) (x : Points A (AlgebraicClosure K)) (hY : Y.points = {x}) :
    essentialMinimum L Y = neronTateHeight A L x := by sorry

end EssMin

end AbelianVariety

end TauCeti

/-! ## Statements not typed at the pins

Each name below is a declaration, API item or unit test of the roadmap document whose carrier the
pinned Mathlib and Tau Ceti do not provide (ampleness and pullback of line bundles, Cartier divisors
and intersection numbers on models, abelian schemes over bases, finite étale covers with their
lifting fields, integral models of curves, torsors over varieties with their total spaces, the
unramified and relative Brauer groups, zero-cycles, Jacobians and Abel–Jacobi maps). They are stated
in the document; no Lean stand-in is introduced for a condition that cannot be stated. Grouped by
node: `kind name`: statement.

* RP.0/geometric-height-field (Polarized function fields as generalized global fields):
  - test `ofPolarization.test_curve_independent`: For a curve V, replacing N by N^{⊗2} does not change the family.
  - test `ofPolarization.test_unweighted_fails`: On ℙ² with f = q/x² (q a smooth conic) the unweighted orders violate the product formula; the deg_N weights repair it.
* RP.0/weil-height-machine (Weil's height machine):
  - API `TauCeti.weilHeight_veryAmple`: For very ample L, h_{K,L} is the class of h_{K,n}∘ι_L.
  - API `TauCeti.weilHeight_projectiveSpace`: On ℙⁿ, h_{K,O(d)} = d·[h_{K,n}].
  - API `TauCeti.weilHeight_baseChange`: [K':K]·h_{K,L} = h_{K',L_{K'}}.
  - API `TauCeti.weilHeight_le_of_ample`: For L ample there is c > 0 with |h_{K,M}| ≤ c·h_{K,L} + O(1).
  - API `TauCeti.weilHeight_unique`: Any homomorphism Pic(X) → HeightClass(X(K̄)) agreeing with h_{K,n}∘ι_L on very ample L is h_{K,•}.
* RP.0/northcott-ample (Northcott for ample line bundles):
  - theorem `TauCeti.weilHeight_northcott_of_ample`: Let K be a number field, X a projective K-variety and L an ample line bundle on X. For every representative h of h_{K,L} and all D ≥ 1, B ∈ ℝ, the set {x ∈ X(ℚ̄) : …
* RP.0/neron-tate-height (The Néron–Tate canonical height):
  - API `TauCeti.neronTateHeight_baseChange`: ĥ_{K',L_{K'}} = [K':K]·ĥ_{K,L}.
* RP.0/neron-tate-kernel-number-field (Positivity and kernel of the Néron–Tate height):
  - theorem `TauCeti.neronTateHeight_eq_zero_iff_isTorsion`: Let A be an abelian variety over a number field K and L a symmetric ample line bundle. Then ĥ_{K,L} ≥ 0 on A(ℚ̄); ĥ_{K,L}(a) = 0 if and only if a is a torsion point; and …
* RP.0/local-weil-functions (Local Weil functions and Néron functions):
  - API `TauCeti.LocalWeilFunction`: Local Weil functions for (X, D, v), defined up to bounded continuous functions.
  - API `TauCeti.LocalWeilFunction.add`: λ_{D+E,v} = λ_{D,v} + λ_{E,v} up to bounded functions.
  - API `TauCeti.LocalWeilFunction.pullback`: λ_{f*D,v} = λ_{D,v}∘f up to bounded functions.
  - API `TauCeti.neronFunction`: The Néron function λ̂_{D,v} of a symmetric divisor on an abelian variety, normalised up to a constant.
  - API `TauCeti.neronTateHeight_eq_sum_neronFunction`: ĥ_{K,O(D)}(x) = Σ_v n_v λ̂_{D,v}(x) for x ∉ |D|, with the constants chosen to sum to zero.
  - API `TauCeti.neronFunction_principal`: λ̂_{div(f),v} = −log|f|_v + constant.
  - test `LocalWeilFunction.test_projective_hyperplane`: On ℙⁿ with D = {x₀ = 0}, λ_{D,v}(x) = log(max_i|x_i|_v/|x₀|_v) is a local Weil function.
  - test `LocalWeilFunction.test_principal`: For D = div(f), λ = −log|f|_v is a local Weil function and its global sum vanishes by the product formula.
  - test `LocalWeilFunction.test_global_sum`: Σ_v n_v λ_{D,v} represents h_{K,O(D)} on X(K) ∖ |D|.
  - test `LocalWeilFunction.test_elliptic_normalisation`: For an elliptic curve E/K and D = (O), the Néron function normalised as in Silverman (Math. Comp. 55, 1990, §3) satisfies λ̂_v(2P) = 4λ̂_v(P) − log|ψ₂(P)|_v + …
  - test `LocalWeilFunction.test_not_bounded`: λ_{D,v} is unbounded near |D|; a bounded function is never a local Weil function for D ≠ 0 effective.
* RP.0/duplication-by-quartics (Multiplication by two is given by quartic forms):
  - theorem `TauCeti.AbelianVariety.exists_quartic_duplication`: Let A be an abelian variety over a field, embedded in ℙⁿ by the complete linear system of a symmetric very ample L such that the embedding is projectively normal. Then …
* RP.0/silverman-tate (The Silverman–Tate theorem in families):
  - theorem `TauCeti.AbelianScheme.silvermanTate`: Let S be a regular irreducible quasi-projective variety over ℚ̄ with a projective compactification S ⊆ S̄ ⊆ ℙᵐ, π : 𝒜 → S an abelian scheme with a closed immersion 𝒜 → …
* RP.0/family-duplication-estimate (The duplication estimate in families):
  - theorem `TauCeti.AbelianScheme.duplication_estimate`: In the situation of silverman-tate there is c₁ > 0 with |h([2]P) − 4h(P)| ≤ c₁·max{1, h_{S̄}(π(P))} for all P ∈ 𝒜(ℚ̄).
* RP.0/fibrewise-height-model-independence (The fibrewise Néron–Tate height depends only on the generic fibre):
  - theorem `TauCeti.AbelianScheme.fibreNeronTate_indep`: Let π : 𝒜 → S be an abelian scheme over an irreducible base and L, L' line bundles on 𝒜 whose restrictions to the generic fibre are both isomorphic to L₀^{⊗l}. Then L' ⊗ …
* RP.0/silverman-specialization-limit (Silverman's height limit theorem):
  - theorem `TauCeti.AbelianScheme.tendsto_specialization`: Let S be a smooth projective curve over ℚ̄ with function field K = ℚ̄(S), π : 𝒜 → S° an abelian scheme over a dense open S° with generic fibre A/K, L symmetric ample. …
* RP.0/silverman-dominant-map-inequality (Heights under generically finite dominant maps):
  - theorem `TauCeti.weilHeight_dominant_lower_bound`: Let f : X' → X be a dominant generically finite morphism of varieties over ℚ̄ (or an equidimensional dominant rational map), with heights h' and h from ample line …
* RP.0/geometric-subvariety-height (Heights of subvarieties over polarized function fields):
  - API `TauCeti.IntegralModel`: An integral model (𝒜, π, ℒ) of (A, L) over a polarization (S, M).
  - API `TauCeti.naiveSubvarietyHeight`: h_{(𝒜,ℒ)}(X) by the intersection-number formula.
  - API `TauCeti.canonicalSubvarietyHeight`: ĥ_L(X) = lim n^{−2} h_{(𝒜,ℒ)}([n]X).
  - API `TauCeti.canonicalSubvarietyHeight_model_indep`: ĥ_L(X) does not depend on the integral model.
  - API `TauCeti.canonicalSubvarietyHeight_nonneg`: ĥ_L(X) ≥ 0.
  - API `TauCeti.canonicalSubvarietyHeight_point`: For a point x, ĥ_L({x}) = ĥ_{K,L}(x).
  - API `TauCeti.canonicalSubvarietyHeight_translate_torsion`: ĥ_L(X + t) = ĥ_L(X) for torsion t.
  - test `canonicalSubvarietyHeight.test_abelian_subvariety`: ĥ_L(B) = 0 for every abelian subvariety B ⊆ A.
  - test `canonicalSubvarietyHeight.test_point_origin`: ĥ_L({0}) = 0.
  - test `canonicalSubvarietyHeight.test_point`: For a point x ∈ A(K), ĥ_L({x}) equals the Néron–Tate height for the geometric-height-field structure of (S, M).
  - test `canonicalSubvarietyHeight.test_naive_not_canonical`: The naive height of a translate x + B by a non-torsion x of positive height can be nonzero while ĥ_L(B) = 0; the naive height is not translation invariant.
* RP.0/geometric-height-laws (Laws for function-field canonical heights):
  - theorem `TauCeti.canonicalSubvarietyHeight_laws`: For A over K = k(S) with polarization (S, M): point canonical heights are additive in symmetric line bundles, satisfy ĥ_{φ*L}(x) = ĥ_L(φ(x)) for homomorphisms φ, and …
* RP.0/geometric-height-base-change (Function-field heights under finite and constant field extensions):
  - theorem `TauCeti.canonicalSubvarietyHeight_baseChange`: Let K = k(S) with S a smooth projective curve over algebraically closed k, and K'/K finite with S' the normalisation of S in K'. Recomputing heights with the model S' …
* RP.0/model-mk-height-comparison (Model heights are M_K-field heights):
  - theorem `TauCeti.modelHeight_eq_admissibleHeight`: For K = k(S), S normal projective over algebraically closed k and M ample, give K the geometric-height-field structure of (S, M). For a projective K-variety X with a …
* RP.0/good-reduction-height-formula (Canonical heights under everywhere good reduction):
  - theorem `TauCeti.canonicalSubvarietyHeight_eq_of_goodReduction`: Let S be a smooth projective curve over algebraically closed k, K = k(S), A/K with everywhere good reduction and 𝒜 → S the abelian scheme extending it. A symmetric ample …
* RP.1/kummer-map (Kummer maps of isogenies of abelian varieties):
  - API `TauCeti.AbelianVariety.kummer_baseChange`: δ_φ commutes with restriction along field extensions K → L.
  - API `TauCeti.AbelianVariety.kummer_galois`: If deg φ is invertible in K, δ_φ is the connecting map of continuous Galois cohomology of the discrete G_K-module A[φ](K^sep).
* RP.1/local-kummer-image-unramified (Local Kummer images at places of good reduction):
  - theorem `TauCeti.AbelianVariety.localKummer_unramified`: Let K be a number field, A/K an abelian variety, n ≥ 1, and v a finite place of K with v ∤ n at which A has good reduction. Then the image of A(K_v)/nA(K_v) in H¹(K_v, …
* RP.1/selmer-group (Selmer groups and Tate–Shafarevich groups of abelian varieties):
  - API `TauCeti.AbelianVariety.selmerGroup_baseChange`: Restriction to a finite extension L/K maps Sel^φ(A/K) into Sel^φ(A_L/L).
  - API `TauCeti.AbelianVariety.selmerGroup_elliptic`: For A the abelian variety of an elliptic curve E, Sel^n(A/K) is the EllipticCurves Layer 7 group Sel_n(E/K).
* RP.1/kk-trace (Chow's K/k-trace):
  - API `TauCeti.AbelianVariety.trace_constant`: Tr_{K/k}(A₀ ⊗ K) = A₀.
  - API `TauCeti.AbelianVariety.trace_baseChange`: Tr commutes with separable algebraic extension of k (Conrad Theorem 6.8).
  - test `trace.test_constant`: For A = E₀ ⊗ K with E₀ an elliptic curve over k, Tr = E₀.
  - test `trace.test_isotrivial_nonconstant`: The quadratic twist of a constant elliptic curve E₀ ⊗ K by t ∈ K^× with K(√t)/K not obtained from an extension of constants has trace 0, although it becomes constant …
* RP.1/two-coverings (Two-coverings of torsors and the class W[2]):
  - API `TauCeti.AbelianVariety.TwoCovering`: A two-covering (Y, π) of a J-torsor I.
  - API `TauCeti.AbelianVariety.TwoCovering.class`: Its class in the H¹(k, J[2])-torsor of two-coverings of I.
  - API `TauCeti.AbelianVariety.TwoCovering.trivial`: [2] : J → J as the two-covering of the trivial torsor.
  - API `TauCeti.Hyperelliptic.W2_eq_zero_iff`: W[2] = 0 iff J¹(k) ≠ ∅.
  - test `TwoCovering.test_trivial`: The two-covering [2] : J → J has class 0.
  - test `TwoCovering.test_degree`: A two-covering of a torsor under an abelian surface has degree 16.
* RP.1/selmer-set-two-covering (The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k):
  - API `TauCeti.AbelianVariety.selmerSet`: Sel₂(I) for a J-torsor I.
  - API `TauCeti.AbelianVariety.selmerSet_torsor`: If nonempty, Sel₂(I) is a principal homogeneous space for Sel₂(J).
  - API `TauCeti.Hyperelliptic.selmerSet_eq_preimage`: Sel₂(J¹) = preimage of W[2] in Sel₄(J).
  - test `selmerSet.test_trivial_torsor`: Sel₂(J) as a Selmer set of the trivial torsor is the 2-Selmer group.
  - test `selmerSet.test_point`: C(K) ≠ ∅ implies Sel₂(J¹) ≠ ∅.
  - test `selmerSet.test_compat_poonen`: Sel₂(I) is Poonen's Selmer set of the torsor I under the group scheme J[2] for any two-covering.
  - test `selmerSet.test_empty_locally_soluble`: Sel₂(J¹) can be empty for everywhere locally soluble C (Bhargava–Gross–Wang Theorem 10).
* RP.1/elliptic-two-descent-example (A complete elliptic 2-descent):
  - theorem `TauCeti.AbelianVariety.elliptic_two_descent_example`: For E : y² = x³ − x over ℚ (S = {2, ∞}): E[2](ℚ) = {O, (0,0), (±1, 0)}; the local images at 2 and ∞ and the unramified conditions elsewhere cut Sel²(E/ℚ) ⊆ H¹(G_{ℚ,S}, …
* RP.1/reduction-torsion-injective (Reduction is injective on torsion):
  - theorem `TauCeti.AbelianVariety.reduction_injective_torsion`: Let A be an abelian variety over a number field K with good reduction at a finite place v of residue characteristic p, absolute ramification index e_v, and 𝒜 the abelian …
* RP.1/two-isogeny-kummer-formula (The Kummer map of a two-isogeny):
  - theorem `TauCeti.EllipticCurve.twoIsogeny_kummer`: For E : y² = x(x² + cx + d) over ℚ with d(c² − 4d) ≠ 0, the 2-isogeny φ : E → E' with E' : y² = x(x² − 2cx + c² − 4d) and its dual φ' : E' → E: the Kummer map …
* RP.2/points-topology-presentation (Presentations compute the points topology):
  - API `TauCeti.Points.t2Space`: If B is Hausdorff, Points_R(A, B) is Hausdorff (for every A, since the coercion to A → B is injective).
* RP.2/adelic-points (Adelic points of an affine variety):
  - API `TauCeti.AdelicPoints.finiteProj_diagonal`: The local projection of the diagonal image of x is x followed by K → K_v, and similarly at infinite places.
  - API `TauCeti.AdelicPoints.map`: A K-algebra map A′ → A induces a continuous map X(𝔸_K) → X′(𝔸_K) compatible with the diagonal and the local projections.
* RP.2/integral-model (Integral models and their integral local points):
  - API `TauCeti.AdelicPoints.IntegralModel.mem_integralPoints_iff`: x ∈ X₀(O_v) iff x(aᵢ) ∈ O_v for a chosen finite family of 𝓞_K-algebra generators aᵢ of A₀.
  - API `TauCeti.AdelicPoints.IntegralModel.isCompact_integralPoints`: X₀(O_v) is compact, given compactness of O_v (recorded gap): it is closed in the compact set of points with all generator values in O_v.
  - API `TauCeti.AdelicPoints.IntegralModel.ofGenerators`: The 𝓞_K-subalgebra generated by any finite family of K-algebra generators of A is an integral model.
  - test `TauCeti.AdelicPoints.IntegralModel.tests.base`: For A = K and A₀ = 𝓞_K, X₀(O_v) = X(K_v) is the single point at every v.
  - test `TauCeti.AdelicPoints.IntegralModel.tests.rescaled`: For A = ℚ[X], the models ℤ[X] and ℤ[X/2] have different integral points at 2 (ℤ₂ versus 2ℤ₂), so the integral points depend on the model at finitely many places.
  - test `TauCeti.AdelicPoints.IntegralModel.tests.no_integral_point`: For A = ℚ[X]/(3X − 1) and A₀ = ℤ[X]/(3X − 1) ≅ ℤ[1/3], the unique point 1/3 lies in X(ℚ₃) but X₀(ℤ₃) is empty, while X₀(ℤ_p) = X(ℚ_p) for every p ≠ 3.
* RP.2/adelic-points-restricted-product (Adelic points as a restricted product):
  - API `TauCeti.AdelicPoints.mk_of_eventually`: A family of local points, integral on A₀ at almost all finite places, defines an adelic point with these projections.
* RP.2/azumaya-base-change (Base change of Azumaya algebras):
  - API `TauCeti.IsAzumaya.iff_isCentral_isSimpleRing`: Over a field L, IsAzumaya L 𝒜 iff 𝒜 is nonzero, finite-dimensional, central and simple.
* RP.2/brauer-evaluation (Evaluating an Azumaya algebra at a point):
  - API `TauCeti.BrauerManin.eval_end`: eval (Module.End A P) x = 1 for P finite projective of positive rank; in particular eval A x = 1.
  - API `TauCeti.BrauerManin.eval_pullback`: eval (A ⊗[A′] 𝒜′) x = eval 𝒜′ (x ∘ g) for g : A′ → A.
  - API `TauCeti.BrauerManin.eval_const`: eval (A ⊗[K] D) x = BrauerGroup.baseChange K L (BrauerGroup.mk D) for a central simple K-algebra D.
  - API `TauCeti.BrauerManin.eval_congr`: Isomorphic Azumaya A-algebras have equal evaluations.
  - test `TauCeti.BrauerManin.tests.depends_on_point`: For A = ℚ[t, 1/t] and 𝒜 = (−1, t)_A, the evaluations at the real points t = 1 and t = −1 differ (1 and the class of ℍ); evaluation is not constant on X(ℝ), which has two …
* RP.2/brauer-manin-pairing (The Brauer–Manin pairing and the Brauer–Manin set):
  - API `TauCeti.BrauerManin.pairing_tensor`: pairing (𝒜 ⊗[A] 𝒜′) x = pairing 𝒜 x + pairing 𝒜′ x.
  - API `TauCeti.BrauerManin.pairing_end`: pairing (Module.End A P) x = 0 for P finite projective of positive rank.
  - API `TauCeti.BrauerManin.HasObstruction`: The proposition X(𝔸_K) ≠ ∅ ∧ brauerManinSet = ∅.
  - test `TauCeti.BrauerManin.tests.pairing_matrix`: pairing (Matrix (Fin 2) (Fin 2) A) x = 0.
  - test `TauCeti.BrauerManin.tests.hamilton_constant`: For K = ℚ, A = ℚ and 𝒜 the Hamilton quaternions, X(𝔸_ℚ) is one point and pairing 𝒜 at it is inv_∞(ℍ) + inv_2(ℍ ⊗ ℚ₂) = ½ + ½ = 0.
* RP.2/adelic-points-general (Adelic points of separated schemes of finite type):
  - test `adelicPoints.test_projectiveLine`: ℙ¹(𝔸_ℚ) ≃ₜ Π_v ℙ¹(ℚ_v).
  - test `adelicPoints.test_gm_not_product`: 𝔾_m(𝔸_ℚ) is the idele group, not the product Π_v ℚ_v^× (which is not locally compact).
* RP.2/scheme-brauer-evaluation (Evaluation of scheme Brauer classes at points):
  - API `TauCeti.SchemeBrauer.eval_affine`: On Spec R it agrees with brauer-evaluation.
  - test `SchemeBrauer.eval.test_quaternion`: On U : y² + z² = (3 − x²)(x² − 2) over ℚ, the class (3 − x², −1) evaluates to the nontrivial element of Br(ℚ₂) at every 2-adic point and to 0 at every real point (Poonen …
  - test `SchemeBrauer.eval.test_field`: For X = Spec K, eval is the identity of Mathlib's Brauer group.
  - test `SchemeBrauer.eval.test_not_constant`: Evaluation of a nonconstant class need not be constant on X(K_v): on 𝔾_m over ℚ the class (t, −1) is nontrivial at t = −1 ∈ ℝ^× and trivial at t = 1.
* RP.2/brauer-manin-general (The Brauer–Manin pairing and set for varieties):
  - test `brauerManinSet.test_conic`: For a smooth conic X over ℚ, X(𝔸)^{Br} = X(𝔸) (Br X = Br_0 X since X_ℚ̄ ≅ ℙ¹).
  - test `brauerManinSet.test_affine`: On affine X with Azumaya classes it agrees with brauer-manin-pairing.
* RP.2/algebraic-brauer-group (Constant and algebraic Brauer groups):
  - API `TauCeti.brauerOne_quotient_equiv`: Over a number field with k^s[X]^× = k^{s×}, Br₁/Br₀ ≃ H¹(k, Pic X_{k^s}).
  - test `brauerOne.test_projectiveSpace`: For X = ℙⁿ_k, Br X = Br₀ X = Br₁ X ≅ Br k.
  - test `brauerOne.test_transcendental`: Br₁ ≠ Br in general: transcendental classes (nonzero image in Br X_{k^s}) exist on some K3 surfaces, so testing Br₁ alone can miss an obstruction.
* RP.2/unramified-brauer-group (The unramified Brauer group):
  - API `TauCeti.unramifiedBrauer`: Br_nr(V) ≤ Br V.
  - API `TauCeti.unramifiedBrauer_eq_range`: Br_nr(V) = range(Br V^c → Br V) for any smooth proper compactification.
  - API `TauCeti.unramifiedBrauer_eq_top_of_proper`: V proper ⇒ Br_nr(V) = Br V.
  - API `TauCeti.unramifiedBrauer_birational`: Br_nr is a birational invariant of smooth geometrically integral varieties.
  - API `TauCeti.unramifiedBrauer_residue`: α ∈ Br_nr(V) iff all residues of α along divisorial valuations of k(V) vanish.
  - test `unramifiedBrauer.test_gm`: Br_nr(𝔾_{m,ℚ}) = Br ℚ while Br 𝔾_{m,ℚ} ∋ (t, −1) ∉ Br_nr.
  - test `unramifiedBrauer.test_proper`: For V = ℙⁿ, Br_nr = Br.
  - test `unramifiedBrauer.test_two_compactifications`: ℙ² and ℙ¹ × ℙ¹ compactifying 𝔸² give the same subgroup Br k.
  - test `unramifiedBrauer.test_not_algebraic`: Br_nr(V) need not equal Br_{1,nr}(V).
* RP.2/unramified-pairing-full-product (The unramified pairing on the full product of local points):
  - theorem `TauCeti.unramifiedPairing_finiteSupport`: For a smooth geometrically integral variety V over a number field K, the pairing Π_v V(K_v) × Br_nr(V) → ℚ/ℤ, ((x_v), α) ↦ Σ_v inv_v α(x_v), has finite support even on …
* RP.2/b-omega (Almost-everywhere locally trivial algebraic Brauer classes):
  - API `TauCeti.brauerOmega`: B_ω(V) ≤ Br₁(V)/Br₀(V).
  - API `TauCeti.mem_brauerOmega_iff`: α ∈ B_ω iff its localisation vanishes outside a finite set of places.
  - API `TauCeti.brauerOmega_equiv_sha`: B_ω ≅ almost-everywhere locally trivial classes of H¹(K, Pic V̄).
  - API `TauCeti.brauerManinPairing_brauerOmega_const`: For α ∈ B_ω there is a finite set T of places such that the pairing of α with (x_v) depends only on (x_v)_{v∈T}.
  - test `brauerOmega.test_zero`: 0 ∈ B_ω.
  - test `brauerOmega.test_finite_exceptions`: A class nonzero locally at exactly one place lies in B_ω.
  - test `brauerOmega.test_sha_compat`: B_ω contains the classes of Ш¹(K, Pic V̄) (trivial at every place).
  - test `brauerOmega.test_weaker`: Almost-everywhere local triviality is weaker than local triviality at every place: B_ω can be strictly larger than Ш¹(K, Pic V̄).
* RP.2/zero-cycle-brauer-pairing (The Brauer–Manin pairing on zero-cycles):
  - API `TauCeti.ZeroCycle.brauerEval`: α(P) for a closed point P, by corestriction.
  - API `TauCeti.ZeroCycle.brauerPairing`: The pairing on adelic families of zero-cycles.
  - API `TauCeti.ZeroCycle.brauerPairing_rationalEquivalence`: It vanishes on principal divisors.
  - API `TauCeti.ZeroCycle.brauerPairing_global`: Global zero-cycles pair to 0.
  - API `TauCeti.ZeroCycle.brauerPairing_point`: On rational points it is brauerManinPairing.
  - API `TauCeti.ZeroCycle.brauerPairing_pushforward`: ⟨f_*z, α⟩ = ⟨z, f*α⟩.
  - test `ZeroCycle.brauerPairing.test_point`: A rational point gives the ordinary evaluation.
  - test `ZeroCycle.brauerPairing.test_complex_norm`: A real place and the cycle of a complex point (a norm from ℂ) pair to 0.
  - test `ZeroCycle.brauerPairing.test_zero`: The zero cycle pairs to 0.
  - test `ZeroCycle.brauerPairing.test_not_degree_one`: A degree-two global point pairs to 0 although it is not a rational point; orthogonality does not produce rational points.
* RP.2/formal-lemma (Harari's formal lemma):
  - theorem `TauCeti.formal_lemma`: Let X be a smooth proper rationally connected variety over a number field K, V ⊆ X a dense open subset and A ⊆ Br(V) a subgroup with A/(A ∩ Br X) finite. Then V(𝔸_K)^A …
* RP.2/cyclic-norm-class (Cyclic algebras and the local invariant matrix):
  - API `TauCeti.localInvariantMatrix`: (b_{v,i}) for polynomials P_i and local inputs t_v.
  - test `cyclicAlgebraClass.test_hilbert`: For r = 2 and χ of ℚ(√d), (χ, a) is the quaternion algebra (d, a).
  - test `cyclicAlgebraClass.test_minus_one_real`: For χ of ℚ(i), inv_∞(χ, −1) = 1/2.
  - test `cyclicAlgebraClass.test_noncyclic`: For a noncyclic L/K the norm-from-everywhere-locally criterion fails (Hasse norm theorem fails for biquadratic ℚ(√13, √17)/ℚ), so the cyclic hypothesis cannot be dropped.
* RP.2/product-norm-assembly (Assembling a global norm from a local invariant matrix):
  - theorem `TauCeti.isNorm_prod_of_invariantMatrix`: In the setting of cyclic-norm-class, let ν ∈ K be an input in a chosen congruence class such that q_i = P_i(ν) are primes outside a finite set S. If inv(χ, q_i) vanishes …
* RP.2/brauer-trivial-complete-intersections (Brauer groups of high-dimensional complete intersections):
  - theorem `TauCeti.brauer_completeIntersection`: Let k be a field of characteristic 0 and X ⊆ ℙⁿ_k a smooth complete intersection with dim X ≥ 3. Then Br k → Br X is an isomorphism. Consequently, over a number field, …
* RP.2/conic-example (Conics: Brauer–Manin set and the Hasse principle):
  - theorem `TauCeti.conic_hassePrinciple`: Let C ⊆ ℙ²_K be a smooth conic over a number field K. Then Br C = Br₀ C, so C(𝔸_K)^{Br} = C(𝔸_K); C satisfies the Hasse principle (C(𝔸_K) ≠ ∅ ⇒ C(K) ≠ ∅) and weak …
* RP.2/iskovskikh-example (Iskovskikh's conic bundle surface):
  - theorem `TauCeti.iskovskikh_brauerManin`: Let X be the smooth proper model of the affine surface y² + z² = (3 − x²)(x² − 2) over ℚ (a Châtelet surface). Then X(𝔸_ℚ) ≠ ∅ but X(𝔸_ℚ)^{𝒜} = ∅ for the quaternion …
* RP.2/effective-brauer-manin-test (Finite computation of Brauer–Manin sets for a finite subgroup):
  - theorem `TauCeti.brauerManinSet_finite_description`: Let X be a smooth proper variety over a number field K and B ⊆ Br X a finite subgroup given by Azumaya algebras over a model 𝒳/O_{K,S}. Then there is a finite set of …
* RP.3/torsor-evaluation (Evaluation of torsors and twisted torsors):
  - API `TauCeti.Torsor.twist_comm`: For commutative G, [Z^τ] = [Z] + π*τ in H¹(X, G) (Harpaz–Wittenberg sign convention fixed here).
  - test `Torsor.twist.test_inverse`: For commutative G, twisting by τ then by −τ returns Z.
  - test `Torsor.eval.test_kummer`: For [n] : A → A, eval is the Kummer map of RP.1/kummer-map.
* RP.3/selmer-set-of-torsor (The Selmer set of a torsor):
  - API `TauCeti.Torsor.exists_field_lift`: There is a finite separable k'/k with X(k) ⊆ f(Z(k')).
  - test `Torsor.selmerSet.test_isogeny`: For an isogeny φ : A → B viewed as an A[φ]-torsor over B, Sel_Z is Sel^φ(A/k) of RP.1/selmer-group.
  - test `Torsor.selmerSet.test_trivial_torsor`: For Z = X × G, Sel_Z(k, G) consists of everywhere locally trivial classes, i.e. Ш¹(k, G).
  - test `Torsor.selmerSet.test_example`: For Poonen's example y² = (x² + 1)(x⁴ + 1), the Selmer set is {c = 1, c = 2} modulo squares.
  - test `Torsor.selmerSet.test_nonproper`: For X = 𝔾_m and Z → X the squaring μ₂-torsor, Sel_Z(ℚ, μ₂) = ℚ^×/ℚ^{×2} is infinite: properness is needed.
* RP.3/local-evaluation-finite-image (Finite local images of torsor evaluation):
  - theorem `TauCeti.Torsor.finite_range_eval_local`: Let k be a local field, X a proper k-variety, F a finite étale algebraic group over k and f : Z → X an F-torsor. Then the image of X(k) → H¹(k, F) is finite; if char k = …
* RP.3/descent-set (Descent obstruction sets):
  - API `TauCeti.descentSet_eq_iUnion`: X(𝔸)^f = ⋃_τ f^τ(Z^τ(𝔸)).
  - test `descentSet.test_isogeny`: For [n] : A → A over a number field with A proper, A(𝔸)^{[n]} is the set of adelic points whose local Kummer classes come from Sel^n(A/k).
  - test `descentSet.test_selmer_union`: The union over H¹(k, G) may be replaced by the union over the Selmer set.
* RP.3/descent-brauer-comparison (Descent is at least as strong as Brauer–Manin):
  - theorem `TauCeti.descentObstructionSet_subset_brauerManinSet`: Let k be a number field and X a variety. For a PGL_n-torsor f : Z → X with Brauer class 𝒜 ∈ Br X[n], X(𝔸)^f = X(𝔸)^𝒜. If X is regular and quasi-projective, every class …
* RP.3/etale-brauer-set (The étale–Brauer set):
  - API `TauCeti.etaleBrauerSet_simplyConnected`: If X_{k̄} is algebraically simply connected, X(𝔸)^{ét,Br} = X(𝔸)^{Br}.
  - test `etaleBrauerSet.test_projective`: For X = ℙⁿ, X(𝔸)^{ét,Br} = X(𝔸).
  - test `etaleBrauerSet.test_compare_descent`: For nice X, X(𝔸)^{ét,Br} = X(𝔸)^{descent} (etale-brauer-equals-descent).
  - test `etaleBrauerSet.test_bielliptic`: For Skorobogatov's bielliptic surface X(𝔸)^{ét,Br} = ∅ ≠ X(𝔸)^{Br}: the étale–Brauer set is strictly finer.
* RP.3/etale-brauer-equals-descent (Étale–Brauer equals descent):
  - theorem `TauCeti.etaleBrauerSet_eq_descentObstructionSet`: For a smooth projective geometrically integral variety X over a number field k: X(𝔸)^{ét,Br} = X(𝔸)^{ét,descent} = X(𝔸)^{descent}. Moreover the descent obstruction is …
* RP.3/universal-torsor (Universal torsors and torsors of a given type):
  - API `TauCeti.ToricTorsor.type`: The type T̂' → Pic X_{k̄} of a torus torsor.
  - API `TauCeti.UniversalTorsor`: A torsor of type id under the Néron–Severi torus.
  - API `TauCeti.UniversalTorsor.exists_of_point`: X(k) ≠ ∅ ⇒ a universal torsor exists.
  - API `TauCeti.UniversalTorsor.twist_transitive`: Universal torsors form a principal homogeneous space under H¹(k, T).
  - API `TauCeti.UniversalTorsor.projectiveSpace`: 𝔸^{n+1} ∖ {0} → ℙⁿ is universal.
  - test `UniversalTorsor.test_projective`: 𝔸^{n+1} ∖ 0 → ℙⁿ is a universal torsor.
  - test `UniversalTorsor.test_point_trivial_pic`: If Pic X_{k̄} = 0 the torus is trivial and the universal torsor is X itself.
  - test `UniversalTorsor.test_conic`: For a pointless conic C, Pic C_{k̄} = ℤ but the class of degree 1 is not defined over k; no universal torsor exists, matching the elementary obstruction.
  - test `UniversalTorsor.test_type_matters`: A 𝔾_m-torsor over ℙ¹ of type 2 (from O(2)) is not universal.
* RP.3/torus-descent-brauer (Descent under tori and the algebraic Brauer group):
  - theorem `TauCeti.brauerOne_set_eq_universalTorsor_union`: Let X be smooth geometrically integral over a number field k with k̄[X]^× = k̄^× and Pic X_{k̄} free of finite rank. If X is moreover proper, every adelic point …
* RP.3/relative-algebraic-brauer (The relative algebraic Brauer group of a torus torsor):
  - API `TauCeti.relativeBrauerOne`: Br₁(Y/X) ≤ Br Y.
  - API `TauCeti.relativeBrauerEdge`: φ_σ : Br₁(Y^σ/X) → H²(k, T̂).
  - API `TauCeti.relativeBrauerEdge_exact`: Br X → Br₁(Y^σ/X) → H²(k, T̂) → H³(X, 𝔾_m) is exact.
  - API `TauCeti.unramifiedBrauer_le_relativeBrauerOne`: Br_nr(Y) ≤ Br₁(Y/X) for torus torsors.
  - API `TauCeti.pullback_mem_relativeBrauerOne`: f*Br X ≤ Br₁(Y/X).
  - test `relativeBrauerOne.test_pullback`: Pullbacks from Br X belong to Br₁(Y/X) and have φ_σ = 0.
  - test `relativeBrauerOne.test_trivial_torsor`: For Y = X × 𝔾_m and α = pr₂*(χ, t) for a character class, φ(α) is the class of χ in H²(k, ℤ) ≅ H¹(k, ℚ/ℤ).
  - test `relativeBrauerOne.test_contains_unramified`: Br_nr(Y) ≤ Br₁(Y/X) for every torus torsor.
  - test `relativeBrauerOne.test_last_term`: The target of δ_σ is H³(X, 𝔾_m), which can be nonzero for number fields although H³(k, 𝔾_m) = 0.
* RP.3/edge-map-twist-independence (Twist independence of the relative Brauer edge maps):
  - theorem `TauCeti.relativeBrauerEdge_twist_indep`: In the setting of relative-algebraic-brauer, with σ ranging over H¹(k, T): (i) if H³(k, 𝔾_m) = 0 the map δ_σ : H²(k, T̂) → H³(X, 𝔾_m) does not depend on σ; (ii) if H³(k, …
* RP.3/residual-sha-functional (The residual Tate–Shafarevich functional):
  - API `TauCeti.residualShaFunctional`: ε_σ : Ш²(k, T̂) ∩ φ₀(Br_nr Y) → ℚ/ℤ.
  - API `TauCeti.residualShaFunctional_indep_lift`: ε_σ does not depend on the adelic lift or on α_σ.
  - API `TauCeti.residualShaFunctional_add`: ε_σ is additive.
  - API `TauCeti.residualShaFunctional_twist`: ε_σ(a) = ε₀(a) − ⟨a, σ⟩.
  - test `residualShaFunctional.test_split_torus`: For T split, Ш²(k, T̂) = 0 and ε is trivial.
  - test `residualShaFunctional.test_pullback_change`: Changing α_σ by f_σ*β with β ∈ A changes the defining sum by 0.
  - test `residualShaFunctional.test_poitou_tate`: The variation formula uses the Poitou–Tate pairing of ArithmeticGaloisDuality R02.4.
  - test `residualShaFunctional.test_domain`: ε is not defined on all of Ш²(k, T̂): outside the edge image φ₀(Br_nr Y) there is no α_σ to evaluate.
* RP.3/unramified-torus-descent (Unramified descent for torus torsors):
  - theorem `TauCeti.unramified_torus_descent`: Let k be a number field, X smooth geometrically integral and f : Y → X a torsor under a k-torus T. Put A = f*^{-1}(Br_nr(Y)) ⊆ Br X. Then X(𝔸_k)^A ⊆ ⋃_{σ ∈ H¹(k,T)} …
* RP.3/open-torus-torsor-descent (Descent from a torus torsor over a dense open subset):
  - theorem `TauCeti.open_torus_torsor_descent`: Let X be a smooth proper rationally connected variety over a number field k, V ⊆ X dense open and f : W → V a torsor under a k-torus. Then X(𝔸_k)^{Br X} is contained in …
* RP.3/brauer-manin-universal-torsor-existence (Brauer–Manin points give universal torsors):
  - theorem `TauCeti.exists_universalTorsor_of_brauerManin`: For a smooth proper geometrically rationally connected variety X over a number field k, if X(𝔸_k)^{Br X} ≠ ∅ then a universal torsor over X exists over k. More …
* RP.3/genus-one-torsors (Genus-one curves as torsors and the Weil–Châtelet group):
  - theorem `TauCeti.genusOne_torsor_equiv_weilChatelet`: Let E be an elliptic curve over a field k. A smooth projective genus-one curve C over k with Jacobian E is a torsor under E, and isomorphism classes of such torsors are …
* RP.3/bgw-hasse-failures (Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction):
  - theorem `TauCeti.bgw_hasse_failures`: For hyperelliptic curves C : y² = f(x) over ℚ of genus g ≥ 1 (deg f = 2g + 2), ordered by height: for fixed g a positive proportion of everywhere locally soluble C have …
* RP.3/descent-worked-example (A worked descent: y² = (x² + 1)(x⁴ + 1)):
  - theorem `TauCeti.descent_example_genus_two`: For the genus-two curve X : y² = (x² + 1)(x⁴ + 1) over ℚ, the μ₂-torsors Z_c → X given by c·w² = x⁴ + 1 (c ∈ ℚ^×/ℚ^{×2}) partition X(ℚ) (descent-partition); only c ∈ {1, …
* RP.3/strong-approximation-failure (Finite étale covers obstruct strong approximation):
  - theorem `TauCeti.not_strongApproximation_of_finiteEtale`: Let k be a global field, S a finite set of places and f : Y → X a finite étale morphism of geometrically integral k-varieties that is not an isomorphism. If X(𝔸^S) ≠ ∅ …
* RP.3/insufficiency-examples (Insufficiency of the Brauer–Manin and descent obstructions):
  - theorem `TauCeti.exists_brauerManin_insufficient`: (a) There is a nice ℚ-variety X (Skorobogatov's bielliptic surface, birational to (x² + 1)y² = (x² + 2)z² = 3(t⁴ − 54t² − 117t − 243)) with X(𝔸)^{Br} ≠ ∅ but X(ℚ) = ∅; …
* RP.4/good-reduction-curve (Curves with good reduction outside S):
  - API `TauCeti.Curve.HasGoodReductionOutside`: The predicate: C extends to a smooth proper curve over O_{K,S}.
  - API `TauCeti.Curve.shafarevichSet`: Sh(K, S, g) as a set of isomorphism classes.
  - API `TauCeti.Curve.ShafarevichFiniteness`: The proposition that Sh(K, S, g) is finite, for use as a hypothesis.
  - API `TauCeti.Curve.hasGoodReductionOutside_mono`: Good reduction outside S implies good reduction outside every S' ⊇ S.
  - API `TauCeti.Curve.hasGoodReductionOutside_baseChange`: Good reduction outside S over K implies good reduction outside the places above S over every finite L/K.
  - test `HasGoodReductionOutside.test_projectiveLine`: ℙ¹_K has good reduction outside S = archimedean places.
  - test `HasGoodReductionOutside.test_mono`: If S contains all places, every curve qualifies.
  - test `HasGoodReductionOutside.test_elliptic`: For an elliptic curve, good reduction outside S agrees with Tau Ceti's Weierstrass good reduction at each v ∉ S (NeronModels R11.6/equation-good-comparison).
  - test `HasGoodReductionOutside.test_bad_at_two`: y² = x³ − x over ℚ has good reduction outside {2, ∞} but not outside {∞}: it lies in Sh(ℚ, {2, ∞}, 1) and not in Sh(ℚ, {∞}, 1).
* RP.4/chevalley-weil (The Chevalley–Weil theorem):
  - theorem `TauCeti.chevalley_weil`: Let k be a number field and f : Z → X a finite étale morphism of varieties over k with X proper (or, for integral points, a finite étale morphism of separated schemes of …
* RP.4/kodaira-parshin-construction (The Kodaira–Parshin construction):
  - API `TauCeti.KodairaParshin.field`: The finite extension L/K, depending only on (C, S).
  - API `TauCeti.KodairaParshin.curve`: C_P over L for P ∈ C(K).
  - API `TauCeti.KodairaParshin.map`: φ_P : C_P → C_L, finite.
  - API `TauCeti.KodairaParshin.goodReduction`: C_P has good reduction outside the places above S.
  - API `TauCeti.KodairaParshin.genus_eq`: The genus of C_P is an explicit function of g alone.
  - API `TauCeti.KodairaParshin.ramified_iff`: φ_P is ramified at a point exactly when it lies above P.
  - test `KodairaParshin.test_genus_formula`: For g = 2, C₁ has genus 17 (2g₁ − 2 = 16·2), D has degree 16 and C_P has genus 41 (2g' − 2 = 16·5).
  - test `KodairaParshin.test_unramified_step`: C₁ → C is unramified of degree 2^{2g}.
  - test `KodairaParshin.test_comparison_LV`: φ_P : C_P → C_L is a cover branched exactly above one point, the kind of cover that the Kodaira–Parshin family of MordellLawrenceVenkatesh LV.8 parametrises for the …
  - test `KodairaParshin.test_branch`: φ_P is not unramified: an unramified C_P would not distinguish distinct points P, and the map P ↦ C_P would not be finite-to-one.
* RP.4/parshin-implication (Parshin: Shafarevich finiteness implies Mordell):
  - theorem `TauCeti.Curve.finite_of_shafarevich`: Let K be a number field and C/K a smooth projective geometrically connected curve of genus g ≥ 2. Let L, S' and g' be the data of kodaira-parshin-construction for C. If …
* RP.4/integral-points (S-integral points on affine curves):
  - API `TauCeti.IntegralPoints`: 𝒳(O_{K,S}) ⊆ X(K) for a model 𝒳.
  - API `TauCeti.IntegralPoints.mono`: S ⊆ S' ⇒ 𝒳(O_{K,S}) ⊆ 𝒳(O_{K,S'}).
  - API `TauCeti.IntegralPoints.model_indep`: Two models agree after enlarging S.
  - API `TauCeti.IntegralPoints.gm`: For 𝔾_m the integral points are O_{K,S}^×.
  - test `IntegralPoints.test_gm`: 𝔾_m(ℤ[1/2]) = {±2^n}.
  - test `IntegralPoints.test_affine_line`: 𝔸¹(O_{K,S}) = O_{K,S} is infinite: genus 0 with one point at infinity.
  - test `IntegralPoints.test_s_units`: ℙ¹ ∖ {0, 1, ∞} has integral points the solutions of the S-unit equation u + v = 1 (DT.2).
  - test `IntegralPoints.test_gm_infinite`: 𝔾_m(ℤ[1/2]) is infinite: two points at infinity are not enough for Siegel finiteness.
* RP.4/siegel-theorem (Siegel's theorem on integral points):
  - theorem `TauCeti.Curve.finite_integralPoints`: Let K be a number field, S a finite set of places containing the archimedean ones, and X an affine curve over K with smooth projective completion X̄ of genus g. If g ≥ …
* RP.4/function-field-mordell (The Mordell conjecture over function fields):
  - theorem `TauCeti.Curve.isotrivial_of_infinite`: Let K be a function field with field of constants k (K = k(V), k algebraically closed in K) and X a regular projective geometrically integral K-curve of genus > 1 with …
* RP.5/abelian-subvariety (Abelian subvarieties, cosets and quotients):
  - test `AbelianSubvariety.test_diagonal`: The diagonal of E × E is an abelian subvariety with quotient E via (P, Q) ↦ P − Q.
* RP.5/stabilizer (Stabilizers of subvarieties):
  - API `TauCeti.AbelianVariety.degree_stab_le`: deg_L Stab(X) ≤ (deg_L X)^{dim X + 1}.
  - test `stab.test_curve`: For a curve C of genus ≥ 2 embedded in its Jacobian, Stab(C) is finite.
  - test `stab.test_not_reduced_union`: Stab(X) need not be connected: for X = B ∪ (t + B) with t ∈ A[2] ∖ B, Stab(X) ⊇ B ∪ (t + B).
* RP.5/generated-abelian-subvariety (The abelian subvariety generated by X − X):
  - API `TauCeti.AbelianVariety.degree_add_le`: deg_L(Y + Y') ≤ 4^{dim Y + dim Y'}·deg_L Y·deg_L Y'.
  - test `generatedBy.test_curve_jacobian`: For C ⊆ Jac C of genus ≥ 1, A' = Jac C, matching AbelianSchemesAndArithmeticModuli A6/curve-generated-subvariety.
  - test `Generates.test_translate`: A subvariety X contained in a translate x + B of a proper abelian subvariety B does not generate A (its A' is contained in B), even when x ∉ B, so that X lies in no …
* RP.5/ueno-locus (The Ueno locus):
  - API `TauCeti.AbelianVariety.isClosed_uenoLocus`: Z(X) is Zariski closed (Kawamata).
  - API `TauCeti.AbelianVariety.uenoLocus_eq_iUnion`: Z(X) = ⋃_{B ∈ Σ} (X_B + B).
  - test `uenoLocus.test_curve`: For C ⊆ Jac C of genus ≥ 2, Z(C) = ∅.
  - test `uenoLocus.test_product`: For X = C × E ⊆ Jac C × E with E elliptic, Z(X) = X.
  - test `uenoLocus.test_not_torsion_condition`: The Ueno locus contains non-torsion cosets x + B: it is not the union of torsion cosets in X.
* RP.5/finite-rank-subgroup (Subgroups of finite rank):
  - test `HasFiniteRank.test_torsion`: A(K̄)_tors has rank 0.
  - test `HasFiniteRank.test_divisionHull`: The division hull of A(K) in A(K̄) has rank rk A(K).
* RP.5/manin-mumford-positive-characteristic (Manin–Mumford for trivial trace in positive characteristic):
  - theorem `TauCeti.AbelianVariety.manin_mumford_trivialTrace`: Let K be finitely generated over an algebraically closed field k and A an abelian variety over K with trivial K/k-trace. If X ⊆ A_{K̄} is a closed subvariety with X(K̄) …
* RP.5/uniform-manin-mumford (Uniform Manin–Mumford in families):
  - theorem `TauCeti.AbelianVariety.uniform_manin_mumford`: Let A be an abelian variety over an algebraically closed field K of characteristic 0, V an irreducible quasi-projective K-variety and Y ⊆ V × A an irreducible closed …
* RP.5/vojta-inequality (Vojta's inequality):
  - theorem `TauCeti.Curve.vojta_inequality`: Let C be a smooth projective curve of genus g ≥ 2 over a number field k, embedded in its Jacobian J by a rational divisor class, and |·| the Néron–Tate norm on J(k̄) ⊗ ℝ …
* RP.5/mumford-gap (Mumford's gap principle):
  - theorem `TauCeti.Curve.mumford_gap`: Let C be a smooth projective curve of genus g ≥ 2 over a number field k embedded in its Jacobian. There are constants c(C) and an angle θ₀ > 0 such that for distinct z, …
* RP.5/faltings-zhang-map (The Faltings–Zhang difference map):
  - API `TauCeti.AbelianVariety.faltingsZhang_hom`: D_M is a homomorphism of abelian varieties.
  - test `faltingsZhang.test_diagonal`: The diagonal maps to 0.
  - test `faltingsZhang.test_not_finite_on_coset`: On X = B a positive-dimensional abelian subvariety, D_M|_{X^{M+1}} has positive-dimensional fibres for every M.
* RP.5/zhang-difference-lemma (Zhang's difference-map lemma):
  - theorem `TauCeti.AbelianVariety.faltingsZhang_generic_fibre`: For an irreducible closed subvariety X of an abelian variety A with finite stabilizer there is M₀ such that for M ≥ M₀ the generic fibre of D_M : X^{M+1} → A^M is a …
* RP.5/minimal-torsion-subvariety (The minimal torsion subvariety containing X):
  - test `minimalTorsionCoset.test_nontorsion_point`: For E elliptic and x of infinite order, T_{{x}} = E.
* RP.5/essential-minimum (The essential minimum of a subvariety):
  - API `TauCeti.AbelianVariety.essentialMinimum_nonneg`: μ_ess(X) ≥ 0.
  - test `essentialMinimum.test_kernel`: For X = {x}, μ_ess(X) = 0 iff x is torsion (RP.0/neron-tate-kernel-number-field).
  - test `essentialMinimum.test_inf_not_ess`: The infimum of ĥ on X(K̄) (attained at torsion points on X) is not μ_ess(X): a curve of genus ≥ 2 through 0 has inf = 0 but μ_ess > 0.
* RP.5/szpiro-ullmo-zhang-equidistribution (Equidistribution of small points on abelian varieties):
  - theorem `TauCeti.AbelianVariety.equidistribution_small_points`: Let A be an abelian variety over a number field K, L symmetric ample, X ⊆ A_{K̄} irreducible with μ_ess(X) = 0, and (x_n) a generic sequence in X(K̄) (no subsequence …
* RP.5/coset-free-hypersurface-sections (Hypersurface sections of abelian varieties containing no cosets):
  - theorem `TauCeti.AbelianVariety.exists_cosetFree_hypersurface`: Let A ⊆ ℙ^M be an abelian variety of dimension g ≥ 1 and d ≥ g − 1. There is a dense Zariski open U in the space of degree-d forms, with complement of codimension ≥ d + …
* RP.6/local-solubility (Local solubility and the local-global principle):
  - API `TauCeti.SatisfiesWeakApproximation`: X(K) dense in Π_v X(K_v).
  - test `IsLocallySoluble.test_conic`: x² + y² = 3z² over ℚ is not locally soluble (no ℚ₃-point).
  - test `SatisfiesHassePrinciple.test_conic`: Smooth conics satisfy the Hasse principle (GlobalQuadraticForms Layer 5; RP.2/conic-example).
  - test `SatisfiesHassePrinciple.test_iskovskikh`: Iskovskikh's surface is locally soluble without rational points (RP.2/iskovskikh-example).
* RP.6/curve-in-jacobian (Rational points of curves through the Abel–Jacobi embedding):
  - theorem `TauCeti.Curve.abelJacobi_points`: Let C be a smooth projective geometrically connected curve of genus g ≥ 1 over a field K with a divisor class D₀ of degree 1 defined over K (for instance a rational …
* RP.6/genus-one-classification (Rational points on genus-one curves):
  - theorem `TauCeti.Curve.genusOne_classification`: Let C be a smooth projective geometrically connected curve of genus 1 over a number field K with Jacobian E. Then: C is an E-torsor with class [C] ∈ H¹(K, E) …
* RP.6/conjecture-register (Statements of the open conjectures (no consumer treats them as proved)):
  - API `TauCeti.BombieriLangConjecture`: The proposition (a), quantified over K and X.
  - API `TauCeti.VojtaConjecture`: The proposition (b).
  - API `TauCeti.BrauerManinOnlyObstructionConjecture`: The proposition (c) for rationally connected varieties.
  - API `TauCeti.bombieriLang_curves`: The case dim X = 1 of (a) holds (Faltings).
  - test `BombieriLangConjecture.test_curves`: Restricted to curves of genus ≥ 2, (a) is equivalent to RP.4/mordell-faltings.
  - test `BombieriLangConjecture.test_dim_zero`: The hypothesis dim X > 0 excludes points, for which the statement would be false (a rational point is Zariski dense in itself).
  - test `BrauerManinOnlyObstructionConjecture.test_conic`: For conics (c) holds (RP.2/conic-example).
  - test `BrauerManinOnlyObstructionConjecture.test_not_general_type`: (c) is false without rational connectedness: Skorobogatov's bielliptic surface (RP.3/insufficiency-examples) has X(𝔸)^{Br} ≠ ∅ = X(ℚ).
-/
