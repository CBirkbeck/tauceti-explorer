/-
Copyright (c) 2026 The Tau Ceti Atlas contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.RepresentationTheory.Homological.TateCohomology.LowDegree

/-!
# Suggested Lean statements for "Hermitian K-theory of Poincaré ∞-categories and the flavours of L-theory"

This file is **not** the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HermitianKTheoryOfPoincareCategories.md` and its packet are
definitive. The statements below suggest Lean forms for the pieces of the roadmap that can be
stated with what the pinned Mathlib (`082e2d3`) and Tau Ceti (`f790474`) already provide, so that
contributors and reviewers converge on names and signatures.

The carriers of almost every target are not at the pins: there are no stable ∞-categories with
Poincaré structures, no genuine structures `Q^{≥m}_M`, no L- or Grothendieck–Witt spectra and no
bounded L-monoids in Mathlib or Tau Ceti. They belong to GeometryOfNumbersAndQuadraticArithmetic
§6.8a (TauCetiRoadmap PR #851) and to the README targets of this roadmap (layers HK.0–HK.8), whose
API names in the packet are proposed names, not declarations of this file.

What is here:

* coherent rings and global dimension (layer HK.6), on Mathlib's `Module.FinitePresentation` and
  `CategoryTheory.HasProjectiveDimensionLE`, with their basic statements and tests;
* complexes concentrated in an interval and the one-sided width criterion (layer HK.2, Lemma 1.1.6
  and Remark 1.1.7 of Calmès et al. III), on Mathlib's chain complexes;
* the width bounds of the bounded L-monoids (layer HK.3, Definition 1.2.1) and the numerical cores
  of quadratic and symmetric surgery (layers HK.4 and HK.6, Propositions 1.2.6 and 1.3.1), proved
  by `omega`;
* the comparison ranges of Corollaries 1.2.12, 1.2.29, 1.3.9, 1.3.10 and 1.3.14 as integer
  functions, with the values used in the README;
* two form identities: the Frobenius-twisted linearity of `x ↦ b(x,x)` (source issue
  `HermitianKTheoryOfPoincareCategories/E6`) and that even forms are alternating in
  characteristic two (layer HK.7, `field-l-groups`);
* the Tate cohomology input `Ĥ^{-1}(C₂; ℤ) = 0` of the collapse criterion (layer HK.0), from Tau Ceti.
-/

namespace HermitianKTheoryOfPoincareCategories

open CategoryTheory

/-! ## Layer HK.6: coherent rings and global dimension -/

section Coherent

universe u

variable (R : Type u) [Ring R]

/-- A ring is (left) coherent if every finitely generated left ideal is finitely presented
(Calmès et al. III, §1.3, p. 27; equivalently, finitely presented modules form an abelian
category). -/
def IsLeftCoherentRing : Prop :=
  ∀ I : Ideal R, I.FG → Module.FinitePresentation R I

/-- `R` has (left) global dimension at most `d`: every left module has projective dimension at
most `d`. -/
def HasGlobalDimensionLE (d : ℕ) : Prop :=
  ∀ M : ModuleCat.{u} R, HasProjectiveDimensionLE M d

/-- Noetherian rings are coherent. -/
theorem IsLeftCoherentRing.of_isNoetherianRing [IsNoetherianRing R] : IsLeftCoherentRing R := by
  sorry

/-- Global dimension zero means semisimple. -/
theorem hasGlobalDimensionLE_zero_iff : HasGlobalDimensionLE R 0 ↔ IsSemisimpleRing R := by
  sorry

/-- Global dimension is monotone in the bound. -/
theorem HasGlobalDimensionLE.mono {d e : ℕ} (h : HasGlobalDimensionLE R d) (hde : d ≤ e) :
    HasGlobalDimensionLE R e := by
  sorry

/-- Dedekind domains have global dimension at most one (Corollary 1.3.14 uses `d ≤ 1`). -/
theorem IsDedekindDomain.hasGlobalDimensionLE_one (A : Type u) [CommRing A] [IsDedekindDomain A] :
    HasGlobalDimensionLE A 1 := by
  sorry

/-- Over a coherent ring of global dimension `≤ d`, a finitely presented module has a projective
resolution of length `≤ d` by finitely generated projectives; here, the projective dimension
bound for finitely presented modules. -/
theorem finitePresentation_hasProjectiveDimensionLE {d : ℕ} (_hcoh : IsLeftCoherentRing R)
    (hd : HasGlobalDimensionLE R d) (M : ModuleCat.{u} R) [Module.FinitePresentation R M] :
    HasProjectiveDimensionLE M d :=
  hd M

/-- Test: a field is coherent. -/
example (K : Type u) [Field K] : IsLeftCoherentRing K :=
  IsLeftCoherentRing.of_isNoetherianRing K

/-- Test: `ℤ` has global dimension one and not zero (`ℤ/2` has projective dimension one). -/
example : HasGlobalDimensionLE ℤ 1 := IsDedekindDomain.hasGlobalDimensionLE_one ℤ

example : ¬ HasGlobalDimensionLE ℤ 0 := by
  sorry

/-- Non-example: the dual numbers over a field are Noetherian, hence coherent, but have infinite
global dimension. -/
example (K : Type u) [Field K] : ¬ ∃ d : ℕ, HasGlobalDimensionLE (DualNumber K) d := by
  sorry

end Coherent

/-! ## Layer HK.2: complexes concentrated in an interval -/

section Width

universe v w

variable {V : Type v} [Category.{w} V] [Limits.HasZeroMorphisms V]

/-- A chain complex is concentrated in homological degrees `[k, l]`. -/
def IsConcentratedIn (C : ChainComplex V ℤ) (k l : ℤ) : Prop :=
  ∀ i : ℤ, i < k ∨ l < i → Limits.IsZero (C.X i)

/-- Ranicki's `n`-dimensional complexes: concentrated in degrees `[0, n]`
(Calmès et al. III, §1.2, p. 20). -/
def IsNDimensional (C : ChainComplex V ℤ) (n : ℕ) : Prop :=
  IsConcentratedIn C 0 n

theorem IsConcentratedIn.mono {C : ChainComplex V ℤ} {k l k' l' : ℤ}
    (h : IsConcentratedIn C k l) (hk : k' ≤ k) (hl : l ≤ l') : IsConcentratedIn C k' l' := by
  intro i hi
  exact h i (by omega)

/-- One-sided width criterion (Calmès et al. III, Remark 1.1.7): a bounded complex of finitely
generated projectives whose homology vanishes below degree `k` is homotopy equivalent to a complex
of finitely generated projectives vanishing below degree `k`. -/
theorem exists_homotopyEquiv_concentrated_ge {R : Type v} [Ring R]
    (C : ChainComplex (ModuleCat.{v} R) ℤ)
    (hproj : ∀ i, Module.Projective R (C.X i)) (hfin : ∀ i, Module.Finite R (C.X i))
    (hbdd : ∃ a b, IsConcentratedIn C a b) (k : ℤ)
    (hk : ∀ i < k, Limits.IsZero (C.homology i)) :
    ∃ D : ChainComplex (ModuleCat.{v} R) ℤ, (∀ i, Module.Projective R (D.X i)) ∧
      (∀ i, Module.Finite R (D.X i)) ∧ (∃ b, IsConcentratedIn D k b) ∧
      Nonempty (HomotopyEquiv C D) := by
  sorry

end Width

/-! ## Layer HK.3: width bounds of the bounded L-monoids -/

section Bounds

/-- Connectivity required of a Poincaré object in `Pn^a_n`: `(-n-a)/2` (exact when `n + a` is
even; Definition 1.2.1). -/
def objectBound (n a : ℤ) : ℤ := (-n - a) / 2

/-- Connectivity required of an allowed Lagrangian: `⌈(-n-1-b)/2⌉`. -/
def lagrangianBound (n b : ℤ) : ℤ := -((n + 1 + b) / 2)

/-- Connectivity required of the fibre of an allowed Lagrangian: `⌊(-n-1-b)/2⌋`. -/
def fibreBound (n b : ℤ) : ℤ := (-n - 1 - b) / 2

/-- Test: `(n,a,b) = (0,0,1)` — projective modules in degree 0, Lagrangians in degrees `[-1,0]`. -/
example : objectBound 0 0 = 0 ∧ lagrangianBound 0 1 = -1 ∧ fibreBound 0 1 = -1 := by
  decide

/-- Test: Ranicki's lengths `(n,a,b) = (3,3,4)` — objects in `[-3,0]`, Lagrangians from `-4`. -/
example : objectBound 3 3 = -3 ∧ lagrangianBound 3 4 = -4 ∧ fibreBound 3 4 = -4 := by
  decide

/-- Test: the two bounds differ by one when `n + b` is even (`(n,b) = (0,2)`). -/
example : lagrangianBound 0 2 = -1 ∧ fibreBound 0 2 = -2 := by
  decide

/-- Numerical core of quadratic surgery (Proposition 1.2.6(i), via Lemma 1.2.10): below the
target connectivity, `Q(P[k])` is more than `n`-connective and surgery raises connectivity. -/
theorem quadraticSurgery_numerics (n a m k : ℤ) (hpar : Even (n + a)) (ha0 : 0 ≤ a)
    (ha : n - 2 * m ≤ a) (hk : 2 * k < -n - a) :
    n < -2 * k ∧ n < m - k ∧ k + 1 < -k - n := by
  obtain ⟨t, ht⟩ := hpar
  omega

/-- Numerical core of symmetric surgery (Proposition 1.3.1(i)): with `k = (-n-a-2)/2` the
truncation levels `n + 2k + d` and `k + d - r` are negative. -/
theorem symmetricSurgery_numerics (n a d r : ℤ) (hpar : Even (n + a)) (had : d - 1 ≤ a)
    (har : -n + 2 * d - 2 * r ≤ a) :
    n + 2 * ((-n - a - 2) / 2) + d < 0 ∧ (-n - a - 2) / 2 + d - r < 0 := by
  obtain ⟨t, ht⟩ := hpar
  omega

end Bounds

/-! ## Layers HK.4, HK.5, HK.7: comparison ranges -/

section Ranges

/-- `L^q_n → L_n(Q)` is an isomorphism up to this degree for an `m`-quadratic `Q`
(Corollary 1.2.12). -/
def quadraticComparisonIsoUpTo (m : ℤ) : ℤ := 2 * m - 3

/-- `L_n(Q) → L^s_n` is injective from this degree for an `r`-symmetric `Q` over a coherent ring
of global dimension `d` (Corollary 1.3.9). -/
def symmetricComparisonInjFrom (d : ℕ) (r : ℤ) : ℤ := d - 2 * r + 2

/-- … and bijective from this degree. -/
def symmetricComparisonBijFrom (d : ℕ) (r : ℤ) : ℤ := d - 2 * r + 3

/-- Comparison along a 1-connective map of connective ring spectra (Proposition 1.2.29):
isomorphism up to `min (2p-1) (2m)`. -/
def connectiveComparisonIsoUpTo (m p : ℤ) : ℤ := min (2 * p - 1) (2 * m)

/-- … and surjective in degree `min (2p) (2m+1)`. -/
def connectiveComparisonSurjAt (m p : ℤ) : ℤ := min (2 * p) (2 * m + 1)

/-- Theorem 5 addendum: `L^q_n ≅ L^gs_n` for `n ≤ -3` (`Q^gs` is 0-quadratic). -/
example : quadraticComparisonIsoUpTo 0 = -3 := by decide

/-- Theorem 6: genuine symmetric (`r = 2`) and genuine quadratic (`r = 0`) ranges. -/
example (d : ℕ) : symmetricComparisonInjFrom d 2 = d - 2 ∧ symmetricComparisonBijFrom d 2 = d - 1 ∧
    symmetricComparisonInjFrom d 0 = d + 2 ∧ symmetricComparisonBijFrom d 0 = d + 3 := by
  simp only [symmetricComparisonInjFrom, symmetricComparisonBijFrom]
  omega

/-- Corollary 1.3.14 (Dedekind rings, `d = 1`). -/
example : symmetricComparisonInjFrom 1 2 = -1 ∧ symmetricComparisonBijFrom 1 2 = 0 ∧
    symmetricComparisonInjFrom 1 0 = 3 ∧ symmetricComparisonBijFrom 1 0 = 4 := by
  decide

/-- Corollary 1.2.33 and Example 1.2.35: genuine symmetric over a ring spectrum (`p = -1`),
with trivial action (`p = 0`), and Tate (`p = 1`). -/
example : connectiveComparisonIsoUpTo 0 (-1) = -3 ∧ connectiveComparisonSurjAt 0 (-1) = -2 ∧
    connectiveComparisonIsoUpTo 0 0 = -1 ∧ connectiveComparisonSurjAt 0 0 = 0 ∧
    connectiveComparisonIsoUpTo 0 1 = 0 ∧ connectiveComparisonSurjAt 0 1 = 1 := by
  decide

/-- Corollary 1.2.30 is Proposition 1.2.29 with `p = m - 1`. -/
theorem connectiveComparison_quadratic (m : ℤ) :
    connectiveComparisonIsoUpTo m (m - 1) = quadraticComparisonIsoUpTo m ∧
      connectiveComparisonSurjAt m (m - 1) = 2 * m - 2 := by
  simp only [connectiveComparisonIsoUpTo, connectiveComparisonSurjAt, quadraticComparisonIsoUpTo]
  omega

end Ranges

/-! ## Form identities -/

section Forms

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- Source issue `E6` (Remark R.7): `x ↦ b(x,x)` is linear only for the Frobenius-twisted
structure, `b(rx, rx) = r² b(x,x)`. -/
theorem bilin_diag_smul (b : LinearMap.BilinForm R M) (r : R) (x : M) :
    b (r • x) (r • x) = r ^ 2 * b x x := by
  simp [pow_two, mul_assoc]

/-- A skew-symmetric form takes values in the 2-torsion on the diagonal (Remark R.7). -/
theorem skew_diag_two_torsion (b : LinearMap.BilinForm R M) (hb : ∀ x y, b x y = -b y x) (x : M) :
    2 * b x x = 0 := by
  have h := hb x x
  rw [two_mul]
  linear_combination h

/-- In characteristic two an even form `c + cᵗ` is alternating, hence metabolic: this gives
`L^gs_{-2}(𝔽₂) = L^ge_0(𝔽₂) = 0` (layer HK.7, `field-l-groups`). -/
theorem even_form_alternating_charTwo {K V : Type*} [Field K] [CharP K 2] [AddCommGroup V]
    [Module K V] (c : LinearMap.BilinForm K V) (x : V) : (c + c.flip) x x = 0 := by
  simp only [LinearMap.add_apply]
  exact CharTwo.add_self_eq_zero (c x x)

end Forms

/-! ## Layer HK.0: Tate cohomology input of the collapse criterion -/

/-- `Ĥ^{-1}(C₂; ℤ) = 0` for the trivial action, so `Q^gq_ℤ = Q^ge_ℤ`
(Remark R.4; Tau Ceti `subsingleton_tateCohomology_negOne_trivial_int`). -/
example : Subsingleton (tateCohomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) (-1)) :=
  inferInstance

end HermitianKTheoryOfPoincareCategories
