import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight

/-!
# Heights, rational points and obstructions: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned Mathlib and Tau Ceti APIs; it is not exhaustive.
The height quotient uses uniformly bounded functions on the whole domain. Tate limits use
an expanding factor, and the elliptic comparison uses one half of the naive x-height.
Affine points have the evaluation topology, and adelic integrality is relative to a chosen
integral model. Finite rank means finite rational dimension, without finite generation.
-/

noncomputable section
namespace TauCetiRoadmap.HeightsRationalPointsAndObstructions
universe u v w
open CategoryTheory _root_.AlgebraicGeometry Height
open scoped CategoryTheory.MonObj TensorProduct

/-! ## Layer 0: height classes and canonical heights -/

/-- Heights modulo uniformly bounded real functions, using the native quotient module. -/
abbrev HeightClass (X : Type u) :=
  (X → ℝ) ⧸ Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)

namespace HeightClass
variable {X : Type u}

/-- The linear projection of a real-valued function to its bounded-error class. -/
abbrev mk : (X → ℝ) →ₗ[ℝ] HeightClass X :=
  (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)).mkQ

/-- Two representatives agree precisely when their difference is uniformly bounded. -/
theorem mk_eq_mk_iff (h g : X → ℝ) :
    mk h = mk g ↔ ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |h x - g x| ≤ C := by sorry

/-- Northcott finiteness is a property of a bounded-error class. -/
theorem northcott_congr {h g : X → ℝ} (H : mk h = mk g) :
    Northcott h ↔ Northcott g := by sorry

example (h : Empty → ℝ) : mk h = 0 := by sorry
example : mk (fun n : ℕ => (-1 : ℝ)^n) = 0 := by sorry
example : mk (fun n : ℕ => (n : ℝ)) ≠ 0 := by sorry
example : mk (fun _ : ℕ => (1 : ℝ)) = mk (fun _ : ℕ => (0 : ℝ)) ∧
    mk (fun n : ℕ => (1 : ℝ) * n) ≠ mk (fun n : ℕ => (0 : ℝ) * n) := by sorry

end HeightClass

/-- The Tate limit written as its telescoping series. Its convergence theorem assumes d > 1. -/
def tateLimit {S : Type u} (φ : S → S) (d : ℝ) (f : S → ℝ) (s : S) : ℝ :=
  f s + ∑' m : ℕ, (d⁻¹) ^ (m + 1) * (f (φ^[m + 1] s) - d * f (φ^[m] s))

section TateLimit
variable {S : Type u} (φ : S → S) {d : ℝ} (f : S → ℝ)

/-- An expanding orbit with bounded functional-equation error has the Tate limit. -/
theorem tendsto_tateLimit (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    Filter.Tendsto (fun m : ℕ => (d⁻¹) ^ m * f (φ^[m] s)) Filter.atTop
      (nhds (tateLimit φ d f s)) := by sorry

/-- The uniform error is bounded by C/(d−1), with positive denominator. -/
theorem abs_tateLimit_sub_le (hd : 1 < d) {C : ℝ} (hf : ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    |tateLimit φ d f s - f s| ≤ C / (d - 1) := by sorry

/-- The limit satisfies the exact scaling equation. -/
theorem tateLimit_comp (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (s : S) :
    tateLimit φ d f (φ s) = d * tateLimit φ d f s := by sorry

/-- Exact scaling and bounded distance from the representative characterize the limit. -/
theorem tateLimit_unique (hd : 1 < d) (hf : ∃ C, ∀ s, |f (φ s) - d * f s| ≤ C) (g : S → ℝ)
    (hg : ∀ s, g (φ s) = d * g s) (hb : ∃ C, ∀ s, |g s - f s| ≤ C) :
    g = tateLimit φ d f := by sorry

end TateLimit

example : tateLimit (id : ℕ → ℕ) 2 (fun _ => 1) = fun _ => 0 := by sorry
example {F : Type u} [Field F] [AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] :
    tateLimit (fun P : W.Point => 2 • P) 4 (fun P => P.naiveHeight / 2) =
      fun P => P.canonicalHeight := by sorry

-- The expanding-factor hypothesis is necessary.
example : ¬ ∃ l : ℝ, Filter.Tendsto (fun m : ℕ => (m : ℝ))
    Filter.atTop (nhds l) := by sorry

/-- Northcott for finite-dimensional projective space over a fixed number field. -/
theorem northcott_projectivization (K : Type u) [Field K] [NumberField K] (n : ℕ) :
    Northcott (Projectivization.logHeight (K := K) («ι» := Fin (n + 1))) := by sorry

/-- A fixed-field linear coordinate change changes projective height by a bounded amount. -/
theorem logHeight_linearChange_bounded (K : Type u) [Field K] [NumberField K]
    {n : ℕ} (T : (Fin (n + 1) → K) ≃ₗ[K] (Fin (n + 1) → K)) :
    ∃ C : ℝ, ∀ x : Fin (n + 1) → K, x ≠ 0 →
      |logHeight (T x) - logHeight x| ≤ C := by sorry

example : Set.ncard {x : Projectivization ℚ (Fin 2 → ℚ) |
    Projectivization.logHeight x ≤ Real.log 2} = 8 := by sorry

/-- Unhalved polarization of the native elliptic (O)-height. -/
def ellipticUnhalvedPolarization
    {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P Q : W.Point) : ℝ :=
  (P + Q).canonicalHeight - P.canonicalHeight - Q.canonicalHeight

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P Q : W.Point) :
    ellipticUnhalvedPolarization P Q = 2 * W.neronTatePairing P Q := by sorry

example {F : Type u} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    {W : WeierstrassCurve.Affine F} [W.IsElliptic] (P : W.Point) :
    ellipticUnhalvedPolarization P P = 2 * P.canonicalHeight := by sorry

/-! ## Layer 1: Mordell–Weil on native abelian-variety points -/

/-- The additive form of the native group of L-points of an abelian variety over K. -/
abbrev AbelianVariety.Points {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (L : Type u) [Field L] [Algebra K L] : Type u :=
  Additive (Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K L))) ⟶ A.toOver)

