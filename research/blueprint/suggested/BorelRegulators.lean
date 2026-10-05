import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.Analytic.Basic
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic

/-!
This file is not the roadmap and is not exhaustive. The packet and reader must
agree before acceptance; REV-BorelRegulators records the pending reader revision.
The statements suggest Lean forms so contributors and reviewers converge on names
and signatures. Every declaration remains unchecked.

The native prototypes below use existing Mathlib carriers. The complete
mathematical signature register at the end supplies every packet name, API
item and unit-test name. Higher K-groups, arithmetic orders, relative Lie
cohomology, plus spaces, and higher Deligne Chern characters lack the required
canonical interfaces at the pins; their signatures remain explicit comments.
No proposition-valued stand-in asserts a missing comparison.

Generic matrix, target and analytic constructions are reusable components.
Their arithmetic specialization requires the genuine regulator, coordinate
equivalences and continuation described in the signature register.
-/

noncomputable section
open scoped BigOperators
open Module MeasureTheory

namespace TauCeti.Borel

def weightParity (j : ℕ) : ℝ := (-1) ^ (j - 1)

/-- Native real-coordinate model of simultaneous conjugation invariants. -/
def archimedeanTarget (S : Type*) (c : S → S) (j : ℕ) : Submodule ℝ (S → ℝ) where
  carrier := {f | ∀ σ, f (c σ) = weightParity j * f σ}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

instance {S : Type*} {c : S → S} {j : ℕ} :
    CoeFun (archimedeanTarget S c j) (fun _ => S → ℝ) := ⟨fun x => x.1⟩

def archimedeanTarget_mk {S : Type*} (c : S → S) (j : ℕ)
    (f : S → ℝ) (hf : ∀ σ, f (c σ) = weightParity j * f σ) :
    archimedeanTarget S c j := ⟨f, hf⟩

theorem archimedeanTarget_ext {S : Type*} {c : S → S} {j : ℕ}
    (x y : archimedeanTarget S c j) (h : ∀ σ, x σ = y σ) : x = y := by sorry

theorem archimedeanTarget_conjugate {S : Type*} {c : S → S} {j : ℕ}
    (x : archimedeanTarget S c j) (σ : S) :
    x (c σ) = weightParity j * x σ := by sorry

theorem archimedeanTarget_fixed_even {S : Type*} {c : S → S} {j : ℕ}
    (hj : 2 ≤ j) (heven : Even j) (x : archimedeanTarget S c j)
    (σ : S) (hσ : c σ = σ) : x σ = 0 := by sorry

def tateGenerator (q : ℕ) : ℂ := (2 * (Real.pi : ℂ) * Complex.I) ^ q

/-- Actual complex-valued Tate-line target; its defining equations are native. -/
def complexTateTarget (S : Type*) (c : S → S) (j : ℕ) : Submodule ℝ (S → ℂ) where
  carrier := {f | (∀ σ, ∃ r : ℝ, f σ = tateGenerator (j - 1) * (r : ℂ)) ∧
    ∀ σ, f (c σ) = star (f σ)}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

def archimedeanTarget_twist {S : Type*} (c : S → S) (j : ℕ) :
    archimedeanTarget S c j ≃ₗ[ℝ] complexTateTarget S c j := by sorry

def archimedeanTarget_reindex {S T : Type*} (cS : S → S) (cT : T → T)
    (j : ℕ) (e : S ≃ T) (he : ∀ σ, e (cS σ) = cT (e σ)) :
    archimedeanTarget S cS j ≃ₗ[ℝ] archimedeanTarget T cT j := by sorry

-- TauCeti.Borel.archimedeanTarget_fixed_weight_two
example : archimedeanTarget Unit id 2 = ⊥ := by sorry
-- TauCeti.Borel.archimedeanTarget_pair_weight_two
example : (fun b : Bool => if b then (1 : ℝ) else -1) ∈
    archimedeanTarget Bool Bool.not 2 ∧
    (fun _ : Bool => (1 : ℝ)) ∉ archimedeanTarget Bool Bool.not 2 := by sorry
-- TauCeti.Borel.archimedeanTarget_fixed_weight_three
example : (fun _ : Unit => (1 : ℝ)) ∈ archimedeanTarget Unit id 3 := by sorry

abbrev numberFieldTarget (F : Type*) [Field F] [NumberField F] (j : ℕ) :=
  archimedeanTarget (F →+* ℂ) NumberField.ComplexEmbedding.conjugate j

