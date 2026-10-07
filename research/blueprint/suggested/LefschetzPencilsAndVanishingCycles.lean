/-
Suggested Lean forms for the roadmap "Lefschetz pencils, nearby cycles and vanishing cycles"
(`LefschetzPencilsAndVanishingCycles`, layers LPV.0–LPV.7).

This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/LefschetzPencilsAndVanishingCycles.md is definitive, with its two part
packets. The statements below suggest Lean forms so that contributors and reviewers converge on
names and signatures. No implementation is claimed: every node keeps implementationStatus
`unchecked`, and every nontrivial proof is `sorry`.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

How the file is organized.
* It joins the suggested files of the two parts: first the LPV.0 part (layers LPV.0–LPV.6, in the
  namespaces `TauCeti.AlgebraicGeometry.VanishingCycles`, `TauCeti.AlgebraicGeometry.Quadric` and
  `TauCeti.AlgebraicGeometry.LefschetzPencil`, with its unit tests gathered in one block), then the
  LPV.7 part (namespace `TauCeti.LPV7`, a working namespace that the packet records). Every name
  is the name its packet gives.
* Tau Ceti. The LPV.0 part used `TauCeti.genericFiber`, `TauCeti.specialFiber`,
  `LinearMap.GeneralLinearGroup.IsUnipotent` and `TauCeti.exp_smul_eq_sum_smul_dividedPower`.
  The shared build at the pins has no compiled Tau Ceti modules, so the two fibre constructions are
  restated below, verbatim from TauCeti/AlgebraicGeometry/Fibers.lean at the pin (as Over-pullbacks
  along the generic and residue-field points), and nothing else from Tau Ceti is imported. An
  implementation imports the Tau Ceti module instead of this restatement.
* Omitted signatures. A statement whose hypotheses have no pinned form is not asserted without
  them. Where the missing premise is a geometric object (an actual nearby-cycle functor, a
  Lefschetz pencil, a perverse t-structure, a spectral object of a filtered complex) and the form
  would be false for arbitrary arguments, the declaration is kept in a comment marked
  "Omitted signature", with its name, its node, the missing premises, a counterexample to the
  premise-free form, and the suggested form once the premises exist. Where the missing premise can
  be stated with Mathlib's vocabulary (coefficients prime to the residue characteristic, a strictly
  henselian residue field, generation by transvections, Frobenius conjugation, finite type over a
  finite field), it is stated. Data-valued `sorry` (a functor, an object, a map that exists) stays.
* Packet agreement. Every definition, API item and unit test the packets name appears in this
  file under that name, as a declaration or in an omitted signature; unit tests are the
  `example`s whose docstrings carry their names.
-/

import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.OpenImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Properties
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.Algebra.Homology.SpectralObject.SpectralSequence
import Mathlib.Algebra.Homology.ShortComplex.Exact
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.CategoryTheory.Triangulated.TStructure.Heart
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Sites.ConstantSheaf
import Mathlib.CategoryTheory.Action.Basic
import Mathlib.CategoryTheory.Comma.Basic
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Defs
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.FDRep
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.LinearAlgebra.Transvection.Basic
import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.CliffordAlgebra.Even
import Mathlib.LinearAlgebra.QuadraticForm.Radical
import Mathlib.LinearAlgebra.QuadraticForm.TensorProduct
import Mathlib.RingTheory.Valuation.RamificationGroup
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Nilpotent.Exp
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Algebra.Lie.SkewAdjoint
import Mathlib.Algebra.Lie.Semisimple.Defs
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Algebra.Rat
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Tactic.Ring

set_option autoImplicit false

noncomputable section

local instance : Fact (Nat.Prime 2) := ⟨by decide⟩

/-! ## Prelude: the generic and special fibres of Tau Ceti, restated

`TauCeti.genericFiber` and `TauCeti.specialFiber` as in TauCeti/AlgebraicGeometry/Fibers.lean at
the pinned commit (there universe-polymorphic; here in universe 0, which is all the file uses). -/

namespace TauCeti

open CategoryTheory AlgebraicGeometry

/-- The scalar extension of a scheme over Spec R along R → K, as an object over Spec K. -/
abbrev genericFiber (R K : Type) [CommRing R] [CommRing K] [Algebra R K]
    {X : Scheme.{0}} (toBase : X ⟶ Spec (.of R)) : Over (Spec (.of K)) :=
  (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).obj (Over.mk toBase)

/-- The fibre of a scheme over a local ring at the closed point, over the residue field. -/
abbrev specialFiber (R : Type) [CommRing R] [IsLocalRing R]
    {X : Scheme.{0}} (toBase : X ⟶ Spec (.of R)) :
    Over (Spec (.of (IsLocalRing.ResidueField R))) :=
  (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R (IsLocalRing.ResidueField R))))).obj
    (Over.mk toBase)

end TauCeti

/-! ## The LPV.0 part: layers LPV.0–LPV.6

Nearby and vanishing cycles on the small étale sites (LPV.0), local monodromy (LPV.1), ordinary
quadratic singularities and Picard–Lefschetz (LPV.2), Lefschetz pencils (LPV.3), global vanishing
cycles (LPV.4), irreducibility and open symplectic monodromy (LPV.5) and perverse nearby cycles
(LPV.6). The unit tests of these layers are gathered in one block after the Perverse section. -/




open CategoryTheory CategoryTheory.Limits CategoryTheory.Triangulated CategoryTheory.Pretriangulated AlgebraicGeometry
open scoped TensorProduct

namespace TauCeti.AlgebraicGeometry.VanishingCycles

/- LPV.0. These use the actual sheaf category and its standard derived localization.
Constructible/adic subcategories and continuous actions are omitted supplier conditions. -/
abbrev EtaleSheaf (X : Scheme.{0}) (Λ : Type) [Ring Λ] :=
  Sheaf X.smallEtaleTopology (ModuleCat Λ)

instance (X : Scheme.{0}) (Λ : Type) [Ring Λ] : HasDerivedCategory (EtaleSheaf X Λ) :=
  HasDerivedCategory.standard _

instance (Λ : Type) [Ring Λ] : HasDerivedCategory (ModuleCat Λ) :=
  HasDerivedCategory.standard _

abbrev EtaleD (X : Scheme.{0}) (Λ : Type) [Ring Λ] := DerivedCategory (EtaleSheaf X Λ)

def constantComplex (X : Scheme.{0}) (Λ : Type) [CommRing Λ] : EtaleD X Λ :=
  (DerivedCategory.singleFunctor (EtaleSheaf X Λ) 0).obj
    ((CategoryTheory.constantSheaf X.smallEtaleTopology (ModuleCat Λ)).obj (ModuleCat.of Λ Λ))

structure HenselianTrait where
  R : Type
  [ring : CommRing R]
  [domain : IsDomain R]
  [dvr : IsDiscreteValuationRing R]
  [henselian : HenselianLocalRing R]
  K : Type
  [field : Field K]
  [algebra : Algebra R K]
  [fraction : IsFractionRing R K]
  valuation : ValuationSubring (AlgebraicClosure K)
  extendsBase : valuation.toSubring.comap (algebraMap K (AlgebraicClosure K)) =
    (⊤ : Subring R).map (algebraMap R K)

attribute [instance] HenselianTrait.ring HenselianTrait.domain HenselianTrait.dvr
  HenselianTrait.henselian HenselianTrait.field HenselianTrait.algebra HenselianTrait.fraction

/-- Coefficients killed by an integer invertible on the trait, the hypothesis of SGA 7 XIII 2.1.1
(ℓ invertible on S). The nearby-cycle theorems below assume it. -/
def IsAdmissibleCoefficient (S : HenselianTrait) (Λ : Type) [CommRing Λ] : Prop :=
  ∃ n : ℕ, 0 < n ∧ (n : Λ) = 0 ∧ IsUnit (n : S.R)

namespace HenselianTrait
abbrev inertia (S : HenselianTrait) := S.valuation.inertiaSubgroup S.K
-- Full residue-Galois surjectivity is omitted: this is its exact kernel component.
theorem inertia_exact (S : HenselianTrait) : S.inertia =
    MonoidHom.ker (MulSemiringAction.toRingAut (S.valuation.decompositionSubgroup S.K)
      (IsLocalRing.ResidueField S.valuation)) := by sorry
abbrev genericFiber (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) :=
  TauCeti.genericFiber S.R S.K f
abbrev specialFiber (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) :=
  TauCeti.specialFiber S.R f
end HenselianTrait

def trivialActionFunctor (C : Type*) [Category C] (I : Type*) [Group I] : C ⥤ Action C I where
  obj X := Action.trivial I X
  map f := { hom := f, comm := by sorry }

abbrev OrientedFibreTopos (C : Type*) [Category C] (I : Type*) [Group I] :=
  Comma (trivialActionFunctor C I) (𝟭 (Action C I))

namespace OrientedFibreTopos
variable {C : Type*} [Category C] {I : Type*} [Group I]
def sp_pullback : C ⥤ OrientedFibreTopos C I where
  obj X := ⟨X, Action.trivial I X, 𝟙 _⟩
  map f := { left := f, right := { hom := f, comm := by sorry }, w := by sorry }
abbrev etaPart : OrientedFibreTopos C I ⥤ Action C I := Comma.snd _ _
/- **Omitted signature** `equivSheavesOnTrait` (node `LPV.0/fibre-product-topos-Y-times-S`).
  The equivalence holds for continuous actions and, unless the residue field is separably closed, with the residue-Galois descent data of SGA 7 XIII 1.2.2. `Action` records neither, so the displayed type asserts an equivalence that fails (a discontinuous action of the profinite inertia is not a sheaf).
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Omitted: continuity and the residue-Galois descent part of PR196.
    def equivSheavesOnTrait (S : HenselianTrait) (Λ : Type) [Ring Λ] :
        EtaleSheaf (Spec (.of S.R)) Λ ≌ OrientedFibreTopos (ModuleCat Λ) S.inertia := by sorry
-/
end OrientedFibreTopos

section Gluing
variable {Λ : Type} [Ring Λ] {I : Type*} [Group I]
variable (A : OrientedFibreTopos (ModuleCat Λ) I)
-- coker(sp) is the degree-zero model of the vanishing object. It is not coker(σ−1).
def variation (σ : I) : cokernel A.hom.hom ⟶ A.right.V := by sorry
def quotientInertia (σ : I) : cokernel A.hom.hom ⟶ cokernel A.hom.hom := by sorry
theorem variation_left (σ : I) : cokernel.π A.hom.hom ≫ variation A σ =
    (A.right.ρ σ - 1 : End A.right.V) := by sorry
theorem variation_right (σ : I) : variation A σ ≫ cokernel.π A.hom.hom =
    quotientInertia A σ - 𝟙 _ := by sorry
theorem variation_mul (σ τ : I) : variation A (σ * τ) =
    variation A τ ≫ cokernel.π A.hom.hom ≫ variation A σ +
      variation A σ + variation A τ := by sorry
theorem variation_wellDefined (σ : I) :
    A.hom.hom ≫ ((A.right.ρ σ - 1 : End A.right.V)) = 0 := by sorry
end Gluing

section GeometricCycles
variable (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R))
variable (Λ : Type) [CommRing Λ]
-- Geometric scalar extensions use algebraic closures, not rational fibres.
abbrev geometricGeneric : Scheme.{0} :=
  pullback f (Spec.map (CommRingCat.ofHom
    ((algebraMap S.K (AlgebraicClosure S.K)).comp (algebraMap S.R S.K))))
abbrev geometricSpecial : Scheme.{0} :=
  pullback f (Spec.map (CommRingCat.ofHom
    ((algebraMap (IsLocalRing.ResidueField S.R)
      (AlgebraicClosure (IsLocalRing.ResidueField S.R))).comp
        (algebraMap S.R (IsLocalRing.ResidueField S.R)))))

def psiEta : EtaleSheaf (S.genericFiber f).left Λ ⥤
    Action (EtaleSheaf (geometricSpecial S f) Λ) S.inertia := by sorry
def psi : EtaleSheaf X Λ ⥤
    OrientedFibreTopos (EtaleSheaf (geometricSpecial S f) Λ) S.inertia := by sorry
theorem psi_leftExact : PreservesFiniteLimits (psi S f Λ) := by sorry
/- **Omitted signature** `psi_pushforward` (node `LPV.0/functor-psi-and-functorialities`).
  The exchange Ψ g_* → g_* Ψ is defined for a morphism g over the trait and is invertible for g proper (XIII 1.3.6): `push` and `pushGlue` must be g_* and its fibre analogue. As typed, the arguments are arbitrary functors (push = 0, pushGlue = 𝟭), and the isomorphism fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The actual direct-image functors are supplied by PR196. Their geometric square is omitted.
    def psi_pushforward {Y : Scheme.{0}} (g : Y ⟶ Spec (.of S.R))
        (push : EtaleSheaf X Λ ⥤ EtaleSheaf Y Λ)
        (pushGlue : OrientedFibreTopos (EtaleSheaf (geometricSpecial S f) Λ) S.inertia ⥤
          OrientedFibreTopos (EtaleSheaf (geometricSpecial S g) Λ) S.inertia) :
        push ⋙ psi S g Λ ≅ psi S f Λ ⋙ pushGlue := by sorry
-/

def RPsi : EtaleD X Λ ⥤ OrientedFibreTopos (EtaleD (geometricSpecial S f) Λ) S.inertia := by sorry
def RPhi : EtaleD X Λ ⥤ Action (EtaleD (geometricSpecial S f) Λ) S.inertia := by sorry
def vanishingTriangle (K : EtaleD X Λ) : Triangle (EtaleD (geometricSpecial S f) Λ) := by sorry
/- **Omitted signature** `RPsi_stalk` (node `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`).
  The stalk of RΨ at a geometric point is the cohomology of the strict-local Milnor fibre (XIII 2.1.4); `stalk` and `milnorCohomology` must be that stalk functor and that cohomology. As typed, the arguments are arbitrary: an isomorphism to any object.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The Milnor tube and its cohomology/stalk functors are supplied by the site's owner.
    def RPsi_stalk (K : EtaleD X Λ)
        (stalk : EtaleD (geometricSpecial S f) Λ ⥤ DerivedCategory (ModuleCat Λ))
        (milnorCohomology : DerivedCategory (ModuleCat Λ)) :
        stalk.obj ((RPsi S f Λ).obj K).right.V ≅ milnorCohomology := by sorry
-/
-- Local acyclicity and the locally constant cohomology condition cannot yet be stated. Only the
-- smooth constant-coefficient case is prototyped, with coefficients prime to the residue characteristic.
theorem RPhi_eq_zero_iff_locallyAcyclic [Smooth f] (hΛ : IsAdmissibleCoefficient S Λ) :
    IsZero ((RPhi S f Λ).obj (constantComplex X Λ)).V := by sorry
end GeometricCycles

/- LPV.1: finite logarithm, kernel-image filtration, maximal unipotence. -/
section LinearMonodromy
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V]
variable [Algebra ℚ (Module.End K V)]
def finiteLog (U : Module.End K V) (d : ℕ) : Module.End K V :=
  ∑ j ∈ Finset.Ico 1 d, ((-1 : K) ^ (j + 1) / (j : K)) • U ^ j
theorem finiteLog_bound_independent (U : Module.End K V) {d e : ℕ}
    (hd : U ^ d = 0) (he : U ^ e = 0) : finiteLog U d = finiteLog U e := by sorry
theorem finiteLog_nilpotent (U : Module.End K V) {d : ℕ} (hd : U ^ d = 0) :
    IsNilpotent (finiteLog U d) := by sorry
theorem finiteLog_exp (U : Module.End K V) {d : ℕ} (hd : U ^ d = 0) :
    IsNilpotent.exp (finiteLog U d) = 1 + U := by sorry
-- Tate twists and geometric inertia are omitted. This is the scalar identity they use.
theorem finiteLog_twisted (N : Module.End K V) (d : ℕ) (hN : N ^ d = 0) (t : K) :
    finiteLog (IsNilpotent.exp (t • N) - 1) d = t • N := by sorry

theorem finiteLog_conj (e : V ≃ₗ[K] V) (U : Module.End K V) (d : ℕ) :
    finiteLog (e.toLinearMap * U * e.symm.toLinearMap) d =
      e.toLinearMap * finiteLog U d * e.symm.toLinearMap := by sorry

def monodromyFiltration (N : Module.End K V) (c i : ℤ) : Submodule K V :=
  ⨆ a : ℕ, ⨆ b : ℕ, ⨆ (_ : (a : ℤ) - b = i - c),
    LinearMap.ker (N ^ (a + 1)) ⊓ LinearMap.range (N ^ b)
abbrev Gr (M : ℤ → Submodule K V) (i : ℤ) :=
  M i ⧸ (M (i - 1)).comap (M i).subtype
theorem monodromyFiltration_mono (N : Module.End K V) (hN : IsNilpotent N) (c : ℤ) :
    Monotone (monodromyFiltration N c) ∧
      ∃ a b : ℤ, monodromyFiltration N c a = ⊥ ∧ monodromyFiltration N c b = ⊤ := by sorry
theorem monodromyFiltration_lowering (N : Module.End K V) (hN : IsNilpotent N) (c i : ℤ) :
    (monodromyFiltration N c i).map N ≤ monodromyFiltration N c (i - 2) := by sorry
def monodromyGradedPower (N : Module.End K V) (hN : IsNilpotent N) (c : ℤ) (r : ℕ) :
    Gr (monodromyFiltration N c) (c + r) →ₗ[K]
      Gr (monodromyFiltration N c) (c - r) := by sorry
theorem monodromyGradedPower_bijective (N : Module.End K V) (hN : IsNilpotent N)
    (c : ℤ) (r : ℕ) : Function.Bijective (monodromyGradedPower N hN c r) := by sorry
theorem monodromyFiltration_scalar (N : Module.End K V) (c : ℤ) {a : K} (ha : a ≠ 0) :
    monodromyFiltration (a • N) c = monodromyFiltration N c := by sorry
theorem monodromyFiltration_conj (e : V ≃ₗ[K] V) (N : Module.End K V) (c i : ℤ) :
    (monodromyFiltration N c i).map e.toLinearMap =
      monodromyFiltration (e.toLinearMap * N * e.symm.toLinearMap) c i := by sorry
def gradedN (N : Module.End K V) (hN : IsNilpotent N) (c i : ℤ) :
    Gr (monodromyFiltration N c) i →ₗ[K] Gr (monodromyFiltration N c) (i - 2) := by sorry
def primitivePart (N : Module.End K V) (hN : IsNilpotent N) (c i : ℤ) :=
  LinearMap.ker (gradedN N hN c i)

def IsMaximallyNilpotent (N : Module.End K V) : Prop :=
  0 < Module.finrank K V ∧ N ^ Module.finrank K V = 0 ∧
    N ^ (Module.finrank K V - 1) ≠ 0
def IsMaximallyUnipotent (T : V ≃ₗ[K] V) : Prop :=
  IsMaximallyNilpotent (T.toLinearMap - 1)
theorem maximalLog_iff (T : V ≃ₗ[K] V) (d : ℕ) (h : (T.toLinearMap - 1) ^ d = 0) :
    IsMaximallyUnipotent T ↔ IsMaximallyNilpotent (finiteLog (T.toLinearMap - 1) d) := by sorry
theorem maximalNilpotent_kernel_rank (N : Module.End K V) (h : IsMaximallyNilpotent N) (j : ℕ) :
    Module.finrank K (LinearMap.ker (N ^ j)) = min j (Module.finrank K V) := by sorry
theorem maximalNilpotent_conj (e : V ≃ₗ[K] V) (N : Module.End K V) :
    IsMaximallyNilpotent (e.toLinearMap * N * e.symm.toLinearMap) ↔
      IsMaximallyNilpotent N := by sorry
end LinearMonodromy

section Trace
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V] {I : Type*} [Group I] [Fintype I]
-- One finite-inertia graded piece. The full complex sums these traces with degree signs.
def inertiaTrace (ρ : Representation K I V) (F : Module.End K V)
    (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) : K :=
  LinearMap.trace K _ (F.restrict hF)
-- Refinement through an equivariant isomorphism; exact filtrations require E0's enhancement.
theorem inertiaTrace_refinement (ρ : Representation K I V) (F : Module.End K V)
    (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) :
    inertiaTrace ρ F hF = LinearMap.trace K _ (F.restrict hF) := by sorry
theorem inertiaTrace_additive (ρ : Representation K I V) (F G : Module.End K V)
    (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants)
    (hG : ∀ v ∈ ρ.invariants, G v ∈ ρ.invariants)
    (hFG : ∀ v ∈ ρ.invariants, (F + G) v ∈ ρ.invariants) :
    inertiaTrace ρ (F + G) hFG = inertiaTrace ρ F hF + inertiaTrace ρ G hG := by sorry
theorem inertiaTrace_frobeniusLift (ρ : Representation K I V) (F : Module.End K V)
    (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) (g : I)
    (hFg : ∀ v ∈ ρ.invariants, (F * ρ g) v ∈ ρ.invariants) :
    inertiaTrace ρ (F * ρ g) hFg = inertiaTrace ρ F hF := by sorry
end Trace

-- A finite-inertia graded cohomology piece is an actual finite-dimensional module with
-- an action, a Frobenius endomorphism preserving its invariants, and its cohomological degree.
structure FiniteInertiaPiece (K : Type) [Field K] where
  V : Type
  [add : AddCommGroup V]
  [module : Module K V]
  [finite : FiniteDimensional K V]
  I : Type
  [group : Group I]
  [fintype : Fintype I]
  rho : Representation K I V
  frobenius : Module.End K V
  preserves : ∀ v ∈ rho.invariants, frobenius v ∈ rho.invariants
  degree : ℤ
attribute [instance] FiniteInertiaPiece.add FiniteInertiaPiece.module FiniteInertiaPiece.finite
  FiniteInertiaPiece.group FiniteInertiaPiece.fintype

