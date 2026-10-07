/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PerfectoidShimuraVarieties.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and signatures.
They claim no implementation.

BP-PerfectoidShimuraVarieties (issue #972): layers S0, S0.general, S1-S6;
implementationStatus = unchecked for every node.
Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Elaboration: checked with `lean-check` against Mathlib 082e2d37e8; the only warnings are
`declaration uses 'sorry'`.

What is native. Mathlib has the carriers of the group theory of the towers, and these are
prototyped against it directly: `Matrix.J`, `Matrix.symplecticGroup`, `Matrix.GeneralLinearGroup`,
`PadicInt.toZModPow`, `CongruenceSubgroup.Gamma`/`Gamma0`/`Gamma1`, `Subgroup.topologicalClosure`,
`Matrix.fromBlocks` and `Matrix.fromCols`. The native part covers the level groups of
`GSp_{2g}(ℤ_p)` (S0/siegel-level-subgroups), the arithmetic input of the rigidified Hilbert tower
(S0/rigidified-moduli-tower), the carrier of the effective deck group (S0/tower-action-kernel)
and the matrix identities of the Siegel graph chart (S3/siegel-graph-chart-and-frame).

Review limitation (REV-PerfectoidShimuraVarieties, 2026-10-07). Only the four native
fragments above have Lean declarations. The remaining CONTRACT comments record mathematical
interfaces and proposed names; they are not Lean signatures or elaborated tests. Protocol §13
requires actual definition/construction and API signatures, examples and named theorem
statements. This file does not yet meet that requirement, and the packet review is
needs_changes. Supplier carriers must be used when available; an unstated condition must not
be replaced by a Prop-valued placeholder. Compilation checks only the native fragment.

The contracts below are synchronized with the corrected packet. The reader document has not
been edited by this review and must be regenerated during revision before acceptance.
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
theorem similitude_levelGamma0 [Nonempty g] (m : ℕ) (γ : levelGamma0 g p m) :
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
transformation are stated natively; the affinoid chart and the frame are in the contract below. -/

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

/-! ## Contracts for layer S0 -/


/- CONTRACT `PerfectoidShimuraVarieties:S0/p-level-tower` (construction)
  The p-level tower of a Shimura datum at fixed tame level

  Statement: Let D = (G, X) be a pure Shimura datum with reflex field E = E(D), with actual
  canonical models (ShimuraVarieties V6 for abelian type, V7/V8.general in general), and fix a prime
  p, a complete algebraically closed nonarchimedean extension C of ℚ_p and an embedding ι: E → C.
  For a compact open K^p ⊆ G(𝔸_f^p) let CO_p = CO(G(ℚ_p)) be the cofiltered poset of compact open
  subgroups of G(ℚ_p) under inclusion. The p-level tower at tame level K^p is the functor
  CO_p^{op-arrows} → analytic adic spaces over Spa(C, O_C), K_p ↦ S_{K^pK_p} := (Sh_{K^pK_p}(G, X)
  ⊗_{E,ι} C)^{ad}, with transition maps π_{K'_p,K_p}: S_{K^pK'_p} → S_{K^pK_p} for K'_p ⊆ K_p the
  analytifications of the descended forgetful maps of ShimuraVarieties:V8/level-tower; and likewise
  the minimally compactified tower K_p ↦ S*_{K^pK_p} := (Sh*_{K^pK_p} ⊗_{E,ι} C)^{ad} with the
  extended finite level maps of ShimuraVarieties:V8/minimal-map-extension. The transition maps are
  finite, finite étale on the open towers when K^pK_p is neat, and the open tower is the restriction
  of the compactified one to the complements of the boundaries. On C-points: if |C| = 2^ℵ₀ (for
  instance C = ℂ_p), a field isomorphism σ: C ≅ ℂ exists, and through σ ∘ ι and the complex
  uniformisation of ShimuraVarieties:V1/analytic-points, S_{K^pK_p}(C) = G(ℚ)\(X × G(𝔸_f)/K^pK_p);
  for C of larger cardinality no such σ exists. Identities between the base-changed algebraic maps
  (for instance T_g = id) hold over C as soon as they hold over ℂ for the models over Ē, so the
  double-coset computations of the following nodes apply for every C.

  API:
  * `ShimuraTower.pLevel` (data): The functor K_p ↦ S_{K^pK_p} on compact open subgroups of G(ℚ_p),
      for fixed D, K^p, C, ι.
  * `ShimuraTower.pLevelMin` (data): The minimally compactified tower K_p ↦ S*_{K^pK_p} with its
      finite extended level maps.
  * `ShimuraTower.toMin` (projection): The open immersion of towers S_{K^pK_p} → S*_{K^pK_p}, with
      complement the boundary Z_{K^pK_p}.
  * `ShimuraTower.transition_finite` (characterisation): Every transition map is finite; on the open
      tower it is finite étale when K^pK_p is neat.
  * `ShimuraTower.transition_comp` (functoriality): π_{K''_p,K_p} = π_{K'_p,K_p} ∘ π_{K''_p,K'_p}
      and π_{K_p,K_p} = id.
  * `ShimuraTower.points_eq_doubleCoset` (characterisation): For |C| = 2^ℵ₀ and a field isomorphism
      σ: C ≅ ℂ: S_{K^pK_p}(C) ≅ G(ℚ)\(X × G(𝔸_f)/K^pK_p) through σ ∘ ι and the complex
      uniformisation, compatibly with transition maps.
  * `ShimuraTower.reindex` (functoriality): Restriction along a level family with a cofinality
      witness (PerfectoidSpaces:P7/level-cofinality-witness) does not change limits or tilde-limits.

  Unit tests:
  * `pLevel_gl2_full_level` (computation): For GL_2, K^p = K(N)^p (N ≥ 3) and K_p = K(pᵐ),
      S*_{K^pK_p} has φ(Npᵐ) connected components, each the analytified complete modular curve
      X(Npᵐ)_C.
  * `pLevel_transition_degree_gl2` (computation): For GL_2, N ≥ 3 and m ≥ 1, the map S_{K^pK(pᵐ⁺¹)}
      → S_{K^pK(pᵐ)} is finite étale of degree p⁴ = [K(pᵐ) : K(pᵐ⁺¹)] (the kernel of the action is
      trivial at this level).
  * `pLevel_torus_zero_dim` (degenerate): For a torus datum (T, {h}) the tower consists of finite
      sets of C-points T(ℚ)\T(𝔸_f)/K^pK_p (zero-dimensional adic spaces), with surjective transition
      maps.
  * `pLevel_not_over_reflex_completion` (non-example): For GL_2 the tower over C is not the base
      change of a tower over ℚ_p of geometrically connected spaces: the component set (ℤ/Npᵐ)^×
      carries the cyclotomic Galois action, so the fixed-pairing fibres are defined only over
      ℚ_p(ζ_{Npᵐ}).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/tower-right-action` (construction)
  The right action of G(ℚ_p) and of prime-to-p Hecke operators on the p-level tower

  Statement: In the situation of p-level-tower, for g ∈ G(ℚ_p) (embedded in G(𝔸_f) with
  trivial prime-to-p component) and K_p ∈ CO_p, the descended right translation T_g:
  S_{K^pK_p} → S_{K^p g⁻¹K_pg} ([x, a] ↦ [x, ag] on C-points; ShimuraVarieties:V8/translation-
  laws) is an isomorphism, extended to S* by ShimuraVarieties:V8/minimal-map-extension. The
  T_g satisfy T_1 = id, T_{gh} = T_h ∘ T_g and π ∘ T_g = T_g ∘ π, and for k ∈ K_p, T_k:
  S_{K^pK_p} → S_{K^pK_p} is the identity. Hence for K'_p normal in K_p the finite group
  K_p/K'_p acts on S_{K^pK'_p} over S_{K^pK_p}, and G(ℚ_p) acts on the right on the pro-system
  (S_{K^pK_p})_{K_p} (an action in the sense of Deligne 2.7.1). Prime-to-p Hecke: for h ∈
  G(𝔸_f^p) the translations S_{K^pK_p} → S_{h⁻¹K^ph K_p} commute with the G(ℚ_p)-action and
  the transition maps.

  Hypotheses:
  * As in p-level-tower; g ranges over G(ℚ_p), not over the profinite K_p only.
  * The action is C-linear: it is defined after base change along ι. Scholze's spaces over
  ℚ_p^cycl carry a GSp_2g(ℚ_p)-action that does not preserve the structure map to
  Spa(ℚ_p^cycl) (torsion paper, footnote 7); that twisted form is not the action here.

  API:
  * `ShimuraTower.translate` (constructor): T_g: S_{K^pK_p} → S_{K^p g⁻¹K_pg} for g ∈ G(ℚ_p).
  * `ShimuraTower.translate_one` (simp): T_1 = id.
  * `ShimuraTower.translate_mul` (simp): T_{gh} = T_h ∘ T_g (right action).
  * `ShimuraTower.translate_of_mem` (simp): T_k = id on S_{K^pK_p} for k ∈ K_p.
  * `ShimuraTower.translate_comm_transition` (functoriality): π ∘ T_g = T_g ∘ π for compatible
  levels.
  * `ShimuraTower.primeToPHecke` (constructor): Translations by h ∈ G(𝔸_f^p), commuting with
  all T_g and transition maps.
  * `ShimuraTower.quotientAction` (constructor): For K'_p ⊴ K_p, the action of K_p/K'_p on
  S_{K^pK'_p} over S_{K^pK_p}.

  Unit tests:
  * `translate_mul_order` (characterisation): For noncommuting g, h ∈ GL_2(ℚ_p), T_{gh} = T_h
  ∘ T_g and in general T_{gh} ≠ T_g ∘ T_h on C-points: the action is a right action.
  * `translate_center_gl2` (computation): For GL_2, K^p = K(N)^p with N ≥ 3 prime to p, and z
  = p·1 ∈ Z(ℚ_p), T_z acts on lim_{K_p} S_{K^pK_p}(C) by [x, a] ↦ [x, a z_p] = [x, a (z^p)⁻¹]
  (z^p = p·1 ∈ G(𝔸_f^p)), which is the identity exactly when p ≡ 1 modulo N (for p ≡ −1 modulo
  N it is T_{−1}, which is not the identity since −1 ∉ K(N)^p).
  * `translate_trivial_group` (degenerate): For the torus datum (G_m, {Nm}) (X a point), p
  odd, K^p = Ẑ^{p×}, K_p = ℤ_p^× and K'_p = 1 + pℤ_p: S_{K^pK'_p} = ℚ^×\𝔸_f^×/K^pK'_p ≅
  𝔽_p^×/{±1}, and quotientAction of K_p/K'_p = 𝔽_p^× is translation, whose trivially acting
  subgroup is {±1}, the image of Z(ℚ) ∩ K^pK_p = {±1}; so the subgroup acting trivially is
  nontrivial and quotientAction is not faithful.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/infinite-level-diamond` (construction)
  The infinite-level Shimura diamond S^◇_{K^p,∞}

  Statement: In the situation of p-level-tower, put S^◇_{K^p,∞} := lim_{K_p} (S_{K^pK_p})^◇ and
  S^{*◇}_{K^p,∞} := lim_{K_p} (S*_{K^pK_p})^◇, limits of v-sheaves on Perf over Spd(C, O_C) of the
  diamonds of DiamondsAndVStacks:D6/gluing-and-the-diamond-functor. No perfectoidness is assumed.
  Then: (i) S^{*◇}_{K^p,∞} is a spatial diamond, the projections to S*_{K^pK_p}^◇ are qcqs, and
  |S^{*◇}_{K^p,∞}| → lim_{K_p} |S*_{K^pK_p}| is a homeomorphism; (ii) S^◇_{K^p,∞} is the open
  subdiamond of S^{*◇}_{K^p,∞} over the complement of the boundary, a locally spatial diamond with
  |S^◇_{K^p,∞}| ≅ lim_{K_p} |S_{K^pK_p}|; (iii) for a perfectoid (R, R⁺) over (C, O_C),
  S^◇_{K^p,∞}(R, R⁺) = lim_{K_p} S_{K^pK_p}(R, R⁺); (iv) the action of G(ℚ_p) of tower-right-action
  induces an action on S^◇_{K^p,∞} and S^{*◇}_{K^p,∞}, continuous for the profinite subgroups (it is
  an action of the locally profinite group G(ℚ_p) on the v-sheaf through the sheaf of continuous
  maps to G(ℚ_p)); (v) for K^pK_p neat, S^◇_{K^p,∞} → S^◇_{K^pK_p} is a pro-étale map, the limit of
  the finite étale maps S_{K^pK'_p} → S_{K^pK_p}. A cofinal level family gives the same limit.

  API:
  * `ShimuraTower.infiniteLevel` (data): S^◇_{K^p,∞} = lim_{K_p} S^◇_{K^pK_p} as a v-sheaf over Spd
      C.
  * `ShimuraTower.infiniteLevelMin` (data): S^{*◇}_{K^p,∞} = lim_{K_p} S*^◇_{K^pK_p}.
  * `ShimuraTower.infiniteLevel.proj` (projection): The qcqs projections to each finite level.
  * `ShimuraTower.infiniteLevelMin_isSpatial` (characterisation): S^{*◇}_{K^p,∞} is a spatial
      diamond.
  * `ShimuraTower.infiniteLevel_isLocallySpatial` (characterisation): S^◇_{K^p,∞} is a locally
      spatial diamond, open in S^{*◇}_{K^p,∞}.
  * `ShimuraTower.infiniteLevel_space_homeo` (characterisation): |S^{*◇}_{K^p,∞}| ≅ lim
      |S*_{K^pK_p}| and |S^◇_{K^p,∞}| ≅ lim |S_{K^pK_p}|.
  * `ShimuraTower.infiniteLevel_points` (simp): S^◇_{K^p,∞}(R, R⁺) = lim S_{K^pK_p}(R, R⁺) for
      perfectoid (R, R⁺) over (C, O_C).
  * `ShimuraTower.infiniteLevel_action` (instance): The induced action of G(ℚ_p), continuous on
      profinite subgroups.
  * `ShimuraTower.infiniteLevel_proEtale` (characterisation): At neat level the projection to
      S^◇_{K^pK_p} is pro-étale.
  * `ShimuraTower.infiniteLevel_reindex` (functoriality): Restriction to a cofinal level family
      gives a canonically isomorphic limit.

  Unit tests:
  * `infiniteLevel_torus` (computation): For D = (G_m, {Nm}) (X a point) and K^p = Ẑ^{p×}:
      |S^◇_{K^p,∞}| is the profinite set lim_{K_p} ℚ^×\𝔸_f^×/K^pK_p = ℤ_p^×/{±1}, and ℚ_p^× acts
      through ℚ_p^×/±p^ℤ by multiplication (the kernel ±p^ℤ is Z_{K^p} of tower-action-kernel).
  * `infiniteLevel_not_perfectoid_definition` (non-example): The definition does not make
      S^◇_{K^p,∞} a perfectoid space: for a single level (the constant tower S_{K^pK_p} with
      identity maps, i.e. a non-cofinal family) the limit is the diamond of a rigid space of
      positive dimension, which is not representable by a perfectoid space.
  * `infiniteLevel_space_gl2` (compatibility): For GL_2 (the Siegel datum with g = 1) and K^p ⊆
      K(N)^p, N ≥ 3: |S^{*◇}_{K^p,∞}| ≅ |𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C|, where 𝒳*_{Γ(p^∞)} is
      Scholze's perfectoid modular curve over ℚ_p^cycl (Theorem 3.1.2 with g = 1); after fixing an
      embedding ℚ_p^cycl → C this is ℤ_p^× × |𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C|, so |𝒳*_{Γ(p^∞)}
      ⊗̂_{ℚ_p^cycl} C| alone is not homeomorphic to |S^{*◇}_{K^p,∞}| (their π₀ differ by the factor
      ℤ_p^×).
  * `infiniteLevel_singleton_index` (degenerate): If the index family has a least element K_p^0 (a
      non-cofinal family), the limit is S^◇_{K^pK_p^0} itself.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/perfectoid-representative` (definition)
  Perfectoid representatives of a tower

  Statement: Let (Y_i)_{i∈I} be a cofiltered system of analytic adic spaces over Spa(C, O_C)
  with qcqs transition maps (for instance a p-level tower S_{K^pK_p} or S*_{K^pK_p}, or a
  subsystem of opens). A perfectoid representative of (Y_i) is a perfectoid space Y over
  Spa(C, O_C) with a compatible family of maps φ_i: Y → Y_i such that Y ~ lim_i Y_i in the
  sense of PerfectoidSpaces:P7/perfectoid-tilde-limit (Scholze–Weinstein Definition 2.4.1).
  For finite transition maps and the finite-level affinoid basis of
  PerfectoidSpaces:P8/finite-level-affinoid-basis, equivalently
  (PerfectoidSpaces:P7/represented-functor-comparison) the induced map Y^◇ → lim_i Y_i^◇ is an
  isomorphism of v-sheaves and Y is covered by good affinoid perfectoids
  (PerfectoidSpaces:P7/good-affinoid-perfectoid). A perfectoid representative is unique up to
  unique isomorphism compatible with the φ_i, represents lim_i Hom(−, Y_i) on perfectoid
  spaces, and is functorial in morphisms of systems (PerfectoidSpaces:P7/tilde-limit-
  perfectoid-uniqueness). The tower is perfectoid if it has a perfectoid representative; this
  is a property of the diamond lim_i Y_i^◇ together with the existence of good affinoid
  perfectoid charts.

  Hypotheses:
  * The definition records both conditions: the diamond isomorphism alone (the form of
  Hansen–Johansson Theorem 1.5) and the tilde-limit with finite-level charts (Scholze's form).
  PerfectoidSpaces:P7/represented-functor-comparison (iii) supplies the passage from the first
  to the second under the finite-level affinoid basis of PerfectoidSpaces:P8/finite-level-
  affinoid-basis.
  * Over a non-perfectoid base (for instance ℚ_p or E_v) one first base changes to C; descent
  is a separate statement.

  API:
  * `ShimuraTower.PerfectoidRepresentative` (data): A perfectoid space Y over Spa(C, O_C) with
  a cone φ to the system and Y ~ lim Y_i.
  * `ShimuraTower.PerfectoidRepresentative.diamondIso` (projection): The isomorphism Y^◇ ≅
  lim_i Y_i^◇.
  * `ShimuraTower.PerfectoidRepresentative.unique` (extensionality): Two representatives are
  uniquely isomorphic compatibly with the cones.
  * `ShimuraTower.PerfectoidRepresentative.lift` (universal-property): A compatible family of
  maps from a perfectoid space Z to the Y_i factors uniquely through Y.
  * `ShimuraTower.PerfectoidRepresentative.map` (functoriality): A morphism of systems induces
  a unique morphism of representatives, with map_id and map_comp.
  * `ShimuraTower.PerfectoidRepresentative.ofDiamondIso` (constructor): From a perfectoid
  space with compatible maps and a diamond isomorphism to the limit, when the transition maps
  are finite (via finite-level affinoid charts).
  * `ShimuraTower.IsPerfectoidTower` (other): The property that a perfectoid representative
  exists; invariant under cofinal reindexing.

  Unit tests:
  * `representative_frobenius_P1` (computation): The tower ℙ¹_C ← ℙ¹_C ← ⋯ with T ↦ T^p has
  the perfectoid projective line as representative.
  * `representative_constant_tower` (non-example): The constant tower Y_i = ℙ¹_C (identity
  maps) has no perfectoid representative, although its diamond limit (ℙ¹_C)^◇ is a spatial
  diamond: being a diamond is not perfectoidness.
  * `representative_compatible_tilde` (compatibility): If Y is a representative, then Y^◇ →
  lim Y_i^◇ is an isomorphism (PerfectoidSpaces:P7/represented-functor-comparison (i)).
  * `representative_perfectoid_constant` (degenerate): A constant tower with a perfectoid
  space Y_0 (identity transition maps) has Y_0 as its representative.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/tower-action-kernel` (theorem)
  Effective deck groups: the kernel of the action on the tower

  Statement: In the situation of p-level-tower and tower-right-action, let Z be the centre of
  G and put Z(ℚ)_{K^p} := {z ∈ Z(ℚ) : z^p ∈ K^p}, where z^p ∈ Z(𝔸_f^p) is the prime-to-p
  component, and Z_{K^p} := the closure in G(ℚ_p) of the image of Z(ℚ)_{K^p} under z ↦ z_p.
  Then: (i) the kernel of the right action of G(ℚ_p) on lim_{K_p} S_{K^pK_p}(C), equivalently
  on |S^◇_{K^p,∞}| and on S^◇_{K^p,∞}, is Z_{K^p} = G(ℚ_p) ∩ cl(Z(ℚ)K^p), the closure taken in
  G(𝔸_f); (ii) for K'_p ⊆ K_p normal, the kernel of the action of K_p/K'_p on S_{K^pK'_p} is
  the image of (Z(ℚ) ∩ K^pK_p)_p in K_p/K'_p, and S_{K^pK_p} = S_{K^pK'_p}/(K_p/K'_p); if
  K^pK_p is neat, S_{K^pK'_p} → S_{K^pK_p} is a finite étale Galois cover with group K_p/(K'_p
  · (Z(ℚ) ∩ K^pK_p)_p); (iii) for K^pK_p neat, S^◇_{K^p,∞} → S^◇_{K^pK_p} is a pro-étale
  torsor under the profinite group K_p/Z_{K^pK_p}, where Z_{K^pK_p} = Z_{K^p} ∩ K_p is the
  closure of (Z(ℚ) ∩ K^pK_p)_p. In particular the tower is a K_p-torsor exactly when Z(ℚ) ∩
  K^pK_p = {1}, which holds for GL_2 and GSp_2g at level K^p ⊆ K(N)^p with N ≥ 3, and fails
  for Hilbert data, where Z(ℚ) ∩ K^pK_p contains a finite-index subgroup of the units ≡ 1 mod
  N of a totally real field F ≠ ℚ and Z_{K^pK_p} is a nontrivial closed subgroup of 𝒪_{F,p}^×.

  Hypotheses:
  * D pure Shimura datum with the tower of p-level-tower; G(ℚ_p) embedded in G(𝔸_f) with
  trivial prime-to-p component.
  * Neatness of K^pK_p is used only for freeness (finite étaleness and torsor statements), not
  for the kernel computation.
  * Equality with the kernel on C-points is justified at each finite level: the translations
  are analytifications of algebraic maps over the canonical-model field, and equality of those
  maps can be checked after faithful base change to ℂ and on its closed points. Passing
  through the reduced finite levels gives equality on the tower. No assertion that arbitrary
  qcqs diamond maps are determined by one fixed field of points is used.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level` (theorem)
  Connected components of the infinite-level tower

  Statement: In the situation of infinite-level-diamond, assume G^der simply connected and put T =
  G/G^der, ν: G → T, T(ℚ)^† = ν(G(ℚ)_+). Then π₀(S^{*◇}_{K^p,∞}) = π₀(S^◇_{K^p,∞}) = lim_{K_p}
  π₀(S_{K^pK_p}) = lim_{K_p} T(ℚ)^†\T(𝔸_f)/ν(K^pK_p), a profinite set (finite at each level). The
  right action of G(ℚ_p) on π₀ is through ν: G(ℚ_p) → T(ℚ_p) acting by translation; every compact
  open K_p acts with finitely many orbits, and the stabiliser of the neutral component (the image of
  X⁺ × {1}) is K_p ∩ ν⁻¹(cl(T(ℚ)^† ν(K^p)) ∩ T(ℚ_p)). The minimal compactification does not change
  components: π₀ S_{K^pK_p} → π₀ S*_{K^pK_p} is a bijection because S*_{K^pK_p} is normal and
  S_{K^pK_p} is dense in it.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/connected-component-tower` (construction)
  The neutral-component tower and its symmetry group

  Statement: In the situation of p-level-tower, fix a connected component X⁺ of X and for K_p ∈ CO_p
  let Γ(K^pK_p) := G(ℚ)_+ ∩ K^pK_p (G(ℚ)_+ the stabiliser of X⁺). The neutral-component tower is K_p
  ↦ S⁰_{K^pK_p} := (Γ(K^pK_p)\X⁺)^{an} over C, the connected component of S_{K^pK_p} containing the
  image of X⁺ × {1} (ShimuraVarieties:V0/component-decomposition), with S*⁰_{K^pK_p} its Zariski
  closure in S*_{K^pK_p} (normal, connected), and S^{0◇}_{K^p,∞} := lim_{K_p} S⁰^◇_{K^pK_p},
  S^{*0◇}_{K^p,∞} likewise. Its symmetry group is the closure Γ̄_{K^p} of Γ_{K^p} := G(ℚ)_+ ∩
  K^pG(ℚ_p) in G(ℚ_p), acting through T_g on the tower; for K'_p ⊆ K_p normal, the deck group of
  S⁰_{K^pK'_p} → S⁰_{K^pK_p} is the image of Γ(K^pK_p) in K_p/K'_p, i.e. (Γ̄_{K^p} ∩ K_p)/(Γ̄_{K^p}
  ∩ K'_p) modulo the kernel of tower-action-kernel, a subgroup of K_p/K'_p that is in general
  proper. The full tower is recovered from neutral towers at conjugate tame levels: for each of the
  finitely many K_p-orbits O on π₀(S^◇_{K^p,∞}) choose a_O = (a_O^p, a_{O,p}) ∈ G(𝔸_f) such that the
  component C_O through the image of X⁺ × {a_O} lies in O, and let Stab_O ⊆ K_p be its stabiliser.
  Then T_{a_{O,p}} ∘ T_{a_O^p} (a prime-to-p Hecke translation followed by a p-adic translation) is
  an isomorphism S^{0◇}_{a_O^pK^p(a_O^p)⁻¹,∞} ≅ C_O, transporting the Stab_O-action to the action of
  a_{O,p}Stab_Oa_{O,p}⁻¹ on the neutral tower at tame level a_O^pK^p(a_O^p)⁻¹, and S^◇_{K^p,∞} ≅ ∐_O
  (S^{0◇}_{a_O^pK^p(a_O^p)⁻¹,∞} ×^{Stab_O} K_p), compatibly with the K_p-action (Hansen–Johansson,
  proof of Proposition 5.16: each component is isomorphic to a neutral component at a conjugate tame
  level, not in general to the one at K^p). When G^der is simply connected and K^pK_p is small, the
  neutral component at each level is the fibre over the class of 1 of the component map of
  ShimuraVarieties:V8/component-reciprocity (Milne, Theorem 5.17); for GL_2 it is the
  fixed-Weil-pairing curve of ShimuraVarieties:V8/gl2-fixed-pairing-fibre, and a compatible system ζ
  of primitive Npᵐ-th roots of unity singles out a connected component of the infinite-level tower.
  For a connected Shimura datum (G, X⁺), an arithmetic subgroup Γ ⊆ G(ℚ)_+ and K_p ⊆ G(ℚ_p) compact
  open, put Γ ∩ K_p := Γ ∩ (G(𝔸_f^p)K_p) = {γ ∈ Γ : γ ∈ K_p in G(ℚ_p)}, an arithmetic subgroup of
  finite index in Γ; the connected tower is K_p ↦ X*_{Γ∩K_p}(G, X⁺), the analytified minimal
  compactification over C of (Γ ∩ K_p)\X⁺, and X*_{Γ,∞}(G, X⁺) := lim_{K_p} X*_{Γ∩K_p}(G, X⁺)^◇.
  This is the reading of S4/property-p: Hansen–Johansson's Definition 5.17 takes Γ ⊆ G^ad(ℚ)^+ but
  intersects with K_p ⊆ G(ℚ_p), which is consistent only for G = G^ad, where the two readings
  coincide; the proof of their Proposition 5.18 uses Γ ⊆ G(ℚ)_+ (PerfectoidShimuraVarieties/E16).

  API:
  * `ShimuraTower.neutralComponent` (data): The tower K_p ↦ S⁰_{K^pK_p} with its closures
      S*⁰_{K^pK_p}.
  * `ShimuraTower.neutralComponent.toFull` (projection): The open and closed immersion of towers S⁰
      → S.
  * `ShimuraTower.neutralSymmetry` (data): The closed subgroup Γ̄_{K^p} ⊆ G(ℚ_p) acting on the
      neutral tower.
  * `ShimuraTower.neutralDeckGroup` (characterisation): The deck group of S⁰_{K^pK'_p} → S⁰_{K^pK_p}
      is the image of Γ(K^pK_p) in K_p/K'_p modulo the kernel of tower-action-kernel.
  * `ShimuraTower.fullOfNeutral` (equivalence): S^◇_{K^p,∞} ≅ ∐_O (S^{0◇}_{a_O^pK^p(a_O^p)⁻¹,∞}
      ×^{Stab_O} K_p) over the finitely many K_p-orbits O on π₀, with the neutral tower at the
      conjugate tame level a_O^pK^p(a_O^p)⁻¹ for each orbit.
  * `ShimuraTower.connectedDatumTower` (constructor): For a connected datum (G, X⁺) and arithmetic Γ
      ⊆ G(ℚ)_+, the tower K_p ↦ X*_{Γ∩K_p}(G, X⁺) over compact open K_p ⊆ G(ℚ_p), with Γ ∩ K_p = Γ ∩
      (G(𝔸_f^p)K_p).
  * `ShimuraTower.neutralComponent_isConnected` (characterisation): Each S*⁰_{K^pK_p} is connected
      and normal, and S⁰_{K^pK_p} is dense in it.

  Unit tests:
  * `neutral_deck_gl2` (computation): For GL_2, K^p = K(N)^p, N ≥ 3, m ≥ 1: the deck group of
      S⁰_{K^pK(pᵐ⁺¹)} → S⁰_{K^pK(pᵐ)} is the kernel of SL_2(ℤ/pᵐ⁺¹) → SL_2(ℤ/pᵐ), of order p³, while
      that of the full tower is of order p⁴.
  * `neutral_full_comparison_count` (compatibility): π₀(S_{K^pK_p}) = π₀(S^◇_{K^p,∞})/K_p, so
      fullOfNeutral has exactly one induced piece per connected component of S_{K^pK_p}. For GL_2,
      K^p = K(N)^p (N ≥ 3) and K_p = K(pᵐ), m ≥ 1: the K(pᵐ)-orbits on π₀(S^◇_{K^p,∞}) = (ℤ/N)^× ×
      ℤ_p^× are the cosets of det K(pᵐ) = 1 + pᵐℤ_p in the second factor; there are φ(Npᵐ) of them,
      matching the φ(Npᵐ) components of S_{K^pK(pᵐ)}, and each stabiliser is K(pᵐ) ∩ SL_2(ℤ_p).
  * `neutral_tower_torus` (degenerate): For a torus datum (T, {h}): X⁺ = X is a point and G(ℚ)_+ =
      T(ℚ), so every S⁰_{K^pK_p} is one point and S^{0◇}_{K^p,∞} = Spd C. The group Γ(K^pK_p) = T(ℚ)
      ∩ K^pK_p need not be finite (for T = Res_{F/ℚ}G_m with F real quadratic it contains a
      finite-index subgroup of 𝒪_F^×), and its image in K_p/K'_p can be nontrivial; but it lies in
      the kernel of tower-action-kernel (Z = T), so neutralDeckGroup is trivial.
  * `neutral_symmetry_not_Gp` (non-example): For GL_2, the element diag(1, u) with u ∈ ℤ_p^× not in
      the closure of ℚ_{>0} p^ℤ-type determinants does not preserve the neutral component of the
      infinite-level tower: the neutral tower is not stable under all of K_p.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/rigidified-moduli-tower` (definition)
  Towers retaining a moduli rigidification

  Statement: In the situation of p-level-tower, a rigidified tower over (S_{K^pK_p})_{K_p} (or
  over an open and closed subtower of it stable under the action below) consists of: a
  cofiltered system (M_{K_p})_{K_p} of separated qcqs rigid analytic spaces over C with finite
  transition maps, indexed by CO_p or by a cofinal level family with a cofinality witness
  (PerfectoidSpaces:P7/level-cofinality-witness); a pro-system of finite groups
  (Δ_{K_p})_{K_p}, with transition homomorphisms Δ_{K'_p} → Δ_{K_p} for K'_p ⊆ K_p, Δ_{K_p}
  acting on M_{K_p} so that the transition maps M_{K'_p} → M_{K_p} are equivariant along
  Δ_{K'_p} → Δ_{K_p}; finite Δ_{K_p}-invariant maps q_{K_p}: M_{K_p} → S_{K^pK_p} compatible
  with the transition maps, each inducing an isomorphism M_{K_p}/Δ_{K_p} ≅ S_{K^pK_p}
  (categorical quotient of a finite group action; PerfectoidSpaces:P8/rigid-finite-quotient);
  and a right action of a locally profinite group H on the system (M_{K_p}) normalising the
  Δ_{K_p} and lifting, through a continuous homomorphism H → G(ℚ_p), the action of tower-
  right-action. Put Δ_∞ := lim_{K_p} Δ_{K_p}, a profinite group acting on M^◇_∞ := lim_{K_p}
  M^◇_{K_p}. The orders of the Δ_{K_p} may grow without bound with the level; a single finite
  group Δ is the special case of a constant pro-system. If Δ_{K_p} acts freely on M_{K_p} for
  every K_p, each q_{K_p} is a finite étale Δ_{K_p}-torsor and M^◇_∞ → S^◇_{K^p,∞} is a pro-
  étale Δ_∞-torsor of diamonds. If the pro-system is constant (Δ_{K_p} = Δ) and (M_{K_p}) is a
  good tower, M^◇_∞/Δ ≅ S^◇_{K^p,∞} without any freeness, by PerfectoidSpaces:P8/quotient-of-
  good-tower. The effective deck groups of M and of S differ: the kernel of the H-action on
  M^◇_∞ is computed separately from tower-action-kernel and need not contain the preimage of
  Z_{K^p}.

  Hypotheses:
  * Each Δ_{K_p} is finite and the quotients are categorical quotients of rigid spaces (P8),
  not quotients of moduli functors; Δ_∞ is profinite and in general infinite.
  * The basic example (Birkbeck–Heuer–Williams §8.2): for the Hilbert datum G = Res_{F/ℚ}GL_2
  with tame level μ_N (N ≥ 4) and a polarization module 𝔠, the hybrid spaces X_{Γ(pⁿ)}
  (G*-polarization λ fixed, G-level structure α_n: (𝒪_F/pⁿ)² ≅ A^∨[pⁿ]) over the arithmetic
  spaces X_{G,Γ(pⁿ)}, with Δ_{K(pⁿ)} = Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)² acting through the
  polarization action (BHW Lemma 8.16(1)); the order of Δ(pⁿN) is unbounded in n when [F : ℚ]
  > 1 (for F = ℚ it is 1), and Δ_∞ = Δ(p^∞N) (S5). The G*-tower X_{Γ*(pⁿ)} is not an example
  at full level: its map to X_{G,Γ(pⁿ)} is not surjective, and 𝒪_F^{×,+} no longer acts on it
  by changing the polarization (BHW p. 33).
  * The finite free-quotient assertion uses the separated qcqs rigid-space hypotheses of
  PerfectoidSpaces:P8/free-action-quotient-is-torsor; finite transition maps give the spectral
  compactness needed for surjectivity of the inverse-limit torsor.

  API:
  * `ShimuraTower.Rigidified` (data): A tower (M_{K_p}) with a pro-system of finite groups
  (Δ_{K_p}) acting compatibly, Δ_{K_p}-invariant finite maps to the Shimura tower inducing
  M_{K_p}/Δ_{K_p} ≅ S_{K^pK_p}, and a lifted right action of H.
  * `ShimuraTower.Rigidified.quotientIso` (projection): The isomorphisms M_{K_p}/Δ_{K_p} ≅
  S_{K^pK_p}, compatible with the transition maps.
  * `ShimuraTower.Rigidified.infiniteLevel` (data): M^◇_∞ = lim M^◇_{K_p} with the action of
  Δ_∞ = lim Δ_{K_p} and its map to S^◇_{K^p,∞}.
  * `ShimuraTower.Rigidified.isTorsor_of_free` (characterisation): If Δ_{K_p} acts freely on
  M_{K_p} for every K_p, M^◇_∞ → S^◇_{K^p,∞} is a pro-étale Δ_∞-torsor.
  * `ShimuraTower.Rigidified.quotient_infiniteLevel` (characterisation): For a constant pro-
  system Δ and a good tower M, M^◇_∞/Δ ≅ S^◇_{K^p,∞}.
  * `ShimuraTower.Rigidified.trivial` (constructor): The tower itself with Δ_{K_p} = 1.

  Unit tests:
  * `rigidified_trivial_delta` (degenerate): With Δ_{K_p} = 1 for every K_p: M = S, Δ_∞ = 1
  and the quotient isomorphisms are identities.
  * `rigidified_hilbert_delta_order` (computation): For the Hilbert hybrid tower with F =
  ℚ(√5), N = 4 and p odd: 𝒪_F^{×,+} = ⟨ε²⟩ with ε = (1+√5)/2 of norm −1, and −1 is not a power
  of ε modulo 4, so 𝒪_F^× ∩ (1 + 4pⁿ𝒪_F) = ⟨ε^{k_n}⟩ with k_n the order of ε in (𝒪_F/4pⁿ)^×,
  and |Δ_{K(pⁿ)}| = |Δ(4pⁿ)| = [⟨ε²⟩ : ⟨ε^{2k_n}⟩] = k_n. At n = 0 (the torsor X → X_G of BHW
  Proposition 8.4) k_0 = 6, since ε has order 6 in (𝒪_F/4)^×, so |Δ(4)| = 6; and k_n is
  unbounded in n, so no single finite group serves at every level.
  * `rigidified_not_shimura_kernel` (non-example): For the Hilbert hybrid tower with [F : ℚ] ≥
  2, take η ∈ (1 + N𝒪_F)^× with η ≠ 1 and g = diag(η, η) ∈ H = GL_2(𝒪_p). Then g acts
  trivially on every X_{G,Γ(pⁿ)} (it lies in the central subgroup Z_n of BHW Definition 8.17,
  which acts trivially by Proposition 8.18(3); equivalently in Z_{K^p} of tower-action-
  kernel). On the hybrid tower it acts as the polarization action of η⁻² (g^∨ = g and BHW
  Lemma 8.12), which is a nontrivial element of Δ(pⁿN) for n large (η² ∈ ((1 + pⁿN𝒪_F)^×)²
  would force η ≡ 1 mod pⁿN, as N ≥ 3) and acts freely. So the kernel of the H-action on M^◇_∞
  does not contain the preimage of Z_{K^p}.
-/


/-! ## Contracts for layer S0.general -/


/- CONTRACT `PerfectoidShimuraVarieties:S0.general/general-infinite-level-diamond` (construction)
  The general-data infinite-level diamond

  Statement: For every pure Shimura datum D = (G, X), with the actual canonical models and minimal
  compactifications over E(D) of ShimuraVarieties:V8.general/general-tower and
  ShimuraVarieties:V8.general/general-minimal, and C, ι, K^p as in p-level-tower, the p-level towers
  K_p ↦ S_{K^pK_p}, S*_{K^pK_p} over C, their diamond limits S^◇_{K^p,∞} ⊆ S^{*◇}_{K^p,∞}, the right
  action of G(ℚ_p) and the prime-to-p Hecke action are defined exactly as in infinite-level-diamond
  and tower-right-action, with the same conclusions: S^{*◇}_{K^p,∞} is a spatial diamond with
  |S^{*◇}_{K^p,∞}| ≅ lim |S*_{K^pK_p}|, S^◇_{K^p,∞} is an open locally spatial subdiamond, the
  kernel of the G(ℚ_p)-action is Z_{K^p} (tower-action-kernel), and the components are described by
  component-set-of-infinite-level when G^der is simply connected. No perfectoidness of these
  diamonds and no Hodge–Tate map is asserted for general D; S6 supplies the period map on the
  toroidal tower.

  API:
  * `ShimuraTower.generalInfiniteLevel` (data): S^◇_{K^p,∞} and S^{*◇}_{K^p,∞} for an arbitrary pure
      datum.
  * `ShimuraTower.generalInfiniteLevel_isSpatial` (characterisation): The compactified limit is a
      spatial diamond with |·| the limit of the finite-level spaces.
  * `ShimuraTower.generalInfiniteLevel_action` (instance): The right G(ℚ_p)-action and the
      prime-to-p Hecke action.
  * `ShimuraTower.generalInfiniteLevel_eq_abelian` (compatibility): For abelian-type data it is
      canonically isomorphic to infinite-level-diamond.

  Unit tests:
  * `general_abelian_agrees` (compatibility): For the Siegel datum, generalInfiniteLevel is
      canonically isomorphic to the S0 diamond of the Siegel tower.
  * `general_torus` (degenerate): For a torus datum the general diamond is the profinite set lim
      T(ℚ)\T(𝔸_f)/K^pK_p over Spd C.
  * `general_no_perfectoid_claim` (non-example): The interface provides no perfectoid
      representative: for the constant subsystem at one level (a non-cofinal family) the limit is a
      rigid space's diamond, so representability is a theorem about the cofinal tower only, proved
      in S1–S4 for pre-abelian data.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0.general/toroidal-tower-diamond` (construction)
  The toroidal tower diamond with cone-compatible deck actions

  Statement: Let D be a pure Shimura datum, K^p ⊆ G(𝔸_f^p) neat, K_p ∈ CO_p and Σ a K^pK_p-
  admissible projective cone decomposition (ShimuraCompactifications C0–C3.general).
  Smoothness of Σ is not assumed: it is relative to the lattices U(ℚ) ∩ K, which shrink when
  K_p shrinks, so a Σ that is smooth at level K^pK_p need not be smooth at level K^pK'_p. For
  K'_p ⊆ K_p, Σ is K^pK'_p-admissible, and the toroidal compactifications S^tor_{K^pK'_p,Σ}
  over C (analytified base changes of the canonical models of ShimuraCompactifications
  C2.general) with the proper transition maps S^tor_{K^pK''_p,Σ} → S^tor_{K^pK'_p,Σ} of
  ShimuraCompactifications C3.general form a tower with the same Σ at every level. Put
  S^{tor◇}_{K^p,Σ,∞} := lim_{K'_p ⊆ K_p} (S^tor_{K^pK'_p,Σ})^◇, a spatial diamond with
  |S^{tor◇}_{K^p,Σ,∞}| ≅ lim |S^tor_{K^pK'_p,Σ}|, containing S^◇_{K^p,∞} as the open
  complement of the boundary and mapping to S^{*◇}_{K^p,∞}. Deck actions: K_p acts on the
  tower (k ∈ K_p preserves Σ because Σ is K_p-stable), compatibly with the action on
  S^◇_{K^p,∞}; an element g ∈ G(ℚ_p) outside K_p maps the tower for Σ to the tower for gΣ, and
  two cone decompositions are compared through a common refinement Σ'' and the proper
  refinement maps, which are isomorphisms over S^◇_{K^p,∞}. Hecke correspondences for g ∈
  G(ℚ_p) are formed on a common refinement of Σ and gΣ.

  Hypotheses:
  * Neat K^p; Σ admissible at level K^pK_p, so admissible at all smaller levels; no single Σ
  admits every Hecke correspondence (ShimuraCompactifications C3).
  * The same Σ is used at every level of the tower (Boxer–Pilloni 2026, §3.3; Pilloni–Stroh
  Théorème 0.4 for the Siegel case).

  API:
  * `ShimuraTower.toroidal` (data): The tower K'_p ↦ S^tor_{K^pK'_p,Σ} for K'_p ⊆ K_p with
  fixed Σ.
  * `ShimuraTower.toroidalInfiniteLevel` (data): The diamond S^{tor◇}_{K^p,Σ,∞} = lim
  (S^tor_{K^pK'_p,Σ})^◇.
  * `ShimuraTower.toroidalInfiniteLevel_isSpatial` (characterisation): It is a spatial diamond
  with |·| = lim |S^tor|.
  * `ShimuraTower.toroidalInfiniteLevel.openEmbedding` (projection): S^◇_{K^p,∞} ⊆
  S^{tor◇}_{K^p,Σ,∞} as the complement of the boundary.
  * `ShimuraTower.toroidalInfiniteLevel.toMin` (projection): The map to S^{*◇}_{K^p,∞}.
  * `ShimuraTower.toroidalInfiniteLevel.deck` (instance): The action of K_p, compatible with
  the action on the open part.
  * `ShimuraTower.toroidalInfiniteLevel.refine` (functoriality): For a refinement Σ'' of Σ,
  the map S^{tor◇}_{Σ''} → S^{tor◇}_{Σ}, an isomorphism over the open part, with identity and
  composition laws.
  * `ShimuraTower.toroidalInfiniteLevel.translate` (functoriality): For g ∈ G(ℚ_p), the
  isomorphism from the tower for Σ to the tower for gΣ, compared with the K_p-action on common
  refinements.

  Unit tests:
  * `toroidal_g1_equals_minimal` (compatibility): For the modular-curve datum the toroidal
  tower diamond equals S^{*◇}_{K^p,∞}.
  * `toroidal_refinement_iso_open` (characterisation): For a refinement Σ'' of Σ the map of
  toroidal diamonds is an isomorphism over S^◇_{K^p,∞} and, for a genuine star subdivision
  introducing a new ray in a two-dimensional boundary cone, it is not an isomorphism over the
  affected boundary stratum (the toric chart map is a blow-up).
  * `toroidal_single_level` (degenerate): Restricted to the one-element family {K_p}, the
  limit is (S^tor_{K^pK_p,Σ})^◇.
  * `toroidal_hecke_needs_refinement` (non-example): For the Siegel datum with g = 2 and g =
  diag(p, p, 1, 1) the translate gΣ of a Γ(p)-admissible Σ is in general not a refinement of
  Σ: a Hecke correspondence on the fixed-Σ tower does not exist without passing to a common
  refinement.
-/


/-! ## Contracts for layer S1 -/


/- CONTRACT `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces` (construction)
  The Siegel spaces of the construction: integral models, Hasse domains and finite-level adic
  spaces

  Statement: Fix g ≥ 1, p and K^p as in the hypotheses. Let X = X_{g,K^p} be the moduli scheme
  over ℤ_(p) of principally polarized abelian schemes of dimension g with level-K^p structure
  (PELModuli:M5/siegel-moduli), X* its minimal compactification over ℤ_(p) with ample line
  bundle ω (Faltings–Chai; ShimuraCompactifications C5), normal with normal geometric fibres
  and boundary of codimension g, and X* = Proj ⊕_k H⁰(X, ω^{⊗k}) when g ≥ 2. Let 𝔛 ⊆ 𝔛* be the
  p-adic completions of X ⊗ ℤ_p^cycl ⊆ X* ⊗ ℤ_p^cycl, 𝔄 → 𝔛 the universal abelian scheme, and
  Ha ∈ H⁰(X*_{𝔽_p}, ω^{⊗(p−1)}) the Hasse invariant (HodgeTateAndCanonicalSubgroups T0). For 0
  ≤ ε < 1, the Hasse domain 𝔛*(ε) → 𝔛* is the formal model of AdicSpacesPartII:R2/hasse-domain
  for (𝔛*, ω, Ha): it represents pairs (f, u) with u·Ha(f̄) = p^ε modulo u ~ u(1 + p^{1−ε}h),
  locally Spf((R ⊗̂ ℤ_p^cycl)⟨u⟩/(uH̃a − p^ε)); it is an open formal subscheme of an
  admissible blow-up of 𝔛* (not itself an admissible blow-up; PerfectoidShimuraVarieties/E3),
  and 𝔛(ε), 𝔄(ε) are its pullbacks, with generic fibre 𝒳*(ε) = {|Ha| ≥ |p|^ε}. For K_p ⊆
  GSp_2g(ℤ_p) compact open with c(K_p) = U_m (as for Γ₀(pᵐ), Γ₁(pᵐ), Γ(pᵐ)), X*_{K_pK^p} (the
  minimal compactification of the level-K_pK^p Siegel variety, the normalisation of X* in
  X_{K_pK^p}) lives over ℚ(ζ_{pᵐ}) through the similitude factor (the Weil pairing), and
  𝒳*_{K_p} is the adic space over Spa(ℚ_p^cycl, ℤ_p^cycl) of its base change along ℚ(ζ_{pᵐ}) →
  ℚ_p^cycl for a fixed compatible system (ζ_{pⁿ})_n of p-power roots of unity (the
  tautological ζ_{pᵐ} ∈ ℚ_p^cycl matched with the root ζ_{pᵐ} ∈ 𝒪(X*_{K_pK^p}) given by the
  similitude factor, i.e. the Weil pairing of the level structure: 𝒳*_{K_p} is the fixed-
  similitude part); 𝒳_{K_p} ⊆ 𝒳*_{K_p} the preimage of 𝒳 (the good-reduction locus, not the
  open Shimura variety), 𝒵_{K_p} the boundary, and 𝒳*_{K_p}(ε) the preimage of 𝒳*(ε). Relation
  with the S0 tower: for a complete algebraically closed C ⊇ ℚ_p^cycl and S*_{K^pK_p} =
  (X*_{K_pK^p} ⊗_ℚ C)^{ad} (PerfectoidShimuraVarieties:S0/p-level-tower for the Siegel datum),
  S*_{K^pK_p} = ⊔_{a ∈ (ℤ/pᵐ)^×} 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_a} C, where σ_a ∈ Gal(ℚ_p^cycl/ℚ_p)
  is σ_a(ζ_{pⁿ}) = ζ_{pⁿ}^a; so 𝒳*_{K_p} ⊗_{ℚ_p^cycl} C is the open and closed part of
  S*_{K^pK_p} on which the Weil-pairing root equals the fixed ζ_{pᵐ}, and it is all of
  S*_{K^pK_p} only when m = 0. The comparison at all levels K′_p ⊆ GSp_2g(ℚ_p), at infinite
  level and for the group actions is siegel-similitude-comparison.

  Hypotheses:
  * Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈
  GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of
  ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
  * 𝒳_{K_p} is the locus of good reduction (the preimage of 𝒳 = 𝔛_η), which is strictly
  smaller than the analytification of the open Shimura variety X_{K_pK^p}; the boundary
  𝒵_{K_p} is the preimage of the boundary of 𝒳*.
  * Here U_0 = ℤ_p^× and U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×) = 1 + pᵐℤ_p for m ≥ 1. The formula 1 +
  ℤ_p is not used as a unit subgroup.

  API:
  * `SiegelTorsion.integralMin` (data): The p-adic formal scheme 𝔛* over ℤ_p^cycl with ω and
  the Hasse invariant.
  * `SiegelTorsion.hasseDomain` (constructor): 𝔛*(ε) → 𝔛*, with pullbacks 𝔛(ε), 𝔄(ε).
  * `SiegelTorsion.hasseDomain_generic` (simp): The generic fibre of 𝔛*(ε) is {|Ha| ≥ |p|^ε} ⊆
  𝒳*.
  * `SiegelTorsion.finiteLevel` (data): 𝒳*_{K_p}, 𝒳_{K_p} (good reduction locus) and 𝒵_{K_p}
  for compact open K_p.
  * `SiegelTorsion.finiteLevel_hasse` (projection): 𝒳*_{K_p}(ε) := preimage of 𝒳*(ε).
  * `SiegelTorsion.finiteLevel_eq_tower` (compatibility): For C ⊇ ℚ_p^cycl complete
  algebraically closed and c(K_p) = U_m: S*_{K^pK_p} of PerfectoidShimuraVarieties:S0/p-level-
  tower (Siegel datum) is ⊔_{a ∈ (ℤ/pᵐ)^×} 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_a} C, and 𝒳*_{K_p}
  ⊗_{ℚ_p^cycl} C is its open and closed part where the Weil-pairing root is ζ_{pᵐ}; compatibly
  with level maps, boundaries and open parts.
  * `SiegelTorsion.hasseDomain_mono` (functoriality): For ε' ≤ ε, 𝒳*(ε') ⊆ 𝒳*(ε), with the
  transition maps of AdicSpacesPartII:R2/hasse-domain-transition-maps.

  Unit tests:
  * `hasseDomain_zero_ordinary` (computation): 𝒳*(0) = {|Ha| = 1} is the tube of the ordinary
  locus of X*_{𝔽_p}; for g = 1 it contains every cusp.
  * `goodReduction_ne_open` (non-example): For g = 1, K_p = Γ(p) and a supersingular point,
  its preimage in 𝒳_{Γ(p)} is nonempty, but a point of the open modular curve with
  multiplicative reduction lies in the open Shimura variety and not in 𝒳_{Γ(p)}: 𝒳_{K_p} is
  the good-reduction locus, not X_{K_pK^p}^{an}.
  * `hasseDomain_not_blowup` (non-example): 𝔛*(ε) → 𝔛* is not proper for ε > 0 (its generic
  fibre is the proper open subset {|Ha| ≥ |p|^ε}), so it is not an admissible blow-up, only an
  open subscheme of one.
  * `finiteLevel_trivial_level` (degenerate): For K_p = GSp_2g(ℤ_p), 𝒳*_{K_p} is the generic
  fibre of 𝔛* and 𝒳_{K_p} = 𝒳.
  * `finiteLevel_fixed_similitude_g1` (computation): For g = 1, K^p = K(N)^p (N ≥ 3) and K_p =
  Γ(pᵐ) with m ≥ 1, S*_{K^pK_p} has φ(N)φ(pᵐ) connected components, while 𝒳*_{Γ(pᵐ)}
  ⊗_{ℚ_p^cycl} C has φ(N): those on which the Weil pairing of the level structure at p is
  ζ_{pᵐ}. A definition with 𝒳*_{K_p} ⊗ C = S*_{K^pK_p} fails this.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison` (comparison)
  Scholze's fixed-similitude Siegel spaces over ℚ_p^cycl and the S0 Siegel tower over C

  Statement: Let K^p be as in siegel-finite-level-spaces and let S_{K^pK′_p} ⊆ S*_{K^pK′_p}
  (K′_p ⊆ GSp_2g(ℚ_p) compact open) be the open and minimally compactified p-level towers of
  PerfectoidShimuraVarieties:S0/p-level-tower for the Siegel datum (reflex field ℚ) over a
  complete algebraically closed C, with the C-linear right action T_γ of S0/tower-right-action
  and S0/infinite-level-diamond (iv); fix an embedding ℚ_p^cycl ⊆ C, so that the compatible
  system ζ = (ζ_{pⁿ})_n of siegel-finite-level-spaces lies in C. For a point with level
  structure α: T_pA ≅ ℤ_p^{2g} (a symplectic similitude), its Weil-pairing root w ∈ ℤ_p^× is
  defined by e(α⁻¹x, α⁻¹y) = ζ^{w·⟨x, y⟩} (⟨ , ⟩ the standard symplectic form, ⟨e_i, e_{g+i}⟩
  = 1); at a level K′_p with c(K′_p) ⊆ U_m, w mod pᵐ is locally constant, and w:
  |S^{*◇}_{K^p,∞}| → ℤ_p^× is continuous and factors through π₀ (S0/component-set-of-infinite-
  level). For a ∈ ℤ_p^× let σ_a ∈ Gal(ℚ_p^cycl/ℚ_p) be the automorphism with σ_a(ζ_{pⁿ}) =
  ζ_{pⁿ}^a, and for γ ∈ GSp_2g(ℚ_p) put u(γ) := c(γ)p^{−v_p(c(γ))} ∈ ℤ_p^×. Then: (i) (finite
  level) for K_p ⊆ GSp_2g(ℤ_p) compact open with c(K_p) = U_m (m ≥ 0), S*_{K^pK_p} = ⊔_{a ∈
  (ℤ/pᵐ)^×} {w ≡ a mod pᵐ} with {w ≡ a} ≅ 𝒳*_{K_p} ⊗_{ℚ_p^cycl, σ_a} C; in particular 𝒳*_{K_p}
  ⊗_{ℚ_p^cycl} C is the open and closed part {w ≡ 1 mod pᵐ} of S*_{K^pK_p}, equal to
  S*_{K^pK_p} only for m = 0; likewise for the open parts 𝒳*_{K_p} ∖ 𝒵_{K_p} and S_{K^pK_p}
  and for the boundaries. (ii) (infinite level) For every perfectoid field L ⊇ ℚ_p^cycl,
  Spa(ℚ_p^cycl) ×_{Spa ℚ_p} Spa(L) ≅ ℤ_p^× × Spa(L) = Spa(C⁰(ℤ_p^×, L), C⁰(ℤ_p^×, 𝒪_L)), the
  point a ∈ ℤ_p^× corresponding to ℚ_p^cycl →σ_a ℚ_p^cycl ⊆ L, and lim_m 𝒳*^◇_{Γ(pᵐ)} ×_{Spd
  ℚ_p} Spd L ≅ lim_m (X*_{Γ(pᵐ)K^p} ⊗_ℚ L)^{ad◇}; for L = C this is S^{*◇}_{K^p,∞} =
  lim_{K′_p} S*^◇_{K^pK′_p} (Γ(pᵐ) cofinal), and its part {w = 1} is lim_m 𝒳*^◇_{Γ(pᵐ)} ×_{Spd
  ℚ_p^cycl} Spd C. Hence, once 𝒳*_{Γ(p^∞)} ~ lim_m 𝒳*_{Γ(pᵐ)} exists as a perfectoid space
  over ℚ_p^cycl (perfectoid-siegel-space): S^{*◇}_{K^p,∞} ≅ (𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C)^◇
  = (𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p^cycl} Spa C⁰(ℤ_p^×, C))^◇; the perfectoid space 𝒳*_{Γ(p^∞)} ×_{Spa
  ℚ_p} Spa C is a perfectoid representative (S0/perfectoid-representative) of the Siegel tower
  (S*_{K^pK′_p})_{K′_p ⊆ GSp_2g(ℚ_p)}; and 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C is its closed fixed-
  pairing fibre {w = 1}, generally not open, not the whole tower (π₀ differs by the factor
  ℤ_p^×); likewise for the complements of the boundaries. (iii) (actions, all levels) Under
  (ii) the C-linear right action of GSp_2g(ℚ_p) on S^{*◇}_{K^p,∞} is the base change of the
  ℚ_p-linear right action on lim_m (X*_{Γ(pᵐ)K^p} ⊗_ℚ ℚ_p)^{ad◇} ≅ lim_m 𝒳*^◇_{Γ(pᵐ)} by the
  translations of ShimuraVarieties:V8/translation-laws (Scholze's GSp_2g(ℚ_p)-action), and
  w(x·γ) = u(γ)·w(x); equivalently, for the structure map s to Spd ℚ_p^cycl, T_γ^* ∘ s^* = s^*
  ∘ σ_{u(γ)}, so γ acts ℚ_p^cycl-linearly iff c(γ) ∈ p^ℤ. For every compact open K′_p ⊆
  GSp_2g(ℚ_p), ((𝒳*_{Γ(p^∞)} ∖ 𝒵_{Γ(p^∞)}) ×_{Spa ℚ_p} Spa C)^◇ → S^◇_{K^pK′_p} is a pro-étale
  K′_p-torsor; if K′_p ⊆ GSp_2g(ℤ_p) with c(K′_p) = U_m, the stabiliser of the part {w = 1} in
  K′_p is K′_p ∩ ker c, and the restriction of this torsor to {w = 1} is a (K′_p ∩ ker
  c)-torsor over (𝒳*_{K′_p} ∖ 𝒵_{K′_p}) ⊗_{ℚ_p^cycl} C.

  Hypotheses:
  * Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈
  GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of
  ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
  * C is complete and algebraically closed with a fixed embedding ℚ_p^cycl ⊆ C (equivalently a
  compatible system of p-power roots of unity in C); L in (ii) is any perfectoid field
  containing ℚ_p^cycl, for instance Heuer's base field K.
  * Conventions: the right action x·γ is α ↦ γ⁻¹ ∘ α on α: V_pA ≅ ℚ_p^{2g}, i.e. η ↦ η ∘ γ on
  η = α⁻¹, which is S0's T_γ ([x, a] ↦ [x, aγ]); the Weil pairing is normalised by e(α⁻¹e_i,
  α⁻¹e_{g+i}) = ζ on the fixed-similitude part.
  * Here U_0 = ℤ_p^× and U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×) = 1 + pᵐℤ_p for m ≥ 1. The formula 1 +
  ℤ_p is not used as a unit subgroup.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/frobenius-diagram-mod-p` (lemma)
  The Frobenius diagram modulo p on Hasse domains

  Statement: Let 0 ≤ ε < 1. The relative Frobenius maps of 𝔄(p⁻¹ε)/p, 𝔛(p⁻¹ε)/p and 𝔛*(p⁻¹ε)/p over
  ℤ_p^cycl/p, followed by the natural isomorphisms (𝔜(p⁻¹ε)/p)^{(p)} ≅ 𝔜(ε)/p (𝔜 = 𝔄, 𝔛, 𝔛*), form a
  natural commutative diagram F: 𝔄(p⁻¹ε)/p → 𝔄(ε)/p over F: 𝔛(p⁻¹ε)/p → 𝔛(ε)/p over F: 𝔛*(p⁻¹ε)/p →
  𝔛*(ε)/p.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/frobenius-trace-estimates` (theorem)
  Trace estimates for Frobenius-type extensions on Hasse domains

  Statement: (i) (Lemma 3.2.21) Let R be a p-adically complete flat ℤ_p-algebra, Y_1, …, Y_n ∈
  R, P_1, …, P_n ∈ R⟨X_1, …, X_n⟩ topologically nilpotent and S = R⟨X⟩/(X_i^p − Y_i − P_i).
  Then S is finite free over R with basis X^{i} (0 ≤ i_j ≤ p − 1), and tr_{S/R}(S) ⊆ Iⁿ for I
  = (p, I_1, …, I_n), I_i the ideal generated by the coefficients of P_i. (ii) (Corollary
  3.2.22) Let R be a p-adically complete ℤ_p-algebra topologically of finite type and formally
  smooth of dimension n, f ∈ R with f̄ ∈ R/p a nonzerodivisor, R_ε = (R ⊗̂_{ℤ_p}
  ℤ_p^cycl)⟨u_ε⟩/(f u_ε − p^ε) for 0 ≤ ε < 1, and φ: R_ε → R_{ε/p} a ℤ_p^cycl-algebra map that
  is, modulo p^{1−ε}, Frobenius on R̄ and u_ε ↦ u_{ε/p}^p. If ε < 1/2 then φ[1/p] is finite
  flat, indeed finite free of rank p^n locally on Spf R, and the trace tr: R_{ε/p}[1/p] →
  R_ε[1/p] maps R_{ε/p} into p^{n−(2n+1)ε} R_ε.

  Hypotheses:
  * As stated; the trace is the trace of a finite locally free algebra
  (AdicSpacesPartII:R3/finite-locally-free-algebra-trace).
  * ε < 1/2 in (ii).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift` (theorem)
  Canonical Frobenius lifts on Hasse domains

  Statement: Let 0 ≤ ε < 1/2. There is a unique diagram of p-adic formal schemes F̃: 𝔄(p⁻¹ε) →
  𝔄(ε), 𝔛(p⁻¹ε) → 𝔛(ε), 𝔛*(p⁻¹ε) → 𝔛*(ε), compatible with the projections, in which F̃_𝔄 is an
  isogeny of principally polarised abelian schemes with level structure over F̃_𝔛, that
  reduces modulo p^{1−ε} to the diagram of frobenius-diagram-mod-p (uniqueness is among the
  displayed diagrams, including the morphism of abelian schemes and the moduli structures). On
  𝔛(p⁻¹ε), F̃ sends A to A/C, where C ⊆ A[p] is the canonical subgroup of level 1 (it exists
  because Ha^p divides p^ε there). The maps F̃_{𝔛(p⁻¹ε)} and F̃_{𝔄(p⁻¹ε)} are finite, and
  after inverting p they are finite étale of degrees p^{g(g+1)/2} and p^{g(g+1)/2+g}. No
  general integral-flatness assertion is made here.

  Hypotheses:
  * Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈
  GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of
  ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
  * 0 ≤ ε < 1/2 (needed for the strong canonical subgroup of level 1 on 𝔄(p⁻¹ε), whose
  uniqueness gives the uniqueness of the diagram).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/anticanonical-open-immersions` (theorem)
  Anticanonical open immersions into Γ₀(pᵐ)-level

  Statement: Let 0 ≤ ε < 1/2 and m ≥ 0. Then 𝔄(p⁻ᵐε) → 𝔛(p⁻ᵐε) has a canonical subgroup C_m ⊆
  𝔄(p⁻ᵐε)[pᵐ] of level m, and the pair (𝒜(p⁻ᵐε)/C_m, 𝒜(p⁻ᵐε)[pᵐ]/C_m) defines a morphism 𝒳(p⁻ᵐε) →
  𝒳_{Γ₀(pᵐ)} on generic fibres, which extends uniquely to 𝒳*(p⁻ᵐε) → 𝒳*_{Γ₀(pᵐ)}; these morphisms
  are open immersions. For m ≥ 1 the square with top 𝒳*(p⁻ᵐ⁻¹ε) → 𝒳*_{Γ₀(pᵐ⁺¹)}, left
  (F̃_{𝔛*(p⁻ᵐ⁻¹ε)})^{ad}_η, right the forgetful map 𝒳*_{Γ₀(pᵐ⁺¹)} → 𝒳*_{Γ₀(pᵐ)} and bottom 𝒳*(p⁻ᵐε)
  → 𝒳*_{Γ₀(pᵐ)} commutes and is cartesian.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/anticanonical-locus-level-p` (theorem)
  The anticanonical locus at Γ₀(p)-level

  Statement: Let 0 ≤ ε < 1/2. There is a weak canonical subgroup C ⊆ 𝔄(ε)[p] of level 1 (the
  published text says 'of level p'; PerfectoidShimuraVarieties/E5); write C also for its generic
  fibre, and let 𝒳_{Γ₀(p)}(ε) → 𝒳(ε) be the pullback of 𝒳_{Γ₀(p)} → 𝒳. Then the map 𝒳(p⁻¹ε) →
  𝒳_{Γ₀(p)}(ε) of anticanonical-open-immersions and (F̃_{𝔛(p⁻¹ε)})^{ad}_η: 𝒳(p⁻¹ε) → 𝒳(ε) form a
  commutative triangle over 𝒳(ε), identifying 𝒳(p⁻¹ε) with the open and closed subset 𝒳_{Γ₀(p)}(ε)_a
  ⊆ 𝒳_{Γ₀(p)}(ε) of those totally isotropic D ⊆ 𝒜(ε)[p] of rank p^g with D ∩ C = {0} ('a' for
  anticanonical).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/anticanonical-tower` (construction)
  The anticanonical Γ₀(pᵐ)-tower and its affinoidness at deep level

  Statement: Let 0 ≤ ε < 1/2. For m ≥ 1 define 𝒳_{Γ₀(pᵐ)}(ε)_a ⊆ 𝒳_{Γ₀(pᵐ)}(ε) and 𝒳*_{Γ₀(pᵐ)}(ε)_a
  ⊆ 𝒳*_{Γ₀(pᵐ)}(ε) as the images of the open immersions 𝒳(p⁻ᵐε) → 𝒳_{Γ₀(pᵐ)} and 𝒳*(p⁻ᵐε) →
  𝒳*_{Γ₀(pᵐ)}; 𝒳*_{Γ₀(pᵐ)}(ε)_a is open and closed in 𝒳*_{Γ₀(pᵐ)}(ε) and is the preimage of
  𝒳*_{Γ₀(p)}(ε)_a; for K_p ⊆ Γ₀(p) put 𝒳*_{K_p}(ε)_a := preimage of 𝒳*_{Γ₀(p)}(ε)_a. The
  anticanonical tower is (𝒳*_{Γ₀(pᵐ)}(ε)_a)_{m ≥ 1} with transition maps the forgetful maps; it has
  the integral models 𝔛*(p⁻ᵐε) with transition maps the Frobenius lifts F̃, which reduce to relative
  Frobenius modulo p^{1−ε}. For m sufficiently large (depending on ε), 𝒳*_{Γ₀(pᵐ)}(ε)_a is affinoid
  (Lemma 3.2.17).

  API:
  * `SiegelTorsion.anticanonical` (data): The tower m ↦ 𝒳*_{Γ₀(pᵐ)}(ε)_a with forgetful transition
      maps.
  * `SiegelTorsion.anticanonical_iso_hasse` (equivalence): 𝒳*_{Γ₀(pᵐ)}(ε)_a ≅ 𝒳*(p⁻ᵐε).
  * `SiegelTorsion.anticanonical_isClopen` (characterisation): 𝒳*_{Γ₀(pᵐ)}(ε)_a is open and closed
      in 𝒳*_{Γ₀(pᵐ)}(ε).
  * `SiegelTorsion.anticanonical_integralModel` (data): The integral tower 𝔛*(p⁻ᵐε) with
      Frobenius-lift transitions, a Frobenius-controlled integral tower in the sense of
      PerfectoidSpaces:P7.
  * `SiegelTorsion.anticanonical_isAffinoid` (characterisation): 𝒳*_{Γ₀(pᵐ)}(ε)_a is affinoid for m
      ≫ 0.
  * `SiegelTorsion.anticanonical_restrict` (functoriality): For K_p ⊆ Γ₀(p), the preimage
      𝒳*_{K_p}(ε)_a, compatible with level maps.

  Unit tests:
  * `anticanonical_m1_degree` (computation): For g = 1, 𝒳_{Γ₀(p)}(ε) → 𝒳(ε) has degree p + 1 and its
      anticanonical part has degree p: the canonical part is one sheet.
  * `anticanonical_eps_zero` (degenerate): For ε = 0 the anticanonical tower lies over the ordinary
      locus and its integral transition maps are exactly relative Frobenius modulo p.
  * `anticanonical_not_full_preimage` (non-example): 𝒳_{Γ₀(p)}(ε)_a is not the whole preimage of
      𝒳(ε): the locus D = C (canonical) is a different open and closed piece.
  * `anticanonical_affinoid_of_lift` (characterisation): If m ≥ 1 and Ha^{pᵐ} lifts to a global
      section H̃ of ω^{⊗pᵐ(p−1)} over 𝔛* (for instance when H¹(X*, ω^{⊗pᵐ(p−1)}) = 0), then
      𝒳*_{Γ₀(pᵐ)}(ε)_a ≅ 𝒳*(p⁻ᵐε) = {|H̃| ≥ |p|^ε} (using ε < 1), which is affinoid because H̃ is a
      section of an ample line bundle; a definition not identifying level m with the Hasse domain of
      radius p⁻ᵐε fails this.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid` (theorem)
  The anticanonical tower at Γ₀(p^∞)-level is perfectoid and its tilt is a perfection

  Statement: Let 0 ≤ ε < 1/2. There are unique perfectoid spaces 𝒳_{Γ₀(p^∞)}(ε)_a,
  𝒳*_{Γ₀(p^∞)}(ε)_a and 𝒜_{Γ₀(p^∞)}(ε)_a over ℚ_p^cycl with 𝒳_{Γ₀(p^∞)}(ε)_a ~ lim_m
  𝒳_{Γ₀(pᵐ)}(ε)_a and likewise for the other two (tilde-limits in the sense of
  PerfectoidSpaces:P7/perfectoid-tilde-limit). The tilt of 𝒳*_{Γ₀(p^∞)}(ε)_a is naturally the
  open subset 𝒳′*^{perf}(ε) ⊆ 𝒳′*^{perf} where |Ha| ≥ |t|^ε, and the tilt of 𝒜_{Γ₀(p^∞)}(ε)_a
  is 𝒜′^{perf}(ε); here the primed spaces are the Siegel spaces over the completed perfection
  of 𝔽_p((t^{1/(p−1)})), identified with (ℚ_p^cycl)^♭ after choosing the tilt parameter, t^♯ =
  p up to a unit, and ^{perf} is the perfection of PerfectoidSpaces:P7/perfection-tilde-limit.

  Hypotheses:
  * Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈
  GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of
  ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
  * 0 ≤ ε < 1/2; the limit runs over the anticanonical tower, which is not a cofinal level
  system (Γ₀(p^∞) is not open).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/gamma0-boundary-strongly-zariski-closed` (theorem)
  At Γ₀(p^∞)-level the anticanonical piece is affinoid perfectoid with strongly Zariski closed
  boundary

  Statement: For 0 ≤ ε < 1/2, 𝒳*_{Γ₀(p^∞)}(ε)_a is affinoid perfectoid, and its boundary
  𝒵_{Γ₀(p^∞)}(ε)_a ⊆ 𝒳*_{Γ₀(p^∞)}(ε)_a is strongly Zariski closed
  (PerfectoidSpaces:P4/strongly-zariski-closed-immersion: R → S surjective, R⁺ → S⁺ almost
  surjective, S⁺ the integral closure of the image).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/tate-normalized-traces` (construction)
  Tate's normalized traces on the anticanonical tower

  Statement: Fix 0 ≤ ε < 1/2 and let 𝔛_{Γ₀(p^∞)}(ε)_a = lim_m 𝔛(p⁻ᵐε) over ℤ_p^cycl (transition maps
  the Frobenius lifts F̃). For fixed m and m′ ≥ m the normalized traces p^{−(m′−m)g(g+1)/2} tr:
  𝒪_{𝔛(p^{−m′}ε)}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p] are compatible in m′ and define tr̄_m: colim_{m′}
  𝒪_{𝔛(p^{−m′}ε)}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p]; the image of colim_{m′} 𝒪_{𝔛(p^{−m′}ε)} lies in
  p^{−C_m}𝒪_{𝔛(p⁻ᵐε)} with constants C_m → 0, so tr̄_m extends by continuity to
  𝒪_{𝔛_{Γ₀(p^∞)}(ε)_a}[1/p] → 𝒪_{𝔛(p⁻ᵐε)}[1/p], an 𝒪_{𝔛(p⁻ᵐε)}[1/p]-linear retraction of the
  inclusion; and x = lim_{m→∞} tr̄_m(x) for every x.

  API:
  * `SiegelTorsion.normalizedTrace` (constructor): tr̄_m: 𝒪(𝔛_{Γ₀(p^∞)}(ε)_a)[1/p] →
      𝒪(𝔛(p⁻ᵐε))[1/p].
  * `SiegelTorsion.normalizedTrace_of_finiteLevel` (simp): tr̄_m(x) = x for x at level m.
  * `SiegelTorsion.normalizedTrace_compat` (relation): tr̄_m ∘ tr̄_{m′} = tr̄_m for m′ ≥ m.
  * `SiegelTorsion.normalizedTrace_bound` (characterisation): tr̄_m maps the integral colimit into
      p^{−C_m}𝒪(𝔛(p⁻ᵐε)) with C_m → 0.
  * `SiegelTorsion.normalizedTrace_tendsto` (characterisation): x = lim_m tr̄_m(x).
  * `SiegelTorsion.normalizedTrace_linear` (structure): tr̄_m is linear over 𝒪(𝔛(p⁻ᵐε))[1/p] and
      continuous.

  Unit tests:
  * `normalizedTrace_identity_level` (degenerate): For x already at level m, tr̄_m(x) = x.
  * `normalizedTrace_g1_monomial` (computation): For the toy tower ℤ_p⟨T^{1/p^∞}⟩ (one Frobenius
      step T ↦ T^p, n = 1, ε = 0), tr̄_0(T^{a/p^k}) = 0 when a/p^k ∉ ℤ and = T^{a/p^k} when it is an
      integer: the normalized trace is the projection onto integral exponents.
  * `normalizedTrace_not_unnormalized` (non-example): The unnormalized trace tr does not give a
      retraction: tr(1) = p^{(m′−m)g(g+1)/2} ≠ 1, so the factor p^{−(m′−m)g(g+1)/2} is required.
  * `normalizedTrace_compat_R3` (compatibility): On finite levels the normalized trace is p^{−deg}
      times AdicSpacesPartII:R3/analytic-trace-finite-locally-free of the transition map (after
      inverting p).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/hartogs-for-finite-covers-of-anticanonical-tower` (theorem)
  Hartogs extension for finite covers of the anticanonical tower

  Statement: Assume g ≥ 2 and 0 ≤ ε < 1/2. Let 𝒴*_m → 𝒳*_{Γ₀(pᵐ)}(ε)_a be finite, étale away from
  the boundary, with 𝒴*_m normal and no irreducible component mapping into the boundary; let 𝒴_m be
  the preimage of 𝒳_{Γ₀(pᵐ)}(ε)_a, for m′ ≥ m let 𝒴*_{m′} be the normalisation of the pullback to
  𝒳*_{Γ₀(p^{m′})}(ε)_a with 𝒴_{m′} ⊆ 𝒴*_{m′}, and 𝒴_∞ the pullback of 𝒴_m to 𝒳_{Γ₀(p^∞)}(ε)_a. For
  m′ large, 𝒴*_{m′} = Spa(S_{m′}, S_{m′}⁺) with S_{m′}⁺ = S_{m′}° is affinoid. Then (i) S_{m′}⁺ =
  H⁰(𝒴_{m′}, 𝒪⁺) for m′ large; (ii) colim_{m′} S_{m′}⁺ → H⁰(𝒴_∞, 𝒪⁺) is injective with dense image,
  and there are canonical continuous retractions H⁰(𝒴_∞, 𝒪) → S_{m′}; (iii) if S_∞ = H⁰(𝒴_∞, 𝒪) is a
  perfectoid ℚ_p^cycl-algebra and 𝒴*_∞ = Spa(S_∞, S_∞⁺) with S_∞⁺ = S_∞°, then 𝒴*_∞ is affinoid
  perfectoid, 𝒴*_∞ ~ lim_{m′} 𝒴*_{m′}, and S_∞⁺ is the p-adic completion of colim_{m′} S_{m′}⁺.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/anticanonical-torsion-and-tilt` (theorem)
  The p^m-torsion of the anticanonical abelian variety at Γ₀(p^∞)-level and its tilt

  Statement: Assume g ≥ 2 and 0 ≤ ε < 1/2. Over 𝒳_{Γ₀(pᵐ)}(ε)_a, 𝒜_{Γ₀(pᵐ)}(ε)_a = 𝒜(p⁻ᵐε) maps by
  an isogeny with kernel the canonical subgroup C_m to the tautological abelian variety
  𝒜^t_{Γ₀(pᵐ)}(ε)_a, and D_m := 𝒜_{Γ₀(pᵐ)}(ε)_a[pᵐ]/C_m ⊆ 𝒜^t_{Γ₀(pᵐ)}(ε)_a is finite étale over
  𝒳_{Γ₀(pᵐ)}(ε)_a; let D_{m,Γ₀(p^∞)} be its pullback to 𝒳_{Γ₀(p^∞)}(ε)_a, a perfectoid space. Then
  (Lemma 3.2.25) 𝒜_{Γ₀(p^∞)}(ε)_a[pᵐ] → D_{m,Γ₀(p^∞)} is an isomorphism of perfectoid spaces, and
  (Lemma 3.2.26) the tilt of D_{m,Γ₀(p^∞)} is canonically the perfection of D′_m = 𝒜′(ε)[pᵐ]/C′_m →
  𝒳′(ε), with C′_m the canonical subgroup (kernel of Frobenius) on the characteristic-p side.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/characteristic-p-base-triples-good` (theorem)
  The characteristic-p Hasse-locus triples are good

  Statement: Assume g ≥ 2, 0 ≤ ε < 1/2 and m ≥ 1. Let X^{ord*} ⊆ X* ⊗ 𝔽_p be the affine locus where
  Ha is invertible, X^{ord} its intersection with X ⊗ 𝔽_p, D_m^{ord} → X^{ord} the quotient of the
  pᵐ-torsion by its canonical subgroup, X^{ord}_{Γ₁(pᵐ)} → X^{ord} the finite scheme of isomorphisms
  D_m^{ord} ≅ (ℤ/pᵐ)^g and X^{ord*}_{Γ₁(pᵐ)} = Spec H⁰(X^{ord}_{Γ₁(pᵐ)}, 𝒪) (normal, finite over
  X^{ord*}). Let 𝒳′*_{Γ₁(pᵐ)}(ε) be the locus |Ha| ≥ |t|^ε in the adic space of X^{ord*}_{Γ₁(pᵐ)} ⊗
  𝔽_p((t^{1/(p−1)p^∞})), with boundary 𝒵′* and good-reduction part 𝒳′. Then the triples
  (𝒳′*(ε)^{perf}, 𝒵′*(ε)^{perf}, 𝒳′(ε)^{perf}) and (𝒳′*_{Γ₁(pᵐ)}(ε)^{perf}, 𝒵′*_{Γ₁(pᵐ)}(ε)^{perf},
  𝒳′_{Γ₁(pᵐ)}(ε)^{perf}) are good in the sense of Scholze Definition 2.3.8: H⁰(𝒳′*^{perf}, 𝒪⁺/t)^a ≅
  H⁰(𝒳′*^{perf} ∖ 𝒵′*^{perf}, 𝒪⁺/t)^a ↪ H⁰(𝒳′^{perf}, 𝒪⁺/t)^a.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/gamma1-cover-tilt` (theorem)
  Tilting the Γ₁(pᵐ)-cover of the anticanonical tower

  Statement: Assume g ≥ 2, 0 ≤ ε < 1/2, m ≥ 1, and apply
  hartogs-for-finite-covers-of-anticanonical-tower to 𝒴*_m = 𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a.
  Then (Lemma 3.2.29) the tilt of 𝒴_∞ is 𝒳′_{Γ₁(pᵐ)}(ε)^{perf}; (Lemma 3.2.30) the tilt of 𝒴*_∞ ∖ ∂
  is 𝒳′*_{Γ₁(pᵐ)}(ε)^{perf} ∖ ∂ (the published proof writes 𝒴*_m ∖ ∂ for 𝒴*_∞ ∖ ∂;
  PAPER-SCHOLZE-15/E22); (Lemma 3.2.31, used here in its bounded form) for perfectoid spaces 𝒳, 𝒴₁,
  𝒴₂ over a perfectoid field, finite étale 𝒴_i → 𝒳, f: 𝒴₁ → 𝒴₂ over 𝒳 and an open 𝒰 ⊆ 𝒳 with H⁰(𝒳,
  𝒪⁺) ↪ H⁰(𝒰, 𝒪⁺) (goodness), if f is an isomorphism over 𝒰 then f is an isomorphism (the printed
  hypothesis on 𝒪 is not available on the non-quasicompact complement of the boundary; only
  idempotents are needed); (Lemma 3.2.32) S_∞ = H⁰(𝒴_∞, 𝒪) is perfectoid and the tilt of 𝒴*_∞ =
  Spa(S_∞, S_∞⁺) is 𝒳′*_{Γ₁(pᵐ)}(ε)^{perf}.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/gamma1-level-perfectoid` (theorem)
  The anticanonical tower at Γ₁(pᵐ) ∩ Γ₀(p^∞) and Γ₁(p^∞) levels

  Statement: Let 0 ≤ ε < 1/2. For every m ≥ 1 there is a unique perfectoid space
  𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a over ℚ_p^cycl with 𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a ~ lim_{m′}
  𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a; it and all 𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a for m′ large are affinoid,
  colim_{m′} H⁰(𝒳*_{Γ₁(pᵐ)∩Γ₀(p^{m′})}(ε)_a, 𝒪) → H⁰(𝒳*_{Γ₁(pᵐ)∩Γ₀(p^∞)}(ε)_a, 𝒪) has dense image,
  and with 𝒵 the boundary and 𝒳 the preimage of 𝒳_{Γ₀(p)}(ε)_a the triple (𝒳*, 𝒵, 𝒳) at this level
  is good (Proposition 3.2.33). The same holds at Γ₁(p^∞)-level: 𝒳*_{Γ₁(p^∞)}(ε)_a ~ lim_m
  𝒳*_{Γ₁(pᵐ)}(ε)_a (Proposition 3.2.34). For g = 1 the same statements follow from the Γ₀(p^∞)-level
  by finite étale base change, since 𝒳*_{Γ₁(pᵐ)}(ε)_a → 𝒳*_{Γ₀(pᵐ)}(ε)_a is finite étale also over
  the cusps.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid` (theorem)
  Full Γ(p^∞)-level: the anticanonical neighbourhood is affinoid perfectoid with a good boundary
  triple

  Statement: Let 0 ≤ ε < 1/2. (Lemma 3.2.35) For m ≥ 1, 𝒳*_{Γ(pᵐ)}(ε)_a → 𝒳*_{Γ₁(pᵐ)}(ε)_a is finite
  étale. (Theorem 3.2.36) There is a unique perfectoid space 𝒳*_{Γ(p^∞)}(ε)_a over ℚ_p^cycl with
  𝒳*_{Γ(p^∞)}(ε)_a ~ lim_m 𝒳*_{Γ(pᵐ)}(ε)_a; it and all 𝒳*_{Γ(pᵐ)}(ε)_a for m large are affinoid,
  colim_m H⁰(𝒳*_{Γ(pᵐ)}(ε)_a, 𝒪) → H⁰(𝒳*_{Γ(p^∞)}(ε)_a, 𝒪) has dense image and, more precisely,
  H⁰(𝒳*_{Γ(p^∞)}(ε)_a, 𝒪⁺) is the p-adic completion of colim_m H⁰(𝒳*_{Γ(pᵐ)}(ε)_a, 𝒪⁺) (the form
  used by siegel-main-theorem (i); the source states only density, PerfectoidShimuraVarieties/E11),
  and with 𝒵_{Γ(p^∞)}(ε)_a the boundary and 𝒳_{Γ(p^∞)}(ε)_a the preimage of 𝒳_{Γ₀(p)}(ε)_a the
  triple (𝒳*_{Γ(p^∞)}(ε)_a, 𝒵_{Γ(p^∞)}(ε)_a, 𝒳_{Γ(p^∞)}(ε)_a) is good: bounded functions extend
  uniquely from the complement of the boundary.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map` (construction)
  The continuous Hodge–Tate map on the open infinite-level Siegel tower

  Statement: Put |𝒳*_{Γ(p^∞)}| := lim_m |𝒳*_{Γ(pᵐ)}|, |𝒵_{Γ(p^∞)}| := lim_m |𝒵_{Γ(pᵐ)}|, with their
  continuous GSp_2g(ℚ_p)-actions; for a complete nonarchimedean K over ℚ_p^cycl with open bounded
  valuation subring K⁺, 𝒳*_{Γ(p^∞)}(K, K⁺) := lim_m 𝒳*_{Γ(pᵐ)}(K, K⁺), and |𝒳*_{Γ(p^∞)}| is the
  (non-filtered) colimit of these sets, each point coming from a unique minimal (K, K⁺) (Remark
  3.3.3). Let Fl be the flag variety over ℚ_p of totally isotropic g-dimensional subspaces of
  (ℚ_p^{2g}, standard symplectic form), the compact dual of the Siegel datum
  (ShimuraData:D3/compact-dual), with its Plücker charts Fl_J (HodgeTateAndCanonicalSubgroups T2).
  There is a GSp_2g(ℚ_p)-equivariant continuous map |π_HT|: |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| → |Fl|
  sending a point given by a principally polarized abelian variety A/K with a symplectic similitude
  α: T_pA ≅ ℤ_p^{2g} (compatible with the fixed ζ_{p^∞}) to the Hodge–Tate filtration Lie A ⊗ K(1) ⊆
  T_pA ⊗ K ≅ K^{2g}. Equivariance law: GSp_2g(ℚ_p) acts on the tower on the right by x·γ: α ↦ γ⁻¹ ∘
  α (on V_pA ≅ ℚ_p^{2g}; this is S0's right translation T_γ, transported by
  siegel-similitude-comparison), and |π_HT|(x·γ) = γ⁻¹·|π_HT|(x) for the standard left action of
  GSp_2g(ℚ_p) on Fl ⊆ Gr(g, ℚ_p^{2g}); equivalently |π_HT| is equivariant for the right action W·γ
  := γ⁻¹W on Fl.

  API:
  * `SiegelTorsion.htMapTop` (constructor): |π_HT|: |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| → |Fl|.
  * `SiegelTorsion.htMapTop_apply` (simp): On a (K, K⁺)-point (A, α), |π_HT| is the Hodge–Tate
      filtration α(Lie A ⊗ K(1)) ⊆ K^{2g}.
  * `SiegelTorsion.htMapTop_continuous` (characterisation): |π_HT| is continuous.
  * `SiegelTorsion.htMapTop_equivariant` (functoriality): |π_HT|(x·γ) = |π_HT|(x)·γ for γ ∈
      GSp_2g(ℚ_p), where x·γ (α ↦ γ⁻¹ ∘ α) is the right action matching S0's T_γ
      (siegel-similitude-comparison) and W·γ := γ⁻¹W is the right action on Fl; i.e. |π_HT|(x·γ) =
      γ⁻¹·|π_HT|(x) for the standard left action.
  * `SiegelTorsion.points_infiniteLevel` (characterisation): 𝒳*_{Γ(p^∞)}(K, K⁺) = lim_m
      𝒳*_{Γ(pᵐ)}(K, K⁺), and |𝒳*_{Γ(p^∞)}| is the colimit over (K, K⁺) with unique minimal
      representatives.

  Unit tests:
  * `htMapTop_ordinary_rational` (computation): For g = 1 and an ordinary E over 𝒪_C, |π_HT|(E, α) ∈
      ℙ¹(ℚ_p), equal to the line α(T_p(E[p^∞]^{mult}) ⊗ C).
  * `htMapTop_supersingular_drinfeld` (computation): For g = 1 and E supersingular, |π_HT|(E, α) ∉
      ℙ¹(ℚ_p).
  * `htMapTop_tate_curve` (computation): For g = 1 and the Tate curve E = T(q) over K with 0 < |q| <
      1 (a point of |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| outside the good-reduction locus) and α(T_pμ_{p^∞})
      = ℤ_p e_1, |π_HT|(E, α) = [1 : 0]: the Hodge–Tate filtration of E is T_pμ_{p^∞} ⊗ K, so a
      definition through good reduction or Néron special fibres misses or misplaces this point.
  * `htMapTop_isotropic` (compatibility): The image lies in the Lagrangian Grassmannian: the
      Hodge–Tate filtration is totally isotropic for the Weil pairing, so |π_HT| lands in Fl ⊆ Gr(g,
      2g) (Mathlib Module.Grassmannian for the ambient Grassmannian).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/rational-flags-preimage` (theorem)
  The closure of the ordinary locus is the preimage of the ℚ_p-rational flags

  Statement: In |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}|: the preimage of Fl(ℚ_p) under |π_HT| is the closure of
  |𝒳*_{Γ(p^∞)}(0)| ∖ |𝒵_{Γ(p^∞)}(0)| (Lemma 3.3.6), the closure of a retrocompact open, i.e. its set
  of specialisations; and the preimage of Fl_{g+1,…,2g}(ℚ_p) is the closure of |𝒳*_{Γ(p^∞)}(0)_a| ∖
  |𝒵_{Γ(p^∞)}(0)_a| (Lemma 3.3.14). The compactified versions (Lemmas 3.3.19–3.3.20) need π_HT
  extended over the boundary and are part of siegel-main-theorem. Here Fl_{g+1,…,2g}(ℚ_p)
  parametrises the totally isotropic direct summands M ⊆ ℤ_p^{2g} with M ⊕ (ℤ_p^g ⊕ 0) = ℤ_p^{2g}.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/translates-cover-tower` (theorem)
  Finitely many GSp_2g(ℚ_p)-translates of a Hasse neighbourhood cover the tower

  Statement: (Lemma 3.3.8) For 0 < ε < 1 there is an open U ⊆ Fl containing Fl(ℚ_p) with
  |π_HT|⁻¹(U) ⊆ |𝒳*_{Γ(p^∞)}(ε)| ∖ |𝒵_{Γ(p^∞)}(ε)|. (Lemma 3.3.9) Every open U ⊆ Fl containing
  a ℚ_p-rational point satisfies GSp_2g(ℚ_p)·U = Fl. (Lemma 3.3.10) For 0 < ε < 1 there are
  γ_1, …, γ_k ∈ GSp_2g(ℚ_p) with |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| = ⋃_i γ_i·(|𝒳*_{Γ(p^∞)}(ε)| ∖
  |𝒵_{Γ(p^∞)}(ε)|). (Lemma 3.3.11) With the same γ_i, |𝒳*_{Γ(p^∞)}| = ⋃_i
  γ_i·|𝒳*_{Γ(p^∞)}(ε)|.

  Hypotheses:
  * Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈
  GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of
  ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
  * 0 < ε < 1.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space` (theorem)
  The minimally compactified Siegel tower at Γ(p^∞)-level is perfectoid

  Statement: There is a perfectoid space 𝒳*_{Γ(p^∞)} over ℚ_p^cycl with 𝒳*_{Γ(p^∞)} ~ lim_m
  𝒳*_{Γ(pᵐ)}, unique up to unique isomorphism; for every 0 < ε < 1/2, 𝒳*_{Γ(p^∞)}(ε) =
  GSp_2g(ℤ_p)·𝒳*_{Γ(p^∞)}(ε)_a and 𝒳*_{Γ(p^∞)} is covered by finitely many
  GSp_2g(ℚ_p)-translates of the affinoid perfectoid 𝒳*_{Γ(p^∞)}(ε)_a. Its boundary 𝒵_{Γ(p^∞)}
  carries the induced perfectoid structure. Over C (siegel-similitude-comparison): 𝒳*_{Γ(p^∞)}
  ×_{Spa ℚ_p} Spa C = 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p^cycl} Spa C⁰(ℤ_p^×, C) is a perfectoid
  representative (S0 perfectoid-representative) of the Siegel tower (S*_{K^pK′_p})_{K′_p ⊆
  GSp_2g(ℚ_p)} of S0 over C, all similitude components included (Γ(pᵐ) cofinal by S0 siegel-
  level-subgroups), and 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C is only its closed fixed-similitude fibre,
  generally not open.

  Hypotheses:
  * Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈
  GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of
  ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map` (construction)
  The Siegel Hodge–Tate period map as a map of adic spaces, extended over the boundary

  Statement: There is a unique map of adic spaces π_HT: 𝒳*_{Γ(p^∞)} ∖ 𝒵_{Γ(p^∞)} → Fl over ℚ_p
  realising the Hodge–Tate filtration functorially on perfectoid test spaces (and hence
  inducing |π_HT|) (Corollary 3.3.13). For every open U ⊆ Fl containing Fl(ℚ_p) there is ε > 0
  with 𝒳*_{Γ(p^∞)}(ε) ∖ 𝒵_{Γ(p^∞)}(ε) ⊆ π_HT⁻¹(U) (Lemma 3.3.15), and there is 0 < ε < 1/2
  with 𝒳*_{Γ(p^∞)}(ε)_a ∖ 𝒵_{Γ(p^∞)}(ε)_a ⊆ π_HT⁻¹(Fl_{g+1,…,2g}) (Lemma 3.3.16). π_HT extends
  uniquely to a GSp_2g(ℚ_p)-equivariant map of adic spaces π_HT: 𝒳*_{Γ(p^∞)} → Fl (Corollary
  3.3.17). The action convention: GSp_2g(ℚ_p) acts on 𝒳*_{Γ(p^∞)} on the right by x·γ: α ↦ γ⁻¹
  ∘ α (S0's right translations, transported by siegel-similitude-comparison; semilinear over
  ℚ_p^cycl), and equivariance means π_HT(x·γ) = γ⁻¹·π_HT(x) for the standard left action of
  GSp_2g(ℚ_p) on Fl, equivalently π_HT(x·γ) = π_HT(x)·γ for the right action W·γ := γ⁻¹W; the
  conventions of S3 (FL = P_μ\G, BP's x ↦ x⁻¹) are compared there.

  Hypotheses:
  * Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈
  GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of
  ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
  * The extension over the boundary rests on the goodness of the boundary triple (full-level-
  anticanonical-perfectoid) and on boundedness of the Plücker coordinates on the anticanonical
  neighbourhood.

  API:
  * `SiegelTorsion.htMap` (constructor): π_HT: 𝒳*_{Γ(p^∞)} → Fl, a map of adic spaces over
  ℚ_p.
  * `SiegelTorsion.htMap_top` (compatibility): The underlying continuous map on the complement
  of the boundary is |π_HT| of continuous-hodge-tate-map.
  * `SiegelTorsion.htMap_unique` (extensionality): Any two maps of adic spaces 𝒳*_{Γ(p^∞)} →
  Fl agreeing on the complement of the boundary are equal.
  * `SiegelTorsion.htMap_equivariant` (functoriality): π_HT(x·γ) = γ⁻¹·π_HT(x) for γ ∈
  GSp_2g(ℚ_p), i.e. π_HT ∘ T_γ = (W ↦ γ⁻¹W) ∘ π_HT, with x·γ: α ↦ γ⁻¹ ∘ α the right action of
  siegel-similitude-comparison.
  * `SiegelTorsion.htMap_anticanonical` (characterisation): For small ε > 0,
  π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆ Fl_{g+1,…,2g}.
  * `SiegelTorsion.htMap_neighbourhood` (characterisation): For every open U ⊇ Fl(ℚ_p) there
  is ε > 0 with 𝒳*_{Γ(p^∞)}(ε) ⊆ π_HT⁻¹(U) away from the boundary.

  Unit tests:
  * `htMap_g1_cusps_rational` (computation): For g = 1, the image of every cusp of 𝒳*_{Γ(p^∞)}
  is a point of ℙ¹(ℚ_p).
  * `htMap_anticanonical_chart` (computation): For g = 1 and small ε, π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆
  {|x| ≤ 1}-type chart Fl_{2} of ℙ¹ (the chart J = {2}).
  * `htMap_not_finite_level` (non-example): π_HT does not factor through any finite level
  𝒳*_{Γ(pᵐ)}: the fibres of 𝒳*_{Γ(p^∞)} → 𝒳*_{Γ(pᵐ)} (a map over ℚ_p^cycl) are orbits of Γ(pᵐ)
  ∩ Sp_2g(ℤ_p) (elements with c ≠ 1 move the structure map to Spa ℚ_p^cycl), on which π_HT is
  the nonconstant action W ↦ γ⁻¹W on flags.
  * `htMap_equivariant_center` (degenerate): Scalars z ∈ ℚ_p^× ⊆ GSp_2g(ℚ_p) act trivially on
  Fl, so π_HT is invariant under the central action.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/siegel-main-theorem` (theorem)
  Scholze's theorem for Siegel varieties: affinoid perfectoid flag charts and strongly Zariski
  closed boundary

  Statement: For every tame level K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N}
  for some N ≥ 3 prime to p, there is a perfectoid space 𝒳*_{Γ(p^∞),K^p} over ℚ_p^cycl, unique up to
  unique isomorphism, with 𝒳*_{Γ(p^∞),K^p} ~ lim_m 𝒳*_{Γ(pᵐ),K^p}, a GSp_2g(ℚ_p)-action which does
  not preserve the structure map to Spa(ℚ_p^cycl): γ acts on ℚ_p^cycl through the unit part u(γ) =
  c(γ)p^{−v_p(c(γ))} ∈ ℤ_p^× ≅ Gal(ℚ_p^cycl/ℚ_p) of its similitude factor, i.e. the Weil-pairing
  root of x·γ is the u(γ)-th power of that of x, so exactly the γ with c(γ) ∈ p^ℤ act
  ℚ_p^cycl-linearly (siegel-similitude-comparison (iii), which also identifies 𝒳*_{Γ(p^∞),K^p}
  ×_{Spa ℚ_p} Spa C with a perfectoid representative of the S0 Siegel tower over C, compatibly with
  the actions), and a GSp_2g(ℚ_p)-equivariant map of adic spaces π_HT: 𝒳*_{Γ(p^∞),K^p} → Fl over
  ℚ_p. (i) For every J ⊆ {1, …, 2g} containing exactly one of i and g + i for each i (so that the
  coordinate g-plane indexed by J is Lagrangian; these 2^g sets give affinoids Fl_J covering Fl),
  the preimage 𝒱_J = π_HT⁻¹(Fl_J) = Spa(R_{J,∞}, R_{J,∞}⁺) is affinoid perfectoid, is the preimage
  of an affinoid 𝒱_{J,m} = Spa(R_{J,m}, R_{J,m}⁺) ⊆ 𝒳*_{Γ(pᵐ),K^p} for all large m, and R_{J,∞}⁺ is
  the p-adic completion of colim_m R_{J,m}⁺. (ii) 𝒵_{Γ(p^∞),K^p} ∩ 𝒱_J ⊆ 𝒱_J is strongly Zariski
  closed. (iii) π_HT⁻¹(Fl(ℚ_p)) is the closure of 𝒳*_{Γ(p^∞),K^p}(0) and π_HT⁻¹(Fl_{g+1,…,2g}(ℚ_p))
  is the closure of 𝒳*_{Γ(p^∞),K^p}(0)_a (Lemmas 3.3.19–3.3.20, the compactified versions of
  rational-flags-preimage). The published statement of (i) quantifies over all J of cardinality g;
  for non-Lagrangian J, Fl_J is not of the required form and the proof does not apply
  (PerfectoidShimuraVarieties/E2, after PAPER-SCHOLZE-15/E16).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/perfectoid-toroidal-siegel-tower` (theorem)
  The toroidally compactified Siegel tower with fixed cone decomposition is perfectoid

  Statement: Let K^p be neat (contained in a level-N subgroup, N ≥ 3 prime to p), K_p ⊆ GSp_2g(ℚ_p)
  compact open and Σ a K^pK_p-admissible smooth projective cone decomposition. Then the toroidal
  tower (S^tor_{K^pK'_p,Σ})_{K'_p ⊆ K_p}, formed with the same Σ at every level (S0.general
  toroidal-tower-diamond), has a perfectoid representative S^tor_{K^p,Σ} ~ lim_{K'_p}
  S^tor_{K^pK'_p,Σ} (Pilloni–Stroh, Théorème 0.4 and Corollaire A.19, for K_p = Γ(p^{n₀}) and
  principal levels Γ(pⁿ); cofinality gives all K'_p), and S_{K^p} = S^tor_{K^p,Σ} minus its boundary
  is the open perfectoid Siegel tower. The perfectoid space is constructed as the generic fibre
  X(p^∞)^{tor−mod} of the limit of modified formal toroidal models; its comparison with the generic
  fibre of the limit of the unmodified formal toroidal models is not asserted (Pilloni–Stroh,
  Remarque A.13).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients` (construction)
  The open perfectoid Siegel tower, its right action and its finite-level quotients

  Statement: Let 𝒳_{Γ(p^∞),K^p} := 𝒳*_{Γ(p^∞),K^p} ∖ 𝒵_{Γ(p^∞),K^p}, the open perfectoid
  Siegel tower over ℚ_p^cycl with fixed similitude system (the complement of the boundary, not
  the good-reduction locus 𝒳_{K_p} of siegel-finite-level-spaces), with the right action of
  GSp_2g(ℚ_p) of siegel-main-theorem, semilinear over ℚ_p^cycl through u(γ) =
  c(γ)p^{−v_p(c(γ))}. For a compact open K ⊆ GSp_2g(ℤ_p) with c(K) = U_m containing some Γ(pⁿ)
  (in particular the strict Iwahori level K_{Iw⁺} := {γ ∈ GSp_2g(ℤ_p) : γ mod p lies in the
  diagonal torus T(𝔽_p) and c(γ) ≡ 1 mod p}, the inverse image of the full diagonal torus
  modulo p with similitude 1), let 𝒳^{an}_{K,K^p} := 𝒳*_K ∖ 𝒵_K (the open Siegel variety at
  level KK^p over ℚ_p^cycl with fixed Weil-pairing root ζ_{pᵐ}, siegel-finite-level-spaces)
  and K¹ := K ∩ ker c. An element k ∈ K with c(k) ≠ 1 does not act ℚ_p^cycl-linearly (Scholze,
  footnote 7), so the projection is not a K-torsor over ℚ_p^cycl: for n ≥ m with Γ(pⁿ) ⊆ K the
  finite-level maps 𝒳^{an}_{Γ(pⁿ),K^p} → 𝒳^{an}_{K,K^p} are finite étale Galois with group (K
  ∩ c⁻¹(1 + pⁿℤ_p))/Γ(pⁿ), and 𝒳_{Γ(p^∞),K^p} → 𝒳^{an}_{K,K^p} is a pro-étale K¹-torsor;
  𝒳^{an}_{K,K^p} is the quotient 𝒳_{Γ(p^∞),K^p}/K¹ in the sense that its diamond is the
  v-sheaf quotient of the diamond of the tower by K¹. After base change along Spa C → Spa ℚ_p
  it becomes a K-torsor: ((𝒳_{Γ(p^∞),K^p}) ×_{Spa ℚ_p} Spa C)^◇ ≅ S^◇_{K^p,∞} → S^◇_{K^pK} is
  a pro-étale K-torsor (S0 tower-action-kernel (iii); its kernel Z(ℚ) ∩ K^pK is trivial
  because N ≥ 3; siegel-similitude-comparison), and its restriction to the closed fixed-
  similitude fibre, generally not open, 𝒳_{Γ(p^∞),K^p} ⊗̂_{ℚ_p^cycl} C is the K¹-torsor over
  𝒳^{an}_{K,K^p} ⊗_{ℚ_p^cycl} C. The strict Iwahori quotient is defined group-theoretically
  through K_{Iw⁺}, not by choosing g subgroups of order p (which does not determine it:
  OverconvergentAutomorphicForms sourceIssue E-O8-1).

  Hypotheses:
  * Siegel setting of Scholze §3: g ≥ 1, p prime, K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈
  GSp_2g(Ẑ^p) : γ ≡ 1 mod N} for some N ≥ 3 prime to p; ℚ_p^cycl the completion of
  ℚ_p(μ_{p^∞}) with ring of integers ℤ_p^cycl; p^ε ∈ ℤ_p^cycl a chosen element of valuation ε.
  * K contains some Γ(pⁿ) and has c(K) = U_m, so that the level-K space lives over ℚ(ζ_{pᵐ})
  and is base changed to ℚ_p^cycl along the fixed ζ_{pᵐ}.
  * Here U_0 = ℤ_p^× and U_m = ker(ℤ_p^× → (ℤ/pᵐ)^×) = 1 + pᵐℤ_p for m ≥ 1. The formula 1 +
  ℤ_p is not used as a unit subgroup.

  API:
  * `SiegelTorsion.openTower` (data): 𝒳_{Γ(p^∞),K^p} = 𝒳*_{Γ(p^∞),K^p} ∖ 𝒵_{Γ(p^∞),K^p}.
  * `SiegelTorsion.strictIwahori` (constructor): K_{Iw⁺} as the inverse image of the diagonal
  torus (with similitude 1) modulo p.
  * `SiegelTorsion.openTower_torsor` (characterisation): 𝒳_{Γ(p^∞),K^p} → 𝒳_{K,K^p} is a pro-
  étale K¹-torsor, K¹ = K ∩ ker c, for K ⊇ Γ(pⁿ) with c(K) = U_m; after ×_{Spa ℚ_p} Spa C the
  corresponding map S^◇_{K^p,∞} → S^◇_{K^pK} of the S0 tower is a K-torsor.
  * `SiegelTorsion.openTower_quotient` (equivalence): (𝒳_{Γ(p^∞),K^p})^◇/K¹ ≅ 𝒳_{K,K^p}^◇.
  * `SiegelTorsion.openTower_action` (instance): The right action of GSp_2g(ℚ_p), semilinear
  over ℚ_p^cycl through u(γ); its restriction to K¹ is ℚ_p^cycl-linear and is the action of
  the deck group of the torsor.

  Unit tests:
  * `strictIwahori_quotient_g1` (computation): For g = 1, K_{Iw⁺}/Γ(p) ≅ 𝔽_p^× via diag(a,
  a⁻¹) ↦ a.
  * `strictIwahori_not_subgroups` (non-example): For g = 2, prescribing two order-p subgroups
  (the coordinate lines of the first two basis vectors modulo p) defines a level containing
  non-diagonal unipotent elements modulo p, strictly larger than K_{Iw⁺}: the group-theoretic
  definition is required.
  * `openTower_trivial_quotient` (degenerate): For K = Γ(pⁿ), K¹ = Γ(pⁿ) ∩ Sp_2g(ℤ_p) and
  𝒳_{Γ(p^∞)} → 𝒳_{Γ(pⁿ)} is a pro-étale (Γ(pⁿ) ∩ Sp_2g(ℤ_p))-torsor, not a Γ(pⁿ)-torsor over
  ℚ_p^cycl: diag(1_g, (1 + pⁿ)·1_g) ∈ Γ(pⁿ) raises Weil-pairing roots to the power 1 + pⁿ and
  so covers the nontrivial automorphism σ_{1+pⁿ} of ℚ_p^cycl.
  * `openTower_kernel_trivial` (compatibility): After base change to C, K acts freely on
  S^◇_{K^p,∞}: the kernel computed by PerfectoidShimuraVarieties:S0/tower-action-kernel is
  trivial for N ≥ 3; hence K¹ acts freely on 𝒳_{Γ(p^∞),K^p}.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/elliptic-cusps-at-infinite-level` (theorem)
  The perfectoid modular curve at the cusps: Tate-curve parameter spaces at infinite level

  Statement: Let g = 1, N ≥ 3 prime to p, X* the compactified modular curve over a perfectoid
  K ⊇ ℚ_p(μ_{p^∞}) of tame level Γ^p with Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N), and x a cusp of X* with
  field L_x and width e_x, with its analytic Tate-curve parameter space D_x ↪ X* (the open
  disc |q| < 1 with the cusp at q = 0; Heuer Lemma 2.9). Let D_{∞,x} be the open subspace |q|
  < 1 of Spa(L_x⟨q^{1/p^∞}⟩, 𝒪_{L_x}⟨q^{1/p^∞}⟩), a perfectoid tilde-limit of the discs
  D_{n,x} with coordinate q^{1/pⁿ}, with 𝒪⁺(D_∞) = 𝒪_L[[q^{1/p^∞}]] (completed). Here Γ₀(p^∞),
  the Γ₁- and Γ-levels and 𝒳*_{Γ(p^∞)}, 𝒳*_{Γ₁(p^∞)}(ε)_a are Heuer's GL_2 objects over K,
  with classical level groups and the Weil pairing unrestricted (Heuer Definition 2.7: Γ₀(pᵐ)
  = {(∗ ∗; c ∗) ∈ GL_2(ℤ_p) : c ≡ 0 mod pᵐ}, so Γ₀(p^∞) is the group of all upper triangular
  matrices, not S0's {(a b; 0 a⁻¹)}). Heuer's 𝒳*_{Γ(p^∞)} is 𝒳*^{S1}_{Γ(p^∞)} ×_{Spa ℚ_p} Spa
  K for S1's fixed-similitude space 𝒳*^{S1}_{Γ(p^∞)} (siegel-similitude-comparison (ii) with L
  = K), a profinite family indexed by a ∈ ℤ_p^× of the closed fibres with Weil-pairing root
  ζ^a, rather than a coproduct of open fibres, and 𝒳*^{S1}_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} K is its
  part a = 1; at the Γ₀- and Γ₁-levels Heuer's spaces are the base changes to K of S1's (the
  determinant condition being absorbed by the fixed ζ_{pⁿ}). Heuer's GL_2(ℤ_p)-action is the
  left action γ·x = x·γ^∨, γ^∨ = det(γ)γ⁻¹, i.e. S0's right action by γ^∨ (Heuer §2.7); it
  multiplies the Weil-pairing root by c(γ^∨) = det γ. Then: (1) there is a Cartesian tower
  Γ₀(p^∞) × D_{∞,x} → ℤ_p^× × D_{∞,x} → D_{∞,x} → D_x over 𝒳*_{Γ(p^∞)}(ε)_a →
  𝒳*_{Γ₁(p^∞)}(ε)_a → 𝒳*_{Γ₀(p^∞)}(ε)_a → 𝒳*(ε), with Γ₀(p^∞) = upper triangular matrices in
  GL_2(ℤ_p) (as a profinite perfectoid space), the top-left map sending (a b; 0 d) to d; the
  cusp obtained by specialising at (a b; 0 d) corresponds to the basis (q^{d/p^∞}, ζ_{p^∞}^a
  q^{−b/p^∞}) of T_pT(q); (2) with the right action of ℤ_p on GL_2(ℤ_p) × D_{∞,x}, (γ,
  q^{1/pⁿ})·h = (γ(1 0; h 1), q^{1/pⁿ}ζ_{pⁿ}^{h/e_x}), the quotient (GL_2(ℤ_p) × D_{∞,x})/ℤ_p
  exists as a perfectoid space and there is a Cartesian square with D_x → X* whose left map
  (GL_2(ℤ_p) × D_{∞,x})/ℤ_p → 𝒳*_{Γ(p^∞)} (Heuer's) is an open immersion, equivariant for left
  multiplication on the first factor and γ·x = x·γ^∨; the point (γ, q) has Weil-pairing root
  ζ^{det γ} (for the normalisation e(α⁻¹e_1, α⁻¹e_2) = ζ of Heuer Lemma 2.25), so the
  restriction (SL_2(ℤ_p) × D_{∞,x})/ℤ_p → 𝒳*^{S1}_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} K is an
  SL_2(ℤ_p)-equivariant open immersion into S1's space, SL_2(ℤ_p) acting there by x ↦ x·γ⁻¹;
  (3) π_HT restricts to the locally constant map (γ = (a b; c d), q) ↦ (b : d) ∈ ℙ¹(ℤ_p). This
  is the local perfectoid q-disc construction at elliptic cusps that the Siegel argument
  (Hartogs, codimension ≥ 2) does not provide for g = 1.

  Hypotheses:
  * g = 1; K contains all p-power roots of unity, with a fixed compatible system ζ_{pⁿ}; 0 ≤ ε
  small as in S1.
  * Scholze leaves the g = 1 compactified case 'to the reader'; Heuer's paper supplies it with
  elementary means instead of the Hebbarkeitssatz.
-/


/-! ## Contracts for layer S2 -/


/- CONTRACT `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison` (construction)
  The symplectic embedding and the comparison of finite levels with their Siegel images

  Statement: Let (G, X) be of Hodge type with a fixed embedding ι: (G, X) ↪ (G′, X′) =
  (GSp_2g, H_g^±) and reflex field E. For compact open K ⊆ G(𝔸_f) and K′ ⊆ G′(𝔸_f) with K = K′
  ∩ G(𝔸_f), ι induces finite morphisms Sh_K(G, X) → Sh_{K′}(G′, X′) ⊗_ℚ E and Sh*_K(G, X) →
  Sh*_{K′}(G′, X′) ⊗_ℚ E of canonical models and of their minimal compactifications over E,
  compatible with level maps and right translations; for every K there is such a K′ (chosen
  sufficiently small among compact open neighbourhoods of K in G′(𝔸_f); an arbitrary identity
  neighbourhood need not contain the fixed K) for which Sh_K → Sh_{K′} ⊗ E is a closed
  immersion (Deligne, Travaux de Shimura, Proposition 1.15, descended to E by the canonical-
  model property), and then the boundary of the image of Sh*_K is the intersection of the
  image with the boundary of Sh*_{K′} (the extended map preserves interiors and boundaries).
  The tame-level hypothesis of Scholze (K^p inside the level-N subgroup of G′(𝔸_f^p), N ≥ 3
  prime to p) is a choice of such K′^p.

  Hypotheses:
  * (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a
  closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all;
  Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not
  used for statements.
  * The finiteness of the extension of ι to minimal compactifications and the boundary
  compatibility are not proved in Scholze (§4.1) or Hansen–Johansson (p. 34); they are
  requested from ShimuraVarieties V8 (extension of datum morphisms to minimal
  compactifications), whose node minimal-map-extension states finiteness only for level maps.

  API:
  * `HodgeTower.embedding` (data): The fixed embedding ι: (G, X) ↪ (GSp_2g, H_g^±).
  * `HodgeTower.toSiegel` (constructor): The finite map Sh*_K(G, X) → Sh*_{K′}(G′, X′) ⊗ E for
  K = K′ ∩ G(𝔸_f).
  * `HodgeTower.toSiegel_isClosedImmersion` (characterisation): On open parts, a closed
  immersion for all sufficiently small K′ with K = K′ ∩ G(𝔸_f).
  * `HodgeTower.toSiegel_boundary` (characterisation): The preimage of the Siegel boundary is
  the boundary of Sh*_K.
  * `HodgeTower.toSiegel_comp` (functoriality): Compatibility with level maps and right
  translations by G(𝔸_f) ⊆ G′(𝔸_f).
  * `HodgeTower.toSiegel_finite` (characterisation): The map of minimal compactifications is
  finite.

  Unit tests:
  * `toSiegel_identity` (degenerate): For ι = id on the Siegel datum, toSiegel is the identity
  at every level.
  * `toSiegel_hilbert` (computation): For F real quadratic and the trace embedding, the image
  of the Hilbert modular surface in the Siegel threefold is the Humbert surface of
  discriminant d_F.
  * `toSiegel_not_closed_large_level` (non-example): For K′ = GSp_4(Ẑ)-type maximal level, the
  map from the Hilbert modular surface is generically 2 : 1 onto its image (the Galois
  involution of F/ℚ), so the closed-immersion statement needs K′ small.
  * `toSiegel_points` (compatibility): On ℂ-points the map is [x, a] ↦ [ι(x), ι(a)] between
  the double-coset descriptions of ShimuraVarieties:V1/analytic-points.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/image-compactification` (construction)
  Scholze's image compactification and its relation to the minimal compactification

  Statement: In the situation of hodge-type-embedding-and-siegel-comparison, for K ⊆ G(𝔸_f) the
  image compactification X^{*̲}_K is the universal finite target over which Sh*_K → Sh*_{K′} ⊗ E
  factors for all K′ with K = K′ ∩ G(𝔸_f): the scheme-theoretic image of Sh*_K in Sh*_{K′} ⊗ E for
  every sufficiently small such K′ (the images stabilise because the subalgebras of the pushforward
  of 𝒪 form an increasing chain of coherent subalgebras). The tower (X^{*̲}_K)_K carries the right
  action of G(𝔸_f). The finite map Sh*_K → X^{*̲}_K is an isomorphism over the open Shimura variety,
  and Sh*_K is the normalisation of X^{*̲}_K (Sh*_K is normal and the map is finite and birational).
  The boundary of X^{*̲}_K is the preimage of the Siegel boundary. Whether Sh*_K → X^{*̲}_K is an
  isomorphism is not known in general (Scholze, §4.1): X^{*̲} is an auxiliary compactification,
  distinct from the canonical minimal one.

  API:
  * `HodgeTower.imageCompactification` (data): The tower K ↦ X^{*̲}_K with its right G(𝔸_f)-action.
  * `HodgeTower.minToImage` (constructor): The finite map Sh*_K → X^{*̲}_K, compatible in K.
  * `HodgeTower.minToImage_isNormalization` (characterisation): Sh*_K is the normalisation of
      X^{*̲}_K.
  * `HodgeTower.minToImage_iso_open` (characterisation): The map is an isomorphism over Sh_K.
  * `HodgeTower.imageCompactification_boundary` (characterisation): The boundary of X^{*̲}_K is its
      intersection with the Siegel boundary.
  * `HodgeTower.imageCompactification_stable` (other): X^{*̲}_K is the scheme-theoretic image in
      Sh*_{K′} ⊗ E for all sufficiently small K′ with K = K′ ∩ G(𝔸_f).

  Unit tests:
  * `imageCompactification_siegel` (degenerate): For ι = id, X^{*̲}_K = Sh*_K and minToImage is the
      identity.
  * `imageCompactification_curve` (computation): For a compact Shimura curve (no boundary)
      minToImage: Sh*_K = Sh_K → X^{*̲}_K is an isomorphism, and for the modular curve with ι = id
      it is the identity of the modular curve's minimal compactification.
  * `imageCompactification_not_normal` (non-example): The image of a normal projective variety under
      a finite birational map need not be normal (the cuspidal cubic is the image of ℙ¹), so
      X^{*̲}_K is not asserted to be normal and is not identified with Sh*_K.
  * `imageCompactification_open_compat` (compatibility): Restricted to the open Shimura variety,
      X^{*̲}_K is Sh_K, the S0 tower at level K.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower` (theorem)
  The open Hodge-type tower is perfectoid

  Statement: Let (G, X) be of Hodge type with the embedding ι, and let K^p ⊆ G(𝔸_f^p) be contained
  in K′^p ∩ G(𝔸_f^p) for K′^p ⊆ GSp_2g(𝔸_f^p) inside a level-N subgroup with N ≥ 3 prime to p, small
  enough that the finite levels embed (Caraiani–Scholze's 'sufficiently small'). Then the open tower
  (S_{K^pK_p})_{K_p} of S0, base changed to C, has a perfectoid representative S_{K^p} ~ lim_{K_p}
  S_{K^pK_p} (S0 perfectoid-representative), Zariski closed in the open perfectoid Siegel tower;
  equivalently S^◇_{K^p,∞} is representable by a perfectoid space. Remark: Caraiani–Scholze's
  Theorem 2.1.2 states the open tower over E_𝔭 (a perfectoid space mapping to Spa E_𝔭); that form is
  not asserted here, since S1 supplies the Siegel tower only over ℚ_p^cycl and C.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower` (theorem)
  Scholze's Hodge-type theorem for the image compactification

  Statement: In the situation of hodge-open-perfectoid-tower (K^p contained in the level-N subgroup
  of G′ for some N ≥ 3 prime to p), there is a perfectoid space 𝒳^{*̲}_{K^p} over C with
  𝒳^{*̲}_{K^p} ~ lim_{K_p} 𝒳^{*̲}_{K_pK^p}. (i) For every Lagrangian coordinate subset J ⊆ {1, …,
  2g}, the preimage 𝒱_J of the Siegel chart 𝒴*_{K′^p}(J) = π_HT^{Siegel,−1}(Fl_J) is affinoid
  perfectoid, 𝒱_J = Spa(R_{J,∞}, R_{J,∞}⁺), it is the preimage of an affinoid 𝒱_{J,K_p} ⊆
  𝒳^{*̲}_{K_pK^p} for all sufficiently small K_p, and R_{J,∞}⁺ is the p-adic completion of
  colim_{K_p} R_{J,K_p}⁺. (ii) The boundary 𝒵_{K^p} ⊆ 𝒳^{*̲}_{K^p} satisfies: 𝒵_{K^p} ∩ 𝒱_J ⊆ 𝒱_J is
  strongly Zariski closed. The structure sheaf is that of the perfectoidization of the Zariski
  closed loci (PerfectoidSpaces:P8/closed-loci-in-towers), not the restriction of the Siegel
  structure sheaf: the tower is not merely a closed subset of the perfectoid Siegel space.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/siegel-tame-level-removal` (lemma)
  The Siegel minimal tower is perfectoid at every tame level

  Statement: For every compact open K^p ⊆ GSp_2g(𝔸_f^p) (no condition at N), the minimally
  compactified Siegel tower lim_{K_p} 𝒮*^◇_{K^pK_p} over C (the S0 p-level tower of the Siegel
  datum) is a perfectoid space, covered by finitely many GSp_2g(ℚ_p)-translates of affinoid
  perfectoid subsets 𝒮*_{K^p}(ε)_a ⊆ 𝒮*_{K^p}(ε′)_a (0 < ε < ε′ < 1/2) with the closure of the first
  contained in the second, each pulled back from a finite level.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower` (theorem)
  The genuine minimally compactified Hodge-type tower is perfectoid and a good tower

  Statement: Let (G, X) be of Hodge type with reflex field E, Sh*_K(G, X) the canonical normal
  projective minimal compactification over E (ShimuraVarieties:V8/minimal-descent), C and the
  embedding σ: E → C as in S0 p-level-tower (σ factors through the completion E_𝔭 at the place 𝔭 | p
  it induces), and 𝒳*_K := S*_K = (Sh*_K(G, X) ⊗_{E,σ} C)^{ad} the S0 minimally compactified tower
  over C. For any compact open K^p ⊆ G(𝔸_f^p): (a) 𝒳*_{K^p} := lim_{K_p} 𝒳*^◇_{K^pK_p} =
  S^{*◇}_{K^p,∞} is a perfectoid space; (c) it is analytically separated; (d) it has two coverings
  by finitely many open affinoid perfectoids U_i ⊆ V_i with the closure of U_i in V_i, each pulled
  back from an open affinoid of some 𝒳*_{K^pK_p}; (e) hence for every cofinal system of K_p ⊆
  G(ℚ_p), (𝒳*_{K^pK_p})_{K_p} is a good tower over C (PerfectoidSpaces:P8/good-tower). The
  identification with the diamond limit is the only limit statement: whether 𝒳*_{K^p} ~ lim
  𝒳*_{K^pK_p} in the sense of Scholze–Weinstein is not known (Boxer–Pilloni §4.4.27). The Hodge–Tate
  period map on this tower is S3's (hodge-compactified-period-maps), not part of this theorem.
  Remark: Hansen–Johansson's Proposition 5.14 states (a)–(e) for the rigid spaces over E_𝔭 ('good
  tower (over E_p)'); that form is not asserted here, because its proof needs a perfectoid Siegel
  target over E_𝔭, and the Siegel input (siegel-tame-level-removal, from S1 over ℚ_p^cycl and C)
  supplies one only over C; descent from C to E_𝔭 is a separate theorem (S0 p-level-tower).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/hodge-good-tower-arbitrary-level` (theorem)
  Good towers at arbitrary (non-product) levels

  Statement: For (G, X) of Hodge type, any compact open K ⊆ G(𝔸_f) (not necessarily of the form
  K^pK_p) and any cofinal system of compact open K_p ⊆ G(ℚ_p), the tower (𝒳*_{K∩K_p})_{K_p} of S0
  minimal compactifications over C (through σ: E → C) is a good tower over C, where H ∩ K_p := {h ∈
  H : h_p ∈ K_p} = H ∩ (G(𝔸_f^p)K_p).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/good-tower-base-change` (lemma)
  Good towers are stable under extension of the base field

  Statement: Let K ⊆ L be nonarchimedean fields with L complete (for instance E_𝔭 ⊆ C), and (X_i) a
  good tower over K (PerfectoidSpaces:P8/good-tower). Then (X_i ⊗_K L) is a good tower over L, with
  limit (lim X_i^◇) ×_{Spd K} Spd L; affinoid perfectoid covers pulled back from finite level, and
  the closure relation Ū_j ⊆ V_j, pass to the base change.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/genuine-to-image-comparison` (comparison)
  Comparison of the genuine and image-compactified Hodge-type towers

  Statement: For (G, X) of Hodge type and K^p as in hodge-image-compactified-tower, the finite
  maps Sh*_K → X^{*̲}_K of image-compactification induce a G(ℚ_p)-equivariant quasicompact map
  𝒳*_{K^p} → 𝒳^{*̲}_{K^p} of perfectoid spaces over C, which is an isomorphism over the open
  tower S_{K^p} (hodge-open-perfectoid-tower) and maps boundary to boundary. Whether it is an
  isomorphism is not known in general and is not asserted.

  Hypotheses:
  * (G, X) a Shimura datum of Hodge type in Deligne's setup (ShimuraData:D4/hodge-type): a
  closed embedding ι: (G, X) ↪ (GSp_2g, H_g^±) into a Siegel datum, fixed once and for all;
  Scholze's (G, D) ↪ (Sp_2g, D) setup is the restriction to a connected component and is not
  used for statements.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/embedding-independence` (theorem)
  Independence of the symplectic embedding

  Statement: The open perfectoid tower S_{K^p} and the genuine minimally compactified perfectoid
  tower 𝒳*_{K^p} of a Hodge-type datum, with their G(ℚ_p)-actions and their maps to the finite
  levels, do not depend on the symplectic embedding ι: for two embeddings the representatives are
  canonically isomorphic, compatibly with the cones, because both represent the diamond lim_{K_p}
  S^◇_{K^pK_p} (resp. lim 𝒳*^◇_{K^pK_p}) built from the canonical models, which do not involve ι. No
  such statement is made for the image compactification 𝒳^{*̲}_{K^p}, which depends on ι a priori.
