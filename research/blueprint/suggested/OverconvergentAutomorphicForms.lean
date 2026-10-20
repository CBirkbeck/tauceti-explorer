/-
# Suggested Lean forms: overconvergent automorphic coefficients

This file is not the roadmap and is not exhaustive. The roadmap document
`OverconvergentAutomorphicForms.md` is definitive. These statements suggest Lean
forms so that contributors and reviewers converge on names and signatures.
New theorem proofs are placeholders; nothing here claims to be formalised.

Baseline: Mathlib 082e2d3; Tau Ceti f790474. The reader contains every target,
API, Check and worked example. This file uses existing algebraic and topological
carriers. Analytic induction, coefficient sheaves, Igusa towers and their
comparisons are reader targets until their supplying roadmaps provide carriers.
-/

import Mathlib

open NumberField TensorProduct

noncomputable section

namespace TauCeti.HilbertWeight

variable (F : Type*) [Field F] [NumberField F] (p : ℕ) [Fact p.Prime]

/-- O0/units-at-p: the integral algebra with scalars on the left. -/
abbrev Op : Type _ := ℤ_[p] ⊗[ℤ] 𝓞 F

instance : Module.Finite ℤ_[p] (Op F p) := inferInstance
instance : Module.Free ℤ_[p] (Op F p) := inferInstance
instance : TopologicalSpace (Op F p) := moduleTopology ℤ_[p] (Op F p)
instance : IsModuleTopology ℤ_[p] (Op F p) := ⟨rfl⟩
instance : IsTopologicalRing (Op F p) :=
  IsModuleTopology.isTopologicalRing ℤ_[p] (Op F p)

/-- The compact finite-free algebra underlying the compact weight torus. -/
theorem compactSpace_Op : CompactSpace (Op F p) := by
  sorry

theorem finrank_Op : Module.finrank ℤ_[p] (Op F p) = Module.finrank ℚ F := by
  sorry

/-- O0/norm-at-p: the determinant norm on the full integral algebra. -/
def normAlgebra : Op F p →* ℤ_[p] :=
  Algebra.norm ℤ_[p]

/-- Compatibility on every integral element, before restriction to units. -/
theorem norm_tmul_one (a : 𝓞 F) :
    normAlgebra F p ((1 : ℤ_[p]) ⊗ₜ[ℤ] a) =
      ((Algebra.norm ℤ a : ℤ) : ℤ_[p]) := by
  sorry

/-- O0/norm-at-p: restrict the determinant norm to units. -/
def normUnits : (Op F p)ˣ →* ℤ_[p]ˣ :=
  Units.map (normAlgebra F p)

theorem continuous_normUnits : Continuous (normUnits F p) := by
  sorry

/-- Global units map to the actual integral algebra. -/
def unitsToOp : (𝓞 F)ˣ →* (Op F p)ˣ :=
  Units.map (Algebra.TensorProduct.includeRight : 𝓞 F →ₐ[ℤ] Op F p).toMonoidHom

/-- Compatibility with the global determinant norm. -/
theorem normUnits_unitsToOp (η : (𝓞 F)ˣ) :
    (normUnits F p (unitsToOp F p η) : ℤ_[p]) =
      ((Algebra.norm ℤ (η : 𝓞 F) : ℤ) : ℤ_[p]) := by
  sorry

/-- O0/principal-units: kernel of reduction on units. -/
def principalUnits (r : ℕ) : Subgroup (Op F p)ˣ :=
  (Units.map (Ideal.Quotient.mk (Ideal.span {((p : Op F p)) ^ r})).toMonoidHom).ker

theorem open_finiteIndex_principalUnits (r : ℕ) :
    IsOpen (principalUnits F p r : Set (Op F p)ˣ) ∧
      (principalUnits F p r).FiniteIndex := by
  sorry

section Weights

