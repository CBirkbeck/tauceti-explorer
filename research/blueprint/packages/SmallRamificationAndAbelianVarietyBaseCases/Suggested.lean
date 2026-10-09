/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.PositiveDefinite.AddGroup
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.ConstantGroup.Scheme
import TauCeti.Algebra.AlgebraicGroup.RootsOfUnity.Scheme
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic

/-!
# SmallRamificationAndAbelianVarietyBaseCases: representative target signatures

The roadmap is `README.md`. This file records definitions and theorem signatures statable
against the pinned APIs and is not exhaustive. It uses finite discrete coefficient fields,
absolute irreducibility, the different normalised by the ramification index, and the
subobject-first convention for extensions. The integral finite-flat category and abelian
varieties are Tau Ceti's objects. The example representations are constructed from their
cyclotomic characters or from the actual geometric two-torsion of the displayed curve.
Signatures needing unavailable supplier interfaces are named in the closing comment.
-/

noncomputable section

open NumberField NumberField.InfinitePlace Module Polynomial MeasureTheory Set Filter Topology
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open scoped Classical Real TensorProduct CategoryTheory.MonObj

namespace TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

/-- An element of `G_ℚ` as an automorphism of `ℚ̄`. -/
abbrev galAut (σ : Field.absoluteGaloisGroup ℚ) : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ :=
  σ

/-! ## Layer 1: local and global discriminant bounds -/


section Minkowski

variable (K : Type*) [Field K] [NumberField K]

/-- A number field of degree at least three has root discriminant greater than two. -/
theorem two_lt_rootDiscr (h : 3 ≤ finrank ℚ K) : 2 < rootDiscr K := sorry

/-- A number field of degree at least six has root discriminant greater than three. -/
theorem three_lt_rootDiscr (h : 6 ≤ finrank ℚ K) : 3 < rootDiscr K := sorry

/-- A number field of degree at least twelve has root discriminant greater than four. -/
theorem four_lt_rootDiscr (h : 12 ≤ finrank ℚ K) : 4 < rootDiscr K := sorry

end Minkowski

/-- The kernel `g(x) = (1 − |x|) cos πx + sin π|x| / π` on `[−1, 1]`, zero outside. -/
def odlyzkoKernel (x : ℝ) : ℝ :=
  if |x| ≤ 1 then (1 - |x|) * Real.cos (π * x) + Real.sin (π * |x|) / π else 0

/-- The kernel is twice the convolution square of the truncated cosine. -/
theorem odlyzkoKernel_eq_two_mul_convolution :
    odlyzkoKernel = 2 • MeasureTheory.convolution
      (Set.indicator (Set.Icc (-(1 / 2)) (1 / 2)) fun y => Real.cos (π * y))
      (Set.indicator (Set.Icc (-(1 / 2)) (1 / 2)) fun y => Real.cos (π * y))
      (ContinuousLinearMap.mul ℝ ℝ) volume := sorry

/-- The kernel is pointwise nonnegative. -/
theorem odlyzkoKernel_nonneg (x : ℝ) : 0 ≤ odlyzkoKernel x := sorry

/-- The kernel is normalised to one at zero. -/
@[simp] theorem odlyzkoKernel_zero : odlyzkoKernel 0 = 1 := sorry

/-- The kernel is even. -/
@[simp] theorem odlyzkoKernel_neg (x : ℝ) : odlyzkoKernel (-x) = odlyzkoKernel x := sorry

/-- The kernel vanishes at and beyond the endpoints of its support. -/
theorem odlyzkoKernel_eq_zero_of_one_le_abs {x : ℝ} (hx : 1 ≤ |x|) :
    odlyzkoKernel x = 0 := sorry

/-- The convolution-square kernel is positive definite. -/
theorem isPositiveDefiniteSub_odlyzkoKernel :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ => (odlyzkoKernel x : ℂ) := sorry

/-- The kernel has one continuous derivative, including at its support endpoints. -/
theorem contDiff_odlyzkoKernel : ContDiff ℝ 1 odlyzkoKernel := sorry

/-- The positive-half-line integral is `4 / π²`. -/
theorem integral_odlyzkoKernel_Ioi : (∫ x in Ioi (0 : ℝ), odlyzkoKernel x) = 4 / π ^ 2 := sorry

/-- `odlyzkoKernel_zero` (computation): `g(0) = 1`, the normalisation `F(0) = 1`. -/
example : odlyzkoKernel 0 = 1 := odlyzkoKernel_zero

/-- `odlyzkoKernel_half` (computation): `g(1/2) = 1/π`. -/
example : odlyzkoKernel (1 / 2) = 1 / π := sorry

/-- `odlyzkoKernel_three_quarters_pos` (non-example): `g(3/4) > 0`; the variant without the
sine term is negative there. -/
example : 0 < odlyzkoKernel (3 / 4) := sorry

/-- `odlyzkoKernel_one` (degenerate): the support is `[−1, 1]`. -/
example : odlyzkoKernel 1 = 0 ∧ odlyzkoKernel 2 = 0 := sorry

/-- `integral_odlyzkoKernel_Ioi` (computation): `∫₀^∞ g = 4/π²`; the variant with `sin π|x|` in
place of `sin π|x| / π` integrates to `2/π² + 2/π`. -/
example : (∫ x in Ioi (0 : ℝ), odlyzkoKernel x) = 4 / π ^ 2 := integral_odlyzkoKernel_Ioi

/-- `odlyzkoKernel_neg_half` (non-example): `g(−1/2) = 1/π`; the variant with `sin πx / π` is
not even and gives `−1/π`. -/
example : odlyzkoKernel (-(1 / 2)) = 1 / π := sorry

/-- `x ↦ cosh(ax)/cosh(x/2)` is positive definite for `|a| ≤ 1/2`. -/
theorem isPositiveDefiniteSub_cosh_div_cosh {a : ℝ} (ha : |a| ≤ 1 / 2) :
    TauCeti.IsPositiveDefiniteSub fun x : ℝ =>
      ((Real.cosh (a * x) / Real.cosh (x / 2) : ℝ) : ℂ) := sorry

/-- Positivity of `F = f/cosh(x/2)` on the critical strip. -/
theorem re_poitouTransform_nonneg (f : ℝ → ℝ) (hf_even : ∀ x, f (-x) = f x)
    (hf_cont : Continuous f) (hf_supp : HasCompactSupport f) (hf_nonneg : ∀ x, 0 ≤ f x)
    (hf_pd : TauCeti.IsPositiveDefiniteSub fun x => (f x : ℂ)) {s : ℂ}
    (hs₀ : 0 ≤ s.re) (hs₁ : s.re ≤ 1) :
    0 ≤ (∫ x : ℝ, ((f x / Real.cosh (x / 2) : ℝ) : ℂ) * Complex.exp ((s - 1 / 2) * x)).re :=
  sorry

/-- The test function `F_b(x) = g(x/b)/cosh(x/2)`. -/
def poitouTestFunction (b x : ℝ) : ℝ := odlyzkoKernel (x / b) / Real.cosh (x / 2)

/-- For positive scale the test function is one at zero. -/
example {b : ℝ} (hb : 0 < b) : poitouTestFunction b 0 = 1 := sorry

/-- The scaled endpoint and exterior point both vanish. -/
example {b : ℝ} (hb : 0 < b) : poitouTestFunction b b = 0 ∧
    poitouTestFunction b (2 * b) = 0 := sorry

/-- The half-scale value fixes the denominator and sine normalisation. -/
example {b : ℝ} (hb : 0 < b) :
    poitouTestFunction b (b / 2) = 1 / (π * Real.cosh (b / 4)) := sorry


/-- `P(n, r₁, b) = r₁π/2 + n(γ + log 8π) − n·I₁(b) − r₁·I₂(b) − 16b/π²`: the explicit-formula
lower bound with the zero and prime sums removed. Every integral is parenthesised. -/
def poitouLowerBound (n r₁ : ℕ) (b : ℝ) : ℝ :=
  r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
    - n * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
    - r₁ * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
    - 16 * b / π ^ 2

/-- For positive scale, both archimedean integrands are integrable on the positive half-line. -/
theorem integrableOn_poitouIntegrand_sinh {b : ℝ} (hb : 0 < b) :
    IntegrableOn (fun x => (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))) (Ioi 0) ∧
      IntegrableOn (fun x => (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
        (Ioi 0) := sorry

/-- The pole term `16b/π²` is `4 ∫₀^∞ F_b(x) cosh(x/2) dx`. -/
theorem poitouLowerBound_eq_explicit (n r₁ : ℕ) {b : ℝ} (hb : 0 < b) :
    poitouLowerBound n r₁ b =
      r₁ * π / 2 + n * (Real.eulerMascheroniConstant + Real.log (8 * π))
        - n * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
        - r₁ * (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.cosh (x / 2)))
        - 4 * (∫ x in Ioi (0 : ℝ), poitouTestFunction b x * Real.cosh (x / 2)) := sorry

/-- For positive scale, the sinh-integral tail equals `-log(tanh(b/4))`. -/
theorem poitouIntegral_sinh_eq {b : ℝ} (hb : 0 < b) :
    (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))) =
      (∫ x in (0 : ℝ)..b, (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2)))
        - Real.log (Real.tanh (b / 4)) := sorry

