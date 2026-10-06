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

What is a contract. Shimura varieties, their canonical models and compactifications, adic
spaces, diamonds and perfectoid spaces are not in the pinned libraries; they are supplied by
the roadmaps named in each node's prerequisites (ShimuraVarieties, ShimuraCompactifications,
AdicSpacesPartII, DiamondsAndVStacks, PerfectoidSpaces, HodgeTateAndCanonicalSubgroups,
TorsionCohomologyInfrastructure). Restating them here would invent signatures for objects
another roadmap owns, and a statement over a placeholder type would be hollow. So for every
other node the file gives a CONTRACT comment: the node id, its kind and title, its statement,
each API item under the name the packet gives it (to be declared in the namespace
`TauCeti.<prefix>` once the supplier objects exist) and each unit test under its packet name.
Every definition, API item and unit test of the packet occurs below under its packet name.
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

/-- Cofinality: `⋂ₘ Γ(pᵐ) = 1` inside `GSp_{2g}(ℤ_p)`; with openness of each `Γ(pᵐ)` this is
the cofinality witness asked for by `PerfectoidSpaces:P7/level-cofinality-witness`. -/
theorem levelGamma_cofinal : ⨅ m, levelGamma g p m = ⊥ := sorry

/-- `c(Γ₀(pᵐ)) ⊆ 1 + pᵐ ℤ_p`, and likewise for `Γ(pᵐ)`. -/
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
  of the compactified one to the complements of the boundaries. On C-points, S_{K^pK_p}(C) = G(ℚ)\(X
  × G(𝔸_f)/K^pK_p) through ι and a fixed isomorphism C ≅ ℂ-compatible embedding of Ē (the complex
  uniformisation of ShimuraVarieties:V1/analytic-points).

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
  * `ShimuraTower.points_eq_doubleCoset` (characterisation): S_{K^pK_p}(C) ≅ G(ℚ)\(X ×
      G(𝔸_f)/K^pK_p) through ι and the complex uniformisation, compatibly with transition maps.
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

  Statement: In the situation of p-level-tower, for g ∈ G(ℚ_p) (embedded in G(𝔸_f) with trivial
  prime-to-p component) and K_p ∈ CO_p, the descended right translation T_g: S_{K^pK_p} → S_{K^p
  g⁻¹K_pg} ([x, a] ↦ [x, ag] on C-points; ShimuraVarieties:V8/translation-laws) is an isomorphism,
  extended to S* by ShimuraVarieties:V8/minimal-map-extension. The T_g satisfy T_1 = id, T_{gh} =
  T_h ∘ T_g and π ∘ T_g = T_g ∘ π, and for k ∈ K_p, T_k: S_{K^pK_p} → S_{K^pK_p} is the identity.
  Hence for K'_p normal in K_p the finite group K_p/K'_p acts on S_{K^pK'_p} over S_{K^pK_p}, and
  G(ℚ_p) acts on the right on the pro-system (S_{K^pK_p})_{K_p} (an action in the sense of Deligne
  2.7.1). Prime-to-p Hecke: for h ∈ G(𝔸_f^p) the translations S_{K^pK_p} → S_{h⁻¹K^ph K_p} commute
  with the G(ℚ_p)-action and the transition maps.

  API:
  * `ShimuraTower.translate` (constructor): T_g: S_{K^pK_p} → S_{K^p g⁻¹K_pg} for g ∈ G(ℚ_p).
  * `ShimuraTower.translate_one` (simp): T_1 = id.
  * `ShimuraTower.translate_mul` (simp): T_{gh} = T_h ∘ T_g (right action).
  * `ShimuraTower.translate_of_mem` (simp): T_k = id on S_{K^pK_p} for k ∈ K_p.
  * `ShimuraTower.translate_comm_transition` (functoriality): π ∘ T_g = T_g ∘ π for compatible
      levels.
  * `ShimuraTower.primeToPHecke` (constructor): Translations by h ∈ G(𝔸_f^p), commuting with all T_g
      and transition maps.
  * `ShimuraTower.quotientAction` (constructor): For K'_p ⊴ K_p, the action of K_p/K'_p on
      S_{K^pK'_p} over S_{K^pK_p}.

  Unit tests:
  * `translate_mul_order` (characterisation): For noncommuting g, h ∈ GL_2(ℚ_p), T_{gh} = T_h ∘ T_g
      and in general T_{gh} ≠ T_g ∘ T_h on C-points: the action is a right action.
  * `translate_center_gl2` (computation): For GL_2, N ≥ 3 and z = p·1 ∈ Z(ℚ_p), T_z acts on
      lim_{K_p} S_{K^pK_p}(C) by [x, a] ↦ [x, a z_p] = [x, a (z^p)⁻¹] (z^p = p·1 ∈ G(𝔸_f^p)), which
      is the identity exactly when p ≡ 1 modulo N (for p ≡ −1 modulo N it is T_{−1}, which is not
      the identity since −1 ∉ K(N)^p).
  * `translate_trivial_group` (degenerate): For K_p = K'_p the group K_p/K'_p is trivial and
      quotientAction is the trivial action.
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
  * `infiniteLevel_torus` (computation): For D = (G_m, {±}) style zero-dimensional data,
      |S^◇_{K^p,∞}| is the profinite set lim_{K_p} ℚ_{>0}\𝔸_f^×/K^pK_p ≅ ℤ_p^× (for K^p = Ẑ^{p×}),
      with ℚ_p^× acting through its quotient ℚ_p^×/p^ℤ.
  * `infiniteLevel_not_perfectoid_definition` (non-example): The definition does not make
      S^◇_{K^p,∞} a perfectoid space: for a single level (the constant tower S_{K^pK_p} with
      identity maps, i.e. a non-cofinal family) the limit is the diamond of a rigid space of
      positive dimension, which is not representable by a perfectoid space.
  * `infiniteLevel_space_gl2` (compatibility): For GL_2, |S^{*◇}_{K^p,∞}| is homeomorphic to
      |𝒳*_{Γ(p^∞)}| of Scholze's perfectoid modular curve, base changed to C (Theorem 3.1.2 with g =
      1).
  * `infiniteLevel_singleton_index` (degenerate): If the index family has a least element K_p^0 (a
      non-cofinal family), the limit is S^◇_{K^pK_p^0} itself.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/perfectoid-representative` (definition)
  Perfectoid representatives of a tower

  Statement: Let (Y_i)_{i∈I} be a cofiltered system of analytic adic spaces over Spa(C, O_C) with
  qcqs transition maps (for instance a p-level tower S_{K^pK_p} or S*_{K^pK_p}, or a subsystem of
  opens). A perfectoid representative of (Y_i) is a perfectoid space Y over Spa(C, O_C) with a
  compatible family of maps φ_i: Y → Y_i such that Y ~ lim_i Y_i in the sense of
  PerfectoidSpaces:P7/perfectoid-tilde-limit (Scholze–Weinstein Definition 2.4.1). Equivalently
  (PerfectoidSpaces:P7/represented-functor-comparison) the induced map Y^◇ → lim_i Y_i^◇ is an
  isomorphism of v-sheaves and Y is covered by good affinoid perfectoids
  (PerfectoidSpaces:P7/good-affinoid-perfectoid). A perfectoid representative is unique up to unique
  isomorphism compatible with the φ_i, represents lim_i Hom(−, Y_i) on perfectoid spaces, and is
  functorial in morphisms of systems (PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness). The
  tower is perfectoid if it has a perfectoid representative; this is a property of the diamond lim_i
  Y_i^◇ together with the existence of good affinoid perfectoid charts.

  API:
  * `ShimuraTower.PerfectoidRepresentative` (data): A perfectoid space Y over Spa(C, O_C) with a
      cone φ to the system and Y ~ lim Y_i.
  * `ShimuraTower.PerfectoidRepresentative.diamondIso` (projection): The isomorphism Y^◇ ≅ lim_i
      Y_i^◇.
  * `ShimuraTower.PerfectoidRepresentative.unique` (extensionality): Two representatives are
      uniquely isomorphic compatibly with the cones.
  * `ShimuraTower.PerfectoidRepresentative.lift` (universal-property): A compatible family of maps
      from a perfectoid space Z to the Y_i factors uniquely through Y.
  * `ShimuraTower.PerfectoidRepresentative.map` (functoriality): A morphism of systems induces a
      unique morphism of representatives, with map_id and map_comp.
  * `ShimuraTower.PerfectoidRepresentative.ofDiamondIso` (constructor): From a perfectoid space with
      compatible maps and a diamond isomorphism to the limit, when the transition maps are finite
      (via finite-level affinoid charts).
  * `ShimuraTower.IsPerfectoidTower` (other): The property that a perfectoid representative exists;
      invariant under cofinal reindexing.

  Unit tests:
  * `representative_frobenius_P1` (computation): The tower ℙ¹_C ← ℙ¹_C ← ⋯ with T ↦ T^p has the
      perfectoid projective line as representative.
  * `representative_constant_tower` (non-example): The constant tower Y_i = ℙ¹_C (identity maps) has
      no perfectoid representative, although its diamond limit (ℙ¹_C)^◇ is a spatial diamond: being
      a diamond is not perfectoidness.
  * `representative_compatible_tilde` (compatibility): If Y is a representative, then Y^◇ → lim
      Y_i^◇ is an isomorphism (PerfectoidSpaces:P7/represented-functor-comparison (i)).
  * `representative_perfectoid_constant` (degenerate): A constant tower with a perfectoid space Y_0
      (identity transition maps) has Y_0 as its representative.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/tower-action-kernel` (theorem)
  Effective deck groups: the kernel of the action on the tower

  Statement: In the situation of p-level-tower and tower-right-action, let Z be the centre of G and
  put Z(ℚ)_{K^p} := {z ∈ Z(ℚ) : z^p ∈ K^p}, where z^p ∈ Z(𝔸_f^p) is the prime-to-p component, and
  Z_{K^p} := the closure in G(ℚ_p) of the image of Z(ℚ)_{K^p} under z ↦ z_p. Then: (i) the kernel of
  the right action of G(ℚ_p) on lim_{K_p} S_{K^pK_p}(C), equivalently on |S^◇_{K^p,∞}| and on
  S^◇_{K^p,∞}, is Z_{K^p} = G(ℚ_p) ∩ cl(Z(ℚ)K^p), the closure taken in G(𝔸_f); (ii) for K'_p ⊆ K_p
  normal, the kernel of the action of K_p/K'_p on S_{K^pK'_p} is the image of (Z(ℚ) ∩ K^pK_p)_p in
  K_p/K'_p, and S_{K^pK_p} = S_{K^pK'_p}/(K_p/K'_p); if K^pK_p is neat, S_{K^pK'_p} → S_{K^pK_p} is
  a finite étale Galois cover with group K_p/(K'_p · (Z(ℚ) ∩ K^pK_p)_p); (iii) for K^pK_p neat,
  S^◇_{K^p,∞} → S^◇_{K^pK_p} is a pro-étale torsor under the profinite group K_p/Z_{K^pK_p}, where
  Z_{K^pK_p} = Z_{K^p} ∩ K_p is the closure of (Z(ℚ) ∩ K^pK_p)_p. In particular the tower is a
  K_p-torsor exactly when Z(ℚ) ∩ K^pK_p = {1}, which holds for GL_2 and GSp_2g at level K^p ⊆ K(N)^p
  with N ≥ 3, and fails for Hilbert data, where Z(ℚ) ∩ K^pK_p contains a finite-index subgroup of
  the units ≡ 1 mod N of a totally real field F ≠ ℚ and Z_{K^pK_p} is a nontrivial closed subgroup
  of 𝒪_{F,p}^×.
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
  proper. The full tower is recovered from the neutral one: S^◇_{K^p,∞} ≅ ∐ over the finitely many
  K_p-orbits on π₀ of the induced spaces (S^{0◇}_{K^p,∞} ×^{Stab} K_p), compatibly with the
  K_p-action. When G^der is simply connected and K^pK_p is small, the neutral component at each
  level is the fibre over the class of 1 of the component map of
  ShimuraVarieties:V8/component-reciprocity (Milne, Theorem 5.17); for GL_2 it is the
  fixed-Weil-pairing curve of ShimuraVarieties:V8/gl2-fixed-pairing-fibre, and a compatible system ζ
  of primitive Npᵐ-th roots of unity singles out a connected component of the infinite-level tower.
  For a connected Shimura datum (G, X⁺) and an arithmetic Γ ⊆ G^ad(ℚ)^+ (Hansen–Johansson Definition
  5.17) the same construction with Γ ∩ K_p := Γ ∩ (G(𝔸_f^p)K_p) gives X*_{Γ,∞}(G, X⁺) = lim_{K_p}
  X*_{Γ∩K_p}(G, X⁺)^◇.

  API:
  * `ShimuraTower.neutralComponent` (data): The tower K_p ↦ S⁰_{K^pK_p} with its closures
      S*⁰_{K^pK_p}.
  * `ShimuraTower.neutralComponent.toFull` (projection): The open and closed immersion of towers S⁰
      → S.
  * `ShimuraTower.neutralSymmetry` (data): The closed subgroup Γ̄_{K^p} ⊆ G(ℚ_p) acting on the
      neutral tower.
  * `ShimuraTower.neutralDeckGroup` (characterisation): The deck group of S⁰_{K^pK'_p} → S⁰_{K^pK_p}
      is the image of Γ(K^pK_p) in K_p/K'_p modulo the kernel of tower-action-kernel.
  * `ShimuraTower.fullOfNeutral` (equivalence): S^◇_{K^p,∞} is the finite disjoint union of the
      induced spaces from the neutral tower over the K_p-orbits on π₀.
  * `ShimuraTower.connectedDatumTower` (constructor): For a connected datum (G, X⁺) and arithmetic Γ
      ⊆ G^ad(ℚ)^+, the tower Γ ∩ K_p ↦ X*_{Γ∩K_p}(G, X⁺).
  * `ShimuraTower.neutralComponent_isConnected` (characterisation): Each S*⁰_{K^pK_p} is connected
      and normal, and S⁰_{K^pK_p} is dense in it.

  Unit tests:
  * `neutral_deck_gl2` (computation): For GL_2, K^p = K(N)^p, N ≥ 3, m ≥ 1: the deck group of
      S⁰_{K^pK(pᵐ⁺¹)} → S⁰_{K^pK(pᵐ)} is the kernel of SL_2(ℤ/pᵐ⁺¹) → SL_2(ℤ/pᵐ), of order p³, while
      that of the full tower is of order p⁴.
  * `neutral_full_comparison_count` (compatibility): The number of components of S_{K^pK_p} equals
      the number of K_p-orbits computed by component-set-of-infinite-level times the size of each
      orbit at level K_p; for GL_2 at K(Npᵐ) this is φ(Npᵐ).
  * `neutral_tower_torus` (degenerate): For a torus datum X⁺ is a point, Γ(K^pK_p) is a finite (at
      neat level trivial) group and every S⁰_{K^pK_p} is a point.
  * `neutral_symmetry_not_Gp` (non-example): For GL_2, the element diag(1, u) with u ∈ ℤ_p^× not in
      the closure of ℚ_{>0} p^ℤ-type determinants does not preserve the neutral component of the
      infinite-level tower: the neutral tower is not stable under all of K_p.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S0/rigidified-moduli-tower` (definition)
  Towers retaining a moduli rigidification
  The remaining items of this node; the others are native above.

  API:
  * `ShimuraTower.Rigidified` (data): A tower (M_{K_p}) with a finite group Δ, Δ-invariant finite
      maps to the Shimura tower inducing M_{K_p}/Δ ≅ S_{K^pK_p}, and a lifted right action of H.
  * `ShimuraTower.Rigidified.quotientIso` (projection): The isomorphisms M_{K_p}/Δ ≅ S_{K^pK_p}.
  * `ShimuraTower.Rigidified.infiniteLevel` (data): M^◇_∞ = lim M^◇_{K_p} with its map to
      S^◇_{K^p,∞}.
  * `ShimuraTower.Rigidified.isTorsor_of_free` (characterisation): If Δ acts freely at each level,
      M^◇_∞ → S^◇_{K^p,∞} is a Δ-torsor.
  * `ShimuraTower.Rigidified.quotient_infiniteLevel` (characterisation): For a good tower M, M^◇_∞/Δ
      ≅ S^◇_{K^p,∞}.
  * `ShimuraTower.Rigidified.trivial` (constructor): The tower itself with Δ = 1.

  Unit tests:
  * `rigidified_trivial_delta` (degenerate): With Δ = 1, M = S and the quotient isomorphism is the
      identity.
  * `rigidified_not_shimura_kernel` (non-example): For the Hilbert G*-tower, the kernel of the
      action on the infinite level is not the closure of 𝒪_F^× ∩ K computed for the G-tower by
      tower-action-kernel: an element of the closure of the units acts on the G*-tower through the
      polarization change, i.e. through Δ, and trivially only on the quotient.
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

  Statement: Let D be a pure Shimura datum, K^p ⊆ G(𝔸_f^p) neat, K_p ∈ CO_p and Σ a
  K^pK_p-admissible (smooth, projective) cone decomposition (ShimuraCompactifications
  C0–C3.general). For K'_p ⊆ K_p, Σ is K^pK'_p-admissible, and the toroidal compactifications
  S^tor_{K^pK'_p,Σ} over C (analytified base changes of the canonical models of
  ShimuraCompactifications C2.general) with the proper transition maps S^tor_{K^pK''_p,Σ} →
  S^tor_{K^pK'_p,Σ} of ShimuraCompactifications C3.general form a tower with the same Σ at every
  level. Put S^{tor◇}_{K^p,Σ,∞} := lim_{K'_p ⊆ K_p} (S^tor_{K^pK'_p,Σ})^◇, a spatial diamond with
  |S^{tor◇}_{K^p,Σ,∞}| ≅ lim |S^tor_{K^pK'_p,Σ}|, containing S^◇_{K^p,∞} as the open complement of
  the boundary and mapping to S^{*◇}_{K^p,∞}. Deck actions: K_p acts on the tower (k ∈ K_p preserves
  Σ because Σ is K_p-stable), compatibly with the action on S^◇_{K^p,∞}; an element g ∈ G(ℚ_p)
  outside K_p maps the tower for Σ to the tower for gΣ, and two cone decompositions are compared
  through a common refinement Σ'' and the proper refinement maps, which are isomorphisms over
  S^◇_{K^p,∞}. Hecke correspondences for g ∈ G(ℚ_p) are formed on a common refinement of Σ and gΣ.

  API:
  * `ShimuraTower.toroidal` (data): The tower K'_p ↦ S^tor_{K^pK'_p,Σ} for K'_p ⊆ K_p with fixed Σ.
  * `ShimuraTower.toroidalInfiniteLevel` (data): The diamond S^{tor◇}_{K^p,Σ,∞} = lim
      (S^tor_{K^pK'_p,Σ})^◇.
  * `ShimuraTower.toroidalInfiniteLevel_isSpatial` (characterisation): It is a spatial diamond with
      |·| = lim |S^tor|.
  * `ShimuraTower.toroidalInfiniteLevel.openEmbedding` (projection): S^◇_{K^p,∞} ⊆
      S^{tor◇}_{K^p,Σ,∞} as the complement of the boundary.
  * `ShimuraTower.toroidalInfiniteLevel.toMin` (projection): The map to S^{*◇}_{K^p,∞}.
  * `ShimuraTower.toroidalInfiniteLevel.deck` (instance): The action of K_p, compatible with the
      action on the open part.
  * `ShimuraTower.toroidalInfiniteLevel.refine` (functoriality): For a refinement Σ'' of Σ, the map
      S^{tor◇}_{Σ''} → S^{tor◇}_{Σ}, an isomorphism over the open part, with identity and
      composition laws.
  * `ShimuraTower.toroidalInfiniteLevel.translate` (functoriality): For g ∈ G(ℚ_p), the isomorphism
      from the tower for Σ to the tower for gΣ, compared with the K_p-action on common refinements.

  Unit tests:
  * `toroidal_g1_equals_minimal` (compatibility): For the modular-curve datum the toroidal tower
      diamond equals S^{*◇}_{K^p,∞}.
  * `toroidal_refinement_iso_open` (characterisation): For a refinement Σ'' of Σ the map of toroidal
      diamonds is an isomorphism over S^◇_{K^p,∞} and not over the boundary (it blows up boundary
      strata) when Σ'' ≠ Σ and dim ≥ 2.
  * `toroidal_single_level` (degenerate): Restricted to the one-element family {K_p}, the limit is
      (S^tor_{K^pK_p,Σ})^◇.
  * `toroidal_hecke_needs_refinement` (non-example): For the Siegel datum with g = 2 and g = diag(p,
      p, 1, 1) the translate gΣ of a Γ(p)-admissible Σ is in general not a refinement of Σ: a Hecke
      correspondence on the fixed-Σ tower does not exist without passing to a common refinement.
-/


/-! ## Contracts for layer S1 -/


/- CONTRACT `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces` (construction)
  The Siegel spaces of the construction: integral models, Hasse domains and finite-level adic spaces

  Statement: Fix g ≥ 1, p and K^p as in the hypotheses. Let X = X_{g,K^p} be the moduli scheme over
  ℤ_(p) of principally polarized abelian schemes of dimension g with level-K^p structure
  (PELModuli:M5/siegel-moduli), X* its minimal compactification over ℤ_(p) with ample line bundle ω
  (Faltings–Chai; ShimuraCompactifications C5), normal with normal geometric fibres and boundary of
  codimension g, and X* = Proj ⊕_k H⁰(X, ω^{⊗k}) when g ≥ 2. Let 𝔛 ⊆ 𝔛* be the p-adic completions of
  X ⊗ ℤ_p^cycl ⊆ X* ⊗ ℤ_p^cycl, 𝔄 → 𝔛 the universal abelian scheme, and Ha ∈ H⁰(X*_{𝔽_p},
  ω^{⊗(p−1)}) the Hasse invariant (HodgeTateAndCanonicalSubgroups T0). For 0 ≤ ε < 1, the Hasse
  domain 𝔛*(ε) → 𝔛* is the formal model of AdicSpacesPartII:R2/hasse-domain for (𝔛*, ω, Ha): it
  represents pairs (f, u) with u·Ha(f̄) = p^ε modulo u ~ u(1 + p^{1−ε}h), locally Spf((R ⊗̂
  ℤ_p^cycl)⟨u⟩/(uH̃a − p^ε)); it is an open formal subscheme of an admissible blow-up of 𝔛* (not
  itself an admissible blow-up; PerfectoidShimuraVarieties/E3), and 𝔛(ε), 𝔄(ε) are its pullbacks,
  with generic fibre 𝒳*(ε) = {|Ha| ≥ |p|^ε}. For K_p ⊆ GSp_2g(ℤ_p) compact open with c(K_p) = 1 +
  pᵐℤ_p (as for Γ₀(pᵐ), Γ₁(pᵐ), Γ(pᵐ)), X*_{K_pK^p} (the minimal compactification of the
  level-K_pK^p Siegel variety, the normalisation of X* in X_{K_pK^p}) lives over ℚ(ζ_{pᵐ}) through
  the similitude factor (the Weil pairing), and 𝒳*_{K_p} is the adic space over Spa(ℚ_p^cycl,
  ℤ_p^cycl) of its base change along ℚ(ζ_{pᵐ}) → ℚ_p^cycl for a fixed compatible system of p-power
  roots of unity (so 𝒳*_{K_p} is a union of components of the base change to ℚ_p^cycl of the S0
  tower: the fixed-similitude part); 𝒳_{K_p} ⊆ 𝒳*_{K_p} the preimage of 𝒳 (the good-reduction locus,
  not the open Shimura variety), 𝒵_{K_p} the boundary, and 𝒳*_{K_p}(ε) the preimage of 𝒳*(ε). These
  are the finite levels of the p-level tower of S0 for the Siegel datum, base changed to ℚ_p^cycl.

  API:
  * `SiegelTorsion.integralMin` (data): The p-adic formal scheme 𝔛* over ℤ_p^cycl with ω and the
      Hasse invariant.
  * `SiegelTorsion.hasseDomain` (constructor): 𝔛*(ε) → 𝔛*, with pullbacks 𝔛(ε), 𝔄(ε).
  * `SiegelTorsion.hasseDomain_generic` (simp): The generic fibre of 𝔛*(ε) is {|Ha| ≥ |p|^ε} ⊆ 𝒳*.
  * `SiegelTorsion.finiteLevel` (data): 𝒳*_{K_p}, 𝒳_{K_p} (good reduction locus) and 𝒵_{K_p} for
      compact open K_p.
  * `SiegelTorsion.finiteLevel_hasse` (projection): 𝒳*_{K_p}(ε) := preimage of 𝒳*(ε).
  * `SiegelTorsion.finiteLevel_eq_tower` (compatibility): 𝒳*_{K_p} ⊗ C = S*_{K^pK_p} of
      PerfectoidShimuraVarieties:S0/p-level-tower for the Siegel datum.
  * `SiegelTorsion.hasseDomain_mono` (functoriality): For ε' ≤ ε, 𝒳*(ε') ⊆ 𝒳*(ε), with the
      transition maps of AdicSpacesPartII:R2/hasse-domain-transition-maps.

  Unit tests:
  * `hasseDomain_zero_ordinary` (computation): 𝒳*(0) = {|Ha| = 1} is the tube of the ordinary locus
      of X*_{𝔽_p}; for g = 1 it contains every cusp.
  * `goodReduction_ne_open` (non-example): For g = 1, K_p = Γ(p) and a supersingular point, its
      preimage in 𝒳_{Γ(p)} is nonempty, but a point of the open modular curve with multiplicative
      reduction lies in the open Shimura variety and not in 𝒳_{Γ(p)}: 𝒳_{K_p} is the good-reduction
      locus, not X_{K_pK^p}^{an}.
  * `hasseDomain_not_blowup` (non-example): 𝔛*(ε) → 𝔛* is not proper for ε > 0 (its generic fibre is
      the proper open subset {|Ha| ≥ |p|^ε}), so it is not an admissible blow-up, only an open
      subscheme of one.
  * `finiteLevel_trivial_level` (degenerate): For K_p = GSp_2g(ℤ_p), 𝒳*_{K_p} is the generic fibre
      of 𝔛* and 𝒳_{K_p} = 𝒳.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/frobenius-diagram-mod-p` (lemma)
  The Frobenius diagram modulo p on Hasse domains

  Statement: Let 0 ≤ ε < 1. The relative Frobenius maps of 𝔄(p⁻¹ε)/p, 𝔛(p⁻¹ε)/p and 𝔛*(p⁻¹ε)/p over
  ℤ_p^cycl/p, followed by the natural isomorphisms (𝔜(p⁻¹ε)/p)^{(p)} ≅ 𝔜(ε)/p (𝔜 = 𝔄, 𝔛, 𝔛*), form a
  natural commutative diagram F: 𝔄(p⁻¹ε)/p → 𝔄(ε)/p over F: 𝔛(p⁻¹ε)/p → 𝔛(ε)/p over F: 𝔛*(p⁻¹ε)/p →
  𝔛*(ε)/p.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift` (theorem)
  Canonical Frobenius lifts on Hasse domains

  Statement: Let 0 ≤ ε < 1/2. There is a unique diagram of p-adic formal schemes F̃: 𝔄(p⁻¹ε) → 𝔄(ε),
  𝔛(p⁻¹ε) → 𝔛(ε), 𝔛*(p⁻¹ε) → 𝔛*(ε), compatible with the projections, in which F̃_𝔄 is an isogeny of
  principally polarised abelian schemes with level structure over F̃_𝔛, that reduces modulo p^{1−ε}
  to the diagram of frobenius-diagram-mod-p (uniqueness holds among such isogeny diagrams; bare
  Frobenius lifts of 𝔛(p⁻¹ε) are not unique). On 𝔛(p⁻¹ε), F̃ sends A to A/C, where C ⊆ A[p] is the
  canonical subgroup of level 1 (it exists because Ha^p divides p^ε there). The maps F̃_{𝔛(p⁻¹ε)}
  and F̃_{𝔄(p⁻¹ε)} are finite, and after inverting p they are finite étale of degrees p^{g(g+1)/2}
  and p^{g(g+1)/2+g}; for 0 < ε they are not flat integrally.
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
  * `anticanonical_not_affinoid_m0` (non-example): For m = 0 and g ≥ 2, 𝒳*(ε) need not be affinoid;
      affinoidness is asserted only for m large.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid` (theorem)
  The anticanonical tower at Γ₀(p^∞)-level is perfectoid and its tilt is a perfection

  Statement: Let 0 ≤ ε < 1/2. There are unique perfectoid spaces 𝒳_{Γ₀(p^∞)}(ε)_a, 𝒳*_{Γ₀(p^∞)}(ε)_a
  and 𝒜_{Γ₀(p^∞)}(ε)_a over ℚ_p^cycl with 𝒳_{Γ₀(p^∞)}(ε)_a ~ lim_m 𝒳_{Γ₀(pᵐ)}(ε)_a and likewise for
  the other two (tilde-limits in the sense of PerfectoidSpaces:P7/perfectoid-tilde-limit). The tilt
  of 𝒳*_{Γ₀(p^∞)}(ε)_a is naturally the open subset 𝒳′*^{perf}(ε) ⊆ 𝒳′*^{perf} where |Ha| ≥ |t|^ε,
  and the tilt of 𝒜_{Γ₀(p^∞)}(ε)_a is 𝒜′^{perf}(ε); here the primed spaces are the Siegel spaces
  over 𝔽_p((t^{1/(p−1)p^∞})) = (ℚ_p^cycl)^♭, t^♯ = p up to a unit, and ^{perf} is the perfection of
  PerfectoidSpaces:P7/perfection-tilde-limit.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/gamma0-boundary-strongly-zariski-closed` (theorem)
  At Γ₀(p^∞)-level the anticanonical piece is affinoid perfectoid with strongly Zariski closed
  boundary

  Statement: For 0 ≤ ε < 1/2, 𝒳*_{Γ₀(p^∞)}(ε)_a is affinoid perfectoid, and its boundary
  𝒵_{Γ₀(p^∞)}(ε)_a ⊆ 𝒳*_{Γ₀(p^∞)}(ε)_a is strongly Zariski closed
  (PerfectoidSpaces:P4/strongly-zariski-closed-immersion: R → S surjective, R⁺ → S⁺ almost
  surjective, S⁺ the integral closure of the image).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/frobenius-trace-estimates` (theorem)
  Trace estimates for Frobenius-type extensions on Hasse domains

  Statement: (i) (Lemma 3.2.21) Let R be a p-adically complete flat ℤ_p-algebra, Y_1, …, Y_n ∈ R,
  P_1, …, P_n ∈ R⟨X_1, …, X_n⟩ topologically nilpotent and S = R⟨X⟩/(X_i^p − Y_i − P_i). Then S is
  finite free over R with basis X^{i} (0 ≤ i_j ≤ p − 1), and tr_{S/R}(S) ⊆ Iⁿ for I = (p, I_1, …,
  I_n), I_i the ideal generated by the coefficients of P_i. (ii) (Corollary 3.2.22) Let R be a
  p-adically complete ℤ_p-algebra topologically of finite type and formally smooth of dimension n, f
  ∈ R with f̄ ∈ R/p a nonzerodivisor, R_ε = (R ⊗̂_{ℤ_p} ℤ_p^cycl)⟨u_ε⟩/(f u_ε − p^ε) for 0 ≤ ε < 1,
  and φ: R_ε → R_{ε/p} a ℤ_p^cycl-algebra map that is, modulo p^{1−ε}, Frobenius on R̄ and u_ε ↦
  u_{ε/p}^p. If ε < 1/2 then φ[1/p] is finite flat and the trace tr: R_{ε/p}[1/p] → R_ε[1/p] maps
  R_{ε/p} into p^{n−(2n+1)ε} R_ε.
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

  Statement: Assume g ≥ 2. Let X^{ord*} ⊆ X* ⊗ 𝔽_p be the affine locus where Ha is invertible,
  X^{ord} its intersection with X ⊗ 𝔽_p, D_m^{ord} → X^{ord} the quotient of the pᵐ-torsion by its
  canonical subgroup, X^{ord}_{Γ₁(pᵐ)} → X^{ord} the finite scheme of isomorphisms D_m^{ord} ≅
  (ℤ/pᵐ)^g and X^{ord*}_{Γ₁(pᵐ)} = Spec H⁰(X^{ord}_{Γ₁(pᵐ)}, 𝒪) (normal, finite over X^{ord*}). Let
  𝒳′*_{Γ₁(pᵐ)}(ε) be the locus |Ha| ≥ |t|^ε in the adic space of X^{ord*}_{Γ₁(pᵐ)} ⊗
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
  𝒳*_{Γ₁(pᵐ)}(ε)_a (Proposition 3.2.34). For g = 1 the corresponding statements are obtained
  directly (the boundary is a finite set of cusps).
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
  T_pA ⊗ K ≅ K^{2g}.

  API:
  * `SiegelTorsion.htMapTop` (constructor): |π_HT|: |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| → |Fl|.
  * `SiegelTorsion.htMapTop_apply` (simp): On a (K, K⁺)-point (A, α), |π_HT| is the Hodge–Tate
      filtration α(Lie A ⊗ K(1)) ⊆ K^{2g}.
  * `SiegelTorsion.htMapTop_continuous` (characterisation): |π_HT| is continuous.
  * `SiegelTorsion.htMapTop_equivariant` (functoriality): |π_HT|(x·γ) = |π_HT|(x)·γ for γ ∈
      GSp_2g(ℚ_p), with the right action on Fl compatible with S0's right action on the tower.
  * `SiegelTorsion.points_infiniteLevel` (characterisation): 𝒳*_{Γ(p^∞)}(K, K⁺) = lim_m
      𝒳*_{Γ(pᵐ)}(K, K⁺), and |𝒳*_{Γ(p^∞)}| is the colimit over (K, K⁺) with unique minimal
      representatives.

  Unit tests:
  * `htMapTop_ordinary_rational` (computation): For g = 1 and an ordinary E over 𝒪_C, |π_HT|(E, α) ∈
      ℙ¹(ℚ_p), equal to the line α(T_p(E[p^∞]^{mult}) ⊗ C).
  * `htMapTop_supersingular_drinfeld` (computation): For g = 1 and E supersingular, |π_HT|(E, α) ∉
      ℙ¹(ℚ_p).
  * `htMapTop_not_defined_boundary` (non-example): |π_HT| is not defined at boundary points by this
      formula (there is no abelian variety there); the extension over 𝒵 is
      siegel-hodge-tate-period-map, proved with goodness of the boundary.
  * `htMapTop_isotropic` (compatibility): The image lies in the Lagrangian Grassmannian: the
      Hodge–Tate filtration is totally isotropic for the Weil pairing, so |π_HT| lands in Fl ⊆ Gr(g,
      2g) (Mathlib Module.Grassmannian for the ambient Grassmannian).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/rational-flags-preimage` (theorem)
  The closure of the ordinary locus is the preimage of the ℚ_p-rational flags

  Statement: The preimage of Fl(ℚ_p) under |π_HT| is the closure of |𝒳*_{Γ(p^∞)}(0)| ∖
  |𝒵_{Γ(p^∞)}(0)| (Lemma 3.3.6), the closure of a retrocompact open, i.e. its set of
  specialisations; once π_HT is extended over the boundary, the preimage of Fl(ℚ_p) is the closure
  of 𝒳*_{Γ(p^∞)}(0) (Lemma 3.3.19), and the preimage of Fl_{g+1,…,2g}(ℚ_p) is the closure of
  𝒳*_{Γ(p^∞)}(0)_a (Lemma 3.3.20; the open-part analogue is Lemma 3.3.14). Here Fl_{g+1,…,2g}(ℚ_p)
  parametrises the totally isotropic direct summands M ⊆ ℤ_p^{2g} with M ⊕ (ℤ_p^g ⊕ 0) = ℤ_p^{2g}.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/translates-cover-tower` (theorem)
  Finitely many GSp_2g(ℚ_p)-translates of a Hasse neighbourhood cover the tower

  Statement: (Lemma 3.3.8) For 0 < ε < 1 there is an open U ⊆ Fl containing Fl(ℚ_p) with |π_HT|⁻¹(U)
  ⊆ |𝒳*_{Γ(p^∞)}(ε)| ∖ |𝒵_{Γ(p^∞)}(ε)|. (Lemma 3.3.9) Every open U ⊆ Fl containing a ℚ_p-rational
  point satisfies GSp_2g(ℚ_p)·U = Fl. (Lemma 3.3.10) For 0 < ε < 1 there are γ_1, …, γ_k ∈
  GSp_2g(ℚ_p) with |𝒳*_{Γ(p^∞)}| ∖ |𝒵_{Γ(p^∞)}| = ⋃_i γ_i·(|𝒳*_{Γ(p^∞)}(ε)| ∖ |𝒵_{Γ(p^∞)}(ε)|).
  (Lemma 3.3.11) With the same γ_i, |𝒳*_{Γ(p^∞)}| = ⋃_i γ_i·|𝒳*_{Γ(p^∞)}(ε)|.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space` (theorem)
  The minimally compactified Siegel tower at Γ(p^∞)-level is perfectoid

  Statement: There is a perfectoid space 𝒳*_{Γ(p^∞)} over ℚ_p^cycl with 𝒳*_{Γ(p^∞)} ~ lim_m
  𝒳*_{Γ(pᵐ)}; for every 0 < ε < 1/2 it is covered by finitely many GSp_2g(ℚ_p)-translates of the
  affinoid perfectoid 𝒳*_{Γ(p^∞)}(ε)_a, and it is a perfectoid representative (S0
  perfectoid-representative) of the tower (𝒳*_{Γ(pᵐ)})_m, hence of the full p-level tower by
  cofinality of Γ(pᵐ) (S0 siegel-level-subgroups). Its boundary 𝒵_{Γ(p^∞)} carries the induced
  perfectoid structure.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map` (construction)
  The Siegel Hodge–Tate period map as a map of adic spaces, extended over the boundary

  Statement: There is a unique map of adic spaces π_HT: 𝒳*_{Γ(p^∞)} ∖ 𝒵_{Γ(p^∞)} → Fl over ℚ_p
  realising |π_HT| (Corollary 3.3.13). For every open U ⊆ Fl containing Fl(ℚ_p) there is ε > 0 with
  𝒳*_{Γ(p^∞)}(ε) ∖ 𝒵_{Γ(p^∞)}(ε) ⊆ π_HT⁻¹(U) (Lemma 3.3.15), and there is 0 < ε < 1/2 with
  𝒳*_{Γ(p^∞)}(ε)_a ∖ 𝒵_{Γ(p^∞)}(ε)_a ⊆ π_HT⁻¹(Fl_{g+1,…,2g}) (Lemma 3.3.16). π_HT extends uniquely
  to a GSp_2g(ℚ_p)-equivariant map of adic spaces π_HT: 𝒳*_{Γ(p^∞)} → Fl (Corollary 3.3.17). The
  action convention: GSp_2g(ℚ_p) acts on 𝒳*_{Γ(p^∞)} on the right (S0 tower-right-action) and on Fl
  through the corresponding action on flags of ℚ_p^{2g}; the conventions of S3 (FL = P_μ\G, BP's x ↦
  x⁻¹) are compared there.

  API:
  * `SiegelTorsion.htMap` (constructor): π_HT: 𝒳*_{Γ(p^∞)} → Fl, a map of adic spaces over ℚ_p.
  * `SiegelTorsion.htMap_top` (compatibility): The underlying continuous map on the complement of
      the boundary is |π_HT| of continuous-hodge-tate-map.
  * `SiegelTorsion.htMap_unique` (extensionality): Any two maps of adic spaces 𝒳*_{Γ(p^∞)} → Fl
      agreeing on the complement of the boundary are equal.
  * `SiegelTorsion.htMap_equivariant` (functoriality): π_HT ∘ γ = γ ∘ π_HT for γ ∈ GSp_2g(ℚ_p), with
      the right-action convention.
  * `SiegelTorsion.htMap_anticanonical` (characterisation): For small ε > 0, π_HT(𝒳*_{Γ(p^∞)}(ε)_a)
      ⊆ Fl_{g+1,…,2g}.
  * `SiegelTorsion.htMap_neighbourhood` (characterisation): For every open U ⊇ Fl(ℚ_p) there is ε >
      0 with 𝒳*_{Γ(p^∞)}(ε) ⊆ π_HT⁻¹(U) away from the boundary.

  Unit tests:
  * `htMap_g1_cusps_rational` (computation): For g = 1, the image of every cusp of 𝒳*_{Γ(p^∞)} is a
      point of ℙ¹(ℚ_p).
  * `htMap_anticanonical_chart` (computation): For g = 1 and small ε, π_HT(𝒳*_{Γ(p^∞)}(ε)_a) ⊆ {|x|
      ≤ 1}-type chart Fl_{2} of ℙ¹ (the chart J = {2}).
  * `htMap_not_finite_level` (non-example): π_HT does not factor through any finite level
      𝒳*_{Γ(pᵐ)}: the fibres of 𝒳*_{Γ(p^∞)} → 𝒳*_{Γ(pᵐ)} are Γ(pᵐ)-orbits, on which π_HT is the
      nonconstant Γ(pᵐ)-action on flags.
  * `htMap_equivariant_center` (degenerate): Scalars z ∈ ℚ_p^× ⊆ GSp_2g(ℚ_p) act trivially on Fl, so
      π_HT is invariant under the central action.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/siegel-main-theorem` (theorem)
  Scholze's theorem for Siegel varieties: affinoid perfectoid flag charts and strongly Zariski
  closed boundary

  Statement: For every tame level K^p ⊆ GSp_2g(𝔸_f^p) contained in {γ ∈ GSp_2g(Ẑ^p) : γ ≡ 1 mod N}
  for some N ≥ 3 prime to p, there is a perfectoid space 𝒳*_{Γ(p^∞),K^p} over ℚ_p^cycl, unique up to
  unique isomorphism, with 𝒳*_{Γ(p^∞),K^p} ~ lim_m 𝒳*_{Γ(pᵐ),K^p}, a GSp_2g(ℚ_p)-action (which does
  not preserve the structure map to Spa(ℚ_p^cycl): it acts on ℚ_p^cycl through the similitude factor
  and the cyclotomic character), and a GSp_2g(ℚ_p)-equivariant map of adic spaces π_HT:
  𝒳*_{Γ(p^∞),K^p} → Fl over ℚ_p. (i) For every J ⊆ {1, …, 2g} containing exactly one of i and g + i
  for each i (so that the coordinate g-plane indexed by J is Lagrangian; these 2^g sets give
  affinoids Fl_J covering Fl), the preimage 𝒱_J = π_HT⁻¹(Fl_J) = Spa(R_{J,∞}, R_{J,∞}⁺) is affinoid
  perfectoid, is the preimage of an affinoid 𝒱_{J,m} = Spa(R_{J,m}, R_{J,m}⁺) ⊆ 𝒳*_{Γ(pᵐ),K^p} for
  all large m, and R_{J,∞}⁺ is the p-adic completion of colim_m R_{J,m}⁺. (ii) 𝒵_{Γ(p^∞),K^p} ∩ 𝒱_J
  ⊆ 𝒱_J is strongly Zariski closed. The published statement of (i) quantifies over all J of
  cardinality g; for non-Lagrangian J, Fl_J is not of the required form and the proof does not apply
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

  Statement: Let 𝒳_{Γ(p^∞),K^p} := 𝒳*_{Γ(p^∞),K^p} ∖ 𝒵_{Γ(p^∞),K^p}, the open perfectoid Siegel
  tower (the perfectoid representative of the open Siegel tower over ℚ_p^cycl with fixed similitude
  system), with the right action of GSp_2g(ℤ_p)-subgroups and of GSp_2g(ℚ_p) (siegel-main-theorem).
  For every compact open K ⊆ GSp_2g(ℤ_p) with c(K) = 1 + pᵐℤ_p containing some Γ(pⁿ) (in particular
  the strict Iwahori level K_{Iw⁺} := {γ ∈ GSp_2g(ℤ_p) : γ mod p lies in the diagonal torus T(𝔽_p)
  and c(γ) ≡ 1 mod p}, the inverse image of the full diagonal torus modulo p with similitude 1), the
  projection 𝒳_{Γ(p^∞),K^p} → 𝒳^{an}_{K,K^p} (the open Siegel variety at level KK^p, base changed to
  ℚ_p^cycl) is a pro-étale torsor under the profinite group K (its kernel Z(ℚ) ∩ K^pK is trivial
  because N ≥ 3: S0 tower-action-kernel), and 𝒳^{an}_{K,K^p} is the quotient 𝒳_{Γ(p^∞),K^p}/K in the
  sense that its diamond is the v-sheaf quotient of the diamond of the tower by K. The strict
  Iwahori quotient is defined group-theoretically through K_{Iw⁺}, not by choosing g subgroups of
  order p (which does not determine it: OverconvergentAutomorphicForms sourceIssue E-O8-1).

  API:
  * `SiegelTorsion.openTower` (data): 𝒳_{Γ(p^∞),K^p} = 𝒳*_{Γ(p^∞),K^p} ∖ 𝒵_{Γ(p^∞),K^p}.
  * `SiegelTorsion.strictIwahori` (constructor): K_{Iw⁺} as the inverse image of the diagonal torus
      (with similitude 1) modulo p.
  * `SiegelTorsion.openTower_torsor` (characterisation): 𝒳_{Γ(p^∞),K^p} → 𝒳_{K,K^p} is a pro-étale
      K-torsor for K ⊇ Γ(pⁿ) with c(K) = 1 + pᵐℤ_p.
  * `SiegelTorsion.openTower_quotient` (equivalence): (𝒳_{Γ(p^∞),K^p})^◇/K ≅ 𝒳_{K,K^p}^◇.
  * `SiegelTorsion.openTower_action` (instance): The right action of GSp_2g(ℚ_p), restricted to K by
      K-translations of the torsor.

  Unit tests:
  * `strictIwahori_quotient_g1` (computation): For g = 1, K_{Iw⁺}/Γ(p) ≅ 𝔽_p^× via diag(a, a⁻¹) ↦ a.
  * `strictIwahori_not_subgroups` (non-example): For g = 2, prescribing two order-p subgroups (the
      coordinate lines of the first two basis vectors modulo p) defines a level containing
      non-diagonal unipotent elements modulo p, strictly larger than K_{Iw⁺}: the group-theoretic
      definition is required.
  * `openTower_trivial_quotient` (degenerate): For K = Γ(pⁿ) the torsor statement is the
      Γ(pⁿ)-torsor 𝒳_{Γ(p^∞)} → 𝒳_{Γ(pⁿ)}.
  * `openTower_kernel_trivial` (compatibility): K acts freely: the kernel computed by
      PerfectoidShimuraVarieties:S0/tower-action-kernel is trivial for N ≥ 3.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S1/elliptic-cusps-at-infinite-level` (theorem)
  The perfectoid modular curve at the cusps: Tate-curve parameter spaces at infinite level

  Statement: Let g = 1, N ≥ 3 prime to p, X* the compactified modular curve over a perfectoid K ⊇
  ℚ_p(μ_{p^∞}) of tame level Γ^p with Γ(N) ⊆ Γ^p ⊆ GL_2(ℤ/N), and x a cusp of X* with field L_x and
  width e_x, with its analytic Tate-curve parameter space D_x ↪ X* (the open disc |q| < 1 with the
  cusp at q = 0; Heuer Lemma 2.9). Let D_{∞,x} be the open subspace |q| < 1 of Spa(L_x⟨q^{1/p^∞}⟩,
  𝒪_{L_x}⟨q^{1/p^∞}⟩), a perfectoid tilde-limit of the discs D_{n,x} with coordinate q^{1/pⁿ}, with
  𝒪⁺(D_∞) = 𝒪_L[[q^{1/p^∞}]] (completed). Then: (1) there is a Cartesian tower Γ₀(p^∞) × D_{∞,x} →
  ℤ_p^× × D_{∞,x} → D_{∞,x} → D_x over 𝒳*_{Γ(p^∞)}(ε)_a → 𝒳*_{Γ₁(p^∞)}(ε)_a → 𝒳*_{Γ₀(p^∞)}(ε)_a →
  𝒳*(ε), with Γ₀(p^∞) = upper triangular matrices in GL_2(ℤ_p) (as a profinite perfectoid space),
  the top-left map sending (a b; 0 d) to d; the cusp obtained by specialising at (a b; 0 d)
  corresponds to the basis (q^{d/p^∞}, ζ_{p^∞}^a q^{−b/p^∞}) of T_pT(q); (2) with the right action
  of ℤ_p on GL_2(ℤ_p) × D_{∞,x}, (γ, q^{1/pⁿ})·h = (γ(1 0; h 1), q^{1/pⁿ}ζ_{pⁿ}^{h/e_x}), the
  quotient (GL_2(ℤ_p) × D_{∞,x})/ℤ_p exists as a perfectoid space and there is a Cartesian square
  with D_x → X* whose left map (GL_2(ℤ_p) × D_{∞,x})/ℤ_p → 𝒳*_{Γ(p^∞)} is a GL_2(ℤ_p)-equivariant
  open immersion; (3) π_HT restricts to the locally constant map (γ = (a b; c d), q) ↦ (b : d) ∈
  ℙ¹(ℤ_p). This is the local perfectoid q-disc construction at elliptic cusps that the Siegel
  argument (Hartogs, codimension ≥ 2) does not provide for g = 1.
-/


/-! ## Contracts for layer S2 -/


/- CONTRACT `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison` (construction)
  The symplectic embedding and the comparison of finite levels with their Siegel images

  Statement: Let (G, X) be of Hodge type with a fixed embedding ι: (G, X) ↪ (G′, X′) = (GSp_2g,
  H_g^±) and reflex field E. For compact open K ⊆ G(𝔸_f) and K′ ⊆ G′(𝔸_f) with K = K′ ∩ G(𝔸_f), ι
  induces finite morphisms Sh_K(G, X) → Sh_{K′}(G′, X′) ⊗_ℚ E and Sh*_K(G, X) → Sh*_{K′}(G′, X′) ⊗_ℚ
  E of canonical models and of their minimal compactifications over E, compatible with level maps
  and right translations; for every K there is such a K′ (which may be taken in any prescribed
  neighbourhood basis) for which Sh_K → Sh_{K′} ⊗ E is a closed immersion (Deligne, Travaux de
  Shimura, Proposition 1.15, descended to E by the canonical-model property), and then the boundary
  of the image of Sh*_K is the intersection of the image with the boundary of Sh*_{K′} (the extended
  map preserves interiors and boundaries). The tame-level hypothesis of Scholze (K^p inside the
  level-N subgroup of G′(𝔸_f^p), N ≥ 3 prime to p) is a choice of such K′^p.

  API:
  * `HodgeTower.embedding` (data): The fixed embedding ι: (G, X) ↪ (GSp_2g, H_g^±).
  * `HodgeTower.toSiegel` (constructor): The finite map Sh*_K(G, X) → Sh*_{K′}(G′, X′) ⊗ E for K =
      K′ ∩ G(𝔸_f).
  * `HodgeTower.toSiegel_isClosedImmersion` (characterisation): On open parts, a closed immersion
      for all sufficiently small K′ with K = K′ ∩ G(𝔸_f).
  * `HodgeTower.toSiegel_boundary` (characterisation): The preimage of the Siegel boundary is the
      boundary of Sh*_K.
  * `HodgeTower.toSiegel_comp` (functoriality): Compatibility with level maps and right translations
      by G(𝔸_f) ⊆ G′(𝔸_f).
  * `HodgeTower.toSiegel_finite` (characterisation): The map of minimal compactifications is finite.

  Unit tests:
  * `toSiegel_identity` (degenerate): For ι = id on the Siegel datum, toSiegel is the identity at
      every level.
  * `toSiegel_hilbert` (computation): For F real quadratic and the trace embedding, the image of the
      Hilbert modular surface in the Siegel threefold is the Humbert surface of discriminant d_F.
  * `toSiegel_not_closed_large_level` (non-example): For K′ = GSp_4(Ẑ)-type maximal level, the map
      from the Hilbert modular surface is generically 2 : 1 onto its image (the Galois involution of
      F/ℚ), so the closed-immersion statement needs K′ small.
  * `toSiegel_points` (compatibility): On ℂ-points the map is [x, a] ↦ [ι(x), ι(a)] between the
      double-coset descriptions of ShimuraVarieties:V1/analytic-points.
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
  * `imageCompactification_curve` (computation): For a one-dimensional Hodge-type datum (a Shimura
      curve or the modular curve), minToImage is an isomorphism.
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
  equivalently S^◇_{K^p,∞} is representable by a perfectoid space. Over E_p, the same holds for the
  tower (S_{K^pK_p} ⊗_E E_p)^{ad} with a perfectoid space over E_p in the sense of a perfectoid
  space mapping to Spa E_p (Caraiani–Scholze Theorem 2.1.2).
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
  compactified Siegel tower lim_{K_p} 𝒮*^◇_{K^pK_p} over C is a perfectoid space, covered by
  finitely many GSp_2g(ℚ_p)-translates of affinoid perfectoid subsets 𝒮*_{K^p}(ε)_a ⊆ 𝒮*_{K^p}(ε′)_a
  (0 < ε < ε′ < 1/2) with the closure of the first contained in the second, each pulled back from a
  finite level.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower` (theorem)
  The genuine minimally compactified Hodge-type tower is perfectoid and a good tower

  Statement: Let (G, X) be of Hodge type with reflex field E, Sh*_K(G, X) the canonical normal
  projective minimal compactification over E, 𝔭 | p a prime of E with completion E_𝔭, and 𝒳*_K the
  associated rigid spaces over E_𝔭. For any compact open K^p ⊆ G(𝔸_f^p): (a) 𝒳*_{K^p} := lim_{K_p}
  𝒳*^◇_{K^pK_p} is a perfectoid space; (c) it is analytically separated; (d) it has two coverings by
  finitely many open affinoid perfectoids U_i ⊆ V_i with the closure of U_i in V_i, each pulled back
  from an open affinoid of some 𝒳*_{K^pK_p}; (e) hence for every cofinal system of K_p ⊆ G(ℚ_p),
  (𝒳*_{K^pK_p})_{K_p} is a good tower over E_𝔭 (PerfectoidSpaces:P8/good-tower). The same holds over
  C after base change (good-tower-base-change). The identification with the diamond limit is the
  only limit statement: whether 𝒳*_{K^p} ~ lim 𝒳*_{K^pK_p} in the sense of Scholze–Weinstein is not
  known (Boxer–Pilloni §4.4.27). The Hodge–Tate period map on this tower is S3's
  (hodge-type-compactified-period-maps), not part of this theorem.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S2/hodge-good-tower-arbitrary-level` (theorem)
  Good towers at arbitrary (non-product) levels

  Statement: For (G, X) of Hodge type, any compact open K ⊆ G(𝔸_f) (not necessarily of the form
  K^pK_p) and any cofinal system of compact open K_p ⊆ G(ℚ_p), the tower (𝒳*_{K∩K_p})_{K_p} is a
  good tower over E_𝔭, where H ∩ K_p := {h ∈ H : h_p ∈ K_p} = H ∩ (G(𝔸_f^p)K_p).
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

  Statement: For (G, X) of Hodge type and K^p as in hodge-image-compactified-tower, the finite maps
  Sh*_K → X^{*̲}_K of image-compactification induce a G(ℚ_p)-equivariant quasicompact map 𝒳*_{K^p} →
  𝒳^{*̲}_{K^p} of perfectoid spaces over C, which is an isomorphism over the open tower S_{K^p}
  (hodge-open-perfectoid-tower) and maps boundary to boundary. Whether it is an isomorphism is not
  known in general and is not asserted.
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

  Statement: Let G be a reductive group over a field F of characteristic 0 (or a p-adic field) with
  a cocharacter μ defined over F. The Hodge–Tate flag variety is FL_{G,μ} := P_μ\G, with G acting by
  right translation; its analytification over a p-adic field is FL^{an}. The quotient U_{P_μ}\G →
  P_μ\G is a right M_μ-torsor (M_μ acting through P_μ/U_{P_μ} ≅ M_μ by left multiplication twisted
  to a right action m·(U x) = U m⁻¹ x), G-equivariant for right translation. Dictionary: Scholze's
  and Caraiani–Scholze's flag variety G/P_μ with left G-action is identified with P_μ\G by gP_μ ↦
  P_μ g⁻¹; for the Siegel datum, BP26's convention is π_HT(A, Ψ) = P·g(Ψ)⁻¹ where Ψ(g(Ψ)⟨e_{g+1}, …,
  e_{2g}⟩) = Lie A(1), and Scholze's Fl (Lagrangian subspaces W ⊆ ℚ_p^{2g}) corresponds to W =
  g(Ψ)⟨e_{g+1}, …, e_{2g}⟩. The universal P_μ-torsor over FL is G → FL, x ↦ P_μ x (a right
  P_μ-torsor after x ↦ x⁻¹), and G-equivariant vector bundles on FL attached to P_μ-representations
  V are G ×^{P_μ} V; for representations inflated from M_μ they are the bundles associated with
  U_{P_μ}\G.

  API:
  * `HodgeTate.FL` (data): FL_{G,μ} = P_μ\G with the right G-action.
  * `HodgeTate.leviTorsor` (constructor): U_{P_μ}\G → FL as a G-equivariant right M_μ-torsor.
  * `HodgeTate.FL_equivLeftFlag` (equivalence): G/P_μ ≅ P_μ\G, gP_μ ↦ P_μg⁻¹, exchanging left and
      right actions.
  * `HodgeTate.associatedBundle` (constructor): For a P_μ-representation V, the G-equivariant bundle
      G ×^{P_μ} V on FL; for V inflated from M_μ it is leviTorsor ×^{M_μ} V.
  * `HodgeTate.associatedBundle_tensor` (structure): The associated-bundle functor is exact and
      tensor.
  * `HodgeTate.FL_siegel` (compatibility): For GSp_2g with μ = diag(t·1_g, 1_g), FL is the
      Lagrangian Grassmannian, compared with Scholze's Fl by W ↔ P·g⁻¹ with W = g⟨e_{g+1}, …,
      e_{2g}⟩.

  Unit tests:
  * `FL_gl2_P1` (computation): For GL_2 and μ = diag(t, 1), FL_{G,μ} ≅ ℙ¹ and the right action of g
      = (a b; c d) on the chart point P·(1 z; 0 1)-type coordinate is the Möbius action z ↦ (az +
      c)/(bz + d) (transpose form of the left action).
  * `FL_trivial_mu` (degenerate): For μ central, P_μ = G, FL is a point and the Levi torsor is G\G =
      point with M_μ = G.
  * `FL_left_right_inverse` (non-example): The identity map G/P_μ → P_μ\G does not exist (different
      quotients); using gP ↦ Pg instead of Pg⁻¹ is not equivariant: it turns the left action into a
      right action of the opposite group.
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

  Statement: Let W ⊆ 𝒪_Fl^{2g} be the universal totally isotropic subbundle and ω_Fl = (∧^g W)^∨.
  (v) Over the open perfectoid Siegel tower 𝒳_{Γ(p^∞),K^p} there is a natural
  GSp_2g(ℚ_p)-equivariant isomorphism Lie A ⊗ 𝒪(1) ≅ π_HT^*W, equivalently π_HT^*(𝒪^{2g}/W) ≅
  ω_{A^∨} through the Hodge–Tate map (the canonical, twist-free form), and π_HT^*W^∨ ≅ ω_A(−1);
  Scholze states Lie A ≅ π_HT^*W after suppressing Tate twists over ℚ_p^cycl, i.e. after
  trivialising ℤ_p(1) by the fixed compatible system ζ_{p^∞}, a trivialisation that GSp_2g(ℚ_p)
  moves through the similitude character. (vi) Over the whole minimally compactified tower
  𝒳*_{Γ(p^∞),K^p}, with ω the Hodge line bundle pulled back from finite level, there is a natural
  GSp_2g(ℚ_p)-equivariant isomorphism ω ≅ π_HT^*ω_Fl (with the same twist convention), extending the
  dual top exterior power of (v); both isomorphisms are compatible with change of tame level and
  prime-to-p Hecke operators.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/siegel-graph-chart-and-frame` (construction)
  Siegel graph charts, strict-Iwahori stable domains and the Hodge–Tate frame
  The remaining items of this node; the others are native above.

  API:
  * `HodgeTate.siegelGraphChart` (data): The affinoid chart of Fl given by row spaces of (1 Z), Z
      symmetric, and its sub-affinoids Fl^×(r).
  * `HodgeTate.siegelGraphChart_stable` (characterisation): Fl^×(r) is stable under K_{Iw⁺}.
  * `HodgeTate.hodgeFrame` (constructor): The frame s of π_HT^*W^∨ by the first g coordinate
      sections, with the fixed Tate trivialisation.
  * `HodgeTate.hodgeFrame_transform` (relation): γ^*s = s·(A + ZC) over π_HT⁻¹(Fl^×(r)), and the
      cocycle relation (A + ZC)_{γγ′} = (A + ZC)_γ (A′ + (Z·γ)C′).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-open-period-map` (theorem)
  The Hodge-type period map on the open perfectoid tower

  Statement: Let (G, X) be of Hodge type and S_{K^p} the open perfectoid tower (S2
  hodge-open-perfectoid-tower), over E_𝔭 or C. Then there is a G(ℚ_p)-equivariant Hodge–Tate period
  map π_HT: S_{K^p} → FL_{G,μ} (right convention of levi-torsor-over-flag-variety), equivariant for
  the prime-to-p Hecke action of G(𝔸_f^p) with trivial action on FL, independent of the symplectic
  embedding, and compatible with the Siegel period map: the composite S_{K^p} → (Siegel open tower)
  → FL_{GSp,μ̃} is FL_{G,μ} ↪ FL_{GSp,μ̃} ∘ π_HT. On points it sends (A, tensors s_α, a
  trivialisation of T_pA respecting the s_{α,p}) to the Hodge–Tate filtration as a P_μ-coset.
  Construction: the pro-étale G(ℚ_p)-torsor of tensor-preserving trivialisations V_p ⊗ 𝒪̂ ≅ V ⊗ 𝒪̂
  has a canonical section over the tower, and its P_μ-reduction P_p by the Hodge–Tate filtration
  (HodgeTateAndCanonicalSubgroups T2, Caraiani–Scholze Lemmas 2.3.6–2.3.7) defines the map.
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
  after twisting by the Tate weight: f_p(V) ≅ f_∞(V)(−⟨μ, κ⟩) on the summand of central μ-weight κ;
  the isomorphism is independent of the Siegel embedding and equivariant for the prime-to-p Hecke
  action. Over the tower the twist can be trivialised by the similitude level structure, but that
  trivialisation is not G(ℚ_p)-equivariant.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-period-map-datum-functoriality` (theorem)
  Functoriality of the Hodge-type period map in morphisms of Shimura data

  Statement: Let f: (G₁, X₁) → (G₂, X₂) be a morphism of Hodge-type Shimura data, K₁^p, K₂^p with
  f(K₁^p) ⊆ K₂^p sufficiently small, and f̃: S_{K₁^p} → S_{K₂^p} the induced G₁(ℚ_p)-equivariant map
  of open perfectoid towers (S0 functoriality of canonical models through the diamond limits). Then
  π_HT,₂ ∘ f̃ = FL(f) ∘ π_HT,₁, where FL(f): FL_{G₁,μ₁} → FL_{G₂,μ₂} is induced by f (f(P_{μ₁}) ⊆
  P_{μ₂}). The identity datum morphism gives the identity, and composition is respected.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps` (theorem)
  The Hodge-type period map on the image and genuine minimal compactifications and on perfect
  toroidal towers

  Statement: Let (G, X) be of Hodge type. (a) On Scholze's image-compactified tower 𝒳^{*̲}_{K^p} (S2
  hodge-image-compactified-tower) there is a G(ℚ_p)-equivariant map π_HT: 𝒳^{*̲}_{K^p} → FL_{G,μ},
  pulled back from the Siegel period map through FL_{G,μ} ↪ FL_{GSp,μ̃} (Zariski closed); it is
  affinoid (FL_{G,μ} has a cover by affinoids whose preimages are good affinoid perfectoid),
  compatible with tame level and prime-to-p Hecke operators, and ω ≅ π_HT^*ω_Fl (Scholze Theorem
  4.1.1(iii)–(v)). (b) On the genuine minimally compactified tower 𝒳*_{K^p} (S2
  hodge-genuine-minimal-perfectoid-tower), π_HT is the composite 𝒳*_{K^p} → 𝒳^{*̲}_{K^p} → FL_{G,μ}.
  (c) For a perfect cone decomposition Σ (a cofinal class, Lan), 𝒳^{tor}_{K^p,Σ} ~ lim
  𝒳^{tor}_{K^pK_p,Σ} is perfectoid with a closed immersion into a Siegel toroidal tower, π_HT^{tor}
  is the composite with the map to the minimal compactification, the pullback of the Levi torsor is
  M_dR ×^{μ,ℤ_p^×} ℤ_p(1) pulled back from finite level (Boxer–Pilloni Proposition 4.4.29, after
  Esnault–Harris), and these isomorphisms are compatible with the G(𝔸_f)-action on the limit over
  K^p and Σ. The three compactified towers are distinct: the auxiliary normalised models of
  hodge-tate-formal-models are a fourth object, only their generic fibres being minimal
  compactifications.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/hodge-tate-formal-models` (theorem)
  Auxiliary normalised formal models with ample Hodge line and Hodge–Tate sections

  Statement: Siegel case (Pilloni–Stroh, author's version, Théorème 1.22, after Scholze's proof of
  Theorem 4.3.1, pp. 1029–1030): let n₀ be the least integer > g/(p − 1) (n₀ = 2g + 1 if p = 2). For
  n ≥ n₀ there are normal admissible formal models 𝔛(pⁿ)^{⋆−mod} → 𝔛(pⁿ)^{⋆−HT} of the minimal
  compactification 𝒳(pⁿ)^⋆ of the level-Γ(pⁿ)K^p Siegel variety (over 𝒪_{ℂ_p}), the first a
  normalised blow-up on which det ω^{mod} (the subsheaf of det ω generated by Λ^g HT_n, with
  cokernel killed by p^{g/(p−1)}, resp. 4^g for p = 2) is invertible, the second covered by the
  affine formal schemes Spf H⁰(𝔘_i(pⁿ), 𝒪) for the Lagrangian Plücker charts i; for some k ≥ 1,
  det^k ω^{mod} descends to an ample invertible sheaf on 𝔛(pⁿ)^{⋆−HT}, and there are sections t_j of
  det^k ω^{mod} modulo p^{n₀−g/(p−1)} (modulo p^{n₀−2g} if p = 2) congruent to the k-th powers of
  the Plücker coordinates of Λ^g HT; the transition maps 𝔛(pⁿ)^{⋆−HT} → 𝔛(p^m)^{⋆−HT} are finite and
  everything is functorial in n and K^p. Scholze's own version gives, for each n, a level K_p and
  sections modulo pⁿ. Hodge type (Pilloni–Stroh Proposition 2.5): the normalisation of the schematic
  closure of the Hodge-type minimal compactification in the Siegel model, with the same ampleness
  and sections; the Hilbert–Siegel case is Boxer–Calegari–Gee–Pilloni §6.2.1. These are auxiliary
  normalised compactifications: only their generic fibres are the canonical minimal
  compactifications; they carry no semi-abelian scheme, boundary stratification or ordinary locus
  (Pilloni–Stroh Remarque 1.26). The stronger form used by Pilloni (§12.9.1) and
  Boxer–Calegari–Gee–Pilloni (§6.2.1), with det ω^{mod} itself descending and sections congruent
  modulo p^ε for every ε > 0 once n ≥ n(ε), is not proved in the cited sources (Pilloni–Stroh
  Remarque 1.23 states the descent of det ω^{mod} without proof); the consumers' arguments go
  through with a power of det ω^{mod} and sections modulo a fixed p^{ε′}
  (PerfectoidShimuraVarieties/E32).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1` (theorem)
  The elliptic period map: quotient-line description, π_HT^*𝒪(1) = ω and the automorphy factor cz +
  d

  Statement: Let 𝒳*_{Γ(p^∞)} be the perfectoid modular curve (g = 1 of S1) over a perfectoid L ⊇
  ℚ_p^cycl, with points (E, μ_N-level, α: ℤ_p² ≅ T_pE) and BHW's left action γ·(E, α) = (E, α ∘
  γ^∨), γ^∨ = det(γ)γ⁻¹ (the right action of S0 composed with γ ↦ γ^∨⁻¹-type conversion). (i) The
  C-points of the total space of 𝒪(1) over ℙ¹ are pairs (L, y) of a line L ⊆ C² and y ∈ C²/L, and
  π_HT^*𝒪(1) ≅ ω is the quotient-line identification C²/L ≅ ω_E through HT ∘ α (HT: T_pE → ω_E, L =
  ker(HT ∘ α)); this form needs no Tate trivialisation. (ii) The section s: (x : y) ↦ (C² → C²/⟨(x,
  y)⟩, image of (1, 0)) of 𝒪(1) is nowhere zero off ∞ = (1 : 0); for γ = (a b; c d) ∈ Γ₀(p) one has
  γ^*s = (cz + d)s, where z is the coordinate of (z : 1); hence 𝔰 := π_HT^*s satisfies γ^*𝔰 = (c𝔷 +
  d)𝔰 on the anticanonical locus and 𝔰(E, α) = HT(α(e_1)). (iii) In Pan's normalisation (V = ℚ_p²
  the standard representation, Tate module V(1) = V^∨), the relative Hodge–Tate sequence is 0 →
  ω⁻¹(1) → V(1) ⊗ 𝒪 → ω → 0, the position of ω⁻¹ defines π_HT: 𝒳 → ℙ¹, and the tautological ample
  ω_Fl pulls back to ω(−1). (iv) Unlike the complex case (γ^*η_can = (cz + d)⁻¹η_can, trivialising
  ω_E), the p-adic section trivialises ω_{E^∨} and transforms with (cz + d).
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
  The Hilbert period map to Res_{𝒪_F/ℤ}ℙ¹, its factors after splitting, and descent to Res GL_2

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
  components z_v have no such interpretation. (iv) For G = Res_{F/ℚ}GL_2 (abelian type), the period
  maps of the G*-tower, the intermediate tower and the G-tower commute with the tower maps, and the
  map from the intermediate tower is invariant under the polarization action of 𝒪_F^{×,+} (BHW Lemma
  8.28), so π_HT descends to the G-tower.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety` (lemma)
  A basis of affinoids of the flag variety with affinoid perfectoid preimages from finite level

  Statement: For the Siegel datum (and, by pullback along hodge-compactified-period-maps (a), for
  Hodge-type data), there is a basis 𝔅 of open affinoid subsets of Fl, stable under finite
  intersections, such that for every U ∈ 𝔅 the preimage V_∞ = π_HT⁻¹(U) ⊆ 𝒳*_{Γ(p^∞)} is affinoid
  perfectoid, is the preimage of an affinoid V_{K_p} ⊆ 𝒳*_{K_pK^p} for all sufficiently small K_p,
  and colim_{K_p} H⁰(V_{K_p}, 𝒪) → H⁰(V_∞, 𝒪) has dense image. For g = 1 one may take 𝔅 = finite
  intersections of rational subsets of U₁ = {|x| ≤ 1} and U₂ = {|x| ≥ 1}.
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
  K_p ⊆ G(ℚ_p) compact open; for G semisimple this agrees with Hansen–Johansson's Γ ⊆ G^ad(ℚ)^+
  (with K_p ⊆ G^ad(ℚ_p)) because Γ\X⁺ depends only on the image of Γ in G^ad and π(Γ ∩ π⁻¹K′_p) =
  π(Γ) ∩ K′_p.

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
  * `propertyP_not_open_only` (non-example): Perfectoidness of the open towers 𝒳_{K^p}(G, X) does
      not give Property 𝒫: Property 𝒫 is a statement about the minimal compactifications, and the
      open part is not quasicompact.
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

  Statement: For (GL_2, ℍ^±), tame level K^p = K(N)^p (or a Γ₁(N)-type level) with N ≥ 3 prime to p,
  and K_p = K(pᵐ): the S0 tower over C is identified with the analytified full-level modular curves
  of ShimuraVarieties:V8/gl2-full-level (moduli of (E, P, Q) with an ordered full Npᵐ-basis),
  compatibly with level maps and Hecke correspondences (V8/gl2-tower-compatibility); its
  infinite-level diamond is represented by Scholze's perfectoid modular curve (S1, g = 1), whose (R,
  R⁺)-points for perfectoid (R, R⁺) are triples (E, tame level, α: ℤ_p² ≅ T_pE). Under this
  identification the right translation by u ∈ GL_2(ℤ_p) is α ↦ α ∘ u, and BHW's left action γ·α = α
  ∘ γ^∨ is the right translation by γ^∨ = det(γ)γ⁻¹. Components: π₀ of the infinite-level tower is
  ℤ_p^× × (ℤ/N)^×-torsor-type set identified through the Weil pairing with compatible systems of
  primitive Npᵐ-th roots of unity (V8/gl2-determinant-pairing), the fibre over a fixed compatible
  system ζ is the fixed-pairing tower of V8/gl2-fixed-pairing-fibre (connected at each level), and
  its deck group over level K(p) is the image of SL_2-type congruence subgroups, while GL_2(ℤ_p)
  acts on π₀ through det. The tower is a GL_2(ℤ_p)-torsor over the level-GL_2(ℤ_p) curve because
  Z(ℚ) ∩ K = {1} for N ≥ 3 (S0 tower-action-kernel).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/modular-cusp-charts-and-q-action` (comparison)
  Completed cusp charts of the perfectoid modular curve and the action on q-parameters

  Statement: For a cusp x of the compactified modular curve X* of tame level Γ^p (Γ(N) ⊆ Γ^p, N ≥ 3)
  with Tate parameter D_x and width e_x, the cusp chart of S1 elliptic-cusps-at-infinite-level is
  identified with the formal Tate-curve neighbourhood of the finite-level comparison
  (ShimuraVarieties:V8/gl2-cusps-tate, ShimuraCompactifications:C6/modular-formal-cusp-comparison):
  at level Γ₀(pⁿ) ∩ anticanonical, the chart is D_n with q^{1/pⁿ} the Tate parameter of the
  anticanonical quotient, and at infinite level (GL_2(ℤ_p) × D_{∞,x})/ℤ_p. The action of Γ₀(p) on
  the charts at Γ₀(p^∞)-level is through (Γ₀(p) × D_∞)/pℤ_p = Γ₀(p^∞) × D_∞ with the right action of
  h ∈ pℤ_p by (γ, q^{1/p^m}) ↦ (γ(1 0; h 1), ζ_{p^m}^{h/e_x} q^{1/p^m}) (Heuer Proposition 3.19),
  i.e. the lower unipotent N⁻(pⁿℤ_p) (not a quotient Γ₀(pⁿ)/Γ₀(p^∞), which is not a group) acts on
  q-roots by p-power roots of unity, with ζ fixed by the Weil pairing; consequently the
  Γ₀(pⁿ)-invariant bounded functions on the chart over x are 𝒪_L[ζ_d][[q^{1/pⁿ}]] (BHW Proposition
  3.8). The Hodge–Tate period map is locally constant on the charts, (a b; c d), q ↦ (b : d) ∈
  ℙ¹(ℤ_p).
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

  Statement: In the setting of the hypotheses, for n ∈ ℤ_{≥0} let X_{Γ*(pⁿ)} (G*-level: α_n with
  similitude in (ℤ/pⁿ)^×, relative to a chosen generator β of 𝔠𝔡⁻¹(1)), X_{Γ(pⁿ)} (the intermediate
  space: the G*-variety X with a full G-level α_n: (𝒪_F/pⁿ)² ≅ A^∨[pⁿ], polarization λ fixed) and
  X_{G,Γ(pⁿ)} (the arithmetic G-variety, polarization class [λ] = 𝒪_F^{×,+}λ) be the finite-level
  spaces of HilbertModularVarietiesAndShimuraCurves H3–H4, with maps X_{Γ*(pⁿ)} →β₁ X_{Γ(pⁿ)} →β₂
  X_{G,Γ(pⁿ)} over X = X → X_G. Their infinite-level diamonds X_{Γ*(p^∞)}, X_{Γ(p^∞)}, X_{G,Γ(p^∞)}
  (S0 infinite-level-diamond; X_{Γ(p^∞)} is the S0 rigidified moduli tower of the G*-datum with
  G-level) are perfectoid: X_{Γ*(p^∞)} by S2 (Hodge type, G* = PEL), X_{Γ(p^∞)} by
  hilbert-mixed-span, X_{G,Γ(p^∞)} by S4 (G is of abelian type) or as the quotient of X_{Γ(p^∞)} by
  Δ(p^∞N) (hilbert-polarization-torsor). Actions: the level-structure action of G(ℤ_p) = GL_2(𝒪_p)
  on X_{Γ(p^∞)} by α ↦ α ∘ γ^∨ (a pro-étale G(ℤ_p)-torsor over X), of G*(ℤ_p) on X_{Γ*(p^∞)}, and
  the polarization action of 𝒪_F^{×,+} on X_{Γ(p^∞)} by λ ↦ ηλ.

  API:
  * `HilbertTower.geometric` (data): X_{Γ*(p^∞)} with its G*(ℤ_p)-action.
  * `HilbertTower.intermediate` (data): X_{Γ(p^∞)} with the level-structure action of GL_2(𝒪_p) and
      the polarization action of 𝒪_F^{×,+}.
  * `HilbertTower.arithmetic` (data): X_{G,Γ(p^∞)} with the induced action.
  * `HilbertTower.beta1` (projection): β₁: X_{Γ*(p^∞)} → X_{Γ(p^∞)}, the inclusion of the
      similitude-ℤ_p^× locus.
  * `HilbertTower.beta2` (projection): β₂: X_{Γ(p^∞)} → X_{G,Γ(p^∞)}, forgetting λ up to 𝒪_F^{×,+}.
  * `HilbertTower.levelAction` (instance): The left level-structure action α ↦ α ∘ γ^∨, equal to the
      S0 right translation by γ^∨.
  * `HilbertTower.polAction` (instance): The polarization action η·(A, λ, α) = (A, ηλ, α), commuting
      with the level action.
  * `HilbertTower.isPerfectoid` (characterisation): All three diamonds are perfectoid.

  Unit tests:
  * `three_towers_F_eq_Q` (degenerate): For F = ℚ the three towers and β₁, β₂ are identities between
      copies of the modular tower.
  * `beta1_not_surjective` (non-example): For [F : ℚ] = 2, β₁ is not surjective on π₀:
      π₀(X_{Γ*(pⁿ)}) = (ℤ/pⁿ)^× while π₀(X_{Γ(pⁿ)}) = (𝒪_F/pⁿ)^×.
  * `levelAction_adjugate` (computation): For γ = diag(u, 1), γ^∨ = diag(1, u), so the level action
      of γ multiplies the second basis vector by u.
  * `levelAction_vs_rightTranslation` (compatibility): The level action of γ equals the S0 right
      translation T_{γ^∨} under α ↔ λ⁻¹ ∘ (α ⊗ id) (BHW Remark 5.5).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-mixed-span` (theorem)
  The intermediate Hilbert tower as a contracted product: the ℤ_p^×-torsor span

  Statement: In hilbert-three-towers, let 𝒪_p^× act on X_{Γ(p^∞)} by the level action of diag(η, 1).
  Then X_{Γ*(p^∞)} × 𝒪_p^× → X_{Γ(p^∞)}, (x, u) ↦ diag(u, 1)·β₁(x), is a ℤ_p^×-torsor for the
  antidiagonal action t·(x, u) = (diag(t, 1)·x, ut⁻¹), i.e. X_{Γ(p^∞)} = X_{Γ*(p^∞)} ×^{ℤ_p^×}
  𝒪_p^×; in particular X_{Γ(p^∞)} is perfectoid. The decomposition X_{Γ(pⁿ)} = X_{Γ*(pⁿ)} ×
  (𝒪_F/pⁿ)^×/(ℤ/pⁿ)^× printed by BHW uses a set-theoretic section of 𝒪_p^× → 𝒪_p^×/ℤ_p^× and is not
  canonical; the contracted product is.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-weil-pairing` (construction)
  The 𝒪_p^×-valued Weil pairing of the intermediate Hilbert tower

  Statement: Let β be an 𝒪_p-generator of 𝔠𝔡⁻¹(1) = 𝔠𝔡⁻¹ ⊗ T_pμ_{p^∞}. The 𝒪_F-linearised Weil
  pairings ẽ_n (with e_{pⁿ} = Tr ∘ ẽ_n) and β give e_{n,β}: X_{Γ(pⁿ)} → (𝒪_F/pⁿ)^×, and e_β := lim
  e_{n,β}: X_{Γ(p^∞)} → 𝒪_p^× (a map to the profinite perfectoid group). Properties: (i) for γ ∈
  GL_2(𝒪_p) acting by the level action and η ∈ 𝒪_F^{×,+} by the polarization action, e_β ∘ γ =
  det(γ)·e_β and e_β ∘ η = η⁻¹·e_β; hence for (γ, x) ∈ E(p) = (Γ₀(p) × 𝒪_F^{×,+})/(1 + N𝒪_F)^×, e_β
  ∘ (γ, x) = det(γ)x⁻¹·e_β, and for a character w of 𝒪_p^× the unit w(e_β) ∈ 𝒪⁺(X_{Γ(p^∞)}(ε)_a)^×
  satisfies (γ, x)^*w(e_β) = w(x⁻¹)w(det γ)w(e_β) for (γ, x) ∈ E(pⁿ); (ii) the fibre of e_β over
  ℤ_p^× is X_{Γ*(p^∞)}; (iii) change of generator: e_{uβ} = u⁻¹e_β for u ∈ 𝒪_p^×, which moves
  X_{Γ*(p^∞)} to the fibre over u⁻¹ℤ_p^×; (iv) on the arithmetic tower only the class of e_β modulo
  the closure of 𝒪_F^{×,+} is defined (BHW's map e: X_{G,Γ(p^∞)} → 𝔠𝔡⁻¹(1)^× is not well defined,
  because changing λ by η multiplies the pairing by η⁻¹; PerfectoidShimuraVarieties/E28).

  API:
  * `HilbertTower.weilPairing` (constructor): e_β: X_{Γ(p^∞)} → 𝒪_p^×.
  * `HilbertTower.weilPairing_level` (simp): e_β ∘ γ = det(γ)·e_β for the level action.
  * `HilbertTower.weilPairing_pol` (simp): e_β ∘ η = η⁻¹·e_β for the polarization action.
  * `HilbertTower.weilPairing_fibre` (characterisation): e_β⁻¹(ℤ_p^×) = β₁(X_{Γ*(p^∞)}).
  * `HilbertTower.weilPairing_changeGenerator` (relation): e_{uβ} = u⁻¹e_β.
  * `HilbertTower.weilPairing_E` (simp): e_β ∘ (γ, x) = det(γ)x⁻¹e_β on E(p).
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

  Statement: In hilbert-three-towers: (1) β₂: X_{Γ(p^∞)} → X_{G,Γ(p^∞)} is a pro-étale torsor under
  the profinite group Δ(p^∞N) := lim_n Δ(pⁿN), Δ(pⁿN) = 𝒪_F^{×,+}/((1 + pⁿN𝒪_F)^×)², into which
  𝒪_F^{×,+} embeds densely; (2) on identity components, X⁰_{Γ(p^∞)} = X⁰_{Γ*(p^∞)} → X⁰_{G,Γ(p^∞)}
  is a finite étale torsor under the finite group Δ_∞(N) := ker(Δ(p^∞N) → 𝒪_p^×), the stabiliser of
  the identity component; for p odd Δ_∞(N) = Δ_n(N) = (1 + pⁿ𝒪_F)^{×,+}/((1 + pⁿN𝒪_F)^×)² for n ≫ 0,
  while for p = 2 the transition maps Δ_{n+1}(N) → Δ_n(N) need not be injective and Δ_∞(N) is only
  the kernel above (BHW's proof of Lemma 8.20 assumes an injection Δ_n(N) → Δ(N) that need not
  exist; PerfectoidShimuraVarieties/E26). The profinite group on the full tower and the finite group
  on components are different and both statements are needed.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-level-torsors` (theorem)
  Deck groups of the Hilbert towers at Γ₀(pⁿ)-level and the central closure Z_∞

  Statement: For n ∈ ℤ_{≥0} ∪ {∞}: (1) X_{Γ(p^∞)} → X_{Γ₀(pⁿ)} is a pro-étale torsor under Γ₀(pⁿ) ⊆
  GL_2(𝒪_p) (for n = 0: a G(ℤ_p)-torsor over X); (2) X_{G,Γ(p^∞)} → X_{G,Γ₀(pⁿ)} is a pro-étale
  torsor under PΓ₀(pⁿ) := Γ₀(pⁿ)/Z_∞, where Z_∞ is the closure of (1 + N𝒪_F)^× (all units ≡ 1 mod N,
  embedded as scalars) in 𝒪_p^× — the S0 kernel Z_{K^p} ∩ K_p of the G-tower (S0 tower-action-kernel
  with Z = Res_{F/ℚ}G_m); (3) X_{Γ(p^∞)} → X_{G,Γ₀(pⁿ)} is a pro-étale torsor under E(pⁿ) := lim_m
  (Γ̄₀(pⁿ, p^m) × 𝒪_F^{×,+})/(1 + N𝒪_F)^×, with exact sequences 0 → Γ₀(pⁿ) → E(pⁿ) → Δ(N) → 0 and 0
  → Δ(p^∞N) → E(pⁿ) → PΓ₀(pⁿ) → 0; (4) all statements restrict to the anticanonical loci (ε)_a for n
  ≥ 1 (not for n = 0: (ε)_a is only Γ₀(p)-stable), the anticanonical locus being Δ-stable because
  the Hasse invariant does not depend on the polarization. BHW's Lemma 9.2 and the
  OverconvergentAutomorphicForms O4 nodes that copy it take Z_∞ to be the closure of (1 +
  N𝒪_F)^{×,+} in '𝒪_p^{×,+}'; the correct group is the closure of (1 + N𝒪_F)^× in 𝒪_p^×
  (PerfectoidShimuraVarieties/E29).
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-gl2-qp-action` (construction)
  The action of G(ℚ_p) on the Hilbert towers and the change of polarization module

  Statement: The level-structure action of G(ℤ_p) = GL_2(𝒪_p) on X_{Γ(p^∞)} extends to an action of
  G(ℚ_p) = GL_2(F_p) on the disjoint union ⊔_𝔠 X_{𝔠,Γ(p^∞)} over polarization modules: for γ ∈
  M_2(𝒪_p) ∩ GL_2(F_p) (after scaling, a scalar x acting by A ↦ A/A[x]), with D = ker(γ on A[pⁿ])
  for n ≫ 0 transported through λ⁻¹ ∘ α, γ sends (A, ι, λ, μ_N, α) to (A/D, ι′, λ′, μ′_N, α′), where
  λ′ is the unique 𝔠𝔟-polarization of A/D compatible with λ and α′ is determined by α′ ∘ γ^∨ = φ^∨ ∘
  α. Relative to S0, this is the right translation by γ^∨ on the arithmetic tower, combined with the
  change of the component of the polarization class; it permutes the X_{𝔠,Γ(p^∞)} and does not
  preserve a fixed 𝔠.

  API:
  * `HilbertTower.qpAction` (constructor): The action of G(ℚ_p) on ⊔_𝔠 X_{𝔠,Γ(p^∞)}.
  * `HilbertTower.qpAction_extends` (compatibility): On G(ℤ_p) it is the level-structure action.
  * `HilbertTower.qpAction_polModule` (characterisation): γ maps X_{𝔠} to X_{𝔠𝔟} with 𝔟 the product
      of the elementary divisors of the kernel.
  * `HilbertTower.qpAction_eq_translate` (equivalence): Under the dictionary, it is the S0 right
      translation by γ^∨.

  Unit tests:
  * `qpAction_scalar_p` (computation): γ = p·1 sends 𝔠 to p²𝔠.
  * `qpAction_integral` (degenerate): For γ ∈ GL_2(𝒪_p), 𝔟 = 𝒪_F and the action is the level action.
  * `qpAction_not_fixed_c` (non-example): For γ = diag(ϖ, 1) with ϖ generating a non-principal prime
      𝔭 | p, the polarization module changes to 𝔠𝔭, in a different narrow class, so the action does
      not preserve X_{𝔠,Γ(p^∞)}.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility` (theorem)
  Period maps, coefficient trivializations and anticanonical domains across the Hilbert towers

  Statement: (1) There are Hodge–Tate period maps X_{Γ*(p^∞)} → X_{Γ(p^∞)} → X_{G,Γ(p^∞)} →
  Res_{𝒪_F|ℤ}ℙ¹ compatible with β₁, β₂: on X_{Γ(p^∞)} the map is (x, u) ↦ diag(u, 1)·π_HT(x) on the
  span of hilbert-mixed-span (BHW's 'projection to the first factor' is not ℤ_p^×-invariant;
  PerfectoidShimuraVarieties/E27), it is invariant under the polarization action (which does not
  change (A, α)), and it descends to the arithmetic tower (S3 hilbert-res-flag-period-map (iv)). (2)
  The coordinate 𝔷 = π_HT^*z, the section 𝔰 = π_HT^*s of ω = π_HT^*Res 𝒪(1) with 𝔰(A, α) = HT_A(α(1,
  0)), and the automorphy factor γ^*𝔰 = (c𝔷 + d)𝔰 extend from X_{Γ*(p^∞)} (γ ∈ Γ*₀(p)) to X_{Γ(p^∞)}
  (γ ∈ Γ₀(p) ⊆ GL_2(𝒪_p)), with ω pulled back from X. (3) For every rational prime p (including p =
  2, 3 and p ramified in F) and the T4 bounds (m ≥ 1, p^{−m} ≤ r < 1, ε ≤ 1/(c_p p^m)), with one ε
  for all 𝔭 | p (the total Hasse invariant): π_HT(X_{Γ*(p^∞)}(ε)_c) ⊆ B_r(1 : p𝒪_p) and
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
  HodgeTateAndCanonicalSubgroups T6:comparison: let P_HT ⊆ G_{pet,p} ×^{G^c(ℚ_p)} G^{c,an} be the
  P^c_μ-reduction of the pro-Kummer-étale G^c(ℚ_p)-torsor over S^tor_{K,Σ} given by the logarithmic
  Hodge–Tate filtration. For every perfectoid space S with a map S → S^{tor◇}_{K^p,Σ,∞}, there is a
  P^{c,an}_μ-torsor P_HT(S) ⊆ G^{c,an} × S, functorial in S and compatible with base change, which
  étale-locally on S̃ → S is P^{c,an}_μ · g_{S̃} for an element g_{S̃} ∈ G^{c,an}(S̃) unique up to
  left multiplication by P^{c,an}_μ(S̃); the cocycle p₂^*g · (p₁^*g)⁻¹ ∈ P_μ(S̃ ×_S S̃) describes
  P_HT(S), and right translation g_{S̃} ↦ g_{S̃}·g by G^{an} does not change P_HT(S). This is the
  passage from the pro-Kummer-étale site of S^tor_{K,Σ} to the v-site of the diamond that
  Boxer–Pilloni §4.6.1 presuppose and do not prove.
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
  represented by t, and the induced map p₁^*M^{an}_HT → p₂^*M^{an}_HT of étale torsors, compatible
  with the period maps of the toroidal tower diamonds and with the de Rham side through the twisted
  identification. For w ∈ ^MW and t ∈ T(ℚ_p), over the Bruhat domains of bruhat-levi-reduction, the
  map is locally represented by the double coset K_{p,w,M_μ}M¹_{μ,m,n}·wtw⁻¹·K_{p,w,M_μ}M¹_{μ,m,n}
  (Boxer–Pilloni Proposition 4.6.19, Lemma 4.6.20). No single Σ admits all correspondences.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data` (construction)
  Auxiliary data for an abelian-type datum: the Hodge-type cover and Lovering's B₁

  Statement: Let (G, X) be of abelian type (ShimuraData:D4/abelian-type): there are a Hodge-type
  datum (G₁, X₁) and a central isogeny G₁^der → G^der inducing (G₁^ad, X₁⁺) ≅ (G^ad, X⁺). Let E be
  the composite of the reflex fields, T = Res_{E/ℚ}G_m, and (Lovering, §4.6) B₁ = G₁ ×_{G₁^ab} T for
  the map T → G₁^ab induced by μ_{G₁}, with a datum (B₁, X_{B₁}) and maps (B₁, X_{B₁}) → (G₁, X₁),
  (B₁, X_{B₁}) → (G, X) (through (B, X_B)) inducing isomorphisms on derived groups or central
  isogenies, so that all three share the flag variety FL_{G,μ} = FL_{G₁,μ_{G₁}} = FL_{B₁,μ_{B₁}} and
  the adjoint datum. For a morphism of data g: (H, X_H) → (S, X_S) with H^ad = S^ad, compact opens
  with g(K′) ⊆ K and Σ for S: S(H)_{K′} → S(S)_K is finite étale, Σ induces a cone decomposition for
  H with S^tor(H)_{K′,Σ} → S^tor(S)_{K,Σ} finite, and if g(K′) is normal in K the map of neutral
  components is Galois with finite group Δ(K, K′) = Γ^{ad}_K/Γ^{ad}_{K′}, the action extending to
  S^{tor,0}(H)_{K′,Σ} with quotient S^{tor,0}(S)_{K,Σ} (Boxer–Pilloni Proposition 4.4.42).

  API:
  * `AbelianType.hodgeCover` (data): A Hodge-type datum (G₁, X₁) with G₁^der → G^der a central
      isogeny inducing an isomorphism of adjoint connected data.
  * `AbelianType.lovering` (constructor): B₁ = G₁ ×_{G₁^ab} Res_{E/ℚ}G_m with its datum and maps to
      (G₁, X₁) and (G, X).
  * `AbelianType.flag_eq` (equivalence): FL_{G,μ} = FL_{G₁,μ_{G₁}} = FL_{B₁,μ_{B₁}} through the
      common adjoint group.
  * `AbelianType.deltaGroup` (constructor): Δ(K, K′) = Γ^{ad}_K/Γ^{ad}_{K′} for g(K′) normal in K.
  * `AbelianType.neutral_galois` (characterisation): The neutral components form a Galois cover with
      group Δ(K, K′), extending to toroidal compactifications.

  Unit tests:
  * `abelian_aux_hodge_trivial` (degenerate): For (G, X) of Hodge type one may take G₁ = G and B₁ =
      G ×_{G^ab} T, and Δ(K, K′) is the group of deck transformations of neutral components.
  * `abelian_aux_hilbert` (computation): For G = Res_{F/ℚ}GL_2 and G₁ = G*, the adjoint groups agree
      (Res PGL_2) and Δ at full level N is 𝒪_F^{×,+}/(𝒪_F^× ∩ K)² up to the image of the centre.
  * `abelian_aux_not_preabelian_proof` (non-example): A pre-abelian datum that is not of abelian
      type (an isomorphism of adjoint connected data without a central isogeny of derived groups)
      has no B₁ of this form; the construction does not apply.
