import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Module.Submodule.Range
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.RepresentationTheory.Homological.ContCohomology.Functoriality
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.Topology.Algebra.RestrictedProduct.Basic
import Mathlib.Topology.Algebra.RestrictedProduct.TopologicalSpace
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Ext.Basic
import Mathlib.RepresentationTheory.Homological.TateCohomology.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Basic
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Polynomial.HilbertPoly
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Matrix.Mul
import Mathlib.Topology.Algebra.Nonarchimedean.AdicTopology
import Mathlib.RingTheory.Noetherian.Basic
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Basic
import Mathlib.Algebra.Homology.HomotopyCategory.Pretriangulated
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone
import Mathlib.Algebra.Homology.HomologySequence
import Mathlib.Algebra.Homology.HomologicalComplexAbelian
import Mathlib.Algebra.Homology.HomotopyCategory.HomComplex
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.GroupTheory.Torsion
import Mathlib.Algebra.Homology.HomologicalComplexLimits
import Mathlib.Algebra.Homology.TotalComplex
import Mathlib.Algebra.Homology.SpectralSequence.Basic
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.NumberTheory.NumberField.Completion.FinitePlace
import Mathlib.RingTheory.ClassGroup.Basic
import TauCeti.NumberTheory.NumberField.Global.Places.Basic
import Mathlib.RepresentationTheory.Induced
import Mathlib.RepresentationTheory.Subrepresentation
import Mathlib.RepresentationTheory.Rep.Res
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.FieldTheory.KrullTopology
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.FieldTheory.Galois.Basic
import TauCeti.NumberTheory.NumberField.UnramifiedTower
import TauCeti.GroupTheory.GroupExtension.Of.FactorSet
import TauCeti.RepresentationTheory.Homological.ContCohomology.InternalHom
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete
import TauCeti.Topology.Algebra.Group.Profinite.Section

/-!
# Suggested declarations: continuous cohomology, Part II

This file is not exhaustive. The reviewed packet supplies the updated specifications;
the separate reader needs the corrections listed in the independent review report.
These signatures suggest Lean forms
so contributors and reviewers can converge on names, carriers and conventions. Proofs marked
`sorry` claim no implementation. The packet records source and supplier gaps explicitly.

The existing Mathlib homogeneous complex, continuous cohomology, Tate cohomology,
restricted products, mapping cones and Tau Ceti factor sets and internal Homs are reused.
Joint continuity is imposed where the arithmetic comparison needs it.
-/

noncomputable section

open CategoryTheory

universe u

namespace TauCeti.CompactCoefficients

/-! ## Towers, `lim` and `lim¹` -/

/-- An `ℕ`-indexed inverse system of abelian groups. -/
structure Tower where
  /-- The terms. -/
  obj : ℕ → Type*
  [inst : ∀ n, AddCommGroup (obj n)]
  /-- The transition maps `A_{n+1} → A_n`. -/
  map : ∀ n, obj (n + 1) →+ obj n

attribute [instance] Tower.inst

namespace Tower

/-- The composite transition `A_{n+k} → A_n`. -/
def mapIter (A : Tower) : ∀ (n k : ℕ), A.obj (n + k) →+ A.obj n
  | _, 0 => AddMonoidHom.id _
  | n, k + 1 => (mapIter A n k).comp (A.map (n + k))

variable (A : Tower)

/-- The shift map `∏ A_n → ∏ A_n`, `(a_n) ↦ (a_n - φ_n(a_{n+1}))`. -/
def shift : (∀ n, A.obj n) →+ (∀ n, A.obj n) where
  toFun a n := a n - A.map n (a (n + 1))
  map_zero' := by ext n; simp
  map_add' a b := by ext n; simp only [Pi.add_apply, map_add]; abel

/-- **`R02.1/lim-one`**: `lim A = ker(shift)`. -/
def lim : AddSubgroup (∀ n, A.obj n) := A.shift.ker

/-- **`R02.1/lim-one`**: `lim¹ A = coker(shift)`. -/
abbrev limOne : Type _ := (∀ n, A.obj n) ⧸ A.shift.range

/-- API: membership in `lim`. -/
theorem mem_lim (a : ∀ n, A.obj n) : a ∈ A.lim ↔ ∀ n, A.map n (a (n + 1)) = a n := sorry

/-- The canonical tower functor, with iterated transition maps. -/
def toFunctor (A : Tower.{u}) : ℕᵒᵖ ⥤ AddCommGrpCat.{u} := sorry

/-- **`R02.1/mittag-leffler`**: reuse Mathlib's existing predicate. -/
abbrev IsMittagLeffler : Prop :=
  (A.toFunctor ⋙ CategoryTheory.forget AddCommGrpCat).IsMittagLeffler

/-- The eventual-range characterization of the existing predicate. -/
theorem isMittagLeffler_iff_ranges : A.IsMittagLeffler ↔
    ∀ n, ∃ m, ∀ k ≥ m, (A.mapIter n k).range = (A.mapIter n m).range := sorry

/-- API: surjective transitions give a Mittag-Leffler tower. -/
theorem isMittagLeffler_of_surjective (h : ∀ n, Function.Surjective (A.map n)) :
    A.IsMittagLeffler := sorry

/-- API: a tower of finite groups is Mittag-Leffler. -/
theorem isMittagLeffler_of_finite [∀ n, Finite (A.obj n)] : A.IsMittagLeffler := sorry

/-- **`R02.1/mittag-leffler-lim-one`**: a Mittag-Leffler tower has `lim¹ = 0`. -/
theorem limOne_subsingleton_of_isMittagLeffler (h : A.IsMittagLeffler) :
    Subsingleton A.limOne := sorry

/-- API: surjective transitions give `lim¹ = 0`. -/
theorem limOne_subsingleton_of_surjective (h : ∀ n, Function.Surjective (A.map n)) :
    Subsingleton A.limOne :=
  A.limOne_subsingleton_of_isMittagLeffler (A.isMittagLeffler_of_surjective h)

theorem isMittagLeffler_iff_functor (A : Tower) : A.IsMittagLeffler ↔
    (A.toFunctor ⋙ CategoryTheory.forget AddCommGrpCat).IsMittagLeffler := Iff.rfl

end Tower

/-- The constant tower `ℤ ← ℤ ← ⋯` with transition maps multiplication by `p`. -/
def mulTower (p : ℕ) : Tower where
  obj _ := ℤ
  map _ := AddMonoidHom.mul (p : ℤ)

/-- **`R02.1/lim-one-six-term`**: a short exact sequence of towers gives
`0 → lim A → lim B → lim C → lim¹ A → lim¹ B → lim¹ C → 0`; here the connecting map. -/
def limOneConnecting (A B C : Tower) (f : ∀ n, A.obj n →+ B.obj n) (g : ∀ n, B.obj n →+ C.obj n)
    (hf : ∀ n x, f n (A.map n x) = B.map n (f (n + 1) x))
    (hg : ∀ n x, g n (B.map n x) = C.map n (g (n + 1) x))
    (hex : ∀ n, Function.Exact (f n) (g n)) (hsurj : ∀ n, Function.Surjective (g n))
    (hinj : ∀ n, Function.Injective (f n)) : C.lim →+ A.limOne := sorry

/-! ## Continuous cochains into inverse limits -/

section Cochains

variable {X : Type*} [TopologicalSpace X] [CompactSpace X] [TotallyDisconnectedSpace X]

omit [CompactSpace X] [TotallyDisconnectedSpace X] in
/-- **`R02.1/cochain-lifting`**: a set section of a surjection between discrete spaces
is continuous. Composing with it lifts a continuous map from any topological space. -/
theorem exists_lift_continuous {Y Z : Type*} [TopologicalSpace Y] [DiscreteTopology Y]
    [TopologicalSpace Z] [DiscreteTopology Z] (π : Y → Z) (hπ : Function.Surjective π)
    (f : C(X, Z)) : ∃ g : C(X, Y), π ∘ g = f := sorry

omit [CompactSpace X] [TotallyDisconnectedSpace X] in
/-- **`R02.1/cochains-inverse-limit`**: continuous maps into a closed subspace of a product
(an inverse limit) are compatible families of continuous maps into the factors. -/
theorem continuous_into_pi_iff {ι : Type*} {Y : ι → Type*} [∀ i, TopologicalSpace (Y i)]
    (f : X → ∀ i, Y i) : Continuous f ↔ ∀ i, Continuous fun x => f x i :=
  continuous_pi_iff

/-- **`R02.1/compact-cochain-bounded`**: a continuous map from a compact space into `ℚ_p^d` lands in
`p^{-n}ℤ_p^d` for some `n`, so `C(X, V) = ⋃_n C(X, p^{-n}T)`. -/
theorem exists_pow_smul_mem_lattice (p : ℕ) [Fact p.Prime] (d : ℕ) (f : C(X, Fin d → ℚ_[p])) :
    ∃ n : ℕ, ∀ x i, ‖(p : ℚ_[p]) ^ n * f x i‖ ≤ 1 := sorry

end Cochains

/-! ## Pointwise `Hom` and the splitting torsor (Harpaz–Wittenberg, Lemma 5.5, corrected) -/

section SplittingTorsor

variable (C A : Type*) [AddCommGroup C] [AddCommGroup A] [TopologicalSpace A]

/-- **`R02.1/pointwise-hom`**: `Hom_pt(C, A)`, the additive homomorphisms `C → A` with the topology
induced from `A^C` (pointwise convergence). -/
def HomPt : Type _ := C →+ A

instance : AddCommGroup (HomPt C A) := inferInstanceAs (AddCommGroup (C →+ A))

instance : FunLike (HomPt C A) C A := inferInstanceAs (FunLike (C →+ A) C A)

instance : TopologicalSpace (HomPt C A) :=
  TopologicalSpace.induced (fun (f : C →+ A) (c : C) => f c) Pi.topologicalSpace

variable {C A}

/-- API: evaluation `Hom_pt(C, A) × C → A` is continuous for discrete `C`. -/
theorem continuous_eval [TopologicalSpace C] [DiscreteTopology C] :
    Continuous fun x : HomPt C A × C => x.1 x.2 := sorry

/-- API: for finitely generated `C` and discrete `A`, `Hom_pt(C, A)` is discrete. -/
theorem discreteTopology_of_fg [DiscreteTopology A] (hC : AddGroup.FG C) :
    DiscreteTopology (HomPt C A) := sorry

variable {B : Type*} [AddCommGroup B]