/-- At fixed positive scale, the normalised totally complex bound increases with positive degree. -/
theorem poitouLowerBound_div_mono {b : ℝ} (hb : 0 < b) {n m : ℕ} (hn : 0 < n)
    (hnm : n ≤ m) : poitouLowerBound n 0 b / n ≤ poitouLowerBound m 0 b / m := sorry

/-- Certified upper bounds `I₁(13/2) < 1.04` and `I₁(8) < 0.94`. -/
theorem poitouIntegral_sinh_lt :
    (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction (13 / 2) x) / (2 * Real.sinh (x / 2))) <
        1.04 ∧
      (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction 8 x) / (2 * Real.sinh (x / 2))) < 0.94 :=
  sorry

/-- `poitouLowerBound_rat_nonpos` (computation): for `ℚ` the bound is nonpositive at
`b ∈ {1/2, 1, 2}` (numerically `−0.051`, `−0.083`, `−0.883`). -/
example : ∀ b ∈ ({1 / 2, 1, 2} : Set ℝ), poitouLowerBound 1 1 b ≤ 0 := sorry

/-- `poitouLowerBound_sqrt_neg_three` (computation): `ℚ(√−3)` has `|d| = 3`; the reversed pole
sign would violate this. -/
example : poitouLowerBound 2 0 1 ≤ Real.log 3 := sorry

/-- `poitouLowerBound_sqrt_five` (computation): `ℚ(√5)` has `|d| = 5`; this checks the `r₁`
terms. -/
example : poitouLowerBound 2 2 (3 / 2) ≤ Real.log 5 := sorry

/-- `poitouLowerBound_div_mono` (degenerate): at fixed `b > 0` the normalised bound tends to
`γ + log 8π − I₁(b)`, which lies below `log(4πe^γ)`. -/
example {b : ℝ} (hb : 0 < b) :
    Tendsto (fun n : ℕ => poitouLowerBound n 0 b / n) atTop
      (𝓝 (Real.eulerMascheroniConstant + Real.log (8 * π) -
        (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))))) ∧
    Real.eulerMascheroniConstant + Real.log (8 * π) -
        (∫ x in Ioi (0 : ℝ), (1 - poitouTestFunction b x) / (2 * Real.sinh (x / 2))) <
      Real.log (4 * π * Real.exp Real.eulerMascheroniConstant) := sorry

/-- `poitouLowerBound_one_one_one_bounds` (computation): `−0.09 < P(1, 1, 1) < −0.08`; the
variants with `log 4π` or without `r₁π/2` fail the lower bound. -/
example : -0.09 < poitouLowerBound 1 1 1 ∧ poitouLowerBound 1 1 1 < -0.08 := sorry

/-- The Odlyzko–Poitou unconditional bound. -/
theorem poitouLowerBound_le_log_abs_discr (K : Type*) [Field K] [NumberField K] {b : ℝ}
    (hb : 0 < b) :
    poitouLowerBound (finrank ℚ K) (nrRealPlaces K) b ≤ Real.log |(discr K : ℝ)| := sorry

/-- The root discriminant exceeds ten for totally complex degree at least twenty-four. -/
theorem ten_lt_rootDiscr_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : 24 ≤ finrank ℚ K) : 10 < rootDiscr K := sorry

/-- The root discriminant exceeds twelve for totally complex degree at least thirty-six. -/
theorem twelve_lt_rootDiscr_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] (h : 36 ≤ finrank ℚ K) : 12 < rootDiscr K := sorry

/-- The certified degree bounds (a)–(j) for totally complex fields used by Schoof's cases. -/
theorem finrank_le_of_rootDiscr_lt_of_isTotallyComplex (K : Type*) [Field K] [NumberField K]
    [IsTotallyComplex K] :
    (rootDiscr K < 8.25 → finrank ℚ K ≤ 14) ∧ (rootDiscr K < 6.93 → finrank ℚ K ≤ 10) ∧
      (rootDiscr K < 8.95 → finrank ℚ K ≤ 19) ∧ (rootDiscr K < 19.02 → finrank ℚ K ≤ 287) ∧
      (rootDiscr K < 14.43 → finrank ℚ K ≤ 59) ∧ (rootDiscr K ≤ 5.72 → finrank ℚ K ≤ 8) ∧
      (rootDiscr K ≤ 4.48 → finrank ℚ K ≤ 5) ∧ (rootDiscr K ≤ 13.19 → finrank ℚ K ≤ 43) ∧
      (rootDiscr K ≤ 16.83 → finrank ℚ K ≤ 119) ∧ (rootDiscr K ≤ 10.199 → finrank ℚ K ≤ 23) :=
  sorry

/- Finite flat group schemes over arithmetic bases. -/

section GroupSchemes

/-- Finite flat commutative group schemes over `R` (Tau Ceti). -/
abbrev FFGroupSchemeOver (R : Type) [CommRing R] :=
  TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

/-- Finite flat commutative group schemes over `ℤ`. -/
abbrev FFGroupScheme := FFGroupSchemeOver ℤ

/-- Finite flat commutative group schemes over `ℤ[1/l]`. -/
abbrev FFGroupSchemeAway (l : ℕ) := FFGroupSchemeOver (Localization.Away (l : ℤ))

/-- `ℤ[1/l] → ℚ`; with Mathlib's instances it also makes `ℚ̄` a `ℤ[1/l]`-algebra. -/
instance algebraAwayRat (l : ℕ) [NeZero l] : Algebra (Localization.Away (l : ℤ)) ℚ :=
  (IsLocalization.Away.lift (l : ℤ) (g := Int.castRingHom ℚ)
    (isUnit_iff_ne_zero.mpr (by simpa using NeZero.ne l))).toAlgebra

variable {R : Type} [CommRing R]

/-- The coordinate Hopf algebra of `G` (Tau Ceti). -/
abbrev coordinateRing (G : FFGroupSchemeOver R) :
    TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat R :=
  TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G

/-- The order of `G`: the rank of its coordinate algebra. -/
def order (G : FFGroupSchemeOver R) : ℕ := Module.finrank R (coordinateRing G)

/-- `G` is killed by `n`: the `n`-th convolution power of the identity of the coordinate Hopf
algebra is the counit. -/
def IsKilledBy (G : FFGroupSchemeOver R) (n : ℕ) : Prop :=
  WithConv.toConv (AlgHom.id R (coordinateRing G)) ^ n = 1

/-- The underlying morphism of schemes. -/
abbrev schemeHom {G H : FFGroupSchemeOver R} (f : G ⟶ H) :
    G.obj.obj.X.left ⟶ H.obj.obj.X.left :=
  f.hom.hom.hom.hom.left

/-- A nontrivial group scheme with no closed flat subgroup schemes other than `0` and `G`. -/
def IsSimpleGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  order G ≠ 1 ∧ ∀ (M : FFGroupSchemeOver R) (i : M ⟶ G),
    IsClosedImmersion (schemeHom i) → order M = 1 ∨ IsIso i

/-- `G` is étale over the base. -/
def IsEtaleGroupScheme (G : FFGroupSchemeOver R) : Prop := Etale G.obj.obj.X.hom

/-- `G` is constant: isomorphic to Tau Ceti's constant group scheme of a finite abelian group. -/
def IsConstantGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  ∃ (Γ : Type) (_ : CommGroup Γ) (_ : Finite Γ),
    Nonempty (G.obj.obj ≅ TauCeti.ConstantGroup.groupScheme R Γ)

/-- `G` is diagonalizable: its Cartier dual is constant. -/
def IsDiagonalizableGroupScheme (G : FFGroupSchemeOver R) : Prop :=
  IsConstantGroupScheme (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G)

/-- The constant group scheme `ℤ/nℤ` over `R` (the membership proofs are true claims). -/
def zModScheme (R : Type) [CommRing R] (n : ℕ) [NeZero n] : FFGroupSchemeOver R :=
  ⟨⟨TauCeti.ConstantGroup.groupScheme R (Multiplicative (ZMod n)), sorry⟩, sorry⟩

/-- The group scheme `μ_n` over `R` (the membership proofs are true claims). -/
def muScheme (R : Type) [CommRing R] (n : ℕ) [NeZero n] : FFGroupSchemeOver R :=
  ⟨⟨TauCeti.RootsOfUnityGroup.groupScheme R n, sorry⟩, sorry⟩

/-- `0 → M → G → C → 0` is exact: `M` is the scheme-theoretic kernel of `q`, and `q` is
faithfully flat. -/
def IsShortExact {M G C : FFGroupSchemeOver R} (i : M ⟶ G) (q : G ⟶ C) : Prop :=
  IsPullback i.hom.hom.hom.hom (CartesianMonoidalCategory.toUnit M.obj.obj.X)
      q.hom.hom.hom.hom η[C.obj.obj.X] ∧
    Flat (schemeHom q) ∧ Surjective (schemeHom q)