abbrev targetIndex (F : Type*) [Field F] [NumberField F] (j : ℕ) :=
  {v : NumberField.InfinitePlace F // v.IsComplex ∨ Odd j}

instance targetIndex_fintype (F : Type*) [Field F] [NumberField F] (j : ℕ) :
    Fintype (targetIndex F j) := Fintype.ofFinite _

/-- Coordinates require an actual chosen embedding over each included place. -/
def targetCoordinates (F : Type*) [Field F] [NumberField F] (j : ℕ) (hj : 2 ≤ j)
    (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1) :
    numberFieldTarget F j ≃ₗ[ℝ] (targetIndex F j → ℝ) := by sorry

def coordinateIntegerLattice (ι : Type*) [Fintype ι] : Submodule ℤ (ι → ℝ) :=
  Submodule.span ℤ (Set.range (Pi.basisFun ℝ ι))

def targetReference (F : Type*) [Field F] [NumberField F] (j : ℕ) (hj : 2 ≤ j)
    (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1) :
    Submodule ℤ (numberFieldTarget F j) :=
  (coordinateIntegerLattice (targetIndex F j)).comap
    ((targetCoordinates F j hj sel hsel).toLinearMap.restrictScalars ℤ)

instance targetReference_discrete (F : Type*) [Field F] [NumberField F]
    (j : ℕ) (hj : 2 ≤ j) (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1) :
    DiscreteTopology (targetReference F j hj sel hsel) := by sorry

def targetCoordinateMeasure (F : Type*) [Field F] [NumberField F] (j : ℕ) (hj : 2 ≤ j)
    (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1) :
    Measure (numberFieldTarget F j) :=
  Measure.map (targetCoordinates F j hj sel hsel).symm volume

theorem targetCoordinates_reference (F : Type*) [Field F] [NumberField F]
    (j : ℕ) (hj : 2 ≤ j) (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1) :
    IsZLattice ℝ (targetReference F j hj sel hsel) ∧
    ZLattice.covolume (targetReference F j hj sel hsel)
      (targetCoordinateMeasure F j hj sel hsel) = 1 := by sorry

theorem targetCoordinates_apply (F : Type*) [Field F] [NumberField F] (j : ℕ) (hj : 2 ≤ j)
    (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1)
    (x : numberFieldTarget F j) (v : targetIndex F j) :
    targetCoordinates F j hj sel hsel x v = x (sel v) := by sorry

theorem targetCoordinates_symm (F : Type*) [Field F] [NumberField F] (j : ℕ) (hj : 2 ≤ j)
    (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1)
    (x : targetIndex F j → ℝ) (v : targetIndex F j) :
    (targetCoordinates F j hj sel hsel).symm x (sel v) = x v ∧
    (targetCoordinates F j hj sel hsel).symm x
      (NumberField.ComplexEmbedding.conjugate (sel v)) = weightParity j * x v := by sorry

theorem targetCoordinates_inverse (F : Type*) [Field F] [NumberField F] (j : ℕ) (hj : 2 ≤ j)
    (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1)
    (x : numberFieldTarget F j) (y : targetIndex F j → ℝ) :
    (targetCoordinates F j hj sel hsel).symm (targetCoordinates F j hj sel hsel x) = x ∧
    targetCoordinates F j hj sel hsel ((targetCoordinates F j hj sel hsel).symm y) = y := by sorry

theorem targetCoordinates_ext (F : Type*) [Field F] [NumberField F] (j : ℕ) (hj : 2 ≤ j)
    (sel : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1)
    (x y : numberFieldTarget F j) (h : ∀ v, x (sel v) = y (sel v)) : x = y := by sorry

theorem targetCoordinates_change (F : Type*) [Field F] [NumberField F] (j : ℕ)
    (hj : 2 ≤ j) (sel sel' : targetIndex F j → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1)
    (hsel' : ∀ v, NumberField.InfinitePlace.mk (sel' v) = v.1)
    (switch : targetIndex F j → Bool)
    (hswitch : ∀ v, sel' v = if switch v then NumberField.ComplexEmbedding.conjugate (sel v)
      else sel v) (x : numberFieldTarget F j) (v : targetIndex F j) :
    targetCoordinates F j hj sel' hsel' x v =
      (if switch v then weightParity j else 1) * targetCoordinates F j hj sel hsel x v := by sorry

-- TauCeti.Borel.targetCoordinates_pair_two
example (F : Type*) [Field F] [NumberField F]
    (sel : targetIndex F 2 → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1)
    (x : targetIndex F 2 → ℝ) (v : targetIndex F 2) :
    (targetCoordinates F 2 (by decide) sel hsel).symm x (sel v) = x v ∧
    (targetCoordinates F 2 (by decide) sel hsel).symm x
      (NumberField.ComplexEmbedding.conjugate (sel v)) = -x v := by sorry

-- TauCeti.Borel.targetCoordinates_empty
example : finrank ℝ (numberFieldTarget ℚ 2) = 0 ∧
    Fintype.card (targetIndex ℚ 2) = 0 := by sorry

-- TauCeti.Borel.targetCoordinates_representative_switch
example (F : Type*) [Field F] [NumberField F]
    (sel sel' : targetIndex F 2 → (F →+* ℂ))
    (hsel : ∀ v, NumberField.InfinitePlace.mk (sel v) = v.1)
    (hsel' : ∀ v, NumberField.InfinitePlace.mk (sel' v) = v.1)
    (hswitch : ∀ v, sel' v = NumberField.ComplexEmbedding.conjugate (sel v))
    (x : numberFieldTarget F 2) :
    targetCoordinates F 2 (by decide) sel' hsel' x =
      -targetCoordinates F 2 (by decide) sel hsel x := by sorry

theorem archimedeanTarget_finrank (F : Type*) [Field F] [NumberField F]
    (j : ℕ) (hj : 2 ≤ j) :
    finrank ℝ (numberFieldTarget F j) =
      if Odd j then NumberField.InfinitePlace.nrRealPlaces F +
        NumberField.InfinitePlace.nrComplexPlaces F else
        NumberField.InfinitePlace.nrComplexPlaces F := by sorry

def tateProjection (q : ℕ) : ℂ →ₗ[ℝ] ℂ where
  toFun z := (z + ((-1 : ℂ) ^ q) * star z) / 2
  map_add' := by sorry
  map_smul' := by sorry

def traceCoefficient (j : ℕ) : ℂ :=
  (-1) ^ (j - 1) * (Nat.factorial (j - 1) : ℂ) / (Nat.factorial (2 * j - 1) : ℂ)

def traceCocycle {n : Type*} [Fintype n] [DecidableEq n] (j : ℕ)
    (X : Fin (2 * j - 1) → Matrix n n ℂ) : ℂ :=
  traceCoefficient j * ∑ s : Equiv.Perm (Fin (2 * j - 1)),
    ((s.sign : ℤ) : ℂ) * Matrix.trace ((List.ofFn fun i => X (s i)).prod)

theorem traceCocycle_alternating {n : Type*} [Fintype n] [DecidableEq n]
    (j : ℕ) (X : Fin (2 * j - 1) → Matrix n n ℂ)
    (s : Equiv.Perm (Fin (2 * j - 1))) :
    traceCocycle j (X ∘ s) = ((s.sign : ℤ) : ℂ) * traceCocycle j X := by sorry

theorem traceCocycle_multilinear {n : Type*} [Fintype n] [DecidableEq n]
    (j : ℕ) (X : Fin (2 * j - 1) → Matrix n n ℂ)
    (i : Fin (2 * j - 1)) (a : ℂ) (A B : Matrix n n ℂ) :
    traceCocycle j (Function.update X i (a • A + B)) =
      a * traceCocycle j (Function.update X i A) +
        traceCocycle j (Function.update X i B) := by sorry

theorem traceCocycle_block {n p : Type*} [Fintype n] [DecidableEq n]
    [Fintype p] [DecidableEq p] (j : ℕ) (hj : 2 ≤ j)
    (X : Fin (2 * j - 1) → Matrix n n ℂ)
    (Y : Fin (2 * j - 1) → Matrix p p ℂ) :
    traceCocycle j (fun i => Matrix.fromBlocks (X i) 0 0 (Y i)) =
      traceCocycle j X + traceCocycle j Y := by sorry

theorem traceCocycle_three {n : Type*} [Fintype n] [DecidableEq n]
    (X Y Z : Matrix n n ℂ) :
    traceCocycle 2 ![X, Y, Z] = -Matrix.trace (X * (Y * Z - Z * Y)) / 2 := by sorry

theorem traceCocycle_scalar {n : Type*} [Fintype n] [DecidableEq n]
    (j : ℕ) (hj : 2 ≤ j) (X : Fin (2 * j - 1) → Matrix n n ℂ)
    (hc : ∀ a b, Commute (X a) (X b)) : traceCocycle j X = 0 := by sorry

def pauliX : Matrix (Fin 2) (Fin 2) ℂ := !![0, 1; 1, 0]
def pauliY : Matrix (Fin 2) (Fin 2) ℂ := !![0, -Complex.I; Complex.I, 0]
def pauliZ : Matrix (Fin 2) (Fin 2) ℂ := !![1, 0; 0, -1]

-- TauCeti.Borel.traceCocycle_scalar_two
example (X : Fin 3 → Matrix (Fin 1) (Fin 1) ℂ) : traceCocycle 2 X = 0 := by sorry
-- TauCeti.Borel.traceCocycle_pauli_two
example : traceCocycle 2 ![pauliX, pauliY, pauliZ] = -2 * Complex.I := by sorry
-- TauCeti.Borel.traceCocycle_repeat
example (X Z : Matrix (Fin 2) (Fin 2) ℂ) : traceCocycle 2 ![X, X, Z] = 0 := by sorry

/-- Generic embedding-fiber maps; restriction of number-field embeddings
    instantiates `res`, with the native conjugation functions. -/
def embeddingPull {S T : Type*} (cS : S → S) (cT : T → T) (j : ℕ)
    (res : T → S) (hr : ∀ τ, res (cT τ) = cS (res τ)) :
    archimedeanTarget S cS j →ₗ[ℝ] archimedeanTarget T cT j := by sorry

def embeddingTrace {S T : Type*} [Fintype T] [DecidableEq S]
    (cS : S → S) (cT : T → T) (hS : Function.Involutive cS)
    (hT : Function.Involutive cT) (j : ℕ)
    (res : T → S) (hr : ∀ τ, res (cT τ) = cS (res τ)) :
    archimedeanTarget T cT j →ₗ[ℝ] archimedeanTarget S cS j := by sorry

def embeddingPullTrace {S T : Type*} [Fintype T] [DecidableEq S]
    (cS : S → S) (cT : T → T) (hS : Function.Involutive cS)
    (hT : Function.Involutive cT) (j : ℕ)
    (res : T → S) (hr : ∀ τ, res (cT τ) = cS (res τ)) :=
  (embeddingPull cS cT j res hr, embeddingTrace cS cT hS hT j res hr)

theorem embeddingPull_apply {S T : Type*} (cS : S → S) (cT : T → T) (j : ℕ)
    (res : T → S) (hr : ∀ τ, res (cT τ) = cS (res τ))
    (x : archimedeanTarget S cS j) (τ : T) :
    embeddingPull cS cT j res hr x τ = x (res τ) := by sorry

theorem embeddingTrace_apply {S T : Type*} [Fintype T] [DecidableEq S]
    (cS : S → S) (cT : T → T) (hS : Function.Involutive cS)
    (hT : Function.Involutive cT) (j : ℕ)
    (res : T → S) (hr : ∀ τ, res (cT τ) = cS (res τ))
    (y : archimedeanTarget T cT j) (σ : S) :
    embeddingTrace cS cT hS hT j res hr y σ =
      ∑ τ ∈ Finset.univ.filter (fun τ => res τ = σ), y τ := by sorry

theorem embeddingTrace_pull {S T : Type*} [Fintype T] [DecidableEq S]
    (cS : S → S) (cT : T → T) (hS : Function.Involutive cS)
    (hT : Function.Involutive cT) (j : ℕ)
    (res : T → S) (hr : ∀ τ, res (cT τ) = cS (res τ))
    (d : ℕ) (hd : ∀ σ, (Finset.univ.filter (fun τ => res τ = σ)).card = d)
    (x : archimedeanTarget S cS j) :
    embeddingTrace cS cT hS hT j res hr (embeddingPull cS cT j res hr x) =
      (d : ℝ) • x := by sorry

def normalizedLeadingCoefficient (f : ℂ → ℂ) (s₀ : ℂ) (d : ℕ) : ℂ :=
  iteratedDeriv d f s₀ / (Nat.factorial d : ℂ)

theorem normalizedLeadingCoefficient_order_zero (f : ℂ → ℂ) (s₀ : ℂ) :
    normalizedLeadingCoefficient f s₀ 0 = f s₀ := by sorry

theorem normalizedLeadingCoefficient_factor (f g : ℂ → ℂ) (s₀ : ℂ) (d : ℕ)
    (hf : AnalyticAt ℂ f s₀) (hg : AnalyticAt ℂ g s₀)
    (hfg : f =ᶠ[nhds s₀] fun z => (z - s₀) ^ d * g z) :
    normalizedLeadingCoefficient f s₀ d = g s₀ := by sorry

theorem normalizedLeadingCoefficient_limit (f g : ℂ → ℂ) (s₀ : ℂ) (d : ℕ)
    (hf : AnalyticAt ℂ f s₀) (hg : AnalyticAt ℂ g s₀)
    (hfg : f =ᶠ[nhds s₀] fun z => (z - s₀) ^ d * g z) :
    Filter.Tendsto (fun z => f z / (z - s₀) ^ d) (nhdsWithin s₀ {s₀}ᶜ)
      (nhds (normalizedLeadingCoefficient f s₀ d)) := by sorry

theorem normalizedLeadingCoefficient_ne_zero (f g : ℂ → ℂ) (s₀ : ℂ) (d : ℕ)
    (hf : AnalyticAt ℂ f s₀) (hg : AnalyticAt ℂ g s₀)
    (hfg : f =ᶠ[nhds s₀] fun z => (z - s₀) ^ d * g z) (hne : g s₀ ≠ 0) :
    normalizedLeadingCoefficient f s₀ d ≠ 0 := by sorry

theorem normalizedLeadingCoefficient_smul (a : ℂ) (f : ℂ → ℂ) (s₀ : ℂ) (d : ℕ) :
    normalizedLeadingCoefficient (fun z => a * f z) s₀ d =
      a * normalizedLeadingCoefficient f s₀ d := by sorry

-- TauCeti.Borel.normalizedLeadingCoefficient_square
example : normalizedLeadingCoefficient (fun z => z ^ 2) 0 2 = 1 := by sorry
-- TauCeti.Borel.normalizedLeadingCoefficient_constant
example : normalizedLeadingCoefficient (fun _ => 7) 0 0 = 7 := by sorry
-- TauCeti.Borel.normalizedLeadingCoefficient_wrong_order
example : normalizedLeadingCoefficient (fun z => z ^ 3) 0 2 = 0 := by sorry

/-- Native scalar component of the restriction-of-scalars form. -/
def discriminantScalar (δ : ℂ) (q : ℕ) : ℂ := (δ ^ q)⁻¹

-- TauCeti.Borel.restrictionScalarsForm_Q
example : discriminantScalar 1 1 = 1 := by sorry
-- TauCeti.Borel.restrictionScalarsForm_Qi
example : (-2 * Complex.I) ^ 2 = (-4 : ℂ) ∧
    discriminantScalar (-2 * Complex.I) 1 = Complex.I / 2 := by sorry
-- TauCeti.Borel.restrictionScalarsForm_absolute_wrong
example : discriminantScalar (-2 * Complex.I) 1 ≠ discriminantScalar 2 1 := by sorry

/-- Native matrix of an actual integral basis of a coordinate lattice.
    Specialize to the proved regulator image to obtain the arithmetic matrix. -/
def regulatorMatrix {ι : Type*} (L : Submodule ℤ (ι → ℝ)) (b : Basis ι ℤ L) :
    Matrix ι ι ℝ := fun v a => (b a : ι → ℝ) v

theorem regulatorMatrix_apply {ι : Type*} (L : Submodule ℤ (ι → ℝ))
    (b : Basis ι ℤ L) (v a : ι) : regulatorMatrix L b v a = (b a : ι → ℝ) v := by sorry

theorem regulatorMatrix_basis_change {ι : Type*} [Fintype ι] [DecidableEq ι]
    (L : Submodule ℤ (ι → ℝ)) (b b' : Basis ι ℤ L) (U : Matrix ι ι ℤ)
    (hU : ∀ a, b' a = ∑ k, U k a • b k) :
    regulatorMatrix L b' = regulatorMatrix L b * U.map (Int.castRingHom ℝ) := by sorry

-- Native determinant scaling component of the arithmetic API.
theorem regulatorMatrix_scalar {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M : Matrix ι ι ℝ) (a : ℝ) :
    Matrix.det (a • M) = a ^ Fintype.card ι * Matrix.det M := by sorry

theorem regulatorMatrix_empty (M : Matrix (Fin 0) (Fin 0) ℝ) : Matrix.det M = 1 := by sorry
-- TauCeti.Borel.regulatorMatrix_rank_zero
example (M : Matrix (Fin 0) (Fin 0) ℝ) : Matrix.det M = 1 := by sorry
-- TauCeti.Borel.regulatorMatrix_swap
example : Matrix.det (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℝ) = -1 := by sorry
-- TauCeti.Borel.regulatorMatrix_double_two
example (M : Matrix (Fin 2) (Fin 2) ℝ) : Matrix.det (2 • M) = 4 * Matrix.det M := by sorry

def regulatorCovolume {ι : Type*} [Fintype ι] (L : Submodule ℤ (ι → ℝ)) : ℝ :=
  ZLattice.covolume L

theorem regulatorCovolume_det {ι : Type*} [Fintype ι] [DecidableEq ι]
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L] [IsZLattice ℝ L]
    (b : Basis ι ℤ L) : regulatorCovolume L = |Matrix.det (regulatorMatrix L b)| := by sorry

theorem regulatorCovolume_pos {ι : Type*} [Fintype ι]
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L] [IsZLattice ℝ L] :
    0 < regulatorCovolume L := by sorry

theorem regulatorCovolume_basis_independent {ι : Type*} [Fintype ι] [DecidableEq ι]
    (L : Submodule ℤ (ι → ℝ)) [DiscreteTopology L] [IsZLattice ℝ L]
    (b b' : Basis ι ℤ L) :
    |Matrix.det (regulatorMatrix L b)| = |Matrix.det (regulatorMatrix L b')| := by sorry

-- TauCeti.Borel.regulatorCovolume_zero_rank
example : regulatorCovolume (⊥ : Submodule ℤ (Fin 0 → ℝ)) = 1 := by sorry
-- TauCeti.Borel.regulatorCovolume_reference
example {ι : Type*} [Fintype ι] : regulatorCovolume (coordinateIntegerLattice ι) = 1 := by sorry

-- TauCeti.Borel.regulatorCovolume_rank_one_sign
example (a : ℝ) : |Matrix.det (!![a] : Matrix (Fin 1) (Fin 1) ℝ)| =
    |Matrix.det (!![-a] : Matrix (Fin 1) (Fin 1) ℝ)| := by sorry

/-- Native matrix pair for genuine coordinate pullback and trace maps. -/
def embeddingMatrices {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (p : (ι → ℝ) →ₗ[ℝ] (κ → ℝ))
    (t : (κ → ℝ) →ₗ[ℝ] (ι → ℝ)) : Matrix κ ι ℝ × Matrix ι κ ℝ :=
  (LinearMap.toMatrix (Pi.basisFun ℝ ι) (Pi.basisFun ℝ κ) p,
    LinearMap.toMatrix (Pi.basisFun ℝ κ) (Pi.basisFun ℝ ι) t)

theorem embeddingMatrices_pull_apply {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (p : (ι → ℝ) →ₗ[ℝ] (κ → ℝ))
    (t : (κ → ℝ) →ₗ[ℝ] (ι → ℝ)) (x : ι → ℝ) :
    (embeddingMatrices p t).1.mulVec x = p x := by sorry

theorem embeddingMatrices_trace_apply {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (p : (ι → ℝ) →ₗ[ℝ] (κ → ℝ))
    (t : (κ → ℝ) →ₗ[ℝ] (ι → ℝ)) (y : κ → ℝ) :
    (embeddingMatrices p t).2.mulVec y = t y := by sorry

theorem embeddingMatrices_id {ι : Type*} [Fintype ι] [DecidableEq ι] :
    embeddingMatrices (LinearMap.id : (ι → ℝ) →ₗ[ℝ] (ι → ℝ)) LinearMap.id = (1, 1) := by sorry

theorem embeddingMatrices_comp {ι κ ν : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] [Fintype ν] [DecidableEq ν]
    (p : (ι → ℝ) →ₗ[ℝ] (κ → ℝ)) (t : (κ → ℝ) →ₗ[ℝ] (ι → ℝ))
    (p' : (κ → ℝ) →ₗ[ℝ] (ν → ℝ)) (t' : (ν → ℝ) →ₗ[ℝ] (κ → ℝ)) :
    embeddingMatrices (p'.comp p) (t.comp t') =
      ((embeddingMatrices p' t').1 * (embeddingMatrices p t).1,
        (embeddingMatrices p t).2 * (embeddingMatrices p' t').2) := by sorry

theorem embeddingMatrices_trace_pull {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (p : (ι → ℝ) →ₗ[ℝ] (κ → ℝ))
    (t : (κ → ℝ) →ₗ[ℝ] (ι → ℝ)) (d : ℝ) (h : t.comp p = d • LinearMap.id) :
    (embeddingMatrices p t).2 * (embeddingMatrices p t).1 = d • (1 : Matrix ι ι ℝ) := by sorry

-- TauCeti.Borel.embeddingMatrices_quadratic_odd
example : (!![2] : Matrix (Fin 1) (Fin 1) ℝ) * !![1] = !![2] := by sorry
-- TauCeti.Borel.embeddingMatrices_Q_weight_two
example (P : Matrix (Fin 1) (Fin 0) ℝ) (T : Matrix (Fin 0) (Fin 1) ℝ) :
    T * P = (2 : ℝ) • (1 : Matrix (Fin 0) (Fin 0) ℝ) := by sorry
-- TauCeti.Borel.embeddingMatrices_switch_pair
example (P : Matrix (Fin 1) (Fin 0) ℝ) (T : Matrix (Fin 0) (Fin 1) ℝ) :
    (-T) * (-P) = T * P := by sorry

end TauCeti.Borel

/-!
Complete mathematical signature register

Each entry is an exact packet interface. Native components above elaborate;
unavailable canonical higher objects remain mathematical signatures and example
specifications, not Lean axioms. Replace comments only after their owners export
the actual types and maps. Review corrections await the reader revision described
in REV-BorelRegulators; this register follows the corrected packet.

R.1
============================================================

BorelRegulators:R.1/order-arithmetic-system
TauCeti.Borel.orderArithmeticSystem :
Let F be a number field, D a finite-dimensional central division F-algebra of degree e, and O a unital Z-order spanning D over Q. For n≥2 put G_n=Res_{F/Q} SL_n(D), Γ_n=SL_n(O), with reduced norm one; for a projective O-lattice P spanning D^n use Aut_O(P). The construction identifies these as arithmetic subgroups and retains each archimedean matrix/quaternion factor and the block maps diag(g,1).
Hypotheses: O is a full Z-lattice, closed under multiplication and containing 1; D is division and central over F.
Prerequisites: mathlib:CSA, AdelicAlgebraicGroups:AA.1, tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions
API lemma signatures:
TauCeti.Borel.orderArithmeticSystem_block : The block inclusion Γ_n→Γ_{n+1} agrees with diag(g,1) on matrices and composes to diag(g,I_r).
TauCeti.Borel.orderArithmeticSystem_archimedean : The real Lie group of G_n is the product of the factors SL_{ne}(R), SL_{ne/2}(H) at ramified real places, and SL_{ne}(C) at complex places.
TauCeti.Borel.orderArithmeticSystem_rank : For n≥2, rank_Q G_n=n−1.
TauCeti.Borel.orderArithmeticSystem_equiv : An order algebra isomorphism induces the native matrix-group isomorphism and commutes with every block inclusion.
TauCeti.Borel.orderArithmeticSystem_projective : Aut_O(P), with P a projective full lattice in D^n, is arithmetic in Res GL_D(P⊗D).
Named example specifications:
TauCeti.Borel.orderArithmeticSystem_split : For D=F and O=O_F, Γ_n=SL_n(O_F).
TauCeti.Borel.orderArithmeticSystem_rank_two : For n=2 and any central division D, rank_Q G_2=1.
TauCeti.Borel.orderArithmeticSystem_norm_one : For F=Q, diag(2,1) lies in GL_2(Q) but not in Γ_2 for O=Z, and not in SL_2(Q).

BorelRegulators:R.1/division-building
TauCeti.Borel.divisionBuilding :
For a right D-vector space V of finite dimension n≥2, Δ(V) is the order complex of the poset of proper nonzero right D-subspaces of V; simplices are strictly increasing finite flags. Aut_D(V) acts by transport of subspaces. Set Δ(0) and Δ(D) to the empty complex, with augmented chain conventions fixed separately.
Hypotheses: D is a division ring, not necessarily commutative.
Prerequisites: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations, BorelRegulators:R.1/order-arithmetic-system
API lemma signatures:
TauCeti.Borel.divisionBuilding_vertices : Vertices are exactly proper nonzero D-subspaces.
TauCeti.Borel.divisionBuilding_simplex : A finite set spans a simplex iff it is a chain of distinct comparable subspaces.
TauCeti.Borel.divisionBuilding_map : A D-linear equivalence of V and W induces a simplicial equivalence with identity and composition laws.
TauCeti.Borel.divisionBuilding_action : Aut_D(V) acts simplicially, compatibly with the inclusion of Aut_O(P).
Named example specifications:
TauCeti.Borel.divisionBuilding_rank_one : The rank-one building is empty.
TauCeti.Borel.divisionBuilding_rank_two : The rank-two building is a discrete complex indexed by right D-lines; it has no edges.
TauCeti.Borel.divisionBuilding_not_order_submodules : For V=Q², the lattices Z² and 2Z² do not define two distinct vertices: both span the excluded full subspace.

BorelRegulators:R.1/steinberg-module
TauCeti.Borel.steinbergModule :
St_D(V)=reduced integral homology H̃_{n−2}(Δ(V);Z) for n≥2, with its Aut_D(V)-action; set St_D(D)=Z with trivial action via augmented degree −1. It is an integral coefficient module, and is usually not finitely generated as an abelian group.
Hypotheses: V has positive finite D-dimension n.
Prerequisites: BorelRegulators:R.1/division-building, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology
API lemma signatures:
TauCeti.Borel.steinbergModule_action : St_D(V) is a Z[Aut_D(V)]-module induced from the action on augmented chains.
TauCeti.Borel.steinbergModule_equiv : Linear equivalences give equivariant module equivalences, preserving identity and composition.
TauCeti.Borel.steinbergModule_rank_one : St_D(D)=Z with trivial automorphism action.
TauCeti.Borel.steinbergModule_rank_two : St_D(D²) is canonically the kernel of the sum-of-coefficients map Z[P¹(D)]→Z.
TauCeti.Borel.steinbergModule_apartment : An ordered D-basis gives the oriented apartment class; permutations act by their sign and replacing any basis vector by a nonzero multiple leaves the apartment unchanged.
Named example specifications:
TauCeti.Borel.steinbergModule_one : St_D(D)=Z, not zero.
TauCeti.Borel.steinbergModule_two : For D=F_q, rank_Z St_D(D²)=q.
TauCeti.Borel.steinbergModule_rational_lines : For D=Q and n=2 the underlying abelian group has infinite rank, despite the arithmetic group having a finite classifying-space model.

BorelRegulators:R.1/solomon-tits
TauCeti.Borel.solomonTits :
For a right D-space V of dimension n≥2 over a division ring, Δ(V) is homotopy equivalent to a wedge of (n−2)-spheres. Its reduced integral homology is concentrated in degree n−2, is torsion-free there, and the oriented apartment classes generate St_D(V). The statement permits an infinite wedge.
Hypotheses: D division; n≥2.
Prerequisites: BorelRegulators:R.1/division-building, BorelRegulators:R.1/steinberg-module, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology
Theorem/application acceptance: For n=2 this is a wedge of zero-spheres; no connectedness is asserted.

BorelRegulators:R.1/steinberg-duality-finiteness
TauCeti.Borel.steinbergHomology_finitelyGenerated :
For an order O in a central division number algebra, a projective full O-lattice P of rank n≥1 and Γ=Aut_O(P), each H_i(Γ,St_D(P⊗_O D)) is finitely generated over Z. Choose a normal torsion-free finite-index Γ′ lying in the kernel of the orientation character and of the absolute rational reduced-norm character; Borel–Serre integral duality identifies its twisted homology with complementary-degree integral cohomology. Descent to Γ uses the integral finite-quotient spectral sequence.
Hypotheses: The Borel–Serre duality input includes the building as rational boundary and the orientation twist; a finite CW model alone does not imply this assertion.
Prerequisites: BorelRegulators:R.1/solomon-tits, BorelRegulators:R.1/order-arithmetic-system, ArithmeticLocallySymmetricSpaces:ALS.2, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent
Theorem/application acceptance: Retain finite-quotient torsion; do not infer this from the size of St. For rank one the coefficient is Z and the statement reduces to ordinary homology finiteness.

BorelRegulators:R.1/quillen-finiteness-interface
TauCeti.Borel.quillenRankFiltration_finitenessInput :
For a maximal order O in a central division number algebra, the category of projective O-modules of rank at most n has only finitely many isomorphism classes in rank n (Jordan–Zassenhaus). Quillen’s rank-filtration relative homology is assembled from H_{i−n}(Aut_O(P),St_D(P⊗D)) over those classes. Thus every finite-rank filtration step has finitely generated integral homology; ArithmeticKTheory:N.3:finite-generation owns stabilization, plus/Q comparison and K_i(O) finite generation. Extension of this argument to a nonmaximal order requires an additional order-comparison theorem and is not inferred from Quillen’s hereditary-order filtration.
Hypotheses: O is maximal; projective-module exact category and Q construction imported from GeneralAlgebraicKTheory.
Prerequisites: BorelRegulators:R.1/steinberg-duality-finiteness, ArithmeticKTheory:N.3:finite-generation, GeneralAlgebraicKTheory:K.2:plus
Theorem/application acceptance: This node does not duplicate the final finite-generation theorem in N.3.

BorelRegulators:R.1/finite-type-plus-consequences
TauCeti.Borel.arithmeticPlus_finiteType :
For a maximal order O, the arithmetic plus/Q model of K(O), supplied by K.2 with H.3–H.4, is a connected homotopy-associative H-space on its positive component, with the correct K_1 fundamental group, trivial π1 action on higher homotopy and finite-type integral homology in each degree. Its higher homotopy groups are finitely generated using the finite-type H-space theorem; the arithmetic finite-generation endpoint is imported from N.3. Rational rank calculations for all orders use only the finite-dimensional rational comparison and do not depend on this integral endpoint.
Hypotheses: Use the genuine local-coefficient-acyclic plus construction and the cofinal-projective comparison; simple connectedness of BGL+ is not assumed.
Prerequisites: BorelRegulators:R.1/quillen-finiteness-interface, StableHomotopyKTheory:H.3, StableHomotopyKTheory:H.4, GeneralAlgebraicKTheory:K.2:plus, ArithmeticKTheory:N.3:finite-generation
Theorem/application acceptance: BGL+ has π1=K1, which need not vanish; no simply connected substitution is admissible.

R.2
============================================================

BorelRegulators:R.2/arithmetic-restriction
TauCeti.Borel.arithmeticRestriction :
For Γ⊂G(R) arithmetic, Γ with the discrete topology, q≥0 and a finite-dimensional real trivial coefficient vector space E, res_Γ:H_cont^q(G(R),E)→H^q(Γ,E) is induced by precomposition of homogeneous continuous cochains with Γ→G(R), followed by the all-degree comparison between continuous cochains on a discrete group and native group cochains. It agrees with the pinned ContinuousCohomology.cochainsMap on complexes.
Hypotheses: The inclusion is a continuous group homomorphism when Γ is discrete.
Prerequisites: mathlib:TopRep.homogeneousCochains, mathlib:continuousCohomology, mathlib:ContinuousCohomology.cochainsMap, mathlib:ContinuousCohomology.cochainsMap_comp, tauceti:TauCeti.ContCohomology.explicitH2IsoGroupCohomology, AutomorphicFormsOnReductiveGroups:AF.1a
API lemma signatures:
TauCeti.Borel.arithmeticRestriction_cochains : Its cochain representative is ContinuousCohomology.cochainsMap for the inclusion and identity coefficients.
TauCeti.Borel.arithmeticRestriction_id : Restriction along the identity is the identity.
TauCeti.Borel.arithmeticRestriction_comp : For Δ⊂Γ⊂G, res_Δ=res_{Δ⊂Γ}∘res_Γ.
TauCeti.Borel.arithmeticRestriction_coeff : For a real linear coefficient map E→E′, coefficient extension commutes with restriction.
TauCeti.Borel.arithmeticRestriction_cup : Restriction preserves cup products and units for compatible algebra coefficients.
Named example specifications:
TauCeti.Borel.arithmeticRestriction_degree_zero : For trivial coefficients, the degree-zero restriction R→R is identity.
TauCeti.Borel.arithmeticRestriction_trivial_group : For Γ={1} and q>0, restriction has zero target.
TauCeti.Borel.arithmeticRestriction_degree_two : The degree-two discrete comparison agrees with TauCeti.ContCohomology.explicitH2IsoGroupCohomology on a cocycle class.

BorelRegulators:R.2/arithmetic-invariant-form-map
TauCeti.Borel.arithmeticInvariantFormMap :
For a connected semisimple real algebraic group G, maximal compact K, torsion-free arithmetic Γ and X=K\G(R), j_Γ:(H^q(g,k;R))^{K/K°}→H^q(Γ,R) sends a full-K-invariant relative Lie class to its G(R)-invariant differential form descended to X/Γ and then to its singular cohomology class. Equivalently the source is H^q(g,K;R), with the K-component action retained. For general Γ use a torsion-free normal finite-index subgroup and real-coefficient invariant descent. Via van Est it equals arithmeticRestriction. If G(R) is connected, the component restriction reduces to the usual connected relative comparison.
Hypotheses: AF.1a supplies the full (g,K) convention and van Est; the nonautomorphic Betti/de Rham part of ALS.5 must be split into an early comparison export. ALS.5:finite-level-duality alone does not supply this extra comparison.
Prerequisites: BorelRegulators:R.2/arithmetic-restriction, AutomorphicFormsOnReductiveGroups:AF.1a, ArithmeticLocallySymmetricSpaces:ALS.5, ArithmeticLocallySymmetricSpaces:ALS.2
API lemma signatures:
TauCeti.Borel.arithmeticInvariantFormMap_vanEst : jΓ=resΓ∘vanEst⁻¹ for the AF.1a convention on relative cochains.
TauCeti.Borel.arithmeticInvariantFormMap_descent : Its pullback to a torsion-free finite-index Γ′ equals the invariant form on X/Γ′.
TauCeti.Borel.arithmeticInvariantFormMap_component : For disconnected real points the source is the appropriate K/K°-invariant part.
TauCeti.Borel.arithmeticInvariantFormMap_cup : jΓ sends wedge products of invariant forms to cup products.
TauCeti.Borel.arithmeticInvariantFormMap_coeff : Extension R→C commutes with the map and with Betti/de Rham comparison.
Named example specifications:
TauCeti.Borel.arithmeticInvariantFormMap_unit : The constant invariant 0-form 1 maps to the unit cohomology class.
TauCeti.Borel.arithmeticInvariantFormMap_point : If X/Γ is a point then every positive-degree class maps to zero.
TauCeti.Borel.arithmeticInvariantFormMap_component_invariants : For G=PGL₂ over R, K=PO₂ and compact dual S² for the identity component, the nonidentity K-component reverses the two-dimensional tangent orientation. It acts by −1 on H²(S²;R), so the full-K-invariant degree-two source is zero although H²(S²;R)=R.

BorelRegulators:R.2/block-comparison-naturality
TauCeti.Borel.arithmeticComparison_block_natural :
For an injective real algebraic homomorphism f:G→G′ taking Γ into Γ′, choose K′ containing f(K). The invariant-form restriction, relative Lie pullback, continuous-cohomology pullback and arithmetic-group pullback form commuting squares with jΓ and jΓ′. In the order system this holds for every diag(g,I_r) and commutes with coefficient extension R→C. The induced compact-dual pullback is independent of compatible maximal-compact choices up to the canonical conjugacy identifications.
Hypotheses: Groups, arithmetic subgroups and compact duals satisfy the R.2 comparison hypotheses.
Prerequisites: BorelRegulators:R.2/arithmetic-invariant-form-map, BorelRegulators:R.1/order-arithmetic-system, AutomorphicFormsOnReductiveGroups:AF.1a, ArithmeticLocallySymmetricSpaces:ALS.5, tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions
Theorem/application acceptance: Composing two block inclusions gives the same comparison square as their single block inclusion.

BorelRegulators:R.2/stable-hopf-compatibility
TauCeti.Borel.stableComparison_hopf :
In the stabilized order system, block sum gives the arithmetic homology/cohomology its connected graded Hopf structure. The stable invariant-form/compact-dual comparison preserves unit, product, coproduct, augmentation and antipode; it therefore preserves cohomological primitives and indecomposables and, by finite-degree duality, primitive homology. Primitive homology is dual to cohomology indecomposables, not to all cohomology in the same degree.
Hypotheses: Each degree has stabilized and is finite-dimensional over R; block sum is compatible with plus-space multiplication.
Prerequisites: BorelRegulators:R.2/block-comparison-naturality, StableHomotopyKTheory:H.4, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
Theorem/application acceptance: An exterior product of two positive-degree generators is excluded from the indecomposable quotient.

R.3
============================================================

BorelRegulators:R.3/classical-compact-duals
TauCeti.Borel.classicalCompactDuals :
For the archimedean factors of SL_n(D), the connected compact duals are SU_{ne}/SO_{ne} at split real places, SU_{ne}/USp_{ne} at quaternionic real places (ne even), and SU_{ne} at complex places. They use the Cartan symmetric-pair dual g_u=k⊕i p and the quotient K°\G_u; a compact real form by itself does not specify the dual. Compatible block inclusions induce the corresponding maps between these homogeneous spaces.
Hypotheses: n≥2, D central division of degree e; compact-dual symmetric-pair geometry is an additional LieGroups Part II input.
Prerequisites: BorelRegulators:R.1/order-arithmetic-system, tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms, tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions
Theorem/application acceptance: The quaternionic quotient has USp_{ne}, not SO_{ne}, as denominator.

BorelRegulators:R.3/compact-dual-cohomology
TauCeti.Borel.compactDual_stableExterior :
With real coefficients, the degreewise stable cohomology rings are H*(SU)=Λ(x_3,x_5,x_7,…), H*(SU/SO)=Λ(y_5,y_9,y_13,…) and H*(SU/USp)=Λ(z_5,z_9,z_13,…). The named generators are primitive for stable block sum. The finite-dimensional groups and homogeneous spaces have their own unstable relations; the displayed infinite exterior algebras assert only degreewise stable cohomology. For finite ranks m≥1, H*(SU_m;R)=Λ(x_3,x_5,…,x_{2m−1}); H*(SU_{2m+1}/SO_{2m+1};R)=Λ(y_5,y_9,…,y_{4m+1}); H*(SU_{2m}/SO_{2m};R)=Λ(y_5,y_9,…,y_{4m−3})⊗R[e_{2m}]/(e_{2m}²); and H*(SU_{2m}/USp_{2m};R)=Λ(z_5,z_9,…,z_{4m−3}), with empty generator ranges interpreted as R. Block pullback preserves the named transgressed odd generators wherever they occur; the even-rank Euler class is unstable.
Hypotheses: Stability maps come from the compatible classical block inclusions.
Prerequisites: BorelRegulators:R.3/classical-compact-duals, mathlib:ExteriorAlgebra, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
Theorem/application acceptance: H³(SU/SO;R)=H³(SU/USp;R)=0, while H³(SU;R)=R. Finite-size cohomology is not replaced by the stable ring without a degree bound.

BorelRegulators:R.3/compact-dual-degree-stability
TauCeti.Borel.compactDual_stable_in_degree :
For fixed q≥0, all three classical compact-dual systems occurring in the order system have stationary real cohomology in degrees ≤q once n≥2q+3. This is a uniform sufficient bound, not the sharp bound: each local matrix rank is at least n, and no unstable Euler or top-degree class occurs in that range. The stable generators and block pullbacks agree under these identifications.
Hypotheses: n is the rank over D, rather than the absolute matrix size ne; quaternionic D has even e.
Prerequisites: BorelRegulators:R.3/compact-dual-cohomology, BorelRegulators:R.2/block-comparison-naturality, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent
Theorem/application acceptance: For q=3 the complex generator survives and the real/quaternionic factors contribute zero. The bound is labelled sufficient; no claim of sharpness is made.

BorelRegulators:R.3/arithmetic-stable-range
TauCeti.Borel.arithmeticComparison_stableRange :
For O an order in a central division algebra D over a number field F, n≥2 and q≥0 with 4q<n−1, the invariant-form map j_{Γ_n}:H^q(g_n,k_n;R)→H^q(SL_n(O);R) is an isomorphism. The general source theorem is injectivity for q≤c(G_n) and surjectivity for q≤min(c(G_n),m(G_n(R))). Borel’s root/curvature estimates give min(c,m)≥[(rank_Q G_n)/4]′, where [x]′ is the greatest integer strictly less than x, and rank_Q G_n=n−1. The strict inequality in the displayed usable bound is intentional.
Hypotheses: The AF.1a analytic complexes and ALS.2 compactification/descent are supplied with the logarithmic-growth and L² interfaces requested below.
Prerequisites: BorelRegulators:R.2/arithmetic-invariant-form-map, BorelRegulators:R.1/order-arithmetic-system, ArithmeticLocallySymmetricSpaces:ALS.2, AutomorphicFormsOnReductiveGroups:AF.1a
Theorem/application acceptance: For q=2, n≥10 is a sufficient arithmetic comparison range. Replacing 4q<n−1 by 4q≤n−1 changes boundary cases and is not accepted without a sharper proof.

BorelRegulators:R.3/stable-arithmetic-exterior
TauCeti.Borel.arithmeticCohomology_stableExterior :
For Γ∞=colim_n SL_n(O), H*(Γ∞;R) is the graded exterior algebra with r1 independent generators in every degree 4a+1 (a≥1) and r2 independent generators in every degree 2a+1 (a≥1). The comparison is compatible with block-sum Hopf structures. Each cohomological degree is finite-dimensional and stationary; the inverse limit is taken degree by degree and then summed as a graded algebra, not as a completed product across degrees.
Hypotheses: O any order in a central division algebra over F; r1 and r2 are the signature of F, independent of archimedean ramification of D.
Prerequisites: BorelRegulators:R.3/compact-dual-degree-stability, BorelRegulators:R.3/arithmetic-stable-range, BorelRegulators:R.2/stable-hopf-compatibility, mathlib:ExteriorAlgebra, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
Theorem/application acceptance: In degree 9, possible decomposable terms must be separated from the generator space; rank counts indecomposables.

BorelRegulators:R.3/gl-sl-primitive-comparison
TauCeti.Borel.stableGL_SL_primitiveComparison :
For O as above and i≥2, the stable elementary-group plus model and BGL(O)+ have the same rational higher-homotopy primitive contribution. The determinant/reduced-norm quotient contributes the K1 component and degree-one classes; it does not add primitive generators in degrees i≥2. Under the K.2 plus/Q comparison, K_i(O)⊗R identifies with primitive degree-i homology of the stable arithmetic system computed by SL, with its stable block-sum structure.
Hypotheses: Use the stable perfect elementary subgroup and the connected homotopy-associative K-space supplied by K.2/H.3/H.4. The assertion is about higher primitive homology, not equality of the full SL and GL cohomology rings.
Prerequisites: BorelRegulators:R.3/stable-arithmetic-exterior, GeneralAlgebraicKTheory:K.2:plus, StableHomotopyKTheory:H.3, StableHomotopyKTheory:H.4
Theorem/application acceptance: For i=1 the statement is not asserted; real units can contribute there.

BorelRegulators:R.3/cartan-serre-application
TauCeti.Borel.arithmeticK_rationalHurewicz :
For the connected homotopy-associative arithmetic K-space, the Cartan–Serre rational Hurewicz theorem identifies π_i⊗R with primitive H_i for i≥2. Finite-dimensional degreewise duality identifies (primitive H_i)∨ with QH^i=H^{>0}/(H^{>0})² in degree i. Consequently the dimension of K_i(O)⊗R equals the number of exterior generators in degree i, without assuming integral finite generation.
Hypotheses: The imported H.3 theorem handles connected simple H-spaces and nonzero π1; ordinary simply connected Hurewicz is insufficient.
Prerequisites: BorelRegulators:R.3/gl-sl-primitive-comparison, BorelRegulators:R.2/stable-hopf-compatibility, StableHomotopyKTheory:H.3, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
Theorem/application acceptance: Finite generation of K_i(O) is absent from the rank proof’s prerequisites.

BorelRegulators:R.3/division-order-rank-period
TauCeti.Borel.divisionOrder_borelRank :
For any order O in a finite-dimensional central division algebra over a number field F and i≥2, dim_R(K_i(O)⊗_Z R) is 0 if i≡0 or 2 mod4, r1+r2 if i≡1 mod4, and r2 if i≡3 mod4. In particular the answer is independent of the degree and real ramification of D. No assertion about integral torsion or K1 is part of this theorem.
Hypotheses: O need not be maximal; its arithmetic SL system and genuine plus model meet the preceding comparisons.
Prerequisites: BorelRegulators:R.3/cartan-serre-application, mathlib:NumberField.InfinitePlace.nrRealPlaces, mathlib:NumberField.InfinitePlace.nrComplexPlaces
Theorem/application acceptance: For F totally real the rank in degree 3 is zero; degree 5 has rank [F:Q].

BorelRegulators:R.3/borel-rank-theorem
TauCeti.Borel.borelRankTheorem :
For a number field F and j≥2, dim_Q(K_{2j−1}(O_F)⊗Q)=d_j(F), where d_j(F)=r1+r2 when j is odd and r2 when j is even. The rank of an abelian group means dimension after tensoring with Q; it does not by itself assert finite generation or discreteness of a regulator image. This is the reserved supplier of Polylogarithms:P.4/zagier-determinant.
Hypotheses: j≥2; O_F is the ring of integers of F.
Prerequisites: BorelRegulators:R.3/division-order-rank-period, mathlib:NumberField.InfinitePlace.nrRealPlaces, mathlib:NumberField.InfinitePlace.nrComplexPlaces
API lemma signatures:
TauCeti.Borel.borelRankTheorem_odd : If j≥2 is odd, dim_Q K_{2j−1}(O_F)⊗Q=r1+r2.
TauCeti.Borel.borelRankTheorem_even : If j≥2 is even, dim_Q K_{2j−1}(O_F)⊗Q=r2.
TauCeti.Borel.borelRankTheorem_scalarExtension : The Q-rank equals dim_R(K_{2j−1}(O_F)⊗R).
TauCeti.Borel.borelRankTheorem_order : The corresponding odd-rank statement holds for every commutative order in F by divisionOrder_borelRank, without an unproved integral K-isomorphism.
TauCeti.Borel.borelRankTheorem_sIntegers : After the N.3:ranks localization/finite-residue-field comparison, the same rational rank holds for O_{F,S} with S finite.
Named example specifications:
TauCeti.Borel.borelRankTheorem_Q_two : dim_Q(K3(Z)⊗Q)=0.
TauCeti.Borel.borelRankTheorem_Q_three : dim_Q(K5(Z)⊗Q)=1.
TauCeti.Borel.borelRankTheorem_imaginary_quadratic : For [F:Q]=2, r1=0 and j≥2, the odd K-group rank is one.
TauCeti.Borel.borelRankTheorem_units_excluded : The theorem cannot be applied at j=1: rank K1(O_F)=r1+r2−1.
Theorem/application acceptance: For F=Q, j=2 gives rank zero and j=3 gives rank one. For an imaginary quadratic F, every j≥2 gives rank one.

BorelRegulators:R.3/s-integer-rank-import
TauCeti.Borel.borelRank_sIntegers :
For a commutative order A⊂F the period-four rational rank follows directly from Borel’s order theorem. For O_{F,S}, S a finite set of finite places, use N.3:ranks localization and torsion of positive K-groups of the finite residue fields to obtain K_i(O_F)⊗Q≅K_i(O_{F,S})⊗Q for i≥2. Hence the same odd rank formula holds. The integral groups and regulators of S-units in degree one are distinct statements.
Hypotheses: i≥2 and S finite; localization is imported, not reconstructed in R.3.
Prerequisites: BorelRegulators:R.3/borel-rank-theorem, BorelRegulators:R.3/division-order-rank-period, ArithmeticKTheory:N.3:ranks
Theorem/application acceptance: The rank formula is not copied into a second independent N.3 proof.

R.4
============================================================

BorelRegulators:R.4/archimedean-target
TauCeti.Borel.archimedeanTarget :
For a number field F and j≥2 let Σ_F=Hom(F,C), R(q)=(2πi)^q R and V_j(F)=(∏_{σ∈Σ_F}R(j−1))^conj, where conj acts simultaneously on coefficients and embeddings. After dividing each component by (2πi)^{j−1}, identify this with the real submodule of functions f:Σ_F→R satisfying f(σ̄)=(−1)^{j−1}f(σ). This submodule formulation extends to any finite set with an involution and uses the native embedding involution.
Hypotheses: F number field; j≥2. The coefficient twist is part of the definition.
Prerequisites: mathlib:NumberField.ComplexEmbedding.involutive_conjugate, mathlib:NumberField.InfinitePlace.mk_eq_iff
API lemma signatures:
TauCeti.Borel.archimedeanTarget_mk : A function satisfying f(σ̄)=(−1)^{j−1}f(σ) determines a target element.
TauCeti.Borel.archimedeanTarget_ext : Two elements are equal iff their evaluations at every σ agree.
TauCeti.Borel.archimedeanTarget_conjugate : Evaluation at σ̄ is (−1)^{j−1} times evaluation at σ.
TauCeti.Borel.archimedeanTarget_fixed_even : At a conjugation-fixed embedding, every target element is zero if j is even.
TauCeti.Borel.archimedeanTarget_twist : Multiplication by (2πi)^{j−1} identifies the real-function model with the simultaneous fixed subspace in ∏R(j−1).
TauCeti.Borel.archimedeanTarget_reindex : An involution-equivariant bijection of embedding sets induces a real linear equivalence, with identity and composition laws.
Named example specifications:
TauCeti.Borel.archimedeanTarget_fixed_weight_two : On a one-point embedding set with identity involution and j=2, the target is zero.
TauCeti.Borel.archimedeanTarget_pair_weight_two : On a two-point exchanged pair at j=2, the function (1,−1) is in the target and (1,1) is not.
TauCeti.Borel.archimedeanTarget_fixed_weight_three : On a fixed point at j=3, the constant function 1 belongs to the target.

BorelRegulators:R.4/target-coordinates
TauCeti.Borel.targetCoordinates :
Choose one complex embedding above each complex infinite place; real places have their unique real embedding. Let I_j(F) consist of all complex infinite places and the real infinite places only when j is odd. Evaluation at the chosen embeddings gives c_j:V_j(F)≃_R R^{I_j(F)}, with inverse reconstructing the conjugate coordinate by (−1)^{j−1} and putting zero at omitted real places. Define the reference Z-lattice c_j⁻¹(Z^{I_j}) and transport coordinate product Haar measure so that its covolume is one. The ambient Euclidean fixed-subspace metric is not the measure convention.
Hypotheses: The selection is explicit data; changing a complex representative changes its coordinate by (−1)^{j−1}.
Prerequisites: BorelRegulators:R.4/archimedean-target, mathlib:NumberField.InfinitePlace.mk_eq_iff, mathlib:IsZLattice, mathlib:ZLattice.covolume
API lemma signatures:
TauCeti.Borel.targetCoordinates_apply : In the native real-function model, c_j(x)(v)=x(σ_v). Starting from the complex Tate model, first use archimedeanTarget_twist to divide by the fixed generator (2πi)^{j−1} exactly once, then evaluate; no second division occurs in c_j.
TauCeti.Borel.targetCoordinates_symm : Reconstruction uses x_v at σ_v and (−1)^{j−1}x_v at σ̄_v, with zero at even-weight real places.
TauCeti.Borel.targetCoordinates_inverse : Evaluation and reconstruction are mutually inverse real linear maps.
TauCeti.Borel.targetCoordinates_change : Changing selected representatives gives a diagonal matrix with entries ±1 and absolute determinant one.
TauCeti.Borel.targetCoordinates_reference : The inverse image of Z^{I_j} is discrete, spans V_j and has covolume one for the transported coordinate measure.
TauCeti.Borel.targetCoordinates_ext : Agreement on the chosen coordinates determines a target element.
Named example specifications:
TauCeti.Borel.targetCoordinates_pair_two : At weight two one exchanged pair has coordinate a and reconstruction (a,−a).
TauCeti.Borel.targetCoordinates_empty : For F=Q and j=2 the coordinate space is R^0 and the reference lattice has covolume one.
TauCeti.Borel.targetCoordinates_representative_switch : Switching the embedding of an imaginary quadratic field at j=2 multiplies the single coordinate by −1 and preserves its absolute covolume.

BorelRegulators:R.4/target-dimension
TauCeti.Borel.archimedeanTarget_finrank :
For every number field F and j≥2, dim_R V_j(F)=d_j(F)=r1+r2 if j is odd and r2 if j is even. The integral reference lattice has the same Z-rank. The proof uses conjugation-fixed real embeddings and one independent coordinate for each exchanged complex pair.
Hypotheses: r2 counts conjugate pairs, using the pinned InfinitePlace definition.
Prerequisites: BorelRegulators:R.4/target-coordinates, mathlib:NumberField.InfinitePlace.nrRealPlaces, mathlib:NumberField.InfinitePlace.nrComplexPlaces, mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank
Theorem/application acceptance: For totally real F and j=2 the target dimension is zero.

BorelRegulators:R.4/universal-borel-class
TauCeti.Borel.universalBorelClass :
For j≥2 and N in the classical stable range, Bo_j∈H_cont^{2j−1}(GL_N(C),R(j−1)) is Burgos’s Definition 9.24 class: suspend ch_j in H^{2j}(BGL_N(C),R(j)), restrict to U_N, identify invariant forms on U_N\(U_N×U_N), identify the same complex relative cochain with coefficients R(j−1), and apply inverse van Est. The twist generator and suspension normalization are fixed by ch_j=(2πi)^j pr_j/j!, with the integral Bott/Hurewicz normalization from topological K-theory. The class restricts compatibly with N and is primitive.
Hypotheses: GL_N(C) is a real Lie group; choose N odd ≥4j+1 as a sufficient classical stability bound.
Prerequisites: AutomorphicFormsOnReductiveGroups:AF.1a, RefinedTraceMethods:RT.4:topological, BorelRegulators:R.3/compact-dual-cohomology, BorelRegulators:R.2/stable-hopf-compatibility
API lemma signatures:
TauCeti.Borel.universalBorelClass_stabilize : Block pullback Bo_j,N+1=Bo_j,N in the common stable range.
TauCeti.Borel.universalBorelClass_primitive : Block sum pulls Bo_j back to pr1*Bo_j+pr2*Bo_j.
TauCeti.Borel.universalBorelClass_conjugation : Complex conjugation and the Tate generator yield component parity (−1)^{j−1} on regulator values.
TauCeti.Borel.universalBorelClass_vanEst : Van Est sends Bo_j to the relative class obtained from the suspended normalized ch_j.
TauCeti.Borel.universalBorelClass_bott : The primitive compact-unitary pairing uses the Bott integral generator with ch_j, including its (j−1)! Hurewicz factor.
Named example specifications:
TauCeti.Borel.universalBorelClass_stable_two : At j=2, block pullback from GL_11(C) to GL_9(C) gives the same degree-three class.
TauCeti.Borel.universalBorelClass_abelian_two : Restriction to GL_1(C) has zero degree-three continuous class.
TauCeti.Borel.universalBorelClass_chern_factor : On indecomposables ch_3=(2πi)^3 c_3/2, so using c_3 without its factor cannot satisfy the normalization.

BorelRegulators:R.4/trace-cocycle
TauCeti.Borel.traceCocycle :
For j≥2 and m=2j−1, define Φ_m(X_1,…,X_m)=c_j∑_{s∈S_m}sgn(s)Tr(X_{s(1)}⋯X_{s(m)}), where c_j=(−1)^{j−1}(j−1)!/(2j−1)!, on complex square matrices. Regard the Lie algebra as real. The relative Borel representative is Φ_m(X_1†+X_1,…,X_m†+X_m); its absolute Lie cohomology class has invariant representative 2π_{j−1}Φ_m, with π_q(z)=(z+(−1)^q z̄)/2. These are equal as cohomology classes after relative-to-absolute inclusion, not pointwise as cochains.
Hypotheses: Finite matrix size N; trace and conjugate transpose are native Mathlib operations.
Prerequisites: mathlib:Matrix.trace_mul_comm, mathlib:Matrix.trace_conjTranspose, AutomorphicFormsOnReductiveGroups:AF.1a, BorelRegulators:R.4/universal-borel-class
API lemma signatures:
TauCeti.Borel.traceCocycle_alternating : Permuting the inputs multiplies Φ by the permutation sign; repeated inputs give zero.
TauCeti.Borel.traceCocycle_multilinear : Φ is complex multilinear before real-coefficient projection, and its relative and projected forms are real multilinear.
TauCeti.Borel.traceCocycle_block : On block-diagonal inputs Φ is the sum of the forms on the two blocks; adding a zero block leaves it unchanged.
TauCeti.Borel.traceCocycle_three : Φ3(X,Y,Z)=−Tr(X(YZ−ZY))/2.
TauCeti.Borel.traceCocycle_projection : π_q is the real-linear projection onto R(q)⊂C; the absolute Borel class is represented by 2π_{j−1}Φ.
TauCeti.Borel.traceCocycle_scalar : For m>1, if all inputs commute, Φ_m=0.
Named example specifications:
TauCeti.Borel.traceCocycle_scalar_two : For N=1 and j=2 the form vanishes on every triple.
TauCeti.Borel.traceCocycle_pauli_two : For the Hermitian Pauli matrices X,Y,Z with [Y,Z]=2iX and Tr(X²)=2, Φ3(X,Y,Z)=−2i.
TauCeti.Borel.traceCocycle_repeat : Φ3(X,X,Z)=0, ruling out the unalternated trace product.

BorelRegulators:R.4/borel-regulator
TauCeti.Borel.borelRegulator :
For a number field F and j≥2 define r_Bo,F:K_{2j−1}(F)→V_j(F) by each σ:F→C: apply σ* on K-theory, the genuine plus-space Hurewicz map, continuous-to-discrete restriction of Bo_j, and the homology/cohomology pairing in R(j−1). Conjugation gives the simultaneous fixed-subspace condition. The reserved arithmetic map r_Bo,O_F:K_{2j−1}(O_F)→V_j(F) is composition with the localization map O_F→F. Burgos’s renormalized convention is used, not Borel’s original lattice convention.
Hypotheses: j≥2; localization and plus/Q comparison are actual maps supplied by K.2 and N.3:ranks.
Prerequisites: BorelRegulators:R.4/universal-borel-class, BorelRegulators:R.4/archimedean-target, BorelRegulators:R.2/arithmetic-restriction, GeneralAlgebraicKTheory:K.2:plus, StableHomotopyKTheory:H.3, ArithmeticKTheory:N.3:ranks, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology
API lemma signatures:
TauCeti.Borel.borelRegulator_embedding : The σ-component equals r_Bo,C∘K(σ).
TauCeti.Borel.borelRegulator_add : r_Bo is an additive homomorphism; it kills every torsion element.
TauCeti.Borel.borelRegulator_integral : r_Bo,O_F=r_Bo,F∘K(O_F→F), and this localization is a rational isomorphism in degree 2j−1≥3.
TauCeti.Borel.borelRegulator_conjugation : In real Tate coordinates r_σ̄=(−1)^{j−1}r_σ.
TauCeti.Borel.borelRegulator_natural : For a field embedding f:F→E, r_E∘f*=pull_f∘r_F, with identity and composition laws.
TauCeti.Borel.borelRegulator_pairing : Pairing with Bo_j equals the corresponding component regulator on every genuine K-theory Hurewicz image.
TauCeti.Borel.borelRegulator_equiv : A number-field isomorphism gives the regulator square with the native reindexing of complex embeddings.
Named example specifications:
TauCeti.Borel.borelRegulator_Q_two : r_Bo:K3(Z)→V2(Q) is zero because the target is zero.
TauCeti.Borel.borelRegulator_torsion : For any nonzero integer a with a·x=0, r_Bo(x)=0.
TauCeti.Borel.borelRegulator_imaginary_conjugate : At weight two over an imaginary quadratic F the two components are (a,−a), not (a,a).

BorelRegulators:R.4/embedding-pull-trace
TauCeti.Borel.embeddingPullTrace :
For a finite extension f:F→E define pull_f:V_j(F)→V_j(E) by (pull_f x)_τ=x_{τ∘f}, and Tr_f:V_j(E)→V_j(F) by (Tr_f y)_σ=∑_{τ∘f=σ}y_τ. Both are real linear and preserve conjugation parity. Every complex embedding σ has exactly [E:F] extensions, hence Tr_f∘pull_f=[E:F]·id. Coordinate matrices are obtained only after targetCoordinates; they are not obtained by discarding the conjugate member of each fiber.
Hypotheses: F,E number fields and f a field embedding; coefficients use the same Tate generator.
Prerequisites: BorelRegulators:R.4/archimedean-target, BorelRegulators:R.4/target-coordinates, mathlib:NumberField.ComplexEmbedding.involutive_conjugate, mathlib:AlgHom.card
API lemma signatures:
TauCeti.Borel.embeddingPull_apply : (pull_f x)_τ=x_{τ∘f}.
TauCeti.Borel.embeddingTrace_apply : (Tr_f y)_σ is the sum over the full embedding fiber above σ.
TauCeti.Borel.embeddingPullTrace_id : Pullback and trace along identity are identity.
TauCeti.Borel.embeddingPullTrace_comp : Pull_{g∘f}=pull_g∘pull_f and Tr_{g∘f}=Tr_f∘Tr_g.
TauCeti.Borel.embeddingTrace_pull : Tr_f∘pull_f=[E:F]·id.
TauCeti.Borel.embeddingPullTrace_conjugate : Both maps preserve the defining conjugation parity and therefore land in the fixed targets.
Named example specifications:
TauCeti.Borel.embeddingPullTrace_identity : For f=id both maps are identity in every weight.
TauCeti.Borel.embeddingPullTrace_quadratic_odd : For Q⊂Q(i) at j=3, the one-coordinate pull matrix is (1) and the trace matrix is (2).
TauCeti.Borel.embeddingPullTrace_quadratic_even : For Q⊂Q(i) at j=2 the trace to the zero target V2(Q) is zero; summing the pair (a,−a) gives zero.

BorelRegulators:R.4/regulator-transfer
TauCeti.Borel.borelRegulator_transfer :
For a finite number-field extension f:F→E and j≥2, r_E∘f*=pull_f∘r_F and r_F∘f_*=Tr_f∘r_E on higher K-groups of fields, where f_* is restriction-of-scalars transfer. Thus r_F∘f_*∘f*=[E:F]r_F. The same formula for rings of integers uses their finite projective transfer and compatibility with localization; no unramified hypothesis is added to this field-level formula.
Hypotheses: Transfer is the genuine exact-category transfer, compatible with field localization; its embedding Mackey/base-change formula is requested from K.2.
Prerequisites: BorelRegulators:R.4/borel-regulator, BorelRegulators:R.4/embedding-pull-trace, GeneralAlgebraicKTheory:K.2:plus, ArithmeticKTheory:N.3:ranks, GeneralAlgebraicKTheory:K.3
Theorem/application acceptance: An even-weight real target receives the sum of a conjugate pair, which is zero.

BorelRegulators:R.4/regulator-adams-products
TauCeti.Borel.borelRegulator_adams :
For a number field F, j≥2 and integer a≥1, r_j(ψ^a x)=a^j r_j(x) on rational K_{2j−1}(F). In the rational Adams decomposition, r_j vanishes on every weight w≠j. Its Deligne interpretation is the degree-one target H_D^1(F,R(j)); multiplication is compatible with higher Chern characters under the motivic/Deligne comparison. A product of two positive-degree higher K-classes landing in K_{2j−1}(F) has zero real regulator: one factor has positive even degree and is rationally zero by the field-rank theorem. Multiplication by a K0 class multiplies the regulator by its rank.
Hypotheses: Higher operations, higher Chern characters and multiplicative Deligne comparison are imported; K0 Adams operations alone do not suffice.
Prerequisites: BorelRegulators:R.4/borel-regulator, BorelRegulators:R.3/borel-rank-theorem, SchemeKTheoryOperations:S.6/quillen-hiller-operations, SchemeKTheoryOperations:S.6/operations-functoriality, SchemeKTheoryOperations:S.6/adams-product-compatibility, SchemeKTheoryOperations:S.6/field-weight-decomposition, RefinedTraceMethods:RT.4:topological, MotivicEtaleKTheory:M.8, ArithmeticKTheory:N.3:ranks
Theorem/application acceptance: For a=2 and j=3 the scale is 8, not 4 or 2. The product statement concerns positive-degree factors; products with K0 ranks multiply the regulator by that rank.

BorelRegulators:R.4/regulator-real-isomorphism
TauCeti.Borel.borelRegulator_realIso :
For F a number field and j≥2, the linear extension r_Bo,O_F⊗R:K_{2j−1}(O_F)⊗R→V_j(F) is an isomorphism. The same is true for K_{2j−1}(F)⊗R using localization. This is proved from the normalized primitive compact-dual pairing and arithmetic stable comparison, not merely from equality of source and target dimensions.
Hypotheses: No integral finite-generation hypothesis is used.
Prerequisites: BorelRegulators:R.4/universal-borel-class, BorelRegulators:R.4/borel-regulator, BorelRegulators:R.4/target-dimension, BorelRegulators:R.3/borel-rank-theorem, BorelRegulators:R.3/cartan-serre-application, ArithmeticKTheory:N.3:ranks
Theorem/application acceptance: Nonzero primitive pairing is essential; a zero map between equal-dimensional spaces is excluded.

BorelRegulators:R.4/regulator-lattice
TauCeti.Borel.borelRegulator_isZLattice :
For F a number field and j≥2, let L_j=r_Bo(K_{2j−1}(O_F))⊂V_j(F) as a native Z-submodule. Arithmetic finite generation from N.3 and the real regulator isomorphism imply that K_{2j−1}(O_F)/tors is free of rank d_j, its induced regulator is injective, and L_j is discrete with real span V_j. Thus IsZLattice R L_j applies. Finite generation is explicitly needed here, though it was not needed for R.3 ranks.
Hypotheses: Integral finite generation is imported from N.3; torsion is killed by any homomorphism to a real vector space.
Prerequisites: BorelRegulators:R.4/regulator-real-isomorphism, BorelRegulators:R.4/borel-regulator, BorelRegulators:R.4/target-coordinates, ArithmeticKTheory:N.3:finite-generation, mathlib:IsZLattice
Theorem/application acceptance: A finitely generated subgroup whose rank exceeds the ambient dimension can be nondiscrete; the real isomorphism prevents this.

BorelRegulators:R.4/regulator-determinant
TauCeti.Borel.regulatorMatrix :
Let A=K_{2j−1}(O_F)/tors, d=d_j, with an integral basis b and selected target coordinates c_j. Define the regulator matrix M_{v,a}=c_j(r_Bo(b_a))_v and the top exterior map det(r):Λ^d_R(A⊗R)→Λ^d_R V_j. Its value on b_1∧⋯∧b_d is det(M) times the coordinate orientation. A unimodular integral basis change U multiplies det(M) by det(U)=±1; its absolute value is intrinsic. For d=0 use the empty determinant 1.
Hypotheses: A is finite free from the arithmetic finiteness theorem; determinant-line objects use native exterior algebra rather than an unconstrained carrier.
Prerequisites: BorelRegulators:R.4/regulator-lattice, BorelRegulators:R.4/target-coordinates, mathlib:ExteriorAlgebra, mathlib:ZLattice.covolume_eq_det, mathlib:LinearMap.toMatrix
API lemma signatures:
TauCeti.Borel.regulatorMatrix_apply : M_{v,a}=c_j(r_Bo(b_a))_v.
TauCeti.Borel.regulatorMatrix_basis_change : For b′=bU, M(b′)=M(b)U and det M(b′)=det M(b)det U.
TauCeti.Borel.regulatorMatrix_target_change : Changing embedding representatives gives M′=DM for a diagonal sign matrix D.
TauCeti.Borel.regulatorMatrix_topExterior : The top exterior regulator map is multiplication by det M in the specified orientations.
TauCeti.Borel.regulatorMatrix_scalar : Multiplying the regulator by λ multiplies det M by λ^d.
TauCeti.Borel.regulatorMatrix_empty : At d=0 the matrix is 0×0 and its determinant is one.
Named example specifications:
TauCeti.Borel.regulatorMatrix_rank_zero : The determinant at rank zero is 1.
TauCeti.Borel.regulatorMatrix_swap : Swapping two integral basis vectors negates the determinant and preserves its absolute value.
TauCeti.Borel.regulatorMatrix_double_two : For d=2, doubling every regulator component multiplies the determinant by 4, not by 2.

BorelRegulators:R.4/regulator-covolume
TauCeti.Borel.regulatorCovolume :
Define R_Bo,j(F)>0 as the native ZLattice.covolume of the arithmetic regulator image L_j with respect to the target measure transported from targetCoordinates. Equivalently R_Bo,j(F)=|det M| for any integral basis of K_{2j−1}(O_F)/tors. The reference fixed Tate integer lattice has covolume one. At d_j=0 set R_Bo,j(F)=1, agreeing with native zero-dimensional volume.
Hypotheses: The full-lattice result and its discrete topology are established, not implicit assumptions on an arbitrary image.
Prerequisites: BorelRegulators:R.4/regulator-lattice, BorelRegulators:R.4/regulator-determinant, BorelRegulators:R.4/target-coordinates, mathlib:ZLattice.covolume, mathlib:ZLattice.covolume_eq_det
API lemma signatures:
TauCeti.Borel.regulatorCovolume_det : R_Bo,j=|det regulatorMatrix| under the selected coordinate measure.
TauCeti.Borel.regulatorCovolume_pos : The covolume is strictly positive for the proven full lattice.
TauCeti.Borel.regulatorCovolume_basis_independent : Every integral basis and every allowed representative selection gives the same positive value.
TauCeti.Borel.regulatorCovolume_scalar : For a nonzero real scalar λ, the image lattice of λr has covolume |λ|^{d_j}R_Bo,j.
TauCeti.Borel.regulatorCovolume_original : Relative to Borel’s original R′, R_Bo=(2π)^{d_j}R′ if j≢3 mod4, and R_Bo=(2π)^{d_j}2^{r1}R′ if j≡3 mod4.
Named example specifications:
TauCeti.Borel.regulatorCovolume_zero_rank : For F=Q and j=2 the covolume is 1.
TauCeti.Borel.regulatorCovolume_rank_one_sign : For a rank-one matrix (a), the covolume is |a| and is unchanged by a↦−a.
TauCeti.Borel.regulatorCovolume_reference : The reference lattice Z^{I_j} has native coordinate covolume 1; no √2 per complex pair occurs.

R.5
============================================================

BorelRegulators:R.5/completed-zeta-conventions
TauCeti.Borel.completedZeta_convention :
Specialize the AL.1 completed Hecke L-function to the trivial idele-class character and compare its Re(s)>1 finite product with the pinned Dedekind L-series. Adopt Γ_R(s)=π^{−s/2}Γ(s/2), Γ_C(s)=2(2π)^{−s}Γ(s) and Λ_F(s)=|D_F|^{s/2}Γ_R(s)^{r1}Γ_C(s)^{r2}ζ_F(s). Since AL.1 uses L_C(s)=(2π)^{1−s}Γ(s)=πΓ_C(s), the adopted completion is |D_F|^{s/2}π^{−r2}Λ_AL(s,1). It satisfies Λ_F(s)=Λ_F(1−s), with only simple poles at 0 and 1. ζ_F here denotes the imported meromorphic continuation, which agrees with NumberField.dedekindZeta only in the convergence half-plane.
Hypotheses: F number field; D_F absolute discriminant in the positive power, although signed D is used in rational differential-form restriction of scalars.
Prerequisites: AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function, AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation, AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor, AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation, mathlib:NumberField.dedekindZeta, tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd
Theorem/application acceptance: The π per complex place is explicit; it must not become a hidden rational factor.

BorelRegulators:R.5/zeta-zero-order
TauCeti.Borel.dedekindZeta_vanishingOrder :
For F a number field and j≥2, ζ_F is holomorphic at s0=1−j and has exact vanishing order d_j=dim_R V_j(F). If j is odd, each real Γ_R factor and each complex Γ_C factor has a simple pole at s0, giving d_j=r1+r2; if j is even, only the complex factors have poles, giving d_j=r2. Λ_F(s0)=Λ_F(j) is finite and nonzero because ζ_F(j)>0. Thus no additional zero is possible. At a totally real field and j=2, ζ_F(−1) is finite and nonzero, not a pole.
Hypotheses: Use the continued zeta, j≥2, and the exact gamma pole/residue interfaces from AL.1.
Prerequisites: BorelRegulators:R.5/completed-zeta-conventions, BorelRegulators:R.4/target-dimension, AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory, tauceti:TauCeti.dedekindZeta_ne_zero_of_one_lt_re
Theorem/application acceptance: For Q and j=2 the exact order is zero; for Q and j=3 it is one.

BorelRegulators:R.5/zeta-leading-coefficient
TauCeti.Borel.normalizedLeadingCoefficient :
For the holomorphic continued ζ_F at s0=1−j with d=d_j, define ζ_F*(1−j)=ζ_F^{(d)}(s0)/d!, equivalently the value g(s0) in the unique germ factorization ζ_F(s)=(s−s0)^d g(s) with g holomorphic and g(s0)≠0. It is also lim_{s→s0}ζ_F(s)/(s−s0)^d. The generic signature uses a native analytic function f, its complex iterated derivative and the proven exact order; specialization to ζ_F imports its continuation.
Hypotheses: F number field, j≥2; d is exact vanishing order, not an arbitrary exponent.
Prerequisites: BorelRegulators:R.5/zeta-zero-order, mathlib:iteratedDeriv
API lemma signatures:
TauCeti.Borel.normalizedLeadingCoefficient_order_zero : For d=0 the coefficient of an analytic f at s0 is f(s0).
TauCeti.Borel.normalizedLeadingCoefficient_factor : If f=(s−s0)^d g as analytic germs, the coefficient equals g(s0).
TauCeti.Borel.normalizedLeadingCoefficient_limit : For a zero of exact order d it equals the removable limit f(s)/(s−s0)^d.
TauCeti.Borel.normalizedLeadingCoefficient_ne_zero : For finite exact vanishing order d, the coefficient is nonzero.
TauCeti.Borel.normalizedLeadingCoefficient_smul : Multiplying f by a complex scalar a multiplies the coefficient by a.
TauCeti.Borel.zetaLeadingCoefficient_real : The specialized zeta coefficient is real and nonzero by conjugation symmetry.
Named example specifications:
TauCeti.Borel.normalizedLeadingCoefficient_square : For f(z)=z² at s0=0 and d=2 the coefficient is 1, whereas f″(0)=2.
TauCeti.Borel.normalizedLeadingCoefficient_constant : For f(z)=7 and d=0 the coefficient is 7.
TauCeti.Borel.normalizedLeadingCoefficient_wrong_order : For f(z)=z³ at 0, the coefficient with d=2 is zero, so d=2 fails the exact-order nonzero test.

BorelRegulators:R.5/leading-term-functional-equation
TauCeti.Borel.zetaLeading_functionalEquation :
Write A_F(s)=Γ_R(s)^{r1}Γ_C(s)^{r2} and a_{F,j}=lim_{s→1−j}(s+j−1)^{d_j}A_F(s), a nonzero real number determined by gamma residues. Then ζ_F*(1−j)=|D_F|^{j−1/2} A_F(j)ζ_F(j)/a_{F,j}. Consequently |ζ_F*(1−j)|∼_Q |D_F|^{1/2}π^{d_j−[F:Q]j}ζ_F(j), where ∼_Q means quotient in Q×. The integer factor |D_F|^{j−1}, signs, powers of 2 and factorials are rational factors; the exact formula retains them before taking proportionality.
Hypotheses: j≥2; completed-zeta convention and exact zero order fixed.
Prerequisites: BorelRegulators:R.5/zeta-leading-coefficient, BorelRegulators:R.5/completed-zeta-conventions, AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory, mathlib:riemannZeta_neg_nat_eq_bernoulli
Theorem/application acceptance: For Q,j=2 the formula gives ζ(−1)=−1/12.

BorelRegulators:R.5/compact-factor-comparison
TauCeti.Borel.arithmeticCompactFactorComparison :
Let F be a number field, N odd, G_N=SL_N(F⊗R), K_N its standard maximal compact, Γ⊂SL_N(F) a torsion-free arithmetic subgroup, Y_N=Γ\G_N and X_N=Γ\G_N/K_N. Put g=Lie(G_N)⊗C, k=Lie(K_N)⊗C and let G_u be the compact real form with compact dual X_u=G_u/K_N. Absolute invariant forms give β:H*(g;C)→H*(Y_N;C), and relative invariant forms give j:H*(g,k;C)→H*(X_N;C). The compact-form isomorphisms α:H*(g;C)≅H*(G_u;C) and α_rel:H*(g,k;C)≅H*(X_u;C) commute with relative-to-absolute inclusion and quotient pullback: β∘incl=p*∘j. The corresponding three compact-fiber spectral sequences commute. For odd N the restriction H*(G_u;C)→H*(K_N;C) is onto, these spectral sequences degenerate, and H*(G_u;C)=Λ(P_base⊕P_K), where quotient pullback identifies Λ(P_base) with H*(X_u;C) and restriction identifies Λ(P_K) with H*(K_N;C). Whenever the arithmetic relative comparison is an isomorphism in degrees ≤q, so is β in degrees ≤q. In those degrees the decomposition induces the compact/base primitive determinant-line factorization used in the period theorem; comparisons of its algebraic and singular rational structures retain Borel’s coefficient-conversion table.
Hypotheses: N odd is essential for the real SO_N compact fiber to be totally nonhomologous to zero; N even is not asserted. Γ is torsion-free for the manifold bundle; real/complex finite-index descent is applied separately. A sufficient arithmetic bound is N−1>4[F:Q]q.
Prerequisites: BorelRegulators:R.2/arithmetic-invariant-form-map, BorelRegulators:R.3/classical-compact-duals, BorelRegulators:R.3/compact-dual-cohomology, BorelRegulators:R.3/arithmetic-stable-range, AutomorphicFormsOnReductiveGroups:AF.1a, ArithmeticLocallySymmetricSpaces:ALS.5, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
Theorem/application acceptance: For a complex place the compact-dual group is SU_N×SU_N and the diagonal SU_N fiber restricts surjectively; the base primitive is the difference of the two factor primitives. The degree-one real SO₂ fiber in SU₂ is not onto on H¹; the odd-rank hypothesis cannot be dropped. The period theorem uses β on the full arithmetic quotient, while the stable-rank theorem uses j on the symmetric-space quotient. Their commuting diagram is required before determinant splitting.

BorelRegulators:R.5/borel-positive-zeta-period
TauCeti.Borel.borel_positiveZetaPeriod :
Let F have degree d, j≥2 and N odd with N−1>4d(2j−1). Let Y_N=SL_N(O_F)\SL_N(F⊗R), with the quotient orientation and coefficient conventions of Borel 1977. The top exterior product of the d algebraic primitive classes of degree 2j−1 maps to ζ_F(j) times the corresponding rational cohomology determinant line of Y_N, up to Q× (Theorem 5.5 with m=j−1). After passage through the compact-factor determinant splitting and the corrected restriction-of-scalars normalization, the compact-dual arithmetic indecomposable determinant is scaled, up to Q×, by |D_F|^{1/2}π^{−dj}ζ_F(j). Signed discriminant phases are handled by the 1980 erratum; this line comparison does not yet fix an integral K-basis.
Hypotheses: The specialized norm-one Tamagawa volumes and compact period cycles of R.6 are proved first; all determinant spaces here have their stated rational structures.
Prerequisites: BorelRegulators:R.6/compact-period-cycles, BorelRegulators:R.6/norm-one-volume, BorelRegulators:R.6/restriction-scalars-form, BorelRegulators:R.3/arithmetic-stable-range, BorelRegulators:R.3/compact-dual-cohomology, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality, BorelRegulators:R.5/compact-factor-comparison, BorelRegulators:R.6/adelic-period-pairing
Theorem/application acceptance: The period proof includes a nonzero-cycle argument; rationality of Haar measure alone does not prove regulator proportionality.

BorelRegulators:R.5/borel-zeta-proportionality
TauCeti.Borel.borelRegulator_zetaProportional :
For a number field F and j≥2, R_Bo,j(F)∼_Q |ζ_F*(1−j)|, equivalently there exists q∈Q_{>0} with R_Bo,j(F)=q|ζ_F*(1−j)|. In Borel’s original homotopy-lattice convention R′_j∼_Q π^{−d_j}|ζ_F*(1−j)|. Burgos’s renormalization multiplies that covolume by (2π)^{d_j}, and by the additional rational factor 2^{r1} when j≡3 mod4. This removes the transcendental π discrepancy. No formula for q in terms of torsion orders or dyadic factors is asserted.
Hypotheses: j≥2; finite generation, full regulator lattice, analytic continuation and the primitive-period theorem are all established inputs.
Prerequisites: BorelRegulators:R.5/borel-positive-zeta-period, BorelRegulators:R.5/leading-term-functional-equation, BorelRegulators:R.4/regulator-covolume
Theorem/application acceptance: For Q,j=2, R=1 and |ζ*(−1)|=1/12 give a rational ratio 12. An integral Lichtenbaum torsion identity does not follow from this theorem.

R.6
============================================================

BorelRegulators:R.6/archimedean-split-division
TauCeti.Borel.exists_archimedeanSplitDivision :
For every number field F and integer e≥2 there exists a central division F-algebra D of dimension e² with D⊗_F F_v≅M_e(F_v) at every archimedean place. One explicit construction chooses e distinct finite places, assigns Brauer invariant 1/e at each and zero elsewhere, and uses the global sum-zero sequence. To conclude division degree exactly e, one needs a degree-e splitting extension or the number-field period=index theorem; exactness of the Brauer sequence alone is insufficient.
Hypotheses: The required cyclic splitting-field statement is the precise finite-place specialization used by Borel Lemma 2.2, not an unrestricted Grunwald assertion.
Prerequisites: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, AdelicAlgebraicGroups:AA.1
Theorem/application acceptance: For e=2 choose two finite invariants 1/2 and no real invariant; a quaternion algebra ramified at a real place fails the condition.

BorelRegulators:R.6/norm-one-tamagawa
TauCeti.Borel.normOne_tamagawaNumber :
For a central division algebra D over a number field F, H=SL_1(D) is the simply connected inner form of SL_e, and its canonically normalized Tamagawa number is τ(H)=1. For the regulator period proof it suffices to know τ(H)∈Q×. This is a specialized theorem owned here; AA.2 supplies generic measure and quotient conventions and AA.3 supplies anisotropic compactness, but neither by itself computes τ(H).
Hypotheses: D has degree e≥2; use Weil’s Tamagawa normalization, including discriminant factor and all finite places.
Prerequisites: AdelicAlgebraicGroups:AA.1, AdelicAlgebraicGroups:AA.2, AdelicAlgebraicGroups:AA.3
Theorem/application acceptance: Changing one local measure without the compensating product normalization changes τ and invalidates τ=1.

BorelRegulators:R.6/local-sl-volume
TauCeti.Borel.specialLinear_localVolume :
At a good finite place v where H is split with integral model SL_e and residue field of cardinality q_v, the algebraic differential-form measure normalized as in AA.2 gives μ_v(SL_e(O_v))=q_v^{−(e²−1)}#SL_e(F_{q_v})=∏_{a=2}^e(1−q_v^{−a}). At the finitely many exceptional places, compact-open volume with respect to an F-rational invariant form is a positive rational number. The finite product of exceptional volume ratios is therefore in Q_{>0}.
Hypotheses: q_v is a finite-field cardinality, e≥2; integral form is a generator at good places.
Prerequisites: AdelicAlgebraicGroups:AA.1, AdelicAlgebraicGroups:AA.2
Theorem/application acceptance: For e=2,q=2 the volume is 3/4. The product begins at a=2, so no divergent ζ_F(1) factor appears.

BorelRegulators:R.6/norm-one-volume
TauCeti.Borel.normOne_archimedeanVolume :
For an archimedean-split division algebra D of degree e≥2, H=SL_1(D), a nonzero F-rational invariant top form ω and any arithmetic Γ⊂H(F), μ_∞(H(F⊗R)/Γ)∼_Q∏_{a=2}^e ζ_F(a), with μ_∞ the discriminant-normalized positive archimedean measure from ω. H(A_F)/H(F) is compact. Taking Γ_U=H(F)∩(H_∞U), AA.4 strong approximation gives H(A_F)=H(F)H_∞U and τ(H)=μ_∞(H_∞/Γ_U)vol_f(U). Commensurable arithmetic groups change this volume by a positive rational index.
Hypotheses: H is anisotropic over F, simply connected and archimedean-split; H_∞ is noncompact, satisfying the strong approximation hypothesis outside the infinite places.
Prerequisites: BorelRegulators:R.6/archimedean-split-division, BorelRegulators:R.6/norm-one-tamagawa, BorelRegulators:R.6/local-sl-volume, AdelicAlgebraicGroups:AA.2, AdelicAlgebraicGroups:AA.3, AdelicAlgebraicGroups:AA.4, tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd
Theorem/application acceptance: For e=2 only ζ_F(2) occurs. The proof does not use R.5 regulator proportionality, avoiding a circular Tamagawa reformulation.

BorelRegulators:R.6/restriction-scalars-form
TauCeti.Borel.restrictionScalarsForm :
Choose an ordered integral basis α_1,…,α_d and ordered complex embeddings σ_1,…,σ_d. Put δ_F=det(σ_i(α_a)), so δ_F²=D_F is the signed discriminant and (−1)^{r2}D_F>0. For an F-rational invariant q-form η define Rη=δ_F^{−q}∧_{σ∈Σ_F}ση on the restriction-of-scalars complex group. For a top form of F-dimension h, the associated positive archimedean Haar measure instead uses |D_F|^{−h/2}∏_{v|∞}|ω_v|. These signed algebraic and positive measure conventions are distinct and are related with their conjugate-pair orientation factors.
Hypotheses: δ_F≠0; embedding order and integral-basis orientation are recorded. Use the 1980 correction to the algebraic form.
Prerequisites: mathlib:ExteriorAlgebra, AdelicAlgebraicGroups:AA.1, AdelicAlgebraicGroups:AA.2, mathlib:NumberField.basisMatrix, mathlib:NumberField.discr_eq_basisMatrix_det_sq, mathlib:NumberField.sign_discr
API lemma signatures:
TauCeti.Borel.restrictionScalarsForm_factor : The algebraic normalization scalar is δ_F^{−q}.
TauCeti.Borel.restrictionScalarsForm_embedding_order : Permuting embeddings changes both δ_F^{−q} and the wedge by the same permutation-sign power, so Rη is unchanged.
TauCeti.Borel.restrictionScalarsForm_integral_basis : An integral basis change of determinant ±1 changes the algebraic normalization by (±1)^q; the rational line and positive Haar measure are unchanged.
TauCeti.Borel.restrictionScalarsForm_positive_measure : The positive top-form measure has scalar |D_F|^{−h/2}, agreeing with the AA.2 Tamagawa convention.
TauCeti.Borel.restrictionScalarsForm_scalar : For a∈F×, R(aη)=Norm_{F/Q}(a)Rη.
TauCeti.Borel.restrictionScalarsForm_erratum : In Borel 5.5(1),(4) and 6.2(5) the corrected identities remove the printed i^{r2}; this does not remove every orientation phase elsewhere.
Named example specifications:
TauCeti.Borel.restrictionScalarsForm_Q : For F=Q with integral basis (1), δ=1 and Rη=η.
TauCeti.Borel.restrictionScalarsForm_Qi : For F=Q(i), basis (1,i) and embeddings (id,conj), δ=−2i and D=−4; at q=1 the scalar is i/2.
TauCeti.Borel.restrictionScalarsForm_absolute_wrong : In that Q(i) case the scalar 1/2 from |D|½ gives a different algebraic form and fails δ²=D.

BorelRegulators:R.6/compact-period-cycles
TauCeti.Borel.compactPeriodCycle :
For an archimedean-split central division F-algebra D of degree e, choose a neat arithmetic Γ_D⊂SL_1(D)(F). The quotient Z_D=Γ_D\SL_1(D)(F⊗R) is a compact oriented manifold of real dimension [F:Q](e²−1). The left regular F-representation on D gives SL_1(D)→SL_{e²}; after a lattice choice and finite-index passage it maps Γ_D into SL_N(O_F) for every sufficiently large N. Its compact fundamental cycle defines a period functional on the ambient arithmetic cohomology. Pullback of each algebraic SL_N primitive generator of weight 2≤j≤e is e times the corresponding standard SL_e generator under the archimedean splitting, and the relevant top exterior pairing is nonzero.
Hypotheses: Choose N≥e² and large enough for the primitive-degree arithmetic comparison; torsion-free/neat descent is imported from ALS.2.
Prerequisites: BorelRegulators:R.6/archimedean-split-division, BorelRegulators:R.6/norm-one-volume, BorelRegulators:R.3/compact-dual-cohomology, AdelicAlgebraicGroups:AA.1, ArithmeticLocallySymmetricSpaces:ALS.2, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality, BorelRegulators:R.5/compact-factor-comparison
API lemma signatures:
TauCeti.Borel.compactPeriodCycle_fundamental : Z_D has its integral fundamental class in top degree with the selected orientation.
TauCeti.Borel.compactPeriodCycle_map : The cycle map comes from the left regular representation followed by block inclusion.
TauCeti.Borel.compactPeriodCycle_primitive : For 2≤j≤e, pullback of the normalized algebraic primitive generator is e times the split standard generator.
TauCeti.Borel.compactPeriodCycle_integral : Pairing the normalized top invariant form with the cycle equals its finite quotient-volume integral.
TauCeti.Borel.compactPeriodCycle_cover : Passing to a subgroup of index a multiplies the pushed-forward fundamental class and top-form integral by a.
TauCeti.Borel.compactPeriodCycle_orientation : Reversing orientation negates the signed period and preserves the positive volume.
Named example specifications:
TauCeti.Borel.compactPeriodCycle_degree_two : For e=2, left regular representation has F-dimension 4 and the weight-two primitive pullback factor is 2.
TauCeti.Borel.compactPeriodCycle_finite_cover : An index-two neat subgroup doubles the top period.
TauCeti.Borel.compactPeriodCycle_split_algebra_wrong : Replacing division D by M_e(F) gives an isotropic group and does not supply the compact quotient used here.

BorelRegulators:R.6/adelic-period-pairing
TauCeti.Borel.adelicPeriodPairing :
For the compact oriented cycle Z_D and compact-open U with Γ_D=H(F)∩H_∞U, define I_D(η,U)=∫_{Z_D}η for every real-valued rational invariant top form η, including zero. For nonzero η let c_η>0 be the explicitly computed conversion scalar satisfying μ_∞^Tam=c_η|η| in the fixed AA.2 normalization. Then μ_∞^Tam(Z_D)=c_η|I_D(η,U)| and c_η|I_D(η,U)|vol_f(U)=τ(H). The scalar is obtained from the differential-form and restriction-of-scalars conventions, rather than assumed equal to one. For primitive wedge forms this integral equals the singular/de Rham pairing with [Z_D]. This is the specialized period interface needed in Bloch’s Tamagawa formulation.
Hypotheses: The quotient is compact and oriented. The integration map is defined for zero; c_η and the volume formula require η≠0. All local measures and the selected rational Tamagawa form are fixed compatibly.
Prerequisites: BorelRegulators:R.6/compact-period-cycles, BorelRegulators:R.6/restriction-scalars-form, BorelRegulators:R.6/norm-one-volume, AdelicAlgebraicGroups:AA.2, ArithmeticLocallySymmetricSpaces:ALS.5, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality
API lemma signatures:
TauCeti.Borel.adelicPeriodPairing_linear : I_D is linear in the top form for a fixed orientation and quotient.
TauCeti.Borel.adelicPeriodPairing_cohomology : For a closed top form, I_D equals the de Rham/singular pairing with the fundamental class.
TauCeti.Borel.adelicPeriodPairing_volume : For η≠0, μ_∞^Tam(Z_D)=c_η|I_D(η,U)| and c_η|I_D(η,U)|vol_f(U)=τ(H), with c_η specified by the actual form-to-measure equality.
TauCeti.Borel.adelicPeriodPairing_local_rescale : Rescaling local measures by a_v, all but finitely many one, rescales the total measure by ∏a_v; the archimedean/finite product equation changes accordingly.
TauCeti.Borel.adelicPeriodPairing_cover : Finite cover of degree a multiplies the integral by a.
TauCeti.Borel.adelicPeriodPairing_form_rescale : With measures fixed and a∈Q×, I_D(aη,U)=aI_D(η,U) and c_{aη}=c_η/|a|. Thus the converted quotient volume is unchanged.
Named example specifications:
TauCeti.Borel.adelicPeriodPairing_zero_form : The integral of the zero top form is zero.
TauCeti.Borel.adelicPeriodPairing_sign : Replacing η by −η negates I_D but leaves its absolute volume unchanged.
TauCeti.Borel.adelicPeriodPairing_rescale : Doubling one finite local measure doubles the finite product; the normalization equation cannot stay unchanged without its compensating global conversion.
TauCeti.Borel.adelicPeriodPairing_double_form : With all Tamagawa measures fixed, replacing nonzero η by 2η doubles I_D and halves c_η; the unconverted equation |I_D|vol_f(U)=τ(H) cannot hold for both forms.

BorelRegulators:R.6/bloch-borel-interface
TauCeti.Borel.bloch_borelPairingComparison :
Identify the primitive cohomology pairing and finite-volume integrals in Bloch’s first four lectures with the Borel adelicPeriodPairing after the exact local differential-form, discriminant and archimedean conversion. The required comparison is an equality of pairings and their measure-conversion scalars, followed by the already proved R.5 rational zeta proportionality; it is not an axiom that restates Borel’s conclusion. The exact Bloch-side definition and locator remain a source-access gap, so this node has a specified consumer interface but no claimed source-complete proof.
Hypotheses: An independently read primary version of Bloch’s first four lectures is required to instantiate this comparison.
Prerequisites: BorelRegulators:R.6/adelic-period-pairing, BorelRegulators:R.6/restriction-scalars-form, BorelRegulators:R.5/borel-zeta-proportionality
Theorem/application acceptance: An exact Bloch locator and its measure table are needed before this comparison can be closed.

R.7
============================================================

BorelRegulators:R.7/relative-absolute-injectivity
TauCeti.Borel.complexGL_relativeToAbsolute_injective :
For GL_N(C) as a real Lie group with maximal compact U_N, the relative-to-absolute Lie cohomology map H*(gl_N(C),u_N;R(j−1))→H*(gl_N(C);R(j−1)) is injective in the primitive range needed here. Under compact duality it is the pullback H*(U_N)→H*(U_N×U_N), sending each primitive generator to the difference of its two factor generators; this gives an explicit left inverse on the generated exterior subalgebra. Thus equality of the absolute images of Bo_j and Be_j determines equality of their relative classes.
Hypotheses: Use the GL_N(C) symmetric pair; no injectivity assertion is made for arbitrary relative Lie pairs.
Prerequisites: AutomorphicFormsOnReductiveGroups:AF.1a, tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-7-complexification-and-real-forms, tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent, BorelRegulators:R.3/compact-dual-cohomology
Theorem/application acceptance: Equality of absolute representatives is used only with this injectivity input.

BorelRegulators:R.7/beilinson-infinitesimal-representative
TauCeti.Borel.beilinson_absoluteRepresentative :
For j≥2 and N stable, the universal Beilinson class Be_j determined by the M.8 higher Deligne Chern character has absolute Lie representative π_{j−1}Φ_{2j−1}, with π_q(z)=(z+(−1)^q z̄)/2. This uses the first infinitesimal diagonal of the simplicial classifying scheme, its differential-form normalization into the Weil algebra, the inverse Chern–Weil construction, and the explicit van Est identification. The normalized M.8 class is the higher Chern character, not the unscaled Chern class.
Hypotheses: Import the early Deligne/Chern-character construction separately from M.8’s downstream arithmetic analytic comparison; the required infinitesimal-diagonal/Weil interface is recorded as a supplier-extension gap.
Prerequisites: MotivicEtaleKTheory:M.8, AutomorphicFormsOnReductiveGroups:AF.1a, RefinedTraceMethods:RT.4:topological, BorelRegulators:R.4/trace-cocycle
Theorem/application acceptance: At j=2 the representative is π1Φ3, half the Borel absolute representative.

BorelRegulators:R.7/universal-factor-two
TauCeti.Borel.borelClass_eq_two_beilinsonClass :
For every j≥2 and N in the fixed classical stable range, Bo_j=2Be_j in H_cont^{2j−1}(GL_N(C),R(j−1)), with Burgos Definitions 9.24 and 10.8 and ch_j=(2πi)^j pr_j/j!. The equality is compatible with stabilization. Its proof compares the two explicit absolute Lie classes and then uses the proved relative-to-absolute injectivity and van Est; weight two is a test and is not the proof for other j.
Hypotheses: The selected Tate generators, suspension sign and Chern-character normalization are identical on both sides.
Prerequisites: BorelRegulators:R.7/relative-absolute-injectivity, BorelRegulators:R.7/beilinson-infinitesimal-representative, BorelRegulators:R.4/trace-cocycle, BorelRegulators:R.4/universal-borel-class, AutomorphicFormsOnReductiveGroups:AF.1a
Theorem/application acceptance: At j=3 the same scalar 2 holds; no guessed weight-dependent scalar is introduced.

BorelRegulators:R.7/regulator-factor-two
TauCeti.Borel.borelRegulator_eq_two_beilinsonRegulator :
Let r_Be,j be the M.8 Deligne regulator followed by the real Deligne-field identification H_D^1(F⊗R,R(j))≅V_j(F) using the same Tate coefficient coordinate. For j≥2, r_Bo,j=2r_Be,j on K_{2j−1}(F), and on K_{2j−1}(O_F) after localization. On rank d_j determinant lines det(r_Bo)=2^{d_j}det(r_Be), and R_Bo,j=2^{d_j}R_Be,j with the same reference measure. Therefore either covolume has the same rational zeta proportionality, with its rational factor scaled by 2^{d_j}.
Hypotheses: The Deligne-field identification is the actual quotient/projection C/R(j)≅R(j−1), and retains simultaneous conjugation invariants.
Prerequisites: BorelRegulators:R.7/universal-factor-two, BorelRegulators:R.4/borel-regulator, BorelRegulators:R.4/regulator-determinant, BorelRegulators:R.4/regulator-covolume, MotivicEtaleKTheory:M.8, ArithmeticKTheory:N.3:ranks
Theorem/application acceptance: For d_j=1 the covolume factor is 2; for d_j=2 it is 4; for d_j=0 it is 1.

BorelRegulators:R.7/weight-two-bloch-wigner
TauCeti.Borel.borelRegulator_blochWigner_exact :
At j=2 compare the adopted r_Bo with the P.2 Bloch–Wigner homomorphism composed with the natural Suslin map K3(F)→B(F), and with the measurable homogeneous cocycle D(r(g0x,g1x,g2x,g3x)) for r(∞,0,1,z)=z. Determine the exact nonzero scalar λ_BW and orientation in the real Tate coordinate, and prove c_2(r_Bo(x))=λ_BW·D(Suslin(x)) for every complex place. Goncharov §5.4–5.5 fixes a Dynkin-class coefficient, but identifying its complex-to-real cohomology map and Suslin normalization with Burgos’s convention is still a precise gap. The existing P.2 up-to-rational statement is not silently read as an exact scalar in this Tate coordinate.
Hypotheses: No value of λ_BW is asserted until the map-level convention comparison is proved; the universal Borel–Beilinson scalar is independently fixed in every weight.
Prerequisites: BorelRegulators:R.4/trace-cocycle, BorelRegulators:R.4/borel-regulator, BorelRegulators:R.4/target-coordinates, BorelRegulators:R.7/universal-factor-two, Polylogarithms:P.2/weight-two-regulator, Polylogarithms:P.2/bloch-wigner-cocycle, K3BlochGroups:V.4/suslin-exact-sequence, K3BlochGroups:V.4/suslin-functoriality
Theorem/application acceptance: The Pauli test Φ3=−2i detects a trace normalization error, but does not by itself identify the Suslin/Bloch–Wigner scalar.

BorelRegulators:R.7/number-field-small-cases
TauCeti.Borel.borelRegulator_smallFields :
For Q and every even j≥2, V_j(Q)=0, the rational odd K-group is zero and its arithmetic regulator covolume is 1. For an imaginary quadratic F and j=2, V_2(F) is one-dimensional with components (a,−a); the arithmetic regulator image is a full rank-one lattice and changes sign when the selected embedding is conjugated. For F=Q(√−3), put ζ_6=(1+√−3)/2. With Suslin’s antisymmetric tensor quotient, ∂[ζ_6]=−ζ_6⊗ζ_6 can be nonzero 2-torsion; consequently 2[ζ_6] is an integral Bloch element and [ζ_6] is a rational Bloch element. This follows from 1−ζ_6=ζ_6^{-1} and 2(ζ_6⊗ζ_6)=0. The Bloch–Wigner values D(ζ_6) and 2D(ζ_6) are positive at the upper-half-plane embedding. The exact numerical conversion to the adopted Borel coordinate uses the unresolved λ_BW test, while rank one and nonzero image follow independently from the real regulator isomorphism.
Hypotheses: j≥2; ζ_6 is tested in the rationalized Suslin/Bloch comparison, with the stated boundary convention.
Prerequisites: BorelRegulators:R.3/borel-rank-theorem, BorelRegulators:R.4/target-coordinates, BorelRegulators:R.4/regulator-lattice, BorelRegulators:R.4/regulator-covolume, BorelRegulators:R.7/weight-two-bloch-wigner, Polylogarithms:P.1/bloch-wigner-positivity, Polylogarithms:P.2/bloch-wigner-descent, K3BlochGroups:V.4/suslin-exact-sequence, K3BlochGroups:V.3/antisymmetric-tensor-quotient, K3BlochGroups:V.3/bloch-boundary, K3BlochGroups:V.3/bloch-group
Theorem/application acceptance: At Q,j=2 the zeta value is nonzero although the rational K3 rank is zero. At an imaginary quadratic field switching embedding changes orientation but preserves absolute determinant. The integral test is 2[ζ_6]; replacing the antisymmetric tensor quotient by an exterior square would incorrectly kill every diagonal tensor. The rationalized test may use [ζ_6].

BorelRegulators:R.7/extension-matrix
TauCeti.Borel.embeddingMatrices :
For f:F→E finite and selected coordinates c_F,c_E, define P_f=c_E∘pull_f∘c_F⁻¹ and T_f=c_F∘Tr_f∘c_E⁻¹ as native real linear maps between finite coordinate function spaces and take their matrices in the standard bases. Entries sum the signed contributions of all complex embedding extensions, including conjugate representatives. Then T_f P_f=[E:F]I, coordinate matrices equal the coordinate-free maps, and they compose with extension/trace. For equal-dimensional target spaces their determinant relation is det(T_f)det(P_f)=[E:F]^{d_j}; for unequal dimensions this is a rectangular matrix relation, with no square determinant asserted.
Hypotheses: F,E number fields, j≥2, f finite; both coordinate selections are explicit.
Prerequisites: BorelRegulators:R.4/embedding-pull-trace, BorelRegulators:R.4/target-coordinates, BorelRegulators:R.4/regulator-transfer, BorelRegulators:R.7/regulator-factor-two, mathlib:LinearMap.toMatrix
API lemma signatures:
TauCeti.Borel.embeddingMatrices_pull_apply : The pull matrix acts on c_F(x) as c_E(pull_f x).
TauCeti.Borel.embeddingMatrices_trace_apply : The trace matrix acts on c_E(y) as c_F(Tr_f y).
TauCeti.Borel.embeddingMatrices_id : Identity extension gives identity matrices.
TauCeti.Borel.embeddingMatrices_comp : For F→E→L, P_comp=P_EL P_FE and T_comp=T_FE T_EL.
TauCeti.Borel.embeddingMatrices_trace_pull : T_f P_f=[E:F]I with the appropriate source index.
TauCeti.Borel.embeddingMatrices_representatives : A source/target representative change conjugates the maps by the corresponding diagonal sign matrices.
TauCeti.Borel.embeddingMatrices_regulator : The coordinate regulator matrices satisfy the pullback/transfer commuting squares, including exact Borel–Beilinson scaling.
Named example specifications:
TauCeti.Borel.embeddingMatrices_quadratic_odd : For Q→Q(i),j=3, the one-by-one pull/trace matrices are (1) and (2).
TauCeti.Borel.embeddingMatrices_Q_weight_two : For Q→Q(i),j=2, the pull matrix has one row and zero columns, and the trace matrix has zero rows and one column.
TauCeti.Borel.embeddingMatrices_switch_pair : Switching the selected Q(i) embedding at j=2 negates its coordinate maps, preserving the coordinate-free square.

-/