-/


/-! ## Contracts for layer S3 -/


/- CONTRACT `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety` (construction)
  The flag variety FL_{G,μ} = P_μ\G with its right action and the Levi torsor over it

  Statement: Let G be a reductive group over a field F of characteristic 0 (or a p-adic field)
  with a cocharacter μ defined over F. The Hodge–Tate flag variety is FL_{G,μ} := P_μ\G, with
  G acting by right translation; its analytification over a p-adic field is FL^{an}. The
  quotient U_{P_μ}\G → P_μ\G is a right M_μ-torsor (M_μ acting through P_μ/U_{P_μ} ≅ M_μ by
  left multiplication twisted to a right action m·(U x) = U m⁻¹ x), G-equivariant for right
  translation. Dictionary: Scholze's and Caraiani–Scholze's flag variety G/P_μ with left
  G-action is identified with P_μ\G by gP_μ ↦ P_μ g⁻¹. For the Siegel datum the cocharacter is
  pinned as μ(t) = diag(1_g, t·1_g) (BP26 §3.1), so Ad μ(t)(A B; C D) = (A t⁻¹B; tC D) and P_μ
  = {(A B; C D) : B = 0} = Stab⟨e_{g+1}, …, e_{2g}⟩, the opposite of the Hodge parabolic
  P_μ^std = Stab⟨e_1, …, e_g⟩ = {C = 0}; P_μ·x ↦ (the row space of the top g rows of x)
  identifies P_μ\GSp_2g with the Lagrangian Grassmannian of row spaces, with right action by
  right multiplication. BP26's convention is π_HT(A, Ψ) = P_μ·g(Ψ)⁻¹ where Ψ(g(Ψ)⟨e_{g+1}, …,
  e_{2g}⟩) = Lie A(1), and Scholze's Fl (Lagrangian subspaces W ⊆ ℚ_p^{2g}) corresponds to W =
  g(Ψ)⟨e_{g+1}, …, e_{2g}⟩, whose annihilator W^⊥ for the pairing of row with column vectors
  is the row space of the top g rows of g(Ψ)⁻¹; this is well defined on P_μ\G exactly because
  P_μ stabilises ⟨e_{g+1}, …, e_{2g}⟩. The universal P_μ-torsor over FL is G → FL, x ↦ P_μ x
  (a right P_μ-torsor after x ↦ x⁻¹), and G-equivariant vector bundles on FL attached to P_μ-
  representations V are G ×^{P_μ} V; for representations inflated from M_μ they are the
  bundles associated with U_{P_μ}\G.

  Hypotheses:
  * G reductive, μ a cocharacter defined over the base; the Bruhat decomposition and Schubert
  cells are ShimuraData:D3/bruhat-integral.
  * No AutomorphicBundles node states the M_μ-torsor structure of U_{P_μ}\G over the
  Hodge–Tate flag variety; AutomorphicBundles:B0/homogeneous-hodge-torsor treats the Hodge
  side G/P^std.

  API:
  * `HodgeTate.FL` (data): FL_{G,μ} = P_μ\G with the right G-action.
  * `HodgeTate.leviTorsor` (constructor): U_{P_μ}\G → FL as a G-equivariant right M_μ-torsor.
  * `HodgeTate.FL_equivLeftFlag` (equivalence): G/P_μ ≅ P_μ\G, gP_μ ↦ P_μg⁻¹, exchanging left
  and right actions.
  * `HodgeTate.associatedBundle` (constructor): For a P_μ-representation V, the G-equivariant
  bundle G ×^{P_μ} V on FL; for V inflated from M_μ it is leviTorsor ×^{M_μ} V.
  * `HodgeTate.associatedBundle_tensor` (structure): The associated-bundle functor is exact
  and tensor.
  * `HodgeTate.FL_siegel` (compatibility): For GSp_2g with μ(t) = diag(1_g, t·1_g): P_μ = {B =
  0} = Stab⟨e_{g+1}, …, e_{2g}⟩, FL is the Lagrangian Grassmannian through P_μ·x ↦ the row
  space of the top g rows of x, and Scholze's Fl corresponds by W = g⟨e_{g+1}, …, e_{2g}⟩ ↔
  P_μ·g⁻¹, W^⊥ being the row space of the top g rows of g⁻¹.

  Unit tests:
  * `FL_gl2_P1` (computation): For GL_2 and μ(t) = diag(1, t), P_μ is lower triangular and
  FL_{G,μ} ≅ ℙ¹ by P_μ·x ↦ the line of the first row of x; the chart point P_μ·(1 z; 0 1)
  corresponds to the row (1, z), and g = (a b; c d) acts on the right by z ↦ (b + dz)/(a +
  cz), since (1, z)g = (a + cz)(1, (b + dz)/(a + cz)); this is the g = 1 case of siegel-graph-
  chart-and-frame.
  * `FL_parabolic_pinned` (non-example): For GL_2 and μ(t) = diag(t, 1) the limit parabolic is
  upper triangular, and P·x ↦ the line of the first row of x is not well defined on P\GL_2: (1
  1; 0 1) ∈ P, so P·(1 1; 0 1) = P·1, but the first rows (1, 1) and (1, 0) span different
  lines. The pinned μ(t) = diag(1, t) is needed for the row-space dictionary.
  * `FL_trivial_mu` (degenerate): For a central cocharacter, U_P = 1 and M_μ = G; the Levi
  torsor is G → point.
  * `FL_left_right_inverse` (non-example): The identity map G/P_μ → P_μ\G does not exist
  (different quotients); using gP ↦ Pg instead of Pg⁻¹ is not equivariant: it turns the left
  action into a right action of the opposite group.
  * `FL_compact_dual` (compatibility): Over ℂ, FL_{G,μ} is the compact dual of
  ShimuraData:D3/compact-dual after inversion and passage from the Hodge to the opposite
  parabolic.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/siegel-period-map-properties` (theorem)
  The Siegel period map: tame level, prime-to-p Hecke operators and the right-action normalisation

  Statement: Let π_HT: 𝒳*_{Γ(p^∞),K^p} → Fl be the Siegel Hodge–Tate period map of S1. (iii) For
  (K^p)′ ⊆ K^p (both inside level-N subgroups, N ≥ 3 prime to p), π_HT on 𝒳*_{Γ(p^∞),(K^p)′} is the
  composite of the projection to 𝒳*_{Γ(p^∞),K^p} with π_HT. (iv) For γ ∈ GSp_2g(𝔸_f^p) with γ⁻¹K^pγ
  inside such a subgroup, π_HT ∘ γ = π_HT: prime-to-p Hecke operators act trivially on Fl. In BP's
  convention FL = P\GSp_2g with π_HT(A, Ψ) = P·g(Ψ)⁻¹, π_HT((A, Ψ)f) = π_HT((A, Ψ))·f for f ∈
  GSp_2g(ℚ_p), the right action (A, Ψ)f = (A, Ψ ∘ f) on the tower.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/siegel-tautological-pullback` (theorem)
  Siegel case: the tautological bundles pull back to Lie A and ω

  Statement: Let W ⊆ 𝒪_Fl^{2g} be the universal totally isotropic subbundle and ω_Fl = (∧^g
  W)^∨. (v) Over the open perfectoid Siegel tower 𝒳_{Γ(p^∞),K^p} there is a natural
  GSp_2g(ℚ_p)-equivariant isomorphism Lie A ⊗ 𝒪(1) ≅ π_HT^*W, equivalently π_HT^*(𝒪^{2g}/W) ≅
  ω_{A^∨} through the Hodge–Tate map (the canonical, twist-free form), and π_HT^*W^∨ ≅
  ω_A(−1); Scholze states Lie A ≅ π_HT^*W after suppressing Tate twists over ℚ_p^cycl, i.e.
  after trivialising ℤ_p(1) by the fixed compatible system ζ_{p^∞}, a trivialisation that
  GSp_2g(ℚ_p) moves through the similitude character. (vi) Over the whole minimally
  compactified tower 𝒳*_{Γ(p^∞),K^p}, with ω the Hodge line bundle pulled back from finite
  level, there is a natural GSp_2g(ℚ_p)-equivariant isomorphism π_HT^*ω_Fl ≅ ω(−g), extending
  the dual top exterior power of (v); both isomorphisms are compatible with change of tame
  level and prime-to-p Hecke operators.

  Hypotheses:
  * Siegel datum, K^p as in S1.
  * Fargues' bound (Fargues–Genestier–Lafforgue, Théorème II.1.1) is proved only for p ≠ 2;
  for p = 2 the integral bound of (vi) comes from the induction on g.
  * The determinant of π_HT^*W^∨ ≅ ω_A(−1) is ω(−g). A choice of ζ trivializes the Tate line
  and yields an untwisted underlying-bundle identification; equivariance of that untwisted
  form requires transporting the linearization, since the action on ζ is through the
  similitude character.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/siegel-graph-chart-and-frame` (construction)
  Siegel graph charts, strict-Iwahori stable domains and the Hodge–Tate frame
  The remaining items of this node; the others are native above.

  API:
  * `HodgeTate.siegelGraphChart` (data): The big cell {rowspace(1 Z) : Z = Zᵗ} of FL = P_μ\GSp_2g,
      i.e. W = colspace(−Z; 1_g) (Scholze's chart for J = {g+1, …, 2g}), with the sub-affinoids
      Fl^×(r) = {dist(Z_{ij}, ℤ_p) ≤ r}, 0 < r ≤ 1, and Fl^×(1) = Fl_{g+1,…,2g}.
  * `HodgeTate.siegelGraphChart_stable` (characterisation): Fl^×(r) is stable under K_{Iw⁺} for 0 <
      r ≤ 1.
  * `HodgeTate.hodgeFrame` (constructor): The frame s = (s_1, …, s_g) of π_HT^*(𝒪^{2g}/W) ≅ ω_{A^∨},
      s_j(A, Ψ) = HT_A(Ψ(e_j)), dual to the rows of (1 Z), with no Tate twist; its transports λ^*s
      to ω_A and s′ to π_HT^*W^∨ ≅ ω_A(−1).
  * `HodgeTate.hodgeFrame_transform` (relation): For γ ∈ K_{Iw⁺}, over π_HT⁻¹(Fl^×(r)): γ^*s = s·(A
      + ZC) and γ^*(λ^*s) = λ^*s·(A + ZC), γ^*s′ = c(γ)⁻¹s′·(A + ZC), and the cocycle relation (A +
      ZC)_{γγ′} = (A + ZC)_γ (A′ + (Z·γ)C′).

  Unit tests:
  * `graph_domain_not_disc` (non-example): For g = 1 and r < |p|, γ = (1 p; 0 1) ∈ K_{Iw⁺} sends z =
      0 to z·γ = p, so {|z| ≤ r} is not K_{Iw⁺}-stable, while p ∈ ℤ_p lies in Fl^×(r) = {dist(z,
      ℤ_p) ≤ r}.
  * `graph_chart_lagrangian` (characterisation): For g = 2 and the non-symmetric Z = (0 1; 0 0), W =
      colspace(−Z; 1_2) contains v = (−1, 0, 0, 1)ᵗ and w = (0, 0, 1, 0)ᵗ with vᵗJw = 1 ≠ 0 for J =
      (0 −1_2; 1_2 0), so W is not Lagrangian: the chart needs Z = Zᵗ (in general vᵗJw = yᵗ(Zᵗ −
      Z)y′ for v = (−Zy; y), w = (−Zy′; y′)).
  * `hodge_frame_similitude` (non-example): For γ = diag(1_g, u·1_g) with u ∈ 1 + pℤ_p, u ≠ 1 (in
      K_{Iw⁺}, c(γ) = u, A + ZC = 1): γ^*s = s but γ^*s′ = u⁻¹s′, so a frame of π_HT^*W^∨ with a
      fixed Tate trivialisation does not satisfy the law A + ZC.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-open-period-map` (theorem)
  The Hodge-type period map on the open perfectoid tower

  Statement: Let (G, X) be of Hodge type and S_{K^p} the open perfectoid tower over C (S2
  hodge-open-perfectoid-tower; the form over E_𝔭 is not used). Then there is a G(ℚ_p)-equivariant
  Hodge–Tate period map π_HT: S_{K^p} → FL_{G,μ} (right convention of
  levi-torsor-over-flag-variety), equivariant for the prime-to-p Hecke action of G(𝔸_f^p) with
  trivial action on FL, independent of the symplectic embedding, and compatible with the Siegel
  period map: the composite S_{K^p} → (Siegel open tower) → FL_{GSp,μ̃} is FL_{G,μ} ↪ FL_{GSp,μ̃} ∘
  π_HT. On points it sends (A, tensors s_α, a trivialisation of T_pA respecting the s_{α,p}) to the
  Hodge–Tate filtration as a P_μ-coset. Construction: the pro-étale G(ℚ_p)-torsor of
  tensor-preserving trivialisations V_p ⊗ 𝒪̂ ≅ V ⊗ 𝒪̂ has a canonical section over the tower, and
  its P_μ-reduction P_p by the Hodge–Tate filtration (HodgeTateAndCanonicalSubgroups T2,
  Caraiani–Scholze Lemmas 2.3.6–2.3.7) defines the map.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-levi-pullback` (theorem)
  Pullback of the Levi torsor and of automorphic vector bundles along π_HT

  Statement: In the situation of hodge-open-period-map, the pullback along π_HT of the M_μ-torsor
  U_{P_μ}\G → FL_{G,μ} is M_p = P_p ×^{P_μ} M_μ, and there is a canonical isomorphism of M_μ-torsors
  on S_{K^p} M_p ≅ M_dR ×^{μ, ℤ_p^×} ℤ_p(1), where M_dR is the de Rham Levi torsor pulled back from
  finite level (AutomorphicBundles B1) and the twist is by the cyclotomic character through the
  central cocharacter μ|ℤ_p^× (Boxer–Pilloni, author's version, §4.4.8 and §4.4.23; Caraiani–Scholze
  Proposition 2.3.9 omits the twist, PerfectoidShimuraVarieties/E21). Equivalently the tensor
  functors f_p: Rep M_μ → (G(ℚ_p)-equivariant bundles on S_{K^p}), V ↦ π_HT^*(U_{P_μ}\G ×^{M_μ} V),
  and f_∞: V ↦ pullback of the automorphic vector bundle of V (AutomorphicBundles B2) are isomorphic
  after twisting by the Tate weight: for the irreducible M_μ-representation V_κ of highest weight κ
  (on which the central μ acts through t^{⟨μ, κ⟩}), f_p(V_κ) ≅ f_∞(V_κ)(⟨μ, κ⟩), i.e. f_p(V_κ)(−⟨μ,
  κ⟩) ≅ f_∞(V_κ) (Boxer–Pilloni, author's version, Remark 4.4.12: (π_HT^{tor})^*V_{κ,FL}(−⟨μ, κ⟩) =
  π^*_{K_p}V_{K^pK_p,κ,Σ}); the isomorphism is independent of the Siegel embedding and equivariant
  for the prime-to-p Hecke action. Over the tower the twist can be trivialised by the similitude
  level structure, but that trivialisation is not G(ℚ_p)-equivariant.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-period-map-datum-functoriality` (theorem)
  Functoriality of the Hodge-type period map in morphisms of Shimura data

  Statement: Let f: (G₁, X₁) → (G₂, X₂) be a morphism of Hodge-type Shimura data, choose
  cocharacters with f ∘ μ₁ = μ₂, K₁^p, K₂^p with f(K₁^p) ⊆ K₂^p sufficiently small, and f̃:
  S_{K₁^p} → S_{K₂^p} the induced G₁(ℚ_p)-equivariant map of open perfectoid towers (S0
  functoriality of canonical models through the diamond limits). Then π_HT,₂ ∘ f̃ = FL(f) ∘
  π_HT,₁, where FL(f): FL_{G₁,μ₁} → FL_{G₂,μ₂} is induced by f (f(P_{μ₁}) ⊆ P_{μ₂}). The
  identity datum morphism gives the identity, and composition is respected.

  Hypotheses:
  * (G, X) of Hodge type with a fixed embedding into a Siegel datum (ShimuraData:D4/hodge-
  type); P_μ is the Hodge–Tate parabolic {g : lim_{t→0} Ad μ(t)g exists}, P_μ^std the Hodge
  parabolic, M_μ = Cent_G(μ) their common Levi. (for both data).
  * Caraiani–Scholze prove only independence of the Siegel embedding; the general datum-
  morphism statement is proved here by the same construction.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps` (theorem)
  The Hodge-type period map on the image and genuine minimal compactifications and on perfect
  toroidal towers

  Statement: Let (G, X) be of Hodge type. (a) On Scholze's image-compactified tower
  𝒳^{*̲}_{K^p} (S2 hodge-image-compactified-tower) there is a G(ℚ_p)-equivariant map π_HT:
  𝒳^{*̲}_{K^p} → FL_{G,μ}, pulled back from the Siegel period map through FL_{G,μ} ↪
  FL_{GSp,μ̃} (Zariski closed); it is affinoid (FL_{G,μ} has a cover by affinoids whose
  preimages are good affinoid perfectoid), compatible with tame level and prime-to-p Hecke
  operators, and π_HT^*ω_Fl ≅ ω(−g) for the fixed Siegel embedding of genus g (untwisted after
  a chosen Tate trivialization with transported linearization) (Scholze Theorem
  4.1.1(iii)–(v)). (b) On the genuine minimally compactified tower 𝒳*_{K^p} (S2 hodge-genuine-
  minimal-perfectoid-tower), π_HT is the composite 𝒳*_{K^p} → 𝒳^{*̲}_{K^p} → FL_{G,μ}. (c) For
  a perfect cone decomposition Σ (a cofinal class: those for which Lan's theorem gives Σ̃ and
  closed immersions of the Hodge-type toroidal compactifications into Siegel ones at all
  levels), 𝒳^{tor}_{K^p,Σ} ~ lim 𝒳^{tor}_{K^pK_p,Σ} is perfectoid with a closed immersion into
  the Siegel toroidal tower for Σ̃, π_HT^{tor} is the composite with the map to the minimal
  compactification, the pullback of the Levi torsor is M_dR^{can} ×^{μ,ℤ_p^×} ℤ_p(1) for the
  canonical extension M_dR^{can} of the Hodge-type de Rham Levi torsor, pulled back from
  finite level (Boxer–Pilloni Proposition 4.4.29, after Esnault–Harris), and these
  isomorphisms are compatible with the G(𝔸_f)-action on the limit over K^p and Σ. The three
  compactified towers are distinct: the auxiliary normalised models of hodge-tate-formal-
  models are a fourth object, only their generic fibres being minimal compactifications.

  Hypotheses:
  * (G, X) of Hodge type with a fixed embedding into a Siegel datum (ShimuraData:D4/hodge-
  type); P_μ is the Hodge–Tate parabolic {g : lim_{t→0} Ad μ(t)g exists}, P_μ^std the Hodge
  parabolic, M_μ = Cent_G(μ) their common Levi.
  * (c) needs perfect Σ; for general Σ it is not known (Boxer–Pilloni Remark 4.4.28).
  * Through (b), the genuine tower uses the perfectoidization gap of S2.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-tate-formal-models` (theorem)
  Auxiliary normalised formal models with ample Hodge line and Hodge–Tate sections

  Statement: Siegel case (Pilloni–Stroh, author's version, Théorème 1.22, after Scholze's
  proof of Theorem 4.3.1, pp. 1029–1030): put B(g,p) = g/(p − 1) for odd p and B(g,2) = 2g;
  let n₀ be the least integer > B(g,p) (so n₀ = 2g + 1 if p = 2). For n ≥ n₀ there are normal
  admissible formal models 𝔛(pⁿ)^{⋆−mod} → 𝔛(pⁿ)^{⋆−HT} of the minimal compactification
  𝒳(pⁿ)^⋆ of the level-Γ(pⁿ)K^p Siegel variety (over 𝒪_{ℂ_p}), the first a normalised blow-up
  on which det ω^{mod} (the subsheaf of det ω generated by Λ^g HT_n, with cokernel killed by
  p^{g/(p−1)}, resp. 4^g for p = 2) is invertible, the second covered by the affine formal
  schemes Spf H⁰(𝔘_i(pⁿ), 𝒪) for the Lagrangian Plücker charts i; for some k ≥ 1, det^k
  ω^{mod} descends to an ample invertible sheaf on 𝔛(pⁿ)^{⋆−HT}, and there are sections t_j of
  det^k ω^{mod} modulo p^{n₀−g/(p−1)} (modulo p^{n₀−2g} if p = 2) congruent to the k-th powers
  of the Plücker coordinates of Λ^g HT; the transition maps 𝔛(pⁿ)^{⋆−HT} → 𝔛(p^m)^{⋆−HT} are
  finite and everything is functorial in n and K^p. Scholze's own version gives, for each n, a
  level K_p and sections modulo pⁿ. Hodge type (Pilloni–Stroh Proposition 2.5): the
  normalisation of the schematic closure of the Hodge-type minimal compactification in the
  Siegel model, with the same ampleness and sections; the Hilbert–Siegel case is
  Boxer–Calegari–Gee–Pilloni §6.2.1. These are auxiliary normalised compactifications: only
  their generic fibres are the canonical minimal compactifications; they carry no semi-abelian
  scheme, boundary stratification or ordinary locus (Pilloni–Stroh Remarque 1.26). The
  stronger form used by Pilloni (§12.9.1) and Boxer–Calegari–Gee–Pilloni (§6.2.1), with det
  ω^{mod} itself descending and sections congruent modulo p^ε for every ε > 0 once n ≥ n(ε),
  is not proved in the cited sources (Pilloni–Stroh Remarque 1.23 states the descent of det
  ω^{mod} without proof); the consumers' arguments go through with a power of det ω^{mod} and
  sections modulo a fixed p^{ε′} (PerfectoidShimuraVarieties/E32).

  Hypotheses:
  * Siegel or Hodge-type (PEL) data; neat tame level; charts indexed by Lagrangian Plücker
  coordinates only (the published statements use all indices; PAPER-SCHOLZE-15/E16).
  * Pilloni–Stroh's published numbering is inferred to send the author's Théorème 1.22 to
  Theorem 1.16, which is how Pilloni and Boxer–Calegari–Gee–Pilloni cite it.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1` (theorem)
  The elliptic period map: quotient-line description, π_HT^*𝒪(1) = ω and the automorphy factor
  cz + d

  Statement: Let 𝒳*_{Γ(p^∞)} be the perfectoid modular curve (g = 1 of S1) over a perfectoid L
  ⊇ ℚ_p^cycl, with points (E, μ_N-level, α: ℤ_p² ≅ T_pE) and BHW's left action γ·(E, α) = (E,
  α ∘ γ^∨), γ^∨ = det(γ)γ⁻¹, i.e. γ·x = x·γ^∨ for the right action x·f = (E, α ∘ f) of S0 (γ ↦
  γ^∨ is an anti-automorphism, (γδ)^∨ = δ^∨γ^∨, so it turns the right action into a left
  action). (i) The C-points of the total space of 𝒪(1) over ℙ¹ are pairs (L, y) of a line L ⊆
  C² and y ∈ C²/L, and π_HT^*𝒪(1) ≅ ω is the quotient-line identification C²/L ≅ ω_E through
  HT ∘ α (HT: T_pE → ω_E, L = ker(HT ∘ α)); this form needs no Tate trivialisation. (ii) The
  section s: (x : y) ↦ (C² → C²/⟨(x, y)⟩, image of (1, 0)) of 𝒪(1) is nowhere zero off ∞ = (1
  : 0); for γ = (a b; c d) ∈ Γ₀(p) one has γ^*s = (cz + d)s, where z is the coordinate of (z :
  1); hence 𝔰 := π_HT^*s satisfies γ^*𝔰 = (c𝔷 + d)𝔰 on the anticanonical locus and 𝔰(E, α) =
  HT(α(e_1)). (iii) In Pan's normalisation (V = ℚ_p² the standard representation, Tate module
  V(1) = V^∨), the relative Hodge–Tate sequence is 0 → ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0, the position
  of ω⁻¹ defines π_HT: 𝒳 → ℙ¹, and the tautological ample ω_Fl pulls back to ω(−1). (iv)
  Unlike the complex case (γ^*η_can = (cz + d)⁻¹η_can, trivialising ω_E), the p-adic section
  trivialises ω_{E^∨} and transforms with (cz + d).

  Hypotheses:
  * Modular curve of tame level K^p ⊆ GL_2(𝔸_f^p) with Γ(N), N ≥ 3, or Γ₁(N), N ≥ 4, prime to
  p (BHW), or neat K^p (Pan).
  * The statement of BHW Lemma 3.19 misprints γ^*s = (cz + d)γ for (cz + d)s
  (PerfectoidShimuraVarieties/E24).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hecke-equivariant-hodge-tate-sequence` (comparison)
  The Hecke-equivariant relative Hodge–Tate sequence of the modular curve

  Statement: On the perfectoid modular curve 𝒳_{K^p} over C, let D be the canonical extension of
  H¹_dR of the universal elliptic curve at finite level, with Fil¹D = ω and gr⁰D = ∧²D ⊗ ω⁻¹. The
  sequence 0 → ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0 depends on an implicit trivialisation c ∈ H⁰(∧²D) (a
  GL_2(Ẑ)-fixed nowhere vanishing section, on which GL_2(𝔸_f) acts through |det|_𝔸⁻¹) and is not
  equivariant for the prime-to-p Hecke action; the Hecke-equivariant form is 0 → ∧²D ⊗ ω⁻¹(1) → V(1)
  ⊗ 𝒪 → ω → 0 (Pan (4.2.1)). Taking ∧² gives 𝒪 ≅ (∧²D)⁻¹ ⊗ 𝒪 ⊗ det(1) with t = c⁻¹ ⊗ 1 ⊗ b for a
  fixed basis b of ℚ_p(1), and the identifications (4.2.2)–(4.2.3) of Pan are independent of the
  trivialisations of ∧²D and ℚ_p(1). (Pan prints gr¹D for the subobject; by his own convention Fil¹D
  = ω it is gr⁰D; PerfectoidShimuraVarieties/E25.)
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hilbert-res-flag-period-map` (theorem)
  The Hilbert period map to Res_{𝒪_F/ℤ}ℙ¹ and its factors after splitting

  Statement: Let F be totally real of degree g, G* = Res_{F/ℚ}GL_2 ×_{Res G_m} G_m the Hodge-type
  Hilbert datum (ShimuraData:D5/hilbert-star-datum) with its trace-form embedding, and 𝒳_{Γ*(p^∞)}
  the open perfectoid Hilbert tower over a perfectoid L ⊇ ℚ_p^cycl. (i) The flag variety of G* is
  Res_{𝒪_F|ℤ}ℙ¹, the adic analytification of R ↦ ℙ¹(R ⊗_ℤ 𝒪_F), and π_HT: 𝒳_{Γ*(p^∞)} →
  Res_{𝒪_F|ℤ}ℙ¹ sends (A, α: 𝒪_p² ≅ T_pA^∨) to the 𝒪_p ⊗ C-line given by 0 → Lie(A^∨)(1) → T_pA^∨ ⊗
  C → ω_A → 0 (the dual Tate module, unlike the elliptic case). (ii) ω_{Γ*(p^∞)} =
  π_HT^*Res_{𝒪_F|ℤ}𝒪(1), Res G_m-equivariantly, with the section s = Res s_ell, 𝔰 = π_HT^*s, 𝔰(A, α)
  = HT_A(α(1, 0)), and γ^*𝔰 = (c𝔷 + d)𝔰 for γ ∈ Γ*₀(p), where c𝔷 + d: Res Ĝ_a → Res Ĝ_m. (iii) After
  an extension L′ of L in which F splits (𝒪_F ⊗ L′ = ∏_{v∈Σ} L′, Σ = Hom(𝒪_F, L′)), Res ℙ¹ = (ℙ¹)^Σ,
  Res 𝒪(1) = ⊕_v π_v^*𝒪(1), s = Σ_v s_v and the coordinates z_v are functions; over L itself the
  components z_v have no such interpretation. The extension of π_HT to the intermediate and
  arithmetic Hilbert towers of G = Res_{F/ℚ}GL_2 (through (x, u) ↦ diag(u, 1)·π_HT(x) on the span,
  polarization invariance and descent) is not part of this node: it is owned by
  PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility, which builds on this node.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety` (lemma)
  A basis of affinoids of the flag variety with affinoid perfectoid preimages from finite
  level

  Statement: For the Siegel datum (and, by pullback along hodge-compactified-period-maps (a),
  for Hodge-type data), there is a basis 𝔅 of open affinoid subsets of Fl, stable under finite
  intersections, such that for every U ∈ 𝔅 the preimage V_∞ = π_HT⁻¹(U) ⊆ 𝒳*_{Γ(p^∞)} is
  affinoid perfectoid, is the preimage of an affinoid V_{K_p} ⊆ 𝒳*_{K_pK^p} for all
  sufficiently small K_p, and colim_{K_p} H⁰(V_{K_p}, 𝒪) → H⁰(V_∞, 𝒪) has dense image. For g =
  1 one may take 𝔅 = finite intersections of rational subsets of U₁ = {|x| ≤ 1} and U₂ = {|x|
  ≥ 1}.

  Hypotheses:
  * Siegel datum with S1's tame level, or Hodge type through the image compactification.