/-- Every extension `0 → B → E → A → 0` splits. -/
def Ext1Vanishes (A B : FFGroupSchemeOver R) : Prop :=
  ∀ (E : FFGroupSchemeOver R) (i : B ⟶ E) (q : E ⟶ A), IsShortExact i q →
    ∃ s : A ⟶ E, s ≫ q = 𝟙 A

/-- `G` has a filtration whose successive quotients are isomorphic to `A`. -/
inductive IsIteratedExtensionOf (A : FFGroupSchemeOver R) : FFGroupSchemeOver R → Prop
  | trivial (G : FFGroupSchemeOver R) : order G = 1 → IsIteratedExtensionOf A G
  | extension {M G C : FFGroupSchemeOver R} (i : M ⟶ G) (q : G ⟶ C) :
      IsShortExact i q → IsIteratedExtensionOf A M → Nonempty (C ≅ A) →
        IsIteratedExtensionOf A G

variable [Algebra R ℚ]

/-- The points `G(ℚ̄)`, a commutative group under convolution (Tau Ceti). -/
abbrev points (G : FFGroupSchemeOver R) :=
  WithConv (coordinateRing G →ₐ[R] AlgebraicClosure ℚ)

/-- The action of `G_ℚ` on `G(ℚ̄)`. -/
def galoisAct (G : FFGroupSchemeOver R) (σ : Field.absoluteGaloisGroup ℚ) (x : points G) :
    points G :=
  WithConv.toConv (((galAut σ).toAlgHom.restrictScalars R).comp x.ofConv)

/-- The field `ℚ(G(ℚ̄))` generated by the coordinates of the points of `G`. -/
def torsionField (G : FFGroupSchemeOver R) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ
    {x | ∃ f : coordinateRing G →ₐ[R] AlgebraicClosure ℚ, x ∈ Set.range f}

/-- The points generate a number field. A finite-image consequence. -/
instance numberField_torsionField (G : FFGroupSchemeOver R) : NumberField (torsionField G) :=
  sorry

/-- The trivial group scheme is excluded by the nonzero simple-object convention. -/
example : ¬ IsSimpleGroupScheme (zModScheme ℤ 1) := sorry

/-- The two order-two group schemes over `ℤ` are nonzero simple objects. -/
example : IsSimpleGroupScheme (zModScheme ℤ 2) ∧ IsSimpleGroupScheme (muScheme ℤ 2) := sorry

end GroupSchemes

/- The strict discriminant bound for finite-flat torsion fields. -/

/-- Fontaine's bound over `ℤ` (the case `N = 1`): `rd_L < p^{1 + 1/(p − 1)}` for the field of
points of a finite flat group scheme killed by `p`. -/
theorem rootDiscr_torsionField_lt (p : ℕ) [Fact p.Prime] (G : FFGroupScheme)
    (hG : IsKilledBy G p) :
    rootDiscr (torsionField G) < (p : ℝ) ^ ((1 : ℝ) + 1 / ((p : ℝ) - 1)) := sorry


/-! ## Layer 2: residual representations and the Tate–Serre base case -/

/-- A residual representation: a continuous homomorphism `G_ℚ → GL₂(F)`. -/
abbrev ResidualRep (F : Type*) [Field F] [TopologicalSpace F] :=
  ContinuousMonoidHom (Field.absoluteGaloisGroup ℚ) (GL (Fin 2) F)

/-- R01.1/a subgroup of `GL₂(K)` with no common eigenline in `K²`. -/
def IsIrreducibleSubgroup {K : Type*} [Field K] (G : Subgroup (GL (Fin 2) K)) : Prop :=
  ∀ v : Fin 2 → K, v ≠ 0 → ∃ g ∈ G, ∀ c : K, (g : Matrix (Fin 2) (Fin 2) K).mulVec v ≠ c • v

/-- The subfield `ℚ(ζ_n)` of `ℚ̄`. -/
def cyclotomicSubfield (n : ℕ) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ {x | x ^ n = 1}

/-- the union of the inertia groups of the primes of `ℚ̄` above `ℓ`; `σ` is in
the inertia group of `P` when `σ x − x ∈ P` for every algebraic integer `x`. -/
def inertiaAbove (ℓ : ℕ) : Set (Field.absoluteGaloisGroup ℚ) :=
  {σ | ∃ P : Ideal (integralClosure ℤ (AlgebraicClosure ℚ)), P.IsMaximal ∧
    (ℓ : integralClosure ℤ (AlgebraicClosure ℚ)) ∈ P ∧
    ∀ x : integralClosure ℤ (AlgebraicClosure ℚ), ∃ y ∈ P,
      (y : AlgebraicClosure ℚ) = galAut σ x - x}

