import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight

/-!
# Arithmetic dynamics: representative target signatures

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
These light definitions and milestone statements suggest names and signatures on
existing Mathlib and Tau Ceti carriers. The README specifies the full theories,
including rational maps, dynatomic curves, analytic lines, adelic measures and
preimage trees.

Iteration includes the identity at zero. Periods are positive. Heights on number
fields are native relative heights unless divided by the field degree. The elliptic
comparison below uses the normalization of Tau Ceti f790474. The complex sphere
uses `OnePoint ℂ` with its compatible compact uniformity. Morton coordinates are
used only where their displayed denominators are nonzero.
-/

namespace TauCetiRoadmap.ArithmeticDynamics

open scoped Topology
open Polynomial

/-! ## Layer 0: Iteration, maps and moduli -/

section Orbits
variable {α β : Type*}

/-- The forward orbit includes the starting point. -/
def forwardOrbit (f : α → α) (x : α) : Set α :=
  Set.range fun n : ℕ ↦ f^[n] x

/-- A preperiodic point eventually reaches a positive-period point. -/
def IsPreperiodicPt (f : α → α) (x : α) : Prop :=
  ∃ m : ℕ, f^[m] x ∈ Function.periodicPts f

/-- Finite forward orbit is equivalent to eventual periodicity on any type. -/
theorem isPreperiodicPt_iff_finite_forwardOrbit {f : α → α} {x : α} :
    IsPreperiodicPt f x ↔ (forwardOrbit f x).Finite := sorry

/-- Passing to a positive iterate preserves preperiodicity. -/
theorem isPreperiodicPt_iterate_iff {f : α → α} {x : α} {k : ℕ} (hk : 0 < k) :
    IsPreperiodicPt f^[k] x ↔ IsPreperiodicPt f x := sorry

/-- Bijective semiconjugacy transports preperiodicity in both directions. -/
theorem isPreperiodicPt_map_iff_of_bijective {fa : α → α} {fb : β → β}
    {g : α → β} (h : Function.Semiconj g fa fb) (hg : Function.Bijective g) (x : α) :
    IsPreperiodicPt fb (g x) ↔ IsPreperiodicPt fa x := sorry

/-- A stationary orbit consists of exactly its starting point. -/
example (x : α) : forwardOrbit id x = {x} := by
  ext y
  simp [forwardOrbit]

