import Mathlib

/-!
# OverconvergentAutomorphicForms: representative target signatures

The roadmap is README.md. This file records light definitions and theorem
signatures statable against the pinned APIs and is not exhaustive. It fixes the
integral tensor algebra, the inverse norm coordinate, the conversion from left
to right automorphy, and the antidiagonal dual and determinant-line conventions.
-/

open NumberField TensorProduct

noncomputable section

namespace TauCetiRoadmap.OverconvergentAutomorphicForms

/-! ## Layer 0: weights and analytic coefficient representations -/

namespace HilbertWeight

variable (F : Type*) [Field F] [NumberField F] (p : ℕ) [Fact p.Prime]

/-- The integral algebra with scalars on the left. -/
abbrev Op : Type _ := ℤ_[p] ⊗[ℤ] 𝓞 F

/-- Base change preserves finiteness of the integral lattice. -/
instance : Module.Finite ℤ_[p] (Op F p) := inferInstance
/-- Base change preserves a basis of the integral lattice. -/
instance : Module.Free ℤ_[p] (Op F p) := inferInstance
/-- The finite-module topology over the p-adic integers. -/
instance : TopologicalSpace (Op F p) := moduleTopology ℤ_[p] (Op F p)
/-- The chosen topology is the module topology. -/
instance : IsModuleTopology ℤ_[p] (Op F p) := ⟨rfl⟩
/-- Multiplication is continuous for the module topology. -/
instance : IsTopologicalRing (Op F p) :=
  IsModuleTopology.isTopologicalRing ℤ_[p] (Op F p)

/-- The compact finite-free algebra underlying the compact weight torus. -/
theorem compactSpace_Op : CompactSpace (Op F p) := by
  sorry

/-- The integral algebra has the degree of the number field as its rank. -/
theorem finrank_Op : Module.finrank ℤ_[p] (Op F p) = Module.finrank ℚ F := by
  sorry

/-- the determinant norm on the full integral algebra. -/
def normAlgebra : Op F p →* ℤ_[p] :=
  Algebra.norm ℤ_[p]

/-- Compatibility on every integral element, before restriction to units. -/
theorem norm_tmul_one (a : 𝓞 F) :
    normAlgebra F p ((1 : ℤ_[p]) ⊗ₜ[ℤ] a) =
      ((Algebra.norm ℤ a : ℤ) : ℤ_[p]) := by
  sorry

/-- restrict the determinant norm to units. -/
def normUnits : (Op F p)ˣ →* ℤ_[p]ˣ :=
  Units.map (normAlgebra F p)

/-- The determinant norm is continuous on the compact unit group. -/
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

/-- kernel of reduction on units. -/
def principalUnits (r : ℕ) : Subgroup (Op F p)ˣ :=
  (Units.map (Ideal.Quotient.mk (Ideal.span {((p : Op F p)) ^ r})).toMonoidHom).ker

/-- Principal congruence subgroups are open and have finite index, including depth zero. -/
theorem open_finiteIndex_principalUnits (r : ℕ) :
    IsOpen (principalUnits F p r : Set (Op F p)ˣ) ∧
      (principalUnits F p r).FiniteIndex := by
  sorry

example : Module.Finite ℤ_[p] (Op F p) := inferInstance

example (a : ℤ_[p]) :
    normAlgebra F p (algebraMap ℤ_[p] (Op F p) a) =
      a ^ Module.finrank ℤ_[p] (Op F p) := by
  exact Algebra.norm_algebraMap a

example (u : (Op F p)ˣ) :
    (normUnits F p u : ℤ_[p]) = normAlgebra F p (u : Op F p) := by
  rfl

example (η : (𝓞 F)ˣ) :
    (unitsToOp F p η : Op F p) = (1 : ℤ_[p]) ⊗ₜ[ℤ] (η : 𝓞 F) := by
  rfl

