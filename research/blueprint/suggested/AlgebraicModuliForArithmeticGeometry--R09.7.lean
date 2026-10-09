/-
# Characteristic-zero resolution and normal-crossings compactification

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/AlgebraicModuliForArithmeticGeometry--R09.7.md`.
The statements suggest Lean forms so that contributors and reviewers converge
on names and signatures; proving them finishes neither the layer nor the roadmap.

The native scheme, ideal, formal-series and finite combinatorial interfaces below
are prototypes, with proofs left open. They do not implement resolution.
The final omission ledger identifies signatures that require the five supplier
interfaces in the packet. An unavailable geometric condition is not represented
by an arbitrary proposition field. Local algebra prototypes are explicitly
labelled where the scheme-level construction cannot yet be stated.
-/

import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.AlgebraicGeometry.Stalk
import Mathlib.RingTheory.Ideal.Colon
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.MvPowerSeries.Derivative
import Mathlib.RingTheory.MvPowerSeries.NoZeroDivisors
import Mathlib.Order.WellQuasiOrder
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.Analysis.Analytic.Inverse
import Mathlib.Analysis.Complex.Basic
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Noetherian
import Mathlib.RingTheory.Flat.Basic
import TauCeti.Analysis.Calculus.InverseFunctionTheorem

noncomputable section

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.Resolution

open CategoryTheory AlgebraicGeometry
open scoped BigOperators

/-! ## Native local ideal order and weighted formal presentations -/

/-- The actual germ ideal, formed from affine neighbourhoods. -/
def stalkIdeal {X : Scheme} (I : X.IdealSheafData) (a : X) :
    Ideal (X.presheaf.stalk a) :=
  ⨆ (U : X.affineOpens) (ha : a ∈ U.1),
    (I.ideal U).map (X.presheaf.germ U.1 a ha).hom

/-- Local order, including infinity for the zero ideal in the separated case. -/
def idealOrder {A : Type*} [CommRing A] [IsLocalRing A] (J : Ideal A) : ℕ∞ :=
  ⨆ (r : ℕ) (_ : J ≤ IsLocalRing.maximalIdeal A ^ r), (r : ℕ∞)

/-- Native total-degree order of a formal ideal. -/
def formalIdealOrder {σ K : Type*} [Field K] (J : Ideal (MvPowerSeries σ K)) : ℕ∞ :=
  ⨅ f : J, MvPowerSeries.order f.val

lemma stalkIdeal_affine {X : Scheme} (I : X.IdealSheafData) (a : X)
    (U : X.affineOpens) (ha : a ∈ U.1) :
    stalkIdeal I a = (I.ideal U).map (X.presheaf.germ U.1 a ha).hom := by sorry

lemma idealOrder_eq_iInf {σ K : Type*} [Finite σ] [Field K]
    (J : Ideal (MvPowerSeries σ K)) :
    idealOrder J = formalIdealOrder J := by sorry

lemma idealOrder_span {σ K : Type*} [Finite σ] [Field K]
    (f : Fin m → MvPowerSeries σ K) :
    formalIdealOrder (Ideal.span (Set.range f)) = ⨅ i, MvPowerSeries.order (f i) := by sorry

-- order_zero_ideal
example {σ K : Type*} [Field K] :
    formalIdealOrder (⊥ : Ideal (MvPowerSeries σ K)) = ⊤ := by sorry
-- order_unit_ideal
example {σ K : Type*} [Field K] :
    formalIdealOrder (⊤ : Ideal (MvPowerSeries σ K)) = 0 := by sorry
-- order_two_generators
example : formalIdealOrder (Ideal.span ({MvPowerSeries.X (0 : Fin 2) ^ 3,
    MvPowerSeries.X (1 : Fin 2) ^ 5} : Set (MvPowerSeries (Fin 2) ℚ))) = 3 := by sorry

structure WeightedPresentation (σ K : Type*) [Field K] where
  count : ℕ
  function : Fin count → MvPowerSeries σ K
  mark : Fin count → ℚ
  positive : ∀ i, 0 < mark i

/-- Division by a positive mark; the infinity branch is separate. -/
def normalizedSeriesOrder {σ K : Type*} [Field K]
    (f : MvPowerSeries σ K) (d : ℚ) : WithTop ℚ :=
  if MvPowerSeries.order f = ⊤ then ⊤ else
    ((MvPowerSeries.order f).toNat : ℚ) / d

def normalizedOrder {σ K : Type*} [Field K]
    (P : WeightedPresentation σ K) : WithTop ℚ :=
  Finset.univ.inf fun i => normalizedSeriesOrder (P.function i) (P.mark i)

def formalCosupport {σ K : Type*} [Field K] (P : WeightedPresentation σ K) : Prop :=
  ∀ i, (1 : WithTop ℚ) ≤ normalizedSeriesOrder (P.function i) (P.mark i)

/-- Order along one coordinate divisor, distinct from total order at the origin. -/
def coordinateOrder {σ K : Type*} [Field K] (f : MvPowerSeries σ K) (i : σ) : ℕ∞ :=
  ⨆ (r : ℕ) (_ : MvPowerSeries.X i ^ r ∣ f), (r : ℕ∞)

def exceptionalOrder {σ K : Type*} [Field K]
    (P : WeightedPresentation σ K) (j : σ) : WithTop ℚ :=
  Finset.univ.inf fun i => if coordinateOrder (P.function i) j = ⊤ then ⊤ else
    (((coordinateOrder (P.function i) j).toNat : ℚ) / P.mark i : ℚ)

/-- No subtraction of two infinities occurs. -/
def residualOrder {σ K : Type*} [Field K]
    (P : WeightedPresentation σ K) (E : Finset σ) : WithTop ℚ :=
  if normalizedOrder P = ⊤ then ⊤ else
    ((normalizedOrder P).untopD 0 - ∑ j ∈ E, (exceptionalOrder P j).untopD 0 : ℚ)

/-- Power to a *specified* common mark: integral exponents are part of the input. -/
def commonMarkPresentation {σ K : Type*} [Field K] (P : WeightedPresentation σ K)
    (D : ℕ) (e : Fin P.count → ℕ) (hD : 0 < D)
    (_he : ∀ i, (e i : ℚ) * P.mark i = D) : WeightedPresentation σ K where
  count := P.count
  function i := P.function i ^ e i
  mark _ := D
  positive _ := by exact_mod_cast hD

lemma weightedPresentation_commonMark {σ K : Type*} [Finite σ] [Field K]
    (P : WeightedPresentation σ K) (D : ℕ) (e : Fin P.count → ℕ)
    (hD : 0 < D) (he : ∀ i, (e i : ℚ) * P.mark i = D) :
    formalCosupport (commonMarkPresentation P D e hD he) ↔ formalCosupport P := by sorry

lemma normalizedOrder_commonMark {σ K : Type*} [Finite σ] [Field K]
    (f : Fin m → MvPowerSeries σ K) (d : ℕ) (hd : 0 < d) :
    normalizedOrder ⟨m, f, fun _ => d, by intro i; exact_mod_cast hd⟩ =
      (if formalIdealOrder (Ideal.span (Set.range f)) = ⊤ then ⊤ else
      ((((formalIdealOrder (Ideal.span (Set.range f))).toNat : ℚ) / (d : ℚ) : ℚ) : WithTop ℚ)) := by sorry

lemma exceptionalOrder_divisibility {σ K : Type*} [Field K]
    (f : Fin m → MvPowerSeries σ K) (d r : ℕ) (hd : 0 < d) (j : σ) :
    (((r : ℚ) / (d : ℚ) : ℚ) : WithTop ℚ) ≤ exceptionalOrder
        ⟨m, f, fun _ => d, by intro i; exact_mod_cast hd⟩ j ↔
      ∀ i, MvPowerSeries.X j ^ r ∣ f i := by sorry

lemma residualOrder_nonnegative {σ K : Type*} [Finite σ] [Field K]
    (P : WeightedPresentation σ K) (E : Finset σ) :
    (0 : WithTop ℚ) ≤ residualOrder P E := by sorry

private def monomialPresentation : WeightedPresentation (Fin 2) ℚ where
  count := 1
  function _ := MvPowerSeries.X (0 : Fin 2) ^ 2 * MvPowerSeries.X (1 : Fin 2) ^ 3
  mark _ := 2
  positive _ := by norm_num

-- exceptional_is_not_point_order
example : normalizedOrder monomialPresentation = (5 / 2 : ℚ) ∧
    exceptionalOrder monomialPresentation 0 = (1 : ℚ) ∧
    residualOrder monomialPresentation {0} = (3 / 2 : ℚ) := by sorry
-- monomial_residual_zero
example : residualOrder monomialPresentation {0, 1} = (0 : ℚ) := by sorry
-- empty_presentation_infinite
example {σ K : Type*} [Field K] :
    residualOrder (⟨0, Fin.elim0, Fin.elim0, by intro i; exact Fin.elim0 i⟩ :
      WeightedPresentation σ K) ∅ = ⊤ := by sorry

/-! ## Genuine scheme coordinate conditions -/

abbrev affine (k : Type) [Field k] (n : ℕ) : Scheme :=
  Spec (.of (MvPolynomial (Fin n) k))

def affineToBase (k : Type) [Field k] (n : ℕ) : affine k n ⟶ Spec (.of k) :=
  Spec.map (CommRingCat.ofHom MvPolynomial.C)

def coordinateIdeal (k : Type) [Field k] (n : ℕ) (i : Fin n) :
    (affine k n).IdealSheafData :=
  (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk
    (Ideal.span ({MvPolynomial.X i} : Set (MvPolynomial (Fin n) k)))))).ker

/-- One simultaneous chart. Active labels are exactly the components through the point. -/
def SNCAt {k : Type} [Field k] {M : Scheme} (s : M ⟶ Spec (.of k))
    (E : Fin m → M.IdealSheafData) (a : M) : Prop :=
  ∃ (n : ℕ) (V : Scheme) (j : V ⟶ M) (p : V ⟶ affine k n)
    (active : Finset (Fin m)) (index : {i // i ∈ active} → Fin n),
    IsOpenImmersion j ∧ Etale p ∧ j ≫ s = p ≫ affineToBase k n ∧
    a ∈ Set.range j ∧ Function.Injective index ∧
    (∀ i, i ∈ active ↔ a ∈ (E i).support) ∧
    (∀ i (hi : i ∈ active), (E i).comap j = (coordinateIdeal k n (index ⟨i, hi⟩)).comap p) ∧
    (∀ i, i ∉ active → (E i).comap j = ⊤)

/-- Labels are global smooth Cartier branches, not local branches of a nodal curve. -/
def SNCBoundary {k : Type} [Field k] {M : Scheme} (s : M ⟶ Spec (.of k))
    (E : Fin m → M.IdealSheafData) : Prop :=
  Smooth s ∧ QuasiCompact s ∧ (∀ a, SNCAt s E a) ∧
    (∀ i, Smooth ((E i).subschemeι ≫ s))

lemma sncBoundary_empty {k : Type} [Field k] {M : Scheme}
    (s : M ⟶ Spec (.of k)) [Smooth s] [QuasiCompact s] :
    SNCBoundary s (fun i : Fin 0 => Fin.elim0 i) := by sorry

lemma sncBoundary_restrict {k : Type} [Field k] {M V : Scheme}
    (s : M ⟶ Spec (.of k)) (E : Fin m → M.IdealSheafData)
    (j : V ⟶ M) [IsOpenImmersion j] [QuasiCompact (j ≫ s)]
    (h : SNCBoundary s E) : SNCBoundary (j ≫ s) (fun i => (E i).comap j) := by sorry

lemma sncBoundary_coordinate (k : Type) [Field k] (n : ℕ) :
    SNCBoundary (affineToBase k n) (coordinateIdeal k n) := by sorry

-- snc_coordinate_axes
example : SNCBoundary (affineToBase ℚ 2) (coordinateIdeal ℚ 2) := by sorry

/-- Native closed subscheme given by one polynomial equation. -/
def polynomialIdeal (k : Type) [Field k] (n : ℕ) (f : MvPolynomial (Fin n) k) :
    (affine k n).IdealSheafData :=
  (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk (Ideal.span ({f} : Set _))))).ker

-- snc_tangent_curves: the failure at the origin forces failure of global SNC.
example : ¬ SNCBoundary (affineToBase ℚ 2) (fun i : Fin 2 =>
    if i = 0 then polynomialIdeal ℚ 2 (MvPolynomial.X 1) else
      polynomialIdeal ℚ 2 (MvPolynomial.X 1 - MvPolynomial.X 0 ^ 2)) := by sorry
-- snc_self_intersection: one irreducible nodal component is not a smooth label.
example : ¬ SNCBoundary (affineToBase ℚ 2) (fun _ : Fin 1 =>
    polynomialIdeal ℚ 2 (MvPolynomial.X 1 ^ 2 -
      MvPolynomial.X 0 ^ 2 * (MvPolynomial.X 0 + 1))) := by sorry

/-- Marked ideals use genuine closed immersions and actual pulled-back boundary ideals. -/
structure MarkedIdeal {k : Type} [Field k] {M : Scheme}
    (s : M ⟶ Spec (.of k)) (E : Fin m → M.IdealSheafData) where
  ambientBoundary : SNCBoundary s E
  submanifold : Scheme
  inclusion : submanifold ⟶ M
  closed : IsClosedImmersion inclusion
  smooth : Smooth (inclusion ≫ s)
  quasiCompact : QuasiCompact (inclusion ≫ s)
  boundary : SNCBoundary (inclusion ≫ s) (fun i => (E i).comap inclusion)
  ideal : submanifold.IdealSheafData
  mark : ℕ
  positive : 0 < mark

def markedCosupport {k : Type} [Field k] {M : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData}
    (P : MarkedIdeal s E) : Set P.submanifold :=
  {a | (P.mark : ℕ∞) ≤ idealOrder (stalkIdeal P.ideal a)}

lemma markedIdeal_cosupport {k : Type} [Field k] {M : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData}
    (P : MarkedIdeal s E) (a : P.submanifold) :
    a ∈ markedCosupport P ↔ (P.mark : ℕ∞) ≤ idealOrder (stalkIdeal P.ideal a) := by sorry

-- mark_changes_cosupport
example : (2 : ℕ∞) ≤ formalIdealOrder
    (Ideal.span ({MvPowerSeries.X () ^ 2} : Set (MvPowerSeries Unit ℚ))) ∧
    ¬ (3 : ℕ∞) ≤ formalIdealOrder
    (Ideal.span ({MvPowerSeries.X () ^ 2} : Set (MvPowerSeries Unit ℚ))) := by sorry
-- marked_zero_and_unit
example {σ K : Type*} [Field K] (d : ℕ) (hd : 0 < d) :
    (d : ℕ∞) ≤ formalIdealOrder (⊥ : Ideal (MvPowerSeries σ K)) ∧
    ¬ (d : ℕ∞) ≤ formalIdealOrder (⊤ : Ideal (MvPowerSeries σ K)) := by sorry
-- weighted_common_mark
example : ((MvPowerSeries.X (0 : Fin 2) ^ 2) ^ 3 : MvPowerSeries (Fin 2) ℚ) =
      MvPowerSeries.X 0 ^ 6 ∧
    ((MvPowerSeries.X (1 : Fin 2) ^ 3) ^ 2 : MvPowerSeries (Fin 2) ℚ) =
      MvPowerSeries.X 1 ^ 6 := by sorry

/-! ## Local algebra of controlled, weak and strict transforms
The centre blowup and its charts are the StableReduction Layer 4 import.
Here `J` is the actual *total* ideal on one such chart, and `e` its exceptional equation. -/

def controlledTransform {R : Type*} [CommRing R] (J : Ideal R) (e : R) (d : ℕ) : Ideal R :=
  Submodule.colon J {e ^ d}

def weakTransform {R : Type*} [CommRing R] (J : Ideal R) (e : R) (r : ℕ) : Ideal R :=
  Submodule.colon J {e ^ r}

def strictTransform {R : Type*} [CommRing R] (J : Ideal R) (e : R) : Ideal R :=
  ⨆ r : ℕ, Submodule.colon J {e ^ r}

lemma controlledTransform_factor {R : Type*} [CommRing R] (J : Ideal R) (e : R)
    (d : ℕ) (he : IsRegular e) (hJ : J ≤ Ideal.span ({e ^ d} : Set R)) :
    J = Ideal.span ({e ^ d} : Set R) * controlledTransform J e d := by sorry

lemma controlledTransform_identityCartier {R : Type*} [CommRing R] (e : R)
    (r d : ℕ) (he : IsRegular e) (h : d ≤ r) :
    controlledTransform (Ideal.span ({e ^ r} : Set R)) e d =
      Ideal.span ({e ^ (r - d)} : Set R) := by sorry

-- cusp_controlled_chart
example : controlledTransform
    (Ideal.span ({MvPolynomial.X (0 : Fin 2) ^ 2 *
      (MvPolynomial.X 1 ^ 2 - MvPolynomial.X 0)} : Set (MvPolynomial (Fin 2) ℚ)))
    (MvPolynomial.X 0) 2 =
      Ideal.span ({MvPolynomial.X 1 ^ 2 - MvPolynomial.X 0} : Set _) := by sorry
-- different_from_strict
example : controlledTransform
      (Ideal.span ({MvPolynomial.X () ^ 3} : Set (MvPolynomial Unit ℚ)))
      (MvPolynomial.X ()) 2 = Ideal.span ({MvPolynomial.X ()} : Set _) ∧
    strictTransform (Ideal.span ({MvPolynomial.X () ^ 3} : Set (MvPolynomial Unit ℚ)))
      (MvPolynomial.X ()) = ⊤ := by sorry
-- cartier_identity_not_trivial
example : controlledTransform
    (Ideal.span ({MvPolynomial.X () ^ 3} : Set (MvPolynomial Unit ℚ)))
    (MvPolynomial.X ()) 2 ≠ Ideal.span ({MvPolynomial.X () ^ 3} : Set _) := by sorry

/-! ## Coefficients with their integral marks -/

/-- `none` is the contact coordinate; `some i` are the remaining coordinates. -/
def contactExponent {σ : Type*} [DecidableEq σ] (q : ℕ) (α : σ →₀ ℕ) : Option σ →₀ ℕ :=
  α.embDomain Function.Embedding.some + Finsupp.single none q

def contactCoefficient {σ K : Type*} [DecidableEq σ] [Field K]
    (f : MvPowerSeries (Option σ) K) (q : ℕ) : MvPowerSeries σ K :=
  fun α => MvPowerSeries.coeff (contactExponent q α) f

structure IntegralPresentation (σ K : Type*) [Field K] where
  count : ℕ
  function : Fin count → MvPowerSeries σ K
  mark : Fin count → ℕ
  positive : ∀ i, 0 < mark i

/-- Includes every q<d and includes zero coefficients. -/
def coefficientPresentation {σ K : Type*} [DecidableEq σ] [Field K]
    (P : IntegralPresentation (Option σ) K) :
    (Σ i : Fin P.count, Fin (P.mark i)) → MvPowerSeries σ K × ℕ :=
  fun ⟨i, q⟩ => (contactCoefficient (P.function i) q, P.mark i - q)

lemma coefficientPresentation_positive {σ K : Type*} [DecidableEq σ] [Finite σ]
    [Field K] (P : IntegralPresentation (Option σ) K)
    (i : Fin P.count) (q : Fin (P.mark i)) :
    0 < (coefficientPresentation P ⟨i, q⟩).2 := by sorry

-- cusp_coefficient_weights
example : contactCoefficient
      (MvPowerSeries.X (none : Option Unit) ^ 2 + MvPowerSeries.X (some ()) ^ 3 :
        MvPowerSeries (Option Unit) ℚ) 0 = MvPowerSeries.X () ^ 3 ∧
    contactCoefficient
      (MvPowerSeries.X (none : Option Unit) ^ 2 + MvPowerSeries.X (some ()) ^ 3 :
        MvPowerSeries (Option Unit) ℚ) 1 = 0 := by sorry
-- mixed_coefficient_weights
example : contactCoefficient
      (MvPowerSeries.X (none : Option (Fin 2)) ^ 3 +
        MvPowerSeries.X (some 0) ^ 4 * MvPowerSeries.X none + MvPowerSeries.X (some 1) ^ 5 :
        MvPowerSeries (Option (Fin 2)) ℚ) 1 = MvPowerSeries.X 0 ^ 4 ∧
    contactCoefficient
      (MvPowerSeries.X (none : Option (Fin 2)) ^ 3 +
        MvPowerSeries.X (some 0) ^ 4 * MvPowerSeries.X none + MvPowerSeries.X (some 1) ^ 5 :
        MvPowerSeries (Option (Fin 2)) ℚ) 0 = MvPowerSeries.X 1 ^ 5 := by sorry
-- contact_pure_power
example (d q : ℕ) (h : q < d) :
    contactCoefficient (MvPowerSeries.X (none : Option Unit) ^ d :
      MvPowerSeries (Option Unit) ℚ) q = 0 := by sorry

/-! ## Graded-lex diagrams and supported formal division -/

abbrev Exponent (n : ℕ) := Fin n →₀ ℕ

def degree {n : ℕ} (α : Exponent n) : ℕ := α.sum fun _ d => d

def gradedLexLT {n : ℕ} (α β : Exponent n) : Prop :=
  degree α < degree β ∨
    (degree α = degree β ∧ ∃ i, (∀ j, j < i → α j = β j) ∧ α i < β i)

def IsInitialExponent {n : ℕ} {K : Type*} [Field K]
    (f : MvPowerSeries (Fin n) K) (α : Exponent n) : Prop :=
  MvPowerSeries.coeff α f ≠ 0 ∧
    ∀ β, gradedLexLT β α → MvPowerSeries.coeff β f = 0

def initialDiagram {n : ℕ} {K : Type*} [Field K]
    (I : Ideal (MvPowerSeries (Fin n) K)) : Set (Exponent n) :=
  {α | ∃ f ∈ I, IsInitialExponent f α}

lemma initialDiagram_upward {n : ℕ} {K : Type*} [Field K]
    (I : Ideal (MvPowerSeries (Fin n) K)) (α β : Exponent n)
    (h : α ∈ initialDiagram I) : α + β ∈ initialDiagram I := by sorry

lemma initialDiagram_vertices {n : ℕ} {K : Type*} [Field K]
    (I : Ideal (MvPowerSeries (Fin n) K)) :
    ∃ V : Finset (Exponent n), initialDiagram I =
      {β | ∃ α ∈ V, ∀ i, α i ≤ β i} ∧
      ∀ α ∈ V, ¬ ∃ β ∈ initialDiagram I, β ≠ α ∧ ∀ i, β i ≤ α i := by sorry

lemma initialDiagram_monomial {n : ℕ} {K : Type*} [Field K]
    (α : Exponent n) :
    initialDiagram (Ideal.span ({MvPowerSeries.monomial α (1 : K)} : Set _)) =
      {β | ∀ i, α i ≤ β i} := by sorry

-- diagram_zero_and_unit
example {n : ℕ} {K : Type*} [Field K] :
    initialDiagram (⊥ : Ideal (MvPowerSeries (Fin n) K)) = ∅ ∧
    initialDiagram (⊤ : Ideal (MvPowerSeries (Fin n) K)) = Set.univ := by sorry
-- diagram_xy
example : initialDiagram (Ideal.span ({MvPowerSeries.X (0 : Fin 2),
    MvPowerSeries.X (1 : Fin 2)} : Set (MvPowerSeries (Fin 2) ℚ))) =
    {α | 0 < degree α} := by sorry
-- graded_lex_not_pure_lex
example : IsInitialExponent
    (MvPowerSeries.X (0 : Fin 2) + MvPowerSeries.X (1 : Fin 2) ^ 2 :
      MvPowerSeries (Fin 2) ℚ) (Finsupp.single 0 1) := by sorry

def seriesSupport {n : ℕ} {K : Type*} [Field K]
    (f : MvPowerSeries (Fin n) K) : Set (Exponent n) :=
  {α | MvPowerSeries.coeff α f ≠ 0}

def divisionRegion {n m : ℕ} (α : Fin m → Exponent n) (i : Fin m) : Set (Exponent n) :=
  {β | (∀ j, α i j ≤ β j) ∧ ∀ h : Fin m, h < i → ¬ ∀ j, α h j ≤ β j}

theorem formalDivision {n m : ℕ} {K : Type*} [Field K]
    (F : Fin m → MvPowerSeries (Fin n) K) (α : Fin m → Exponent n)
    (hF : ∀ i, IsInitialExponent (F i) (α i))
    (G : MvPowerSeries (Fin n) K) :
    ∃! qr : (Fin m → MvPowerSeries (Fin n) K) × MvPowerSeries (Fin n) K,
      G = (∑ i, qr.1 i * F i) + qr.2 ∧
      (∀ i β, β ∈ seriesSupport (qr.1 i) → α i + β ∈ divisionRegion α i) ∧
      (∀ β, β ∈ seriesSupport qr.2 → ∀ i, β ∉ divisionRegion α i) := by sorry

/-! ## Hilbert–Samuel lengths over the local ring -/

def formalMaximalIdeal (n : ℕ) (K : Type*) [Field K] : Ideal (MvPowerSeries (Fin n) K) :=
  Ideal.span (Set.range MvPowerSeries.X)

/-- This is local module length, not dimension over a ground field. -/
def hilbertSamuel {n : ℕ} {K : Type*} [Field K]
    (I : Ideal (MvPowerSeries (Fin n) K)) (r : ℕ) : ℕ∞ :=
  Module.length (MvPowerSeries (Fin n) K)
    (MvPowerSeries (Fin n) K ⧸ (I + formalMaximalIdeal n K ^ (r + 1)))

lemma hilbertSamuel_diagram {n : ℕ} {K : Type*} [Field K]
    (I : Ideal (MvPowerSeries (Fin n) K)) (r : ℕ) :
    hilbertSamuel I r =
      (Nat.card {α : Exponent n // degree α ≤ r ∧ α ∉ initialDiagram I} : ℕ∞) := by sorry

lemma hilbertSamuel_order {n : ℕ} {K : Type*} [Field K]
    (I : Ideal (MvPowerSeries (Fin n) K)) (d : ℕ) :
    (d : ℕ∞) ≤ formalIdealOrder I ↔
      ∀ r < d, hilbertSamuel I r = hilbertSamuel (⊥ : Ideal (MvPowerSeries (Fin n) K)) r := by sorry

-- hilbertSamuel_smooth
example (n r : ℕ) : hilbertSamuel (⊥ : Ideal (MvPowerSeries (Fin n) ℚ)) r =
    (Nat.choose (n + r) n : ℕ∞) := by sorry
-- hilbertSamuel_double_point
example (r : ℕ) : hilbertSamuel
    (Ideal.span ({MvPowerSeries.X (0 : Fin 1) ^ 2} : Set (MvPowerSeries (Fin 1) ℚ))) r =
    (min (r + 1) 2 : ℕ∞) := by sorry
-- hilbertSamuel_nonrational_point: every coefficient field gives local length one.
example {K : Type*} [Field K] : hilbertSamuel
    (formalMaximalIdeal 1 K) 0 = 1 := by sorry

theorem hilbertSamuelStabilization {n : ℕ} {K : Type*} [Field K]
    (I : ℕ → Ideal (MvPowerSeries (Fin n) K))
    (h : ∀ j r, hilbertSamuel (I (j + 1)) r ≤ hilbertSamuel (I j) r) :
    ∃ j, ∀ l, j ≤ l → hilbertSamuel (I l) = hilbertSamuel (I j) := by sorry

/-! ## Rational residual presentations: the monomial guard is retained -/

def residualPresentation {σ K : Type*} [Field K]
    (g : List (MvPowerSeries σ K)) (M : MvPowerSeries σ K)
    (d : ℕ) (ν : WithTop ℚ) : List (MvPowerSeries σ K × ℚ) :=
  if ν = ⊤ then [] else
    let v := ν.untopD 0
    if v = 0 then [(M, d)] else
      g.map (fun f => (f, (d : ℚ) * v)) ++
        if v < 1 then [(M, (d : ℚ) * (1 - v))] else []

def listNormalizedOrder {σ K : Type*} [Field K]
    (L : List (MvPowerSeries σ K × ℚ)) : WithTop ℚ :=
  L.foldr (fun p q => min (normalizedSeriesOrder p.1 p.2) q) ⊤

lemma residualPresentation_normalized {σ K : Type*} [Finite σ] [Field K]
    (g : List (MvPowerSeries σ K)) (M : MvPowerSeries σ K) (d : ℕ) (ν μ : ℚ)
    (hd : 0 < d) (hν : 0 < ν) (hμ : 1 ≤ μ)
    (hf : listNormalizedOrder (g.map (fun f => (M * f, (d : ℚ)))) = μ)
    (hM : normalizedSeriesOrder M d = ((μ - ν : ℚ) : WithTop ℚ)) :
    listNormalizedOrder (residualPresentation g M d ν) = 1 := by sorry

-- residual_requires_guard
example : residualPresentation
    [MvPowerSeries.X (0 : Fin 2) + MvPowerSeries.X 1]
    (MvPowerSeries.X 0 ^ 2 : MvPowerSeries (Fin 2) ℚ) 3 (1 / 3 : ℚ) =
    [(MvPowerSeries.X 0 + MvPowerSeries.X 1, 1), (MvPowerSeries.X 0 ^ 2, 2)] := by sorry
-- residual_monomial_terminal
example : residualPresentation []
    (MvPowerSeries.X (0 : Fin 2) ^ 2 * MvPowerSeries.X 1 ^ 3 :
      MvPowerSeries (Fin 2) ℚ) 2 (0 : ℚ) =
    [(MvPowerSeries.X 0 ^ 2 * MvPowerSeries.X 1 ^ 3, 2)] := by sorry
-- residual_no_guard_above_one
example : residualPresentation [MvPowerSeries.X (1 : Fin 2) ^ 3]
    (MvPowerSeries.X 0 ^ 2 : MvPowerSeries (Fin 2) ℚ) 2 (3 / 2 : ℚ) =
    [(MvPowerSeries.X 1 ^ 3, 3)] := by sorry

/-! ## History from the first year a prefix attained its value -/

structure ExceptionalHistory (α : Type*) where
  year : ℕ
  depth : ℕ
  labels : ℕ
  birth : Fin labels → ℕ
  surviving : Finset (Fin labels)
  born : ∀ i ∈ surviving, birth i ≤ year
  prefixValue : Fin depth → Fin (year + 1) → α
  coherent : ∀ r q, q ≤ r → ∀ i j, prefixValue r i = prefixValue r j → prefixValue q i = prefixValue q j

def firstAttainment {α : Type*} (H : ExceptionalHistory α) (r : Fin H.depth) : ℕ := by
  classical
  exact Nat.find (show ∃ i : ℕ, ∃ h : i < H.year + 1,
    H.prefixValue r ⟨i, h⟩ = H.prefixValue r ⟨H.year, Nat.lt_succ_self H.year⟩ from
      ⟨H.year, Nat.lt_succ_self H.year, rfl⟩)

def exceptionalHistoryBlock {α : Type*} (H : ExceptionalHistory α)
    (r : Fin H.depth) : Finset (Fin H.labels) :=
  H.surviving.filter fun i => H.birth i ≤ firstAttainment H r ∧
    ∀ q : Fin H.depth, q < r → firstAttainment H q < H.birth i

lemma exceptionalHistory_disjoint {α : Type*} (H : ExceptionalHistory α)
    (r q : Fin H.depth) (h : r ≠ q) :
    Disjoint (exceptionalHistoryBlock H r) (exceptionalHistoryBlock H q) := by sorry

lemma exceptionalHistory_birth {α : Type*} (H : ExceptionalHistory α)
    (r : Fin H.depth) (i : Fin H.labels) (h : i ∈ exceptionalHistoryBlock H r) :
    H.birth i ≤ firstAttainment H r := by sorry

-- history_year_zero
example {α : Type*} (H : ExceptionalHistory α) (h : H.surviving = ∅)
    (r : Fin H.depth) : exceptionalHistoryBlock H r = ∅ := by sorry
-- history_new_exceptional
example {α : Type*} (H : ExceptionalHistory α) (r : Fin H.depth) (i : Fin H.labels)
    (hr : firstAttainment H r = 0) (hi : H.birth i = 1) :
    i ∉ exceptionalHistoryBlock H r := by sorry

/-! ## Complete words: Hilbert–Samuel entry, counters and terminal branch -/

inductive TerminalResidual where
  | zero
  | infinity
  deriving DecidableEq

def TerminalResidual.value : TerminalResidual → WithTop ℚ
  | .zero => 0
  | .infinity => ⊤

structure InvariantWord where
  first : ℕ → ℕ∞
  firstCounter : ℕ
  residual : List (ℚ × ℕ)
  positive : ∀ p ∈ residual, 0 < p.1
  terminal : TerminalResidual

/-- These two necessary conditions alone do not certify a realized invariant. -/
def InvariantWord.FirstAndDepth (w : InvariantWord) (n : ℕ) (K : Type*) [Field K] : Prop :=
  (∃ I : Ideal (MvPowerSeries (Fin n) K), w.first = hilbertSamuel I) ∧
    w.residual.length ≤ n

/-- The recursive denominator certificate, with the initial bound supplied by the
Hilbert–Samuel presentation. It is additional data, not a property of arbitrary
positive rational words. -/
structure InvariantWord.DenominatorCertificate (w : InvariantWord) (initialBound : ℕ) where
  bound : Fin (w.residual.length + 1) → ℕ
  first_bound : bound 0 = initialBound
  numerator : Fin w.residual.length → ℕ
  integral : ∀ i : Fin w.residual.length,
    ((bound i.castSucc).factorial : ℚ) * (w.residual[i.val]'i.isLt).1 = numerator i
  next_bound : ∀ i : Fin w.residual.length,
    bound i.succ = max (bound i.castSucc).factorial (numerator i)

def InvariantWord.tail (w : InvariantWord) : List (WithTop ℚ × ℕ) :=
  (0, w.firstCounter) ::
    (w.residual.map fun p => ((p.1 : WithTop ℚ), p.2)) ++ [(w.terminal.value, 0)]

def rationalCounterLT (p q : WithTop ℚ × ℕ) : Prop :=
  p.1 < q.1 ∨ (p.1 = q.1 ∧ p.2 < q.2)

def invariantWordLT (w v : InvariantWord) : Prop :=
  ((∀ r, w.first r ≤ v.first r) ∧ w.first ≠ v.first) ∨
    (w.first = v.first ∧ List.Lex rationalCounterLT w.tail v.tail)

lemma invariantWord_prefix (w : InvariantWord) (i j : ℕ) (h : j ≤ i) :
    (w.tail.take i).take j = w.tail.take j := by sorry

lemma invariantWord_compare (w v : InvariantWord) :
    invariantWordLT w v ↔
      ((∀ r, w.first r ≤ v.first r) ∧ w.first ≠ v.first) ∨
        (w.first = v.first ∧ List.Lex rationalCounterLT w.tail v.tail) := by sorry

lemma invariantWord_terminal (w : InvariantWord) :
    TerminalResidual.zero.value < TerminalResidual.infinity.value ∧
    (w.terminal.value = 0 ↔ w.terminal = .zero) ∧
    (w.terminal.value = ⊤ ↔ w.terminal = .infinity) := by sorry

private def testWord (a : ℚ) (s : ℕ) (ha : 0 < a)
    (t : TerminalResidual := .infinity) : InvariantWord where
  first r := min (r + 1) 2
  firstCounter := 0
  residual := [(a, s), (1, 0)]
  positive := by sorry
  terminal := t

-- word_multiplicity_tie
example : invariantWordLT (testWord (3/2) 1 (by norm_num))
    (testWord (5/2) 0 (by norm_num)) := by sorry
-- word_history_tie
example : invariantWordLT (testWord (3/2) 0 (by norm_num))
    (testWord (3/2) 1 (by norm_num)) := by sorry
-- word_terminal_zero_infinity
example : invariantWordLT (testWord (3/2) 0 (by norm_num) .zero)
    (testWord (3/2) 0 (by norm_num) .infinity) := by sorry

/-! ## The terminal monomial problem -/

structure MonomialData (m : ℕ) where
  weight : Fin m → ℚ
  nonnegative : ∀ i, 0 ≤ weight i

def monomialMass {m : ℕ} (Ω : MonomialData m) (I : Finset (Fin m)) : ℚ :=
  ∑ i ∈ I, Ω.weight i

def MinimalMonomialCentre {m : ℕ} (Ω : MonomialData m) (I : Finset (Fin m)) : Prop :=
  1 ≤ monomialMass Ω I ∧ ∀ i ∈ I, monomialMass Ω (I.erase i) < 1

/-- `none` is the new exceptional component; the pivot strict transform misses this chart. -/
def monomialWeightTransform {m : ℕ} (Ω : MonomialData m)
    (I : Finset (Fin m)) (pivot : Fin m) : Option (Fin m) → ℚ
  | none => monomialMass Ω I - 1
  | some i => if i = pivot then 0 else Ω.weight i

lemma monomialCentre_minimal {m : ℕ} (Ω : MonomialData m) (I : Finset (Fin m)) :
    MinimalMonomialCentre Ω I ↔
      1 ≤ monomialMass Ω I ∧ ∀ i ∈ I, monomialMass Ω I - 1 < Ω.weight i := by sorry

lemma monomialWeight_transform {m : ℕ} (Ω : MonomialData m)
    (I : Finset (Fin m)) (pivot : Fin m) :
    monomialWeightTransform Ω I pivot none = monomialMass Ω I - 1 ∧
    monomialWeightTransform Ω I pivot (some pivot) = 0 := by sorry

lemma monomialMass_denominator {m : ℕ} (Ω : MonomialData m) (I : Finset (Fin m))
    (pivot : Fin m) (d : ℕ) (h : ∀ i, ∃ a : ℕ, (d : ℚ) * Ω.weight i = a)
    (hI : MinimalMonomialCentre Ω I) :
    ∀ i, ∃ a : ℕ, (d : ℚ) * monomialWeightTransform Ω I pivot i = a := by sorry

theorem monomialDecrease {m : ℕ} (Ω : MonomialData m) (I : Finset (Fin m))
    (pivot : Fin m) (hp : pivot ∈ I) (hI : MinimalMonomialCentre Ω I) :
    (∑ i : Option (Fin m), monomialWeightTransform Ω I pivot i) <
      monomialMass Ω Finset.univ := by sorry

private def halfWeights : MonomialData 2 := ⟨fun _ => 1/2, by intro i; norm_num⟩
private def largeWeight : MonomialData 1 := ⟨fun _ => 3/2, by intro i; norm_num⟩
private def unitWeights : MonomialData 2 := ⟨fun _ => 1, by intro i; norm_num⟩

-- monomial_two_axes
example : MinimalMonomialCentre halfWeights {0, 1} ∧
    monomialWeightTransform halfWeights {0, 1} 0 none = 0 := by sorry
-- monomial_single_axis
example : MinimalMonomialCentre largeWeight {0} ∧
    monomialWeightTransform largeWeight {0} 0 none = 1/2 := by sorry
-- monomial_nonminimal
example : ¬ MinimalMonomialCentre unitWeights {0, 1} := by sorry

/-! ## Native chart algebra for Cartier separation on unrestricted rings -/

structure CartierSeparationChart (R : Type*) [CommRing R] where
  x : R
  y : R
  exceptional : R
  residual₁ : R
  residual₂ : R
  x_regular : IsRegular x
  y_regular : IsRegular y
  factor₁ : x = exceptional * residual₁
  factor₂ : y = exceptional * residual₂
  generate : Ideal.span ({residual₁, residual₂} : Set R) = ⊤

lemma cartierSeparation_regular {R : Type*} [CommRing R] (C : CartierSeparationChart R) :
    IsRegular C.exceptional ∧ IsRegular C.residual₁ ∧ IsRegular C.residual₂ := by sorry

lemma cartierSeparation_residual {R : Type*} [CommRing R] (C : CartierSeparationChart R) :
    Ideal.span ({C.x} : Set R) =
      Ideal.span ({C.exceptional} : Set R) * Ideal.span ({C.residual₁} : Set R) ∧
    Ideal.span ({C.y} : Set R) =
      Ideal.span ({C.exceptional} : Set R) * Ideal.span ({C.residual₂} : Set R) := by sorry

lemma cartierSeparation_disjoint {R : Type*} [CommRing R] (C : CartierSeparationChart R) :
    Ideal.span ({C.residual₁} : Set R) + Ideal.span ({C.residual₂} : Set R) = ⊤ := by sorry

lemma cartierSeparation_difference {R : Type*} [CommRing R] (C : CartierSeparationChart R) :
    C.x * C.residual₂ = C.y * C.residual₁ := by sorry

-- separate_coordinate_axes: in each ordinary blowup chart one residual is a unit.
example : Ideal.span ({(1 : MvPolynomial (Fin 2) ℚ), MvPolynomial.X 1} : Set _) = ⊤ ∧
    Ideal.span ({MvPolynomial.X (0 : Fin 2), (1 : MvPolynomial (Fin 2) ℚ)} : Set _) = ⊤ := by sorry
-- separate_equal_divisors: the equal-divisor identity chart has both residuals one.
example {R : Type*} [CommRing R] (e : R) :
    e = e * 1 ∧ Ideal.span ({(1 : R), 1} : Set R) = ⊤ := by sorry
-- separate_unequal_multiplicities: e=t², residuals 1,t, and the additive divisor identity.
example : (MvPolynomial.X () ^ 2 * MvPolynomial.X () : MvPolynomial Unit ℚ) =
      MvPolynomial.X () ^ 3 * 1 ∧
    Ideal.span ({(1 : MvPolynomial Unit ℚ), MvPolynomial.X ()} : Set _) = ⊤ := by sorry

/-! ## Maximal-contact and coefficient order signatures -/

def maximalContactDerivative {σ K : Type*} [Field K]
    (f : MvPowerSeries (Option σ) K) (d : ℕ) : MvPowerSeries (Option σ) K :=
  (MvPowerSeries.pderiv K none)^[d - 1] f

theorem maximalContact {σ K : Type*} [Finite σ] [Field K] [CharZero K]
    (f : MvPowerSeries (Option σ) K) (d : ℕ) (hd : 0 < d)
    (ho : MvPowerSeries.order f = d)
    (hu : MvPowerSeries.constantCoeff ((MvPowerSeries.pderiv K none)^[d] f) ≠ 0) :
    MvPowerSeries.order (maximalContactDerivative f d) = 1 ∧
    MvPowerSeries.constantCoeff
      (MvPowerSeries.pderiv K none (maximalContactDerivative f d)) ≠ 0 := by sorry

lemma coefficientPresentation_cosupport {σ K : Type*} [DecidableEq σ] [Finite σ] [Field K]
    (P : IntegralPresentation (Option σ) K) :
    (∀ i, (P.mark i : ℕ∞) ≤ MvPowerSeries.order (P.function i)) ↔
      ∀ i (q : Fin (P.mark i)), ((P.mark i - q : ℕ) : ℕ∞) ≤
        MvPowerSeries.order (contactCoefficient (P.function i) q) := by sorry

lemma coefficientPresentation_commonMark {σ K : Type*} [DecidableEq σ] [Finite σ] [Field K]
    (P : IntegralPresentation (Option σ) K) (D : ℕ) (hD : 0 < D)
    (exponent : (Σ i : Fin P.count, Fin (P.mark i)) → ℕ)
    (he : ∀ iq, exponent iq * (coefficientPresentation P iq).2 = D) :
    (D : ℕ∞) ≤ formalIdealOrder (Ideal.span (Set.range fun iq =>
      (coefficientPresentation P iq).1 ^ exponent iq)) ↔
      ∀ i (q : Fin (P.mark i)), ((P.mark i - q : ℕ) : ℕ∞) ≤
        MvPowerSeries.order (contactCoefficient (P.function i) q) := by sorry

/-! ## Full formal Samuel certificates, rather than only a generating set

The coordinate permutation is absorbed into the actual essential-index sets.
Conditions (1)–(5) of BM1997 (7.2) appear as concrete support, derivative and
matrix conditions. The diagram has ordered finite vertices. -/

def partialDerivative {n : ℕ} {K : Type*} [Field K]
    (f : MvPowerSeries (Fin n) K) (α : Exponent n) : MvPowerSeries (Fin n) K :=
  (Finset.univ.toList.foldl (fun g i => (MvPowerSeries.pderiv K i)^[α i] g) f)

def homogeneousPart {n : ℕ} {K : Type*} [Field K]
    (f : MvPowerSeries (Fin n) K) (d : ℕ) : MvPowerSeries (Fin n) K :=
  fun α => if degree α = d then MvPowerSeries.coeff α f else 0

def Homogeneous {n : ℕ} {K : Type*} [Field K]
    (f : MvPowerSeries (Fin n) K) (d : ℕ) : Prop :=
  ∀ α ∈ seriesSupport f, degree α = d

def truncatedDiagram {n m : ℕ} (α : Fin m → Exponent n) (k : ℕ) : Set (Exponent n) :=
  {β | ∃ i, degree (α i) ≤ k ∧ ∀ j, α i j ≤ β j}

def essentialIndices {n m : ℕ} (α : Fin m → Exponent n) (k : ℕ) : Finset (Fin n) :=
  Finset.univ.filter fun j => ∃ i, degree (α i) ≤ k ∧ 0 < α i j

def essentialIdeal {n m : ℕ} {K : Type*} [Field K]
    (α : Fin m → Exponent n) (k : ℕ) : Ideal (MvPowerSeries (Fin n) K) :=
  Ideal.span {f | ∃ j ∈ essentialIndices α k, f = MvPowerSeries.X j}

/-- Finite-degree supported division includes uniqueness and the remainder region. -/
def HomogeneousDivision {n m : ℕ} {K : Type*} [Field K]
    (α : Fin m → Exponent n) (F : Fin m → MvPowerSeries (Fin n) K)
    (k d : ℕ) : Prop :=
  ∀ G, Homogeneous G d →
    ∃! qr : (Fin m → MvPowerSeries (Fin n) K) × MvPowerSeries (Fin n) K,
      G = (∑ i, qr.1 i * F i) + qr.2 ∧
      (∀ i, degree (α i) > k → qr.1 i = 0) ∧
      (∀ i β, β ∈ seriesSupport (qr.1 i) →
        degree β + degree (α i) = d ∧ α i + β ∈ divisionRegion α i) ∧
      Homogeneous qr.2 d ∧
      (∀ β ∈ seriesSupport qr.2, β ∉ truncatedDiagram α k)

/-- Monotonicity moves the entire exponent of a variable to a later variable. -/
def MonotoneDiagram {n m : ℕ} (α : Fin m → Exponent n) (k : ℕ) : Prop :=
  ∀ β ∈ truncatedDiagram α k, ∀ i j : Fin n, i < j →
    β - Finsupp.single i (β i) + Finsupp.single j (β i) ∈ truncatedDiagram α k

structure SamuelCertificate {n : ℕ} {K : Type*} [Field K]
    (I : Ideal (MvPowerSeries (Fin n) K)) where
  count : ℕ
  vertex : Fin count → Exponent n
  ordered : ∀ i j, i < j → gradedLexLT (vertex i) (vertex j)
  minimal : ∀ i j, (∀ t, vertex i t ≤ vertex j t) → i = j
  generator : Fin count → MvPowerSeries (Fin n) K
  mem_ideal : ∀ i, generator i ∈ I
  order_eq : ∀ i, MvPowerSeries.order (generator i) = degree (vertex i)
  cutoff : ℕ
  cutoff_bound : ∀ i, degree (vertex i) - 1 ≤ cutoff
  initial_division : ∀ k d, HomogeneousDivision vertex
    (fun i => homogeneousPart (generator i) (degree (vertex i))) k d
  supported_division : ∀ f ∈ I, ∃ q : Fin count → MvPowerSeries (Fin n) K,
    f = ∑ i, q i * generator i ∧
    ∀ i β, β ∈ seriesSupport (q i) → vertex i + β ∈ divisionRegion vertex i
  essentialGenerator : {j : Fin n // ∃ i, 0 < vertex i j} → Fin count
  essentialPositive : ∀ j, 0 < vertex (essentialGenerator j) j
  essentialEarly : ∀ j k, j.val ∈ essentialIndices vertex k →
    degree (vertex (essentialGenerator j)) ≤ k
  derivative_vanish : ∀ k i β, k < degree (vertex i) → degree β ≤ cutoff →
    (∀ j, j ∉ essentialIndices vertex k → β j = 0) →
    β ∈ truncatedDiagram vertex k → partialDerivative (generator i) β ∈ essentialIdeal vertex k
  derivative_in_ideal : ∀ k (j : {j : Fin n // j ∈ essentialIndices vertex k}),
    partialDerivative (generator (essentialGenerator
      ⟨j.val, by obtain ⟨i, _hi, hp⟩ := Finset.mem_filter.mp j.property |>.2; exact ⟨i, hp⟩⟩))
      (vertex (essentialGenerator
        ⟨j.val, by obtain ⟨i, _hi, hp⟩ := Finset.mem_filter.mp j.property |>.2; exact ⟨i, hp⟩⟩) -
          Finsupp.single j.val 1) ∈ essentialIdeal vertex k
  jacobian_unit : ∀ k,
    Matrix.det (fun (a b : {j : Fin n // j ∈ essentialIndices vertex k}) =>
      MvPowerSeries.constantCoeff (MvPowerSeries.pderiv K a.val
        (partialDerivative (generator (essentialGenerator
          ⟨b.val, by obtain ⟨i, _hi, hp⟩ := Finset.mem_filter.mp b.property |>.2; exact ⟨i, hp⟩⟩))
          (vertex (essentialGenerator
            ⟨b.val, by obtain ⟨i, _hi, hp⟩ := Finset.mem_filter.mp b.property |>.2; exact ⟨i, hp⟩⟩) -
            Finsupp.single b.val 1)))) ≠ 0

lemma samuelCertificate_generates {n : ℕ} {K : Type*} [Field K]
    {I : Ideal (MvPowerSeries (Fin n) K)} (C : SamuelCertificate I) :
    Ideal.span (Set.range C.generator) = I := by sorry

lemma samuelCertificate_hilbert {n : ℕ} {K : Type*} [Field K]
    {I : Ideal (MvPowerSeries (Fin n) K)} (C : SamuelCertificate I) (r : ℕ) :
    hilbertSamuel I r = (Nat.card {α : Exponent n // degree α ≤ r ∧
      α ∉ truncatedDiagram C.vertex (Finset.univ.sup fun i => degree (C.vertex i))} : ℕ∞) := by sorry

/-- A finite bound for each monotone diagram's supported homogeneous division checks. -/
lemma samuelCertificate_finiteCheck {n m : ℕ} {K : Type*} [Field K]
    (α : Fin m → Exponent n) (k : ℕ) (hM : MonotoneDiagram α k)
    (hO : ∀ i j, i < j → gradedLexLT (α i) (α j)) :
    ∃ D : ℕ, ∀ F : Fin m → MvPowerSeries (Fin n) K,
      (∀ i, Homogeneous (F i) (degree (α i))) →
      (∀ d ≤ D, HomogeneousDivision α F k d) →
      ∀ d, HomogeneousDivision α F k d := by sorry

-- certificate_coordinate_ideal
example : ∃ C : SamuelCertificate
    (Ideal.span ({MvPowerSeries.X (0 : Fin 2), MvPowerSeries.X 1} :
      Set (MvPowerSeries (Fin 2) ℚ))), C.count = 2 ∧
      ∀ i, MvPowerSeries.order (C.generator i) = 1 := by sorry
-- certificate_pure_power
example : ∃ C : SamuelCertificate
    (Ideal.span ({MvPowerSeries.X (0 : Fin 1) ^ 2} : Set (MvPowerSeries (Fin 1) ℚ))),
    C.count = 1 ∧
      ∀ i, C.generator i = MvPowerSeries.X 0 ^ 2 := by sorry
-- certificate_wrong_order
example : ¬ ∃ C : SamuelCertificate
    (Ideal.span ({MvPowerSeries.X (0 : Fin 1) ^ 2} : Set (MvPowerSeries (Fin 1) ℚ))),
    C.count = 1 ∧ (∀ i, C.generator i = MvPowerSeries.X 0 ^ 2) ∧
      (∀ i, C.vertex i = Finsupp.single 0 1) := by sorry

/-! ## Native jet matrices and determinantal Samuel ideals -/

abbrev JetIndex (n k : ℕ) := {α : Exponent n // degree α ≤ k}

instance (n k : ℕ) : Finite (JetIndex n k) := by sorry
instance (n k : ℕ) : Fintype (JetIndex n k) := Fintype.ofFinite _

def normalizedDerivative {n : ℕ} {K : Type*} [Field K]
    (f : MvPowerSeries (Fin n) K) (α : Exponent n) : MvPowerSeries (Fin n) K :=
  MvPowerSeries.C (∏ j, ((α j).factorial : K))⁻¹ * partialDerivative f α

def samuelJetMatrix {n m : ℕ} {K : Type*} [Field K]
    (f : Fin m → MvPowerSeries (Fin n) K) (k : ℕ) :
    Matrix (JetIndex n k) (Fin m × JetIndex n k) (MvPowerSeries (Fin n) K) :=
  fun α p => if ∀ j, p.2.val j ≤ α.val j then
    normalizedDerivative (f p.1) (α.val - p.2.val) else 0

def matrixMinorIdeal {a b : Type*} [Fintype a] [Fintype b]
    {R : Type*} [CommRing R] (B : Matrix a b R) (r : ℕ) : Ideal R :=
  Ideal.span (Set.range fun p : (Fin r → a) × (Fin r → b) =>
    Matrix.det (B.submatrix p.1 p.2))

def jetRank {n m : ℕ} {K : Type*} [Field K]
    (f : Fin m → MvPowerSeries (Fin n) K) (k : ℕ) : ℕ :=
  Matrix.rank ((samuelJetMatrix f k).map MvPowerSeries.constantCoeff)

def samuelJetIdeal {n m : ℕ} {K : Type*} [Field K]
    (f : Fin m → MvPowerSeries (Fin n) K) (k : ℕ) : Ideal (MvPowerSeries (Fin n) K) :=
  ⨆ j : Fin (k + 1), matrixMinorIdeal (samuelJetMatrix f j) (jetRank f j + 1)

lemma samuelJetIdeal_vanishing {n m : ℕ} {K L : Type*} [Field K] [CharZero K] [Field L]
    (f : Fin m → MvPowerSeries (Fin n) K) (k : ℕ) (φ : MvPowerSeries (Fin n) K →+* L) :
    Ideal.map φ (samuelJetIdeal f k) = ⊥ ↔
      ∀ j : Fin (k + 1), Matrix.rank ((samuelJetMatrix f j).map φ) ≤ jetRank f j := by sorry

lemma samuelJetIdeal_generatorIndependent {n m l : ℕ} {K : Type*} [Field K] [CharZero K]
    (f : Fin m → MvPowerSeries (Fin n) K) (g : Fin l → MvPowerSeries (Fin n) K)
    (h : Ideal.span (Set.range f) = Ideal.span (Set.range g)) (k : ℕ) :
    samuelJetIdeal f k = samuelJetIdeal g k := by sorry

lemma samuelJetIdeal_monotone {n m : ℕ} {K : Type*} [Field K]
    (f : Fin m → MvPowerSeries (Fin n) K) (k : ℕ) :
    samuelJetIdeal f k ≤ samuelJetIdeal f (k + 1) := by sorry

-- jet_zero_ideal
example (n k : ℕ) : samuelJetIdeal
    (fun i : Fin 0 => Fin.elim0 i : Fin 0 → MvPowerSeries (Fin n) ℚ) k = ⊥ := by sorry
-- jet_unit_ideal
example (n k : ℕ) : samuelJetIdeal (fun _ : Fin 1 => (1 : MvPowerSeries (Fin n) ℚ)) k = ⊥ := by sorry
-- jet_double_origin
example : samuelJetIdeal (fun _ : Fin 1 => (MvPowerSeries.X (0 : Fin 1) ^ 2 :
    MvPowerSeries (Fin 1) ℚ)) 1 = Ideal.span ({MvPowerSeries.X 0} : Set _) := by sorry

/-! ## Permissible centres share one chart with the boundary -/

def SimultaneousCentreAt {k : Type} [Field k] {M : Scheme}
    (s : M ⟶ Spec (.of k)) (E : Fin m → M.IdealSheafData)
    (C : M.IdealSheafData) (a : M) : Prop :=
  ∃ (n : ℕ) (V : Scheme) (j : V ⟶ M) (p : V ⟶ affine k n)
    (active : Finset (Fin m)) (index : {i // i ∈ active} → Fin n)
    (centreIndices : Finset (Fin n)),
    IsOpenImmersion j ∧ Etale p ∧ j ≫ s = p ≫ affineToBase k n ∧
    a ∈ Set.range j ∧ Function.Injective index ∧
    (∀ i, i ∈ active ↔ a ∈ (E i).support) ∧
    (∀ i (hi : i ∈ active), (E i).comap j = (coordinateIdeal k n (index ⟨i, hi⟩)).comap p) ∧
    (∀ i, i ∉ active → (E i).comap j = ⊤) ∧
    C.comap j = (centreIndices.sup (coordinateIdeal k n)).comap p

def PermissibleCentre {k : Type} [Field k] {M C : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData}
    (P : MarkedIdeal s E) (i : C ⟶ P.submanifold) : Prop :=
  IsClosedImmersion i ∧ Smooth (i ≫ P.inclusion ≫ s) ∧
    QuasiCompact (i ≫ P.inclusion ≫ s) ∧
    Set.range i ⊆ markedCosupport P ∧ P.ideal ≤ i.ker ^ P.mark ∧
    ∀ a ∈ Set.range i, SimultaneousCentreAt (P.inclusion ≫ s)
      (fun j => (E j).comap P.inclusion) i.ker a

lemma permissibleCentre_idealPower {k : Type} [Field k] {M C : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData}
    (P : MarkedIdeal s E) (i : C ⟶ P.submanifold) (h : PermissibleCentre P i) :
    P.ideal ≤ i.ker ^ P.mark := by sorry

/-- An actual marked ideal on affine space; the identity closed embedding is retained. -/
def affineMarked {k : Type} [Field k] {n m : ℕ}
    (I : (affine k n).IdealSheafData) (d : ℕ) (hd : 0 < d)
    (E : Fin m → (affine k n).IdealSheafData)
    (hE : SNCBoundary (affineToBase k n) E) : MarkedIdeal (affineToBase k n) E where
  ambientBoundary := hE
  submanifold := affine k n
  inclusion := 𝟙 _
  closed := by infer_instance
  smooth := by sorry
  quasiCompact := by sorry
  boundary := by sorry
  ideal := I
  mark := d
  positive := hd

def coordinateCentreIdeal (k : Type) [Field k] (n : ℕ) (J : Finset (Fin n)) :
    (affine k n).IdealSheafData := J.sup (coordinateIdeal k n)

lemma permissibleCentre_boundaryContained (k : Type) [Field k] (n d : ℕ)
    (hd : 0 < d) (J : Finset (Fin n)) (I : (affine k n).IdealSheafData)
    (hI : I ≤ coordinateCentreIdeal k n J ^ d) :
    PermissibleCentre
      (affineMarked I d hd (coordinateIdeal k n) (sncBoundary_coordinate k n))
      (coordinateCentreIdeal k n J).subschemeι := by sorry

-- centre_contained_in_boundary
example : PermissibleCentre
    (affineMarked (coordinateIdeal ℚ 2 0 ^ 2 ⊔ coordinateIdeal ℚ 2 1 ^ 2)
      2 (by norm_num) (coordinateIdeal ℚ 2) (sncBoundary_coordinate ℚ 2))
    (coordinateCentreIdeal ℚ 2 {0, 1}).subschemeι := by sorry
-- centre_outside_cosupport
example : ¬ PermissibleCentre
    (affineMarked (coordinateIdeal ℚ 2 0) 2 (by norm_num)
      (coordinateIdeal ℚ 2) (sncBoundary_coordinate ℚ 2))
    (coordinateCentreIdeal ℚ 2 {0, 1}).subschemeι := by sorry

private def parabola : affine ℚ 1 ⟶ affine ℚ 2 :=
  Spec.map (CommRingCat.ofHom (MvPolynomial.eval₂Hom MvPolynomial.C
    (fun i : Fin 2 => if i = 0 then MvPolynomial.X (0 : Fin 1) else MvPolynomial.X 0 ^ 2)))

-- centre_tangent_to_boundary; the smooth parabola is tangent to y=0 at the origin.
example : ¬ PermissibleCentre
    (affineMarked (polynomialIdeal ℚ 2 ((MvPolynomial.X 1 - MvPolynomial.X 0 ^ 2) ^ 2))
      2 (by norm_num) (fun _ : Fin 1 => coordinateIdeal ℚ 2 1) (by sorry))
    parabola := by sorry

/-! ## The resolved locus of a smooth pair -/

def resolvedLocus {k : Type} [Field k] {M X : Scheme}
    (s : M ⟶ Spec (.of k)) (E : Fin m → M.IdealSheafData) (i : X ⟶ M) : Set X :=
  {a | SNCAt (i ≫ s) (fun j => (E j).comap i) a}

lemma resolvedLocus_open {k : Type} [Field k] {M X : Scheme}
    (s : M ⟶ Spec (.of k)) (E : Fin m → M.IdealSheafData) (i : X ⟶ M)
    [Smooth (i ≫ s)] : IsOpen (resolvedLocus s E i) := by sorry

lemma resolvedLocus_restrict {k : Type} [Field k] {M X W : Scheme}
    (s : M ⟶ Spec (.of k)) (E : Fin m → M.IdealSheafData) (i : X ⟶ M)
    (j : W ⟶ X) [IsOpenImmersion j] :
    resolvedLocus s E (j ≫ i) = j ⁻¹' resolvedLocus s E i := by sorry

def originMap (k : Type) [Field k] (n : ℕ) : Spec (.of k) ⟶ affine k n :=
  Spec.map (CommRingCat.ofHom (MvPolynomial.eval₂Hom (RingHom.id k) (fun _ => 0)))

def origin (k : Type) [Field k] (n : ℕ) : affine k n :=
  originMap k n (⟨⊥, inferInstance⟩ : PrimeSpectrum k)

def gradientAtOrigin {k : Type} [Field k] {n m : ℕ}
    (f : Fin m → MvPolynomial (Fin n) k) : Matrix (Fin m) (Fin n) k :=
  fun i j => MvPolynomial.eval (fun _ => 0) (MvPolynomial.pderiv j (f i))

/-- The native affine-coordinate version of the all-subset rank criterion. -/
lemma resolvedLocus_subsetCriterion {k : Type} [Field k] {n m : ℕ}
    (f : Fin m → MvPolynomial (Fin n) k)
    (h0 : ∀ i, MvPolynomial.eval (fun _ => 0) (f i) = 0) :
    origin k n ∈ resolvedLocus (affineToBase k n)
      (fun i => polynomialIdeal k n (f i)) (𝟙 (affine k n)) ↔
      ∀ J : Finset (Fin m), Matrix.rank
        ((gradientAtOrigin f).submatrix (fun i : {i // i ∈ J} => i.val) id) = J.card := by sorry

-- resolved_transverse_axes
example : origin ℚ 2 ∈ resolvedLocus (affineToBase ℚ 2)
    (coordinateIdeal ℚ 2) (𝟙 (affine ℚ 2)) := by sorry

private def productGraph : affine ℚ 2 ⟶ affine ℚ 3 :=
  Spec.map (CommRingCat.ofHom (MvPolynomial.eval₂Hom MvPolynomial.C
    (fun i : Fin 3 => if i = 0 then MvPolynomial.X (0 : Fin 2) else
      if i = 1 then MvPolynomial.X 1 else MvPolynomial.X 0 * MvPolynomial.X 1)))

-- resolved_tangency: restricting the single ambient z-component gives xy on the graph.
example : origin ℚ 2 ∉ resolvedLocus (affineToBase ℚ 3)
    (fun _ : Fin 1 => coordinateIdeal ℚ 3 2) productGraph := by sorry
-- resolved_empty_boundary
example {k : Type} [Field k] {M X : Scheme}
    (s : M ⟶ Spec (.of k)) (i : X ⟶ M) [Smooth (i ≫ s)] :
    resolvedLocus s (fun j : Fin 0 => Fin.elim0 j) i = Set.univ := by sorry

/-! ## Native existence contracts of the global targets

The ordinary-blowup tower factorization and the whole-tower local-isomorphism
comparison require the supplier's blowup interface and are omitted, not given
an unconstrained proposition. The existence contracts below are genuine native
scheme statements. Over a characteristic-zero field, the smooth locus is the
regular locus for a reduced finite-type scheme. -/

theorem localIsomorphismResolution_exists {k : Type} [Field k] [CharZero k]
    {X : Scheme} [IsReduced X] (s : X ⟶ Spec (.of k))
    [LocallyOfFiniteType s] [QuasiCompact s] :
    ∃ (Y : Scheme) (π : Y ⟶ X), Smooth (π ≫ s) ∧ QuasiCompact (π ≫ s) ∧
      IsProper π ∧ IsIso (π ∣_ s.smoothLocus) := by sorry

/-- Final total-ideal contract; the weak-transform and tower assertions are in the ledger. -/
theorem principalization {k : Type} [Field k] [CharZero k]
    {M : Scheme} (s : M ⟶ Spec (.of k)) [Smooth s] [QuasiCompact s]
    (I : M.IdealSheafData) (U : M.Opens) (hU : (U : Set M) = (I.support : Set M)ᶜ)
    (hD : Dense (U : Set M)) :
    ∃ (Y : Scheme) (π : Y ⟶ M) (m : ℕ) (E : Fin m → Y.IdealSheafData)
      (multiplicity : Fin m → ℕ), IsProper π ∧ IsIso (π ∣_ U) ∧
      SNCBoundary (π ≫ s) E ∧ I.comap π = ∏ i, E i ^ multiplicity i := by sorry

/-! ## Shrinking a genuine analytic chart to a polydisc

The algebraic-to-analytic carrier and étale-Jacobian bridge are the same-bundle
A0 supplier. This is the typed analytic part of the polydisc target. -/

def polydisc {n : ℕ} (ε : Fin n → ℝ) : Set (Fin n → ℂ) :=
  {z | ∀ i, ‖z i‖ < ε i}

def puncturedPolydisc {n r : ℕ} (hr : r ≤ n) (ε : Fin n → ℝ) : Set (Fin n → ℂ) :=
  {z | z ∈ polydisc ε ∧ ∀ i : Fin r, z (Fin.castLE hr i) ≠ 0}

theorem analyticPolydisc {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    {n : ℕ} (g : OpenPartialHomeomorph E (Fin n → ℂ)) (a : E)
    (ha : a ∈ g.source) (h0 : g a = 0)
    (hg : AnalyticOnNhd ℂ g g.source)
    (hi : AnalyticOnNhd ℂ g.symm g.target) :
    ∃ (ε : Fin n → ℝ) (h : OpenPartialHomeomorph E (Fin n → ℂ)),
      (∀ i, 0 < ε i) ∧ a ∈ h.source ∧ h.target = polydisc ε ∧
      h.source ⊆ g.source ∧ Set.EqOn h g h.source ∧
      AnalyticOnNhd ℂ h h.source ∧ AnalyticOnNhd ℂ h.symm h.target := by sorry

/-! ## Completion, flat chart comparison and history compatibility -/

lemma hilbertSamuel_completion (A : Type*) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] (r : ℕ) :
    Module.length A (A ⧸ IsLocalRing.maximalIdeal A ^ (r + 1)) =
      Module.length (AdicCompletion (IsLocalRing.maximalIdeal A) A)
        (AdicCompletion (IsLocalRing.maximalIdeal A) A ⧸
          (Ideal.map (algebraMap A (AdicCompletion (IsLocalRing.maximalIdeal A) A))
            (IsLocalRing.maximalIdeal A)) ^ (r + 1)) := by sorry

lemma controlledTransform_flatBaseChange {R S : Type*} [CommRing R] [CommRing S]
    [Algebra R S] [Module.Flat R S] (J : Ideal R) (e : R) (d : ℕ)
    (he : IsRegular e) (hJ : J ≤ Ideal.span ({e ^ d} : Set R)) :
    Ideal.map (algebraMap R S) (controlledTransform J e d) =
      controlledTransform (Ideal.map (algebraMap R S) J) (algebraMap R S e) d := by sorry

lemma exceptionalHistory_stratum {α : Type*} (H : ExceptionalHistory α)
    (p : Fin H.depth → Fin (H.year + 1) → α)
    (hp : ∀ r q, q ≤ r → ∀ i j, p r i = p r j → p q i = p q j)
    (h : ∀ r i,
      (H.prefixValue r i = H.prefixValue r ⟨H.year, Nat.lt_succ_self H.year⟩) ↔
      (p r i = p r ⟨H.year, Nat.lt_succ_self H.year⟩)) (r : Fin H.depth) :
    exceptionalHistoryBlock H r =
      exceptionalHistoryBlock {H with prefixValue := p, coherent := hp} r := by sorry

-- same_initial_cosupport_fails: the two explicit admissible Cartier charts distinguish the ideals.
example : (Ideal.span ({MvPowerSeries.X () ^ 2} : Set (MvPowerSeries Unit ℚ))).radical =
      (Ideal.span ({MvPowerSeries.X () ^ 3} : Set (MvPowerSeries Unit ℚ))).radical ∧
    controlledTransform (controlledTransform
      (Ideal.span ({MvPowerSeries.X () ^ 2} : Set (MvPowerSeries Unit ℚ)))
      (MvPowerSeries.X ()) 1) (MvPowerSeries.X ()) 1 = ⊤ ∧
    controlledTransform (controlledTransform
      (Ideal.span ({MvPowerSeries.X () ^ 3} : Set (MvPowerSeries Unit ℚ)))
      (MvPowerSeries.X ()) 1) (MvPowerSeries.X ()) 1 =
      Ideal.span ({MvPowerSeries.X ()} : Set _) := by sorry

-- exceptional_pullback_not_division: this is pure pullback, without a mark-dependent division.
example : MvPolynomial.eval₂Hom MvPolynomial.C
    (fun i : Fin 2 => if i = 0 then MvPolynomial.X (0 : Fin 2) else
      MvPolynomial.X 0 * MvPolynomial.X 1)
    (MvPolynomial.X (0 : Fin 2) ^ 2 * MvPolynomial.X 1 : MvPolynomial (Fin 2) ℚ) =
      (MvPolynomial.X (0 : Fin 2) ^ 3 * MvPolynomial.X 1 : MvPolynomial (Fin 2) ℚ) := by sorry

/-! ## Finite partially ordered maxima: the typed set part of centre selection

The coherent centre subscheme and the computation of its local irreducible
stratum labels use the semicoherent invariant and blowup-tower interface.
These signatures pin the finite partial-order selection itself. -/

instance : PartialOrder InvariantWord where
  le w v := w = v ∨ invariantWordLT w v
  le_refl _ := Or.inl rfl
  le_trans := by sorry
  le_antisymm := by sorry

structure ExtendedInvariantWord (m : ℕ) where
  invariant : InvariantWord
  birthBits : Fin m → Bool

def extendedInvariantLT {m : ℕ} (w v : ExtendedInvariantWord m) : Prop :=
  invariantWordLT w.invariant v.invariant ∨
    (w.invariant = v.invariant ∧
      List.Lex (fun a b : Bool => a < b) (List.ofFn w.birthBits) (List.ofFn v.birthBits))

instance (m : ℕ) : PartialOrder (ExtendedInvariantWord m) where
  le w v := w = v ∨ extendedInvariantLT w v
  le_refl _ := Or.inl rfl
  le_trans := by sorry
  le_antisymm := by sorry

def maximumCentre {X α : Type*} [PartialOrder α] (f : X → α) (S : Set X) : Set X :=
  {a | a ∈ S ∧ ∀ b ∈ S, f a ≤ f b → f b ≤ f a}

/-- Native set version; smooth coordinate components require the full invariant certificate. -/
lemma maximumCentre_local {X α : Type*} [PartialOrder α]
    (f : X → α) (S U : Set X)
    (h : ∀ a ∈ S ∩ U, ∀ b ∈ S, f a < f b → ∃ c ∈ S ∩ U, f a < f c) :
    maximumCentre f (S ∩ U) = maximumCentre f S ∩ U := by sorry

/-- Closedness of the finite union, with every incomparable maximal value retained. -/
lemma maximumCentre_closed {X α : Type*} [TopologicalSpace X] [PartialOrder α]
    (f : X → α) (S : Set X) (hF : (f '' S).Finite)
    (hC : ∀ v, IsClosed {a | a ∈ S ∧ v ≤ f a}) :
    IsClosed (maximumCentre f S) := by sorry

/-- Native set comparison; the ideal comparison uses common regular stratum equations. -/
lemma maximumCentre_localIso {X Y α : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    [PartialOrder α] (h : X ≃ₜ Y) (f : X → α) (g : Y → α) (S : Set X)
    (hc : ∀ a, g (h a) = f a) :
    h '' maximumCentre f S = maximumCentre g (h '' S) := by sorry

-- maximum_is_not_multiplicity
example : maximumCentre
    (fun i : Fin 2 => if i = 0 then testWord (3/2) 1 (by norm_num) else
      testWord (5/2) 0 (by norm_num)) Set.univ = {1} := by sorry
-- maximum_incomparable_union
example : maximumCentre (fun i : Fin 2 => if i = 0 then (1, 0) else (0, 1) :
    Fin 2 → ℕ × ℕ) Set.univ = Set.univ := by sorry
-- maximum_empty_unresolved
example {X α : Type*} [PartialOrder α] (f : X → α) :
    maximumCentre f ∅ = ∅ := by sorry

/-! ## Native supplier contracts used to state geometric outputs

These are local specification adapters for the existing SF.3 Cartier dictionary
and StableReduction Layer 4 universal property. They do not plan another blowup
construction. Packaging replaces them by the corresponding owner's interfaces. -/

/-- An invertible ideal as a locally principal ideal generated by a regular element. -/
def CartierIdeal {X : Scheme} (I : X.IdealSheafData) : Prop :=
  ∀ a : X, ∃ (U : X.affineOpens), a ∈ U.1 ∧
    ∃ e : X.presheaf.obj (.op U.1), IsRegular e ∧ I.ideal U = Ideal.span ({e} : Set _)

/-- The imported blowup's universal property, expressed using actual schemes and ideals. -/
def IsBlowupOf {X Y : Scheme} (I : X.IdealSheafData) (π : Y ⟶ X) : Prop :=
  CartierIdeal (I.comap π) ∧
    ∀ (Z : Scheme) (f : Z ⟶ X), CartierIdeal (I.comap f) →
      ∃! g : Z ⟶ Y, g ≫ π = f

def idealComplement {X : Scheme} (I : X.IdealSheafData) : X.Opens :=
  ⟨(I.support : Set X)ᶜ, I.support.isClosed.isOpen_compl⟩

/-- Scheme-theoretic closure of the inverse image away from the centre. -/
def strictTransformIdeal {X Y : Scheme} (I C : X.IdealSheafData) (π : Y ⟶ X) :
    Y.IdealSheafData :=
  (((I.comap π).subschemeι ⁻¹ᵁ (π ⁻¹ᵁ idealComplement C)).ι ≫
    (I.comap π).subschemeι).ker

/-- The last label is newly born; surviving strict transforms retain their old labels. -/
def transformedBoundary {X Y : Scheme} (E : Fin m → X.IdealSheafData)
    (C : X.IdealSheafData) (π : Y ⟶ X) : Fin (m + 1) → Y.IdealSheafData :=
  fun j => if h : j.val < m then strictTransformIdeal (E ⟨j.val, h⟩) C π else C.comap π

lemma permissibleCentre_snc_after {k : Type} [Field k] {M C Y : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData}
    (P : MarkedIdeal s E) (i : C ⟶ P.submanifold) (hC : PermissibleCentre P i)
    (π : Y ⟶ M) (hπ : IsBlowupOf (i ≫ P.inclusion).ker π) [IsProper π] :
    SNCBoundary (π ≫ s) (transformedBoundary E (i ≫ P.inclusion).ker π) := by sorry

/-- This construction is on unrestricted schemes; the native universal property
identifies the output with the ordinary blowup rather than an arbitrary modification. -/
theorem cartierSeparation {X : Scheme} (D₁ D₂ : X.IdealSheafData)
    (h₁ : CartierIdeal D₁) (h₂ : CartierIdeal D₂) :
    ∃ (Y : Scheme) (π : Y ⟶ X) (F R₁ R₂ : Y.IdealSheafData),
      IsBlowupOf (D₁ ⊔ D₂) π ∧ IsProper π ∧
      IsIso (π ∣_ idealComplement (D₁ ⊔ D₂)) ∧
      CartierIdeal F ∧ CartierIdeal R₁ ∧ CartierIdeal R₂ ∧
      (D₁ ⊔ D₂).comap π = F ∧ D₁.comap π = F * R₁ ∧
      D₂.comap π = F * R₂ ∧ R₁ ⊔ R₂ = ⊤ := by sorry

/-! ## Native projective SNC output

Absolute projectivity here is an actual closed immersion into the graded-polynomial
Proj scheme. The projective-closure and projectivity-of-compositions proofs are
R09.1 and StableReduction imports. No proper-to-projective implication is used. -/

attribute [local instance] MvPolynomial.gradedAlgebra

def projective (k : Type) [Field k] (n : ℕ) : Scheme :=
  Proj (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k)

def degreeZeroConstants (k : Type) [Field k] (n : ℕ) :
    k →+* MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k 0 where
  toFun r := ⟨MvPolynomial.C r, by sorry⟩
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry

def projectiveToBase (k : Type) [Field k] (n : ℕ) : projective k n ⟶ Spec (.of k) :=
  Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k) ≫
    Spec.map (CommRingCat.ofHom (degreeZeroConstants k n))

structure SNCCompactification {k : Type} [Field k] {U : Scheme}
    (s : U ⟶ Spec (.of k)) where
  total : Scheme
  toBase : total ⟶ Spec (.of k)
  dimension : ℕ
  embedding : total ⟶ projective k dimension
  closed : IsClosedImmersion embedding
  over_base : embedding ≫ projectiveToBase k dimension = toBase
  openEmbedding : U ⟶ total
  openImmersion : IsOpenImmersion openEmbedding
  open_over_base : openEmbedding ≫ toBase = s
  dense : Dense (Set.range openEmbedding)
  labels : ℕ
  boundary : Fin labels → total.IdealSheafData
  snc : SNCBoundary toBase boundary
  complement : (⋃ i, (boundary i).support : Set total) = (Set.range openEmbedding)ᶜ

theorem sncCompactification {k : Type} [Field k] [CharZero k] {U : Scheme}
    (s : U ⟶ Spec (.of k)) [Smooth s] [QuasiCompact s]
    (n : ℕ) (i : U ⟶ projective k n) [IsImmersion i]
    (hi : i ≫ projectiveToBase k n = s) : Nonempty (SNCCompactification s) := by sorry

lemma sncCompactification_open {k : Type} [Field k] {U : Scheme}
    {s : U ⟶ Spec (.of k)} (C : SNCCompactification s) :
    IsOpenImmersion C.openEmbedding ∧ Dense (Set.range C.openEmbedding) ∧ C.openEmbedding ≫ C.toBase = s := by sorry

lemma sncCompactification_boundary {k : Type} [Field k] {U : Scheme}
    {s : U ⟶ Spec (.of k)} (C : SNCCompactification s) :
    SNCBoundary C.toBase C.boundary ∧
      (⋃ i, (C.boundary i).support : Set C.total) = (Set.range C.openEmbedding)ᶜ := by sorry

lemma sncCompactification_projective {k : Type} [Field k] {U : Scheme}
    {s : U ⟶ Spec (.of k)} (C : SNCCompactification s) :
    ∃ (n : ℕ) (i : C.total ⟶ projective k n),
      IsClosedImmersion i ∧ i ≫ projectiveToBase k n = C.toBase := by sorry

-- compactify_affine_line: the missing point in the usual projective-line model is infinity.
example : ∃ C : SNCCompactification (affineToBase ℚ 1),
    C.dimension = 1 ∧ Nonempty (C.total ≅ projective ℚ 1) ∧ C.labels = 1 ∧
      ∀ j, Nonempty ((C.boundary j).subscheme ≅ Spec (.of ℚ)) := by sorry

def twoTorus (k : Type) [Field k] : Scheme :=
  Spec (.of (Localization.Away
    (MvPolynomial.X (0 : Fin 2) * MvPolynomial.X 1 : MvPolynomial (Fin 2) k)))

def twoTorusToBase (k : Type) [Field k] : twoTorus k ⟶ Spec (.of k) :=
  Spec.map (CommRingCat.ofHom (algebraMap k (Localization.Away
    (MvPolynomial.X (0 : Fin 2) * MvPolynomial.X 1 : MvPolynomial (Fin 2) k))))

-- compactify_two_torus: the product has the four globally smooth boundary labels.
example : ∃ C : SNCCompactification (twoTorusToBase ℚ), C.labels = 4 ∧
    Nonempty (C.total ≅ CategoryTheory.Limits.pullback
      (projectiveToBase ℚ 1) (projectiveToBase ℚ 1)) := by sorry

-- compactify_preserves_smooth_open: the chosen projective closure may be singular elsewhere.
example {k : Type} [Field k] [CharZero k] {Y : Scheme} [IsReduced Y]
    (s : Y ⟶ Spec (.of k)) (n : ℕ) (i : Y ⟶ projective k n) [IsClosedImmersion i]
    (hi : i ≫ projectiveToBase k n = s) (U : Y.Opens)
    [Smooth (U.ι ≫ s)] [QuasiCompact (U.ι ≫ s)] (hU : Dense (U : Set Y)) :
    ∃ (C : SNCCompactification (U.ι ≫ s)) (π : C.total ⟶ Y),
      IsProper π ∧ C.openEmbedding ≫ π = U.ι ∧ IsIso (π ∣_ U) := by sorry

/-! ## Native embedded and resolved-pair output contracts
The tower, histories and specified sequence of strict transforms are additional
conditions in the interface ledger. These statements pin the output geometry. -/

theorem embeddedResolution {k : Type} [Field k] [CharZero k] {M X : Scheme}
    [IsReduced X] (s : M ⟶ Spec (.of k)) [Smooth s] [QuasiCompact s]
    (i : X ⟶ M) [IsClosedImmersion i] :
    ∃ (M' X' : Scheme) (π : M' ⟶ M) (j : X' ⟶ M') (q : X' ⟶ X)
      (m : ℕ) (E : Fin m → M'.IdealSheafData),
      IsProper π ∧ IsClosedImmersion j ∧ IsProper q ∧
      IsIso (q ∣_ (i ≫ s).smoothLocus) ∧ j ≫ π = q ≫ i ∧
      SNCBoundary (π ≫ s) E ∧
      SNCBoundary (j ≫ π ≫ s) (fun r => (E r).comap j) := by sorry

/-- The input pair is smooth; the unresolved-locus complement, not its regular
locus alone, is the open preserved by pair cleanup. -/
theorem preserveResolvedPoints {k : Type} [Field k] [CharZero k] {M X : Scheme}
    (s : M ⟶ Spec (.of k)) (E : Fin m → M.IdealSheafData) (hE : SNCBoundary s E)
    (i : X ⟶ M) [IsClosedImmersion i] [Smooth (i ≫ s)]
    (hD : ∀ r, CartierIdeal ((E r).comap i)) :
    ∃ (M' X' : Scheme) (π : M' ⟶ M) (j : X' ⟶ M') (q : X' ⟶ X)
      (l : ℕ) (F : Fin l → M'.IdealSheafData) (V : X.Opens),
      (V : Set X) = resolvedLocus s E i ∧ IsProper π ∧ IsClosedImmersion j ∧
      IsProper q ∧ IsIso (q ∣_ V) ∧ j ≫ π = q ≫ i ∧
      SNCBoundary (π ≫ s) F ∧ SNCBoundary (j ≫ π ≫ s) (fun r => (F r).comap j) := by sorry

/-! ## Rescaling and coefficient-chart calculation
Full equality of geometric test classes uses the test-chain supplier contract;
the following native statements pin the cosupport and chart equations. -/

def rescaleMarked {k : Type} [Field k] {M : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData}
    (P : MarkedIdeal s E) (r : ℕ) (hr : 0 < r) : MarkedIdeal s E :=
  { P with
    ideal := P.ideal ^ r
    mark := P.mark * r
    positive := Nat.mul_pos P.positive hr }

lemma markedIdeal_rescale {k : Type} [Field k] {M : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData}
    (P : MarkedIdeal s E) (r : ℕ) (hr : 0 < r) :
    markedCosupport (rescaleMarked P r hr) = markedCosupport P := by sorry

/-- `h` is the coefficient identity obtained from z=e z' and π*f=e^d g;
cancellation of e^q yields the correct, q-dependent controlled coefficient. -/
lemma coefficientPresentation_transform {σ τ K : Type*}
    [DecidableEq σ] [DecidableEq τ] [Field K]
    (f : MvPowerSeries (Option σ) K) (g : MvPowerSeries (Option τ) K)
    (φ : MvPowerSeries σ K →+* MvPowerSeries τ K)
    (e : MvPowerSeries τ K) (he : IsRegular e) (d : ℕ)
    (h : ∀ q < d, e ^ q * φ (contactCoefficient f q) = e ^ d * contactCoefficient g q)
    (q : Fin d) :
    φ (contactCoefficient f q.val) = e ^ (d - q.val) * contactCoefficient g q.val := by sorry

/-! ## One common regular presentation
This is the common-neighbourhood, finite-regular-family part of semicoherence.
Its infinitesimal test-equivalence and compatibility along admissible towers are
omitted conditions, named in the ledger; they are not unconstrained fields. -/

structure RegularPresentation (N : Scheme) where
  count : ℕ
  function : Fin count → N.presheaf.obj (.op ⊤)
  mark : Fin count → ℕ
  positive : ∀ i, 0 < mark i

def regularOrder {N : Scheme} (f : N.presheaf.obj (.op ⊤)) (a : N) : ℕ∞ :=
  idealOrder (Ideal.span ({(N.presheaf.germ ⊤ a (by trivial)).hom f} : Set _))

def regularCosupport {N : Scheme} (P : RegularPresentation N) : Set N :=
  {a | ∀ i, (P.mark i : ℕ∞) ≤ regularOrder (P.function i) a}

structure SemicoherentPresentation {k : Type} [Field k] {M : Scheme}
    (s : M ⟶ Spec (.of k)) (E : Fin m → M.IdealSheafData) (a : M) (S : Set M) where
  neighbourhood : M.Opens
  contains : a ∈ neighbourhood
  submanifold : Scheme
  inclusion : submanifold ⟶ neighbourhood
  closed : IsClosedImmersion inclusion
  smooth : Smooth (inclusion ≫ neighbourhood.ι ≫ s)
  quasiCompact : QuasiCompact (inclusion ≫ neighbourhood.ι ≫ s)
  family : RegularPresentation submanifold
  boundary : SNCBoundary (inclusion ≫ neighbourhood.ι ≫ s)
    (fun r => (E r).comap (inclusion ≫ neighbourhood.ι))
  stratum : ∀ b : M, IsClosed ({b} : Set M) → b ∈ neighbourhood →
    (b ∈ S ↔ ∃ c ∈ regularCosupport family, (inclusion ≫ neighbourhood.ι) c = b)

lemma semicoherentPresentation_restrict {k : Type} [Field k] {M : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData} {a : M} {S : Set M}
    (P : SemicoherentPresentation s E a S) (W : M.Opens)
    (hW : W ≤ P.neighbourhood) (ha : a ∈ W) :
    ∃ Q : SemicoherentPresentation s E a S, Q.neighbourhood = W := by sorry

lemma semicoherentPresentation_stratum {k : Type} [Field k] {M : Scheme}
    {s : M ⟶ Spec (.of k)} {E : Fin m → M.IdealSheafData} {a : M} {S : Set M}
    (P : SemicoherentPresentation s E a S) (b : M)
    (hb : IsClosed ({b} : Set M)) (hV : b ∈ P.neighbourhood) :
    b ∈ S ↔ ∃ c ∈ regularCosupport P.family, (P.inclusion ≫ P.neighbourhood.ι) c = b := by sorry

/-- Regular residual functions on an actual affine blowup chart. The geometric
compatibility with the invariant's infinitesimal test class is omitted here. -/
lemma semicoherentPresentation_transform {R A : Type*} [CommRing R] [CommRing A]
    (f : Fin m → R) (d : Fin m → ℕ) (φ : R →+* A) (e : A)
    (h : ∀ i, e ^ d i ∣ φ (f i)) :
    ∃ g : Fin m → A, ∀ i, φ (f i) = e ^ d i * g i := by sorry

def singleRegularPresentation {N : Scheme} (f : N.presheaf.obj (.op ⊤))
    (d : ℕ) (hd : 0 < d) : RegularPresentation N :=
  ⟨1, fun _ => f, fun _ => d, fun _ => hd⟩

-- semicoherent_hypersurface: on an order-bounded neighbourhood, ≥d cuts out equality d.
example {N : Scheme} (f : N.presheaf.obj (.op ⊤)) (d : ℕ) (hd : 0 < d)
    (h : ∀ a, regularOrder f a ≤ d) :
    regularCosupport (singleRegularPresentation f d hd) = {a | regularOrder f a = d} := by sorry

-- semicoherent_common_open: all the finitely many denominator conditions hold on one open.
example {N : Scheme} (g : Fin m → N.presheaf.obj (.op ⊤)) (a : N)
    (h : ∀ i, a ∈ N.basicOpen (g i)) :
    ∃ W : N.Opens, a ∈ W ∧ ∀ i, W ≤ N.basicOpen (g i) := by sorry

-- formal_only_is_insufficient: these two assigned germs cannot come from a common
-- regular function on the irreducible affine line (the polynomial case is already a test).
example : ¬ ∃ f : MvPolynomial Unit ℚ,
    (∀ α, MvPowerSeries.coeff α (f : MvPowerSeries Unit ℚ) = 0) ∧
      MvPolynomial.eval (fun _ => 1) f = 1 := by sorry

/-! ## Computed local input traces for the recursive invariant
The canonical global recursion and its history-indexed comparison are not replaced
by a function returning a prescribed word. These examples calculate its successive
coefficient orders, which the omitted recursion must reproduce. -/

-- invariant_smooth_empty_boundary: a coordinate equation has only zero lower coefficients.
example : listNormalizedOrder (List.ofFn fun q : Fin 1 =>
    (contactCoefficient (MvPowerSeries.X none : MvPowerSeries (Option Unit) ℚ) q.val,
      ((1 - q.val : ℕ) : ℚ))) = ⊤ := by sorry

-- invariant_cusp: z²+x³ produces 3/2, then the normalized pair x³ marked 3 has zero coefficients.
example : normalizedSeriesOrder
      (contactCoefficient (MvPowerSeries.X none ^ 2 + MvPowerSeries.X (some ()) ^ 3 :
        MvPowerSeries (Option Unit) ℚ) 0) 2 = (3/2 : ℚ) ∧
    listNormalizedOrder (List.ofFn fun q : Fin 3 =>
      (contactCoefficient (MvPowerSeries.X none ^ 3 : MvPowerSeries (Option (Fin 0)) ℚ) q.val,
        ((3 - q.val : ℕ) : ℚ))) = ⊤ := by sorry

-- invariant_bm_example: the first two positive residuals are 5/2 and 1.
example : normalizedSeriesOrder
      (contactCoefficient (MvPowerSeries.X none ^ 2 -
        MvPowerSeries.X (some (0 : Fin 2)) ^ 2 * MvPowerSeries.X (some 1) ^ 3 :
        MvPowerSeries (Option (Fin 2)) ℚ) 0) 2 = (5/2 : ℚ) ∧
    normalizedSeriesOrder
      (contactCoefficient (MvPowerSeries.X none ^ 2 * MvPowerSeries.X (some ()) ^ 3 :
        MvPowerSeries (Option Unit) ℚ) 2) 3 = 1 := by sorry

-- history_changes_centre: the same coefficient has residual 3/2 without boundary,
-- and zero with both remaining exceptional coordinates; its monomial centre is different.
example : let P : WeightedPresentation (Fin 2) ℚ :=
    ⟨1, fun _ => MvPowerSeries.X 0 * MvPowerSeries.X 1 ^ 2, fun _ => 2, by norm_num⟩
    residualOrder P ∅ = (3/2 : ℚ) ∧ residualOrder P {0, 1} = 0 ∧
      MinimalMonomialCentre (⟨fun i : Fin 2 => if i = 0 then 1/2 else 1, by
        intro i; split <;> norm_num⟩ : MonomialData 2) {1} := by sorry

/-! ## Observation component of presentation test equivalence

`ι` indexes already transformed formal presentations. The geometric condition
that these observations arise from the same permitted scheme test chain is
omitted. In particular this is not a substitute for constructing the three
source test policies, and equality at the empty test alone does not suffice. -/

def presentationEquivalent {ι σ K : Type*} [Field K]
    (tests : Set ι) (P Q : ι → WeightedPresentation σ K) : Prop :=
  ∀ t ∈ tests, formalCosupport (P t) ↔ formalCosupport (Q t)

lemma presentationEquivalent_equivalence {ι σ K : Type*} [Field K]
    (tests : Set ι) :
    Equivalence (presentationEquivalent (σ := σ) (K := K) tests) := by sorry

/-- Pulling back the observation family along the remaining chain indices. The
condition identifying this map with a permitted first geometric test is omitted. -/
lemma presentationEquivalent_transform {ι κ σ K : Type*} [Field K]
    (tests : Set ι) (remaining : Set κ) (extension : κ → ι)
    (P Q : ι → WeightedPresentation σ K)
    (h : presentationEquivalent tests P Q)
    (hclosed : ∀ t ∈ remaining, extension t ∈ tests) :
    presentationEquivalent remaining (P ∘ extension) (Q ∘ extension) := by sorry

lemma presentationEquivalent_strength {ι σ K : Type*} [Field K]
    (full restricted twoType : Set ι) (P Q : ι → WeightedPresentation σ K)
    (hr : restricted ⊆ full) (ht : twoType ⊆ restricted)
    (h : presentationEquivalent full P Q) :
    presentationEquivalent restricted P Q ∧ presentationEquivalent twoType P Q := by sorry

-- rescaling_test_equivalence: numerical observation at each index. Its realization
-- by the full geometric test policies remains the rescaling compatibility condition.
example {ι : Type*} (tests : Set ι) (f : ι → MvPowerSeries Unit ℚ) :
    presentationEquivalent tests
      (fun t => ⟨1, fun _ => f t ^ 2, fun _ => 2, by norm_num⟩)
      (fun t => ⟨1, fun _ => f t ^ 4, fun _ => 4, by norm_num⟩) := by sorry

/-! ## Residual cosupport and invariance under local unit choices
The regular stratum and its restricted test-equivalence class require the
geometric chain conditions above. These signatures state their formal factors. -/

def listFormalCosupport {σ K : Type*} [Field K]
    (L : List (MvPowerSeries σ K × ℚ)) : Prop :=
  ∀ p ∈ L, (1 : WithTop ℚ) ≤ normalizedSeriesOrder p.1 p.2

lemma residualPresentation_stratum {σ K : Type*} [Field K]
    (g : List (MvPowerSeries σ K)) (M : MvPowerSeries σ K)
    (d : ℕ) (ν : ℚ) (hd : 0 < d) (hν : 0 < ν) :
    listFormalCosupport (residualPresentation g M d ν) ↔
      (∀ f ∈ g, (1 : WithTop ℚ) ≤ normalizedSeriesOrder f ((d : ℚ) * ν)) ∧
        (ν < 1 → (1 : WithTop ℚ) ≤ normalizedSeriesOrder M ((d : ℚ) * (1 - ν))) := by sorry

/-- Unit choices do not change the formal residual observations. Full s* invariance
also needs the geometric restricted-chain law, which is omitted. -/
lemma residualPresentation_sstar {σ K : Type*} [Finite σ] [Field K]
    (g : List (MvPowerSeries σ K)) (M : MvPowerSeries σ K)
    (u v : (MvPowerSeries σ K)ˣ) (d : ℕ) (hd : 0 < d) (ν : ℚ) (hν : 0 ≤ ν) :
    listFormalCosupport (residualPresentation (g.map fun f => (u : MvPowerSeries σ K) * f)
      ((v : MvPowerSeries σ K) * M) d ν) ↔
        listFormalCosupport (residualPresentation g M d ν) := by sorry

/-! ## Assembly from computed recursive entries
This input consists of genuine formal presentations and exceptional-coordinate
sets. The compatibility identifying successive inputs with the Samuel/contact/
coefficient/history recursion is omitted; no canonical algorithm is asserted by
this constructor. The numerical examples above calculate the entries it consumes. -/

structure RecursiveInvariantInput (K : Type*) [Field K] (n : ℕ) where
  ideal : Ideal (MvPowerSeries (Fin n) K)
  initialOld : Finset ℕ
  steps : ℕ
  presentation : Fin steps → WeightedPresentation (Fin n) K
  remainingBoundary : Fin steps → Finset (Fin n)
  oldBlock : Fin steps → Finset ℕ
  finite : ∀ i, residualOrder (presentation i) (remainingBoundary i) ≠ ⊤
  positive : ∀ i, 0 < (residualOrder (presentation i) (remainingBoundary i)).untopD 0
  terminal : TerminalResidual

def resolutionInvariant {K : Type*} [Field K] {n : ℕ}
    (D : RecursiveInvariantInput K n) : InvariantWord where
  first := hilbertSamuel D.ideal
  firstCounter := D.initialOld.card
  residual := List.ofFn fun i =>
    ((residualOrder (D.presentation i) (D.remainingBoundary i)).untopD 0, (D.oldBlock i).card)
  positive := by sorry
  terminal := D.terminal

lemma resolutionInvariant_first {K : Type*} [Field K] {n : ℕ}
    (D : RecursiveInvariantInput K n) :
    (resolutionInvariant D).first = hilbertSamuel D.ideal := by sorry

/-- The numerical part of independence. The hypothesis deriving these equalities
from equivalent Samuel presentations and the same geometric history is omitted. -/
lemma resolutionInvariant_equivalent {K : Type*} [Field K] {n : ℕ}
    (D F : RecursiveInvariantInput K n)
    (hH : hilbertSamuel D.ideal = hilbertSamuel F.ideal)
    (hs : D.initialOld.card = F.initialOld.card)
    (ht : D.steps = F.steps)
    (hv : ∀ i : Fin D.steps,
      residualOrder (D.presentation i) (D.remainingBoundary i) =
        residualOrder (F.presentation (Fin.cast ht i)) (F.remainingBoundary (Fin.cast ht i)))
    (hb : ∀ i : Fin D.steps, (D.oldBlock i).card = (F.oldBlock (Fin.cast ht i)).card)
    (hterminal : D.terminal = F.terminal) :
    resolutionInvariant D = resolutionInvariant F := by sorry

/-- The order-first hypersurface identification of the initial entry. Agreement
of the later recursively constructed entries requires the omitted recursion law. -/
lemma resolutionInvariant_hypersurface {K : Type*} [Field K] {n : ℕ}
    (D : RecursiveInvariantInput K n) (f : MvPowerSeries (Fin n) K)
    (d : ℕ) (hf : MvPowerSeries.order f = (d : ℕ∞))
    (hI : D.ideal = Ideal.span ({f} : Set _)) (r : ℕ) :
    (resolutionInvariant D).first r =
      (if r < d then (Nat.choose (n + r) n : ℕ∞) else
        (Nat.choose (n + r) n - Nat.choose (n + r - d) n : ℕ) : ℕ∞) := by sorry

/-! ## The formal Samuel identity and the common regular Hilbert–Samuel stratum -/

/-- The strict derivative inequality excludes differentiation at the mark. -/
def equimultipleJetIdeal {n m : ℕ} {K : Type*} [Field K]
    (f : Fin m → MvPowerSeries (Fin n) K) (d : Fin m → ℕ) (k : ℕ) :
    Ideal (MvPowerSeries (Fin n) K) :=
  Ideal.span {g | ∃ (i : Fin m) (α : Exponent n),
    degree α < min (d i) (k + 1) ∧ g = partialDerivative (f i) α}

/-- BM1997 Theorem 7.14, with the full five-condition certificate above.
Its coefficient-to-regular-germ application is still an omitted condition. -/
theorem samuelPresentationIdentity {n : ℕ} {K : Type*} [Field K] [CharZero K]
    {I : Ideal (MvPowerSeries (Fin n) K)} (C : SamuelCertificate I) (k : ℕ)
    (hk : ∀ i, degree (C.vertex i) - 1 ≤ k) :
    equimultipleJetIdeal C.generator (fun i => degree (C.vertex i)) k =
      samuelJetIdeal C.generator k := by sorry

/-- The length at the actual local ring of a scheme, including its ideal quotient. -/
def schemeHilbertSamuel {M : Scheme} (I : M.IdealSheafData) (a : M) (r : ℕ) : ℕ∞ :=
  Module.length (M.presheaf.stalk a)
    (M.presheaf.stalk a ⧸ (stalkIdeal I a +
      IsLocalRing.maximalIdeal (M.presheaf.stalk a) ^ (r + 1)))

abbrev ClosedPoints (M : Scheme) := {a : M // IsClosed ({a} : Set M)}

/-- On closed points, each pointwise upper Hilbert–Samuel set is closed. -/
theorem hilbertSamuelUpperSemicontinuous {k : Type} [Field k] [CharZero k]
    {M : Scheme} (s : M ⟶ Spec (.of k)) [Smooth s] [QuasiCompact s]
    (I : M.IdealSheafData) (H : ℕ → ℕ∞) :
    IsClosed {a : ClosedPoints M | ∀ r, H r ≤ schemeHilbertSamuel I a.val r} := by sorry

/-- Common regular-family part of the initial, empty-boundary Samuel presentation.
Infinitesimal test-equivalence and transformed-certificate laws remain omitted. -/
theorem hilbertSamuelSemicoherence {k : Type} [Field k] [CharZero k]
    {M : Scheme} (s : M ⟶ Spec (.of k)) [Smooth s] [QuasiCompact s]
    (I : M.IdealSheafData) (a : M) (ha : IsClosed ({a} : Set M)) :
    Nonempty (SemicoherentPresentation s (fun i : Fin 0 => Fin.elim0 i) a
      {b | schemeHilbertSamuel I b = schemeHilbertSamuel I a}) := by sorry

/-- Native étale coordinate neighbourhood; the chosen completed coefficient-field
identification and Taylor comparison at non-rational closed points are omitted. -/
theorem regularCoordinates {k : Type} [Field k] {M : Scheme}
    (s : M ⟶ Spec (.of k)) [Smooth s] (a : M) :
    ∃ (n : ℕ) (V : Scheme) (j : V ⟶ M) (p : V ⟶ affine k n),
      IsOpenImmersion j ∧ a ∈ Set.range j ∧ Etale p ∧
        j ≫ s = p ≫ affineToBase k n := by sorry

/-! ## Conditions still absent from the native prototypes

The reader and packet state the definitive targets. These omissions are allowed
by the prototyping convention; no arbitrary proposition field stands for them.

* regular-coordinates: the chosen coefficient-field/completion isomorphism at a
  non-rational closed point and the regular étale Taylor-to-germ comparison use SF.0.
* test-equivalence: construct actual finite test chains, all three transform laws,
  persistence at every point over the distinguished point, and the exact s* blocks.
  The observation-family definition and its three named API lemmas omit that
  realization condition. `rescaling_test_equivalence` omits its whole-chain law.
* maximal-contact and coefficient-equivalence: the chart derivative and coefficient
  signatures omit equality of the entire geometric test-equivalence classes.
* residual-presentation: `residualPresentation_stratum` states the formal guard
  inequalities; equality with the old regular stratum is omitted.
  `residualPresentation_sstar` checks unit choices, not the omitted s* chain law.
* samuel-presentation-identity, samuel-transform and hs-semicoherence: the full formal jet-minor comparison and closed-point common regular stratum
  are typed. Their regular coefficient-to-germ interpretation and transformed
  Hilbert–Samuel-stratum conditions require the SF.0 germ/completion dictionary.
* semicoherent-presentation: the common regular family and stratum are typed, but
  infinitesimal test equivalence and all admissible-tower compatibility are omitted.
* recursive-invariant: the input assembly has genuine calculated residual orders;
  the canonical recursion, first-prefix births, codimension normalization and
  bounded-denominator derivation are omitted. The three named lemmas specify only
  the initial entry, numerical comparison and hypersurface first-entry formula.
* invariant-properties, global-centres and termination: the numerical order and
  maximum-set prototypes omit the invariant certificate, coherent centre ideal,
  permissible whole-tower selection and termination comparison.
* embedded-resolution, preserve-resolved-points, local-isomorphism-resolution:
  native output geometry is typed; a finite ordinary-blowup tower, its specified
  strict transforms, all surviving/born exceptional labels, and canonical
  comparison of whole towers over open isomorphisms are omitted. In particular
  the pair output's boundary is not yet identified with the input boundary's
  transforms. The existing StableReduction blowup interfaces supply those maps.
* analytic-polydisc: the native analytic chart is typed; its identification with
  the algebraic SNC family uses the same-bundle A0 analytification bridge.

SF.3 supplies Cartier-ideal dictionaries on unrestricted schemes. R09.1 supplies
chosen projective closures and projectivity of compositions. Those owner contracts
and StableReduction's ordinary blowup contracts must replace the local
specification adapters when packaging. Every one of the 66 API names and 66 test
names appears above; the omissions listed here remain explicit refinements of the
planned stage, not formalization or proof claims. -/

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry.Resolution