/-- The quadratic map has a tail into the two-cycle `0 ↔ -1`. -/
example : forwardOrbit (fun z : ℤ ↦ z ^ 2 - 1) 1 = {1, 0, -1} := by
  ext z
  constructor
  · rintro ⟨n, rfl⟩
    induction n with
    | zero => simp
    | succ n ih =>
      change (fun z : ℤ ↦ z ^ 2 - 1)^[n + 1] 1 ∈ {1, 0, -1}
      rw [Function.iterate_succ_apply']
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at ih ⊢
      rcases ih with h | h | h <;> rw [h] <;> norm_num
  · intro hz
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hz
    rcases hz with rfl | rfl | rfl
    · exact ⟨0, rfl⟩
    · exact ⟨1, by norm_num [Function.iterate_succ_apply']⟩
    · exact ⟨2, by norm_num [Function.iterate_succ_apply']⟩

/-- The identity makes every point periodic with positive period one. -/
example (x : α) : IsPreperiodicPt id x := by
  refine ⟨0, ?_⟩
  exact ⟨1, by norm_num, rfl⟩

/-- A genuine tail is preperiodic without requiring the starting point to be periodic. -/
example : IsPreperiodicPt (fun z : ℤ ↦ z ^ 2 - 1) 1 := by
  refine ⟨1, 2, by norm_num, ?_⟩
  norm_num [Function.IsPeriodicPt, Function.IsFixedPt, Function.iterate_succ_apply']
end Orbits

/-! ## Layer 1: Canonical heights -/

section Heights
variable {S : Type*} {φ : S → S} {h : S → ℝ} {a : ℝ}

/-- The Tate limit; convergence is a theorem under expansion and bounded error. -/
noncomputable def tateLimit (φ : S → S) (h : S → ℝ) (a : ℝ) (P : S) : ℝ :=
  Filter.limUnder Filter.atTop fun n : ℕ ↦ h (φ^[n] P) / a ^ n

/-- Call–Silverman Theorem 1.1: bounded height error and `a > 1` give convergence. -/
theorem tendsto_tateLimit (ha : 1 < a)
    (hC : ∃ C, ∀ Q, |h (φ Q) - a * h Q| ≤ C) (P : S) :
    Filter.Tendsto (fun n : ℕ ↦ h (φ^[n] P) / a ^ n) Filter.atTop
      (𝓝 (tateLimit φ h a P)) := sorry

/-- The geometric-series error bound retains its expansion denominator. -/
theorem abs_tateLimit_sub_le (ha : 1 < a) {C : ℝ}
    (hC : ∀ Q, |h (φ Q) - a * h Q| ≤ C) (P : S) :
    |tateLimit φ h a P - h P| ≤ C / (a - 1) := sorry

/-- The canonical height scales by the expansion factor under the map. -/
theorem tateLimit_apply (ha : 1 < a)
    (hC : ∃ C, ∀ Q, |h (φ Q) - a * h Q| ≤ C) (P : S) :
    tateLimit φ h a (φ P) = a * tateLimit φ h a P := sorry

/-- The functional equation and bounded difference characterize the canonical height. -/
theorem eq_tateLimit_of_bounded (ha : 1 < a)
    (hC : ∃ C, ∀ Q, |h (φ Q) - a * h Q| ≤ C) {g : S → ℝ}
    (hg : ∃ B, ∀ P, |g P - h P| ≤ B) (hgφ : ∀ P, g (φ P) = a * g P) :
    g = tateLimit φ h a := sorry

/-- Northcott on a forward-invariant set gives the zero-height criterion. -/
theorem tateLimit_eq_zero_iff (ha : 1 < a)
    (hC : ∃ C, ∀ Q, |h (φ Q) - a * h Q| ≤ C)
    {A : Set S} (hA : Set.MapsTo φ A A)
    (hN : ∀ B : ℝ, {Q | Q ∈ A ∧ h Q ≤ B}.Finite) {P : S} (hP : P ∈ A) :
    tateLimit φ h a P = 0 ↔ IsPreperiodicPt φ P := sorry

/-- The doubling sequence on an elliptic curve is twice the pinned elliptic height. -/
theorem tateLimit_elliptic_doubling {F : Type*} [Field F]
    [Height.AdmissibleAbsValues F] [DecidableEq F]
    (W : WeierstrassCurve F) [W.IsElliptic] (P : W.toAffine.Point) :
    tateLimit (fun Q : W.toAffine.Point ↦ 2 • Q)
      WeierstrassCurve.Affine.Point.naiveHeight 4 P = 2 * P.canonicalHeight := sorry

/-- Vanishing initial height has vanishing Tate limit, including at zero expansion. -/
example (φ : S → S) (a : ℝ) (P : S) : tateLimit φ (fun _ ↦ 0) a P = 0 := by
  simp only [tateLimit, zero_div]
  exact Filter.Tendsto.limUnder_eq tendsto_const_nhds

/-- Exact exponential growth fixes the height normalization. -/
theorem tateLimit_double (x : ℝ) :
    tateLimit (fun y : ℝ ↦ 2 * y) id 2 x = x := sorry
end Heights

/-! ## Layer 2: Local heights, Julia sets and canonical measures -/

section LocalDynamics
variable {X Y : Type*}

/-- The backward orbit includes the zeroth preimage. -/
def backwardOrbit (f : X → X) (a : X) : Set X :=
  {x | ∃ n : ℕ, f^[n] x = a}

/-- A classical exceptional point has finite backward orbit. -/
def exceptionalSet (f : X → X) : Set X :=
  {a | (backwardOrbit f a).Finite}

/-- Conjugacy transports exceptional points and their backward orbits. -/
theorem backwardOrbit_conjugate (f : X → X) (h : X ≃ Y) (a : X) :
    backwardOrbit (fun y ↦ h (f (h.symm y))) (h a) = h '' backwardOrbit f a ∧
      exceptionalSet (fun y ↦ h (f (h.symm y))) = h '' exceptionalSet f := sorry

/-- The identity has singleton backward orbits. -/
example (a : X) : backwardOrbit id a = {a} := by
  ext x
  simp [backwardOrbit]

/-- Every point is exceptional for the degree-one identity. -/
example : exceptionalSet (id : X → X) = Set.univ := by
  ext x
  simp [exceptionalSet, backwardOrbit]

section Uniform
variable [UniformSpace X]

/-- The Fatou set is the open locus of uniform equicontinuity of the iterates. -/
def classicalFatou (f : X → X) : Set X :=
  {x | ∃ U : Set X, IsOpen U ∧ x ∈ U ∧
    UniformEquicontinuousOn (fun n : ℕ ↦ f^[n]) U}

/-- The classical Julia set is the complement of the Fatou set. -/
def classicalJulia (f : X → X) : Set X := (classicalFatou f)ᶜ

/-- The Fatou/Julia decomposition respects uniform conjugacy. -/
theorem classicalFatou_uniformConjugate [UniformSpace Y] (f : X → X) (h : X ≃ᵤ Y) :
    classicalFatou (fun y ↦ h (f (h.symm y))) = h '' classicalFatou f ∧
      classicalJulia (fun y ↦ h (f (h.symm y))) = h '' classicalJulia f := sorry

/-- Equicontinuity is local and therefore gives the open/closed decomposition. -/
theorem isOpen_classicalFatou (f : X → X) :
    IsOpen (classicalFatou f) ∧ IsClosed (classicalJulia f) := sorry

/-- The identity has no Julia points on any uniform space. -/
example : classicalFatou (id : X → X) = Set.univ ∧
    classicalJulia (id : X → X) = ∅ := by
  have hF : classicalFatou (id : X → X) = Set.univ := by
    ext x
    simp only [Set.mem_univ, iff_true]
    refine ⟨Set.univ, isOpen_univ, Set.mem_univ x, ?_⟩
    apply UniformEquicontinuous.uniformEquicontinuousOn
    intro U hU
    filter_upwards [hU] with xy hxy n
    simpa using hxy
  exact ⟨hF, by simp [classicalJulia, hF]⟩
end Uniform

section Sphere
noncomputable local instance : UniformSpace (OnePoint ℂ) := uniformSpaceOfCompactR1

/-- The classical exceptional set of a complex power map consists of zero and infinity. -/
theorem exceptionalSet_complexPower (d : ℕ) (hd : 2 ≤ d) :
    exceptionalSet (fun z : OnePoint ℂ ↦
      match z with
      | none => none
      | some a => some (a ^ d)) =
        {OnePoint.some (0 : ℂ), OnePoint.infty} := sorry

/-- The Julia set of a complex power map is the unit circle on the sphere. -/
theorem classicalJulia_complexPower (d : ℕ) (hd : 2 ≤ d) :
    classicalJulia (fun z : OnePoint ℂ ↦
      match z with
      | none => none
      | some a => some (a ^ d)) =
        OnePoint.some '' {z : ℂ | ‖z‖ = 1} := sorry
end Sphere
end LocalDynamics

/-! ## Layer 3: Periodic equations, dynatomic curves and certified arithmetic -/

/-- Morton's symmetric equation for two marked rational three-cycles. -/
def mortonThreeCycleEquation (t u : ℚ) : ℚ :=
  (t ^ 2 - 1) * u ^ 3 + (t ^ 3 - 2 * t ^ 2 - 9 * t + 2) * u ^ 2 -
    9 * (t ^ 2 - 1) * u - (t ^ 3 - 2 * t ^ 2 - 9 * t + 2)

/-- Parameter attached to a point on a quadratic three-cycle. -/
def mortonThreeCycleParameter (c x : ℚ) : ℚ := 1 + 2 * c + 2 * x + 2 * x ^ 2

/-- The inverse point coordinate is used on `t² ≠ 1`. -/
def mortonThreeCycleInversePoint (t : ℚ) : ℚ :=
  (t ^ 3 + t ^ 2 - t + 7) / (4 * (t ^ 2 - 1))

/-- The inverse quadratic parameter is used on `t² ≠ 1`. -/
def mortonThreeCycleInverseCoefficient (t : ℚ) : ℚ :=
  -(t ^ 6 - 2 * t ^ 5 + 11 * t ^ 4 + 20 * t ^ 3 + 23 * t ^ 2 - 18 * t + 29) /
    (16 * (t ^ 2 - 1) ^ 2)

/-- Rotating the marked three-cycle changes its parameter by this Möbius map. -/
def mortonThreeCycleRotation (t : ℚ) : ℚ := (t + 3) / (1 - t)

/-- The rotation-invariant trace separates the underlying cycle parameter. -/
def mortonCycleTrace (t : ℚ) : ℚ := (t ^ 3 - 9 * t) / (t ^ 2 - 1)

/-- Coordinates of Morton's elliptic quotient, on the domain `t + u ≠ 0`. -/
def mortonEllipticCoordinates (t u : ℚ) : ℚ × ℚ :=
  ((t + u + 2) / (t + u),
   (t * u * (t + u - 2) - (3 * (t + u) + 2)) / (t + u) ^ 2)

/-- The displayed inverse recovers the three-cycle parameter away from its poles. -/
theorem mortonThreeCycleParameter_inverse (t : ℚ) (ht : t ^ 2 ≠ 1) :
    mortonThreeCycleParameter (mortonThreeCycleInverseCoefficient t)
      (mortonThreeCycleInversePoint t) = t := sorry

/-- The quotient lands on the explicit elliptic equation (Morton Lemma 6, p. 363). -/
theorem mortonEllipticEquation (t u : ℚ)
    (hH : mortonThreeCycleEquation t u = 0) (hζ : t + u ≠ 0) :
    (mortonEllipticCoordinates t u).2 ^ 2 =
      4 * (mortonEllipticCoordinates t u).1 ^ 3 -
        11 * (mortonEllipticCoordinates t u).1 ^ 2 +
          8 * (mortonEllipticCoordinates t u).1 := sorry

/-- Any two exact rational period-three points lie on the same cycle (Morton Theorem 3). -/
theorem atMostOneRationalThreeCycle (c x y : ℚ)
    (hx : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3)
    (hy : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y = 3) :
    y = x ∨ y = x ^ 2 + c ∨ y = (x ^ 2 + c) ^ 2 + c := sorry

/-- The three marked points of `z² - 29/16` have parameters `3, -3, 0`. -/
example :
    mortonThreeCycleParameter (-29 / 16) (5 / 4) = 3 ∧
      mortonThreeCycleParameter (-29 / 16) (-1 / 4) = -3 ∧
      mortonThreeCycleParameter (-29 / 16) (-7 / 4) = 0 := by
  norm_num [mortonThreeCycleParameter]

/-- The inverse coordinates recover the same map and the first point of the cycle. -/
example : mortonThreeCycleInversePoint 3 = 5 / 4 ∧
    mortonThreeCycleInverseCoefficient 3 = -29 / 16 := by
  norm_num [mortonThreeCycleInversePoint, mortonThreeCycleInverseCoefficient]

/-- Rotation changes the marking and keeps the cycle trace fixed in this example. -/
example : mortonThreeCycleRotation 3 = -3 ∧ mortonThreeCycleRotation (-3) = 0 ∧
    mortonThreeCycleRotation 0 = 3 ∧
    mortonCycleTrace 3 = 0 ∧ mortonCycleTrace (-3) = 0 ∧ mortonCycleTrace 0 = 0 := by
  norm_num [mortonThreeCycleRotation, mortonCycleTrace]

/-- A genuine affine quotient point satisfies both equations. -/
example : mortonThreeCycleEquation (-1) (-1) = 0 ∧
    mortonEllipticCoordinates (-1) (-1) = (0, 0) := by
  norm_num [mortonThreeCycleEquation, mortonEllipticCoordinates]

/-- Totalized division identifies a point outside the quotient's affine domain with a
valid image, so the nonzero-denominator guard in `mortonEllipticEquation` is essential. -/
example : mortonThreeCycleEquation 1 (-1) = 0 ∧ (1 : ℚ) + (-1) = 0 ∧
    mortonEllipticCoordinates 1 (-1) = mortonEllipticCoordinates (-1) (-1) := by
  norm_num [mortonThreeCycleEquation, mortonEllipticCoordinates]

/-- An absolute logarithmic bound becomes a native radius with a field-degree factor. -/
theorem relativeHeightCandidateBound (K : Type*) [Field K] [NumberField K]
    (x : K) (B D : ℝ)
    (hB : Height.logHeight₁ x / (Module.finrank ℚ K : ℝ) ≤ B)
    (hD : Real.exp ((Module.finrank ℚ K : ℝ) * B) ≤ D) :
    Height.mulHeight₁ x ≤ D := sorry

/-- A native logarithmic bound uses its exponential directly. -/
theorem nativeHeightCandidateBound (K : Type*) [Field K] [NumberField K]
    (x : K) (B D : ℝ) (hB : Height.logHeight₁ x ≤ B) (hD : Real.exp B ≤ D) :
    Height.mulHeight₁ x ≤ D := sorry

/-! ## Layer 4: Adelic equidistribution and dynamical pairings

The adelic measures, metrized line bundles and pairings have their complete
mathematical definitions and equidistribution statements in the README.
-/

/-! ## Layer 5: Arboreal Galois representations -/

/-- The discriminant recursion for iterates, with the leading-coefficient correction
for a non-monic polynomial. Critical points are counted with multiplicity. -/
theorem discr_iterate_sub_succ {K : Type*} [Field K] (f : K[X])
    (hd : (f.natDegree : K) ≠ 0) (α : K) (n : ℕ)
    {L : Type*} [Field L] [Algebra K L] [IsAlgClosed L] :
    algebraMap K L (f.comp^[n + 1] X - C α).discr =
      algebraMap K L ((-1) ^ (f.natDegree * (f.natDegree - 1) / 2) *
        (f.natDegree : K) ^ f.natDegree * f.leadingCoeff ^ (f.natDegree - 1)) ^
          (f.natDegree ^ n) *
      algebraMap K L f.leadingCoeff ^
        ((f.natDegree ^ n - 1) * (f.natDegree ^ (n + 1) + 1)) *
      algebraMap K L (f.comp^[n] X - C α).discr ^ f.natDegree *
      (((derivative f).map (algebraMap K L)).roots.map
        (fun r => aeval r (f.comp^[n + 1] X - C α))).prod := sorry

/-! ## Layer 6: Families, specialization and orbit intersections -/

/-- Arithmetic progressions have nonnegative step; zero step includes a singleton. -/
def IsFiniteUnionAP (S : Set ℕ) : Prop :=
  ∃ A : Finset (ℕ × ℕ), S = ⋃ ab ∈ A, Set.range fun k : ℕ => ab.1 * k + ab.2

/-- Finite unions of progressions are exactly the eventually periodic subsets of ℕ. -/
theorem isFiniteUnionAP_iff_eventually_periodic (S : Set ℕ) :
    IsFiniteUnionAP S ↔ ∃ N p : ℕ, 0 < p ∧ ∀ n ≥ N, (n ∈ S ↔ n + p ∈ S) := sorry

/-- A finite hitting set is permitted by the zero-step convention. -/
example : IsFiniteUnionAP {3, 7} := by
  refine ⟨{(0, 3), (0, 7)}, ?_⟩
  ext n
  simp [or_comm]

/-- A positive-step infinite progression is included without a finiteness hypothesis. -/
example : IsFiniteUnionAP (Set.range fun k : ℕ => 2 * k) := by
  refine ⟨{(2, 0)}, ?_⟩
  simp

/-- A primitive root over an embedded parameter field extends its embedding uniquely. -/
theorem primitiveRootTransport (F L E : Type*) [Field F] [Field L] [Field E]
    [Algebra F L] (y : L) (hy : IsIntegral F y)
    (hgen : IntermediateField.adjoin F {y} = ⊤)
    (e : F →+* E) (η : E) (hη : (minpoly F y).eval₂ e η = 0) :
    ∃! σ : L →+* E, (∀ a : F, σ (algebraMap F L a) = e a) ∧ σ y = η := sorry

/-- Lech–Cassels embedding with finitely many integral marks and arbitrarily large prime. -/
theorem lechIntegralAssembly (L : Type*) [Field L] [Algebra ℚ L]
    [Algebra.EssFiniteType ℚ L] (s : Finset L) (N : ℕ) :
    ∃ p : ℕ, N < p ∧ ∃ _ : Fact p.Prime, ∃ σ : L →+* ℚ_[p],
      ∀ x ∈ s, ‖σ x‖ ≤ 1 := sorry

/-- Ritt's equal-iterate classification uses compositional iterates and includes
`s = 0`, the monomial case of the support condition. -/
theorem rittCommonIterate (F G : Polynomial ℂ) (hd : 1 < F.natDegree)
    (n : ℕ) (hn : 0 < n) :
    (fun z : ℂ => F.eval z)^[n] = (fun z : ℂ => G.eval z)^[n] ↔
      ∃ (β γ : ℂ) (H : Polynomial ℂ) (r s : ℕ),
        γ ≠ 0 ∧ (∀ k, H.coeff k ≠ 0 → ∃ m : ℕ, k = r + s * m) ∧
        F = C (-β) + C γ * H.comp (X + C β) ∧
        G = C (-β) + H.comp (X + C β) ∧
        γ ^ s = 1 ∧ γ ^ (∑ k ∈ Finset.range n, F.natDegree ^ k) = 1 := sorry

/-- Infinite synchronized intersection of two nonconstant affine orbits forces a
common positive iterate; this is the complex-field specialization. -/
theorem linearSynchronizedIntersection (a b c e x₀ y₀ : ℂ)
    (ha : a ≠ 0) (hc : c ≠ 0)
    (hcommon : Set.Infinite {z : ℂ | ∃ n : ℕ,
      (fun w => a * w + b)^[n] x₀ = z ∧ (fun w => c * w + e)^[n] y₀ = z}) :
    ∃ m : ℕ, 0 < m ∧
      (fun w : ℂ => a * w + b)^[m] = (fun w : ℂ => c * w + e)^[m] := sorry

/-!
README definition families whose full carriers and APIs are specified there:

Layer 0:
* The forward orbit of a point under a self-map (`forwardOrbit`).
* Preperiodic points of a self-map (`IsPreperiodicPt`).
* The resultant of a pair of binary forms (`binaryResultant`).
* Homogeneous lifts of a degree-d self-map of ℙ¹ (`HomogeneousLift`).
* Composition of homogeneous lifts (`HomogeneousLift.comp`).
* Rational self-maps of ℙ¹ over a field (`RationalMap`).
* The action of a rational map on ℙ¹(K) (`RationalMap.toEnd`).
* Units of the monoid of rational maps: PGL₂ (`RationalMap.unitsEquivPGL`).
* Base change of rational maps and points (`RationalMap.map`).
* Conjugation of rational maps by PGL₂ (`RationalMap.instMulActionPGL`).
* The moduli space M_d(K) of degree-d maps (`ModuliSpace`).
* The zeros of a binary form in ℙ¹, with multiplicity (`binaryRoots`).
* The fixed points of a rational map, with multiplicity (`RationalMap.fixedPoints`).
* The multiplier of a rational map at a fixed point (`RationalMap.multiplier`).
* The symmetric functions σᵢ of the fixed-point multipliers (`RationalMap.sigma`).
* The critical points of a rational map, with multiplicity (`RationalMap.criticalPoints`).
* Critically marked maps and their moduli M_d^cm(K) (`CriticallyMarkedMap`).
* Good reduction of a rational map (`RationalMap.HasGoodReduction`).
* Reduction of points of ℙ¹ modulo the maximal ideal (`projReduction`).

Layer 1:
* Tate's limit of a height along a self-map (`tateLimit`).
* The absolute logarithmic Weil height on ℙ¹ (`projLineAbsLogHeight`).
* The relative canonical height of a rational map (`RationalMap.relCanonicalHeight`).
* The canonical height of a rational map of ℙ¹ (`RationalMap.canonicalHeight`).

Layer 2:
* The homogeneous escape rate G_{F,v} (`escapeRate`).
* The local canonical height λ̂_{F,v} (`localCanonicalHeight`).
* The normalised dynamical Green function g_{F,v} on ℙ¹(K) (`dynamicalGreenFunction`).
* The multiplier of a periodic cycle (`cycleMultiplier`).
* The escape potential on the Berkovich line (`berkovichEscapePotential`).
* The canonical measure µ_{f,v} on the Berkovich line (`canonicalMeasure`).
* The canonical measure at an archimedean place (`archimedeanCanonicalMeasure`).
* Exceptional points (`mem_backwardOrbit`).
* Classical Fatou and Julia sets (`mem_classicalFatou`).
* Berkovich Fatou and Julia sets (`mem_forwardSaturation`).

Layer 3:
* The order of a binary form at a point of ℙ¹ (`binaryFormOrder`).
* The n-th period polynomial Φₙ(φ) = Y·Fₙ − X·Gₙ (`periodForm`).
* The multiplicity a_P(n) of a point of period n (`periodicMultiplicity`).
* The essential (dynatomic) multiplicity a*_P(n) (`essentialMultiplicity`).
* The formal germ of a map at a fixed point (`fixedPointGerm`).
* Formal period versus exact period (`IsOfFormalPeriod`).
* The dynatomic polynomial Φ*ₙ(φ) (`dynatomicForm`).
* The dynatomic polynomial of a monic polynomial map (`dynatomicPolynomial`).
* The dynatomic polynomial Φ*ₙ(x, c) of the family x^d + c (`unicriticalDynatomic`).
* The dynatomic curve Y₁(n) of the family x^d + c (`DynatomicCurveRing`).
* The orbit-repetition check (`orbitRepeatsWithin`).
* Filtering a candidate set for preperiodic points (`preperiodicFilter`).
* The candidate box for rational preperiodic points of z^d + c (`unicriticalCandidates`).
* The computed rational preperiodic points of z^d + c (`unicriticalRationalPreperiodic`).
* The points of ℙ¹(ℚ) of height at most H (`ratPointsOfHeightLE`).
* Poonen's conjecture: no rational cycles of length ≥ 4 (`PoonenConjecture`).
* The Morton–Silverman uniform boundedness conjecture (`UniformBoundednessConjecture`).
* Smooth projective models of marked dynatomic curves (`dynatomicProjectiveModel`).
* Projective quotient by cycle rotation (`dynatomicCycleModel`).
* Primitive binary necklaces at infinity (`primitiveBinaryWord`).
* Rational quadratic differentials on the complex plane (`rationalQuadraticDifferential`).
* Pushforward of rational quadratic differentials (`polynomialQuadraticPushforward`).
* Kneading sequences with a boundary symbol (`unicriticalKneading`).
* Böttcher coordinates and unicritical external rays (`unicriticalBottcher`).
* The symmetric curve for two marked 3-cycles (`mortonThreeCycleEquation`).
* Explicit map from Morton’s curve to an elliptic curve (`mortonEllipticCoordinates`).

Layer 4:
* The analytic projective line at a place of a number field, with its kernel, circle measures and weight (`AnalyticLine.ofInfinitePlace`).
* The standard measure λ_v at a place (`AnalyticLine.standard`).
* Galois-stable finite sets and their probability measures [F]_v (`IsGaloisStableFinset`).
* Regularisation of a finite set by circles of radius r (`AnalyticLine.regularised`).
* Adelic measures on the projective line (`AdelicMeasure.standard`).
* The height h_ρ attached to an adelic measure (`AdelicMeasure.height`).
* Adelic metrics on O_{P¹}(1) (`AdelicMetric.standard`).
* Curvature measures and semipositivity of an adelic metric on O(1) (`AdelicMetric.IsSemipositive`).
* The height of an adelic metric on O(1) (`AdelicMetric.height`).
* The normalised adelic metric of an adelic measure (`AdelicMeasure.metric`).
* The Arakelov–Zhang pairing of adelic metrics on O(1) (`AdelicMetric.pairing`).
* The Arakelov–Zhang pairing of adelic measures (mutual-energy distance) (`AdelicMeasure.pairing`).
* The adelic measure m_{F,η} and height h_{F,η} of a regularised finite set (`AdelicMeasure.ofFiniteSet`).
* Generic sequences of algebraic points (`IsGenericSequence`).
* The canonical adelic measure of a rational map (`RationalMap.canonicalAdelicMeasure`).
* The canonical adelic metric of a rational map (`RationalMap.canonicalMetric`).
* The Arakelov–Zhang pairing of two rational maps (`RationalMap.azPairing`).
* The local dynamical energy of two rational maps (`RationalMap.localEnergy`).
* The adelic Multibrot measure (`multibrotGreen`).

Layer 5:
* Level towers and rooted trees (`LevelTower.ancestor`).
* The complete rooted d-ary tree T^d (`regularTree_parent`).
* The automorphism group Aut(T) of a level tower and its profinite topology (`LevelTower.autSubgroup`).
* The automorphism group Aut(T_n) of the tree truncated at level n (`LevelTower.truncAut`).
* The preimage tree T_∞(g, α) of a point under a self-map (`preimageTree`).
* The Galois action on the preimage tree (`galoisTreeAction`).
* The arboreal Galois representation ρ : Gal(K^sep/K) → Aut(T_∞(f, α)) (`arborealRep`).
* The fields K_n = K(f^{-n}(α)) and K_∞ (`preimageField`).
* Stable pairs: all iterates fⁿ − α irreducible (`IsStableAt`).
* Eventually stable pairs (`IsEventuallyStableAt`).
* The adjusted critical orbit of a quadratic polynomial (`adjustedCriticalOrbit`).
* Möbius quotients of a sequence (`mobiusQuotient`).

Layer 6:
* The power map z ↦ z^d on the projective line (`powerMap_apply`).
* The Lattès map of multiplication by n on a Weierstrass curve (`lattesMap_apply`).
* Flexible Lattès maps and the flexible Lattès locus (`lattesMap_isFlexibleLattes`).
* The Legendre curve E_t and its Lattès map f_t (`legendreCurve`).
* Admissible absolute values and heights on a rational function field (`ratFuncAdmissibleAbsValues`).
* Specialisation of a one-parameter family of rational maps and of its points (`specialize`).
* Postcritically finite rational maps (`postcriticalSet`).
* The critical height of a rational map (`criticalHeight`).
* Standard projections of an elliptic curve (`standardProjection`).
* Finite unions of arithmetic progressions in ℕ (`IsFiniteUnionAP`).
* The dynamical Mordell–Lang conjecture (statement) (`DynamicalMordellLangProperty`).
* The dynamical Lehmer conjecture for maps of ℙ¹ (statement) (`DynamicalLehmerProperty`).
* Dynamically related points of a map over a function field (`DynamicallyRelated`).
* The dynamical André–Oort conjecture for one-parameter families (statement) (`DynamicalAndreOortProperty`).
* Integral primitive presentation with marked elements (`integralPrimitivePresentation`).
* Affine-torus Lattès maps (`isAffineLattes`).
-/

end TauCetiRoadmap.ArithmeticDynamics