/-- The mod-`p` cyclotomic character `ω : G_ℚ → 𝔽_p^× ⊆ F^×` (Mathlib's
`modularCyclotomicCharacter`), with its continuity for discrete coefficients. -/
def modCyclotomicCharacter (p : ℕ) [Fact p.Prime] (F : Type*) [Field F] [CharP F p]
    [TopologicalSpace F] [DiscreteTopology F] : Field.absoluteGaloisGroup ℚ →ₜ* Fˣ where
  toMonoidHom := (Units.map (ZMod.castHom (dvd_refl p) F).toMonoidHom).comp
    ((modularCyclotomicCharacter (AlgebraicClosure ℚ) (n := p)
      (HasEnoughRootsOfUnity.natCard_rootsOfUnity _ _)).comp
      { toFun := fun σ => (galAut σ).toRingEquiv
        map_one' := rfl
        map_mul' := fun _ _ => rfl })
  continuous_toFun := sorry

/-- The concrete diagonal sum `1 ⊕ ω_p`; both the matrix and its inverse are specified.
The homomorphism and continuity identities are left as proof obligations. -/
def oneAddCyclotomic (p : ℕ) [Fact p.Prime] (F : Type*) [Field F] [CharP F p]
    [TopologicalSpace F] [DiscreteTopology F] : ResidualRep F where
  toFun σ :=
    { val := Matrix.diagonal ![1, (modCyclotomicCharacter p F σ : F)]
      inv := Matrix.diagonal ![1, ((modCyclotomicCharacter p F σ)⁻¹ : F)]
      val_inv := sorry
      inv_val := sorry }
  map_one' := sorry
  map_mul' := sorry
  continuous_toFun := sorry

/-- The native mod-nine cyclotomic character, regarded as continuous for discrete coefficients. -/
def modNineCyclotomicCharacter : Field.absoluteGaloisGroup ℚ →ₜ* (ZMod 9)ˣ where
  toMonoidHom :=
    (modularCyclotomicCharacter (AlgebraicClosure ℚ) (n := 9)
      (HasEnoughRootsOfUnity.natCard_rootsOfUnity _ _)).comp
      { toFun := fun σ => (galAut σ).toRingEquiv
        map_one' := rfl
        map_mul' := fun _ _ => rfl }
  continuous_toFun := sorry

/-- The specified generator matrix of order three over `𝔽₂`. -/
def cubicOrderThreeMatrix : GL (Fin 2) (ZMod 2) :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![0, 1; 1, 1] (by decide)

/-- Quotient the mod-nine cyclotomic character by `±1` and send the class of `2` to
`(0 1; 1 1)`. The three cosets are `{1,8}`, `{2,7}`, `{4,5}`. -/
def realCubicModTwo : ResidualRep (ZMod 2) where
  toFun σ :=
    if (modNineCyclotomicCharacter σ : ZMod 9) = 1 ∨
        (modNineCyclotomicCharacter σ : ZMod 9) = 8 then 1
    else if (modNineCyclotomicCharacter σ : ZMod 9) = 2 ∨
        (modNineCyclotomicCharacter σ : ZMod 9) = 7 then cubicOrderThreeMatrix
    else cubicOrderThreeMatrix ^ 2
  map_one' := sorry
  map_mul' := sorry
  continuous_toFun := sorry

/-- The maximal real cyclotomic subfield, specified inside `ℚ̄` by sums `ζ + ζ⁻¹`. -/
def realCyclotomicSubfield (n : ℕ) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.adjoin ℚ {x | ∃ ζ : AlgebraicClosure ℚ, ζ ^ n = 1 ∧ x = ζ + ζ⁻¹}

/-- The specified conductor-eleven equation `y² + y = x³ - x² - 10x - 20`. -/
def x0Eleven : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := -1
  a₃ := 1
  a₄ := -10
  a₆ := -20

/-- The actual two-torsion subgroup of the equation's geometric point group. -/
abbrev X0ElevenTwoTorsion : Type :=
  ↥(AddSubgroup.torsionBy (x0Eleven.baseChange (AlgebraicClosure ℚ)).toAffine.Point 2)

instance module_X0ElevenTwoTorsion : Module (ZMod 2) X0ElevenTwoTorsion :=
  AddSubgroup.torsionBy.zmodModule

/-- Act on the specified torsion points by applying the Galois automorphism to their
coordinates; the torsion-membership and homomorphism obligations are proofs. -/
def x0ElevenTwoTorsionAction (σ : Field.absoluteGaloisGroup ℚ) :
    X0ElevenTwoTorsion →ₗ[ZMod 2] X0ElevenTwoTorsion :=
  AddMonoidHom.toZModLinearMap 2
    { toFun := fun P =>
        ⟨WeierstrassCurve.Affine.Point.map (W' := x0Eleven.toAffine) (galAut σ).toAlgHom P,
          by sorry⟩
      map_zero' := sorry
      map_add' := sorry }

/-- The specified geometric two-torsion has a two-element `𝔽₂`-basis. This is a true
existence theorem about the already defined point group, not an unspecified representation. -/
theorem x0ElevenTwoTorsion_basis_exists :
    Nonempty (Basis (Fin 2) (ZMod 2) X0ElevenTwoTorsion) := sorry

/-- The coordinate Galois action on the specified `E[2]`, written in any chosen basis. -/
def x0ElevenTwoTorsionRep (b : Basis (Fin 2) (ZMod 2) X0ElevenTwoTorsion) :
    ResidualRep (ZMod 2) where
  toFun σ := (Matrix.GeneralLinearGroup.toLin' b).symm
    { val := x0ElevenTwoTorsionAction σ
      inv := x0ElevenTwoTorsionAction σ⁻¹
      val_inv := sorry
      inv_val := sorry }
  map_one' := sorry
  map_mul' := sorry
  continuous_toFun := sorry

section Residual

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- The image of a subgroup `H ⊆ G_ℚ` in `GL₂(F̄)`. -/
def imageOver (ρ : ResidualRep F) (H : Subgroup (Field.absoluteGaloisGroup ℚ)) :
    Subgroup (GL (Fin 2) (AlgebraicClosure F)) :=
  H.map ((Matrix.GeneralLinearGroup.map (algebraMap F (AlgebraicClosure F))).comp
    ρ.toMonoidHom)

/-- `ρ` is irreducible after extending scalars to `F̄`. -/
def IsAbsolutelyIrreducible (ρ : ResidualRep F) : Prop :=
  IsIrreducibleSubgroup (imageOver ρ ⊤)

/-- `det ρ(c) = −1` for every `c ∈ G_ℚ` acting as complex conjugation under
some embedding `ℚ̄ → ℂ`. -/
def IsOdd (ρ : ResidualRep F) : Prop :=
  ∀ (j : AlgebraicClosure ℚ →+* ℂ) (c : Field.absoluteGaloisGroup ℚ),
    (∀ x, j (galAut c x) = starRingEnd ℂ (j x)) →
      ((ρ c : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F).det = -1

/-- the kernel field `ℚ̄^{ker ρ}`. -/
def kernelField (ρ : ResidualRep F) : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  IntermediateField.fixedField ρ.toMonoidHom.ker

end Residual

/-- The kernel field is a number field (`ker ρ` is open). A finite-image consequence. -/
instance numberField_kernelField {F : Type*} [Field F] [Fintype F]
    [TopologicalSpace F] [DiscreteTopology F] (ρ : ResidualRep F) : NumberField (kernelField ρ) := sorry

/-- Extension of scalars along a field embedding `F → F'`. -/
def ResidualRep.map {F : Type*} [Field F] [TopologicalSpace F] [DiscreteTopology F]
    {F' : Type*} [Field F'] [TopologicalSpace F'] (f : F →+* F')
    (ρ : ResidualRep F) : ResidualRep F' where
  toMonoidHom := (Matrix.GeneralLinearGroup.map f).comp ρ.toMonoidHom
  continuous_toFun := sorry

/-- the twist `ρ ⊗ χ` by a continuous character `χ : G_ℚ → F^×`. -/
def twist {F : Type*} [Field F] [TopologicalSpace F] [DiscreteTopology F]
    (ρ : ResidualRep F) (χ : Field.absoluteGaloisGroup ℚ →ₜ* Fˣ) : ResidualRep F where
  toFun σ := Units.map (algebraMap F (Matrix (Fin 2) (Fin 2) F)).toMonoidHom (χ σ) * ρ σ
  map_one' := sorry
  map_mul' := sorry
  continuous_toFun := sorry

section Residual

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- `ρ` is unramified at `ℓ` when `ℓ` does not divide the discriminant of the
kernel field. -/
def IsUnramifiedAt (ℓ : ℕ) (ρ : ResidualRep F) : Prop :=
  ¬ (ℓ : ℤ) ∣ discr (kernelField ρ)

/-- `ρ` is trivial on wild inertia at `p`, that is, the kernel field is tamely
ramified at `p`. -/
def IsTameAt (p : ℕ) (ρ : ResidualRep F) : Prop :=
  ∀ P : Ideal (𝓞 (kernelField ρ)), P.IsPrime → (p : 𝓞 (kernelField ρ)) ∈ P →
    ¬ p ∣ P.ramificationIdx ℤ

/-- Level one: absolutely irreducible, odd, and unramified outside `p`. -/
def IsLevelOneResidual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsAbsolutelyIrreducible ρ ∧ IsOdd ρ ∧ ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ

/-- The kernel-field form: unramified outside `p` means every prime above `ℓ ≠ p` has
ramification index `1` in the kernel field. -/
theorem isLevelOneResidual_iff_kernelField (p : ℕ) (ρ : ResidualRep F) :
    IsLevelOneResidual p ρ ↔
      (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → ∀ P : Ideal (𝓞 (kernelField ρ)), P.IsPrime →
        (ℓ : 𝓞 (kernelField ρ)) ∈ P → P.ramificationIdx ℤ = 1) ∧
      IsAbsolutelyIrreducible ρ ∧ IsOdd ρ := sorry

/-- The level-one predicate is invariant under finite discrete coefficient-field extension. -/
theorem IsLevelOneResidual.map {F' : Type*} [Field F'] [Fintype F'] [TopologicalSpace F']
    [DiscreteTopology F'] (f : F →+* F') {p : ℕ} (ρ : ResidualRep F) :
    IsLevelOneResidual p (ρ.map f) ↔ IsLevelOneResidual p ρ := sorry

/-- The level-one predicate is invariant under a change of basis. -/
theorem IsLevelOneResidual.conj {p : ℕ} {ρ ρ' : ResidualRep F} (g : GL (Fin 2) F)
    (hconj : ∀ σ, ρ' σ = g * ρ σ * g⁻¹) (hρ : IsLevelOneResidual p ρ) :
    IsLevelOneResidual p ρ' := sorry

/-- The determinant oddness condition is automatic in characteristic two. -/
theorem isOdd_of_ringChar_two (h : ringChar F = 2) (ρ : ResidualRep F) : IsOdd ρ := sorry

/-- For `p` odd the kernel field of a level-one residual representation is totally complex. -/
theorem IsLevelOneResidual.isTotallyComplex {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2) [CharP F p]
    {ρ : ResidualRep F} (hρ : IsLevelOneResidual p ρ) : IsTotallyComplex (kernelField ρ) :=
  sorry

/-- `not_isLevelOneResidual_one_add_omega` (non-example): test the actual diagonal character
sum, including its failure of absolute irreducibility. -/
example [CharP F 3] : IsOdd (oneAddCyclotomic 3 F) ∧
    (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 3 → IsUnramifiedAt ℓ (oneAddCyclotomic 3 F)) ∧
    ¬ IsAbsolutelyIrreducible (oneAddCyclotomic 3 F) ∧
    ¬ IsLevelOneResidual 3 (oneAddCyclotomic 3 F) := sorry

/-- `not_isLevelOneResidual_X0_eleven_two_torsion` (non-example): the action on `E[2]` for
`E : y² + y = x³ − x² − 10x − 20` is absolutely irreducible (image `S₃`) and ramified at `11`. -/
example (b : Basis (Fin 2) (ZMod 2) X0ElevenTwoTorsion) :
    IsAbsolutelyIrreducible (F := ZMod 2) (x0ElevenTwoTorsionRep b) ∧
    ¬ IsUnramifiedAt (F := ZMod 2) 11 (x0ElevenTwoTorsionRep b) ∧
    ¬ IsLevelOneResidual (F := ZMod 2) 2 (x0ElevenTwoTorsionRep b) := sorry

/-- `isOdd_of_ringChar_two` (degenerate): in characteristic `2` every `ρ̄` is odd. -/
example [CharP F 2] (ρ : ResidualRep F) : IsOdd ρ := isOdd_of_ringChar_two (ringChar.eq F 2) ρ

/-- `IsLevelOneResidual.map` (compatibility): extending `𝔽₂ ⊆ 𝔽₄` does not change the
predicate. -/
example {F' : Type*} [Field F'] [Fintype F'] [TopologicalSpace F'] [DiscreteTopology F']
    (_hF : Fintype.card F = 2) (_hF' : Fintype.card F' = 4) (f : F →+* F') (ρ : ResidualRep F) :
    IsLevelOneResidual 2 (ρ.map f) ↔ IsLevelOneResidual 2 ρ := IsLevelOneResidual.map f ρ

/-- `not_isAbsolutelyIrreducible_cyclic_cubic_mod_two` (non-example): `G_ℚ ↠ Gal(ℚ(ζ₉)⁺/ℚ)`
followed by `(0 1; 1 1)` is irreducible over `𝔽₂` but not absolutely irreducible. -/
example : kernelField (F := ZMod 2) realCubicModTwo = realCyclotomicSubfield 9 ∧
    finrank ℚ (kernelField (F := ZMod 2) realCubicModTwo) = 3 ∧
    cubicOrderThreeMatrix ^ 3 = 1 ∧
    IsIrreducibleSubgroup realCubicModTwo.toMonoidHom.range ∧
    ¬ IsAbsolutelyIrreducible (F := ZMod 2) realCubicModTwo := sorry

/-- The determinant character of a characteristic-two representation unramified outside two is trivial. -/
theorem det_eq_one_of_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) (σ : Field.absoluteGaloisGroup ℚ) :
    ((ρ σ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F).det = 1 := sorry

/-- A representation unramified outside `p ∈ {2,3}` and tame at `p` is not absolutely irreducible. -/
theorem not_isAbsolutelyIrreducible_of_tame {p : ℕ} (hp : p = 2 ∨ p = 3) [CharP F p]
    (ρ : ResidualRep F) (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → IsUnramifiedAt ℓ ρ)
    (htame : IsTameAt p ρ) : ¬ IsAbsolutelyIrreducible ρ := sorry

/-- Tate's theorem (oddness is automatic in characteristic `2` and is not assumed). -/
theorem tate_no_levelOne_char_two [CharP F 2] (ρ : ResidualRep F)
    (hρ : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → IsUnramifiedAt ℓ ρ) : ¬ IsAbsolutelyIrreducible ρ :=
  sorry

/-- Serre's mod-3 theorem. -/
theorem serre_no_levelOne_char_three [CharP F 3] (ρ : ResidualRep F) :
    ¬ IsLevelOneResidual 3 ρ := sorry

/-- The Tate–Serre base case (DP23, Theorem 1.1). -/
theorem not_isLevelOneResidual_of_le_three {p : ℕ} (hp : p = 2 ∨ p = 3) [CharP F p]
    (ρ : ResidualRep F) : ¬ IsLevelOneResidual p ρ := sorry

/-- At three, `diag(1,-1)` is odd, and scalar `-1` has nonzero inertia square. -/
example : Matrix.det (!![(1 : ZMod 3), 0; 0, -1]) = -1 ∧
    ((-1 : ZMod 3) - 1) ^ 2 = 1 := by decide

/-- A characteristic-two complex conjugation has determinant `1 = -1`. -/
example (c : Field.absoluteGaloisGroup ℚ) (hc : c ^ 2 = 1)
    (ρ : ResidualRep (ZMod 2)) :
    ((ρ c : GL (Fin 2) (ZMod 2)) : Matrix (Fin 2) (Fin 2) (ZMod 2)).det = 1 ∧
      (1 : ZMod 2) = -1 := sorry

end Residual

/-- Irreducible finite subgroups of `SL₂(F̄₂)`: dihedral of order `2r`, `r ≥ 3` odd, with
self-normalising subgroups of order `2`, or conjugate to the embedded `SL₂(K)` for a finite
subfield `K ⊆ F̄₂` of order `q = 2^j ≥ 4`, with group order `q(q² − 1) ≥ 60`. -/
theorem dihedral_or_SL2_of_irreducible_char_two
    (G : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod 2)))) [Finite G]
    (hdet : ∀ g ∈ G, (g : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod 2))).det = 1)
    (hG : IsIrreducibleSubgroup G) :
    (∃ r : ℕ, Odd r ∧ 3 ≤ r ∧ Nonempty (G ≃* DihedralGroup r) ∧
        ∀ Q : Subgroup G, Nat.card Q = 2 → Subgroup.normalizer (Q : Set G) = Q) ∨
      ∃ (j : ℕ) (K : Subfield (AlgebraicClosure (ZMod 2))),
        2 ≤ j ∧ Nat.card K = 2 ^ j ∧ Nat.card G = 2 ^ j * (2 ^ (2 * j) - 1) ∧
        60 ≤ Nat.card G ∧
        ∃ g : GL (Fin 2) (AlgebraicClosure (ZMod 2)),
          ∀ h : GL (Fin 2) (AlgebraicClosure (ZMod 2)), h ∈ G ↔
            ∃ s : Matrix.SpecialLinearGroup (Fin 2) K,
              g * h * g⁻¹ = Matrix.GeneralLinearGroup.map K.subtype
                (Matrix.SpecialLinearGroup.toGL s) := sorry

/-- Irreducible finite subgroups of `GL₂(F̄₃)` with `3 ∣ |G|`. -/
theorem twentyFour_dvd_card_of_irreducible_char_three
    (G : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod 3)))) [Finite G]
    (hG : IsIrreducibleSubgroup G) (h3 : 3 ∣ Nat.card G) :
    (-1 : GL (Fin 2) (AlgebraicClosure (ZMod 3))) ∈ G ∧ 24 ∣ Nat.card G ∧
      (padicValNat 3 (Nat.card G) = 1 ∨ 720 ≤ Nat.card G) := sorry

/-- The diagonal-ratio convention sends the unipotent entry `1` to `-1` under `diag(-1,1)`. -/
example : (!![-1, 0; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 3)) *
    !![1, 1; 0, 1] * !![-1, 0; 0, 1] = !![1, -1; 0, 1] := by decide

/-! ## Layer 3: Fontaine's theorem -/

section Fontaine

open TauCeti.AlgebraicGeometry

/-- `A` extends to an abelian scheme over `ℤ`, i.e. a smooth proper group
scheme over `ℤ` with generic fibre `A`; equivalently, good reduction at every prime. -/
def HasGoodReductionEverywhere (A : AbelianVariety ℚ) : Prop :=
  ∃ (X : Over (Spec (.of ℤ))) (_ : GrpObj X), IsProper X.hom ∧ Smooth X.hom ∧
    Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))).obj X ≅
      A.toOver)