def semisimpleTrace {K : Type} [Field K] [CharZero K] (pieces : List (FiniteInertiaPiece K)) : K :=
  (pieces.map fun P => (-1 : K) ^ P.degree * inertiaTrace P.rho P.frobenius P.preserves).sum

-- Concrete graded lines used by the trace examples, with genuinely trivial finite inertia.
def trivialGradedLine (a : ℚ) (degree : ℤ) : FiniteInertiaPiece ℚ where
  V := ℚ
  I := Unit
  rho := Representation.trivial ℚ Unit ℚ
  frobenius := a • 1
  preserves := by sorry
  degree := degree
/- **Omitted signature** `semisimpleTrace_refinement` (node `LPV.1/semisimple-nearby-trace`).
  Two admissible finite-inertia gradings of one complex with a common exact refinement have the same semisimple trace (G-review-semisimple-trace-source). For arbitrary lists it fails: [] has trace 0, [trivialGradedLine 1 0] has trace 1.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Omitted: these are the finite-inertia pieces of two admissible filtrations of the same
    -- cohomology representation, with a genuine common exact refinement.
    theorem semisimpleTrace_refinement {K : Type} [Field K] [CharZero K]
        (pieces refined : List (FiniteInertiaPiece K)) : semisimpleTrace pieces = semisimpleTrace refined := by sorry
-/
/- **Omitted signature** `semisimpleTrace_additive` (node `LPV.1/semisimple-nearby-trace`).
  For an equivariant distinguished triangle, the lists must be admissible gradings of its three vertices. As typed, the arguments are arbitrary lists, unrelated to the triangle.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The equivariant distinguished triangle is actual; the identification of its three lists
    -- with the admissible cohomological gradings is an omitted supplier condition.
    theorem semisimpleTrace_additive {K : Type} [Field K] [CharZero K]
        (T : Triangle (DerivedCategory (ModuleCat K))) (hT : T ∈ distTriang _)
        (A B C : List (FiniteInertiaPiece K)) : semisimpleTrace B = semisimpleTrace A + semisimpleTrace C := by sorry
-/

def changeFrobenius {K : Type} [Field K] (P : FiniteInertiaPiece K) (g : P.I) : FiniteInertiaPiece K :=
  { P with frobenius := P.frobenius * P.rho g, preserves := by sorry }
theorem semisimpleTrace_frobeniusLift {K : Type} [Field K] [CharZero K]
    (P : FiniteInertiaPiece K) (g : P.I) :
    semisimpleTrace [changeFrobenius P g] = semisimpleTrace [P] := by sorry

section TwoComponents
variable {X : Scheme.{0}} {Λ : Type} [CommRing Λ]
-- The objects and restriction/Gysin maps are supplied by PR196/EDC. Their geometric
-- hypotheses and the filtered derived enhancement are omitted, not stored as opaque Props.
def twoComponentNearbyComplex (C D₁ D₂ : EtaleD X Λ)
    (restriction₁ : D₁ ⟶ C) (restriction₂ : D₂ ⟶ C)
    (gysin₁ : C ⟶ D₁⟦(2 : ℤ)⟧) (gysin₂ : C ⟶ D₂⟦(2 : ℤ)⟧) :
    ℤ ⥤ EtaleD X Λ := by sorry
/- **Omitted signature** `twoComponentNearbyComplex_grades` (node `LPV.1/two-component-semistable-nearby-complex`).
  `graded` and `twist` must be the associated-graded and Tate-twist functors of the filtered derived category (E0). As typed, the arguments are arbitrary functors (graded constant zero), and the isomorphisms fail.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem twoComponentNearbyComplex_grades (filtered : ℤ ⥤ EtaleD X Λ)
        (graded : (ℤ ⥤ EtaleD X Λ) ⥤ (ℤ ⥤ EtaleD X Λ))
        (C D₁ D₂ : EtaleD X Λ) (twist : EtaleD X Λ ⥤ EtaleD X Λ) :
        Nonempty ((graded.obj filtered).obj 1 ≅ (twist.obj C)⟦(-1 : ℤ)⟧) ∧
        Nonempty ((graded.obj filtered).obj 0 ≅ (D₁ ⊞ D₂)) ∧
        Nonempty ((graded.obj filtered).obj (-1) ≅ C⟦(-1 : ℤ)⟧) := by sorry
-/
-- The monodromy map is attached to the two-component model. Coherent filtered descent,
-- and its identification with the identity on the outer grades, are E0 supplier conditions.
def twoComponentN (C D₁ D₂ : EtaleD X Λ)
    (r₁ : D₁ ⟶ C) (r₂ : D₂ ⟶ C)
    (g₁ : C ⟶ D₁⟦(2 : ℤ)⟧) (g₂ : C ⟶ D₂⟦(2 : ℤ)⟧)
    (twist : EtaleD X Λ ⥤ EtaleD X Λ) :
    (twoComponentNearbyComplex C D₁ D₂ r₁ r₂ g₁ g₂).obj 2 ⟶
      twist.obj ((twoComponentNearbyComplex C D₁ D₂ r₁ r₂ g₁ g₂).obj 2) := by sorry
theorem twoComponentNearbyComplex_monodromy (C D₁ D₂ : EtaleD X Λ)
    (r₁ : D₁ ⟶ C) (r₂ : D₂ ⟶ C)
    (g₁ : C ⟶ D₁⟦(2 : ℤ)⟧) (g₂ : C ⟶ D₂⟦(2 : ℤ)⟧)
    (twist : EtaleD X Λ ⥤ EtaleD X Λ) :
    twoComponentN C D₁ D₂ r₁ r₂ g₁ g₂ twist ≫
      twist.map (twoComponentN C D₁ D₂ r₁ r₂ g₁ g₂ twist) = 0 := by sorry
/- **Omitted signature** `twoComponentNearbyComplex_resolves` (node `LPV.1/two-component-semistable-nearby-complex`).
  `realize` must be the filtered totalization and `nearby` the actual RΨΛ (Illusie 2021 §6.3). As typed, the arguments are arbitrary: an isomorphism between any two objects.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def twoComponentNearbyComplex_resolves (filtered : ℤ ⥤ EtaleD X Λ)
        (realize : (ℤ ⥤ EtaleD X Λ) ⥤ EtaleD X Λ) (nearby : EtaleD X Λ) :
        realize.obj filtered ≅ nearby := by sorry
-/
end TwoComponents

end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.Quadric
open LinearMap (BilinForm)
section Models
variable {k : Type} [Field k] {V : Type} [AddCommGroup V] [Module k V]
variable [FiniteDimensional k V]
-- Projectivization, closed immersion, dimension and coordinate-free descent are SF.2
-- supplier conditions. These data-valued prototypes describe the quadratic models only.
def projectiveQuadric (Q : QuadraticForm k V) : Scheme.{0} := by sorry
def affineQuadric (Q : QuadraticForm k V) (b : k) : Scheme.{0} := by sorry
def quadraticSeries {r : ℕ} (Q : QuadraticForm k (Fin r → k)) : MvPowerSeries (Fin r) k := by sorry
def evenCliffordCentre (Q : QuadraticForm k V) := Subalgebra.center k (CliffordAlgebra.even Q)
-- Etaleness/Azumaya structures await SF.2. Rank two is the algebraic specialization.
theorem evenCliffordCentre_isEtale (Q : QuadraticForm k V)
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (hr : Even (Module.finrank k V))
    (hpos : 0 < Module.finrank k V) : Module.finrank k (evenCliffordCentre Q) = 2 := by sorry
-- Hypotheses that W is maximal totally isotropic are explicit in the characterization.
def lagrangianIdempotent (Q : QuadraticForm k V) (W : Submodule k V)
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (hW : ∀ x ∈ W, Q x = 0)
    (hd : 2 * Module.finrank k W = Module.finrank k V) : evenCliffordCentre Q := by sorry
theorem lagrangianIdempotent_eq_iff (Q : QuadraticForm k V)
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (W₁ W₂ : Submodule k V)
    (h₁ : ∀ x ∈ W₁, Q x = 0) (h₂ : ∀ x ∈ W₂, Q x = 0)
    (hd₁ : 2 * Module.finrank k W₁ = Module.finrank k V)
    (hd₂ : 2 * Module.finrank k W₂ = Module.finrank k V) :
    lagrangianIdempotent Q W₁ hQ h₁ hd₁ = lagrangianIdempotent Q W₂ hQ h₂ hd₂ ↔
      Even (Module.finrank k (W₁ ⧸ (W₁ ⊓ W₂).comap W₁.subtype)) := by sorry
-- Spectrum of the actual centre; finite-étale scheme structure is the preceding supplier gap.
def discriminantCover (Q : QuadraticForm k V) : Scheme.{0} := by sorry
def ambientProjective (Q : QuadraticForm k V) : Scheme.{0} := by sorry
end Models

-- The geometric fibre, over the algebraic closure of the actual residue field.
abbrev geometricFiber {X S : Scheme.{0}} (f : X ⟶ S) (s : S) : Scheme.{0} :=
  pullback f (Spec.map (CommRingCat.ofHom
    (algebraMap (S.residueField s) (AlgebraicClosure (S.residueField s)))) ≫ S.fromSpecResidueField s)
-- Projective-model descent and the relative dimension API are omitted supplier conditions.
def IsSmoothQuadric {X S : Scheme.{0}} (f : X ⟶ S) (n : ℕ) : Prop :=
  IsProper f ∧ Smooth f ∧ ∀ s : S,
    ∃ Q : QuadraticForm (AlgebraicClosure (S.residueField s))
      (Fin (n + 2) → AlgebraicClosure (S.residueField s)),
        QuadraticMap.Nondegenerate (Q := Q) ∧
          Nonempty (geometricFiber f s ≅ projectiveQuadric Q)
-- Completed local ring A is supplied by SF Part II, never a replacement sheaf carrier.
def IsOrdinaryQuadraticPoint (k A : Type) [Field k] [CommRing A] (r : ℕ) : Prop :=
  ∃ Q : QuadraticForm k (Fin r → k), QuadraticMap.Nondegenerate (Q := Q) ∧
    Nonempty (A ≃+* (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q}))
def IsNondegenerateQuadraticPoint (k A : Type) [Field k] [CommRing A] (r : ℕ) : Prop :=
  ∃ Q : QuadraticForm k (Fin r → k), (QuadraticMap.polarBilin Q).Nondegenerate ∧
    Nonempty (A ≃+* (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q}))
-- Additional API below is after the field IsOrdinary definition preserved from the input.
end TauCeti.AlgebraicGeometry.Quadric

namespace TauCeti.AlgebraicGeometry.VanishingCycles
-- A quadratic polynomial is Q(x)+L(x)+a. Its homogenization and scheme maps are supplied.
structure StandardQuadraticDegeneration where
  trait : HenselianTrait
  rank : ℕ
  Q : QuadraticForm trait.R (Fin rank → trait.R)
  linear : (Fin rank → trait.R) →ₗ[trait.R] trait.R
  constant : trait.R
  total : Scheme.{0}
  toBase : total ⟶ Spec (.of trait.R)
  -- Omitted supplier conditions: generic/special fibre ordinarity, cone equation,
  -- invertible coefficients, the affine chart and the projective-closure identification.

namespace StandardQuadraticDegeneration
def vertex (D : StandardQuadraticDegeneration) : (D.trait.specialFiber D.toBase).left := by sorry
def projectiveClosure (D : StandardQuadraticDegeneration) : Scheme.{0} := by sorry
def discriminantCharacter (D : StandardQuadraticDegeneration) : D.trait.inertia →* ℤˣ := by sorry
def ofLocalEquation (S : HenselianTrait) (r : ℕ)
    (Q : QuadraticForm S.R (Fin r → S.R)) (b : S.R) : StandardQuadraticDegeneration := by sorry
end StandardQuadraticDegeneration
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.LefschetzPencil
-- The projective embedding, codimension-two axis and incidence scheme are supplied by SF.2.
-- The genuine singular-locus condition below uses neighborhoods on which f is smooth.
def smoothAt {X Y : Scheme.{0}} (f : X ⟶ Y) (x : X) : Prop :=
  ∃ U : X.Opens, x ∈ U ∧ Smooth (U.ι ≫ f)
def singularSet {X D : Scheme.{0}} (f : X ⟶ D) : Set D :=
  f '' {x | ¬ smoothAt f x}
def IsLefschetzPencil {X D : Scheme.{0}} (f : X ⟶ D) : Prop :=
  IsProper f ∧ Flat f ∧ (singularSet f).Finite ∧
    ∀ t ∈ singularSet f, ∃! x : X, f x = t ∧ ¬ smoothAt f x
-- Omitted: ordinarity of each unique singular point, smooth total space and axis transversality.
-- totalSpace's input is the incidence model; it does not reconstruct the general blowup owner.
def totalSpace (incidenceModel : Scheme.{0}) : Scheme.{0} := incidenceModel
/- **Omitted signature** `totalSpace_iso_blowup` (node `LPV.3/lefschetz-pencil`).
  Under axis transversality the incidence total space is the blowup of X along A ∩ X. As typed, the arguments are arbitrary: an isomorphism between any two schemes.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def totalSpace_iso_blowup (incidenceModel blowupModel : Scheme.{0}) :
        totalSpace incidenceModel ≅ blowupModel := by sorry
-/
def localModel {X D : Scheme.{0}} (f : X ⟶ D) (S : Scheme.{0}) (g : S ⟶ D) := pullback f g

-- The conormal incidence and projection come from the supplied embedding. The closure
-- includes hyperplanes containing X, not just singular sections of the expected dimension.
def dualVariety {C Pdual : Scheme.{0}} (conormalProjection : C ⟶ Pdual) : Set Pdual :=
  closure (Set.range conormalProjection)
theorem mem_dualVariety_iff {C Pdual : Scheme.{0}} (p : C ⟶ Pdual)
    (hp : IsClosedMap p) (t : Pdual) : t ∈ dualVariety p ↔ ∃ x, p x = t := by sorry
theorem dualVariety_isIrreducible {C Pdual : Scheme.{0}} (p : C ⟶ Pdual)
    (hC : IsIrreducible (Set.univ : Set C)) : IsIrreducible (dualVariety p) := by sorry
/- **Omitted signature** `incidence_smooth_off_dual` (node `LPV.3/dual-variety`).
  g must be the incidence family of X and p its conormal projection. For unrelated g and p the conclusion fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The supplied incidence map g and its relation to p are omitted geometric hypotheses.
    theorem incidence_smooth_off_dual {C Pdual Y : Scheme.{0}} (p : C ⟶ Pdual)
        (g : Y ⟶ Pdual) (y : Y) (hy : g y ∉ dualVariety p) : smoothAt g y := by sorry
-/
/- **Omitted signature** `singularSet_eq_inter_dual` (node `LPV.3/dual-variety`).
  f must be the pencil over the line D ⊂ P̌ and p the conormal projection of the same X. For unrelated `line` and `p` the equality fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem singularSet_eq_inter_dual {X D C Pdual : Scheme.{0}} (f : X ⟶ D)
        (h : IsLefschetzPencil f) (p : C ⟶ Pdual) (line : D ⟶ Pdual) :
        singularSet f = line ⁻¹' dualVariety p := by sorry
-/

section VanishingSpace
open LinearMap (BilinForm)
variable {K V G S : Type*} [Field K] [AddCommGroup V] [Module K V] [Group G]
-- δ is a geometric generator at a chosen base path. Changing the path uses the action.
def vanishingCycle (ρ : Representation K G V) (δ : S → V) (s : S) (g : G) : V := ρ g (δ s)
theorem vanishingCycle_changePath (ρ : Representation K G V) (δ : S → V) (s : S) (g h : G) :
    vanishingCycle ρ δ s (g * h) = ρ g (vanishingCycle ρ δ s h) := by sorry
def vanishingSubspace (ρ : Representation K G V) (δ : S → V) : Submodule K V :=
  Submodule.span K (Set.range fun sg : S × G => vanishingCycle ρ δ sg.1 sg.2)
theorem vanishingSubspace_stable (ρ : Representation K G V) (δ : S → V) (g : G) :
    (vanishingSubspace ρ δ).map (ρ g) = vanishingSubspace ρ δ := by sorry
-- Local Picard–Lefschetz geometry is omitted; the coefficient and sign are retained.
theorem localMonodromy_vanishingCycle (B : BilinForm K V) (δ x : V) (c : K) :
    LinearMap.transvection (c • B.flip δ) δ x = x + c • B x δ • δ := by sorry
abbrev vanishingQuotient (B : BilinForm K V) (E : Submodule K V) :=
  E ⧸ (E ⊓ B.orthogonal E).comap E.subtype
def vanishingForm (B : BilinForm K V) (E : Submodule K V)
    (hsym : B.IsSymm ∨ B.IsAlt) :
    BilinForm K (vanishingQuotient B E) := by sorry
theorem vanishingForm_nondegenerate (B : BilinForm K V) (E : Submodule K V)
    (hsym : B.IsSymm ∨ B.IsAlt) : (vanishingForm B E hsym).Nondegenerate := by sorry
theorem vanishingForm_isAlt (B : BilinForm K V) (E : Submodule K V) (hB : B.IsAlt) :
    (vanishingForm B E (Or.inr hB)).IsAlt := by sorry
-- The symplectic group is the actual subgroup of linear equivalences preserving B.
def formPreservingGroup (B : BilinForm K V) : Subgroup (V ≃ₗ[K] V) where
  carrier := {g | ∀ x y, B (g x) (g y) = B x y}
  one_mem' := by simp
  mul_mem' := by intro g h hg hh x y; exact (hg _ _).trans (hh _ _)
  inv_mem' := by sorry
def monodromyRep (B : BilinForm K V) (E : Submodule K V)
    (hsym : B.IsSymm ∨ B.IsAlt) (ρ : Representation K G V)
    (hE : ∀ g, E.map (ρ g) = E) (hB : ∀ g x y, B (ρ g x) (ρ g y) = B x y) :
    G →* formPreservingGroup (vanishingForm B E hsym) := by sorry
end VanishingSpace
end TauCeti.AlgebraicGeometry.LefschetzPencil

namespace TauCeti.AlgebraicGeometry.LefschetzPencil

open LinearMap (BilinForm)

section FixedSpace

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- A Picard–Lefschetz transvection x ↦ x + c (x, δ) δ fixes x exactly when (x, δ) = 0, for c ≠ 0 and δ ≠ 0
(node `LPV.4/fixed-space-of-the-local-transvections`). -/
theorem transvection_apply_eq_self_iff (B : BilinForm K V) {δ : V} (hδ : δ ≠ 0) {c : K} (hc : c ≠ 0) (x : V) :
    LinearMap.transvection (c • B.flip δ) δ x = x ↔ B x δ = 0 := by
  simp [LinearMap.transvection.apply, hδ, hc]

/-- The common fixed space of the local transvections is E^⊥, E the span of the vanishing cycles (Weil I 5.3). -/
theorem forall_transvection_apply_eq_self_iff {ι : Type*} (B : BilinForm K V) (δ : ι → V) (c : ι → K)
    (hc : ∀ i, c i ≠ 0) (x : V) :
    (∀ i, LinearMap.transvection (c i • B.flip (δ i)) (δ i) x = x) ↔ ∀ i, B x (δ i) = 0 := by
  refine forall_congr' fun i => ?_
  by_cases hδ : δ i = 0
  · simp [hδ]
  · exact transvection_apply_eq_self_iff B hδ (hc i) x

/-- Test `vanishingCycle_swap_conic`: in the n = 0 conic pencil, H⁰(X_u) = ℚ² and δ = e₁ − e₂; the reflection
x ↦ x − (x, δ)δ, with (x, δ) = x₀ − x₁, swaps the two points: e₁ ↦ e₂. -/
example : LinearMap.transvection (-(LinearMap.proj (R := ℚ) (φ := fun _ : Fin 2 => ℚ) 0 - LinearMap.proj 1)) ![1, -1]
    ![1, 0] = ![0, 1] := by
  ext i; fin_cases i <;> simp [LinearMap.transvection.apply]

/-- Test `vanishingCycle_fixed_conic`: the same reflection fixes e₁ + e₂, which spans E^⊥. -/
example : LinearMap.transvection (-(LinearMap.proj (R := ℚ) (φ := fun _ : Fin 2 => ℚ) 0 - LinearMap.proj 1)) ![1, -1]
    ![1, 1] = ![1, 1] := by
  ext i; fin_cases i <;> simp [LinearMap.transvection.apply]

end FixedSpace

section LieLemma

attribute [local instance 100] LieRing.ofAssociativeRing

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- N(δ) : x ↦ ψ(x, δ) δ, the logarithm of the Picard–Lefschetz transvection. -/
def nilpotentOfVector (ψ : BilinForm k V) (δ : V) : Module.End k V :=
  (ψ.flip δ).smulRight δ

theorem nilpotentOfVector_apply (ψ : BilinForm k V) (δ x : V) : nilpotentOfVector ψ δ x = ψ x δ • δ := rfl

/-- N(δ)² = 0 when ψ is alternating. -/
theorem nilpotentOfVector_sq (ψ : BilinForm k V) (hψ : ψ.IsAlt) (δ : V) : nilpotentOfVector ψ δ ^ 2 = 0 := by
  ext x
  simp [pow_two, nilpotentOfVector_apply, hψ δ]

/-- N(δ) lies in sp(V, ψ) when ψ is alternating. -/
theorem nilpotentOfVector_mem_sp (ψ : BilinForm k V) (hψ : ψ.IsAlt) (δ : V) :
    nilpotentOfVector ψ δ ∈ skewAdjointLieSubalgebra ψ := by
  sorry

