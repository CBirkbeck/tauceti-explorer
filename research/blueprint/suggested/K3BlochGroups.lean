/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/K3BlochGroups.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation; packet implementationStatus remains
unchecked. Proposed proofs and constructions use `sorry`.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The primary namespaces are TauCeti.K3, TauCeti.BlochGroup and TauCeti.Suslin.
BlochConventions.Imported aliases their actual inherited field objects and
maps; the reduced symbols map to the same P(F), not a second Bloch group.
CGZPublished uses the negative-unit tensor target. The inherited cgzBloch
uses the exterior target and image-of-raw-cycles convention; these are distinct.

Supplier-owned objects absent at the pins are parameters: Quillen K-groups,
products, plus/classifying spaces, stable Steinberg and elementary groups,
Milnor K-groups, motivic/étale comparisons, arithmetic K-groups and regulators.
Their intended supplier instantiation is fixed by the reader and packets.
Generic transport interfaces express conditional algebra, not a theorem that
arbitrary groups compute K-theory. Missing homotopy, Hopf/sphere-unit, finite
refined-configuration, smooth-curve or regulator comparison APIs are explicitly
identified in comments, never invented as Prop-valued stand-ins.

The primary field forms precede the six continuation interfaces, since V.3
uses V.4's foundational cross-ratio. Sections keep supplier variables local.
Unit-test names are those in the packets, in docstrings or adjacent comments.
-/

import Mathlib.Algebra.Category.Grp.Injective
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Basic
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.Algebra.Exact.Basic
import Mathlib.Algebra.Field.Subfield.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.FreeAbelianGroup.Finsupp
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Algebra.Homology.QuasiIso
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.Algebra.Homology.SpectralSequence.Basic
import Mathlib.Algebra.Module.LinearMap.Defs
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.Morphisms.QuasiCompact
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicTopology.FundamentalGroupoid.SimplyConnected
import Mathlib.AlgebraicTopology.SingularHomology.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.CategoryTheory.Monoidal.Tor
import Mathlib.Data.Fin.Embedding
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.GroupTheory.GroupAction.Embedding
import Mathlib.GroupTheory.GroupAction.MultipleTransitivity
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.GroupTheory.Torsion
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.LinearIndependent.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Projectivization.Action
import Mathlib.LinearAlgebra.Projectivization.Independence
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.Logic.Equiv.Fin.Rotate
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.RepresentationTheory.Homological.FiniteCyclic
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic
import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality
import Mathlib.RepresentationTheory.Homological.GroupHomology.Shapiro
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.Module
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.Topology.Compactification.OnePoint.Basic
import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
import Mathlib.Topology.Homotopy.Basic
import Mathlib.Topology.Homotopy.Contractible
import Mathlib.Topology.Homotopy.Equiv
import Mathlib.Topology.Homotopy.HSpaces
import Mathlib.Topology.Homotopy.HomotopyGroup
import Mathlib.Topology.Homotopy.Lifting
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Topology.Instances.Real.Lemmas

/-! ## Primary -/

section Primary

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct Topology LinearAlgebra.Projectivization

instance instFactPrimeFive : Fact (Nat.Prime 5) := ⟨by decide⟩
instance instFactPrimeSeven : Fact (Nat.Prime 7) := ⟨by decide⟩
instance instFactPrimeEleven : Fact (Nat.Prime 11) := ⟨by decide⟩

/-! ## Objects imported from other roadmaps -/

variable
  -- GeneralAlgebraicKTheory K.2
  (K : ℕ → Type → Type) [∀ n A, AddCommGroup (K n A)]
  (Kmap : ∀ (n : ℕ) {A B : Type} [Ring A] [Ring B], (A →+* B) → K n A →+ K n B)
  (Kmul : ∀ {A : Type} [CommRing A] (m n : ℕ), K m A →+ K n A →+ K (m + n) A)
  (unitClass : ∀ {F : Type} [Field F], Additive Fˣ →+ K 1 F)
  (negOneMul : ∀ (A : Type) [Ring A], K 2 A →+ K 3 A)
  (BGLplus : ∀ (A : Type) [Ring A], TopCat)
  (BGLplusPt : ∀ (A : Type) [Ring A], BGLplus A)
  (BGLplusMap : ∀ {A B : Type} [Ring A] [Ring B], (A →+* B) → (BGLplus A ⟶ BGLplus B))
  (BEplus : ∀ (A : Type) [Ring A], TopCat)
  (BEplusPt : ∀ (A : Type) [Ring A], BEplus A)
  (GLinf : ∀ (A : Type) [Ring A], Type) [∀ (A : Type) [Ring A], Group (GLinf A)]
  (glToInf : ∀ (n : ℕ) (A : Type) [CommRing A], GL (Fin n) A →* GLinf A)
  -- K2SymbolsBrauer T.1
  (St : Type → Type) [∀ A, Group (St A)]
  (Stmap : ∀ {A B : Type} [Ring A] [Ring B], (A →+* B) → St A →* St B)
  (stX : ∀ {A : Type} [Ring A], ℕ → ℕ → A → St A)
  (Stn : ℕ → Type → Type) [∀ n A, Group (Stn n A)]
  (stnToSt : ∀ (n : ℕ) (A : Type) [Ring A], Stn n A →* St A)
  (stnMap : ∀ {n m : ℕ} (_ : n ≤ m) (A : Type) [Ring A], Stn n A →* Stn m A)
  (El : Type → Type) [∀ A, Group (El A)]
  (stToEl : ∀ (A : Type) [Ring A], St A →* El A)
  (stToGL : ∀ (A : Type) [Ring A], St A →* GLinf A)
  -- StableHomotopyKTheory H.3
  (BG : ∀ (G : Type) [Group G], TopCat)
  (BGmap : ∀ {G H : Type} [Group G] [Group H], (G →* H) → (BG G ⟶ BG H))
  -- K2SymbolsBrauer T.2
  (MilnorK : ℕ → Type → Type) [∀ n F, AddCommGroup (MilnorK n F)]
  (MilnorKmap : ∀ (n : ℕ) {F L : Type} [Field F] [Field L], (F →+* L) → MilnorK n F →+ MilnorK n L)
  (milnorSymbol2 : ∀ {F : Type} [Field F], Fˣ → Fˣ → MilnorK 2 F)
  (milnorSymbol3 : ∀ {F : Type} [Field F], Fˣ → Fˣ → Fˣ → MilnorK 3 F)
  (milnorToQuillen : ∀ (n : ℕ) (F : Type) [Field F], MilnorK n F →+ K n F)
  (steinbergSymbol : ∀ {F : Type} [Field F], Additive Fˣ →+ Additive Fˣ →+ K 2 F)
  -- MotivicEtaleKTheory M.6: motivic cohomology `H^i(F, ℤ(j))` of a field
  (motH : ℕ → ℕ → ∀ (F : Type) [Field F], Type) [∀ i j (F : Type) [Field F], AddCommGroup (motH i j F)]
  -- KTheoryFiniteLocalFields L.1: the transfer on K₃ for an extension of fields
  (transfer3 : ∀ {F L : Type} [Field F] [Field L] [Algebra F L], K 3 L →+ K 3 F)
  -- Polylogarithms P.1: the Bloch-Wigner function
  (blochWignerD : ℂ → ℝ)
  -- ArithmeticKTheory N.5: the second Adams-Bott invariant `w₂(F)`
  (adamsBott2 : ∀ (F : Type) [Field F] [NumberField F], ℕ)

/-! ## V.1 A concrete homological model -/

namespace TauCeti.K3

/-- `H_n(G, ℤ)` with trivial coefficients: notation for the pinned Mathlib object. -/
abbrev intHomology (G : Type) [Group G] (n : ℕ) : ModuleCat ℤ :=
  groupHomology (Rep.trivial ℤ G ℤ) n

/-- The map `H_n(G, ℤ) → H_n(H, ℤ)` of a homomorphism: notation for `groupHomology.map`. -/
abbrev intHomologyMap {G H : Type} [Group G] [Group H] (f : G →* H) (n : ℕ) :
    intHomology G n →+ intHomology H n :=
  (groupHomology.map (A := Rep.trivial ℤ G ℤ) (B := Rep.trivial ℤ H ℤ) f (𝟙 _) n).hom.toAddMonoidHom

/-- Singular homology `H_n(X; ℤ)`: notation for Mathlib's singular homology functor. -/
abbrev singularH (n : ℕ) (X : TopCat) : ModuleCat ℤ :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat ℤ) n).obj (ModuleCat.of ℤ ℤ)).obj X

-- Moved to K2SymbolsBrauer T.1:classical (RT-AREA-ktheory-1/29), which owns the
-- Recognition Theorem; V.1 imports them and does not restate them:
--   V.1/uce-superperfect → K2SymbolsBrauer:T.1:classical/uce-source-superperfect
--     (`IsUniversalCentralExtension.isSuperperfect` in K2SymbolsBrauer--T.1.lean);
--   V.1/central-extension-comp → K2SymbolsBrauer:T.1:classical/central-extension-comp
--     (`isCentral_comp_of_isPerfect`);
--   V.1/split-extensions-kill-h2 → K2SymbolsBrauer:T.1:classical/split-extensions-kill-h2
--     (`schurMultiplier_eq_zero_of_split`).

/-- V.1/steinberg-superperfect: the corollary of K2SymbolsBrauer T.1's `St(A) → E(A)` universal
central extension and its theorem that the source of a universal central extension is
superperfect. -/
theorem steinberg_superperfect (A : Type) [Ring A] :
    Subsingleton (intHomology (St A) 1) ∧ Subsingleton (intHomology (St A) 2) := by sorry

-- V.1/uce-plus-fibration: not stated; needs the plus construction of an arbitrary perfect
-- group (StableHomotopyKTheory H.3), homotopy fibrations and maps of homotopy groups
-- (Mathlib has neither homotopy fibres nor `HomotopyGroup.map`).

/-! ### V.1/bst-plus -/

/-- V.1/bst-plus: `BSt(A)⁺`, the plus construction of `B St(A)` relative to `St(A)`. -/
def bStPlus (A : Type) [Ring A] : TopCat := sorry

/-- The base point of `BSt(A)⁺`. -/
def bStPlus.basepoint (A : Type) [Ring A] : bStPlus A := sorry

/-- The canonical map `ι : B St(A) → BSt(A)⁺`. -/
def bStPlus.ι (A : Type) [Ring A] : BG (St A) ⟶ bStPlus A := sorry

theorem bStPlus.ι_homology (A : Type) [Ring A] (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat ℤ) n).obj
      (ModuleCat.of ℤ ℤ)).map (bStPlus.ι St BG A)) := by sorry

/-- The map `q : BSt(A)⁺ → BGL(A)⁺`. -/
def bStPlus.toBGLPlus (A : Type) [Ring A] : bStPlus A ⟶ BGLplus A := sorry

/-- The map of a ring homomorphism. -/
def bStPlus_map {A B : Type} [Ring A] [Ring B] (f : A →+* B) : bStPlus A ⟶ bStPlus B := sorry

theorem bStPlus_map_compat {A B : Type} [Ring A] [Ring B] (f : A →+* B) :
    ContinuousMap.Homotopic (bStPlus.ι St BG A ≫ bStPlus_map f).hom
        (BGmap (Stmap f) ≫ bStPlus.ι St BG B).hom ∧
      ContinuousMap.Homotopic (bStPlus_map f ≫ bStPlus.toBGLPlus BGLplus B).hom
        (bStPlus.toBGLPlus BGLplus A ≫ BGLplusMap f).hom := by sorry

theorem bStPlus_map_id (A : Type) [Ring A] :
    ContinuousMap.Homotopic (bStPlus_map (RingHom.id A)).hom (ContinuousMap.id _) := by sorry

theorem bStPlus_map_comp {A B C : Type} [Ring A] [Ring B] [Ring C] (f : A →+* B) (g : B →+* C) :
    ContinuousMap.Homotopic (bStPlus_map (g.comp f)).hom
      ((bStPlus_map g).hom.comp (bStPlus_map f).hom) := by sorry

/-- V.1/bst-plus-two-connected: `BSt(A)⁺` is 2-connected. -/
theorem bStPlus_twoConnected (A : Type) [Ring A] :
    PathConnectedSpace (bStPlus A) ∧ Subsingleton (π_ 1 (bStPlus A) (bStPlus.basepoint A)) ∧
      Subsingleton (π_ 2 (bStPlus A) (bStPlus.basepoint A)) := by sorry

/-- `π_n(BSt(A)⁺) ≅ K_n(A)` for `n ≥ 3`, written with `n + 3`. That the isomorphism is
induced by `q` is not stated: Mathlib has no map of homotopy groups. -/
def bStPlus_pi_eq_K (A : Type) [Ring A] (n : ℕ) :
    π_ (n + 3) (bStPlus A) (bStPlus.basepoint A) ≃* Multiplicative (K (n + 3) A) := sorry

/-- The two maps `B K₂(A) → BSt(A)⁺ → BE(A)⁺` of the fibration sequence. That they form a
homotopy fibration is not stated: Mathlib has no homotopy fibres. -/
def bStPlus_fibration (A : Type) [Ring A] :
    (BG (Multiplicative (K 2 A)) ⟶ bStPlus A) × (bStPlus A ⟶ BEplus A) := sorry

/-- V.1/bst-plus-connected-cover: `π_n(BSt(A)⁺) ≅ π_n(BGL(A)⁺)` for `n ≥ 3`, as abstract
groups (that `q` induces it needs maps of homotopy groups). -/
theorem bStPlus_connectedCover (A : Type) [Ring A] (n : ℕ) :
    Nonempty (π_ (n + 3) (bStPlus A) (bStPlus.basepoint A) ≃*
      π_ (n + 3) (BGLplus A) (BGLplusPt A)) := by sorry

/-- Test `bStPlus_zero_ring`. -/
example : ContractibleSpace (bStPlus Unit) := by sorry

/-- Test `bStPlus_pi_one_Z`. -/
example : Subsingleton (π_ 1 (bStPlus ℤ) (bStPlus.basepoint ℤ)) ∧ Nontrivial (St ℤ) := by sorry

/-- Test `bStPlus_homology_compat`. -/
example (A : Type) [Ring A] : Nonempty (singularH 3 (bStPlus A) ≅ intHomology (St A) 3) := by
  sorry

/-- Test `bStPlus_ne_BEPlus`. -/
example : Subsingleton (π_ 2 (bStPlus ℤ) (bStPlus.basepoint ℤ)) ∧
    Nonempty (π_ 2 (BEplus ℤ) (BEplusPt ℤ) ≃* Multiplicative (ZMod 2)) := by sorry

/-- Test `bStPlus_ne_BGLPlus`. -/
example : Nontrivial (π_ 1 (BGLplus ℚ) (BGLplusPt ℚ)) ∧
    Subsingleton (π_ 1 (bStPlus ℚ) (bStPlus.basepoint ℚ)) := by sorry

/-! ### V.1/k3-h3-steinberg, V.1/bar-cycle-model, V.1/k3-naturality -/

/-- V.1/k3-h3-steinberg: `K₃(A) ≅ H₃(St(A), ℤ)`. -/
def k3EquivH3Steinberg (A : Type) [Ring A] : K 3 A ≃+ intHomology (St A) 3 := sorry

/-- The bar 3-cycles of `St(A)` with trivial integer coefficients. -/
abbrev barCycle3 (A : Type) [Ring A] : ModuleCat ℤ :=
  groupHomology.cycles (Rep.trivial ℤ (St A) ℤ) 3

/-- A bar 3-cycle from `c : St(A)³ →₀ ℤ` with `d₃₂ c = 0` (via `chainsIso₃`, `cyclesMk`). -/
def barCycle3.mk (A : Type) [Ring A] (c : St A × St A × St A →₀ ℤ)
    (hc : (groupHomology.d₃₂ (Rep.trivial ℤ (St A) ℤ)).hom c = 0) : barCycle3 St A := sorry

/-- The bar 3-boundaries. -/
def barBoundary3 (A : Type) [Ring A] : Submodule ℤ (barCycle3 St A) :=
  LinearMap.range (groupHomology.toCycles (Rep.trivial ℤ (St A) ℤ) 4 3).hom

/-- The evaluation of a bar 3-cycle in `K₃(A)`. -/
def evalBarCycle (A : Type) [Ring A] (z : barCycle3 St A) : K 3 A :=
  (k3EquivH3Steinberg K St A).symm ((groupHomology.π (Rep.trivial ℤ (St A) ℤ) 3).hom z)

/-- Evaluation as an additive homomorphism. -/
def evalBarCycleHom (A : Type) [Ring A] : barCycle3 St A →+ K 3 A :=
  (k3EquivH3Steinberg K St A).symm.toAddMonoidHom.comp
    (groupHomology.π (Rep.trivial ℤ (St A) ℤ) 3).hom.toAddMonoidHom

theorem evalBarCycle_eq (A : Type) [Ring A] (z : barCycle3 St A) :
    evalBarCycle K St A z =
      (k3EquivH3Steinberg K St A).symm ((groupHomology.π (Rep.trivial ℤ (St A) ℤ) 3).hom z) := rfl

@[simp] theorem evalBarCycle_boundary (A : Type) [Ring A] (z : barCycle3 St A)
    (hz : z ∈ barBoundary3 St A) : evalBarCycle K St A z = 0 := by sorry

theorem evalBarCycle_surjective (A : Type) [Ring A] :
    Function.Surjective (evalBarCycle K St A) := by sorry

theorem evalBarCycle_map {A B : Type} [Ring A] [Ring B] (f : A →+* B) (z : barCycle3 St A) :
    evalBarCycle K St B
        ((groupHomology.cyclesMap (A := Rep.trivial ℤ (St A) ℤ) (B := Rep.trivial ℤ (St B) ℤ)
          (Stmap f) (𝟙 _) 3).hom z) =
      Kmap 3 f (evalBarCycle K St A z) := by sorry

theorem evalBarCycle_eq_iff (A : Type) [Ring A] (z z' : barCycle3 St A) :
    evalBarCycle K St A z = evalBarCycle K St A z' ↔ z - z' ∈ barBoundary3 St A := by sorry

/-- Test `evalBarCycle_boundary_four_chain`. -/
example (A : Type) [Ring A]
    (c : (groupHomology.inhomogeneousChains (Rep.trivial ℤ (St A) ℤ)).X 4) :
    evalBarCycle K St A ((groupHomology.toCycles (Rep.trivial ℤ (St A) ℤ) 4 3).hom c) = 0 := by
  sorry

/-- Test `evalBarCycle_one_one_one`. -/
example (A : Type) [Ring A] (h : (groupHomology.d₃₂ (Rep.trivial ℤ (St A) ℤ)).hom
      (Finsupp.single ((1 : St A), (1 : St A), (1 : St A)) (1 : ℤ)) = 0) :
    barCycle3.mk St A (Finsupp.single (1, 1, 1) 1) h ∈ barBoundary3 St A ∧
      evalBarCycle K St A (barCycle3.mk St A (Finsupp.single (1, 1, 1) 1) h) = 0 := by sorry

/-- Test `single_g11_not_cycle`, with `g = x₁₂(1)` in `St(ℤ)`. -/
example : (groupHomology.d₃₂ (Rep.trivial ℤ (St ℤ) ℤ)).hom
      (Finsupp.single (stX 1 2 (1 : ℤ), (1 : St ℤ), (1 : St ℤ)) (1 : ℤ)) =
        Finsupp.single ((1 : St ℤ), (1 : St ℤ)) 1 - Finsupp.single (stX 1 2 (1 : ℤ), (1 : St ℤ)) 1 ∧
    (groupHomology.d₃₂ (Rep.trivial ℤ (St ℤ) ℤ)).hom
      (Finsupp.single (stX 1 2 (1 : ℤ), (1 : St ℤ), (1 : St ℤ)) (1 : ℤ)) ≠ 0 := by sorry

/-- Test `evalBarCycle_naturality_square`: the inclusion `ℤ → ℚ`. -/
example (z : barCycle3 St ℤ) :
    evalBarCycle K St ℚ
        ((groupHomology.cyclesMap (A := Rep.trivial ℤ (St ℤ) ℤ) (B := Rep.trivial ℤ (St ℚ) ℤ)
          (Stmap (Int.castRingHom ℚ)) (𝟙 _) 3).hom z) =
      Kmap 3 (Int.castRingHom ℚ) (evalBarCycle K St ℤ z) := by sorry

/-- Test `evalBarCycle_not_injective`. -/
example (A : Type) [Ring A] (h : (groupHomology.d₃₂ (Rep.trivial ℤ (St A) ℤ)).hom
      (Finsupp.single ((1 : St A), (1 : St A), (1 : St A)) (1 : ℤ)) = 0) :
    barCycle3.mk St A (Finsupp.single (1, 1, 1) 1) h ≠ 0 ∧
      evalBarCycle K St A (barCycle3.mk St A (Finsupp.single (1, 1, 1) 1) h) =
        evalBarCycle K St A 0 := by sorry

/-- V.1/k3-naturality (a): naturality in the ring (the bar-cycle half is `evalBarCycle_map`). -/
theorem k3EquivH3Steinberg_naturality {A B : Type} [Ring A] [Ring B] (f : A →+* B) (x : K 3 A) :
    k3EquivH3Steinberg K St B (Kmap 3 f x) =
      intHomologyMap (Stmap f) 3 (k3EquivH3Steinberg K St A x) := by sorry

/-- V.1/k3-naturality (b): compatibility with stabilisation, and every class comes from a
finite-rank Steinberg group. -/
theorem k3EquivH3Steinberg_stabilisation (A : Type) [Ring A] :
    (∀ (n : ℕ) (y : intHomology (Stn n A) 3),
      intHomologyMap (stnToSt (n + 1) A) 3 (intHomologyMap (stnMap (Nat.le_succ n) A) 3 y) =
        intHomologyMap (stnToSt n A) 3 y) ∧
      ∀ x : K 3 A, ∃ (n : ℕ) (y : intHomology (Stn n A) 3),
        (k3EquivH3Steinberg K St A).symm (intHomologyMap (stnToSt n A) 3 y) = x := by sorry

/-- V.1/steinberg-homology-colimit: `H_k(St(A), ℤ)` is the colimit of the `H_k(St_n(A), ℤ)`. -/
theorem steinberg_homology_colimit (A : Type) [Ring A] (k : ℕ) :
    (∀ x : intHomology (St A) k, ∃ (n : ℕ) (y : intHomology (Stn n A) k),
      intHomologyMap (stnToSt n A) k y = x) ∧
      ∀ (n : ℕ) (y : intHomology (Stn n A) k), intHomologyMap (stnToSt n A) k y = 0 →
        ∃ (m : ℕ) (h : n ≤ m), intHomologyMap (stnMap h A) k y = 0 := by sorry

/-- V.1/k2-to-k3-h3-e: `K₂(R) → K₃(R) → H₃(E(R), ℤ) → 0` is exact. -/
theorem k2_mul_neg_one_exact (R : Type) [Ring R] :
    Function.Exact (negOneMul R)
        ((intHomologyMap (stToEl R) 3).comp (k3EquivH3Steinberg K St R).toAddMonoidHom) ∧
      Function.Surjective
        ((intHomologyMap (stToEl R) 3).comp (k3EquivH3Steinberg K St R).toAddMonoidHom) := by
  sorry

-- V.1/eta-hurewicz-sequence: not stated; needs the composition product with the Hopf map
-- `η` and the Hurewicz map of an H-space (neither is in Mathlib).

/-! ## V.2 Decomposable and indecomposable parts -/

/-- V.2/milnor-to-quillen-degree-three. -/
def milnorToQuillen3 (F : Type) [Field F] : MilnorK 3 F →+ K 3 F := milnorToQuillen 3 F

local notation "m3" => milnorToQuillen3 K MilnorK milnorToQuillen

theorem milnorToQuillen3_symbol {F : Type} [Field F] (a b c : Fˣ) :
    m3 F (milnorSymbol3 a b c) =
      Kmul 2 1 (Kmul 1 1 (unitClass (Additive.ofMul a)) (unitClass (Additive.ofMul b)))
        (unitClass (Additive.ofMul c)) := by sorry

theorem milnorToQuillen3_symbol_eq_mul {F : Type} [Field F] (a b c : Fˣ) :
    m3 F (milnorSymbol3 a b c) =
      Kmul 1 2 (unitClass (Additive.ofMul a)) (milnorToQuillen 2 F (milnorSymbol2 b c)) := by sorry

theorem milnorToQuillen3_map {F L : Type} [Field F] [Field L] (f : F →+* L) (x : MilnorK 3 F) :
    Kmap 3 f (m3 F x) = m3 L (MilnorKmap 3 f x) := by sorry

theorem milnorToQuillen3_map_id {F : Type} [Field F] (x : MilnorK 3 F) :
    Kmap 3 (RingHom.id F) (m3 F x) = m3 F (MilnorKmap 3 (RingHom.id F) x) := by sorry

theorem milnorToQuillen3_map_comp {F L E : Type} [Field F] [Field L] [Field E] (f : F →+* L)
    (g : L →+* E) (x : MilnorK 3 F) :
    Kmap 3 g (Kmap 3 f (m3 F x)) = m3 E (MilnorKmap 3 g (MilnorKmap 3 f x)) := by sorry

theorem milnorToQuillen3_graded (F : Type) [Field F] : m3 F = milnorToQuillen 3 F := rfl

/-- Test `finite_field_source_zero`. -/
example (F : Type) [Field F] [Finite F] : m3 F = 0 := by sorry

/-- Test `symbol_of_minus_ones`. -/
example : addOrderOf (m3 ℚ (milnorSymbol3 (-1) (-1) (-1))) = 2 := by sorry

/-- Test `natural_in_F`. -/
example (z : MilnorK 3 ℚ) :
    Kmap 3 (algebraMap ℚ ℝ) (m3 ℚ z) = m3 ℝ (MilnorKmap 3 (algebraMap ℚ ℝ) z) := by sorry

/-- Test `not_surjective`. -/
example (F : Type) [Field F] [NumberField F] (h : 0 < NumberField.InfinitePlace.nrComplexPlaces F) :
    ¬ Function.Surjective (m3 F) := by sorry

/-- Test `symbol_eq_triple_product`. -/
example (F : Type) [Field F] (a b c : Fˣ) :
    m3 F (milnorSymbol3 a b c) =
      Kmul 2 1 (Kmul 1 1 (unitClass (Additive.ofMul a)) (unitClass (Additive.ofMul b)))
        (unitClass (Additive.ofMul c)) := by sorry

/-! ### V.2/k3-indecomposable -/

/-- V.2/k3-indecomposable: `K₃^ind(F)`, the cokernel of the degree-three map. -/
def K3ind (F : Type) [Field F] : Type := K 3 F ⧸ (m3 F).range

instance (F : Type) [Field F] : AddCommGroup (K3ind K MilnorK milnorToQuillen F) :=
  inferInstanceAs (AddCommGroup (K 3 F ⧸ (m3 F).range))

local notation "K3ind'" => K3ind K MilnorK milnorToQuillen

/-- The quotient map. -/
def K3ind.mk (F : Type) [Field F] : K 3 F →+ K3ind' F := QuotientAddGroup.mk' _

local notation "K3mk" => K3ind.mk K MilnorK milnorToQuillen

theorem K3ind.mk_surjective (F : Type) [Field F] : Function.Surjective (K3mk F) := by sorry

theorem K3ind.mk_eq_zero_iff (F : Type) [Field F] (x : K 3 F) :
    K3mk F x = 0 ↔ x ∈ (m3 F).range := by sorry

@[simp] theorem K3ind.mk_milnorToQuillen3 (F : Type) [Field F] (x : MilnorK 3 F) :
    K3mk F (m3 F x) = 0 := by sorry

/-- The universal property. -/
def K3ind.lift (F : Type) [Field F] {M : Type} [AddCommGroup M] (f : K 3 F →+ M)
    (hf : f.comp (m3 F) = 0) : K3ind' F →+ M :=
  QuotientAddGroup.lift _ f (by sorry)

theorem K3ind.lift_mk (F : Type) [Field F] {M : Type} [AddCommGroup M] (f : K 3 F →+ M)
    (hf : f.comp (m3 F) = 0) (x : K 3 F) :
    K3ind.lift K MilnorK milnorToQuillen F f hf (K3mk F x) = f x := by sorry

theorem K3ind.ext {F : Type} [Field F] {M : Type} [AddCommGroup M] {φ ψ : K3ind' F →+ M}
    (h : φ.comp (K3mk F) = ψ.comp (K3mk F)) : φ = ψ := by sorry

/-- The map of indecomposable quotients induced by a field homomorphism. -/
def K3ind.map {F L : Type} [Field F] [Field L] (f : F →+* L) : K3ind' F →+ K3ind' L :=
  QuotientAddGroup.map _ _ (Kmap 3 f) (by sorry)

local notation "K3map" => K3ind.map K Kmap MilnorK milnorToQuillen

@[simp] theorem K3ind.map_mk {F L : Type} [Field F] [Field L] (f : F →+* L) (x : K 3 F) :
    K3map f (K3mk F x) = K3mk L (Kmap 3 f x) := by sorry

theorem K3ind.map_id (F : Type) [Field F] : K3map (RingHom.id F) = AddMonoidHom.id _ := by sorry

theorem K3ind.map_comp {F L E : Type} [Field F] [Field L] [Field E] (f : F →+* L) (g : L →+* E) :
    K3map (g.comp f) = (K3map g).comp (K3map f) := by sorry

/-- `K₃^ind(F)` is Mathlib's quotient `K₃(F) ⧸ range milnorToQuillen3`. -/
def K3ind.equivQuotient (F : Type) [Field F] : K3ind' F ≃+ (K 3 F ⧸ (m3 F).range) :=
  AddEquiv.refl _

/-- The decomposable subgroup, defined as the image. -/
def K3ind.decomposable (F : Type) [Field F] : AddSubgroup (K 3 F) := (m3 F).range

/-- Test `finite_field`. -/
example (F : Type) [Field F] [Finite F] : Function.Bijective (K3mk F) := by sorry

/-- Test `rational_numbers`. -/
example : Nonempty (K3ind' ℚ ≃+ ZMod 24) ∧ Nonempty (K 3 ℚ ≃+ ZMod 48) := by sorry

/-- Test `rank_r2`. -/
example (F : Type) [Field F] [NumberField F] :
    Module.finrank ℤ (K3ind' F) = NumberField.InfinitePlace.nrComplexPlaces F := by sorry

/-- Test `not_torsion_quotient`. -/
example : Subsingleton (K 3 ℚ ⧸ AddCommGroup.torsion (K 3 ℚ)) ∧
    Nonempty (K3ind' ℚ ≃+ ZMod 24) := by sorry

/-- V.2/decomposable-exactness. -/
theorem K3ind.exact_mk (F : Type) [Field F] :
    Function.Exact (m3 F) (K3mk F) ∧ Function.Surjective (K3mk F) := by sorry

/-- V.2/milnor-k3-injective. -/
theorem milnorToQuillen3_injective (F : Type) [Field F] : Function.Injective (m3 F) := by sorry

/-- V.2/milnor-k3-kernel-exponent-two. -/
theorem milnorToQuillen3_ker_two_nsmul (F : Type) [Field F] (x : MilnorK 3 F) (hx : m3 F x = 0) :
    2 • x = 0 := by sorry

/-- V.2/milnor-k3-number-field: the signature map is an isomorphism onto `(ℤ/2)^{r₁}`. -/
theorem milnorK3_numberField (F : Type) [Field F] [NumberField F] :
    ∃ e : MilnorK 3 F ≃+ ({v : NumberField.InfinitePlace F // v.IsReal} → ZMod 2),
      ∀ (a b c : Fˣ) (v : {v : NumberField.InfinitePlace F // v.IsReal}),
        e (milnorSymbol3 a b c) v =
          if NumberField.InfinitePlace.embedding_of_isReal v.2 (a : F) < 0 ∧
              NumberField.InfinitePlace.embedding_of_isReal v.2 (b : F) < 0 ∧
              NumberField.InfinitePlace.embedding_of_isReal v.2 (c : F) < 0 then 1 else 0 := by
  sorry

/-- V.2/k3-rank-borel. -/
theorem k3_rank_eq_nrComplexPlaces (F : Type) [Field F] [NumberField F] :
    AddGroup.FG (K 3 F) ∧
      Module.finrank ℤ (K 3 F) = NumberField.InfinitePlace.nrComplexPlaces F ∧
      Module.finrank ℤ (K3ind' F) = NumberField.InfinitePlace.nrComplexPlaces F := by sorry

/-- V.2/rationalisation-loss. -/
theorem rationalisation_loss (F : Type) [Field F] [NumberField F] :
    Function.Bijective (LinearMap.lTensor ℚ (K3mk F).toIntLinearMap) ∧
      Module.finrank ℚ (ℚ ⊗[ℤ] K 3 F) = NumberField.InfinitePlace.nrComplexPlaces F ∧
      Subsingleton (ℚ ⊗[ℤ] MilnorK 3 F) := by sorry

/-- V.2/k3-to-h3-sl-field: for a field (stable `E(F) = SL(F)`) the Hurewicz map onto
`H₃(E(F), ℤ)` is onto with kernel generated by the images of the symbols `{-1, a, b}`. -/
theorem k3_to_h3_El_field (F : Type) [Field F] :
    Function.Surjective
        ((intHomologyMap (stToEl F) 3).comp (k3EquivH3Steinberg K St F).toAddMonoidHom) ∧
      ((intHomologyMap (stToEl F) 3).comp (k3EquivH3Steinberg K St F).toAddMonoidHom).ker =
        AddSubgroup.closure (Set.range fun p : Fˣ × Fˣ => m3 F (milnorSymbol3 (-1) p.1 p.2)) := by
  sorry

/-- V.2/motivic-low-degree-sequence: `K₄ → H⁰(ℤ(2)) → K₃ᴹ → K₃ → H¹(ℤ(2)) → 0`, the middle
map `milnorToQuillen3` (under Nesterenko-Suslin-Totaro). -/
theorem motivic_low_degree_sequence (F : Type) [Field F] :
    ∃ (α : K 4 F →+ motH 0 2 F) (β : motH 0 2 F →+ MilnorK 3 F) (γ : K 3 F →+ motH 1 2 F),
      Function.Exact α β ∧ Function.Exact β (m3 F) ∧ Function.Exact (m3 F) γ ∧
        Function.Surjective γ := by sorry

end TauCeti.K3

/-! ## V.3 Bloch-group conventions -/

namespace TauCeti.BlochGroup

section Antisymmetric

variable (R M : Type) [CommRing R] [AddCommGroup M] [Module R M]

/-- The submodule `range (id + comm)` of `M ⊗ M`. -/
abbrev symmetrisedSubmodule : Submodule R (M ⊗[R] M) :=
  LinearMap.range (LinearMap.id + (TensorProduct.comm R M M).toLinearMap)

/-- V.3/antisymmetric-tensor-quotient: `antisymSquare R M = (M ⊗[R] M) ⧸ range (id + comm)`,
the cokernel of `1 + τ`. -/
def antisymSquare : Type := (M ⊗[R] M) ⧸ symmetrisedSubmodule R M

instance : AddCommGroup (antisymSquare R M) :=
  inferInstanceAs (AddCommGroup ((M ⊗[R] M) ⧸ symmetrisedSubmodule R M))

instance : Module R (antisymSquare R M) :=
  inferInstanceAs (Module R ((M ⊗[R] M) ⧸ symmetrisedSubmodule R M))

/-- The quotient map `M ⊗ M → antisymSquare R M`. -/
def antisymSquare.mkQ : M ⊗[R] M →ₗ[R] antisymSquare R M := (symmetrisedSubmodule R M).mkQ

/-- The bilinear constructor `a ∧ b`. -/
def antisymSquare.mk : M →ₗ[R] M →ₗ[R] antisymSquare R M :=
  (TensorProduct.mk R M M).compr₂ (antisymSquare.mkQ R M)

theorem antisymSquare.ker_mkQ :
    LinearMap.ker (antisymSquare.mkQ R M) = symmetrisedSubmodule R M ∧
      symmetrisedSubmodule R M = Submodule.span R {x | ∃ a b : M, x = a ⊗ₜ b + b ⊗ₜ a} := by
  sorry

theorem antisymSquare.antisymm (a b : M) :
    antisymSquare.mk R M a b + antisymSquare.mk R M b a = 0 := by sorry

theorem antisymSquare.wedge_self_add (a b : M) :
    antisymSquare.mk R M (a + b) (a + b) = antisymSquare.mk R M a a + antisymSquare.mk R M b b := by
  sorry

theorem antisymSquare.two_smul_wedge_self (a : M) : (2 : ℕ) • antisymSquare.mk R M a a = 0 := by
  sorry

/-- The additive map `a ↦ a ∧ a`. -/
def antisymSquare.wedgeSelf : M →+ antisymSquare R M :=
  AddMonoidHom.mk' (fun a => antisymSquare.mk R M a a) (by sorry)

theorem antisymSquare.wedgeSelf_two_nsmul (a : M) : antisymSquare.wedgeSelf R M ((2 : ℕ) • a) = 0 := by
  sorry

/-- The universal property. -/
def antisymSquare.lift {N : Type} [AddCommGroup N] [Module R N] (f : M →ₗ[R] M →ₗ[R] N)
    (hf : ∀ a b, f a b + f b a = 0) : antisymSquare R M →ₗ[R] N :=
  (symmetrisedSubmodule R M).liftQ (TensorProduct.lift f) (by sorry)

@[simp] theorem antisymSquare.lift_mk {N : Type} [AddCommGroup N] [Module R N]
    (f : M →ₗ[R] M →ₗ[R] N) (hf : ∀ a b, f a b + f b a = 0) (a b : M) :
    antisymSquare.lift R M f hf (antisymSquare.mk R M a b) = f a b := by sorry

theorem antisymSquare.hom_ext {N : Type} [AddCommGroup N] [Module R N]
    {φ ψ : antisymSquare R M →ₗ[R] N}
    (h : ∀ a b, φ (antisymSquare.mk R M a b) = ψ (antisymSquare.mk R M a b)) : φ = ψ := by sorry

/-- Functoriality. -/
def antisymSquare.map {N : Type} [AddCommGroup N] [Module R N] (g : M →ₗ[R] N) :
    antisymSquare R M →ₗ[R] antisymSquare R N :=
  antisymSquare.lift R M (((antisymSquare.mk R N).compl₂ g).comp g) (by sorry)

@[simp] theorem antisymSquare.map_mk {N : Type} [AddCommGroup N] [Module R N] (g : M →ₗ[R] N)
    (a b : M) : antisymSquare.map R M g (antisymSquare.mk R M a b) = antisymSquare.mk R N (g a) (g b) := by
  sorry

@[simp] theorem antisymSquare.map_id : antisymSquare.map R M LinearMap.id = LinearMap.id := by sorry

theorem antisymSquare.map_comp {N P : Type} [AddCommGroup N] [Module R N] [AddCommGroup P]
    [Module R P] (g : M →ₗ[R] N) (h : N →ₗ[R] P) :
    antisymSquare.map R M (h ∘ₗ g) = antisymSquare.map R N h ∘ₗ antisymSquare.map R M g := by sorry

/-- The canonical surjection onto Mathlib's exterior square. -/
def antisymSquare.toExterior : antisymSquare R M →ₗ[R] ⋀[R]^2 M :=
  antisymSquare.lift R M
    (LinearMap.mk₂ R (fun a b => exteriorPower.ιMulti R 2 ![a, b]) (by sorry) (by sorry) (by sorry)
      (by sorry))
    (by sorry)

@[simp] theorem antisymSquare.toExterior_mk (a b : M) :
    antisymSquare.toExterior R M (antisymSquare.mk R M a b) = exteriorPower.ιMulti R 2 ![a, b] := by
  sorry

theorem antisymSquare.toExterior_surjective : Function.Surjective (antisymSquare.toExterior R M) := by
  sorry

/-- When `2` is invertible, `a ∧ b ↦ ⅟2 • (a ⊗ b - b ⊗ a)` is an equivalence onto the
`-1`-eigenspace of the flip, which is the definition of `TauCeti.antisymmetricTensors R M`
(Tau Ceti f790474, TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:113; this Mathlib-only
file uses the defining Mathlib term). -/
def antisymSquare.equivAntisymmetricTensors [Invertible (2 : R)] :
    antisymSquare R M ≃ₗ[R] Module.End.eigenspace (TensorProduct.comm R M M).toLinearMap (-1) :=
  sorry

theorem antisymSquare.equivAntisymmetricTensors_mk [Invertible (2 : R)] (a b : M) :
    (antisymSquare.equivAntisymmetricTensors R M (antisymSquare.mk R M a b) : M ⊗[R] M) =
      (⅟2 : R) • (a ⊗ₜ b - b ⊗ₜ a) := by sorry

/-- The action of `Multiplicative (ZMod 2)` on `M ⊗ M` whose generator acts by `-comm`. -/
def flipRepresentation : Representation R (Multiplicative (ZMod 2)) (M ⊗[R] M) where
  toFun g := if Multiplicative.toAdd g = 0 then LinearMap.id else -(TensorProduct.comm R M M).toLinearMap
  map_one' := by sorry
  map_mul' := by sorry

/-- `antisymSquare R M` is the module of coinvariants of `flipRepresentation`. -/
def antisymSquare.equivCoinvariants :
    antisymSquare R M ≃ₗ[R] (flipRepresentation R M).Coinvariants := sorry

/-- The decomposition for a product. -/
def antisymSquare.prodEquiv (N : Type) [AddCommGroup N] [Module R N] :
    antisymSquare R (M × N) ≃ₗ[R] antisymSquare R M × antisymSquare R N × (M ⊗[R] N) := sorry

/-- `antisymSquare ℤ (ZMod n) ≃ ZMod (gcd 2 n)`; for `n = 0` this is `antisymSquare ℤ ℤ ≃ ZMod 2`. -/
def antisymSquare.zmodEquiv (n : ℕ) : antisymSquare ℤ (ZMod n) ≃+ ZMod (Nat.gcd 2 n) := sorry

/-- Test `square_class_nonzero`. -/
example : antisymSquare.mk ℤ (ZMod 2) 1 1 ≠ 0 := by sorry

/-- Test `antisymmetry`. -/
example (a b : M) : antisymSquare.mk R M a b = -antisymSquare.mk R M b a := by sorry

/-- Test `int_equiv`. -/
example : (∃ e : antisymSquare ℤ ℤ ≃+ ZMod 2, e (antisymSquare.mk ℤ ℤ 1 1) = 1) ∧
    Subsingleton (⋀[ℤ]^2 ℤ) ∧
    Module.End.eigenspace (TensorProduct.comm ℤ ℤ ℤ).toLinearMap (-1) = ⊥ := by sorry

/-- Test `zmod_three`. -/
example : Subsingleton (antisymSquare ℤ (ZMod 3)) := by sorry

/-- Test `agrees_with_eigenspace_when_two_invertible`. -/
example [Invertible (2 : R)] : Nonempty (antisymSquare R M ≃ₗ[R]
      Module.End.eigenspace (TensorProduct.comm R M M).toLinearMap (-1)) ∧
    IsEmpty (antisymSquare ℤ ℤ ≃ₗ[ℤ]
      Module.End.eigenspace (TensorProduct.comm ℤ ℤ ℤ).toLinearMap (-1)) := by sorry

/-- Test `not_exterior_square`. -/
example : ¬ Function.Injective (antisymSquare.toExterior ℤ (ZMod 2)) := by sorry

/-- V.3/antisym-exterior-comparison: `0 → A/2A → antisymSquare ℤ A → ⋀²A → 0`. -/
theorem antisymSquare.ker_toExterior (A : Type) [AddCommGroup A] :
    LinearMap.ker (antisymSquare.toExterior ℤ A) =
        Submodule.span ℤ (Set.range fun a : A => antisymSquare.mk ℤ A a a) ∧
      (antisymSquare.wedgeSelf ℤ A).ker = (nsmulAddMonoidHom (α := A) 2).range := by sorry

end Antisymmetric

section PreBloch

variable (F : Type) [Field F]

/-- `antisymSquare ℤ (Additive Fˣ)`, the target of the Bloch boundary. -/
abbrev unitsWedge : Type := antisymSquare ℤ (Additive Fˣ)

/-- `x ∧ y` for units. -/
abbrev uwedge (x y : Fˣ) : unitsWedge F :=
  antisymSquare.mk ℤ (Additive Fˣ) (Additive.ofMul x) (Additive.ofMul y)

open Classical in
/-- The symbol `[a]`; the junk value at `a = 0` is `0`. -/
def symb (a : F) : FreeAbelianGroup {a : F // a ≠ 0} :=
  if h : a = 0 then 0 else FreeAbelianGroup.of ⟨a, h⟩

/-- The admissible pairs: `x ≠ y`, both in `F - {0, 1}`. -/
structure Admissible where
  x : F
  y : F
  hx0 : x ≠ 0
  hx1 : x ≠ 1
  hy0 : y ≠ 0
  hy1 : y ≠ 1
  hxy : x ≠ y

variable {F} in
/-- If `(x, y)` is admissible so is `(1 - y, 1 - x)`. -/
def Admissible.oneSub (p : Admissible F) : Admissible F :=
  ⟨1 - p.y, 1 - p.x, by sorry, by sorry, by sorry, by sorry, by sorry⟩

variable {F} in
/-- If `(x, y)` is admissible so is `(x⁻¹, y⁻¹)`. -/
def Admissible.inv (p : Admissible F) : Admissible F :=
  ⟨p.x⁻¹, p.y⁻¹, inv_ne_zero p.hx0, by sorry, inv_ne_zero p.hy0, by sorry, by sorry⟩

variable {F} in
/-- Interchanging the entries. -/
def Admissible.swap (p : Admissible F) : Admissible F :=
  ⟨p.y, p.x, p.hy0, p.hy1, p.hx0, p.hx1, p.hxy.symm⟩

variable {F} in
/-- Transport along a field homomorphism. -/
def Admissible.map {L : Type} [Field L] (f : F →+* L) (p : Admissible F) : Admissible L :=
  ⟨f p.x, f p.y, (map_ne_zero f).2 p.hx0, by sorry, (map_ne_zero f).2 p.hy0, by sorry,
    fun h => p.hxy (f.injective h)⟩

/-- The five-term formula at any `x, y`. -/
def fiveTermFormula (x y : F) : FreeAbelianGroup {a : F // a ≠ 0} :=
  symb F x - symb F y + symb F (y / x) - symb F ((1 - x⁻¹) / (1 - y⁻¹)) + symb F ((1 - x) / (1 - y))

/-- V.3/five-term-relation: the five-term element of an admissible pair. -/
def fiveTerm (p : Admissible F) : FreeAbelianGroup {a : F // a ≠ 0} := fiveTermFormula F p.x p.y

/-- The five-term subgroup, generated by the five-term elements and `[1]`. -/
def fiveTermSubgroup : AddSubgroup (FreeAbelianGroup {a : F // a ≠ 0}) :=
  AddSubgroup.closure (Set.range (fiveTerm F) ∪ {symb F 1})

theorem fiveTerm_mem (z : FreeAbelianGroup {a : F // a ≠ 0}) :
    z ∈ fiveTermSubgroup F ↔ ∃ (l : List (ℤ × Admissible F)) (m : ℤ),
      z = (l.map fun q => q.1 • fiveTerm F q.2).sum + m • symb F 1 := by sorry

theorem fiveTerm_args_ne_zero (p : Admissible F) :
    p.x ≠ 0 ∧ p.y ≠ 0 ∧ p.y / p.x ≠ 0 ∧ (1 - p.x⁻¹) / (1 - p.y⁻¹) ≠ 0 ∧
      (1 - p.x) / (1 - p.y) ≠ 0 := by sorry

theorem fiveTerm_args_ne_one (p : Admissible F) :
    p.x ≠ 1 ∧ p.y ≠ 1 ∧ p.y / p.x ≠ 1 ∧ (1 - p.x⁻¹) / (1 - p.y⁻¹) ≠ 1 ∧
      (1 - p.x) / (1 - p.y) ≠ 1 := by sorry

theorem fiveTerm_oneSub (p : Admissible F) :
    fiveTerm F p.oneSub = symb F (1 - p.y) - symb F (1 - p.x) + symb F ((1 - p.x) / (1 - p.y)) -
      symb F ((1 - p.x⁻¹) / (1 - p.y⁻¹)) + symb F (p.y / p.x) := by sorry

theorem fiveTerm_inv (p : Admissible F) :
    fiveTerm F p.inv = symb F p.x⁻¹ - symb F p.y⁻¹ + symb F (p.x / p.y) -
      symb F ((1 - p.x) / (1 - p.y)) + symb F ((1 - p.x⁻¹) / (1 - p.y⁻¹)) := by sorry

/-- The map `F ∖ {0} → L ∖ {0}` of a field homomorphism. -/
def nonzeroMap {L : Type} [Field L] (f : F →+* L) : {a : F // a ≠ 0} → {b : L // b ≠ 0} :=
  fun a => ⟨f a, (map_ne_zero f).2 a.2⟩

theorem fiveTerm_map {L : Type} [Field L] (f : F →+* L) (p : Admissible F) :
    FreeAbelianGroup.map (nonzeroMap F f) (fiveTerm F p) = fiveTerm L (p.map f) := by sorry

/-- Test `arguments_defined`. -/
example (p : Admissible F) :
    (p.y / p.x ≠ 0 ∧ (1 - p.x⁻¹) / (1 - p.y⁻¹) ≠ 0 ∧ (1 - p.x) / (1 - p.y) ≠ 0) ∧
      (p.y / p.x ≠ 1 ∧ (1 - p.x⁻¹) / (1 - p.y⁻¹) ≠ 1 ∧ (1 - p.x) / (1 - p.y) ≠ 1) := by sorry

/-- Test `fiveTerm_sub_oneSub`. -/
example (p : Admissible F) :
    fiveTerm F p - fiveTerm F p.oneSub = symb F p.x + symb F (1 - p.x) - symb F p.y - symb F (1 - p.y) := by
  sorry

/-- Test `fiveTerm_add_inv_add_swap`. -/
example (p : Admissible F) :
    fiveTerm F p + fiveTerm F p.inv + fiveTerm F p.swap + fiveTerm F p.swap.inv =
      (2 : ℤ) • (symb F (p.y / p.x) + symb F (p.x / p.y)) := by sorry

/-- Test `fiveTerm_F4`: over `𝔽₄`, `fiveTerm ω ω² = 3[ω] - 2[ω²]`. -/
example (p : Admissible (GaloisField 2 2)) (hω : p.x ^ 2 + p.x + 1 = 0) (hy : p.y = p.x ^ 2) :
    fiveTerm _ p = (3 : ℤ) • symb _ p.x - (2 : ℤ) • symb _ p.y := by sorry

/-- Test `diagonal`. -/
example (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) : fiveTermFormula F x x = symb F 1 := by sorry

/-! ### V.3/pre-bloch-group -/

/-- V.3/pre-bloch-group: `P(F)`. -/
def preBloch : Type := FreeAbelianGroup {a : F // a ≠ 0} ⧸ fiveTermSubgroup F

instance : AddCommGroup (preBloch F) :=
  inferInstanceAs (AddCommGroup (FreeAbelianGroup {a : F // a ≠ 0} ⧸ fiveTermSubgroup F))

/-- The class of an element of the free abelian group. -/
def preBloch.mk : FreeAbelianGroup {a : F // a ≠ 0} →+ preBloch F := QuotientAddGroup.mk' _

/-- The class `[x]`; the junk value at `x = 0` is `0`. -/
def preBloch.gen (x : F) : preBloch F := preBloch.mk F (symb F x)

@[simp] theorem preBloch.gen_one : preBloch.gen F 1 = 0 := by sorry

theorem preBloch.fiveTerm (p : Admissible F) : preBloch.mk F (fiveTerm F p) = 0 := by sorry

/-- The universal property. -/
def preBloch.lift {B : Type} [AddCommGroup B] (f : F → B) (h1 : f 1 = 0)
    (h5 : ∀ p : Admissible F, f p.x - f p.y + f (p.y / p.x) - f ((1 - p.x⁻¹) / (1 - p.y⁻¹)) +
      f ((1 - p.x) / (1 - p.y)) = 0) : preBloch F →+ B :=
  QuotientAddGroup.lift (fiveTermSubgroup F) (FreeAbelianGroup.lift fun a => f a.1) (by sorry)

theorem preBloch.lift_gen {B : Type} [AddCommGroup B] (f : F → B) (h1 : f 1 = 0)
    (h5 : ∀ p : Admissible F, f p.x - f p.y + f (p.y / p.x) - f ((1 - p.x⁻¹) / (1 - p.y⁻¹)) +
      f ((1 - p.x) / (1 - p.y)) = 0) (x : F) (hx : x ≠ 0) :
    preBloch.lift F f h1 h5 (preBloch.gen F x) = f x := by sorry

theorem preBloch.hom_ext {B : Type} [AddCommGroup B] {φ ψ : preBloch F →+ B}
    (h : ∀ x : F, x ≠ 0 → φ (preBloch.gen F x) = ψ (preBloch.gen F x)) : φ = ψ := by sorry

theorem preBloch.induction_on {P : preBloch F → Prop} (z : preBloch F) (h0 : P 0)
    (hgen : ∀ x : F, x ≠ 0 → P (preBloch.gen F x)) (hadd : ∀ a b, P a → P b → P (a + b))
    (hneg : ∀ a, P a → P (-a)) : P z := by sorry

/-- Functoriality in field homomorphisms. -/
def preBloch.map {L : Type} [Field L] (f : F →+* L) : preBloch F →+ preBloch L :=
  preBloch.lift F (fun x => preBloch.gen L (f x)) (by sorry) (by sorry)

@[simp] theorem preBloch.map_gen {L : Type} [Field L] (f : F →+* L) (x : F) :
    preBloch.map F f (preBloch.gen F x) = preBloch.gen L (f x) := by sorry

@[simp] theorem preBloch.map_id : preBloch.map F (RingHom.id F) = AddMonoidHom.id _ := by sorry

theorem preBloch.map_comp {L E : Type} [Field L] [Field E] (f : F →+* L) (g : L →+* E) :
    preBloch.map F (g.comp f) = (preBloch.map L g).comp (preBloch.map F f) := by sorry

open Classical in
/-- The symbol `[a]` in the free abelian group on `F - {0, 1}`; junk value `0`. -/
def symbAdm (a : F) : FreeAbelianGroup {a : F // a ≠ 0 ∧ a ≠ 1} :=
  if h : a ≠ 0 ∧ a ≠ 1 then FreeAbelianGroup.of ⟨a, h⟩ else 0

/-- The five-term element in the free abelian group on `F - {0, 1}`. -/
def fiveTermAdm (p : Admissible F) : FreeAbelianGroup {a : F // a ≠ 0 ∧ a ≠ 1} :=
  symbAdm F p.x - symbAdm F p.y + symbAdm F (p.y / p.x) - symbAdm F ((1 - p.x⁻¹) / (1 - p.y⁻¹)) +
    symbAdm F ((1 - p.x) / (1 - p.y))

/-- `P(F) ≃ ℤ[F - {0, 1}] ⧸ ⟨five-term elements⟩`. -/
def preBloch.equivAdmissible :
    preBloch F ≃+ FreeAbelianGroup {a : F // a ≠ 0 ∧ a ≠ 1} ⧸
      AddSubgroup.closure (Set.range (fiveTermAdm F)) := sorry

/-- Test `one_is_zero`. -/
example : preBloch.gen F 1 = 0 := by sorry

/-- Test `five_term_vanishes`. -/
example (p : Admissible F) : preBloch.mk F (fiveTerm F p) = 0 := by sorry

/-- Test `preBloch_F2`. -/
example : Subsingleton (preBloch (ZMod 2)) := by sorry

/-- Test `preBloch_F3`. -/
example : ∃ e : preBloch (ZMod 3) ≃+ ℤ, e (preBloch.gen _ (-1)) = 1 := by sorry

/-- Test `preBloch_F4`. -/
example : Nonempty (preBloch (GaloisField 2 2) ≃+ ZMod 5) := by sorry

/-- Test `preBloch_F5`. -/
example : (∃ e : preBloch (ZMod 5) ≃+ ZMod 6, e (preBloch.gen _ 3) = 1) ∧
    preBloch.gen (ZMod 5) 2 = (2 : ℤ) • preBloch.gen _ 3 ∧ preBloch.gen (ZMod 5) 4 = 0 := by sorry

/-! ### V.3/bloch-boundary -/

open Classical in
/-- `x ∧ (1 - x)` for `x ≠ 0, 1`, and `0` otherwise. -/
def blochBoundarySymbol (x : F) : unitsWedge F :=
  if h : x ≠ 0 ∧ x ≠ 1 then uwedge F (Units.mk0 x h.1) (Units.mk0 (1 - x) (sub_ne_zero.2 h.2.symm))
  else 0

/-- V.3/bloch-boundary: `[x] ↦ x ∧ (1 - x)`, `[1] ↦ 0`, with this sign. -/
def blochBoundary : preBloch F →+ unitsWedge F :=
  preBloch.lift F (blochBoundarySymbol F) (by simp [blochBoundarySymbol]) (by sorry)

theorem blochBoundary_gen (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) :
    blochBoundary F (preBloch.gen F x) =
      uwedge F (Units.mk0 x hx0) (Units.mk0 (1 - x) (sub_ne_zero.2 hx1.symm)) := by sorry

@[simp] theorem blochBoundary_one : blochBoundary F (preBloch.gen F 1) = 0 := by sorry

theorem blochBoundary_c (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) :
    blochBoundary F (preBloch.gen F x + preBloch.gen F (1 - x)) = 0 := by sorry

theorem blochBoundary_angle (u : Fˣ) :
    blochBoundary F (preBloch.gen F u + preBloch.gen F (u⁻¹ : Fˣ)) = uwedge F u (-u) := by sorry

theorem blochBoundary_map {L : Type} [Field L] (f : F →+* L) (z : preBloch F) :
    antisymSquare.map ℤ _ (Units.map f.toMonoidHom).toAdditive.toIntLinearMap (blochBoundary F z) =
      blochBoundary L (preBloch.map F f z) := by sorry

theorem blochBoundary_comp_exterior (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) :
    antisymSquare.toExterior ℤ _ (blochBoundary F (preBloch.gen F x)) =
      exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (Units.mk0 x hx0),
        Additive.ofMul (Units.mk0 (1 - x) (sub_ne_zero.2 hx1.symm))] := by sorry

/-- The alternating form `β(a, b) = v₂(a)v₃(b) - v₃(a)v₂(b)` on `antisymSquare ℤ (Additive ℚˣ)`. -/
def valuationForm23 : unitsWedge ℚ →ₗ[ℤ] ℤ :=
  antisymSquare.lift ℤ (Additive ℚˣ)
    (LinearMap.mk₂ ℤ (fun a b : Additive ℚˣ =>
        padicValRat 2 ((Additive.toMul a : ℚˣ) : ℚ) * padicValRat 3 ((Additive.toMul b : ℚˣ) : ℚ) -
          padicValRat 3 ((Additive.toMul a : ℚˣ) : ℚ) * padicValRat 2 ((Additive.toMul b : ℚˣ) : ℚ))
      (by sorry) (by sorry) (by sorry) (by sorry))
    (by sorry)

/-- Test `five_term_to_zero`: on the free abelian group, the boundary kills five-term elements. -/
example (p : Admissible F) :
    FreeAbelianGroup.lift (fun a : {a : F // a ≠ 0} => blochBoundarySymbol F a.1) (fiveTerm F p) = 0 := by
  sorry

/-- Test `sign_convention`. -/
example : valuationForm23 (blochBoundary ℚ (preBloch.gen ℚ 3)) = -1 := by sorry

/-- Test `compatible_with_exterior`. -/
example (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) :
    antisymSquare.toExterior ℤ _ (blochBoundary F (preBloch.gen F x)) =
      exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (Units.mk0 x hx0),
        Additive.ofMul (Units.mk0 (1 - x) (sub_ne_zero.2 hx1.symm))] := by sorry

/-- Test `not_injective`: over `𝔽₅`. -/
example : Function.Surjective (blochBoundary (ZMod 5)) ∧ Nat.card (blochBoundary (ZMod 5)).ker = 3 ∧
    blochBoundary (ZMod 5) (preBloch.gen _ 3) ≠ 0 ∧ blochBoundary (ZMod 5) (preBloch.gen _ 2) = 0 := by
  sorry

/-- Test `angle_boundary`: over `𝔽₅`, `∂([2] + [3]) = 2 ∧ 3 ≠ 0`. -/
example : blochBoundary (ZMod 5) (preBloch.gen _ 2 + preBloch.gen _ 3) =
      uwedge (ZMod 5) (Units.mk0 2 (by decide)) (Units.mk0 3 (by decide)) ∧
    uwedge (ZMod 5) (Units.mk0 2 (by decide)) (Units.mk0 3 (by decide)) ≠ 0 := by sorry

/-! ### V.3/bloch-group -/

/-- V.3/bloch-group: `B(F)`, the kernel of the boundary. -/
def blochGroup : AddSubgroup (preBloch F) := (blochBoundary F).ker

theorem blochGroup.mem_iff (z : preBloch F) : z ∈ blochGroup F ↔ blochBoundary F z = 0 :=
  AddMonoidHom.mem_ker

/-- The inclusion `B(F) → P(F)`. -/
def blochGroup.coe : blochGroup F →+ preBloch F := (blochGroup F).subtype

theorem blochGroup.ext {a b : blochGroup F} (h : (a : preBloch F) = b) : a = b := Subtype.ext h

/-- Functoriality. -/
def blochGroup.map {L : Type} [Field L] (f : F →+* L) : blochGroup F →+ blochGroup L :=
  ((preBloch.map F f).comp (blochGroup F).subtype).codRestrict (blochGroup L) (by sorry)

/-- Test `bloch_F5`. -/
example : Nonempty (blochGroup (ZMod 5) ≃+ ZMod 3) ∧ preBloch.gen (ZMod 5) 2 ∈ blochGroup _ ∧
    preBloch.gen (ZMod 5) 3 ∉ blochGroup _ := by sorry

/-- Test `bloch_F7`. -/
example : Nonempty (blochGroup (ZMod 7) ≃+ ZMod 4) ∧
    preBloch.gen (ZMod 7) (-1) = (2 : ℤ) • preBloch.gen _ 3 ∧
    (blochGroup (ZMod 7)) = AddSubgroup.zmultiples (preBloch.gen _ (-1)) := by sorry

/-- Test `bloch_F4`. -/
example : blochGroup (GaloisField 2 2) = ⊤ ∧ Nonempty (blochGroup (GaloisField 2 2) ≃+ ZMod 5) := by
  sorry

/-- Test `c_lies_in_B`. -/
example (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) :
    preBloch.gen F x + preBloch.gen F (1 - x) ∈ blochGroup F := by sorry

/-- V.3/bloch-four-term-exact. -/
theorem bloch_four_term_exact :
    Function.Exact (blochGroup F).subtype (blochBoundary F) ∧
      ∃ φ : unitsWedge F →+ K 2 F,
        (∀ x y : Fˣ, φ (uwedge F x y) = steinbergSymbol (Additive.ofMul x) (Additive.ofMul y)) ∧
          Function.Exact (blochBoundary F) φ ∧ Function.Surjective φ := by sorry

/-! ### V.3/element-c -/

open Classical in
/-- V.3/element-c: `c = [x] + [1 - x] ∈ B(F)` (for any `x ≠ 0, 1`, and `0` if there is none). -/
def c : blochGroup F :=
  ⟨if h : ∃ x : F, x ≠ 0 ∧ x ≠ 1 then preBloch.gen F h.choose + preBloch.gen F (1 - h.choose) else 0,
    by sorry⟩

theorem c_eq (hF : 4 ≤ ENat.card F) (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) :
    (BlochGroup.c F : preBloch F) = preBloch.gen F x + preBloch.gen F (1 - x) := by sorry

theorem c_mem (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) :
    preBloch.gen F x + preBloch.gen F (1 - x) ∈ blochGroup F := by sorry

theorem map_c (hF : 4 ≤ ENat.card F) {L : Type} [Field L] (f : F →+* L) :
    blochGroup.map F f (BlochGroup.c F) = BlochGroup.c L := by sorry

/-- Test `c_F5`. -/
example : (BlochGroup.c (ZMod 5) : preBloch (ZMod 5)) = preBloch.gen _ 2 ∧
    (BlochGroup.c (ZMod 5) : preBloch (ZMod 5)) = (2 : ℤ) • preBloch.gen _ 3 ∧
    addOrderOf (BlochGroup.c (ZMod 5)) = 3 := by sorry

/-- Test `c_F7`. -/
example : (BlochGroup.c (ZMod 7) : preBloch (ZMod 7)) = (2 : ℤ) • preBloch.gen _ (-1) ∧
    (BlochGroup.c (ZMod 7) : preBloch (ZMod 7)) = (2 : ℤ) • preBloch.gen _ 4 ∧
    addOrderOf (BlochGroup.c (ZMod 7)) = 2 ∧
    (BlochGroup.c (ZMod 7) : preBloch (ZMod 7)) ≠ preBloch.gen _ 4 := by sorry

/-- Test `c_F11`. -/
example : addOrderOf (BlochGroup.c (ZMod 11)) = 6 ∧
    AddSubgroup.zmultiples (BlochGroup.c (ZMod 11)) = ⊤ := by sorry

/-- Test `c_F4`. -/
example : BlochGroup.c (GaloisField 2 2) = 0 := by sorry

/-! ### V.3/angle-bracket-two-torsion, angle-bracket-homomorphism, three-c-angle-minus-one,
c-characteristic-torsion -/

/-- The angle-bracket element `⟨x⟩ = [x] + [x⁻¹] ∈ P(F)`. -/
def angle (x : F) : preBloch F := preBloch.gen F x + preBloch.gen F x⁻¹

/-- V.3/angle-bracket-two-torsion: `⟨y⟩ - ⟨x⟩ = ⟨y/x⟩` and `2⟨x⟩ = 0` in `P(F)`. -/
theorem angle_two_torsion (hF : 4 ≤ ENat.card F) :
    (∀ p : Admissible F, angle F p.y - angle F p.x = angle F (p.y / p.x)) ∧
      ∀ x : F, x ≠ 0 → (2 : ℕ) • angle F x = 0 := by sorry

/-- V.3/angle-bracket-homomorphism: `x ↦ ⟨x⟩` is a homomorphism `Fˣ → P(F)`. -/
def angleBracket (hF : 4 ≤ ENat.card F) : Additive Fˣ →+ preBloch F where
  toFun x := angle F ((Additive.toMul x : Fˣ) : F)
  map_zero' := by sorry
  map_add' := by sorry

/-- V.3/angle-bracket-homomorphism: the image is an elementary abelian `2`-group, squares go to
zero, `⟨x⟩ ∈ B(F)` iff `x ∧ (-x) = 0`, `⟨-1⟩ ∈ B(F)`, and `⟨2⟩ ∉ B(𝔽₅)`. -/
theorem angleBracket_spec (hF : 4 ≤ ENat.card F) :
    (∀ x : Additive Fˣ, (2 : ℕ) • angleBracket F hF x = 0) ∧
      (∀ x : Fˣ, angleBracket F hF (Additive.ofMul (x ^ 2)) = 0) ∧
      (∀ x : Fˣ, angle F x ∈ blochGroup F ↔ uwedge F x (-x) = 0) ∧
      angle F (-1) ∈ blochGroup F ∧ angle (ZMod 5) 2 ∉ blochGroup (ZMod 5) := by sorry

/-- V.3/three-c-angle-minus-one: `3c = ⟨-1⟩`, both in `B(F)`, and `6c = 0`. -/
theorem three_c_eq_angle_neg_one (hF : 4 ≤ ENat.card F) :
    (3 : ℕ) • (BlochGroup.c F : preBloch F) = angle F (-1) ∧ angle F (-1) ∈ blochGroup F ∧
      (6 : ℕ) • BlochGroup.c F = 0 := by sorry

/-- V.3/c-characteristic-torsion: (i) `3c = 0` if `char F = 2` or `√-1 ∈ F`; (ii) if `ζ` is a
root of `t² - t + 1` then `c = ⟨ζ⟩` and `2c = 0`. -/
theorem c_characteristic_torsion (hF : 4 ≤ ENat.card F) :
    ((ringChar F = 2 ∨ ∃ i : F, i ^ 2 = -1) → (3 : ℕ) • BlochGroup.c F = 0) ∧
      ∀ ζ : F, ζ ^ 2 - ζ + 1 = 0 →
        (BlochGroup.c F : preBloch F) = angle F ζ ∧ (2 : ℕ) • BlochGroup.c F = 0 := by sorry

/-! ### V.3/small-field-conventions -/

/-- V.3/small-field-conventions. -/
theorem small_field_conventions :
    Subsingleton (preBloch (ZMod 2)) ∧ Subsingleton (blochGroup (ZMod 2)) ∧
      (∃ e : preBloch (ZMod 3) ≃+ ℤ, e (preBloch.gen _ (-1)) = 1) ∧
      blochBoundary (ZMod 3) (preBloch.gen _ (-1)) ≠ 0 ∧
      blochGroup (ZMod 3) = AddSubgroup.zmultiples (angle (ZMod 3) (-1)) ∧
      (BlochGroup.c (ZMod 3) : preBloch (ZMod 3)) = angle _ (-1) ∧
      (2 : ℕ) • angle (ZMod 3) (-1) ≠ 0 ∧
      (3 : ℕ) • (BlochGroup.c (ZMod 3) : preBloch (ZMod 3)) ≠ angle _ (-1) ∧
      blochGroup (GaloisField 2 2) = ⊤ ∧ Nonempty (preBloch (GaloisField 2 2) ≃+ ZMod 5) ∧
      Nonempty (preBloch (ZMod 5) ≃+ ZMod 6) ∧ Nonempty (blochGroup (ZMod 5) ≃+ ZMod 3) ∧
      preBloch.gen (ZMod 5) (-1) = 0 ∧ preBloch.gen (ZMod 5) 3 ∉ blochGroup _ ∧
      Nonempty (preBloch (ZMod 7) ≃+ ZMod 8) ∧ Nonempty (blochGroup (ZMod 7) ≃+ ZMod 4) ∧
      (BlochGroup.c (ZMod 7) : preBloch (ZMod 7)) = (2 : ℤ) • preBloch.gen _ (-1) := by sorry

/-! ### V.3/exterior-kernel-bloch-group, exterior-kernel-discrepancy -/

/-- V.3/exterior-kernel-bloch-group: `B̃(F)`, the kernel of `P(F) → ⋀²(Additive Fˣ)`. -/
def extBloch : AddSubgroup (preBloch F) :=
  ((antisymSquare.toExterior ℤ (Additive Fˣ)).toAddMonoidHom.comp (blochBoundary F)).ker

theorem mem_extBloch_iff (z : preBloch F) :
    z ∈ extBloch F ↔ antisymSquare.toExterior ℤ _ (blochBoundary F z) = 0 := by sorry

theorem blochGroup_le_extBloch : blochGroup F ≤ extBloch F := by sorry

/-- Functoriality. -/
def extBloch.map {L : Type} [Field L] (f : F →+* L) : extBloch F →+ extBloch L :=
  ((preBloch.map F f).comp (extBloch F).subtype).codRestrict (extBloch L) (by sorry)

/-- Test `ext_F5`. -/
example : extBloch (ZMod 5) = ⊤ ∧ Nat.card (preBloch (ZMod 5)) = 6 ∧
    Nat.card (blochGroup (ZMod 5)) = 3 := by sorry

/-- Test `ext_F3`. -/
example : extBloch (ZMod 3) = ⊤ ∧ blochGroup (ZMod 3) = (nsmulAddMonoidHom (α := preBloch (ZMod 3)) 2).range := by
  sorry

/-- Test `ext_C`. -/
example : extBloch ℂ = blochGroup ℂ := by sorry

/-- Test `angle_two_Q`. -/
example : angle ℚ 2 ∉ extBloch ℚ := by sorry

/-- Test `exterior_target_nonexample` (of V.3/bloch-group). -/
example : Nat.card (blochGroup (ZMod 5)) = 3 ∧ extBloch (ZMod 5) = ⊤ ∧
    Nat.card (preBloch (ZMod 5)) = 6 ∧ preBloch.gen (ZMod 3) (-1) ∉ blochGroup _ := by sorry

/-- V.3/exterior-kernel-discrepancy: `0 → B(F) → B̃(F) → Fˣ/Fˣ² → K₂(F)`, the last map
`a ↦ {-1, a}`. -/
theorem exterior_kernel_discrepancy :
    ∃ (δ : extBloch F →+ Additive (Fˣ ⧸ (powMonoidHom 2 : Fˣ →* Fˣ).range))
      (σ : Additive (Fˣ ⧸ (powMonoidHom 2 : Fˣ →* Fˣ).range) →+ K 2 F),
      (∀ (z : extBloch F) (a : Fˣ), blochBoundary F z = uwedge F a a →
        δ z = Additive.ofMul (QuotientGroup.mk a)) ∧
      (∀ a : Fˣ, σ (Additive.ofMul (QuotientGroup.mk a)) =
        steinbergSymbol (Additive.ofMul (-1)) (Additive.ofMul a)) ∧
      δ.ker = (blochGroup F).addSubgroupOf (extBloch F) ∧ Function.Exact δ σ := by sorry

/-! ### V.3/cgz-bloch-group, cgz-degenerate-relations, cgz-convention-comparison -/

open Classical in
/-- `X⁻¹` on `ℙ¹(F) = OnePoint F`, with `0⁻¹ = ∞` and `∞⁻¹ = 0`. -/
def p1Inv (z : OnePoint F) : OnePoint F :=
  OnePoint.elim z (0 : F) fun x => if x = 0 then OnePoint.infty else ((x⁻¹ : F) : OnePoint F)

/-- `1 - X` on `ℙ¹(F)`, with `1 - ∞ = ∞`. -/
def p1OneSub (z : OnePoint F) : OnePoint F :=
  OnePoint.elim z OnePoint.infty fun x => ((1 - x : F) : OnePoint F)

open Classical in
/-- `X / Y` on `ℙ¹(F)`, undefined (`none`) for `0/0` and `∞/∞`. -/
def p1Div (z w : OnePoint F) : Option (OnePoint F) :=
  OnePoint.elim z (OnePoint.elim w none fun _ => some OnePoint.infty) fun a =>
    OnePoint.elim w (some ((0 : F) : OnePoint F)) fun b =>
      if b = 0 then (if a = 0 then none else some OnePoint.infty) else some ((a / b : F) : OnePoint F)

/-- CGZ's five-term element `ξ_{X,Y}` in `ℤ[ℙ¹(F)]`, when all its arguments are defined. -/
def cgzXi (X Y : OnePoint F) : Option (FreeAbelianGroup (OnePoint F)) :=
  (p1Div F Y X).bind fun u =>
    (p1Div F (p1OneSub F (p1Inv F X)) (p1OneSub F (p1Inv F Y))).bind fun v =>
      (p1Div F (p1OneSub F X) (p1OneSub F Y)).map fun w =>
        FreeAbelianGroup.of X - FreeAbelianGroup.of Y + FreeAbelianGroup.of u -
          FreeAbelianGroup.of v + FreeAbelianGroup.of w

open Classical in
/-- The exterior-convention boundary `d : ℤ[ℙ¹(F)] → ⋀²(Additive Fˣ)`, `[X] ↦ X ∧ (1 - X)`, `[0], [1], [∞] ↦ 0`. -/
def cgzBoundary : FreeAbelianGroup (OnePoint F) →+ ⋀[ℤ]^2 (Additive Fˣ) :=
  FreeAbelianGroup.lift fun z => OnePoint.elim z 0 fun x =>
    if h : x ≠ 0 ∧ x ≠ 1 then
      exteriorPower.ιMulti ℤ 2 ![Additive.ofMul (Units.mk0 x h.1),
        Additive.ofMul (Units.mk0 (1 - x) (sub_ne_zero.2 h.2.symm))]
    else 0

/-- `A(F) = ker d`. -/
def cgzA : AddSubgroup (FreeAbelianGroup (OnePoint F)) := (cgzBoundary F).ker

/-- `⟨ξ⟩`, generated by the defined `ξ_{X,Y}`. -/
def cgzRelations : AddSubgroup (FreeAbelianGroup (OnePoint F)) :=
  AddSubgroup.closure {z | ∃ X Y, cgzXi F X Y = some z}

/-- V.3/cgz-bloch-group: `B_CGZ,old(F)`, the image of `A(F)` in `ℤ[ℙ¹(F)] ⧸ ⟨ξ⟩`. -/
def cgzBloch : AddSubgroup (FreeAbelianGroup (OnePoint F) ⧸ cgzRelations F) :=
  (cgzA F).map (QuotientAddGroup.mk' (cgzRelations F))

/-- The class of an element of `A(F)`. -/
def cgzBloch.mk (z : cgzA F) : cgzBloch F :=
  ⟨QuotientAddGroup.mk' (cgzRelations F) z, AddSubgroup.mem_map_of_mem _ z.2⟩

theorem cgzBloch.gen_one (h : FreeAbelianGroup.of ((1 : F) : OnePoint F) ∈ cgzA F) :
    cgzBloch.mk F ⟨_, h⟩ = 0 := by sorry

theorem cgzBloch.gen_infty (h : FreeAbelianGroup.of (OnePoint.infty : OnePoint F) ∈ cgzA F)
    (h' : FreeAbelianGroup.of ((0 : F) : OnePoint F) ∈ cgzA F) :
    cgzBloch.mk F ⟨_, h⟩ = -cgzBloch.mk F ⟨_, h'⟩ := by sorry

theorem cgzBloch.three_zero (h : FreeAbelianGroup.of ((0 : F) : OnePoint F) ∈ cgzA F) :
    (3 : ℕ) • cgzBloch.mk F ⟨_, h⟩ = 0 := by sorry

theorem cgzBloch.xi_mem (X Y : OnePoint F) (z : FreeAbelianGroup (OnePoint F))
    (hz : cgzXi F X Y = some z) (hA : z ∈ cgzA F) : cgzBloch.mk F ⟨z, hA⟩ = 0 := by sorry

/-- Functoriality (`map_id`, `map_comp` below). -/
def cgzBloch.map {L : Type} [Field L] (f : F →+* L) : cgzBloch F →+ cgzBloch L := sorry

theorem cgzBloch.map_id : cgzBloch.map F (RingHom.id F) = AddMonoidHom.id _ := by sorry

theorem cgzBloch.map_comp {L E : Type} [Field L] [Field E] (f : F →+* L) (g : L →+* E) :
    cgzBloch.map F (g.comp f) = (cgzBloch.map L g).comp (cgzBloch.map F f) := by sorry

/-- Test `cgz_F2`. -/
example : Nonempty (cgzBloch (ZMod 2) ≃+ ZMod 3) ∧ Subsingleton (blochGroup (ZMod 2)) := by sorry

/-- Test `cgz_F5`. -/
example (h0 : FreeAbelianGroup.of ((0 : ZMod 5) : OnePoint (ZMod 5)) ∈ cgzA (ZMod 5)) :
    Nonempty (cgzBloch (ZMod 5) ≃+ ZMod 3) ∧ addOrderOf (cgzBloch.mk _ ⟨_, h0⟩) = 3 := by sorry

/-- Test `cgz_F11`. -/
example (h0 : FreeAbelianGroup.of ((0 : ZMod 11) : OnePoint (ZMod 11)) ∈ cgzA (ZMod 11)) :
    Nonempty (cgzBloch (ZMod 11) ≃+ ZMod 6) ∧ addOrderOf (cgzBloch.mk _ ⟨_, h0⟩) = 3 := by sorry

/-- Test `xi_21_not_in_A`: `ξ_{2,1} = [2] + [1/2] - [1] ∉ A(ℚ)`. -/
example (z : FreeAbelianGroup (OnePoint ℚ)) (hz : cgzXi ℚ ((2 : ℚ) : OnePoint ℚ) ((1 : ℚ) : OnePoint ℚ) = some z) :
    z ∉ cgzA ℚ := by sorry

/-- The map `P(F) → ℤ[ℙ¹(F)] ⧸ ⟨ξ⟩` induced by the inclusion of generators. -/
def preBlochToCGZ : preBloch F →+ FreeAbelianGroup (OnePoint F) ⧸ cgzRelations F :=
  QuotientAddGroup.map _ _ (FreeAbelianGroup.map fun a => ((a.1 : F) : OnePoint F)) (by sorry)

/-- The surjection `B̃(F) → B_CGZ(F)`. -/
def cgzComparisonExt : extBloch F →+ cgzBloch F :=
  ((preBlochToCGZ F).comp (extBloch F).subtype).codRestrict (cgzBloch F) (by sorry)

/-- The comparison `κ : B(F) → B_CGZ(F)`, factoring through `B̃(F)`. -/
def cgzComparison : blochGroup F →+ cgzBloch F :=
  (cgzComparisonExt F).comp (AddSubgroup.inclusion (blochGroup_le_extBloch F))

/-- V.3/cgz-degenerate-relations. -/
theorem cgz_degenerate_relations (hF : 4 ≤ ENat.card F) :
    (preBlochToCGZ F).ker = (angleBracket F hF).range ∧
      (∀ (h0 : FreeAbelianGroup.of ((0 : F) : OnePoint F) ∈ cgzA F),
        QuotientAddGroup.mk' (cgzRelations F) (FreeAbelianGroup.of ((0 : F) : OnePoint F)) =
          preBlochToCGZ F (BlochGroup.c F)) ∧
      QuotientAddGroup.mk' (cgzRelations F) (FreeAbelianGroup.of (OnePoint.infty : OnePoint F)) =
        -preBlochToCGZ F (BlochGroup.c F) ∧
      Function.Surjective (cgzComparisonExt F) ∧
      (cgzComparisonExt F).ker = ((angleBracket F hF).range.addSubgroupOf (extBloch F)) ∧
      (∀ z ∈ (cgzComparisonExt F).ker, (2 : ℕ) • z = 0) ∧
      ∀ x : Fˣ, angle F x ∈ extBloch F ↔
        exteriorPower.ιMulti ℤ 2 ![Additive.ofMul x, Additive.ofMul (-1 : Fˣ)] = 0 := by sorry

/-- V.3/cgz-convention-comparison: `κ(c) = [0]`, `ker κ = B(F) ∩ ⟨Fˣ⟩`, kernel and cokernel
killed by `2`, `κ ⊗ ℤ[1/2]` bijective, and the `𝔽₁₁` example. -/
theorem cgz_convention_comparison (hF : 4 ≤ ENat.card F) :
    (∀ h0 : FreeAbelianGroup.of ((0 : F) : OnePoint F) ∈ cgzA F,
      cgzComparison F (BlochGroup.c F) = cgzBloch.mk F ⟨_, h0⟩) ∧
      ((cgzComparison F).ker = (angleBracket F hF).range.addSubgroupOf (blochGroup F)) ∧
      (∀ z ∈ (cgzComparison F).ker, (2 : ℕ) • z = 0) ∧
      (∀ w : cgzBloch F, (2 : ℕ) • w ∈ (cgzComparison F).range) ∧
      Function.Bijective (LinearMap.lTensor (Localization.Away (2 : ℤ))
        (cgzComparison F).toIntLinearMap) ∧
      (Nat.card (cgzComparison (ZMod 11)).ker = 2 ∧
        Nat.card (cgzBloch (ZMod 11) ⧸ (cgzComparison (ZMod 11)).range) = 2) := by sorry

end PreBloch

end TauCeti.BlochGroup

/-! ## V.4 Suslin's exact sequence (infinite fields) -/

namespace TauCeti.Suslin

open TauCeti.BlochGroup TauCeti.K3

local notation "K3ind'" => K3ind K MilnorK milnorToQuillen
local notation "m3" => milnorToQuillen3 K MilnorK milnorToQuillen

/-! ### V.4/configuration-complex -/

section Configuration

variable (X : Type)

/-- `C_n(X)`, the free abelian group on injective `(n+1)`-tuples, as `Fin (n+1) ↪ X →₀ ℤ`. -/
abbrev configChain (n : ℕ) : Type := (Fin (n + 1) ↪ X) →₀ ℤ

/-- The basis element `[x]` of an injective tuple. -/
def configComplex.single {n : ℕ} (t : Fin (n + 1) ↪ X) : configChain X n := Finsupp.single t 1

/-- The `i`-th face of a tuple. -/
def configComplex.face {n : ℕ} (i : Fin (n + 2)) (t : Fin (n + 2) ↪ X) : Fin (n + 1) ↪ X :=
  (Fin.succAboveEmb i).trans t

/-- The alternating-sum differential. -/
def configComplex.d (n : ℕ) : configChain X (n + 1) →ₗ[ℤ] configChain X n :=
  Finsupp.linearCombination ℤ fun t =>
    ∑ i : Fin (n + 2), ((-1 : ℤ) ^ (i : ℕ)) • configComplex.single X (configComplex.face X i t)

theorem configComplex.d_comp_d (n : ℕ) :
    configComplex.d X n ∘ₗ configComplex.d X (n + 1) = 0 := by sorry

/-- V.4/configuration-complex: `C_*(X)` as a chain complex of abelian groups. -/
def configComplex : ChainComplex (ModuleCat ℤ) ℕ :=
  ChainComplex.of (fun n => ModuleCat.of ℤ (configChain X n))
    (fun n => ModuleCat.ofHom (configComplex.d X n)) (by sorry)

@[simp] theorem configComplex.d_single {n : ℕ} (t : Fin (n + 2) ↪ X) :
    configComplex.d X n (configComplex.single X t) =
      ∑ i : Fin (n + 2), ((-1 : ℤ) ^ (i : ℕ)) • configComplex.single X (configComplex.face X i t) := by
  sorry

/-- The augmentation. -/
def configComplex.aug : configChain X 0 →ₗ[ℤ] ℤ := Finsupp.linearCombination ℤ fun _ => 1

theorem configComplex.aug_comp_d : configComplex.aug X ∘ₗ configComplex.d X 0 = 0 := by sorry

/-- The action of a group acting on `X`, entrywise. -/
def configComplex.smul {G : Type} [Group G] [MulAction G X] (g : G) (n : ℕ) :
    configChain X n →ₗ[ℤ] configChain X n :=
  Finsupp.lmapDomain ℤ ℤ fun t => g • t

theorem configComplex.smul_single {G : Type} [Group G] [MulAction G X] (g : G) {n : ℕ}
    (t : Fin (n + 1) ↪ X) :
    configComplex.smul X g n (configComplex.single X t) = configComplex.single X (g • t) := by sorry

/-- `C_*(X)` as a complex of `G`-representations. -/
def configComplex.toRep (G : Type) [Group G] [MulAction G X] : ChainComplex (Rep.{0} ℤ G) ℕ := sorry

theorem configComplex.toRep_X (G : Type) [Group G] [MulAction G X] (n : ℕ) :
    (configComplex.toRep X G).X n = Rep.ofMulAction ℤ G (Fin (n + 1) ↪ X) := by sorry

/-- The chain map of an injection. -/
def configComplex.map {Y : Type} (f : X ↪ Y) (n : ℕ) : configChain X n →ₗ[ℤ] configChain Y n :=
  Finsupp.lmapDomain ℤ ℤ fun t => t.trans f

theorem configComplex.map_d {Y : Type} (f : X ↪ Y) (n : ℕ) :
    configComplex.map X f n ∘ₗ configComplex.d X n =
      configComplex.d Y n ∘ₗ configComplex.map X f (n + 1) := by sorry

theorem configComplex.map_id (n : ℕ) : configComplex.map X (Function.Embedding.refl X) n = LinearMap.id := by
  sorry

theorem configComplex.map_comp {Y Z : Type} (f : X ↪ Y) (g : Y ↪ Z) (n : ℕ) :
    configComplex.map X (f.trans g) n = configComplex.map Y g n ∘ₗ configComplex.map X f n := by sorry

theorem configComplex.aug_map {Y : Type} (f : X ↪ Y) :
    configComplex.aug Y ∘ₗ configComplex.map X f 0 = configComplex.aug X := by sorry

/-- The one-point tuple. -/
def configComplex.point (x : X) : Fin 1 ↪ X := ⟨fun _ => x, fun a b _ => Subsingleton.elim a b⟩

/-- The unsigned sum of deletions (a non-example). -/
def configComplex.dUnsigned (n : ℕ) : configChain X (n + 1) →ₗ[ℤ] configChain X n :=
  Finsupp.linearCombination ℤ fun t => ∑ i : Fin (n + 2), configComplex.single X (configComplex.face X i t)

/-- Test `d_squared`. -/
example (n : ℕ) (s : configChain X (n + 2)) :
    configComplex.d X n (configComplex.d X (n + 1) s) = 0 ∧
      ∀ t : Fin 3 ↪ X, configComplex.dUnsigned X 0 (configComplex.dUnsigned X 1 (configComplex.single X t)) =
        (2 : ℤ) • (configComplex.single X (configComplex.point X (t 0)) +
          configComplex.single X (configComplex.point X (t 1)) +
          configComplex.single X (configComplex.point X (t 2))) := by sorry

/-- Test `one_point`. -/
example : Nonempty (configChain Unit 0 ≃ₗ[ℤ] ℤ) ∧ (∀ n, Subsingleton (configChain Unit (n + 1))) ∧
    Function.Bijective (configComplex.aug Unit) := by sorry

/-- Test `two_points_H1`. -/
example : Nonempty ((configComplex (Fin 2)).homology 1 ≅ ModuleCat.of ℤ ℤ) := by sorry

/-- Test `three_points_ranks`. -/
example : Module.finrank ℤ (configChain (Fin 3) 0) = 3 ∧ Module.finrank ℤ (configChain (Fin 3) 1) = 6 ∧
    Module.finrank ℤ (configChain (Fin 3) 2) = 6 ∧
    Nonempty ((configComplex (Fin 3)).homology 0 ≅ ModuleCat.of ℤ ℤ) ∧
    IsZero ((configComplex (Fin 3)).homology 1) ∧
    Nonempty ((configComplex (Fin 3)).homology 2 ≅ ModuleCat.of ℤ (Fin 2 → ℤ)) := by sorry

/-- Test `d_one`. -/
example (t : Fin 2 ↪ X) :
    configComplex.d X 0 (configComplex.single X t) =
        configComplex.single X (configComplex.point X (t 1)) - configComplex.single X (configComplex.point X (t 0)) ∧
      configComplex.aug X (configComplex.d X 0 (configComplex.single X t)) = 0 := by sorry

/-- Test `equivariance`. -/
example {G : Type} [Group G] [MulAction G X] (g : G) (n : ℕ) (s : configChain X (n + 1))
    (s₀ : configChain X 0) :
    configComplex.d X n (configComplex.smul X g (n + 1) s) = configComplex.smul X g n (configComplex.d X n s) ∧
      configComplex.aug X (configComplex.smul X g 0 s₀) = configComplex.aug X s₀ := by sorry

/-- V.4/configuration-acyclicity: for infinite `X` the augmented complex is exact. -/
theorem configComplex.acyclic [Infinite X] :
    Function.Surjective (configComplex.aug X) ∧
      Function.Exact (configComplex.d X 0) (configComplex.aug X) ∧
      ∀ n, Function.Exact (configComplex.d X (n + 1)) (configComplex.d X n) := by sorry

end Configuration

/-! ### V.4/monomial-subgroups -/

section Monomial

variable (F : Type) [Field F]

/-- Permutation matrices, as the homomorphism `σ ↦ (σ⁻¹).permMatrix` (Mathlib's
`permMatrixHom`) into `GL_n(F)`. -/
def permHom (n : ℕ) : Equiv.Perm (Fin n) →* GL (Fin n) F where
  toFun σ := ⟨σ⁻¹.permMatrix F, σ.permMatrix F, by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- V.4/monomial-subgroups: the diagonal torus `T_n`. -/
def diagonalSubgroup (n : ℕ) : Subgroup (GL (Fin n) F) where
  carrier := {g | ∀ i j, i ≠ j → (g : Matrix (Fin n) (Fin n) F) i j = 0}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- The permutation matrices `Σ_n`. -/
def permSubgroup (n : ℕ) : Subgroup (GL (Fin n) F) := (permHom F n).range

/-- The monomial matrices `M_n = T_n ⋊ Σ_n`. -/
def monomialSubgroup (n : ℕ) : Subgroup (GL (Fin n) F) := diagonalSubgroup F n ⊔ permSubgroup F n

/-- The projection `M_n → Σ_n`. -/
def monomialSubgroup.toPerm (n : ℕ) : monomialSubgroup F n →* Equiv.Perm (Fin n) := sorry

theorem diagonalSubgroup_normal (n : ℕ) :
    (monomialSubgroup.toPerm F n).ker = (diagonalSubgroup F n).subgroupOf (monomialSubgroup F n) ∧
      Function.Surjective (monomialSubgroup.toPerm F n) ∧
      ∀ σ : Equiv.Perm (Fin n), ∃ h : permHom F n σ ∈ monomialSubgroup F n,
        monomialSubgroup.toPerm F n ⟨permHom F n σ, h⟩ = σ := by sorry

/-- `T_n ≅ (Fˣ)ⁿ`. -/
def diagonalSubgroup_equiv (n : ℕ) : diagonalSubgroup F n ≃* (Fin n → Fˣ) := sorry

/-- The block matrix `diag(A, 1)` of size `n ≥ m`. -/
def blockOne {m n : ℕ} (A : Matrix (Fin m) (Fin m) F) : Matrix (Fin n) (Fin n) F :=
  fun i j => if hi : (i : ℕ) < m then (if hj : (j : ℕ) < m then A ⟨i, hi⟩ ⟨j, hj⟩ else 0)
    else if i = j then 1 else 0

/-- The inclusion `GL_m(F) → GL_n(F)`, `g ↦ diag(g, 1)`, for `m ≤ n`. -/
def glIncl {m n : ℕ} (h : m ≤ n) : GL (Fin m) F →* GL (Fin n) F where
  toFun g := ⟨blockOne F (g : Matrix (Fin m) (Fin m) F), blockOne F ((g⁻¹ : GL (Fin m) F) : Matrix (Fin m) (Fin m) F),
    by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- The stable monomial group `M = ⋃ M_n` inside the imported `GL(F)`. -/
def monomialInf : Subgroup (GLinf F) := ⨆ n, (monomialSubgroup F n).map (glToInf n F)

/-- The stable permutation group `Σ_∞ = ⋃ Σ_n` inside `GL(F)`. -/
def permInf : Subgroup (GLinf F) := ⨆ n, (permSubgroup F n).map (glToInf n F)

/-- The projection `M = Fˣ ≀ Σ_∞ → Σ_∞`. -/
def monomialInf.toPerm : monomialInf GLinf glToInf F →* permInf GLinf glToInf F := sorry

/-- The block-sum inclusions `M_n ⊂ M_{n+1}` (the identification `M ≅ Fˣ ≀ Σ_∞` is not
stated: Mathlib has no wreath product). -/
theorem monomialSubgroup.stable (n : ℕ) :
    (monomialSubgroup F n).map (glIncl F (Nat.le_succ n)) ≤ monomialSubgroup F (n + 1) ∧
      (permSubgroup F n).map (glIncl F (Nat.le_succ n)) ≤ permSubgroup F (n + 1) := by sorry

/-- The upper triangular (Borel) subgroup `B₂` of `GL₂(F)`. -/
def borelSubgroup : Subgroup (GL (Fin 2) F) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) F) 1 0 = 0}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- The involution `σ(a, b) = (b, a)` of `T₂` (conjugation by the swap). -/
def torusSwap : diagonalSubgroup F 2 →* diagonalSubgroup F 2 :=
  ((MulAut.conj (permHom F 2 (Equiv.swap 0 1))).toMonoidHom.comp (diagonalSubgroup F 2).subtype).codRestrict
    (diagonalSubgroup F 2) (by sorry)

/-- Test `monomial_card_F2`. -/
example : Nat.card (monomialSubgroup (ZMod 2) 2) = 2 ∧ diagonalSubgroup (ZMod 2) 2 = ⊥ := by sorry

/-- Test `diagonal_iso`. -/
example (n : ℕ) : Nonempty (diagonalSubgroup F n ≃* (Fin n → Fˣ)) := by sorry

/-- Test `monomial_not_all`. -/
example : monomialSubgroup (ZMod 3) 2 ≠ ⊤ ∧ Nat.card (monomialSubgroup (ZMod 3) 2) = 8 ∧
    Nat.card (GL (Fin 2) (ZMod 3)) = 48 := by sorry

/-- Test `monomial_one`. -/
example : diagonalSubgroup F 1 = ⊤ ∧ monomialSubgroup F 1 = ⊤ := by sorry

end Monomial

/-! ### V.4/cross-ratio -/

section CrossRatio

variable (F : Type) [Field F] [DecidableEq F]

/-- Homogeneous coordinates on `ℙ¹(F) = OnePoint F`: `∞ ↦ (1, 0)`, `x ↦ (x, 1)`. -/
def p1Coords (z : OnePoint F) : F × F := OnePoint.elim z (1, 0) fun x => (x, 1)

/-- `[u, v] = u₀v₁ - u₁v₀`. -/
def p1Bracket (u v : F × F) : F := u.1 * v.2 - u.2 * v.1

/-- V.4/cross-ratio: `cr(a, b, c, d) = [d, a][c, b] / ([d, b][c, a])`. -/
def crossRatio (t : Fin 4 ↪ OnePoint F) : {x : F // x ≠ 0 ∧ x ≠ 1} :=
  ⟨p1Bracket F (p1Coords F (t 3)) (p1Coords F (t 0)) * p1Bracket F (p1Coords F (t 2)) (p1Coords F (t 1)) /
      (p1Bracket F (p1Coords F (t 3)) (p1Coords F (t 1)) * p1Bracket F (p1Coords F (t 2)) (p1Coords F (t 0))),
    by sorry⟩

@[simp] theorem crossRatio_smul (g : GL (Fin 2) F) (t : Fin 4 ↪ OnePoint F) :
    crossRatio F (g • t) = crossRatio F t := by sorry

@[simp] theorem crossRatio_std (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1)
    (ht : Function.Injective ![((0 : F) : OnePoint F), OnePoint.infty, ((1 : F) : OnePoint F), (x : OnePoint F)]) :
    (crossRatio F ⟨_, ht⟩).1 = x := by sorry

theorem crossRatio_eq_iff (t t' : Fin 4 ↪ OnePoint F) :
    crossRatio F t = crossRatio F t' ↔ ∃ g : GL (Fin 2) F, g • t = t' := by sorry

theorem isMultiplyPretransitive_three :
    MulAction.IsMultiplyPretransitive (GL (Fin 2) F) (OnePoint F) 3 ∧
      ∀ t : Fin 3 ↪ OnePoint F, MulAction.stabilizer (GL (Fin 2) F) t = Subgroup.center _ := by sorry

theorem crossRatio_swap (t : Fin 4 ↪ OnePoint F) :
    (crossRatio F ((Equiv.swap (0 : Fin 4) 1).toEmbedding.trans t)).1 = (crossRatio F t).1⁻¹ ∧
      (crossRatio F ((Equiv.swap (2 : Fin 4) 3).toEmbedding.trans t)).1 = (crossRatio F t).1⁻¹ := by sorry

theorem crossRatio_faces (x y : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) (hy0 : y ≠ 0) (hy1 : y ≠ 1) (hxy : x ≠ y)
    (hs : Function.Injective ![((0 : F) : OnePoint F), OnePoint.infty, ((1 : F) : OnePoint F),
      (x : OnePoint F), (y : OnePoint F)]) :
    (crossRatio F (configComplex.face _ 0 ⟨_, hs⟩)).1 = (1 - x) / (1 - y) ∧
      (crossRatio F (configComplex.face _ 1 ⟨_, hs⟩)).1 = (1 - x⁻¹) / (1 - y⁻¹) ∧
      (crossRatio F (configComplex.face _ 2 ⟨_, hs⟩)).1 = y / x ∧
      (crossRatio F (configComplex.face _ 3 ⟨_, hs⟩)).1 = y ∧
      (crossRatio F (configComplex.face _ 4 ⟨_, hs⟩)).1 = x := by sorry

/-- Test `crossRatio_std_test`. -/
example (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1)
    (ht : Function.Injective ![((0 : F) : OnePoint F), OnePoint.infty, ((1 : F) : OnePoint F), (x : OnePoint F)])
    (ht' : Function.Injective ![OnePoint.infty, ((0 : F) : OnePoint F), ((1 : F) : OnePoint F), (x : OnePoint F)]) :
    (crossRatio F ⟨_, ht⟩).1 = x ∧ (crossRatio F ⟨_, ht'⟩).1 = x⁻¹ := by sorry

/-- Test `crossRatio_invariant`: `cr(1, ∞, 2, 3) = 2` over `ℚ`. -/
example (ht : Function.Injective ![((1 : ℚ) : OnePoint ℚ), OnePoint.infty, ((2 : ℚ) : OnePoint ℚ),
    ((3 : ℚ) : OnePoint ℚ)]) : (crossRatio ℚ ⟨_, ht⟩).1 = 2 := by sorry

/-- Test `crossRatio_F3`. -/
example (t : Fin 4 ↪ OnePoint (ZMod 3)) : (crossRatio (ZMod 3) t).1 = -1 := by sorry

/-- Test `crossRatio_not_unordered`. -/
example (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1) (hx2 : x ^ 2 ≠ 1)
    (ht : Function.Injective ![((0 : F) : OnePoint F), OnePoint.infty, ((1 : F) : OnePoint F), (x : OnePoint F)])
    (ht' : Function.Injective ![OnePoint.infty, ((0 : F) : OnePoint F), ((1 : F) : OnePoint F), (x : OnePoint F)]) :
    crossRatio F ⟨_, ht⟩ ≠ crossRatio F ⟨_, ht'⟩ := by sorry

end CrossRatio

/-! ### V.4/hyperhomology-map -/

/-- Hyperhomology `H_n(G, C)` of a complex of `G`-representations. -/
def hyperhomology (G : Type) [Group G] (C : ChainComplex (Rep.{0} ℤ G) ℕ) (n : ℕ) : ModuleCat ℤ := sorry

/-- The map of hyperhomology induced by a chain map. -/
def hyperhomology.map (G : Type) [Group G] {C D : ChainComplex (Rep.{0} ℤ G) ℕ} (f : C ⟶ D) (n : ℕ) :
    hyperhomology G C n ⟶ hyperhomology G D n := sorry

/-- V.4/hyperhomology-map: `H_n(G, C_*(X))`. -/
abbrev configHyperhomology (G X : Type) [Group G] [MulAction G X] (n : ℕ) : ModuleCat ℤ :=
  hyperhomology G (configComplex.toRep X G) n

/-- The coinvariant complex `C_G = C_*(X) ⊗_G ℤ`, through Mathlib's coinvariants functor. -/
abbrev configCoinvariants (G X : Type) [Group G] [MulAction G X] : ChainComplex (ModuleCat ℤ) ℕ :=
  ((Rep.coinvariantsFunctor ℤ G).mapHomologicalComplex _).obj (configComplex.toRep X G)

/-- The canonical map `H_n(G, C_*(X)) → H_n(C_G)`. -/
def configHyperhomology.toCoinvariants (G X : Type) [Group G] [MulAction G X] (n : ℕ) :
    configHyperhomology G X n ⟶ (configCoinvariants G X).homology n := sorry

/-- For `X` infinite, `H_n(G, C_*(X)) ≅ H_n(G, ℤ)`. -/
def configHyperhomology.iso_groupHomology (G X : Type) [Group G] [MulAction G X] [Infinite X]
    (n : ℕ) : configHyperhomology G X n ≅ groupHomology (Rep.trivial ℤ G ℤ) n := sorry

theorem configHyperhomology.map_quasiIso (G : Type) [Group G] {C D : ChainComplex (Rep.{0} ℤ G) ℕ}
    (f : C ⟶ D) [QuasiIso f] (n : ℕ) : IsIso (hyperhomology.map G f n) := by sorry

/-- Naturality for a homomorphism with a compatible injection of sets. -/
def configHyperhomology.map {G X G' X' : Type} [Group G] [MulAction G X] [Group G'] [MulAction G' X']
    (φ : G →* G') (f : X ↪ X') (hf : ∀ (g : G) (x : X), f (g • x) = φ g • f x) (n : ℕ) :
    configHyperhomology G X n ⟶ configHyperhomology G' X' n := sorry

theorem configHyperhomology.map_iso_groupHomology {G X G' X' : Type} [Group G] [MulAction G X]
    [Group G'] [MulAction G' X'] [Infinite X] [Infinite X'] (φ : G →* G') (f : X ↪ X')
    (hf : ∀ (g : G) (x : X), f (g • x) = φ g • f x) (n : ℕ) :
    configHyperhomology.map φ f hf n ≫ (configHyperhomology.iso_groupHomology G' X' n).hom =
      (configHyperhomology.iso_groupHomology G X n).hom ≫
        groupHomology.map (A := Rep.trivial ℤ G ℤ) (B := Rep.trivial ℤ G' ℤ) φ (𝟙 _) n := by sorry

/-- Test `trivial_group`. -/
example (G X : Type) [Group G] [Subsingleton G] [MulAction G X] (n : ℕ) :
    IsIso (configHyperhomology.toCoinvariants G X n) := by sorry

/-- Test `shapiro_terms`. -/
example (F : Type) [Field F] [DecidableEq F] (q : ℕ) :
    Nonempty (groupHomology ((configComplex.toRep (OnePoint F) (GL (Fin 2) F)).X 1) q ≅
        groupHomology (Rep.trivial ℤ (diagonalSubgroup F 2) ℤ) q) ∧
      Nonempty (groupHomology ((configComplex.toRep (OnePoint F) (GL (Fin 2) F)).X 2) q ≅
        groupHomology (Rep.trivial ℤ Fˣ ℤ) q) := by sorry

/-- Test `range_restriction`. -/
example (G : Type) [Group G] [Subsingleton G] [MulAction G (Fin 2)] :
    Nonempty (configHyperhomology G (Fin 2) 1 ≅ ModuleCat.of ℤ ℤ) ∧
      IsZero (groupHomology (Rep.trivial ℤ G ℤ) 1) := by sorry

/-- Test `degree_zero`. -/
example (G X : Type) [Group G] [MulAction G X] [MulAction.IsPretransitive G X] [Infinite X] :
    Nonempty (configHyperhomology G X 0 ≅ ModuleCat.of ℤ ℤ) ∧
      IsIso (configHyperhomology.toCoinvariants G X 0) := by sorry

/-- V.4/coinvariants-p1-homology: for `GL₂(F)` on `ℙ¹(F)` (any field), `H₀(C_G) = ℤ`,
`H₁ = H₂ = 0` and `H₃(C_G) ≅ P(F)`. The value `(0, ∞, 1, x) ↦ [x]` is not stated: it
needs the class of a cycle of the coinvariant complex written out. -/
theorem coinvariants_p1_homology (F : Type) [Field F] [DecidableEq F] :
    Nonempty ((configCoinvariants (GL (Fin 2) F) (OnePoint F)).homology 0 ≅ ModuleCat.of ℤ ℤ) ∧
      IsZero ((configCoinvariants (GL (Fin 2) F) (OnePoint F)).homology 1) ∧
      IsZero ((configCoinvariants (GL (Fin 2) F) (OnePoint F)).homology 2) ∧
      Nonempty ((configCoinvariants (GL (Fin 2) F) (OnePoint F)).homology 3 ≅
        ModuleCat.of ℤ (preBloch F)) := by sorry

-- V.4/gl2-spectral-sequence: not stated; needs the hyperhomology spectral sequence
-- (Mathlib has no spectral sequences).
-- V.4/gl2-d1-involution: not stated; needs the first differential of that spectral sequence.

/-- V.4/torus-borel-homology. -/
theorem torus_borel_homology (F : Type) [Field F] [Infinite F]
    (h : diagonalSubgroup F 2 ≤ borelSubgroup F) (n : ℕ) :
    Function.Bijective (intHomologyMap (Subgroup.inclusion h) n) := by sorry

/-- V.4/gl2-d3-boundary, the Künneth half: `H₂(T₂)_σ ≅ ⋀²Fˣ ⊕ ~∧²Fˣ`. That `d³` is the Bloch
boundary is not stated: it needs the spectral sequence. -/
theorem gl2_d3_boundary (F : Type) [Field F] [Infinite F] :
    Nonempty ((intHomology (diagonalSubgroup F 2) 2 ⧸
        (intHomologyMap (torusSwap F) 2 - AddMonoidHom.id _).range) ≃+
      (⋀[ℤ]^2 (Additive Fˣ)) × unitsWedge F) := by sorry

/-! ### V.4/psi-map, V.4/psi-gl2 -/

/-- V.4/psi-map: `ψ : H₃(GL₂(F), ℤ) → B(F)` for an infinite field. -/
def psiGL2 (F : Type) [Field F] [Infinite F] : intHomology (GL (Fin 2) F) 3 →+ blochGroup F := sorry

theorem psiGL2_coe (F : Type) [Field F] [DecidableEq F] [Infinite F] :
    ∃ e : ((configCoinvariants (GL (Fin 2) F) (OnePoint F)).homology 3) ≃+ preBloch F,
      ∀ z : intHomology (GL (Fin 2) F) 3, (psiGL2 F z : preBloch F) =
        e ((configHyperhomology.toCoinvariants _ _ 3).hom
          ((configHyperhomology.iso_groupHomology (GL (Fin 2) F) (OnePoint F) 3).inv.hom z)) := by sorry

theorem psiGL2_surjective (F : Type) [Field F] [Infinite F] : Function.Surjective (psiGL2 F) := by sorry

theorem psiGL2_natural {F E : Type} [Field F] [Field E] [Infinite F] [Infinite E] (f : F →+* E) :
    (psiGL2 E).comp (intHomologyMap (Matrix.GeneralLinearGroup.map f) 3) =
      (blochGroup.map F f).comp (psiGL2 F) := by sorry

/-- Test `psiGL2_surjective_test`. -/
example (F : Type) [Field F] [Infinite F] : Function.Surjective (psiGL2 F) := by sorry

/-- Test `psiGL2_coe_test`. -/
example (F : Type) [Field F] [DecidableEq F] [Infinite F] :
    ∃ e : ((configCoinvariants (GL (Fin 2) F) (OnePoint F)).homology 3) ≃+ preBloch F,
      ∀ z : intHomology (GL (Fin 2) F) 3, (psiGL2 F z : preBloch F) =
        e ((configHyperhomology.toCoinvariants _ _ 3).hom
          ((configHyperhomology.iso_groupHomology (GL (Fin 2) F) (OnePoint F) 3).inv.hom z)) := by sorry

/-- Test `psiGL2_not_onto_P`. -/
example : ((blochGroup ℚ).subtype.comp (psiGL2 ℚ)).range ≠ ⊤ ∧ preBloch.gen ℚ 2 ∉ blochGroup ℚ := by
  sorry

/-- Test `psiGL2_torus`. -/
example (F : Type) [Field F] [Infinite F] :
    (psiGL2 F).comp (intHomologyMap (diagonalSubgroup F 2).subtype 3) = 0 := by sorry

/-- V.4/psi-gl2: `H₁(GL₂) ≅ Fˣ`, `H₂(GL₂) ≅ ⋀²Fˣ ⊕ K₂(F)`, and
`H₃(M₂) → H₃(GL₂) → B(F) → 0` is exact, for an infinite field. -/
theorem psi_gl2 (F : Type) [Field F] [Infinite F] :
    Nonempty (intHomology (GL (Fin 2) F) 1 ≃+ Additive Fˣ) ∧
      Nonempty (intHomology (GL (Fin 2) F) 2 ≃+ (⋀[ℤ]^2 (Additive Fˣ)) × K 2 F) ∧
      Function.Exact (intHomologyMap (monomialSubgroup F 2).subtype 3) (psiGL2 F) ∧
      Function.Surjective (psiGL2 F) := by sorry

/-! ### V.4/cyclic-complex-d -/

section Cyclic

variable (X : Type)

/-- The rotation `(x₀, …, xₙ) ↦ (xₙ, x₀, …, x_{n-1})` of a tuple. -/
def rotEmb {n : ℕ} (t : Fin (n + 1) ↪ X) : Fin (n + 1) ↪ X := (finRotate (n + 1)).symm.toEmbedding.trans t

/-- The rotations `t_n` on `C_n(X)`. -/
def precyclicConfig (n : ℕ) : configChain X n →ₗ[ℤ] configChain X n :=
  Finsupp.lmapDomain ℤ ℤ fun t => rotEmb X t

theorem precyclicConfig_identities (n : ℕ) :
    precyclicConfig X n ^ (n + 1) = 1 ∧
      (∀ t : Fin (n + 2) ↪ X, configComplex.face X 0 (rotEmb X t) = configComplex.face X (Fin.last (n + 1)) t) ∧
      ∀ (j : Fin (n + 1)) (t : Fin (n + 2) ↪ X),
        configComplex.face X j.succ (rotEmb X t) = rotEmb X (configComplex.face X j.castSucc t) := by sorry

/-- The differential `dᵃ` omitting the last face. -/
def acyclicConfig.d (n : ℕ) : configChain X (n + 1) →ₗ[ℤ] configChain X n :=
  Finsupp.linearCombination ℤ fun t =>
    ∑ i : Fin (n + 1), ((-1 : ℤ) ^ (i : ℕ)) • configComplex.single X (configComplex.face X i.castSucc t)

/-- `Cᵃ_*(X)`. -/
def acyclicConfig : ChainComplex (ModuleCat ℤ) ℕ :=
  ChainComplex.of (fun n => ModuleCat.of ℤ (configChain X n))
    (fun n => ModuleCat.ofHom (acyclicConfig.d X n)) (by sorry)

theorem acyclicConfig_exact [Infinite X] (n : ℕ) : IsZero ((acyclicConfig X).homology n) := by sorry

/-- The norm `N = ∑_{i=0}^{n} ((-1)ⁿ tₙ)ⁱ`. -/
def normMap (n : ℕ) : configChain X n →ₗ[ℤ] configChain X n :=
  ∑ i ∈ Finset.range (n + 1), (((-1 : ℤ) ^ n) • precyclicConfig X n) ^ i

theorem normMap_comm (n : ℕ) :
    acyclicConfig.d X n ∘ₗ normMap X (n + 1) = normMap X n ∘ₗ configComplex.d X n := by sorry

/-- The cone `D_*`: `D₀ = Cᵃ₁`, `Dₙ = Cᵃ_{n+1} ⊕ Cₙ`, differential `(x, y) ↦ (dᵃx - Ny, -dy)`. -/
def coneD (X : Type) : ChainComplex (ModuleCat ℤ) ℕ := sorry

/-- The augmentation `ε : D₀ → ℤ`, `(x₀, x₁) ↦ 1`. -/
def coneD.aug : (coneD X).X 0 ⟶ ModuleCat.of ℤ ℤ := sorry

/-- For infinite `X`, `ε : D_* → ℤ` is a quasi-isomorphism. That the shifted cone of `N`
maps quasi-isomorphically to `C_*` and to `D_*` is not stated: Mathlib's mapping cones are
for `ℤ`-graded cochain complexes. -/
theorem coneD_quasiIso [Infinite X] :
    (∀ n, IsZero ((coneD X).homology (n + 1))) ∧ Nonempty ((coneD X).homology 0 ≅ ModuleCat.of ℤ ℤ) ∧
      Function.Surjective (coneD.aug X).hom := by sorry

/-- The action of a group acting on `X`. -/
def coneD.smul {G : Type} [Group G] [MulAction G X] (g : G) : coneD X ⟶ coneD X := sorry

/-- Test `acyclicity`. -/
example [Infinite X] : (∀ n, IsZero ((acyclicConfig X).homology n)) ∧
    Function.Surjective (acyclicConfig.d X 0) := by sorry

/-- Test `finite_failure`. -/
example : Nonempty ((acyclicConfig (Fin 3)).homology 2 ≅ ModuleCat.of ℤ (Fin 3 → ℤ)) ∧
    Nonempty ((acyclicConfig (Fin 4)).homology 3 ≅ ModuleCat.of ℤ (Fin 8 → ℤ)) := by sorry

/-- Test `norm_chain_map`. -/
example : acyclicConfig.d (Fin 3) 1 ∘ₗ normMap (Fin 3) 2 = normMap (Fin 3) 1 ∘ₗ configComplex.d (Fin 3) 1 ∧
    acyclicConfig.d (Fin 3) 1 ∘ₗ (∑ i ∈ Finset.range 3, ((-1 : ℤ) ^ i) • precyclicConfig (Fin 3) 2 ^ i) ≠
      (∑ i ∈ Finset.range 2, ((-1 : ℤ) ^ i) • precyclicConfig (Fin 3) 1 ^ i) ∘ₗ configComplex.d (Fin 3) 1 := by
  sorry

/-- Test `cone_degree_zero`. -/
example : Nonempty ((coneD X).X 0 ≅ (acyclicConfig X).X 1) ∧
    Nonempty ((coneD X).X 1 ≅ ModuleCat.of ℤ (configChain X 2 × configChain X 1)) := by sorry

/-- Test `cyclic_identities`. -/
example (n : ℕ) (h01 : Function.Injective ![(0 : Fin 2), 1]) (h10 : Function.Injective ![(1 : Fin 2), 0]) :
    precyclicConfig X n ^ (n + 1) = 1 ∧
      precyclicConfig (Fin 2) 1 (configComplex.single _ ⟨_, h01⟩) = configComplex.single _ ⟨_, h10⟩ := by
  sorry

end Cyclic

/-! ### V.4/general-position-complex -/

section GeneralPosition

variable (F : Type) [Field F]

/-- The projective plane `ℙ²(F)`. -/
abbrev P2 : Type := ℙ F (Fin 3 → F)

/-- No three of the points are collinear. -/
def GenPos {n : ℕ} (t : Fin (n + 1) ↪ P2 F) : Prop :=
  ∀ i j k : Fin (n + 1), i ≠ j → j ≠ k → i ≠ k → Projectivization.Independent ![t i, t j, t k]

/-- `GP_n ⊆ C_n(ℙ²(F))`. -/
def gpChain (n : ℕ) : Submodule ℤ (configChain (P2 F) n) :=
  Submodule.span ℤ ((fun t => configComplex.single (P2 F) t) '' {t | GenPos F t})

/-- V.4/general-position-complex: `GP_*`. -/
def gpComplex : ChainComplex (ModuleCat ℤ) ℕ :=
  ChainComplex.of (fun n => ModuleCat.of ℤ (gpChain F n))
    (fun n => ModuleCat.ofHom ((configComplex.d (P2 F) n).restrict (p := gpChain F (n + 1))
      (q := gpChain F n) (by sorry))) (by sorry)

/-- The inclusion `GP_* ⊆ C_*(ℙ²(F))`. -/
def gpComplex.le : gpComplex F ⟶ configComplex (P2 F) where
  f n := ModuleCat.ofHom (gpChain F n).subtype
  comm' := by sorry

/-- The `GL₃(F)`-action. -/
def gpComplex.smul (g : GL (Fin 3) F) : gpComplex F ⟶ gpComplex F := sorry

theorem gpComplex.rotate {n : ℕ} (t : Fin (n + 1) ↪ P2 F) (ht : GenPos F t) : GenPos F (rotEmb _ t) := by
  sorry

theorem gpComplex.aug_quasiIso [Infinite F] :
    (∀ n, IsZero ((gpComplex F).homology (n + 1))) ∧ Nonempty ((gpComplex F).homology 0 ≅ ModuleCat.of ℤ ℤ) := by
  sorry

/-- Test `frame_orbit`. -/
example (t t' : Fin 4 ↪ P2 F) (ht : GenPos F t) (ht' : GenPos F t') : ∃ g : GL (Fin 3) F, g • t = t' := by
  sorry

/-- Test `collinear_excluded`. -/
example (h1 : ![(1 : F), 0, 0] ≠ 0) (h2 : ![(0 : F), 1, 0] ≠ 0) (h3 : ![(1 : F), 1, 0] ≠ 0)
    (hinj : Function.Injective ![Projectivization.mk F _ h1, Projectivization.mk F _ h2,
      Projectivization.mk F _ h3]) :
    ¬ GenPos F ⟨_, hinj⟩ := by sorry

/-- Test `rotation_stable`. -/
example {n : ℕ} (t : Fin (n + 2) ↪ P2 F) (ht : GenPos F t) :
    GenPos F (rotEmb _ t) ∧ ∀ i : Fin (n + 2), GenPos F (configComplex.face _ i t) := by sorry

/-- Test `small_field`. -/
example (n : ℕ) (hn : 4 ≤ n) : gpChain (ZMod 2) n = ⊥ := by sorry

end GeneralPosition

/-! ### V.4/psi3-map, V.4/psi-gl3 -/

/-- The cone complex `D_*` of the general-position complex, with its `GL₃(F)`-action. -/
def coneDGP (F : Type) [Field F] : ChainComplex (Rep.{0} ℤ (GL (Fin 3) F)) ℕ := sorry

/-- `D_G = D_* ⊗_{GL₃(F)} ℤ`. -/
abbrev coneDGPCoinv (F : Type) [Field F] : ChainComplex (ModuleCat ℤ) ℕ :=
  ((Rep.coinvariantsFunctor ℤ (GL (Fin 3) F)).mapHomologicalComplex _).obj (coneDGP F)

/-- The generator `P = (p₁, p₂, q, p₃)` of `(D_G)₃`. -/
def psiPrime.P (F : Type) [Field F] : (coneDGPCoinv F).X 3 := sorry

/-- The generator `[a; x] = (p₁, p₂, q, (1 : a : x), p₃)` of `(D_G)₃`. -/
def psiPrime.gen (F : Type) [Field F] (a x : F) : (coneDGPCoinv F).X 3 := sorry

/-- The rotation on `(D_G)₃`. -/
def psiPrime.rotate (F : Type) [Field F] : (coneDGPCoinv F).X 3 →ₗ[ℤ] (coneDGPCoinv F).X 3 := sorry

/-- `ψ′ : (D_G)₃ → P(F)`, `ψ′([a; x]) = [a]`, `ψ′(P) = -2c`. -/
def psiPrime (F : Type) [Field F] : (coneDGPCoinv F).X 3 →ₗ[ℤ] preBloch F := sorry

theorem psiPrime_comp_d (F : Type) [Field F] : psiPrime F ∘ₗ ((coneDGPCoinv F).d 4 3).hom = 0 := by sorry

/-- V.4/psi3-map: `ψ : H₃(GL₃(F), ℤ) → P(F)` for an infinite field. -/
def psiGL3 (F : Type) [Field F] [Infinite F] : intHomology (GL (Fin 3) F) 3 →+ preBloch F := sorry

theorem psiGL3_natural {F E : Type} [Field F] [Field E] [Infinite F] [Infinite E] (f : F →+* E) :
    (psiGL3 E).comp (intHomologyMap (Matrix.GeneralLinearGroup.map f) 3) =
      (preBloch.map F f).comp (psiGL3 F) := by sorry

/-- The extension of `ψ` to the stable `H₃(GL(F), ℤ)`. -/
def psiGL3_stable (F : Type) [Field F] [Infinite F] : intHomology (GLinf F) 3 →+ preBloch F := sorry

theorem psiGL3_stable_comp (F : Type) [Field F] [Infinite F] :
    (psiGL3_stable GLinf F).comp (intHomologyMap (glToInf 3 F) 3) = psiGL3 F := by sorry

/-- Test `psi3_std`. -/
example (F : Type) [Field F] (p : Admissible F) :
    psiPrime F (psiPrime.gen F p.x p.y) = preBloch.gen F p.x := by sorry

/-- Test `psi3_norm`. -/
example (F : Type) [Field F] [Infinite F] (p : Admissible F) :
    ∑ i ∈ Finset.range 5, psiPrime F ((psiPrime.rotate F ^ i) (psiPrime.gen F p.x p.y)) =
        (2 : ℕ) • (BlochGroup.c F : preBloch F) ∧
      psiPrime F (psiPrime.P F) = -((2 : ℕ) • (BlochGroup.c F : preBloch F)) := by sorry

/-- Test `psi3_five_term`. -/
example (F : Type) [Field F] [Infinite F] (z : (coneDGPCoinv F).X 4) :
    psiPrime F (((coneDGPCoinv F).d 4 3).hom z) = 0 := by sorry

/-- Test `psi3_not_B`. -/
example (x : ℚ) : psiPrime ℚ (psiPrime.gen ℚ 2 x) = preBloch.gen ℚ 2 ∧ preBloch.gen ℚ 2 ∉ blochGroup ℚ := by
  sorry

/-- V.4/psi-gl3: the image of `ψ` is `B(F)`, and `H₃(M₂) ⊕ H₃(T₃) → H₃(GL₃) → B(F) → 0` is exact. -/
theorem psi_gl3 (F : Type) [Field F] [Infinite F] :
    (psiGL3 F).range = blochGroup F ∧
      Function.Exact ((intHomologyMap ((glIncl F (by norm_num : 2 ≤ 3)).comp (monomialSubgroup F 2).subtype) 3).coprod
        (intHomologyMap (diagonalSubgroup F 3).subtype 3)) (psiGL3 F) := by sorry

/-- V.4/psi-compatibility. -/
theorem psi_compatibility (F : Type) [Field F] [Infinite F] :
    (psiGL3 F).comp (intHomologyMap (glIncl F (by norm_num : 2 ≤ 3)) 3) =
      (blochGroup F).subtype.comp (psiGL2 F) := by sorry

/-- V.4/psi3-torus-vanishing (the statement about `D_* ⊗_{T₃} ℤ` is not stated). -/
theorem psi3_torus_vanishing (F : Type) [Field F] [Infinite F] :
    (psiGL3 F).comp (intHomologyMap (diagonalSubgroup F 3).subtype 3) = 0 := by sorry

/-- V.4/h3-gl3-generation. -/
theorem h3_gl3_generation (F : Type) [Field F] [Infinite F] :
    (intHomologyMap (diagonalSubgroup F 3).subtype 3).range ⊔
      (intHomologyMap (glIncl F (by norm_num : 2 ≤ 3)) 3).range = ⊤ := by sorry

/-- V.4/homological-stability. -/
theorem homological_stability (F : Type) [Field F] [Infinite F] :
    (∀ n r : ℕ, n ≤ r → Function.Bijective (intHomologyMap (glIncl F (Nat.le_succ r)) n)) ∧
      (∀ n r : ℕ, n ≤ r → Function.Bijective (intHomologyMap (glToInf r F) n)) ∧
      ∀ n : ℕ, Nonempty ((intHomology (GL (Fin (n + 1)) F) (n + 1) ⧸
        (intHomologyMap (glIncl F (Nat.le_succ n)) (n + 1)).range) ≃+ MilnorK (n + 1) F) := by sorry

/-- V.4/dupont-sah-identity. -/
theorem dupont_sah_identity (F : Type) [Field F] (hF : 4 ≤ ENat.card F) (x : F) (hx0 : x ≠ 0)
    (hx1 : x ≠ 1) (hx2 : x ≠ -1) :
    preBloch.gen F (x ^ 2) = (2 : ℤ) • (preBloch.gen F x + preBloch.gen F (-x) + preBloch.gen F (-1)) ∧
      preBloch.gen F (x ^ 2) + (2 : ℤ) • preBloch.gen F (-x⁻¹) - (2 : ℤ) • preBloch.gen F (x - 1) -
          preBloch.gen F ((1 - x) ^ 2)⁻¹ = (2 : ℕ) • (BlochGroup.c F : preBloch F) := by sorry

/-- V.4/alternating-group-image. -/
theorem alternating_group_image (F : Type) [Field F] [Infinite F] :
    ((psiGL3 F).comp (intHomologyMap (((alternatingGroup (Fin 3)).map (permHom F 3)).subtype) 3)).range =
      AddSubgroup.zmultiples ((2 : ℕ) • (BlochGroup.c F : preBloch F)) := by sorry

/-- V.4/symmetric-group-image. -/
theorem symmetric_group_image (F : Type) [Field F] [Infinite F] :
    ((psiGL3_stable GLinf F).comp (intHomologyMap (permInf GLinf glToInf F).subtype 3)).range =
        AddSubgroup.zmultiples ((2 : ℕ) • (BlochGroup.c F : preBloch F)) ∧
      (3 : ℕ) • ((2 : ℕ) • (BlochGroup.c F : preBloch F)) = 0 := by sorry

/-- V.4/monomial-sequence. -/
theorem monomial_sequence (F : Type) [Field F] [Infinite F] :
    Function.Exact
        ((intHomologyMap (monomialInf GLinf glToInf F).subtype 3).prod
          (intHomologyMap (monomialInf.toPerm GLinf glToInf F) 3))
        ((psiGL3_stable GLinf F).coprod
          (-((psiGL3_stable GLinf F).comp (intHomologyMap (permInf GLinf glToInf F).subtype 3)))) ∧
      ((psiGL3_stable GLinf F).coprod
          (-((psiGL3_stable GLinf F).comp (intHomologyMap (permInf GLinf glToInf F).subtype 3)))).range =
        blochGroup F := by sorry

/-! ### V.4/enhanced-mu -/

/-- `Tor₁^ℤ(μ(F), μ(F))`, the pinned Mathlib `Tor` of `ℤ`-modules. -/
abbrev torRoots (F : Type) [Field F] : ModuleCat ℤ :=
  ((CategoryTheory.Tor (ModuleCat ℤ) 1).obj (ModuleCat.of ℤ (Additive (CommGroup.torsion Fˣ)))).obj
    (ModuleCat.of ℤ (Additive (CommGroup.torsion Fˣ)))

/-- V.4/enhanced-mu: `μ̃(F) = {ζ ∈ (F̄)ˣ : ζ² ∈ μ(F)}` in `AlgebraicClosure F`. -/
def enhancedRootsOfUnity (F : Type) [Field F] : Subgroup (AlgebraicClosure F)ˣ :=
  ((CommGroup.torsion Fˣ).map (Units.map (algebraMap F (AlgebraicClosure F)).toMonoidHom)).comap
    (powMonoidHom 2)

/-- The surjection `ζ ↦ ζ²` onto `μ(F)`. -/
def enhancedRootsOfUnity.toRoots (F : Type) [Field F] :
    enhancedRootsOfUnity F →* CommGroup.torsion Fˣ := sorry

theorem enhancedRootsOfUnity.toRoots_surjective (F : Type) [Field F] :
    Function.Surjective (enhancedRootsOfUnity.toRoots F) ∧
      (enhancedRootsOfUnity.toRoots F).ker =
        (rootsOfUnity 2 (AlgebraicClosure F)).subgroupOf (enhancedRootsOfUnity F) := by sorry

theorem enhancedRootsOfUnity.odd_eq (F : Type) [Field F] (h : ringChar F = 2) :
    Function.Bijective (enhancedRootsOfUnity.toRoots F) := by sorry

theorem enhancedRootsOfUnity.even_card (F : Type) [Field F] (h : ringChar F ≠ 2)
    [Finite (CommGroup.torsion Fˣ)] :
    IsCyclic (enhancedRootsOfUnity F) ∧
      Nat.card (enhancedRootsOfUnity F) = 2 * Nat.card (CommGroup.torsion Fˣ) ∧
      ¬ ∃ s : CommGroup.torsion Fˣ →* enhancedRootsOfUnity F,
        (enhancedRootsOfUnity.toRoots F).comp s = MonoidHom.id _ := by sorry

theorem enhancedRootsOfUnity.finite_eq (F : Type) [Field F] (n : ℕ)
    (h : Even (Nat.card (rootsOfUnity n F))) :
    IsCyclic (((rootsOfUnity n F).subgroupOf (CommGroup.torsion Fˣ)).comap (enhancedRootsOfUnity.toRoots F)) ∧
      Nat.card (((rootsOfUnity n F).subgroupOf (CommGroup.torsion Fˣ)).comap (enhancedRootsOfUnity.toRoots F)) =
        2 * Nat.card (rootsOfUnity n F) := by sorry

/-- Functoriality for a field embedding with a compatible embedding of algebraic closures. -/
def enhancedRootsOfUnity.map {F L : Type} [Field F] [Field L] (f : F →+* L)
    (τ : AlgebraicClosure F →+* AlgebraicClosure L)
    (hτ : ∀ x, τ (algebraMap F _ x) = algebraMap L _ (f x)) :
    enhancedRootsOfUnity F →* enhancedRootsOfUnity L := sorry

theorem enhancedRootsOfUnity.map_injective {F L : Type} [Field F] [Field L] (f : F →+* L)
    (τ : AlgebraicClosure F →+* AlgebraicClosure L)
    (hτ : ∀ x, τ (algebraMap F _ x) = algebraMap L _ (f x)) :
    Function.Injective (enhancedRootsOfUnity.map f τ hτ) ∧
      ∀ z, ((enhancedRootsOfUnity.map f τ hτ z : (AlgebraicClosure L)ˣ)) = Units.map τ.toMonoidHom z := by
  sorry

/-! ### V.4/pi3ind-definition, V.4/enhanced-tor -/

/-- The plus construction `BM⁺` of the monomial group of `F`. -/
def bMPlus (F : Type) [Field F] : TopCat := sorry

/-- Its base point. -/
def bMPlus.basepoint (F : Type) [Field F] : bMPlus F := sorry

/-- The map `π₃(BM⁺) → K₃(F)`. -/
def bMPlus.toK3 (F : Type) [Field F] : Additive (π_ 3 (bMPlus F) (bMPlus.basepoint F)) →+ K 3 F := sorry

/-- V.4/pi3ind-definition: `π₃^ind(BM⁺)`. -/
def pi3Ind (F : Type) [Field F] : Type := sorry

instance (F : Type) [Field F] : AddCommGroup (pi3Ind F) := sorry

/-- The quotient map `π₃(BM⁺) → π₃^ind(BM⁺)`. -/
def pi3Ind.mk (F : Type) [Field F] : Additive (π_ 3 (bMPlus F) (bMPlus.basepoint F)) →+ pi3Ind F := sorry

/-- The map to `π₃ˢ/(η³) ≅ ℤ/12`. -/
def pi3Ind.toStable (F : Type) [Field F] : pi3Ind F →+ ZMod 12 := sorry

/-- The map to `K₃^ind(F)`. -/
def pi3Ind.toK3ind (F : Type) [Field F] : pi3Ind F →+ K3ind' F := sorry

/-- Naturality for field homomorphisms. -/
def pi3Ind.map {F L : Type} [Field F] [Field L] (f : F →+* L) : pi3Ind F →+ pi3Ind L := sorry

/-- Test `pi3ind_F2`. -/
example : Nonempty (pi3Ind (ZMod 2) ≃+ ZMod 12) := by sorry

/-- Test `pi3ind_toStable_split`. -/
example (F : Type) [Field F] : ∃ s : ZMod 12 →+ pi3Ind F, (pi3Ind.toStable F).comp s = AddMonoidHom.id _ := by
  sorry

/-- Test `pi3ind_not_pi3`. -/
example : Nonempty (π_ 3 (bMPlus (ZMod 2)) (bMPlus.basepoint _) ≃* Multiplicative (ZMod 24)) ∧
    Nonempty (pi3Ind (ZMod 2) ≃+ ZMod 12) := by sorry

/-- Test `pi3ind_Q`. -/
example : Nonempty (pi3Ind ℚ ≃+ ZMod 4 × ZMod 12) := by sorry

/-- V.4/enhanced-tor: `T̃(F) = ker(π₃^ind(BM⁺) → ℤ/12)`. -/
def enhancedTor (F : Type) [Field F] : AddSubgroup (pi3Ind F) := (pi3Ind.toStable F).ker

/-- The surjection onto `Tor₁(μ(F), μ(F))`. -/
def enhancedTor.toTor (F : Type) [Field F] : enhancedTor F →+ torRoots F := sorry

theorem enhancedTor.toTor_surjective (F : Type) [Field F] :
    Function.Surjective (enhancedTor.toTor F) ∧
      Nonempty ((enhancedTor.toTor F).ker ≃+ Additive (rootsOfUnity 2 F)) := by sorry

/-- Naturality. -/
def enhancedTor.map {F L : Type} [Field F] [Field L] (f : F →+* L) : enhancedTor F →+ enhancedTor L :=
  ((pi3Ind.map f).comp (enhancedTor F).subtype).codRestrict (enhancedTor L) (by sorry)

theorem enhancedTor.map_id (F : Type) [Field F] : enhancedTor.map (RingHom.id F) = AddMonoidHom.id _ := by
  sorry

theorem enhancedTor.map_comp {F L E : Type} [Field F] [Field L] [Field E] (f : F →+* L) (g : L →+* E) :
    enhancedTor.map (g.comp f) = (enhancedTor.map g).comp (enhancedTor.map f) := by sorry

theorem enhancedTor.char_two (F : Type) [Field F] (h : ringChar F = 2) :
    Function.Bijective (enhancedTor.toTor F) := by sorry

theorem enhancedTor.nonsplit (F : Type) [Field F] (h : ringChar F ≠ 2) :
    ¬ ∃ s : torRoots F →+ enhancedTor F, (enhancedTor.toTor F).comp s = AddMonoidHom.id _ := by sorry

/-- An isomorphism `T̃(F) ≅ μ̃(F)`, depending on a choice; not natural in `F`. -/
def enhancedTor.equivEnhancedMu (F : Type) [Field F] :
    enhancedTor F ≃+ Additive (enhancedRootsOfUnity F) := sorry

theorem enhancedRootsOfUnity.ne_tor (F : Type) [Field F] :
    Nonempty (Additive (enhancedRootsOfUnity F) ≃+ enhancedTor F) := by sorry

/-- Test `characteristic_two`. -/
example (F : Type) [Field F] (h : ringChar F = 2) :
    Function.Bijective (enhancedRootsOfUnity.toRoots F) := by sorry

/-- Test `rational_numbers`. -/
example : Nonempty (enhancedRootsOfUnity ℚ ≃* Multiplicative (ZMod 4)) ∧
    Nat.card (CommGroup.torsion ℚˣ) = 2 := by sorry

/-- Test `finite_field`. -/
example : Nonempty (enhancedRootsOfUnity (ZMod 5) ≃* Multiplicative (ZMod 8)) := by sorry

/-- Test `nonsplit`. -/
example (F : Type) [Field F] (h : ringChar F ≠ 2) :
    ¬ ∃ s : CommGroup.torsion Fˣ →* enhancedRootsOfUnity F,
      (enhancedRootsOfUnity.toRoots F).comp s = MonoidHom.id _ := by sorry

/-- Test `not_ordinary_tor`. -/
example : Nat.card (torRoots ℚ) = 2 ∧ Nat.card (enhancedRootsOfUnity ℚ) = 4 := by sorry

/-- Test `enhancedTor_Q`. -/
example : Nonempty (enhancedTor ℚ ≃+ ZMod 4) ∧ Nat.card (torRoots ℚ) = 2 := by sorry

/-- Test `enhancedTor_char2`. -/
example (F : Type) [Field F] (h : ringChar F = 2) : Function.Bijective (enhancedTor.toTor F) := by sorry

/-- Test `enhancedTor_galois`: over `ℚ(ζ₃)`, complex conjugation shows that no isomorphism
`T̃(F) ≅ μ̃(F)` commutes with it. -/
example : ∃ σ : CyclotomicField 3 ℚ →+* CyclotomicField 3 ℚ,
    ∀ (τ : AlgebraicClosure (CyclotomicField 3 ℚ) →+* AlgebraicClosure (CyclotomicField 3 ℚ))
      (hτ : ∀ x, τ (algebraMap _ _ x) = algebraMap _ _ (σ x)),
      ¬ ∃ e : enhancedTor (CyclotomicField 3 ℚ) ≃+ Additive (enhancedRootsOfUnity (CyclotomicField 3 ℚ)),
        ∀ z, e (enhancedTor.map σ z) =
          Additive.ofMul (enhancedRootsOfUnity.map σ τ hτ (Additive.toMul (e z))) := by sorry

/-- Test `enhancedTor_nonsplit`. -/
example (F : Type) [Field F] (h : ringChar F ≠ 2) :
    ¬ ∃ s : torRoots F →+ enhancedTor F, (enhancedTor.toTor F).comp s = AddMonoidHom.id _ := by sorry

/-! ### Suslin's map and the remaining V.4 theorems -/

/-- The composite `K₃(F) ≅ H₃(St(F)) → H₃(GL(F)) → P(F)` (Hurewicz, then the stable `ψ`). -/
def suslinK3Map (F : Type) [Field F] [Infinite F] : K 3 F →+ preBloch F :=
  (psiGL3_stable GLinf F).comp ((intHomologyMap (stToGL F) 3).comp (k3EquivH3Steinberg K St F).toAddMonoidHom)

/-- The induced map `K₃^ind(F) → B(F)`. -/
def suslinMap (F : Type) [Field F] [Infinite F] : K3ind' F →+ blochGroup F :=
  K3ind.lift K MilnorK milnorToQuillen F
    ((suslinK3Map K GLinf St stToGL F).codRestrict (blochGroup F) (by sorry)) (by sorry)

/-- The inclusion `T̃(F) → K₃^ind(F)`. -/
def enhancedTorToK3ind (F : Type) [Field F] : enhancedTor F →+ K3ind' F :=
  (pi3Ind.toK3ind K MilnorK milnorToQuillen F).comp (enhancedTor F).subtype

/-- V.4/pi3-bm-plus: the cokernel of `π₃(BM⁺) → K₃(F)` is `B(F)/⟨2c⟩`. The exact sequence
through `π₃ˢ` is not stated: it needs the map `π₃(BM⁺) → π₃ˢ`. -/
theorem pi3_bm_plus (F : Type) [Field F] [Infinite F] :
    Nonempty ((K 3 F ⧸ (bMPlus.toK3 K F).range) ≃+
      (blochGroup F ⧸ AddSubgroup.zmultiples ((2 : ℕ) • BlochGroup.c F))) := by sorry

/-- V.4/pi3ind-sequence. -/
theorem pi3ind_sequence (F : Type) [Field F] [Infinite F] :
    ∃ β : ZMod 12 →+ blochGroup F,
      Function.Exact ((pi3Ind.toK3ind K MilnorK milnorToQuillen F).prod (pi3Ind.toStable F))
          ((suslinMap K GLinf St stToGL MilnorK milnorToQuillen F).coprod (-β)) ∧
        Function.Surjective ((suslinMap K GLinf St stToGL MilnorK milnorToQuillen F).coprod (-β)) := by sorry

/-- V.4/pi3ind-ahss. -/
theorem pi3ind_ahss (F : Type) [Field F] :
    ∃ (i : Additive (rootsOfUnity 2 F) →+ pi3Ind F) (γ : pi3Ind F →+ torRoots F × ZMod 12),
      Function.Injective i ∧ Function.Exact i γ ∧ Function.Surjective γ := by sorry

/-- V.4/pi3ind-bm-plus: `π₃^ind(BM⁺) ≅ T̃(F) ⊕ ℤ/12`, and abstractly `T̃(F) ≅ μ̃(F)`. -/
theorem pi3ind_bm_plus (F : Type) [Field F] :
    Nonempty (pi3Ind F ≃+ enhancedTor F × ZMod 12) ∧
      Nonempty (enhancedTor F ≃+ Additive (enhancedRootsOfUnity F)) := by sorry

-- V.4/delta-squaring: not stated; needs the map `δ : H₃(μ(F), ℤ) → π₃^ind(BM⁺)`.
-- V.4/e-invariant-detection: not stated; needs `δ` and the e-invariant
-- `K₃^ind(F) → H⁰(F, μ^{⊗2})` (MotivicEtaleKTheory M.7).

/-- V.4/suslin-exact-sequence: `0 → T̃(F) → K₃^ind(F) → B(F) → 0` for an infinite field. -/
theorem suslin_exact (F : Type) [Field F] [Infinite F] :
    Function.Injective (enhancedTorToK3ind K MilnorK milnorToQuillen F) ∧
      Function.Exact (enhancedTorToK3ind K MilnorK milnorToQuillen F)
        (suslinMap K GLinf St stToGL MilnorK milnorToQuillen F) ∧
      Function.Surjective (suslinMap K GLinf St stToGL MilnorK milnorToQuillen F) := by sorry

/-- V.4/tor-form-comparison: (i) `T̃(F) ≅ μ̃(F)` abstractly; (ii) no isomorphism commutes with
complex conjugation on `ℚ(ζ₃)`; (iii) the ordinary Tor group cannot replace `T̃(ℚ)`. -/
theorem tor_form_comparison (F : Type) [Field F] :
    Nonempty (enhancedTor F ≃+ Additive (enhancedRootsOfUnity F)) ∧
      (∃ σ : CyclotomicField 3 ℚ →+* CyclotomicField 3 ℚ,
        ∀ (τ : AlgebraicClosure (CyclotomicField 3 ℚ) →+* AlgebraicClosure (CyclotomicField 3 ℚ))
          (hτ : ∀ x, τ (algebraMap _ _ x) = algebraMap _ _ (σ x)),
          ¬ ∃ e : enhancedTor (CyclotomicField 3 ℚ) ≃+ Additive (enhancedRootsOfUnity (CyclotomicField 3 ℚ)),
            ∀ z, e (enhancedTor.map σ z) =
              Additive.ofMul (enhancedRootsOfUnity.map σ τ hτ (Additive.toMul (e z)))) ∧
      ¬ ∃ (i : torRoots ℚ →+ K3ind' ℚ) (p : K3ind' ℚ →+ blochGroup ℚ),
        Function.Injective i ∧ Function.Exact i p ∧ Function.Surjective p := by sorry

/-- V.4/suslin-functoriality. -/
theorem suslin_functoriality {F L : Type} [Field F] [Field L] [Infinite F] [Infinite L] (f : F →+* L) :
    (suslinMap K GLinf St stToGL MilnorK milnorToQuillen L).comp (K3ind.map K Kmap MilnorK milnorToQuillen f) =
        (blochGroup.map F f).comp (suslinMap K GLinf St stToGL MilnorK milnorToQuillen F) ∧
      (K3ind.map K Kmap MilnorK milnorToQuillen f).comp (enhancedTorToK3ind K MilnorK milnorToQuillen F) =
        (enhancedTorToK3ind K MilnorK milnorToQuillen L).comp (enhancedTor.map f) ∧
      (suslinK3Map K GLinf St stToGL F).comp (m3 F) = 0 := by sorry

end TauCeti.Suslin

/-! ## V.5 Concrete K₃ calculations -/

namespace TauCeti.K3

open TauCeti.BlochGroup TauCeti.Suslin

local notation "K3ind'" => K3ind K MilnorK milnorToQuillen
local notation "m3" => milnorToQuillen3 K MilnorK milnorToQuillen

/-- V.5/milnor-k3-finite-field. -/
theorem milnorK3_finiteField (F : Type) [Field F] [Finite F] :
    Subsingleton (MilnorK 3 F) ∧ Function.Bijective (K3ind.mk K MilnorK milnorToQuillen F) := by sorry

/-- V.5/k3-finite-field: `K₃(𝔽_q) ≅ ℤ/(q² - 1)`, including `q = 2, 3`. -/
theorem k3_finiteField (F : Type) [Field F] [Finite F] :
    Nonempty (K 3 F ≃+ ZMod (Nat.card F ^ 2 - 1)) := by sorry

/-- V.5/finite-field-transfer (the identification of the image with the Galois invariants is
stated through its order, which determines it in a cyclic group). -/
theorem finite_field_transfer (F L : Type) [Field F] [Field L] [Finite F] [Finite L] [Algebra F L] :
    Function.Injective (Kmap 3 (algebraMap F L)) ∧
      Nat.card (Kmap 3 (algebraMap F L)).range = Nat.card F ^ 2 - 1 ∧
      Function.Surjective (transfer3 : K 3 L →+ K 3 F) ∧
      (transfer3 : K 3 L →+ K 3 F).comp (Kmap 3 (algebraMap F L)) =
        Module.finrank F L • AddMonoidHom.id (K 3 F) ∧
      (Kmap 3 (algebraMap F L)).comp (transfer3 : K 3 L →+ K 3 F) =
        ((Nat.card L ^ 2 - 1) / (Nat.card F ^ 2 - 1)) • AddMonoidHom.id (K 3 L) := by sorry

/-- V.5/bloch-group-finite-field. -/
theorem bloch_finiteField_card (F : Type) [Field F] [Finite F] (h : 4 ≤ Nat.card F) :
    IsAddCyclic (blochGroup F) ∧
      Nat.card (blochGroup F) = if Odd (Nat.card F) then (Nat.card F + 1) / 2 else Nat.card F + 1 := by
  sorry

/-- V.5/k3-Z-and-Q. -/
theorem k3_int_eq_k3_rat :
    Nonempty (K 3 ℤ ≃+ ZMod 48) ∧ Nonempty (K 3 ℚ ≃+ ZMod 48) ∧
      Function.Bijective (Kmap 3 (Int.castRingHom ℚ)) ∧ m3 ℚ (milnorSymbol3 (-1) (-1) (-1)) ≠ 0 ∧
      ∀ e : K 3 ℚ →+ ZMod 24, ¬ Function.Injective e := by sorry

/-- V.5/k3-Q-splitting. -/
theorem k3_rat_splitting :
    Nonempty (MilnorK 3 ℚ ≃+ ZMod 2) ∧
      AddSubgroup.zmultiples (milnorSymbol3 (-1 : ℚˣ) (-1) (-1)) = ⊤ ∧ Function.Injective (m3 ℚ) ∧
      Nonempty (K3ind' ℚ ≃+ ZMod 24) ∧ Nonempty (enhancedRootsOfUnity ℚ ≃* Multiplicative (ZMod 4)) ∧
      Nonempty (blochGroup ℚ ≃+ ZMod 6) ∧
      (BlochGroup.c ℚ : preBloch ℚ) = preBloch.gen ℚ 2 + preBloch.gen ℚ (-1) ∧
      (6 : ℕ) • BlochGroup.c ℚ = 0 := by sorry

/-- V.5/element-c-order-six. -/
theorem element_c_order_six :
    addOrderOf (BlochGroup.c ℚ) = 6 ∧ addOrderOf (BlochGroup.c ℝ) = 6 ∧
      AddSubgroup.zmultiples (BlochGroup.c ℚ) = ⊤ := by sorry

/-- V.5/k3-number-field (Weibel VI.5.3), with `w = w₂(F)`. -/
theorem k3_numberField (F : Type) [Field F] [NumberField F] :
    Nonempty (K3ind' F ≃+
        (Fin (NumberField.InfinitePlace.nrComplexPlaces F) → ℤ) × ZMod (adamsBott2 F)) ∧
      (NumberField.InfinitePlace.nrRealPlaces F = 0 →
        Nonempty (K 3 F ≃+
          (Fin (NumberField.InfinitePlace.nrComplexPlaces F) → ℤ) × ZMod (adamsBott2 F))) ∧
      (0 < NumberField.InfinitePlace.nrRealPlaces F →
        Nonempty (K 3 F ≃+ (Fin (NumberField.InfinitePlace.nrComplexPlaces F) → ℤ) ×
          ZMod (2 * adamsBott2 F) × (Fin (NumberField.InfinitePlace.nrRealPlaces F - 1) → ZMod 2))) := by
  sorry

/-- V.5/k3-gaussian: `K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24`, the free summand only as an existence. -/
theorem k3_gaussian : Nonempty (K 3 (CyclotomicField 4 ℚ) ≃+ ℤ × ZMod 24) := by sorry

/-- V.5/bloch-finite-field-mod-n, as abstract isomorphisms only. The actual finite-field map
from V.5/finite-field-bloch-comparison (Hutchinson Corollary 7.5) is not yet
stated; the Suslin map in this prototype is defined only for infinite fields. -/
theorem bloch_finite_field_mod_n (F : Type) [Field F] [Finite F] (h : 4 ≤ Nat.card F) (n : ℕ)
    (hn : Odd n) (hcop : Nat.Coprime n (Nat.card F - 1)) :
    Nonempty ((K 3 F ⧸ (nsmulAddMonoidHom (α := K 3 F) n).range) ≃+
        (blochGroup F ⧸ (nsmulAddMonoidHom (α := blochGroup F) n).range)) ∧
      IsAddCyclic (K 3 F ⧸ (nsmulAddMonoidHom (α := K 3 F) n).range) ∧
      Nat.card (K 3 F ⧸ (nsmulAddMonoidHom (α := K 3 F) n).range) = Nat.gcd n (Nat.card F + 1) ∧
      Nonempty ((blochGroup F ⧸ (nsmulAddMonoidHom (α := blochGroup F) n).range) ≃+
        (cgzBloch F ⧸ (nsmulAddMonoidHom (α := cgzBloch F) n).range)) := by sorry

end TauCeti.K3

/-! ## V.3 Bloch-Wigner pointers (the analytic function is imported from Polylogarithms P.1) -/

namespace TauCeti.BlochGroup

variable
  -- Polylogarithms P.2/bloch-wigner-descent: the descended map `B(ℂ) → ℝ`
  (bwDescent : blochGroup ℂ →+ ℝ)
  -- Polylogarithms P.2/weight-two-regulator and the Borel regulator on `K₃`
  (weightTwoReg : ∀ (F : Type) [Field F] [NumberField F], blochGroup F →+ (NumberField.InfinitePlace F → ℝ))
  (borelReg : ∀ (F : Type) [Field F] [NumberField F], K 3 F →+ (NumberField.InfinitePlace F → ℝ))

/-- V.3/bloch-wigner-dilogarithm (pointer): the imported `D` vanishes on real points, so the
descended map vanishes on classes from `B(ℝ)`, in particular on `c ∈ B(ℚ)`. -/
theorem blochWigner_real_vanishing :
    (∀ x : ℝ, blochWignerD (x : ℂ) = 0) ∧
      (∀ z : blochGroup ℝ, bwDescent (blochGroup.map ℝ (algebraMap ℝ ℂ) z) = 0) ∧
      bwDescent (blochGroup.map ℚ (algebraMap ℚ ℂ) (BlochGroup.c ℚ)) = 0 := by sorry

/-- V.3/bloch-wigner-five-term (pointer): a homomorphism to a torsion-free group kills `c` and
every `⟨x⟩`, and `κ` is a rational isomorphism, so no real regulator separates the conventions. -/
theorem torsionFree_cannot_separate (F : Type) [Field F] (hF : 4 ≤ ENat.card F) :
    (∀ (A : Type) [AddCommGroup A] [IsAddTorsionFree A] (φ : preBloch F →+ A),
      φ (BlochGroup.c F) = 0 ∧ ∀ x : F, x ≠ 0 → φ (angle F x) = 0) ∧
      (∀ (A : Type) [AddCommGroup A] [IsAddTorsionFree A] (φ : blochGroup F →+ A), φ (BlochGroup.c F) = 0) ∧
      Function.Bijective (LinearMap.lTensor ℚ (cgzComparison F).toIntLinearMap) ∧
      bwDescent (BlochGroup.c ℂ) = 0 := by sorry

/-! ## V.6 Explicit elements and certificates -/

section Certificates

variable {F : Type} [Field F]

variable (F) in
/-- V.6/five-term-certificate: a finitely supported `a : Admissible F →₀ ℤ` and `k ∈ ℤ`. -/
abbrev FiveTermCertificate : Type := (Admissible F →₀ ℤ) × ℤ

/-- `eval (a, k) = Σ a(x, y) R(x, y) + k[1]`. -/
def FiveTermCertificate.eval (c : FiveTermCertificate F) : FreeAbelianGroup {a : F // a ≠ 0} :=
  (c.1.sum fun p n => n • fiveTerm F p) + c.2 • symb F 1

@[simp] theorem FiveTermCertificate.eval_single (p : Admissible F) :
    FiveTermCertificate.eval ((Finsupp.single p 1, 0) : FiveTermCertificate F) = fiveTerm F p ∧
      FiveTermCertificate.eval ((0, 1) : FiveTermCertificate F) = symb F 1 := by sorry

@[simp] theorem FiveTermCertificate.eval_zero : FiveTermCertificate.eval (0 : FiveTermCertificate F) = 0 := by
  sorry

@[simp] theorem FiveTermCertificate.eval_add (c c' : FiveTermCertificate F) :
    FiveTermCertificate.eval (c + c') = FiveTermCertificate.eval c + FiveTermCertificate.eval c' ∧
      FiveTermCertificate.eval (-c) = -FiveTermCertificate.eval c := by sorry

/-- Validity for `ξ`. -/
def FiveTermCertificate.Valid (c : FiveTermCertificate F) (ξ : FreeAbelianGroup {a : F // a ≠ 0}) : Prop :=
  FiveTermCertificate.eval c = ξ

theorem FiveTermCertificate.Valid.add {c c' : FiveTermCertificate F} {ξ ξ' : FreeAbelianGroup {a : F // a ≠ 0}}
    (h : FiveTermCertificate.Valid c ξ) (h' : FiveTermCertificate.Valid c' ξ') :
    FiveTermCertificate.Valid (c + c') (ξ + ξ') ∧ FiveTermCertificate.Valid (-c) (-ξ) := by sorry

instance FiveTermCertificate.decidableValid [DecidableEq F] (c : FiveTermCertificate F)
    (ξ : FreeAbelianGroup {a : F // a ≠ 0}) : Decidable (FiveTermCertificate.Valid c ξ) :=
  decidable_of_iff (FreeAbelianGroup.equivFinsupp _ (FiveTermCertificate.eval c) =
    FreeAbelianGroup.equivFinsupp _ ξ) (by sorry)

theorem FiveTermCertificate.mem_fiveTermSubgroup_iff (ξ : FreeAbelianGroup {a : F // a ≠ 0}) :
    ξ ∈ fiveTermSubgroup F ↔ ∃ c : FiveTermCertificate F, FiveTermCertificate.Valid c ξ := by sorry

/-- Transport along a field embedding. -/
def FiveTermCertificate.map {L : Type} [Field L] (σ : F →+* L) (c : FiveTermCertificate F) :
    FiveTermCertificate L :=
  (c.1.mapDomain (Admissible.map σ), c.2)

theorem FiveTermCertificate.eval_map {L : Type} [Field L] (σ : F →+* L) (c : FiveTermCertificate F) :
    FiveTermCertificate.eval (FiveTermCertificate.map σ c) =
      FreeAbelianGroup.map (nonzeroMap F σ) (FiveTermCertificate.eval c) := by sorry

theorem FiveTermCertificate.map_id (c : FiveTermCertificate F) :
    FiveTermCertificate.map (RingHom.id F) c = c := by sorry

theorem FiveTermCertificate.map_comp {L E : Type} [Field L] [Field E] (σ : F →+* L) (τ : L →+* E)
    (c : FiveTermCertificate F) :
    FiveTermCertificate.map (τ.comp σ) c = FiveTermCertificate.map τ (FiveTermCertificate.map σ c) := by sorry

theorem FiveTermCertificate.Valid.modN {c : FiveTermCertificate F} {ξ : FreeAbelianGroup {a : F // a ≠ 0}}
    (h : FiveTermCertificate.Valid c ξ) (n : ℕ) :
    (QuotientAddGroup.mk (preBloch.mk F ξ) : preBloch F ⧸ (nsmulAddMonoidHom (α := preBloch F) n).range) = 0 := by
  sorry

theorem FiveTermCertificate.toCGZ {c : FiveTermCertificate F} {ξ : FreeAbelianGroup {a : F // a ≠ 0}}
    (h : FiveTermCertificate.Valid c ξ) :
    FreeAbelianGroup.map (fun a : {a : F // a ≠ 0} => ((a.1 : F) : OnePoint F)) ξ ∈ cgzRelations F := by sorry

/-- Test `empty_certificate`. -/
example (k : ℤ) : FiveTermCertificate.eval ((0, 0) : FiveTermCertificate F) = 0 ∧
    FiveTermCertificate.eval ((0, k) : FiveTermCertificate F) = k • symb F 1 ∧
    ∀ ξ, (∃ k : ℤ, FiveTermCertificate.Valid ((0, k) : FiveTermCertificate F) ξ) ↔
      ξ ∈ AddSubgroup.zmultiples (symb F 1) := by sorry

/-- Test `five_term_two_three`. -/
example (p : Admissible ℚ) (hx : p.x = 2) (hy : p.y = 3) :
    FiveTermCertificate.eval ((Finsupp.single p 1, 0) : FiveTermCertificate ℚ) =
      symb ℚ 2 - symb ℚ 3 + symb ℚ (3 / 2) - symb ℚ (3 / 4) + symb ℚ (1 / 2) := by sorry

/-- Test `c_independence_certificate`. -/
example (p : Admissible F) :
    FiveTermCertificate.Valid ((Finsupp.single p 1 - Finsupp.single p.oneSub 1, 0) : FiveTermCertificate F)
      ((symb F p.x + symb F (1 - p.x)) - (symb F p.y + symb F (1 - p.y))) := by sorry

/-- Test `additivity`. -/
example (φ : FiveTermCertificate F →+ FreeAbelianGroup {a : F // a ≠ 0})
    (h1 : ∀ p, φ (Finsupp.single p 1, 0) = fiveTerm F p) (h2 : φ (0, 1) = symb F 1)
    (c : FiveTermCertificate F) : φ c = FiveTermCertificate.eval c := by sorry

/-- Test `diagonal_not_admissible`. -/
example (x : F) : (¬ ∃ p : Admissible F, p.x = x ∧ p.y = x) ∧ ¬ ∃ p : Admissible F, p.y = 1 := by sorry

/-- Test `no_certificate_for_two`. -/
example : ∀ c : FiveTermCertificate ℚ, ¬ FiveTermCertificate.Valid c (symb ℚ 2) := by sorry

/-- V.6/certificate-soundness: soundness. -/
theorem certificate_sound (c : FiveTermCertificate F) (ξ ξ' : FreeAbelianGroup {a : F // a ≠ 0})
    (h : FiveTermCertificate.Valid c (ξ - ξ')) : preBloch.mk F ξ = preBloch.mk F ξ' := by sorry

/-- V.6/certificate-soundness: relative completeness, no bound on the length. -/
theorem certificate_complete (ξ ξ' : FreeAbelianGroup {a : F // a ≠ 0})
    (h : preBloch.mk F ξ = preBloch.mk F ξ') : ∃ c : FiveTermCertificate F, FiveTermCertificate.Valid c (ξ - ξ') := by
  sorry

/-! ### V.6/bloch-element-constructor -/

/-- V.6/bloch-element-constructor: `ofData ξ h ∈ B(F)`. -/
def ofData (ξ : FreeAbelianGroup {a : F // a ≠ 0}) (h : blochBoundary F (preBloch.mk F ξ) = 0) :
    blochGroup F :=
  ⟨preBloch.mk F ξ, h⟩

theorem ofData_coe (ξ : FreeAbelianGroup {a : F // a ≠ 0}) (h : blochBoundary F (preBloch.mk F ξ) = 0) :
    (ofData ξ h : preBloch F) = preBloch.mk F ξ := rfl

theorem ofData_ext {ξ ξ' : FreeAbelianGroup {a : F // a ≠ 0}} (h : blochBoundary F (preBloch.mk F ξ) = 0)
    (h' : blochBoundary F (preBloch.mk F ξ') = 0) (he : preBloch.mk F ξ = preBloch.mk F ξ') :
    ofData ξ h = ofData ξ' h' := by sorry

theorem ofData_certificate {ξ ξ' : FreeAbelianGroup {a : F // a ≠ 0}}
    (h : blochBoundary F (preBloch.mk F ξ) = 0) (h' : blochBoundary F (preBloch.mk F ξ') = 0)
    (c : FiveTermCertificate F) (hc : FiveTermCertificate.Valid c (ξ - ξ')) : ofData ξ h = ofData ξ' h' := by
  sorry

@[simp] theorem ofData_zero (h : blochBoundary F (preBloch.mk F 0) = 0) : ofData 0 h = 0 := by sorry

@[simp] theorem ofData_add {ξ ξ' : FreeAbelianGroup {a : F // a ≠ 0}}
    (h : blochBoundary F (preBloch.mk F ξ) = 0) (h' : blochBoundary F (preBloch.mk F ξ') = 0)
    (hs : blochBoundary F (preBloch.mk F (ξ + ξ')) = 0) (hn : blochBoundary F (preBloch.mk F (-ξ)) = 0) :
    ofData (ξ + ξ') hs = ofData ξ h + ofData ξ' h' ∧ ofData (-ξ) hn = -ofData ξ h := by sorry

theorem ofData_surjective (β : blochGroup F) :
    ∃ (ξ : FreeAbelianGroup {a : F // a ≠ 0}) (h : blochBoundary F (preBloch.mk F ξ) = 0), ofData ξ h = β := by
  sorry

theorem ofData_elementC (hF : 4 ≤ ENat.card F) (x : F) (hx0 : x ≠ 0) (hx1 : x ≠ 1)
    (h : blochBoundary F (preBloch.mk F (symb F x + symb F (1 - x))) = 0) :
    ofData (symb F x + symb F (1 - x)) h = BlochGroup.c F := by sorry

theorem ofData_map {L : Type} [Field L] (σ : F →+* L) (ξ : FreeAbelianGroup {a : F // a ≠ 0})
    (h : blochBoundary F (preBloch.mk F ξ) = 0)
    (h' : blochBoundary L (preBloch.mk L (FreeAbelianGroup.map (nonzeroMap F σ) ξ)) = 0) :
    blochGroup.map F σ (ofData ξ h) = ofData (FreeAbelianGroup.map (nonzeroMap F σ) ξ) h' := by sorry

theorem ofData_cgz (hF : 4 ≤ ENat.card F) (ξ : FreeAbelianGroup {a : F // a ≠ 0})
    (h : blochBoundary F (preBloch.mk F ξ) = 0) :
    ∃ hA : FreeAbelianGroup.map (fun a : {a : F // a ≠ 0} => ((a.1 : F) : OnePoint F)) ξ ∈ cgzA F,
      cgzComparison F (ofData ξ h) = cgzBloch.mk F ⟨_, hA⟩ := by sorry

/-- Test `constructs_c`. -/
example (h : blochBoundary ℚ (preBloch.mk ℚ (symb ℚ 2 + symb ℚ (-1))) = 0) :
    blochBoundary ℚ (preBloch.mk ℚ (symb ℚ 2 + symb ℚ (-1))) = 0 ∧
      ofData (symb ℚ 2 + symb ℚ (-1)) h = BlochGroup.c ℚ := by sorry

/-- Test `zero_input`. -/
example (h : blochBoundary F (preBloch.mk F 0) = 0) : ofData 0 h = 0 := by sorry

/-- Test `rejects_two_accepts_double`. -/
example : blochBoundary ℚ (preBloch.mk ℚ (symb ℚ 2)) ≠ 0 ∧
    addOrderOf (blochBoundary ℚ (preBloch.mk ℚ (symb ℚ 2))) = 2 ∧
    blochBoundary ℚ (preBloch.mk ℚ ((2 : ℤ) • symb ℚ 2)) = 0 := by sorry

/-- Test `certificate_equality`. -/
example (p : Admissible F) (h : blochBoundary F (preBloch.mk F (symb F p.x + symb F (1 - p.x))) = 0)
    (h' : blochBoundary F (preBloch.mk F (symb F p.y + symb F (1 - p.y))) = 0) :
    ofData _ h = ofData _ h' := by sorry

/-- Test `not_projected`. -/
example : blochBoundary (ZMod 5) (preBloch.mk _ (symb _ 3)) ≠ 0 ∧
    antisymSquare.toExterior ℤ _ (blochBoundary (ZMod 5) (preBloch.mk _ (symb _ 3))) = 0 := by sorry

/-- Test `convention_image_of_c`. -/
example (h : blochBoundary ℚ (preBloch.mk ℚ (symb ℚ 2 + symb ℚ (-1))) = 0)
    (h0 : FreeAbelianGroup.of ((0 : ℚ) : OnePoint ℚ) ∈ cgzA ℚ) :
    cgzComparison ℚ (ofData _ h) = cgzBloch.mk ℚ ⟨_, h0⟩ ∧ addOrderOf (cgzBloch.mk ℚ ⟨_, h0⟩) = 3 ∧
      addOrderOf (BlochGroup.c ℚ) = 6 := by sorry

/-! ### V.6/boundary-certificate -/

variable (F) in
/-- The generators of a vanishing-boundary certificate: `ζ₀` of exact order `m₀`, and `g₁, …, g_s`. -/
structure BoundaryBasis (s : ℕ) where
  m₀ : ℕ
  ζ₀ : Fˣ
  orderOf_ζ₀ : orderOf ζ₀ = m₀
  g : Fin s → Fˣ

/-- `(a, v) ↦ ζ₀^a ∏ g_j^{v_j}`. -/
def BoundaryBasis.expMap {s : ℕ} (B : BoundaryBasis F s) : ZMod B.m₀ × (Fin s → ℤ) →+ Additive Fˣ where
  toFun a := Additive.ofMul (B.ζ₀ ^ a.1.val * ∏ j, B.g j ^ a.2 j)
  map_zero' := by sorry
  map_add' := by sorry

/-- Transport along a field embedding. -/
def BoundaryBasis.map {L : Type} [Field L] {s : ℕ} (σ : F →+* L) (B : BoundaryBasis F s) : BoundaryBasis L s :=
  ⟨B.m₀, Units.map σ.toMonoidHom B.ζ₀, by sorry, fun j => Units.map σ.toMonoidHom (B.g j)⟩

variable (F) in
/-- The class of a finitely supported `ξ : F →₀ ℤ` in the free abelian group on `F - {0}`. -/
def ofFinsupp (ξ : F →₀ ℤ) : FreeAbelianGroup {a : F // a ≠ 0} := ξ.sum fun x n => n • symb F x

/-- V.6/boundary-certificate: exponent vectors `e(x), f(x)` with `x = ζ₀^{e₀} ∏ g_j^{e_j}` and
`1 - x = ζ₀^{f₀} ∏ g_j^{f_j}` for `x` in the support of `ξ`. -/
structure BoundaryCertificate {s : ℕ} (B : BoundaryBasis F s) (ξ : F →₀ ℤ) where
  e : F → ZMod B.m₀ × (Fin s → ℤ)
  f : F → ZMod B.m₀ × (Fin s → ℤ)
  supp : ∀ x ∈ ξ.support, x ≠ 0 ∧ x ≠ 1
  fac_e : ∀ x ∈ ξ.support, x = ((B.ζ₀ ^ (e x).1.val * ∏ j, B.g j ^ (e x).2 j : Fˣ) : F)
  fac_f : ∀ x ∈ ξ.support, 1 - x = ((B.ζ₀ ^ (f x).1.val * ∏ j, B.g j ^ (f x).2 j : Fˣ) : F)

namespace BoundaryCertificate

variable {s : ℕ} {B : BoundaryBasis F s} {ξ : F →₀ ℤ}

/-- `Σ n_x e(x) ∧ f(x)` in `antisymSquare ℤ (ℤ/m₀ × ℤ^s)`. -/
def boundary (c : BoundaryCertificate B ξ) : antisymSquare ℤ (ZMod B.m₀ × (Fin s → ℤ)) :=
  ξ.sum fun x n => n • antisymSquare.mk ℤ _ (c.e x) (c.f x)

/-- The `(0, 0)` component, modulo `gcd(m₀, 2)`. -/
def comp00 (c : BoundaryCertificate B ξ) : ZMod (Nat.gcd B.m₀ 2) :=
  ξ.sum fun x n => (n : ZMod _) * ((c.e x).1.val : ZMod _) * ((c.f x).1.val : ZMod _)

/-- The `(0, j)` component, modulo `m₀`. -/
def comp0j (c : BoundaryCertificate B ξ) (j : Fin s) : ZMod B.m₀ :=
  ξ.sum fun x n => (n : ZMod B.m₀) * ((c.e x).1 * ((c.f x).2 j : ZMod B.m₀) - ((c.e x).2 j : ZMod B.m₀) * (c.f x).1)

/-- The `(j, j)` component, modulo `2`. -/
def compjj (c : BoundaryCertificate B ξ) (j : Fin s) : ZMod 2 :=
  ξ.sum fun x n => (n : ZMod 2) * (((c.e x).2 j * (c.f x).2 j : ℤ) : ZMod 2)

/-- The `(j, k)` component, `j < k`, in `ℤ`. -/
def compjk (c : BoundaryCertificate B ξ) (j k : Fin s) : ℤ :=
  ξ.sum fun x n => n * ((c.e x).2 j * (c.f x).2 k - (c.e x).2 k * (c.f x).2 j)

/-- Validity: all components vanish. -/
def Valid (c : BoundaryCertificate B ξ) : Prop :=
  c.comp00 = 0 ∧ (∀ j, c.comp0j j = 0) ∧ (∀ j, c.compjj j = 0) ∧ ∀ j k, j < k → c.compjk j k = 0

instance decidableValid (c : BoundaryCertificate B ξ) : Decidable c.Valid := by
  unfold Valid; infer_instance

theorem boundary_map (c : BoundaryCertificate B ξ) :
    antisymSquare.map ℤ _ B.expMap.toIntLinearMap c.boundary = blochBoundary F (preBloch.mk F (ofFinsupp F ξ)) := by
  sorry

theorem sound (c : BoundaryCertificate B ξ) (hc : c.Valid) :
    blochBoundary F (preBloch.mk F (ofFinsupp F ξ)) = 0 := by sorry

theorem complete_of_summand (c : BoundaryCertificate B ξ) (hinj : Function.Injective B.expMap)
    (hsum : ∃ H : AddSubgroup (Additive Fˣ), IsCompl B.expMap.range H)
    (h0 : blochBoundary F (preBloch.mk F (ofFinsupp F ξ)) = 0) : c.Valid := by sorry

open Classical in
/-- Certificates over the same generators add. -/
def add {ξ' : F →₀ ℤ} (c : BoundaryCertificate B ξ) (c' : BoundaryCertificate B ξ') :
    BoundaryCertificate B (ξ + ξ') where
  e x := if x ∈ ξ.support then c.e x else c'.e x
  f x := if x ∈ ξ.support then c.f x else c'.f x
  supp := by sorry
  fac_e := by sorry
  fac_f := by sorry

theorem boundary_add {ξ' : F →₀ ℤ} (c : BoundaryCertificate B ξ) (c' : BoundaryCertificate B ξ')
    (hagree : ∀ x ∈ ξ.support, x ∈ ξ'.support → c.e x = c'.e x ∧ c.f x = c'.f x) :
    (c.add c').boundary = c.boundary + c'.boundary := by sorry

open Classical in
/-- Transport along a field embedding, with the same exponent vectors. -/
def map {L : Type} [Field L] (σ : F →+* L) (c : BoundaryCertificate B ξ) :
    BoundaryCertificate (B.map σ) (ξ.mapDomain σ) where
  e y := if h : ∃ x, σ x = y then c.e h.choose else 0
  f y := if h : ∃ x, σ x = y then c.f h.choose else 0
  supp := by sorry
  fac_e := by sorry
  fac_f := by sorry

/-- The projection `Fˣ → Fˣ/Fˣⁿ`, written additively as `Additive Fˣ ⧸ n • Additive Fˣ`. -/
def powQuot (n : ℕ) :
    Additive Fˣ →ₗ[ℤ] Additive Fˣ ⧸ (nsmulAddMonoidHom (α := Additive Fˣ) n).range :=
  AddMonoidHom.toIntLinearMap (QuotientAddGroup.mk' _)

theorem reduce (c : BoundaryCertificate B ξ) (hc : c.Valid) (n : ℕ) :
    TensorProduct.mk ℤ (unitsWedge F) (ZMod n) (blochBoundary F (preBloch.mk F (ofFinsupp F ξ))) 1 = 0 ∧
      antisymSquare.toExterior ℤ _ (antisymSquare.map ℤ _ (powQuot (F := F) n)
        (blochBoundary F (preBloch.mk F (ofFinsupp F ξ)))) = 0 := by sorry

end BoundaryCertificate

/-- The element of `B(F)` given by a valid vanishing-boundary certificate. -/
def ofBoundaryCertificate {s : ℕ} {B : BoundaryBasis F s} {ξ : F →₀ ℤ} (c : BoundaryCertificate B ξ)
    (hc : c.Valid) : blochGroup F :=
  ofData (ofFinsupp F ξ) (c.sound hc)

/-- Test `boundary_cert_c_rat`. -/
example (B : BoundaryBasis ℚ 1) (hm : B.m₀ = 2) (hζ : B.ζ₀ = -1) (hg : B.g 0 = Units.mk0 2 two_ne_zero) :
    ∃ c : BoundaryCertificate B (Finsupp.single 2 1 + Finsupp.single (-1) 1),
      c.e 2 = (0, ![1]) ∧ c.f 2 = (1, ![0]) ∧ c.e (-1) = (1, ![0]) ∧ c.f (-1) = (0, ![1]) ∧ c.Valid := by
  sorry

/-- Test `boundary_cert_two_rat`. -/
example (B : BoundaryBasis ℚ 1) (hm : B.m₀ = 2) (hζ : B.ζ₀ = -1) (hg : B.g 0 = Units.mk0 2 two_ne_zero) :
    (∀ c : BoundaryCertificate B (Finsupp.single 2 1), ¬ c.Valid) ∧ preBloch.gen ℚ 2 ∉ blochGroup ℚ := by
  sorry

/-- Test `boundary_cert_omega`: over `ℚ(√-3) = ℚ(ζ₃)`. -/
example (ω : CyclotomicField 3 ℚ) (hω : IsPrimitiveRoot ω 6) (B : BoundaryBasis (CyclotomicField 3 ℚ) 0)
    (hm : B.m₀ = 6) (hζ : (B.ζ₀ : CyclotomicField 3 ℚ) = ω) :
    (∀ c : BoundaryCertificate B (Finsupp.single ω 1), c.e ω = (1, 0) → c.f ω = (5, 0) → ¬ c.Valid) ∧
      (∃ c : BoundaryCertificate B (Finsupp.single ω 2), c.Valid) ∧
      antisymSquare.toExterior ℤ _ (blochBoundary _ (preBloch.gen _ ω)) = 0 := by sorry

/-- Test `boundary_cert_zero`. -/
example (B : BoundaryBasis F 0) (hm : B.m₀ = 1) : ∃ c : BoundaryCertificate B 0, c.Valid := by sorry

/-- Test `boundary_cert_sound`. -/
example {s : ℕ} {B : BoundaryBasis F s} {ξ : F →₀ ℤ} (c : BoundaryCertificate B ξ) (hc : c.Valid) :
    blochBoundary F (preBloch.mk F (ofFinsupp F ξ)) = 0 ∧
      (ofBoundaryCertificate c hc : preBloch F) = preBloch.mk F (ofFinsupp F ξ) := by sorry

/-! ### V.6/root-of-unity-symbol, V.6/root-of-unity-class -/

/-- V.6/root-of-unity-symbol. -/
theorem rootOfUnity_symbol {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) :
    m • blochBoundary F (preBloch.gen F ζ) = 0 ∧ m • preBloch.gen F ζ ∈ blochGroup F ∧
      (preBloch.gen F ζ ∈ blochGroup F ↔
        uwedge F (Units.mk0 ζ (hζ.ne_zero (by omega))) (Units.mk0 (1 - ζ) (sub_ne_zero.2 (hζ.ne_one (by omega)).symm)) = 0) := by sorry

theorem rootOfUnity_symbol_omega {ω : F} (hω : IsPrimitiveRoot ω 6) :
    1 - ω = ω⁻¹ ∧ blochBoundary F (preBloch.gen F ω) = uwedge F (-1) (-1) ∧
      (preBloch.gen F ω ∈ blochGroup F ↔ ∃ i : F, i ^ 2 = -1) := by sorry

variable (F) in
/-- `B(F)/nB(F)`. -/
abbrev blochMod (n : ℕ) : Type := blochGroup F ⧸ (nsmulAddMonoidHom (α := blochGroup F) n).range

variable (F) in
/-- `P(F)/nP(F)`. -/
abbrev preBlochMod (n : ℕ) : Type := preBloch F ⧸ (nsmulAddMonoidHom (α := preBloch F) n).range

variable (F) in
/-- `B(F)/n → P(F)/n`. -/
def blochModToPreBlochMod (n : ℕ) : blochMod F n →+ preBlochMod F n :=
  QuotientAddGroup.map _ _ (blochGroup F).subtype (by sorry)

/-- Functoriality of `B(F)/n`. -/
def blochMod.map {L : Type} [Field L] (σ : F →+* L) (n : ℕ) : blochMod F n →+ blochMod L n :=
  QuotientAddGroup.map _ _ (blochGroup.map F σ) (by sorry)

/-- V.6/root-of-unity-class (i): `⟦ζ⟧ₙ = u · (m[ζ]) ∈ B(F)/nB(F)`, `u m ≡ 1 mod n`. -/
def rootClassMod {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) (n : ℕ) (hn : Nat.Coprime n m) :
    blochMod F n :=
  ((m : ZMod n)⁻¹).val • QuotientAddGroup.mk (ofData ((m : ℤ) • symb F ζ) (by sorry))

theorem rootClassMod_indep {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) (n : ℕ)
    (hn : Nat.Coprime n m) (u : ℕ) (hu : ((u * m : ℕ) : ZMod n) = 1)
    (h : blochBoundary F (preBloch.mk F ((m : ℤ) • symb F ζ)) = 0) :
    rootClassMod hζ hm n hn = u • QuotientAddGroup.mk (ofData ((m : ℤ) • symb F ζ) h) := by sorry

theorem rootClassMod_toPreBloch {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) (n : ℕ)
    (hn : Nat.Coprime n m) :
    blochModToPreBlochMod F n (rootClassMod hζ hm n hn) = QuotientAddGroup.mk (preBloch.gen F ζ) := by sorry

theorem rootClassMod_of_mem {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) (n : ℕ)
    (hn : Nat.Coprime n m) (h : preBloch.gen F ζ ∈ blochGroup F) :
    rootClassMod hζ hm n hn = QuotientAddGroup.mk ⟨_, h⟩ := by sorry

/-- V.6/root-of-unity-class (ii): `⟦ζ⟧[1/m] = m⁻¹ ⊗ m[ζ]` in `B(F)[1/m]`. -/
def rootClassLoc {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) :
    LocalizedModule (Submonoid.powers (m : ℤ)) (blochGroup F) :=
  LocalizedModule.mk (ofData ((m : ℤ) • symb F ζ) (by sorry)) ⟨(m : ℤ), Submonoid.mem_powers _⟩

theorem rootClassLoc_toPreBloch {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) :
    LocalizedModule.map (Submonoid.powers (m : ℤ)) (blochGroup F).subtype.toIntLinearMap
        (rootClassLoc hζ hm) = LocalizedModule.mk (preBloch.gen F ζ) 1 := by sorry

/-- V.6/root-of-unity-class (iii): `m⁻¹ ⊗ m[ζ]` in `B(F) ⊗ ℤ_p`, `p ∤ m`. -/
def rootClassPadic {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) (p : ℕ) [Fact p.Prime]
    (hp : ¬ p ∣ m) : TensorProduct ℤ (blochGroup F) ℤ_[p] :=
  (ofData ((m : ℤ) • symb F ζ) (by sorry)) ⊗ₜ PadicInt.inv (m : ℤ_[p])

theorem rootClassLoc_reduce {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) (n : ℕ)
    (hn : Nat.Coprime n m)
    (φ : LocalizedModule (Submonoid.powers (m : ℤ)) (blochGroup F) →ₗ[ℤ] blochMod F n)
    (hφ : ∀ b, φ (LocalizedModule.mk b 1) = QuotientAddGroup.mk b) :
    φ (rootClassLoc hζ hm) = rootClassMod hζ hm n hn := by sorry

theorem rootClass_map {L : Type} [Field L] (σ : F →+* L) {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m)
    (hm : 2 ≤ m) (n : ℕ) (hn : Nat.Coprime n m) :
    blochMod.map σ n (rootClassMod hζ hm n hn) = rootClassMod (hζ.map_of_injective σ.injective) hm n hn ∧
      LocalizedModule.map (Submonoid.powers (m : ℤ)) (blochGroup.map F σ).toIntLinearMap (rootClassLoc hζ hm) =
        rootClassLoc (hζ.map_of_injective σ.injective) hm := by sorry

/-- Test `rootClass_neg_one_mod_three`. -/
example (hζ : IsPrimitiveRoot (-1 : ℚ) 2) (hn : Nat.Coprime 3 2) :
    (2 : ℤ) • preBloch.gen ℚ (-1) = angle ℚ (-1) ∧ angle ℚ (-1) ∈ blochGroup ℚ ∧
      rootClassMod hζ le_rfl 3 hn = 0 := by sorry

/-- Test `rootClass_of_mem_omega`: over `ℚ(ζ₁₂)`. -/
example (ω : CyclotomicField 12 ℚ) (hω : IsPrimitiveRoot ω 6) (hm : 2 ≤ 6) (hn : Nat.Coprime 5 6) :
    ∃ h : preBloch.gen _ ω ∈ blochGroup _, rootClassMod hω hm 5 hn = QuotientAddGroup.mk ⟨_, h⟩ := by sorry

/-- Test `rootClass_not_lift_omega`: over `ℚ(√-3)`. -/
example (ω : CyclotomicField 3 ℚ) (hω : IsPrimitiveRoot ω 6) :
    preBloch.gen _ ω ∉ blochGroup _ ∧ blochBoundary _ (preBloch.gen _ ω) = uwedge _ (-1) (-1) := by sorry

/-- Test `rootClass_loc_compat`. -/
example {ζ : F} {m : ℕ} (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (h : blochBoundary F (preBloch.mk F ((m : ℤ) • symb F ζ)) = 0) :
    (m : ℤ) • rootClassLoc hζ hm = LocalizedModule.mk (ofData ((m : ℤ) • symb F ζ) h) 1 := by sorry

/-- Test `rootClass_indep_u`. -/
example {ζ : F} {m : ℕ} (n u : ℕ) (hu : ((u * m : ℕ) : ZMod n) = 1)
    (h : blochBoundary F (preBloch.mk F ((m : ℤ) • symb F ζ)) = 0) :
    (u • QuotientAddGroup.mk (ofData ((m : ℤ) • symb F ζ) h) : blochMod F n) =
      (u + n) • QuotientAddGroup.mk (ofData ((m : ℤ) • symb F ζ) h) := by sorry

end Certificates

/-! ### V.6 comparisons -/

open TauCeti.K3 TauCeti.Suslin

local notation "K3ind'" => K3ind K MilnorK milnorToQuillen

/-- V.6/certificate-to-bar-cycle: existence of the lifts (no explicit bar cycle is
constructed from a certificate). -/
theorem certificate_to_bar_cycle (F : Type) [Field F] [Infinite F] (β : blochGroup F)
    (hβ : ∃ (ξ : FreeAbelianGroup {a : F // a ≠ 0}) (h : blochBoundary F (preBloch.mk F ξ) = 0), ofData ξ h = β) :
    (∃ z, psiGL3 F z = (β : preBloch F)) ∧
      ∃ k : K 3 F, suslinMap K GLinf St stToGL MilnorK milnorToQuillen F (K3ind.mk K MilnorK milnorToQuillen F k) = β ∧
        ∃ w : barCycle3 St F, evalBarCycle K St F w = k := by sorry

/-- V.6/comparison-rational. -/
theorem comparison_rational (F : Type) [Field F] (hF : 4 ≤ ENat.card F) :
    Nonempty ((ℚ ⊗[ℤ] K3ind' F) ≃ₗ[ℚ] (ℚ ⊗[ℤ] blochGroup F)) ∧
      Function.Bijective (LinearMap.lTensor ℚ (cgzComparison F).toIntLinearMap) := by sorry

theorem comparison_rational_numberField (F : Type) [Field F] [NumberField F] :
    Module.finrank ℚ (ℚ ⊗[ℤ] K 3 F) = NumberField.InfinitePlace.nrComplexPlaces F ∧
      Module.finrank ℚ (ℚ ⊗[ℤ] K3ind' F) = NumberField.InfinitePlace.nrComplexPlaces F := by sorry

/-- V.6/comparison-integral. -/
theorem comparison_integral :
    ¬ Nonempty (K3ind' ℚ ≃+ blochGroup ℚ) ∧
      ¬ Nonempty (K3ind' ℚ ≃+ Additive (enhancedRootsOfUnity ℚ) × blochGroup ℚ) ∧
      ¬ Function.Injective (cgzComparison (ZMod 11)) ∧ ¬ Function.Surjective (cgzComparison (ZMod 11)) := by
  sorry

/-- V.6/comparison-finite-coefficients: for infinite `F` and odd `n` with `μ(F)/n = 0`, the
Suslin map induces `K₃^ind(F)/n ≅ B(F)/n`, and `κ` induces `B(F)/n ≅ B_CGZ(F)/n` for odd `n`. -/
theorem comparison_finite_coefficients (F : Type) [Field F] [Infinite F] (n : ℕ) (hn : Odd n)
    (hμ : ∀ ζ : CommGroup.torsion Fˣ, ∃ η : CommGroup.torsion Fˣ, ζ = η ^ n) :
    (∃ φ : (K3ind' F ⧸ (nsmulAddMonoidHom (α := K3ind' F) n).range) →+ blochMod F n,
      (∀ x, φ (QuotientAddGroup.mk x) =
        QuotientAddGroup.mk (suslinMap K GLinf St stToGL MilnorK milnorToQuillen F x)) ∧
        Function.Bijective φ) ∧
      ∃ ψ : blochMod F n →+ (cgzBloch F ⧸ (nsmulAddMonoidHom (α := cgzBloch F) n).range),
        (∀ b, ψ (QuotientAddGroup.mk b) = QuotientAddGroup.mk (cgzComparison F b)) ∧ Function.Bijective ψ := by
  sorry

/-- V.6/regulator-agreement: up to a sign and a nonzero rational. -/
theorem regulator_agreement (F : Type) [Field F] [NumberField F] :
    ∃ (ε : ℤ) (q : ℚ), (ε = 1 ∨ ε = -1) ∧ q ≠ 0 ∧ ∀ x : K 3 F,
      weightTwoReg F (suslinMap K GLinf St stToGL MilnorK milnorToQuillen F (K3ind.mk K MilnorK milnorToQuillen F x)) =
        ((ε * q : ℚ) : ℝ) • borelReg F x := by sorry

-- V.6/regulator-agreement-padic: not stated; needs the syntomic/étale regulator on
-- K₃(L)/pᵐ and the p-adic dilogarithm on the Bloch-group model (PadicHodgeRegulators D.2).

end TauCeti.BlochGroup
end

end Primary


/-! ## ContinuationV1 -/

section ContinuationV1

open CategoryTheory

namespace K3Homological

noncomputable section

/-- Existing Mathlib objects; these abbreviations introduce no new chain model. -/
abbrev integralHomology (G : Type) [Group G] (n : ℕ) : ModuleCat ℤ :=
  TauCeti.K3.intHomology G n

abbrev integralCycles (G : Type) [Group G] (n : ℕ) : ModuleCat ℤ :=
  groupHomology.cycles (Rep.trivial ℤ G ℤ) n

abbrev integralChains (G : Type) [Group G] (n : ℕ) : ModuleCat ℤ :=
  (groupHomology.inhomogeneousChains (Rep.trivial ℤ G ℤ)).X n

/-- The induced additive map is an abbreviation of the pinned homology morphism. -/
abbrev homologyMap {G H : Type} [Group G] [Group H] (f : G →* H) (n : ℕ) :
    integralHomology G n →+ integralHomology H n :=
  (groupHomology.map (A := Rep.trivial ℤ G ℤ)
    (B := Rep.trivial ℤ H ℤ) f (𝟙 _) n).hom.toAddMonoidHom

section CanonicalComparison

variable {G : Type} [Group G]
variable {K Q P R : Type} [AddCommGroup K] [AddCommGroup Q]
  [AddCommGroup P] [AddCommGroup R]

/-- canonical-comparison-interface: q = q₃, h = h₃, j = j₃, b = b₃. -/
def comparison (q : Q ≃+ K) (h : Q ≃+ P) (j : R ≃+ P)
    (b : R ≃+ integralHomology G 3) : K ≃+ integralHomology G 3 := by sorry

lemma comparison_apply (q : Q ≃+ K) (h : Q ≃+ P) (j : R ≃+ P)
    (b : R ≃+ integralHomology G 3) (x : K) :
    comparison q h j b x = b (j.symm (h (q.symm x))) := by sorry

lemma comparison_symm_apply (q : Q ≃+ K) (h : Q ≃+ P) (j : R ≃+ P)
    (b : R ≃+ integralHomology G 3) (z : integralHomology G 3) :
    (comparison q h j b).symm z = q (h.symm (j (b.symm z))) := by sorry

lemma comparison_zero (q : Q ≃+ K) (h : Q ≃+ P) (j : R ≃+ P)
    (b : R ≃+ integralHomology G 3) : comparison q h j b 0 = 0 := by sorry

lemma comparison_add (q : Q ≃+ K) (h : Q ≃+ P) (j : R ≃+ P)
    (b : R ≃+ integralHomology G 3) (x y : K) :
    comparison q h j b (x + y) = comparison q h j b x + comparison q h j b y := by sorry

/-- Test comparison_identity_data. -/
example : comparison (AddEquiv.refl (integralHomology G 3)) (AddEquiv.refl _)
    (AddEquiv.refl _) (AddEquiv.refl _) = AddEquiv.refl _ := by sorry

/-- Test comparison_trivial_group: a zero-group test does not fabricate K₃. -/
example [Subsingleton G] (c : K ≃+ integralHomology G 3) : Subsingleton K := by sorry

/-- Test comparison_detects_nonzero. -/
example (q : Q ≃+ K) (h : Q ≃+ P) (j : R ≃+ P)
    (b : R ≃+ integralHomology G 3) (x : K) :
    comparison q h j b x = 0 ↔ x = 0 := by sorry

end CanonicalComparison

section CycleCertificates

variable {G : Type} [Group G] {K : Type} [AddCommGroup K]

/-- cycle-certificate-evaluator: c will be the genuine canonical comparison. -/
def eval3 (c : K ≃+ integralHomology G 3) : integralCycles G 3 →+ K := by sorry

lemma eval3_comparison (c : K ≃+ integralHomology G 3) (z : integralCycles G 3) :
    c (eval3 c z) = groupHomology.π (Rep.trivial ℤ G ℤ) 3 z := by sorry

lemma eval3_zero (c : K ≃+ integralHomology G 3) : eval3 c 0 = 0 := by sorry

lemma eval3_add (c : K ≃+ integralHomology G 3) (z z' : integralCycles G 3) :
    eval3 c (z + z') = eval3 c z + eval3 c z' := by sorry

lemma eval3_zsmul (c : K ≃+ integralHomology G 3) (m : ℤ) (z : integralCycles G 3) :
    eval3 c (m • z) = m • eval3 c z := by sorry

lemma eval3_boundary (c : K ≃+ integralHomology G 3) (w : integralChains G 4) :
    eval3 c (groupHomology.toCycles (Rep.trivial ℤ G ℤ) 4 3 w) = 0 := by sorry

lemma eval3_eq_iff_certificate (c : K ≃+ integralHomology G 3)
    (z z' : integralCycles G 3) :
    eval3 c z = eval3 c z' ↔ ∃ w : integralChains G 4,
      groupHomology.toCycles (Rep.trivial ℤ G ℤ) 4 3 w = z - z' := by sorry

lemma eval3_surjective (c : K ≃+ integralHomology G 3) :
    Function.Surjective (eval3 c) := by sorry

/-- Test eval3_identity_triple: use a concrete boundary as the cycle witness. -/
example (c : K ≃+ integralHomology G 3) :
    let w : integralChains G 4 := Finsupp.single (fun _ : Fin 4 => (1 : G)) 1
    let z := groupHomology.toCycles (Rep.trivial ℤ G ℤ) 4 3 w
    groupHomology.iCycles (Rep.trivial ℤ G ℤ) 3 z =
      Finsupp.single (fun _ : Fin 3 => (1 : G)) 1 ∧ eval3 c z = 0 := by sorry

/-- Test eval3_zero_cycle. -/
example (c : K ≃+ integralHomology G 3) : eval3 c 0 = 0 := by sorry

/-- Test eval3_baseline_projection. -/
example (c : K ≃+ integralHomology G 3) (z : integralCycles G 3) :
    c (eval3 c z) = groupHomology.π (Rep.trivial ℤ G ℤ) 3 z := by sorry

/-- Test eval3_not_injective, valid even for the trivial group. -/
example (c : K ≃+ integralHomology G 3) : ¬ Function.Injective (eval3 c) := by sorry

/-- Test single_g_one_one_not_cycle: no cycle constructor on arbitrary chains. -/
example (g : G) (hg : g ≠ 1) :
    (groupHomology.inhomogeneousChains (Rep.trivial ℤ G ℤ)).d 3 2
      (Finsupp.single ![g, 1, 1] 1) ≠ 0 := by sorry

end CycleCertificates

section Naturality

variable {G H : Type} [Group G] [Group H]
variable {K L : Type} [AddCommGroup K] [AddCommGroup L]

/-- ring-map-comparison-square: the algebraic evaluator consequence of the canonical square.
The hypothesis is the explicit equality of genuine maps supplied by the topological theorem. -/
theorem ring_map_eval (f : G →* H) (k : K →+ L)
    (c : K ≃+ integralHomology G 3) (c' : L ≃+ integralHomology H 3)
    (natural : ∀ x, c' (k x) = groupHomology.map f (𝟙 _) 3 (c x))
    (z : integralCycles G 3) :
    k (eval3 c z) = eval3 c' (groupHomology.cyclesMap f (𝟙 _) 3 z) := by sorry

theorem map_boundary_certificate (f : G →* H)
    (w : integralChains G 4) (z z' : integralCycles G 3)
    (certificate : groupHomology.toCycles (Rep.trivial ℤ G ℤ) 4 3 w = z - z') :
    groupHomology.toCycles (Rep.trivial ℤ H ℤ) 4 3
      ((groupHomology.chainsMap f (𝟙 _)).f 4 w) =
      groupHomology.cyclesMap f (𝟙 _) 3 z -
        groupHomology.cyclesMap f (𝟙 _) 3 z' := by sorry

end Naturality

section FiniteStages

variable {G : Type} [Group G] {K : Type} [AddCommGroup K]
variable (Gstage : ℕ → Type) [∀ n, Group (Gstage n)]
  (stageIn : ∀ n, Gstage n →* G)

/-- finite-stage-cycle-certificates: available interface conditional on the supplier's
surjectivity of the directed homology presentation. Full colimit data comes from T.1. -/
theorem finite_stage_representative (c : K ≃+ integralHomology G 3)
    (finite_homology : ∀ y : integralHomology G 3,
      ∃ n, ∃ y' : integralHomology (Gstage n) 3,
        groupHomology.map (stageIn n) (𝟙 _) 3 y' = y)
    (x : K) :
    ∃ n, ∃ z : integralCycles (Gstage n) 3,
      eval3 c (groupHomology.cyclesMap (stageIn n) (𝟙 _) 3 z) = x := by sorry

/- The eventual finite boundary-witness statement additionally needs the actual directed
transition functor and the filtered-colimit comparison for equality. This is omitted rather
than replaced by an injectivity hypothesis on include n. -/

end FiniteStages

/- elementary-cover-hspace is an application of upstream's general H-space lift.
The pinned HSpace and covering-map carriers are available, but the ring block-sum
plus model and the owner theorem are not. Its definitive signature is omitted
rather than redeclaring a general coverHSpace construction in V.1. The requested
supplier exports its chosen-unit, multiplication-projection and lift-uniqueness
API, including identity-cover, real-addition and one-point acceptance checks. -/

section ExactSequence

variable {G E : Type} [Group G] [Group E]
variable {K₂ K₃ : Type} [AddCommGroup K₂] [AddCommGroup K₃]

/-- elementary-homology-exact-sequence-refinement: algebraic transport of the
simply connected H-space exact sequence along its actual comparison maps.
Here eta and h are the source-side Hopf and Hurewicz maps; the missing sphere-unit
comparison supplies operation_square. This does not assume the desired target exactness. -/
theorem elementary_homology_exact {P₃ : Type} [AddCommGroup P₃]
    (s : G →* E) (c : K₃ ≃+ integralHomology G 3) (q : P₃ ≃+ K₃)
    (eta : K₂ →+ P₃) (h : P₃ →+ integralHomology E 3) (minusOne : K₂ →+ K₃)
    (hurewicz_square : ∀ y, h y = homologyMap s 3 (c (q y)))
    (operation_square : ∀ a, q (eta a) = minusOne a)
    (source_exact : ∀ y, h y = 0 ↔ ∃ a, eta a = y)
    (source_onto : Function.Surjective h) :
    (∀ x : K₃, homologyMap s 3 (c x) = 0 ↔ ∃ a, minusOne a = x) ∧
    Function.Surjective (fun x : K₃ => homologyMap s 3 (c x)) := by sorry

/- No signature asserts that an arbitrary minusOne map is the Hopf action. The unavailable
sphere-unit operation cannot be replaced by a Prop-valued surrogate. -/

end ExactSequence

end

end K3Homological
end ContinuationV1


/-! ## ContinuationV2 -/

section ContinuationV2

noncomputable section
open scoped BigOperators
namespace TauCeti.K3.V2

variable {M A B : Type*} [AddCommGroup M] [AddCommGroup A] [AddCommGroup B]
variable {R : Type*} [Fintype R] [DecidableEq R]

/-- Notation for the inherited image cokernel, using the existing Mathlib quotient. -/
abbrev Ind (j : M →+ A) := A ⧸ j.range
/-- The inherited quotient homomorphism; this is Mathlib notation, not a new object. -/
abbrev q (j : M →+ A) : A →+ Ind j := QuotientAddGroup.mk' j.range

/-! K3BlochGroups:V.2/real-place-basis -/
/-- The canonical inverse of a signature coordinate. -/
def realBasis (sigma : M ≃+ (R → ZMod 2)) (v : R) : M :=
  sigma.symm (Pi.single v 1)

lemma realBasis_signature (sigma : M ≃+ (R → ZMod 2)) (v w : R) :
    sigma (realBasis sigma v) w = if w = v then 1 else 0 := by sorry
lemma realBasis_nonzero (sigma : M ≃+ (R → ZMod 2)) (v : R) :
    realBasis sigma v ≠ 0 := by sorry
lemma realBasis_two_nsmul (sigma : M ≃+ (R → ZMod 2)) (v : R) :
    (2 : ℕ) • realBasis sigma v = 0 := by sorry
lemma realBasis_expand (sigma : M ≃+ (R → ZMod 2)) (x : M) :
    x = ∑ v : R, if sigma x v = 1 then realBasis sigma v else 0 := by sorry
lemma realBasis_map {N T : Type*} [AddCommGroup N] [Fintype T] [DecidableEq T]
    (sigma : M ≃+ (R → ZMod 2)) (tau : N ≃+ (T → ZMod 2))
    (f : M →+ N) (rho : T → R)
    (comm : ∀ x w, tau (f x) w = sigma x (rho w)) (v : R) :
    f (realBasis sigma v) = ∑ w : T, if rho w = v then realBasis tau w else 0 := by sorry

/-- Test `realBasis_single`: the Q signature has one coordinate. -/
example (sigma : M ≃+ (Unit → ZMod 2)) :
    sigma (realBasis sigma ()) () = 1 := by sorry
/-- Test `realBasis_empty`: a totally imaginary signature has no coordinates. -/
example (sigma : M ≃+ (Empty → ZMod 2)) (x : M) : x = 0 := by sorry
/-- Test `realBasis_distinct`: different places are not the same all-minus-one class. -/
example (sigma : M ≃+ (R → ZMod 2)) (v w : R) (hne : v ≠ w) :
    realBasis sigma v ≠ realBasis sigma w := by sorry

/-! K3BlochGroups:V.2/real-basis-symbol-representatives.
The general typed implication below specializes to {-1,-1,u_v}. Existence of the
sign-isolating unit is supplied by the pinned weak-approximation theorem. -/
lemma real_basis_symbol_representative (sigma : M ≃+ (R → ZMod 2))
    (v : R) (symbol : M) (signs : sigma symbol = Pi.single v 1) :
    symbol = realBasis sigma v := by sorry

/-! K3BlochGroups:V.2/minus-one-product-surjective -/
/-- The lifted coordinate generators prove surjectivity of the product map. -/
theorem minusOneProduct_surjective {M2 : Type*} [AddCommGroup M2]
    (sigma : M ≃+ (R → ZMod 2)) (p : M2 →+ M) (lifts : R → M2)
    (hlifts : ∀ v, p (lifts v) = realBasis sigma v) :
    Function.Surjective p := by sorry
/-- The product square and Matsumoto transport the image identity. -/
theorem minusOneProduct_range {M2 K2 : Type*} [AddCommGroup M2] [AddCommGroup K2]
    (p : M2 →+ M) (m2 : M2 ≃+ K2) (j : M →+ A) (product : K2 →+ A)
    (hp : Function.Surjective p) (square : ∀ x, product (m2 x) = j (p x)) :
    product.range = j.range := by sorry

/-! K3BlochGroups:V.2/decomposable-signature -/
def decomposableSignature (j : M →+ A) (hj : Function.Injective j)
    (sigma : M ≃+ (R → ZMod 2)) : j.range ≃+ (R → ZMod 2) := by sorry
lemma decomposableSignature_apply (j : M →+ A) (hj : Function.Injective j)
    (sigma : M ≃+ (R → ZMod 2)) (x : M) :
    decomposableSignature j hj sigma ⟨j x, ⟨x, rfl⟩⟩ = sigma x := by sorry
lemma decomposableSignature_symm (j : M →+ A) (hj : Function.Injective j)
    (sigma : M ≃+ (R → ZMod 2)) (t : R → ZMod 2) :
    ((decomposableSignature j hj sigma).symm t : A) = j (sigma.symm t) := by sorry
lemma decomposableSignature_two_nsmul (j : M →+ A) (hj : Function.Injective j)
    (sigma : M ≃+ (R → ZMod 2)) (d : j.range) : (2 : ℕ) • d = 0 := by sorry
lemma decomposableSignature_card (j : M →+ A) (hj : Function.Injective j)
    (sigma : M ≃+ (R → ZMod 2)) : Nat.card j.range = 2 ^ Fintype.card R := by sorry
lemma decomposableSignature_map {N C T : Type*} [AddCommGroup N] [AddCommGroup C]
    [Fintype T] [DecidableEq T] (j : M →+ A) (k : N →+ C)
    (hj : Function.Injective j) (hk : Function.Injective k)
    (sigma : M ≃+ (R → ZMod 2)) (tau : N ≃+ (T → ZMod 2))
    (fm : M →+ N) (fa : A →+ C) (rho : T → R)
    (square : ∀ x, fa (j x) = k (fm x))
    (signs : ∀ x w, tau (fm x) w = sigma x (rho w)) (x : M) (w : T) :
    decomposableSignature k hk tau ⟨fa (j x), ⟨fm x, (square x).symm⟩⟩ w =
      decomposableSignature j hj sigma ⟨j x, ⟨x, rfl⟩⟩ (rho w) := by sorry

/-- Test `decomposableSignature_zero`: agreement on the zero representative. -/
example (j : M →+ A) (hj : Function.Injective j) (sigma : M ≃+ (R → ZMod 2)) :
    decomposableSignature j hj sigma ⟨j 0, ⟨0, rfl⟩⟩ = 0 := by sorry
/-- Test `decomposableSignature_one_real`: the Q class does not disappear in K3. -/
example (j : M →+ A) (hj : Function.Injective j) (sigma : M ≃+ (Unit → ZMod 2)) :
    j (sigma.symm (fun _ => 1)) ≠ 0 := by sorry
/-- Test `decomposableSignature_empty`: the decomposable subgroup is zero when r1=0. -/
example (j : M →+ A) (hj : Function.Injective j) (sigma : M ≃+ (Empty → ZMod 2))
    (x : M) : j x = 0 := by sorry

/-- Test `decomposableSignature_coordinate`: the equivalence preserves each labelled coordinate. -/
example (j : M →+ A) (hj : Function.Injective j) (sigma : M ≃+ (R → ZMod 2))
    (v : R) :
    decomposableSignature j hj sigma
      ⟨j (realBasis sigma v), ⟨realBasis sigma v, rfl⟩⟩ = Pi.single v 1 := by sorry

/-! K3BlochGroups:V.2/totally-imaginary-quotient-equivalence.
`hD` is precisely the consequence of the imported Bass–Tate theorem with no real
places. This is a general quotient construction, not an assumed quotient equivalence. -/
def totallyImaginaryQuotientEquiv (j : M →+ A) (hD : j.range = ⊥) : A ≃+ Ind j := by sorry
lemma totallyImaginaryQuotientEquiv_apply (j : M →+ A) (hD : j.range = ⊥) (x : A) :
    totallyImaginaryQuotientEquiv j hD x = q j x := by sorry
lemma totallyImaginaryQuotientEquiv_symm_apply (j : M →+ A) (hD : j.range = ⊥) (x : A) :
    (totallyImaginaryQuotientEquiv j hD).symm (q j x) = x := by sorry
lemma totallyImaginaryQuotientEquiv_map {N : Type*} [AddCommGroup N]
    (j : M →+ A) (k : N →+ B) (hj : j.range = ⊥) (hk : k.range = ⊥)
    (f : A →+ B) (h : j.range ≤ k.range.comap f) (x : A) :
    totallyImaginaryQuotientEquiv k hk (f x) =
      QuotientAddGroup.map j.range k.range f h (totallyImaginaryQuotientEquiv j hj x) := by sorry

/-- Test `totallyImaginaryQuotient_zero`: zero maps to zero. -/
example (j : M →+ A) (hD : j.range = ⊥) :
    totallyImaginaryQuotientEquiv j hD 0 = 0 := by sorry
/-- Test `totallyImaginaryQuotient_representative`: the canonical representative round trip. -/
example (j : M →+ A) (hD : j.range = ⊥) (x : A) :
    (totallyImaginaryQuotientEquiv j hD).symm (q j x) = x := by sorry
/-- Test `totallyImaginaryQuotient_injective`: exactly the zero-image hypothesis is used. -/
example (j : M →+ A) (hD : j.range = ⊥) (x y : A) :
    q j x = q j y ↔ x = y := by sorry

/-! K3BlochGroups:V.2/number-field-stable-hurewicz-equivalence.
`H` is the supplied stable integral H3(SL(F)); `h` is the V.1/V.2 Hurewicz map.
Its surjectivity and kernel equality come from the inherited theorem and the new
product theorem. No unstable SL2 object is identified here. -/
variable {H : Type*} [AddCommGroup H]
def stableHurewiczQuotientEquiv (j : M →+ A) (h : A →+ H)
    (hs : Function.Surjective h) (hk : j.range = h.ker) : Ind j ≃+ H := by sorry
lemma stableHurewiczQuotientEquiv_apply (j : M →+ A) (h : A →+ H)
    (hs : Function.Surjective h) (hk : j.range = h.ker) (x : A) :
    stableHurewiczQuotientEquiv j h hs hk (q j x) = h x := by sorry
lemma stableHurewiczQuotientEquiv_symm_apply (j : M →+ A) (h : A →+ H)
    (hs : Function.Surjective h) (hk : j.range = h.ker) (x : A) :
    (stableHurewiczQuotientEquiv j h hs hk).symm (h x) = q j x := by sorry
lemma stableHurewiczQuotientEquiv_unique (j : M →+ A) (h : A →+ H)
    (hs : Function.Surjective h) (hk : j.range = h.ker) (f : Ind j →+ H)
    (hf : ∀ x, f (q j x) = h x) :
    f = (stableHurewiczQuotientEquiv j h hs hk).toAddMonoidHom := by sorry
lemma stableHurewiczQuotientEquiv_map {N C I : Type*}
    [AddCommGroup N] [AddCommGroup C] [AddCommGroup I]
    (j : M →+ A) (k : N →+ C) (h : A →+ H) (h' : C →+ I)
    (hs : Function.Surjective h) (hs' : Function.Surjective h')
    (hk : j.range = h.ker) (hk' : k.range = h'.ker)
    (f : A →+ C) (g : H →+ I) (range_le : j.range ≤ k.range.comap f)
    (square : ∀ x, h' (f x) = g (h x)) (x : Ind j) :
    stableHurewiczQuotientEquiv k h' hs' hk' (QuotientAddGroup.map j.range k.range f range_le x) =
      g (stableHurewiczQuotientEquiv j h hs hk x) := by sorry

/-- Test `stableHurewiczQuotient_zero`: zero maps to zero. -/
example (j : M →+ A) (h : A →+ H) (hs : Function.Surjective h) (hk : j.range = h.ker) :
    stableHurewiczQuotientEquiv j h hs hk 0 = 0 := by sorry
/-- Test `stableHurewiczQuotient_decomposable`: every Milnor image is killed. -/
example (j : M →+ A) (h : A →+ H) (hs : Function.Surjective h)
    (hk : j.range = h.ker) (x : M) :
    stableHurewiczQuotientEquiv j h hs hk (q j (j x)) = 0 := by sorry
/-- Test `stableHurewiczQuotient_kernel`: the stable kernel is the actual quotient kernel. -/
example (j : M →+ A) (h : A →+ H) (hs : Function.Surjective h)
    (hk : j.range = h.ker) (x : A) : h x = 0 ↔ q j x = 0 := by sorry

/-- Test `stableHurewiczQuotient_representative`: the canonical map uses the supplied Hurewicz map. -/
example (j : M →+ A) (h : A →+ H) (hs : Function.Surjective h)
    (hk : j.range = h.ker) (x : A) :
    stableHurewiczQuotientEquiv j h hs hk (q j x) = h x := by sorry

/-! K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero: not stated;
needs actual integral motivic complexes, coefficient triangle and degree-zero
motivic-to-etale comparison, together with the K4 algebraic-closure divisibility
supplier. Exact field theorem: char F != 2 implies H^0(F,Z(2))/2 = 0.
Proof uses the exponent-two kernel bound (Chern composite +2), injects this quotient
into the natural constant etale H^0=Z/2, descends from Fbar, and forces d2=0 over
Fbar by torsionfreeness of Milnor K3 before using the surjection from divisible K4.
No predicate or assumed structure field stands in for these missing operations. -/

/-! K3BlochGroups:V.2/indecomposable-motivic-edge-equivalence.
`B` specializes to the supplied motivic H^1(F,Z(2)). Its surjectivity and exactness
are the rightmost part of the inherited motivic sequence, independent of m3 injectivity. -/
def motivicEdgeQuotientEquiv (j : M →+ A) (edge : A →+ B)
    (hs : Function.Surjective edge) (exact : Function.Exact j edge) : Ind j ≃+ B := by sorry
lemma motivicEdgeQuotientEquiv_apply (j : M →+ A) (edge : A →+ B)
    (hs : Function.Surjective edge) (exact : Function.Exact j edge) (x : A) :
    motivicEdgeQuotientEquiv j edge hs exact (q j x) = edge x := by sorry
lemma motivicEdgeQuotientEquiv_symm_apply (j : M →+ A) (edge : A →+ B)
    (hs : Function.Surjective edge) (exact : Function.Exact j edge) (x : A) :
    (motivicEdgeQuotientEquiv j edge hs exact).symm (edge x) = q j x := by sorry
lemma motivicEdgeQuotientEquiv_unique (j : M →+ A) (edge : A →+ B)
    (hs : Function.Surjective edge) (exact : Function.Exact j edge) (f : Ind j →+ B)
    (hf : ∀ x, f (q j x) = edge x) :
    f = (motivicEdgeQuotientEquiv j edge hs exact).toAddMonoidHom := by sorry
lemma motivicEdgeQuotientEquiv_map {N C I : Type*}
    [AddCommGroup N] [AddCommGroup C] [AddCommGroup I]
    (j : M →+ A) (k : N →+ C) (e : A →+ B) (e' : C →+ I)
    (hs : Function.Surjective e) (hs' : Function.Surjective e')
    (hex : Function.Exact j e) (hex' : Function.Exact k e')
    (f : A →+ C) (g : B →+ I) (range_le : j.range ≤ k.range.comap f)
    (square : ∀ x, e' (f x) = g (e x)) (x : Ind j) :
    motivicEdgeQuotientEquiv k e' hs' hex' (QuotientAddGroup.map j.range k.range f range_le x) =
      g (motivicEdgeQuotientEquiv j e hs hex x) := by sorry

/-- Test `motivicEdgeQuotient_zero`: zero maps to zero. -/
example (j : M →+ A) (edge : A →+ B) (hs : Function.Surjective edge)
    (exact : Function.Exact j edge) : motivicEdgeQuotientEquiv j edge hs exact 0 = 0 := by sorry
/-- Test `motivicEdgeQuotient_symbol`: the edge kills every Milnor image. -/
example (j : M →+ A) (edge : A →+ B) (hs : Function.Surjective edge)
    (exact : Function.Exact j edge) (x : M) :
    motivicEdgeQuotientEquiv j edge hs exact (q j (j x)) = 0 := by sorry
/-- Test `motivicEdgeQuotient_lift`: the inverse returns the correct quotient class. -/
example (j : M →+ A) (edge : A →+ B) (hs : Function.Surjective edge)
    (exact : Function.Exact j edge) (x : A) :
    (motivicEdgeQuotientEquiv j edge hs exact).symm (edge x) = q j x := by sorry

-- Inherited V.2 node names and forms remain in K3BlochGroups.lean:
-- milnorToQuillen3, K3ind (quotient API), decomposable_exactness,
-- milnorToQuillen3_injective, milnorK3_numberField, k3_rank,
-- rationalisation, k3_to_h3_sl_field, motivic_low_degree_sequence,
-- milnor_k3_kernel_exponent_two. Their source/supplier refinements are in this
-- packet's imports, importResolutions, requests and gaps, never fresh definitions.
end TauCeti.K3.V2
end

end ContinuationV2


/-! ## ContinuationV3 -/

section ContinuationV3

noncomputable section
open scoped TensorProduct
open CategoryTheory

namespace TauCeti.BlochConventions

instance primeTwo : Fact (Nat.Prime 2) := ⟨by decide⟩
instance primeThree : Fact (Nat.Prime 3) := ⟨by decide⟩
instance primeFive : Fact (Nat.Prime 5) := ⟨by decide⟩
instance primeSeven : Fact (Nat.Prime 7) := ⟨by decide⟩
instance primeEleven : Fact (Nat.Prime 11) := ⟨by decide⟩

abbrev Nondeg (F : Type) [Field F] := {x : F // x ≠ 0 ∧ x ≠ 1}
abbrev RawSymbols (F : Type) [Field F] := FreeAbelianGroup (Nondeg F)
abbrev UnitAdd (F : Type) [Field F] := Additive Fˣ
abbrev FullTensor (F : Type) [Field F] := UnitAdd F ⊗[ℤ] UnitAdd F
abbrev ProjectiveSymbols (F : Type) [Field F] := FreeAbelianGroup (OnePoint F)
def FourElements (F : Type) : Prop := 4 ≤ Cardinal.mk F

namespace Imported
variable (F : Type) [Field F]

abbrev sym (x : F) : RawSymbols F := TauCeti.BlochGroup.symbAdm F x
def unit (x : F) (hx : x ≠ 0) : UnitAdd F := Additive.ofMul (Units.mk0 x hx)

abbrev symmetric : Submodule ℤ (FullTensor F) :=
  TauCeti.BlochGroup.symmetrisedSubmodule ℤ (UnitAdd F)
abbrev Qs := TauCeti.BlochGroup.unitsWedge F
abbrev pi : FullTensor F →+ Qs F :=
  (TauCeti.BlochGroup.antisymSquare.mkQ ℤ (UnitAdd F)).toAddMonoidHom
abbrev Exterior := ⋀[ℤ]^2 (UnitAdd F)
abbrev toExterior : Qs F →+ Exterior F :=
  (TauCeti.BlochGroup.antisymSquare.toExterior ℤ (UnitAdd F)).toAddMonoidHom

def fiveTerm (x y : F) : RawSymbols F :=
  sym F x - sym F y + sym F (y / x) -
    sym F ((1 - x⁻¹) / (1 - y⁻¹)) + sym F ((1 - x) / (1 - y))
abbrev R5 : AddSubgroup (RawSymbols F) :=
  AddSubgroup.closure {r | ∃ x y : F, x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧
    x ≠ y ∧ r = fiveTerm F x y}
abbrev P := TauCeti.BlochGroup.preBloch F
def q : RawSymbols F →+ P F :=
  FreeAbelianGroup.lift (fun x => TauCeti.BlochGroup.preBloch.gen F x.1)
abbrev boundary : P F →+ Qs F := TauCeti.BlochGroup.blochBoundary F
abbrev B := TauCeti.BlochGroup.blochGroup F
abbrev BE := TauCeti.BlochGroup.extBloch F

/-- The two inherited presentations differ only by killing the [1] generator. -/
theorem q_kernel : (q F).ker = R5 F := by sorry
theorem q_surjective : Function.Surjective (q F) := by sorry
def reducedPresentation : (RawSymbols F ⧸ R5 F) ≃+ P F := by sorry
lemma reducedPresentation_mk (x : RawSymbols F) :
    reducedPresentation F (QuotientAddGroup.mk x) = q F x := by sorry

abbrev angle (u : UnitAdd F) : P F := TauCeti.BlochGroup.angle F u.toMul
lemma fourElements_ENat (hF : FourElements F) : 4 ≤ ENat.card F := by sorry
abbrev h (hF : FourElements F) : UnitAdd F →+ P F :=
  TauCeti.BlochGroup.angleBracket F (fourElements_ENat F hF)
lemma h_apply (hF : FourElements F) (u : UnitAdd F) :
    h F hF u = angle F u := by sorry
abbrev H : AddSubgroup (P F) := AddSubgroup.closure (Set.range (angle F))
lemma H_eq_range (hF : FourElements F) : H F = (h F hF).range := by sorry
abbrev c : B F := TauCeti.BlochGroup.c F

variable {E : Type} [Field E]
def freeMap (f : F →+* E) : RawSymbols F →+ RawSymbols E :=
  FreeAbelianGroup.map (fun x => ⟨f x.1, by sorry⟩)
abbrev tensorMap (f : F →+* E) : FullTensor F →+ FullTensor E :=
  (TensorProduct.map (AddMonoidHom.toIntLinearMap (Units.map f.toMonoidHom).toAdditive)
    (AddMonoidHom.toIntLinearMap (Units.map f.toMonoidHom).toAdditive)).toAddMonoidHom
abbrev pMap (f : F →+* E) : P F →+ P E := TauCeti.BlochGroup.preBloch.map F f
abbrev bMap (f : F →+* E) : B F →+ B E := TauCeti.BlochGroup.blochGroup.map F f

-- Owned by V.4/cross-ratio; no second configuration object.
open Classical in
abbrev crossRatio (t : Fin 4 ↪ OnePoint F) : Nondeg F := TauCeti.Suslin.crossRatio F t
abbrev Cext : AddSubgroup (ProjectiveSymbols F) := TauCeti.BlochGroup.cgzRelations F
abbrev Extended := ProjectiveSymbols F ⧸ Cext F
abbrev extQ : ProjectiveSymbols F →+ Extended F := QuotientAddGroup.mk' (Cext F)
abbrev j : P F →+ Extended F := TauCeti.BlochGroup.preBlochToCGZ F
abbrev oldBoundary : ProjectiveSymbols F →+ Exterior F := TauCeti.BlochGroup.cgzBoundary F
abbrev OldCycles := TauCeti.BlochGroup.cgzA F
def oldCycleMap : OldCycles F →+ Extended F := (extQ F).comp (OldCycles F).subtype
abbrev OldB := TauCeti.BlochGroup.cgzBloch F
abbrev oldCompare : B F →+ OldB F := TauCeti.BlochGroup.cgzComparison F

def coeffMap (R : Type) [CommRing R] {M N : Type} [AddCommGroup M] [AddCommGroup N]
    (f : M →+ N) : R ⊗[ℤ] M →+ R ⊗[ℤ] N :=
  (TensorProduct.map (LinearMap.id : R →ₗ[ℤ] R) f.toIntLinearMap).toAddMonoidHom
end Imported

/-! K3BlochGroups:V.3/bloch-lecture-kernel -/
namespace LectureBloch
variable (F : Type) [Field F]

def lambda : RawSymbols F →+ FullTensor F := by sorry
abbrev Group := (lambda F).ker

lemma lambda_symbol (x : F) (hx : x ≠ 0) (hx1 : x ≠ 1) :
    lambda F (Imported.sym F x) =
      Imported.unit F (1 - x) (by sorry) ⊗ₜ[ℤ] Imported.unit F x hx := by sorry
lemma mem_iff (α : RawSymbols F) : α ∈ (lambda F).ker ↔ lambda F α = 0 := by sorry
lemma inclusion_injective : Function.Injective ((lambda F).ker.subtype) := by sorry

def map {E : Type} [Field E] (f : F →+* E) : Group F →+ Group E := by sorry
lemma map_symbol {E : Type} [Field E] (f : F →+* E) :
    (lambda E).comp (Imported.freeMap F f) =
      (Imported.tensorMap F f).comp (lambda F) ∧
    ∀ α : Group F, ((map F f α) : RawSymbols E) = Imported.freeMap F f α := by sorry
lemma map_id (α : Group F) : map F (RingHom.id F) α = α := by sorry
lemma map_comp {E G : Type} [Field E] [Field G] (f : F →+* E) (g : E →+* G)
    (α : Group F) : map E g (map F f α) = map F (g.comp f) α := by sorry

/-- Test `LectureBloch.test_F2`. -/
example : Subsingleton (Group (ZMod 2)) := by sorry
/-- Test `LectureBloch.test_F3`. -/
example : ∃ e : RawSymbols (ZMod 3) ≃+ ℤ,
    e (Imported.sym (ZMod 3) (-1)) = 1 ∧
    (∃ t : FullTensor (ZMod 3) ≃+ ZMod 2,
      t (lambda (ZMod 3) (Imported.sym (ZMod 3) (-1))) = 1) ∧
    ∀ α, lambda (ZMod 3) α = 0 ↔ Even (e α) := by sorry
/-- Test `LectureBloch.test_F5_relation`. -/
example : Imported.fiveTerm (ZMod 5) 2 3 = Imported.sym (ZMod 5) 4 ∧
    lambda (ZMod 5) (Imported.sym (ZMod 5) 4) ≠ 0 ∧
    2 • lambda (ZMod 5) (Imported.sym (ZMod 5) 4) = 0 := by sorry

/-! K3BlochGroups:V.3/bloch-lecture-comparison -/
def mu : Group F →+ Imported.B F := by sorry
abbrev rawRelations : AddSubgroup (Group F) := (Imported.R5 F).comap (lambda F).ker.subtype
abbrev RelationQuotient := Group F ⧸ rawRelations F
def muRel : RelationQuotient F →+ Imported.B F := by sorry

lemma boundary_compare : (Imported.boundary F).comp (Imported.q F) =
    -((Imported.pi F).comp (lambda F)) := by sorry
lemma mu_coe (α : Group F) : ((mu F α) : Imported.P F) = Imported.q F α := by sorry
lemma mu_ker (α : Group F) : mu F α = 0 ↔ (α : RawSymbols F) ∈ Imported.R5 F := by sorry
lemma muRel_injective : Function.Injective (muRel F) ∧
    (muRel F).comp (QuotientAddGroup.mk' (rawRelations F)) = mu F ∧
    ∀ f : RelationQuotient F →+ Imported.B F,
      f.comp (QuotientAddGroup.mk' (rawRelations F)) = mu F → f = muRel F := by sorry

/-- Test `LectureBloch.test_F5_kernel`. -/
example : ∃ α : Group (ZMod 5),
    (α : RawSymbols (ZMod 5)) = 2 • Imported.sym (ZMod 5) 4 ∧
    α ≠ 0 ∧ mu (ZMod 5) α = 0 ∧ addOrderOf α = 0 := by sorry
/-- Test `LectureBloch.test_F5_generator`. -/
example : ∃ α : Group (ZMod 5),
    (α : RawSymbols (ZMod 5)) = 4 • Imported.sym (ZMod 5) 3 ∧
    ((mu (ZMod 5) α) : Imported.P (ZMod 5)) = 4 • Imported.q (ZMod 5)
      (Imported.sym (ZMod 5) 3) ∧ addOrderOf (mu (ZMod 5) α) = 3 := by sorry
/-- Test `LectureBloch.test_Q_kernel`. -/
example : ∃ α : Group ℚ, (α : RawSymbols ℚ) = 4 • Imported.sym ℚ (-1) ∧
    α ≠ 0 ∧ mu ℚ α = 0 ∧ addOrderOf α = 0 := by sorry

/-! K3BlochGroups:V.3/bloch-lecture-obstruction -/
abbrev E := (lambda F).range ⊓ (Imported.symmetric F).toAddSubgroup
abbrev L := (Imported.R5 F).map (lambda F)
abbrev Obstruction := E F ⧸ ((L F).comap (E F).subtype)
def obstruction : Imported.B F →+ Obstruction F := by sorry

theorem obstruction_exact : L F ≤ E F ∧ (mu F).ker = rawRelations F ∧
    Function.Exact (mu F) (obstruction F) ∧ Function.Surjective (obstruction F) := by sorry

def sigma : RawSymbols F →+ RawSymbols F := by sorry
def degree : RawSymbols F →+ ℤ := FreeAbelianGroup.lift (fun _ => 1)

/-! K3BlochGroups:V.3/bloch-lecture-six-torsion -/
theorem six_lift (hF : FourElements F) (β : Imported.B F) (α : RawSymbols F)
    (hα : Imported.q F α = (β : Imported.P F)) :
    let γ := 3 • (α - sigma F α) + degree F α • (2 • Imported.sym F (-1))
    lambda F γ = 0 ∧ Imported.q F γ = 6 • (β : Imported.P F) := by sorry

theorem six_obstruction (hF : FourElements F) (x : Obstruction F) : 6 • x = 0 := by sorry
end LectureBloch

/-! K3BlochGroups:V.3/goncharov-generic-b2 -/
namespace GoncharovB2
variable (F : Type) [Field F]

def configurationRelation (t : Fin 5 ↪ OnePoint F) : RawSymbols F :=
  ∑ i : Fin 5, ((-1 : ℤ) ^ (i : ℕ)) •
    FreeAbelianGroup.of (Imported.crossRatio F (i.succAboveEmb.trans t))
abbrev relations : AddSubgroup (RawSymbols F) :=
  AddSubgroup.closure (Set.range (configurationRelation F))
abbrev Group := RawSymbols F ⧸ relations F
abbrev mk : RawSymbols F →+ Group F := QuotientAddGroup.mk' (relations F)
def «class» (x : F) : Group F := mk F (Imported.sym F x)

lemma eq_iff (α β : RawSymbols F) : mk F α = mk F β ↔ α - β ∈ relations F := by sorry
def lift {M : Type} [AddCommGroup M] (f : RawSymbols F →+ M)
    (hf : ∀ t, f (configurationRelation F t) = 0) : Group F →+ M := by sorry
lemma lift_mk {M : Type} [AddCommGroup M] (f : RawSymbols F →+ M)
    (hf : ∀ t, f (configurationRelation F t) = 0) :
    (lift F f hf).comp (mk F) = f ∧
    ∀ g : Group F →+ M, g.comp (mk F) = f → g = lift F f hf := by sorry

def map {E : Type} [Field E] (f : F →+* E) : Group F →+ Group E := by sorry
lemma map_symbol {E : Type} [Field E] (f : F →+* E) (x : F) :
    map F f («class» F x) = «class» E (f x) := by sorry
lemma map_id (x : Group F) : map F (RingHom.id F) x = x := by sorry
lemma map_comp {E G : Type} [Field E] [Field G] (f : F →+* E) (g : E →+* G)
    (x : Group F) : map E g (map F f x) = map F (g.comp f) x := by sorry

/-- Test `GoncharovB2.test_F2`. -/
example : Subsingleton (Group (ZMod 2)) := by sorry
/-- Test `GoncharovB2.test_F3`. -/
example : ∃ e : Group (ZMod 3) ≃+ ℤ, e («class» (ZMod 3) (-1)) = 1 := by sorry
/-- Test `GoncharovB2.test_F5`. -/
example : ∃ e : Group (ZMod 5) ≃+ ZMod 6,
    e («class» (ZMod 5) 3) = 1 := by sorry

/-! K3BlochGroups:V.3/goncharov-generic-comparison -/
def compare : Group F ≃+ Imported.P F := by sorry
def boundary : Group F →+ Imported.Qs F := by sorry

theorem generic_compare : (relations F = Imported.R5 F) ∧
    (∀ x, compare F («class» F x) = Imported.q F (Imported.sym F x)) ∧
    boundary F = -((Imported.boundary F).comp (compare F).toAddMonoidHom) := by sorry

def kernelCompare : (boundary F).ker ≃+ Imported.B F := by sorry
/-- The second half of Test `GoncharovB2.test_F5`: B₂ is not its cycle kernel. -/
example : boundary (ZMod 5) («class» (ZMod 5) 3) ≠ 0 ∧
    Nonempty ((boundary (ZMod 5)).ker ≃+ ZMod 3) := by sorry
end GoncharovB2

/-! K3BlochGroups:V.3/cgz-published-negative-tensor -/
namespace CGZPublished
variable (F : Type) [Field F]

def negativeUnit (u : UnitAdd F) : UnitAdd F := Additive.ofMul (-u.toMul)
abbrev negativeRelations : Submodule ℤ (FullTensor F) :=
  Submodule.span ℤ (Set.range fun u : UnitAdd F => u ⊗ₜ[ℤ] negativeUnit F u)
abbrev NegativeTarget := FullTensor F ⧸ negativeRelations F
abbrev tensorProjection : FullTensor F →+ NegativeTarget F :=
  (negativeRelations F).mkQ.toAddMonoidHom
def negativeProjection : Imported.Qs F →+ NegativeTarget F := by sorry

lemma negativeTensor_zero (u : UnitAdd F) :
    tensorProjection F (u ⊗ₜ[ℤ] negativeUnit F u) = 0 := by sorry
lemma tensorProjection_surjective : Function.Surjective (tensorProjection F) ∧
    (negativeProjection F).comp (Imported.pi F) = tensorProjection F := by sorry

def tensorLift {M : Type} [AddCommGroup M] (f : FullTensor F →+ M)
    (hf : ∀ u, f (u ⊗ₜ[ℤ] negativeUnit F u) = 0) : NegativeTarget F →+ M := by sorry
lemma tensorLift_unique {M : Type} [AddCommGroup M] (f : FullTensor F →+ M)
    (hf : ∀ u, f (u ⊗ₜ[ℤ] negativeUnit F u) = 0) :
    (tensorLift F f hf).comp (tensorProjection F) = f ∧
    ∀ g : NegativeTarget F →+ M,
      g.comp (tensorProjection F) = f → g = tensorLift F f hf := by sorry
lemma symmetrizer_le : Imported.symmetric F ≤ negativeRelations F := by sorry

/-- Test `CGZPublished.test_tensor_F3`. -/
example : Nonempty (NegativeTarget (ZMod 3) ≃+ ZMod 2) ∧
    Subsingleton (Imported.Exterior (ZMod 3)) := by sorry
/-- Test `CGZPublished.test_tensor_F5`. -/
example : Nonempty (Imported.Qs (ZMod 5) ≃+ ZMod 2) ∧
    Subsingleton (NegativeTarget (ZMod 5)) ∧
    (∃ t : FullTensor (ZMod 5) ≃+ ZMod 4,
      let g := Imported.unit (ZMod 5) 2 (by sorry)
      t (g ⊗ₜ[ℤ] g) = 1 ∧
      t (g ⊗ₜ[ℤ] negativeUnit (ZMod 5) g) = 3) := by sorry
/-- Test `CGZPublished.test_tensor_Q`. -/
example : let u := Imported.unit ℚ 2 (by sorry)
    let v := negativeUnit ℚ u
    tensorProjection ℚ (u ⊗ₜ[ℤ] v) = 0 ∧
      Imported.toExterior ℚ (Imported.pi ℚ (u ⊗ₜ[ℤ] v)) ≠ 0 := by sorry

/-! K3BlochGroups:V.3/cgz-published-target-kernel -/
theorem target_kernel (hF : FourElements F) :
    (negativeProjection F).ker = (Imported.H F).map (Imported.boundary F) ∧
    ((negativeProjection F).comp (Imported.boundary F)).ker =
      Imported.B F ⊔ Imported.H F ∧ ∀ h : Imported.H F, 2 • h = 0 := by sorry

/-! K3BlochGroups:V.3/cgz-published-boundary -/
def boundary : ProjectiveSymbols F →+ NegativeTarget F := by sorry
def boundaryQuotient : Imported.Extended F →+ NegativeTarget F := by sorry

lemma boundary_symbol (x : F) (hx : x ≠ 0) (hx1 : x ≠ 1) :
    boundary F (FreeAbelianGroup.of (x : OnePoint F)) = tensorProjection F
      (Imported.unit F x hx ⊗ₜ[ℤ] Imported.unit F (1 - x) (by sorry)) ∧
    boundary F (FreeAbelianGroup.of (0 : F)) = 0 ∧
    boundary F (FreeAbelianGroup.of (1 : F)) = 0 ∧
    boundary F (FreeAbelianGroup.of (OnePoint.infty : OnePoint F)) = 0 := by sorry
lemma relations_le_kernel : Imported.Cext F ≤ (boundary F).ker := by sorry
lemma boundaryQuotient_unique :
    (boundaryQuotient F).comp (Imported.extQ F) = boundary F ∧
    ∀ d : Imported.Extended F →+ NegativeTarget F,
      d.comp (Imported.extQ F) = boundary F → d = boundaryQuotient F := by sorry
lemma boundary_ordinary : (boundaryQuotient F).comp (Imported.j F) =
    (negativeProjection F).comp (Imported.boundary F) := by sorry

/-- Test `CGZPublished.test_boundary_degenerate`. -/
example : boundary F (FreeAbelianGroup.of ((0 : F) : OnePoint F)) = 0 ∧
    boundary F (FreeAbelianGroup.of ((1 : F) : OnePoint F)) = 0 ∧
    boundary F (FreeAbelianGroup.of (OnePoint.infty : OnePoint F)) = 0 := by sorry
/-- Test `CGZPublished.test_boundary_F5`. -/
example : boundary (ZMod 5) (FreeAbelianGroup.of ((2 : (ZMod 5)) : OnePoint (ZMod 5)) +
      FreeAbelianGroup.of ((3 : (ZMod 5)) : OnePoint (ZMod 5))) = 0 ∧
    Imported.boundary (ZMod 5)
      (Imported.q (ZMod 5) (Imported.sym (ZMod 5) 2 + Imported.sym (ZMod 5) 3)) ≠ 0 := by sorry
/-- Test `CGZPublished.test_boundary_Q_relation`. -/
example : let r : ProjectiveSymbols ℚ := FreeAbelianGroup.of ((2 : ℚ) : OnePoint ℚ) +
    FreeAbelianGroup.of ((1 / 2 : ℚ) : OnePoint ℚ) - FreeAbelianGroup.of ((1 : ℚ) : OnePoint ℚ)
    boundary ℚ r = 0 ∧ Imported.oldBoundary ℚ r ≠ 0 := by sorry

/-! K3BlochGroups:V.3/cgz-published-bloch-group -/
abbrev Cycles := (boundary F).ker
abbrev cycleRelations : AddSubgroup (Cycles F) :=
  (Imported.Cext F).comap (boundary F).ker.subtype
abbrev CycleQuotient := Cycles F ⧸ cycleRelations F
abbrev Group := (boundaryQuotient F).ker

def cycleClass : Cycles F →+ Group F := by sorry
lemma cycleClass_eq_iff (α β : Cycles F) :
    cycleClass F α = cycleClass F β ↔
      (α : ProjectiveSymbols F) - (β : ProjectiveSymbols F) ∈ Imported.Cext F := by sorry
def kernelEquiv : CycleQuotient F ≃+ Group F := by sorry
lemma kernelEquiv_mk (α : Cycles F) :
    kernelEquiv F (QuotientAddGroup.mk' (cycleRelations F) α) = cycleClass F α ∧
    ((cycleClass F α) : Imported.Extended F) = Imported.extQ F α := by sorry

def cycleLift {M : Type} [AddCommGroup M] (f : Cycles F →+ M)
    (hf : cycleRelations F ≤ f.ker) : Group F →+ M := by sorry
lemma cycleLift_unique {M : Type} [AddCommGroup M] (f : Cycles F →+ M)
    (hf : cycleRelations F ≤ f.ker) :
    (cycleLift F f hf).comp (cycleClass F) = f ∧
    ∀ g : Group F →+ M, g.comp (cycleClass F) = f → g = cycleLift F f hf := by sorry

def zeroCycle : Cycles F := ⟨FreeAbelianGroup.of ((0 : F) : OnePoint F), by sorry⟩
/-- Test `CGZPublished.test_group_F2`. -/
example : ∃ e : Group (ZMod 2) ≃+ ZMod 3,
    e (cycleClass (ZMod 2) (zeroCycle (ZMod 2))) = 1 := by sorry
/-- Test `CGZPublished.test_group_F3`. -/
example : Subsingleton (Group (ZMod 3)) ∧
    Nonempty (Imported.Extended (ZMod 3) ≃+ ZMod 2) ∧
    Function.Bijective (boundaryQuotient (ZMod 3)) := by sorry
/-- Test `CGZPublished.test_group_F11`. -/
example : Nonempty (Group (ZMod 11) ≃+ ZMod 3) ∧
    Nonempty (Imported.OldB (ZMod 11) ≃+ ZMod 6) := by sorry

/-! K3BlochGroups:V.3/cgz-published-comparison-map -/
def compare : Imported.B F →+ Group F := by sorry
lemma compare_coe (β : Imported.B F) :
    ((compare F β) : Imported.Extended F) = Imported.j F β := by sorry
lemma compare_c (hF : FourElements F) :
    compare F (Imported.c F) = cycleClass F (zeroCycle F) := by sorry
lemma compare_angle (hF : FourElements F) (u : UnitAdd F)
    (hu : Imported.angle F u ∈ Imported.B F) :
    compare F ⟨Imported.angle F u, hu⟩ = 0 := by sorry

def map {E : Type} [Field E] (f : F →+* E) : Group F →+ Group E := by sorry
lemma compare_natural {E : Type} [Field E] (f : F →+* E) :
    (map F f).comp (compare F) = (compare E).comp (Imported.bMap F f) := by sorry
lemma map_id (β : Group F) : map F (RingHom.id F) β = β := by sorry
lemma map_comp {E G : Type} [Field E] [Field G] (f : F →+* E) (g : E →+* G)
    (β : Group F) : map E g (map F f β) = map F (g.comp f) β := by sorry

/-- Test `CGZPublished.test_compare_F5`. -/
example : Function.Bijective (compare (ZMod 5)) ∧
    compare (ZMod 5) (Imported.c (ZMod 5)) = cycleClass (ZMod 5) (zeroCycle (ZMod 5)) ∧
    addOrderOf (compare (ZMod 5) (Imported.c (ZMod 5))) = 3 := by sorry
/-- Test `CGZPublished.test_compare_F7`. -/
example : Nonempty (Imported.B (ZMod 7) ≃+ ZMod 4) ∧
    Nonempty (Group (ZMod 7) ≃+ ZMod 2) ∧
    (compare (ZMod 7)).ker = AddSubgroup.zmultiples (Imported.c (ZMod 7)) ∧
    addOrderOf (Imported.c (ZMod 7)) = 2 ∧ compare (ZMod 7) (Imported.c (ZMod 7)) = 0 := by sorry
/-- Test `CGZPublished.test_compare_F11`. -/
example : Nonempty (Imported.B (ZMod 11) ≃+ ZMod 6) ∧
    addOrderOf (compare (ZMod 11) (Imported.c (ZMod 11))) = 3 ∧
    (compare (ZMod 11)).ker = AddSubgroup.zmultiples (3 • Imported.c (ZMod 11)) := by sorry

/-! K3BlochGroups:V.3/cgz-published-lemma-two-two -/
abbrev angleKernel : AddSubgroup (Imported.B F) := (Imported.H F).comap (Imported.B F).subtype

theorem published_lemma_two_two (hF : FourElements F) :
    Function.Surjective (compare F) ∧ (compare F).ker = angleKernel F ∧
    ∀ β : angleKernel F, 2 • β = 0 := by sorry

def classicalQuotientEquiv (hF : FourElements F) :
    Imported.B F ⧸ angleKernel F ≃+ Group F := by sorry

/-! K3BlochGroups:V.3/cgz-published-to-older -/
def toOlder (hF : FourElements F) : Group F →+ Imported.OldB F := by sorry
abbrev olderCorrection := Imported.BE F ⧸
  ((Imported.B F ⊔ (Imported.BE F ⊓ Imported.H F)).comap (Imported.BE F).subtype)

theorem published_to_older (hF : FourElements F) :
    Function.Injective (toOlder F hF) ∧
    Imported.oldCompare F = (toOlder F hF).comp (compare F) ∧
    Nonempty ((Imported.OldB F ⧸ (toOlder F hF).range) ≃+ olderCorrection F) ∧
    ∀ z : olderCorrection F, 2 • z = 0 := by sorry

abbrev zeroDegenerateSubgroup : AddSubgroup (Group F) :=
  AddSubgroup.zmultiples (cycleClass F (zeroCycle F))
abbrev ZeroDegenerate := Group F ⧸ zeroDegenerateSubgroup F
abbrev zeroDegenerateCompare : Imported.B F →+ ZeroDegenerate F :=
  (QuotientAddGroup.mk' (zeroDegenerateSubgroup F)).comp (compare F)

theorem extra_zero_degenerate (hF : FourElements F) :
    Function.Surjective (zeroDegenerateCompare F) ∧
    (zeroDegenerateCompare F).ker = angleKernel F ⊔ AddSubgroup.zmultiples (Imported.c F) ∧
    ∀ β : (zeroDegenerateCompare F).ker, 6 • β = 0 := by sorry
end CGZPublished

/-! K3BlochGroups:V.3/goncharov-curve-b2.
The scheme bundle records mathematical predicates already in Mathlib. No
field stores an unspecified theorem or a stand-in proposition. Its general
geometry is owned by the upstream AlgebraicCurves dictionary.
-/
open AlgebraicGeometry

structure SmoothCurve (F : Type) [Field F] where
  X : Scheme.{0}
  toBase : X ⟶ Spec (CommRingCat.of F)
  integral : IsIntegral X
  smooth : SmoothOfRelativeDimension 1 toBase
  quasiCompact : QuasiCompact toBase
  separated : IsSeparated toBase
-- Smoothness is locally of finite presentation. Quasi-compactness makes
-- these finite-type curves; separatedness excludes nonseparated schemes.
attribute [instance] SmoothCurve.integral SmoothCurve.smooth
  SmoothCurve.quasiCompact SmoothCurve.separated

abbrev SmoothCurve.Point {F : Type} [Field F] (C : SmoothCurve F) :=
  {u : Spec (CommRingCat.of F) ⟶ C.X // u ≫ C.toBase = 𝟙 _}

/-- Type of the upstream projective evaluation maps. Canonical construction
and its local-DVR correctness contract are an outstanding request, not assumed
as an opaque proposition. The quotient below can be formed from any family;
its geometric comparisons need the explicit input conditions shown below. -/
abbrev CurveSpecializations := ∀ (F : Type) [Field F] (C : SmoothCurve F),
  C.Point → OnePoint C.X.functionField → OnePoint F

namespace GoncharovCurve
variable (sp : CurveSpecializations) (F : Type) [Field F]

abbrev Symbols := OnePoint F →₀ ℚ
abbrev Target := ℚ ⊗[ℤ] Imported.Qs F

def rawBoundary : Symbols F →ₗ[ℚ] Target F := by
  classical
  exact Finsupp.linearCombination ℚ fun z =>
    match z with
    | none => 0
    | some x => if hx : x ≠ 0 ∧ x ≠ 1 then
        (1 : ℚ) ⊗ₜ[ℤ] Imported.pi F
          (Imported.unit F (1 - x) (by sorry) ⊗ₜ[ℤ] Imported.unit F x hx.1)
      else 0

def specialize (C : SmoothCurve F) (u : C.Point) :
    Symbols C.X.functionField →ₗ[ℚ] Symbols F :=
  Finsupp.linearCombination ℚ fun z => Finsupp.single (sp F C u z) 1

abbrev relations : Submodule ℚ (Symbols F) :=
  Submodule.span ℚ {r | r = Finsupp.single ((0 : F) : OnePoint F) 1 ∨
    r = Finsupp.single (OnePoint.infty : OnePoint F) 1 ∨
    ∃ (C : SmoothCurve F) (u v : C.Point) (α : Symbols C.X.functionField),
      rawBoundary C.X.functionField α = 0 ∧
      r = specialize sp F C u α - specialize sp F C v α}
abbrev Group := Symbols F ⧸ relations sp F
abbrev mk : Symbols F →ₗ[ℚ] Group sp F := (relations sp F).mkQ

def «class» (z : OnePoint F) : Group sp F := mk sp F (Finsupp.single z 1)
lemma eq_iff (α β : Symbols F) : mk sp F α = mk sp F β ↔
    α - β ∈ relations sp F := by sorry

def lift {M : Type} [AddCommGroup M] [Module ℚ M] (f : Symbols F →ₗ[ℚ] M)
    (h0 : f (Finsupp.single ((0 : F) : OnePoint F) 1) = 0)
    (hInfinity : f (Finsupp.single (OnePoint.infty : OnePoint F) 1) = 0)
    (hsp : ∀ (C : SmoothCurve F) (u v : C.Point) (α : Symbols C.X.functionField),
      rawBoundary C.X.functionField α = 0 →
      f (specialize sp F C u α - specialize sp F C v α) = 0) :
    Group sp F →ₗ[ℚ] M := by sorry
lemma lift_unique {M : Type} [AddCommGroup M] [Module ℚ M] (f : Symbols F →ₗ[ℚ] M)
    (h0 : f (Finsupp.single ((0 : F) : OnePoint F) 1) = 0)
    (hInfinity : f (Finsupp.single (OnePoint.infty : OnePoint F) 1) = 0)
    (hsp : ∀ (C : SmoothCurve F) (u v : C.Point) (α : Symbols C.X.functionField),
      rawBoundary C.X.functionField α = 0 →
      f (specialize sp F C u α - specialize sp F C v α) = 0) :
    (lift sp F f h0 hInfinity hsp).comp (mk sp F) = f ∧
    ∀ g : Group sp F →ₗ[ℚ] M, g.comp (mk sp F) = f → g = lift sp F f h0 hInfinity hsp := by sorry
lemma specialization_relation (C : SmoothCurve F) (u v : C.Point)
    (α : Symbols C.X.functionField) (hα : rawBoundary C.X.functionField α = 0) :
    mk sp F (specialize sp F C u α) = mk sp F (specialize sp F C v α) := by sorry

/-- Test `GoncharovCurve.test_zero`. -/
example : «class» sp F ((0 : F) : OnePoint F) = 0 ∧
    «class» sp F (OnePoint.infty : OnePoint F) = 0 := by sorry
/-- Test `GoncharovCurve.test_one`.
Instantiate C with P¹, t with its affine coordinate and u,v with 0,∞.
The evaluation equalities are genuine geometric inputs of the missing supplier,
not a proposition replacing them. -/
example (C : SmoothCurve F) (u v : C.Point) (t : C.X.functionField)
    (hu : sp F C u (t : OnePoint C.X.functionField) = ((0 : F) : OnePoint F))
    (hu1 : sp F C u (((1 : C.X.functionField) - t : C.X.functionField) : OnePoint C.X.functionField) = ((1 : F) : OnePoint F))
    (hv : sp F C v (t : OnePoint C.X.functionField) = OnePoint.infty)
    (hv1 : sp F C v (((1 : C.X.functionField) - t : C.X.functionField) : OnePoint C.X.functionField) = OnePoint.infty) :
    «class» sp F ((1 : F) : OnePoint F) = 0 := by sorry
/-- Test `GoncharovCurve.test_inversion`.
Instantiate C with P¹, t with its coordinate, and u,v with x,0. -/
example (C : SmoothCurve F) (u v : C.Point) (t : C.X.functionField) (x : F) (hx : x ≠ 0)
    (hu : sp F C u (t : OnePoint C.X.functionField) = (x : OnePoint F))
    (hui : sp F C u ((t⁻¹ : C.X.functionField) : OnePoint C.X.functionField) = ((x⁻¹ : F) : OnePoint F))
    (hv : sp F C v (t : OnePoint C.X.functionField) = ((0 : F) : OnePoint F))
    (hvi : sp F C v ((t⁻¹ : C.X.functionField) : OnePoint C.X.functionField) = OnePoint.infty) :
    «class» sp F (x : OnePoint F) + «class» sp F ((x⁻¹ : F) : OnePoint F) = 0 := by sorry

/-! K3BlochGroups:V.3/goncharov-curve-boundary.
`relations_le_kernel`: not stated unconditionally; needs the canonical
local-DVR projective specialization and the P.4 degree-two valuation formula.
The following is the exact, conventional quotient-descent signature.
-/
def boundary (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    Group sp F →ₗ[ℚ] Target F := (relations sp F).liftQ (rawBoundary F) hclosure
lemma boundary_class (hclosure : relations sp F ≤ (rawBoundary F).ker) (z : OnePoint F) :
    boundary sp F hclosure («class» sp F z) = rawBoundary F (Finsupp.single z 1) := by sorry
lemma boundary_unique (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    (boundary sp F hclosure).comp (mk sp F) = rawBoundary F ∧
    ∀ d : Group sp F →ₗ[ℚ] Target F,
      d.comp (mk sp F) = rawBoundary F → d = boundary sp F hclosure := by sorry
lemma mem_kernel (hclosure : relations sp F ≤ (rawBoundary F).ker) (α : Symbols F) :
    mk sp F α ∈ (boundary sp F hclosure).ker ↔ rawBoundary F α = 0 := by sorry

/-- Test `GoncharovCurve.test_boundary_degenerate`. -/
example (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    boundary sp F hclosure («class» sp F ((0 : F) : OnePoint F)) = 0 ∧
    boundary sp F hclosure («class» sp F ((1 : F) : OnePoint F)) = 0 ∧
    boundary sp F hclosure («class» sp F (OnePoint.infty : OnePoint F)) = 0 := by sorry
/-- Test `GoncharovCurve.test_boundary_complex`. -/
example (hclosure : relations sp ℂ ≤ (rawBoundary ℂ).ker) :
    boundary sp ℂ hclosure («class» sp ℂ (Complex.I : OnePoint ℂ)) = 0 := by sorry

/-! K3BlochGroups:V.3/goncharov-curve-comparison.
`generic_relations_le`: not stated unconditionally; needs the canonical
P¹ specialization compatibility to evaluate R(1+t(x-1),y) at 1 and 0.
An arbitrary `sp` does not discharge either `hR5` or `hclosure`.
-/
abbrev RationalP := ℚ ⊗[ℤ] Imported.P F
abbrev RationalB := ℚ ⊗[ℤ] Imported.B F

def toGeneric : Symbols F →ₗ[ℚ] RationalP F :=
  Finsupp.linearCombination ℚ fun z => match z with
    | none => 0
    | some x => (1 : ℚ) ⊗ₜ[ℤ] Imported.q F (Imported.sym F x)
abbrev reducedRelations : Submodule ℚ (Symbols F) := (toGeneric F).ker
abbrev Correction := relations sp F ⧸ (reducedRelations F).comap (relations sp F).subtype

def genericCompare (hR5 : reducedRelations F ≤ relations sp F) :
    RationalP F →ₗ[ℚ] Group sp F := by sorry
def rationalPartial : RationalP F →ₗ[ℚ] Target F := by sorry

def cycleCompare (hR5 : reducedRelations F ≤ relations sp F)
    (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    RationalB F →ₗ[ℚ] (boundary sp F hclosure).ker := by sorry

theorem curve_comparison (hR5 : reducedRelations F ≤ relations sp F)
    (hclosure : relations sp F ≤ (rawBoundary F).ker) :
    Function.Surjective (genericCompare sp F hR5) ∧
    (genericCompare sp F hR5).comp (toGeneric F) = mk sp F ∧
    Nonempty ((genericCompare sp F hR5).ker ≃ₗ[ℚ] Correction sp F) ∧
    Function.Surjective (cycleCompare sp F hR5 hclosure) ∧
    Nonempty ((cycleCompare sp F hR5 hclosure).ker ≃ₗ[ℚ] Correction sp F) := by sorry

/-- Test `GoncharovCurve.test_boundary_sign`. -/
example (hR5 : reducedRelations F ≤ relations sp F)
    (hclosure : relations sp F ≤ (rawBoundary F).ker) (β : RationalP F) :
    boundary sp F hclosure (genericCompare sp F hR5 β) = -(rationalPartial F β) := by sorry

-- The canonical projective-line evaluations prove hOne and hInv below.
-- This is the exceptional small-field acceptance calculation, not an
-- unconditional claim about an arbitrary evaluation family.
example (hR5 : reducedRelations (ZMod 3) ≤ relations sp (ZMod 3))
    (hOne : «class» sp (ZMod 3) ((1 : ZMod 3) : OnePoint (ZMod 3)) = 0)
    (hInv : «class» sp (ZMod 3) ((-1 : ZMod 3) : OnePoint (ZMod 3)) +
      «class» sp (ZMod 3) ((-1 : ZMod 3) : OnePoint (ZMod 3)) = 0) :
    Subsingleton (Group sp (ZMod 3)) ∧
    Nonempty (Correction sp (ZMod 3) ≃ₗ[ℚ] ℚ) := by sorry

-- No assertion `Correction sp F = 0`: for fields with at least four
-- elements this all-curve comparison remains a mathematical gap. F₃ is
-- a proved exception with rational kernel ℚ, conditional on the canonical
-- projective-line evaluation facts above.
-- Polylogarithms:P.4/explicit-to-inductive-comparison supplies the different
-- F(t)-only rational identification for infinite fields; it is not restated.
end GoncharovCurve

/-! K3BlochGroups:V.3/convention-coefficient-exports -/
theorem convention_coefficient_exports (F : Type) [Field F] (hF : FourElements F) :
    Function.Bijective (Imported.coeffMap (Localization.Away (2 : ℤ)) (CGZPublished.compare F)) ∧
    Function.Bijective (Imported.coeffMap ℚ (CGZPublished.compare F)) ∧
    Function.Bijective (Imported.coeffMap (Localization.Away (2 : ℤ)) (CGZPublished.toOlder F hF)) ∧
    Function.Bijective (Imported.coeffMap ℚ (CGZPublished.toOlder F hF)) ∧
    Function.Bijective (Imported.coeffMap (Localization.Away (6 : ℤ)) (LectureBloch.muRel F)) ∧
    Function.Bijective (Imported.coeffMap ℚ (LectureBloch.muRel F)) ∧
    (∀ n : ℕ, 0 < n → Odd n →
      Function.Bijective (Imported.coeffMap (ZMod n) (CGZPublished.compare F)) ∧
      Function.Bijective (Imported.coeffMap (ZMod n) (CGZPublished.toOlder F hF))) ∧
    (∀ n : ℕ, 0 < n → Nat.Coprime n 6 →
      Function.Bijective (Imported.coeffMap (ZMod n) (LectureBloch.muRel F))) := by sorry

/-- The 2-primary coefficient restriction is real. -/
example : ¬Function.Bijective (Imported.coeffMap (ZMod 2) (CGZPublished.compare (ZMod 11))) := by sorry
/-- The extra degenerate-zero quotient has a 3-primary obstruction. -/
example : ¬Function.Bijective
    (Imported.coeffMap (ZMod 3) (CGZPublished.zeroDegenerateCompare (ZMod 5))) := by sorry

end TauCeti.BlochConventions
end

end ContinuationV3


/-! ## ContinuationV4 -/

section ContinuationV4

noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct
set_option linter.unusedVariables false
namespace TauCeti.SuslinV4

variable (F : Type) [Field F]

/-- Routine index abbreviation: q ordered vectors, independently projected to Fⁿ. -/
abbrev Frame (n m q : ℕ) :=
  {t : Fin q → ((Fin n → F) × (Fin m → F)) //
    LinearIndependent F (fun i => (t i).1)}

def Frame.delete {n m q : ℕ} (t : Frame F n m (q + 1)) (i : Fin (q + 1)) :
    Frame F n m q := ⟨fun j => t.val (i.succAbove j), by sorry⟩

def Frame.mapField {E : Type} [Field E] (f : F →+* E) {n m q : ℕ}
    (t : Frame F n m q) : Frame E n m q :=
  ⟨fun i => (fun j => f ((t.val i).1 j), fun j => f ((t.val i).2 j)), by sorry⟩

/-- The lower-block action (g 0; u 1), including the affine shear when m > 0. -/
def Frame.affine {n m q : ℕ} (g : Matrix.GeneralLinearGroup (Fin n) F)
    (u : (Fin n → F) →ₗ[F] (Fin m → F)) (t : Frame F n m q) : Frame F n m q :=
  ⟨fun i => ((Matrix.GeneralLinearGroup.toLin g).val ((t.val i).1),
    u ((t.val i).1) + (t.val i).2), by sorry⟩

-- K3BlochGroups:V.4/unimodular-vector-chains
-- The empty frame has degree 0; ordinary simplex dimension is q-1.
def unimodularChains (F : Type) [Field F] (n m : ℕ) : ChainComplex (ModuleCat ℤ) ℕ := by sorry

namespace unimodularChains

def frame {n m q : ℕ} (t : Frame F n m q) : (unimodularChains F n m).X q := by sorry

lemma frame_d {n m q : ℕ} (t : Frame F n m (q + 1)) :
    (unimodularChains F n m).d (q + 1) q (frame F t) =
      ∑ i : Fin (q + 1), (-1 : ℤ) ^ (i : ℕ) • frame F (t.delete F i) := by sorry

def basisEquiv (n m q : ℕ) :
    FreeAbelianGroup (Frame F n m q) ≃ₗ[ℤ] (unimodularChains F n m).X q := by sorry

lemma basisEquiv_of (n m q : ℕ) (t : Frame F n m q) :
    basisEquiv F n m q (FreeAbelianGroup.of t) = frame F t := by sorry

def affineMap {n m : ℕ} (g : Matrix.GeneralLinearGroup (Fin n) F)
    (u : (Fin n → F) →ₗ[F] (Fin m → F)) :
    unimodularChains F n m ⟶ unimodularChains F n m := by sorry

lemma affineMap_frame {n m q : ℕ} (g : Matrix.GeneralLinearGroup (Fin n) F)
    (u : (Fin n → F) →ₗ[F] (Fin m → F)) (t : Frame F n m q) :
    (affineMap F g u).f q (frame F t) = frame F (t.affine F g u) := by sorry

lemma affineMap_id (n m : ℕ) :
    affineMap F (1 : Matrix.GeneralLinearGroup (Fin n) F)
      (0 : (Fin n → F) →ₗ[F] (Fin m → F)) = 𝟙 _ := by sorry

lemma affineMap_comp {n m : ℕ} (g h : Matrix.GeneralLinearGroup (Fin n) F)
    (u v : (Fin n → F) →ₗ[F] (Fin m → F)) :
    affineMap F (h * g) (v.comp (Matrix.GeneralLinearGroup.toLin g).val + u) =
      affineMap F g u ≫ affineMap F h v := by sorry

def glRepresentation (n : ℕ) :
    ChainComplex (Rep ℤ (Matrix.GeneralLinearGroup (Fin n) F)) ℕ := by sorry

lemma glRepresentation_forget (n : ℕ) :
    ∃ e : ∀ q, ((glRepresentation F n).X q) ≃ₗ[ℤ] (unimodularChains F n 0).X q,
      ∀ p q x, e q (((glRepresentation F n).d p q).hom x) =
        (unimodularChains F n 0).d p q (e p x) := by sorry

-- The same equivalence identifies the action, so a trivial GL action cannot qualify.
lemma glRepresentation_frame (n : ℕ) :
    ∃ e : ∀ q, ((glRepresentation F n).X q) ≃ₗ[ℤ] (unimodularChains F n 0).X q,
      (∀ p q x, e q (((glRepresentation F n).d p q).hom x) =
        (unimodularChains F n 0).d p q (e p x)) ∧
      ∀ q (g : Matrix.GeneralLinearGroup (Fin n) F) (t : Frame F n 0 q),
        e q (((glRepresentation F n).X q).ρ g ((e q).symm (frame F t))) =
          frame F (t.affine F g 0) := by sorry

def mapField {E : Type} [Field E] (f : F →+* E) (n m : ℕ) :
    unimodularChains F n m ⟶ unimodularChains E n m := by sorry

lemma mapField_frame {E : Type} [Field E] (f : F →+* E) {n m q : ℕ}
    (t : Frame F n m q) :
    (mapField F f n m).f q (frame F t) = frame E (t.mapField F f) := by sorry

lemma mapField_id (n m : ℕ) : mapField F (RingHom.id F) n m = 𝟙 _ := by sorry
lemma mapField_comp {E L : Type} [Field E] [Field L] (f : F →+* E) (g : E →+* L)
    (n m : ℕ) : mapField F (g.comp f) n m = mapField F f n m ≫ mapField E g n m := by sorry

end unimodularChains

-- unimodularChains_rank_zero: the augmentation survives in rank 0.
example (m : ℕ) : Nonempty ((unimodularChains F 0 m).X 0 ≅ ModuleCat.of ℤ ℤ) ∧
    ∀ q, IsZero ((unimodularChains F 0 m).X (q + 1)) := by sorry

-- Routine test frames. Their subtype proofs encode linear independence, not distinctness.
def rationalPoint (a : ℚˣ) : Frame ℚ 1 0 1 :=
  ⟨fun _ => (fun _ => (a : ℚ), Fin.elim0), by sorry⟩
def emptyFrame (n m : ℕ) : Frame F n m 0 := ⟨Fin.elim0, by sorry⟩
def standardTwoFrame : Frame F 2 0 2 :=
  ⟨fun i => (Pi.single i 1, Fin.elim0), by sorry⟩

-- unimodularChains_rank_one: d([2]-[1])=0, but both basis vectors augment to 1.
example :
    (unimodularChains ℚ 1 0).d 1 0
      (unimodularChains.frame ℚ (rationalPoint (Units.mk0 2 (by norm_num)))) =
      unimodularChains.frame ℚ (emptyFrame ℚ 1 0) ∧
    (unimodularChains ℚ 1 0).d 1 0
      (unimodularChains.frame ℚ (rationalPoint 1)) =
      unimodularChains.frame ℚ (emptyFrame ℚ 1 0) ∧
    (unimodularChains ℚ 1 0).d 1 0
      (unimodularChains.frame ℚ (rationalPoint (Units.mk0 2 (by norm_num))) -
        unimodularChains.frame ℚ (rationalPoint 1)) = 0 ∧
    IsZero ((unimodularChains ℚ 1 0).X 2) := by sorry

-- unimodularChains_ordered_boundary: d(e₁,e₂)=[e₂]-[e₁].
example : (unimodularChains F 2 0).d 2 1
    (unimodularChains.frame F (standardTwoFrame F)) =
      unimodularChains.frame F ((standardTwoFrame F).delete F 0) -
        unimodularChains.frame F ((standardTwoFrame F).delete F 1) := by sorry

-- unimodularChains_linear_independence: e₁ and 2e₁ are distinct but dependent.
example : ¬ LinearIndependent ℚ
    (![Pi.single (0 : Fin 2) (1 : ℚ), Pi.single (0 : Fin 2) (2 : ℚ)] :
      Fin 2 → Fin 2 → ℚ) := by sorry

-- unimodularChains_affine_shear: (1 0; 1 1) sends the frame (1,0) to (1,1).
example (t : Frame ℚ 1 1 1) (ht : t.val 0 = (fun _ => 1, fun _ => 0)) :
    (t.affine ℚ 1 (LinearMap.id)).val 0 = (fun _ => 1, fun _ => 1) := by sorry

-- K3BlochGroups:V.4/unimodular-acyclic-range
lemma unimodular_acyclic_range [Infinite F] (n m q : ℕ) (hq : q ≠ n) :
    IsZero ((unimodularChains F n m).homology q) := by sorry

-- K3BlochGroups:V.4/stability-coinvariants
-- The definition is the baseline H₀ of the baseline homology representation.
def stabilityCoinvariants (n : ℕ) : ModuleCat ℤ :=
  groupHomology ((unimodularChains.glRepresentation F n).homology n) 0

namespace stabilityCoinvariants

def gen {n : ℕ} [NeZero n] (a : Fin n → Fˣ) : stabilityCoinvariants F n := by sorry

lemma ext [Infinite F] {n : ℕ} [NeZero n] {A : Type} [AddCommGroup A]
    (f g : stabilityCoinvariants F n →+ A)
    (h : ∀ a, f (gen F a) = g (gen F a)) : f = g := by sorry

/-- Routine formula for the i-th term: delete i, multiply by lamⱼ-lamᵢ, append lamᵢ. -/
def relationEntry {n : ℕ} (a lam : Fin (n + 1) → Fˣ)
    (hlam : Function.Injective lam) (i : Fin (n + 1)) : Fin (n + 1) → Fˣ :=
  Fin.snoc (fun j => Units.mk0
    ((a (i.succAbove j) : F) * ((lam (i.succAbove j) : F) - (lam i : F)))
    (by sorry)) (lam i)

lemma relation [Infinite F] (n : ℕ) (a lam : Fin (n + 1) → Fˣ)
    (hlam : Function.Injective lam) :
    gen F (fun i => lam i * a i) - gen F a =
      ∑ i : Fin (n + 1), (-1 : ℤ) ^ ((i : ℕ) + (n + 1) + 1) •
        gen F (relationEntry F a lam hlam i) := by sorry

def mul (n m : ℕ) :
    (stabilityCoinvariants F n ⊗[ℤ] stabilityCoinvariants F m) →ₗ[ℤ]
      stabilityCoinvariants F (n + m) := by sorry

def unit : stabilityCoinvariants F 0 := by sorry

lemma mul_unit (n : ℕ) (x : stabilityCoinvariants F n) :
    (by simpa using mul F 0 n (TensorProduct.tmul ℤ (unit F) x)) = x ∧
    (by simpa using mul F n 0 (TensorProduct.tmul ℤ x (unit F))) = x := by sorry

/-- Multiplication by e=⟨1,1⟩, with the codomain index transported to n+2. -/
def eMul (n : ℕ) : stabilityCoinvariants F n →+ stabilityCoinvariants F (n + 2) := by sorry

lemma eMul_apply (n : ℕ) (x : stabilityCoinvariants F n) :
    eMul F n x = (by simpa only [Nat.add_comm] using
      (mul F 2 n (TensorProduct.tmul ℤ (gen F (fun _ => 1)) x))) := by sorry

lemma mul_assoc (n m l : ℕ) (x : stabilityCoinvariants F n)
    (y : stabilityCoinvariants F m) (z : stabilityCoinvariants F l) :
    (by simpa only [Nat.add_assoc] using
      mul F (n + m) l (TensorProduct.tmul ℤ (mul F n m (TensorProduct.tmul ℤ x y)) z)) =
      mul F n (m + l) (TensorProduct.tmul ℤ x (mul F m l (TensorProduct.tmul ℤ y z))) := by sorry

-- MK and symbol are imported from K2SymbolsBrauer:T.2/milnor-k-theory.
def milnorRetraction (MK : ℕ → Type) [∀ n, AddCommGroup (MK n)] (n : ℕ) :
    stabilityCoinvariants F n →+ MK n := by sorry

lemma milnorRetraction_gen (MK : ℕ → Type) [∀ n, AddCommGroup (MK n)]
    (symbol : ∀ n, (Fin n → Fˣ) → MK n) [Infinite F] {n : ℕ} [NeZero n]
    (a : Fin n → Fˣ) : milnorRetraction F MK n (gen F a) = symbol n a := by sorry

end stabilityCoinvariants

-- stabilityCoinvariants_zero
example : Nonempty (stabilityCoinvariants F 0 ≃+ ℤ) := by sorry
-- stabilityCoinvariants_one
example [Infinite F] : ∃ e : stabilityCoinvariants F 1 ≃+ Additive Fˣ,
    ∀ a : Fˣ, e (stabilityCoinvariants.gen F (fun _ => a)) = Additive.ofMul a := by sorry
-- stabilityCoinvariants_two_unit
example [Infinite F] (MK : ℕ → Type) [∀ n, AddCommGroup (MK n)] :
    ∃ e : stabilityCoinvariants F 2 ≃+ (MK 2 × ℤ),
      e (stabilityCoinvariants.gen F (fun _ => 1)) = (0, 1) := by sorry
-- stabilityCoinvariants_product_two
example [Infinite F] (a b : Fˣ) :
    stabilityCoinvariants.mul F 1 1 (TensorProduct.tmul ℤ
      (stabilityCoinvariants.gen F (fun _ => a)) (stabilityCoinvariants.gen F (fun _ => b))) =
    stabilityCoinvariants.gen F ![a,b] - stabilityCoinvariants.gen F ![1,b] -
      stabilityCoinvariants.gen F ![a,1] + stabilityCoinvariants.gen F ![1,1] := by sorry

/-- Abbreviation for baseline integral GL homology, not a new homology theory. -/
abbrev GLH (n i : ℕ) :=
  groupHomology (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) F) ℤ) i

-- These maps are the specified block inclusions and ordered homology products supplied
-- by the parent/H.1; they are parameters until their supplier modules exist.
variable (stabilization : ∀ n i, GLH F n i →+ GLH F (n + 1) i)

-- K3BlochGroups:V.4/frame-connecting-map
-- Index n+1 guarantees the positive degree required by the source.
def frameConnecting [Infinite F] (n : ℕ) :
    GLH F (n + 1) (n + 1) →+ stabilityCoinvariants F (n + 1) := by sorry

lemma frameConnecting_stabilization [Infinite F] (n : ℕ) :
    (frameConnecting F n).comp (stabilization n (n + 1)) = 0 := by sorry

lemma frameConnecting_product [Infinite F] (n m : ℕ)
    (orderedProduct : (GLH F (n + 1) (n + 1) ⊗[ℤ] GLH F (m + 1) (m + 1)) →ₗ[ℤ]
      GLH F ((n + 1) + (m + 1)) ((n + 1) + (m + 1)))
    (x : GLH F (n + 1) (n + 1)) (y : GLH F (m + 1) (m + 1)) :
    frameConnecting F (n + m + 1) (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      using (orderedProduct (TensorProduct.tmul ℤ x y))) =
    (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      (stabilityCoinvariants.mul F (n + 1) (m + 1)
        (TensorProduct.tmul ℤ (frameConnecting F n x) (frameConnecting F m y)))) := by sorry

lemma frameConnecting_one [Infinite F] (h1 : Additive Fˣ ≃+ GLH F 1 1) (a : Fˣ) :
    frameConnecting F 0 (h1 (Additive.ofMul a)) =
      stabilityCoinvariants.gen F (fun _ => a) := by sorry

lemma frameConnecting_field {E : Type} [Field E] [Infinite F] [Infinite E]
    (f : F →+* E) (n : ℕ)
    (homologyField : GLH F (n + 1) (n + 1) →+ GLH E (n + 1) (n + 1))
    (sField : stabilityCoinvariants F (n + 1) →+ stabilityCoinvariants E (n + 1)) :
    (frameConnecting E n).comp homologyField = sField.comp (frameConnecting F n) := by sorry

-- frameConnecting_one_test
example (h1 : Additive ℚˣ ≃+ GLH ℚ 1 1) :
    frameConnecting ℚ 0 (h1 (Additive.ofMul (Units.mk0 2 (by norm_num)))) =
      stabilityCoinvariants.gen ℚ (fun _ => Units.mk0 2 (by norm_num)) := by sorry
-- frameConnecting_old_rank
example [Infinite F] (x : GLH F 2 3) :
    frameConnecting F 2 (stabilization 2 3 x) = 0 := by sorry

section MilnorComparison
variable (MK : ℕ → Type) [∀ n, AddCommGroup (MK n)]
variable (symbol : ∀ n, (Fin n → Fˣ) → MK n)
variable (torusWord : ∀ n, (Fin n → Fˣ) → GLH F n n)

-- frameConnecting_torus_three
example [Infinite F] (a : Fin 3 → Fˣ) :
    stabilityCoinvariants.milnorRetraction F MK 3 (frameConnecting F 2 (torusWord 3 a)) =
      symbol 3 a := by sorry

-- Routine abbreviation of the baseline additive quotient; θ has positive index n+1.
abbrev StabilityQuotient (n : ℕ) :=
  GLH F (n + 1) (n + 1) ⧸ (stabilization n (n + 1)).range

-- K3BlochGroups:V.4/normalized-milnor-homology-map
-- The source symbol universal property and unstable Steinberg input are supplier gaps.
def milnorHomologyTheta [Infinite F] (n : ℕ) :
    MK (n + 1) →+ StabilityQuotient F stabilization n := by sorry

lemma milnorHomologyTheta_symbol [Infinite F] (n : ℕ) (a : Fin (n + 1) → Fˣ) :
    milnorHomologyTheta F stabilization MK n (symbol (n + 1) a) =
      QuotientAddGroup.mk (torusWord (n + 1) a) := by sorry

lemma milnorHomologyTheta_field {E : Type} [Field E] [Infinite F] [Infinite E]
    (f : F →+* E) (n : ℕ) (MKE : ℕ → Type) [∀ n, AddCommGroup (MKE n)]
    (stabE : ∀ n i, GLH E n i →+ GLH E (n + 1) i)
    (mkField : MK (n + 1) →+ MKE (n + 1))
    (quotientField : StabilityQuotient F stabilization n →+ StabilityQuotient E stabE n) :
    (milnorHomologyTheta E stabE MKE n).comp mkField =
      quotientField.comp (milnorHomologyTheta F stabilization MK n) := by sorry

lemma milnorHomologyTheta_unique [Infinite F] (n : ℕ)
    (φ : MK (n + 1) →+ StabilityQuotient F stabilization n)
    (hφ : ∀ a, φ (symbol (n + 1) a) = QuotientAddGroup.mk (torusWord (n + 1) a)) :
    φ = milnorHomologyTheta F stabilization MK n := by sorry

-- milnorHomologyTheta_one
example [Infinite F] : Function.Bijective (milnorHomologyTheta F stabilization MK 0) := by sorry
-- milnorHomologyTheta_steinberg
example [Infinite F] (a b : F) (ha : a ≠ 0) (ha1 : a ≠ 1) (hb : b ≠ 0) :
    (QuotientAddGroup.mk (torusWord 3
      ![Units.mk0 a ha, Units.mk0 (1-a) (by sorry), Units.mk0 b hb]) :
        StabilityQuotient F stabilization 2) = 0 := by sorry
-- milnorHomologyTheta_real_sign: T.2's real Milnor symbol has order 2 and survives θ.
example (stabR : ∀ n i, GLH ℝ n i →+ GLH ℝ (n + 1) i)
    (MKR : ℕ → Type) [∀ n, AddCommGroup (MKR n)]
    (symbolR : ∀ n, (Fin n → ℝˣ) → MKR n) :
    let x := milnorHomologyTheta ℝ stabR MKR 2 (symbolR 3 (fun _ => -1))
    x ≠ 0 ∧ (2 : ℤ) • x = 0 := by sorry

-- The descended δ and the finite degree-n edge are actual supplier maps, not dummy predicates.
variable (descendedDelta : ∀ n, StabilityQuotient F stabilization n →+ stabilityCoinvariants F (n + 1))

-- K3BlochGroups:V.4/milnor-frame-retraction
lemma milnor_frame_retraction [Infinite F] (n : ℕ) :
    (stabilityCoinvariants.milnorRetraction F MK (n + 1)).comp
      ((descendedDelta n).comp (milnorHomologyTheta F stabilization MK n)) =
      AddMonoidHom.id (MK (n + 1)) := by sorry

-- K3BlochGroups:V.4/frame-algebra-splitting
-- The embedded Milnor summand is δ ∘ θ, already present in this file.
lemma frame_algebra_splitting [Infinite F] :
    (∃ e : stabilityCoinvariants F 2 ≃+ (MK 2 × ℤ),
      ∀ a : Fin 2 → Fˣ, e (stabilityCoinvariants.gen F a) = (symbol 2 a, 1)) ∧
    (∀ n, ∀ x : stabilityCoinvariants F (n + 2),
      ∃ a : MK (n + 2), ∃ y : stabilityCoinvariants F n,
        x = descendedDelta (n + 1) (milnorHomologyTheta F stabilization MK (n + 1) a) +
          stabilityCoinvariants.eMul F n y) ∧
    (∀ n (a : MK (n + 2)) (y : stabilityCoinvariants F n),
      descendedDelta (n + 1) (milnorHomologyTheta F stabilization MK (n + 1) a) =
        stabilityCoinvariants.eMul F n y →
      a = 0) := by sorry

-- The positive-degree products generate in every degree at least three.
lemma frame_decomposable [Infinite F] (n : ℕ) (x : stabilityCoinvariants F (n + 3)) :
    ∃ (k : ℕ) (i : Fin k → Fin (n + 2))
      (a : ∀ j, stabilityCoinvariants F ((i j).val + 1))
      (b : ∀ j, stabilityCoinvariants F (n + 2 - (i j).val)),
      x = ∑ j : Fin k, (by
        have hdeg : (i j).val + 1 + (n + 2 - (i j).val) = n + 3 := by omega
        exact hdeg ▸ (stabilityCoinvariants.mul F ((i j).val + 1)
          (n + 2 - (i j).val) (TensorProduct.tmul ℤ (a j) (b j)))) := by sorry

-- This clause is proved by the simultaneous spectral-sequence induction, not by splitting.
lemma frame_e_injective [Infinite F] (n : ℕ) :
    Function.Injective (stabilityCoinvariants.eMul F n) := by sorry

-- K3BlochGroups:V.4/degree-three-torus-quotient
lemma degree_three_torus_quotient [Infinite F] :
    Function.Bijective (milnorHomologyTheta F stabilization MK 2) ∧
      ∀ x : GLH F 3 3, ∃ y : GLH F 2 3, ∃ z : FreeAbelianGroup (Fin 3 → Fˣ),
        x = stabilization 2 3 y + FreeAbelianGroup.lift (torusWord 3) z := by sorry

end MilnorComparison

-- K3BlochGroups:V.4/frame-spectral-sequence-collapse
-- E is the frame hyperhomology spectral sequence supplied by H.1 Part II, starting at1.
-- The E¹ identification, finite convergence/edge and e-injectivity await that interface.
lemma frame_spectral_sequence_collapse [Infinite F]
    (c : ℤ → ComplexShape (ℕ × ℕ))
    (E : SpectralSequence (ModuleCat ℤ) c 1) (r : ℤ) (hr : 2 ≤ r) (pq pq' : ℕ × ℕ) :
    (E.page r (by omega)).d pq pq' = 0 := by sorry

lemma homological_stability [Infinite F] (n i : ℕ) (hi : i ≤ n) :
    Function.Bijective (stabilization n i) := by sorry

-- K3BlochGroups:V.4/scalar-homology-vanishing
-- The inner additive homology with its functorially induced scalar action is a supplied Rep.
-- The prime-field condition is expressible at baseline. Identifying the induced Rep
-- with H_j(V_add,k) still awaits H.1 Part II, and only that condition is omitted.
lemma scalar_homology_vanishing [Infinite F] (k : Type) [Field k]
    (hprime : Subfield.closure (∅ : Set k) = ⊤)
    (V : Type) [AddCommGroup V] [Module F V] (j i : ℕ) (hj : 0 < j)
    (scalarCoefficientHomology : Rep k Fˣ) :
    IsZero (groupHomology scalarCoefficientHomology i) := by sorry

-- K3BlochGroups:V.4/affine-block-homology
-- Block-group and scalar-containment syntax belong to the supplier's semidirect/LHS API.
lemma affine_block_homology [Infinite F] (G P : Type) [Group G] [Group P]
    (blockInclusion : G →* P)
    (coeff : Rep.trivial ℤ G ℤ ⟶ Rep.res blockInclusion (Rep.trivial ℤ P ℤ)) (i : ℕ) :
    IsIso (groupHomology.map blockInclusion coeff i) := by sorry

-- K3BlochGroups:V.4/cross-ratio-coefficient-change
-- Parent cross-ratios are parameters, so no second definition of cross-ratio appears.
lemma cross_ratio_coefficient_change {E : Type} [Field E] (f : F →+* E)
    (crF : (Fin 4 → OnePoint F) → F) (crE : (Fin 4 → OnePoint E) → E)
    (t : Fin 4 → OnePoint F) (ht : Function.Injective t) :
    crE (fun i => OnePoint.map f (t i)) = f (crF t) := by sorry

section TorsionDetection
-- K is the closure's Quillen K₃. κ is the torsion lift of the parent δ after scalar extension.
-- Twist is the early Chern supplier's second Tate twist, with its weight-two Galois action.
-- Neither the Tate twist nor the e-invariant is redefined here.
variable {Mu K Twist Gamma : Type} [CommGroup Mu] [AddCommGroup K]
  [AddCommGroup Twist] [Group Gamma]
abbrev RootH3 := groupHomology (Rep.trivial ℤ Mu ℤ) 3
variable (κ : RootH3 (Mu := Mu) →+ AddCommGroup.torsion K)
variable (e : AddCommGroup.torsion K →+ Twist) (action : Representation ℤ Gamma Twist)

-- K3BlochGroups:V.4/closure-torsion-detector
def closureTorsionDetector (κ : RootH3 (Mu := Mu) →+ AddCommGroup.torsion K)
    (e : AddCommGroup.torsion K →+ Twist) : RootH3 (Mu := Mu) →+ Twist := by sorry

lemma closureTorsionDetector_formula (x : RootH3 (Mu := Mu)) :
    closureTorsionDetector κ e x = e (κ x) := by sorry

lemma closureTorsionDetector_fixed (hfixed : ∀ g x, action g (e (κ x)) = e (κ x))
    (g : Gamma) (x : RootH3 (Mu := Mu)) :
    action g (closureTorsionDetector κ e x) = closureTorsionDetector κ e x := by sorry

lemma closureTorsionDetector_field {Mu' K' Twist' : Type} [CommGroup Mu']
    [AddCommGroup K'] [AddCommGroup Twist']
    (κ' : RootH3 (Mu := Mu') →+ AddCommGroup.torsion K')
    (e' : AddCommGroup.torsion K' →+ Twist')
    (homologyField : RootH3 (Mu := Mu) →+ RootH3 (Mu := Mu'))
    (twistField : Twist →+ Twist')
    (hcompat : (e'.comp κ').comp homologyField = twistField.comp (e.comp κ)) :
    (closureTorsionDetector κ' e').comp homologyField =
      twistField.comp (closureTorsionDetector κ e) := by sorry

-- The Chern/Bockstein square supplies this specific isomorphism and equality over Ω.
-- This is diagram data, not an invented Prop-valued model of e or the Tate twist.
variable (cyclicDetection : RootH3 (Mu := Mu) ≃+ Twist)
variable (hSquare : e.comp κ = cyclicDetection.toAddMonoidHom)

-- closureTorsionDetector_alg_closed
include hSquare in
example : Function.Bijective (closureTorsionDetector κ e) := by sorry
-- closureTorsionDetector_two: use a nonzero H₃(C₂) class and its root-group injection.
include hSquare in
example (ι : groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 3 →+
    RootH3 (Mu := Mu)) (hι : Function.Injective ι)
    (x : groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 3) (hx : x ≠ 0) :
    closureTorsionDetector κ e (ι x) ≠ 0 := by sorry
-- Routine coefficient morphism: the underlying linear map is the identity.
def rootTrivialCoeff {G H : Type} [Group G] [Group H] (f : G →* H) :
    Rep.trivial ℤ G ℤ ⟶ Rep.res f (Rep.trivial ℤ H ℤ) :=
  Rep.ofHom { toLinearMap := LinearMap.id, isIntertwining' := by sorry }

def cyclicPowerTwo : Multiplicative (ZMod 7) →* Multiplicative (ZMod 7) where
  toFun x := x ^ 2
  map_one' := by sorry
  map_mul' := by sorry

-- closureTorsionDetector_weight_two: the actual power2 map, without assuming its answer.
example (κ7 : RootH3 (Mu := Multiplicative (ZMod 7)) →+ AddCommGroup.torsion K)
    (x : RootH3 (Mu := Multiplicative (ZMod 7))) :
    closureTorsionDetector κ7 e
      ((groupHomology.map cyclicPowerTwo (rootTrivialCoeff cyclicPowerTwo) 3).hom x) =
      (4 : ℤ) • closureTorsionDetector κ7 e x := by sorry

-- closureTorsionDetector_tensor_zero: divisibility kills the ordinary tensor target.
example [DivisibleBy (Additive Mu) ℤ]
    (hTorsion : ∀ x : Additive Mu, ∃ n : ℕ, 0 < n ∧ n • x = 0) :
    ∀ x : Additive Mu ⊗[ℤ] Additive Mu, x = 0 := by sorry

-- K3BlochGroups:V.4/closure-detector-injectivity, closure case after the supplied square.
include hSquare in
lemma closure_detector_injectivity {A B : Type} [AddCommGroup A] [AddCommGroup B]
    (detectorF : A →+ B) (toClosure : A →+ RootH3 (Mu := Mu))
    (targetInclusion : B →+ Twist) (hRoots : Function.Injective toClosure)
    (hNaturality : targetInclusion.comp detectorF = (closureTorsionDetector κ e).comp toClosure) :
    Function.Injective detectorF := by sorry

-- K3BlochGroups:V.4/cyclic-chern-evaluation
-- A is H₄(µ_m,Z/m); B is µ_m⊗_{Z/m}µ_m, supplied finite-level coefficient objects.
-- lam and ρ are the tautological character and lam⊕lam⁻¹. The supplier identifies these maps.
lemma cyclic_chern_evaluation {A B : Type} [AddCommGroup A] [AddCommGroup B]
    (c2rho : A →+ B) (cupSquare : A →+ B)
    (hWhitney : c2rho = -cupSquare) (hPeriodicity : Function.Bijective cupSquare) :
    c2rho = -cupSquare ∧ Function.Bijective c2rho := by sorry

-- K3BlochGroups:V.4/chern-bockstein-square
-- H4Roots and H4SL are finite-coefficient homology. Hurewicz goes FROM K₄coeff TO H₄SL.
-- The supplier identifies rootsToSL with the monomial/SL composite, c2K with the
-- normalized étale Chern class, and kBockstein with the K-theory Bockstein.
-- Its universal construction and Bott conditions await the early Chern/H.6 syntax.
-- KV11.3.2 supplies the product rule for odd m or 8|m; m=8 covers order-two torsion.
lemma chern_bockstein_square {H4Roots H4SL K4coeff : Type}
    [AddCommGroup H4Roots] [AddCommGroup H4SL] [AddCommGroup K4coeff]
    (rootsToSL : H4Roots →+ H4SL) (hurewicz : K4coeff →+ H4SL)
    (c2Homology : H4SL →+ Twist) (c2K : K4coeff →+ Twist)
    (kBockstein : K4coeff →+ AddCommGroup.torsion K)
    (homologyBockstein : H4Roots →+ RootH3 (Mu := Mu))
    (m : ℕ) (hm : 2 ≤ m) (hproduct : Odd m ∨ 8 ∣ m) :
    (e.comp κ).comp homologyBockstein = -(c2Homology.comp rootsToSL) ∧
      c2K = c2Homology.comp hurewicz ∧
      e.comp kBockstein = -c2K := by sorry

end TorsionDetection
end TauCeti.SuslinV4
end

end ContinuationV4


/-! ## ContinuationV5 -/

section ContinuationV5

noncomputable section
open CategoryTheory Module
open scoped TensorProduct
set_option autoImplicit false
namespace TauCeti.K3Concrete

instance : Fact (Nat.Prime 5) := ⟨by decide⟩
instance : Fact (Nat.Prime 7) := ⟨by decide⟩

abbrev SL2 (F : Type) [CommRing F] := Matrix.SpecialLinearGroup (Fin 2) F
abbrev AwayZ (ell : ℕ) := Localization (Submonoid.powers (ell : ℤ))
abbrev H3 (R G : Type) [CommRing R] [Group G] :=
  groupHomology (Rep.trivial R G R) 3
abbrev H3Int (F : Type) [Field F] := H3 ℤ (SL2 F)
abbrev H3Away (ell : ℕ) (F : Type) [Field F] := H3 (AwayZ ell) (SL2 F)
abbrev h3Map {R G H : Type} [CommRing R] [Group G] [Group H] (f : G →* H) :
    H3 R G →+ H3 R H :=
  (groupHomology.map (A := Rep.trivial R G R) (B := Rep.trivial R H R)
    f (𝟙 _) 3).hom.toAddMonoidHom
abbrev ModN (M : Type) [AddCommGroup M] (n : ℕ) := M ⊗[ℤ] ZMod n
abbrev modNMap {M N : Type} [AddCommGroup M] [AddCommGroup N] (n : ℕ) (f : M →+ N) :
    ModN M n →+ ModN N n :=
  (TensorProduct.map f.toIntLinearMap (LinearMap.id : ZMod n →ₗ[ℤ] ZMod n)).toAddMonoidHom

section ImportedObjects
variable
  (K3 Milnor3 Ind3 B : Type → Type)
  [∀ F, AddCommGroup (K3 F)] [∀ F, AddCommGroup (Milnor3 F)]
  [∀ F, AddCommGroup (Ind3 F)] [∀ F, AddCommGroup (B F)]
  (quot : ∀ F, K3 F →+ Ind3 F)
  (milnorToK : ∀ F, Milnor3 F →+ K3 F)
  (Kmap : ∀ {F E : Type} [Field F] [Field E], (F →+* E) → K3 F →+ K3 E)
  (Bmap : ∀ {F E : Type} [Field F] [Field E], (F →+* E) → B F →+ B E)

-- finite-indecomposable-specialization: ambient K3 is an L.1 import.
theorem finite_quotient_bijective (F : Type) [Field F] [Finite F] :
    Function.Bijective (quot F) := by sorry

-- transfer-on-indecomposables: signatures use the actual supplier maps.
theorem finite_ind_transfer_composites {F E : Type} [Field F] [Field E]
    [Fintype F] [Fintype E] [Algebra F E]
    (res : Ind3 F →+ Ind3 E) (tr : Ind3 E →+ Ind3 F) :
    (∀ x, tr (res x) = Module.finrank F E • x) ∧
    (∀ y, res (tr y) = ((Fintype.card F ^ (2 * Module.finrank F E) - 1) /
      (Fintype.card F ^ 2 - 1)) • y) := by sorry

-- localized-sl2-homology: the concrete coefficient ring is present in the type.
theorem localized_sl2_cyclic (F : Type) [Field F] [Fintype F]
    (ell : ℕ) [Fact ell.Prime] [CharP F ell] :
    Nonempty (H3Away ell F ≃+ ZMod (Fintype.card F ^ 2 - 1)) := by sorry

theorem prime_to_char_subgroup_h3_injective (F : Type) [Field F] [Finite F]
    (ell : ℕ) [Fact ell.Prime] [CharP F ell]
    (C : Subgroup (SL2 F)) (hC : Nat.Coprime (Nat.card C) ell) :
    Function.Injective (h3Map (R := ℤ) C.subtype) := by sorry

-- sl2-characteristic-exceptions: a single abstract group statement records both factors.
theorem integral_sl2_order (F : Type) [Field F] [Fintype F]
    (ell : ℕ) [Fact ell.Prime] [CharP F ell] :
    Nonempty (H3Int F ≃+ ZMod
      ((if Fintype.card F ∈ ([2, 3, 4, 5, 8, 9, 27] : List ℕ) then ell else 1) *
        (Fintype.card F ^ 2 - 1))) := by sorry

/-- finite-stabilization-map: actual SL2 → stable SL → K3 composite, then localization. -/
def finiteStabilization (F : Type) [Field F] [Finite F] (ell : ℕ)
    [Fact ell.Prime] [CharP F ell] : H3Away ell F →+ K3 F := by sorry

lemma finiteStabilization_natural {F E : Type} [Field F] [Field E]
    [Finite F] [Finite E] (ell : ℕ) [Fact ell.Prime] [CharP F ell] [CharP E ell]
    (f : F →+* E) (x : H3Away ell F) :
    finiteStabilization K3 E ell (h3Map (R := AwayZ ell)
      (Matrix.SpecialLinearGroup.map f) x) = Kmap f (finiteStabilization K3 F ell x) := by sorry

lemma finiteStabilization_unique (F : Type) [Field F] [Finite F] (ell : ℕ)
    [Fact ell.Prime] [CharP F ell] (loc : H3Int F →+ H3Away ell F)
    (g : H3Away ell F →+ K3 F)
    (h : ∀ z, g (loc z) = finiteStabilization K3 F ell (loc z)) :
    g = finiteStabilization K3 F ell := by sorry

-- hurewicz and stabilize are the actual maps from V.2/k3-to-h3-sl-field
-- and SL2 → stable SL, with loc the actual coefficient map.
lemma finiteStabilization_hurewicz (F : Type) [Field F] [Finite F] (ell : ℕ)
    [Fact ell.Prime] [CharP F ell] (HStable : Type) [AddCommGroup HStable]
    (hurewicz : K3 F →+ HStable) (stabilize : H3Int F →+ HStable)
    (loc : H3Int F →+ H3Away ell F) (z : H3Int F) :
    hurewicz (finiteStabilization K3 F ell (loc z)) = stabilize z := by sorry

/-- Test `finiteStabilization_char_torsion`: loc is the coefficient localization map. -/
example (F : Type) [Field F] [Finite F] (ell : ℕ) [Fact ell.Prime] [CharP F ell]
    (loc : H3Int F →+ H3Away ell F) (a : ℕ) (z : H3Int F)
    (hz : ell ^ a • z = 0) : finiteStabilization K3 F ell (loc z) = 0 := by sorry

/-- Test `finiteStabilization_F2_F4`: E is the supplied field of cardinality four. -/
example (E : Type) [Field E] [Fintype E] [CharP E 2] (hE : Fintype.card E = 4)
    (f : ZMod 2 →+* E) (x : H3Away 2 (ZMod 2)) :
    finiteStabilization K3 E 2 (h3Map (R := AwayZ 2)
      (Matrix.SpecialLinearGroup.map f) x) =
      Kmap f (finiteStabilization K3 (ZMod 2) 2 x) := by sorry

/-- Test `finiteStabilization_not_integral_iso_F5`. -/
example (loc : H3Int (ZMod 5) →+ H3Away 5 (ZMod 5)) :
    ¬ Function.Injective ((finiteStabilization K3 (ZMod 5) 5).comp loc) ∧
    Function.Bijective (finiteStabilization K3 (ZMod 5) 5) := by sorry

-- finite-stabilization-equivalence.
theorem finiteStabilization_bijective (F : Type) [Field F] [Finite F]
    (ell : ℕ) [Fact ell.Prime] [CharP F ell] :
    Function.Bijective (finiteStabilization K3 F ell) := by sorry

/-- finite-cross-ratio-map: the refined edge map followed by RB → B. -/
def finiteBlochHom (F : Type) [Field F] [Fintype F] (hq : 4 ≤ Fintype.card F) :
    H3Int F →+ B F := by sorry

lemma finiteBlochHom_natural {F E : Type} [Field F] [Field E] [Fintype F] [Fintype E]
    (hF : 4 ≤ Fintype.card F) (hE : 4 ≤ Fintype.card E)
    (f : F →+* E) (z : H3Int F) :
    Bmap f (finiteBlochHom B F hF z) =
      finiteBlochHom B E hE (h3Map (R := ℤ) (Matrix.SpecialLinearGroup.map f) z) := by sorry

lemma finiteBlochHom_char_torsion (F : Type) [Field F] [Fintype F]
    (hq : 4 ≤ Fintype.card F) (ell : ℕ) [Fact ell.Prime] [CharP F ell]
    (a : ℕ) (z : H3Int F) (hz : ell ^ a • z = 0) : finiteBlochHom B F hq z = 0 := by sorry

-- API `finiteBlochHom_cyclic_bar`: NOT STATED. Needs refined square-class
-- configuration chains, β_(x,y), the periodic-to-homogeneous bar chain map,
-- and its comparison with Mathlib inhomogeneous chains. The intended equation
-- is λ(sum_i (1,t,t^(i+1),t^(i+2))) = sum_i cr(β_(x,y)(...)), in the
-- Suslin Bloch kernel, independent of x,y. No extra five-term relation is assumed.

/-- Test `finiteBlochHom_F5_kernel`. -/
example : Nat.card (finiteBlochHom B (ZMod 5) (by decide)).ker = 40 := by sorry
/-- Test `finiteBlochHom_F7_kernel`. -/
example : Nat.card (finiteBlochHom B (ZMod 7) (by decide)).ker = 12 := by sorry
/-- Test `finiteBlochHom_F4_kernel`. -/
example (F : Type) [Field F] [Fintype F] (hF : Fintype.card F = 4) :
    Nat.card (finiteBlochHom B F (by omega)).ker = 6 := by sorry

-- finite-bloch-orders, including the deliberate q≥4 condition.
theorem finite_bloch_cyclic (F : Type) [Field F] [Fintype F]
    (hq : 4 ≤ Fintype.card F) :
    Nonempty (B F ≃+ ZMod (if Odd (Fintype.card F) then
      (Fintype.card F + 1) / 2 else Fintype.card F + 1)) := by sorry

theorem small_bloch_F2 : Subsingleton (B (ZMod 2)) := by sorry
theorem small_bloch_F3 : Nonempty (B (ZMod 3) ≃+ ℤ) := by sorry

/-- finite-k3-bloch-map: λ_loc composed with the inverse of σ, without generators. -/
def finiteK3Bloch (F : Type) [Field F] [Fintype F] (hq : 4 ≤ Fintype.card F) :
    K3 F →+ B F := by sorry

lemma finiteK3Bloch_triangle (F : Type) [Field F] [Fintype F]
    (hq : 4 ≤ Fintype.card F) (ell : ℕ) [Fact ell.Prime] [CharP F ell]
    (loc : H3Int F →+ H3Away ell F) (z : H3Int F) :
    finiteK3Bloch K3 B F hq (finiteStabilization K3 F ell (loc z)) =
      finiteBlochHom B F hq z := by sorry

lemma finiteK3Bloch_natural {F E : Type} [Field F] [Field E] [Fintype F] [Fintype E]
    (hF : 4 ≤ Fintype.card F) (hE : 4 ≤ Fintype.card E) (f : F →+* E) (x : K3 F) :
    Bmap f (finiteK3Bloch K3 B F hF x) =
      finiteK3Bloch K3 B E hE (Kmap f x) := by sorry

lemma finiteK3Bloch_surjective (F : Type) [Field F] [Fintype F]
    (hq : 4 ≤ Fintype.card F) : Function.Surjective (finiteK3Bloch K3 B F hq) := by sorry

/-- Test `finiteK3Bloch_F5_kernel`. -/
example : Nat.card (finiteK3Bloch K3 B (ZMod 5) (by decide)).ker = 8 := by sorry
/-- Test `finiteK3Bloch_F7_kernel`. -/
example : Nat.card (finiteK3Bloch K3 B (ZMod 7) (by decide)).ker = 12 := by sorry
/-- Test `finiteK3Bloch_F4_kernel`. -/
example (F : Type) [Field F] [Fintype F] (hF : Fintype.card F = 4) :
    Nat.card (finiteK3Bloch K3 B F (by omega)).ker = 3 := by sorry

-- finite-enhanced-torsion-sequence: T and its arrow are the parent enhanced Tor supplier.
theorem finite_bloch_exact (F : Type) [Field F] [Fintype F]
    (hq : 4 ≤ Fintype.card F) (T : Type) [AddCommGroup T] (torToK : T →+ K3 F) :
    Function.Injective torToK ∧
      torToK.range = (finiteK3Bloch K3 B F hq).ker ∧
      Function.Surjective (finiteK3Bloch K3 B F hq) := by sorry

-- odd-coefficient-finite-comparison: tensor quotient, not H3 with Z/n coefficients.
theorem finite_bloch_mod_n_bijective (F : Type) [Field F] [Fintype F]
    (hq : 4 ≤ Fintype.card F) (n : ℕ) (hn : 0 < n) (hodd : Odd n)
    (hcop : Nat.Coprime n (Fintype.card F - 1)) :
    Function.Bijective (modNMap n (finiteK3Bloch K3 B F hq)) := by sorry

/-- The omitted gcd hypothesis gives a real failure: q=7,n=3. -/
example : ¬ Function.Bijective (modNMap 3 (finiteK3Bloch K3 B (ZMod 7) (by decide))) := by sorry

-- rational-decomposable-subgroup: ambient K3 is imported from N.5/N.7/N.8.
-- number-field-product-image: negOneMul is the supplier's actual product [−1]·K2.
theorem number_field_product_image (F : Type) [Field F] [NumberField F]
    (K2F : Type) [AddCommGroup K2F] (negOneMul : K2F →+ K3 F) :
    (milnorToK F).range = negOneMul.range := by sorry

theorem rational_decomposable_image (cyclic : K3 ℚ ≃+ ZMod 48) :
    ∀ x : ZMod 48, x ∈ (cyclic.toAddMonoidHom.comp (milnorToK ℚ)).range ↔
      x = 0 ∨ x = 24 := by sorry

theorem rational_ind_structure : Nonempty (Ind3 ℚ ≃+ ZMod 24) := by sorry

theorem rational_quotient_nonsplit :
    ¬ ∃ s : Ind3 ℚ →+ K3 ℚ, (quot ℚ).comp s = AddMonoidHom.id (Ind3 ℚ) := by sorry

-- gaussian-decomposable-vanishing: E must be the supplier Q(i), identified by a quadratic i.
theorem gaussian_ind_structure (E : Type) [Field E] [Algebra ℚ E]
    (i : E) (hi : i ^ 2 = -1) (hdeg : Module.finrank ℚ E = 2) :
    Subsingleton (Milnor3 E) ∧ Function.Bijective (quot E) ∧
      Nonempty (Ind3 E ≃+ (ℤ × ZMod 24)) := by sorry
end ImportedObjects

section Cartan
variable {F E : Type} [Field F] [Field E] [Algebra F E]

-- Exact Mathlib norm-one subgroup, not an alternative norm carrier.
abbrev NormOne := (Units.map (Algebra.norm F : E →* F)).ker

def cartanEmbedding (e : Basis (Fin 2) F E) : NormOne (F := F) (E := E) →* SL2 F := by sorry

lemma cartanEmbedding_toMatrix (e : Basis (Fin 2) F E) (u : NormOne (F := F) (E := E)) :
    (cartanEmbedding e u : Matrix (Fin 2) (Fin 2) F) =
      LinearMap.toMatrix e e (Algebra.lmul F E (u.val : E)) := by sorry

lemma cartanEmbedding_injective (e : Basis (Fin 2) F E) :
    Function.Injective (cartanEmbedding e) := by sorry

lemma cartanEmbedding_changeBasis (e e' : Basis (Fin 2) F E)
    (u : NormOne (F := F) (E := E)) :
    let U := LinearMap.toMatrix e e' (LinearMap.id : E →ₗ[F] E)
    (cartanEmbedding e' u : Matrix (Fin 2) (Fin 2) F) =
      U * (cartanEmbedding e u : Matrix (Fin 2) (Fin 2) F) *
        LinearMap.toMatrix e' e (LinearMap.id : E →ₗ[F] E) := by sorry

/-- Test `cartanEmbedding_one`. -/
example (e : Basis (Fin 2) F E) : cartanEmbedding e 1 = 1 := by sorry
/-- Test `cartanEmbedding_negOne`: membership is the determinant of −id in dimension2. -/
example (e : Basis (Fin 2) F E) (hneg : (-1 : Eˣ) ∈ (Units.map (Algebra.norm F : E →* F)).ker) :
    (cartanEmbedding e ⟨-1, hneg⟩ : Matrix (Fin 2) (Fin 2) F) = -1 := by sorry
/-- Test `cartanEmbedding_trace`. -/
example (e : Basis (Fin 2) F E) (u : NormOne (F := F) (E := E)) :
    algebraMap F E (Matrix.trace (cartanEmbedding e u : Matrix (Fin 2) (Fin 2) F)) =
      (u.val : E) + ((u.val)⁻¹ : Eˣ) := by sorry

-- cartan-homology-modulo-n: actual map induced by actual inclusion.
theorem cartan_mod_n_bijective [Fintype F] [Fintype E] (e : Basis (Fin 2) F E)
    (hcard : 4 ≤ Fintype.card F) (hq : Odd (Fintype.card F))
    (n : ℕ) (hn : 0 < n) (hodd : Odd n)
    (hdvd : n ∣ Fintype.card F + 1) :
    Function.Bijective (modNMap n (h3Map (R := ℤ) (cartanEmbedding e))) := by sorry
end Cartan

section Rogers
variable (L : ℝ → ℝ)
local notation "PReal" => TauCeti.BlochGroup.preBloch ℝ
local notation "sym" => (fun x : {x : ℝ // x ≠ 0 ∧ x ≠ 1} =>
  TauCeti.BlochGroup.preBloch.gen ℝ (Subtype.val x))

/-- real-rogers-detector: L is P.1's interval Rogers function; sym is the V.3 generator. -/
def realRogersHom (L : ℝ → ℝ) :
    PReal →+ AddCircle (Real.pi ^ 2) := by sorry

lemma realRogersHom_pos (x : ℝ) (hx : 0 < x) (hx1 : x < 1) :
    realRogersHom L (sym ⟨x, by constructor <;> linarith⟩) =
      ((L x - Real.pi ^ 2 / 6 : ℝ) : AddCircle (Real.pi ^ 2)) := by sorry

lemma realRogersHom_gt_one (x : ℝ) (hx : 1 < x) :
    realRogersHom L (sym ⟨x, by constructor <;> linarith⟩) =
      ((Real.pi ^ 2 / 6 - L (1 / x) : ℝ) : AddCircle (Real.pi ^ 2)) := by sorry

lemma realRogersHom_neg (x : ℝ) (hx : x < 0) :
    realRogersHom L (sym ⟨x, by constructor <;> linarith⟩) =
      ((L (1 / (1 - x)) - Real.pi ^ 2 / 3 : ℝ) : AddCircle (Real.pi ^ 2)) := by sorry

lemma realRogersHom_unique (g : PReal →+ AddCircle (Real.pi ^ 2))
    (h : ∀ x, g (sym x) = realRogersHom L (sym x)) :
    g = realRogersHom L := by sorry

/-- Test `realRogersHom_half`. -/
example : realRogersHom L (sym ⟨1/2, by norm_num⟩) =
    ((-Real.pi ^ 2 / 12 : ℝ) : AddCircle (Real.pi ^ 2)) := by sorry
/-- Test `realRogersHom_two`. -/
example : realRogersHom L (sym ⟨2, by norm_num⟩) =
    ((Real.pi ^ 2 / 12 : ℝ) : AddCircle (Real.pi ^ 2)) := by sorry
/-- Test `realRogersHom_neg_one`. -/
example : realRogersHom L (sym ⟨-1, by norm_num⟩) =
    ((-Real.pi ^ 2 / 4 : ℝ) : AddCircle (Real.pi ^ 2)) := by sorry

-- universal-class-order-six: c is the V.3 Bloch class, included in PReal.
theorem real_universal_class_order : addOrderOf (sym ⟨2, by norm_num⟩ + sym ⟨-1, by norm_num⟩) = 6 := by sorry

theorem rational_universal_class_order :
    addOrderOf (TauCeti.BlochGroup.c ℚ) = 6 := by sorry
end Rogers


/-- Test `finite_field_bloch_comparison_1`: integral H₃ differs from its localization. -/
example : Nat.card (H3Int (ZMod 5)) = 120 ∧
    ¬ Nonempty (H3Int (ZMod 5) ≃+ ZMod 24) := by sorry

/-- Test `finite_field_bloch_comparison_2`: the q≥4 order formula excludes these fields. -/
example : Subsingleton (TauCeti.BlochGroup.blochGroup (ZMod 2)) ∧
    Nonempty (TauCeti.BlochGroup.blochGroup (ZMod 3) ≃+ ℤ) := by sorry

/-- Test `nonsplit_cartan_mod_n_1`: actual numerical hypotheses, including the failure at q=7. -/
example : 3 ∣ (5 + 1 : ℕ) ∧ 3 ∣ (11 + 1 : ℕ) ∧ ¬ 3 ∣ (7 + 1 : ℕ) ∧
    Nat.Coprime 3 (5 - 1) ∧ Nat.Coprime 3 (11 - 1) ∧ ¬ Nat.Coprime 3 (7 - 1) := by decide

/-- Test `nonsplit_cartan_mod_n_2`: a generator change acts quadratically on H₃. -/
example {F E : Type} [Field F] [Field E] [Algebra F E] [Fintype F] [Fintype E]
    (e : Basis (Fin 2) F E) (a : ℕ)
    (z : H3 ℤ (NormOne (F := F) (E := E))) :
    h3Map (R := ℤ) (cartanEmbedding e)
      (h3Map (R := ℤ) (powMonoidHom a) z) =
        (a ^ 2) • h3Map (R := ℤ) (cartanEmbedding e) z := by sorry

end TauCeti.K3Concrete
end

end ContinuationV5


/-! ## ContinuationV6 -/

section ContinuationV6

noncomputable section
open scoped TensorProduct

namespace TauCeti.Blueprint.K3BlochV6

section Roots
variable {P W P' W' : Type*}
variable [AddCommGroup P] [AddCommGroup W] [AddCommGroup P'] [AddCommGroup W']

/-- V.6/integral-root-multiple. For fields h is supplied by
V.6/root-of-unity-symbol, using IsPrimitiveRoot ζ m, m≥2 and x=[ζ]. -/
def rootMultiple (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0) : δ.ker :=
  ⟨m • x, h⟩

lemma rootMultiple_coe (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0) :
    (rootMultiple δ x m h : P) = m • x := by
  sorry

lemma rootMultiple_proof_irrel (δ : P →+ W) (x : P) (m : ℕ)
    (h h' : δ (m • x) = 0) : rootMultiple δ x m h = rootMultiple δ x m h' := by
  sorry

lemma rootMultiple_zero (δ : P →+ W) (x : P) (m : ℕ)
    (h : δ (m • (0 : P)) = 0) (h' : δ (0 • x) = 0) :
    rootMultiple δ 0 m h = 0 ∧ rootMultiple δ x 0 h' = 0 := by
  sorry

lemma rootMultiple_of_mem (δ : P →+ W) (b : δ.ker) (m : ℕ)
    (h : δ (m • (b : P)) = 0) : rootMultiple δ b m h = m • b := by
  sorry

lemma rootMultiple_mul (δ : P →+ W) (x : P) (m k : ℕ)
    (h : δ (m • x) = 0) (h' : δ ((m * k) • x) = 0) :
    rootMultiple δ x (m * k) h' = k • rootMultiple δ x m h := by
  sorry

lemma rootMultiple_map (δ : P →+ W) (δ' : P' →+ W') (f : P →+ P')
    (fB : δ.ker →+ δ'.ker) (hfB : ∀ b, (fB b : P') = f (b : P))
    (x : P) (m : ℕ) (h : δ (m • x) = 0) (h' : δ' (m • f x) = 0) :
    fB (rootMultiple δ x m h) = rootMultiple δ' (f x) m h' := by
  sorry

-- rootMultiple_mod_two
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0) :
    (rootMultiple (Int.castAddHom (ZMod 2)) 1 2 h : ℤ) = 2 := by
  sorry

-- rootMultiple_zero_multiplier
example (δ : P →+ W) (x : P) (h : δ (0 • x) = 0) :
    rootMultiple δ x 0 h = 0 := by
  sorry

-- rootMultiple_kernel_compat
example (δ : P →+ W) (b : δ.ker) (h : δ (3 • (b : P)) = 0) :
    rootMultiple δ b 3 h = 3 • b := by
  sorry

-- rootMultiple_raw_rejected
example : (1 : ℤ) ∉ (Int.castAddHom (ZMod 2)).ker ∧
    (2 : ℤ) ∈ (Int.castAddHom (ZMod 2)).ker := by
  sorry

variable {R S : Type*} [CommRing R] [CommRing S]

/-- V.6/root-coefficient-class. hu is retained to forbid division by a
noninvertible root order. No flatness is assumed. -/
def rootCoefficient (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
    (u : Rˣ) (_hu : (u : R) = (m : R)) : δ.ker ⊗[ℤ] R :=
  rootMultiple δ x m h ⊗ₜ[ℤ] ((u⁻¹ : Rˣ) : R)

lemma rootCoefficient_toPre (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) :
    TensorProduct.map δ.ker.subtype.toIntLinearMap (LinearMap.id : R →ₗ[ℤ] R)
      (rootCoefficient δ x m h u hu) = x ⊗ₜ[ℤ] (1 : R) := by
  sorry

lemma rootCoefficient_zero (δ : P →+ W) (m : ℕ) (h : δ (m • (0 : P)) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) : rootCoefficient δ 0 m h u hu = 0 := by
  sorry

lemma rootCoefficient_of_mem (δ : P →+ W) (b : δ.ker) (m : ℕ)
    (h : δ (m • (b : P)) = 0) (u : Rˣ) (hu : (u : R) = (m : R)) :
    rootCoefficient δ b m h u hu = b ⊗ₜ[ℤ] (1 : R) := by
  sorry

lemma rootCoefficient_denominator_independent (δ : P →+ W) (x : P) (m l : ℕ)
    (h : δ (m • x) = 0) (h' : δ (l • x) = 0)
    (u v : Rˣ) (hu : (u : R) = (m : R)) (hv : (v : R) = (l : R)) :
    rootCoefficient δ x m h u hu = rootCoefficient δ x l h' v hv := by
  sorry

lemma rootCoefficient_changeRing (δ : P →+ W) (x : P) (m : ℕ)
    (h : δ (m • x) = 0) (u : Rˣ) (hu : (u : R) = (m : R)) (ρ : R →+* S)
    (hρ : ((Units.map ρ.toMonoidHom u : Sˣ) : S) = (m : S)) :
    TensorProduct.map (LinearMap.id : δ.ker →ₗ[ℤ] δ.ker)
      ρ.toAddMonoidHom.toIntLinearMap (rootCoefficient δ x m h u hu) =
        rootCoefficient δ x m h (Units.map ρ.toMonoidHom u) hρ := by
  sorry

lemma rootCoefficient_map (δ : P →+ W) (δ' : P' →+ W') (f : P →+ P')
    (fB : δ.ker →+ δ'.ker) (hfB : ∀ b, (fB b : P') = f (b : P))
    (x : P) (m : ℕ) (h : δ (m • x) = 0) (h' : δ' (m • f x) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) :
    TensorProduct.map fB.toIntLinearMap (LinearMap.id : R →ₗ[ℤ] R)
      (rootCoefficient δ x m h u hu) = rootCoefficient δ' (f x) m h' u hu := by
  sorry

-- The field specializations are typed below against the primary constructors.


-- rootCoefficient_mod_five
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0)
    (u : (ZMod 5)ˣ) (hu : (u : ZMod 5) = 2) :
    rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu =
      rootMultiple (Int.castAddHom (ZMod 2)) 1 2 h ⊗ₜ[ℤ] (3 : ZMod 5) ∧
    TensorProduct.map (Int.castAddHom (ZMod 2)).ker.subtype.toIntLinearMap
      (LinearMap.id : ZMod 5 →ₗ[ℤ] ZMod 5)
      (rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu) =
        (1 : ℤ) ⊗ₜ[ℤ] (1 : ZMod 5) := by
  sorry

-- rootCoefficient_zero_test
example (δ : P →+ W) (m : ℕ) (h : δ (m • (0 : P)) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) : rootCoefficient δ 0 m h u hu = 0 := by
  sorry

-- rootCoefficient_two_denominators
example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0)
    (h' : (Int.castAddHom (ZMod 2)) (4 • (1 : ℤ)) = 0)
    (u v : (ZMod 5)ˣ) (hu : (u : ZMod 5) = 2) (hv : (v : ZMod 5) = 4) :
    rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu =
      rootCoefficient (Int.castAddHom (ZMod 2)) 1 4 h' v hv := by
  sorry

-- rootCoefficient_nonflat
example : (∃ t : (Int.castAddHom (ZMod 2)).ker ⊗[ℤ] ZMod 2,
    t ≠ 0 ∧ TensorProduct.map (Int.castAddHom (ZMod 2)).ker.subtype.toIntLinearMap
      (LinearMap.id : ZMod 2 →ₗ[ℤ] ZMod 2) t = 0) ∧
    ¬ IsUnit (2 : ZMod 2) := by
  sorry
end Roots

section FieldSpecializations
open TauCeti.BlochGroup
variable {F : Type} [Field F] {ζ : F} {m : ℕ}

/-- The generic integral multiple is the primary field constructor. -/
lemma rootMultiple_field (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (h : blochBoundary F (m • preBloch.gen F ζ) = 0) :
    rootMultiple (blochBoundary F) (preBloch.gen F ζ) m h =
      ofData ((m : ℤ) • symb F ζ) (by sorry) := by sorry

/-- API `rootCoefficient_specializations`, quotient form. The comparison map is
the canonical tensor/quotient map, characterized on pure tensors. -/
lemma rootCoefficient_specializations (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (h : blochBoundary F (m • preBloch.gen F ζ) = 0)
    (n : ℕ) (hn : Nat.Coprime n m) (u : (ZMod n)ˣ) (hu : (u : ZMod n) = (m : ZMod n))
    (φ : blochGroup F ⊗[ℤ] ZMod n →ₗ[ℤ] blochMod F n)
    (hφ : ∀ b r, φ (b ⊗ₜ[ℤ] r) = r.val • QuotientAddGroup.mk b) :
    φ (rootCoefficient (blochBoundary F) (preBloch.gen F ζ) m h u hu) =
      rootClassMod hζ hm n hn := by sorry

/-- API `rootCoefficient_specializations`, localized form. -/
lemma rootCoefficient_specializations_loc (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (h : blochBoundary F (m • preBloch.gen F ζ) = 0)
    (u : (Localization.Away (m : ℤ))ˣ)
    (hu : (u : Localization.Away (m : ℤ)) = (m : Localization.Away (m : ℤ)))
    (φ : blochGroup F ⊗[ℤ] Localization.Away (m : ℤ) →ₗ[ℤ]
      LocalizedModule (Submonoid.powers (m : ℤ)) (blochGroup F))
    (hφ : ∀ b r, φ (b ⊗ₜ[ℤ] r) = r • LocalizedModule.mk b 1) :
    φ (rootCoefficient (blochBoundary F) (preBloch.gen F ζ) m h u hu) =
      rootClassLoc hζ hm := by sorry

/-- API `rootCoefficient_specializations`, p-adic form; no tensor/kernel
identification or flatness is assumed. -/
lemma rootCoefficient_specializations_padic (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (h : blochBoundary F (m • preBloch.gen F ζ) = 0)
    (p : ℕ) [Fact p.Prime] (hp : ¬ p ∣ m)
    (u : ℤ_[p]ˣ) (hu : (u : ℤ_[p]) = (m : ℤ_[p])) :
    rootCoefficient (blochBoundary F) (preBloch.gen F ζ) m h u hu =
      rootClassPadic hζ hm p hp := by sorry

end FieldSpecializations


section Lifts
variable {K B T K' B' K'' B'' : Type*}
variable [AddCommGroup K] [AddCommGroup B] [AddCommGroup T]
variable [AddCommGroup K'] [AddCommGroup B'] [AddCommGroup K''] [AddCommGroup B'']

/-- V.6/suslin-lift-fibre. Substitute the supplier's actual K₃^ind and q.
This is an actual fibre subtype, without a chosen group structure or origin. -/
abbrev SuslinLift (q : K →+ B) (β : B) := {k : K // q k = β}

namespace SuslinLift
def ofRep (q : K →+ B) (β : B) (k : K) (h : q k = β) : SuslinLift q β := ⟨k, h⟩

lemma over (q : K →+ B) (β : B) (a : SuslinLift q β) : q a.val = β := by
  sorry

lemma ext (q : K →+ B) (β : B) (a b : SuslinLift q β) :
    a = b ↔ a.val = b.val := by
  sorry

def choose (q : K →+ B) (hq : Function.Surjective q) (β : B) : SuslinLift q β := by
  sorry

def translate (q : K →+ B) (i : T →+ K) (hi : ∀ t, q (i t) = 0)
    (β : B) (a : SuslinLift q β) (t : T) : SuslinLift q β :=
  ⟨a.val + i t, by sorry⟩

lemma translate_zero_add (q : K →+ B) (i : T →+ K) (hi : ∀ t, q (i t) = 0)
    (β : B) (a : SuslinLift q β) (s t : T) :
    translate q i hi β a 0 = a ∧
    translate q i hi β (translate q i hi β a t) s = translate q i hi β a (s + t) := by
  sorry

lemma unique_difference (q : K →+ B) (i : T →+ K) (hi : Function.Injective i)
    (he : ∀ k, q k = 0 ↔ ∃ t, i t = k) (β : B) (a b : SuslinLift q β) :
    ∃! t : T, b.val = a.val + i t := by
  sorry

def map (q : K →+ B) (q' : K' →+ B') (f : K →+ K') (g : B →+ B')
    (h : ∀ k, q' (f k) = g (q k)) (β : B) (a : SuslinLift q β) :
    SuslinLift q' (g β) := ⟨f a.val, by sorry⟩

lemma map_id_comp (q : K →+ B) (q' : K' →+ B') (q'' : K'' →+ B'')
    (f : K →+ K') (g : B →+ B') (f' : K' →+ K'') (g' : B' →+ B'')
    (h : ∀ k, q' (f k) = g (q k)) (h' : ∀ k, q'' (f' k) = g' (q' k))
    (hc : ∀ k, q'' ((f'.comp f) k) = (g'.comp g) (q k))
    (β : B) (a : SuslinLift q β) :
    map q q (AddMonoidHom.id K) (AddMonoidHom.id B) (fun _ => rfl) β a = a ∧
    map q' q'' f' g' h' (g β) (map q q' f g h β a) =
      map q q'' (f'.comp f) (g'.comp g) hc β a := by
  sorry
end SuslinLift

-- SuslinLift_zero_test
example (q : K →+ B) : (SuslinLift.ofRep q 0 0 (by sorry)).val = 0 := by
  sorry

-- SuslinLift_Q_fibre
example : Fintype.card
    (SuslinLift (ZMod.castHom (show 6 ∣ 24 by decide) (ZMod 6)).toAddMonoidHom 1) = 4 ∧
    (∀ k : ZMod 24,
      (ZMod.castHom (show 6 ∣ 24 by decide) (ZMod 6)) k = 1 ↔
        k = 1 ∨ k = 7 ∨ k = 13 ∨ k = 19) := by
  sorry

-- SuslinLift_kernel_compat
example (q : K →+ B) (k : K) :
    q k = 0 ↔ k ∈ q.ker := by
  sorry

-- SuslinLift_Q_nonsplit
example : ¬ ∃ s : ZMod 6 →+ ZMod 24,
    (ZMod.castHom (show 6 ∣ 24 by decide) (ZMod 6)).toAddMonoidHom.comp s =
      AddMonoidHom.id (ZMod 6) := by
  sorry
end Lifts

section BarLifts
variable {G G' G'' : Type} [Group G] [Group G'] [Group G'']
variable {B B' B'' : Type} [AddCommGroup B] [AddCommGroup B'] [AddCommGroup B'']

-- Abbreviations for baseline objects; these introduce no replacement homology theory.
private abbrev barRep (G : Type) [Group G] := Rep.trivial ℤ G ℤ

/-- V.6/bar-lift-witness. For the field interface G is the supplier's St(F)
and ψ is H₃(St(F))≃K₃(F)→K₃^ind(F)→B(F). -/
abbrev BarLiftCertificate (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B) :=
  {z : groupHomology.cycles (barRep G) 3 // ψ (groupHomology.π (barRep G) 3 z) = β}

namespace BarLiftCertificate
def chain (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) : (Fin 3 → G) →₀ ℤ :=
  groupHomology.iCycles (barRep G) 3 c.val

lemma cycle_eq (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) :
    groupHomology.inhomogeneousChains.d (barRep G) 2 (chain ψ β c) = 0 := by
  sorry

def homology (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) : groupHomology (barRep G) 3 :=
  groupHomology.π (barRep G) 3 c.val

lemma over (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) : ψ (homology ψ β c) = β := by
  sorry

def ofCycle (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (z : groupHomology.cycles (barRep G) 3)
    (h : ψ (groupHomology.π (barRep G) 3 z) = β) : BarLiftCertificate ψ β := ⟨z, h⟩

def ofChain (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (z : (Fin 3 → G) →₀ ℤ)
    (hz : (groupHomology.inhomogeneousChains (barRep G)).d 3 2 z = 0)
    (h : ψ (groupHomology.π (barRep G) 3
      (groupHomology.cyclesMk 3 2 ((ComplexShape.down ℕ).next_eq' (by decide)) z hz)) = β) : BarLiftCertificate ψ β :=
  ofCycle ψ β (groupHomology.cyclesMk 3 2 ((ComplexShape.down ℕ).next_eq' (by decide)) z hz) h

lemma ofChain_chain (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (z : (Fin 3 → G) →₀ ℤ)
    (hz : (groupHomology.inhomogeneousChains (barRep G)).d 3 2 z = 0)
    (h : ψ (groupHomology.π (barRep G) 3
      (groupHomology.cyclesMk 3 2 ((ComplexShape.down ℕ).next_eq' (by decide)) z hz)) = β) :
    chain ψ β (ofChain ψ β z hz h) = z := by
  sorry

lemma ext (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c d : BarLiftCertificate ψ β) :
    (c = d ↔ c.val = d.val) ∧ (c = d ↔ chain ψ β c = chain ψ β d) := by
  sorry

def addBoundary (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) (w : (Fin 4 → G) →₀ ℤ) : BarLiftCertificate ψ β :=
  ⟨c.val + groupHomology.toCycles (barRep G) 4 3 w, by sorry⟩

lemma addBoundary_spec (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) (w : (Fin 4 → G) →₀ ℤ) :
    (addBoundary ψ β c w).val = c.val + groupHomology.toCycles (barRep G) 4 3 w ∧
    homology ψ β (addBoundary ψ β c w) = homology ψ β c := by
  sorry

def choose (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (hψ : Function.Surjective ψ) (β : B) : BarLiftCertificate ψ β := by
  sorry

def map (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (ψ' : groupHomology (barRep G') 3 →ₗ[ℤ] B')
    (f : groupHomology.cycles (barRep G) 3 →ₗ[ℤ] groupHomology.cycles (barRep G') 3)
    (g : B →+ B')
    (h : ∀ z, ψ' (groupHomology.π (barRep G') 3 (f z)) =
      g (ψ (groupHomology.π (barRep G) 3 z))) (β : B) (c : BarLiftCertificate ψ β) :
    BarLiftCertificate ψ' (g β) := ⟨f c.val, by sorry⟩

lemma map_id_comp (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (ψ' : groupHomology (barRep G') 3 →ₗ[ℤ] B')
    (ψ'' : groupHomology (barRep G'') 3 →ₗ[ℤ] B'')
    (f : groupHomology.cycles (barRep G) 3 →ₗ[ℤ] groupHomology.cycles (barRep G') 3)
    (f' : groupHomology.cycles (barRep G') 3 →ₗ[ℤ] groupHomology.cycles (barRep G'') 3)
    (g : B →+ B') (g' : B' →+ B'')
    (h : ∀ z, ψ' (groupHomology.π (barRep G') 3 (f z)) =
      g (ψ (groupHomology.π (barRep G) 3 z)))
    (h' : ∀ z, ψ'' (groupHomology.π (barRep G'') 3 (f' z)) =
      g' (ψ' (groupHomology.π (barRep G') 3 z)))
    (hc : ∀ z, ψ'' (groupHomology.π (barRep G'') 3 ((f'.comp f) z)) =
      (g'.comp g) (ψ (groupHomology.π (barRep G) 3 z)))
    (β : B) (c : BarLiftCertificate ψ β) :
    map ψ ψ LinearMap.id (AddMonoidHom.id B) (fun _ => rfl) β c = c ∧
    map ψ' ψ'' f' g' h' (g β) (map ψ ψ' f g h β c) =
      map ψ ψ'' (f'.comp f) (g'.comp g) hc β c := by
  sorry
end BarLiftCertificate

-- BarLiftCertificate_zero_test
example (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (h : ψ (groupHomology.π (barRep G) 3 0) = 0) :
    BarLiftCertificate.chain ψ 0 (BarLiftCertificate.ofCycle ψ 0 0 h) = 0 ∧
    BarLiftCertificate.homology ψ 0 (BarLiftCertificate.ofCycle ψ 0 0 h) = 0 := by
  sorry

-- BarLiftCertificate_boundary_test
example (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) (w : (Fin 4 → G) →₀ ℤ) :
    BarLiftCertificate.homology ψ β (BarLiftCertificate.addBoundary ψ β c w) =
      BarLiftCertificate.homology ψ β c := by
  sorry

-- BarLiftCertificate_trivial_group
example [Subsingleton G] (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B)
    (β : B) (hβ : β ≠ 0) : IsEmpty (BarLiftCertificate ψ β) := by
  sorry

-- BarLiftCertificate_one_cube
example [Subsingleton G] (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) :
    ∃ c : BarLiftCertificate ψ 0,
      BarLiftCertificate.chain ψ 0 c = Finsupp.single (fun _ : Fin 3 => (1 : G)) 1 ∧
      BarLiftCertificate.chain ψ 0 c ≠ 0 ∧ BarLiftCertificate.homology ψ 0 c = 0 := by
  sorry

-- BarLiftCertificate_reject_noncycle
example (ψ : groupHomology (barRep G) 3 →ₗ[ℤ] B) (β : B) (g : G) (hg : g ≠ 1) :
    ∀ c : BarLiftCertificate ψ β,
      BarLiftCertificate.chain ψ β c ≠
        Finsupp.single (fun i : Fin 3 => if i = 0 then g else 1) 1 := by
  sorry
end BarLifts

section FiniteCoefficients
variable {K E H : Type*} [AddCommGroup K] [AddCommGroup E] [AddCommGroup H]

/- V.6/finite-coefficient-identification
K=K₃(F;ℤ/n), E=B_CGZ(F;ℤ/n), H=H¹(F,ℤ/n(2)) are unavailable supplier
types. For F a number field, n=p^a with p odd, a≥1 and p∤w₂(F), M.7/M.8
provide the finite Chern equivalence c and HB.2 provides R_ζ=r. This generic
composition is the exact proposed Φ=r⁻¹c; none of those objects is defined as
a bare Type or a Prop here. The original modulo comparison remains separate.
-/
def finiteCoefficientBlochEquiv (c : K ≃+ H) (r : E ≃+ H) : K ≃+ E := c.trans r.symm

lemma finiteCoefficientBlochEquiv_spec (c : K ≃+ H) (r : E ≃+ H) (x : K) (y : E) :
    r (finiteCoefficientBlochEquiv c r x) = c x ∧
    (finiteCoefficientBlochEquiv c r).symm y = c.symm (r y) ∧
    (∀ e : K ≃+ E, (∀ z, r (e z) = c z) → e = finiteCoefficientBlochEquiv c r) := by
  sorry

lemma finiteCoefficientBlochEquiv_def (c : K ≃+ H) (r : E ≃+ H) :
    finiteCoefficientBlochEquiv c r = c.trans r.symm := by
  sorry

lemma finiteCoefficientBlochEquiv_natural
    {K' E' H' : Type*} [AddCommGroup K'] [AddCommGroup E'] [AddCommGroup H']
    (c : K ≃+ H) (r : E ≃+ H) (c' : K' ≃+ H') (r' : E' ≃+ H')
    (f : K →+ K') (g : E →+ E') (h : H →+ H')
    (hc : ∀ x, c' (f x) = h (c x)) (hr : ∀ y, r' (g y) = h (r y)) (x : K) :
    finiteCoefficientBlochEquiv c' r' (f x) = g (finiteCoefficientBlochEquiv c r x) := by
  sorry

-- finiteCoefficientBlochEquiv_mod_five
example (c r : ZMod 5 ≃+ ZMod 5) (hc : ∀ x, c x = (2 : ZMod 5) * x)
    (hr : ∀ x, r x = (3 : ZMod 5) * x) : finiteCoefficientBlochEquiv c r 1 = 4 := by
  sorry

-- finiteCoefficientBlochEquiv_zero
example (c r : ZMod 1 ≃+ ZMod 1) : finiteCoefficientBlochEquiv c r 0 = 0 := by
  sorry

-- finiteCoefficientBlochEquiv_composition
example (c : K ≃+ H) (r : E ≃+ H) :
    finiteCoefficientBlochEquiv c r = c.trans r.symm ∧
    (finiteCoefficientBlochEquiv c r).symm = r.trans c.symm := by
  sorry

-- finiteCoefficientBlochEquiv_middle_not_left
example : ¬ Nonempty (ZMod 1 ≃+ ZMod 5) := by
  sorry

variable {n : ℕ} {L : Type*} [AddCommGroup L] [Module (ZMod n) L]
variable [Module (ZMod n) H]

/-- The modulo restriction in the additional M_F range uses the actual unit
γ from HB.2's comparison and retains its inverse factor. No claim about the
right-hand K₂[n] map is hidden in these hypotheses. -/
lemma finiteCoefficientBlochEquiv_on_quotient
    (c : K ≃+ H) (r : E ≃+ H) (jK : L →+ K) (jB : L →+ E)
    (h₀ : L →ₗ[ZMod n] H) (γ : (ZMod n)ˣ)
    (hc : ∀ x, c (jK x) = h₀ x)
    (hr : ∀ x, r (jB x) = (γ : ZMod n) • h₀ x) (x : L) :
    finiteCoefficientBlochEquiv c r (jK x) = jB (((γ⁻¹ : (ZMod n)ˣ) : ZMod n) • x) := by
  sorry

/- Exact omitted field acceptance statement:
For F=ℚ,n=5, K₃(ℚ)/5=0, but the HB.2 coefficient Bloch class [32] has
δ_B([32])={2,−31} with tame symbol 2 of order 5 at 31. Thus E and K cannot
be substituted by the corresponding ordinary modulo groups. The missing K₂,
symbols and étale Bloch types belong to their supplier nodes.

Open normalization input: identify δ_B ∘ finiteCoefficientBlochEquiv with
the precise scalar multiple of the finite K-theory Bockstein ∂_K using the
M.8/Tate convention. Equality with scalar 1 is not a signature in this file.
-/
end FiniteCoefficients

end TauCeti.Blueprint.K3BlochV6
end

end ContinuationV6


/-! The V.1 transport evaluator specializes to the primary canonical comparison. -/
namespace K3Homological
noncomputable section
lemma eval3_parent (K : ℕ → Type → Type) [∀ n A, AddCommGroup (K n A)]
    (St : Type → Type) [∀ A, Group (St A)] (A : Type) [Ring A]
    (z : TauCeti.K3.barCycle3 St A) :
    eval3 (TauCeti.K3.k3EquivH3Steinberg K St A) z =
      TauCeti.K3.evalBarCycle K St A z := by sorry
end
end K3Homological
