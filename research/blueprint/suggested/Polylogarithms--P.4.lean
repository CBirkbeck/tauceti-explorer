import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Homology.QuasiIso
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.FieldTheory.RatFunc.Basic

/-!
This file is not the roadmap and is not exhaustive. The reader document
Polylogarithms--P.4.md is definitive. These statements suggest Lean forms so
contributors and reviewers can converge on names and signatures.

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
All packet nodes remain unchecked. `sorry` marks proposed proofs, not results.

The accepted parent owns B_n, the actual delta maps, L_n, number-field embedding
coordinates and K-groups. Those definitions are not available as Lean imports.
This file therefore prototypes the new linear algebra on actual Mathlib tensor
products, exterior powers, kernels, quotients, determinants and cochain complexes.
Parameters sp, u, p, r and the boundary maps stand for those imported maps, not
arbitrary replacements asserted to satisfy the mathematical source theorems.
Their compatibility hypotheses are stated explicitly.

Full relation-specialization induction, analytic differential factorization,
Suslin rigidity, number-field normalization and the GR regulator interface
cannot yet be stated against the missing parent/supplier Lean definitions.
They are omitted, not replaced by Prop fields. Their precise statements and
proof steps are in the packet. Below are their concrete linear/topological
reductions, including the six named theorem nodes' available signature parts.
The test identifiers are attached to `example`s by comments.
-/

noncomputable section

open scoped TensorProduct
open CategoryTheory

namespace TauCeti.Polylog.WeightFour

universe u

section Specialization
variable {B B' B'' U U' U'' : Type u}
variable [AddCommGroup B] [Module ℚ B] [AddCommGroup B'] [Module ℚ B']
variable [AddCommGroup B''] [Module ℚ B'']
variable [AddCommGroup U] [Module ℚ U] [AddCommGroup U'] [Module ℚ U']
variable [AddCommGroup U''] [Module ℚ U'']

def specializeTerm (j : ℕ) (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U') :
    B ⊗[ℚ] (⋀[ℚ]^j U) →ₗ[ℚ] B' ⊗[ℚ] (⋀[ℚ]^j U') :=
  TensorProduct.map sp (exteriorPower.map j u)

