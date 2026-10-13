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
# Heights, rational points and obstructions — compact suggested Lean

These are proposed signatures at Mathlib 082e2d3 and Tau Ceti f790474. Proofs marked `sorry`
are milestones, not completed formalizations. Definitions below have real bodies; no missing
cohomology, trace, genus, scheme Brauer group, local invariant or general height is supplied by
an opaque data placeholder. Those targets and all their hypotheses/API/tests remain in the
packet and reader document. The closing register identifies every target and the missing
carrier or proof input when a signature cannot yet be given honestly.

REV-HeightsRationalPointsAndObstructions corrected the packet on 2026-10-13. Its verdict is
needs_changes: the corrected statement is not a claim that its recorded source/supplier gaps
are filled. Before packaging, synchronize the reader document with the packet and review.

Conventions: HeightClass is the native quotient by uniformly bounded functions; Pts is the
native scheme hom-set; Pic uses native line-bundle classes. Abelian-variety points carry their
native group structure. Relative number-field heights retain the totalWeight factor; absolute
heights divide it out. The native elliptic canonical height is the (O)-height, while the
unhalved polarization is twice the native elliptic pairing.
-/

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
    (LinearMap.pi fun x => LinearMap.proj (f x)) (by
      intro h hh
      rcases (bounded_top_iff h).mp hh with ⟨C, hC, hbound⟩
      apply (bounded_top_iff _).mpr
      exact ⟨C, hC, fun x => hbound (f x)⟩)

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

/-! ## RP.0: native points, line-bundle classes and Tate limits -/

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

/-! ## RP.0: native projective and elliptic milestones -/

/-- Northcott for the native finite-dimensional projectivization. -/
theorem northcott_projectivization (K : Type u) [Field K] [NumberField K] (n : ℕ) :
    Northcott (Projectivization.logHeight (K := K) («ι» := Fin (n + 1))) := by sorry

/-- A fixed-field linear coordinate change changes relative height by a bounded amount. -/
theorem logHeight_linearChange_bounded (K : Type u) [Field K] [NumberField K]
    {n : ℕ} (T : (Fin (n + 1) → K) ≃ₗ[K] (Fin (n + 1) → K)) :
    ∃ C : ℝ, ∀ x : Fin (n + 1) → K, x ≠ 0 →
      |logHeight (T x) - logHeight x| ≤ C := by sorry

/-- Absolute heights are the relative scalar height divided by the native total weight. -/
theorem absLogHeight_add_le (K : Type u) [Field K] [NumberField K] (x y : K) :
    logHeight₁ (x + y) / totalWeight K ≤
      logHeight₁ x / totalWeight K + logHeight₁ y / totalWeight K + Real.log 2 := by sorry

/-- The native elliptic torsion kernel requires Northcott, not Mordell–Weil. -/
theorem elliptic_canonicalHeight_eq_zero_iff
    {F : Type u} [Field F] [NumberField F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P : W.Point) :
    P.canonicalHeight = 0 ↔ IsOfFinAddOrder P := by sorry

/-- Polarization without the factor one-half, for the (O)-normalized native height. -/
def ellipticUnhalvedPolarization
    {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P Q : W.Point) : ℝ :=
  (P + Q).canonicalHeight - P.canonicalHeight - Q.canonicalHeight

/-- This convention is twice the existing elliptic pairing. -/
theorem ellipticUnhalvedPolarization_eq_twice
    {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P Q : W.Point) :
    ellipticUnhalvedPolarization P Q = 2 * W.neronTatePairing P Q := by sorry

example : Set.ncard {x : Projectivization ℚ (Fin 2 → ℚ) |
    Projectivization.logHeight x ≤ Real.log 2} = 8 := by sorry

example : logHeight₁ ((129 : ℚ) / 100) ≠ 4 * logHeight₁ (3 : ℚ) := by sorry

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P : W.Point) :
    ellipticUnhalvedPolarization P P = 2 * P.canonicalHeight := by sorry

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P : W.Point) :
    ellipticUnhalvedPolarization 0 P = 0 := by sorry