namespace AbelianVariety
variable {K : Type u} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K)

example (P : Points A K) : (-P) + P = 0 := by simp
example (P : Points A K) : 2 • P = P + P := by simp [two_nsmul]

/-- The point-level kernel of multiplication by n; no geometric torsion scheme is replaced. -/
def torsion (n : ℕ) (L : Type u) [Field L] [Algebra K L] : AddSubgroup (Points A L) :=
  (nsmulAddMonoidHom n : Points A L →+ Points A L).ker

/-- Weak Mordell–Weil for a number field; n=0 is excluded. -/
theorem finite_quotient_nsmul [NumberField K] (n : ℕ) (hn : 0 < n) :
    Finite (Points A K ⧸ (nsmulAddMonoidHom n : Points A K →+ Points A K).range) := by sorry

/-- General abelian-variety Mordell–Weil over a number field. -/
theorem fg_points [NumberField K] : AddGroup.FG (Points A K) := by sorry

example (L : Type u) [Field L] [Algebra K L] : torsion A 1 L = ⊥ := by sorry
example (L : Type u) [Field L] [Algebra K L] : torsion A 0 L = ⊤ := by sorry

end AbelianVariety

/-! ## Layer 2: affine and adelic point topology -/

/-- Affine points as algebra maps, on a type synonym supporting the evaluation topology. -/
def Points (R : Type u) (A : Type v) (B : Type w)
    [CommRing R] [CommRing A] [Algebra R A] [CommRing B] [Algebra R B] :
    Type (max v w) := A →ₐ[R] B

namespace Points
variable {R : Type u} {A : Type v} {B : Type w}
  [CommRing R] [CommRing A] [Algebra R A] [CommRing B] [Algebra R B]

/-- Evaluation of an affine point. -/
instance : FunLike (Points R A B) A B := inferInstanceAs (FunLike (A →ₐ[R] B) A B)

/-- The algebra laws on affine points are the native algebra-map laws. -/
instance : AlgHomClass (Points R A B) R A B :=
  inferInstanceAs (AlgHomClass (A →ₐ[R] B) R A B)

/-- Pointwise evaluation induces the affine point topology. -/
instance topologicalSpace [TopologicalSpace B] : TopologicalSpace (Points R A B) :=
  TopologicalSpace.induced (fun φ : Points R A B => (φ : A → B)) inferInstance

/-- A finite presentation realizes points as a closed solution set in a finite power. -/
theorem isClosedEmbedding_generators [TopologicalSpace B] [IsTopologicalRing B] [T1Space B]
    {n : ℕ} (π : MvPolynomial (Fin n) R →ₐ[R] A) (hπ : Function.Surjective π) :
    Topology.IsClosedEmbedding
      (fun φ : Points R A B => fun i => φ (π (MvPolynomial.X i))) := by sorry

/-- Affine finite-type points over a locally compact Hausdorff topological ring are locally compact. -/
theorem locallyCompactSpace [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]
    [LocallyCompactSpace B] [Algebra.FiniteType R A] :
    LocallyCompactSpace (Points R A B) := by sorry