variable (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- O0/geometric-weight-characters: points, with representability owned by PMIA. -/
abbrev GeomWeight := ContinuousMonoidHom (Op F p)ˣ Rˣ

/-- O0/arithmetic-weight-characters: the two compact torus coordinates. -/
abbrev ArithWeight := ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ

/-- The pair of characters `(w,t)`. -/
def ArithWeight.mk (w : GeomWeight F p R)
    (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) : ArithWeight F p R :=
  (w.comp (ContinuousMonoidHom.fst _ _)) *
    (t.comp (ContinuousMonoidHom.snd _ _))

/-- O0/weight-dual-group-map: the norm coordinate is inverted. -/
def weightDualMap : ContinuousMonoidHom (Op F p)ˣ ((Op F p)ˣ × ℤ_[p]ˣ) where
  toMonoidHom :=
    { toFun := fun x ↦ (x ^ 2, (normUnits F p x)⁻¹)
      map_one' := by simp
      map_mul' := fun x y ↦ by
        ext1 <;> simp only [Prod.fst_mul, Prod.snd_mul, map_mul, mul_inv]
        exact mul_pow x y 2 }
  continuous_toFun :=
    (continuous_id.pow 2).prodMk (continuous_normUnits F p).inv

/-- O0/weight-comparison: pullback along the genuine continuous group map. -/
def weightMap (κ : ArithWeight F p R) : GeomWeight F p R :=
  κ.comp (weightDualMap F p)

/-- O0/weight-comparison-formula. -/
theorem weightMap_mk_apply (w : GeomWeight F p R)
    (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w t) x =
      w x ^ 2 * (t (normUnits F p x))⁻¹ := by
  sorry

/-- O4/effective-arithmetic-descent: all congruence units have norm one.
Total positivity is unnecessary for the central kernel. -/
theorem congruence_unit_norm_one (N : ℕ) (hN : 4 ≤ N) (η : (𝓞 F)ˣ)
    (hη : (η : 𝓞 F) - 1 ∈ Ideal.span {(N : 𝓞 F)}) :
    normUnits F p (unitsToOp F p η) = 1 := by
  sorry

/-- Central cancellation, also for congruence units with mixed real signs. -/
theorem weightMap_mk_congruenceUnit (N : ℕ) (hN : 4 ≤ N)
    (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (η : (𝓞 F)ˣ) (hη : (η : 𝓞 F) - 1 ∈ Ideal.span {(N : 𝓞 F)}) :
    (weightMap F p R (ArithWeight.mk F p R w t) (unitsToOp F p η))⁻¹ *
      w (unitsToOp F p η) ^ 2 = 1 := by
  sorry

/-- Checks the inverse norm sign with a free norm character. -/
example (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R 1 t) x =
      (t (normUnits F p x))⁻¹ := by
  change 1 * t ((normUnits F p x)⁻¹) = _
  simp only [one_mul, map_inv]

example (w : GeomWeight F p R) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w 1) x = w x ^ 2 := by
  change w (x ^ 2) * 1 = _
  simp only [mul_one, map_pow]

end Weights
end TauCeti.HilbertWeight

namespace TauCeti.Overconvergent

/-- O1/right-automorphy-cocycle: inversion converts a left cocycle to
the right cocycle for `x ⋅ γ = γ⁻¹ • x`; invert the coefficient as well. -/
theorem right_cocycle_of_left {Γ X C : Type*} [Group Γ] [Group C]
    [MulAction Γ X] (K : Γ → X → C)
    (hK : ∀ γ δ x, K (γ * δ) x = K γ (δ • x) * K δ x)
    (γ δ : Γ) (x : X) :
    (K (γ * δ)⁻¹ x)⁻¹ = (K γ⁻¹ x)⁻¹ * (K δ⁻¹ (γ⁻¹ • x))⁻¹ := by
  sorry

namespace Siegel

variable {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]

/-- O8/graph-normalisation, on the invertible-denominator locus. -/
theorem graph_normalisation (A B C D Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det) :
    Matrix.fromCols (1 : Matrix n n R) Z * Matrix.fromBlocks A B C D =
      (A + Z * C) * Matrix.fromCols (1 : Matrix n n R)
        ((A + Z * C)⁻¹ * (B + Z * D)) := by
  sorry

/-- The standard-to-antidiagonal symplectic basis conversion preserves the
quotient-frame factor: `Z` becomes `Z * W` and `C` becomes `W * C`. -/
example (A C Z W : Matrix n n R) (hW : W * W = 1) :
    A + (Z * W) * (W * C) = A + Z * C := by
  calc
    A + (Z * W) * (W * C) = A + Z * ((W * W) * C) := by
      simp only [mul_assoc]
    _ = A + Z * C := by rw [hW, one_mul]

/-- O8/factor-composition: preserve the order of the two factors. -/
theorem factor_composition (A B C D E F G H Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det) :
    (A * E + B * G) + Z * (C * E + D * G) =
      (A + Z * C) * (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G) := by
  sorry

/-- O8/coordinate-composition. -/
theorem coordinate_composition (A B C D E F G H Z : Matrix n n R)
    (hJ : IsUnit (A + Z * C).det)
    (hK : IsUnit (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G).det) :
    (((A * E + B * G) + Z * (C * E + D * G))⁻¹ *
      ((A * F + B * H) + Z * (C * F + D * H))) =
    (E + ((A + Z * C)⁻¹ * (B + Z * D)) * G)⁻¹ *
      (F + ((A + Z * C)⁻¹ * (B + Z * D)) * H) := by
  sorry

/-- O8/antidiagonal-dual-factor: the transposed lower block precedes Z. -/
theorem antidiagonal_dual_factor (W A C Z : Matrix n n R)
    (hW : W * W = 1) (hZ : W * Z.transpose * W = Z) :
    W * (A + Z * C).transpose * W =
      W * A.transpose * W + (W * C.transpose * W) * Z := by
  sorry

/-- O8/determinant-character-cocycle, applied to actual invertible factors. -/
theorem determinant_character_cocycle {S : Type*} [CommRing S]
    (j k : Matrix.GeneralLinearGroup n R) (χ : Rˣ →* Sˣ) :
    (χ (Matrix.GeneralLinearGroup.det (j * k)))⁻¹ =
      (χ (Matrix.GeneralLinearGroup.det j))⁻¹ *
        (χ (Matrix.GeneralLinearGroup.det k))⁻¹ := by
  sorry

/-- O8/determinant-line-map: its algebraic function formula. Analytic
restriction belongs to the reader's coefficient construction. -/
def determinantLineMap {S : Type*} [CommRing S] (χ : Rˣ →* Sˣ) :
    S →ₗ[S] (Matrix.GeneralLinearGroup n R → S) where
  toFun a g := a * (χ (Matrix.GeneralLinearGroup.det g) : S)
  map_add' a b := by funext g; exact add_mul a b _
  map_smul' r a := by funext g; simp [mul_assoc]

theorem determinantLineMap_injective {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) : Function.Injective (determinantLineMap (n := n) χ) := by
  sorry

/-- O8/atkin-lehner-chart: its target is the other graph chart. -/
theorem atkin_lehner_chart (q : R) (Z : Matrix n n R) :
    Matrix.fromCols (1 : Matrix n n R) Z *
      Matrix.fromBlocks (0 : Matrix n n R) 1 (-(q • (1 : Matrix n n R))) 0 =
    Matrix.fromCols (-(q • Z)) (1 : Matrix n n R) := by
  sorry

example {S : Type*} [CommRing S] (a : S) (g : Matrix.GeneralLinearGroup n R) :
    determinantLineMap (1 : Rˣ →* Sˣ) a g = a := by
  simp [determinantLineMap]

example (h : (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ).det ≠ 0) :
    determinantLineMap (MonoidHom.id ℚˣ) 1
      (Matrix.GeneralLinearGroup.mkOfDetNeZero !![2, 0; 0, 3] h) = 6 := by
  norm_num [determinantLineMap, Matrix.GeneralLinearGroup.det,
    Matrix.GeneralLinearGroup.mkOfDetNeZero, Matrix.det_fin_two]

/-- Noncommuting factors detect reversed cocycle multiplication. -/
example :
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 1, 1] ≠
      (!![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 1; 0, 1] := by
  intro h
  have h00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℚ ↦ M 0 0) h
  norm_num [Matrix.mul_apply, Fin.sum_univ_succ] at h00

/-- A lower symplectic block distinguishes the two dual-factor orders. -/
example :
    let W : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 1, 0]
    let Z : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    let C : Matrix (Fin 2) (Fin 2) ℚ := !![0, 0; 3, 0]
    W * (1 + Z * C).transpose * W ≠ 1 + Z * (W * C.transpose * W) := by
  dsimp only
  intro h
  have h00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℚ ↦ M 0 0) h
  norm_num [Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_succ] at h00

end Siegel
end TauCeti.Overconvergent