/-- Weil I, Lemma 5.11: a Lie subalgebra of sp(V, ψ), char k = 0, for which V is simple and which is generated by
operators N(δᵢ), is all of sp(V, ψ) (node `LPV.5/symplectic-lie-algebra-generated-by-transvections`). -/
theorem eq_sp_of_isIrreducible_of_generated [CharZero k] [FiniteDimensional k V] (ψ : BilinForm k V)
    (hψ : ψ.IsAlt) (hnd : ψ.Nondegenerate) (L : LieSubalgebra k (Module.End k V))
    (hL : L ≤ skewAdjointLieSubalgebra ψ) [LieModule.IsIrreducible k L V] {ι : Type*} (δ : ι → V)
    (hgen : LieSubalgebra.lieSpan k (Module.End k V) (Set.range fun i => nilpotentOfVector ψ (δ i)) = L) :
    L = skewAdjointLieSubalgebra ψ := by
  sorry

end LieLemma

section Hermitian

/-- Test `hermitian_curve_not_lefschetz`: along the direction (u, v) at (a, b), the Hermitian polynomial
x^{p+1} + y^{p+1} + 1 in characteristic p expands with linear term a^p u + b^p v and next term in t^p. When
a^p u + b^p v = 0 (the tangent direction) the contact order is at least p. -/
example {R : Type*} [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p] (a b u v t : R) :
    (a + t * u) ^ (p + 1) + (b + t * v) ^ (p + 1) + 1 =
      (a ^ (p + 1) + b ^ (p + 1) + 1) + t * (a ^ p * u + b ^ p * v) + t ^ p * (a * u ^ p + b * v ^ p) +
        t ^ (p + 1) * (u ^ (p + 1) + v ^ (p + 1)) := by
  have h1 := add_pow_char a (t * u) p
  have h2 := add_pow_char b (t * v) p
  rw [pow_succ, pow_succ, h1, h2]
  ring

end Hermitian

end TauCeti.AlgebraicGeometry.LefschetzPencil

namespace TauCeti.AlgebraicGeometry.Quadric

section OrdinaryForm

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- Deligne's ordinary quadratic form over a field (SGA 7 XII 1.1, with `car(A) = 2` in case b)): the polar form is
nondegenerate when the rank is even or the characteristic is not 2; in characteristic 2 and odd rank, the polar kernel
is a line on which `Q` does not vanish (node `LPV.2/ordinary-quadratic-form`). -/
def IsOrdinary (Q : QuadraticForm k V) : Prop :=
  ((Even (Module.finrank k V) ∨ ringChar k ≠ 2) → (QuadraticMap.polarBilin Q).Nondegenerate) ∧
  ((Odd (Module.finrank k V) ∧ ringChar k = 2) →
    Module.finrank k (LinearMap.ker (QuadraticMap.polarBilin Q)) = 1 ∧
      ∀ v ∈ LinearMap.ker (QuadraticMap.polarBilin Q), v ≠ 0 → Q v ≠ 0)

/-- For `V ≠ 0` over a field, ordinary is Mathlib's `QuadraticMap.Nondegenerate` (Elman–Karpenko–Merkurjev). -/
theorem isOrdinary_iff_nondegenerate [FiniteDimensional k V] [Nontrivial V] (Q : QuadraticForm k V) :
    IsOrdinary Q ↔ QuadraticMap.Nondegenerate (Q := Q) := by
  sorry

end OrdinaryForm

section Tables

/-- Test `affineQuadric_trace_delta_sq_even`: for m even the generatrix classes have Gram matrix [[1, 0], [0, 1]]
(XII 3.3 (iii)(b)), so δ = cℓ(α) − cℓ(β) has Tr(δ²) = 2 = (−1)^m·2. -/
example : dotProduct (![1, -1] : Fin 2 → ℤ) (Matrix.mulVec (1 : Matrix (Fin 2) (Fin 2) ℤ) ![1, -1]) = 2 := by
  simp [dotProduct, Matrix.mulVec, Fin.sum_univ_two]

/-- Test `affineQuadric_trace_delta_sq_odd`: for m odd the Gram matrix is [[0, 1], [1, 0]], so Tr(δ²) = −2. -/
example : dotProduct (![1, -1] : Fin 2 → ℤ) (Matrix.mulVec !![0, 1; 1, 0] ![1, -1]) = -2 := by
  simp [dotProduct, Matrix.mulVec, Fin.sum_univ_two]

/-- Test `pointCount_quadric_surface`: XII 3.4 with n = 2, m = 1: a split quadric surface has
1 + q + q² + q = (1 + q)² points, the nonsplit one 1 + q + q² − q = 1 + q². -/
example (q : ℤ) : (1 + q + q ^ 2) + q = (1 + q) ^ 2 ∧ (1 + q + q ^ 2) - q = 1 + q ^ 2 := by
  constructor <;> ring

end Tables

end TauCeti.AlgebraicGeometry.Quadric

namespace TauCeti.AlgebraicGeometry.VanishingCycles

/-- Test `variation_even_sign`: in XV (2.2.5.6), for ε(σ) = −1 the coefficient ((ε(σ) − 1)/2)(−1)^m is (−1)^{m+1},
which is the sign of Weil I (4.1) for n = 2m (−, + for n ≡ 0, 2 mod 4). -/
example (m : ℕ) : (-1 : ℤ) * (-1) ^ m = (-1) ^ (m + 1) := by ring

/-- Test `delta_characterisation_composite`: in ℤ/15, u = 4 satisfies u² = 1 but u ≠ ±1, so (δ, δ) = (−1)^m·2 does not
characterise ±δ for Λ = ℤ/15 (source issue E11 on SGA 7 XV 2.2.6). -/
example : (4 : ZMod 15) ^ 2 = 1 ∧ (4 : ZMod 15) ≠ 1 ∧ (4 : ZMod 15) ≠ -1 := by decide

/-- A 2-primary lift does not synchronize the signs at distinct odd primes:
19 has norm one modulo 60 and reduces to the offending 4 modulo 15. -/
example : (19 : ZMod 60) ^ 2 = 1 ∧ (19 : ZMod 15) = 4 ∧
    (19 : ZMod 15) ≠ 1 ∧ (19 : ZMod 15) ≠ -1 := by decide