-/

/- CONTRACT `PerfectoidShimuraVarieties:S6/torsor-fibre-product` (lemma)
  Fibre products of torsors and the de Rham torsor of B₁

  Statement: (i) Let H₁ → H₂ ← H₃ be flat group schemes over a base S with H₁ ×_{H₂} H₃ flat,
  P_{H_i} torsors and isomorphisms P_{H₁} ×^{H₁} H₂ ≅ P_{H₂} ≅ P_{H₃} ×^{H₃} H₂. Then P_{H₁}
  ×_{P_{H₂}} P_{H₃} is an (H₁ ×_{H₂} H₃)-torsor (Boxer–Pilloni print P_{H₁} ×_{P_{H₂}} P_{H₁};
  PerfectoidShimuraVarieties/E22). (ii) In the situation of abelian-auxiliary-data, for K ⊆ B₁(𝔸_f)
  and Σ for G₁ there are levels K₁, K₂, K₃ and maps π₁: S^tor(B₁)_{K,Σ} → S^tor(G₁)_{K₁,Σ}, π₂:
  S^tor(B₁)_{K,Σ} → S(T)_{K₂} over S(G₁^ab)_{K₃}, with M_dR(B₁) ≅ π₁^*M_dR(G₁) ×_{π₃^*M_dR(G₁^ab)}
  π₂^*M_dR(T) canonically, and likewise for M_HT; with M^c_{μ_{B₁}} = M^c_{μ_{G₁}} ×_{M^{ab,c}_{μ}}
  T^c, constructions for G₁ extend to B₁ by the trivial construction on the zero-dimensional
  T-Shimura variety (Principle 4.4.44(1)).
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

  Statement: In the situation of abelian-auxiliary-data, for neat K ⊆ G(𝔸_f), K′ ⊆ B₁(𝔸_f) with
  f(K′) normal in K and Σ for G: over the neutral toroidal component S^{tor,0}(G)_{K,Σ}, the de Rham
  Levi torsor M_dR(G, X) is the quotient by Δ(K, K′) of M_dR(B₁) ×^{M^c_{μ_{B₁}}} M^c_{μ_G} over
  S^{tor,0}(B₁)_{K′,Σ} (after refining Σ so that S^{tor,0}(B₁)_{K′,Σ} → S^{tor,0}(G)_{K,Σ} is finite
  and generically finite étale with group Δ(K, K′)), and the same holds for M_HT on the towers; with
  the fibre-product description of torsor-fibre-product this expresses M_HT(G) through M_HT(G₁) and
  the torus T.
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

  Statement: Assume G_{ℚ_p} quasi-split with a reductive model over 𝒪_F, M^c_μ ⊆ M^{c,an}_μ the
  corresponding quasi-compact open subgroup, and K_p ⊆ G(ℚ_p) ∩ G(𝒪_F). Then the étale torsor
  M^{an}_dR ×^{μ,ℤ_p^×} ℤ_p(1) = M^{an}_HT over S^tor_{K^pK_p,Σ} (general-toroidal-period-map) has a
  reduction to an étale M^c_μ-torsor, equal to the twisted integral de Rham torsor (the cyclotomic
  character through μ lands in M^c_μ since μ(ℤ_p^×) ⊆ M_μ(𝒪_F)).
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
  is a torsor under an affinoid group; and for Hodge-type data with perfect Σ, M_{HT,n,K_p} becomes
  trivial over a finite flat cover of any pregood affinoid (Proposition 4.6.15).
-/
