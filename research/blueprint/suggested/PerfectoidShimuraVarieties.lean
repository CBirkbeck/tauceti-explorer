/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PerfectoidShimuraVarieties.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and signatures.
They claim no implementation.

BP-PerfectoidShimuraVarieties~2, issue #6998; every implementationStatus remains unchecked.
Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The concrete fragments use the existing group, matrix, topology and categorical carriers.
Category-valued recipes take the canonical-model tower, analytification and diamondification
as supplied functors. They express composition, limits and fully faithful lifting only:
they do not construct those suppliers or assert spatiality, perfectoidness or tilde-limits.
The supplied perfectoid category and fixed-base diamond functor are parameters, not new
geometric carriers. The representative record below retains only its diamond description;
the good-affinoid and tilde-limit conditions cannot yet be stated at this pin and are omitted.

The reader's prototype ledger lists exactly which portions are stated and which geometric
APIs/tests have no signature. There are no comment-only CONTRACT declarations. Compilation
checks these concrete fragments; it does not establish geometric coverage of the packet.
-/

import Mathlib.Data.Matrix.Block
import Mathlib.Data.Matrix.ColumnRowPartitioned
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Algebra.Group.Units
import Mathlib.Topology.Instances.Matrix
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Final
import Mathlib.CategoryTheory.Functor.FullyFaithful
import Mathlib.CategoryTheory.Whiskering
import Mathlib.CategoryTheory.Sites.Limits
import Mathlib.GroupTheory.Coset.Defs
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.RingTheory.Trace.Basic
import Mathlib.Topology.MetricSpace.HausdorffDistance
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Topology.MetricSpace.Ultra.Basic

/-! ## S0: level groups of `GSp_{2g}` (`PerfectoidShimuraVarieties:S0/siegel-level-subgroups`)

Native prototype: Mathlib has `Matrix.J`, `Matrix.symplecticGroup`, `GL`, `PadicInt.toZModPow`
and the congruence subgroups of `SL(2, ℤ)`, so the similitude group and the level groups can be
stated against them directly. -/

namespace TauCeti.GSp

open Matrix

variable (g : Type*) [Fintype g] [DecidableEq g] (R : Type*) [CommRing R]

/-- `GSp_{2g}(R)`: invertible matrices `γ` with `γ J γᵀ = c • J` for a unit `c`, where `J` is
Mathlib's `Matrix.J` (Scholze's form is `-J`; the group does not depend on the sign). For `c = 1`
this is Mathlib's `Matrix.symplecticGroup`. -/
def gsp : Subgroup (GL (g ⊕ g) R) where
  carrier := {γ | ∃ c : Rˣ, (γ : Matrix (g ⊕ g) (g ⊕ g) R) * J g R *
    (γ : Matrix (g ⊕ g) (g ⊕ g) R)ᵀ = (c : R) • J g R}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The similitude character `c : GSp_{2g}(R) → Rˣ` (well defined because `J` is invertible and
`g` is nonempty). -/
def similitude [Nonempty g] : gsp g R →* Rˣ := sorry

/-- `γ J γᵀ = c(γ) J`. -/
theorem similitude_spec [Nonempty g] (γ : gsp g R) :
    ((γ : GL (g ⊕ g) R) : Matrix (g ⊕ g) (g ⊕ g) R) * J g R *
        ((γ : GL (g ⊕ g) R) : Matrix (g ⊕ g) (g ⊕ g) R)ᵀ =
      (similitude g R γ : R) • J g R := sorry

/-- Elements of similitude `1` are Mathlib's symplectic matrices. -/
theorem mem_symplecticGroup_of_similitude_eq_one [Nonempty g] (γ : gsp g R)
    (h : similitude g R γ = 1) :
    ((γ : GL (g ⊕ g) R) : Matrix (g ⊕ g) (g ⊕ g) R) ∈ symplecticGroup g R := sorry

variable (p : ℕ) [Fact p.Prime]

/-- Reduction modulo `pᵐ` of a matrix over `ℤ_p`. -/
noncomputable def reduce (m : ℕ) (γ : gsp g ℤ_[p]) : Matrix (g ⊕ g) (g ⊕ g) (ZMod (p ^ m)) :=
  ((γ : GL (g ⊕ g) ℤ_[p]) : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p]).map (PadicInt.toZModPow m)