end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.Quadric
section API
variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V] [FiniteDimensional k V]
-- Mathlib quadratic baseChange currently requires 2 invertible. The characteristic-two
-- base-change construction is a missing supplier condition, explicitly omitted here.
theorem IsOrdinary.baseChange {k' : Type*} [Field k'] [Algebra k k']
    [Invertible (2 : k)] [Invertible (2 : k')]
    (Q : QuadraticForm k V) (h : IsOrdinary Q) : IsOrdinary (Q.baseChange k') := by sorry
theorem isOrdinary_iff_polar_nondegenerate (Q : QuadraticForm k V)
    (h : Even (Module.finrank k V) ∨ ringChar k ≠ 2) :
    IsOrdinary Q ↔ (QuadraticMap.polarBilin Q).Nondegenerate := by sorry
theorem isOrdinary_iff_of_char_two (Q : QuadraticForm k V)
    (hc : ringChar k = 2) (hr : Odd (Module.finrank k V)) :
    IsOrdinary Q ↔ Module.finrank k (LinearMap.ker (QuadraticMap.polarBilin Q)) = 1 ∧
      ∀ v ∈ LinearMap.ker (QuadraticMap.polarBilin Q), v ≠ 0 → Q v ≠ 0 := by sorry
end API
section GeometricAPI
variable {k : Type} [Field k] {r : ℕ}
-- The model's structure morphism and line bundles are supplied by SF.2.
theorem isSmoothQuadric_of_isOrdinary (Q : QuadraticForm k (Fin (r + 2) → k))
    (h : IsOrdinary Q) (f : projectiveQuadric Q ⟶ Spec (.of k)) : IsSmoothQuadric f r := by sorry
theorem isSmoothQuadric_zero_iff {X S : Scheme.{0}} (f : X ⟶ S) :
    IsSmoothQuadric f 0 ↔ Etale f ∧ IsProper f ∧
      ∀ s : S, Nat.card (geometricFiber f s) = 2 := by sorry
/- **Omitted signature** `canonical_iso` (node `LPV.2/smooth-quadric`).
  Ω^n_{X/S} ≅ O_X(−n) for a smooth quadric of relative dimension n. As typed, the arguments are arbitrary: an isomorphism between any two sheaves.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The geometric cardinality, rather than rational residue-field points, is intended above.
    -- The differential/top-exterior and O(-n) functors are supplied actual sheaf objects.
    def canonical_iso {X : Scheme.{0}} {Λ : Type} [CommRing Λ]
        (topDifferentials negativeTwist : TauCeti.AlgebraicGeometry.VanishingCycles.EtaleSheaf X Λ) :
        topDifferentials ≅ negativeTwist := by sorry
-/
-- Completion, characteristic and descent hypotheses are in the packet.
theorem isNondegenerate_iff (k A : Type) [Field k] [CommRing A] (r : ℕ) :
    IsNondegenerateQuadraticPoint k A r ↔
      IsOrdinaryQuadraticPoint k A r ∧ (ringChar k ≠ 2 ∨ Even r) := by sorry
/- **Omitted signature** `isOrdinaryQuadraticPoint_baseChange` (node `LPV.2/ordinary-quadratic-point`).
  Ordinarity is invariant under a field extension k ⊂ k′ with A′ the completed base change of A. As typed, A and A′ are unrelated (A ordinary, A′ = k′).
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem isOrdinaryQuadraticPoint_baseChange (k A k' A' : Type)
        [Field k] [CommRing A] [Field k'] [CommRing A'] (r : ℕ) :
        IsOrdinaryQuadraticPoint k A r ↔ IsOrdinaryQuadraticPoint k' A' r := by sorry
-/
theorem isOrdinaryQuadraticPoint_cone (Q : QuadraticForm k (Fin r → k))
    (h : IsOrdinary Q) :
    IsOrdinaryQuadraticPoint k (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q}) r := by sorry
end GeometricAPI
end TauCeti.AlgebraicGeometry.Quadric

namespace TauCeti.AlgebraicGeometry.VanishingCycles
section LinearTheorems
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V]
/- **Omitted signature** `geometricQuasiUnipotence` (node `LPV.1/geometric-quasi-unipotence`).
  The theorem concerns the inertia action on the ℓ-adic cohomology of a finite-type family (Illusie 1994 §1.4), whose geometric realization has no pinned form. For an arbitrary representation it fails: ℤ acting on ℚ by powers of 2 has no finite-index subgroup acting unipotently.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Geometric identification with constant-coefficient étale cohomology is omitted.
    theorem geometricQuasiUnipotence {I : Type*} [Group I] (ρ : Representation K I V) :
        ∃ H : Subgroup I, H.index ≠ 0 ∧ ∀ g ∈ H, IsNilpotent (ρ g - 1) := by sorry
-/
-- The Kummer character comparison supplies N' = eN. Its valuation condition is omitted.
theorem monodromyRamificationRescaling (N N' : Module.End K V) (e : ℕ)
    (he : e ≠ 0) (h : N' = (e : K) • N) :
    monodromyFiltration N' 0 = monodromyFiltration N 0 := by sorry
theorem primitiveDecomposition (N : Module.End K V) (hN : IsNilpotent N) (i : ℤ) :
    (monodromyFiltration N 0 (i + 2)).map N =
      LinearMap.range N ⊓ monodromyFiltration N 0 i := by sorry
-- Tensor and symmetric powers use the imported tensor API. This is the dual part.
theorem monodromyTensorDual (N : Module.End K V) (hN : IsNilpotent N) (i : ℤ) :
    monodromyFiltration (-N.dualMap) 0 i =
      (monodromyFiltration N 0 (-i - 1)).dualAnnihilator := by sorry
-- Relative opposite-graded-power isomorphisms on Gr^W are omitted pending the filtered
-- derived/module interface. No blanket existence statement is made.
-- N on each actual associated graded of W, and the filtration induced by M there.
def inducedGradedN (N : Module.End K V) (W : ℤ → Submodule K V)
    (hW : ∀ w, (W w).map N ≤ W w) (w : ℤ) : Module.End K (Gr W w) := by sorry
def inducedGradedFiltration (W M : ℤ → Submodule K V) (w i : ℤ) : Submodule K (Gr W w) :=
  ((M i).comap (W w).subtype).map (Submodule.mkQ ((W (w - 1)).comap (W w).subtype))
-- The condition on each Gr^W is genuine monodromy filtration data; it does not assume
-- M=M' or the existence of a relative filtration for an arbitrary pair (W,N).
theorem relativeMonodromyUnique (N : Module.End K V) (hN : IsNilpotent N)
    (W M M' : ℤ → Submodule K V) (hNW : ∀ w, (W w).map N ≤ W w)
    (monoW : Monotone W) (monoM : Monotone M) (monoM' : Monotone M')
    (finiteW : ∃ a b, W a = ⊥ ∧ W b = ⊤)
    (finiteM : ∃ a b, M a = ⊥ ∧ M b = ⊤)
    (finiteM' : ∃ a b, M' a = ⊥ ∧ M' b = ⊤)
    (lower : ∀ i, (M i).map N ≤ M (i - 2))
    (lower' : ∀ i, (M' i).map N ≤ M' (i - 2))
    (graded : ∀ w, inducedGradedFiltration W M w =
      monodromyFiltration (inducedGradedN N W hNW w) w)
    (graded' : ∀ w, inducedGradedFiltration W M' w =
      monodromyFiltration (inducedGradedN N W hNW w) w) : M = M' := by sorry
/- **Omitted signature** `normalCrossingsTameRestriction` (node `LPV.1/normal-crossings-tame-restriction`).
  The residues N_a are the logarithms of a commuting tame Kummer action on the restriction to a stratum (Weil II 1.7.8–10). For an arbitrary family the conclusion fails (two non-commuting matrix units).
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- A stratum's Kummer-cover construction is the omitted geometric condition on this family.
    theorem normalCrossingsTameRestriction {ι : Type*} (N : ι → Module.End K V) :
        ∀ i j, Commute (N i) (N j) := by sorry
-/
-- Frobenius q-scaling in a chosen Tate basis. Geometric Frobenius F conjugates a unipotent inertia
-- element T to T^(1/q) = exp(q⁻¹ log T); that conjugation is the hypothesis, its geometric origin
-- (the tame quotient of inertia, R01.2) is omitted.
theorem twistedMonodromyEquivariance [Algebra ℚ (Module.End K V)] (T F : Module.End K V) (d : ℕ)
    (hT : (T - 1) ^ d = 0) (hF : IsUnit F) (q : K) (hq : q ≠ 0)
    (hFrob : F * T = IsNilpotent.exp (q⁻¹ • finiteLog (T - 1) d) * F) :
    finiteLog (T - 1) d * F = q • (F * finiteLog (T - 1) d) := by sorry
end LinearTheorems

section DerivedTheorems
variable (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R))
variable (Λ : Type) [CommRing Λ]
-- Each supplier square is geometric; arbitrary functors alone do not imply an exchange.
-- Properness/smoothness/invertibility/constructibility are specified in the packet.
theorem derivedFunctorialitiesAndSpecializationSequence (K : EtaleD X Λ) :
    vanishingTriangle S f Λ K ∈ distTriang (EtaleD (geometricSpecial S f) Λ) := by sorry
def geometricFibreSiteMaps :
    EtaleSheaf X Λ ⥤ EtaleSheaf (geometricGeneric S f) Λ := by sorry
/- **Omitted signature** `orientedProductTraitComparison` (node `LPV.0/oriented-product-comparison`).
  The comparison is between the oriented product over the trait and the generic part of X_s ×_s S. An arbitrary site (C, J) has no such equivalence.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def orientedProductTraitComparison (C : Type*) [Category C] (J : GrothendieckTopology C) :
        Sheaf J (ModuleCat Λ) ≌ Action (EtaleSheaf (geometricSpecial S f) Λ) S.inertia := by sorry
-/
/- **Omitted signature** `nearbyCyclesConstructible` (node `LPV.0/constructibility-and-finite-amplitude`).
  For X of finite type over an excellent henselian trait and K bounded constructible with coefficients killed by an integer invertible on S, RΨK is bounded with constructible cohomology. Excellence and constructibility have no pinned form, and without them, or for unbounded K, boundedness fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Bounded constructibility awaits ConstructibleEtale/PR196. Ordinary boundedness is genuine.
    theorem nearbyCyclesConstructible (K : EtaleD X Λ) : ∃ a b : ℤ,
        (DerivedCategory.TStructure.t).IsGE ((RPsi S f Λ).obj K).right.V a ∧
        (DerivedCategory.TStructure.t).IsLE ((RPsi S f Λ).obj K).right.V b := by sorry
-/
/- **Omitted signature** `nearbyCyclesCoefficientTraitChange` (node `LPV.0/coefficient-and-trait-change`).
  For a finite coefficient map Λ → Λ′, RΦ commutes with derived extension of scalars on finite-Tor complexes (XIII 2.1.13); `extX` and `extPhi` must be those extensions. As typed, the arguments are arbitrary functors.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def nearbyCyclesCoefficientTraitChange {Λ' : Type} [CommRing Λ']
        (extX : EtaleD X Λ ⥤ EtaleD X Λ')
        (extPhi : Action (EtaleD (geometricSpecial S f) Λ) S.inertia ⥤
          Action (EtaleD (geometricSpecial S f) Λ') S.inertia) :
        RPhi S f Λ ⋙ extPhi ≅ extX ⋙ RPhi S f Λ' := by sorry
-/
/- **Omitted signature** `adicNearbyCycleRealization` (node `LPV.0/adic-nearby-cycle-realization`).
  `realize` and `adicPhi` must be the derived adic realization and the adic RΦ of a compatible system (E4, EDC.6). As typed, the arguments are arbitrary functors.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Adic realization and Huber comparison are supplied functors, not replacement categories.
    def adicNearbyCycleRealization {A : Type*} [Category A]
        (realize : Action (EtaleD (geometricSpecial S f) Λ) S.inertia ⥤ A)
        (adicPhi : EtaleD X Λ ⥤ A) : RPhi S f Λ ⋙ realize ≅ adicPhi := by sorry
-/
/- **Omitted signature** `schemeAdicNearbyComparison` (node `LPV.0/scheme-adic-trait-comparison`).
  `analyticPhi` must be Huber's adic nearby-cycle functor on its admissible finite-type domain (gap G-adic-comparison). As typed, the arguments are arbitrary functors.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def schemeAdicNearbyComparison {A : Type*} [Category A]
        (realize : Action (EtaleD (geometricSpecial S f) Λ) S.inertia ⥤ A)
        (analyticPhi : EtaleD X Λ ⥤ A) : RPhi S f Λ ⋙ realize ≅ analyticPhi := by sorry
-/
/- **Omitted signature** `normalizedCanVar` (node `LPV.1/normalized-can-var`).
  On the unipotent part, var = Var ∘ (log T/(T − 1)) satisfies var ∘ can = N; `can`, `var` and `N` must be the canonical map, the normalized variation and the logarithm. For three unrelated morphisms it fails (can = 0, N ≠ 0).
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Normalized can/var are morphisms, with domain order and Tate twist retained.
    theorem normalizedCanVar (K : EtaleD (geometricSpecial S f) Λ)
        (Phi twistK : EtaleD (geometricSpecial S f) Λ)
        (can : K ⟶ Phi) (var : Phi ⟶ twistK) (N : K ⟶ twistK) : can ≫ var = N := by sorry
-/
end DerivedTheorems

section Perverse
variable {X Y : Scheme.{0}} {Λ : Type} [CommRing Λ]
-- Supplied t-structures are the actual TStructure objects. EDC.5 identifies them with the
-- dimension/costalk perverse conditions. Excellence and constructibility are omitted here.
variable (pX : TStructure (EtaleD X Λ)) (pY : TStructure (EtaleD Y Λ))
variable (nearby vanishing : EtaleD X Λ ⥤ EtaleD Y Λ)
/- **Omitted signature** `nearbyPerverseExact` (node `LPV.6/nearby-perverse-exactness`).
  `nearby` must be the geometric RΨ of a finite-type trait family and pX, pY the rectified perverse t-structures of EDC.5. For arbitrary functors and t-structures it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem nearbyPerverseExact (K : EtaleD X Λ) (h : pX.IsLE K 0 ∧ pX.IsGE K 0) :
        pY.IsLE ((nearby.obj K)⟦(-1 : ℤ)⟧) 0 ∧ pY.IsGE ((nearby.obj K)⟦(-1 : ℤ)⟧) 0 := by sorry
-/
/- **Omitted signature** `vanishingPerverseExact` (node `LPV.6/vanishing-perverse-exactness`).
  `vanishing` must be the geometric RΦ of a finite-type trait family and pX, pY the rectified perverse t-structures of EDC.5. For arbitrary functors and t-structures it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem vanishingPerverseExact (K : EtaleD X Λ) (h : pX.IsLE K 0 ∧ pX.IsGE K 0) :
        pY.IsLE ((vanishing.obj K)⟦(-1 : ℤ)⟧) 0 ∧ pY.IsGE ((vanishing.obj K)⟦(-1 : ℤ)⟧) 0 := by sorry
-/
/- **Omitted signature** `nearbyVerdierDuality` (node `LPV.6/nearby-verdier-duality`).
  Gabber's RΨ ∘ D_η ≅ D_s ∘ RΨ for the actual nearby functor and Verdier dualities (EDC.1). As typed, the arguments are arbitrary functors.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def nearbyVerdierDuality (dualX : (EtaleD X Λ)ᵒᵖ ⥤ EtaleD X Λ)
        (dualY : (EtaleD Y Λ)ᵒᵖ ⥤ EtaleD Y Λ) :
        nearby.op ⋙ dualY ≅ dualX ⋙ nearby := by sorry
-/
/- **Omitted signature** `nearbyIntermediateExtension` (node `LPV.6/intermediate-extension-exchange`).
  RΨ(j_η!* P) ≅ j_s!*(RΨ P) when both exchange maps are isomorphisms; `jMiddle`, `jMiddle'` must be the intermediate extensions of a compatible pair of open immersions. As typed, the arguments are arbitrary functors.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Both ! and * exchange maps must be invertible. Geometric square and functorial image
    -- construction for j!* are omitted supplier conditions; no unrestricted exchange is asserted.
    def nearbyIntermediateExtension (jMiddle : EtaleD X Λ ⥤ EtaleD X Λ)
        (jMiddle' : EtaleD Y Λ ⥤ EtaleD Y Λ) :
        jMiddle ⋙ nearby ≅ nearby ⋙ jMiddle' := by sorry
-/
/- **Omitted signature** `perverseCoefficientComparison` (node `LPV.6/perverse-coefficients-and-comparison`).
  Compatibility of the perverse nearby functor with coefficient change (EDC.6). As typed, the arguments are arbitrary functors.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def perverseCoefficientComparison {Λ' : Type} [CommRing Λ']
        (extX : EtaleD X Λ ⥤ EtaleD X Λ') (extY : EtaleD Y Λ ⥤ EtaleD Y Λ')
        (nearby' : EtaleD X Λ' ⥤ EtaleD Y Λ') : nearby ⋙ extY ≅ extX ⋙ nearby' := by sorry
-/
/- **Omitted signature** `filteredColimitSupportCriterion` (node `LPV.6/filtered-colimit-support-criterion`).
  Needs the enlarged category of E1/EDC.5 and the commutation of geometric costalks with the colimit under finite cohomological dimension. For an arbitrary t-structure the ≥ 0 part need not be closed under filtered colimits.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The enlarged category must admit the colimit. Ri! commutation and uniformly bounded
    -- cohomological dimension are omitted; finite-level constructibility is not claimed for it.
    theorem filteredColimitSupportCriterion {J : Type*} [SmallCategory J] [IsFiltered J]
        (F : J ⥤ EtaleD X Λ) [HasColimit F] (hF : ∀ j, pX.IsGE (F.obj j) 0) :
        pX.IsGE (colimit F) 0 := by sorry
-/
/- **Omitted signature** `igusaSemiperversityInterface` (node `LPV.6/igusa-semiperversity-interface`).
  Applies the support criterion to the cofinal finite-level formal models of Caraiani–Scholze §4.6 supplied by IG.4; the same premises are missing.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem igusaSemiperversityInterface {J : Type*} [SmallCategory J] [IsFiltered J]
        (F : J ⥤ EtaleD X Λ) [HasColimit F] (d : ℤ)
        (hF : ∀ j, pX.IsGE (F.obj j) d) : pX.IsGE (colimit F) d := by sorry
-/
end Perverse
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
open TauCeti.AlgebraicGeometry
/- All source-specific geometric realizations used in these tests are the omitted supplier
conditions described above. Arithmetic sign/count tests retain the source normalization. -/
/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_top_of_strictlyHenselian`: If V is strictly henselian then Gal(s̄/s) = 1 and I = Gal(η̄/η). -/
example (S : HenselianTrait) [IsSepClosed (IsLocalRing.ResidueField S.R)] : S.inertia = ⊤ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_puiseux`: For V the henselisation of k[t] at (t), k algebraically closed of characteristic 0, I = Gal(η̄/η) ≅ Ẑ(1), acting on t^{1/n} through μ_n. -/
example (S : HenselianTrait) (n : ℕ) (root uniformizer : AlgebraicClosure S.K) (h : root ^ n = uniformizer) (g : S.inertia) : (g.1.1 root) ^ n = g.1.1 uniformizer := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_valuation_inertia`: I coincides with Mathlib's ValuationSubring.inertiaSubgroup for the valuation subring of k(η̄) over V, as a subgroup of the decomposition group, which here is all of Gal(η̄/η). -/
example (S : HenselianTrait) : S.inertia = S.valuation.inertiaSubgroup S.K := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.wild_inertia_ne_bot`: For V = the henselisation of 𝔽̄_p[t] at (t), I is not procyclic: the Artin–Schreier extensions x^p − x = t^{-a} (p ∤ a) give infinitely many independent ℤ/p quotients. -/
example (S : HenselianTrait) (p : ℕ) [Fact p.Prime] [CharP S.K p] : ∃ (χ : S.inertia →* Multiplicative (ZMod p)), Function.Surjective χ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_constant`: The constant sheaf Λ on S is the triple (Λ, Λ, id) with I acting trivially. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (M : ModuleCat Λ) : ((OrientedFibreTopos.sp_pullback (I := I)).obj M).left = M := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_jPushforward`: j_*G for a Gal(η̄/η)-module G is the triple (G^I, G, inclusion). -/
example {Λ : Type} [CommRing Λ] {V : Type} [AddCommGroup V] [Module Λ V] {I : Type} [Group I] (ρ : Representation Λ I V) (v : ρ.invariants) (g : I) : ρ g (v : V) = (v : V) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_degenerate`: For Y = ∅ the category is the terminal one. -/
example (C : Type*) [Category C] [Subsingleton C] (I : Type*) [Group I] (A B : OrientedFibreTopos C I) : A.left = B.left := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.not_triple_of_noninvariant`: For Y = s, a pair (F_s̄, F_η̄) with an equivariant map φ whose image is not in F_η̄^I is not a sheaf on S: the description 1.2.2 forces φ to land in the inertia invariants. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (A : OrientedFibreTopos (ModuleCat Λ) I) (g : I) : A.hom.hom ≫ (A.right.ρ g : End A.right.V) = A.hom.hom := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_trait`: For X = S, Ψ_η(F) is F_η̄ with its Gal(η̄/η)-action. -/
example (S : HenselianTrait) (Λ : Type) [CommRing Λ] (F : EtaleSheaf (S.genericFiber (𝟙 (Spec (.of S.R)))).left Λ) : IsZero F → IsZero ((psiEta S (𝟙 (Spec (.of S.R))) Λ).obj F).V := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_ne_invariants`: For X = S, Ψ_η(F) = F_η̄ differs from i^*j_*F = F_η̄^I whenever I acts nontrivially: using j_* in place of j̄_* loses the inertia action. -/
example (ρ : Representation ℚ (Multiplicative (ZMod 2)) ℚ) (h : ∃ g, ρ g = -1) : ρ.invariants = ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_smooth_constant`: For X smooth over S and Λ constant, Ψ_η(Λ) = Λ, since the strict henselisations of X̄ at points of X_s̄ are normal domains. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) [Smooth f] (Λ : Type) [CommRing Λ]
    (hΛ : IsAdmissibleCoefficient S Λ) :
    Nonempty (((psiEta S f Λ).obj ((constantSheaf _ (ModuleCat Λ)).obj (ModuleCat.of Λ Λ))).V ≅
      (constantSheaf _ (ModuleCat Λ)).obj (ModuleCat.of Λ Λ)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.psi_proper_pushforward_id`: For f = id the base-change map is the identity. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) (Λ : Type) [CommRing Λ] : Nonempty (psi S f Λ ≅ (𝟭 _) ⋙ psi S f Λ) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.variation_one`: Var(1) = 0. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (A : OrientedFibreTopos (ModuleCat Λ) I) : variation A 1 = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.variation_of_phi_zero`: If Φ(K) = 0 then Var(σ) = 0 and I acts trivially on K_η, by σ = 1 + Var(σ) q. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (A : OrientedFibreTopos (ModuleCat Λ) I) (h : IsZero (cokernel A.hom.hom)) (g : I) : variation A g = 0 ∧ A.right.ρ g = 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.variation_picardLefschetz`:
the rank-one expression over rational coefficients is nonzero when the tame parameter,
the pairing and the vanishing vector are all nonzero. Its identification with geometric
Var still requires the ordinary-degeneration model listed in the packet. -/
example (m : ℕ) (t : ℚ) (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ))
    (δ x : Fin 2 → ℚ) (ht : t ≠ 0) (hpair : B x δ ≠ 0) (hδ : δ ≠ 0) :
    ((-1 : ℚ) ^ (m + 1) * t) • B x δ • δ ≠ 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.variation_ne_sub_one`: Var(σ) is not σ − 1: it goes from Φ(K)_η to K_η, and σ − 1 on K_η is Var(σ) ∘ q, which vanishes on the image of K_s. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (A : OrientedFibreTopos (ModuleCat Λ) I) (g : I) : cokernel.π A.hom.hom ≫ variation A g = (A.right.ρ g - 1 : End A.right.V) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_smooth`: For X → S smooth and K = Λ: RΦ(Λ) = 0 and RΨ_η(Λ) = Λ. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) [Smooth f] (Λ : Type) [CommRing Λ]
    (hΛ : IsAdmissibleCoefficient S Λ) : IsZero ((RPhi S f Λ).obj (constantComplex X Λ)).V := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_trait`: For X = S: RΨ_η(K) = K_η̄ with its Gal(η̄/η)-action.
Prototyped as its vanishing-cycle half for the constant complex: RΦ(Λ) = 0 for X = S. -/
example (S : HenselianTrait) (Λ : Type) [CommRing Λ] (hΛ : IsAdmissibleCoefficient S Λ) :
    IsZero ((RPhi S (𝟙 (Spec (.of S.R))) Λ).obj (constantComplex _ Λ)).V := by sorry

/- **Omitted signature** `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_node` (node `LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`).
  Phi must be RΦ(Λ) of the node xy = π over a strictly henselian trait. An arbitrary complex has other homology.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_node`: For X = Spec V[x, y]/(xy − π), π a uniformiser and S strictly henselian: R^iΦ(Λ) = 0 for i ≠ 1, and R^1Φ(Λ) is supported at the origin, free of rank 1 (XV 3.1.2 with n = 1). -/
    example (Phi : DerivedCategory (ModuleCat ℚ)) : ∀ i : ℤ, i ≠ 1 → IsZero ((DerivedCategory.homologyFunctor (ModuleCat ℚ) i).obj Phi) := by sorry
-/

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.specialization_direction`: For f proper the triangle gives H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K): specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) (Λ : Type) [CommRing Λ] (K : EtaleD X Λ) : (vanishingTriangle S f Λ K).mor₁ ≫ (vanishingTriangle S f Λ K).mor₂ = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_zero`: log 1=0. -/
example : finiteLog (0 : Module.End ℚ ℚ) 1 = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_square_zero`: If U²=0 then log(1+U)=U. -/
example (U : Module.End ℚ (Fin 2 → ℚ)) (h : U ^ 2 = 0) : finiteLog U 2 = U := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_three_block`: For U=E₀₁+E₁₂ on Q³, log(1+U)=U−U²/2. -/
example (U : Module.End ℚ (Fin 3 → ℚ)) (h : U ^ 3 = 0) : finiteLog U 3 = U - (1 / 2 : ℚ) • U ^ 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_not_reflection`: The involution −1 on Q is not unipotent, so the finite nilpotent logarithm hypothesis fails. -/
example : ¬ IsNilpotent ((-1 : Module.End ℚ ℚ) - 1) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_zero`: For N=0 the filtration is 0 below c and V at and above c. -/
example (i : ℤ) : monodromyFiltration (0 : Module.End ℚ ℚ) 0 i = if i < 0 then ⊥ else ⊤ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_two_block`: For N(e₁)=e₀ on Q² centered at zero, M_−2=0, M_−1=M_0=Qe₀ and M_1=V. -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : N ^ 2 = 0) (hne : N ≠ 0) : monodromyFiltration N 0 (-1) = LinearMap.range N ∧ monodromyFiltration N 0 1 = ⊤ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_three_block`: For N(e₂)=e₁, N(e₁)=e₀, the weights are −2,0,2 and Gr_−1=Gr_1=0. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : IsMaximallyNilpotent N) : Module.finrank ℚ (monodromyFiltration N 0 (-2)) = 1 ∧ Module.finrank ℚ (monodromyFiltration N 0 0) = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_not_kernel_filtration`: For a two-block, ker N is M_−1, and M_0 is still ker N, whereas ker N² is V. -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : IsMaximallyNilpotent N) : monodromyFiltration N 0 0 = LinearMap.ker N ∧ monodromyFiltration N 0 (-1) ≠ ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_three_block`: The size-three Jordan block is maximally nilpotent. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : N ^ 3 = 0) (h2 : N ^ 2 ≠ 0) : IsMaximallyNilpotent N := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_not_two_plus_one`: A size-two Jordan block plus a trivial line in dimension three is not maximally nilpotent. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : N ^ 2 = 0) : ¬ IsMaximallyNilpotent N := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_one_dimension`: The zero endomorphism of a one-dimensional space is maximally nilpotent; the identity is maximally unipotent. -/
example : IsMaximallyNilpotent (0 : Module.End ℚ ℚ) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_zero_dimension_excluded`: The zero-dimensional vector space does not satisfy the nonzero-dimension definition. -/
example : ¬ IsMaximallyNilpotent (0 : Module.End ℚ (Fin 0 → ℚ)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_trivial`: For a degree-zero trivial inertia line with Frobenius a, the semisimple trace is a. -/
example (a : ℚ) : semisimpleTrace [trivialGradedLine a 0] = a := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_unipotent_block`: For a two-block with graded Frobenius eigenvalues a and qa, the semisimple trace is a+qa, while the trace on invariants is only the eigenvalue of ker N. -/
example (a q : ℚ) (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hgen : ρ (Multiplicative.ofAdd 1) = 1 +
      LinearMap.pi (fun i => if i = 0 then LinearMap.proj 1 else 0))
    (hF : ∀ v ∈ ρ.invariants,
      (LinearMap.pi fun i => (if i = 0 then a else q * a) • LinearMap.proj i) v ∈ ρ.invariants) :
    semisimpleTrace [trivialGradedLine a 0, trivialGradedLine (q * a) 0] = a + q * a ∧
    LinearMap.trace ℚ ρ.invariants
      ((LinearMap.pi fun i => (if i = 0 then a else q * a) • LinearMap.proj i).restrict hF) = a := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_quadratic`: For a nontrivial quadratic finite inertia line, the semisimple trace is 0. -/
example (ρ : Representation ℚ (Multiplicative (ZMod 2)) ℚ) (F : Module.End ℚ ℚ) (h : ∃ g, ρ g = -1) (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) : inertiaTrace ρ F hF = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shift`: Shifting a complex by one negates its semisimple trace. -/
example (a : ℚ) (i : ℤ) :
    semisimpleTrace [trivialGradedLine a (i + 1)] = -semisimpleTrace [trivialGradedLine a i] := by sorry

/- **Omitted signature** `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_node` (node `LPV.1/two-component-semistable-nearby-complex`).
  `graded` must be the associated-graded functor of the filtered complex. For an arbitrary functor the isomorphism fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_node`: For xy=π, the degree-one nearby stalk is Λ(−1). -/
    example {X : Scheme.{0}} {Λ : Type} [CommRing Λ] (C D₁ D₂ : EtaleD X Λ) (r₁ : D₁ ⟶ C) (r₂ : D₂ ⟶ C) (g₁ : C ⟶ D₁⟦(2 : ℤ)⟧) (g₂ : C ⟶ D₂⟦(2 : ℤ)⟧)
        (graded : (ℤ ⥤ EtaleD X Λ) ⥤ (ℤ ⥤ EtaleD X Λ)) :
        Nonempty ((graded.obj (twoComponentNearbyComplex C D₁ D₂ r₁ r₂ g₁ g₂)).obj 0 ≅ (D₁ ⊞ D₂)) := by sorry
-/

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_disjoint`: If C is empty then N=0 and only the center-zero grade remains. -/
example {X : Scheme.{0}} {Λ : Type} [CommRing Λ] (C : EtaleD X Λ) (h : IsZero C) : IsZero (C⟦(-1 : ℤ)⟧) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_not_sheaf_split`: For the nodal local model the cohomology-sheaf inertia action is trivial, but the derived N map on the two outer grades is an isomorphism. -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : N ^ 2 = 0) (hne : N ≠ 0) : finiteLog N 2 ≠ 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_N_square`: The filtered two-component operator has N²=0 and gr₁N equal to identity onto gr_−1(−1). -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : N ^ 2 = 0) : (finiteLog N 2) ^ 2 = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two`: Characteristic 2, r = 3, Q = xy + z²: ker Φ = k·e_z and Q(e_z) = 1, so Q is ordinary (the conic xy = z² is smooth). -/
example : Quadric.IsOrdinary ((QuadraticMap.proj 0 1 + QuadraticMap.proj 2 2) : QuadraticForm (ZMod 2) (Fin 3 → ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two`: Characteristic 2, r = 2, Q = x² + y² = (x + y)²: Φ = 0 and the quadric is a double point, so Q is not ordinary. -/
example : ¬ Quadric.IsOrdinary ((QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1) : QuadraticForm (ZMod 2) (Fin 2 → ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one`: r = 1, Q = ax² with a a unit: the quadric is empty and Q is ordinary in every characteristic. -/
example : Quadric.IsOrdinary (QuadraticMap.sq : QuadraticForm (ZMod 2) (ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test`: Over a field and for V ≠ 0, IsOrdinary Q agrees with Mathlib's QuadraticMap.Nondegenerate Q: in characteristic 2 the alternating Φ has kernel of dimension ≡ r mod 2, so rank ≤ 1 forces 0 or 1 according to the parity of r. -/
example : Quadric.IsOrdinary (QuadraticMap.sq : QuadraticForm ℚ ℚ) ↔ QuadraticMap.Nondegenerate (Q := (QuadraticMap.sq : QuadraticForm ℚ ℚ)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_hyperbolic`: V = Ae ⊕ Af with Q(xe + yf) = xy: C⁺(Q) = Z(Q) ≅ A × A, and the isotropic lines Ae and Af give the two idempotents fe and ef = 1 − fe (XII 1.12, proof). -/
example : Module.finrank ℚ (Quadric.evenCliffordCentre (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 2 → ℚ))) = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_discriminant`: Over a field of characteristic not 2, Q = x² − dy²: C⁺(Q) = k ⊕ k·e₁e₂ with (e₁e₂)² = d, so Z(Q) ≅ k[t]/(t² − d), split if and only if d is a square. -/
example : Module.finrank ℚ (Quadric.evenCliffordCentre ((QuadraticMap.proj 0 0 - 2 • QuadraticMap.proj 1 1) : QuadraticForm ℚ (Fin 2 → ℚ))) = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_eq_mathlib`: C⁺(Q) is Mathlib's CliffordAlgebra.even Q. -/
example (Q : QuadraticForm ℚ (Fin 2 → ℚ)) : Quadric.evenCliffordCentre Q = Subalgebra.center ℚ (CliffordAlgebra.even Q) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_sum`: For an orthogonal sum, e(W₁ ⊕ W₂) = e(W₁)e(W₂) + (1 − e(W₁))(1 − e(W₂)) (XII 1.10.1): the sections add as ℤ/2-torsors, not as idempotents. -/
example (Q : QuadraticForm ℚ (Fin 2 → ℚ)) (W : Submodule ℚ (Fin 2 → ℚ))
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (hW : ∀ x ∈ W, Q x = 0)
    (hd : 2 * Module.finrank ℚ W = 2) :
    Quadric.lagrangianIdempotent Q W hQ hW (by simpa using hd) *
      Quadric.lagrangianIdempotent Q W hQ hW (by simpa using hd) =
      Quadric.lagrangianIdempotent Q W hQ hW (by simpa using hd) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_zero`: n = 0 over an algebraically closed field: X ≅ Spec k ⊔ Spec k. -/
example {X : Scheme.{0}} (f : X ⟶ Spec (.of ℚ)) (h : Quadric.IsSmoothQuadric f 0) : Etale f := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_two`: n = 2: xy = zw in P³ is P¹ × P¹ (Segre). -/
example {X : Scheme.{0}} (f : X ⟶ Spec (.of ℚ)) (h : Quadric.IsSmoothQuadric f 2) : Smooth f ∧ IsProper f := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_real_conic`: n = 1 over ℝ: x² + y² + z² = 0 is a smooth conic without real points, a nontrivial Severi–Brauer curve. -/
example (f : Quadric.projectiveQuadric ((QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1 + QuadraticMap.proj 2 2) : QuadraticForm ℝ (Fin 3 → ℝ)) ⟶ Spec (.of ℝ)) : Quadric.IsSmoothQuadric f 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.not_smoothQuadric_cone`: The cone xy = z² in P³ (a form of rank 3 in 4 variables) is singular at (0:0:0:1); the form is not ordinary. -/
example (f : Quadric.projectiveQuadric (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 3 → ℚ)) ⟶ Spec (.of ℚ)) : ¬ Quadric.IsSmoothQuadric f 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary`: The node xy = 0 in 𝔸² (n = 1): Q = xy is ordinary and nondegenerate in every characteristic. -/
example : Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 2) ℚ ⧸ Ideal.span {Quadric.quadraticSeries (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 2 → ℚ))}) 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two`: n = 0, Y = Spec k[x]/(x²): Q = x² is ordinary in every characteristic, so the origin is ordinary; it is non-degenerate if and only if p ≠ 2, and for p = 2 it is degenerate. -/
example : Quadric.IsOrdinaryQuadraticPoint (ZMod 2) (MvPowerSeries (Fin 1) (ZMod 2) ⧸ Ideal.span {Quadric.quadraticSeries (QuadraticMap.proj 0 0 : QuadraticForm (ZMod 2) (Fin 1 → ZMod 2))}) 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary`: The cusp y² = x³ (n = 1): the quadratic part y² in two variables is not ordinary (its quadric is a double point of P¹), so the cusp is not an ordinary quadratic point. -/
example : ¬ Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 2) ℚ ⧸ Ideal.span {(MvPowerSeries.X (1 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ^ 2 - MvPowerSeries.X (0 : Fin 2) ^ 3}) 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic`: A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension n, not n + 1. -/
example : ¬ Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 1) ℚ) 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.standard_node`: n = 1, Q = xy − π with π a uniformiser: Y = {xy = 0, z = 0} is two points (a smooth quadric of dimension 0), X_s is the cone xy = 0, and the generic fibre is smooth. -/
example (S : HenselianTrait) (π : S.R) : (StandardQuadraticDegeneration.ofLocalEquation S 2 (QuadraticMap.proj 0 1) π).rank = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.standard_double_point`: n = 0, Q = x² − π with p ≠ 2: Y = ∅, X_s = Spec k(s)[x]/(x²) is a cone, and the geometric generic fibre is two points. -/
example (S : HenselianTrait) (π : S.R) : (StandardQuadraticDegeneration.ofLocalEquation S 1 (QuadraticMap.proj 0 0) π).rank = 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.not_standard_char_two`: char k(s) = 2, n = 1, Q = x² + y² − π: the leading form (x + y)² is not ordinary, so (a) fails. -/
example : ¬ Quadric.IsOrdinary (QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1 : QuadraticForm (ZMod 2) (Fin 2 → ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.standard_trivial_family`: Q = xy (c = 0): X_η̄ is again a cone, so (*) fails and all R^iΦ vanish (Corollary 2.2.4). -/
example (S : HenselianTrait) : (StandardQuadraticDegeneration.ofLocalEquation S 2 (QuadraticMap.proj 0 1) 0).constant = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.line_in_plane`: X a line in P², A a point not on X: every line through A meets X transversally in one point, so S = ∅ and f : X̃ = X → D is an isomorphism. This is a Lefschetz pencil with no singular fibre. -/
example (D : Scheme.{0}) : LefschetzPencil.singularSet (𝟙 D) = ∅ := by sorry

/- **Omitted signature** `TauCeti.AlgebraicGeometry.LefschetzPencil.quadric_surface` (node `LPV.3/lefschetz-pencil`).
  f must be the incidence pencil of a smooth quadric surface with a general axis. For an arbitrary f the count is wrong.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.quadric_surface`: X a smooth quadric surface in P³, p ≠ 2, A a general line: S has two points, each X_s is a pair of lines meeting in one point, and X̃ is X blown up in the two points of A ∩ X; χ(X̃) = 6 = 2·2 + 2·1. -/
    -- The supplied f is the incidence model of the general quadric pencil; model conditions
    -- await SF.2. The cardinality tests the actual critical locus in addition to the Euler identity.
    example {X D : Scheme.{0}} (f : X ⟶ D) :
        Nat.card (LefschetzPencil.singularSet f) = 2 ∧ (4 + 2 : ℤ) = 2 * 2 + 2 * 1 := by sorry
-/

/- **Omitted signature** `TauCeti.AlgebraicGeometry.LefschetzPencil.cubic_surface` (node `LPV.3/lefschetz-pencil`).
  f must be the incidence pencil of a smooth cubic surface with a general axis, in characteristic zero. For an arbitrary f the count is wrong.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.cubic_surface`: X a smooth cubic surface in P³, p = 0, A a general line: |S| = 12, the degree 3·2² of the dual surface, each X_s a plane cubic with one node; χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1. -/
    -- The supplied f is the general smooth cubic-surface pencil in characteristic zero.
    example {X D : Scheme.{0}} (f : X ⟶ D) :
        Nat.card (LefschetzPencil.singularSet f) = 12 ∧ (9 + 3 : ℤ) = 2 * 0 + 12 * 1 := by sorry
-/

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.hermitian_curve_not_lefschetz`: p odd, q = p^e, X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²: along the tangent direction (u, v) at an affine point (a, b), with a^q u + b^q v = 0, one has F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1}). So every tangent line meets X with multiplicity ≥ q ≥ 3 at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding. -/
example (p : ℕ) [Fact p.Prime] : p ≠ 2 → 3 ≤ p := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_projectiveSpace`: X = P: every H_t ∩ P = H_t is smooth and P ⊄ H_t, so X̌ = ∅. -/
example {C P : Scheme.{0}} [IsEmpty C] (p : C ⟶ P) : LefschetzPencil.dualVariety p = ∅ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_linear`: X a linear subspace of dimension d, 1 ≤ d < N: X ∩ H_t is always smooth, so X̌ = {t : X ⊂ H_t}, a linear subspace of codimension d + 1 ≥ 2, not a hypersurface. -/
example (d N : ℕ) (hd : 1 ≤ d) (h : d < N) : 2 ≤ d + 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic`: X the conic xz = y² in P², p ≠ 2: X̌ is the conic of lines (a : b : c) with b² = 4ac. -/
example (s t : ℚ) : (-2 * s * t) ^ 2 = 4 * t ^ 2 * s ^ 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic_char_two`: p = 2, X the conic xz = y²: the tangent line at (s² : st : t²) is t²x + s²z = 0, which passes through the nucleus (0 : 1 : 0). So X̌ is a line in P̌² and X → X̌ is purely inseparable of degree 2, not the dual conic. -/
example (s t : ZMod 2) : t ^ 2 * s ^ 2 + s ^ 2 * t ^ 2 = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre`: If S = ∅ (a line in P²) then E = 0. -/
example (ρ : Representation ℚ Unit ℚ) (δ : Empty → ℚ) : LefschetzPencil.vanishingSubspace ρ δ = ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_quadric_surface`: Quadric-surface pencil: |S| = 2 but each δ_s lies in H^1 of a conic, which is 0, so E = 0 (case (b)). -/
example (ρ : Representation ℚ Unit (Fin 0 → ℚ)) (δ : Fin 2 → (Fin 0 → ℚ)) : LefschetzPencil.vanishingSubspace ρ δ = ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_conic`: n = 0, X a smooth conic in P², p ≠ 2, A a general point: X_u is two points, |S| = 2 (the tangents from A), δ_s = ±(e₁ − e₂) for both s, E = ℚ_ℓ(e₁ − e₂) and E^⊥ = ℚ_ℓ(e₁ + e₂). -/
example : LefschetzPencil.vanishingSubspace (Representation.trivial ℚ Unit (Fin 2 → ℚ)) (fun _ : Unit => ![1,-1]) = Submodule.span ℚ {![1,-1]} := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path`: n odd, s ≠ s′ with (δ_s, δ_{s′}) ≠ 0: transporting δ_s around s′ gives δ_s ± t(δ_s, δ_{s′})δ_{s′} ≠ ±δ_s, so the individual vanishing cycles depend on the path while E does not. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ)) (δ : Unit → (Fin 2 → ℚ)) (g : Multiplicative ℤ) (h : ρ g (δ ()) ≠ δ () ∧ ρ g (δ ()) ≠ -δ ()) : LefschetzPencil.vanishingCycle ρ δ () g ≠ LefschetzPencil.vanishingCycle ρ δ () 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero`: If E = 0 (the quadric-surface pencil) the quotient is 0 and ρ is trivial. -/
example (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ)) : Subsingleton (LefschetzPencil.vanishingQuotient B ⊥) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical`: Linear algebra: in V = ℚ_ℓ⁴ with ω(e₁, f₁) = ω(e₂, f₂) = 1, E = span(e₁, f₁, e₂) has radical E ∩ E^⊥ = ℚ_ℓe₂, and ψ on the 2-dimensional quotient is nondegenerate; for E = span(e₁, e₂), E ∩ E^⊥ = E and the quotient is 0. -/
example (B : LinearMap.BilinForm ℚ (Fin 4 → ℚ)) (E : Submodule ℚ (Fin 4 → ℚ)) (hE : Module.finrank ℚ E = 3) (hrad : Module.finrank ℚ ((E ⊓ B.orthogonal E).comap E.subtype) = 1) : Module.finrank ℚ (LefschetzPencil.vanishingQuotient B E) = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic`: n = 0 conic pencil: E = ℚ_ℓ(e₁ − e₂), E ∩ E^⊥ = 0 and ψ(δ, δ) = 2 is a symmetric nondegenerate form on a line. -/
example (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ)) (E : Submodule ℚ (Fin 2 → ℚ)) (h : E ⊓ B.orthogonal E = ⊥) : Module.finrank ℚ (LefschetzPencil.vanishingQuotient B E) = Module.finrank ℚ E := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate`: The restriction of Tr(x ∪ y) to E itself can be degenerate (the radical example), so ρ does not in general land in Sp(E); the target must be the quotient. -/
example (B : LinearMap.BilinForm ℚ (Fin 4 → ℚ)) (E : Submodule ℚ (Fin 4 → ℚ)) (h : E ≤ B.orthogonal E) : Subsingleton (LefschetzPencil.vanishingQuotient B E) := by sorry