/-- Every finite étale commutative group scheme over `ℤ` is constant. -/
theorem isConstant_of_etale_over_int (G : FFGroupScheme) (hG : IsEtaleGroupScheme G) :
    IsConstantGroupScheme G := sorry

/-- A two-ramified Galois field with root discriminant below four has a two-group as Galois group. -/
theorem isPGroup_two_of_rootDiscr_lt_four (L : IntermediateField ℚ (AlgebraicClosure ℚ))
    [NumberField L] [IsGalois ℚ L]
    (hL : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ 2 → ¬ (ℓ : ℤ) ∣ discr L)
    (hrd : rootDiscr L < 4) : ∃ k : ℕ, finrank ℚ L = 2 ^ k := sorry

/-- The nonzero simple finite flat 2-group schemes over `ℤ` are `ℤ/2ℤ` and `μ₂`. -/
theorem simple_two_groupScheme_over_int (G : FFGroupScheme) (h2 : ∃ k, order G = 2 ^ k)
    (h0 : order G ≠ 1) (hG : IsSimpleGroupScheme G) :
    Nonempty (G ≅ zModScheme ℤ 2) ∨ Nonempty (G ≅ muScheme ℤ 2) := sorry

/-- Every extension `0 → ℤ/2ℤ → E → μ₂ → 0` over `ℤ` splits. -/
theorem ext_muTwo_zModTwo_eq_zero : Ext1Vanishes (muScheme ℤ 2) (zModScheme ℤ 2) := sorry

/-- A finite flat two-group scheme over `ℤ` has a diagonalizable subobject and constant quotient. -/
theorem exists_diagonalizable_constant_filtration (G : FFGroupScheme)
    (h2 : ∃ k, order G = 2 ^ k) :
    ∃ (M C : FFGroupScheme) (i : M ⟶ G) (q : G ⟶ C), IsShortExact i q ∧
      IsDiagonalizableGroupScheme M ∧ IsConstantGroupScheme C ∧
      order M * order C = order G := sorry

/-- the number of `k`-rational points of `A`. -/
def numPoints {k : Type} [Field k] (A : AbelianVariety k) : ℕ :=
  Nat.card (Over.mk (𝟙 (Spec (.of k))) ⟶ A.toOver)

/-- Isogenous abelian varieties over a finite field have the same number of rational points. -/
theorem card_points_eq_of_isogeny {k : Type} [Field k] [Fintype k] {A B : AbelianVariety k}
    (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f) : numPoints A = numPoints B := sorry

/-- Fontaine's theorem. -/
theorem dim_eq_zero_of_goodReduction_everywhere (A : AbelianVariety ℚ)
    (hA : HasGoodReductionEverywhere A) : A.dim = 0 := sorry

end Fontaine

/-! ## Layer 4: Schoof's category `D(p, l)` and the field criterion -/

section Schoof

/-- Schoof's category `D(p, l)`: finite flat `p`-group schemes over `ℤ[1/l]` on whose points
every inertia element above `l` satisfies `(σ − 1)² = 0`. -/
def SemistableCategory (p l : ℕ) [NeZero l] : ObjectProperty (FFGroupSchemeAway l) := fun G =>
  (∃ k, order G = p ^ k) ∧
    ∀ σ ∈ inertiaAbove l, ∀ x : points G,
      galoisAct G σ (galoisAct G σ x) * (galoisAct G σ x)⁻¹ ^ 2 * x = 1

