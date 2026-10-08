import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.Completion.InfinitePlace
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Span.Basic
import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.Algebra.Central.Defs
import Mathlib.Algebra.Order.Floor.Ring
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.AlgebraicTopology.SimplicialComplex.Basic
import Mathlib.Order.Preorder.Chain
import Mathlib.RepresentationTheory.Homological.ContCohomology.Functoriality

/-!
# Stable arithmetic cohomology and Borel regulators: suggested signatures

This file is not the roadmap and is not exhaustive. The roadmap document,
`research/blueprint/readmes/BorelRegulators.md`, is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and
signatures. Nothing here is a claim of formalisation: every proof is `sorry`, and
every declaration of the plan is unchecked.

Part 1 elaborates against Mathlib at the pinned commit. It gives prototypes for the
declarations whose carriers the pinned libraries already have: the building of a
module over a division ring, restriction in continuous cohomology, the regulator
target with its coordinates and maps, the trace cocycle, leading coefficients, the
discriminant scalar, regulator matrices and covolumes, extension matrices, and a few
numerical statements used in the layers.

Part 2 is the register of every declaration, API item and unit test of the plan,
under the names of the packet, as mathematical signatures in a comment. Higher
K-groups of rings, the plus construction, relative Lie algebra cohomology, arithmetic
groups of orders with reduced norms, compact duals, Tamagawa measures and Deligne
cohomology cannot be stated at the pinned commits, and no placeholder carrier is
introduced for them: a signature in Part 2 becomes Lean when its supplier exports the
carrier.

The building is Tau Ceti's `TauCeti.AbstractSimplicialComplex.orderComplex` applied
to the proper nonzero subspaces (module
`TauCeti.AlgebraicTopology.SimplicialComplex.OrderComplex`). Here its faces are
written out against Mathlib's `AbstractSimplicialComplex`, so that this file imports
Mathlib only.
-/

noncomputable section
open scoped BigOperators
open Module MeasureTheory

namespace TauCeti.Borel

/-! ## R.1 Arithmetic groups and finiteness infrastructure -/

