import Mathlib
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Adjugate

/-! # PerfectoidShimuraVarieties: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs and is not exhaustive. The roadmap supplies
the geometric targets, exact hypotheses, source locators and checks.

The explicit choices are the multiplier in the Siegel level groups, trace normalization
by the actual nonzero degree, the row-graph quotient frame, the determinant-scaled
inverse in the Hilbert level action, and the hypotheses of parabolic double-coset
cancellation. FiniteLevel, MatrixChart and Coefficients name the algebraic portions of
the corresponding geometric statements, with their coefficient hypotheses recorded
in README.md.
-/

namespace TauCetiRoadmap.PerfectoidShimuraVarieties

/-! ## Layer 0: finite and infinite towers -/

namespace GSp

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
noncomputable def similitude [Nonempty g] : gsp g R →* Rˣ where
  toFun γ := Classical.choose (show ∃ c : Rˣ, ((γ : GL (g ⊕ g) R) : Matrix (g ⊕ g) (g ⊕ g) R) *
    J g R * ((γ : GL (g ⊕ g) R) : Matrix (g ⊕ g) (g ⊕ g) R)ᵀ = (c : R) • J g R from γ.2)
  map_one' := sorry
  map_mul' := sorry

/-- `γ J γᵀ = c(γ) J`. -/
theorem similitude_spec [Nonempty g] (γ : gsp g R) :
    ((γ : GL (g ⊕ g) R) : Matrix (g ⊕ g) (g ⊕ g) R) * J g R *
        ((γ : GL (g ⊕ g) R) : Matrix (g ⊕ g) (g ⊕ g) R)ᵀ =
      (similitude g R γ : R) • J g R := sorry

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
corrected one. -/
def levelGamma0 [Nonempty g] (m : ℕ) : Subgroup (gsp g ℤ_[p]) where
  carrier := {γ | (∀ i j : g, reduce g p m γ (Sum.inr i) (Sum.inl j) = 0) ∧
    PadicInt.toZModPow m (similitude g ℤ_[p] γ : ℤ_[p]) = 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry


/-- Cofinality inside the integral compact open: every open subgroup contains a
principal congruence subgroup. Intersecting a compact open of `GSp(ℚ_p)` with `GSp(ℤ_p)`
gives the ambient witness required to compare the full compact-open index with this sequence. -/
theorem levelGamma_cofinal (U : Subgroup (gsp g ℤ_[p]))
    (hU : IsOpen (U : Set (gsp g ℤ_[p]))) : ∃ m, levelGamma g p m ≤ U := sorry


/-- Check: `levelGamma_m_zero` (degenerate): at `m = 0` every condition is empty. -/
example : levelGamma g p 0 = ⊤ := sorry

/-- Check: `levelGamma_m_zero` (degenerate), `Γ₀` part. -/
example [Nonempty g] : levelGamma0 g p 0 = ⊤ := sorry

/-- Check: `levelGamma1_not_cofinal` (non-example): the unipotent `(1 1; 0 1)` lies in every
`Γ₁(pᵐ)` and not in `Γ(p)`, so `⋂ₘ Γ₁(pᵐ) ≠ 1`. -/
example [Nonempty g] : ⨅ m, levelGamma1 g p m ≠ ⊥ := sorry

/-- The genus-one specialisation: `GSp_2 = GL_2` with similitude `det`. -/
theorem gsp_genusOne : gsp (Fin 1) R = ⊤ := sorry


/-- (compatibility, `g = 1`): an integral matrix of determinant `1`
lies in `Γ(pᵐ)` exactly when it lies in Mathlib's `CongruenceSubgroup.Gamma (p ^ m)`.
`toGSp` is the inclusion `SL(2, ℤ) → GSp_2(ℤ_p)` through `ℤ → ℤ_p` and the index change
`Fin 2 ≃ Fin 1 ⊕ Fin 1`. -/
theorem levelGamma_genusOne (toGSp : Matrix.SpecialLinearGroup (Fin 2) ℤ →* gsp (Fin 1) ℤ_[p])
    (htoGSp : ∀ A i j, ((toGSp A : GL (Fin 1 ⊕ Fin 1) ℤ_[p]) : Matrix _ _ ℤ_[p]) i j =
      ((A : Matrix (Fin 2) (Fin 2) ℤ) (finSumFinEquiv (m := 1) (n := 1) i)
        (finSumFinEquiv (m := 1) (n := 1) j) : ℤ_[p]))
    (m : ℕ) (A : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    toGSp A ∈ levelGamma (Fin 1) p m ↔ A ∈ CongruenceSubgroup.Gamma (p ^ m) := sorry

/-- Check: `levelGamma_index_g1` (computation): for `g = 1`, `m = 1`,
`[Γ₀(p) : Γ₁(p)] = p - 1` and `[Γ₁(p) : Γ(p)] = p`. -/
example : ((levelGamma1 (Fin 1) p 1).subgroupOf (levelGamma0 (Fin 1) p 1)).index = p - 1 ∧
    ((levelGamma (Fin 1) p 1).subgroupOf (levelGamma1 (Fin 1) p 1)).index = p := sorry

/-- Check: `levelGamma_index_g1` (computation), first part: `[GSp_2(ℤ_p) : Γ(p)]` is the
order of `GL_2(𝔽_p)`. -/
example : (levelGamma (Fin 1) p 1).index = (p ^ 2 - 1) * (p ^ 2 - p) := sorry

/-- Check: `levelGamma0_similitude_not_det` (non-example): for `g = 2` and `p` odd, the
element `γ = diag(1, 1, -1, -1)` has `det γ = 1`, so it satisfies the printed condition
`det γ ≡ 1 mod p`, but `c(γ) = -1`, so it is not in `Γ₀(p)`. -/
example (hp : p ≠ 2) (γ : gsp (Fin 2) ℤ_[p])
    (hγ : ((γ : GL (Fin 2 ⊕ Fin 2) ℤ_[p]) : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℤ_[p]) =
      Matrix.fromBlocks 1 0 0 (-1)) :
    ((γ : GL (Fin 2 ⊕ Fin 2) ℤ_[p]) : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℤ_[p]).det = 1 ∧
      (similitude (Fin 2) ℤ_[p] γ : ℤ_[p]) = -1 ∧ γ ∉ levelGamma0 (Fin 2) p 1 := sorry

end GSp

namespace GSp
open Matrix
variable (g : Type*) [Fintype g] [DecidableEq g] [Nonempty g]
variable (p : ℕ) [Fact p.Prime]

/-- U_m, including U_0=all units, avoids treating 1+ℤ_p as a unit subgroup. -/
def unitReductionKernel (m : ℕ) : Subgroup ℤ_[p]ˣ where
  carrier := {u | PadicInt.toZModPow m (u : ℤ_[p]) = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- The images of the principal and parabolic level groups are exactly the unit reduction kernel. -/
theorem similitude_levelGamma0 (m : ℕ) :
    (levelGamma0 g p m).map (similitude g ℤ_[p]) = unitReductionKernel p m ∧
    (levelGamma g p m).map (similitude g ℤ_[p]) = unitReductionKernel p m := sorry

example : unitReductionKernel p 0 = ⊤ := sorry


/-- At level zero the Γ₁ congruence conditions impose no restriction. -/
example : levelGamma1 g p 0 = ⊤ := sorry

end GSp

/-- Reduction at depth zero has values in the zero ring. -/
example (g : Type*) [Fintype g] [DecidableEq g] (p : ℕ) [Fact p.Prime]
    (γ : GSp.gsp g ℤ_[p]) : GSp.reduce g p 0 γ = 0 := sorry

/-- The identity has multiplier one, including residue characteristic two. -/
example (g : Type*) [Fintype g] [DecidableEq g] [Nonempty g]
    (p : ℕ) [Fact p.Prime] : GSp.similitude g ℤ_[p] 1 = 1 := sorry

/-! ## Layer 0.general: general-data and toroidal diamonds -/

/-- The transformed genus-two cusp ray fails the perfect-cone inequality. -/
example : let Q : Matrix (Fin 2) (Fin 2) ℤ := !![4, -2; -2, 1]
    Q = Matrix.vecMulVec (![2, -1] : Fin 2 → ℤ) (![2, -1] : Fin 2 → ℤ) ∧
      Q 1 1 < |Q 0 1| := by decide

/-! ## Layer 1: the Siegel construction -/

namespace SiegelTorsion.FiniteLevel

variable (K A : Type*) [Field K] [CharZero K] [CommRing A] [Algebra K A]
    [Module.Free K A] [Module.Finite K A] [Nontrivial A]

/-- Normalized trace at a finite free algebra level: degree inverse times the ordinary trace.
Characteristic zero and nontriviality make the finite degree nonzero. -/
noncomputable def normalizedTrace : A →ₗ[K] K :=
  (Module.finrank K A : K)⁻¹ • Algebra.trace K A


/-- The trace divided by the extension degree retracts the scalar embedding. -/
theorem normalizedTrace_algebraMap (a : K) : normalizedTrace K A (algebraMap K A a) = a := sorry


/-- Test normalizedTrace_identity_level. -/
example (x : K) : normalizedTrace K K x = x := sorry

/-- Test normalizedTrace_not_unnormalized: a split degree-two algebra detects the factor. -/
example (a : K) : Algebra.trace K (K × K) (a, a) = 2 * a ∧
    normalizedTrace K (K × K) (a, a) = a := sorry


end SiegelTorsion.FiniteLevel

namespace SiegelTorsion
open Matrix
variable (g : Type*) [Fintype g] [DecidableEq g] [Nonempty g]
variable (p : ℕ) [Fact p.Prime]

/-- Strict Iwahori: diagonal reduction in Sp_2g(F_p), not all upper-triangular matrices. -/
def strictIwahori : Subgroup (GSp.gsp g ℤ_[p]) where
  carrier := {γ | (∀ i j, i ≠ j → GSp.reduce g p 1 γ i j = 0) ∧
    PadicInt.toZMod (GSp.similitude g ℤ_[p] γ : ℤ_[p]) = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- Diagonal symplectic reduction lies in Γ₀ at level p. -/
theorem strictIwahori_le : strictIwahori g p ≤ GSp.levelGamma0 g p 1 := sorry

/-- Test strictIwahori_quotient_g1, the actual finite quotient order. -/
example : ((GSp.levelGamma (Fin 1) p 1).subgroupOf (strictIwahori (Fin 1) p)).index = p - 1 := sorry

/-- Test strictIwahori_not_subgroups: a nontrivial upper unipotent is in Γ₁ but not strict Iwahori. -/
example (γ : GSp.gsp (Fin 1) ℤ_[p])
    (hγ : ((γ : GL (Fin 1 ⊕ Fin 1) ℤ_[p]) : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℤ_[p]) = fromBlocks 1 1 0 1) :
    γ ∈ GSp.levelGamma1 (Fin 1) p 1 ∧ γ ∉ strictIwahori (Fin 1) p := sorry

end SiegelTorsion

/-! ## Layer 2: Hodge-type representability -/

/-! Open, image-compactified and genuine minimal towers have distinct geometric
statements in README.md. -/

/-! ## Layer 3: Hodge-type period maps and coefficients -/

namespace HodgeTate.MatrixChart

open Matrix

variable {g : Type*} [Fintype g] [DecidableEq g] {R : Type*} [CommRing R]

/-- The factor of automorphy `A + ZC` of `γ = (A B; C D)` at the chart point `Z`. -/
def chartFactor (A C Z : Matrix g g R) : Matrix g g R := A + Z * C

/-- The chart action `Z·γ = (A + ZC)⁻¹(B + ZD)`. -/
noncomputable def chartAction (A B C D Z : Matrix g g R) : Matrix g g R :=
  (chartFactor A C Z)⁻¹ * (B + Z * D)

/-- `(1 Z)γ = (A + ZC)(1  Z·γ)` whenever `A + ZC` is invertible. -/
theorem siegelGraphChart_act (A B C D Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    Matrix.fromCols (1 : Matrix g g R) Z * Matrix.fromBlocks A B C D =
      chartFactor A C Z * Matrix.fromCols 1 (chartAction A B C D Z) := sorry

/-- Check: `graph_factor_identity` (degenerate): for `γ = 1`, `A + ZC = 1` and `Z·γ = Z`. -/
example (Z : Matrix g g R) : chartFactor 1 0 Z = 1 ∧ chartAction 1 0 0 1 Z = Z := sorry

/-- Check: `graph_factor_g1` (computation): for `g = 1`,
`(1 z)γ = (a + zc)(1, (b + zd)/(a + zc))`. -/
example {K : Type*} [Field K] (a b c d z : K) (h : a + z * c ≠ 0) :
    chartFactor !![a] !![c] !![z] = !![a + z * c] ∧
      chartAction !![a] !![b] !![c] !![d] !![z] = !![(b + z * d) / (a + z * c)] := sorry

/-- Check: `graph_factor_cocycle` (characterisation): the factor of `γγ'` at `Z` is the factor
of `γ` at `Z` times the factor of `γ'` at `Z·γ`. -/
example (A B C D A' B' C' D' Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    chartFactor (A * A' + B * C') (C * A' + D * C') Z =
      chartFactor A C Z * chartFactor A' C' (chartAction A B C D Z) := sorry

/-- Check: `graph_unit_needs_iwahori` (non-example): for `g = 1`, `γ = (0 1; 1 0)` and `z = 0`
the factor `a + zc` is `0`, not a unit. -/
example {K : Type*} [Field K] : ¬ IsUnit (chartFactor (0 : Matrix (Fin 1) (Fin 1) K) 1 0).det := by
  simp [chartFactor]

/-- integral form: if `C ≡ 0 mod p` and `A` is invertible, then for every
integral `Z` the determinant of `A + ZC` is congruent to `det A` modulo `p`, hence a unit of
`ℤ_p`. -/
theorem det_factor_isUnit (p : ℕ) [Fact p.Prime] (A C Z : Matrix g g ℤ_[p])
    (hC : ∀ i j, PadicInt.toZMod (C i j) = 0) (hA : IsUnit A.det) :
    IsUnit (chartFactor A C Z).det ∧
      PadicInt.toZMod (chartFactor A C Z).det = PadicInt.toZMod A.det := sorry

end HodgeTate.MatrixChart

namespace HodgeTate.MatrixChart
open Matrix
variable {g : Type*} [Fintype g] [DecidableEq g] {R : Type*} [CommRing R]

/-- Symmetric-matrix portion of the Siegel chart; graphDistanceDomain supplies its pointwise distance subset, before its analytic affinoid realization. -/
def siegelGraphChart := {Z : Matrix g g R // Zᵀ = Z}

/-- The quotient frame represented by the row matrix (1,Z), before analytic pullback. -/
def hodgeFrame (Z : Matrix g g R) : ((g ⊕ g) → R) →ₗ[R] (g → R) :=
  (fromCols 1 Z).mulVecLin


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

end HodgeTate.MatrixChart

namespace HodgeTate.MatrixChart
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

/-- Pointwise stability of the distance domain. Strict Iwahori blocks are supplied
as their actual integral matrices; symmetry requires the GSp condition. -/
theorem siegelGraphChart_stable [Nonempty g] [IsUltrametricDist K]
    (r : ℝ) (hr : 0 < r) (hr1 : r ≤ 1)
    (γ : GSp.gsp g ℤ_[p]) (hγ : γ ∈ SiegelTorsion.strictIwahori g p)
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
end HodgeTate.MatrixChart

/-! ## Layer 4: pre-abelian representability -/

/-! Property 𝒫 concerns the specified minimally compactified geometric towers
of full and connected Shimura data. -/

/-! ## Layer 5: modular and Hilbert towers -/

namespace HilbertTower.Coefficients
open Matrix
variable {R : Type*} [CommRing R]


/-- Matrix portion of the Hilbert level action: precompose the level map with γ^∨.
This is a left action; it lies over the right tower translation by γ^∨. -/
def levelAction (γ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) : Matrix (Fin 2) (Fin 2) R :=
  α * (TauCeti.adjugateGL γ : Matrix (Fin 2) (Fin 2) R)

/-- Left level changes compose in the order of matrix multiplication. -/
theorem levelAction_mul (γ δ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) :
    levelAction (γ * δ) α = levelAction γ (levelAction δ α) := sorry

/-- The coefficient of the alternating determinant pairing in the chosen basis β.
This is the matrix part of the Weil-pairing map, before interpreting it through the geometric Weil pairing. -/
def pairingCoefficient (α : Matrix (Fin 2) (Fin 2) R) : R := α.det

/-- The determinant pairing scales by the determinant under a level change. -/
theorem pairingCoefficient_level (γ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) :
    pairingCoefficient (levelAction γ α) = (γ : Matrix (Fin 2) (Fin 2) R).det * pairingCoefficient α := sorry

/-- Change of the target generator β to uβ divides its pairing coefficient by u. -/
def pairingChangeGenerator (u : Rˣ) (coefficient : R) : R := (u⁻¹ : Rˣ) * coefficient

/-- Changing the chosen torsion generator by a unit divides its pairing coordinate by that unit. -/
theorem pairingCoefficient_changeGenerator (u : Rˣ) (coefficient : R) :
    (u : R) * pairingChangeGenerator u coefficient = coefficient := sorry


/-- Test levelAction_adjugate: diagonal (a,d) dualizes to diagonal (d,a). -/
example (γ : GL (Fin 2) R) (a d : R) (hγ : (γ : Matrix (Fin 2) (Fin 2) R) = !![a, 0; 0, d]) :
    (TauCeti.adjugateGL γ : Matrix (Fin 2) (Fin 2) R) = !![d, 0; 0, a] := sorry

/-- Test levelAction_vs_rightTranslation, matrix portion: the multiplier is the dual,
which is not γ for a nonscalar diagonal. -/
example : (6 : ℚ) • (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ)⁻¹ ≠
    (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) := sorry

/-- Test pairingCoefficient_diag, coefficient portion. -/
example (a d : R) : pairingCoefficient (!![a, 0; 0, d] : Matrix (Fin 2) (Fin 2) R) = a * d := sorry


/-- The identity level change fixes every coefficient matrix. -/
example (α : Matrix (Fin 2) (Fin 2) R) : levelAction 1 α = α := sorry

/-- Rescaling the target generator by 2 changes the coordinate 6 to 3. -/
example : pairingChangeGenerator (Units.mk0 (2 : ℚ) (by norm_num)) 6 = 3 := by
  norm_num [pairingChangeGenerator]

end HilbertTower.Coefficients

/-! ## Layer 6: general period maps and abelian descent -/

/-! ### Conditional double-coset identity

The two factorizations of H are additional hypotheses. A rational Iwahori decomposition
does not supply them for a parabolic defined only over a splitting field.
-/

namespace AnalyticLevelGroup

/-- If H factors in both parabolic/opposite-unipotent orders and t lies in P and normalises the opposite subgroup, the parabolic part of HtH equals (H∩P)t(H∩P). -/
theorem doubleCoset_inf_parabolic {G : Type*} [Group G] (P Ubar H : Subgroup G)
    (hPU : P ⊓ Ubar = ⊥) (t : G) (htP : t ∈ P) (ht : ∀ u ∈ Ubar, t⁻¹ * u * t ∈ Ubar)
    (hfac : ∀ h ∈ H, ∃ a ∈ H ⊓ P, ∃ b ∈ H ⊓ Ubar, h = a * b)
    (hfac' : ∀ h ∈ H, ∃ b ∈ H ⊓ Ubar, ∃ a ∈ H ⊓ P, h = b * a)
    {k k' : G} (hk : k ∈ H) (hk' : k' ∈ H) (hP : k * t * k' ∈ P) :
    ∃ a ∈ H ⊓ P, ∃ a' ∈ H ⊓ P, k * t * k' = a * t * a' := sorry

/-- The cancelled factors: with `t = 1`, `k = u` and `k' = u⁻¹` the product lies in every `P`,
whatever `u` is, so membership in `P` cannot force the factors to be `1`. -/
example {G : Type*} [Group G] (P : Subgroup G) (u : G) : u * 1 * u⁻¹ ∈ P := by simp

end AnalyticLevelGroup

/-- With P trivial and H and the opposite subgroup equal to G, the two factorizations
hold. For t different from 1 the parabolic-membership premise holds with k = t⁻¹, k′ = 1,
but the conclusion fails. Thus the condition t ∈ P is necessary. -/
example {G : Type*} [Group G] (t : G) (ht : t ≠ 1) :
    t⁻¹ * t * 1 ∈ (⊥ : Subgroup G) ∧
      ¬ (∃ a ∈ (⊥ : Subgroup G), ∃ a' ∈ (⊥ : Subgroup G),
        t⁻¹ * t * 1 = a * t * a') := by
  simp [Ne.symm ht]

/-- Opposite unipotent cancellation: nonidentity upper-unipotent elements can cancel.
Thus membership of a product in a parabolic cannot force both factors to be the identity. -/
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) * !![1, -1; 0, 1] = 1 ∧
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) ≠ 1 := by decide



/-! The following geometric definitions and their APIs remain in README.md:

Layer 0: ShimuraTower.pLevel, pLevelMin, toMin, translate, primeToPHecke,
quotientAction, infiniteLevel, infiniteLevelMin, infiniteLevel.proj,
PerfectoidRepresentative (diamondIso, ofDiamondIso), neutralComponent,
neutralComponent.toFull, neutralSymmetry, connectedDatumTower, Rigidified
(quotientIso, infiniteLevel, trivial).
Layer 0.general: ShimuraTower.generalInfiniteLevel, toroidal,
toroidalInfiniteLevel (openEmbedding, toMin, refine).
Layer 1: SiegelTorsion.integralMin, hasseDomain, finiteLevel, finiteLevel_hasse,
GoodTriple (of_hasse_chart), SiegelTorsion.anticanonical,
anticanonical_integralModel, normalizedTrace and normalizedTrace_linear on completed tower rings,
htMapTop, htMap, openTower.
Layer 2: HodgeTower.embedding, toSiegel, imageCompactification, minToImage.
Layer 3: HodgeTate.FL, leviTorsor, associatedBundle, associatedBundle_tensor,
the analytic siegelGraphChart, graphDistanceDomain and pulled-back hodgeFrame.
Layer 4: ShimuraTower.PropertyP, ConnectedPropertyP, propertyP_hodge.
Layer 5: HilbertTower.geometric, intermediate, arithmetic, beta1, beta2,
the geometric levelAction, polAction, weilPairing, weilPairing_arith, qpAction.
Layer 6: AbelianType.hodgeCover, lovering, deltaGroup; LevelGroup.mk;
BruhatTube.mk; the logarithmic, de Rham and Hodge–Tate torsors.
-/

end TauCetiRoadmap.PerfectoidShimuraVarieties