variable {p l : ℕ} [hpPrime : Fact p.Prime] [hlPrime : Fact l.Prime]

include hpPrime hlPrime

/-- Closed flat subobjects and quotients inherit the inertia square-zero condition. -/
theorem SemistableCategory.subobject {M G C : FFGroupSchemeAway l} (i : M ⟶ G) (q : G ⟶ C)
    (h : IsShortExact i q) (hG : SemistableCategory p l G) :
    SemistableCategory p l M ∧ SemistableCategory p l C := sorry

/-- Finite products inherit the inertia square-zero condition. -/
theorem SemistableCategory.prod {G G' P : FFGroupSchemeAway l} (π₁ : P ⟶ G) (π₂ : P ⟶ G')
    (hP : IsLimit (BinaryFan.mk π₁ π₂)) (hG : SemistableCategory p l G)
    (hG' : SemistableCategory p l G') : SemistableCategory p l P := sorry

/-- At distinct primes, Cartier duality preserves the inertia square-zero condition. -/
theorem SemistableCategory.cartierDual (hpl : p ≠ l) {G : FFGroupSchemeAway l}
    (hG : SemistableCategory p l G) :
    SemistableCategory p l
      (TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual _ G) := sorry

/-- Inertia acts trivially after the power killing the geometric point module. -/
theorem SemistableCategory.inertia_pow {G : FFGroupSchemeAway l} (hG : SemistableCategory p l G)
    {k : ℕ} (hk : IsKilledBy G (p ^ k)) :
    ∀ σ ∈ inertiaAbove l, ∀ x : points G, galoisAct G (σ ^ p ^ k) x = x := sorry

/-- An extension with inertia-trivial endpoints has inertia square zero. -/
theorem SemistableCategory.of_extension {G₂ G G₁ : FFGroupSchemeAway l} (i : G₂ ⟶ G)
    (q : G ⟶ G₁) (h : IsShortExact i q) (hord : ∃ k, order G = p ^ k)
    (h₁ : ∀ σ ∈ inertiaAbove l, ∀ x : points G₁, galoisAct G₁ σ x = x)
    (h₂ : ∀ σ ∈ inertiaAbove l, ∀ x : points G₂, galoisAct G₂ σ x = x) :
    SemistableCategory p l G := sorry

/-- `zModP_mem_semistableCategory` (degenerate): `ℤ/pℤ` and `μ_p` are objects of `D(p, l)`. -/
example (hpl : p ≠ l) :
    SemistableCategory p l (zModScheme _ p) ∧ SemistableCategory p l (muScheme _ p) :=
  sorry

/-- `katzMazur_mem_semistableCategory` (computation): every extension of `ℤ/pℤ` by `μ_p` over
`ℤ[1/l]`, in particular the Katz–Mazur `G_ε`, is in `D`: inertia acts by `(1 x; 0 1)`. -/
example (hpl : p ≠ l) (G : FFGroupSchemeAway l) (i : muScheme _ p ⟶ G)
    (q : G ⟶ zModScheme _ p)
    (h : IsShortExact i q) : SemistableCategory p l G := sorry

/- The two concrete integral examples `not_mem_semistableCategory_quadratic_twist` and
`X0_eleven_two_torsion_mem` are specified, with their absent construction interfaces, in the
closing comment. -/

/-- A length-three unipotent extension fails inertia square zero, so trivial endpoints matter. -/
example : ((!![1, 1, 0; 0, 1, 1; 0, 0, 1] : Matrix (Fin 3) (Fin 3) (ZMod 3)) - 1) ^ 2 ≠ 0 :=
  by decide

/-- Étale `p`-group schemes over `ℤ[1/l]` that are iterated extensions of `ℤ/pℤ`: `G_ℚ` acts on
their points through `Gal(ℚ(ζ_l)/ℚ)`, so they become constant over `ℤ[1/l, ζ_l]`. -/
theorem isConstant_baseChange_cyclotomic (hpl : p ≠ l) (C : FFGroupSchemeAway l)
    (hC : IsEtaleGroupScheme C) (hfilt : IsIteratedExtensionOf (zModScheme _ p) C) :
    (∀ σ : Field.absoluteGaloisGroup ℚ, galAut σ ∈ (cyclotomicSubfield l).fixingSubgroup →
        ∀ x : points C, galoisAct C σ x = x) ∧
      IsConstantGroupScheme
        ((TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor
          (Localization.Away (l : ℤ))
          (Algebra.adjoin (Localization.Away (l : ℤ))
            {ζ : AlgebraicClosure ℚ | ζ ^ l = 1})).obj C) := sorry

/-- Dually, an iterated extension of `μ_p` over `ℤ[1/l]` becomes diagonalizable over
`ℤ[1/l, ζ_l]`, since its Cartier dual is of the first kind. -/
theorem isDiagonalizable_baseChange_cyclotomic (hpl : p ≠ l) (D : FFGroupSchemeAway l)
    (hfilt : IsIteratedExtensionOf (muScheme _ p) D) :
    IsDiagonalizableGroupScheme
      ((TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor
        (Localization.Away (l : ℤ))
        (Algebra.adjoin (Localization.Away (l : ℤ))
          {ζ : AlgebraicClosure ℚ | ζ ^ l = 1})).obj D) := sorry

/-- `Ext¹_{ℤ[1/l]}(μ_p, ℤ/pℤ) = 0` for `p ∈ {2, 3}`, `l ≠ p`, unless `l ≡ ±1 (mod 8)` when
`p = 2`, or `l ≡ ±1 (mod 9)` when `p = 3`; in particular for `(l, p) = (2, 3), (3, 2), (5, 2),
(7, 3), (13, 2)`. (The one-dimensional exceptional case is not stated.) -/
theorem ext_muP_zModP_eq_zero (hp : p = 2 ∨ p = 3) (hlp : l ≠ p)
    (hl : if p = 2 then l % 8 ≠ 1 ∧ l % 8 ≠ 7 else l % 9 ≠ 1 ∧ l % 9 ≠ 8) :
    Ext1Vanishes (muScheme (Localization.Away (l : ℤ)) p)
      (zModScheme (Localization.Away (l : ℤ)) p) := sorry

end Schoof

/-- Schoof's field criterion for `(l, p)`: with `F` the degree-`p` subfield of `ℚ(ζ_l)` if
`p ∣ l − 1` and `F = ℚ` otherwise, and `M = F(ζ_{2p}, l^{1/p})`, every finite Galois `L ⊇ M`
unramified over `M` outside `p` with `v_p(δ_L) < 1 + 1/(p − 1)` has `[L : ℚ(ζ_p)]` a power of
`p`. Unramifiedness of `L/M` at a prime is "inertia meets `G_M` inside `G_L`". -/
def FieldCriterion (l p : ℕ) : Prop :=
  ∀ (F M L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L],
    (if p ∣ l - 1 then F ≤ cyclotomicSubfield l ∧ finrank ℚ F = p else F = ⊥) →
    M = F ⊔ cyclotomicSubfield (2 * p) ⊔
      IntermediateField.adjoin ℚ {x | x ^ p = (l : AlgebraicClosure ℚ)} →
    IsGalois ℚ L → M ≤ L →
    (∀ q : ℕ, q.Prime → q ≠ p → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ M.fixingSubgroup → galAut σ ∈ L.fixingSubgroup) →
    (padicValInt p (discr L) : ℝ) / finrank ℚ L < 1 + 1 / ((p : ℝ) - 1) →
    ∃ k : ℕ, finrank ℚ L = (p - 1) * p ^ k

/-- Schoof's Proposition 5.1: the field criterion forces the simple objects of `D(p, l)` to be
`ℤ/pℤ` and `μ_p`. -/
theorem simple_eq_of_fieldCriterion (l p : ℕ) [Fact l.Prime] [Fact p.Prime] (hlp : l ≠ p)
    (h : FieldCriterion l p) (G : FFGroupSchemeAway l) (hG : SemistableCategory p l G)
    (hs : IsSimpleGroupScheme G) (h0 : order G ≠ 1) :
    Nonempty (G ≅ zModScheme _ p) ∨ Nonempty (G ≅ muScheme _ p) := sorry

/-- Class number one for `ℚ(ζ₃, ∛2)`, `ℚ(ζ₁₂)`, `ℚ(i, √5)` and `ℚ(i, √13)`. -/
theorem classNumber_eq_one_small_fields :
    (∀ (K : Type) [Field K] [NumberField K] [IsSplittingField ℚ K (X ^ 3 - 2 : ℚ[X])],
        classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K] [IsCyclotomicExtension {12} ℚ K],
        classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K]
        [IsSplittingField ℚ K ((X ^ 2 + 1) * (X ^ 2 - 5) : ℚ[X])], classNumber K = 1) ∧
      (∀ (K : Type) [Field K] [NumberField K]
        [IsSplittingField ℚ K ((X ^ 2 + 1) * (X ^ 2 - 13) : ℚ[X])], classNumber K = 1) :=
  sorry

/-- The actual auxiliary field `ℚ(ζ₃, ∛2)`, as a subfield of `ℚ̄`. -/
def schoofFieldTwoThree : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  cyclotomicSubfield 3 ⊔ IntermediateField.adjoin ℚ {x | x ^ 3 = (2 : AlgebraicClosure ℚ)}