/-- Proper nonzero subspaces of a module over a division ring, ordered by inclusion. -/
abbrev ProperSubspace (D V : Type*) [DivisionRing D] [AddCommGroup V] [Module D V] :=
  {W : Submodule D V // W ≠ ⊥ ∧ W ≠ ⊤}

/-- The building of `V`: the order complex of its proper nonzero subspaces. -/
def divisionBuilding (D V : Type*) [DivisionRing D] [AddCommGroup V] [Module D V] :
    AbstractSimplicialComplex (ProperSubspace D V) where
  faces := {σ | σ.Nonempty ∧ IsChain (· ≤ ·) (σ : Set (ProperSubspace D V))}
  isRelLowerSet_faces := by sorry
  singleton_mem := by sorry

section Building
variable {D V V' : Type*} [DivisionRing D] [AddCommGroup V] [Module D V]
  [AddCommGroup V'] [Module D V']

theorem divisionBuilding_vertices (W : ProperSubspace D V) :
    ({W} : Finset (ProperSubspace D V)) ∈ (divisionBuilding D V).faces := by sorry

theorem divisionBuilding_simplex (σ : Finset (ProperSubspace D V)) :
    σ ∈ (divisionBuilding D V).faces ↔
      σ.Nonempty ∧ IsChain (· ≤ ·) (σ : Set (ProperSubspace D V)) := by sorry

theorem divisionBuilding_edge [DecidableEq (ProperSubspace D V)] (W W' : ProperSubspace D V) :
    ({W, W'} : Finset (ProperSubspace D V)) ∈ (divisionBuilding D V).faces ↔
      W ≤ W' ∨ W' ≤ W := by sorry

/-- A linear equivalence carries proper nonzero subspaces to proper nonzero subspaces. -/
def divisionBuilding_map (e : V ≃ₗ[D] V') : ProperSubspace D V ≃o ProperSubspace D V' := by sorry

theorem divisionBuilding_map_coe (e : V ≃ₗ[D] V') (W : ProperSubspace D V) :
    (divisionBuilding_map e W : Submodule D V') = (W : Submodule D V).map e.toLinearMap := by
  sorry

instance divisionBuilding_action : MulAction (V ≃ₗ[D] V) (ProperSubspace D V) := by sorry

theorem divisionBuilding_dim [Module.Finite D V] (σ : Finset (ProperSubspace D V))
    (hσ : σ ∈ (divisionBuilding D V).faces) : σ.card + 1 ≤ finrank D V := by sorry

end Building

-- TauCeti.Borel.divisionBuilding_rank_one
example (D : Type*) [DivisionRing D] : IsEmpty (ProperSubspace D D) := by sorry
-- TauCeti.Borel.divisionBuilding_rank_two
example (D V : Type*) [DivisionRing D] [AddCommGroup V] [Module D V] [Module.Finite D V]
    (h : finrank D V = 2) (σ : Finset (ProperSubspace D V))
    (hσ : σ ∈ (divisionBuilding D V).faces) : σ.card = 1 := by sorry
-- TauCeti.Borel.divisionBuilding_rank_three_edge
example (D : Type*) [DivisionRing D] [DecidableEq (ProperSubspace D (Fin 3 → D))]
    (L L' P : ProperSubspace D (Fin 3 → D))
    (hL : (L : Submodule D (Fin 3 → D)) = Submodule.span D {Pi.single 0 1})
    (hL' : (L' : Submodule D (Fin 3 → D)) = Submodule.span D {Pi.single 1 1})
    (hP : (P : Submodule D (Fin 3 → D)) = Submodule.span D {Pi.single 0 1, Pi.single 1 1}) :
    ({L, P} : Finset _) ∈ (divisionBuilding D (Fin 3 → D)).faces ∧
      ({L, L'} : Finset _) ∉ (divisionBuilding D (Fin 3 → D)).faces := by sorry
-- TauCeti.Borel.divisionBuilding_not_order_submodules
example : ¬ ∃ W : Submodule ℚ (Fin 2 → ℚ),
    (W : Set (Fin 2 → ℚ)) = Set.range (fun v : Fin 2 → ℤ => fun i => (v i : ℚ)) := by sorry

/-! ## R.2 Continuous and relative Lie-algebra cohomology -/

section Restriction
open CategoryTheory ContinuousCohomology

universe u v
variable {k : Type u} [Ring k] [TopologicalSpace k]
  {G Γ Δ : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [Group Δ] [TopologicalSpace Δ] [IsTopologicalGroup Δ]

/-- Restriction of continuous classes along `φ : Γ →ₜ* G`. For an arithmetic subgroup, or for
`GL_N(F) → GL_N(ℂ)`, the group `Γ` carries the discrete topology. This is Mathlib's
`ContinuousCohomology.map` with identity coefficients; the comparison of the target with
`groupCohomology` of the discrete group is in Part 2. -/
abbrev arithmeticRestriction (φ : Γ →ₜ* G) (X : TopRep k G) (q : ℕ) :
    continuousCohomology q X ⟶ continuousCohomology q (TopRep.res (φ : Γ →* G) X) :=
  ContinuousCohomology.map φ (𝟙 (TopRep.res (φ : Γ →* G) X)) q

theorem arithmeticRestriction_cochains (φ : Γ →ₜ* G) (X : TopRep k G) (q : ℕ) :
    arithmeticRestriction φ X q =
      HomologicalComplex.homologyMap (cochainsMap φ (𝟙 (TopRep.res (φ : Γ →* G) X))) q := by sorry

theorem arithmeticRestriction_id (X : TopRep k G) (q : ℕ) :
    ContinuousCohomology.map (ContinuousMonoidHom.id G) (𝟙 X) q =
      𝟙 (continuousCohomology q X) := by sorry

theorem arithmeticRestriction_comp (φ : Γ →ₜ* G) (ψ : Δ →ₜ* Γ) (X : TopRep k G) (q : ℕ) :
    ContinuousCohomology.map (φ.comp ψ) (X := X)
        ((TopRep.resFunctor (ψ : Δ →* Γ)).map (𝟙 (TopRep.res (φ : Γ →* G) X)) ≫ 𝟙 _) q =
      arithmeticRestriction φ X q ≫
        arithmeticRestriction ψ (TopRep.res (φ : Γ →* G) X) q := by sorry

theorem arithmeticRestriction_coeff (φ : Γ →ₜ* G) {X X' : TopRep k G} (f : X ⟶ X') (q : ℕ) :
    ContinuousCohomology.map (ContinuousMonoidHom.id G) f q ≫ arithmeticRestriction φ X' q =
      arithmeticRestriction φ X q ≫
        ContinuousCohomology.map (ContinuousMonoidHom.id Γ)
          ((TopRep.resFunctor (φ : Γ →* G)).map f) q := by sorry

-- TauCeti.Borel.arithmeticRestriction_trivial_group
example (Y : TopRep k PUnit.{v + 1}) (q : ℕ) (hq : 0 < q) :
    Limits.IsZero (continuousCohomology q Y) := by sorry

end Restriction

/-! ## R.3 The stable cohomology calculation -/

/-- `[x]′`, the greatest integer strictly smaller than `x`. -/
def strictFloor (x : ℚ) : ℤ := ⌈x⌉ - 1

theorem strictFloor_lt (x : ℚ) : (strictFloor x : ℚ) < x := by sorry

theorem le_strictFloor_iff (m : ℤ) (x : ℚ) : m ≤ strictFloor x ↔ (m : ℚ) < x := by sorry

/-- Numerical form of `borelConstants_ge_rank` for `SL_n` of a division algebra, of rational
rank `n - 1`: a degree `q` is in Borel's range exactly when `4 q < n - 1`. -/
theorem le_strictFloor_quarter_iff (q n : ℕ) :
    (q : ℤ) ≤ strictFloor (((n : ℚ) - 1) / 4) ↔ 4 * q + 1 < n := by sorry

-- Acceptance values of `borelConstants_ge_rank` and `arithmeticComparison_stableRange`.
example : strictFloor (1 / 2) = 0 := by sorry
example : strictFloor (9 / 4) = 2 ∧ strictFloor (8 / 4) = 1 := by sorry

/-! ## R.4 Regulator classes and maps -/

def weightParity (j : ℕ) : ℝ := (-1) ^ (j - 1)

/-- The real-coordinate model of the regulator target: functions with the conjugation rule. -/
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

/-- The target inside the product of the lines `ℝ(j-1) ⊂ ℂ`, fixed by conjugation. -/
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

/-- Coordinates of the target for a chosen embedding above each place that contributes. -/
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

/-- Pullback along a map of embedding sets compatible with conjugation; for a finite extension
    `res` is restriction of embeddings. -/
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

/-- The matrix of an integral basis of a lattice in a coordinate space; applied to the regulator
    image in the coordinates of `targetCoordinates` it is the regulator matrix. -/
def regulatorMatrix {ι : Type*} (L : Submodule ℤ (ι → ℝ)) (b : Basis ι ℤ L) :
    Matrix ι ι ℝ := fun v a => (b a : ι → ℝ) v

theorem regulatorMatrix_apply {ι : Type*} (L : Submodule ℤ (ι → ℝ))
    (b : Basis ι ℤ L) (v a : ι) : regulatorMatrix L b v a = (b a : ι → ℝ) v := by sorry

theorem regulatorMatrix_basis_change {ι : Type*} [Fintype ι] [DecidableEq ι]
    (L : Submodule ℤ (ι → ℝ)) (b b' : Basis ι ℤ L) (U : Matrix ι ι ℤ)
    (hU : ∀ a, b' a = ∑ k, U k a • b k) :
    regulatorMatrix L b' = regulatorMatrix L b * U.map (Int.castRingHom ℝ) := by sorry

-- Determinant scaling used by `regulatorMatrix_scalar`.
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

/-! ## R.5 Dedekind zeta functions and leading terms -/

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

-- The factor `Γ_ℝ` has a pole at `1 - j` exactly for odd `j`, and `Γ_ℂ` always: this is the
-- count behind `dedekindZeta_vanishingOrder`. Mathlib's `Gamma` takes the value `0` at its
-- poles, so vanishing of these factors encodes a pole.
example (j : ℕ) (hj : 2 ≤ j) : Complex.Gammaℝ (1 - (j : ℂ)) = 0 ↔ Odd j := by sorry
example (j : ℕ) (hj : 2 ≤ j) : Complex.Gammaℂ (1 - (j : ℂ)) = 0 := by sorry
-- Acceptance value of `zetaLeading_functionalEquation` for `ℚ` and `j = 2`.
example : riemannZeta (-1) = -1 / 12 := by sorry

/-! ## R.6 Bloch's Tamagawa reformulation -/

/-- The scalar `δ_F ^ (-q)` of `restrictionScalarsForm`. -/
def discriminantScalar (δ : ℂ) (q : ℕ) : ℂ := (δ ^ q)⁻¹

-- TauCeti.Borel.restrictionScalarsForm_Q
example : discriminantScalar 1 1 = 1 := by sorry
-- TauCeti.Borel.restrictionScalarsForm_Qi
example : (-2 * Complex.I) ^ 2 = (-4 : ℂ) ∧
    discriminantScalar (-2 * Complex.I) 1 = Complex.I / 2 := by sorry
-- TauCeti.Borel.restrictionScalarsForm_absolute_wrong
example : discriminantScalar (-2 * Complex.I) 1 ≠ discriminantScalar 2 1 := by sorry

/-- Point count behind `specialLinear_localVolume`: the volume of `SL_e(𝒪_v)` for a gauge form
generating the invariant forms of the standard model. -/
theorem specialLinear_card_div (K : Type*) [Field K] [Fintype K] (e : ℕ) (he : 1 ≤ e) :
    (Nat.card (Matrix.SpecialLinearGroup (Fin e) K) : ℚ) / (Fintype.card K : ℚ) ^ (e ^ 2 - 1) =
      ∏ a ∈ Finset.Icc 2 e, (1 - ((Fintype.card K : ℚ) ^ a)⁻¹) := by sorry

-- Acceptance value of `specialLinear_localVolume` for `e = 2`, `q = 2`.
example : (1 : ℚ) - ((2 : ℚ) ^ 2)⁻¹ = 3 / 4 := by sorry

universe uF in
/-- A central division algebra of degree `e` split at every archimedean place. -/
theorem exists_archimedeanSplitDivision (F : Type uF) [Field F] [NumberField F] (e : ℕ)
    (he : 2 ≤ e) :
    ∃ (D : Type uF) (_ : DivisionRing D) (_ : Algebra F D),
      Algebra.IsCentral F D ∧ finrank F D = e ^ 2 ∧
      ∀ v : NumberField.InfinitePlace F,
        Nonempty (TensorProduct F v.Completion D ≃ₐ[v.Completion]
          Matrix (Fin e) (Fin e) v.Completion) := by sorry

/-! ## R.7 Beilinson comparison and tests -/

/-- Matrices of coordinate pullback and trace maps in the standard bases. -/
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

/-
# Part 2. Register of the declarations of the plan

One entry for each declaration of the packet, in the order of the layers: its node, its
proposed name and kind, the statement, the hypotheses, the API items and the unit tests,
all under the names of the packet. `[Part 1]` marks a name that has a Lean prototype
above. The remaining entries are mathematical signatures; they are not Lean declarations.

## R.1 Arithmetic groups and finiteness infrastructure

TauCeti.Borel.orderArithmeticSystem
  node BorelRegulators:R.1/order-arithmetic-system, construction
  Statement: Let F be a number field, D a finite-dimensional central division F-algebra of degree e, and O a ℤ-order in D in the sense of ClassicalArithmeticCompletion CA.7 (a subring containing 1 that is a full ℤ-lattice). For n≥2 put G_n=Res_{F/ℚ} SL_n(D), the group of elements of M_n(D) of reduced norm one, and Γ_n=SL_n(O)=G_n(ℚ)∩M_n(O). For a projective O-lattice P of rank n≥1 spanning V=D^n put Γ_P=Aut_O(P)⊂GL_D(V). The construction makes Γ_n and Γ_P arithmetic subgroups of Res_{F/ℚ}SL_n(D) and Res_{F/ℚ}GL_D(V), records the real Lie group G_n(ℝ)=∏_{v|∞}SL_n(D⊗_F F_v) with each factor SL_{ne}(ℝ), SL_{ne/2}(ℍ) or SL_{ne}(ℂ), and records the block maps g↦diag(g,1) from Γ_n to Γ_{n+1} and from G_n to G_{n+1}.
  Hypothesis: O is a subring of D containing 1 which is finitely generated as a ℤ-module and spans D over ℚ; D is a division algebra with centre F.
  Hypothesis: Mathlib's modules are left modules: V is a left D-module and subspaces are left D-subspaces. A right D-space is a left module over the opposite algebra, which is again a central division F-algebra.
  API TauCeti.Borel.orderArithmeticSystem_block (functoriality): The block inclusion Γ_n→Γ_{n+1} agrees with diag(g,1) on matrices and composes to diag(g,I_r).
  API TauCeti.Borel.orderArithmeticSystem_archimedean (projection): The real Lie group of G_n is the product of the factors SL_{ne}(R), SL_{ne/2}(H) at ramified real places, and SL_{ne}(C) at complex places.
  API TauCeti.Borel.orderArithmeticSystem_rank (characterisation): For n≥2, rank_Q G_n=n−1.
  API TauCeti.Borel.orderArithmeticSystem_equiv (compatibility): An order algebra isomorphism induces the corresponding isomorphism of matrix groups and commutes with every block inclusion.
  API TauCeti.Borel.orderArithmeticSystem_projective (data): For a projective O-lattice P of rank n≥1 spanning V, Aut_O(P) is an arithmetic subgroup of Res_{F/ℚ}GL_D(V), commensurable with GL_n(O) after a choice of D-basis of V.
  Test TauCeti.Borel.orderArithmeticSystem_split (compatibility): For D=F and O=O_F, Γ_n=SL_n(O_F).
  Test TauCeti.Borel.orderArithmeticSystem_rank_two (computation): For n=2 and any central division D, rank_Q G_2=1.
  Test TauCeti.Borel.orderArithmeticSystem_norm_one (non-example): For F=Q, diag(2,1) lies in GL_2(Q) but not in Γ_2 for O=Z, and not in SL_2(Q).

TauCeti.Borel.divisionBuilding  [Part 1]
  node BorelRegulators:R.1/division-building, definition
  Statement: For a division ring D and a D-module V of finite dimension n, let S(V) be the type of proper nonzero D-subspaces of V, ordered by inclusion. The building Δ(V) is the order complex of S(V), in the sense of Tau Ceti's AbstractSimplicialComplex.orderComplex: its vertices are the elements of S(V) and its faces are the nonempty finite chains. A D-linear equivalence V≃W induces an isomorphism Δ(V)≅Δ(W) by taking images of subspaces, so Aut_D(V) acts simplicially on Δ(V). For n≤1 the type S(V) is empty and Δ(V) is the empty complex; reduced homology in degree −1 is fixed in the Steinberg module, not here.
  Hypothesis: D is a division ring, not necessarily commutative; V is a D-module of finite dimension.
  API TauCeti.Borel.divisionBuilding_vertices (data)  [Part 1]: The vertex type of Δ(V) is S(V), the proper nonzero D-subspaces of V.
  API TauCeti.Borel.divisionBuilding_simplex (characterisation)  [Part 1]: A finite set of vertices is a face iff it is nonempty and totally ordered by inclusion.
  API TauCeti.Borel.divisionBuilding_edge (characterisation)  [Part 1]: Two vertices W, W′ span an edge iff W≤W′ or W′≤W.
  API TauCeti.Borel.divisionBuilding_map (functoriality)  [Part 1]: A D-linear equivalence V≃W induces a simplicial isomorphism Δ(V)≅Δ(W), with identity and composition laws.
  API TauCeti.Borel.divisionBuilding_action (structure)  [Part 1]: Aut_D(V) acts on Δ(V) by simplicial automorphisms; every subgroup, in particular Aut_O(P), acts by restriction.
  API TauCeti.Borel.divisionBuilding_dim (characterisation)  [Part 1]: Every face has at most n−1 vertices, and a maximal chain has exactly n−1; so Δ(V) has dimension n−2 for n≥2.
  Test TauCeti.Borel.divisionBuilding_rank_one (degenerate)  [Part 1]: For V=D of dimension one, S(V) is empty and Δ(V) has no faces.
  Test TauCeti.Borel.divisionBuilding_rank_two (computation)  [Part 1]: For dim V=2 every face of Δ(V) is a single vertex: two distinct lines are incomparable, so there is no edge.
  Test TauCeti.Borel.divisionBuilding_rank_three_edge (computation)  [Part 1]: For V=D³ with basis e₁,e₂,e₃, the line De₁ and the plane De₁+De₂ span an edge, and De₁ and De₂ do not.
  Test TauCeti.Borel.divisionBuilding_not_order_submodules (non-example)  [Part 1]: For V=ℚ², neither ℤ² nor 2ℤ² is a vertex: they are not ℚ-subspaces, and the subspace each spans is the excluded V.

TauCeti.Borel.steinbergModule
  node BorelRegulators:R.1/steinberg-module, definition
  Statement: For a division ring D and a D-module V of finite dimension n≥1, the Steinberg module is St_D(V)=H̃_{n−2}(Δ(V);ℤ), the reduced integral homology of the building in its top degree, with the action of Aut_D(V) induced by the simplicial action. Reduced homology is that of the augmented chain complex, so for n=1 (empty building) St_D(V)=H̃_{−1}(∅;ℤ)=ℤ with trivial action, and for n=2 it is the kernel of the augmentation ℤ[lines of V]→ℤ. It is a ℤ[Aut_D(V)]-module and is in general not finitely generated as an abelian group.
  Hypothesis: V has positive finite D-dimension n.
  API TauCeti.Borel.steinbergModule_action (structure): St_D(V) is a Z[Aut_D(V)]-module induced from the action on augmented chains.
  API TauCeti.Borel.steinbergModule_equiv (functoriality): Linear equivalences give equivariant module equivalences, preserving identity and composition.
  API TauCeti.Borel.steinbergModule_rank_one (simp): St_D(D)=Z with trivial automorphism action.
  API TauCeti.Borel.steinbergModule_rank_two (compatibility): St_D(D²) is canonically the kernel of the sum-of-coefficients map Z[P¹(D)]→Z.
  API TauCeti.Borel.steinbergModule_apartment (constructor): An ordered D-basis gives the oriented apartment class; permutations act by their sign and replacing any basis vector by a nonzero multiple leaves the apartment unchanged.
  Test TauCeti.Borel.steinbergModule_one (degenerate): St_D(D)=Z, not zero.
  Test TauCeti.Borel.steinbergModule_two (computation): For D=F_q, rank_Z St_D(D²)=q.
  Test TauCeti.Borel.steinbergModule_rational_lines (non-example): For D=Q and n=2 the underlying abelian group has infinite rank, despite the arithmetic group having a finite classifying-space model.

TauCeti.Borel.solomonTits
  node BorelRegulators:R.1/solomon-tits, theorem
  Statement: For a division ring D and a D-module V of finite dimension n≥2, the realization of Δ(V) is homotopy equivalent to a wedge of spheres of dimension n−2, possibly infinitely many. Hence the reduced integral homology of Δ(V) vanishes outside degree n−2, St_D(V) is a free abelian group, and it is generated by the apartment classes: for an ordered basis (v₁,…,v_n) of V the subcomplex of subspaces spanned by proper nonempty subsets of the basis is a simplicial (n−2)-sphere, and its fundamental class is the apartment class of the basis.
  Hypothesis: D division; n≥2.
  Acceptance: For n=2 the building is a discrete set with at least three points; it is not connected, and St is the augmentation kernel.
  Acceptance: For D=𝔽_q and n=2, St has rank q, the number of lines minus one.

TauCeti.Borel.steinbergHomology_finitelyGenerated
  node BorelRegulators:R.1/steinberg-duality-finiteness, theorem
  Statement: Let O be an order in a central division algebra D over a number field F, P a projective O-lattice of rank n≥1, V=P⊗_O D, and Γ a subgroup of Aut_D(V) commensurable with Aut_O(P). Then H_i(Γ;St_D(V)) is a finitely generated abelian group for every i≥0. More precisely, let X̄ be the Borel–Serre bordification for G=Res_{F/ℚ}GL_D(V), of dimension d, and let Γ′⊂Γ be a torsion-free subgroup of finite index that acts on X̄ preserving orientation. Then, with ν=d−(n−1), H_i(Γ′;St_D(V)⊗M)≅H^{ν−i}(Γ′;M) for all i and every ℤ[Γ′]-module M that is finitely generated and free over ℤ, in particular for M=ℤ. For a torsion-free Γ′ that does not preserve orientation, St_D(V) is replaced by its twist by the orientation character; for D=F and Γ′⊂GL_n(O_F) that character is the (n−1)-st power of g↦sign N_{F/ℚ}(det g).
  Hypothesis: Γ is commensurable with Aut_O(P); for D=F and O=O_F this is every subgroup of GL_n(F) commensurable with GL_n(O_F).
  Hypothesis: The duality statement is integral and needs Γ′ torsion-free; a finite CW model of BΓ′ alone does not bound H_*(Γ′;St), since St is not finitely generated over ℤ.
  Acceptance: For F=ℚ, n=2 and Γ′ torsion-free of finite index in SL₂(ℤ): ν=1, H¹(Γ′;ℤ)≅H₀(Γ′;St) and H⁰(Γ′;ℤ)≅H₁(Γ′;St).
  Acceptance: For n even and O_F with a unit of norm −1, the dualizing module of GL_n(O_F) is the twist of St by the sign of the norm of the determinant and is not St itself; the statement keeps the twist.
  Acceptance: For n=1 the statement is finite generation of the homology of a group commensurable with O^×.

## R.2 Continuous and relative Lie-algebra cohomology

TauCeti.Borel.arithmeticRestriction  [Part 1]
  node BorelRegulators:R.2/arithmetic-restriction, construction
  Statement: For a real Lie group G, a group Γ with the discrete topology, a homomorphism φ:Γ→G, q≥0 and a finite-dimensional real vector space E with trivial action, res_φ:H_cont^q(G;E)→H^q(Γ;E) is Mathlib's ContinuousCohomology.map for φ with identity coefficients, followed by the identification of the continuous cohomology of the discrete group Γ with Mathlib's group cohomology, in every degree. It is used for an arithmetic subgroup Γ⊂G(ℝ), and for GL_N(F)→GL_N(ℂ) induced by an embedding of a field F in ℂ. On cochains it is ContinuousCohomology.cochainsMap: precomposition of homogeneous continuous cochains with φ.
  Hypothesis: Γ carries the discrete topology, so the inclusion Γ→G(ℝ) is a continuous homomorphism; E is a finite-dimensional real vector space with trivial action.
  API TauCeti.Borel.arithmeticRestriction_cochains (compatibility)  [Part 1]: Its cochain representative is ContinuousCohomology.cochainsMap for the inclusion and identity coefficients.
  API TauCeti.Borel.arithmeticRestriction_id (functoriality)  [Part 1]: Restriction along the identity is the identity.
  API TauCeti.Borel.arithmeticRestriction_comp (functoriality)  [Part 1]: For Δ⊂Γ⊂G, res_Δ=res_{Δ⊂Γ}∘res_Γ.
  API TauCeti.Borel.arithmeticRestriction_coeff (functoriality)  [Part 1]: For a real linear coefficient map E→E′, coefficient extension commutes with restriction.
  API TauCeti.Borel.arithmeticRestriction_cup (compatibility): Restriction preserves cup products and units for compatible algebra coefficients.
  Test TauCeti.Borel.arithmeticRestriction_degree_zero (computation): For trivial coefficients, the degree-zero restriction R→R is identity.
  Test TauCeti.Borel.arithmeticRestriction_trivial_group (degenerate)  [Part 1]: For Γ={1} and q>0, restriction has zero target.
  Test TauCeti.Borel.arithmeticRestriction_degree_two (compatibility): The degree-two discrete comparison agrees with TauCeti.ContCohomology.explicitH2IsoGroupCohomology on a cocycle class.

TauCeti.Borel.arithmeticInvariantFormMap
  node BorelRegulators:R.2/arithmetic-invariant-form-map, construction
  Statement: Let G be a connected semisimple ℚ-group, K a maximal compact subgroup of G(ℝ), X=K\G(ℝ), g=k⊕p the Cartan decomposition and Γ an arithmetic subgroup of G(ℚ). Let I_G^{Γ,q} be the space of q-forms on X invariant under G(ℝ)° and under Γ; such forms are closed, and I_G^{Γ,q} is the space of invariants of H^q(g,k;ℝ)=(∧^q p^*)^{K°} under the image of Γ in K/K°=π₀(G(ℝ)). The map j_Γ:I_G^{Γ,q}→H^q(Γ;ℝ) sends a form to its de Rham class on X/Γ′ for a torsion-free normal subgroup Γ′ of finite index, which lies in H^q(Γ′;ℝ)^{Γ/Γ′}=H^q(Γ;ℝ). In the relative Lie algebra description of the cohomology of X/Γ′ it is induced by the inclusion of the constant functions into C^∞(Γ′\G(ℝ)), and under van Est it is arithmeticRestriction. If Γ meets every component of G(ℝ) the source is H^q(g,K;ℝ), the cohomology of the pair with the full group K; if G(ℝ) is connected, as for G_n, it is H^q(g,k;ℝ).
  Hypothesis: G connected semisimple over ℚ; Γ arithmetic. The Betti, de Rham and relative Lie algebra descriptions of H^*(X/Γ′) are those of ALS.5/de-rham-comparison, which uses no automorphic input.
  Hypothesis: Real coefficients are used for the descent from Γ′ to Γ.
  API TauCeti.Borel.arithmeticInvariantFormMap_vanEst (compatibility): j_Γ=res_Γ∘vanEst⁻¹ on H^q(g,K;ℝ), for the van Est isomorphism of AF.1a/van-est-isomorphism.
  API TauCeti.Borel.arithmeticInvariantFormMap_descent (characterisation): Its pullback to a torsion-free finite-index Γ′ equals the invariant form on X/Γ′.
  API TauCeti.Borel.arithmeticInvariantFormMap_component (projection): The source is the space of invariants of H^q(g,k;ℝ) under the image of Γ in K/K°; it equals H^q(g,K;ℝ) when Γ meets every component of G(ℝ), and H^q(g,k;ℝ) when G(ℝ) is connected.
  API TauCeti.Borel.arithmeticInvariantFormMap_cup (compatibility): jΓ sends wedge products of invariant forms to cup products.
  API TauCeti.Borel.arithmeticInvariantFormMap_coeff (functoriality): Extension R→C commutes with the map and with Betti/de Rham comparison.
  API TauCeti.Borel.arithmeticInvariantFormMap_constants (characterisation): Under ALS.5/de-rham-comparison, j_{Γ′} is the map on (g,K°)-cohomology induced by the inclusion ℝ→C^∞(Γ′\G(ℝ)) of the constant functions.
  Test TauCeti.Borel.arithmeticInvariantFormMap_unit (computation): The constant invariant 0-form 1 maps to the unit cohomology class.
  Test TauCeti.Borel.arithmeticInvariantFormMap_point (degenerate): If X/Γ is a point then every positive-degree class maps to zero.
  Test TauCeti.Borel.arithmeticInvariantFormMap_component_invariants (non-example): For G=PGL₂ over ℚ, K=PO₂ and Γ=PGL₂(ℤ): the non-identity component of K reverses the orientation of the two-dimensional space p, so it acts by −1 on H²(g,k;ℝ)=ℝ, and Γ meets that component. The degree-two source of j_Γ is therefore zero; a definition with source H²(g,k;ℝ) would be wrong.

TauCeti.Borel.arithmeticComparison_block_natural
  node BorelRegulators:R.2/block-comparison-naturality, theorem
  Statement: For an injective real algebraic homomorphism f:G→G′ taking Γ into Γ′, choose K′ containing f(K). The invariant-form restriction, relative Lie pullback, continuous-cohomology pullback and arithmetic-group pullback form commuting squares with jΓ and jΓ′. In the order system this holds for every diag(g,I_r) and commutes with coefficient extension R→C. The induced compact-dual pullback is independent of compatible maximal-compact choices up to the canonical conjugacy identifications.
  Hypothesis: Groups, arithmetic subgroups and compact duals satisfy the R.2 comparison hypotheses.
  Acceptance: Composing two block inclusions gives the same comparison square as their single block inclusion.

TauCeti.Borel.stableComparison_hopf
  node BorelRegulators:R.2/stable-hopf-compatibility, theorem
  Statement: For an order O as in R.1, block sum SL_m(O)×SL_n(O)→SL_{m+n}(O) makes H_*(SL(O);ℝ)=colim_n H_*(SL_n(O);ℝ) a connected graded commutative and cocommutative Hopf algebra, and H^*(SL(O);ℝ), taken degree by degree, its dual. The stable comparison with invariant forms, equivalently with the cohomology of the compact duals with their block-sum maps, is a morphism of Hopf algebras: it preserves unit, product, coproduct and augmentation. Hence it preserves primitive elements and induces a map on indecomposables QH^i=H^i/(decomposables), and in each degree in which cohomology is finite-dimensional the primitive part of H_i is the dual of QH^i, not of all of H^i.
  Hypothesis: Cohomology is taken in a range of degrees where it has stabilised and is finite-dimensional over ℝ.
  Hypothesis: The block-sum product on homology is the Pontryagin product of the H-space BGL(O)⁺ restricted along SL(O)→GL(O).
  Acceptance: An exterior product of two positive-degree generators is excluded from the indecomposable quotient.

## R.3 The stable cohomology calculation

TauCeti.Borel.classicalCompactDuals
  node BorelRegulators:R.3/classical-compact-duals, theorem
  Statement: For the archimedean factors of SL_n(D), the connected compact duals are SU_{ne}/SO_{ne} at split real places, SU_{ne}/USp_{ne} at quaternionic real places (ne even), and SU_{ne} at complex places. They use the Cartan symmetric-pair dual g_u=k⊕i p and the quotient K°\G_u; a compact real form by itself does not specify the dual. Compatible block inclusions induce the corresponding maps between these homogeneous spaces.
  Hypothesis: n≥2 and D is a central division algebra of degree e over F. The dual of a symmetric pair is requested from Tau Ceti LieGroups Layer 7.
  Acceptance: The quaternionic quotient has USp_{ne}, not SO_{ne}, as denominator.

TauCeti.Borel.compactDual_stableExterior
  node BorelRegulators:R.3/compact-dual-cohomology, theorem
  Statement: With real coefficients, the degreewise stable cohomology rings are H*(SU)=Λ(x_3,x_5,x_7,…), H*(SU/SO)=Λ(y_5,y_9,y_13,…) and H*(SU/USp)=Λ(z_5,z_9,z_13,…). The named generators are primitive for stable block sum. The finite-dimensional groups and homogeneous spaces have their own unstable relations; the displayed infinite exterior algebras assert only degreewise stable cohomology. For finite ranks m≥1, H*(SU_m;R)=Λ(x_3,x_5,…,x_{2m−1}); H*(SU_{2m+1}/SO_{2m+1};R)=Λ(y_5,y_9,…,y_{4m+1}); H*(SU_{2m}/SO_{2m};R)=Λ(y_5,y_9,…,y_{4m−3})⊗R[e_{2m}]/(e_{2m}²); and H*(SU_{2m}/USp_{2m};R)=Λ(z_5,z_9,…,z_{4m−3}), with empty generator ranges interpreted as R. Block pullback preserves the named transgressed odd generators wherever they occur; the even-rank Euler class is unstable.
  Hypothesis: Stability maps come from the compatible classical block inclusions.
  Acceptance: H³(SU/SO;R)=H³(SU/USp;R)=0, while H³(SU;R)=R.
  Acceptance: Finite-size cohomology is not replaced by the stable ring without a degree bound.

TauCeti.Borel.compactDual_stable_in_degree
  node BorelRegulators:R.3/compact-dual-degree-stability, theorem
  Statement: For fixed q≥0, all three classical compact-dual systems occurring in the order system have stationary real cohomology in degrees ≤q once n≥2q+3. This is a uniform sufficient bound, not the sharp bound: each local matrix rank is at least n, and no unstable Euler or top-degree class occurs in that range. The stable generators and block pullbacks agree under these identifications.
  Hypothesis: n is the rank over D, rather than the absolute matrix size ne; quaternionic D has even e.
  Acceptance: For q=3 the complex generator survives and the real/quaternionic factors contribute zero.
  Acceptance: The bound is labelled sufficient; no claim of sharpness is made.

TauCeti.Borel.invariantForms_bijective_of_squareIntegrable
  node BorelRegulators:R.3/matsushima-garland-criterion, theorem
  Statement: Let G be a real semisimple Lie group with finitely many components and finite centre, K a maximal compact subgroup, X=K\G with a G-invariant metric, Γ a discrete subgroup with X/Γ of finite volume and Γ′⊂Γ a torsion-free normal subgroup of finite index. Write Ω^Γ for the complex of Γ-invariant forms on X, I^Γ for its subspace of forms also invariant under G°, and j^q:I^{Γ,q}→H^q(Γ;ℝ) for the map of R.2. For a connected simple noncompact group G₁ with Cartan decomposition k₁⊕p₁, Matsushima's constant m(G₁) is the largest q for which the quadratic form (A/q)(ξ,ξ)+P(ξ,ξ) on the symmetric square of p₁ is positive definite; here (ξ,ξ) comes from the Killing form, P(ξ,η)=Σ R_{ikjl}ξ_{ij}η_{kl} is built from the curvature tensor of X and A is Matsushima's constant attached to the Killing form on k₁. Put m(G)=min m(G₁) over the simple noncompact factors of G°. Then: (a) if G/Γ is compact, j^q is injective for all q and surjective for q≤m(G); (b) if Γ is torsion-free, q≤m(G) and every class in H^q(Ω^Γ) has a square-integrable representative, then j^q is surjective; (c) if C⊂Ω^{Γ′} is a subcomplex stable under Γ/Γ′ and m′ is a positive integer such that C→Ω^{Γ′} is an isomorphism on cohomology in degrees ≤m′, C^q consists of square-integrable forms for q≤m′, and I^{Γ′,q}⊂C^q for q≤m′, then j^q:I^{Γ,q}→H^q(Γ;ℝ) is injective for q≤m′ and bijective for q≤min(m(G),m′).
  Hypothesis: G real semisimple with finitely many components and finite centre; X/Γ of finite volume for (c).
  Hypothesis: Square integrability is with respect to the invariant metric on X/Γ′.
  Acceptance: For G/Γ compact, (c) with C=Ω^{Γ′} recovers (a).
  Acceptance: For G=SL₂(ℝ) and Γ a cocompact surface group, I^1=0 and H¹(Γ;ℝ)≠0, so j¹ is not surjective: m(SL₂(ℝ))=0.
  Acceptance: The criterion gives no information in degrees above min(m(G),m′).

TauCeti.Borel.logGrowthForms_quasiIso
  node BorelRegulators:R.3/logarithmic-growth-complex, theorem
  Statement: Let G be a connected semisimple ℚ-group, P a minimal parabolic ℚ-subgroup, A_P the identity component of the real points of a maximal ℚ-split torus of P, with simple roots α₁,…,α_s, and ρ_P the character with a^{2ρ_P}=det Ad(a) on the Lie algebra of the unipotent radical U of P. Write λ≫0 if λ is a combination of the α_i with strictly positive coefficients. For q≥0 and a character λ of A_P, condition c(P,q,λ) is: ρ_P+λ−ν≫0 for every weight ν of A_P on ⊕_{i≤q}∧^i Lie(U(ℝ)). Put c(G,λ)=max{q : c(P,q,λ) holds}, c(G)=c(G,0), and c(G)=∞ when G is anisotropic; for an almost direct product, c is the minimum over the factors. Let Γ be a torsion-free arithmetic subgroup and X̄/Γ the Borel–Serre compactification of X/Γ. A form on X/Γ has logarithmic growth near the boundary if every boundary point has a neighbourhood, pulled back from a Siegel set, on which its coefficients in the frame adapted to the horospherical decomposition are bounded by a polynomial in the log a^{α_i}. Let C be the complex of Γ-invariant forms on X which, together with their exterior derivatives, have logarithmic growth near the boundary. Then: (a) the inclusion of C into Ω^Γ is an isomorphism on cohomology; (b) for q≤c(G) every element of C^q is square integrable on X/Γ; (c) every form invariant under G(ℝ)° lies in C.
  Hypothesis: G connected semisimple over ℚ; Γ torsion-free arithmetic. Siegel sets, the horospherical decomposition and the corners are those of AA.3 and ALS.2.
  Hypothesis: The condition c(P,q,λ) does not depend on the choice of minimal parabolic.
  Acceptance: For G anisotropic over ℚ the quotient is compact, C is the whole complex and c(G)=∞.
  Acceptance: For G=Res_{F/ℚ}SL₂ with [F:ℚ]=d, a minimal parabolic has one simple root α with multiplicity d and ρ_P=(d/2)α, so c(G) is the greatest integer strictly smaller than d/2 (Borel 7.7); for F=ℚ it is 0.
  Acceptance: The complex contains the invariant forms; the smaller complex of forms locally lifted from the boundary does not (Borel 8.2).

TauCeti.Borel.borelConstants_ge_rank
  node BorelRegulators:R.3/stable-range-constants, theorem
  Statement: Let [x]′ denote the greatest integer strictly smaller than x. (1) For an irreducible root system Φ let 2r be the sum of its positive roots, d₀ the highest root of the subsystem of non-multipliable roots, and c(Φ)=max{p : r−p·d₀≫0}; for a reducible system take the minimum over the irreducible factors. Then c(A_n)=[n/2]′, and c(Φ)≥[n/2]′ for every irreducible Φ of rank n. (2) For a connected semisimple group H of positive rank over a field k of characteristic zero, define c(H/k) as c(G) was defined in logGrowthForms_quasiIso, with a maximal k-split torus and a minimal parabolic k-subgroup. Then c(H/k)≥m·c(Φ(H/k)) if every relative root has multiplicity at least m; c(H/k)≥[rk_k(H)/2]′ if H is almost k-simple; c(Res_{k′/k}H′/k)≥[k′:k]·c(H′/k′); and c(H/k)≥c(H/k″) for every extension k″ of k. (3) For H almost simple over ℝ of positive real rank, Matsushima's constant satisfies m(H(ℝ))≥[rk_ℝ(H)/4]′. (4) For a connected almost ℚ-simple ℚ-group G, min(c(G), m(G(ℝ)))≥[rk_ℚ(G)/4]′. In particular for G_n=Res_{F/ℚ}SL_n(D), of rational rank n−1, the minimum is at least [(n−1)/4]′, that is, it is ≥q whenever 4q<n−1.
  Hypothesis: Root systems, relative root systems with multiplicities and their behaviour under restriction of scalars are those of the structure theory of reductive groups over a field.
  Hypothesis: (3) rests on the values of m for the simple real Lie algebras, which are tabulated in the literature cited by Borel.
  Acceptance: For Φ=A₁, r=α/2 and d₀=α, so c(A₁)=0=[1/2]′.
  Acceptance: For G_n with n=10 the bound is [9/4]′=2, and for n=9 it is [8/4]′=1: the inequality 4q<n−1 is strict.
  Acceptance: The bound is a lower bound; no claim is made that it is sharp.

TauCeti.Borel.arithmeticComparison_stableRange
  node BorelRegulators:R.3/arithmetic-stable-range, theorem
  Statement: For an order O in a central division algebra D over a number field F, n≥2 and q≥0 with 4q<n−1, the map j_{Γ_n}:H^q(g_n,k_n;ℝ)→H^q(SL_n(O);ℝ) of R.2 is an isomorphism. More generally, for a connected semisimple ℚ-group G and an arithmetic subgroup Γ, j_Γ^q:I_G^{Γ,q}→H^q(Γ;ℝ) is injective for q≤c(G) and surjective for q≤min(c(G),m(G(ℝ))), with the constants of logGrowthForms_quasiIso and invariantForms_bijective_of_squareIntegrable. Since G_n is almost ℚ-simple of rational rank n−1 and G_n(ℝ) is connected, min(c(G_n),m(G_n(ℝ)))≥[(n−1)/4]′, the greatest integer strictly smaller than (n−1)/4; so the strict inequality 4q<n−1 is what the proof gives.
  Hypothesis: O is any order of D; Γ_n=SL_n(O) is arithmetic in G_n=Res_{F/ℚ}SL_n(D) by R.1.
  Hypothesis: For the general statement G is a connected semisimple ℚ-group and Γ⊂G(ℚ) is arithmetic.
  Acceptance: For q=2 the comparison holds for n≥10, and the argument does not give n=9.
  Acceptance: For q=0 the statement is H⁰=ℝ and holds for every n≥2.
  Acceptance: Replacing 4q<n−1 by 4q≤n−1 is not justified by the bound [(n−1)/4]′.

TauCeti.Borel.arithmeticCohomology_stableExterior
  node BorelRegulators:R.3/stable-arithmetic-exterior, theorem
  Statement: For Γ∞=colim_n SL_n(O), H*(Γ∞;R) is the graded exterior algebra with r1 independent generators in every degree 4a+1 (a≥1) and r2 independent generators in every degree 2a+1 (a≥1). The comparison is compatible with block-sum Hopf structures. Each cohomological degree is finite-dimensional and stationary; the inverse limit is taken degree by degree and then summed as a graded algebra, not as a completed product across degrees.
  Hypothesis: O any order in a central division algebra over F; r1 and r2 are the signature of F, independent of archimedean ramification of D.
  Acceptance: In degree 9, possible decomposable terms must be separated from the generator space; rank counts indecomposables.

TauCeti.Borel.stableGL_SL_primitiveComparison
  node BorelRegulators:R.3/gl-sl-primitive-comparison, theorem
  Statement: For an order O as in R.1 and i≥2, K_i(O)⊗ℝ is the space of primitive elements of degree i in the Hopf algebra H_*(SL(O);ℝ) of R.2. In more detail: E(O)=[GL(O),GL(O)] is perfect, BE(O)⁺ is the universal cover of BGL(O)⁺, so K_i(O)=π_i(BE(O)⁺) for i≥2; and the inclusion E(O)⊂SL(O) induces an isomorphism of Hopf algebras H_*(E(O);ℝ)≅H_*(SL(O);ℝ), because SL(O)/E(O)=H₁(SL(O);ℤ) is a torsion group acting trivially on H_*(E(O);ℝ). The quotient GL(O)/E(O)=K₁(O) contributes only to π₁ and to degree-one classes; nothing is asserted for i=1, and the full cohomology rings of GL(O) and SL(O) are not claimed to agree.
  Hypothesis: K_i(O) is the K-group of the ring O in the early ring model of GeneralAlgebraicKTheory K.2, identified with π_i(BGL(O)⁺) by the plus-equals-Q theorem.
  Hypothesis: The stable cohomology of R.3 is used in degree one: H¹(SL_n(O);ℝ)=0 for n>5.
  Acceptance: For i=1 nothing is asserted: K₁(O) has the rank of the unit group of the centre, which the stable cohomology of SL does not see.
  Acceptance: The proof uses H¹(SL(O);ℝ)=0 from the stable computation, not a separate finiteness theorem for SK₁.

TauCeti.Borel.arithmeticK_rationalHurewicz
  node BorelRegulators:R.3/cartan-serre-application, theorem
  Statement: For an order O as in R.1 and i≥2, dim_ℝ(K_i(O)⊗ℝ) is the number of generators of degree i of the stable exterior algebra H^*(SL(O);ℝ). Indeed K_i(O)⊗ℝ is the degree-i primitive part of H_*(SL(O);ℝ), and in each degree the primitive part of a connected Hopf algebra of finite type is dual to the indecomposable quotient QH^i=H^i/(products of classes of positive degree) of the dual algebra; for an exterior algebra on generators of odd degree QH^i has the generators of degree i as a basis. No finite generation of K_i(O) is used.
  Hypothesis: The Cartan–Serre theorem is used in the form for path-connected H-spaces of finite rational type, H.3/rational-hurewicz-hspace; a Hurewicz theorem for simply connected spaces in the first nonvanishing degree does not suffice.
  Acceptance: In degree 10 the stable cohomology of SL(O_F) for a field with r₁+r₂≥2 is nonzero (products of two distinct generators of degree 5), but QH^{10}=0 and K_{10}(O_F)⊗ℝ=0.
  Acceptance: Finite generation of K_i(O) is not among the prerequisites.

TauCeti.Borel.divisionOrder_borelRank
  node BorelRegulators:R.3/division-order-rank-period, theorem
  Statement: For any order O in a finite-dimensional central division algebra over a number field F and i≥2, dim_R(K_i(O)⊗_Z R) is 0 if i≡0 or 2 mod4, r1+r2 if i≡1 mod4, and r2 if i≡3 mod4. In particular the answer is independent of the degree and real ramification of D. No assertion about integral torsion or K1 is part of this theorem.
  Hypothesis: O is any order of D, maximal or not.
  Acceptance: For F totally real the rank in degree 3 is zero; degree 5 has rank [F:Q].

TauCeti.Borel.borelRankTheorem
  node BorelRegulators:R.3/borel-rank-theorem, theorem
  Statement: For a number field F and j≥2, dim_ℚ(K_{2j−1}(O_F)⊗ℚ)=d_j(F), where d_j(F)=r₁+r₂ when j is odd and r₂ when j is even; and K_i(O_F)⊗ℚ=0 for even i≥2. The rank of an abelian group means the dimension after tensoring with ℚ; the statement asserts neither finite generation nor discreteness of a regulator image. The same holds for every order of F.
  Hypothesis: j≥2; O_F is the ring of integers of F.
  API TauCeti.Borel.borelRankTheorem_odd (simp): If j≥2 is odd, dim_Q K_{2j−1}(O_F)⊗Q=r1+r2.
  API TauCeti.Borel.borelRankTheorem_even (simp): If j≥2 is even, dim_Q K_{2j−1}(O_F)⊗Q=r2.
  API TauCeti.Borel.borelRankTheorem_scalarExtension (compatibility): The Q-rank equals dim_R(K_{2j−1}(O_F)⊗R).
  API TauCeti.Borel.borelRankTheorem_order (compatibility): The corresponding odd-rank statement holds for every commutative order in F by divisionOrder_borelRank, without an unproved integral K-isomorphism.
  API TauCeti.Borel.borelRankTheorem_evenDegree (compatibility): For even i≥2, K_i(O_F)⊗ℚ=0.
  Test TauCeti.Borel.borelRankTheorem_Q_two (computation): dim_Q(K3(Z)⊗Q)=0.
  Test TauCeti.Borel.borelRankTheorem_Q_three (computation): dim_Q(K5(Z)⊗Q)=1.
  Test TauCeti.Borel.borelRankTheorem_imaginary_quadratic (computation): For [F:Q]=2, r1=0 and j≥2, the odd K-group rank is one.
  Test TauCeti.Borel.borelRankTheorem_units_excluded (non-example): The theorem cannot be applied at j=1: rank K1(O_F)=r1+r2−1.
  Test TauCeti.Borel.borelRankTheorem_even_degrees (degenerate): dim_ℚ(K₂(ℤ)⊗ℚ)=0 and dim_ℚ(K₄(O_F)⊗ℚ)=0 for every number field F.

## R.4 Regulator classes and maps

TauCeti.Borel.archimedeanTarget  [Part 1]
  node BorelRegulators:R.4/archimedean-target, definition
  Statement: For a number field F and j≥2 let Σ_F=Hom(F,C), R(q)=(2πi)^q R and V_j(F)=(∏_{σ∈Σ_F}R(j−1))^conj, where conj acts simultaneously on coefficients and embeddings. After dividing each component by (2πi)^{j−1}, identify this with the real submodule of functions f:Σ_F→R satisfying f(σ̄)=(−1)^{j−1}f(σ). This submodule formulation extends to any finite set with an involution and uses Mathlib's conjugation of complex embeddings.
  Hypothesis: F number field; j≥2. The coefficient twist is part of the definition.
  API TauCeti.Borel.archimedeanTarget_mk (constructor)  [Part 1]: A function satisfying f(σ̄)=(−1)^{j−1}f(σ) determines a target element.
  API TauCeti.Borel.archimedeanTarget_ext (extensionality)  [Part 1]: Two elements are equal iff their evaluations at every σ agree.
  API TauCeti.Borel.archimedeanTarget_conjugate (simp)  [Part 1]: Evaluation at σ̄ is (−1)^{j−1} times evaluation at σ.
  API TauCeti.Borel.archimedeanTarget_fixed_even (simp)  [Part 1]: At a conjugation-fixed embedding, every target element is zero if j is even.
  API TauCeti.Borel.archimedeanTarget_twist (equivalence)  [Part 1]: Multiplication by (2πi)^{j−1} identifies the real-function model with the simultaneous fixed subspace in ∏R(j−1).
  API TauCeti.Borel.archimedeanTarget_reindex (functoriality)  [Part 1]: An involution-equivariant bijection of embedding sets induces a real linear equivalence, with identity and composition laws.
  Test TauCeti.Borel.archimedeanTarget_fixed_weight_two (degenerate)  [Part 1]: On a one-point embedding set with identity involution and j=2, the target is zero.
  Test TauCeti.Borel.archimedeanTarget_pair_weight_two (computation)  [Part 1]: On a two-point exchanged pair at j=2, the function (1,−1) is in the target and (1,1) is not.
  Test TauCeti.Borel.archimedeanTarget_fixed_weight_three (computation)  [Part 1]: On a fixed point at j=3, the constant function 1 belongs to the target.

TauCeti.Borel.targetCoordinates  [Part 1]
  node BorelRegulators:R.4/target-coordinates, construction
  Statement: Choose one complex embedding above each complex infinite place; real places have their unique real embedding. Let I_j(F) consist of all complex infinite places and the real infinite places only when j is odd. Evaluation at the chosen embeddings gives c_j:V_j(F)≃_R R^{I_j(F)}, with inverse reconstructing the conjugate coordinate by (−1)^{j−1} and putting zero at omitted real places. Define the reference Z-lattice c_j⁻¹(Z^{I_j}) and transport coordinate product Haar measure so that its covolume is one. The ambient Euclidean fixed-subspace metric is not the measure convention.
  Hypothesis: The selection is explicit data; changing a complex representative changes its coordinate by (−1)^{j−1}.
  API TauCeti.Borel.targetCoordinates_apply (projection)  [Part 1]: In the model by real functions, c_j(x)(v)=x(σ_v). Starting from the complex Tate model, first use archimedeanTarget_twist to divide by the fixed generator (2πi)^{j−1} exactly once, then evaluate; no second division occurs in c_j.
  API TauCeti.Borel.targetCoordinates_symm (constructor)  [Part 1]: Reconstruction uses x_v at σ_v and (−1)^{j−1}x_v at σ̄_v, with zero at even-weight real places.
  API TauCeti.Borel.targetCoordinates_inverse (equivalence)  [Part 1]: Evaluation and reconstruction are mutually inverse real linear maps.
  API TauCeti.Borel.targetCoordinates_change (compatibility)  [Part 1]: Changing selected representatives gives a diagonal matrix with entries ±1 and absolute determinant one.
  API TauCeti.Borel.targetCoordinates_reference (structure)  [Part 1]: The inverse image of Z^{I_j} is discrete, spans V_j and has covolume one for the transported coordinate measure.
  API TauCeti.Borel.targetCoordinates_ext (extensionality)  [Part 1]: Agreement on the chosen coordinates determines a target element.
  Test TauCeti.Borel.targetCoordinates_pair_two (computation)  [Part 1]: At weight two one exchanged pair has coordinate a and reconstruction (a,−a).
  Test TauCeti.Borel.targetCoordinates_empty (degenerate)  [Part 1]: For F=Q and j=2 the coordinate space is R^0 and the reference lattice has covolume one.
  Test TauCeti.Borel.targetCoordinates_representative_switch (characterisation)  [Part 1]: Switching the embedding of an imaginary quadratic field at j=2 multiplies the single coordinate by −1 and preserves its absolute covolume.

TauCeti.Borel.archimedeanTarget_finrank  [Part 1]
  node BorelRegulators:R.4/target-dimension, theorem
  Statement: For every number field F and j≥2, dim_R V_j(F)=d_j(F)=r1+r2 if j is odd and r2 if j is even. The integral reference lattice has the same Z-rank. The proof uses conjugation-fixed real embeddings and one independent coordinate for each exchanged complex pair.
  Hypothesis: r2 counts conjugate pairs, using the pinned InfinitePlace definition.
  Acceptance: For totally real F and j=2 the target dimension is zero.

TauCeti.Borel.universalBorelClass
  node BorelRegulators:R.4/universal-borel-class, construction
  Statement: For j≥2 and N in the classical stable range, Bo_j∈H_cont^{2j−1}(GL_N(C),R(j−1)) is Burgos’s Definition 9.24 class: suspend ch_j in H^{2j}(BGL_N(C),R(j)), restrict to U_N, identify invariant forms on U_N\(U_N×U_N), identify the same complex relative cochain with coefficients R(j−1), and apply inverse van Est. The twist generator and suspension normalization are fixed by ch_j=(2πi)^j pr_j/j!, with the integral Bott/Hurewicz normalization from topological K-theory. The class restricts compatibly with N and is primitive.
  Hypothesis: GL_N(ℂ) is regarded as a real Lie group with maximal compact subgroup U_N. N lies in the stable range for degree 2j; N≥2j suffices, since the generator of degree 2j−1 of H^*(U_N;ℝ) and the class ch_j on BGL_N(ℂ) are stable from N≥j on.
  Hypothesis: The identification of the coefficient lines ℝ(j) and ℝ(j−1) is the one of Burgos Definition 9.24: both relative cohomology groups are the same real subspace of the cohomology with complex coefficients.
  API TauCeti.Borel.universalBorelClass_stabilize (functoriality): Block pullback Bo_j,N+1=Bo_j,N in the common stable range.
  API TauCeti.Borel.universalBorelClass_primitive (structure): Block sum pulls Bo_j back to pr1*Bo_j+pr2*Bo_j.
  API TauCeti.Borel.universalBorelClass_conjugation (compatibility): Complex conjugation and the Tate generator yield component parity (−1)^{j−1} on regulator values.
  API TauCeti.Borel.universalBorelClass_vanEst (characterisation): Van Est sends Bo_j to the relative class obtained from the suspended normalized ch_j.
  API TauCeti.Borel.universalBorelClass_bott (compatibility): The primitive compact-unitary pairing uses the Bott integral generator with ch_j, including its (j−1)! Hurewicz factor.
  API TauCeti.Borel.universalBorelClass_representation (functoriality): For an algebraic representation ρ:GL_N→GL_M over ℂ, ρ^*Bo_{j,M}∈H_cont^{2j−1}(GL_N(ℂ);ℝ(j−1)) is the image of ch_j of the bundle associated with ρ on BGL_N(ℂ) under the same chain of maps; it is additive in ρ, so it is defined on the representation ring.
  Test TauCeti.Borel.universalBorelClass_stable_two (characterisation): At j=2, block pullback from GL_11(C) to GL_9(C) gives the same degree-three class.
  Test TauCeti.Borel.universalBorelClass_abelian_two (degenerate): Restriction to GL_1(C) has zero degree-three continuous class.
  Test TauCeti.Borel.universalBorelClass_chern_factor (non-example): On indecomposables ch_3=(2πi)^3 c_3/2, so using c_3 without its factor cannot satisfy the normalization.

TauCeti.Borel.traceCocycle  [Part 1]
  node BorelRegulators:R.4/trace-cocycle, construction
  Statement: For j≥2 and m=2j−1, define Φ_m(X_1,…,X_m)=c_j∑_{s∈S_m}sgn(s)Tr(X_{s(1)}⋯X_{s(m)}), where c_j=(−1)^{j−1}(j−1)!/(2j−1)!, on complex square matrices. Regard the Lie algebra as real. The relative Borel representative is Φ_m(X_1†+X_1,…,X_m†+X_m); its absolute Lie cohomology class has invariant representative 2π_{j−1}Φ_m, with π_q(z)=(z+(−1)^q z̄)/2. These are equal as cohomology classes after relative-to-absolute inclusion, not pointwise as cochains.
  Hypothesis: Finite matrix size N; trace and conjugate transpose are Mathlib's.
  API TauCeti.Borel.traceCocycle_alternating (relation)  [Part 1]: Permuting the inputs multiplies Φ by the permutation sign; repeated inputs give zero.
  API TauCeti.Borel.traceCocycle_multilinear (structure)  [Part 1]: Φ is complex multilinear before real-coefficient projection, and its relative and projected forms are real multilinear.
  API TauCeti.Borel.traceCocycle_block (functoriality)  [Part 1]: On block-diagonal inputs Φ is the sum of the forms on the two blocks; adding a zero block leaves it unchanged.
  API TauCeti.Borel.traceCocycle_three (simp)  [Part 1]: Φ3(X,Y,Z)=−Tr(X(YZ−ZY))/2.
  API TauCeti.Borel.traceCocycle_projection (compatibility): π_q is the real-linear projection onto R(q)⊂C; the absolute Borel class is represented by 2π_{j−1}Φ.
  API TauCeti.Borel.traceCocycle_scalar (simp)  [Part 1]: For m>1, if all inputs commute, Φ_m=0.
  Test TauCeti.Borel.traceCocycle_scalar_two (degenerate)  [Part 1]: For N=1 and j=2 the form vanishes on every triple.
  Test TauCeti.Borel.traceCocycle_pauli_two (computation)  [Part 1]: For the Hermitian Pauli matrices X,Y,Z with [Y,Z]=2iX and Tr(X²)=2, Φ3(X,Y,Z)=−2i.
  Test TauCeti.Borel.traceCocycle_repeat (characterisation)  [Part 1]: Φ3(X,X,Z)=0, ruling out the unalternated trace product.

TauCeti.Borel.borelRegulator
  node BorelRegulators:R.4/borel-regulator, construction
  Statement: For a number field F and j≥2 the Borel regulator r_Bo:K_{2j−1}(F)→V_j(F) has σ-component, for each embedding σ:F→ℂ, the composite of K_{2j−1}(σ), the Hurewicz map K_{2j−1}(ℂ)=π_{2j−1}(BGL(ℂ)⁺)→H_{2j−1}(GL(ℂ);ℤ), and the pairing with the restriction of Bo_j to the discrete group GL_N(ℂ), with values in ℝ(j−1). The components satisfy the conjugation condition, so r_Bo lands in V_j(F). The arithmetic regulator r_Bo:K_{2j−1}(O_F)→V_j(F) is the composite with K_{2j−1}(O_F)→K_{2j−1}(F). The normalisation is Burgos's renormalised one, not that of Borel's original lattice.
  Hypothesis: j≥2. K-groups are those of the ring model K.2/functorial-K-theory-of-a-ring, identified with homotopy groups of BGL⁺ by K.2:plus/plus-equals-Q, and H_*(BGL(R)⁺;ℤ)=H_*(GL(R);ℤ) by H.3/plus-integral-homology.
  Hypothesis: The pairing uses the group homology of the discrete group GL_N(ℂ), stably in N.
  API TauCeti.Borel.borelRegulator_embedding (projection): The σ-component equals r_Bo,C∘K(σ).
  API TauCeti.Borel.borelRegulator_add (structure): r_Bo is an additive homomorphism; it kills every torsion element.
  API TauCeti.Borel.borelRegulator_integral (compatibility): r_Bo on K_{2j−1}(O_F) is r_Bo on K_{2j−1}(F) composed with the map induced by O_F⊂F, which is an isomorphism after tensoring with ℚ (ArithmeticKTheory:N.3:ranks/borel-rank-theorem).
  API TauCeti.Borel.borelRegulator_conjugation (relation): In real Tate coordinates r_σ̄=(−1)^{j−1}r_σ.
  API TauCeti.Borel.borelRegulator_natural (functoriality): For a field embedding f:F→E, r_E∘f*=pull_f∘r_F, with identity and composition laws.
  API TauCeti.Borel.borelRegulator_pairing (characterisation): Pairing with Bo_j equals the corresponding component regulator on the Hurewicz image of every K-theory class.
  API TauCeti.Borel.borelRegulator_equiv (functoriality): A number-field isomorphism gives the regulator square with the induced bijection of complex embeddings.
  Test TauCeti.Borel.borelRegulator_Q_two (degenerate): r_Bo:K3(Z)→V2(Q) is zero because the target is zero.
  Test TauCeti.Borel.borelRegulator_torsion (characterisation): For any nonzero integer a with a·x=0, r_Bo(x)=0.
  Test TauCeti.Borel.borelRegulator_imaginary_conjugate (computation): At weight two over an imaginary quadratic F the two components are (a,−a), not (a,a).

TauCeti.Borel.embeddingPullTrace  [Part 1]
  node BorelRegulators:R.4/embedding-pull-trace, construction
  Statement: For a finite extension f:F→E define pull_f:V_j(F)→V_j(E) by (pull_f x)_τ=x_{τ∘f}, and Tr_f:V_j(E)→V_j(F) by (Tr_f y)_σ=∑_{τ∘f=σ}y_τ. Both are real linear and preserve conjugation parity. Every complex embedding σ has exactly [E:F] extensions, hence Tr_f∘pull_f=[E:F]·id. Coordinate matrices are obtained only after targetCoordinates; they are not obtained by discarding the conjugate member of each fiber.
  Hypothesis: F,E number fields and f a field embedding; coefficients use the same Tate generator.
  API TauCeti.Borel.embeddingPull_apply (projection)  [Part 1]: (pull_f x)_τ=x_{τ∘f}.
  API TauCeti.Borel.embeddingTrace_apply (projection)  [Part 1]: (Tr_f y)_σ is the sum over the full embedding fiber above σ.
  API TauCeti.Borel.embeddingPullTrace_id (functoriality): Pullback and trace along identity are identity.
  API TauCeti.Borel.embeddingPullTrace_comp (functoriality): Pull_{g∘f}=pull_g∘pull_f and Tr_{g∘f}=Tr_f∘Tr_g.
  API TauCeti.Borel.embeddingTrace_pull (relation)  [Part 1]: Tr_f∘pull_f=[E:F]·id.
  API TauCeti.Borel.embeddingPullTrace_conjugate (compatibility): Both maps preserve the defining conjugation parity and therefore land in the fixed targets.
  Test TauCeti.Borel.embeddingPullTrace_identity (degenerate): For f=id both maps are identity in every weight.
  Test TauCeti.Borel.embeddingPullTrace_quadratic_odd (computation): For Q⊂Q(i) at j=3, the one-coordinate pull matrix is (1) and the trace matrix is (2).
  Test TauCeti.Borel.embeddingPullTrace_quadratic_even (computation): For Q⊂Q(i) at j=2 the trace to the zero target V2(Q) is zero; summing the pair (a,−a) gives zero.

TauCeti.Borel.borelRegulator_transfer
  node BorelRegulators:R.4/regulator-transfer, theorem
  Statement: For a finite number-field extension f:F→E and j≥2, r_E∘f*=pull_f∘r_F and r_F∘f_*=Tr_f∘r_E on higher K-groups of fields, where f_* is restriction-of-scalars transfer. Thus r_F∘f_*∘f*=[E:F]r_F. The same formula for rings of integers uses their finite projective transfer and compatibility with localization; no unramified hypothesis is added to this field-level formula.
  Hypothesis: The transfer f_* is the transfer of GeneralAlgebraicKTheory K.3 for the finite extension E/F (and for the finite projective O_F-module O_E); no hypothesis on ramification is made.
  Acceptance: An even-weight real target receives the sum of a conjugate pair, which is zero.

TauCeti.Borel.borelRegulator_adams
  node BorelRegulators:R.4/regulator-adams-products, theorem
  Statement: For a number field F, j≥2 and an integer a≥1, r_Bo(ψ^a x)=a^j·r_Bo(x) for x∈K_{2j−1}(F)⊗ℚ, where ψ^a is the Adams operation on higher K-groups. Consequently r_Bo vanishes on every summand of weight w≠j in the weight decomposition of K_{2j−1}(F)⊗ℚ. For classes x, y of positive degrees m, m′ with m+m′=2j−1, r_Bo(x·y)=0: one of the degrees is even, and K_i(F)⊗ℚ=0 for even i≥2. For c∈K₀(F)=ℤ, r_Bo(c·x)=c·r_Bo(x).
  Hypothesis: The operations are those of SchemeKTheoryOperations S.6 on the higher K-theory of a commutative ring, defined through virtual representations of GL_N; Adams operations on K₀ alone do not suffice.
  Acceptance: For a=2 and j=3 the factor is 8.
  Acceptance: The product statement concerns factors of positive degree; multiplication by an integer class of K₀ multiplies the regulator by that integer.
  Acceptance: The proof does not use the comparison with the Beilinson regulator of R.7.

TauCeti.Borel.borelRegulator_realIso
  node BorelRegulators:R.4/regulator-real-isomorphism, theorem
  Statement: For F a number field and j≥2, the linear extension r_Bo,O_F⊗R:K_{2j−1}(O_F)⊗R→V_j(F) is an isomorphism. The same is true for K_{2j−1}(F)⊗R using localization. This is proved from the normalized primitive compact-dual pairing and arithmetic stable comparison, not merely from equality of source and target dimensions.
  Hypothesis: No integral finite-generation hypothesis is used.
  Acceptance: Nonzero primitive pairing is essential; a zero map between equal-dimensional spaces is excluded.

TauCeti.Borel.borelRegulator_isZLattice
  node BorelRegulators:R.4/regulator-lattice, theorem
  Statement: For a number field F and j≥2 let L_j=r_Bo(K_{2j−1}(O_F))⊂V_j(F). Since K_{2j−1}(O_F) is finitely generated (ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem) and r_Bo⊗ℝ is an isomorphism, the kernel of r_Bo on K_{2j−1}(O_F) is its torsion subgroup, K_{2j−1}(O_F)/tors is free of rank d_j, and L_j is a discrete subgroup spanning V_j(F): a ℤ-lattice in the sense of Mathlib's IsZLattice. Finite generation is needed here, though not for the ranks of R.3.
  Hypothesis: Finite generation of K_{2j−1}(O_F) is ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem; any homomorphism to a real vector space kills torsion.
  Acceptance: A finitely generated subgroup whose rank exceeds the ambient dimension can be nondiscrete; the real isomorphism prevents this.

TauCeti.Borel.regulatorMatrix  [Part 1]
  node BorelRegulators:R.4/regulator-determinant, construction
  Statement: Let A=K_{2j−1}(O_F)/tors, d=d_j, with an integral basis b and selected target coordinates c_j. Define the regulator matrix M_{v,a}=c_j(r_Bo(b_a))_v and the top exterior map det(r):Λ^d_R(A⊗R)→Λ^d_R V_j. Its value on b_1∧⋯∧b_d is det(M) times the coordinate orientation. A unimodular integral basis change U multiplies det(M) by det(U)=±1; its absolute value is intrinsic. For d=0 use the empty determinant 1.
  Hypothesis: A is finite free from the arithmetic finiteness theorem; determinant lines are top exterior powers in Mathlib's exterior algebra.
  API TauCeti.Borel.regulatorMatrix_apply (projection)  [Part 1]: M_{v,a}=c_j(r_Bo(b_a))_v.
  API TauCeti.Borel.regulatorMatrix_basis_change (compatibility)  [Part 1]: For b′=bU, M(b′)=M(b)U and det M(b′)=det M(b)det U.
  API TauCeti.Borel.regulatorMatrix_target_change (compatibility): Changing embedding representatives gives M′=DM for a diagonal sign matrix D.
  API TauCeti.Borel.regulatorMatrix_topExterior (characterisation): The top exterior regulator map is multiplication by det M in the specified orientations.
  API TauCeti.Borel.regulatorMatrix_scalar (relation)  [Part 1]: Multiplying the regulator by λ multiplies det M by λ^d.
  API TauCeti.Borel.regulatorMatrix_empty (simp)  [Part 1]: At d=0 the matrix is 0×0 and its determinant is one.
  Test TauCeti.Borel.regulatorMatrix_rank_zero (degenerate)  [Part 1]: The determinant at rank zero is 1.
  Test TauCeti.Borel.regulatorMatrix_swap (computation)  [Part 1]: Swapping two integral basis vectors negates the determinant and preserves its absolute value.
  Test TauCeti.Borel.regulatorMatrix_double_two (computation)  [Part 1]: For d=2, doubling every regulator component multiplies the determinant by 4, not by 2.

TauCeti.Borel.regulatorCovolume  [Part 1]
  node BorelRegulators:R.4/regulator-covolume, construction
  Statement: Define R_Bo,j(F)>0 as Mathlib's ZLattice.covolume of the arithmetic regulator image L_j with respect to the target measure transported from targetCoordinates. Equivalently R_Bo,j(F)=|det M| for any integral basis of K_{2j−1}(O_F)/tors. The reference fixed Tate integer lattice has covolume one. At d_j=0 set R_Bo,j(F)=1, agreeing with the volume of a zero-dimensional space.
  Hypothesis: The full-lattice result and its discrete topology are established, not implicit assumptions on an arbitrary image.
  API TauCeti.Borel.regulatorCovolume_det (compatibility)  [Part 1]: R_Bo,j=|det regulatorMatrix| under the selected coordinate measure.
  API TauCeti.Borel.regulatorCovolume_pos (characterisation)  [Part 1]: The covolume is strictly positive for the proven full lattice.
  API TauCeti.Borel.regulatorCovolume_basis_independent (relation)  [Part 1]: Every integral basis and every allowed representative selection gives the same positive value.
  API TauCeti.Borel.regulatorCovolume_scalar (relation): For a nonzero real scalar λ, the image lattice of λr has covolume |λ|^{d_j}R_Bo,j.
  API TauCeti.Borel.regulatorCovolume_original (compatibility): Relative to Borel’s original R′, R_Bo=(2π)^{d_j}R′ if j≢3 mod4, and R_Bo=(2π)^{d_j}2^{r1}R′ if j≡3 mod4.
  Test TauCeti.Borel.regulatorCovolume_zero_rank (degenerate)  [Part 1]: For F=Q and j=2 the covolume is 1.
  Test TauCeti.Borel.regulatorCovolume_rank_one_sign (computation)  [Part 1]: For a rank-one matrix (a), the covolume is |a| and is unchanged by a↦−a.
  Test TauCeti.Borel.regulatorCovolume_reference (compatibility)  [Part 1]: The reference lattice Z^{I_j} has covolume 1 for the coordinate measure; no √2 per complex pair occurs.

## R.5 Dedekind zeta functions and leading terms

TauCeti.Borel.completedZeta_convention
  node BorelRegulators:R.5/completed-zeta-conventions, comparison
  Statement: Specialize the AL.1 completed Hecke L-function to the trivial idele-class character and compare its Re(s)>1 finite product with the pinned Dedekind L-series. Adopt Γ_R(s)=π^{−s/2}Γ(s/2), Γ_C(s)=2(2π)^{−s}Γ(s) and Λ_F(s)=|D_F|^{s/2}Γ_R(s)^{r1}Γ_C(s)^{r2}ζ_F(s). Since AL.1 uses L_C(s)=(2π)^{1−s}Γ(s)=πΓ_C(s), the adopted completion is |D_F|^{s/2}π^{−r2}Λ_AL(s,1). It satisfies Λ_F(s)=Λ_F(1−s), with only simple poles at 0 and 1. ζ_F here denotes the meromorphic continuation supplied by AL.1, which agrees with NumberField.dedekindZeta only in the convergence half-plane.
  Hypothesis: F number field; D_F absolute discriminant in the positive power, although signed D is used in rational differential-form restriction of scalars.
  Acceptance: The π per complex place is explicit; it must not become a hidden rational factor.

TauCeti.Borel.dedekindZeta_vanishingOrder
  node BorelRegulators:R.5/zeta-zero-order, theorem
  Statement: For F a number field and j≥2, ζ_F is holomorphic at s0=1−j and has exact vanishing order d_j=dim_R V_j(F). If j is odd, each real Γ_R factor and each complex Γ_C factor has a simple pole at s0, giving d_j=r1+r2; if j is even, only the complex factors have poles, giving d_j=r2. Λ_F(s0)=Λ_F(j) is finite and nonzero because ζ_F(j)>0. Thus no additional zero is possible. At a totally real field and j=2, ζ_F(−1) is finite and nonzero, not a pole.
  Hypothesis: Use the continued zeta, j≥2, and the exact gamma pole/residue interfaces from AL.1.
  Acceptance: For Q and j=2 the exact order is zero; for Q and j=3 it is one.

TauCeti.Borel.normalizedLeadingCoefficient  [Part 1]
  node BorelRegulators:R.5/zeta-leading-coefficient, definition
  Statement: For the holomorphic continued ζ_F at s0=1−j with d=d_j, define ζ_F*(1−j)=ζ_F^{(d)}(s0)/d!, equivalently the value g(s0) in the unique germ factorization ζ_F(s)=(s−s0)^d g(s) with g holomorphic and g(s0)≠0. It is also lim_{s→s0}ζ_F(s)/(s−s0)^d. The general definition is for an analytic function f, its complex iterated derivative and the proven exact order; specialization to ζ_F imports its continuation.
  Hypothesis: F number field, j≥2; d is exact vanishing order, not an arbitrary exponent.
  API TauCeti.Borel.normalizedLeadingCoefficient_order_zero (simp)  [Part 1]: For d=0 the coefficient of an analytic f at s0 is f(s0).
  API TauCeti.Borel.normalizedLeadingCoefficient_factor (characterisation)  [Part 1]: If f=(s−s0)^d g as analytic germs, the coefficient equals g(s0).
  API TauCeti.Borel.normalizedLeadingCoefficient_limit (compatibility)  [Part 1]: For a zero of exact order d it equals the removable limit f(s)/(s−s0)^d.
  API TauCeti.Borel.normalizedLeadingCoefficient_ne_zero (characterisation)  [Part 1]: For finite exact vanishing order d, the coefficient is nonzero.
  API TauCeti.Borel.normalizedLeadingCoefficient_smul (functoriality)  [Part 1]: Multiplying f by a complex scalar a multiplies the coefficient by a.
  API TauCeti.Borel.zetaLeadingCoefficient_real (compatibility): The specialized zeta coefficient is real and nonzero by conjugation symmetry.
  Test TauCeti.Borel.normalizedLeadingCoefficient_square (computation)  [Part 1]: For f(z)=z² at s0=0 and d=2 the coefficient is 1, whereas f″(0)=2.
  Test TauCeti.Borel.normalizedLeadingCoefficient_constant (degenerate)  [Part 1]: For f(z)=7 and d=0 the coefficient is 7.
  Test TauCeti.Borel.normalizedLeadingCoefficient_wrong_order (non-example)  [Part 1]: For f(z)=z³ at 0, the coefficient with d=2 is zero, so d=2 fails the exact-order nonzero test.

TauCeti.Borel.zetaLeading_functionalEquation
  node BorelRegulators:R.5/leading-term-functional-equation, theorem
  Statement: Write A_F(s)=Γ_R(s)^{r1}Γ_C(s)^{r2} and a_{F,j}=lim_{s→1−j}(s+j−1)^{d_j}A_F(s), a nonzero real number determined by gamma residues. Then ζ_F*(1−j)=|D_F|^{j−1/2} A_F(j)ζ_F(j)/a_{F,j}. Consequently |ζ_F*(1−j)|∼_Q |D_F|^{1/2}π^{d_j−[F:Q]j}ζ_F(j), where ∼_Q means quotient in Q×. The integer factor |D_F|^{j−1}, signs, powers of 2 and factorials are rational factors; the exact formula retains them before taking proportionality.
  Hypothesis: j≥2; completed-zeta convention and exact zero order fixed.
  Acceptance: For Q,j=2 the formula gives ζ(−1)=−1/12.

TauCeti.Borel.arithmeticCompactFactorComparison
  node BorelRegulators:R.5/compact-factor-comparison, theorem
  Statement: Let F be a number field of degree d, N odd, G_N=SL_N(F⊗ℝ), K_N its standard maximal compact subgroup (SO_N at real places, SU_N at complex places), Γ⊂SL_N(F) a torsion-free arithmetic subgroup, Y_N=Γ\G_N and X_N=Γ\G_N/K_N. Write g and k for the complexified Lie algebras of G_N and K_N, G_u for the compact form of G_N(ℂ) containing K_N, and X_u=G_u/K_N for the compact dual. Invariant forms give maps β:H^*(g;ℂ)→H^*(Y_N;ℂ) and j:H^*(g,k;ℂ)→H^*(X_N;ℂ), and the compact-form isomorphisms α:H^*(g;ℂ)≅H^*(G_u;ℂ), α_rel:H^*(g,k;ℂ)≅H^*(X_u;ℂ) are compatible with them: β∘incl=p^*∘j for the inclusion of relative into absolute cochains and the projection p:Y_N→X_N. The three spectral sequences of the fibrations with fibre K_N, namely of G_u→X_u, of g modulo k, and of Y_N→X_N, are compatible under these maps. For odd N the restriction H^*(G_u;ℂ)→H^*(K_N;ℂ) is surjective, the three spectral sequences degenerate, and H^*(G_u;ℂ) is the exterior algebra on P₁⊕P₂ with p^* mapping H^*(X_u;ℂ) isomorphically onto ΛP₁ and restriction mapping ΛP₂ isomorphically onto H^*(K_N;ℂ). In every degree q with 4q<N−1, j and β are isomorphisms. In those degrees the splitting P=P₁⊕P₂ of the primitive elements is the one used to factor determinant lines in the period theorem.
  Hypothesis: N is odd: for a real place the fibre SO_N is totally non-homologous to zero in SU_N only for odd N. Nothing is asserted for even N.
  Hypothesis: Γ is torsion-free, so that Y_N→X_N is a principal K_N-bundle of manifolds; other arithmetic subgroups are reached by finite covers.
  Hypothesis: j is an isomorphism in degrees q with 4q<N−1 by R.3. The period theorem applies the statement in degree d(2j−1), which requires N−1>4d(2j−1).
  Acceptance: At a complex place the compact form is SU_N×SU_N with the diagonal SU_N as fibre; the base primitives are differences of the primitives of the two factors.
  Acceptance: For N=2 and a real place the fibre SO₂ is a circle and H¹(SU₂)=0, so restriction is not surjective: oddness of N cannot be dropped.
  Acceptance: The period theorem uses β on Y_N, while the rank theorem uses j on X_N; the compatibility β∘incl=p^*∘j is what relates them.

TauCeti.Borel.borel_positiveZetaPeriod
  node BorelRegulators:R.5/borel-positive-zeta-period, theorem
  Statement: Let F have degree d, j≥2 and N odd with N−1>4d(2j−1); let Γ⊂SL_N(F) be a torsion-free arithmetic subgroup, Y_N=Γ\SL_N(F⊗ℝ) and X_N=Y_N/K_N, with the notation of arithmeticCompactFactorComparison. (1) Let L(g) be the d-th exterior power of the space of primitive elements of degree 2j−1 of H^*(g;ℂ), with the ℚ-structure given by ℚ-rational invariant forms on Res_{F/ℚ}SL_N, and L(Y_N) the d-th exterior power of the space of indecomposable elements of H^{2j−1}(Y_N;ℚ). Then β(L(g))=ζ_F(j)·L(Y_N) (Borel's Theorem 5.5 with m=j−1). (2) Let L(X_u) and L(Γ) be the d_j-th exterior powers of the spaces of indecomposable elements of degree 2j−1 of H^*(X_u;ℚ) and of H^*(Γ;ℚ). Then j_Γ(L(X_u))=R′·L(Γ) with R′=|D_F|^{1/2}·π^{−dj}·ζ_F(j) (Theorem 6.2). These are equalities of ℚ-structures on complex lines, so they determine the scalars up to ℚ^×. The power of i printed in 5.5(1) is removed by the 1980 correction. The statement concerns rational structures; integral bases of K-groups enter in borelRegulator_zetaProportional.
  Hypothesis: N is odd and N−1>4d(2j−1), so that β and j_Γ are isomorphisms in the degrees used; the statement for one arithmetic subgroup implies it for all.
  Hypothesis: The norm-one volumes and the compact cycles of R.6 are available: at the level of declarations they precede this theorem.
  Acceptance: The proof needs the nonvanishing of the restriction of the primitive product to the compact cycle; rationality of a Haar measure alone proves nothing about regulators.
  Acceptance: For F totally real and j even, d_j=0, both lines in (2) are ℚ and the statement says |D_F|^{1/2}π^{−dj}ζ_F(j)∈ℚ^× (Borel's Remark 6.3); for F=ℚ and j=2 this is ζ(2)/π²=1/6.

TauCeti.Borel.borelRegulator_zetaProportional
  node BorelRegulators:R.5/borel-zeta-proportionality, theorem
  Statement: For a number field F and j≥2, R_Bo,j(F)∼_Q |ζ_F*(1−j)|, equivalently there exists q∈Q_{>0} with R_Bo,j(F)=q|ζ_F*(1−j)|. In Borel’s original homotopy-lattice convention R′_j∼_Q π^{−d_j}|ζ_F*(1−j)|. Burgos’s renormalization multiplies that covolume by (2π)^{d_j}, and by the additional rational factor 2^{r1} when j≡3 mod4. This removes the transcendental π discrepancy. No formula for q in terms of torsion orders or dyadic factors is asserted.
  Hypothesis: j≥2; finite generation, full regulator lattice, analytic continuation and the primitive-period theorem are all established inputs.
  Acceptance: For Q,j=2, R=1 and |ζ*(−1)|=1/12 give a rational ratio 12.
  Acceptance: An integral Lichtenbaum torsion identity does not follow from this theorem.

## R.6 Bloch's Tamagawa reformulation

TauCeti.Borel.exists_archimedeanSplitDivision  [Part 1]
  node BorelRegulators:R.6/archimedean-split-division, theorem
  Statement: For every number field F and integer e≥2 there is a central division F-algebra D of degree e (dimension e² over F) with D⊗_F F_v≅M_e(F_v) at every archimedean place v. Construction: choose a cyclic extension L/F of degree e and two distinct finite places v₁, v₂ of F that are unramified and inert in L. Let α∈Br(F) be the class with local invariants 1/e at v₁, −1/e at v₂ and 0 at all other places. Then α has period e and index e, and D is the division algebra in the class α.
  Hypothesis: The two places are chosen after the cyclic field, so no existence theorem for extensions with prescribed behaviour at given places is needed.
  Hypothesis: The index of a Brauer class and its relation to periods and splitting fields are those of SemisimpleAlgebrasPartII SA.0 and SA.1.
  Acceptance: For e=2 this is a quaternion algebra ramified at exactly two finite places and split at every real place.
  Acceptance: For F=ℚ, e=2 and L=ℚ(i): the primes 3 and 7 are inert, and the quaternion algebra over ℚ ramified exactly at 3 and 7 is a division algebra split at infinity.
  Acceptance: A quaternion algebra ramified at a real place does not satisfy the conclusion.

TauCeti.Borel.normOne_tamagawaNumber
  node BorelRegulators:R.6/norm-one-tamagawa, theorem
  Statement: For a central division algebra D of degree e≥2 over a number field F, the group H=SL_1(D) of elements of reduced norm one is a simply connected inner form of SL_e, anisotropic over F, and its Tamagawa number is τ(H)=1 (Weil). The period theorem uses only that τ(H) is a nonzero rational number. This computation is specific to H: AdelicAlgebraicGroups AA.2 defines Tamagawa measures and numbers and AA.3 proves compactness of the quotient, but neither computes τ(H).
  Hypothesis: τ is the Tamagawa number of AA.2/tamagawa-number for the measure of AA.2/tamagawa-measure, which includes the factor |D_F|^{−dim H/2}; H has no nontrivial characters, so no convergence factors occur.
  Acceptance: Changing one local measure without the compensating product normalization changes τ and invalidates τ=1.

TauCeti.Borel.specialLinear_localVolume
  node BorelRegulators:R.6/local-sl-volume, theorem
  Statement: At a good finite place v where H is split with integral model SL_e and residue field of cardinality q_v, the algebraic differential-form measure normalized as in AA.2 gives μ_v(SL_e(O_v))=q_v^{−(e²−1)}#SL_e(F_{q_v})=∏_{a=2}^e(1−q_v^{−a}). At the finitely many exceptional places, compact-open volume with respect to an F-rational invariant form is a positive rational number. The finite product of exceptional volume ratios is therefore in Q_{>0}.
  Hypothesis: q_v is a finite-field cardinality, e≥2; integral form is a generator at good places.
  Acceptance: For e=2,q=2 the volume is 3/4.
  Acceptance: The product begins at a=2, so no divergent ζ_F(1) factor appears.

TauCeti.Borel.normOne_archimedeanVolume
  node BorelRegulators:R.6/norm-one-volume, theorem
  Statement: For an archimedean-split division algebra D of degree e≥2, H=SL_1(D), a nonzero F-rational invariant top form ω and any arithmetic Γ⊂H(F), μ_∞(H(F⊗R)/Γ)∼_Q∏_{a=2}^e ζ_F(a), with μ_∞ the discriminant-normalized positive archimedean measure from ω. H(A_F)/H(F) is compact. Taking Γ_U=H(F)∩(H_∞U), AA.4 strong approximation gives H(A_F)=H(F)H_∞U and τ(H)=μ_∞(H_∞/Γ_U)vol_f(U). Commensurable arithmetic groups change this volume by a positive rational index.
  Hypothesis: H is anisotropic over F, simply connected and archimedean-split; H_∞ is noncompact, satisfying the strong approximation hypothesis outside the infinite places.
  Acceptance: For e=2 only ζ_F(2) occurs.
  Acceptance: The proof does not use R.5 regulator proportionality, avoiding a circular Tamagawa reformulation.

TauCeti.Borel.restrictionScalarsForm
  node BorelRegulators:R.6/restriction-scalars-form, construction
  Statement: Choose an ordered integral basis α_1,…,α_d and ordered complex embeddings σ_1,…,σ_d. Put δ_F=det(σ_i(α_a)), so δ_F²=D_F is the signed discriminant and (−1)^{r2}D_F>0. For an F-rational invariant q-form η define Rη=δ_F^{−q}∧_{σ∈Σ_F}ση on the restriction-of-scalars complex group. For a top form of F-dimension h, the associated positive archimedean Haar measure instead uses |D_F|^{−h/2}∏_{v|∞}|ω_v|. These signed algebraic and positive measure conventions are distinct and are related with their conjugate-pair orientation factors.
  Hypothesis: δ_F≠0; embedding order and integral-basis orientation are recorded. Use the 1980 correction to the algebraic form.
  API TauCeti.Borel.restrictionScalarsForm_factor (projection): The algebraic normalization scalar is δ_F^{−q}.
  API TauCeti.Borel.restrictionScalarsForm_embedding_order (relation): Permuting embeddings changes both δ_F^{−q} and the wedge by the same permutation-sign power, so Rη is unchanged.
  API TauCeti.Borel.restrictionScalarsForm_integral_basis (compatibility): An integral basis change of determinant ±1 changes the algebraic normalization by (±1)^q; the rational line and positive Haar measure are unchanged.
  API TauCeti.Borel.restrictionScalarsForm_positive_measure (compatibility): The positive top-form measure has scalar |D_F|^{−h/2}, agreeing with the AA.2 Tamagawa convention.
  API TauCeti.Borel.restrictionScalarsForm_scalar (functoriality): For a∈F×, R(aη)=Norm_{F/Q}(a)Rη.
  API TauCeti.Borel.restrictionScalarsForm_erratum (compatibility): In Borel 5.5(1),(4) and 6.2(5) the corrected identities remove the printed i^{r2}; this does not remove every orientation phase elsewhere.
  Test TauCeti.Borel.restrictionScalarsForm_Q (degenerate)  [Part 1]: For F=Q with integral basis (1), δ=1 and Rη=η.
  Test TauCeti.Borel.restrictionScalarsForm_Qi (computation)  [Part 1]: For F=Q(i), basis (1,i) and embeddings (id,conj), δ=−2i and D=−4; at q=1 the scalar is i/2.
  Test TauCeti.Borel.restrictionScalarsForm_absolute_wrong (non-example)  [Part 1]: In that Q(i) case the scalar 1/2 from |D|½ gives a different algebraic form and fails δ²=D.

TauCeti.Borel.compactPeriodCycle
  node BorelRegulators:R.6/compact-period-cycles, construction
  Statement: For an archimedean-split central division F-algebra D of degree e, choose a neat arithmetic Γ_D⊂SL_1(D)(F). The quotient Z_D=Γ_D\SL_1(D)(F⊗R) is a compact oriented manifold of real dimension [F:Q](e²−1). The left regular F-representation on D gives SL_1(D)→SL_{e²}; after a lattice choice and finite-index passage it maps Γ_D into SL_N(O_F) for every sufficiently large N. Its compact fundamental cycle defines a period functional on the ambient arithmetic cohomology. Pullback of each algebraic SL_N primitive generator of weight 2≤j≤e is e times the corresponding standard SL_e generator under the archimedean splitting, and the relevant top exterior pairing is nonzero.
  Hypothesis: N≥e² and N is large enough for the comparison in the degrees of the primitive classes; a neat arithmetic subgroup exists by AA.4/neat-level-exists.
  API TauCeti.Borel.compactPeriodCycle_fundamental (data): Z_D has its integral fundamental class in top degree with the selected orientation.
  API TauCeti.Borel.compactPeriodCycle_map (projection): The cycle map comes from the left regular representation followed by block inclusion.
  API TauCeti.Borel.compactPeriodCycle_primitive (compatibility): For 2≤j≤e, pullback of the normalized algebraic primitive generator is e times the split standard generator.
  API TauCeti.Borel.compactPeriodCycle_integral (characterisation): Pairing the normalized top invariant form with the cycle equals its finite quotient-volume integral.
  API TauCeti.Borel.compactPeriodCycle_cover (functoriality): Passing to a subgroup of index a multiplies the pushed-forward fundamental class and top-form integral by a.
  API TauCeti.Borel.compactPeriodCycle_orientation (relation): Reversing orientation negates the signed period and preserves the positive volume.
  Test TauCeti.Borel.compactPeriodCycle_degree_two (computation): For e=2, left regular representation has F-dimension 4 and the weight-two primitive pullback factor is 2.
  Test TauCeti.Borel.compactPeriodCycle_finite_cover (computation): An index-two neat subgroup doubles the top period.
  Test TauCeti.Borel.compactPeriodCycle_split_algebra_wrong (non-example): Replacing division D by M_e(F) gives an isotropic group and does not supply the compact quotient used here.

TauCeti.Borel.adelicPeriodPairing
  node BorelRegulators:R.6/adelic-period-pairing, construction
  Statement: For the compact oriented cycle Z_D and compact-open U with Γ_D=H(F)∩H_∞U, define I_D(η,U)=∫_{Z_D}η for every real-valued rational invariant top form η, including zero. For nonzero η let c_η>0 be the explicitly computed conversion scalar satisfying μ_∞^Tam=c_η|η| in the fixed AA.2 normalization. Then μ_∞^Tam(Z_D)=c_η|I_D(η,U)| and c_η|I_D(η,U)|vol_f(U)=τ(H). The scalar is obtained from the differential-form and restriction-of-scalars conventions, rather than assumed equal to one. For primitive wedge forms this integral equals the singular/de Rham pairing with [Z_D]. This is the specialized period interface needed in Bloch’s Tamagawa formulation.
  Hypothesis: The quotient is compact and oriented. The integration map is defined for zero; c_η and the volume formula require η≠0. All local measures and the selected rational Tamagawa form are fixed compatibly.
  API TauCeti.Borel.adelicPeriodPairing_linear (structure): I_D is linear in the top form for a fixed orientation and quotient.
  API TauCeti.Borel.adelicPeriodPairing_cohomology (compatibility): For a closed top form, I_D equals the de Rham/singular pairing with the fundamental class.
  API TauCeti.Borel.adelicPeriodPairing_volume (characterisation): For η≠0, μ_∞^Tam(Z_D)=c_η|I_D(η,U)| and c_η|I_D(η,U)|vol_f(U)=τ(H), with c_η defined by μ_∞^Tam=c_η|η|.
  API TauCeti.Borel.adelicPeriodPairing_local_rescale (relation): Rescaling local measures by a_v, all but finitely many one, rescales the total measure by ∏a_v; the archimedean/finite product equation changes accordingly.
  API TauCeti.Borel.adelicPeriodPairing_cover (functoriality): Finite cover of degree a multiplies the integral by a.
  API TauCeti.Borel.adelicPeriodPairing_form_rescale (relation): With measures fixed and a∈Q×, I_D(aη,U)=aI_D(η,U) and c_{aη}=c_η/|a|. Thus the converted quotient volume is unchanged.
  Test TauCeti.Borel.adelicPeriodPairing_zero_form (degenerate): The integral of the zero top form is zero.
  Test TauCeti.Borel.adelicPeriodPairing_sign (computation): Replacing η by −η negates I_D but leaves its absolute volume unchanged.
  Test TauCeti.Borel.adelicPeriodPairing_rescale (characterisation): Doubling one finite local measure doubles the finite product; the normalization equation cannot stay unchanged without its compensating global conversion.
  Test TauCeti.Borel.adelicPeriodPairing_double_form (computation): With all Tamagawa measures fixed, replacing nonzero η by 2η doubles I_D and halves c_η; the unconverted equation |I_D|vol_f(U)=τ(H) cannot hold for both forms.

TauCeti.Borel.bloch_borelPairingComparison
  node BorelRegulators:R.6/bloch-borel-interface, comparison
  Statement: Bloch's first four lectures express Borel's theorem through a pairing of primitive cohomology classes with compact cycles and through Tamagawa measures. The comparison identifies that pairing and its local measures with adelicPeriodPairing: an equality of pairings, together with the explicit scalar converting Bloch's measures into the normalisations of restrictionScalarsForm and of AA.2. Combined with borelRegulator_zetaProportional it gives Bloch's form of the regulator theorem. It is a comparison of two normalisations of one pairing, and does not take Borel's theorem as an axiom.
  Hypothesis: The Borel side is fixed by the nodes of R.5 and R.6. The Bloch side is specified by Lectures 1–4 of Bloch's notes; its definitions and locators are not recorded in this plan (see the gap on Bloch's pairing convention).
  Acceptance: The comparison is complete only with locators for Bloch's definitions and a table of the measure conversions.
  Acceptance: Doubling the form on the Borel side must be compensated on the Bloch side exactly as in adelicPeriodPairing_form_rescale.

## R.7 Beilinson comparison and tests

TauCeti.Borel.complexGL_relativeToAbsolute_injective
  node BorelRegulators:R.7/relative-absolute-injectivity, theorem
  Statement: For GL_N(ℂ) as a real Lie group with maximal compact subgroup U_N, the map from relative to absolute Lie algebra cohomology H^*(gl_N(ℂ),u_N;ℝ(j−1))→H^*(gl_N(ℂ);ℝ(j−1)) is injective. Under compact duality it is the pullback H^*(U_N)→H^*(U_N×U_N) along the quotient map (M,M′)↦M^{−1}M′, which sends a primitive generator x to 1⊗x−x⊗1; restriction to the second factor is a left inverse on the exterior algebra generated by the primitives. Hence an equality of the images of Bo_j and Be_j in absolute cohomology implies their equality in relative cohomology.
  Hypothesis: Use the GL_N(C) symmetric pair; no injectivity assertion is made for arbitrary relative Lie pairs.
  Acceptance: Equality of absolute representatives is used only with this injectivity input.

TauCeti.Borel.beilinson_absoluteRepresentative
  node BorelRegulators:R.7/beilinson-infinitesimal-representative, theorem
  Statement: For j≥2 and N stable, the universal Beilinson class Be_j determined by the M.8 higher Deligne Chern character has absolute Lie representative π_{j−1}Φ_{2j−1}, with π_q(z)=(z+(−1)^q z̄)/2. This uses the first infinitesimal diagonal of the simplicial classifying scheme, its differential-form normalization into the Weil algebra, the inverse Chern–Weil construction, and the explicit van Est identification. The normalized M.8 class is the higher Chern character, not the unscaled Chern class.
  Hypothesis: The Beilinson class Be_j is the universal class of M.8/number-field-deligne-normalization, built from the Deligne regulator of M.8/deligne-regulator; that node does not depend on the comparison with Borel's regulator.
  Hypothesis: The description of the Chern–Weil homomorphism and of the van Est isomorphism through the first infinitesimal neighbourhood of the diagonal of the simplicial classifying scheme (Burgos §§8.2–8.3) is requested from AutomorphicFormsOnReductiveGroups AF.1a.
  Acceptance: At j=2 the representative is π1Φ3, half the Borel absolute representative.

TauCeti.Borel.borelClass_eq_two_beilinsonClass
  node BorelRegulators:R.7/universal-factor-two, theorem
  Statement: For every j≥2 and N in the fixed classical stable range, Bo_j=2Be_j in H_cont^{2j−1}(GL_N(C),R(j−1)), with Burgos Definitions 9.24 and 10.8 and ch_j=(2πi)^j pr_j/j!. The equality is compatible with stabilization. Its proof compares the two explicit absolute Lie classes and then uses the proved relative-to-absolute injectivity and van Est; weight two is a test and is not the proof for other j.
  Hypothesis: The selected Tate generators, suspension sign and Chern-character normalization are identical on both sides.
  Acceptance: At j=3 the same scalar 2 holds; no guessed weight-dependent scalar is introduced.

TauCeti.Borel.borelRegulator_eq_two_beilinsonRegulator
  node BorelRegulators:R.7/regulator-factor-two, theorem
  Statement: Let r_Be be the Beilinson regulator K_{2j−1}(F)→H_D¹(F⊗ℝ,ℝ(j))≅V_j(F), the Deligne regulator of MotivicEtaleKTheory M.8 with the identification of M.8/number-field-deligne-normalization, in the same Tate coordinate as r_Bo. For j≥2, r_Bo=2·r_Be on K_{2j−1}(F), and on K_{2j−1}(O_F) after composing with O_F⊂F. On determinant lines of rank d_j, det(r_Bo)=2^{d_j}det(r_Be), and R_Bo,j=2^{d_j}R_Be,j for the same reference measure. Hence both covolumes are rational multiples of |ζ_F^*(1−j)|.
  Hypothesis: The Deligne-field identification is the quotient C/R(j)≅R(j−1), and retains simultaneous conjugation invariants.
  Acceptance: For d_j=1 the covolume factor is 2; for d_j=2 it is 4; for d_j=0 it is 1.

TauCeti.Borel.borelRegulator_blochWigner_exact
  node BorelRegulators:R.7/weight-two-bloch-wigner, comparison
  Statement: At j=2, compare r_Bo with the Bloch–Wigner homomorphism of Polylogarithms P.2 composed with Suslin's map K₃(F)→B(F), and with the measurable homogeneous cocycle D(r(g₀x,g₁x,g₂x,g₃x)), where r is the cross-ratio with r(∞,0,1,z)=z. The statement is that there is a nonzero rational number λ_BW, independent of F and of the place, such that at every complex place the coordinate of r_Bo(x) in targetCoordinates is λ_BW·D(Suslin(x)). Its value and sign are determined by comparing Goncharov's formulas (61) and (64) and Theorem 5.7 with Φ₃, including the projection from complex to real coefficients and the division by 2πi. No value of λ_BW is asserted in this plan; proportionality by some nonzero rational number is the statement of Polylogarithms P.2.
  Hypothesis: The factor two between the Borel and Beilinson classes is fixed in every weight by borelClass_eq_two_beilinsonClass and does not depend on λ_BW.
  Acceptance: The Pauli test Φ3=−2i detects a trace normalization error, but does not by itself identify the Suslin/Bloch–Wigner scalar.

TauCeti.Borel.borelRegulator_smallFields
  node BorelRegulators:R.7/number-field-small-cases, application
  Statement: For Q and every even j≥2, V_j(Q)=0, the rational odd K-group is zero and its arithmetic regulator covolume is 1. For an imaginary quadratic F and j=2, V_2(F) is one-dimensional with components (a,−a); the arithmetic regulator image is a full rank-one lattice and changes sign when the selected embedding is conjugated. For F=Q(√−3), put ζ_6=(1+√−3)/2. With Suslin’s antisymmetric tensor quotient, ∂[ζ_6]=−ζ_6⊗ζ_6 can be nonzero 2-torsion; consequently 2[ζ_6] is an integral Bloch element and [ζ_6] is a rational Bloch element. This follows from 1−ζ_6=ζ_6^{-1} and 2(ζ_6⊗ζ_6)=0. The Bloch–Wigner values D(ζ_6) and 2D(ζ_6) are positive at the upper-half-plane embedding. The exact numerical conversion to the adopted Borel coordinate uses the unresolved λ_BW test, while rank one and nonzero image follow independently from the real regulator isomorphism.
  Hypothesis: j≥2; ζ_6 is tested in the rationalized Suslin/Bloch comparison, with the stated boundary convention.
  Acceptance: At Q,j=2 the zeta value is nonzero although the rational K3 rank is zero.
  Acceptance: At an imaginary quadratic field switching embedding changes orientation but preserves absolute determinant.
  Acceptance: The integral test is 2[ζ_6]; replacing the antisymmetric tensor quotient by an exterior square would incorrectly kill every diagonal tensor. The rationalized test may use [ζ_6].

TauCeti.Borel.embeddingMatrices  [Part 1]
  node BorelRegulators:R.7/extension-matrix, construction
  Statement: For f:F→E finite and selected coordinates c_F,c_E, define P_f=c_E∘pull_f∘c_F⁻¹ and T_f=c_F∘Tr_f∘c_E⁻¹ as real linear maps between coordinate spaces and take their matrices in the standard bases. Entries sum the signed contributions of all complex embedding extensions, including conjugate representatives. Then T_f P_f=[E:F]I, coordinate matrices equal the coordinate-free maps, and they compose with extension/trace. For equal-dimensional target spaces their determinant relation is det(T_f)det(P_f)=[E:F]^{d_j}; for unequal dimensions this is a rectangular matrix relation, with no square determinant asserted.
  Hypothesis: F,E number fields, j≥2, f finite; both coordinate selections are explicit.
  API TauCeti.Borel.embeddingMatrices_pull_apply (projection)  [Part 1]: The pull matrix acts on c_F(x) as c_E(pull_f x).
  API TauCeti.Borel.embeddingMatrices_trace_apply (projection)  [Part 1]: The trace matrix acts on c_E(y) as c_F(Tr_f y).
  API TauCeti.Borel.embeddingMatrices_id (functoriality)  [Part 1]: Identity extension gives identity matrices.
  API TauCeti.Borel.embeddingMatrices_comp (functoriality)  [Part 1]: For F→E→L, P_comp=P_EL P_FE and T_comp=T_FE T_EL.
  API TauCeti.Borel.embeddingMatrices_trace_pull (relation)  [Part 1]: T_f P_f=[E:F]I with the appropriate source index.
  API TauCeti.Borel.embeddingMatrices_representatives (compatibility): A source/target representative change conjugates the maps by the corresponding diagonal sign matrices.
  API TauCeti.Borel.embeddingMatrices_regulator (compatibility): The coordinate regulator matrices satisfy the pullback/transfer commuting squares, including exact Borel–Beilinson scaling.
  Test TauCeti.Borel.embeddingMatrices_quadratic_odd (computation)  [Part 1]: For Q→Q(i),j=3, the one-by-one pull/trace matrices are (1) and (2).
  Test TauCeti.Borel.embeddingMatrices_Q_weight_two (degenerate)  [Part 1]: For Q→Q(i),j=2, the pull matrix has one row and zero columns, and the trace matrix has zero rows and one column.
  Test TauCeti.Borel.embeddingMatrices_switch_pair (characterisation)  [Part 1]: Switching the selected Q(i) embedding at j=2 negates its coordinate maps, preserving the coordinate-free square.
-/