end Points

example : Nonempty (Points ℤ (Polynomial ℤ) ℝ ≃ₜ ℝ) := by sorry
example (R B : Type) [CommRing R] [CommRing B] [Algebra R B] [Nontrivial B] :
    IsEmpty (Points R PUnit B) := by sorry

section Adelic
open NumberField IsDedekindDomain
variable (K : Type) [Field K] [NumberField K]
  (A : Type) [CommRing A] [Algebra K A]

/-- Affine adelic points, using the native number-field adele algebra. -/
abbrev AdelicPoints := Points K A (AdeleRing (𝓞 K) K)

/-- The affine number-field diagonal is discrete and closed. -/
theorem discrete_closed_diagonal [Algebra.FiniteType K A] :
    let diag : Points K A K → AdelicPoints K A :=
      fun x => (Algebra.ofId K (AdeleRing (𝓞 K) K)).comp (x : A →ₐ[K] K)
    IsClosed (Set.range diag) ∧ DiscreteTopology (Set.range diag) := by sorry

/-- Local compactness at the pins states its ambient hypothesis explicitly. -/
theorem locallyCompact_adelicPoints [Algebra.FiniteType K A]
    [LocallyCompactSpace (AdeleRing (𝓞 K) K)] :
    LocallyCompactSpace (AdelicPoints K A) := by sorry

end Adelic

example (K : Type) [Field K] [NumberField K] : Subsingleton (AdelicPoints K K) := by sorry
example : IsEmpty (AdelicPoints ℚ
    (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X ^ 2 + 1 : Polynomial ℚ)})) := by sorry

/-! ## Layer 3: torsor descent and comparison of obstructions -/

/-! ## Layer 4: curve covers and integral points -/

/-! ## Layer 5: finite rank and difference maps -/

/-- Finite rational rank, without an assumption of finite generation. -/
def HasFiniteRank (G : Type u) [AddCommGroup G] : Prop := FiniteDimensional ℚ (ℚ ⊗[ℤ] G)

/-- Finite rank is equivalent to containment in a finitely generated division hull. -/
theorem finiteRank_iff_le_divisionHull {G : Type u} [AddCommGroup G] (Γ : AddSubgroup G) :
    HasFiniteRank Γ ↔ ∃ Γ₀ : AddSubgroup G, AddGroup.FG Γ₀ ∧ Γ₀ ≤ Γ ∧
      ∀ x ∈ Γ, ∃ N : ℕ, 0 < N ∧ N • x ∈ Γ₀ := by sorry

example (r : ℕ) : HasFiniteRank (Fin r → ℤ) := by sorry
example : HasFiniteRank ℚ ∧ ¬ AddGroup.FG ℚ := by sorry

/-- The point-level Faltings–Zhang difference homomorphism, with target A^M. -/
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

example {G : Type u} [AddCommGroup G] (P Q : G) :
    faltingsZhang 1 ![P, Q] 0 = Q - P := rfl

example {G : Type u} [AddCommGroup G] (M : ℕ) (P : Fin (M + 1) → G) :
    faltingsZhang M P = 0 ↔ ∀ i, P i = P 0 := by sorry

/-! ## Layer 6: rational points by genus -/

/-!
The README gives the defining interfaces that need geometric or cohomological carriers:
height-class pullback; generalized global fields and polarized function-field structures;
normalized geometric projective heights; the Weil height machine; general Néron–Tate heights
and their bilinear forms; bounded point metrics, canonical point metrics and local Weil
functions; geometric subvariety heights; isogeny Kummer maps and Kummer Selmer structures;
the K/k-trace; two-coverings and their two-Selmer sets; integral models and the general
adelic model direct limit; affine and general Brauer–Manin pairings; algebraic, unramified
and almost-everywhere trivial Brauer subgroups; zero-cycle Brauer evaluation; cyclic-algebra
invariant matrices; torsor evaluation and twists, torsor Selmer sets, descent and étale–Brauer
sets; universal torsors and relative algebraic Brauer groups; the residual Sha functional;
good reduction outside S, Kodaira–Parshin covers and S-integral points; positive-dimensional
abelian quotients, closed-subvariety stabilizers, generated abelian subvarieties and Ueno
loci; minimal torsion cosets and essential minima; local solubility and the conjecture
register. Affine Azumaya and scheme Brauer evaluation are imported supplier interfaces.
The existing point groups do not encode the hypotheses of these geometric definitions or
the genus-classification and small-point measure theorems.
-/

end TauCetiRoadmap.HeightsRationalPointsAndObstructions