/-- The actual auxiliary field `ℚ(ζ₁₂)`. -/
def schoofFieldThreeTwo : IntermediateField ℚ (AlgebraicClosure ℚ) := cyclotomicSubfield 12

/-- The actual auxiliary field `ℚ(i, √5)`. -/
def schoofFieldFiveTwo : IntermediateField ℚ (AlgebraicClosure ℚ) :=
  cyclotomicSubfield 4 ⊔ IntermediateField.adjoin ℚ {x | x ^ 2 = (5 : AlgebraicClosure ℚ)}

/-- `(l, p) = (2, 3)`: the criterion; its stronger field conclusion follows below. -/
theorem fieldCriterion_two_three : FieldCriterion 2 3 := sorry

/-- Every admissible Galois `L` equals the specified degree-six field `ℚ(ζ₃, ∛2)`.
The inertia premise is relative unramifiedness of `L/M` away from `3`. -/
theorem fieldCriterion_two_three_eq_auxiliaryField
    (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L]
    (hG : IsGalois ℚ L) (hM : schoofFieldTwoThree ≤ L)
    (hunram : ∀ q : ℕ, q.Prime → q ≠ 3 → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ schoofFieldTwoThree.fixingSubgroup → galAut σ ∈ L.fixingSubgroup)
    (hdisc : (padicValInt 3 (discr L) : ℝ) / finrank ℚ L < 3 / 2) :
    L = schoofFieldTwoThree ∧ finrank ℚ L = 6 := sorry

/-- `(l, p) = (3, 2)`: the criterion; its exact degree possibilities follow below. -/
theorem fieldCriterion_three_two : FieldCriterion 3 2 := sorry

/-- A finite Galois `L ⊇ ℚ(ζ₁₂)`, relatively unramified away from `2` with strict normalized
two-adic discriminant exponent below `2`, has absolute degree `4` or `8`. -/
theorem fieldCriterion_three_two_degree
    (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L]
    (hG : IsGalois ℚ L) (hM : schoofFieldThreeTwo ≤ L)
    (hunram : ∀ q : ℕ, q.Prime → q ≠ 2 → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ schoofFieldThreeTwo.fixingSubgroup → galAut σ ∈ L.fixingSubgroup)
    (hdisc : (padicValInt 2 (discr L) : ℝ) / finrank ℚ L < 2) :
    finrank ℚ L = 4 ∨ finrank ℚ L = 8 := sorry

/-- `(l, p) = (5, 2)`: the criterion; its exact degree possibilities follow below. -/
theorem fieldCriterion_five_two : FieldCriterion 5 2 := sorry