/-- **`R02.1/splitting-torsor`**: the sections of `κ : B → C` (group homomorphisms with
`κ ∘ s = id`), a torsor under `Hom(C, A)` for `A = ker κ`. -/
def Sections (κ : B →+ C) : Type _ := {s : C →+ B // κ.comp s = AddMonoidHom.id C}

/-- API: two sections differ by a homomorphism `C → ker κ`. -/
theorem sections_sub_mem_ker (κ : B →+ C) (s t : Sections κ) (c : C) :
    (s.1 c - t.1 c) ∈ κ.ker := sorry

/-- API: the torsor is nonempty exactly when the underlying sequence splits as groups. -/
theorem sections_nonempty_iff (κ : B →+ C) (hκ : Function.Surjective κ) :
    Nonempty (Sections κ) ↔ ∃ s : C →+ B, ∀ c, κ (s c) = c := sorry

end SplittingTorsor


variable {C A : Type*} [AddCommGroup C] [AddCommGroup A] [TopologicalSpace A]

/-- Finite pointwise Hom agrees topologically with the existing internal Hom wrapper. -/
def homPt_equiv_internalHom (G : Type*) [Finite C] [DiscreteTopology A] :
    HomPt C A ≃ₜ TauCeti.InternalHom G C A := sorry

namespace SuggestedTest

-- TEST limOne_surjective_tower
example (p : ℕ) : Subsingleton (Tower.limOne
    { obj := fun n => ZMod (p ^ n), map := fun n => (ZMod.castHom
      (pow_dvd_pow p (Nat.le_succ n)) (ZMod (p ^ n))).toAddMonoidHom }) := sorry

-- TEST limOne_mul_p
example (p : ℕ) [Fact p.Prime] :
    (mulTower p).lim = ⊥ ∧
      Nonempty ((mulTower p).limOne ≃+ (ℤ_[p] ⧸ (Int.castAddHom ℤ_[p]).range)) := sorry

-- TEST lim_constant
example (M : Type*) [AddCommGroup M] (a : ∀ _ : ℕ, M) :
    a ∈ (⟨fun _ => M, fun _ => AddMonoidHom.id M⟩ : Tower).lim ↔
      ∀ n, a n = a 0 := sorry

-- TEST ml_finite
example (A : Tower) [∀ n, Finite (A.obj n)] : A.IsMittagLeffler := sorry

-- TEST ml_surjective
example (A : Tower) (h : ∀ n, Function.Surjective (A.map n)) :
    A.IsMittagLeffler := sorry

-- TEST ml_mul_p_fails
example (p : ℕ) [Fact p.Prime] : ¬ (mulTower p).IsMittagLeffler := sorry

-- TEST homPt_int
example (A : Type*) [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A] :
    Nonempty (HomPt ℤ A ≃ₜ A) := sorry

-- TEST homPt_fg_discrete
example (C A : Type*) [AddCommGroup C] [AddCommGroup A]
    [TopologicalSpace A] [DiscreteTopology A] (hC : AddGroup.FG C) :
    DiscreteTopology (HomPt C A) := sorry

-- TEST homPt_not_discrete
example : letI : TopologicalSpace (ZMod 2) := ⊥
    ¬ DiscreteTopology (HomPt (ℕ →₀ ZMod 2) (ZMod 2)) := sorry

-- TEST torsor_trivial_A
example (C : Type*) [AddCommGroup C] : Subsingleton (Sections (AddMonoidHom.id C)) := sorry

end SuggestedTest

section FactorSetTopology

/- The following signatures are adapters for the fixed f790474 compilation pin.
Current Tau Ceti already implements the topology, continuous section and rescaling
in Topology/Algebra/GroupExtension/FactorSet.lean, and the compact-kernel H²
classification in Cohomology.lean. Packaging imports those implementations and
plans only the comparison with the canonical compact-cochain carrier. -/

variable {G M : Type*} [Group G] [CommGroup M] [MulDistribMulAction G M]
  [TopologicalSpace G] [TopologicalSpace M]

/-- R02.1/continuous-factor-set-extension: topology on the existing extension. -/
@[instance_reducible]
def factorSetTopology (α : TauCeti.FactorSet G M) : TopologicalSpace α.Extension :=
  TopologicalSpace.induced (fun x => (x.left, x.right)) inferInstance

local instance (α : TauCeti.FactorSet G M) : TopologicalSpace α.Extension :=
  factorSetTopology α

variable [IsTopologicalGroup G] [IsTopologicalGroup M]

/-- The joint action hypothesis is essential. -/
theorem factorSet_isTopologicalGroup (α : TauCeti.FactorSet G M)
    (hα : Continuous (α : G × G → M))
    (haction : Continuous fun x : G × M => x.1 • x.2) :
    IsTopologicalGroup α.Extension := sorry

/-- The section already supplied by the algebraic factor-set carrier. -/
theorem factorSet_section_continuous (α : TauCeti.FactorSet G M) :
    Continuous (α.canonicalSection : G → α.Extension) := sorry

/-- Rescaling uses the existing algebraic equivalence, with continuous coordinates. -/
def factorSet_rescaleHomeomorph (α β : TauCeti.FactorSet G M) (x : G → M)
    (hx : ∀ g h, α (g,h) * x (g*h) = β (g,h) * (g • x h * x g))
    (hcont : Continuous x) : α.Extension ≃ₜ β.Extension := sorry

namespace SuggestedTest

-- TEST factor_trivial_product
example : factorSetTopology (TauCeti.FactorSet.trivial G M) =
    TopologicalSpace.induced (fun x => (x.left,x.right)) inferInstance := sorry

-- TEST factor_section
example (α : TauCeti.FactorSet G M) (g : G) :
    α.rightHom (α.canonicalSection g) = g := sorry

-- TEST factor_zero_kernel
example [Subsingleton M] (α : TauCeti.FactorSet G M) :
    Nonempty (α.Extension ≃ₜ G) := sorry

end SuggestedTest
end FactorSetTopology

end TauCeti.CompactCoefficients

open CategoryTheory CategoryTheory.Limits

namespace TauCeti.ArithmeticDuality

section Admissibility

variable {R G M : Type*} [CommRing R] [Group G] [AddCommGroup M] [Module R M]

/-- D7/admissible-coefficients: image of the group algebra inside the existing endomorphisms. -/
def actionSpan (ρ : Representation R G M) : Submodule R (Module.End R M) :=
  Submodule.span R (Set.range ρ)

variable [TopologicalSpace G]

/-- The topology is the adic topology on the finite image module, not an operator topology. -/
def isAdmissible (I : Ideal R) (ρ : Representation R G M) : Prop :=
  Module.Finite R (actionSpan ρ) ∧
    letI : TopologicalSpace (actionSpan ρ) := I.adicModuleTopology (actionSpan ρ)
    Continuous fun g : G => (⟨ρ g, Submodule.subset_span ⟨g,rfl⟩⟩ : actionSpan ρ)

/-- General ind-coefficients are unions of finite-type continuous stable submodules.
No arbitrary topology on the entire module is used in this condition. -/
def isIndAdmissible (I : Ideal R) (ρ : Representation R G M) : Prop :=
  ∀ m : M, ∃ N : Subrepresentation ρ, m ∈ N ∧
    Module.Finite R N.toSubmodule ∧ isAdmissible I N.toRepresentation

/-- Finite discrete continuous coefficients, over a complete local Noetherian ring. -/
theorem admissible_of_finite [IsNoetherianRing R] [IsLocalRing R]
    [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    (ρ : Representation R G M)
    (haction : Continuous fun x : G × M => ρ x.1 x.2) :
    isAdmissible (IsLocalRing.maximalIdeal R) ρ := sorry

/-- The coefficient topology is explicitly the maximal-ideal topology. -/
theorem admissible_of_finiteType [IsNoetherianRing R] [IsLocalRing R]
    [Module.Finite R M] (ρ : Representation R G M)
    (haction : letI : TopologicalSpace M :=
      (IsLocalRing.maximalIdeal R).adicModuleTopology M
      Continuous fun x : G × M => ρ x.1 x.2) :
    isAdmissible (IsLocalRing.maximalIdeal R) ρ := sorry

namespace SuggestedTest

-- TEST admissible_trivial
example : actionSpan (Representation.trivial R G M) =
    Submodule.span R ({LinearMap.id} : Set (Module.End R M)) := sorry

-- TEST admissible_zero
example [Subsingleton M] (ρ : Representation R G M) : actionSpan ρ = ⊥ := sorry

-- TEST ind_admissible_trivial
example (I : Ideal R) : isIndAdmissible I (Representation.trivial R G M) := sorry

-- TEST admissible_joint
example [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M]
    (ρ : Representation R G M)
    (h : isAdmissible (IsLocalRing.maximalIdeal R) ρ) :
    letI : TopologicalSpace M := (IsLocalRing.maximalIdeal R).adicModuleTopology M
    Continuous fun x : G × M => ρ x.1 x.2 := sorry

end SuggestedTest
end Admissibility

section ContinuousCochains

variable {R G : Type*} [Ring R] [Group G] [TopologicalSpace R]
  [TopologicalSpace G] [IsTopologicalGroup G]

/-- D7/continuous-derived-cochains: algebraic image of the canonical homogeneous complex.
This is the finite-type/cofinite TopRep carrier. For general ind-admissible modules
the packet instead uses the filtered colimit over finite-type continuous stable
submodules. Its indexed coefficient functor is an explicit prototype gap.
The comparison with derived invariants is conditional beyond degrees zero and one. -/
abbrev algebraicContinuousCochains (X : TopRep R G) : CochainComplex (ModuleCat R) ℕ :=
  ((forget₂ (TopModuleCat R) (ModuleCat R)).mapHomologicalComplex (.up ℕ)).obj
    (TopRep.homogeneousCochains X)

abbrev algebraicContinuousCohomology (X : TopRep R G) (n : ℕ) : ModuleCat R :=
  (algebraicContinuousCochains X).homology n

/-- Forgetting topology compares the actual kernel/image quotient carriers. -/
def algebraicCohomology_compare (X : TopRep R G) (n : ℕ) :
    algebraicContinuousCohomology X n ≅
      (forget₂ (TopModuleCat R) (ModuleCat R)).obj (continuousCohomology n X) := sorry

theorem continuousCochains_d_squared (X : TopRep R G) (n : ℕ) :
    (algebraicContinuousCochains X).d n (n+1) ≫
      (algebraicContinuousCochains X).d (n+1) (n+2) = 0 := sorry

namespace SuggestedTest

-- TEST cochains_d_squared
example (X : TopRep R G) (n : ℕ) :
    (algebraicContinuousCochains X).d n (n+1) ≫
      (algebraicContinuousCochains X).d (n+1) (n+2) = 0 := sorry

-- TEST cochains_homogeneous
example (X : TopRep R G) : algebraicContinuousCochains X =
    ((forget₂ (TopModuleCat R) (ModuleCat R)).mapHomologicalComplex (.up ℕ)).obj
      (TopRep.homogeneousCochains X) := sorry

-- TEST cochains_zero
example (X : TopRep R G) (n : ℕ) :
    ((algebraicContinuousCochains X).d n (n+1)).hom
      (0 : (algebraicContinuousCochains X).X n) = 0 := sorry

end SuggestedTest
end ContinuousCochains

end TauCeti.ArithmeticDuality

namespace TauCeti.CompactCoefficients

instance homPtTopologicalAddGroup {A C : Type*} [AddCommGroup A] [AddCommGroup C]
    [TopologicalSpace A] [IsTopologicalAddGroup A] : IsTopologicalAddGroup (HomPt C A) := sorry

variable {Γ : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  (A B C : TopRep.{0} ℤ Γ) [DiscreteTopology A.V] [Fact (TauCeti.IsSmoothDiscrete ℤ A)] [DiscreteTopology B.V] [Fact (TauCeti.IsSmoothDiscrete ℤ B)] [DiscreteTopology C.V] [Fact (TauCeti.IsSmoothDiscrete ℤ C)]

/-- The existing conjugation action, with the pointwise topology on its Hom carrier. -/
def pointwiseHomRepresentation (A C : TopRep.{0} ℤ Γ)
    [DiscreteTopology A.V] [Fact (TauCeti.IsSmoothDiscrete ℤ A)] [DiscreteTopology C.V] [Fact (TauCeti.IsSmoothDiscrete ℤ C)] :
    ContRepresentation ℤ Γ (HomPt C.V A.V) := sorry

theorem pointwiseHomRepresentation_apply (g : Γ) (f : HomPt C.V A.V) (c : C.V) :
    (pointwiseHomRepresentation A C g f) c = A.ρ g (f (C.ρ g⁻¹ c)) := sorry

abbrev pointwiseHomRep := TopRep.of (pointwiseHomRepresentation A C)

def splittingClass (ι : A ⟶ B) (κ : B ⟶ C)
    (hinj : Function.Injective ι.hom) (hsurj : Function.Surjective κ.hom)
    (hex : Function.Exact ι.hom κ.hom) (s : Sections κ.hom.toAddMonoidHom) :
    continuousCohomology 1 (pointwiseHomRep A C) := sorry

theorem splittingClass_eq_zero_iff (ι : A ⟶ B) (κ : B ⟶ C)
    (hinj : Function.Injective ι.hom) (hsurj : Function.Surjective κ.hom)
    (hex : Function.Exact ι.hom κ.hom) (s : Sections κ.hom.toAddMonoidHom) :
    splittingClass A B C ι κ hinj hsurj hex s = 0 ↔ ∃ t : C ⟶ B, t ≫ κ = 𝟙 C := sorry

/-- Coordinates of the counterexample in Harpaz–Wittenberg, Lemma 5.5. -/
def shearAdd (g : ℕ → ZMod 2) : (ℕ →₀ ZMod 2) →+ (ℕ →₀ ZMod 2) where
  toFun c := c.sum (fun n a => Finsupp.single n (g n * a))
  map_zero' := sorry
  map_add' := sorry

namespace SuggestedTest
-- TEST torsor_equivariant_split
example (ι : A ⟶ B) (κ : B ⟶ C)
    (hinj : Function.Injective ι.hom) (hsurj : Function.Surjective κ.hom)
    (hex : Function.Exact ι.hom κ.hom) (s : Sections κ.hom.toAddMonoidHom)
    (t : C ⟶ B) (ht : t ≫ κ = 𝟙 C) : splittingClass A B C ι κ hinj hsurj hex s = 0 := sorry

-- TEST torsor_zero_class
example [Subsingleton A.V] (ι : A ⟶ B) (κ : B ⟶ C)
    (hinj : Function.Injective ι.hom) (hsurj : Function.Surjective κ.hom)
    (hex : Function.Exact ι.hom κ.hom) (s : Sections κ.hom.toAddMonoidHom) :
    splittingClass A B C ι κ hinj hsurj hex s = 0 := sorry

-- TEST torsor_discrete_fails
example : letI : TopologicalSpace (ZMod 2) := ⊥
    letI : TopologicalSpace ((ℕ →₀ ZMod 2) →+ (ℕ →₀ ZMod 2)) := ⊥
    ¬ Continuous shearAdd := sorry
end SuggestedTest
end TauCeti.CompactCoefficients

open CategoryTheory.Pretriangulated

namespace TauCeti.ArithmeticDuality

variable {R : Type u} [CommRing R]
variable {A B A' B' : CochainComplex (ModuleCat.{u} R) ℤ}

/-- R02.3/finite-compact-support: supplied arithmetic cochains and actual restriction map. -/
abbrev finiteCompactCochains (res : A ⟶ B) : CochainComplex (ModuleCat.{u} R) ℤ :=
  (CochainComplex.mappingCone res)⟦(-1 : ℤ)⟧

abbrev finiteCompactCohomology (res : A ⟶ B) (n : ℤ) : ModuleCat.{u} R :=
  (finiteCompactCochains res).homology n

/-- The mapping-fibre triangle uses Mathlib's inverse rotation. -/
def finiteCompactTriangle (res : A ⟶ B) : Triangle (CochainComplex (ModuleCat.{u} R) ℤ) :=
  CategoryTheory.Pretriangulated.Triangle.invRotate (CochainComplex.mappingCone.triangle res)

/-- The LES is stated using the actual morphisms, including the connecting morphism. -/
theorem finiteCompact_exact (res : A ⟶ B) (n : ℤ) :
    ∃ (δ : B.homology n ⟶ finiteCompactCohomology res (n+1))
      (ι : finiteCompactCohomology res (n+1) ⟶ A.homology (n+1)),
      Function.Exact (HomologicalComplex.homologyMap res n).hom δ.hom ∧
      Function.Exact δ.hom ι.hom ∧
      Function.Exact ι.hom (HomologicalComplex.homologyMap res (n+1)).hom := sorry

/-- A commutative restriction square induces the actual map of fibres. -/
def finiteCompact_map (res : A ⟶ B) (res' : A' ⟶ B') (a : A ⟶ A') (b : B ⟶ B')
    (comm : res ≫ b = a ≫ res') : finiteCompactCochains res ⟶ finiteCompactCochains res' :=
  (CochainComplex.mappingCone.map res res' a b comm)⟦(-1 : ℤ)⟧'

namespace SuggestedTest

-- TEST finite_support_identity
example (A : CochainComplex (ModuleCat.{u} R) ℤ) (n : ℤ) :
    IsZero (finiteCompactCohomology (𝟙 A) n) := sorry

-- TEST finite_support_no_local
example (A B : CochainComplex (ModuleCat.{u} R) ℤ) (hB : IsZero B) :
    Nonempty (finiteCompactCochains (0 : A ⟶ B) ≅ A) := sorry

-- TEST finite_support_h0
example (res : A ⟶ B) (h : ∀ n : ℤ, n < 0 → IsZero (B.homology n)) :
    Nonempty (finiteCompactCohomology res 0 ≅
      ModuleCat.of R (LinearMap.ker (HomologicalComplex.homologyMap res 0).hom)) := sorry

end SuggestedTest
end TauCeti.ArithmeticDuality

namespace TauCeti.GaloisCohomology

variable {R : Type u} [CommRing R]
variable {A B : CochainComplex (ModuleCat.{u} R) ℤ}

/-- D7 uses the finite construction with compact/ind-admissible cochain input. -/
abbrev compactCochains (res : A ⟶ B) := TauCeti.ArithmeticDuality.finiteCompactCochains res
abbrev compactCohomology (res : A ⟶ B) (n : ℤ) :=
  TauCeti.ArithmeticDuality.finiteCompactCohomology res n

abbrev compactTriangle (res : A ⟶ B) := TauCeti.ArithmeticDuality.finiteCompactTriangle res

/-- Homotopic choices of embedding give homotopy equivalent fibres. -/
def compactCochains_embedding (res res' : A ⟶ B) (h : Homotopy res res') :
    HomotopyEquiv (compactCochains res) (compactCochains res') := sorry

/-- Degreewise coordinates fix the convention d(a,b)=(da,-res(a)-db). -/
def compactCochainsXIso (res : A ⟶ B) (n : ℤ) :
    (compactCochains res).X n ≅ ModuleCat.of R (A.X n × B.X (n-1)) := sorry

theorem compactCochains_diff (res : A ⟶ B) (n : ℤ) (a : A.X n) (b : B.X (n-1)) :
    (compactCochainsXIso res (n+1)).hom.hom
      (((compactCochains res).d n (n+1)).hom
        ((compactCochainsXIso res n).inv.hom (a,b))) =
      ((A.d n (n+1)).hom a,
        (eqToHom (congrArg B.X (by omega : n = n+1-1))).hom
          (-((res.f n).hom a) - (B.d (n-1) n).hom b)) := sorry

/-- Under (P), the supplied global and local finiteness bounds give finite-type fibre cohomology. -/
theorem compactCochains_finite [IsNoetherianRing R] (res : A ⟶ B)
    (hA : ∀ n, Module.Finite R (A.homology n))
    (hB : ∀ n, Module.Finite R (B.homology n)) (n : ℤ) :
    Module.Finite R (compactCohomology res n) := sorry

namespace SuggestedTest

-- TEST cone_square_zero
example (res : A ⟶ B) (n : ℤ) :
    (compactCochains res).d n (n+1) ≫ (compactCochains res).d (n+1) (n+2) = 0 := sorry

-- TEST compact_no_local
example (res : A ⟶ B) (hB : IsZero B) (n : ℤ) :
    Nonempty (compactCohomology res n ≅ A.homology n) := sorry

-- TEST h0_vanishes
example (res : A ⟶ B) (hneg : ∀ n : ℤ, n < 0 → IsZero (B.homology n))
    (hinj : Function.Injective (HomologicalComplex.homologyMap res 0).hom) :
    IsZero (compactCohomology res 0) := sorry

end SuggestedTest
end TauCeti.GaloisCohomology

namespace TauCeti.GaloisCohomology

variable {R : Type u} [CommRing R]

def degreeCast (C : CochainComplex (ModuleCat.{u} R) ℤ) (i j : ℤ) (h : i = j) :
    C.X i →ₗ[R] C.X j := (eqToHom (congrArg C.X h)).hom

/-- The graded cochain Leibniz identity, with its actual degree transports. -/
def CupLeibniz (A B C : CochainComplex (ModuleCat.{u} R) ℤ)
    (cup : ∀ i j : ℤ, A.X i →ₗ[R] B.X j →ₗ[R] C.X (i+j)) : Prop :=
  ∀ (i j : ℤ) (a : A.X i) (b : B.X j),
    (C.d (i+j) (i+j+1)).hom (cup i j a b) =
      degreeCast C ((i+1)+j) (i+j+1) (by omega)
        (cup (i+1) j ((A.d i (i+1)).hom a) b) +
      i.negOnePow • degreeCast C (i+(j+1)) (i+j+1) (by omega)
        (cup i (j+1) a ((B.d j (j+1)).hom b))

variable (A B C LA LB LC : CochainComplex (ModuleCat.{u} R) ℤ)
  (resA : A ⟶ LA) (resB : B ⟶ LB) (resC : C ⟶ LC)
  (cup : ∀ i j : ℤ, A.X i →ₗ[R] B.X j →ₗ[R] C.X (i+j))
  (cupLocal : ∀ i j : ℤ, LA.X i →ₗ[R] LB.X j →ₗ[R] LC.X (i+j))

/-- Left compact product: (a,aS) cup b = (a cup b, aS cup res b). -/
def compactCupLeft
    (A B C LA LB LC : CochainComplex (ModuleCat.{u} R) ℤ)
    (resA : A ⟶ LA) (resB : B ⟶ LB) (resC : C ⟶ LC)
    (cup : ∀ i j : ℤ, A.X i →ₗ[R] B.X j →ₗ[R] C.X (i+j))
    (cupLocal : ∀ i j : ℤ, LA.X i →ₗ[R] LB.X j →ₗ[R] LC.X (i+j)) (i j : ℤ) :
    (compactCochains resA).X i →ₗ[R] B.X j →ₗ[R] (compactCochains resC).X (i+j) := sorry

/-- Right compact product: a cup (b,bS) = (a cup b, (-1)^i res a cup bS). -/
def compactCupRight
    (A B C LA LB LC : CochainComplex (ModuleCat.{u} R) ℤ)
    (resA : A ⟶ LA) (resB : B ⟶ LB) (resC : C ⟶ LC)
    (cup : ∀ i j : ℤ, A.X i →ₗ[R] B.X j →ₗ[R] C.X (i+j))
    (cupLocal : ∀ i j : ℤ, LA.X i →ₗ[R] LB.X j →ₗ[R] LC.X (i+j)) (i j : ℤ) :
    A.X i →ₗ[R] (compactCochains resB).X j →ₗ[R] (compactCochains resC).X (i+j) := sorry

theorem compactCupLeft_coordinates (i j : ℤ) (a : (compactCochains resA).X i) (b : B.X j) :
    ((compactCochainsXIso resC (i+j)).hom.hom
      (compactCupLeft A B C LA LB LC resA resB resC cup cupLocal i j a b)).1 =
      cup i j ((compactCochainsXIso resA i).hom.hom a).1 b ∧
    ((compactCochainsXIso resC (i+j)).hom.hom
      (compactCupLeft A B C LA LB LC resA resB resC cup cupLocal i j a b)).2 =
      degreeCast LC ((i-1)+j) (i+j-1) (by omega)
        (cupLocal (i-1) j ((compactCochainsXIso resA i).hom.hom a).2
          ((resB.f j).hom b)) := sorry

theorem compactCupRight_coordinates (i j : ℤ) (a : A.X i) (b : (compactCochains resB).X j) :
    ((compactCochainsXIso resC (i+j)).hom.hom
      (compactCupRight A B C LA LB LC resA resB resC cup cupLocal i j a b)).1 = cup i j a
        ((compactCochainsXIso resB j).hom.hom b).1 ∧
    ((compactCochainsXIso resC (i+j)).hom.hom
      (compactCupRight A B C LA LB LC resA resB resC cup cupLocal i j a b)).2 =
      i.negOnePow • degreeCast LC (i+(j-1)) (i+j-1) (by omega)
        (cupLocal i (j-1) ((resA.f i).hom a) ((compactCochainsXIso resB j).hom.hom b).2) := sorry

theorem compactCupLeft_leibniz (hcup : CupLeibniz A B C cup)
    (hlocal : CupLeibniz LA LB LC cupLocal)
    (hcomm : ∀ (i j : ℤ) (a : A.X i) (b : B.X j),
      (resC.f (i+j)).hom (cup i j a b) =
        cupLocal i j ((resA.f i).hom a) ((resB.f j).hom b)) :
    CupLeibniz (compactCochains resA) B (compactCochains resC)
      (compactCupLeft A B C LA LB LC resA resB resC cup cupLocal) := sorry

theorem compactCupRight_leibniz (hcup : CupLeibniz A B C cup)
    (hlocal : CupLeibniz LA LB LC cupLocal)
    (hcomm : ∀ (i j : ℤ) (a : A.X i) (b : B.X j),
      (resC.f (i+j)).hom (cup i j a b) =
        cupLocal i j ((resA.f i).hom a) ((resB.f j).hom b)) :
    CupLeibniz A (compactCochains resB) (compactCochains resC)
      (compactCupRight A B C LA LB LC resA resB resC cup cupLocal) := sorry

theorem compactCup_forget (i j : ℤ) (a : (compactCochains resA).X i) (b : B.X j) :
    ((compactCochainsXIso resC (i+j)).hom.hom
      (compactCupLeft A B C LA LB LC resA resB resC cup cupLocal i j a b)).1 =
      cup i j ((compactCochainsXIso resA i).hom.hom a).1 b := sorry

namespace SuggestedTest
-- TEST degree_one_sign
example (a : A.X 1) (b : (compactCochains resB).X 1) :
    ((compactCochainsXIso resC 2).hom.hom
      (compactCupRight A B C LA LB LC resA resB resC cup cupLocal 1 1 a b)).2 =
      -cupLocal 1 0 ((resA.f 1).hom a) ((compactCochainsXIso resB 1).hom.hom b).2 := sorry

-- TEST empty_S_f
example (hLC : IsZero LC) (i j : ℤ) (a : (compactCochains resA).X i) (b : B.X j) :
    ((compactCochainsXIso resC (i+j)).hom.hom
      (compactCupLeft A B C LA LB LC resA resB resC cup cupLocal i j a b)).2 = 0 := sorry

-- TEST no_sign
example (a : A.X 1) (b : (compactCochains resB).X 1)
    (h : cupLocal 1 0 ((resA.f 1).hom a) ((compactCochainsXIso resB 1).hom.hom b).2 ≠
      -cupLocal 1 0 ((resA.f 1).hom a) ((compactCochainsXIso resB 1).hom.hom b).2) :
    ((compactCochainsXIso resC 2).hom.hom
      (compactCupRight A B C LA LB LC resA resB resC cup cupLocal 1 1 a b)).2 ≠
      cupLocal 1 0 ((resA.f 1).hom a) ((compactCochainsXIso resB 1).hom.hom b).2 := sorry
end SuggestedTest
end TauCeti.GaloisCohomology

namespace TauCeti.RestrictedRamification

open IsDedekindDomain
open scoped NumberField

variable (K Ω : Type*) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]

/-- Only finite places occur in the predicate: ramification at infinity is allowed. -/
def IsUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K)))
    (L : IntermediateField K Ω) (hL : FiniteDimensional K L) : Prop :=
  letI := hL
  letI := NumberField.of_module_finite K L
  ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
    ∀ (Q : Ideal (𝓞 L)), ∀ (_ : Q.IsPrime), Q.LiesOver v.asIdeal →
      Algebra.IsUnramifiedAt (𝓞 K) Q

/-- R02.3/restricted-ramification-group: compositum in the supplied separable closure. -/
def maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K))) : IntermediateField K Ω :=
  ⨆ (L : IntermediateField K Ω) (hL : FiniteDimensional K L)
    (_ : IsUnramifiedOutside K Ω S L hL), L