-/


/-! ## Contracts for layer S4 -/


/- CONTRACT `PerfectoidShimuraVarieties:S4/property-p` (definition)
  Property 𝒫: perfectoidness of all minimally compactified towers of a datum

  Statement: A Shimura datum (G, X) satisfies Property 𝒫 if for every compact open K^p ⊆ G(𝔸_f^p)
  the diamond 𝒳*_{K^p}(G, X) = lim_{K_p} 𝒳*_{K^pK_p}(G, X)^◇ over Spd C is a perfectoid space;
  equivalently (property-p-full-iff-neutral) the neutral-component diamonds 𝒳*_{K^p}(G, X)⁰ are
  perfectoid for every K^p. A connected Shimura datum (G, X⁺) satisfies Property 𝒫 if for every
  arithmetic subgroup Γ the diamond 𝒳*_{Γ,∞}(G, X⁺) = lim_{K_p} 𝒳*_{Γ∩K_p}(G, X⁺)^◇ is perfectoid,
  with Γ ∩ K_p := Γ ∩ (G(𝔸_f^p)K_p). For the connected definition we take Γ ⊆ G(ℚ)_+ arithmetic with
  K_p ⊆ G(ℚ_p) compact open; for G adjoint this coincides with Hansen–Johansson's reading Γ ⊆
  G^ad(ℚ)^+, and S4 uses their reading only in that case. For G semisimple but not adjoint the
  towers of Γ and of its image π(Γ) in G^ad are in general not isomorphic (property-p-from-adjoint).

  API:
  * `ShimuraTower.PropertyP` (data): The predicate on a Shimura datum: all minimally compactified
      towers have perfectoid diamonds.
  * `ShimuraTower.ConnectedPropertyP` (data): The predicate on a connected datum (G, X⁺): all
      𝒳*_{Γ,∞}(G, X⁺) are perfectoid.
  * `ShimuraTower.propertyP_iff_neutral` (characterisation): Property 𝒫 holds iff the
      neutral-component towers are perfectoid for all K^p.
  * `ShimuraTower.propertyP_of_adjoint` (functoriality): Property 𝒫 for (G^ad, X⁺) implies it for
      (G, X) and for (G, X⁺).
  * `ShimuraTower.propertyP_hodge` (constructor): Hodge-type data satisfy Property 𝒫.
  * `ShimuraTower.propertyP_iso` (functoriality): Property 𝒫 is invariant under isomorphism of
      (connected) data.

  Unit tests:
  * `propertyP_siegel` (computation): The Siegel datum (GSp_2g, H_g^±) satisfies Property 𝒫.
  * `propertyP_torus` (degenerate): A torus datum satisfies Property 𝒫: its towers are profinite
      sets over Spd C, whose diamonds are affinoid perfectoid
      (DiamondsAndVStacks:D4/compact-hausdorff-diamonds).
  * `propertyP_not_open_only` (non-example): For G = GL_2 the diamond 𝒳*_{K^p}(G, X) is quasicompact
      (a limit of projective curves, a spatial diamond), while the open tower 𝒳_{K^p}(G, X) is not
      quasicompact; Property 𝒫 is the statement about the former.
  * `propertyP_level_independent` (compatibility): Property 𝒫 at one cofinal level family is
      Property 𝒫 at all (PerfectoidSpaces:P7/tilde-limit-cofinal-change for diamonds of cofinal
      subsystems).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S4/property-p-full-iff-neutral` (theorem)
  The full tower is perfectoid iff the neutral-component tower is

  Statement: For a Shimura datum (G, X) over C, the following are equivalent: (1) 𝒳*_{K^p}(G, X) is
  perfectoid for every K^p; (2) 𝒳*_{K^p}(G, X)⁰ is perfectoid for every K^p.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S4/property-p-from-adjoint` (theorem)
  Property 𝒫 descends from the adjoint connected datum

  Statement: Let (G, X) be a Shimura datum or a connected Shimura datum. If (G^ad, X⁺) satisfies
  Property 𝒫, then so does (G, X).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S4/hodge-adjoint-property-p` (theorem)
  For a Hodge-type datum, the adjoint connected datum has Property 𝒫

  Statement: Let (G, X) be a Shimura datum of Hodge type. Then for every arithmetic subgroup Γ ⊆
  G^ad(ℚ)^+, the diamond 𝒳*_{Γ,∞}(G^ad, X⁺) = lim_{K_p ⊆ G^ad(ℚ_p)} 𝒳*_{Γ∩K_p}(G^ad, X⁺)^◇ over C is
  a perfectoid space.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid` (theorem)
  Minimally compactified towers of pre-abelian Shimura data are perfectoid

  Statement: Let (G, X) be a Shimura datum (resp. a connected Shimura datum) of pre-abelian type
  (ShimuraData:D4/preabelian-type). Then for every compact open K^p ⊆ G(𝔸_f^p) the diamond
  𝒳*_{K^p}(G, X) = lim_{K_p} 𝒳*_{K^pK_p}(G, X)^◇ over C is a perfectoid space (resp. for every
  arithmetic Γ the diamond 𝒳*_{Γ,∞}(G, X⁺) is perfectoid): pre-abelian data satisfy Property 𝒫. This
  is a representability statement only: no Hodge–Tate period map on these towers is asserted (the
  revised Hansen–Johansson paper removed it; S6 supplies the abelian-type minimal period map
  separately). The identification is with the diamond limit; a Scholze–Weinstein tilde-limit
  statement is not asserted (it is not known even for Hodge type, Boxer–Pilloni §4.4.27).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S4/preabelian-open-tower-and-boundary` (theorem)
  The open pre-abelian tower and the Zariski closed boundary

  Statement: Let (G, X) be of pre-abelian type and K^p ⊆ G(𝔸_f^p) compact open, with 𝒳*_{K^p} the
  perfectoid space of preabelian-minimal-perfectoid. Then: (i) the boundary 𝒵_{K^p} ⊆ 𝒳*_{K^p}, the
  preimage of the boundary ∂ of any 𝒳*_{K^pK_p} with its induced perfectoid structure, is a Zariski
  closed embedding (PerfectoidSpaces:P8/zariski-closed-embedding), independent of K_p, and on every
  affinoid perfectoid open it is strongly Zariski closed; (ii) the open tower 𝒳_{K^p} := 𝒳*_{K^p} ∖
  𝒵_{K^p} is a perfectoid space with 𝒳_{K^p}^◇ ≅ lim_{K_p} 𝒳_{K^pK_p}^◇ (the open S0 diamond); (iii)
  both identifications are isomorphisms of diamonds, compatible with the G(ℚ_p)-action; no
  tilde-limit statement is asserted. Hansen–Johansson state (i) in Theorem 1.5 without proof in §5
  and do not state (ii) (PerfectoidShimuraVarieties/E15).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S4/preabelian-reflex-bridge` (comparison)
  Theorem 1.5 over an arbitrary C with E → C

  Statement: Let (G, X) be of pre-abelian type with reflex field E, C/ℚ_p complete algebraically
  closed and E → C an embedding. Then the tower of adic spaces over Spa C of Sh*_{K^pK_p}(G, X)
  ⊗_{E} C (canonical models, ShimuraVarieties:V8/minimal-descent) has perfectoid diamond limit
  X*_{K^p} = lim_{K_p} X*^◇_{K^pK_p} over Spd C, with Zariski closed boundary and open complement as
  in preabelian-open-tower-and-boundary: this is Hansen–Johansson Theorem 1.5, whose proof in §5.3
  works with complex varieties and a fixed ℂ ≅ ℂ_p.