end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
open LinearMap (BilinForm)
section LocalFormula
variable {K V I : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V] [Group I]
variable (ρ : Representation K I V) (B : BilinForm K V) (δ : V)
/- **Omitted signature** `evenRelativeDimensionVariation32` (node `LPV.2/even-relative-dimension-variation-3-2`).
  Var must be the variation of an even-dimensional ordinary quadratic degeneration with vanishing cycle δ, ε its quadratic character and B the trace pairing (XV 3.2). For an arbitrary family Var the formula fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The actual cohomological realizations and quadratic-singularity conditions are omitted.
    -- These signatures keep coefficients, characters, parity, and the distinct variation source.
    theorem evenRelativeDimensionVariation32 (m : ℕ) (ε : I →* ℤˣ)
        (Var : I → Module.End K V) (g : I) (x : V) :
        Var g x = (((-1 : K) ^ m) * (((ε g : ℤ) : K) - 1) / 2) • B x δ • δ := by sorry
-/
/- **Omitted signature** `oddRelativeDimensionPicardLefschetz33` (node `LPV.2/odd-relative-dimension-picard-lefschetz-3-3`).
  Var must be the variation of an odd-dimensional ordinary quadratic degeneration, with `tame` the Kummer character of b (XV 3.3). For an arbitrary family Var the formula fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem oddRelativeDimensionPicardLefschetz33 (m : ℕ) (tame : I → K)
        (Var : I → Module.End K V) (g : I) (x : V) :
        Var g x = ((-1 : K) ^ (m + 1) * tame g) • B x δ • δ := by sorry
-/
/- **Omitted signature** `localPicardLefschetzFormula` (node `LPV.2/local-picard-lefschetz-formula`).
  ρ must be the inertia action on H^n(X_η̄) of a proper regular family with one ordinary quadratic point and δ its vanishing cycle (Weil I 4.3). For arbitrary ρ it fails; with δ = 0 it would make every ρ trivial.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem localPicardLefschetzFormula (m : ℕ) (tame : I → K) (g : I) (x : V) :
        ρ g x = x + ((-1 : K) ^ (m + 1) * tame g) • B x δ • δ := by sorry
-/
/- **Omitted signature** `variationInAStandardQuadraticDegeneration` (node `LPV.2/variation-in-a-standard-quadratic-degeneration`).
  Var must be the variation of a standard quadratic degeneration (XV 2.2.5 D). For an arbitrary family Var the formula fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem variationInAStandardQuadraticDegeneration (m : ℕ) (ε : I →* ℤˣ)
        (Var : I → Module.End K V) (g : I) (x : V) :
        Var g x = (((-1 : K) ^ m) * (((ε g : ℤ) : K) - 1) / 2) • B x δ • δ := by sorry
-/
/- **Omitted signature** `wildQuadraticPicardLefschetz` (node `LPV.2/quadratic-character-in-characteristic-two`).
  ρ must be the inertia action of an even-dimensional ordinary quadratic degeneration in residue characteristic two, with ε its Clifford-centre character (Weil II 4.2.1). For arbitrary ρ it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem wildQuadraticPicardLefschetz (m : ℕ) (ε : I →* ℤˣ) (g : I) (x : V) :
        ρ g x = x + (((-1 : K) ^ m) * (((ε g : ℤ) : K) - 1) / 2) • B x δ • δ := by sorry
-/
/- **Omitted signature** `localDescriptionOfTheVanishingCycle` (node `LPV.2/local-description-of-the-vanishing-cycle`).
  (δ, δ) = (−1)^m·2 holds for the geometric vanishing cycle of a 2m-dimensional ordinary quadratic point with the trace pairing. For arbitrary B and δ it fails (B = 0).
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem localDescriptionOfTheVanishingCycle (m : ℕ) : B δ δ = (-1 : K) ^ m * 2 := by sorry
-/
/- **Omitted signature** `fsyDiscriminantExample` (node `LPV.2/fsy-discriminant-example`).
  (δ, δ) = (−1)^m·2 for the orthogonal vanishing line of the Fresán–Sabbah–Yu model. For arbitrary B and δ it fails (B = 0).
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem fsyDiscriminantExample (m : ℕ) : B δ δ = (-1 : K) ^ m * 2 := by sorry
-/
-- The topological/étale comparison functors are supplied by ClassicalEtaleCohomology.
theorem complexPicardLefschetzComparison (n : ℕ) :
    ((if n % 4 < 2 then (-1 : ℤ) else 1) : ℤ) =
      (-1 : ℤ) ^ (n / 2 + 1) := by sorry
end LocalFormula

section LocalCohomology
variable (K : Type) [Field K]
-- The actual local stalk/compact-support cohomology objects are supplied by PR196.
-- Coefficients invertible, quadratic isolation and the specified scheme models are omitted.
variable (Phi nearby cone punctured : DerivedCategory (ModuleCat K)) (n : ℤ)
/- **Omitted signature** `ordinaryQuadraticPointNearbyCycles312` (node `LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`).
  Phi must be RΦ(Λ) of a family with ordinary quadratic singularities, at a point of E (XV 3.1.2). For an arbitrary complex (Phi = 0) the rank-one statement fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem ordinaryQuadraticPointNearbyCycles312 :
        (∀ i : ℤ, i ≠ n → IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj Phi)) ∧
        Module.finrank K ((DerivedCategory.homologyFunctor (ModuleCat K) n).obj Phi) = 1 := by sorry
-/
/- **Omitted signature** `nonordinaryQuadraticConcentration` (node `LPV.2/isolated-nonordinary-quadratic-concentration`).
  Phi must be RΦ ℚ_ℓ at an isolated quadratic singularity in the class of Illusie 2003, Corollary 2.10 (gap G-nonordinary). For an arbitrary complex it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem nonordinaryQuadraticConcentration :
        ∀ i : ℤ, i ≠ n → IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj Phi) := by sorry
-/
/- **Omitted signature** `nearbyCyclesOfAStandardQuadraticDegeneration` (node `LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`).
  `nearby` must be RΨ_η̄Λ of a standard quadratic degeneration with smooth generic fibre (XV 2.2.5). For an arbitrary complex it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem nearbyCyclesOfAStandardQuadraticDegeneration :
        ∀ i : ℤ, i ≠ 0 → i ≠ n →
          IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj nearby) := by sorry
-/
/- **Omitted signature** `cohomologyOfSmoothQuadrics` (node `LPV.2/cohomology-of-smooth-quadrics`).
  The complex must compute the cohomology of a smooth quadric (XII 3.3). For an arbitrary complex the odd vanishing fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem cohomologyOfSmoothQuadrics :
        ∀ i : ℕ, IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) (2 * i + 1)).obj nearby) := by sorry
-/
/- **Omitted signature** `cohomologyOfAffineQuadrics` (node `LPV.2/cohomology-of-affine-quadrics`).
  The complex must compute the cohomology of an affine quadric (XII 3.6–3.7). For an arbitrary complex it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem cohomologyOfAffineQuadrics :
        ∀ i : ℤ, i ≠ 0 → i ≠ n →
          IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj nearby) := by sorry
-/
/- **Omitted signature** `cohomologyOfACone` (node `LPV.2/cohomology-of-a-cone`).
  `cone` must compute the cohomology of an affine cone (XV 2.1.2). For an arbitrary complex it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem cohomologyOfACone :
        ∀ i : ℤ, i ≠ 0 → IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj cone) := by sorry
-/
def cohomologyOfAPuncturedCone (boundary hyperplane : DerivedCategory (ModuleCat K)) :
    Triangle (DerivedCategory (ModuleCat K)) := by sorry
/- **Omitted signature** `homotopyInvarianceOfEtaleCohomology` (node `LPV.2/homotopy-invariance-of-etale-cohomology`).
  f₀ and f₁ must be the fibres at two k-points of a family over a connected finite-type k-scheme (XV 2.1.3). For arbitrary maps the equality fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The homotopy through the supplied connected finite-type scheme is omitted, not replaced
    -- by an assumption that the induced maps are equal.
    theorem homotopyInvarianceOfEtaleCohomology (f₀ f₁ : cone ⟶ nearby) :
        (DerivedCategory.homologyFunctor (ModuleCat K) n).map f₀ =
          (DerivedCategory.homologyFunctor (ModuleCat K) n).map f₁ := by sorry
-/
/- **Omitted signature** `boundaryAnticommutativityForACone` (node `LPV.2/boundary-anticommutativity-for-a-cone`).
  a and b must be the two composite boundary maps of the cone diagram (XV 2.1.8). For arbitrary maps a = −b fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem boundaryAnticommutativityForACone (a b : punctured ⟶ cone) : a = -b := by sorry
-/
end LocalCohomology

section QuadraticNormalForms
variable {k : Type} [Field k]
-- The formal/henselian models and finite-jet approximation map are supplied by SF Part II.
-- These actual ring maps use no Prop-valued placeholder for formal coordinate changes.
-- Omitted: B is the completion of A, J its completed maximal ideal, the coordinates
-- generate the quadratic germ, and the finite-presentation/Jacobian hypotheses hold.
theorem normalFormOfOrdinaryQuadraticForms (m : ℕ)
    (Q : QuadraticForm k (Fin (2 * m) → k)) (hQ : Quadric.IsOrdinary Q) [IsAlgClosed k] :
    ∃ e : (Fin (2 * m) → k) ≃ₗ[k] (Fin (2 * m) → k),
      ∀ x, Q (e x) = ∑ i : Fin m, x ⟨i, by omega⟩ * x ⟨i + m, by omega⟩ := by sorry
/- **Omitted signature** `tjurinaModuleOfAnOrdinaryQuadraticPoint` (node `LPV.2/tjurina-module-of-an-ordinary-quadratic-point`).
  J must be the Jacobian ideal of a presentation of A (XV 1.2.7). For an arbitrary ideal (J = 0) the dimension is wrong.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The Jacobian ideal is the supplied genuine ideal of the completed local ring.
    theorem tjurinaModuleOfAnOrdinaryQuadraticPoint (A : Type) [CommRing A] [Algebra k A]
        (J : Ideal A) (r : ℕ) (h : Quadric.IsNondegenerateQuadraticPoint k A r) :
        Module.finrank k (A ⧸ J) = 1 := by sorry
-/
/- **Omitted signature** `tougeronArtinImplicitFunctionTheorem` (node `LPV.2/tougeron-artin-implicit-function-theorem`).
  The coordinate change must solve the quadratic equations under the Jacobian-square condition of XV 1.1.2 over an excellent henselian base (gap G-approximation). As typed, `formalCoordinate` is an arbitrary automorphism of an arbitrary ring.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem tougeronArtinImplicitFunctionTheorem (A B : Type) [CommRing A] [CommRing B]
        [HenselianLocalRing A] [Algebra A B] (J : Ideal B)
        (d r : ℕ) (coordinates : Fin d → A) (formalCoordinate : B ≃+* B) :
        ∃ approximation : A ≃+* A, ∀ i,
          Ideal.Quotient.mk (J ^ r) (algebraMap A B (approximation (coordinates i))) =
            Ideal.Quotient.mk (J ^ r) (formalCoordinate (algebraMap A B (coordinates i))) := by sorry
-/
-- This is the quadratic application. General Elkik versality remains in the supplier request.
def elkikVersalHenselianDeformations (A : Type) [CommRing A] (r : ℕ)
    (h : Quadric.IsOrdinaryQuadraticPoint k A r) :
    Σ Q : QuadraticForm k (Fin r → k),
      A ≃+* (MvPowerSeries (Fin r) k ⧸ Ideal.span {Quadric.quadraticSeries Q}) := by sorry
def canonicalFormOfAnOrdinaryQuadraticPoint (A : Type) [CommRing A] (r : ℕ)
    (h : Quadric.IsOrdinaryQuadraticPoint k A r) :
    Σ Q : QuadraticForm k (Fin r → k),
      A ≃+* (MvPowerSeries (Fin r) k ⧸ Ideal.span {Quadric.quadraticSeries Q}) := by sorry
def formalEquation {R : Type} [CommRing R] {r : ℕ}
    (Q : QuadraticForm R (Fin r → R)) : MvPowerSeries (Fin r) R := by sorry
/- **Omitted signature** `localEquationOfAFamilyAtAnOrdinaryQuadraticPoint` (node `LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`).
  A must be the henselization of a flat family at an ordinary quadratic point (XV 1.3.2). For an arbitrary ring no such map exists (A = ℚ over a trait of mixed characteristic).
  Its premise-free form, kept for the name and the shape of the conclusion:
    def localEquationOfAFamilyAtAnOrdinaryQuadraticPoint (S : HenselianTrait) (r : ℕ)
        (A : Type) [CommRing A] :
        Σ Q : QuadraticForm S.R (Fin r → S.R),
          Σ b : S.R, A →+* (MvPowerSeries (Fin r) S.R ⧸
            Ideal.span {formalEquation Q - MvPowerSeries.C b}) := by sorry
-/
/- **Omitted signature** `nonSmoothPointsNearAnOrdinaryQuadraticPoint` (node `LPV.2/non-smooth-points-near-an-ordinary-quadratic-point`).
  `completedLocal x` must be the completed local ring of the fibre at x (XV 1.3.4). For an arbitrary assignment it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Ordinary persistence requires the source local-equation hypotheses, omitted here.
    theorem nonSmoothPointsNearAnOrdinaryQuadraticPoint {X Y : Scheme.{0}} (f : X ⟶ Y)
        (completedLocal : X → CommRingCat) (r : ℕ) (x : X)
        (hx : Quadric.IsOrdinaryQuadraticPoint (Y.residueField (f x)) (completedLocal x) r) :
        ∃ U : X.Opens, x ∈ U ∧ ∀ y ∈ U, ¬ LefschetzPencil.smoothAt f y →
          Quadric.IsOrdinaryQuadraticPoint (Y.residueField (f y)) (completedLocal y) r := by sorry
