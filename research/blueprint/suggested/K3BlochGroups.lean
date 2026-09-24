/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/K3BlochGroups.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-K3BlochGroups: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Synced with the corrected packet (102 nodes) in review REV-K3BlochGroups and
elaborated with `lake env lean` against Mathlib 082e2d3: `sorry` is the only
warning. The file imports only Mathlib.

Objects that another roadmap owns appear as `variable`s, never as invented
definitions: Quillen K-groups, their functoriality and products, the K₁-class of a
unit, the product with `[-1]`, the spaces `BGL(A)⁺`, `BE(A)⁺` and the stable group
`GL(A)` (GeneralAlgebraicKTheory K.2); the stable and finite-rank Steinberg groups,
the elementary group and the generators `x_ij(a)` (K2SymbolsBrauer T.1); Milnor
K-theory, its symbols, the graded map and Matsumoto's symbol (K2SymbolsBrauer T.2);
classifying spaces (StableHomotopyKTheory H.3); motivic cohomology of a field
(MotivicEtaleKTheory M.6); the transfer on K₃ of finite fields (KTheoryFiniteLocalFields
L.1); the Bloch-Wigner function and its descent (Polylogarithms P.1, P.2); the weight-two
and Borel regulators (Polylogarithms P.2, BorelRegulators); the second Adams-Bott
invariant (ArithmeticKTheory N.5). Statements about them are forms, true only once
the variables are instantiated by the supplier. Nothing below encodes a missing theorem
as an assumed structure field or as a `Prop`-valued definition, and `sorry` occurs only
as the body of a declaration (or a proof obligation inside one), never in a statement.

Unit tests are `example`s whose docstring begins "Test `<name>`" with the name the
packet gives. A theorem node that cannot be stated honestly yet is a comment
`-- <node id>: not stated; needs <missing object>`.
-/
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Basic
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.Algebra.Exact.Basic
import Mathlib.Algebra.FreeAbelianGroup.Finsupp
import Mathlib.Algebra.Homology.QuasiIso
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.AlgebraicTopology.FundamentalGroupoid.SimplyConnected
import Mathlib.AlgebraicTopology.SingularHomology.Basic
import Mathlib.CategoryTheory.Monoidal.Tor
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.GroupTheory.GroupAction.Embedding
import Mathlib.GroupTheory.GroupAction.MultipleTransitivity
import Mathlib.GroupTheory.IsPerfect
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.GroupTheory.Torsion
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.LinearAlgebra.Projectivization.Action
import Mathlib.LinearAlgebra.Projectivization.Independence
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Logic.Equiv.Fin.Rotate
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality
import Mathlib.RepresentationTheory.Homological.GroupHomology.Shapiro
import Mathlib.RingTheory.Localization.Module
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
import Mathlib.Topology.Homotopy.Basic
import Mathlib.Topology.Homotopy.Contractible
import Mathlib.Topology.Homotopy.Equiv
import Mathlib.Topology.Homotopy.HomotopyGroup

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

/-- V.1/uce-superperfect: the source of a universal central extension is superperfect. -/
theorem superperfect_of_universal {S P : Type} [Group S] [Group P] (φ : S →* P)
    (hsurj : Function.Surjective φ) (hcen : φ.ker ≤ Subgroup.center S)
    (huniv : ∀ (Y : Type) [Group Y] (ψ : Y →* P), Function.Surjective ψ →
      ψ.ker ≤ Subgroup.center Y → ∃! h : S →* Y, ψ.comp h = φ) :
    Subsingleton (intHomology S 1) ∧ Subsingleton (intHomology S 2) := by sorry

/-- V.1/central-extension-comp. -/
theorem centralExtension_comp {Y X G : Type} [Group Y] [Group X] [Group G] (ρ : Y →* X)
    (π : X →* G) (hρ : Function.Surjective ρ) (hπ : Function.Surjective π)
    (hρc : ρ.ker ≤ Subgroup.center Y) (hπc : π.ker ≤ Subgroup.center X) (hX : Group.IsPerfect X) :
    Function.Surjective (π.comp ρ) ∧ (π.comp ρ).ker ≤ Subgroup.center Y := by sorry

/-- V.1/split-extensions-kill-h2: if every central extension of `G` by `ℚ/ℤ` splits then
`H₂(G, ℤ) = 0`. The sharper surjectivity of `H²(G; ℚ/ℤ) → Hom(H₂(G), ℚ/ℤ)` is not stated. -/
theorem schurMultiplier_eq_zero_of_split (G : Type) [Group G]
    (h : ∀ (E : Type) [Group E] (i : Multiplicative (ℚ ⧸ AddSubgroup.zmultiples (1 : ℚ)) →* E)
      (π : E →* G), Function.Injective i → Function.Surjective π → i.range = π.ker →
        i.range ≤ Subgroup.center E → ∃ s : G →* E, π.comp s = MonoidHom.id G) :
    Subsingleton (intHomology G 2) := by sorry

/-- V.1/steinberg-superperfect. -/
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
/-- CGZ's boundary `d : ℤ[ℙ¹(F)] → ⋀²(Additive Fˣ)`, `[X] ↦ X ∧ (1 - X)`, `[0], [1], [∞] ↦ 0`. -/
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

/-- V.3/cgz-bloch-group: `B_CGZ(F)`, the image of `A(F)` in `ℤ[ℙ¹(F)] ⧸ ⟨ξ⟩`. -/
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

/-- V.5/bloch-finite-field-mod-n, as abstract isomorphisms (that the Suslin map induces the
first is not stated: this file defines the Suslin map only for infinite fields). -/
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