end TauCeti

/-! ## RP.1: native abelian-variety points and Mordell–Weil endpoint -/

noncomputable section
namespace TauCeti
universe u
open CategoryTheory _root_.AlgebraicGeometry
open scoped CategoryTheory.MonObj

abbrev AbelianVariety.Points {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (L : Type u) [Field L] [Algebra K L] : Type u := Additive (Pts A.toOver L)

namespace AbelianVariety
variable {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

/-- The native kernel of multiplication, with a real body. -/
def torsion (n : ℕ) (L : Type u) [Field L] [Algebra K L] : AddSubgroup (Points A L) :=
  (nsmulAddMonoidHom n : Points A L →+ Points A L).ker

/-- Weak Mordell–Weil over a number field; n=0 is excluded. -/
theorem finite_quotient_nsmul [NumberField K] (n : ℕ) (hn : 0 < n) :
    Finite (Points A K ⧸ (nsmulAddMonoidHom n : Points A K →+ Points A K).range) := by sorry

/-- General abelian-variety Mordell–Weil; the elliptic specialization is already upstream. -/
theorem fg_points [NumberField K] : AddGroup.FG (Points A K) := by sorry

theorem finite_torsion [NumberField K] : Finite {a : Points A K | IsOfFinAddOrder a} := by sorry

example (L : Type u) [Field L] [Algebra K L] : torsion A 1 L = ⊥ := by sorry

example (L : Type u) [Field L] [Algebra K L] : torsion A 0 L = ⊤ := by sorry

end AbelianVariety
end TauCeti

/-! ## RP.2: finite-type affine point topology -/

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
    C(Points R A B, Points R A' B) where
  toFun x := Points.ofAlgHom ((x : A →ₐ[R] B).comp g)
  continuous_toFun := by
    apply (continuous_iff _).mpr
    intro a
    exact continuous_eval (g a)

/-- Postcomposition with a continuous algebra map of value rings. -/
def postcomp {B' : Type*} [CommRing B'] [Algebra R B'] [TopologicalSpace B'] (h : B →ₐ[R] B')
    (hh : Continuous h) : C(Points R A B, Points R A B') where
  toFun x := Points.map h x
  continuous_toFun := by
    apply (continuous_iff _).mpr
    intro a
    exact hh.comp (continuous_eval a)

variable [IsTopologicalRing B]

theorem nonempty_tensorHomeomorph (A' : Type*) [CommRing A'] [Algebra R A'] :
    Nonempty (Points R (A ⊗[R] A') B ≃ₜ Points R A B × Points R A' B) := by sorry

theorem nonempty_polynomialHomeomorph : Nonempty (Points R (Polynomial R) B ≃ₜ B) := by sorry

theorem nonempty_unitsHomeomorph :
    Nonempty (Points R (MvPolynomial (Fin 2) R ⧸
      Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 - 1 : MvPolynomial (Fin 2) R)}) B ≃ₜ Bˣ) := by sorry

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

theorem t2Space [T2Space B] : T2Space (Points R A B) := by sorry

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

/-! ## RP.2: affine adelic points and integral models -/

section Adelic
open NumberField IsDedekindDomain
variable (K : Type) [Field K] [NumberField K]
  (A : Type) [CommRing A] [Algebra K A]

abbrev AdelicPoints := Points K A (AdeleRing (𝓞 K) K)

namespace AdelicPoints

/-- Diagonal evaluation through the native number-field adele algebra. -/
def diagonal : Points K A K → AdelicPoints K A :=
  Points.map (Algebra.ofId K (AdeleRing (𝓞 K) K))

theorem diagonal_injective : Function.Injective (diagonal K A) := by sorry

/-- Local compactness also requires compact O_v; the packet records that supplier gap. -/
theorem locallyCompactSpace [Algebra.FiniteType K A] :
    LocallyCompactSpace (AdelicPoints K A) := by sorry

theorem isClosed_range_diagonal [Algebra.FiniteType K A] :
    IsClosed (Set.range (diagonal K A)) := by sorry

theorem discreteTopology_range_diagonal [Algebra.FiniteType K A] :
    DiscreteTopology (Set.range (diagonal K A)) := by sorry

variable [Algebra (𝓞 K) A] [IsScalarTower (𝓞 K) K A]

/-- An actual finitely generated integral subalgebra spanning the coordinate algebra. -/
structure IntegralModel where
  carrier : Subalgebra (𝓞 K) A
  fg : carrier.FG
  span : Algebra.adjoin K (carrier : Set A) = ⊤

namespace IntegralModel
variable {K A}

/-- Local integrality means every element of the chosen model evaluates in O_v. -/
def integralPoints (M : IntegralModel K A) (v : HeightOneSpectrum (𝓞 K)) :
    Set (Points K A (v.adicCompletion K)) :=
  {x | ∀ a ∈ M.carrier, x a ∈ v.adicCompletionIntegers K}

theorem isOpen_integralPoints (M : IntegralModel K A) (v : HeightOneSpectrum (𝓞 K)) :
    IsOpen (M.integralPoints v) := by sorry

theorem nonempty [Algebra.FiniteType K A] : Nonempty (IntegralModel K A) := by sorry

theorem eventually_integralPoints_eq (M M' : IntegralModel K A) :
    ∀ᶠ v in Filter.cofinite, M.integralPoints v = M'.integralPoints v := by sorry

end IntegralModel

/-- A homeomorphism is an existence milestone, not a sorry-bodied data definition. -/
theorem nonempty_restrictedProductHomeomorph [Algebra.FiniteType K A] (M : IntegralModel K A) :
    Nonempty (AdelicPoints K A ≃ₜ (Π w : InfinitePlace K, Points K A w.Completion) ×
      RestrictedProduct (fun v : HeightOneSpectrum (𝓞 K) => Points K A (v.adicCompletion K))
        (fun v => M.integralPoints v) Filter.cofinite) := by sorry

end AdelicPoints
end Adelic

example (K : Type) [Field K] [NumberField K] : Subsingleton (AdelicPoints K K) := by sorry

example (K : Type) [Field K] [NumberField K] :
    Nonempty (AdelicPoints K (Polynomial K) ≃ₜ
      NumberField.AdeleRing (NumberField.RingOfIntegers K) K) := by sorry

example : IsEmpty (AdelicPoints ℚ
    (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X ^ 2 + 1 : Polynomial ℚ)})) := by sorry

end TauCeti

/-! ## RP.5: finite rank and the Faltings–Zhang difference map -/

noncomputable section
namespace TauCeti
universe u
open scoped TensorProduct

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

noncomputable section
namespace TauCeti
universe u

/-- The point-level difference homomorphism; scheme generic finiteness stays in the packet. -/
def faltingsZhang {G : Type u} [AddCommGroup G] (M : ℕ) :
    (Fin (M + 1) → G) →+ (Fin M → G) where
  toFun P := fun i => P i.succ - P 0
  map_zero' := by
    funext i
    simp
  map_add' := by
    intro P Q
    funext i
    simp only [Pi.add_apply]
    abel

theorem faltingsZhang_apply {G : Type u} [AddCommGroup G]
    (M : ℕ) (P : Fin (M + 1) → G) (i : Fin M) :
    faltingsZhang M P i = P i.succ - P 0 := rfl

theorem faltingsZhang_diag {G : Type u} [AddCommGroup G] (M : ℕ) (P : G) :
    faltingsZhang M (fun _ => P) = 0 := by
  ext i
  simp [faltingsZhang]

example {G : Type u} [AddCommGroup G] (P Q : G) :
    faltingsZhang 1 ![P, Q] 0 = Q - P := rfl

example {G : Type u} [AddCommGroup G] (M : ℕ) (P : Fin (M + 1) → G) :
    faltingsZhang M P = 0 ↔ ∀ i, P i = P 0 := by sorry

end TauCeti

/-!
## Target register and prerequisites for the remaining signatures

The packet contains the full mathematical statement, hypotheses, source locator, proof outline,
API and tests of each target below. An entry here is a target, not an axiom or a substitute type.
The proposed signatures above illustrate only what the pinned native carriers support.

RP.0: generalized-global-field needs the additional infinite/inequivalent/nontrivial place and
excellent-DVR axioms, including an extension constructor; AdmissibleAbsValues alone is weaker.
General Weil/canonical heights, metrics, polarizations, analytic intersection theory and ample
line-bundle predicates await their stated supplier contracts. Do not erase ampleness to type a
positive-definiteness theorem. The family Segre height includes the base height.

RP.1: Kummer/Selmer/Shafarevich carriers are imported from EllipticCurves Layer 7. Trace is a
geometric universal property on abelian-variety morphisms, not on arbitrary abstract point-group
homomorphisms. The geometric trace is required over K̄. A two-covering H¹(J[2]) class differs
from its image in H¹(J); a rational Pic¹ point only kills the latter.

RP.2: scheme Brauer is imported from SchemeAndStackFoundations key/scheme-brauer. Its missing
Hochschild–Serre/purity/comparison contracts are requests. ClassFieldTheory supplies local
invariants and reciprocity. General adelic points use integral-model direct limits; global
open immersions need not induce embeddings. Brauer evaluation is locally constant for a fixed
class. Finite local partitions do not by themselves provide a terminating algorithm.

RP.3: torsors, contracted products, inner forms, type maps and local/global H¹ need genuine
supplier constructions. Use [Z^τ]=[Z]−τ; HW's σ=−τ makes ε_τ=ε₀+PT(τ). Universal-torsor existence
and étale–Brauer/descent comparison have recorded proof gaps. No opaque H¹ carrier is introduced.

RP.4: native curve/Picard/genus, smooth proper models and cover carriers are still missing.
Parshin uses Jac(C₁) for divisor halving; its safe extension bound is 2^(2g₁). De Franchis for
all maps is characteristic zero. The independent Mordell declaration is owned here via RP.5;
Parshin's Shafarevich input stays a conditional hypothesis and is not imported upward.

RP.5: subvariety/stabilizer/quotient/Picard carriers and degree/intersection contracts are still
required for geometric endpoints. Stabilizer scheme-fibre statements here have characteristic
zero. Finite-rank Mordell–Lang, Manin–Mumford and Bogomolov retain their explicit deep proof gaps.
Equidistribution requires a generic sequence and admissible semipositive metrics; a constant
torsion sequence does not qualify. Uniform complement bounds require the generating hypothesis.

RP.6: genus classification needs the actual curve/Jacobian carriers and preceding endpoints.
Conjectures are recorded as propositions in the packet, not assumed in an unconditional proof.
The genus-one Brauer–Manin sufficiency assertion is explicitly conditional on finite Sha.

HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness
  Uniform boundedness at the top filter; lemma.
HeightsRationalPointsAndObstructions:RP.0/height-class
  Heights modulo bounded functions; definition.
HeightsRationalPointsAndObstructions:RP.0/equality-criterion
  The bounded-error equality criterion; lemma.
HeightsRationalPointsAndObstructions:RP.0/height-pullback
  Pullback of height classes; construction.
HeightsRationalPointsAndObstructions:RP.0/surjective-pullback
  Surjective maps detect height classes; lemma.
HeightsRationalPointsAndObstructions:RP.0/northcott-one-sided
  Northcott transfer under a lower comparison; lemma.
HeightsRationalPointsAndObstructions:RP.0/northcott-invariance
  Northcott invariance under bounded error; theorem.
HeightsRationalPointsAndObstructions:RP.0/northcott-pullback
  Northcott for a boundedly equal pullback; theorem.
HeightsRationalPointsAndObstructions:RP.0/generalized-global-field
  Generalized global fields; definition.
HeightsRationalPointsAndObstructions:RP.0/geometric-height-field
  Polarized function fields as generalized global fields; construction.
HeightsRationalPointsAndObstructions:RP.0/normalized-height
  The normalised projective height; construction.
HeightsRationalPointsAndObstructions:RP.0/extension-invariance
  Heights under finite extension of the base field; lemma.
HeightsRationalPointsAndObstructions:RP.0/tuple-height-adapters
  Coordinate heights of algebraic tuples; lemma.
HeightsRationalPointsAndObstructions:RP.0/northcott-projective
  Northcott's theorem on projective space; theorem.
HeightsRationalPointsAndObstructions:RP.0/linear-change-bounded
  Linear changes of coordinates change heights boundedly; lemma.
HeightsRationalPointsAndObstructions:RP.0/morphism-height-comparison
  Heights along morphisms to projective space; theorem.
HeightsRationalPointsAndObstructions:RP.0/weil-height-machine
  Weil's height machine; construction.
HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus
  Heights are bounded below off the base locus; theorem.
HeightsRationalPointsAndObstructions:RP.0/northcott-ample
  Northcott for ample line bundles; theorem.
HeightsRationalPointsAndObstructions:RP.0/tate-limit
  Tate's limit; construction.
HeightsRationalPointsAndObstructions:RP.0/neron-tate-height
  The Néron–Tate canonical height; construction.
HeightsRationalPointsAndObstructions:RP.0/neron-tate-kernel-number-field
  Positivity and kernel of the Néron–Tate height; theorem.
HeightsRationalPointsAndObstructions:RP.0/neron-tate-bilinear-form
  The Néron–Tate bilinear form of a symmetric bundle; construction.
HeightsRationalPointsAndObstructions:RP.0/local-weil-functions
  Local Weil functions and Néron functions; definition.
HeightsRationalPointsAndObstructions:RP.0/duplication-by-quartics
  Multiplication by two is given by quartic forms; theorem.
HeightsRationalPointsAndObstructions:RP.0/silverman-tate
  The Silverman–Tate theorem in families; theorem.
HeightsRationalPointsAndObstructions:RP.0/family-duplication-estimate
  The duplication estimate in families; lemma.
HeightsRationalPointsAndObstructions:RP.0/fibrewise-height-model-independence
  The fibrewise Néron–Tate height depends only on the generic fibre; lemma.
HeightsRationalPointsAndObstructions:RP.0/silverman-specialization-limit
  Silverman's height limit theorem; theorem.
HeightsRationalPointsAndObstructions:RP.0/silverman-dominant-map-inequality
  Heights under generically finite dominant maps; theorem.
HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height
  Heights of subvarieties over polarized function fields; construction.
HeightsRationalPointsAndObstructions:RP.0/geometric-height-laws
  Laws for function-field canonical heights; theorem.
HeightsRationalPointsAndObstructions:RP.0/geometric-height-base-change
  Function-field heights under finite and constant field extensions; theorem.
HeightsRationalPointsAndObstructions:RP.0/model-mk-height-comparison
  Model heights are M_K-field heights; theorem.
HeightsRationalPointsAndObstructions:RP.0/good-reduction-height-formula
  Canonical heights under everywhere good reduction; theorem.
HeightsRationalPointsAndObstructions:RP.1/kummer-map
  Kummer maps of isogenies of abelian varieties; construction.
HeightsRationalPointsAndObstructions:RP.1/local-kummer-image-unramified
  Local Kummer images at places of good reduction; lemma.
HeightsRationalPointsAndObstructions:RP.1/selmer-group
  Selmer groups and Tate–Shafarevich groups of abelian varieties; construction.
HeightsRationalPointsAndObstructions:RP.1/descent-sequence
  The descent exact sequence; theorem.
HeightsRationalPointsAndObstructions:RP.1/selmer-finite
  Finiteness of Selmer groups; theorem.
HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil
  The weak Mordell–Weil theorem; theorem.
HeightsRationalPointsAndObstructions:RP.1/mordell-weil
  The Mordell–Weil theorem; theorem.
HeightsRationalPointsAndObstructions:RP.1/neron-tate-positive-definite
  Positive definiteness of the Néron–Tate height on A(K) ⊗ ℝ; theorem.
HeightsRationalPointsAndObstructions:RP.1/kk-trace
  Chow's K/k-trace; construction.
HeightsRationalPointsAndObstructions:RP.1/lang-neron
  The Lang–Néron theorem; theorem.
HeightsRationalPointsAndObstructions:RP.1/function-field-neron-tate-kernel
  Kernel of the Néron–Tate height over function fields; theorem.
HeightsRationalPointsAndObstructions:RP.1/two-coverings
  Two-coverings of torsors and the class W[2]; definition.
HeightsRationalPointsAndObstructions:RP.1/w2-odd-factorizations
  W[2] and odd factorisations; theorem.
HeightsRationalPointsAndObstructions:RP.1/selmer-set-two-covering
  The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k; definition.
HeightsRationalPointsAndObstructions:RP.1/elliptic-two-descent-example
  A complete elliptic 2-descent; application.
HeightsRationalPointsAndObstructions:RP.1/local-division-index
  Local indices of multiplication by two; lemma.
HeightsRationalPointsAndObstructions:RP.1/reduction-torsion-injective
  Reduction is injective on torsion; lemma.
HeightsRationalPointsAndObstructions:RP.1/two-isogeny-kummer-formula
  The Kummer map of a two-isogeny; application.
HeightsRationalPointsAndObstructions:RP.2/points-topology
  The topology on points with values in a topological algebra; definition.
HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation
  Presentations compute the points topology; lemma.
HeightsRationalPointsAndObstructions:RP.2/points-topology-base-change
  Changing the value ring; lemma.
HeightsRationalPointsAndObstructions:RP.2/adelic-points
  Adelic points of an affine variety; definition.
HeightsRationalPointsAndObstructions:RP.2/integral-model
  Integral models and their integral local points; definition.
HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique
  Integral models exist and agree at almost all places; lemma.
HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product
  Adelic points as a restricted product; theorem.
HeightsRationalPointsAndObstructions:RP.2/adelic-points-nonempty-iff
  Adelic points exist iff local points exist and are integral almost everywhere; lemma.
HeightsRationalPointsAndObstructions:RP.2/rational-points-discrete
  Rational points are discrete and closed in adelic points; lemma.
HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change
  Base change of Azumaya algebras; lemma.
HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation
  Evaluating an Azumaya algebra at a point; construction.
HeightsRationalPointsAndObstructions:RP.2/azumaya-spreading-out
  Spreading out an Azumaya algebra over an integral model; lemma.
HeightsRationalPointsAndObstructions:RP.2/azumaya-complete-dvr-split
  Azumaya algebras over the integers of a nonarchimedean local field are split; lemma.
HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support
  Brauer evaluation is trivial at almost all places; theorem.
HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing
  The Brauer–Manin pairing and the Brauer–Manin set; construction.
HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set
  Rational points lie in the Brauer–Manin set; theorem.
HeightsRationalPointsAndObstructions:RP.2/adelic-points-general
  Adelic points of separated schemes of finite type; construction.
HeightsRationalPointsAndObstructions:RP.2/scheme-brauer-evaluation
  Evaluation of scheme Brauer classes at points; construction.
HeightsRationalPointsAndObstructions:RP.2/brauer-local-constancy
  Local constancy of Brauer evaluation; theorem.
HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general
  The Brauer–Manin pairing and set for varieties; construction.
HeightsRationalPointsAndObstructions:RP.2/brauer-manin-set-closed
  Topology of Brauer–Manin sets; theorem.
HeightsRationalPointsAndObstructions:RP.2/brauer-manin-functoriality
  Functoriality of Brauer–Manin sets; lemma.
HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group
  Constant and algebraic Brauer groups; definition.
HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group
  The unramified Brauer group; definition.
HeightsRationalPointsAndObstructions:RP.2/unramified-pairing-full-product
  The unramified pairing on the full product of local points; theorem.
HeightsRationalPointsAndObstructions:RP.2/b-omega
  Almost-everywhere locally trivial algebraic Brauer classes; definition.
HeightsRationalPointsAndObstructions:RP.2/zero-cycle-brauer-pairing
  The Brauer–Manin pairing on zero-cycles; construction.
HeightsRationalPointsAndObstructions:RP.2/formal-lemma
  Harari's formal lemma; theorem.
HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-class
  Cyclic algebras and the local invariant matrix; definition.
HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-one-place
  The cyclic norm principle with one omitted place; theorem.
HeightsRationalPointsAndObstructions:RP.2/product-norm-assembly
  Assembling a global norm from a local invariant matrix; theorem.
HeightsRationalPointsAndObstructions:RP.2/brauer-trivial-complete-intersections
  Brauer groups of high-dimensional complete intersections; theorem.
HeightsRationalPointsAndObstructions:RP.2/conic-example
  Conics: Brauer–Manin set and the Hasse principle; application.
HeightsRationalPointsAndObstructions:RP.2/iskovskikh-example
  Iskovskikh's conic bundle surface; application.
HeightsRationalPointsAndObstructions:RP.2/effective-brauer-manin-test
  Finite local partitions for a finite Brauer test; effective computation requires extra input; theorem.
HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation
  Evaluation of torsors and twisted torsors; construction.
HeightsRationalPointsAndObstructions:RP.3/descent-partition
  The descent partition of rational points; theorem.
HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor
  The Selmer set of a torsor; definition.
HeightsRationalPointsAndObstructions:RP.3/local-evaluation-finite-image
  Finite local images of torsor evaluation; lemma.
HeightsRationalPointsAndObstructions:RP.3/descent-set
  Descent obstruction sets; definition.
HeightsRationalPointsAndObstructions:RP.3/descent-brauer-comparison
  Descent is at least as strong as Brauer–Manin; theorem.
HeightsRationalPointsAndObstructions:RP.3/etale-brauer-set
  The étale–Brauer set; definition.
HeightsRationalPointsAndObstructions:RP.3/etale-brauer-equals-descent
  Étale–Brauer equals descent; theorem.
HeightsRationalPointsAndObstructions:RP.3/universal-torsor
  Universal torsors and torsors of a given type; definition.
HeightsRationalPointsAndObstructions:RP.3/torus-descent-brauer
  Descent under tori and the algebraic Brauer group; theorem.
HeightsRationalPointsAndObstructions:RP.3/relative-algebraic-brauer
  The relative algebraic Brauer group of a torus torsor; definition.
HeightsRationalPointsAndObstructions:RP.3/edge-map-twist-independence
  Twist independence of the relative Brauer edge maps; theorem.
HeightsRationalPointsAndObstructions:RP.3/residual-sha-functional
  The residual Tate–Shafarevich functional; construction.
HeightsRationalPointsAndObstructions:RP.3/unramified-torus-descent
  Unramified descent for torus torsors; theorem.
HeightsRationalPointsAndObstructions:RP.3/open-torus-torsor-descent
  Descent from a torus torsor over a dense open subset; theorem.
HeightsRationalPointsAndObstructions:RP.3/brauer-manin-universal-torsor-existence
  Brauer–Manin points give universal torsors; theorem.
HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors
  Genus-one curves as torsors and the Weil–Châtelet group; comparison.
HeightsRationalPointsAndObstructions:RP.3/bgw-hasse-failures
  Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction; application.
HeightsRationalPointsAndObstructions:RP.3/descent-worked-example
  A worked descent: y² = (x² + 1)(x⁴ + 1); application.
HeightsRationalPointsAndObstructions:RP.3/strong-approximation-failure
  Finite étale covers obstruct strong approximation; theorem.
HeightsRationalPointsAndObstructions:RP.3/insufficiency-examples
  Insufficiency of the Brauer–Manin and descent obstructions; application.
HeightsRationalPointsAndObstructions:RP.4/good-reduction-curve
  Curves with good reduction outside S; definition.
HeightsRationalPointsAndObstructions:RP.4/chevalley-weil
  The Chevalley–Weil theorem; theorem.
HeightsRationalPointsAndObstructions:RP.4/de-franchis
  De Franchis' theorem; theorem.
HeightsRationalPointsAndObstructions:RP.4/kodaira-parshin-construction
  The Kodaira–Parshin construction; construction.
HeightsRationalPointsAndObstructions:RP.4/parshin-implication
  Parshin: Shafarevich finiteness implies Mordell; theorem.
HeightsRationalPointsAndObstructions:RP.4/mordell-faltings
  The Mordell conjecture (Faltings' theorem) by the Parshin route; theorem.
HeightsRationalPointsAndObstructions:RP.4/integral-points
  S-integral points on affine curves; definition.
HeightsRationalPointsAndObstructions:RP.4/siegel-theorem
  Siegel's theorem on integral points; theorem.
HeightsRationalPointsAndObstructions:RP.4/function-field-mordell
  The Mordell conjecture over function fields; theorem.
HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety
  Abelian subvarieties, cosets and quotients; definition.
HeightsRationalPointsAndObstructions:RP.5/stabilizer
  Stabilizers of subvarieties; construction.
HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety
  The abelian subvariety generated by X − X; construction.
HeightsRationalPointsAndObstructions:RP.5/ueno-locus
  The Ueno locus; definition.
HeightsRationalPointsAndObstructions:RP.5/finite-rank-subgroup
  Subgroups of finite rank; definition.
HeightsRationalPointsAndObstructions:RP.5/manin-mumford
  The Manin–Mumford theorem; theorem.
HeightsRationalPointsAndObstructions:RP.5/manin-mumford-positive-characteristic
  Manin–Mumford for trivial trace in positive characteristic; theorem.
HeightsRationalPointsAndObstructions:RP.5/uniform-manin-mumford
  Uniform Manin–Mumford in families; theorem.
HeightsRationalPointsAndObstructions:RP.5/faltings-subvarieties
  Faltings' theorem on rational points of subvarieties of abelian varieties; theorem.
HeightsRationalPointsAndObstructions:RP.5/vojta-inequality
  Vojta's inequality; theorem.
HeightsRationalPointsAndObstructions:RP.5/mumford-gap
  Mumford's gap principle; theorem.
HeightsRationalPointsAndObstructions:RP.5/vojta-bombieri-mordell
  Faltings' theorem by the Vojta–Bombieri route; theorem.
HeightsRationalPointsAndObstructions:RP.5/mordell-lang
  The Mordell–Lang theorem; theorem.
HeightsRationalPointsAndObstructions:RP.5/faltings-zhang-map
  The Faltings–Zhang difference map; construction.
HeightsRationalPointsAndObstructions:RP.5/zhang-difference-lemma
  Zhang's difference-map lemma; theorem.
HeightsRationalPointsAndObstructions:RP.5/minimal-torsion-subvariety
  The minimal torsion subvariety containing X; construction.
HeightsRationalPointsAndObstructions:RP.5/essential-minimum
  The essential minimum of a subvariety; definition.
HeightsRationalPointsAndObstructions:RP.5/bogomolov
  The Bogomolov conjecture (Ullmo–Zhang); theorem.
HeightsRationalPointsAndObstructions:RP.5/szpiro-ullmo-zhang-equidistribution
  Equidistribution of small points on abelian varieties; theorem.
HeightsRationalPointsAndObstructions:RP.5/coset-free-hypersurface-sections
  Hypersurface sections of abelian varieties containing no cosets; theorem.
HeightsRationalPointsAndObstructions:RP.6/local-solubility
  Local solubility and the local-global principle; definition.
HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian
  Rational points of curves through the Abel–Jacobi embedding; theorem.
HeightsRationalPointsAndObstructions:RP.6/genus-zero-classification
  Rational points on genus-zero curves; theorem.
HeightsRationalPointsAndObstructions:RP.6/genus-one-classification
  Rational points on genus-one curves; theorem.
HeightsRationalPointsAndObstructions:RP.6/higher-genus-classification
  Rational points on curves of genus at least two; theorem.
HeightsRationalPointsAndObstructions:RP.6/conjecture-register
  Statements of the open conjectures (no consumer treats them as proved); definition.

-/
