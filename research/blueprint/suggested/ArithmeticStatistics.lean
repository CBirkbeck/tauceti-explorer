/-
Suggested Lean for the Tau Ceti roadmap "Arithmetic statistics, counting fields and Selmer
distributions" (`ArithmeticStatistics`), stages ST.0–ST.5.

This file is not the roadmap and is not exhaustive: the roadmap document
`research/blueprint/readmes/ArithmeticStatistics.md` is definitive. The statements below suggest
Lean forms for the definitions, API items, unit tests and named theorems of the roadmap, so that
contributors and reviewers converge on names and signatures. Everything is proved by `sorry`
(definition bodies included where a body is not written out); nothing here is an implementation
claim.

Each object is declared once, by the stage that owns it, and later stages use that declaration:
ST.0 owns arithmetic families, binary quartic forms with `I`, `J`, the discriminant and the height,
and the elliptic-curve family; ST.1 owns binary cubic forms with their twisted `GL₂`-action, the
Davenport–Heilbronn sets `U_p`, the `PGL₂`-action on binary quartics and solubility; ST.2 owns the
coefficient coordinates of binary forms, the densities `CongruenceConditions.localMass` and the
orbit counts of binary forms; ST.4 owns the Borel structure on `ℤ_p`.

The file imports only Mathlib, at commit 082e2d3 (the import block below). Tau Ceti (f790474) is
not built here. Where a Tau Ceti module would be imported, the comment after the import block names
it, and the declarations that restate a Tau Ceti carrier say so in their docstrings (to be deleted
in favour of the import).
-/

import Mathlib.Algebra.BigOperators.Finprod
import Mathlib.Algebra.CubicDiscriminant
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Group.Equiv.Defs
import Mathlib.Algebra.Group.Subgroup.Even
import Mathlib.Algebra.IsPrimePow
import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.Order.Antidiag.Finsupp
import Mathlib.Algebra.Order.Group.Unbundled.Int
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Polynomial.FieldDivision
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.EllipticCurve.NormalForms
import Mathlib.AlgebraicGeometry.EllipticCurve.Reduction
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.Complex.Arg
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Combinatorics.Enumerative.Partition.Basic
import Mathlib.Combinatorics.Enumerative.Partition.Glaisher
import Mathlib.Data.Fin.Tuple.NatAntidiagonal
import Mathlib.Data.Int.Star
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Multiset.Sort
import Mathlib.Data.Nat.Find
import Mathlib.Data.Set.Card
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.IntermediateField.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.PrimitiveElement
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.GroupTheory.Complement
import Mathlib.GroupTheory.FiniteAbelian.Basic
import Mathlib.GroupTheory.GroupAction.CardCommute
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.GroupTheory.Perm.Cycle.Type
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.GroupTheory.Torsion
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.Dimension.RankNullity
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Card
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Matrix.Symmetric
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.QuadraticForm.IsometryEquiv
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
import Mathlib.MeasureTheory.Measure.Basic
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.Chebyshev
import Mathlib.NumberTheory.EulerProduct.DirichletLSeries
import Mathlib.NumberTheory.FundamentalDiscriminant
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.NumberTheory.Modular
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Completion.InfinitePlace
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicNorm
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.Padics.ProperSpace
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.Order.LiminfLimsup
import Mathlib.Order.Northcott
import Mathlib.Probability.CDF
import Mathlib.Probability.Distributions.Uniform
import Mathlib.Probability.ProbabilityMassFunction.Basic
import Mathlib.Probability.ProbabilityMassFunction.Constructions
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.Coprime.Basic
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.DedekindDomain.SelmerGroup
import Mathlib.RingTheory.Discriminant
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.RingTheory.IntegralClosure.Algebra.Basic
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.RingTheory.Polynomial.UniqueFactorization
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Topology.Algebra.Order.LiminfLimsup
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Topology.Instances.ENNReal.Lemmas
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.LiminfLimsup

/- Tau Ceti modules that the real development imports here (not built in this environment):
* `TauCeti.Order.Northcott` (`TauCeti.normLE`, `TauCeti.summatory`): ST.0 families;
* `TauCeti.FieldTheory.SquareClassGroup.Basic` (`TauCeti.SquareClassGroup`): ST.0, restated below
  as `ArithmeticStatistics.SquareClassGroup`;
* `TauCeti.AlgebraicGeometry.EllipticCurve.ShortWeierstrass` (`WeierstrassCurve.shortCurve`) and
  `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist` (`WeierstrassCurve.quadraticTwistOf`):
  ST.0 twists and ST.5 twist families;
* EllipticCurves Layer 8 (`IsMinimalPairNF`, `shortEquationHeight`, planned there): restated in ST.0;
* `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup` and the other
  `MordellWeil` modules (`WeierstrassCurve.Affine.A`, `M`, `μ`, `localRes`, `selmerGroup₂`): ST.1
  and ST.4;
* `TauCeti.NumberTheory.Modular` (`ModularGroup.isFundamentalDomain_fdo`): ST.2;
* `TauCeti.Algebra.Group.ElementaryTwoQuotient.Basic` (`ElementaryTwoQuotient`), and the
  ClassFieldTheory and PolynomialGaloisGroups layers: ST.3. -/

/-! # ArithmeticStatistics:ST.0 — Families, heights and measures -/

noncomputable section ST0

/-! The Tau Ceti carriers this stage builds on (`TauCeti.SquareClassGroup`, `TauCeti.summatory`,
`WeierstrassCurve.shortCurve`, `WeierstrassCurve.quadraticTwistOf`) and the planned EllipticCurves
Layer 8 carrier (`IsMinimalPairNF`, `shortEquationHeight`) appear as marked stand-ins that mirror
their specifications; in the real development they are imported, never restated. -/

open Filter Topology

namespace ArithmeticStatistics

/-! ## ST.0/arithmetic-family -/

/-- An arithmetic family: a type `ι` of objects, already taken up to the family's equivalence
relation (a `Quotient` or an orbit type when the objects are presented by representatives),
together with a real height with the Northcott property. -/
structure ArithmeticFamily (ι : Type*) where
  /-- The height ordering the family. -/
  height : ι → ℝ
  /-- Only finitely many members have height at most any bound. -/
  northcott : Northcott height

namespace ArithmeticFamily

variable {ι κ : Type*} (F : ArithmeticFamily ι)

/-- Finiteness at bounded height, the property that makes every count below finite. -/
theorem finite_height_le (X : ℝ) : {i | F.height i ≤ X}.Finite := sorry

/-- The finite set of members of height at most `X` (inclusive cutoff, as `TauCeti.normLE`). -/
def heightLE (X : ℝ) : Finset ι := (F.finite_height_le X).toFinset

@[simp] theorem mem_heightLE {i : ι} {X : ℝ} : i ∈ F.heightLE X ↔ F.height i ≤ X := sorry

/-- The weighted counting function `∑_{H(i) ≤ X} w(i)`. -/
def weightedCount {M : Type*} [AddCommMonoid M] (w : ι → M) (X : ℝ) : M :=
  ∑ i ∈ F.heightLE X, w i

/-- The unweighted counting function of a subfamily `S`: `#{i ∈ S : H(i) ≤ X}`. -/
def count (S : Set ι) (X : ℝ) : ℕ := {i | i ∈ S ∧ F.height i ≤ X}.ncard

/-- The strict-cutoff counting function `#{i ∈ S : H(i) < X}` used by the sources. -/
def countLT (S : Set ι) (X : ℝ) : ℕ := {i | i ∈ S ∧ F.height i < X}.ncard

theorem count_eq_weightedCount_indicator (S : Set ι) (X : ℝ) :
    (F.count S X : ℝ) = F.weightedCount (S.indicator 1) X := sorry

theorem count_mono_set {S T : Set ι} (h : S ⊆ T) (X : ℝ) : F.count S X ≤ F.count T X := sorry

theorem count_mono (S : Set ι) {X Y : ℝ} (h : X ≤ Y) : F.count S X ≤ F.count S Y := sorry

theorem count_union_of_disjoint {S T : Set ι} (h : Disjoint S T) (X : ℝ) :
    F.count (S ∪ T) X = F.count S X + F.count T X := sorry

theorem count_eq_zero_of_lt (S : Set ι) {b X : ℝ} (hb : ∀ i, b ≤ F.height i) (hX : X < b) :
    F.count S X = 0 := sorry

theorem tendsto_count_atTop {S : Set ι} (hS : S.Infinite) :
    Tendsto (fun X => F.count S X) atTop atTop := sorry

theorem countLT_le_count (S : Set ι) (X : ℝ) : F.countLT S X ≤ F.count S X := sorry

/-- A family on the classes of a setoid, from a class-invariant height whose induced function
is Northcott. -/
def ofQuotient {α : Type*} (s : Setoid α) (h : α → ℝ) (hh : ∀ a b, s a b → h a = h b)
    (hN : Northcott (Quotient.lift (s := s) h hh)) : ArithmeticFamily (Quotient s) :=
  ⟨Quotient.lift (s := s) h hh, hN⟩

/-- Pull back along a map with finite fibres. -/
def comap (f : κ → ι) [Filter.TendstoCofinite f] : ArithmeticFamily κ :=
  ⟨F.height ∘ f, sorry⟩

/-- Rescale the height by a positive constant. -/
def rescale (c : ℝ) (hc : 0 < c) : ArithmeticFamily ι := ⟨fun i => c * F.height i, sorry⟩

theorem count_rescale (c : ℝ) (hc : 0 < c) (S : Set ι) (X : ℝ) :
    (F.rescale c hc).count S X = F.count S (X / c) := sorry

/-- Isomorphism multiplicity: counting representatives is the class count weighted by the
fibre cardinality. -/
theorem count_comap (f : κ → ι) [Filter.TendstoCofinite f] (S : Set ι) (X : ℝ) :
    ((F.comap f).count (f ⁻¹' S) X : ℝ) =
      F.weightedCount (fun i => (Nat.card (f ⁻¹' {i}) : ℝ) * S.indicator 1 i) X := sorry

/-- A natural-valued Northcott height, the setting of `TauCeti.normLE` and `TauCeti.summatory`. -/
def ofNat (N : ι → ℕ) [Northcott N] : ArithmeticFamily ι := ⟨fun i => (N i : ℝ), sorry⟩

/-- Compatibility with Tau Ceti: the carrier is `TauCeti.normLE N X` (whose coercion is
`TauCeti.coe_normLE`), so `weightedCount (ofNat N) w X = TauCeti.summatory N w X`
(TauCeti/Order/Northcott.lean). -/
theorem heightLE_ofNat (N : ι → ℕ) [Northcott N] (X : ℝ) :
    ((ofNat N).heightLE X : Set ι) = {i | (N i : ℝ) ≤ X} := sorry

/-- The elements of a number field ordered by Mathlib's multiplicative Weil height. -/
def ofMulHeight (K : Type*) [Field K] [NumberField K] : ArithmeticFamily K :=
  ⟨Height.mulHeight₁, ⟨NumberField.finite_setOfPred_mulHeight₁_le K⟩⟩

/-- Unit test `ArithmeticStatistics.ArithmeticFamily.test_count_int`: the integers ordered by
absolute value have seven members of height at most `3`. -/
example (hN : Northcott (fun n : ℤ => (|n| : ℝ))) :
    (⟨fun n : ℤ => (|n| : ℝ), hN⟩ : ArithmeticFamily ℤ).count Set.univ 3 = 7 := sorry

/-- Unit test `ArithmeticStatistics.ArithmeticFamily.test_count_empty`: the empty subfamily is
never counted. -/
example (X : ℝ) : F.count ∅ X = 0 := sorry

/-- Unit test `ArithmeticStatistics.ArithmeticFamily.test_not_northcott_abs_rat`: the absolute
value on `ℚ` is not Northcott, so the rationals ordered by `|x|` are not an arithmetic family. -/
example : ¬ Northcott (fun x : ℚ => (|x| : ℝ)) := sorry

/-- Unit test `ArithmeticStatistics.ArithmeticFamily.test_count_nat`: the natural numbers ordered
by size have `⌊X⌋₊ + 1` members of height at most `X ≥ 0`. -/
example [Northcott (fun n : ℕ => n)] (X : ℝ) (hX : 0 ≤ X) :
    (ofNat (fun n : ℕ => n)).count Set.univ X = ⌊X⌋₊ + 1 := sorry

/-! ## ST.0/relative-density -/

/-- The proportion of `T` lying in `S` at cutoff `X` (with `0 / 0 = 0`). -/
def ratio (S T : Set ι) (X : ℝ) : ℝ := (F.count (S ∩ T) X : ℝ) / F.count T X

/-- The upper relative density of `S` in `T`. -/
def upperDensity (S T : Set ι) : ℝ := limsup (F.ratio S T) atTop

/-- The lower relative density (lower limiting proportion) of `S` in `T`. -/
def lowerDensity (S T : Set ι) : ℝ := liminf (F.ratio S T) atTop

/-- `S` has relative density `d` in `T`. -/
def HasDensity (S T : Set ι) (d : ℝ) : Prop := Tendsto (F.ratio S T) atTop (𝓝 d)

/-- The strict-cutoff proportion used by the sources (`H < X`). -/
def ratioLT (S T : Set ι) (X : ℝ) : ℝ := (F.countLT (S ∩ T) X : ℝ) / F.countLT T X

theorem ratio_nonneg (S T : Set ι) (X : ℝ) : 0 ≤ F.ratio S T X := sorry

theorem ratio_le_one (S T : Set ι) (X : ℝ) : F.ratio S T X ≤ 1 := sorry

theorem hasDensity_iff_lowerDensity_eq_upperDensity {S T : Set ι} {d : ℝ} :
    F.HasDensity S T d ↔ F.lowerDensity S T = d ∧ F.upperDensity S T = d := sorry

theorem HasDensity.lowerDensity_eq {S T : Set ι} {d : ℝ} (h : F.HasDensity S T d) :
    F.lowerDensity S T = d := sorry

theorem hasDensity_self {T : Set ι} (hT : T.Infinite) : F.HasDensity T T 1 := sorry

theorem hasDensity_empty (T : Set ι) : F.HasDensity ∅ T 0 := sorry

theorem HasDensity.diff {S T : Set ι} {d : ℝ} (hT : T.Infinite) (h : F.HasDensity S T d) :
    F.HasDensity (T \ S) T (1 - d) := sorry

theorem HasDensity.union {S S' T : Set ι} {d d' : ℝ} (hd : Disjoint S S')
    (h : F.HasDensity S T d) (h' : F.HasDensity S' T d') : F.HasDensity (S ∪ S') T (d + d') :=
  sorry

theorem hasDensity_zero_of_finite {S T : Set ι} (hS : S.Finite) (hT : T.Infinite) :
    F.HasDensity S T 0 := sorry

theorem HasDensity.congr_finite {S S' T : Set ι} {d : ℝ} (hSS' : (symmDiff S S').Finite)
    (hT : T.Infinite) (h : F.HasDensity S T d) : F.HasDensity S' T d := sorry

theorem hasDensity_iff_tendsto_ratioLT {S T : Set ι} {d : ℝ} :
    F.HasDensity S T d ↔ Tendsto (F.ratioLT S T) atTop (𝓝 d) := sorry

theorem hasDensity_rescale_iff (c : ℝ) (hc : 0 < c) {S T : Set ι} {d : ℝ} :
    (F.rescale c hc).HasDensity S T d ↔ F.HasDensity S T d := sorry

/-- Unit test `ArithmeticStatistics.ArithmeticFamily.test_density_even`: the even natural numbers
have density `1/2`. -/
example [Northcott (fun n : ℕ => n)] :
    (ofNat (fun n : ℕ => n)).HasDensity {n | Even n} Set.univ (1 / 2) := sorry

/-- Unit test `ArithmeticStatistics.ArithmeticFamily.test_density_finite`: a finite subfamily has
density zero. -/
example [Northcott (fun n : ℕ => n)] :
    (ofNat (fun n : ℕ => n)).HasDensity {0, 1, 2} Set.univ 0 := sorry

/-- Unit test `ArithmeticStatistics.ArithmeticFamily.test_density_not_exists`: the union of the
blocks `[4^k, 2·4^k)` has lower density `1/3` and upper density `2/3`, so no density. -/
example [Northcott (fun n : ℕ => n)] :
    ¬ ∃ d, (ofNat (fun n : ℕ => n)).HasDensity {n | ∃ k : ℕ, 4 ^ k ≤ n ∧ n < 2 * 4 ^ k}
      Set.univ d := sorry

/-- Unit test `ArithmeticStatistics.ArithmeticFamily.test_density_depends_on_height`: under the
height `n` on even and `n²` on odd numbers, the even numbers have density one. -/
example [Northcott (fun n : ℕ => if Even n then n else n ^ 2)] :
    (ofNat (fun n : ℕ => if Even n then n else n ^ 2)).HasDensity {n | Even n} Set.univ 1 :=
  sorry

/-! ## ST.0/relative-density-is-multiplicative-in-towers -/

/-- Densities multiply along a tower `S ⊆ T ⊆ U`. -/
theorem HasDensity.trans {S T U : Set ι} {α β : ℝ} (hST : S ⊆ T) (hTU : T ⊆ U)
    (h₁ : F.HasDensity S T α) (h₂ : F.HasDensity T U β) : F.HasDensity S U (α * β) := sorry

/-! ## ST.0/density-one-restricts-to-subfamilies-of-positive-lower-density -/

/-- A density-one subset stays of density one inside any subfamily of positive lower density. -/
theorem HasDensity.inter_of_lowerDensity_pos {A T U : Set ι} (hUT : U ⊆ T)
    (hA : F.HasDensity A T 1) (hU : 0 < F.lowerDensity U T) : F.HasDensity (A ∩ U) U 1 := sorry

/-! ## ST.0/constant-rescaling-of-a-height -/

/-- Rescaling the height by `c > 0` multiplies an `X^κ` asymptotic constant by `c^{-κ}`. -/
theorem tendsto_rescale_count_div_rpow (c : ℝ) (hc : 0 < c) (S : Set ι) {κ C : ℝ}
    (h : Tendsto (fun X => (F.count S X : ℝ) / X ^ κ) atTop (𝓝 C)) :
    Tendsto (fun X => ((F.rescale c hc).count S X : ℝ) / X ^ κ) atTop (𝓝 (C * c ^ (-κ))) := sorry

/-! ## ST.0/piecewise-rescaling-of-a-height -/

/-- Changing the height by a constant factor on each of finitely many pieces, each with an
`X^κ` count, turns the piecewise densities into their weighted mean. -/
theorem hasDensity_piecewise_rescale {k : ℕ} (G : ArithmeticFamily ι) (T : Fin k → Set ι)
    (hT : Pairwise (Function.onFun Disjoint T)) (c : Fin k → ℝ) (hc : ∀ j, 0 < c j)
    (hG : ∀ j, ∀ i ∈ T j, G.height i = c j * F.height i) {κ : ℝ} (hκ : 0 < κ)
    (a : Fin k → ℝ) (ha : ∀ j, 0 < a j)
    (hcount : ∀ j, Tendsto (fun X => (F.count (T j) X : ℝ) / X ^ κ) atTop (𝓝 (a j)))
    (A : Set ι) (d : Fin k → ℝ) (hd : ∀ j, F.HasDensity A (T j) (d j)) :
    G.HasDensity A (⋃ j, T j)
      ((∑ j, c j ^ (-κ) * a j * d j) / ∑ j, c j ^ (-κ) * a j) := sorry

end ArithmeticFamily

/-! ## ST.0/stabilizer-weighted-orbit-count -/

section Weights

variable (Γ V : Type*) [Group Γ] [MulAction Γ V]

/-- The stabilizer weight `1/#Stab_Γ(v)` of an orbit (well defined: stabilizers along an orbit
are conjugate). -/
def stabilizerWeight : MulAction.orbitRel.Quotient Γ V → ℝ :=
  Quotient.lift (fun v => ((Nat.card (MulAction.stabilizer Γ v) : ℝ))⁻¹) sorry

variable {Γ V}

@[simp] theorem stabilizerWeight_mk (v : V) :
    stabilizerWeight Γ V (Quotient.mk _ v) = ((Nat.card (MulAction.stabilizer Γ v) : ℝ))⁻¹ :=
  sorry

theorem stabilizerWeight_eq_one_iff (v : V) [Finite (MulAction.stabilizer Γ v)] :
    stabilizerWeight Γ V (Quotient.mk _ v) = 1 ↔ MulAction.stabilizer Γ v = ⊥ := sorry

theorem stabilizerWeight_pos (v : V) [Finite (MulAction.stabilizer Γ v)] :
    0 < stabilizerWeight Γ V (Quotient.mk _ v) := sorry

theorem stabilizerWeight_le_one (ω : MulAction.orbitRel.Quotient Γ V) :
    stabilizerWeight Γ V ω ≤ 1 := sorry

/-- Passing to the faithful quotient: if a finite subgroup `Z` acts trivially, then `#Z` times
the weight is the reciprocal order of the stabilizer modulo `Z` (for `GL₂(ℤ)` on quartic forms,
`Z = {±1}` and this is Bhargava–Shankar's `1/r = 2/#Stab_{GL₂(ℤ)}`). -/
theorem natCard_mul_stabilizerWeight (Z : Subgroup Γ) [Finite Z] (hZ : ∀ z ∈ Z, ∀ v : V, z • v = v)
    (v : V) [Finite (MulAction.stabilizer Γ v)] :
    (Nat.card Z : ℝ) * stabilizerWeight Γ V (Quotient.mk _ v) =
      ((Nat.card ((MulAction.stabilizer Γ v) ⧸ Z.subgroupOf (MulAction.stabilizer Γ v)) : ℝ))⁻¹ :=
  sorry

/-- The mass formula: for a finite group acting on a finite set the orbit weights add up to
`#V / #Γ` (Mathlib's class formula `MulAction.card_eq_sum_card_group_div_card_stabilizer`). -/
theorem finsum_stabilizerWeight [Finite Γ] [Finite V] :
    ∑ᶠ ω : MulAction.orbitRel.Quotient Γ V, stabilizerWeight Γ V ω =
      (Nat.card V : ℝ) / Nat.card Γ := sorry

variable (Γ V) in
/-- The stabilizer-weighted orbit count `∑_{Γv ∈ S, H(v) ≤ X} 1/#Stab_Γ(v)`. -/
def weightedOrbitCount (F : ArithmeticFamily (MulAction.orbitRel.Quotient Γ V))
    (S : Set (MulAction.orbitRel.Quotient Γ V)) (X : ℝ) : ℝ :=
  F.weightedCount (S.indicator (stabilizerWeight Γ V)) X

/-- Unit test `ArithmeticStatistics.test_stabilizerWeight_regular`: in the regular action of a
group on itself every orbit has weight one. -/
example (G : Type*) [Group G] (ω : MulAction.orbitRel.Quotient G G) :
    stabilizerWeight G G ω = 1 := sorry

/-- Unit test `ArithmeticStatistics.test_stabilizerWeight_fixed_point`: `(ℤ/3)ˣ = {±1}` fixes
`0`, which therefore has weight `1/2`, not `1`. -/
example : stabilizerWeight (ZMod 3)ˣ (ZMod 3) (Quotient.mk _ 0) = 1 / 2 := sorry

/-- Unit test `ArithmeticStatistics.test_mass_formula_zmod_three`: the two orbits `{0}` and
`{1, 2}` of `{±1}` on `ℤ/3` have total weight `3/2 = #V/#Γ`, whereas the reciprocal orbit
lengths would add up to `2`. -/
example : ∑ᶠ ω : MulAction.orbitRel.Quotient (ZMod 3)ˣ (ZMod 3),
    stabilizerWeight (ZMod 3)ˣ (ZMod 3) ω = 3 / 2 := sorry

/-! ## ST.0/weighted-and-unweighted-orbit-counts -/

/-- The unweighted orbit count exceeds the weighted one by at most the number of orbits with a
nontrivial stabilizer. -/
theorem count_sub_weightedOrbitCount_le (F : ArithmeticFamily (MulAction.orbitRel.Quotient Γ V))
    (hfin : ∀ v : V, Finite (MulAction.stabilizer Γ v))
    (S : Set (MulAction.orbitRel.Quotient Γ V)) (X : ℝ) :
    0 ≤ (F.count S X : ℝ) - weightedOrbitCount Γ V F S X ∧
      (F.count S X : ℝ) - weightedOrbitCount Γ V F S X ≤
        F.count (S ∩ {ω | stabilizerWeight Γ V ω ≠ 1}) X := sorry

end Weights

/-! ## ST.0/family-defined-by-local-conditions -/

/-- Local conditions on a family `ι`: localisation maps to local spaces `X v`, one for each
place `v`, and a local condition `cond v ⊆ X v`. -/
structure LocalConditions (ι : Type*) {P : Type*} (X : P → Type*) where
  /-- The localisation map at `v`. -/
  loc : ∀ v, ι → X v
  /-- The local condition at `v`. -/
  cond : ∀ v, Set (X v)

namespace LocalConditions

variable {ι P : Type*} {X : P → Type*} (L : LocalConditions ι X)

/-- The subfamily cut out by the local conditions. -/
def family : Set ι := {i | ∀ v, L.loc v i ∈ L.cond v}

@[simp] theorem mem_family {i : ι} : i ∈ L.family ↔ ∀ v, L.loc v i ∈ L.cond v := sorry

/-- Only finitely many conditions are proper. -/
def FinitelyMany : Prop := {v | L.cond v ≠ Set.univ}.Finite

/-- Imposing two collections of conditions at once. -/
def inf (L' : LocalConditions ι X) (_h : L.loc = L'.loc) : LocalConditions ι X :=
  ⟨L.loc, fun v => L.cond v ∩ L'.cond v⟩

theorem family_inf (L' : LocalConditions ι X) (h : L.loc = L'.loc) :
    (L.inf L' h).family = L.family ∩ L'.family := sorry

theorem family_eq_univ (h : ∀ v, L.cond v = Set.univ) : L.family = Set.univ := sorry

/-- Regularity: every condition is measurable with boundary of measure zero. -/
def IsRegular [∀ v, TopologicalSpace (X v)] [∀ v, MeasurableSpace (X v)]
    (μ : ∀ v, MeasureTheory.Measure (X v)) : Prop :=
  ∀ v, MeasurableSet (L.cond v) ∧ μ v (frontier (L.cond v)) = 0

/-- The local density (local mass) of the condition at `v`. -/
def localDensity [∀ v, MeasurableSpace (X v)] (μ : ∀ v, MeasureTheory.Measure (X v)) (v : P) :
    ENNReal := μ v (L.cond v)

/-- Largeness relative to bad loci `B v`: for all but finitely many places the closure of the
local image of the family contains everything off the bad locus (Bhargava–Shankar's "large",
with `B p = {p² ∣ Δ}`). -/
def IsLargeRel [∀ v, TopologicalSpace (X v)] (B : ∀ v, Set (X v)) : Prop :=
  ∀ᶠ v in cofinite, (B v)ᶜ ⊆ closure (L.loc v '' L.family)

/-- Unit test `ArithmeticStatistics.LocalConditions.test_family_squarefree`: the integers whose
reduction modulo `p²` is nonzero for every prime `p` are exactly the squarefree integers. -/
example : (⟨fun (p : Nat.Primes) (n : ℤ) => (n : ZMod ((p : ℕ) ^ 2)),
    fun _ => {0}ᶜ⟩ : LocalConditions ℤ (fun p : Nat.Primes => ZMod ((p : ℕ) ^ 2))).family =
    {n : ℤ | Squarefree n} := sorry

/-- Unit test `ArithmeticStatistics.LocalConditions.test_not_finitelyMany_squarefree`: squarefreeness
is not a finite set of local conditions. -/
example : ¬ (⟨fun (p : Nat.Primes) (n : ℤ) => (n : ZMod ((p : ℕ) ^ 2)),
    fun _ => {0}ᶜ⟩ : LocalConditions ℤ (fun p : Nat.Primes => ZMod ((p : ℕ) ^ 2))).FinitelyMany :=
  sorry

/-- Unit test `ArithmeticStatistics.LocalConditions.test_family_univ`: with every condition
trivial the family is everything. -/
example : (⟨fun (_ : Unit) (n : ℤ) => n, fun _ => Set.univ⟩ :
    LocalConditions ℤ (fun _ : Unit => ℤ)).family = Set.univ := sorry

end LocalConditions

/-! ## ST.0/acceptable-weight-function -/

/-- A weight defined by congruence conditions (Bhargava–Shankar §2.7): local weights
`φ p : X p → [0, 1]` at every prime, through localisation maps. -/
structure CongruenceWeight (ι : Type*) (X : Nat.Primes → Type*) where
  /-- Localisation at `p`. -/
  loc : ∀ p, ι → X p
  /-- The local weight at `p`. -/
  φ : ∀ p, X p → ℝ
  φ_mem : ∀ p x, φ p x ∈ Set.Icc (0 : ℝ) 1

namespace CongruenceWeight

variable {ι : Type*} {X : Nat.Primes → Type*} (W : CongruenceWeight ι X)

/-- The global weight `∏_p φ_p`. -/
def weight (i : ι) : ℝ := ∏' p, W.φ p (W.loc p i)

/-- Condition (1): the Euler product converges to `φ` at every member. -/
def ConvergesTo (φ : ι → ℝ) : Prop := ∀ i, HasProd (fun p => W.φ p (W.loc p i)) (φ i)

/-- Condition (2): each `φ_p` is locally constant off a closed null set. -/
def IsLocallyConstantAE [∀ p, TopologicalSpace (X p)] [∀ p, MeasurableSpace (X p)]
    (μ : ∀ p, MeasureTheory.Measure (X p)) : Prop :=
  ∀ p, ∃ S : Set (X p), IsClosed S ∧ μ p S = 0 ∧
    ∀ x ∉ S, ∀ᶠ y in 𝓝 x, W.φ p y = W.φ p x

/-- Acceptability relative to bad loci: `φ_p = 1` off `B p` for all but finitely many `p`. -/
def IsAcceptable (B : ∀ p, Set (X p)) : Prop := ∀ᶠ p in cofinite, ∀ x ∉ B p, W.φ p x = 1

theorem weight_mem_Icc (hW : W.ConvergesTo W.weight) (i : ι) : W.weight i ∈ Set.Icc (0 : ℝ) 1 :=
  sorry

/-- Unit test `ArithmeticStatistics.CongruenceWeight.test_const_one_acceptable`: the constant
weight `1` is acceptable for any bad loci. -/
example (loc : ∀ p, ι → X p) (B : ∀ p, Set (X p)) :
    (⟨loc, fun _ _ => 1, fun _ _ => ⟨zero_le_one, le_rfl⟩⟩ : CongruenceWeight ι X).IsAcceptable B :=
  sorry

/-- Unit test `ArithmeticStatistics.CongruenceWeight.test_indicator_acceptable`: the indicator of
the complement of the bad loci (squarefree discriminant, for `B p = {p² ∣ Δ}`) is acceptable. -/
example (loc : ∀ p, ι → X p) (B : ∀ p, Set (X p))
    [∀ p, DecidablePred (· ∈ B p)] :
    (⟨loc, fun p x => if x ∈ B p then 0 else 1, fun p x => by
      split_ifs <;> exact ⟨by norm_num, by norm_num⟩⟩ : CongruenceWeight ι X).IsAcceptable B :=
  sorry

/-- Unit test `ArithmeticStatistics.CongruenceWeight.test_half_not_acceptable`: the constant weight
`1/2` is not acceptable when every bad locus is proper. -/
example (loc : ∀ p, ι → X p) (B : ∀ p, Set (X p)) (hB : ∀ p, (B p)ᶜ.Nonempty) :
    ¬ (⟨loc, fun _ _ => 1 / 2, fun _ _ => ⟨by norm_num, by norm_num⟩⟩ :
      CongruenceWeight ι X).IsAcceptable B := sorry

end CongruenceWeight

/-! ## ST.0/binary-quartic-form -/

/-- A binary quartic form `a x⁴ + b x³y + c x²y² + d xy³ + e y⁴` with coefficients in `R`. -/
@[ext] structure BinaryQuartic (R : Type*) where
  a : R
  b : R
  c : R
  d : R
  e : R

namespace BinaryQuartic

variable {R : Type*} [CommRing R]

/-- Two forms are equal exactly when their five coefficients are. -/
theorem eq_iff_coeff (f g : BinaryQuartic R) :
    f = g ↔ f.a = g.a ∧ f.b = g.b ∧ f.c = g.c ∧ f.d = g.d ∧ f.e = g.e := sorry

/-- Evaluation at `(x, y)`. -/
def eval (f : BinaryQuartic R) (x y : R) : R :=
  f.a * x ^ 4 + f.b * x ^ 3 * y + f.c * x ^ 2 * y ^ 2 + f.d * x * y ^ 3 + f.e * y ^ 4

/-- Linear substitution `f ↦ f((x, y)·γ)`, `(x, y)·γ = (γ₀₀x + γ₁₀y, γ₀₁x + γ₁₁y)`. -/
def subst (γ : Matrix (Fin 2) (Fin 2) R) (f : BinaryQuartic R) : BinaryQuartic R :=
  let p := γ 0 0
  let q := γ 0 1
  let r := γ 1 0
  let s := γ 1 1
  { a := f.a * p ^ 4 + f.b * p ^ 3 * q + f.c * p ^ 2 * q ^ 2 + f.d * p * q ^ 3 + f.e * q ^ 4
    b := 4 * f.a * p ^ 3 * r + f.b * p ^ 3 * s + 3 * f.b * p ^ 2 * q * r + 2 * f.c * p ^ 2 * q * s
      + 2 * f.c * p * q ^ 2 * r + 3 * f.d * p * q ^ 2 * s + f.d * q ^ 3 * r + 4 * f.e * q ^ 3 * s
    c := 6 * f.a * p ^ 2 * r ^ 2 + 3 * f.b * p ^ 2 * r * s + 3 * f.b * p * q * r ^ 2
      + f.c * p ^ 2 * s ^ 2 + 4 * f.c * p * q * r * s + f.c * q ^ 2 * r ^ 2
      + 3 * f.d * p * q * s ^ 2 + 3 * f.d * q ^ 2 * r * s + 6 * f.e * q ^ 2 * s ^ 2
    d := 4 * f.a * p * r ^ 3 + 3 * f.b * p * r ^ 2 * s + f.b * q * r ^ 3 + 2 * f.c * p * r * s ^ 2
      + 2 * f.c * q * r ^ 2 * s + f.d * p * s ^ 3 + 3 * f.d * q * r * s ^ 2 + 4 * f.e * q * s ^ 3
    e := f.a * r ^ 4 + f.b * r ^ 3 * s + f.c * r ^ 2 * s ^ 2 + f.d * r * s ^ 3 + f.e * s ^ 4 }

/-- The left action of `GL₂(R)` by linear substitution, Bhargava–Shankar (3). -/
instance instMulAction : MulAction (GL (Fin 2) R) (BinaryQuartic R) where
  smul γ f := subst (γ : Matrix (Fin 2) (Fin 2) R) f
  one_smul := sorry
  mul_smul := sorry

theorem eval_smul (γ : GL (Fin 2) R) (f : BinaryQuartic R) (x y : R) :
    (γ • f).eval x y = f.eval ((γ : Matrix (Fin 2) (Fin 2) R) 0 0 * x + (γ : Matrix (Fin 2) (Fin 2) R) 1 0 * y)
      ((γ : Matrix (Fin 2) (Fin 2) R) 0 1 * x + (γ : Matrix (Fin 2) (Fin 2) R) 1 1 * y) := sorry

/-- The scalar matrix `u·1` as an element of `GL₂(R)`. -/
def scalarGL (u : Rˣ) : GL (Fin 2) R := Units.map (algebraMap R (Matrix (Fin 2) (Fin 2) R)).toMonoidHom u

/-- The twisted action `γ ⋆ f = (det γ)⁻² f((x, y)·γ)`, Bhargava–Shankar (21), (32); the centre
acts trivially, so it is an action of `PGL₂`. -/
def twistedSMul (γ : GL (Fin 2) R) (f : BinaryQuartic R) : BinaryQuartic R :=
  let u : R := ((Matrix.GeneralLinearGroup.det γ)⁻¹ ^ 2 : Rˣ)
  ⟨u * (γ • f).a, u * (γ • f).b, u * (γ • f).c, u * (γ • f).d, u * (γ • f).e⟩

theorem twistedSMul_mul (γ δ : GL (Fin 2) R) (f : BinaryQuartic R) :
    twistedSMul (γ * δ) f = twistedSMul γ (twistedSMul δ f) := sorry

theorem twistedSMul_scalar (u : Rˣ) (f : BinaryQuartic R) :
    twistedSMul (scalarGL u) f = f := sorry

theorem twistedSMul_eq_smul_of_det_sq (γ : GL (Fin 2) R)
    (h : ((Matrix.GeneralLinearGroup.det γ : Rˣ) : R) ^ 2 = 1) (f : BinaryQuartic R) :
    twistedSMul γ f = γ • f := sorry

theorem neg_one_smul (f : BinaryQuartic R) : (-1 : GL (Fin 2) R) • f = f := sorry

/-- Base change along a ring homomorphism. -/
def map {S : Type*} [CommRing S] (φ : R →+* S) (f : BinaryQuartic R) : BinaryQuartic S :=
  ⟨φ f.a, φ f.b, φ f.c, φ f.d, φ f.e⟩

theorem map_smul {S : Type*} [CommRing S] (φ : R →+* S) (γ : GL (Fin 2) R) (f : BinaryQuartic R) :
    (γ • f).map φ = (Matrix.GeneralLinearGroup.map φ γ) • f.map φ := sorry

/-- The form as a homogeneous polynomial of degree four in `X₀, X₁`. -/
def toMvPolynomial (f : BinaryQuartic R) : MvPolynomial (Fin 2) R :=
  MvPolynomial.C f.a * MvPolynomial.X 0 ^ 4 + MvPolynomial.C f.b * MvPolynomial.X 0 ^ 3 * MvPolynomial.X 1
    + MvPolynomial.C f.c * MvPolynomial.X 0 ^ 2 * MvPolynomial.X 1 ^ 2
    + MvPolynomial.C f.d * MvPolynomial.X 0 * MvPolynomial.X 1 ^ 3
    + MvPolynomial.C f.e * MvPolynomial.X 1 ^ 4

theorem isHomogeneous_toMvPolynomial (f : BinaryQuartic R) : f.toMvPolynomial.IsHomogeneous 4 :=
  sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_subst_swap`: substituting the swap matrix
reverses the coefficients. -/
example (f : BinaryQuartic ℤ) : subst !![0, 1; 1, 0] f = ⟨f.e, f.d, f.c, f.b, f.a⟩ := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_subst_translate`: `x³y` under
`(x, y) ↦ (x + y, y)` becomes `x³y + 3x²y² + 3xy³ + y⁴`. -/
example : subst !![1, 0; 1, 1] (⟨0, 1, 0, 0, 0⟩ : BinaryQuartic ℤ) = ⟨0, 1, 3, 3, 1⟩ := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_subst_row_convention`: the action is by
`(x, y)·γ`, not `γ·(x, y)ᵀ`: `x⁴` is fixed by `!![1, 1; 0, 1]`. -/
example : subst !![1, 1; 0, 1] (⟨1, 0, 0, 0, 0⟩ : BinaryQuartic ℤ) = ⟨1, 0, 0, 0, 0⟩ := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_one_smul`: the identity acts trivially. -/
example (f : BinaryQuartic ℚ) : (1 : GL (Fin 2) ℚ) • f = f := sorry

/-! ## ST.0/binary-quartic-invariants -/

/-- The invariant `I = 12ae − 3bd + c²`. -/
def invI (f : BinaryQuartic R) : R := 12 * f.a * f.e - 3 * f.b * f.d + f.c ^ 2

/-- The invariant `J = 72ace + 9bcd − 27ad² − 27eb² − 2c³`. -/
def invJ (f : BinaryQuartic R) : R :=
  72 * f.a * f.c * f.e + 9 * f.b * f.c * f.d - 27 * f.a * f.d ^ 2 - 27 * f.e * f.b ^ 2
    - 2 * f.c ^ 3

/-- The discriminant, the integral polynomial with `27 Δ = 4I³ − J²`. -/
def disc (f : BinaryQuartic R) : R :=
  let a := f.a; let b := f.b; let c := f.c; let d := f.d; let e := f.e
  256 * a ^ 3 * e ^ 3 - 192 * a ^ 2 * b * d * e ^ 2 - 128 * a ^ 2 * c ^ 2 * e ^ 2
    + 144 * a ^ 2 * c * d ^ 2 * e - 27 * a ^ 2 * d ^ 4 + 144 * a * b ^ 2 * c * e ^ 2
    - 6 * a * b ^ 2 * d ^ 2 * e - 80 * a * b * c ^ 2 * d * e + 18 * a * b * c * d ^ 3
    + 16 * a * c ^ 4 * e - 4 * a * c ^ 3 * d ^ 2 - 27 * b ^ 4 * e ^ 2 + 18 * b ^ 3 * c * d * e
    - 4 * b ^ 3 * d ^ 3 - 4 * b ^ 2 * c ^ 3 * e + b ^ 2 * c ^ 2 * d ^ 2

theorem twentySeven_mul_disc (f : BinaryQuartic R) : 27 * disc f = 4 * invI f ^ 3 - invJ f ^ 2 :=
  sorry

/-- Scaling all coefficients by `r`. -/
def scale (r : R) (f : BinaryQuartic R) : BinaryQuartic R := ⟨r * f.a, r * f.b, r * f.c, r * f.d, r * f.e⟩

theorem invI_scale (r : R) (f : BinaryQuartic R) : invI (scale r f) = r ^ 2 * invI f := sorry

theorem invJ_scale (r : R) (f : BinaryQuartic R) : invJ (scale r f) = r ^ 3 * invJ f := sorry

theorem invI_twistedSMul (γ : GL (Fin 2) R) (f : BinaryQuartic R) :
    invI (twistedSMul γ f) = invI f := sorry

theorem invJ_twistedSMul (γ : GL (Fin 2) R) (f : BinaryQuartic R) :
    invJ (twistedSMul γ f) = invJ f := sorry

theorem disc_smul (γ : GL (Fin 2) R) (f : BinaryQuartic R) :
    disc (γ • f) = ((Matrix.GeneralLinearGroup.det γ : Rˣ) : R) ^ 12 * disc f := sorry

theorem map_invI {S : Type*} [CommRing S] (φ : R →+* S) (f : BinaryQuartic R) :
    invI (f.map φ) = φ (invI f) := sorry

theorem map_invJ {S : Type*} [CommRing S] (φ : R →+* S) (f : BinaryQuartic R) :
    invJ (f.map φ) = φ (invJ f) := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_invariants_x3y_sub_xy3`: `x³y − xy³` has
`I = 3`, `J = 0`, `Δ = 4`. -/
example : invI (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℤ) = 3 ∧ invJ (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℤ) = 0
    ∧ disc (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℤ) = 4 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_disc_x4_sub_y4`: `x⁴ − y⁴` has `I = −12`,
`J = 0`, `Δ = −256`. -/
example : invI (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ) = -12 ∧
    disc (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ) = -256 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_nullcone_x4`: `x⁴` (a fourfold root) has
`I = J = Δ = 0`. -/
example : invI (⟨1, 0, 0, 0, 0⟩ : BinaryQuartic ℤ) = 0 ∧ invJ (⟨1, 0, 0, 0, 0⟩ : BinaryQuartic ℤ) = 0
    ∧ disc (⟨1, 0, 0, 0, 0⟩ : BinaryQuartic ℤ) = 0 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_invI_not_invariant_untwisted`: under the
untwisted action `2·1 ∈ GL₂(ℚ)` (determinant `4`) multiplies `I` by `4⁴ = 256`: `I = 768` for
`x³y − xy³`. -/
example : invI (scalarGL (Units.mk0 (2 : ℚ) (by norm_num)) •
    (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℚ)) = 768 := sorry

/-! ## ST.0/relative-invariance-of-i-and-j -/

/-- Bhargava–Shankar (5): `I(γ·f) = (det γ)⁴ I(f)` and `J(γ·f) = (det γ)⁶ J(f)`. -/
theorem invariants_smul (γ : GL (Fin 2) R) (f : BinaryQuartic R) :
    invI (γ • f) = ((Matrix.GeneralLinearGroup.det γ : Rˣ) : R) ^ 4 * invI f ∧
      invJ (γ • f) = ((Matrix.GeneralLinearGroup.det γ : Rˣ) : R) ^ 6 * invJ f := sorry

/-! ## ST.0/quartic-discriminant-is-the-polynomial-discriminant -/

/-- The dehomogenisation `f(X, 1)`. -/
def dehomogenize (f : BinaryQuartic R) : Polynomial R :=
  Polynomial.C f.a * Polynomial.X ^ 4 + Polynomial.C f.b * Polynomial.X ^ 3
    + Polynomial.C f.c * Polynomial.X ^ 2 + Polynomial.C f.d * Polynomial.X + Polynomial.C f.e

/-- `Δ(f)` is Mathlib's discriminant of `f(X, 1)` when that polynomial has degree four. -/
theorem disc_eq_discr (f : BinaryQuartic R) (h : f.dehomogenize.degree = 4) :
    disc f = f.dehomogenize.discr := sorry

/-! ## ST.0/binary-quartic-height -/

/-- The height `H(I, J) = max(|I|³, J²/4)` of a pair of invariants. -/
def pairHeight (I J : ℝ) : ℝ := max (|I| ^ 3) (J ^ 2 / 4)

/-- The height of an integral binary quartic form, Bhargava–Shankar (6). -/
def height (f : BinaryQuartic ℤ) : ℝ := pairHeight ((invI f : ℤ) : ℝ) ((invJ f : ℤ) : ℝ)

theorem pairHeight_nonneg (I J : ℝ) : 0 ≤ pairHeight I J := sorry

theorem pairHeight_scale (t I J : ℝ) : pairHeight (t ^ 2 * I) (t ^ 3 * J) = t ^ 6 * pairHeight I J :=
  sorry

theorem pairHeight_eq_zero_iff (I J : ℝ) : pairHeight I J = 0 ↔ I = 0 ∧ J = 0 := sorry

theorem abs_le_of_pairHeight_le {I J X : ℝ} (h : pairHeight I J ≤ X) :
    |I| ≤ X ^ (1 / 3 : ℝ) ∧ |J| ≤ 2 * X ^ (1 / 2 : ℝ) := sorry

theorem four_mul_pairHeight_intCast (I J : ℤ) :
    4 * pairHeight I J = ((max (4 * I.natAbs ^ 3) (J.natAbs ^ 2) : ℕ) : ℝ) := sorry

theorem northcott_pairHeight : Northcott (fun p : ℤ × ℤ => pairHeight p.1 p.2) := sorry

theorem height_smul (γ : GL (Fin 2) ℤ) (f : BinaryQuartic ℤ) : height (γ • f) = height f := sorry

theorem height_scale (r : ℤ) (f : BinaryQuartic ℤ) : height (scale r f) = (r : ℝ) ^ 6 * height f :=
  sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_pairHeight_one_two`: `H(1, 2) = 1`. -/
example : pairHeight 1 2 = 1 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_pairHeight_zero`: `H(0, 0) = 0`. -/
example : pairHeight 0 0 = 0 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_pairHeight_not_max_abs`: `H(2, 2) = 8`, not
`max(|I|, |J|) = 2`. -/
example : pairHeight 2 2 = 8 := sorry

/-! ## ST.0/eligible-invariant-pairs -/

/-- A pair of integers is eligible if it is the pair of invariants of an integral form. -/
def IsEligible (I J : ℤ) : Prop := ∃ f : BinaryQuartic ℤ, invI f = I ∧ invJ f = J

/-- The congruence conditions of Bhargava–Shankar Theorem 1.7. -/
def EligibilityCongruence (I J : ℤ) : Prop :=
  (I ≡ 0 [ZMOD 3] ∧ J ≡ 0 [ZMOD 27]) ∨
    (I ≡ 1 [ZMOD 9] ∧ (J ≡ 2 [ZMOD 27] ∨ J ≡ -2 [ZMOD 27])) ∨
    (I ≡ 4 [ZMOD 9] ∧ (J ≡ 16 [ZMOD 27] ∨ J ≡ -16 [ZMOD 27])) ∨
    (I ≡ 7 [ZMOD 9] ∧ (J ≡ 7 [ZMOD 27] ∨ J ≡ -7 [ZMOD 27]))

theorem invariants_isEligible (f : BinaryQuartic ℤ) : IsEligible (invI f) (invJ f) := sorry

/-- The scaling `(I, J) ↦ (2⁴I, 2⁶J)` of Bhargava–Shankar Theorem 3.5 preserves eligibility
(scale the form by `4`). -/
theorem isEligible_selmer_scaling {I J : ℤ} (h : IsEligible I J) :
    IsEligible (2 ^ 4 * I) (2 ^ 6 * J) := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_eligible_one_two`: `(1, 2)` is eligible. -/
example : IsEligible 1 2 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_not_eligible_one_zero`: `(1, 0)` is not. -/
example : ¬ IsEligible 1 0 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_not_eligible_two_mod_three`: no pair with
`I ≡ 2 (mod 3)` is eligible. -/
example (J : ℤ) : ¬ IsEligible 2 J := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_eligible_zero`: `(0, 0)` is eligible (the
zero form), with `H = 0`. -/
example : IsEligible 0 0 ∧ pairHeight 0 0 = 0 := sorry

/-! ## ST.0/eligible-invariant-pairs-satisfy-the-congruences -/

theorem eligibilityCongruence_invariants (f : BinaryQuartic ℤ) :
    EligibilityCongruence (invI f) (invJ f) := sorry

/-! ## ST.0/congruence-pairs-are-eligible -/

theorem isEligible_of_eligibilityCongruence {I J : ℤ} (h : EligibilityCongruence I J) :
    ∃ r s t : ℤ, invI (⟨0, 1, r, s, t⟩ : BinaryQuartic ℤ) = I ∧
      invJ (⟨0, 1, r, s, t⟩ : BinaryQuartic ℤ) = J := sorry

/-! ## ST.0/eligibility-criterion-modulo-27 -/

/-- Bhargava–Shankar Theorem 1.7. -/
theorem isEligible_iff (I J : ℤ) : IsEligible I J ↔ EligibilityCongruence I J := sorry

/-! ## ST.0/eligible-pairs-are-nine-lattice-translates -/

/-- Bhargava–Shankar Lemma 2.9: the eligible pairs are nine translates of `9ℤ × 27ℤ`. -/
theorem exists_eligible_residues :
    ∃ R : Finset (ZMod 9 × ZMod 27), R.card = 9 ∧
      ∀ I J : ℤ, IsEligible I J ↔ ((I : ZMod 9), (J : ZMod 27)) ∈ R := sorry

end BinaryQuartic

/-! ## ST.0/elliptic-curves-over-q-ordered-by-height -/

namespace EllipticFamily

/-- Stand-in for EllipticCurves Layer 8's `IsMinimalPairNF` (planned there, not built at the
pin): short normal form with no prime `ℓ` such that `ℓ⁴ ∣ a₄` and `ℓ⁶ ∣ a₆`. Delete when Layer 8
lands and import its predicate. -/
def IsMinimalPairNF (W : WeierstrassCurve ℤ) : Prop :=
  W.a₁ = 0 ∧ W.a₂ = 0 ∧ W.a₃ = 0 ∧ ∀ ℓ : ℕ, ℓ.Prime → ¬ ((ℓ : ℤ) ^ 4 ∣ W.a₄ ∧ (ℓ : ℤ) ^ 6 ∣ W.a₆)

/-- Stand-in for Layer 8's `shortEquationHeight W = max (4|a₄|³) (27 a₆²)`. -/
def shortEquationHeight (W : WeierstrassCurve ℤ) : ℕ := max (4 * W.a₄.natAbs ^ 3) (27 * W.a₆.natAbs ^ 2)

/-- The carrier: minimal-pair integral short equations that are elliptic over `ℚ`, in bijection
with `ℚ`-isomorphism classes of elliptic curves over `ℚ` (Layer 8's existence and uniqueness). -/
def Carrier : Type := {W : WeierstrassCurve ℤ // IsMinimalPairNF W ∧ 4 * W.a₄ ^ 3 + 27 * W.a₆ ^ 2 ≠ 0}

/-- Elliptic curves over `ℚ` ordered by the naive height `H(E) = max(4|A|³, 27B²)`. -/
def family : ArithmeticFamily Carrier := ⟨fun E => (shortEquationHeight E.1 : ℝ), sorry⟩

/-- The invariants `(I(E), J(E)) = (−3A, −27B)`, Bhargava–Shankar (48). -/
def invariants (E : Carrier) : ℤ × ℤ := (-3 * E.1.a₄, -27 * E.1.a₆)

/-- The height `H'(E) = H(I(E), J(E))`, Bhargava–Shankar (49). -/
def heightPrime (E : Carrier) : ℝ := BinaryQuartic.pairHeight (invariants E).1 (invariants E).2

theorem invariants_injective : Function.Injective invariants := sorry

theorem invariants_eligible (E : Carrier) :
    BinaryQuartic.IsEligible (invariants E).1 (invariants E).2 := sorry

theorem pairDisc_invariants (E : Carrier) :
    4 * (invariants E).1 ^ 3 - (invariants E).2 ^ 2 = -27 * (4 * E.1.a₄ ^ 3 + 27 * E.1.a₆ ^ 2) :=
  sorry

/-- The comparison with Mathlib's discriminant: `Δ(I(E), J(E)) = Δ_E / 16`. -/
theorem sixteen_mul_pairDisc_invariants (E : Carrier) :
    16 * (-(4 * E.1.a₄ ^ 3 + 27 * E.1.a₆ ^ 2)) = E.1.Δ := sorry

/-- The map to `ℚ`-isomorphism classes of Weierstrass curves over `ℚ`. -/
def toIsoClass (E : Carrier) :
    MulAction.orbitRel.Quotient (WeierstrassCurve.VariableChange ℚ) (WeierstrassCurve ℚ) :=
  Quotient.mk _ (E.1.map (Int.castRingHom ℚ))

theorem toIsoClass_injective : Function.Injective toIsoClass := sorry

theorem exists_toIsoClass_eq (W : WeierstrassCurve ℚ) [W.IsElliptic] :
    ∃ E : Carrier, toIsoClass E = Quotient.mk _ W := sorry

/-- Unit test `ArithmeticStatistics.EllipticFamily.test_height_congruent`: `y² = x³ − x` has
`H = 4`, invariants `(3, 0)` and `H' = 27`. -/
example (h : IsMinimalPairNF ⟨0, 0, 0, -1, 0⟩ ∧ 4 * (-1 : ℤ) ^ 3 + 27 * 0 ^ 2 ≠ 0) :
    family.height ⟨⟨0, 0, 0, -1, 0⟩, h⟩ = 4 ∧ invariants ⟨⟨0, 0, 0, -1, 0⟩, h⟩ = (3, 0) ∧
      heightPrime ⟨⟨0, 0, 0, -1, 0⟩, h⟩ = 27 := sorry

/-- Unit test `ArithmeticStatistics.EllipticFamily.test_not_minimal_pair`: `(A, B) = (16, 64)`
is not a minimal pair, since `2⁴ ∣ 16` and `2⁶ ∣ 64`. -/
example : ¬ IsMinimalPairNF ⟨0, 0, 0, 16, 64⟩ := sorry

/-- Unit test `ArithmeticStatistics.EllipticFamily.test_singular_excluded`: `(A, B) = (0, 0)` is
not in the family. -/
example : ¬ (4 * (0 : ℤ) ^ 3 + 27 * 0 ^ 2 ≠ 0) := sorry

/-! ## ST.0/quartic-to-curve-height-normalisation -/

/-- Bhargava–Shankar §3: `27 H(E) = 4 H'(E)`. -/
theorem twentySeven_mul_height (E : Carrier) : 27 * family.height E = 4 * heightPrime E := sorry

/-! ## ST.0/elliptic-families-defined-by-congruence-conditions -/

/-- The primes as places, with the fact instance `ℤ_[p]` needs. -/
instance (p : Nat.Primes) : Fact (p : ℕ).Prime := ⟨p.2⟩

/-- `Inv_p(S)`: the `p`-adic closure of the invariants of `S`, minus `Δ = 0`. -/
def invLocal (p : Nat.Primes) (S : Set Carrier) : Set (ℤ_[p] × ℤ_[p]) :=
  closure ((fun E => (((invariants E).1 : ℤ_[p]), ((invariants E).2 : ℤ_[p]))) '' S) \
    {x | 4 * x.1 ^ 3 - x.2 ^ 2 = 0}

/-- A family is large if `Inv_p` contains every pair with `p² ∤ Δ` for all but finitely many `p`
(for `p ≠ 3`, `p² ∣ Δ ↔ p² ∣ 4I³ − J²`). -/
def IsLarge (S : Set Carrier) : Prop :=
  ∀ᶠ p : Nat.Primes in cofinite, ∀ x : ℤ_[p] × ℤ_[p],
    ¬ ((p : ℤ_[p]) ^ 2 ∣ 4 * x.1 ^ 3 - x.2 ^ 2) → x ∈ invLocal p S

/-- The sign condition at infinity. -/
inductive SignCondition
  | pos
  | neg
  | any

/-- The family `F_Σ` cut out by closed local sets `Σ_p` of pairs and a sign condition. -/
def congruenceFamily (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p])) (s : SignCondition) :
    Set Carrier :=
  {E | (∀ p : Nat.Primes, (((invariants E).1 : ℤ_[p]), ((invariants E).2 : ℤ_[p])) ∈ Sig p) ∧
    match s with
    | .pos => 0 < 4 * (invariants E).1 ^ 3 - (invariants E).2 ^ 2
    | .neg => 4 * (invariants E).1 ^ 3 - (invariants E).2 ^ 2 < 0
    | .any => True}

theorem IsLarge.mono {S T : Set Carrier} (h : S ⊆ T) (hS : IsLarge S) : IsLarge T := sorry

/-- The curves semistable at every prime `ℓ ≥ 5` form a large family (the arithmetic content of
Bhargava–Shankar's remark that the semistable family is large). -/
theorem isLarge_semistableAwayFromSix (S : Set Carrier)
    (hS : ∀ E, E ∈ S ↔ ∀ ℓ : ℕ, ℓ.Prime → 5 ≤ ℓ → ¬ ((ℓ : ℤ) ∣ E.1.a₄ ∧ (ℓ : ℤ) ∣ E.1.a₆)) :
    IsLarge S := sorry

/-- Unit test `ArithmeticStatistics.EllipticFamily.test_not_large_j1728`: the curves with `B = 0`
(`j = 1728`) are cut out by congruence conditions but are not large. -/
example : ¬ IsLarge {E : Carrier | E.1.a₆ = 0} := sorry

/-- Unit test `ArithmeticStatistics.EllipticFamily.test_congruenceFamily_univ`: with every local
set the whole plane and no sign condition, `F_Σ` is everything. -/
example : congruenceFamily (fun _ => Set.univ) .any = Set.univ := sorry

/-- Unit test `ArithmeticStatistics.EllipticFamily.test_large_finite_congruence`: the family
`A ≡ 1 (mod 5)` is large. -/
example : IsLarge {E : Carrier | E.1.a₄ ≡ 1 [ZMOD 5]} := sorry

/-! ## ST.0/all-elliptic-curves-form-a-large-family -/

theorem isLarge_univ : IsLarge Set.univ := sorry

end EllipticFamily

/-! ## ST.0/invariants-height-and-eligible-pairs -/

namespace BinaryQuartic

/-- The eligible invariant pairs, ordered by `H(I, J)`: the family Theorem 1.8 averages over. -/
def eligibleFamily : ArithmeticFamily {p : ℤ × ℤ // IsEligible p.1 p.2} :=
  ⟨fun p => pairHeight p.1.1 p.1.2, sorry⟩

theorem eligibleFamily_height (p : {p : ℤ × ℤ // IsEligible p.1 p.2}) :
    eligibleFamily.height p = pairHeight p.1.1 p.1.2 := sorry

/-- A curve's invariants as an eligible pair, with the height normalisation of §3. -/
def ofCurve (E : EllipticFamily.Carrier) : {p : ℤ × ℤ // IsEligible p.1 p.2} :=
  ⟨EllipticFamily.invariants E, EllipticFamily.invariants_eligible E⟩

theorem height_ofCurve (E : EllipticFamily.Carrier) :
    27 * EllipticFamily.family.height E = 4 * eligibleFamily.height (ofCurve E) := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_eligibleFamily_count_one`: the eligible
pairs of height at most `1` are `(0, 0)` and `(1, ±2)`. -/
example : eligibleFamily.count Set.univ 1 = 3 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_ofCurve_height_congruent`: `y² = x³ − x`
gives the eligible pair `(3, 0)` of height `27`. -/
example (h : EllipticFamily.IsMinimalPairNF ⟨0, 0, 0, -1, 0⟩ ∧ 4 * (-1 : ℤ) ^ 3 + 27 * 0 ^ 2 ≠ 0) :
    (ofCurve ⟨⟨0, 0, 0, -1, 0⟩, h⟩).1 = (3, 0) ∧ eligibleFamily.height (ofCurve ⟨⟨0, 0, 0, -1, 0⟩, h⟩) = 27 :=
  sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_ofCurve_not_surjective`: curve invariants
lie in `3ℤ × 27ℤ`, so the eligible pair `(1, 2)` is not the pair of any curve. -/
example : ¬ ∃ E : EllipticFamily.Carrier, (ofCurve E).1 = (1, 2) := sorry

end BinaryQuartic

/-! ## ST.0/squareclass-height -/

section Squareclass

open IsDedekindDomain NumberField

variable (F : Type*) [Field F] [NumberField F]

/-- The square-class group `Fˣ/(Fˣ)²`. In Tau Ceti this is `TauCeti.SquareClassGroup F`
(TauCeti/FieldTheory/SquareClassGroup/Basic.lean), restated here only because Tau Ceti is not
built locally. -/
abbrev SquareClassGroup : Type _ := Additive Fˣ ⧸ (Subgroup.square Fˣ).toAddSubgroup

/-- The finite primes at which a unit has odd valuation. -/
def oddSupport (u : Fˣ) : Set (HeightOneSpectrum (𝓞 F)) :=
  {v | ¬ (2 : ℤ) ∣ Multiplicative.toAdd (v.valuationOfNeZero (K := F) u)}

theorem oddSupport_finite (u : Fˣ) : (oddSupport F u).Finite := sorry

/-- `∏_{v(u) odd} N v`. -/
def unitHeight (u : Fˣ) : ℕ := ∏ᶠ v ∈ oddSupport F u, Ideal.absNorm v.asIdeal

/-- The squareclass height `H(t) = ∏_{v(t) odd} N v` (Burungale–Tian via BKLOS §2). -/
def squareclassHeight : SquareClassGroup F → ℕ :=
  Quotient.lift (fun u : Additive Fˣ => unitHeight F (Additive.toMul u)) sorry

/-- The squarefree ideal `∏_{v(t) odd} v` attached to a unit. -/
def supportIdeal (u : Fˣ) : Ideal (𝓞 F) := ∏ᶠ v ∈ oddSupport F u, v.asIdeal

theorem squareclassHeight_mk (u : Fˣ) :
    squareclassHeight F (QuotientAddGroup.mk (Additive.ofMul u)) = unitHeight F u := sorry

theorem squareclassHeight_zero : squareclassHeight F 0 = 1 := sorry

theorem unitHeight_eq_absNorm_supportIdeal (u : Fˣ) :
    unitHeight F u = Ideal.absNorm (supportIdeal F u) := sorry

theorem squareclassHeight_add_mul_sq (s t : SquareClassGroup F) :
    ∃ g : ℕ, squareclassHeight F (s + t) * g ^ 2 = squareclassHeight F s * squareclassHeight F t :=
  sorry

theorem squareclassHeight_eq_one_iff (u : Fˣ) :
    unitHeight F u = 1 ↔ oddSupport F u = ∅ := sorry

theorem squareclassHeight_rat (n : ℤ) (hn : Squarefree n) :
    unitHeight ℚ (Units.mk0 (n : ℚ) (by exact_mod_cast hn.ne_zero)) = n.natAbs := sorry

/-- Unit test `ArithmeticStatistics.test_squareclassHeight_rat_twelve`: `H([12]) = 3` in `ℚ`,
not `12` (only the odd part of the factorisation counts). -/
example : unitHeight ℚ (Units.mk0 (12 : ℚ) (by norm_num)) = 3 := sorry

/-- Unit test `ArithmeticStatistics.test_squareclassHeight_rat_neg_one`: `H([−1]) = 1`, so `[1]`
and `[−1]` both have height one. -/
example : unitHeight ℚ (Units.mk0 (-1 : ℚ) (by norm_num)) = 1 := sorry

/-- Unit test `ArithmeticStatistics.test_squareclassHeight_not_disc`: `H([3]) = 3`, not the
discriminant `12` of `ℚ(√3)`. -/
example : unitHeight ℚ (Units.mk0 (3 : ℚ) (by norm_num)) = 3 := sorry

/-! ## ST.0/squareclass-height-fibres-are-selmer-cosets -/

/-- Two units have the same support ideal exactly when their quotient has even valuation
everywhere, i.e. lies in the Selmer group `K(∅, 2)`. -/
theorem supportIdeal_eq_iff (u u' : Fˣ) :
    supportIdeal F u = supportIdeal F u' ↔ oddSupport F (u * u'⁻¹) = ∅ := sorry

/-! ## ST.0/finiteness-of-squareclasses-of-bounded-height -/

/-- Bounded-height finiteness for squareclasses of a number field. -/
theorem northcott_squareclassHeight : Northcott (squareclassHeight F) := sorry

/-! ## ST.0/quadratic-twist-squareclass-family -/

/-- The twisted short model `y² = x³ + u²A x + u³B` (Burungale–Tian §1.0.2: the model
`u y² = x³ + Ax + B`). In Tau Ceti this is `WeierstrassCurve.shortCurve (u²A) (u³B)`. -/
def twistModel (A B : F) (u : Fˣ) : WeierstrassCurve F := ⟨0, 0, 0, (u : F) ^ 2 * A, (u : F) ^ 3 * B⟩

/-- The `F`-isomorphism class of the twist by a squareclass. -/
def twistClass (A B : F) :
    SquareClassGroup F →
      MulAction.orbitRel.Quotient (WeierstrassCurve.VariableChange F) (WeierstrassCurve F) :=
  Quotient.lift (fun u : Additive Fˣ => Quotient.mk _ (twistModel F A B (Additive.toMul u))) sorry

/-- The unweighted squareclass-height family of quadratic twists: each squareclass once. -/
def twistFamily : ArithmeticFamily (SquareClassGroup F) :=
  ⟨fun t => (squareclassHeight F t : ℝ), sorry⟩

theorem twistModel_one (A B : F) : twistModel F A B 1 = ⟨0, 0, 0, A, B⟩ := sorry

theorem twistClass_zero (A B : F) : twistClass F A B 0 = Quotient.mk _ ⟨0, 0, 0, A, B⟩ := sorry

theorem exists_smul_twistModel_mul_sq (A B : F) (u s : Fˣ) :
    ∃ C : WeierstrassCurve.VariableChange F, C • twistModel F A B (u * s ^ 2) = twistModel F A B u :=
  sorry

theorem twistModel_Δ (A B : F) (u : Fˣ) :
    (twistModel F A B u).Δ = (u : F) ^ 6 * (⟨0, 0, 0, A, B⟩ : WeierstrassCurve F).Δ := sorry

theorem twistModel_j (A B : F) (u : Fˣ) [(⟨0, 0, 0, A, B⟩ : WeierstrassCurve F).IsElliptic]
    [(twistModel F A B u).IsElliptic] :
    (twistModel F A B u).j = (⟨0, 0, 0, A, B⟩ : WeierstrassCurve F).j := sorry

/-- Compatibility with Tau Ceti's `quadraticTwistOf 0 (-u)`, whose value on `y² = x³ + Ax + B` is
`y² = x³ + 16u²A x + 64u³B`. -/
theorem exists_smul_twistModel_eq_quadraticTwistOf (A B : F) (u : Fˣ) :
    ∃ C : WeierstrassCurve.VariableChange F,
      C • twistModel F A B u = ⟨0, 0, 0, 16 * (u : F) ^ 2 * A, 64 * (u : F) ^ 3 * B⟩ := sorry

theorem twistModel_rat_congruent (n : ℚˣ) :
    twistModel ℚ (-1) 0 n = ⟨0, 0, 0, -(n : ℚ) ^ 2, 0⟩ := sorry

/-- Unit test `ArithmeticStatistics.test_twistFamily_height_zero`: the trivial class, whose twist
is `E` itself, has height one. -/
example : (twistFamily F).height 0 = 1 := sorry

/-- Unit test `ArithmeticStatistics.test_twistModel_congruent_five`: over `ℚ` the twist of
`y² = x³ − x` by `5` is `y² = x³ − 25x`. -/
example : twistModel ℚ (-1) 0 (Units.mk0 5 (by norm_num)) = ⟨0, 0, 0, -25, 0⟩ := sorry

/-- Unit test `ArithmeticStatistics.test_twistModel_sq_iso`: the twist by `4 = 2²` is isomorphic
to `E`. -/
example (A B : ℚ) : ∃ C : WeierstrassCurve.VariableChange ℚ,
    C • twistModel ℚ A B (Units.mk0 4 (by norm_num)) = ⟨0, 0, 0, A, B⟩ := sorry

/-! ## ST.0/isomorphism-multiplicity-of-the-twist-family -/

/-- For `B ≠ 0` (so `j ≠ 1728`) the twist map on squareclasses is injective; for `B = 0` the
classes `t` and `t + [−1]` give the same model. -/
theorem twistClass_injective_or_neg (A B : F) (hΔ : 4 * A ^ 3 + 27 * B ^ 2 ≠ 0) :
    (B ≠ 0 → Function.Injective (twistClass F A B)) ∧
      (B = 0 → ∀ u : Fˣ, twistModel F A B (-u) = twistModel F A B u) := sorry

end Squareclass

/-! ## ST.0/positive-squarefree-family-over-q -/

namespace SquarefreeFamily

/-- The natural numbers ordered by size. -/
def natFamily : ArithmeticFamily ℕ := ⟨fun n => (n : ℝ), sorry⟩

/-- The positive squarefree integers (the squareclasses of `ℚ` positive at `∞`). -/
def posSquarefree : Set ℕ := {n | 0 < n ∧ Squarefree n}

/-- Burungale–Tian's even-parity family: positive squarefree `n ≡ 1, 2, 3 (mod 8)`. -/
def evenParityClasses : Set ℕ := {n | n ∈ posSquarefree ∧ (n % 8 = 1 ∨ n % 8 = 2 ∨ n % 8 = 3)}

theorem evenParityClasses_subset : evenParityClasses ⊆ posSquarefree := sorry

theorem posSquarefree_mod_eight (n : ℕ) (hn : n ∈ posSquarefree) : n % 8 ≠ 0 ∧ n % 8 ≠ 4 := sorry

theorem posSquarefree_infinite : posSquarefree.Infinite := sorry

/-- The identification with squareclasses of `ℚ`, ordered by the squareclass height. -/
theorem unitHeight_posSquarefree (n : ℕ) (hn : n ∈ posSquarefree) :
    unitHeight ℚ (Units.mk0 (n : ℚ) (by exact_mod_cast hn.1.ne')) = n := sorry

/-- Unit test `ArithmeticStatistics.SquarefreeFamily.test_evenParity_members`: `1, 2, 3, 10, 11`
are in the family, `5, 6, 7, 9` are not. -/
example : 1 ∈ evenParityClasses ∧ 2 ∈ evenParityClasses ∧ 11 ∈ evenParityClasses ∧
    5 ∉ evenParityClasses ∧ 9 ∉ evenParityClasses := sorry

/-- Unit test `ArithmeticStatistics.SquarefreeFamily.test_count_evenParity_twenty`: there are
seven members up to `20` (`1, 2, 3, 10, 11, 17, 19`). -/
example : natFamily.count evenParityClasses 20 = 7 := sorry

/-- Unit test `ArithmeticStatistics.SquarefreeFamily.test_count_posSquarefree_one`: only `n = 1`
has height at most `1`; the class `[−1]` of `ℚ`, also of height one, is not in the positive
family. -/
example : natFamily.count posSquarefree 1 = 1 := sorry

/-! ## ST.0/squarefree-indicator-as-a-moebius-sum -/

open scoped ArithmeticFunction.Moebius in
theorem sum_moebius_sq_dvd (n : ℕ) (hn : 0 < n) :
    ∑ d ∈ (Finset.Icc 1 n).filter (fun d => d ^ 2 ∣ n), (μ d : ℤ) = if Squarefree n then 1 else 0 :=
  sorry

/-! ## ST.0/squarefree-integers-in-residue-classes -/

/-- Squarefree integers in a coprime residue class (Nunes (1.1) with Hooley's bound, for fixed
modulus): main term `(6/π²) q⁻¹ ∏_{p ∣ q} (1 − p⁻²)⁻¹ X`, error `O_q(√X)`. -/
theorem squarefree_residue_count (q a : ℕ) (hq : 0 < q) (ha : Nat.Coprime a q) :
    ∃ C : ℝ, ∀ X : ℝ, 1 ≤ X →
      |(natFamily.count {n | n ∈ posSquarefree ∧ n ≡ a [MOD q]} X : ℝ) -
        6 / Real.pi ^ 2 * (1 / q) * (∏ p ∈ q.primeFactors, (1 - (p : ℝ) ^ (-2 : ℤ)))⁻¹ * X| ≤
          C * Real.sqrt X := sorry

/-! ## ST.0/even-parity-classes-have-half-density -/

/-- The classes `1, 2, 3 (mod 8)` have relative density `1/2` among positive squarefree
integers. -/
theorem hasDensity_evenParityClasses : natFamily.HasDensity evenParityClasses posSquarefree (1 / 2) :=
  sorry

/-! ## ST.0/density-one-in-the-even-parity-classes-is-half-of-all-squarefree -/

theorem hasDensity_half_of_hasDensity_one {A : Set ℕ} (hA : A ⊆ evenParityClasses)
    (h : natFamily.HasDensity A evenParityClasses 1) : natFamily.HasDensity A posSquarefree (1 / 2) :=
  sorry

end SquarefreeFamily

/-! ## ST.0/number-fields-ordered-by-discriminant -/

namespace NumberFieldFamily

variable (A : Type*) [Field A] [CharZero A]

/-- Number fields embedded in `A` (finite-dimensional subfields over `ℚ`). -/
def Embedded : Type _ := {K : IntermediateField ℚ A // FiniteDimensional ℚ K}

instance (K : Embedded A) : NumberField K.1 := @NumberField.mk _ _ inferInstance K.2

/-- Embedded number fields ordered by `|disc|` (Northcott is Hermite's theorem,
`NumberField.finite_of_discr_bdd`). -/
def embeddedFamily : ArithmeticFamily (Embedded A) :=
  ⟨fun K => (|NumberField.discr K.1| : ℝ), sorry⟩

/-- `ℚ`-isomorphism of embedded number fields. -/
def isoSetoid : Setoid (Embedded A) where
  r K L := Nonempty (K.1 ≃ₐ[ℚ] L.1)
  iseqv := sorry

/-- Number fields up to isomorphism, ordered by `|disc|`. -/
def isoFamily : ArithmeticFamily (Quotient (isoSetoid A)) :=
  ⟨Quotient.lift (fun K : Embedded A => (|NumberField.discr K.1| : ℝ)) sorry, sorry⟩

/-- The degree-`n` subfamily. -/
def degree (n : ℕ) : Set (Embedded A) := {K | Module.finrank ℚ K.1 = n}

/-- The automorphism weight `n / #Aut(K)` of an isomorphism class. -/
def autWeight : Quotient (isoSetoid A) → ℝ :=
  Quotient.lift (fun K : Embedded A => (Module.finrank ℚ K.1 : ℝ) / Nat.card (K.1 ≃ₐ[ℚ] K.1)) sorry

/-- The degree of an isomorphism class. -/
def isoDegree : Quotient (isoSetoid A) → ℕ :=
  Quotient.lift (fun K : Embedded A => Module.finrank ℚ K.1) sorry

/-- Unit test `ArithmeticStatistics.NumberFieldFamily.test_rat_discr`: `ℚ` (the bottom
subfield) has height `1`. -/
example : (embeddedFamily A).height ⟨⊥, inferInstance⟩ = 1 := sorry

/-- Unit test `ArithmeticStatistics.NumberFieldFamily.test_autWeight_galois`: a Galois field
of degree `n` has weight one (one embedded copy). -/
example (K : Embedded A) (h : Nat.card (K.1 ≃ₐ[ℚ] K.1) = Module.finrank ℚ K.1)
    (hn : 0 < Module.finrank ℚ K.1) : autWeight A (Quotient.mk _ K) = 1 := sorry

/-- Unit test `ArithmeticStatistics.NumberFieldFamily.test_autWeight_noncyclic_cubic`: a cubic
field with trivial automorphism group has weight `3`. -/
example (K : Embedded A) (h3 : Module.finrank ℚ K.1 = 3) (h : Nat.card (K.1 ≃ₐ[ℚ] K.1) = 1) :
    autWeight A (Quotient.mk _ K) = 3 := sorry

/-! ## ST.0/embedded-and-isomorphism-class-counts-of-number-fields -/

/-- In an algebraically closed `A`, counting embedded degree-`n` fields is counting isomorphism
classes with weight `n/#Aut(K)`. -/
theorem count_degree_eq_weightedCount [IsAlgClosed A] (n : ℕ) (X : ℝ) :
    ((embeddedFamily A).count (degree A n) X : ℝ) =
      (isoFamily A).weightedCount (fun k => if isoDegree A k = n then autWeight A k else 0) X :=
  sorry

end NumberFieldFamily

end ArithmeticStatistics

end ST0

/-! # ArithmeticStatistics:ST.1 — Parametrizations by orbits -/

noncomputable section ST1

/-! Tau Ceti declarations that the real development imports rather than restates are named in
comments: `WeierstrassCurve.Affine.A`, `M`, `μ`, `ker_μ_eq`, `normM`, `localRes`, `localCondition`
and `selmerGroup₂` (the `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil` modules). The étale
algebra and its square classes are spelled below exactly as Tau Ceti spells `W.A = AdjoinRoot W.f`
and `W.M = W.Aˣ ⧸ (powMonoidHom 2).range` for the curve `y² = x³ − 27 I x − 27 J`, so that the
statements transfer verbatim; statements that need `μ` or `selmerGroup₂` themselves are given in a
Mathlib-only form, with the Tau Ceti form in the docstring. -/

open Polynomial
open scoped MatrixGroups

namespace ArithmeticStatistics

/-! ## ST.1/binary-cubic-forms-and-the-twisted-action -/

/-- A binary cubic form `a x³ + b x²y + c xy² + d y³` with coefficients in `R`. -/
@[ext] structure BinaryCubicForm (R : Type*) where
  a : R
  b : R
  c : R
  d : R

namespace BinaryCubicForm

variable {R : Type*} [CommRing R]

/-- Evaluation at `(x, y)`. -/
def eval (f : BinaryCubicForm R) (x y : R) : R :=
  f.a * x ^ 3 + f.b * x ^ 2 * y + f.c * x * y ^ 2 + f.d * y ^ 3

/-- The coefficient vector as Mathlib's `Cubic`, i.e. the dehomogenization `f(X, 1)`. -/
def toCubic (f : BinaryCubicForm R) : Cubic R := ⟨f.a, f.b, f.c, f.d⟩

/-- The discriminant `b²c² − 4ac³ − 4b³d − 27a²d² + 18abcd`, Mathlib's `Cubic.discr`. -/
def disc (f : BinaryCubicForm R) : R := f.toCubic.discr

/-- The zero form. -/
instance : Zero (BinaryCubicForm R) := ⟨⟨0, 0, 0, 0⟩⟩

/-- Coefficientwise negation. -/
instance : Neg (BinaryCubicForm R) := ⟨fun f => ⟨-f.a, -f.b, -f.c, -f.d⟩⟩

/-- Scaling by `u`: the form `u f`. -/
def scale (u : R) (f : BinaryCubicForm R) : BinaryCubicForm R := ⟨u * f.a, u * f.b, u * f.c, u * f.d⟩

/-- The substitution `f ↦ f((x, y)·γ)`, where `(x, y)·γ = (γ₀₀x + γ₁₀y, γ₀₁x + γ₁₁y)`. -/
def subst (γ : Matrix (Fin 2) (Fin 2) R) (f : BinaryCubicForm R) : BinaryCubicForm R :=
  let p := γ 0 0
  let q := γ 0 1
  let r := γ 1 0
  let s := γ 1 1
  { a := f.a * p ^ 3 + f.b * p ^ 2 * q + f.c * p * q ^ 2 + f.d * q ^ 3
    b := 3 * f.a * p ^ 2 * r + f.b * (p ^ 2 * s + 2 * p * q * r) + f.c * (2 * p * q * s + q ^ 2 * r)
      + 3 * f.d * q ^ 2 * s
    c := 3 * f.a * p * r ^ 2 + f.b * (2 * p * r * s + q * r ^ 2) + f.c * (p * s ^ 2 + 2 * q * r * s)
      + 3 * f.d * q * s ^ 2
    d := f.a * r ^ 3 + f.b * r ^ 2 * s + f.c * r * s ^ 2 + f.d * s ^ 3 }

/-- The twisted action `γ • f = (det γ)⁻¹ f((x, y)·γ)` of Gan–Gross–Savin and
Bhargava–Shankar–Tsimerman (9). It is faithful: the scalar `u` acts by multiplication by `u`. -/
instance instMulAction : MulAction (GL (Fin 2) R) (BinaryCubicForm R) where
  smul γ f := scale (((Matrix.GeneralLinearGroup.det γ)⁻¹ : Rˣ) : R) (subst (γ : Matrix (Fin 2) (Fin 2) R) f)
  one_smul := sorry
  mul_smul := sorry

/-- Base change of coefficients along a ring homomorphism. -/
def map {S : Type*} [CommRing S] (φ : R →+* S) (f : BinaryCubicForm R) : BinaryCubicForm S :=
  ⟨φ f.a, φ f.b, φ f.c, φ f.d⟩

theorem smul_def (γ : GL (Fin 2) R) (f : BinaryCubicForm R) :
    γ • f = scale (((Matrix.GeneralLinearGroup.det γ)⁻¹ : Rˣ) : R) (subst (γ : Matrix (Fin 2) (Fin 2) R) f) :=
  sorry

theorem eval_smul (γ : GL (Fin 2) R) (f : BinaryCubicForm R) (x y : R) :
    (γ • f).eval x y = (((Matrix.GeneralLinearGroup.det γ)⁻¹ : Rˣ) : R) *
      f.eval ((γ : Matrix (Fin 2) (Fin 2) R) 0 0 * x + (γ : Matrix (Fin 2) (Fin 2) R) 1 0 * y)
        ((γ : Matrix (Fin 2) (Fin 2) R) 0 1 * x + (γ : Matrix (Fin 2) (Fin 2) R) 1 1 * y) := sorry

theorem disc_smul (γ : GL (Fin 2) R) (f : BinaryCubicForm R) :
    (γ • f).disc = ((Matrix.GeneralLinearGroup.det γ : Rˣ) : R) ^ 2 * f.disc := sorry

theorem scalar_smul (u : Rˣ) (f : BinaryCubicForm R) :
    Matrix.GeneralLinearGroup.scalar (Fin 2) u • f = scale (u : R) f := sorry

theorem map_smul {S : Type*} [CommRing S] (φ : R →+* S) (γ : GL (Fin 2) R) (f : BinaryCubicForm R) :
    (γ • f).map φ = Matrix.GeneralLinearGroup.map φ γ • f.map φ := sorry

theorem disc_map {S : Type*} [CommRing S] (φ : R →+* S) (f : BinaryCubicForm R) :
    (f.map φ).disc = φ f.disc := sorry

theorem disc_eq_discr_toCubic (f : BinaryCubicForm R) : f.disc = f.toCubic.discr := rfl

/-- The form with the coefficients of a Mathlib `Cubic`. -/
def ofCubic (P : Cubic R) : BinaryCubicForm R := ⟨P.a, P.b, P.c, P.d⟩

/-- Binary cubic forms and Mathlib's `Cubic` have the same coefficient data (no action is
transported: the twisted `GL₂`-action lives on `BinaryCubicForm` only). -/
def equivCubic : BinaryCubicForm R ≃ Cubic R where
  toFun := toCubic
  invFun := ofCubic
  left_inv _ := rfl
  right_inv _ := rfl

theorem disc_scale (u : R) (f : BinaryCubicForm R) : (f.scale u).disc = u ^ 4 * f.disc := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_disc_xy_x_sub_y`: the form
`xy(x − y) = x²y − xy²` has discriminant `1`. -/
example : (⟨0, 1, -1, 0⟩ : BinaryCubicForm ℤ).disc = 1 := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_scalar_two_twisted`: the scalar `2` acts by
multiplication by `2`, not by `8` as the untwisted substitution would. -/
example (f : BinaryCubicForm ℚ) :
    Matrix.GeneralLinearGroup.scalar (Fin 2) (Units.mk0 (2 : ℚ) two_ne_zero) • f =
      ⟨2 * f.a, 2 * f.b, 2 * f.c, 2 * f.d⟩ := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_disc_x_cubed`: `x³` is degenerate. -/
example : (⟨1, 0, 0, 0⟩ : BinaryCubicForm ℤ).disc = 0 := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_swap_action`: the swap matrix has
determinant `−1`, so it reverses the coefficients and changes their sign. -/
example (f : BinaryCubicForm ℤ) :
    Matrix.GeneralLinearGroup.mk'' (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ)
      (by simp [Matrix.det_fin_two_of]) • f = ⟨-f.d, -f.c, -f.b, -f.a⟩ :=
  sorry

end BinaryCubicForm

/-! ## ST.1/cubic-ring -/

namespace CubicRing

variable (R : Type*) [CommRing R] (A : Type*) [CommRing A] [Algebra R A]

/-- The discriminant of a cubic `R`-algebra with respect to a basis: the determinant of the trace
form, Mathlib's `Algebra.discr`. It changes by the square of a unit under a change of basis. -/
noncomputable def discr (b : Module.Basis (Fin 3) R A) : R := Algebra.discr R b

theorem discr_eq_det_traceMatrix (b : Module.Basis (Fin 3) R A) :
    discr R A b = (Algebra.traceMatrix R b).det := sorry

theorem discr_reindex (b : Module.Basis (Fin 3) R A) (P : Matrix (Fin 3) (Fin 3) R) (hP : IsUnit P.det) :
    ∃ b' : Module.Basis (Fin 3) R A, discr R A b' = P.det ^ 2 * discr R A b := sorry

theorem discr_int_eq (A : Type*) [CommRing A] (b b' : Module.Basis (Fin 3) ℤ A) :
    discr ℤ A b = discr ℤ A b' := sorry

/-- A ring `A` (in practice a cubic ring over `ℤ`) is maximal at `p` if no ring strictly between
`A` and `A[1/p]` is finitely generated as a `ℤ`-module. -/
def IsMaximalAt (p : ℕ) (A : Type*) [CommRing A] : Prop :=
  ∀ B : Subring (Localization.Away (p : A)),
    (algebraMap A (Localization.Away (p : A))).range ≤ B → Module.Finite ℤ B →
      B = (algebraMap A (Localization.Away (p : A))).range

/-- A ring is maximal if it is maximal at every prime. -/
def IsMaximal (A : Type*) [CommRing A] : Prop := ∀ p : ℕ, p.Prime → IsMaximalAt p A

theorem isMaximal_iff_forall_isMaximalAt (A : Type*) [CommRing A] :
    IsMaximal A ↔ ∀ p : ℕ, p.Prime → IsMaximalAt p A := Iff.rfl

theorem isMaximal_ringOfIntegers (K : Type*) [Field K] [NumberField K] :
    IsMaximal (NumberField.RingOfIntegers K) := sorry

/-- Unit test `ArithmeticStatistics.CubicRing.test_discr_pi`: the standard basis of `ℤ³` has
discriminant `1`. -/
example : discr ℤ (Fin 3 → ℤ) (Pi.basisFun ℤ (Fin 3)) = 1 := sorry

/-- Unit test `ArithmeticStatistics.CubicRing.test_discr_cube_root_two`: the power basis of
`ℤ[∛2]` has discriminant `−108`. -/
example : Algebra.discr ℤ (AdjoinRoot.powerBasis'
    (monic_X_pow_sub_C (2 : ℤ) (by norm_num : (3 : ℕ) ≠ 0))).basis = -108 := sorry

/-- Unit test `ArithmeticStatistics.CubicRing.test_not_isMaximalAt_nilpotent`: `ℤ[x]/(x³)` is not
maximal at `2` (it lies in the ring `ℤ + ℤ·x + ℤ·(x²/2)`). -/
example : ¬ IsMaximalAt 2 (AdjoinRoot (X ^ 3 : ℤ[X])) := sorry

end CubicRing

/-! ## ST.1/quotient-by-scalars-is-free -/

namespace CubicRing

/-- Gross–Lucianovic, Lemma 1.1, over a principal ideal domain: `1` extends to a basis. -/
theorem exists_basis_zero_eq_one {R A : Type*} [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]
    [CommRing A] [Algebra R A] [Nontrivial A] [Module.Free R A] [Module.Finite R A]
    (h : Module.finrank R A = 3) : ∃ b : Module.Basis (Fin 3) R A, b 0 = 1 := sorry

/-- Gross–Lucianovic, Lemma 1.1, over a local ring. -/
theorem exists_basis_zero_eq_one_of_isLocalRing {R A : Type*} [CommRing R] [IsLocalRing R]
    [CommRing A] [Algebra R A] [Nontrivial A] [Module.Free R A] [Module.Finite R A]
    (h : Module.finrank R A = 3) : ∃ b : Module.Basis (Fin 3) R A, b 0 = 1 := sorry

end CubicRing

/-! ## ST.1/cubic-ring-of-a-binary-cubic-form -/

namespace BinaryCubicForm

variable {R : Type*} [CommRing R]

/-- The relations `ωθ = −ad`, `ω² = −ac − bω + aθ`, `θ² = −bd − dω + cθ` of
Bhargava–Shankar–Tsimerman (10)–(11). -/
noncomputable def cubicRingIdeal (f : BinaryCubicForm R) : Ideal (MvPolynomial (Fin 2) R) :=
  Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 + MvPolynomial.C (f.a * f.d),
    MvPolynomial.X 0 ^ 2 + MvPolynomial.C (f.a * f.c) + MvPolynomial.C f.b * MvPolynomial.X 0 -
      MvPolynomial.C f.a * MvPolynomial.X 1,
    MvPolynomial.X 1 ^ 2 + MvPolynomial.C (f.b * f.d) + MvPolynomial.C f.d * MvPolynomial.X 0 -
      MvPolynomial.C f.c * MvPolynomial.X 1}

/-- The cubic ring `R(f)` of a binary cubic form (Delone–Faddeev). -/
abbrev cubicRing (f : BinaryCubicForm R) : Type _ := MvPolynomial (Fin 2) R ⧸ f.cubicRingIdeal

/-- The generator `ω` of `R(f)`. -/
noncomputable def ω (f : BinaryCubicForm R) : f.cubicRing := Ideal.Quotient.mk _ (MvPolynomial.X 0)

/-- The generator `θ` of `R(f)`. -/
noncomputable def θ (f : BinaryCubicForm R) : f.cubicRing := Ideal.Quotient.mk _ (MvPolynomial.X 1)

theorem ω_mul_θ (f : BinaryCubicForm R) : f.ω * f.θ = algebraMap R f.cubicRing (-(f.a * f.d)) := sorry

theorem ω_sq (f : BinaryCubicForm R) :
    f.ω ^ 2 = algebraMap R f.cubicRing (-(f.a * f.c)) - f.b • f.ω + f.a • f.θ := sorry

theorem θ_sq (f : BinaryCubicForm R) :
    f.θ ^ 2 = algebraMap R f.cubicRing (-(f.b * f.d)) - f.d • f.ω + f.c • f.θ := sorry

/-- The normal basis `⟨1, ω, θ⟩` of `R(f)`. -/
noncomputable def basis (f : BinaryCubicForm R) : Module.Basis (Fin 3) R f.cubicRing := sorry

theorem basis_zero (f : BinaryCubicForm R) : f.basis 0 = 1 := sorry

theorem basis_one (f : BinaryCubicForm R) : f.basis 1 = f.ω := sorry

theorem basis_two (f : BinaryCubicForm R) : f.basis 2 = f.θ := sorry

theorem finrank_cubicRing [Nontrivial R] (f : BinaryCubicForm R) :
    Module.finrank R f.cubicRing = 3 := sorry

/-- `GL₂(R)`-equivalent forms give isomorphic rings. -/
noncomputable def cubicRingSmulEquiv (γ : GL (Fin 2) R) (f : BinaryCubicForm R) :
    (γ • f).cubicRing ≃ₐ[R] f.cubicRing := sorry

/-- For `a = 1`, `R(f) = R[ω]` with `ω³ + bω² + cω + d = 0`. -/
noncomputable def cubicRingMonicEquiv (f : BinaryCubicForm R) (h : f.a = 1) :
    f.cubicRing ≃ₐ[R] AdjoinRoot (X ^ 3 + C f.b * X ^ 2 + C f.c * X + C f.d) := sorry

/-- The content relation `R(n f) = R + n R(f)`: the homomorphism `ω ↦ nω`, `θ ↦ nθ`. -/
noncomputable def cubicRingScaleHom (n : R) (f : BinaryCubicForm R) :
    (f.scale n).cubicRing →ₐ[R] f.cubicRing := sorry

theorem cubicRingScaleHom_ω (n : R) (f : BinaryCubicForm R) :
    cubicRingScaleHom n f (f.scale n).ω = n • f.ω := sorry

/-- Base change: `R(f) ⊗_R S ≅ R(f_S)`. -/
noncomputable def cubicRingBaseChange {S : Type*} [CommRing S] [Algebra R S] (f : BinaryCubicForm R) :
    TensorProduct R S f.cubicRing ≃ₐ[S] (f.map (algebraMap R S)).cubicRing := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_cubicRing_split`: `R(x²y − xy²) ≅ ℤ³`. -/
example : Nonempty ((⟨0, 1, -1, 0⟩ : BinaryCubicForm ℤ).cubicRing ≃ₐ[ℤ] (Fin 3 → ℤ)) := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_cubicRing_zero`: the zero form gives the
ring with `ω² = θ² = ωθ = 0`. -/
example : (0 : BinaryCubicForm ℤ).ω ^ 2 = 0 ∧ (0 : BinaryCubicForm ℤ).θ ^ 2 = 0 ∧
    (0 : BinaryCubicForm ℤ).ω * (0 : BinaryCubicForm ℤ).θ = 0 := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_cubicRing_cube_root`: `R(x³ + 2y³) ≅ ℤ[∛(−2)]`. -/
example : Nonempty ((⟨1, 0, 0, 2⟩ : BinaryCubicForm ℤ).cubicRing ≃ₐ[ℤ] AdjoinRoot (X ^ 3 + C 2 : ℤ[X])) :=
  sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_cubicRing_reducible_zero_divisor`: for
`y(x² + y²)` (so `a = 0`), `ωθ = 0` although `ω, θ ≠ 0`. -/
example : (⟨0, 1, 0, 1⟩ : BinaryCubicForm ℤ).ω * (⟨0, 1, 0, 1⟩ : BinaryCubicForm ℤ).θ = 0 := sorry

end BinaryCubicForm

/-! ## ST.1/discriminant-of-the-cubic-ring-of-a-form -/

/-- Bhargava–Shankar–Tsimerman, Proposition 10: `Disc R(f) = Disc f`. -/
theorem BinaryCubicForm.discr_basis {R : Type*} [CommRing R] (f : BinaryCubicForm R) :
    Algebra.discr R f.basis = f.disc := sorry

/-! ## ST.1/index-form-of-a-based-cubic-ring -/

namespace CubicRing

variable {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]

/-- The determinant of the coordinates of `1, u, v` in the basis `b`. -/
noncomputable def det3 (b : Module.Basis (Fin 3) R A) (u v : A) : R :=
  Matrix.det (Matrix.of ![⇑(b.repr 1), ⇑(b.repr u), ⇑(b.repr v)])

/-- The index form of a basis `⟨1, b₁, b₂⟩`: `1 ∧ ξ ∧ ξ² = I(x, y) (1 ∧ b₁ ∧ b₂)` for
`ξ = x b₁ + y b₂`, written out by polarization. -/
noncomputable def indexForm (b : Module.Basis (Fin 3) R A) : BinaryCubicForm R :=
  ⟨det3 b (b 1) (b 1 ^ 2), det3 b (b 2) (b 1 ^ 2) + 2 * det3 b (b 1) (b 1 * b 2),
    2 * det3 b (b 2) (b 1 * b 2) + det3 b (b 1) (b 2 ^ 2), det3 b (b 2) (b 2 ^ 2)⟩

theorem eval_indexForm (b : Module.Basis (Fin 3) R A) (x y : R) :
    (indexForm b).eval x y = det3 b (x • b 1 + y • b 2) ((x • b 1 + y • b 2) ^ 2) := sorry

theorem indexForm_translate (b b' : Module.Basis (Fin 3) R A) (h0 : b 0 = 1) (h0' : b' 0 = 1)
    (h1 : ∃ r : R, b' 1 = b 1 + algebraMap R A r) (h2 : ∃ s : R, b' 2 = b 2 + algebraMap R A s) :
    indexForm b' = indexForm b := sorry

theorem indexForm_eq_smul (b b' : Module.Basis (Fin 3) R A) (h0 : b 0 = 1) (h0' : b' 0 = 1) :
    ∃ γ : GL (Fin 2) R, indexForm b' = γ • indexForm b := sorry

theorem indexForm_cubicRing_basis (f : BinaryCubicForm R) : indexForm f.basis = f := sorry

/-- Gan–Gross–Savin, Lemma 5.3: `|I(m, n)|` is the index of `ℤ[m b₁ + n b₂]`. -/
theorem index_adjoin_eq_natAbs_indexForm {A : Type*} [CommRing A] (b : Module.Basis (Fin 3) ℤ A)
    (h0 : b 0 = 1) (m n : ℤ) (h : (indexForm b).eval m n ≠ 0) :
    (Subalgebra.toSubmodule (Algebra.adjoin ℤ {m • b 1 + n • b 2})).toAddSubgroup.index =
      ((indexForm b).eval m n).natAbs := sorry

/-- Unit test `ArithmeticStatistics.CubicRing.test_indexForm_pi`: for the basis `⟨1, e₀, e₁⟩`
of `ℤ³` the index form is `xy² − x²y`. -/
example (b : Module.Basis (Fin 3) ℤ (Fin 3 → ℤ)) (h0 : b 0 = 1) (h1 : b 1 = Pi.single 0 1)
    (h2 : b 2 = Pi.single 1 1) : indexForm b = ⟨0, -1, 1, 0⟩ := sorry

/-- Unit test `ArithmeticStatistics.CubicRing.test_indexForm_cube_root`: the normal basis of
`R(x³ + 2y³)` has index form `x³ + 2y³`. -/
example : indexForm (⟨1, 0, 0, 2⟩ : BinaryCubicForm ℤ).basis = ⟨1, 0, 0, 2⟩ := sorry

/-- Unit test `ArithmeticStatistics.CubicRing.test_indexForm_negate_basis`: replacing `b₁, b₂` by
`−b₁, −b₂` negates the index form (the twisted action of `−1`). -/
example (b b' : Module.Basis (Fin 3) ℤ (Fin 3 → ℤ)) (h0 : b 0 = 1) (h0' : b' 0 = 1)
    (h1 : b' 1 = -b 1) (h2 : b' 2 = -b 2) : indexForm b' = -indexForm b := sorry

end CubicRing

/-! ## ST.1/normal-bases-of-a-cubic-ring -/

namespace CubicRing

variable {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]

theorem exists_normal_translate (b : Module.Basis (Fin 3) R A) (h0 : b 0 = 1) :
    ∃ b' : Module.Basis (Fin 3) R A, b' 0 = 1 ∧ (∃ r : R, b' 1 = b 1 + algebraMap R A r) ∧
      (∃ s : R, b' 2 = b 2 + algebraMap R A s) ∧ ∃ n : R, b' 1 * b' 2 = algebraMap R A n := sorry

theorem mul_table_of_normal (b : Module.Basis (Fin 3) R A) (h0 : b 0 = 1)
    (hn : ∃ n : R, b 1 * b 2 = algebraMap R A n) :
    b 1 * b 2 = algebraMap R A (-((indexForm b).a * (indexForm b).d)) ∧
    b 1 ^ 2 = algebraMap R A (-((indexForm b).a * (indexForm b).c)) - (indexForm b).b • b 1 +
      (indexForm b).a • b 2 ∧
    b 2 ^ 2 = algebraMap R A (-((indexForm b).b * (indexForm b).d)) - (indexForm b).d • b 1 +
      (indexForm b).c • b 2 := sorry

end CubicRing

/-! ## ST.1/delone-faddeev-parametrization-of-cubic-rings -/

namespace BinaryCubicForm

/-- Delone–Faddeev, Gan–Gross–Savin Proposition 4.2, Gross–Lucianovic Proposition 2.1 (over a
principal ideal domain): every cubic algebra is `R(f)` for its index form `f`. -/
theorem deloneFaddeev_exists {R A : Type*} [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]
    [CommRing A] [Algebra R A] [Nontrivial A] [Module.Free R A] [Module.Finite R A]
    (h : Module.finrank R A = 3) : ∃ f : BinaryCubicForm R, Nonempty (A ≃ₐ[R] f.cubicRing) := sorry

/-- The same over a local ring. -/
theorem deloneFaddeev_exists_of_isLocalRing {R A : Type*} [CommRing R] [IsLocalRing R]
    [CommRing A] [Algebra R A] [Nontrivial A] [Module.Free R A] [Module.Finite R A]
    (h : Module.finrank R A = 3) : ∃ f : BinaryCubicForm R, Nonempty (A ≃ₐ[R] f.cubicRing) := sorry

/-- Delone–Faddeev: `R(f) ≅ R(g)` if and only if `f` and `g` are `GL₂(R)`-equivalent (twisted
action), for `R` a principal ideal domain or a local ring. -/
theorem deloneFaddeev_iso_iff {R : Type*} [CommRing R] [IsDomain R] [IsPrincipalIdealRing R]
    (f g : BinaryCubicForm R) :
    Nonempty (f.cubicRing ≃ₐ[R] g.cubicRing) ↔ ∃ γ : GL (Fin 2) R, γ • f = g := sorry

theorem deloneFaddeev_iso_iff_of_isLocalRing {R : Type*} [CommRing R] [IsLocalRing R]
    (f g : BinaryCubicForm R) :
    Nonempty (f.cubicRing ≃ₐ[R] g.cubicRing) ↔ ∃ γ : GL (Fin 2) R, γ • f = g := sorry

end BinaryCubicForm

/-! ## ST.1/automorphisms-of-cubic-rings-are-stabilizers -/

/-- Bhargava–Shankar–Tsimerman, Proposition 12. -/
theorem BinaryCubicForm.nonempty_algEquiv_equiv_stabilizer {R : Type*} [CommRing R] [IsDomain R]
    [IsPrincipalIdealRing R] (f : BinaryCubicForm R) :
    Nonempty ((f.cubicRing ≃ₐ[R] f.cubicRing) ≃* MulAction.stabilizer (GL (Fin 2) R) f) := sorry

/-! ## ST.1/reducible-forms-and-zero-divisors -/

/-- Bhargava–Shankar–Tsimerman, Proposition 11: `R(f)` is a domain iff `f` has no rational zero. -/
theorem BinaryCubicForm.isDomain_cubicRing_iff (f : BinaryCubicForm ℤ) (hf : f ≠ 0) :
    IsDomain f.cubicRing ↔ ∀ x y : ℤ, (x, y) ≠ (0, 0) → f.eval x y ≠ 0 := sorry

/-- Over a field: `R(f)` is a field iff `f ≠ 0` has no zero in `ℙ¹(K)`. -/
theorem BinaryCubicForm.isField_cubicRing_iff {K : Type*} [Field K] (f : BinaryCubicForm K) :
    IsField f.cubicRing ↔ f ≠ 0 ∧ ∀ x y : K, (x, y) ≠ (0, 0) → f.eval x y ≠ 0 := sorry

/-! ## ST.1/nondegenerate-forms-and-etale-cubic-algebras -/

theorem BinaryCubicForm.etale_iff_disc_ne_zero {K : Type*} [Field K] (f : BinaryCubicForm K) :
    Algebra.Etale K f.cubicRing ↔ f.disc ≠ 0 := sorry

/-! ## ST.1/davenport-heilbronn-sets -/

namespace BinaryCubicForm

/-- The Davenport–Heilbronn set `U_p`: forms not divisible by `p` and not `GL₂(ℤ)`-equivalent to a
form with `p² ∣ a` and `p ∣ b`. -/
def U (p : ℕ) : Set (BinaryCubicForm ℤ) :=
  {f | ¬ ((p : ℤ) ∣ f.a ∧ (p : ℤ) ∣ f.b ∧ (p : ℤ) ∣ f.c ∧ (p : ℤ) ∣ f.d) ∧
    ∀ γ : GL (Fin 2) ℤ, ¬ ((p : ℤ) ^ 2 ∣ (γ • f).a ∧ (p : ℤ) ∣ (γ • f).b)}

theorem mem_U_iff (p : ℕ) (f : BinaryCubicForm ℤ) :
    f ∈ U p ↔ ¬ ((p : ℤ) ∣ f.a ∧ (p : ℤ) ∣ f.b ∧ (p : ℤ) ∣ f.c ∧ (p : ℤ) ∣ f.d) ∧
      ∀ γ : GL (Fin 2) ℤ, ¬ ((p : ℤ) ^ 2 ∣ (γ • f).a ∧ (p : ℤ) ∣ (γ • f).b) := Iff.rfl

theorem smul_mem_U (p : ℕ) (γ : GL (Fin 2) ℤ) {f : BinaryCubicForm ℤ} (hf : f ∈ U p) :
    γ • f ∈ U p := sorry

theorem mem_U_of_modEq (p : ℕ) {f g : BinaryCubicForm ℤ} (hf : f ∈ U p)
    (h : (p : ℤ) ^ 2 ∣ f.a - g.a ∧ (p : ℤ) ^ 2 ∣ f.b - g.b ∧ (p : ℤ) ^ 2 ∣ f.c - g.c ∧
      (p : ℤ) ^ 2 ∣ f.d - g.d) : g ∈ U p := sorry

theorem mem_U_of_not_dvd_disc {p : ℕ} (hp : p.Prime) {f : BinaryCubicForm ℤ}
    (h : ¬ (p : ℤ) ^ 2 ∣ f.disc) : f ∈ U p := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_U_cube_root_two`: `x³ + 2y³ ∈ U₃`. -/
example : (⟨1, 0, 0, 2⟩ : BinaryCubicForm ℤ) ∈ U 3 := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_not_mem_U_x3_add_y3`: `x³ + y³ ∉ U₃`
(the substitution `y ↦ y − x` gives `3x²y − 3xy² + y³`). -/
example : (⟨1, 0, 0, 1⟩ : BinaryCubicForm ℤ) ∉ U 3 := sorry

/-- Unit test `ArithmeticStatistics.BinaryCubicForm.test_zero_not_mem_U`: `0 ∉ U_p`. -/
example (p : ℕ) : (0 : BinaryCubicForm ℤ) ∉ U p := sorry

end BinaryCubicForm

/-! ## ST.1/nonmaximal-cubic-rings-have-small-overrings -/

/-- Bhargava–Shankar–Tsimerman, Lemma 13, in the language of forms: a nonmaximal `R(f)` has a
normal basis with (14) for `(i, j) = (1, 0)` or `(1, 1)`. -/
theorem BinaryCubicForm.exists_smul_of_not_isMaximalAt {p : ℕ} (hp : p.Prime) (f : BinaryCubicForm ℤ)
    (h : ¬ CubicRing.IsMaximalAt p f.cubicRing) :
    ((p : ℤ) ∣ f.a ∧ (p : ℤ) ∣ f.b ∧ (p : ℤ) ∣ f.c ∧ (p : ℤ) ∣ f.d) ∨
      ∃ γ : GL (Fin 2) ℤ, (p : ℤ) ^ 2 ∣ (γ • f).a ∧ (p : ℤ) ∣ (γ • f).b := sorry

/-! ## ST.1/davenport-heilbronn-maximality-criterion -/

/-- Davenport–Heilbronn; Bhargava–Shankar–Tsimerman, Theorem 14. -/
theorem BinaryCubicForm.isMaximalAt_iff_mem_U {p : ℕ} (hp : p.Prime) (f : BinaryCubicForm ℤ) :
    CubicRing.IsMaximalAt p f.cubicRing ↔ f ∈ BinaryCubicForm.U p := sorry

theorem BinaryCubicForm.isMaximal_iff_forall_mem_U (f : BinaryCubicForm ℤ) :
    CubicRing.IsMaximal f.cubicRing ↔ ∀ p : ℕ, p.Prime → f ∈ BinaryCubicForm.U p := sorry

/-! ## ST.1/index-p-subrings-of-a-cubic-ring -/

namespace BinaryCubicForm

/-- The number of zeros of `f mod p` in `ℙ¹(𝔽_p)`. -/
noncomputable def numZerosMod (p : ℕ) (f : BinaryCubicForm ℤ) : ℕ :=
  {x : ZMod p | (f.map (Int.castRingHom (ZMod p))).eval x 1 = 0}.ncard +
    if ((f.a : ℤ) : ZMod p) = 0 then 1 else 0

/-- Bhargava–Shankar–Tsimerman, Proposition 15. -/
theorem ncard_subrings_index_p {p : ℕ} (hp : p.Prime) (f : BinaryCubicForm ℤ) :
    {S : Subring f.cubicRing | S.toAddSubgroup.index = p}.ncard = numZerosMod p f := sorry

/-! ## ST.1/index-p-overrings-of-a-cubic-ring -/

/-- The number of zeros `α ∈ ℙ¹(𝔽_p)` of `f mod p` such that `f(α') ≡ 0 (mod p²)` for every lift
`α'` of `α` (these are double zeros of `f mod p`). -/
noncomputable def numLiftableDoubleZeros (p : ℕ) (f : BinaryCubicForm ℤ) : ℕ :=
  {x : ZMod p | ∀ x' : ℤ, (x' : ZMod p) = x → (p : ℤ) ^ 2 ∣ f.eval x' 1}.ncard +
    if (p : ℤ) ^ 2 ∣ f.a ∧ (p : ℤ) ∣ f.b then 1 else 0

/-- Bhargava–Shankar–Tsimerman, Proposition 16: the rings `B` with `R(f) ⊆ B ⊆ R(f)[1/p]` and
`[B : R(f)] = p` correspond to the liftable double zeros of `f mod p`. -/
theorem ncard_overrings_index_p {p : ℕ} (hp : p.Prime) (f : BinaryCubicForm ℤ) :
    {B : Subring (Localization.Away (p : f.cubicRing)) |
      (algebraMap f.cubicRing (Localization.Away (p : f.cubicRing))).range ≤ B ∧
        ((algebraMap f.cubicRing (Localization.Away (p : f.cubicRing))).range.toAddSubgroup.addSubgroupOf
          B.toAddSubgroup).index = p}.ncard = numLiftableDoubleZeros p f := sorry

end BinaryCubicForm

/-! ## ST.1/pairs-of-ternary-quadratic-forms -/

/-- An integer-valued ternary quadratic form `Σ_{i ≤ j} a_ij x_i x_j` (so its Gram matrix has
integral diagonal and half-integral off-diagonal entries), Bhargava HCL III (19). -/
@[ext] structure TernaryQuadraticForm (R : Type*) where
  a11 : R
  a22 : R
  a33 : R
  a12 : R
  a13 : R
  a23 : R

namespace TernaryQuadraticForm

variable {R : Type*} [CommRing R]

/-- Evaluation at `t = (t₀, t₁, t₂)`. -/
def eval (Q : TernaryQuadraticForm R) (t : Fin 3 → R) : R :=
  Q.a11 * t 0 ^ 2 + Q.a22 * t 1 ^ 2 + Q.a33 * t 2 ^ 2 + Q.a12 * t 0 * t 1 + Q.a13 * t 0 * t 2 +
    Q.a23 * t 1 * t 2

/-- `4 · Det`, where `Det` is the determinant of the half-integral Gram matrix. -/
def det4 (Q : TernaryQuadraticForm R) : R :=
  4 * Q.a11 * Q.a22 * Q.a33 - Q.a11 * Q.a23 ^ 2 - Q.a12 ^ 2 * Q.a33 + Q.a12 * Q.a13 * Q.a23 -
    Q.a13 ^ 2 * Q.a22

/-- The form `t ↦ Q(Mᵀ t)`, whose Gram matrix is `M G Mᵀ`; coefficients by polarization. -/
def comp (Q : TernaryQuadraticForm R) (M : Matrix (Fin 3) (Fin 3) R) : TernaryQuadraticForm R :=
  let q : (Fin 3 → R) → R := fun t => Q.eval fun k => ∑ l, M l k * t l
  let e : Fin 3 → Fin 3 → R := fun i => Pi.single i 1
  ⟨q (e 0), q (e 1), q (e 2), q (e 0 + e 1) - q (e 0) - q (e 1), q (e 0 + e 2) - q (e 0) - q (e 2),
    q (e 1 + e 2) - q (e 1) - q (e 2)⟩

/-- The linear combination `x A + y B`. -/
def lincomb (x : R) (A : TernaryQuadraticForm R) (y : R) (B : TernaryQuadraticForm R) :
    TernaryQuadraticForm R :=
  ⟨x * A.a11 + y * B.a11, x * A.a22 + y * B.a22, x * A.a33 + y * B.a33, x * A.a12 + y * B.a12,
    x * A.a13 + y * B.a13, x * A.a23 + y * B.a23⟩

/-- The Mathlib quadratic form with the same values. -/
noncomputable def toQuadraticForm (Q : TernaryQuadraticForm R) : QuadraticForm R (Fin 3 → R) :=
  LinearMap.BilinMap.toQuadraticMap (Matrix.toLinearMap₂' R
    !![Q.a11, Q.a12, Q.a13; 0, Q.a22, Q.a23; 0, 0, Q.a33])

theorem toQuadraticForm_apply (Q : TernaryQuadraticForm R) (t : Fin 3 → R) :
    Q.toQuadraticForm t = Q.eval t := sorry

theorem det4_comp (Q : TernaryQuadraticForm R) (M : Matrix (Fin 3) (Fin 3) R) :
    (Q.comp M).det4 = M.det ^ 2 * Q.det4 := sorry

end TernaryQuadraticForm

/-- A pair `(A, B)` of integer-valued ternary quadratic forms: an element of `(Sym² R³ ⊗ R²)*`. -/
@[ext] structure TernaryQuadraticPair (R : Type*) where
  A : TernaryQuadraticForm R
  B : TernaryQuadraticForm R

namespace TernaryQuadraticPair

variable {R : Type*} [CommRing R]

/-- The action of `GL₃ × GL₂`, HCL III (11): `(g₃, g₂) · (A, B) = (r A' + s B', t A' + u B')` with
`A' = g₃ A g₃ᵀ`, `B' = g₃ B g₃ᵀ` and `g₂ = (r s; t u)`. -/
instance instMulAction : MulAction (GL (Fin 3) R × GL (Fin 2) R) (TernaryQuadraticPair R) where
  smul g P :=
    let A' := P.A.comp (g.1 : Matrix (Fin 3) (Fin 3) R)
    let B' := P.B.comp (g.1 : Matrix (Fin 3) (Fin 3) R)
    let m := (g.2 : Matrix (Fin 2) (Fin 2) R)
    ⟨TernaryQuadraticForm.lincomb (m 0 0) A' (m 0 1) B', TernaryQuadraticForm.lincomb (m 1 0) A' (m 1 1) B'⟩
  one_smul := sorry
  mul_smul := sorry

/-- The cubic resolvent form `4 · Det(A x − B y)` (the Bhargava–Shankar sign convention; HCL III
prints `A x + B y`, see the source issues). -/
def resolventForm (P : TernaryQuadraticPair R) : BinaryCubicForm R :=
  ⟨4*P.A.a11*P.A.a22*P.A.a33 - P.A.a11*P.A.a23^2 - P.A.a12^2*P.A.a33 + P.A.a12*P.A.a13*P.A.a23 - P.A.a13^2*P.A.a22, -4*P.A.a11*P.A.a22*P.B.a33 + 2*P.A.a11*P.A.a23*P.B.a23 - 4*P.A.a11*P.A.a33*P.B.a22 + P.A.a12^2*P.B.a33 - P.A.a12*P.A.a13*P.B.a23 - P.A.a12*P.A.a23*P.B.a13 + 2*P.A.a12*P.A.a33*P.B.a12 + P.A.a13^2*P.B.a22 + 2*P.A.a13*P.A.a22*P.B.a13 - P.A.a13*P.A.a23*P.B.a12 - 4*P.A.a22*P.A.a33*P.B.a11 + P.A.a23^2*P.B.a11, 4*P.A.a11*P.B.a22*P.B.a33 - P.A.a11*P.B.a23^2 - 2*P.A.a12*P.B.a12*P.B.a33 + P.A.a12*P.B.a13*P.B.a23 + P.A.a13*P.B.a12*P.B.a23 - 2*P.A.a13*P.B.a13*P.B.a22 + 4*P.A.a22*P.B.a11*P.B.a33 - P.A.a22*P.B.a13^2 - 2*P.A.a23*P.B.a11*P.B.a23 + P.A.a23*P.B.a12*P.B.a13 + 4*P.A.a33*P.B.a11*P.B.a22 - P.A.a33*P.B.a12^2, -4*P.B.a11*P.B.a22*P.B.a33 + P.B.a11*P.B.a23^2 + P.B.a12^2*P.B.a33 - P.B.a12*P.B.a13*P.B.a23 + P.B.a13^2*P.B.a22⟩

/-- The discriminant `Disc(A, B) = Disc(4 · Det(A x − B y))`. -/
def disc (P : TernaryQuadraticPair R) : R := P.resolventForm.disc

/-- The coefficient `a_ij` (symmetric in `i, j`). -/
def coeffA (P : TernaryQuadraticPair R) (i j : Fin 3) : R :=
  match i, j with
  | 0, 0 => P.A.a11 | 1, 1 => P.A.a22 | 2, 2 => P.A.a33
  | 0, 1 => P.A.a12 | 1, 0 => P.A.a12 | 0, 2 => P.A.a13 | 2, 0 => P.A.a13
  | 1, 2 => P.A.a23 | 2, 1 => P.A.a23

/-- The coefficient `b_ij` (symmetric in `i, j`). -/
def coeffB (P : TernaryQuadraticPair R) (i j : Fin 3) : R :=
  match i, j with
  | 0, 0 => P.B.a11 | 1, 1 => P.B.a22 | 2, 2 => P.B.a33
  | 0, 1 => P.B.a12 | 1, 0 => P.B.a12 | 0, 2 => P.B.a13 | 2, 0 => P.B.a13
  | 1, 2 => P.B.a23 | 2, 1 => P.B.a23

/-- The `SL₂`-invariants `λ^{ij}_{kl} = a_ij b_kl − a_kl b_ij`, HCL III (20). -/
def lam (P : TernaryQuadraticPair R) (i j k l : Fin 3) : R :=
  P.coeffA i j * P.coeffB k l - P.coeffA k l * P.coeffB i j

/-- The content: the greatest common divisor of the `λ^{ij}_{kl}`. -/
def content (P : TernaryQuadraticPair ℤ) : ℤ :=
  (Finset.univ : Finset (Fin 3 × Fin 3 × Fin 3 × Fin 3)).gcd fun t => P.lam t.1 t.2.1 t.2.2.1 t.2.2.2

theorem resolventForm_A_eq (P : TernaryQuadraticPair R) : P.resolventForm.a = P.A.det4 := sorry

theorem disc_smul (g : GL (Fin 3) R × GL (Fin 2) R) (P : TernaryQuadraticPair R) :
    (g • P).disc = ((Matrix.GeneralLinearGroup.det g.1 : Rˣ) : R) ^ 8 *
      ((Matrix.GeneralLinearGroup.det g.2 : Rˣ) : R) ^ 6 * P.disc := sorry

theorem lam_smul_SL2 (g : GL (Fin 2) R) (hg : ((Matrix.GeneralLinearGroup.det g : Rˣ) : R) = 1)
    (P : TernaryQuadraticPair R) (i j k l : Fin 3) :
    (((1 : GL (Fin 3) R), g) • P).lam i j k l = P.lam i j k l := sorry

theorem lam_eq_zero_iff (P : TernaryQuadraticPair ℚ) :
    (∀ i j k l, P.lam i j k l = 0) ↔ ∃ x y : ℚ, (x, y) ≠ (0, 0) ∧
      TernaryQuadraticForm.lincomb x P.A y P.B = ⟨0, 0, 0, 0, 0, 0⟩ := sorry

/-- Unit test `ArithmeticStatistics.TernaryQuadraticPair.test_resolventForm_veronese`: for
`A₁ = x₁x₃ − x₂²` and `B = a x₁² + b x₁x₂ + c x₂² + d x₂x₃ + e x₃²` the resolvent form is the monic
`x³ + c x²y + (bd − 4ae) xy² + (ad² + b²e − 4ace) y³`. -/
example (a b c d e : ℤ) :
    (⟨⟨0, -1, 0, 0, 1, 0⟩, ⟨a, c, e, b, 0, d⟩⟩ : TernaryQuadraticPair ℤ).resolventForm =
      ⟨1, c, b * d - 4 * a * e, a * d ^ 2 + b ^ 2 * e - 4 * a * c * e⟩ := sorry

/-- Unit test `ArithmeticStatistics.TernaryQuadraticPair.test_det4_sum_of_squares`: `4·Det` of
`x₁² + x₂² + x₃²` is `4`. -/
example : (⟨1, 1, 1, 0, 0, 0⟩ : TernaryQuadraticForm ℤ).det4 = 4 := sorry

/-- Unit test `ArithmeticStatistics.TernaryQuadraticPair.test_disc_proportional`: a pair with
proportional forms has all `λ = 0` and discriminant `0`. -/
example (Q : TernaryQuadraticForm ℤ) : (⟨Q, Q⟩ : TernaryQuadraticPair ℤ).disc = 0 := sorry

end TernaryQuadraticPair

/-! ## ST.1/quartic-ring-and-cubic-resolvent -/

namespace QuarticRing

/-- The coordinates of `x` on `α₁, α₂, α₃` for a basis `⟨1, α₁, α₂, α₃⟩`. -/
noncomputable def coords {Q : Type*} [CommRing Q] (bQ : Module.Basis (Fin 4) ℤ Q) (x : Q) : Fin 3 → ℤ :=
  fun k => bQ.repr x k.succ

/-- A based cubic resolvent: `(bQ, bC, P)` satisfy HCL III (29) (in coordinates, (12)) and (34)
with the resolvent mapping `φ(Σ tᵢ αᵢ) = B(t) ω₁ + A(t) ω₂`. The index form is the one of
`CubicRing.indexForm`, whose normal-basis convention is Bhargava–Shankar–Tsimerman's; in it the
cubic resolvent ring of `P` has index form `−4 · Det(A x − B y)`. -/
def IsResolventPair {Q C : Type*} [CommRing Q] [CommRing C] (bQ : Module.Basis (Fin 4) ℤ Q)
    (bC : Module.Basis (Fin 3) ℤ C) (P : TernaryQuadraticPair ℤ) : Prop :=
  bQ 0 = 1 ∧ bC 0 = 1 ∧
    (∀ x y : Q, Matrix.det (Matrix.of ![⇑(bQ.repr 1), ⇑(bQ.repr x), ⇑(bQ.repr y), ⇑(bQ.repr (x * y))]) =
      P.B.eval (coords bQ x) * P.A.eval (coords bQ y) - P.A.eval (coords bQ x) * P.B.eval (coords bQ y)) ∧
    CubicRing.indexForm bC = -P.resolventForm

/-- A cubic resolvent ring of a quartic ring `Q` (HCL III, Definition 20), in based form. -/
def HasCubicResolvent (Q C : Type*) [CommRing Q] [CommRing C] : Prop :=
  ∃ (bQ : Module.Basis (Fin 4) ℤ Q) (bC : Module.Basis (Fin 3) ℤ C) (P : TernaryQuadraticPair ℤ),
    IsResolventPair bQ bC P

/-- The content of a ring of finite rank: the largest `n` with `Q = ℤ + n Q'`. -/
noncomputable def ringContent (Q : Type*) [CommRing Q] : ℕ :=
  sSup {n : ℕ | ∃ S : Subring Q, ∀ x : Q, ∃ (k : ℤ) (s : Q), s ∈ S ∧ x = k + n * s}

theorem isResolventPair_smul {Q C : Type*} [CommRing Q] [CommRing C] (bQ : Module.Basis (Fin 4) ℤ Q)
    (bC : Module.Basis (Fin 3) ℤ C) (P : TernaryQuadraticPair ℤ) (h : IsResolventPair bQ bC P)
    (g : GL (Fin 3) ℤ × GL (Fin 2) ℤ) :
    ∃ (bQ' : Module.Basis (Fin 4) ℤ Q) (bC' : Module.Basis (Fin 3) ℤ C), IsResolventPair bQ' bC' (g • P) := sorry

theorem discr_eq_of_isResolventPair {Q C : Type*} [CommRing Q] [CommRing C] (bQ : Module.Basis (Fin 4) ℤ Q)
    (bC : Module.Basis (Fin 3) ℤ C) (P : TernaryQuadraticPair ℤ) (h : IsResolventPair bQ bC P) :
    Algebra.discr ℤ bQ = P.disc ∧ Algebra.discr ℤ bC = P.disc := sorry

/-- Unit test `ArithmeticStatistics.QuarticRing.test_split_has_resolvent`: `ℤ⁴` has the cubic
resolvent `ℤ³`. -/
example : HasCubicResolvent (Fin 4 → ℤ) (Fin 3 → ℤ) := sorry

/-- Unit test `ArithmeticStatistics.QuarticRing.test_resolvent_disc_sign`: a based cubic resolvent
never has index form `+4·Det(Ax − By)` when `Disc(A, B) ≠ 0` and the pair is primitive: the sign is
forced. -/
example (Q C : Type*) [CommRing Q] [CommRing C] (bQ : Module.Basis (Fin 4) ℤ Q) (bC : Module.Basis (Fin 3) ℤ C)
    (P : TernaryQuadraticPair ℤ) (h : IsResolventPair bQ bC P) (hd : P.resolventForm ≠ 0) :
    CubicRing.indexForm bC ≠ P.resolventForm := sorry

/-- Unit test `ArithmeticStatistics.QuarticRing.test_ringContent_int_pi`: `ℤ⁴` has content `1`. -/
example : ringContent (Fin 4 → ℤ) = 1 := sorry

end QuarticRing

/-! ## ST.1/quartic-ring-of-a-pair -/

namespace TernaryQuadraticPair

variable {R : Type*} [CommRing R]

/-- The structure constants `c^k_ij` of `Q(A, B)` in its normal basis `⟨1, α₁, α₂, α₃⟩`
(`k = 0` the constant term, `k = 1, 2, 3` the coefficient of `α_k`), HCL III (21)–(23) with the
index condition of (23) corrected to `k ≠ i`; all are integral polynomials in the coefficients. -/
def structConst (P : TernaryQuadraticPair R) (i j : Fin 3) (k : Fin 4) : R :=
  let i' := min i j
  let j' := max i j
  match i', j', k with
  | 0, 0, 0 => -P.A.a11^2*P.B.a22*P.B.a33 + P.A.a11*P.A.a12*P.B.a12*P.B.a33 - P.A.a11*P.A.a12*P.B.a13*P.B.a23 + P.A.a11*P.A.a13*P.B.a13*P.B.a22 + P.A.a11*P.A.a22*P.B.a11*P.B.a33 - P.A.a11*P.A.a22*P.B.a13^2 + P.A.a11*P.A.a23*P.B.a12*P.B.a13 + P.A.a11*P.A.a33*P.B.a11*P.B.a22 - P.A.a11*P.A.a33*P.B.a12^2 - P.A.a12^2*P.B.a11*P.B.a33 + P.A.a12*P.A.a13*P.B.a11*P.B.a23 + P.A.a12*P.A.a33*P.B.a11*P.B.a12 - P.A.a13^2*P.B.a11*P.B.a22 + P.A.a13*P.A.a22*P.B.a11*P.B.a13 - P.A.a13*P.A.a23*P.B.a11*P.B.a12 - P.A.a22*P.A.a33*P.B.a11^2
  | 0, 0, 1 => -P.A.a11*P.B.a23 - P.A.a12*P.B.a13 + P.A.a13*P.B.a12 + P.A.a23*P.B.a11
  | 0, 0, 2 => P.A.a11*P.B.a13 - P.A.a13*P.B.a11
  | 0, 0, 3 => -P.A.a11*P.B.a12 + P.A.a12*P.B.a11
  | 0, 1, 0 => P.A.a11*P.A.a22*P.B.a12*P.B.a33 - P.A.a11*P.A.a22*P.B.a13*P.B.a23 + P.A.a11*P.A.a23*P.B.a13*P.B.a22 - P.A.a11*P.A.a33*P.B.a12*P.B.a22 - P.A.a12*P.A.a22*P.B.a11*P.B.a33 + P.A.a12*P.A.a33*P.B.a11*P.B.a22 + P.A.a13*P.A.a22*P.B.a11*P.B.a23 - P.A.a13*P.A.a23*P.B.a11*P.B.a22
  | 0, 1, 1 => 0
  | 0, 1, 2 => 0
  | 0, 1, 3 => -P.A.a11*P.B.a22 + P.A.a22*P.B.a11
  | 0, 2, 0 => -P.A.a11*P.A.a22*P.B.a13*P.B.a33 + P.A.a11*P.A.a23*P.B.a12*P.B.a33 - P.A.a11*P.A.a33*P.B.a12*P.B.a23 + P.A.a11*P.A.a33*P.B.a13*P.B.a22 - P.A.a12*P.A.a23*P.B.a11*P.B.a33 + P.A.a12*P.A.a33*P.B.a11*P.B.a23 + P.A.a13*P.A.a22*P.B.a11*P.B.a33 - P.A.a13*P.A.a33*P.B.a11*P.B.a22
  | 0, 2, 1 => 0
  | 0, 2, 2 => P.A.a11*P.B.a33 - P.A.a33*P.B.a11
  | 0, 2, 3 => -P.A.a11*P.B.a23 + P.A.a23*P.B.a11
  | 1, 1, 0 => P.A.a11*P.A.a22*P.B.a22*P.B.a33 - P.A.a11*P.A.a22*P.B.a23^2 + P.A.a11*P.A.a23*P.B.a22*P.B.a23 - P.A.a11*P.A.a33*P.B.a22^2 - P.A.a12*P.A.a22*P.B.a13*P.B.a23 + P.A.a12*P.A.a23*P.B.a13*P.B.a22 + P.A.a13*P.A.a22*P.B.a12*P.B.a23 - P.A.a13*P.A.a23*P.B.a12*P.B.a22 - P.A.a22^2*P.B.a11*P.B.a33 + P.A.a22*P.A.a23*P.B.a11*P.B.a23 + P.A.a22*P.A.a33*P.B.a11*P.B.a22 - P.A.a23^2*P.B.a11*P.B.a22
  | 1, 1, 1 => -P.A.a22*P.B.a23 + P.A.a23*P.B.a22
  | 1, 1, 2 => P.A.a12*P.B.a23 - P.A.a13*P.B.a22 + P.A.a22*P.B.a13 - P.A.a23*P.B.a12
  | 1, 1, 3 => -P.A.a12*P.B.a22 + P.A.a22*P.B.a12
  | 1, 2, 0 => -P.A.a11*P.A.a22*P.B.a23*P.B.a33 + P.A.a11*P.A.a23*P.B.a22*P.B.a33 - P.A.a12*P.A.a22*P.B.a13*P.B.a33 + P.A.a12*P.A.a33*P.B.a13*P.B.a22 + P.A.a13*P.A.a22*P.B.a12*P.B.a33 - P.A.a13*P.A.a33*P.B.a12*P.B.a22 + P.A.a22*P.A.a33*P.B.a11*P.B.a23 - P.A.a23*P.A.a33*P.B.a11*P.B.a22
  | 1, 2, 1 => -P.A.a22*P.B.a33 + P.A.a33*P.B.a22
  | 1, 2, 2 => P.A.a12*P.B.a33 - P.A.a33*P.B.a12
  | 1, 2, 3 => -P.A.a13*P.B.a22 + P.A.a22*P.B.a13
  | 2, 2, 0 => -P.A.a11*P.A.a22*P.B.a33^2 + P.A.a11*P.A.a33*P.B.a22*P.B.a33 - P.A.a12*P.A.a23*P.B.a13*P.B.a33 + P.A.a12*P.A.a33*P.B.a13*P.B.a23 + P.A.a13*P.A.a23*P.B.a12*P.B.a33 - P.A.a13*P.A.a33*P.B.a12*P.B.a23 + P.A.a22*P.A.a33*P.B.a11*P.B.a33 - P.A.a33^2*P.B.a11*P.B.a22
  | 2, 2, 1 => -P.A.a23*P.B.a33 + P.A.a33*P.B.a23
  | 2, 2, 2 => P.A.a13*P.B.a33 - P.A.a33*P.B.a13
  | 2, 2, 3 => P.A.a12*P.B.a33 - P.A.a13*P.B.a23 + P.A.a23*P.B.a13 - P.A.a33*P.B.a12
  | _, _, _ => 0

/-- The quartic ring `Q(A, B) = R[α₁, α₂, α₃] / (αᵢαⱼ − c⁰ᵢⱼ − Σ cᵏᵢⱼ αₖ)`. -/
noncomputable def quarticRingIdeal (P : TernaryQuadraticPair R) : Ideal (MvPolynomial (Fin 3) R) :=
  Ideal.span (Set.range fun ij : Fin 3 × Fin 3 =>
    MvPolynomial.X ij.1 * MvPolynomial.X ij.2 - (MvPolynomial.C (P.structConst ij.1 ij.2 0) +
      ∑ k : Fin 3, MvPolynomial.C (P.structConst ij.1 ij.2 k.succ) * MvPolynomial.X k))

/-- The quartic ring of a pair of ternary quadratic forms. -/
abbrev quarticRing (P : TernaryQuadraticPair R) : Type _ := MvPolynomial (Fin 3) R ⧸ P.quarticRingIdeal

/-- The normal basis `⟨1, α₁, α₂, α₃⟩` of `Q(A, B)`. -/
noncomputable def quarticBasis (P : TernaryQuadraticPair R) : Module.Basis (Fin 4) R P.quarticRing := sorry

theorem quarticBasis_zero (P : TernaryQuadraticPair R) : P.quarticBasis 0 = 1 := sorry

theorem mul_quarticBasis (P : TernaryQuadraticPair R) (i j : Fin 3) :
    P.quarticBasis i.succ * P.quarticBasis j.succ = algebraMap R _ (P.structConst i j 0) +
      ∑ k : Fin 3, P.structConst i j k.succ • P.quarticBasis k.succ := sorry

theorem structConst_normal (P : TernaryQuadraticPair R) :
    P.structConst 0 1 1 = 0 ∧ P.structConst 0 1 2 = 0 ∧ P.structConst 0 2 1 = 0 := sorry

theorem discr_quarticBasis (P : TernaryQuadraticPair R) : Algebra.discr R P.quarticBasis = P.disc :=
  sorry

/-- The cubic resolvent ring `R(A, B)`: the Delone–Faddeev ring of `−4·Det(Ax − By)`. -/
abbrev cubicResolventRing (P : TernaryQuadraticPair R) : Type _ := (-P.resolventForm).cubicRing

theorem isResolventPair_quarticRing (P : TernaryQuadraticPair ℤ) :
    QuarticRing.IsResolventPair P.quarticBasis (-P.resolventForm).basis P := sorry

/-- Unit test `ArithmeticStatistics.TernaryQuadraticPair.test_structConst_zero_pair`: the zero pair
gives the ring with all `αᵢαⱼ = 0`. -/
example (i j : Fin 3) (k : Fin 4) : (⟨⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0, 0, 0, 0⟩⟩ :
    TernaryQuadraticPair ℤ).structConst i j k = 0 := sorry

/-- Unit test `ArithmeticStatistics.TernaryQuadraticPair.test_quarticRing_disc`: the discriminant of
`Q(A, B)` for `A = x₁x₃ − x₂²`, `B = x₁² + x₂x₃` equals `Disc(A, B)`. -/
example : Algebra.discr ℤ (⟨⟨0, -1, 0, 0, 1, 0⟩, ⟨1, 0, 0, 0, 0, 1⟩⟩ : TernaryQuadraticPair ℤ).quarticBasis =
    (⟨⟨0, -1, 0, 0, 1, 0⟩, ⟨1, 0, 0, 0, 0, 1⟩⟩ : TernaryQuadraticPair ℤ).disc := sorry

/-- Unit test `ArithmeticStatistics.TernaryQuadraticPair.test_structConst_integral_c311`: the
coefficient `c¹₁₁ = λ^{13}_{12} + λ^{23}_{11}` (a `½`-free polynomial). -/
example (P : TernaryQuadraticPair ℤ) :
    P.structConst 0 0 1 = P.lam 0 2 0 1 + P.lam 1 2 0 0 := sorry

end TernaryQuadraticPair

/-! ## ST.1/bhargava-parametrization-of-quartic-rings -/

namespace QuarticRing

/-- HCL III, Theorem 1 and Proposition 13, in based form: every pair is the resolvent pair of a
based quartic ring and cubic resolvent, uniquely up to based isomorphism; the discriminants agree. -/
theorem exists_isResolventPair (P : TernaryQuadraticPair ℤ) :
    ∃ (Q C : Type) (_ : CommRing Q) (_ : CommRing C) (bQ : Module.Basis (Fin 4) ℤ Q) (bC : Module.Basis (Fin 3) ℤ C),
      IsResolventPair bQ bC P := sorry

theorem isResolventPair_unique {Q Q' C C' : Type*} [CommRing Q] [CommRing Q'] [CommRing C] [CommRing C']
    (bQ : Module.Basis (Fin 4) ℤ Q) (bC : Module.Basis (Fin 3) ℤ C) (bQ' : Module.Basis (Fin 4) ℤ Q') (bC' : Module.Basis (Fin 3) ℤ C')
    (P : TernaryQuadraticPair ℤ) (h : IsResolventPair bQ bC P) (h' : IsResolventPair bQ' bC' P) :
    ∃ (e : Q ≃+* Q') (e' : C ≃+* C'), (∀ i, e (bQ i) = bQ' i) ∧ ∀ i, e' (bC i) = bC' i := sorry

theorem isResolventPair_iff_smul {Q C : Type*} [CommRing Q] [CommRing C]
    (bQ : Module.Basis (Fin 4) ℤ Q) (bC : Module.Basis (Fin 3) ℤ C) (P P' : TernaryQuadraticPair ℤ)
    (h : IsResolventPair bQ bC P) :
    (∃ (bQ' : Module.Basis (Fin 4) ℤ Q) (bC' : Module.Basis (Fin 3) ℤ C), IsResolventPair bQ' bC' P') ↔
      ∃ g : GL (Fin 3) ℤ × GL (Fin 2) ℤ, g • P = P' := sorry

/-! ## ST.1/existence-and-number-of-cubic-resolvents -/

/-- HCL III, Corollaries 4 and 5: every quartic ring has a cubic resolvent; a primitive (in
particular a maximal) quartic ring has exactly one up to isomorphism. -/
theorem exists_hasCubicResolvent (Q : Type) [CommRing Q] [Module.Free ℤ Q] [Module.Finite ℤ Q]
    (h : Module.finrank ℤ Q = 4) : ∃ (C : Type) (_ : CommRing C), HasCubicResolvent Q C := sorry

theorem cubicResolvent_unique_of_content_eq_one (Q C C' : Type) [CommRing Q] [CommRing C]
    [CommRing C'] (hQ : ringContent Q = 1) (h : HasCubicResolvent Q C) (h' : HasCubicResolvent Q C') :
    Nonempty (C ≃+* C') := sorry

/-! ## ST.1/maximality-of-quartic-rings-at-p -/

/-- HCL III, Lemma 22 with conditions (i)–(iii): a nonmaximal `Q(A, B)` has, after a
`GL₃(ℤ) × GL₂(ℤ)` change of basis, an overring of the three listed shapes, i.e. `(A, B)` satisfies
the corresponding `λ`-congruences. -/
theorem exists_smul_of_not_isMaximalAt {p : ℕ} (hp : p.Prime) (P : TernaryQuadraticPair ℤ)
    (h : ¬ CubicRing.IsMaximalAt p P.quarticRing) :
    ∃ g : GL (Fin 3) ℤ × GL (Fin 2) ℤ,
      ((∀ i j k l, (p : ℤ) ∣ (g • P).lam i j k l)) ∨
      ((p : ℤ) ∣ (g • P).lam 0 0 1 1 ∧ (p : ℤ) ∣ (g • P).lam 0 0 1 2 ∧ (p : ℤ) ∣ (g • P).lam 0 0 2 2 ∧
        (p : ℤ) ∣ (g • P).lam 0 1 0 2 ∧ (p : ℤ) ^ 2 ∣ (g • P).lam 0 0 0 1 ∧
        (p : ℤ) ^ 2 ∣ (g • P).lam 0 0 0 2) ∨
      ((p : ℤ) ∣ (g • P).lam 0 0 0 2 ∧ (p : ℤ) ∣ (g • P).lam 0 0 1 2 ∧ (p : ℤ) ∣ (g • P).lam 0 1 0 2 ∧
        (p : ℤ) ∣ (g • P).lam 0 1 1 2 ∧ (p : ℤ) ∣ (g • P).lam 0 2 1 1 ∧ (p : ℤ) ∣ (g • P).lam 1 1 1 2 ∧
        (p : ℤ) ^ 2 ∣ (g • P).lam 0 0 0 1 ∧ (p : ℤ) ^ 2 ∣ (g • P).lam 0 0 1 1 ∧
        (p : ℤ) ^ 2 ∣ (g • P).lam 0 1 1 1) := sorry

/-! ## ST.1/splitting-types-of-pairs-of-ternary-quadratic-forms -/

/-- HCL III (36)–(37), in the case where `A ≢ 0` and `B ≢ 0` meet in four distinct points over
`𝔽̄_p` (nonzero discriminant mod `p`): `Q(A, B)/p` is étale over `𝔽_p`. -/
theorem etale_quarticRing_mod_p {p : ℕ} [Fact p.Prime] (P : TernaryQuadraticPair ℤ)
    (h : ((P.disc : ℤ) : ZMod p) ≠ 0) :
    Algebra.Etale (ZMod p) (TernaryQuadraticPair.quarticRing
      (⟨⟨P.A.a11, P.A.a22, P.A.a33, P.A.a12, P.A.a13, P.A.a23⟩,
        ⟨P.B.a11, P.B.a22, P.B.a33, P.B.a12, P.B.a13, P.B.a23⟩⟩ : TernaryQuadraticPair (ZMod p))) := sorry

end QuarticRing

/-! ## ST.1/quadruples-of-quinary-alternating-forms -/

/-- A quadruple of alternating `5 × 5` matrices, an element of `R⁴ ⊗ ∧² R⁵`, recorded by the entries
above the diagonal. -/
@[ext] structure QuinaryAlternatingQuadruple (R : Type*) where
  coeff : Fin 4 → {p : Fin 5 × Fin 5 // p.1 < p.2} → R

namespace QuinaryAlternatingQuadruple

variable {R : Type*} [CommRing R]

/-- The `r`-th alternating matrix. -/
def toMatrix (A : QuinaryAlternatingQuadruple R) (r : Fin 4) : Matrix (Fin 5) (Fin 5) R :=
  fun i j => if h : i < j then A.coeff r ⟨(i, j), h⟩ else if h' : j < i then -A.coeff r ⟨(j, i), h'⟩ else 0

/-- The quadruple with given alternating matrices (entries below the diagonal are ignored). -/
def ofMatrices (M : Fin 4 → Matrix (Fin 5) (Fin 5) R) : QuinaryAlternatingQuadruple R :=
  ⟨fun r p => M r p.1.1 p.1.2⟩

/-- The action of `GL₄ × SL₅`: `(g₄, g₅) · A = (Σₛ (g₄)ᵣₛ g₅ Aₛ g₅ᵀ)ᵣ`. -/
instance instMulAction : MulAction (GL (Fin 4) R × SL(5, R)) (QuinaryAlternatingQuadruple R) where
  smul g A := ofMatrices fun r =>
    ∑ s, (g.1 : Matrix (Fin 4) (Fin 4) R) r s • ((g.2 : Matrix (Fin 5) (Fin 5) R) * A.toMatrix s *
      (g.2 : Matrix (Fin 5) (Fin 5) R).transpose)
  one_smul := sorry
  mul_smul := sorry

/-- The Pfaffian `x₁₂x₃₄ − x₁₃x₂₄ + x₁₄x₂₃` of the `4 × 4` principal submatrix omitting `i`, with
the sign `(−1)^i`: the `i`-th entry of the sub-Pfaffian vector `Q(X)` of HCL IV. -/
def subPfaffian (X : Matrix (Fin 5) (Fin 5) R) (i : Fin 5) : R :=
  let idx : Fin 4 → Fin 5 := fun k => i.succAbove k
  (-1) ^ (i : ℕ) * (X (idx 0) (idx 1) * X (idx 2) (idx 3) - X (idx 0) (idx 2) * X (idx 1) (idx 3) +
    X (idx 0) (idx 3) * X (idx 1) (idx 2))

theorem toMatrix_transpose (A : QuinaryAlternatingQuadruple R) (r : Fin 4) :
    (A.toMatrix r).transpose = -A.toMatrix r := sorry

theorem subPfaffian_smul_scalar (X : Matrix (Fin 5) (Fin 5) R) (c : R) (i : Fin 5) :
    subPfaffian (c • X) i = c ^ 2 * subPfaffian X i := sorry

theorem mulVec_subPfaffian (A : QuinaryAlternatingQuadruple R) (r : Fin 4) :
    (A.toMatrix r).mulVec (subPfaffian (A.toMatrix r)) = 0 := sorry

/-- Unit test `ArithmeticStatistics.QuinaryAlternatingQuadruple.test_toMatrix_diag`: the diagonal
vanishes. -/
example (A : QuinaryAlternatingQuadruple ℤ) (r : Fin 4) (i : Fin 5) : A.toMatrix r i i = 0 := sorry

/-- Unit test `ArithmeticStatistics.QuinaryAlternatingQuadruple.test_ofMatrices_toMatrix`: reading off
the upper triangle of `toMatrix` recovers the quadruple. -/
example (A : QuinaryAlternatingQuadruple ℤ) : ofMatrices A.toMatrix = A := sorry

/-- Unit test `ArithmeticStatistics.QuinaryAlternatingQuadruple.test_subPfaffian_standard`: for the
matrix with `x₁₂ = x₃₄ = 1` (0-indexed entries `(1, 2)` and `(3, 4)`) and all other upper entries `0`,
the sub-Pfaffian vector is `(1, 0, 0, 0, 0)`. -/
example : subPfaffian (!![0, 0, 0, 0, 0; 0, 0, 1, 0, 0; 0, -1, 0, 0, 0; 0, 0, 0, 0, 1; 0, 0, 0, -1, 0] :
    Matrix (Fin 5) (Fin 5) ℤ) = ![1, 0, 0, 0, 0] := sorry

end QuinaryAlternatingQuadruple

/-! ## ST.1/bhargava-parametrization-of-quintic-rings

## ST.1/maximality-of-quintic-rings-at-p

HCL IV, Theorems 1, 8 and 17 and Corollaries 18–19 (the parametrization of quintic rings and the
existence and uniqueness of sextic resolvents), and Theorem 21 (the maximality criterion), are not
stated in this file: their statements need the multiplication tables of the quintic ring `R(A)` and
of the sextic ring `S(A)` (HCL IV, Sections 4 and 6), which the roadmap specifies in prose and which
are not written out here. The file omits them rather than stating an empty condition. -/

/-! ## ST.1/pgl2-orbits-and-stabilizers-of-binary-quartic-forms -/

namespace BinaryQuartic

variable {R : Type*} [CommRing R]

/-- The action of `PGL₂(R)` on binary quartic forms induced by ST.0's twisted action
`γ ⋆ f = (det γ)⁻² f((x, y)·γ)`, on which the centre acts trivially. -/
noncomputable instance instPGLAction : MulAction PGL(2, R) (BinaryQuartic R) where
  smul g f := twistedSMul (Function.surjInv Matrix.ProjGenLinGroup.mk_surjective g) f
  one_smul := sorry
  mul_smul := sorry

theorem pgl_smul_mk (γ : GL (Fin 2) R) (f : BinaryQuartic R) :
    Matrix.ProjGenLinGroup.mk γ • f = twistedSMul γ f := sorry

theorem invI_pgl_smul (g : PGL(2, R)) (f : BinaryQuartic R) : invI (g • f) = invI f := sorry

theorem invJ_pgl_smul (g : PGL(2, R)) (f : BinaryQuartic R) : invJ (g • f) = invJ f := sorry

/-- The orbit space `PGL₂(R) \ V(R)`. -/
abbrev PGLOrbit (R : Type*) [CommRing R] : Type _ := MulAction.orbitRel.Quotient PGL(2, R) (BinaryQuartic R)

namespace PGLOrbit

/-- The invariants of an orbit. -/
noncomputable def invariants (o : PGLOrbit R) : R × R :=
  Quotient.liftOn' o (fun f => (invI f, invJ f)) sorry

end PGLOrbit

theorem pgl_orbits_eq_gl_orbits_int (f g : BinaryQuartic ℤ) :
    (∃ γ : PGL(2, ℤ), γ • f = g) ↔ ∃ γ : GL (Fin 2) ℤ, γ • f = g := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_pgl_scalar_trivial`: scalars act trivially. -/
example (u : ℚˣ) (f : BinaryQuartic ℚ) :
    Matrix.ProjGenLinGroup.mk (Matrix.GeneralLinearGroup.scalar (Fin 2) u) • f = f := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_pgl_diag`: `diag(2, 1)` sends
`(a, b, c, d, e)` to `(4a, 2b, c, d/2, e/4)`. -/
example (f : BinaryQuartic ℚ) :
    Matrix.ProjGenLinGroup.mk (Matrix.GeneralLinearGroup.mkOfDetNeZero (!![2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) (by simp)) • f =
      ⟨4 * f.a, 2 * f.b, f.c, f.d / 2, f.e / 4⟩ := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_neg_not_equivalent`: `x³y − y⁴` (with `J = 27`)
is not `PGL₂(ℚ)`-equivalent to its negative (with `J = −27`). -/
example : ¬ ∃ g : PGL(2, ℚ), g • (⟨0, 1, 0, 0, -1⟩ : BinaryQuartic ℚ) = ⟨0, -1, 0, 0, 1⟩ := sorry

end BinaryQuartic

/-! ## ST.1/soluble-binary-quartic-forms -/

namespace BinaryQuartic

/-- `f` is `K`-soluble if `z² = f(x, y)` has a solution with `(x, y) ≠ (0, 0)`. -/
def IsSoluble {K : Type*} [Field K] (f : BinaryQuartic K) : Prop :=
  ∃ x y z : K, (x, y) ≠ (0, 0) ∧ z ^ 2 = f.eval x y

open NumberField IsDedekindDomain in
/-- Everywhere local solubility over a number field: soluble over every completion. -/
def IsEverywhereLocallySoluble {K : Type*} [Field K] [NumberField K] (f : BinaryQuartic K) : Prop :=
  (∀ v : HeightOneSpectrum (𝓞 K), (f.map (algebraMap K (v.adicCompletion K))).IsSoluble) ∧
    ∀ w : InfinitePlace K, (f.map (algebraMap K w.Completion)).IsSoluble

/-- Over `ℚ`: `ℝ`-soluble and `ℚ_p`-soluble for every prime `p`. -/
def IsLocallySolubleQ (f : BinaryQuartic ℚ) : Prop :=
  (f.map (algebraMap ℚ ℝ)).IsSoluble ∧ ∀ (p : ℕ) [Fact p.Prime], (f.map (algebraMap ℚ ℚ_[p])).IsSoluble

/-- An integral form is locally soluble: its rational form is `ℝ`- and `ℚ_p`-soluble for all `p`. -/
def IsLocallySoluble (f : BinaryQuartic ℤ) : Prop := (f.map (Int.castRingHom ℚ)).IsLocallySolubleQ

/-- An integral form has a rational linear factor: a zero in `ℙ¹(ℚ)`. -/
def HasRationalLinearFactor (f : BinaryQuartic ℤ) : Prop :=
  ∃ x y : ℚ, (x, y) ≠ (0, 0) ∧ (f.map (Int.castRingHom ℚ)).eval x y = 0

/-- An integral form is irreducible over `ℚ` (in particular `a ≠ 0`). -/
def IsIrreducibleOverQ (f : BinaryQuartic ℤ) : Prop :=
  f.a ≠ 0 ∧ Irreducible (f.map (Int.castRingHom ℚ)).dehomogenize

theorem isLocallySoluble_iff (f : BinaryQuartic ℤ) :
    f.IsLocallySoluble ↔ (f.map (Int.castRingHom ℝ)).IsSoluble ∧
      ∀ p : Nat.Primes, (f.map (Int.castRingHom ℚ_[p])).IsSoluble := sorry

theorem isSoluble_pgl_smul {K : Type*} [Field K] (g : PGL(2, K)) (f : BinaryQuartic K) :
    (g • f).IsSoluble ↔ f.IsSoluble := sorry

namespace IsSoluble

theorem map {K L : Type*} [Field K] [Field L] (φ : K →+* L) {f : BinaryQuartic K}
    (h : f.IsSoluble) : (f.map φ).IsSoluble := sorry

end IsSoluble

theorem isSoluble_of_eval_eq_zero {K : Type*} [Field K] {f : BinaryQuartic K} {x y : K}
    (hxy : (x, y) ≠ (0, 0)) (h : f.eval x y = 0) : f.IsSoluble := sorry

theorem isSoluble_of_isSquare_a {K : Type*} [Field K] {f : BinaryQuartic K} (h : IsSquare f.a) :
    f.IsSoluble := sorry

theorem isLocallySolubleQ_iff (f : BinaryQuartic ℚ) :
    f.IsLocallySolubleQ ↔ (f.map (algebraMap ℚ ℝ)).IsSoluble ∧
      ∀ (p : ℕ) [Fact p.Prime], (f.map (algebraMap ℚ ℚ_[p])).IsSoluble := Iff.rfl

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_negative_definite_insoluble`: `−x⁴ − y⁴` is not
`ℝ`-soluble. -/
example : ¬ (⟨-1, 0, 0, 0, -1⟩ : BinaryQuartic ℝ).IsSoluble := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_linear_factor_soluble`: `x³y + y⁴` is
`ℚ`-soluble (it vanishes at `(1, 0)`). -/
example : (⟨0, 1, 0, 0, 1⟩ : BinaryQuartic ℚ).IsSoluble := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_hasRationalLinearFactor`: `x³y + y⁴` has the
rational linear factor `y` and is locally soluble. -/
example : (⟨0, 1, 0, 0, 1⟩ : BinaryQuartic ℤ).HasRationalLinearFactor ∧
    (⟨0, 1, 0, 0, 1⟩ : BinaryQuartic ℤ).IsLocallySoluble := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_locally_not_globally`: Lind's quartic
`2x⁴ − 34y⁴` (`z² = 2x⁴ − 34y⁴`) is locally soluble over `ℚ` but not `ℚ`-soluble. -/
example : (⟨2, 0, 0, 0, -34⟩ : BinaryQuartic ℚ).IsLocallySolubleQ ∧
    ¬ (⟨2, 0, 0, 0, -34⟩ : BinaryQuartic ℚ).IsSoluble := sorry

end BinaryQuartic

/-! ## ST.1/covariants-of-a-binary-quartic -/

namespace BinaryQuartic

variable {R : Type*} [CommRing R]

/-- The quartic (Hessian) covariant `g₄`, Cremona–Fisher §1. -/
def hessian (g : BinaryQuartic R) : BinaryQuartic R :=
  ⟨3 * g.b ^ 2 - 8 * g.a * g.c, 4 * (g.b * g.c - 6 * g.a * g.d), 2 * (2 * g.c ^ 2 - 24 * g.a * g.e - 3 * g.b * g.d),
    4 * (g.c * g.d - 6 * g.b * g.e), 3 * g.d ^ 2 - 8 * g.c * g.e⟩

/-- The sextic covariant `g₆`, as its seven coefficients of `X⁶, X⁵Y, …, Y⁶`. -/
def sexticCoeff (g : BinaryQuartic R) : Fin 7 → R :=
  ![g.b ^ 3 + 8 * g.a ^ 2 * g.d - 4 * g.a * g.b * g.c,
    2 * (16 * g.a ^ 2 * g.e + 2 * g.a * g.b * g.d - 4 * g.a * g.c ^ 2 + g.b ^ 2 * g.c),
    5 * (8 * g.a * g.b * g.e + g.b ^ 2 * g.d - 4 * g.a * g.c * g.d),
    20 * (g.b ^ 2 * g.e - g.a * g.d ^ 2),
    -5 * (8 * g.a * g.d * g.e + g.b * g.d ^ 2 - 4 * g.b * g.c * g.e),
    -2 * (16 * g.a * g.e ^ 2 + 2 * g.b * g.d * g.e - 4 * g.c ^ 2 * g.e + g.c * g.d ^ 2),
    -(g.d ^ 3 + 8 * g.b * g.e ^ 2 - 4 * g.c * g.d * g.e)]

/-- Evaluation of the sextic covariant. -/
def sextic (g : BinaryQuartic R) (x y : R) : R :=
  ∑ i : Fin 7, g.sexticCoeff i * x ^ (6 - (i : ℕ)) * y ^ (i : ℕ)

theorem hessian_twistedSMul (γ : GL (Fin 2) R) (g : BinaryQuartic R) :
    hessian (twistedSMul γ g) = twistedSMul γ (hessian g) := sorry

theorem sextic_twistedSMul (γ : GL (Fin 2) R) (g : BinaryQuartic R) (x y : R) :
    (twistedSMul γ g).sextic x y = (((Matrix.GeneralLinearGroup.det γ)⁻¹ : Rˣ) : R) ^ 3 *
      g.sextic ((γ : Matrix (Fin 2) (Fin 2) R) 0 0 * x + (γ : Matrix (Fin 2) (Fin 2) R) 1 0 * y)
        ((γ : Matrix (Fin 2) (Fin 2) R) 0 1 * x + (γ : Matrix (Fin 2) (Fin 2) R) 1 1 * y) := sorry

theorem hessian_eq_neg_third_hessianDet (g : BinaryQuartic ℚ) (x y : ℚ) :
    (hessian g).eval x y = -(1 / 3) * ((12 * g.a * x ^ 2 + 6 * g.b * x * y + 2 * g.c * y ^ 2) *
      (2 * g.c * x ^ 2 + 6 * g.d * x * y + 12 * g.e * y ^ 2) -
        (3 * g.b * x ^ 2 + 4 * g.c * x * y + 3 * g.d * y ^ 2) ^ 2) := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_hessian_x3y`: the Hessian covariant of `x³y`
is `3x⁴`. -/
example : hessian (⟨0, 1, 0, 0, 0⟩ : BinaryQuartic ℤ) = ⟨3, 0, 0, 0, 0⟩ := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_sextic_x3y`: the sextic covariant of `x³y`
is `x⁶`. -/
example : (⟨0, 1, 0, 0, 0⟩ : BinaryQuartic ℤ).sexticCoeff = ![1, 0, 0, 0, 0, 0, 0] := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_hessian_resultant`: at a root of `g` the
Hessian covariant does not vanish when `Δ ≠ 0`: for `x⁴ − y⁴` at `(1, 1)`, `g₄ = 48`. -/
example : (hessian (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℤ)).eval 1 1 = 48 := sorry

end BinaryQuartic

/-! ## ST.1/syzygy-of-binary-quartic-covariants -/

theorem BinaryQuartic.syzygy {R : Type*} [CommRing R] (g : BinaryQuartic R) (x y : R) :
    27 * g.sextic x y ^ 2 = (g.hessian.eval x y) ^ 3 - 48 * invI g * (g.eval x y) ^ 2 * g.hessian.eval x y -
      64 * invJ g * (g.eval x y) ^ 3 := sorry

/-! ## ST.1/cubic-invariant-of-a-binary-quartic -/

namespace BinaryQuartic

variable {K : Type*} [Field K]

/-- The curve `E_{I,J} : y² = x³ − 27 I x − 27 J` (the Jacobian of `z² = g(x, y)`, Cremona–Fisher §6). -/
def curveIJ (I J : K) : WeierstrassCurve K := ⟨0, 0, 0, -27 * I, -27 * J⟩

/-- The étale algebra `K[T]/(T³ − 27 I T − 27 J)`, spelled as Tau Ceti's `(curveIJ I J).toAffine.A`. -/
abbrev etaleAlgebra (I J : K) : Type _ :=
  AdjoinRoot (X ^ 3 + C (curveIJ I J).a₂ * X ^ 2 + C (curveIJ I J).a₄ * X + C (curveIJ I J).a₆)

/-- Its square classes, spelled as Tau Ceti's `(curveIJ I J).toAffine.M`. -/
abbrev squareClasses (I J : K) : Type _ :=
  (etaleAlgebra I J)ˣ ⧸ (powMonoidHom 2 : (etaleAlgebra I J)ˣ →* (etaleAlgebra I J)ˣ).range

/-- The cubic `T³ − 27 I T − 27 J` defining `etaleAlgebra I J`. -/
noncomputable def curvePoly (I J : K) : K[X] :=
  X ^ 3 + C (curveIJ I J).a₂ * X ^ 2 + C (curveIJ I J).a₄ * X + C (curveIJ I J).a₆

/-- The restriction of square classes along a field homomorphism (Tau Ceti's `localRes`). -/
noncomputable def restrictSquareClasses {L : Type*} [Field L] (φ : K →+* L) (I J : K) :
    squareClasses I J →* squareClasses (φ I) (φ J) :=
  QuotientGroup.map _ _ (Units.map (AdjoinRoot.map φ (curvePoly I J) (curvePoly (φ I) (φ J)) sorry).toMonoidHom)
    sorry

/-- The irrational covariant `G(x, y) = (4φ g(x, y) + g₄(x, y))/3` with `φ = −T/3`. -/
noncomputable def irrationalCovariant (g : BinaryQuartic K) (I J : K) (x y : K) : etaleAlgebra I J :=
  AdjoinRoot.mk _ (C ((hessian g).eval x y / 3) - C (4 * g.eval x y / 9) * X)

/-- The cubic invariant `z(g)`, the class of `G(x, y)` at any point where `g₆(x, y) ≠ 0`
(Cremona–Fisher, Proposition 2); `1` if there is no such point. -/
noncomputable def cubicInvariant (I J : K) (g : BinaryQuartic K) : squareClasses I J := by
  classical
  exact if h : ∃ p : K × K, g.sextic p.1 p.2 ≠ 0 then
    QuotientGroup.mk (IsUnit.unit (sorry : IsUnit (irrationalCovariant g I J h.choose.1 h.choose.2)))
  else 1

theorem cubicInvariant_eq_mk (I J : K) (g : BinaryQuartic K) (hg : invI g = I ∧ invJ g = J)
    (x y : K) (h : g.sextic x y ≠ 0) (hu : IsUnit (irrationalCovariant g I J x y)) :
    cubicInvariant I J g = QuotientGroup.mk hu.unit := sorry

theorem isUnit_irrationalCovariant (I J : K) (g : BinaryQuartic K) (hg : invI g = I ∧ invJ g = J)
    (x y : K) (h : g.sextic x y ≠ 0) : IsUnit (irrationalCovariant g I J x y) := sorry

theorem norm_irrationalCovariant (I J : K) (g : BinaryQuartic K) (hg : invI g = I ∧ invJ g = J) (x y : K) :
    Algebra.norm K (irrationalCovariant g I J x y) = g.sextic x y ^ 2 := sorry

theorem exists_sextic_ne_zero (g : BinaryQuartic K) (hK2 : (2 : K) ≠ 0) (hK3 : (3 : K) ≠ 0)
    (hK5 : Nat.card K ≠ 5) (hd : disc g ≠ 0) : ∃ x y : K, g.sextic x y ≠ 0 := sorry

theorem cubicInvariant_map {L : Type*} [Field L] (φ : K →+* L) (I J : K) (g : BinaryQuartic K)
    (hg : invI g = I ∧ invJ g = J) :
    restrictSquareClasses φ I J (cubicInvariant I J g) = cubicInvariant (φ I) (φ J) (g.map φ) := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_cubicInvariant_x3y`: for `x³y − xy³` (invariants
`I = 3`, `J = 0`, `4I³ − J² ≠ 0`, a linear factor at `(1, 0)`) the cubic invariant is trivial. -/
example : cubicInvariant (3 : ℚ) 0 ⟨0, 1, 0, -1, 0⟩ = 1 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_irrationalCovariant_leading`: at `(1, 0)` the
irrational covariant is `(4aφ + 3b² − 8ac)/3` with `φ = −T/3`. -/
example (g : BinaryQuartic ℚ) (I J : ℚ) :
    irrationalCovariant g I J 1 0 = AdjoinRoot.mk _ (C ((3 * g.b ^ 2 - 8 * g.a * g.c) / 3) - C (4 * g.a / 9) * X) :=
  sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_norm_square`: the norm of `G(x, y)` is the square
`g₆(x, y)²`, never a nonsquare: for `x⁴ − y⁴` at `(1, 2)`. -/
example : Algebra.norm ℚ (irrationalCovariant (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℚ) (-12) 0 1 2) =
    (⟨1, 0, 0, 0, -1⟩ : BinaryQuartic ℚ).sextic 1 2 ^ 2 := sorry

end BinaryQuartic

/-! ## ST.1/cubic-invariant-is-an-orbit-invariant -/

theorem BinaryQuartic.cubicInvariant_pgl_smul {K : Type*} [Field K] (I J : K) (γ : PGL(2, K))
    (g : BinaryQuartic K) (hg : invI g = I ∧ invJ g = J) :
    BinaryQuartic.cubicInvariant I J (γ • g) = BinaryQuartic.cubicInvariant I J g := sorry

/-! ## ST.1/linear-factor-forms -/

namespace BinaryQuartic

variable {K : Type*} [Field K]

/-- The normal form `(1/27) Y (27 X³ − 9 I X Y² − J Y³)` of a form with a linear factor. -/
noncomputable def linearFactorForm (I J : K) : BinaryQuartic K := ⟨0, 1, 0, -I / 3, -J / 27⟩

/-- Cremona–Fisher, Lemma 3 and Proposition 8. -/
theorem cubicInvariant_eq_one_iff (hK : (6 : K) ≠ 0) (I J : K) (g : BinaryQuartic K)
    (hg : invI g = I ∧ invJ g = J) (hd : disc g ≠ 0) :
    cubicInvariant I J g = 1 ↔ ∃ x y : K, (x, y) ≠ (0, 0) ∧ g.eval x y = 0 := sorry

/-- Cremona–Fisher, Proposition 7. -/
theorem exists_pgl_smul_linearFactorForm (hK : (6 : K) ≠ 0) (I J : K) (g : BinaryQuartic K)
    (hg : invI g = I ∧ invJ g = J) {x y : K} (hxy : (x, y) ≠ (0, 0)) (h0 : g.eval x y = 0) :
    ∃ γ : PGL(2, K), γ • g = linearFactorForm I J := sorry

end BinaryQuartic

/-! ## ST.1/auxiliary-quartic-root-from-equal-cubic-invariants -/

/-- Cremona–Fisher, Lemma 9: with `r = g₆(1, 0)`, equal cubic invariants give a root of the quartic
`g̃ = p₁ g₂ − a₁ h₂` (here `h₂` the Hessian of `g₂`). -/
theorem BinaryQuartic.exists_root_of_cubicInvariant_eq {K : Type*} [Field K] (hK : (6 : K) ≠ 0)
    (I J : K) (g₁ g₂ : BinaryQuartic K) (h₁ : invI g₁ = I ∧ invJ g₁ = J) (h₂ : invI g₂ = I ∧ invJ g₂ = J)
    (hr₁ : g₁.sextic 1 0 ≠ 0) (hr₂ : g₂.sextic 1 0 ≠ 0)
    (hz : BinaryQuartic.cubicInvariant I J g₁ = BinaryQuartic.cubicInvariant I J g₂) :
    ∃ x y : K, (x, y) ≠ (0, 0) ∧
      ((3 * g₁.b ^ 2 - 8 * g₁.a * g₁.c) * g₂.eval x y - g₁.a * (BinaryQuartic.hessian g₂).eval x y) = 0 := sorry

/-! ## ST.1/linear-factor-of-the-comparison-quartic-gives-equivalence -/

/-- Cremona–Fisher, Lemma 10. -/
theorem BinaryQuartic.exists_pgl_smul_of_comparison_root {K : Type*} [Field K] (hK : (6 : K) ≠ 0)
    (I J : K) (g₁ g₂ : BinaryQuartic K) (h₁ : invI g₁ = I ∧ invJ g₁ = J) (h₂ : invI g₂ = I ∧ invJ g₂ = J)
    (hr₁ : g₁.sextic 1 0 ≠ 0) {x y : K} (hxy : (x, y) ≠ (0, 0))
    (h : (3 * g₁.b ^ 2 - 8 * g₁.a * g₁.c) * g₂.eval x y - g₁.a * (BinaryQuartic.hessian g₂).eval x y = 0) :
    ∃ γ : PGL(2, K), γ • g₁ = g₂ := sorry

/-! ## ST.1/cubic-invariant-determines-the-orbit -/

/-- Cremona–Fisher, Theorem 11. -/
theorem BinaryQuartic.cubicInvariant_eq_iff {K : Type*} [Field K] (hK : (6 : K) ≠ 0) (hK5 : Nat.card K ≠ 5)
    (I J : K) (hIJ : 4 * I ^ 3 - J ^ 2 ≠ 0) (g₁ g₂ : BinaryQuartic K) (h₁ : invI g₁ = I ∧ invJ g₁ = J)
    (h₂ : invI g₂ = I ∧ invJ g₂ = J) :
    BinaryQuartic.cubicInvariant I J g₁ = BinaryQuartic.cubicInvariant I J g₂ ↔ ∃ γ : PGL(2, K), γ • g₁ = g₂ :=
  sorry

/-! ## ST.1/quartic-of-a-point -/

namespace BinaryQuartic

variable {K : Type*} [Field K]

/-- The quartic of a point, Cremona–Fisher §6: `O ↦` the linear-factor form, and `(ξ, η) ↦`
`X⁴ − (ξ/6) X²Y² − (η/27) XY³ + ((36 I − ξ²)/432) Y⁴`. -/
noncomputable def quarticOfPoint (I J : K) : (curveIJ I J).toAffine.Point → BinaryQuartic K
  | .zero => linearFactorForm I J
  | .some ξ η _ => ⟨1, 0, -ξ / 6, -η / 27, (36 * I - ξ ^ 2) / 432⟩

theorem invI_quarticOfPoint (hK : (6 : K) ≠ 0) (I J : K) (P : (curveIJ I J).toAffine.Point) :
    invI (quarticOfPoint I J P) = I := sorry

theorem invJ_quarticOfPoint (hK : (6 : K) ≠ 0) (I J : K) (P : (curveIJ I J).toAffine.Point) :
    invJ (quarticOfPoint I J P) = J := sorry

theorem isSoluble_quarticOfPoint (I J : K) (P : (curveIJ I J).toAffine.Point) :
    (quarticOfPoint I J P).IsSoluble := sorry

theorem quarticOfPoint_neg (hK : (6 : K) ≠ 0) (I J : K) (P : (curveIJ I J).toAffine.Point) :
    ∃ γ : PGL(2, K), γ • quarticOfPoint I J (-P) = quarticOfPoint I J P := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_quarticOfPoint_zero`: `q(O)` has the linear
factor `y`. -/
example (I J : ℚ) : (quarticOfPoint I J 0).eval 1 0 = 0 := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_quarticOfPoint_invariants`: on `y² = x³ − 27x`
(`I = 1`, `J = 0`) the `2`-torsion point `(0, 0)` gives `X⁴ + Y⁴/12`, which has `I = 1`, `J = 0`. -/
example (h : (curveIJ (1 : ℚ) 0).toAffine.Nonsingular 0 0) :
    quarticOfPoint (1 : ℚ) 0 (.some 0 0 h) = ⟨1, 0, 0, 0, 1 / 12⟩ := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_quarticOfPoint_leading_square`: the leading
coefficient of `q(P)` at an affine point is `1`, a square, so `q(P)` is soluble. -/
example (I J ξ η : ℚ) (h : (curveIJ I J).toAffine.Nonsingular ξ η) :
    (quarticOfPoint I J (.some ξ η h)).a = 1 := sorry

end BinaryQuartic

/-! ## ST.1/cubic-invariant-of-the-quartic-of-a-point -/

/-- Cremona–Fisher, Theorem 13(1): `z(q(P))` is the class of `ξ − T` (the value of Tau Ceti's
`WeierstrassCurve.Affine.μ` at `P`; at a `2`-torsion point, of the corrected representative). -/
theorem BinaryQuartic.cubicInvariant_quarticOfPoint {K : Type*} [Field K] (hK : (6 : K) ≠ 0) (I J ξ η : K)
    (h : (BinaryQuartic.curveIJ I J).toAffine.Nonsingular ξ η) (hη : η ≠ 0) :
    ∃ u : (BinaryQuartic.etaleAlgebra I J)ˣ, (u : BinaryQuartic.etaleAlgebra I J) = AdjoinRoot.mk _ (C ξ - X) ∧
      BinaryQuartic.cubicInvariant I J (BinaryQuartic.quarticOfPoint I J (.some ξ η h)) = QuotientGroup.mk u :=
  sorry

/-! ## ST.1/binary-quartic-parametrization-of-e-mod-2e -/

namespace BinaryQuartic

variable {K : Type*} [Field K] [DecidableEq K]

/-- Bhargava–Shankar, Theorem 3.2 (first paragraph): `P ↦ PGL₂(K)·q(P)` induces a bijection from
`E(K)/2E(K)` to the orbits of `K`-soluble forms with invariants `I, J`; injectivity. -/
theorem quarticOfPoint_orbit_eq_iff (hK : (6 : K) ≠ 0) (I J : K) (hIJ : 4 * I ^ 3 - J ^ 2 ≠ 0)
    (P Q : (curveIJ I J).toAffine.Point) :
    (∃ γ : PGL(2, K), γ • quarticOfPoint I J P = quarticOfPoint I J Q) ↔ ∃ R, P - Q = 2 • R := sorry

/-- Surjectivity onto soluble orbits. -/
theorem exists_quarticOfPoint_of_isSoluble (hK : (6 : K) ≠ 0) (I J : K) (hIJ : 4 * I ^ 3 - J ^ 2 ≠ 0)
    (g : BinaryQuartic K) (hg : invI g = I ∧ invJ g = J) (hs : g.IsSoluble) :
    ∃ (P : (curveIJ I J).toAffine.Point) (γ : PGL(2, K)), γ • quarticOfPoint I J P = g := sorry

end BinaryQuartic

/-! ## ST.1/bilinear-factor-criterion-for-proper-equivalence -/

/-- Cremona–Fisher, Theorem 12: `PGL₂(K)`-equivalences `g₁ → g₂` correspond to the `K`-rational
bilinear factors `(x₁, y₁) A (x₂, y₂)ᵀ` of `g₁(x₁, y₁) h₂(x₂, y₂) − g₂(x₂, y₂) h₁(x₁, y₁)`. -/
theorem BinaryQuartic.exists_pgl_smul_iff_bilinear_factor {K : Type*} [Field K] (hK : (6 : K) ≠ 0)
    (I J : K) (hIJ : 4 * I ^ 3 - J ^ 2 ≠ 0) (g₁ g₂ : BinaryQuartic K) (h₁ : invI g₁ = I ∧ invJ g₁ = J)
    (h₂ : invI g₂ = I ∧ invJ g₂ = J) :
    (∃ γ : PGL(2, K), γ • g₁ = g₂) ↔ ∃ (M : Matrix (Fin 2) (Fin 2) K) (_ : M.det ≠ 0) (F : ℕ → ℕ → K),
      ∀ x₁ y₁ x₂ y₂ : K, g₁.eval x₁ y₁ * (BinaryQuartic.hessian g₂).eval x₂ y₂ -
        g₂.eval x₂ y₂ * (BinaryQuartic.hessian g₁).eval x₁ y₁ =
          (x₁ * (M 0 0 * x₂ + M 0 1 * y₂) + y₁ * (M 1 0 * x₂ + M 1 1 * y₂)) *
            ∑ i ∈ Finset.range 4, ∑ j ∈ Finset.range 4, F i j * x₁ ^ i * y₁ ^ (3 - i) * x₂ ^ j * y₂ ^ (3 - j) :=
  sorry

/-! ## ST.1/stabilizer-of-a-binary-quartic-is-two-torsion -/

/-- Bhargava–Shankar, Theorem 3.2 (second paragraph): `Stab_{PGL₂(K)}(g) ≅ E(K)[2]`. -/
theorem BinaryQuartic.nonempty_stabilizer_equiv_twoTorsion {K : Type*} [Field K] [DecidableEq K]
    (hK : (6 : K) ≠ 0) (I J : K) (hIJ : 4 * I ^ 3 - J ^ 2 ≠ 0) (g : BinaryQuartic K)
    (hg : invI g = I ∧ invJ g = J) :
    Nonempty (MulAction.stabilizer PGL(2, K) g ≃*
      Multiplicative (nsmulAddMonoidHom (α := (BinaryQuartic.curveIJ I J).toAffine.Point) 2).ker) := sorry

theorem BinaryQuartic.card_stabilizer_real (g : BinaryQuartic ℝ) (hd : 0 < disc g) :
    Nat.card (MulAction.stabilizer PGL(2, ℝ) g) = 4 := sorry

theorem BinaryQuartic.card_stabilizer_real_of_neg (g : BinaryQuartic ℝ) (hd : disc g < 0) :
    Nat.card (MulAction.stabilizer PGL(2, ℝ) g) = 2 := sorry

/-! ## ST.1/image-of-the-cubic-invariant -/

namespace BinaryQuartic

variable {K : Type*} [Field K]

/-- The coefficient of `T²` in `m (t₀ + t₁ T + t₂ T²)²` reduced modulo `T³ − 27 I T − 27 J`, for a
polynomial representative `m`: the ternary quadratic form (conic) `Q_m`. -/
noncomputable def conicValue (I J : K) (m : K[X]) (t : Fin 3 → K) : K :=
  ((m * (C (t 0) + C (t 1) * X + C (t 2) * X ^ 2) ^ 2) %ₘ curvePoly I J).coeff 2

/-- Cremona–Fisher, Theorem 13(3), with Simon's quartic and the conic criterion: a square class of
square norm is a cubic invariant iff its conic `Q_m` has a nontrivial zero. -/
theorem exists_cubicInvariant_eq_iff (hK : (6 : K) ≠ 0) (hK5 : Nat.card K ≠ 5) (I J : K)
    (hIJ : 4 * I ^ 3 - J ^ 2 ≠ 0) (u : (etaleAlgebra I J)ˣ) (hN : IsSquare (Algebra.norm K (u : etaleAlgebra I J))) :
    (∃ g : BinaryQuartic K, invI g = I ∧ invJ g = J ∧ cubicInvariant I J g = QuotientGroup.mk u) ↔
      ∀ m : K[X], AdjoinRoot.mk _ m = (u : etaleAlgebra I J) →
        ∃ t : Fin 3 → K, t ≠ 0 ∧ conicValue I J m t = 0 := sorry

/-- Simon's quartic `(1/12v)(X⁴ − 6uX²Y² + 8rXY³ + (12Iv² − 3u²)Y⁴)` has invariants `I, J` when
`r² = u³ − 3Iuv² − Jv³`. -/
theorem invariants_simonQuartic (hK : (6 : K) ≠ 0) (I J u v r : K) (hv : v ≠ 0)
    (hr : r ^ 2 = u ^ 3 - 3 * I * u * v ^ 2 - J * v ^ 3) :
    invI (⟨1 / (12 * v), 0, -6 * u / (12 * v), 8 * r / (12 * v), (12 * I * v ^ 2 - 3 * u ^ 2) / (12 * v)⟩ :
      BinaryQuartic K) = I ∧
    invJ (⟨1 / (12 * v), 0, -6 * u / (12 * v), 8 * r / (12 * v), (12 * I * v ^ 2 - 3 * u ^ 2) / (12 * v)⟩ :
      BinaryQuartic K) = J := sorry

end BinaryQuartic

/-! ## ST.1/locally-soluble-quartics-and-the-two-selmer-group -/

/-- Bhargava–Shankar, Proposition 3.3 over a number field, in Mathlib-only form: the cubic invariant
is injective on `PGL₂(K)`-orbits of everywhere locally soluble forms with invariants `I, J`. With Tau
Ceti the full statement is that it is a bijection onto `(curveIJ I J).toAffine.selmerGroup₂ (𝓞 K)
(fun w : InfinitePlace K ↦ w.Completion)`, the orbit of forms with a linear factor going to `1`. -/
theorem BinaryQuartic.cubicInvariant_injective_locallySoluble {K : Type*} [Field K] [NumberField K]
    (I J : K) (hIJ : 4 * I ^ 3 - J ^ 2 ≠ 0) (g₁ g₂ : BinaryQuartic K) (h₁ : invI g₁ = I ∧ invJ g₁ = J)
    (h₂ : invI g₂ = I ∧ invJ g₂ = J) (hs₁ : g₁.IsEverywhereLocallySoluble) (hs₂ : g₂.IsEverywhereLocallySoluble)
    (hz : BinaryQuartic.cubicInvariant I J g₁ = BinaryQuartic.cubicInvariant I J g₂) :
    ∃ γ : PGL(2, K), γ • g₁ = g₂ := sorry

/-- The existence half, in Mathlib-only form: a square class of square norm that is, at every place,
the cubic invariant of a soluble local form, is the cubic invariant of a locally soluble global form. -/
theorem BinaryQuartic.exists_locallySoluble_of_local {K : Type*} [Field K] [NumberField K]
    (I J : K) (hIJ : 4 * I ^ 3 - J ^ 2 ≠ 0) (u : (BinaryQuartic.etaleAlgebra I J)ˣ)
    (hN : IsSquare (Algebra.norm K (u : BinaryQuartic.etaleAlgebra I J)))
    (hloc : ∀ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K),
      ∃ g : BinaryQuartic (v.adicCompletion K), g.IsSoluble ∧
        invI g = algebraMap K _ I ∧ invJ g = algebraMap K _ J ∧
        BinaryQuartic.restrictSquareClasses (algebraMap K (v.adicCompletion K)) I J (QuotientGroup.mk u) =
          BinaryQuartic.cubicInvariant _ _ g)
    (hinf : ∀ w : NumberField.InfinitePlace K, ∃ g : BinaryQuartic w.Completion, g.IsSoluble ∧
        invI g = algebraMap K _ I ∧ invJ g = algebraMap K _ J ∧
        BinaryQuartic.restrictSquareClasses (algebraMap K w.Completion) I J (QuotientGroup.mk u) =
          BinaryQuartic.cubicInvariant _ _ g) :
    ∃ g : BinaryQuartic K, g.IsEverywhereLocallySoluble ∧ invI g = I ∧ invJ g = J ∧
      BinaryQuartic.cubicInvariant I J g = QuotientGroup.mk u := sorry

/-! ## ST.1/primitive-vectors-extend-to-special-linear-matrices -/

theorem exists_SL3_col_eq {O : Type*} [CommRing O] [IsDomain O] [IsPrincipalIdealRing O]
    (v : Fin 3 → O) (hv : Ideal.span (Set.range v) = ⊤) (j : Fin 3) :
    ∃ M : SL(3, O), ∀ i, (M : Matrix (Fin 3) (Fin 3) O) i j = v i := sorry

/-! ## ST.1/ternary-cubic-forms-and-their-invariants -/

/-- A ternary cubic `a x³ + b y³ + c z³ + a₂ x²y + a₃ x²z + b₁ xy² + b₃ y²z + c₁ xz² + c₂ yz² + m xyz`
(Fisher's coordinates). -/
@[ext] structure TernaryCubicForm (R : Type*) where
  a : R
  b : R
  c : R
  a2 : R
  a3 : R
  b1 : R
  b3 : R
  c1 : R
  c2 : R
  m : R

namespace TernaryCubicForm

variable {R : Type*} [CommRing R]

/-- Evaluation. -/
def eval (U : TernaryCubicForm R) (x y z : R) : R :=
  U.a * x ^ 3 + U.b * y ^ 3 + U.c * z ^ 3 + U.a2 * x ^ 2 * y + U.a3 * x ^ 2 * z + U.b1 * x * y ^ 2 +
    U.b3 * y ^ 2 * z + U.c1 * x * z ^ 2 + U.c2 * y * z ^ 2 + U.m * x * y * z

/-- The invariant `c₄` (25 terms; Fisher, "The invariants of a genus one curve", §7.2). -/
def c4 (U : TernaryCubicForm R) : R := -216*U.a*U.b*U.c*U.m + 144*U.a*U.b*U.c1*U.c2 + 144*U.a*U.b1*U.b3*U.c - 48*U.a*U.b1*U.c2^2 - 48*U.a*U.b3^2*U.c1 + 24*U.a*U.b3*U.c2*U.m - 48*U.a2^2*U.b3*U.c + 16*U.a2^2*U.c2^2 + 144*U.a2*U.a3*U.b*U.c - 16*U.a2*U.a3*U.b3*U.c2 - 48*U.a2*U.b*U.c1^2 + 24*U.a2*U.b1*U.c*U.m - 16*U.a2*U.b1*U.c1*U.c2 + 24*U.a2*U.b3*U.c1*U.m - 8*U.a2*U.c2*U.m^2 - 48*U.a3^2*U.b*U.c2 + 16*U.a3^2*U.b3^2 + 24*U.a3*U.b*U.c1*U.m - 48*U.a3*U.b1^2*U.c - 16*U.a3*U.b1*U.b3*U.c1 + 24*U.a3*U.b1*U.c2*U.m - 8*U.a3*U.b3*U.m^2 + 16*U.b1^2*U.c1^2 - 8*U.b1*U.c1*U.m^2 + U.m^4

/-- The invariant `c₆` (103 terms). -/
def c6 (U : TernaryCubicForm R) : R := 5832*U.a^2*U.b^2*U.c^2 - 3888*U.a^2*U.b*U.b3*U.c*U.c2 + 864*U.a^2*U.b*U.c2^3 + 864*U.a^2*U.b3^3*U.c - 216*U.a^2*U.b3^2*U.c2^2 - 3888*U.a*U.a2*U.b*U.b1*U.c^2 + 1296*U.a*U.a2*U.b*U.b3*U.c*U.c1 + 1296*U.a*U.a2*U.b*U.c*U.c2*U.m - 864*U.a*U.a2*U.b*U.c1*U.c2^2 + 1296*U.a*U.a2*U.b1*U.b3*U.c*U.c2 - 288*U.a*U.a2*U.b1*U.c2^3 - 864*U.a*U.a2*U.b3^2*U.c*U.m + 144*U.a*U.a2*U.b3^2*U.c1*U.c2 + 144*U.a*U.a2*U.b3*U.c2^2*U.m - 3888*U.a*U.a3*U.b^2*U.c*U.c1 + 1296*U.a*U.a3*U.b*U.b1*U.c*U.c2 + 1296*U.a*U.a3*U.b*U.b3*U.c*U.m + 1296*U.a*U.a3*U.b*U.b3*U.c1*U.c2 - 864*U.a*U.a3*U.b*U.c2^2*U.m - 864*U.a*U.a3*U.b1*U.b3^2*U.c + 144*U.a*U.a3*U.b1*U.b3*U.c2^2 - 288*U.a*U.a3*U.b3^3*U.c1 + 144*U.a*U.a3*U.b3^2*U.c2*U.m + 864*U.a*U.b^2*U.c1^3 + 1296*U.a*U.b*U.b1*U.c*U.c1*U.m - 864*U.a*U.b*U.b1*U.c1^2*U.c2 - 864*U.a*U.b*U.b3*U.c1^2*U.m - 540*U.a*U.b*U.c*U.m^3 + 648*U.a*U.b*U.c1*U.c2*U.m^2 + 864*U.a*U.b1^3*U.c^2 - 864*U.a*U.b1^2*U.b3*U.c*U.c1 - 864*U.a*U.b1^2*U.c*U.c2*U.m + 576*U.a*U.b1^2*U.c1*U.c2^2 + 576*U.a*U.b1*U.b3^2*U.c1^2 + 648*U.a*U.b1*U.b3*U.c*U.m^2 - 720*U.a*U.b1*U.b3*U.c1*U.c2*U.m + 72*U.a*U.b1*U.c2^2*U.m^2 + 72*U.a*U.b3^2*U.c1*U.m^2 - 36*U.a*U.b3*U.c2*U.m^3 + 864*U.a2^3*U.b*U.c^2 - 288*U.a2^3*U.b3*U.c*U.c2 + 64*U.a2^3*U.c2^3 - 864*U.a2^2*U.a3*U.b*U.c*U.c2 + 576*U.a2^2*U.a3*U.b3^2*U.c - 96*U.a2^2*U.a3*U.b3*U.c2^2 - 864*U.a2^2*U.b*U.c*U.c1*U.m + 576*U.a2^2*U.b*U.c1^2*U.c2 - 216*U.a2^2*U.b1^2*U.c^2 + 144*U.a2^2*U.b1*U.b3*U.c*U.c1 + 144*U.a2^2*U.b1*U.c*U.c2*U.m - 96*U.a2^2*U.b1*U.c1*U.c2^2 - 216*U.a2^2*U.b3^2*U.c1^2 + 72*U.a2^2*U.b3*U.c*U.m^2 + 144*U.a2^2*U.b3*U.c1*U.c2*U.m - 48*U.a2^2*U.c2^2*U.m^2 - 864*U.a2*U.a3^2*U.b*U.b3*U.c + 576*U.a2*U.a3^2*U.b*U.c2^2 - 96*U.a2*U.a3^2*U.b3^2*U.c2 + 1296*U.a2*U.a3*U.b*U.b1*U.c*U.c1 + 144*U.a2*U.a3*U.b*U.b3*U.c1^2 + 648*U.a2*U.a3*U.b*U.c*U.m^2 - 720*U.a2*U.a3*U.b*U.c1*U.c2*U.m + 144*U.a2*U.a3*U.b1^2*U.c*U.c2 - 720*U.a2*U.a3*U.b1*U.b3*U.c*U.m - 48*U.a2*U.a3*U.b1*U.b3*U.c1*U.c2 + 144*U.a2*U.a3*U.b1*U.c2^2*U.m + 144*U.a2*U.a3*U.b3^2*U.c1*U.m - 24*U.a2*U.a3*U.b3*U.c2*U.m^2 - 288*U.a2*U.b*U.b1*U.c1^3 + 72*U.a2*U.b*U.c1^2*U.m^2 + 144*U.a2*U.b1^2*U.c*U.c1*U.m - 96*U.a2*U.b1^2*U.c1^2*U.c2 + 144*U.a2*U.b1*U.b3*U.c1^2*U.m - 36*U.a2*U.b1*U.c*U.m^3 - 24*U.a2*U.b1*U.c1*U.c2*U.m^2 - 36*U.a2*U.b3*U.c1*U.m^3 + 12*U.a2*U.c2*U.m^4 + 864*U.a3^3*U.b^2*U.c - 288*U.a3^3*U.b*U.b3*U.c2 + 64*U.a3^3*U.b3^3 - 216*U.a3^2*U.b^2*U.c1^2 - 864*U.a3^2*U.b*U.b1*U.c*U.m + 144*U.a3^2*U.b*U.b1*U.c1*U.c2 + 144*U.a3^2*U.b*U.b3*U.c1*U.m + 72*U.a3^2*U.b*U.c2*U.m^2 + 576*U.a3^2*U.b1^2*U.b3*U.c - 216*U.a3^2*U.b1^2*U.c2^2 - 96*U.a3^2*U.b1*U.b3^2*U.c1 + 144*U.a3^2*U.b1*U.b3*U.c2*U.m - 48*U.a3^2*U.b3^2*U.m^2 + 144*U.a3*U.b*U.b1*U.c1^2*U.m - 36*U.a3*U.b*U.c1*U.m^3 - 288*U.a3*U.b1^3*U.c*U.c1 - 96*U.a3*U.b1^2*U.b3*U.c1^2 + 72*U.a3*U.b1^2*U.c*U.m^2 + 144*U.a3*U.b1^2*U.c1*U.c2*U.m - 24*U.a3*U.b1*U.b3*U.c1*U.m^2 - 36*U.a3*U.b1*U.c2*U.m^3 + 12*U.a3*U.b3*U.m^4 + 64*U.b1^3*U.c1^3 - 48*U.b1^2*U.c1^2*U.m^2 + 12*U.b1*U.c1*U.m^4 - U.m^6

/-- The substituted cubic `U(Mᵀ(x, y, z))`, coefficients by interpolation (polynomial in `M`). -/
noncomputable def comp (U : TernaryCubicForm R) (M : Matrix (Fin 3) (Fin 3) R) : TernaryCubicForm R := sorry

theorem eval_comp (U : TernaryCubicForm R) (M : Matrix (Fin 3) (Fin 3) R) (x y z : R) :
    (U.comp M).eval x y z = U.eval (M 0 0 * x + M 1 0 * y + M 2 0 * z) (M 0 1 * x + M 1 1 * y + M 2 1 * z)
      (M 0 2 * x + M 1 2 * y + M 2 2 * z) := sorry

/-- The Weierstrass cubic `y² z − x³ − A x z² − B z³`. -/
def weierstrass (A B : R) : TernaryCubicForm R := ⟨-1, 0, -B, 0, 0, 0, 1, -A, 0, 0⟩

theorem c4_weierstrass (A B : R) : (weierstrass A B).c4 = -48 * A := sorry

theorem c6_weierstrass (A B : R) : (weierstrass A B).c6 = -864 * B := sorry

theorem c4_cube_sub_c6_sq (U : TernaryCubicForm ℚ) :
    ∃ Δ : ℚ, U.c4 ^ 3 - U.c6 ^ 2 = 1728 * Δ := sorry

/-- Unit test `ArithmeticStatistics.TernaryCubicForm.test_c4_fermat`: the Fermat cubic `x³ + y³ + z³`
has `c₄ = 0`. -/
example : (⟨1, 1, 1, 0, 0, 0, 0, 0, 0, 0⟩ : TernaryCubicForm ℤ).c4 = 0 := sorry

/-- Unit test `ArithmeticStatistics.TernaryCubicForm.test_c6_fermat`: and `c₆ = 5832`. -/
example : (⟨1, 1, 1, 0, 0, 0, 0, 0, 0, 0⟩ : TernaryCubicForm ℤ).c6 = 5832 := sorry

/-- Unit test `ArithmeticStatistics.TernaryCubicForm.test_c4_weierstrass_value`: for
`y²z = x³ − xz²` (`A = −1`, `B = 0`), `c₄ = 48`, not the `−48` of a sign-flipped normalization. -/
example : (weierstrass (-1 : ℤ) 0).c4 = 48 := sorry

end TernaryCubicForm

/-! ## ST.1/invariance-of-ternary-cubic-invariants -/

theorem TernaryCubicForm.c4_comp {R : Type*} [CommRing R] (U : TernaryCubicForm R)
    (M : Matrix (Fin 3) (Fin 3) R) : (U.comp M).c4 = M.det ^ 4 * U.c4 := sorry

theorem TernaryCubicForm.c6_comp {R : Type*} [CommRing R] (U : TernaryCubicForm R)
    (M : Matrix (Fin 3) (Fin 3) R) : (U.comp M).c6 = M.det ^ 6 * U.c6 := sorry

/-! ## ST.1/projection-of-a-plane-cubic-from-a-rational-point -/

namespace TernaryCubicForm

variable {R : Type*} [CommRing R]

/-- For `U` through `(0 : 1 : 0)` (`b = 0`), written `f₁(x, z) y² − f₂(x, z) y − f₃(x, z)`, the binary
quartic `f₂² + 4 f₁ f₃` in `(x, z)`. -/
def projectionQuartic (U : TernaryCubicForm R) : BinaryQuartic R :=
  -- f₁ = b₁ x + b₃ z, f₂ = −(a₂ x² + m x z + c₂ z²), f₃ = −(a x³ + a₃ x² z + c₁ x z² + c z³)
  ⟨U.a2 ^ 2 - 4 * U.b1 * U.a, 2 * U.a2 * U.m - 4 * (U.b1 * U.a3 + U.b3 * U.a),
    U.m ^ 2 + 2 * U.a2 * U.c2 - 4 * (U.b1 * U.c1 + U.b3 * U.a3), 2 * U.m * U.c2 - 4 * (U.b1 * U.c + U.b3 * U.c1),
    U.c2 ^ 2 - 4 * U.b3 * U.c⟩

theorem invI_projectionQuartic (U : TernaryCubicForm R) (hb : U.b = 0) :
    BinaryQuartic.invI U.projectionQuartic = U.c4 := sorry

theorem invJ_projectionQuartic (U : TernaryCubicForm R) (hb : U.b = 0) :
    BinaryQuartic.invJ U.projectionQuartic = 2 * U.c6 := sorry

theorem projectionQuartic_eval (U : TernaryCubicForm R) (x z : R) :
    U.projectionQuartic.eval x z = (U.a2 * x ^ 2 + U.m * x * z + U.c2 * z ^ 2) ^ 2 +
      4 * (U.b1 * x + U.b3 * z) * (-(U.a * x ^ 3 + U.a3 * x ^ 2 * z + U.c1 * x * z ^ 2 + U.c * z ^ 3)) := sorry

/-- Unit test `ArithmeticStatistics.TernaryCubicForm.test_projection_weierstrass_origin`: projecting
`y²z − x³ − Axz² − Bz³` from `(0 : 1 : 0)` gives `4(x³z + Axz³ + Bz⁴)`. -/
example (A B : ℤ) : (weierstrass A B).projectionQuartic = ⟨0, 4, 0, 4 * A, 4 * B⟩ := sorry

/-- Unit test `ArithmeticStatistics.TernaryCubicForm.test_projection_invariants_numeric`: for `A = −7`,
`B = 10`, the projected quartic has `I = 336` and `J = −17280`. -/
example : BinaryQuartic.invI (weierstrass (-7 : ℤ) 10).projectionQuartic = 336 ∧
    BinaryQuartic.invJ (weierstrass (-7 : ℤ) 10).projectionQuartic = -17280 := sorry

/-- Unit test `ArithmeticStatistics.TernaryCubicForm.test_projection_integral`: the projection of an
integral cubic is integral (compatibility with base change). -/
example (U : TernaryCubicForm ℤ) : (TernaryCubicForm.mk (U.a : ℚ) U.b U.c U.a2 U.a3 U.b1 U.b3 U.c1 U.c2 U.m).projectionQuartic =
    U.projectionQuartic.map (Int.castRingHom ℚ) := sorry

end TernaryCubicForm

/-! ## ST.1/cubic-invariant-of-the-projected-quartic -/

/-- For `E : y² = x³ + A x + B`, `P = (ξ, η)` with `η ≠ 0` and `M ∈ SL₃` moving `(0 : 1 : 0)` to `P`,
the projected quartic has invariants `(−48A, −1728B)` and cubic invariant the class of `36 ξ − T`
(the `μ`-value at the image of `P` on `y² = x³ + 1296 A x + 46656 B`). -/
theorem TernaryCubicForm.cubicInvariant_projectionQuartic {K : Type*} [Field K] (hK : (6 : K) ≠ 0)
    (A B ξ η : K) (hP : η ^ 2 = ξ ^ 3 + A * ξ + B) (hη : η ≠ 0) (M : SL(3, K))
    (hM : ∀ k, (M : Matrix (Fin 3) (Fin 3) K) 1 k = ![ξ, η, 1] k) :
    ∃ u : (BinaryQuartic.etaleAlgebra (-48 * A) (-1728 * B))ˣ,
      (u : BinaryQuartic.etaleAlgebra (-48 * A) (-1728 * B)) = AdjoinRoot.mk _ (C (36 * ξ) - X) ∧
      BinaryQuartic.cubicInvariant (-48 * A) (-1728 * B)
        ((TernaryCubicForm.weierstrass A B).comp (M : Matrix (Fin 3) (Fin 3) K)).projectionQuartic =
          QuotientGroup.mk u := sorry

/-! ## ST.1/local-integral-representatives-of-soluble-quartics -/

theorem BinaryQuartic.exists_padic_integral_representative (p : ℕ) [Fact p.Prime] (A B : ℤ_[p])
    (f : BinaryQuartic ℚ_[p]) (hf : f.IsSoluble) (hI : invI f = -48 * (A : ℚ_[p]))
    (hJ : invJ f = -1728 * (B : ℚ_[p])) (hΔ : 4 * (A : ℚ_[p]) ^ 3 + 27 * (B : ℚ_[p]) ^ 2 ≠ 0) :
    ∃ (γ : PGL(2, ℚ_[p])) (g : BinaryQuartic ℤ_[p]), γ • f = g.map (algebraMap ℤ_[p] ℚ_[p]) := sorry

/-! ## ST.1/integrality-from-local-integrality -/

theorem BinaryQuartic.exists_integral_of_forall_padic (f : BinaryQuartic ℚ)
    (h : ∀ (p : ℕ) [Fact p.Prime], ∃ (γ : PGL(2, ℚ_[p])) (g : BinaryQuartic ℤ_[p]),
      γ • f.map (algebraMap ℚ ℚ_[p]) = g.map (algebraMap ℤ_[p] ℚ_[p])) :
    ∃ (γ : PGL(2, ℚ)) (g : BinaryQuartic ℤ), γ • f = g.map (Int.castRingHom ℚ) := sorry

/-! ## ST.1/integral-representatives-of-locally-soluble-quartics -/

/-- Bhargava–Shankar, Lemma 3.4. -/
theorem BinaryQuartic.exists_integral_representative (f : BinaryQuartic ℚ) (hf : f.IsLocallySolubleQ)
    (A B : ℤ) (hI : invI f = -48 * (A : ℚ)) (hJ : invJ f = -1728 * (B : ℚ))
    (hΔ : 4 * (A : ℚ) ^ 3 + 27 * (B : ℚ) ^ 2 ≠ 0) :
    ∃ (γ : PGL(2, ℚ)) (g : BinaryQuartic ℤ), γ • f = g.map (Int.castRingHom ℚ) := sorry

/-! ## ST.1/binary-quartic-parametrization-of-two-selmer -/

/-- Bhargava–Shankar, Theorem 3.5, in Mathlib-only form. For `E = E_{A,B}` with `I = −3A`, `J = −27B`,
the `2`-Selmer elements correspond to `PGL₂(ℚ)`-classes of locally soluble integral forms with
invariants `2⁴ I = −48A` and `2⁶ J = −1728B`; with Tau Ceti the target is
`(curveIJ (-48A) (-1728B)).toAffine.selmerGroup₂ ℤ (fun _ : Unit ↦ ℝ)`, transported to
`y² = x³ + Ax + B` by the variable change `x ↦ 36 x`, `y ↦ 216 y`. Stated here: every locally soluble
rational form with these invariants has an integral representative, and the cubic invariant is
injective on the corresponding orbits. -/
theorem BinaryQuartic.twoSelmer_parametrization (A B : ℤ) (hΔ : 4 * A ^ 3 + 27 * B ^ 2 ≠ 0) :
    (∀ f : BinaryQuartic ℚ, f.IsLocallySolubleQ → invI f = -48 * (A : ℚ) → invJ f = -1728 * (B : ℚ) →
      ∃ (γ : PGL(2, ℚ)) (g : BinaryQuartic ℤ), γ • f = g.map (Int.castRingHom ℚ)) ∧
    ∀ g₁ g₂ : BinaryQuartic ℤ, (g₁.map (Int.castRingHom ℚ)).IsLocallySolubleQ →
      (g₂.map (Int.castRingHom ℚ)).IsLocallySolubleQ → invI g₁ = -48 * A → invJ g₁ = -1728 * B →
      invI g₂ = -48 * A → invJ g₂ = -1728 * B →
      (BinaryQuartic.cubicInvariant (-48 * (A : ℚ)) (-1728 * B) (g₁.map (Int.castRingHom ℚ)) =
          BinaryQuartic.cubicInvariant (-48 * (A : ℚ)) (-1728 * B) (g₂.map (Int.castRingHom ℚ)) ↔
        ∃ γ : PGL(2, ℚ), γ • g₁.map (Int.castRingHom ℚ) = g₂.map (Int.castRingHom ℚ)) := sorry

/-! ## ST.1/comparison-with-the-cohomological-two-selmer-group

Stated in the roadmap document only: the composite of the Selmer comparison above with the Tau Ceti
EllipticCurves Layer 7 identification of `selmerGroup₂` with `Sel₂(E/K) ⊆ H¹(K, E[2])` needs the
Layer 7 cohomology objects, which neither Mathlib nor this file has. -/

/-! ## ST.1/embedding-into-pairs-of-ternary-quadratic-forms -/

namespace BinaryQuartic

/-- The Veronese form `A₁ = x₁x₃ − x₂²` (Gram matrix `antidiag(1/2, −1, 1/2)`). -/
def veroneseForm : TernaryQuadraticForm ℤ := ⟨0, -1, 0, 0, 1, 0⟩

/-- Bhargava–Shankar (30): `f ↦ (A₁, B_f)` with `B_f = a x₁² + b x₁x₂ + c x₂² + d x₂x₃ + e x₃²`. -/
def embed (f : BinaryQuartic ℤ) : TernaryQuadraticPair ℤ := ⟨veroneseForm, ⟨f.a, f.c, f.e, f.b, 0, f.d⟩⟩

/-- The homomorphism `ρ : GL₂ → SL₃` of Bhargava–Shankar (31), with the coordinate order that makes
`embed` equivariant: `ρ(a b; c d) = (ad − bc)⁻¹ (a², ab, b²; 2ac, ad + bc, 2bd; c², cd, d²)`. -/
def rho (γ : GL (Fin 2) ℤ) : Matrix (Fin 3) (Fin 3) ℤ :=
  let a := (γ : Matrix (Fin 2) (Fin 2) ℤ) 0 0
  let b := (γ : Matrix (Fin 2) (Fin 2) ℤ) 0 1
  let c := (γ : Matrix (Fin 2) (Fin 2) ℤ) 1 0
  let d := (γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1
  (((Matrix.GeneralLinearGroup.det γ)⁻¹ : ℤˣ) : ℤ) • !![a ^ 2, a * b, b ^ 2; 2 * a * c, a * d + b * c, 2 * b * d;
    c ^ 2, c * d, d ^ 2]

/-- The slice `W_{ℤ,1}`: pairs whose first form is `A₁`. -/
def slice : Set (TernaryQuadraticPair ℤ) := {P | P.A = veroneseForm}

theorem embed_injective : Function.Injective embed := sorry

theorem mem_range_embed_iff (P : TernaryQuadraticPair ℤ) :
    P ∈ Set.range embed ↔ P.A = veroneseForm ∧ P.B.a13 = 0 := sorry

theorem exists_unique_normalized (P : TernaryQuadraticPair ℤ) (hP : P ∈ slice) :
    ∃! r : ℤ, (⟨P.A, TernaryQuadraticForm.lincomb r P.A 1 P.B⟩ : TernaryQuadraticPair ℤ) ∈ Set.range embed := sorry

theorem disc_embed (f : BinaryQuartic ℤ) : (embed f).disc = disc f := sorry

theorem resolventForm_embed (f : BinaryQuartic ℤ) :
    (embed f).resolventForm = ⟨1, f.c, f.b * f.d - 4 * f.a * f.e, f.a * f.d ^ 2 + f.b ^ 2 * f.e - 4 * f.a * f.c * f.e⟩ :=
  sorry

theorem rho_det (γ : GL (Fin 2) ℤ) : (rho γ).det = 1 := sorry

theorem veroneseForm_comp_rho (γ : GL (Fin 2) ℤ) : veroneseForm.comp (rho γ) = veroneseForm := sorry

theorem embed_smul (γ : GL (Fin 2) ℤ) (f : BinaryQuartic ℤ) :
    ∃ r : ℤ, embed (γ • f) = ⟨veroneseForm,
      TernaryQuadraticForm.lincomb r veroneseForm 1 ((embed f).B.comp (rho γ))⟩ := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_embed_x3y`: `x³y` maps to `(A₁, x₁x₂)`,
whose resolvent form is `x³`. -/
example : (embed ⟨0, 1, 0, 0, 0⟩).resolventForm = ⟨1, 0, 0, 0⟩ := sorry

/-- The unipotent `T = (1 1; 0 1)` of `GL₂(ℤ)`. -/
def unipotentT : GL (Fin 2) ℤ :=
  Matrix.SpecialLinearGroup.toGL ⟨!![1, 1; 0, 1], by simp [Matrix.det_fin_two_of]⟩

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_rho_T`: `ρ(1 1; 0 1) = (1 1 1; 0 1 2; 0 0 1)`
(the printed order of (31) would give `(1 0 0; 2 1 0; 1 1 1)`). -/
example : rho unipotentT = !![1, 1, 1; 0, 1, 2; 0, 0, 1] := sorry

/-- Unit test `ArithmeticStatistics.BinaryQuartic.test_rho_equivariance_T`: `T · y⁴ = (x + y)⁴`, and the
`x₁²`-coefficient of `ρ(T) · B_{y⁴}` is that of `B_{(x+y)⁴}`, namely `1`; the printed order of (31)
gives `0`. -/
example : ((embed ⟨0, 0, 0, 0, 1⟩).B.comp (rho unipotentT)).a11 = (embed ⟨1, 4, 6, 4, 1⟩).B.a11 := sorry

end BinaryQuartic

/-! ## ST.1/special-orthogonal-group-of-the-veronese-form -/

theorem BinaryQuartic.range_rho (M : SL(3, ℤ)) :
    BinaryQuartic.veroneseForm.comp (M : Matrix (Fin 3) (Fin 3) ℤ) = BinaryQuartic.veroneseForm ↔
      ∃ γ : GL (Fin 2) ℤ, BinaryQuartic.rho γ = M := sorry

/-! ## ST.1/orbit-bijection-for-the-embedding -/

/-- Bhargava–Shankar, Theorem 2.14. -/
theorem BinaryQuartic.embed_orbit_iff (f g : BinaryQuartic ℤ) :
    (∃ γ : GL (Fin 2) ℤ, γ • f = g) ↔
      ∃ (M : SL(3, ℤ)) (r : ℤ), BinaryQuartic.veroneseForm.comp (M : Matrix (Fin 3) (Fin 3) ℤ) =
        BinaryQuartic.veroneseForm ∧
        (BinaryQuartic.embed g).B = TernaryQuadraticForm.lincomb r BinaryQuartic.veroneseForm 1
          ((BinaryQuartic.embed f).B.comp (M : Matrix (Fin 3) (Fin 3) ℤ)) := sorry

/-! ## ST.1/fibres-of-the-embedding-are-uniformly-bounded -/

/-- Bhargava–Shankar, Proposition 2.16, with the constant the argument establishes: the number of
`GL₂(ℤ)`-classes of forms `g` whose embedding is `GL₂(ℤ) × SL₃(ℤ)`-equivalent to that of `f` is at most
`2 N`, for any `N` bounding the integral solutions of `h(x, y) = 1` over integral binary cubic forms
of nonzero discriminant. -/
theorem BinaryQuartic.card_fibre_embed_le (N : ℕ)
    (hN : ∀ h : BinaryCubicForm ℤ, h.disc ≠ 0 → {p : ℤ × ℤ | h.eval p.1 p.2 = 1}.ncard ≤ N)
    (f : BinaryQuartic ℤ) (hf : disc f ≠ 0) :
    {o : MulAction.orbitRel.Quotient (GL (Fin 2) ℤ) (BinaryQuartic ℤ) |
      ∃ g, Quotient.mk'' g = o ∧ ∃ h : GL (Fin 3) ℤ × GL (Fin 2) ℤ, h • BinaryQuartic.embed g = BinaryQuartic.embed f}.ncard
        ≤ 2 * N := sorry

end ArithmeticStatistics

end ST1

/-! # ArithmeticStatistics:ST.2 — Geometry of numbers and uniformity -/

noncomputable section ST2

open MeasureTheory Filter Topology Pointwise Classical

namespace ArithmeticStatistics

/-! ## Coefficient coordinates, discriminant polynomials and orbit counts of binary forms

Binary quartic forms, their invariants `I`, `J`, the discriminant and the height are ST.0's
(`BinaryQuartic`, `BinaryQuartic.invI`, `invJ`, `disc`, `pairHeight`, `height`), with the
`GL₂`-action by substitution; binary cubic forms, their discriminant and the twisted action
`γ • f = (det γ)⁻¹ f((x, y)γ)` are ST.1's (`BinaryCubicForm`, `disc`, `instMulAction`; for a real
matrix `γ` the same formula is `(f.subst γ).scale γ.det⁻¹`), as are irreducibility of binary
quartics and the Davenport–Heilbronn sets `U_p`. This stage adds the coefficient coordinates
`V_R = R⁵` and `U_R = R⁴` in which the geometry of numbers takes place. -/

namespace BinaryQuartic

/-- The coefficient vector `(a, b, c, d, e)`. -/
def coeffs {R : Type*} (f : BinaryQuartic R) : Fin 5 → R := ![f.a, f.b, f.c, f.d, f.e]

/-- The form with a given coefficient vector. -/
def ofCoeffs {R : Type*} (v : Fin 5 → R) : BinaryQuartic R := ⟨v 0, v 1, v 2, v 3, v 4⟩

end BinaryQuartic

namespace BinaryCubicForm

/-- The coefficient vector `(a, b, c, d)`. -/
def coeffs {R : Type*} (f : BinaryCubicForm R) : Fin 4 → R := ![f.a, f.b, f.c, f.d]

/-- The form with a given coefficient vector. -/
def ofCoeffs {R : Type*} (v : Fin 4 → R) : BinaryCubicForm R := ⟨v 0, v 1, v 2, v 3⟩

/-- An integral binary cubic form is irreducible over `ℚ` (in particular `a ≠ 0`); the cubic
counterpart of ST.1's `BinaryQuartic.IsIrreducibleOverQ`. -/
def IsIrreducibleOverQ (f : BinaryCubicForm ℤ) : Prop :=
  f.a ≠ 0 ∧ Irreducible (f.map (Int.castRingHom ℚ)).toCubic.toPoly

end BinaryCubicForm

/-- The discriminant `Δ` as a polynomial in the five coefficients: ST.0's `disc` of the generic
binary quartic form. -/
def quarticDiscPoly : MvPolynomial (Fin 5) ℤ :=
  (BinaryQuartic.ofCoeffs fun i => MvPolynomial.X i).disc

/-- The discriminant `Disc` as a polynomial in the four coefficients: ST.1's `disc` of the generic
binary cubic form. -/
def cubicDiscPoly : MvPolynomial (Fin 4) ℤ :=
  (BinaryCubicForm.ofCoeffs fun i => MvPolynomial.X i).disc

/-- The number `N(S; X)` of `GL_2(ℤ)`-classes of irreducible forms in `S` of height `< X`. -/
def quarticClassCount (S : Set (BinaryQuartic ℤ)) (X : ℝ) : ℕ :=
  Set.ncard (Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
    {f | f ∈ S ∧ f.IsIrreducibleOverQ ∧ f.height < X})

/-- The number of `GL_2(ℤ)`-classes (twisted action) of irreducible cubic forms in `S` with
`0 < |Disc| < X`. -/
def cubicClassCount (S : Set (BinaryCubicForm ℤ)) (X : ℝ) : ℕ :=
  Set.ncard (Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
    {f | f ∈ S ∧ f.IsIrreducibleOverQ ∧ |(f.disc : ℝ)| < X})

/-! ## Prime sums (ArithmeticStatistics:ST.2/chebyshev-bounds-for-prime-sums) -/

/-- Chebyshev's bound `π(x) ≪ x / log x`. -/
theorem primeCounting_le_mul_div_log :
    ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x → (Nat.primeCounting ⌊x⌋₊ : ℝ) ≤ C * x / Real.log x := sorry

/-- Tails of prime sums: `∑_{p > N} p^{-s} ≪ N^{1-s} / log N`. -/
theorem tsum_primes_rpow_gt_le (s : ℝ) (hs : 1 < s) :
    ∃ C : ℝ, ∀ N : ℝ, 2 ≤ N →
      ∑' p : {p : ℕ // p.Prime ∧ N < p}, ((p : ℕ) : ℝ) ^ (-s) ≤ C * N ^ (1 - s) / Real.log N :=
  sorry

/-! ## The geometric sieve -/

/-- The integral points of the dilate `r • B`. -/
def dilatedIntPoints {n : ℕ} (B : Set (Fin n → ℝ)) (r : ℝ) : Set (Fin n → ℤ) :=
  {a | (fun i => (a i : ℝ)) ∈ r • B}

/-- The `𝔽_p`-points of the closed subscheme of `𝔸^n_ℤ` cut out by `𝔞`. -/
def zeroLocusModP {n : ℕ} (𝔞 : Ideal (MvPolynomial (Fin n) ℤ)) (p : ℕ) : Set (Fin n → ZMod p) :=
  {a | ∀ g ∈ 𝔞, MvPolynomial.eval a (MvPolynomial.map (Int.castRingHom (ZMod p)) g) = 0}

/-- The integral points of the closed subscheme cut out by `𝔞`. -/
def zeroLocusInt {n : ℕ} (𝔞 : Ideal (MvPolynomial (Fin n) ℤ)) : Set (Fin n → ℤ) :=
  {a | ∀ g ∈ 𝔞, MvPolynomial.eval a g = 0}

/-- Reduction of an integral point modulo `p`. -/
def reduceMod {n : ℕ} (p : ℕ) (a : Fin n → ℤ) : Fin n → ZMod p := fun i => (a i : ZMod p)

/-- Lemma 3.1 of the geometric sieve (ArithmeticStatistics:ST.2/lattice-points-on-a-subvariety-in-a-dilated-region). -/
theorem ncard_dilatedIntPoints_inter_zeroLocus_le {n k : ℕ} (B : Set (Fin n → ℝ))
    (hB : IsCompact B) (𝔞 : Ideal (MvPolynomial (Fin n) ℚ))
    (hdim : ringKrullDim (MvPolynomial (Fin n) ℚ ⧸ 𝔞) ≤ ((n - k : ℕ) : WithBot ℕ∞)) :
    ∃ C : ℝ, ∀ r : ℝ, 1 ≤ r →
      (Set.ncard {a ∈ dilatedIntPoints B r |
        ∀ g ∈ 𝔞, MvPolynomial.eval (fun i => (a i : ℚ)) g = 0} : ℝ) ≤ C * r ^ (n - k) := sorry

/-- `#Y(𝔽_p) = O(p^{n-k})` for a closed subscheme of `𝔸^n_ℤ` of codimension `k`
(ArithmeticStatistics:ST.2/uniform-bound-for-points-of-a-subscheme-modulo-p). -/
theorem ncard_zeroLocusModP_le {n k : ℕ} (𝔞 : Ideal (MvPolynomial (Fin n) ℤ))
    (hdim : ringKrullDim (MvPolynomial (Fin n) ℤ ⧸ 𝔞) ≤ ((n + 1 - k : ℕ) : WithBot ℕ∞)) :
    ∃ M₀ C : ℝ, ∀ p : ℕ, p.Prime → M₀ < p →
      (Set.ncard (zeroLocusModP 𝔞 p) : ℝ) ≤ C * (p : ℝ) ^ (n - k) := sorry

/-- The small-prime half of the geometric sieve, display (16)
(ArithmeticStatistics:ST.2/geometric-sieve-small-primes). -/
theorem geometricSieve_smallPrimes {n k : ℕ} (hk : 2 ≤ k) (B : Set (Fin n → ℝ))
    (hB : IsCompact B) (𝔞 : Ideal (MvPolynomial (Fin n) ℤ))
    (hdim : ringKrullDim (MvPolynomial (Fin n) ℤ ⧸ 𝔞) ≤ ((n + 1 - k : ℕ) : WithBot ℕ∞)) :
    ∃ C : ℝ, ∀ r M : ℝ, 1 ≤ r → 2 ≤ M →
      (Set.ncard {q : (Fin n → ℤ) × ℕ | q.1 ∈ dilatedIntPoints B r ∧ q.2.Prime ∧
          M < q.2 ∧ (q.2 : ℝ) ≤ r ∧ reduceMod q.2 q.1 ∈ zeroLocusModP 𝔞 q.2} : ℝ) ≤
        C * (r ^ n / (M ^ (k - 1) * Real.log M)) := sorry

/-- The large-prime half of the geometric sieve, display (17)
(ArithmeticStatistics:ST.2/geometric-sieve-large-primes). -/
theorem geometricSieve_largePrimes {n k : ℕ} (hk : 1 ≤ k) (B : Set (Fin n → ℝ))
    (hB : IsCompact B) (𝔞 : Ideal (MvPolynomial (Fin n) ℤ))
    (hdim : ringKrullDim (MvPolynomial (Fin n) ℤ ⧸ 𝔞) ≤ ((n + 1 - k : ℕ) : WithBot ℕ∞)) :
    ∃ C : ℝ, ∀ r : ℝ, 1 ≤ r →
      (Set.ncard {q : (Fin n → ℤ) × ℕ | q.1 ∈ dilatedIntPoints B r ∧ q.2.Prime ∧
          r < q.2 ∧ q.1 ∉ zeroLocusInt 𝔞 ∧ reduceMod q.2 q.1 ∈ zeroLocusModP 𝔞 q.2} : ℝ) ≤
        C * r ^ (n - k + 1) := sorry

/-- **The quantitative Ekedahl geometric sieve** (Bhargava, Theorem 3.3; Bhargava-Shankar,
Theorem 2.17) (ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve). -/
theorem quantitative_ekedahl_geometric_sieve {n k : ℕ} (hk : 1 ≤ k) (B : Set (Fin n → ℝ))
    (hB : IsCompact B) (𝔞 : Ideal (MvPolynomial (Fin n) ℤ))
    (hdim : ringKrullDim (MvPolynomial (Fin n) ℤ ⧸ 𝔞) ≤ ((n + 1 - k : ℕ) : WithBot ℕ∞)) :
    ∃ C : ℝ, ∀ r M : ℝ, 1 ≤ r → 2 ≤ M →
      (Set.ncard {a ∈ dilatedIntPoints B r | ∃ p : ℕ, p.Prime ∧ M < p ∧
          reduceMod p a ∈ zeroLocusModP 𝔞 p} : ℝ) ≤
        C * (r ^ n / (M ^ (k - 1) * Real.log M) + r ^ (n - k + 1)) := sorry

/-! ## Strong and weak multiples of `p^2`
(ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values) -/

/-- `f` is strongly a multiple of `p ^ j` at `a`: `p ^ j ∣ f(a')` for every `a' ≡ a (mod p)`. -/
def StronglyDvdAt {n : ℕ} (f : MvPolynomial (Fin n) ℤ) (p j : ℕ) (a : Fin n → ℤ) : Prop :=
  ∀ a' : Fin n → ℤ, (∀ i, (p : ℤ) ∣ a' i - a i) → (p : ℤ) ^ j ∣ MvPolynomial.eval a' f

/-- `f` is weakly a multiple of `p ^ j` at `a`. -/
def WeaklyDvdAt {n : ℕ} (f : MvPolynomial (Fin n) ℤ) (p j : ℕ) (a : Fin n → ℤ) : Prop :=
  (p : ℤ) ^ j ∣ MvPolynomial.eval a f ∧ ¬ StronglyDvdAt f p j a

theorem stronglyDvdAt_two_iff {n : ℕ} (f : MvPolynomial (Fin n) ℤ) {p : ℕ} (hp : p.Prime)
    (a : Fin n → ℤ) :
    StronglyDvdAt f p 2 a ↔ (p : ℤ) ^ 2 ∣ MvPolynomial.eval a f ∧
      ∀ i, (p : ℤ) ∣ MvPolynomial.eval a (MvPolynomial.pderiv i f) := sorry

theorem stronglyDvdAt_congr {n : ℕ} (f : MvPolynomial (Fin n) ℤ) (p j : ℕ) {a a' : Fin n → ℤ}
    (h : ∀ i, (p : ℤ) ∣ a' i - a i) : StronglyDvdAt f p j a ↔ StronglyDvdAt f p j a' := sorry

theorem weaklyDvdAt_of_not_dvd_pderiv {n : ℕ} (f : MvPolynomial (Fin n) ℤ) {p : ℕ}
    (hp : p.Prime) (a : Fin n → ℤ) (h : (p : ℤ) ^ 2 ∣ MvPolynomial.eval a f) (i : Fin n)
    (hi : ¬ (p : ℤ) ∣ MvPolynomial.eval a (MvPolynomial.pderiv i f)) : WeaklyDvdAt f p 2 a :=
  sorry

theorem stronglyDvdAt_one_iff {n : ℕ} (f : MvPolynomial (Fin n) ℤ) (p : ℕ) (a : Fin n → ℤ) :
    StronglyDvdAt f p 1 a ↔ (p : ℤ) ∣ MvPolynomial.eval a f := sorry

/-- `W_p(V)`: integral binary quartic forms with `p^2 ∣ Δ`. -/
def quarticW (p : ℕ) : Set (BinaryQuartic ℤ) := {f | (p : ℤ) ^ 2 ∣ f.disc}

/-- `W_p^(1)(V)`: `Δ` is strongly divisible by `p^2`. -/
def quarticW1 (p : ℕ) : Set (BinaryQuartic ℤ) :=
  {f | StronglyDvdAt quarticDiscPoly p 2 f.coeffs}

/-- `W_p^(2)(V)`: `Δ` is weakly divisible by `p^2`. -/
def quarticW2 (p : ℕ) : Set (BinaryQuartic ℤ) := quarticW p \ quarticW1 p

/-- `W_p(U)`: integral binary cubic forms with `p^2 ∣ Disc`. -/
def cubicW (p : ℕ) : Set (BinaryCubicForm ℤ) := {f | (p : ℤ) ^ 2 ∣ f.disc}

/-- `W_p^(1)(U)`. -/
def cubicW1 (p : ℕ) : Set (BinaryCubicForm ℤ) :=
  {f | StronglyDvdAt cubicDiscPoly p 2 f.coeffs}

/-- `W_p^(2)(U)`. -/
def cubicW2 (p : ℕ) : Set (BinaryCubicForm ℤ) := cubicW p \ cubicW1 p

theorem quarticW_smul (p : ℕ) (γ : GL (Fin 2) ℤ) (f : BinaryQuartic ℤ) (g : BinaryCubicForm ℤ) :
    (γ • f ∈ quarticW p ↔ f ∈ quarticW p) ∧ (γ • f ∈ quarticW1 p ↔ f ∈ quarticW1 p) ∧
    (γ • g ∈ cubicW p ↔ g ∈ cubicW p) :=
  sorry

/-- The splitting types `(1^3 1)`, `(1^2 1^2)`, `(2^2)`, `(1^4)` of a reduction modulo `p`:
`f̄ = c·q^2` with `q` quadratic, or `f̄ = ℓ^3·m` with `ℓ, m` linear. -/
def IsStrongSplittingType (p : ℕ) (f : BinaryQuartic ℤ) : Prop :=
  (∃ (q : MvPolynomial (Fin 2) (ZMod p)) (c : ZMod p), q.IsHomogeneous 2 ∧
      (f.map (Int.castRingHom (ZMod p))).toMvPolynomial = MvPolynomial.C c * q ^ 2) ∨
    ∃ ℓ m : MvPolynomial (Fin 2) (ZMod p), ℓ.IsHomogeneous 1 ∧ m.IsHomogeneous 1 ∧
      (f.map (Int.castRingHom (ZMod p))).toMvPolynomial = ℓ ^ 3 * m

theorem quarticW1_iff_splittingType {p : ℕ} (hp : p.Prime) (h3 : 3 ≤ p) (f : BinaryQuartic ℤ) :
    f ∈ quarticW1 p ↔ (∀ i, (p : ℤ) ∣ f.coeffs i) ∨ IsStrongSplittingType p f := sorry

theorem cubicW1_iff_tripleRoot {p : ℕ} (hp : p.Prime) (h3 : 3 ≤ p) (f : BinaryCubicForm ℤ) :
    f ∈ cubicW1 p ↔ (∀ i, (p : ℤ) ∣ f.coeffs i) ∨
      ∃ c u v : ZMod p, f.map (Int.castRingHom (ZMod p)) =
        ⟨c * u ^ 3, 3 * c * u ^ 2 * v, 3 * c * u * v ^ 2, c * v ^ 3⟩ := sorry

/-- Unit test `ArithmeticStatistics.WeaklyDvdAt.quartic_example`: `25x^4 + x^2y^2 + y^4` is weakly
divisible at `5` although `5 ∣ ∂Δ/∂e`. -/
example : WeaklyDvdAt quarticDiscPoly 5 2 ![25, 0, 1, 0, 1] ∧
    (⟨25, 0, 1, 0, 1⟩ : BinaryQuartic ℤ).disc = 3920400 ∧
    (5 : ℤ) ∣ MvPolynomial.eval ![25, 0, 1, 0, 1] (MvPolynomial.pderiv 4 quarticDiscPoly) :=
  sorry

/-- Unit test `ArithmeticStatistics.StronglyDvdAt.quartic_example`: `x^3y + 5y^4` has `Δ = −675` and
lies in `W_5^(1)(V)`. -/
example : (⟨0, 1, 0, 0, 5⟩ : BinaryQuartic ℤ).disc = -675 ∧
    (⟨0, 1, 0, 0, 5⟩ : BinaryQuartic ℤ) ∈ quarticW1 5 := sorry

/-- Unit test `ArithmeticStatistics.StronglyDvdAt.one`: there are no weak multiples of `p`. -/
example {n : ℕ} (f : MvPolynomial (Fin n) ℤ) (p : ℕ) (a : Fin n → ℤ) :
    StronglyDvdAt f p 1 a ↔ (p : ℤ) ∣ MvPolynomial.eval a f := sorry

/-- Unit test `ArithmeticStatistics.WeaklyDvdAt.cubic_example`: `25x^3 + xy^2 + y^3 ∈ W_5^(2)(U)`. -/
example : (⟨25, 0, 1, 1⟩ : BinaryCubicForm ℤ) ∈ cubicW2 5 ∧
    (⟨25, 0, 1, 1⟩ : BinaryCubicForm ℤ).disc = -25 * 679 := sorry

/-- Unit test `ArithmeticStatistics.quarticW1_iff_splittingType.two`: at `p = 2` the description
fails for `x^2y^2 + xy^3`. -/
example : (⟨0, 0, 1, 1, 0⟩ : BinaryQuartic ℤ) ∈ quarticW1 2 ∧
    ¬ (∀ i, (2 : ℤ) ∣ (⟨0, 0, 1, 1, 0⟩ : BinaryQuartic ℤ).coeffs i) ∧
    ¬ IsStrongSplittingType 2 ⟨0, 0, 1, 1, 0⟩ := sorry

/-- Unit test `ArithmeticStatistics.StronglyDvdAt.pVZ`: `pV_ℤ ⊆ W_p^(1)(V)`. -/
example (p : ℕ) (g : BinaryQuartic ℤ) : BinaryQuartic.scale (p : ℤ) g ∈ quarticW1 p := sorry

/-! ## The codimension-two locus and local densities -/

/-- The closed subscheme `V(f, ∂f/∂x_n)`. -/
def pderivLocus {n : ℕ} (f : MvPolynomial (Fin (n + 1)) ℤ) :
    Ideal (MvPolynomial (Fin (n + 1)) ℤ) :=
  Ideal.span {f, MvPolynomial.pderiv (Fin.last n) f}

/-- Primitive integral polynomials: no prime divides every coefficient. -/
def IsPrimitivePoly {σ : Type*} (f : MvPolynomial σ ℤ) : Prop :=
  ∀ p : ℕ, p.Prime → ∃ m, ¬ (p : ℤ) ∣ f.coeff m

/-- Lemma 3.6 of the geometric sieve, part (a)
(ArithmeticStatistics:ST.2/strong-divisibility-lies-on-a-codimension-two-locus). -/
theorem reduceMod_mem_pderivLocus_of_stronglyDvdAt {n : ℕ} (f : MvPolynomial (Fin (n + 1)) ℤ)
    {p : ℕ} (hp : p.Prime) (a : Fin (n + 1) → ℤ) (h : StronglyDvdAt f p 2 a) :
    reduceMod p a ∈ zeroLocusModP (pderivLocus f) p := sorry

/-- Lemma 3.6, part (b): `V(f, ∂f/∂x_n)` has codimension two. -/
theorem ringKrullDim_pderivLocus_le {n : ℕ} (f : MvPolynomial (Fin (n + 1)) ℤ)
    (hf : IsPrimitivePoly f)
    (hcop : IsRelPrime (MvPolynomial.map (Int.castRingHom ℚ) f)
      (MvPolynomial.map (Int.castRingHom ℚ) (MvPolynomial.pderiv (Fin.last n) f))) :
    ringKrullDim (MvPolynomial (Fin (n + 1)) ℤ ⧸ pderivLocus f) ≤ ((n : ℕ) : WithBot ℕ∞) :=
  sorry

/-- `Δ` and `Disc` are primitive and coprime to their last partial derivatives
(ArithmeticStatistics:ST.2/discriminant-loci-of-codimension-two). -/
theorem discriminants_primitive_and_relPrime_pderiv :
    IsPrimitivePoly quarticDiscPoly ∧
    IsRelPrime (MvPolynomial.map (Int.castRingHom ℚ) quarticDiscPoly)
      (MvPolynomial.map (Int.castRingHom ℚ) (MvPolynomial.pderiv (Fin.last 4) quarticDiscPoly)) ∧
    IsPrimitivePoly cubicDiscPoly ∧
    IsRelPrime (MvPolynomial.map (Int.castRingHom ℚ) cubicDiscPoly)
      (MvPolynomial.map (Int.castRingHom ℚ) (MvPolynomial.pderiv (Fin.last 3) cubicDiscPoly)) :=
  sorry

/-- The `p`-adic density of `{p^2 ∣ f}` is `O(p^{-2})`
(ArithmeticStatistics:ST.2/local-density-of-values-divisible-by-p-squared). -/
theorem ncard_sq_dvd_le {n : ℕ} (f : MvPolynomial (Fin (n + 1)) ℤ) (hf : IsPrimitivePoly f)
    (hcop : IsRelPrime (MvPolynomial.map (Int.castRingHom ℚ) f)
      (MvPolynomial.map (Int.castRingHom ℚ) (MvPolynomial.pderiv (Fin.last n) f))) :
    ∃ C : ℝ, ∀ p : ℕ, p.Prime →
      (Set.ncard {v : Fin (n + 1) → ZMod (p ^ 2) |
          MvPolynomial.eval v (MvPolynomial.map (Int.castRingHom (ZMod (p ^ 2))) f) = 0} : ℝ) ≤
        C * (p : ℝ) ^ (2 * (n + 1) - 2) := sorry

/-! ## Functions defined by congruence conditions
(ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions) -/

/-- The Haar probability measure on `ℤ_p^n` (for the Borel structure). -/
def padicHaar (p : ℕ) [Fact p.Prime] (n : ℕ) :
    @Measure (Fin n → ℤ_[p]) (@MeasurableSpace.pi (Fin n) (fun _ => ℤ_[p]) (fun _ => borel ℤ_[p])) :=
  letI : MeasurableSpace ℤ_[p] := borel ℤ_[p]
  haveI : BorelSpace ℤ_[p] := ⟨rfl⟩
  Measure.addHaarMeasure ⊤

/-- The data `(φ_p)_p` of a function defined by congruence conditions on `ℤ^n`. -/
structure CongruenceConditions (n : ℕ) where
  /-- The local factor `φ_p : ℤ_p^n → [0, 1]`. -/
  localFun : (p : ℕ) → [Fact p.Prime] → (Fin n → ℤ_[p]) → ℝ
  nonneg : ∀ (p : ℕ) [Fact p.Prime] (v : Fin n → ℤ_[p]), 0 ≤ localFun p v
  le_one : ∀ (p : ℕ) [Fact p.Prime] (v : Fin n → ℤ_[p]), localFun p v ≤ 1
  /-- Condition (2): `φ_p` is locally constant outside a closed null set. -/
  locallyConstant : ∀ (p : ℕ) [Fact p.Prime], ∃ S : Set (Fin n → ℤ_[p]), IsClosed S ∧
    padicHaar p n S = 0 ∧ ∀ v ∉ S, ∀ᶠ w in 𝓝 v, localFun p w = localFun p v

namespace CongruenceConditions

variable {n : ℕ}

/-- The global function `φ(v) = ∏_p φ_p(v)`, as the limit of the partial products (condition (1)
says that this limit exists). -/
def toFun (φ : CongruenceConditions n) (v : Fin n → ℤ) : ℝ :=
  limUnder atTop fun N : ℕ =>
    ∏ p ∈ (Finset.range N).filter Nat.Prime,
      (haveI : Fact p.Prime := ⟨sorry⟩; φ.localFun p (fun i => (v i : ℤ_[p])))

/-- The local mass `∫ φ_p dμ_p`. -/
def localMass (φ : CongruenceConditions n) (p : ℕ) [Fact p.Prime] : ℝ :=
  letI : MeasurableSpace ℤ_[p] := borel ℤ_[p]
  ∫ v, φ.localFun p v ∂(padicHaar p n)

/-- Acceptability for a polynomial `f`: `φ_p = 1` off `{p^2 ∣ f}` for large `p`. -/
def IsAcceptable (φ : CongruenceConditions n) (f : MvPolynomial (Fin n) ℤ) : Prop :=
  ∃ p₀ : ℕ, ∀ (p : ℕ) [Fact p.Prime], p₀ < p → ∀ v : Fin n → ℤ_[p],
    ¬ (p : ℤ_[p]) ^ 2 ∣ MvPolynomial.eval v (MvPolynomial.map (Int.castRingHom ℤ_[p]) f) →
      φ.localFun p v = 1

/-- The presentation `φ_p = 1_{p^2 ∤ f}` of the characteristic function of `{f squarefree}`. -/
def squarefree (f : MvPolynomial (Fin n) ℤ) : CongruenceConditions n where
  localFun p _ v :=
    if (p : ℤ_[p]) ^ 2 ∣ MvPolynomial.eval v (MvPolynomial.map (Int.castRingHom ℤ_[p]) f)
    then 0 else 1
  nonneg := sorry
  le_one := sorry
  locallyConstant := sorry

/-- A set defined by congruence conditions modulo finitely many prime powers: at each prime `p`
in `P` the residues modulo `p ^ k p` allowed, and no condition elsewhere. -/
def ofResidues (P : Finset ℕ) (k : ℕ → ℕ)
    (allowed : (p : ℕ) → Set (Fin n → ZMod (p ^ k p))) : CongruenceConditions n where
  localFun p _ v :=
    if p ∈ P then
      (if (fun i => PadicInt.toZModPow (k p) (v i)) ∈ allowed p then 1 else 0)
    else 1
  nonneg := sorry
  le_one := sorry
  locallyConstant := sorry

/-- The pointwise product of two presentations. -/
def mul (φ ψ : CongruenceConditions n) : CongruenceConditions n where
  localFun p _ v := φ.localFun p v * ψ.localFun p v
  nonneg := sorry
  le_one := sorry
  locallyConstant := sorry

theorem squarefree_isAcceptable (f : MvPolynomial (Fin n) ℤ) :
    (squarefree f).IsAcceptable f := sorry

theorem localMass_ofResidues (P : Finset ℕ) (k : ℕ → ℕ)
    (allowed : (p : ℕ) → Set (Fin n → ZMod (p ^ k p))) (p : ℕ) [Fact p.Prime] (hp : p ∈ P) :
    (ofResidues P k allowed).localMass p = (Set.ncard (allowed p) : ℝ) / (p : ℝ) ^ (k p * n) :=
  sorry

theorem one_sub_localMass_le (φ : CongruenceConditions n) (f : MvPolynomial (Fin n) ℤ)
    (hφ : φ.IsAcceptable f) : ∃ p₀ : ℕ, ∀ (p : ℕ) [Fact p.Prime], p₀ < p →
      1 - φ.localMass p ≤ 1 - (squarefree f).localMass p := sorry

theorem mul_isAcceptable (φ ψ : CongruenceConditions n) (f : MvPolynomial (Fin n) ℤ)
    (hφ : φ.IsAcceptable f) (hψ : ψ.IsAcceptable f) : (φ.mul ψ).IsAcceptable f := sorry

/-- Unit test `ArithmeticStatistics.CongruenceConditions.squarefree_localMass`: for `f = x`,
`∫ φ_p = 1 − p^{-2}`. -/
example (p : ℕ) [Fact p.Prime] :
    (squarefree (MvPolynomial.X 0 : MvPolynomial (Fin 1) ℤ)).localMass p = 1 - (p : ℝ) ^ (-2 : ℤ) :=
  sorry

/-- Unit test `ArithmeticStatistics.CongruenceConditions.one_localMass`: the constant presentation. -/
example (p : ℕ) [Fact p.Prime] :
    (ofResidues (n := n) ∅ (fun _ => 0) (fun _ => Set.univ)).localMass p = 1 := sorry

/-- Unit test `ArithmeticStatistics.CongruenceConditions.square_not_acceptable`: the indicator of
the squares is defined by congruence conditions but is not acceptable. -/
example (φ : CongruenceConditions 1)
    (hφ : ∀ (p : ℕ) [Fact p.Prime] (v : Fin 1 → ℤ_[p]),
      φ.localFun p v = if IsSquare (v 0) then 1 else 0) :
    ¬ φ.IsAcceptable (MvPolynomial.X 0) := sorry

/-- Unit test `ArithmeticStatistics.CongruenceConditions.ofResidues_prod`: for a set defined
modulo `m = ∏ p^{k_p}`, the product of the local masses is `#(S mod m)/m^n`. -/
example (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime) (k : ℕ → ℕ)
    (allowed : (p : ℕ) → Set (Fin n → ZMod (p ^ k p))) :
    ∏ p ∈ P.attach, (haveI : Fact (p : ℕ).Prime := ⟨hP p p.2⟩;
      (ofResidues P k allowed).localMass p) =
      ∏ p ∈ P, (Set.ncard (allowed p) : ℝ) / (p : ℝ) ^ (k p * n) := sorry

end CongruenceConditions

/-! ## Reduction theory for binary quartic forms -/

/-- The index set `T = {0, 1, 2+, 2−}` of real root types
(ArithmeticStatistics:ST.2/real-root-types-of-binary-quartic-forms). -/
inductive QuarticRealType
  | zero
  | one
  | twoPos
  | twoNeg
  deriving DecidableEq

/-- The number of real roots in `ℙ^1(ℝ)` (with multiplicity), counting `[1 : 0]` when `a = 0`. -/
def realRootCount (f : BinaryQuartic ℝ) : ℕ :=
  Multiset.card f.dehomogenize.roots + if f.a = 0 then 1 else 0

/-- The loci `V_ℝ^(i)`. -/
def quarticLocus : QuarticRealType → Set (BinaryQuartic ℝ)
  | .zero => {f | f.disc ≠ 0 ∧ realRootCount f = 4}
  | .one => {f | f.disc ≠ 0 ∧ realRootCount f = 2}
  | .twoPos => {f | f.disc ≠ 0 ∧ ∀ x y : ℝ, (x, y) ≠ (0, 0) → 0 < f.eval x y}
  | .twoNeg => {f | f.disc ≠ 0 ∧ ∀ x y : ℝ, (x, y) ≠ (0, 0) → f.eval x y < 0}

/-- `V_ℤ^(i)`. -/
def intQuarticLocus (i : QuarticRealType) : Set (BinaryQuartic ℤ) :=
  {f | f.map (Int.castRingHom ℝ) ∈ quarticLocus i}

theorem mem_quarticLocus_iff_realRoots (f : BinaryQuartic ℝ) :
    (f ∈ quarticLocus .zero ↔ f.disc ≠ 0 ∧ realRootCount f = 4) ∧
    (f ∈ quarticLocus .one ↔ f.disc ≠ 0 ∧ realRootCount f = 2) ∧
    (f ∈ quarticLocus .twoPos ∪ quarticLocus .twoNeg ↔
      f.disc ≠ 0 ∧ realRootCount f = 0) := sorry

theorem disc_pos_of_mem_quarticLocus (f : BinaryQuartic ℝ) (i : QuarticRealType)
    (hf : f ∈ quarticLocus i) : (i = .one → f.disc < 0) ∧ (i ≠ .one → 0 < f.disc) :=
  sorry

theorem iUnion_quarticLocus :
    (⋃ i, quarticLocus i) = {f | f.disc ≠ 0} ∧
      Pairwise (fun i j => Disjoint (quarticLocus i) (quarticLocus j)) := sorry

theorem isOpen_quarticLocus (i : QuarticRealType) :
    IsOpen (BinaryQuartic.ofCoeffs ⁻¹' quarticLocus i) := sorry

theorem smul_mem_quarticLocus_iff (i : QuarticRealType) (γ : Matrix (Fin 2) (Fin 2) ℝ)
    (hγ : γ.det ≠ 0) (f : BinaryQuartic ℝ) :
    BinaryQuartic.subst γ f ∈ quarticLocus i ↔ f ∈ quarticLocus i :=
  sorry

theorem neg_mem_quarticLocus_twoPos_iff (f : BinaryQuartic ℝ) :
    f.scale (-1) ∈ quarticLocus .twoNeg ↔ f ∈ quarticLocus .twoPos := sorry

/-- Unit test `ArithmeticStatistics.quarticLocus.example_zero`. -/
example : (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℝ) ∈ quarticLocus .zero ∧
    (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℝ).disc = 4 := sorry

/-- Unit test `ArithmeticStatistics.quarticLocus.example_one`. -/
example : (⟨0, 1, 0, 1, 0⟩ : BinaryQuartic ℝ) ∈ quarticLocus .one ∧
    (⟨0, 1, 0, 1, 0⟩ : BinaryQuartic ℝ).disc = -4 := sorry

/-- Unit test `ArithmeticStatistics.quarticLocus.example_twoPos`. -/
example : (⟨1, 0, 0, 0, 1⟩ : BinaryQuartic ℝ) ∈ quarticLocus .twoPos ∧
    (⟨-1, 0, 0, 0, -1⟩ : BinaryQuartic ℝ) ∈ quarticLocus .twoNeg ∧
    (⟨1, 0, 0, 0, 1⟩ : BinaryQuartic ℝ).disc = 256 := sorry

/-- Unit test `ArithmeticStatistics.quarticLocus.not_sign_disc`: the sign of `Δ` does not separate
the loci. -/
example : 0 < (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℝ).disc ∧
    0 < (⟨1, 0, 0, 0, 1⟩ : BinaryQuartic ℝ).disc ∧
    (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℝ) ∉ quarticLocus .twoPos ∧
    (⟨1, 0, 0, 0, 1⟩ : BinaryQuartic ℝ) ∉ quarticLocus .zero := sorry

/-- Unit test `ArithmeticStatistics.quarticLocus.degenerate`: `x^2y^2` lies in no locus. -/
example (i : QuarticRealType) : (⟨0, 0, 1, 0, 0⟩ : BinaryQuartic ℝ) ∉ quarticLocus i := sorry

/-- The weights `n_i` (half the order of the real stabiliser). -/
def quarticStabWeight : QuarticRealType → ℕ
  | .zero => 4
  | .one => 2
  | .twoPos => 4
  | .twoNeg => 4

/-- Real orbits with fixed invariants, Δ < 0: one `SL_2^±(ℝ)`-orbit
(ArithmeticStatistics:ST.2/real-orbits-of-binary-quartic-forms-with-fixed-invariants (a)). -/
theorem real_orbit_of_disc_neg (f g : BinaryQuartic ℝ) (hI : f.invI = g.invI)
    (hJ : f.invJ = g.invJ) (hΔ : f.disc < 0) :
    f ∈ quarticLocus .one ∧ ∃ γ : Matrix (Fin 2) (Fin 2) ℝ,
      (γ.det = 1 ∨ γ.det = -1) ∧ BinaryQuartic.subst γ f = g := sorry

/-- Real orbits with fixed invariants, Δ > 0: one orbit in each of `V^(0)`, `V^(2±)` (part (b)). -/
theorem real_orbit_of_disc_pos (i : QuarticRealType) (hi : i ≠ .one) (I₀ J₀ : ℝ)
    (hΔ : 0 < 4 * I₀ ^ 3 - J₀ ^ 2) :
    (∃ f ∈ quarticLocus i, f.invI = I₀ ∧ f.invJ = J₀) ∧
      ∀ f ∈ quarticLocus i, ∀ g ∈ quarticLocus i, f.invI = I₀ → f.invJ = J₀ →
        g.invI = I₀ → g.invJ = J₀ → ∃ γ : Matrix (Fin 2) (Fin 2) ℝ,
          (γ.det = 1 ∨ γ.det = -1) ∧ BinaryQuartic.subst γ f = g := sorry

/-- Part (c): `GL_2(ℝ)`-equivalence within a locus is proportionality of `(I, J)` with weights. -/
theorem gl2_equiv_iff_invariants_proportional (i : QuarticRealType) (f g : BinaryQuartic ℝ)
    (hf : f ∈ quarticLocus i) (hg : g ∈ quarticLocus i) :
    (∃ γ : Matrix (Fin 2) (Fin 2) ℝ, γ.det ≠ 0 ∧ BinaryQuartic.subst γ f = g) ↔
      ∃ l : ℝ, 0 < l ∧ g.invI = l ^ 2 * f.invI ∧ g.invJ = l ^ 3 * f.invJ := sorry

/-- Lemma 2.2 (ArithmeticStatistics:ST.2/stabilizers-of-real-binary-quartic-forms). -/
theorem ncard_stabilizer_quartic (i : QuarticRealType) (f : BinaryQuartic ℝ)
    (hf : f ∈ quarticLocus i) :
    Set.ncard {γ : Matrix (Fin 2) (Fin 2) ℝ | γ.det ≠ 0 ∧ BinaryQuartic.subst γ f = f} =
      2 * quarticStabWeight i := sorry

/-! ### The fundamental sets of Table 1
(ArithmeticStatistics:ST.2/fundamental-sets-for-real-binary-quartic-orbits) -/

/-- The fundamental sets `L^(i)`. -/
def quarticFundSet : QuarticRealType → Set (BinaryQuartic ℝ)
  | .zero => (fun J : ℝ => ⟨0, 1, 0, -1 / 3, -J / 27⟩) '' Set.Ioo (-2) 2
  | .one => ((fun I : ℝ => ⟨0, 1, 0, -I / 3, 2 / 27⟩) '' Set.Ico (-1) 1) ∪
      ((fun I : ℝ => ⟨0, 1, 0, -I / 3, -2 / 27⟩) '' Set.Ico (-1) 1) ∪
      ((fun J : ℝ => ⟨0, 1, 0, 1 / 3, -J / 27⟩) '' Set.Ioo (-2) 2)
  | .twoPos => (fun J : ℝ => ⟨1 / 16, -Real.sqrt (2 - J) / (3 * Real.sqrt 3), 1 / 2, 0, 1⟩) ''
      Set.Ioo (-2) 2
  | .twoNeg => (fun J : ℝ => BinaryQuartic.scale (-1)
      ⟨1 / 16, -Real.sqrt (2 - J) / (3 * Real.sqrt 3), 1 / 2, 0, 1⟩) '' Set.Ioo (-2) 2

/-- The sign condition on invariant pairs attached to a root type. -/
def invariantSignSet (i : QuarticRealType) : Set (ℝ × ℝ) :=
  if i = .one then {q | 4 * q.1 ^ 3 - q.2 ^ 2 < 0} else {q | 0 < 4 * q.1 ^ 3 - q.2 ^ 2}

theorem quarticFundSet_subset_locus (i : QuarticRealType) : quarticFundSet i ⊆ quarticLocus i :=
  sorry

theorem height_eq_one_of_mem_quarticFundSet (i : QuarticRealType) (f : BinaryQuartic ℝ)
    (hf : f ∈ quarticFundSet i) :
    BinaryQuartic.pairHeight f.invI f.invJ = 1 := sorry

theorem invariants_bijOn_quarticFundSet (i : QuarticRealType) :
    Set.BijOn (fun f : BinaryQuartic ℝ => (f.invI, f.invJ)) (quarticFundSet i)
      ({q : ℝ × ℝ | BinaryQuartic.pairHeight q.1 q.2 = 1} ∩ invariantSignSet i) := sorry

theorem existsUnique_smul_mem_quarticFundSet (i : QuarticRealType) (h : Matrix (Fin 2) (Fin 2) ℝ)
    (hh : h.det ≠ 0) (f : BinaryQuartic ℝ) (hf : f ∈ quarticLocus i) :
    ∃! f' ∈ BinaryQuartic.subst h '' quarticFundSet i,
      ∃ γ : Matrix (Fin 2) (Fin 2) ℝ, γ.det ≠ 0 ∧ BinaryQuartic.subst γ f' = f := sorry

theorem abs_coeff_le_one_of_mem_quarticFundSet (i : QuarticRealType) (f : BinaryQuartic ℝ)
    (hf : f ∈ quarticFundSet i) (j : Fin 5) : |f.coeffs j| ≤ 1 := sorry

/-- The section `p^(i)_{I,J}` of the invariant map with values in `R^(i) = Λ·L^(i)`. -/
def quarticSection (i : QuarticRealType) (I J : ℝ) : BinaryQuartic ℝ := sorry

theorem invariants_quarticSection (i : QuarticRealType) (I J : ℝ)
    (h : (I, J) ∈ invariantSignSet i) :
    (quarticSection i I J).invI = I ∧ (quarticSection i I J).invJ = J ∧
      ∃ l : ℝ, 0 < l ∧ BinaryQuartic.scale l⁻¹ (quarticSection i I J) ∈ quarticFundSet i := sorry

/-- Unit test `ArithmeticStatistics.quarticFundSet.zero_example`. -/
example : (⟨0, 1, 0, -1 / 3, 0⟩ : BinaryQuartic ℝ) ∈ quarticFundSet .zero ∧
    (⟨0, 1, 0, -1 / 3, 0⟩ : BinaryQuartic ℝ).invI = 1 ∧
    (⟨0, 1, 0, -1 / 3, 0⟩ : BinaryQuartic ℝ).invJ = 0 := sorry

/-- Unit test `ArithmeticStatistics.quarticFundSet.one_boundary`. -/
example : (⟨0, 1, 0, 1 / 3, -2 / 27⟩ : BinaryQuartic ℝ) ∈ quarticFundSet .one ∧
    (⟨0, 1, 0, 1 / 3, -2 / 27⟩ : BinaryQuartic ℝ).invI = -1 ∧
    (⟨0, 1, 0, 1 / 3, -2 / 27⟩ : BinaryQuartic ℝ).invJ = 2 := sorry

/-- Unit test `ArithmeticStatistics.quarticFundSet.not_boundary`: the pair `(1, 2)` (with `Δ = 0`)
is not attained. -/
example (i : QuarticRealType) (f : BinaryQuartic ℝ) (hf : f ∈ quarticFundSet i) :
    (f.invI, f.invJ) ≠ (1, 2) := sorry

/-- Unit test `ArithmeticStatistics.quarticFundSet.twoNeg`. -/
example : quarticFundSet .twoNeg = BinaryQuartic.scale (-1) '' quarticFundSet .twoPos ∧
    ∀ f : BinaryQuartic ℝ, (f.scale (-1)).invI = f.invI ∧
      (f.scale (-1)).invJ = -f.invJ := sorry

/-! ### Gauss's domain (ArithmeticStatistics:ST.2/gauss-fundamental-domain-in-iwasawa-coordinates) -/

/-- `n(u)`. -/
def iwasawaN (u : ℝ) : Matrix (Fin 2) (Fin 2) ℝ := !![1, 0; u, 1]

/-- `a(t)`. -/
def iwasawaA (t : ℝ) : Matrix (Fin 2) (Fin 2) ℝ := !![t⁻¹, 0; 0, t]

/-- `k(θ)`. -/
def iwasawaK (θ : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![Real.cos θ, Real.sin θ; -Real.sin θ, Real.cos θ]

/-- The matrix with Iwasawa coordinates `(u, t, θ, λ)`. -/
def iwasawaMatrix (q : ℝ × ℝ × ℝ × ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  q.2.2.2 • (iwasawaN q.1 * iwasawaA q.2.1 * iwasawaK q.2.2.1)

/-- The coordinate region `N′(t)A′K_+Λ`. -/
def gaussCoords : Set (ℝ × ℝ × ℝ × ℝ) :=
  {q | 0 < q.2.1 ∧ 0 < q.2.2.2 ∧ |q.1| ≤ 1 / 2 ∧ 1 ≤ q.1 ^ 2 + q.2.1 ^ 4 ∧
    0 ≤ q.2.2.1 ∧ q.2.2.1 < Real.pi}

/-- Gauss's domain `F = N′(t)A′K_+Λ` (strict: `θ ∈ [0, π)`). -/
def gaussDomain : Set (Matrix (Fin 2) (Fin 2) ℝ) := iwasawaMatrix '' gaussCoords

/-- The Haar measure `t^{-2} du d^×t dk d^×λ` in Iwasawa coordinates (`dk = dθ/2π`). -/
def gaussDomain_haar : Measure (ℝ × ℝ × ℝ × ℝ) :=
  volume.withDensity fun q => ENNReal.ofReal (q.2.1 ^ (-3 : ℤ) * q.2.2.2⁻¹ / (2 * Real.pi))

theorem iwasawa_existsUnique (g : Matrix (Fin 2) (Fin 2) ℝ) (hg : 0 < g.det) :
    ∃! q : ℝ × ℝ × ℝ × ℝ, 0 < q.2.1 ∧ 0 < q.2.2.2 ∧ 0 ≤ q.2.2.1 ∧ q.2.2.1 < 2 * Real.pi ∧
      g = iwasawaMatrix q := sorry

theorem mem_gaussDomain_iff (u t θ l : ℝ) (ht : 0 < t) (hl : 0 < l) (hθ : 0 ≤ θ)
    (hθ' : θ < 2 * Real.pi) :
    iwasawaMatrix (u, t, θ, l) ∈ gaussDomain ↔
      UpperHalfPlane.mk ⟨-u, t ^ 2⟩ (pow_pos ht 2) ∈ ModularGroup.fd ∧
        θ < Real.pi := sorry

/-- `F` is a fundamental domain for `GL_2(ℤ)` on `GL_2(ℝ)`: every class meets it, and a point of
its interior meets its class only once. -/
theorem isFundamentalDomain_gaussDomain :
    (∀ g : Matrix (Fin 2) (Fin 2) ℝ, g.det ≠ 0 → ∃ γ : GL (Fin 2) ℤ,
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast : ℤ → ℝ)) * g ∈ gaussDomain) ∧
    ∀ q ∈ interior gaussCoords, ∀ γ : GL (Fin 2) ℤ,
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast : ℤ → ℝ)) * iwasawaMatrix q ∈ gaussDomain →
        γ = 1 := sorry

theorem neg_mem_gaussDomain_iff (g : Matrix (Fin 2) (Fin 2) ℝ) (hg : g ∈ gaussDomain) :
    -g ∉ gaussDomain := sorry

/-- Unit test `ArithmeticStatistics.gaussDomain.one_mem`. -/
example : (1 : Matrix (Fin 2) (Fin 2) ℝ) ∈ gaussDomain := sorry

/-- Unit test `ArithmeticStatistics.gaussDomain.neg_one_not_mem`. -/
example : (-1 : Matrix (Fin 2) (Fin 2) ℝ) ∉ gaussDomain := sorry

/-- Unit test `ArithmeticStatistics.gaussDomain.det_pos`. -/
example (g : Matrix (Fin 2) (Fin 2) ℝ) (hg : g ∈ gaussDomain) : 0 < g.det ∧
    (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) ℝ) ∉ gaussDomain := sorry

/-- Unit test `ArithmeticStatistics.gaussDomain.nu_full`. -/
example (u t : ℝ) (ht : 1 ≤ t) :
    iwasawaMatrix (u, t, 0, 1) ∈ gaussDomain ↔ |u| ≤ 1 / 2 := sorry

/-- The hyperbolic area of the standard domain is `π/3`
(ArithmeticStatistics:ST.2/hyperbolic-area-of-the-modular-fundamental-domain). -/
theorem volume_fd_eq : (volume : Measure UpperHalfPlane) ModularGroup.fd =
    ENNReal.ofReal (Real.pi / 3) := sorry

/-- `Vol_ω(PGL_2(ℤ)\PGL_2(ℝ)) = 2ζ(2)` in coordinates, and the Iwasawa-measure volume `π/12`
(ArithmeticStatistics:ST.2/covolume-of-pgl2-z). -/
theorem covolume_pgl2 :
    (∫⁻ q in {q : ℝ × ℝ × ℝ | 0 < q.2.1 ∧ |q.1| ≤ 1 / 2 ∧ 1 ≤ q.1 ^ 2 + q.2.1 ^ 4 ∧
        0 ≤ q.2.2 ∧ q.2.2 < Real.pi}, ENNReal.ofReal (2 * q.2.1 ^ (-3 : ℤ))) =
        ENNReal.ofReal (Real.pi ^ 2 / 3) ∧
      2 * riemannZeta 2 = ((Real.pi ^ 2 / 3 : ℝ) : ℂ) ∧
      (∫⁻ q in {q : ℝ × ℝ × ℝ | 0 < q.2.1 ∧ |q.1| ≤ 1 / 2 ∧ 1 ≤ q.1 ^ 2 + q.2.1 ^ 4 ∧
        0 ≤ q.2.2 ∧ q.2.2 < Real.pi},
          ENNReal.ofReal (q.2.1 ^ (-3 : ℤ) / (2 * Real.pi))) = ENNReal.ofReal (Real.pi / 12) :=
  sorry

/-- The multiplicity of `x` in the multiset `F h·L^(i)`. -/
def quarticMultiplicity (h : Matrix (Fin 2) (Fin 2) ℝ) (i : QuarticRealType)
    (x : BinaryQuartic ℝ) : ℕ :=
  Set.ncard {g ∈ gaussDomain | ∃ ℓ ∈ quarticFundSet i, BinaryQuartic.subst (g * h) ℓ = x}

/-- (8): the class of `x` is represented `#Stab_ℝ(x)/#Stab_ℤ(x)` times in `F h·L^(i)`
(ArithmeticStatistics:ST.2/orbit-multiplicities-in-fundamental-multisets). -/
theorem sum_quarticMultiplicity_orbit (i : QuarticRealType) (h : Matrix (Fin 2) (Fin 2) ℝ)
    (hh : h.det ≠ 0) (x : BinaryQuartic ℝ) (hx : x ∈ quarticLocus i) :
    (∑ᶠ x' ∈ {x' | ∃ γ : GL (Fin 2) ℤ,
        BinaryQuartic.subst ((γ : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast : ℤ → ℝ)) x = x'},
      quarticMultiplicity h i x') * Set.ncard {γ : GL (Fin 2) ℤ |
        BinaryQuartic.subst ((γ : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast : ℤ → ℝ)) x = x} =
      2 * quarticStabWeight i := sorry

/-! ## Counting binary quartic forms -/

/-- The averaged count `N(S; X)` of (11), with `G₀` given in Iwasawa coordinates
(ArithmeticStatistics:ST.2/averaged-count-of-binary-quartic-orbits). -/
def quarticAveragedCount (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType)
    (S : Set (BinaryQuartic ℤ)) (X : ℝ) : ℝ :=
  (∫ q in G₀, ∑ᶠ x ∈ {x : BinaryQuartic ℤ | x ∈ S ∧ x.IsIrreducibleOverQ ∧
      x.height < X}, (quarticMultiplicity (iwasawaMatrix q) i (x.map (Int.castRingHom ℝ)) : ℝ)
    ∂gaussDomain_haar) / (quarticStabWeight i * (gaussDomain_haar G₀).toReal)

/-- The weighted averaged count `N_φ(S; X)`. -/
def quarticAveragedCount_weighted (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType)
    (φ : BinaryQuartic ℤ → ℝ) (S : Set (BinaryQuartic ℤ)) (X : ℝ) : ℝ :=
  (∫ q in G₀, ∑ᶠ x ∈ {x : BinaryQuartic ℤ | x ∈ S ∧ x.IsIrreducibleOverQ ∧
      x.height < X}, φ x * (quarticMultiplicity (iwasawaMatrix q) i (x.map (Int.castRingHom ℝ)) : ℝ)
    ∂gaussDomain_haar) / (quarticStabWeight i * (gaussDomain_haar G₀).toReal)

/-- The region `B(n, t, λ, X) = n a(t) λ G₀·L^(i) ∩ {H < X}` (as a set). -/
def quarticRegionB (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType) (u t l X : ℝ) :
    Set (BinaryQuartic ℝ) :=
  {x | BinaryQuartic.pairHeight x.invI x.invJ < X ∧ ∃ q ∈ G₀, ∃ ℓ ∈ quarticFundSet i,
    BinaryQuartic.subst (l • (iwasawaN u * iwasawaA t) * iwasawaMatrix q) ℓ = x}

/-- The admissible averaging sets: compact, `SO_2`-invariant in the `θ`-coordinate, determinant
`≥ 1`, with nonempty interior. -/
def IsAveragingSet (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) : Prop :=
  IsCompact G₀ ∧ (interior G₀).Nonempty ∧ (∀ q ∈ G₀, 0 < q.2.1 ∧ 0 < q.2.2.2) ∧
    (∀ q ∈ G₀, 1 ≤ (iwasawaMatrix q).det) ∧
    ∀ q ∈ G₀, ∀ θ : ℝ, ∃ q' ∈ G₀, iwasawaMatrix q' = iwasawaK θ * iwasawaMatrix q

theorem quarticAveragedCount_eq_sum_classes (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (hG₀ : IsAveragingSet G₀)
    (i : QuarticRealType) (S : Set (BinaryQuartic ℤ)) (hS : ∀ γ : GL (Fin 2) ℤ, ∀ f ∈ S,
      γ • f ∈ S) (hSi : S ⊆ intQuarticLocus i) (X : ℝ) :
    quarticAveragedCount G₀ i S X = ∑ᶠ c ∈ Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
      {f | f ∈ S ∧ f.IsIrreducibleOverQ ∧ f.height < X},
        (2 : ℝ) / Set.ncard {γ : GL (Fin 2) ℤ | γ • c.out = c.out} := sorry

theorem quarticAveragedCount_union (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType)
    (S₁ S₂ : Set (BinaryQuartic ℤ)) (h : Disjoint S₁ S₂) (X : ℝ) :
    quarticAveragedCount G₀ i (S₁ ∪ S₂) X =
      quarticAveragedCount G₀ i S₁ X + quarticAveragedCount G₀ i S₂ X := sorry

theorem quarticAveragedCount_mono (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType)
    {S₁ S₂ : Set (BinaryQuartic ℤ)} (h : S₁ ⊆ S₂) {X Y : ℝ} (hXY : X ≤ Y) :
    quarticAveragedCount G₀ i S₁ X ≤ quarticAveragedCount G₀ i S₂ Y := sorry

theorem quarticAveragedCount_indep (G₀ G₁ : Set (ℝ × ℝ × ℝ × ℝ)) (h₀ : IsAveragingSet G₀)
    (h₁ : IsAveragingSet G₁) (i : QuarticRealType) (S : Set (BinaryQuartic ℤ))
    (hS : ∀ γ : GL (Fin 2) ℤ, ∀ f ∈ S, γ • f ∈ S)
    (X : ℝ) : quarticAveragedCount G₀ i S X = quarticAveragedCount G₁ i S X := sorry

theorem quarticAveragedCount_reducible (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType)
    (S : Set (BinaryQuartic ℤ)) (hS : ∀ f ∈ S, ¬ f.IsIrreducibleOverQ) (X : ℝ) :
    quarticAveragedCount G₀ i S X = 0 := sorry

/-- Unit test `ArithmeticStatistics.quarticAveragedCount.empty`. -/
example (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType) (S : Set (BinaryQuartic ℤ)) (X : ℝ) :
    quarticAveragedCount G₀ i ∅ X = 0 ∧ (X ≤ 1 → quarticAveragedCount G₀ i S X = 0) := sorry

/-- Unit test `ArithmeticStatistics.quarticAveragedCount.reducible_zero`. -/
example (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType) (X : ℝ) :
    quarticAveragedCount G₀ i {f | f ∈ intQuarticLocus i ∧ f.a = 0} X = 0 := sorry

/-- Unit test `ArithmeticStatistics.quarticAveragedCount.not_orbit_count`: on a single point the
average is in general strictly between `0` and `1`. -/
example : ∃ (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType) (f : BinaryQuartic ℤ) (X : ℝ),
    IsAveragingSet G₀ ∧ 0 < quarticAveragedCount G₀ i {f} X ∧
      quarticAveragedCount G₀ i {f} X < 1 := sorry

/-- Unit test `ArithmeticStatistics.quarticAveragedCount.invariant`: for `S = V_ℤ^(i)` the value
does not depend on `G₀`. -/
example (G₀ G₁ : Set (ℝ × ℝ × ℝ × ℝ)) (h₀ : IsAveragingSet G₀) (h₁ : IsAveragingSet G₁)
    (i : QuarticRealType) (X : ℝ) :
    quarticAveragedCount G₀ i (intQuarticLocus i) X =
      quarticAveragedCount G₁ i (intQuarticLocus i) X := sorry

/-- The multiset count `#{x ∈ S^irr ∩ B(n, t, λ, X)}` (multiplicity: number of `(q, ℓ)`). -/
def quarticRegionCount (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (i : QuarticRealType) (S : Set (BinaryQuartic ℤ))
    (u t l X : ℝ) : ℝ :=
  ∑ᶠ x ∈ {x : BinaryQuartic ℤ | x ∈ S ∧ x.IsIrreducibleOverQ ∧ x.height < X},
    (Set.ncard {qℓ : (ℝ × ℝ × ℝ × ℝ) × BinaryQuartic ℝ | qℓ.1 ∈ G₀ ∧ qℓ.2 ∈ quarticFundSet i ∧
      BinaryQuartic.subst (l • (iwasawaN u * iwasawaA t) * iwasawaMatrix qℓ.1) qℓ.2 =
        x.map (Int.castRingHom ℝ)} : ℝ)

/-- **Theorem 2.5, the averaging formula**
(ArithmeticStatistics:ST.2/averaging-formula-for-binary-quartic-forms). -/
theorem quarticAveragedCount_eq_integral (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (hG₀ : IsAveragingSet G₀)
    (i : QuarticRealType) (S : Set (BinaryQuartic ℤ)) (hSi : S ⊆ intQuarticLocus i) (X : ℝ) :
    quarticAveragedCount G₀ i S X =
      (1 / (2 * quarticStabWeight i * (gaussDomain_haar G₀).toReal)) *
        ∫ q in {q : ℝ × ℝ × ℝ | 0 < q.2.1 ∧ 0 < q.2.2 ∧ |q.1| ≤ 1 / 2 ∧
            1 ≤ q.1 ^ 2 + q.2.1 ^ 4},
          quarticRegionCount G₀ i S q.1 q.2.1 q.2.2 X * (q.2.1 ^ (-3 : ℤ) * q.2.2⁻¹) := sorry

/-- Lemma 2.3 (ArithmeticStatistics:ST.2/reducible-binary-quartic-forms-in-the-main-body). -/
theorem reducible_quartic_main_body (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (hG₀ : IsAveragingSet G₀)
    (i : QuarticRealType) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ q ∈ G₀, ∀ X : ℝ, 1 ≤ X →
      (∑ᶠ x ∈ {x : BinaryQuartic ℤ | x.a ≠ 0 ∧ ¬ x.IsIrreducibleOverQ ∧
          x.height < X},
        (quarticMultiplicity (iwasawaMatrix q) i (x.map (Int.castRingHom ℝ)) : ℝ)) ≤
        C * X ^ (2 / 3 + ε) := sorry

/-- Lemma 2.22: reducible monic cubic forms up to unipotent equivalence
(ArithmeticStatistics:ST.2/reducible-monic-binary-cubic-forms), counted with `r ∈ {−1, 0, 1}`. -/
theorem reducible_monic_cubic_count (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ X : ℝ, 1 ≤ X →
      (Set.ncard {g : ℤ × ℤ × ℤ | |g.1| ≤ 1 ∧
        max (|((g.1 ^ 2 - 3 * g.2.1 : ℤ) : ℝ)| ^ 3)
            (((-2 * g.1 ^ 3 + 9 * g.1 * g.2.1 - 27 * g.2.2 : ℤ) : ℝ) ^ 2 / 4) < X ∧
        ¬ (⟨1, g.1, g.2.1, g.2.2⟩ : BinaryCubicForm ℤ).IsIrreducibleOverQ} : ℝ) ≤
        C * X ^ (1 / 2 + ε) := sorry

/-- Lemma 2.4 (ArithmeticStatistics:ST.2/orbits-with-large-stabilizer-are-negligible). -/
theorem large_stabilizer_quartic_count (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ X : ℝ, 1 ≤ X →
      (Set.ncard (Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
        {f : BinaryQuartic ℤ | f.disc ≠ 0 ∧ f.height < X ∧
          2 < Set.ncard {γ : Matrix (Fin 2) (Fin 2) ℚ |
          γ.det ≠ 0 ∧ BinaryQuartic.subst γ (f.map (Int.castRingHom ℚ)) =
            f.map (Int.castRingHom ℚ)}}) : ℝ) ≤
        C * X ^ (3 / 4 + ε) := sorry

/-- Proposition 2.7 and its translate version
(ArithmeticStatistics:ST.2/binary-quartic-lattice-points-in-the-cusp). -/
theorem quartic_cusp_count (G₀ : Set (ℝ × ℝ × ℝ × ℝ)) (hG₀ : IsAveragingSet G₀)
    (i : QuarticRealType) (C₀ : ℝ)
    (hC₀ : ∀ q ∈ G₀, ∀ ℓ ∈ quarticFundSet i, ∀ j,
      |(BinaryQuartic.subst (iwasawaMatrix q) ℓ).coeffs j| ≤ C₀ ^ 4) :
    ∃ K : ℝ, ∀ (m : ℕ) (v₀ : BinaryQuartic ℤ) (u t l X : ℝ), 0 < m → |u| ≤ 1 / 2 →
      3 ^ (1 / 4 : ℝ) / Real.sqrt 2 ≤ t → 0 < l →
      (C₀ * l < t → ∀ x : BinaryQuartic ℤ, (∀ j, (m : ℤ) ∣ x.coeffs j - v₀.coeffs j) → x.a ≠ 0 →
          (x.map (Int.castRingHom ℝ)) ∉ quarticRegionB G₀ i u t l X) ∧
      (t ≤ C₀ * l → |(Set.ncard {x : BinaryQuartic ℤ | (∀ j, (m : ℤ) ∣ x.coeffs j - v₀.coeffs j) ∧
          x.a ≠ 0 ∧
          (x.map (Int.castRingHom ℝ)) ∈ quarticRegionB G₀ i u t l X} : ℝ) -
        (volume (BinaryQuartic.ofCoeffs ⁻¹' quarticRegionB G₀ i u t l X)).toReal / (m : ℝ) ^ 5| ≤
          K * t ^ 4 * l ^ 16) :=
  sorry

/-- The volume `Vol(R_X(L^(i)))` of the multiset `F·L^(i) ∩ {H < X}`. -/
def quarticFundVolume (i : QuarticRealType) (X : ℝ) : ℝ :=
  (∫⁻ v : Fin 5 → ℝ, (quarticMultiplicity 1 i (BinaryQuartic.ofCoeffs v) : ENNReal) *
    (if BinaryQuartic.pairHeight (BinaryQuartic.ofCoeffs v).invI
      (BinaryQuartic.ofCoeffs v).invJ < X then 1 else 0)).toReal

/-- (18)-(20): averaging over the fundamental domain and cutting off the cusp
(ArithmeticStatistics:ST.2/averaging-over-the-fundamental-domain-and-cutting-the-cusp). -/
theorem quartic_count_eq_volume_add (i : QuarticRealType) (ε : ℝ) (hε : 0 < ε) :
    (fun X : ℝ => (quarticClassCount (intQuarticLocus i) X : ℝ) -
      quarticFundVolume i X / quarticStabWeight i) =O[atTop] fun X => X ^ (3 / 4 + ε) := sorry

/-- Proposition 2.8, real case, with `U = F_PGL2`: the volume of the multiset `F·R^(i)(X)` is
`(1/27)·Vol_ω(F_PGL2)·∫ dI dJ` (ArithmeticStatistics:ST.2/jacobian-change-of-measure-for-binary-quartic-forms). -/
theorem quarticFundVolume_eq_jacobian (i : QuarticRealType) (X : ℝ) :
    quarticFundVolume i X = (1 / 27) * (Real.pi ^ 2 / 3) *
      (volume ({q : ℝ × ℝ | q ∈ invariantSignSet i ∧
        BinaryQuartic.pairHeight q.1 q.2 < X})).toReal := sorry

/-- (23)-(26) (ArithmeticStatistics:ST.2/volume-of-the-fundamental-region-for-binary-quartic-forms). -/
theorem quarticFundVolume_eq (i : QuarticRealType) (X : ℝ) (hX : 0 < X) :
    quarticFundVolume i X =
      (if i = .one then 64 / 135 else 16 / 135) * (Real.pi ^ 2 / 6) * X ^ (5 / 6 : ℝ) := sorry

/-- **Theorem 2.1** (ArithmeticStatistics:ST.2/count-of-binary-quartic-forms-of-bounded-height). -/
theorem quartic_class_count_asymptotic (i : QuarticRealType) (ε : ℝ) (hε : 0 < ε) :
    (fun X : ℝ => (quarticClassCount (intQuarticLocus i) X : ℝ) -
      (if i = .one then 32 / 135 else 4 / 135) * (Real.pi ^ 2 / 6) * X ^ (5 / 6 : ℝ))
      =O[atTop] fun X => X ^ (3 / 4 + ε) := sorry

/- Eligible invariant pairs, those occurring for integral binary quartic forms, are ST.0's
`BinaryQuartic.IsEligible`. -/

/-- Lemma 2.9 and Proposition 2.10
(ArithmeticStatistics:ST.2/eligible-invariant-pairs-of-bounded-height). -/
theorem eligible_pairs_count :
    (∃ T : Finset (ZMod 9 × ZMod 27), T.card = 9 ∧
      ∀ q : ℤ × ℤ, BinaryQuartic.IsEligible q.1 q.2 ↔ ((q.1 : ZMod 9), (q.2 : ZMod 27)) ∈ T) ∧
    (fun X : ℝ => (Set.ncard {q : ℤ × ℤ | BinaryQuartic.IsEligible q.1 q.2 ∧
        0 < 4 * q.1 ^ 3 - q.2 ^ 2 ∧ BinaryQuartic.pairHeight q.1 q.2 < X} : ℝ) -
        8 / 135 * X ^ (5 / 6 : ℝ))
      =O[atTop] (fun X => X ^ (1 / 2 : ℝ)) ∧
    (fun X : ℝ => (Set.ncard {q : ℤ × ℤ | BinaryQuartic.IsEligible q.1 q.2 ∧
        4 * q.1 ^ 3 - q.2 ^ 2 < 0 ∧ BinaryQuartic.pairHeight q.1 q.2 < X} : ℝ) -
        32 / 135 * X ^ (5 / 6 : ℝ))
      =O[atTop] (fun X => X ^ (1 / 2 : ℝ)) := sorry

/-- **Theorem 1.8** (ArithmeticStatistics:ST.2/average-number-of-classes-per-eligible-invariant-pair):
`i = 0` (four real roots) gives `ζ(2)/2`; `i = 1` gives `ζ(2)`; the definite forms together give
`ζ(2)`. -/
theorem average_classes_per_eligible_pair :
    Tendsto (fun X : ℝ => (quarticClassCount (intQuarticLocus .zero) X : ℝ) /
      Set.ncard {q : ℤ × ℤ | BinaryQuartic.IsEligible q.1 q.2 ∧ 0 < 4 * q.1 ^ 3 - q.2 ^ 2 ∧
        BinaryQuartic.pairHeight q.1 q.2 < X}) atTop (𝓝 (Real.pi ^ 2 / 6 / 2)) ∧
    Tendsto (fun X : ℝ => (quarticClassCount (intQuarticLocus .one) X : ℝ) /
      Set.ncard {q : ℤ × ℤ | BinaryQuartic.IsEligible q.1 q.2 ∧ 4 * q.1 ^ 3 - q.2 ^ 2 < 0 ∧
        BinaryQuartic.pairHeight q.1 q.2 < X}) atTop (𝓝 (Real.pi ^ 2 / 6)) ∧
    Tendsto (fun X : ℝ => (quarticClassCount
      (intQuarticLocus .twoPos ∪ intQuarticLocus .twoNeg) X : ℝ) /
      Set.ncard {q : ℤ × ℤ | BinaryQuartic.IsEligible q.1 q.2 ∧ 0 < 4 * q.1 ^ 3 - q.2 ^ 2 ∧
        BinaryQuartic.pairHeight q.1 q.2 < X}) atTop (𝓝 (Real.pi ^ 2 / 6)) := sorry

/-- **Theorem 2.11** (ArithmeticStatistics:ST.2/binary-quartic-counts-with-finitely-many-congruence-conditions):
for `S` defined modulo `m` by the allowed residues `A`. -/
theorem quartic_count_congruence (i : QuarticRealType) (m : ℕ) [NeZero m]
    (A : Set (Fin 5 → ZMod m)) (hA : ∀ γ : GL (Fin 2) ℤ, ∀ f : BinaryQuartic ℤ,
      (fun j => (f.coeffs j : ZMod m)) ∈ A → (fun j => ((γ • f).coeffs j : ZMod m)) ∈ A) (ε : ℝ)
    (hε : 0 < ε) :
    (fun X : ℝ => (quarticClassCount
        ({f | (fun j => (f.coeffs j : ZMod m)) ∈ A} ∩ intQuarticLocus i) X : ℝ) -
      (quarticClassCount (intQuarticLocus i) X : ℝ) * (Set.ncard A / (m : ℝ) ^ 5))
      =O[atTop] fun X => X ^ (3 / 4 + ε) := sorry

/-- **Theorem 2.12**, weighted
(ArithmeticStatistics:ST.2/weighted-binary-quartic-counts-with-finitely-many-congruence-conditions). -/
theorem quartic_count_weighted (i : QuarticRealType) (m : ℕ) [NeZero m]
    (w : (Fin 5 → ZMod m) → ℝ) (hw : ∀ γ : GL (Fin 2) ℤ, ∀ f : BinaryQuartic ℤ,
      w (fun j => ((γ • f).coeffs j : ZMod m)) = w (fun j => (f.coeffs j : ZMod m))) (ε : ℝ)
    (hε : 0 < ε) :
    (fun X : ℝ => (∑ᶠ c ∈ Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
        {f | f ∈ intQuarticLocus i ∧ f.IsIrreducibleOverQ ∧ f.height < X},
          w (fun j => (c.out.coeffs j : ZMod m))) -
      (quarticClassCount (intQuarticLocus i) X : ℝ) * ((∑ v, w v) / (m : ℝ) ^ 5))
      =O[atTop] fun X => X ^ (3 / 4 + ε) := sorry

/-! ## Uniformity estimates and the sieve for binary quartic forms -/

/-- `Y_4 = V(Δ, ∂Δ/∂e)`. -/
def quarticY : Ideal (MvPolynomial (Fin 5) ℤ) := pderivLocus quarticDiscPoly

/-- Theorem 2.18 (ArithmeticStatistics:ST.2/uniformity-for-strongly-divisible-quartic-discriminants). -/
theorem quartic_strong_uniformity (B₀ : Set (Fin 5 → ℝ)) (hB₀ : IsCompact B₀) :
    ∃ C : ℝ, ∀ X M : ℝ, 1 ≤ X → 2 ≤ M →
      (Set.ncard {f ∈ dilatedIntPoints B₀ (X ^ (1 / 6 : ℝ)) | ∃ p : ℕ, p.Prime ∧ M < p ∧
          reduceMod p f ∈ zeroLocusModP quarticY p} : ℝ) ≤
        C * (X ^ (5 / 6 : ℝ) / (M * Real.log M) + X ^ (2 / 3 : ℝ)) := sorry

/-- (37) (ArithmeticStatistics:ST.2/weakly-divisible-quartic-discriminants-via-ternary-pairs);
rests on Bhargava's Proposition 23, recorded as a gap. -/
theorem quartic_weak_count_le :
    ∃ C : ℝ, ∀ p : ℕ, p.Prime → ∀ X : ℝ, 1 ≤ X →
      (quarticClassCount (quarticW2 p) X : ℝ) ≤ C * X / (p : ℝ) ^ 2 := sorry

/-- `W′_p = {p^2 ∣ Δ, p ∤ ∂Δ/∂e}`. -/
def quarticWPrime (p : ℕ) : Set (BinaryQuartic ℤ) :=
  {f | f ∈ quarticW p ∧
    ¬ (p : ℤ) ∣ MvPolynomial.eval f.coeffs (MvPolynomial.pderiv 4 quarticDiscPoly)}

/-- Theorem 2.20, corrected, part (a)
(ArithmeticStatistics:ST.2/uniformity-for-weakly-divisible-quartic-discriminants). -/
theorem quartic_weak_uniformity (B₀ : Set (Fin 5 → ℝ)) (hB₀ : IsCompact B₀) :
    (∀ p, quarticWPrime p ⊆ quarticW2 p) ∧ ∃ C : ℝ, ∀ p : ℕ, p.Prime → ∀ X : ℝ, 1 ≤ X →
      (Set.ncard (dilatedIntPoints B₀ (X ^ (1 / 6 : ℝ)) ∩
          BinaryQuartic.ofCoeffs ⁻¹' quarticWPrime p) : ℝ) ≤
        C * (X ^ (5 / 6 : ℝ) / (p : ℝ) ^ 2 + X ^ (2 / 3 : ℝ)) := sorry

/-- **Theorem 2.13, the uniformity estimate**, in the limit form proved here
(ArithmeticStatistics:ST.2/uniformity-estimate-for-infinitely-many-congruence-conditions). -/
theorem uniformity_estimate_quartic :
    Tendsto (fun M : ℕ => limsup (fun X : ℝ =>
      (quarticClassCount {f | ∃ p : ℕ, p.Prime ∧ M < p ∧ f ∈ quarticW p} X : ℝ) /
        X ^ (5 / 6 : ℝ)) atTop) atTop (𝓝 0) := sorry

/-- **Theorem 2.21, the squarefree sieve**
(ArithmeticStatistics:ST.2/squarefree-sieve-for-binary-quartic-forms). -/
theorem squarefree_sieve_quartic (i : QuarticRealType) (φ : CongruenceConditions 5)
    (hφ : φ.IsAcceptable quarticDiscPoly)
    (hinv : ∀ γ : GL (Fin 2) ℤ, ∀ f : BinaryQuartic ℤ,
      φ.toFun (γ • f).coeffs = φ.toFun f.coeffs) :
    (fun X : ℝ => (∑ᶠ c ∈ Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
        {f | f ∈ intQuarticLocus i ∧ f.IsIrreducibleOverQ ∧ f.height < X}, φ.toFun c.out.coeffs) -
      (quarticClassCount (intQuarticLocus i) X : ℝ) *
        ∏' p : {p : ℕ // p.Prime}, (haveI : Fact (p : ℕ).Prime := ⟨p.2⟩; φ.localMass p))
      =o[atTop] fun X => X ^ (5 / 6 : ℝ) := sorry

/-! ## Binary cubic forms -/

/-- `U_ℤ^(0)` and `U_ℤ^(1)`: integral cubic forms of positive, resp. negative, discriminant. -/
def intCubicLocus (i : Fin 2) : Set (BinaryCubicForm ℤ) :=
  if i = 0 then {f | 0 < f.disc} else {f | f.disc < 0}

/-- The stabiliser orders `n_0 = 6`, `n_1 = 2`. -/
def cubicStabWeight (i : Fin 2) : ℕ := if i = 0 then 6 else 2

/-- (ArithmeticStatistics:ST.2/real-orbits-and-stabilizers-of-binary-cubic-forms). -/
theorem cubic_real_orbits (f g : BinaryCubicForm ℝ) (hf : f.disc ≠ 0)
    (hsign : 0 < f.disc * g.disc) :
    (∀ γ : Matrix (Fin 2) (Fin 2) ℝ, γ.det ≠ 0 →
      ((f.subst γ).scale γ.det⁻¹).disc = γ.det ^ 2 * f.disc) ∧
    (∃ γ : Matrix (Fin 2) (Fin 2) ℝ, γ.det ≠ 0 ∧ (f.subst γ).scale γ.det⁻¹ = g) ∧
    Set.ncard {γ : Matrix (Fin 2) (Fin 2) ℝ | γ.det ≠ 0 ∧
        (f.subst γ).scale γ.det⁻¹ = f} =
      if 0 < f.disc then 6 else 2 := sorry

/-- (ArithmeticStatistics:ST.2/stabilizers-of-irreducible-integral-binary-cubic-forms). -/
theorem cubic_int_stabilizer (f : BinaryCubicForm ℤ) (hf : f.IsIrreducibleOverQ) :
    (Set.ncard {γ : GL (Fin 2) ℤ | γ • f = f} = 1 ∨
      Set.ncard {γ : GL (Fin 2) ℤ | γ • f = f} = 3) ∧
    (Set.ncard {γ : GL (Fin 2) ℤ | γ • f = f} = 3 →
      0 < f.disc ∧ IsSquare f.disc) := sorry

/-- The multiplicity of `x` in the multiset `F·v`. -/
def cubicMultiplicity (v x : BinaryCubicForm ℝ) : ℕ :=
  Set.ncard {g ∈ gaussDomain | (v.subst g).scale g.det⁻¹ = x}

/-- Lemma 21 (ArithmeticStatistics:ST.2/reducible-binary-cubic-forms-in-the-main-body). -/
theorem reducible_cubic_main_body (B : Set (BinaryCubicForm ℝ))
    (hB : IsCompact (BinaryCubicForm.ofCoeffs ⁻¹' B))
    (hB1 : ∀ v ∈ B, 1 ≤ |v.disc|) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ v ∈ B, ∀ X : ℝ, 1 ≤ X →
      (∑ᶠ x ∈ {x : BinaryCubicForm ℤ | x.a ≠ 0 ∧ ¬ x.IsIrreducibleOverQ ∧
          |(x.disc : ℝ)| < X}, (cubicMultiplicity v (x.map (Int.castRingHom ℝ)) : ℝ)) ≤
        C * X ^ (3 / 4 + ε) :=
  sorry

/-- Lemma 22 (ArithmeticStatistics:ST.2/binary-cubic-forms-with-cyclic-stabilizer). -/
theorem cyclic_stabilizer_cubic_count (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, ∀ X : ℝ, 1 ≤ X →
      (Set.ncard (Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
        {f : BinaryCubicForm ℤ | 0 < f.disc ∧ (f.disc : ℝ) < X ∧
          Set.ncard {γ : GL (Fin 2) ℤ | γ • f = f} = 3}) : ℝ) ≤
        C * X ^ (3 / 4 + ε) := sorry

/-- The real locus `U_ℝ^(i)`. -/
def realCubicLocus (i : Fin 2) : Set (BinaryCubicForm ℝ) :=
  if i = 0 then {w | 0 < w.disc} else {w | w.disc < 0}

/-- Proposition 23, corrected: `dv = 4π|Disc(g·v)| dg` on `GL_2^+(ℝ)`
(ArithmeticStatistics:ST.2/invariant-measure-on-binary-cubic-forms), stated for the orbit map
in Iwasawa coordinates and a nonnegative test function. -/
theorem cubic_invariant_measure (i : Fin 2) (v : BinaryCubicForm ℝ) (hv : v ∈ realCubicLocus i)
    (φ : BinaryCubicForm ℝ → ENNReal) (hφ : Measurable (φ ∘ BinaryCubicForm.ofCoeffs)) :
    ∫⁻ q in {q : ℝ × ℝ × ℝ × ℝ | 0 < q.2.1 ∧ 0 < q.2.2.2 ∧ 0 ≤ q.2.2.1 ∧ q.2.2.1 < 2 * Real.pi},
        φ ((v.subst (iwasawaMatrix q)).scale (iwasawaMatrix q).det⁻¹) ∂gaussDomain_haar =
      ENNReal.ofReal ((cubicStabWeight i : ℝ) / 2 / (4 * Real.pi)) *
        ∫⁻ w in BinaryCubicForm.ofCoeffs ⁻¹' realCubicLocus i,
          φ (BinaryCubicForm.ofCoeffs w) / ENNReal.ofReal |(BinaryCubicForm.ofCoeffs w).disc| :=
  sorry

/-- The averaging set `B(C)`, three times the Bombieri norm bounded by `C` and `|Disc| ≥ 1`. -/
def cubicAveragingSet (C : ℝ) : Set (BinaryCubicForm ℝ) :=
  {w | 3 * w.a ^ 2 + w.b ^ 2 + w.c ^ 2 + 3 * w.d ^ 2 ≤ C ∧ 1 ≤ |w.disc|}

/-- The averaged count `N(S; X)` of (17) (ArithmeticStatistics:ST.2/averaged-count-of-binary-cubic-orbits). -/
def cubicAveragedCount (C : ℝ) (i : Fin 2) (S : Set (BinaryCubicForm ℤ)) (X : ℝ) : ℝ :=
  (∫ v in BinaryCubicForm.ofCoeffs ⁻¹' (cubicAveragingSet C ∩ realCubicLocus i),
      (∑ᶠ x ∈ {x : BinaryCubicForm ℤ | x ∈ S ∧ x.IsIrreducibleOverQ ∧ |(x.disc : ℝ)| < X},
        (cubicMultiplicity (BinaryCubicForm.ofCoeffs v) (x.map (Int.castRingHom ℝ)) : ℝ)) /
          |(BinaryCubicForm.ofCoeffs v).disc|) /
    (cubicStabWeight i *
      ∫ v in BinaryCubicForm.ofCoeffs ⁻¹' (cubicAveragingSet C ∩ realCubicLocus i),
        1 / |(BinaryCubicForm.ofCoeffs v).disc|)

/-- The region `B(n, t, λ, X) = n a(t) λ (B ∩ U_ℝ^(i)) ∩ {|Disc| < X}`. -/
def cubicRegionB (C : ℝ) (i : Fin 2) (u t l X : ℝ) : Set (BinaryCubicForm ℝ) :=
  {x | |x.disc| < X ∧ ∃ w ∈ cubicAveragingSet C ∩ realCubicLocus i,
    (w.subst (l • (iwasawaN u * iwasawaA t))).scale (l • (iwasawaN u * iwasawaA t)).det⁻¹ = x}

/-- `M_i = (n_i/4π) ∫_{B ∩ U^(i)} |Disc|^{-1}`. -/
def cubicAveragingConstant (C : ℝ) (i : Fin 2) : ℝ :=
  (cubicStabWeight i : ℝ) / (4 * Real.pi) *
    ∫ v in BinaryCubicForm.ofCoeffs ⁻¹' (cubicAveragingSet C ∩ realCubicLocus i),
      1 / |(BinaryCubicForm.ofCoeffs v).disc|

theorem cubicAveragedCount_eq_sum_classes (C : ℝ) (hC : 1 ≤ C) (i : Fin 2)
    (S : Set (BinaryCubicForm ℤ)) (hS : ∀ γ : GL (Fin 2) ℤ, ∀ f ∈ S, γ • f ∈ S)
    (hSi : S ⊆ intCubicLocus i) (X : ℝ) :
    cubicAveragedCount C i S X = ∑ᶠ c ∈ Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
      {f | f ∈ S ∧ f.IsIrreducibleOverQ ∧ |(f.disc : ℝ)| < X},
        (1 : ℝ) / Set.ncard {γ : GL (Fin 2) ℤ | γ • c.out = c.out} := sorry

theorem cubicAveragedCount_union (C : ℝ) (i : Fin 2) (S₁ S₂ : Set (BinaryCubicForm ℤ))
    (h : Disjoint S₁ S₂) (X : ℝ) :
    cubicAveragedCount C i (S₁ ∪ S₂) X =
      cubicAveragedCount C i S₁ X + cubicAveragedCount C i S₂ X :=
  sorry

theorem cubicAveragedCount_mono (C : ℝ) (i : Fin 2) {S₁ S₂ : Set (BinaryCubicForm ℤ)} (h : S₁ ⊆ S₂)
    {X Y : ℝ} (hXY : X ≤ Y) : cubicAveragedCount C i S₁ X ≤ cubicAveragedCount C i S₂ Y := sorry

theorem cubicAveragedCount_indep (C C' : ℝ) (hC : 1 ≤ C) (hC' : 1 ≤ C') (i : Fin 2)
    (S : Set (BinaryCubicForm ℤ)) (hS : ∀ γ : GL (Fin 2) ℤ, ∀ f ∈ S, γ • f ∈ S) (X : ℝ) :
    cubicAveragedCount C i S X = cubicAveragedCount C' i S X := sorry

theorem bombieri_smul_rotation (θ : ℝ) (w : BinaryCubicForm ℝ) :
    let w' := (w.subst (iwasawaK θ)).scale (iwasawaK θ).det⁻¹
    3 * w'.a ^ 2 + w'.b ^ 2 + w'.c ^ 2 + 3 * w'.d ^ 2 =
      3 * w.a ^ 2 + w.b ^ 2 + w.c ^ 2 + 3 * w.d ^ 2 :=
  sorry

/-- Unit test `ArithmeticStatistics.cubicAveragedCount.empty`. -/
example (C : ℝ) (i : Fin 2) (S : Set (BinaryCubicForm ℤ)) (X : ℝ) :
    cubicAveragedCount C i ∅ X = 0 ∧ (X ≤ 1 → cubicAveragedCount C i S X = 0) := sorry

/-- Unit test `ArithmeticStatistics.cubicAveragedCount.reducible_zero`. -/
example (C : ℝ) (i : Fin 2) (X : ℝ) :
    cubicAveragedCount C i {f | f ∈ intCubicLocus i ∧ f.a = 0} X = 0 := sorry

/-- Unit test `ArithmeticStatistics.cubicAveragedCount.cyclic_weight`: the class of the cyclic form
`x^3 + x^2y − 2xy^2 − y^3` contributes `1/3`. -/
example (C : ℝ) (hC : 1 ≤ C) (X : ℝ) (hX : 49 < X) :
    cubicAveragedCount C 0
      {f | ∃ γ : GL (Fin 2) ℤ, γ • (⟨1, 1, -2, -1⟩ : BinaryCubicForm ℤ) = f} X =
      1 / 3 := sorry

/-- Unit test `ArithmeticStatistics.cubicAveragedCount.invariant`. -/
example (C C' : ℝ) (hC : 1 ≤ C) (hC' : 1 ≤ C') (i : Fin 2) (X : ℝ) :
    cubicAveragedCount C i (intCubicLocus i) X = cubicAveragedCount C' i (intCubicLocus i) X :=
  sorry

/-- The averaging formula (20)-(23), corrected
(ArithmeticStatistics:ST.2/averaging-formula-for-binary-cubic-forms). -/
theorem cubicAveragedCount_eq_integral (C : ℝ) (hC : 1 ≤ C) (i : Fin 2)
    (S : Set (BinaryCubicForm ℤ)) (hSi : S ⊆ intCubicLocus i) (X : ℝ) :
    cubicAveragedCount C i S X =
      (1 / (2 * cubicAveragingConstant C i)) *
        ∫ q in {q : ℝ × ℝ × ℝ | 0 < q.2.1 ∧ 0 < q.2.2 ∧ |q.1| ≤ 1 / 2 ∧
            1 ≤ q.1 ^ 2 + q.2.1 ^ 4},
          (∑ᶠ x ∈ {x : BinaryCubicForm ℤ | x ∈ S ∧ x.IsIrreducibleOverQ ∧
              x.map (Int.castRingHom ℝ) ∈ cubicRegionB C i q.1 q.2.1 q.2.2 X}, (1 : ℝ)) *
            (q.2.1 ^ (-3 : ℤ) * q.2.2⁻¹) := sorry

/-- Lemma 25 (ArithmeticStatistics:ST.2/binary-cubic-lattice-points-in-the-cusp), case `m = 1`. -/
theorem cubic_cusp_count (C : ℝ) (hC : 1 ≤ C) (i : Fin 2) (C₀ : ℝ)
    (hC₀ : ∀ w ∈ cubicAveragingSet C, ∀ j, |w.coeffs j| ≤ C₀) :
    ∃ K : ℝ, ∀ u t l X : ℝ, |u| ≤ 1 / 2 → 3 ^ (1 / 4 : ℝ) / Real.sqrt 2 ≤ t → 0 < l →
      (C₀ * l < t ^ 3 → ∀ x : BinaryCubicForm ℤ, x.a ≠ 0 →
          x.map (Int.castRingHom ℝ) ∉ cubicRegionB C i u t l X) ∧
      (t ^ 3 ≤ C₀ * l → |(Set.ncard {x : BinaryCubicForm ℤ | x.a ≠ 0 ∧
          x.map (Int.castRingHom ℝ) ∈ cubicRegionB C i u t l X} : ℝ) -
        (volume (BinaryCubicForm.ofCoeffs ⁻¹' cubicRegionB C i u t l X)).toReal| ≤
          K * max (C₀ ^ 3 * t ^ 3 * l ^ 3) 1) := sorry

/-- **Theorem 20 (Davenport)** (ArithmeticStatistics:ST.2/davenport-count-of-binary-cubic-forms). -/
theorem davenport_cubic_count :
    (fun X : ℝ => (cubicClassCount (intCubicLocus 0) X : ℝ) - Real.pi ^ 2 / 72 * X)
      =O[atTop] (fun X => X ^ (5 / 6 : ℝ)) ∧
    (fun X : ℝ => (cubicClassCount (intCubicLocus 1) X : ℝ) - Real.pi ^ 2 / 24 * X)
      =O[atTop] (fun X => X ^ (5 / 6 : ℝ)) := sorry

/-- **Theorem 26** with (29)-(31)
(ArithmeticStatistics:ST.2/binary-cubic-counts-with-congruence-conditions), part (c). -/
theorem cubic_count_congruence (i : Fin 2) (m : ℕ) [NeZero m] (A : Set (Fin 4 → ZMod m))
    (hA : ∀ γ : GL (Fin 2) ℤ, ∀ f : BinaryCubicForm ℤ, (fun j => (f.coeffs j : ZMod m)) ∈ A →
      (fun j => ((γ • f).coeffs j : ZMod m)) ∈ A) :
    Tendsto (fun X : ℝ => (cubicClassCount ({f | (fun j => (f.coeffs j : ZMod m)) ∈ A} ∩
      intCubicLocus i) X : ℝ) / X) atTop
      (𝓝 (Real.pi ^ 2 / (12 * cubicStabWeight i) * (Set.ncard A / (m : ℝ) ^ 4))) := sorry

/-- Part (a): uniformity in the modulus for lattice translates, `m ≤ X^{1/6}`. -/
theorem cubic_count_translate_uniform (i : Fin 2) (C : ℝ) (hC : 1 ≤ C) :
    ∃ K : ℝ, ∀ (m : ℕ) (v₀ : BinaryCubicForm ℤ) (X : ℝ), 0 < m → 1 ≤ X → (m : ℝ) ≤ X ^ (1 / 6 : ℝ) →
      cubicAveragedCount C i {f | (∀ j, (m : ℤ) ∣ f.coeffs j - v₀.coeffs j) ∧ f ∈ intCubicLocus i}
          X ≤
        Real.pi ^ 2 / (12 * cubicStabWeight i) * X / (m : ℝ) ^ 4 +
          K * X ^ (5 / 6 : ℝ) / (m : ℝ) ^ 3 := sorry

/- The set `W_p^DH` of forms that are `0 mod p` or have a translate with `p^2 ∣ a`, `p ∣ b` is the
complement of ST.1's Davenport–Heilbronn set `BinaryCubicForm.U p`. -/

/-- Index-`p` switching (ArithmeticStatistics:ST.2/index-p-switching-for-binary-cubic-forms),
part (a). -/
theorem cubic_switch (p : ℕ) (hp : p.Prime) (f : BinaryCubicForm ℤ) (ha : (p : ℤ) ^ 2 ∣ f.a)
    (hb : (p : ℤ) ∣ f.b) :
    ∃ f' : BinaryCubicForm ℤ, f' = ⟨f.a / p ^ 2, f.b / p, f.c, p * f.d⟩ ∧
      f.disc * 1 = (p : ℤ) ^ 2 * f'.disc ∧ (p : ℤ) ∣ f'.d ∧
      f.map (Int.castRingHom ℝ) =
        ((f'.map (Int.castRingHom ℝ)).subst !![(p : ℝ), 0; 0, 1]).scale
          (!![(p : ℝ), 0; 0, 1]).det⁻¹ := sorry

/-- Part (c): the number of classes attached to one class `[g]` is at most the number of roots of
`g` modulo `p`. -/
theorem cubic_switch_count (p : ℕ) (hp : p.Prime) (X : ℝ) :
    (Set.ncard (Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
      {f : BinaryCubicForm ℤ | f ∉ BinaryCubicForm.U p ∧ ¬ (∀ j, (p : ℤ) ∣ f.coeffs j) ∧
        f.IsIrreducibleOverQ ∧ |(f.disc : ℝ)| < X}) : ℝ) ≤
      3 * cubicClassCount Set.univ (X / (p : ℝ) ^ 2) +
        (p + 1) * cubicClassCount Set.univ (X / (p : ℝ) ^ 6) := sorry

/-- Proposition 29, non-maximal part (ArithmeticStatistics:ST.2/uniformity-estimate-for-nonmaximal-binary-cubic-forms). -/
theorem cubic_nonmaximal_count_le :
    ∃ C : ℝ, ∀ p : ℕ, p.Prime → ∀ X : ℝ, 1 ≤ X →
      (cubicClassCount (BinaryCubicForm.U p)ᶜ X : ℝ) ≤ C * X / (p : ℝ) ^ 2 := sorry

/-- The tail estimate for binary cubic forms
(ArithmeticStatistics:ST.2/uniformity-estimate-for-binary-cubic-discriminants). -/
theorem uniformity_estimate_cubic :
    Tendsto (fun M : ℕ => limsup (fun X : ℝ =>
      (cubicClassCount {f | ∃ p : ℕ, p.Prime ∧ M < p ∧ f ∈ cubicW p} X : ℝ) / X) atTop)
      atTop (𝓝 0) := sorry

/-- The sieve for binary cubic forms
(ArithmeticStatistics:ST.2/sieve-to-acceptable-functions-for-binary-cubic-forms). -/
theorem sieve_cubic (i : Fin 2) (φ : CongruenceConditions 4) (hφ : φ.IsAcceptable cubicDiscPoly)
    (hinv : ∀ γ : GL (Fin 2) ℤ, ∀ f : BinaryCubicForm ℤ,
      φ.toFun (γ • f).coeffs = φ.toFun f.coeffs) :
    Tendsto (fun X : ℝ => (∑ᶠ c ∈ Quotient.mk (MulAction.orbitRel (GL (Fin 2) ℤ) _) ''
        {f | f ∈ intCubicLocus i ∧ f.IsIrreducibleOverQ ∧ |(f.disc : ℝ)| < X},
          φ.toFun c.out.coeffs) / X) atTop
      (𝓝 (Real.pi ^ 2 / (12 * cubicStabWeight i) *
        ∏' p : {p : ℕ // p.Prime}, (haveI : Fact (p : ℕ).Prime := ⟨p.2⟩; φ.localMass p))) :=
  sorry

end ArithmeticStatistics

end ST2

/-! # ArithmeticStatistics:ST.3 — Fields and class groups -/

noncomputable section ST3

/-!
## Fields and class groups

Objects owned by other stages are used from their owning stage: ST.0's `ℚ`-isomorphism of embedded
number fields (`NumberFieldFamily.isoSetoid`); ST.1's binary cubic forms, their twisted
`GL₂`-action and the Davenport–Heilbronn sets `BinaryCubicForm.U p` (the forms maximal at `p`, BST
Theorem 14); ST.2's densities `CongruenceConditions.localMass` of sets defined by congruence
conditions and orbit counts `cubicClassCount`.

Left out and named in comments: the reduction-mod-`p` description of ST.1's cubic ring `R(f)`,
Lemma 32 and Theorem 7 (Haar measure on `ℤ_[p]⁴`), and the ramification/class-field-theory lemmas
(Tau Ceti's `ClassFieldTheory` and `NumberFieldArithmetic` layers).
-/

open NumberField Filter Topology

open Classical

namespace ArithmeticStatistics

/-! ### Number fields of bounded discriminant -/

/-- A fixed algebraic closure of `ℚ`; number fields are counted as its subfields up to isomorphism. -/
abbrev Qbar : Type := AlgebraicClosure ℚ

/-- The discriminant of a characteristic-zero field, and `0` if it is not finite over `ℚ`. -/
def discrOfCharZeroField (L : Type*) [Field L] [CharZero L] : ℤ :=
  if h : FiniteDimensional ℚ L then @NumberField.discr L _ (@NumberField.mk L _ _ h) else 0

/-- The number of complex places of a characteristic-zero field (`0` if not a number field). -/
def nrComplexPlacesOf (L : Type*) [Field L] [CharZero L] : ℕ :=
  if h : FiniteDimensional ℚ L then
    @InfinitePlace.nrComplexPlaces L _ (@NumberField.mk L _ _ h) else 0

/-- `h_m` of a characteristic-zero field (`0` if not a number field). -/
def torsionCardOf (L : Type*) [Field L] [CharZero L] (m : ℕ) : ℕ :=
  if h : FiniteDimensional ℚ L then
    haveI : NumberField L := @NumberField.mk L _ _ h
    Nat.card {c : ClassGroup (𝓞 L) // c ^ m = 1}
  else 0

/-- The permutation of the embeddings `K → k̄` induced by `σ ∈ Gal(k̄/k)`. -/
def galPerm (k : Type*) [Field k] (K : IntermediateField k (AlgebraicClosure k))
    (σ : AlgebraicClosure k ≃ₐ[k] AlgebraicClosure k) :
    Equiv.Perm (K →ₐ[k] AlgebraicClosure k) where
  toFun φ := (σ : AlgebraicClosure k →ₐ[k] AlgebraicClosure k).comp φ
  invFun φ := (σ.symm : AlgebraicClosure k →ₐ[k] AlgebraicClosure k).comp φ
  left_inv φ := by ext x; simp
  right_inv φ := by ext x; simp

/-- `K/k` has Galois group `G ≤ Sₙ`: the image of `Gal(k̄/k)` in the permutations of the `n`
embeddings of `K` is conjugate to `G` under some numbering of the embeddings. -/
def HasGaloisGroupOver (k : Type*) [Field k] (n : ℕ) (G : Subgroup (Equiv.Perm (Fin n)))
    (K : IntermediateField k (AlgebraicClosure k)) : Prop :=
  ∃ e : (K →ₐ[k] AlgebraicClosure k) ≃ Fin n,
    Set.range (fun σ => e.symm.trans ((galPerm k K σ).trans e)) = (G : Set (Equiv.Perm (Fin n)))

/-- `K/ℚ` has Galois group `G ≤ Sₙ` (PolynomialGaloisGroups Layers 0 and 6 in Tau Ceti). -/
abbrev HasGaloisGroup (n : ℕ) (G : Subgroup (Equiv.Perm (Fin n)))
    (K : IntermediateField ℚ Qbar) : Prop :=
  HasGaloisGroupOver ℚ n G K

/-- `S_n(P; ξ, η)`: the subfields of `ℚ̄` of degree `n` with `ξ < Disc < η` satisfying `P`. -/
def numberFieldsInInterval (n : ℕ) (P : IntermediateField ℚ Qbar → Prop) (ξ η : ℝ) :
    Set (IntermediateField ℚ Qbar) :=
  {K | Module.finrank ℚ K = n ∧ ξ < (discrOfCharZeroField K : ℝ) ∧
    (discrOfCharZeroField K : ℝ) < η ∧ P K}

/-- `N_n(P; ξ, η)`: the number of isomorphism classes (ST.0's `NumberFieldFamily.isoSetoid`) of
degree-`n` number fields `K` with `ξ < Disc(K) < η` and `P(K)`. -/
def numberFieldCount (n : ℕ) (P : IntermediateField ℚ Qbar → Prop) (ξ η : ℝ) : ℕ :=
  {c : Quotient (NumberFieldFamily.isoSetoid Qbar) |
    ∃ K : NumberFieldFamily.Embedded Qbar, Quotient.mk _ K = c ∧
      K.1 ∈ numberFieldsInInterval n P ξ η}.ncard

/-- A predicate on subfields invariant under `ℚ`-isomorphism. -/
def IsIsoInvariant (P : IntermediateField ℚ Qbar → Prop) : Prop :=
  ∀ K L : IntermediateField ℚ Qbar, Nonempty (K ≃ₐ[ℚ] L) → (P K ↔ P L)

theorem finite_numberFieldsInInterval (n : ℕ) (hn : 1 ≤ n) (P : IntermediateField ℚ Qbar → Prop)
    (ξ η : ℝ) : (numberFieldsInInterval n P ξ η).Finite := by
  sorry

theorem numberFieldCount_eq_sum_card_aut (n : ℕ) (hn : 1 ≤ n) (P : IntermediateField ℚ Qbar → Prop)
    (hP : IsIsoInvariant P) (ξ η : ℝ) :
    (numberFieldCount n P ξ η : ℚ) =
      ∑ᶠ K ∈ numberFieldsInInterval n P ξ η, (Nat.card (K ≃ₐ[ℚ] K) : ℚ) / n := by
  sorry

theorem numberFieldCount_mono (n : ℕ) {P P' : IntermediateField ℚ Qbar → Prop}
    (hPP' : ∀ K, P K → P' K) {ξ η ξ' η' : ℝ} (hξ : ξ' ≤ ξ) (hη : η ≤ η') :
    numberFieldCount n P ξ η ≤ numberFieldCount n P' ξ' η' := by
  sorry

theorem numberFieldCount_add_of_disjoint (n : ℕ) {P Q : IntermediateField ℚ Qbar → Prop}
    (hP : IsIsoInvariant P) (hQ : IsIsoInvariant Q) (hPQ : ∀ K, ¬ (P K ∧ Q K)) (ξ η : ℝ) :
    numberFieldCount n (fun K => P K ∨ Q K) ξ η = numberFieldCount n P ξ η + numberFieldCount n Q ξ η := by
  sorry

theorem numberFieldCount_neg_eq_odd_nrComplexPlaces (n : ℕ) (P : IntermediateField ℚ Qbar → Prop)
    (X : ℝ) :
    numberFieldCount n P (-X) 0 = numberFieldCount n (fun K => P K ∧ Odd (nrComplexPlacesOf K)) (-X) X := by
  sorry

theorem numberFieldCount_eq_ncard_of_two (P : IntermediateField ℚ Qbar → Prop) (ξ η : ℝ) :
    numberFieldCount 2 P ξ η = (numberFieldsInInterval 2 P ξ η).ncard := by
  sorry

theorem numberFieldCount_congr (n : ℕ) {P P' : IntermediateField ℚ Qbar → Prop}
    (h : ∀ K : IntermediateField ℚ Qbar, Module.finrank ℚ K = n → (P K ↔ P' K)) (ξ η : ℝ) :
    numberFieldCount n P ξ η = numberFieldCount n P' ξ η := by
  sorry

/-- Unit test `ArithmeticStatistics.numberFieldCount_two_neg_five`: `N₂(⊤; −5, 0) = 2`. -/
example : numberFieldCount 2 (fun _ => True) (-5) 0 = 2 := by sorry

/-- Unit test `ArithmeticStatistics.numberFieldCount_three_neg_twentyfour`: `N₃(⊤; −24, 0) = 1`. -/
example : numberFieldCount 3 (fun _ => True) (-24) 0 = 1 := by sorry

/-- Unit test `ArithmeticStatistics.numberFieldCount_three_fifty`: `N₃(⊤; 0, 50) = 1`. -/
example : numberFieldCount 3 (fun _ => True) 0 50 = 1 := by sorry

/-- Unit test `ArithmeticStatistics.numberFieldCount_one`: `N₁(⊤; 0, X) = 1` for `X > 1`, and
`N₁(⊤; ξ, η) = 0` when `1 ∉ (ξ, η)`. -/
example : (∀ X : ℝ, 1 < X → numberFieldCount 1 (fun _ => True) 0 X = 1) ∧
    ∀ ξ η : ℝ, ¬ (ξ < 1 ∧ 1 < η) → numberFieldCount 1 (fun _ => True) ξ η = 0 := by sorry

/-- Unit test `ArithmeticStatistics.card_subfields_three_neg_twentyfour`: there are three subfields
of `ℚ̄` of degree 3 with `−24 < Disc < 0`, although `N₃(⊤; −24, 0) = 1`. -/
example : (numberFieldsInInterval 3 (fun _ => True) (-24) 0).ncard = 3 := by sorry

/-! ### Class-group torsion -/

/-- `h_m(K) = #Cl(K)[m]`. -/
def classGroupTorsionCard (K : Type*) [Field K] [NumberField K] (m : ℕ) : ℕ :=
  Nat.card {c : ClassGroup (𝓞 K) // c ^ m = 1}

section Torsion
variable (K : Type*) [Field K] [NumberField K]

theorem classGroupTorsionCard_pos (m : ℕ) : 0 < classGroupTorsionCard K m := by sorry

theorem classGroupTorsionCard_dvd_classNumber (m : ℕ) :
    classGroupTorsionCard K m ∣ classNumber K := by sorry

theorem classGroupTorsionCard_mul_of_coprime {m m' : ℕ} (h : Nat.Coprime m m') :
    classGroupTorsionCard K (m * m') = classGroupTorsionCard K m * classGroupTorsionCard K m' := by
  sorry

/-- `h_p(K) = #(Cl(K)/Cl(K)^p) = p^{rk_p Cl(K)}`. -/
theorem classGroupTorsionCard_prime_eq_pow_rank (p : ℕ) [Fact p.Prime] :
    classGroupTorsionCard K p =
      Nat.card (ClassGroup (𝓞 K) ⧸ (powMonoidHom p : ClassGroup (𝓞 K) →* ClassGroup (𝓞 K)).range) := by
  sorry

/-- The quotient on the right is Tau Ceti's `TauCeti.ClassGroup.ElementaryTwoQuotient (𝓞 K)`
(`TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion`). -/
theorem classGroupTorsionCard_two_eq_card_elementaryTwoQuotient :
    classGroupTorsionCard K 2 =
      Nat.card (ClassGroup (𝓞 K) ⧸ (powMonoidHom 2 : ClassGroup (𝓞 K) →* ClassGroup (𝓞 K)).range) := by
  sorry

theorem classGroupTorsionCard_congr {L : Type*} [Field L] [NumberField L] (e : K ≃ₐ[ℚ] L) (m : ℕ) :
    classGroupTorsionCard K m = classGroupTorsionCard L m := by sorry

end Torsion

/-- Unit test `ArithmeticStatistics.classGroupTorsionCard_three_sqrt_neg_twentythree`: for the
quadratic field of discriminant `−23`, `h₃ = 3`. -/
example (K : IntermediateField ℚ Qbar) (h2 : Module.finrank ℚ K = 2)
    (hD : discrOfCharZeroField K = -23) : torsionCardOf K 3 = 3 := by sorry

/-- Unit test `ArithmeticStatistics.classGroupTorsionCard_two_sqrt_neg_five`: for the quadratic
field of discriminant `−20`, `h₂ = 2`. -/
example (K : IntermediateField ℚ Qbar) (h2 : Module.finrank ℚ K = 2)
    (hD : discrOfCharZeroField K = -20) : torsionCardOf K 2 = 2 := by sorry

/-- Unit test `ArithmeticStatistics.classGroupTorsionCard_one`: `h₁(K) = 1`. -/
example (K : Type*) [Field K] [NumberField K] : classGroupTorsionCard K 1 = 1 := by sorry

/-- Unit test `ArithmeticStatistics.classGroupTorsionCard_two_compat`: `h₂(K)` is the order of the
elementary 2-quotient `Cl(K)/Cl(K)²` (Tau Ceti's `ElementaryTwoQuotient`). -/
example (K : Type*) [Field K] [NumberField K] :
    classGroupTorsionCard K 2 =
      Nat.card (ClassGroup (𝓞 K) ⧸ (powMonoidHom 2 : ClassGroup (𝓞 K) →* ClassGroup (𝓞 K)).range) := by
  sorry

/-- Unit test `ArithmeticStatistics.classGroupTorsionCard_three_sqrt_neg_fortyseven`: for the
quadratic field of discriminant `−47` (class number 5), `h₃ = 1 ≠ 5`. -/
example (K : IntermediateField ℚ Qbar) (h2 : Module.finrank ℚ K = 2)
    (hD : discrOfCharZeroField K = -47) : torsionCardOf K 3 = 1 := by sorry

/-! ### Binary cubic forms: splitting symbols and local sets -/

/-- The splitting symbol of a binary cubic form over `𝔽_p`: the multiset of pairs
(degree, multiplicity) of its distinct irreducible factors, the point `(1 : 0)` contributing
`(1, 3 − deg f(x, 1))`. -/
def cubicSplittingSymbolModP (p : ℕ) [Fact p.Prime] (F : BinaryCubicForm (ZMod p)) : Multiset (ℕ × ℕ) :=
  let P : Polynomial (ZMod p) := F.toCubic.toPoly
  let fs := UniqueFactorizationMonoid.normalizedFactors P
  (fs.dedup.map fun g => (g.natDegree, fs.count g)) +
    (if P.natDegree < 3 then {(1, 3 - P.natDegree)} else 0)

/-- The splitting symbol `(f, p)` of an integral binary cubic form. -/
def cubicSplittingSymbol (f : BinaryCubicForm ℤ) (p : ℕ) [Fact p.Prime] : Multiset (ℕ × ℕ) :=
  cubicSplittingSymbolModP p (f.map (Int.castRingHom (ZMod p)))

/-- The five symbols `(111), (12), (3), (1²1), (1³)`. -/
def sym111 : Multiset (ℕ × ℕ) := {(1, 1), (1, 1), (1, 1)}
/-- The symbol `(12)`. -/
def sym12 : Multiset (ℕ × ℕ) := {(1, 1), (2, 1)}
/-- The symbol `(3)`. -/
def sym3 : Multiset (ℕ × ℕ) := {(3, 1)}
/-- The symbol `(1²1)`. -/
def sym121 : Multiset (ℕ × ℕ) := {(1, 2), (1, 1)}
/-- The symbol `(1³)`. -/
def sym13 : Multiset (ℕ × ℕ) := {(1, 3)}

/-- `p` divides every coefficient. -/
def cubicDivisibleBy (p : ℕ) (f : BinaryCubicForm ℤ) : Prop :=
  (p : ℤ) ∣ f.a ∧ (p : ℤ) ∣ f.b ∧ (p : ℤ) ∣ f.c ∧ (p : ℤ) ∣ f.d

/-- `T_p(σ)`: forms not divisible by `p` with splitting symbol `σ`. -/
def splittingTypeSet (p : ℕ) [Fact p.Prime] (σ : Multiset (ℕ × ℕ)) : Set (BinaryCubicForm ℤ) :=
  {f | ¬ cubicDivisibleBy p f ∧ cubicSplittingSymbol f p = σ}

/-- `V_p = U_p \ T_p(1³)`: maximal and not totally ramified at `p`. -/
def maximalNotTotallyRamifiedSet (p : ℕ) [Fact p.Prime] : Set (BinaryCubicForm ℤ) :=
  BinaryCubicForm.U p \ splittingTypeSet p sym13

/-- `Y_p = U_p ∩ T_p(1³)`: maximal and totally ramified at `p`. -/
def maximalTotallyRamifiedSet (p : ℕ) [Fact p.Prime] : Set (BinaryCubicForm ℤ) :=
  BinaryCubicForm.U p ∩ splittingTypeSet p sym13

/-- `Z_p = V_ℤ \ V_p`: the forms whose discriminant is not fundamental at `p`. -/
def notFundamentalSet (p : ℕ) [Fact p.Prime] : Set (BinaryCubicForm ℤ) :=
  (maximalNotTotallyRamifiedSet p)ᶜ

section LocalSets
variable (p : ℕ) [Fact p.Prime]

theorem cubicSplittingSymbol_mem_five (f : BinaryCubicForm ℤ) (hf : ¬ cubicDivisibleBy p f) :
    cubicSplittingSymbol f p ∈ ({sym111, sym12, sym3, sym121, sym13} : Set (Multiset (ℕ × ℕ))) := by
  sorry

theorem cubicSplittingSymbol_smul (γ : GL (Fin 2) ℤ) (f : BinaryCubicForm ℤ) :
    cubicSplittingSymbol (γ • f) p = cubicSplittingSymbol f p := by sorry

theorem splittingTypeSet_mod (σ : Multiset (ℕ × ℕ)) (f g : BinaryCubicForm ℤ)
    (h : f.map (Int.castRingHom (ZMod p)) = g.map (Int.castRingHom (ZMod p))) :
    f ∈ splittingTypeSet p σ ↔ g ∈ splittingTypeSet p σ := by sorry

theorem notFundamentalSet_eq_union :
    notFundamentalSet p = (BinaryCubicForm.U p)ᶜ ∪ maximalTotallyRamifiedSet p ∧
      Disjoint (BinaryCubicForm.U p)ᶜ (maximalTotallyRamifiedSet p) := by sorry

end LocalSets

/-- Unit test `ArithmeticStatistics.cubicSplittingSymbol_xy_xsuby`: `(xy(x − y), p) = (111)`. -/
example (p : ℕ) [Fact p.Prime] : cubicSplittingSymbol ⟨0, 1, -1, 0⟩ p = sym111 := by sorry

/-- Unit test `ArithmeticStatistics.cubicSplittingSymbol_triple`: `(y³ + 2x³, 2) = (1³)` and
`y³ + 2x³ ∈ Y₂`. -/
example [Fact (Nat.Prime 2)] :
    cubicSplittingSymbol ⟨2, 0, 0, 1⟩ 2 = sym13 ∧ (⟨2, 0, 0, 1⟩ : BinaryCubicForm ℤ) ∈ maximalTotallyRamifiedSet 2 := by
  sorry

/-- Unit test `ArithmeticStatistics.splittingTypeSet_zero`: the zero form is in no `T_p(σ)` and not
in `U_p`. -/
example (p : ℕ) [Fact p.Prime] (σ : Multiset (ℕ × ℕ)) :
    (0 : BinaryCubicForm ℤ) ∉ splittingTypeSet p σ ∧ (0 : BinaryCubicForm ℤ) ∉ BinaryCubicForm.U p := by sorry

/-- Unit test `ArithmeticStatistics.notFundamentalSet_mem_pSq`: `y³ + 4x³` has symbol `(1³)` at 2
but is not maximal at 2. -/
example [Fact (Nat.Prime 2)] :
    cubicSplittingSymbol ⟨4, 0, 0, 1⟩ 2 = sym13 ∧ (⟨4, 0, 0, 1⟩ : BinaryCubicForm ℤ) ∉ BinaryCubicForm.U 2 := by
  sorry

/-- Unit test `ArithmeticStatistics.cubicSplittingSymbol_smul_example`: the swap `[[0, 1], [1, 0]]`
sends `x²y` to `−xy²`, and both have symbol `(1²1)`. -/
example (p : ℕ) [Fact p.Prime] (γ : GL (Fin 2) ℤ) (hγ : (γ : Matrix (Fin 2) (Fin 2) ℤ) = !![0, 1; 1, 0]) :
    γ • (⟨0, 1, 0, 0⟩ : BinaryCubicForm ℤ) = ⟨0, 0, -1, 0⟩ ∧ cubicSplittingSymbol ⟨0, 1, 0, 0⟩ p = sym121 := by
  sorry

/-! ### Local densities (BST Lemmas 17–19) -/

/-- The residues modulo `q ^ k` of a set of integral binary cubic forms, as coefficient vectors
(ST.2's `BinaryCubicForm.coeffs`). The density of a set `S` defined modulo `p ^ k` is ST.2's
`(CongruenceConditions.ofResidues {p} (fun _ => k) (cubicResidues S k)).localMass p`, which is
`#(S mod p^k) / p^{4k}` by `CongruenceConditions.localMass_ofResidues`. -/
def cubicResidues (S : Set (BinaryCubicForm ℤ)) (k q : ℕ) : Set (Fin 4 → ZMod (q ^ k)) :=
  (fun f j => ((f.coeffs j : ℤ) : ZMod (q ^ k))) '' S

section Densities
variable (p : ℕ) [Fact p.Prime]

/-- BST Lemma 17. -/
theorem densities_of_splitting_types :
    (CongruenceConditions.ofResidues {p} (fun _ => 1)
      (cubicResidues (splittingTypeSet p sym111) 1)).localMass p =
        (1 / 6) * (p - 1) ^ 2 * p * (p + 1) / p ^ 4 ∧
    (CongruenceConditions.ofResidues {p} (fun _ => 1)
      (cubicResidues (splittingTypeSet p sym12) 1)).localMass p =
        (1 / 2) * (p - 1) ^ 2 * p * (p + 1) / p ^ 4 ∧
    (CongruenceConditions.ofResidues {p} (fun _ => 1)
      (cubicResidues (splittingTypeSet p sym3) 1)).localMass p =
        (1 / 3) * (p - 1) ^ 2 * p * (p + 1) / p ^ 4 ∧
    (CongruenceConditions.ofResidues {p} (fun _ => 1)
      (cubicResidues (splittingTypeSet p sym121) 1)).localMass p =
        (p - 1) * p * (p + 1) / p ^ 4 ∧
    (CongruenceConditions.ofResidues {p} (fun _ => 1)
      (cubicResidues (splittingTypeSet p sym13) 1)).localMass p =
        (p - 1) * (p + 1) / p ^ 4 := by
  sorry

/-- BST Lemma 18 (the two nontrivial cases). -/
theorem densities_of_splitting_types_of_maximal_forms :
    (CongruenceConditions.ofResidues {p} (fun _ => 2)
      (cubicResidues (BinaryCubicForm.U p ∩ splittingTypeSet p sym121) 2)).localMass p =
        (p - 1) ^ 2 * (p + 1) / p ^ 4 ∧
    (CongruenceConditions.ofResidues {p} (fun _ => 2)
      (cubicResidues (BinaryCubicForm.U p ∩ splittingTypeSet p sym13) 2)).localMass p =
        (p - 1) ^ 2 * (p + 1) / p ^ 5 := by
  sorry

/-- BST Lemma 19. -/
theorem densities_of_maximal_and_nowhere_totally_ramified_forms :
    (CongruenceConditions.ofResidues {p} (fun _ => 2)
      (cubicResidues (BinaryCubicForm.U p) 2)).localMass p =
        (p ^ 3 - 1) * (p ^ 2 - 1) / p ^ 5 ∧
    (CongruenceConditions.ofResidues {p} (fun _ => 2)
      (cubicResidues (maximalNotTotallyRamifiedSet p) 2)).localMass p =
        (p ^ 2 - 1) ^ 2 / p ^ 4 := by
  sorry

end Densities

/- The number of `GL₂(ℤ)`-orbits of irreducible binary cubic forms in `S` with `0 < ±Disc < X` is
ST.2's `cubicClassCount (S ∩ intCubicLocus i) X`. -/

/-! ### The Davenport–Heilbronn theorems -/

/-- **Davenport–Heilbronn** (BST Theorem 1). -/
theorem davenport_heilbronn_count_of_cubic_fields :
    Tendsto (fun X : ℝ => (numberFieldCount 3 (fun _ => True) 0 X : ℝ) / X) atTop
        (𝓝 (1 / (12 * (riemannZeta 3).re))) ∧
      Tendsto (fun X : ℝ => (numberFieldCount 3 (fun _ => True) (-X) 0 : ℝ) / X) atTop
        (𝓝 (1 / (4 * (riemannZeta 3).re))) := by
  sorry

/-- `p` is totally ramified in the number field `K`: `p 𝓞_K = 𝔓^{[K : ℚ]}` for a prime `𝔓`. -/
def IsTotallyRamifiedAt (K : Type*) [Field K] [NumberField K] (p : ℕ) : Prop :=
  ∃ P : Ideal (𝓞 K), P.IsMaximal ∧
    Ideal.map (algebraMap ℤ (𝓞 K)) (Ideal.span {(p : ℤ)}) = P ^ Module.finrank ℚ K

/-- The subfield version of `IsTotallyRamifiedAt` (false if not a number field). -/
def IsTotallyRamifiedAtSubfield (K : IntermediateField ℚ Qbar) (p : ℕ) : Prop :=
  ∃ h : FiniteDimensional ℚ K, @IsTotallyRamifiedAt K _ (@NumberField.mk K _ _ h) p

/-- Uniformity for totally ramified primes: the cubic fields totally ramified at `p` with
`|Disc| < X` number `O(X/p²)` uniformly in `p`. -/
theorem cubic_fields_totally_ramified_at_large_primes_are_sparse :
    ∃ C : ℝ, ∀ p : ℕ, p.Prime → ∀ X : ℝ, 1 ≤ X →
      (numberFieldCount 3 (fun K => IsTotallyRamifiedAtSubfield K p) (-X) X : ℝ) ≤ C * X / p ^ 2 := by
  sorry

/-- Hasse's correspondence (BST (59)): the nowhere totally ramified cubic fields with quadratic
resolvent `K₂` (equivalently with `Disc = Disc(K₂)`) number `(h₃(K₂) − 1)/2`. Uses Tau Ceti's
`ClassFieldTheory` Layer 13. -/
theorem three_torsion_of_quadratic_class_groups_counts_cubic_fields (K₂ : IntermediateField ℚ Qbar)
    (h2 : Module.finrank ℚ K₂ = 2) :
    2 * numberFieldCount 3 (fun K => ∀ p : ℕ, p.Prime → ¬ IsTotallyRamifiedAtSubfield K p)
        ((discrOfCharZeroField K₂ : ℝ) - 1 / 2) ((discrOfCharZeroField K₂ : ℝ) + 1 / 2) + 1 =
      torsionCardOf K₂ 3 := by
  sorry

/-- The squarefree integers `n ≤ x` with `n ≡ a (mod 4)`, `a ∈ {1, 2, 3}`, number `(2/π²)x + O(√x)`. -/
theorem squarefree_integers_in_residue_classes_modulo_four :
    ∃ C : ℝ, ∀ a ∈ ({1, 2, 3} : Finset ℕ), ∀ x : ℝ, 1 ≤ x →
      |(((Finset.Icc 1 ⌊x⌋₊).filter (fun n => Squarefree n ∧ n % 4 = a)).card : ℝ) - 2 / Real.pi ^ 2 * x|
        ≤ C * Real.sqrt x := by
  sorry

/-- The number of quadratic fields with `0 < ±Disc < X` is `(3/π²)X + O(√X)`. -/
theorem count_of_quadratic_fields :
    ∃ C : ℝ, ∀ X : ℝ, 1 ≤ X →
      |(numberFieldCount 2 (fun _ => True) 0 X : ℝ) - 3 / Real.pi ^ 2 * X| ≤ C * Real.sqrt X ∧
      |(numberFieldCount 2 (fun _ => True) (-X) 0 : ℝ) - 3 / Real.pi ^ 2 * X| ≤ C * Real.sqrt X := by
  sorry

/-- The quadratic subfields with `0 < Disc < X` (`imaginary = false`) or `−X < Disc < 0`. -/
def quadraticFieldsUpTo (imaginary : Bool) (X : ℝ) : Set (IntermediateField ℚ Qbar) :=
  if imaginary then numberFieldsInInterval 2 (fun _ => True) (-X) 0
  else numberFieldsInInterval 2 (fun _ => True) 0 X

/-- **Davenport–Heilbronn on 3-torsion** (BST Theorem 2): the mean of `#Cl(K)[3]` is `4/3` over
real and `2` over imaginary quadratic fields. -/
theorem davenport_heilbronn_mean_of_three_torsion :
    Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo false X, (torsionCardOf K 3 : ℝ)) /
        (quadraticFieldsUpTo false X).ncard) atTop (𝓝 (4 / 3)) ∧
      Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo true X, (torsionCardOf K 3 : ℝ)) /
        (quadraticFieldsUpTo true X).ncard) atTop (𝓝 2) := by
  sorry

/-! ### Local specifications and BST Theorem 8 -/

/-- A local specification for cubic orders: `GL₂(ℤ_p)`-invariant sets of nondegenerate binary
cubic forms over `ℤ_p` for every prime `p`, and a set of real types (`true` = `ℝ³`,
`false` = `ℝ ⊕ ℂ`). -/
structure CubicLocalSpecification where
  /-- `Σ_p`, as forms over `ℤ_p`. -/
  atPrime : (p : Nat.Primes) → Set (BinaryCubicForm (@PadicInt p ⟨p.prop⟩))
  /-- `Σ_∞`. -/
  atInfinity : Set Bool
  /-- `Σ_p` is a union of `GL₂(ℤ_p)`-orbits. -/
  invariant : ∀ (p : Nat.Primes) (γ : GL (Fin 2) (@PadicInt p ⟨p.prop⟩)) f,
    f ∈ atPrime p → γ • f ∈ atPrime p
  /-- `Σ_p` consists of nondegenerate forms. -/
  nondegenerate : ∀ (p : Nat.Primes) f, f ∈ atPrime p → f.disc ≠ 0

namespace CubicLocalSpecification

/-- The forms over `ℤ_p` that are maximal and not totally ramified at `p` (the image of `V_p`). -/
def localNowhereTotallyRamified (p : Nat.Primes) : Set (BinaryCubicForm (@PadicInt p ⟨p.prop⟩)) :=
  haveI : Fact (p : ℕ).Prime := ⟨p.prop⟩
  {f | ∃ g ∈ maximalNotTotallyRamifiedSet p, ∀ k : ℕ,
    (f.map (PadicInt.toZModPow k)) = (g.map (Int.castRingHom (ZMod ((p : ℕ) ^ k))))}

/-- The forms over `ℤ_p` that are maximal at `p` (the image of `U_p`). -/
def localMaximal (p : Nat.Primes) : Set (BinaryCubicForm (@PadicInt p ⟨p.prop⟩)) :=
  haveI : Fact (p : ℕ).Prime := ⟨p.prop⟩
  {f | ∃ g ∈ BinaryCubicForm.U p, ∀ k : ℕ,
    (f.map (PadicInt.toZModPow k)) = (g.map (Int.castRingHom (ZMod ((p : ℕ) ^ k))))}

/-- Acceptable: for all large `p`, `Σ_p` contains the maximal, not totally ramified forms. -/
def IsAcceptable (S : CubicLocalSpecification) : Prop :=
  ∃ N : ℕ, ∀ p : Nat.Primes, N ≤ (p : ℕ) →
    {f ∈ localNowhereTotallyRamified p | f.disc ≠ 0} ⊆ S.atPrime p

/-- Strongly acceptable: for all large `p`, `Σ_p` is one of the three standard sets. -/
def IsStronglyAcceptable (S : CubicLocalSpecification) : Prop :=
  ∃ N : ℕ, ∀ p : Nat.Primes, N ≤ (p : ℕ) →
    S.atPrime p = {f | f.disc ≠ 0} ∨ S.atPrime p = {f ∈ localMaximal p | f.disc ≠ 0} ∨
      S.atPrime p = {f ∈ localNowhereTotallyRamified p | f.disc ≠ 0}

theorem IsStronglyAcceptable.isAcceptable {S : CubicLocalSpecification} (h : S.IsStronglyAcceptable) :
    S.IsAcceptable := by sorry

/-- The specification of maximal orders. -/
def maximal : CubicLocalSpecification where
  atPrime p := {f ∈ localMaximal p | f.disc ≠ 0}
  atInfinity := Set.univ
  invariant := by sorry
  nondegenerate := fun _ _ h => h.2

/-- The specification of maximal orders not totally ramified at any prime. -/
def nowhereTotallyRamified : CubicLocalSpecification where
  atPrime p := {f ∈ localNowhereTotallyRamified p | f.disc ≠ 0}
  atInfinity := Set.univ
  invariant := by sorry
  nondegenerate := fun _ _ h => h.2

/-- The local mass `m_p(Σ_p) = Σ_{R ∈ Σ_p} 1/(Disc_p(R) #Aut(R))`, summing over orbit
representatives (`Quot.out`). -/
def localMass (S : CubicLocalSpecification) (p : Nat.Primes) : ℝ :=
  haveI : Fact (p : ℕ).Prime := ⟨p.prop⟩
  ∑' C : Quot (fun f g : S.atPrime p => ∃ γ : GL (Fin 2) ℤ_[p], γ • f.1 = g.1),
    1 / (((p : ℕ) : ℝ) ^ (PadicInt.valuation (C.out.1.disc)) *
      Nat.card {γ : GL (Fin 2) ℤ_[p] // γ • C.out.1 = C.out.1})

/-- The archimedean mass `m_∞(Σ_∞) = Σ_{R ∈ Σ_∞} 1/#Aut(R)`. -/
def archimedeanMass (S : CubicLocalSpecification) : ℝ :=
  (if true ∈ S.atInfinity then 1 / 6 else 0) + (if false ∈ S.atInfinity then 1 / 2 else 0)

end CubicLocalSpecification

/-- Unit test `ArithmeticStatistics.CubicLocalSpecification.maximal_isStronglyAcceptable`. -/
example : CubicLocalSpecification.maximal.IsStronglyAcceptable := by sorry

/-- Unit test `ArithmeticStatistics.CubicLocalSpecification.localMass_maximal`:
`m_p(all maximal) = 1 + 1/p + 1/p²`. -/
example (p : Nat.Primes) :
    CubicLocalSpecification.maximal.localMass p =
        1 + 1 / (p : ℝ) + 1 / (p : ℝ) ^ 2 := by sorry

/-- Unit test `ArithmeticStatistics.CubicLocalSpecification.archimedeanMass_both`: `m_∞ = 2/3`. -/
example : CubicLocalSpecification.maximal.archimedeanMass = 2 / 3 := by sorry

/-- Unit test `ArithmeticStatistics.CubicLocalSpecification.archimedeanMass_empty`: `m_∞(∅) = 0`. -/
example (S : CubicLocalSpecification) (h : S.atInfinity = ∅) : S.archimedeanMass = 0 := by sorry

/-- Unit test `ArithmeticStatistics.CubicLocalSpecification.not_isAcceptable_totallyRamified`: the
specification of maximal totally ramified orders at every `p` is not acceptable. -/
example (S : CubicLocalSpecification)
    (h : ∀ p : Nat.Primes, S.atPrime p = {f ∈ CubicLocalSpecification.localMaximal p |
      f.disc ≠ 0 ∧ f ∉ CubicLocalSpecification.localNowhereTotallyRamified p}) :
    ¬ S.IsAcceptable := by sorry

/-- The integral forms whose rings are `Σ`-orders. -/
def sigmaForms (S : CubicLocalSpecification) : Set (BinaryCubicForm ℤ) :=
  {f | (∀ p : Nat.Primes, f.map (@Int.castRingHom (@PadicInt p ⟨p.prop⟩) _) ∈ S.atPrime p) ∧
    decide (0 < f.disc) ∈ S.atInfinity}

/-- **BST Theorem 8**: the density of `Σ`-orders for an acceptable `Σ`. -/
theorem density_of_cubic_orders_with_local_specifications (S : CubicLocalSpecification)
    (hS : S.IsAcceptable) :
    Tendsto (fun X : ℝ => (cubicClassCount (sigmaForms S) X : ℝ) / X) atTop
      (𝓝 ((1 / 2) * S.archimedeanMass *
        ∏' p : Nat.Primes, ((p : ℝ) - 1) / p * S.localMass p)) := by
  sorry

/-! ### Second main terms (BST Theorems 3 and 4; Theorem 7 needs Haar measure on `ℤ_p²` and is
left out here) -/

/-- **BST Theorem 3** (Roberts' conjecture). -/
theorem roberts_second_order_term_for_cubic_fields (ε : ℝ) (hε : 0 < ε) :
    (fun X : ℝ => (numberFieldCount 3 (fun _ => True) 0 X : ℝ) -
        (X / (12 * (riemannZeta 3).re) +
          4 * (riemannZeta (1 / 3)).re / (5 * Real.Gamma (2 / 3) ^ 3 * (riemannZeta (5 / 3)).re) *
            X ^ ((5 : ℝ) / 6)))
      =O[atTop] (fun X : ℝ => X ^ ((5 : ℝ) / 6 - 1 / 48 + ε)) ∧
    (fun X : ℝ => (numberFieldCount 3 (fun _ => True) (-X) 0 : ℝ) -
        (X / (4 * (riemannZeta 3).re) +
          Real.sqrt 3 * 4 * (riemannZeta (1 / 3)).re /
            (5 * Real.Gamma (2 / 3) ^ 3 * (riemannZeta (5 / 3)).re) * X ^ ((5 : ℝ) / 6)))
      =O[atTop] (fun X : ℝ => X ^ ((5 : ℝ) / 6 - 1 / 48 + ε)) := by
  sorry

/-- The Euler product `∏_p (1 − (p^{1/3} + 1)/(p(p + 1)))` of BST Theorem 4. -/
def threeTorsionSecondOrderProduct : ℝ :=
  ∏' p : Nat.Primes, (1 - (((p : ℝ) ^ ((1 : ℝ) / 3) + 1) / ((p : ℝ) * ((p : ℝ) + 1))))

/-- **BST Theorem 4**. -/
theorem second_order_term_for_the_mean_of_three_torsion (ε : ℝ) (hε : 0 < ε) :
    (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo false X, (torsionCardOf K 3 : ℝ)) -
        ((4 / 3) * (quadraticFieldsUpTo false X).ncard +
          8 * (riemannZeta (1 / 3)).re / (5 * Real.Gamma (2 / 3) ^ 3) *
            threeTorsionSecondOrderProduct * X ^ ((5 : ℝ) / 6)))
      =O[atTop] (fun X : ℝ => X ^ ((5 : ℝ) / 6 - 1 / 48 + ε)) ∧
    (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo true X, (torsionCardOf K 3 : ℝ)) -
        (2 * (quadraticFieldsUpTo true X).ncard +
          Real.sqrt 3 * 8 * (riemannZeta (1 / 3)).re / (5 * Real.Gamma (2 / 3) ^ 3) *
            threeTorsionSecondOrderProduct * X ^ ((5 : ℝ) / 6)))
      =O[atTop] (fun X : ℝ => X ^ ((5 : ℝ) / 6 - 1 / 48 + ε)) := by
  sorry

/-! ### Binary quadratic forms (Mertens, Siegel) and the classical counts -/

/-- The substitution `f ↦ f((x, y)γ)` on binary quadratic forms `(a, b, c)`. -/
def quadFormSubst (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (q : ℤ × ℤ × ℤ) : ℤ × ℤ × ℤ :=
  let m : Matrix (Fin 2) (Fin 2) ℤ := γ
  let α := m 0 0
  let β := m 0 1
  let c' := m 1 0
  let δ := m 1 1
  (q.1 * α ^ 2 + q.2.1 * α * β + q.2.2 * β ^ 2,
   2 * q.1 * α * c' + q.2.1 * (α * δ + β * c') + 2 * q.2.2 * β * δ,
   q.1 * c' ^ 2 + q.2.1 * c' * δ + q.2.2 * δ ^ 2)

/-- The number of `SL₂(ℤ)`-classes of positive definite forms `ax² + bxy + cy²` with
`0 < 4ac − b² < X` (all forms, primitive or not). -/
def positiveDefiniteClassCount (X : ℝ) : ℕ :=
  Nat.card (Quot (fun q r : {q : ℤ × ℤ × ℤ // 0 < q.1 ∧ 0 < 4 * q.1 * q.2.2 - q.2.1 ^ 2 ∧
      ((4 * q.1 * q.2.2 - q.2.1 ^ 2 : ℤ) : ℝ) < X} =>
    ∃ γ : Matrix.SpecialLinearGroup (Fin 2) ℤ, quadFormSubst γ q.1 = r.1))

/-- **Mertens**: `Σ_{−X<D<0} h⁺(D) = (π/18) X^{3/2} + O(X log X)`. -/
theorem mertens_count_of_positive_definite_binary_quadratic_forms :
    (fun X : ℝ => (positiveDefiniteClassCount X : ℝ) - Real.pi / 18 * X ^ ((3 : ℝ) / 2))
      =O[atTop] (fun X : ℝ => X * Real.log X) := by
  sorry

/-- `log ε_D` for a positive non-square discriminant `D`: `ε_D = (t + u√D)/2` for the least
positive solution of `t² − Du² = 4`. -/
def pellRegulator (D : ℕ) : ℝ :=
  sInf {r : ℝ | ∃ t u : ℕ, 0 < t ∧ 0 < u ∧ (t : ℤ) ^ 2 - D * u ^ 2 = 4 ∧
    r = Real.log ((t + u * Real.sqrt D) / 2)}

/-- The number of `SL₂(ℤ)`-classes of integral binary quadratic forms of discriminant `D`. -/
def quadraticFormClassNumber (D : ℤ) : ℕ :=
  Nat.card (Quot (fun q r : {q : ℤ × ℤ × ℤ // q.2.1 ^ 2 - 4 * q.1 * q.2.2 = D} =>
    ∃ γ : Matrix.SpecialLinearGroup (Fin 2) ℤ, quadFormSubst γ q.1 = r.1))

/-- **Siegel**: `Σ_{0<D<X} h_D log ε_D ~ (π²/18) X^{3/2}`. -/
theorem siegel_count_of_indefinite_binary_quadratic_forms :
    Tendsto (fun X : ℝ => (∑ D ∈ (Finset.range ⌈X⌉₊).filter (fun D => 0 < D ∧ ¬ IsSquare D),
        (quadraticFormClassNumber D : ℝ) * pellRegulator D) / X ^ ((3 : ℝ) / 2)) atTop
      (𝓝 (Real.pi ^ 2 / 18)) := by
  sorry

/-- **The classical counts** (BS Theorems 1.4 and 1.5, with 1.4(a) corrected). -/
theorem quoted_classical_counts_for_binary_quadratic_and_cubic_forms :
    Tendsto (fun X : ℝ => (positiveDefiniteClassCount X : ℝ) / X ^ ((3 : ℝ) / 2)) atTop
        (𝓝 (Real.pi / 18)) ∧
      Tendsto (fun X : ℝ => (∑ D ∈ (Finset.range ⌈X⌉₊).filter (fun D => 0 < D ∧ ¬ IsSquare D),
        (quadraticFormClassNumber D : ℝ) * pellRegulator D) / X ^ ((3 : ℝ) / 2)) atTop
        (𝓝 (Real.pi ^ 2 / 18)) ∧
      Tendsto (fun X : ℝ => (cubicClassCount (intCubicLocus 1) X : ℝ) / X) atTop
        (𝓝 (Real.pi ^ 2 / 24)) ∧
      Tendsto (fun X : ℝ => (cubicClassCount (intCubicLocus 0) X : ℝ) / X) atTop
        (𝓝 (Real.pi ^ 2 / 72)) := by
  sorry

/-! ### Quartic and quintic fields; global fields -/

/-- `q(k, m)`: the number of partitions of `k` into at most `m` parts (`0` for `k < 0`). -/
def partitionsAtMost (k : ℤ) (m : ℕ) : ℕ :=
  if k < 0 then 0 else Nat.card {π : Nat.Partition k.toNat // π.parts.card ≤ m}

/-- The number of elements of order dividing 2 in `Sₙ`. -/
def involutionCount (n : ℕ) : ℕ := Nat.card {σ : Equiv.Perm (Fin n) // σ ^ 2 = 1}

/-- The Euler factor `Σ_{k=0}^{n} (q(k, n − k) − q(k − 1, n − k + 1)) t^k` at `t = N𝔭^{-1}`. -/
def bhargavaLocalFactor (n : ℕ) (t : ℝ) : ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    ((partitionsAtMost k (n - k) : ℝ) - partitionsAtMost ((k : ℤ) - 1) (n - k + 1)) * t ^ k

/-- **Bhargava's quartic count**: `N₄^{(r₂)}(X) ~ c(r₂) ∏_p (1 + p⁻² − p⁻³ − p⁻⁴) X` with
`c = 1/48, 1/8, 1/16`. -/
theorem bhargava_count_of_quartic_fields :
    ∀ r₂ ∈ ({0, 1, 2} : Finset ℕ),
      Tendsto (fun X : ℝ => (numberFieldCount 4 (fun K => HasGaloisGroup 4 ⊤ K ∧
          nrComplexPlacesOf K = r₂) (-X) X : ℝ) / X) atTop
        (𝓝 ((if r₂ = 0 then 1 / 48 else if r₂ = 1 then 1 / 8 else 1 / 16) *
          ∏' p : Nat.Primes, (1 + (p : ℝ) ^ (-2 : ℤ) - (p : ℝ) ^ (-3 : ℤ) - (p : ℝ) ^ (-4 : ℤ)))) := by
  sorry

/-- **Bhargava's quintic count**: constants `1/240, 1/24, 1/16`. -/
theorem bhargava_count_of_quintic_fields :
    ∀ r₂ ∈ ({0, 1, 2} : Finset ℕ),
      Tendsto (fun X : ℝ => (numberFieldCount 5 (fun K => HasGaloisGroup 5 ⊤ K ∧
          nrComplexPlacesOf K = r₂) (-X) X : ℝ) / X) atTop
        (𝓝 ((if r₂ = 0 then 1 / 240 else if r₂ = 1 then 1 / 24 else 1 / 16) *
          ∏' p : Nat.Primes, (1 + (p : ℝ) ^ (-2 : ℤ) - (p : ℝ) ^ (-4 : ℤ) - (p : ℝ) ^ (-5 : ℤ)))) := by
  sorry

/-- **Bhargava–Shankar–Wang, Theorem 1(a)**: the density of `Sₙ`-extensions of a number field `F`
(`n ≤ 5`), with the Dedekind residue. The weighted count `Σ 1/#Aut` equals the number of subfields
of `F̄` divided by `n`. -/
theorem bhargava_shankar_wang_counts_over_number_fields (F : Type) [Field F] [NumberField F]
    (n : ℕ) (hn : n ∈ ({2, 3, 4, 5} : Finset ℕ)) :
    Tendsto (fun X : ℝ =>
        (({L : IntermediateField F (AlgebraicClosure F) | Module.finrank F L = n ∧
            HasGaloisGroupOver F n ⊤ L ∧
            (|discrOfCharZeroField L| : ℝ) ≤ X * |(NumberField.discr F : ℝ)| ^ n}.ncard : ℝ) / n) / X)
      atTop
      (𝓝 ((1 / 2) * dedekindZeta_residue F *
        ((involutionCount n : ℝ) / n.factorial) ^ InfinitePlace.nrRealPlaces F *
        (1 / (n.factorial : ℝ)) ^ InfinitePlace.nrComplexPlaces F *
        ∏' P : {P : Ideal (𝓞 F) // P.IsMaximal ∧ P ≠ ⊥},
          bhargavaLocalFactor n (1 / (Ideal.absNorm P.1 : ℝ)))) := by
  sorry

/-- The cubic `S₃`-subfields with `r₂ = r` and `|Disc| < X`. -/
def cubicS3FieldsUpTo (r : ℕ) (X : ℝ) : Set (IntermediateField ℚ Qbar) :=
  numberFieldsInInterval 3 (fun K => HasGaloisGroup 3 ⊤ K ∧ nrComplexPlacesOf K = r) (-X) X

/-- **Bhargava**: the mean of `#Cl(K)[2]` over `S₃`-cubic fields is `5/4` (totally real) and `3/2`
(complex). The narrow-class-group means `2` and `3/2` need the narrow class group (Tau Ceti's
`NumberField.NarrowClassGroup`) and are left out here. -/
theorem bhargava_mean_of_two_torsion_in_cubic_class_groups :
    Tendsto (fun X : ℝ => (∑ᶠ K ∈ cubicS3FieldsUpTo 0 X, (torsionCardOf K 2 : ℝ)) /
        (cubicS3FieldsUpTo 0 X).ncard) atTop (𝓝 (5 / 4)) ∧
      Tendsto (fun X : ℝ => (∑ᶠ K ∈ cubicS3FieldsUpTo 1 X, (torsionCardOf K 2 : ℝ)) /
        (cubicS3FieldsUpTo 1 X).ncard) atTop (𝓝 (3 / 2)) := by
  sorry

/-! ### Moments of 4-ranks and the Cohen–Lenstra moment prediction -/

/-- `2^{rk₄ Cl(K)} = #(Cl(K)²[2])`, the number of 2-torsion classes that are squares. -/
def fourRankPow (L : Type*) [Field L] [CharZero L] : ℕ :=
  if h : FiniteDimensional ℚ L then
    haveI : NumberField L := @NumberField.mk L _ _ h
    Nat.card {c : ClassGroup (𝓞 L) // c ^ 2 = 1 ∧ ∃ d, d ^ 2 = c}
  else 0

/-- **Fouvry–Klüners** (imaginary quadratic fields, where the narrow and wide class groups agree):
the mean of `2^{k·rk₄}` is the number of subspaces of `𝔽₂^k`. The real quadratic statement uses
the narrow class group and is left out here. -/
theorem fouvry_kluners_moments_of_four_ranks (k : ℕ) :
    Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo true X, (fourRankPow K : ℝ) ^ k) /
        (quadraticFieldsUpTo true X).ncard) atTop
      (𝓝 (Nat.card (Submodule (ZMod 2) (Fin k → ZMod 2)) : ℝ)) := by
  sorry

/-- **The Cohen–Lenstra moment prediction** `Conj^±(p, α)` for odd `p`, as a proposition (never
assumed): the mean over quadratic fields of one sign of `∏_{i<α} (h_p(K) − p^i)` is `1`
(imaginary) or `p^{−α}` (real). The `p = 2` (Gerth) form uses squares of the narrow class group and
is not prototyped here. -/
def cohenLenstraMomentPrediction (p : ℕ) (_hp : Odd p) (α : ℕ) (imaginary : Bool) : Prop :=
  Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo imaginary X,
      ∏ i ∈ Finset.range α, ((torsionCardOf K p : ℝ) - (p : ℝ) ^ i)) /
        (quadraticFieldsUpTo imaginary X).ncard) atTop
    (𝓝 (if imaginary then 1 else (p : ℝ) ^ (-(α : ℤ))))

theorem cohenLenstraMomentPrediction_zero (p : ℕ) (hp : Odd p) (imaginary : Bool) :
    cohenLenstraMomentPrediction p hp 0 imaginary := by sorry

theorem cohenLenstraMomentPrediction_three_one :
    (cohenLenstraMomentPrediction 3 (by decide) 1 true ∧ cohenLenstraMomentPrediction 3 (by decide) 1 false) ↔
      (Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo false X, (torsionCardOf K 3 : ℝ)) /
          (quadraticFieldsUpTo false X).ncard) atTop (𝓝 (4 / 3)) ∧
        Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo true X, (torsionCardOf K 3 : ℝ)) /
          (quadraticFieldsUpTo true X).ncard) atTop (𝓝 2)) := by
  sorry

theorem cohenLenstraMomentPrediction_iff_mean_torsion (p : ℕ) (hp : Odd p) (imaginary : Bool) :
    cohenLenstraMomentPrediction p hp 1 imaginary ↔
      Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo imaginary X, (torsionCardOf K p : ℝ)) /
          (quadraticFieldsUpTo imaginary X).ncard) atTop
        (𝓝 (if imaginary then 2 else 1 + 1 / (p : ℝ))) := by
  sorry

/-- The predicted value `|A|^{−u}` for `A = (ℤ/p)^α`, `u = 0` (imaginary) or `1` (real). -/
theorem cohenLenstraMomentPrediction_target (p α : ℕ) (imaginary : Bool) :
    (if imaginary then (1 : ℝ) else (p : ℝ) ^ (-(α : ℤ))) =
      ((p : ℝ) ^ α) ^ (-(if imaginary then (0 : ℤ) else 1)) := by
  sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMomentPrediction_zero_holds`: `Conj^±(p, 0)`. -/
example (p : ℕ) (hp : Odd p) (imaginary : Bool) : cohenLenstraMomentPrediction p hp 0 imaginary := by
  sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMomentPrediction_three_one_imag`: the imaginary half
of Davenport–Heilbronn implies `Conj^−(3, 1)`. -/
example (h : Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo true X, (torsionCardOf K 3 : ℝ)) /
      (quadraticFieldsUpTo true X).ncard) atTop (𝓝 2)) :
    cohenLenstraMomentPrediction 3 (by decide) 1 true := by sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMomentPrediction_target_real`: the predicted real
moment for `p = 5`, `α = 2` is `1/25`. -/
example : (if false then (1 : ℝ) else (5 : ℝ) ^ (-((2 : ℕ) : ℤ))) = 1 / 25 := by sorry

/-- The class number of a characteristic-zero field (`0` if not a number field). -/
def classNumberOf (L : Type*) [Field L] [CharZero L] : ℕ :=
  if h : FiniteDimensional ℚ L then @NumberField.classNumber L _ (@NumberField.mk L _ _ h) else 0

/-- Unit test `ArithmeticStatistics.cohenLenstraMomentPrediction_not_mean_classNumber`: the mean
class number of imaginary quadratic fields does not tend to `2` (it is unbounded), so the
prediction `Conj^−(3, 1)` is about `h₃`, not the class number. -/
example : ¬ Tendsto (fun X : ℝ => (∑ᶠ K ∈ quadraticFieldsUpTo true X, (classNumberOf K : ℝ)) /
    (quadraticFieldsUpTo true X).ncard) atTop (𝓝 2) := by
  sorry

/-! ### Malle's invariants and Malle's conjecture -/

/-- `ind(g) = n − #orbits(g) = #support(g) − #cycles(g)`. -/
def malleIndex {n : ℕ} (g : Equiv.Perm (Fin n)) : ℕ := g.support.card - g.cycleType.card

/-- `ind(G) = min_{g ≠ 1} ind(g)`. -/
def malleIndexGroup {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) : ℕ :=
  sInf {m | ∃ g ∈ G, g ≠ 1 ∧ malleIndex g = m}

/-- `a(G) = ind(G)⁻¹`. -/
def malleA {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) : ℚ := 1 / malleIndexGroup G

/-- `b(k, G)`: the number of orbits of `H ≤ (ℤ/e)ˣ` (the image of `Gal(k(ζ_e)/k)`, `e` a multiple
of the exponent of `G`) acting by powering on the conjugacy classes of `G` of minimal index. -/
def malleB {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) (e : ℕ) (H : Subgroup (ZMod e)ˣ) : ℕ :=
  Nat.card (Quot (fun C D : {C : ConjClasses G // ∃ g : G, ConjClasses.mk g = C ∧ g ≠ 1 ∧
      malleIndex (g : Equiv.Perm (Fin n)) = malleIndexGroup G} =>
    ∃ u ∈ H, ∃ g : G, ConjClasses.mk g = C.1 ∧ ConjClasses.mk (g ^ ((u : ZMod e).val)) = D.1))

theorem malleIndex_conj {n : ℕ} (g h : Equiv.Perm (Fin n)) : malleIndex (h * g * h⁻¹) = malleIndex g := by
  sorry

theorem malleIndex_pow_of_isUnit {n : ℕ} (g : Equiv.Perm (Fin n)) (u : ℕ) (hu : Nat.Coprime u (orderOf g)) :
    malleIndex (g ^ u) = malleIndex g := by
  sorry

theorem malleB_pos {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) (hG : G ≠ ⊥) (e : ℕ) (H : Subgroup (ZMod e)ˣ) :
    1 ≤ malleB G e H := by
  sorry

theorem malleB_anti {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) (e : ℕ) {H H' : Subgroup (ZMod e)ˣ}
    (hH : H ≤ H') : malleB G e H' ≤ malleB G e H := by
  sorry

/-- Unit test `ArithmeticStatistics.malleA_perm_top`: `a(Sₙ) = 1` and `b(ℚ, Sₙ) = 1`. -/
example (n : ℕ) (hn : 2 ≤ n) :
    malleA (⊤ : Subgroup (Equiv.Perm (Fin n))) = 1 ∧ malleB (⊤ : Subgroup (Equiv.Perm (Fin n))) n.factorial ⊤ = 1 := by
  sorry

/-- Unit test `ArithmeticStatistics.malleA_cyclic_regular`: for a prime `ℓ` and `C_ℓ` regular,
`a = 1/(ℓ − 1)` and `b(ℚ) = 1`. -/
example (ℓ : ℕ) (hℓ : ℓ.Prime) (g : Equiv.Perm (Fin ℓ)) (hg : g.IsCycle) (hsupp : g.support = Finset.univ) :
    malleA (Subgroup.zpowers g) = 1 / (ℓ - 1) ∧ malleB (Subgroup.zpowers g) ℓ ⊤ = 1 := by
  sorry

/-- Unit test `ArithmeticStatistics.malleB_cyclic_three_over_cyclotomic`: for `C₃ ≤ S₃` and `k ∋ ζ₃`
(`H = 1`), `b = 2`. -/
example (g : Equiv.Perm (Fin 3)) (hg : g.IsCycle) (hsupp : g.support = Finset.univ) :
    malleB (Subgroup.zpowers g) 3 ⊥ = 2 := by
  sorry

/-- Unit test `ArithmeticStatistics.malleA_two`: `a(S₂) = 1`, `b(ℚ, S₂) = 1`. -/
example : malleA (⊤ : Subgroup (Equiv.Perm (Fin 2))) = 1 ∧ malleB (⊤ : Subgroup (Equiv.Perm (Fin 2))) 2 ⊤ = 1 := by
  sorry

/-- Unit test `ArithmeticStatistics.malleB_needs_cyclotomic_action`: without the cyclotomic action
(`H = 1`), `C₃ ≤ S₃` has 2 minimal classes, not `b(ℚ, C₃) = 1`. -/
example (g : Equiv.Perm (Fin 3)) (hg : g.IsCycle) (hsupp : g.support = Finset.univ) :
    malleB (Subgroup.zpowers g) 3 ⊥ ≠ malleB (Subgroup.zpowers g) 3 ⊤ := by
  sorry

/-- The count `N_n(Gal = G; −X, X)` of number fields with Galois group `G`. -/
def galoisGroupCount {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) (X : ℝ) : ℕ :=
  numberFieldCount n (HasGaloisGroup n G) (-X) X

/-- **Malle's conjecture, strong form** over `ℚ`, as a proposition (never assumed). -/
def malleStrong {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) : Prop :=
  ∃ c : ℝ, 0 < c ∧ Tendsto (fun X : ℝ => (galoisGroupCount G X : ℝ) /
    (c * X ^ (malleA G : ℝ) * Real.log X ^ ((malleB G (Nat.card G) ⊤ : ℝ) - 1))) atTop (𝓝 1)

/-- **Malle's conjecture, weak form** over `ℚ`, as a proposition (never assumed). -/
def malleWeak {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) : Prop :=
  (∃ c₁ : ℝ, 0 < c₁ ∧ ∀ᶠ X in atTop, c₁ * X ^ (malleA G : ℝ) ≤ galoisGroupCount G X) ∧
    ∀ ε : ℝ, 0 < ε → ∃ c₂ : ℝ, ∀ᶠ X in atTop, (galoisGroupCount G X : ℝ) ≤ c₂ * X ^ ((malleA G : ℝ) + ε)

theorem malleStrong_imp_malleWeak {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) (h : malleStrong G) :
    malleWeak G := by sorry

/-- The subfield count `Z(ℚ, G; x)` differs from the isomorphism-class count by the constant
factor `n/#Aut(K)`, so the strong form is the same statement for either count. -/
theorem malleStrong_iff_subfield_count {n : ℕ} (G : Subgroup (Equiv.Perm (Fin n))) :
    malleStrong G ↔ ∃ c : ℝ, 0 < c ∧ Tendsto (fun X : ℝ =>
      (numberFieldsInInterval n (HasGaloisGroup n G) (-X) X).ncard /
        (c * X ^ (malleA G : ℝ) * Real.log X ^ ((malleB G (Nat.card G) ⊤ : ℝ) - 1))) atTop (𝓝 1) := by
  sorry

theorem malleStrong_symmetric_two : malleStrong (⊤ : Subgroup (Equiv.Perm (Fin 2))) := by sorry

/-- The wreath product `C₃ ≀ C₂ ≤ S₆`, generated by `(0 1 2)`, `(3 4 5)` and `(0 3)(1 4)(2 5)`. -/
def wreathC3C2 : Subgroup (Equiv.Perm (Fin 6)) :=
  Subgroup.closure {Equiv.swap 0 1 * Equiv.swap 1 2, Equiv.swap 3 4 * Equiv.swap 4 5,
    Equiv.swap 0 3 * Equiv.swap 1 4 * Equiv.swap 2 5}

/-- **Klüners' counterexample**: the strong Malle conjecture fails for `C₃ ≀ C₂` over `ℚ`. -/
theorem kluners_counterexample_to_malle_conjecture : ¬ malleStrong wreathC3C2 := by sorry

/-- Unit test `ArithmeticStatistics.malleStrong_S2`: `MalleStrong(ℚ, S₂)`. -/
example : malleStrong (⊤ : Subgroup (Equiv.Perm (Fin 2))) := by sorry

/-- Unit test `ArithmeticStatistics.malleStrong_S3`: the Davenport–Heilbronn theorem gives
`MalleStrong(ℚ, S₃)`. -/
example (h : Tendsto (fun X : ℝ => (numberFieldCount 3 (fun _ => True) 0 X : ℝ) / X) atTop
      (𝓝 (1 / (12 * (riemannZeta 3).re))) ∧
    Tendsto (fun X : ℝ => (numberFieldCount 3 (fun _ => True) (-X) 0 : ℝ) / X) atTop
      (𝓝 (1 / (4 * (riemannZeta 3).re)))) :
    malleStrong (⊤ : Subgroup (Equiv.Perm (Fin 3))) := by sorry

/-- Unit test `ArithmeticStatistics.malleStrong_exponent_cyclic_three`: for `C₃ ≤ S₃`,
`a = 1/2` and `b(ℚ) = 1`. -/
example (g : Equiv.Perm (Fin 3)) (hg : g.IsCycle) (hsupp : g.support = Finset.univ) :
    malleA (Subgroup.zpowers g) = 1 / 2 ∧ malleB (Subgroup.zpowers g) 3 ⊤ = 1 := by
  sorry

/-- Unit test `ArithmeticStatistics.not_malleStrong_C3wrC2`: `MalleStrong(ℚ, C₃ ≀ C₂)` is false. -/
example : ¬ malleStrong wreathC3C2 := by sorry

/-- Unit test `ArithmeticStatistics.malleWeak_of_malleStrong_S3`: `MalleWeak(ℚ, S₃)` from the
strong form. -/
example (h : malleStrong (⊤ : Subgroup (Equiv.Perm (Fin 3)))) :
    malleWeak (⊤ : Subgroup (Equiv.Perm (Fin 3))) := by sorry

end ArithmeticStatistics

end ST3

/-! # ArithmeticStatistics:ST.4 — Selmer groups and rank bounds -/

noncomputable section ST4

/-! In the Tau Ceti development the 2-Selmer group, Sha and the descent sequence come from
`TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup` and EllipticCurves layer 7; since
Tau Ceti is not built here, statements about `#S₂(E)` use the binary-quartic count of ST.1's
Theorem 3.5 (`selmerSize`), and statements about Sha are stated through the identity (2). -/

open Filter Topology MeasureTheory

namespace ArithmeticStatistics

/-! ## ST.4 -/

open BinaryQuartic

/-! ### ST.4/rational-orbit-weight -/

section OrbitWeight

variable {G V : Type*} [Group G] [MulAction G V]

/-- The orbit weight `w_{Γ,Y}(v) = #(Γ\{g ∈ G : g • v ∈ Y})`: the number of right cosets `Γg`
with `g • v ∈ Y`, counted with `Nat.card` (`0` if there are infinitely many). -/
def orbitWeight (Γ : Subgroup G) (Y : Set V) (v : V) : ℕ :=
  Nat.card {q : Quotient (QuotientGroup.rightRel Γ) //
    ∃ g : G, Quotient.mk (QuotientGroup.rightRel Γ) g = q ∧ g • v ∈ Y}

/-- The orbit count `n_{Γ,Y}(v) = #(Γ\(G • v ∩ Y))`. -/
def orbitCount (Γ : Subgroup G) (Y : Set V) (v : V) : ℕ :=
  Nat.card {q : MulAction.orbitRel.Quotient Γ V //
    ∃ w ∈ MulAction.orbit G v, w ∈ Y ∧ Quotient.mk (MulAction.orbitRel Γ V) w = q}

theorem one_le_orbitWeight (Γ : Subgroup G) (Y : Set V) {v : V} (hv : v ∈ Y)
    (hfin : Finite {q : Quotient (QuotientGroup.rightRel Γ) //
      ∃ g : G, Quotient.mk (QuotientGroup.rightRel Γ) g = q ∧ g • v ∈ Y}) :
    1 ≤ orbitWeight Γ Y v := sorry

theorem orbitWeight_smul (Γ : Subgroup G) (Y : Set V) (g : G) (v : V) :
    orbitWeight Γ Y (g • v) = orbitWeight Γ Y v := sorry

theorem orbitWeight_eq_one_iff (Γ : Subgroup G) (Y : Set V)
    (hY : ∀ γ ∈ Γ, ∀ y ∈ Y, γ • y ∈ Y) {v : V} (hv : v ∈ Y) :
    orbitWeight Γ Y v = 1 ↔ {g : G | g • v ∈ Y} = (Γ : Set G) := sorry

theorem orbitWeight_of_eq_top (Y : Set V) (hY : ∀ g : G, ∀ y ∈ Y, g • y ∈ Y) {v : V}
    (hv : v ∈ Y) : orbitWeight (⊤ : Subgroup G) Y v = 1 := sorry

theorem orbitCount_le_orbitWeight (Γ : Subgroup G) (Y : Set V)
    (hY : ∀ γ ∈ Γ, ∀ y ∈ Y, γ • y ∈ Y) {v : V} (hv : v ∈ Y)
    [Finite (MulAction.stabilizer G v)]
    (hfin : Finite {q : Quotient (QuotientGroup.rightRel Γ) //
      ∃ g : G, Quotient.mk (QuotientGroup.rightRel Γ) g = q ∧ g • v ∈ Y}) :
    orbitCount Γ Y v ≤ orbitWeight Γ Y v ∧
      (orbitCount Γ Y v = orbitWeight Γ Y v ↔
        ∀ w ∈ MulAction.orbit G v, w ∈ Y →
          (MulAction.stabilizer G w : Set G) ⊆ (Γ : Set G)) := sorry

/-- Unit test `ArithmeticStatistics.orbitWeight_test_perm`: `S₃` on `Fin 3`, `Γ = ⊥`,
`Y = {0}`: the weight of `0` is `#Stab(0) = 2`. -/
example : orbitWeight (⊥ : Subgroup (Equiv.Perm (Fin 3))) ({0} : Set (Fin 3)) 0 = 2 := sorry

/-- Unit test `ArithmeticStatistics.orbitWeight_test_top`: for `Γ = ⊤` and `Y` everything the
weight is `1`. -/
example (G V : Type*) [Group G] [MulAction G V] (v : V) :
    orbitWeight (⊤ : Subgroup G) (Set.univ : Set V) v = 1 := sorry

/-- Unit test `ArithmeticStatistics.orbitWeight_test_ne_orbitCount`: in the `S₃` example the
orbit count is `1` while the weight is `2`. -/
example : orbitCount (⊥ : Subgroup (Equiv.Perm (Fin 3))) ({0} : Set (Fin 3)) 0 = 1 ∧
    orbitWeight (⊥ : Subgroup (Equiv.Perm (Fin 3))) ({0} : Set (Fin 3)) 0 = 2 := sorry

/-- Unit test `ArithmeticStatistics.orbitWeight_test_translation`: `ℤ/6` acting on itself,
`Γ = {0, 3}`, `Y = {0, 1, 3, 4}`: weight and orbit count of `0` are both `2`. -/
example :
    orbitWeight (Subgroup.zpowers (Multiplicative.ofAdd (3 : ZMod 6)))
        ({Multiplicative.ofAdd 0, Multiplicative.ofAdd 1, Multiplicative.ofAdd 3,
          Multiplicative.ofAdd 4} : Set (Multiplicative (ZMod 6))) (Multiplicative.ofAdd 0) = 2 ∧
      orbitCount (Subgroup.zpowers (Multiplicative.ofAdd (3 : ZMod 6)))
        ({Multiplicative.ofAdd 0, Multiplicative.ofAdd 1, Multiplicative.ofAdd 3,
          Multiplicative.ofAdd 4} : Set (Multiplicative (ZMod 6))) (Multiplicative.ofAdd 0) = 2 :=
  sorry

end OrbitWeight

/-! ### The twisted action of `PGL₂` and the weights `m`, `m_p`

The action of `PGL₂(K)` on binary quartic forms is ST.1's `BinaryQuartic.instPGLAction`, descended
from ST.0's `twistedSMul`. -/

/-- `PGL₂(ℤ) ≤ PGL₂(ℚ)`, the image of `GL₂(ℤ)`. -/
def pgl2Int : Subgroup (Matrix.ProjGenLinGroup (Fin 2) ℚ) :=
  ((Matrix.ProjGenLinGroup.mk (n := Fin 2) (R := ℚ)).comp
    (Matrix.GeneralLinearGroup.map (n := Fin 2) (Int.castRingHom ℚ))).range

/-- `PGL₂(ℤ_p) ≤ PGL₂(ℚ_p)`, the image of `GL₂(ℤ_p)`. -/
def pgl2Zp (p : ℕ) [Fact p.Prime] : Subgroup (Matrix.ProjGenLinGroup (Fin 2) ℚ_[p]) :=
  ((Matrix.ProjGenLinGroup.mk (n := Fin 2) (R := ℚ_[p])).comp
    (Matrix.GeneralLinearGroup.map (n := Fin 2) (PadicInt.Coe.ringHom (p := p)))).range

/-- The integral forms `V_ℤ ⊆ V_ℚ`. -/
def integralForms : Set (BinaryQuartic ℚ) := Set.range (BinaryQuartic.map (Int.castRingHom ℚ))

/-- The integral forms `V_{ℤ_p} ⊆ V_{ℚ_p}`. -/
def localIntegralForms (p : ℕ) [Fact p.Prime] : Set (BinaryQuartic ℚ_[p]) :=
  Set.range (BinaryQuartic.map (PadicInt.Coe.ringHom (p := p)))

/-- The global weight `m(f) = #[PGL₂(ℤ)\PGL₂(ℚ)_f]`. -/
def binaryQuarticWeight (f : BinaryQuartic ℤ) : ℕ :=
  orbitWeight pgl2Int integralForms (f.map (Int.castRingHom ℚ))

/-- The local weight `m_p(f) = #[PGL₂(ℤ_p)\PGL₂(ℚ_p)_f]`. -/
def localBinaryQuarticWeight (p : ℕ) [Fact p.Prime] (f : BinaryQuartic ℤ_[p]) : ℕ :=
  orbitWeight (pgl2Zp p) (localIntegralForms p) (f.map (PadicInt.Coe.ringHom (p := p)))

theorem binaryQuarticWeight_smul (γ : Matrix.ProjGenLinGroup (Fin 2) ℚ) (f g : BinaryQuartic ℤ)
    (h : γ • f.map (Int.castRingHom ℚ) = g.map (Int.castRingHom ℚ)) :
    binaryQuarticWeight g = binaryQuarticWeight f := sorry

/-- Unit test `ArithmeticStatistics.localBinaryQuarticWeight_test_unit_disc`: for odd `p`,
`m_p(x⁴ − y⁴) = 1`. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    localBinaryQuarticWeight p ⟨1, 0, 0, 0, -1⟩ = 1 := sorry

/-! ### ST.4/locally-soluble-forms-attached-to-a-family -/

open EllipticFamily in
/-- `S(F)`: locally soluble integral forms with invariants `(2⁴I, 2⁶J)`, `(I, J) ∈ Inv(F)`. -/
def locallySolubleSet (S : Set Carrier) : Set (BinaryQuartic ℤ) :=
  {f | f.IsLocallySoluble ∧ ∃ E ∈ S,
    invI f = 2 ^ 4 * (invariants E).1 ∧ invJ f = 2 ^ 6 * (invariants E).2}

open EllipticFamily in
/-- `S_p(F)`: `ℚ_p`-soluble forms over `ℤ_p` with invariants `(2⁴I, 2⁶J)`, `(I, J) ∈ Inv_p(F)`. -/
def localSolubleSet (p : Nat.Primes) (S : Set Carrier) : Set (BinaryQuartic ℤ_[p]) :=
  {f | (f.map (PadicInt.Coe.ringHom (p := p))).IsSoluble ∧
    ∃ x ∈ invLocal p S, invI f = 2 ^ 4 * x.1 ∧ invJ f = 2 ^ 6 * x.2}

/-- The sign condition `Inv_∞` on the value `4I³ − J²` (which has the sign of `Δ`). -/
def signHolds : EllipticFamily.SignCondition → ℝ → Prop
  | .pos, t => 0 < t
  | .neg, t => t < 0
  | .any, t => t ≠ 0

/-- `S_∞(F)`: `ℝ`-soluble real forms whose invariants satisfy the sign condition. -/
def realSolubleSet (s : EllipticFamily.SignCondition) : Set (BinaryQuartic ℝ) :=
  {f | f.IsSoluble ∧ signHolds s (4 * invI f ^ 3 - invJ f ^ 2)}

theorem invariants_of_mem_locallySolubleSet {S : Set EllipticFamily.Carrier}
    {f : BinaryQuartic ℤ} (hf : f ∈ locallySolubleSet S) :
    (2 : ℤ) ^ 4 ∣ invI f ∧ (2 : ℤ) ^ 6 ∣ invJ f ∧
      (invI f / 2 ^ 4, invJ f / 2 ^ 6) ∈ EllipticFamily.invariants '' S := sorry

theorem locallySolubleSet_smul (S : Set EllipticFamily.Carrier) (γ : GL (Fin 2) ℤ)
    {f : BinaryQuartic ℤ} (hf : f ∈ locallySolubleSet S) :
    twistedSMul γ f ∈ locallySolubleSet S := sorry

theorem disc_ne_zero_of_mem_localSolubleSet {p : Nat.Primes} {S : Set EllipticFamily.Carrier}
    {f : BinaryQuartic ℤ_[p]} (hf : f ∈ localSolubleSet p S) : disc f ≠ 0 := sorry

/-- The characterisation, promoted to the node `locally-soluble-set-is-cut-out-by-local-conditions`. -/
theorem mem_locallySolubleSet_iff (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]))
    (hSig : ∀ p, IsClosed (Sig p)) (s : EllipticFamily.SignCondition) (f : BinaryQuartic ℤ) :
    f ∈ locallySolubleSet (EllipticFamily.congruenceFamily Sig s) ↔
      f.map (Int.castRingHom ℝ) ∈ realSolubleSet s ∧
        ∀ p : Nat.Primes, f.map (Int.castRingHom ℤ_[p]) ∈
          localSolubleSet p (EllipticFamily.congruenceFamily Sig s) := sorry

/-- Unit test `ArithmeticStatistics.locallySolubleSet_test_identity_class`: `x³y − 16xy³`, the
identity class of `y² = x³ − x`, lies in `S(F)` for the family of all curves. -/
example : (⟨0, 1, 0, -16, 0⟩ : BinaryQuartic ℤ) ∈ locallySolubleSet Set.univ := sorry

/-- Unit test `ArithmeticStatistics.realSolubleSet_test_negative_definite`: `−x⁴ − y⁴` is not
`ℝ`-soluble. -/
example (s : EllipticFamily.SignCondition) :
    (⟨-1, 0, 0, 0, -1⟩ : BinaryQuartic ℝ) ∉ realSolubleSet s := sorry

/-- Unit test `ArithmeticStatistics.locallySolubleSet_test_unscaled`: `x³y − xy³` (invariants
`(3, 0)`) lies in no `S(F)`. -/
example (S : Set EllipticFamily.Carrier) :
    (⟨0, 1, 0, -1, 0⟩ : BinaryQuartic ℤ) ∉ locallySolubleSet S := sorry

/-- Unit test `ArithmeticStatistics.localSolubleSet_test_singular`: `x⁴` lies in no `S_p(F)`. -/
example (p : Nat.Primes) (S : Set EllipticFamily.Carrier) :
    (⟨1, 0, 0, 0, 0⟩ : BinaryQuartic ℤ_[p]) ∉ localSolubleSet p S := sorry

/-! ### ST.4/local-masses-of-a-family -/

/-- Borel structure on `ℤ_p` (Mathlib has none at the pin). -/
instance padicIntMeasurableSpace (p : ℕ) [Fact p.Prime] : MeasurableSpace ℤ_[p] := borel ℤ_[p]

instance padicIntBorelSpace (p : ℕ) [Fact p.Prime] : BorelSpace ℤ_[p] := ⟨rfl⟩

/-- The Haar probability measure on `ℤ_p`. -/
def zpMeasure (p : ℕ) [Fact p.Prime] : Measure ℤ_[p] := Measure.addHaarMeasure ⊤

/-- The Haar probability measure `dI dJ` on `ℤ_p²`. -/
def zpPairMeasure (p : ℕ) [Fact p.Prime] : Measure (ℤ_[p] × ℤ_[p]) :=
  (zpMeasure p).prod (zpMeasure p)

/- The Haar probability measure on `V_{ℤ_p} = ℤ_p⁵` (coefficient coordinates) is ST.2's
`padicHaar p 5`. -/

open Classical in
/-- `#(E^{I,J}(K)/2E^{I,J}(K)) / #E^{I,J}(K)[2]` for `E^{I,J} : y² = x³ − (I/3)x − J/27`. -/
def selmerRatio (K : Type*) [Field K] (I J : K) : ℝ :=
  let W : WeierstrassCurve K := ⟨0, 0, 0, -(I / 3), -(J / 27)⟩
  (Nat.card (W.toAffine.Point ⧸ (nsmulAddMonoidHom (α := W.toAffine.Point) 2).range) : ℝ) /
    Nat.card (nsmulAddMonoidHom (α := W.toAffine.Point) 2).ker

/-- `M_p(V, F)`. -/
def localSelmerMass (p : Nat.Primes) (S : Set EllipticFamily.Carrier) : ℝ :=
  ∫ x in EllipticFamily.invLocal p S,
    selmerRatio ℚ_[p] (x.1 : ℚ_[p]) (x.2 : ℚ_[p]) ∂(zpPairMeasure p)

/-- The archimedean region `{(I, J) ∈ Inv_∞ : H(I, J) < X}`. -/
def archimedeanRegion (s : EllipticFamily.SignCondition) (X : ℝ) : Set (ℝ × ℝ) :=
  {x | signHolds s (4 * x.1 ^ 3 - x.2 ^ 2) ∧ pairHeight x.1 x.2 < X}

/-- `M_∞(F; X)`. -/
def archimedeanMass (s : EllipticFamily.SignCondition) (X : ℝ) : ℝ :=
  (volume (archimedeanRegion s X)).toReal

/-- `M_∞(V, F; X)`. -/
def archimedeanSelmerMass (s : EllipticFamily.SignCondition) (X : ℝ) : ℝ :=
  ∫ x in archimedeanRegion s X, selmerRatio ℝ x.1 x.2

theorem archimedeanMass_homogeneous (s : EllipticFamily.SignCondition) {X : ℝ} (hX : 0 < X) :
    archimedeanMass s X = X ^ (5 / 6 : ℝ) * archimedeanMass s 1 ∧
      archimedeanSelmerMass s X = X ^ (5 / 6 : ℝ) * archimedeanSelmerMass s 1 := sorry

theorem archimedeanMass_pos (s : EllipticFamily.SignCondition) {X : ℝ} (hX : 0 < X) :
    0 < archimedeanMass s X := sorry

theorem localSelmerMass_nonneg (p : Nat.Primes) (S : Set EllipticFamily.Carrier) :
    0 ≤ localSelmerMass p S ∧
      localSelmerMass p S ≤ 2 * (zpPairMeasure p (EllipticFamily.invLocal p S)).toReal := sorry

theorem archimedeanMass_of_sign {X : ℝ} (hX : 0 < X) :
    archimedeanMass .pos X = 8 / 5 * X ^ (5 / 6 : ℝ) ∧
      archimedeanMass .neg X = 32 / 5 * X ^ (5 / 6 : ℝ) ∧
        archimedeanMass .any X = 8 * X ^ (5 / 6 : ℝ) := sorry

/-- Unit test `ArithmeticStatistics.archimedeanMass_test_pos_disc`: `M_∞ = (8/5) X^{5/6}` for
`Δ > 0`. -/
example : archimedeanMass .pos 1 = 8 / 5 := sorry

/-- Unit test `ArithmeticStatistics.archimedeanMass_test_neg_disc`: `M_∞ = (32/5) X^{5/6}` for
`Δ < 0`. -/
example : archimedeanMass .neg 1 = 32 / 5 := sorry

/-- Unit test `ArithmeticStatistics.archimedeanSelmerMass_test_half`: the Selmer mass is half the
unweighted mass, not equal to it. -/
example (s : EllipticFamily.SignCondition) :
    archimedeanSelmerMass s 1 = archimedeanMass s 1 / 2 ∧
      archimedeanSelmerMass s 1 ≠ archimedeanMass s 1 := sorry

/-- Unit test `ArithmeticStatistics.archimedeanMass_test_zero`: the mass vanishes for `X ≤ 0`. -/
example (s : EllipticFamily.SignCondition) {X : ℝ} (hX : X ≤ 0) : archimedeanMass s X = 0 :=
  sorry

/-- Unit test `ArithmeticStatistics.localSelmerMass_test_two`: for all curves,
`M₂(V, F) = 2(1 − 2⁻¹⁰)`. -/
example : localSelmerMass ⟨2, Nat.prime_two⟩ Set.univ = 2 * (1 - 2 ^ (-10 : ℤ)) := sorry

/-! ### ST.4/average-over-a-height-ordered-family -/

section Average

variable {ι : Type*}

/-- `Avg_F(φ; X) = (Σ_{i ∈ S, H(i) < X} φ i) / #{i ∈ S : H(i) < X}`. -/
def familyAverage (F : ArithmeticFamily ι) (S : Set ι) (φ : ι → ℝ) (X : ℝ) : ℝ :=
  (∑ᶠ i ∈ {i | i ∈ S ∧ F.height i < X}, φ i) / F.countLT S X

/-- `φ` has average `c` over the subfamily `S`. -/
def HasFamilyAverage (F : ArithmeticFamily ι) (S : Set ι) (φ : ι → ℝ) (c : ℝ) : Prop :=
  Tendsto (familyAverage F S φ) atTop (𝓝 c)

/-- The upper average `limsup_{X → ∞} Avg_F(φ; X)`. -/
def upperFamilyAverage (F : ArithmeticFamily ι) (S : Set ι) (φ : ι → ℝ) : ℝ :=
  limsup (familyAverage F S φ) atTop

theorem hasFamilyAverage_const (F : ArithmeticFamily ι) {S : Set ι} (hS : S.Infinite) (c : ℝ) :
    HasFamilyAverage F S (fun _ => c) c := sorry

theorem HasFamilyAverage.add {F : ArithmeticFamily ι} {S : Set ι} {φ ψ : ι → ℝ} {c d : ℝ}
    (hφ : HasFamilyAverage F S φ c) (hψ : HasFamilyAverage F S ψ d) :
    HasFamilyAverage F S (φ + ψ) (c + d) := sorry

theorem HasFamilyAverage.const_mul {F : ArithmeticFamily ι} {S : Set ι} {φ : ι → ℝ} {c : ℝ}
    (hφ : HasFamilyAverage F S φ c) (a : ℝ) :
    HasFamilyAverage F S (fun i => a * φ i) (a * c) := sorry

theorem upperFamilyAverage_mono {F : ArithmeticFamily ι} {S : Set ι} {φ ψ : ι → ℝ}
    (h : ∀ i ∈ S, φ i ≤ ψ i) (hb : IsBoundedUnder (· ≤ ·) atTop (familyAverage F S ψ))
    (hb' : IsCoboundedUnder (· ≤ ·) atTop (familyAverage F S φ)) :
    upperFamilyAverage F S φ ≤ upperFamilyAverage F S ψ := sorry

theorem HasFamilyAverage.upperFamilyAverage_eq {F : ArithmeticFamily ι} {S : Set ι}
    {φ : ι → ℝ} {c : ℝ} (h : HasFamilyAverage F S φ c) : upperFamilyAverage F S φ = c := sorry

theorem hasFamilyAverage_rescale_iff (F : ArithmeticFamily ι) {c : ℝ} (hc : 0 < c) (S : Set ι)
    (φ : ι → ℝ) (d : ℝ) :
    HasFamilyAverage (F.rescale c hc) S φ d ↔ HasFamilyAverage F S φ d := sorry

/-- Unit test `ArithmeticStatistics.familyAverage_test_const`: the constant `1` has average `1`
over an infinite subfamily. -/
example (F : ArithmeticFamily ι) {S : Set ι} (hS : S.Infinite) :
    HasFamilyAverage F S (fun _ => 1) 1 := sorry

/-- Unit test `ArithmeticStatistics.familyAverage_test_empty`: below every height the average
is `0`. -/
example (F : ArithmeticFamily ι) (S : Set ι) (φ : ι → ℝ) {X : ℝ} (hX : ∀ i, X ≤ F.height i) :
    familyAverage F S φ X = 0 := sorry

/-- Unit test `ArithmeticStatistics.familyAverage_test_rescale`: averages of elliptic curves
for `H` and for `H' = (27/4) H` agree. -/
example (S : Set EllipticFamily.Carrier) (φ : EllipticFamily.Carrier → ℝ) (d : ℝ) :
    HasFamilyAverage (EllipticFamily.family.rescale (27 / 4) (by norm_num)) S φ d ↔
      HasFamilyAverage EllipticFamily.family S φ d := sorry

/-- Unit test `ArithmeticStatistics.familyAverage_test_not_sum`: the average of `1` is `1`, not
the count, as soon as the count is positive. -/
example (F : ArithmeticFamily ι) (S : Set ι) {X : ℝ} (hX : 0 < F.countLT S X) :
    familyAverage F S (fun _ => 1) X = 1 := sorry

end Average

/-! ### ST.4/orbit-weight-as-a-stabilizer-sum -/

theorem orbitWeight_eq_sum_stabilizer {G V : Type*} [Group G] [MulAction G V]
    (Γ : Subgroup G) (Y : Set V) (hY : ∀ γ ∈ Γ, ∀ y ∈ Y, γ • y ∈ Y) {v : V} (hv : v ∈ Y)
    [Finite (MulAction.stabilizer G v)]
    (hfin : Set.Finite {q : MulAction.orbitRel.Quotient Γ V |
      ∃ w ∈ MulAction.orbit G v, w ∈ Y ∧ Quotient.mk (MulAction.orbitRel Γ V) w = q}) :
    (orbitWeight Γ Y v : ℚ) =
      ∑ᶠ q ∈ {q : MulAction.orbitRel.Quotient Γ V |
          ∃ w ∈ MulAction.orbit G v, w ∈ Y ∧ Quotient.mk (MulAction.orbitRel Γ V) w = q},
        (Nat.card (MulAction.stabilizer G q.out) : ℚ) /
          Nat.card (MulAction.stabilizer Γ q.out) := sorry

/-! ### ST.4/cartan-decomposition-of-pgl2-over-qp -/

theorem exists_cartan_decomposition (p : ℕ) [Fact p.Prime] (γ : GL (Fin 2) ℚ_[p]) :
    ∃ k₁ k₂ : GL (Fin 2) ℤ_[p], ∃ a b : ℤ, a ≤ b ∧
      (γ : Matrix (Fin 2) (Fin 2) ℚ_[p]) =
        (Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) k₁ : Matrix _ _ ℚ_[p]) *
          Matrix.diagonal ![(p : ℚ_[p]) ^ a, (p : ℚ_[p]) ^ b] *
            (Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) k₂ : Matrix _ _ ℚ_[p]) :=
  sorry

/-! ### ST.4/nonintegral-local-translates-force-square-discriminant -/

theorem sq_dvd_disc_of_nonintegral_translate (p : ℕ) [Fact p.Prime] (f : BinaryQuartic ℤ_[p])
    (hΔ : disc f ≠ 0) (γ : Matrix.ProjGenLinGroup (Fin 2) ℚ_[p]) (hγ : γ ∉ pgl2Zp p)
    (hint : γ • f.map (PadicInt.Coe.ringHom (p := p)) ∈ localIntegralForms p) :
    (p : ℤ_[p]) ^ 2 ∣ disc f := sorry

theorem localBinaryQuarticWeight_eq_one (p : ℕ) [Fact p.Prime] (f : BinaryQuartic ℤ_[p])
    (hΔ : disc f ≠ 0) (h : ¬ (p : ℤ_[p]) ^ 2 ∣ disc f) : localBinaryQuarticWeight p f = 1 := sorry

/-! ### ST.4/class-number-one-for-pgl2-over-q -/

/-- The map `PGL₂(ℚ) → PGL₂(ℚ_p)`. -/
def pglToLocal (p : ℕ) [Fact p.Prime] :
    Matrix.ProjGenLinGroup (Fin 2) ℚ →* Matrix.ProjGenLinGroup (Fin 2) ℚ_[p] :=
  QuotientGroup.map _ _ (Matrix.GeneralLinearGroup.map (n := Fin 2) (Rat.castHom ℚ_[p])) sorry

theorem mem_pgl2Int_of_forall_mem_pgl2Zp (γ : Matrix.ProjGenLinGroup (Fin 2) ℚ)
    (h : ∀ p : Nat.Primes, pglToLocal p γ ∈ pgl2Zp p) : γ ∈ pgl2Int := sorry

theorem exists_pgl2_rat_of_restricted (σ : ∀ p : Nat.Primes, Matrix.ProjGenLinGroup (Fin 2) ℚ_[p])
    (hσ : {p : Nat.Primes | σ p ∉ pgl2Zp p}.Finite) :
    ∃ γ : Matrix.ProjGenLinGroup (Fin 2) ℚ, ∀ p : Nat.Primes, pglToLocal p γ * (σ p)⁻¹ ∈ pgl2Zp p :=
  sorry

/-! ### ST.4/global-weight-is-product-of-local-weights -/

/-- Bhargava–Shankar Proposition 3.6. -/
theorem binaryQuarticWeight_eq_prod (f : BinaryQuartic ℤ) (hΔ : disc f ≠ 0) :
    binaryQuarticWeight f =
      ∏ᶠ p : Nat.Primes, localBinaryQuarticWeight p (f.map (Int.castRingHom ℤ_[p])) := sorry

/-! ### ST.4/count-of-squarefree-monic-polynomials-over-a-finite-field -/

theorem card_squarefree_monic (K : Type*) [Field K] [Fintype K] {n : ℕ} (hn : 2 ≤ n) :
    Nat.card {g : Polynomial K // g.Monic ∧ g.natDegree = n ∧ Squarefree g} =
      Fintype.card K ^ n - Fintype.card K ^ (n - 1) := sorry

/-! ### ST.4/count-of-nonsingular-binary-quartic-forms-over-a-finite-field -/

theorem card_disc_ne_zero (K : Type*) [Field K] [Fintype K] :
    Nat.card {f : BinaryQuartic K // disc f ≠ 0} =
      Fintype.card K ^ 2 * (Fintype.card K + 1) * (Fintype.card K - 1) ^ 2 := sorry

/-! ### ST.4/nonsingular-binary-quartic-forms-over-finite-fields-are-soluble -/

theorem isSoluble_of_disc_ne_zero (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (f : BinaryQuartic (ZMod p)) (hΔ : disc f ≠ 0) : f.IsSoluble := sorry

/-! ### ST.4/local-solubility-away-from-square-discriminant -/

theorem sq_dvd_disc_of_not_isSoluble (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (f : BinaryQuartic ℤ_[p]) (hΔ : disc f ≠ 0)
    (h : ¬ (f.map (PadicInt.Coe.ringHom (p := p))).IsSoluble) : (p : ℤ_[p]) ^ 2 ∣ disc f := sorry

/-! ### ST.4/bad-forms-have-square-discriminant -/

/-- Bhargava–Shankar Proposition 3.18. -/
theorem sq_dvd_disc_of_bad (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (f : BinaryQuartic ℤ_[p])
    (hΔ : disc f ≠ 0)
    (hbad : ¬ (f.map (PadicInt.Coe.ringHom (p := p))).IsSoluble ∨ localBinaryQuarticWeight p f ≠ 1) :
    (p : ℤ_[p]) ^ 2 ∣ disc f := sorry

/-! ### ST.4/local-weights-and-solubility-are-locally-constant -/

theorem locallyConstant_weight_and_solubility (p : ℕ) [Fact p.Prime] (f : BinaryQuartic ℤ_[p])
    (hΔ : disc f ≠ 0) :
    ∃ N : ℕ, ∀ g : BinaryQuartic ℤ_[p], (∀ i, (p : ℤ_[p]) ^ N ∣ g.coeffs i - f.coeffs i) →
      localBinaryQuarticWeight p g = localBinaryQuarticWeight p f ∧
        ((g.map (PadicInt.Coe.ringHom (p := p))).IsSoluble ↔
          (f.map (PadicInt.Coe.ringHom (p := p))).IsSoluble) := sorry

theorem padicHaar_disc_eq_zero (p : ℕ) [Fact p.Prime] :
    padicHaar p 5 {v | disc (ofCoeffs v) = 0} = 0 := sorry

/-! ### ST.4/real-solubility-of-binary-quartic-forms -/

theorem isSoluble_iff_not_negDefinite (f : BinaryQuartic ℝ) (hΔ : disc f ≠ 0) :
    f.IsSoluble ↔ ¬ ∀ x y : ℝ, (x, y) ≠ (0, 0) → f.eval x y < 0 := sorry

/-! ### ST.4/jacobian-of-the-orbit-map -/

/-- The section `s_{I,J} = x³y − (I/3)xy³ − (J/27)y⁴`. -/
def invariantSection {K : Type*} [Field K] (I J : K) : BinaryQuartic K := ⟨0, 1, 0, -(I / 3), -(J / 27)⟩

/-- The Jacobian matrix of `(g, I, J) ↦ g • s_{I,J}` at `g = 1` (rows `a, …, e`; columns
`E₁₁, E₁₂, E₂₁, ∂_I, ∂_J`). The identification of its columns with derivatives of the twisted
action needs invariant differential forms on `PGL₂`, which Mathlib lacks; that part of the
statement is left out here. -/
def orbitJacobian {K : Type*} [Field K] (I J : K) : Matrix (Fin 5) (Fin 5) K :=
  !![0, 1, 0, 0, 0;
     1, 0, 0, 0, 0;
     0, -I, 3, 0, 0;
     I / 3, -4 * J / 27, 0, -1 / 3, 0;
     2 * J / 27, 0, -I / 3, 0, -1 / 27]

theorem invariants_invariantSection {K : Type*} [Field K] (h3 : (3 : K) ≠ 0) (I J : K) :
    invI (invariantSection I J) = I ∧ invJ (invariantSection I J) = J := sorry

theorem det_orbitJacobian {K : Type*} [Field K] (h3 : (3 : K) ≠ 0) (I J : K) :
    (orbitJacobian I J).det = -1 / 27 := sorry

/-! ### ST.4/volume-of-pgl2-zp -/

/-- The numerical content; the comparison with the measure `|ω|_p` needs the p-adic change of
variables (a recorded gap) and is left out. -/
theorem card_pgl2_div_cube (p : ℕ) [Fact p.Prime] :
    (Nat.card (Matrix.ProjGenLinGroup (Fin 2) (ZMod p)) : ℝ) / p ^ 3 = 1 - (p : ℝ) ^ (-2 : ℤ) :=
  sorry

/-! ### ST.4/p-adic-change-of-measure-for-binary-quartic-forms -/

/-- The integral forms over `ℤ_p` with invariants `(I, J)`, up to `PGL₂(ℤ_p)`. -/
def integralOrbits (p : ℕ) [Fact p.Prime] (I J : ℤ_[p]) : Set (MulAction.orbitRel.Quotient (pgl2Zp p) (BinaryQuartic ℚ_[p])) :=
  {q | ∃ f : BinaryQuartic ℤ_[p], invI f = I ∧ invJ f = J ∧
    Quotient.mk (MulAction.orbitRel (pgl2Zp p) _) (f.map (PadicInt.Coe.ringHom (p := p))) = q}

/-- Bhargava–Shankar Proposition 3.7, for `PGL₂(ℤ_p)`-invariant `φ` (the general form needs a
Haar measure on `PGL₂(ℤ_p)`, which Mathlib's instances do not provide). -/
theorem integral_eq_orbit_integral (p : ℕ) [Fact p.Prime] (φ : BinaryQuartic ℚ_[p] → ℝ)
    (hφ : ∀ γ ∈ pgl2Zp p, ∀ f, φ (γ • f) = φ f) (hφ0 : ∀ f, 0 ≤ φ f) :
    ∫ v, φ ((ofCoeffs v).map (PadicInt.Coe.ringHom (p := p))) ∂(padicHaar p 5) =
      (padicNorm p (1 / 27) : ℝ) * (1 - (p : ℝ) ^ (-2 : ℤ)) *
        ∫ x, (∑ᶠ q ∈ integralOrbits p x.1 x.2,
          φ q.out / Nat.card (MulAction.stabilizer (pgl2Zp p) q.out)) ∂(zpPairMeasure p) := sorry

/-! ### ST.4/weighted-p-adic-change-of-measure and ST.4/local-mass-formula-for-locally-soluble-forms -/

/-- Bhargava–Shankar Proposition 3.9. -/
theorem integral_localSolubleSet (p : Nat.Primes) (S : Set EllipticFamily.Carrier) :
    ∫ v in {v | ofCoeffs v ∈ localSolubleSet p S},
        (1 / (localBinaryQuarticWeight p (ofCoeffs v) : ℝ)) ∂(padicHaar p 5) =
      (padicNorm p (2 ^ 10 / 27) : ℝ) * (1 - (p : ℝ) ^ (-2 : ℤ)) * localSelmerMass p S := sorry

/-- Bhargava–Shankar Corollary 3.8, for the indicator of a set `T` of soluble forms with the
divisibility conditions that contains every soluble form with the invariants of one of its
members (so that each fibre contributes the full sum over `E(ℚ_p)/2E(ℚ_p)`). -/
theorem integral_div_weight_eq (p : Nat.Primes) (T : Set (BinaryQuartic ℤ_[p]))
    (hT : ∀ f ∈ T, disc f ≠ 0 ∧ (f.map (PadicInt.Coe.ringHom (p := p))).IsSoluble ∧
      (2 ^ 4 * 3 : ℤ_[p]) ∣ invI f ∧ (2 ^ 6 * 27 : ℤ_[p]) ∣ invJ f)
    (hsat : ∀ f g : BinaryQuartic ℤ_[p], f ∈ T → invI g = invI f → invJ g = invJ f →
      (g.map (PadicInt.Coe.ringHom (p := p))).IsSoluble → g ∈ T) :
    ∫ v in {v | ofCoeffs v ∈ T}, (1 / (localBinaryQuarticWeight p (ofCoeffs v) : ℝ))
        ∂(padicHaar p 5) =
      (padicNorm p (1 / 27) : ℝ) * (1 - (p : ℝ) ^ (-2 : ℤ)) *
        ∫ x in {x : ℤ_[p] × ℤ_[p] | ∃ f ∈ T, invI f = x.1 ∧ invJ f = x.2},
          selmerRatio ℚ_[p] (x.1 : ℚ_[p]) (x.2 : ℚ_[p]) ∂(zpPairMeasure p) := sorry

/-! ### ST.4/two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup -/

theorem card_quotient_two_mul (p : ℕ) [Fact p.Prime] (G : Type*) [AddCommGroup G]
    (U : AddSubgroup G) [U.FiniteIndex] (e : U ≃+ ℤ_[p]) :
    Nat.card (G ⧸ (nsmulAddMonoidHom (α := G) 2).range) =
      (if p = 2 then 2 else 1) * Nat.card (nsmulAddMonoidHom (α := G) 2).ker := sorry

/-! ### ST.4/local-two-descent-index -/

open Classical in
/-- Bhargava–Shankar Lemma 3.20. -/
theorem card_point_quotient_two (p : ℕ) [Fact p.Prime] (W : WeierstrassCurve ℚ_[p])
    [W.IsElliptic] :
    Nat.card (W.toAffine.Point ⧸ (nsmulAddMonoidHom (α := W.toAffine.Point) 2).range) =
      (if p = 2 then 2 else 1) * Nat.card (nsmulAddMonoidHom (α := W.toAffine.Point) 2).ker :=
  sorry

/-! ### ST.4/archimedean-selmer-ratio-is-one-half -/

theorem selmerRatio_real (I J : ℝ) (h : 4 * I ^ 3 - J ^ 2 ≠ 0) : selmerRatio ℝ I J = 1 / 2 :=
  sorry

/-! ### ST.4/local-selmer-mass-ratios -/

theorem localSelmerMass_eq (p : Nat.Primes) (S : Set EllipticFamily.Carrier) :
    localSelmerMass p S =
      (if (p : ℕ) = 2 then 2 else 1) * (zpPairMeasure p (EllipticFamily.invLocal p S)).toReal :=
  sorry

theorem archimedeanSelmerMass_eq (s : EllipticFamily.SignCondition) (X : ℝ) :
    archimedeanSelmerMass s X = archimedeanMass s X / 2 := sorry

/-! ### ST.4/selmer-count-as-weighted-orbit-count -/

/-- The binary-quartic model of the nonidentity 2-Selmer elements (ST.1, Theorem 3.5): the
`PGL₂(ℚ)`-classes of locally soluble integral forms with invariants `(2⁴I, 2⁶J)` and no rational
linear factor. -/
def nonidentitySelmerClasses (E : EllipticFamily.Carrier) :
    Set (MulAction.orbitRel.Quotient (Matrix.ProjGenLinGroup (Fin 2) ℚ) (BinaryQuartic ℚ)) :=
  {c | ∃ f : BinaryQuartic ℤ, f.IsLocallySoluble ∧ ¬ f.HasRationalLinearFactor ∧
    invI f = 2 ^ 4 * (EllipticFamily.invariants E).1 ∧
    invJ f = 2 ^ 6 * (EllipticFamily.invariants E).2 ∧
    Quotient.mk (MulAction.orbitRel _ _) (f.map (Int.castRingHom ℚ)) = c}

/-- `#S₂(E)` through the binary-quartic model; ST.1 proves it is the order of the 2-Selmer group
of EllipticCurves layer 7. -/
def selmerSize (E : EllipticFamily.Carrier) : ℕ := 1 + Nat.card (nonidentitySelmerClasses E)

/-- The weighted count `Σ 1/m(f)` over `PGL₂(ℤ)`-orbits of irreducible `f ∈ S(F)` with `H(f) < Y`. -/
def weightedSolubleOrbitCount (S : Set EllipticFamily.Carrier) (Y : ℝ) : ℝ :=
  ∑ᶠ q ∈ {q : MulAction.orbitRel.Quotient pgl2Int (BinaryQuartic ℚ) |
      ∃ f ∈ locallySolubleSet S, f.IsIrreducibleOverQ ∧ height f < Y ∧
        Quotient.mk (MulAction.orbitRel _ _) (f.map (Int.castRingHom ℚ)) = q},
    (1 / (orbitWeight pgl2Int integralForms q.out : ℝ))

theorem selmer_count_eq_weightedSolubleOrbitCount (S : Set EllipticFamily.Carrier) {ε : ℝ}
    (hε : 0 < ε) :
    ∃ C : ℝ, ∀ X ≥ 1,
      |(∑ᶠ E ∈ {E | E ∈ S ∧ EllipticFamily.heightPrime E < X}, ((selmerSize E : ℝ) - 1)) -
          weightedSolubleOrbitCount S (2 ^ 12 * X)| ≤ C * X ^ (3 / 4 + ε) := sorry

/-! ### ST.4/count-of-locally-soluble-orbits-in-a-large-family and
ST.4/count-of-real-soluble-integral-orbits -/

/-- `N(V_ℤ ∩ S_∞(F); X)`: irreducible `GL₂(ℤ)`-orbits of `ℝ`-soluble integral forms with the sign
condition and height `< X`. -/
def realSolubleOrbitCount (s : EllipticFamily.SignCondition) (X : ℝ) : ℕ :=
  Nat.card {q : MulAction.orbitRel.Quotient (GL (Fin 2) ℤ) (BinaryQuartic ℤ) //
    ∃ f, Quotient.mk (MulAction.orbitRel _ _) f = q ∧ f.IsIrreducibleOverQ ∧
      f.map (Int.castRingHom ℝ) ∈ realSolubleSet s ∧ height f < X}

theorem tendsto_weightedSolubleOrbitCount (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]))
    (hSig : ∀ p, IsClosed (Sig p)) (s : EllipticFamily.SignCondition)
    (hL : EllipticFamily.IsLarge (EllipticFamily.congruenceFamily Sig s)) :
    Tendsto (fun Y : ℝ =>
      (weightedSolubleOrbitCount (EllipticFamily.congruenceFamily Sig s) Y -
        realSolubleOrbitCount s Y *
          ∏' p : Nat.Primes, ∫ v in {v | ofCoeffs v ∈
            localSolubleSet p (EllipticFamily.congruenceFamily Sig s)},
              (1 / (localBinaryQuarticWeight p (ofCoeffs v) : ℝ)) ∂(padicHaar p 5)) /
        Y ^ (5 / 6 : ℝ)) atTop (𝓝 0) := sorry

theorem realSolubleOrbitCount_eq (s : EllipticFamily.SignCondition) {ε : ℝ} (hε : 0 < ε) :
    ∃ C : ℝ, ∀ X ≥ 1,
      |(realSolubleOrbitCount s X : ℝ) - 1 / 27 * (Real.pi ^ 2 / 3) * archimedeanSelmerMass s X| ≤
        C * X ^ (3 / 4 + ε) := sorry

/-! ### ST.4/lattice-points-of-bounded-invariant-height -/

theorem card_lattice_points_pairHeight (m : ℕ) (hm : 0 < m) (L : Finset (ZMod m × ZMod m))
    (s : EllipticFamily.SignCondition) :
    ∃ C : ℝ, ∀ X ≥ 1,
      |({x : ℤ × ℤ | ((x.1 : ZMod m), (x.2 : ZMod m)) ∈ L ∧
          signHolds s (4 * (x.1 : ℝ) ^ 3 - (x.2 : ℝ) ^ 2) ∧ pairHeight x.1 x.2 < X}.ncard : ℝ) -
        L.card / m ^ 2 * archimedeanMass s X| ≤ C * X ^ (1 / 2 : ℝ) := sorry

/-! ### ST.4/tail-estimate-for-square-divisors-of-the-discriminant -/

theorem card_sq_dvd_disc_tail :
    ∃ C : ℝ, ∀ M : ℕ, 5 ≤ M → ∀ X : ℝ, 2 ≤ X →
      ({x : ℤ × ℤ | 4 * (|x.1| : ℝ) ^ 3 < X ∧ 27 * (x.2 : ℝ) ^ 2 < X ∧
          4 * x.1 ^ 3 + 27 * x.2 ^ 2 ≠ 0 ∧
          ∃ p : ℕ, p.Prime ∧ M < p ∧ (p : ℤ) ^ 2 ∣ 4 * x.1 ^ 3 + 27 * x.2 ^ 2}.ncard : ℝ) ≤
        C * (X ^ (5 / 6 : ℝ) / M + X ^ (5 / 6 : ℝ) / Real.log X) := sorry

/-! ### ST.4/uniformity-estimate-for-elliptic-curves -/

/-- Bhargava–Shankar Proposition 3.16. -/
theorem card_sq_dvd_disc_le :
    ∃ C : ℝ, ∀ p : ℕ, p.Prime → ∀ X : ℝ, 1 ≤ X →
      ({E : EllipticFamily.Carrier | EllipticFamily.heightPrime E < X ∧
          (p : ℤ) ^ 2 ∣ 4 * E.1.a₄ ^ 3 + 27 * E.1.a₆ ^ 2}.ncard : ℝ) ≤
        C * X ^ (5 / 6 : ℝ) / (p : ℝ) ^ (3 / 2 : ℝ) := sorry

/-! ### ST.4/count-of-curves-in-a-large-family -/

/-- `N(F; X) = #{E ∈ F : H'(E) < X}`. -/
def curveCount (S : Set EllipticFamily.Carrier) (X : ℝ) : ℕ :=
  {E | E ∈ S ∧ EllipticFamily.heightPrime E < X}.ncard

/-- Bhargava–Shankar Theorem 3.17. -/
theorem tendsto_curveCount (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]))
    (hSig : ∀ p, IsClosed (Sig p)) (s : EllipticFamily.SignCondition)
    (hL : EllipticFamily.IsLarge (EllipticFamily.congruenceFamily Sig s)) :
    Tendsto (fun X : ℝ =>
      ((curveCount (EllipticFamily.congruenceFamily Sig s) X : ℝ) -
        archimedeanMass s X * ∏' p : Nat.Primes,
          (zpPairMeasure p (EllipticFamily.invLocal p (EllipticFamily.congruenceFamily Sig s))).toReal) /
        X ^ (5 / 6 : ℝ)) atTop (𝓝 0) := sorry

/-! ### ST.4/selmer-average-as-product-of-local-masses -/

/-- Bhargava–Shankar Theorem 3.19, with the positivity hypothesis. -/
theorem tendsto_selmer_average_sub_one (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]))
    (hSig : ∀ p, IsClosed (Sig p)) (s : EllipticFamily.SignCondition)
    (hL : EllipticFamily.IsLarge (EllipticFamily.congruenceFamily Sig s))
    (hpos : ∀ p : Nat.Primes,
      0 < zpPairMeasure p (EllipticFamily.invLocal p (EllipticFamily.congruenceFamily Sig s))) :
    HasFamilyAverage (EllipticFamily.family.rescale (27 / 4) (by norm_num))
      (EllipticFamily.congruenceFamily Sig s) (fun E => (selmerSize E : ℝ) - 1)
      (Real.pi ^ 2 / 3 * (archimedeanSelmerMass s 1 / archimedeanMass s 1) *
        ∏' p : Nat.Primes, ((1 - (p : ℝ) ^ (-2 : ℤ)) *
          (localSelmerMass p (EllipticFamily.congruenceFamily Sig s) /
            (zpPairMeasure p
              (EllipticFamily.invLocal p (EllipticFamily.congruenceFamily Sig s))).toReal))) :=
  sorry

/-! ### ST.4/tamagawa-number-of-pgl2-is-two -/

theorem tamagawa_pgl2 : Real.pi ^ 2 / 3 * ∏' p : Nat.Primes, (1 - (p : ℝ) ^ (-2 : ℤ)) = 2 := sorry

/-! ### ST.4/average-size-of-the-2-selmer-group-is-three -/

/-- Bhargava–Shankar Theorem 3.1, with the positivity hypothesis: over a large family with
positive local masses, ordered by height, the average size of the 2-Selmer group is `3`. -/
theorem hasFamilyAverage_selmerSize (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]))
    (hSig : ∀ p, IsClosed (Sig p)) (s : EllipticFamily.SignCondition)
    (hL : EllipticFamily.IsLarge (EllipticFamily.congruenceFamily Sig s))
    (hpos : ∀ p : Nat.Primes,
      0 < zpPairMeasure p (EllipticFamily.invLocal p (EllipticFamily.congruenceFamily Sig s))) :
    HasFamilyAverage EllipticFamily.family (EllipticFamily.congruenceFamily Sig s)
      (fun E => (selmerSize E : ℝ)) 3 := sorry

/-! ### ST.4/families-of-theorems-1-1-and-1-3-have-positive-local-masses -/

/-- Minimal-pair congruence families: all `E_{A,B}` with `(A mod m, B mod m) ∈ U`. -/
def residueFamily (m : ℕ) (U : Set (ZMod m × ZMod m)) : Set EllipticFamily.Carrier :=
  {E | ((E.1.a₄ : ZMod m), (E.1.a₆ : ZMod m)) ∈ U}

theorem residueFamily_large_and_pos (m : ℕ) (hm : 0 < m) (U : Set (ZMod m × ZMod m))
    (hne : (residueFamily m U).Nonempty) :
    ∃ Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]), (∀ p, IsClosed (Sig p)) ∧
      residueFamily m U = EllipticFamily.congruenceFamily Sig .any ∧
      EllipticFamily.IsLarge (residueFamily m U) ∧
      ∀ p : Nat.Primes, 0 < zpPairMeasure p (EllipticFamily.invLocal p (residueFamily m U)) := sorry

/-- Semistability of `E_{A,B}`: at every prime the minimal model over `ℤ_p` has good or
multiplicative reduction (Mathlib's reduction predicates). -/
def IsSemistable (E : EllipticFamily.Carrier) : Prop :=
  ∀ p : Nat.Primes,
    WeierstrassCurve.HasGoodReduction ℤ_[p]
        ((E.1.map (Int.castRingHom ℚ_[p])).minimal ℤ_[p]) ∨
      WeierstrassCurve.HasMultiplicativeReduction ℤ_[p]
        ((E.1.map (Int.castRingHom ℚ_[p])).minimal ℤ_[p])

theorem semistable_large_and_pos :
    ∃ Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]), (∀ p, IsClosed (Sig p)) ∧
      {E | IsSemistable E} = EllipticFamily.congruenceFamily Sig .any ∧
      EllipticFamily.IsLarge {E | IsSemistable E} ∧
      ∀ p : Nat.Primes, 0 < zpPairMeasure p (EllipticFamily.invLocal p {E | IsSemistable E}) :=
  sorry

/-! ### ST.4/average-selmer-size-over-all-curves-and-congruence-families -/

/-- Bhargava–Shankar Theorem 1.1. -/
theorem hasFamilyAverage_selmerSize_univ :
    HasFamilyAverage EllipticFamily.family Set.univ (fun E => (selmerSize E : ℝ)) 3 := sorry

/-- Bhargava–Shankar Theorem 1.3, and the semistable family. -/
theorem hasFamilyAverage_selmerSize_residue (m : ℕ) (hm : 0 < m) (U : Set (ZMod m × ZMod m))
    (hne : (residueFamily m U).Nonempty) :
    HasFamilyAverage EllipticFamily.family (residueFamily m U) (fun E => (selmerSize E : ℝ)) 3 ∧
      HasFamilyAverage EllipticFamily.family {E | IsSemistable E}
        (fun E => (selmerSize E : ℝ)) 3 := sorry

/-! ### ST.4/two-selmer-rank-identity -/

open Classical in
/-- The rank `r(E)` of `E(ℚ)`. -/
def mwRank (E : EllipticFamily.Carrier) : ℕ :=
  Module.finrank ℤ (E.1.map (Int.castRingHom ℚ)).toAffine.Point

open Classical in
/-- `#E(ℚ)[2]`. -/
def twoTorsionCard (E : EllipticFamily.Carrier) : ℕ :=
  Nat.card (nsmulAddMonoidHom (α := (E.1.map (Int.castRingHom ℚ)).toAffine.Point) 2).ker

/-- The inequality part of (2); the identity itself involves `Ш_E[2]`, a layer-7 carrier, and is
left out here. -/
theorem two_pow_rank_mul_le_selmerSize (E : EllipticFamily.Carrier) :
    2 ^ mwRank E * twoTorsionCard E ≤ selmerSize E := sorry

/-! ### ST.4/rational-two-torsion-has-density-zero -/

theorem card_rational_two_torsion_le :
    ∃ C : ℝ, ∀ X : ℝ, 1 ≤ X →
      ({x : ℤ × ℤ | 4 * (|x.1| : ℝ) ^ 3 < X ∧ 27 * (x.2 : ℝ) ^ 2 < X ∧
          ∃ r : ℚ, r ^ 3 + x.1 * r + x.2 = 0}.ncard : ℝ) ≤ C * X ^ (1 / 2 : ℝ) := sorry

theorem hasFamilyAverage_twoTorsion_rank_eq_zero (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]))
    (hSig : ∀ p, IsClosed (Sig p)) (s : EllipticFamily.SignCondition)
    (hL : EllipticFamily.IsLarge (EllipticFamily.congruenceFamily Sig s))
    (hpos : ∀ p : Nat.Primes,
      0 < zpPairMeasure p (EllipticFamily.invLocal p (EllipticFamily.congruenceFamily Sig s))) :
    HasFamilyAverage EllipticFamily.family (EllipticFamily.congruenceFamily Sig s)
      (fun E => (Nat.log 2 (twoTorsionCard E) : ℝ)) 0 := sorry

/-! ### ST.4/rank-bound-from-the-selmer-average -/

/-- Bhargava–Shankar Corollary 1.2 (for every family satisfying Theorem 3.1): the upper averages
of the 2-Selmer rank and of the rank are at most `3/2`. -/
theorem upperFamilyAverage_rank_le (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]))
    (hSig : ∀ p, IsClosed (Sig p)) (s : EllipticFamily.SignCondition)
    (hL : EllipticFamily.IsLarge (EllipticFamily.congruenceFamily Sig s))
    (hpos : ∀ p : Nat.Primes,
      0 < zpPairMeasure p (EllipticFamily.invLocal p (EllipticFamily.congruenceFamily Sig s))) :
    upperFamilyAverage EllipticFamily.family (EllipticFamily.congruenceFamily Sig s)
        (fun E => (Nat.log 2 (selmerSize E) : ℝ)) ≤ 3 / 2 ∧
      upperFamilyAverage EllipticFamily.family (EllipticFamily.congruenceFamily Sig s)
        (fun E => (mwRank E : ℝ)) ≤ 3 / 2 := sorry

/-! ### ST.4/average-two-rank-of-sha-is-at-most-three-halves -/

/-- The upper average of `r₂(S₂) − r − r₂(E(ℚ)[2])`, which is `r₂(Ш_E[2])` by (2), is at most
`3/2`. -/
theorem upperFamilyAverage_sha_two_rank_le (Sig : ∀ p : Nat.Primes, Set (ℤ_[p] × ℤ_[p]))
    (hSig : ∀ p, IsClosed (Sig p)) (s : EllipticFamily.SignCondition)
    (hL : EllipticFamily.IsLarge (EllipticFamily.congruenceFamily Sig s))
    (hpos : ∀ p : Nat.Primes,
      0 < zpPairMeasure p (EllipticFamily.invLocal p (EllipticFamily.congruenceFamily Sig s))) :
    upperFamilyAverage EllipticFamily.family (EllipticFamily.congruenceFamily Sig s)
        (fun E => (Nat.log 2 (selmerSize E) : ℝ) - mwRank E - Nat.log 2 (twoTorsionCard E)) ≤
      3 / 2 := sorry

end ArithmeticStatistics

end ST4

/-! # ArithmeticStatistics:ST.5 — Beyond first moments -/

noncomputable section ST5

/-!
## Scope

Objects the pinned Mathlib does not contain (Selmer groups, isogenies,
quadratic twists, Hurwitz schemes, abelian varieties over finite fields) are either prototyped through
an explicit function standing for the arithmetic invariant, as documented at each use, or omitted;
no condition is replaced by an empty `Prop`. Tau Ceti modules (for example
`TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist`) would be imported where the roadmap cites
EllipticCurves Layer 5; Tau Ceti is not built in this environment, so they are not imported here.
-/


/-! Shared prelude for ST.5 (carrier of isomorphism classes of finite abelian `p`-groups,
the Cohen–Lenstra measure and surjection moments). -/

open scoped ENNReal

namespace ArithmeticStatistics

/-- Isomorphism classes of finite abelian `p`-groups, indexed by partitions: `⟨n, λ⟩` is the
class of `⊕ᵢ ℤ/p^{λᵢ}`, a group of order `p^n`. -/
abbrev FinAbPGroupClass : Type := Σ n : ℕ, n.Partition

namespace FinAbPGroupClass

/-- The parts of the partition, in decreasing order. -/
noncomputable def partsList (A : FinAbPGroupClass) : List ℕ :=
  A.2.parts.sort (· ≥ ·)

/-- The standard representative `⊕ᵢ ℤ/p^{λᵢ}` of a class. -/
def toGroup (p : ℕ) (A : FinAbPGroupClass) : Type :=
  (i : Fin A.partsList.length) → ZMod (p ^ A.partsList.get i)

noncomputable instance (p : ℕ) (A : FinAbPGroupClass) : AddCommGroup (A.toGroup p) :=
  inferInstanceAs (AddCommGroup ((i : Fin A.partsList.length) → ZMod (p ^ A.partsList.get i)))

/-- The order of the automorphism group of the standard representative. -/
noncomputable def autCard (p : ℕ) (A : FinAbPGroupClass) : ℕ :=
  Nat.card (A.toGroup p ≃+ A.toGroup p)

/-- The class of the trivial group. -/
def trivial : FinAbPGroupClass := ⟨0, Nat.Partition.indiscrete 0⟩

end FinAbPGroupClass

/-- The number of surjective homomorphisms `X → A` of abelian groups. -/
noncomputable def surjCard (X A : Type*) [AddCommGroup X] [AddCommGroup A] : ℕ :=
  Nat.card {f : X →+ A // Function.Surjective f}

/-- The Cohen–Lenstra constant `c_{p,u} = ∏_{i ≥ u+1} (1 - p^{-i})`. -/
noncomputable def cohenLenstraConstant (p u : ℕ) : ℝ :=
  ∏' i : ℕ, (1 - ((p : ℝ) ^ (i + u + 1))⁻¹)

/-- The Cohen–Lenstra weight `μ_{p,u}(A) = c_{p,u} / (|A|^u · |Aut A|)`. -/
noncomputable def cohenLenstraWeight (p u : ℕ) (A : FinAbPGroupClass) : ℝ≥0∞ :=
  ENNReal.ofReal (cohenLenstraConstant p u) / (((p : ℝ≥0∞) ^ (A.1 * u)) * (A.autCard p : ℝ≥0∞))

/-- Mass formula (Cohen–Lenstra): the weights sum to one. -/
theorem hasSum_cohenLenstraWeight (p u : ℕ) [Fact p.Prime] :
    HasSum (cohenLenstraWeight p u) 1 := sorry

/-- The Cohen–Lenstra probability measure on isomorphism classes of finite abelian `p`-groups. -/
noncomputable def cohenLenstraMeasure (p u : ℕ) [Fact p.Prime] : PMF FinAbPGroupClass :=
  ⟨cohenLenstraWeight p u, hasSum_cohenLenstraWeight p u⟩

/-- The `A`-moment `∑_X ν(X) |Sur(X, A)|` of a measure `ν` on classes. -/
noncomputable def surjectionMoment (p : ℕ) (ν : FinAbPGroupClass → ℝ≥0∞)
    (A : FinAbPGroupClass) : ℝ≥0∞ :=
  ∑' X : FinAbPGroupClass, ν X * (surjCard (X.toGroup p) (A.toGroup p) : ℝ≥0∞)

end ArithmeticStatistics


/-!
## Part A1: Cohen–Lenstra measures, surjection moments and random-matrix models -/


namespace ArithmeticStatistics
open scoped ENNReal Topology
open Filter

/-! ## Isomorphism classes of finite abelian `p`-groups -/

namespace FinAbPGroupClass

/-- The conjugate partition: the number of parts that are at least `i` (for `i ≥ 1`, this is
`dim_{F_p} p^{i-1}A / p^i A`). -/
def conjPart (A : FinAbPGroupClass) (i : ℕ) : ℕ :=
  (A.2.parts.filter (i ≤ ·)).card

/-- The multiplicity of the part `i`, i.e. the number of cyclic factors `ℤ/p^i`. -/
def partMult (A : FinAbPGroupClass) (i : ℕ) : ℕ :=
  A.2.parts.count i

theorem card_toGroup (p : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    Nat.card (A.toGroup p) = p ^ A.1 := sorry

theorem exists_addEquiv_toGroup (p : ℕ) [Fact p.Prime] (G : Type*) [AddCommGroup G] [Finite G]
    (hG : ∀ g : G, ∃ k : ℕ, p ^ k • g = 0) :
    ∃ A : FinAbPGroupClass, Nonempty (G ≃+ A.toGroup p) := sorry

theorem eq_of_addEquiv (p : ℕ) [Fact p.Prime] {A B : FinAbPGroupClass}
    (e : A.toGroup p ≃+ B.toGroup p) : A = B := sorry

theorem autCard_pos (p : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) : 0 < A.autCard p := sorry

theorem subsingleton_toGroup_trivial (p : ℕ) : Subsingleton (trivial.toGroup p) := sorry

theorem card_torsion_eq_pow_conjPart (p : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    Nat.card {x : A.toGroup p // p • x = 0} = p ^ A.conjPart 1 := sorry

/-- Unit test `ArithmeticStatistics.FinAbPGroupClass.test_autCard_cyclic`:
`|Aut(ℤ/p)| = p - 1`. -/
example (p : ℕ) [Fact p.Prime] :
    autCard p ⟨1, Nat.Partition.indiscrete 1⟩ = p - 1 := sorry

/-- Unit test `ArithmeticStatistics.FinAbPGroupClass.test_autCard_trivial`:
the trivial class has one automorphism. -/
example (p : ℕ) [Fact p.Prime] : trivial.autCard p = 1 := sorry

/-- Unit test `ArithmeticStatistics.FinAbPGroupClass.test_card_elementary`:
`(ℤ/p)²` has order `p²` (compatibility with `Nat.card`). -/
example (p : ℕ) [Fact p.Prime] :
    Nat.card (toGroup p ⟨2, Nat.Partition.ofSums 2 {1, 1} rfl⟩) = p ^ 2 :=
  sorry

/-- Unit test `ArithmeticStatistics.FinAbPGroupClass.test_cyclic_ne_elementary`:
`ℤ/p²` and `(ℤ/p)²` have the same order but are not isomorphic. -/
example (p : ℕ) [Fact p.Prime] :
    IsEmpty (toGroup p ⟨2, Nat.Partition.indiscrete 2⟩ ≃+
      toGroup p ⟨2, Nat.Partition.ofSums 2 {1, 1} rfl⟩) := sorry

/-- The order of the automorphism group (Hillar–Rhea; Majumder, Lemma 3 in conjugate form):
`|Aut A_λ| = p^{∑ (λ'_i)²} ∏_i ∏_{s=1}^{m_i(λ)} (1 - p^{-s})`. -/
theorem autCard_eq (p : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    (A.autCard p : ℝ) = (p : ℝ) ^ (∑ i ∈ Finset.Icc 1 A.1, A.conjPart i ^ 2) *
      ∏ i ∈ Finset.Icc 1 A.1, ∏ s ∈ Finset.Icc 1 (A.partMult i), (1 - ((p : ℝ) ^ s)⁻¹) := sorry

end FinAbPGroupClass

/-! ## Surjection counts -/

theorem surjCard_congr {X X' A A' : Type*} [AddCommGroup X] [AddCommGroup X'] [AddCommGroup A]
    [AddCommGroup A'] (e : X ≃+ X') (f : A ≃+ A') : surjCard X A = surjCard X' A' := sorry

theorem surjCard_toGroup_self (p : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    surjCard (A.toGroup p) (A.toGroup p) = A.autCard p := sorry

theorem surjCard_le_card_hom (X A : Type*) [AddCommGroup X] [AddCommGroup A] [Finite X]
    [Finite A] : surjCard X A ≤ Nat.card (X →+ A) := sorry

theorem surjCard_punit (X : Type*) [AddCommGroup X] : surjCard X PUnit = 1 := sorry

theorem surjCard_eq_zero_of_card_lt (X A : Type*) [AddCommGroup X] [AddCommGroup A] [Finite X]
    [Finite A] (h : Nat.card X < Nat.card A) : surjCard X A = 0 := sorry

/-- Unit test `ArithmeticStatistics.surjCard.test_cyclic_square_to_prime`:
there are `p - 1` surjections `ℤ/p² → ℤ/p`. -/
example (p : ℕ) [Fact p.Prime] : surjCard (ZMod (p ^ 2)) (ZMod p) = p - 1 := sorry

/-- Unit test `ArithmeticStatistics.surjCard.test_elementary_to_prime`:
there are `p² - 1` surjections `(ℤ/p)² → ℤ/p`. -/
example (p : ℕ) [Fact p.Prime] : surjCard (ZMod p × ZMod p) (ZMod p) = p ^ 2 - 1 := sorry

/-- Unit test `ArithmeticStatistics.surjCard.test_to_trivial`:
exactly one surjection onto the trivial group. -/
example : surjCard (ZMod 5) PUnit = 1 := sorry

/-- Unit test `ArithmeticStatistics.surjCard.test_prime_to_cyclic_square`:
no surjection `ℤ/p → ℤ/p²` although `Hom(ℤ/p, ℤ/p²)` has `p` elements. -/
example (p : ℕ) [Fact p.Prime] :
    surjCard (ZMod p) (ZMod (p ^ 2)) = 0 ∧ Nat.card (ZMod p →+ ZMod (p ^ 2)) = p := sorry

/-- The exact surjection count (EVW item 77): with `x_i`, `a_i` the conjugate partitions of `X`
and `A`, if `a_i ≤ x_i` for all `i` then
`|Sur(X, A)| = ∏_i p^{x_i a_{i+1}} ∏_{j=a_{i+1}}^{a_i - 1} (p^{x_i} - p^j)`. -/
theorem surjCard_toGroup_eq (p : ℕ) [Fact p.Prime] (X A : FinAbPGroupClass)
    (h : ∀ i, A.conjPart i ≤ X.conjPart i) :
    surjCard (X.toGroup p) (A.toGroup p) =
      ∏ i ∈ Finset.Icc 1 X.1, (p ^ (X.conjPart i * A.conjPart (i + 1)) *
        ∏ j ∈ Finset.Ico (A.conjPart (i + 1)) (A.conjPart i), (p ^ X.conjPart i - p ^ j)) :=
  sorry

theorem surjCard_toGroup_eq_zero (p : ℕ) [Fact p.Prime] (X A : FinAbPGroupClass)
    (h : ∃ i, X.conjPart i < A.conjPart i) :
    surjCard (X.toGroup p) (A.toGroup p) = 0 := sorry

/-! ## The Cohen–Lenstra measure -/

theorem cohenLenstraMeasure_apply (p u : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    cohenLenstraMeasure p u A = cohenLenstraWeight p u A := sorry

theorem cohenLenstraConstant_pos (p u : ℕ) [Fact p.Prime] : 0 < cohenLenstraConstant p u := sorry

theorem cohenLenstraConstant_lt_one (p u : ℕ) [Fact p.Prime] :
    cohenLenstraConstant p u < 1 := sorry

theorem cohenLenstraConstant_eq_mul_succ (p u : ℕ) [Fact p.Prime] :
    cohenLenstraConstant p u =
      (1 - ((p : ℝ) ^ (u + 1))⁻¹) * cohenLenstraConstant p (u + 1) := sorry

theorem cohenLenstraWeight_trivial (p u : ℕ) [Fact p.Prime] :
    cohenLenstraWeight p u FinAbPGroupClass.trivial = ENNReal.ofReal (cohenLenstraConstant p u) :=
  sorry

theorem cohenLenstraWeight_mul_card_autCard (p u : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    cohenLenstraWeight p u A * (((p : ℝ≥0∞) ^ (A.1 * u)) * (A.autCard p : ℝ≥0∞)) =
      ENNReal.ofReal (cohenLenstraConstant p u) := sorry

/-- The `p`-rank distribution of the Cohen–Lenstra measure (Wood, Corollary 3.5). -/
theorem cohenLenstraMeasure_rank_eq (p u k : ℕ) [Fact p.Prime] :
    ∑' A : FinAbPGroupClass, (if A.conjPart 1 = k then cohenLenstraMeasure p u A else 0) =
      ENNReal.ofReal ((p : ℝ) ^ (-((k * (k + u) : ℕ) : ℤ)) *
        (∏ i ∈ Finset.Icc 1 k, (1 - ((p : ℝ) ^ i)⁻¹))⁻¹ *
        (∏ i ∈ Finset.Icc 1 (k + u), (1 - ((p : ℝ) ^ i)⁻¹))⁻¹ * cohenLenstraConstant p 0) :=
  sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMeasure.test_trivial`:
the trivial group has mass `c_{p,0}`. -/
example (p : ℕ) [Fact p.Prime] :
    cohenLenstraMeasure p 0 FinAbPGroupClass.trivial = ENNReal.ofReal (cohenLenstraConstant p 0) :=
  sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMeasure.test_cyclic`:
`μ_{p,0}(ℤ/p) = c_{p,0}/(p - 1)`. -/
example (p : ℕ) [Fact p.Prime] :
    cohenLenstraMeasure p 0 ⟨1, Nat.Partition.indiscrete 1⟩ =
      ENNReal.ofReal (cohenLenstraConstant p 0) / ((p : ℝ≥0∞) - 1) := sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMeasure.test_cyclic_u_one`:
`μ_{p,1}(ℤ/p) = c_{p,1}/(p(p - 1))` (the real-quadratic weight). -/
example (p : ℕ) [Fact p.Prime] :
    cohenLenstraMeasure p 1 ⟨1, Nat.Partition.indiscrete 1⟩ =
      ENNReal.ofReal (cohenLenstraConstant p 1) / ((p : ℝ≥0∞) * ((p : ℝ≥0∞) - 1)) := sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMeasure.test_not_uniform_in_order`:
`μ(ℤ/p²) = (p² - 1) μ((ℤ/p)²)`, so the measure is not a function of `|A|` alone. -/
example (p : ℕ) [Fact p.Prime] :
    cohenLenstraMeasure p 0 ⟨2, Nat.Partition.indiscrete 2⟩ =
      ((p : ℝ≥0∞) ^ 2 - 1) * cohenLenstraMeasure p 0 ⟨2, Nat.Partition.ofSums 2 {1, 1} rfl⟩ :=
  sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMeasure.test_three_indivisible`:
`c_{3,0} = ∏ (1 - 3^{-i}) ≈ 0.5601`, the mass of `3`-indivisibility. -/
example : 0.56 < cohenLenstraConstant 3 0 ∧ cohenLenstraConstant 3 0 < 0.561 := sorry

/-! ## Mass formula -/

/-- Majumder's Lemmas 1–2: partitions of `m` with every part `≥ u + 1` are counted by
partitions of `i` with largest part exactly `j`, over `i + u j = m`. -/
theorem card_restricted_eq_sum_largest (u m : ℕ) :
    (Nat.Partition.restricted m (u + 1 ≤ ·)).card =
      ∑ j ∈ Finset.range (m + 1), if u * j ≤ m then
        (Finset.univ.filter fun ν : Nat.Partition (m - u * j) => ν.parts.sup = j).card else 0 :=
  sorry

/-- Hall's partition identity (Majumder, p. 5): for `0 ≤ q < 1`, the generating function of
partitions with largest part exactly `n` equals `∑_{μ ⊢ n} q^{∑ μ_i²} ∏_i ψ_{μ_i, μ_{i-1}-μ_i}(q)`,
written here after the substitution `μ = λ'` as a sum over classes of order `p^n`. -/
theorem hall_partition_identity (p n : ℕ) [Fact p.Prime] :
    ∑' N : ℕ, ((Finset.univ.filter fun ν : Nat.Partition N => ν.parts.sup = n).card : ℝ) *
        ((p : ℝ)⁻¹) ^ N =
      ∑ la : Nat.Partition n, ((FinAbPGroupClass.autCard p ⟨n, la⟩ : ℝ))⁻¹ := sorry

/-- The weighted inverse automorphism sum (Cohen–Lenstra; Majumder's Theorem). -/
theorem hasSum_inv_pow_mul_autCard (p u : ℕ) [Fact p.Prime] :
    HasSum (fun A : FinAbPGroupClass => (((p : ℝ) ^ (A.1 * u)) * A.autCard p)⁻¹)
      (∏' j : ℕ, (1 - ((p : ℝ) ^ (j + u + 1))⁻¹))⁻¹ := sorry

/-! ## Surjection moments -/

theorem surjectionMoment_trivial (p : ℕ) [Fact p.Prime] (ν : FinAbPGroupClass → ℝ≥0∞) :
    surjectionMoment p ν FinAbPGroupClass.trivial = ∑' X, ν X := sorry

theorem surjectionMoment_add (p : ℕ) (ν ν' : FinAbPGroupClass → ℝ≥0∞) (A : FinAbPGroupClass) :
    surjectionMoment p (ν + ν') A = surjectionMoment p ν A + surjectionMoment p ν' A := sorry

theorem surjectionMoment_const_mul (p : ℕ) (c : ℝ≥0∞) (ν : FinAbPGroupClass → ℝ≥0∞)
    (A : FinAbPGroupClass) :
    surjectionMoment p (fun X => c * ν X) A = c * surjectionMoment p ν A := sorry

theorem surjectionMoment_mono (p : ℕ) {ν ν' : FinAbPGroupClass → ℝ≥0∞} (h : ν ≤ ν')
    (A : FinAbPGroupClass) : surjectionMoment p ν A ≤ surjectionMoment p ν' A := sorry

theorem surjectionMoment_single (p : ℕ) (X A : FinAbPGroupClass) :
    surjectionMoment p (Pi.single X 1) A = surjCard (X.toGroup p) (A.toGroup p) := sorry

/-- Unit test `ArithmeticStatistics.surjectionMoment.test_zero`:
the zero measure has all moments zero. -/
example (p : ℕ) (A : FinAbPGroupClass) : surjectionMoment p 0 A = 0 := sorry

/-- Unit test `ArithmeticStatistics.surjectionMoment.test_dirac_cyclic`:
the Dirac mass at `ℤ/p` has `ℤ/p`-moment `p - 1` (a surjection count, not `|Hom| = p`). -/
example (p : ℕ) [Fact p.Prime] :
    surjectionMoment p (Pi.single ⟨1, Nat.Partition.indiscrete 1⟩ 1)
      ⟨1, Nat.Partition.indiscrete 1⟩ = (p : ℝ≥0∞) - 1 := sorry

/-- Unit test `ArithmeticStatistics.surjectionMoment.test_dirac_not_hom_count`:
the Dirac mass at `(ℤ/p)²` has `ℤ/p`-moment `p² - 1`, not `|Hom((ℤ/p)², ℤ/p)| = p²`. -/
example (p : ℕ) [Fact p.Prime] :
    surjectionMoment p (Pi.single ⟨2, Nat.Partition.ofSums 2 {1, 1} rfl⟩ 1)
      ⟨1, Nat.Partition.indiscrete 1⟩ = (p : ℝ≥0∞) ^ 2 - 1 := sorry

/-- Unit test `ArithmeticStatistics.surjectionMoment.test_probability_trivial_target`:
a probability measure has trivial-target moment `1`. -/
example (p : ℕ) [Fact p.Prime] (ν : PMF FinAbPGroupClass) :
    surjectionMoment p ν FinAbPGroupClass.trivial = 1 := sorry

/-- The class-count identity behind the moments (Cohen–Lenstra, Prop. 4.1(ii), as used in
Wood, Lemma 3.2): `∑_{|B| = p^i} |Sur(B, G)|/|Aut B| = ∑_{|K| = p^{i - n}} 1/|Aut K|`. -/
theorem sum_surjCard_div_autCard (p : ℕ) [Fact p.Prime] (G : FinAbPGroupClass) (i : ℕ)
    (hi : G.1 ≤ i) :
    ∑ la : Nat.Partition i, ((surjCard (FinAbPGroupClass.toGroup p ⟨i, la⟩) (G.toGroup p) : ℝ) /
        FinAbPGroupClass.autCard p ⟨i, la⟩) =
      ∑ κ : Nat.Partition (i - G.1), ((FinAbPGroupClass.autCard p ⟨i - G.1, κ⟩ : ℝ))⁻¹ :=
  sorry

/-- The Cohen–Lenstra moments: `∑_X μ_{p,u}(X) |Sur(X, A)| = |A|^{-u}`. -/
theorem surjectionMoment_cohenLenstraMeasure (p u : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    surjectionMoment p (cohenLenstraMeasure p u) A = ((p : ℝ≥0∞) ^ (A.1 * u))⁻¹ := sorry

/-! ## Uniqueness and convergence from moments (EVW §8.2–8.5) -/

/-- `c_ℓ > 1/2` for `ℓ ≥ 3`, so `β = c_ℓ⁻¹ - 1 < 1` (EVW item 113); false for `ℓ = 2`. -/
theorem half_lt_cohenLenstraConstant (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) :
    1 / 2 < cohenLenstraConstant ℓ 0 := sorry

/-- EVW Lemma 8.2: for `ℓ` odd, a probability measure with all surjection moments `1` is `μ_ℓ`. -/
theorem eq_cohenLenstraMeasure_of_surjectionMoment (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (ν : PMF FinAbPGroupClass) (h : ∀ A, surjectionMoment ℓ ν A = 1) :
    ν = cohenLenstraMeasure ℓ 0 := sorry

namespace FinAbPGroupClass

/-- `A'` is an `s`-enlargement of `A`: some surjection `A' ↠ A` has kernel of order `ℓ^s`. -/
def IsEnlargement (ℓ s : ℕ) (A' A : FinAbPGroupClass) : Prop :=
  ∃ f : A'.toGroup ℓ →+ A.toGroup ℓ, Function.Surjective f ∧ Nat.card f.ker = ℓ ^ s

open Classical in
/-- The finite set of `s`-enlargements of `A` (classes of order `ℓ^{s+|A|}` containing `A`). -/
noncomputable def enlargements (s : ℕ) (A : FinAbPGroupClass) : Finset FinAbPGroupClass :=
  (Finset.univ : Finset (Nat.Partition (A.1 + s))).image (fun la => ⟨A.1 + s, la⟩) |>.filter
    fun B => ∀ i, A.conjPart i ≤ B.conjPart i

theorem isEnlargement_iff_conjPart (ℓ s : ℕ) [Fact ℓ.Prime] (A' A : FinAbPGroupClass) :
    IsEnlargement ℓ s A' A ↔ A'.1 = A.1 + s ∧ ∀ i, A.conjPart i ≤ A'.conjPart i := sorry

theorem mem_enlargements (ℓ s : ℕ) [Fact ℓ.Prime] (A B : FinAbPGroupClass) :
    B ∈ enlargements s A ↔ IsEnlargement ℓ s B A := sorry

theorem card_enlargements_le (s : ℕ) (A : FinAbPGroupClass) :
    (enlargements s A).card ≤ Fintype.card (Nat.Partition (A.1 + s)) := sorry

theorem IsEnlargement.trans {ℓ s t : ℕ} [Fact ℓ.Prime] {A'' A' A : FinAbPGroupClass}
    (h₁ : IsEnlargement ℓ t A'' A') (h₂ : IsEnlargement ℓ s A' A) :
    IsEnlargement ℓ (s + t) A'' A := sorry

theorem isEnlargement_zero_iff (ℓ : ℕ) [Fact ℓ.Prime] (A' A : FinAbPGroupClass) :
    IsEnlargement ℓ 0 A' A ↔ A' = A := sorry

/-- Unit test `ArithmeticStatistics.FinAbPGroupClass.IsEnlargement.test_cyclic_of_trivial`:
`ℤ/ℓ` is a `1`-enlargement of the trivial group. -/
example (ℓ : ℕ) [Fact ℓ.Prime] : IsEnlargement ℓ 1 ⟨1, Nat.Partition.indiscrete 1⟩ trivial := sorry

/-- Unit test `ArithmeticStatistics.FinAbPGroupClass.IsEnlargement.test_split_and_nonsplit`:
both `(ℤ/ℓ)²` and `ℤ/ℓ²` are `1`-enlargements of `ℤ/ℓ`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    IsEnlargement ℓ 1 ⟨2, Nat.Partition.ofSums 2 {1, 1} rfl⟩ ⟨1, Nat.Partition.indiscrete 1⟩ ∧
      IsEnlargement ℓ 1 ⟨2, Nat.Partition.indiscrete 2⟩ ⟨1, Nat.Partition.indiscrete 1⟩ := sorry

/-- Unit test `ArithmeticStatistics.FinAbPGroupClass.IsEnlargement.test_not_enlargement`:
`ℤ/ℓ³` is not a `1`-enlargement of `(ℤ/ℓ)²` (it has no quotient `(ℤ/ℓ)²`). -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    ¬ IsEnlargement ℓ 1 ⟨3, Nat.Partition.indiscrete 3⟩ ⟨2, Nat.Partition.ofSums 2 {1, 1} rfl⟩ :=
  sorry

/-- Unit test `ArithmeticStatistics.FinAbPGroupClass.IsEnlargement.test_pointwise_lift_fails`:
for `π(x, y) = (x mod 3, y) : ℤ/9 × ℤ/3 ↠ (ℤ/3)²` and `f(x, y) = (y, x mod 3)`, no homomorphism
`g : ℤ/9 × ℤ/3 → ℤ/9 × ℤ/3` satisfies `π ∘ g = f` (EVW item 114, the failure of the pointwise
lifting claim in the proof of EVW Lemma 8.4). -/
example :
    let c : ZMod 9 →+ ZMod 3 := (ZMod.castHom (by norm_num : 3 ∣ 9) (ZMod 3)).toAddMonoidHom
    let π : ZMod 9 × ZMod 3 →+ ZMod 3 × ZMod 3 := AddMonoidHom.prodMap c (AddMonoidHom.id _)
    let f : ZMod 9 × ZMod 3 →+ ZMod 3 × ZMod 3 :=
      AddMonoidHom.prod (AddMonoidHom.snd _ _) (c.comp (AddMonoidHom.fst _ _))
    ¬ ∃ g : ZMod 9 × ZMod 3 →+ ZMod 9 × ZMod 3, π.comp g = f := sorry

end FinAbPGroupClass

/-- EVW (8.4.1), corrected (EVW item 78): if `X ↠ A` and `|X| > |A|` then some `1`-enlargement
`A'` of `A` has `(ℓ - 1) |Sur(X, A)| ≤ |Sur(X, A')|`. -/
theorem exists_enlargement_surjCard_ge (ℓ : ℕ) [Fact ℓ.Prime] (X A : FinAbPGroupClass)
    (hXA : 0 < surjCard (X.toGroup ℓ) (A.toGroup ℓ)) (hlt : A.1 < X.1) :
    ∃ A', FinAbPGroupClass.IsEnlargement ℓ 1 A' A ∧
      (ℓ - 1) * surjCard (X.toGroup ℓ) (A.toGroup ℓ) ≤ surjCard (X.toGroup ℓ) (A'.toGroup ℓ) :=
  sorry

/-- Partition tail domination (EVW item 79): for `ℓ ≥ 3`, `p(s + m)/(ℓ - 1)^s → 0`. -/
theorem tendsto_card_partition_div_pow (ℓ m : ℕ) (hℓ : 3 ≤ ℓ) :
    Tendsto (fun s : ℕ => (Fintype.card (Nat.Partition (s + m)) : ℝ) / ((ℓ : ℝ) - 1) ^ s)
      atTop (𝓝 0) := sorry

/-- EVW Lemma 8.4 (corrected proof): tails of `|Sur(-, A)|` are dominated by an average over a
finite set of enlargements. -/
theorem exists_surjCard_le_average_enlargements (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (ε : ℝ) (hε : 0 < ε) (A : FinAbPGroupClass) :
    ∃ (c : ℕ) (M : Finset FinAbPGroupClass), M.Nonempty ∧ ∀ X : FinAbPGroupClass, c < X.1 →
      (surjCard (X.toGroup ℓ) (A.toGroup ℓ) : ℝ) ≤
        ε * (∑ A' ∈ M, (surjCard (X.toGroup ℓ) (A'.toGroup ℓ) : ℝ)) / M.card := sorry

/-- EVW Proposition 8.3: finitely many approximate moments control finitely many masses. -/
theorem exists_moment_control (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (ε₀ : ℝ) (hε₀ : 0 < ε₀)
    (L : Finset FinAbPGroupClass) :
    ∃ (δ : ℝ) (L' : Finset FinAbPGroupClass), 0 < δ ∧ ∀ ν : PMF FinAbPGroupClass,
      (∀ A ∈ L', ENNReal.ofReal (1 - δ) ≤ surjectionMoment ℓ ν A ∧
        surjectionMoment ℓ ν A ≤ ENNReal.ofReal (1 + δ)) →
      ∀ A ∈ L, |(ν A).toReal - (cohenLenstraMeasure ℓ 0 A).toReal| ≤ ε₀ := sorry

/-- EVW §8.5 (corrected): moment convergence to `1` implies convergence of every mass. -/
theorem tendsto_of_tendsto_surjectionMoment (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (ν : ℕ → PMF FinAbPGroupClass)
    (h : ∀ A, Tendsto (fun n => surjectionMoment ℓ (ν n) A) atTop (𝓝 1)) (A : FinAbPGroupClass) :
    Tendsto (fun n => ν n A) atTop (𝓝 (cohenLenstraMeasure ℓ 0 A)) := sorry

/-- EVW item 115: distribution convergence does not force moment convergence. -/
theorem exists_tendsto_not_tendsto_surjectionMoment (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) :
    ∃ ν : ℕ → PMF FinAbPGroupClass,
      (∀ A, Tendsto (fun n => ν n A) atTop (𝓝 (cohenLenstraMeasure ℓ 0 A))) ∧
      Tendsto (fun n => surjectionMoment ℓ (ν n) ⟨1, Nat.Partition.indiscrete 1⟩) atTop (𝓝 2) :=
  sorry

/-- Wood, Theorem 3.1 with Lemma 3.2 (all primes, all `u`): if the moments of `ν_n` tend to
`|A|^{-u}` for every `A`, then `ν_n → μ_{p,u}` pointwise. -/
theorem tendsto_cohenLenstraMeasure_of_moments (p u : ℕ) [Fact p.Prime]
    (ν : ℕ → PMF FinAbPGroupClass)
    (h : ∀ A : FinAbPGroupClass,
      Tendsto (fun n => surjectionMoment p (ν n) A) atTop (𝓝 ((p : ℝ≥0∞) ^ (A.1 * u))⁻¹))
    (A : FinAbPGroupClass) :
    Tendsto (fun n => ν n A) atTop (𝓝 (cohenLenstraMeasure p u A)) := sorry

/-! ## Random `p`-adic matrices (Friedman–Washington) -/

/- The Borel σ-algebra on `ℤ_p` is ST.4's instance `padicIntMeasurableSpace`. -/

/-- Normalized Haar measure on `n × m` matrices over `ℤ_p`, as maps `ℤ_p^m → ℤ_p^n`. -/
noncomputable def padicMatrixHaar (p : ℕ) [Fact p.Prime] (n m : ℕ) :
    MeasureTheory.Measure (Fin n → Fin m → ℤ_[p]) := sorry

/-- The cokernel `ℤ_p^n / M ℤ_p^m` of a matrix. -/
abbrev padicCokernel (p : ℕ) [Fact p.Prime] {n m : ℕ} (M : Fin n → Fin m → ℤ_[p]) : Type :=
  (Fin n → ℤ_[p]) ⧸ LinearMap.range (Matrix.mulVecLin (M : Matrix (Fin n) (Fin m) ℤ_[p]))

/-- The finite-`n` cokernel law `P(coker M ≅ A)` for Haar `M ∈ M_{n × (n+u)}(ℤ_p)`. -/
noncomputable def cokernelLaw (p : ℕ) [Fact p.Prime] (n u : ℕ) (A : FinAbPGroupClass) : ℝ≥0∞ :=
  padicMatrixHaar p n (n + u)
    {M | Nonempty (padicCokernel p M ≃+ A.toGroup p)}

theorem padicMatrixHaar_univ (p : ℕ) [Fact p.Prime] (n m : ℕ) :
    padicMatrixHaar p n m Set.univ = 1 := sorry

theorem cokernelLaw_le_one (p : ℕ) [Fact p.Prime] (n u : ℕ) (A : FinAbPGroupClass) :
    cokernelLaw p n u A ≤ 1 := sorry

theorem tsum_cokernelLaw (p : ℕ) [Fact p.Prime] (n u : ℕ) : ∑' A, cokernelLaw p n u A = 1 := sorry

/-- Unit test `ArithmeticStatistics.cokernelLaw.test_zero_size`:
for `n = 0` the cokernel is trivial. -/
example (p : ℕ) [Fact p.Prime] (u : ℕ) : cokernelLaw p 0 u FinAbPGroupClass.trivial = 1 := sorry

/-- Unit test `ArithmeticStatistics.cokernelLaw.test_one_by_one`:
for `n = 1, u = 0`, `P(coker ≅ ℤ/p) = P(v_p(a) = 1) = (1 - 1/p)/p`. -/
example (p : ℕ) [Fact p.Prime] :
    cokernelLaw p 1 0 ⟨1, Nat.Partition.indiscrete 1⟩ =
      (1 - ((p : ℝ≥0∞))⁻¹) * ((p : ℝ≥0∞))⁻¹ := sorry

theorem cokernelLaw_trivial_eq (p : ℕ) [Fact p.Prime] (n : ℕ) :
    cokernelLaw p n 0 FinAbPGroupClass.trivial =
      (Nat.card (GL (Fin n) (ZMod p)) : ℝ≥0∞) / (p : ℝ≥0∞) ^ (n * n) := sorry

/-- Unit test `ArithmeticStatistics.cokernelLaw.test_one_by_one_trivial`:
for `n = 1, u = 0`, `P(coker = 0) = P(a ∈ ℤ_p^×) = 1 - 1/p`. -/
example (p : ℕ) [Fact p.Prime] :
    cokernelLaw p 1 0 FinAbPGroupClass.trivial = 1 - ((p : ℝ≥0∞))⁻¹ := sorry

/-- Unit test `ArithmeticStatistics.cokernelLaw.test_not_uniform_mod_p`:
for a `1 × 2` matrix (`n = 1, u = 1`), `P(coker = 0) = 1 - 1/p²`. -/
example (p : ℕ) [Fact p.Prime] :
    cokernelLaw p 1 1 FinAbPGroupClass.trivial = 1 - ((p : ℝ≥0∞) ^ 2)⁻¹ := sorry

/-- Exact finite-`n` moments: `E|Sur(coker M, A)| = |Sur(ℤ_p^n, A)| · |A|^{-(n+u)}`. -/
theorem surjectionMoment_cokernelLaw (p : ℕ) [Fact p.Prime] (n u : ℕ) (A : FinAbPGroupClass) :
    surjectionMoment p (cokernelLaw p n u) A =
      (surjCard (Fin n → ZMod (p ^ A.1)) (A.toGroup p) : ℝ≥0∞) /
        ((p : ℝ≥0∞) ^ A.1) ^ (n + u) := sorry

/-- Friedman–Washington (all `u`, Wood Theorem 1.3 in the Haar case). -/
theorem tendsto_cokernelLaw (p u : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    Tendsto (fun n => cokernelLaw p n u A) atTop (𝓝 (cohenLenstraMeasure p u A)) := sorry

/-- The Lipnowski–Tsimerman form: `coker(1 - F)` for Haar `F ∈ End_g(ℤ_ℓ)`. -/
theorem tendsto_cokernelLaw_one_sub (ℓ : ℕ) [Fact ℓ.Prime] (A : FinAbPGroupClass) :
    Tendsto (fun g => padicMatrixHaar ℓ g g
        {F | Nonempty (padicCokernel ℓ (fun i j => (if i = j then 1 else 0) - F i j) ≃+
          A.toGroup ℓ)})
      atTop (𝓝 (cohenLenstraMeasure ℓ 0 A)) := sorry

/-! ## Finitely many primes -/

/-- The product Cohen–Lenstra measure `CL_S` on tuples `(A_ℓ)_{ℓ ∈ S}` (Lipnowski–Tsimerman
§5.7.1), indexed by the primes of a finite set `S`. -/
noncomputable def cohenLenstraMeasureProd (S : Finset ℕ) (hS : ∀ ℓ ∈ S, ℓ.Prime) (u : ℕ) :
    (S → FinAbPGroupClass) → ℝ≥0∞ :=
  fun A => ∏ ℓ : S, (haveI : Fact (ℓ : ℕ).Prime := ⟨hS ℓ ℓ.2⟩; cohenLenstraMeasure ℓ u (A ℓ))

theorem hasSum_cohenLenstraMeasureProd (S : Finset ℕ) (hS : ∀ ℓ ∈ S, ℓ.Prime) (u : ℕ) :
    HasSum (cohenLenstraMeasureProd S hS u) 1 := sorry

theorem cohenLenstraMeasureProd_singleton (ℓ u : ℕ) [hℓ : Fact ℓ.Prime] (A : FinAbPGroupClass) :
    cohenLenstraMeasureProd {ℓ} (by simpa using hℓ.out) u (fun _ => A) =
      cohenLenstraMeasure ℓ u A := sorry

theorem cohenLenstraMeasureProd_empty (hS : ∀ ℓ ∈ (∅ : Finset ℕ), ℓ.Prime) (u : ℕ)
    (A : (∅ : Finset ℕ) → FinAbPGroupClass) : cohenLenstraMeasureProd ∅ hS u A = 1 := sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMeasureProd.test_independence`:
for `S = {3, 5}` the mass of `(ℤ/3, 0)` is `μ_3(ℤ/3) μ_5(0)`. -/
example (hS : ∀ ℓ ∈ ({3, 5} : Finset ℕ), ℓ.Prime) :
    haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
    haveI : Fact (Nat.Prime 5) := ⟨by decide⟩
    cohenLenstraMeasureProd {3, 5} hS 0
        (fun ℓ => if (ℓ : ℕ) = 3 then ⟨1, Nat.Partition.indiscrete 1⟩ else FinAbPGroupClass.trivial) =
      cohenLenstraMeasure 3 0 ⟨1, Nat.Partition.indiscrete 1⟩ *
        cohenLenstraMeasure 5 0 FinAbPGroupClass.trivial := sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMeasureProd.test_empty`:
for `S = ∅` the measure is the point mass `1`. -/
example (hS : ∀ ℓ ∈ (∅ : Finset ℕ), ℓ.Prime) (A : (∅ : Finset ℕ) → FinAbPGroupClass) :
    cohenLenstraMeasureProd ∅ hS 0 A = 1 := sorry

/-- Unit test `ArithmeticStatistics.cohenLenstraMeasureProd.test_all_trivial`:
the all-trivial tuple has mass `∏_{ℓ ∈ S} c_{ℓ,0}`. -/
example : haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
    cohenLenstraMeasureProd {3} (fun ℓ h => by rw [Finset.mem_singleton] at h; subst h; exact Nat.prime_three) 0 (fun _ => FinAbPGroupClass.trivial) =
      ENNReal.ofReal (cohenLenstraConstant 3 0) := sorry

/-! ## The Cohen–Lenstra heuristic for quadratic fields (a conjecture) -/

/-- The `p`-primary part of the class group of a number field, as an additive group. -/
abbrev classGroupPrimary (K : Type*) [Field K] [NumberField K] (p : ℕ) : Type _ :=
  Additive (CommGroup.primaryComponent (ClassGroup (NumberField.RingOfIntegers K)) p)

/-- A family `K d ≅ ℚ(√d)` of quadratic fields, indexed by squarefree `d ≠ 1`. -/
def IsQuadraticFamily (K : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)] : Prop :=
  ∀ d : ℤ, Squarefree d → d ≠ 1 →
    Module.finrank ℚ (K d) = 2 ∧ ∃ x : K d, x ^ 2 = (d : K d)

/-- Squarefree `d` with the sign `s` (`-1` imaginary, `1` real) and `|disc(ℚ(√d))| ≤ X`. -/
def quadraticFamilyUpTo (K : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)]
    (s : ℤ) (X : ℕ) : Set ℤ :=
  {d | Squarefree d ∧ d ≠ 1 ∧ 0 < s * d ∧ |NumberField.discr (K d)| ≤ X}

/-- **Cohen–Lenstra heuristic** (conjecture): for odd `p` and every finite abelian `p`-group `B`,
the proportion of imaginary (`u = 0`) resp. real (`u = 1`) quadratic fields with `|disc| ≤ X`
whose class group has `p`-part `≅ B` tends to `μ_{p,u}(B)`. -/
def CohenLenstraHeuristic (p : ℕ) [Fact p.Prime] (u : ℕ) (K : ℤ → Type*) [∀ d, Field (K d)]
    [∀ d, NumberField (K d)] : Prop :=
  ∀ B : FinAbPGroupClass,
    Tendsto (fun X : ℕ =>
        ((({d ∈ quadraticFamilyUpTo K (if u = 0 then -1 else 1) X |
            Nonempty (classGroupPrimary (K d) p ≃+ B.toGroup p)} : Set ℤ).ncard : ℝ) /
          ((quadraticFamilyUpTo K (if u = 0 then -1 else 1) X).ncard : ℝ)))
      atTop (𝓝 (cohenLenstraMeasure p u B).toReal)

/-- The moment form (EVW (8.5.1)): the average of `|Sur(Cl_K, A)|` tends to `|A|^{-u}`. -/
def CohenLenstraMomentConjecture (p : ℕ) [Fact p.Prime] (u : ℕ) (K : ℤ → Type*)
    [∀ d, Field (K d)] [∀ d, NumberField (K d)] : Prop :=
  ∀ A : FinAbPGroupClass,
    Tendsto (fun X : ℕ =>
        (∑ᶠ d ∈ quadraticFamilyUpTo K (if u = 0 then -1 else 1) X,
            (surjCard (classGroupPrimary (K d) p) (A.toGroup p) : ℝ)) /
          ((quadraticFamilyUpTo K (if u = 0 then -1 else 1) X).ncard : ℝ))
      atTop (𝓝 ((p : ℝ) ^ (A.1 * u))⁻¹)

theorem quadraticFamilyUpTo_finite (K : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)]
    (hK : IsQuadraticFamily K) (s : ℤ) (X : ℕ) : (quadraticFamilyUpTo K s X).Finite := sorry

theorem cohenLenstraHeuristic_iff_primary_independent (p : ℕ) [Fact p.Prime] (u : ℕ)
    (K K' : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)] [∀ d, Field (K' d)]
    [∀ d, NumberField (K' d)] (hK : IsQuadraticFamily K) (hK' : IsQuadraticFamily K') :
    CohenLenstraHeuristic p u K ↔ CohenLenstraHeuristic p u K' := sorry

theorem cohenLenstraHeuristic_tsum_limits (p : ℕ) [Fact p.Prime] (u : ℕ) (K : ℤ → Type*)
    [∀ d, Field (K d)] [∀ d, NumberField (K d)] (h : CohenLenstraHeuristic p u K) :
    ∑' B, cohenLenstraMeasure p u B = 1 := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraHeuristic.test_trivial_limit`:
the conjecture predicts that the proportion of imaginary quadratic fields with `3 ∤ h_K`
tends to `c_{3,0} ≈ 0.560`. -/
example (K : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)]
    (h : haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩; CohenLenstraHeuristic 3 0 K) :
    haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
    Tendsto (fun X : ℕ =>
        ((({d ∈ quadraticFamilyUpTo K (-1) X |
            Nonempty (classGroupPrimary (K d) 3 ≃+ FinAbPGroupClass.trivial.toGroup 3)} :
              Set ℤ).ncard : ℝ) / ((quadraticFamilyUpTo K (-1) X).ncard : ℝ)))
      atTop (𝓝 (cohenLenstraConstant 3 0)) := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraHeuristic.test_divisible_proportion`:
the conjecture predicts that the proportion of imaginary quadratic fields with `3 ∣ h_K`
tends to `1 - c_{3,0} ≈ 0.440`. -/
example (K : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)]
    (h : haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩; CohenLenstraHeuristic 3 0 K) :
    haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
    Tendsto (fun X : ℕ =>
        ((({d ∈ quadraticFamilyUpTo K (-1) X |
            IsEmpty (classGroupPrimary (K d) 3 ≃+ FinAbPGroupClass.trivial.toGroup 3)} :
              Set ℤ).ncard : ℝ) / ((quadraticFamilyUpTo K (-1) X).ncard : ℝ)))
      atTop (𝓝 (1 - cohenLenstraConstant 3 0)) := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraMomentConjecture.test_trivial_target`:
at the trivial target the moment form holds for every quadratic family. -/
example (p : ℕ) [Fact p.Prime] (u : ℕ) (K : ℤ → Type*) [∀ d, Field (K d)]
    [∀ d, NumberField (K d)] (hK : IsQuadraticFamily K) :
    Tendsto (fun X : ℕ =>
        (∑ᶠ d ∈ quadraticFamilyUpTo K (if u = 0 then -1 else 1) X,
            (surjCard (classGroupPrimary (K d) p) (FinAbPGroupClass.trivial.toGroup p) : ℝ)) /
          ((quadraticFamilyUpTo K (if u = 0 then -1 else 1) X).ncard : ℝ))
      atTop (𝓝 1) := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraMomentConjecture.test_not_hom_count`:
under the conjecture for `p = 3`, `u = 0`, the average of `|Hom(Cl, ℤ/3)| = |Cl[3]|` tends to `2`,
not to the surjection moment `1`. -/
example (K : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)] (hK : IsQuadraticFamily K)
    (h : haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩; CohenLenstraMomentConjecture 3 0 K) :
    haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
    Tendsto (fun X : ℕ =>
        (∑ᶠ d ∈ quadraticFamilyUpTo K (-1) X,
            (Nat.card (classGroupPrimary (K d) 3 →+ ZMod 3) : ℝ)) /
          ((quadraticFamilyUpTo K (-1) X).ncard : ℝ)) atTop (𝓝 2) := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraMomentConjecture.test_three_torsion_moment`:
the `ℤ/3`-moment form predicts average `|Cl[3]| - 1 → 1` (imaginary), the Davenport–Heilbronn
value (proved at ST.3). -/
example (K : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)]
    (h : haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩; CohenLenstraMomentConjecture 3 0 K) :
    haveI : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
    Tendsto (fun X : ℕ =>
        (∑ᶠ d ∈ quadraticFamilyUpTo K (-1) X,
            (surjCard (classGroupPrimary (K d) 3) (ZMod 3) : ℝ)) /
          ((quadraticFamilyUpTo K (-1) X).ncard : ℝ)) atTop (𝓝 1) := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraHeuristic.test_real_weight`:
for real fields (`u = 1`) the predicted mass of `ℤ/p` is `c_{p,1}/(p(p-1))`, not `c_{p,0}/(p-1)`. -/
example (p : ℕ) [Fact p.Prime] :
    (cohenLenstraMeasure p 1 ⟨1, Nat.Partition.indiscrete 1⟩).toReal =
      cohenLenstraConstant p 1 / ((p : ℝ) * ((p : ℝ) - 1)) := sorry

/-- EVW §8.5 (corrected direction): for odd `p` the moment form implies the heuristic
(imaginary fields). -/
theorem cohenLenstraHeuristic_of_momentConjecture (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (K : ℤ → Type*) [∀ d, Field (K d)] [∀ d, NumberField (K d)] (hK : IsQuadraticFamily K)
    (h : CohenLenstraMomentConjecture p 0 K) : CohenLenstraHeuristic p 0 K := sorry

/-! ## Random matrices over finite fields (Koymans–Pagano, MacWilliams) -/

/-- `P(m, n, j)`: the probability that a uniformly random `m × n` matrix over the finite field
`F` has right kernel of dimension `j`. -/
noncomputable def matrixKernelLaw (F : Type*) [Field F] [Fintype F] (m n j : ℕ) : ℚ :=
  (Nat.card {M : Matrix (Fin m) (Fin n) F //
      Module.finrank F (LinearMap.ker (Matrix.mulVecLin M)) = j} : ℚ) /
    (Fintype.card F : ℚ) ^ (m * n)

/-- `P_Sym(r, n)`: the probability that a uniformly random symmetric `r × r` matrix over `F` has
kernel of dimension `n`. -/
noncomputable def symmetricKernelLaw (F : Type*) [Field F] [Fintype F] (r n : ℕ) : ℚ :=
  (Nat.card {M : Matrix (Fin r) (Fin r) F //
      M.IsSymm ∧ Module.finrank F (LinearMap.ker (Matrix.mulVecLin M)) = n} : ℚ) /
    (Fintype.card F : ℚ) ^ (r * (r + 1) / 2)

theorem sum_matrixKernelLaw (F : Type*) [Field F] [Fintype F] (m n : ℕ) :
    ∑ j ∈ Finset.range (n + 1), matrixKernelLaw F m n j = 1 := sorry

theorem matrixKernelLaw_eq_zero_of_lt (F : Type*) [Field F] [Fintype F] (m n j : ℕ)
    (h : j + m < n ∨ n < j) : matrixKernelLaw F m n j = 0 := sorry

theorem matrixKernelLaw_zero_eq_card_GL (F : Type*) [Field F] [Fintype F] (n : ℕ) :
    matrixKernelLaw F n n 0 = (Nat.card (GL (Fin n) F) : ℚ) / (Fintype.card F : ℚ) ^ (n * n) :=
  sorry

theorem sum_symmetricKernelLaw (F : Type*) [Field F] [Fintype F] (r : ℕ) :
    ∑ n ∈ Finset.range (r + 1), symmetricKernelLaw F r n = 1 := sorry

theorem symmetricKernelLaw_self (F : Type*) [Field F] [Fintype F] (r : ℕ) :
    symmetricKernelLaw F r r = ((Fintype.card F : ℚ) ^ (r * (r + 1) / 2))⁻¹ := sorry

theorem symmetricKernelLaw_eq_zero_of_lt (F : Type*) [Field F] [Fintype F] (r n : ℕ)
    (h : r < n) : symmetricKernelLaw F r n = 0 := sorry

/-- Unit test `ArithmeticStatistics.matrixKernelLaw.test_one_by_one`:
over `F_2`, a `1 × 1` matrix has kernel of dimension `0` or `1` with probability `1/2` each. -/
example : matrixKernelLaw (ZMod 2) 1 1 0 = 1 / 2 ∧ matrixKernelLaw (ZMod 2) 1 1 1 = 1 / 2 := sorry

/-- Unit test `ArithmeticStatistics.matrixKernelLaw.test_two_by_two`:
over `F_2`, `P(2,2,0) = 6/16`, `P(2,2,1) = 9/16`, `P(2,2,2) = 1/16`. -/
example : matrixKernelLaw (ZMod 2) 2 2 0 = 6 / 16 ∧ matrixKernelLaw (ZMod 2) 2 2 1 = 9 / 16 ∧
    matrixKernelLaw (ZMod 2) 2 2 2 = 1 / 16 := sorry

/-- Unit test `ArithmeticStatistics.matrixKernelLaw.test_empty`:
the `0 × 0` matrix has kernel `0`. -/
example : matrixKernelLaw (ZMod 2) 0 0 0 = 1 := sorry

/-- Unit test `ArithmeticStatistics.symmetricKernelLaw.test_two`:
over `F_2`, among the `8` symmetric `2 × 2` matrices, `4` are invertible, `3` have rank one. -/
example : symmetricKernelLaw (ZMod 2) 2 0 = 4 / 8 ∧ symmetricKernelLaw (ZMod 2) 2 1 = 3 / 8 ∧
    symmetricKernelLaw (ZMod 2) 2 2 = 1 / 8 := sorry

/-- Unit test `ArithmeticStatistics.symmetricKernelLaw.test_empty`:
the `0 × 0` symmetric matrix has kernel `0`. -/
example : symmetricKernelLaw (ZMod 2) 0 0 = 1 := sorry

/-- Unit test `ArithmeticStatistics.symmetricKernelLaw.test_differs_from_all_matrices`:
symmetric matrices over `F_2` are invertible more often than all matrices (`1/2` versus `3/8`
at size `2`). -/
example : matrixKernelLaw (ZMod 2) 2 2 0 < symmetricKernelLaw (ZMod 2) 2 0 := sorry

/-- The number of `m × n` matrices of rank `r` over `F_q`:
`∏_{i<r} (q^m - q^i)(q^n - q^i)/(q^r - q^i)`. -/
theorem card_matrix_rank_eq (F : Type*) [Field F] [Fintype F] (m n r : ℕ) (hr : r ≤ min m n) :
    (Nat.card {M : Matrix (Fin m) (Fin n) F // M.rank = r} : ℚ) =
      ∏ i ∈ Finset.range r, (((Fintype.card F : ℚ) ^ m - (Fintype.card F : ℚ) ^ i) *
        ((Fintype.card F : ℚ) ^ n - (Fintype.card F : ℚ) ^ i) /
          ((Fintype.card F : ℚ) ^ r - (Fintype.card F : ℚ) ^ i)) := sorry

/-- MacWilliams (1969): the number of symmetric `s × s` matrices of rank `k` over `F_q`,
`k = 2h` or `2h + 1`, is `∏_{i=1}^h q^{2i}/(q^{2i} - 1) · ∏_{i=0}^{k-1} (q^{s-i} - 1)`. -/
theorem card_symmetric_rank_eq (F : Type*) [Field F] [Fintype F] (s k : ℕ) (hk : k ≤ s) :
    (Nat.card {M : Matrix (Fin s) (Fin s) F // M.IsSymm ∧ M.rank = k} : ℚ) =
      (∏ i ∈ Finset.Icc 1 (k / 2), ((Fintype.card F : ℚ) ^ (2 * i) /
          ((Fintype.card F : ℚ) ^ (2 * i) - 1))) *
        ∏ i ∈ Finset.range k, ((Fintype.card F : ℚ) ^ (s - i) - 1) := sorry

/-- The limit of `P_Sym(r, n)` over `F_2`: `∏_{j odd} (1 - 2^{-j}) / ∏_{i=1}^n (2^i - 1)`, with the
explicit rate `|P_Sym(r, n) - limit| ≤ 2^{n + 1 - r}`. -/
theorem abs_symmetricKernelLaw_sub_limit_le (r n : ℕ) (hr : 1 ≤ r) :
    |(symmetricKernelLaw (ZMod 2) r n : ℝ) -
        (∏' j : ℕ, (1 - ((2 : ℝ) ^ (2 * j + 1))⁻¹)) / ∏ i ∈ Finset.Icc 1 n, ((2 : ℝ) ^ i - 1)| ≤
      (2 : ℝ) ^ ((n : ℤ) + 1 - r) := sorry

theorem tendsto_symmetricKernelLaw (n : ℕ) :
    Tendsto (fun r => (symmetricKernelLaw (ZMod 2) r n : ℝ)) atTop
      (𝓝 ((∏' j : ℕ, (1 - ((2 : ℝ) ^ (2 * j + 1))⁻¹)) / ∏ i ∈ Finset.Icc 1 n, ((2 : ℝ) ^ i - 1))) :=
  sorry

/-- Koymans–Pagano, "Higher Rédei reciprocity", (A.2):
`1/(2^{m+1} - 1) = ∑_{n=0}^m 1/(2^{n+1} - 1) · P(m, m, n)/2^m`. -/
theorem koymans_pagano_rank_identity (m : ℕ) :
    (1 : ℚ) / (2 ^ (m + 1) - 1) =
      ∑ n ∈ Finset.range (m + 1), 1 / (2 ^ (n + 1) - 1) * matrixKernelLaw (ZMod 2) m m n / 2 ^ m :=
  sorry

/-! ## Cohen–Martinet predictions (Lemke Oliver–Wang–Wood §7) -/

/-- The Cohen–Martinet predicted surjection moment `∏_v |Z^{σ_v}|⁻¹` of a finite `G`-module `Z`
over `F_p`, given the complex-conjugation elements `σ_v` at the infinite places of the base. -/
noncomputable def cohenMartinetPredictedMoment {G : Type*} [Group G] {p : ℕ} {V : Type*}
    [AddCommGroup V] [Module (ZMod p) V] (ρ : Representation (ZMod p) G V) (σ : List G) : ℚ :=
  ((σ.map fun g => (Nat.card (LinearMap.ker (ρ g - LinearMap.id)) : ℚ)).prod)⁻¹

theorem cohenMartinetPredictedMoment_nil {G : Type*} [Group G] {p : ℕ} {V : Type*}
    [AddCommGroup V] [Module (ZMod p) V] (ρ : Representation (ZMod p) G V) :
    cohenMartinetPredictedMoment ρ [] = 1 := sorry

theorem cohenMartinetPredictedMoment_cons {G : Type*} [Group G] {p : ℕ} {V : Type*}
    [AddCommGroup V] [Module (ZMod p) V] (ρ : Representation (ZMod p) G V) (g : G) (σ : List G) :
    cohenMartinetPredictedMoment ρ (g :: σ) =
      (Nat.card (LinearMap.ker (ρ g - LinearMap.id)) : ℚ)⁻¹ * cohenMartinetPredictedMoment ρ σ :=
  sorry

theorem cohenMartinetPredictedMoment_eq_pow {G : Type*} [Group G] {p : ℕ} [Fact p.Prime]
    {V : Type*} [AddCommGroup V] [Module (ZMod p) V] [FiniteDimensional (ZMod p) V]
    (ρ : Representation (ZMod p) G V) (σ : List G) :
    cohenMartinetPredictedMoment ρ σ =
      ((p : ℚ) ^ (σ.map fun g => Module.finrank (ZMod p) (LinearMap.ker (ρ g - LinearMap.id))).sum)⁻¹ :=
  sorry

/-- Unit test `ArithmeticStatistics.cohenMartinetPredictedMoment.test_imaginary_quadratic`:
`G = C₂` acting on `Z = F_p` (`p` odd) by `-1`, one complex place with `σ` the generator:
`|Z^σ| = 1`, prediction `1` — the Cohen–Lenstra `u = 0` moment. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (ρ : Representation (ZMod p) (Multiplicative (ZMod 2)) (ZMod p))
    (hρ : ρ (Multiplicative.ofAdd 1) = -LinearMap.id) :
    cohenMartinetPredictedMoment ρ [Multiplicative.ofAdd 1] = 1 := sorry

/-- Unit test `ArithmeticStatistics.cohenMartinetPredictedMoment.test_real_quadratic`:
for a real place (`σ = 1`), `|Z^σ| = |Z| = p`, prediction `1/p` — the Cohen–Lenstra `u = 1` moment. -/
example (p : ℕ) [Fact p.Prime] (ρ : Representation (ZMod p) (Multiplicative (ZMod 2)) (ZMod p)) :
    cohenMartinetPredictedMoment ρ [1] = (p : ℚ)⁻¹ := sorry

/-- Unit test `ArithmeticStatistics.cohenMartinetPredictedMoment.test_not_global_invariants`:
the prediction uses the fixed points of each `σ_v`, not of `G`: with `ρ` the sign
representation of `C₂` over `F_3` and `σ = [1]`, the prediction is `1/3`, although `Z^G = 0`. -/
example (ρ : Representation (ZMod 3) (Multiplicative (ZMod 2)) (ZMod 3))
    (hρ : ρ (Multiplicative.ofAdd 1) = -LinearMap.id) :
    cohenMartinetPredictedMoment ρ [1] = 1 / 3 ∧
      cohenMartinetPredictedMoment ρ [Multiplicative.ofAdd 1] = 1 := sorry

/-- The number of `G`-equivariant surjections `M → V`. -/
noncomputable def equivariantSurjCard {G : Type*} [Group G] {p : ℕ} (M : Type*) [AddCommGroup M]
    [DistribMulAction G M] {V : Type*} [AddCommGroup V] [Module (ZMod p) V]
    (ρ : Representation (ZMod p) G V) : ℕ :=
  Nat.card {f : M →+ V // Function.Surjective f ∧ ∀ (g : G) (x : M), f (g • x) = ρ g (f x)}

/-- **Cohen–Lenstra–Martinet average conjecture** (LOWW (1.1)) for a counted family `E X` of
number fields (the `G`-extensions of `k` with `Disc ≤ X`, `p ∤ |G|`): the average of
`|Cl_K[p]|` tends to a positive constant. -/
def CohenLenstraMartinetAverage (E : ℕ → Finset (IntermediateField ℚ (AlgebraicClosure ℚ)))
    (p : ℕ) : Prop :=
  ∃ c : ℝ, 0 < c ∧ Tendsto (fun X : ℕ =>
      (∑ K ∈ E X, (Nat.card {x : ClassGroup (integralClosure ℤ K) // x ^ p = 1} : ℝ)) /
        ((E X).card : ℝ)) atTop (𝓝 c)

theorem CohenLenstraMartinetAverage.exists_pos_limit
    {E : ℕ → Finset (IntermediateField ℚ (AlgebraicClosure ℚ))} {p : ℕ}
    (h : CohenLenstraMartinetAverage E p) :
    ∃ c : ℝ, 0 < c ∧ Tendsto (fun X : ℕ =>
      (∑ K ∈ E X, (Nat.card {x : ClassGroup (integralClosure ℤ K) // x ^ p = 1} : ℝ)) /
        ((E X).card : ℝ)) atTop (𝓝 c) := h

theorem cohenLenstraMartinetAverage_of_eventually_const
    (E : ℕ → Finset (IntermediateField ℚ (AlgebraicClosure ℚ))) (p m : ℕ) (hm : 1 ≤ m)
    (hE : ∀ᶠ X in atTop, (E X).Nonempty)
    (hc : ∀ᶠ X in atTop, ∀ K ∈ E X,
      Nat.card {x : ClassGroup (integralClosure ℤ K) // x ^ p = 1} = m) :
    CohenLenstraMartinetAverage E p := sorry

theorem cohenLenstraMartinetAverage_empty (p : ℕ) :
    ¬ CohenLenstraMartinetAverage (fun _ => ∅) p := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraMartinetAverage.test_constant_family`:
a nonempty family with `|Cl_K[3]| = 3` everywhere satisfies the conjecture with `c = 3`. -/
example (E : ℕ → Finset (IntermediateField ℚ (AlgebraicClosure ℚ)))
    (hE : ∀ X, (E X).Nonempty)
    (hc : ∀ X, ∀ K ∈ E X, Nat.card {x : ClassGroup (integralClosure ℤ K) // x ^ 3 = 1} = 3) :
    Tendsto (fun X : ℕ =>
      (∑ K ∈ E X, (Nat.card {x : ClassGroup (integralClosure ℤ K) // x ^ 3 = 1} : ℝ)) /
        ((E X).card : ℝ)) atTop (𝓝 3) := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraMartinetAverage.test_trivial_torsion`:
a nonempty family with trivial `p`-torsion everywhere satisfies the conjecture. -/
example (E : ℕ → Finset (IntermediateField ℚ (AlgebraicClosure ℚ))) (p : ℕ)
    (hE : ∀ X, (E X).Nonempty)
    (hc : ∀ X, ∀ K ∈ E X, Nat.card {x : ClassGroup (integralClosure ℤ K) // x ^ p = 1} = 1) :
    CohenLenstraMartinetAverage E p := sorry

/-- Unit test `ArithmeticStatistics.CohenLenstraMartinetAverage.test_requires_positive_limit`:
the empty family does not satisfy the conjecture. -/
example : ¬ CohenLenstraMartinetAverage (fun _ => ∅) 3 := sorry

/-- **Cohen–Martinet moment conjecture** (Wang–Wood form): for a counted family of Galois
`G`-extensions with fixed complex conjugations `σ`, whose relative class groups `C i` carry their
`G`-action, the average number of `G`-surjections onto an `F_p[G]`-module `V` with no trivial
constituent tends to `∏_v |V^{σ_v}|⁻¹`. -/
def CohenMartinetMomentConjecture {ι G : Type*} [Group G] {p : ℕ} (E : ℕ → Finset ι)
    (C : ι → Type*) [∀ i, AddCommGroup (C i)] [∀ i, DistribMulAction G (C i)] {V : Type*}
    [AddCommGroup V] [Module (ZMod p) V] (ρ : Representation (ZMod p) G V) (σ : List G) : Prop :=
  Tendsto (fun X : ℕ =>
      (∑ i ∈ E X, (equivariantSurjCard (C i) ρ : ℝ)) / ((E X).card : ℝ))
    atTop (𝓝 (cohenMartinetPredictedMoment ρ σ : ℝ))

theorem CohenMartinetMomentConjecture.tendsto {ι G : Type*} [Group G] {p : ℕ}
    {E : ℕ → Finset ι} {C : ι → Type*} [∀ i, AddCommGroup (C i)] [∀ i, DistribMulAction G (C i)]
    {V : Type*} [AddCommGroup V] [Module (ZMod p) V] {ρ : Representation (ZMod p) G V}
    {σ : List G} (h : CohenMartinetMomentConjecture E C ρ σ) :
    Tendsto (fun X : ℕ => (∑ i ∈ E X, (equivariantSurjCard (C i) ρ : ℝ)) / ((E X).card : ℝ))
      atTop (𝓝 (cohenMartinetPredictedMoment ρ σ : ℝ)) := h

theorem cohenMartinetMomentConjecture_zero_module {ι G : Type*} [Group G] {p : ℕ}
    (E : ℕ → Finset ι) (C : ι → Type*) [∀ i, AddCommGroup (C i)] [∀ i, DistribMulAction G (C i)]
    (ρ : Representation (ZMod p) G PUnit) (σ : List G) (hE : ∀ᶠ X in atTop, (E X).Nonempty) :
    CohenMartinetMomentConjecture E C ρ σ := sorry

/-- Unit test `ArithmeticStatistics.CohenMartinetMomentConjecture.test_cohen_lenstra_case`:
for `G = C₂` acting by `-1` on `F_p` and `σ` the generator, the conjecture says the average number
of equivariant surjections tends to `1` (Cohen–Lenstra, `u = 0`). -/
example {ι : Type*} (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (E : ℕ → Finset ι) (C : ι → Type*)
    [∀ i, AddCommGroup (C i)] [∀ i, DistribMulAction (Multiplicative (ZMod 2)) (C i)]
    (ρ : Representation (ZMod p) (Multiplicative (ZMod 2)) (ZMod p))
    (hρ : ρ (Multiplicative.ofAdd 1) = -LinearMap.id)
    (h : CohenMartinetMomentConjecture E C ρ [Multiplicative.ofAdd 1]) :
    Tendsto (fun X : ℕ => (∑ i ∈ E X, (equivariantSurjCard (C i) ρ : ℝ)) / ((E X).card : ℝ))
      atTop (𝓝 1) := sorry

/-- Unit test `ArithmeticStatistics.CohenMartinetMomentConjecture.test_trivial_constituent_excluded`:
for the trivial module `F_p` and a real place the formula would predict `1/p`, but a family whose
groups have no trivial quotient has average `0`: the conjecture fails there. -/
example {ι G : Type*} [Group G] (p : ℕ) [Fact p.Prime] (E : ℕ → Finset ι) (C : ι → Type*)
    [∀ i, AddCommGroup (C i)] [∀ i, DistribMulAction G (C i)]
    (hE : ∀ᶠ X in atTop, (E X).Nonempty)
    (h0 : ∀ i, equivariantSurjCard (C i) (1 : Representation (ZMod p) G (ZMod p)) = 0) :
    ¬ CohenMartinetMomentConjecture E C (1 : Representation (ZMod p) G (ZMod p)) [1] := sorry

/-- Unit test `ArithmeticStatistics.CohenMartinetMomentConjecture.test_zero_module`:
for `V = 0` the conjecture holds for every eventually nonempty family. -/
example {ι : Type*} (p : ℕ) (E : ℕ → Finset ι) (C : ι → Type*) [∀ i, AddCommGroup (C i)]
    [∀ i, DistribMulAction (Multiplicative (ZMod 2)) (C i)]
    (ρ : Representation (ZMod p) (Multiplicative (ZMod 2)) PUnit)
    (hE : ∀ X, (E X).Nonempty) : CohenMartinetMomentConjecture E C ρ [1] := sorry

/-- LOWW, proof of Proposition 7.1: every nonzero `G`-map to an irreducible `V` is onto, so
`|Hom_G(M, V)| = 1 + |Sur_G(M, V)|`. -/
theorem card_equivariantHom_eq_one_add {G : Type*} [Group G] {p : ℕ} [Fact p.Prime] (M : Type*)
    [AddCommGroup M] [DistribMulAction G M] [Finite M] {V : Type*} [AddCommGroup V]
    [Module (ZMod p) V] (ρ : Representation (ZMod p) G V)
    (hirr : ∀ W : Submodule (ZMod p) V, (∀ g, W.map (ρ g) ≤ W) → W = ⊥ ∨ W = ⊤) :
    Nat.card {f : M →+ V // ∀ (g : G) (x : M), f (g • x) = ρ g (f x)} =
      1 + equivariantSurjCard M ρ := sorry

/-- LOWW Proposition 7.1 (conditional): if the Cohen–Martinet moment conjecture holds for the
irreducible `V = Ind_{S_F}^G U` and `h₃(K/F) = 1 + |Sur_G(Cl, V)|` on the family, with
`∑_v dim V^{σ_v} = u`, then the average of `h₃(K/F)` tends to `1 + 3^{-u}`. -/
theorem tendsto_relativeThreeTorsion_of_cohenMartinet {ι G : Type*} [Group G]
    (E : ℕ → Finset ι) (C : ι → Type*) [∀ i, AddCommGroup (C i)] [∀ i, DistribMulAction G (C i)]
    {V : Type*} [AddCommGroup V] [Module (ZMod 3) V] [FiniteDimensional (ZMod 3) V]
    (ρ : Representation (ZMod 3) G V) (σ : List G) (u : ℕ) (h3 : ι → ℕ)
    (hconj : CohenMartinetMomentConjecture E C ρ σ)
    (hh3 : ∀ i, h3 i = 1 + equivariantSurjCard (C i) ρ)
    (hu : (σ.map fun g => Module.finrank (ZMod 3) (LinearMap.ker (ρ g - LinearMap.id))).sum = u)
    (hE : ∀ᶠ X in atTop, (E X).Nonempty) :
    Tendsto (fun X : ℕ => (∑ i ∈ E X, (h3 i : ℝ)) / ((E X).card : ℝ)) atTop
      (𝓝 (1 + ((3 : ℝ) ^ u)⁻¹)) := sorry

/-- LOWW §7.2: when `W'` is irreducible, the Cohen–Martinet prediction for the average of
`h₃(K/k)` is `(1 + 3^{-u(K/F)})(1 + 3^{-u(F/k)})`. -/
theorem cohenMartinet_prediction_threeTorsion_two_extension (uKF uFk : ℕ) :
    ((1 : ℚ) + (3 ^ uKF)⁻¹) * (1 + (3 ^ uFk)⁻¹) =
      1 + (3 ^ uKF)⁻¹ + (3 ^ uFk)⁻¹ + (3 ^ (uKF + uFk))⁻¹ := sorry

/-! ## Enhanced Cohen–Lenstra laws (Lipnowski–Tsimerman §5.7.2) -/

/-- The finite-`g` joint law `Haar_g(F : coker(1 - F^{n_j}) ≅ H_j for all j)`. -/
noncomputable def enhancedCokernelLaw (ℓ : ℕ) [Fact ℓ.Prime] (g k : ℕ) (n : Fin k → ℕ)
    (H : Fin k → FinAbPGroupClass) : ℝ≥0∞ :=
  padicMatrixHaar ℓ g g {F | ∀ j, Nonempty (padicCokernel ℓ
    (fun a b => ((1 : Matrix (Fin g) (Fin g) ℤ_[ℓ]) -
      (Matrix.of F) ^ n j) a b) ≃+ (H j).toGroup ℓ)}

/-- The existence of the `g → ∞` limits defining `CL_{n,ℓ}` (not proved in the source). -/
def EnhancedCohenLenstraLimitExists (ℓ : ℕ) [Fact ℓ.Prime] (k : ℕ) (n : Fin k → ℕ) : Prop :=
  ∀ H : Fin k → FinAbPGroupClass, ∃ L : ℝ≥0∞,
    Tendsto (fun g => enhancedCokernelLaw ℓ g k n H) atTop (𝓝 L)

/-- `CL_{n,ℓ}(H)`: the limit of the finite-`g` laws (meaningful under
`EnhancedCohenLenstraLimitExists`). -/
noncomputable def enhancedCohenLenstra (ℓ : ℕ) [Fact ℓ.Prime] (k : ℕ) (n : Fin k → ℕ)
    (H : Fin k → FinAbPGroupClass) : ℝ≥0∞ :=
  limUnder atTop (fun g => enhancedCokernelLaw ℓ g k n H)

theorem enhancedCokernelLaw_one (ℓ : ℕ) [Fact ℓ.Prime] (g : ℕ) (A : FinAbPGroupClass) :
    enhancedCokernelLaw ℓ g 1 (fun _ => 1) (fun _ => A) =
      padicMatrixHaar ℓ g g {F | Nonempty (padicCokernel ℓ
        (fun a b => ((1 : Matrix (Fin g) (Fin g) ℤ_[ℓ]) - (Matrix.of F)) a b)
          ≃+ A.toGroup ℓ)} := sorry

theorem enhancedCohenLenstra_one (ℓ : ℕ) [Fact ℓ.Prime] (A : FinAbPGroupClass) :
    enhancedCohenLenstra ℓ 1 (fun _ => 1) (fun _ => A) = cohenLenstraMeasure ℓ 0 A := sorry

theorem tsum_enhancedCokernelLaw (ℓ : ℕ) [Fact ℓ.Prime] (g k : ℕ) (n : Fin k → ℕ)
    (hn : ∀ j, 0 < n j) : ∑' H, enhancedCokernelLaw ℓ g k n H = 1 := sorry

theorem enhancedCokernelLaw_zero_zero (ℓ : ℕ) [Fact ℓ.Prime] (g : ℕ) :
    enhancedCokernelLaw ℓ g 2 ![1, 2] (fun _ => FinAbPGroupClass.trivial) =
      (Nat.card {F : Matrix (Fin g) (Fin g) (ZMod ℓ) // IsUnit (1 - F ^ 2)} : ℝ≥0∞) /
        (ℓ : ℝ≥0∞) ^ (g * g) := sorry

/-- Unit test `ArithmeticStatistics.enhancedCokernelLaw.test_size_zero`:
for `g = 0` every cokernel is trivial. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    enhancedCokernelLaw ℓ 0 2 ![1, 2] (fun _ => FinAbPGroupClass.trivial) = 1 := sorry

/-- Unit test `ArithmeticStatistics.enhancedCokernelLaw.test_dependent_components`:
the components are dependent: `coker(1 - F) ≠ 0` forces `coker(1 - F²) ≠ 0`, so the joint mass
of `(ℤ/ℓ, 0)` vanishes. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (g : ℕ) :
    enhancedCokernelLaw ℓ g 2 ![1, 2]
      ![⟨1, Nat.Partition.indiscrete 1⟩, FinAbPGroupClass.trivial] = 0 := sorry

/-- Unit test `ArithmeticStatistics.enhancedCokernelLaw.test_single_exponent`:
for the single exponent `n = (1)` the law is the Friedman–Washington cokernel law of `1 - F`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (A : FinAbPGroupClass) :
    Tendsto (fun g => enhancedCokernelLaw ℓ g 1 (fun _ => 1) (fun _ => A)) atTop
      (𝓝 (cohenLenstraMeasure ℓ 0 A)) := sorry

/-- Lipnowski–Tsimerman Example 5.17, `ℓ = 2`: `P(1 - F² invertible) = ∏_{j=1}^g (1 - 2^{-j})`. -/
theorem card_isUnit_one_sub_sq_two (g : ℕ) :
    (Nat.card {F : Matrix (Fin g) (Fin g) (ZMod 2) // IsUnit (1 - F ^ 2)} : ℝ) / 2 ^ (g * g) =
      ∏ j ∈ Finset.Icc 1 g, (1 - ((2 : ℝ) ^ j)⁻¹) := sorry

/-- Lipnowski–Tsimerman Example 5.17, `ℓ` odd: a uniform lower bound. -/
theorem card_isUnit_one_sub_sq_ge (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (g : ℕ) :
    2 * cohenLenstraConstant 3 0 - 1 ≤
      (Nat.card {F : Matrix (Fin g) (Fin g) (ZMod ℓ) // IsUnit (1 - F ^ 2)} : ℝ) / (ℓ : ℝ) ^ (g * g) :=
  sorry

/-- **Enhanced Cohen–Lenstra conjecture** (Lipnowski–Tsimerman Conjecture 5.18), for one family:
`P g` is the sampling law of the `g`-dimensional members, `pt g ω m ℓ` the class of the
`ℓ`-primary part of `A_ω(F_{p^m})`. If `CL_S` models `A(F_p)_S`, then `CL_{n,S}` models the joint
law of `(A(F_{p^{n_j}})_S)_j`. -/
def EnhancedCohenLenstraConjecture (S : Finset ℕ) (hS : ∀ ℓ ∈ S, ℓ.Prime) (Ω : ℕ → Type*)
    (P : ∀ g, PMF (Ω g)) (pt : ∀ g, Ω g → ℕ → S → FinAbPGroupClass) (k : ℕ) (n : Fin k → ℕ) :
    Prop :=
  (∀ H : S → FinAbPGroupClass, Tendsto (fun g => (P g).toOuterMeasure {ω | pt g ω 1 = H}) atTop
      (𝓝 (cohenLenstraMeasureProd S hS 0 H))) →
    ∀ H : Fin k → S → FinAbPGroupClass,
      Tendsto (fun g => (P g).toOuterMeasure {ω | ∀ j, pt g ω (n j) = H j}) atTop
        (𝓝 (∏ ℓ : S, (haveI : Fact (ℓ : ℕ).Prime := ⟨hS ℓ ℓ.2⟩;
          enhancedCohenLenstra ℓ k n (fun j => H j ℓ))))

theorem EnhancedCohenLenstraConjecture.apply {S : Finset ℕ} {hS : ∀ ℓ ∈ S, ℓ.Prime}
    {Ω : ℕ → Type*} {P : ∀ g, PMF (Ω g)} {pt : ∀ g, Ω g → ℕ → S → FinAbPGroupClass} {k : ℕ}
    {n : Fin k → ℕ} (h : EnhancedCohenLenstraConjecture S hS Ω P pt k n)
    (hCL : ∀ H : S → FinAbPGroupClass, Tendsto (fun g => (P g).toOuterMeasure {ω | pt g ω 1 = H})
      atTop (𝓝 (cohenLenstraMeasureProd S hS 0 H))) (H : Fin k → S → FinAbPGroupClass) :
    Tendsto (fun g => (P g).toOuterMeasure {ω | ∀ j, pt g ω (n j) = H j}) atTop
      (𝓝 (∏ ℓ : S, (haveI : Fact (ℓ : ℕ).Prime := ⟨hS ℓ ℓ.2⟩;
        enhancedCohenLenstra ℓ k n (fun j => H j ℓ)))) := h hCL H

theorem enhancedCohenLenstraConjecture_single (S : Finset ℕ) (hS : ∀ ℓ ∈ S, ℓ.Prime)
    (Ω : ℕ → Type*) (P : ∀ g, PMF (Ω g)) (pt : ∀ g, Ω g → ℕ → S → FinAbPGroupClass) :
    EnhancedCohenLenstraConjecture S hS Ω P pt 1 (fun _ => 1) := sorry

/-- Unit test `ArithmeticStatistics.EnhancedCohenLenstraConjecture.test_single_exponent`:
for `n = (1)` the conjecture holds for every family. -/
example (Ω : ℕ → Type) (P : ∀ g, PMF (Ω g)) (pt : ∀ g, Ω g → ℕ → ({3} : Finset ℕ) → FinAbPGroupClass) :
    EnhancedCohenLenstraConjecture {3}
      (fun ℓ h => by rw [Finset.mem_singleton] at h; subst h; exact Nat.prime_three)
      Ω P pt 1 (fun _ => 1) := sorry

/-- Unit test `ArithmeticStatistics.EnhancedCohenLenstraConjecture.test_zero_mass`:
for `n = (1, 2)` and `ℓ = 2`, the finite-`g` mass of `(0, 0)` is `∏_{j ≤ g} (1 - 2^{-j})`, so the
conjectured limit is `c_{2,0}`. -/
example (g : ℕ) :
    haveI : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
    enhancedCokernelLaw 2 g 2 ![1, 2] (fun _ => FinAbPGroupClass.trivial) =
      ENNReal.ofReal (∏ j ∈ Finset.Icc 1 g, (1 - ((2 : ℝ) ^ j)⁻¹)) := sorry

/-- Unit test `ArithmeticStatistics.EnhancedCohenLenstraConjecture.test_needs_hypothesis`:
a family for which `CL_S` does not model `A(F_p)_S` satisfies the conjecture vacuously. -/
example (S : Finset ℕ) (hS : ∀ ℓ ∈ S, ℓ.Prime) (Ω : ℕ → Type*) (P : ∀ g, PMF (Ω g))
    (pt : ∀ g, Ω g → ℕ → S → FinAbPGroupClass) (k : ℕ) (n : Fin k → ℕ)
    (hbad : ¬ ∀ H : S → FinAbPGroupClass, Tendsto (fun g => (P g).toOuterMeasure {ω | pt g ω 1 = H})
      atTop (𝓝 (cohenLenstraMeasureProd S hS 0 H))) :
    EnhancedCohenLenstraConjecture S hS Ω P pt k n := sorry

end ArithmeticStatistics


/-!
## Part S: Selmer statistics — models, proved averages, Smith and BKLOS inputs

Selmer groups, coranks, isogenies and quadratic twists are not in the pinned Mathlib (they are
Tau Ceti EllipticCurves Layers 5–7 and SelmerIwasawaCohomology L2 material). Statements about them are
prototyped here for an arbitrary function standing for the arithmetic invariant (for example a function
`c : ℤ → ℕ` standing for `d ↦ corank Sel_{p^∞}(E^d/ℚ)`); the arithmetic instantiation is specified in the
roadmap document. Conditions that cannot be stated at all are omitted.
-/

namespace ArithmeticStatistics

open scoped ENNReal BigOperators
open Filter Topology Polynomial Matrix

attribute [local instance] Classical.propDecidable

/-! ## Height moments in an arithmetic family -/

section Moments

variable {α : Type*}

/-- Upper `m`-th height moment of `f` for a family whose members of height `< X` form `S X`. -/
noncomputable def familyUpperMoment (S : ℝ → Finset α) (f : α → ℝ≥0∞) (m : ℕ) : ℝ≥0∞ :=
  limsup (fun X : ℝ => (∑ x ∈ S X, f x ^ m) / ((S X).card : ℝ≥0∞)) atTop

/-- Lower `m`-th height moment. -/
noncomputable def familyLowerMoment (S : ℝ → Finset α) (f : α → ℝ≥0∞) (m : ℕ) : ℝ≥0∞ :=
  liminf (fun X : ℝ => (∑ x ∈ S X, f x ^ m) / ((S X).card : ℝ≥0∞)) atTop

/-- Upper density of a subset: the first upper moment of its indicator (the analogue, for a
family given by its finite sets `S X` of members of height `< X`, of ST.0's
`ArithmeticFamily.upperDensity`). -/
noncomputable def familyUpperDensity (S : ℝ → Finset α) (A : Set α) [DecidablePred (· ∈ A)] : ℝ≥0∞ :=
  familyUpperMoment S (fun x => if x ∈ A then 1 else 0) 1

/-- Lower density of a subset: the first lower moment of its indicator (the analogue of ST.0's
`ArithmeticFamily.lowerDensity`). -/
noncomputable def familyLowerDensity (S : ℝ → Finset α) (A : Set α) [DecidablePred (· ∈ A)] : ℝ≥0∞ :=
  familyLowerMoment S (fun x => if x ∈ A then 1 else 0) 1

theorem familyLowerMoment_le_familyUpperMoment (S : ℝ → Finset α) (f : α → ℝ≥0∞) (m : ℕ) :
    familyLowerMoment S f m ≤ familyUpperMoment S f m := sorry

theorem familyUpperMoment_mono (S : ℝ → Finset α) {f g : α → ℝ≥0∞} (h : f ≤ g) (m : ℕ) :
    familyUpperMoment S f m ≤ familyUpperMoment S g m ∧
      familyLowerMoment S f m ≤ familyLowerMoment S g m := sorry

theorem familyUpperMoment_add_le (S : ℝ → Finset α) (f g : α → ℝ≥0∞) :
    familyUpperMoment S (f + g) 1 ≤ familyUpperMoment S f 1 + familyUpperMoment S g 1 := sorry

theorem familyLowerDensity_compl (S : ℝ → Finset α) (hS : Tendsto (fun X => (S X).card) atTop atTop)
    (A : Set α) [DecidablePred (· ∈ A)] [DecidablePred (· ∈ Aᶜ)] :
    familyLowerDensity S Aᶜ = 1 - familyUpperDensity S A := sorry

theorem familyUpperDensity_le_upperMoment_div (S : ℝ → Finset α) (f : α → ℝ≥0∞) {t : ℝ≥0∞}
    (ht : 0 < t) (ht' : t ≠ ∞) [DecidablePred (· ∈ {x | t ≤ f x})] :
    familyUpperDensity S {x | t ≤ f x} ≤ familyUpperMoment S f 1 / t := sorry

theorem familyUpperMoment_const (S : ℝ → Finset α) (hS : ∀ᶠ X in atTop, (S X).Nonempty)
    (c : ℝ≥0∞) (hc : c ≠ ∞) (m : ℕ) :
    familyUpperMoment S (fun _ => c) m = c ^ m ∧ familyLowerMoment S (fun _ => c) m = c ^ m := sorry

/-- For finite nonnegative real `f`, the first upper moment is the upper family average (ST.4). -/
theorem familyUpperMoment_one_eq_upperFamilyAverage (S : ℝ → Finset α) (f : α → ℝ) (hf : ∀ x, 0 ≤ f x) :
    familyUpperMoment S (fun x => ENNReal.ofReal (f x)) 1 =
      limsup (fun X : ℝ => ENNReal.ofReal ((∑ x ∈ S X, f x) / (S X).card)) atTop := sorry

/-- The positive integers of height `< X` in ST.0's family `SquarefreeFamily.natFamily` of the
natural numbers ordered by `n ↦ n`. -/
noncomputable def positiveIntegersBelow (X : ℝ) : Finset ℕ :=
  (SquarefreeFamily.natFamily.heightLE X).filter (fun n => 0 < n ∧ (n : ℝ) < X)

/-- Unit test `ArithmeticStatistics.familyUpperDensity.test_even_integers`: the even integers have
density `1/2`. -/
example : familyUpperDensity positiveIntegersBelow {n | Even n} = 1 / 2 ∧
    familyLowerDensity positiveIntegersBelow {n | Even n} = 1 / 2 := sorry

/-- Unit test `ArithmeticStatistics.familyUpperDensity.test_finite_set`: a finite set has upper
density zero when the family grows. -/
example (S : ℝ → Finset α) (hS : Tendsto (fun X => (S X).card) atTop atTop) (A : Set α)
    [DecidablePred (· ∈ A)] (hA : A.Finite) : familyUpperDensity S A = 0 := sorry

/-- Unit test `ArithmeticStatistics.familyUpperMoment.test_not_additive`: upper density is not additive. -/
example : ∃ A : Set ℕ, ∃ _ : DecidablePred (· ∈ A), ∃ _ : DecidablePred (· ∈ Aᶜ),
    1 < familyUpperDensity positiveIntegersBelow A + familyUpperDensity positiveIntegersBelow Aᶜ := sorry

/-- Unit test `ArithmeticStatistics.familyUpperMoment.test_indicator_square`: moments of an indicator
equal its upper density. -/
example (S : ℝ → Finset α) (A : Set α) [DecidablePred (· ∈ A)] (m : ℕ) (hm : 1 ≤ m) :
    familyUpperMoment S (fun x => if x ∈ A then 1 else 0) m = familyUpperDensity S A := sorry

end Moments

/-! ## Gaussian binomial coefficients and Cauchy's q-binomial theorem -/

section Gauss

variable {R : Type*} [CommRing R]

/-- The Gaussian binomial coefficient `[n k]_t`, by the `q`-Pascal recursion. -/
def gaussBinom (t : R) : ℕ → ℕ → R
  | _, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, k + 1 => gaussBinom t n k + t ^ (k + 1) * gaussBinom t n (k + 1)

@[simp] theorem gaussBinom_zero_right (t : R) (n : ℕ) : gaussBinom t n 0 = 1 := sorry

@[simp] theorem gaussBinom_self (t : R) (n : ℕ) : gaussBinom t n n = 1 := sorry

theorem gaussBinom_succ_succ (t : R) (n k : ℕ) :
    gaussBinom t (n + 1) (k + 1) = gaussBinom t n k + t ^ (k + 1) * gaussBinom t n (k + 1) := sorry

theorem gaussBinom_eq_prod {K : Type*} [Field K] (t : K) (n k : ℕ) (hk : k ≤ n)
    (ht : ∀ i ∈ Finset.Icc 1 n, t ^ i ≠ 1) :
    gaussBinom t n k = ∏ i ∈ Finset.Icc 1 k, (1 - t ^ (n - k + i)) / (1 - t ^ i) := sorry

theorem gaussBinom_symm (t : R) (n k : ℕ) (hk : k ≤ n) : gaussBinom t n k = gaussBinom t n (n - k) :=
  sorry

theorem gaussBinom_one (n k : ℕ) : gaussBinom (1 : R) n k = (Nat.choose n k : R) := sorry

theorem card_submodules_finrank_eq_gaussBinom (K : Type*) [Field K] [Fintype K] (n k : ℕ) :
    (Nat.card {W : Submodule K (Fin n → K) // Module.finrank K W = k} : ℚ) =
      gaussBinom (Fintype.card K : ℚ) n k := sorry

/-- Unit test `ArithmeticStatistics.gaussBinom.test_four_two`: `[4 2]_2 = 35`. -/
example : gaussBinom (2 : ℤ) 4 2 = 35 := sorry

/-- Unit test `ArithmeticStatistics.gaussBinom.test_zero_rows`: degenerate rows. -/
example (t : ℤ) (n k : ℕ) : gaussBinom t n 0 = 1 ∧ gaussBinom t 0 (k + 1) = 0 := sorry

/-- Unit test `ArithmeticStatistics.gaussBinom.test_classical`: `[5 2]_1 = 10`. -/
example : gaussBinom (1 : ℤ) 5 2 = 10 := sorry

/-- Unit test `ArithmeticStatistics.gaussBinom.test_not_binomial`: `[3 1]_2 = 7 ≠ 3`. -/
example : gaussBinom (2 : ℤ) 3 1 = 7 ∧ gaussBinom (2 : ℤ) 3 1 ≠ (Nat.choose 3 1 : ℤ) := sorry

/-- Cauchy's q-binomial theorem. -/
theorem cauchy_qBinomial (t : R) (n : ℕ) :
    ∏ i ∈ Finset.range n, (1 + C (t ^ i) * X) =
      ∑ k ∈ Finset.range (n + 1), C (t ^ (k * (k - 1) / 2) * gaussBinom t n k) * X ^ k := sorry

end Gauss

/-! ## Maximal isotropic subspaces (Poonen–Rains §2) -/

section Isotropic

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- `W` is maximal isotropic: `Q` vanishes on `W` and `W` is its own polar orthogonal. -/
def IsMaxIsotropic (Q : QuadraticForm K V) (W : Submodule K V) : Prop :=
  (∀ w ∈ W, Q w = 0) ∧ LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) W = W

/-- The set `I_V` of maximal isotropic subspaces. -/
def maxIsotropicSubspaces (Q : QuadraticForm K V) : Set (Submodule K V) :=
  {W | IsMaxIsotropic Q W}

/-- Weakly metabolic: nondegenerate polar form and a maximal isotropic subspace exists. -/
def IsWeaklyMetabolic (Q : QuadraticForm K V) : Prop :=
  LinearMap.BilinForm.Nondegenerate (QuadraticMap.polarBilin Q) ∧ (maxIsotropicSubspaces Q).Nonempty

theorem IsMaxIsotropic.finrank_eq [FiniteDimensional K V] {Q : QuadraticForm K V} {W : Submodule K V}
    (hQ : LinearMap.BilinForm.Nondegenerate (QuadraticMap.polarBilin Q)) (hW : IsMaxIsotropic Q W) (n : ℕ)
    (hV : Module.finrank K V = 2 * n) : Module.finrank K W = n := sorry

theorem isMaxIsotropic_iff_finrank [FiniteDimensional K V] {Q : QuadraticForm K V}
    (hQ : LinearMap.BilinForm.Nondegenerate (QuadraticMap.polarBilin Q)) (n : ℕ) (hV : Module.finrank K V = 2 * n)
    (W : Submodule K V) : IsMaxIsotropic Q W ↔ (∀ w ∈ W, Q w = 0) ∧ Module.finrank K W = n := sorry

theorem IsMaxIsotropic.map_isometryEquiv {V' : Type*} [AddCommGroup V'] [Module K V']
    {Q : QuadraticForm K V} {Q' : QuadraticForm K V'} (e : Q.IsometryEquiv Q') {W : Submodule K V}
    (hW : IsMaxIsotropic Q W) : IsMaxIsotropic Q' (W.map e.toLinearEquiv.toLinearMap) := sorry

/-- The hyperbolic plane `(x, y) ↦ x * y` on `K × K`. -/
noncomputable def hyperbolicPlane (K : Type*) [Field K] : QuadraticForm K (K × K) :=
  QuadraticMap.linMulLin (LinearMap.fst K K K) (LinearMap.snd K K K)

theorem maxIsotropicSubspaces_hyperbolicPlane (K : Type*) [Field K] :
    maxIsotropicSubspaces (hyperbolicPlane K) =
      {LinearMap.ker (LinearMap.snd K K K), LinearMap.ker (LinearMap.fst K K K)} := sorry

/-- Unit test `ArithmeticStatistics.maxIsotropicSubspaces.test_hyperbolic_plane`: two maximal
isotropic lines. -/
example (p : ℕ) [Fact p.Prime] : Nat.card (maxIsotropicSubspaces (hyperbolicPlane (ZMod p))) = 2 := sorry

/-- Unit test `ArithmeticStatistics.IsMaxIsotropic.test_char_two`: over `𝔽_2`, the diagonal line
of the hyperbolic plane is its own orthogonal but is not isotropic. -/
example : LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin (hyperbolicPlane (ZMod 2)))
      (Submodule.span (ZMod 2) {((1 : ZMod 2), (1 : ZMod 2))}) =
      Submodule.span (ZMod 2) {((1 : ZMod 2), (1 : ZMod 2))} ∧
    ¬ IsMaxIsotropic (hyperbolicPlane (ZMod 2)) (Submodule.span (ZMod 2) {((1 : ZMod 2), (1 : ZMod 2))}) :=
  sorry

/-- Unit test `ArithmeticStatistics.IsWeaklyMetabolic.test_anisotropic_plane`: `x² + xy + y²` over `𝔽_2`
is not weakly metabolic. -/
example (Q : QuadraticForm (ZMod 2) (ZMod 2 × ZMod 2))
    (hQ : ∀ v : ZMod 2 × ZMod 2, Q v = v.1 * v.1 + v.1 * v.2 + v.2 * v.2) :
    ¬ IsWeaklyMetabolic Q := sorry

/-- Unit test `ArithmeticStatistics.maxIsotropicSubspaces.test_zero_space`: on the zero space the only
maximal isotropic subspace is `⊥`. -/
example (Q : QuadraticForm K PUnit) : maxIsotropicSubspaces Q = {⊥} := sorry

/-- The quadratic form induced on `X^⊥ / X` by an isotropic subspace `X`. -/
noncomputable def isotropicQuotientForm (Q : QuadraticForm K V) (X : Submodule K V)
    (_hX : ∀ x ∈ X, Q x = 0) :
    QuadraticForm K ((LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X) ⧸
      X.comap (LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X).subtype) := sorry

theorem isotropicQuotientForm_nondegenerate [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : LinearMap.BilinForm.Nondegenerate (QuadraticMap.polarBilin Q)) (X : Submodule K V) (hX : ∀ x ∈ X, Q x = 0) :
    LinearMap.BilinForm.Nondegenerate (QuadraticMap.polarBilin (isotropicQuotientForm Q X hX)) := sorry

theorem finrank_isotropicQuotient [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : LinearMap.BilinForm.Nondegenerate (QuadraticMap.polarBilin Q)) (X : Submodule K V) (hX : ∀ x ∈ X, Q x = 0) :
    Module.finrank K ((LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X) ⧸
      X.comap (LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X).subtype) =
      Module.finrank K V - 2 * Module.finrank K X := sorry

/-- The isotropic reduction `W ↦ ((W ∩ X^⊥) + X)/X`. -/
def isotropicReduction (Q : QuadraticForm K V) (X : Submodule K V) (W : Submodule K V) :
    Submodule K ((LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X) ⧸
      X.comap (LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X).subtype) :=
  (W.comap (LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X).subtype).map (Submodule.mkQ _)

theorem isotropicReduction_of_le (Q : QuadraticForm K V) {X W : Submodule K V} (hXW : X ≤ W)
    (hW : IsMaxIsotropic Q W) :
    (isotropicReduction Q X W).comap (Submodule.mkQ _) =
      W.comap (LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X).subtype := sorry

theorem isotropicReduction_bot (Q : QuadraticForm K V) (W : Submodule K V) :
    (isotropicReduction Q ⊥ W).comap (Submodule.mkQ _) =
      W.comap (LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) ⊥).subtype := sorry

theorem isotropicReduction_comp [FiniteDimensional K V] (Q : QuadraticForm K V)
    (hQ : LinearMap.BilinForm.Nondegenerate (QuadraticMap.polarBilin Q)) {X Y : Submodule K V} (hXY : X ≤ Y)
    (hY : ∀ y ∈ Y, Q y = 0) (W : Submodule K V) (hW : IsMaxIsotropic Q W) :
    Module.finrank K (isotropicReduction Q Y W) =
      Module.finrank K (isotropicReduction Q X W) - (Module.finrank K Y - Module.finrank K X) := sorry

/-- Unit test `ArithmeticStatistics.isotropicReduction.test_bot`: reducing along `⊥` does not change
dimensions. -/
example [FiniteDimensional K V] (Q : QuadraticForm K V) (W : Submodule K V) :
    Module.finrank K (isotropicReduction Q ⊥ W) = Module.finrank K W := sorry

/-- Unit test `ArithmeticStatistics.isotropicReduction.test_hyperbolic_plane`: `X^⊥/X = 0` for a
maximal isotropic line `X` of the hyperbolic plane. -/
example (K : Type*) [Field K] :
    Module.finrank K ((LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin (hyperbolicPlane K))
      (LinearMap.ker (LinearMap.snd K K K))) ⧸ (LinearMap.ker (LinearMap.snd K K K)).comap
        (LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin (hyperbolicPlane K))
          (LinearMap.ker (LinearMap.snd K K K))).subtype) = 0 := sorry

/-- Unit test `ArithmeticStatistics.isotropicReduction.test_dimension`: `dim X^⊥/X = 2n − 2k`. -/
example [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : LinearMap.BilinForm.Nondegenerate (QuadraticMap.polarBilin Q))
    (n : ℕ) (hV : Module.finrank K V = 2 * n) (X : Submodule K V) (hX : ∀ x ∈ X, Q x = 0) :
    Module.finrank K ((LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X) ⧸
      X.comap (LinearMap.BilinForm.orthogonal (QuadraticMap.polarBilin Q) X).subtype) = 2 * n - 2 * Module.finrank K X :=
  sorry

/-- Unit test `ArithmeticStatistics.isotropicQuotientForm.test_needs_isotropic`: the diagonal line
of the hyperbolic plane is not isotropic when `2 ≠ 0`. -/
example (K : Type*) [Field K] (h2 : (2 : K) ≠ 0) :
    ¬ ∀ x ∈ Submodule.span K {((1 : K), (1 : K))}, hyperbolicPlane K x = 0 := sorry

/-- PR Proposition 2.6(a): every fibre of the isotropic reduction has `∏ (p^{n-i} + 1)` elements. -/
theorem card_fiber_isotropicReduction (p : ℕ) [Fact p.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod p) V] [FiniteDimensional (ZMod p) V] (Q : QuadraticForm (ZMod p) V)
    (hQ : IsWeaklyMetabolic Q) (n : ℕ) (hV : Module.finrank (ZMod p) V = 2 * n)
    (X : Submodule (ZMod p) V) (hX : ∀ x ∈ X, Q x = 0) (W₀ : Submodule (ZMod p) V)
    (hW₀ : IsMaxIsotropic Q W₀) :
    Nat.card {W : Submodule (ZMod p) V // IsMaxIsotropic Q W ∧
        isotropicReduction Q X W = isotropicReduction Q X W₀} =
      ∏ i ∈ Finset.Icc 1 (Module.finrank (ZMod p) X), (p ^ (n - i) + 1) := sorry

/-- PR Proposition 2.6(b): `#I_V = ∏_{j<n} (p^j + 1)`. -/
theorem card_maxIsotropicSubspaces (p : ℕ) [Fact p.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod p) V] [FiniteDimensional (ZMod p) V] (Q : QuadraticForm (ZMod p) V)
    (hQ : IsWeaklyMetabolic Q) (n : ℕ) (hV : Module.finrank (ZMod p) V = 2 * n) :
    Nat.card (maxIsotropicSubspaces Q) = ∏ j ∈ Finset.range n, (p ^ j + 1) := sorry

/-- PR Proposition 2.6(c),(d): the counting generating polynomial of `dim (Z ∩ W)`. -/
theorem finsum_intersection_generating (p : ℕ) [Fact p.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod p) V] [FiniteDimensional (ZMod p) V] (Q : QuadraticForm (ZMod p) V)
    (hQ : IsWeaklyMetabolic Q) (n : ℕ) (hV : Module.finrank (ZMod p) V = 2 * n)
    (W : Submodule (ZMod p) V) (hW : IsMaxIsotropic Q W) :
    ∑ᶠ Z ∈ maxIsotropicSubspaces Q, (X : ℚ[X]) ^ Module.finrank (ZMod p) ↥(Z ⊓ W) =
      ∏ i ∈ Finset.range n, (X + C ((p : ℚ) ^ i)) := sorry

end Isotropic

/-! ## The Poonen–Rains distribution and Delaunay's law -/

section PoonenRains

/-- `c_p = ∏_{j ≥ 0} (1 + p^{-j})^{-1}`. -/
noncomputable def poonenRainsConstant (p : ℕ) : ℝ :=
  ∏' j : ℕ, (1 + ((p : ℝ) ^ j)⁻¹)⁻¹

/-- `a_d = c_p ∏_{j=1}^{d} p/(p^j − 1)`. -/
noncomputable def poonenRainsWeight (p d : ℕ) : ℝ :=
  poonenRainsConstant p * ∏ j ∈ Finset.Icc 1 d, (p : ℝ) / ((p : ℝ) ^ j - 1)

/-- PR Proposition 2.6(e): closed form of the finite intersection law `a_{d,n}`. -/
theorem intersectionLaw_closed_form (p : ℕ) [Fact p.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod p) V] [FiniteDimensional (ZMod p) V] (Q : QuadraticForm (ZMod p) V)
    (hQ : IsWeaklyMetabolic Q) (n : ℕ) (hV : Module.finrank (ZMod p) V = 2 * n)
    (W : Submodule (ZMod p) V) (hW : IsMaxIsotropic Q W) (d : ℕ) (hd : d ≤ n) :
    (Nat.card {Z : Submodule (ZMod p) V // IsMaxIsotropic Q Z ∧
        Module.finrank (ZMod p) ↥(Z ⊓ W) = d} : ℝ) / Nat.card (maxIsotropicSubspaces Q) =
      (∏ j ∈ Finset.range n, (1 + ((p : ℝ) ^ j)⁻¹)⁻¹) *
        (∏ j ∈ Finset.Icc 1 d, (p : ℝ) / ((p : ℝ) ^ j - 1)) *
        ∏ j ∈ Finset.range d, (1 - (p : ℝ) ^ j / (p : ℝ) ^ n) := sorry

/-- The Poonen–Rains weights sum to one. -/
theorem hasSum_poonenRainsWeight (p : ℕ) [Fact p.Prime] :
    HasSum (fun d => ENNReal.ofReal (poonenRainsWeight p d)) 1 := sorry

/-- The Poonen–Rains distribution `X_{Sel_p}`. -/
noncomputable def poonenRainsDistribution (p : ℕ) [Fact p.Prime] : PMF ℕ :=
  ⟨fun d => ENNReal.ofReal (poonenRainsWeight p d), hasSum_poonenRainsWeight p⟩

theorem poonenRainsConstant_eq_half_prod (p : ℕ) [Fact p.Prime] :
    poonenRainsConstant p = (1 / 2) * ∏' i : ℕ, (1 - ((p : ℝ) ^ (2 * i + 1))⁻¹) := sorry

theorem poonenRainsWeight_succ (p d : ℕ) :
    poonenRainsWeight p (d + 1) = poonenRainsWeight p d * ((p : ℝ) / ((p : ℝ) ^ (d + 1) - 1)) := sorry

theorem poonenRainsWeight_pos (p : ℕ) [Fact p.Prime] (d : ℕ) : 0 < poonenRainsWeight p d := sorry

@[simp] theorem poonenRainsDistribution_apply (p : ℕ) [Fact p.Prime] (d : ℕ) :
    poonenRainsDistribution p d = ENNReal.ofReal (poonenRainsWeight p d) := sorry

theorem poonenRainsDistribution_even (p : ℕ) [Fact p.Prime] :
    HasSum (fun d => if Even d then ENNReal.ofReal (poonenRainsWeight p d) else 0) (1 / 2) := sorry

/-- PR Proposition 2.6(f): the finite laws converge to the Poonen–Rains weights. -/
theorem tendsto_intersectionLaw (p : ℕ) [Fact p.Prime] (d : ℕ) :
    Tendsto (fun n : ℕ => (∏ j ∈ Finset.range n, (1 + ((p : ℝ) ^ j)⁻¹)⁻¹) *
        (∏ j ∈ Finset.Icc 1 d, (p : ℝ) / ((p : ℝ) ^ j - 1)) *
        ∏ j ∈ Finset.range d, (1 - (p : ℝ) ^ j / (p : ℝ) ^ n)) atTop (𝓝 (poonenRainsWeight p d)) :=
  sorry

/-- PR Proposition 2.22(a): `E[p^{m X}] = ∏_{i=1}^m (p^i + 1)`. -/
theorem poonenRains_moment (p : ℕ) [Fact p.Prime] (m : ℕ) :
    HasSum (fun d => poonenRainsWeight p d * ((p : ℝ) ^ d) ^ m)
      (∏ i ∈ Finset.Icc 1 m, ((p : ℝ) ^ i + 1)) := sorry

/-- PR Proposition 2.22(b),(c): parity is equidistributed and moments are parity-independent. -/
theorem poonenRains_parity (p : ℕ) [Fact p.Prime] (m : ℕ) :
    HasSum (fun d => (-1 : ℝ) ^ d * poonenRainsWeight p d * ((p : ℝ) ^ d) ^ m) 0 := sorry

/-- Unit test `ArithmeticStatistics.poonenRainsWeight.test_zero`: `a_0 = c_p`. -/
example (p : ℕ) : poonenRainsWeight p 0 = poonenRainsConstant p := sorry

/-- Unit test `ArithmeticStatistics.poonenRainsWeight.test_ratio`: `a_1 = 2 a_0` at `p = 2`. -/
example : poonenRainsWeight 2 1 = 2 * poonenRainsWeight 2 0 := sorry

/-- Unit test `ArithmeticStatistics.poonenRainsDistribution.test_not_cohen_lenstra`: `a_0` at `p = 2`
differs from the Cohen–Lenstra probability of trivial 2-rank. -/
example : poonenRainsWeight 2 0 ≠ ∏' i : ℕ, (1 - ((2 : ℝ) ^ (i + 1))⁻¹) := sorry

/-- Unit test `ArithmeticStatistics.poonenRainsWeight.test_positive`: every weight is positive. -/
example (d : ℕ) : 0 < poonenRainsWeight 2 d := sorry

/-- Delaunay's law: `Prob(X_{Ш[p],r} = 2n)`. -/
noncomputable def delaunayWeight (p r n : ℕ) : ℝ :=
  ((p : ℝ) ^ (n * (2 * r + 2 * n - 1)))⁻¹ *
    (∏' i : ℕ, (1 - ((p : ℝ) ^ (2 * r + 2 * (i + n + 1) - 1))⁻¹)) /
    ∏ i ∈ Finset.Icc 1 n, (1 - ((p : ℝ) ^ (2 * i))⁻¹)

theorem delaunayWeight_zero (p r : ℕ) :
    delaunayWeight p r 0 = ∏' i : ℕ, (1 - ((p : ℝ) ^ (2 * r + 2 * (i + 1) - 1))⁻¹) := sorry

theorem delaunayWeight_pos (p : ℕ) [Fact p.Prime] (r n : ℕ) : 0 < delaunayWeight p r n := sorry

theorem hasSum_delaunayWeight (p : ℕ) [Fact p.Prime] (r : ℕ) : HasSum (delaunayWeight p r) 1 := sorry

/-- PR Theorem 5.2 identities: `a_{2n} = Δ_{0,n}/2` and `a_{2n+1} = Δ_{1,n}/2`. -/
theorem poonenRainsWeight_eq_half_delaunay (p : ℕ) [Fact p.Prime] (n : ℕ) :
    poonenRainsWeight p (2 * n) = delaunayWeight p 0 n / 2 ∧
      poonenRainsWeight p (2 * n + 1) = delaunayWeight p 1 n / 2 := sorry

/-- PR Theorem 5.2: uniqueness of the rank law compatible with the Selmer and Ш models. -/
theorem delaunay_compatible_rank_law_unique (p : ℕ) [Fact p.Prime] (ρ : ℕ → ℝ)
    (hρ : ∀ r, 0 ≤ ρ r) (hρs : HasSum ρ 1)
    (h : ∀ s : ℕ, HasSum (fun r => if r ≤ s ∧ Even (s - r) then ρ r * delaunayWeight p r ((s - r) / 2)
      else 0) (poonenRainsWeight p s)) :
    ρ 0 = 1 / 2 ∧ ρ 1 = 1 / 2 ∧ ∀ r, 2 ≤ r → ρ r = 0 := sorry

/-- Unit test `ArithmeticStatistics.delaunayWeight.test_rank_zero_trivial`. -/
example (p : ℕ) : delaunayWeight p 0 0 = ∏' i : ℕ, (1 - ((p : ℝ) ^ (2 * (i + 1) - 1))⁻¹) := sorry

/-- Unit test `ArithmeticStatistics.delaunayWeight.test_rank_decreases_mass`. -/
example (p : ℕ) [Fact p.Prime] : delaunayWeight p 0 0 < delaunayWeight p 1 0 := sorry

/-- Unit test `ArithmeticStatistics.delaunayWeight.test_odd_excluded`: the law lives on even
dimensions, i.e. it is indexed by `n` with dimension `2n`, and its total mass is already `1`. -/
example (p : ℕ) [Fact p.Prime] : ∑' n, delaunayWeight p 0 n = 1 := sorry

/-- Unit test `ArithmeticStatistics.delaunayWeight.test_poonen_rains_identity`. -/
example (p : ℕ) [Fact p.Prime] (n : ℕ) : poonenRainsWeight p (2 * n) = delaunayWeight p 0 n / 2 :=
  sorry

theorem delaunayWeight_eq_alternatingCokernel (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Tendsto (fun m : ℕ => (Nat.card {A : Matrix (Fin (2 * m)) (Fin (2 * m)) (ZMod p) //
        Aᵀ = -A ∧ (∀ i, A i i = 0) ∧ Module.finrank (ZMod p) (LinearMap.ker A.mulVecLin) = 2 * n} : ℝ) /
          (p : ℝ) ^ ((2 * m) * (2 * m - 1) / 2)) atTop (𝓝 (delaunayWeight p 0 n)) := sorry

end PoonenRains

/-! ## Random alternating matrices (Smith's `P^Alt`, BKLPR) -/

section Alternating

/-- An alternating square matrix: zero diagonal and `Aᵀ = -A`. -/
def IsAlternatingMatrix {R : Type*} [Ring R] {n : ℕ} (A : Matrix (Fin n) (Fin n) R) : Prop :=
  Aᵀ = -A ∧ ∀ i, A i i = 0

/-- BKLPR Lemma 3.6: the proportion of invertible alternating matrices. -/
theorem card_invertible_alternating (p : ℕ) [Fact p.Prime] (m : ℕ) :
    (Nat.card {A : Matrix (Fin (2 * m)) (Fin (2 * m)) (ZMod p) // IsAlternatingMatrix A ∧ IsUnit A.det} : ℝ) /
        (p : ℝ) ^ ((2 * m) * (2 * m - 1) / 2) =
      ∏ i ∈ Finset.Icc 1 m, (1 - ((p : ℝ) ^ (2 * i - 1))⁻¹) := sorry

/-- `P_p(j | n)`: the kernel law of a uniformly random alternating `n × n` matrix over `𝔽_p`. -/
noncomputable def alternatingKernelLaw (p j n : ℕ) : ℝ :=
  (Nat.card {A : Matrix (Fin n) (Fin n) (ZMod p) //
      IsAlternatingMatrix A ∧ Module.finrank (ZMod p) (LinearMap.ker A.mulVecLin) = j} : ℝ) /
    (p : ℝ) ^ (n * (n - 1) / 2)

theorem alternatingKernelLaw_eq_zero_of_parity (p : ℕ) [Fact p.Prime] {j n : ℕ}
    (h : ¬ (j % 2 = n % 2)) : alternatingKernelLaw p j n = 0 := sorry

theorem alternatingKernelLaw_self (p : ℕ) [Fact p.Prime] (n : ℕ) :
    alternatingKernelLaw p n n = ((p : ℝ) ^ (n * (n - 1) / 2))⁻¹ := sorry

theorem sum_alternatingKernelLaw (p : ℕ) [Fact p.Prime] (n : ℕ) :
    ∑ j ∈ Finset.range (n + 1), alternatingKernelLaw p j n = 1 := sorry

/-- Closed formula (corrected from Smith II, Case 2.13). -/
theorem alternatingKernelLaw_eq_formula (p : ℕ) [Fact p.Prime] {j n : ℕ} (hjn : j ≤ n)
    (hpar : j % 2 = n % 2) :
    alternatingKernelLaw p j n =
      ((p : ℝ) ^ (j * (j - 1) / 2))⁻¹ *
        (∏ k ∈ Finset.Icc 1 j, (1 - ((p : ℝ) ^ (n - j + k))⁻¹) / (1 - ((p : ℝ) ^ k)⁻¹)) *
        ∏ k ∈ Finset.Icc 1 ((n - j) / 2), (1 - ((p : ℝ) ^ (2 * k - 1))⁻¹) := sorry

/-- `P_p(j | ∞)`: the parity-averaged limit law. -/
noncomputable def alternatingKernelLimit (p j : ℕ) : ℝ :=
  limUnder atTop (fun n : ℕ => (1 / 2 : ℝ) * (alternatingKernelLaw p j (2 * n) +
    alternatingKernelLaw p j (2 * n + 1)))

theorem alternatingKernelLimit_eq_poonenRains (p : ℕ) [Fact p.Prime] (j : ℕ) :
    alternatingKernelLimit p j = poonenRainsWeight p j := sorry

theorem poonenRainsDistribution_eq_alternatingKernelLimit (p : ℕ) [Fact p.Prime] (j : ℕ) :
    poonenRainsDistribution p j = ENNReal.ofReal (alternatingKernelLimit p j) := sorry

/-- The parity-restricted limit is twice the Poonen–Rains weight. -/
theorem tendsto_alternatingKernelLaw (p : ℕ) [Fact p.Prime] (j : ℕ) :
    Tendsto (fun m : ℕ => alternatingKernelLaw p j (j + 2 * m)) atTop (𝓝 (2 * poonenRainsWeight p j)) :=
  sorry

/-- Unit test `ArithmeticStatistics.alternatingKernelLaw.test_two_by_two`. -/
example : alternatingKernelLaw 2 0 2 = 1 / 2 ∧ alternatingKernelLaw 2 2 2 = 1 / 2 := sorry

/-- Unit test `ArithmeticStatistics.alternatingKernelLaw.test_four`. -/
example : alternatingKernelLaw 2 2 4 = 35 / 64 ∧ alternatingKernelLaw 2 0 4 = 28 / 64 := sorry

/-- Unit test `ArithmeticStatistics.alternatingKernelLaw.test_parity`. -/
example (p : ℕ) [Fact p.Prime] : alternatingKernelLaw p 1 2 = 0 := sorry

/-- Unit test `ArithmeticStatistics.alternatingKernelLaw.test_zero_size`. -/
example (p : ℕ) [Fact p.Prime] : alternatingKernelLaw p 0 0 = 1 := sorry

/-- Unit test `ArithmeticStatistics.alternatingKernelLaw.test_not_all_matrices`: the alternating law
differs from the kernel law of all `3 × 3` matrices over `𝔽_2`. -/
example : alternatingKernelLaw 2 1 3 = 7 / 8 ∧
    (Nat.card {A : Matrix (Fin 3) (Fin 3) (ZMod 2) //
      Module.finrank (ZMod 2) (LinearMap.ker A.mulVecLin) = 1} : ℝ) / 512 = 147 / 256 := sorry

end Alternating

/-! ## Symplectic p-groups and the BKLPR model -/

section BKLPR

/-- A class `⟨n, λ⟩` is symplectic when every part of `λ` has even multiplicity (`G ≅ H × H`). -/
def IsSymplecticClass (A : FinAbPGroupClass) : Prop :=
  ∀ k, Even (A.2.parts.count k)

/-- `#Sp(G)` for the standard symplectic structure on the representative of a symplectic class. -/
noncomputable def symplecticAutCard (p : ℕ) (A : FinAbPGroupClass) : ℕ := sorry

theorem isSymplecticClass_iff_exists_pairing (p : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) :
    IsSymplecticClass A ↔ ∃ B : A.toGroup p →+ A.toGroup p →+ AddCircle (1 : ℚ),
      (∀ x, B x x = 0) ∧ Function.Injective B := sorry

theorem symplectic_pairing_unique (p : ℕ) [Fact p.Prime] (A : FinAbPGroupClass)
    (B₁ B₂ : A.toGroup p →+ A.toGroup p →+ AddCircle (1 : ℚ))
    (h₁ : (∀ x, B₁ x x = 0) ∧ Function.Injective B₁) (h₂ : (∀ x, B₂ x x = 0) ∧ Function.Injective B₂) :
    ∃ e : A.toGroup p ≃+ A.toGroup p, ∀ x y, B₂ (e x) (e y) = B₁ x y := sorry

theorem symplecticAutCard_pos (p : ℕ) [Fact p.Prime] (A : FinAbPGroupClass) (hA : IsSymplecticClass A) :
    0 < symplecticAutCard p A := sorry

/-- The class of `(ℤ/p)^{2k}` (partition `1^{2k}`). -/
def elementaryClass (k : ℕ) : FinAbPGroupClass :=
  ⟨2 * k, Nat.Partition.ofSums (2 * k) (Multiset.replicate (2 * k) 1) (by simp)⟩

theorem symplecticAutCard_elementary (p : ℕ) [Fact p.Prime] (k : ℕ) :
    symplecticAutCard p (elementaryClass k) = p ^ (k ^ 2) * ∏ i ∈ Finset.Icc 1 k, (p ^ (2 * i) - 1) := sorry

/-- Unit test `ArithmeticStatistics.symplecticAutCard.test_rank_two`: `#Sp((ℤ/p)²) = p(p² − 1)`. -/
example (p : ℕ) [Fact p.Prime] : symplecticAutCard p (elementaryClass 1) = p * (p ^ 2 - 1) := sorry

/-- Unit test `ArithmeticStatistics.IsSymplecticClass.test_cyclic`: `ℤ/p` is not symplectic. -/
example : ¬ IsSymplecticClass ⟨1, Nat.Partition.indiscrete 1⟩ := sorry

/-- Unit test `ArithmeticStatistics.IsSymplecticClass.test_trivial`. -/
example (p : ℕ) [Fact p.Prime] : IsSymplecticClass FinAbPGroupClass.trivial ∧
    symplecticAutCard p FinAbPGroupClass.trivial = 1 := sorry

/-- Unit test `ArithmeticStatistics.IsSymplecticClass.test_mixed`: `ℤ/p² × ℤ/p × ℤ/p` is not
symplectic. -/
example : ¬ IsSymplecticClass ⟨4, Nat.Partition.ofSums 4 {2, 1, 1} (by decide)⟩ := sorry

/-- `π_n(G)`: the cokernel law of a Haar-random alternating `n × n` matrix over `ℤ_p`, computed modulo
`p^e` with `e` one more than the largest part. -/
noncomputable def alternatingCokernelLaw (p n : ℕ) (G : FinAbPGroupClass) : ℝ :=
  let e := G.partsList.foldr max 0 + 1
  (Nat.card {A : Matrix (Fin n) (Fin n) (ZMod (p ^ e)) // IsAlternatingMatrix A ∧
      Nonempty (((Fin n → ZMod (p ^ e)) ⧸ LinearMap.range A.mulVecLin) ≃+ G.toGroup p)} : ℝ) /
    ((p : ℝ) ^ e) ^ (n * (n - 1) / 2)

theorem alternatingCokernelLaw_eq_of_le (p n : ℕ) [Fact p.Prime] (G : FinAbPGroupClass) (e : ℕ)
    (he : G.partsList.foldr max 0 < e) :
    alternatingCokernelLaw p n G =
      (Nat.card {A : Matrix (Fin n) (Fin n) (ZMod (p ^ e)) // IsAlternatingMatrix A ∧
          Nonempty (((Fin n → ZMod (p ^ e)) ⧸ LinearMap.range A.mulVecLin) ≃+ G.toGroup p)} : ℝ) /
        ((p : ℝ) ^ e) ^ (n * (n - 1) / 2) := sorry

theorem alternatingCokernelLaw_trivial (p m : ℕ) [Fact p.Prime] :
    alternatingCokernelLaw p (2 * m) FinAbPGroupClass.trivial =
      ∏ i ∈ Finset.Icc 1 m, (1 - ((p : ℝ) ^ (2 * i - 1))⁻¹) := sorry

theorem alternatingCokernelLaw_eq_zero_of_not_symplectic (p n : ℕ) [Fact p.Prime] (G : FinAbPGroupClass)
    (hG : ¬ IsSymplecticClass G) : alternatingCokernelLaw p n G = 0 := sorry

theorem sum_alternatingCokernelLaw (p m : ℕ) [Fact p.Prime] :
    HasSum (alternatingCokernelLaw p (2 * m)) 1 := sorry

/-- `A_r(G) = (#G)^{1-r}/#Sp(G) · ∏_{i ≥ r+1} (1 − p^{1−2i})` on symplectic classes. -/
noncomputable def bklprShaLaw (p r : ℕ) (G : FinAbPGroupClass) : ℝ :=
  if IsSymplecticClass G then
    ((p : ℝ) ^ G.1) ^ (1 - (r : ℤ)) / symplecticAutCard p G *
      ∏' i : ℕ, (1 - ((p : ℝ) ^ (2 * (i + r + 1) - 1))⁻¹)
  else 0

theorem alternatingCokernelLaw_tendsto (p : ℕ) [Fact p.Prime] (G : FinAbPGroupClass) :
    Tendsto (fun m : ℕ => alternatingCokernelLaw p (2 * m) G) atTop (𝓝 (bklprShaLaw p 0 G)) := sorry

/-- BKLPR Theorems 3.9 and 3.11 (total mass). -/
theorem hasSum_bklprShaLaw (p r : ℕ) [Fact p.Prime] : HasSum (bklprShaLaw p r) 1 := sorry

/-- Unit test `ArithmeticStatistics.alternatingCokernelLaw.test_trivial_two`. -/
example (p : ℕ) [Fact p.Prime] :
    alternatingCokernelLaw p 2 FinAbPGroupClass.trivial = 1 - (p : ℝ)⁻¹ := sorry

/-- Unit test `ArithmeticStatistics.alternatingCokernelLaw.test_cyclic_zero`. -/
example (p n : ℕ) [Fact p.Prime] : alternatingCokernelLaw p n ⟨1, Nat.Partition.indiscrete 1⟩ = 0 := sorry

/-- Unit test `ArithmeticStatistics.alternatingCokernelLaw.test_n_zero`. -/
example (p : ℕ) [Fact p.Prime] (G : FinAbPGroupClass) :
    alternatingCokernelLaw p 0 G = if G = FinAbPGroupClass.trivial then 1 else 0 := sorry

/-- Unit test `ArithmeticStatistics.alternatingCokernelLaw.test_level_independent`. -/
example (p n : ℕ) [Fact p.Prime] :
    alternatingCokernelLaw p n (elementaryClass 1) =
      (Nat.card {A : Matrix (Fin n) (Fin n) (ZMod (p ^ 3)) // IsAlternatingMatrix A ∧
          Nonempty (((Fin n → ZMod (p ^ 3)) ⧸ LinearMap.range A.mulVecLin) ≃+
            (elementaryClass 1).toGroup p)} : ℝ) / ((p : ℝ) ^ 3) ^ (n * (n - 1) / 2) := sorry

/-- Weights of the BKLPR model: `(1/2) A_r(T)` for `r ≤ 1`. -/
noncomputable def bklprModelWeight (p : ℕ) (x : ℕ × FinAbPGroupClass) : ℝ≥0∞ :=
  if x.1 ≤ 1 then ENNReal.ofReal (bklprShaLaw p x.1 x.2 / 2) else 0

theorem hasSum_bklprModelWeight (p : ℕ) [Fact p.Prime] : HasSum (bklprModelWeight p) 1 := sorry

/-- The BKLPR model for the `p^∞`-Selmer sequence: rank `r ∈ {0, 1}` uniform, `Ш[p^∞]` of law `A_r`. -/
noncomputable def bklprModel (p : ℕ) [Fact p.Prime] : PMF (ℕ × FinAbPGroupClass) :=
  ⟨bklprModelWeight p, hasSum_bklprModelWeight p⟩

theorem bklprModel_apply (p : ℕ) [Fact p.Prime] (r : ℕ) (T : FinAbPGroupClass) :
    bklprModel p (r, T) = if r ≤ 1 then ENNReal.ofReal (bklprShaLaw p r T / 2) else 0 := sorry

theorem bklprModel_rank_marginal (p : ℕ) [Fact p.Prime] (r : ℕ) :
    PMF.map Prod.fst (bklprModel p) r = if r ≤ 1 then 1 / 2 else 0 := sorry

theorem bklprModel_sha_conditional (p : ℕ) [Fact p.Prime] (r : ℕ) (hr : r ≤ 1) (T : FinAbPGroupClass) :
    bklprModel p (r, T) = ENNReal.ofReal (bklprShaLaw p r T) / 2 := sorry

theorem bklprModel_selmer_p_rank (p : ℕ) [Fact p.Prime] (d : ℕ) :
    PMF.map (fun x : ℕ × FinAbPGroupClass => x.1 + x.2.2.parts.card) (bklprModel p) d = ENNReal.ofReal (poonenRainsWeight p d) := sorry

/-- Unit test `ArithmeticStatistics.bklprModel.test_rank_two`. -/
example (p : ℕ) [Fact p.Prime] (T : FinAbPGroupClass) : bklprModel p (2, T) = 0 := sorry

/-- Unit test `ArithmeticStatistics.bklprModel.test_trivial_rank_zero`. -/
example (p : ℕ) [Fact p.Prime] : bklprModel p (0, FinAbPGroupClass.trivial) =
    ENNReal.ofReal ((∏' i : ℕ, (1 - ((p : ℝ) ^ (2 * (i + 1) - 1))⁻¹)) / 2) := sorry

/-- Unit test `ArithmeticStatistics.bklprModel.test_symplectic_support`. -/
example (p : ℕ) [Fact p.Prime] : bklprModel p (0, ⟨1, Nat.Partition.indiscrete 1⟩) = 0 := sorry

/-- Unit test `ArithmeticStatistics.bklprModel.test_total_mass`. -/
example (p : ℕ) [Fact p.Prime] : ∑' x, bklprModel p x = 1 := sorry

/-- BKLPR Lemma 4.8: the number of maximal isotropic direct summands of `(ℤ/q)^{2n}` is
`q^{n(n−1)/2} ∏_{i=1}^{n} (1 + p^{i−n})`; stated here for `q = p` in the form of PR 2.6(b). -/
theorem card_maxIsotropic_hyperbolic (p n : ℕ) [Fact p.Prime] :
    (∏ j ∈ Finset.range n, ((p : ℝ) ^ j + 1)) =
      (p : ℝ) ^ (n * (n - 1) / 2) * ∏ i ∈ Finset.Icc 1 n, (1 + ((p : ℝ) ^ (n - i))⁻¹) := sorry

end BKLPR

/-! ## Conjectures as stated propositions

The family is ST.0's elliptic-curve family `EllipticFamily.family` on `EllipticFamily.Carrier`
(minimal short Weierstrass pairs `(A, B)` with `4A³ + 27B² ≠ 0`, ordered by `max(4|A|³, 27B²)`);
`shortPairsBelow X` is the finite set of its members of height `< X`. The functions `selDim`,
`selCard`, `rk`, `sha` stand for `dim_{𝔽_p} Sel_p(E)`, `#Sel_n(E)`, `rank E(ℚ)` and `Ш(E)[p^∞]`
(with `none` for an infinite group), which the pinned libraries do not contain.
-/

section Conjectures

/-- The curves of height `< X` in ST.0's elliptic-curve family. -/
noncomputable def shortPairsBelow (X : ℝ) : Finset EllipticFamily.Carrier :=
  (EllipticFamily.family.heightLE X).filter (fun E => EllipticFamily.family.height E < X)

/-- Poonen–Rains Conjecture 1.1 over `ℚ` for the function `selDim` (to be instantiated with
`dim_{𝔽_p} Sel_p(E_{A,B})`). -/
def PoonenRainsSelmerConjecture (p : ℕ) (selDim : EllipticFamily.Carrier → ℕ) : Prop :=
  (∀ d, Tendsto (fun X => (((shortPairsBelow X).filter (fun E => selDim E = d)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 (poonenRainsWeight p d))) ∧
  (∀ m, 1 ≤ m → Tendsto (fun X => (∑ E ∈ shortPairsBelow X, ((p : ℝ) ^ selDim E) ^ m) /
      (shortPairsBelow X).card) atTop (𝓝 (∏ i ∈ Finset.Icc 1 m, ((p : ℝ) ^ i + 1))))

theorem PoonenRainsSelmerConjecture.density {p : ℕ} {selDim : EllipticFamily.Carrier → ℕ}
    (h : PoonenRainsSelmerConjecture p selDim) (d : ℕ) :
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => selDim E = d)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 (poonenRainsWeight p d)) := h.1 d

theorem PoonenRainsSelmerConjecture.moment {p : ℕ} {selDim : EllipticFamily.Carrier → ℕ}
    (h : PoonenRainsSelmerConjecture p selDim) (m : ℕ) (hm : 1 ≤ m) :
    Tendsto (fun X => (∑ E ∈ shortPairsBelow X, ((p : ℝ) ^ selDim E) ^ m) /
      (shortPairsBelow X).card) atTop (𝓝 (∏ i ∈ Finset.Icc 1 m, ((p : ℝ) ^ i + 1))) := h.2 m hm

theorem PoonenRainsSelmerConjecture.average {p : ℕ} {selDim : EllipticFamily.Carrier → ℕ}
    (h : PoonenRainsSelmerConjecture p selDim) :
    Tendsto (fun X => (∑ E ∈ shortPairsBelow X, (p : ℝ) ^ selDim E) /
      (shortPairsBelow X).card) atTop (𝓝 ((p : ℝ) + 1)) := sorry

/-- The `σ(n)` conjecture of Bhargava–Shankar for the function `selCard` (to be instantiated with
`#Sel_n(E_{A,B})`). -/
def SelmerAverageConjecture (n : ℕ) (selCard : EllipticFamily.Carrier → ℕ) : Prop :=
  Tendsto (fun X => (∑ E ∈ shortPairsBelow X, (selCard E : ℝ)) / (shortPairsBelow X).card) atTop
    (𝓝 (ArithmeticFunction.sigma 1 n : ℝ))

theorem SelmerAverageConjecture.average {n : ℕ} {selCard : EllipticFamily.Carrier → ℕ}
    (h : SelmerAverageConjecture n selCard) :
    Tendsto (fun X => (∑ E ∈ shortPairsBelow X, (selCard E : ℝ)) / (shortPairsBelow X).card) atTop
      (𝓝 (ArithmeticFunction.sigma 1 n : ℝ)) := h

theorem selmerAverageConjecture_one (hX : Tendsto (fun X => (shortPairsBelow X).card) atTop atTop) :
    SelmerAverageConjecture 1 (fun _ => 1) := sorry

theorem selmerAverageConjecture_prime_iff (p : ℕ) [Fact p.Prime]
    (selDim : EllipticFamily.Carrier → ℕ) :
    SelmerAverageConjecture p (fun E => p ^ selDim E) ↔
      Tendsto (fun X => (∑ E ∈ shortPairsBelow X, (p : ℝ) ^ selDim E) /
        (shortPairsBelow X).card) atTop (𝓝 ((p : ℝ) + 1)) := sorry

theorem poonenRainsSelmerConjecture_of_bklpr (p : ℕ) [Fact p.Prime]
    (selDim rk : EllipticFamily.Carrier → ℕ)
    (sha : EllipticFamily.Carrier → Option FinAbPGroupClass)
    (hsel : ∀ E, ∀ G, sha E = some G → selDim E = rk E + G.2.parts.card)
    (h : ∀ r G, Tendsto (fun X => (((shortPairsBelow X).filter
        (fun E => rk E = r ∧ sha E = some G)).card : ℝ) / (shortPairsBelow X).card) atTop
        (𝓝 ((bklprModel p (r, G)).toReal))) (d : ℕ) :
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => selDim E = d)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 (poonenRainsWeight p d)) := sorry

/-- Unit test `ArithmeticStatistics.PoonenRainsSelmerConjecture.test_average_two`. -/
example (selDim : EllipticFamily.Carrier → ℕ) (h : PoonenRainsSelmerConjecture 2 selDim) :
    Tendsto (fun X => (∑ E ∈ shortPairsBelow X, (2 : ℝ) ^ selDim E) / (shortPairsBelow X).card)
      atTop (𝓝 3) := sorry

/-- Unit test `ArithmeticStatistics.PoonenRainsSelmerConjecture.test_second_moment`. -/
example (selDim : EllipticFamily.Carrier → ℕ) (h : PoonenRainsSelmerConjecture 2 selDim) :
    Tendsto (fun X =>
        (∑ E ∈ shortPairsBelow X, ((2 : ℝ) ^ selDim E) ^ 2) / (shortPairsBelow X).card)
      atTop (𝓝 15) := sorry

/-- Unit test `ArithmeticStatistics.PoonenRainsSelmerConjecture.test_not_rank`: the conjecture gives
positive density to `dim Sel_p = 2`. -/
example (p : ℕ) [Fact p.Prime] (selDim : EllipticFamily.Carrier → ℕ)
    (h : PoonenRainsSelmerConjecture p selDim) :
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => selDim E = 2)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 (poonenRainsWeight p 2)) ∧ 0 < poonenRainsWeight p 2 := sorry

/-- Unit test `ArithmeticStatistics.PoonenRainsSelmerConjecture.test_zero_moment`: the `m = 0` moment
is `1` for any function, so the moment clause starts at `m = 1`. -/
example (p : ℕ) (selDim : EllipticFamily.Carrier → ℕ) (hX : ∀ᶠ X in atTop,
    (shortPairsBelow X).Nonempty) :
    ∀ᶠ X in atTop, (∑ E ∈ shortPairsBelow X, ((p : ℝ) ^ selDim E) ^ 0) /
          (shortPairsBelow X).card = 1 :=
  sorry

/-- Unit test `ArithmeticStatistics.SelmerAverageConjecture.test_sigma_four`: `σ(4) = 7`. -/
example : (ArithmeticFunction.sigma 1 4 : ℝ) = 7 := sorry

/-- Unit test `ArithmeticStatistics.SelmerAverageConjecture.test_sigma_six`: `σ(6) = 12`. -/
example : (ArithmeticFunction.sigma 1 6 : ℝ) = 12 := sorry

/-- Unit test `ArithmeticStatistics.SelmerAverageConjecture.test_one`. -/
example (hX : Tendsto (fun X => (shortPairsBelow X).card) atTop atTop) :
    SelmerAverageConjecture 1 (fun _ => 1) := sorry

/-- Unit test `ArithmeticStatistics.SelmerAverageConjecture.test_not_multiplicative_moment`: the
predicted average of `#Sel_4` (7) is not the predicted second moment of `#Sel_2` (15). -/
example : (ArithmeticFunction.sigma 1 4 : ℝ) ≠ ∏ i ∈ Finset.Icc 1 2, ((2 : ℝ) ^ i + 1) := sorry

/-- BKLPR Conjecture 1.3 over `ℚ` for the functions `rk` and `sha` (to be instantiated with the rank
and `Ш[p^∞]`, `none` when infinite). -/
def BKLPRSelmerConjecture (p : ℕ) [Fact p.Prime] (rk : EllipticFamily.Carrier → ℕ)
    (sha : EllipticFamily.Carrier → Option FinAbPGroupClass) : Prop :=
  ∀ r G, Tendsto (fun X =>
      (((shortPairsBelow X).filter (fun E => rk E = r ∧ sha E = some G)).card : ℝ) /
    (shortPairsBelow X).card) atTop (𝓝 ((bklprModel p (r, G)).toReal))

theorem BKLPRSelmerConjecture.density {p : ℕ} [Fact p.Prime] {rk : EllipticFamily.Carrier → ℕ}
    {sha : EllipticFamily.Carrier → Option FinAbPGroupClass} (h : BKLPRSelmerConjecture p rk sha)
    (r : ℕ)
    (G : FinAbPGroupClass) :
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => rk E = r ∧ sha E = some G)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 ((bklprModel p (r, G)).toReal)) := h r G

/-- BKLPR Conjecture 1.7 over `ℚ`: the law of `Ш[p^∞]` among rank-`r` curves is `A_r`. -/
def BKLPRShaConjecture (p : ℕ) (rk : EllipticFamily.Carrier → ℕ)
    (sha : EllipticFamily.Carrier → Option FinAbPGroupClass) : Prop :=
  ∀ r G, {E : EllipticFamily.Carrier | rk E = r}.Infinite →
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => rk E = r ∧ sha E = some G)).card : ℝ) /
      ((shortPairsBelow X).filter (fun E => rk E = r)).card) atTop (𝓝 (bklprShaLaw p r G))

theorem bklprSelmerConjecture_rank (p : ℕ) [Fact p.Prime] (rk : EllipticFamily.Carrier → ℕ)
    (sha : EllipticFamily.Carrier → Option FinAbPGroupClass) (h : BKLPRSelmerConjecture p rk sha)
    (r : ℕ) (hr : r ≤ 1) :
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => rk E = r)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 (1 / 2)) := sorry

/-- Unit test `ArithmeticStatistics.BKLPRSelmerConjecture.test_rank_two_density`. -/
example (p : ℕ) [Fact p.Prime] (rk : EllipticFamily.Carrier → ℕ)
    (sha : EllipticFamily.Carrier → Option FinAbPGroupClass)
    (h : BKLPRSelmerConjecture p rk sha) :
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => 2 ≤ rk E)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 0) := sorry

/-- Unit test `ArithmeticStatistics.BKLPRSelmerConjecture.test_cyclic_sha`. -/
example (p : ℕ) [Fact p.Prime] (rk : EllipticFamily.Carrier → ℕ)
    (sha : EllipticFamily.Carrier → Option FinAbPGroupClass)
    (h : BKLPRSelmerConjecture p rk sha) (r : ℕ) :
    Tendsto (fun X => (((shortPairsBelow X).filter
      (fun E => rk E = r ∧ sha E = some ⟨1, Nat.Partition.indiscrete 1⟩)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 0) := sorry

/-- Unit test `ArithmeticStatistics.BKLPRSelmerConjecture.test_independent_of_p_rank`: the rank
prediction does not depend on `p`. -/
example (p q : ℕ) [Fact p.Prime] [Fact q.Prime] (rk : EllipticFamily.Carrier → ℕ)
    (shap shaq : EllipticFamily.Carrier → Option FinAbPGroupClass)
    (hp : BKLPRSelmerConjecture p rk shap) (hq : BKLPRSelmerConjecture q rk shaq) :
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => rk E = 0)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 (1 / 2)) := sorry

/-- Unit test `ArithmeticStatistics.BKLPRSelmerConjecture.test_trivial`. -/
example (p : ℕ) [Fact p.Prime] (rk : EllipticFamily.Carrier → ℕ)
    (sha : EllipticFamily.Carrier → Option FinAbPGroupClass)
    (h : BKLPRSelmerConjecture p rk sha) :
    Tendsto (fun X => (((shortPairsBelow X).filter
      (fun E => rk E = 0 ∧ sha E = some FinAbPGroupClass.trivial)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 ((∏' i : ℕ, (1 - ((p : ℝ) ^ (2 * (i + 1) - 1))⁻¹)) / 2)) := sorry

/-- BS 4-Selmer Proposition 5: the `σ(n)` conjecture along an infinite set forces rank `≤ 1` for 100%. -/
theorem rank_le_one_density_of_selmerAverage (N : Set ℕ) (hN : N.Infinite)
    (rk : EllipticFamily.Carrier → ℕ)
    (selCard : ℕ → EllipticFamily.Carrier → ℕ) (hsel : ∀ n ∈ N, ∀ E, 2 ≤ rk E → n ^ 2 ≤ selCard n E)
    (h : ∀ n ∈ N, SelmerAverageConjecture n (selCard n)) :
    Tendsto (fun X => (((shortPairsBelow X).filter (fun E => 2 ≤ rk E)).card : ℝ) /
      (shortPairsBelow X).card) atTop (𝓝 0) := sorry

/-- The combinatorial core of Bhargava–Shankar's Corollary 2: `6r − 3 ≤ 3^r`. -/
theorem six_mul_sub_three_le_three_pow (r : ℕ) : 6 * (r : ℤ) - 3 ≤ 3 ^ r := sorry

end Conjectures

/-! ## Twist families: Smith's hypothesis and the corank law -/

section Twists

/-- `N_r(H) = #{d : 0 < |d| ≤ H, c(d) = r}`. -/
def signedTwistCorankCount (c : ℤ → ℕ) (r H : ℕ) : ℕ :=
  ((Finset.Icc (-(H : ℤ)) H).filter (fun d => d ≠ 0 ∧ c d = r)).card

/-- `c` has signed twist-corank law `π`. -/
def HasSignedTwistCorankLaw (c : ℤ → ℕ) (π : ℕ → ℝ) : Prop :=
  ∀ r, Tendsto (fun H : ℕ => (signedTwistCorankCount c r H : ℝ) / (2 * H)) atTop (𝓝 (π r))

/-- Squareclass version: `#{s ∈ Σ(X) : c(s) = r}`. -/
def squareclassTwistCorankCount {ι : Type*} (Sig : ℝ → Finset ι) (c : ι → ℕ) (r : ℕ) (X : ℝ) : ℕ :=
  ((Sig X).filter (fun s => c s = r)).card

/-- Lower density of corank `r` in a squareclass family. -/
noncomputable def LowerSquareclassCorankDensity {ι : Type*} (Sig : ℝ → Finset ι) (c : ι → ℕ) (r : ℕ) :
    ℝ≥0∞ :=
  liminf (fun X => (squareclassTwistCorankCount Sig c r X : ℝ≥0∞) / (Sig X).card) atTop

theorem sum_signedTwistCorankCount (c : ℤ → ℕ) (H : ℕ) :
    ∑ r ∈ (Finset.Icc (-(H : ℤ)) H).image c, signedTwistCorankCount c r H = 2 * H := sorry

theorem signedTwistCorankCount_mono (c : ℤ → ℕ) (r : ℕ) {H H' : ℕ} (h : H ≤ H') :
    signedTwistCorankCount c r H ≤ signedTwistCorankCount c r H' := sorry

/-- A two-point law forces density zero of corank `≥ 2`. -/
theorem hasSignedTwistCorankLaw_tail (c : ℤ → ℕ) (π : ℕ → ℝ) (h0 : Tendsto (fun H : ℕ =>
    (signedTwistCorankCount c 0 H : ℝ) / (2 * H)) atTop (𝓝 (π 0)))
    (h1 : Tendsto (fun H : ℕ => (signedTwistCorankCount c 1 H : ℝ) / (2 * H)) atTop (𝓝 (π 1)))
    (hπ : π 0 + π 1 = 1) :
    Tendsto (fun H : ℕ => (((Finset.Icc (-(H : ℤ)) H).filter (fun d => d ≠ 0 ∧ 2 ≤ c d)).card : ℝ) /
      (2 * H)) atTop (𝓝 0) := sorry

/-- Unit test `ArithmeticStatistics.signedTwistCorankCount.test_constant_zero`. -/
example (H : ℕ) : signedTwistCorankCount (fun _ => 0) 0 H = 2 * H ∧
    HasSignedTwistCorankLaw (fun _ => 0) (fun r => if r = 0 then 1 else 0) := sorry

/-- Unit test `ArithmeticStatistics.signedTwistCorankCount.test_parity`. -/
example : HasSignedTwistCorankLaw (fun d => if 0 < d then 1 else 0) (fun r => if r ≤ 1 then 1 / 2 else 0) :=
  sorry

/-- Unit test `ArithmeticStatistics.HasSignedTwistCorankLaw.test_pointwise_not_tight`. -/
example : HasSignedTwistCorankLaw (fun d => d.natAbs) (fun _ => 0) := sorry

/-- Unit test `ArithmeticStatistics.squareclassTwistCorankCount.test_rational_squarefree`: over `ℚ`
the squareclasses of height `< X` are the squarefree integers of absolute value `< X`. -/
example (X : ℕ) (c : ℤ → ℕ) (r : ℕ) :
    squareclassTwistCorankCount (fun Y => ((Finset.Icc (-(X : ℤ)) X).filter
        (fun d => Squarefree d ∧ ((|d| : ℤ) : ℝ) < Y))) c r X =
      (((Finset.Icc (-(X : ℤ)) X).filter (fun d => Squarefree d ∧ |d| < (X : ℤ) ∧ c d = r))).card := sorry

/-- Case (3) of Smith's Assumption 1.1 for a monic cubic. -/
def SmithTwistHypothesis.caseThree (f : ℚ[X]) : Prop :=
  ∃ e₁ e₂ e₃ : ℚ, e₁ ≠ e₂ ∧ e₁ ≠ e₃ ∧ e₂ ≠ e₃ ∧ f = (X - C e₁) * (X - C e₂) * (X - C e₃) ∧
    ¬ IsSquare ((e₁ - e₂) * (e₁ - e₃)) ∧ ¬ IsSquare ((e₂ - e₁) * (e₂ - e₃)) ∧
    ¬ IsSquare ((e₃ - e₁) * (e₃ - e₂))

/-- Smith's Assumption 1.1 for `y² = f(x)`, in terms of the cubic `f`. -/
def SmithTwistHypothesis (f : ℚ[X]) : Prop :=
  (∀ e : ℚ, f.eval e ≠ 0) ∨
  (∃ e a b : ℚ, (∀ e' : ℚ, f.eval e' = 0 → e' = e) ∧ f.comp (X + C e) = X * (X ^ 2 + C a * X + C b) ∧
    ¬ IsSquare b ∧ ¬ IsSquare (b * (a ^ 2 - 4 * b))) ∨
  SmithTwistHypothesis.caseThree f

theorem smithTwistHypothesis_of_irreducible (f : ℚ[X]) (hf : ∀ e : ℚ, f.eval e ≠ 0) :
    SmithTwistHypothesis f := Or.inl hf

theorem smithTwistHypothesis_caseThree_iff (e₁ e₂ e₃ : ℚ) (h₁₂ : e₁ ≠ e₂) (h₁₃ : e₁ ≠ e₃) (h₂₃ : e₂ ≠ e₃) :
    SmithTwistHypothesis.caseThree ((X - C e₁) * (X - C e₂) * (X - C e₃)) ↔
      ¬ IsSquare ((e₁ - e₂) * (e₁ - e₃)) ∧ ¬ IsSquare ((e₂ - e₁) * (e₂ - e₃)) ∧
        ¬ IsSquare ((e₃ - e₁) * (e₃ - e₂)) := sorry

theorem smithTwistHypothesis_twist (f : ℚ[X]) (d : ℚ) (hd : d ≠ 0) :
    SmithTwistHypothesis f ↔ SmithTwistHypothesis (C (d ^ 3) * f.comp (C d⁻¹ * X)) := sorry

/-- Unit test `ArithmeticStatistics.SmithTwistHypothesis.test_congruent`: `x³ − x`. -/
example : SmithTwistHypothesis (X ^ 3 - X) := sorry

/-- Unit test `ArithmeticStatistics.SmithTwistHypothesis.test_case_three_fails`: `x(x − 1)(x − 4)`. -/
example : ¬ SmithTwistHypothesis (X * (X - 1) * (X - 4)) := sorry

/-- Unit test `ArithmeticStatistics.SmithTwistHypothesis.test_irreducible`: `x³ − 2`. -/
example : SmithTwistHypothesis (X ^ 3 - 2) := sorry

/-- Unit test `ArithmeticStatistics.SmithTwistHypothesis.test_case_two_fails`: `x(x² + 4)`. -/
example : ¬ SmithTwistHypothesis (X * (X ^ 2 + 4)) := sorry

/-- The congruent number curve satisfies Smith's hypothesis by case (3). -/
theorem congruentNumberCurve_smithTwistHypothesis : SmithTwistHypothesis.caseThree (X ^ 3 - X) := sorry

/-- The combinatorial core of Burungale–Tian Theorem 3.3 from Smith's law: if the corank function `c`
of the twists has the signed law `(1/2, 1/2, 0, …)` and is even on `S`, then corank `0` has relative
density one in `S = {n > 0 squarefree, n ≡ 1, 2, 3 mod 8}`. The instantiation `c(d) = corank Sel_{2^∞}(E^d/ℚ)`
for `E : y² = x³ − x`, and the evenness (2-parity), are the arithmetic inputs. -/
theorem density_one_corank_zero_of_smith_law (c : ℤ → ℕ)
    (hlaw : HasSignedTwistCorankLaw c (fun r => if r ≤ 1 then 1 / 2 else 0))
    (hpar : ∀ n : ℤ, 0 < n → Squarefree n → n % 8 ∈ ({1, 2, 3} : Finset ℤ) → Even (c n)) :
    Tendsto (fun X : ℕ =>
      (((Finset.Icc (1 : ℤ) X).filter (fun n => Squarefree n ∧ n % 8 ∈ ({1, 2, 3} : Finset ℤ) ∧ c n = 0)).card : ℝ) /
        ((Finset.Icc (1 : ℤ) X).filter (fun n => Squarefree n ∧ n % 8 ∈ ({1, 2, 3} : Finset ℤ))).card)
      atTop (𝓝 1) := sorry

end Twists

/-! ## Selmer ratios and the BKLOS deduction -/

section SelmerRatio

/-- `c(φ) = #coker φ / #ker φ` for a homomorphism of abelian groups (applied to `φ` on local points). -/
noncomputable def localSelmerRatio {A B : Type*} [AddCommGroup A] [AddCommGroup B] (f : A →+ B) : ℚ :=
  (Nat.card (B ⧸ f.range) : ℚ) / Nat.card f.ker

/-- `c(φ) = ∏_v c_v(φ)` as a finite product of local ratios. -/
noncomputable def globalSelmerRatio {ι : Type*} (c : ι → ℚ) : ℚ := ∏ᶠ v, c v

/-- `t(φ) = ord_3 c(φ)`. -/
noncomputable def logSelmerRatio (c : ℚ) : ℤ := padicValRat 3 c

/-- `T_m(φ) = {s : c(φ_s) = 3^m}` for the function `s ↦ c(φ_s)` on squareclasses. -/
def selmerRatioClass {σ : Type*} (cs : σ → ℚ) (m : ℤ) : Set σ := {s | cs s = (3 : ℚ) ^ m}

theorem localSelmerRatio_of_good {A B : Type*} [AddCommGroup A] [AddCommGroup B] (f : A →+ B)
    (hf : Function.Bijective f) : localSelmerRatio f = 1 := sorry

theorem localSelmerRatio_complex {A B : Type*} [AddCommGroup A] [AddCommGroup B] (f : A →+ B)
    (hs : Function.Surjective f) (hk : Nat.card f.ker = 3) : localSelmerRatio f = 1 / 3 := sorry

theorem localSelmerRatio_comp {A B C : Type*} [AddCommGroup A] [AddCommGroup B] [AddCommGroup C]
    (f : A →+ B) (g : B →+ C) (hf : Finite f.ker ∧ Finite (B ⧸ f.range))
    (hg : Finite g.ker ∧ Finite (C ⧸ g.range)) :
    localSelmerRatio (g.comp f) = localSelmerRatio f * localSelmerRatio g := sorry

theorem globalSelmerRatio_twist_local {ι σ : Type*} (S : Finset ι) (cs : σ → ι → ℚ)
    (hS : ∀ s, ∀ v ∉ S, cs s v = 1) (s : σ) :
    globalSelmerRatio (cs s) = ∏ v ∈ S, cs s v := sorry

/-- Unit test `ArithmeticStatistics.localSelmerRatio.test_complex_place`: a surjection with kernel of
order `3` (a 3-isogeny on `ℂ`-points) has ratio `1/3`. -/
example {A B : Type*} [AddCommGroup A] [AddCommGroup B] (f : A →+ B) (hs : Function.Surjective f)
    (hk : Nat.card f.ker = 3) : localSelmerRatio f = 1 / 3 := sorry

/-- Unit test `ArithmeticStatistics.localSelmerRatio.test_real_kernel`: over `ℝ` the ratio is `1/3`
or `1` according as the kernel has order `3` or `1`. -/
example {A B : Type*} [AddCommGroup A] [AddCommGroup B] (f : A →+ B) (hs : Function.Surjective f)
    (hk : Nat.card f.ker = 1) : localSelmerRatio f = 1 := sorry

/-- Unit test `ArithmeticStatistics.globalSelmerRatio.test_identity_isogeny`. -/
example {ι : Type*} : globalSelmerRatio (fun _ : ι => (1 : ℚ)) = 1 := sorry

/-- Unit test `ArithmeticStatistics.selmerRatioClass.test_not_selmer_size`: the Selmer ratio is a
quotient of two indices, not a group order; `c = 1/3` occurs although orders are integers. -/
example : localSelmerRatio (AddMonoidHom.id (ZMod 3) : ZMod 3 →+ ZMod 3) = 1 ∧
    localSelmerRatio (0 : ZMod 3 →+ Unit) = 1 / 3 := sorry

/-- Convexity `k ≤ (3^k − 1)/2` used for the average of `dim Sel_φ`. -/
theorem two_mul_add_one_le_three_pow (k : ℕ) : 2 * k + 1 ≤ 3 ^ k := sorry

/-- The combinatorial core of BKLOS Theorem 2.5(a): average `≤ 1` and even values force at least half
zeros. -/
theorem half_zero_of_even_of_average_le_one {α : Type*} (S : ℝ → Finset α) (r : α → ℕ)
    (hS : ∀ᶠ X in atTop, (S X).Nonempty) (heven : ∀ a, Even (r a))
    (havg : familyUpperMoment S (fun a => (r a : ℝ≥0∞)) 1 ≤ 1) [DecidablePred (· ∈ {a | r a = 0})] :
    1 / 2 ≤ familyLowerDensity S {a | r a = 0} := sorry

/-- The combinatorial core of BKLOS Theorem 2.5(b): average `≤ 4/3` and odd values force at least
five sixths ones. -/
theorem five_sixths_one_of_odd_of_average_le {α : Type*} (S : ℝ → Finset α) (r : α → ℕ)
    (hS : ∀ᶠ X in atTop, (S X).Nonempty) (hodd : ∀ a, Odd (r a))
    (havg : familyUpperMoment S (fun a => (r a : ℝ≥0∞)) 1 ≤ 4 / 3) [DecidablePred (· ∈ {a | r a = 1})] :
    5 / 6 ≤ familyLowerDensity S {a | r a = 1} := sorry

/-- Only finitely many twists have rational odd `p`-torsion: an abstract form — each nonzero point
determines at most one quadratic character. -/
theorem card_twists_with_torsion_le {P σ : Type*} [Fintype P] (pt : σ → Set P)
    (hdisj : ∀ s t, s ≠ t → Disjoint (pt s) (pt t)) :
    Set.ncard {s | (pt s).Nonempty} ≤ Fintype.card P := sorry

/-- The CM Selmer ratio computation at the places above `3`: `3^{[F:K]} · 3^{-[F:ℚ]/2} = 1`. -/
theorem cm_selmer_ratio_product (d : ℕ) : ((3 : ℚ) ^ d) * ((1 / 3 : ℚ) ^ (2 * d / 2)) = 1 := sorry

end SelmerRatio

end ArithmeticStatistics


/-!
## Part A2: local statistics of forms and statistics of abelian varieties over `𝔽_p`

Two groups:

* `ArithmeticStatistics.FormDensity`: the finite-level local densities `σ(a; Q)` of the degree-`d`
  forms in `n+1` variables, their first and second moments over primitive coefficient vectors,
  gradient strata and the lifting lemma used to bound `σ` from below
  (Browning–Le Boudec–Sawin, §5.2; Browning–Matthiesen, Lemma 3.3).
* `ArithmeticStatistics.AbelianVarietyStatistics`: the numerical and measure-theoretic parts of
  Lipnowski–Tsimerman §5 (convex concentration, the corrected model-count concentration,
  Kolmogorov distance and normalized eigenangle spacing measures).

The conditional theorems of Lipnowski–Tsimerman §5 (corrected Theorem 0.2 / Corollaries 5.13,
5.14, 5.20) and the model-ring concentration (corrected Proposition 5.10) are not stated here:
their carriers (principally polarized abelian varieties over `𝔽_p`, their Frobenius polynomials
and the model rings `R_{L,n}`) are not in Mathlib. They are specified in the roadmap document.

`FormDensity.primitiveVectors` is the set `R_m(Q)` of primitive residue vectors; the roadmap cites
it with ST.0, whose suggested Lean does not declare it, so it is declared once, here.
-/


namespace ArithmeticStatistics
open MvPolynomial

namespace FormDensity

/-! ### Coefficient vectors, forms and the Veronese vector -/

/-- The exponent vectors of the degree-`d` monomials in the `n+1` variables `X₀, …, Xₙ`. -/
abbrev Monomials (n d : ℕ) : Finset (Fin (n + 1) →₀ ℕ) :=
  Finset.finsuppAntidiag Finset.univ d

/-- Coefficient vectors of degree-`d` forms in `n+1` variables, indexed by monomials. -/
abbrev CoeffVec (R : Type*) (n d : ℕ) : Type _ := (Monomials n d) → R

/-- The form `f_a = ∑_m a_m X^m` with coefficient vector `a`. -/
noncomputable def form {R : Type*} [CommRing R] {n d : ℕ} (a : CoeffVec R n d) :
    MvPolynomial (Fin (n + 1)) R :=
  ∑ m : Monomials n d, monomial (m : Fin (n + 1) →₀ ℕ) (a m)

/-- The Veronese vector `ν_{d,n}(x) = (x^m)_m` (unweighted monomials). -/
noncomputable def veronese {R : Type*} [CommRing R] {n : ℕ} (d : ℕ) (x : Fin (n + 1) → R) :
    CoeffVec R n d :=
  fun m => ∏ i, x i ^ (m : Fin (n + 1) →₀ ℕ) i

theorem form_isHomogeneous {R : Type*} [CommRing R] {n d : ℕ} (a : CoeffVec R n d) :
    MvPolynomial.IsHomogeneous (form a) d := sorry

theorem eval_form {R : Type*} [CommRing R] {n d : ℕ} (a : CoeffVec R n d)
    (x : Fin (n + 1) → R) : eval x (form a) = ∑ m, a m * veronese d x m := sorry

theorem form_add {R : Type*} [CommRing R] {n d : ℕ} (a b : CoeffVec R n d) :
    form (a + b) = form a + form b := sorry

theorem form_smul {R : Type*} [CommRing R] {n d : ℕ} (c : R) (a : CoeffVec R n d) :
    form (c • a) = C c * form a := sorry

theorem coeff_form {R : Type*} [CommRing R] {n d : ℕ} (a : CoeffVec R n d) (m : Monomials n d) :
    (form a).coeff (m : Fin (n + 1) →₀ ℕ) = a m := sorry

theorem map_form {R S : Type*} [CommRing R] [CommRing S] (φ : R →+* S) {n d : ℕ}
    (a : CoeffVec R n d) : MvPolynomial.map φ (form a) = form (fun m => φ (a m)) := sorry

theorem veronese_smul {R : Type*} [CommRing R] {n : ℕ} (d : ℕ) (c : R) (x : Fin (n + 1) → R) :
    veronese d (c • x) = c ^ d • veronese d x := sorry

theorem card_monomials (n d : ℕ) : (Monomials n d).card = Nat.choose (n + d) d := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.form.test_linear`: the linear form with
coefficient vector `(1, 0)` in two variables is `X₀`. -/
example : form (R := ℤ) (n := 1) (d := 1)
    (fun m => if (m : Fin 2 →₀ ℕ) = Finsupp.single 0 1 then 1 else 0) = X 0 := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.form.test_zero`: the zero coefficient vector
gives the zero form. -/
example (n d : ℕ) : form (R := ℤ) (n := n) (d := d) 0 = 0 := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.veronese.test_count`: for two variables and
degree two there are three monomials, so `N_{2,1} = 3` (no multinomial weights). -/
example : (Monomials 1 2).card = 3 := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.form.test_nonweighted`: the form with all
coefficients one in two variables and degree two is `X₀² + X₀X₁ + X₁²`, not `(X₀ + X₁)²`. -/
example : form (R := ℤ) (n := 1) (d := 2) (fun _ => 1) = X 0 ^ 2 + X 0 * X 1 + X 1 ^ 2 := sorry

/-! ### Primitive residue vectors and the local density -/

/-- Primitive residue vectors `R_m(Q)`: vectors in `(ℤ/Q)^ι` whose coordinates generate the unit
ideal (equivalently `gcd(Q, b) = 1`). -/
noncomputable def primitiveVectors (ι : Type*) [Fintype ι] [DecidableEq ι] (Q : ℕ) [NeZero Q] :
    Finset (ι → ZMod Q) :=
  haveI := Classical.decPred (fun b : ι → ZMod Q => Ideal.span (Set.range b) = ⊤)
  Finset.univ.filter fun b => Ideal.span (Set.range b) = ⊤

theorem card_primitiveVectors_primePow (ι : Type*) [Fintype ι] [DecidableEq ι] (p r : ℕ) [Fact p.Prime] :
    ((primitiveVectors ι (p ^ r)).card : ℝ) =
      (p : ℝ) ^ (r * Fintype.card ι) * (1 - ((p : ℝ) ^ Fintype.card ι)⁻¹) := sorry

open Classical in
/-- The finite-level local density `σ(a; Q) = Q^{-n} #{b ∈ R_{n+1}(Q) : f_a(b) ≡ 0 mod Q}`. -/
noncomputable def localDensity {n d : ℕ} (Q : ℕ) [NeZero Q] (a : CoeffVec (ZMod Q) n d) : ℝ :=
  ((Q : ℝ) ^ n)⁻¹ *
    ((primitiveVectors (Fin (n + 1)) Q).filter fun b => eval b (form a) = 0).card

theorem localDensity_nonneg {n d : ℕ} (Q : ℕ) [NeZero Q] (a : CoeffVec (ZMod Q) n d) :
    0 ≤ localDensity Q a := sorry

theorem localDensity_le {n d : ℕ} (Q : ℕ) [NeZero Q] (a : CoeffVec (ZMod Q) n d) :
    localDensity Q a ≤ Q := sorry

/-- Chinese remainder theorem: `σ(a; Q₁Q₂) = σ(a; Q₁) σ(a; Q₂)` for coprime moduli. -/
theorem localDensity_mul {n d : ℕ} (Q₁ Q₂ : ℕ) [NeZero Q₁] [NeZero Q₂] (h : Nat.Coprime Q₁ Q₂)
    (a : CoeffVec ℤ n d) :
    haveI : NeZero (Q₁ * Q₂) := ⟨Nat.mul_ne_zero (NeZero.ne Q₁) (NeZero.ne Q₂)⟩
    localDensity (Q₁ * Q₂) (fun m => (a m : ZMod (Q₁ * Q₂))) =
      localDensity Q₁ (fun m => (a m : ZMod Q₁)) * localDensity Q₂ (fun m => (a m : ZMod Q₂)) :=
  sorry

theorem localDensity_pos_iff {n d : ℕ} (Q : ℕ) [NeZero Q] (a : CoeffVec (ZMod Q) n d) :
    0 < localDensity Q a ↔ ∃ b ∈ primitiveVectors (Fin (n + 1)) Q, eval b (form a) = 0 := sorry

theorem localDensity_smul_unit {n d : ℕ} (Q : ℕ) [NeZero Q] (u : (ZMod Q)ˣ)
    (a : CoeffVec (ZMod Q) n d) : localDensity Q ((u : ZMod Q) • a) = localDensity Q a := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.localDensity.test_modulus_one`: at `Q = 1`
every density is `1`. -/
example {n d : ℕ} (a : CoeffVec (ZMod 1) n d) : localDensity 1 a = 1 := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.localDensity.test_linear`: for `f = X₀` in two
variables and `Q = 5`, `σ = 4/5` (zeros `(0, b₁)` with `b₁` a unit). -/
example : localDensity (n := 1) (d := 1) 5
    (fun m => if (m : Fin 2 →₀ ℕ) = Finsupp.single 0 1 then 1 else 0) = 4 / 5 := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.localDensity.test_exceeds_one`: `σ` is a
normalized count, not a probability: for `f = X₀²` in two variables and `Q = 9`, `σ = 2`. -/
example : localDensity (n := 1) (d := 2) 9
    (fun m => if (m : Fin 2 →₀ ℕ) = Finsupp.single 0 2 then 1 else 0) = 2 := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.localDensity.test_anisotropic`: the form
`X₀² + X₁²` has no primitive zero modulo `3`, so `σ = 0` there. -/
example : localDensity (n := 1) (d := 2) 3
    (fun m => if (m : Fin 2 →₀ ℕ) = Finsupp.single 0 2 ∨ (m : Fin 2 →₀ ℕ) = Finsupp.single 1 2
      then 1 else 0) = 0 := sorry

/-! ### Perturbation and first-order Taylor congruences -/

theorem eval_add_sub_mem_span {R σ : Type*} [CommRing R] (f : MvPolynomial σ R) (x h : σ → R) :
    eval (x + h) f - eval x f ∈ Ideal.span (Set.range h) := sorry

theorem eval_add_sub_sub_mem_span_mul {R σ : Type*} [CommRing R] [Fintype σ]
    (f : MvPolynomial σ R) (x h : σ → R) :
    eval (x + h) f - eval x f - ∑ i, h i * eval x (pderiv i f) ∈
      Ideal.span (Set.range fun ij : σ × σ => h ij.1 * h ij.2) := sorry

/-! ### First and second moments of the local density -/

/-- Lemma 5.4 of Browning–Le Boudec–Sawin (exact form, `d ≥ 1`). -/
theorem localDensity_firstMoment (p r n d : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (hd : 1 ≤ d) :
    (∑ a ∈ primitiveVectors (Monomials n d) (p ^ r), localDensity (p ^ r) a) /
        (primitiveVectors (Monomials n d) (p ^ r)).card =
      (1 - ((p : ℝ) ^ (n + 1))⁻¹) * (1 - ((p : ℝ) ^ ((Monomials n d).card - 1))⁻¹) /
        (1 - ((p : ℝ) ^ (Monomials n d).card)⁻¹) := sorry

open Classical in
/-- The capped `p`-adic valuation of a vector modulo `p^r`: the largest `e ≤ r` with `v ≡ 0 mod p^e`. -/
noncomputable def vecValuation (p r : ℕ) {ι : Type*} [Fintype ι] (v : ι → ZMod (p ^ r)) : ℕ :=
  Nat.findGreatest (fun e => ∀ i, p ^ e ∣ (v i).val) r

/-- The `2 × 2` minors `u_i v_j - u_j v_i` of a pair of vectors. -/
def minors {R ι : Type*} [CommRing R] (u v : ι → R) : ι × ι → R :=
  fun ij => u ij.1 * v ij.2 - u ij.2 * v ij.1

theorem vecValuation_le (p r : ℕ) {ι : Type*} [Fintype ι] (v : ι → ZMod (p ^ r)) :
    vecValuation p r v ≤ r := sorry

theorem vecValuation_eq_iff (p r : ℕ) [Fact p.Prime] {ι : Type*} [Fintype ι]
    (v : ι → ZMod (p ^ r)) (e : ℕ) (he : e < r) :
    vecValuation p r v = e ↔ (∀ i, p ^ e ∣ (v i).val) ∧ ∃ i, ¬ p ^ (e + 1) ∣ (v i).val := sorry

/-- Two-point incidence count (5.13), in the uniform form without a collinearity case split. -/
theorem card_incidence_two_points (p r n d : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (hd : 1 ≤ d)
    (hn : 1 ≤ n) (b₁ b₂ : Fin (n + 1) → ZMod (p ^ r))
    (h₁ : b₁ ∈ primitiveVectors (Fin (n + 1)) (p ^ r))
    (h₂ : b₂ ∈ primitiveVectors (Fin (n + 1)) (p ^ r)) :
    (((primitiveVectors (Monomials n d) (p ^ r)).filter fun a =>
        eval b₁ (form a) = 0 ∧ eval b₂ (form a) = 0).card : ℤ) =
      (p : ℤ) ^ (r * ((Monomials n d).card - 2) +
          vecValuation p r (minors (veronese d b₁) (veronese d b₂))) -
        (p : ℤ) ^ ((r - 1) * ((Monomials n d).card - 2) +
          min (vecValuation p r (minors (veronese d b₁) (veronese d b₂))) (r - 1)) := sorry

/-- The Veronese map preserves the minor valuation of a pair of primitive vectors. -/
theorem vecValuation_minors_veronese (p r n d : ℕ) [Fact p.Prime] (hd : 1 ≤ d)
    (b₁ b₂ : Fin (n + 1) → ZMod (p ^ r))
    (h₁ : b₁ ∈ primitiveVectors (Fin (n + 1)) (p ^ r))
    (h₂ : b₂ ∈ primitiveVectors (Fin (n + 1)) (p ^ r)) :
    vecValuation p r (minors (veronese d b₁) (veronese d b₂)) =
      vecValuation p r (minors b₁ b₂) := sorry

/-- (5.14): the sum over pairs of primitive vectors of `gcd(G(b₁, b₂), p^r)`. -/
theorem sum_primitive_pairs_minorGcd_le (p r n : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (hn : 2 ≤ n) :
    ∑ b₁ ∈ primitiveVectors (Fin (n + 1)) (p ^ r), ∑ b₂ ∈ primitiveVectors (Fin (n + 1)) (p ^ r),
        (p : ℝ) ^ vecValuation p r (minors b₁ b₂) ≤
      (p : ℝ) ^ (2 * r * (n + 1)) * ((1 - ((p : ℝ) ^ (n + 1))⁻¹) ^ 2 + 2 * ((p : ℝ) ^ (n - 1))⁻¹) :=
  sorry

/-- (5.15), upper bound: the second moment of `σ(·; p^r)`. -/
theorem localDensity_secondMoment_le (p r n d : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (hd : 1 ≤ d)
    (hn : 2 ≤ n) :
    ∑ a ∈ primitiveVectors (Monomials n d) (p ^ r), localDensity (p ^ r) a ^ 2 ≤
      (p : ℝ) ^ (r * (Monomials n d).card) *
        ((1 - ((p : ℝ) ^ (n + 1))⁻¹) ^ 2 + 2 * ((p : ℝ) ^ (n - 1))⁻¹) := sorry

/-- Lemma 5.5 of Browning–Le Boudec–Sawin, with an explicit constant. -/
theorem localDensity_variance_le (p r n d : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (hd : 1 ≤ d)
    (hn : 2 ≤ n) :
    (∑ a ∈ primitiveVectors (Monomials n d) (p ^ r), (localDensity (p ^ r) a - 1) ^ 2) /
        (primitiveVectors (Monomials n d) (p ^ r)).card ≤ 4 * ((p : ℝ) ^ (n - 1))⁻¹ := sorry

/-! ### Gradient strata -/

/-- The gradient `∇f(x) = (∂f/∂X_i (x))_i`. -/
noncomputable def grad {R : Type*} [CommRing R] {n : ℕ} (f : MvPolynomial (Fin (n + 1)) R)
    (x : Fin (n + 1) → R) : Fin (n + 1) → R :=
  fun i => eval x (pderiv i f)

open Classical in
/-- The gradient stratum `R^{(e)}_{N}(p^r)` of (5.17): primitive coefficient vectors `a` for which
`f_a` has a primitive zero `x` modulo `p^r` with `v_p(∇f_a(x)) = e` (valuation capped at `r`). -/
noncomputable def gradientStratum (p r e n d : ℕ) [Fact p.Prime] :
    Finset (CoeffVec (ZMod (p ^ r)) n d) :=
  (primitiveVectors (Monomials n d) (p ^ r)).filter fun a =>
    ∃ x ∈ primitiveVectors (Fin (n + 1)) (p ^ r),
      eval x (form a) = 0 ∧ vecValuation p r (grad (form a) x) = e

theorem gradientStratum_subset (p r e n d : ℕ) [Fact p.Prime] :
    gradientStratum p r e n d ⊆ primitiveVectors (Monomials n d) (p ^ r) := sorry

/-- (5.18): the strata `e = 0, …, r` cover the locally soluble coefficient vectors. -/
theorem mem_biUnion_gradientStratum_iff (p r n d : ℕ) [Fact p.Prime]
    (a : CoeffVec (ZMod (p ^ r)) n d) :
    a ∈ (Finset.range (r + 1)).biUnion (fun e => gradientStratum p r e n d) ↔
      a ∈ primitiveVectors (Monomials n d) (p ^ r) ∧
        ∃ x ∈ primitiveVectors (Fin (n + 1)) (p ^ r), eval x (form a) = 0 := sorry

theorem gradientStratum_eq_empty_of_lt (p r e n d : ℕ) [Fact p.Prime] (he : r < e) :
    gradientStratum p r e n d = ∅ := sorry

theorem gradientStratum_smul_unit (p r e n d : ℕ) [Fact p.Prime] (u : (ZMod (p ^ r))ˣ)
    (a : CoeffVec (ZMod (p ^ r)) n d) :
    (u : ZMod (p ^ r)) • a ∈ gradientStratum p r e n d ↔ a ∈ gradientStratum p r e n d := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.gradientStratum.test_linear_empty`: linear forms
have primitive (hence unit) gradient, so the strata with `e ≥ 1` are empty. -/
example (p r n : ℕ) [Fact p.Prime] (hr : 1 ≤ r) : gradientStratum p r 1 n 1 = ∅ := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.gradientStratum.test_linear_full`: every primitive
linear form in at least two variables has a primitive zero with unit gradient. -/
example (p r n : ℕ) [Fact p.Prime] (hr : 1 ≤ r) (hn : 1 ≤ n) :
    gradientStratum p r 0 n 1 = primitiveVectors (Monomials n 1) (p ^ r) := sorry

/-- Unit test `ArithmeticStatistics.FormDensity.gradientStratum.test_overlap`: the strata are not
disjoint: `f = X₀X₁` in three variables has the zero `(1,0,0)` with gradient `(0,1,0)` (valuation
`0`) and the zero `(0,0,1)` with gradient `0` (valuation capped at `r = 2`), so it lies in both
`R^{(0)}(9)` and `R^{(2)}(9)`. -/
example : (fun m : Monomials 2 2 =>
      if (m : Fin 3 →₀ ℕ) = Finsupp.single 0 1 + Finsupp.single 1 1 then (1 : ZMod (3 ^ 2)) else 0) ∈
        gradientStratum 3 2 0 2 2 ∧
    (fun m : Monomials 2 2 =>
      if (m : Fin 3 →₀ ℕ) = Finsupp.single 0 1 + Finsupp.single 1 1 then (1 : ZMod (3 ^ 2)) else 0) ∈
        gradientStratum 3 2 2 2 2 := sorry

/-- Lemma 5.6 of Browning–Le Boudec–Sawin: high gradient valuation is rare. -/
theorem card_gradientStratum_le (p r e n d : ℕ) [Fact p.Prime] (he : 1 ≤ e) (her : e ≤ r)
    (hd : 1 ≤ d) (hn : 1 ≤ n) :
    ((gradientStratum p r e n d).card : ℝ) ≤ 2 * (p : ℝ) ^ (r * (Monomials n d).card - e) := sorry

/-! ### Hensel lifting at a fixed gradient valuation and the lower bound for `σ` -/

open Classical in
/-- The set `R_δ(p^m, A; p^ℓ)` of Browning–Matthiesen (Lemma 3.3). -/
noncomputable def liftSet (p : ℕ) {s : ℕ} (F : MvPolynomial (Fin s) ℤ) (A : ℤ) (a : Fin s → ℤ)
    (m ℓ δ : ℕ) [NeZero (p ^ m)] : Finset (Fin s → ZMod (p ^ m)) :=
  Finset.univ.filter fun t =>
    aeval t F = (A : ZMod (p ^ m)) ∧
      vecValuation p m (fun i => aeval t (pderiv i F)) = δ ∧
      ∀ i, ((t i).val : ℤ) ≡ a i [ZMOD (p : ℤ) ^ ℓ]

/-- Browning–Matthiesen, Lemma 3.3: lifting at a fixed gradient valuation `δ`. -/
theorem card_liftSet_succ (p : ℕ) [Fact p.Prime] {s : ℕ} (F : MvPolynomial (Fin s) ℤ) (A k : ℤ)
    (a : Fin s → ℤ) (m ℓ δ : ℕ) (hm : 2 * δ + 1 ≤ m) (hδ : δ + ℓ ≤ m) :
    ((liftSet p F A a m ℓ δ).card : ℝ) / (p : ℝ) ^ (m * (s - 1)) =
      (liftSet p F (A + k * (p : ℤ) ^ m) a (m + 1) ℓ δ).card / (p : ℝ) ^ ((m + 1) * (s - 1)) :=
  sorry

/-- Lemma 5.7 of Browning–Le Boudec–Sawin: `σ(a; p^r) ≥ p^{-(e+1)n}` on the stratum `R^{(e)}`. -/
theorem localDensity_ge_of_mem_gradientStratum (p r e n d : ℕ) [Fact p.Prime]
    (a : CoeffVec (ZMod (p ^ r)) n d) (ha : a ∈ gradientStratum p r e n d) :
    ((p : ℝ) ^ ((e + 1) * n))⁻¹ ≤ localDensity (p ^ r) a := sorry

end FormDensity

namespace AbelianVarietyStatistics

open MeasureTheory ProbabilityTheory

/-! ### Convex concentration (Lipnowski–Tsimerman, Lemma 5.9) and model-count concentration -/

/-- Lipnowski–Tsimerman, Lemma 5.9. -/
theorem sum_sq_le_of_le_mul {k : ℕ} (g ε : ℝ) (x : Fin k → ℝ) (hε₁ : 1 / 2 < ε) (hε₂ : ε < 1)
    (hx : ∀ i, 0 ≤ x i ∧ x i ≤ ε * g) (hsum : ∑ i, x i = g) :
    ∑ i, x i ^ 2 ≤ (ε ^ 2 + (1 - ε) ^ 2) * g ^ 2 := sorry

/-- The numerical core of the corrected Proposition 5.10: blocks `(k_j, n_j)` with
`∑ k_j n_j = g` and no block with `k_j = 1`, `n_j ≥ 0.99 g` have
`(1/2) ∑ k_j n_j² log n_j + C g² < 0.495 g² log g` once `g` is large. -/
theorem weighted_square_concentration (C : ℝ) :
    ∃ g₀ : ℕ, ∀ g ≥ g₀, ∀ (m : ℕ) (k n : Fin m → ℕ), (∀ j, 1 ≤ k j ∧ 1 ≤ n j) →
      ∑ j, k j * n j = g → (∀ j, k j = 1 → (n j : ℝ) < 0.99 * g) →
        (1 / 2) * ∑ j, (k j : ℝ) * (n j : ℝ) ^ 2 * Real.log (n j) + C * (g : ℝ) ^ 2 <
          0.495 * (g : ℝ) ^ 2 * Real.log g := sorry

/-! ### Kolmogorov distance -/

/-- The Kolmogorov distance `sup_x |F_μ(x) - F_ν(x)|` between two probability measures on `ℝ`. -/
noncomputable def kolmogorovDist (μ ν : Measure ℝ) : ℝ :=
  ⨆ x : ℝ, |cdf μ x - cdf ν x|

theorem kolmogorovDist_nonneg (μ ν : Measure ℝ) : 0 ≤ kolmogorovDist μ ν := sorry

theorem kolmogorovDist_comm (μ ν : Measure ℝ) : kolmogorovDist μ ν = kolmogorovDist ν μ := sorry

theorem kolmogorovDist_le_one (μ ν : Measure ℝ) : kolmogorovDist μ ν ≤ 1 := sorry

theorem abs_cdf_sub_le_kolmogorovDist (μ ν : Measure ℝ) (x : ℝ) :
    |cdf μ x - cdf ν x| ≤ kolmogorovDist μ ν := sorry

theorem kolmogorovDist_triangle (μ ν ρ : Measure ℝ) :
    kolmogorovDist μ ρ ≤ kolmogorovDist μ ν + kolmogorovDist ν ρ := sorry

theorem kolmogorovDist_eq_zero_iff (μ ν : Measure ℝ) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] : kolmogorovDist μ ν = 0 ↔ μ = ν := sorry

/-- Unit test `ArithmeticStatistics.AbelianVarietyStatistics.kolmogorovDist.test_self`: the
distance from a measure to itself is zero. -/
example (μ : Measure ℝ) : kolmogorovDist μ μ = 0 := sorry

/-- Unit test `ArithmeticStatistics.AbelianVarietyStatistics.kolmogorovDist.test_diracs`: two
distinct point masses are at distance one. -/
example : kolmogorovDist (Measure.dirac 0) (Measure.dirac 1) = 1 := sorry

/-- Unit test `ArithmeticStatistics.AbelianVarietyStatistics.kolmogorovDist.test_mixture`: the
mixture `½δ₀ + ½δ₁` is at distance `½` from `δ₀`, so the distance is not a total-variation
indicator of inequality. -/
example : kolmogorovDist ((1 / 2 : ENNReal) • Measure.dirac 0 + (1 / 2 : ENNReal) • Measure.dirac 1)
    (Measure.dirac 0) = 1 / 2 := sorry

/-- A lower bound from an atom at `0`. -/
theorem sub_le_kolmogorovDist_of_Iic (μ ν : Measure ℝ) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (x : ℝ) :
    μ.real (Set.Iic x) - ν.real (Set.Iic x) ≤ kolmogorovDist μ ν := sorry

/-! ### Normalized eigenangle spacing measures -/

/-- The cyclic gaps of a finite multiset of angles in `[0, 2π)`: consecutive differences of the
sorted list, together with the wrap-around gap. -/
noncomputable def cyclicGaps (θ : Multiset ℝ) : List ℝ :=
  match θ.sort (· ≤ ·) with
  | [] => []
  | a :: l => List.zipWith (fun x y => y - x) (a :: l) (l ++ [a + 2 * Real.pi])

/-- The normalized spacing measure `(1/N) ∑ δ_{(N/2π)·gap}` of `N` angles. -/
noncomputable def spacingMeasure (θ : Multiset ℝ) : Measure ℝ :=
  ((Multiset.card θ : ENNReal))⁻¹ •
    ((cyclicGaps θ).map fun t => Measure.dirac ((Multiset.card θ : ℝ) / (2 * Real.pi) * t)).sum

/-- The eigenangles in `[0, 2π)` of the complex roots of an integral polynomial, with multiplicity. -/
noncomputable def eigenangles (P : Polynomial ℤ) : Multiset ℝ :=
  (P.map (Int.castRingHom ℂ)).roots.map fun z => toIcoMod Real.two_pi_pos 0 (Complex.arg z)

theorem length_cyclicGaps (θ : Multiset ℝ) : (cyclicGaps θ).length = Multiset.card θ := sorry

theorem cyclicGaps_nonneg (θ : Multiset ℝ) (hθ : ∀ t ∈ θ, 0 ≤ t ∧ t < 2 * Real.pi) :
    ∀ t ∈ cyclicGaps θ, 0 ≤ t := sorry

theorem sum_cyclicGaps (θ : Multiset ℝ) (hθ : θ ≠ 0) : (cyclicGaps θ).sum = 2 * Real.pi := sorry

theorem spacingMeasure_univ (θ : Multiset ℝ) (hθ : θ ≠ 0) : spacingMeasure θ Set.univ = 1 := sorry

theorem spacingMeasure_Iio_zero (θ : Multiset ℝ) (hθ : ∀ t ∈ θ, 0 ≤ t ∧ t < 2 * Real.pi) :
    spacingMeasure θ (Set.Iio 0) = 0 := sorry

theorem card_eigenangles (P : Polynomial ℤ) (hP : P ≠ 0) :
    Multiset.card (eigenangles P) = P.natDegree := sorry

/-- Unit test `ArithmeticStatistics.AbelianVarietyStatistics.spacingMeasure.test_equal_angles`:
`N` equal angles give `N − 1` zero gaps, so mass `(N−1)/N` at `0` (here `N = 4`). -/
example : spacingMeasure {1, 1, 1, 1} {0} = 3 / 4 := sorry

/-- Unit test `ArithmeticStatistics.AbelianVarietyStatistics.spacingMeasure.test_wraparound`:
the wrap-around gap is counted: the angles `{0, π}` have two gaps of length `π`, so the measure is
`δ₁`. -/
example : spacingMeasure {0, Real.pi} = Measure.dirac 1 := sorry

/-- Unit test `ArithmeticStatistics.AbelianVarietyStatistics.spacingMeasure.test_multiplicity`:
repeated angles are not deduplicated: `{0, 0, π, π}` has zero-gap mass `1/2`, whereas the set
`{0, π}` has none. -/
example : spacingMeasure {0, 0, Real.pi, Real.pi} {0} = 1 / 2 ∧
    spacingMeasure {0, Real.pi} {0} = 0 := sorry

/-- Unit test `ArithmeticStatistics.AbelianVarietyStatistics.eigenangles.test_supersingular`: for
`x² + p` the eigenangles are `π/2` and `3π/2` (here `p = 5`). -/
example : eigenangles (Polynomial.X ^ 2 + Polynomial.C 5) = {Real.pi / 2, 3 * Real.pi / 2} := sorry

/-- Zero-gap mass from repeated angles: two distinct values of multiplicity at least `h` among `N`
angles force mass at least `2(h−1)/N` at `0` (correction of Lipnowski–Tsimerman, Corollary 5.14). -/
theorem two_mul_sub_one_div_le_spacingMeasure_zero (θ : Multiset ℝ) (s t : ℝ) (hst : s ≠ t)
    (h : ℕ) (hs : h ≤ θ.count s) (ht : h ≤ θ.count t) (hθ : ∀ u ∈ θ, 0 ≤ u ∧ u < 2 * Real.pi) :
    (2 * (h - 1 : ℝ)) / Multiset.card θ ≤ (spacingMeasure θ).real {0} := sorry

/-- One value of multiplicity at least `h` forces mass at least `(h−1)/N` at `0`. -/
theorem sub_one_div_le_spacingMeasure_zero (θ : Multiset ℝ) (s : ℝ) (h : ℕ) (hs : h ≤ θ.count s)
    (hθ : ∀ u ∈ θ, 0 ≤ u ∧ u < 2 * Real.pi) :
    ((h - 1 : ℝ)) / Multiset.card θ ≤ (spacingMeasure θ).real {0} := sorry

end AbelianVarietyStatistics

end ArithmeticStatistics


/-!
## Part B: function-field analogues

This part covers the function-field items of `ArithmeticStatistics:ST.5`: the quadratic families
over `F_q(t)`, class-group surjection pairs, the empirical law of `ℓ`-primary class groups and its
degree densities, Ellenberg–Venkatesh–Westerland's Theorem 8.8 and Theorem 1.2, the symplectic
linear algebra of their Lemma 8.9, the convergence mode of Wood's nonabelian moments with the
component-profile bookkeeping, and Liu–Wood–Zureick-Brown's section count.

Omitted, because the pinned Mathlib cannot state them: statements about étale cohomology, Hurwitz
schemes, Jacobians of families, monodromy representations and Galois groups of function fields
(`hyperelliptic-torsion-local-system`, `geometric-generic-fibre-of-the-unmarked-hurwitz-cover`,
`hyperelliptic-boundary-degeneration`, the monodromy theorems, `monodromy-orbits-and-rational-components`,
`one-rational-geometric-component`, `involution-quotient-of-the-unramified-pro-l-group`,
`hurwitz-points-classify-class-group-surjections`, `factor-two-point-count-identity`,
`top-cohomology-counts-rational-components`, Wood's per-component and normalised moments,
`surjections-onto-a-semidirect-product`, LWZB Lemma 9.3, Theorem 1.4 and Corollary 1.5). The
primary decomposition and normal-form lemmas of EVW Lemma 8.9 are stated only through their
consequence `unique_similitude_stable_orbit`.
-/


namespace ArithmeticStatistics
open Polynomial Filter Topology

/-! ### Quadratic families over `F_q(t)` -/

section Families

variable (Fq : Type*) [Field Fq]

/-- Squarefree polynomials of exact degree `n`. -/
def squarefreePolysOfDegree (n : ℕ) : Set Fq[X] :=
  {f | Squarefree f ∧ f.natDegree = n}

/-- Monic squarefree polynomials of exact degree `n`. -/
def monicSquarefreePolysOfDegree (n : ℕ) : Set Fq[X] :=
  {f | f.Monic ∧ Squarefree f ∧ f.natDegree = n}

/-- The square-class relation `f ~ u² f`, `u ∈ F_q^×`. -/
def squareClassSetoid (n : ℕ) : Setoid (squarefreePolysOfDegree Fq n) where
  r f g := ∃ u : Fqˣ, (g : Fq[X]) = C ((u : Fq) ^ 2) * f
  iseqv := sorry

/-- The family `S_n = P_n/(F_q^×)²` of quadratic extensions `F_q(t)(√f)`. -/
def quadraticFamily (n : ℕ) : Type _ :=
  Quotient (squareClassSetoid Fq n)

/-- The polynomial `y² − f` over the rational function field. -/
noncomputable def quadraticPoly (f : Fq[X]) : (RatFunc Fq)[X] :=
  X ^ 2 - C (algebraMap Fq[X] (RatFunc Fq) f)

/-- The quadratic extension `L_f = F_q(t)[y]/(y² − f)`. -/
abbrev quadraticFunctionField (f : Fq[X]) : Type _ :=
  AdjoinRoot (quadraticPoly Fq f)

variable {Fq}

theorem irreducible_quadraticPoly {f : Fq[X]} (hf : Squarefree f) (hodd : Odd f.natDegree) :
    Irreducible (quadraticPoly Fq f) := sorry

theorem quadraticFamily_mk_eq_iff {n : ℕ} (f g : squarefreePolysOfDegree Fq n) :
    (Quotient.mk (squareClassSetoid Fq n) f = Quotient.mk (squareClassSetoid Fq n) g) ↔
      ∃ u : Fqˣ, (g : Fq[X]) = C ((u : Fq) ^ 2) * f := sorry

theorem card_quadraticFamily_fiber [Fintype Fq] (hq : Odd (Fintype.card Fq)) {n : ℕ}
    (x : quadraticFamily Fq n) :
    Nat.card {f : squarefreePolysOfDegree Fq n // Quotient.mk (squareClassSetoid Fq n) f = x} =
      (Fintype.card Fq - 1) / 2 := sorry

/-- Unit test `ArithmeticStatistics.quadraticFamily.test_card_degree_one`: `|S_1| = 2q` for odd `q`. -/
example [Fintype Fq] (hq : Odd (Fintype.card Fq)) :
    Nat.card (quadraticFamily Fq 1) = 2 * Fintype.card Fq := sorry

/-- Unit test `ArithmeticStatistics.quadraticFamily.test_card_degree_zero`: `|S_0| = 2` for odd `q`. -/
example [Fintype Fq] (hq : Odd (Fintype.card Fq)) : Nat.card (quadraticFamily Fq 0) = 2 := sorry

/-- Unit test `ArithmeticStatistics.quadraticFamily.test_even_q_collapse`: for even `q` the family
has as many elements as there are monic squarefree polynomials of degree `n`. -/
example [Fintype Fq] (hq : Even (Fintype.card Fq)) (n : ℕ) :
    Nat.card (quadraticFamily Fq n) = (monicSquarefreePolysOfDegree Fq n).ncard := sorry

/-- Unit test `ArithmeticStatistics.quadraticFamily.test_monic_rep`: for odd `q`, monic
representatives inject into `S_n` and hit exactly half of it. -/
example [Fintype Fq] (hq : Odd (Fintype.card Fq)) (n : ℕ) :
    Function.Injective (fun f : monicSquarefreePolysOfDegree Fq n =>
      (Quotient.mk (squareClassSetoid Fq n) ⟨f.1, f.2.2.1, f.2.2.2⟩ : quadraticFamily Fq n)) ∧
    2 * (monicSquarefreePolysOfDegree Fq n).ncard = Nat.card (quadraticFamily Fq n) := sorry

/-- The number of monic squarefree polynomials of degree `d ≥ 2` is `q^d − q^{d−1}`. -/
theorem ncard_monicSquarefreePolysOfDegree [Fintype Fq] (d : ℕ) (hd : 2 ≤ d) :
    (monicSquarefreePolysOfDegree Fq d).ncard =
      Fintype.card Fq ^ d - Fintype.card Fq ^ (d - 1) := sorry

theorem ncard_monicSquarefreePolysOfDegree_one [Fintype Fq] :
    (monicSquarefreePolysOfDegree Fq 1).ncard = Fintype.card Fq := sorry

theorem ncard_monicSquarefreePolysOfDegree_zero [Fintype Fq] :
    (monicSquarefreePolysOfDegree Fq 0).ncard = 1 := sorry

/-- EVW (8.7.5), corrected at `n = 1`: `|S_n| = 2(q^n − q^{n−1})` for odd `n ≥ 3`. -/
theorem card_quadraticFamily [Fintype Fq] (hq : Odd (Fintype.card Fq)) (n : ℕ) (hn : Odd n)
    (h3 : 3 ≤ n) :
    Nat.card (quadraticFamily Fq n) = 2 * (Fintype.card Fq ^ n - Fintype.card Fq ^ (n - 1)) :=
  sorry

end Families

/-! ### Class groups and surjection pairs -/

section ClassGroups

variable (Fq : Type*) [Field Fq]

/-- `O_L`: the integral closure of `F_q[t]` in `L_f`. -/
noncomputable def quadraticRingOfIntegers (f : Fq[X]) [Fact (Irreducible (quadraticPoly Fq f))] :
    Subalgebra Fq[X] (quadraticFunctionField Fq f) :=
  integralClosure Fq[X] (quadraticFunctionField Fq f)

/-- The class group `Cl(O_L)`. -/
noncomputable def quadraticClassGroup (f : Fq[X]) [Fact (Irreducible (quadraticPoly Fq f))] :
    Type _ :=
  ClassGroup (quadraticRingOfIntegers Fq f)

noncomputable instance (f : Fq[X]) [Fact (Irreducible (quadraticPoly Fq f))] :
    CommGroup (quadraticClassGroup Fq f) :=
  inferInstanceAs (CommGroup (ClassGroup _))

/-- Pairs `(L, α)` with `α : Cl(O_L) → A` surjective, for fixed `L`. -/
def ClassGroupSurjectionPair (f : Fq[X]) [Fact (Irreducible (quadraticPoly Fq f))]
    (A : Type*) [AddCommGroup A] : Type _ :=
  {α : Additive (quadraticClassGroup Fq f) →+ A // Function.Surjective α}

variable {Fq}

/-- The involution `α ↦ −α` induced by the automorphism of `L/K`. -/
noncomputable def ClassGroupSurjectionPair.neg {f : Fq[X]} [Fact (Irreducible (quadraticPoly Fq f))]
    {A : Type*} [AddCommGroup A] (α : ClassGroupSurjectionPair Fq f A) :
    ClassGroupSurjectionPair Fq f A :=
  ⟨-α.1, sorry⟩

theorem ClassGroupSurjectionPair.neg_ne_self {f : Fq[X]} [Fact (Irreducible (quadraticPoly Fq f))]
    {A : Type*} [AddCommGroup A] [Finite A] [Nontrivial A] (hA : Odd (Nat.card A))
    (α : ClassGroupSurjectionPair Fq f A) : α.neg ≠ α := sorry

variable (Fq) in
/-- The moment `m_A(L_f) = |Sur(Cl(O_L), A)|` (zero if `y² − f` is reducible). -/
noncomputable def classGroupMoment (f : Fq[X]) (A : Type*) [AddCommGroup A] : ℕ := by
  classical
  exact if h : Irreducible (quadraticPoly Fq f) then
    (haveI : Fact (Irreducible (quadraticPoly Fq f)) := ⟨h⟩
     surjCard (Additive (quadraticClassGroup Fq f)) A)
  else 0

theorem classGroupMoment_trivial (f : Fq[X]) (h : Irreducible (quadraticPoly Fq f)) :
    classGroupMoment Fq f PUnit = 1 := sorry

/-- Unit test `ArithmeticStatistics.classGroupMoment.test_trivial`: `m_0(L_f) = 1`. -/
example (f : Fq[X]) (hf : Squarefree f) (hodd : Odd f.natDegree) :
    classGroupMoment Fq f PUnit = 1 := sorry

/-- Unit test `ArithmeticStatistics.ClassGroupSurjectionPair.test_zero_not_surjective`: the zero
map to `Z/3` is not surjective. -/
example (f : Fq[X]) [Fact (Irreducible (quadraticPoly Fq f))] :
    ¬ Function.Surjective (0 : Additive (quadraticClassGroup Fq f) →+ ZMod 3) := sorry

/-- Unit test `ArithmeticStatistics.ClassGroupSurjectionPair.test_neg_involutive`: `neg ∘ neg = id`. -/
example (f : Fq[X]) [Fact (Irreducible (quadraticPoly Fq f))]
    (α : ClassGroupSurjectionPair Fq f (ZMod 3)) : α.neg.neg = α := sorry

/-- Unit test `ArithmeticStatistics.classGroupMoment.test_even`: `m_{Z/3}(L_f)` is even. -/
example [Finite Fq] (f : Fq[X]) (hf : Squarefree f) (hodd : Odd f.natDegree) :
    Even (classGroupMoment Fq f (ZMod 3)) := sorry

end ClassGroups

/-! ### The empirical law of `ℓ`-primary class groups and degree densities -/

section EmpiricalLaw

variable (Fq : Type*) [Field Fq]

/-- `Cl(O_{L_f})_ℓ ≅ A`. -/
def classGroupPrimaryIso (ℓ : ℕ) (f : Fq[X]) (A : FinAbPGroupClass) : Prop :=
  ∃ h : Irreducible (quadraticPoly Fq f),
    haveI : Fact (Irreducible (quadraticPoly Fq f)) := ⟨h⟩
    Nonempty (Additive (CommGroup.primaryComponent (quadraticClassGroup Fq f) ℓ) ≃+ A.toGroup ℓ)

/-- The empirical law `ν_n(A)`, computed over squarefree polynomials of degree `n`. -/
noncomputable def empiricalClassGroupLaw (ℓ n : ℕ) (A : FinAbPGroupClass) : ℝ :=
  ({f | f ∈ squarefreePolysOfDegree Fq n ∧ classGroupPrimaryIso Fq ℓ f A} : Set Fq[X]).ncard /
    (squarefreePolysOfDegree Fq n).ncard

variable {Fq}

theorem empiricalClassGroupLaw_nonneg (ℓ n : ℕ) (A : FinAbPGroupClass) :
    0 ≤ empiricalClassGroupLaw Fq ℓ n A := sorry

theorem hasSum_empiricalClassGroupLaw [Fintype Fq] (hq : Odd (Fintype.card Fq)) (ℓ : ℕ)
    [Fact ℓ.Prime] (n : ℕ) (hn : Odd n) : HasSum (empiricalClassGroupLaw Fq ℓ n) 1 := sorry

theorem empiricalClassGroupLaw_eq_average [Fintype Fq] (hq : Odd (Fintype.card Fq)) (ℓ : ℕ)
    [Fact ℓ.Prime] (n : ℕ) (hn : Odd n) (A : FinAbPGroupClass) :
    surjectionMoment ℓ (fun B => ENNReal.ofReal (empiricalClassGroupLaw Fq ℓ n B)) A =
      ENNReal.ofReal ((∑ᶠ f ∈ squarefreePolysOfDegree Fq n,
          (classGroupMoment Fq f (A.toGroup ℓ) : ℝ)) / (squarefreePolysOfDegree Fq n).ncard) :=
  sorry

/-- Unit test `ArithmeticStatistics.empiricalClassGroupLaw.test_degree_one`: `ν_1` is the Dirac mass
at the trivial group. -/
example [Fintype Fq] (hq : Odd (Fintype.card Fq)) (ℓ : ℕ) [Fact ℓ.Prime] :
    empiricalClassGroupLaw Fq ℓ 1 FinAbPGroupClass.trivial = 1 := sorry

/-- Unit test `ArithmeticStatistics.empiricalClassGroupLaw.test_mass_le_one`: `ν_n(A) ≤ 1`. -/
example (ℓ n : ℕ) (A : FinAbPGroupClass) : empiricalClassGroupLaw Fq ℓ n A ≤ 1 := sorry

/-- Unit test `ArithmeticStatistics.empiricalClassGroupLaw.test_primary_not_whole`: a class group
`Z/2 × Z/3` has `3`-primary part `Z/3`. -/
example (f : Fq[X]) [Fact (Irreducible (quadraticPoly Fq f))]
    (e : Additive (quadraticClassGroup Fq f) ≃+ ZMod 2 × ZMod 3) (A : FinAbPGroupClass)
    (hA : Nonempty (A.toGroup 3 ≃+ ZMod 3)) : classGroupPrimaryIso Fq 3 f A := sorry

/-- The upper density along odd `n`. -/
noncomputable def upperOddDensity (u : ℕ → ℝ) : ℝ :=
  Filter.limsup (fun m => u (2 * m + 1)) atTop

/-- The lower density along odd `n`. -/
noncomputable def lowerOddDensity (u : ℕ → ℝ) : ℝ :=
  Filter.liminf (fun m => u (2 * m + 1)) atTop

theorem lowerOddDensity_le_upperOddDensity (u : ℕ → ℝ) (hb : ∃ C, ∀ n, |u n| ≤ C) :
    lowerOddDensity u ≤ upperOddDensity u := sorry

theorem oddDensities_eq_of_tendsto (u : ℕ → ℝ) (c : ℝ)
    (h : Tendsto (fun m => u (2 * m + 1)) atTop (𝓝 c)) :
    upperOddDensity u = c ∧ lowerOddDensity u = c := sorry

variable (Fq) in
/-- `δ⁺(q, A)`. -/
noncomputable def upperClassGroupDensity (ℓ : ℕ) (A : FinAbPGroupClass) : ℝ :=
  upperOddDensity (fun n => empiricalClassGroupLaw Fq ℓ n A)

variable (Fq) in
/-- `δ⁻(q, A)`. -/
noncomputable def lowerClassGroupDensity (ℓ : ℕ) (A : FinAbPGroupClass) : ℝ :=
  lowerOddDensity (fun n => empiricalClassGroupLaw Fq ℓ n A)

/-- Unit test `ArithmeticStatistics.upperOddDensity.test_const`: constant sequences. -/
example (c : ℝ) : upperOddDensity (fun _ => c) = c ∧ lowerOddDensity (fun _ => c) = c := sorry

/-- Unit test `ArithmeticStatistics.upperOddDensity.test_alternating`: `(−1)^{(n−1)/2}` has upper odd
density `1` and lower odd density `−1`. -/
example : upperOddDensity (fun n => (-1 : ℝ) ^ ((n - 1) / 2)) = 1 ∧
    lowerOddDensity (fun n => (-1 : ℝ) ^ ((n - 1) / 2)) = -1 := sorry

/-- Unit test `ArithmeticStatistics.upperOddDensity.test_even_ignored`: values at even `n` are
irrelevant. -/
example (u v : ℕ → ℝ) (h : ∀ n, Odd n → u n = v n) : upperOddDensity u = upperOddDensity v :=
  sorry

end EmpiricalLaw

/-! ### EVW Theorem 8.8 and Theorem 1.2 -/

/-- The numerical core of the uniform trace estimate (EVW (8.8.3)). -/
theorem trace_error_bound (q C : ℝ) (hC : 1 ≤ C) (hq : C < Real.sqrt q) (n : ℕ) (t : ℕ → ℝ)
    (ht : ∀ j < 2 * n, |t j| ≤ Real.sqrt q ^ j * C ^ (2 * n - j + 1)) :
    |(Real.sqrt q)⁻¹ ^ (2 * n) * ∑ j ∈ Finset.range (2 * n), (-1 : ℝ) ^ j * t j| ≤
      C ^ 2 / (Real.sqrt q - C) := sorry

/-- EVW Theorem 8.8 (domain as corrected: odd `q`, `ℓ ∤ q(q − 1)`). -/
theorem evw_uniform_moment_estimate (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (A : FinAbPGroupClass) :
    ∃ B : ℝ, ∀ (Fq : Type) [Field Fq] [Fintype Fq], Odd (Fintype.card Fq) →
      ¬ ℓ ∣ Fintype.card Fq → ¬ ℓ ∣ Fintype.card Fq - 1 → B < Real.sqrt (Fintype.card Fq) →
      ∀ n : ℕ, Odd n → B < n →
        |(∑ᶠ f ∈ squarefreePolysOfDegree Fq n, (classGroupMoment Fq f (A.toGroup ℓ) : ℝ)) /
            (squarefreePolysOfDegree Fq n).ncard - 1| ≤ B / Real.sqrt (Fintype.card Fq) := sorry

/-- EVW Theorem 1.2: `δ^±(q, A) → μ_CL(A)` as `q → ∞` along odd `q` with `ℓ ∤ q(q − 1)`. -/
theorem large_q_cohen_lenstra (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (A : FinAbPGroupClass)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ Q : ℕ, ∀ (Fq : Type) [Field Fq] [Fintype Fq], Q < Fintype.card Fq →
      Odd (Fintype.card Fq) → ¬ ℓ ∣ Fintype.card Fq → ¬ ℓ ∣ Fintype.card Fq - 1 →
        |upperClassGroupDensity Fq ℓ A - (cohenLenstraWeight ℓ 0 A).toReal| ≤ ε ∧
        |lowerClassGroupDensity Fq ℓ A - (cohenLenstraWeight ℓ 0 A).toReal| ≤ ε := sorry

/-- Positive proportions of class numbers prime to `ℓ` and divisible by `ℓ`. -/
theorem positive_proportions_class_numbers (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) :
    ∃ Q : ℕ, ∀ (Fq : Type) [Field Fq] [Fintype Fq], Q < Fintype.card Fq →
      Odd (Fintype.card Fq) → ¬ ℓ ∣ Fintype.card Fq → ¬ ℓ ∣ Fintype.card Fq - 1 →
        0 < lowerClassGroupDensity Fq ℓ FinAbPGroupClass.trivial ∧
        upperClassGroupDensity Fq ℓ FinAbPGroupClass.trivial < 1 := sorry

/-! ### The generalized dihedral datum -/

section Dihedral

variable (A : Type*) [AddCommGroup A]

/-- `Z/2` acting on `A` by inversion. -/
def inversionAction : Multiplicative (ZMod 2) →* MulAut (Multiplicative A) where
  toFun k := (MulEquiv.inv (Multiplicative A)) ^ (Multiplicative.toAdd k).val
  map_one' := by simp
  map_mul' := sorry

/-- `G_A = A ⋊ Z/2` with the inversion action. -/
abbrev generalizedDihedral : Type _ :=
  SemidirectProduct (Multiplicative A) (Multiplicative (ZMod 2)) (inversionAction A)

/-- `c_A`: the elements with nontrivial image in `Z/2`. -/
def outsideInvolutions : Set (generalizedDihedral A) :=
  {x | x.right ≠ 1}

variable {A}

theorem mem_outsideInvolutions_iff [Finite A] (hA : Odd (Nat.card A)) (x : generalizedDihedral A) :
    x ∈ outsideInvolutions A ↔ orderOf x = 2 := sorry

theorem outsideInvolutions_isConj [Finite A] (hA : Odd (Nat.card A)) {x y : generalizedDihedral A}
    (hx : x ∈ outsideInvolutions A) (hy : y ∈ outsideInvolutions A) : IsConj x y := sorry

theorem closure_outsideInvolutions : Subgroup.closure (outsideInvolutions A) = ⊤ := sorry

theorem center_generalizedDihedral [Finite A] [Nontrivial A] (hA : Odd (Nat.card A)) :
    Subgroup.center (generalizedDihedral A) = ⊥ := sorry

theorem outsideInvolutions_nonsplitting [Finite A] (hA : Odd (Nat.card A))
    (H : Subgroup (generalizedDihedral A)) :
    (outsideInvolutions A ∩ H = ∅) ∨
      ∀ x ∈ outsideInvolutions A ∩ H, ∀ y ∈ outsideInvolutions A ∩ H, ∃ h ∈ H, h * x * h⁻¹ = y :=
  sorry

/-- Unit test `ArithmeticStatistics.generalizedDihedral.test_card_Z3`: `|G_{Z/3}| = 6`. -/
example : Nat.card (generalizedDihedral (ZMod 3)) = 6 := sorry

/-- Unit test `ArithmeticStatistics.generalizedDihedral.test_trivial_center`: `G_0 = Z/2` is its own
centre. -/
example : Subgroup.center (generalizedDihedral PUnit) = ⊤ := sorry

/-- Unit test `ArithmeticStatistics.generalizedDihedral.test_even_order_nonexample`: for `A = Z/2`
two outside involutions are not conjugate. -/
example : ∃ x ∈ outsideInvolutions (ZMod 2), ∃ y ∈ outsideInvolutions (ZMod 2), ¬ IsConj x y :=
  sorry

/-- Unit test `ArithmeticStatistics.generalizedDihedral.test_involution_order`: for `A = Z/5` the
outside elements have order `2`. -/
example (x : generalizedDihedral (ZMod 5)) (hx : x ∈ outsideInvolutions (ZMod 5)) :
    orderOf x = 2 := sorry

end Dihedral

/-! ### Symplectic similitudes and EVW Lemma 8.9 -/

section Symplectic

variable (l : Type*) [DecidableEq l] [Fintype l] (R : Type*) [CommRing R]

/-- `GSp_m = {h : h J hᵀ = m J}`. -/
def similitudeCoset (m : Rˣ) : Set (Matrix (l ⊕ l) (l ⊕ l) R) :=
  {h | h * Matrix.J l R * h.transpose = (m : R) • Matrix.J l R}

/-- `GSp = ⋃_m GSp_m`. -/
def similitudeGroup : Submonoid (Matrix (l ⊕ l) (l ⊕ l) R) where
  carrier := {h | ∃ m : Rˣ, h ∈ similitudeCoset l R m}
  mul_mem' := sorry
  one_mem' := sorry

variable {l R}

theorem mem_similitudeCoset_iff (m : Rˣ) (h : Matrix (l ⊕ l) (l ⊕ l) R) :
    h ∈ similitudeCoset l R m ↔ h * Matrix.J l R * h.transpose = (m : R) • Matrix.J l R :=
  Iff.rfl

theorem similitudeCoset_one :
    similitudeCoset l R 1 = (Matrix.symplecticGroup l R : Set (Matrix (l ⊕ l) (l ⊕ l) R)) := sorry

theorem similitudeCoset_mul_mem {m m' : Rˣ} {h h' : Matrix (l ⊕ l) (l ⊕ l) R}
    (hh : h ∈ similitudeCoset l R m) (hh' : h' ∈ similitudeCoset l R m') :
    h * h' ∈ similitudeCoset l R (m * m') := sorry

theorem similitudeCoset_map {R' : Type*} [CommRing R'] (φ : R →+* R') {m : Rˣ}
    {h : Matrix (l ⊕ l) (l ⊕ l) R} (hh : h ∈ similitudeCoset l R m) :
    h.map φ ∈ similitudeCoset l R' (Units.map φ.toMonoidHom m) := sorry

/-- Unit test `ArithmeticStatistics.similitudeCoset.test_diag`: `diag(I, qI) ∈ GSp_q` over `Z_ℓ`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (g : ℕ) (q : ℤ_[ℓ]ˣ) :
    Matrix.fromBlocks (1 : Matrix (Fin g) (Fin g) ℤ_[ℓ]) 0 0 ((q : ℤ_[ℓ]) • 1) ∈
      similitudeCoset (Fin g) ℤ_[ℓ] q := sorry

/-- Unit test `ArithmeticStatistics.similitudeCoset.test_neg_one`: `−1 ∈ Sp`. -/
example (g : ℕ) : (-1 : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R) ∈ similitudeCoset (Fin g) R 1 :=
  sorry

/-- Unit test `ArithmeticStatistics.similitudeCoset.test_nonunit_multiplier`: `diag(1, ℓ)` is not a
similitude over `Z_ℓ`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    Matrix.fromBlocks (1 : Matrix (Fin 1) (Fin 1) ℤ_[ℓ]) 0 0 ((ℓ : ℤ_[ℓ]) • 1) ∉
      similitudeGroup (Fin 1) ℤ_[ℓ] := sorry

/-- Surjections `V → A` fixed by some `h ∈ GSp_q(V)`. -/
def stableSurjections (ℓ : ℕ) [Fact ℓ.Prime] (g : ℕ) (A : Type*) [AddCommGroup A]
    (q : ℤ_[ℓ]ˣ) : Set ((Fin g ⊕ Fin g → ℤ_[ℓ]) →+ A) :=
  {f | Function.Surjective f ∧ ∃ h ∈ similitudeCoset (Fin g) ℤ_[ℓ] q,
      f.comp (Matrix.mulVecLin h).toAddMonoidHom = f}

/-- EVW Lemma 8.9. -/
theorem unique_similitude_stable_orbit (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (g : ℕ)
    (A : Type*) [AddCommGroup A] [Finite A] (hA : ∀ a : A, ∃ k : ℕ, ℓ ^ k • a = 0)
    (hgen : ∃ s : Finset A, s.card ≤ g ∧ AddSubgroup.closure (s : Set A) = ⊤)
    (q : ℤ_[ℓ]ˣ) (hq : IsUnit ((q : ℤ_[ℓ]) - 1)) :
    (stableSurjections ℓ g A q).Nonempty ∧
      ∀ f₁ ∈ stableSurjections ℓ g A q, ∀ f₂ ∈ stableSurjections ℓ g A q,
        ∃ s ∈ Matrix.symplecticGroup (Fin g) ℤ_[ℓ],
          f₂ = f₁.comp (Matrix.mulVecLin s).toAddMonoidHom := sorry

/-- `GL_g(Z_ℓ)` acts transitively on surjections `Z_ℓ^g → A`. -/
theorem gl_transitive_on_surjections (ℓ : ℕ) [Fact ℓ.Prime] (g : ℕ) (A : Type*) [AddCommGroup A]
    [Finite A] (hA : ∀ a : A, ∃ k : ℕ, ℓ ^ k • a = 0) (f₁ f₂ : (Fin g → ℤ_[ℓ]) →+ A)
    (h₁ : Function.Surjective f₁) (h₂ : Function.Surjective f₂) :
    ∃ M : Matrix.GeneralLinearGroup (Fin g) ℤ_[ℓ],
      f₂ = f₁.comp (Matrix.mulVecLin (M : Matrix (Fin g) (Fin g) ℤ_[ℓ])).toAddMonoidHom := sorry

/-- Vasiu/Serre: a closed subgroup of `Sp_{2g}(Z_ℓ)` with full image mod `ℓ` is everything, for
`g ≥ 2` or `ℓ ≥ 5`. -/
theorem symplectic_eq_of_closed_of_surj_mod (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (g : ℕ)
    (hg : 2 ≤ g ∨ 5 ≤ ℓ) (H : Submonoid (Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ_[ℓ]))
    (hH : H ≤ Matrix.symplecticGroup (Fin g) ℤ_[ℓ])
    (hclosed : IsClosed (H : Set (Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ_[ℓ])))
    (hsurj : ∀ B ∈ Matrix.symplecticGroup (Fin g) (ZMod ℓ), ∃ h ∈ H, h.map PadicInt.toZMod = B) :
    H = Matrix.symplecticGroup (Fin g) ℤ_[ℓ] := sorry

/-- The exception `(g, ℓ) = (1, 3)`: a proper closed subgroup with full image mod `3`. -/
theorem exists_proper_closed_surj_mod_three :
    ∃ H : Submonoid (Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℤ_[3]),
      H ≤ Matrix.symplecticGroup (Fin 1) ℤ_[3] ∧
      IsClosed (H : Set (Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℤ_[3])) ∧
      (∀ B ∈ Matrix.symplecticGroup (Fin 1) (ZMod 3), ∃ h ∈ H, h.map PadicInt.toZMod = B) ∧
      H ≠ Matrix.symplecticGroup (Fin 1) ℤ_[3] := sorry

end Symplectic

/-! ### Convergence modes and Wood's bad-type assertion -/

section ConvergenceModes

/-- `A_m`: prime powers coprime to `m`, tending to infinity. -/
def allowedPrimePowers (m : ℕ) : Filter ℕ :=
  atTop ⊓ 𝓟 {q | IsPrimePow q ∧ Nat.Coprime q m}

instance allowedPrimePowers_neBot (m : ℕ) : (allowedPrimePowers m).NeBot := sorry

/-- Eventual-degree large-`q` limit. -/
def EventualDegreeLargeQLimit (E : ℕ → ℕ → ℝ) (m : ℕ) (c : ℕ → ℝ) : Prop :=
  ∃ n₀, ∀ n ≥ n₀, Tendsto (fun q => E q n) (allowedPrimePowers m) (𝓝 (c n))

theorem EventualDegreeLargeQLimit.unique {E : ℕ → ℕ → ℝ} {m : ℕ} {c c' : ℕ → ℝ}
    (h : EventualDegreeLargeQLimit E m c) (h' : EventualDegreeLargeQLimit E m c') :
    ∀ᶠ n in atTop, c n = c' n := sorry

theorem EventualDegreeLargeQLimit.mono {E : ℕ → ℕ → ℝ} {m m' : ℕ} {c : ℕ → ℝ} (hm : m ∣ m')
    (h : EventualDegreeLargeQLimit E m c) : EventualDegreeLargeQLimit E m' c := sorry

/-- Unit test `ArithmeticStatistics.EventualDegreeLargeQLimit.test_const`: constant functions. -/
example (m : ℕ) (c : ℕ → ℝ) : EventualDegreeLargeQLimit (fun _ n => c n) m c := sorry

/-- Unit test `ArithmeticStatistics.EventualDegreeLargeQLimit.test_not_fixed_q`: `n/(n + q)` has
large-`q` limit `0` at fixed `n`, but limit `1` in `n` at fixed `q`. -/
example (m : ℕ) :
    EventualDegreeLargeQLimit (fun q n => (n : ℝ) / (n + q)) m (fun _ => 0) ∧
      ∀ q : ℕ, 1 ≤ q → Tendsto (fun n : ℕ => (n : ℝ) / (n + q)) atTop (𝓝 1) := sorry

/-- Unit test `ArithmeticStatistics.allowedPrimePowers.test_mem`: the defining set belongs to `A_m`
and `A_m ≤ atTop`. -/
example (m : ℕ) :
    {q : ℕ | IsPrimePow q ∧ Nat.Coprime q m} ∈ allowedPrimePowers m ∧
      allowedPrimePowers m ≤ atTop := sorry

/-- The printed bad-type limit assertion (Wood 2019, Theorem 4.8), as a proposition. -/
def PrintedBadTypeLimitAssertion (E : ℕ → ℕ → ℝ) (M : ℕ → ℕ) (m N : ℕ) : Prop :=
  ∃ w > (0 : ℝ), ∃ n₀, ∀ n ≥ n₀, ∃ L : ℝ,
    Tendsto (fun q => E q n / M q) (allowedPrimePowers m) (𝓝 L) ∧ w * (n : ℝ) ^ (N - 1) ≤ L

theorem PrintedBadTypeLimitAssertion.liminf_bound {E : ℕ → ℕ → ℝ} {M : ℕ → ℕ} {m N : ℕ}
    (h : PrintedBadTypeLimitAssertion E M m N) :
    ∃ w > (0 : ℝ), ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
      w * (n : ℝ) ^ (N - 1) ≤ Filter.liminf (fun q => E q n / M q) (allowedPrimePowers m) := sorry

theorem PrintedBadTypeLimitAssertion.of_eventually_const {E : ℕ → ℕ → ℝ} {M : ℕ → ℕ} {m N : ℕ}
    (w : ℝ) (hw : 0 < w) (n₀ : ℕ) (r : ℕ → ℝ)
    (h : ∀ n ≥ n₀, (∀ᶠ q in allowedPrimePowers m, E q n / M q = r n) ∧ w * (n : ℝ) ^ (N - 1) ≤ r n) :
    PrintedBadTypeLimitAssertion E M m N := sorry

/-- Unit test `ArithmeticStatistics.PrintedBadTypeLimitAssertion.test_const`: `E = n^{N−1}`. -/
example (m N : ℕ) : PrintedBadTypeLimitAssertion (fun _ n => (n : ℝ) ^ (N - 1)) (fun _ => 1) m N :=
  sorry

/-- Unit test `ArithmeticStatistics.PrintedBadTypeLimitAssertion.test_zero`: `E ≡ 0` fails. -/
example (m : ℕ) : ¬ PrintedBadTypeLimitAssertion (fun _ _ => 0) (fun _ => 1) m 1 := sorry

/-- Unit test `ArithmeticStatistics.PrintedBadTypeLimitAssertion.test_oscillating`: an oscillating
`E` satisfies the liminf bound but not the assertion. -/
example (m N : ℕ) :
    ¬ PrintedBadTypeLimitAssertion
      (fun q n => (n : ℝ) ^ (N - 1) * (if q % 4 = 1 then 3 else 1)) (fun _ => 1) m N := sorry

end ConvergenceModes

/-! ### Component profiles (Wood 2019, §4) -/

section Profiles

/-- The fixed-degree component data: counts `C_m(q)` of Frobenius-fixed geometric components for
multidegrees `m` of total degree `degree`, and the normaliser `M(q) = |H₂(F, c)[q − 1]|`. -/
structure FixedDegreeComponentData (N : ℕ) where
  degree : ℕ
  count : (Fin N → ℕ) → ℕ → ℕ
  normaliser : ℕ → ℕ
  normaliser_pos : ∀ q, 0 < normaliser q

/-- Multidegrees of total degree `d` with every coordinate `≥ N₀`. -/
def stableMultidegrees (N d N₀ : ℕ) : Finset (Fin N → ℕ) :=
  (Finset.Nat.antidiagonalTuple N d).filter (fun m => ∀ i, N₀ ≤ m i)

namespace FixedDegreeComponentData

variable {N : ℕ} (D : FixedDegreeComponentData N)

/-- The whole profile `P(q)`. -/
def profile (q : ℕ) : ℚ :=
  (∑ m ∈ Finset.Nat.antidiagonalTuple N D.degree, (D.count m q : ℚ)) / D.normaliser q

theorem profile_nonneg (q : ℕ) : 0 ≤ D.profile q := sorry

theorem profile_mem_finite (B K : ℕ)
    (hB : ∀ q, ∑ m ∈ Finset.Nat.antidiagonalTuple N D.degree, D.count m q ≤ B)
    (hK : ∀ q, D.normaliser q ≤ K) : ∃ s : Finset ℚ, ∀ q, D.profile q ∈ s := sorry

/-- The stable part `C_stable(q)`. -/
def stableCount (N₀ q : ℕ) : ℕ :=
  ∑ m ∈ stableMultidegrees N D.degree N₀, D.count m q

/-- The boundary remainder `R_boundary(q)`. -/
def boundaryRemainder (N₀ q : ℕ) : ℚ :=
  (∑ m ∈ (Finset.Nat.antidiagonalTuple N D.degree).filter (fun m => ¬ ∀ i, N₀ ≤ m i),
    (D.count m q : ℚ)) / D.normaliser q

theorem profile_eq_stable_add_boundary (N₀ q : ℕ) :
    D.profile q = (D.stableCount N₀ q : ℚ) / D.normaliser q + D.boundaryRemainder N₀ q := sorry

theorem boundaryRemainder_nonneg (N₀ q : ℕ) : 0 ≤ D.boundaryRemainder N₀ q := sorry

end FixedDegreeComponentData

/-- Unit test `ArithmeticStatistics.FixedDegreeComponentData.test_profile_zero`: zero counts give
profile `0`. -/
example (N d : ℕ) (q : ℕ) :
    (FixedDegreeComponentData.mk (N := N) d (fun _ _ => 0) (fun _ => 1) (fun _ => one_pos)).profile q
      = 0 := sorry

/-- Unit test `ArithmeticStatistics.FixedDegreeComponentData.test_profile_single`: `N = 1`, `d = 3`,
count `2`, normaliser `1`. -/
example (q : ℕ) :
    (FixedDegreeComponentData.mk (N := 1) 3 (fun _ _ => 2) (fun _ => 1) (fun _ => one_pos)).profile q
      = 2 := sorry

/-- Unit test `ArithmeticStatistics.FixedDegreeComponentData.test_profile_counts_boundary`: the
profile counts boundary multidegrees. -/
example (q : ℕ) :
    let D := FixedDegreeComponentData.mk (N := 2) 2 (fun m _ => if m = ![2, 0] then 1 else 0)
      (fun _ => 1) (fun _ => one_pos)
    D.profile q = 1 ∧ D.stableCount 1 q = 0 := sorry

/-- Unit test `ArithmeticStatistics.FixedDegreeComponentData.test_boundary_threshold_zero`: with
`N₀ = 0` the boundary remainder vanishes. -/
example (N : ℕ) (D : FixedDegreeComponentData N) (q : ℕ) : D.boundaryRemainder 0 q = 0 := sorry

/-- Unit test `ArithmeticStatistics.stableMultidegrees.test_card`: three stable multidegrees for
`N = 2`, `d = 4`, `N₀ = 1`. -/
example : (stableMultidegrees 2 4 1).card = 3 := sorry

/-- Unit test `ArithmeticStatistics.stableMultidegrees.test_excludes_small`: `(0, 4)` is not stable
for `N₀ = 1`. -/
example : ![0, 4] ∈ Finset.Nat.antidiagonalTuple 2 4 ∧ ![0, 4] ∉ stableMultidegrees 2 4 1 := sorry

/-- The number of multidegrees with prescribed parities, all coordinates `≥ N₀`, total `d`. -/
noncomputable def parityMultidegreeCount (N N₀ d : ℕ) (ε : Fin N → ZMod 2) : ℕ :=
  Nat.card {m : Fin N → ℕ // (∀ i, N₀ ≤ m i ∧ ((m i : ZMod 2) = ε i)) ∧ ∑ i, m i = d}

/-- The stable-range component sum over a set of surviving parity vectors. -/
noncomputable def stableRangeComponentSum (N N₀ d : ℕ) (S : Finset (Fin N → ZMod 2)) : ℕ :=
  ∑ ε ∈ S, parityMultidegreeCount N N₀ d ε

theorem stableRangeComponentSum_empty (N N₀ d : ℕ) : stableRangeComponentSum N N₀ d ∅ = 0 := by
  simp [stableRangeComponentSum]

theorem stableRangeComponentSum_union (N N₀ d : ℕ) (S T : Finset (Fin N → ZMod 2))
    (h : Disjoint S T) :
    stableRangeComponentSum N N₀ d (S ∪ T) =
      stableRangeComponentSum N N₀ d S + stableRangeComponentSum N N₀ d T := sorry

/-- Stars and bars (Wood's parity-vector count, made exact). -/
theorem parityMultidegreeCount_eq (N N₀ d : ℕ) (hN : 1 ≤ N) (ε : Fin N → ZMod 2) :
    parityMultidegreeCount N N₀ d ε =
      let a := ∑ i, (N₀ + if ((N₀ : ZMod 2) = ε i) then 0 else 1)
      if a ≤ d ∧ Even (d - a) then Nat.choose ((d - a) / 2 + N - 1) (N - 1) else 0 := sorry

/-- Unit test `ArithmeticStatistics.stableRangeComponentSum.test_empty`: the empty set of parities. -/
example (N N₀ d : ℕ) : stableRangeComponentSum N N₀ d ∅ = 0 := sorry

/-- Unit test `ArithmeticStatistics.stableRangeComponentSum.test_one_part`: `N = 1`, `N₀ = 0`,
`d = 4`, `S = {0}`. -/
example : stableRangeComponentSum 1 0 4 {fun _ => 0} = 1 := sorry

/-- Unit test `ArithmeticStatistics.stableRangeComponentSum.test_parity_mismatch`: an odd part
cannot have even total. -/
example : stableRangeComponentSum 1 0 4 {fun _ => 1} = 0 := sorry

/-- Many large parity vectors. -/
theorem many_large_parity_vectors (N N₀ : ℕ) (hN : 2 ≤ N) (ε : Fin N → ZMod 2) :
    ∃ v > (0 : ℝ), ∃ d₀ : ℕ, ∀ d : ℕ, d₀ ≤ d → ((d : ZMod 2) = ∑ i, ε i) →
      v * (d : ℝ) ^ (N - 1) ≤ parityMultidegreeCount N N₀ d ε := sorry

/-- The ordinary limit exists iff the finite-valued profile is eventually constant. -/
theorem tendsto_iff_eventually_const_of_close (P : ℕ → ℚ) (s : Finset ℚ) (hs : ∀ q, P q ∈ s)
    (E : ℕ → ℝ) (l : Filter ℕ) [l.NeBot] (hE : Tendsto (fun q => E q - P q) l (𝓝 0)) (L : ℝ) :
    Tendsto E l (𝓝 L) ↔ ∃ r : ℚ, (r : ℝ) = L ∧ ∀ᶠ q in l, P q = r := sorry

/-- Liminf and limsup are the extreme recurrent profile values. -/
theorem liminf_limsup_eq_recurrent (P : ℕ → ℚ) (s : Finset ℚ) (hs : ∀ q, P q ∈ s)
    (E : ℕ → ℝ) (l : Filter ℕ) [l.NeBot] (hE : Tendsto (fun q => E q - P q) l (𝓝 0)) :
    Filter.liminf E l = sInf ((fun r : ℚ => (r : ℝ)) '' {r | r ∈ s ∧ ∃ᶠ q in l, P q = r}) ∧
      Filter.limsup E l = sSup ((fun r : ℚ => (r : ℝ)) '' {r | r ∈ s ∧ ∃ᶠ q in l, P q = r}) :=
  sorry

/-- The weight-polynomial formula for the stable orthant. -/
theorem stableRangeComponentSum_genFun (N N₀ : ℕ) (S : Finset (Fin N → ZMod 2)) :
    (1 - PowerSeries.X ^ 2 : PowerSeries ℤ) ^ N *
        PowerSeries.mk (fun d => (stableRangeComponentSum N N₀ d S : ℤ)) =
      PowerSeries.X ^ (N * N₀) *
        ∑ ε ∈ S, PowerSeries.X ^ (Finset.univ.filter (fun i => ε i ≠ (N₀ : ZMod 2))).card := sorry

end Profiles

/-! ### Sections of coprime split extensions (LWZB Lemma 9.3, abelian case) -/

/-- Complements of a coprime abelian normal subgroup are conjugate. -/
theorem complements_conj_of_coprime_abelian {E : Type*} [Group E] [Finite E] (H : Subgroup E)
    [H.Normal] (hab : ∀ a ∈ H, ∀ b ∈ H, a * b = b * a) (hcop : Nat.Coprime (Nat.card H) H.index)
    (K K' : Subgroup E) (hK : Subgroup.IsComplement' H K) (hK' : Subgroup.IsComplement' H K') :
    ∃ h ∈ H, K' = K.map (MulAut.conj h).toMonoidHom := sorry

end ArithmeticStatistics

end ST5