/-- `Γ(pᵐ)`: the kernel of reduction modulo `pᵐ`. -/
def levelGamma (m : ℕ) : Subgroup (gsp g ℤ_[p]) where
  carrier := {γ | reduce g p m γ = 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `Γ₁(pᵐ)`: reduction modulo `pᵐ` is block upper triangular with identity diagonal blocks. -/
def levelGamma1 (m : ℕ) : Subgroup (gsp g ℤ_[p]) where
  carrier := {γ | ∀ i j : g, reduce g p m γ (Sum.inr i) (Sum.inl j) = 0 ∧
    reduce g p m γ (Sum.inl i) (Sum.inl j) = (1 : Matrix g g (ZMod (p ^ m))) i j ∧
    reduce g p m γ (Sum.inr i) (Sum.inr j) = (1 : Matrix g g (ZMod (p ^ m))) i j}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `Γ₀(pᵐ)`: block upper triangular modulo `pᵐ` with similitude `≡ 1 mod pᵐ`. The printed
definition (Scholze, Definition 3.1.1) asks `det γ ≡ 1`; the similitude condition is the
corrected one (`PerfectoidShimuraVarieties/E1`). -/
def levelGamma0 [Nonempty g] (m : ℕ) : Subgroup (gsp g ℤ_[p]) where
  carrier := {γ | (∀ i j : g, reduce g p m γ (Sum.inr i) (Sum.inl j) = 0) ∧
    PadicInt.toZModPow m (similitude g ℤ_[p] γ : ℤ_[p]) = 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `Γ(pᵐ) ≤ Γ₁(pᵐ) ≤ Γ₀(pᵐ)`, and each family decreases in `m`. -/
theorem levelGamma_le_levelGamma1 (m : ℕ) : levelGamma g p m ≤ levelGamma1 g p m := sorry

theorem levelGamma1_le_levelGamma0 [Nonempty g] (m : ℕ) :
    levelGamma1 g p m ≤ levelGamma0 g p m := sorry

theorem levelGamma_antitone : Antitone (levelGamma g p) := sorry

theorem levelGamma1_antitone : Antitone (levelGamma1 g p) := sorry

theorem levelGamma0_antitone [Nonempty g] : Antitone (levelGamma0 g p) := sorry

/-- `Γ(pᵐ)` is normal in `GSp_{2g}(ℤ_p)`. -/
instance levelGamma_normal (m : ℕ) : (levelGamma g p m).Normal := sorry

/-- `Γ₁(pᵐ)` is normal in `Γ₀(pᵐ)`. -/
instance levelGamma1_normal_in_levelGamma0 [Nonempty g] (m : ℕ) :
    ((levelGamma1 g p m).subgroupOf (levelGamma0 g p m)).Normal := sorry

/-- `Γ₀(pᵐ)/Γ₁(pᵐ) ≅ GL_g(ℤ/pᵐ)` through the upper-left block. -/
def levelGamma0QuotGamma1 [Nonempty g] (m : ℕ) :
    (levelGamma0 g p m) ⧸ ((levelGamma1 g p m).subgroupOf (levelGamma0 g p m)) ≃*
      GL g (ZMod (p ^ m)) := sorry

/-- Cofinality inside the integral compact open: every open subgroup contains a
principal congruence subgroup. Intersecting a compact open of `GSp(ℚ_p)` with `GSp(ℤ_p)`
gives the ambient witness required by `PerfectoidSpaces:P7/level-cofinality-witness`. -/
theorem levelGamma_cofinal (U : Subgroup (gsp g ℤ_[p]))
    (hU : IsOpen (U : Set (gsp g ℤ_[p]))) : ∃ m, levelGamma g p m ≤ U := sorry

/-- Intersection triviality is a separate consequence, not the cofinality interface. -/
theorem levelGamma_iInf_eq_bot : ⨅ m, levelGamma g p m = ⊥ := sorry

/-- The multiplier lies in the reduction kernel `U_m`; at `m = 0`, `U_0 = ℤ_pˣ`,
not the expression `1 + ℤ_p` as a unit subgroup. -/
theorem similitude_levelGamma0_mem [Nonempty g] (m : ℕ) (γ : levelGamma0 g p m) :
    PadicInt.toZModPow m (similitude g ℤ_[p] γ : ℤ_[p]) = 1 := sorry

/-- Unit test `levelGamma_m_zero` (degenerate): at `m = 0` every condition is empty. -/
example : levelGamma g p 0 = ⊤ := sorry

/-- Unit test `levelGamma_m_zero` (degenerate), `Γ₀` part. -/
example [Nonempty g] : levelGamma0 g p 0 = ⊤ := sorry

/-- Unit test `levelGamma1_not_cofinal` (non-example): the unipotent `(1 1; 0 1)` lies in every
`Γ₁(pᵐ)` and not in `Γ(p)`, so `⋂ₘ Γ₁(pᵐ) ≠ 1`. -/
example [Nonempty g] : ⨅ m, levelGamma1 g p m ≠ ⊥ := sorry

/-- The genus-one specialisation: `GSp_2 = GL_2` with similitude `det`. -/
theorem gsp_genusOne : gsp (Fin 1) R = ⊤ := sorry

/-- API `levelGamma_genusOne` (compatibility, `g = 1`): an integral matrix of determinant `1`
lies in `Γ(pᵐ)` exactly when it lies in Mathlib's `CongruenceSubgroup.Gamma (p ^ m)`.
`toGSp` is the inclusion `SL(2, ℤ) → GSp_2(ℤ_p)` through `ℤ → ℤ_p` and the index change
`Fin 2 ≃ Fin 1 ⊕ Fin 1`. -/
theorem levelGamma_genusOne (toGSp : Matrix.SpecialLinearGroup (Fin 2) ℤ →* gsp (Fin 1) ℤ_[p])
    (htoGSp : ∀ A i j, ((toGSp A : GL (Fin 1 ⊕ Fin 1) ℤ_[p]) : Matrix _ _ ℤ_[p]) i j =
      ((A : Matrix (Fin 2) (Fin 2) ℤ) (finSumFinEquiv (m := 1) (n := 1) i)
        (finSumFinEquiv (m := 1) (n := 1) j) : ℤ_[p]))
    (m : ℕ) (A : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    toGSp A ∈ levelGamma (Fin 1) p m ↔ A ∈ CongruenceSubgroup.Gamma (p ^ m) := sorry

/-- Unit test `levelGamma_index_g1` (computation): for `g = 1`, `m = 1`,
`[Γ₀(p) : Γ₁(p)] = p - 1` and `[Γ₁(p) : Γ(p)] = p`. -/
example : ((levelGamma1 (Fin 1) p 1).subgroupOf (levelGamma0 (Fin 1) p 1)).index = p - 1 ∧
    ((levelGamma (Fin 1) p 1).subgroupOf (levelGamma1 (Fin 1) p 1)).index = p := sorry

/-- Unit test `levelGamma_index_g1` (computation), first part: `[GSp_2(ℤ_p) : Γ(p)]` is the
order of `GL_2(𝔽_p)`. -/
example : (levelGamma (Fin 1) p 1).index = (p ^ 2 - 1) * (p ^ 2 - p) := sorry

/-- Unit test `levelGamma0_similitude_not_det` (non-example): for `g = 2` and `p` odd, the
element `γ = diag(1, 1, -1, -1)` has `det γ = 1`, so it satisfies the printed condition
`det γ ≡ 1 mod p`, but `c(γ) = -1`, so it is not in `Γ₀(p)`. -/
example (hp : p ≠ 2) (γ : gsp (Fin 2) ℤ_[p])
    (hγ : ((γ : GL (Fin 2 ⊕ Fin 2) ℤ_[p]) : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℤ_[p]) =
      Matrix.fromBlocks 1 0 0 (-1)) :
    ((γ : GL (Fin 2 ⊕ Fin 2) ℤ_[p]) : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℤ_[p]).det = 1 ∧
      (similitude (Fin 2) ℤ_[p] γ : ℤ_[p]) = -1 ∧ γ ∉ levelGamma0 (Fin 2) p 1 := sorry

end TauCeti.GSp

/-- Unit test `levelGamma_inter_SL2Z` (compatibility, `g = 1`): an element of `SL(2, ℤ)` lies in
`CongruenceSubgroup.Gamma1 (p ^ m)` exactly when it is `≡ (1 *; 0 1) mod pᵐ`, the defining
condition of `Γ₁(pᵐ)` (and `Γ(pᵐ)`, `Γ₀(pᵐ)` likewise). -/
example (p m : ℕ) (A : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    A ∈ CongruenceSubgroup.Gamma1 (p ^ m) ↔
      ((A 0 0 : ℤ) : ZMod (p ^ m)) = 1 ∧ ((A 1 1 : ℤ) : ZMod (p ^ m)) = 1 ∧
        ((A 1 0 : ℤ) : ZMod (p ^ m)) = 0 :=
  CongruenceSubgroup.Gamma1_mem (p ^ m) A

/-! ## S0: effective deck groups (`PerfectoidShimuraVarieties:S0/tower-action-kernel`)

The group-theoretic carrier of the kernel `Z_{K^p}`: the closure in `G(ℚ_p)` of a subgroup of
central rational elements, Mathlib's `Subgroup.topologicalClosure`. -/

section Kernel

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The kernel of the tower action contains the rational central elements themselves. -/
example (Z : Subgroup G) : Z ≤ Z.topologicalClosure := Z.le_topologicalClosure

end Kernel

/-! ## S0: rigidified towers (`PerfectoidShimuraVarieties:S0/rigidified-moduli-tower`) -/

/-- Unit test `rigidified_hilbert_delta_order` (computation), the arithmetic input: in
`ℤ[ω]`, `ω = (1 + √5)/2`, written as pairs `a + b·ω` with `ω² = ω + 1`, the powers
`ω², ω³, ω⁶` are `1 + ω`, `1 + 2ω`, `5 + 8ω`; so `ω` has order `6` modulo `4` (and `ω³ ≢ -1`). -/
example : let mul : ℤ × ℤ → ℤ × ℤ → ℤ × ℤ := fun x y ↦
      (x.1 * y.1 + x.2 * y.2, x.1 * y.2 + x.2 * y.1 + x.2 * y.2)
    let ω : ℤ × ℤ := (0, 1)
    let ω2 := mul ω ω
    let ω3 := mul ω ω2
    ω2 = (1, 1) ∧ ω3 = (1, 2) ∧ mul ω3 ω3 = (5, 8) := by decide

/-- Review counterexample for E26: in the inert residue field at `p = 7`, the fundamental
unit of `ℚ(√5)` has eighth power `-1` and sixteenth power `1`. This is the local calculation
used with tame level `N = 4`; the full unit-group quotient argument is in the review report. -/
example : let mul : ZMod 7 × ZMod 7 → ZMod 7 × ZMod 7 → ZMod 7 × ZMod 7 := fun x y ↦
      (x.1 * y.1 + x.2 * y.2, x.1 * y.2 + x.2 * y.1 + x.2 * y.2)
    let ω : ZMod 7 × ZMod 7 := (0, 1)
    let ω2 := mul ω ω
    let ω4 := mul ω2 ω2
    let ω8 := mul ω4 ω4
    ω8 = (-1, 0) ∧ mul ω8 ω8 = (1, 0) := by decide

/-- Review counterexample for E41: nonidentity upper-unipotent elements can cancel.
Thus membership of a product in a parabolic cannot force both factors to be the identity. -/
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) * !![1, -1; 0, 1] = 1 ∧
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) ≠ 1 := by decide

/-! ## S3: the Siegel graph chart (`PerfectoidShimuraVarieties:S3/siegel-graph-chart-and-frame`)

Points of the big cell of the Lagrangian Grassmannian are row spaces of `(1 Z)`; `γ = (A B; C D)`
acts on the right on row vectors. The matrix identities behind the chart action and the frame
transformation are stated natively; the affinoid chart and the geometric frame require the missing supplier carriers. -/

namespace TauCeti.HodgeTate

open Matrix

variable {g : Type*} [Fintype g] [DecidableEq g] {R : Type*} [CommRing R]

/-- The factor of automorphy `A + ZC` of `γ = (A B; C D)` at the chart point `Z`. -/
def chartFactor (A C Z : Matrix g g R) : Matrix g g R := A + Z * C

/-- The chart action `Z·γ = (A + ZC)⁻¹(B + ZD)`. -/
noncomputable def chartAction (A B C D Z : Matrix g g R) : Matrix g g R :=
  (chartFactor A C Z)⁻¹ * (B + Z * D)

/-- API `siegelGraphChart_act`: `(1 Z)γ = (A + ZC)(1  Z·γ)` whenever `A + ZC` is invertible. -/
theorem siegelGraphChart_act (A B C D Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    Matrix.fromCols (1 : Matrix g g R) Z * Matrix.fromBlocks A B C D =
      chartFactor A C Z * Matrix.fromCols 1 (chartAction A B C D Z) := sorry

/-- Unit test `graph_factor_identity` (degenerate): for `γ = 1`, `A + ZC = 1` and `Z·γ = Z`. -/
example (Z : Matrix g g R) : chartFactor 1 0 Z = 1 ∧ chartAction 1 0 0 1 Z = Z := sorry

/-- Unit test `graph_factor_g1` (computation): for `g = 1`,
`(1 z)γ = (a + zc)(1, (b + zd)/(a + zc))`. -/
example {K : Type*} [Field K] (a b c d z : K) (h : a + z * c ≠ 0) :
    chartFactor !![a] !![c] !![z] = !![a + z * c] ∧
      chartAction !![a] !![b] !![c] !![d] !![z] = !![(b + z * d) / (a + z * c)] := sorry

/-- Unit test `graph_factor_cocycle` (characterisation): the factor of `γγ'` at `Z` is the factor
of `γ` at `Z` times the factor of `γ'` at `Z·γ`. -/
example (A B C D A' B' C' D' Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    chartFactor (A * A' + B * C') (C * A' + D * C') Z =
      chartFactor A C Z * chartFactor A' C' (chartAction A B C D Z) := sorry

/-- Unit test `graph_unit_needs_iwahori` (non-example): for `g = 1`, `γ = (0 1; 1 0)` and `z = 0`
the factor `a + zc` is `0`, not a unit. -/
example {K : Type*} [Field K] : ¬ IsUnit (chartFactor (0 : Matrix (Fin 1) (Fin 1) K) 1 0).det := by
  simp [chartFactor]

/-- API `det_factor_isUnit`, integral form: if `C ≡ 0 mod p` and `A` is invertible, then for every
integral `Z` the determinant of `A + ZC` is congruent to `det A` modulo `p`, hence a unit of
`ℤ_p`. -/
theorem det_factor_isUnit (p : ℕ) [Fact p.Prime] (A C Z : Matrix g g ℤ_[p])
    (hC : ∀ i j, PadicInt.toZMod (C i j) = 0) (hA : IsUnit A.det) :
    IsUnit (chartFactor A C Z).det ∧
      PadicInt.toZMod (chartFactor A C Z).det = PadicInt.toZMod A.det := sorry

end TauCeti.HodgeTate


/-! S0/S0.general: categorical portions of supplied towers. No finiteness, neatness,
open immersion or spatiality condition is asserted here. The compact-open level category,
canonical models and all geometric functors are supplied by their owners. -/

namespace TauCeti.ShimuraTower

open CategoryTheory CategoryTheory.Limits

universe u v w u' v' w'

section Towers
variable {L : Type u} [Category.{v} L]
variable {Models : Type u'} [Category.{v'} Models]
variable {Analytic : Type w} [Category.{w'} Analytic]

/-- S0/p-level-tower: compose the supplied canonical-model tower with base-change/analytification. -/
def pLevel (models : L ⥤ Models) (analytic : Models ⥤ Analytic) : L ⥤ Analytic :=
  models ⋙ analytic

/-- The same recipe for the supplied minimal models. -/
def pLevelMin (modelsMin : L ⥤ Models) (analytic : Models ⥤ Analytic) : L ⥤ Analytic :=
  modelsMin ⋙ analytic

/-- The natural transformation obtained by analytifying the supplied open-to-minimal maps.
The condition that its components are open immersions is omitted. -/
def toMin {models modelsMin : L ⥤ Models} (openToMin : models ⟶ modelsMin)
    (analytic : Models ⥤ Analytic) : pLevel models analytic ⟶ pLevelMin modelsMin analytic :=
  Functor.whiskerRight openToMin analytic

/-- API transition_comp, including identity transitions. -/
theorem transition_comp (F : L ⥤ Analytic) {i j k : L} (f : i ⟶ j) (g : j ⟶ k) :
    F.map (f ≫ g) = F.map f ≫ F.map g ∧ F.map (𝟙 i) = 𝟙 (F.obj i) := sorry

/-- Categorical portion of reindex: actual restriction, before any cofinality claim. -/
def reindex {L' : Type*} [Category L'] (F : L ⥤ Analytic) (r : L' ⥤ L) : L' ⥤ Analytic := r ⋙ F

/-- S0/infinite-level-diamond: the limit in a supplied sheaf category, not a proof of diamondhood. -/
noncomputable def infiniteLevel {S : Type*} [Category S] (J : GrothendieckTopology S)
    (diamond : Analytic ⥤ Sheaf J (Type v)) (F : L ⥤ Analytic)
    [HasLimit (F ⋙ diamond)] : Sheaf J (Type v) := limit (F ⋙ diamond)

noncomputable def infiniteLevelMin {S : Type*} [Category S] (J : GrothendieckTopology S)
    (diamond : Analytic ⥤ Sheaf J (Type v)) (Fmin : L ⥤ Analytic)
    [HasLimit (Fmin ⋙ diamond)] : Sheaf J (Type v) := limit (Fmin ⋙ diamond)

/-- API projection: only its categorical map, with qcqs omitted. -/
noncomputable def infiniteLevel.proj {S : Type*} [Category S] (J : GrothendieckTopology S)
    (diamond : Analytic ⥤ Sheaf J (Type v)) (F : L ⥤ Analytic)
    [HasLimit (F ⋙ diamond)] (i : L) : infiniteLevel J diamond F ⟶ diamond.obj (F.obj i) :=
  limit.π (F ⋙ diamond) i

/-- A cone to the analytified/diamondified levels is determined by its components. -/
theorem infiniteLevel_hom_ext {D : Type*} [Category D] (F : L ⥤ D) [HasLimit F]
    {X : D} (f g : X ⟶ limit F) (h : ∀ i, f ≫ limit.π F i = g ≫ limit.π F i) : f = g := sorry

/-- The categorical cofinality interface requires an initial functor, not just trivial intersection. -/
noncomputable def infiniteLevel_reindex {D : Type*} [Category D] {L' : Type*} [Category L']
    (F : L ⥤ D) (r : L' ⥤ L) [r.Initial] [HasLimit F] [HasLimit (r ⋙ F)] :
    limit F ≅ limit (r ⋙ F) := sorry

/-- S0.general uses the same limit recipe. Canonical models for a general datum remain a supplier. -/
noncomputable def generalInfiniteLevel {D : Type*} [Category D] (F : L ⥤ D) [HasLimit F] : D :=
  limit F

/-- S0.general/toroidal-tower-diamond: diagram supplied with cone-compatible finite-level maps. -/
def toroidal (modelsTor : L ⥤ Models) (analytic : Models ⥤ Analytic) : L ⥤ Analytic :=
  modelsTor ⋙ analytic

noncomputable def toroidalInfiniteLevel {D : Type*} [Category D] (Ftor : L ⥤ D)
    [HasLimit Ftor] : D := limit Ftor

/-- Only the underlying limit morphism is stated, not the open-immersion condition. -/
noncomputable def toroidalInfiniteLevel.openEmbedding {D : Type*} [Category D]
    {Fopen Ftor : L ⥤ D} [HasLimit Fopen] [HasLimit Ftor]
    (openToTor : Fopen ⟶ Ftor) : limit Fopen ⟶ limit Ftor := limMap openToTor

noncomputable def toroidalInfiniteLevel.toMin {D : Type*} [Category D]
    {Ftor Fmin : L ⥤ D} [HasLimit Ftor] [HasLimit Fmin]
    (torToMin : Ftor ⟶ Fmin) : limit Ftor ⟶ limit Fmin := limMap torToMin

noncomputable def toroidalInfiniteLevel.refine {D : Type*} [Category D]
    {Fref Ftor : L ⥤ D} [HasLimit Fref] [HasLimit Ftor]
    (refinement : Fref ⟶ Ftor) : limit Fref ⟶ limit Ftor := limMap refinement

/-- The cone-refinement square is checked at every finite level. -/
theorem toroidalInfiniteLevel_refine_toMin {D : Type*} [Category D]
    {Fref Ftor Fmin : L ⥤ D} [HasLimit Fref] [HasLimit Ftor] [HasLimit Fmin]
    (r : Fref ⟶ Ftor) (m : Ftor ⟶ Fmin) :
    toroidalInfiniteLevel.refine r ≫ toroidalInfiniteLevel.toMin m = limMap (r ≫ m) := sorry

/-- S0/connected-component-tower: the neutral subtower is supplied, not constructed from points. -/
def neutralComponent (neutralModels : L ⥤ Models) (analytic : Models ⥤ Analytic) : L ⥤ Analytic :=
  neutralModels ⋙ analytic

def neutralComponent.toFull {neutral full : L ⥤ Models} (inclusion : neutral ⟶ full)
    (analytic : Models ⥤ Analytic) : neutralComponent neutral analytic ⟶ pLevel full analytic :=
  Functor.whiskerRight inclusion analytic

/-- Identity and composition tests of the actual tower recipe. These are algebraic portions,
not substitutes for the modular-curve component-count and degree tests. -/
example (F : L ⥤ Models) (A : Models ⥤ Analytic) (i : L) :
    (pLevel F A).obj i = A.obj (F.obj i) := sorry

example (F : L ⥤ Models) (A : Models ⥤ Analytic) (i : L) :
    (pLevel F A).map (𝟙 i) = 𝟙 (A.obj (F.obj i)) := sorry

example (F : L ⥤ Analytic) : reindex F (𝟭 L) = F := sorry

/-- Algebraic portion of toroidal_refinement_iso_open: refinements restrict to the identity
on the supplied open diagram; generic geometric refinement is not proved. -/
example {D : Type*} [Category D] (F : L ⥤ D) [HasLimit F] :
    toroidalInfiniteLevel.refine (𝟙 F) = 𝟙 (limit F) := sorry

end Towers

section Representation
variable {L : Type u} [Category.{v} L]
variable {Perf : Type u'} [Category.{v'} Perf]
variable {D : Type w} [Category.{w'} D]

/-- S0/perfectoid-representative, diamond portion only. `Perf` and its fixed-base
fully faithful diamond functor must be supplied. Good-affinoid and tilde-limit conditions
are omitted because their carriers are unavailable. No Prop-valued geometric field is used. -/
structure PerfectoidRepresentative (diamond : Perf ⥤ D) (F : L ⥤ D) [HasLimit F] where
  space : Perf
  diamondIso : diamond.obj space ≅ limit F

/-- S0's existence predicate, for the diamond portion of a representative only. -/
def IsPerfectoidTower (diamond : Perf ⥤ D) (F : L ⥤ D) [HasLimit F] : Prop :=
  Nonempty (PerfectoidRepresentative diamond F)

namespace PerfectoidRepresentative
variable (diamond : Perf ⥤ D) [diamond.Full] [diamond.Faithful]
variable {F F' F'' : L ⥤ D} [HasLimit F] [HasLimit F'] [HasLimit F'']

/-- Actual supplier-based constructor. The omitted chart condition is described above. -/
def ofDiamondIso (Y : Perf) (e : diamond.obj Y ≅ limit F) :
    PerfectoidRepresentative diamond F := ⟨Y, e⟩

/-- Two supplied representatives have an isomorphism using full faithfulness at fixed base. -/
noncomputable def unique (Y Z : PerfectoidRepresentative diamond F) : Y.space ≅ Z.space :=
  diamond.preimageIso (Y.diamondIso ≪≫ Z.diamondIso.symm)

/-- Lift a cone on the diamondified levels to a morphism of supplied perfectoid objects. -/
noncomputable def lift (Y : PerfectoidRepresentative diamond F) (Z : Perf)
    (c : Cone F) (e : diamond.obj Z ≅ c.pt) : Z ⟶ Y.space :=
  diamond.preimage (e.hom ≫ limit.lift F c ≫ Y.diamondIso.inv)

/-- API lift's equation at each level: the unique map realizes the actual cone. -/
theorem lift_π (Y : PerfectoidRepresentative diamond F) (Z : Perf)
    (c : Cone F) (e : diamond.obj Z ≅ c.pt) (i : L) :
    diamond.map (lift diamond Y Z c e) ≫ Y.diamondIso.hom ≫ limit.π F i = e.hom ≫ c.π.app i := sorry

noncomputable def map (Y : PerfectoidRepresentative diamond F)
    (Z : PerfectoidRepresentative diamond F') (f : F ⟶ F') : Y.space ⟶ Z.space :=
  diamond.preimage (Y.diamondIso.hom ≫ limMap f ≫ Z.diamondIso.inv)

theorem map_id (Y : PerfectoidRepresentative diamond F) : map diamond Y Y (𝟙 F) = 𝟙 Y.space := sorry

theorem map_comp (Y : PerfectoidRepresentative diamond F) (Z : PerfectoidRepresentative diamond F')
    (W : PerfectoidRepresentative diamond F'') (f : F ⟶ F') (g : F' ⟶ F'') :
    map diamond Y W (f ≫ g) = map diamond Y Z f ≫ map diamond Z W g := sorry

/-- Uniqueness concerns maps compatible with the given cone, not all automorphisms of Y. -/
theorem unique_compatible (Y Z : PerfectoidRepresentative diamond F) (f : Y.space ⟶ Z.space)
    (h : diamond.map f ≫ Z.diamondIso.hom = Y.diamondIso.hom) :
    f = (unique diamond Y Z).hom := sorry

/-- Test representative_compatible_tilde, diamond-isomorphism portion only. -/
example (Y : PerfectoidRepresentative diamond F) : IsIso Y.diamondIso.hom := sorry

/-- Test representative_perfectoid_constant, at the singleton index. The analytic
perfectoid constant is a supplied object; no tilde-limit condition is asserted. -/
example (Y : Perf) (F : Discrete PUnit ⥤ D) [HasLimit F]
    (e : diamond.obj Y ≅ limit F) :
    (ofDiamondIso diamond Y e).space = Y := sorry

end PerfectoidRepresentative

/-- S4/property-p: diamond representability of every supplied minimal tower.
`Tame` and `Fmin` are supplied, not fake Shimura-data carriers. -/
def PropertyP {Tame : Type*} (diamond : Perf ⥤ D) (Fmin : Tame → L ⥤ D)
    [∀ k, HasLimit (Fmin k)] : Prop := ∀ k, IsPerfectoidTower diamond (Fmin k)

def ConnectedPropertyP {Arithmetic : Type*} (diamond : Perf ⥤ D) (Fneutral : Arithmetic → L ⥤ D)
    [∀ Γ, HasLimit (Fneutral Γ)] : Prop := ∀ Γ, IsPerfectoidTower diamond (Fneutral Γ)

/-- Invariance under a supplied isomorphism of minimal diagrams. This supplies only
propertyP_iso's categorical part; isomorphisms of data belong to ShimuraData. -/
theorem propertyP_iso {Tame : Type*} (diamond : Perf ⥤ D)
    (Fmin Gmin : Tame → L ⥤ D) [∀ k, HasLimit (Fmin k)] [∀ k, HasLimit (Gmin k)]
    (e : ∀ k, Fmin k ≅ Gmin k) : PropertyP diamond Fmin ↔ PropertyP diamond Gmin := sorry

end Representation
end TauCeti.ShimuraTower

/-! S0: the algebraic right-action convention and effective quotient.
These are point/set portions. Continuity as a sheaf action, arithmetic kernel equality,
pro-étaleness and geometric torsors require their supplier notions. -/

namespace TauCeti.ShimuraTower
section Action
variable {G X : Type*} [Group G] [MulAction Gᵐᵒᵖ X]

/-- Right translation on a supplied tower's points, encoded as an opposite-group action. -/
def translate (g : G) : X ≃ X := MulAction.toPermHom Gᵐᵒᵖ X (MulOpposite.op g)

theorem translate_one : translate (X := X) (1 : G) = Equiv.refl X := sorry

theorem translate_mul (g h : G) :
    translate (X := X) (g * h) = (translate g).trans (translate h) := sorry

/-- Kernel elements, rather than every element of a finite level, act trivially on X. -/
theorem translate_of_mem (k : G) (h : MulOpposite.op k ∈ (MulAction.toPermHom Gᵐᵒᵖ X).ker) :
    translate (X := X) k = Equiv.refl X := sorry

/-- Equivariance of a supplied transition map, with its actual actions. -/
theorem translate_comm_transition {Y : Type*} [MulAction Gᵐᵒᵖ Y] (f : X → Y)
    (hf : ∀ (g : G) (x : X), f (MulOpposite.op g • x) = MulOpposite.op g • f x) (g : G) :
    f ∘ translate g = translate g ∘ f := sorry

/-- An ineffective action factors through the quotient by a subgroup of its kernel.
Normality and annihilation are actual hypotheses, not inferred from neatness. -/
def quotientAction (N : Subgroup Gᵐᵒᵖ) [N.Normal]
    (hN : N ≤ (MulAction.toPermHom Gᵐᵒᵖ X).ker) : (Gᵐᵒᵖ ⧸ N) →* Equiv.Perm X :=
  QuotientGroup.lift N (MulAction.toPermHom Gᵐᵒᵖ X) hN

theorem quotientAction_mk (N : Subgroup Gᵐᵒᵖ) [N.Normal]
    (hN : N ≤ (MulAction.toPermHom Gᵐᵒᵖ X).ker) (g : G) :
    quotientAction N hN (QuotientGroup.mk' N (MulOpposite.op g)) = translate g := sorry

/-- With the whole kernel removed, the descended permutation representation is injective. -/
theorem quotientAction_effective : Function.Injective
    (quotientAction (X := X) (MulAction.toPermHom Gᵐᵒᵖ X).ker le_rfl) := sorry

/-- The subgroup preserving a specified component in the actual component action. -/
def neutralSymmetry {Components : Type*} [MulAction Gᵐᵒᵖ Components] (c : Components) :
    Subgroup Gᵐᵒᵖ := MulAction.stabilizer Gᵐᵒᵖ c

/-- Test translate_mul_order: a concrete noncommuting pair of right multipliers. -/
example : let g : Matrix (Fin 2) (Fin 2) ℤ := !![1, 1; 0, 1]
    let h : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; 1, 1]
    (1 * g) * h = 1 * (g * h) ∧ g * h ≠ h * g := by decide

example (x : X) : translate (1 : G) x = x := sorry

example (N : Subgroup Gᵐᵒᵖ) [N.Normal]
    (hN : N ≤ (MulAction.toPermHom Gᵐᵒᵖ X).ker) (n : N) :
    quotientAction N hN (QuotientGroup.mk' N n) = 1 := sorry

end Action

section Closure
variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The actual closed-subgroup carrier used for the arithmetic central kernel. The rational
central subgroup and its prime-to-p condition are supplied, not claimed to be constructed. -/
def centralKernelClosure (rationalImage : Subgroup G) : Subgroup G := rationalImage.topologicalClosure

theorem centralKernelClosure_closed (Z : Subgroup G) : IsClosed (centralKernelClosure Z : Set G) := sorry

theorem centralKernelClosure_minimal (Z H : Subgroup G) (h : Z ≤ H) (hH : IsClosed (H : Set G)) :
    centralKernelClosure Z ≤ H := sorry

/-- Closure must use all of the supplied tame-congruence units; no positivity restriction
is inserted by this carrier. -/
example (Z : Subgroup G) : Z ≤ centralKernelClosure Z := sorry

example (Z : Subgroup G) (hZ : IsClosed (Z : Set G)) : centralKernelClosure Z = Z := sorry

end Closure
end TauCeti.ShimuraTower

/-! S3: group-point portion of the flag variety and its Levi projection. Algebraic
schemes, analytification, vector bundles and compact-dual identifications are omitted.
The quotient is P\G, not Mathlib's G/P, and inversion is the comparison. -/

namespace TauCeti.HodgeTate
section Flags
variable {G : Type*} [Group G]

/-- The point quotient P\G, with P supplied by the cocharacter/parabolic owner. -/
def FL (P : Subgroup G) := Quotient (QuotientGroup.rightRel P)

/-- Right translation is well defined on P\G. -/
def flagTranslate (P : Subgroup G) (g : G) : FL P ≃ FL P where
  toFun := Quotient.map' (fun x => x * g) (by
    intro a b h
    apply (QuotientGroup.rightRel_apply).mpr
    have h' := (QuotientGroup.rightRel_apply).mp h
    simpa using h')
  invFun := Quotient.map' (fun x => x * g⁻¹) (by
    intro a b h
    apply (QuotientGroup.rightRel_apply).mpr
    have h' := (QuotientGroup.rightRel_apply).mp h
    simpa using h')
  left_inv := sorry
  right_inv := sorry

/-- The point quotient comparison uses g ↦ g⁻¹. -/
def FL_equivLeftFlag (P : Subgroup G) : (G ⧸ P) ≃ FL P :=
  (QuotientGroup.quotientRightRelEquivQuotientLeftRel P).symm

theorem FL_equivLeftFlag_apply (P : Subgroup G) (g : G) :
    FL_equivLeftFlag P (Quotient.mk'' g) = Quotient.mk'' g⁻¹ := sorry

/-- The point-level Levi torsor projection U\G → P\G. U is supplied, with actual U ≤ P. -/
def leviTorsor (U P : Subgroup G) (hUP : U ≤ P) : FL U → FL P :=
  Quotient.map' id (by
    intro a b h
    exact (QuotientGroup.rightRel_apply).mpr (hUP ((QuotientGroup.rightRel_apply).mp h)))

/-- The intrinsic right Levi action uses inverse left multiplication. Normality of U in P
is necessary for its P/U action; no algebraic torsor property is asserted. -/
noncomputable def leviAction (U P : Subgroup G) (hUP : U ≤ P)
    [(U.subgroupOf P).Normal] (m : P ⧸ U.subgroupOf P) (x : FL U) : FL U :=
  Quotient.liftOn m (fun p => Quotient.map' (fun g => (p : G)⁻¹ * g) (by
    intro a b h
    sorry) x) (by
      intro a b h
      sorry)

theorem leviAction_mul (U P : Subgroup G) (hUP : U ≤ P) [(U.subgroupOf P).Normal]
    (m n : P ⧸ U.subgroupOf P) (x : FL U) :
    leviAction U P hUP (m * n) x = leviAction U P hUP n (leviAction U P hUP m x) := sorry

theorem leviAction_over_flag (U P : Subgroup G) (hUP : U ≤ P) [(U.subgroupOf P).Normal]
    (m : P ⧸ U.subgroupOf P) (x : FL U) :
    leviTorsor U P hUP (leviAction U P hUP m x) = leviTorsor U P hUP x := sorry

/-- Set-level freeness in each fibre is distinct from local triviality as an étale torsor. -/
theorem leviAction_free (U P : Subgroup G) (hUP : U ≤ P) [(U.subgroupOf P).Normal]
    (m : P ⧸ U.subgroupOf P) (x : FL U) : leviAction U P hUP m x = x ↔ m = 1 := sorry

/-- Test FL_trivial_mu: the flag is a singleton, whereas the Levi total space is G. -/
example : Subsingleton (FL (⊤ : Subgroup G)) := sorry

example (g h : G) : (Quotient.mk'' g : FL (⊥ : Subgroup G)) = Quotient.mk'' h ↔ g = h := sorry

/-- Test FL_left_right_inverse: inversion, including its evaluation on representatives. -/
example (P : Subgroup G) (g : G) :
    FL_equivLeftFlag P (Quotient.mk'' g) = Quotient.mk'' g⁻¹ := sorry

end Flags
end TauCeti.HodgeTate

/-! S1: the finite algebraic part of normalized traces. Completion, integral trace
bounds, and convergence on the anticanonical affinoids are not expressible without R3. -/

namespace TauCeti.SiegelTorsion

variable (K A : Type*) [Field K] [CharZero K] [CommRing A] [Algebra K A]
    [Module.Free K A] [Module.Finite K A] [Nontrivial A]

/-- Normalized trace at a finite free algebra level: degree inverse times the ordinary trace.
The degree is the actual module rank, not a guessed power of p. -/
noncomputable def normalizedTrace : A →ₗ[K] K :=
  (Module.finrank K A : K)⁻¹ • Algebra.trace K A

theorem normalizedTrace_of_finiteLevel (x : A) :
    normalizedTrace K A x = (Module.finrank K A : K)⁻¹ * Algebra.trace K A x := sorry

theorem normalizedTrace_linear (a b : K) (x y : A) :
    normalizedTrace K A (a • x + b • y) = a * normalizedTrace K A x + b * normalizedTrace K A y := sorry

theorem normalizedTrace_algebraMap (a : K) : normalizedTrace K A (algebraMap K A a) = a := sorry

/-- Finite-level trace compatibility along a genuine finite free tower. -/
theorem normalizedTrace_compat (B : Type*) [CommRing B] [Algebra K B] [Algebra A B]
    [IsScalarTower K A B] [Module.Free K B] [Module.Finite K B] [Nontrivial B]
    [Module.Free A B] [Module.Finite A B] (x : B) :
    normalizedTrace K B x = normalizedTrace K A
      ((Module.finrank A B : K)⁻¹ • Algebra.trace A B x) := sorry

/-- Test normalizedTrace_identity_level. -/
example (x : K) : normalizedTrace K K x = x := sorry

/-- Test normalizedTrace_not_unnormalized: a split degree-two algebra detects the factor. -/
example (a : K) : Algebra.trace K (K × K) (a, a) = 2 * a ∧
    normalizedTrace K (K × K) (a, a) = a := sorry

/-- Test normalizedTrace_compat_R3, the finite algebraic specialization before completion. -/
example (x : A) : normalizedTrace K K (normalizedTrace K A x) = normalizedTrace K A x := sorry

end TauCeti.SiegelTorsion

/-! S5: native level-structure and pairing arithmetic. The abelian varieties, their
isogenies, polarization modules and tower-space actions are omitted. -/

namespace TauCeti.HilbertTower
open Matrix
variable {R : Type*} [CommRing R]

/-- BHW's dual matrix convention γ^∨=det(γ)γ⁻¹, with the actual inverse GL matrix. -/
def dualMatrix (γ : GL (Fin 2) R) : Matrix (Fin 2) (Fin 2) R :=
  (γ : Matrix (Fin 2) (Fin 2) R).det • ((γ⁻¹ : GL (Fin 2) R) : Matrix (Fin 2) (Fin 2) R)

theorem dualMatrix_mul (γ δ : GL (Fin 2) R) : dualMatrix (γ * δ) = dualMatrix δ * dualMatrix γ := sorry

theorem dualMatrix_one : dualMatrix (1 : GL (Fin 2) R) = 1 := sorry

/-- Level-action portion of hilbert-three-towers: precompose the level map with γ^∨.
This is a left action; it lies over S0’s right tower translation by γ^∨. -/
def levelAction (γ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) : Matrix (Fin 2) (Fin 2) R :=
  α * dualMatrix γ

theorem levelAction_mul (γ δ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) :
    levelAction (γ * δ) α = levelAction γ (levelAction δ α) := sorry

/-- The coefficient of the alternating determinant pairing in the chosen basis β.
This is the matrix part of the Weil-pairing map, not a replacement for the actual pairing. -/
def weilPairing (α : Matrix (Fin 2) (Fin 2) R) : R := α.det

theorem weilPairing_level (γ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) :
    weilPairing (levelAction γ α) = (γ : Matrix (Fin 2) (Fin 2) R).det * weilPairing α := sorry

/-- Change of the target generator β to uβ divides its pairing coefficient by u. -/
def pairingChangeGenerator (u : Rˣ) (coefficient : R) : R := (u⁻¹ : Rˣ) * coefficient

theorem weilPairing_changeGenerator (u : Rˣ) (coefficient : R) :
    (u : R) * pairingChangeGenerator u coefficient = coefficient := sorry

/-- Test levelAction_adjugate: diagonal (a,d) dualizes to diagonal (d,a). -/
example (γ : GL (Fin 2) R) (a d : R) (hγ : (γ : Matrix (Fin 2) (Fin 2) R) = !![a, 0; 0, d]) :
    dualMatrix γ = !![d, 0; 0, a] := sorry

/-- Test levelAction_vs_rightTranslation, matrix portion: the multiplier is the dual,
which is not γ for a nonscalar diagonal. -/
example : (6 : ℚ) • (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ)⁻¹ ≠
    (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) := sorry

/-- Test weilPairing_diag, coefficient portion. -/
example (a d : R) : weilPairing (!![a, 0; 0, d] : Matrix (Fin 2) (Fin 2) R) = a * d := sorry

/-- A fixed pairing fibre in the infinite pairing group is closed; it need not be open. -/
example (p : ℕ) [Fact p.Prime] : IsClosed ({1} : Set ℤ_[p]ˣ) := sorry

end TauCeti.HilbertTower

/-! S6: the group-point fibre product in Lovering's auxiliary datum. This states
no reflex norm, cocharacter, Shimura datum, reflex-field map or G^c/Levi identity. -/

namespace TauCeti.AbelianType
section Auxiliary
variable {G T A : Type*} [Group G] [Group T] [Group A]

/-- Group carrier of G₁ ×_{G₁^ab} T, with both coefficient homomorphisms supplied. -/
def lovering (ab : G →* A) (reflexNorm : T →* A) : Subgroup (G × T) where
  carrier := {x | ab x.1 = reflexNorm x.2}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

def loveringToCover (ab : G →* A) (reflexNorm : T →* A) : lovering ab reflexNorm →* G :=
  (MonoidHom.fst G T).comp (lovering ab reflexNorm).subtype

def loveringToTorus (ab : G →* A) (reflexNorm : T →* A) : lovering ab reflexNorm →* T :=
  (MonoidHom.snd G T).comp (lovering ab reflexNorm).subtype

theorem lovering_square (ab : G →* A) (reflexNorm : T →* A) :
    ab.comp (loveringToCover ab reflexNorm) = reflexNorm.comp (loveringToTorus ab reflexNorm) := sorry

/-- Test abelian_aux_hodge_trivial, pure group part: pullback along the identity is G. -/
noncomputable def lovering_id (ab : G →* A) : lovering ab (MonoidHom.id A) ≃* G := sorry

example (ab : G →* A) (g : G) :
    (g, ab g) ∈ lovering ab (MonoidHom.id A) := sorry

end Auxiliary
end TauCeti.AbelianType

/-! Additional S0/S1 level APIs and the S3 graph/quotient frame. -/
namespace TauCeti.GSp
open Matrix
variable (g : Type*) [Fintype g] [DecidableEq g] [Nonempty g]
variable (p : ℕ) [Fact p.Prime]

/-- U_m, including U_0=all units, avoids treating 1+ℤ_p as a unit subgroup. -/
def unitReductionKernel (m : ℕ) : Subgroup ℤ_[p]ˣ where
  carrier := {u | PadicInt.toZModPow m (u : ℤ_[p]) = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- The full image statement in the packet's API, not only membership in U_m. -/
theorem similitude_levelGamma0 (m : ℕ) :
    (levelGamma0 g p m).map (similitude g ℤ_[p]) = unitReductionKernel p m ∧
    (levelGamma g p m).map (similitude g ℤ_[p]) = unitReductionKernel p m := sorry

example : unitReductionKernel p 0 = ⊤ := sorry

/-- Compactness and openness in the actual integral GSp carrier. -/
theorem levelGamma_isCompact_isOpen (m : ℕ) :
    IsCompact (levelGamma g p m : Set (gsp g ℤ_[p])) ∧
    IsOpen (levelGamma g p m : Set (gsp g ℤ_[p])) := sorry

theorem levelGamma1_isCompact_isOpen (m : ℕ) :
    IsCompact (levelGamma1 g p m : Set (gsp g ℤ_[p])) ∧
    IsOpen (levelGamma1 g p m : Set (gsp g ℤ_[p])) := sorry

theorem levelGamma0_isCompact_isOpen (m : ℕ) :
    IsCompact (levelGamma0 g p m : Set (gsp g ℤ_[p])) ∧
    IsOpen (levelGamma0 g p m : Set (gsp g ℤ_[p])) := sorry

/-- Remaining m=0 part of levelGamma_m_zero. -/
example : levelGamma1 g p 0 = ⊤ := sorry

end TauCeti.GSp

namespace TauCeti.SiegelTorsion
open Matrix
variable (g : Type*) [Fintype g] [DecidableEq g] [Nonempty g]
variable (p : ℕ) [Fact p.Prime]

/-- Strict Iwahori: diagonal reduction in Sp_2g(F_p), not all upper-triangular matrices. -/
def strictIwahori : Subgroup (TauCeti.GSp.gsp g ℤ_[p]) where
  carrier := {γ | (∀ i j, i ≠ j → TauCeti.GSp.reduce g p 1 γ i j = 0) ∧
    PadicInt.toZMod (TauCeti.GSp.similitude g ℤ_[p] γ : ℤ_[p]) = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem strictIwahori_le : strictIwahori g p ≤ TauCeti.GSp.levelGamma0 g p 1 := sorry

/-- Test strictIwahori_quotient_g1, the actual finite quotient order. -/
example : ((TauCeti.GSp.levelGamma (Fin 1) p 1).subgroupOf (strictIwahori (Fin 1) p)).index = p - 1 := sorry

/-- Test strictIwahori_not_subgroups: a nontrivial upper unipotent is in Γ₁ but not strict Iwahori. -/
example (γ : TauCeti.GSp.gsp (Fin 1) ℤ_[p])
    (hγ : ((γ : GL (Fin 1 ⊕ Fin 1) ℤ_[p]) : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℤ_[p]) = fromBlocks 1 1 0 1) :
    γ ∈ TauCeti.GSp.levelGamma1 (Fin 1) p 1 ∧ γ ∉ strictIwahori (Fin 1) p := sorry

end TauCeti.SiegelTorsion

namespace TauCeti.HodgeTate
open Matrix
variable {g : Type*} [Fintype g] [DecidableEq g] {R : Type*} [CommRing R]

/-- Symmetric-matrix portion of the Siegel chart; graphDistanceDomain supplies its pointwise distance subset, with analytic affinoid realization omitted. -/
def siegelGraphChart := {Z : Matrix g g R // Zᵀ = Z}

/-- The quotient frame represented by the row matrix (1,Z), before analytic pullback. -/
def hodgeFrame (Z : Matrix g g R) : ((g ⊕ g) → R) →ₗ[R] (g → R) :=
  (fromCols 1 Z).mulVecLin

/-- Its kernel is the column graph W=(-Z;1), matching the quotient V/W convention. -/
theorem hodgeFrame_ker (Z : Matrix g g R) :
    LinearMap.ker (hodgeFrame Z) = LinearMap.range (fromRows (-Z) (1 : Matrix g g R)).mulVecLin := sorry

theorem hodgeFrame_surjective (Z : Matrix g g R) : Function.Surjective (hodgeFrame Z) := sorry

/-- Matrix part of hodgeFrame_transform. The W-dual frame and the Tate line's transported
linearization are distinct and are not silently identified with this quotient frame. -/
theorem hodgeFrame_transform (A B C D Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    (hodgeFrame Z).comp (fromBlocks A B C D).mulVecLin =
      (chartFactor A C Z).mulVecLin.comp (hodgeFrame (chartAction A B C D Z)) := sorry

/-- Test graph_chart_lagrangian: omitting symmetry would give nonisotropic row graphs. -/
example (Z : Matrix g g R) :
    fromCols (1 : Matrix g g R) Z * J g R * (fromCols (1 : Matrix g g R) Z)ᵀ = 0 ↔ Zᵀ = Z := sorry

/-- Test FL_parabolic_pinned, row-space obstruction: the same upper-parabolic coset
has distinct first rows. This witnesses why the pinned lower parabolic is essential. -/
example : let u : Matrix (Fin 2) (Fin 2) ℚ := !![1, 1; 0, 1]
    u 0 1 = 1 ∧ (1 : Matrix (Fin 2) (Fin 2) ℚ) 0 1 = 0 ∧ u 1 0 = 0 := by decide

/-- Test hodge_frame_similitude, genus-one coefficient: the dual W factor is a/c=1/d.
This tests the additional multiplier, not a natural untwisted Tate linearization. -/
example {K : Type*} [Field K] (a d : K) (ha : a ≠ 0) (hd : d ≠ 0) :
    (a * d)⁻¹ * a = d⁻¹ := sorry

end TauCeti.HodgeTate

namespace TauCeti.HodgeTate
open Matrix
section PadicDistance
variable {g : Type*} [Fintype g] [DecidableEq g] (p : ℕ) [Fact p.Prime]
variable (K : Type*) [NormedField K] [NormedAlgebra ℚ_[p] K]

/-- Pointwise distance-to-integral domain over a normed p-adic extension. This is an actual
subset of matrices, not an analytic affinoid carrier. Distance is from all of ℤ_p. -/
def graphDistanceDomain (r : ℝ) : Set (Matrix g g K) :=
  {Z | Zᵀ = Z ∧ ∀ i j, Metric.infDist (Z i j)
    (Set.range (fun x : ℤ_[p] => algebraMap ℚ_[p] K (x : ℚ_[p]))) ≤ r}

/-- At radius zero, the compact embedded integral subset is recovered. Over an extension,
a norm-at-most-one element need not lie in the image of ℤ_p. -/
theorem graphDistanceDomain_zero (Z : Matrix g g K) :
    Z ∈ graphDistanceDomain p K 0 ↔ Zᵀ = Z ∧
      ∀ i j, ∃ x : ℤ_[p], algebraMap ℚ_[p] K (x : ℚ_[p]) = Z i j := sorry

/-- Native pointwise portion of siegelGraphChart_stable. Strict Iwahori blocks are supplied
as their actual integral matrices; symmetry requires the GSp condition. -/
theorem siegelGraphChart_stable [Nonempty g] [IsUltrametricDist K]
    (r : ℝ) (hr : 0 < r) (hr1 : r ≤ 1)
    (γ : TauCeti.GSp.gsp g ℤ_[p]) (hγ : γ ∈ TauCeti.SiegelTorsion.strictIwahori g p)
    (A B C D : Matrix g g K)
    (hblocks : (((γ : GL (g ⊕ g) ℤ_[p]) : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p]).map
      (fun x => algebraMap ℚ_[p] K (x : ℚ_[p]))) = fromBlocks A B C D)
    (Z : Matrix g g K) (hZ : Z ∈ graphDistanceDomain p K r) :
    chartAction A B C D Z ∈ graphDistanceDomain p K r := sorry

/-- The zero graph belongs to every nonnegative radius domain. -/
example (r : ℝ) (hr : 0 ≤ r) : (0 : Matrix g g K) ∈ graphDistanceDomain p K r := sorry

/-- Integral unit translations in genus one stay in the zero-radius domain. A disc
centered only at zero fails this test for a unit translation at radius less than one. -/
example (a : ℤ_[p]) :
    (!![algebraMap ℚ_[p] K (a : ℚ_[p])] : Matrix (Fin 1) (Fin 1) K) ∈
      graphDistanceDomain p K 0 := sorry

/-- All symmetric integral matrices belong to the zero-radius domain. -/
example (Z : Matrix g g ℤ_[p]) (hZ : Zᵀ = Z) :
    Z.map (fun x => algebraMap ℚ_[p] K (x : ℚ_[p])) ∈ graphDistanceDomain p K 0 := sorry

end PadicDistance
end TauCeti.HodgeTate
