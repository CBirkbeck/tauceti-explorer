import Mathlib.Algebra.Group.Action.End
import Mathlib.Algebra.Group.Conj
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Algebra.Polynomial.Homogenize
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Degree
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Immersion
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Basic
import Mathlib.AlgebraicGeometry.Properties
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Analysis.Normed.Unbundled.RingSeminorm
import Mathlib.Analysis.SpecialFunctions.Integrals.PosLogEqCircleAverage
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Log.PosLog
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.Data.Nat.Fib.Basic
import Mathlib.Data.Set.Card
import Mathlib.Dynamics.PeriodicPts.Defs
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Galois.Infinite
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.FieldTheory.KrullTopology
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.FieldTheory.PolynomialGaloisGroup
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.FieldTheory.RatFunc.Degree
import Mathlib.FieldTheory.RatFunc.IntermediateField
import Mathlib.FieldTheory.Relrank
import Mathlib.GroupTheory.GroupAction.ConjAct
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.PGroup
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.GroupTheory.RegularWreathProduct
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.LinearAlgebra.Projectivization.Action
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.LinearAlgebra.Projectivization.Cardinality
import Mathlib.MeasureTheory.Constructions.BorelSpace.Basic
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.MeasureTheory.Measure.Dirac.Def
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Measure.MeasureSpaceDef
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Measure.WithDensity
import Mathlib.MeasureTheory.VectorMeasure.Operations
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.Height.MvPolynomial
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.Height.Projectivization
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.Completion.FinitePlace
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.ProductFormula
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.Order.Northcott
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Multiplicity
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.MvPolynomial.Symmetric.Defs
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Order
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RingTheory.UniqueFactorizationDomain.NormalizedFactors
import Mathlib.RingTheory.Unramified.Locus
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Topology.Compactification.OnePoint.Basic
import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.UniformSpace.HeineCantor

/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticDynamics.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ArithmeticDynamics: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports Mathlib only and elaborates at the Mathlib pin: the only messages are
`declaration uses 'sorry'` warnings. Where a node uses a Tau Ceti declaration (the
canonical height on elliptic curves, for instance), the section says so in a comment
and states locally only what the prototype needs.

One section per layer, DY.0 to DY.6, in the order of the roadmap; later sections use the
declarations of earlier ones. What the pinned libraries already contain -- iteration,
periodic points and minimal periods, semiconjugacy, resultants, absolute Weil heights and
Northcott, Galois actions on roots -- is imported, not restated.
-/

-- ===== DY.0 =====

section DY0File

/-!
# ArithmeticDynamics, DY.0: iteration, periodicity and dynamical moduli (suggested forms)

This section of the suggested file is not the roadmap and is not exhaustive: the roadmap document
is definitive. The statements below suggest Lean forms so that contributors and reviewers converge
on names and signatures. Every proof is `sorry`; nothing here is an implementation claim.

Conventions pinned here (see the roadmap document, DY.0):
* `ℙ¹(K)` is Mathlib's `ℙ K (Fin 2 → K)`; the point `[x : 1]` is `mk K ![x, 1]`, and `∞ = [1 : 0]`.
* A binary form is an element of `MvPolynomial (Fin 2) K`; `X 0` is the first coordinate and the
  dehomogenisation sets `X 1 = 1` (as in Mathlib's `Polynomial.homogenize`).
* The resultant of binary forms of formal degrees `m, n` is Mathlib's `Polynomial.resultant` of the
  dehomogenisations with formal degrees `m, n`; a degree-`d` map uses `m = n = d`.
* Conjugation is the left action `γ • f = γ ∘ f ∘ γ⁻¹` (Milnor, Levy); Silverman's and Rumely's
  `f^γ = γ⁻¹ ∘ f ∘ γ` is `γ⁻¹ • f`.
* The scheme `P¹_K`, the scheme structure of `M_d` (a GIT quotient) and morphisms of `P¹_K` given by
  forms are not stated here: they are requested from `SchemeAndStackFoundations:SF.0` or recorded
  as a gap in the packet.
-/

namespace TauCeti.ArithmeticDynamics

open scoped LinearAlgebra.Projectivization MatrixGroups

section DY0

/-! ### Forward orbits and preperiodic points (`DY.0/forward-orbit`, `DY.0/preperiodic-point`) -/

section Orbits

variable {α β : Type*}

/-- The forward orbit `{x, f x, f² x, …}` of `x` under `f`. -/
def forwardOrbit (f : α → α) (x : α) : Set α :=
  Set.range fun n : ℕ ↦ f^[n] x

theorem mem_forwardOrbit_iff {f : α → α} {x y : α} :
    y ∈ forwardOrbit f x ↔ ∃ n : ℕ, f^[n] x = y := sorry

theorem self_mem_forwardOrbit (f : α → α) (x : α) : x ∈ forwardOrbit f x := sorry

theorem mapsTo_forwardOrbit (f : α → α) (x : α) :
    Set.MapsTo f (forwardOrbit f x) (forwardOrbit f x) := sorry

theorem forwardOrbit_eq_insert (f : α → α) (x : α) :
    forwardOrbit f x = insert x (forwardOrbit f (f x)) := sorry

theorem image_forwardOrbit {fa : α → α} {fb : β → β} {g : α → β}
    (h : Function.Semiconj g fa fb) (x : α) :
    g '' forwardOrbit fa x = forwardOrbit fb (g x) := sorry

theorem forwardOrbit_subset_of_mem {f : α → α} {x y : α} (hy : y ∈ forwardOrbit f x) :
    forwardOrbit f y ⊆ forwardOrbit f x := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.forwardOrbit_succ_zero`: the orbit of `0` under
`n ↦ n + 1` is all of `ℕ`. -/
example : forwardOrbit (fun n : ℕ ↦ n + 1) 0 = Set.univ := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.forwardOrbit_id`: the orbit under the identity is a
singleton. -/
example (x : α) : forwardOrbit id x = {x} := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.one_not_mem_forwardOrbit_succ_two`: the forward orbit
is not the orbit of a group action: under `n ↦ n + 1` on `ℤ` the orbit of `2` misses `1`. -/
example : (1 : ℤ) ∉ forwardOrbit (fun n : ℤ ↦ n + 1) 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.forwardOrbit_sq_sub_one`: under `z ↦ z² - 1` on `ℤ`
the orbit of `1` is `{1, 0, -1}` (Silverman, AWS notes, Example 2). -/
example : forwardOrbit (fun z : ℤ ↦ z ^ 2 - 1) 1 = {1, 0, -1} := sorry

/-- `x` is preperiodic for `f` if some iterate `f^[m] x` is periodic. -/
def IsPreperiodicPt (f : α → α) (x : α) : Prop :=
  ∃ m : ℕ, f^[m] x ∈ Function.periodicPts f

/-- The set of preperiodic points of `f`. -/
def preperiodicPts (f : α → α) : Set α :=
  {x | IsPreperiodicPt f x}

theorem isPreperiodicPt_iff_exists_iterate_eq {f : α → α} {x : α} :
    IsPreperiodicPt f x ↔ ∃ m n : ℕ, 0 < n ∧ f^[m + n] x = f^[m] x := sorry

theorem isPreperiodicPt_of_isPeriodicPt {f : α → α} {x : α} {n : ℕ} (hn : 0 < n)
    (hx : Function.IsPeriodicPt f n x) : IsPreperiodicPt f x := sorry

theorem periodicPts_subset_preperiodicPts (f : α → α) :
    Function.periodicPts f ⊆ preperiodicPts f := sorry

theorem isPreperiodicPt_apply_iff {f : α → α} {x : α} :
    IsPreperiodicPt f (f x) ↔ IsPreperiodicPt f x := sorry

theorem IsPreperiodicPt.iterate {f : α → α} {x : α} (hx : IsPreperiodicPt f x) (m : ℕ) :
    IsPreperiodicPt f (f^[m] x) := sorry

theorem isPreperiodicPt_of_finite [Finite α] (f : α → α) (x : α) : IsPreperiodicPt f x := sorry

theorem isPreperiodicPt_iterate_iff {f : α → α} {x : α} {k : ℕ} (hk : 0 < k) :
    IsPreperiodicPt f^[k] x ↔ IsPreperiodicPt f x := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.isPreperiodicPt_one_sq_sub_one`: `1` is preperiodic
but not periodic for `z ↦ z² - 1` on `ℤ`. -/
example : IsPreperiodicPt (fun z : ℤ ↦ z ^ 2 - 1) 1 ∧
    1 ∉ Function.periodicPts (fun z : ℤ ↦ z ^ 2 - 1) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.isPreperiodicPt_id`: every point is preperiodic (indeed
fixed) for the identity. -/
example (x : α) : IsPreperiodicPt id x := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.not_isPreperiodicPt_two_sq_sub_one`: `2` is wandering
for `z ↦ z² - 1` on `ℤ`. -/
example : ¬ IsPreperiodicPt (fun z : ℤ ↦ z ^ 2 - 1) 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.isPreperiodicPt_pow_iff_isOfFinOrder`: for `g ↦ g ^ d`
on a group with `d ≥ 2`, the preperiodic points are the elements of finite order (Silverman, AWS
notes, Exercise A). -/
example {G : Type*} [Group G] (d : ℕ) (hd : 2 ≤ d) (g : G) :
    IsPreperiodicPt (fun x : G ↦ x ^ d) g ↔ IsOfFinOrder g := sorry

/-- `DY.0/preperiodic-iff-finite-forward-orbit` (Call–Silverman, p. 168). -/
theorem isPreperiodicPt_iff_finite_forwardOrbit {f : α → α} {x : α} :
    IsPreperiodicPt f x ↔ (forwardOrbit f x).Finite := sorry

/-- `DY.0/preperiodic-of-semiconj`: a semiconjugacy maps preperiodic points to preperiodic
points (Silverman, AWS notes, Exercise D). -/
theorem IsPreperiodicPt.map {fa : α → α} {fb : β → β} {g : α → β} {x : α}
    (hx : IsPreperiodicPt fa x) (hg : Function.Semiconj g fa fb) :
    IsPreperiodicPt fb (g x) := sorry

/-- The converse direction along a bijective semiconjugacy (conjugacy). -/
theorem isPreperiodicPt_map_iff_of_bijective {fa : α → α} {fb : β → β} {g : α → β} {x : α}
    (hg : Function.Semiconj g fa fb) (hbij : Function.Bijective g) :
    IsPreperiodicPt fb (g x) ↔ IsPreperiodicPt fa x := sorry

end Orbits

/-! ### Iterating an endomorphism in a category (`DY.0/iterate-of-endomorphism-on-points`) -/

section Categorical

open CategoryTheory

/-- The `n`-th iterate of postcomposition with `φ` on `T`-points is postcomposition with `φ ^ n`
in the monoid `End X`: an equality of iterates is an equality of morphisms. -/
theorem iterate_comp_end_eq_comp_pow {C : Type*} [Category C] {T X : C} (φ : End X) (n : ℕ)
    (P : T ⟶ X) : (fun Q : T ⟶ X ↦ Q ≫ φ)^[n] P = P ≫ (φ ^ n : End X) := sorry

end Categorical

/-! ### The resultant of a pair of binary forms (`DY.0/resultant-of-a-rational-map`) -/

section Resultant

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The resultant `Res_{m,n}(F, G)` of binary forms of formal degrees `m` and `n`: Mathlib's
resultant of the dehomogenisations `F(X, 1)`, `G(X, 1)` with formal degrees `m, n`. For `m = n = d`
it is the Sylvester determinant of Silverman, Milnor and Rumely. -/
noncomputable def binaryResultant (m n : ℕ) (F G : MvPolynomial (Fin 2) R) : R :=
  Polynomial.resultant (MvPolynomial.aeval ![Polynomial.X, 1] F)
    (MvPolynomial.aeval ![Polynomial.X, 1] G) m n

theorem binaryResultant_homogenize (m n : ℕ) (f g : Polynomial R) (hf : f.natDegree ≤ m)
    (hg : g.natDegree ≤ n) :
    binaryResultant m n (f.homogenize m) (g.homogenize n) = Polynomial.resultant f g m n := sorry

theorem binaryResultant_smul_left (m n : ℕ) (c : R) (F G : MvPolynomial (Fin 2) R) :
    binaryResultant m n (c • F) G = c ^ n * binaryResultant m n F G := sorry

theorem binaryResultant_smul_right (m n : ℕ) (c : R) (F G : MvPolynomial (Fin 2) R) :
    binaryResultant m n F (c • G) = c ^ m * binaryResultant m n F G := sorry

theorem binaryResultant_smul_smul (d : ℕ) (c : R) (F G : MvPolynomial (Fin 2) R) :
    binaryResultant d d (c • F) (c • G) = c ^ (2 * d) * binaryResultant d d F G := sorry

theorem binaryResultant_comm (m n : ℕ) (F G : MvPolynomial (Fin 2) R) :
    binaryResultant m n F G = (-1) ^ (m * n) * binaryResultant n m G F := sorry

theorem binaryResultant_map (m n : ℕ) (φ : R →+* S) (F G : MvPolynomial (Fin 2) R) :
    binaryResultant m n (MvPolynomial.map φ F) (MvPolynomial.map φ G) =
      φ (binaryResultant m n F G) := sorry

theorem binaryResultant_zero_left {m n : ℕ} (hn : n ≠ 0) (G : MvPolynomial (Fin 2) R) :
    binaryResultant m n 0 G = 0 := sorry

theorem binaryResultant_X_pow_X_pow (d : ℕ) :
    binaryResultant d d (MvPolynomial.X 0 ^ d : MvPolynomial (Fin 2) R) (MvPolynomial.X 1 ^ d) =
      1 := sorry

theorem binaryResultant_toTupleMvPolynomial (p : Polynomial R) :
    binaryResultant p.natDegree p.natDegree (p.toTupleMvPolynomial 0) (p.toTupleMvPolynomial 1) =
      p.leadingCoeff ^ p.natDegree := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryResultant_linear`: for linear forms the resultant
is the determinant (Milnor, Appendix A). -/
example (a b c e : R) :
    binaryResultant 1 1
      (MvPolynomial.C a * MvPolynomial.X 0 + MvPolynomial.C b * MvPolynomial.X 1)
      (MvPolynomial.C c * MvPolynomial.X 0 + MvPolynomial.C e * MvPolynomial.X 1) =
      a * e - b * c := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryResultant_X_sq_add_two_Y_sq`: the displayed
resultant of `(X² + 2Y², XY)`, the lift of `z ↦ (z² + 2)/z`, is `2`. -/
example : binaryResultant 2 2
    (MvPolynomial.X 0 ^ 2 + 2 * MvPolynomial.X 1 ^ 2 : MvPolynomial (Fin 2) ℤ)
    (MvPolynomial.X 0 * MvPolynomial.X 1) = 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryResultant_Y_pow_X_pow`: swapping the forms of
`(X^d, Y^d)` gives `(-1)^d`, pinning the orientation of the Sylvester matrix. -/
example (d : ℕ) :
    binaryResultant d d (MvPolynomial.X 1 ^ d : MvPolynomial (Fin 2) ℤ) (MvPolynomial.X 0 ^ d) =
      (-1) ^ d := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryResultant_X_X`: two proportional linear forms have
resultant `0` (common zero `[0 : 1]`). -/
example : binaryResultant 1 1 (MvPolynomial.X 0 : MvPolynomial (Fin 2) R) (MvPolynomial.X 0) = 0 :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryResultant_zero_degree`: in formal degree `(0, 0)`
the resultant is the empty determinant `1`, even for the pair `(0, 0)`. -/
example : binaryResultant 0 0 (0 : MvPolynomial (Fin 2) R) 0 = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryResultant_quadratic_silverman`: for quadratic forms
the resultant is Silverman's polynomial (AWS notes, Example 23). -/
example (a₀ a₁ a₂ b₀ b₁ b₂ : R) :
    binaryResultant 2 2
      (MvPolynomial.C a₀ * MvPolynomial.X 1 ^ 2 + MvPolynomial.C a₁ * MvPolynomial.X 0 *
        MvPolynomial.X 1 + MvPolynomial.C a₂ * MvPolynomial.X 0 ^ 2)
      (MvPolynomial.C b₀ * MvPolynomial.X 1 ^ 2 + MvPolynomial.C b₁ * MvPolynomial.X 0 *
        MvPolynomial.X 1 + MvPolynomial.C b₂ * MvPolynomial.X 0 ^ 2) =
      a₂ ^ 2 * b₀ ^ 2 - a₂ * a₁ * b₁ * b₀ + a₁ ^ 2 * b₂ * b₀ - 2 * a₂ * a₀ * b₂ * b₀ +
        a₂ * a₀ * b₁ ^ 2 - a₁ * a₀ * b₂ * b₁ + a₀ ^ 2 * b₂ ^ 2 := sorry

/-- `DY.0/binary-resultant-mul`: bimultiplicativity with formal degrees (Milnor, Appendix A). -/
theorem binaryResultant_mul_left {m₁ m₂ n : ℕ} {F₁ F₂ G : MvPolynomial (Fin 2) R}
    (h₁ : F₁.IsHomogeneous m₁) (h₂ : F₂.IsHomogeneous m₂) (hG : G.IsHomogeneous n) :
    binaryResultant (m₁ + m₂) n (F₁ * F₂) G =
      binaryResultant m₁ n F₁ G * binaryResultant m₂ n F₂ G := sorry

theorem binaryResultant_mul_right {m n₁ n₂ : ℕ} {F G₁ G₂ : MvPolynomial (Fin 2) R}
    (hF : F.IsHomogeneous m) (h₁ : G₁.IsHomogeneous n₁) (h₂ : G₂.IsHomogeneous n₂) :
    binaryResultant m (n₁ + n₂) F (G₁ * G₂) =
      binaryResultant m n₁ F G₁ * binaryResultant m n₂ F G₂ := sorry

/-- `DY.0/binary-form-factorisation`: over an algebraically closed field a nonzero binary form of
degree `n` is a product of `n` linear forms. -/
theorem exists_prod_linear_of_isHomogeneous {K : Type*} [Field K] [IsAlgClosed K] {n : ℕ}
    {G : MvPolynomial (Fin 2) K} (hG : G.IsHomogeneous n) (hG0 : G ≠ 0) :
    ∃ ℓ : Fin n → Fin 2 → K, (∀ i, ℓ i ≠ 0) ∧
      G = ∏ i, (MvPolynomial.C (ℓ i 0) * MvPolynomial.X 0 + MvPolynomial.C (ℓ i 1) *
        MvPolynomial.X 1) := sorry

/-- `DY.0/binary-resultant-eq-zero-iff`: over a field, for `d ≥ 1` and forms of degree `d`, the
resultant vanishes exactly when the forms have a common nontrivial zero over an algebraic
closure (Milnor, Appendix A; Silverman, AWS notes §6.1). -/
theorem binaryResultant_eq_zero_iff {K : Type*} [Field K] {d : ℕ} (hd : 1 ≤ d)
    {F₀ F₁ : MvPolynomial (Fin 2) K} (h₀ : F₀.IsHomogeneous d) (h₁ : F₁.IsHomogeneous d) :
    binaryResultant d d F₀ F₁ = 0 ↔
      ∃ x : Fin 2 → AlgebraicClosure K, x ≠ 0 ∧
        MvPolynomial.aeval x F₀ = 0 ∧ MvPolynomial.aeval x F₁ = 0 := sorry

/-- `DY.0/resultant-certificate`: the Nullstellensatz certificate. For binary forms of degree
`d ≥ 1` there are forms `G k j` of degree `d - 1` with `∑ j, G k j * F j = Res · X k ^ (2d - 1)`. -/
theorem exists_resultant_certificate {d : ℕ} (hd : 1 ≤ d) {F : Fin 2 → MvPolynomial (Fin 2) R}
    (hF : ∀ i, (F i).IsHomogeneous d) :
    ∃ G : Fin 2 × Fin 2 → MvPolynomial (Fin 2) R, (∀ a, (G a).IsHomogeneous (d - 1)) ∧
      ∀ k, ∑ j, G (k, j) * F j =
        MvPolynomial.C (binaryResultant d d (F 0) (F 1)) * MvPolynomial.X k ^ (2 * d - 1) := sorry

/-- `DY.0/resultant-postcomp-linear`: composing on the left with a matrix multiplies the resultant
by `det ^ d`. -/
theorem binaryResultant_linearCombination {d : ℕ} (A : Matrix (Fin 2) (Fin 2) R)
    {F : Fin 2 → MvPolynomial (Fin 2) R} (hF : ∀ i, (F i).IsHomogeneous d) :
    binaryResultant d d (∑ j, MvPolynomial.C (A 0 j) * F j)
        (∑ j, MvPolynomial.C (A 1 j) * F j) =
      A.det ^ d * binaryResultant d d (F 0) (F 1) := sorry

/-- The linear substitution `X ↦ A X` of binary forms. -/
noncomputable def linearSubst (A : Matrix (Fin 2) (Fin 2) R) :
    MvPolynomial (Fin 2) R →ₐ[R] MvPolynomial (Fin 2) R :=
  MvPolynomial.aeval fun i ↦ ∑ j, MvPolynomial.C (A i j) * MvPolynomial.X j

/-- `DY.0/resultant-precomp-linear`: substituting `X ↦ A X` multiplies the resultant by
`det ^ (d²)`. -/
theorem binaryResultant_linearSubst {d : ℕ} (A : Matrix (Fin 2) (Fin 2) R)
    {F : Fin 2 → MvPolynomial (Fin 2) R} (hF : ∀ i, (F i).IsHomogeneous d) :
    binaryResultant d d (linearSubst A (F 0)) (linearSubst A (F 1)) =
      A.det ^ (d * d) * binaryResultant d d (F 0) (F 1) := sorry

/-- `DY.0/resultant-conj`: Rumely's homogeneous conjugate `adj(γ) ∘ F ∘ γ` has resultant
`det(γ) ^ (d² + d) · Res(F)` (Rumely, The minimal resultant locus, (7)–(8)). -/
theorem binaryResultant_conj {d : ℕ} (A : Matrix (Fin 2) (Fin 2) R)
    {F : Fin 2 → MvPolynomial (Fin 2) R} (hF : ∀ i, (F i).IsHomogeneous d) :
    binaryResultant d d
        (∑ j, MvPolynomial.C (A.adjugate 0 j) * linearSubst A (F j))
        (∑ j, MvPolynomial.C (A.adjugate 1 j) * linearSubst A (F j)) =
      A.det ^ (d * d + d) * binaryResultant d d (F 0) (F 1) := sorry

end Resultant

/-! ### Homogeneous lifts and rational maps (`DY.0/homogeneous-lift`,
`DY.0/rational-map-of-the-projective-line`) -/

section RationalMaps

variable (K : Type*) [Field K]

/-- A homogeneous lift of a degree-`d` self-map of `ℙ¹`: two binary forms of degree `d` with
nonzero resultant (and not both zero, which only matters for `d = 0`). -/
structure HomogeneousLift (d : ℕ) where
  /-- The two forms `(F₀, F₁)`. -/
  forms : Fin 2 → MvPolynomial (Fin 2) K
  isHomogeneous : ∀ i, (forms i).IsHomogeneous d
  forms_ne_zero : forms ≠ 0
  binaryResultant_ne_zero : binaryResultant d d (forms 0) (forms 1) ≠ 0

variable {K}

namespace HomogeneousLift

variable {d e : ℕ}

/-- Evaluation of a lift on a vector of `K²`. -/
noncomputable def eval (F : HomogeneousLift K d) (x : Fin 2 → K) : Fin 2 → K :=
  fun i ↦ MvPolynomial.eval x (F.forms i)

theorem eval_ne_zero (F : HomogeneousLift K d) {x : Fin 2 → K} (hx : x ≠ 0) : F.eval x ≠ 0 :=
  sorry

theorem eval_smul (F : HomogeneousLift K d) (c : K) (x : Fin 2 → K) :
    F.eval (c • x) = c ^ d • F.eval x := sorry

/-- Scaling a lift by a nonzero constant. -/
noncomputable def smul (c : Kˣ) (F : HomogeneousLift K d) : HomogeneousLift K d := sorry

theorem smul_forms (c : Kˣ) (F : HomogeneousLift K d) : (smul c F).forms = (c : K) • F.forms :=
  sorry

/-- The identity lift `(X₀, X₁)`. -/
noncomputable def id : HomogeneousLift K 1 := sorry

/-- The lift `(p(X₀/X₁) X₁^n, X₁^n)` of a polynomial of degree `n`, from Mathlib's
`Polynomial.toTupleMvPolynomial` (for `p = 0` the constant pair `(0, 1)`). -/
noncomputable def ofPolynomial (p : Polynomial K) : HomogeneousLift K p.natDegree := sorry

theorem ofPolynomial_forms (p : Polynomial K) :
    (ofPolynomial p).forms = p.toTupleMvPolynomial := sorry

/-- The linear lift attached to an invertible matrix. -/
noncomputable def ofGL (γ : GL (Fin 2) K) : HomogeneousLift K 1 := sorry

/-- Base change of a lift along a field homomorphism. -/
noncomputable def map {L : Type*} [Field L] (σ : K →+* L) (F : HomogeneousLift K d) :
    HomogeneousLift L d := sorry

theorem map_forms {L : Type*} [Field L] (σ : K →+* L) (F : HomogeneousLift K d) (i : Fin 2) :
    (F.map σ).forms i = MvPolynomial.map σ (F.forms i) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.HomogeneousLift.X_sq_Y_sq`: `(X², Y²)` is a lift of
degree `2` (its resultant is `1`). -/
example : ∃ F : HomogeneousLift ℚ 2, F.forms = ![MvPolynomial.X 0 ^ 2, MvPolynomial.X 1 ^ 2] :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.HomogeneousLift.not_X_sq_XY`: `(X², XY)` is not a lift:
the forms share the zero `[0 : 1]` and the resultant vanishes. -/
example : ¬ ∃ F : HomogeneousLift ℚ 2,
    F.forms = ![MvPolynomial.X 0 ^ 2, MvPolynomial.X 0 * MvPolynomial.X 1] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.HomogeneousLift.zero_degree`: a degree-`0` lift is a
nonzero pair of constants, i.e. a point of `ℙ¹(K)`. -/
example (F : HomogeneousLift K 0) :
    ∃ a b : K, (a, b) ≠ (0, 0) ∧ F.forms = ![MvPolynomial.C a, MvPolynomial.C b] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.HomogeneousLift.eval_X_sq_add_two`: the lift of
`(z² + 2)/z` sends `(1, 1)` to `(3, 1)`. -/
example (F : HomogeneousLift ℚ 2)
    (hF : F.forms = ![MvPolynomial.X 0 ^ 2 + 2 * MvPolynomial.X 1 ^ 2,
      MvPolynomial.X 0 * MvPolynomial.X 1]) : F.eval ![1, 1] = ![3, 1] := sorry

/-- `DY.0/homogeneous-lift-comp`: composition of lifts, `(F ∘ G)_i = F_i(G₀, G₁)`. The composite
has nonzero resultant because a common zero of `F ∘ G` would give a common zero of `F` at
`G(x) ≠ 0`. -/
noncomputable def comp (F : HomogeneousLift K d) (G : HomogeneousLift K e) :
    HomogeneousLift K (d * e) := sorry

theorem comp_forms (F : HomogeneousLift K d) (G : HomogeneousLift K e) (i : Fin 2) :
    (F.comp G).forms i = MvPolynomial.aeval G.forms (F.forms i) := sorry

theorem eval_comp (F : HomogeneousLift K d) (G : HomogeneousLift K e) (x : Fin 2 → K) :
    (F.comp G).eval x = F.eval (G.eval x) := sorry

theorem comp_assoc {f : ℕ} (F : HomogeneousLift K d) (G : HomogeneousLift K e)
    (H : HomogeneousLift K f) :
    ((F.comp G).comp H).forms = (F.comp (G.comp H)).forms := sorry

theorem id_comp (F : HomogeneousLift K d) : (id.comp F).forms = F.forms := sorry

theorem comp_id (F : HomogeneousLift K d) : (F.comp id).forms = F.forms := sorry

theorem smul_comp (c : Kˣ) (F : HomogeneousLift K d) (G : HomogeneousLift K e) :
    ((smul c F).comp G).forms = (c : K) • (F.comp G).forms := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.HomogeneousLift.comp_X_sq`: `(X², Y²) ∘ (X², Y²) =
(X⁴, Y⁴)`. -/
example (F : HomogeneousLift ℚ 2)
    (hF : F.forms = ![MvPolynomial.X 0 ^ 2, MvPolynomial.X 1 ^ 2]) :
    (F.comp F).forms = ![MvPolynomial.X 0 ^ 4, MvPolynomial.X 1 ^ 4] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.HomogeneousLift.comp_degree`: the degree of a composite
is the product of the degrees (it is the type index `d * e`), e.g. `2 * 3 = 6`. -/
example (F : HomogeneousLift ℚ 2) (G : HomogeneousLift ℚ 3) :
    ∀ i, ((F.comp G).forms i).IsHomogeneous 6 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.HomogeneousLift.comp_not_comm`: composition is not
commutative: `(X², Y²) ∘ (X + Y, Y) ≠ (X + Y, Y) ∘ (X², Y²)` (that is, `(z+1)² ≠ z² + 1`). -/
example (F : HomogeneousLift ℚ 2) (G : HomogeneousLift ℚ 1)
    (hF : F.forms = ![MvPolynomial.X 0 ^ 2, MvPolynomial.X 1 ^ 2])
    (hG : G.forms = ![MvPolynomial.X 0 + MvPolynomial.X 1, MvPolynomial.X 1]) :
    (F.comp G).forms ≠ (G.comp F).forms := sorry

end HomogeneousLift

/-- Two lifts are equivalent when they have the same degree and are proportional. -/
def liftSetoid (K : Type*) [Field K] : Setoid (Σ d, HomogeneousLift K d) where
  r F G := F.1 = G.1 ∧ ∃ c : K, c ≠ 0 ∧ G.2.forms = c • F.2.forms
  iseqv := sorry

/-- A rational self-map of `ℙ¹` over `K`: a homogeneous lift up to scaling. Its degree is part of
the data; `RationalMap K` is a monoid under composition. -/
def RationalMap (K : Type*) [Field K] : Type _ :=
  Quotient (liftSetoid K)

namespace RationalMap

/-- The rational map with a given lift. -/
def mk {d : ℕ} (F : HomogeneousLift K d) : RationalMap K :=
  Quotient.mk (liftSetoid K) ⟨d, F⟩

/-- The degree of a rational map. -/
def degree (f : RationalMap K) : ℕ := sorry

theorem degree_mk {d : ℕ} (F : HomogeneousLift K d) : (mk F).degree = d := sorry

theorem mk_eq_mk_iff {d : ℕ} (F G : HomogeneousLift K d) :
    mk F = mk G ↔ ∃ c : K, c ≠ 0 ∧ G.forms = c • F.forms := sorry

theorem exists_mk_eq (f : RationalMap K) : ∃ F : HomogeneousLift K f.degree, mk F = f := sorry

noncomputable instance instMonoid : Monoid (RationalMap K) := sorry

theorem mk_comp {d e : ℕ} (F : HomogeneousLift K d) (G : HomogeneousLift K e) :
    mk (F.comp G) = mk F * mk G := sorry

theorem one_eq_mk_id : (1 : RationalMap K) = mk HomogeneousLift.id := sorry

theorem degree_mul (f g : RationalMap K) : (f * g).degree = f.degree * g.degree := sorry

theorem degree_one : (1 : RationalMap K).degree = 1 := sorry

theorem degree_pow (f : RationalMap K) (n : ℕ) : (f ^ n).degree = f.degree ^ n := sorry

/-- The polynomial map `z ↦ p(z)`. -/
noncomputable def ofPolynomial (p : Polynomial K) : RationalMap K := sorry

theorem degree_ofPolynomial (p : Polynomial K) : (ofPolynomial p).degree = p.natDegree := sorry

theorem mk_ofPolynomial (p : Polynomial K) : mk (HomogeneousLift.ofPolynomial p) = ofPolynomial p :=
  sorry

theorem ofPolynomial_comp (p q : Polynomial K) :
    ofPolynomial (p.comp q) = ofPolynomial p * ofPolynomial q := sorry

/-- The rational function `F₀(X, 1) / F₁(X, 1)` of a rational map, in Mathlib's `RatFunc`. -/
noncomputable def toRatFunc (f : RationalMap K) : RatFunc K := sorry

theorem toRatFunc_injOn : Set.InjOn (toRatFunc (K := K)) {f | 1 ≤ f.degree} := sorry

theorem toRatFunc_ofPolynomial (p : Polynomial K) :
    (ofPolynomial p).toRatFunc = algebraMap (Polynomial K) (RatFunc K) p := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.degree_ofPolynomial_sq`: `z ↦ z²` has
degree `2`. -/
example : (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).degree = 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.pow_ofPolynomial_sq`: the `n`-th power of
`z ↦ z²` in the monoid is `z ↦ z^(2^n)`, an equality of rational maps. -/
example (n : ℕ) : ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ) ^ n =
    ofPolynomial (Polynomial.X ^ (2 ^ n)) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.degree_zero_constants`: degree-`0` maps are
the constants, one for each point of `ℙ¹(K)`. -/
example : Nonempty ({f : RationalMap K // f.degree = 0} ≃ ℙ K (Fin 2 → K)) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.toRatFunc_X_sq_add_two`: the map with lift
`(X² + 2Y², XY)` is the rational function `(X² + 2)/X`. -/
example (F : HomogeneousLift ℚ 2)
    (hF : F.forms = ![MvPolynomial.X 0 ^ 2 + 2 * MvPolynomial.X 1 ^ 2,
      MvPolynomial.X 0 * MvPolynomial.X 1]) :
    (mk F).toRatFunc = (RatFunc.X ^ 2 + 2) / RatFunc.X := sorry

/-! #### The action on points (`DY.0/rational-map-action-on-points`) -/

/-- The action of rational maps on `ℙ¹(K)`, `[x] ↦ [F(x)]`, as a monoid homomorphism to
`Function.End`: composition of maps is composition of functions. -/
noncomputable def toEnd : RationalMap K →* Function.End (ℙ K (Fin 2 → K)) := sorry

theorem toEnd_mk_apply {d : ℕ} (F : HomogeneousLift K d) {x : Fin 2 → K} (hx : x ≠ 0) :
    toEnd (mk F) (Projectivization.mk K x hx) =
      Projectivization.mk K (F.eval x) (F.eval_ne_zero hx) := sorry

theorem toEnd_mul (f g : RationalMap K) (P : ℙ K (Fin 2 → K)) :
    toEnd (f * g) P = toEnd f (toEnd g P) := sorry

theorem toEnd_pow (f : RationalMap K) (n : ℕ) :
    (toEnd (f ^ n) : ℙ K (Fin 2 → K) → ℙ K (Fin 2 → K)) =
      (toEnd f : ℙ K (Fin 2 → K) → ℙ K (Fin 2 → K))^[n] := sorry

theorem toEnd_injective [Infinite K] : Function.Injective (toEnd (K := K)) := sorry

theorem toEnd_ofPolynomial_mk_one (p : Polynomial K) (x : K) :
    toEnd (ofPolynomial p) (Projectivization.mk K ![x, 1] (by simp)) =
      Projectivization.mk K ![p.eval x, 1] (by simp) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.toEnd_sq_two`: `z ↦ z²` sends `[2 : 1]` to
`[4 : 1]` in `ℙ¹(ℚ)`. -/
example : toEnd (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ))
    (Projectivization.mk ℚ ![2, 1] (by simp)) = Projectivization.mk ℚ ![4, 1] (by simp) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.toEnd_sq_infty`: a polynomial of degree
`≥ 1` fixes `∞ = [1 : 0]`. -/
example : toEnd (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ))
    (Projectivization.mk ℚ ![1, 0] (by simp)) = Projectivization.mk ℚ ![1, 0] (by simp) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.toEnd_frobenius`: over `𝔽_p`, `z ↦ z^p` and
the identity induce the same map on `ℙ¹(𝔽_p)` but are different rational maps: equality of
iterates is equality of maps, not of their values on points. -/
example (p : ℕ) [Fact p.Prime] :
    toEnd (ofPolynomial (K := ZMod p) (Polynomial.X ^ p)) = toEnd 1 ∧
      ofPolynomial (K := ZMod p) (Polynomial.X ^ p) ≠ 1 := sorry

/-! #### Units, `PGL₂` and base change (`DY.0/units-of-rational-maps`,
`DY.0/rational-map-base-change`) -/

/-- The units of the monoid of rational maps are the degree-one maps, and form `PGL₂(K)`. -/
noncomputable def unitsEquivPGL : (RationalMap K)ˣ ≃* PGL(2, K) := sorry

theorem isUnit_iff_degree_eq_one (f : RationalMap K) : IsUnit f ↔ f.degree = 1 := sorry

theorem toEnd_units_apply (γ : (RationalMap K)ˣ) (P : ℙ K (Fin 2 → K)) :
    toEnd (γ : RationalMap K) P = unitsEquivPGL γ • P := sorry

theorem unitsEquivPGL_symm_mk (γ : GL (Fin 2) K) :
    ((unitsEquivPGL.symm (Matrix.ProjGenLinGroup.mk γ) : (RationalMap K)ˣ) : RationalMap K) =
      mk (HomogeneousLift.ofGL γ) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.unitsEquivPGL_inv_z`: `z ↦ 1/z`, with lift
`(X₁, X₀)`, is a unit of order two. -/
example : ∃ γ : (RationalMap ℚ)ˣ, γ ≠ 1 ∧ γ ^ 2 = 1 ∧ ∀ x : ℚ, x ≠ 0 →
    toEnd (γ : RationalMap ℚ) (Projectivization.mk ℚ ![x, 1] (by simp)) =
      Projectivization.mk ℚ ![x⁻¹, 1] (by simp) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.not_isUnit_sq`: `z ↦ z²` is not a unit. -/
example : ¬ IsUnit (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.translation_infinite_order`: over `ℚ` the
translation `z ↦ z + 1` is a unit of infinite order. -/
example : IsUnit (ofPolynomial (Polynomial.X + 1 : Polynomial ℚ)) ∧
    ¬ IsOfFinOrder (ofPolynomial (Polynomial.X + 1 : Polynomial ℚ)) := sorry

/-- The map `ℙ¹(K) → ℙ¹(L)` induced by a field homomorphism. -/
noncomputable def projMap {L : Type*} [Field L] (σ : K →+* L) :
    ℙ K (Fin 2 → K) → ℙ L (Fin 2 → L) := sorry

theorem projMap_mk {L : Type*} [Field L] (σ : K →+* L) {x : Fin 2 → K} (hx : x ≠ 0) :
    projMap σ (Projectivization.mk K x hx) =
      Projectivization.mk L (fun i ↦ σ (x i)) (by sorry) := sorry

/-- Base change of rational maps along a field homomorphism. -/
noncomputable def map {L : Type*} [Field L] (σ : K →+* L) : RationalMap K →* RationalMap L :=
  sorry

theorem map_mk {L : Type*} [Field L] (σ : K →+* L) {d : ℕ} (F : HomogeneousLift K d) :
    map σ (mk F) = mk (F.map σ) := sorry

theorem degree_map {L : Type*} [Field L] (σ : K →+* L) (f : RationalMap K) :
    (map σ f).degree = f.degree := sorry

theorem toEnd_map_projMap {L : Type*} [Field L] (σ : K →+* L) (f : RationalMap K)
    (P : ℙ K (Fin 2 → K)) :
    toEnd (map σ f) (projMap σ P) = projMap σ (toEnd f P) := sorry

theorem map_injective {L : Type*} [Field L] (σ : K →+* L) :
    Function.Injective (map (K := K) σ) := sorry

theorem projMap_injective {L : Type*} [Field L] (σ : K →+* L) :
    Function.Injective (projMap (K := K) σ) := sorry

theorem exists_map_eq_of_isAlgebraic {F : Type*} [Field F] [Algebra ℚ F]
    [Algebra.IsAlgebraic ℚ F] (f : RationalMap F) :
    ∃ (L : IntermediateField ℚ F) (_ : FiniteDimensional ℚ L) (g : RationalMap L),
      map (algebraMap L F) g = f := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.map_ofPolynomial`: base change of a
polynomial map is the polynomial map of the mapped polynomial. -/
example {L : Type*} [Field L] (σ : K →+* L) (p : Polynomial K) :
    map σ (ofPolynomial p) = ofPolynomial (p.map σ) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.toEnd_map_sq_I`: after base change to `ℚ̄`,
`z ↦ z²` sends a square root `i` of `-1` to `-1`: base change sees new points. -/
example : toEnd (map (algebraMap ℚ (AlgebraicClosure ℚ))
      (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)))
    (Projectivization.mk _ ![(IsAlgClosed.exists_pow_nat_eq (-1 : AlgebraicClosure ℚ)
      (by norm_num : 0 < 2)).choose, 1] (by simp)) =
    Projectivization.mk _ ![-1, 1] (by simp) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.map_id_eq`: base change along the identity
is the identity. -/
example (f : RationalMap K) : map (RingHom.id K) f = f := sorry

/-! #### Conjugacy and moduli (`DY.0/conjugacy-of-rational-maps`,
`DY.0/moduli-space-of-rational-maps`) -/

/-- Conjugation `γ • f = γ ∘ f ∘ γ⁻¹` by `PGL₂(K)`, through `unitsEquivPGL` and `ConjAct`. Two
rational maps are conjugate exactly when they are `IsConj` in the monoid `RationalMap K`. -/
noncomputable instance instMulActionPGL : MulAction PGL(2, K) (RationalMap K) := sorry

theorem smul_def (γ : PGL(2, K)) (f : RationalMap K) :
    γ • f = (unitsEquivPGL.symm γ : RationalMap K) * f *
      ((unitsEquivPGL.symm γ)⁻¹ : (RationalMap K)ˣ) := sorry

theorem isConj_iff_exists_smul (f g : RationalMap K) :
    IsConj f g ↔ ∃ γ : PGL(2, K), γ • f = g := sorry

theorem degree_smul (γ : PGL(2, K)) (f : RationalMap K) : (γ • f).degree = f.degree := sorry

theorem toEnd_smul_apply (γ : PGL(2, K)) (f : RationalMap K) (P : ℙ K (Fin 2 → K)) :
    toEnd (γ • f) (γ • P) = γ • toEnd f P := sorry

theorem smul_mk (γ : GL (Fin 2) K) {d : ℕ} (F : HomogeneousLift K d) :
    ∃ G : HomogeneousLift K d,
      Matrix.ProjGenLinGroup.mk γ • mk F = mk G ∧
      ∀ i, G.forms i = ∑ j, MvPolynomial.C ((γ : Matrix (Fin 2) (Fin 2) K) i j) *
        linearSubst ((γ : Matrix (Fin 2) (Fin 2) K).adjugate) (F.forms j) := sorry

theorem isPreperiodicPt_smul_iff (γ : PGL(2, K)) (f : RationalMap K) (P : ℙ K (Fin 2 → K)) :
    IsPreperiodicPt (toEnd (γ • f)) (γ • P) ↔ IsPreperiodicPt (toEnd f) P := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.smul_sq_translation`: conjugating `z²` by
`z ↦ z + 1` gives `z² - 2z + 2`. -/
example : ∃ γ : PGL(2, ℚ), γ • ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ) =
    ofPolynomial (Polynomial.X ^ 2 - 2 * Polynomial.X + 2) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.smul_sq_inv`: conjugating `z²` by
`z ↦ 1/z` gives `z²` again. -/
example : ∃ γ : PGL(2, ℚ), γ ≠ 1 ∧ γ • ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ) =
    ofPolynomial (Polynomial.X ^ 2) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.not_isConj_sq_sq_add_one`: `z²` and `z² + 1`
are not conjugate over `ℚ`: the first has three `ℚ`-rational fixed points, the second one. -/
example : ¬ IsConj (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ))
    (ofPolynomial (Polynomial.X ^ 2 + 1)) := sorry

/-- Degree of a conjugacy class. -/
noncomputable def conjDegree : ConjClasses (RationalMap K) → ℕ := sorry

end RationalMap

/-- The moduli space `M_d(K)`: conjugacy classes of degree-`d` rational maps over `K`. For `K`
algebraically closed these are the `K`-points of Silverman's geometric quotient
`Rat_d / PGL₂`; its scheme structure is a gap recorded in the packet. -/
def ModuliSpace (K : Type*) [Field K] (d : ℕ) : Type _ :=
  {c : ConjClasses (RationalMap K) // RationalMap.conjDegree c = d}

namespace ModuliSpace

variable {d : ℕ}

/-- The class of a degree-`d` map. -/
noncomputable def mk (f : RationalMap K) (hf : f.degree = d) : ModuliSpace K d := sorry

theorem mk_eq_mk_iff {f g : RationalMap K} (hf : f.degree = d) (hg : g.degree = d) :
    mk f hf = mk g hg ↔ IsConj f g := sorry

theorem mk_surjective (c : ModuliSpace K d) : ∃ f hf, mk (d := d) f hf = c := sorry

/-- Base change `M_d(K) → M_d(L)`. -/
noncomputable def map {L : Type*} [Field L] (σ : K →+* L) : ModuliSpace K d → ModuliSpace L d :=
  sorry

theorem map_mk {L : Type*} [Field L] (σ : K →+* L) (f : RationalMap K) (hf : f.degree = d) :
    map σ (mk f hf) = mk (RationalMap.map σ f) ((RationalMap.degree_map σ f).trans hf) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.ModuliSpace.subsingleton_zero`: `M₀(K)` is a point
(`PGL₂(K)` is transitive on the constants). -/
example : Subsingleton (ModuliSpace K 0) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.ModuliSpace.twist`: `1/z²` and `2/z²` define different
points of `M₂(ℚ)` that become equal in `M₂(ℚ̄)`: `M_d(K)` for non-closed `K` sees twists. -/
example (f g : RationalMap ℚ) (hf : f.degree = 2) (hg : g.degree = 2)
    (hf' : f.toRatFunc = 1 / RatFunc.X ^ 2) (hg' : g.toRatFunc = 2 / RatFunc.X ^ 2) :
    mk f hf ≠ mk g hg ∧
      map (algebraMap ℚ (AlgebraicClosure ℚ)) (mk f hf) =
        map (algebraMap ℚ (AlgebraicClosure ℚ)) (mk g hg) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.ModuliSpace.sq_ne_sq_add_one`: `z²` and `z² + 1` are
different points of `M₂(ℚ)`. -/
example (hf : (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).degree = 2)
    (hg : (RationalMap.ofPolynomial (Polynomial.X ^ 2 + 1 : Polynomial ℚ)).degree = 2) :
    mk _ hf ≠ mk _ hg := sorry

end ModuliSpace

/-! #### Roots of binary forms, fixed points and multipliers -/

/-- `DY.0/roots-of-a-binary-form`: the zeros in `ℙ¹(K)` of a binary form of degree `n`, with
multiplicity: the roots of `G(X, 1)` and `∞` with multiplicity `n - deg G(X, 1)`. -/
noncomputable def binaryRoots (n : ℕ) (G : MvPolynomial (Fin 2) K) :
    Multiset (ℙ K (Fin 2 → K)) := sorry

theorem mem_binaryRoots_iff {n : ℕ} {G : MvPolynomial (Fin 2) K} (hG : G.IsHomogeneous n)
    (hG0 : G ≠ 0) {x : Fin 2 → K} (hx : x ≠ 0) :
    Projectivization.mk K x hx ∈ binaryRoots n G ↔ MvPolynomial.eval x G = 0 := sorry

theorem card_binaryRoots [IsAlgClosed K] {n : ℕ} {G : MvPolynomial (Fin 2) K}
    (hG : G.IsHomogeneous n) (hG0 : G ≠ 0) : Multiset.card (binaryRoots n G) = n := sorry

theorem binaryRoots_mul {m n : ℕ} {G H : MvPolynomial (Fin 2) K} (hG : G.IsHomogeneous m)
    (hH : H.IsHomogeneous n) (hGH : G * H ≠ 0) :
    binaryRoots (m + n) (G * H) = binaryRoots m G + binaryRoots n H := sorry

theorem binaryRoots_smul {n : ℕ} (c : K) (hc : c ≠ 0) (G : MvPolynomial (Fin 2) K) :
    binaryRoots n (c • G) = binaryRoots n G := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryRoots_X_mul_Y_sq`: the form `X₀ X₁²` of degree `3`
has the roots `[0 : 1]` once and `∞` twice. -/
example : binaryRoots 3 (MvPolynomial.X 0 * MvPolynomial.X 1 ^ 2 : MvPolynomial (Fin 2) ℚ) =
    {Projectivization.mk ℚ ![0, 1] (by simp), Projectivization.mk ℚ ![1, 0] (by simp),
      Projectivization.mk ℚ ![1, 0] (by simp)} := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryRoots_Y_pow`: `X₁ ^ n` has `∞` as an `n`-fold
root, although its dehomogenisation `1` has no roots. -/
example (n : ℕ) : binaryRoots n (MvPolynomial.X 1 ^ n : MvPolynomial (Fin 2) ℚ) =
    Multiset.replicate n (Projectivization.mk ℚ ![1, 0] (by simp)) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryRoots_irreducible`: `X₀² + X₁²` has no roots in
`ℙ¹(ℚ)` (so `card_binaryRoots` needs `IsAlgClosed`). -/
example : binaryRoots 2 (MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2 : MvPolynomial (Fin 2) ℚ) =
    0 := sorry

namespace RationalMap

/-- `DY.0/fixed-points-of-a-rational-map`: the fixed points of `f`, with multiplicity: the roots of
the fixed-point form `X₁ F₀ - X₀ F₁` of degree `d + 1`. -/
noncomputable def fixedPoints (f : RationalMap K) : Multiset (ℙ K (Fin 2 → K)) := sorry

theorem mem_fixedPoints_iff {f : RationalMap K} (hf : 2 ≤ f.degree) (P : ℙ K (Fin 2 → K)) :
    P ∈ f.fixedPoints ↔ toEnd f P = P := sorry

theorem card_fixedPoints [IsAlgClosed K] {f : RationalMap K} (hf : 2 ≤ f.degree) :
    Multiset.card f.fixedPoints = f.degree + 1 := sorry

theorem fixedPoints_smul (γ : PGL(2, K)) (f : RationalMap K) :
    (γ • f).fixedPoints = f.fixedPoints.map (γ • ·) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.fixedPoints_sq`: the fixed points of `z²`
are `0`, `1` and `∞`. -/
example : (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).fixedPoints =
    {Projectivization.mk ℚ ![0, 1] (by simp), Projectivization.mk ℚ ![1, 1] (by simp),
      Projectivization.mk ℚ ![1, 0] (by simp)} := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.fixedPoints_translation`: the translation
`z ↦ z + 1` has the single fixed point `∞`, with multiplicity two. -/
example : (ofPolynomial (Polynomial.X + 1 : Polynomial ℚ)).fixedPoints =
    {Projectivization.mk ℚ ![1, 0] (by simp), Projectivization.mk ℚ ![1, 0] (by simp)} := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.fixedPoints_sq_add_one`: over `ℚ`, `z² + 1`
has only the fixed point `∞`: its finite fixed points are the roots of `z² - z + 1`. -/
example : (ofPolynomial (Polynomial.X ^ 2 + 1 : Polynomial ℚ)).fixedPoints =
    {Projectivization.mk ℚ ![1, 0] (by simp)} := sorry

/-- `DY.0/fixed-point-multiplier`: the multiplier of `f` at `P`: the derivative of the rational
function `F₀(z, 1)/F₁(z, 1)` at `z` when `P = [z : 1]`, and at `∞` the multiplier at `0` of the
conjugate by `z ↦ 1/z` (junk value when `P` is not fixed). -/
noncomputable def multiplier (f : RationalMap K) (P : ℙ K (Fin 2 → K)) : K := sorry

theorem multiplier_ofPolynomial (p : Polynomial K) {x : K} (hx : p.eval x = x) :
    (ofPolynomial p).multiplier (Projectivization.mk K ![x, 1] (by simp)) =
      p.derivative.eval x := sorry

theorem multiplier_ofPolynomial_infty {p : Polynomial K} (hp : 2 ≤ p.natDegree) :
    (ofPolynomial p).multiplier (Projectivization.mk K ![1, 0] (by simp)) = 0 := sorry

theorem multiplier_eq_trace {d : ℕ} (F : HomogeneousLift K d) {x : Fin 2 → K} (hx : x ≠ 0)
    {c : K} (hc : F.eval x = c • x) (hc0 : c ≠ 0) :
    (mk F).multiplier (Projectivization.mk K x hx) =
      (MvPolynomial.eval x (MvPolynomial.pderiv 0 (F.forms 0)) +
        MvPolynomial.eval x (MvPolynomial.pderiv 1 (F.forms 1))) / c - d := sorry

open scoped Classical in
theorem multiplier_eq_one_iff [IsAlgClosed K] {f : RationalMap K} (hf : 2 ≤ f.degree)
    {P : ℙ K (Fin 2 → K)} (hP : toEnd f P = P) :
    f.multiplier P = 1 ↔ 2 ≤ f.fixedPoints.count P := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.multiplier_sq_one`: `z²` has multiplier `2`
at the fixed point `1`. -/
example : (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).multiplier
    (Projectivization.mk ℚ ![1, 1] (by simp)) = 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.multiplier_sq_infty`: `z²` has multiplier `0`
at `∞` (superattracting), not the value of the derivative `2z` there. -/
example : (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).multiplier
    (Projectivization.mk ℚ ![1, 0] (by simp)) = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.multiplier_translation_infty`: the parabolic
fixed point `∞` of `z ↦ z + 1` has multiplier `1`. -/
example : (ofPolynomial (Polynomial.X + 1 : Polynomial ℚ)).multiplier
    (Projectivization.mk ℚ ![1, 0] (by simp)) = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.multiplier_frobenius`: in characteristic
`p`, `z ↦ z^p` has multiplier `0` at the fixed point `1` (the trace formula needs no division by
the degree). -/
example (p : ℕ) [Fact p.Prime] : (ofPolynomial (K := ZMod p) (Polynomial.X ^ p)).multiplier
    (Projectivization.mk (ZMod p) ![1, 1] (by simp)) = 0 := sorry

/-- `DY.0/fixed-point-multiplier-conj`: multipliers are conjugation invariant. -/
theorem multiplier_smul (γ : PGL(2, K)) (f : RationalMap K) {P : ℙ K (Fin 2 → K)}
    (hP : toEnd f P = P) : (γ • f).multiplier (γ • P) = f.multiplier P := sorry

/-- `DY.0/multiplier-symmetric-functions`: the `i`-th elementary symmetric function of the fixed
point multipliers (Milnor's `σᵢ`). -/
noncomputable def sigma (f : RationalMap K) (i : ℕ) : K :=
  (f.fixedPoints.map f.multiplier).esymm i

theorem sigma_smul (γ : PGL(2, K)) (f : RationalMap K) (i : ℕ) :
    (γ • f).sigma i = f.sigma i := sorry

theorem sigma_eq_zero_of_lt {f : RationalMap K} {i : ℕ}
    (hi : Multiset.card f.fixedPoints < i) : f.sigma i = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.sigma_sq`: `z²` has `σ₁ = 2`, `σ₂ = 0`. -/
example : (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).sigma 1 = 2 ∧
    (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).sigma 2 = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.sigma_sq_add_const`: over an algebraically
closed field, `z² + c` has `σ₁ = 2`, `σ₂ = 4c`, `σ₃ = 0`. -/
example {K : Type*} [Field K] [IsAlgClosed K] [CharZero K] (c : K) :
    (ofPolynomial (Polynomial.X ^ 2 + Polynomial.C c)).sigma 1 = 2 ∧
      (ofPolynomial (Polynomial.X ^ 2 + Polynomial.C c)).sigma 2 = 4 * c ∧
      (ofPolynomial (Polynomial.X ^ 2 + Polynomial.C c)).sigma 3 = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.sigma_not_closed`: over `ℚ`, `z² + 1` has a
single rational fixed point, so `sigma` over a non-closed field loses information (`σ₂ = 0`
there, whereas over `ℚ̄` it is `4`). -/
example : (ofPolynomial (Polynomial.X ^ 2 + 1 : Polynomial ℚ)).sigma 2 = 0 := sorry

/-- `DY.0/quadratic-fixed-point-relation`: Milnor's relation `σ₃ = σ₁ - 2` for quadratic maps. -/
theorem sigma_three_eq_sigma_one_sub_two [IsAlgClosed K] [CharZero K] {f : RationalMap K}
    (hf : f.degree = 2) : f.sigma 3 = f.sigma 1 - 2 := sorry

/-- `DY.0/quadratic-fixed-point-normal-form`: Milnor's normal forms (3) and (4). -/
theorem exists_quadratic_normal_form [IsAlgClosed K] [CharZero K] {f : RationalMap K}
    (hf : f.degree = 2) :
    (∃ μ₁ μ₂ : K, μ₁ * μ₂ ≠ 1 ∧ ∃ g : RationalMap K, IsConj f g ∧
      g.toRatFunc = RatFunc.X * (RatFunc.X + RatFunc.C μ₁) / (RatFunc.C μ₂ * RatFunc.X + 1)) ∨
    (∃ g : RationalMap K, IsConj f g ∧ g.toRatFunc = RatFunc.X + 1 / RatFunc.X) := sorry

end RationalMap

namespace ModuliSpace

/-- The conjugation-invariant `σᵢ` on `M_d(K)`. -/
noncomputable def sigma {d : ℕ} (c : ModuliSpace K d) (i : ℕ) : K := sorry

theorem sigma_mk {d : ℕ} (f : RationalMap K) (hf : f.degree = d) (i : ℕ) :
    (mk f hf).sigma i = f.sigma i := sorry

/-- `DY.0/moduli-space-of-quadratic-maps` (Milnor, Lemma 3.1): over an algebraically closed field
of characteristic zero, `M₂(K) → K²`, `⟨f⟩ ↦ (σ₁, σ₂)`, is a bijection. -/
theorem bijective_sigma_two [IsAlgClosed K] [CharZero K] :
    Function.Bijective fun c : ModuliSpace K 2 ↦ (c.sigma 1, c.sigma 2) := sorry

end ModuliSpace

/-! #### Critical points and the critically marked moduli space -/

namespace RationalMap

/-- `DY.0/critical-points-of-a-rational-map`: the critical points of `f`, with multiplicity: the
roots of the Jacobian form `∂₀F₀ ∂₁F₁ - ∂₁F₀ ∂₀F₁` of degree `2d - 2`. -/
noncomputable def criticalPoints (f : RationalMap K) : Multiset (ℙ K (Fin 2 → K)) := sorry

theorem card_criticalPoints [IsAlgClosed K] [CharZero K] {f : RationalMap K}
    (hf : 1 ≤ f.degree) : Multiset.card f.criticalPoints = 2 * f.degree - 2 := sorry

theorem criticalPoints_smul (γ : PGL(2, K)) (f : RationalMap K) :
    (γ • f).criticalPoints = f.criticalPoints.map (γ • ·) := sorry

open scoped Classical in
theorem count_criticalPoints_le [CharZero K] (f : RationalMap K) (P : ℙ K (Fin 2 → K)) :
    f.criticalPoints.count P ≤ f.degree - 1 := sorry

theorem mk_one_mem_criticalPoints_iff [CharZero K] {d : ℕ} (hd : 1 ≤ d) (F : HomogeneousLift K d)
    (x : K)
    (hx : MvPolynomial.eval ![x, 1] (F.forms 1) ≠ 0) :
    Projectivization.mk K ![x, 1] (by simp) ∈ (mk F).criticalPoints ↔
      Polynomial.eval x
        (Polynomial.derivative (MvPolynomial.aeval ![Polynomial.X, 1] (F.forms 0)) *
            MvPolynomial.aeval ![Polynomial.X, 1] (F.forms 1) -
          MvPolynomial.aeval ![Polynomial.X, 1] (F.forms 0) *
            Polynomial.derivative (MvPolynomial.aeval ![Polynomial.X, 1] (F.forms 1)) :
          Polynomial K) = 0 := sorry

theorem mem_criticalPoints_mul_iff [CharZero K] {f g : RationalMap K} (hf : 1 ≤ f.degree)
    (hg : 1 ≤ g.degree) (P : ℙ K (Fin 2 → K)) :
    P ∈ (f * g).criticalPoints ↔ P ∈ g.criticalPoints ∨ toEnd g P ∈ f.criticalPoints := sorry

open scoped Classical in
/-- Chain rule for critical multiplicities. With the local degree `e_f(c) = 1 + (multiplicity of
`c` in `criticalPoints f`)`, local degrees multiply along a composite, `e_{f ∘ g}(c) =
e_g(c) · e_f(g(c))`; equivalently the multiplicity of `c` for `f ∘ g` is that of `g` at `c` plus
`e_g(c)` times that of `f` at `g(c)` (`Crit(f ∘ g) = Crit(g) + g^* Crit(f)`). -/
theorem criticalPoints_comp [CharZero K] {f g : RationalMap K} (hf : 1 ≤ f.degree)
    (hg : 1 ≤ g.degree) (c : ℙ K (Fin 2 → K)) :
    (f * g).criticalPoints.count c + 1 =
      (g.criticalPoints.count c + 1) * (f.criticalPoints.count (toEnd g c) + 1) := sorry

open scoped Classical in
/-- Critical points of the `n`-th iterate: `c` is critical for `fⁿ` exactly when its orbit
`c, f(c), …, f^{n-1}(c)` meets a critical point of `f`, and the local degrees multiply along the
orbit (`Crit(fⁿ) = Σ_{k < n} (f^k)^* Crit(f)`). -/
theorem criticalPoints_iterate [CharZero K] {f : RationalMap K} (hf : 1 ≤ f.degree) (n : ℕ)
    (c : ℙ K (Fin 2 → K)) :
    (c ∈ (f ^ n).criticalPoints ↔ ∃ k < n, (toEnd f)^[k] c ∈ f.criticalPoints) ∧
      (f ^ n).criticalPoints.count c + 1 =
        ∏ k ∈ Finset.range n, (f.criticalPoints.count ((toEnd f)^[k] c) + 1) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.criticalPoints_pow`: `z ↦ z³` over `ℚ` has
the critical points `0` and `∞`, each twice. -/
example : (ofPolynomial (Polynomial.X ^ 3 : Polynomial ℚ)).criticalPoints =
    {Projectivization.mk ℚ ![0, 1] (by simp), Projectivization.mk ℚ ![0, 1] (by simp),
      Projectivization.mk ℚ ![1, 0] (by simp), Projectivization.mk ℚ ![1, 0] (by simp)} := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.criticalPoints_frobenius`: in characteristic
`p`, the Jacobian form of `z ↦ z^p` vanishes identically; the definition returns no critical
points, and `card_criticalPoints` needs characteristic zero. -/
example (p : ℕ) [Fact p.Prime] :
    (ofPolynomial (K := ZMod p) (Polynomial.X ^ p)).criticalPoints = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.criticalPoints_milnor`: in Milnor's fixed
point normal form `z (z + μ₁)/(μ₂ z + 1)` the critical points are the roots of
`μ₂ ω² + 2 ω + μ₁` (Milnor, Appendix C). -/
example {K : Type*} [Field K] [IsAlgClosed K] [CharZero K] (μ₁ μ₂ ω : K) (f : RationalMap K)
    (hf : f.toRatFunc = RatFunc.X * (RatFunc.X + RatFunc.C μ₁) / (RatFunc.C μ₂ * RatFunc.X + 1))
    (h : μ₁ * μ₂ ≠ 1) :
    Projectivization.mk K ![ω, 1] (by simp) ∈ f.criticalPoints ↔
      μ₂ * ω ^ 2 + 2 * ω + μ₁ = 0 := sorry

end RationalMap

/-- A critically marked map of degree `d`: a map with an ordering `c₁, …, c_{2d-2}` of its critical
points (with multiplicity). -/
def CriticallyMarkedMap (K : Type*) [Field K] (d : ℕ) : Type _ :=
  {fc : RationalMap K × (Fin (2 * d - 2) → ℙ K (Fin 2 → K)) //
    fc.1.degree = d ∧ Multiset.map fc.2 Finset.univ.val = fc.1.criticalPoints}

/-- `PGL₂(K)` acts on critically marked maps, on the map by conjugation and on the marking. -/
noncomputable instance CriticallyMarkedMap.instMulActionPGL (d : ℕ) :
    MulAction PGL(2, K) (CriticallyMarkedMap K d) := sorry

/-- `DY.0/critically-marked-moduli-space`: critically marked maps up to conjugation acting on the
map and the marking together. -/
def CriticallyMarkedModuliSpace (K : Type*) [Field K] (d : ℕ) : Type _ :=
  Quotient (MulAction.orbitRel PGL(2, K) (CriticallyMarkedMap K d))

namespace CriticallyMarkedModuliSpace

variable {d : ℕ}

/-- The forgetful map `M_d^cm → M_d`. -/
noncomputable def forget : CriticallyMarkedModuliSpace K d → ModuliSpace K d := sorry

theorem forget_surjective [IsAlgClosed K] [CharZero K] :
    Function.Surjective (forget (K := K) (d := d)) := sorry

/-- The relabelling action of the symmetric group on the markings. -/
noncomputable instance instMulActionPerm : MulAction (Equiv.Perm (Fin (2 * d - 2)))
    (CriticallyMarkedModuliSpace K d) := sorry

theorem forget_smul (σ : Equiv.Perm (Fin (2 * d - 2))) (c : CriticallyMarkedModuliSpace K d) :
    forget (σ • c) = forget c := sorry

theorem forget_eq_forget_iff [IsAlgClosed K] [CharZero K] (c c' : CriticallyMarkedModuliSpace K d) :
    forget c = forget c' ↔ ∃ σ : Equiv.Perm (Fin (2 * d - 2)), σ • c = c' := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.CriticallyMarkedModuliSpace.forget_fiber_two`: for
`d = 2`, the class of `z²` (critical points `0 ≠ ∞`) has one preimage in `M₂^cm`, because
`z ↦ 1/z` exchanges the two marked critical points and commutes with `z²`. -/
example [IsAlgClosed K] [CharZero K]
    (hf : (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial K)).degree = 2) :
    ∃! c : CriticallyMarkedModuliSpace K 2,
      forget c = ModuliSpace.mk (RationalMap.ofPolynomial (Polynomial.X ^ 2)) hf := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.CriticallyMarkedModuliSpace.degree_one`: for `d = 1`
there are no critical points, and `M₁^cm = M₁`. -/
example : Function.Bijective (forget (K := K) (d := 1)) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.CriticallyMarkedModuliSpace.fiber_generic`: the map
`z (z + 2)/(3 z + 1)` over `ℂ`-like fields has two preimages in `M₂^cm` (no conjugacy swaps its
critical points), so `forget` is not injective. -/
example [IsAlgClosed K] [CharZero K] : ¬ Function.Injective (forget (K := K) (d := 2)) := sorry

/-- `DY.0/critically-marked-quadratic-moduli` (Milnor, Lemma 6.1): over an algebraically closed
field of characteristic zero, `M₂^cm(K)` is in bijection with the surface `A³(A - 1) = BC`, the
deck transformation exchanging `B` and `C`. -/
theorem exists_equiv_milnorSurface_two [IsAlgClosed K] [CharZero K] :
    ∃ e : CriticallyMarkedModuliSpace K 2 ≃ {t : K × K × K // t.1 ^ 3 * (t.1 - 1) = t.2.1 * t.2.2},
      ∀ c, (e ((Equiv.swap (0 : Fin (2 * 2 - 2)) 1) • c) : K × K × K) =
        ((e c : K × K × K).1, (e c : K × K × K).2.2, (e c : K × K × K).2.1) := sorry

end CriticallyMarkedModuliSpace

/-! #### Good reduction (`DY.0/good-reduction-of-a-rational-map` and its lemmas) -/

section GoodReduction

variable (R : Type*) [CommRing R] [IsDomain R] [ValuationRing R] [Algebra R K]
  [IsFractionRing R K]

namespace RationalMap

/-- `f` has good reduction over the valuation ring `R` if it has a lift with coefficients in `R`
whose resultant is a unit of `R`. -/
def HasGoodReduction (f : RationalMap K) : Prop :=
  ∃ F : Fin 2 → MvPolynomial (Fin 2) R,
    (∀ i, (F i).IsHomogeneous f.degree) ∧
    IsUnit (binaryResultant f.degree f.degree (F 0) (F 1)) ∧
    ∃ G : HomogeneousLift K f.degree, mk G = f ∧
      ∀ i, G.forms i = MvPolynomial.map (algebraMap R K) (F i)

/-- The reduction of a map with good reduction, a rational map over the residue field of the same
degree. -/
noncomputable def reduction (f : RationalMap K) (hf : f.HasGoodReduction R) :
    RationalMap (IsLocalRing.ResidueField R) := sorry

theorem degree_reduction (f : RationalMap K) (hf : f.HasGoodReduction R) :
    (f.reduction R hf).degree = f.degree := sorry

theorem hasGoodReduction_one : (1 : RationalMap K).HasGoodReduction R := sorry

theorem hasGoodReduction_ofPolynomial_iff (p : Polynomial R) (hp : p ≠ 0) :
    (ofPolynomial (p.map (algebraMap R K))).HasGoodReduction R ↔ IsUnit p.leadingCoeff := sorry

theorem hasGoodReduction_map_units (γ : GL (Fin 2) R) :
    (mk (HomogeneousLift.ofGL (Matrix.GeneralLinearGroup.map (algebraMap R K) γ))).HasGoodReduction
      R := sorry

/-- `DY.0/good-reduction-iff-normalized-resultant-unit`: for a normalised integral lift (some
coefficient a unit), good reduction is the unit condition on its resultant, equivalently the
reduced forms still have nonzero resultant (the degree does not drop). -/
theorem hasGoodReduction_iff_isUnit_binaryResultant {f : RationalMap K}
    (F : Fin 2 → MvPolynomial (Fin 2) R) (hF : ∀ i, (F i).IsHomogeneous f.degree)
    (hnorm : ∃ i m, IsUnit ((F i).coeff m))
    (hlift : ∃ G : HomogeneousLift K f.degree, mk G = f ∧
      ∀ i, G.forms i = MvPolynomial.map (algebraMap R K) (F i)) :
    f.HasGoodReduction R ↔ IsUnit (binaryResultant f.degree f.degree (F 0) (F 1)) := sorry

theorem hasGoodReduction_iff_residue_binaryResultant_ne_zero {f : RationalMap K}
    (F : Fin 2 → MvPolynomial (Fin 2) R) (hF : ∀ i, (F i).IsHomogeneous f.degree)
    (hnorm : ∃ i m, IsUnit ((F i).coeff m))
    (hlift : ∃ G : HomogeneousLift K f.degree, mk G = f ∧
      ∀ i, G.forms i = MvPolynomial.map (algebraMap R K) (F i)) :
    f.HasGoodReduction R ↔
      binaryResultant f.degree f.degree (MvPolynomial.map (IsLocalRing.residue R) (F 0))
        (MvPolynomial.map (IsLocalRing.residue R) (F 1)) ≠ 0 := sorry

/-- `DY.0/reduction-commutes-with-composition` (Silverman, AWS notes, Proposition 24(a)). -/
theorem HasGoodReduction.mul {f g : RationalMap K} (hf : f.HasGoodReduction R)
    (hg : g.HasGoodReduction R) : (f * g).HasGoodReduction R := sorry

theorem reduction_mul {f g : RationalMap K} (hf : f.HasGoodReduction R)
    (hg : g.HasGoodReduction R) :
    (f * g).reduction R (hf.mul R hg) = f.reduction R hf * g.reduction R hg := sorry

theorem HasGoodReduction.pow {f : RationalMap K} (hf : f.HasGoodReduction R) (n : ℕ) :
    (f ^ n).HasGoodReduction R := sorry

end RationalMap

/-- `DY.0/reduction-of-points`: reduction `ℙ¹(K) → ℙ¹(k)`: scale a representative to have
coordinates in `R`, one of them a unit, and reduce. -/
noncomputable def projReduction : ℙ K (Fin 2 → K) → ℙ (IsLocalRing.ResidueField R)
    (Fin 2 → IsLocalRing.ResidueField R) := sorry

theorem projReduction_mk (x : Fin 2 → R) (hx : ∃ i, IsUnit (x i)) :
    projReduction R (Projectivization.mk K (fun i ↦ algebraMap R K (x i)) (by sorry)) =
      Projectivization.mk _ (fun i ↦ IsLocalRing.residue R (x i)) (by sorry) := sorry

theorem projReduction_surjective : Function.Surjective (projReduction (K := K) R) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.projReduction_half`: `[1/2 : 1]` reduces to `∞` over
`ℤ_[2]`, because `[1/2 : 1] = [1 : 2]`. -/
example : projReduction (K := ℚ_[2]) ℤ_[2] (Projectivization.mk ℚ_[2] ![1 / 2, 1] (by simp)) =
    Projectivization.mk _ ![1, 0] (by simp) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.projReduction_three`: `[3 : 1]` reduces to `[1 : 1]`
over `ℤ_[2]`. -/
example : projReduction (K := ℚ_[2]) ℤ_[2] (Projectivization.mk ℚ_[2] ![3, 1] (by simp)) =
    Projectivization.mk _ ![1, 1] (by simp) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.projReduction_infty`: `∞` reduces to `∞`. -/
example : projReduction (K := ℚ_[2]) ℤ_[2] (Projectivization.mk ℚ_[2] ![1, 0] (by simp)) =
    Projectivization.mk _ ![1, 0] (by simp) := sorry

/-- `DY.0/reduction-commutes-with-evaluation` (Silverman, AWS notes, Proposition 24(b)). -/
theorem RationalMap.projReduction_toEnd {f : RationalMap K} (hf : f.HasGoodReduction R)
    (P : ℙ K (Fin 2 → K)) :
    projReduction R (RationalMap.toEnd f P) =
      RationalMap.toEnd (f.reduction R hf) (projReduction R P) := sorry

/-- `DY.0/good-reduction-conj-integral`: conjugation by `GL₂(R)` preserves good reduction
(Rumely, The minimal resultant locus, §1). -/
theorem RationalMap.hasGoodReduction_smul_iff (γ : GL (Fin 2) R) (f : RationalMap K) :
    (Matrix.ProjGenLinGroup.mk (Matrix.GeneralLinearGroup.map (algebraMap R K) γ) •
      f).HasGoodReduction R ↔ f.HasGoodReduction R := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.not_hasGoodReduction_two`: `(z² + 2)/z` has
bad reduction over `ℤ_[2]`: its normalised resultant `2` is not a unit. -/
example (F : HomogeneousLift ℚ_[2] 2)
    (hF : F.forms = ![MvPolynomial.X 0 ^ 2 + 2 * MvPolynomial.X 1 ^ 2,
      MvPolynomial.X 0 * MvPolynomial.X 1]) :
    ¬ (RationalMap.mk F).HasGoodReduction ℤ_[2] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.hasGoodReduction_three`: the same map has
good reduction over `ℤ_[3]`. -/
example (F : HomogeneousLift ℚ_[3] 2)
    (hF : F.forms = ![MvPolynomial.X 0 ^ 2 + 2 * MvPolynomial.X 1 ^ 2,
      MvPolynomial.X 0 * MvPolynomial.X 1]) :
    (RationalMap.mk F).HasGoodReduction ℤ_[3] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.hasGoodReduction_sq_add`: `z² + c` with
`c ∈ ℤ` has good reduction at every prime. -/
example (c : ℤ) (p : ℕ) [Fact p.Prime] :
    (RationalMap.ofPolynomial (Polynomial.X ^ 2 + Polynomial.C (c : ℚ_[p]))).HasGoodReduction
      ℤ_[p] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.conj_changes_reduction`: `z²/2` is conjugate
over `ℚ_[2]` to `z²` (by `z ↦ 2z`), which has good reduction, but itself has bad reduction:
good reduction is invariant only under `GL₂(ℤ_[2])`. -/
example (f : RationalMap ℚ_[2]) (hf : f.toRatFunc = RatFunc.X ^ 2 / 2) :
    IsConj f (RationalMap.ofPolynomial (Polynomial.X ^ 2)) ∧ ¬ f.HasGoodReduction ℤ_[2] ∧
      (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ_[2])).HasGoodReduction ℤ_[2] :=
  sorry

end GoodReduction

end RationalMaps

-- `DY.0/rational-map-to-scheme-endomorphism` is not prototyped: Mathlib at the pin has `Proj` of a
-- graded ring but no projective line `P¹_K` with its morphisms given by forms. The requested
-- signature (from `SchemeAndStackFoundations:SF.0`) is a monoid hom
-- `RationalMap K →* CategoryTheory.End (P¹_K as an object of Over (Spec K))`, injective, whose
-- action on `K`-points is `RationalMap.toEnd`.

end DY0

end TauCeti.ArithmeticDynamics

end DY0File


-- ===== DY.1 =====

section DY1File

/-!
# ArithmeticDynamics, DY.1: canonical heights of polarized morphisms (suggested forms)

This section of the suggested file is not the roadmap and is not exhaustive: the roadmap document
is definitive. The statements below suggest Lean forms so that contributors and reviewers converge
on names and signatures. Every proof is `sorry`; nothing here is an implementation claim.

It is appended after the DY.0 section, whose declarations (`IsPreperiodicPt`, `forwardOrbit`,
`RationalMap`, `RationalMap.toEnd`, `RationalMap.projMap`, `PGL(2, K)`-conjugation) it uses.

Conventions pinned here (see the roadmap document, DY.1):
* `tateLimit φ h α P = lim_{n → ∞} h(φⁿ P) / αⁿ` (Mathlib's `limUnder`; the theorems below say when
  the limit exists, so the junk value of `limUnder` is never used).
* The absolute logarithmic Weil height on `ℙ¹(F)`, `F` of characteristic zero, is
  `h([x : 1]) = NumberField.absLogHeight₁ x` and `h([1 : 0]) = 0` (the normalisation requested by
  `ClassicalArithmeticCompletion:CA.6`). On a number field `K` it is Mathlib's relative
  `Projectivization.logHeight` divided by `[K : ℚ]`.
* The relative canonical height over a field with `Height.AdmissibleAbsValues` uses Mathlib's
  relative `Projectivization.logHeight`, as Call–Silverman do over a global height field.
* Tau Ceti's elliptic `canonicalHeight` is `½ lim h(2ⁿ P)/4ⁿ` for the naive `x`-coordinate height;
  the Tate limit of `([2], h_x, 4)` is twice it. That comparison, and the general Call–Silverman
  theorems for a projective variety with a line bundle, are not prototyped here (see the comments
  at the end of the section).
-/

namespace TauCeti.ArithmeticDynamics

open scoped LinearAlgebra.Projectivization Topology

section DY1

/-! ### Tate's limit (`DY.1/tate-limit` and its lemmas) -/

section Tate

variable {S T : Type*} {φ : S → S} {h : S → ℝ} {α : ℝ}

/-- `DY.1/tate-limit`: Tate's normalisation `P ↦ lim h(φⁿ P)/αⁿ`. -/
noncomputable def tateLimit (φ : S → S) (h : S → ℝ) (α : ℝ) (P : S) : ℝ :=
  Filter.limUnder Filter.atTop fun n : ℕ ↦ h (φ^[n] P) / α ^ n

theorem tateLimit_def (φ : S → S) (h : S → ℝ) (α : ℝ) (P : S) :
    tateLimit φ h α P = Filter.limUnder Filter.atTop fun n : ℕ ↦ h (φ^[n] P) / α ^ n := rfl

theorem tateLimit_congr_of_bounded (hα : 1 < α) (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C)
    {h' : S → ℝ} (hB : ∃ B, ∀ Q, |h' Q - h Q| ≤ B) : tateLimit φ h' α = tateLimit φ h α := sorry

theorem tateLimit_const_mul (hα : 1 < α) (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C) (c : ℝ) :
    tateLimit φ (fun Q ↦ c * h Q) α = fun P ↦ c * tateLimit φ h α P := sorry

theorem tateLimit_iterate (hα : 1 < α) (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C) {k : ℕ}
    (hk : 0 < k) : tateLimit φ^[k] h (α ^ k) = tateLimit φ h α := sorry

theorem tateLimit_nonneg (hα : 1 < α) (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C)
    (hh : ∀ Q, 0 ≤ h Q) (P : S) : 0 ≤ tateLimit φ h α P := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.tateLimit_id`: for `φ = id` and `α = 2` the limit is
`0`, whatever `h` is (degenerate case). -/
example (h : S → ℝ) (P : S) : tateLimit id h 2 P = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.tateLimit_double`: for `φ x = 2x`, `h = id`, `α = 2` on
`ℝ`, the sequence is constant and the limit is `x`. -/
example (x : ℝ) : tateLimit (fun y : ℝ ↦ 2 * y) id 2 x = x := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.not_tendsto_tateSeq_one`: with `α = 1`, `φ = (· + 1)`
and `h = id` on `ℝ` the sequence `h(φⁿ x)/1ⁿ = x + n` diverges, so `α > 1` cannot be dropped. -/
example (x : ℝ) : ¬ ∃ L, Filter.Tendsto (fun n : ℕ ↦ (fun y : ℝ ↦ y + 1)^[n] x / (1 : ℝ) ^ n)
    Filter.atTop (𝓝 L) := sorry

/-- `DY.1/tate-telescoping-estimate` (Call–Silverman (6); Silverman ADS (3.15)). -/
theorem abs_tateSeq_sub_le (hα : 1 < α) {C : ℝ} (hC : ∀ Q, |h (φ Q) - α * h Q| ≤ C) (P : S)
    {m n : ℕ} (hmn : m ≤ n) :
    |h (φ^[n] P) / α ^ n - h (φ^[m] P) / α ^ m| ≤ C / ((α - 1) * α ^ m) := sorry

/-- `DY.1/tate-limit-tendsto` (Call–Silverman, Proposition 1.2 (4)). -/
theorem tendsto_tateLimit (hα : 1 < α) (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C) (P : S) :
    Filter.Tendsto (fun n : ℕ ↦ h (φ^[n] P) / α ^ n) Filter.atTop
      (𝓝 (tateLimit φ h α P)) := sorry

/-- `DY.1/tate-limit-error-bound` (Call–Silverman, Proposition 1.2 (5)). -/
theorem abs_tateLimit_sub_le (hα : 1 < α) {C : ℝ} (hC : ∀ Q, |h (φ Q) - α * h Q| ≤ C)
    (P : S) : |tateLimit φ h α P - h P| ≤ C / (α - 1) := sorry

/-- `DY.1/tate-limit-functional-equation` (Call–Silverman, Theorem 1.1 (ii)). -/
theorem tateLimit_apply (hα : 1 < α) (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C) (P : S) :
    tateLimit φ h α (φ P) = α * tateLimit φ h α P := sorry

/-- `DY.1/tate-limit-unique` (Call–Silverman, Theorem 1.1, uniqueness; Silverman ADS,
Theorem 3.20). -/
theorem eq_tateLimit_of_bounded (hα : 1 < α) (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C)
    {g : S → ℝ} (hg : ∃ B, ∀ P, |g P - h P| ≤ B) (hgφ : ∀ P, g (φ P) = α * g P) :
    g = tateLimit φ h α := sorry

/-- `DY.1/tate-limit-semiconj`: Tate limits are transported along semiconjugacies (the proof of
conjugation invariance, Silverman ADS, Exercise 3.11). -/
theorem tateLimit_comp_of_semiconj {ψ : T → T} {π : S → T} (hπ : Function.Semiconj π φ ψ)
    {k : T → ℝ} (hα : 1 < α) (hCh : ∃ C, ∀ P, |h (φ P) - α * h P| ≤ C)
    (hCk : ∃ C, ∀ Q, |k (ψ Q) - α * k Q| ≤ C) (hB : ∃ B, ∀ P, |k (π P) - h P| ≤ B) :
    tateLimit ψ k α ∘ π = tateLimit φ h α := sorry

/-- `DY.1/tate-limit-eq-zero-of-preperiodic` (Call–Silverman, Corollary 1.1.1(a), first half). -/
theorem tateLimit_eq_zero_of_isPreperiodicPt (hα : 1 < α) {P : S}
    (hP : IsPreperiodicPt φ P) : tateLimit φ h α P = 0 := sorry

/-- `DY.1/preperiodic-of-tate-limit-eq-zero` (Call–Silverman, Corollary 1.1.1(a), second half):
Northcott on a forward-invariant set of points turns zero Tate limit into preperiodicity. -/
theorem isPreperiodicPt_of_tateLimit_eq_zero (hα : 1 < α)
    (hC : ∃ C, ∀ Q, |h (φ Q) - α * h Q| ≤ C) {A : Set S} (hA : Set.MapsTo φ A A)
    (hN : ∀ B : ℝ, {Q | Q ∈ A ∧ h Q ≤ B}.Finite) {P : S} (hP : P ∈ A)
    (h0 : tateLimit φ h α P = 0) : IsPreperiodicPt φ P := sorry

/-- `DY.1/height-bound-of-preperiodic` (Call–Silverman, Corollary 1.1.1(b), first half). -/
theorem le_of_isPreperiodicPt (hα : 1 < α) {C : ℝ} (hC : ∀ Q, |h (φ Q) - α * h Q| ≤ C) {P : S}
    (hP : IsPreperiodicPt φ P) : h P ≤ C / (α - 1) := sorry

end Tate

/-! ### Heights on the projective line -/

section Heights

/-- `DY.1/weil-height-on-the-projective-line`: `h([x : 1]) = absLogHeight₁ x`, `h([1 : 0]) = 0`. -/
noncomputable def projLineAbsLogHeight {F : Type*} [Field F] [CharZero F]
    (P : ℙ F (Fin 2 → F)) : ℝ :=
  open scoped Classical in
  P.lift (fun v : {v : Fin 2 → F // v ≠ 0} ↦
    if v.1 1 = 0 then 0 else NumberField.absLogHeight₁ (v.1 0 / v.1 1)) sorry

variable {F : Type*} [Field F] [CharZero F]

theorem projLineAbsLogHeight_mk_one (x : F) :
    projLineAbsLogHeight (Projectivization.mk F ![x, 1] (by simp)) =
      NumberField.absLogHeight₁ x := sorry

theorem projLineAbsLogHeight_infty :
    projLineAbsLogHeight (Projectivization.mk F ![1, 0] (by simp)) = 0 := sorry

theorem projLineAbsLogHeight_nonneg (P : ℙ F (Fin 2 → F)) : 0 ≤ projLineAbsLogHeight P := sorry

theorem projLineAbsLogHeight_mk_inv (x : F) (hx : x ≠ 0) :
    projLineAbsLogHeight (Projectivization.mk F ![1, x] (by simp)) =
      projLineAbsLogHeight (Projectivization.mk F ![x, 1] (by simp)) := sorry

theorem projLineAbsLogHeight_projMap {F' : Type*} [Field F'] [CharZero F'] (σ : F →+* F')
    (P : ℙ F (Fin 2 → F)) :
    projLineAbsLogHeight (RationalMap.projMap σ P) = projLineAbsLogHeight P := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.projLineAbsLogHeight_two`: `h([2 : 1]) = log 2`. -/
example : projLineAbsLogHeight (Projectivization.mk ℚ ![2, 1] (by simp)) = Real.log 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.projLineAbsLogHeight_half`: `h([1/2 : 1]) = log 2`
(the height sees denominators). -/
example : projLineAbsLogHeight (Projectivization.mk ℚ ![1 / 2, 1] (by simp)) = Real.log 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.projLineAbsLogHeight_zero`: `h([0 : 1]) = 0`. -/
example : projLineAbsLogHeight (Projectivization.mk ℚ ![0, 1] (by simp)) = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.projLineAbsLogHeight_rat_compat`: on `ℚ` the height is
Mathlib's `Projectivization.logHeight` (degree `1`). -/
example (P : ℙ ℚ (Fin 2 → ℚ)) : projLineAbsLogHeight P = Projectivization.logHeight P := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.projLineAbsLogHeight_transcendental`: at a
transcendental point the value is Mathlib's junk `0`, which is why the canonical height is stated
for fields algebraic over `ℚ`. -/
example (x : ℝ) (hx : Transcendental ℚ x) :
    projLineAbsLogHeight (Projectivization.mk ℝ ![x, 1] (by simp)) = 0 := sorry

/-- `DY.1/weil-height-eq-log-height-div-finrank`. -/
theorem projLineAbsLogHeight_eq_logHeight_div {K : Type*} [Field K] [NumberField K]
    (P : ℙ K (Fin 2 → K)) :
    projLineAbsLogHeight P = Projectivization.logHeight P / Module.finrank ℚ K := sorry

/-- `DY.1/northcott-on-the-projective-line`: Northcott for `ℙ¹(K)`, `K` a number field. -/
theorem finite_setOf_logHeight_projLine_le {K : Type*} [Field K] [NumberField K] (B : ℝ) :
    {P : ℙ K (Fin 2 → K) | Projectivization.logHeight P ≤ B}.Finite := sorry

/-- `DY.1/mul-height-bound-algebra-map`: Mathlib's constant `mulHeightBound` under a finite
extension of number fields. -/
theorem mulHeightBound_map_algebraMap {K L : Type*} [Field K] [NumberField K] [Field L]
    [NumberField L] [Algebra K L] {ι ι' : Type*} [Finite ι'] (p : ι' → MvPolynomial ι K) :
    Height.mulHeightBound (fun j ↦ MvPolynomial.map (algebraMap K L) (p j)) =
      Height.mulHeightBound p ^ Module.finrank K L := sorry

/-- `DY.1/height-bounds-for-a-homogeneous-lift`: the two Mathlib height bounds for the forms of a
lift, the lower one through the resultant certificate `q = G / Res`. -/
theorem HomogeneousLift.logHeight_eval_bounds {K : Type*} [Field K]
    [Height.AdmissibleAbsValues K] {d : ℕ} (hd : 1 ≤ d) (F : HomogeneousLift K d) :
    ∃ q : Fin 2 × Fin 2 → MvPolynomial (Fin 2) K, (∀ a, (q a).IsHomogeneous (d - 1)) ∧
      ∀ x : Fin 2 → K, x ≠ 0 →
        -Real.log (2 ^ Height.totalWeight K * max (Height.mulHeightBound q) 1) +
            d * Height.logHeight x ≤ Height.logHeight (F.eval x) ∧
          Height.logHeight (F.eval x) ≤
            Real.log (max (Height.mulHeightBound F.forms) 1) + d * Height.logHeight x := sorry

/-- `DY.1/relative-height-estimate-for-rational-map` (Silverman ADS, Theorem 3.11 for `N = 1`;
AWS notes, Theorem 12(a)): over a field with admissible absolute values. -/
theorem RationalMap.exists_abs_logHeight_toEnd_sub_le {K : Type*} [Field K]
    [Height.AdmissibleAbsValues K] (f : RationalMap K) :
    ∃ C, ∀ P : ℙ K (Fin 2 → K),
      |Projectivization.logHeight (RationalMap.toEnd f P) -
        f.degree * Projectivization.logHeight P| ≤ C := sorry

/-- `DY.1/absolute-height-estimate-for-rational-map`: the same estimate for the absolute height,
with a constant depending only on `f`, over any field algebraic over `ℚ`. -/
theorem RationalMap.exists_abs_projLineAbsLogHeight_toEnd_sub_le [Algebra.IsAlgebraic ℚ F]
    (f : RationalMap F) :
    ∃ C, ∀ P : ℙ F (Fin 2 → F),
      |projLineAbsLogHeight (RationalMap.toEnd f P) - f.degree * projLineAbsLogHeight P| ≤ C :=
  sorry

end Heights

/-! ### Canonical heights on `ℙ¹` -/

section CanonicalHeightP1

namespace RationalMap

/-- `DY.1/canonical-height-over-a-global-height-field`: the canonical height of `f` relative to
the height of a field with admissible absolute values. -/
noncomputable def relCanonicalHeight {K : Type*} [Field K] [Height.AdmissibleAbsValues K]
    (f : RationalMap K) (P : ℙ K (Fin 2 → K)) : ℝ :=
  tateLimit (toEnd f) Projectivization.logHeight f.degree P

section Relative

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {f : RationalMap K}

theorem tendsto_relCanonicalHeight (hf : 2 ≤ f.degree) (P : ℙ K (Fin 2 → K)) :
    Filter.Tendsto (fun n : ℕ ↦ Projectivization.logHeight ((toEnd f)^[n] P) / f.degree ^ n)
      Filter.atTop (𝓝 (f.relCanonicalHeight P)) := sorry

theorem exists_abs_relCanonicalHeight_sub_le (hf : 2 ≤ f.degree) :
    ∃ C, ∀ P, |f.relCanonicalHeight P - Projectivization.logHeight P| ≤ C := sorry

theorem relCanonicalHeight_toEnd (hf : 2 ≤ f.degree) (P : ℙ K (Fin 2 → K)) :
    f.relCanonicalHeight (toEnd f P) = f.degree * f.relCanonicalHeight P := sorry

theorem eq_relCanonicalHeight_of_bounded (hf : 2 ≤ f.degree) {g : ℙ K (Fin 2 → K) → ℝ}
    (hg : ∃ B, ∀ P, |g P - Projectivization.logHeight P| ≤ B)
    (hgf : ∀ P, g (toEnd f P) = f.degree * g P) : g = f.relCanonicalHeight := sorry

theorem relCanonicalHeight_nonneg (hf : 2 ≤ f.degree) (P : ℙ K (Fin 2 → K)) :
    0 ≤ f.relCanonicalHeight P := sorry

theorem relCanonicalHeight_pow (hf : 2 ≤ f.degree) {n : ℕ} (hn : 0 < n) :
    (f ^ n).relCanonicalHeight = f.relCanonicalHeight := sorry

theorem relCanonicalHeight_smul (hf : 2 ≤ f.degree) (γ : Matrix.ProjGenLinGroup (Fin 2) K)
    (P : ℙ K (Fin 2 → K)) : (γ • f).relCanonicalHeight (γ • P) = f.relCanonicalHeight P := sorry

theorem relCanonicalHeight_eq_zero_of_isPreperiodicPt (hf : 2 ≤ f.degree)
    {P : ℙ K (Fin 2 → K)} (hP : IsPreperiodicPt (toEnd f) P) : f.relCanonicalHeight P = 0 := sorry

end Relative

theorem relCanonicalHeight_map_algebraMap {K L : Type*} [Field K] [NumberField K] [Field L]
    [NumberField L] [Algebra K L] {f : RationalMap K} (hf : 2 ≤ f.degree) (P : ℙ K (Fin 2 → K)) :
    (map (algebraMap K L) f).relCanonicalHeight (projMap (algebraMap K L) P) =
      Module.finrank K L * f.relCanonicalHeight P := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.relCanonicalHeight_sq`: over `ℚ`, the
relative canonical height of `z ↦ z²` is the height: `ĥ([x : 1]) = logHeight₁ x`. -/
example (x : ℚ) : (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).relCanonicalHeight
    (Projectivization.mk ℚ ![x, 1] (by simp)) = Height.logHeight₁ x := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.relCanonicalHeight_translation`: for the
degree-one translation `z ↦ z + 1` the Tate sequence at `0` is `log n`, unbounded: the
construction needs `d ≥ 2`. -/
example : ¬ BddAbove (Set.range fun n : ℕ ↦ Projectivization.logHeight
    ((toEnd (ofPolynomial (Polynomial.X + 1 : Polynomial ℚ)))^[n]
      (Projectivization.mk ℚ ![0, 1] (by simp))) / (1 : ℝ) ^ n) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.relCanonicalHeight_infty`: a polynomial
map of degree `≥ 2` has canonical height `0` at the fixed point `∞`. -/
example (p : Polynomial ℚ) (hp : 2 ≤ p.natDegree) :
    (ofPolynomial p).relCanonicalHeight (Projectivization.mk ℚ ![1, 0] (by simp)) = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.relCanonicalHeight_sq_add_t_zero`: over
`k(t)` with its admissible absolute values (the family whose height is the degree height
`h(g) = max(deg num g, deg denom g)`, DY.6's `ratFuncAdmissibleAbsValues`), the canonical height of
`z² + t` at `0` is `1/2`: the orbit `0, t, t² + t, …` has heights `0, 1, 2, 4, …`, so
`2⁻ⁿ h(fⁿ(0)) = 2^{n-1}/2ⁿ`. -/
example (k : Type*) [Field k] [Height.AdmissibleAbsValues (RatFunc k)]
    (hk : ∀ g : RatFunc k, Height.logHeight₁ g = max g.num.natDegree g.denom.natDegree) :
    (ofPolynomial (Polynomial.X ^ 2 + Polynomial.C (RatFunc.X : RatFunc k))).relCanonicalHeight
      (Projectivization.mk (RatFunc k) ![0, 1] (by simp)) = 1 / 2 := sorry

/-- `DY.1/canonical-height-on-the-projective-line`: the canonical height of a rational map of
`ℙ¹` over a field of characteristic zero, for the absolute Weil height (the
`ClassicalArithmeticCompletion:CA.6` request). -/
noncomputable def canonicalHeight {F : Type*} [Field F] [CharZero F] (f : RationalMap F)
    (P : ℙ F (Fin 2 → F)) : ℝ :=
  tateLimit (toEnd f) projLineAbsLogHeight f.degree P

section Absolute

variable {F : Type*} [Field F] [CharZero F] [Algebra.IsAlgebraic ℚ F] {f : RationalMap F}

theorem tendsto_canonicalHeight (hf : 2 ≤ f.degree) (P : ℙ F (Fin 2 → F)) :
    Filter.Tendsto (fun n : ℕ ↦ projLineAbsLogHeight ((toEnd f)^[n] P) / f.degree ^ n)
      Filter.atTop (𝓝 (f.canonicalHeight P)) := sorry

theorem exists_abs_canonicalHeight_sub_le (hf : 2 ≤ f.degree) :
    ∃ C, ∀ P, |f.canonicalHeight P - projLineAbsLogHeight P| ≤ C := sorry

theorem canonicalHeight_toEnd (hf : 2 ≤ f.degree) (P : ℙ F (Fin 2 → F)) :
    f.canonicalHeight (toEnd f P) = f.degree * f.canonicalHeight P := sorry

theorem eq_canonicalHeight_of_bounded (hf : 2 ≤ f.degree) {g : ℙ F (Fin 2 → F) → ℝ}
    (hg : ∃ B, ∀ P, |g P - projLineAbsLogHeight P| ≤ B)
    (hgf : ∀ P, g (toEnd f P) = f.degree * g P) : g = f.canonicalHeight := sorry

theorem canonicalHeight_nonneg (hf : 2 ≤ f.degree) (P : ℙ F (Fin 2 → F)) :
    0 ≤ f.canonicalHeight P := sorry

theorem canonicalHeight_pow (hf : 2 ≤ f.degree) {n : ℕ} (hn : 0 < n) :
    (f ^ n).canonicalHeight = f.canonicalHeight := sorry

theorem canonicalHeight_smul (hf : 2 ≤ f.degree) (γ : Matrix.ProjGenLinGroup (Fin 2) F)
    (P : ℙ F (Fin 2 → F)) : (γ • f).canonicalHeight (γ • P) = f.canonicalHeight P := sorry

theorem canonicalHeight_map {F' : Type*} [Field F'] [CharZero F'] [Algebra.IsAlgebraic ℚ F']
    (σ : F →+* F') (hf : 2 ≤ f.degree) (P : ℙ F (Fin 2 → F)) :
    (map σ f).canonicalHeight (projMap σ P) = f.canonicalHeight P := sorry

theorem canonicalHeight_eq_zero_of_isPreperiodicPt (hf : 2 ≤ f.degree) {P : ℙ F (Fin 2 → F)}
    (hP : IsPreperiodicPt (toEnd f) P) : f.canonicalHeight P = 0 := sorry

/-- `DY.1/zero-canonical-height-iff-preperiodic-on-the-projective-line` (Silverman ADS,
Theorem 3.22; AWS notes, Theorem 17(c)). -/
theorem canonicalHeight_eq_zero_iff (hf : 2 ≤ f.degree) (P : ℙ F (Fin 2 → F)) :
    f.canonicalHeight P = 0 ↔ IsPreperiodicPt (toEnd f) P := sorry

/-- `DY.1/northcott-for-preperiodic-points-on-the-projective-line`, bounded height (Northcott;
AWS notes, Theorem 15). -/
theorem exists_projLineAbsLogHeight_le_of_isPreperiodicPt (hf : 2 ≤ f.degree) :
    ∃ C, ∀ P, IsPreperiodicPt (toEnd f) P → projLineAbsLogHeight P ≤ C := sorry

/-- Finiteness of preperiodic affine points of bounded degree. -/
theorem finite_setOf_isPreperiodicPt_natDegree_minpoly_le (hf : 2 ≤ f.degree) (D : ℕ) :
    {x : F | IsPreperiodicPt (toEnd f) (Projectivization.mk F ![x, 1] (by simp)) ∧
      (minpoly ℚ x).natDegree ≤ D}.Finite := sorry

end Absolute

/-- Finiteness of the preperiodic points over a number field. -/
theorem finite_preperiodicPts_of_numberField {K : Type*} [Field K] [NumberField K]
    {f : RationalMap K} (hf : 2 ≤ f.degree) : (preperiodicPts (toEnd f)).Finite := sorry

/-- `DY.1/canonical-height-eq-relative-div-finrank`: on a number field the absolute canonical
height is the relative one divided by the degree. -/
theorem canonicalHeight_eq_relCanonicalHeight_div {K : Type*} [Field K] [NumberField K]
    {f : RationalMap K} (hf : 2 ≤ f.degree) (P : ℙ K (Fin 2 → K)) :
    f.canonicalHeight P = f.relCanonicalHeight P / Module.finrank ℚ K := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.canonicalHeight_powMap`: for the power map
`z ↦ z^d`, `d ≥ 2`, the canonical height is the Weil height (the acceptance example; Silverman ADS,
p. 99). -/
example {F : Type*} [Field F] [CharZero F] [Algebra.IsAlgebraic ℚ F] (d : ℕ) (hd : 2 ≤ d) :
    (ofPolynomial (Polynomial.X ^ d : Polynomial F)).canonicalHeight = projLineAbsLogHeight :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.canonicalHeight_sq_two`: `ĥ_{z²}([2 : 1]) =
log 2`. -/
example : (ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)).canonicalHeight
    (Projectivization.mk ℚ ![2, 1] (by simp)) = Real.log 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.canonicalHeight_chebyshev`: for `z² - 2`,
`-2 ↦ 2 ↦ 2` is preperiodic, so `ĥ([-2 : 1]) = 0` although `h([-2 : 1]) = log 2`: the canonical
height is not the Weil height in general. -/
example : (ofPolynomial (Polynomial.X ^ 2 - 2 : Polynomial ℚ)).canonicalHeight
    (Projectivization.mk ℚ ![-2, 1] (by simp)) = 0 ∧
    projLineAbsLogHeight (Projectivization.mk ℚ ![-2, 1] (by simp)) = Real.log 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.canonicalHeight_rat_compat`: over `ℚ` the
absolute and relative canonical heights agree. -/
example (f : RationalMap ℚ) (hf : 2 ≤ f.degree) :
    f.canonicalHeight = f.relCanonicalHeight := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.RationalMap.canonicalHeight_sq_I`: over `ℚ̄`, `i` is
preperiodic for `z²` (`i ↦ -1 ↦ 1`), so `ĥ(i) = 0`. -/
example (i : AlgebraicClosure ℚ) (hi : i ^ 2 = -1) :
    (ofPolynomial (Polynomial.X ^ 2 : Polynomial (AlgebraicClosure ℚ))).canonicalHeight
      (Projectivization.mk _ ![i, 1] (by simp)) = 0 := sorry

end RationalMap

end CanonicalHeightP1

/-! ### Statements that are not prototyped at the pin

* `DY.1/canonical-height`, `DY.1/zero-canonical-height-iff-preperiodic`,
  `DY.1/northcott-for-preperiodic-points` and `DY.1/canonical-height-for-a-divisorial-eigenclass`
  (Call–Silverman, Theorem 1.1 and Corollary 1.1.1) need a projective variety `V` over a number
  field, `Pic(V)` with pullback and ampleness, and the Weil height machine `L ↦ h_L`, supplied by
  `HeightsRationalPointsAndObstructions:RP.0`. Their abstract content is `tateLimit`,
  `abs_tateLimit_sub_le`, `tateLimit_apply`, `eq_tateLimit_of_bounded`,
  `tateLimit_eq_zero_of_isPreperiodicPt` and `isPreperiodicPt_of_tateLimit_eq_zero` applied to
  `h = h_L`, whose hypothesis `|h_L ∘ φ - d h_L| ≤ C` is the height machine's functoriality.
* `DY.1/canonical-height-of-projective-space-morphism` compares that construction for
  `(ℙ¹, f, 𝒪(1))` with `RationalMap.canonicalHeight` above.
* `DY.1/tate-limit-of-elliptic-doubling` would import
  `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight` (Tau Ceti is not built locally):
  `tateLimit (fun Q ↦ 2 • Q) WeierstrassCurve.Affine.Point.naiveHeight 4 P = 2 * P.canonicalHeight`
  and, for every `m ≥ 2`,
  `tateLimit (fun Q ↦ m • Q) WeierstrassCurve.Affine.Point.naiveHeight (m ^ 2) P =
    2 * P.canonicalHeight`, for `W` elliptic over a field with `Height.AdmissibleAbsValues`.
* `DY.1/canonical-height-of-multiplication-on-an-abelian-variety` needs abelian varieties and the
  Néron–Tate height from `HeightsRationalPointsAndObstructions:RP.0`.
-/

end DY1

end TauCeti.ArithmeticDynamics

end DY1File


-- ===== DY.2 =====

section DY2File

/-!
# ArithmeticDynamics, DY.2: local dynamics and reduction (suggested forms)

This section of the suggested file is not the roadmap and is not exhaustive: the roadmap document
is definitive. The statements below suggest Lean forms so that contributors and reviewers converge
on names and signatures. Every proof is `sorry`; nothing here is an implementation claim.

It is appended after the DY.0 and DY.1 sections and uses their declarations: `HomogeneousLift`
(with `forms`, `eval`, `smul`, `map`), `binaryResultant`, `RationalMap` (with `mk`, `toEnd`,
`multiplier`, `fixedPoints`, `HasGoodReduction`, `reduction`, `ofPolynomial`), `projReduction`,
and DY.1's `RationalMap.relCanonicalHeight` and `RationalMap.canonicalHeight`.

Conventions pinned here (see the roadmap document, DY.2):
* `v : AbsoluteValue K ℝ` is an absolute value (archimedean or not) and `‖x‖_v = ⨆ i, v (x i)` for
  `x : Fin 2 → K` (Mathlib's height convention); a place of a number field is used through its
  absolute value `w.1` (Mathlib's normalised `FinitePlace`, and `InfinitePlace` with `mult`).
* The affine coordinate is `z ↔ [z : 1] = mk K ![z, 1]` and `∞ = [1 : 0]`, as in DY.0.
* The Laplacian on the Berkovich line has DeMarco–Krieger–Ye's sign: `Δ log⁺|T| = δ_ζ − δ_∞`.

The Berkovich projective line and its potential theory are owned by
`TropicalAndBerkovichArithmetic:TB.0` and `TB.1`, and the measure-valued Laplacian on the Riemann
sphere is a recorded gap of the packet. The namespace `DY2Standin` below states locally only what
this section needs from them (a model of the Berkovich line by multiplicative seminorms, its Gauss
point, its type I points and the two Laplacians), to be replaced by the suppliers' declarations.
-/

namespace TauCeti.ArithmeticDynamics

section DY2

open scoped LinearAlgebra.Projectivization MatrixGroups Topology
open Filter MvPolynomial

/-! ### The homogeneous escape rate (`DY.2/escape-rate` and its lemmas) -/

section EscapeRate

variable {K : Type*} [Field K] {d : ℕ}

/-- `DY.2/escape-rate`: the homogeneous escape rate `G_{F,v}(x) = lim d⁻ⁿ log ‖Fⁿ(x)‖_v`. The
limit exists for `x ≠ 0` and `d ≥ 2` (`escapeRate_tendsto`), so the junk value of `limUnder` is
never used. -/
noncomputable def escapeRate (v : AbsoluteValue K ℝ) (F : HomogeneousLift K d) (x : Fin 2 → K) :
    ℝ :=
  limUnder atTop fun n : ℕ ↦ Real.log (⨆ i, v ((F.eval)^[n] x i)) / (d : ℝ) ^ n

variable (v : AbsoluteValue K ℝ) (F : HomogeneousLift K d)

/-- `DY.2/escape-rate-tendsto` (Baker–Rumely, Lemma 3.5). -/
theorem escapeRate_tendsto (hd : 2 ≤ d) {x : Fin 2 → K} (hx : x ≠ 0) :
    Tendsto (fun n : ℕ ↦ Real.log (⨆ i, v ((F.eval)^[n] x i)) / (d : ℝ) ^ n) atTop
      (𝓝 (escapeRate v F x)) := sorry

/-- `DY.2/escape-rate-sub-log-norm-bounds` (Baker–Rumely, Remark 3.6). -/
theorem escapeRate_abs_sub_log_norm_le (hd : 2 ≤ d) :
    ∃ C, ∀ x : Fin 2 → K, x ≠ 0 → |escapeRate v F x - Real.log (⨆ i, v (x i))| ≤ C := sorry

/-- `DY.2/escape-rate-functional-equation` (Baker–Rumely, (LH2)). -/
theorem escapeRate_apply_lift (hd : 2 ≤ d) {x : Fin 2 → K} (hx : x ≠ 0) :
    escapeRate v F (F.eval x) = d * escapeRate v F x := sorry

/-- `DY.2/escape-rate-homogeneity` (Baker–Rumely, (LH3)). -/
theorem escapeRate_smul (hd : 2 ≤ d) {x : Fin 2 → K} (hx : x ≠ 0) {a : K} (ha : a ≠ 0) :
    escapeRate v F (a • x) = escapeRate v F x + Real.log (v a) := sorry

/-- `DY.2/escape-rate-scale-lift`: `G_{cF} = G_F + log |c| / (d - 1)`. -/
theorem escapeRate_const_smul_lift (hd : 2 ≤ d) {x : Fin 2 → K} (hx : x ≠ 0) (c : Kˣ) :
    escapeRate v (HomogeneousLift.smul c F) x =
      escapeRate v F x + Real.log (v c) / ((d : ℝ) - 1) := sorry

/-- `DY.2/escape-rate-iterate-lift`: a lift of `fᵐ` of degree `dᵐ` has the same escape rate. -/
theorem escapeRate_iterate_lift (hd : 2 ≤ d) {m : ℕ} (hm : 1 ≤ m) (G : HomogeneousLift K (d ^ m))
    (hG : ∀ y, G.eval y = (F.eval)^[m] y) {x : Fin 2 → K} (hx : x ≠ 0) :
    escapeRate v G x = escapeRate v F x := sorry

/-- `DY.2/escape-rate-conjugation` (DeMarco–Krieger–Ye, proof of Proposition 2.1): if
`G = A⁻¹ ∘ F ∘ A` then `G_{G,v}(x) = G_{F,v}(A x)`. -/
theorem escapeRate_conj (hd : 2 ≤ d) (A : GL (Fin 2) K) (G : HomogeneousLift K d)
    (hG : ∀ y, G.eval y = (A⁻¹ : GL (Fin 2) K).val.mulVec (F.eval (A.val.mulVec y)))
    {x : Fin 2 → K} (hx : x ≠ 0) :
    escapeRate v G x = escapeRate v F (A.val.mulVec x) := sorry

/-- `DY.2/escape-rate-base-change`. -/
theorem escapeRate_algebraMap {L : Type*} [Field L] [Algebra K L] (w : AbsoluteValue L ℝ)
    (hw : ∀ a, w (algebraMap K L a) = v a) (x : Fin 2 → K) :
    escapeRate w (F.map (algebraMap K L)) (fun i ↦ algebraMap K L (x i)) = escapeRate v F x :=
  sorry

/-- Galois equivariance of the escape rate (used for the Galois-averaged decomposition of
DeMarco–Krieger–Ye (2.3)). -/
theorem escapeRate_comp_ringEquiv {L : Type*} [Field L] [Algebra K L] (σ : L ≃ₐ[K] L)
    (w w' : AbsoluteValue L ℝ) (hw : ∀ a, w' a = w (σ a)) (y : Fin 2 → L) :
    escapeRate w' (F.map (algebraMap K L)) y =
      escapeRate w (F.map (algebraMap K L)) (fun i ↦ σ (y i)) := sorry

/-- Changing the normalisation of the absolute value scales the escape rate. -/
theorem escapeRate_rpow_abv (v' : AbsoluteValue K ℝ) {s : ℝ} (hs : 0 < s)
    (h : ∀ a, v' a = v a ^ s) (x : Fin 2 → K) :
    escapeRate v' F x = s * escapeRate v F x := sorry

/-- `DY.2/escape-rate-continuous`. -/
theorem continuous_escapeRate {E : Type*} [NormedField E] (G : HomogeneousLift E d)
    (hd : 2 ≤ d) : ContinuousOn (escapeRate (NormedField.toAbsoluteValue E) G) {x | x ≠ 0} :=
  sorry

/-- `DY.2/escape-rate-nonpos-iff-bounded-orbit` (Baker–Rumely, Lemma 3.8). -/
theorem escapeRate_nonpos_iff (hd : 2 ≤ d) {x : Fin 2 → K} (hx : x ≠ 0) :
    escapeRate v F x ≤ 0 ↔ BddAbove (Set.range fun n : ℕ ↦ ⨆ i, v ((F.eval)^[n] x i)) := sorry

/-- The escape rate of the power map is the logarithm of the norm, at every absolute value. -/
theorem escapeRate_monomial (hd : 2 ≤ d)
    (hF : F.forms = ![(X 0 : MvPolynomial (Fin 2) K) ^ d, X 1 ^ d]) {x : Fin 2 → K} (hx : x ≠ 0) :
    escapeRate v F x = Real.log (⨆ i, v (x i)) := sorry

/-- `DY.2/lift-norm-upper-bound`. -/
theorem sup_abv_eval_le : ∃ C, ∀ x : Fin 2 → K,
    (⨆ i, v (F.eval x i)) ≤ C * (⨆ i, v (x i)) ^ d := sorry

/-- `DY.2/lift-norm-lower-bound`. -/
theorem exists_pos_mul_le_sup_abv_eval (hd : 1 ≤ d) : ∃ c > 0, ∀ x : Fin 2 → K,
    c * (⨆ i, v (x i)) ^ d ≤ ⨆ i, v (F.eval x i) := sorry

/-- `DY.2/lift-norm-of-good-reduction` (Baker–Rumely, Lemma 3.9). -/
theorem sup_abv_eval_eq_of_goodReduction (hv : IsNonarchimedean v)
    (hint : ∀ i m, v ((F.forms i).coeff m) ≤ 1)
    (hres : v (binaryResultant d d (F.forms 0) (F.forms 1)) = 1) (x : Fin 2 → K) :
    (⨆ i, v (F.eval x i)) = (⨆ i, v (x i)) ^ d := sorry

/-- `DY.2/escape-rate-of-good-reduction` (Baker–Rumely, Lemma 3.9). -/
theorem escapeRate_eq_log_of_goodReduction (hd : 2 ≤ d) (hv : IsNonarchimedean v)
    (hint : ∀ i m, v ((F.forms i).coeff m) ≤ 1)
    (hres : v (binaryResultant d d (F.forms 0) (F.forms 1)) = 1) {x : Fin 2 → K} (hx : x ≠ 0) :
    escapeRate v F x = Real.log (⨆ i, v (x i)) := sorry

/-- `DY.2/good-reduction-of-escape-rate`: over an algebraically closed nonarchimedean field (so
that the residue field is algebraically closed), `G_{F,v} = log ‖·‖_v` for a normalised lift
forces a unit resultant. -/
theorem abv_binaryResultant_eq_one_of_escapeRate {E : Type*} [NormedField E] [IsAlgClosed E]
    [IsUltrametricDist E] (G : HomogeneousLift E d) (hd : 2 ≤ d)
    (hint : ∀ i m, ‖(G.forms i).coeff m‖ ≤ 1) (hnorm : ∃ i m, ‖(G.forms i).coeff m‖ = 1)
    (hG : ∀ x : Fin 2 → E, x ≠ 0 →
      escapeRate (NormedField.toAbsoluteValue E) G x = Real.log (⨆ i, ‖x i‖)) :
    ‖binaryResultant d d (G.forms 0) (G.forms 1)‖ = 1 := sorry

/-- Unit test `escapeRate_powerMap`: for `(X², Y²)` at the archimedean
absolute value of `ℚ`, `G(3, 1) = log 3` and `G(1, 1) = 0`. -/
example (w : AbsoluteValue ℚ ℝ) (hw : ∀ q : ℚ, w q = |(q : ℝ)|) (G : HomogeneousLift ℚ 2)
    (hG : G.forms = ![X 0 ^ 2, X 1 ^ 2]) :
    escapeRate w G ![3, 1] = Real.log 3 ∧ escapeRate w G ![1, 1] = 0 := sorry

/-- Unit test `escapeRate_padicCantor_zero`: for the lift
`(X^p - X Y^(p-1), p Y^p)` of `(z^p - z)/p` at `|·|_p`, `G(0, 1) = -(log p)/(p - 1)`, which is not
the one-step value `(1/p) log ‖F(0, 1)‖_p = -(log p)/p`. -/
example (p : ℕ) [Fact p.Prime] (w : AbsoluteValue ℚ ℝ) (hw : ∀ q : ℚ, w q = padicNorm p q)
    (G : HomogeneousLift ℚ p)
    (hG : G.forms = ![X 0 ^ p - X 0 * X 1 ^ (p - 1), C (p : ℚ) * X 1 ^ p]) :
    escapeRate w G ![0, 1] = -Real.log p / ((p : ℝ) - 1) ∧
      Real.log (⨆ i, w (G.eval ![0, 1] i)) / p ≠ escapeRate w G ![0, 1] := sorry

/-- Unit test `escapeRate_goodReduction_degenerate`: for the lift of
`z² - z - 1`, `G = log ‖·‖_p` at every prime. -/
example (p : ℕ) [Fact p.Prime] (w : AbsoluteValue ℚ ℝ) (hw : ∀ q : ℚ, w q = padicNorm p q)
    (G : HomogeneousLift ℚ 2) (hG : G.forms = ![X 0 ^ 2 - X 0 * X 1 - X 1 ^ 2, X 1 ^ 2]) :
    ∀ x : Fin 2 → ℚ, x ≠ 0 → escapeRate w G x = Real.log (⨆ i, w (x i)) := sorry

/-- Unit test `escapeRate_monicPolynomial_compat`: for `z² + c` over
`ℂ`, `G(z, 1)` is the classical escape rate `lim 2⁻ⁿ log max(|fⁿ(z)|, 1)`; for `c = 0` it is
`log⁺ |z|`. -/
example (c : ℂ) (G : HomogeneousLift ℂ 2) (hG : G.forms = ![X 0 ^ 2 + C c * X 1 ^ 2, X 1 ^ 2])
    (z : ℂ) :
    Tendsto (fun n : ℕ ↦ Real.log (max ‖(fun w : ℂ ↦ w ^ 2 + c)^[n] z‖ 1) / (2 : ℝ) ^ n) atTop
        (𝓝 (escapeRate (NormedField.toAbsoluteValue ℂ) G ![z, 1])) ∧
      (c = 0 → escapeRate (NormedField.toAbsoluteValue ℂ) G ![z, 1] = Real.posLog ‖z‖) := sorry

/-- Unit test `escapeRate_depends_on_lift`: scaling the lift `(X², Y²)`
by `2` shifts the archimedean escape rate by `log 2`. -/
example (w : AbsoluteValue ℚ ℝ) (hw : ∀ q : ℚ, w q = |(q : ℝ)|) (G : HomogeneousLift ℚ 2)
    (hG : G.forms = ![X 0 ^ 2, X 1 ^ 2]) {x : Fin 2 → ℚ} (hx : x ≠ 0) :
    escapeRate w (HomogeneousLift.smul (Units.mk0 2 two_ne_zero) G) x =
        escapeRate w G x + Real.log 2 ∧
      escapeRate w (HomogeneousLift.smul (Units.mk0 2 two_ne_zero) G) x ≠ escapeRate w G x :=
  sorry

/-- `DY.2/escape-rate-trivial-at-almost-all-places`. -/
theorem finite_setOf_escapeRate_ne {k : Type*} [Field k] [NumberField k] (G : HomogeneousLift k d)
    (hd : 2 ≤ d) {x : Fin 2 → k} (hx : x ≠ 0) :
    {w : NumberField.FinitePlace k | escapeRate w.1 G x ≠ 0 ∨ (⨆ i, w.1 (x i)) ≠ 1}.Finite :=
  sorry

end EscapeRate

/-! ### Local canonical heights and the Green function (`DY.2/local-canonical-height`,
`DY.2/dynamical-green-function`) -/

section LocalHeight

variable {K : Type*} [Field K] {d : ℕ} (v : AbsoluteValue K ℝ) (F : HomogeneousLift K d)

/-- `DY.2/local-canonical-height`: `λ̂_{F,v}(z) = G_{F,v}(z, 1)` (DeMarco–Krieger–Ye (2.4)). -/
noncomputable def localCanonicalHeight (z : K) : ℝ :=
  escapeRate v F ![z, 1]

/-- `DY.2/dynamical-green-function`: `g_{F,v}([x]) = G_{F,v}(x) - log ‖x‖_v` on `ℙ¹(K)`. -/
noncomputable def dynamicalGreenFunction (P : ℙ K (Fin 2 → K)) : ℝ :=
  escapeRate v F P.rep - Real.log (⨆ i, v (P.rep i))

theorem localCanonicalHeight_eq_escapeRate_sub_log (hd : 2 ≤ d) {x : Fin 2 → K} (hx : x 1 ≠ 0) :
    localCanonicalHeight v F (x 0 / x 1) = escapeRate v F x - Real.log (v (x 1)) := sorry

theorem localCanonicalHeight_eq_green_add_posLog (hd : 2 ≤ d) (z : K) :
    localCanonicalHeight v F z =
      dynamicalGreenFunction v F (Projectivization.mk K ![z, 1] (by simp)) +
        Real.posLog (v z) := sorry

/-- `DY.2/local-canonical-height-weil-bound`. -/
theorem abs_localCanonicalHeight_sub_posLog_le (hd : 2 ≤ d) :
    ∃ C, ∀ z : K, |localCanonicalHeight v F z - Real.posLog (v z)| ≤ C := sorry

/-- `DY.2/local-canonical-height-functional-equation` (Baker–Rumely (3.28);
Call–Silverman, Theorem 2.1 with `a = 1`). -/
theorem localCanonicalHeight_apply_map (hd : 2 ≤ d) {z : K}
    (hz : eval ![z, 1] (F.forms 1) ≠ 0) :
    localCanonicalHeight v F (eval ![z, 1] (F.forms 0) / eval ![z, 1] (F.forms 1)) =
      d * localCanonicalHeight v F z - Real.log (v (eval ![z, 1] (F.forms 1))) := sorry

theorem localCanonicalHeight_const_smul_lift (hd : 2 ≤ d) (c : Kˣ) (z : K) :
    localCanonicalHeight v (HomogeneousLift.smul c F) z =
      localCanonicalHeight v F z + Real.log (v c) / ((d : ℝ) - 1) := sorry

/-- `DY.2/local-canonical-height-at-infinity` (DeMarco–Krieger–Ye (2.6)). -/
theorem tendsto_localCanonicalHeight_sub_log {E : Type*} [NormedField E] (G : HomogeneousLift E d)
    (hd : 2 ≤ d) :
    Tendsto (fun z : E ↦ localCanonicalHeight (NormedField.toAbsoluteValue E) G z - Real.log ‖z‖)
      (Bornology.cobounded E) (𝓝 (escapeRate (NormedField.toAbsoluteValue E) G ![1, 0])) := sorry

/-- `DY.2/local-decomposition-of-canonical-height`, affine form. -/
theorem sum_localCanonicalHeight {k : Type*} [Field k] [NumberField k] (G : HomogeneousLift k d)
    (hd : 2 ≤ d) (z : k) :
    (∑ w : NumberField.InfinitePlace k, (w.mult : ℝ) * localCanonicalHeight w.1 G z) +
        ∑ᶠ w : NumberField.FinitePlace k, localCanonicalHeight w.1 G z =
      Module.finrank ℚ k *
        (RationalMap.mk G).canonicalHeight (Projectivization.mk k ![z, 1] (by simp)) := sorry

/-- `DY.2/sum-of-escape-rates-over-places`. -/
theorem tendsto_logHeight_iterate_div {k : Type*} [Field k] [NumberField k]
    (G : HomogeneousLift k d) (hd : 2 ≤ d) {x : Fin 2 → k} (hx : x ≠ 0) :
    Tendsto (fun n : ℕ ↦ Height.logHeight ((G.eval)^[n] x) / (d : ℝ) ^ n) atTop
      (𝓝 ((∑ w : NumberField.InfinitePlace k, (w.mult : ℝ) * escapeRate w.1 G x) +
        ∑ᶠ w : NumberField.FinitePlace k, escapeRate w.1 G x)) := sorry

/-- `DY.2/local-decomposition-of-canonical-height`, homogeneous form for DY.1's relative
canonical height. -/
theorem relCanonicalHeight_eq_sum_escapeRate {k : Type*} [Field k] [NumberField k]
    (G : HomogeneousLift k d) (hd : 2 ≤ d) {x : Fin 2 → k} (hx : x ≠ 0) :
    (RationalMap.mk G).relCanonicalHeight (Projectivization.mk k x hx) =
      (∑ w : NumberField.InfinitePlace k, (w.mult : ℝ) * escapeRate w.1 G x) +
        ∑ᶠ w : NumberField.FinitePlace k, escapeRate w.1 G x := sorry

theorem dynamicalGreenFunction_mk (hd : 2 ≤ d) {x : Fin 2 → K} (hx : x ≠ 0) :
    dynamicalGreenFunction v F (Projectivization.mk K x hx) =
      escapeRate v F x - Real.log (⨆ i, v (x i)) := sorry

theorem abs_dynamicalGreenFunction_le (hd : 2 ≤ d) :
    ∃ C, ∀ P : ℙ K (Fin 2 → K), |dynamicalGreenFunction v F P| ≤ C := sorry

/-- `DY.2/green-function-functional-equation`. -/
theorem dynamicalGreenFunction_apply_map (hd : 2 ≤ d) {x : Fin 2 → K} (hx : x ≠ 0) :
    dynamicalGreenFunction v F (RationalMap.toEnd (RationalMap.mk F) (Projectivization.mk K x hx)) =
      d * dynamicalGreenFunction v F (Projectivization.mk K x hx) -
        Real.log ((⨆ i, v (F.eval x i)) / (⨆ i, v (x i)) ^ d) := sorry

/-- `DY.2/green-function-uniqueness` (Call–Silverman, Theorem 2.1, uniqueness). -/
theorem dynamicalGreenFunction_unique (hd : 2 ≤ d) {γ : ℙ K (Fin 2 → K) → ℝ}
    (hγ : ∃ C, ∀ P, |γ P| ≤ C)
    (hγf : ∀ (x : Fin 2 → K) (hx : x ≠ 0),
      γ (RationalMap.toEnd (RationalMap.mk F) (Projectivization.mk K x hx)) =
        d * γ (Projectivization.mk K x hx) -
          Real.log ((⨆ i, v (F.eval x i)) / (⨆ i, v (x i)) ^ d)) :
    γ = dynamicalGreenFunction v F := sorry

theorem dynamicalGreenFunction_eq_zero_of_goodReduction (hd : 2 ≤ d) (hv : IsNonarchimedean v)
    (hint : ∀ i m, v ((F.forms i).coeff m) ≤ 1)
    (hres : v (binaryResultant d d (F.forms 0) (F.forms 1)) = 1) :
    dynamicalGreenFunction v F = 0 := sorry

/-- Continuity of the Green function, stated on nonzero representatives. -/
theorem continuous_dynamicalGreenFunction {E : Type*} [NormedField E] (G : HomogeneousLift E d)
    (hd : 2 ≤ d) :
    ContinuousOn (fun x : Fin 2 → E ↦
      escapeRate (NormedField.toAbsoluteValue E) G x - Real.log (⨆ i, ‖x i‖)) {x | x ≠ 0} :=
  sorry

/-- Unit test `localCanonicalHeight_powerMap`: for `(X², Y²)`,
`λ̂ = log⁺ v`; at `|·|₃`, `λ̂(1/9) = log 9` and `λ̂(3) = 0`. -/
example (w : AbsoluteValue ℚ ℝ) (hw : ∀ q : ℚ, w q = padicNorm 3 q) (G : HomogeneousLift ℚ 2)
    (hG : G.forms = ![X 0 ^ 2, X 1 ^ 2]) :
    (∀ z, localCanonicalHeight w G z = Real.posLog (w z)) ∧
      localCanonicalHeight w G (1 / 9) = Real.log 9 ∧ localCanonicalHeight w G 3 = 0 := sorry

/-- Unit test `localCanonicalHeight_padicCantor`: for the lift of
`(z^p - z)/p` at `|·|_p`, `λ̂ = -(log p)/(p - 1)` on `ℤ_p` and `λ̂(z) = log |z|_p` for
`|z|_p > 1`. -/
example (p : ℕ) [Fact p.Prime] (G : HomogeneousLift ℚ_[p] p)
    (hG : G.forms = ![X 0 ^ p - X 0 * X 1 ^ (p - 1), C (p : ℚ_[p]) * X 1 ^ p]) (z : ℚ_[p]) :
    (‖z‖ ≤ 1 → localCanonicalHeight (NormedField.toAbsoluteValue ℚ_[p]) G z =
      -Real.log p / ((p : ℝ) - 1)) ∧
    (1 < ‖z‖ → localCanonicalHeight (NormedField.toAbsoluteValue ℚ_[p]) G z = Real.log ‖z‖) :=
  sorry

/-- Unit test `localCanonicalHeight_goodReduction`: for the lift of
`z² - z - 1`, `λ̂ = log⁺ |·|_p` at every prime. -/
example (p : ℕ) [Fact p.Prime] (w : AbsoluteValue ℚ ℝ) (hw : ∀ q : ℚ, w q = padicNorm p q)
    (G : HomogeneousLift ℚ 2) (hG : G.forms = ![X 0 ^ 2 - X 0 * X 1 - X 1 ^ 2, X 1 ^ 2]) :
    localCanonicalHeight w G = fun z ↦ Real.posLog (w z) := sorry

/-- Unit test `localCanonicalHeight_callSilverman`: `λ̂` satisfies
Call–Silverman's two axioms for the divisor `(∞)` with `φ = F₁(z, 1)`. -/
example (hd : 2 ≤ d) :
    (∃ C, ∀ z : K, |localCanonicalHeight v F z - Real.posLog (v z)| ≤ C) ∧
      ∀ z : K, eval ![z, 1] (F.forms 1) ≠ 0 →
        localCanonicalHeight v F (eval ![z, 1] (F.forms 0) / eval ![z, 1] (F.forms 1)) =
          d * localCanonicalHeight v F z + -Real.log (v (eval ![z, 1] (F.forms 1))) := sorry

/-- Unit test `localCanonicalHeight_not_posLog`: for
`(z² + 1)/(3z)` over `ℂ₃`, `λ̂(i) = -(1/2) log 3 ≠ log⁺ |i|₃ = 0`. -/
example (G : HomogeneousLift ℂ_[3] 2) (hG : G.forms = ![X 0 ^ 2 + X 1 ^ 2, 3 * X 0 * X 1])
    (i : ℂ_[3]) (hi : i ^ 2 = -1) :
    localCanonicalHeight (NormedField.toAbsoluteValue ℂ_[3]) G i = -(1 / 2) * Real.log 3 ∧
      localCanonicalHeight (NormedField.toAbsoluteValue ℂ_[3]) G i ≠ Real.posLog ‖i‖ := sorry

/-- Unit test `dynamicalGreenFunction_powerMap`: `g = 0` for the power
map at every absolute value. -/
example (hd : 2 ≤ d) (hF : F.forms = ![(X 0 : MvPolynomial (Fin 2) K) ^ d, X 1 ^ d]) :
    dynamicalGreenFunction v F = 0 := sorry

/-- Unit test `dynamicalGreenFunction_padicCantor`: for the lift of
`(z^p - z)/p` at `|·|_p`, `g([0 : 1]) = -(log p)/(p - 1)` and `g([1 : 0]) = 0`. -/
example (p : ℕ) [Fact p.Prime] (G : HomogeneousLift ℚ_[p] p)
    (hG : G.forms = ![X 0 ^ p - X 0 * X 1 ^ (p - 1), C (p : ℚ_[p]) * X 1 ^ p]) :
    dynamicalGreenFunction (NormedField.toAbsoluteValue ℚ_[p]) G
        (Projectivization.mk ℚ_[p] ![0, 1] (by simp)) = -Real.log p / ((p : ℝ) - 1) ∧
      dynamicalGreenFunction (NormedField.toAbsoluteValue ℚ_[p]) G
        (Projectivization.mk ℚ_[p] ![1, 0] (by simp)) = 0 := sorry

/-- Unit test `dynamicalGreenFunction_scale`: rescaling the lift adds
`log |c| / (d - 1)`. -/
example (hd : 2 ≤ d) (c : Kˣ) :
    dynamicalGreenFunction v (HomogeneousLift.smul c F) =
      fun P ↦ dynamicalGreenFunction v F P + Real.log (v c) / ((d : ℝ) - 1) := sorry

/-- Unit test `dynamicalGreenFunction_not_zero_nonclosed`: for
`(z² + 1)/(3z)`, `g` vanishes on `ℙ¹(ℚ₃)` but not on `ℙ¹(ℂ₃)`. -/
example (G : HomogeneousLift ℚ_[3] 2) (hG : G.forms = ![X 0 ^ 2 + X 1 ^ 2, 3 * X 0 * X 1])
    (G' : HomogeneousLift ℂ_[3] 2) (hG' : G'.forms = ![X 0 ^ 2 + X 1 ^ 2, 3 * X 0 * X 1]) :
    dynamicalGreenFunction (NormedField.toAbsoluteValue ℚ_[3]) G = 0 ∧
      ∃ i : ℂ_[3], i ^ 2 = -1 ∧
        dynamicalGreenFunction (NormedField.toAbsoluteValue ℂ_[3]) G'
          (Projectivization.mk ℂ_[3] ![i, 1] (by simp)) = -(1 / 2) * Real.log 3 := sorry

end LocalHeight

/-! ### Reduction of cycles and multipliers (`DY.2/multiplier-of-a-periodic-cycle` and its
lemmas; reduction of points is DY.0's `projReduction`) -/

section Multiplier

variable {K : Type*} [Field K]

/-- `DY.2/multiplier-of-a-periodic-cycle`: the multiplier of the cycle of `P`, DY.0's
fixed-point multiplier of `fⁿ` with `n` the exact period. -/
noncomputable def cycleMultiplier (f : RationalMap K) (P : ℙ K (Fin 2 → K)) : K :=
  (f ^ Function.minimalPeriod (RationalMap.toEnd f) P).multiplier P

theorem cycleMultiplier_def (f : RationalMap K) {P : ℙ K (Fin 2 → K)} {n : ℕ}
    (hn : Function.minimalPeriod (RationalMap.toEnd f) P = n) :
    cycleMultiplier f P = (f ^ n).multiplier P := sorry

theorem multiplier_pow_mul (f : RationalMap K) {P : ℙ K (Fin 2 → K)} {n : ℕ}
    (hP : Function.IsPeriodicPt (RationalMap.toEnd f) n P) (k : ℕ) :
    (f ^ (k * n)).multiplier P = ((f ^ n).multiplier P) ^ k := sorry

/-- `DY.2/multiplier-chain-rule`, for polynomial maps in the affine chart. -/
theorem cycleMultiplier_eq_prod_deriv (p : Polynomial K) {z : K} {n : ℕ}
    (hn : Function.minimalPeriod (RationalMap.toEnd (RationalMap.ofPolynomial p))
      (Projectivization.mk K ![z, 1] (by simp)) = n) (hz : (fun y ↦ p.eval y)^[n] z = z) :
    cycleMultiplier (RationalMap.ofPolynomial p) (Projectivization.mk K ![z, 1] (by simp)) =
      ∏ i ∈ Finset.range n, p.derivative.eval ((fun y ↦ p.eval y)^[i] z) := sorry

/-- `DY.2/multiplier-constant-on-cycle`. -/
theorem cycleMultiplier_toEnd (f : RationalMap K) {P : ℙ K (Fin 2 → K)}
    (hP : P ∈ Function.periodicPts (RationalMap.toEnd f)) :
    cycleMultiplier f (RationalMap.toEnd f P) = cycleMultiplier f P := sorry

theorem cycleMultiplier_smul (γ : PGL(2, K)) (f : RationalMap K) (P : ℙ K (Fin 2 → K)) :
    cycleMultiplier (γ • f) (γ • P) = cycleMultiplier f P := sorry

/-- `DY.2/multiplier-reduction`: multipliers of cycles reduce to multipliers. -/
theorem cycleMultiplier_reduction (R : Type*) [CommRing R] [IsDomain R] [ValuationRing R]
    [Algebra R K] [IsFractionRing R K] {f : RationalMap K} (hf : f.HasGoodReduction R)
    {P : ℙ K (Fin 2 → K)} {n : ℕ} (hP : Function.IsPeriodicPt (RationalMap.toEnd f) n P) :
    ∃ a : R, algebraMap R K a = (f ^ n).multiplier P ∧
      IsLocalRing.residue R a = ((f.reduction R hf) ^ n).multiplier (projReduction R P) := sorry

open scoped Classical in
theorem cycleMultiplier_eq_one_iff [IsAlgClosed K] {f : RationalMap K} (hf : 2 ≤ f.degree)
    {P : ℙ K (Fin 2 → K)} (hP : P ∈ Function.periodicPts (RationalMap.toEnd f)) :
    cycleMultiplier f P = 1 ↔
      2 ≤ (f ^ Function.minimalPeriod (RationalMap.toEnd f) P).fixedPoints.count P := sorry

/-- `DY.2/reduction-of-periodic-points` (Silverman, AWS notes, Proposition 24(c)). -/
theorem minimalPeriod_projReduction_dvd (R : Type*) [CommRing R] [IsDomain R] [ValuationRing R]
    [Algebra R K] [IsFractionRing R K] {f : RationalMap K} (hf : f.HasGoodReduction R)
    {P : ℙ K (Fin 2 → K)} (hP : P ∈ Function.periodicPts (RationalMap.toEnd f)) :
    Function.minimalPeriod (RationalMap.toEnd (f.reduction R hf)) (projReduction R P) ∣
      Function.minimalPeriod (RationalMap.toEnd f) P := sorry

/-- `DY.2/periods-under-good-reduction` (Morton–Silverman; Silverman, AWS notes, Theorem 25):
with `m` the period of the reduction and `r` the order of the reduced multiplier (`orderOf = 0`
encodes infinite order), `n = m` or `n = m r p^e` with `p` the residue characteristic. -/
theorem minimalPeriod_eq_or_eq_mul_ringChar_pow (R : Type*) [CommRing R] [IsDomain R]
    [ValuationRing R] [Algebra R K] [IsFractionRing R K] {f : RationalMap K} (hd : 2 ≤ f.degree)
    (hf : f.HasGoodReduction R) {P : ℙ K (Fin 2 → K)}
    (hP : P ∈ Function.periodicPts (RationalMap.toEnd f)) :
    let n := Function.minimalPeriod (RationalMap.toEnd f) P
    let m := Function.minimalPeriod (RationalMap.toEnd (f.reduction R hf)) (projReduction R P)
    let r := orderOf (((f.reduction R hf) ^ m).multiplier (projReduction R P))
    n = m ∨ (r ≠ 0 ∧ ∃ e : ℕ, n = m * r * ringChar (IsLocalRing.ResidueField R) ^ e ∧
      (ringChar (IsLocalRing.ResidueField R) = 0 → e = 0)) := sorry

/-- `DY.2/period-exponent-bound` (Hutz, Theorem 2), over `ℚ_[p]`: `e ≤ 1` for odd `p` and
`e ≤ 3` for `p = 2`. -/
theorem minimalPeriod_dvd_padic (p : ℕ) [Fact p.Prime] {f : RationalMap ℚ_[p]}
    (hd : 2 ≤ f.degree) (hf : f.HasGoodReduction ℤ_[p]) {P : ℙ ℚ_[p] (Fin 2 → ℚ_[p])}
    (hP : P ∈ Function.periodicPts (RationalMap.toEnd f)) :
    let n := Function.minimalPeriod (RationalMap.toEnd f) P
    let m := Function.minimalPeriod (RationalMap.toEnd (f.reduction ℤ_[p] hf))
      (projReduction ℤ_[p] P)
    let r := orderOf (((f.reduction ℤ_[p] hf) ^ m).multiplier (projReduction ℤ_[p] P))
    n = m ∨ ∃ e : ℕ, n = m * r * p ^ e ∧ (p ≠ 2 → e ≤ 1) ∧ (p = 2 → e ≤ 3) := sorry

/-- `DY.2/zieve-period-exponent-bound` (Zieve; Silverman, AWS notes, Theorem 27), over `ℚ_[p]`:
`e = 0` for `p ≥ 5` and `e ≤ 1` for `p ∈ {2, 3}`. -/
theorem minimalPeriod_padic_zieve (p : ℕ) [Fact p.Prime] {f : RationalMap ℚ_[p]}
    (hd : 2 ≤ f.degree) (hf : f.HasGoodReduction ℤ_[p]) {P : ℙ ℚ_[p] (Fin 2 → ℚ_[p])}
    (hP : P ∈ Function.periodicPts (RationalMap.toEnd f)) :
    let n := Function.minimalPeriod (RationalMap.toEnd f) P
    let m := Function.minimalPeriod (RationalMap.toEnd (f.reduction ℤ_[p] hf))
      (projReduction ℤ_[p] P)
    let r := orderOf (((f.reduction ℤ_[p] hf) ^ m).multiplier (projReduction ℤ_[p] P))
    n = m ∨ ∃ e : ℕ, n = m * r * p ^ e ∧ (5 ≤ p → e = 0) ∧ (p ≤ 3 → e ≤ 1) := sorry

/-- `DY.2/rational-periods-bounded-by-good-prime` (Silverman, AWS notes, Corollary 26, with
Hutz's exponent bound). -/
theorem minimalPeriod_le_of_hasGoodReduction (p : ℕ) [Fact p.Prime] {f : RationalMap ℚ_[p]}
    (hd : 2 ≤ f.degree) (hf : f.HasGoodReduction ℤ_[p]) {P : ℙ ℚ_[p] (Fin 2 → ℚ_[p])}
    (hP : P ∈ Function.periodicPts (RationalMap.toEnd f)) :
    Function.minimalPeriod (RationalMap.toEnd f) P ≤ if p = 2 then 24 else p ^ 3 - p := sorry

/-- `DY.2/good-reduction-multipliers-integral`: no repelling cycles under good reduction. -/
theorem norm_multiplier_le_one_of_hasGoodReduction (p : ℕ) [Fact p.Prime]
    {f : RationalMap ℚ_[p]} (hf : f.HasGoodReduction ℤ_[p]) {P : ℙ ℚ_[p] (Fin 2 → ℚ_[p])}
    {n : ℕ} (hP : Function.IsPeriodicPt (RationalMap.toEnd f) n P) :
    ‖(f ^ n).multiplier P‖ ≤ 1 := sorry

/-- Unit test `cycleMultiplier_twoCycle`: the 2-cycle `{1, -1}` of
`z² - z - 1` has multiplier `-3`. -/
example : cycleMultiplier (RationalMap.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X - 1 :
    Polynomial ℚ)) (Projectivization.mk ℚ ![1, 1] (by simp)) = -3 := sorry

/-- Unit test `cycleMultiplier_fixed`: at fixed points the cycle
multiplier is DY.0's multiplier: `d` at `1` and `0` at `∞` for `z^d`. -/
example (d : ℕ) (hd : 2 ≤ d) :
    cycleMultiplier (RationalMap.ofPolynomial (Polynomial.X ^ d : Polynomial ℚ))
        (Projectivization.mk ℚ ![1, 1] (by simp)) = d ∧
      cycleMultiplier (RationalMap.ofPolynomial (Polynomial.X ^ d : Polynomial ℚ))
        (Projectivization.mk ℚ ![1, 0] (by simp)) = 0 := sorry

/-- Unit test `cycleMultiplier_infinity`: `∞` is a fixed point of
`(z² + 1)/(3z)` with multiplier `3`. -/
example (G : HomogeneousLift ℚ 2) (hG : G.forms = ![X 0 ^ 2 + X 1 ^ 2, 3 * X 0 * X 1]) :
    cycleMultiplier (RationalMap.mk G) (Projectivization.mk ℚ ![1, 0] (by simp)) = 3 := sorry

/-- Unit test `cycleMultiplier_eq_multiplier_pow`: for the point `1`
of exact period `2` of `z² - z - 1`, the cycle multiplier is the multiplier of `f²`, `-3`. -/
example :
    cycleMultiplier (RationalMap.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X - 1 :
        Polynomial ℚ)) (Projectivization.mk ℚ ![1, 1] (by simp)) =
      (RationalMap.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X - 1 : Polynomial ℚ) ^ 2).multiplier
        (Projectivization.mk ℚ ![1, 1] (by simp)) := sorry

/-- Unit test `multiplier_ne_cycleMultiplier`: `1` is not fixed by
`z² - z - 1` (its exact period is `2`), so DY.0's fixed-point multiplier of `f` itself is not the
cycle multiplier. -/
example :
    Function.minimalPeriod (RationalMap.toEnd (RationalMap.ofPolynomial
        (Polynomial.X ^ 2 - Polynomial.X - 1 : Polynomial ℚ)))
        (Projectivization.mk ℚ ![1, 1] (by simp)) = 2 ∧
      cycleMultiplier (RationalMap.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X - 1 :
        Polynomial ℚ)) (Projectivization.mk ℚ ![1, 1] (by simp)) ≠
      (RationalMap.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X - 1 : Polynomial ℚ)).multiplier
        (Projectivization.mk ℚ ![1, 1] (by simp)) := sorry

end Multiplier

/-! ### Local stand-ins for TB.0 and TB.1 (to be replaced by the suppliers' declarations) -/

namespace DY2Standin

/-- Stand-in for `TropicalAndBerkovichArithmetic:TB.0`: the Berkovich affine line, the
multiplicative seminorms on `K[T]` extending the norm of `K`. -/
noncomputable def AffineLine (K : Type*) [NormedField K] : Type _ :=
  {p : MulRingSeminorm (Polynomial K) // ∀ a : K, p (Polynomial.C a) = ‖a‖}

noncomputable instance (K : Type*) [NormedField K] : TopologicalSpace (AffineLine K) :=
  TopologicalSpace.induced (fun p (g : Polynomial K) ↦ p.1 g) inferInstance

/-- Stand-in for TB.0: the Berkovich projective line `A^{1,an} ∪ {∞}`. -/
noncomputable abbrev Line (K : Type*) [NormedField K] : Type _ :=
  OnePoint (AffineLine K)

noncomputable instance (K : Type*) [NormedField K] : MeasurableSpace (Line K) := borel _

/-- Stand-in for TB.0: the Gauss point `ζ_{0,1}`. -/
noncomputable def gauss (K : Type*) [NormedField K] : Line K := sorry

/-- Stand-in for TB.0: the type I point attached to a point of `ℙ¹(K)`. -/
noncomputable def ofProj {K : Type*} [NormedField K] : ℙ K (Fin 2 → K) → Line K := sorry

/-- Stand-in for TB.0: the analytification of a rational map. -/
noncomputable def analytic {K : Type*} [NormedField K] (f : RationalMap K) : Line K → Line K :=
  sorry

/-- Stand-in for TB.1: the measure-valued Laplacian with `Δ log⁺|T| = δ_ζ - δ_∞`. -/
noncomputable def laplacian {K : Type*} [NormedField K] (u : Line K → ℝ) :
    MeasureTheory.SignedMeasure (Line K) := sorry

/-- Stand-in for TB.1: pull-back of measures along the analytification of a rational map. -/
noncomputable def pullback {K : Type*} [NormedField K] (f : RationalMap K)
    (μ : MeasureTheory.Measure (Line K)) : MeasureTheory.Measure (Line K) := sorry

/-- Stand-in for TB.1: `x` is a point of type II. -/
def IsTypeII {K : Type*} [NormedField K] (x : Line K) : Prop :=
  ∃ (a : K) (r : ℝ), 0 < r ∧ r ∈ Set.range (fun b : Kˣ ↦ ‖(b : K)‖) ∧
    ∀ g : Polynomial K, (∃ y : AffineLine K, x = (y : Line K) ∧ y.1 g =
      ⨆ c ∈ Metric.closedBall a r, ‖g.eval c‖)

noncomputable instance : MeasurableSpace (OnePoint ℂ) := borel _

/-- Stand-in for the gap of the packet: the measure-valued Laplacian on the Riemann sphere,
normalised as `dd^c` (`Δ log |z| = δ₀`). -/
noncomputable def sphereLaplacian (u : OnePoint ℂ → ℝ) : MeasureTheory.SignedMeasure (OnePoint ℂ) :=
  sorry

/-- Stand-in for the gap of the packet: pull-back of measures on the Riemann sphere along a
rational map (counting preimages with multiplicity). -/
noncomputable def spherePullback (f : RationalMap ℂ) (μ : MeasureTheory.Measure (OnePoint ℂ)) :
    MeasureTheory.Measure (OnePoint ℂ) := sorry

end DY2Standin

/-! ### The Berkovich escape potential and the canonical measure (`DY.2/berkovich-escape-potential`,
`DY.2/canonical-measure`) -/

section CanonicalMeasure

open DY2Standin MeasureTheory

variable {K : Type*} [NormedField K] {d : ℕ} (F : HomogeneousLift K d)

/-- The forms of the `n`-th composite of `F` dehomogenised at `X₁ = 1`, as polynomials in `T`
(the functions `[Fⁿ_i(T, 1)]_x` of the Berkovich construction). -/
noncomputable def iterateFormsAffine (n : ℕ) (i : Fin 2) : Polynomial K :=
  MvPolynomial.aeval ![Polynomial.X, 1]
    ((fun G : Fin 2 → MvPolynomial (Fin 2) K ↦ fun j ↦ MvPolynomial.aeval G (F.forms j))^[n]
      ![X 0, X 1] i)

/-- `DY.2/berkovich-escape-potential`: the continuous extension `ĝ_F` of the Green function to
the Berkovich line. -/
noncomputable def berkovichEscapePotential (F : HomogeneousLift K d) : Line K → ℝ := sorry

/-- The extended local canonical height `λ̂^{an} = ĝ_F + log max([T], 1)` on the Berkovich affine
line (with a junk value at `∞`). -/
noncomputable def berkovichLocalCanonicalHeight (F : HomogeneousLift K d) : Line K → ℝ := sorry

theorem berkovichEscapePotential_classical (hd : 2 ≤ d) (P : ℙ K (Fin 2 → K)) :
    berkovichEscapePotential F (ofProj P) =
      dynamicalGreenFunction (NormedField.toAbsoluteValue K) F P := sorry

theorem continuous_berkovichEscapePotential (hd : 2 ≤ d) :
    Continuous (berkovichEscapePotential F) := sorry

theorem berkovichEscapePotential_eq_limit (hd : 2 ≤ d) (x : AffineLine K) :
    Tendsto (fun n : ℕ ↦ Real.log (max (x.1 (iterateFormsAffine F n 0))
        (x.1 (iterateFormsAffine F n 1))) / (d : ℝ) ^ n - Real.log (max (x.1 Polynomial.X) 1))
      atTop (𝓝 (berkovichEscapePotential F (x : Line K))) := sorry

theorem berkovichEscapePotential_const_smul_lift (hd : 2 ≤ d) (c : Kˣ) :
    berkovichEscapePotential (HomogeneousLift.smul c F) =
      fun x ↦ berkovichEscapePotential F x + Real.log ‖(c : K)‖ / ((d : ℝ) - 1) := sorry

theorem berkovichEscapePotential_eq_zero_of_goodReduction [IsUltrametricDist K] (hd : 2 ≤ d)
    (hint : ∀ i m, ‖(F.forms i).coeff m‖ ≤ 1)
    (hres : ‖binaryResultant d d (F.forms 0) (F.forms 1)‖ = 1) :
    berkovichEscapePotential F = 0 := sorry

theorem berkovichLocalCanonicalHeight_apply (hd : 2 ≤ d) (x : AffineLine K) :
    berkovichLocalCanonicalHeight F (x : Line K) =
      berkovichEscapePotential F (x : Line K) + Real.log (max (x.1 Polynomial.X) 1) := sorry

/-- Unit test `berkovichEscapePotential_gauss_padicCantor`: for the
lift of `(z^p - z)/p` over `ℂ_p`, `ĝ(ζ_{0,1}) = 0` while `ĝ = -(log p)/(p - 1)` on `ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] (G : HomogeneousLift ℂ_[p] p)
    (hG : G.forms = ![X 0 ^ p - X 0 * X 1 ^ (p - 1), C (p : ℂ_[p]) * X 1 ^ p]) :
    berkovichEscapePotential G (gauss ℂ_[p]) = 0 ∧
      ∀ a : ℚ_[p], ‖a‖ ≤ 1 → berkovichEscapePotential G
        (ofProj (Projectivization.mk ℂ_[p] ![(a : ℂ_[p]), 1] (by simp))) =
          -Real.log p / ((p : ℝ) - 1) := sorry

/-- Unit test `berkovichEscapePotential_powerMap`: `ĝ = 0` for the
power map. -/
example (hd : 2 ≤ d) (hF : F.forms = ![(X 0 : MvPolynomial (Fin 2) K) ^ d, X 1 ^ d]) :
    berkovichEscapePotential F = 0 := sorry

/-- Unit test `berkovichEscapePotential_classical_compat`: on type I
points `ĝ` is the Green function. -/
example (hd : 2 ≤ d) :
    berkovichEscapePotential F ∘ ofProj = dynamicalGreenFunction (NormedField.toAbsoluteValue K) F :=
  sorry

/-- Unit test `berkovichEscapePotential_not_onestep`: the one-step
function differs from `ĝ` at `0` for the lift of `(z^p - z)/p`. -/
example (p : ℕ) [Fact p.Prime] (G : HomogeneousLift ℂ_[p] p)
    (hG : G.forms = ![X 0 ^ p - X 0 * X 1 ^ (p - 1), C (p : ℂ_[p]) * X 1 ^ p]) :
    Real.log (⨆ i, ‖G.eval ![0, 1] i‖) / p ≠
      berkovichEscapePotential G (ofProj (Projectivization.mk ℂ_[p] ![0, 1] (by simp))) := sorry

/-- `DY.2/canonical-measure`: `µ_{f,v} = Δĝ_F + δ_{ζ_{0,1}}`, independent of the lift. -/
noncomputable def canonicalMeasure (f : RationalMap K) : Measure (Line K) := sorry

/-- `DY.2/canonical-measure-is-probability`. -/
theorem isProbabilityMeasure_canonicalMeasure [IsAlgClosed K] [IsUltrametricDist K]
    [CompleteSpace K] (f : RationalMap K) (hf : 2 ≤ f.degree) :
    IsProbabilityMeasure (canonicalMeasure f) := sorry

/-- `DY.2/laplacian-of-local-canonical-height`: `Δλ̂ = µ - δ_∞`. -/
theorem laplacian_berkovichLocalCanonicalHeight [IsAlgClosed K] [IsUltrametricDist K]
    [CompleteSpace K] (hd : 2 ≤ d) [IsFiniteMeasure (canonicalMeasure (RationalMap.mk F))] :
    laplacian (berkovichLocalCanonicalHeight F) =
      (canonicalMeasure (RationalMap.mk F)).toSignedMeasure -
        (Measure.dirac (OnePoint.infty : Line K)).toSignedMeasure := sorry

/-- `DY.2/canonical-measure-invariance`: `f^*µ = d µ`. -/
theorem canonicalMeasure_pullback [IsAlgClosed K] [IsUltrametricDist K] [CompleteSpace K]
    (f : RationalMap K) (hf : 2 ≤ f.degree) :
    pullback f (canonicalMeasure f) = (f.degree : ENNReal) • canonicalMeasure f := sorry

theorem canonicalMeasure_iterate [IsAlgClosed K] [IsUltrametricDist K] [CompleteSpace K]
    (f : RationalMap K) (hf : 2 ≤ f.degree) {n : ℕ} (hn : 1 ≤ n) :
    canonicalMeasure (f ^ n) = canonicalMeasure f := sorry

/-- `DY.2/canonical-measure-conjugation`: `µ_{γ⁻¹ • f} = (γ^{an})^* µ_f` (DY.0's convention
`γ • f = γ ∘ f ∘ γ⁻¹`). -/
theorem canonicalMeasure_conj [IsAlgClosed K] [IsUltrametricDist K] [CompleteSpace K]
    (f : RationalMap K) (hf : 2 ≤ f.degree) (γ : (RationalMap K)ˣ) (hγ : (γ : RationalMap K).degree = 1) :
    canonicalMeasure (((γ⁻¹ : (RationalMap K)ˣ) : RationalMap K) * f * (γ : RationalMap K)) =
      pullback (γ : RationalMap K) (canonicalMeasure f) := sorry

/-- `DY.2/canonical-measure-of-good-reduction` and `DY.2/good-reduction-of-canonical-measure`. -/
theorem canonicalMeasure_eq_dirac_gauss_iff [IsAlgClosed K] [IsUltrametricDist K] [CompleteSpace K]
    (R : Type*) [CommRing R] [IsDomain R] [ValuationRing R] [Algebra R K] [IsFractionRing R K]
    (hR : ∀ a : R, ‖algebraMap R K a‖ ≤ 1) (f : RationalMap K) (hf : 2 ≤ f.degree) :
    canonicalMeasure f = Measure.dirac (gauss K) ↔ f.HasGoodReduction R := sorry

/-- `DY.2/potential-good-reduction-iff-point-mass`. -/
theorem canonicalMeasure_isPointMass_iff [IsAlgClosed K] [IsUltrametricDist K] [CompleteSpace K]
    (R : Type*) [CommRing R] [IsDomain R] [ValuationRing R] [Algebra R K] [IsFractionRing R K]
    (hR : ∀ a : R, ‖algebraMap R K a‖ ≤ 1) (f : RationalMap K) (hf : 2 ≤ f.degree) :
    (∃ ξ : Line K, IsTypeII ξ ∧ canonicalMeasure f = Measure.dirac ξ) ↔
      ∃ γ : (RationalMap K)ˣ, (γ : RationalMap K).degree = 1 ∧
        (((γ⁻¹ : (RationalMap K)ˣ) : RationalMap K) * f * (γ : RationalMap K)).HasGoodReduction R := sorry

theorem canonicalMeasure_classical_null [IsAlgClosed K] [IsUltrametricDist K] [CompleteSpace K]
    (f : RationalMap K) (hf : 2 ≤ f.degree) (P : ℙ K (Fin 2 → K)) :
    canonicalMeasure f {ofProj P} = 0 := sorry

/-- Unit test `canonicalMeasure_goodReduction_quadratic`: for
`z² - z - 1` over `ℂ_p` the canonical measure is the Gauss point mass. -/
example (p : ℕ) [Fact p.Prime] :
    canonicalMeasure (RationalMap.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X - 1 :
      Polynomial ℂ_[p])) = Measure.dirac (gauss ℂ_[p]) := sorry

/-- Unit test `canonicalMeasure_padicCantor`: for `(z^p - z)/p` over
`ℂ_p` the canonical measure is Haar measure on `ℤ_p`: it gives mass `p^{-k}` to the type I points
of each disc `a + p^k ℤ_p` and is carried by `ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] (G : HomogeneousLift ℂ_[p] p)
    (hG : G.forms = ![X 0 ^ p - X 0 * X 1 ^ (p - 1), C (p : ℂ_[p]) * X 1 ^ p]) :
    (∀ (a : ℚ_[p]) (k : ℕ), ‖a‖ ≤ 1 →
      canonicalMeasure (RationalMap.mk G)
          ((fun z : ℚ_[p] ↦ ofProj (Projectivization.mk ℂ_[p] ![(z : ℂ_[p]), 1] (by simp))) ''
            Metric.closedBall a ((p : ℝ) ^ (-(k : ℤ)))) =
        ENNReal.ofReal ((p : ℝ) ^ (-(k : ℤ)))) ∧
    canonicalMeasure (RationalMap.mk G)
        ((fun z : ℚ_[p] ↦ ofProj (Projectivization.mk ℂ_[p] ![(z : ℂ_[p]), 1] (by simp))) ''
          Metric.closedBall 0 1)ᶜ = 0 := sorry

/-- Unit test `canonicalMeasure_powerMap`: `µ = δ_ζ` for `z^d` in every
residue characteristic. -/
example (p : ℕ) [Fact p.Prime] (d : ℕ) (hd : 2 ≤ d) :
    canonicalMeasure (RationalMap.ofPolynomial (Polynomial.X ^ d : Polynomial ℂ_[p])) =
      Measure.dirac (gauss ℂ_[p]) := sorry

/-- Unit test `canonicalMeasure_ne_gauss_nonclosed`: for
`(z² + 1)/(3z)` the Green function vanishes on `ℙ¹(ℚ₃)` but `µ_{f,3} ≠ δ_ζ` over `ℂ₃`. -/
example (G : HomogeneousLift ℚ_[3] 2) (hG : G.forms = ![X 0 ^ 2 + X 1 ^ 2, 3 * X 0 * X 1])
    (G' : HomogeneousLift ℂ_[3] 2) (hG' : G'.forms = ![X 0 ^ 2 + X 1 ^ 2, 3 * X 0 * X 1]) :
    dynamicalGreenFunction (NormedField.toAbsoluteValue ℚ_[3]) G = 0 ∧
      canonicalMeasure (RationalMap.mk G') ≠ Measure.dirac (gauss ℂ_[3]) := sorry

/-- Unit test `canonicalMeasure_notDirac_classical`: the canonical
measure is never a point mass at a type I point. -/
example (p : ℕ) [Fact p.Prime] (f : RationalMap ℂ_[p]) (hf : 2 ≤ f.degree)
    (P : ℙ ℂ_[p] (Fin 2 → ℂ_[p])) : canonicalMeasure f ≠ Measure.dirac (ofProj P) := sorry

end CanonicalMeasure

/-! ### The archimedean canonical measure (`DY.2/archimedean-canonical-measure`) -/

section Archimedean

open DY2Standin MeasureTheory

/-- The normalised arc-length measure `ω` on the unit circle of the Riemann sphere. -/
noncomputable def unitCircleMeasure : Measure (OnePoint ℂ) :=
  (ENNReal.ofReal (2 * Real.pi))⁻¹ • Measure.map
    (fun θ : ℝ ↦ ((Complex.exp (θ * Complex.I) : ℂ) : OnePoint ℂ))
    (volume.restrict (Set.Ioc 0 (2 * Real.pi)))

/-- `DY.2/archimedean-canonical-measure`: `µ_{f,∞} = Δg_F + ω` on the Riemann sphere. -/
noncomputable def archimedeanCanonicalMeasure (f : RationalMap ℂ) : Measure (OnePoint ℂ) :=
  sorry

/-- `Δλ̂_{F,∞} = µ_{f,∞} - δ_∞` (with the stand-in Laplacian of the recorded gap). -/
theorem laplacian_localCanonicalHeight_archimedean {d : ℕ} (F : HomogeneousLift ℂ d) (hd : 2 ≤ d)
    [IsFiniteMeasure (archimedeanCanonicalMeasure (RationalMap.mk F))] :
    sphereLaplacian (fun z : OnePoint ℂ ↦ OnePoint.elim z 0
      (localCanonicalHeight (NormedField.toAbsoluteValue ℂ) F)) =
      (archimedeanCanonicalMeasure (RationalMap.mk F)).toSignedMeasure -
        (Measure.dirac (OnePoint.infty : OnePoint ℂ)).toSignedMeasure := sorry

/-- `DY.2/archimedean-canonical-measure-properties`. -/
theorem isProbabilityMeasure_archimedeanCanonicalMeasure (f : RationalMap ℂ) (hf : 2 ≤ f.degree) :
    IsProbabilityMeasure (archimedeanCanonicalMeasure f) := sorry

theorem archimedeanCanonicalMeasure_pullback (f : RationalMap ℂ) (hf : 2 ≤ f.degree) :
    spherePullback f (archimedeanCanonicalMeasure f) =
      (f.degree : ENNReal) • archimedeanCanonicalMeasure f := sorry

theorem archimedeanCanonicalMeasure_noAtoms (f : RationalMap ℂ) (hf : 2 ≤ f.degree)
    (z : OnePoint ℂ) : archimedeanCanonicalMeasure f {z} = 0 := sorry

/-- `DY.2/archimedean-canonical-measure-is-maximal-entropy-measure`: `µ_{f,∞}` is the unique
atom-free probability measure `µ` with `f^*µ = d µ` (Lyubich; Freire–Lopes–Mañé; Baker–Rumely,
Theorem 2.1(B)). -/
theorem archimedeanCanonicalMeasure_eq_lyubich (f : RationalMap ℂ) (hf : 2 ≤ f.degree)
    (μ : Measure (OnePoint ℂ)) [IsProbabilityMeasure μ] (hμ : ∀ z, μ {z} = 0)
    (hf' : spherePullback f μ = (f.degree : ENNReal) • μ) :
    μ = archimedeanCanonicalMeasure f := sorry

/-- Unit test `archimedeanCanonicalMeasure_powerMap`: for `z^d` the
canonical measure is the normalised arc length on the unit circle. -/
example (d : ℕ) (hd : 2 ≤ d) :
    archimedeanCanonicalMeasure (RationalMap.ofPolynomial (Polynomial.X ^ d : Polynomial ℂ)) =
      unitCircleMeasure := sorry

/-- Unit test `archimedeanCanonicalMeasure_chebyshev`: for
`z² - 2` the canonical measure is the arcsine law on `[-2, 2]`. -/
example :
    archimedeanCanonicalMeasure (RationalMap.ofPolynomial (Polynomial.X ^ 2 - 2 : Polynomial ℂ)) =
      Measure.map (fun x : ℝ ↦ ((x : ℂ) : OnePoint ℂ))
        ((volume.restrict (Set.Icc (-2 : ℝ) 2)).withDensity
          fun x ↦ ENNReal.ofReal (1 / (Real.pi * Real.sqrt (4 - x ^ 2)))) := sorry

/-- Unit test `archimedeanCanonicalMeasure_iterate`: `µ_{fⁿ} = µ_f`. -/
example (f : RationalMap ℂ) (hf : 2 ≤ f.degree) (n : ℕ) (hn : 1 ≤ n) :
    archimedeanCanonicalMeasure (f ^ n) = archimedeanCanonicalMeasure f := sorry

/-- Unit test `archimedeanCanonicalMeasure_not_circle`: for
`z² - z - 1` the canonical measure is not the arc length of the unit circle. -/
example :
    archimedeanCanonicalMeasure (RationalMap.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X - 1 :
      Polynomial ℂ)) ≠ unitCircleMeasure := sorry

end Archimedean

end DY2

end TauCeti.ArithmeticDynamics

end DY2File


-- ===== DY.3 =====

section DY3File

/-!
# ArithmeticDynamics, DY.3: periodic-point equations and finite bounds (suggested Lean forms)

This section is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here is an implementation claim.

It is appended after the DY.0–DY.2 sections and uses their declarations: DY.0's
`HomogeneousLift` (with `forms`, `comp`, `id`, `map`, `ofPolynomial`), `RationalMap` (with `mk`,
`toEnd`, `ofPolynomial`, `map`, `multiplier`, `HasGoodReduction`, `reduction`), `linearSubst`,
`IsPreperiodicPt` and `preperiodicPts`, and DY.2's `cycleMultiplier`.

Conventions pinned here (and in the roadmap document):
* a self-map of `ℙ¹` over a field `K` is presented by a homogeneous lift `F : HomogeneousLift K d`
  (the two forms `F.forms 0`, `F.forms 1`, variables `X 0 = X`, `X 1 = Y`); the `n`-th iterate uses
  the composite lift `F.iterate n` (DY.0's `HomogeneousLift.comp`), so the forms of `fⁿ` are fixed,
  not only their ratio; the induced self-map of `ℙ¹(K)` is DY.0's `toEnd (RationalMap.mk F)`;
* points of `ℙ¹(K)` are Mathlib's `ℙ K (Fin 2 → K)`; a vector `P : Fin 2 → K` stands for
  `[P 0 : P 1]`, so `![0, 1]` is `z = 0` and `![1, 0]` is `∞`;
* the period form is `Φₙ = Y·Fₙ − X·Gₙ` (Morton–Silverman 1995, (21));
* multiplicities are orders of vanishing of binary forms (`binaryFormOrder`), and the essential
  multiplicity is the Möbius transform `a*_P(n) = ∑_{d ∣ n} μ(n/d) a_P(d)`;
* the multiplier of a cycle is DY.2's `cycleMultiplier`.
-/

namespace TauCeti.ArithmeticDynamics

section DY3

open scoped ArithmeticFunction.Moebius LinearAlgebra.Projectivization

variable {K : Type*} [Field K] {d : ℕ}

/-! ### The composite lift of an iterate -/

namespace HomogeneousLift

/-- The `n`-fold composite `F ∘ ⋯ ∘ F` of a homogeneous lift, built from DY.0's
`HomogeneousLift.comp` and `HomogeneousLift.id`: a lift of `fⁿ` of degree `dⁿ` whose two forms are
fixed, not only their ratio. -/
noncomputable def iterate (F : HomogeneousLift K d) : (n : ℕ) → HomogeneousLift K (d ^ n)
  | 0 => HomogeneousLift.id
  | n + 1 => (F.iterate n).comp F

theorem iterate_succ_forms (F : HomogeneousLift K d) (n : ℕ) (i : Fin 2) :
    (F.iterate (n + 1)).forms i = MvPolynomial.aeval F.forms ((F.iterate n).forms i) := sorry

theorem mk_iterate (F : HomogeneousLift K d) (n : ℕ) :
    RationalMap.mk (F.iterate n) = RationalMap.mk F ^ n := sorry

end HomogeneousLift

/-! ### Orders of binary forms at points of `ℙ¹` (node `DY.3/binary-form-order-at-a-point`) -/

/-- The order of vanishing of a binary form `F` at the point `[P 0 : P 1]`: the multiplicity of
the linear form `P 1 · X − P 0 · Y` in `F` (Mathlib's `multiplicity`, junk value for `F = 0`). -/
noncomputable def binaryFormOrder (F : MvPolynomial (Fin 2) K) (P : Fin 2 → K) : ℕ :=
  multiplicity (MvPolynomial.C (P 1) * MvPolynomial.X 0 - MvPolynomial.C (P 0) * MvPolynomial.X 1) F

theorem binaryFormOrder_eq_zero_iff {F : MvPolynomial (Fin 2) K} (hF : F ≠ 0) {P : Fin 2 → K}
    (hP : P ≠ 0) : binaryFormOrder F P = 0 ↔ MvPolynomial.eval P F ≠ 0 := sorry

theorem binaryFormOrder_mul {F G : MvPolynomial (Fin 2) K} (hF : F ≠ 0) (hG : G ≠ 0)
    {P : Fin 2 → K} (hP : P ≠ 0) :
    binaryFormOrder (F * G) P = binaryFormOrder F P + binaryFormOrder G P := sorry

theorem binaryFormOrder_smul_point (F : MvPolynomial (Fin 2) K) (P : Fin 2 → K) {c : K}
    (hc : c ≠ 0) : binaryFormOrder F (c • P) = binaryFormOrder F P := sorry

theorem binaryFormOrder_affine {F : MvPolynomial (Fin 2) K} {D : ℕ} (hF : F.IsHomogeneous D)
    (hF0 : F ≠ 0) (a : K) :
    binaryFormOrder F ![a, 1] =
      (MvPolynomial.aeval ![Polynomial.X, 1] F : Polynomial K).rootMultiplicity a := sorry

theorem pow_dvd_iff_le_binaryFormOrder {F : MvPolynomial (Fin 2) K} (hF : F ≠ 0) {P : Fin 2 → K}
    (hP : P ≠ 0) (k : ℕ) :
    (MvPolynomial.C (P 1) * MvPolynomial.X 0 - MvPolynomial.C (P 0) * MvPolynomial.X 1) ^ k ∣ F ↔
      k ≤ binaryFormOrder F P := sorry

/-- The order is the multiplicity of the point in DY.0's `binaryRoots`. -/
theorem binaryFormOrder_eq_count_binaryRoots {F : MvPolynomial (Fin 2) K} {D : ℕ}
    (hF : F.IsHomogeneous D) (hF0 : F ≠ 0) {P : Fin 2 → K} (hP : P ≠ 0) :
    open scoped Classical in
    binaryFormOrder F P = (binaryRoots D F).count (Projectivization.mk K P hP) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryFormOrder_test_zero`: `X²Y` vanishes to order two
at `[0 : 1]`. -/
example : binaryFormOrder (MvPolynomial.X 0 ^ 2 * MvPolynomial.X 1 : MvPolynomial (Fin 2) ℚ)
    ![0, 1] = 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryFormOrder_test_infinity`: `X²Y` vanishes to order
one at `∞ = [1 : 0]`. -/
example : binaryFormOrder (MvPolynomial.X 0 ^ 2 * MvPolynomial.X 1 : MvPolynomial (Fin 2) ℚ)
    ![1, 0] = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryFormOrder_test_const`: a nonzero constant has
order zero everywhere. -/
example (P : Fin 2 → ℚ) (hP : P ≠ 0) : binaryFormOrder (1 : MvPolynomial (Fin 2) ℚ) P = 0 :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.binaryFormOrder_test_simple`: `X² − Y²` has a simple
zero at `[1 : 1]` (order one, not two). -/
example : binaryFormOrder (MvPolynomial.X 0 ^ 2 - MvPolynomial.X 1 ^ 2 : MvPolynomial (Fin 2) ℚ)
    ![1, 1] = 1 := sorry

/-! ### Factorisation of binary forms (node `DY.3/binary-form-divisibility-criterion`) -/

/-- Over an algebraically closed field, divisibility of nonzero binary forms is decided by the
orders at the points of `ℙ¹`. -/
theorem dvd_iff_binaryFormOrder_le [IsAlgClosed K] {F G : MvPolynomial (Fin 2) K} {a b : ℕ}
    (hF : F.IsHomogeneous a) (hG : G.IsHomogeneous b) (hF0 : F ≠ 0) (hG0 : G ≠ 0) :
    F ∣ G ↔ ∀ P : Fin 2 → K, P ≠ 0 → binaryFormOrder F P ≤ binaryFormOrder G P := sorry

/-- Divisibility of binary forms over `K` may be tested after a field extension. -/
theorem dvd_of_map_dvd_map {L : Type*} [Field L] [Algebra K L] {F G : MvPolynomial (Fin 2) K}
    (h : F.map (algebraMap K L) ∣ G.map (algebraMap K L)) : F ∣ G := sorry

/-! ### The period form `Φₙ = Y·Fₙ − X·Gₙ` (node `DY.3/period-form`) -/

/-- The `n`-th period form of the lift `F`: `Φₙ(F) = Y·Fₙ − X·Gₙ` where `(Fₙ, Gₙ)` are the forms of
the composite lift `F.iterate n` of `fⁿ` (Morton–Silverman 1995, (21)). -/
noncomputable def periodForm (F : HomogeneousLift K d) (n : ℕ) : MvPolynomial (Fin 2) K :=
  MvPolynomial.X 1 * (F.iterate n).forms 0 - MvPolynomial.X 0 * (F.iterate n).forms 1

theorem periodForm_zero (F : HomogeneousLift K d) : periodForm F 0 = 0 := sorry

theorem periodForm_isHomogeneous (F : HomogeneousLift K d) (n : ℕ) :
    (periodForm F n).IsHomogeneous (d ^ n + 1) := sorry

theorem periodForm_ne_zero (F : HomogeneousLift K d) (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n) :
    periodForm F n ≠ 0 := sorry

/-- Dehomogenisation: for a polynomial map, `Φₙ(X, 1) = fⁿ(X) − X`. -/
theorem aeval_periodForm_polynomialLift {f : Polynomial K} (hf : f.Monic) (n : ℕ) :
    MvPolynomial.aeval ![Polynomial.X, 1] (periodForm (HomogeneousLift.ofPolynomial f) n) =
      f.comp^[n] Polynomial.X - Polynomial.X := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.periodForm_test_square`: for `z ↦ z²` with lift
`(X², Y²)`, `Φ₁ = Y·X² − X·Y²`, vanishing at `0`, `1` and `∞`. -/
example (F : HomogeneousLift ℚ 2) (hF : F.forms = ![MvPolynomial.X 0 ^ 2, MvPolynomial.X 1 ^ 2]) :
    periodForm F 1 =
      MvPolynomial.X 1 * MvPolynomial.X 0 ^ 2 - MvPolynomial.X 0 * MvPolynomial.X 1 ^ 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.periodForm_test_zero`: the zeroth period form is `0`
(the identity is degenerate). -/
example (F : HomogeneousLift ℚ d) : periodForm F 0 = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.periodForm_test_quadratic`: for `z² + c`,
`Φ₁(X, 1) = X² − X + c`. -/
example (c : ℚ) :
    MvPolynomial.aeval ![Polynomial.X, 1]
        (periodForm (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 + Polynomial.C c)) 1) =
      Polynomial.X ^ 2 - Polynomial.X + Polynomial.C c := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.periodForm_test_identity`: the identity lift `(X, Y)` is
degenerate: its first period form vanishes identically. -/
example (F : HomogeneousLift ℚ 1) (hF : F.forms = ![MvPolynomial.X 0, MvPolynomial.X 1]) :
    periodForm F 1 = 0 := sorry

/-! ### Promoted API of the period form -/

/-- Node `DY.3/period-form-zero-locus`: the zeros of `Φₙ` on `ℙ¹(K)` are the points of
period `n` of DY.0's action `toEnd`. -/
theorem eval_periodForm_eq_zero_iff (F : HomogeneousLift K d) (n : ℕ) (P : Fin 2 → K)
    (hP : P ≠ 0) :
    MvPolynomial.eval P (periodForm F n) = 0 ↔
      (RationalMap.toEnd (RationalMap.mk F))^[n] (Projectivization.mk K P hP) =
        Projectivization.mk K P hP := sorry

/-- Node `DY.3/period-form-of-an-iterate`: `Φₖ(Fᵐ) = Φₘₖ(F)` for the composite lifts. -/
theorem periodForm_liftIterate (F : HomogeneousLift K d) (m k : ℕ) :
    periodForm (F.iterate m) k = periodForm F (m * k) := sorry

/-- Node `DY.3/period-form-conjugation`: if `G = A⁻¹ ∘ F ∘ A` for an invertible matrix `A` (a lift
of a conjugate of `mk F`, DY.0's `linearSubst` being `X ↦ A X`), the period form of `G` is `det(A)⁻¹`
times that of `F` after the substitution `X ↦ A X`. -/
theorem periodForm_conj (F G : HomogeneousLift K d) (A : Matrix (Fin 2) (Fin 2) K)
    (hA : IsUnit A.det)
    (hG : ∀ i, G.forms i = ∑ j, MvPolynomial.C (A⁻¹ i j) * linearSubst A (F.forms j)) (n : ℕ) :
    periodForm G n = MvPolynomial.C A.det⁻¹ * linearSubst A (periodForm F n) := sorry

/-- Node `DY.3/period-form-base-change`: the period form commutes with base change of the lift
along a field homomorphism (DY.0's `HomogeneousLift.map`). -/
theorem periodForm_map {L : Type*} [Field L] (σ : K →+* L) (F : HomogeneousLift K d) (n : ℕ) :
    periodForm (F.map σ) n = (periodForm F n).map σ := sorry

/-! ### Multiplicities (nodes `DY.3/multiplicity-of-a-periodic-point`,
`DY.3/essential-multiplicity`) -/

/-- `a_P(n)`: the multiplicity of `P` as a point of period `n`, the order of `Φₙ` at `P`. -/
noncomputable def periodicMultiplicity (F : HomogeneousLift K d) (n : ℕ) (P : Fin 2 → K) : ℕ :=
  binaryFormOrder (periodForm F n) P

theorem periodicMultiplicity_pos_iff (F : HomogeneousLift K d) (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n)
    (P : Fin 2 → K) (hP : P ≠ 0) :
    0 < periodicMultiplicity F n P ↔
      (RationalMap.toEnd (RationalMap.mk F))^[n] (Projectivization.mk K P hP) =
        Projectivization.mk K P hP := sorry

theorem periodicMultiplicity_liftIterate (F : HomogeneousLift K d) (m k : ℕ) (P : Fin 2 → K) :
    periodicMultiplicity (F.iterate m) k P = periodicMultiplicity F (m * k) P := sorry

theorem sum_periodicMultiplicity [IsAlgClosed K] (F : HomogeneousLift K d) (hd : 2 ≤ d) {n : ℕ}
    (hn : 0 < n) (S : Finset (Fin 2 → K)) (hS : ∀ P ∈ S, P ≠ 0)
    (hSinj : ∀ P ∈ S, ∀ Q ∈ S, (∃ c : K, c ≠ 0 ∧ Q = c • P) → P = Q)
    (hScover : ∀ P : Fin 2 → K, P ≠ 0 → MvPolynomial.eval P (periodForm F n) = 0 →
      ∃ Q ∈ S, ∃ c : K, c ≠ 0 ∧ P = c • Q) :
    ∑ P ∈ S, periodicMultiplicity F n P = d ^ n + 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.periodicMultiplicity_test_tangent`: for `z² − z`
(Morton–Silverman 1995, §1), `Z₂ = 3(0) + (2) + (∞)`, so `a₀(2) = 3`. -/
example : periodicMultiplicity
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X : Polynomial ℚ)) 2 ![0, 1] = 3 :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.periodicMultiplicity_test_fixed`: for `z² − z`, the
fixed point `0` has `a₀(1) = 1`. -/
example : periodicMultiplicity
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X : Polynomial ℚ)) 1 ![0, 1] = 1 :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.periodicMultiplicity_test_nonperiodic`: a point that is
not fixed has multiplicity zero in `Φ₁`: `2` is not fixed by `z²`. -/
example : periodicMultiplicity (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)) 1
    ![2, 1] = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.periodicMultiplicity_test_infinity`: for a polynomial map
of degree `≥ 2`, `∞` is a simple root of every `Φₙ`. -/
example (n : ℕ) (hn : 0 < n) :
    periodicMultiplicity
      (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X : Polynomial ℚ)) n ![1, 0] =
        1 := sorry

/-- `a*_P(n) = ∑_{d ∣ n} μ(n/d) a_P(d)`: the multiplicity of `P` in the dynatomic cycle. -/
noncomputable def essentialMultiplicity (F : HomogeneousLift K d) (n : ℕ) (P : Fin 2 → K) : ℤ :=
  ∑ x ∈ n.divisorsAntidiagonal, μ x.1 * (periodicMultiplicity F x.2 P : ℤ)

theorem essentialMultiplicity_one (F : HomogeneousLift K d) (P : Fin 2 → K) :
    essentialMultiplicity F 1 P = periodicMultiplicity F 1 P := sorry

theorem sum_essentialMultiplicity_divisors (F : HomogeneousLift K d) {n : ℕ} (hn : 0 < n)
    (P : Fin 2 → K) :
    ∑ m ∈ n.divisors, essentialMultiplicity F m P = periodicMultiplicity F n P := sorry

theorem essentialMultiplicity_eq_of_minimalPeriod_eq (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (P : Fin 2 → K) (hP : P ≠ 0) {n : ℕ} (hn : 0 < n)
    (h : Function.minimalPeriod (RationalMap.toEnd (RationalMap.mk F))
      (Projectivization.mk K P hP) = n) :
    essentialMultiplicity F n P = periodicMultiplicity F n P := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.essentialMultiplicity_test_tangent`: for `z² − z`,
`Z*₂ = 2(0)` although `0` is a fixed point (Morton–Silverman 1995, §1). -/
example : essentialMultiplicity
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X : Polynomial ℚ)) 2 ![0, 1] = 2 :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.essentialMultiplicity_test_acceptance`: for
`z² − 3/4`, the fixed point `−1/2` (multiplier `−1`) has essential multiplicity `2` in `Φ*₂`. -/
example : essentialMultiplicity
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.C (3 / 4) : Polynomial ℚ)) 2
      ![-1 / 2, 1] = 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.essentialMultiplicity_test_one`: `a*_P(1) = a_P(1)`. -/
example (P : Fin 2 → ℚ) : essentialMultiplicity
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)) 1 P =
      periodicMultiplicity (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)) 1 P :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.essentialMultiplicity_test_repelling`: the fixed point
`1` of `z²` has multiplier `2`, so it does not reappear in `Φ*₂`. -/
example : essentialMultiplicity (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)) 2
    ![1, 1] = 0 := sorry

/-! ### The germ at a fixed point (node `DY.3/fixed-point-germ`) -/

/-- The `n`-fold substitution iterate `g ∘ ⋯ ∘ g` of a formal germ (`germIterate g 0 = z`). -/
noncomputable def germIterate (g : PowerSeries K) (n : ℕ) : PowerSeries K :=
  (fun h : PowerSeries K => (PowerSeries.subst h g : PowerSeries K))^[n] PowerSeries.X

theorem germIterate_succ (g : PowerSeries K) (n : ℕ) :
    germIterate g (n + 1) = (PowerSeries.subst (germIterate g n) g : PowerSeries K) := sorry

theorem coeff_one_germIterate {g : PowerSeries K} (hg : PowerSeries.constantCoeff g = 0)
    (n : ℕ) : PowerSeries.coeff 1 (germIterate g n) = PowerSeries.coeff 1 g ^ n := sorry

/-- The formal germ of the lift at the point `[0 : 1]`: the power series `F(z,1)·G(z,1)⁻¹`.
It is meaningful when `[0 : 1]` is fixed, i.e. `F(0,1) = 0 ≠ G(0,1)`. -/
noncomputable def fixedPointGerm (F : HomogeneousLift K d) : PowerSeries K :=
  ((MvPolynomial.aeval ![Polynomial.X, 1] (F.forms 0) : Polynomial K) : PowerSeries K) *
    ((MvPolynomial.aeval ![Polynomial.X, 1] (F.forms 1) : Polynomial K) : PowerSeries K)⁻¹

theorem constantCoeff_fixedPointGerm {F : HomogeneousLift K d}
    (h0 : MvPolynomial.eval ![0, 1] (F.forms 0) = 0) :
    PowerSeries.constantCoeff (fixedPointGerm F) = 0 := sorry

theorem fixedPointGerm_polynomialLift {f : Polynomial K} (hf : f.Monic) :
    fixedPointGerm (HomogeneousLift.ofPolynomial f) = (f : PowerSeries K) := sorry

/-- At the fixed point `[0 : 1]` the linear coefficient of the germ is DY.0's fixed-point
multiplier. -/
theorem coeff_one_fixedPointGerm_eq_multiplier {F : HomogeneousLift K d}
    (h0 : MvPolynomial.eval ![0, 1] (F.forms 0) = 0) (h1 : MvPolynomial.eval ![0, 1] (F.forms 1) ≠ 0) :
    PowerSeries.coeff 1 (fixedPointGerm F) =
      (RationalMap.mk F).multiplier (Projectivization.mk K ![0, 1] (by simp)) := sorry

/-- Conjugating by `z ↦ uz` (the lift `G = u⁻¹ F(uX, Y)`) leaves the linear coefficient, the
multiplier, unchanged. -/
theorem fixedPointGerm_conj_invariant_coeff_one {F G : HomogeneousLift K d}
    (h0 : MvPolynomial.eval ![0, 1] (F.forms 0) = 0) (h1 : MvPolynomial.eval ![0, 1] (F.forms 1) ≠ 0)
    {u : K} (hu : u ≠ 0)
    (hG : ∀ i, G.forms i = MvPolynomial.aeval
        ![MvPolynomial.C u * MvPolynomial.X 0, MvPolynomial.X 1] (F.forms i) *
          (if i = 0 then MvPolynomial.C u⁻¹ else 1)) :
    PowerSeries.coeff 1 (fixedPointGerm G) = PowerSeries.coeff 1 (fixedPointGerm F) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.fixedPointGerm_test_tangent`: the germ of `z² − z` at
`0` is `−z + z²`, with multiplier `−1`. -/
example : fixedPointGerm
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X : Polynomial ℚ)) =
      -PowerSeries.X + PowerSeries.X ^ 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.fixedPointGerm_test_identity`: the identity lift has
germ `z`. -/
example (F : HomogeneousLift ℚ 1) (hF : F.forms = ![MvPolynomial.X 0, MvPolynomial.X 1]) :
    fixedPointGerm F = PowerSeries.X := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.fixedPointGerm_test_superattracting`: `z²` is
superattracting at `0`: its germ has vanishing linear coefficient. -/
example : PowerSeries.coeff 1
    (fixedPointGerm (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ))) = 0 := sorry

/-! ### Germ iteration lemmas -/

/-- Node `DY.3/germ-of-an-iterate`: the germ of the composite lift `Fⁿ` at a fixed point is the
`n`-fold substitution iterate of the germ of `F`. -/
theorem fixedPointGerm_liftIterate {F : HomogeneousLift K d}
    (h0 : MvPolynomial.eval ![0, 1] (F.forms 0) = 0) (h1 : MvPolynomial.eval ![0, 1] (F.forms 1) ≠ 0)
    (n : ℕ) : fixedPointGerm (F.iterate n) = germIterate (fixedPointGerm F) n := sorry

/-- Node `DY.3/multiplicity-equals-germ-order`: at the fixed point `[0 : 1]`, the multiplicity
`a_P(n)` is the order of `gⁿ(z) − z` for the germ `g`. -/
theorem periodicMultiplicity_eq_order (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (h0 : MvPolynomial.eval ![0, 1] (F.forms 0) = 0) {n : ℕ} (hn : 0 < n) :
    (periodicMultiplicity F n ![0, 1] : ℕ∞) =
      (germIterate (fixedPointGerm F) n - PowerSeries.X).order := sorry

/-- Node `DY.3/germ-order-multiplier-criterion` (Morton–Silverman 1995, Lemma 3.4(b)(i) and (12)):
`gⁿ(z) − z` has a simple zero exactly when `λⁿ ≠ 1`, `λ` the linear coefficient. -/
theorem order_germIterate_sub_X_eq_one_iff {g : PowerSeries K}
    (hg : PowerSeries.constantCoeff g = 0) {n : ℕ} (hn : 0 < n) :
    (germIterate g n - PowerSeries.X).order = 1 ↔
      PowerSeries.coeff 1 g ^ n ≠ 1 := sorry

/-- Node `DY.3/germ-order-monotone` (Morton–Silverman 1995, Lemma 3.4(a)). -/
theorem order_sub_X_le_order_germIterate_sub_X {g : PowerSeries K}
    (hg : PowerSeries.constantCoeff g = 0) {n : ℕ} (hn : 0 < n) :
    (g - PowerSeries.X).order ≤
      (germIterate g n - PowerSeries.X).order := sorry

/-- Node `DY.3/germ-order-parabolic-iterate` (Morton–Silverman 1995, (10) and Lemma 3.4(b)(ii)). -/
theorem order_germIterate_sub_X_of_tangent {g : PowerSeries K}
    (hg : PowerSeries.constantCoeff g = 0) {e : ℕ} (he : 2 ≤ e)
    (hge : (g - PowerSeries.X).order = (e : ℕ∞)) {n : ℕ} (hn : 0 < n) :
    ((n : K) ≠ 0 →
        (germIterate g n - PowerSeries.X).order = (e : ℕ∞)) ∧
      ((n : K) = 0 → ((2 * e - 1 : ℕ) : ℕ∞) ≤
        (germIterate g n - PowerSeries.X).order) := sorry

/-- Node `DY.3/germ-order-rotation-congruence`: if the multiplier is a primitive `r`-th root of
unity with `r ≥ 2`, then `r` divides `ord(gʳ(z) − z) − 1`; in particular that order is `≥ r + 1`. -/
theorem dvd_order_germIterate_sub_X_sub_one {g : PowerSeries K}
    (hg : PowerSeries.constantCoeff g = 0) {r : ℕ} (hr : 2 ≤ r)
    (hlam : IsPrimitiveRoot (PowerSeries.coeff 1 g) r) {s : ℕ}
    (hs : (germIterate g r - PowerSeries.X).order = (s : ℕ∞)) :
    r ∣ s - 1 := sorry

/-! ### Möbius computations and the multiplicity profile -/

/-- Node `DY.3/moebius-transform-of-a-multiplicity-profile`: the Möbius transform of the
sequence `k ↦ 1` (if `r ∤ k`), `k ↦ B(v_p(k/r))` (if `r ∣ k`), with `p` a prime or `0`. -/
theorem sum_moebius_multiplicityProfile {r p : ℕ} (hr : 0 < r) (hp : p = 0 ∨ p.Prime)
    (B : ℕ → ℤ) {N : ℕ} (hN : 0 < N) :
    ∑ x ∈ N.divisorsAntidiagonal,
        μ x.1 * (if r ∣ x.2 then B (padicValNat p (x.2 / r)) else 1) =
      (if N = 1 then 1 else 0) + (if N = r then B 0 - 1 else 0) +
        ∑ a ∈ Finset.Icc 1 N, (if N = r * p ^ a then B a - B (a - 1) else 0) := sorry

/-- Node `DY.3/multiplicity-profile-at-a-fixed-point`: at the fixed point `[0 : 1]` with multiplier
`λ` (DY.2's `cycleMultiplier`) of multiplicative order `r` (`r = 0` when `λ` is not a root of
unity) and `p = char K`, `a(k) = 1` when `r = 0` or `r ∤ k`, and `a(k) = a(r·p^{v_p(k/r)})` when
`r ∣ k`. -/
theorem periodicMultiplicity_profile (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (h0 : MvPolynomial.eval ![0, 1] (F.forms 0) = 0) {k : ℕ} (hk : 0 < k) :
    let r := orderOf (cycleMultiplier (RationalMap.mk F) (Projectivization.mk K ![0, 1] (by simp)))
    (periodicMultiplicity F k ![0, 1] : ℤ) =
      if 0 < r ∧ r ∣ k then
        (periodicMultiplicity F (r * ringChar K ^ padicValNat (ringChar K) (k / r)) ![0, 1] : ℤ)
      else 1 := sorry

/-- The profile values `B(a) = a(r·pᵃ)` are `≥ 2`, nondecreasing, and in characteristic `p > 0`
satisfy `B(a + 1) ≥ 2·B(a) − 1` (part of node `DY.3/multiplicity-profile-at-a-fixed-point`). -/
theorem periodicMultiplicity_profile_growth (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (h0 : MvPolynomial.eval ![0, 1] (F.forms 0) = 0)
    (hr : 0 < orderOf
      (cycleMultiplier (RationalMap.mk F) (Projectivization.mk K ![0, 1] (by simp)))) (a : ℕ) :
    let r := orderOf (cycleMultiplier (RationalMap.mk F) (Projectivization.mk K ![0, 1] (by simp)))
    let p := ringChar K
    2 ≤ periodicMultiplicity F r ![0, 1] ∧
      periodicMultiplicity F (r * p ^ a) ![0, 1] ≤ periodicMultiplicity F (r * p ^ (a + 1)) ![0, 1] ∧
      (0 < p → 2 * periodicMultiplicity F (r * p ^ a) ![0, 1] ≤
        periodicMultiplicity F (r * p ^ (a + 1)) ![0, 1] + 1) := sorry

/-- Node `DY.3/essential-multiplicity-of-an-iterate` (Morton–Silverman 1995, (11)): for `P` of
exact period `m`, `a*_P(F, n) = a*_P(Fᵐ, n/m)` if `m ∣ n` and `0` otherwise. -/
theorem essentialMultiplicity_of_minimalPeriod (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (P : Fin 2 → K) (hP : P ≠ 0) {m n : ℕ} (hn : 0 < n)
    (hm : Function.minimalPeriod (RationalMap.toEnd (RationalMap.mk F))
      (Projectivization.mk K P hP) = m) (hm0 : 0 < m) :
    essentialMultiplicity F n P =
      if m ∣ n then essentialMultiplicity (F.iterate m) (n / m) P else 0 := sorry

/-! ### Effectivity and the classification of formal periods -/

/-- Node `DY.3/dynatomic-cycle-effective` (Morton–Silverman 1995, Theorem 3.1 and
Proposition 3.2(a)): the dynatomic cycle is effective. -/
theorem essentialMultiplicity_nonneg (F : HomogeneousLift K d) (hd : 2 ≤ d) (n : ℕ)
    (P : Fin 2 → K) (hP : P ≠ 0) : 0 ≤ essentialMultiplicity F n P := sorry

/-! ### Formal period (node `DY.3/formal-and-exact-period`) -/

/-- `P` has formal period `n` for `F` when it occurs in the `n`-th dynatomic cycle,
`a*_P(n) > 0` (Morton–Silverman's "essential period", Hutz's "formal period"). -/
def IsOfFormalPeriod (F : HomogeneousLift K d) (n : ℕ) (P : Fin 2 → K) : Prop :=
  0 < essentialMultiplicity F n P

theorem IsOfFormalPeriod.iterate_eq {F : HomogeneousLift K d} (hd : 2 ≤ d) {n : ℕ}
    {P : Fin 2 → K} (hP : P ≠ 0) (h : IsOfFormalPeriod F n P) :
    (RationalMap.toEnd (RationalMap.mk F))^[n] (Projectivization.mk K P hP) =
      Projectivization.mk K P hP := sorry

theorem IsOfFormalPeriod.minimalPeriod_dvd {F : HomogeneousLift K d} (hd : 2 ≤ d) {n : ℕ}
    {P : Fin 2 → K} (hP : P ≠ 0) (h : IsOfFormalPeriod F n P) :
    Function.minimalPeriod (RationalMap.toEnd (RationalMap.mk F)) (Projectivization.mk K P hP) ∣
      n := sorry

theorem isOfFormalPeriod_one_iff (F : HomogeneousLift K d) (hd : 2 ≤ d) {P : Fin 2 → K}
    (hP : P ≠ 0) :
    IsOfFormalPeriod F 1 P ↔
      RationalMap.toEnd (RationalMap.mk F) (Projectivization.mk K P hP) =
        Projectivization.mk K P hP :=
  sorry

/-- Node `DY.3/exact-period-is-formal-period` (Morton–Silverman 1995, Proposition 3.2(b)(i);
Hutz 2010, Proposition 4.1(2)). -/
theorem isOfFormalPeriod_of_minimalPeriod_eq (F : HomogeneousLift K d) (hd : 2 ≤ d)
    {P : Fin 2 → K} (hP : P ≠ 0) {n : ℕ} (hn : 0 < n)
    (h : Function.minimalPeriod (RationalMap.toEnd (RationalMap.mk F))
      (Projectivization.mk K P hP) = n) : IsOfFormalPeriod F n P :=
  sorry

/-- Node `DY.3/formal-period-classification` (Morton–Silverman 1995, Proposition 3.2(b)), at the
point `[0 : 1]` (the general point is moved there by a conjugation): with `m` the exact period,
`r` the multiplicative order of DY.2's multiplier of the cycle (`0` if not a root of unity) and
`p = char K`, the formal periods are exactly `m`, `m·r` and `m·r·pᵉ` (`e ≥ 1`, `p > 0`). -/
theorem isOfFormalPeriod_zero_iff (F : HomogeneousLift K d) (hd : 2 ≤ d) {m : ℕ} (hm0 : 0 < m)
    (hm : Function.minimalPeriod (RationalMap.toEnd (RationalMap.mk F))
      (Projectivization.mk K ![0, 1] (by simp)) = m) {n : ℕ} (hn : 0 < n) :
    let r := orderOf (cycleMultiplier (RationalMap.mk F) (Projectivization.mk K ![0, 1] (by simp)))
    let p := ringChar K
    IsOfFormalPeriod F n ![0, 1] ↔
      n = m ∨ (0 < r ∧ n = m * r) ∨ (0 < r ∧ 0 < p ∧ ∃ e, 1 ≤ e ∧ n = m * r * p ^ e) := sorry

/-- Node `DY.3/formal-period-classification-char-zero`: in characteristic zero a point of formal
period `n` and exact period `m < n` has `n = m·r`, the multiplier of its cycle (DY.2's
`cycleMultiplier`) being a primitive `r`-th root of unity. -/
theorem IsOfFormalPeriod.eq_mul_orderOf_of_charZero [CharZero K] {F : HomogeneousLift K d}
    (hd : 2 ≤ d) {m n : ℕ} (hm0 : 0 < m)
    (hm : Function.minimalPeriod (RationalMap.toEnd (RationalMap.mk F))
      (Projectivization.mk K ![0, 1] (by simp)) = m) (hmn : m < n)
    (h : IsOfFormalPeriod F n ![0, 1]) :
    n = m * orderOf (cycleMultiplier (RationalMap.mk F) (Projectivization.mk K ![0, 1] (by simp))) ∧
      IsPrimitiveRoot
        (cycleMultiplier (RationalMap.mk F) (Projectivization.mk K ![0, 1] (by simp))) (n / m) :=
  sorry

/-- Node `DY.3/simple-formal-periodic-point-has-exact-period` (Hutz 2010, Theorem 3.1, the
dimension-one case): a point of multiplicity one in `Φ*ₙ`, with `n ≠ 0` in `K`, has exact
period `n`. -/
theorem minimalPeriod_eq_of_essentialMultiplicity_eq_one {F : HomogeneousLift K d} (hd : 2 ≤ d)
    {P : Fin 2 → K} (hP : P ≠ 0) {n : ℕ} (hn : 0 < n) (hnK : (n : K) ≠ 0)
    (h : essentialMultiplicity F n P = 1) :
    Function.minimalPeriod (RationalMap.toEnd (RationalMap.mk F)) (Projectivization.mk K P hP) =
      n := sorry

/-- Node `DY.3/disjoint-supports-of-dynatomic-cycles` (Morton–Silverman 1995, Corollary 3.3). -/
theorem essentialMultiplicity_eq_zero_of_not_dvd (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (P : Fin 2 → K) (hP : P ≠ 0) {n₁ n₂ : ℕ} (h₁ : ¬ n₁ ∣ n₂) (h₂ : ¬ n₂ ∣ n₁) :
    essentialMultiplicity F n₁ P = 0 ∨ essentialMultiplicity F n₂ P = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsOfFormalPeriod_test_acceptance`: for `z² − 3/4`, the
point `−1/2` has formal period `2` but exact period `1`. -/
example : IsOfFormalPeriod
      (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.C (3 / 4) : Polynomial ℚ)) 2
      ![-1 / 2, 1] ∧
    Function.minimalPeriod
      (RationalMap.toEnd
        (RationalMap.ofPolynomial (Polynomial.X ^ 2 - Polynomial.C (3 / 4) : Polynomial ℚ)))
      (Projectivization.mk ℚ ![-1 / 2, 1] (by simp)) = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsOfFormalPeriod_test_tangent`: for `z² − z`, `0` has
formal period `2`. -/
example : IsOfFormalPeriod
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.X : Polynomial ℚ)) 2 ![0, 1] :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsOfFormalPeriod_test_fixed`: formal period one means
fixed: `1` is fixed by `z²`, so has formal period `1`. -/
example : IsOfFormalPeriod (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)) 1
    ![1, 1] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsOfFormalPeriod_test_nonexample`: in characteristic
zero, `−1/2` (multiplier `−1`) has no formal period `3` for `z² − 3/4`. -/
example : ¬ IsOfFormalPeriod
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.C (3 / 4) : Polynomial ℚ)) 3
      ![-1 / 2, 1] := sorry

/-! ### The dynatomic polynomial (node `DY.3/dynatomic-polynomial`) -/

/-- The `n`-th dynatomic polynomial `Φ*ₙ(F)`: the unique binary form whose image in the fraction
field is `∏_{m ∣ n} Φₘ(F)^{μ(n/m)}` (junk value `0` when no such form exists; by
`algebraMap_dynatomicForm` it always exists for lifts of degree `≥ 2`). -/
noncomputable def dynatomicForm (F : HomogeneousLift K d) (n : ℕ) : MvPolynomial (Fin 2) K :=
  open Classical in
  if h : ∃ Q : MvPolynomial (Fin 2) K,
      algebraMap (MvPolynomial (Fin 2) K) (FractionRing (MvPolynomial (Fin 2) K)) Q =
        ∏ x ∈ n.divisorsAntidiagonal,
          (algebraMap (MvPolynomial (Fin 2) K) (FractionRing (MvPolynomial (Fin 2) K))
            (periodForm F x.2)) ^ (μ x.1)
  then h.choose else 0

theorem prod_dynatomicForm_divisors (F : HomogeneousLift K d) (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n) :
    ∏ m ∈ n.divisors, dynatomicForm F m = periodForm F n := sorry

theorem binaryFormOrder_dynatomicForm (F : HomogeneousLift K d) (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n)
    (P : Fin 2 → K) (hP : P ≠ 0) :
    (binaryFormOrder (dynatomicForm F n) P : ℤ) = essentialMultiplicity F n P := sorry

theorem eval_dynatomicForm_eq_zero_iff (F : HomogeneousLift K d) (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n)
    (P : Fin 2 → K) (hP : P ≠ 0) :
    MvPolynomial.eval P (dynatomicForm F n) = 0 ↔ IsOfFormalPeriod F n P := sorry

theorem dynatomicForm_one (F : HomogeneousLift K d) (hd : 2 ≤ d) :
    dynatomicForm F 1 = periodForm F 1 := sorry

theorem dynatomicForm_map {L : Type*} [Field L] (g : K →+* L) (F : HomogeneousLift K d)
    (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n) :
    dynatomicForm (F.map g) n = (dynatomicForm F n).map g := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.dynatomicForm_test_quadratic`: for `z² + c`,
`Φ*₂ = X² + XY + (c + 1)Y²`. -/
example (c : ℚ) :
    dynatomicForm (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 + Polynomial.C c)) 2 =
      MvPolynomial.X 0 ^ 2 + MvPolynomial.X 0 * MvPolynomial.X 1 +
        MvPolynomial.C (c + 1) * MvPolynomial.X 1 ^ 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.dynatomicForm_test_one`: `Φ*₁ = Φ₁`. -/
example (c : ℚ) :
    dynatomicForm (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 + Polynomial.C c)) 1 =
      periodForm (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 + Polynomial.C c)) 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.dynatomicForm_test_cyclotomic`: for `z²` and `n ≥ 2`,
the dehomogenised dynatomic polynomial is the product of the cyclotomic polynomials `Φ_k` over the
`k ∣ 2ⁿ − 1` in which `2` has multiplicative order `n`. -/
example (n : ℕ) (hn : 2 ≤ n) :
    MvPolynomial.aeval ![Polynomial.X, 1]
        (dynatomicForm (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ)) n) =
      ∏ k ∈ (2 ^ n - 1).divisors with orderOf (2 : ZMod k) = n, Polynomial.cyclotomic k ℚ :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.dynatomicForm_test_square`: at `c = −3/4`,
`Φ*₂ = (X + Y/2)²` has a double root at the fixed point `−1/2`. -/
example : dynatomicForm
    (HomogeneousLift.ofPolynomial (Polynomial.X ^ 2 - Polynomial.C (3 / 4) : Polynomial ℚ)) 2 =
      (MvPolynomial.X 0 + MvPolynomial.C (1 / 2) * MvPolynomial.X 1) ^ 2 := sorry

/-- Node `DY.3/dynatomic-polynomial-is-polynomial` (Morton–Silverman 1995, Theorem 3.1 on `ℙ¹`;
Morton–Patel for polynomials; Hutz 2010, Theorem 2.20): `∏_{m ∣ n} Φₘ^{μ(n/m)}` is a binary
form. -/
theorem algebraMap_dynatomicForm (F : HomogeneousLift K d) (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n) :
    algebraMap (MvPolynomial (Fin 2) K) (FractionRing (MvPolynomial (Fin 2) K))
        (dynatomicForm F n) =
      ∏ x ∈ n.divisorsAntidiagonal,
        (algebraMap (MvPolynomial (Fin 2) K) (FractionRing (MvPolynomial (Fin 2) K))
          (periodForm F x.2)) ^ (μ x.1) := sorry

/-- Node `DY.3/dynatomic-polynomial-degree`: `Φ*ₙ` is homogeneous of degree
`∑_{m ∣ n} μ(n/m)(dᵐ + 1) = ν_d(n) + [n = 1]`. -/
theorem dynatomicForm_isHomogeneous (F : HomogeneousLift K d) (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n) :
    (dynatomicForm F n).IsHomogeneous
      ((∑ x ∈ n.divisorsAntidiagonal, μ x.1 * ((d : ℤ) ^ x.2 + 1)).toNat) := sorry

/-! ### Good reduction (nodes `DY.3/dynatomic-polynomial-reduction`,
`DY.3/good-reduction-period-constraint`) -/

/-- Node `DY.3/dynatomic-polynomial-reduction` (Morton–Silverman 1995, Theorem 4.1): let `F` be a
lift with coefficients in a discrete valuation ring `R` (the forms `Φ`) whose reduction `Fk` is
still a lift (DY.0's good reduction of `mk F`). Then the dynatomic polynomial has an integral model,
unique up to a unit, whose reduction is the dynatomic polynomial of the reduced lift. -/
theorem dynatomicForm_reduction {R : Type*} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Algebra R K] [IsFractionRing R K] (hd : 2 ≤ d)
    (F : HomogeneousLift K d) (Fk : HomogeneousLift (IsLocalRing.ResidueField R) d)
    (Φ : Fin 2 → MvPolynomial (Fin 2) R) (hF : ∀ i, F.forms i = (Φ i).map (algebraMap R K))
    (hFk : ∀ i, Fk.forms i = (Φ i).map (IsLocalRing.residue R)) {n : ℕ} (hn : 0 < n) :
    ∃ (Q : MvPolynomial (Fin 2) R) (u : K), u ≠ 0 ∧
      Q.map (algebraMap R K) = MvPolynomial.C u * dynatomicForm F n ∧
      Q.map (IsLocalRing.residue R) = dynatomicForm Fk n := sorry

/-- Node `DY.3/good-reduction-period-constraint` (Morton–Silverman; derived from Morton–Silverman
1995, Theorem 4.1 and Proposition 3.2): for `f` with good reduction over a discrete valuation ring
(DY.0's `HasGoodReduction` and `reduction`), a `K`-rational point of exact period `n` whose
reduction `[0 : 1]` has exact period `m` for the reduced map, with DY.2's cycle multiplier of order
`r` and residue characteristic `p`, has `n ∈ {m, m r, m r pᵉ}`. -/
theorem minimalPeriod_of_goodReduction {R : Type*} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Algebra R K] [IsFractionRing R K] {f : RationalMap K}
    (hd : 2 ≤ f.degree) (hf : f.HasGoodReduction R) (x : R) {n m : ℕ} (hn : 0 < n) (hm : 0 < m)
    (hxn : Function.minimalPeriod (RationalMap.toEnd f)
      (Projectivization.mk K ![algebraMap R K x, 1] (by simp)) = n)
    (hx0 : IsLocalRing.residue R x = 0)
    (hxm : Function.minimalPeriod (RationalMap.toEnd (f.reduction R hf))
      (Projectivization.mk _ ![0, 1] (by simp)) = m) :
    let r := orderOf (cycleMultiplier (f.reduction R hf) (Projectivization.mk _ ![0, 1] (by simp)))
    let p := ringChar (IsLocalRing.ResidueField R)
    n = m ∨ n = m * r ∨ ∃ e, 1 ≤ e ∧ n = m * r * p ^ e := sorry

/-! ### Polynomial maps (nodes `DY.3/dynatomic-polynomial-of-a-polynomial-map`, ...) -/

/-- The dynatomic polynomial of a polynomial map `f ∈ R[z]` over a commutative ring, by exact
division: `Φ*₀ = 1` and `Φ*ₙ = (fⁿ(z) − z) /ₘ ∏_{m ∣ n, m < n} Φ*ₘ` for `n ≥ 1`. -/
noncomputable def dynatomicPolynomial {R : Type*} [CommRing R] (f : Polynomial R) (n : ℕ) :
    Polynomial R :=
  if n = 0 then 1 else
    (f.comp^[n] Polynomial.X - Polynomial.X) /ₘ
      ∏ m ∈ n.properDivisors.attach, dynatomicPolynomial f m.1
termination_by n
decreasing_by exact (Nat.mem_properDivisors.1 m.2).2

theorem dynatomicPolynomial_zero {R : Type*} [CommRing R] (f : Polynomial R) :
    dynatomicPolynomial f 0 = 1 := sorry

theorem dynatomicPolynomial_one {R : Type*} [CommRing R] {f : Polynomial R} (hf : f.Monic)
    (hd : 2 ≤ f.natDegree) : dynatomicPolynomial f 1 = f - Polynomial.X := sorry

theorem dynatomicPolynomial_monic {R : Type*} [CommRing R] {f : Polynomial R} (hf : f.Monic)
    (hd : 2 ≤ f.natDegree) (n : ℕ) : (dynatomicPolynomial f n).Monic := sorry

theorem natDegree_dynatomicPolynomial {R : Type*} [CommRing R] [Nontrivial R] {f : Polynomial R}
    (hf : f.Monic) (hd : 2 ≤ f.natDegree) {n : ℕ} (hn : 0 < n) :
    ((dynatomicPolynomial f n).natDegree : ℤ) =
      ∑ x ∈ n.divisorsAntidiagonal, μ x.1 * (f.natDegree : ℤ) ^ x.2 := sorry

theorem map_dynatomicPolynomial {R S : Type*} [CommRing R] [CommRing S] (g : R →+* S)
    {f : Polynomial R} (hf : f.Monic) (hd : 2 ≤ f.natDegree) (n : ℕ) :
    (dynatomicPolynomial f n).map g = dynatomicPolynomial (f.map g) n := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.dynatomicPolynomial_test_quadratic`: for `z² + c`,
`Φ*₂ = z² + z + c + 1`. -/
example (c : ℚ) : dynatomicPolynomial (Polynomial.X ^ 2 + Polynomial.C c) 2 =
    Polynomial.X ^ 2 + Polynomial.X + Polynomial.C (c + 1) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.dynatomicPolynomial_test_zero`: `Φ*₀ = 1`. -/
example (c : ℚ) : dynatomicPolynomial (Polynomial.X ^ 2 + Polynomial.C c) 0 = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.dynatomicPolynomial_test_cyclotomic`: for `z²` over `ℤ`
and `n ≥ 2`, `Φ*ₙ = ∏ Φ_k` over the `k ∣ 2ⁿ − 1` with `ord_k 2 = n` (Mathlib's
`Polynomial.cyclotomic`). -/
example (n : ℕ) (hn : 2 ≤ n) :
    dynatomicPolynomial (Polynomial.X ^ 2 : Polynomial ℤ) n =
      ∏ k ∈ (2 ^ n - 1).divisors with orderOf (2 : ZMod k) = n, Polynomial.cyclotomic k ℤ :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.dynatomicPolynomial_test_tangent`: for `z² − z`,
`Φ*₂ = z²`, whose only root `0` is a fixed point (degree `2`, not `4`). -/
example : dynatomicPolynomial (Polynomial.X ^ 2 - Polynomial.X : Polynomial ℚ) 2 =
    Polynomial.X ^ 2 := sorry

/-- Node `DY.3/dynatomic-polynomial-of-a-polynomial-map-product`: for monic `f` of degree `≥ 2`
over any commutative ring, `∏_{m ∣ n} Φ*ₘ(f) = fⁿ(z) − z`. -/
theorem prod_dynatomicPolynomial_divisors {R : Type*} [CommRing R] {f : Polynomial R}
    (hf : f.Monic) (hd : 2 ≤ f.natDegree) {n : ℕ} (hn : 0 < n) :
    ∏ m ∈ n.divisors, dynatomicPolynomial f m = f.comp^[n] Polynomial.X - Polynomial.X := sorry

/-- Node `DY.3/dynatomic-polynomial-dehomogenisation`: for monic `f` of degree `≥ 2` over a field,
the dynatomic form of DY.0's lift `(Y^d f(X/Y), Y^d)` dehomogenises to `Φ*ₙ(f)`. -/
theorem aeval_dynatomicForm_polynomialLift {f : Polynomial K} (hf : f.Monic)
    (hd : 2 ≤ f.natDegree) {n : ℕ} (hn : 0 < n) :
    MvPolynomial.aeval ![Polynomial.X, 1] (dynatomicForm (HomogeneousLift.ofPolynomial f) n) =
      dynatomicPolynomial f n := sorry

/-! ### The unicritical family and its dynatomic curve -/

/-- `Φ*ₙ(x, c) ∈ ℤ[c][x]` for the family `x ↦ x^d + c` (the outer variable is `x`, the coefficient
variable is `c`). -/
noncomputable def unicriticalDynatomic (d n : ℕ) : Polynomial (Polynomial ℤ) :=
  dynatomicPolynomial (Polynomial.X ^ d + Polynomial.C (Polynomial.X : Polynomial ℤ)) n

theorem unicriticalDynatomic_monic (hd : 2 ≤ d) (n : ℕ) :
    (unicriticalDynatomic d n).Monic := sorry

theorem map_unicriticalDynatomic {L : Type*} [CommRing L] (hd : 2 ≤ d) (n : ℕ) (c : L) :
    (unicriticalDynatomic d n).map (Polynomial.eval₂RingHom (Int.castRingHom L) c) =
      dynatomicPolynomial (Polynomial.X ^ d + Polynomial.C c) n := sorry

theorem natDegree_unicriticalDynatomic (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n) :
    ((unicriticalDynatomic d n).natDegree : ℤ) =
      ∑ x ∈ n.divisorsAntidiagonal, μ x.1 * (d : ℤ) ^ x.2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalDynatomic_test_one`: `Φ*₁(x, c) = x² − x + c`. -/
example : unicriticalDynatomic 2 1 =
    Polynomial.X ^ 2 - Polynomial.X + Polynomial.C (Polynomial.X : Polynomial ℤ) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalDynatomic_test_two`:
`Φ*₂(x, c) = x² + x + c + 1`. -/
example : unicriticalDynatomic 2 2 =
    Polynomial.X ^ 2 + Polynomial.X + Polynomial.C (Polynomial.X + 1 : Polynomial ℤ) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalDynatomic_test_zero`: `Φ*₀ = 1`. -/
example : unicriticalDynatomic 2 0 = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalDynatomic_test_degree`: `Φ*₄(x, c)` has
degree `12` in `x` (Morton 1998, §2). -/
example : (unicriticalDynatomic 2 4).natDegree = 12 := sorry

/-- The coordinate ring `ℤ[c][x]/(Φ*ₙ(x, c))` of the dynatomic curve `Y₁(n)` of `x ↦ x^d + c`. -/
abbrev DynatomicCurveRing (d n : ℕ) : Type := AdjoinRoot (unicriticalDynatomic d n)

theorem nonempty_dynatomicCurveRing_hom_iff {L : Type*} [CommRing L] (d n : ℕ) (x c : L) :
    (∃ ψ : DynatomicCurveRing d n →+* L, ψ (AdjoinRoot.root _) = x ∧
        ψ (AdjoinRoot.of _ (Polynomial.X : Polynomial ℤ)) = c) ↔
      ((unicriticalDynatomic d n).map (Polynomial.eval₂RingHom (Int.castRingHom L) c)).eval x =
        0 := sorry

theorem dynatomicCurveRing_sigma (hd : 2 ≤ d) (n : ℕ) :
    ∃ σ : DynatomicCurveRing d n ≃+* DynatomicCurveRing d n,
      σ (AdjoinRoot.root _) =
        AdjoinRoot.root _ ^ d + AdjoinRoot.of _ (Polynomial.X : Polynomial ℤ) ∧
      σ (AdjoinRoot.of _ (Polynomial.X : Polynomial ℤ)) =
        AdjoinRoot.of _ (Polynomial.X : Polynomial ℤ) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.DynatomicCurveRing_test_acceptance`: `(−1/2, −3/4)`
is a rational point of `Y₁(2)` for `d = 2` although `−1/2` is fixed by `z² − 3/4`. -/
example : ∃ ψ : DynatomicCurveRing 2 2 →+* ℚ, ψ (AdjoinRoot.root _) = -1 / 2 ∧
    ψ (AdjoinRoot.of _ (Polynomial.X : Polynomial ℤ)) = -3 / 4 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.DynatomicCurveRing_test_fixed`: `(0, 0)` lies on
`Y₁(1)`. -/
example : ∃ ψ : DynatomicCurveRing 2 1 →+* ℚ, ψ (AdjoinRoot.root _) = 0 ∧
    ψ (AdjoinRoot.of _ (Polynomial.X : Polynomial ℤ)) = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.DynatomicCurveRing_test_nonexample`: `(0, 0)` does not
lie on `Y₁(2)`, since `Φ*₂(0, 0) = 1`. -/
example : ¬ ∃ ψ : DynatomicCurveRing 2 2 →+* ℚ, ψ (AdjoinRoot.root _) = 0 ∧
    ψ (AdjoinRoot.of _ (Polynomial.X : Polynomial ℤ)) = 0 := sorry

/-- Node `DY.3/unicritical-dynatomic-curve-smooth-irreducible` (Bousch; Buff–Tan; Gao–Ou 2013,
Theorems 1.1 and 1.2): over `ℂ`, `Φ*ₙ(x, c)` is irreducible and its zero locus is smooth. -/
theorem unicriticalDynatomic_irreducible_and_smooth (hd : 2 ≤ d) {n : ℕ} (hn : 0 < n) :
    let Φ : Polynomial (Polynomial ℂ) :=
      (unicriticalDynatomic d n).map (Polynomial.mapRingHom (Int.castRingHom ℂ))
    Irreducible Φ ∧
      ∀ x c : ℂ, (Φ.map (Polynomial.evalRingHom c)).eval x = 0 →
        (Φ.derivative.map (Polynomial.evalRingHom c)).eval x ≠ 0 ∨
          ((Φ.sum fun i a => Polynomial.monomial i (Polynomial.derivative a)).map
            (Polynomial.evalRingHom c)).eval x ≠ 0 := sorry

/-! ### Heights and Northcott finiteness -/

/-- Node `DY.3/height-bound-for-preperiodic-points`: a Nullstellensatz certificate
`∑ⱼ q(k, j)·Fⱼ = X_k^{M+d}` for a lift of degree `d ≥ 2` over a number field bounds the height of
every preperiodic point of `toEnd (mk F)` by `C/(d − 1)`, with `C` the explicit constant of
`Height.logHeight_eval_ge`. -/
theorem logHeight_le_of_preperiodic {L : Type*} [Field L] [NumberField L] {M : ℕ} (hd : 2 ≤ d)
    (F : HomogeneousLift L d) {q : Fin 2 × Fin 2 → MvPolynomial (Fin 2) L}
    (hq : ∀ a, (q a).IsHomogeneous M)
    (hcert : ∀ k, ∑ j, q (k, j) * F.forms j = MvPolynomial.X k ^ (M + d)) (v : Fin 2 → L)
    (hv : v ≠ 0)
    (hpre : IsPreperiodicPt (RationalMap.toEnd (RationalMap.mk F)) (Projectivization.mk L v hv)) :
    Height.logHeight v ≤
      Real.log (2 ^ Height.totalWeight L * max (Height.mulHeightBound q) 1) / (d - 1) := sorry

/-- Node `DY.3/finiteness-of-rational-preperiodic-points` (Northcott 1950; Call–Silverman 1993,
Corollary 1.1.1(b), `D = 1`): a rational map of degree `≥ 2` over a number field has only finitely
many rational preperiodic points. -/
theorem finite_preperiodicPts {L : Type*} [Field L] [NumberField L] {f : RationalMap L}
    (hd : 2 ≤ f.degree) : (preperiodicPts (RationalMap.toEnd f)).Finite := sorry

/-- Node `DY.3/finiteness-of-bounded-degree-preperiodic-points` (Call–Silverman 1993,
Corollary 1.1.1(b)): the preperiodic points of bounded degree over the base field are finite in
number (affine part `[x : 1]` of the base change to `L̄`; the point `∞` adds at most one). -/
theorem finite_preperiodic_of_degree_le {L : Type*} [Field L] [NumberField L] {f : RationalMap L}
    (hd : 2 ≤ f.degree) (D : ℕ) :
    {x : AlgebraicClosure L | (minpoly L x).natDegree ≤ D ∧
        IsPreperiodicPt (RationalMap.toEnd (RationalMap.map (algebraMap L (AlgebraicClosure L)) f))
          (Projectivization.mk _ ![x, 1] (by simp))}.Finite := sorry

/-! ### Explicit bounds for `z^d + c` -/

/-- Node `DY.3/unicritical-preperiodic-valuation-lemma` (Hutz 2015, Lemma 7, in its corrected
preperiodic form): for a rational preperiodic point `x` of `z^d + c`, `v_p(c) < 0` forces
`v_p(c) = d·v_p(x)`, and `v_p(c) ≥ 0` forces `v_p(x) ≥ 0`. -/
theorem padicValRat_of_unicritical_preperiodic (hd : 2 ≤ d) {c x : ℚ}
    (hx : IsPreperiodicPt (fun z : ℚ => z ^ d + c) x) (p : ℕ) [Fact p.Prime] :
    (padicValRat p c < 0 → padicValRat p c = d * padicValRat p x) ∧
      (0 ≤ padicValRat p c → 0 ≤ padicValRat p x) := sorry

/-- Node `DY.3/unicritical-preperiodic-archimedean-bound`: a rational preperiodic point of
`z^d + c` (`d ≥ 2`) satisfies `|x| ≤ 1 + |c|`. -/
theorem abs_le_of_unicritical_preperiodic (hd : 2 ≤ d) {c x : ℚ}
    (hx : IsPreperiodicPt (fun z : ℚ => z ^ d + c) x) : |x| ≤ 1 + |c| := sorry

/-- Node `DY.3/odd-degree-unicritical-preperiodic-points` (Narkiewicz, as reported by Hutz 2015,
Theorem 3): for odd `d ≥ 3`, every rational preperiodic point of `z^d + c` is fixed, and there are
at most three of them (four with `∞`). -/
theorem unicritical_odd_preperiodic (hd : Odd d) (hd3 : 3 ≤ d) (c : ℚ) :
    (∀ x : ℚ, IsPreperiodicPt (fun z : ℚ => z ^ d + c) x → x ^ d + c = x) ∧
      (preperiodicPts fun z : ℚ => z ^ d + c).ncard ≤ 3 := sorry

/-! ### Certified enumeration (constructions `DY.3/orbit-repetition-check`, ...) -/

/-- Iterate `f` from `x` for at most `fuel` steps, stopping with `true` as soon as a value repeats
and with `false` as soon as a value leaves `S`. -/
def orbitRepeatsWithin {α : Type*} [DecidableEq α] (f : α → α) (S : Finset α) :
    ℕ → List α → α → Bool
  | 0, _, _ => false
  | fuel + 1, seen, x =>
    if x ∈ seen then true else if x ∈ S then orbitRepeatsWithin f S fuel (x :: seen) (f x) else false

theorem orbitRepeatsWithin_sound {α : Type*} [DecidableEq α] (f : α → α) (S : Finset α)
    (fuel : ℕ) (x : α) (h : orbitRepeatsWithin f S fuel [] x = true) :
    IsPreperiodicPt f x := sorry

theorem orbitRepeatsWithin_complete {α : Type*} [DecidableEq α] (f : α → α) (S : Finset α)
    (hS : ∀ y, IsPreperiodicPt f y → y ∈ S) (x : α) (hx : IsPreperiodicPt f x) :
    orbitRepeatsWithin f S (S.card + 1) [] x = true := sorry

theorem orbitRepeatsWithin_false_of_not_mem {α : Type*} [DecidableEq α] (f : α → α)
    (S : Finset α) (fuel : ℕ) (x : α) (hx : x ∉ S) : orbitRepeatsWithin f S fuel [] x = false :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.orbitRepeatsWithin_test_fixed`: a fixed point in `S`
is detected after two steps. -/
example : orbitRepeatsWithin (fun n : ℕ => n) {3} 2 [] 3 = true := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.orbitRepeatsWithin_test_escape`: the orbit of `0` under
`n ↦ n + 1` leaves `{0, …, 4}`, so the check returns `false`. -/
example : orbitRepeatsWithin (fun n : ℕ => n + 1) (Finset.range 5) 6 [] 0 = false := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.orbitRepeatsWithin_test_cycle`: `0 ↦ 1 ↦ 2 ↦ 0` is a
3-cycle inside `{0, 1, 2}`, detected with fuel `4`. -/
example : orbitRepeatsWithin (fun n : ℕ => (n + 1) % 3) (Finset.range 3) 4 [] 0 = true := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.orbitRepeatsWithin_test_nofuel`: with no fuel the check
returns `false`. -/
example : orbitRepeatsWithin (fun n : ℕ => n) {3} 0 [] 3 = false := sorry

/-- The preperiodic points of `f` inside a finite candidate set `S`. -/
def preperiodicFilter {α : Type*} [DecidableEq α] (f : α → α) (S : Finset α) : Finset α :=
  S.filter fun x => orbitRepeatsWithin f S (S.card + 1) [] x

theorem preperiodicFilter_subset {α : Type*} [DecidableEq α] (f : α → α) (S : Finset α) :
    preperiodicFilter f S ⊆ S := sorry

theorem preperiodicFilter_mono_sound {α : Type*} [DecidableEq α] (f : α → α) (S : Finset α)
    (x : α) (hx : x ∈ preperiodicFilter f S) : IsPreperiodicPt f x := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preperiodicFilter_test_square`: the preperiodic points
of `z²` among `{−2, …, 2}` are `{−1, 0, 1}`. -/
example : preperiodicFilter (fun z : ℚ => z ^ 2) {-2, -1, 0, 1, 2} = {-1, 0, 1} := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preperiodicFilter_test_empty`: the empty candidate set
gives no points. -/
example : preperiodicFilter (fun z : ℚ => z ^ 2) ∅ = ∅ := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preperiodicFilter_test_translation`: a translation has
no preperiodic points. -/
example : preperiodicFilter (fun n : ℤ => n + 1) (Finset.Icc (-3) 3) = ∅ := sorry

/-- Node `DY.3/preperiodic-filter-correct`: if `S` contains every preperiodic point of `f`, the
filter returns exactly the preperiodic points. -/
theorem mem_preperiodicFilter_iff {α : Type*} [DecidableEq α] (f : α → α) (S : Finset α)
    (hS : ∀ y, IsPreperiodicPt f y → y ∈ S) (x : α) :
    x ∈ preperiodicFilter f S ↔ IsPreperiodicPt f x := sorry

/-- The candidate box for rational preperiodic points of `z^d + c`: the rationals `a/b` with
`b^d = den c` and `|a| ≤ ⌈b(1 + |c|)⌉` (empty when `den c` is not a `d`-th power). -/
def unicriticalCandidates (d : ℕ) (c : ℚ) : Finset ℚ :=
  ((Finset.range (c.den + 1)).filter fun b => b ^ d = c.den).biUnion fun b =>
    (Finset.Icc (-⌈(b : ℚ) * (1 + |c|)⌉) ⌈(b : ℚ) * (1 + |c|)⌉).image fun a : ℤ => (a : ℚ) / b

theorem mem_unicriticalCandidates_of_preperiodic (hd : 2 ≤ d) {c x : ℚ}
    (hx : IsPreperiodicPt (fun z : ℚ => z ^ d + c) x) :
    x ∈ unicriticalCandidates d c := sorry

theorem card_unicriticalCandidates_le (d : ℕ) (hd : 1 ≤ d) (c : ℚ) :
    (unicriticalCandidates d c).card ≤ 2 * ⌈(c.den : ℚ) * (1 + |c|)⌉.toNat + 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalCandidates_test_integral`: for `c = 0` and
`d = 2` the box is `{−1, 0, 1}`. -/
example : unicriticalCandidates 2 0 = {-1, 0, 1} := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalCandidates_test_nonsquare`: the denominator of
`1/2` is not a square, so there is no candidate for `z² + 1/2`. -/
example : unicriticalCandidates 2 (1 / 2) = ∅ := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalCandidates_test_quarter`: for `c = −29/16`
every candidate has denominator dividing `4`. -/
example : ∀ x ∈ unicriticalCandidates 2 (-29 / 16), x.den ∣ 4 := sorry

/-- The rational preperiodic points of `z^d + c` (finite part of `ℙ¹(ℚ)`), computed by the
orbit-repetition filter on the candidate box. -/
def unicriticalRationalPreperiodic (d : ℕ) (c : ℚ) : Finset ℚ :=
  preperiodicFilter (fun z => z ^ d + c) (unicriticalCandidates d c)

theorem unicriticalRationalPreperiodic_subset (d : ℕ) (c : ℚ) :
    unicriticalRationalPreperiodic d c ⊆ unicriticalCandidates d c := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalRationalPreperiodic_test_poonen`: for
`z² − 29/16` there are eight finite rational preperiodic points (Poonen 1995, Figure 1). -/
example : (unicriticalRationalPreperiodic 2 (-29 / 16)).card = 8 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalRationalPreperiodic_test_chebyshev`: for
`z² − 2` the finite rational preperiodic points are `{−2, −1, 0, 1, 2}`. -/
example : unicriticalRationalPreperiodic 2 (-2) = {-2, -1, 0, 1, 2} := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalRationalPreperiodic_test_empty`: `z² + 1` has
no finite rational preperiodic point. -/
example : unicriticalRationalPreperiodic 2 1 = ∅ := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.unicriticalRationalPreperiodic_test_cube`: `z³` has the
finite rational preperiodic points `{−1, 0, 1}`. -/
example : unicriticalRationalPreperiodic 3 0 = {-1, 0, 1} := sorry

/-- Node `DY.3/unicritical-rational-preperiodic-enumeration-correct`: the enumeration returns
exactly the rational preperiodic points of `z^d + c`. -/
theorem mem_unicriticalRationalPreperiodic_iff (hd : 2 ≤ d) (c x : ℚ) :
    x ∈ unicriticalRationalPreperiodic d c ↔ IsPreperiodicPt (fun z : ℚ => z ^ d + c) x := sorry

/-- The points of `ℙ¹(ℚ)` of multiplicative height at most `H`: the classes `[a : b]` with
`|a|, |b| ≤ H`, `(a, b) ≠ 0`. -/
noncomputable def ratPointsOfHeightLE (H : ℕ) : Finset (ℙ ℚ (Fin 2 → ℚ)) :=
  open Classical in
  ((Finset.Icc (-(H : ℤ)) H ×ˢ Finset.Icc (-(H : ℤ)) H).filter fun ab => ab ≠ (0, 0)).image
    fun ab => if h : (![(ab.1 : ℚ), (ab.2 : ℚ)] : Fin 2 → ℚ) ≠ 0 then Projectivization.mk ℚ _ h
      else Projectivization.mk ℚ ![0, 1] (by simp)

theorem mem_ratPointsOfHeightLE_iff (H : ℕ) (v : Fin 2 → ℚ) (hv : v ≠ 0) :
    Projectivization.mk ℚ v hv ∈ ratPointsOfHeightLE H ↔ Height.mulHeight v ≤ H := sorry

theorem ratPointsOfHeightLE_mono {H H' : ℕ} (h : H ≤ H') :
    ratPointsOfHeightLE H ⊆ ratPointsOfHeightLE H' := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.ratPointsOfHeightLE_test_one`: there are four points of
height one: `0, ∞, 1, −1`. -/
example : (ratPointsOfHeightLE 1).card = 4 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.ratPointsOfHeightLE_test_zero`: no point has height `0`. -/
example : ratPointsOfHeightLE 0 = ∅ := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.ratPointsOfHeightLE_test_half`: `[1 : 2]` has height `2`,
so it is in the height-`2` set and not in the height-`1` set. -/
example : Projectivization.mk ℚ ![1 / 2, 1] (by simp) ∈ ratPointsOfHeightLE 2 ∧
    Projectivization.mk ℚ ![1 / 2, 1] (by simp) ∉ ratPointsOfHeightLE 1 := sorry

/-- Node `DY.3/rational-preperiodic-enumeration-over-Q`: for a lift `F` of degree `d ≥ 2` over `ℚ`
with a Nullstellensatz certificate, the orbit-repetition filter on the points of height
`≤ exp(C/(d − 1))` returns exactly the rational preperiodic points of `toEnd (mk F)`. -/
theorem preperiodic_eq_preperiodicFilter_ratPoints {M : ℕ} (hd : 2 ≤ d) (F : HomogeneousLift ℚ d)
    {q : Fin 2 × Fin 2 → MvPolynomial (Fin 2) ℚ} (hq : ∀ a, (q a).IsHomogeneous M)
    (hcert : ∀ k, ∑ j, q (k, j) * F.forms j = MvPolynomial.X k ^ (M + d)) {H : ℕ}
    (hH : Real.exp (Real.log (2 * max (Height.mulHeightBound q) 1) / (d - 1)) ≤ H) :
    open Classical in
    preperiodicPts (RationalMap.toEnd (RationalMap.mk F)) =
      ↑(preperiodicFilter (RationalMap.toEnd (RationalMap.mk F)) (ratPointsOfHeightLE H)) := sorry

/-- Node `DY.3/rational-preperiodic-enumeration-over-a-number-field`: over a number field with
decidable equality on points (the exact carrier of `ComputationalNumberTheory:CN.0`), a finite set
`S` certified to contain every point of height `≤ C/(d − 1)` (`EffectiveDiophantineMethods:ED.0`)
yields exactly the preperiodic points by the orbit-repetition filter. -/
theorem preperiodic_eq_preperiodicFilter_of_heightEnumeration {L : Type*} [Field L]
    [NumberField L] [DecidableEq (ℙ L (Fin 2 → L))] {M : ℕ} (hd : 2 ≤ d)
    (F : HomogeneousLift L d) {q : Fin 2 × Fin 2 → MvPolynomial (Fin 2) L}
    (hq : ∀ a, (q a).IsHomogeneous M)
    (hcert : ∀ k, ∑ j, q (k, j) * F.forms j = MvPolynomial.X k ^ (M + d))
    (S : Finset (ℙ L (Fin 2 → L)))
    (hS : ∀ (v : Fin 2 → L) (hv : v ≠ 0),
      Height.logHeight v ≤
          Real.log (2 ^ Height.totalWeight L * max (Height.mulHeightBound q) 1) / (d - 1) →
        Projectivization.mk L v hv ∈ S) :
    preperiodicPts (RationalMap.toEnd (RationalMap.mk F)) =
      ↑(preperiodicFilter (RationalMap.toEnd (RationalMap.mk F)) S) := sorry

/-! ### Rational cycles and preperiodic points of `z² + c` over `ℚ` -/

/-- Node `DY.3/quadratic-rational-cycles-of-length-at-most-three` (Poonen 1995, Theorem 1;
Walde–Russo; Morton 1992): rational points of exact period `1`, `2`, `3` for `z² + c`. -/
theorem quadratic_rational_periods_le_three (c : ℚ) :
    ((∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 1) ↔
        ∃ ρ : ℚ, c = 1 / 4 - ρ ^ 2) ∧
      ((∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 2) ↔
        ∃ σ : ℚ, σ ≠ 0 ∧ c = -3 / 4 - σ ^ 2) ∧
      ((∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3) ↔
        ∃ τ : ℚ, τ ≠ 0 ∧ τ ≠ -1 ∧
          c = -(τ ^ 6 + 2 * τ ^ 5 + 4 * τ ^ 4 + 8 * τ ^ 3 + 9 * τ ^ 2 + 4 * τ + 1) /
            (4 * τ ^ 2 * (τ + 1) ^ 2)) := sorry

/-- Node `DY.3/morton-no-rational-four-cycles` (Morton 1998, Theorem 4). -/
theorem quadratic_no_rational_four_cycle (c x : ℚ) :
    Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x ≠ 4 := sorry

/-- Node `DY.3/flynn-poonen-schaefer-no-rational-five-cycles` (Flynn–Poonen–Schaefer 1995,
Theorem 1). -/
theorem quadratic_no_rational_five_cycle (c x : ℚ) :
    Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x ≠ 5 := sorry

/- Node `DY.3/stoll-conditional-no-rational-six-cycles` (Stoll 2008, Theorem 6) is conditional on
the Mordell–Weil rank of the Jacobian of `X₀^dyn(6)` being `3`. Neither the Jacobian of a curve nor
its Mordell–Weil rank exists in Mathlib at the pinned commit, so the hypothesis cannot be stated and
no Lean statement is suggested here (see the roadmap document). -/

/-- Node `DY.3/poonen-period-combinations` (Poonen 1995, Theorem 2). -/
theorem quadratic_period_combinations (c : ℚ) :
    (((∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 1) ∧
        ∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 2) ↔
      ∃ μ' : ℚ, μ' ≠ -1 ∧ μ' ≠ 0 ∧ μ' ≠ 1 ∧
        c = -(3 * μ' ^ 4 + 10 * μ' ^ 2 + 3) / (4 * (μ' ^ 2 - 1) ^ 2)) ∧
      ((∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3) →
        ∀ y : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y ≠ 1 ∧
          Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y ≠ 2) := sorry

/-- A point of type `(m, n)` for `z² + c` (`n ≥ 1`): it enters an `m`-cycle after exactly `n`
steps (Poonen 1995, §3). Stated inline in the theorems below as
`minimalPeriod f (f^[n] x) = m ∧ f^[n - 1] x ∉ periodicPts f`. -/
theorem quadratic_type_m1_iff (c x : ℚ) {m : ℕ} (hm : 1 ≤ m) :
    (Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) ((fun z : ℚ => z ^ 2 + c) x) = m ∧
        x ∉ Function.periodicPts fun z : ℚ => z ^ 2 + c) ↔
      -x ≠ 0 ∧ Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) (-x) = m := sorry

/-- Node `DY.3/poonen-type-one-two` (Poonen 1995, Theorem 3(2)). -/
theorem quadratic_type_12_iff (c : ℚ) :
    (∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c)
        ((fun z : ℚ => z ^ 2 + c)^[2] x) = 1 ∧
      (fun z : ℚ => z ^ 2 + c) x ∉ Function.periodicPts fun z : ℚ => z ^ 2 + c) ↔
      ∃ η : ℚ, η ≠ 1 ∧ η ≠ -1 ∧ c = -2 * (η ^ 2 + 1) / (η ^ 2 - 1) ^ 2 := sorry

/-- Node `DY.3/poonen-type-two-two` (Poonen 1995, Theorem 3(3)). -/
theorem quadratic_type_22_iff (c : ℚ) :
    (∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c)
        ((fun z : ℚ => z ^ 2 + c)^[2] x) = 2 ∧
      (fun z : ℚ => z ^ 2 + c) x ∉ Function.periodicPts fun z : ℚ => z ^ 2 + c) ↔
      ∃ ν : ℚ, ν ≠ -1 ∧ ν ≠ 0 ∧ ν ≠ 1 ∧
        c = -(ν ^ 4 + 2 * ν ^ 3 + 2 * ν ^ 2 - 2 * ν + 1) / (ν ^ 2 - 1) ^ 2 := sorry

/-- Node `DY.3/poonen-type-three-two` (Poonen 1995, Theorem 3(4)). -/
theorem quadratic_type_32_iff (c : ℚ) :
    (∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c)
        ((fun z : ℚ => z ^ 2 + c)^[2] x) = 3 ∧
      (fun z : ℚ => z ^ 2 + c) x ∉ Function.periodicPts fun z : ℚ => z ^ 2 + c) ↔
      c = -29 / 16 := sorry

/-- Node `DY.3/poonen-type-exclusions` (Poonen 1995, Theorem 3(5)): a rational point of type
`(a, 2)` with `a ≤ 3` excludes rational points of period `b ≤ 3`, `b ≠ a`. -/
theorem quadratic_type_a2_excludes (c : ℚ) {a b : ℕ} (ha : 1 ≤ a) (ha3 : a ≤ 3) (hb : 1 ≤ b)
    (hb3 : b ≤ 3) (hab : b ≠ a)
    (h : ∃ x : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c)
        ((fun z : ℚ => z ^ 2 + c)^[2] x) = a ∧
      (fun z : ℚ => z ^ 2 + c) x ∉ Function.periodicPts fun z : ℚ => z ^ 2 + c) :
    ∀ y : ℚ, Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y ≠ b := sorry

/-- Node `DY.3/poonen-no-long-tails` (Poonen 1995, Theorem 3(6)): no rational point of type
`(m, n)` with `m ≤ 3` and `n ≥ 3`. -/
theorem quadratic_no_type_m_n (c x : ℚ) {m n : ℕ} (hm : 1 ≤ m) (hm3 : m ≤ 3) (hn : 3 ≤ n) :
    ¬ (Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) ((fun z : ℚ => z ^ 2 + c)^[n] x) = m ∧
      (fun z : ℚ => z ^ 2 + c)^[n - 1] x ∉ Function.periodicPts fun z : ℚ => z ^ 2 + c) := sorry

/-! ### Conjectures (definitions `DY.3/poonen-conjecture`, `DY.3/uniform-boundedness-conjecture`) -/

/-- Poonen's conjecture (Flynn–Poonen–Schaefer 1995, Conjecture 2; Poonen 1995, Conjecture 2):
no `z² + c` with `c ∈ ℚ` has a rational point of exact period `≥ 4`. A proposition, used only as
an explicit hypothesis. -/
def PoonenConjecture : Prop :=
  ∀ c x : ℚ, ∀ N : ℕ, 4 ≤ N → Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x ≠ N

theorem PoonenConjecture.minimalPeriod_le_three (h : PoonenConjecture) (c x : ℚ) :
    Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x ≤ 3 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.PoonenConjecture_test_three`: the bound `4` cannot be
lowered: `−1/4` has exact period `3` for `z² − 29/16`. -/
example : Function.minimalPeriod (fun z : ℚ => z ^ 2 + (-29 / 16)) (-1 / 4) = 3 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.PoonenConjecture_test_four`: the case `N = 4` of the
conjecture is Morton's theorem. -/
example (h : PoonenConjecture) (c x : ℚ) :
    Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x ≠ 4 := h c x 4 le_rfl

/-- Unit test `TauCeti.ArithmeticDynamics.PoonenConjecture_test_nonexample`: the analogous
statement with `3` in place of `4` is false. -/
example : ¬ ∀ c x : ℚ, ∀ N : ℕ, 3 ≤ N → Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x ≠ N :=
  sorry

/-- Node `DY.3/poonen-preperiodic-bound` (Poonen 1995, Corollary 1): under Poonen's conjecture
`z² + c` has at most `8` finite rational preperiodic points (`9` with `∞`), attained at
`c = −29/16`. -/
theorem card_quadratic_preperiodic_le_eight (h : PoonenConjecture) (c : ℚ) :
    (preperiodicPts fun z : ℚ => z ^ 2 + c).ncard ≤ 8 := sorry

/-- The Morton–Silverman uniform boundedness conjecture for `ℙ¹` (the `ℙᴺ` statement is in the
roadmap document): for all `d ≥ 2` and `D ≥ 1` there is `C` bounding the number of rational
preperiodic points (DY.0's `preperiodicPts` of `toEnd f`) of every degree-`d` rational map over
every number field of degree `≤ D`. A proposition, used only as an explicit hypothesis. -/
def UniformBoundednessConjecture (d D : ℕ) : Prop :=
  ∃ C : ℕ, ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L ≤ D →
    ∀ f : RationalMap L, f.degree = d → (preperiodicPts (RationalMap.toEnd f)).encard ≤ C

theorem UniformBoundednessConjecture.mono {D D' : ℕ} (h : UniformBoundednessConjecture d D')
    (hD : D ≤ D') : UniformBoundednessConjecture d D := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.UniformBoundednessConjecture_test_degenerate`: there
is no number field of degree `0`, so the case `D = 0` holds trivially. -/
example (d : ℕ) : UniformBoundednessConjecture d 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.UniformBoundednessConjecture_test_linear`: the
statement fails in degree `1` (the identity has every point preperiodic). -/
example : ¬ UniformBoundednessConjecture 1 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.UniformBoundednessConjecture_test_poonen`: any bound in
degree `2` over `ℚ` is at least `9` (the nine rational preperiodic points of `z² − 29/16`). -/
example (C : ℕ) (hC : ∀ (L : Type) [Field L] [NumberField L], Module.finrank ℚ L ≤ 1 →
    ∀ f : RationalMap L, f.degree = 2 → (preperiodicPts (RationalMap.toEnd f)).encard ≤ C) :
    9 ≤ C := sorry

end DY3

end TauCeti.ArithmeticDynamics

end DY3File


-- ===== DY.4 =====

section DY4File

/-!
## DY.4 Equidistribution and small points

Suggested Lean for stage `ArithmeticDynamics:DY.4`. This file is not the roadmap and is not
exhaustive: the roadmap document is definitive. The statements suggest Lean forms so that
contributors and reviewers converge on names and signatures; every definition body that cannot yet
be written, every API lemma, unit test and theorem is proved by `sorry`, and nothing here is an
implementation claim.

It imports only Mathlib (082e2d3). The Berkovich line, its Laplacian and the mutual energy belong
to `TropicalAndBerkovichArithmetic` TB.1/TB.6 (not in the pinned libraries); here the local data at
a place are bundled in `AnalyticLine` (data only), and the energy and potentials are written with
the kernel `δ_v`; these are stand-ins for the external suppliers TB.1/TB.6 and stay until those
exist. Rational maps and their lifts (DY.0), canonical heights (DY.1), escape rates and local
canonical heights (DY.2) are the declarations of the earlier sections (see the section
"Dynamics" below).
-/

namespace TauCeti.ArithmeticDynamics

section DY4

open MeasureTheory Filter Topology
open scoped ENNReal NNReal MatrixGroups LinearAlgebra.Projectivization

/-- The places of a number field `K`: its infinite places and its finite places. -/
abbrev NumberFieldPlace (K : Type) [Field K] [NumberField K] : Type :=
  NumberField.InfinitePlace K ⊕ NumberField.FinitePlace K

/-- **Construction `DY.4/analytic-line-at-a-place`.** The analytic projective line `P¹_v^an` at a
place `v` of a number field `K`: the Riemann sphere at an infinite place, the Berkovich projective
line over `C_v` at a finite place (TB.1), with the absolute value `|·|_v` on `K̄` given by the
embedding `ι_v : K̄ → C_v`, the inclusion of type I points, the kernel `δ_v` (`|x - y|` on `ℂ`, the
Hsia kernel relative to `∞` at finite places), the circle measures `m_{a,r,v}` and the weight
`r_v = [K_v : ℚ_v]/[K : ℚ]`. Data only: all properties are the API lemmas below. -/
structure AnalyticLine (K : Type) [Field K] where
  /-- The compact space `P¹_v^an`. -/
  carrier : Type
  [topologicalSpace : TopologicalSpace carrier]
  [compactSpace : CompactSpace carrier]
  [t2Space : T2Space carrier]
  [measurableSpace : MeasurableSpace carrier]
  [borelSpace : BorelSpace carrier]
  /-- The absolute value `|x|_v := |ι_v x|_v` on `K̄`, extending `v`. -/
  absv : AbsoluteValue (AlgebraicClosure K) ℝ
  /-- The type I points: `P¹(K̄) → P¹_v^an`, `x ↦ ι_v x`, `∞ ↦ ∞`. -/
  embed : OnePoint (AlgebraicClosure K) → carrier
  /-- The kernel `δ_v` (Hsia kernel relative to `∞`). -/
  kernel : carrier → carrier → ℝ
  /-- The circle measure `m_{a,r,v}`: arc length on `|z - a| = r` (infinite `v`), the Dirac mass at
  `ζ_{a,r}` (finite `v`). -/
  circle : AlgebraicClosure K → ℝ → ProbabilityMeasure carrier
  /-- The weight `r_v = [K_v : ℚ_v]/[K : ℚ]`. -/
  weight : ℝ

attribute [instance] AnalyticLine.topologicalSpace AnalyticLine.compactSpace AnalyticLine.t2Space
  AnalyticLine.measurableSpace AnalyticLine.borelSpace

namespace AnalyticLine

variable {K : Type} [Field K] (L : AnalyticLine K)

/-- The point `∞` of `P¹_v^an`. -/
def infty : L.carrier := L.embed OnePoint.infty

/-- **Definition `DY.4/standard-measure-at-a-place`.** The standard measure `λ_v = m_{0,1,v}`. -/
noncomputable def standard : ProbabilityMeasure L.carrier := L.circle 0 1

/-- The logarithmic potential `z ↦ ∫ log δ_v(z, w) dμ(w)` (stand-in for TB.6). -/
noncomputable def potential (μ : Measure L.carrier) (z : L.carrier) : ℝ :=
  ∫ w, Real.log (L.kernel z w) ∂μ

/-- The mutual energy `(μ, ν)_v = -∫∫ log δ_v dμ dν`, the diagonal of type I points omitted
(stand-in for TB.6). -/
noncomputable def energy (μ ν : Measure L.carrier) : ℝ :=
  -∫ p, Set.indicator {p : L.carrier × L.carrier | ¬(p.1 = p.2 ∧ p.1 ∈ Set.range L.embed)}
    (fun p => Real.log (L.kernel p.1 p.2)) p ∂(μ.prod ν)

/-- The energy `(μ - ν, μ - ν)_v` of a difference, expanded bilinearly. -/
noncomputable def energyDiff (μ ν : Measure L.carrier) : ℝ :=
  L.energy μ μ - 2 * L.energy μ ν + L.energy ν ν

/-- `μ` has a continuous potential relative to `λ_v` (stand-in for TB.6's class). -/
def HasContinuousPotential (μ : Measure L.carrier) : Prop :=
  ∃ g : C(L.carrier, ℝ), ∀ z, z ≠ L.infty →
    g z = L.potential μ z - L.potential (L.standard : Measure L.carrier) z

/-- **Construction `DY.4/galois-orbit-measure`.** `[F]_v = |F|⁻¹ Σ_{x ∈ F} δ_{ι_v x}`. -/
noncomputable def orbitMeasure (F : Finset (OnePoint (AlgebraicClosure K))) : Measure L.carrier :=
  (F.card : ℝ≥0∞)⁻¹ • ∑ x ∈ F, Measure.dirac (L.embed x)

/-- **Construction `DY.4/regularised-measure-of-a-finite-set`.** `[F]_{v,r} = |F|⁻¹ Σ_x m_{x,r,v}`. -/
noncomputable def regularised (F : Finset (AlgebraicClosure K)) (r : ℝ) : Measure L.carrier :=
  (F.card : ℝ≥0∞)⁻¹ • ∑ x ∈ F, (L.circle x r : Measure L.carrier)

/-- The regularisation modulus `ω_g(r) = sup_x |∫ g dm_{x,r} - g(ι x)|`. -/
noncomputable def regularisationModulus (g : C(L.carrier, ℝ)) (r : ℝ) : ℝ :=
  ⨆ x : AlgebraicClosure K,
    |∫ z, g z ∂(L.circle x r : Measure L.carrier) - g (L.embed (x : OnePoint _))|

end AnalyticLine

variable (K : Type) [Field K] [NumberField K]

/-- Stand-in for `TropicalAndBerkovichArithmetic:TB.1`: the analytic line at an infinite place,
the Riemann sphere `OnePoint ℂ`. -/
noncomputable def AnalyticLine.ofInfinitePlace (w : NumberField.InfinitePlace K) :
    AnalyticLine K := sorry

/-- Stand-in for `TropicalAndBerkovichArithmetic:TB.1`: the analytic line at a finite place, the
Berkovich projective line over `C_v`. -/
noncomputable def AnalyticLine.ofFinitePlace (v : NumberField.FinitePlace K) :
    AnalyticLine K := sorry

/-- The family `v ↦ P¹_v^an` over all places of `K`. -/
noncomputable def NumberFieldPlace.analyticLine : NumberFieldPlace K → AnalyticLine K :=
  Sum.elim (AnalyticLine.ofInfinitePlace K) (AnalyticLine.ofFinitePlace K)

local notation "Lv[" v "]" => NumberFieldPlace.analyticLine K v

/-- Mathlib's normalised value of `a` at a place: `w a ^ mult w` or the `FinitePlace` value. -/
noncomputable def NumberFieldPlace.normValue (v : NumberFieldPlace K) (a : K) : ℝ :=
  Sum.elim (fun w : NumberField.InfinitePlace K => w a ^ w.mult)
    (fun w : NumberField.FinitePlace K => w a) v

theorem AnalyticLine.kernel_embed (v : NumberFieldPlace K) (x y : AlgebraicClosure K) :
    (Lv[v]).kernel ((Lv[v]).embed x) ((Lv[v]).embed y) = (Lv[v]).absv (x - y) := sorry

theorem AnalyticLine.kernel_symm (v : NumberFieldPlace K) (x y : (Lv[v]).carrier) :
    (Lv[v]).kernel x y = (Lv[v]).kernel y x := sorry

theorem AnalyticLine.potential_circle (v : NumberFieldPlace K) (a z : AlgebraicClosure K) {r : ℝ}
    (hr : 0 < r) :
    (Lv[v]).potential ((Lv[v]).circle a r : Measure _) ((Lv[v]).embed z) =
      Real.log (max ((Lv[v]).absv (z - a)) r) := sorry

theorem AnalyticLine.weight_mul_log_eq (v : NumberFieldPlace K) {a : K} (ha : a ≠ 0) :
    (Lv[v]).weight * Real.log ((Lv[v]).absv (algebraMap K (AlgebraicClosure K) a)) =
      (Module.finrank ℚ K : ℝ)⁻¹ * Real.log (NumberFieldPlace.normValue K v a) := sorry

theorem NumberFieldPlace.sum_weight_infinite :
    ∑ w : NumberField.InfinitePlace K, (Lv[Sum.inl w]).weight = 1 := sorry

theorem NumberFieldPlace.sum_weight_mul_log_eq_zero {a : K} (ha : a ≠ 0) :
    ∑ᶠ v : NumberFieldPlace K,
      (Lv[v]).weight * Real.log ((Lv[v]).absv (algebraMap K (AlgebraicClosure K) a)) = 0 := sorry

/-! Unit tests for `AnalyticLine`. -/

/-- Unit test `AnalyticLine.test_kernel_two_adic`: at the finite place `2` of `ℚ`,
`δ(ι 1, ι 3) = 1/2`. -/
example (v : NumberField.FinitePlace ℚ)
    (hv : v.1 (2 : ℚ) = 1 / 2) :
    (NumberFieldPlace.analyticLine ℚ (Sum.inr v)).kernel
      ((NumberFieldPlace.analyticLine ℚ (Sum.inr v)).embed ((1 : AlgebraicClosure ℚ) : OnePoint _))
      ((NumberFieldPlace.analyticLine ℚ (Sum.inr v)).embed ((3 : AlgebraicClosure ℚ) : OnePoint _))
      = 1 / 2 := sorry

/-- Unit test `AnalyticLine.test_potential_circle_origin`: the potential of `m_{0,1,v}` at `ι z` is
`log⁺ |z|_v`. -/
example (v : NumberFieldPlace K) (z : AlgebraicClosure K) :
    (Lv[v]).potential ((Lv[v]).circle 0 1 : Measure _) ((Lv[v]).embed z) =
      Real.posLog ((Lv[v]).absv z) := sorry

/-- Unit test `AnalyticLine.test_weight_rat`: over `ℚ` every place has weight `1`. -/
example (v : NumberFieldPlace ℚ) : (NumberFieldPlace.analyticLine ℚ v).weight = 1 := sorry

/-- Unit test `AnalyticLine.test_circle_not_classical`: at a finite place the Gauss point is not a
type I point. -/
example (v : NumberField.FinitePlace K) (x : OnePoint (AlgebraicClosure K)) :
    ((Lv[Sum.inr v]).circle 0 1 : Measure (Lv[Sum.inr v]).carrier) ≠
      Measure.dirac ((Lv[Sum.inr v]).embed x) := sorry

/-! API and unit tests for the standard measure. -/

theorem AnalyticLine.potential_standard (v : NumberFieldPlace K) (z : AlgebraicClosure K) :
    (Lv[v]).potential ((Lv[v]).standard : Measure _) ((Lv[v]).embed z) =
      Real.posLog ((Lv[v]).absv z) := sorry

theorem AnalyticLine.energy_standard_self (v : NumberFieldPlace K) :
    (Lv[v]).energy ((Lv[v]).standard : Measure _) ((Lv[v]).standard : Measure _) = 0 := sorry

theorem AnalyticLine.energy_dirac_standard (v : NumberFieldPlace K) (x : AlgebraicClosure K) :
    (Lv[v]).energy (Measure.dirac ((Lv[v]).embed x)) ((Lv[v]).standard : Measure _) =
      -Real.posLog ((Lv[v]).absv x) := sorry

theorem AnalyticLine.standard_hasContinuousPotential (v : NumberFieldPlace K) :
    (Lv[v]).HasContinuousPotential ((Lv[v]).standard : Measure _) :=
  ⟨0, fun _ _ => by simp⟩

theorem AnalyticLine.standard_invariant_unit (v : NumberFieldPlace K) (u : AlgebraicClosure K)
    (hu : (Lv[v]).absv u = 1) (x : AlgebraicClosure K) :
    (Lv[v]).potential ((Lv[v]).standard : Measure _) ((Lv[v]).embed (u * x)) =
      (Lv[v]).potential ((Lv[v]).standard : Measure _) ((Lv[v]).embed x) := sorry

/-- Unit test `AnalyticLine.test_standard_self_energy`: `(λ_v, λ_v)_v = 0`. -/
example (v : NumberFieldPlace K) :
    (Lv[v]).energy ((Lv[v]).standard : Measure _) ((Lv[v]).standard : Measure _) = 0 := sorry

/-- Unit test `AnalyticLine.test_standard_pairing_two`: at an infinite place `([2], λ_v)_v = -log 2`. -/
example (w : NumberField.InfinitePlace K) :
    (Lv[Sum.inl w]).energy (Measure.dirac ((Lv[Sum.inl w]).embed (2 : AlgebraicClosure K)))
      ((Lv[Sum.inl w]).standard : Measure _) = -Real.log 2 := sorry

/-- Unit test `AnalyticLine.test_standard_ne_dirac_zero`: `λ_v ≠ δ_{ι 0}`. -/
example (v : NumberFieldPlace K) :
    ((Lv[v]).standard : Measure (Lv[v]).carrier) ≠
      Measure.dirac ((Lv[v]).embed (0 : AlgebraicClosure K)) := sorry

/-- Unit test `AnalyticLine.test_standard_finite_gauss`: at a finite place `λ_v` gives no mass to the
type I points. -/
example (v : NumberField.FinitePlace K) :
    ((Lv[Sum.inr v]).standard : Measure (Lv[Sum.inr v]).carrier)
      (Set.range (Lv[Sum.inr v]).embed) = 0 := sorry


/-! ### Galois-stable sets and their measures (`DY.4/galois-orbit-measure`) -/

open scoped Classical in
/-- A finite subset of `P¹(K̄)` is Galois-stable if every `σ ∈ Gal(K̄/K)` maps it into itself. -/
def IsGaloisStableFinset (F : Finset (OnePoint (AlgebraicClosure K))) : Prop :=
  ∀ σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K, ∀ x ∈ F, OnePoint.map σ x ∈ F

theorem finite_galoisOrbitSet (x : OnePoint (AlgebraicClosure K)) :
    {y | ∃ σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K, y = OnePoint.map σ x}.Finite := sorry

/-- The Galois orbit `Gal(K̄/K)·x` of `x ∈ P¹(K̄)`. -/
noncomputable def galoisOrbitFinset (x : OnePoint (AlgebraicClosure K)) :
    Finset (OnePoint (AlgebraicClosure K)) :=
  (finite_galoisOrbitSet K x).toFinset

theorem isGaloisStableFinset_galoisOrbitFinset (x : OnePoint (AlgebraicClosure K)) :
    IsGaloisStableFinset K (galoisOrbitFinset K x) ∧ x ∈ galoisOrbitFinset K x ∧
      ∀ F, IsGaloisStableFinset K F → x ∈ F → galoisOrbitFinset K x ⊆ F := sorry

theorem card_galoisOrbitFinset (x : AlgebraicClosure K) :
    (galoisOrbitFinset K (x : OnePoint (AlgebraicClosure K))).card = (minpoly K x).natDegree := sorry

theorem AnalyticLine.orbitMeasure_univ (L : AnalyticLine K) {F : Finset (OnePoint (AlgebraicClosure K))}
    (hF : F.Nonempty) : L.orbitMeasure F Set.univ = 1 := sorry

theorem AnalyticLine.integral_orbitMeasure (L : AnalyticLine K)
    (F : Finset (OnePoint (AlgebraicClosure K))) (f : C(L.carrier, ℝ)) :
    ∫ z, f z ∂(L.orbitMeasure F) = (F.card : ℝ)⁻¹ * ∑ x ∈ F, f (L.embed x) := sorry

open scoped Classical in
theorem IsGaloisStableFinset.union {F G : Finset (OnePoint (AlgebraicClosure K))}
    (hF : IsGaloisStableFinset K F) (hG : IsGaloisStableFinset K G) : IsGaloisStableFinset K (F ∪ G) := sorry

/-- Unit test `AnalyticLine.test_orbitMeasure_singleton`: `[{x}]_v = δ_{ι_v x}`. -/
example (L : AnalyticLine K) (x : OnePoint (AlgebraicClosure K)) :
    L.orbitMeasure {x} = Measure.dirac (L.embed x) := sorry

open scoped Classical in
/-- Unit test `test_galoisOrbitFinset_sqrt_two`: over `ℚ` the orbit of `√2` is `{√2, -√2}`. -/
example (s : AlgebraicClosure ℚ) (hs : s ^ 2 = 2) :
    galoisOrbitFinset ℚ (s : OnePoint (AlgebraicClosure ℚ)) =
      {(s : OnePoint (AlgebraicClosure ℚ)), ((-s : AlgebraicClosure ℚ) : OnePoint (AlgebraicClosure ℚ))} :=
  sorry

/-- Unit test `test_not_isGaloisStableFinset_sqrt_two`: `{√2}` is not Galois-stable over `ℚ`. -/
example (s : AlgebraicClosure ℚ) (hs : s ^ 2 = 2) :
    ¬ IsGaloisStableFinset ℚ {(s : OnePoint (AlgebraicClosure ℚ))} := sorry

/-- Unit test `test_galoisOrbitFinset_rat`: for `x ∈ K` the orbit is `{x}`. -/
example (x : K) :
    galoisOrbitFinset K ((algebraMap K (AlgebraicClosure K) x : AlgebraicClosure K) : OnePoint (AlgebraicClosure K)) =
      {((algebraMap K (AlgebraicClosure K) x : AlgebraicClosure K) : OnePoint (AlgebraicClosure K))} := sorry

/-! ### Regularisation (`DY.4/regularised-measure-of-a-finite-set` and its lemmas) -/

open scoped Classical in
/-- The image of a finite subset of `K̄` in `P¹(K̄)`. -/
noncomputable def toProjLine (F : Finset (AlgebraicClosure K)) :
    Finset (OnePoint (AlgebraicClosure K)) :=
  F.image (fun x : AlgebraicClosure K => (x : OnePoint (AlgebraicClosure K)))

theorem AnalyticLine.potential_regularised (v : NumberFieldPlace K) {F : Finset (AlgebraicClosure K)}
    (hF : F.Nonempty) {r : ℝ} (hr : 0 < r) (z : AlgebraicClosure K) :
    (Lv[v]).potential ((Lv[v]).regularised F r) ((Lv[v]).embed z) =
      (F.card : ℝ)⁻¹ * ∑ x ∈ F, Real.log (max ((Lv[v]).absv (z - x)) r) := sorry

theorem AnalyticLine.energy_circle_circle (v : NumberFieldPlace K) (x y : AlgebraicClosure K) {r : ℝ}
    (hr : 0 < r) :
    (Lv[v]).energy ((Lv[v]).circle x r : Measure _) ((Lv[v]).circle y r : Measure _) =
      -Real.log (max ((Lv[v]).absv (x - y)) r) := sorry

theorem AnalyticLine.regularised_hasContinuousPotential (v : NumberFieldPlace K)
    {F : Finset (AlgebraicClosure K)} (hF : F.Nonempty) {r : ℝ} (hr : 0 < r) :
    (Lv[v]).HasContinuousPotential ((Lv[v]).regularised F r) := sorry

theorem AnalyticLine.tendsto_regularised (v : NumberFieldPlace K) (F : Finset (AlgebraicClosure K))
    (f : C((Lv[v]).carrier, ℝ)) :
    Tendsto (fun r => ∫ z, f z ∂((Lv[v]).regularised F r)) (𝓝[>] 0)
      (𝓝 (∫ z, f z ∂((Lv[v]).orbitMeasure (toProjLine K F)))) := sorry

theorem AnalyticLine.regularised_singleton_zero_one (v : NumberFieldPlace K) :
    (Lv[v]).regularised {0} 1 = ((Lv[v]).standard : Measure _) := sorry

/-- Unit test `AnalyticLine.test_regularised_zero_one`: `[{0}]_{v,1} = λ_v`. -/
example (v : NumberFieldPlace K) :
    (Lv[v]).regularised {0} 1 = ((Lv[v]).standard : Measure _) := sorry

/-- Unit test `AnalyticLine.test_energy_circle_self`: `(m_{x,1/2}, m_{x,1/2})_v = log 2`. -/
example (v : NumberFieldPlace K) (x : AlgebraicClosure K) :
    (Lv[v]).energy ((Lv[v]).circle x (1 / 2) : Measure _) ((Lv[v]).circle x (1 / 2) : Measure _) =
      Real.log 2 := sorry

/-- Unit test `AnalyticLine.test_regularised_no_atom`: for `r > 0`, `[F]_{v,r}` has no atom at a
type I point. -/
example (v : NumberFieldPlace K) (F : Finset (AlgebraicClosure K)) {r : ℝ} (hr : 0 < r)
    (y : AlgebraicClosure K) :
    (Lv[v]).regularised F r {(Lv[v]).embed y} = 0 := sorry

/-- Unit test `AnalyticLine.test_potential_regularised_far`: far from `F`, `[F]_{v,r}` and `[F]_v`
have the same potential. -/
example (v : NumberFieldPlace K) {F : Finset (AlgebraicClosure K)} (hF : F.Nonempty) {r : ℝ}
    (hr : 0 < r) (z : AlgebraicClosure K) (hz : ∀ x ∈ F, r ≤ (Lv[v]).absv (z - x)) :
    (Lv[v]).potential ((Lv[v]).regularised F r) ((Lv[v]).embed z) =
      (F.card : ℝ)⁻¹ * ∑ x ∈ F, Real.log ((Lv[v]).absv (z - x)) := sorry

/-- The correction term `ε_v(r)`: `r` at infinite places, `0` at finite places. -/
def regularisationError (v : NumberFieldPlace K) (r : ℝ) : ℝ :=
  Sum.elim (fun _ => r) (fun _ => 0) v

/-- `DY.4/regularised-self-energy-bound`. -/
theorem AnalyticLine.energy_regularised_le (v : NumberFieldPlace K) {F : Finset (AlgebraicClosure K)}
    (hF : F.Nonempty) {r : ℝ} (hr : 0 < r) :
    (Lv[v]).energy ((Lv[v]).regularised F r) ((Lv[v]).regularised F r) ≤
      (Lv[v]).energy ((Lv[v]).orbitMeasure (toProjLine K F))
        ((Lv[v]).orbitMeasure (toProjLine K F)) + (-Real.log r) / F.card := sorry

/-- `DY.4/regularisation-modulus-tends-to-zero`. -/
theorem AnalyticLine.tendsto_regularisationModulus (v : NumberFieldPlace K)
    (g : C((Lv[v]).carrier, ℝ)) :
    Tendsto (fun r => (Lv[v]).regularisationModulus g r) (𝓝[>] 0) (𝓝 0) := sorry

/-- `DY.4/regularised-pairing-estimate`. -/
theorem AnalyticLine.abs_energy_orbit_sub_regularised_le (v : NumberFieldPlace K)
    (ρ : ProbabilityMeasure (Lv[v]).carrier) (g : C((Lv[v]).carrier, ℝ))
    (hg : ∀ z, z ≠ (Lv[v]).infty →
      g z = (Lv[v]).potential ρ z - (Lv[v]).potential ((Lv[v]).standard : Measure _) z)
    {F : Finset (AlgebraicClosure K)} (hF : F.Nonempty) {r : ℝ} (hr₀ : 0 < r) (hr₁ : r < 1) :
    |(Lv[v]).energy ((Lv[v]).orbitMeasure (toProjLine K F)) ρ -
        (Lv[v]).energy ((Lv[v]).regularised F r) ρ| ≤
      (Lv[v]).regularisationModulus g r + regularisationError K v r := sorry

/-- `DY.4/energy-lower-bound-after-regularisation`. -/
theorem AnalyticLine.energyDiff_orbit_ge (v : NumberFieldPlace K)
    (ρ : ProbabilityMeasure (Lv[v]).carrier) (g : C((Lv[v]).carrier, ℝ))
    (hg : ∀ z, z ≠ (Lv[v]).infty →
      g z = (Lv[v]).potential ρ z - (Lv[v]).potential ((Lv[v]).standard : Measure _) z)
    {F : Finset (AlgebraicClosure K)} (hF : F.Nonempty) {r : ℝ} (hr₀ : 0 < r) (hr₁ : r < 1) :
    (Lv[v]).energyDiff ((Lv[v]).regularised F r) ρ
        - 2 * ((Lv[v]).regularisationModulus g r + regularisationError K v r)
        - (-Real.log r) / F.card ≤
      (Lv[v]).energyDiff ((Lv[v]).orbitMeasure (toProjLine K F)) ρ ∧
    -2 * ((Lv[v]).regularisationModulus g r + regularisationError K v r)
        - (-Real.log r) / F.card ≤
      (Lv[v]).energyDiff ((Lv[v]).orbitMeasure (toProjLine K F)) ρ := sorry

open scoped Classical in
/-- `DY.4/local-equidistribution-criterion` (Favre–Rivera-Letelier Propositions 2.11 and 4.12). -/
theorem AnalyticLine.tendsto_integral_orbitMeasure_of_energy (v : NumberFieldPlace K)
    (ρ : ProbabilityMeasure (Lv[v]).carrier) (hρ : (Lv[v]).HasContinuousPotential ρ)
    (F : ℕ → Finset (OnePoint (AlgebraicClosure K)))
    (hcard : Tendsto (fun n => (F n).card) atTop atTop)
    (henergy : ∀ ε > 0, ∀ᶠ n in atTop,
      (Lv[v]).energyDiff ((Lv[v]).orbitMeasure ((F n).erase OnePoint.infty)) ρ ≤ ε)
    (f : C((Lv[v]).carrier, ℝ)) :
    Tendsto (fun n => ∫ z, f z ∂((Lv[v]).orbitMeasure (F n))) atTop
      (𝓝 (∫ z, f z ∂(ρ : Measure (Lv[v]).carrier))) := sorry

/-- `DY.4/nonnegative-local-energy-at-standard-places` (Favre–Rivera-Letelier Lemma 5.4). -/
theorem AnalyticLine.energyDiff_standard_orbit_nonneg (v : NumberField.FinitePlace K)
    {F : Finset (AlgebraicClosure K)} (hF : F.Nonempty) :
    0 ≤ (Lv[Sum.inr v]).energyDiff ((Lv[Sum.inr v]).standard : Measure _)
      ((Lv[Sum.inr v]).orbitMeasure (toProjLine K F)) := sorry

/-! ### Adelic measures (`DY.4/adelic-measure`) -/

/-- **Definition `DY.4/adelic-measure`.** Probability measures `ρ_v` on the analytic lines, equal to
`λ_v` for all but finitely many places, each with a continuous potential. -/
structure AdelicMeasure where
  /-- The measure at the place `v`. -/
  toFun : ∀ v : NumberFieldPlace K, ProbabilityMeasure (Lv[v]).carrier
  finite_ne_standard : {v | toFun v ≠ (Lv[v]).standard}.Finite
  hasContinuousPotential : ∀ v, (Lv[v]).HasContinuousPotential (toFun v : Measure _)

namespace AdelicMeasure

variable {K}

/-- The standard adelic measure `λ`. -/
noncomputable def standard : AdelicMeasure K where
  toFun v := (Lv[v]).standard
  finite_ne_standard := by simp
  hasContinuousPotential v := AnalyticLine.standard_hasContinuousPotential K v

/-- The finite set `N(ρ)` of places where `ρ_v ≠ λ_v`. -/
def exceptionalPlaces (ρ : AdelicMeasure K) : Set (NumberFieldPlace K) :=
  {v | ρ.toFun v ≠ (Lv[v]).standard}

/-- The continuous potential `g_{ρ,v}` of `ρ_v` relative to `λ_v`. -/
noncomputable def potential (ρ : AdelicMeasure K) (v : NumberFieldPlace K) :
    C((Lv[v]).carrier, ℝ) :=
  Classical.choose (ρ.hasContinuousPotential v)

theorem potential_eq_zero (ρ : AdelicMeasure K) (v : NumberFieldPlace K)
    (hv : v ∉ ρ.exceptionalPlaces) : ρ.potential v = 0 := sorry

theorem ext {ρ σ : AdelicMeasure K} (h : ∀ v, ρ.toFun v = σ.toFun v) : ρ = σ := sorry

/-- Base change to a finite extension `L/K`. -/
noncomputable def baseChange (ρ : AdelicMeasure K) (L : Type) [Field L] [NumberField L]
    [Algebra K L] : AdelicMeasure L := sorry

theorem not_atom (ρ : AdelicMeasure K) (v : NumberFieldPlace K) (x : OnePoint (AlgebraicClosure K)) :
    (ρ.toFun v : Measure (Lv[v]).carrier) {(Lv[v]).embed x} = 0 := sorry

open scoped Classical in
/-- The adelic measure equal to `m_{0,R,v}` at one place `v` (`R ≥ 1`) and standard elsewhere. -/
noncomputable def gaussRadius (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R) : AdelicMeasure K where
  toFun w := if w = v then (Lv[w]).circle 0 R else (Lv[w]).standard
  finite_ne_standard := sorry
  hasContinuousPotential := sorry

end AdelicMeasure

/-- Unit test `AdelicMeasure.test_standard_exceptionalPlaces`: `N(λ) = ∅`. -/
example : (AdelicMeasure.standard (K := K)).exceptionalPlaces = ∅ := sorry

/-- Unit test `AdelicMeasure.test_gauss_radius`: the Gauss-radius measure is exceptional exactly at
`v` (for `R > 1`). -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 < R) :
    (AdelicMeasure.gaussRadius v R hR.le).exceptionalPlaces = {v} := sorry

/-- Unit test `AdelicMeasure.test_not_dirac_type_one`: a Dirac mass at a type I point has no
continuous potential. -/
example (v : NumberFieldPlace K) :
    ¬ (Lv[v]).HasContinuousPotential (Measure.dirac ((Lv[v]).embed (0 : AlgebraicClosure K))) := sorry

/-- Unit test `AdelicMeasure.test_not_infinitely_many`: a family equal to `m_{0,2}` at every finite
place of `ℚ` differs from `λ` at infinitely many places. -/
example (ρ : ∀ v : NumberFieldPlace ℚ, ProbabilityMeasure (NumberFieldPlace.analyticLine ℚ v).carrier)
    (hρ : ∀ w : NumberField.FinitePlace ℚ,
      ρ (Sum.inr w) = (NumberFieldPlace.analyticLine ℚ (Sum.inr w)).circle 0 2) :
    ¬ {v | ρ v ≠ (NumberFieldPlace.analyticLine ℚ v).standard}.Finite := sorry

/-! ### Adelic heights (`DY.4/adelic-height-of-a-galois-stable-set`) -/

/-- The Weil height on `P¹(K̄)`: DY.1's absolute Weil height `projLineAbsLogHeight` on
`ℙ K̄ (Fin 2 → K̄)`, through Mathlib's `OnePoint.equivProjectivization` (`absLogHeight₁` on `K̄` and
`0` at `∞`). -/
noncomputable def weilHeightP1 (x : OnePoint (AlgebraicClosure K)) : ℝ :=
  open scoped Classical in
  projLineAbsLogHeight (OnePoint.equivProjectivization (AlgebraicClosure K) x)

namespace AdelicMeasure

variable {K}

/-- **Definition `DY.4/adelic-height-of-a-galois-stable-set`.**
`h_ρ(F) = ½ Σ_v r_v ([F]_v - ρ_v, [F]_v - ρ_v)_v`. -/
noncomputable def height (ρ : AdelicMeasure K) (F : Finset (OnePoint (AlgebraicClosure K))) : ℝ :=
  (1 / 2) * ∑ᶠ v : NumberFieldPlace K,
    (Lv[v]).weight * (Lv[v]).energyDiff ((Lv[v]).orbitMeasure F) (ρ.toFun v)

/-- `h_ρ(x) := h_ρ(Gal·x)`. -/
noncomputable def heightAt (ρ : AdelicMeasure K) (x : OnePoint (AlgebraicClosure K)) : ℝ :=
  ρ.height (galoisOrbitFinset K x)

theorem height_finite (ρ : AdelicMeasure K) {F : Finset (OnePoint (AlgebraicClosure K))}
    (hF : IsGaloisStableFinset K F) :
    (Function.support fun v : NumberFieldPlace K =>
      (Lv[v]).weight * (Lv[v]).energyDiff ((Lv[v]).orbitMeasure F) (ρ.toFun v)).Finite := sorry

theorem heightAt_galois (ρ : AdelicMeasure K) (σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K)
    (x : OnePoint (AlgebraicClosure K)) : ρ.heightAt (OnePoint.map σ x) = ρ.heightAt x := sorry

theorem height_baseChange (ρ : AdelicMeasure K) (L : Type) [Field L] [NumberField L] [Algebra K L]
    (e : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure L) (x : OnePoint (AlgebraicClosure K)) :
    (ρ.baseChange L).heightAt (OnePoint.map e x) = ρ.heightAt x := sorry

theorem height_eq_average (ρ : AdelicMeasure K) {F : Finset (OnePoint (AlgebraicClosure K))}
    (hF : IsGaloisStableFinset K F) (hne : F.Nonempty) :
    ρ.height F = (F.card : ℝ)⁻¹ * ∑ x ∈ F, ρ.heightAt x := sorry

theorem heightAt_infty (ρ : AdelicMeasure K) :
    ρ.heightAt OnePoint.infty = (1 / 2) * ∑ᶠ v : NumberFieldPlace K,
      (Lv[v]).weight * (Lv[v]).energy (ρ.toFun v) (ρ.toFun v) := sorry

theorem heightAt_standard (x : AlgebraicClosure K) :
    (standard (K := K)).heightAt (x : OnePoint (AlgebraicClosure K)) = NumberField.absLogHeight₁ x := sorry

end AdelicMeasure

/-- Unit test `AdelicMeasure.test_height_standard_two`: `h_λ(2) = log 2`. -/
example : (AdelicMeasure.standard (K := ℚ)).heightAt ((2 : AlgebraicClosure ℚ) : OnePoint (AlgebraicClosure ℚ)) =
    Real.log 2 := sorry

/-- Unit test `AdelicMeasure.test_height_standard_infty`: `h_λ(∞) = 0`. -/
example : (AdelicMeasure.standard (K := K)).heightAt OnePoint.infty = 0 := sorry

/-- Unit test `AdelicMeasure.test_height_gauss_radius`: for the Gauss-radius measure,
`h(∞) = -½ r_v log R` and `h(0) = ½ r_v log R`. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R) :
    (AdelicMeasure.gaussRadius v R hR).heightAt OnePoint.infty = -(1 / 2) * (Lv[v]).weight * Real.log R ∧
    (AdelicMeasure.gaussRadius v R hR).heightAt ((0 : AlgebraicClosure K) : OnePoint (AlgebraicClosure K)) =
      (1 / 2) * (Lv[v]).weight * Real.log R := sorry

open scoped Classical in
/-- Unit test `AdelicMeasure.test_height_not_additive`: `h_λ({2, 3}) = (log 2 + log 3)/2`. -/
example : (AdelicMeasure.standard (K := ℚ)).height
    {((2 : AlgebraicClosure ℚ) : OnePoint (AlgebraicClosure ℚ)), ((3 : AlgebraicClosure ℚ) : OnePoint (AlgebraicClosure ℚ))} =
    (Real.log 2 + Real.log 3) / 2 := sorry

/-! ### Theorems on adelic heights -/

/-- `DY.4/product-formula-for-the-energy-of-a-finite-set`. -/
theorem finsum_weight_energy_orbit_eq_zero {F : Finset (OnePoint (AlgebraicClosure K))}
    (hF : IsGaloisStableFinset K F) :
    ∑ᶠ v : NumberFieldPlace K,
      (Lv[v]).weight * (Lv[v]).energy ((Lv[v]).orbitMeasure F) ((Lv[v]).orbitMeasure F) = 0 := sorry

/-- `DY.4/adelic-height-decomposition` (Favre–Rivera-Letelier Lemma 5.3). -/
theorem AdelicMeasure.height_eq_heightAt_infty_sub (ρ : AdelicMeasure K)
    {F : Finset (OnePoint (AlgebraicClosure K))} (hF : IsGaloisStableFinset K F)
    (hinf : OnePoint.infty ∉ F) :
    ρ.height F = ρ.heightAt OnePoint.infty - ∑ᶠ v : NumberFieldPlace K,
      (Lv[v]).weight * (Lv[v]).energy (ρ.toFun v) ((Lv[v]).orbitMeasure F) := sorry

/-- `DY.4/standard-adelic-height-is-the-weil-height`. -/
theorem AdelicMeasure.heightAt_standard_eq_weilHeight (x : OnePoint (AlgebraicClosure K)) :
    (AdelicMeasure.standard (K := K)).heightAt x = weilHeightP1 K x := sorry

/-- `DY.4/adelic-height-is-a-weil-height` (Favre–Rivera-Letelier Proposition 5.2). -/
theorem AdelicMeasure.exists_abs_heightAt_sub_le (ρ : AdelicMeasure K) :
    ∃ C, ∀ x : AlgebraicClosure K,
      |ρ.heightAt (x : OnePoint (AlgebraicClosure K)) - ρ.heightAt OnePoint.infty - NumberField.absLogHeight₁ x| ≤ C :=
  sorry

/-- `DY.4/mahler-formula-for-adelic-heights` (Favre–Rivera-Letelier Proposition 1.3), with
`log|P|_v(S) = Σ_β log δ_v(S, ι β)` over the roots `β` of the minimal polynomial. -/
theorem AdelicMeasure.heightAt_eq_mahler (ρ : AdelicMeasure K) (x : AlgebraicClosure K) :
    ρ.heightAt (x : OnePoint (AlgebraicClosure K)) = ρ.heightAt OnePoint.infty +
      ((minpoly K x).natDegree : ℝ)⁻¹ * ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight *
        ∫ z, ∑ β ∈ galoisOrbitFinset K (x : OnePoint (AlgebraicClosure K)), Real.log ((Lv[v]).kernel z ((Lv[v]).embed β))
          ∂(ρ.toFun v : Measure (Lv[v]).carrier) := sorry

/-- `DY.4/small-galois-stable-sets-grow`. -/
theorem AdelicMeasure.tendsto_card_of_height_le (ρ : AdelicMeasure K)
    (F : ℕ → Finset (OnePoint (AlgebraicClosure K))) (hF : ∀ n, IsGaloisStableFinset K (F n))
    (hrep : ∀ G, {n | F n = G}.Finite) (H : ℝ) (hH : ∀ n, ρ.height (F n) ≤ H) :
    Tendsto (fun n => (F n).card) atTop atTop := sorry

/-- **Theorem `DY.4/equidistribution-of-small-points-on-p1`** (Favre–Rivera-Letelier Theorem 6). -/
theorem AdelicMeasure.tendsto_integral_of_height_small (ρ : AdelicMeasure K)
    (F : ℕ → Finset (OnePoint (AlgebraicClosure K))) (hF : ∀ n, IsGaloisStableFinset K (F n))
    (hrep : ∀ G, {n | F n = G}.Finite)
    (hsmall : ∀ ε > 0, ∀ᶠ n in atTop, ρ.height (F n) ≤ ε) :
    Tendsto (fun n => ρ.height (F n)) atTop (𝓝 0) ∧
      ∀ (v : NumberFieldPlace K) (f : C((Lv[v]).carrier, ℝ)),
        Tendsto (fun n => ∫ z, f z ∂((Lv[v]).orbitMeasure (F n))) atTop
          (𝓝 (∫ z, f z ∂(ρ.toFun v : Measure (Lv[v]).carrier))) := sorry

/-- `DY.4/essential-minimum-of-an-adelic-height` (Favre–Rivera-Letelier Theorem 1). -/
theorem AdelicMeasure.finite_setOf_heightAt_lt (ρ : AdelicMeasure K) {ε : ℝ} (hε : 0 < ε) :
    {x : OnePoint (AlgebraicClosure K) | ρ.heightAt x < -ε}.Finite := sorry

/-- `DY.4/quantitative-equidistribution` (Favre–Rivera-Letelier Theorem 7, corrected). The test
function `φ` enters through its Dirichlet norm `D` (the Cauchy–Schwarz inequality of TB.6) and its
regularisation constant `Λ`. -/
theorem AdelicMeasure.abs_integral_orbit_sub_le (ρ : AdelicMeasure K) {C₀ κ : ℝ} (hκ₀ : 0 < κ)
    (hκ₁ : κ ≤ 1)
    (hHolder : ∀ v, ∀ r ∈ Set.Ioo (0 : ℝ) 1,
      (Lv[v]).regularisationModulus (ρ.potential v) r ≤ C₀ * r ^ κ) :
    ∃ C : ℝ, ∀ (v : NumberFieldPlace K) (φ : C((Lv[v]).carrier, ℝ)) (D Λ : ℝ),
      (∀ μ ν : ProbabilityMeasure (Lv[v]).carrier, (Lv[v]).HasContinuousPotential μ →
        (Lv[v]).HasContinuousPotential ν →
        (∫ z, φ z ∂(μ : Measure _) - ∫ z, φ z ∂(ν : Measure _)) ^ 2 ≤
          D * (Lv[v]).energyDiff μ ν) →
      (∀ (x : AlgebraicClosure K) (r : ℝ), 0 < r →
        |∫ z, φ z ∂((Lv[v]).circle x r : Measure _) - φ ((Lv[v]).embed x)| ≤ Λ * r) →
      ∀ F : Finset (AlgebraicClosure K), IsGaloisStableFinset K (toProjLine K F) → 2 ≤ F.card →
        |∫ z, φ z ∂((Lv[v]).orbitMeasure (toProjLine K F)) -
            ∫ z, φ z ∂(ρ.toFun v : Measure _)| ≤
          Λ * (F.card : ℝ) ^ (-1 / κ) +
            Real.sqrt (D * (Lv[v]).weight⁻¹ *
              (2 * ρ.height (toProjLine K F) + C * Real.log F.card / F.card)) := sorry

/-- `DY.4/bilu-equidistribution-theorem`. -/
theorem tendsto_integral_orbit_of_absLogHeight_tendsto (x : ℕ → AlgebraicClosure K)
    (hx : Function.Injective x) (hsmall : Tendsto (fun n => NumberField.absLogHeight₁ (x n)) atTop (𝓝 0))
    (v : NumberFieldPlace K) (f : C((Lv[v]).carrier, ℝ)) :
    Tendsto (fun n => ∫ z, f z ∂((Lv[v]).orbitMeasure (galoisOrbitFinset K (x n : OnePoint (AlgebraicClosure K))))) atTop
      (𝓝 (∫ z, f z ∂((Lv[v]).standard : Measure (Lv[v]).carrier))) := sorry

/-! ### Adelic metrics on `O(1)` (`DY.4/adelic-metrized-line-bundle-on-p1`) -/

/-- `log⁺|z|_v` extended to the analytic line: the potential of `λ_v`. -/
noncomputable def AnalyticLine.logPlus {K : Type} [Field K] (L : AnalyticLine K) (z : L.carrier) : ℝ :=
  L.potential (L.standard : Measure L.carrier) z

/-- **Definition `DY.4/adelic-metrized-line-bundle-on-p1`.** An adelic metric on `O_{P¹}(1)`:
continuous `φ_v` on the analytic lines, zero at all but finitely many places, describing the
metric `‖·‖_v = ‖·‖_{st,v} e^{-φ_v}`. -/
structure AdelicMetric where
  /-- The function `φ_v`. -/
  φ : ∀ v : NumberFieldPlace K, C((Lv[v]).carrier, ℝ)
  /-- `φ_v = 0` at all but finitely many places. -/
  finite_ne_zero : {v | φ v ≠ 0}.Finite

namespace AdelicMetric

variable {K}

theorem support_finite (φ₀ : AdelicMetric K) : {v | φ₀.φ v ≠ 0}.Finite := φ₀.finite_ne_zero

/-- The standard metric `φ = 0`. -/
noncomputable def standard : AdelicMetric K := ⟨fun _ => 0, by simp⟩

/-- The twist `φ + c` by constants `c_v`, finitely many nonzero. -/
noncomputable def twist (φ₀ : AdelicMetric K) (c : NumberFieldPlace K → ℝ)
    (hc : (Function.support c).Finite) : AdelicMetric K :=
  ⟨fun v => φ₀.φ v + ContinuousMap.const _ (c v), sorry⟩

/-- The average metric `(‖·‖₁‖·‖₂)^{1/2}`, i.e. `(φ₁ + φ₂)/2`. -/
noncomputable def average (φ₁ φ₂ : AdelicMetric K) : AdelicMetric K :=
  ⟨fun v => (1 / 2 : ℝ) • (φ₁.φ v + φ₂.φ v), sorry⟩

theorem ext {φ₁ φ₂ : AdelicMetric K} (h : ∀ v, φ₁.φ v = φ₂.φ v) : φ₁ = φ₂ := sorry

/-- `-log ‖x₁‖_v = log⁺|z|_v + φ_v` (the section `x₁` has divisor `∞`). -/
noncomputable def negLogNormX1 (φ₀ : AdelicMetric K) (v : NumberFieldPlace K) (z : (Lv[v]).carrier) :
    ℝ :=
  (Lv[v]).logPlus z + φ₀.φ v z

/-- The norm `z ↦ ‖x₁(z)‖_v` of the continuous metric of TB.6 described by `φ`. -/
noncomputable def toContinuousMetric (φ₀ : AdelicMetric K) (v : NumberFieldPlace K)
    (z : (Lv[v]).carrier) : ℝ :=
  Real.exp (-φ₀.negLogNormX1 v z)

/-! Curvature (`DY.4/curvature-measures-of-an-adelic-metric`). -/

/-- `φ` is semipositive: at every place its curvature `λ_v + Δφ_v` is a probability measure,
i.e. a probability measure whose potential relative to `λ_v` is `φ_v - φ_v(∞)`. -/
def IsSemipositive (φ₀ : AdelicMetric K) : Prop :=
  ∀ v, ∃ μ : ProbabilityMeasure (Lv[v]).carrier, ∀ z, z ≠ (Lv[v]).infty →
    φ₀.φ v z - φ₀.φ v (Lv[v]).infty =
      (Lv[v]).potential μ z - (Lv[v]).potential ((Lv[v]).standard : Measure _) z

/-- The curvature adelic measure of a semipositive metric. -/
noncomputable def curvature (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) : AdelicMeasure K := sorry

theorem potential_curvature (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) (v : NumberFieldPlace K)
    (z : (Lv[v]).carrier) : (φ₀.curvature h).potential v z = φ₀.φ v z - φ₀.φ v (Lv[v]).infty := sorry

theorem curvature_standard (h : (standard (K := K)).IsSemipositive) :
    (standard (K := K)).curvature h = AdelicMeasure.standard := sorry

theorem curvature_twist (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) (c : NumberFieldPlace K → ℝ)
    (hc : (Function.support c).Finite) (h' : (φ₀.twist c hc).IsSemipositive) :
    (φ₀.twist c hc).curvature h' = φ₀.curvature h := sorry

theorem curvature_mass (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) (v : NumberFieldPlace K) :
    ((φ₀.curvature h).toFun v : Measure (Lv[v]).carrier) Set.univ = 1 := sorry

/-- The curvature is the Chambert-Loir measure `c₁(Ō_v)` of TB.6: the unique probability measure
whose potential relative to `λ_v` is `φ_v - φ_v(∞)`. -/
theorem curvature_eq_chambertLoir (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) (v : NumberFieldPlace K)
    (μ : ProbabilityMeasure (Lv[v]).carrier)
    (hμ : ∀ z, z ≠ (Lv[v]).infty → φ₀.φ v z - φ₀.φ v (Lv[v]).infty =
      (Lv[v]).potential μ z - (Lv[v]).potential ((Lv[v]).standard : Measure _) z) :
    (φ₀.curvature h).toFun v = μ := sorry

/-! Heights (`DY.4/height-of-an-adelic-metrized-line-bundle`). -/

/-- `h_φ(x) = h(x) + Σ_v r_v |O|⁻¹ Σ_{y∈O} φ_v(y)`. -/
noncomputable def height (φ₀ : AdelicMetric K) (x : OnePoint (AlgebraicClosure K)) : ℝ :=
  weilHeightP1 K x + ∑ᶠ v : NumberFieldPlace K,
    (Lv[v]).weight * ∫ z, φ₀.φ v z ∂((Lv[v]).orbitMeasure (galoisOrbitFinset K x))

/-- The height through the section `x₀ - b x₁` (divisor `b ∈ K`), for `x` not conjugate to `b`. -/
theorem height_eq_of_section (φ₀ : AdelicMetric K) (b : K) (x : AlgebraicClosure K)
    (hx : ∀ y ∈ galoisOrbitFinset K (x : OnePoint (AlgebraicClosure K)),
      y ≠ ((algebraMap K (AlgebraicClosure K) b : AlgebraicClosure K) : OnePoint (AlgebraicClosure K))) :
    φ₀.height (x : OnePoint (AlgebraicClosure K)) = ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight *
      ∫ z, (-Real.log ((Lv[v]).kernel z ((Lv[v]).embed (algebraMap K (AlgebraicClosure K) b))) +
        φ₀.negLogNormX1 v z) ∂((Lv[v]).orbitMeasure (galoisOrbitFinset K (x : OnePoint (AlgebraicClosure K)))) :=
  sorry

theorem height_standard (x : OnePoint (AlgebraicClosure K)) :
    (standard (K := K)).height x = weilHeightP1 K x := sorry

theorem height_twist (φ₀ : AdelicMetric K) (c : NumberFieldPlace K → ℝ)
    (hc : (Function.support c).Finite) (x : OnePoint (AlgebraicClosure K)) :
    (φ₀.twist c hc).height x = φ₀.height x + ∑ᶠ v, (Lv[v]).weight * c v := sorry

theorem height_average (φ₁ φ₂ : AdelicMetric K) (x : OnePoint (AlgebraicClosure K)) :
    (φ₁.average φ₂).height x = (φ₁.height x + φ₂.height x) / 2 := sorry

theorem height_sub_weil_bounded (φ₀ : AdelicMetric K) :
    ∃ C, ∀ x : OnePoint (AlgebraicClosure K), |φ₀.height x - weilHeightP1 K x| ≤ C := sorry

theorem height_galois (φ₀ : AdelicMetric K) (σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K)
    (x : OnePoint (AlgebraicClosure K)) : φ₀.height (OnePoint.map σ x) = φ₀.height x := sorry

end AdelicMetric

/-- The metric `log max(|z|_v, R) - log⁺|z|_v` at one place `v` (`R ≥ 1`), standard elsewhere. -/
noncomputable def AdelicMetric.gaussRadius (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R) :
    AdelicMetric K := sorry

/-- Unit test `AdelicMetric.test_standard_negLogNorm`: `-log ‖x₁‖_v(z) = log⁺|z|_v` for the
standard metric. -/
example (v : NumberFieldPlace K) (z : AlgebraicClosure K) :
    (AdelicMetric.standard (K := K)).negLogNormX1 v ((Lv[v]).embed z) = Real.posLog ((Lv[v]).absv z) :=
  sorry

/-- Unit test `AdelicMetric.test_gauss_radius_metric`: `φ_v(∞) = 0` and `φ_v(0) = log R`. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R) :
    (AdelicMetric.gaussRadius K v R hR).φ v (Lv[v]).infty = 0 ∧
    (AdelicMetric.gaussRadius K v R hR).φ v ((Lv[v]).embed (0 : AlgebraicClosure K)) = Real.log R :=
  sorry

/-- Unit test `AdelicMetric.test_average_standard`: the standard metric averaged with itself. -/
example : (AdelicMetric.standard (K := K)).average AdelicMetric.standard = AdelicMetric.standard :=
  sorry

/-- Unit test `AdelicMetric.test_not_adelic_all_primes`: `φ_p = 1` at every prime is not adelic. -/
example (φ : ∀ v : NumberFieldPlace ℚ, C((NumberFieldPlace.analyticLine ℚ v).carrier, ℝ))
    (hφ : ∀ w : NumberField.FinitePlace ℚ, φ (Sum.inr w) = ContinuousMap.const _ 1) :
    ¬ {v | φ v ≠ 0}.Finite := sorry

/-- Unit test `AdelicMetric.test_curvature_standard`: the curvature of the standard metric is `λ`. -/
example (h : (AdelicMetric.standard (K := K)).IsSemipositive) :
    (AdelicMetric.standard (K := K)).curvature h = AdelicMeasure.standard := sorry

/-- Unit test `AdelicMetric.test_curvature_gauss_radius`: the curvature of the Gauss-radius metric at
`v` is `m_{0,R,v}`. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R)
    (h : (AdelicMetric.gaussRadius K v R hR).IsSemipositive) :
    ((AdelicMetric.gaussRadius K v R hR).curvature h).toFun v = (Lv[v]).circle 0 R := sorry

/-- Unit test `AdelicMetric.test_curvature_twist`: constants do not change the curvature. -/
example (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) (c : NumberFieldPlace K → ℝ)
    (hc : (Function.support c).Finite) (h' : (φ₀.twist c hc).IsSemipositive) :
    (φ₀.twist c hc).curvature h' = φ₀.curvature h := sorry

/-- Unit test `AdelicMetric.test_not_semipositive`: minus the Gauss-radius metric (`R > 1`) is not
semipositive. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 < R) :
    ¬ (⟨fun w => -(AdelicMetric.gaussRadius K v R hR.le).φ w, sorry⟩ : AdelicMetric K).IsSemipositive :=
  sorry

/-- Unit test `AdelicMetric.test_height_standard_two`: `h(2) = log 2` for the standard metric. -/
example : (AdelicMetric.standard (K := ℚ)).height ((2 : AlgebraicClosure ℚ) : OnePoint (AlgebraicClosure ℚ)) =
    Real.log 2 := sorry

/-- Unit test `AdelicMetric.test_height_infty`: `h_φ(∞) = Σ_v r_v φ_v(∞)`. -/
example (φ₀ : AdelicMetric K) :
    φ₀.height OnePoint.infty = ∑ᶠ v, (Lv[v]).weight * φ₀.φ v (Lv[v]).infty := sorry

open scoped Classical in
/-- Unit test `AdelicMetric.test_height_twist`: a constant `c` at `v` shifts the height by `r_v c`. -/
example (φ₀ : AdelicMetric K) (v : NumberFieldPlace K) (c : ℝ) (x : OnePoint (AlgebraicClosure K)) :
    (φ₀.twist (Function.update 0 v c) sorry).height x = φ₀.height x + (Lv[v]).weight * c := sorry

/-- Unit test `AdelicMetric.test_height_gauss_radius_zero`: the Gauss-radius metric gives
`h(0) = r_v log R`, not the Weil height `0`. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R) :
    (AdelicMetric.gaussRadius K v R hR).height ((0 : AlgebraicClosure K) : OnePoint (AlgebraicClosure K))
      = (Lv[v]).weight * Real.log R := sorry

/-! ### The normalised metric of an adelic measure (`DY.4/adelic-metric-of-an-adelic-measure`) -/

namespace AdelicMeasure

variable {K}

/-- `φ^ρ_v = g_{ρ,v} + ½(ρ_v, ρ_v)_v`. -/
noncomputable def metric (ρ : AdelicMeasure K) : AdelicMetric K :=
  ⟨fun v => ρ.potential v + ContinuousMap.const _
    ((1 / 2) * (Lv[v]).energy (ρ.toFun v) (ρ.toFun v)), sorry⟩

theorem metric_isSemipositive (ρ : AdelicMeasure K) : ρ.metric.IsSemipositive := sorry

theorem curvature_metric (ρ : AdelicMeasure K) : ρ.metric.curvature ρ.metric_isSemipositive = ρ :=
  sorry

theorem metric_infty (ρ : AdelicMeasure K) (v : NumberFieldPlace K) :
    ρ.metric.φ v (Lv[v]).infty = (1 / 2) * (Lv[v]).energy (ρ.toFun v) (ρ.toFun v) := sorry

theorem metric_standard : (standard (K := K)).metric = AdelicMetric.standard := sorry

end AdelicMeasure

theorem AdelicMetric.eq_metric_curvature_add_const (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) :
    ∃ hc, φ₀ = (φ₀.curvature h).metric.twist
      (fun v => φ₀.φ v (Lv[v]).infty -
        (1 / 2) * (Lv[v]).energy ((φ₀.curvature h).toFun v) ((φ₀.curvature h).toFun v)) hc := sorry

/-- Unit test `AdelicMeasure.test_metric_standard`: `φ^λ = 0`. -/
example : (AdelicMeasure.standard (K := K)).metric = AdelicMetric.standard := sorry

/-- Unit test `AdelicMeasure.test_metric_gauss_radius`: `φ^ρ_v(∞) = -½ log R`. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R) :
    (AdelicMeasure.gaussRadius v R hR).metric.φ v (Lv[v]).infty = -(1 / 2) * Real.log R := sorry

/-- Unit test `AdelicMeasure.test_curvature_metric`: the curvature of `φ^ρ` is `ρ`. -/
example (ρ : AdelicMeasure K) : ρ.metric.curvature ρ.metric_isSemipositive = ρ := sorry

/-- Unit test `AdelicMeasure.test_metric_not_potential`: dropping the constant `½(ρ_v, ρ_v)` changes
the height of the Gauss-radius measure at `0` by `½ r_v log R`. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R) :
    (⟨fun w => (AdelicMeasure.gaussRadius v R hR).potential w, sorry⟩ : AdelicMetric K).height
        ((0 : AlgebraicClosure K) : OnePoint (AlgebraicClosure K)) =
      (AdelicMeasure.gaussRadius v R hR).metric.height
        ((0 : AlgebraicClosure K) : OnePoint (AlgebraicClosure K)) + (1 / 2) * (Lv[v]).weight * Real.log R :=
  sorry

/-- `DY.4/height-of-the-metric-of-an-adelic-measure`: `h_{φ^ρ} = h_ρ`. -/
theorem AdelicMeasure.metric_height (ρ : AdelicMeasure K) (x : OnePoint (AlgebraicClosure K)) :
    ρ.metric.height x = ρ.heightAt x := sorry

/-! ### The Arakelov–Zhang pairing (`DY.4/arakelov-zhang-pairing`) -/

namespace AdelicMetric

variable {K}

/-- **Definition `DY.4/arakelov-zhang-pairing`.**
`Ō₁·Ō₂ = Σ_v r_v [φ_{2,v}(∞) + ∫ (log⁺|z|_v + φ_{1,v}) dµ_{2,v}]`. -/
noncomputable def pairing (φ₁ φ₂ : AdelicMetric K) (h₂ : φ₂.IsSemipositive) : ℝ :=
  ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight * (φ₂.φ v (Lv[v]).infty +
    ∫ z, ((Lv[v]).logPlus z + φ₁.φ v z) ∂((φ₂.curvature h₂).toFun v : Measure (Lv[v]).carrier))

theorem pairing_comm (φ₁ φ₂ : AdelicMetric K) (h₁ : φ₁.IsSemipositive) (h₂ : φ₂.IsSemipositive) :
    φ₁.pairing φ₂ h₂ = φ₂.pairing φ₁ h₁ := sorry

theorem pairing_eq_energy (φ₁ φ₂ : AdelicMetric K) (h₁ : φ₁.IsSemipositive)
    (h₂ : φ₂.IsSemipositive) :
    φ₁.pairing φ₂ h₂ = ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight *
      (φ₁.φ v (Lv[v]).infty + φ₂.φ v (Lv[v]).infty -
        (Lv[v]).energy ((φ₁.curvature h₁).toFun v) ((φ₂.curvature h₂).toFun v)) := sorry

theorem pairing_twist (φ₁ φ₂ : AdelicMetric K) (h₂ : φ₂.IsSemipositive) (c : NumberFieldPlace K → ℝ)
    (hc : (Function.support c).Finite) :
    (φ₁.twist c hc).pairing φ₂ h₂ = φ₁.pairing φ₂ h₂ + ∑ᶠ v, (Lv[v]).weight * c v := sorry

theorem pairing_average (φ₁ φ₂ : AdelicMetric K) (h₁ : φ₁.IsSemipositive) (h₂ : φ₂.IsSemipositive)
    (h : (φ₁.average φ₂).IsSemipositive) :
    (φ₁.average φ₂).pairing (φ₁.average φ₂) h =
      (1 / 4) * φ₁.pairing φ₁ h₁ + (1 / 2) * φ₁.pairing φ₂ h₂ + (1 / 4) * φ₂.pairing φ₂ h₂ := sorry

theorem pairing_standard (h : (standard (K := K)).IsSemipositive) :
    (standard (K := K)).pairing standard h = 0 := sorry

/-- `DY.4/arakelov-zhang-pairing-independent-of-sections`, for the sections `x₀ - b x₁` and
`x₀ - b' x₁` (divisors `b ≠ b'` in `K`). -/
theorem pairing_eq_sections (φ₁ φ₂ : AdelicMetric K) (h₂ : φ₂.IsSemipositive) {b b' : K}
    (hbb' : b ≠ b') :
    φ₁.pairing φ₂ h₂ =
      φ₁.height ((algebraMap K (AlgebraicClosure K) b' : AlgebraicClosure K) : OnePoint (AlgebraicClosure K)) +
      φ₂.height ((algebraMap K (AlgebraicClosure K) b : AlgebraicClosure K) : OnePoint (AlgebraicClosure K)) +
      ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight *
        (∫ z, (-Real.log ((Lv[v]).kernel z ((Lv[v]).embed (algebraMap K (AlgebraicClosure K) b))) +
            φ₁.negLogNormX1 v z) ∂((φ₂.curvature h₂).toFun v : Measure (Lv[v]).carrier) +
          (Real.log ((Lv[v]).absv (algebraMap K (AlgebraicClosure K) (b' - b))) -
            φ₁.negLogNormX1 v ((Lv[v]).embed (algebraMap K (AlgebraicClosure K) b')))) := sorry

/-- `DY.4/height-of-a-semipositive-metric-versus-its-curvature`: `h_φ = h_µ + ½ Ō·Ō`. -/
theorem height_eq_curvature_height_add (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive)
    (x : OnePoint (AlgebraicClosure K)) :
    φ₀.height x = (φ₀.curvature h).heightAt x + (1 / 2) * φ₀.pairing φ₀ h := sorry

end AdelicMetric

/-- Unit test `AdelicMetric.test_pairing_standard`: `standard · standard = 0`. -/
example (h : (AdelicMetric.standard (K := K)).IsSemipositive) :
    (AdelicMetric.standard (K := K)).pairing AdelicMetric.standard h = 0 := sorry

/-- Unit test `AdelicMetric.test_pairing_gauss_radius`: the Gauss-radius metric has self-pairing
`r_v log R`. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R)
    (h : (AdelicMetric.gaussRadius K v R hR).IsSemipositive) :
    (AdelicMetric.gaussRadius K v R hR).pairing (AdelicMetric.gaussRadius K v R hR) h =
      (Lv[v]).weight * Real.log R := sorry

/-- Unit test `AdelicMetric.test_pairing_twist_self`: `(φ + c)·(φ + c) = φ·φ + 2 Σ_v r_v c_v`. -/
example (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) (c : NumberFieldPlace K → ℝ)
    (hc : (Function.support c).Finite) (h' : (φ₀.twist c hc).IsSemipositive) :
    (φ₀.twist c hc).pairing (φ₀.twist c hc) h' = φ₀.pairing φ₀ h + 2 * ∑ᶠ v, (Lv[v]).weight * c v :=
  sorry

open scoped Classical in
/-- Unit test `AdelicMetric.test_pairing_not_curvature_only`: twisting the standard metric by `1`
at `v` gives self-pairing `2 r_v` with the same curvature `λ`. -/
example (v : NumberFieldPlace K)
    (h : ((AdelicMetric.standard (K := K)).twist (Function.update 0 v 1) sorry).IsSemipositive) :
    ((AdelicMetric.standard (K := K)).twist (Function.update 0 v 1) sorry).pairing
      ((AdelicMetric.standard (K := K)).twist (Function.update 0 v 1) sorry) h = 2 * (Lv[v]).weight :=
  sorry

/-! ### The pairing of adelic measures (`DY.4/arakelov-zhang-pairing-of-adelic-measures`) -/

namespace AdelicMeasure

variable {K}

/-- The local term `⟨ρ, σ⟩_v = ½(ρ_v - σ_v, ρ_v - σ_v)_v`. -/
noncomputable def localPairing (ρ σ : AdelicMeasure K) (v : NumberFieldPlace K) : ℝ :=
  (1 / 2) * (Lv[v]).energyDiff (ρ.toFun v) (σ.toFun v)

/-- **Definition `DY.4/arakelov-zhang-pairing-of-adelic-measures`.**
`⟨ρ, σ⟩ = ½ Σ_v r_v (ρ_v - σ_v, ρ_v - σ_v)_v`. -/
noncomputable def pairing (ρ σ : AdelicMeasure K) : ℝ :=
  ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight * ρ.localPairing σ v

theorem pairing_comm (ρ σ : AdelicMeasure K) : ρ.pairing σ = σ.pairing ρ := sorry

theorem pairing_self (ρ : AdelicMeasure K) : ρ.pairing ρ = 0 := sorry

theorem pairing_eq_heights (ρ σ : AdelicMeasure K) :
    ρ.pairing σ = ρ.heightAt OnePoint.infty + σ.heightAt OnePoint.infty -
      ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight * (Lv[v]).energy (ρ.toFun v) (σ.toFun v) := sorry

/-- `DY.4/pairing-with-the-standard-measure` (Fili Corollary 8). -/
theorem pairing_standard (ρ : AdelicMeasure K) :
    ρ.pairing standard = ρ.heightAt OnePoint.infty + ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight *
      ∫ z, (Lv[v]).logPlus z ∂(ρ.toFun v : Measure (Lv[v]).carrier) := sorry

/-- `DY.4/arakelov-zhang-pairing-of-normalised-metrics`, measure form. -/
theorem pairing_eq_metric_pairing (ρ σ : AdelicMeasure K) :
    ρ.pairing σ = ρ.metric.pairing σ.metric σ.metric_isSemipositive := sorry

end AdelicMeasure

/-- Unit test `AdelicMeasure.test_pairing_standard_self`: `⟨λ, λ⟩ = 0`. -/
example : (AdelicMeasure.standard (K := K)).pairing AdelicMeasure.standard = 0 := sorry

/-- Unit test `AdelicMeasure.test_pairing_gauss_radius`: `⟨ρ, λ⟩ = ½ r_v log R`. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 ≤ R) :
    (AdelicMeasure.gaussRadius v R hR).pairing AdelicMeasure.standard =
      (1 / 2) * (Lv[v]).weight * Real.log R := sorry

/-- Unit test `AdelicMeasure.test_pairing_symm`: `⟨ρ, σ⟩ = ⟨σ, ρ⟩`. -/
example (ρ σ : AdelicMeasure K) : ρ.pairing σ = σ.pairing ρ := sorry

/-- Unit test `AdelicMeasure.test_pairing_not_bilinear`: `⟨ρ, ρ⟩ = 0` while `⟨ρ, λ⟩ > 0` for the
Gauss-radius measure (`R > 1`), so `⟨·,·⟩` is not bilinear. -/
example (v : NumberFieldPlace K) (R : ℝ) (hR : 1 < R) (hv : 0 < (Lv[v]).weight) :
    (AdelicMeasure.gaussRadius v R hR.le).pairing (AdelicMeasure.gaussRadius v R hR.le) = 0 ∧
      0 < (AdelicMeasure.gaussRadius v R hR.le).pairing AdelicMeasure.standard := sorry

/-! ### Theorems on the pairing (Fili, DeMarco–Krieger–Ye, Petsche–Szpiro–Tucker) -/

/-- `DY.4/arakelov-zhang-pairing-energy-formula` is `AdelicMetric.pairing_eq_energy`;
`DY.4/arakelov-zhang-pairing-of-normalised-metrics`: -/
theorem AdelicMetric.pairing_eq_curvature_pairing (φ₁ φ₂ : AdelicMetric K) (h₁ : φ₁.IsSemipositive)
    (h₂ : φ₂.IsSemipositive) (hn₁ : φ₁.pairing φ₁ h₁ = 0) (hn₂ : φ₂.pairing φ₂ h₂ = 0) :
    φ₁.pairing φ₂ h₂ = (φ₁.curvature h₁).pairing (φ₂.curvature h₂) := sorry

/-- `DY.4/arakelov-zhang-pairing-nonnegative-and-nondegenerate`. -/
theorem AdelicMeasure.pairing_nonneg_and_eq_zero_iff (ρ σ : AdelicMeasure K) :
    0 ≤ ρ.pairing σ ∧ (ρ.pairing σ = 0 ↔ ρ = σ) := sorry

/-- `DY.4/mutual-energy-metric` (Fili Theorem 1): the triangle inequality. -/
theorem AdelicMeasure.sqrt_pairing_triangle (ρ σ τ : AdelicMeasure K) :
    Real.sqrt (ρ.pairing τ) ≤ Real.sqrt (ρ.pairing σ) + Real.sqrt (σ.pairing τ) := sorry

/-- `DY.4/limit-of-heights-along-small-sequences` (Fili Theorem 9; DeMarco–Krieger–Ye (1.3)). -/
theorem AdelicMeasure.tendsto_height_pairing (ρ σ : AdelicMeasure K)
    (F : ℕ → Finset (OnePoint (AlgebraicClosure K))) (hF : ∀ n, IsGaloisStableFinset K (F n))
    (hrep : ∀ G, {n | F n = G}.Finite) (hsmall : Tendsto (fun n => ρ.height (F n)) atTop (𝓝 0)) :
    Tendsto (fun n => σ.height (F n)) atTop (𝓝 (ρ.pairing σ)) := sorry

/-- `DY.4/adelic-measures-with-common-small-points` (Fili Theorem 2), the equivalence of (1), (2),
(3) and (5). -/
theorem AdelicMeasure.eq_iff_infinite_common_zeros (ρ σ : AdelicMeasure K)
    (h : ({x | ρ.heightAt x ≤ 0} ∪ {x | σ.heightAt x ≤ 0} : Set (OnePoint (AlgebraicClosure K))).Infinite) :
    (ρ.pairing σ = 0 ↔ ρ = σ) ∧ (ρ = σ ↔ ρ.heightAt = σ.heightAt) ∧
      (ρ = σ ↔ ({x | ρ.heightAt x ≤ 0} ∩ {x | σ.heightAt x ≤ 0} :
        Set (OnePoint (AlgebraicClosure K))).Infinite) := sorry

/-- `DY.4/zhang-inequality-on-p1`. -/
theorem AdelicMetric.finite_setOf_height_le (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive) {b : ℝ}
    (hb : b < (1 / 2) * φ₀.pairing φ₀ h) :
    {x : OnePoint (AlgebraicClosure K) | φ₀.height x ≤ b}.Finite := sorry

/-- `DY.4/equidistribution-for-semipositive-adelic-metrics-on-p1`. -/
theorem AdelicMetric.tendsto_integral_of_small (φ₀ : AdelicMetric K) (h : φ₀.IsSemipositive)
    (x : ℕ → OnePoint (AlgebraicClosure K)) (hx : ∀ y, {n | x n = y}.Finite)
    (hsmall : Tendsto (fun n => φ₀.height (x n)) atTop (𝓝 ((1 / 2) * φ₀.pairing φ₀ h)))
    (v : NumberFieldPlace K) (f : C((Lv[v]).carrier, ℝ)) :
    Tendsto (fun n => ∫ z, f z ∂((Lv[v]).orbitMeasure (galoisOrbitFinset K (x n)))) atTop
      (𝓝 (∫ z, f z ∂((φ₀.curvature h).toFun v : Measure (Lv[v]).carrier))) := sorry

/-! ### Regularised finite sets (`DY.4/regularised-adelic-measure-of-a-finite-set`) -/

namespace AdelicMeasure

variable {K}

/-- `m_{F,η} = ([F]_{v,η_v})_v` as an adelic measure. -/
noncomputable def ofFiniteSet (F : Finset (AlgebraicClosure K)) (hF : F.Nonempty)
    (hG : IsGaloisStableFinset K (toProjLine K F)) (η : NumberFieldPlace K → ℝ) (hη : ∀ v, 0 < η v)
    (hη₁ : {v | η v ≠ 1}.Finite) : AdelicMeasure K := sorry

theorem ofFiniteSet_apply_eq_standard (F : Finset (AlgebraicClosure K)) (hF : F.Nonempty)
    (hG : IsGaloisStableFinset K (toProjLine K F)) (η : NumberFieldPlace K → ℝ) (hη : ∀ v, 0 < η v)
    (hη₁ : {v | η v ≠ 1}.Finite) (v : NumberField.FinitePlace K) (hv : η (Sum.inr v) = 1)
    (hint : ∀ x ∈ F, (Lv[Sum.inr v]).absv x ≤ 1) :
    (ofFiniteSet F hF hG η hη hη₁).toFun (Sum.inr v) = (Lv[Sum.inr v]).standard := sorry

theorem ofFiniteSet_localHeight (F : Finset (AlgebraicClosure K)) (hF : F.Nonempty)
    (hG : IsGaloisStableFinset K (toProjLine K F)) (η : NumberFieldPlace K → ℝ) (hη : ∀ v, 0 < η v)
    (hη₁ : {v | η v ≠ 1}.Finite) (v : NumberFieldPlace K) (z : AlgebraicClosure K) :
    (ofFiniteSet F hF hG η hη hη₁).metric.negLogNormX1 v ((Lv[v]).embed z) =
      (1 / 2) * (Lv[v]).energy ((ofFiniteSet F hF hG η hη hη₁).toFun v)
          ((ofFiniteSet F hF hG η hη hη₁).toFun v) +
        (F.card : ℝ)⁻¹ * ∑ x ∈ F, Real.log (max ((Lv[v]).absv (z - x)) (η v)) := sorry

theorem ofFiniteSet_energy_le (F : Finset (AlgebraicClosure K)) (hF : F.Nonempty)
    (hG : IsGaloisStableFinset K (toProjLine K F)) (η : NumberFieldPlace K → ℝ) (hη : ∀ v, 0 < η v)
    (hη₁ : {v | η v ≠ 1}.Finite) (v : NumberFieldPlace K) :
    (Lv[v]).energy ((ofFiniteSet F hF hG η hη hη₁).toFun v) ((ofFiniteSet F hF hG η hη hη₁).toFun v) ≤
      (Lv[v]).energy ((Lv[v]).orbitMeasure (toProjLine K F)) ((Lv[v]).orbitMeasure (toProjLine K F)) +
        (-Real.log (η v)) / F.card := sorry

theorem ofFiniteSet_selfPairing (F : Finset (AlgebraicClosure K)) (hF : F.Nonempty)
    (hG : IsGaloisStableFinset K (toProjLine K F)) (η : NumberFieldPlace K → ℝ) (hη : ∀ v, 0 < η v)
    (hη₁ : {v | η v ≠ 1}.Finite) :
    (ofFiniteSet F hF hG η hη hη₁).metric.pairing (ofFiniteSet F hF hG η hη hη₁).metric
      (ofFiniteSet F hF hG η hη hη₁).metric_isSemipositive = 0 := sorry

end AdelicMeasure

/-- Unit test `AdelicMeasure.test_ofFiniteSet_zero`: `m_{{0},1} = λ`. -/
example (hG : IsGaloisStableFinset K (toProjLine K {0})) :
    AdelicMeasure.ofFiniteSet {0} (Finset.singleton_nonempty 0) hG (fun _ => 1) (fun _ => one_pos)
      (by simp) = AdelicMeasure.standard := sorry

open scoped Classical in
/-- Unit test `AdelicMeasure.test_ofFiniteSet_energy_two_points`: for `F = {0, 1}` over `ℚ` and
`η_∞ = 1/4`, the self-energy at the infinite place is `(log 4)/2`. -/
example (w : NumberField.InfinitePlace ℚ) (η : NumberFieldPlace ℚ → ℝ) (hη : ∀ v, 0 < η v)
    (hη₁ : {v | η v ≠ 1}.Finite) (hw : η (Sum.inl w) = 1 / 4)
    (hG : IsGaloisStableFinset ℚ (toProjLine ℚ {0, 1})) :
    (NumberFieldPlace.analyticLine ℚ (Sum.inl w)).energy
      ((AdelicMeasure.ofFiniteSet {0, 1} (Finset.insert_nonempty _ _) hG η hη hη₁).toFun (Sum.inl w))
      ((AdelicMeasure.ofFiniteSet {0, 1} (Finset.insert_nonempty _ _) hG η hη hη₁).toFun (Sum.inl w)) =
      Real.log 4 / 2 := sorry

/-- Unit test `AdelicMeasure.test_ofFiniteSet_not_adelic`: radii `1/2` at every prime do not give an
adelic measure. -/
example (η : NumberFieldPlace ℚ → ℝ) (hη : ∀ w : NumberField.FinitePlace ℚ, η (Sum.inr w) = 1 / 2) :
    ¬ {v | η v ≠ 1}.Finite := sorry

/-- Unit test `AdelicMeasure.test_ofFiniteSet_potential`: the potential of `m_{F,η,v}` at `z`. -/
example (F : Finset (AlgebraicClosure K)) (hF : F.Nonempty) (hG : IsGaloisStableFinset K (toProjLine K F))
    (η : NumberFieldPlace K → ℝ) (hη : ∀ v, 0 < η v) (hη₁ : {v | η v ≠ 1}.Finite)
    (v : NumberFieldPlace K) (z : AlgebraicClosure K) :
    (Lv[v]).potential ((AdelicMeasure.ofFiniteSet F hF hG η hη hη₁).toFun v) ((Lv[v]).embed z) =
      (F.card : ℝ)⁻¹ * ∑ x ∈ F, Real.log (max ((Lv[v]).absv (z - x)) (η v)) := sorry

/-- `DY.4/pairing-with-a-regularised-finite-set` (DeMarco–Krieger–Ye Proposition 7.3, general form). -/
theorem AdelicMeasure.pairing_ofFiniteSet_le (ρ : AdelicMeasure K) (F : Finset (AlgebraicClosure K))
    (hF : F.Nonempty) (hG : IsGaloisStableFinset K (toProjLine K F)) (η : NumberFieldPlace K → ℝ)
    (hη : ∀ v, 0 < η v) (hη₁ : {v | η v ≠ 1}.Finite) :
    ρ.pairing (AdelicMeasure.ofFiniteSet F hF hG η hη hη₁) ≤
      ρ.height (toProjLine K F) + ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight *
        (-(Lv[v]).energy (ρ.toFun v) ((AdelicMeasure.ofFiniteSet F hF hG η hη hη₁).toFun v) +
          (Lv[v]).energy (ρ.toFun v) ((Lv[v]).orbitMeasure (toProjLine K F)) +
          (-Real.log (η v)) / (2 * F.card)) := sorry

/-! ### Generic sequences (`DY.4/generic-sequence`) and the general theorem -/

/-- **Definition `DY.4/generic-sequence`.** No proper closed subset contains infinitely many terms. -/
def IsGenericSequence {X : Type*} [TopologicalSpace X] (x : ℕ → X) : Prop :=
  ∀ Z : Set X, IsClosed Z → Z ≠ Set.univ → {n | x n ∈ Z}.Finite

theorem isGenericSequence_iff_finite_fibres (X : AlgebraicGeometry.Scheme) [AlgebraicGeometry.IsIntegral X]
    (hX : topologicalKrullDim X = 1) (x : ℕ → X) (hx : ∀ n, IsClosed ({x n} : Set X)) :
    IsGenericSequence x ↔ ∀ y, {n | x n = y}.Finite := sorry

theorem IsGenericSequence.comp_strictMono {X : Type*} [TopologicalSpace X] {x : ℕ → X} (hx : IsGenericSequence x)
    {φ : ℕ → ℕ} (hφ : StrictMono φ) : IsGenericSequence (x ∘ φ) := sorry

theorem IsGenericSequence.map_dominant {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] {x : ℕ → X}
    (hx : IsGenericSequence x) {f : X → Y} (hf : Continuous f) (hdense : DenseRange f) :
    IsGenericSequence (f ∘ x) := sorry

theorem not_isGenericSequence_of_forall_mem {X : Type*} [TopologicalSpace X] (x : ℕ → X) {Z : Set X}
    (hZ : IsClosed Z) (hne : Z ≠ Set.univ) (hx : ∀ n, x n ∈ Z) : ¬ IsGenericSequence x := sorry

/-- Unit test `test_not_isGenericSequence_const`: a constant sequence at a closed point of a space with more
than one point is not generic. -/
example {X : Type*} [TopologicalSpace X] (y : X) (hy : IsClosed ({y} : Set X))
    (hne : ({y} : Set X) ≠ Set.univ) : ¬ IsGenericSequence (fun _ : ℕ => y) := sorry

/-- Unit test `test_isGenericSequence_injective_curve`: an injective sequence of closed points of an integral
curve is generic. -/
example (X : AlgebraicGeometry.Scheme) [AlgebraicGeometry.IsIntegral X]
    (hX : topologicalKrullDim X = 1) (x : ℕ → X) (hx : ∀ n, IsClosed ({x n} : Set X))
    (hinj : Function.Injective x) : IsGenericSequence x := sorry

/-- Unit test `test_not_isGenericSequence_line`: a sequence inside a proper closed subset (a line in the
plane) is not generic. -/
example {X : Type*} [TopologicalSpace X] (Z : Set X) (hZ : IsClosed Z) (hne : Z ≠ Set.univ)
    (x : ℕ → X) (hx : ∀ n, x n ∈ Z) : ¬ IsGenericSequence x := sorry

/-- Unit test `test_isGenericSequence_point`: in a one-point space every sequence is generic. -/
example (x : ℕ → Unit) : IsGenericSequence x := sorry

/-! `DY.4/equidistribution-for-semipositive-adelic-line-bundles` (Yuan, Theorem 3.1) is not stated
in Lean: its hypotheses need adelic metrized line bundles on projective varieties over number fields
and their arithmetic intersection numbers (gap G1), which have no Lean counterpart yet. Its case
`(P¹, O(1))` is `AdelicMetric.tendsto_integral_of_small` above. -/

/-! ### Dynamics

The dynamics enters through the declarations of DY.0–DY.2: DY.0's `RationalMap K` and its lifts
`HomogeneousLift K d` (with `mk`, `exists_mk_eq`, `smul`, `map`), its action `toEnd`, its base
change `RationalMap.map`, conjugation by `PGL(2, K)`, powers, `ofPolynomial`, `preperiodicPts`
and `HasGoodReduction`; DY.1's absolute canonical height `RationalMap.canonicalHeight`; DY.2's
`escapeRate` and `localCanonicalHeight`, evaluated at the absolute value `|·|_v` of `K̄` carried by
the analytic line at `v`. Points of `P¹(K̄)` are written in `OnePoint K̄` in this stage (the type I
points of the analytic lines); Mathlib's `OnePoint.equivProjectivization` identifies them with
DY.0's `ℙ K̄ (Fin 2 → K̄)`.

DY.2's canonical measure lives on DY.2's model of the Berkovich line over a normed field; on TB.1's
analytic line at a place of `K` it is built here from DY.2's escape rate, as the probability
measure whose potential relative to `λ_v` is the canonical metric `φ^{f,F}_v`. -/

namespace RationalMap

variable {K}

/-- The action of `f` on `P¹(K̄) = OnePoint K̄`: DY.0's `toEnd` of the base change of `f` to `K̄`,
transported by Mathlib's `OnePoint.equivProjectivization`. -/
noncomputable def onePointMap (f : RationalMap K) :
    OnePoint (AlgebraicClosure K) → OnePoint (AlgebraicClosure K) :=
  open scoped Classical in
  fun x ↦ (OnePoint.equivProjectivization (AlgebraicClosure K)).symm
    (toEnd (map (algebraMap K (AlgebraicClosure K)) f)
      (OnePoint.equivProjectivization (AlgebraicClosure K) x))

/-- DY.1's absolute canonical height of the base change of `f` to `K̄`, on `OnePoint K̄`. -/
noncomputable def canonicalHeightBar (f : RationalMap K) (x : OnePoint (AlgebraicClosure K)) : ℝ :=
  open scoped Classical in
  (map (algebraMap K (AlgebraicClosure K)) f).canonicalHeight
    (OnePoint.equivProjectivization (AlgebraicClosure K) x)

/-- A lift of `f`, chosen by DY.0's `exists_mk_eq`. -/
noncomputable def chosenLift (f : RationalMap K) : HomogeneousLift K f.degree :=
  (exists_mk_eq f).choose

/-- `DY.4/canonical-adelic-metric-of-a-rational-map`, at the place `v`: the continuous function
`φ^{f,F}_v` on `P¹_v^an` extending `λ̂_{F,v}(z) − log⁺|z|_v` from the type I points (DY.2's
`localCanonicalHeight` of the base change of `F` to `K̄`, at the absolute value `|·|_v`), with
value DY.2's `escapeRate` `G_{F,v}(1, 0)` at `∞`; `0` if there is no such continuous function (for
`d ≥ 2` there is exactly one). -/
noncomputable def canonicalMetricAt {d : ℕ} (F : HomogeneousLift K d) (v : NumberFieldPlace K) :
    C((Lv[v]).carrier, ℝ) :=
  open scoped Classical in
  if h : ∃ g : C((Lv[v]).carrier, ℝ),
      (∀ z : AlgebraicClosure K, g ((Lv[v]).embed z) =
        localCanonicalHeight (Lv[v]).absv (F.map (algebraMap K (AlgebraicClosure K))) z -
          Real.posLog ((Lv[v]).absv z)) ∧
      g (Lv[v]).infty =
        escapeRate (Lv[v]).absv (F.map (algebraMap K (AlgebraicClosure K))) ![1, 0]
  then h.choose else 0

/-- **Construction `DY.4/canonical-adelic-metric-of-a-rational-map`.**
`-log ‖x₁‖_{f,v} = λ_{F,v} = log⁺|z|_v + φ^{f,F}_v`, for a lift `F` of `f`. -/
noncomputable def canonicalMetric {d : ℕ} (F : HomogeneousLift K d) : AdelicMetric K :=
  ⟨canonicalMetricAt F, sorry⟩

theorem canonicalMetric_isSemipositive {d : ℕ} (F : HomogeneousLift K d) (hd : 2 ≤ d) :
    (canonicalMetric F).IsSemipositive := sorry

/-- DY.2's canonical measure `µ_{f,v}` at the place `v`, on TB.1's analytic line: the probability
measure whose potential relative to `λ_v` is `φ^{f,F}_v − φ^{f,F}_v(∞)` for a lift `F` of `f`
(independent of the lift, by `canonicalMetric_smul`); `λ_v` if there is none. -/
noncomputable def canonicalMeasureAt (f : RationalMap K) (v : NumberFieldPlace K) :
    ProbabilityMeasure (Lv[v]).carrier :=
  open scoped Classical in
  if h : ∃ μ : ProbabilityMeasure (Lv[v]).carrier, ∀ z, z ≠ (Lv[v]).infty →
      canonicalMetricAt f.chosenLift v z - canonicalMetricAt f.chosenLift v (Lv[v]).infty =
        (Lv[v]).potential μ z - (Lv[v]).potential ((Lv[v]).standard : Measure _) z
  then h.choose else (Lv[v]).standard

/-- **Construction `DY.4/canonical-adelic-measure-of-a-rational-map`.** `ρ_f = (µ_{f,v})_v`. -/
noncomputable def canonicalAdelicMeasure (f : RationalMap K) : AdelicMeasure K where
  toFun := f.canonicalMeasureAt
  finite_ne_standard := sorry
  hasContinuousPotential := sorry

theorem canonicalAdelicMeasure_apply (f : RationalMap K) (v : NumberFieldPlace K) :
    (canonicalAdelicMeasure f).toFun v = f.canonicalMeasureAt v := rfl

/-- At a finite place `v` whose valuation ring is `R`, DY.0's good reduction over `R` gives
`ρ_{f,v} = λ_v`. -/
theorem canonicalAdelicMeasure_eq_standard_of_goodReduction (f : RationalMap K) (hf : 2 ≤ f.degree)
    (v : NumberField.FinitePlace K) (R : ValuationSubring K) (hR : ∀ x : K, x ∈ R ↔ v x ≤ 1)
    (hv : f.HasGoodReduction R) :
    (canonicalAdelicMeasure f).toFun (Sum.inr v) = (Lv[Sum.inr v]).standard := sorry

theorem canonicalAdelicMeasure_iterate (f : RationalMap K) (hf : 2 ≤ f.degree) {n : ℕ}
    (hn : 1 ≤ n) : canonicalAdelicMeasure (f ^ n) = canonicalAdelicMeasure f := sorry

open scoped Classical in
/-- Conjugation: with DY.0's convention `γ • f = γ ∘ f ∘ γ⁻¹`, the canonical adelic heights satisfy
`h_{ρ_{γ • f}}(γ x) = h_{ρ_f}(x)`. -/
theorem canonicalAdelicMeasure_conj (f : RationalMap K) (hf : 2 ≤ f.degree) (γ : GL (Fin 2) K)
    (x : OnePoint (AlgebraicClosure K)) :
    (canonicalAdelicMeasure (Matrix.ProjGenLinGroup.mk γ • f)).heightAt
        (Matrix.GeneralLinearGroup.map (algebraMap K (AlgebraicClosure K)) γ • x) =
      (canonicalAdelicMeasure f).heightAt x := sorry

theorem canonicalAdelicMeasure_invariant (f : RationalMap K) (hf : 2 ≤ f.degree)
    (x : OnePoint (AlgebraicClosure K)) :
    (canonicalAdelicMeasure f).heightAt (f.onePointMap x) =
      f.degree * (canonicalAdelicMeasure f).heightAt x := sorry

theorem curvature_canonicalMetric {d : ℕ} (F : HomogeneousLift K d) (hd : 2 ≤ d) :
    (canonicalMetric F).curvature (canonicalMetric_isSemipositive F hd) =
      canonicalAdelicMeasure (mk F) := sorry

theorem height_canonicalMetric {d : ℕ} (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (x : OnePoint (AlgebraicClosure K)) :
    (canonicalMetric F).height x = (mk F).canonicalHeightBar x := sorry

theorem canonicalMetric_smul {d : ℕ} (F : HomogeneousLift K d) (hd : 2 ≤ d) (a : Kˣ)
    (v : NumberFieldPlace K) :
    (canonicalMetric (HomogeneousLift.smul a F)).φ v = (canonicalMetric F).φ v +
      ContinuousMap.const _
        (Real.log ((Lv[v]).absv (algebraMap K (AlgebraicClosure K) a)) / (d - 1)) := sorry

/-- `φ^{f,F}_v = 0` at a finite place where the lift `F` has good reduction (integral coefficients,
unit resultant, DY.2's `escapeRate_eq_log_of_goodReduction`). -/
theorem canonicalMetric_eq_zero_of_goodReduction {d : ℕ} (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (v : NumberField.FinitePlace K) (hint : ∀ i m, v ((F.forms i).coeff m) ≤ 1)
    (hres : v (binaryResultant d d (F.forms 0) (F.forms 1)) = 1) :
    (canonicalMetric F).φ (Sum.inr v) = 0 := sorry

/-- The functional equation `−log‖x₁‖_{f,v}(f(z)) = d·(−log‖x₁‖_{f,v}(z)) − log|F₁(z, 1)|_v`. -/
theorem canonicalMetric_functional_equation {d : ℕ} (F : HomogeneousLift K d) (hd : 2 ≤ d)
    (v : NumberFieldPlace K) (x : AlgebraicClosure K)
    (hx : MvPolynomial.eval ![x, 1] ((F.map (algebraMap K (AlgebraicClosure K))).forms 1) ≠ 0) :
    (canonicalMetric F).negLogNormX1 v ((Lv[v]).embed
        (MvPolynomial.eval ![x, 1] ((F.map (algebraMap K (AlgebraicClosure K))).forms 0) /
          MvPolynomial.eval ![x, 1] ((F.map (algebraMap K (AlgebraicClosure K))).forms 1))) =
      d * (canonicalMetric F).negLogNormX1 v ((Lv[v]).embed x) -
        Real.log ((Lv[v]).absv
          (MvPolynomial.eval ![x, 1] ((F.map (algebraMap K (AlgebraicClosure K))).forms 1))) :=
  sorry

/-- `DY.4/canonical-metric-self-intersection-zero` (Petsche–Szpiro–Tucker Proposition 10). -/
theorem canonicalMetric_pairing_self {d : ℕ} (F : HomogeneousLift K d) (hd : 2 ≤ d) :
    (canonicalMetric F).pairing (canonicalMetric F) (canonicalMetric_isSemipositive F hd) = 0 :=
  sorry

/-- **Theorem `DY.4/canonical-height-is-an-adelic-height`** (Favre–Rivera-Letelier Theorems 4/8):
DY.1's canonical height is the adelic height of `ρ_f`. -/
theorem canonicalHeight_eq_heightAt (f : RationalMap K) (hf : 2 ≤ f.degree)
    (x : OnePoint (AlgebraicClosure K)) :
    f.canonicalHeightBar x = (canonicalAdelicMeasure f).heightAt x := sorry

/-- **Theorem `DY.4/dynamical-equidistribution`** (Baker–Rumely Theorem 2.3). -/
theorem tendsto_integral_orbit_of_canonicalHeight (f : RationalMap K) (hf : 2 ≤ f.degree)
    (x : ℕ → OnePoint (AlgebraicClosure K)) (hx : Function.Injective x)
    (hsmall : Tendsto (fun n => f.canonicalHeightBar (x n)) atTop (𝓝 0))
    (v : NumberFieldPlace K) (g : C((Lv[v]).carrier, ℝ)) :
    Tendsto (fun n => ∫ z, g z ∂((Lv[v]).orbitMeasure (galoisOrbitFinset K (x n)))) atTop
      (𝓝 (∫ z, g z ∂(f.canonicalMeasureAt v : Measure (Lv[v]).carrier))) := sorry

/-- `DY.4/equidistribution-of-iterated-preimages` (Favre–Rivera-Letelier Corollary 1.5, `S`
constant): the preimage sets `f^{-n}(Gal·z₀)`. -/
theorem tendsto_integral_preimages (f : RationalMap K) (hf : 2 ≤ f.degree)
    (z₀ : OnePoint (AlgebraicClosure K))
    (hz₀ : {y | ∃ n, f.onePointMap^[n] y ∈ galoisOrbitFinset K z₀}.Infinite)
    (F : ℕ → Finset (OnePoint (AlgebraicClosure K)))
    (hF : ∀ n y, y ∈ F n ↔ f.onePointMap^[n] y ∈ galoisOrbitFinset K z₀)
    (v : NumberFieldPlace K) (g : C((Lv[v]).carrier, ℝ)) :
    Tendsto (fun n => ∫ z, g z ∂((Lv[v]).orbitMeasure (F n))) atTop
      (𝓝 (∫ z, g z ∂(f.canonicalMeasureAt v : Measure (Lv[v]).carrier))) := sorry

/-- `DY.4/equidistribution-of-periodic-points` (Favre–Rivera-Letelier Corollary 1.5, `S = id`),
along sequences with pairwise distinct fixed-point sets. -/
theorem tendsto_integral_periodic (f : RationalMap K) (hf : 2 ≤ f.degree)
    (n : ℕ → ℕ) (Fix : ℕ → Finset (OnePoint (AlgebraicClosure K)))
    (hFix : ∀ k y, y ∈ Fix k ↔ f.onePointMap^[n k] y = y) (hdistinct : Function.Injective Fix)
    (v : NumberFieldPlace K) (g : C((Lv[v]).carrier, ℝ)) :
    Tendsto (fun k => ∫ z, g z ∂((Lv[v]).orbitMeasure (Fix k))) atTop
      (𝓝 (∫ z, g z ∂(f.canonicalMeasureAt v : Measure (Lv[v]).carrier))) := sorry

/-- **Definition `DY.4/dynamical-arakelov-zhang-pairing`.** `⟨f, g⟩ = ⟨ρ_f, ρ_g⟩`. -/
noncomputable def azPairing (f g : RationalMap K) : ℝ :=
  (canonicalAdelicMeasure f).pairing (canonicalAdelicMeasure g)

theorem azPairing_comm (f g : RationalMap K) : azPairing f g = azPairing g f := sorry

theorem azPairing_self (f : RationalMap K) : azPairing f f = 0 := sorry

theorem azPairing_nonneg (f g : RationalMap K) : 0 ≤ azPairing f g := sorry

theorem azPairing_eq_metric_pairing {d e : ℕ} (F : HomogeneousLift K d) (G : HomogeneousLift K e)
    (hd : 2 ≤ d) (he : 2 ≤ e) :
    azPairing (mk F) (mk G) =
      (canonicalMetric F).pairing (canonicalMetric G) (canonicalMetric_isSemipositive G he) :=
  sorry

theorem azPairing_sq_eq (g : RationalMap K) (hg : 2 ≤ g.degree) :
    azPairing (ofPolynomial (Polynomial.X ^ 2)) g = g.canonicalHeightBar OnePoint.infty +
      ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight *
        ∫ z, (Lv[v]).logPlus z ∂(g.canonicalMeasureAt v : Measure (Lv[v]).carrier) := sorry

theorem azPairing_iterate (f g : RationalMap K) (hf : 2 ≤ f.degree) {n : ℕ} (hn : 1 ≤ n) :
    azPairing (f ^ n) g = azPairing f g := sorry

theorem azPairing_conj (f g : RationalMap K) (γ : PGL(2, K)) :
    azPairing (γ • f) (γ • g) = azPairing f g := sorry

/-- **Definition `DY.4/local-dynamical-energy`.** `E_v(f, g) = ½(µ_f - µ_g, µ_f - µ_g)_v`. -/
noncomputable def localEnergy (f g : RationalMap K) (v : NumberFieldPlace K) : ℝ :=
  (1 / 2) * (Lv[v]).energyDiff (f.canonicalMeasureAt v) (g.canonicalMeasureAt v)

theorem localEnergy_eq_localHeights {d e : ℕ} (F : HomogeneousLift K d) (G : HomogeneousLift K e)
    (hd : 2 ≤ d) (he : 2 ≤ e) (v : NumberFieldPlace K) :
    localEnergy (mk F) (mk G) v = (1 / 2) *
      (∫ z, ((canonicalMetric F).φ v z - (canonicalMetric G).φ v z)
          ∂((mk G).canonicalMeasureAt v : Measure (Lv[v]).carrier) +
        ∫ z, ((canonicalMetric G).φ v z - (canonicalMetric F).φ v z)
          ∂((mk F).canonicalMeasureAt v : Measure (Lv[v]).carrier)) := sorry

theorem localEnergy_nonneg (f g : RationalMap K) (v : NumberFieldPlace K) :
    0 ≤ localEnergy f g v ∧
      (localEnergy f g v = 0 ↔ f.canonicalMeasureAt v = g.canonicalMeasureAt v) :=
  sorry

theorem localEnergy_comm (f g : RationalMap K) (v : NumberFieldPlace K) :
    localEnergy f g v = localEnergy g f v := sorry

theorem localEnergy_conj (f g : RationalMap K) (γ : PGL(2, K)) (v : NumberFieldPlace K) :
    localEnergy (γ • f) (γ • g) v = localEnergy f g v := sorry

theorem azPairing_eq_sum_localEnergy (f g : RationalMap K) :
    azPairing f g = ∑ᶠ v : NumberFieldPlace K, (Lv[v]).weight * localEnergy f g v := sorry

/-- `DY.4/heights-of-small-points-of-another-map` (Petsche–Szpiro–Tucker Theorem 1). -/
theorem tendsto_canonicalHeight_azPairing (f g : RationalMap K) (hf : 2 ≤ f.degree)
    (hg : 2 ≤ g.degree) (x : ℕ → OnePoint (AlgebraicClosure K)) (hx : Function.Injective x)
    (hsmall : Tendsto (fun n => g.canonicalHeightBar (x n)) atTop (𝓝 0)) :
    Tendsto (fun n => f.canonicalHeightBar (x n)) atTop (𝓝 (azPairing f g)) := sorry

/-- **Theorem `DY.4/vanishing-of-the-dynamical-pairing`** (Petsche–Szpiro–Tucker Theorem 3). -/
theorem azPairing_eq_zero_tfae (f g : RationalMap K) (hf : 2 ≤ f.degree) (hg : 2 ≤ g.degree) :
    [azPairing f g = 0, f.canonicalHeightBar = g.canonicalHeightBar,
      preperiodicPts f.onePointMap = preperiodicPts g.onePointMap,
      (preperiodicPts f.onePointMap ∩ preperiodicPts g.onePointMap).Infinite,
      ∃ x : ℕ → OnePoint (AlgebraicClosure K), Function.Injective x ∧
        Tendsto (fun n => f.canonicalHeightBar (x n) + g.canonicalHeightBar (x n)) atTop (𝓝 0),
      ∀ v, f.canonicalMeasureAt v = g.canonicalMeasureAt v].TFAE := sorry

/-- `DY.4/common-preperiodic-points` (Baker–DeMarco Theorem 1.2 over number fields; Mimar). -/
theorem preper_eq_of_infinite_inter (f g : RationalMap K) (hf : 2 ≤ f.degree) (hg : 2 ≤ g.degree)
    (h : (preperiodicPts f.onePointMap ∩ preperiodicPts g.onePointMap).Infinite) :
    preperiodicPts f.onePointMap = preperiodicPts g.onePointMap ∧
      f.canonicalHeightBar = g.canonicalHeightBar ∧
      ∀ v, f.canonicalMeasureAt v = g.canonicalMeasureAt v := sorry

/-- `DY.4/periodic-point-average-of-canonical-heights` (Petsche–Szpiro–Tucker Theorem 2, set form). -/
theorem tendsto_average_periodic (f g : RationalMap K) (hf : 2 ≤ f.degree) (hg : 2 ≤ g.degree)
    (n : ℕ → ℕ) (Fix : ℕ → Finset (OnePoint (AlgebraicClosure K)))
    (hFix : ∀ k y, y ∈ Fix k ↔ g.onePointMap^[n k] y = y) (hdistinct : Function.Injective Fix) :
    Tendsto (fun k => ((Fix k).card : ℝ)⁻¹ * ∑ y ∈ Fix k, f.canonicalHeightBar y) atTop
      (𝓝 (azPairing f g)) := sorry

/-- `DY.4/holder-continuity-of-canonical-potentials` (Favre–Rivera-Letelier Proposition 6.5), in the
form used: a Hölder bound for the regularisation modulus of the canonical potentials. -/
theorem canonicalAdelicMeasure_potential_holder (f : RationalMap K) (hf : 2 ≤ f.degree) :
    ∃ C κ : ℝ, 0 < κ ∧ ∀ v, ∀ r ∈ Set.Ioo (0 : ℝ) 1,
      (Lv[v]).regularisationModulus ((canonicalAdelicMeasure f).potential v) r ≤ C * r ^ κ := sorry

/-- `DY.4/height-difference-bound-via-the-pairing` (Petsche–Szpiro–Tucker Theorem 15, sharpened). -/
theorem canonicalHeight_sub_weilHeight_le (g : RationalMap K) (hg : 2 ≤ g.degree)
    (x : OnePoint (AlgebraicClosure K)) :
    g.canonicalHeightBar x - weilHeightP1 K x ≤
      azPairing (ofPolynomial (Polynomial.X ^ 2)) g + Real.log 2 := sorry

end RationalMap

/-! Unit tests for the dynamical constructions. -/

/-- Unit test `RationalMap.test_canonicalAdelicMeasure_pow`: `ρ_{z^d} = λ`. -/
example (d : ℕ) (hd : 2 ≤ d) :
    RationalMap.canonicalAdelicMeasure (RationalMap.ofPolynomial (Polynomial.X ^ d : Polynomial K)) =
      AdelicMeasure.standard := sorry

/-- Unit test `RationalMap.test_canonicalAdelicMeasure_iterate`: `ρ_{f∘f} = ρ_f`. -/
example (f : RationalMap K) (hf : 2 ≤ f.degree) :
    RationalMap.canonicalAdelicMeasure (f * f) = RationalMap.canonicalAdelicMeasure f := sorry

/-- Unit test `RationalMap.test_canonicalAdelicMeasure_translate`: for `σ_α(z) = α − (α − z)²` and
`|α|_v > 1` at a finite place, `ρ_{σ_α,v} = δ_{ζ_{α,1}}`. -/
example (α : K) (v : NumberField.FinitePlace K)
    (hα : 1 < (Lv[Sum.inr v]).absv (algebraMap K (AlgebraicClosure K) α)) :
    (RationalMap.canonicalAdelicMeasure (RationalMap.ofPolynomial
        (Polynomial.C α - (Polynomial.C α - Polynomial.X) ^ 2))).toFun (Sum.inr v) =
      (Lv[Sum.inr v]).circle (algebraMap K (AlgebraicClosure K) α) 1 := sorry

/-- Unit test `RationalMap.test_canonicalAdelicMeasure_bad_reduction`: for `f(z) = (z² − z)/p` over
`ℚ` and the finite place `v` above `p`, `ρ_{f,v} ≠ λ_v`. -/
example (p : ℕ) [Fact p.Prime] (v : NumberField.FinitePlace ℚ) (hv : v (p : ℚ) < 1) :
    (RationalMap.canonicalAdelicMeasure (RationalMap.ofPolynomial
        (Polynomial.C (1 / (p : ℚ)) * (Polynomial.X ^ 2 - Polynomial.X)))).toFun (Sum.inr v) ≠
      (NumberFieldPlace.analyticLine ℚ (Sum.inr v)).standard := sorry

/-- Unit test `RationalMap.test_canonicalMetric_pow`: for `z^d` with the lift `(x₀^d, x₁^d)` the
canonical metric is standard, with height `absLogHeight₁`. -/
example (d : ℕ) (hd : 2 ≤ d) (F : HomogeneousLift K d)
    (hF : F.forms = ![MvPolynomial.X 0 ^ d, MvPolynomial.X 1 ^ d]) (x : AlgebraicClosure K) :
    RationalMap.canonicalMetric F = AdelicMetric.standard ∧
      (RationalMap.canonicalMetric F).height (x : OnePoint (AlgebraicClosure K)) =
        NumberField.absLogHeight₁ x := sorry

/-- Unit test `RationalMap.test_canonicalMetric_smul`: scaling the lift by `a ∈ Kˣ` leaves the height
unchanged. -/
example (d : ℕ) (hd : 2 ≤ d) (F : HomogeneousLift K d) (a : Kˣ)
    (x : OnePoint (AlgebraicClosure K)) :
    (RationalMap.canonicalMetric (HomogeneousLift.smul a F)).height x =
      (RationalMap.canonicalMetric F).height x := sorry

/-- Unit test `RationalMap.test_canonicalMetric_quadratic`: for the lift `(x₀² + c x₁², x₁²)` of
`z² + c` and a finite place with `|c|_v > 1`, `φ_v(0) = ½ log|c|_v`. -/
example (c : K) (F : HomogeneousLift K 2)
    (hF : F.forms = ![MvPolynomial.X 0 ^ 2 + MvPolynomial.C c * MvPolynomial.X 1 ^ 2,
      MvPolynomial.X 1 ^ 2])
    (v : NumberField.FinitePlace K)
    (hc : 1 < (Lv[Sum.inr v]).absv (algebraMap K (AlgebraicClosure K) c)) :
    (RationalMap.canonicalMetric F).φ (Sum.inr v)
        ((Lv[Sum.inr v]).embed (0 : AlgebraicClosure K)) =
      (1 / 2) * Real.log ((Lv[Sum.inr v]).absv (algebraMap K (AlgebraicClosure K) c)) := sorry

/-- Unit test `RationalMap.test_canonicalMetric_not_standard`: for `z² + c` with `c` non-integral at
some finite place, the canonical metric is not the standard metric. -/
example (c : K) (F : HomogeneousLift K 2)
    (hF : F.forms = ![MvPolynomial.X 0 ^ 2 + MvPolynomial.C c * MvPolynomial.X 1 ^ 2,
      MvPolynomial.X 1 ^ 2])
    (v : NumberField.FinitePlace K)
    (hc : 1 < (Lv[Sum.inr v]).absv (algebraMap K (AlgebraicClosure K) c)) :
    RationalMap.canonicalMetric F ≠ AdelicMetric.standard := sorry

/-- Unit test `RationalMap.test_azPairing_pow`: `⟨z², z³⟩ = 0`. -/
example : RationalMap.azPairing (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial K))
    (RationalMap.ofPolynomial (Polynomial.X ^ 3)) = 0 := sorry

/-- Unit test `RationalMap.test_azPairing_translate_two`: `⟨z², 2 - (2 - z)²⟩ = log 2` over `ℚ`. -/
example : RationalMap.azPairing (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ))
    (RationalMap.ofPolynomial (Polynomial.C 2 - (Polynomial.C 2 - Polynomial.X) ^ 2)) =
      Real.log 2 := sorry

/-- Unit test `RationalMap.test_azPairing_translate_one`:
`⟨z², 1 - (1 - z)²⟩ = (3√3/4π) Σ_{n ≥ 1} χ₋₃(n)/n²`. -/
example (χ : ℕ → ℝ) (hχ : ∀ n, χ n = if n % 3 = 1 then 1 else if n % 3 = 2 then -1 else 0) :
    RationalMap.azPairing (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial ℚ))
        (RationalMap.ofPolynomial (Polynomial.C 1 - (Polynomial.C 1 - Polynomial.X) ^ 2)) =
      3 * Real.sqrt 3 / (4 * Real.pi) * ∑' n : ℕ, χ (n + 1) / ((n + 1 : ℝ) ^ 2) := sorry

/-- Unit test `RationalMap.test_azPairing_zero_not_eq`: `⟨z², z³⟩ = 0` although the maps differ. -/
example : RationalMap.azPairing (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial K))
      (RationalMap.ofPolynomial (Polynomial.X ^ 3)) = 0 ∧
    RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial K) ≠
      RationalMap.ofPolynomial (Polynomial.X ^ 3) := sorry

/-- Unit test `RationalMap.test_localEnergy_pow`: `E_v(z², z³) = 0`. -/
example (v : NumberFieldPlace K) :
    RationalMap.localEnergy (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial K))
      (RationalMap.ofPolynomial (Polynomial.X ^ 3)) v = 0 := sorry

/-- Unit test `RationalMap.test_localEnergy_translate_finite`: `E_v(z², σ_α) = log|α|_v` at a finite
place with `|α|_v > 1`. -/
example (α : K) (v : NumberField.FinitePlace K)
    (hα : 1 < (Lv[Sum.inr v]).absv (algebraMap K (AlgebraicClosure K) α)) :
    RationalMap.localEnergy (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial K))
        (RationalMap.ofPolynomial (Polynomial.C α - (Polynomial.C α - Polynomial.X) ^ 2))
        (Sum.inr v) =
      Real.log ((Lv[Sum.inr v]).absv (algebraMap K (AlgebraicClosure K) α)) := sorry

/-- Unit test `RationalMap.test_localEnergy_translate_infinite`: `E_v(z², σ_α) = log|α|` at an
infinite place with `|α| ≥ 2`. -/
example (α : K) (w : NumberField.InfinitePlace K)
    (hα : 2 ≤ (Lv[Sum.inl w]).absv (algebraMap K (AlgebraicClosure K) α)) :
    RationalMap.localEnergy (RationalMap.ofPolynomial (Polynomial.X ^ 2 : Polynomial K))
        (RationalMap.ofPolynomial (Polynomial.C α - (Polynomial.C α - Polynomial.X) ^ 2))
        (Sum.inl w) =
      Real.log ((Lv[Sum.inl w]).absv (algebraMap K (AlgebraicClosure K) α)) := sorry

/-- Unit test `RationalMap.test_localEnergy_self`: `E_v(f, f) = 0`. -/
example (f : RationalMap K) (v : NumberFieldPlace K) : RationalMap.localEnergy f f v = 0 :=
  sorry

/-! `DY.4/periodic-point-average-with-multiplicity` (Petsche–Szpiro–Tucker Theorem 2 as stated, with
multiplicities) and `DY.4/quantitative-equidistribution-of-preimages` are not stated here: the first
needs the multiplicity of a fixed point of `gⁿ` (DY.3) and gap G5, the second the Hölder property of
the DY.2 potentials; both follow the statements of the roadmap document. -/

/-! ### Postcritically finite parameters (`DY.4/multibrot-adelic-measure` and the PCF theorems) -/

/-- **Construction `DY.4/multibrot-adelic-measure`** (Green function part):
`G_{M,v}(c) = lim D^{-(n-1)} log⁺|P_cⁿ(0)|_v` with `P_c(z) = z^D + c`. -/
noncomputable def multibrotGreen (D : ℕ) (v : NumberFieldPlace K) (c : AlgebraicClosure K) : ℝ :=
  limUnder atTop fun n : ℕ =>
    ((D : ℝ) ^ (n - 1))⁻¹ * Real.posLog ((Lv[v]).absv ((fun z => z ^ D + c)^[n] 0))

theorem multibrotGreen_finite (D : ℕ) (hD : 2 ≤ D) (v : NumberField.FinitePlace K)
    (c : AlgebraicClosure K) :
    multibrotGreen K D (Sum.inr v) c = Real.posLog ((Lv[Sum.inr v]).absv c) := sorry

/-- `G_{M,v}(c) = G_{P_c,v}(c, 1) = D·G_{P_c,v}(0, 1)`, with DY.2's local canonical height (the
escape rate at `(z, 1)`) of the lift `(x₀^D + c x₁^D, x₁^D)` of `P_c` at `|·|_v`. -/
theorem multibrotGreen_eq_escapeRate (D : ℕ) (hD : 2 ≤ D) (v : NumberFieldPlace K)
    (c : AlgebraicClosure K) (F : HomogeneousLift (AlgebraicClosure K) D)
    (hF : F.forms = ![MvPolynomial.X 0 ^ D + MvPolynomial.C c * MvPolynomial.X 1 ^ D,
      MvPolynomial.X 1 ^ D]) :
    multibrotGreen K D v c = localCanonicalHeight (Lv[v]).absv F c ∧
      multibrotGreen K D v c = D * localCanonicalHeight (Lv[v]).absv F 0 := sorry

/-- The adelic Multibrot measure over `ℚ`: harmonic measure of `M_D` at `∞`, `λ_p` at primes. -/
noncomputable def multibrotAdelicMeasure (D : ℕ) (hD : 2 ≤ D) : AdelicMeasure ℚ := sorry

theorem multibrotAdelicMeasure_potential (D : ℕ) (hD : 2 ≤ D) (v : NumberFieldPlace ℚ)
    (c : AlgebraicClosure ℚ) :
    (NumberFieldPlace.analyticLine ℚ v).potential ((multibrotAdelicMeasure D hD).toFun v)
      ((NumberFieldPlace.analyticLine ℚ v).embed c) = multibrotGreen ℚ D v c := sorry

theorem multibrotAdelicMeasure_holder (D : ℕ) (hD : 2 ≤ D) :
    ∃ C κ : ℝ, 0 < κ ∧ ∀ v, ∀ r ∈ Set.Ioo (0 : ℝ) 1,
      (NumberFieldPlace.analyticLine ℚ v).regularisationModulus
        ((multibrotAdelicMeasure D hD).potential v) r ≤ C * r ^ κ := sorry

theorem multibrotAdelicMeasure_heightAt_infty (D : ℕ) (hD : 2 ≤ D) :
    (multibrotAdelicMeasure D hD).heightAt OnePoint.infty = 0 := sorry

/-- Unit test `test_multibrotGreen_finite`: `G_{M,p}(c) = log⁺|c|_p`. -/
example (D : ℕ) (hD : 2 ≤ D) (v : NumberField.FinitePlace ℚ) (c : AlgebraicClosure ℚ) :
    multibrotGreen ℚ D (Sum.inr v) c =
      Real.posLog ((NumberFieldPlace.analyticLine ℚ (Sum.inr v)).absv c) := sorry

/-- Unit test `test_multibrotGreen_zero`: `G_{M,v}(0) = 0`. -/
example (D : ℕ) (hD : 2 ≤ D) (v : NumberFieldPlace K) : multibrotGreen K D v 0 = 0 := sorry

/-- Unit test `test_multibrotGreen_misnormalised`: the normalisation `D^{-n}` gives `D⁻¹ log⁺|c|_p`. -/
example (D : ℕ) (hD : 2 ≤ D) (v : NumberField.FinitePlace K) (c : AlgebraicClosure K) :
    limUnder atTop (fun n : ℕ => ((D : ℝ) ^ n)⁻¹ *
      Real.posLog ((Lv[Sum.inr v]).absv ((fun z => z ^ D + c)^[n] 0))) =
      (D : ℝ)⁻¹ * Real.posLog ((Lv[Sum.inr v]).absv c) := sorry

/-- Unit test `test_multibrotAdelicMeasure_finite`: `µ_{M_D,p} = λ_p`. -/
example (D : ℕ) (hD : 2 ≤ D) (v : NumberField.FinitePlace ℚ) :
    (multibrotAdelicMeasure D hD).toFun (Sum.inr v) =
      (NumberFieldPlace.analyticLine ℚ (Sum.inr v)).standard := sorry

/-- `DY.4/multibrot-height-is-a-critical-height` (Favre–Rivera-Letelier Lemma 6.4, corrected):
`h_{µ_{M_D}}(c) = D·ĥ_{P_c}(0)`, zero iff `0` is preperiodic for `z^D + c`. -/
theorem multibrot_heightAt_eq_zero_iff (D : ℕ) (hD : 2 ≤ D) (c : AlgebraicClosure ℚ) :
    (multibrotAdelicMeasure D hD).heightAt (c : OnePoint (AlgebraicClosure ℚ)) =
        D * (RationalMap.ofPolynomial (Polynomial.X ^ D + Polynomial.C c)).canonicalHeight
          (Projectivization.mk _ ![0, 1] (by simp)) ∧
      ((multibrotAdelicMeasure D hD).heightAt (c : OnePoint (AlgebraicClosure ℚ)) = 0 ↔
        IsPreperiodicPt (fun z => z ^ D + c) 0) := sorry

/-- **Theorem `DY.4/equidistribution-of-pcf-parameters`** (Baker–Hsia Theorem 8.15;
Favre–Rivera-Letelier Theorem 5). -/
theorem tendsto_integral_pcf (D : ℕ) (hD : 2 ≤ D) (c : ℕ → AlgebraicClosure ℚ)
    (hc : Function.Injective c)
    (hpcf : ∀ k, IsPreperiodicPt (fun z => z ^ D + c k) 0)
    (v : NumberFieldPlace ℚ) (g : C((NumberFieldPlace.analyticLine ℚ v).carrier, ℝ)) :
    Tendsto (fun k => ∫ z, g z ∂((NumberFieldPlace.analyticLine ℚ v).orbitMeasure
        (galoisOrbitFinset ℚ (c k : OnePoint (AlgebraicClosure ℚ))))) atTop
      (𝓝 (∫ z, g z ∂((multibrotAdelicMeasure D hD).toFun v :
        Measure (NumberFieldPlace.analyticLine ℚ v).carrier))) := sorry

/-! `DY.4/quantitative-equidistribution-of-pcf-parameters` is the case of
`AdelicMeasure.abs_integral_orbit_sub_le` for `multibrotAdelicMeasure` (Hölder by
`multibrotAdelicMeasure_holder`, heights `0` by `multibrot_heightAt_eq_zero_iff`).
`DY.4/equidistribution-of-pcf-parameters-in-moduli` is not stated: it needs Yuan–Zhang adelic line
bundles on `M_d^cm` and the bifurcation measure (gaps G3–G4). -/

end DY4

end TauCeti.ArithmeticDynamics

end DY4File


-- ===== DY.5 =====

section DY5File

/-
Suggested Lean for ArithmeticDynamics, layer DY.5 (Arboreal Galois representations).

This file is not the roadmap and is not exhaustive: the roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`; nothing here claims an implementation.

Tau Ceti declarations this layer builds on are not imported here (this fragment is checked
against Mathlib alone). Where a statement would use one, a comment names it:
* `TauCeti.WreathProduct D ι` is by definition `(ι → D) ⋊[mulAutArrow] Equiv.Perm ι`, and is
  written out in that form below;
* `TauCeti.AbsoluteGaloisGroup K` is by definition `Gal(SeparableClosure K/K)`, the group the
  arboreal representation is defined on below;
* `TauCeti.isPretransitive_iff_irreducible`, `TauCeti.Multiquadratic.*`,
  `TauCeti.SquareClassGroup`, `Polynomial.Monic.prod_roots_eval_derivative` are consumed in
  proofs only.
-/

namespace TauCeti.ArithmeticDynamics

section DY5

open Polynomial

universe u v w

/-! ### Level towers and rooted trees -/

/-- A level tower: sets `V n` of vertices at level `n` and parent maps `V (n + 1) → V n`.
When `V 0` is a point it is a rooted tree, the vertices at distance `n` from the root being
`V n`. -/
structure LevelTower where
  /-- The vertices at level `n`. -/
  V : ℕ → Type u
  /-- The parent of a vertex at level `n + 1`. -/
  parent : ∀ n, V (n + 1) → V n

namespace LevelTower

variable (T : LevelTower.{u})

/-- The ancestor at level `k` of a vertex at level `k + j`. -/
def ancestor (k : ℕ) : (j : ℕ) → T.V (k + j) → T.V k
  | 0 => id
  | j + 1 => fun x => ancestor k j (T.parent (k + j) x)

@[simp]
theorem ancestor_zero (k : ℕ) (x : T.V k) : T.ancestor k 0 x = x := rfl

theorem ancestor_succ (k j : ℕ) (x : T.V (k + (j + 1))) :
    T.ancestor k (j + 1) x = T.ancestor k j (T.parent (k + j) x) := rfl

/-- The children of a vertex: the vertices one level up whose parent it is. -/
def children {n : ℕ} (v : T.V n) : Set (T.V (n + 1)) := {w | T.parent n w = v}

/-- A level tower is `d`-regular: one root, finite levels, every vertex has exactly `d`
children. -/
def IsRegular (d : ℕ) : Prop :=
  Nat.card (T.V 0) = 1 ∧ (∀ n, Finite (T.V n)) ∧ ∀ n (v : T.V n), Nat.card (T.children v) = d

theorem card_level_of_isRegular {d : ℕ} (hT : T.IsRegular d) (n : ℕ) :
    Nat.card (T.V n) = d ^ n := sorry

theorem parent_surjective_of_isRegular {d : ℕ} (hT : T.IsRegular d) (hd : 0 < d) (n : ℕ) :
    Function.Surjective (T.parent n) := sorry

/-- A morphism of level towers: levelwise maps commuting with the parent maps. -/
structure Hom (T' : LevelTower.{v}) where
  /-- The levelwise map. -/
  toFun : ∀ n, T.V n → T'.V n
  comm : ∀ n x, T'.parent n (toFun (n + 1) x) = toFun n (T.parent n x)

/-- An isomorphism of level towers: levelwise bijections commuting with the parent maps. -/
structure Iso (T' : LevelTower.{v}) where
  /-- The levelwise bijection. -/
  toEquiv : ∀ n, T.V n ≃ T'.V n
  comm : ∀ n x, T'.parent n (toEquiv (n + 1) x) = toEquiv n (T.parent n x)

namespace Iso

/-- The identity isomorphism. -/
def refl : T.Iso T := ⟨fun _ => Equiv.refl _, fun _ _ => rfl⟩

/-- The inverse isomorphism. -/
def symm {T : LevelTower.{u}} {T' : LevelTower.{v}} (e : T.Iso T') : T'.Iso T := sorry

/-- Composition of isomorphisms. -/
def trans {T : LevelTower.{u}} {T' : LevelTower.{v}} {T'' : LevelTower.{w}} (e : T.Iso T') (e' : T'.Iso T'') :
    T.Iso T'' := sorry

end Iso

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.test_card_binary`: a 2-regular tower has
eight vertices at level three. -/
example (T : LevelTower.{u}) (hT : T.IsRegular 2) : Nat.card (T.V 3) = 8 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.test_degree_one`: in a 1-regular tower
every level is a single point. -/
example (T : LevelTower.{u}) (hT : T.IsRegular 1) (n : ℕ) : Nat.card (T.V n) = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.test_not_regular`: the tower with levels
`Fin (n + 1)` and every vertex sent to the last vertex below is regular of no degree (the
vertex `0` of level one has no children while `Fin.last 1` has three). -/
example (d : ℕ) :
    ¬ (⟨fun n => Fin (n + 1), fun n _ => Fin.last n⟩ : LevelTower.{0}).IsRegular d := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.test_ancestor_one`: the ancestor one level
down is the parent. -/
example (T : LevelTower.{u}) (k : ℕ) (x : T.V (k + 1)) : T.ancestor k 1 x = T.parent k x := rfl

end LevelTower

/-- The complete rooted `d`-ary tree: level `n` is the set of words `Fin n → Fin d`, and the
parent of a word forgets its letter at index `0`. The letter at index `n - 1` is the one read
next to the root; this is the convention of Mathlib's `iteratedWreathToPermHom`. -/
def regularTree (d : ℕ) : LevelTower.{0} where
  V n := Fin n → Fin d
  parent _ := Fin.tail

@[simp]
theorem regularTree_parent (d n : ℕ) (x : Fin (n + 1) → Fin d) :
    (regularTree d).parent n x = Fin.tail x := rfl

theorem regularTree_isRegular (d : ℕ) : (regularTree d).IsRegular d := sorry

theorem mem_children_regularTree_iff {d n : ℕ} (x : Fin n → Fin d) (y : Fin (n + 1) → Fin d) :
    y ∈ (regularTree d).children x ↔ ∃ a, y = Fin.cons a x := sorry

theorem card_regularTree_V (d n : ℕ) : Nat.card ((regularTree d).V n) = d ^ n := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.regularTree.test_card_three`: the binary tree has
eight vertices at level three. -/
example : Nat.card ((regularTree 2).V 3) = 8 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.regularTree.test_unary`: every level of the unary
tree is a point. -/
example (n : ℕ) : Nat.card ((regularTree 1).V n) = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.regularTree.test_parent_convention`: the parent of the
word `(0, 1)` of the binary tree is the word `(1)`, not `(0)`. -/
example : (regularTree 2).parent 1 ![0, 1] = ![1] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.regularTree.test_children`: every vertex of the
`d`-ary tree has `d` children. -/
example (d n : ℕ) (x : Fin n → Fin d) : Nat.card ((regularTree d).children x) = d := sorry

namespace LevelTower

variable (T : LevelTower.{u})

/-! ### Automorphisms of a level tower -/

/-- The automorphisms of a level tower, as families of levelwise permutations commuting with
the parent maps. -/
def autSubgroup : Subgroup (∀ n, Equiv.Perm (T.V n)) where
  carrier := {σ | ∀ n x, T.parent n (σ (n + 1) x) = σ n (T.parent n x)}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The automorphism group `Aut(T)` of a level tower. -/
abbrev Aut : Type u := T.autSubgroup

/-- The topology of `Aut(T)`: induced from the product of the levelwise permutation groups,
each discrete. -/
instance : TopologicalSpace T.Aut :=
  TopologicalSpace.induced (fun σ : T.Aut => (σ : ∀ n, Equiv.Perm (T.V n)))
    (@Pi.topologicalSpace ℕ (fun n => Equiv.Perm (T.V n)) fun _ => ⊥)

/-- The action of `Aut(T)` on level `n`. -/
def levelHom (n : ℕ) : T.Aut →* Equiv.Perm (T.V n) where
  toFun σ := (σ : ∀ n, Equiv.Perm (T.V n)) n
  map_one' := rfl
  map_mul' _ _ := rfl

namespace Aut

theorem ext_iff' (σ τ : T.Aut) : σ = τ ↔ ∀ n, T.levelHom n σ = T.levelHom n τ := sorry

end Aut

theorem levelHom_parent (σ : T.Aut) (n : ℕ) (x : T.V (n + 1)) :
    T.parent n (T.levelHom (n + 1) σ x) = T.levelHom n σ (T.parent n x) := sorry

namespace Aut

instance isTopologicalGroup : IsTopologicalGroup T.Aut := sorry

end Aut

theorem continuous_levelHom (n : ℕ) :
    @Continuous _ _ _ (⊥ : TopologicalSpace (Equiv.Perm (T.V n))) (T.levelHom n) := sorry

theorem isOpen_ker_levelHom (n : ℕ) (hfin : Finite (T.V n)) :
    IsOpen ((T.levelHom n).ker : Set T.Aut) := sorry

namespace Aut

theorem compactSpace (hfin : ∀ n, Finite (T.V n)) : CompactSpace T.Aut := sorry

instance totallyDisconnectedSpace : TotallyDisconnectedSpace T.Aut := sorry

instance t2Space : T2Space T.Aut := sorry

end Aut

namespace Iso

/-- An isomorphism of level towers induces an isomorphism of automorphism groups. -/
def autCongr {T : LevelTower.{u}} {T' : LevelTower.{v}} (e : T.Iso T') : T.Aut ≃* T'.Aut := sorry

end Iso

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.Aut.test_unary_trivial`: the unary tree has
only the identity automorphism. -/
example : Subsingleton (regularTree 1).Aut := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.Aut.test_level_one_surjective`: every
permutation of level one of the binary tree comes from an automorphism. -/
example : Function.Surjective ((regularTree 2).levelHom 1) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.Aut.test_non_automorphism`: the
transposition of the leaves `(0, 0)` and `(0, 1)`, which have different parents, is not the
level-two action of any automorphism of the binary tree. -/
example : Equiv.swap (![0, 0] : Fin 2 → Fin 2) ![0, 1] ∉ ((regularTree 2).levelHom 2).range :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.Aut.test_compact`: the automorphism group of
the binary tree is compact. -/
example : CompactSpace (regularTree 2).Aut := sorry

/-! ### Automorphisms of the truncated tree -/

/-- `Aut(T_n)`: the automorphisms of the tower truncated at level `n`, as compatible families of
permutations of the levels `0, …, n`. -/
def truncAut (n : ℕ) : Subgroup (∀ k : Fin (n + 1), Equiv.Perm (T.V k)) where
  carrier := {σ | ∀ (k : ℕ) (hk : k < n) (x : T.V (k + 1)),
    T.parent k (σ ⟨k + 1, by omega⟩ x) = σ ⟨k, by omega⟩ (T.parent k x)}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

namespace truncAut

/-- Restriction from `Aut(T_{n+1})` to `Aut(T_n)`. -/
def restrict (n : ℕ) : T.truncAut (n + 1) →* T.truncAut n := sorry

/-- The action of `Aut(T_n)` on its top level. -/
def toLevelPerm (n : ℕ) : T.truncAut n →* Equiv.Perm (T.V n) := sorry

theorem toLevelPerm_injective (n : ℕ) (hpar : ∀ k, Function.Surjective (T.parent k)) :
    Function.Injective (truncAut.toLevelPerm T n) := sorry

end truncAut

namespace Aut

/-- Truncation of an automorphism of the whole tower. -/
def truncate (n : ℕ) : T.Aut →* T.truncAut n := sorry

theorem truncate_surjective {d : ℕ} (hT : T.IsRegular d) (n : ℕ) :
    Function.Surjective (Aut.truncate T n) := sorry

end Aut

namespace truncAut

theorem restrict_surjective {d : ℕ} (hT : T.IsRegular d) (n : ℕ) :
    Function.Surjective (truncAut.restrict T n) := sorry

end truncAut

/-- The sign of the permutation that a truncated automorphism induces on level `k`. -/
def levelSign [∀ n, Fintype (T.V n)] [∀ n, DecidableEq (T.V n)] (n : ℕ) (k : Fin (n + 1)) : T.truncAut n →* ℤˣ :=
  Equiv.Perm.sign.comp ((Pi.evalMonoidHom (fun k : Fin (n + 1) => Equiv.Perm (T.V k)) k).comp
    (T.truncAut n).subtype)

namespace Iso

/-- An isomorphism of level towers induces isomorphisms of the truncated automorphism groups. -/
def truncAutCongr {T : LevelTower.{u}} {T' : LevelTower.{v}} (e : T.Iso T') (n : ℕ) :
    T.truncAut n ≃* T'.truncAut n := sorry

end Iso

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.truncAut.test_level_zero`: the truncation
of a rooted tree at level zero has only the identity automorphism. -/
example (hroot : Nat.card (T.V 0) = 1) : Nat.card (T.truncAut 0) = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.truncAut.test_card_binary_two`: the
binary tree truncated at level two has eight automorphisms (the dihedral group of order 8). -/
example : Nat.card ((regularTree 2).truncAut 2) = 8 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.truncAut.test_non_automorphism`: the
transposition of the leaves `(0, 0)` and `(0, 1)` is not the top-level action of an
automorphism of the binary tree truncated at level two. -/
example : Equiv.swap (![0, 0] : Fin 2 → Fin 2) ![0, 1] ∉
    (truncAut.toLevelPerm (regularTree 2) 2).range := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.LevelTower.truncAut.test_iteratedWreathProduct`: for
the binary tree, `Aut(T_n)` is Mathlib's iterated wreath product of `C₂`. -/
example (n : ℕ) :
    Nonempty ((regularTree 2).truncAut n ≃* IteratedWreathProduct (Multiplicative (ZMod 2)) n) :=
  sorry

/-! ### Theorems on tree automorphisms -/

/-- A `d`-regular level tower is isomorphic to the `d`-ary tree. -/
theorem nonempty_iso_regularTree {d : ℕ} (hT : T.IsRegular d) :
    Nonempty (T.Iso (regularTree d)) := sorry

/-- The kernel of restriction `Aut(T_{n+1}) → Aut(T_n)` is the product over the vertices of
level `n` of the symmetric groups of their children. -/
theorem truncAut_restrict_ker {d : ℕ} (hT : T.IsRegular d) (n : ℕ) :
    Nonempty ((truncAut.restrict T n).ker ≃* ((v : T.V n) → Equiv.Perm (T.children v))) := sorry

/-- The order of `Aut(T_n)` for a `d`-regular tower. -/
theorem card_truncAut_of_isRegular {d : ℕ} (hT : T.IsRegular d) (n : ℕ) :
    Nat.card (T.truncAut n) = d.factorial ^ (∑ i ∈ Finset.range n, d ^ i) := sorry

namespace Aut

/-- `Aut(T)` is the inverse limit of the groups `Aut(T_n)`. -/
theorem existsUnique_of_compatible {d : ℕ} (hT : T.IsRegular d)
    (s : ∀ n, T.truncAut n) (hs : ∀ n, truncAut.restrict T n (s (n + 1)) = s n) :
    ∃! σ : T.Aut, ∀ n, Aut.truncate T n σ = s n := sorry

end Aut

/-- For a binary tree, the homomorphisms `Aut(T_n) → {±1}` are exactly the products of the
level signs of the levels `1, …, n`. -/
theorem binary_hom_eq_prod_levelSign [∀ n, Fintype (T.V n)] [∀ n, DecidableEq (T.V n)]
    (hT : T.IsRegular 2) (n : ℕ) (χ : T.truncAut n →* ℤˣ) :
    ∃! S : Finset (Fin n), χ = ∏ k ∈ S, T.levelSign n k.succ := sorry

end LevelTower

/-- The wreath recursion at the root: `Aut(T^d_{n+1}) ≅ Aut(T^d_n) ≀ S_d`. The right-hand side is
`TauCeti.WreathProduct ((regularTree d).truncAut n) (Fin d)` by definition. -/
theorem truncAut_regularTree_succ (d n : ℕ) :
    Nonempty ((regularTree d).truncAut (n + 1) ≃*
      ((Fin d → (regularTree d).truncAut n) ⋊[mulAutArrow] Equiv.Perm (Fin d))) := sorry

/-! ### Preimage trees -/

/-- The preimage tree of a point `α` under a self-map `g`: level `n` is `g^{-n}(α)` and the
parent of `x` is `g x`. -/
abbrev preimageTree {X : Type u} (g : X → X) (α : X) : LevelTower.{u} where
  V n := {x : X // g^[n] x = α}
  parent _ x := ⟨g x.1, by rw [← Function.iterate_succ_apply]; exact x.2⟩

/-- The preimage tree of `α ∈ K` under a polynomial `f ∈ K[X]`, with vertices in a field `L`
containing `K`. -/
noncomputable abbrev polyPreimageTree (K : Type u) (L : Type v) [Field K] [Field L]
    [Algebra K L] (f : K[X]) (α : K) : LevelTower.{v} :=
  preimageTree (fun x : L => aeval x f) (algebraMap K L α)

@[simp]
theorem preimageTree_parent_coe {X : Type u} (g : X → X) (α : X) (n : ℕ)
    (x : (preimageTree g α).V (n + 1)) : (((preimageTree g α).parent n x) : X) = g x := rfl

theorem preimageTree_ancestor_coe {X : Type u} (g : X → X) (α : X) (k j : ℕ)
    (x : (preimageTree g α).V (k + j)) :
    (((preimageTree g α).ancestor k j x) : X) = g^[j] x := sorry

namespace preimageTree

/-- Level zero of a preimage tree is the root alone. -/
instance uniqueLevelZero {X : Type u} (g : X → X) (α : X) :
    Unique ((preimageTree g α).V 0) := sorry

/-- A map commuting with the dynamics and sending root to root maps preimage trees. -/
def hom {X : Type u} {Y : Type v} {g : X → X} {g' : Y → Y} {α : X} {α' : Y}
    (h : X → Y) (hg : h ∘ g = g' ∘ h) (hα : h α = α') :
    (preimageTree g α).Hom (preimageTree g' α') := sorry

/-- A bijection commuting with the dynamics and sending root to root is an isomorphism of
preimage trees. -/
def iso {X : Type u} {Y : Type v} {g : X → X} {g' : Y → Y} {α : X} {α' : Y}
    (h : X ≃ Y) (hg : h ∘ g = g' ∘ h) (hα : h α = α') :
    (preimageTree g α).Iso (preimageTree g' α') := sorry

end preimageTree

theorem polyPreimageTree_mem_rootSet {K : Type u} {L : Type v} [Field K] [Field L]
    [Algebra K L] (f : K[X]) (α : K) (n : ℕ) (hf : 0 < f.natDegree) (x : L) :
    (fun y : L => aeval y f)^[n] x = algebraMap K L α ↔
      x ∈ (f.comp^[n] X - C α).rootSet L := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preimageTree.test_roots_of_unity`: under `z ↦ z²` on
`ℂ`, level `n` of the tree over `1` is the set of `2ⁿ`-th roots of unity, with `2ⁿ` elements. -/
example (n : ℕ) : Nat.card ((preimageTree (fun z : ℂ => z ^ 2) 1).V n) = 2 ^ n := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preimageTree.test_identity`: under the identity every
level is the root alone. -/
example {X : Type u} (α : X) (n : ℕ) : Nat.card ((preimageTree id α).V n) = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preimageTree.test_critical_collision`: under `z ↦ z²`
the tree over the critical value `0` is not `2`-regular: each level is `{0}`. -/
example : ¬ (preimageTree (fun z : ℂ => z ^ 2) 0).IsRegular 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preimageTree.test_rootSet`: level `n` of the
polynomial preimage tree is the root set of `fⁿ - α`. -/
example {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L] (f : K[X]) (α : K) (n : ℕ)
    (hf : 0 < f.natDegree) (x : L) :
    (fun y : L => aeval y f)^[n] x = algebraMap K L α ↔
      x ∈ (f.comp^[n] X - C α).rootSet L := sorry

/-! ### The non-collision condition -/

/-- The chain rule for iterates: `(fⁿ)' = ∏_{i < n} f' ∘ fⁱ`. -/
theorem derivative_iterate_comp {R : Type u} [CommSemiring R] (f : R[X]) (n : ℕ) :
    derivative (f.comp^[n] X) = ∏ i ∈ Finset.range n, (derivative f).comp (f.comp^[i] X) :=
  sorry

/-- `fⁿ - α` is separable exactly when no critical point of `f` reaches `α` in `1, …, n`
steps. -/
theorem separable_iterate_sub_iff {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree)
    (α : K) (n : ℕ) (hn : 1 ≤ n) :
    (f.comp^[n] X - C α).Separable ↔
      ∀ c : AlgebraicClosure K, aeval c (derivative f) = 0 →
        ∀ k, 1 ≤ k → k ≤ n → (fun x => aeval x f)^[k] c ≠ algebraMap K _ α := sorry

/-- Under the non-collision condition the preimage tree is `d`-regular. -/
theorem isRegular_polyPreimageTree {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]
    (f : K[X]) (hf : 0 < f.natDegree) (α : K) (hsep : ∀ n, (f.comp^[n] X - C α).Separable)
    (hsplit : ∀ n, ((f.comp^[n] X - C α).map (algebraMap K L)).Splits) :
    (polyPreimageTree K L f α).IsRegular f.natDegree := sorry

/-- Conjugating by an affine map `x ↦ u x + v` defined over `K` gives an isomorphic preimage tree,
equivariantly for `Gal(L/K)`. -/
theorem nonempty_iso_polyPreimageTree_conj {K : Type u} {L : Type v} [Field K] [Field L]
    [Algebra K L] (f : K[X]) (α u v : K) (hu : u ≠ 0) :
    Nonempty ((polyPreimageTree K L f α).Iso (polyPreimageTree K L
      (C u⁻¹ * ((f.comp (C u * X + C v)) - C v)) (u⁻¹ * (α - v)))) := sorry

/-! ### The Galois action and the arboreal representation -/

/-- The action of `Gal(L/K)` on the preimage tree of `α` under `f ∈ K[X]`. -/
noncomputable def galoisTreeAction (K : Type u) (L : Type v) [Field K] [Field L] [Algebra K L]
    (f : K[X]) (α : K) : (L ≃ₐ[K] L) →* (polyPreimageTree K L f α).Aut := sorry

theorem levelHom_galoisTreeAction_coe {K : Type u} {L : Type v} [Field K] [Field L]
    [Algebra K L] (f : K[X]) (α : K) (σ : L ≃ₐ[K] L) (n : ℕ)
    (x : (polyPreimageTree K L f α).V n) :
    (((polyPreimageTree K L f α).levelHom n (galoisTreeAction K L f α σ) x) : L) = σ x := sorry

theorem galActionHom_restrict_eq_galoisTreeAction {K : Type u} {L : Type v} [Field K] [Field L]
    [Algebra K L] (f : K[X]) (α : K) (n : ℕ)
    [Fact ((f.comp^[n] X - C α).map (algebraMap K L)).Splits] (σ : L ≃ₐ[K] L)
    (x : (f.comp^[n] X - C α).rootSet L) :
    ((Polynomial.Gal.galActionHom (f.comp^[n] X - C α) L
        (Polynomial.Gal.restrict (f.comp^[n] X - C α) L σ) x) : L) = σ x := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.galoisTreeAction.test_conj`: complex conjugation sends
the vertex `i` of level two of the tree of `z ↦ z²` over `1` to `-i`. -/
example (x : (polyPreimageTree ℝ ℂ (X ^ 2) 1).V 2) (hx : (x : ℂ) = Complex.I) :
    (((polyPreimageTree ℝ ℂ (X ^ 2) 1).levelHom 2
      (galoisTreeAction ℝ ℂ (X ^ 2) 1 Complex.conjAe) x) : ℂ) = -Complex.I := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.galoisTreeAction.test_trivial`: the Galois group of `K`
over itself acts trivially. -/
example {K : Type u} [Field K] (f : K[X]) (α : K) (σ : K ≃ₐ[K] K) :
    galoisTreeAction K K f α σ = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.galoisTreeAction.test_nontrivial`: complex conjugation
acts nontrivially on the tree of `z² + 1` over `0`. -/
example : galoisTreeAction ℝ ℂ (X ^ 2 + 1) 0 Complex.conjAe ≠ 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.galoisTreeAction.test_galActionHom`: on level `n` the
action is Mathlib's `Polynomial.Gal.galActionHom` of `fⁿ - α`, both being `σ` on roots. -/
example {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L] (f : K[X]) (α : K) (n : ℕ)
    [Fact ((f.comp^[n] X - C α).map (algebraMap K L)).Splits] (σ : L ≃ₐ[K] L)
    (x : (polyPreimageTree K L f α).V n) (hx : (x : L) ∈ (f.comp^[n] X - C α).rootSet L) :
    (((polyPreimageTree K L f α).levelHom n (galoisTreeAction K L f α σ) x) : L) =
      ((Polynomial.Gal.galActionHom (f.comp^[n] X - C α) L
        (Polynomial.Gal.restrict (f.comp^[n] X - C α) L σ) ⟨x, hx⟩) : L) := sorry

/-- The arboreal Galois representation `ρ : Gal(Kˢ/K) → Aut(T_∞(f, α))`. The source group is
`TauCeti.AbsoluteGaloisGroup K` by definition. -/
noncomputable def arborealRep (K : Type u) [Field K] (f : K[X]) (α : K) :
    (SeparableClosure K ≃ₐ[K] SeparableClosure K) →*
      (polyPreimageTree K (SeparableClosure K) f α).Aut :=
  galoisTreeAction K (SeparableClosure K) f α

/-- The arboreal image `G_∞(f, α)`. -/
noncomputable def arborealImage (K : Type u) [Field K] (f : K[X]) (α : K) :
    Subgroup (polyPreimageTree K (SeparableClosure K) f α).Aut :=
  (arborealRep K f α).range

/-- The level-`n` image `G_n(f, α) ≤ Aut(T_n)`. -/
noncomputable def levelImage (K : Type u) [Field K] (f : K[X]) (α : K) (n : ℕ) :
    Subgroup ((polyPreimageTree K (SeparableClosure K) f α).truncAut n) :=
  ((LevelTower.Aut.truncate _ n).comp (arborealRep K f α)).range

theorem card_levelImage {K : Type u} [Field K] (f : K[X]) (α : K) (n : ℕ)
    (hsep : (f.comp^[n] X - C α).Separable) :
    Nat.card (levelImage K f α n) = Nat.card (f.comp^[n] X - C α).Gal := sorry

/-- Base change: over an extension `E/K` the level images shrink, along an isomorphism of
trees. -/
theorem levelImage_map_le (K : Type u) (E : Type v) [Field K] [Field E] [Algebra K E]
    (f : K[X]) (α : K) (hsep : ∀ n, (f.comp^[n] X - C α).Separable) (N : ℕ) :
    ∃ e : (polyPreimageTree E (SeparableClosure E) (f.map (algebraMap K E))
        (algebraMap K E α)).Iso (polyPreimageTree K (SeparableClosure K) f α),
      (levelImage E (f.map (algebraMap K E)) (algebraMap K E α) N).map
        (e.truncAutCongr N).toMonoidHom ≤ levelImage K f α N := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.arborealRep.test_x_sq_add_one_level_one`: for `x² + 1`
over `ℚ` at `0` the level-one image is all of `Aut(T_1)`. -/
example : levelImage ℚ (X ^ 2 + 1) 0 1 = ⊤ := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.arborealRep.test_sepClosed`: over a separably closed
field the arboreal image is trivial. -/
example {K : Type u} [Field K] [IsSepClosed K] (f : K[X]) (α : K) : arborealImage K f α = ⊥ :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.arborealRep.test_chebyshev_not_maximal`: for the
post-critically finite `x² - 2` over `ℚ` at `0` the level-two image is not all of `Aut(T_2)`. -/
example : levelImage ℚ (X ^ 2 - 2) 0 2 ≠ ⊤ := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.arborealRep.test_card_gal`: under separability the
level-`n` image has the order of Mathlib's `Polynomial.Gal (fⁿ - α)`. -/
example {K : Type u} [Field K] (f : K[X]) (α : K) (n : ℕ)
    (hsep : (f.comp^[n] X - C α).Separable) :
    Nat.card (levelImage K f α n) = Nat.card (f.comp^[n] X - C α).Gal := sorry

/-- The field `K_n = K(f^{-n}(α))` inside `Kˢ`. -/
noncomputable def preimageField (K : Type u) [Field K] (f : K[X]) (α : K) (n : ℕ) :
    IntermediateField K (SeparableClosure K) :=
  IntermediateField.adjoin K ((f.comp^[n] X - C α).rootSet (SeparableClosure K))

/-- The field `K_∞ = ⋃ K_n`. -/
noncomputable def preimageFieldInfty (K : Type u) [Field K] (f : K[X]) (α : K) :
    IntermediateField K (SeparableClosure K) :=
  ⨆ n, preimageField K f α n

theorem preimageField_mono {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree) (α : K)
    (hsep : ∀ n, (f.comp^[n] X - C α).Separable) (n : ℕ) :
    preimageField K f α n ≤ preimageField K f α (n + 1) := sorry

theorem preimageField_isSplittingField {K : Type u} [Field K] (f : K[X]) (α : K) (n : ℕ)
    (hsep : (f.comp^[n] X - C α).Separable) :
    IsSplittingField K (preimageField K f α n) (f.comp^[n] X - C α) := sorry

theorem preimageField_isGalois {K : Type u} [Field K] (f : K[X]) (α : K) (n : ℕ)
    (hsep : (f.comp^[n] X - C α).Separable) : IsGalois K (preimageField K f α n) := sorry

theorem finiteDimensional_preimageField {K : Type u} [Field K] (f : K[X]) (α : K) (n : ℕ) :
    FiniteDimensional K (preimageField K f α n) := sorry

theorem relfinrank_preimageField_succ_le {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree)
    (α : K) (hsep : ∀ n, (f.comp^[n] X - C α).Separable) (n : ℕ) :
    (preimageField K f α n).relfinrank (preimageField K f α (n + 1)) ≤
      f.natDegree.factorial ^ (f.natDegree ^ n) := sorry

theorem fixingSubgroup_preimageField {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree)
    (α : K) (n : ℕ) :
    (preimageField K f α n).fixingSubgroup =
      ((polyPreimageTree K (SeparableClosure K) f α).levelHom n).ker.comap (arborealRep K f α) :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preimageField.test_level_zero`: `K_0 = K`. -/
example {K : Type u} [Field K] (f : K[X]) (α : K) : preimageField K f α 0 = ⊥ := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preimageField.test_squaring`: for `z ↦ z²` over `ℚ` at
`1`, `K_2 = ℚ(i)` has degree `2`. -/
example : Module.finrank ℚ (preimageField ℚ (X ^ 2) 1 2) = 2 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preimageField.test_not_one_root`: for `z ↦ z³` over `ℚ`
at `2`, `K_1` is the splitting field of `x³ - 2`, of degree `6`, not `ℚ(∛2)`. -/
example : Module.finrank ℚ (preimageField ℚ (X ^ 3) 2 1) = 6 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.preimageField.test_splittingField`: `K_n` is a
splitting field of `fⁿ - α` (for `x² + 1` over `ℚ` at `0`). -/
example (n : ℕ) :
    IsSplittingField ℚ (preimageField ℚ (X ^ 2 + 1) 0 n) ((X ^ 2 + 1 : ℚ[X]).comp^[n] X - C 0) :=
  sorry

/-- The arboreal representation is continuous for the Krull topology. -/
theorem continuous_arborealRep {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree)
    (α : K) : Continuous (arborealRep K f α) := sorry

/-- The level-`n` image is `Gal(K_n/K)`, acting on the roots of `fⁿ - α`. -/
theorem levelImage_mulEquiv_gal {K : Type u} [Field K] (f : K[X]) (α : K) (n : ℕ)
    (hsep : (f.comp^[n] X - C α).Separable) :
    Nonempty (levelImage K f α n ≃* (preimageField K f α n ≃ₐ[K] preimageField K f α n)) := sorry

/-- The arboreal image is closed and is `Gal(K_∞/K)`. -/
theorem arborealImage_homeomorph_gal {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree)
    (α : K) (hsep : ∀ n, (f.comp^[n] X - C α).Separable) :
    IsClosed (arborealImage K f α : Set (polyPreimageTree K (SeparableClosure K) f α).Aut) ∧
    (arborealRep K f α).ker = (preimageFieldInfty K f α).fixingSubgroup ∧
    Nonempty ((preimageFieldInfty K f α ≃ₐ[K] preimageFieldInfty K f α) ≃ₜ*
      arborealImage K f α) := sorry

/-- The Galois action on level `n` is transitive exactly when `fⁿ - α` is irreducible. -/
theorem levelHom_arborealRep_transitive_iff {K : Type u} [Field K] (f : K[X]) (α : K) (n : ℕ)
    (hn : 1 ≤ n) (hf : 0 < f.natDegree) (hsep : (f.comp^[n] X - C α).Separable) :
    (∀ x y : (polyPreimageTree K (SeparableClosure K) f α).V n,
        ∃ σ, (polyPreimageTree K (SeparableClosure K) f α).levelHom n (arborealRep K f α σ) x = y)
      ↔ Irreducible (f.comp^[n] X - C α) := sorry

/- The comparison of level `n` with the finite étale `K`-scheme `Spec K[x]/(fⁿ(x) - α)` under
the field-case equivalence of Tau Ceti's ModularCurves layer 0D (finite étale `K`-schemes and
finite continuous `Gal(Kˢ/K)`-sets) is left out: that equivalence is not in Mathlib at the pin. -/

/-! ### Stability -/

/-- Capelli's lemma. -/
theorem irreducible_comp_iff_capelli {K : Type u} [Field K] {g h : K[X]} (hh : 0 < h.natDegree)
    (hg : g ≠ 0) {L : Type v} [Field L] [Algebra K L] {β : L} (hβ : aeval β g = 0) :
    Irreducible (g.comp h) ↔ Irreducible g ∧
      Irreducible (h.map (algebraMap K (IntermediateField.adjoin K {β})) -
        C (IntermediateField.AdjoinSimple.gen K β)) :=
  sorry

/-- `(f, α)` is stable over `K`: every iterate `fⁿ - α` with `n ≥ 1` is irreducible. -/
def IsStableAt {K : Type u} [Field K] (f : K[X]) (α : K) : Prop :=
  ∀ n, 1 ≤ n → Irreducible (f.comp^[n] X - C α)

namespace IsStableAt

theorem irreducible_sub {K : Type u} [Field K] {f : K[X]} {α : K}
    (h : IsStableAt f α) : Irreducible (f - C α) := sorry

end IsStableAt

theorem irreducible_iterate_of_le {K : Type u} [Field K] {f : K[X]} (hf : 0 < f.natDegree)
    {α : K} {m n : ℕ} (hm : 1 ≤ m) (hmn : m ≤ n) (h : Irreducible (f.comp^[n] X - C α)) :
    Irreducible (f.comp^[m] X - C α) := sorry

theorem isStableAt_iff_forall_transitive {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree)
    (α : K) (hsep : ∀ n, (f.comp^[n] X - C α).Separable) :
    IsStableAt f α ↔ ∀ n, 1 ≤ n → ∀ x y : (polyPreimageTree K (SeparableClosure K) f α).V n,
      ∃ σ, (polyPreimageTree K (SeparableClosure K) f α).levelHom n (arborealRep K f α σ) x = y :=
  sorry

theorem isStableAt_conj_iff {K : Type u} [Field K] (f : K[X]) (α u v : K) (hu : u ≠ 0) :
    IsStableAt f α ↔ IsStableAt (C u⁻¹ * ((f.comp (C u * X + C v)) - C v)) (u⁻¹ * (α - v)) :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsStableAt.test_x_sq_add_one`: `x² + 1` is stable over
`ℚ` at `0`. -/
example : IsStableAt (X ^ 2 + 1 : ℚ[X]) 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsStableAt.test_linear`: a polynomial of degree one is
stable at every point. -/
example {K : Type u} [Field K] (a b α : K) (ha : a ≠ 0) : IsStableAt (C a * X + C b) α := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsStableAt.test_golden`: `x² - x - 1` is not stable
over `ℚ` at `0`, although its first two iterates are irreducible. -/
example : Irreducible ((X ^ 2 - X - 1 : ℚ[X]).comp^[2] X - C 0) ∧
    ¬ IsStableAt (X ^ 2 - X - 1 : ℚ[X]) 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsStableAt.test_jones_f_stable`: stability of `(f, α)`
is Jones's `(X - α)` being `f`-stable. -/
example {K : Type u} [Field K] (f : K[X]) (α : K) :
    IsStableAt f α ↔ ∀ n, 1 ≤ n → Irreducible ((X - C α).comp (f.comp^[n] X)) := sorry

/-- `(f, α)` is eventually stable over `K`: the number of irreducible factors of `fⁿ - α`, counted
with multiplicity, is bounded in `n`. -/
def IsEventuallyStableAt {K : Type u} [Field K] (f : K[X]) (α : K) : Prop :=
  ∃ B : ℕ, ∀ n, (UniqueFactorizationMonoid.factors (f.comp^[n] X - C α)).card ≤ B

namespace IsStableAt

theorem isEventuallyStableAt {K : Type u} [Field K] {f : K[X]} {α : K}
    (h : IsStableAt f α) : IsEventuallyStableAt f α := sorry

end IsStableAt

theorem isEventuallyStableAt_iff_of_le {K : Type u} [Field K] (f : K[X]) (α : K) (N : ℕ) :
    IsEventuallyStableAt f α ↔ ∃ B : ℕ, ∀ n, N ≤ n →
      (UniqueFactorizationMonoid.factors (f.comp^[n] X - C α)).card ≤ B := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsEventuallyStableAt.test_stable`: `x² + 1` over `ℚ` at
`0` is eventually stable. -/
example : IsEventuallyStableAt (X ^ 2 + 1 : ℚ[X]) 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsEventuallyStableAt.test_power_map`: `z ↦ z²` at the
critical value `0` is not eventually stable (`f^n = X^{2^n}` has `2ⁿ` factors). -/
example : ¬ IsEventuallyStableAt (X ^ 2 : ℚ[X]) 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.IsEventuallyStableAt.test_sixteen_ninths`: the third
iterate of `x² - 16/9` over `ℚ` has four irreducible factors. -/
example :
    (UniqueFactorizationMonoid.factors
      ((X ^ 2 - C (16 / 9) : ℚ[X]).comp^[3] X - C 0)).card = 4 := sorry

/-! ### The adjusted critical orbit of a quadratic polynomial -/

/-- The adjusted critical orbit of `f` with critical point `γ` relative to `α`:
`c₁ = α - f(γ)` and `cₙ = fⁿ(γ) - α` for `n ≥ 2`. At `n = 0` it is the junk value `γ - α`. -/
def adjustedCriticalOrbit {R : Type u} [CommRing R] (f : R[X]) (γ α : R) (n : ℕ) : R :=
  if n = 1 then α - f.eval γ else (fun x => f.eval x)^[n] γ - α

theorem adjustedCriticalOrbit_one {R : Type u} [CommRing R] (f : R[X]) (γ α : R) :
    adjustedCriticalOrbit f γ α 1 = α - f.eval γ := by simp [adjustedCriticalOrbit]

theorem adjustedCriticalOrbit_of_two_le {R : Type u} [CommRing R] (f : R[X]) (γ α : R) {n : ℕ}
    (hn : 2 ≤ n) : adjustedCriticalOrbit f γ α n = (fun x => f.eval x)^[n] γ - α := sorry

theorem adjustedCriticalOrbit_map {R : Type u} {S : Type v} [CommRing R] [CommRing S]
    (φ : R →+* S) (f : R[X]) (γ α : R) (n : ℕ) :
    adjustedCriticalOrbit (f.map φ) (φ γ) (φ α) n = φ (adjustedCriticalOrbit f γ α n) := sorry

theorem adjustedCriticalOrbit_ne_zero_iff {K : Type u} [Field K] (γ δ α : K) (hK : ringChar K ≠ 2)
    (n : ℕ) (hn : 1 ≤ n) :
    (∀ k, 1 ≤ k → k ≤ n → adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α k ≠ 0) ↔
      (((X - C γ) ^ 2 + C δ).comp^[n] X - C α).Separable := sorry

theorem adjustedCriticalOrbit_X_sq_add_succ {R : Type u} [CommRing R] (a : R) {n : ℕ}
    (hn : 1 ≤ n) :
    adjustedCriticalOrbit (X ^ 2 + C a) 0 0 (n + 1) =
      adjustedCriticalOrbit (X ^ 2 + C a) 0 0 n ^ 2 + a := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.adjustedCriticalOrbit.test_x_sq_add_one`: for `x² + 1`
at `0` the adjusted critical orbit begins `-1, 2, 5, 26, 677`. -/
example : (List.range 5).map (fun i => adjustedCriticalOrbit (X ^ 2 + 1 : ℤ[X]) 0 0 (i + 1)) =
    [-1, 2, 5, 26, 677] := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.adjustedCriticalOrbit.test_power_map`: for `z ↦ z²` at
`0` the adjusted critical orbit vanishes. -/
example (n : ℕ) (hn : 1 ≤ n) : adjustedCriticalOrbit (X ^ 2 : ℤ[X]) 0 0 n = 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.adjustedCriticalOrbit.test_sign`: `c₁` is `-f(γ)`, not
`f(γ)`: for `x² + 1` at `0`, `c₁ = -1 ≠ 1 = f(0)`. -/
example : adjustedCriticalOrbit (X ^ 2 + 1 : ℤ[X]) 0 0 1 ≠ (X ^ 2 + 1 : ℤ[X]).eval 0 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.adjustedCriticalOrbit.test_stoll_recursion`: for
`x² + a` at `0` this is Stoll's sequence, `c₁ = -a` and `c_{n+1} = c_n² + a`. -/
example (a : ℤ) (n : ℕ) (hn : 1 ≤ n) :
    adjustedCriticalOrbit (X ^ 2 + C a) 0 0 1 = -a ∧
    adjustedCriticalOrbit (X ^ 2 + C a) 0 0 (n + 1) =
      adjustedCriticalOrbit (X ^ 2 + C a) 0 0 n ^ 2 + a := sorry

/-- For `f = (X - γ)² + δ`, the product over the roots of `f^{n-1} - α` of `β - δ` is `cₙ`. -/
theorem prod_roots_sub_eq_adjustedCriticalOrbit {K : Type u} [Field K] (γ δ α : K) (n : ℕ)
    (hn : 1 ≤ n) {L : Type v} [Field L] [Algebra K L]
    (hsplit : ((((X - C γ) ^ 2 + C δ).comp^[n - 1] X - C α).map (algebraMap K L)).Splits) :
    (((((X - C γ) ^ 2 + C δ).comp^[n - 1] X - C α).map (algebraMap K L)).roots.map
      (fun β => β - algebraMap K L δ)).prod =
      algebraMap K L (adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α n) := sorry

/-- Jones's stability criterion, one step. -/
theorem irreducible_iterate_succ_of_not_isSquare {K : Type u} [Field K] (hK : ringChar K ≠ 2)
    (γ δ α : K) (n : ℕ)
    (hirr : Irreducible (((X - C γ) ^ 2 + C δ).comp^[n] X - C α))
    (hsq : ¬ IsSquare (adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α (n + 1))) :
    Irreducible (((X - C γ) ^ 2 + C δ).comp^[n + 1] X - C α) := sorry

/-- Jones's stability criterion: if no element of the adjusted critical orbit is a square, the
pair is stable. -/
theorem isStableAt_of_forall_not_isSquare {K : Type u} [Field K] (hK : ringChar K ≠ 2)
    (γ δ α : K) (h : ∀ n, 1 ≤ n → ¬ IsSquare (adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α n)) :
    IsStableAt ((X - C γ) ^ 2 + C δ) α := sorry

/-! ### Stoll's criterion -/

/-- `K_{n+1}` is generated over `K_n` by square roots of the `β - δ`. -/
theorem preimageField_succ_eq_adjoin_sqrt {K : Type u} [Field K] (γ δ α : K) (n : ℕ)
    (hsep : (((X - C γ) ^ 2 + C δ).comp^[n + 1] X - C α).Separable) :
    preimageField K ((X - C γ) ^ 2 + C δ) α (n + 1) =
      preimageField K ((X - C γ) ^ 2 + C δ) α n ⊔
        IntermediateField.adjoin K {y | ∃ β ∈ (((X - C γ) ^ 2 + C δ).comp^[n] X - C α).rootSet
          (SeparableClosure K), (y - algebraMap K _ γ) ^ 2 = β - algebraMap K _ δ} := sorry

/-- A finite `2`-group acting transitively on a finite set: a nonzero invariant subspace of
`ZMod 2`-valued functions contains the constant function `1`. -/
theorem one_mem_of_isPGroup_of_transitive {G : Type u} [Group G] [Finite G] {X : Type v}
    [Finite X] [MulAction G X] (hG : IsPGroup 2 G) (htrans : MulAction.IsPretransitive G X)
    (W : Submodule (ZMod 2) (X → ZMod 2)) (hW : W ≠ ⊥)
    (hinv : ∀ g : G, ∀ w ∈ W, (fun x => w (g⁻¹ • x)) ∈ W) : (fun _ => 1) ∈ W := sorry

/-- The Kummer step. -/
theorem stoll_kummer_step {K : Type u} [Field K] (hK : ringChar K ≠ 2) (γ δ α : K) (n : ℕ)
    (hirr : Irreducible (((X - C γ) ^ 2 + C δ).comp^[n] X - C α))
    (hc : adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α (n + 1) ≠ 0) :
    (preimageField K ((X - C γ) ^ 2 + C δ) α n).relfinrank
        (preimageField K ((X - C γ) ^ 2 + C δ) α (n + 1)) = 2 ^ 2 ^ n ↔
      ¬ ∃ s ∈ preimageField K ((X - C γ) ^ 2 + C δ) α n,
        s ^ 2 = algebraMap K _ (adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α (n + 1)) := sorry

open Classical in
/-- A square root of `cₙ` in `K_n`, transformed by the sign of the action on level `n`. -/
theorem exists_sqrt_adjustedCriticalOrbit {K : Type u} [Field K] (hK : ringChar K ≠ 2)
    (γ δ α : K) (n : ℕ) (hn : 1 ≤ n)
    [Fintype ((polyPreimageTree K (SeparableClosure K) ((X - C γ) ^ 2 + C δ) α).V n)]
    (hsep : (((X - C γ) ^ 2 + C δ).comp^[n] X - C α).Separable) :
    ∃ s ∈ preimageField K ((X - C γ) ^ 2 + C δ) α n,
      s ^ 2 = algebraMap K _ (adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α n) ∧
      ∀ σ : SeparableClosure K ≃ₐ[K] SeparableClosure K,
        σ s = ((Equiv.Perm.sign ((polyPreimageTree K (SeparableClosure K) ((X - C γ) ^ 2 + C δ)
          α).levelHom n (arborealRep K ((X - C γ) ^ 2 + C δ) α σ)) : ℤ) : SeparableClosure K) * s :=
  sorry

/-- Stoll's maximality criterion. -/
theorem stoll_maximality_criterion {K : Type u} [Field K] (hK : ringChar K ≠ 2) (γ δ α : K)
    (n : ℕ) (hsep : (((X - C γ) ^ 2 + C δ).comp^[n] X - C α).Separable) :
    levelImage K ((X - C γ) ^ 2 + C δ) α n = ⊤ ↔
      ∀ S : Finset ℕ, S.Nonempty → S ⊆ Finset.Icc 1 n →
        ¬ IsSquare (∏ i ∈ S, adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α i) := sorry

/-- Surjectivity of the arboreal representation of a quadratic polynomial. -/
theorem arborealRep_surjective_iff {K : Type u} [Field K] (hK : ringChar K ≠ 2) (γ δ α : K)
    (hsep : ∀ n, (((X - C γ) ^ 2 + C δ).comp^[n] X - C α).Separable) :
    Function.Surjective (arborealRep K ((X - C γ) ^ 2 + C δ) α) ↔
      ∀ S : Finset ℕ, S.Nonempty → 0 ∉ S →
        ¬ IsSquare (∏ i ∈ S, adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α i) := sorry

/-! ### Möbius quotients and Stoll's families -/

open scoped ArithmeticFunction.Moebius in
/-- The Möbius quotient `bₙ = ∏_{d ∣ n} c_d^{μ(n/d)}` of a sequence in a field. -/
noncomputable def mobiusQuotient {F : Type u} [Field F] (c : ℕ → F) (n : ℕ) : F :=
  ∏ d ∈ n.divisors, c d ^ (μ (n / d))

theorem mobiusQuotient_one {F : Type u} [Field F] (c : ℕ → F) : mobiusQuotient c 1 = c 1 := sorry

theorem prod_mobiusQuotient {F : Type u} [Field F] (c : ℕ → F) (hc : ∀ n, 1 ≤ n → c n ≠ 0)
    (n : ℕ) (hn : 1 ≤ n) : ∏ d ∈ n.divisors, mobiusQuotient c d = c n := sorry

theorem mobiusQuotient_prime {F : Type u} [Field F] (c : ℕ → F) {p : ℕ} (hp : p.Prime) :
    mobiusQuotient c p = c p / c 1 := sorry

theorem mobiusQuotient_map {F : Type u} {F' : Type v} [Field F] [Field F'] (φ : F →+* F')
    (c : ℕ → F) (n : ℕ) : mobiusQuotient (fun k => φ (c k)) n = φ (mobiusQuotient c n) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.mobiusQuotient.test_x_sq_add_one`: for the orbit
`-1, 2, 5, 26, …` of `x² + 1`, `b₂ = c₂/c₁ = -2` and `b₄ = c₄/c₂ = 13`. -/
example : mobiusQuotient (fun k => ((adjustedCriticalOrbit (X ^ 2 + 1 : ℤ[X]) 0 0 k : ℤ) : ℚ)) 2
      = -2 ∧
    mobiusQuotient (fun k => ((adjustedCriticalOrbit (X ^ 2 + 1 : ℤ[X]) 0 0 k : ℤ) : ℚ)) 4 = 13 :=
  sorry

/-- Unit test `TauCeti.ArithmeticDynamics.mobiusQuotient.test_constant`: the Möbius quotients of
the constant sequence `1` are `1`. -/
example {F : Type u} [Field F] (n : ℕ) : mobiusQuotient (fun _ => (1 : F)) n = 1 := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.mobiusQuotient.test_not_consecutive`: `b₆` is
`c₆ c₁ / (c₂ c₃)`, not `c₆ / c₅`. -/
example {F : Type u} [Field F] (c : ℕ → F) (hc : ∀ n, c n ≠ 0) :
    mobiusQuotient c 6 = c 6 * c 1 / (c 2 * c 3) := sorry

/-- Unit test `TauCeti.ArithmeticDynamics.mobiusQuotient.test_inversion`: Möbius inversion at
`n = 4`: `b₁ b₂ b₄ = c₄`. -/
example {F : Type u} [Field F] (c : ℕ → F) (hc : ∀ n, c n ≠ 0) :
    mobiusQuotient c 1 * mobiusQuotient c 2 * mobiusQuotient c 4 = c 4 := sorry

/-- Strong divisibility of the critical orbit of `x² + a`. -/
theorem gcd_adjustedCriticalOrbit_X_sq_add (a : ℤ) (m n : ℕ) :
    Int.gcd (adjustedCriticalOrbit (X ^ 2 + C a) 0 0 m) (adjustedCriticalOrbit (X ^ 2 + C a) 0 0 n)
      = (adjustedCriticalOrbit (X ^ 2 + C a) 0 0 (Nat.gcd m n)).natAbs := sorry

/-- The critical orbit of `x² + a` is positive from index `2` on when `-a` is not a square. -/
theorem adjustedCriticalOrbit_X_sq_add_pos (a : ℤ) (ha : ¬ IsSquare (-a)) {n : ℕ} (hn : 2 ≤ n) :
    0 < adjustedCriticalOrbit (X ^ 2 + C a) 0 0 n := sorry

/-- Stoll's Lemma 1.1: the Möbius quotients of the critical orbit of `x² + a` are pairwise coprime
integers. -/
theorem mobiusQuotient_X_sq_add_integral_coprime (a : ℤ) (ha : ¬ IsSquare (-a)) :
    ∃ b : ℕ → ℤ, (∀ n, 1 ≤ n → (b n : ℚ) =
        mobiusQuotient (fun k => ((adjustedCriticalOrbit (X ^ 2 + C a) 0 0 k : ℤ) : ℚ)) n) ∧
      ∀ m n, 1 ≤ m → 1 ≤ n → m ≠ n → IsCoprime (b m) (b n) := sorry

/-- Stoll's Theorem, part 2: if no `|bₘ|`, `2 ≤ m ≤ n`, is a square then `G_n = Aut(T_n)`. -/
theorem levelImage_X_sq_add_eq_top_of_not_isSquare (a : ℤ) (ha : ¬ IsSquare (-a)) (n : ℕ)
    (h : ∀ m, 2 ≤ m → m ≤ n → ¬ IsSquare
      |mobiusQuotient (fun k => ((adjustedCriticalOrbit (X ^ 2 + C a) 0 0 k : ℤ) : ℚ)) m|) :
    levelImage ℚ (X ^ 2 + C (a : ℚ)) 0 n = ⊤ := sorry

/-- Stoll's Lemma 2.1, for the iteration sequence of an even integer polynomial. -/
theorem not_isSquare_mobiusQuotient_of_dvd_add (g : ℤ[X]) (hg : g.comp (-X) = g) (γ : ℕ → ℤ)
    (hγ1 : γ 1 = g.eval 0 ∨ γ 1 = -g.eval 0) (hγ : ∀ n, 1 ≤ n → γ (n + 1) = g.eval (γ n))
    (hne : ∀ n, 1 ≤ n → γ n ≠ 0)
    (hm : ∀ n, 1 ≤ n → ∃ m : ℕ, (m : ℤ) ∣ γ n + γ (2 * n) ∧ IsCoprime (m : ℤ) (γ n) ∧
      ¬ IsSquare (-1 : ZMod m)) (n : ℕ) (hn : 2 ≤ n) :
    ¬ IsSquare (mobiusQuotient (fun k => (γ k : ℚ)) n) := sorry

/-- Stoll's Lemma 2.2: the congruence conditions that feed Lemma 2.1. -/
theorem not_isSquare_mobiusQuotient_of_congr (g : ℤ[X]) (hg : g.comp (-X) = g) (γ : ℕ → ℤ)
    (hγ1 : γ 1 = g.eval 0 ∨ γ 1 = -g.eval 0) (hγ : ∀ n, 1 ≤ n → γ (n + 1) = g.eval (γ n))
    (hpos : ∀ n, 1 ≤ n → 0 < γ n)
    (hcong : (g.eval 0 = 1 ∧ g.eval 1 % 4 = 2) ∨
      ((g.eval 0 = 1 ∨ g.eval 0 = -1) ∧ g.eval 1 % 4 = 3)) (n : ℕ) (hn : 2 ≤ n) :
    ¬ IsSquare (mobiusQuotient (fun k => (γ k : ℚ)) n) := sorry

/-- Stoll's theorem: three families of `x² + a` over `ℚ` with surjective arboreal
representation. -/
theorem stoll_levelImage_eq_top (a : ℤ)
    (ha : (0 < a ∧ a % 4 = 1) ∨ (0 < a ∧ a % 4 = 2) ∨ (a < 0 ∧ a % 4 = 0 ∧ ¬ IsSquare (-a)))
    (n : ℕ) : levelImage ℚ (X ^ 2 + C (a : ℚ)) 0 n = ⊤ := sorry

/-- The worked example: the arboreal representation of `x² + 1` over `ℚ` at `0` is surjective. -/
theorem arborealRep_X_sq_add_one_surjective :
    Function.Surjective (arborealRep ℚ (X ^ 2 + 1 : ℚ[X]) 0) := sorry

/-! ### Discriminants and ramification -/

/-- The discriminant recursion for iterates (Aitken–Hajir–Maire, corrected for a non-monic `f`):
for `f` of degree `d` with leading coefficient `a`, `d ≠ 0` in `K`, and the multiset `R` of
roots of `f'` in an algebraically closed `L`. -/
theorem discr_iterate_sub_succ {K : Type u} [Field K] (f : K[X]) (hd : (f.natDegree : K) ≠ 0)
    (α : K) (n : ℕ) {L : Type v} [Field L] [Algebra K L] [IsAlgClosed L] :
    algebraMap K L (f.comp^[n + 1] X - C α).discr =
      algebraMap K L ((-1) ^ (f.natDegree * (f.natDegree - 1) / 2) * (f.natDegree : K) ^ f.natDegree
          * f.leadingCoeff ^ (f.natDegree - 1)) ^ (f.natDegree ^ n) *
        algebraMap K L f.leadingCoeff ^ ((f.natDegree ^ n - 1) * (f.natDegree ^ (n + 1) + 1)) *
        algebraMap K L (f.comp^[n] X - C α).discr ^ f.natDegree *
        (((derivative f).map (algebraMap K L)).roots.map
          (fun r => aeval r (f.comp^[n + 1] X - C α))).prod := sorry

/-- The discriminant of iterates of a monic quadratic. -/
theorem discr_quadratic_iterate {K : Type u} [Field K] (γ δ α : K) (n : ℕ) (hn : 1 ≤ n) :
    (((X - C γ) ^ 2 + C δ).comp^[n + 1] X - C α).discr =
      2 ^ 2 ^ (n + 1) * (((X - C γ) ^ 2 + C δ).comp^[n] X - C α).discr ^ 2 *
        adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α (n + 1) ∧
    (((X - C γ) ^ 2 + C δ) - C α).discr = 4 * adjustedCriticalOrbit ((X - C γ) ^ 2 + C δ) γ α 1 :=
  sorry

open scoped NumberField in
/-- An odd prime at which no element `c₁, …, cₙ` has positive valuation is unramified in `K_n`. -/
theorem isUnramifiedIn_preimageField (b c α : ℤ) (n : ℕ) (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (hsep : ((X ^ 2 + C (b : ℚ) * X + C (c : ℚ)).comp^[n] X - C (α : ℚ)).Separable)
    [NumberField (preimageField ℚ (X ^ 2 + C (b : ℚ) * X + C (c : ℚ)) α n)]
    (hv : ∀ k, 1 ≤ k → k ≤ n → padicValRat p (adjustedCriticalOrbit
      (X ^ 2 + C (b : ℚ) * X + C (c : ℚ)) (-(b : ℚ) / 2) α k) = 0) :
    Algebra.IsUnramifiedIn (𝓞 (preimageField ℚ (X ^ 2 + C (b : ℚ) * X + C (c : ℚ)) α n))
      (Ideal.span {(p : ℤ)}) := sorry

open scoped NumberField in
/-- An element of `ℚ` of odd valuation at a prime unramified in a number field is not a square
there. -/
theorem not_isSquare_of_odd_padicValRat {L : Type u} [Field L] [NumberField L] (p : ℕ)
    [Fact p.Prime] (hp : Algebra.IsUnramifiedIn (𝓞 L) (Ideal.span {(p : ℤ)})) (q : ℚ)
    (hq : Odd (padicValRat p q)) : ¬ IsSquare (algebraMap ℚ L q) := sorry

/-- Jones's ramification criterion. -/
theorem jones_ramification_criterion (b c α : ℤ) (n : ℕ) (hn : 1 ≤ n) (p : ℕ) [Fact p.Prime]
    (hp : p ≠ 2)
    (hirr : Irreducible ((X ^ 2 + C (b : ℚ) * X + C (c : ℚ)).comp^[n] X - C (α : ℚ)))
    (hodd : Odd (padicValRat p (adjustedCriticalOrbit (X ^ 2 + C (b : ℚ) * X + C (c : ℚ))
      (-(b : ℚ) / 2) α (n + 1))))
    (hv : ∀ k, 1 ≤ k → k ≤ n → padicValRat p (adjustedCriticalOrbit
      (X ^ 2 + C (b : ℚ) * X + C (c : ℚ)) (-(b : ℚ) / 2) α k) = 0) :
    (preimageField ℚ (X ^ 2 + C (b : ℚ) * X + C (c : ℚ)) α n).relfinrank
      (preimageField ℚ (X ^ 2 + C (b : ℚ) * X + C (c : ℚ)) α (n + 1)) = 2 ^ 2 ^ n := sorry

/-! ### Index statements -/

/-- The index recursion. -/
theorem levelImage_index_succ {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree) (α : K)
    (hsep : ∀ n, (f.comp^[n] X - C α).Separable) (n : ℕ) :
    (levelImage K f α (n + 1)).index *
        (preimageField K f α n).relfinrank (preimageField K f α (n + 1)) =
      (levelImage K f α n).index * f.natDegree.factorial ^ (f.natDegree ^ n) := sorry

/-- The index of the arboreal image is the supremum of the finite-level indices. -/
theorem arborealImage_finiteIndex_iff {K : Type u} [Field K] (f : K[X]) (hf : 0 < f.natDegree)
    (α : K) (hsep : ∀ n, (f.comp^[n] X - C α).Separable) :
    ((arborealImage K f α).FiniteIndex ↔
        BddAbove (Set.range fun n => (levelImage K f α n).index)) ∧
      ((arborealImage K f α).FiniteIndex →
        (arborealImage K f α).index = ⨆ n, (levelImage K f α n).index) := sorry

/-- For `x^d + b` with `d ≥ 3` the arboreal image has infinite index. -/
theorem not_finiteIndex_arborealImage_unicritical {K : Type u} [Field K] (d : ℕ) (hd : 3 ≤ d)
    (hdK : (d : K) ≠ 0) (b α : K) (hsep : ∀ n, ((X ^ d + C b).comp^[n] X - C α).Separable) :
    ¬ (arborealImage K (X ^ d + C b) α).FiniteIndex := sorry

/-! ### Odoni's theorem -/

/-- The shift trick: `g(x) = f(x + t) - t` has `gⁿ(x) = fⁿ(x + t) - t`. -/
theorem iterate_shift_eq {R : Type u} [CommRing R] (f : R[X]) (t : R) (n : ℕ) :
    ((f.comp (X + C t)) - C t).comp^[n] X = (f.comp^[n] X).comp (X + C t) - C t := sorry

/-- Galois groups do not grow under specialization, compatibly with the trees. -/
theorem levelImage_specialization {A : Type u} [CommRing A] [IsDomain A] [IsIntegrallyClosed A]
    (𝔭 : Ideal A) [𝔭.IsPrime] (f : A[X]) (hf : f.Monic) (α : A)
    (hsep : ∀ n, (((f.map (algebraMap A (FractionRing (A ⧸ 𝔭)))).comp^[n] X -
      C (algebraMap A (FractionRing (A ⧸ 𝔭)) α))).Separable) (N : ℕ) :
    ∃ e : (polyPreimageTree (FractionRing (A ⧸ 𝔭)) (SeparableClosure (FractionRing (A ⧸ 𝔭)))
        (f.map (algebraMap A _)) (algebraMap A _ α)).Iso
        (polyPreimageTree (FractionRing A) (SeparableClosure (FractionRing A))
          (f.map (algebraMap A _)) (algebraMap A _ α)),
      (levelImage (FractionRing (A ⧸ 𝔭)) (f.map (algebraMap A _)) (algebraMap A _ α) N).map
          (e.truncAutCongr N).toMonoidHom ≤
        levelImage (FractionRing A) (f.map (algebraMap A _)) (algebraMap A _ α) N := sorry

/- Juul's Corollary 2.8 (inertia at a prime exactly dividing the discriminant acts as a
transposition), Juul's Lemma 2.11 (no nontrivial extension of `k(t)` unramified at the finite
places and tame at infinity) and Juul's Lemma 3.3 (disjoint ramification) are left out: their
statements need the places, inertia groups and different of Tau Ceti's AlgebraicCurves layers
6–8, which are not in Mathlib at the pin. -/

/-- The first level over `k(t)`: simple critical points with distinct critical values give the
full symmetric group. -/
theorem levelImage_ratFunc_one_eq_top (k : Type u) [Field k] [IsAlgClosed k] [CharZero k]
    (f : k[X]) (hd : 2 ≤ f.natDegree) (hsep : (derivative f).Separable)
    (hval : ∀ a b, (derivative f).IsRoot a → (derivative f).IsRoot b → f.eval a = f.eval b → a = b) :
    levelImage (RatFunc k) (f.map (algebraMap k (RatFunc k))) RatFunc.X 1 = ⊤ := sorry

/-- Juul's Theorem 3.1 for polynomials in characteristic zero. -/
theorem juul_levelImage_ratFunc_eq_top (k : Type u) [Field k] [IsAlgClosed k] [CharZero k]
    (f : k[X]) (hd : 2 ≤ f.natDegree) (N : ℕ)
    (h1 : levelImage (RatFunc k) (f.map (algebraMap k (RatFunc k))) RatFunc.X 1 = ⊤)
    (a : k) (ha : (derivative f).rootMultiplicity a = 1)
    (horb : ∀ b, (derivative f).IsRoot b → ∀ m n, 1 ≤ m → m ≤ n → n ≤ N →
      (fun x => f.eval x)^[n] a = (fun x => f.eval x)^[m] b → m = n ∧ b = a) :
    levelImage (RatFunc k) (f.map (algebraMap k (RatFunc k))) RatFunc.X N = ⊤ := sorry

/-- Juul's Lemma 3.6 in characteristic zero: polynomials with simple critical points and no
critical orbit relations up to `N` exist in every degree. -/
theorem exists_polynomial_no_critical_relations (k : Type u) [Field k] [IsAlgClosed k]
    [CharZero k] (d : ℕ) (hd : 2 ≤ d) (N : ℕ) :
    ∃ f : k[X], f.natDegree = d ∧ (derivative f).Separable ∧
      ∀ a b, (derivative f).IsRoot a → (derivative f).IsRoot b → ∀ m n, 1 ≤ m → 1 ≤ n →
        m ≤ N → n ≤ N → (fun x => f.eval x)^[n] a = (fun x => f.eval x)^[m] b → m = n ∧ a = b :=
  sorry

/-- Odoni's theorem: the generic monic polynomial of degree `d` over a field of characteristic
zero has full arboreal image at every level. -/
theorem odoni_generic (k : Type u) [Field k] [CharZero k] (d : ℕ) (hd : 2 ≤ d) (n : ℕ) :
    levelImage (FractionRing (MvPolynomial (Fin d) k))
      (X ^ d + ∑ i : Fin d, C (algebraMap (MvPolynomial (Fin d) k) _ (MvPolynomial.X i)) *
        X ^ (i : ℕ)) 0 n = ⊤ := sorry

end DY5

end TauCeti.ArithmeticDynamics

end DY5File


-- ===== DY.6 =====

section DY6File

/-!
# Suggested Lean: ArithmeticDynamics, layer DY.6 (families, unlikely intersections and frontiers)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Everything is proved by `sorry`.

It is appended after the DY.0–DY.5 sections and uses their declarations: DY.0's `RationalMap`
(with `mk`, `toEnd`, `degree`, `ofPolynomial`, `toRatFunc`, `map`, `projMap`, powers and
products, conjugation by `PGL(2, K)`, `criticalPoints`, `ModuliSpace`, `HasGoodReduction`),
`HomogeneousLift`, `binaryResultant`, `IsPreperiodicPt` and `preperiodicPts`; DY.1's
`projLineAbsLogHeight`, `tateLimit`, `RationalMap.canonicalHeight` and
`RationalMap.relCanonicalHeight`; DY.2's `escapeRate`, `cycleMultiplier` and
`archimedeanCanonicalMeasure`; DY.3's `UniformBoundednessConjecture`; DY.4's
`RationalMap.azPairing`. Points of `ℙ¹(K)` are Mathlib's `ℙ K (Fin 2 → K)`: `[x : 1]` is
`Projectivization.mk K ![x, 1] _` and `∞ = [1 : 0]`.

Tau Ceti is not built in this environment. Where a Tau Ceti declaration is the natural input it is
named in a comment:
* `WeierstrassCurve.Affine.Point.canonicalHeight` (Néron–Tate height, `CanonicalHeight.lean`),
* `WeierstrassCurve.isCoprime_Φ_ΨSq`, `WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul`
  (division polynomials and the `x`-coordinate of `n • P`),
* `TauCeti.Isogeny.mulByIntIsogeny_comp_mulByIntIsogeny`,
  `TauCeti.Isogeny.pullbackDifferential_mulByIntIsogeny_invariantDifferential`.

The namespace `DY6Interface` keeps, as clearly marked stand-ins, only objects of external
suppliers: Tau Ceti's Néron–Tate height (written with DY.1's `tateLimit`), the local energy of two
Legendre maps at a completion (the mutual energy of `TropicalAndBerkovichArithmetic:TB.6` of DY.2's
canonical measures), and an ample Weil height on DY.0's moduli space
(`HeightsRationalPointsAndObstructions:RP.0`).
-/

namespace TauCeti.ArithmeticDynamics

section DY6

open Polynomial Filter
open scoped LinearAlgebra.Projectivization MatrixGroups

/-! ### Stand-ins for external suppliers (Tau Ceti, TB.6, RP.0) -/

namespace DY6Interface

/-- Stand-in for Tau Ceti's `WeierstrassCurve.Affine.Point.canonicalHeight`: the Néron–Tate height
`½ lim h(x(2ⁿP))/4ⁿ` relative to a field with admissible absolute values (DY.1's `tateLimit` of
doubling and the naive `x`-coordinate height, halved), normalised to `(O)`. -/
noncomputable def neronTate {F : Type*} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
    (W : WeierstrassCurve F) (P : W.toAffine.Point) : ℝ :=
  tateLimit (fun Q : W.toAffine.Point => 2 • Q) (fun Q => Height.logHeight Q.xRep) 4 P / 2

/-- Stand-in for `TropicalAndBerkovichArithmetic:TB.6` applied to DY.2: the local energy
`E_v(t₁, t₂) = ½ (µ_{t₁} − µ_{t₂}, µ_{t₁} − µ_{t₂})_v` of the canonical measures of two Legendre maps
over a complete field `L` (DY.4's `RationalMap.localEnergy` at a place). The mutual energy on the
Berkovich line over `L` is not available. -/
noncomputable def legendreLocalEnergy {L : Type*} [NormedField L] (t₁ t₂ : L) : ℝ := sorry

/-- Stand-in for `HeightsRationalPointsAndObstructions:RP.0`: an ample Weil height on DY.0's moduli
space `M_d(ℚ̄)`. -/
noncomputable def moduliHeight (d : ℕ) : ModuliSpace (AlgebraicClosure ℚ) d → ℝ := sorry

end DY6Interface

open DY6Interface

/-- The absolute logarithmic height `h(t₁, t₂)` of the point `[t₁ : t₂ : 1]` of `ℙ²`, for `t₁, t₂` in
a number field: Mathlib's relative `Height.logHeight` divided by `[K : ℚ]`. -/
noncomputable def pairHeight {K : Type*} [Field K] [NumberField K] (t₁ t₂ : K) : ℝ :=
  Height.logHeight ![t₁, t₂, 1] / Module.finrank ℚ K

/-! ### Power maps (`DY.6/power-map`) -/

/-- The power map `z ↦ z^d` on `ℙ¹_K`, DY.0's polynomial map of `X ^ d`. -/
noncomputable def powerMap (K : Type*) [Field K] (d : ℕ) : RationalMap K :=
  RationalMap.ofPolynomial (X ^ d)

section PowerMap

variable {K : Type*} [Field K]

theorem powerMap_apply (d : ℕ) (hd : 1 ≤ d) (z : K) :
    RationalMap.toEnd (powerMap K d) (Projectivization.mk K ![z, 1] (by simp)) =
        Projectivization.mk K ![z ^ d, 1] (by simp) ∧
      RationalMap.toEnd (powerMap K d) (Projectivization.mk K ![1, 0] (by simp)) =
        Projectivization.mk K ![1, 0] (by simp) := sorry

theorem powerMap_comp (d e : ℕ) : powerMap K d * powerMap K e = powerMap K (d * e) := sorry

theorem powerMap_iterate (d n : ℕ) : powerMap K d ^ n = powerMap K (d ^ n) := sorry

theorem powerMap_degree (d : ℕ) : (powerMap K d).degree = d := sorry

/-- `Res(X^d, Y^d) = 1`, so `P_d` has good reduction (DY.0) over every valuation ring of `K`. -/
theorem powerMap_resultant (d : ℕ) :
    binaryResultant d d (MvPolynomial.X 0 ^ d : MvPolynomial (Fin 2) K) (MvPolynomial.X 1 ^ d) =
        1 ∧
      ∀ R : ValuationSubring K, (powerMap K d).HasGoodReduction R := sorry

/-- `P_d` commutes with `ι(z) = 1/z` (the element of `PGL₂(K)` exchanging `0` and `∞` and fixing
`1`) and with `z ↦ ζz` for every `(d − 1)`-th root of unity `ζ` (DY.0's conjugation action). -/
theorem powerMap_conj_inv (d : ℕ) (hd : 1 ≤ d) :
    (∀ γ : PGL(2, K),
      γ • Projectivization.mk K ![(0 : K), 1] (by simp) = Projectivization.mk K ![(1 : K), 0] (by simp) →
      γ • Projectivization.mk K ![(1 : K), 0] (by simp) = Projectivization.mk K ![(0 : K), 1] (by simp) →
      γ • Projectivization.mk K ![(1 : K), 1] (by simp) = Projectivization.mk K ![(1 : K), 1] (by simp) →
        γ • powerMap K d = powerMap K d) ∧
    ∀ ζ : K, ζ ^ (d - 1) = 1 → ∀ γ : PGL(2, K),
      γ • Projectivization.mk K ![(0 : K), 1] (by simp) = Projectivization.mk K ![(0 : K), 1] (by simp) →
      γ • Projectivization.mk K ![(1 : K), 0] (by simp) = Projectivization.mk K ![(1 : K), 0] (by simp) →
      γ • Projectivization.mk K ![(1 : K), 1] (by simp) = Projectivization.mk K ![ζ, 1] (by simp) →
        γ • powerMap K d = powerMap K d := sorry

theorem powerMap_isFixedPt_iff (d : ℕ) (hd : 2 ≤ d) (x : ℙ K (Fin 2 → K)) :
    Function.IsFixedPt (RationalMap.toEnd (powerMap K d)) x ↔
      x = Projectivization.mk K ![1, 0] (by simp) ∨ x = Projectivization.mk K ![0, 1] (by simp) ∨
        ∃ z : K, x = Projectivization.mk K ![z, 1] (by simp) ∧ z ^ (d - 1) = 1 := sorry

/-- DY.2's cycle multipliers of `P_d`: `0` at the fixed points `0` and `∞`, and `dⁿ` on the cycle of
a root of unity of exact period `n` (`d` at a fixed root of unity). -/
theorem powerMap_multiplier (d : ℕ) (hd : 2 ≤ d) :
    cycleMultiplier (powerMap K d) (Projectivization.mk K ![0, 1] (by simp)) = 0 ∧
      cycleMultiplier (powerMap K d) (Projectivization.mk K ![1, 0] (by simp)) = 0 ∧
      ∀ z : K, z ≠ 0 → Projectivization.mk K ![z, 1] (by simp) ∈
          Function.periodicPts (RationalMap.toEnd (powerMap K d)) →
        cycleMultiplier (powerMap K d) (Projectivization.mk K ![z, 1] (by simp)) =
          (d : K) ^ Function.minimalPeriod (RationalMap.toEnd (powerMap K d))
            (Projectivization.mk K ![z, 1] (by simp)) := sorry

theorem powerMap_map {L : Type*} [Field L] (σ : K →+* L) (d : ℕ) :
    RationalMap.map σ (powerMap K d) = powerMap L d := sorry

end PowerMap

/-- Unit test `powerMap_two_iterate_three`: `P₂³(2) = 256` and `P₂³(∞) = ∞` over `ℚ`. -/
example : (RationalMap.toEnd (powerMap ℚ 2))^[3] (Projectivization.mk ℚ ![2, 1] (by simp)) =
      Projectivization.mk ℚ ![256, 1] (by simp) ∧
    (RationalMap.toEnd (powerMap ℚ 2))^[3] (Projectivization.mk ℚ ![1, 0] (by simp)) =
      Projectivization.mk ℚ ![1, 0] (by simp) := sorry

/-- Unit test `powerMap_one`: `P₁` is the identity rational map. -/
example (K : Type*) [Field K] : powerMap K 1 = 1 := sorry

/-- Unit test `powerMap_canonicalHeight_eq`: `ĥ_{P_d} = h` on `ℙ¹(ℚ̄)` (DY.1). -/
example (d : ℕ) (hd : 2 ≤ d) (x : AlgebraicClosure ℚ) :
    (powerMap (AlgebraicClosure ℚ) d).canonicalHeight
      (Projectivization.mk _ ![x, 1] (by simp)) = NumberField.absLogHeight₁ x :=
  sorry

/-- Unit test `powerMap_two_not_preperiodic`: `2` is not preperiodic for `P₂` over `ℚ`, while
roots of unity are. -/
example : ¬ IsPreperiodicPt (RationalMap.toEnd (powerMap ℚ 2))
      (Projectivization.mk ℚ ![2, 1] (by simp)) ∧
    IsPreperiodicPt (RationalMap.toEnd (powerMap ℚ 2)) (Projectivization.mk ℚ ![-1, 1] (by simp)) :=
  sorry

/-- `DY.6/power-map-preperiodic-points`. -/
theorem powerMap_isPreperiodic_iff {K : Type*} [Field K] (d : ℕ) (hd : 2 ≤ d)
    (x : ℙ K (Fin 2 → K)) :
    IsPreperiodicPt (RationalMap.toEnd (powerMap K d)) x ↔
      x = Projectivization.mk K ![1, 0] (by simp) ∨ x = Projectivization.mk K ![0, 1] (by simp) ∨
        ∃ z : K, x = Projectivization.mk K ![z, 1] (by simp) ∧ IsOfFinOrder z := sorry

/-- `DY.6/power-map-preperiodic-points`, periodic points. -/
theorem powerMap_isPeriodicPt_iff {K : Type*} [Field K] (d : ℕ) (hd : 2 ≤ d) (z : K) (hz : z ≠ 0) :
    (∃ n, 0 < n ∧ Function.IsPeriodicPt (RationalMap.toEnd (powerMap K d)) n
        (Projectivization.mk K ![z, 1] (by simp))) ↔
      IsOfFinOrder z ∧ Nat.Coprime (orderOf z) d := sorry

/-- `DY.6/power-map-escape-rate`: DY.2's escape rate of the lift `(X^d, Y^d)` of `P_d` is
`G(z, w) = log max(|z|, |w|)`. -/
theorem powerMap_escapeRate {L : Type*} [NormedField L] (d : ℕ) (hd : 2 ≤ d)
    (F : HomogeneousLift L d)
    (hF : F.forms = ![MvPolynomial.X 0 ^ d, MvPolynomial.X 1 ^ d]) (x : Fin 2 → L) (hx : x ≠ 0) :
    escapeRate (NormedField.toAbsoluteValue L) F x = Real.log (⨆ i, ‖x i‖) := sorry

/-- `DY.6/power-map-dynatomic-polynomials`: the affine dynatomic polynomial of `z^d`, formed in
`ℚ(X)` by Möbius inversion, is `X^{[n = 1]}` times the product of the cyclotomic polynomials `Φ_m`
with `ord_m(d) = n`. -/
theorem powerMap_dynatomic (d n : ℕ) (hd : 2 ≤ d) (hn : 1 ≤ n) :
    (∏ k ∈ n.divisors,
        (algebraMap ℚ[X] (RatFunc ℚ) (X ^ (d ^ k) - X)) ^ (ArithmeticFunction.moebius (n / k))) =
      algebraMap ℚ[X] (RatFunc ℚ) ((if n = 1 then X else 1) *
        ∏ m ∈ (d ^ n - 1).divisors.filter (fun m => orderOf (d : ZMod m) = n), cyclotomic m ℚ) :=
  sorry

/-- `DY.6/power-map-preimage-tree`: the Galois action on the `dⁿ`-th roots of `a` is affine. -/
theorem powerMap_preimage_galois_affine {K : Type*} [Field K] [CharZero K] (d n : ℕ) (hd : 2 ≤ d)
    (a : K) (ha : a ≠ 0) (ζ β : AlgebraicClosure K) (hζ : IsPrimitiveRoot ζ (d ^ n))
    (hβ : β ^ (d ^ n) = algebraMap K _ a) (σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K) :
    ∃ u b : ZMod (d ^ n), IsUnit u ∧ ∀ i : ℕ,
      σ (ζ ^ i * β) = ζ ^ ((u * i + b : ZMod (d ^ n)).val) * β := sorry

/-! ### Heights on `k(t)` (`DY.6/rational-function-field-heights`) -/

section RatFuncHeights

variable {k : Type*} [Field k]

/-- The admissible absolute values of `k(t)`: `|g|_π = exp(−deg π · ord_π g)` for each monic
irreducible `π` and `|g|_∞ = exp(deg num g − deg denom g)`; no archimedean absolute values. -/
noncomputable instance ratFuncAdmissibleAbsValues : Height.AdmissibleAbsValues (RatFunc k) := sorry

theorem ratFunc_logHeight₁_eq (g : RatFunc k) :
    Height.logHeight₁ g = max g.num.natDegree g.denom.natDegree := sorry

theorem ratFunc_logHeight_eq (p q : k[X]) (hpq : IsCoprime p q) (hne : p ≠ 0 ∨ q ≠ 0) :
    Height.logHeight ![algebraMap k[X] (RatFunc k) p, algebraMap k[X] (RatFunc k) q] =
      max p.natDegree q.natDegree := sorry

theorem ratFunc_totalWeight : Height.totalWeight (RatFunc k) = 0 := sorry

theorem ratFunc_logHeight₁_comp (g u : RatFunc k) (hg : ∀ c, g ≠ RatFunc.C c)
    (hu : ∀ c, u ≠ RatFunc.C c) :
    Height.logHeight₁ (RatFunc.eval (algebraMap k (RatFunc k)) u g) =
      Height.logHeight₁ g * Height.logHeight₁ u := sorry

theorem ratFunc_logHeight_map_constants {k' : Type*} [Field k'] (σ : k →+* k') (p q : k[X])
    (hpq : IsCoprime p q) (hne : p ≠ 0 ∨ q ≠ 0) :
    Height.logHeight
        ![algebraMap k'[X] (RatFunc k') (p.map σ), algebraMap k'[X] (RatFunc k') (q.map σ)] =
      Height.logHeight ![algebraMap k[X] (RatFunc k) p, algebraMap k[X] (RatFunc k) q] := sorry

end RatFuncHeights

/-- Unit test `ratFunc_logHeight₁_example`: `h((t² + 1)/(t − 1)) = 2` in `ℚ(t)`. -/
example : Height.logHeight₁ ((RatFunc.X ^ 2 + 1) / (RatFunc.X - 1) : RatFunc ℚ) = 2 := sorry

/-- Unit test `ratFunc_logHeight₁_C`: constants have height `0` and `h(t) = 1`. -/
example (k : Type*) [Field k] (c : k) :
    Height.logHeight₁ (RatFunc.C c : RatFunc k) = 0 ∧
      Height.logHeight₁ (RatFunc.X : RatFunc k) = 1 :=
  sorry

/-- Unit test `ratFunc_logHeight₁_eq_finrank`: `h(g) = [k(t) : k(g)]` for nonconstant `g`. -/
example (k : Type*) [Field k] (g : RatFunc k) (hg : ∀ c, g ≠ RatFunc.C c) :
    Height.logHeight₁ g = Module.finrank (IntermediateField.adjoin k {g}) (RatFunc k) := sorry

/-- Unit test `ratFunc_logHeight₁_ne_intDegree`: `h(1/t) = 1` while `intDegree (1/t) = −1`. -/
example (k : Type*) [Field k] :
    Height.logHeight₁ (RatFunc.X⁻¹ : RatFunc k) = 1 ∧
      RatFunc.intDegree (RatFunc.X⁻¹ : RatFunc k) = -1 :=
  sorry

/-! The relative canonical height over `k(t)` is DY.1's `RationalMap.relCanonicalHeight` for the
instance `ratFuncAdmissibleAbsValues` (node `DY.1/canonical-height-over-a-global-height-field`). -/

/-- `DY.6/function-field-height-bound`: DY.1's height estimate for a map over `k(t)`. -/
theorem functionField_height_bound {k : Type*} [Field k] (f : RationalMap (RatFunc k))
    (hf : 1 ≤ f.degree) :
    ∃ C, ∀ P : ℙ (RatFunc k) (Fin 2 → RatFunc k),
      |Projectivization.logHeight (RationalMap.toEnd f P) -
        f.degree * Projectivization.logHeight P| ≤ C := sorry

/-! ### Specialisation (`DY.6/specialization-of-rational-maps`) -/

section Specialization

variable {k : Type*} [Field k]

/-- A primitive representative `(F, G)` of a family `f` over `k(t)`: binary forms of degree
`deg f` with coefficients in `k[t]` whose coefficients have no common factor, mapping to a lift of
`f`. -/
noncomputable def familyForms (f : RationalMap (RatFunc k)) : Fin 2 → MvPolynomial (Fin 2) k[X] :=
  sorry

/-- The good set `T⁰(f)`: parameters at which DY.0's resultant of the primitive representative
does not vanish. -/
noncomputable def goodSet (f : RationalMap (RatFunc k)) : Set (AlgebraicClosure k) :=
  {t₀ | Polynomial.aeval t₀
    (binaryResultant f.degree f.degree (familyForms f 0) (familyForms f 1)) ≠ 0}

/-- The specialisation `f_{t₀} = [F_{t₀} : G_{t₀}]` for `t₀ ∈ T⁰(f)` (junk value `1` otherwise). -/
noncomputable def specialize (f : RationalMap (RatFunc k)) (t₀ : AlgebraicClosure k) :
    RationalMap (AlgebraicClosure k) :=
  open scoped Classical in
  if t₀ ∈ goodSet f then
    RationalMap.mk (d := f.degree)
      ⟨fun i ↦ MvPolynomial.map (Polynomial.aeval t₀).toRingHom (familyForms f i), sorry, sorry,
        sorry⟩
  else 1

/-- The specialisation `P_{t₀} = [p(t₀) : q(t₀)]` of a point `P = [p : q]` of `ℙ¹(k(t))`, `p, q`
coprime in `k[t]`. -/
noncomputable def specializePoint (P : ℙ (RatFunc k) (Fin 2 → RatFunc k))
    (t₀ : AlgebraicClosure k) : ℙ (AlgebraicClosure k) (Fin 2 → AlgebraicClosure k) :=
  open scoped Classical in
  OnePoint.elim ((OnePoint.equivProjectivization (RatFunc k)).symm P)
    (Projectivization.mk _ ![1, 0] (by simp))
    (fun g ↦ if Polynomial.aeval t₀ g.denom = 0 then Projectivization.mk _ ![1, 0] (by simp)
      else Projectivization.mk _ ![Polynomial.aeval t₀ g.num / Polynomial.aeval t₀ g.denom, 1]
        (by simp))

theorem goodSet_compl_finite (f : RationalMap (RatFunc k)) (hf : 1 ≤ f.degree) :
    (goodSet f)ᶜ.Finite := sorry

theorem specialize_degree (f : RationalMap (RatFunc k)) (t₀ : AlgebraicClosure k)
    (ht₀ : t₀ ∈ goodSet f) : (specialize f t₀).degree = f.degree := sorry

theorem specialize_iterate (f : RationalMap (RatFunc k)) (t₀ : AlgebraicClosure k)
    (ht₀ : t₀ ∈ goodSet f) (n : ℕ) : specialize (f ^ n) t₀ = specialize f t₀ ^ n := sorry

/-- Any representative `Φ` of `f` over `k[t]` of degree `deg f` gives the same specialisation at
`t₀ ∈ T⁰(f)`, whenever its specialised forms are still a lift. -/
theorem specialize_wellDefined (f : RationalMap (RatFunc k)) (Φ : Fin 2 → MvPolynomial (Fin 2) k[X])
    (F : HomogeneousLift (RatFunc k) f.degree) (hF : RationalMap.mk F = f)
    (hΦ : ∀ i, F.forms i = (Φ i).map (algebraMap k[X] (RatFunc k))) (t₀ : AlgebraicClosure k)
    (ht₀ : t₀ ∈ goodSet f) (G : HomogeneousLift (AlgebraicClosure k) f.degree)
    (hG : ∀ i, G.forms i = (Φ i).map (Polynomial.aeval t₀).toRingHom) :
    RationalMap.mk G = specialize f t₀ := sorry

/-- A constant point `c ∈ ℙ¹(k)` (DY.0's `projMap`) specialises to itself. -/
theorem specializePoint_const (P : ℙ k (Fin 2 → k)) (t₀ : AlgebraicClosure k) :
    specializePoint (RationalMap.projMap (algebraMap k (RatFunc k)) P) t₀ =
      RationalMap.projMap (algebraMap k (AlgebraicClosure k)) P := sorry

/-- `DY.6/specialization-commutes-with-evaluation`. -/
theorem specializePoint_apply (f : RationalMap (RatFunc k)) (t₀ : AlgebraicClosure k)
    (ht₀ : t₀ ∈ goodSet f) (P : ℙ (RatFunc k) (Fin 2 → RatFunc k)) :
    specializePoint (RationalMap.toEnd f P) t₀ =
      RationalMap.toEnd (specialize f t₀) (specializePoint P t₀) := sorry

end Specialization

/-- Unit test `specialize_sq_add_t`: `z² + t` specialises at `t₀ = −2` to `z² − 2`, and
`T⁰ = ℚ̄`. -/
example : specialize (RationalMap.ofPolynomial (X ^ 2 + C (RatFunc.X : RatFunc ℚ))) (-2) =
      RationalMap.ofPolynomial (X ^ 2 - C 2) ∧
    goodSet (RationalMap.ofPolynomial (X ^ 2 + C (RatFunc.X : RatFunc ℚ))) = Set.univ :=
  sorry

/-- Unit test `specialize_const`: a constant family specialises to itself everywhere. -/
example (k : Type*) [Field k] (d : ℕ) (hd : 1 ≤ d) (t₀ : AlgebraicClosure k) :
    specialize (powerMap (RatFunc k) d) t₀ = powerMap (AlgebraicClosure k) d ∧
      goodSet (powerMap (RatFunc k) d) = Set.univ := sorry

/-- Unit test `specialize_bad_fibre`: for `t z² + z`, the parameter `0` is not in `T⁰`. -/
example : (0 : AlgebraicClosure ℚ) ∉
    goodSet (RationalMap.ofPolynomial (C (RatFunc.X : RatFunc ℚ) * X ^ 2 + X)) :=
  sorry

/-! ### Height bounds uniform in the field and the specialisation theorem -/

/-- `DY.6/mul-height-bound-base-change`. -/
theorem mulHeightBound_baseChange {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] {ι ι' : Type*} [Finite ι'] (p : ι' → MvPolynomial ι K) :
    Height.mulHeightBound (fun j => MvPolynomial.map (algebraMap K L) (p j)) ≤
      max (Height.mulHeightBound p) 1 ^ Module.finrank K L := sorry

/-- `DY.6/absolute-height-bounds-for-forms` (a), in the relative-to-`L` form divided by `[L : ℚ]`. -/
theorem logHeight_eval_le_uniform {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] {ι ι' : Type*} [Finite ι] [Finite ι'] {N : ℕ} (p : ι' → MvPolynomial ι K)
    (hp : ∀ j, (p j).IsHomogeneous N) (x : ι → L) :
    Height.logHeight (fun j => MvPolynomial.aeval x (p j)) / Module.finrank ℚ L ≤
      N * (Height.logHeight x / Module.finrank ℚ L) +
        Real.log (max (Height.mulHeightBound p) 1) / Module.finrank ℚ K := sorry

/-- `DY.6/absolute-height-bounds-for-forms` (b). -/
theorem logHeight_eval_ge_uniform {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] {ι ι' : Type*} [Finite ι] [Fintype ι'] {M N : ℕ} (p : ι' → MvPolynomial ι K)
    (q : ι × ι' → MvPolynomial ι K) (hq : ∀ a, (q a).IsHomogeneous M) (x : ι → L)
    (h : ∀ i, ∑ j, MvPolynomial.aeval x (q (i, j)) * MvPolynomial.aeval x (p j) = x i ^ (M + N)) :
    N * (Height.logHeight x / Module.finrank ℚ L) -
        Real.log (max (Height.mulHeightBound q) 1) / Module.finrank ℚ K - Real.log (Nat.card ι') ≤
      Height.logHeight (fun j => MvPolynomial.aeval x (p j)) / Module.finrank ℚ L := sorry

/-- `DY.6/height-of-specialized-points`, with DY.1's absolute Weil height on `ℙ¹(K̄)`. -/
theorem height_specializePoint {K : Type*} [Field K] [NumberField K] (P : RatFunc K) :
    ∃ c : ℝ, ∀ t₀ : AlgebraicClosure K,
      |projLineAbsLogHeight (specializePoint (Projectivization.mk _ ![P, 1] (by simp)) t₀) -
          Height.logHeight₁ P * NumberField.absLogHeight₁ t₀| ≤ c := sorry

/-- `DY.6/uniform-canonical-height-bound-in-families` (Call–Silverman Theorem 3.1 for `ℙ¹`), for
DY.1's canonical heights of the specialisations. -/
theorem canonicalHeight_specialize_sub_le {K : Type*} [Field K] [NumberField K]
    (f : RationalMap (RatFunc K)) (hf : 2 ≤ f.degree) :
    ∃ c₁ c₂ : ℝ, ∀ t₀ ∈ goodSet f, ∀ x : ℙ (AlgebraicClosure K) (Fin 2 → AlgebraicClosure K),
      |(specialize f t₀).canonicalHeight x - projLineAbsLogHeight x| ≤
        c₁ * NumberField.absLogHeight₁ t₀ + c₂ := sorry

/-- `DY.6/specialization-of-canonical-heights` (Call–Silverman Theorem 4.1 for families of maps
of `ℙ¹` over the `t`-line): DY.1's canonical heights of the fibres, normalised by `h(t₀)`, tend to
DY.1's relative canonical height over `K(t)`. -/
theorem specialization_of_canonicalHeight {K : Type*} [Field K] [NumberField K]
    (f : RationalMap (RatFunc K)) (hf : 2 ≤ f.degree) (P : ℙ (RatFunc K) (Fin 2 → RatFunc K)) :
    ∀ ε > 0, ∃ H : ℝ, ∀ t₀ ∈ goodSet f, H ≤ NumberField.absLogHeight₁ t₀ →
      |(specialize f t₀).canonicalHeight (specializePoint P t₀) / NumberField.absLogHeight₁ t₀ -
          f.relCanonicalHeight P| ≤ ε := sorry

/-- `DY.6/specialization-of-non-preperiodic-points`. -/
theorem not_isPreperiodic_specialize {K : Type*} [Field K] [NumberField K]
    (f : RationalMap (RatFunc K)) (hf : 2 ≤ f.degree) (P : ℙ (RatFunc K) (Fin 2 → RatFunc K))
    (hP : 0 < f.relCanonicalHeight P) :
    ∃ H : ℝ, ∀ t₀ ∈ goodSet f, H < NumberField.absLogHeight₁ t₀ →
      ¬ IsPreperiodicPt (RationalMap.toEnd (specialize f t₀)) (specializePoint P t₀) := sorry

/-- `DY.6/polynomial-variation-of-canonical-height` (Ingram, Corollary 2, base `ℙ¹`). -/
theorem polynomial_variation_of_canonicalHeight {K : Type*} [Field K] [NumberField K]
    (q : (RatFunc K)[X]) (hq : 2 ≤ q.natDegree) (P : ℙ (RatFunc K) (Fin 2 → RatFunc K)) :
    ∃ C : ℝ, ∀ t₀ ∈ goodSet (RationalMap.ofPolynomial q),
      |(specialize (RationalMap.ofPolynomial q) t₀).canonicalHeight (specializePoint P t₀) -
          (RationalMap.ofPolynomial q).relCanonicalHeight P * NumberField.absLogHeight₁ t₀| ≤ C :=
  sorry

/-! ### Postcritically finite maps and the critical height

The critical points are DY.0's `RationalMap.criticalPoints` (node
`DY.0/critical-points-of-a-rational-map`, with `criticalPoints_comp` and
`criticalPoints_iterate`). -/

section Critical

variable {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]

/-- `DY.6/postcritically-finite-map`: the postcritical set `⋃_{n ≥ 1} fⁿ(supp Crit(f))`. -/
noncomputable def postcriticalSet (f : RationalMap K) : Set (ℙ K (Fin 2 → K)) :=
  ⋃ n ≥ 1, (RationalMap.toEnd f)^[n] '' {c | c ∈ f.criticalPoints}

/-- `DY.6/postcritically-finite-map`: every critical point is preperiodic. -/
def IsPostcriticallyFinite (f : RationalMap K) : Prop :=
  ∀ c ∈ f.criticalPoints, IsPreperiodicPt (RationalMap.toEnd f) c

theorem isPostcriticallyFinite_iff_finite (f : RationalMap K) (hf : 2 ≤ f.degree) :
    IsPostcriticallyFinite f ↔ (postcriticalSet f).Finite := sorry

theorem IsPostcriticallyFinite.conj {f : RationalMap K} (hf : IsPostcriticallyFinite f)
    (γ : PGL(2, K)) : IsPostcriticallyFinite (γ • f) := sorry

theorem isPostcriticallyFinite_iterate_iff (f : RationalMap K) (hf : 2 ≤ f.degree) {n : ℕ}
    (hn : 1 ≤ n) : IsPostcriticallyFinite (f ^ n) ↔ IsPostcriticallyFinite f := sorry

theorem IsPostcriticallyFinite.map {L : Type*} [Field L] [IsAlgClosed L] [CharZero L]
    (σ : K ≃+* L) {f : RationalMap K} (hf : IsPostcriticallyFinite f) :
    IsPostcriticallyFinite (RationalMap.map σ.toRingHom f) := sorry

end Critical

/-- Unit test `isPCF_sq_sub_two`: `z² − 2` is postcritically finite. -/
example : IsPostcriticallyFinite
    (RationalMap.ofPolynomial (X ^ 2 - C 2 : (AlgebraicClosure ℚ)[X])) := sorry

/-- Unit test `isPCF_powerMap`: `P_d` is postcritically finite. -/
example (d : ℕ) (hd : 2 ≤ d) : IsPostcriticallyFinite (powerMap (AlgebraicClosure ℚ) d) := sorry

/-- Unit test `not_isPCF_sq_add_one`: `z² + 1` is not postcritically finite. -/
example : ¬ IsPostcriticallyFinite
    (RationalMap.ofPolynomial (X ^ 2 + 1 : (AlgebraicClosure ℚ)[X])) := sorry

/-- `DY.6/critical-height`: `ĥ_crit(f) = Σ_{c ∈ Crit f} ĥ_f(c)`, with DY.0's critical points and
DY.1's canonical height. -/
noncomputable def criticalHeight (f : RationalMap (AlgebraicClosure ℚ)) : ℝ :=
  (f.criticalPoints.map f.canonicalHeight).sum

section CriticalHeight

variable (f : RationalMap (AlgebraicClosure ℚ))

theorem criticalHeight_nonneg (hf : 2 ≤ f.degree) : 0 ≤ criticalHeight f := sorry

/-- `DY.6/critical-height-conjugation-invariant`. -/
theorem criticalHeight_conj (hf : 2 ≤ f.degree) (γ : PGL(2, AlgebraicClosure ℚ)) :
    criticalHeight (γ • f) = criticalHeight f := sorry

/-- The critical height as a function on DY.0's moduli space `M_d(ℚ̄)` (well defined by
`criticalHeight_conj`). -/
noncomputable def criticalHeightModuli {d : ℕ} (c : ModuliSpace (AlgebraicClosure ℚ) d) : ℝ :=
  criticalHeight (ModuliSpace.mk_surjective c).choose

theorem criticalHeightModuli_mk {d : ℕ} (hd : 2 ≤ d) (hf : f.degree = d) :
    criticalHeightModuli (ModuliSpace.mk f hf) = criticalHeight f := sorry

/-- `DY.6/critical-height-of-iterate`. -/
theorem criticalHeight_iterate (hf : 2 ≤ f.degree) (n : ℕ) :
    criticalHeight (f ^ n) = n * criticalHeight f := sorry

/-- `DY.6/critical-height-eq-zero-iff-postcritically-finite`. -/
theorem criticalHeight_eq_zero_iff (hf : 2 ≤ f.degree) :
    criticalHeight f = 0 ↔ IsPostcriticallyFinite f := sorry

theorem criticalHeight_galois (hf : 2 ≤ f.degree)
    (σ : AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ) :
    criticalHeight (RationalMap.map σ.toRingEquiv.toRingHom f) = criticalHeight f := sorry

end CriticalHeight

/-- Unit test `criticalHeight_sq_add_c`: `ĥ_crit(z² + c) = ĥ_{z²+c}(0)`, positive for `c = 1`. -/
example (c : AlgebraicClosure ℚ) :
    criticalHeight (RationalMap.ofPolynomial (X ^ 2 + C c)) =
        (RationalMap.ofPolynomial (X ^ 2 + C c)).canonicalHeight
          (Projectivization.mk _ ![0, 1] (by simp)) ∧
      0 < criticalHeight (RationalMap.ofPolynomial (X ^ 2 + 1 : (AlgebraicClosure ℚ)[X])) :=
  sorry

/-- Unit test `criticalHeight_powerMap`: `ĥ_crit(P_d) = 0`. -/
example (d : ℕ) (hd : 2 ≤ d) : criticalHeight (powerMap (AlgebraicClosure ℚ) d) = 0 := sorry

/-- Unit test `criticalHeight_iterate_two`: `ĥ_crit(f ∘ f) = 2 ĥ_crit(f)`. -/
example (f : RationalMap (AlgebraicClosure ℚ)) (hf : 2 ≤ f.degree) :
    criticalHeight (f * f) = 2 * criticalHeight f := sorry

/-! ### Lattès maps (`DY.6/lattes-map`) -/

/-- The `x`-coordinate of a point of a Weierstrass curve, as a point of `ℙ¹` (the `ℙ¹` form of
Mathlib's `WeierstrassCurve.Affine.Point.xRep`): `O ↦ ∞`, `(x, y) ↦ [x : 1]`. -/
noncomputable def xCoordP1 {F : Type*} [Field F] {W : WeierstrassCurve.Affine F} :
    W.Point → ℙ F (Fin 2 → F)
  | .zero => Projectivization.mk F ![1, 0] (by simp)
  | .some x _ _ => Projectivization.mk F ![x, 1] (by simp)

/-- The Lattès map `x ↦ Φₙ(x)/ΨSqₙ(x)` of multiplication by `n`, as DY.0's rational map with the
lift `(Φₙ, ΨSqₙ)` homogenised in degree `n²` (junk value `1` when `Δ = 0` or `n = 0`). -/
noncomputable def lattesMap {F : Type*} [Field F] (W : WeierstrassCurve F) (n : ℤ) :
    RationalMap F :=
  open scoped Classical in
  if W.Δ ≠ 0 ∧ n ≠ 0 then
    RationalMap.mk (d := n.natAbs ^ 2)
      ⟨![(W.Φ n).homogenize (n.natAbs ^ 2), (W.ΨSq n).homogenize (n.natAbs ^ 2)], sorry, sorry,
        sorry⟩
  else 1

section Lattes

variable {F : Type*} [Field F] (W : WeierstrassCurve F)

theorem lattesMap_apply (hΔ : W.Δ ≠ 0) (n : ℤ) (hn : n ≠ 0) (x : F) :
    ((W.ΨSq n).eval x ≠ 0 →
        RationalMap.toEnd (lattesMap W n) (Projectivization.mk F ![x, 1] (by simp)) =
          Projectivization.mk F ![(W.Φ n).eval x / (W.ΨSq n).eval x, 1] (by simp)) ∧
      ((W.ΨSq n).eval x = 0 →
        RationalMap.toEnd (lattesMap W n) (Projectivization.mk F ![x, 1] (by simp)) =
          Projectivization.mk F ![1, 0] (by simp)) ∧
      RationalMap.toEnd (lattesMap W n) (Projectivization.mk F ![1, 0] (by simp)) =
        Projectivization.mk F ![1, 0] (by simp) := sorry

theorem lattesMap_degree (hΔ : W.Δ ≠ 0) {n : ℤ} (hn : n ≠ 0) :
    (lattesMap W n).degree = n.natAbs ^ 2 := sorry

theorem lattesMap_neg (n : ℤ) : lattesMap W (-n) = lattesMap W n := sorry

theorem lattesMap_one : lattesMap W 1 = 1 := sorry

theorem lattesMap_two (hΔ : W.Δ ≠ 0) :
    (lattesMap W 2).toRatFunc =
      algebraMap F[X] (RatFunc F) (X ^ 4 - C W.b₄ * X ^ 2 - C (2 * W.b₆) * X - C W.b₈) /
        algebraMap F[X] (RatFunc F) W.Ψ₂Sq := sorry

theorem lattesMap_resultant_two : (W.Φ 2).resultant (W.ΨSq 2) 4 3 = W.Δ ^ 2 := sorry

theorem lattesMap_map {L : Type*} [Field L] (σ : F →+* L) (n : ℤ) :
    RationalMap.map σ (lattesMap W n) = lattesMap (W.map σ) n := sorry

theorem lattesMap_iterate (hΔ : W.Δ ≠ 0) (n : ℤ) (hn : n ≠ 0) (k : ℕ) :
    lattesMap W n ^ k = lattesMap W (n ^ k) := sorry

theorem lattesMap_isFixedPt_infty (hΔ : W.Δ ≠ 0) (n : ℤ) (hn : n ≠ 0) :
    Function.IsFixedPt (RationalMap.toEnd (lattesMap W n))
      (Projectivization.mk F ![1, 0] (by simp)) := sorry

/-- `DY.6/lattes-map-semiconjugacy`: `f_{E,n}(x(P)) = x(nP)`. -/
theorem lattesMap_apply_xCoordP1 [DecidableEq F] (hΔ : W.Δ ≠ 0) (n : ℤ) (hn : n ≠ 0)
    (P : W.toAffine.Point) :
    RationalMap.toEnd (lattesMap W n) (xCoordP1 P) = xCoordP1 (n • P) := sorry

/-- `DY.6/lattes-map-comp`: `f_{E,m} ∘ f_{E,n} = f_{E,mn}` as rational maps. -/
theorem lattesMap_comp (hΔ : W.Δ ≠ 0) (m n : ℤ) (hm : m ≠ 0) (hn : n ≠ 0) :
    lattesMap W m * lattesMap W n = lattesMap W (m * n) := sorry

/-- `DY.6/lattes-map-preperiodic-iff-torsion`. -/
theorem lattesMap_isPreperiodic_iff [DecidableEq F] (hΔ : W.Δ ≠ 0) (n : ℤ) (hn : 2 ≤ n.natAbs)
    (P : W.toAffine.Point) :
    IsPreperiodicPt (RationalMap.toEnd (lattesMap W n)) (xCoordP1 P) ↔ IsOfFinAddOrder P := sorry

/-- `DY.6/lattes-map-canonical-height`, relative form (DY.1's relative canonical height):
`ĥ^F_{f_{E,n}}(x(P)) = 2 ĥ_E(P)`. -/
theorem lattesMap_relCanonicalHeight [Height.AdmissibleAbsValues F] [DecidableEq F]
    [W.IsElliptic] (n : ℤ) (hn : 2 ≤ n.natAbs) (P : W.toAffine.Point) :
    (lattesMap W n).relCanonicalHeight (xCoordP1 P) = 2 * neronTate W P := sorry

/-- `DY.6/lattes-map-canonical-height`, absolute form over a number field (DY.1's canonical
height). -/
theorem lattesMap_canonicalHeight [NumberField F] [DecidableEq F] [W.IsElliptic] (n : ℤ)
    (hn : 2 ≤ n.natAbs) (P : W.toAffine.Point) :
    (lattesMap W n).canonicalHeight (xCoordP1 P) = 2 * neronTate W P / Module.finrank ℚ F :=
  sorry

/-- The Möbius involution `τ_T(x) = e + Ψ₂Sq′(e)/(4(x − e))` induced on the `x`-line by
translation by the 2-torsion point with `x`-coordinate `e`: DY.0's degree-one map with lift
`(e X + (c − e²) Y, X − e Y)`, `c = Ψ₂Sq′(e)/4` (junk value `1` when `c = 0`). -/
noncomputable def twoTorsionTranslation (e : F) : RationalMap F :=
  open scoped Classical in
  if (Polynomial.derivative W.Ψ₂Sq).eval e / 4 ≠ 0 then
    RationalMap.mk (d := 1)
      ⟨![MvPolynomial.C e * MvPolynomial.X 0 +
          MvPolynomial.C ((Polynomial.derivative W.Ψ₂Sq).eval e / 4 - e ^ 2) * MvPolynomial.X 1,
        MvPolynomial.X 0 - MvPolynomial.C e * MvPolynomial.X 1], sorry, sorry, sorry⟩
  else 1

/-- `DY.6/two-torsion-translation`: `x(P + T) = τ_T(x(P))`. -/
theorem twoTorsionTranslation_apply [DecidableEq F] (h2 : (2 : F) ≠ 0) (hΔ : W.Δ ≠ 0)
    (e y : F) (hT : W.toAffine.Nonsingular e y)
    (h2T : 2 • (WeierstrassCurve.Affine.Point.some e y hT) = 0)
    (hTne : y = W.toAffine.negY e y) (P : W.toAffine.Point) :
    RationalMap.toEnd (twoTorsionTranslation W e) (xCoordP1 P) =
      xCoordP1 (P + WeierstrassCurve.Affine.Point.some e y hT) := sorry

end Lattes

/-- Unit test `lattesMap_two_y2_eq_x3_sub_x`: for `y² = x³ − x`,
`f_{E,2} = (x² + 1)²/(4x(x² − 1))`, and `f_{E,2}(2) = 25/24`. -/
example : (lattesMap (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve ℚ) 2).toRatFunc =
      algebraMap ℚ[X] (RatFunc ℚ) ((X ^ 2 + 1) ^ 2) /
        algebraMap ℚ[X] (RatFunc ℚ) (4 * X * (X ^ 2 - 1)) ∧
    RationalMap.toEnd (lattesMap (⟨0, 0, 0, -1, 0⟩ : WeierstrassCurve ℚ) 2)
        (Projectivization.mk ℚ ![2, 1] (by simp)) =
      Projectivization.mk ℚ ![25 / 24, 1] (by simp) := sorry

/-- Unit test `lattesMap_one_eq_id`: `f_{E,±1}` is the identity rational map. -/
example (F : Type*) [Field F] (W : WeierstrassCurve F) (hΔ : W.Δ ≠ 0) :
    lattesMap W 1 = 1 ∧ lattesMap W (-1) = 1 := sorry

/-- Unit test `lattesMap_apply_xCoord`: agreement with the division-polynomial formula for
`x(nP)` (Tau Ceti `WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul`). -/
example (F : Type*) [Field F] [DecidableEq F] (W : WeierstrassCurve F) (hΔ : W.Δ ≠ 0) (n : ℤ)
    (hn : n ≠ 0) (x y x' y' : F) (h : W.toAffine.Nonsingular x y)
    (h' : W.toAffine.Nonsingular x' y')
    (hnP : n • WeierstrassCurve.Affine.Point.some x y h =
      WeierstrassCurve.Affine.Point.some x' y' h') :
    RationalMap.toEnd (lattesMap W n) (Projectivization.mk F ![x, 1] (by simp)) =
      Projectivization.mk F ![x', 1] (by simp) := sorry

/-- Unit test `lattesMap_not_of_singular`: for `y² = x³` (`Δ = 0`), `Φ₂` and `ΨSq₂` are not
coprime. -/
example : (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve ℚ).Δ = 0 ∧
    ¬ IsCoprime ((⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve ℚ).Φ 2)
      ((⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve ℚ).ΨSq 2) :=
  sorry

/-! ### The Legendre family (`DY.6/legendre-lattes-map`) -/

section Legendre

variable {F : Type*} [Field F]

/-- The Legendre curve `y² = x(x − 1)(x − t)`. -/
def legendreCurve (t : F) : WeierstrassCurve F := ⟨0, -(1 + t), 0, t, 0⟩

theorem legendreCurve_Δ (t : F) : (legendreCurve t).Δ = 16 * t ^ 2 * (t - 1) ^ 2 := sorry

theorem legendreCurve_j (t : F) [(legendreCurve t).IsElliptic] :
    (legendreCurve t).j = 256 * (t ^ 2 - t + 1) ^ 3 / (t ^ 2 * (t - 1) ^ 2) := sorry

/-- The Legendre Lattès map `f_t = f_{E_t,2}`. -/
noncomputable def legendreLattesMap (t : F) : RationalMap F := lattesMap (legendreCurve t) 2

theorem legendreLattesMap_eq (t : F) (h2 : (2 : F) ≠ 0) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    (legendreLattesMap t).toRatFunc =
      algebraMap F[X] (RatFunc F) ((X ^ 2 - C t) ^ 2) /
        algebraMap F[X] (RatFunc F) (4 * X * (X - 1) * (X - C t)) := sorry

/-- The forms `((z² − tw²)², 4zw(z − w)(z − tw))`. -/
noncomputable def legendreForms (t : F) : Fin 2 → MvPolynomial (Fin 2) F :=
  ![(MvPolynomial.X 0 ^ 2 - MvPolynomial.C t * MvPolynomial.X 1 ^ 2) ^ 2,
    4 * MvPolynomial.X 0 * MvPolynomial.X 1 * (MvPolynomial.X 0 - MvPolynomial.X 1) *
      (MvPolynomial.X 0 - MvPolynomial.C t * MvPolynomial.X 1)]

/-- The homogeneous lift `F_t(z, w) = ((z² − tw²)², 4zw(z − w)(z − tw))` of `f_t`, a DY.0
`HomogeneousLift` of degree `4` when its resultant `256 t⁴ (t − 1)⁴` is nonzero (junk value
`(X⁴, Y⁴)` otherwise). -/
noncomputable def legendreLift (t : F) : HomogeneousLift F 4 :=
  open scoped Classical in
  if (256 : F) * t ^ 4 * (t - 1) ^ 4 ≠ 0 then ⟨legendreForms t, sorry, sorry, sorry⟩
  else ⟨![MvPolynomial.X 0 ^ 4, MvPolynomial.X 1 ^ 4], sorry, sorry, sorry⟩

theorem legendreLift_forms (t : F) (h2 : (2 : F) ≠ 0) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    (legendreLift t).forms = legendreForms t := sorry

theorem mk_legendreLift (t : F) (h2 : (2 : F) ≠ 0) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    RationalMap.mk (legendreLift t) = legendreLattesMap t := sorry

/-- `Res(F_t) = 256 t⁴ (t − 1)⁴ = Δ(E_t)²` (DY.0's `binaryResultant`). -/
theorem legendreLift_resultant (t : F) :
    binaryResultant 4 4 (legendreForms t 0) (legendreForms t 1) = 256 * t ^ 4 * (t - 1) ^ 4 :=
  sorry

/-- `DY.6/legendre-lattes-symmetries`: the linear maps `A(z, w) = (w − z, w)` and
`B(z, w) = (z, tw)` conjugate `F_t` to `−F_{1−t}` and `F_{1/t}`. -/
theorem legendreLift_symmetries (t : F) (h2 : (2 : F) ≠ 0) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1)
    (v : Fin 2 → F) :
    ![(legendreLift t).eval v 1 - (legendreLift t).eval v 0, (legendreLift t).eval v 1] =
        -(legendreLift (1 - t)).eval ![v 1 - v 0, v 1] ∧
      ![(legendreLift t).eval v 0, t * (legendreLift t).eval v 1] =
        (legendreLift t⁻¹).eval ![v 0, t * v 1] := sorry

end Legendre

/-- The Legendre canonical height `ĥ_t = ĥ_{f_t}` on `ℙ¹(ℚ̄)` (DY.1). -/
noncomputable def legendreCanonicalHeight (t : AlgebraicClosure ℚ) :
    ℙ (AlgebraicClosure ℚ) (Fin 2 → AlgebraicClosure ℚ) → ℝ :=
  (legendreLattesMap t).canonicalHeight

open Classical in
theorem legendreCanonicalHeight_eq_zero_iff (t : AlgebraicClosure ℚ) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1)
    (x : AlgebraicClosure ℚ) :
    legendreCanonicalHeight t (Projectivization.mk _ ![x, 1] (by simp)) = 0 ↔
      ∃ (y : AlgebraicClosure ℚ) (h : (legendreCurve t).toAffine.Nonsingular x y),
        IsOfFinAddOrder (WeierstrassCurve.Affine.Point.some x y h) := sorry

/-- Unit test `legendreLattesMap_neg_one`: `f_{−1}(2) = 25/24`. -/
example : RationalMap.toEnd (legendreLattesMap (-1 : ℚ)) (Projectivization.mk ℚ ![2, 1] (by simp)) =
    Projectivization.mk ℚ ![25 / 24, 1] (by simp) := sorry

/-- Unit test `legendreCurve_Δ_zero`: at `t = 0` the discriminant vanishes. -/
example : (legendreCurve (0 : ℚ)).Δ = 0 := sorry

/-- Unit test `legendreLattesMap_eq_lattesMap`: `f_t = f_{E_t,2}`. -/
example (F : Type*) [Field F] (t : F) : legendreLattesMap t = lattesMap (legendreCurve t) 2 := rfl

/-- Unit test `legendreLattesMap_not_polynomial`: `f_t⁻¹(∞) ⊇ {0, 1, t, ∞}`. -/
example (t : ℚ) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    RationalMap.toEnd (legendreLattesMap t) (Projectivization.mk ℚ ![0, 1] (by simp)) =
        Projectivization.mk ℚ ![1, 0] (by simp) ∧
      RationalMap.toEnd (legendreLattesMap t) (Projectivization.mk ℚ ![1, 1] (by simp)) =
        Projectivization.mk ℚ ![1, 0] (by simp) ∧
      RationalMap.toEnd (legendreLattesMap t) (Projectivization.mk ℚ ![t, 1] (by simp)) =
        Projectivization.mk ℚ ![1, 0] (by simp) ∧
      RationalMap.toEnd (legendreLattesMap t) (Projectivization.mk ℚ ![1, 0] (by simp)) =
        Projectivization.mk ℚ ![1, 0] (by simp) := sorry

/-! ### Flexible Lattès maps (`DY.6/flexible-lattes-map`) -/

section Flexible

variable {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]

/-- `f` is a flexible Lattès map: conjugate (DY.0's `PGL₂(K)` action) to `τ_T ∘ f_{E,n}` for an
elliptic curve `E`, `|n| ≥ 2` and a 2-torsion translation `τ_T` (`τ_O = id`, otherwise `T` has
`x`-coordinate a root of `Ψ₂Sq`). -/
def IsFlexibleLattes (f : RationalMap K) : Prop :=
  ∃ (W : WeierstrassCurve K) (_ : W.Δ ≠ 0) (n : ℤ) (_ : 2 ≤ n.natAbs) (γ : PGL(2, K)),
    γ • f = lattesMap W n ∨
      ∃ e : K, W.Ψ₂Sq.eval e = 0 ∧ γ • f = twoTorsionTranslation W e * lattesMap W n

theorem lattesMap_isFlexibleLattes (W : WeierstrassCurve K) (hΔ : W.Δ ≠ 0) (n : ℤ)
    (hn : 2 ≤ n.natAbs) : IsFlexibleLattes (lattesMap W n) := sorry

theorem IsFlexibleLattes.conj {f : RationalMap K} (hf : IsFlexibleLattes f) (γ : PGL(2, K)) :
    IsFlexibleLattes (γ • f) := sorry

theorem IsFlexibleLattes.degree_eq_sq {f : RationalMap K} (hf : IsFlexibleLattes f) :
    ∃ n : ℕ, 2 ≤ n ∧ f.degree = n ^ 2 := sorry

theorem IsFlexibleLattes.isPostcriticallyFinite {f : RationalMap K} (hf : IsFlexibleLattes f) :
    IsPostcriticallyFinite f := sorry

/-- The flexible Lattès locus `L_d ⊆ M_d(K)` in DY.0's moduli space: the conjugacy classes of
flexible Lattès maps of degree `d`. -/
def flexibleLattesLocus (d : ℕ) : Set (ModuliSpace K d) :=
  {c | ∃ (f : RationalMap K) (hf : f.degree = d), ModuliSpace.mk f hf = c ∧ IsFlexibleLattes f}

theorem flexibleLattesLocus_nonempty_iff (d : ℕ) :
    (flexibleLattesLocus (K := K) d).Nonempty ↔ ∃ n : ℕ, 2 ≤ n ∧ d = n ^ 2 := sorry

theorem IsFlexibleLattes.map {L : Type*} [Field L] [IsAlgClosed L] [CharZero L] (σ : K ≃+* L)
    {f : RationalMap K} (hf : IsFlexibleLattes f) :
    IsFlexibleLattes (RationalMap.map σ.toRingHom f) := sorry

/-- `DY.6/lattes-map-postcritically-finite`. -/
theorem lattesMap_isPostcriticallyFinite (W : WeierstrassCurve K) (hΔ : W.Δ ≠ 0) (n : ℤ)
    (hn : 2 ≤ n.natAbs) : IsPostcriticallyFinite (lattesMap W n) := sorry

end Flexible

/-- Unit test `legendreLattesMap_isFlexibleLattes`: `f_t` is flexible Lattès of degree 4. -/
example (t : AlgebraicClosure ℚ) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    IsFlexibleLattes (legendreLattesMap t) ∧ (legendreLattesMap t).degree = 4 := sorry

/-- Unit test `not_isFlexibleLattes_of_not_square`: no flexible Lattès map has degree 2 or 3. -/
example (f : RationalMap (AlgebraicClosure ℚ)) (hf : f.degree = 2 ∨ f.degree = 3) :
    ¬ IsFlexibleLattes f := sorry

/-- Unit test `isFlexibleLattes_conj_iff`: flexible Lattès is a conjugacy invariant. -/
example (f : RationalMap (AlgebraicClosure ℚ)) (γ : PGL(2, AlgebraicClosure ℚ)) :
    IsFlexibleLattes (γ • f) ↔ IsFlexibleLattes f := sorry

/-- Unit test `powerMap_four_not_isFlexibleLattes`: `z⁴` is not flexible Lattès. -/
example : ¬ IsFlexibleLattes (powerMap (AlgebraicClosure ℚ) 4) := sorry

/-- Unit test `isPCF_legendreLattesMap`: the Legendre maps are postcritically finite. -/
example (t : AlgebraicClosure ℚ) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    IsPostcriticallyFinite (legendreLattesMap t) := sorry

/-- Unit test `criticalHeight_lattes_not_moduli_height`: `ĥ_crit(f_t) = 0` for all `t`, while the
classes `[f_t] ∈ M_4(ℚ̄)` have unbounded moduli height. -/
example :
    (∀ t : AlgebraicClosure ℚ, t ≠ 0 → t ≠ 1 → criticalHeight (legendreLattesMap t) = 0) ∧
      ∀ B : ℝ, ∃ (t : AlgebraicClosure ℚ) (hdeg : (legendreLattesMap t).degree = 4),
        B < moduliHeight 4 (ModuliSpace.mk (legendreLattesMap t) hdeg) := sorry

/-- Unit test `specialize_legendre`: the Legendre family over `ℚ(t)` has `T⁰ = ℚ̄ ∖ {0, 1}` and
specialises to `f_{t₀}`. -/
example (t₀ : AlgebraicClosure ℚ) (ht₀ : t₀ ≠ 0) (ht₁ : t₀ ≠ 1) :
    t₀ ∈ goodSet (legendreLattesMap (RatFunc.X : RatFunc ℚ)) ∧
      specialize (legendreLattesMap (RatFunc.X : RatFunc ℚ)) t₀ = legendreLattesMap t₀ := sorry

/-! ### Standard projections (`DY.6/standard-projection`) -/

/-- A standard projection `γ ∘ x` of an elliptic curve, for `γ ∈ PGL₂(K)` acting on `ℙ¹(K)`. -/
noncomputable def standardProjection {K : Type*} [Field K] {W : WeierstrassCurve.Affine K}
    (γ : PGL(2, K)) (P : W.Point) : ℙ K (Fin 2 → K) :=
  γ • xCoordP1 P

section StandardProjection

variable {K : Type*} [Field K] [IsAlgClosed K] [DecidableEq K] (W : WeierstrassCurve K)
  (γ : PGL(2, K))

theorem standardProjection_neg (P : W.toAffine.Point) :
    standardProjection γ (-P) = standardProjection γ P := sorry

theorem standardProjection_branchSet (hΔ : W.Δ ≠ 0) (h2 : (2 : K) ≠ 0) :
    {z : ℙ K (Fin 2 → K) | ∃! P : W.toAffine.Point, standardProjection γ P = z} =
        standardProjection γ '' {P : W.toAffine.Point | 2 • P = 0} ∧
      (standardProjection γ '' {P : W.toAffine.Point | 2 • P = 0}).ncard = 4 := sorry

theorem standardProjection_torsion :
    standardProjection γ '' {P : W.toAffine.Point | IsOfFinAddOrder P} =
      (γ • ·) '' (xCoordP1 '' {P : W.toAffine.Point | IsOfFinAddOrder P}) := sorry

theorem standardProjection_normalize (hΔ : W.Δ ≠ 0) (h2 : (2 : K) ≠ 0) :
    ∃ (ψ : PGL(2, K)) (t : K), t ≠ 0 ∧ t ≠ 1 ∧
      (fun P => ψ • standardProjection γ P) '' {P : W.toAffine.Point | 2 • P = 0} =
        {Projectivization.mk K ![0, 1] (by simp), Projectivization.mk K ![1, 1] (by simp),
          Projectivization.mk K ![t, 1] (by simp), Projectivization.mk K ![1, 0] (by simp)} :=
  sorry

end StandardProjection

/-- Unit test `standardProjection_legendre`: `x` is a standard projection of `E_t` with branch
values `0, 1, t, ∞`. -/
example (t : AlgebraicClosure ℚ) :
    standardProjection (W := (legendreCurve t).toAffine) 1 = xCoordP1 := sorry

/-- Unit test `standardProjection_translate`: translating by a 2-torsion point does not change the
torsion images. -/
example (K : Type*) [Field K] [DecidableEq K] (W : WeierstrassCurve K) (γ : PGL(2, K))
    (e : W.toAffine.Point) (he : 2 • e = 0) :
    (fun P => standardProjection γ (P + e)) '' {P : W.toAffine.Point | IsOfFinAddOrder P} =
      standardProjection γ '' {P : W.toAffine.Point | IsOfFinAddOrder P} := sorry

/-- Unit test `standardProjection_branch_card`: the branch set of `x` is `{∞} ∪ roots of Ψ₂Sq`,
four points. -/
example (K : Type*) [Field K] [IsAlgClosed K] [DecidableEq K] (W : WeierstrassCurve K)
    (hΔ : W.Δ ≠ 0) (h2 : (2 : K) ≠ 0) :
    (xCoordP1 '' {P : W.toAffine.Point | 2 • P = 0}).ncard = 4 := sorry

/-- Unit test `standardProjection_not_three_to_one`: the `y`-coordinate of `y² = x³ + 1` is not a
standard projection (it is three-to-one). -/
example : ∃ y₀ : AlgebraicClosure ℚ,
    {P : (⟨0, 0, 0, 0, 1⟩ : WeierstrassCurve (AlgebraicClosure ℚ)).toAffine.Point |
      ∃ x h, P = WeierstrassCurve.Affine.Point.some x y₀ h}.ncard = 3 := sorry

/-! ### DeMarco–Krieger–Ye: the Legendre pairs

Statements that need the Berkovich line, the hybrid space or the adelic heights `h_{F,η}` of DY.4
(Propositions 3.2 and 3.5 on measures, the degeneration theorem of DeMarco–Faber and Favre,
Proposition 4.4, Lemma 6.2 and Proposition 7.3) are not stated here: their objects have no Lean
interface yet (TropicalAndBerkovichArithmetic:TB.0, DY.2, DY.4). The escape rates are DY.2's
`escapeRate` of the lifts `legendreLift t`, the global pairing is DY.4's `RationalMap.azPairing`
over a number field containing the parameters, and the local energy is the stand-in
`legendreLocalEnergy` (TB.6). -/

section Legendre_DKY

variable {L : Type*} [NormedField L] [CharZero L]

/-- `DY.6/legendre-escape-rate-symmetries` (DeMarco–Krieger–Ye Proposition 2.1). -/
theorem legendre_escapeRate_symmetries (t z : L) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    escapeRate (NormedField.toAbsoluteValue L) (legendreLift (1 - t)) ![1 - z, 1] =
        escapeRate (NormedField.toAbsoluteValue L) (legendreLift t) ![z, 1] ∧
      escapeRate (NormedField.toAbsoluteValue L) (legendreLift t) ![z, 1] =
        escapeRate (NormedField.toAbsoluteValue L) (legendreLift t⁻¹) ![z, t] ∧
      escapeRate (NormedField.toAbsoluteValue L) (legendreLift t⁻¹) ![z, t] =
        escapeRate (NormedField.toAbsoluteValue L) (legendreLift t⁻¹) ![z / t, 1] +
          Real.log ‖t‖ := sorry

/-- `DY.6/legendre-local-energy-symmetries` (Proposition 2.3). -/
theorem legendre_localEnergy_symmetries (t₁ t₂ : L) (h₁ : t₁ ≠ 0 ∧ t₁ ≠ 1)
    (h₂ : t₂ ≠ 0 ∧ t₂ ≠ 1) :
    legendreLocalEnergy t₂ t₁ = legendreLocalEnergy t₁ t₂ ∧
      legendreLocalEnergy t₁ t₂ = legendreLocalEnergy (1 - t₁) (1 - t₂) ∧
      legendreLocalEnergy t₁ t₂ = legendreLocalEnergy t₁⁻¹ t₂⁻¹ := sorry

/-- `DY.6/legendre-canonical-measure-away-from-two` (Proposition 3.2), in escape-rate form: at a
nonarchimedean place `v ∤ 2`, the local height is `log⁺|z|` (canonical measure at the Gauss point)
exactly when `|t(t − 1)|_v = 1`. -/
theorem legendre_goodReduction_iff [IsUltrametricDist L] (h2 : ‖(2 : L)‖ = 1) (t : L)
    (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    (∀ z : L, escapeRate (NormedField.toAbsoluteValue L) (legendreLift t) ![z, 1] =
        Real.log (max ‖z‖ 1)) ↔ ‖t * (t - 1)‖ = 1 :=
  sorry

/-- `DY.6/legendre-escape-rate-away-from-two` (Propositions 3.3–3.4), the case `|t|_v ≥ 1`,
`|t − 1|_v ≥ 1`. -/
theorem legendre_escapeRate_away_from_two [IsUltrametricDist L] (h2 : ‖(2 : L)‖ = 1) (t z : L)
    (ht : 1 ≤ ‖t * (t - 1)‖) (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    escapeRate (NormedField.toAbsoluteValue L) (legendreLift t) ![z, 1] =
      if ‖t‖ ≤ ‖z‖ then Real.log ‖z‖
      else if 1 < ‖z‖ then (Real.log ‖z‖ ^ 2 / Real.log ‖t‖ + Real.log ‖t‖) / 2
      else Real.log ‖t‖ / 2 := sorry

/-- `DY.6/legendre-escape-rate-away-from-two` (Proposition 3.4), the case `|t|_v < 1`. -/
theorem legendre_escapeRate_small_parameter [IsUltrametricDist L] (h2 : ‖(2 : L)‖ = 1) (t z : L)
    (ht : ‖t‖ < 1) (ht₀ : t ≠ 0) :
    escapeRate (NormedField.toAbsoluteValue L) (legendreLift t) ![z, 1] =
      if 1 ≤ ‖z‖ then Real.log ‖z‖
      else if ‖t‖ < ‖z‖ then -(Real.log ‖z‖ ^ 2) / (2 * Real.log ‖t‖) + Real.log ‖z‖
      else Real.log ‖t‖ / 2 := sorry

/-- `DY.6/legendre-escape-rate-above-two` (Proposition 3.6), both ranges, with the middle range of
(3.5) corrected to `|t/4| < |z| < |4|` (ArithmeticDynamics/E701). -/
theorem legendre_escapeRate_above_two [IsUltrametricDist L] (h2 : ‖(2 : L)‖ < 1) (t z : L)
    (ht₀ : t ≠ 0) (ht₁ : t ≠ 1) :
    (1 / ‖(16 : L)‖ ≤ ‖t‖ →
      escapeRate (NormedField.toAbsoluteValue L) (legendreLift t) ![z, 1] =
        if ‖4 * t‖ ≤ ‖z‖ then Real.log ‖z‖
        else if 1 / ‖(4 : L)‖ < ‖z‖ then
          (Real.log ‖4 * z‖ ^ 2 / Real.log ‖16 * t‖ + Real.log ‖t‖) / 2
        else Real.log ‖t‖ / 2) ∧
    (‖t‖ ≤ ‖(16 : L)‖ →
      escapeRate (NormedField.toAbsoluteValue L) (legendreLift t) ![z, 1] =
        if ‖(4 : L)‖ ≤ ‖z‖ then Real.log ‖z‖
        else if ‖t / 4‖ < ‖z‖ then
          (Real.log ‖4 * z / t‖ ^ 2 / Real.log ‖16 / t‖ + Real.log ‖t‖) / 2
        else Real.log ‖t‖ / 2) := sorry

/-- `DY.6/nonarchimedean-legendre-energy-lower-bound` (Theorem 3.1). -/
theorem legendre_localEnergy_lower_bound [IsUltrametricDist L] (t₁ t₂ : L)
    (h₁ : t₁ ≠ 0 ∧ t₁ ≠ 1) (h₂ : t₂ ≠ 0 ∧ t₂ ≠ 1) :
    legendreLocalEnergy t₁ t₂ - 4 / 3 * Real.log ‖(2 : L)‖ ≥
      if 1 < min ‖t₁‖ ‖t₂‖ then Real.log ‖t₁ / t₂‖ ^ 2 / (6 * Real.log (max ‖t₁‖ ‖t₂‖))
      else if max ‖t₁‖ ‖t₂‖ < 1 then Real.log ‖t₁ / t₂‖ ^ 2 / (-6 * Real.log (min ‖t₁‖ ‖t₂‖))
      else |Real.log ‖t₁ / t₂‖| / 6 := sorry

end Legendre_DKY

/-- The central values `φ̂_f(ζ_{0,|T|^a})` of the limiting potential of DeMarco–Krieger–Ye (4.8),
in units of `log |t|⁻¹`: `0` for `a ≤ 0`, `−a + a²/2` for `0 ≤ a ≤ 1`, `−1/2` for `a ≥ 1`. -/
noncomputable def legendreCentralPotential (a : ℝ) : ℝ :=
  if a ≤ 0 then 0 else if a ≤ 1 then -a + a ^ 2 / 2 else -1 / 2

/-- `DY.6/legendre-measure-on-annuli-near-cusp` (Lemma 4.1), for DY.2's archimedean canonical
measure of the Legendre map `f_t` on the Riemann sphere. -/
theorem legendreMeasure_annuli (ε : ℝ) (hε : 0 < ε) (n : ℕ) (hn : 1 ≤ n) :
    ∃ δ > 0, ∀ t : ℂ, 0 < ‖t‖ → ‖t‖ < δ → ∀ i < n,
      |(archimedeanCanonicalMeasure (legendreLattesMap t)
          (((↑) : ℂ → OnePoint ℂ) ''
            {z : ℂ | ‖t‖ ^ (((i : ℝ) + 1) / n) ≤ ‖z‖ ∧ ‖z‖ ≤ ‖t‖ ^ ((i : ℝ) / n)})).toReal -
          1 / n| < ε := sorry

/-- `DY.6/legendre-potential-continuity-near-cusp` (Proposition 4.2), for DY.2's escape rate. -/
theorem legendre_potential_near_cusp (ε : ℝ) (hε : 0 < ε) :
    ∃ δ > 0, ∀ t : ℂ, 0 < ‖t‖ → ‖t‖ < δ → ∀ a : ℝ, ∀ z : ℂ, z ≠ 0 →
      |Real.log ‖z‖ / Real.log ‖t‖ - a| < δ →
        |(escapeRate (NormedField.toAbsoluteValue ℂ) (legendreLift t) ![z, 1] -
              Real.log (max ‖z‖ 1)) / Real.log ‖t‖⁻¹ -
            legendreCentralPotential a| < ε := sorry

/-- `DY.6/archimedean-energy-one-escaping-parameter` (Theorem 5.1). -/
theorem archimedean_energy_one_escaping (ε : ℝ) (hε : 0 < ε) (C : Set ℂ) (hC : IsCompact C)
    (hC₀ : (0 : ℂ) ∉ C) (hC₁ : (1 : ℂ) ∉ C) :
    ∃ δ > 0, ∀ s : ℂ, 0 < ‖s‖ → ‖s‖ < δ → ∀ t ∈ C,
      (1 / 6 - ε) * Real.log ‖s‖⁻¹ ≤ legendreLocalEnergy s t ∧
        legendreLocalEnergy s t ≤ (1 / 6 + ε) * Real.log ‖s‖⁻¹ := sorry

/-- `DY.6/archimedean-energy-same-cusp-bounded-ratio` (Proposition 5.3). -/
theorem archimedean_energy_same_cusp_bounded (ε B : ℝ) (hε : 0 < ε) (hB : 2 < B) :
    ∃ δ > 0, ∀ s t : ℂ, 0 < ‖t‖ ^ B → ‖t‖ ^ B ≤ ‖s‖ → ‖s‖ ≤ ‖t‖ → ‖t‖ < δ →
      let b := Real.log ‖s‖ / Real.log ‖t‖
      ((b - 1) ^ 2 / (6 * b) - ε) * Real.log ‖t‖⁻¹ ≤ legendreLocalEnergy s t ∧
        legendreLocalEnergy s t ≤ ((b - 1) ^ 2 / (6 * b) + ε) * Real.log ‖t‖⁻¹ := sorry

/-- `DY.6/archimedean-energy-same-cusp` (Theorems 5.2 and 5.4). -/
theorem archimedean_energy_same_cusp (ε : ℝ) (hε : 0 < ε) :
    ∃ δ > 0, ∀ s t : ℂ, 0 < ‖s‖ → ‖s‖ ≤ ‖t‖ → ‖t‖ < δ →
      let b := Real.log ‖s‖ / Real.log ‖t‖
      ((1 / 6) * (1 - 1 / b) ^ 2 - ε) * Real.log ‖s‖⁻¹ ≤ legendreLocalEnergy s t ∧
        legendreLocalEnergy s t ≤ ((1 / 6) * (1 - 1 / b) ^ 2 + ε) * Real.log ‖s‖⁻¹ := sorry

/-- `DY.6/archimedean-energy-opposite-cusps` (Theorem 5.5). -/
theorem archimedean_energy_opposite_cusps (ε : ℝ) (hε : 0 < ε) :
    ∃ δ > 0, ∀ s t : ℂ, 1 / δ < ‖t‖ → 0 < ‖s‖ → ‖s‖ ≤ 1 / ‖t‖ →
      let b := -Real.log ‖s‖ / Real.log ‖t‖
      ((1 / 6) * (1 + 1 / b) - ε) * Real.log ‖s‖⁻¹ ≤ legendreLocalEnergy s t ∧
        legendreLocalEnergy s t ≤ ((1 / 6) * (1 + 1 / b) + ε) * Real.log ‖s‖⁻¹ := sorry

/-- `DY.6/archimedean-good-places-energy-bound` (Lemma 6.1). -/
theorem archimedean_good_place_energy (r : ℝ) (hr : 0 < r) (hr' : r ≤ 1 / 16) :
    ∃ C₀ > 0, ∀ t₁ t₂ : ℂ, t₁ ≠ 0 → t₁ ≠ 1 → t₂ ≠ 0 → t₂ ≠ 1 →
      r * max |Real.log ‖t₁‖| |Real.log ‖t₂‖| ≤ |Real.log ‖t₂ / t₁‖| →
        3 * r / 4 * |Real.log ‖t₁ / t₂‖| - C₀ ≤ 6 * legendreLocalEnergy t₁ t₂ := sorry

/-- `DY.6/birational-height-comparison` (Lemma 6.3), for parameters in a number field. -/
theorem birational_height_comparison :
    ∃ C : ℝ, ∀ (K : Type) [Field K] [NumberField K] (t₁ t₂ : K), t₁ ≠ t₂ → t₁ ≠ 0 → t₁ ≠ 1 →
      t₂ ≠ 0 → t₂ ≠ 1 →
        pairHeight t₁ t₂ / 2 - C ≤ pairHeight (t₂ / t₁) ((1 - t₂) / (1 - t₁)) := sorry

/-- `DY.6/legendre-pairing-height-lower-bound` (Theorem 1.6; published Theorem 1.7), with DY.4's
Arakelov–Zhang pairing over a number field containing the parameters. -/
theorem legendrePairing_ge_height :
    ∃ α β : ℝ, 0 < α ∧ 0 < β ∧ ∀ (K : Type) [Field K] [NumberField K] (t₁ t₂ : K), t₁ ≠ t₂ →
      t₁ ≠ 0 → t₁ ≠ 1 → t₂ ≠ 0 → t₂ ≠ 1 →
        α * pairHeight t₁ t₂ - β ≤
          RationalMap.azPairing (legendreLattesMap t₁) (legendreLattesMap t₂) := sorry

/-- `DY.6/legendre-pairing-uniform-positivity` (Theorem 1.5; published Theorem 1.6). -/
theorem legendrePairing_uniform_pos :
    ∃ δ > 0, ∀ (K : Type) [Field K] [NumberField K] (t₁ t₂ : K), t₁ ≠ t₂ → t₁ ≠ 0 → t₁ ≠ 1 →
      t₂ ≠ 0 → t₂ ≠ 1 →
        δ ≤ RationalMap.azPairing (legendreLattesMap t₁) (legendreLattesMap t₂) := sorry

/-- The set `S(b, t₁, t₂)` of joint small points (DY.1's canonical heights on `ℙ¹(ℚ̄)`). -/
def legendreSmallPoints (b : ℝ) (t₁ t₂ : AlgebraicClosure ℚ) :
    Set (ℙ (AlgebraicClosure ℚ) (Fin 2 → AlgebraicClosure ℚ)) :=
  {x | legendreCanonicalHeight t₁ x + legendreCanonicalHeight t₂ x ≤ b}

/-- `DY.6/legendre-joint-small-points-finite` (Proposition 1.8; published Proposition 1.9). -/
theorem legendreSmallPoints_finite :
    ∃ δ > 0, ∀ b : ℝ, 0 < b → b < δ / 2 → ∀ t₁ t₂ : AlgebraicClosure ℚ, t₁ ≠ t₂ → t₁ ≠ 0 →
      t₁ ≠ 1 → t₂ ≠ 0 → t₂ ≠ 1 → (legendreSmallPoints b t₁ t₂).Finite := sorry

/-- `DY.6/legendre-pairing-upper-bound-small-points` (Theorem 7.1; Theorem 1.7 for `b = 0`). -/
theorem legendrePairing_le_of_smallPoints (δ : ℝ)
    (hδ : ∀ (K : Type) [Field K] [NumberField K] (t₁ t₂ : K), t₁ ≠ t₂ → t₁ ≠ 0 → t₁ ≠ 1 →
      t₂ ≠ 0 → t₂ ≠ 1 → δ ≤ RationalMap.azPairing (legendreLattesMap t₁) (legendreLattesMap t₂))
    (b : ℝ) (hb : 0 ≤ b) (hbδ : b < δ / 2) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ (K : Type) [Field K] [NumberField K] (σ : K →+* AlgebraicClosure ℚ) (t₁ t₂ : K),
      t₁ ≠ t₂ → t₁ ≠ 0 → t₁ ≠ 1 → t₂ ≠ 0 → t₂ ≠ 1 →
        RationalMap.azPairing (legendreLattesMap t₁) (legendreLattesMap t₂) ≤
          4 * b + (ε + C / (legendreSmallPoints b (σ t₁) (σ t₂)).ncard) *
            (pairHeight t₁ t₂ + 1) := sorry

/-- `DY.6/legendre-uniform-joint-small-points` (Theorem 8.1). -/
theorem legendreSmallPoints_uniform :
    ∃ (B : ℕ) (b : ℝ), 0 < b ∧ ∀ t₁ t₂ : AlgebraicClosure ℚ, t₁ ≠ t₂ → t₁ ≠ 0 → t₁ ≠ 1 →
      t₂ ≠ 0 → t₂ ≠ 1 → (legendreSmallPoints b t₁ t₂).ncard ≤ B := sorry

/-- The torsion images `π(E_t^tors) = x(E_t^tors)` of the Legendre curve over `ℂ`. -/
def legendreTorsionImages (t : ℂ) : Set (ℙ ℂ (Fin 2 → ℂ)) :=
  haveI := Classical.decEq ℂ
  xCoordP1 '' {P : (legendreCurve t).toAffine.Point | IsOfFinAddOrder P}

/-- `DY.6/torsion-images-common-to-all-legendre-curves` (DeMarco–Wang–Ye Proposition 1.4). -/
theorem torsionImages_common_to_all_legendre :
    (⋂ t ∈ {t : ℂ | t ≠ 0 ∧ t ≠ 1}, legendreTorsionImages t) =
      {Projectivization.mk ℂ ![0, 1] (by simp), Projectivization.mk ℂ ![1, 1] (by simp),
        Projectivization.mk ℂ ![1, 0] (by simp)} := sorry

/-- `DY.6/algebraic-specialization-of-finitely-generated-algebras`. -/
theorem exists_algHom_algebraicClosure_ne_zero (R : Type*) [CommRing R] [IsDomain R] [Algebra ℚ R]
    [Algebra.FiniteType ℚ R] (s : R) (hs : s ≠ 0) :
    ∃ φ : R →ₐ[ℚ] AlgebraicClosure ℚ, φ s ≠ 0 := sorry

/-- `DY.6/legendre-uniform-common-torsion-images` (Theorem 1.4; published Theorem 1.5). -/
theorem legendre_uniform_common_torsion_images :
    ∃ B : ℕ, ∀ t₁ t₂ : ℂ, t₁ ≠ t₂ → t₁ ≠ 0 → t₁ ≠ 1 → t₂ ≠ 0 → t₂ ≠ 1 →
      (legendreTorsionImages t₁ ∩ legendreTorsionImages t₂).ncard ≤ B := sorry

/-- `DY.6/common-torsion-images-three-common-branch-values` (Corollary 8.2). -/
theorem common_torsion_images_three_branch_values :
    ∃ B : ℕ, ∀ (W₁ W₂ : WeierstrassCurve ℂ) (_ : W₁.Δ ≠ 0) (_ : W₂.Δ ≠ 0)
      (γ₁ γ₂ : PGL(2, ℂ)),
      haveI := Classical.decEq ℂ
      (standardProjection (W := W₁.toAffine) γ₁ '' {P | 2 • P = 0} ∩
          standardProjection (W := W₂.toAffine) γ₂ '' {P | 2 • P = 0}).ncard = 3 →
        (standardProjection (W := W₁.toAffine) γ₁ '' {P | IsOfFinAddOrder P} ∩
          standardProjection (W := W₂.toAffine) γ₂ '' {P | IsOfFinAddOrder P}).ncard ≤ B := sorry

/-- `DY.6/common-torsion-image-orders-unbounded` (Proposition 8.3, published version). -/
theorem common_torsion_image_orders_unbounded (N : ℕ) (x₀ : AlgebraicClosure ℚ) (h₀ : x₀ ≠ 0)
    (h₁ : x₀ ≠ 1) :
    haveI := Classical.decEq (AlgebraicClosure ℚ)
    ∃ t₁ t₂ : AlgebraicClosure ℚ, t₁ ≠ t₂ ∧ t₁ ≠ 0 ∧ t₁ ≠ 1 ∧ t₂ ≠ 0 ∧ t₂ ≠ 1 ∧
      ∃ (y₁ y₂ : AlgebraicClosure ℚ) (hy₁ : (legendreCurve t₁).toAffine.Nonsingular x₀ y₁)
        (hy₂ : (legendreCurve t₂).toAffine.Nonsingular x₀ y₂),
        IsOfFinAddOrder (WeierstrassCurve.Affine.Point.some x₀ y₁ hy₁) ∧
        IsOfFinAddOrder (WeierstrassCurve.Affine.Point.some x₀ y₂ hy₂) ∧
        N ≤ addOrderOf (WeierstrassCurve.Affine.Point.some x₀ y₁ hy₁) ∧
        N ≤ addOrderOf (WeierstrassCurve.Affine.Point.some x₀ y₂ hy₂) := sorry

/-! ### Finite unions of arithmetic progressions and dynamical Mordell–Lang -/

/-- `DY.6/finite-union-of-arithmetic-progressions`. -/
def IsFiniteUnionAP (S : Set ℕ) : Prop :=
  ∃ A : Finset (ℕ × ℕ), S = ⋃ ab ∈ A, Set.range fun k : ℕ => ab.1 * k + ab.2

theorem isFiniteUnionAP_iff_eventually_periodic (S : Set ℕ) :
    IsFiniteUnionAP S ↔ ∃ N p : ℕ, 0 < p ∧ ∀ n ≥ N, (n ∈ S ↔ n + p ∈ S) := sorry

theorem IsFiniteUnionAP.union {S T : Set ℕ} (hS : IsFiniteUnionAP S) (hT : IsFiniteUnionAP T) :
    IsFiniteUnionAP (S ∪ T) := sorry

theorem IsFiniteUnionAP.inter {S T : Set ℕ} (hS : IsFiniteUnionAP S) (hT : IsFiniteUnionAP T) :
    IsFiniteUnionAP (S ∩ T) := sorry

theorem IsFiniteUnionAP.compl {S : Set ℕ} (hS : IsFiniteUnionAP S) : IsFiniteUnionAP Sᶜ := sorry

theorem Set.Finite.isFiniteUnionAP {S : Set ℕ} (hS : S.Finite) : IsFiniteUnionAP S := sorry

theorem IsFiniteUnionAP.exists_infinite_ap {S : Set ℕ} (hS : IsFiniteUnionAP S) (hinf : S.Infinite) :
    ∃ a b : ℕ, 1 ≤ a ∧ ∀ k : ℕ, a * k + b ∈ S := sorry

theorem isFiniteUnionAP_preimage_affine (S : Set ℕ) (N : ℕ) (hN : 1 ≤ N) :
    IsFiniteUnionAP S ↔ ∀ j < N, IsFiniteUnionAP {k : ℕ | N * k + j ∈ S} := sorry

/-- Unit test `isFiniteUnionAP_evens_union`: `{1} ∪ 2ℕ` is a finite union of arithmetic
progressions. -/
example : IsFiniteUnionAP ({1} ∪ {n | Even n}) := sorry

/-- Unit test `isFiniteUnionAP_empty_univ`: `∅`, finite sets and `ℕ` qualify. -/
example : IsFiniteUnionAP ∅ ∧ IsFiniteUnionAP Set.univ ∧ IsFiniteUnionAP {3, 7} := sorry

/-- Unit test `isFiniteUnionAP_iff_eventuallyPeriodic`: equivalence with eventual periodicity. -/
example (S : Set ℕ) :
    IsFiniteUnionAP S ↔ ∃ N p : ℕ, 0 < p ∧ ∀ n ≥ N, (n ∈ S ↔ n + p ∈ S) :=
  isFiniteUnionAP_iff_eventually_periodic S

/-- Unit test `not_isFiniteUnionAP_powers`: the powers of `p ≥ 2` are not a finite union of
arithmetic progressions. -/
example (p : ℕ) (hp : 2 ≤ p) : ¬ IsFiniteUnionAP (Set.range fun k : ℕ => p ^ k) := sorry

section DML

open AlgebraicGeometry CategoryTheory

attribute [local instance] MvPolynomial.gradedAlgebra

/-- The return set `{n : Φⁿ(x) ∈ V}` of a point of a scheme under an endomorphism. -/
def dmlReturnSet {X : Scheme.{0}} (Φ : X ⟶ X) (V : Set X) (x : X) : Set ℕ :=
  {n | (⇑Φ.base)^[n] x ∈ V}

/-- `DML(X, Φ)`: every return set to a closed subset, from a closed point, is a finite union of
arithmetic progressions. -/
def DynamicalMordellLangProperty {X : Scheme.{0}} (Φ : X ⟶ X) : Prop :=
  ∀ V : Set X, IsClosed V → ∀ x : X, IsClosed ({x} : Set X) → IsFiniteUnionAP (dmlReturnSet Φ V x)

/-- Projective space `ℙᴺ_ℂ = Proj ℂ[x₀, …, x_N]`. -/
noncomputable abbrev projectiveSpaceC (N : ℕ) : Scheme :=
  Proj (MvPolynomial.homogeneousSubmodule (Fin (N + 1)) ℂ)

/-- `DY.6/dynamical-mordell-lang-conjecture`: for every quasi-projective `X` over `ℂ` (an
immersion into `ℙᴺ_ℂ`) and every `ℂ`-endomorphism `Φ`, `DML(X, Φ)` holds. A statement only. -/
def DynamicalMordellLangConjecture : Prop :=
  ∀ (X : Scheme.{0}) (N : ℕ) (i : X ⟶ projectiveSpaceC N) (_ : IsImmersion i) (Φ : X ⟶ X),
    Φ ≫ i ≫ Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin (N + 1)) ℂ) =
        i ≫ Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin (N + 1)) ℂ) →
      DynamicalMordellLangProperty Φ

/-- The affine special case `DML_affine(N)`: polynomial self-maps of `𝔸ᴺ_ℂ` and zero sets of
finite families of polynomials. -/
def DynamicalMordellLangAffine (N : ℕ) : Prop :=
  ∀ (Φ : Fin N → MvPolynomial (Fin N) ℂ) (G : Finset (MvPolynomial (Fin N) ℂ)) (α : Fin N → ℂ),
    IsFiniteUnionAP {n | ∀ g ∈ G,
      MvPolynomial.eval ((fun x i => MvPolynomial.eval x (Φ i))^[n] α) g = 0}

theorem dynamicalMordellLangProperty_iterate_iff {X : Scheme.{0}} (Φ : X ⟶ X) (k : ℕ) (hk : 1 ≤ k) :
    DynamicalMordellLangProperty Φ ↔
      DynamicalMordellLangProperty (Nat.iterate (fun g : X ⟶ X => g ≫ Φ) (k - 1) Φ) := sorry

/-- `DY.6/etale-dynamical-mordell-lang` (Bell–Ghioca–Tucker Theorem 1.3), as the API item
`dynamicalMordellLangProperty_of_etale`. -/
theorem dynamicalMordellLangProperty_of_etale (X : Scheme.{0}) (N : ℕ) (i : X ⟶ projectiveSpaceC N)
    (hi : IsImmersion i) (Φ : X ⟶ X) [Etale Φ]
    (hΦ : Φ ≫ i ≫ Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin (N + 1)) ℂ) =
      i ≫ Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin (N + 1)) ℂ)) :
    DynamicalMordellLangProperty Φ := sorry

theorem dynamicalMordellLangAffine_of_conjecture (h : DynamicalMordellLangConjecture) (N : ℕ) :
    DynamicalMordellLangAffine N := sorry

end DML

/-- Unit test `dmlSet_translation`: `z ↦ z + 1` on `𝔸¹`, `α = 0`, `V = {3}` gives `S = {3}`. -/
example : {n : ℕ | ((fun z : ℂ => z + 1)^[n] 0) - 3 = 0} = {3} := sorry

/-- Unit test `dmlSet_univ_empty`: `V = X` gives `ℕ` and `V = ∅` gives `∅`. -/
example {X : AlgebraicGeometry.Scheme.{0}} (Φ : X ⟶ X) (x : X) :
    dmlReturnSet Φ Set.univ x = Set.univ ∧ dmlReturnSet Φ ∅ x = ∅ := sorry

/-- Unit test `dml_linear_of_skolemMahlerLech`: for a linear map of `𝔸ᴺ_ℂ` and a linear form, the
return set is the zero set of a linear recurrence sequence, a finite union of arithmetic
progressions (Skolem–Mahler–Lech). -/
example (N : ℕ) (A : Matrix (Fin N) (Fin N) ℂ) (ℓ α : Fin N → ℂ) :
    IsFiniteUnionAP {n : ℕ | ∑ i, ℓ i * ((A ^ n).mulVec α) i = 0} := sorry

/-- Unit test `dml_fails_char_p`: Ghioca's example over `𝔽_p(t)`: the return set
`{(p^{2j} − 1)/(p² − 1)}` is not a finite union of arithmetic progressions. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsFiniteUnionAP {n : ℕ | (RatFunc.X : RatFunc (ZMod p)) ^ (n * (p ^ 2 - 1) + 1) +
        (1 - RatFunc.X) ^ (n * (p ^ 2 - 1) + 1) = 1} := sorry

/-- `DY.6/dml-fails-in-positive-characteristic` (Ghioca, Example 1.4). -/
theorem dml_positive_characteristic_example (p : ℕ) [Fact p.Prime] :
    {n : ℕ | (RatFunc.X : RatFunc (ZMod p)) ^ (n * (p ^ 2 - 1) + 1) +
        (1 - RatFunc.X) ^ (n * (p ^ 2 - 1) + 1) = 1} =
      Set.range (fun j : ℕ => (p ^ (2 * j) - 1) / (p ^ 2 - 1)) ∧
    ¬ IsFiniteUnionAP (Set.range (fun j : ℕ => (p ^ (2 * j) - 1) / (p ^ 2 - 1))) := sorry

/-- `DY.6/strassmann-theorem`: a nonzero power series over `ℚ_p` with coefficients tending to `0`
has finitely many zeros in `ℤ_p`. -/
theorem strassmann (p : ℕ) [Fact p.Prime] (c : ℕ → ℚ_[p]) (hc : Tendsto c atTop (nhds 0))
    (hne : ∃ i, c i ≠ 0) :
    {z : ℤ_[p] | HasSum (fun i => c i * (z : ℚ_[p]) ^ i) 0}.Finite := sorry

/-- `DY.6/p-adic-analytic-interpolation-of-orbits` (Bell–Ghioca–Tucker Theorem 3.3), for
polynomial maps `ϕ` (the source allows convergent power series): the coordinates of the orbit of
`ω` are the values at `k ∈ ℕ` of power series convergent on `ℤ_p`. -/
theorem padic_interpolation_of_orbits (p : ℕ) [Fact p.Prime] (hp : 3 < p) (n : ℕ)
    (ϕ : Fin n → MvPolynomial (Fin n) ℤ_[p])
    (ha : ∀ i, (p : ℤ_[p]) ∣ (ϕ i).coeff (Finsupp.single i 1) - 1 ∧
      ∀ m : Fin n →₀ ℕ, m ≠ Finsupp.single i 1 → m.sum (fun _ e => e) ≤ 1 →
        (p : ℤ_[p]) ∣ (ϕ i).coeff m)
    (hb : ∀ i, ∀ m : Fin n →₀ ℕ, 2 ≤ m.sum (fun _ e => e) →
      (p : ℤ_[p]) ^ (m.sum (fun _ e => e) - 1) ∣ (ϕ i).coeff m)
    (ω : Fin n → ℤ_[p]) :
    ∃ a : Fin n → ℕ → ℚ_[p], (∀ i, Tendsto (a i) atTop (nhds 0)) ∧
      ∀ (k : ℕ) (i : Fin n), HasSum (fun j => a i j * (k : ℚ_[p]) ^ j)
        ((((fun x i => MvPolynomial.eval x (ϕ i))^[k] ω) i : ℤ_[p]) : ℚ_[p]) := sorry


/-! ### Conjectures, stated as propositions (consumed only as explicit hypotheses) -/

/-- The field of definition degree `[K(x) : K]` of a point of `ℙ¹(ℚ̄)` over a number field
`K ⊆ ℚ̄` (`∞` has degree `1`). -/
noncomputable def pointDegree (K : IntermediateField ℚ (AlgebraicClosure ℚ))
    (P : ℙ (AlgebraicClosure ℚ) (Fin 2 → AlgebraicClosure ℚ)) : ℕ :=
  open scoped Classical in
  OnePoint.elim ((OnePoint.equivProjectivization (AlgebraicClosure ℚ)).symm P) 1
    (fun x ↦ Module.finrank K (IntermediateField.adjoin K {x}))

/-- A rational map over `ℚ̄` is defined over the subfield `K`: it is DY.0's base change of a
rational map over `K`. -/
def RationalMapDefinedOver (K : IntermediateField ℚ (AlgebraicClosure ℚ))
    (f : RationalMap (AlgebraicClosure ℚ)) : Prop :=
  ∃ g : RationalMap K, RationalMap.map (algebraMap K (AlgebraicClosure ℚ)) g = f

/-- `DY.6/dynamical-lehmer-conjecture`: `Lehmer(f)`, for DY.1's canonical height. -/
def DynamicalLehmerProperty (K : IntermediateField ℚ (AlgebraicClosure ℚ))
    (f : RationalMap (AlgebraicClosure ℚ)) : Prop :=
  ∃ C > 0, ∀ x : ℙ (AlgebraicClosure ℚ) (Fin 2 → AlgebraicClosure ℚ),
    ¬ IsPreperiodicPt (RationalMap.toEnd f) x → C / pointDegree K x ≤ f.canonicalHeight x

/-- The dynamical Lehmer conjecture for maps of `ℙ¹`. A statement only. -/
def DynamicalLehmerConjecture : Prop :=
  ∀ (K : IntermediateField ℚ (AlgebraicClosure ℚ)), FiniteDimensional ℚ K →
    ∀ f : RationalMap (AlgebraicClosure ℚ), RationalMapDefinedOver K f → 2 ≤ f.degree →
      DynamicalLehmerProperty K f

/-- Conjugation by `γ ∈ PGL₂(K)` (DY.0's action, after base change to `ℚ̄`). -/
theorem dynamicalLehmerProperty_conj_iff (K : IntermediateField ℚ (AlgebraicClosure ℚ))
    (f : RationalMap (AlgebraicClosure ℚ)) (γ : GL (Fin 2) K) :
    DynamicalLehmerProperty K
        (Matrix.ProjGenLinGroup.mk
          (Matrix.GeneralLinearGroup.map (algebraMap K (AlgebraicClosure ℚ)) γ) • f) ↔
      DynamicalLehmerProperty K f := sorry

theorem dynamicalLehmerProperty_iterate_iff (K : IntermediateField ℚ (AlgebraicClosure ℚ))
    (f : RationalMap (AlgebraicClosure ℚ)) (hf : 2 ≤ f.degree) {n : ℕ} (hn : 1 ≤ n) :
    DynamicalLehmerProperty K (f ^ n) ↔ DynamicalLehmerProperty K f := sorry

/-- Unit test `dynamicalLehmer_powerMap_two_example`: `ĥ_{z²}(2) = log 2`. -/
example : (powerMap (AlgebraicClosure ℚ) 2).canonicalHeight
    (Projectivization.mk _ ![2, 1] (by simp)) = Real.log 2 := sorry

/-- Unit test `dynamicalLehmer_degree_one_points`: on points of degree one the Lehmer bound holds
unconditionally (Northcott). -/
example (K : IntermediateField ℚ (AlgebraicClosure ℚ)) [FiniteDimensional ℚ K]
    (f : RationalMap (AlgebraicClosure ℚ)) (hK : RationalMapDefinedOver K f) (hf : 2 ≤ f.degree) :
    ∃ C > 0, ∀ x : ℙ (AlgebraicClosure ℚ) (Fin 2 → AlgebraicClosure ℚ), pointDegree K x = 1 →
      ¬ IsPreperiodicPt (RationalMap.toEnd f) x → C ≤ f.canonicalHeight x := sorry

/-- Unit test `dynamicalLehmer_powerMap_iff_lehmer`: `Lehmer(z²)` over `ℚ` is Lehmer's
conjecture. -/
example : DynamicalLehmerProperty ⊥ (powerMap (AlgebraicClosure ℚ) 2) ↔
    ∃ C > 0, ∀ α : AlgebraicClosure ℚ, α ≠ 0 → ¬ IsOfFinOrder α →
      C / Module.finrank ℚ (IntermediateField.adjoin ℚ {α}) ≤ NumberField.absLogHeight₁ α := sorry

/-- Unit test `dynamicalLehmer_needs_degree`: without `1/[K(x) : K]` the bound fails:
`ĥ_{z²}(2^{1/n}) = (log 2)/n`. -/
example (n : ℕ) (hn : 1 ≤ n) (α : AlgebraicClosure ℚ) (hα : α ^ n = 2) :
    (powerMap (AlgebraicClosure ℚ) 2).canonicalHeight
      (Projectivization.mk _ ![α, 1] (by simp)) = Real.log 2 / n := sorry

/-- API of `DY.3/uniform-boundedness-conjecture` (stated here, where the conditional theorem
consumes it): `UBC(1, d, D; C)`, for DY.0's preperiodic points of `toEnd f` in `ℙ¹(K)`. -/
def UniformBoundednessProperty (d D C : ℕ) : Prop :=
  ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = D →
    ∀ f : RationalMap K, f.degree = d → (preperiodicPts (RationalMap.toEnd f)).ncard ≤ C

/-- The proposition `∀ d ≥ 2, ∀ D ≥ 1, ∃ C, UBC(1, d, D; C)` of `DY.3/uniform-boundedness-conjecture`
in its `ℙ¹` form is DY.3's `UniformBoundednessConjecture` (which bounds fields of degree `≤ D`) for all `d ≥ 2`,
`D ≥ 1`. -/
theorem forall_uniformBoundednessConjecture_iff :
    (∀ d D : ℕ, 2 ≤ d → 1 ≤ D → UniformBoundednessConjecture d D) ↔
      ∀ d D : ℕ, 2 ≤ d → 1 ≤ D → ∃ C, UniformBoundednessProperty d D C := sorry

theorem UniformBoundednessProperty.mono {d D C C' : ℕ} (h : UniformBoundednessProperty d D C)
    (hC : C ≤ C') : UniformBoundednessProperty d D C' := sorry

theorem prePer_finite {K : Type*} [Field K] [NumberField K] (f : RationalMap K)
    (hf : 2 ≤ f.degree) : (preperiodicPts (RationalMap.toEnd f)).Finite := sorry

/-- Unit test `prePer_sq_rat`: `PrePer(z², ℙ¹(ℚ)) = {0, 1, −1, ∞}`. -/
example : preperiodicPts (RationalMap.toEnd (powerMap ℚ 2)) =
    {Projectivization.mk ℚ ![0, 1] (by simp), Projectivization.mk ℚ ![1, 1] (by simp),
      Projectivization.mk ℚ ![-1, 1] (by simp), Projectivization.mk ℚ ![1, 0] (by simp)} := sorry

/-- Unit test `uniformBoundedness_fixed_map`: for a fixed map the set is finite. -/
example (K : Type*) [Field K] [NumberField K] (f : RationalMap K) (hf : 2 ≤ f.degree) :
    (preperiodicPts (RationalMap.toEnd f)).Finite := prePer_finite f hf

/-- `DY.6/uniform-torsion-bound-of-uniform-boundedness`: `UBC(1, 4, D; C)` bounds torsion on
elliptic curves over number fields of degree `D`. -/
theorem uniform_torsion_bound_of_uniformBoundedness (D C : ℕ)
    (h : UniformBoundednessProperty 4 D C) (K : Type) [Field K] [NumberField K] [DecidableEq K]
    (hK : Module.finrank ℚ K = D) (W : WeierstrassCurve K) (hΔ : W.Δ ≠ 0) :
    {P : W.toAffine.Point | IsOfFinAddOrder P}.ncard ≤ 2 * C := sorry

/-- Unit test `uniformBoundedness_implies_torsion_bound`: the conditional torsion bound. -/
example (D C : ℕ) (h : UniformBoundednessProperty 4 D C) (K : Type) [Field K] [NumberField K]
    [DecidableEq K] (hK : Module.finrank ℚ K = D) (W : WeierstrassCurve K) (hΔ : W.Δ ≠ 0) :
    {P : W.toAffine.Point | IsOfFinAddOrder P}.ncard ≤ 2 * C :=
  uniform_torsion_bound_of_uniformBoundedness D C h K hK W hΔ

/-- Unit test `uniformBoundedness_needs_degree_bound`: `PrePer(z², ℙ¹(ℚ(ζ_N)))` has at least `N`
elements. -/
example (N : ℕ) (hN : 1 ≤ N) (K : Type) [Field K] [NumberField K] (ζ : K)
    (hζ : IsPrimitiveRoot ζ N) :
    N ≤ (preperiodicPts (RationalMap.toEnd (powerMap K 2))).ncard := sorry

/-- `DY.6/dynamically-related-points`: `a` and `b` are `f`-dynamically related: for a lift `F` of
`f`, some nonzero bihomogeneous `Q` of positive degree vanishes at `(a, b)` and divides
`Q ∘ (F × F)` (the curve `Q = 0` is `(f × f)`-invariant). -/
def DynamicallyRelated {K : Type*} [Field K] (f : RationalMap K) (a b : ℙ K (Fin 2 → K)) : Prop :=
  ∃ (F : HomogeneousLift K f.degree) (Q : MvPolynomial (Fin 2 ⊕ Fin 2) K) (m n : ℕ),
    RationalMap.mk F = f ∧ Q ≠ 0 ∧ 0 < m + n ∧
    (MvPolynomial.IsWeightedHomogeneous (Sum.elim (fun _ => 1) (fun _ => 0)) Q m) ∧
    (MvPolynomial.IsWeightedHomogeneous (Sum.elim (fun _ => 0) (fun _ => 1)) Q n) ∧
    MvPolynomial.eval (Sum.elim a.rep b.rep) Q = 0 ∧
    Q ∣ MvPolynomial.bind₁ (Sum.elim
      (fun i => MvPolynomial.rename Sum.inl (F.forms i))
      (fun i => MvPolynomial.rename Sum.inr (F.forms i))) Q

section DynamicallyRelatedAPI

variable {K : Type*} [Field K] (f : RationalMap K)

theorem DynamicallyRelated.symm {a b : ℙ K (Fin 2 → K)} (h : DynamicallyRelated f a b) :
    DynamicallyRelated f b a := sorry

theorem DynamicallyRelated.refl (a : ℙ K (Fin 2 → K)) : DynamicallyRelated f a a := sorry

theorem dynamicallyRelated_of_isPreperiodic (a b : ℙ K (Fin 2 → K))
    (ha : IsPreperiodicPt (RationalMap.toEnd f) a) : DynamicallyRelated f a b := sorry

/-- Simultaneous conjugation by DY.0's `PGL₂(K)` action preserves relatedness. -/
theorem DynamicallyRelated.conj (γ : PGL(2, K)) {a b : ℙ K (Fin 2 → K)}
    (h : DynamicallyRelated f a b) : DynamicallyRelated (γ • f) (γ • a) (γ • b) := sorry

end DynamicallyRelatedAPI

/-- Unit test `dynamicallyRelated_graph_sq`: for `f = z²` over `ℚ(t)`‾, `t` and `t²` are related
through the graph of `z²`. -/
example (t : AlgebraicClosure (RatFunc ℚ)) :
    DynamicallyRelated (RationalMap.ofPolynomial (X ^ 2 : (AlgebraicClosure (RatFunc ℚ))[X]))
      (Projectivization.mk _ ![t, 1] (by simp)) (Projectivization.mk _ ![t ^ 2, 1] (by simp)) :=
  sorry

/-- Unit test `dynamicallyRelated_refl`: every point is related to itself. -/
example (K : Type*) [Field K] (f : RationalMap K) (a : ℙ K (Fin 2 → K)) :
    DynamicallyRelated f a a := DynamicallyRelated.refl f a

/-- Unit test `dynamicallyRelated_preperiodic_example`: the fixed point `∞` of `z² + t` is related
to every point. -/
example (t : AlgebraicClosure (RatFunc ℚ))
    (b : ℙ (AlgebraicClosure (RatFunc ℚ)) (Fin 2 → AlgebraicClosure (RatFunc ℚ))) :
    DynamicallyRelated (RationalMap.ofPolynomial (X ^ 2 + C t))
      (Projectivization.mk _ ![1, 0] (by simp)) b := sorry

/-- Unit test `dynamicallyRelated_requires_invariance`: the vertical line through `0` is not
invariant under `z² + 1`, since `f(0) = 1 ≠ 0`. -/
example : ¬ ((MvPolynomial.X (Sum.inl 0) : MvPolynomial (Fin 2 ⊕ Fin 2) ℚ) ∣
    MvPolynomial.bind₁ (Sum.elim
      (fun i => MvPolynomial.rename Sum.inl
        (![MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2, MvPolynomial.X 1 ^ 2] i))
      (fun i => MvPolynomial.rename Sum.inr
        (![MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2, MvPolynomial.X 1 ^ 2] i)))
      (MvPolynomial.X (Sum.inl 0))) := sorry

/-- The algebraic closure of `ℚ̄(t)`, over which the critical points of a family live. -/
abbrev GenericClosure := AlgebraicClosure (RatFunc (AlgebraicClosure ℚ))

/-- `DY.6/dynamical-andre-oort-conjecture`: `DAO(f)` for a family `f` over `ℚ̄(t)`: infinitely
many PCF specialisations if and only if all pairs of DY.0's critical points of `f` (over an
algebraic closure of `ℚ̄(t)`) are `f`-dynamically related. -/
def DynamicalAndreOortProperty (f : RationalMap (RatFunc (AlgebraicClosure ℚ))) : Prop :=
  (goodSet f ∩ {t₀ | IsPostcriticallyFinite (specialize f t₀)}).Infinite ↔
    ∀ c₁ ∈ (RationalMap.map (algebraMap _ GenericClosure) f).criticalPoints,
      ∀ c₂ ∈ (RationalMap.map (algebraMap _ GenericClosure) f).criticalPoints,
        DynamicallyRelated (RationalMap.map (algebraMap _ GenericClosure) f) c₁ c₂

/-- The dynamical André–Oort conjecture for one-parameter families (Baker–DeMarco), for families
that are not isotrivial in moduli (no single map to which all specialisations are conjugate, DY.0's
`IsConj`). A statement only. -/
def DynamicalAndreOortConjecture : Prop :=
  ∀ f : RationalMap (RatFunc (AlgebraicClosure ℚ)), 2 ≤ f.degree →
    (¬ ∃ g : RationalMap (AlgebraicClosure (AlgebraicClosure ℚ)), ∀ t₀ ∈ goodSet f,
        IsConj (specialize f t₀) g) →
      DynamicalAndreOortProperty f

theorem dynamicalAndreOortProperty_of_all_preperiodic (f : RationalMap (RatFunc (AlgebraicClosure ℚ)))
    (hf : 2 ≤ f.degree)
    (h : ∀ c ∈ (RationalMap.map (algebraMap _ GenericClosure) f).criticalPoints,
      IsPreperiodicPt (RationalMap.toEnd (RationalMap.map (algebraMap _ GenericClosure) f)) c) :
    DynamicalAndreOortProperty f := sorry

/-- Unit test `dao_sq_add_t`: both sides of `DAO` hold for `z² + t`. -/
example : DynamicalAndreOortProperty
    (RationalMap.ofPolynomial (X ^ 2 + C (RatFunc.X : RatFunc (AlgebraicClosure ℚ)))) := sorry

/-- Unit test `dao_all_preperiodic`: if every critical point is preperiodic, `DAO` holds. -/
example (f : RationalMap (RatFunc (AlgebraicClosure ℚ))) (hf : 2 ≤ f.degree)
    (h : ∀ c ∈ (RationalMap.map (algebraMap _ GenericClosure) f).criticalPoints,
      IsPreperiodicPt (RationalMap.toEnd (RationalMap.map (algebraMap _ GenericClosure) f)) c) :
    DynamicalAndreOortProperty f := dynamicalAndreOortProperty_of_all_preperiodic f hf h

/-- Unit test `dao_legendre_family`: `DAO` holds for the Legendre family. -/
example : DynamicalAndreOortProperty
    (legendreLattesMap (RatFunc.X : RatFunc (AlgebraicClosure ℚ))) :=
  sorry

/-- Unit test `dao_constant_family`: for the constant family `z² + 1` the equivalence fails, which is
why the conjecture assumes non-isotriviality (ArithmeticDynamics/E710). -/
example : ¬ DynamicalAndreOortProperty
    (RationalMap.ofPolynomial (X ^ 2 + 1 : (RatFunc (AlgebraicClosure ℚ))[X])) := sorry

/-! ### Elliptic surfaces, Ingram's theorem and the Ghioca–Tucker–Zieve theorems -/

open Classical in
/-- `DY.6/elliptic-specialization-of-canonical-heights` (Silverman's theorem over the `t`-line,
through the Lattès map: the absolute Néron–Tate height of a fibre is `½ ĥ_{f_{E_{t₀},2}} ∘ x`, with
DY.1's canonical height). -/
theorem elliptic_specialization_of_canonicalHeight {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K[X]) [(W.baseChange (RatFunc K)).IsElliptic]
    (P : (W.baseChange (RatFunc K)).toAffine.Point) :
    ∀ ε > 0, ∃ H : ℝ, ∀ t₀ : AlgebraicClosure K, Polynomial.aeval t₀ W.Δ ≠ 0 →
      H ≤ NumberField.absLogHeight₁ t₀ →
        |(lattesMap (W.map (Polynomial.aeval t₀).toRingHom) 2).canonicalHeight
              (specializePoint (xCoordP1 P) t₀) / (2 * NumberField.absLogHeight₁ t₀) -
            neronTate (W.baseChange (RatFunc K)) P| ≤ ε := sorry

open Classical in
/-- `DY.6/tate-variation-of-canonical-height` (Tate's theorem over the `t`-line). -/
theorem tate_variation_of_canonicalHeight {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K[X]) [(W.baseChange (RatFunc K)).IsElliptic]
    (P : (W.baseChange (RatFunc K)).toAffine.Point) :
    ∃ C : ℝ, ∀ t₀ : AlgebraicClosure K, Polynomial.aeval t₀ W.Δ ≠ 0 →
      |(lattesMap (W.map (Polynomial.aeval t₀).toRingHom) 2).canonicalHeight
            (specializePoint (xCoordP1 P) t₀) / 2 -
          neronTate (W.baseChange (RatFunc K)) P * NumberField.absLogHeight₁ t₀| ≤ C := sorry

/-- `DY.6/critical-height-is-a-moduli-height` (Ingram, Theorem 1), on DY.0's moduli space. -/
theorem criticalHeight_comparable_moduliHeight (d : ℕ) (hd : 2 ≤ d) :
    ∃ c₁ c₂ c₃ c₄ : ℝ, 0 < c₁ ∧ 0 < c₃ ∧ ∀ (f : RationalMap (AlgebraicClosure ℚ))
      (hf : f.degree = d), ¬ IsFlexibleLattes f →
        c₁ * moduliHeight d (ModuliSpace.mk f hf) - c₂ ≤ criticalHeight f ∧
          criticalHeight f ≤ c₃ * moduliHeight d (ModuliSpace.mk f hf) + c₄ :=
  sorry

/-- `DY.6/polynomial-orbits-on-lines-equal-degree` (Ghioca–Tucker–Zieve Theorem 1.5; Theorem 1.1
is `α = 1`, `β = 0`). -/
theorem polynomial_orbits_on_line {K : Type*} [Field K] [CharZero K] (α β x₀ y₀ : K) (hα : α ≠ 0)
    (f g : K[X]) (hdeg : f.natDegree = g.natDegree) (h2 : 2 ≤ f.natDegree)
    (hinf : {mn : ℕ × ℕ | (fun y => g.eval y)^[mn.2] y₀ =
      α * (fun x => f.eval x)^[mn.1] x₀ + β}.Infinite) :
    ∃ k ≥ 1, (fun p => g.comp p)^[k] (C α * X + C β) = C α * (fun p => f.comp p)^[k] X + C β :=
  sorry

/-- `DY.6/polynomial-lines-dynamical-mordell-lang` (Ghioca–Tucker–Zieve Theorem 1.4). -/
theorem polynomial_lines_dynamical_mordell_lang {K : Type*} [Field K] [CharZero K] (f g : K[X])
    (x₀ y₀ u v w : K) (huv : u ≠ 0 ∨ v ≠ 0)
    (hinf : {n : ℕ | u * (fun x => f.eval x)^[n] x₀ + v * (fun y => g.eval y)^[n] y₀ = w}.Infinite) :
    (∃ k ≥ 1, ∀ a b : K, u * a + v * b = w →
        u * (fun x => f.eval x)^[k] a + v * (fun y => g.eval y)^[k] b = w) ∧
      IsFiniteUnionAP
        {n : ℕ | u * (fun x => f.eval x)^[n] x₀ + v * (fun y => g.eval y)^[n] y₀ = w} :=
  sorry

/-- `DY.6/lech-embedding-lemma`. -/
theorem lech_embedding (L : Type) [Field L] [Algebra ℚ L] (u : Finset L)
    (hgen : IntermediateField.adjoin ℚ (u : Set L) = ⊤) (N : ℕ) :
    ∃ p : ℕ, N < p ∧ ∃ _ : Fact p.Prime, ∃ σ : L →+* ℚ_[p], ∀ x ∈ u, ‖σ x‖ ≤ 1 := sorry

/-! Not stated in Lean (their objects have no Lean interface yet): `DY.6/power-map-escape-rate`'s
canonical-measure clause, `DY.6/legendre-canonical-measure-above-two`,
`DY.6/legendre-measure-degeneration`, `DY.6/legendre-regularization-estimate`,
`DY.6/good-places-energy-sum-bound`, `DY.6/legendre-pairing-upper-bound-regularized`,
`DY.6/p-adic-power-series-coordinates`, `DY.6/p-adic-residue-class-returns`,
`DY.6/etale-model-over-finitely-generated-ring` and `DY.6/p-adic-model-of-unramified-endomorphism`
(Berkovich measures, the hybrid space, the adelic heights `h_{F,η}`, completed local rings of
`ℤ_p`-schemes and spreading out: TropicalAndBerkovichArithmetic:TB.0, DY.2, DY.4,
SchemeAndStackFoundations:SF.0). -/

end DY6

end TauCeti.ArithmeticDynamics

end DY6File