abbrev galoisGroupS (S : Set (HeightOneSpectrum (𝓞 K))) :=
  maxUnramifiedOutside K Ω S ≃ₐ[K] maxUnramifiedOutside K Ω S

/-- Finite subextensions have exactly the prescribed ramification. -/
theorem mem_maxUnramifiedOutside_iff (S : Set (HeightOneSpectrum (𝓞 K)))
    (L : IntermediateField K Ω) (hL : FiniteDimensional K L) :
    L ≤ maxUnramifiedOutside K Ω S ↔ IsUnramifiedOutside K Ω S L hL := sorry

theorem isGalois_maxUnramifiedOutside [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) : IsGalois K (maxUnramifiedOutside K Ω S) := sorry

/-- The restriction map is the existing normal-extension restriction after its normality proof. -/
def toGaloisGroupS [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) : (Ω ≃ₐ[K] Ω) →* galoisGroupS K Ω S := sorry

theorem toGaloisGroupS_surjective [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) :
    Function.Surjective (toGaloisGroupS K Ω S) := sorry

theorem maxUnramifiedOutside_mono (S T : Set (HeightOneSpectrum (𝓞 K))) (h : S ⊆ T) :
    maxUnramifiedOutside K Ω S ≤ maxUnramifiedOutside K Ω T := sorry

/-- In a finite allowed base field, the same extension is maximal unramified away from lifted S.
The place lift is the actual contraction of prime ideals. -/
theorem maxUnramifiedOutside_of_le (S : Set (HeightOneSpectrum (𝓞 K)))
    (L : IntermediateField K Ω) [FiniteDimensional K L]
    (hL : L ≤ maxUnramifiedOutside K Ω S)
    (SL : Set (HeightOneSpectrum (𝓞 L)))
    (hSL : ∀ w : HeightOneSpectrum (𝓞 L), w ∈ SL ↔
      ∃ v ∈ S, w.asIdeal.LiesOver v.asIdeal) :
    (maxUnramifiedOutside L Ω SL).restrictScalars K = maxUnramifiedOutside K Ω S := sorry

/-- Every finite p-power cyclotomic layer is allowed when S contains primes above p. -/
theorem cyclotomic_le_maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K)))
    (p : ℕ) [Fact p.Prime] (hS : ∀ v : HeightOneSpectrum (𝓞 K),
      (p : 𝓞 K) ∈ v.asIdeal → v ∈ S) (n : ℕ) (x : Ω)
    (hx : x ^ (p ^ n) = 1) : x ∈ maxUnramifiedOutside K Ω S := sorry

namespace SuggestedTest

-- TEST restricted_rat_infty
example (Ω : Type*) [Field Ω] [Algebra ℚ Ω] :
    maxUnramifiedOutside ℚ Ω ∅ = ⊥ := sorry

-- TEST restricted_rat_two
example (Ω : Type*) [Field Ω] [Algebra ℚ Ω] (x : Ω) (hx : x*x = -1) :
    x ∈ maxUnramifiedOutside ℚ Ω {v | (2 : 𝓞 ℚ) ∈ v.asIdeal} := sorry

-- TEST restricted_rat_two_nonexample
example (Ω : Type*) [Field Ω] [Algebra ℚ Ω] (x : Ω) (hx : x*x = 3) :
    x ∉ maxUnramifiedOutside ℚ Ω {v | (2 : 𝓞 ℚ) ∈ v.asIdeal} := sorry

-- TEST restricted_all_places
example [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω] :
    maxUnramifiedOutside K Ω Set.univ = ⊤ := sorry

end SuggestedTest
end TauCeti.RestrictedRamification

namespace TauCeti.ArithmeticDuality

open IsDedekindDomain
open scoped NumberField

variable (K Ω : Type*) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]

/-- R02.3/exponent-two-ramification-field: no condition at infinite places. -/
def exponentTwoField (S : Set (HeightOneSpectrum (𝓞 K))) : IntermediateField K Ω :=
  ⨆ (L : IntermediateField K Ω) (hL : FiniteDimensional K L)
    (_ : IsGalois K L) (_ : TauCeti.RestrictedRamification.IsUnramifiedOutside K Ω S L hL)
    (_ : ∀ σ : L ≃ₐ[K] L, σ*σ = 1), L

theorem exponentTwoField_mono (S T : Set (HeightOneSpectrum (𝓞 K))) (h : S ⊆ T) :
    exponentTwoField K Ω S ≤ exponentTwoField K Ω T := sorry

theorem exponentTwoField_contains (S : Set (HeightOneSpectrum (𝓞 K)))
    (L : IntermediateField K Ω) [FiniteDimensional K L] (hdeg : Module.finrank K L = 2)
    (hur : TauCeti.RestrictedRamification.IsUnramifiedOutside K Ω S L inferInstance) :
    L ≤ exponentTwoField K Ω S := sorry

theorem exponentTwoField_finite (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite) :
    FiniteDimensional K (exponentTwoField K Ω S) := sorry

namespace SuggestedTest

-- TEST exponent_two_empty_Q
example (Ω : Type*) [Field Ω] [Algebra ℚ Ω] : exponentTwoField ℚ Ω ∅ = ⊥ := sorry

-- TEST exponent_two_imaginary
example (Ω : Type*) [Field Ω] [Algebra ℚ Ω] (x : Ω) (hx : x*x = -1) :
    x ∈ exponentTwoField ℚ Ω {v | (2 : 𝓞 ℚ) ∈ v.asIdeal} := sorry

-- TEST exponent_two_all_quadratic
example (S : Set (HeightOneSpectrum (𝓞 K))) (L : IntermediateField K Ω)
    [FiniteDimensional K L] (hdeg : Module.finrank K L = 2)
    (hur : TauCeti.RestrictedRamification.IsUnramifiedOutside K Ω S L inferInstance) :
    L ≤ exponentTwoField K Ω S := sorry

end SuggestedTest

section Sha

variable {ι A : Type*} [AddCommGroup A]
variable {H : ι → Type*} [∀ v, AddCommGroup (H v)]

/-- R02.3/absolute-and-relative-sha: full localization kernels on supplied cohomology groups. -/
def absoluteSha (loc : ∀ v, A →+ H v) : AddSubgroup A := ⨅ v, (loc v).ker

/-- Relative cohomology uses the supplied finite-Galois quotient restrictions, not G_{F,S}. -/
def relativeSha (loc : ∀ v, A →+ H v) : AddSubgroup A := ⨅ v, (loc v).ker

theorem mem_absoluteSha (loc : ∀ v, A →+ H v) (a : A) :
    a ∈ absoluteSha loc ↔ ∀ v, loc v a = 0 := sorry