-/
end QuadraticNormalForms

section Specialization
variable {K A B C D E : Type*} [Field K]
variable [AddCommGroup A] [Module K A] [AddCommGroup B] [Module K B]
variable [AddCommGroup C] [Module K C] [AddCommGroup D] [Module K D]
variable [AddCommGroup E] [Module K E]
/- **Omitted signature** `lefschetzDegenerationSpecializationSequence` (node `LPV.2/lefschetz-degeneration-specialization-sequence`).
  The five maps must be those of the specialization sequence of a proper regular family with one ordinary quadratic point (Weil I 4.3.3). Arbitrary linear maps (all zero) are not exact.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The actual cohomology spaces and canonical maps are supplied by PR196/LPV.0.
    -- Degree, properness, ordinary singularity and trace normalization are omitted conditions.
    theorem lefschetzDegenerationSpecializationSequence
        (sp : A →ₗ[K] B) (pair : B →ₗ[K] C) (boundary : C →ₗ[K] D) (sp' : D →ₗ[K] E) :
        Function.Injective sp ∧ LinearMap.range sp = LinearMap.ker pair ∧
        LinearMap.range pair = LinearMap.ker boundary ∧
        LinearMap.range boundary = LinearMap.ker sp' ∧ Function.Surjective sp' := by sorry
-/
/- **Omitted signature** `directImagesAtALefschetzDegeneration` (node `LPV.2/direct-images-at-a-lefschetz-degeneration`).
  sp must be the specialization map and `inv` the inertia invariants (Weil I 4.4). As typed, the arguments are arbitrary.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem directImagesAtALefschetzDegeneration (sp : A →ₗ[K] B) (inv : Submodule K B) :
        LinearMap.range sp = inv := by sorry
-/
end Specialization
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
section Pencils
/- **Omitted signature** `existenceOfLefschetzPencils` (node `LPV.3/existence-of-lefschetz-pencils`).
  `admissible` must be the good-axis open of a Veronese re-embedding of degree at least two, which the theorem shows nonempty (Weil I 5.7, SGA 7 XVII). For an arbitrary open (∅) no point exists.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Axis/jet spaces, conormal incidence and the open subset of admissible axes are supplied
    -- by SF.2. These declarations give their scheme-valued outputs and finite-field descent.
    def existenceOfLefschetzPencils (axes : Scheme.{0}) (admissible : axes.Opens) :
        {a : axes // a ∈ admissible} := by sorry
-/
/- **Omitted signature** `ordinaryAxisOpen` (node `LPV.3/ordinary-axis-open-and-jet-separation`).
  `admissible` must be the good-axis locus of SGA 7 XVII 3–4. An arbitrary subset is neither open nor nonempty.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem ordinaryAxisOpen (axes : Scheme.{0}) (admissible : Set axes) :
        IsOpen admissible ∧ admissible.Nonempty := by sorry
-/
/- **Omitted signature** `incidencePencilBlowup` (node `LPV.3/incidence-pencil-blowup`).
  The incidence family of a transverse axis is the blowup of X along the axis. As typed, the arguments are arbitrary: an isomorphism between any two schemes.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def incidencePencilBlowup (incidence blowup : Scheme.{0}) : incidence ≅ blowup := by sorry
-/
-- The axis scheme is of finite type over k, so a closed point of the open has finite residue field.
theorem finiteFieldPencilDescent (k : Type) [Field k] [Finite k]
    (axes : Scheme.{0}) (toBase : axes ⟶ Spec (.of k)) [LocallyOfFiniteType toBase]
    [QuasiCompact toBase] (admissible : Set axes) (hopen : IsOpen admissible)
    (hne : admissible.Nonempty) :
    ∃ E : Subfield (AlgebraicClosure k), Finite E ∧
      ∃ point : Spec (.of E) ⟶ axes, ∀ e, point e ∈ admissible := by sorry
-- The characteristic-two Gauss calculation is an actual homogeneous equation.
theorem inseparableGaussPencilCases {k : Type*} [Field k] [CharP k 2] (s t : k) :
    t ^ 2 * s ^ 2 + s ^ 2 * t ^ 2 = 0 := by sorry
end Pencils

section GlobalMonodromy
open LinearMap (BilinForm)
variable {K V G S : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V] [Group G]
variable (ρ : Representation K G V) (δ : S → V) (B : BilinForm K V)
/- **Omitted signature** `bertiniSurjectivityOnFundamentalGroups` (node `LPV.5/bertini-surjectivity-on-fundamental-groups`).
  H must be the image of π₁ of a sufficiently general line in π₁ of the complement of the dual variety, for a fixed ℓ-adic local system with compact image. An arbitrary subgroup has a smaller image.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The actual tame-pencilled geometric representation is an omitted condition, not arbitrary.
    theorem bertiniSurjectivityOnFundamentalGroups (H : Subgroup G) :
        Set.range (fun h : H => ρ h) = Set.range ρ := by sorry
-/
/- **Omitted signature** `vanishingCyclesAreConjugate` (node `LPV.5/vanishing-cycles-are-conjugate`).
  ρ and δ must be the monodromy and vanishing cycles of a tame Lefschetz pencil (Weil I 5.4). For arbitrary data no conjugating element exists.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem vanishingCyclesAreConjugate (s t : S) : ∃ g : G, ρ g (δ s) = δ t ∨ ρ g (δ s) = -δ t := by sorry
-/
/- **Omitted signature** `monodromyGeneratedByLocalTransvections` (node `LPV.5/monodromy-generated-by-local-transvections`).
  The image of π₁ is topologically generated by the local transvections (Weil I 5.8). For an arbitrary representation the orbit span exceeds the span of the δ_s.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Topology and tame generation are omitted here; this is the span consequence.
    theorem monodromyGeneratedByLocalTransvections :
        LefschetzPencil.vanishingSubspace ρ δ = Submodule.span K (Set.range δ) := by sorry
-/
-- V is the radical quotient with its nondegenerate form B, spanned by the vanishing cycles δ,
-- which are conjugate up to sign and each the axis of a local transvection in the image of ρ
-- (Weil I 5.5). These are the hypotheses the proof uses; their geometric origin is LPV.4–5.
theorem absoluteIrreducibilityOfTheVanishingQuotient (hnd : B.Nondegenerate)
    (hspan : Submodule.span K (Set.range δ) = ⊤)
    (hconj : ∀ s t, ∃ g : G, ρ g (δ s) = δ t ∨ ρ g (δ s) = -δ t)
    (htrans : ∀ s, ∃ (g : G) (c : K), c ≠ 0 ∧ ∀ x, ρ g x = x + c • B x (δ s) • δ s)
    (L : Type*) [Field L] [Algebra K L]
    (W : Submodule L (L ⊗[K] V))
    (hW : ∀ g, W.map ((ρ g).baseChange L) = W) : W = ⊥ ∨ W = ⊤ := by sorry
attribute [local instance 100] LieRing.ofAssociativeRing
theorem symplecticLieAlgebraGeneratedByTransvections (hB : B.IsAlt) (hnd : B.Nondegenerate)
    (L : LieSubalgebra K (Module.End K V)) (hL : L ≤ skewAdjointLieSubalgebra B)
    [LieModule.IsIrreducible K L V]
    (hgen : LieSubalgebra.lieSpan K (Module.End K V)
      (Set.range fun s => LefschetzPencil.nilpotentOfVector B (δ s)) = L) :
    L = skewAdjointLieSubalgebra B := by sorry
end GlobalMonodromy
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
/- **Omitted signature** `cohomologySheavesOfALefschetzPencil` (node `LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`).
  R must be the direct images of a Lefschetz pencil, E its vanishing space, J = j_*j^* and `exceptional` the skyscraper sum (Weil I 5.8). As typed, the arguments are arbitrary sheaves.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- R is the sequence of actual direct-image cohomology sheaves. The supplied functor J is
    -- j_*j^*, eta its adjunction map, and exceptional the sum of the singular skyscrapers.
    -- Lissity, tame geometric origin and the canonical identification of exceptional are omitted.
    -- This retains both branches of XVIII 6.3, rather than replacing them by fixed-space duality.
    theorem cohomologySheavesOfALefschetzPencil (D : Scheme.{0}) (K : Type) [Field K]
        (R : ℤ → EtaleSheaf D K) (n : ℤ) (E : ModuleCat K) [FiniteDimensional K E]
        (J : EtaleSheaf D K ⥤ EtaleSheaf D K) (eta : R n ⟶ J.obj (R n))
        (exceptional : EtaleSheaf D K) :
        (Module.finrank K E ≠ 0 →
          (∀ i, i ≠ n → ∃ A : ModuleCat K,
            Nonempty (R i ≅ (CategoryTheory.constantSheaf D.smallEtaleTopology (ModuleCat K)).obj A)) ∧
          IsIso eta) ∧
        (Module.finrank K E = 0 →
          (∀ i, i ≠ n + 1 → ∃ A : ModuleCat K,
            Nonempty (R i ≅ (CategoryTheory.constantSheaf D.smallEtaleTopology (ModuleCat K)).obj A)) ∧
          ∃ S : ShortComplex (EtaleSheaf D K), S.Exact ∧ Mono S.f ∧ Epi S.g ∧
            Nonempty (S.X₁ ≅ exceptional) ∧ Nonempty (S.X₂ ≅ R (n + 1)) ∧
            ∃ A : ModuleCat K,
              Nonempty (S.X₃ ≅ (CategoryTheory.constantSheaf D.smallEtaleTopology (ModuleCat K)).obj A)) := by sorry
-/
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.LefschetzPencil
open LinearMap (BilinForm)
section GlobalCohomology
variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V]
/- **Omitted signature** `pencilRestrictionGysin` (node `LPV.4/pencil-restriction-and-gysin`).
  `restriction` must be the pencil restriction through the incidence blowup (SGA 7 XVIII 5.1). As typed, the arguments are arbitrary.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- These are the supplied actual restriction, Gysin and Leray maps; geometric hypotheses
    -- are omitted. Neither hard Lefschetz nor E₂ degeneration is assumed by the core interface.
    theorem pencilRestrictionGysin {A : Type*} [AddCommGroup A] [Module K A]
        (restriction : A →ₗ[K] V) (B : BilinForm K V) (E : Submodule K V) :
        LinearMap.range restriction = B.orthogonal E := by sorry
-/
def pencilMiddleReduction (L : Submodule K V) (M : Submodule K L) : ModuleCat K := ModuleCat.of K (L ⧸ M)
-- The image of ρ is generated by the local transvections t_s (LPV.5's generation theorem, here a
-- hypothesis on abstract generators) and preserves the reflexive form B.
theorem localGlobalFixedComparison {G S : Type*} [Group G] (ρ : Representation K G V)
    (B : BilinForm K V) (hrefl : B.IsRefl) (δ : S → V) (t : S → G) (c : S → K)
    (hc : ∀ s, c s ≠ 0) (ht : ∀ s x, ρ (t s) x = x + c s • B x (δ s) • δ s)
    (hgen : Subgroup.closure (Set.range t) = ⊤) (hB : ∀ g x y, B (ρ g x) (ρ g y) = B x y) :
    ρ.invariants = B.orthogonal (vanishingSubspace ρ δ) := by sorry
/- **Omitted signature** `hypersurfaceOutsideMiddle` (node `LPV.4/hypersurface-outside-middle`).
  V must be H^i of a smooth projective hypersurface of dimension n (Weil I 5.12). As typed, the arguments are arbitrary: any vector space.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem hypersurfaceOutsideMiddle (i n : ℕ) (h : i ≠ n) :
        Module.finrank K V = if Even i then 1 else 0 := by sorry
-/
end GlobalCohomology

section OtherBranches
variable {K V G S : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V] [Group G]
/- **Omitted signature** `charTwoTransverseMonodromy` (node `LPV.5/characteristic-two-transverse-monodromy`).
  ρ and δ must come from a transverse characteristic-two pencil satisfying Weil II 4.2.3–8. As typed, the arguments are arbitrary.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Transverse characteristic-two axis hypotheses are omitted; no tame-generation claim.
    theorem charTwoTransverseMonodromy (ρ : Representation K G V) (δ : S → V) (s t : S) :
        ∃ g : G, ρ g (δ s) = δ t ∨ ρ g (δ s) = -δ t := by sorry
-/
/- **Omitted signature** `orthogonalOpenOrFinite` (node `LPV.5/conditional-orthogonal-open-or-finite`).
  H must be the monodromy group, generated by reflections in conjugate vanishing cycles and irreducible on a nondegenerate E (Weil II 4.4.1), with the ℓ-adic topology. An arbitrary compact subgroup (a torus in O(2) × 1 ⊂ O(3)) is neither open nor finite.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The topology below is supplied by the ℓ-adic analytic owner. Nondegeneracy of E is an
    -- input, never obtained by inserting hard Lefschetz into the odd quotient proof.
    theorem orthogonalOpenOrFinite [TopologicalSpace (V ≃ₗ[K] V)]
        (B : BilinForm K V) (hB : B.IsSymm) (hnd : B.Nondegenerate)
        (H : Subgroup (formPreservingGroup B))
        (hcompact : IsCompact (H : Set (formPreservingGroup B))) :
        IsOpen (H : Set (formPreservingGroup B)) ∨ Set.Finite (H : Set (formPreservingGroup B)) := by sorry
-/
/- **Omitted signature** `finiteOrthogonalADE` (node `LPV.5/finite-orthogonal-ade`).
  The lattice must be generated by the vanishing cycles with the source's sign normalization and rationality inputs (Weil II 4.4.5–9, gap G-orthogonal-integrality). An arbitrary form (zero) is not positive definite.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- Root-system classification and character rationality are supplier conditions. The
    -- lattice and its positive-definite integral form are the actual algebraic inputs.
    theorem finiteOrthogonalADE (r : ℕ) (pair : BilinForm ℤ (Fin r → ℤ))
        (H : Subgroup ((Fin r → ℤ) ≃ₗ[ℤ] (Fin r → ℤ))) (hfinite : Set.Finite (H : Set ((Fin r → ℤ) ≃ₗ[ℤ] (Fin r → ℤ)))) :
        ∀ x : Fin r → ℤ, x ≠ 0 → 0 < pair x x := by sorry
-/
/- **Omitted signature** `integralVanishingFailure` (node `LPV.5/integral-failure-and-arithmetic-routing`).
  The subgroups and map must be the integral vanishing and fixed classes and the polarization of Weil II 4.3.10. Arbitrary subgroups do not satisfy the identity.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The supplied integral polarization map models the torsion obstruction.
    theorem integralVanishingFailure (A : Type*) [AddCommGroup A] (polarization : A →+ A)
        (vanishing fixed : AddSubgroup A) : vanishing ⊓ fixed = polarization.ker := by sorry
-/
end OtherBranches
end TauCeti.AlgebraicGeometry.LefschetzPencil

namespace TauCeti.AlgebraicGeometry.VanishingCycles
open LinearMap (BilinForm)
-- Mathlib's right orthogonal is used; alternating/symmetric forms identify the two sides.
theorem fixedSpaceOfTheLocalTransvections {K V S : Type*} [Field K] [AddCommGroup V] [Module K V]
    (B : BilinForm K V) (δ : S → V) (c : S → K) (hc : ∀ s, c s ≠ 0)
    (x : V) :
    (∀ s, LinearMap.transvection (c s • B.flip (δ s)) (δ s) x = x) ↔
      ∀ s, B x (δ s) = 0 :=
  LefschetzPencil.forall_transvection_apply_eq_self_iff B δ c hc x

section AdicLie
attribute [local instance 100] LieRing.ofAssociativeRing
variable (p : ℕ) [Fact p.Prime] (r : ℕ)
-- The analytic exponential and the standard p-adic topology on GL are supplied by the
-- p-adic Lie owner. Neither is reconstructed from an arbitrary nilpotent finite polynomial.
variable [TopologicalSpace ((Fin r → ℚ_[p]) ≃ₗ[ℚ_[p]] (Fin r → ℚ_[p]))]
/- **Omitted signature** `analyticLie`.
  The ℓ-adic exponential is defined on a neighbourhood of 0 (gap G-padic-Lie). For an arbitrary map `analyticExp` the carrier is not closed under addition, so the structure's proof fields fail.
  Its premise-free form, kept for the name and the shape of the conclusion:
    def analyticLie (H : Subgroup ((Fin r → ℚ_[p]) ≃ₗ[ℚ_[p]] (Fin r → ℚ_[p])))
        (analyticExp : Module.End ℚ_[p] (Fin r → ℚ_[p]) →
          ((Fin r → ℚ_[p]) ≃ₗ[ℚ_[p]] (Fin r → ℚ_[p]))) :
        LieSubalgebra ℚ_[p] (Module.End ℚ_[p] (Fin r → ℚ_[p])) where
      carrier := {N | ∀ᶠ t : ℚ_[p] in nhds 0, analyticExp (t • N) ∈ H}
      add_mem' := by sorry
      zero_mem' := by sorry
      smul_mem' := by sorry
      lie_mem' := by sorry
-/

/- **Omitted signature** `lieAlgebraOfACompactLAdicSubgroup` (node `LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`).
  Needs `analyticLie` with the actual ℓ-adic exponential and the ℓ-adic topology on GL(V)(ℚ_ℓ); the topology instance of this form is arbitrary.
  Its premise-free form, kept for the name and the shape of the conclusion:
    theorem lieAlgebraOfACompactLAdicSubgroup
        (B : BilinForm ℚ_[p] (Fin r → ℚ_[p])) (hB : B.IsAlt) (hnd : B.Nondegenerate)
        (H : Subgroup (LefschetzPencil.formPreservingGroup B))
        (hcompact : IsCompact (H : Set (LefschetzPencil.formPreservingGroup B)))
        (analyticExp : Module.End ℚ_[p] (Fin r → ℚ_[p]) →
          ((Fin r → ℚ_[p]) ≃ₗ[ℚ_[p]] (Fin r → ℚ_[p]))) :
        analyticLie p r (H.map (LefschetzPencil.formPreservingGroup B).subtype) analyticExp ≤
          skewAdjointLieSubalgebra B ∧
        (analyticLie p r (H.map (LefschetzPencil.formPreservingGroup B).subtype) analyticExp =
          skewAdjointLieSubalgebra B → IsOpen (H : Set (LefschetzPencil.formPreservingGroup B))) := by sorry
-/
/- **Omitted signature** `kazhdanMargulisOpenImage` (node `LPV.5/kazhdan-margulis-open-image`).
  ρ must be the monodromy of an odd-dimensional Lefschetz pencil on its radical quotient, with the ℓ-adic topology. An arbitrary homomorphism (the trivial one) has non-open image.
  Its premise-free form, kept for the name and the shape of the conclusion:
    -- The odd-dimensional geometric pencil and analytic-image identifications are omitted.
    theorem kazhdanMargulisOpenImage {G : Type*} [Group G]
        (B : BilinForm ℚ_[p] (Fin r → ℚ_[p])) (hB : B.IsAlt) (hnd : B.Nondegenerate)
        (ρ : G →* LefschetzPencil.formPreservingGroup B) :
        IsOpen (Set.range ρ) := by sorry
-/
end AdicLie
end TauCeti.AlgebraicGeometry.VanishingCycles


/-! ## The LPV.7 part: LPV.7:semistable-curves and LPV.7:invariant-cycles

The normalization complex, nodal nearby cycles, curve monodromy and the strictly semistable weight
spectral sequence; then specialization into invariants, potentially pure models and the local and
global invariant-cycle theorems. It uses the derived-category instances declared above. -/

namespace TauCeti.LPV7

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry


section Normalization

variable {Λ V E : Type*} [CommRing Λ]

/-- The vertices/edges and branch functions are supplied by StableReduction;
this only realizes the normalization boundary on coefficients. -/
def normalizationDifferential (tail head : E → V) :
    (V → Λ) →ₗ[Λ] (E → Λ) where
  toFun a e := a (tail e) - a (head e)
  map_add' := by sorry
  map_smul' := by sorry

lemma normalizationDifferential_apply (tail head : E → V) (a : V → Λ) (e : E) :
    normalizationDifferential tail head a e = a (tail e) - a (head e) := by sorry

lemma normalizationDifferential_constant (tail head : E → V) (a : Λ) :
    normalizationDifferential tail head (fun _ => a) = 0 := by sorry

lemma normalizationDifferential_reverse (tail head : E → V) :
    normalizationDifferential (Λ := Λ) head tail = -normalizationDifferential tail head :=
  by sorry

/-- Compare to existing kernel/range/quotient objects, rather than a new graph carrier. -/
lemma normalizationDifferential_ker (tail head : E → V) :
    (∀ a, a ∈ LinearMap.ker (normalizationDifferential (Λ := Λ) tail head) ↔
      ∀ e, a (tail e) = a (head e)) ∧
    Function.Surjective (LinearMap.range (normalizationDifferential (Λ := Λ) tail head)).mkQ ∧
    LinearMap.ker (LinearMap.range (normalizationDifferential (Λ := Λ) tail head)).mkQ =
      LinearMap.range (normalizationDifferential (Λ := Λ) tail head) :=
  by sorry

/-- Test `TauCeti.LPV7.normalization_tree_test`: one edge, including the quotient. -/
example :
    (∀ a : Fin 2 → ℚ,
      normalizationDifferential (fun _ : Fin 1 => (0 : Fin 2)) (fun _ => 1) a 0 =
        a 0 - a 1) ∧
    LinearMap.range (normalizationDifferential (Λ := ℚ)
      (fun _ : Fin 1 => (0 : Fin 2)) (fun _ => 1)) = ⊤ := by sorry

/-- Test `TauCeti.LPV7.normalization_loop_test`: the edge quotient retains its coordinate. -/
example : normalizationDifferential (Λ := ℚ)
    (fun _ : Fin 1 => (0 : Fin 1)) (fun _ => 0) = 0 ∧
    Nonempty (((Fin 1 → ℚ) ⧸ LinearMap.range
      (normalizationDifferential (Λ := ℚ)
        (fun _ : Fin 1 => (0 : Fin 1)) (fun _ => 0))) ≃ₗ[ℚ] ℚ) := by sorry

/-- Test `TauCeti.LPV7.normalization_parallel_test`: parallel edges are not collapsed. -/
example :
    (∀ a : Fin 2 → ℚ,
      normalizationDifferential (fun _ : Fin 2 => (0 : Fin 2)) (fun _ => 1) a =
        ![a 0 - a 1, a 0 - a 1]) ∧
    Nonempty (((Fin 2 → ℚ) ⧸ LinearMap.range
      (normalizationDifferential (Λ := ℚ)
        (fun _ : Fin 2 => (0 : Fin 2)) (fun _ => 1))) ≃ₗ[ℚ] ℚ) := by sorry

end Normalization

section Specialization

variable {F I A V W : Type*} [Field F] [Group I]
  [AddCommGroup A] [Module F A] [AddCommGroup V] [Module F V]
  [AddCommGroup W] [Module F W]

/-- The geometric specialization and its fixed-image proof are supplied by LPV.0
and continuous ℓ-adic realization by R02.1; the codomain is the existing invariants. -/
def invariantSpecialization (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) : A →ₗ[F] ρ.invariants :=
  sp.codRestrict ρ.invariants (fun a => (Representation.mem_invariants ρ (sp a)).mpr
    (hfixed a))

lemma invariantSpecialization_coe (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) :
    ρ.invariants.subtype.comp (invariantSpecialization ρ sp hfixed) = sp := by sorry

lemma invariantSpecialization_range (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) :
    Function.Surjective (invariantSpecialization ρ sp hfixed) ↔
      LinearMap.range sp = ρ.invariants := by sorry

lemma invariantSpecialization_unique (ρ : Representation F I V) (sp : A →ₗ[F] V)
    (hfixed : ∀ a g, ρ g (sp a) = sp a) (u : A →ₗ[F] ρ.invariants)
    (hu : ρ.invariants.subtype.comp u = sp) :
    u = invariantSpecialization ρ sp hfixed := by sorry

lemma invariantSpecialization_natural (ρ : Representation F I V) (σ : Representation F I W)
    (sp : A →ₗ[F] V) (sq : A →ₗ[F] W)
    (hp : ∀ a g, ρ g (sp a) = sp a) (hq : ∀ a g, σ g (sq a) = sq a)
    (v : V →ₗ[F] W) (hinv : ∀ x ∈ ρ.invariants, v x ∈ σ.invariants)
    (hcomm : v.comp sp = sq) :
    (v.domRestrict ρ.invariants |>.codRestrict σ.invariants
      (fun x => hinv x x.property)).comp (invariantSpecialization ρ sp hp) =
      invariantSpecialization σ sq hq := by sorry

/-- Test `TauCeti.LPV7.invariant_sp_identity_test`. -/
example (hfixed : ∀ a g : ℚ, (Representation.trivial ℚ (Multiplicative ℚ) ℚ)
    (Multiplicative.ofAdd g) a = a) :
    Function.Surjective (invariantSpecialization
      (Representation.trivial ℚ (Multiplicative ℚ) ℚ) LinearMap.id
      (fun a g => hfixed a (Multiplicative.toAdd g))) := by sorry

/-- Test `TauCeti.LPV7.invariant_sp_zero_test`: fixed image does not imply surjectivity. -/
example : ¬Function.Surjective (invariantSpecialization
    (Representation.trivial ℚ (Multiplicative ℚ) ℚ) (0 : ℚ →ₗ[ℚ] ℚ)
    (by sorry)) := by sorry

/-- A concrete shear representation, used only to pin the invariant-space test. -/
def shearRepresentation : Representation ℚ (Multiplicative ℚ) (ℚ × ℚ) where
  toFun t :=
    { toFun := fun x => (x.1 + Multiplicative.toAdd t * x.2, x.2)
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

def firstCoordinateInjection : ℚ →ₗ[ℚ] (ℚ × ℚ) where
  toFun a := (a,0)
  map_add' := by sorry
  map_smul' := by sorry

/-- Test `TauCeti.LPV7.invariant_sp_unipotent_test`: the fixed line and the rejected identity. -/
example (hfixed : ∀ a g, shearRepresentation g (firstCoordinateInjection a) =
    firstCoordinateInjection a) :
    Function.Surjective (invariantSpecialization shearRepresentation
      firstCoordinateInjection hfixed) ∧
    ¬(∀ (x : ℚ × ℚ) g, shearRepresentation g x = x) := by sorry

end Specialization

/- The proper arithmetic model and its realization maps use existing scheme types.
`B` is intended to be Spec ℤ[1/ℓ], `P` the geometric Spec k and `p` its point.
The constructible complex and pullback are represented only by their underlying
module-derived shadows. Their étale interpretation, arithmetic purity and the
henselization identification are omitted; G-suggested-premises records their
precise supplier contracts. Finite type is encoded by local finite type and
quasi-compactness. Integral, smooth-relative-dimension-one, proper, generic-point
and Cartesian-square conditions below ARE actual
existing predicates, not missing mathematical conditions disguised as fields.
-/

/-- Absolute arithmetic model, before the pencil produces a curve/section model.
The proper geometric fibre is an actual categorical pullback. Arithmetic purity
and the association of the derived pullback with the scheme map are omitted. -/
structure GeometricGenericPureModel (B P X : Scheme) (p : P)
    (structuralMap : X ⟶ P) (K : DerivedCategory (ModuleCat.{0} ℚ)) where
  A0 : Scheme
  integral : IsIntegral A0
  arithmeticMap : A0 ⟶ B
  locallyFiniteType : LocallyOfFiniteType arithmeticMap
  quasiCompact : QuasiCompact arithmeticMap
  point : P ⟶ A0
  generic : IsGenericPoint (point p) Set.univ
  X0 : Scheme
  familyMap : X0 ⟶ A0
  proper : IsProper familyMap
  familyRealization : X ⟶ X0
  familySquare : IsPullback familyRealization structuralMap familyMap point
  K0 : DerivedCategory (ModuleCat.{0} ℚ)
  weight : ℤ
  pullback : DerivedCategory (ModuleCat.{0} ℚ) ⥤ DerivedCategory (ModuleCat.{0} ℚ)
  complexRealization : pullback.obj K0 ≅ K

namespace GeometricGenericPureModel

variable {B P X : Scheme} {p : P} {structuralMap : X ⟶ P}
  {K : DerivedCategory (ModuleCat.{0} ℚ)}

def base (M : GeometricGenericPureModel B P X p structuralMap K) : Scheme := M.A0

def family (M : GeometricGenericPureModel B P X p structuralMap K) : Scheme := M.X0

def realization (M : GeometricGenericPureModel B P X p structuralMap K) :
    M.pullback.obj M.K0 ≅ K := M.complexRealization

def transport (M : GeometricGenericPureModel B P X p structuralMap K)
    {X' : Scheme} (x : X' ≅ X) {K' : DerivedCategory (ModuleCat.{0} ℚ)}
    (k : K ≅ K') : GeometricGenericPureModel B P X' p (x.hom ≫ structuralMap) K' :=
  by sorry

/-- Constructor `GeometricGenericPureModel.mk` uses all displayed fields; geometric premises
remain omitted exactly as documented above. Extensionality retains every data field. -/
lemma ext (M N : GeometricGenericPureModel B P X p structuralMap K)
    (h_A0 : M.A0 = N.A0)
    (h_arithmeticMap : HEq M.arithmeticMap N.arithmeticMap)
    (h_point : HEq M.point N.point)
    (h_X0 : M.X0 = N.X0)
    (h_familyMap : HEq M.familyMap N.familyMap)
    (h_familyRealization : HEq M.familyRealization N.familyRealization)
    (h_K0 : M.K0 = N.K0)
    (h_weight : M.weight = N.weight)
    (h_pullback : M.pullback = N.pullback)
    (h_complexRealization : HEq M.complexRealization N.complexRealization) :
    M = N := by sorry

end GeometricGenericPureModel

/-- Test `TauCeti.LPV7.generic_model_constant_test`: the realization of an
actual descended constant model; its constancy and purity await EDC.0/DWP.8. -/
example {B P X : Scheme} {p : P} {structuralMap : X ⟶ P}
    (K : DerivedCategory (ModuleCat.{0} ℚ))
    (M : GeometricGenericPureModel B P X p structuralMap K)
    (hK : M.K0 = K) (hpb : M.pullback = 𝟭 _) :
    Nonempty (M.pullback.obj M.K0 ≅ K) ∧ M.pullback.obj M.K0 = K := by sorry

/-- Test `TauCeti.LPV7.generic_model_shift_twist_test`: the same scheme model
with actual shifted/twisted complex and weight w+a−2b. Purity laws are omitted. -/
example {B P X : Scheme} {p : P} {structuralMap : X ⟶ P}
    {K : DerivedCategory (ModuleCat.{0} ℚ)}
    (M : GeometricGenericPureModel B P X p structuralMap K)
    (twist : ℤ → DerivedCategory (ModuleCat.{0} ℚ) ⥤ DerivedCategory (ModuleCat.{0} ℚ))
    (a b : ℤ) : ∃ M' : GeometricGenericPureModel B P X p structuralMap
      ((shiftFunctor (DerivedCategory (ModuleCat.{0} ℚ)) a).obj ((twist b).obj K)),
      M'.A0 = M.A0 ∧ M'.weight = M.weight + a - 2*b := by sorry

/-- Test `TauCeti.LPV7.generic_model_closed_point_test`: a proper closed
parameter subset cannot contain the geometric generic point. -/
example {B P X : Scheme} {p : P} {structuralMap : X ⟶ P}
    {K : DerivedCategory (ModuleCat.{0} ℚ)}
    (M : GeometricGenericPureModel B P X p structuralMap K)
    (Z : Set M.A0) (hclosed : IsClosed Z) (hproper : Z ≠ Set.univ)
    (hfactor : M.point p ∈ Z) : False := by sorry

structure PotentiallyPureModel (B P X S : Scheme) (p : P)
    (f : X ⟶ S) (K : DerivedCategory (ModuleCat.{0} ℚ)) where
  A0 : Scheme
  integral : IsIntegral A0
  arithmeticMap : A0 ⟶ B
  locallyFiniteType : LocallyOfFiniteType arithmeticMap
  quasiCompact : QuasiCompact arithmeticMap
  point : P ⟶ A0
  generic : IsGenericPoint (point p) Set.univ
  S0 : Scheme
  curve : S0 ⟶ A0
  smooth : SmoothOfRelativeDimension 1 curve
  curveSection : A0 ⟶ S0
  section_eq : curveSection ≫ curve = 𝟙 A0
  X0 : Scheme
  familyMap : X0 ⟶ S0
  proper : IsProper familyMap
  traitRealization : S ⟶ S0
  familyRealization : X ⟶ X0
  familySquare : IsPullback familyRealization f familyMap traitRealization
  K0 : DerivedCategory (ModuleCat.{0} ℚ)
  weight : ℤ
  pullback : DerivedCategory (ModuleCat.{0} ℚ) ⥤ DerivedCategory (ModuleCat.{0} ℚ)
  complexRealization : pullback.obj K0 ≅ K

namespace PotentiallyPureModel

variable {B P X S : Scheme} {p : P} {f : X ⟶ S}
  {K : DerivedCategory (ModuleCat.{0} ℚ)}

def base (M : PotentiallyPureModel B P X S p f K) : Scheme := M.A0

def family (M : PotentiallyPureModel B P X S p f K) : Scheme × Scheme := (M.S0,M.X0)

def realization (M : PotentiallyPureModel B P X S p f K) :
    M.pullback.obj M.K0 ≅ K := M.complexRealization

/-- Restrict the entire model to the supplied open, not just the integer weight.
The geometric pullback/purity preservation interface is omitted (EDC.0/DWP.8). -/
def shrink (M : PotentiallyPureModel B P X S p f K) (U : Scheme)
    (j : U ⟶ M.A0) [IsOpenImmersion j] (pointU : P ⟶ U)
    (hpoint : pointU ≫ j = M.point) : PotentiallyPureModel B P X S p f K := by sorry

def transport (M : PotentiallyPureModel B P X S p f K)
    {X' S' : Scheme} (x : X' ≅ X) (s : S' ≅ S) (f' : X' ⟶ S')
    (hcomm : f' ≫ s.hom = x.hom ≫ f) {K' : DerivedCategory (ModuleCat.{0} ℚ)}
    (k : K ≅ K') : PotentiallyPureModel B P X' S' p f' K' := by sorry

/-- Constructor `PotentiallyPureModel.mk` uses all displayed fields; geometric premises
remain omitted exactly as documented above. Extensionality retains every data field. -/
lemma ext (M N : PotentiallyPureModel B P X S p f K)
    (h_A0 : M.A0 = N.A0)
    (h_arithmeticMap : HEq M.arithmeticMap N.arithmeticMap)
    (h_point : HEq M.point N.point)
    (h_S0 : M.S0 = N.S0)
    (h_curve : HEq M.curve N.curve)
    (h_curveSection : HEq M.curveSection N.curveSection)
    (h_X0 : M.X0 = N.X0)
    (h_familyMap : HEq M.familyMap N.familyMap)
    (h_traitRealization : HEq M.traitRealization N.traitRealization)
    (h_familyRealization : HEq M.familyRealization N.familyRealization)
    (h_K0 : M.K0 = N.K0)
    (h_weight : M.weight = N.weight)
    (h_pullback : M.pullback = N.pullback)
    (h_complexRealization : HEq M.complexRealization N.complexRealization) :
    M = N := by sorry

end PotentiallyPureModel

/-- Test `TauCeti.LPV7.potential_model_constant_test`: underlying realization
of a descended constant family; constancy and purity await EDC.0/DWP.8. -/
example {B P X S : Scheme} {p : P} {f : X ⟶ S}
    (K : DerivedCategory (ModuleCat.{0} ℚ)) (M : PotentiallyPureModel B P X S p f K)
    (hK : M.K0 = K) (hpb : M.pullback = 𝟭 _) :
    Nonempty (M.pullback.obj M.K0 ≅ K) ∧ M.pullback.obj M.K0 = K := by sorry

/-- Test `TauCeti.LPV7.potential_model_shift_twist_test`: the same model geometry
has weight w+a−2b; the actual Tate/shift functors and purity witness are omitted. -/
example {B P X S : Scheme} {p : P} {f : X ⟶ S}
    {K : DerivedCategory (ModuleCat.{0} ℚ)} (M : PotentiallyPureModel B P X S p f K)
    (twist : ℤ → DerivedCategory (ModuleCat.{0} ℚ) ⥤ DerivedCategory (ModuleCat.{0} ℚ))
    (a b : ℤ) : ∃ M' : PotentiallyPureModel B P X S p f
      ((shiftFunctor (DerivedCategory (ModuleCat.{0} ℚ)) a).obj ((twist b).obj K)),
      M'.A0 = M.A0 ∧ M'.weight = M.weight + a - 2*b := by sorry

/-- Test `TauCeti.LPV7.potential_model_closed_point_test`: genericity excludes
factoring the parameter point through a proper closed subset. -/
example {B P X S : Scheme} {p : P} {f : X ⟶ S}
    {K : DerivedCategory (ModuleCat.{0} ℚ)} (M : PotentiallyPureModel B P X S p f K)
    (Z : Set M.A0) (hclosed : IsClosed Z) (hproper : Z ≠ Set.univ)
    (hfactor : M.point p ∈ Z) : False := by sorry

section SpectralSequence

open CategoryTheory.Abelian

variable (G : SpectralObject (ModuleCat.{0} ℚ) ℤ)
  (data : SpectralObject.SpectralSequenceDataCore ℤ
    (fun r => ComplexShape.up' (⟨r,1-r⟩ : ℤ × ℤ)) 1)
  [G.HasSpectralSequence data]

/-- The caller must supply the spectral object of the filtered nearby complex
and its indexing data. G-filtered-realization records that missing bridge.
The output is the existing Mathlib spectral sequence. -/
def weightSpectralSequence (G : SpectralObject (ModuleCat.{0} ℚ) ℤ)
    (data : SpectralObject.SpectralSequenceDataCore ℤ
      (fun r => ComplexShape.up' (⟨r,1-r⟩ : ℤ × ℤ)) 1)
    [G.HasSpectralSequence data] : CohomologicalSpectralSequence (ModuleCat.{0} ℚ) 1 :=
  G.spectralSequence data

/-- Finite dependent product of stratum cohomology (finite sums agree for modules).
H(r,q,t) is the supplied H^q of the (r+1)-fold stratum with Tate twist t. -/
def weightE1 (H : ℤ → ℤ → ℤ → ModuleCat.{0} ℚ) (d p q : ℤ) : ModuleCat.{0} ℚ :=
  ModuleCat.of ℚ (∀ i : {i : ℤ // max 0 (-p) ≤ i ∧ p + 2*i ≤ d},
    H (p + 2*i.val) (q - 2*i.val) (-i.val))

/- **Omitted signature** `weightSpectralSequence_e1` (node `LPV.7:semistable-curves/snc-weight-spectral-sequence`).
  G must be the spectral object of the filtered nearby complex of a strictly semistable family of relative dimension d and H its stratum cohomology (gap G-filtered-realization). For arbitrary G and H there is no such isomorphism.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: G is the geometric filtered-nearby spectral object, H its stratum
    cohomology and d its relative dimension. An arbitrary G has no such comparison. -/
    def weightSpectralSequence_e1 (H : ℤ → ℤ → ℤ → ModuleCat.{0} ℚ) (d p q : ℤ) :
        ((weightSpectralSequence G data).page 1).X (p,q) ≅ weightE1 H d p q := by sorry
-/

def weightSpectralSequence_e2 (p q : ℤ) :
    ((weightSpectralSequence G data).page 1).homology (p,q) ≅
      ((weightSpectralSequence G data).page 2).X (p,q) := by sorry

/- **Omitted signature** `weightSpectralSequence_abutment` (node `LPV.7:semistable-curves/snc-weight-spectral-sequence`).
  Needs the proper geometric abutment, its induced filtration M and the column bound [−d, d]. For arbitrary `Hgeneric` and M the isomorphism fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: the actual proper geometric abutment and its induced filtration;
    boundedness/convergence and proper base change are EDC.0/LPV.0 inputs.
    Omitted: the relative-dimension column bound -d ≤ p ≤ d. It ensures
    page 2*d+2 is stabilized, without an E2-degeneration assumption.
    The filtration index is -p (not p); m=p+q. -/
    def weightSpectralSequence_abutment
        (Hgeneric : ℤ → ModuleCat.{0} ℚ)
        (M : ∀ m : ℤ, ℤ → Submodule ℚ (Hgeneric m))
        (d : ℕ) (p q : ℤ) :
        ((weightSpectralSequence G data).page (2*d+2)).X (p,q) ≅
          ModuleCat.of ℚ ((M (p+q) (-p)) ⧸
            ((M (p+q) (-p-1)).comap (M (p+q) (-p)).subtype)) := by sorry
-/

/- **Omitted signature** `weightSpectralSequence_reindex` (node `LPV.7:semistable-curves/snc-weight-spectral-sequence`).
  G′ must be the spectral object after a signed permutation of the components. As typed, the arguments are arbitrary: two unrelated spectral objects.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: the signed component permutation and its filtered geometric map. -/
    def weightSpectralSequence_reindex
        (G' : SpectralObject (ModuleCat.{0} ℚ) ℤ) [G'.HasSpectralSequence data] :
        weightSpectralSequence G data ≅ weightSpectralSequence G' data := by sorry
-/

/- **Omitted signature** `TauCeti.LPV7.weight_ss_smooth_test` (node `LPV.7:semistable-curves/snc-weight-spectral-sequence`).
  G must be the spectral object of a smooth model and H its cohomology. For arbitrary G and H the identification fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Test `TauCeti.LPV7.weight_ss_smooth_test`: stratum realization omitted;
    the exact E1 sparsity is the intended test, including all integer indices. -/
    example (H : ℤ → ℤ → ℤ → ModuleCat.{0} ℚ) :
        (∀ q, Nonempty (((weightSpectralSequence G data).page 1).X (0,q) ≅ H 0 q 0)) ∧
        (∀ p q, p ≠ 0 → IsZero (((weightSpectralSequence G data).page 1).X (p,q))) := by sorry
-/

/- **Omitted signature** `TauCeti.LPV7.weight_ss_curve_test` (node `LPV.7:semistable-curves/snc-weight-spectral-sequence`).
  G must be the spectral object of a semistable curve and H its stratum cohomology. For arbitrary G and H it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Test `TauCeti.LPV7.weight_ss_curve_test`: the H arguments include the twists.
    Restriction/Gysin identification is a geometric premise omitted here. -/
    example (H : ℤ → ℤ → ℤ → ModuleCat.{0} ℚ) :
        Nonempty (((weightSpectralSequence G data).page 1).X (-1,2) ≅ H 1 0 (-1)) ∧
        Nonempty (((weightSpectralSequence G data).page 1).X (0,1) ≅ H 0 1 0) ∧
        Nonempty (((weightSpectralSequence G data).page 1).X (1,0) ≅ H 1 0 0) := by sorry
-/

/- **Omitted signature** `TauCeti.LPV7.weight_ss_nonproper_test` (node `LPV.7:semistable-curves/snc-weight-spectral-sequence`).
  G must be the spectral object of the local model uv = π, with its nearby hypercohomology and filtration. For arbitrary data it fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Test `TauCeti.LPV7.weight_ss_nonproper_test`: the target is nearby
    hypercohomology, not generic cohomology. The uv=π realization and column
    bound [-d,d] are omitted; the bound ensures stabilization by page 2*d+2. -/
    example (Hnearby : ℤ → ModuleCat.{0} ℚ)
        (M : ∀ m : ℤ, ℤ → Submodule ℚ (Hnearby m)) (d : ℕ) (p q : ℤ) :
        Nonempty (((weightSpectralSequence G data).page (2*d+2)).X (p,q) ≅
          ModuleCat.of ℚ ((M (p+q) (-p)) ⧸
            ((M (p+q) (-p-1)).comap (M (p+q) (-p)).subtype))) := by sorry
-/

end SpectralSequence

/-! Named theorem forms. The comments tie each module signature to its geometric
statement. In addition to the explicitly displayed algebraic premises, the
realizations and geometric hypotheses named there must be supplied. They are
omitted here because the pinned libraries do not express them. -/

section CurveTheorems

variable {F A V E C T M Md B : Type*} [Field F]
  [AddCommGroup A] [Module F A] [AddCommGroup V] [Module F V]
  [AddCommGroup E] [Module F E] [AddCommGroup C] [Module F C]
  [AddCommGroup T] [Module F T] [AddCommGroup M] [Module F M]
  [AddCommGroup Md] [Module F Md] [AddCommGroup B] [Module F B]

/- **Omitted signature** `normalizationEtaleResolution` (node `LPV.7:semistable-curves/normalization-etale-resolution`).
  `diag` and `diff` must be the stalk maps of 0 → Λ_Y → ν_*Λ → ⊕ i_e*Λ(e) → 0. Arbitrary maps (zero) are not exact.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: diag/diff are the constant-sheaf normalization stalk maps on a
    proper geometric nodal curve, not arbitrary maps of vector spaces. -/
    theorem normalizationEtaleResolution (diag : A →ₗ[F] V) (diff : V →ₗ[F] E) :
        Function.Injective diag ∧ LinearMap.range diag = LinearMap.ker diff ∧
          Function.Surjective diff := by sorry
-/

/- **Omitted signature** `nodalNearbyCycleSheaves` (node `LPV.7:semistable-curves/nodal-nearby-cycle-sheaves`).
  R must be the stalks R^qΨΛ of a proper nodal family. As typed, the arguments are arbitrary modules.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: the proper nodal uv=a family, its coefficient realization and
    nearby stalks. nodeResidue is the R¹Φ(1) branch-dual comparison. -/
    theorem nodalNearbyCycleSheaves (R : ℕ → ModuleCat F)
        (branchesDual : ModuleCat F) :
        Nonempty (R 0 ≅ ModuleCat.of F F) ∧ Nonempty (R 1 ≅ branchesDual) ∧
          (∀ q, 1 < q → IsZero (R q)) := by sorry
-/

/- **Omitted signature** `nodeResidueVariationSign` (node `LPV.7:semistable-curves/node-residue-variation-sign`).
  `variation` must be the normalized local variation at a node uv = π^n in Illusie's branch bases. As typed, the arguments are arbitrary endomorphism.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: local variation and dual branch/Tate coordinates at uv=π^n.
    The sign is negative and thickness n is positive. -/
    theorem nodeResidueVariationSign (n : ℕ) (hn : 0 < n) (variation : F →ₗ[F] F) :
        variation = -(n : F) • LinearMap.id := by sorry
-/

/- **Omitted signature** `curveSpecializationSequence` (node `LPV.7:semistable-curves/curve-specialization-sequence`).
  The maps must be those of the specialization sequence of a nodal curve. Arbitrary maps (zero) are not exact.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: these are the five geometric specialization arrows of the packet,
    with E=⊕Λ′(-1), C=component H² and T=generic H². -/
    theorem curveSpecializationSequence (sp : A →ₗ[F] V) (res : V →ₗ[F] E)
        (boundary : E →ₗ[F] C) (trace : C →ₗ[F] T) :
        Function.Injective sp ∧ LinearMap.range sp = LinearMap.ker res ∧
        LinearMap.range res = LinearMap.ker boundary ∧
        LinearMap.range boundary = LinearMap.ker trace ∧ Function.Surjective trace := by sorry
-/

/- **Omitted signature** `curveNormalizationCohomology` (node `LPV.7:semistable-curves/curve-normalization-cohomology`).
  The maps must be the graph injection and the restriction to components. Arbitrary maps (zero) are not exact.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: graph injection, special-fibre H¹ and component H¹ realization.
    No splitting is part of this statement. -/
    theorem curveNormalizationCohomology (graph : M →ₗ[F] A) (components : A →ₗ[F] B) :
        Function.Injective graph ∧ LinearMap.range graph = LinearMap.ker components ∧
          Function.Surjective components := by sorry
-/

/-- Rational linear consequence of the negative graph-pairing factorization.
Omitted: identification of the displayed composite with geometric twisted N.
The positive integral valuation pairing is imported from R11.4. -/
theorem curveMonodromyFactorization [FiniteDimensional F V] [FiniteDimensional F M]
    (c : V →ₗ[F] M) (u : M →ₗ[F] Md) (c' : Md →ₗ[F] V)
    (hcc : c.comp c' = 0) (hc : Function.Surjective c)
    (hu : Function.Bijective u) (hc' : Function.Injective c') :
    (c'.comp (u.comp c)).comp (c'.comp (u.comp c)) = 0 ∧
    Module.finrank F (LinearMap.range (c'.comp (u.comp c))) = Module.finrank F M := by sorry

/-- Omitted: curve specialization identifies its image with ker N; the
unipotent action and nonzero tame character displayed below are genuine inputs. -/
theorem curveInertiaInvariants {I : Type*} [Group I]
    (ρ : Representation F I V) (N : V →ₗ[F] V) (t : I → F)
    (hact : ∀ g x, ρ g x = x + t g • N x) (ht : ∃ g, t g ≠ 0)
    (sp : A →ₗ[F] V) (hsp : LinearMap.range sp = LinearMap.ker N) :
    ρ.invariants = LinearMap.ker N ∧ LinearMap.range sp = ρ.invariants := by sorry

/-- Omitted: the geometric identification of the three quotients with graph
H¹, component H¹ and graph H₁(-1). This checks the actual N²=0 filtration core. -/
theorem curveMonodromyFiltration (N : V →ₗ[F] V) (hN : N.comp N = 0) :
    LinearMap.range N ≤ LinearMap.ker N ∧
    Nonempty ((V ⧸ LinearMap.ker N) ≃ₗ[F] LinearMap.range N) := by sorry

/- **Omitted signature** `jacobianTateRealization` (node `LPV.7:semistable-curves/jacobian-tate-realization`).
  V_ℓ(Jac(X_η)) ≅ H¹(X_η̄, ℚ_ℓ)(1) for a regular semistable model, through the Kummer sequence and the principal polarization. As typed, the arguments are arbitrary: an isomorphism between any two spaces.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: regular projective semistable curve, principal polarization and
    Kummer realization. V=H¹(1), T=VℓJac, M=graph H¹(1), B=component Tate modules. -/
    def jacobianTateRealization : V ≃ₗ[F] T := by sorry
-/

/- **Omitted signature** `curveJacobianPairing` (node `LPV.7:semistable-curves/curve-jacobian-pairing`).
  uMinus and uPlus must be Illusie's residue form and R11.4's valuation pairing in compatible coordinates. As typed, the arguments are arbitrary forms.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: the two pairings are the Illusie residue form and the polarized
    positive valuation pairing in compatible graph coordinates. -/
    theorem curveJacobianPairing (uMinus uPlus : LinearMap.BilinForm F M) :
        uMinus = -uPlus := by sorry
-/

/- **Omitted signature** `curveChoiceBaseChange` (node `LPV.7:semistable-curves/curve-choice-basechange-compatibility`).
  Nold and Nnew must be the monodromy operators before and after a ramified extension of index e, with compatible Tate coordinates. As typed, the arguments are arbitrary.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: a ramified trait extension and compatible tame/Tate coordinates.
    For an original thickness n, the e*n unit-edge subdivision comparison
    is supplied by StableReduction (e edges only when n=1). -/
    theorem curveChoiceBaseChange (e : ℕ) (Nold Nnew : V →ₗ[F] V) :
        Nnew = (e : F) • Nold := by sorry
-/

/-- Algebraic acceptance calculation; existence of the proper I₂ model remains
the geometric test G-geometric-tests. The smooth/bridge cases have zero N. -/
theorem smoothAndSplitCycleExamples :
    (let N : (ℚ × ℚ) →ₗ[ℚ] (ℚ × ℚ) :=
      { toFun := fun x => (-2*x.2,0)
        map_add' := by sorry
        map_smul' := by sorry }
    N.comp N = 0 ∧ N ≠ 0 ∧ ∀ x, N x = (-2*x.2,0)) := by sorry

/- **Omitted signature** `sncNearbyCycleDescription` (node `LPV.7:semistable-curves/snc-nearby-cycle-description`).
  R must be the stalks of RΨΛ at a point on a branches of a strictly semistable chart. As typed, the arguments are arbitrary modules.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: strict-semistable trait charts and Kummer stalk realization.
    The exterior algebra carrier and Tate twist are provided by the owners;
    the branch rank is a-1, and higher q>a-1 is zero. -/
    theorem sncNearbyCycleDescription (a : ℕ) (ha : 0 < a) (R : ℕ → ModuleCat F) :
        ∀ q, a ≤ q → IsZero (R q) := by sorry
-/

/- **Omitted signature** `sncGradedNearbyComplex` (node `LPV.7:semistable-curves/snc-graded-nearby-complex`).
  `graded` must be gr_r of the monodromy filtration of RΨℚ_ℓ[d] and `strata` the stratum sum. As typed, the arguments are arbitrary: an isomorphism between any two objects.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: the actual shifted-perverse RΨ and its LPV.1 monodromy filtration.
    The displayed derived objects stand for gr_r and the finite sum of stratum
    pushforwards a_{p+q,*}Qℓ(-p)[-p-q] with p-q=r. -/
    def sncGradedNearbyComplex (graded strata : DerivedCategory (ModuleCat.{0} ℚ)) :
        graded ≅ strata := by sorry
-/

/-- With actual stratum maps omitted, the signed differential satisfies the
following linear relation. Source sign convention is restriction + Gysin. -/
theorem weightSpectralSequenceDifferential (restriction gysin : V →ₗ[F] V)
    (hr : restriction.comp restriction = 0) (hg : gysin.comp gysin = 0)
    (hmixed : restriction.comp gysin + gysin.comp restriction = 0) :
    (restriction + gysin).comp (restriction + gysin) = 0 := by sorry

/- **Omitted signature** `spectralMonodromyCurveComparison` (node `LPV.7:semistable-curves/snc-monodromy-and-curve-comparison`).
  N must be the monodromy on the curve spectral sequence and c, u, c′ the specialization quotient, the negative edge form and cospecialization. As typed, the arguments are arbitrary maps.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: proper curve spectral-object realization and stabilized-page
    identifications. Degree positions force E₂=E∞; geometric N is the same
    negative graph composite after the residue signs are transported. -/
    theorem spectralMonodromyCurveComparison (N : V →ₗ[F] V)
        (c : V →ₗ[F] M) (u : M →ₗ[F] Md) (c' : Md →ₗ[F] V) :
        N = c'.comp (u.comp c) := by sorry
-/

end CurveTheorems

section InvariantTheorems

variable {F I A V W U : Type*} [Field F] [Group I]
  [AddCommGroup A] [Module F A] [AddCommGroup V] [Module F V]
  [AddCommGroup W] [Module F W] [AddCommGroup U] [Module F U]

/- **Omitted signature** `arithmeticSpreading` (node `LPV.7:invariant-cycles/arithmetic-spreading`).
  ρ′ must be the representation of the spread finite-field model, identified with ρ through Weil II 1.11.3. Arbitrary representations have different images.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: arithmetic finite-presentation descent and tame-cover comparison
    of WeilII1.11.3. The identification must preserve the full representation image. -/
    theorem arithmeticSpreading {J : Type*} [Group J] (ρ : Representation F I V)
        (ρ' : Representation F J V) : Set.range ρ = Set.range ρ' := by sorry
-/

/- **Omitted signature** `continuousWangSequence` (node `LPV.7:invariant-cycles/continuous-wang-sequence`).
  The maps must be those of the continuous Wang sequence of the trait. Arbitrary maps (zero) are not exact.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: continuous inertia cohomology and the trait's generic fibre.
    The maps stand for coinvariants(-1)→generic trait H^i→fibre invariants
    for bounded constructible rational K, with no total-space smoothness premise. -/
    theorem continuousWangSequence (left : W →ₗ[F] V) (right : V →ₗ[F] U) :
        Function.Injective left ∧ LinearMap.range left = LinearMap.ker right ∧
          Function.Surjective right := by sorry
-/

/- **Omitted signature** `localizationDualityCross` (node `LPV.7:invariant-cycles/localization-duality-cross`).
  The four maps must be those of the localization–duality cross of Weil II 3.6.1. As typed, the arguments are arbitrary maps.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: the actual localization/Wang square and support-duality exchange.
    This is its commuting-map signature, retaining the two distinct paths. -/
    theorem localizationDualityCross (sp : A →ₗ[F] V) (obs : V →ₗ[F] W)
        (support : A →ₗ[F] U) (comparison : U →ₗ[F] W) :
        obs.comp sp = comparison.comp support := by sorry
-/

/- **Omitted signature** `invariantSupportWeightBounds` (node `LPV.7:invariant-cycles/invariant-and-support-weight-bounds`).
  The integers must be the weights of the invariant and support terms after finite-field descent. As typed, the arguments are arbitrary integers.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: the finite-field Frobenius realization, weight filtration and the
    local1.8.8 estimate. Bounds are displayed as integers, never free purity flags. -/
    theorem invariantSupportWeightBounds (i : ℤ)
        (invariantWeight supportWeight : ℤ) :
        invariantWeight ≤ i ∧ i+1 ≤ supportWeight := by sorry
-/

/- **Omitted signature** `localInvariantCycles` (node `LPV.7:invariant-cycles/local-invariant-cycles`).
  ρ and sp must be the inertia action on H^i(X_η̄, ℚ_ℓ) and the specialization from H^i(X_s, ℚ_ℓ) of a proper family over the henselized line with X essentially smooth and X_η smooth. For an arbitrary fixed-image map (zero) surjectivity fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: S=hensel(k[T]_(T)), algebraically closed k, X essentially smooth/k,
    smooth generic fibre, actual H^i realization and the weight cross. -/
    theorem localInvariantCycles {X S : Scheme} (f : X ⟶ S) [IsProper f]
        (ρ : Representation F I V) (sp : A →ₗ[F] V)
        (hfixed : ∀ a g, ρ g (sp a) = sp a) :
        Function.Surjective (invariantSpecialization ρ sp hfixed) := by sorry
-/

/- **Omitted signature** `complexLocalInvariantCycles` (node `LPV.7:invariant-cycles/complex-local-invariant-cycles`).
  ρ and sp must be the monodromy on H^i(X_t, ℚ) and the specialization of a projective disk family (gap G-complex-mhs). For an arbitrary fixed-image map (zero) surjectivity fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: proper smooth-total-space projectively factored disk family,
    Betti cohomology and the geometric MHS cross (G-complex-mhs). -/
    theorem complexLocalInvariantCycles [Module ℚ V] [Module ℚ A]
        (ρ : Representation ℚ I V) (sp : A →ₗ[ℚ] V)
        (hfixed : ∀ a g, ρ g (sp a) = sp a) :
        Function.Surjective (invariantSpecialization ρ sp hfixed) := by sorry
-/

/- **Omitted signature** `potentialPurityIncidencePullback` (node `LPV.7:invariant-cycles/potential-purity-incidence-pullback`).
  pulledK, dualPulled and pulledDual must be i*q*K, D(i*q*K) and i*q*DK for a sufficiently general incidence pencil. As typed, the arguments are arbitrary objects.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: sufficiently general incidence line, its actual constructible
    pullback, generic local acyclicity and arithmetic purity. The absolute model
    is input; the curve/section model and normalized duality iso are output. -/
    theorem potentialPurityIncidencePullback {B P X : Scheme} {p : P}
        (structuralMap : X ⟶ P) (K : DerivedCategory (ModuleCat.{0} ℚ))
        (M : GeometricGenericPureModel B P X p structuralMap K)
        (Xp S : Scheme) (f : Xp ⟶ S) [IsProper f]
        (pulledK dualPulled pulledDual : DerivedCategory (ModuleCat.{0} ℚ)) :
        Nonempty (PotentiallyPureModel B P Xp S p f pulledK) ∧
          Nonempty (dualPulled ≅ pulledDual) := by sorry
-/

/- **Omitted signature** `pureComplexLocalInvariantCycles` (node `LPV.7:invariant-cycles/pure-complex-local-invariant-cycles`).
  ρ and sp must be the inertia action and specialization on the hypercohomology of the potentially pure complex K. For an arbitrary fixed-image map (zero) surjectivity fails.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: geometric constructible realization/purity of K and the equicharacteristic
    trait. M keeps the model schemes/maps; it does not yet certify arithmetic purity. -/
    theorem pureComplexLocalInvariantCycles {B P X S : Scheme} {p : P}
        (f : X ⟶ S) [IsProper f] (K : DerivedCategory (ModuleCat.{0} ℚ))
        (M : PotentiallyPureModel B P X S p f K)
        (ρ : Representation F I V) (sp : A →ₗ[F] V)
        (hfixed : ∀ a g, ρ g (sp a) = sp a) :
        Function.Surjective (invariantSpecialization ρ sp hfixed) := by sorry
-/

/- **Omitted signature** `dualSupportAffineVanishing` (node `LPV.7:invariant-cycles/dual-support-affine-vanishing`).
  `Hcompact` must be the compactly supported cohomology of the affine complement for K satisfying the support bound. As typed, the arguments are arbitrary modules.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: X projective, actual support dimensions of DK[-2n-2] and compact
    cohomology of the affine hyperplane complement. The exact numerical bound is kept. -/
    theorem dualSupportAffineVanishing (n : ℤ)
        (dualSupportDimension : ℤ → WithBot ℤ)
        (hbound : ∀ j, dualSupportDimension j ≤ (n+1-j : ℤ))
        (Hcompact : ℤ → ModuleCat F) : ∀ i, i ≤ n → IsZero (Hcompact i) := by sorry
-/

/- **Omitted signature** `supportBoundWeakLefschetz` (node `LPV.7:invariant-cycles/support-bound-weak-lefschetz`).
  Hx, Hy and `restriction` must be the cohomology of X and of a hyperplane section and the restriction map, for K satisfying the support bound. As typed, the arguments are arbitrary.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: X projective, arbitrary hyperplane section, K constructible and
    the actual dual support realization. Smoothness/purity are not additional premises. -/
    theorem supportBoundWeakLefschetz (n : ℤ)
        (dualSupportDimension : ℤ → WithBot ℤ)
        (hbound : ∀ j, dualSupportDimension j ≤ (n+1-j : ℤ))
        (Hx Hy : ℤ → ModuleCat F) (restriction : ∀ i, Hx i →ₗ[F] Hy i) :
        (∀ i, i < n → Function.Bijective (restriction i)) ∧
          Function.Injective (restriction n) := by sorry
-/

/- **Omitted signature** `pencilRelativeObstruction` (node `LPV.7:invariant-cycles/pencil-relative-obstruction`).
  `detect` must be the local detection map of Weil II 4.3.6 for the pencil complex. An arbitrary map is not injective.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: actual P¹ relative hypercohomology, finite support below degree0
    and the local detection map of WeilII4.3.6–8. No orthogonal splitting is imported. -/
    theorem pencilRelativeObstruction (detect : V →ₗ[F] W) :
        Function.Injective detect := by sorry
-/

/- **Omitted signature** `pencilImageEquality` (node `LPV.7:invariant-cycles/pencil-image-equality`).
  `ambient` and `pencilSection` must be the two restriction maps to a fibre of a sufficiently general pencil. Arbitrary maps have different images.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: general-pencil axis/cone geometry and6.2.11 support bound;
    ambient and pencilSection are the two actual restrictions to every fibre. -/
    theorem pencilImageEquality (ambient : A →ₗ[F] V) (pencilSection : W →ₗ[F] V) :
        LinearMap.range ambient = LinearMap.range pencilSection := by sorry
-/

/-- Omitted: the incidence fundamental groups and sufficiently general line
giving the map q. Surjectivity is the imported generic-line theorem, not an
assumption that their dimensions agree. -/
theorem generalPencilMonodromy {J : Type*} [Group J]
    (ρ : Representation F I V) (q : J →* I) (hq : Function.Surjective q) :
    Set.range (ρ.comp q) = Set.range ρ := by sorry

/- **Omitted signature** `globalInvariantCycles` (node `LPV.7:invariant-cycles/global-invariant-cycles`).
  ρ and `restriction` must be the π₁(U, u)-action on H^n(Y_u, K) and the ambient restriction, for K with a pure model and the support bound. As typed, the arguments are arbitrary.
  Its premise-free form, kept for the name and the shape of the conclusion:
    /-- Omitted: projective incidence and cohomology realization, K potentially pure
    with its full arithmetic witness, the support bound and sufficiently general u.
    This exports to DWP.9 and uses no hard-Lefschetz premise. -/
    theorem globalInvariantCycles {B P X : Scheme} {p : P}
        (structuralMap : X ⟶ P) (K : DerivedCategory (ModuleCat.{0} ℚ))
        (M : GeometricGenericPureModel B P X p structuralMap K) (n : ℤ)
        (dualSupportDimension : ℤ → WithBot ℤ)
        (hbound : ∀ j, dualSupportDimension j ≤ (n+1-j : ℤ))
        (ρ : Representation F I V) (restriction : A →ₗ[F] V)
        (hfixed : ∀ a g, ρ g (restriction a) = restriction a) :
        Function.Bijective (invariantSpecialization ρ restriction hfixed) := by sorry
-/

end InvariantTheorems

end TauCeti.LPV7