/-- A finite Galois `L ⊇ ℚ(i, √5)`, relatively unramified away from `2` with strict normalized
two-adic discriminant exponent below `2`, has absolute degree `4`, `8` or `16`. -/
theorem fieldCriterion_five_two_degree
    (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [NumberField L]
    (hG : IsGalois ℚ L) (hM : schoofFieldFiveTwo ≤ L)
    (hunram : ∀ q : ℕ, q.Prime → q ≠ 2 → ∀ σ ∈ inertiaAbove q,
      galAut σ ∈ schoofFieldFiveTwo.fixingSubgroup → galAut σ ∈ L.fixingSubgroup)
    (hdisc : (padicValInt 2 (discr L) : ℝ) / finrank ℚ L < 2) :
    finrank ℚ L = 4 ∨ finrank ℚ L = 8 ∨ finrank ℚ L = 16 := sorry

/-- `(l, p) = (7, 3)`: `M = ℚ(ζ₃, ζ₇ + ζ₇⁻¹, ∛7)`, of degree `18`. -/
theorem fieldCriterion_seven_three : FieldCriterion 7 3 := sorry

/-- `(l, p) = (13, 2)`: `M = ℚ(i, √13)`. -/
theorem fieldCriterion_thirteen_two : FieldCriterion 13 2 := sorry

/-! ## Layer 5: GL₂-type abelian varieties and the terminal weights -/

section Terminal

open TauCeti.AlgebraicGeometry

/-- `End⁰(A) = ℚ ⊗ End(A)`, on Tau Ceti's `AbelianVariety.End`. -/
abbrev endZeroAlgebra {F : Type} [Field F] (A : AbelianVariety F) : Type :=
  ℚ ⊗[ℤ] A.End

/-- `A/F` is of GL₂(K)-type: `K` acts on `A` up to isogeny with `[K : ℚ] = dim A`
(Tau Ceti's `dim` takes values in `WithBot ℕ∞`). -/
def IsGL2Type {F : Type} [Field F] [NumberField F] (A : AbelianVariety F) (K : Type) [Field K]
    [NumberField K] : Prop :=
  Nonempty (K →+* endZeroAlgebra A) ∧ (finrank ℚ K : WithBot ℕ∞) = A.dim

/-- The GL₂(K)-type structure transfers along an isogeny. -/
theorem IsGL2Type.isogeny {F : Type} [Field F] [NumberField F] {A B : AbelianVariety F}
    {K : Type} [Field K] [NumberField K] (f : A ⟶ B) (hf : AbelianVariety.IsIsogeny f)
    (h : IsGL2Type A K) : IsGL2Type B K := sorry

/-- Base change to a finite extension `F'/F` keeps the GL₂(K)-type (the statement about `V_λ`
is in the closing comment). -/
theorem IsGL2Type.baseChange {F : Type} [Field F] [NumberField F] {A : AbelianVariety F}
    {K : Type} [Field K] [NumberField K] (h : IsGL2Type A K) (F' : Type) [Field F']
    [NumberField F'] [Algebra F F'] : IsGL2Type (A.baseChange F') K := sorry

/-- `isGL2Type_ellipticCurve` (computation): an elliptic curve over `ℚ` is of GL₂(ℚ)-type. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 1) : IsGL2Type A ℚ := sorry

/- `isGL2Type_J0_23` needs the actual modular Jacobian and its Hecke action, as specified in
the closing comment.  -/

/-- `not_isGL2Type_prod_rat` (non-example): a surface such as `E × E` is not of GL₂(ℚ)-type. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 2) : ¬ IsGL2Type A ℚ := sorry

/-- `isGL2Type_zero` (degenerate): the zero abelian variety is of GL₂-type for no number field. -/
example (A : AbelianVariety ℚ) (hA : A.dim = 0) (K : Type) [Field K] [NumberField K] :
    ¬ IsGL2Type A K := sorry

/-- Class number one for the six non-cyclotomic quadratic cases `p ∈ {7,11,19,43,67,163}`. -/
theorem classNumber_sqrt_neg_prime_eq_one :
    ∀ p ∈ ({7, 11, 19, 43, 67, 163} : Finset ℕ), ∀ (K : Type) [Field K] [NumberField K]
      [IsSplittingField ℚ K (X ^ 2 + C (p : ℚ))], classNumber K = 1 := sorry

variable {F : Type*} [Field F] [Fintype F] [TopologicalSpace F] [DiscreteTopology F]

/-- Snowden's (A1) for a residual representation: absolutely irreducible on `G_{ℚ(ζ_p)}`. -/
def SatisfiesA1Residual (p : ℕ) (ρ : ResidualRep F) : Prop :=
  IsIrreducibleSubgroup (imageOver ρ (cyclotomicSubfield p).fixingSubgroup)

open scoped MatrixGroups in
/-- Check: the terminal weights `2, 4, 6, 8` carry no level-one cusp forms (Mathlib). -/
example (k : ℤ) (hk : k < 12) : Module.rank ℂ (CuspForm 𝒮ℒ k) = 0 :=
  CuspForm.rank_eq_zero_of_weight_lt_twelve hk

open scoped MatrixGroups in
/-- Check: `S₁₄(SL₂(ℤ)) = 0`, through `S₁₄ ≅ M₂ = 0`. -/
example : Module.rank ℂ (CuspForm 𝒮ℒ 14) = 0 := sorry

end Terminal

/-! ## Layer 6: the base-case table -/

/-- One row of the base-case table. The theorem a row asserts is `BaseCaseRow.statement`, the
name of its proving declaration (not a `Prop`-valued field). -/
structure BaseCaseRow where
  /-- The residual characteristics covered (empty for the abelian-variety rows). -/
  characteristics : Set ℕ
  /-- The Serre weights covered in each characteristic. -/
  weights : ℕ → Set ℕ
  /-- Whether the row is a level-one (conductor-one) statement. -/
  levelOne : Bool
  /-- Whether the row assumes oddness. -/
  oddness : Bool
  /-- The allowed bad primes, for the abelian-variety rows. -/
  badPrimes : Option (Finset ℕ)
  imageCondition : String
  coefficientCondition : String
  supplier : String
  consumer : String
  localCheck : String
  /-- The proving declaration. -/
  statement : Lean.Name

/-- The nine arithmetic base-case rows, with their exact characteristic and weight sets. -/
def baseCases : List BaseCaseRow :=
  [ { characteristics := {2}, weights := fun _ => Set.univ, levelOne := true, oddness := false,
      badPrimes := none, imageCondition := "absolutely irreducible",
      coefficientCondition := "finite, char 2",
      supplier := "tate_no_levelOne_char_two", consumer := "ClassicalSerreModularity, initial characteristic; DP23 Thm 1.1",
      localCheck := "unramified outside 2; determinant oddness is automatic",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.tate_no_levelOne_char_two },
    { characteristics := {3}, weights := fun _ => Set.univ, levelOne := true, oddness := true,
      badPrimes := none, imageCondition := "absolutely irreducible",
      coefficientCondition := "finite, char 3",
      supplier := "serre_no_levelOne_char_three", consumer := "ClassicalSerreModularity; ClassicalSerreModularity, terminal compatible systems (3-adic members)",
      localCheck := "odd and unramified outside 3",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.serre_no_levelOne_char_three },
    { characteristics := ∅, weights := fun _ => ∅, levelOne := false, oddness := false,
      badPrimes := some ∅, imageCondition := "abelian variety over ℚ",
      coefficientCondition := "every dimension", supplier := "dim_eq_zero_of_goodReduction_everywhere",
      consumer := "ClassicalSerreModularity, weight induction (weight 2 at level one)", localCheck := "good reduction everywhere",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.dim_eq_zero_of_goodReduction_everywhere },
    { characteristics := ∅, weights := fun _ => ∅, levelOne := false, oddness := false,
      badPrimes := some {2, 3, 5, 7, 13}, imageCondition := "semistable abelian variety over ℚ",
      coefficientCondition := "every dimension", supplier := "no_semistable_abelianVariety_one_prime",
      consumer := "ClassicalSerreModularity, weight induction (weights p + 1, p ∈ {5, 7, 13}); ClassicalSerreModularity, terminal compatible systems (l = 5)",
      localCheck := "semistable at l",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.no_semistable_abelianVariety_one_prime },
    { characteristics := {p | p.Prime}, weights := fun _ => {2}, levelOne := true,
      oddness := true, badPrimes := none, imageCondition := "absolutely irreducible",
      coefficientCondition := "finite", supplier := "not_levelOne_weight_two",
      consumer := "ClassicalSerreModularity, weight induction", localCheck := "Serre weight at p",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.not_levelOne_weight_two },
    { characteristics := {5, 7, 13}, weights := fun p => {p + 1}, levelOne := true,
      oddness := true, badPrimes := none, imageCondition := "absolutely irreducible",
      coefficientCondition := "finite",
      supplier := "not_levelOne_weight_succ_of_schoofPrime", consumer := "ClassicalSerreModularity, weight induction",
      localCheck := "Serre weight at p",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.not_levelOne_weight_succ_of_schoofPrime },
    { characteristics := {3, 5, 7, 13}, weights := fun p => if p = 3 then {2, 4} else {p + 1},
      levelOne := true, oddness := true, badPrimes := none,
      imageCondition := "irreducible p-adic representation with reducible reduction",
      coefficientCondition := "crystalline p-adic, Hodge–Tate weights {0, k - 1}",
      supplier := "no_levelOne_crystalline_of_reducible_terminal", consumer := "ClassicalSerreModularity, terminal compatible systems (p = 3); ClassicalSerreModularity, weight induction",
      localCheck := "ordinary and p-distinguished at p",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.no_levelOne_crystalline_of_reducible_terminal },
    { characteristics := {p | p.Prime},
      weights := fun p => Set.Icc 2 8 ∪ (if p = 11 then ∅ else {14}), levelOne := true,
      oddness := true, badPrimes := none, imageCondition := "absolutely irreducible",
      coefficientCondition := "finite", supplier := "not_levelOne_small_weight",
      consumer := "ClassicalSerreModularity, weight induction", localCheck := "Serre weight of ρ̄ itself",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.not_levelOne_small_weight },
    { characteristics := {5}, weights := fun _ => {2, 4, 6}, levelOne := true, oddness := true,
      badPrimes := none, imageCondition := "irreducible, (A1)",
      coefficientCondition := "almost strictly compatible system",
      supplier := "paso_six", consumer := "ClassicalSerreModularity, terminal compatible systems",
      localCheck := "minimal crystalline lift at 5",
      statement := `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases.paso_six } ]

/-- The Schoof row's prime set is exactly `{2, 3, 5, 7, 13}`. -/
theorem baseCases_schoof_primes :
    ∃ r ∈ baseCases, r.supplier = "no_semistable_abelianVariety_one_prime" ∧ r.badPrimes = some {2, 3, 5, 7, 13} :=
  sorry

/-- `baseCases_schoof_primes` (computation): the Schoof row's prime set is `{2, 3, 5, 7, 13}`;
`11` is not in it, which a table with "all primes at most 13" would get wrong (`J₀(11)`). -/
example : ∀ r ∈ baseCases, r.supplier = "no_semistable_abelianVariety_one_prime" →
    r.badPrimes = some {2, 3, 5, 7, 13} ∧ ∀ s, r.badPrimes = some s → 11 ∉ s := sorry

/-- `baseCases_tate_no_oddness` (degenerate): the `p = 2` row carries no oddness hypothesis. -/
example : ∀ r ∈ baseCases, r.characteristics = {2} → r.oddness = false := sorry

/-- `baseCases_weight_list` (non-example): no level-one row covers weight `12` at `p = 11`
(`Δ` gives an irreducible level-one `ρ̄` of weight `12` mod `11`). -/
example : ∀ r ∈ baseCases, r.levelOne = true → 11 ∈ r.characteristics → 12 ∉ r.weights 11 :=
  sorry

/-- `baseCases_fontaine_schoof_distinct` (computation): the Fontaine row and the Schoof row are
distinct rows with distinct suppliers. -/
example : ∃ r₁ ∈ baseCases, ∃ r₂ ∈ baseCases, r₁.badPrimes = some ∅ ∧
    r₂.badPrimes = some {2, 3, 5, 7, 13} ∧ r₁.supplier ≠ r₂.supplier := sorry

/-- `baseCases_weight_fourteen_excludes_eleven` (non-example): no level-one row contains
`(p, k) = (11, 14)`. -/
example : ∀ r ∈ baseCases, r.levelOne = true → 11 ∈ r.characteristics → 14 ∉ r.weights 11 :=
  sorry

end TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

/-
Signatures requiring further supplier interfaces:
* `localRootDiscrExp`, its API statements and five field computations, the local-to-global
  root-discriminant identities, the wild Borel normal form, and the characteristic-two and
  characteristic-three different bounds: compatible valued-field different/index and finite
  upper-ramification interfaces from LocalFieldsRamification. Current Tau Ceti's native local
  invariants are the intended suppliers, not arbitrary functions on field types.
* `unitFiltration_two_le_map_pow_three`, `unitFiltration_pow_three_of_ramificationIndex_eq_two`
  and the critical cubic graded index: the same ramification-index/valuation comparison.
* `localRootDiscrExp_torsionField_lt`: the compatible completion interface and local
  invariants. Its global `N = 1` specialisation appears above.
* `torsion_mem_semistableCategory`, `no_semistable_of_simple_and_ext`, and
  `no_semistable_abelianVariety_one_prime`: semistable reduction, the integral abelian scheme,
  and its finite flat multiplication kernels (NeronModelsAndSemistableAbelianVarieties and
  AbelianSchemesAndArithmeticModuli).
* `IsGL2Type.lambdaAdicRep`, `finrank_lambdaAdicRep`, `free_tateModule`, `ComesFromGL2Type`,
  `comesFromGL2Type_of_restrict`, and the representation parts of `isogeny` and `baseChange`:
  rational Tate modules with commuting endomorphism actions and scalar extension.
* `comesFromGL2Type_of_weightTwo`, `reduction_of_comesFromGL2Type`,
  `no_levelOne_crystalline_of_reducible_terminal`, and `paso_six`: de Rham/crystalline/
  semistable representations, Weil–Deligne types and almost strictly compatible systems.
* `levelOne_dihedral_classification`, `not_levelOne_weight_two`,
  `not_levelOne_weight_succ_of_schoofPrime`, `weight_fourteen_eleven_twist`,
  `not_levelOne_small_weight`, and `baseCases_holds`: the actual local Serre-weight recipe,
  together with the preceding geometric and compatible-system interfaces.
* `not_mem_semistableCategory_quadratic_twist`: finite étale descent of the explicitly specified
  one-dimensional character of `ℚ(√−7)` over `ℤ[1/7]`; the nontrivial inertia element acts by
  `-1`, and `(-1-1)^2 = 1` in `𝔽₃`.
* `X0_eleven_two_torsion_mem`: the integral model of the actual `J₀(11)` and its finite flat
  multiplication-by-two kernel. Its required order is four, with simplicity and membership
  in `D(2,11)`; the geometric point representation above does not provide the integral model.
* `isGL2Type_J0_23`: the actual modular curve and Jacobian, and its rational Hecke embedding
  `ℚ(√5) → End⁰_ℚ(J₀(23))`; the required dimension is two. ModularCurves, JacobianChallenge
  and the geometric Hecke-action interface supply these constructions.
-/
