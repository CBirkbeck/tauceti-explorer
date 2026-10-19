/-
Suggested Lean forms for the roadmap
"Locally analytic representations of p-adic reductive groups".

This file is not the roadmap and it is not exhaustive: the roadmap document
(`research/blueprint/readmes/LocallyAnalyticRepresentationsOfLocalGroups.md`) is definitive.
The statements below suggest Lean forms, so that contributors and reviewers converge on names
and signatures. Only light definitions over carriers that exist in the pinned Mathlib and
Tau Ceti have real bodies here; the heavy objects of the roadmap (the distribution algebra of a
non-compact group, admissible representations, Orlik–Strauch functors, Emerton's Jacquet
functor, the representations π_alg ⊆ π_1 ⊆ π of GL_n) are targets of the document and are
not declared here. Theorems are stated and proved by `sorry`.
-/
import Mathlib.Geometry.Manifold.Algebra.LieGroup
import Mathlib.Geometry.Manifold.ContMDiff.Defs
import Mathlib.Geometry.Manifold.Instances.UnitsOfNormedAlgebra
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.LinearAlgebra.Prod
import Mathlib.Data.Fintype.Powerset
import Mathlib.Data.Fin.VecNotation
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.NumberTheory.Padics.PadicNumbers

open scoped ContDiff Manifold

namespace TauCeti.LocallyAnalytic

/-! ## LR.0 and LR.2: locally analytic vectors of a representation on a normed space

`G` is a Lie group over the field of analyticity `𝕜` (ℚ_p or a finite extension `L`) in
Mathlib's sense, with analytic smoothness `ω`. A representation on a normed space `V` is a
monoid map `ρ : G →* (V →L[𝕜] V)`. The roadmap's general definition (barrelled spaces, orbit
maps in `C^an(G, V)` of LocallyAnalyticDistributions L0) specialises to this one for Banach
`V`. -/

section Vectors

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜]
  {EM : Type*} [NormedAddCommGroup EM] [NormedSpace 𝕜 EM]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners 𝕜 EM H)
  {G : Type*} [TopologicalSpace G] [ChartedSpace H G] [Group G]
  {V : Type*} [NormedAddCommGroup V] [NormedSpace 𝕜 V]

/-- `v` is a locally analytic vector of `ρ` if its orbit map `g ↦ ρ g v` is analytic
(LR.0/locally-analytic-representation, LR.2/analytic-vectors). -/
def IsLocallyAnalyticVector (ρ : G →* (V →L[𝕜] V)) (v : V) : Prop :=
  ContMDiff I 𝓘(𝕜, V) ω (fun g => ρ g v)

/-- The locally analytic vectors of `ρ`, as a set (LR.2/analytic-vectors, `laVectors`). -/
def laVectors (ρ : G →* (V →L[𝕜] V)) : Set V :=
  {v | IsLocallyAnalyticVector I ρ v}

/-- A representation on a normed space all of whose vectors are locally analytic. -/
def IsLocallyAnalyticRep (ρ : G →* (V →L[𝕜] V)) : Prop :=
  ∀ v, IsLocallyAnalyticVector I ρ v

/-- `v` is a smooth vector if its orbit map is locally constant (SmoothRepresentationsOfLocalGroups
SR.0; LR.0/locally-analytic-representation, `ofSmooth`). -/
def IsSmoothVector (ρ : G →* (V →L[𝕜] V)) (v : V) : Prop :=
  IsLocallyConstant (fun g => ρ g v)

theorem zero_mem_laVectors (ρ : G →* (V →L[𝕜] V)) : (0 : V) ∈ laVectors I ρ := by
  sorry

theorem add_mem_laVectors (ρ : G →* (V →L[𝕜] V)) {v w : V}
    (hv : v ∈ laVectors I ρ) (hw : w ∈ laVectors I ρ) : v + w ∈ laVectors I ρ := by
  sorry