theorem specializeTerm_tmul (j : ℕ) (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U')
    (b : B) (Y : ⋀[ℚ]^j U) :
    specializeTerm j sp u (b ⊗ₜ[ℚ] Y) = sp b ⊗ₜ[ℚ] exteriorPower.map j u Y := by
  sorry

def specializeLast (n : ℕ) (u : U →ₗ[ℚ] U') : ⋀[ℚ]^n U →ₗ[ℚ] ⋀[ℚ]^n U' :=
  exteriorPower.map n u

theorem specializeTerm_comp (j : ℕ) (sp : B →ₗ[ℚ] B') (sp' : B' →ₗ[ℚ] B'')
    (u : U →ₗ[ℚ] U') (u' : U' →ₗ[ℚ] U'') :
    (specializeTerm j sp' u').comp (specializeTerm j sp u) =
      specializeTerm j (sp'.comp sp) (u'.comp u) := by
  sorry

theorem specializeTerm_id (j : ℕ) :
    specializeTerm j (LinearMap.id : B →ₗ[ℚ] B) (LinearMap.id : U →ₗ[ℚ] U) =
      LinearMap.id := by
  sorry

theorem specializeLast_wedge (n : ℕ) (u : U →ₗ[ℚ] U') (x : Fin n → U) :
    specializeLast n u (exteriorPower.ιMulti ℚ n x) =
      exteriorPower.ιMulti ℚ n (u ∘ x) := by
  sorry

-- TauCeti.Polylog.WeightFour.specialize_unit_product
-- Apply to the actual additive unit classes t, 2/t and 2 once the parent exists.
example (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U') (b : B)
    (t invtwo two : U) (h : t + invtwo = two) :
    specializeTerm 1 sp u (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 1 (fun _ => two)) =
      specializeTerm 1 sp u (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 1 (fun _ => t)) +
      specializeTerm 1 sp u (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 1 (fun _ => invtwo)) := by
  sorry

-- TauCeti.Polylog.WeightFour.specialize_uniformizer
example (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U') (b : B) (π : U) (hπ : u π = 0) :
    specializeTerm 1 sp u (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 1 (fun _ => π)) = 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.specialize_constant_tensor
example (b : B) (x : Fin 2 → U) :
    specializeTerm 2 LinearMap.id LinearMap.id
      (b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 2 x) = b ⊗ₜ[ℚ] exteriorPower.ιMulti ℚ 2 x := by
  sorry

-- TauCeti.Polylog.WeightFour.specialize_pole_symbol
example (j : ℕ) (sp : B →ₗ[ℚ] B') (u : U →ₗ[ℚ] U') (b : B)
    (hb : sp b = 0) (Y : ⋀[ℚ]^j U) : specializeTerm j sp u (b ⊗ₜ[ℚ] Y) = 0 := by
  sorry

-- relation-specialization-induction: the native quotient-descent reduction.
-- The hypothesis is exactly the unresolved relation-preservation input.
theorem relationSpecialization_descend (R : Submodule ℚ B) (R' : Submodule ℚ B')
    (sp : B →ₗ[ℚ] B') (h : ∀ x ∈ R, sp x ∈ R') :
    ∃ S : (B ⧸ R) →ₗ[ℚ] (B' ⧸ R'), S.comp R.mkQ = R'.mkQ.comp sp := by
  sorry

-- higher-symbol-inversion: even endpoint consequence of imported inversion.
theorem higherSymbolInversion_even_one (oneSymbol : B)
    (inversion_at_one : oneSymbol + oneSymbol = 0) : oneSymbol = 0 := by
  sorry
end Specialization

section Evaluation
-- `none` encodes the projective infinity point. eval is the parent's projective
-- evaluation, never RatFunc.eval's totalized field value at a pole.
variable (L : Option ℂ → ℝ) (eval : RatFunc ℂ → ℂ → Option ℂ)

def cycleEvaluation : (RatFunc ℂ →₀ ℚ) →ₗ[ℚ] (ℂ → ℝ) :=
  Finsupp.linearCombination ℚ (fun f a => L (eval f a))

theorem cycleEvaluation_single (f : RatFunc ℂ) (q : ℚ) (a : ℂ) :
    cycleEvaluation L eval (Finsupp.single f q) a = (q : ℝ) * L (eval f a) := by
  sorry

theorem cycleEvaluation_add (α β : RatFunc ℂ →₀ ℚ) (a : ℂ) :
    cycleEvaluation L eval (α + β) a = cycleEvaluation L eval α a + cycleEvaluation L eval β a := by
  sorry

theorem cycleEvaluation_smul (q : ℚ) (α : RatFunc ℂ →₀ ℚ) (a : ℂ) :
    cycleEvaluation L eval (q • α) a = (q : ℝ) * cycleEvaluation L eval α a := by
  sorry

theorem cycleEvaluation_specialize (α : RatFunc ℂ →₀ ℚ) (a : ℂ) :
    cycleEvaluation L eval α a =
      (Finsupp.linearCombination ℚ (fun f => L (eval f a))) α := by
  sorry

theorem cycleEvaluation_constant (f : RatFunc ℂ) (c : Option ℂ)
    (hc : ∀ a, eval f a = c) (a : ℂ) :
    cycleEvaluation L eval (Finsupp.single f 1) a = L c := by
  sorry

-- TauCeti.Polylog.WeightFour.evaluation_pole
example (f : RatFunc ℂ) (a : ℂ) (hpole : eval f a = none) (hinfty : L none = 0) :
    cycleEvaluation L eval (Finsupp.single f 1) a = 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.evaluation_odd_one
example (a : ℂ) (h1 : eval 1 a = some 1) (zeta3 : ℝ)
    (hL : L (some 1) = zeta3) (hz : zeta3 ≠ 0) :
    cycleEvaluation L eval (Finsupp.single 1 1) a = zeta3 ∧
      cycleEvaluation L eval (Finsupp.single 1 1) a ≠ 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.evaluation_even_one
example (a : ℂ) (h1 : eval 1 a = some 1) (hL : L (some 1) = 0) :
    cycleEvaluation L eval (Finsupp.single 1 1) a = 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.evaluation_cancellation
example (f g : RatFunc ℂ) (a : ℂ) :
    cycleEvaluation L eval
      (Finsupp.single f 1 + Finsupp.single g 1 - Finsupp.single f 1) a = L (eval g a) := by
  sorry

-- cycle-constancy: topological end of the scalar analytic proof. The omitted
-- r_n factorization must establish the derivative hypothesis for an actual cycle.
theorem cycleConstancy (E : ℂ → ℝ) (S : Finset ℂ) (hcont : Continuous E)
    (hd : ∀ z ∉ S, HasFDerivAt E (0 : ℂ →L[ℝ] ℝ) z) (a b : ℂ) : E a = E b := by
  sorry
end Evaluation

section Numerical
variable {M K M' : Type u}
variable [AddCommGroup M] [Module ℚ M] [AddCommGroup K] [Module ℚ K]
variable [AddCommGroup M'] [Module ℚ M']

def normalizedDet {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (c : ℝ) (y : Fin d → M) : ℝ :=
  c * Matrix.det (fun i j => p (y j) i)

def rationalExistence {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ) : Prop :=
  ∃ y : Fin d → M, ∃ q : ℚ, q ≠ 0 ∧ normalizedDet p c y = (q : ℝ) * ζ

theorem rationalExistence_of_witness {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (c ζ : ℝ) (y : Fin d → M) (q : ℚ) (hq : q ≠ 0)
    (hy : normalizedDet p c y = (q : ℝ) * ζ) : rationalExistence p c ζ := by
  sorry

theorem rationalExistence_nonzero {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (c ζ : ℝ) (hζ : ζ ≠ 0) (h : rationalExistence p c ζ) :
    ∃ y, normalizedDet p c y ≠ 0 := by
  sorry

theorem rationalExistence_normalize {d : ℕ} (hd : 0 < d)
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ) :
    rationalExistence p c ζ ↔ ∃ y, normalizedDet p c y = ζ := by
  sorry

theorem rationalExistence_empty (p : M →ₗ[ℚ] (Fin 0 → ℝ)) (c ζ : ℝ) :
    rationalExistence p c ζ ↔ ∃ q : ℚ, q ≠ 0 ∧ c = (q : ℝ) * ζ := by
  sorry

theorem rationalExistence_transport {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (e : M ≃ₗ[ℚ] M') (c ζ : ℝ) :
    rationalExistence p c ζ ↔ rationalExistence (p.comp e.symm.toLinearMap) c ζ := by
  sorry

def rationalColumn : ℚ →ₗ[ℚ] (Fin 1 → ℝ) where
  toFun x := fun _ => (x : ℝ)
  map_add' := by sorry
  map_smul' := by sorry

-- TauCeti.Polylog.WeightFour.existence_empty_rational
example : rationalExistence (0 : ℚ →ₗ[ℚ] (Fin 0 → ℝ)) 90 1 ∧
    normalizedDet (0 : ℚ →ₗ[ℚ] (Fin 0 → ℝ)) 90 (fun i => Fin.elim0 i) ≠ 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.existence_zero_factor
example : ¬ rationalExistence (0 : ℚ →ₗ[ℚ] (Fin 1 → ℝ)) 1 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.existence_rank_one
example : normalizedDet rationalColumn 2 (fun _ => (1 / 2 : ℚ)) = 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.existence_transport_test
example {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (e : M ≃ₗ[ℚ] M') (c ζ : ℝ) :
    rationalExistence p c ζ = rationalExistence (p.comp e.symm.toLinearMap) c ζ := by
  sorry

def regulatorComparison {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) : Prop :=
  ∃ φ : M ≃ₗ[ℚ] K, ∃ lam : ℚ, lam ≠ 0 ∧
    ∀ y, p y = ((lam : ℝ) * A) • r (φ y)

theorem regulatorComparison_witness {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) (h : regulatorComparison p r A) :
    ∃ φ : M ≃ₗ[ℚ] K, ∃ lam : ℚ, lam ≠ 0 ∧ ∀ y, p y = ((lam : ℝ) * A) • r (φ y) := by
  sorry

theorem regulatorComparison_forget {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) (h : regulatorComparison p r A) :
    Nonempty (M ≃ₗ[ℚ] K) := by
  sorry

theorem regulatorComparison_rescale {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) (q : ℚ) (hq : q ≠ 0)
    (h : regulatorComparison p r A) : regulatorComparison (q • p) r A := by
  sorry

theorem regulatorComparison_injective {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (A : ℝ) (hA : A ≠ 0)
    (hr : Function.Injective r) (h : regulatorComparison p r A) : Function.Injective p := by
  sorry

theorem regulatorComparison_transport {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ))
    (r : K →ₗ[ℚ] (Fin d → ℝ)) (e : M ≃ₗ[ℚ] M') (A : ℝ) :
    regulatorComparison p r A ↔ regulatorComparison (p.comp e.symm.toLinearMap) r A := by
  sorry

-- TauCeti.Polylog.WeightFour.comparison_identity
example : regulatorComparison rationalColumn rationalColumn 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.comparison_zero_period
example : ¬ regulatorComparison (0 : ℚ →ₗ[ℚ] (Fin 1 → ℝ)) rationalColumn 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.comparison_rational_scale
example : regulatorComparison ((3 : ℚ) • rationalColumn) rationalColumn 1 := by
  sorry

-- TauCeti.Polylog.WeightFour.comparison_zero_spaces
example : regulatorComparison
    (0 : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℝ))
    (0 : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℝ)) Real.pi := by
  sorry

-- A routine predicate abbreviating the inherited every-family assertion.
def everyFamily {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ) : Prop :=
  ∀ y, ∃ q : ℚ, normalizedDet p c y = (q : ℝ) * ζ

-- assertion-logic: rank plus every-family rationality supplies the Q× witness.
theorem assertionLogic_rank_every {d : ℕ} (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ)
    (hrank : ∃ y, normalizedDet p c y ≠ 0) (hall : everyFamily p c ζ) :
    rationalExistence p c ζ := by
  sorry

theorem assertionLogic_dimension {d : ℕ} [FiniteDimensional ℚ M]
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (c ζ : ℝ) (hζ : ζ ≠ 0)
    (hdim : Module.finrank ℚ M = d) (hex : rationalExistence p c ζ) :
    everyFamily p c ζ := by
  sorry

-- period-calibration: concrete exponent identity. R.5 supplies the nonzero
-- covolume formula; R.7 must still provide the actual scalar period conversion.
theorem periodCalibration_exponent (n N d : ℤ) :
    (n - 1) * d + d - N * n = -(n * (N - d)) := by
  sorry

-- weight-four-totally-real: the Q example catches the empty-determinant error.
-- ζ_Q(4)=π⁴/90 is imported arithmetic; it is not redefined here.
theorem weightFourTotallyReal_rational (p : M →ₗ[ℚ] (Fin 0 → ℝ)) :
    rationalExistence p (Real.pi ^ 4) (Real.pi ^ 4 / 90) := by
  sorry
end Numerical

section ExplicitComplex
variable {B4 B3 B2 U : Type}
variable [AddCommGroup B4] [Module ℚ B4] [AddCommGroup B3] [Module ℚ B3]
variable [AddCommGroup B2] [Module ℚ B2] [AddCommGroup U] [Module ℚ U]

def explicitTerms (B4 B3 B2 U : Type)
    [AddCommGroup B4] [Module ℚ B4] [AddCommGroup B3] [Module ℚ B3]
    [AddCommGroup B2] [Module ℚ B2] [AddCommGroup U] [Module ℚ U] : ℕ → ModuleCat ℚ
  | 1 => ModuleCat.of ℚ B4
  | 2 => ModuleCat.of ℚ (B3 ⊗[ℚ] U)
  | 3 => ModuleCat.of ℚ (B2 ⊗[ℚ] (⋀[ℚ]^2 U))
  | 4 => ModuleCat.of ℚ (⋀[ℚ]^4 U)
  | _ => ModuleCat.of ℚ (Fin 0 → ℚ)

def explicitDifferential
    (a : B4 →ₗ[ℚ] B3 ⊗[ℚ] U)
    (b : B3 ⊗[ℚ] U →ₗ[ℚ] B2 ⊗[ℚ] (⋀[ℚ]^2 U))
    (c : B2 ⊗[ℚ] (⋀[ℚ]^2 U) →ₗ[ℚ] ⋀[ℚ]^4 U) :
    ∀ i, explicitTerms B4 B3 B2 U i ⟶ explicitTerms B4 B3 B2 U (i + 1)
  | 0 => 0
  | 1 => ModuleCat.ofHom a
  | 2 => ModuleCat.ofHom b
  | 3 => ModuleCat.ofHom c
  | _ => 0

def explicitComplex
    (a : B4 →ₗ[ℚ] B3 ⊗[ℚ] U)
    (b : B3 ⊗[ℚ] U →ₗ[ℚ] B2 ⊗[ℚ] (⋀[ℚ]^2 U))
    (c : B2 ⊗[ℚ] (⋀[ℚ]^2 U) →ₗ[ℚ] ⋀[ℚ]^4 U)
    (hba : b.comp a = 0) (hcb : c.comp b = 0) : CochainComplex (ModuleCat ℚ) ℕ :=
  CochainComplex.of (explicitTerms B4 B3 B2 U) (explicitDifferential a b c) (by sorry)

variable (a : B4 →ₗ[ℚ] B3 ⊗[ℚ] U)
variable (b : B3 ⊗[ℚ] U →ₗ[ℚ] B2 ⊗[ℚ] (⋀[ℚ]^2 U))
variable (c : B2 ⊗[ℚ] (⋀[ℚ]^2 U) →ₗ[ℚ] ⋀[ℚ]^4 U)
variable (hba : b.comp a = 0) (hcb : c.comp b = 0)

theorem explicitComplex_X (i : ℕ) :
    (explicitComplex a b c hba hcb).X i = explicitTerms B4 B3 B2 U i := by
  sorry

theorem explicitComplex_d : (explicitComplex a b c hba hcb).d 1 2 = ModuleCat.ofHom a := by
  sorry

theorem explicitComplex_first_kernel :
    LinearMap.ker ((explicitComplex a b c hba hcb).d 1 2).hom = LinearMap.ker a := by
  sorry

def explicitComplex_map {X Y : CochainComplex (ModuleCat ℚ) ℕ}
    (f : ∀ i, X.X i ⟶ Y.X i)
    (hf : ∀ i, f i ≫ Y.d i (i + 1) = X.d i (i + 1) ≫ f (i + 1)) : X ⟶ Y :=
  CochainComplex.ofHom f hf

-- TauCeti.Polylog.WeightFour.explicit_degree_one
example : (explicitComplex a b c hba hcb).X 1 = ModuleCat.of ℚ B4 := by
  sorry

-- TauCeti.Polylog.WeightFour.explicit_zero_outside
example : (explicitComplex a b c hba hcb).X 0 = ModuleCat.of ℚ (Fin 0 → ℚ) ∧
    (explicitComplex a b c hba hcb).X 5 = ModuleCat.of ℚ (Fin 0 → ℚ) := by
  sorry

-- TauCeti.Polylog.WeightFour.explicit_first_boundary
example : ((explicitComplex a b c hba hcb).d 1 2).hom = a := by
  sorry

-- TauCeti.Polylog.WeightFour.explicit_no_extra_summand
example : (explicitComplex a b c hba hcb).X 2 = ModuleCat.of ℚ (B3 ⊗[ℚ] U) := by
  sorry
end ExplicitComplex

section Presentation
def presentationMap {X Y : CochainComplex (ModuleCat ℚ) ℕ}
    (f : ∀ i, X.X i ⟶ Y.X i)
    (hf : ∀ i, f i ≫ Y.d i (i + 1) = X.d i (i + 1) ≫ f (i + 1)) : X ⟶ Y :=
  CochainComplex.ofHom f hf

variable {X Y : CochainComplex (ModuleCat ℚ) ℕ}
variable (f : ∀ i, X.X i ⟶ Y.X i)
variable (hf : ∀ i, f i ≫ Y.d i (i + 1) = X.d i (i + 1) ≫ f (i + 1))

theorem presentationMap_first : (presentationMap f hf).f 1 = f 1 := by sorry
theorem presentationMap_second : (presentationMap f hf).f 2 = f 2 := by sorry
theorem presentationMap_square :
    f 1 ≫ Y.d 1 2 = X.d 1 2 ≫ f 2 := by sorry

def presentationMap_cycles :
    LinearMap.ker (X.d 1 2).hom →ₗ[ℚ] LinearMap.ker (Y.d 1 2).hom :=
  LinearMap.codRestrict _ ((f 1).hom.comp (LinearMap.ker (X.d 1 2).hom).subtype) (by
    have hsquare := hf 1
    sorry)

theorem presentationMap_period {d : ℕ}
    (pX : X.X 1 →ₗ[ℚ] (Fin d → ℝ)) (pY : Y.X 1 →ₗ[ℚ] (Fin d → ℝ))
    (hperiod : pY.comp (f 1).hom = pX) (x : X.X 1) :
    pY ((presentationMap f hf).f 1 x) = pX x := by sorry

-- TauCeti.Polylog.WeightFour.presentation_zero_cycle
example : presentationMap_cycles f hf 0 = 0 := by sorry

-- TauCeti.Polylog.WeightFour.presentation_pure_tensor
example {B B' U : Type u} [AddCommGroup B] [Module ℚ B]
    [AddCommGroup B'] [Module ℚ B'] [AddCommGroup U] [Module ℚ U]
    (p3 : B →ₗ[ℚ] B') (b : B) (u : U) :
    TensorProduct.map p3 LinearMap.id (b ⊗ₜ[ℚ] u) = p3 b ⊗ₜ[ℚ] u := by sorry

-- TauCeti.Polylog.WeightFour.presentation_cycle_boundary
example (x : LinearMap.ker (X.d 1 2).hom) :
    (Y.d 1 2).hom ((f 1).hom x) = 0 := by
  have hsquare := hf 1
  sorry

-- TauCeti.Polylog.WeightFour.presentation_top_identity
example (h4 : X.X 4 = Y.X 4) (hid : f 4 = eqToHom h4) :
    (presentationMap f hf).f 4 = eqToHom h4 := by sorry
end Presentation

section Obstruction
variable {C D E J : Type u}
variable [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]
variable [AddCommGroup E] [Module ℚ E] [AddCommGroup J] [Module ℚ J]

def boundaryOnKernel (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J)
    (p : C →ₗ[ℚ] D) (q : E →ₗ[ℚ] J) (hsq : q.comp a = b.comp p) :
    LinearMap.ker p →ₗ[ℚ] LinearMap.ker q :=
  LinearMap.codRestrict _ (a.comp (LinearMap.ker p).subtype) (by sorry)

def obstructionSubmodule (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J)
    (p : C →ₗ[ℚ] D) (q : E →ₗ[ℚ] J) (hsq : q.comp a = b.comp p) :
    Submodule ℚ (LinearMap.ker q) := LinearMap.range (boundaryOnKernel a b p q hsq)

def cycleObstruction (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J)
    (p : C →ₗ[ℚ] D) (q : E →ₗ[ℚ] J) (hsq : q.comp a = b.comp p)
    (hp : Function.Surjective p) :
    LinearMap.ker b →ₗ[ℚ] ((LinearMap.ker q) ⧸ obstructionSubmodule a b p q hsq) where
  toFun y := (obstructionSubmodule a b p q hsq).mkQ
    ⟨a (Classical.choose (hp y)), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

variable (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J)
variable (p : C →ₗ[ℚ] D) (q : E →ₗ[ℚ] J) (hsq : q.comp a = b.comp p)
variable (hp : Function.Surjective p)

theorem cycleObstruction_lift (y : LinearMap.ker b) (x : C) (hx : p x = y) :
    cycleObstruction a b p q hsq hp y =
      (obstructionSubmodule a b p q hsq).mkQ ⟨a x, by sorry⟩ := by sorry

theorem cycleObstruction_zero_iff (y : LinearMap.ker b) :
    cycleObstruction a b p q hsq hp y = 0 ↔ ∃ x : C, a x = 0 ∧ p x = y := by sorry

theorem cycleObstruction_image :
    ∀ y : LinearMap.ker b, y ∈ LinearMap.ker (cycleObstruction a b p q hsq hp) ↔
      ∃ x : LinearMap.ker a, p x = y := by sorry

theorem cycleObstruction_injective_target (hq : Function.Injective q) :
    cycleObstruction a b p q hsq hp = 0 := by sorry

-- TauCeti.Polylog.WeightFour.obstruction_explicit_cycle
example (x : C) (ha : a x = 0) (y : LinearMap.ker b) (hy : p x = y) :
    cycleObstruction a b p q hsq hp y = 0 := by sorry

-- TauCeti.Polylog.WeightFour.obstruction_change_lift
example (y : LinearMap.ker b) (x k : C) (hx : p x = y) (hk : p k = 0) :
    (obstructionSubmodule a b p q hsq).mkQ (⟨a x, by sorry⟩ : LinearMap.ker q) =
      (obstructionSubmodule a b p q hsq).mkQ (⟨a (x + k), by sorry⟩ : LinearMap.ker q) := by
  sorry

-- TauCeti.Polylog.WeightFour.obstruction_missing_cycle
-- C=D=E=Q, J=0, p=a=id, b=q=0: a group lift exists, a cycle lift does not.
example :
    let a : ℚ →ₗ[ℚ] ℚ := LinearMap.id
    let b : ℚ →ₗ[ℚ] (Fin 0 → ℚ) := 0
    let p : ℚ →ₗ[ℚ] ℚ := LinearMap.id
    let q : ℚ →ₗ[ℚ] (Fin 0 → ℚ) := 0
    cycleObstruction a b p q (by sorry) (by sorry) ⟨1, by sorry⟩ ≠ 0 := by
  sorry

-- TauCeti.Polylog.WeightFour.obstruction_injective_square
example (hq : Function.Injective q) (y : LinearMap.ker b) :
    ∃ x, p x = y ∧ a x = 0 := by
  have hsquare := hsq
  have hsurj := hp
  sorry
end Obstruction

section DeterminantTransfer
variable {M M' : Type u} [AddCommGroup M] [Module ℚ M]
variable [AddCommGroup M'] [Module ℚ M']

-- weight-four-determinant-lifting: existence needs a map, not a surjective cycle map.
theorem weightFourDeterminantLifting_existence {d : ℕ} (P : M →ₗ[ℚ] M')
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (p' : M' →ₗ[ℚ] (Fin d → ℝ))
    (hperiod : p'.comp P = p) (c ζ : ℝ) (h : rationalExistence p c ζ) :
    rationalExistence p' c ζ := by sorry

theorem weightFourDeterminantLifting_family {d : ℕ} (P : M →ₗ[ℚ] M')
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (p' : M' →ₗ[ℚ] (Fin d → ℝ))
    (hperiod : p'.comp P = p) (c ζ : ℝ) (h : everyFamily p c ζ)
    (y : Fin d → M') (hlift : ∀ j, ∃ x, P x = y j) :
    ∃ q : ℚ, normalizedDet p' c y = (q : ℝ) * ζ := by sorry

-- weight-four-regulator-input: κ and reverse image containment are different
-- typed hypotheses. This reduction transfers all-family rationality from K.
theorem weightFourRegulatorInput_image {d : ℕ}
    (p : M →ₗ[ℚ] (Fin d → ℝ)) (r : M' →ₗ[ℚ] (Fin d → ℝ))
    (c ζ : ℝ) (hall : everyFamily r c ζ)
    (himage : LinearMap.range p ≤ LinearMap.range r) : everyFamily p c ζ := by sorry
end DeterminantTransfer

section Residue
variable {B B' B'' U : Type u}
variable [AddCommGroup B] [Module ℚ B] [AddCommGroup B'] [Module ℚ B']
variable [AddCommGroup B''] [Module ℚ B''] [AddCommGroup U] [Module ℚ U]

def residueTensor (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) : B ⊗[ℚ] U →ₗ[ℚ] B' :=
  TensorProduct.lift
    { toFun := fun b =>
        { toFun := fun u => v u • sp b
          map_add' := by sorry
          map_smul' := by sorry }
      map_add' := by sorry
      map_smul' := by sorry }

theorem residueTensor_tmul (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (u : U) :
    residueTensor sp v (b ⊗ₜ[ℚ] u) = v u • sp b := by sorry

theorem residueTensor_add (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (x y : B ⊗[ℚ] U) :
    residueTensor sp v (x + y) = residueTensor sp v x + residueTensor sp v y := by sorry

theorem residueTensor_zero_unit (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ)
    (b : B) (u : U) (hu : v u = 0) : residueTensor sp v (b ⊗ₜ[ℚ] u) = 0 := by sorry

theorem residueTensor_comp (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (h : B' →ₗ[ℚ] B'') :
    h.comp (residueTensor sp v) = residueTensor (h.comp sp) v := by sorry

theorem residueTensor_uniformizer (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ)
    (b : B) (π : U) (hπ : v π = 1) : residueTensor sp v (b ⊗ₜ[ℚ] π) = sp b := by sorry

-- TauCeti.Polylog.WeightFour.residue_uniformizer
example (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (π : U) (hπ : v π = 1) :
    residueTensor sp v (b ⊗ₜ[ℚ] π) = sp b := by sorry

-- TauCeti.Polylog.WeightFour.residue_unit
example (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (u : U) (hu : v u = 0) :
    residueTensor sp v (b ⊗ₜ[ℚ] u) = 0 := by sorry

-- TauCeti.Polylog.WeightFour.residue_inverse_uniformizer
example (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (π : U) (hπ : v π = 1) :
    residueTensor sp v (b ⊗ₜ[ℚ] (-π)) = -sp b := by sorry

-- TauCeti.Polylog.WeightFour.residue_symbol_pole
example (sp : B →ₗ[ℚ] B') (v : U →ₗ[ℚ] ℚ) (b : B) (hb : sp b = 0) (u : U) :
    residueTensor sp v (b ⊗ₜ[ℚ] u) = 0 := by sorry
end Residue

-- homotopy-conjecture: this is the real library predicate, without a proof or
-- an instance. Q and T must be the parent's quotient complex and direct sum
-- of shifted residue-field complexes; rho must be its finite-place map.
-- Constructing these requires the finite-place descent gap, so they are explicit
-- parameters here. This does not assert the conjecture for arbitrary complexes.
def polylogHomotopyFour {Q T : CochainComplex (ModuleCat ℚ) ℕ}
    [∀ i, Q.HasHomology i] [∀ i, T.HasHomology i] (rho : Q ⟶ T) : Prop := QuasiIso rho

end TauCeti.Polylog.WeightFour
