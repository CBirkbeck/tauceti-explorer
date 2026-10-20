import Mathlib

/-!
# OverconvergentAutomorphicForms, layers O0–O7: representative target signatures

This file is not the roadmap and is not exhaustive. The roadmap document
`OverconvergentAutomorphicForms--O0.md` is definitive: it states every target, its hypotheses,
API and Checks. The statements below suggest Lean forms so that contributors and reviewers
converge on names and signatures. Theorems are proved by `sorry`; nothing here claims to be
formalised.

Baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. Only statements whose carriers exist at these
pins are made here: the algebra `𝒪_p = ℤ_p ⊗ 𝒪_F`, its norm and principal units, point
characters of the Hilbert tori, the arithmetic-to-geometric weight map, right cocycles, the
congruence-unit cancellation behind arithmetic descent, and the valuation step of the integral
AIP comparison. Weight spaces as rigid spaces, analytic induction, coefficient sheaves, Hilbert
towers, AIP torsors, cusp forms, Hecke operators and Igusa completions are README targets; their
carriers belong to the supplying roadmaps.

Design choices made explicit here:
* scalars on the left in `ℤ_[p] ⊗[ℤ] 𝓞 F`, with the `ℤ_p`-module topology;
* the dual group map is `x ↦ (x², N(x)⁻¹)`, so `κ = w² · (t⁻¹ ∘ N)` (the printed positive
  exponent is a misprint);
* cocycles for a right action `x ⋅ γ` are written with `Γᵐᵒᵖ` acting on the left, and satisfy
  `J(γδ, x) = J(γ, x) · J(δ, x ⋅ γ)` in this order.
-/

open NumberField TensorProduct

noncomputable section

namespace TauCeti.HilbertWeight

variable (F : Type*) [Field F] [NumberField F] (p : ℕ) [Fact p.Prime]

/-! ## Layer O0: weight spaces and locally analytic representations -/

/-- `𝒪_p = ℤ_p ⊗_ℤ 𝒪_F`, with no hypothesis on how `p` decomposes in `F`. -/
abbrev Op : Type _ := ℤ_[p] ⊗[ℤ] 𝓞 F

instance : Module.Finite ℤ_[p] (Op F p) := inferInstance
instance : Module.Free ℤ_[p] (Op F p) := inferInstance
instance : TopologicalSpace (Op F p) := moduleTopology ℤ_[p] (Op F p)
instance : IsModuleTopology ℤ_[p] (Op F p) := ⟨rfl⟩
instance : IsTopologicalRing (Op F p) :=
  IsModuleTopology.isTopologicalRing ℤ_[p] (Op F p)

/-- `𝒪_p` is compact for its module topology. -/
theorem compactSpace_Op : CompactSpace (Op F p) := by
  sorry

/-- `𝒪_p` has rank `[F : ℚ]` over `ℤ_p`. -/
theorem finrank_Op : Module.finrank ℤ_[p] (Op F p) = Module.finrank ℚ F := by
  sorry

/-- The determinant norm on the full integral algebra. -/
def normAlgebra : Op F p →* ℤ_[p] :=
  Algebra.norm ℤ_[p]

/-- Compatibility with the global norm on every integral element. -/
theorem norm_tmul_one (a : 𝓞 F) :
    normAlgebra F p ((1 : ℤ_[p]) ⊗ₜ[ℤ] a) = ((Algebra.norm ℤ a : ℤ) : ℤ_[p]) := by
  sorry

/-- The norm on units at `p`, the restriction of `normAlgebra`. -/
def normUnits : (Op F p)ˣ →* ℤ_[p]ˣ :=
  Units.map (normAlgebra F p)

theorem continuous_normUnits : Continuous (normUnits F p) := by
  sorry

/-- Global units map to units at `p` by `η ↦ 1 ⊗ η`. -/
def unitsToOp : (𝓞 F)ˣ →* (Op F p)ˣ :=
  Units.map (Algebra.TensorProduct.includeRight : 𝓞 F →ₐ[ℤ] Op F p).toMonoidHom

theorem normUnits_unitsToOp (η : (𝓞 F)ˣ) :
    (normUnits F p (unitsToOp F p η) : ℤ_[p]) = ((Algebra.norm ℤ (η : 𝓞 F) : ℤ) : ℤ_[p]) := by
  sorry

/-- Principal units `1 + p^r 𝒪_p`: the kernel of reduction modulo `p^r` on units. -/
def principalUnits (r : ℕ) : Subgroup (Op F p)ˣ :=
  (Units.map (Ideal.Quotient.mk (Ideal.span {((p : Op F p)) ^ r})).toMonoidHom).ker

theorem isOpen_principalUnits (r : ℕ) : IsOpen (principalUnits F p r : Set (Op F p)ˣ) := by
  sorry

theorem finiteIndex_principalUnits (r : ℕ) : (principalUnits F p r).FiniteIndex := by
  sorry

section Weights