theorem smul_mem_laVectors (ρ : G →* (V →L[𝕜] V)) (c : 𝕜) {v : V}
    (hv : v ∈ laVectors I ρ) : c • v ∈ laVectors I ρ := by
  sorry

/-- Smooth vectors are locally analytic (`ofSmooth`, LR.0). -/
theorem IsSmoothVector.isLocallyAnalyticVector [IsManifold I ω G]
    (ρ : G →* (V →L[𝕜] V)) {v : V} (hv : IsSmoothVector ρ v) :
    IsLocallyAnalyticVector I ρ v := by
  sorry

/-- Degenerate check `LocallyAnalyticRep.zero`: the trivial representation is locally analytic. -/
example [IsManifold I ω G] : IsLocallyAnalyticRep I (1 : G →* (V →L[𝕜] V)) := by
  sorry

end Vectors

/-- The units of a complete normed ℚ_p-algebra `R` form a Lie group over ℚ_p with analytic
smoothness; for `R = M_n(L)` with an operator norm this is `GL_n(L)` as an analytic group
(LR.0/rational-points-analytic-group, the `GL_N` case). -/
example (p : ℕ) [Fact p.Prime] (R : Type*) [NormedRing R] [CompleteSpace R]
    [NormedAlgebra ℚ_[p] R] : LieGroup 𝓘(ℚ_[p], R) ω Rˣ := by
  infer_instance

/-! ## LR.1: self-extensions as dual-number modules -/

section SelfExt

variable {R M N : Type*} [CommRing R] [AddCommGroup M] [Module R M]
  [AddCommGroup N] [Module R N]

/-- For an extension `0 → M → N → M → 0` with inclusion `i` and projection `q`, the endomorphism
`ε = i ∘ q` of `N` (LR.1/self-extension-dual-numbers, `SelfExt.eps`). -/
def SelfExt.eps (i : M →ₗ[R] N) (q : N →ₗ[R] M) : N →ₗ[R] N :=
  i ∘ₗ q

/-- `ε² = 0` as soon as `q ∘ i = 0` (`SelfExt.eps_sq`). -/
theorem SelfExt.eps_sq (i : M →ₗ[R] N) (q : N →ₗ[R] M) (h : q ∘ₗ i = 0) :
    SelfExt.eps i q ∘ₗ SelfExt.eps i q = 0 := by
  sorry

/-- Check `SelfExt.split_free`: on the split extension `M × M` with `i = inl`, `q = fst`,
`ε (a, b) = (0, a)`. -/
example (a b : M) :
    SelfExt.eps (LinearMap.inr R M M) (LinearMap.fst R M M) (a, b) = (0, a) := by
  sorry

end SelfExt

/-! ## LR.7–LR.9: conventions and dimension counts for GL_n (Ding §3.1) -/

namespace GLn

/-- `θ = (0, −1, …, 1 − n)` with 0-based indices (LR.7/gln-conventions, `theta`). -/
def theta (n : ℕ) : Fin n → ℤ := fun i => -(i : ℤ)

/-- `θ^P` as a list, for a composition `blocks = [n_1, …, n_r]` of `n`: constant
`−(n_1 + ⋯ + n_{k−1})` on the `k`-th block, starting from the offset `s`. -/
def thetaParabolicAux : List ℕ → ℤ → List ℤ
  | [], _ => []
  | b :: bs, s => List.replicate b (-s) ++ thetaParabolicAux bs (s + b)

/-- `θ^P` for a standard parabolic with block sizes `blocks` (`thetaParabolic`). -/
def thetaParabolic (blocks : List ℕ) : List ℤ :=
  thetaParabolicAux blocks 0

/-- Check `theta_two`: for blocks `(1, 2)`, `θ^P = (0, −1, −1)`. -/
example : thetaParabolic [1, 2] = [0, -1, -1] := by decide

/-- Check `thetaP_block`: for blocks `(2, 1)`, `θ^P = (0, 0, −2)`. -/
example : thetaParabolic [2, 1] = [0, 0, -2] := by decide