example : principalUnits F p 0 = ⊤ := by
  ext x
  simp only [Subgroup.mem_top, iff_true]
  change (Units.map (Ideal.Quotient.mk
    (Ideal.span {((p : Op F p)) ^ 0})).toMonoidHom) x = 1
  have hI : Ideal.span {((p : Op F p)) ^ 0} = ⊤ := by simp
  let : Subsingleton (Op F p ⧸ Ideal.span {((p : Op F p)) ^ 0}) :=
    Ideal.Quotient.subsingleton_iff.mpr hI
  exact Subsingleton.elim _ _

section Weights

variable (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- Geometric character points; rigid realization is a separate target. -/
abbrev GeomWeight := ContinuousMonoidHom (Op F p)ˣ Rˣ

/-- Arithmetic characters have two compact torus coordinates. -/
abbrev ArithWeight := ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ

/-- The pair of characters `(w,t)`. -/
def ArithWeight.mk (w : GeomWeight F p R)
    (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) : ArithWeight F p R :=
  (w.comp (ContinuousMonoidHom.fst _ _)) *
    (t.comp (ContinuousMonoidHom.snd _ _))

/-- the norm coordinate is inverted. -/
def weightDualMap : ContinuousMonoidHom (Op F p)ˣ ((Op F p)ˣ × ℤ_[p]ˣ) where
  toMonoidHom :=
    { toFun := fun x ↦ (x ^ 2, (normUnits F p x)⁻¹)
      map_one' := by simp
      map_mul' := fun x y ↦ by
        ext1 <;> simp only [Prod.fst_mul, Prod.snd_mul, map_mul, mul_inv]
        exact mul_pow x y 2 }
  continuous_toFun :=
    (continuous_id.pow 2).prodMk (continuous_normUnits F p).inv

/-- pullback along the genuine continuous group map. -/
def weightMap (κ : ArithWeight F p R) : GeomWeight F p R :=
  κ.comp (weightDualMap F p)

/-- The geometric weight is the square character times the inverse norm character. -/
theorem weightMap_mk_apply (w : GeomWeight F p R)
    (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w t) x =
      w x ^ 2 * (t (normUnits F p x))⁻¹ := by
  sorry

/-- all congruence units have norm one.
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

example (w : GeomWeight F p R) (x : (Op F p)ˣ) :
    ArithWeight.mk F p R w 1 (x, 1) = w x := by
  simp [ArithWeight.mk]

example : weightDualMap F p 1 = (1, 1) := by
  exact map_one _

end Weights
end HilbertWeight

/-! ## Layer 1: right automorphy and coefficient descent -/

/-- inversion converts a left cocycle to
the right cocycle for `x ⋅ γ = γ⁻¹ • x`; invert the coefficient as well. -/
theorem right_cocycle_of_left {Γ X C : Type*} [Group Γ] [Group C]
    [MulAction Γ X] (K : Γ → X → C)
    (hK : ∀ γ δ x, K (γ * δ) x = K γ (δ • x) * K δ x)
    (γ δ : Γ) (x : X) :
    (K (γ * δ)⁻¹ x)⁻¹ = (K γ⁻¹ x)⁻¹ * (K δ⁻¹ (γ⁻¹ • x))⁻¹ := by
  sorry

/-- Noncommuting inverse factors detect the order in a two-step cocycle. -/
example :
    (!![1, 0; -1, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, -1; 0, 1] ≠
      (!![1, -1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; -1, 1] := by
  intro h
  have h00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℚ ↦ M 0 0) h
  norm_num [Matrix.mul_apply, Fin.sum_univ_succ] at h00

/-! ## Layer 6: the wild coefficient-map normalization -/

namespace HilbertAutomorphy

variable {R : Type*} [CommRing R]

/-- The lower-row denominator of the Hilbert fractional coordinate action. -/
def lowerFactor (γ : Matrix (Fin 2) (Fin 2) R) (z : R) : R :=
  γ 1 0 * z + γ 1 1

/-- Conjugation by the uniformizer matrix preserves the denominator after scaling z.
The uniformizer is a unit in the generic-fibre coefficient algebra. -/
theorem wild_factor_conjugation (ϖ : Rˣ) (γ : Matrix (Fin 2) (Fin 2) R) (z : R) :
    lowerFactor
      (Matrix.diagonal ![(ϖ : R), 1] * γ *
        Matrix.diagonal ![((ϖ⁻¹ : Rˣ) : R), 1]) ((ϖ : R) * z) =
      lowerFactor γ z := by
  sorry

/-- A diagonal acts on the denominator through its lower diagonal entry. -/
example (a d z : R) : lowerFactor !![a, 0; 0, d] z = d := by
  simp [lowerFactor]

/-- At p=5 the reversed conjugation changes a unit denominator from 126 to 3126. -/
example :
    lowerFactor
      ((!![5, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 25, 1] *
        !![1 / 5, 0; 0, 1]) 25 = 126 ∧
    lowerFactor
      ((!![1 / 5, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 25, 1] *
        !![5, 0; 0, 1]) 25 = 3126 := by
  norm_num [lowerFactor, Matrix.mul_apply, Fin.sum_univ_succ]

end HilbertAutomorphy

/-! ## Layer 8: Siegel and general-group coefficient comparisons -/

namespace Siegel

variable {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]

/-- The dual factor in the antidiagonal symplectic basis. -/
def antidiagonalDualFactor (W A C Z : Matrix n n R) : Matrix n n R :=
  W * (A + Z * C).transpose * W

/-- The transposed lower block precedes the period coordinate in the dual factor. -/
theorem antidiagonal_dual_factor (W A C Z : Matrix n n R)
    (hW : W * W = 1) (hZ : W * Z.transpose * W = Z) :
    antidiagonalDualFactor W A C Z =
      W * A.transpose * W + (W * C.transpose * W) * Z := by
  sorry

/-- The algebraic determinant-line function; analytic restriction is a separate target. -/
def determinantLineMap {S : Type*} [CommRing S] (χ : Rˣ →* Sˣ) :
    S →ₗ[S] (Matrix.GeneralLinearGroup n R → S) where
  toFun a g := a * (χ (Matrix.GeneralLinearGroup.det g) : S)
  map_add' a b := by funext g; exact add_mul a b _
  map_smul' r a := by funext g; simp [mul_assoc]

/-- Evaluation at the identity recovers the scalar. -/
theorem determinantLineMap_injective {S : Type*} [CommRing S]
    (χ : Rˣ →* Sˣ) : Function.Injective (determinantLineMap (n := n) χ) := by
  sorry

/-- The scaled Atkin–Lehner matrix lands in the other graph chart. -/
theorem atkin_lehner_chart (q : R) (Z : Matrix n n R) :
    Matrix.fromCols (1 : Matrix n n R) Z *
      Matrix.fromBlocks (0 : Matrix n n R) 1 (-(q • (1 : Matrix n n R))) 0 =
    Matrix.fromCols (-(q • Z)) (1 : Matrix n n R) := by
  sorry

example {S : Type*} [CommRing S] (a : S) (g : Matrix.GeneralLinearGroup n R) :
    determinantLineMap (1 : Rˣ →* Sˣ) a g = a := by
  simp [determinantLineMap]

example :
    determinantLineMap (MonoidHom.id ℚˣ) 1
      (Matrix.GeneralLinearGroup.mkOfDetNeZero !![2, 0; 0, 3]
        (by norm_num [Matrix.det_fin_two])) = 6 := by
  norm_num [determinantLineMap, Matrix.GeneralLinearGroup.det,
    Matrix.GeneralLinearGroup.mkOfDetNeZero, Matrix.det_fin_two]

/-- A lower symplectic block distinguishes the two dual-factor orders. -/
example :
    let W : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 1, 0]
    let Z : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    let C : Matrix (Fin 2) (Fin 2) ℚ := !![0, 0; 3, 0]
    antidiagonalDualFactor W 1 C Z ≠ 1 + Z * (W * C.transpose * W) := by
  dsimp only
  intro h
  have h00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℚ ↦ M 0 0) h
  norm_num [antidiagonalDualFactor, Matrix.mul_apply, Matrix.vecMul, dotProduct,
    Matrix.add_apply, Fin.sum_univ_succ] at h00

/-- In rank one the dual factor agrees with the scalar denominator. -/
example (a c z : R) :
    antidiagonalDualFactor (1 : Matrix (Fin 1) (Fin 1) R)
      (fun _ _ ↦ a) (fun _ _ ↦ c) (fun _ _ ↦ z) 0 0 = a + z * c := by
  unfold antidiagonalDualFactor
  rw [one_mul, mul_one]
  change a + ∑ _ : Fin 1, z * c = a + z * c
  simp

/-- The other graph chart gives [-6,1] at q=2 and z=3. -/
example :
    Matrix.fromCols (!![1] : Matrix (Fin 1) (Fin 1) ℚ) !![3] *
      Matrix.fromBlocks (!![0] : Matrix (Fin 1) (Fin 1) ℚ) !![1] !![-2] !![0] =
      Matrix.fromCols (!![-6] : Matrix (Fin 1) (Fin 1) ℚ) !![1] := by
  rw [Matrix.fromCols_mul_fromBlocks]
  congr 1 <;> ext i j <;> fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.mul_apply, Fin.sum_univ_succ]

end Siegel

/-
The following constructions remain README targets:
hilbertWeightSpace, arithmeticWeightSpace, proWeightRadius, boundedWeightFamily,
finiteAnalyticCoefficient, coefficientTensor, coefficientDual, coefficientBaseChange,
analyticInduction, locallyAnalyticInduction, analyticDistribution,
locallyAnalyticDistribution, inductionProduct, siegelAnalyticCoefficient,
siegelTransposeAction, siegelCoefficientProduct, groupAnalyticDistributions,
frechetSteinStructure, coadmissibleModule, analyticVectors,
admissibleBanachRepresentation, admissibleAnalyticRepresentation, fullCharacterSpace,
essentiallyAdmissibleRepresentation, finiteSlopePart, positiveJacquetHecke,
locallyAnalyticJacquet, unitaryCompletedCoefficient, unitaryJacquetCoefficients,
unitaryCoefficientEigenvariety, unitaryClassicalPoint, RightAutomorphyCocycle,
analyticCoefficientSheaf, HilbertCoefficientDomain, hilbertFactor, hilbertWeightFactor,
geometricHilbertSheaf, integralHilbertSheaf, hilbertWeightPullback,
integralHilbertWeightPullback, fixedRadiusHilbertForms, integralFixedRadiusHilbertForms,
overconvergentHilbertForms, integralOverconvergentHilbertForms, hilbertModifiedCoefficient,
smallGeometricCoefficient, fullGeometricCoefficient, intermediateArithmeticCoefficient,
fullArithmeticCoefficient, twistedPolarisationAction, finitePolarisationDescent,
arithmeticClassForms, aipAnalyticCoefficient, aipIntegralCoefficient,
aipUniversalFormalLine, aipFiniteCharacter, aipFullFormalCoefficient,
finiteCharacterGenerator, hilbertCuspSheaf, fixedRadiusHilbertCuspForms,
overconvergentHilbertCuspForms, tameHilbertHecke, wildHilbertHecke, hilbertDiamond,
familyHilbertQExpansion, hilbertCuspBanach, cuspRadiusRestriction,
hilbertControllingOperator, ordinaryCompletedFunctionsPlus, ordinaryCompletedFunctions,
ordinaryWeightedFormsPlus, ordinaryWeightedForms, ordinaryRestriction,
siegelScalarCoefficient, siegelAlgebraicCoefficient, siegelAnalyticSheaf,
siegelIntegralAnalyticSheaf, toroidalAnalyticCoefficient, reducedDomainCoefficient,
bruhatCoefficientFamily, bruhatDistributionFamily.
-/

end TauCetiRoadmap.OverconvergentAutomorphicForms