variable (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- Geometric Hilbert weights with values in `R`: continuous characters of `𝒪_p^×`.
These are the `R`-points of the weight space; its representing rigid space is the character
variety of the compact abelian `ℚ_p`-analytic group `𝒪_p^×` (README, Layer O0). -/
abbrev GeomWeight := ContinuousMonoidHom (Op F p)ˣ Rˣ

/-- Arithmetic Hilbert weights: continuous characters of `𝒪_p^× × ℤ_p^×`. -/
abbrev ArithWeight := ContinuousMonoidHom ((Op F p)ˣ × ℤ_[p]ˣ) Rˣ

/-- The arithmetic weight with coordinates `(w, t)`. -/
def ArithWeight.mk (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) :
    ArithWeight F p R :=
  (w.comp (ContinuousMonoidHom.fst _ _)) * (t.comp (ContinuousMonoidHom.snd _ _))

/-- The group map dual to the weight map, `x ↦ (x², N(x)⁻¹)`. -/
def weightDualMap : ContinuousMonoidHom (Op F p)ˣ ((Op F p)ˣ × ℤ_[p]ˣ) where
  toMonoidHom :=
    { toFun := fun x ↦ (x ^ 2, (normUnits F p x)⁻¹)
      map_one' := by simp
      map_mul' := fun x y ↦ by
        ext1 <;> simp only [Prod.fst_mul, Prod.snd_mul, map_mul, mul_inv]
        exact mul_pow x y 2 }
  continuous_toFun := (continuous_id.pow 2).prodMk (continuous_normUnits F p).inv

/-- The weight map `ρ : 𝒲 → 𝒲*` on points: pullback along `weightDualMap`. -/
def weightMap (κ : ArithWeight F p R) : GeomWeight F p R :=
  κ.comp (weightDualMap F p)

/-- The formula for `ρ`: `ρ(w, t)(x) = w(x)² · t(N(x))⁻¹`. -/
theorem weightMap_mk_apply (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w t) x = w x ^ 2 * (t (normUnits F p x))⁻¹ := by
  sorry

/-- `ρ(w, t) · w⁻²` factors through the norm, as `t⁻¹ ∘ N`. -/
theorem weightMap_mk_mul_inv_sq (w : GeomWeight F p R) (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ)
    (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w t) x * (w x ^ 2)⁻¹ = (t (normUnits F p x))⁻¹ := by
  sorry

/-- On a totally positive global unit of a totally real field the norm is `1`, so
`κ(η)⁻¹ · w(η²) = 1`. -/
theorem weightMap_mk_totallyPositive [IsTotallyReal F] (w : GeomWeight F p R)
    (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (η : (𝓞 F)ˣ)
    (hη : ∀ φ : F →+* ℝ, 0 < φ ((η : 𝓞 F) : F)) :
    (weightMap F p R (ArithWeight.mk F p R w t) (unitsToOp F p η))⁻¹ *
      w (unitsToOp F p η) ^ 2 = 1 := by
  sorry

/-- The norm coordinate enters with the inverse sign: with `w = 1`, `ρ` is `t⁻¹ ∘ N`. -/
example (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R 1 t) x = (t (normUnits F p x))⁻¹ := by
  change 1 * t ((normUnits F p x)⁻¹) = _
  simp only [one_mul, map_inv]

/-- With `t = 1`, `ρ` is the square of `w`. -/
example (w : GeomWeight F p R) (x : (Op F p)ˣ) :
    weightMap F p R (ArithWeight.mk F p R w 1) x = w x ^ 2 := by
  change w (x ^ 2) * 1 = _
  simp only [mul_one, map_pow]

end Weights

end TauCeti.HilbertWeight

namespace TauCeti.Overconvergent

/-! ## Layer O1: equivariant sheaves from cocycles -/

/-- A cocycle for a right action `x ⋅ γ`, written as a left action of `Γᵐᵒᵖ`:
`J(γδ, x) = J(γ, x) · J(δ, x ⋅ γ)`, with the coefficient factors in this order. -/
structure RightCocycle (Γ X C : Type*) [Group Γ] [Group C] [MulAction Γᵐᵒᵖ X] where
  /-- The cocycle `J(γ, x)`. -/
  toFun : Γ → X → C
  /-- The right cocycle law. -/
  map_mul' : ∀ γ δ x, toFun (γ * δ) x = toFun γ x * toFun δ (MulOpposite.op γ • x)

namespace RightCocycle

variable {Γ X C : Type*} [Group Γ] [Group C] [MulAction Γᵐᵒᵖ X]

/-- The trivial cocycle; its equivariant functions are the invariant functions. -/
def trivial : RightCocycle Γ X C where
  toFun _ _ := 1
  map_mul' _ _ _ := (mul_one 1).symm

theorem apply_one (J : RightCocycle Γ X C) (x : X) : J.toFun 1 x = 1 := by
  sorry

end RightCocycle

/-- A left cocycle `K(γδ, x) = K(γ, δ • x) K(δ, x)` gives the right cocycle
`J(γ, x) = K(γ⁻¹, x)⁻¹` for `x ⋅ γ = γ⁻¹ • x`; both the group element and the coefficient are
inverted. -/
theorem right_cocycle_of_left {Γ X C : Type*} [Group Γ] [Group C] [MulAction Γ X]
    (K : Γ → X → C) (hK : ∀ γ δ x, K (γ * δ) x = K γ (δ • x) * K δ x) (γ δ : Γ) (x : X) :
    (K (γ * δ)⁻¹ x)⁻¹ = (K γ⁻¹ x)⁻¹ * (K δ⁻¹ (γ⁻¹ • x))⁻¹ := by
  sorry

/-- Matrix-valued cocycles do not commute: reversing the order of the two factors in the
cocycle law changes the value. -/
example :
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 0; 1, 1] ≠
      (!![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 1; 0, 1] := by
  intro h
  have h00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℚ ↦ M 0 0) h
  norm_num [Matrix.mul_apply, Fin.sum_univ_succ] at h00

/-! ## Layer O4: arithmetic descent and polarization classes -/

section Arithmetic

open TauCeti.HilbertWeight

variable (F : Type*) [Field F] [NumberField F] (p : ℕ) [Fact p.Prime]
variable (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- Units congruent to `1` modulo `N ≥ 3` have norm `1`; total positivity is not needed. -/
theorem congruence_unit_norm_one (N : ℕ) (hN : 3 ≤ N) (η : (𝓞 F)ˣ)
    (hη : (η : 𝓞 F) - 1 ∈ Ideal.span {(N : 𝓞 F)}) :
    normUnits F p (unitsToOp F p η) = 1 := by
  sorry

/-- The arithmetic multiplier cancels for the central representatives: for a unit `η ≡ 1`
modulo `N ≥ 3`, of any real signs, `κ(η)⁻¹ · w(η²) = 1`. -/
theorem arithmetic_representatives (N : ℕ) (hN : 3 ≤ N) (w : GeomWeight F p R)
    (t : ContinuousMonoidHom ℤ_[p]ˣ Rˣ) (η : (𝓞 F)ˣ)
    (hη : (η : 𝓞 F) - 1 ∈ Ideal.span {(N : 𝓞 F)}) :
    (weightMap F p R (ArithWeight.mk F p R w t) (unitsToOp F p η))⁻¹ *
      w (unitsToOp F p η) ^ 2 = 1 := by
  sorry

end Arithmetic

/-! ## Layer O5: independent AIP construction and comparison -/

section Valuation

variable {A Γ₀ : Type*} [CommRing A] [LinearOrderedCommGroupWithZero Γ₀]

/-- Translation by a unit whose value and inverse value are both integral preserves
integrality, for a valuation of any rank. -/
theorem aip_translation_valuation_units (v : Valuation A Γ₀) (u : Aˣ)
    (hu : v (u : A) ≤ 1) (hinv : v ((u⁻¹ : Aˣ) : A) ≤ 1) (a : A) :
    v (((u⁻¹ : Aˣ) : A) * a) ≤ 1 ↔ v a ≤ 1 := by
  sorry

/-- Finite-order units have valuation `1`, with no condition that the order be prime to `p`. -/
theorem finiteOrder_value_one (v : Valuation A Γ₀) (u : Aˣ) (d : ℕ) (hd : 0 < d)
    (hu : u ^ d = 1) : v (u : A) = 1 := by
  sorry

/-- The sign character at `p = 2`: negation preserves integrality. -/
example (v : Valuation A Γ₀) (a : A) : v (-a) ≤ 1 ↔ v a ≤ 1 := by
  rw [Valuation.map_neg]

end Valuation

/-!
## Targets stated in the README only

Their carriers are not at the pins, so they are not declared here:
* O0: `bounded_weight_families`, `finite_analytic_coefficients`, `coefficient_tensor_dual`,
  `analytic_induced_coefficients`, `algebraic_induced_comparison`,
  `unitary_completed_coefficients`, `unitary_jacquet_eigenvariety`, `radiusParameter`;
* O1: `equivariant_coefficient_sheaf`, `coefficient_descent_functoriality`,
  `analytic_line_effectivity`;
* O2: `admitted_hilbert_domain`, `hilbert_automorphy_factor`, `geometric_hilbert_sheaf`,
  `hilbert_level_radius_maps`;
* O3: `integral_hilbert_sheaf`, `fixed_radius_hilbert_forms`, `overconvergent_hilbert_forms`,
  `ramified_modified_lattice`;
* O4: the four presentations `presentation_geometric_small`, `presentation_geometric_full`,
  `presentation_arithmetic_intermediate`, `presentation_arithmetic_full`,
  `twisted_polarisation_action`, `polarisation_class_forms`;
* O5: `aip_independent_coefficients`, `aip_torsor_structure_invariants`,
  `finite_character_integral_generator`, `aip_frobenius_restriction`, `geometric_aip_comparison`;
* O6: `hilbert_cusp_forms`, `hilbert_cusp_higher_vanishing`, `padicHilbertQExpansion`,
  `tame_hilbert_hecke`, `wild_hilbert_hecke`, `hilbert_diamond_operators`,
  `fixed_cusp_banach_modules`, `controlling_hilbert_operator`;
* O7: `ordinary_completed_functions`, `ordinary_weighted_forms`, `igusa_completion_comparison`,
  `ordinary_restriction`.
-/

end TauCeti.Overconvergent