/-- For the Borel (all blocks of size one) `θ^B = θ`. -/
example : thetaParabolic [1, 1, 1] = [0, -1, -2] := by decide

/-- `λ = h − θ`, i.e. `λ_i = h_i + i` with 0-based `i` (`lambdaOfH`; Ding writes
`λ_{σ,i} = h_{σ,i} + i − 1` with 1-based `i`). -/
def lambdaOfH {n : ℕ} (h : Fin n → ℤ) : Fin n → ℤ := fun i => h i + i

/-- Strict dominance of `h` for one embedding: `h_1 > ⋯ > h_n`. -/
def IsStrictlyDominant {n : ℕ} (h : Fin n → ℤ) : Prop := ∀ i j : Fin n, i < j → h j < h i

/-- Dominance of `λ` for one embedding: `λ_1 ≥ ⋯ ≥ λ_n`. -/
def IsDominant {n : ℕ} (μ : Fin n → ℤ) : Prop := ∀ i j : Fin n, i < j → μ j ≤ μ i

theorem IsStrictlyDominant.isDominant_lambdaOfH {n : ℕ} {h : Fin n → ℤ}
    (hh : IsStrictlyDominant h) : IsDominant (lambdaOfH h) := by
  sorry

/-- Check `lambdaOfH_example`: for `n = 2` and `h = (1, 0)`, `λ = (1, 1)`. -/
example : lambdaOfH ![(1 : ℤ), 0] = ![1, 1] := by decide

/-- `w(φ)_i = φ_{w⁻¹(i)}` (`permuteCharacter`). -/
def permuteCharacter {n : ℕ} {X : Type*} (w : Equiv.Perm (Fin n)) (φ : Fin n → X) :
    Fin n → X :=
  fun i => φ (w⁻¹ i)

theorem permuteCharacter_mul {n : ℕ} {X : Type*} (w₁ w₂ : Equiv.Perm (Fin n))
    (φ : Fin n → X) :
    permuteCharacter (w₁ * w₂) φ = permuteCharacter w₁ (permuteCharacter w₂ φ) := by
  sorry

/-- Check `permuteCharacter_cycle`: for the 3-cycle `1 ↦ 2 ↦ 3 ↦ 1` (here `finRotate 3`),
`w(φ) = φ_3 ⊠ φ_1 ⊠ φ_2`. -/
example : permuteCharacter (finRotate 3) ![(10 : ℕ), 20, 30] = ![30, 10, 20] := by
  sorry

/-- Genericity of a tuple of characters in a commutative group of characters, relative to the
norm character `absChar = |·|_L` (`IsGeneric`). -/
def IsGeneric {n : ℕ} {X : Type*} [CommGroup X] (absChar : X) (φ : Fin n → X) : Prop :=
  ∀ i j : Fin n, i ≠ j → φ i / φ j ≠ 1 ∧ φ i / φ j ≠ absChar

/-- Check `not_IsGeneric`: `φ_1 = φ_2·|·|_L` is not generic. -/
example {X : Type*} [CommGroup X] (a u : X) : ¬ IsGeneric u ![a * u, a] := by
  sorry

/-- The labels `I` of the constituents `C(I, s_{i,σ})` for one embedding: all nonempty proper
subsets of `{1, …, n}` (LR.7/constituent-labels), not the subsets of `{1, …, n − 1}`. -/
def constituentLabels (n : ℕ) : Finset (Finset (Fin n)) :=
  Finset.univ.filter (fun I => I.Nonempty ∧ I ≠ Finset.univ)

theorem card_constituentLabels (n : ℕ) (hn : 1 ≤ n) :
    (constituentLabels n).card = 2 ^ n - 2 := by
  sorry

/-- Check `card_constituentLabels_n2`. -/
example : (constituentLabels 2).card = 2 := by decide

/-- Check `card_constituentLabels_n2` for `n = 3`. -/
example : (constituentLabels 3).card = 6 := by decide