/-- This single compatibility lemma applies to restriction and corestriction separately. -/
theorem sha_res_cor {B : Type*} [AddCommGroup B] {J : ι → Type*}
    [∀ v, AddCommGroup (J v)] (loc : ∀ v, A →+ H v) (loc' : ∀ v, B →+ J v)
    (f : A →+ B) (fv : ∀ v, H v →+ J v)
    (h : ∀ v, (loc' v).comp f = (fv v).comp (loc v)) :
    (absoluteSha loc).map f ≤ absoluteSha loc' := sorry

namespace SuggestedTest

-- TEST absolute_sha_zero
example [Subsingleton A] (loc : ∀ v, A →+ H v) : Subsingleton (absoluteSha loc) := sorry

-- TEST absolute_sha_nonzero_local
example (loc : ∀ v, A →+ H v) (a : A) (v : ι) (h : loc v a ≠ 0) :
    a ∉ absoluteSha loc := sorry

-- TEST relative_sha_identity
example [Subsingleton A] (loc : ∀ v, A →+ H v) : Subsingleton (relativeSha loc) := sorry

end SuggestedTest
end Sha
end TauCeti.ArithmeticDuality

namespace TauCeti.RestrictedRamification

variable {Gv : Type} [Group Gv] [TopologicalSpace Gv] [IsTopologicalGroup Gv]

abbrev underlyingRep (X : TopRep.{0} ℤ Gv) : Rep ℤ Gv := by
  letI : Module ℤ X.V := X.hV2
  exact Rep.of X.ρ.toRepresentation

/-- Ordinary-to-Tate comparison is the norm quotient in degree zero. -/
def ordinaryToTate [Fintype Gv] (X : TopRep.{0} ℤ Gv) [DiscreteTopology X.V] (n : ℕ) :
    ModuleCat.of ℤ (continuousCohomology n X) ⟶
      tateCohomology (underlyingRep X) (n : ℤ) := sorry

/-- Finite places use ordinary cohomology; archimedean places use the complete Tate carrier. -/
def localCohomology (arch : Bool) (X : TopRep.{0} ℤ Gv) [DiscreteTopology X.V]
    (hfinite : arch = true → Finite Gv) (n : ℕ) : ModuleCat ℤ :=
  if h : arch = true then
    letI := hfinite h
    letI := Fintype.ofFinite Gv
    tateCohomology (underlyingRep X) (n : ℤ)
  else ModuleCat.of ℤ (continuousCohomology n X)

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (X : TopRep.{0} ℤ G) [DiscreteTopology X.V]

def locMap (φ : Gv →ₜ* G) (arch : Bool) (hfinite : arch = true → Finite Gv) (n : ℕ) :
    ModuleCat.of ℤ (continuousCohomology n X) ⟶
      localCohomology arch (TopRep.res φ.toMonoidHom X) hfinite n := sorry

theorem locMap_eq_restriction (φ : Gv →ₜ* G) (hfinite : false = true → Finite Gv) (n : ℕ) :
    (locMap X φ false hfinite n).hom =
      (ContinuousCohomology.map φ (𝟙 (TopRep.res φ.toMonoidHom X)) n).hom.toLinearMap := sorry

variable (I : Subgroup Gv) [I.Normal]
  (Y : TopRep.{0} ℤ (Gv ⧸ I)) [DiscreteTopology Y.V]

def unramifiedSubgroup (n : ℕ) : Submodule ℤ
    (continuousCohomology n (TopRep.res (QuotientGroup.mk' I) Y)) :=
  LinearMap.range (ContinuousCohomology.map
    (⟨QuotientGroup.mk' I, continuous_quot_mk⟩ : Gv →ₜ* Gv ⧸ I)
    (𝟙 (TopRep.res (QuotientGroup.mk' I) Y)) n).hom.toLinearMap

def unramifiedH1Equiv (I : Subgroup Gv) [I.Normal]
    (Y : TopRep.{0} ℤ (Gv ⧸ I)) [DiscreteTopology Y.V] :
    (continuousCohomology 1 Y) ≃ₗ[ℤ] unramifiedSubgroup I Y 1 := sorry

theorem unramifiedSubgroup_two_eq_bot (I : Subgroup Gv) [I.Normal]
    (Y : TopRep.{0} ℤ (Gv ⧸ I)) [DiscreteTopology Y.V]
    (hcd : Subsingleton (continuousCohomology 2 Y)) : unramifiedSubgroup I Y 2 = ⊥ := sorry

namespace SuggestedTest
-- TEST complex_zero
example (M : Rep ℤ Unit) (n : ℤ) : Subsingleton (tateCohomology M n) := sorry

-- TEST real_modified_H0
example : Subsingleton (tateCohomology
    (Rep.trivial ℤ (Multiplicative (ZMod 2)) (ZMod 3)) 0) := sorry

-- TEST real_two
example (n : ℤ) : Nonempty (tateCohomology
    (Rep.trivial ℤ (Multiplicative (ZMod 2)) (ZMod 2)) n ≃ₗ[ℤ] ZMod 2) := sorry
end SuggestedTest
end TauCeti.RestrictedRamification

namespace TauCeti.RestrictedRamification

variable {G Gv : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [Group Gv] [TopologicalSpace Gv] [IsTopologicalGroup Gv]
  (X : TopRep.{0} ℤ G) [DiscreteTopology X.V]

def conjugationRepIso (φ φ' : Gv →ₜ* G) (g : G)
    (hφ : ∀ x, φ' x = g * φ x * g⁻¹) :
    TopRep.res φ.toMonoidHom X ≅ TopRep.res φ'.toMonoidHom X := sorry

theorem conjugationRepIso_apply (φ φ' : Gv →ₜ* G) (g : G)
    (hφ : ∀ x, φ' x = g * φ x * g⁻¹) (x : X.V) :
    (conjugationRepIso X φ φ' g hφ).hom.hom x = X.ρ g x := sorry

def localCohomologyMap (arch : Bool) (hfinite : arch = true → Finite Gv)
    (A B : TopRep.{0} ℤ Gv) [DiscreteTopology A.V] [DiscreteTopology B.V]
    (f : A ⟶ B) (n : ℕ) : localCohomology arch A hfinite n ⟶
      localCohomology arch B hfinite n := sorry

theorem locMap_indep (φ φ' : Gv →ₜ* G) (g : G)
    (hφ : ∀ x, φ' x = g * φ x * g⁻¹)
    (arch : Bool) (hfinite : arch = true → Finite Gv) (n : ℕ) :
    locMap X φ' arch hfinite n = locMap X φ arch hfinite n ≫
      localCohomologyMap arch hfinite _ _ (conjugationRepIso X φ φ' g hφ).hom n := sorry

/-- The localization square is read on its actual short exact cochain diagrams.
Mathlib's connecting map is reused, including its degree and variance. -/
theorem locMap_delta {R : Type u} [CommRing R]
    {S T : ShortComplex (CochainComplex (ModuleCat.{u} R) ℤ)}
    (hS : S.ShortExact) (hT : T.ShortExact) (f : S ⟶ T) (n : ℤ) :
    hS.δ n (n+1) (by simp) ≫ HomologicalComplex.homologyMap f.τ₁ (n+1) =
      HomologicalComplex.homologyMap f.τ₃ n ≫ hT.δ n (n+1) (by simp) := sorry
end TauCeti.RestrictedRamification

namespace TauCeti.ArithmeticDuality

open groupCohomology
open scoped MonoidalCategory TensorProduct
variable {Γ Θ : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [Group Θ] [TopologicalSpace Θ] [IsTopologicalGroup Θ] [Fintype Θ]
  (π : Γ →ₜ* Θ) (X : TopRep.{0} ℤ Γ) (Y : TopRep.{0} ℤ Θ)
  [Fact (Function.Surjective π)] [DiscreteTopology X.V] [Fact (TauCeti.IsSmoothDiscrete ℤ X)] [DiscreteTopology Y.V] [Fact (TauCeti.IsSmoothDiscrete ℤ Y)]

abbrev underlyingX := TauCeti.RestrictedRamification.underlyingRep X
abbrev underlyingY := TauCeti.RestrictedRamification.underlyingRep Y
abbrev productRep := underlyingX X ⊗ Rep.res π.toMonoidHom (underlyingY Y)

/-- Canonical transport from the tensor module to the existing tensor representation. -/
def productTensorIso : (underlyingX X).V ⊗[ℤ]
    (Rep.res π.toMonoidHom (underlyingY Y)).V ≃ₗ[ℤ] (productRep π X Y).V := sorry

/-- Continuous inhomogeneous cochains whose last j variables descend to Θ. -/
def quotientFactoringCochains (i j : ℕ) :
    Submodule ℤ ((inhomogeneousCochains (underlyingX X)).X i) where
  carrier := {f | Continuous f ∧ ∀ a b : Fin i → Γ,
    (∀ k : Fin i, k.val < i-j → a k = b k) →
    (∀ k : Fin i, i-j ≤ k.val → π (a k) = π (b k)) → f a = f b}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def factoringDifferential (i j : ℕ) (hij : j < i) :
    quotientFactoringCochains π X i j →ₗ[ℤ] quotientFactoringCochains π X (i+1) j := sorry

def forgetLastQuotientVariable (i j : ℕ) :
    quotientFactoringCochains π X i j →ₗ[ℤ] quotientFactoringCochains π X i (j-1) := sorry

/-- The finite contraction on the actual ordinary and complete Tate complexes. -/
def unbalancedProduct (π : Γ →ₜ* Θ) (X : TopRep.{0} ℤ Γ) (Y : TopRep.{0} ℤ Θ)
    [Fact (Function.Surjective π)] [DiscreteTopology X.V] [Fact (TauCeti.IsSmoothDiscrete ℤ X)] [DiscreteTopology Y.V] [Fact (TauCeti.IsSmoothDiscrete ℤ Y)] (i j : ℕ) (hj : j = 0 ∨ j < i) :
    quotientFactoringCochains π X i j →ₗ[ℤ] (tateComplex (underlyingY Y)).X (-(j : ℤ)) →ₗ[ℤ]
      (inhomogeneousCochains (productRep π X Y)).X (i-j) := sorry

def natDegreeCast (C : CochainComplex (ModuleCat ℤ) ℕ) (i j : ℕ) (h : i = j) :
    C.X i →ₗ[ℤ] C.X j := (eqToHom (congrArg C.X h)).hom

theorem unbalancedProduct_leibniz (i j : ℕ) (hj : 0 < j) (hij : j < i)
    (f : quotientFactoringCochains π X i j) (b : (tateComplex (underlyingY Y)).X (-(j : ℤ))) :
    ((inhomogeneousCochains (productRep π X Y)).d (i-j) (i-j+1)).hom
      (unbalancedProduct π X Y i j (by omega) f b) =
    natDegreeCast (inhomogeneousCochains (productRep π X Y)) ((i+1)-j) (i-j+1) (by omega)
      (unbalancedProduct π X Y (i+1) j (by omega) (factoringDifferential π X i j hij f) b) +
    (-1 : ℤ)^i • natDegreeCast (inhomogeneousCochains (productRep π X Y))
      (i-(j-1)) (i-j+1) (by omega)
      (unbalancedProduct π X Y i (j-1) (by omega) (forgetLastQuotientVariable π X i j f)
        (((tateComplex (underlyingY Y)).d (-(j : ℤ)) (-((j-1 : ℕ) : ℤ))).hom b)) := sorry

theorem unbalancedProduct_zeroDegree (i : ℕ) (f : quotientFactoringCochains π X i 0)
    (b : (tateComplex (underlyingY Y)).X 0) (g : Fin i → Γ) :
    unbalancedProduct π X Y i 0 (by omega) f b g =
      productTensorIso π X Y (f.val g ⊗ₜ[ℤ] ((Rep.res π.toMonoidHom (underlyingY Y)).ρ ((List.ofFn g).prod)
        ((cochainsIso₀ (underlyingY Y)).hom.hom b))) := sorry

/-- The negative-one boundary is the source's finite contraction, not just a signed operation. -/
theorem unbalancedProduct_one (n : ℕ) (hn : 0 < n)
    (s : Θ → Γ) (hs : ∀ a, π (s a) = a)
    (f : quotientFactoringCochains π X (n+1) 1)
    (b : (tateComplex (underlyingY Y)).X (-1)) (g : Fin n → Γ) :
    natDegreeCast (inhomogeneousCochains (productRep π X Y)) ((n+1)-1) n (by omega)
      (unbalancedProduct π X Y (n+1) 1 (by omega) f b) g =
      ∑ a : Θ, productTensorIso π X Y
        (f.val (Fin.snoc g (s a)) ⊗ₜ[ℤ]
          ((underlyingY Y).ρ (π ((List.ofFn g).prod) * a)
            ((groupHomology.chainsIso₀ (underlyingY Y)).hom.hom b))) := sorry

namespace SuggestedTest
-- TEST unbalanced_zero
example (i j : ℕ) (hj : j = 0 ∨ j < i) (b : (tateComplex (underlyingY Y)).X (-(j : ℤ))) :
    unbalancedProduct π X Y i j hj 0 b = 0 := sorry

-- TEST unbalanced_ordinary
example (i : ℕ) (f : quotientFactoringCochains π X i 0)
    (b : (tateComplex (underlyingY Y)).X 0) (g : Fin i → Γ) :
    unbalancedProduct π X Y i 0 (by omega) f b g =
      productTensorIso π X Y (f.val g ⊗ₜ[ℤ] ((Rep.res π.toMonoidHom (underlyingY Y)).ρ ((List.ofFn g).prod)
        ((cochainsIso₀ (underlyingY Y)).hom.hom b))) := sorry

-- TEST unbalanced_odd_sign
example (i j : ℕ) (hi : Odd i) (hj : 0 < j) (hij : j < i)
    (f : quotientFactoringCochains π X i j) (b : (tateComplex (underlyingY Y)).X (-(j : ℤ))) :
    ((inhomogeneousCochains (productRep π X Y)).d (i-j) (i-j+1)).hom
      (unbalancedProduct π X Y i j (by omega) f b) =
    natDegreeCast (inhomogeneousCochains (productRep π X Y)) ((i+1)-j) (i-j+1) (by omega)
      (unbalancedProduct π X Y (i+1) j (by omega) (factoringDifferential π X i j hij f) b) -
    natDegreeCast (inhomogeneousCochains (productRep π X Y)) (i-(j-1)) (i-j+1) (by omega)
      (unbalancedProduct π X Y i (j-1) (by omega) (forgetLastQuotientVariable π X i j f)
        (((tateComplex (underlyingY Y)).d (-(j : ℤ)) (-((j-1 : ℕ) : ℤ))).hom b)) := sorry
end SuggestedTest
end TauCeti.ArithmeticDuality

namespace TauCeti.RestrictedRamification

open IsDedekindDomain NumberField RestrictedProduct
open scoped NumberField
variable (K : Type*) [Field K] [NumberField K]

/-- The existing finite and infinite completions, combined with the upstream place index. -/
abbrev localCompletion : TauCeti.GlobalNumberFields.Place K → Type _
  | .inl v => v.adicCompletion K
  | .inr w => w.Completion

instance localCompletionField (v : TauCeti.GlobalNumberFields.Place K) : Field (localCompletion K v) :=
  by cases v <;> dsimp [localCompletion] <;> infer_instance
instance localCompletionTopology (v : TauCeti.GlobalNumberFields.Place K) :
    TopologicalSpace (localCompletion K v) := by cases v <;> dsimp [localCompletion] <;> infer_instance
instance localCompletionNormedField (v : TauCeti.GlobalNumberFields.Place K) :
    NormedField (localCompletion K v) := by cases v <;> dsimp [localCompletion] <;> infer_instance

/-- At finite places these are the units of the integer ring; at infinity use the whole group. -/
def localUnitSubgroup (v : TauCeti.GlobalNumberFields.Place K) : Subgroup (localCompletion K v)ˣ :=
  match v with
  | .inl _ =>
    { carrier := {x | ‖(x.val : localCompletion K (.inl _))‖ = 1}
      one_mem' := sorry
      mul_mem' := sorry
      inv_mem' := sorry }
  | .inr _ => ⊤

/-- R02.3/s-idele-class-modules: restricted product only over places in S. -/
abbrev sIdeles (S : Set (TauCeti.GlobalNumberFields.Place K)) :=
  Πʳ (v : S), [(localCompletion K v.val)ˣ, localUnitSubgroup K v.val]_[Filter.cofinite]

def sUnits (S : Set (TauCeti.GlobalNumberFields.Place K)) : Subgroup Kˣ where
  carrier := {x | ∀ v : HeightOneSpectrum (𝓞 K), Sum.inl v ∉ S →
    NumberField.HeightOneSpectrum.adicAbv K v (x : K) = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

def sUnitsToIdeles (S : Set (TauCeti.GlobalNumberFields.Place K)) :
    sUnits K S →* sIdeles K S := sorry

abbrev sIdeleClasses (S : Set (TauCeti.GlobalNumberFields.Place K)) :=
  sIdeles K S ⧸ (sUnitsToIdeles K S).range

/-- This subring is specified by integrality outside S, rather than by a placeholder condition. -/
def sIntegers (S : Set (TauCeti.GlobalNumberFields.Place K)) : Subring K where
  carrier := {x | ∀ v : HeightOneSpectrum (𝓞 K), Sum.inl v ∉ S →
    NumberField.HeightOneSpectrum.adicAbv K v x ≤ 1}
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  mul_mem' := sorry
  neg_mem' := sorry

theorem sIntegersDedekind (S : Set (TauCeti.GlobalNumberFields.Place K)) :
    IsDedekindDomain (sIntegers K S) := sorry
attribute [local instance] sIntegersDedekind

theorem pic_eq_bot_of_cofinite (S : Set (TauCeti.GlobalNumberFields.Place K))
    (hS : Sᶜ.Finite) : Subsingleton (ClassGroup (sIntegers K S)) := sorry

def sIdeles_all : sIdeles K Set.univ ≃* NumberField.IdeleGroup (𝓞 K) K := sorry

namespace SuggestedTest
-- TEST s_units_rat_infty
example (x : sUnits ℚ (Set.range Sum.inr)) : (x.val : ℚˣ) = 1 ∨ x.val = -1 := sorry

-- TEST s_units_all
example : sUnits K Set.univ = ⊤ := sorry

-- TEST s_classes_all
example : Nonempty (sIdeleClasses K Set.univ ≃* NumberField.IdeleClassGroup (𝓞 K) K) := sorry
end SuggestedTest
end TauCeti.RestrictedRamification

namespace TauCeti.RestrictedRamification

open IsDedekindDomain NumberField
variable (K : Type u) [Field K] [NumberField K]
attribute [local instance] sIntegersDedekind

def outsideUnits (S : Set (TauCeti.GlobalNumberFields.Place K)) :
    Subgroup (NumberField.IdeleGroup (𝓞 K) K) where
  carrier := {x | ∀ v : TauCeti.GlobalNumberFields.Place K,
    (v ∈ S → (sIdeles_all K).symm x ⟨v, Set.mem_univ v⟩ = 1) ∧
    (v ∉ S → (sIdeles_all K).symm x ⟨v, Set.mem_univ v⟩ ∈ localUnitSubgroup K v)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

abbrev outsideClasses (S : Set (TauCeti.GlobalNumberFields.Place K)) :=
  (outsideUnits K S).map (QuotientGroup.mk' (NumberField.IdeleGroup.principalSubgroup (𝓞 K) K))

abbrev sGlobalClasses (S : Set (TauCeti.GlobalNumberFields.Place K)) :=
  NumberField.IdeleClassGroup (𝓞 K) K ⧸ outsideClasses K S

def sClassInclusion (S : Set (TauCeti.GlobalNumberFields.Place K)) :
    sIdeleClasses K S →* sGlobalClasses K S := sorry

def sClassIdealMap (S : Set (TauCeti.GlobalNumberFields.Place K)) :
    sGlobalClasses K S →* ClassGroup (sIntegers K S) := sorry

theorem sIdeleClasses_exact (S : Set (TauCeti.GlobalNumberFields.Place K))
    (hinfty : Set.range Sum.inr ⊆ S) :
    Function.Injective (sClassInclusion K S) ∧
    (sClassInclusion K S).range = (sClassIdealMap K S).ker ∧
    Function.Surjective (sClassIdealMap K S) := sorry

/-- Direct limits use the existing colimit in additive groups, after the arithmetic transitions
and finite-level automorphism actions have been supplied. No independent limit carrier. -/
def limitModules {I : Type u} [Category I]
    (E J C U : I ⥤ AddCommGrpCat.{u})
    [CategoryTheory.Limits.HasColimit E] [CategoryTheory.Limits.HasColimit J]
    [CategoryTheory.Limits.HasColimit C] [CategoryTheory.Limits.HasColimit U] :
    AddCommGrpCat.{u} × AddCommGrpCat.{u} × AddCommGrpCat.{u} × AddCommGrpCat.{u} :=
    (CategoryTheory.Limits.colimit E, CategoryTheory.Limits.colimit J,
      CategoryTheory.Limits.colimit C, CategoryTheory.Limits.colimit U)
end TauCeti.RestrictedRamification

namespace TauCeti.DoubleComplex

variable {R : Type*} [CommRing R]
abbrev FirstQuadrant := HomologicalComplex₂ (ModuleCat.{u} R) (.up ℕ) (.up ℕ)
variable (A : FirstQuadrant (R := R))

/-- The canonical column spectral sequence of the existing bicomplex. -/
def spectralSequence (A : FirstQuadrant (R := R)) : E₂CohomologicalSpectralSequenceNat (ModuleCat.{u} R) := sorry

def verticalHomology (q : ℕ) : CochainComplex (ModuleCat.{u} R) ℕ :=
  ((HomologicalComplex.homologyFunctor (ModuleCat.{u} R) (.up ℕ) q).mapHomologicalComplex
    (.up ℕ)).obj A

def e2Iso (p q : ℕ) : ((spectralSequence A).page 2).X (p,q) ≅
    (verticalHomology A q).homology p := sorry

@[instance_reducible]
def upNatTensorSigns : ComplexShape.TensorSigns (.up ℕ) := sorry
attribute [local instance] upNatTensorSigns

variable [A.HasTotal (.up ℕ)]

def abutmentFiltration (p n : ℕ) : Submodule R ((A.total (.up ℕ)).homology n) := sorry

theorem abutmentFiltration_antitone (n : ℕ) : Antitone (fun p => abutmentFiltration A p n) := sorry

theorem abutmentFiltration_endpoints (n : ℕ) :
    abutmentFiltration A 0 n = ⊤ ∧ abutmentFiltration A (n+1) n = ⊥ := sorry

/-- Successive quotients of the actual filtration submodules. -/
def eInftyIsoGr (p q : ℕ) : ((spectralSequence A).page (p+q+2)).X (p,q) ≅
    ModuleCat.of R ((abutmentFiltration A p (p+q)) ⧸
      (abutmentFiltration A (p+1) (p+q)).comap
        (abutmentFiltration A p (p+q)).subtype) := sorry

def page_eq_eInfty (p q : ℕ) (r : ℤ) (hr : 2 ≤ r)
    (hstable : (max p (q+1) : ℕ) < r) :
    ((spectralSequence A).page r hr).X (p,q) ≅
      ((spectralSequence A).page (p+q+2)).X (p,q) := sorry

def edgeBottom (n : ℕ) : ((spectralSequence A).page 2).X (n,0) ⟶
    (A.total (.up ℕ)).homology n := sorry

def edgeLeft (n : ℕ) : (A.total (.up ℕ)).homology n ⟶
    ((spectralSequence A).page 2).X (0,n) := sorry

theorem fiveTerm_exact :
    Function.Injective (edgeBottom A 1).hom ∧
    Function.Exact (edgeBottom A 1).hom (edgeLeft A 1).hom ∧
    Function.Exact (edgeLeft A 1).hom (((spectralSequence A).page 2).d (0,1) (2,0)).hom ∧
    Function.Exact (((spectralSequence A).page 2).d (0,1) (2,0)).hom (edgeBottom A 2).hom := sorry

theorem exact_of_rows_vanish (n : ℕ) (hn : 0 < n)
    (hvan : ∀ p q : ℕ, 0 < q → q < n → IsZero (((spectralSequence A).page 2).X (p,q))) :
    Function.Injective (edgeBottom A n).hom ∧
    Function.Exact (edgeBottom A n).hom (edgeLeft A n).hom ∧
    ∃ δ : ((spectralSequence A).page 2).X (0,n) ⟶
      ((spectralSequence A).page 2).X (n+1,0),
      Function.Exact (edgeLeft A n).hom δ.hom ∧
      Function.Exact δ.hom (edgeBottom A (n+1)).hom := sorry

/-- The row-kernel complex; kernels are taken in the existing complex category. -/
def rowKernel : CochainComplex (ModuleCat.{u} R) ℕ := CategoryTheory.Limits.kernel (A.d 0 1)

def totalCohomology_of_exact_rows
    (hrow : ∀ q p : ℕ, 0 < p → IsZero
      ((((HomologicalComplex.eval (ModuleCat.{u} R) (.up ℕ) q).mapHomologicalComplex
        (.up ℕ)).obj A).homology p)) (n : ℕ) :
    (A.total (.up ℕ)).homology n ≅ (rowKernel A).homology n := sorry

variable {A} {B : FirstQuadrant (R := R)}
def spectralSequence_map (f : A ⟶ B) : spectralSequence A ⟶ spectralSequence B := sorry

namespace SuggestedTest
variable (A : FirstQuadrant (R := R)) [A.HasTotal (.up ℕ)]

-- TEST one_row
example (hrow : ∀ p q : ℕ, 0 < q → IsZero ((A.X p).X q)) (n : ℕ) :
    IsIso (edgeBottom A n) := sorry

-- TEST one_column
example (hcol : ∀ p q : ℕ, 0 < p → IsZero ((A.X p).X q)) (n : ℕ) :
    IsIso (edgeLeft A n) := sorry

-- TEST acyclic_square
example (hshape : ∀ p q : ℕ, (p,q) ≠ (0,0) → (p,q) ≠ (1,0) →
    IsZero ((A.X p).X q)) (hd : IsIso ((A.d 0 1).f 0)) (n : ℕ) :
    IsZero ((A.total (.up ℕ)).homology n) := sorry

-- TEST low_degree
example : IsIso (edgeBottom A 0) := sorry
end SuggestedTest
end TauCeti.DoubleComplex


namespace TauCeti.HochschildSerre

open TauCeti.DoubleComplex
attribute [local instance] TauCeti.DoubleComplex.upNatTensorSigns
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
  (H : Subgroup G) [H.Normal] (hH : IsClosed (H : Set G))
  (X : TopRep.{u} ℤ G) [DiscreteTopology X.V] [Fact (TauCeti.IsSmoothDiscrete ℤ X)]

/-- The quotient action on H-cohomology; its carrier is specified by the following isomorphism. -/
def subgroupCohomologyRep (H : Subgroup G) [H.Normal] (hH : IsClosed (H : Set G))
    (X : TopRep.{u} ℤ G) [DiscreteTopology X.V] [Fact (TauCeti.IsSmoothDiscrete ℤ X)] (q : ℕ) : TopRep.{u} ℤ (G ⧸ H) := sorry

def subgroupCohomologyCarrierIso (q : ℕ) :
    ModuleCat.of ℤ (subgroupCohomologyRep H hH X q).V ≅ ModuleCat.of ℤ
      (continuousCohomology q (TopRep.res H.subtype X)) := sorry

def hsDoubleComplex (H : Subgroup G) [H.Normal] (hH : IsClosed (H : Set G))
    (X : TopRep.{u} ℤ G) [DiscreteTopology X.V] [Fact (TauCeti.IsSmoothDiscrete ℤ X)] : HomologicalComplex₂ (ModuleCat.{u} ℤ) (.up ℕ) (.up ℕ) := sorry

def spectralSequence : E₂CohomologicalSpectralSequenceNat (ModuleCat.{u} ℤ) :=
  DoubleComplex.spectralSequence (hsDoubleComplex H hH X)

def e2Iso (p q : ℕ) : ((spectralSequence H hH X).page 2).X (p,q) ≅
    ModuleCat.of ℤ (continuousCohomology p
      (subgroupCohomologyRep H hH X q)) := sorry

def abutmentIso [ (hsDoubleComplex H hH X).HasTotal (.up ℕ)] (n : ℕ) :
    ((hsDoubleComplex H hH X).total (.up ℕ)).homology n ≅
      ModuleCat.of ℤ (continuousCohomology n X) := sorry

variable {X} {Y : TopRep.{u} ℤ G} [DiscreteTopology Y.V] [Fact (TauCeti.IsSmoothDiscrete ℤ Y)]
def map (f : X ⟶ Y) : spectralSequence H hH X ⟶ spectralSequence H hH Y := sorry

namespace SuggestedTest
variable (X)
-- TEST trivial_subgroup
example (p q : ℕ) (hq : 0 < q) :
    IsZero (((spectralSequence (⊥ : Subgroup G) (by simp) X).page 2).X (p,q)) := sorry

-- TEST whole_group
example (p q : ℕ) (hp : 0 < p) :
    IsZero (((spectralSequence (⊤ : Subgroup G) (by simp) X).page 2).X (p,q)) := sorry

-- TEST z4_nondegenerate
example [TopologicalSpace (Multiplicative (ZMod 4))]
    [IsTopologicalGroup (Multiplicative (ZMod 4))]
    [CompactSpace (Multiplicative (ZMod 4))] [T2Space (Multiplicative (ZMod 4))]
    [TotallyDisconnectedSpace (Multiplicative (ZMod 4))]
    (X4 : TopRep.{0} ℤ (Multiplicative (ZMod 4)))
    (e : ModuleCat.of ℤ X4.V ≅ ModuleCat.of ℤ (ZMod 2))
    (htriv : ∀ g x, X4.ρ g x = x)
    (H2 : Subgroup (Multiplicative (ZMod 4))) [H2.Normal]
    (h2 : ∀ x, x ∈ H2 ↔ (Multiplicative.toAdd x : ZMod 4) = 0 ∨
      Multiplicative.toAdd x = 2) (hc : IsClosed (H2 : Set (Multiplicative (ZMod 4))))
    [DiscreteTopology X4.V] [Fact (TauCeti.IsSmoothDiscrete ℤ X4)] :
    ((spectralSequence H2 hc X4).page 2).d (0,1) (2,0) ≠ 0 := sorry
end SuggestedTest
end TauCeti.HochschildSerre

namespace TauCeti.HochschildSerre

open TauCeti.DoubleComplex
attribute [local instance] TauCeti.DoubleComplex.upNatTensorSigns
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
  (H : Subgroup G) [H.Normal] (hH : IsClosed (H : Set G))
  (X : TopRep.{u} ℤ G) [DiscreteTopology X.V] [Fact (TauCeti.IsSmoothDiscrete ℤ X)]
  [(hsDoubleComplex H hH X).HasTotal (.up ℕ)]

/-- Inflation from the quotient acting on the degree-zero H-invariants. -/
def inflation (n : ℕ) : ModuleCat.of ℤ
    (continuousCohomology n (subgroupCohomologyRep H hH X 0)) ⟶
      ModuleCat.of ℤ (continuousCohomology n X) := sorry

/-- Restriction to H, corestricted to the quotient-fixed H-cohomology. -/
def restriction (n : ℕ) : ModuleCat.of ℤ (continuousCohomology n X) ⟶
    ModuleCat.of ℤ (continuousCohomology 0 (subgroupCohomologyRep H hH X n)) := sorry

theorem edgeBottom_eq_inflation (n : ℕ) :
    DoubleComplex.edgeBottom (hsDoubleComplex H hH X) n ≫ (abutmentIso H hH X n).hom =
      (e2Iso H hH X n 0).hom ≫ inflation H hH X n := sorry

theorem edgeLeft_eq_restriction (n : ℕ) :
    (abutmentIso H hH X n).inv ≫ DoubleComplex.edgeLeft (hsDoubleComplex H hH X) n =
      restriction H hH X n ≫ (e2Iso H hH X 0 n).inv := sorry

local instance openCompact (U : OpenSubgroup G) : CompactSpace U := sorry
local instance openTopologicalGroup (U : OpenSubgroup G) : IsTopologicalGroup U := sorry

local instance resSmooth (U : OpenSubgroup G) :
    Fact (TauCeti.IsSmoothDiscrete ℤ (TopRep.res U.toSubgroup.subtype X)) := ⟨sorry⟩

/-- Restriction and transfer for any open subgroup, using the inverse-image normal subgroup. -/
def res (U : OpenSubgroup G)
    (hc : IsClosed ((H.comap U.toSubgroup.subtype : Subgroup U) : Set U)) :
    spectralSequence H hH X ⟶
      spectralSequence (H.comap U.toSubgroup.subtype) hc
        (TopRep.res U.toSubgroup.subtype X) := sorry

def cor (U : OpenSubgroup G)
    (hc : IsClosed ((H.comap U.toSubgroup.subtype : Subgroup U) : Set U)) :
    spectralSequence (H.comap U.toSubgroup.subtype) hc
      (TopRep.res U.toSubgroup.subtype X) ⟶ spectralSequence H hH X := sorry

/-- Multiplication on a specified pair of pages; no new spectral-page carrier. -/
def cup (Y Z : TopRep.{u} ℤ G) [DiscreteTopology Y.V] [Fact (TauCeti.IsSmoothDiscrete ℤ Y)] [DiscreteTopology Z.V] [Fact (TauCeti.IsSmoothDiscrete ℤ Z)]
    (β : X.V →ₗ[ℤ] Y.V →ₗ[ℤ] Z.V)
    (hβ : ∀ g x y, β (X.ρ g x) (Y.ρ g y) = Z.ρ g (β x y))
    (r : ℤ) (hr : 2 ≤ r) (p q p' q' : ℕ) :
    ((spectralSequence H hH X).page r hr).X (p,q) →ₗ[ℤ]
    ((spectralSequence H hH Y).page r hr).X (p',q') →ₗ[ℤ]
      ((spectralSequence H hH Z).page r hr).X (p+p',q+q') := sorry
end TauCeti.HochschildSerre

namespace TauCeti.PoitouTate

open Filter RestrictedProduct
open scoped DirectSum
variable {ι : Type*} (H : ι → Type*) [∀ v, AddCommGroup (H v)]
  (Hun : ∀ v, AddSubgroup (H v))

/-- R02.4/restricted-product-cohomology, using the existing restricted product. -/
abbrev restrictedProductCohomology : Type _ := Πʳ v, [H v, Hun v]_[cofinite]

variable {H Hun} {A : Type*} [AddCommGroup A]
def beta (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    A →+ restrictedProductCohomology H Hun where
  toFun a := ⟨fun v => loc v a, hloc a⟩
  map_zero' := sorry
  map_add' := sorry

def sha (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    AddSubgroup A := (beta loc hloc).ker

theorem mem_sha_iff (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v)
    (a : A) : a ∈ sha loc hloc ↔ ∀ v, loc v a = 0 := sorry

variable (H Hun)
theorem compactSpace_P0 [∀ v, TopologicalSpace (H v)] [∀ v, IsTopologicalAddGroup (H v)]
    [∀ v, CompactSpace (H v)] (hfull : ∀ v, Hun v = ⊤) :
    CompactSpace (restrictedProductCohomology H Hun) := sorry

theorem locallyCompactSpace_P1 [∀ v, TopologicalSpace (H v)] [∀ v, IsTopologicalAddGroup (H v)]
    [∀ v, LocallyCompactSpace (H v)] (hopen : ∀ v, IsOpen (Hun v : Set (H v)))
    (hcompact : ∀ v, IsCompact (Hun v : Set (H v))) :
    LocallyCompactSpace (restrictedProductCohomology H Hun) := sorry

def restrictedProductCohomology_eq_sum (hzero : ∀ v, Hun v = ⊥) :
    restrictedProductCohomology H Hun ≃+ (⨁ v, H v) := sorry

theorem finite_restrictedProductCohomology [Finite ι] [∀ v, Finite (H v)] :
    Finite (restrictedProductCohomology H Hun) := sorry

variable {H Hun} {A' : Type*} [AddCommGroup A'] {H' : ι → Type*}
  [∀ v, AddCommGroup (H' v)] {Hun' : ∀ v, AddSubgroup (H' v)}
theorem sha_map (loc : ∀ v, A →+ H v) (loc' : ∀ v, A' →+ H' v)
    (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v)
    (hloc' : ∀ a, ∀ᶠ v in cofinite, loc' v a ∈ Hun' v)
    (f : A →+ A') (fv : ∀ v, H v →+ H' v)
    (hcomm : ∀ v, (loc' v).comp f = (fv v).comp (loc v)) :
    (sha loc hloc).map f ≤ sha loc' hloc' := sorry

namespace SuggestedTest
-- TEST rp_finite_pi
example [Finite ι] : Nonempty (restrictedProductCohomology H Hun ≃+ (∀ v, H v)) := sorry

-- TEST rp_zero_local
example (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v)
    (hzero : ∀ v, loc v = 0) : sha loc hloc = ⊤ := sorry

-- TEST rp_modified_real
example : Nontrivial (tateCohomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) (ZMod 2)) 0) := sorry

-- TEST rp_direct_sum
example : Nonempty (restrictedProductCohomology (fun _ : ℕ => ℤ) (fun _ => ⊥) ≃+
    (⨁ _ : ℕ, ℤ)) := sorry
end SuggestedTest

/-- The numerical carrier uses ordinary archimedean invariants. -/
def eulerChar (h0 h1 h2 : ℕ) : ℚ := (h0 * h2 : ℚ) / h1
def archFactor (isComplex : Bool) (h0 m : ℕ) : ℚ :=
  (h0 : ℚ) / (if isComplex then (m : ℚ)^2 else m)
def archProduct (places : List (Bool × ℕ)) (m : ℕ) : ℚ :=
  (places.map fun p => archFactor p.1 p.2 m).prod

-- R02.3 Euler acceptance: ordinary H0 at infinity, including dyadic real places.
example : archFactor false 2 2 = 1 := by norm_num [archFactor]
example : archFactor true 2 2 = 1/2 := by norm_num [archFactor]
example (r s : ℕ) : archProduct (List.replicate r (false,2) ++ List.replicate s (true,2)) 2 =
    1/2^s := sorry
end TauCeti.PoitouTate

namespace TauCeti.DiscreteExt

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]

/-- The category is the pinned discrete-representation category, not a parallel module type. -/
@[instance_reducible]
def discretePreadditive : Preadditive (TauCeti.DiscreteRep.{0,u,u} ℤ G) := sorry
attribute [local instance] discretePreadditive

@[instance_reducible]
def discreteAbelian : Abelian (TauCeti.DiscreteRep.{0,u,u} ℤ G) := sorry
attribute [local instance] discreteAbelian

theorem isGrothendieckAbelian :
    IsGrothendieckAbelian.{u} (TauCeti.DiscreteRep.{0,u,u} ℤ G) := sorry
attribute [local instance] isGrothendieckAbelian

theorem hasExt : CategoryTheory.HasExt.{u} (TauCeti.DiscreteRep.{0,u,u} ℤ G) := sorry
attribute [local instance] hasExt

variable {G}
abbrev Ext (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G) (r : ℕ) := Abelian.Ext.{u} M N r

def extZeroEquiv (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G) : Ext M N 0 ≃+ (M ⟶ N) := sorry

/-- The existing trivial TopRep, given its existing smooth discrete object property. -/
def trivialInt (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TauCeti.DiscreteRep.{0,u,u} ℤ G := sorry

def trivialIntCarrierIso : (trivialInt G).V ≃ₗ[ℤ] ULift.{u} ℤ := sorry

theorem trivialInt_action (g : G) (x : (trivialInt G).V) :
    (trivialInt G).ρ g x = x := sorry

def extIntEquivCohomology (N : TauCeti.DiscreteRep.{0,u,u} ℤ G) (r : ℕ) :
    Ext (trivialInt G) N r ≃+ continuousCohomology r
      (TauCeti.ofDiscreteModule ℤ G N.V) := sorry

def yonedaPairing (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G) (r s : ℕ) :
    Ext M N r →+ Ext (trivialInt G) M s →+ Ext (trivialInt G) N (r+s) := sorry

namespace SuggestedTest
-- TEST ext_degree_zero
example (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G) :
    Function.Bijective (extZeroEquiv M N) := sorry

-- TEST ext_int_first
example (N : TauCeti.DiscreteRep.{0,u,u} ℤ G) :
    Nonempty (Ext (trivialInt G) N 1 ≃+
      continuousCohomology 1 (TauCeti.ofDiscreteModule ℤ G N.V)) := sorry

-- TEST ext_trivial_group
example (N : TauCeti.DiscreteRep.{0,0,0} ℤ Unit) :
    Subsingleton (Ext (trivialInt Unit) N 2) := sorry
end SuggestedTest
end TauCeti.DiscreteExt

namespace TauCeti.ClassFormation

open TauCeti.HochschildSerre
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (X : TopRep.{u} ℤ G)

abbrev openCohomology (U : OpenSubgroup G) (n : ℕ) :=
  continuousCohomology n (TopRep.res U.toSubgroup.subtype X)

def openRestriction (U V : OpenSubgroup G) (h : V ≤ U) (n : ℕ) :
    openCohomology X U n →+ openCohomology X V n := sorry

/-- Quotient action on the invariant submodule of the restricted coefficient module. -/
def finiteLayerRep (X : TopRep.{u} ℤ G) (U : OpenSubgroup G) (V : OpenNormalSubgroup U) :
    TopRep.{u} ℤ (U ⧸ V.toSubgroup) := sorry

local instance layerNormal (U : OpenSubgroup G) (V : OpenNormalSubgroup U) :
    V.toSubgroup.Normal := V.isNormal'

local instance quotientTopologicalGroup (U : OpenSubgroup G) (V : OpenNormalSubgroup U) :
    IsTopologicalGroup (U ⧸ V.toSubgroup) := sorry

def finiteLayerInvariants (U : OpenSubgroup G) (V : OpenNormalSubgroup U) : Submodule ℤ X.V where
  carrier := {x | ∀ v : V, X.ρ (v.val.val : G) x = x}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def finiteLayerCarrierIso (U : OpenSubgroup G) (V : OpenNormalSubgroup U) :
    (finiteLayerRep X U V).V ≃ₗ[ℤ]
      finiteLayerInvariants X U V := sorry

abbrev finiteLayerCohomology (U : OpenSubgroup G) (V : OpenNormalSubgroup U) (n : ℕ) :=
  continuousCohomology n (finiteLayerRep X U V)

def finiteLayerInflation (U : OpenSubgroup G) (V : OpenNormalSubgroup U) (n : ℕ) :
    finiteLayerCohomology X U V n →+ openCohomology X U n := sorry

/-- All the invariant axioms are specified equations or bijections on actual cohomology. -/
structure PClassFormation (P : Set ℕ) (X : TopRep.{u} ℤ G) where
  inv (U : OpenSubgroup G) : openCohomology X U 2 →+ AddCircle (1 : ℚ)
  inv_injective (U : OpenSubgroup G) : Function.Injective (inv U)
  h1_zero (U : OpenSubgroup G) : Subsingleton (openCohomology X U 1)
  inv_res (U V : OpenSubgroup G) (h : V ≤ U) (a : openCohomology X U 2) :
    inv V (openRestriction X U V h 2 a) = (V.toSubgroup.comap U.toSubgroup.subtype).index • inv U a
  finite_layer (U : OpenSubgroup G) (V : OpenNormalSubgroup U) :
    Function.Injective ((inv U).comp (finiteLayerInflation X U V 2)) ∧
    ((inv U).comp (finiteLayerInflation X U V 2)).range =
      (nsmulAddMonoidHom (α := AddCircle (1 : ℚ)) V.toSubgroup.index).ker
  primary (p : ℕ) (hp : p.Prime) (hP : p ∈ P) (U : OpenSubgroup G)
      (b : AddCircle (1 : ℚ)) (hb : ∃ n : ℕ, p^n • b = 0) :
    ∃ a : openCohomology X U 2, (∃ n : ℕ, p^n • a = 0) ∧ inv U a = b

namespace PClassFormation
variable {X}

def ofClassFormation (P : Set ℕ) (F : PClassFormation (Set.univ : Set ℕ) X) :
    PClassFormation P X := sorry

def restrict (P : Set ℕ) (F : PClassFormation P X) (U : OpenSubgroup G) :
    PClassFormation P (TopRep.res U.toSubgroup.subtype X) := sorry

def invPrimaryEquiv {P : Set ℕ} (F : PClassFormation P X) (p : ℕ) (hp : p.Prime)
    (hP : p ∈ P) (U : OpenSubgroup G) :
    (AddCommGroup.primaryComponent (openCohomology X U 2) p) ≃+
      AddCommGroup.primaryComponent (AddCircle (1 : ℚ)) p := sorry

def fundamentalClass {P : Set ℕ} (F : PClassFormation P X)
    (U : OpenSubgroup G) (V : OpenNormalSubgroup U) : finiteLayerCohomology X U V 2 := sorry

theorem fundamentalClass_inv {P : Set ℕ} (F : PClassFormation P X)
    (U : OpenSubgroup G) (V : OpenNormalSubgroup U) :
    F.inv U (finiteLayerInflation X U V 2 (fundamentalClass F U V)) =
      ((1 / V.toSubgroup.index : ℚ) : AddCircle (1 : ℚ)) := sorry
end PClassFormation

namespace SuggestedTest
-- TEST class_formation_empty
example (F : PClassFormation (Set.univ : Set ℕ) X) :
    Nonempty (PClassFormation (∅ : Set ℕ) X) := sorry

-- TEST class_formation_primary
example {P : Set ℕ} (F : PClassFormation P X) (p : ℕ) (hp : p.Prime)
    (hP : p ∈ P) (U : OpenSubgroup G) :
    Function.Bijective (PClassFormation.invPrimaryEquiv F p hp hP U) := sorry

-- TEST class_formation_index_one
example {P : Set ℕ} (F : PClassFormation P X) (U : OpenSubgroup G)
    (V : OpenNormalSubgroup U) (hindex : V.toSubgroup.index = 1) :
    PClassFormation.fundamentalClass F U V = 0 := sorry
end SuggestedTest
end TauCeti.ClassFormation

namespace TauCeti.DiscreteExt

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
attribute [local instance] discretePreadditive discreteAbelian isGrothendieckAbelian hasExt

/-- The finite-generation condition makes pointwise conjugation on Hom discrete and smooth. -/
def homRep (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G) [Module.Finite ℤ M.V] :
    TopRep.{u} ℤ G := sorry

def homRepCarrierIso (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G) [Module.Finite ℤ M.V] :
    (homRep M N).V ≃ₗ[ℤ] (M.V →ₗ[ℤ] N.V) := sorry

theorem homRep_action (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G) [Module.Finite ℤ M.V]
    (g : G) (f : (homRep M N).V) (m : M.V) :
    homRepCarrierIso M N ((homRep M N).ρ g f) m =
      N.ρ g (homRepCarrierIso M N f (M.ρ g⁻¹ m)) := sorry

def extEquivCohomologyHom (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G)
    [Module.Finite ℤ M.V]
    (hdiv : ∀ m : M.V, 0 < addOrderOf m →
      Function.Surjective (fun x : N.V => addOrderOf m • x)) (r : ℕ) :
    Ext.{u} M N r ≃+ continuousCohomology r (homRep.{u} M N) := sorry

theorem ext_isTorsion (M N : TauCeti.DiscreteRep.{0,u,u} ℤ G)
    [Module.Finite ℤ M.V] (r : ℕ) (hr : 0 < r) (e : Ext M N r) :
    ∃ n : ℕ, 0 < n ∧ n • e = 0 := sorry

/-- Fixed-group filtered-colimit specialization of Milne's varying-group theorem. -/
def extSecondFunctor (M : TauCeti.DiscreteRep.{0,u,u} ℤ G) (r : ℕ) :
    TauCeti.DiscreteRep.{0,u,u} ℤ G ⥤ AddCommGrpCat.{u} where
  obj N := AddCommGrpCat.of (Ext M N r)
  map f := AddCommGrpCat.ofHom
    { toFun e := e.comp (Abelian.Ext.mk₀ f) (Nat.add_zero r)
      map_zero' := sorry
      map_add' := sorry }
  map_id := sorry
  map_comp := sorry

def ext_colimit (M : TauCeti.DiscreteRep.{0,u,u} ℤ G) [Module.Finite ℤ M.V]
    (F : ℕ ⥤ TauCeti.DiscreteRep.{0,u,u} ℤ G) (r : ℕ)
    [CategoryTheory.Limits.HasColimit F]
    [CategoryTheory.Limits.HasColimit (F ⋙ extSecondFunctor M r)] :
    CategoryTheory.Limits.colimit (F ⋙ extSecondFunctor M r) ≅
      AddCommGrpCat.of (Ext M (CategoryTheory.Limits.colimit F) r) := sorry

local instance openSubgroupCompact (U : OpenSubgroup G) : CompactSpace U := sorry

local instance openSubgroupTopologicalGroup (U : OpenSubgroup G) : IsTopologicalGroup U := sorry

/-- These wrappers carry the existing restriction and algebraic induction modules. -/
def resDiscrete (U : OpenSubgroup G) (N : TauCeti.DiscreteRep.{0,u,u} ℤ G) :
    TauCeti.DiscreteRep.{0,u,u} ℤ U := sorry

def resDiscreteCarrierIso (U : OpenSubgroup G) (N : TauCeti.DiscreteRep.{0,u,u} ℤ G) :
    (resDiscrete U N).V ≃ₗ[ℤ] N.V := sorry

def indDiscrete (U : OpenSubgroup G) (M : TauCeti.DiscreteRep.{0,u,u} ℤ U) :
    TauCeti.DiscreteRep.{0,u,u} ℤ G := sorry

def indDiscreteCarrierIso (U : OpenSubgroup G) (M : TauCeti.DiscreteRep.{0,u,u} ℤ U) :
    letI : Module ℤ M.V := M.module
    (indDiscrete U M).V ≃ₗ[ℤ] Representation.IndV U.toSubgroup.subtype M.ρ := sorry

def extShapiro (U : OpenSubgroup G) (M : TauCeti.DiscreteRep.{0,u,u} ℤ U)
    (N : TauCeti.DiscreteRep.{0,u,u} ℤ G) (r : ℕ) :
    Ext (indDiscrete U M) N r ≃+ Ext M (resDiscrete U N) r := sorry

def trivialModule (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (M : ModuleCat.{u} ℤ) : TauCeti.DiscreteRep.{0,u,u} ℤ G := sorry

def trivialModuleCarrierIso (M : ModuleCat.{u} ℤ) : (trivialModule G M).V ≃ₗ[ℤ] M := sorry

theorem trivialModule_action (M : ModuleCat.{u} ℤ) (g : G) (x : (trivialModule G M).V) :
    (trivialModule G M).ρ g x = x := sorry

namespace SuggestedTest
-- TEST ext_divisibility_needed
example : ¬ Subsingleton (Ext (trivialModule Unit (ModuleCat.of ℤ (ZMod 2)))
    (trivialInt Unit) 1) := sorry
end SuggestedTest
end TauCeti.DiscreteExt

namespace TauCeti.ClassFormation

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
  (X : TopRep.{u} ℤ G) [DiscreteTopology X.V]
  (H : Subgroup G) [H.Normal] (hH : IsClosed (H : Set G))
  [T2Space (G ⧸ H)] [TotallyDisconnectedSpace (G ⧸ H)]

def quotientInvariants : Submodule ℤ X.V where
  carrier := {x | ∀ h : H, X.ρ h.val x = x}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def quotientRep (X : TopRep.{u} ℤ G) (H : Subgroup G) [H.Normal] (hH : IsClosed (H : Set G)) : TopRep.{u} ℤ (G ⧸ H) := sorry

def quotientRepCarrierIso : (quotientRep X H hH).V ≃ₗ[ℤ] quotientInvariants X H := sorry

/-- Infinite p-exponent in the profinite index is tested on finite quotients. -/
def quotientPrimes : Set ℕ := {p | p.Prime ∧ ∀ n : ℕ,
  ∃ U : OpenSubgroup G, H ≤ U.toSubgroup ∧ p^n ∣ U.toSubgroup.index}

namespace PClassFormation
/-- The quotient theorem starts from a full class formation. -/
def quotient (F : PClassFormation (Set.univ : Set ℕ) X) :
    PClassFormation (quotientPrimes H) (quotientRep X H hH) := sorry
end PClassFormation
end TauCeti.ClassFormation

namespace TauCeti.GaloisCohomology

open CochainComplex.HomComplex
variable {R : Type u} [CommRing R]
  (A B J : CochainComplex (ModuleCat.{u} R) ℤ)

/-- The R-linear enrichment of Mathlib's existing Hom complex. -/
def dualizingHom (A J : CochainComplex (ModuleCat.{u} R) ℤ) :
    CochainComplex (ModuleCat.{u} R) ℤ where
  X n := ModuleCat.of R (Cochain A J n)
  d n m := ModuleCat.ofHom (δ_hom R A J n m)
  shape := sorry
  d_comp_d' := sorry

variable (β : ∀ n : ℤ, A.X n →ₗ[R] (dualizingHom B (J⟦(-2 : ℤ)⟧)).X n)
  (hβ : ∀ n m : ℤ, (β m).comp (A.d n m).hom =
    ((dualizingHom B (J⟦(-2 : ℤ)⟧)).d n m).hom.comp (β n))

/-- Adjunction applied to the supplied cochain cup product followed by the local invariant. -/
def localDualityMap : A ⟶ dualizingHom B (J⟦(-2 : ℤ)⟧) where
  f n := ModuleCat.ofHom (β n)
  comm' n m _ := by exact ModuleCat.hom_ext (hβ n m).symm

/-- The same adjunction, applied to the other evaluation order. -/
def localDualityMap' (β' : ∀ n : ℤ, B.X n →ₗ[R] (dualizingHom A (J⟦(-2 : ℤ)⟧)).X n)
    (hβ' : ∀ n m : ℤ, (β' m).comp (B.d n m).hom =
      ((dualizingHom A (J⟦(-2 : ℤ)⟧)).d n m).hom.comp (β' n)) :
    B ⟶ dualizingHom A (J⟦(-2 : ℤ)⟧) := localDualityMap B A J β' hβ'

def localDualityPairing
    (β : ∀ n : ℤ, A.X n →ₗ[R] (dualizingHom B (J⟦(-2 : ℤ)⟧)).X n)
    (hβ : ∀ n m : ℤ, (β m).comp (A.d n m).hom =
      ((dualizingHom B (J⟦(-2 : ℤ)⟧)).d n m).hom.comp (β n)) (i j : ℤ) :
    A.homology i →ₗ[R] B.homology j →ₗ[R] J.homology (i+j-2) := sorry

theorem localDualityMap_indep
    (β' : ∀ n : ℤ, A.X n →ₗ[R] (dualizingHom B (J⟦(-2 : ℤ)⟧)).X n)
    (hβ' : ∀ n m : ℤ, (β' m).comp (A.d n m).hom =
      ((dualizingHom B (J⟦(-2 : ℤ)⟧)).d n m).hom.comp (β' n))
    (h : Homotopy (localDualityMap A B J β hβ) (localDualityMap A B J β' hβ')) (n : ℤ) :
    HomologicalComplex.homologyMap (localDualityMap A B J β hβ) n =
      HomologicalComplex.homologyMap (localDualityMap A B J β' hβ') n := sorry

namespace SuggestedTest
-- TEST dualizing_hom_degree
example (n : ℤ) : (dualizingHom A J).X n = ModuleCat.of R (Cochain A J n) := rfl

-- TEST dualizing_zero
example (hA : IsZero A) : localDualityMap A B J β hβ = 0 := sorry

-- TEST dualizing_infinite_biddual
example : ¬ Function.Surjective (Module.Dual.eval (ZMod 2) (ℕ →₀ ZMod 2)) := sorry
end SuggestedTest
end TauCeti.GaloisCohomology

namespace TauCeti.ArithmeticDuality

variable (k : Type u) [Field k] (n : ℕ)

abbrev adjointMatrix := Matrix (Fin n) (Fin n) k
abbrev adjointTrace : adjointMatrix k n →ₗ[k] k := Matrix.traceLinearMap (Fin n) k k
abbrev traceZeroAdjoint : Submodule k (adjointMatrix k n) := (adjointTrace k n).ker
abbrev scalarAdjoint : Submodule k (adjointMatrix k n) := Submodule.span k {1}

def tracePairingEquiv (k : Type u) [Field k] (n : ℕ) :
    adjointMatrix k n ≃ₗ[k] Module.Dual k (adjointMatrix k n) := sorry

theorem tracePairingEquiv_apply (A B : adjointMatrix k n) :
    tracePairingEquiv k n A B = Matrix.trace (A * B) := sorry

theorem traceAdjointDuality (hn : 0 < n) :
    Function.Surjective (adjointTrace k n) ∧
    Nonempty ((adjointMatrix k n ⧸ scalarAdjoint k n) ≃ₗ[k]
      Module.Dual k (traceZeroAdjoint k n)) ∧
    (traceZeroAdjoint k n).dualAnnihilator.comap (tracePairingEquiv k n).toLinearMap =
      scalarAdjoint k n := sorry

/-- No division by n occurs in the trace duality. -/
example : Matrix.trace (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) = 0 ∧
    (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) ≠ 0 := sorry

example : traceZeroAdjoint (ZMod 3) 1 = ⊥ := sorry

variable {R : Type u} [CommRing R]
  {A B A' B' : CochainComplex (ModuleCat.{u} R) ℤ}

/-- Iterated actual fibres of restriction and trace commute, with the cone signs transported. -/
def determinantFibreComparison (res : A ⟶ B) (res' : A' ⟶ B')
    (trGlobal : A ⟶ A') (trLocal : B ⟶ B') (h : res ≫ trLocal = trGlobal ≫ res') :
    finiteCompactCochains (finiteCompact_map res res' trGlobal trLocal h) ≅
      finiteCompactCochains (finiteCompact_map trGlobal trLocal res res' h.symm) := sorry

/-- H1 of a Selmer fibre maps onto the true kernel Selmer group. -/
def fibreH1ToKernel (res : A ⟶ B) : finiteCompactCohomology res 1 ⟶
    ModuleCat.of R (HomologicalComplex.homologyMap res 1).hom.ker := sorry

theorem selmerLocalizationTangentComparison (res : A ⟶ B) :
    Function.Surjective (fibreH1ToKernel res).hom ∧
    Nonempty ((fibreH1ToKernel res).hom.ker ≃ₗ[R]
      (B.homology 0 ⧸ (HomologicalComplex.homologyMap res 0).hom.range)) := sorry

/-- The correction disappears precisely when degree-zero localization is surjective. -/
example (res : A ⟶ B) (h0 : Function.Surjective (HomologicalComplex.homologyMap res 0).hom) :
    IsIso (fibreH1ToKernel res) := sorry
end TauCeti.ArithmeticDuality

namespace TauCeti.CompactCoefficients

namespace Tower
variable (A B C : Tower) (f : ∀ n, A.obj n →+ B.obj n) (g : ∀ n, B.obj n →+ C.obj n)
  (hf : ∀ n x, f n (A.map n x) = B.map n (f (n+1) x))
  (hg : ∀ n x, g n (B.map n x) = C.map n (g (n+1) x))

def limMap (A B : Tower) (f : ∀ n, A.obj n →+ B.obj n)
    (hf : ∀ n x, f n (A.map n x) = B.map n (f (n+1) x)) : A.lim →+ B.lim := sorry

def limOneMap (A B : Tower) (f : ∀ n, A.obj n →+ B.obj n)
    (hf : ∀ n x, f n (A.map n x) = B.map n (f (n+1) x)) : A.limOne →+ B.limOne := sorry

theorem limOneSixTerm (hex : ∀ n, Function.Exact (f n) (g n))
    (hsurj : ∀ n, Function.Surjective (g n)) (hinj : ∀ n, Function.Injective (f n)) :
    Function.Injective (limMap A B f hf) ∧
    Function.Exact (limMap A B f hf) (limMap B C g hg) ∧
    Function.Exact (limMap B C g hg) (limOneConnecting A B C f g hf hg hex hsurj hinj) ∧
    Function.Exact (limOneConnecting A B C f g hf hg hex hsurj hinj) (limOneMap A B f hf) ∧
    Function.Exact (limOneMap A B f hf) (limOneMap B C g hg) ∧
    Function.Surjective (limOneMap B C g hg) := sorry
end Tower

open Opposite CategoryTheory.Limits
variable (F : ℕᵒᵖ ⥤ CochainComplex (ModuleCat ℤ) ℤ)

abbrev complexTower (n : ℤ) : Tower where
  obj m := (F.obj (op m)).X n
  map m := ((F.map (homOfLE (Nat.le_succ m)).op).f n).hom.toAddMonoidHom

abbrev cohomologyTower (n : ℤ) : Tower where
  obj m := (F.obj (op m)).homology n
  map m := (HomologicalComplex.homologyMap
    (F.map (homOfLE (Nat.le_succ m)).op) n).hom.toAddMonoidHom

/-- Milnor keeps the previous-degree derived limit in the actual sequence. -/
theorem milnorSequence [HasLimit F]
    (hsurj : ∀ m n, Function.Surjective (((F.map (homOfLE (Nat.le_succ m)).op).f n).hom))
    (n : ℤ) : ∃ (ι : (cohomologyTower F (n-1)).limOne →+ (limit F).homology n)
      (π : (limit F).homology n →+ (cohomologyTower F n).lim),
      Function.Injective ι ∧ Function.Exact ι π ∧ Function.Surjective π := sorry
end TauCeti.CompactCoefficients

namespace TauCeti.ArithmeticDuality

open IsDedekindDomain
open scoped NumberField
variable (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]
  [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
  (S : Set (HeightOneSpectrum (𝓞 K)))

abbrev arithmeticGroup := TauCeti.RestrictedRamification.galoisGroupS K Ω S

def containsCoefficientPrimes (m : ℕ) : Prop :=
  ∀ v : HeightOneSpectrum (𝓞 K), (m : 𝓞 K) ∈ v.asIdeal → v ∈ S

theorem hermiteUnramifiedOutsideFinite (hS : S.Finite) (d : ℕ) :
    {L : IntermediateField K Ω | ∃ hL : FiniteDimensional K L,
      Module.finrank K L ≤ d ∧ TauCeti.RestrictedRamification.IsUnramifiedOutside K Ω S L hL}.Finite := sorry

theorem h1Finite (hS : S.Finite) (X : TopRep.{0} ℤ (arithmeticGroup K Ω S))
    [Finite X.V] (hX : TauCeti.IsSmoothDiscrete ℤ X) :
    Finite (continuousCohomology 1 X) := sorry

theorem globalFiniteness (hS : S.Finite) (X : TopRep.{0} ℤ (arithmeticGroup K Ω S))
    [Finite X.V] (hX : TauCeti.IsSmoothDiscrete ℤ X)
    (hunit : containsCoefficientPrimes K S (Nat.card X.V)) (r : ℕ) :
    Finite (continuousCohomology r X) := sorry

/-- The vanishing specialization keeps both real-place exceptions in the hypothesis. -/
theorem cohomologicalDimensionBound (p : ℕ) [Fact p.Prime]
    (hunit : containsCoefficientPrimes K S p)
    (hP : p ≠ 2 ∨ NumberField.IsTotallyComplex K)
    (X : TopRep.{0} ℤ (arithmeticGroup K Ω S)) [Finite X.V]
    (hX : TauCeti.IsSmoothDiscrete ℤ X)
    (hp : ∀ x : X.V, ∃ n : ℕ, p^n • x = 0) (r : ℕ) (hr : 3 ≤ r) :
    Subsingleton (continuousCohomology r X) := sorry
end TauCeti.ArithmeticDuality

namespace TauCeti.CompactCoefficients

open scoped TensorProduct
variable (p : ℕ) [Fact p.Prime]
  {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
  (X : TopRep.{u} ℤ_[p] G)

/-- Scalar extension, with the vector-space topology transported from a finite lattice. -/
def rationalRep (p : ℕ) [Fact p.Prime] (X : TopRep.{u} ℤ_[p] G) : TopRep.{u} ℚ_[p] G := sorry

def rationalRepCarrierIso : (rationalRep p X).V ≃+ (X.V ⊗[ℤ_[p]] ℚ_[p]) := sorry

theorem rationalRep_action (g : G) (x : (rationalRep p X).V) :
    rationalRepCarrierIso p X ((rationalRep p X).ρ g x) =
      TensorProduct.map (X.ρ g).toLinearMap (LinearMap.id : ℚ_[p] →ₗ[ℤ_[p]] ℚ_[p])
        (rationalRepCarrierIso p X x) := sorry

/-- Both scalar extension and absence of divisible elements use the lattice topology. -/
theorem rationalization [Module.Finite ℤ_[p] X.V]
    (htop : (inferInstance : TopologicalSpace X.V) =
      (Ideal.span {(p : ℤ_[p])}).adicModuleTopology X.V)
    (hjoint : Continuous (fun gx : G × X.V => X.ρ gx.1 gx.2)) (n : ℕ) :
    Nonempty ((continuousCohomology n X ⊗[ℤ_[p]] ℚ_[p]) ≃+
      continuousCohomology n (rationalRep.{u} p X)) ∧
    (∀ a : continuousCohomology n X,
      (∀ m : ℕ, ∃ b, p^m • b = a) → a = 0) := sorry
end TauCeti.CompactCoefficients

namespace TauCeti.ArithmeticDuality

open IsDedekindDomain
open scoped NumberField
variable (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]
  [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
  (S : Set (HeightOneSpectrum (𝓞 K)))

abbrev allArithmeticPlaces : Set (TauCeti.GlobalNumberFields.Place K) :=
  {v | match v with | .inl w => w ∈ S | .inr _ => True}

instance rootCoefficientTopology (m : ℕ) : TopologicalSpace
    (Additive (rootsOfUnity m (TauCeti.RestrictedRamification.maxUnramifiedOutside K Ω S))) := ⊥

instance rootCoefficientDiscrete (m : ℕ) : DiscreteTopology
    (Additive (rootsOfUnity m (TauCeti.RestrictedRamification.maxUnramifiedOutside K Ω S))) := ⟨rfl⟩

/-- The finite cyclotomic coefficient is the existing roots-of-unity subgroup. -/
def rootRep (m : ℕ) : ContRepresentation ℤ (arithmeticGroup K Ω S)
    (Additive (rootsOfUnity m (TauCeti.RestrictedRamification.maxUnramifiedOutside K Ω S))) := sorry

abbrev rootTopRep (m : ℕ) := TopRep.of (rootRep K Ω S m)

theorem rootRep_action (m : ℕ) (g : arithmeticGroup K Ω S)
    (x : Additive (rootsOfUnity m (TauCeti.RestrictedRamification.maxUnramifiedOutside K Ω S))) :
    (((rootRep K Ω S m g x).toMul.val.val) :
      TauCeti.RestrictedRamification.maxUnramifiedOutside K Ω S) =
      g (x.toMul.val.val) := sorry

abbrev sKummerUnits := Additive (TauCeti.RestrictedRamification.sUnits K (allArithmeticPlaces K S))
abbrev sKummerClasses := Additive (ClassGroup
  (TauCeti.RestrictedRamification.sIntegers K (allArithmeticPlaces K S)))

attribute [local instance] TauCeti.RestrictedRamification.sIntegersDedekind

abbrev sKummerDomain (m : ℕ) := sKummerUnits K S ⧸
  (nsmulAddMonoidHom (α := sKummerUnits K S) m).range

abbrev sKummerClassTorsion (m : ℕ) :=
  (nsmulAddMonoidHom (α := sKummerClasses K S) m).ker

def sKummerMap (m : ℕ) (hm : 0 < m)
    (hunit : containsCoefficientPrimes K S m) :
    sKummerDomain K S m →+ continuousCohomology 1 (rootTopRep K Ω S m) := sorry

def sKummerClassMap (m : ℕ) (hm : 0 < m)
    (hunit : containsCoefficientPrimes K S m) :
    continuousCohomology 1 (rootTopRep K Ω S m) →+ sKummerClassTorsion K S m := sorry

theorem sUnitKummerSequence (m : ℕ) (hm : 0 < m)
    (hunit : containsCoefficientPrimes K S m) :
    Function.Injective (sKummerMap K Ω S m hm hunit) ∧
    Function.Exact (sKummerMap K Ω S m hm hunit) (sKummerClassMap K Ω S m hm hunit) ∧
    Function.Surjective (sKummerClassMap K Ω S m hm hunit) := sorry
end TauCeti.ArithmeticDuality

namespace TauCeti.ArithmeticDuality

variable (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]
  [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
  [IsTopologicalGroup (Ω ≃ₐ[K] Ω)] [CompactSpace (Ω ≃ₐ[K] Ω)]
  [T2Space (Ω ≃ₐ[K] Ω)] [TotallyDisconnectedSpace (Ω ≃ₐ[K] Ω)]

/-- Integral odd-degree vanishing is for the absolute Galois group. -/
theorem numberFieldIntegralOddVanishing (r : ℕ) (hr : Odd r) :
    Subsingleton (continuousCohomology r
      (TauCeti.ofDiscreteModule ℤ (Ω ≃ₐ[K] Ω)
        (TauCeti.DiscreteExt.trivialInt (Ω ≃ₐ[K] Ω)).V)) := sorry

/-- Trivial discrete Q/Z; this is not a cyclotomic coefficient. -/
theorem tateH2Qmodz : Subsingleton (continuousCohomology 2
    (TauCeti.ofDiscreteModule ℤ (Ω ≃ₐ[K] Ω)
      (TauCeti.DiscreteExt.trivialModule (Ω ≃ₐ[K] Ω)
        (ModuleCat.of ℤ (AddCircle (1 : ℚ)))).V)) := sorry
end TauCeti.ArithmeticDuality

namespace TauCeti.CompactCoefficients
variable {G H : Type u} [Group G] [Group H] [TopologicalSpace G] [TopologicalSpace H]
  [IsTopologicalGroup G] [IsTopologicalGroup H] [CompactSpace G] [CompactSpace H]
  [T2Space G] [T2Space H] [TotallyDisconnectedSpace G] [TotallyDisconnectedSpace H]

/-- Transport of the existing quotient section along a surjective homomorphism. -/
theorem continuousSectionExists (f : G →ₜ* H) (hf : Function.Surjective f) :
    ∃ s : C(H,G), (∀ h, f (s h) = h) ∧ s 1 = 1 := sorry

open Opposite
variable (G)

/-- The tower uses the actual coefficient maps on canonical continuous cohomology. -/
abbrev topRepCohomologyTower (F : ℕᵒᵖ ⥤ TopRep.{u} ℤ G) (n : ℕ) : Tower where
  obj m := continuousCohomology n (F.obj (op m))
  map m := (ContinuousCohomology.map (ContinuousMonoidHom.id G)
    (F.map (homOfLE (Nat.le_succ m)).op) n).hom.toAddMonoidHom

/-- Inverse limits of finite discrete coefficients retain the previous-degree lim¹. -/
theorem tateInverseLimit (F : ℕᵒᵖ ⥤ TopRep.{u} ℤ G) [HasLimit F]
    [∀ m : ℕᵒᵖ, Finite (F.obj m).V] [∀ m : ℕᵒᵖ, DiscreteTopology (F.obj m).V]
    (hjoint : ∀ m : ℕᵒᵖ, TauCeti.IsSmoothDiscrete ℤ (F.obj m))
    (hsurj : ∀ m : ℕ, Function.Surjective
      (F.map (homOfLE (Nat.le_succ m)).op).hom) (n : ℕ) (hn : 0 < n) :
    ∃ (ι : (topRepCohomologyTower G F (n-1)).limOne →+
        continuousCohomology n (limit F))
      (π : continuousCohomology n (limit F) →+ (topRepCohomologyTower G F n).lim),
      Function.Injective ι ∧ Function.Exact ι π ∧ Function.Surjective π := sorry
end TauCeti.CompactCoefficients

namespace TauCeti.ArithmeticDuality
variable {R : Type u} [CommRing R] [TopologicalSpace R]
  {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]

def cochainCoeffMap {A B : TopRep.{u} R G} (f : A ⟶ B) :
    algebraicContinuousCochains A ⟶ algebraicContinuousCochains B :=
  ((forget₂ (TopModuleCat R) (ModuleCat R)).mapHomologicalComplex (.up ℕ)).map
    (ContinuousCohomology.cochainsMap (ContinuousMonoidHom.id G) f)

/-- Exactness of topological coefficients requires an embedding at the left end. -/
theorem continuousSectionLongExact (A B C : TopRep.{u} R G) (ι : A ⟶ B) (κ : B ⟶ C)
    (hinj : Function.Injective ι.hom) (hemb : Topology.IsClosedEmbedding ι.hom)
    (hex : Function.Exact ι.hom κ.hom) (hcomp : ι ≫ κ = 0)
    (s : C(C.V,B.V)) (hs : ∀ c, κ.hom (s c) = c)
    (hA : Continuous fun gx : G × A.V => A.ρ gx.1 gx.2)
    (hB : Continuous fun gx : G × B.V => B.ρ gx.1 gx.2)
    (hC : Continuous fun gx : G × C.V => C.ρ gx.1 gx.2) :
    (ShortComplex.mk (cochainCoeffMap ι) (cochainCoeffMap κ) (by sorry)).ShortExact := sorry
end TauCeti.ArithmeticDuality

namespace TauCeti.HochschildSerre
open TauCeti.DoubleComplex
attribute [local instance] TauCeti.DoubleComplex.upNatTensorSigns
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
  (H : Subgroup G) [H.Normal] (hH : IsClosed (H : Set G))
  (X : TopRep.{u} ℤ G) [DiscreteTopology X.V] [Fact (TauCeti.IsSmoothDiscrete ℤ X)]
  [(hsDoubleComplex H hH X).HasTotal (.up ℕ)]

theorem hochschildSerreDegeneration
    (hvan : ∀ q : ℕ, 0 < q → Subsingleton
      (continuousCohomology q (TopRep.res H.subtype X))) (n : ℕ) :
    IsIso (inflation H hH X n) := sorry

/-- The actual d₂, transported across the E₂ identifications, is the transgression. -/
def spectralTransgression :
    continuousCohomology 0 (subgroupCohomologyRep H hH X 1) →ₗ[ℤ]
      continuousCohomology 2 (subgroupCohomologyRep H hH X 0) :=
    ((e2Iso H hH X 2 0).hom.hom).comp
      ((((spectralSequence H hH X).page 2).d (0,1) (2,0)).hom.comp
        (e2Iso H hH X 0 1).inv.hom)

theorem fiveTermTransgression :
    Function.Injective (inflation H hH X 1).hom ∧
    Function.Exact (inflation H hH X 1).hom (restriction H hH X 1).hom ∧
    Function.Exact (restriction H hH X 1).hom (spectralTransgression H hH X) ∧
    Function.Exact (spectralTransgression H hH X) (inflation H hH X 2).hom := sorry
end TauCeti.HochschildSerre

namespace TauCeti.ArithmeticDuality

section ArchimedeanDimensions
variable (k : Type u) [Field k] (n : ℕ)

def commutingTraceZero (c : Matrix (Fin n) (Fin n) k) :
    Submodule k (Matrix (Fin n) (Fin n) k) where
  carrier := {a | a*c = c*a ∧ Matrix.trace a = 0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Ordinary invariants under a real involution; no modular division by n is used. -/
theorem archimedeanAdjointDimensions (hn : 0 < n) (hk : (2 : k) ≠ 0)
    (c : Matrix (Fin n) (Fin n) k) (hc : c*c = 1) :
    Module.finrank k (commutingTraceZero k n c) =
      (Module.finrank k (Module.End.eigenspace (Matrix.toLin' c) 1))^2 +
      (Module.finrank k (Module.End.eigenspace (Matrix.toLin' c) (-1)))^2 - 1 := sorry

theorem complexAdjointDimensions (hn : 0 < n) :
    Module.finrank k (traceZeroAdjoint k n) = n^2-1 := sorry
end ArchimedeanDimensions

end TauCeti.ArithmeticDuality

namespace TauCeti.CompactCoefficients

section AdicFunctions
open scoped TensorProduct
variable (R : Type u) [CommRing R] [IsNoetherianRing R] [IsLocalRing R]
  [TopologicalSpace R] [IsTopologicalRing R]
  [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
  (hR : IsAdic (IsLocalRing.maximalIdeal R))
  [Finite (IsLocalRing.ResidueField R)]
  (K : Type u) [TopologicalSpace K] [CompactSpace K] [T2Space K]
  [TotallyDisconnectedSpace K]
  (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
  [TopologicalSpace M] [IsTopologicalAddGroup M] [ContinuousSMul R M]
  (hM : (inferInstance : TopologicalSpace M) = (IsLocalRing.maximalIdeal R).adicModuleTopology M)

def continuousTensorMap : C(K,R) ⊗[R] M →ₗ[R] C(K,M) := sorry

theorem continuousTensorMap_apply (f : C(K,R)) (m : M) (x : K) :
    continuousTensorMap R K M (f ⊗ₜ[R] m) x = f x • m := sorry

/-- Flatness and the actual finite-module tensor map, with both adic topologies retained. -/
theorem adicContinuousMapFlatness
    (hR : IsAdic (IsLocalRing.maximalIdeal R))
    (hM : (inferInstance : TopologicalSpace M) = (IsLocalRing.maximalIdeal R).adicModuleTopology M) :
    Module.Flat R C(K,R) ∧ Function.Bijective (continuousTensorMap R K M) := sorry

/-- The canonical tensor is compared with the existing adic completion. -/
theorem completedTensorComparison
    (T : Type u) [AddCommGroup T] [Module R T] [Module.Finite R T]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) M] :
    Nonempty (AdicCompletion (IsLocalRing.maximalIdeal R) (T ⊗[R] M) ≃ₗ[R]
      T ⊗[R] M) := sorry
end AdicFunctions
end TauCeti.CompactCoefficients

namespace TauCeti.ArithmeticDuality
section CompactCarrierComparison
variable {R G : Type u} [CommRing R] [TopologicalSpace R]
  [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (X : TopRep.{u} R G)

abbrev algebraicRepresentation : Rep.{u} R G := by
  letI : Module R X.V := X.hV2
  exact Rep.of X.ρ.toRepresentation

/-- Continuous cochains form a submodule of the existing inhomogeneous term. -/
def continuousInhomogeneousTerm (n : ℕ) :
    Submodule R ((groupCohomology.inhomogeneousCochains (algebraicRepresentation X)).X n) where
  carrier := {f | Continuous f}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Restrict the existing differential, with joint continuity of the action. -/
def continuousInhomogeneousCochains
    (hjoint : Continuous fun gx : G × X.V => X.ρ gx.1 gx.2) :
    CochainComplex (ModuleCat.{u} R) ℕ where
  X n := ModuleCat.of R (continuousInhomogeneousTerm X n)
  d n m := sorry
  shape := sorry
  d_comp_d' := sorry

theorem continuousInhomogeneous_d_apply
    (hjoint : Continuous fun gx : G × X.V => X.ρ gx.1 gx.2)
    (n m : ℕ) (c : (continuousInhomogeneousCochains X hjoint).X n) :
    (((continuousInhomogeneousCochains X hjoint).d n m).hom c).val =
      ((groupCohomology.inhomogeneousCochains (algebraicRepresentation X)).d n m).hom c.val := sorry

/-- Dehomogenization of the canonical homogeneous complex. -/
def carrierComparison
    (hjoint : Continuous fun gx : G × X.V => X.ρ gx.1 gx.2) :
    continuousInhomogeneousCochains X hjoint ≅ algebraicContinuousCochains X := sorry
end CompactCarrierComparison
end TauCeti.ArithmeticDuality

namespace TauCeti.ArithmeticDuality
section EulerMultiplicity
/-- The polynomial of lengths of the actual maximal-ideal quotients. -/
def hilbertSamuelPolynomial (R : Type u) [CommRing R] [IsNoetherianRing R] [IsLocalRing R]
    (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M] : Polynomial ℚ := sorry

variable (R : Type u) [CommRing R] [IsNoetherianRing R] [IsLocalRing R]
  (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M]

theorem hilbertSamuelPolynomial_eventual : ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    (((Module.length R (M ⧸ ((IsLocalRing.maximalIdeal R)^(n+1) •
      (⊤ : Submodule R M)))).toNat : ℕ) : ℚ) =
        (hilbertSamuelPolynomial R M).eval (n : ℚ) := sorry

/-- The ambient-dimension-normalized coefficient, rather than the multiplicity in dim(M). -/
def hilbertSamuelEuler (d : ℕ) : ℕ :=
  let q := (d.factorial : ℚ) * (hilbertSamuelPolynomial R M).coeff d
  q.num.toNat / q.den

theorem hilbertSamuelEuler_coefficient (d : ℕ) (hdim : ringKrullDim R = d) :
    (hilbertSamuelEuler R M d : ℚ) =
      (d.factorial : ℚ) * (hilbertSamuelPolynomial R M).coeff d := sorry

theorem hilbertSamuelEuler_exact (d : ℕ) (hdim : ringKrullDim R = d)
    (A B C : ModuleCat.{u} R) [Module.Finite R A] [Module.Finite R B] [Module.Finite R C]
    (ι : A ⟶ B) (κ : B ⟶ C) (hi : Function.Injective ι.hom)
    (he : Function.Exact ι.hom κ.hom) (hs : Function.Surjective κ.hom) :
    hilbertSamuelEuler R B d = hilbertSamuelEuler R A d + hilbertSamuelEuler R C d := sorry

namespace SuggestedTest
-- TEST euler_multiplicity_field
example (k : Type u) [Field k] (r : ℕ) :
    hilbertSamuelEuler k (Fin r → k) 0 = r := sorry

-- TEST euler_multiplicity_zp_free
example (p : ℕ) [Fact p.Prime] (r : ℕ) :
    hilbertSamuelEuler ℤ_[p] (Fin r → ℤ_[p]) 1 = r := sorry

-- TEST euler_multiplicity_zp_torsion
example (p : ℕ) [Fact p.Prime] (M : Type u) [AddCommGroup M] [Module ℤ_[p] M]
    [Module.Finite ℤ_[p] M] (h : ∃ n : ℕ, ∀ m : M, (p^n : ℤ_[p]) • m = 0) :
    hilbertSamuelEuler ℤ_[p] M 1 = 0 := sorry
end SuggestedTest
end EulerMultiplicity
end TauCeti.ArithmeticDuality