-/


/-! ## Contracts for layer S5 -/


/- CONTRACT `PerfectoidShimuraVarieties:S5/modular-tower-comparison` (comparison)
  The modular-curve tower: comparison with the full-level modular curves, fixed Weil-pairing
  components and tame level

  Statement: For (GL_2, ℍ^±), a tame level K^p prime to p that is the adelic form of one of Heuer's
  rigidifying tame levels Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N), namely K^p = K(N)^p with N ≥ 3 or K^p = K₁(N)^p
  with N ≥ 4 (Γ₁(3) is not rigidifying: (−2 1; −3 1) ∈ Γ₁(3) has order 3;
  PerfectoidShimuraVarieties/E35), and K_p = K(pᵐ). For K^p = K(N)^p the S0 tower over C is
  identified with the analytified full-level modular curves of ShimuraVarieties:V8/gl2-full-level
  (moduli of (E, P, Q) with an ordered full Npᵐ-basis), compatibly with level maps and Hecke
  correspondences (V8/gl2-tower-compatibility); for K₁(N)^p it is the quotient of the K(N)^p-tower
  by the finite group K₁(N)^p/K(N)^p (S0 tower-right-action). The infinite-level diamond
  S^{*◇}_{K^p,∞} is represented by 𝒳*_{Γ(p^∞)} ×_{Spa ℚ_p} Spa C, where 𝒳*_{Γ(p^∞)} is Scholze's
  perfectoid modular curve over ℚ_p^cycl (S1 with g = 1), on which the Weil-pairing root is the
  fixed compatible system (PerfectoidShimuraVarieties:S1/siegel-similitude-comparison); after fixing
  ℚ_p^cycl → C this is ℤ_p^× × (𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C), which is also the GL_2-space of Heuer
  and BHW (moduli of (E, μ, α) with α unrestricted) taken over C, and 𝒳*_{Γ(p^∞)} ⊗̂_{ℚ_p^cycl} C
  alone is the part over one compatible system ζ of p-power roots of unity. The (R, R⁺)-points of
  S^◇_{K^p,∞} for perfectoid (R, R⁺) over (C, O_C) are triples (E, tame level, α: ℤ_p² ≅ T_pE), with
  no condition on the Weil pairing of α. Under this identification the right translation by u ∈
  GL_2(ℤ_p) is α ↦ α ∘ u, and BHW's left action γ·α = α ∘ γ^∨ is the right translation by γ^∨ =
  det(γ)γ⁻¹. Components: for K^p = K(N)^p, π₀ of the infinite-level tower is lim_m (ℤ/Npᵐ)^× =
  (ℤ/N)^× × ℤ_p^×, identified through the Weil pairing with compatible systems of primitive Npᵐ-th
  roots of unity (V8/gl2-determinant-pairing) (for K₁(N)^p it is ℤ_p^×); the fibre over a fixed
  compatible system ζ is the fixed-pairing tower of V8/gl2-fixed-pairing-fibre (connected at each
  level), its deck group over level K(p) is the image of SL_2-type congruence subgroups, and
  GL_2(ℤ_p) acts on π₀ through det. For K^p = K(N)^p the tower is a GL_2(ℤ_p)-torsor over the
  level-K^pGL_2(ℤ_p) curve, because K^pGL_2(ℤ_p) is neat and Z(ℚ) ∩ K^pGL_2(ℤ_p) = {1} (S0
  tower-action-kernel).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/modular-cusp-charts-and-q-action` (comparison)
  Completed cusp charts of the perfectoid modular curve and the action on q-parameters

  Statement: For a cusp x of the compactified modular curve X* of a rigidifying tame level Γ^p
  in Heuer's sense (Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N), N ≥ 3 prime to p, for instance Γ(N) with N ≥ 3 or
  Γ₁(N) with N ≥ 4, but not Γ₁(3), which contains the element (−2 1; −3 1) of order 3;
  PerfectoidShimuraVarieties/E35) with Tate parameter D_x and width e_x, the cusp chart of S1
  elliptic-cusps-at-infinite-level is identified with the formal Tate-curve neighbourhood of
  the finite-level comparison (ShimuraVarieties:V8/gl2-cusps-tate,
  ShimuraCompactifications:C6/modular-formal-cusp-comparison): at level Γ₀(pⁿ) ∩
  anticanonical, the chart is D_n with q^{1/pⁿ} the Tate parameter of the anticanonical
  quotient, and at infinite level (GL_2(ℤ_p) × D_{∞,x})/ℤ_p. The action of Γ₀(p) on the charts
  at Γ₀(p^∞)-level is through (Γ₀(p) × D_∞)/pℤ_p = Γ₀(p^∞) × D_∞ with the right action of h ∈
  pℤ_p by (γ, q^{1/p^m}) ↦ (γ(1 0; h 1), ζ_{p^m}^{h/e_x} q^{1/p^m}) (Heuer Proposition 3.19),
  i.e. the lower unipotent N⁻(pⁿℤ_p) (not a quotient Γ₀(pⁿ)/Γ₀(p^∞), which is not a group)
  acts on q-roots by p-power roots of unity, with ζ fixed by the Weil pairing; consequently
  the Γ₀(pⁿ)-invariant bounded functions on the chart over x are 𝒪_{L_x}[[q^{1/pⁿ}]] (with the
  completed bounded-series convention and L_x the actual cusp field, including any required
  tame roots of unity) (BHW Proposition 3.8). The Hodge–Tate period map is locally constant on
  the charts, (a b; c d), q ↦ (b : d) ∈ ℙ¹(ℤ_p).

  Hypotheses:
  * Modular curve as in modular-tower-comparison; the sign of h follows Heuer's convention for
  the right action of the lower unipotent; BHW's adjugate convention exchanges c and −c
  (PerfectoidShimuraVarieties/E31).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/modular-anticanonical-and-period-compatibility` (comparison)
  Modular anticanonical domains, radii and the period coordinate

  Statement: For the modular curve, the anticanonical tower of S1 (g = 1) and BHW's anticanonical
  locus agree: 𝒳*_{Γ(p^∞)}(ε) = 𝒳*_{Γ(p^∞)}(ε)_c ⊔ 𝒳*_{Γ(p^∞)}(ε)_a with the anticanonical part the
  preimage of {D ∩ H₁ = 0} at Γ₀(p)-level; with the bounds of HodgeTateAndCanonicalSubgroups T4 (for
  m ≥ 1, p^{−m} ≤ r < 1 and ε ≤ 1/(c_p p^m), c_p = 2, 3, 4 for p ≥ 5, p = 3, p = 2),
  π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆ B_r(ℤ_p : 1), the union of closed balls of radius r around (a : 1), a ∈
  ℤ_p; Γ₀(p) preserves B_r(ℤ_p : 1) with z ↦ (az + b)/(cz + d) and |cz + d| = 1; and 𝔷 = π_HT^*z, 𝔰
  = π_HT^*s with 𝔰(x) = HT(α(e_1)) (S3 elliptic-hodge-tate-and-O1) satisfy γ^*𝔰 = (c𝔷 + d)𝔰. The
  radius is attached to the rational prime p (BHW's Proposition 2.6 is not a special case of their
  Proposition 5.18 as printed, PerfectoidShimuraVarieties/E30; the T4 bounds are used).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-three-towers` (construction)
  The geometric, intermediate and arithmetic Hilbert towers at infinite level

  Statement: In the setting of the hypotheses, for n ∈ ℤ_{≥0} let X_{Γ*(pⁿ)} (G*-level: α_n
  with similitude in (ℤ/pⁿ)^×, relative to a chosen generator β of 𝔠𝔡⁻¹(1)), X_{Γ(pⁿ)} (the
  intermediate space: the G*-variety X with a full G-level α_n: (𝒪_F/pⁿ)² ≅ A^∨[pⁿ],
  polarization λ fixed) and X_{G,Γ(pⁿ)} (the arithmetic G-variety, polarization class [λ] =
  𝒪_F^{×,+}λ) be the finite-level spaces of HilbertModularVarietiesAndShimuraCurves H3–H4,
  with maps X_{Γ*(pⁿ)} →β₁ X_{Γ(pⁿ)} →β₂ X_{G,Γ(pⁿ)} over X = X → X_G. Their infinite-level
  diamonds X_{Γ*(p^∞)}, X_{Γ(p^∞)}, X_{G,Γ(p^∞)} are formed as in S0 infinite-level-diamond.
  The hybrid tower (X_{Γ(pⁿ)})_n is an S0 rigidified moduli tower over the arithmetic tower
  (X_{G,Γ(pⁿ)})_n with the pro-system of finite groups Δ_{K(pⁿ)} = Δ(pⁿN) = 𝒪_F^{×,+}/((1 +
  pⁿN𝒪_F)^×)², whose orders are unbounded in n when [F : ℚ] > 1, and are all 1 when F = ℚ (BHW
  Lemma 8.16(1)); its torsor property at infinite level is hilbert-polarization-torsors.
  X_{Γ*(p^∞)} is perfectoid by S2 (Hodge type, G* = PEL) and X_{G,Γ(p^∞)} by S4 (G is of
  abelian type); perfectoidness of X_{Γ(p^∞)} is not asserted here, it is proved in hilbert-
  mixed-span, which depends on this node. Actions: the level-structure action of G(ℤ_p) =
  GL_2(𝒪_p) on X_{Γ(p^∞)} by α ↦ α ∘ γ^∨ (a pro-étale G(ℤ_p)-torsor over X), of G*(ℤ_p) on
  X_{Γ*(p^∞)}, and the polarization action of 𝒪_F^{×,+} on X_{Γ(p^∞)} by λ ↦ ηλ, which factors
  through Δ(pⁿN) at level n and through the profinite group Δ(p^∞N) = lim_n Δ(pⁿN) at infinite
  level; 𝒪_F^{×,+} does not act on X_{Γ*(pⁿ)} by changing λ (BHW p. 33).

  Hypotheses:
  * F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G =
  Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a
  polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅
  T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right
  translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).

  API:
  * `HilbertTower.geometric` (data): X_{Γ*(p^∞)} with its G*(ℤ_p)-action.
  * `HilbertTower.intermediate` (data): X_{Γ(p^∞)} with the level-structure action of
  GL_2(𝒪_p) and the polarization action of 𝒪_F^{×,+}.
  * `HilbertTower.arithmetic` (data): X_{G,Γ(p^∞)} with the induced action.
  * `HilbertTower.beta1` (projection): β₁: X_{Γ*(p^∞)} → X_{Γ(p^∞)}, the inclusion of the
  similitude-ℤ_p^× locus.
  * `HilbertTower.beta2` (projection): β₂: X_{Γ(p^∞)} → X_{G,Γ(p^∞)}, forgetting λ up to
  𝒪_F^{×,+}.
  * `HilbertTower.levelAction` (instance): The left level-structure action α ↦ α ∘ γ^∨, equal
  to the S0 right translation by γ^∨.
  * `HilbertTower.polAction` (instance): The polarization action η·(A, λ, α) = (A, ηλ, α) on
  X_{Γ(p^∞)}, factoring through Δ(p^∞N) and commuting with the level action.
  * `HilbertTower.isPerfectoid` (characterisation): X_{Γ*(p^∞)} and X_{G,Γ(p^∞)} are
  perfectoid (for X_{Γ(p^∞)} see hilbert-mixed-span).

  Unit tests:
  * `three_towers_F_eq_Q` (degenerate): For F = ℚ the three towers and β₁, β₂ are identities
  between copies of the modular tower.
  * `beta1_not_surjective` (non-example): For [F : ℚ] = 2, β₁ is not surjective on π₀:
  π₀(X_{Γ*(pⁿ)}) = (ℤ/pⁿ)^× while π₀(X_{Γ(pⁿ)}) = (𝒪_F/pⁿ)^×.
  * `levelAction_adjugate` (computation): For γ = diag(u, 1), γ^∨ = diag(1, u), so the level
  action of γ multiplies the second basis vector by u.
  * `levelAction_vs_rightTranslation` (compatibility): The level action of γ equals the S0
  right translation T_{γ^∨} under α ↔ λ⁻¹ ∘ (α ⊗ id) (BHW Remark 5.5).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-mixed-span` (theorem)
  The intermediate Hilbert tower as a contracted product: the ℤ_p^×-torsor span

  Statement: In hilbert-three-towers, let 𝒪_p^× act on X_{Γ(p^∞)} by the level action of
  diag(η, 1). Then X_{Γ*(p^∞)} × 𝒪_p^× → X_{Γ(p^∞)}, (x, u) ↦ diag(u, 1)·β₁(x), is a
  ℤ_p^×-torsor for the antidiagonal action t·(x, u) = (diag(t, 1)·x, ut⁻¹), i.e. X_{Γ(p^∞)} =
  X_{Γ*(p^∞)} ×^{ℤ_p^×} 𝒪_p^×; in particular X_{Γ(p^∞)} is perfectoid. The decomposition
  X_{Γ(pⁿ)} = X_{Γ*(pⁿ)} × (𝒪_F/pⁿ)^×/(ℤ/pⁿ)^× printed by BHW uses a set-theoretic section of
  𝒪_p^× → 𝒪_p^×/ℤ_p^× and is not canonical; the contracted product is.

  Hypotheses:
  * F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G =
  Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a
  polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅
  T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right
  translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-weil-pairing` (construction)
  The 𝒪_p^×-valued Weil pairing of the intermediate Hilbert tower

  Statement: Let β be an 𝒪_p-generator of 𝔠𝔡⁻¹(1) = 𝔠𝔡⁻¹ ⊗ T_pμ_{p^∞}. The 𝒪_F-linearised Weil
  pairings ẽ_n (with e_{pⁿ} = Tr ∘ ẽ_n) and β give e_{n,β}: X_{Γ(pⁿ)} → (𝒪_F/pⁿ)^×, and e_β := lim
  e_{n,β}: X_{Γ(p^∞)} → 𝒪_p^× (a map to the profinite perfectoid group). Properties: (i) for γ ∈
  GL_2(𝒪_p) acting by the level action and η ∈ 𝒪_F^{×,+} by the polarization action, e_β ∘ γ =
  det(γ)·e_β and e_β ∘ η = η⁻¹·e_β. The polarization action factors through the profinite group
  Δ(p^∞N) = lim_m 𝒪_F^{×,+}/((1 + p^mN𝒪_F)^×)², and 𝒪_F^{×,+} ⊆ 𝒪_p^× induces a continuous
  homomorphism x ↦ x̄: Δ(p^∞N) → 𝒪_p^× = lim_m (𝒪_F/p^m)^× (squares of units ≡ 1 mod p^mN are ≡ 1
  mod p^m). Let E(pⁿ) := lim_m (Γ̄₀(pⁿ, p^m) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× (with η ↦ (diag(η, η), η²); n
  as in hilbert-level-torsors), the profinite group of hilbert-level-torsors; equivalently E(pⁿ) =
  (Γ₀(pⁿ) × Δ(p^∞N))/Z_∞, with Z_∞ the closure of (1 + N𝒪_F)^× in 𝒪_p^× embedded by z ↦ (diag(z, z),
  z²), and BHW's (Γ₀(pⁿ) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× is a dense subgroup. Then for (γ, x) ∈ Γ₀(pⁿ) ×
  Δ(p^∞N), e_β ∘ (γ, x) = det(γ)x̄⁻¹·e_β, which is well defined on E(pⁿ) because (diag(z, z), z²)
  gives z²·z⁻² = 1; and for a character w of 𝒪_p^× the unit w(e_β) ∈ 𝒪⁺(X_{Γ(p^∞)}(ε)_a)^× satisfies
  (γ, x)^*w(e_β) = w(x̄⁻¹)w(det γ)w(e_β) for (γ, x) ∈ E(pⁿ); (ii) the fibre of e_β over ℤ_p^× is
  X_{Γ*(p^∞)}; (iii) change of generator: e_{uβ} = u⁻¹e_β for u ∈ 𝒪_p^×, which moves X_{Γ*(p^∞)} to
  the fibre over u⁻¹ℤ_p^×; (iv) on the arithmetic tower only the class of e_β modulo the closure of
  𝒪_F^{×,+} is defined (BHW's map e: X_{G,Γ(p^∞)} → 𝔠𝔡⁻¹(1)^× is not well defined, because changing
  λ by η multiplies the pairing by η⁻¹; PerfectoidShimuraVarieties/E28).

  API:
  * `HilbertTower.weilPairing` (constructor): e_β: X_{Γ(p^∞)} → 𝒪_p^×.
  * `HilbertTower.weilPairing_level` (simp): e_β ∘ γ = det(γ)·e_β for the level action.
  * `HilbertTower.weilPairing_pol` (simp): e_β ∘ η = η⁻¹·e_β for the polarization action.
  * `HilbertTower.weilPairing_fibre` (characterisation): e_β⁻¹(ℤ_p^×) = β₁(X_{Γ*(p^∞)}).
  * `HilbertTower.weilPairing_changeGenerator` (relation): e_{uβ} = u⁻¹e_β.
  * `HilbertTower.weilPairing_E` (simp): e_β ∘ (γ, x) = det(γ)x̄⁻¹e_β for (γ, x) ∈ E(pⁿ) = (Γ₀(pⁿ) ×
      Δ(p^∞N))/Z_∞, with x ↦ x̄ the map Δ(p^∞N) → 𝒪_p^×.
  * `HilbertTower.weilPairing_arith` (constructor): The well-defined class of e_β in 𝒪_p^× modulo
      the closure of 𝒪_F^{×,+} on X_{G,Γ(p^∞)}.

  Unit tests:
  * `weilPairing_F_eq_Q` (degenerate): For F = ℚ, e_β is the ℤ_p^×-valued Weil pairing and the
      polarization action is trivial.
  * `weilPairing_diag` (computation): For γ = diag(u, 1), e_β ∘ γ = u·e_β.
  * `weilPairing_scalar_pol` (characterisation): For η ∈ (1 + N𝒪_F)^×, the polarization action of η²
      equals the level action of diag(η, η)⁻¹ (BHW Lemma 8.12), consistently with det(diag(η, η)⁻¹)
      = η⁻² = (η²)⁻¹.
  * `weilPairing_arith_not_defined` (non-example): For [F : ℚ] ≥ 2 and a totally positive unit η ≠
      1, e_β changes by η⁻¹ ∉ 1 under λ ↦ ηλ, so no 𝒪_p^×-valued map is defined on the arithmetic
      tower.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors` (theorem)
  The full-tower profinite polarization torsor and the finite torsor on connected components

  Statement: In hilbert-three-towers: (1) β₂: X_{Γ(p^∞)} → X_{G,Γ(p^∞)} is a pro-étale torsor
  under the profinite group Δ(p^∞N) := lim_n Δ(pⁿN), Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)²,
  into which 𝒪_F^{×,+} embeds densely; (2) on identity components, X⁰_{Γ(p^∞)} = X⁰_{Γ*(p^∞)}
  → X⁰_{G,Γ(p^∞)} is a finite étale torsor under the finite group Δ_∞(N) := ker(Δ(p^∞N) →
  𝒪_p^×), the stabiliser of the identity component; for p odd Δ_∞(N) = Δ_n(N) = (1 +
  pⁿ𝒪_F)^{×,+}/((1 + pⁿN𝒪_F)^×)² for n ≫ 0, while for p = 2 the transition maps Δ_{n+1}(N) →
  Δ_n(N) need not be injective and Δ_∞(N) is only the kernel above (BHW's proof of Lemma 8.20
  assumes an injection Δ_n(N) → Δ(N) that need not exist; PerfectoidShimuraVarieties/E26). The
  profinite group on the full tower and the finite group on components are different and both
  statements are needed.

  Hypotheses:
  * F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G =
  Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a
  polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅
  T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right
  translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-level-torsors` (theorem)
  Deck groups of the Hilbert towers at Γ₀(pⁿ)-level and the central closure Z_∞

  Statement: For n ∈ ℤ_{≥0} ∪ {∞}: (1) X_{Γ(p^∞)} → X_{Γ₀(pⁿ)} is a pro-étale torsor under Γ₀(pⁿ) ⊆
  GL_2(𝒪_p) (for n = 0: a G(ℤ_p)-torsor over X); (2) X_{G,Γ(p^∞)} → X_{G,Γ₀(pⁿ)} is a pro-étale
  torsor under PΓ₀(pⁿ) := Γ₀(pⁿ)/Z_∞, where Z_∞ is the closure of (1 + N𝒪_F)^× (all units ≡ 1 mod N,
  embedded as scalars) in 𝒪_p^× — the S0 kernel Z_{K^p} ∩ K_p of the G-tower (S0 tower-action-kernel
  with Z = Res_{F/ℚ}G_m); (3) X_{Γ(p^∞)} → X_{G,Γ₀(pⁿ)} is a pro-étale torsor under E(pⁿ) := lim_m
  (Γ̄₀(pⁿ, p^m) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× = (Γ₀(pⁿ) × Δ(p^∞N))/Z_∞ (z ↦ (diag(z, z), z²); the limit
  of the finite-level presentations, the same group as in hilbert-weil-pairing, containing BHW's
  (Γ₀(pⁿ) × 𝒪_F^{×,+})/(1 + N𝒪_F)^× as a dense subgroup), with exact sequences 0 → Γ₀(pⁿ) → E(pⁿ) →
  Δ(N) → 0 and 0 → Δ(p^∞N) → E(pⁿ) → PΓ₀(pⁿ) → 0; (4) all statements restrict to the anticanonical
  loci (ε)_a for n ≥ 1 (not for n = 0: (ε)_a is only Γ₀(p)-stable), the anticanonical locus being
  Δ-stable because the Hasse invariant does not depend on the polarization. BHW's Lemma 9.2 and the
  OverconvergentAutomorphicForms O4 nodes that copy it take Z_∞ to be the closure of (1 +
  N𝒪_F)^{×,+} in '𝒪_p^{×,+}'; the correct group is the closure of (1 + N𝒪_F)^× in 𝒪_p^×
  (PerfectoidShimuraVarieties/E29).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-gl2-qp-action` (construction)
  The action of G(ℚ_p) on the Hilbert towers and the change of polarization module

  Statement: The level-structure action of G(ℤ_p) = GL_2(𝒪_p) on X_{Γ(p^∞)} extends to an
  action of G(ℚ_p) = GL_2(F_p) on the disjoint union ⊔_𝔠 X_{𝔠,Γ(p^∞)} over polarization
  modules: for γ ∈ M_2(𝒪_p) ∩ GL_2(F_p) (after scaling, a scalar x acting by A ↦ A/A[x]), with
  D = ker(γ on A[pⁿ]) for n ≫ 0 transported through λ⁻¹ ∘ α, γ sends (A, ι, λ, μ_N, α) to
  (A/D, ι′, λ′, μ′_N, α′), where φ: A → A/D is the quotient isogeny, λ′ is the unique 𝔠𝔟-
  polarization of A/D compatible with λ, and α′: 𝒪_p² ≅ T_p(A/D)^∨ is the unique isomorphism
  with φ^∨ ∘ α′ = α ∘ γ^∨ (BHW Lemma 8.23; for γ ∈ GL_2(𝒪_p), φ = id and α′ = α ∘ γ^∨).
  Equivalently φ^∨(T_p(A/D)^∨) = α(γ^∨𝒪_p²) ⊆ T_pA^∨. This is a left action: γ·(δ·x) = (γδ)·x.
  Relative to S0, it lies over the right translation by γ^∨ on the arithmetic tower, combined
  with the change of the component of the polarization class; it permutes the X_{𝔠,Γ(p^∞)} and
  does not preserve a fixed 𝔠.

  Hypotheses:
  * F totally real of degree g with ring of integers 𝒪_F, different 𝔡, 𝒪_p = 𝒪_F ⊗ ℤ_p; G =
  Res_{F/ℚ}GL_2, G* = G ×_{Res G_m} G_m; tame level μ_N with N ≥ 4 prime to p and a
  polarization module 𝔠 (BHW §5.1); L ⊇ ℚ_p^cycl perfectoid; levels at p act on α: 𝒪_p² ≅
  T_pA^∨ by α ↦ α ∘ γ^∨, γ^∨ = det(γ)γ⁻¹ (the left action of BHW, equal to the Shimura right
  translation by γ^∨ under the identification λ⁻¹ ∘ (α ⊗ id)).
  * Compatibility with multiplication is only asserted by BHW ('It is clear from this
  characterisation of γ and the contravariance'); it is proved directly below. It cannot be
  read off from the S0 right translations, because the action lives on ⊔_𝔠 X_{𝔠,Γ(p^∞)}, a
  Δ(p^∞N)-torsor over the Shimura tower, not on the Shimura tower itself.

  API:
  * `HilbertTower.qpAction` (constructor): The action of G(ℚ_p) on ⊔_𝔠 X_{𝔠,Γ(p^∞)}.
  * `HilbertTower.qpAction_extends` (compatibility): On G(ℤ_p) it is the level-structure
  action.
  * `HilbertTower.qpAction_polModule` (characterisation): γ maps X_{𝔠} to X_{𝔠𝔟} with 𝔟 the
  product of the elementary divisors of the kernel.
  * `HilbertTower.qpAction_eq_translate` (equivalence): Under the dictionary, it is the S0
  right translation by γ^∨.

  Unit tests:
  * `qpAction_scalar_p` (computation): γ = p·1 sends 𝔠 to p²𝔠.
  * `qpAction_integral` (degenerate): For γ ∈ GL_2(𝒪_p), 𝔟 = 𝒪_F and the action is the level
  action.
  * `qpAction_not_fixed_c` (non-example): For γ = diag(ϖ, 1) with ϖ ∈ F_p^× a local
  uniformizer of valuation 1 at a non-principal prime 𝔭 | p and valuation 0 at the other
  primes above p, the polarization module changes to 𝔠𝔭, in a different narrow class, so the
  action does not preserve X_{𝔠,Γ(p^∞)}.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility` (theorem)
  Period maps, coefficient trivializations and anticanonical domains across the Hilbert towers

  Statement: (1) There are Hodge–Tate period maps X_{Γ*(p^∞)} → X_{Γ(p^∞)} → X_{G,Γ(p^∞)} →
  Res_{𝒪_F|ℤ}ℙ¹ compatible with β₁, β₂: on X_{Γ(p^∞)} the map is (x, u) ↦ diag(u, 1)·π_HT(x) on the
  span of hilbert-mixed-span (BHW's 'projection to the first factor' is not ℤ_p^×-invariant;
  PerfectoidShimuraVarieties/E27), it equals (A, α) ↦ α⁻¹(ker HT_A), is invariant under the
  polarization action (which does not change (A, α)), and descends along the pro-étale
  Δ(p^∞N)-torsor β₂ to the arithmetic tower (this node proves the descent). (2) The coordinate 𝔷 =
  π_HT^*z, the section 𝔰 = π_HT^*s of ω = π_HT^*Res 𝒪(1) with 𝔰(A, α) = HT_A(α(1, 0)), and the
  automorphy factor γ^*𝔰 = (c𝔷 + d)𝔰 extend from X_{Γ*(p^∞)} (γ ∈ Γ*₀(p)) to X_{Γ(p^∞)} (γ ∈ Γ₀(p) ⊆
  GL_2(𝒪_p)), with ω pulled back from X. (3) For every rational prime p unramified in F (including p
  = 2, 3), and for p ramified in F granted the ramified case of the T4 request (BHW's proof of
  Proposition 5.18 uses P¹(𝒪_p ⊗ 𝒪_C) ≅ P¹(𝒪_C)^Σ, which holds only for p unramified in F;
  PerfectoidShimuraVarieties/E36), and the T4 bounds (m ≥ 1, p^{−m} ≤ r < 1, ε ≤ 1/(c_p p^m)), with
  one ε for all 𝔭 | p (the total Hasse invariant): π_HT(X_{Γ*(p^∞)}(ε)_c) ⊆ B_r(1 : p𝒪_p) and
  π_HT(X_{Γ*(p^∞)}(ε)_a) ⊆ B_r(𝒪_p : 1), and the same inclusions hold on X_{Γ(p^∞)}(ε)_a and
  X_{G,Γ(p^∞)}(ε)_a through (1); the canonical and anticanonical domains and their radii are
  compatible with all the comparisons of hilbert-three-towers, hilbert-level-torsors and
  hilbert-polarization-torsors, and the arithmetic unit action and adjugate level convention are
  preserved.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-f-equals-q-check` (comparison)
  The Hilbert towers for F = ℚ are the modular tower

  Statement: For F = ℚ: G* = G = GL_2, Γ* = Γ, Δ(N) = Δ(p^∞N) = Δ_∞(N) = 1, Z_∞ = 1 (N ≥ 3),
  Res_{ℤ|ℤ}ℙ¹ = ℙ¹, e_β is the Weil pairing, and every statement of hilbert-three-towers through
  hilbert-period-and-domain-compatibility specialises to modular-tower-comparison,
  modular-cusp-charts-and-q-action and modular-anticanonical-and-period-compatibility after matching
  tame levels (BHW's μ_N-structures 𝔡⁻¹ ⊗ μ_N ↪ A[N] versus Γ₁(N)-structures on E, through the
  principal polarization E ≅ E^∨ with the sign fixed by the Weil pairing).
-/


/-! ## Contracts for layer S6 -/


/- CONTRACT `PerfectoidShimuraVarieties:S6/kummer-to-v-bridge` (lemma)
  Evaluating the Hodge–Tate torsor on perfectoid test objects over the toroidal tower diamond

  Statement: In the situation of toroidal-tower-diamond (S0.general) and
  HodgeTateAndCanonicalSubgroups T6:comparison: let P_HT ⊆ G_{pet,p} ×^{G^c(ℚ_p)} G^{c,an} be
  the P^c_μ-reduction of the pro-Kummer-étale G^c(ℚ_p)-torsor over S^tor_{K,Σ} given by the
  logarithmic Hodge–Tate filtration. For every perfectoid space S with a map S →
  S^{tor◇}_{K^p,Σ,∞}, there is a P^{c,an}_μ-torsor P_HT(S) ⊆ G^{c,an} × S, functorial in S and
  compatible with base change, which étale-locally on S̃ → S is P^{c,an}_μ · g_{S̃} for an
  element g_{S̃} ∈ G^{c,an}(S̃) unique up to left multiplication by P^{c,an}_μ(S̃); the
  cocycle p₂^*g · (p₁^*g)⁻¹ ∈ P_μ(S̃ ×_S S̃) describes P_HT(S), and right translation g_{S̃} ↦
  g_{S̃}·g by G^{an} carries the embedded reduction P_HT(S) to its translate P_HT(S)·g,
  inducing an isomorphism of the intrinsic P-torsors. This is the passage from the pro-Kummer-
  étale site of S^tor_{K,Σ} to the v-site of the diamond that Boxer–Pilloni §4.6.1 presuppose
  and do not prove.

  Hypotheses:
  * (G, X) an arbitrary pure Shimura datum (Boxer–Pilloni §4: axioms SV1–SV3), K = K^pK_p
  neat, Σ a fixed smooth projective K-admissible cone decomposition used at every level
  K^pK′_p ⊆ K^pK_p, F/ℚ_p finite splitting G with E(G, X) ⊆ F; G^c = G/Z_s(G), where Z_s(G) is
  the largest subtorus of the centre Z(G) which is ℝ-split but contains no ℚ-split subtorus
  (Boxer–Pilloni §4.1.1; Z_s(G) = 1 in the Hodge-type case).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/general-toroidal-period-map` (theorem)
  Boxer–Pilloni's theorem: the Hodge–Tate period map on the general toroidal tower diamond

  Statement: In the situation of kummer-to-v-bridge, the torsor G_{pet,p} is trivial over the
  toroidal tower diamond S^{tor◇}_{K^p,Σ,∞} = lim_{K′_p ⊆ K_p} (S^tor_{K^pK′_p,Σ})^◇ (S0.general
  toroidal-tower-diamond), which gives a K_p-equivariant map of v-sheaves π^tor_HT:
  S^{tor◇}_{K^p,Σ,∞} → FL_{G^c,μ} = P^c_μ\G^c (right action), sending a test object S to the class
  of g_S of kummer-to-v-bridge. The pullback along π^tor_HT of the M^c_μ-torsor U_{P^c_μ}\G^c → FL
  is M^{an}_HT, and M^{an}_HT ≅ (M^{an}_dR ×^{μ, ℤ_p^×} ℤ_p(1)) ×_{S^tor_{K^pK_p,Σ}}
  S^{tor◇}_{K^p,Σ,∞}, the pullback from finite level of the canonical extension of the de Rham Levi
  torsor twisted by the cyclotomic character through μ (Boxer–Pilloni Theorem 4.4.40 in the authors'
  revised form; the arXiv v1 statement omits the twist, PerfectoidShimuraVarieties/E20). On the open
  subdiamond S^◇_{K^p,∞}, π^tor_HT restricts to the Hodge–Tate period map, and for Hodge-type data
  and perfect Σ it is the map of S3 hodge-compactified-period-maps (c). No perfectoidness of the
  toroidal diamond, no affineness of π^tor_HT and no factorisation through a minimal
  compactification are asserted for general data.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/toroidal-hecke-correspondences` (theorem)
  Hecke correspondences on toroidal towers with common cone refinements

  Statement: In the situation of general-toroidal-period-map, for t ∈ G(ℚ_p) and cone decompositions
  Σ, Σ′ for which there is a common refinement Σ″ of the pullbacks along the two degeneracy maps
  (any two admissible cone decompositions have a common refinement; ShimuraCompactifications
  C3.general), there is a correspondence S^tor_{K^pK_p,Σ} ←p₂− S^tor_{K^p(K_p∩tK_pt⁻¹),Σ″} −p₁→
  S^tor_{K^pK_p,Σ′}, a map of pro-Kummer-étale torsors p₁^*G_{pet,p} → p₂^*G_{pet,p} locally
  represented by t, and the induced map p₁^*M^{an}_dR → p₂^*M^{an}_dR of étale torsors, compatible
  with the period maps of the toroidal tower diamonds and, over the tower, with the Hodge–Tate side
  through M^{an}_HT = M^{an}_dR ×^{μ,ℤ_p^×} ℤ_p(1). Bruhat clause: assume moreover (G, X) of abelian
  type, G_{ℚ_p} quasi-split, K_p = K_{p,m′,b′} (m′ > 0, m′ ≥ b′ ≥ 0), 0 ≤ m − n ≤ m′ − 1, F large
  enough as in bruhat-levi-reduction, w ∈ ^MW and t ∈ T(ℚ_p); then over
  p₂⁻¹((π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p)) ∩ p₁⁻¹((π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p)) the
  map p₁^*M^{an}_dR → p₂^*M^{an}_dR, compared through the reductions M_{dR,m,n,K_p} of
  bruhat-levi-reduction, is locally represented by the double coset
  K^c_{p,w,M_μ}M^{1,c}_{μ,m,n}·wtw⁻¹·K^c_{p,w,M_μ}M^{1,c}_{μ,m,n} (Boxer–Pilloni Proposition 4.6.19,
  Lemma 4.6.20). No single Σ admits all correspondences.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data` (construction)
  Auxiliary data for an abelian-type datum: the Hodge-type cover and Lovering's B₁

  Statement: Let (G, X) be of abelian type (ShimuraData:D4/abelian-type): there are a Hodge-
  type datum (G₁, X₁) and a central isogeny G₁^der → G^der inducing (G₁^ad, X₁⁺) ≅ (G^ad, X⁺).
  Let E be the composite of the reflex fields, T = Res_{E/ℚ}G_m, and (Lovering, §4.6) B₁ = G₁
  ×_{G₁^ab} T for the map T → G₁^ab induced by μ_{G₁}, with a datum (B₁, X_{B₁}) and maps (B₁,
  X_{B₁}) → (G₁, X₁), (B₁, X_{B₁}) → (G, X) (through (B, X_B)) inducing isomorphisms on
  derived groups or central isogenies, so that all three share the flag variety FL_{G,μ} =
  FL_{G₁,μ_{G₁}} = FL_{B₁,μ_{B₁}} and the adjoint datum. For a morphism of data g: (H, X_H) →
  (S, X_S) with H^ad = S^ad, compact opens with g(K′) ⊆ K and Σ for S: S(H)_{K′} → S(S)_K is
  finite étale, Σ induces a cone decomposition for H with S^tor(H)_{K′,Σ} → S^tor(S)_{K,Σ}
  finite, and if g(K′) is normal in K the map of neutral components is Galois with finite
  group Δ(K, K′) = Γ^{ad}_K/Γ^{ad}_{K′}, the action extending to S^{tor,0}(H)_{K′,Σ} with
  quotient S^{tor,0}(S)_{K,Σ} (Boxer–Pilloni Proposition 4.4.42).

  Hypotheses:
  * (G, X) of abelian type; neat levels; Σ smooth projective.
  * This is not the pre-abelian representability argument of S4: it uses the Hodge cover G₁
  through a central isogeny of derived groups, Lovering's B₁, Deligne's reconstruction from
  connected components and finite quotients.
  * The existing ShimuraData:D4/central-isogeny-lift supplies a lift through a specified
  central isogeny, not this auxiliary reflex-torus construction. The complete B₁ construction
  and its maps are separately requested below.

  API:
  * `AbelianType.hodgeCover` (data): A Hodge-type datum (G₁, X₁) with G₁^der → G^der a central
  isogeny inducing an isomorphism of adjoint connected data.
  * `AbelianType.lovering` (constructor): B₁ = G₁ ×_{G₁^ab} Res_{E/ℚ}G_m with its datum and
  maps to (G₁, X₁) and (G, X).
  * `AbelianType.flag_eq` (equivalence): FL_{G,μ} = FL_{G₁,μ_{G₁}} = FL_{B₁,μ_{B₁}} through
  the common adjoint group.
  * `AbelianType.deltaGroup` (constructor): Δ(K, K′) = Γ^{ad}_K/Γ^{ad}_{K′} for g(K′) normal
  in K.
  * `AbelianType.neutral_galois` (characterisation): The neutral components form a Galois
  cover with group Δ(K, K′), extending to toroidal compactifications.

  Unit tests:
  * `abelian_aux_hodge_trivial` (degenerate): For the Siegel datum (GSp_2g, H_g^±) with G₁ =
  G: E = ℚ, T = G_m and T → G^ab = G_m is the identity (the similitude of μ(z) is z), so B₁ =
  G; for f = id and K′ = K, Δ(K, K) = 1.
  * `abelian_aux_hilbert` (computation): For G = Res_{F/ℚ}GL_2 and G₁ = G* (both with reflex
  field ℚ, so T = G_m → G₁^ab = G_m is an isomorphism and B₁ = G*), K = K(N) = {g ≡ 1 mod N}
  and K′ = K ∩ G*(𝔸_f): the determinant identifies Δ(K, K′) with (𝒪_F^{×,+} ∩ (1 +
  N𝒪_F))/(𝒪_F^× ∩ (1 + N𝒪_F))², the denominator coming from the scalar matrices in Γ_K.
  * `abelian_aux_not_preabelian_proof` (non-example): A pre-abelian datum that is not of
  abelian type (an isomorphism of adjoint connected data without a central isogeny of derived
  groups) has no B₁ of this form; the construction does not apply.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/torsor-fibre-product` (lemma)
  Fibre products of torsors and the de Rham torsor of B₁

  Statement: (i) Let H₁ → H₂ ← H₃ be smooth affine group schemes over a base S with H₁ → H₂
  smooth and surjective (in the application G₁ → G₁^ab and M_{μ_{G₁}} → M^{ab}_μ), P_{H_i}
  étale torsors and isomorphisms θ₁: P_{H₁} ×^{H₁} H₂ ≅ P_{H₂}, θ₃: P_{H₃} ×^{H₃} H₂ ≅ P_{H₂}.
  Then P_{H₁} ×_{P_{H₂}} P_{H₃} is an étale (H₁ ×_{H₂} H₃)-torsor (Boxer–Pilloni print P_{H₁}
  ×_{P_{H₂}} P_{H₁}; PerfectoidShimuraVarieties/E22). (ii) In the situation of abelian-
  auxiliary-data, for K ⊆ B₁(𝔸_f) and Σ for G₁ there are levels K₁, K₂, K₃ and maps π₁:
  S^tor(B₁)_{K,Σ} → S^tor(G₁)_{K₁,Σ}, π₂: S^tor(B₁)_{K,Σ} → S(T)_{K₂} over S(G₁^ab)_{K₃}, with
  M_dR(B₁) ≅ π₁^*M_dR(G₁) ×_{π₃^*M_dR(G₁^ab)} π₂^*M_dR(T) canonically, and likewise for M_HT;
  with M^c_{μ_{B₁}} = M^c_{μ_{G₁}} ×_{M^{ab,c}_{μ}} T^c, constructions for G₁ extend to B₁ by
  the trivial construction on the zero-dimensional T-Shimura variety (Principle 4.4.44(1)).

  Hypotheses:
  * Smooth surjectivity of H₁ → H₂ is needed: flatness of H₁ ×_{H₂} H₃ does not suffice (for
  H₁ = H₃ = 1, H₂ = G_m and two different trivialisations θ₁, θ₃ of P_{H₂} the fibre product
  is the equaliser of two sections, not a torsor). It holds for G₁ → G₁^ab (quotient by
  G₁^der) and for M_{μ_{G₁}} → M^{ab}_μ (surjective because M_{μ_{G₁}} contains the centre).
  * The compatibility of the c-quotients M^c for B₁ ⊇ Res T is asserted, not proved, in the
  source; a precise central-character calculation or supplier theorem is still required and is
  recorded as a gap.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/abelian-connected-towers-and-descent-group` (theorem)
  Connected towers of abelian-type data: comparison with the Hodge cover and the descent group Δ

  Statement: In the situation of abelian-auxiliary-data: (1) the connected-component towers lim_K
  S⁰(B₁)_K and lim_K S⁰(G₁)_K are canonically isomorphic, also for minimal and (compatible) toroidal
  compactifications; (2) for K^p ⊆ B₁(𝔸_f^p) there is (K^p)′ ⊆ G₁(𝔸_f^p) with a finite étale Galois
  map lim_{K′_p} S⁰(G₁)_{(K^p)′K′_p} → lim_{K_p} S⁰(B₁)_{K^pK_p}; (3) for f: B₁ → G and K ⊆ G(𝔸_f)
  neat there is K′ with S⁰(B₁)_{K′} → S⁰(G)_K finite étale Galois with group Δ(K, K′), and for K^p
  there is (K′)^p with lim_{K′_p} S⁰(B₁)_{(K′)^pK′_p} → lim_{K_p} S⁰(G)_{K^pK_p} finite étale
  Galois; (4) Deligne's reconstruction: S(G, X) = [S⁰(G, X) × 𝒜(G)]/𝒜⁰(G) with 𝒜(G) = G(𝔸_f)/Z(ℚ)⁻
  *_{G(ℚ)_+} G^ad(ℚ)⁺ and 𝒜⁰(G) the completion of G^ad(ℚ)⁺ for the congruence topology of
  G^der(ℚ)_+, the same for minimal compactifications; (5) A⁰(B₁) → A⁰(G) is a continuous surjection
  whose kernel Δ is profinite, and S⁰(B₁) → S⁰(G) is pro-finite-étale Galois with group Δ; at fixed
  levels the finite groups Δ(K, K′) of (3) are used, and Δ = lim Δ(K, K′).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/tilde-limit-components-and-quotients` (lemma)
  Tilde-limits of connected components, finite quotients and induced towers

  Statement: Let (X_i)_{i∈I} be a cofiltered system of separated adic spaces locally of finite type
  over Spa(C, O_C) with finite transition maps, and X a perfectoid space with X ~ lim_i X_i
  (PerfectoidSpaces:P7/perfectoid-tilde-limit), with projections φ_i. (i) Components (Boxer–Pilloni
  Lemma 4.4.6): if every X_i has a finite set Π_i of connected components and Π := lim_i Π_i, then
  for e = (e_i) ∈ Π the subset X_e := ⋂_i φ_i⁻¹(X_{i,e_i}) underlies a perfectoid space, on every
  affinoid perfectoid U ⊆ X the Zariski-closed subspace cut out by the idempotents 1 − ε_i of the
  open and closed subsets U ∩ φ_i⁻¹(X_{i,e_i}), and X_e ~ lim_i X_{i,e_i}. (ii) Finite quotients
  (the tilde-limit half of Boxer–Pilloni Lemma 4.4.7): if a finite group Δ acts compatibly on the
  X_i and on X, and some X_{i₀} has a Δ-stable cover by pregood affinoids (affinoids V whose
  preimages φ_{i₀}⁻¹(V) are good affinoid perfectoids,
  PerfectoidSpaces:P7/good-affinoid-perfectoid), then for i → i₀ the quotients X_i/Δ are adic spaces
  with finite transition maps, X/Δ is a perfectoid space covered by the φ_{i₀}⁻¹(V)/Δ, and X/Δ ~
  lim_i X_i/Δ. (iii) Induction (the step of Boxer–Pilloni Lemma 4.4.50): let H be a profinite group
  with a decreasing sequence of open normal subgroups H_n, ⋂_n H_n = 1, S ⊆ H a closed subgroup, and
  (Y_n)_n a tower as above with Y ~ lim_n Y_n perfectoid, S acting compatibly on Y and on each Y_n
  through S/(S ∩ H_n); put X_n := Y_n ×^{S/(S∩H_n)} (H/H_n), a finite disjoint union of copies of
  Y_n, and X := Y ×^S H. Then X is a perfectoid space, isomorphic to Y × H/S after the choice of a
  continuous section of H → H/S, and X ~ lim_n X_n, compatibly with the right H-actions.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/abelian-minimal-period-map` (theorem)
  The abelian-type minimal-compactification period map

  Statement: Let (G, X) be of abelian type with auxiliary data (G₁, X₁), (B₁, X_{B₁})
  (abelian-auxiliary-data), over C = ℂ_p (ℂ ≅ ℂ_p fixed). Then: (1) there is a perfectoid space
  S̄*(G)_{K^p} ~ lim_{K_p} S*(G)_{K̄^pK_p} (Boxer–Pilloni's image-type compactification, depending
  on the Siegel embedding of G₁, with finite maps S*_K → S*_{K̄} that are isomorphisms away from the
  boundary) and the perfectoid space S*(G)_{K^p} = lim_{K_p} S*^◇(G)_{K^pK_p} (genuine minimal
  compactifications, perfectoid by S4 preabelian-minimal-perfectoid since abelian type is
  pre-abelian); (2) there is a G(ℚ_p)-equivariant, prime-to-p Hecke-equivariant map π_HT:
  S*(G)_{K^p} → S̄*(G)_{K^p} → FL_{G,μ}; (3) S̄*(G)_{K^p} → FL_{G,μ} is affinoid: FL_{G,μ} is
  covered by affinoids whose preimages are good affinoid perfectoid; (4) the maps for B₁, G₁ and G
  form a commutative diagram over FL_{G,μ} = FL_{G₁} = FL_{B₁}, equivariant for B₁(𝔸_f), G₁(𝔸_f),
  G(𝔸_f). This is a period-map theorem for abelian-type data, proved by the Hodge cover, Lovering's
  B₁, Deligne's reconstruction and finite quotients by Δ; it is not the pre-abelian representability
  proof of S4, and for pre-abelian data that are not of abelian type no minimal period map is
  asserted.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/abelian-torsor-descent` (theorem)
  The Levi torsor of an abelian-type datum from its Hodge cover

  Statement: In the situation of abelian-auxiliary-data, for neat K ⊆ G(𝔸_f), K′ ⊆ B₁(𝔸_f)
  with f(K′) normal in K and Σ for G: over the neutral toroidal component S^{tor,0}(G)_{K,Σ},
  the de Rham Levi torsor M_dR(G, X) is the quotient by Δ(K, K′) of M_dR(B₁) ×^{M^c_{μ_{B₁}}}
  M^c_{μ_G} over S^{tor,0}(B₁)_{K′,Σ} (after refining Σ so that S^{tor,0}(B₁)_{K′,Σ} →
  S^{tor,0}(G)_{K,Σ} is finite and generically finite étale with group Δ(K, K′)), and the same
  holds for M_HT on the towers; with the fibre-product description of torsor-fibre-product
  this expresses M_HT(G) through M_HT(G₁) and the torus T.

  Hypotheses:
  * Abelian type; the refinement of Σ is part of the statement (Boxer–Pilloni say 'possibly
  after refining Σ').
  * The necessary triviality of boundary inertia on the pushed-out torsor is a separate
  supplier obligation; generic Galoisness alone is insufficient.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/minimal-toroidal-period-map-compatibility` (theorem)
  Compatibility of the toroidal and minimal period maps for abelian type

  Statement: For (G, X) of abelian type over ℂ_p, the composite S^{tor◇}(G)_{K^p,Σ,∞} → S*(G)_{K^p}
  → FL_{G,μ} of the toroidal-to-minimal map with the minimal period map of
  abelian-minimal-period-map equals π^tor_HT of general-toroidal-period-map. Boxer–Pilloni assert
  this in Theorem 4.4.45 without proof (PerfectoidShimuraVarieties/E23).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/integral-levi-reduction` (theorem)
  Integral structure of the Levi torsor at hyperspecial-type level

  Statement: Assume G_{ℚ_p} quasi-split with a reductive model over 𝒪_F, M^c_μ ⊆ M^{c,an}_μ
  the corresponding quasi-compact open subgroup, and K_p ⊆ G(ℚ_p) ∩ G(𝒪_F). Then the étale
  M^{c,an}_μ-torsor M^{an}_dR over S^tor_{K^pK_p,Σ} (the canonical extension of the de Rham
  Levi torsor; general-toroidal-period-map) has a reduction to an étale M^c_μ-torsor M_dR
  (Boxer–Pilloni Proposition 4.6.3). Over the toroidal tower diamond, M_HT := M_dR ×^{μ,ℤ_p^×}
  ℤ_p(1) is the M^c_μ-reduction of M^{an}_HT = M^{an}_dR ×^{μ,ℤ_p^×} ℤ_p(1) given by integral
  trivialisations (the cyclotomic character through μ lands in M^c_μ since μ(ℤ_p^×) ⊆
  M_μ(𝒪_F)). The twist by ℤ_p(1) exists only over the tower (ℤ_p(1) is pro-étale, not étale,
  over S^tor_{K^pK_p,Σ}), so the descent to finite level is performed on the untwisted M_dR.

  Hypotheses:
  * Abelian type (Boxer–Pilloni §4.5–4.6), quasi-split G_{ℚ_p}, F large enough to split G.
  * The descent uses that the étale torsor M^{an}_dR is already defined at finite level,
  because pro-étale descent is not effective in general (Remark 4.6.5).
  * The quotient used to descend the open reduction is by the effective deck group
  K_p/(Z_{K^p} ∩ K_p). Compatibility of the G^c-torsor with this kernel is the same requested
  logarithmic/effective-deck comparison as in kummer-to-v-bridge.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/bruhat-levi-reduction` (theorem)
  Reduction of the Levi torsor over Bruhat domains

  Statement: Assume G_{ℚ_p} quasi-split with P_μ containing a Borel B over ℚ_p, F/ℚ_p finite
  splitting G with μ over F, a reductive 𝒪_F-model, and K_p = K_{p,m′,b′} (the preimage of B modulo
  p^{m′} and of U modulo p^{b′}, m′ > 0, m′ ≥ b′ ≥ 0). For w ∈ ^MW let K_{p,w,M_μ} be the image of
  wK_pw⁻¹ ∩ P_μ in M_μ (it lies in the Iwahori of M_μ(𝒪_F) and has an Iwahori decomposition N ×
  wT_{b′}w⁻¹ × N̄; Proposition 4.6.9), and for 0 ≤ m − n ≤ m′ − 1 let M¹_{μ,m,n} be the elements of
  M_μ reducing to U_{M_μ} modulo p^{m+ε} for all ε > 0 and to Ū_{M_μ} modulo pⁿ; K_{p,w,M_μ}
  normalises M¹_{μ,m,n} (Lemma 4.6.11). Then, if F is large enough that the composite Gal(F̄/F)
  →^{χ_cycl} ℤ_p^× →^{μ} M^{an}_μ factors through K_{p,w,M_μ}M¹_{μ,m,n}, the torsor M_dR has, over
  (π^tor_{HT,K_p})⁻¹(]C_{w,k}[_{m,n}K_p) ⊆ S^tor_{K^pK_p,Σ}, a reduction M_{dR,m,n,K_p} to an étale
  torsor under K^c_{p,w,M_μ}M^{1,c}_{μ,m,n} (Proposition 4.6.12 in the authors' revised form; arXiv
  v1 reduces M_HT); these reductions are compatible in (m, n, K_p) (Proposition 4.6.14); for m = n
  the pushout M_{dR,n,K_p} := M_{dR,n,n,K_p} ×^{K^c_{p,w,M_μ}M^{1,c}_{μ,n,n}} K^c_{p,w,M_μ}M^c_{μ,n}
  is a torsor under an affinoid group; and for Hodge-type data with perfect Σ, M_{dR,n,K_p} becomes
  trivial over Spa(R, R⁺) ×_{S^tor_{K^pK_p,Σ}} S^tor_{K^pK′_p,Σ} for some K′_p ⊆ K_p, a finite flat
  cover of any pregood affinoid Spa(R, R⁺) (Proposition 4.6.15 in the revised manuscript).
-/