/-- Check `constituentLabel_n1`: no labels for `n = 1`. -/
example : (constituentLabels 1).card = 0 := by decide

/-- `dim Ext¹(π_alg, π_1) = n + (2^n − 1) d_L` (LR.7/ext-pi1). -/
def extPiOneDim (n dL : ℕ) : ℕ := n + (2 ^ n - 1) * dL

/-- `dim Ext¹_{g′} = n + d_L` (LR.7/self-extensions). -/
def extGPrimeDim (n dL : ℕ) : ℕ := n + dL

/-- `dim Ext¹_w = dim Hom(T(L), E) = n (1 + d_L)` (LR.7/ext-ps1). -/
def extWDim (n dL : ℕ) : ℕ := n * (1 + dL)

/-- `dim Ext¹_σ(π_alg, π_1) = n + 2^n − 1` (LR.9/sigma-ext-pi1). -/
def extSigmaDim (n : ℕ) : ℕ := n + 2 ^ n - 1

/-- `#S_{F_P} = (Σ_i (2^{n_i} − 2) + (r − 1)) d_L` (LR.8/pi-fp). -/
def sFPCard (blocks : List ℕ) (dL : ℕ) : ℕ :=
  ((blocks.map (fun b => 2 ^ b - 2)).sum + (blocks.length - 1)) * dL

/-- `dim Ext¹(π_alg, π_{F_P}) = n + d_L r + d_L Σ_i (2^{n_i} − 2)` (LR.8/ext-pi-fp). -/
def extFPDim (n : ℕ) (blocks : List ℕ) (dL : ℕ) : ℕ :=
  n + dL * blocks.length + dL * (blocks.map (fun b => 2 ^ b - 2)).sum

/-- The exact sequence of LR.7/ext-pi1: `Ext¹(π_alg, π_1)` is `Ext¹(π_alg, π_alg)` plus one line
for each of the `(2^n − 2) d_L` constituents. -/
theorem extPiOneDim_eq (n dL : ℕ) (hn : 1 ≤ n) :
    extPiOneDim n dL = extGPrimeDim n dL + (2 ^ n - 2) * dL := by
  sorry

/-- The count of LR.8/ext-pi-fp from LR.8/pi-fp: `dim = n + d_L + #S_{F_P}`. -/
theorem extFPDim_eq (n dL : ℕ) (blocks : List ℕ) (hb : blocks ≠ []) :
    extFPDim n blocks dL = n + dL + sFPCard blocks dL := by
  sorry

/-- Check `ext_filtration_dims_n2`: for `n = 2`, `d_L = 1`: dimensions `3 ⊆ 4` inside `5`. -/
example : extGPrimeDim 2 1 = 3 ∧ extWDim 2 1 = 4 ∧ extPiOneDim 2 1 = 5 := by decide

/-- Check `zeta_not_injective_sum`: `⊕_w Hom(T, E)` has dimension `2 · 4 = 8 > 5`. -/
example : 2 * extWDim 2 1 > extPiOneDim 2 1 := by decide

/-- Check `card_SFP_maximal`: blocks `(2, 1)` give `#S_{F_P} = 3 d_L`. -/
example : sFPCard [2, 1] 1 = 3 := by decide

/-- Check `zetaFP_dim_source`: for `n = 3`, blocks `(2, 1)`, `d_L = 1`: dimension `3 + 4 = 7`. -/
example : extFPDim 3 [2, 1] 1 = 7 := by decide

/-- For `P = B`, `dim Ext¹(π_alg, π_{F_P}) = dim Ext¹(π_alg, PS_1) = n (1 + d_L)`. -/
example : extFPDim 3 [1, 1, 1] 2 = extWDim 3 2 := by decide

/-- Check of LR.9/sigma-amalgamation: `2 (n + 2^{n−1}) − (n + 1) = n + 2^n − 1` for `n = 3`. -/
example : 2 * (3 + 2 ^ 2) - (3 + 1) = extSigmaDim 3 := by decide

end GLn

end TauCeti.LocallyAnalytic
