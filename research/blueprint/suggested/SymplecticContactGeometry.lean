import TauCeti.Geometry.Symplectic.AlmostComplex
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.BilinearForm.Hom

/-!
# Suggested signatures: symplectic and contact geometry

This is not the roadmap and is not exhaustive. The companion reader is definitive.
The file has NOT been Lean-compiled. Proof placeholders are intentional blueprint
syntax, not implementation claims.

The objects below are pointwise linear data. On a manifold the inputs must be the
ACTUAL value of a smooth one-form and of its exterior derivative at the same point.
In particular, the linear model (dt, omega) is not a claim that d(dt) = omega.
Existing SymplecticForm, BilinForm, Dual, kernels and linear equivalences are reused.
-/

namespace TauCeti.Contact

open LinearMap

variable {V W : Type*} [AddCommGroup V] [Module ℝ V]
  [AddCommGroup W] [Module ℝ W]

/-- The pointwise contact condition, not a bundled manifold or an assumed Reeb field. -/
def IsContactData (α : Module.Dual ℝ V) (β : BilinForm ℝ V) : Prop :=
  α ≠ 0 ∧ β.IsAlt ∧ (β.restrict α.ker).Nondegenerate

theorem IsContactData.alpha_ne_zero {α : Module.Dual ℝ V} {β : BilinForm ℝ V}
    (h : IsContactData α β) : α ≠ 0 := h.1

theorem IsContactData.beta_isAlt {α : Module.Dual ℝ V} {β : BilinForm ℝ V}
    (h : IsContactData α β) : β.IsAlt := h.2.1

theorem IsContactData.horizontal_nondegenerate {α : Module.Dual ℝ V}
    {β : BilinForm ℝ V} (h : IsContactData α β) :
    (β.restrict α.ker).Nondegenerate := h.2.2

/-- Only the packaging is new: the form and symplectic carrier already exist. -/
def horizontal (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) : TauCeti.SymplecticForm α.ker where
  toBilinForm := β.restrict α.ker
  isAlt := by sorry
  nondegenerate := h.2.2

theorem horizontal_apply (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (v w : α.ker) :
    horizontal α β h v w = β v w := rfl

theorem horizontal_toBilinForm (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) : (horizontal α β h).toBilinForm = β.restrict α.ker := rfl

theorem horizontal_proof_independent (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h k : IsContactData α β) : horizontal α β h = horizontal α β k := by sorry

/-- Direct application of the existing finite-dimensional BilinForm.toDual.
There is no parallel musical-isomorphism theorem planned: this is only a baseline-reuse example. -/
example [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β)
    (ℓ : Module.Dual ℝ α.ker) :
    ∃! z : α.ker, ∀ w : α.ker, β z w = ℓ w := by sorry

/-- The linear model of contact data, not the exterior derivative of a constant form. -/
theorem model_isContactData (ω : TauCeti.SymplecticForm W) :
    IsContactData (LinearMap.fst ℝ ℝ W)
      (ω.toBilinForm.comp (LinearMap.snd ℝ ℝ W) (LinearMap.snd ℝ ℝ W)) := by sorry

theorem existsUnique_reeb [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) :
    ∃! r : V, α r = 1 ∧ ∀ v : V, β r v = 0 := by sorry

/-- Constructed using the proved existence theorem, not stored in IsContactData. -/
noncomputable def reeb [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) : V :=
  Classical.choose (existsUnique_reeb α β h)

theorem reeb_spec [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) :
    α (reeb α β h) = 1 ∧ ∀ v : V, β (reeb α β h) v = 0 := by sorry

theorem reeb_unique [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β)
    (r : V) (hα : α r = 1) (hβ : ∀ v, β r v = 0) : r = reeb α β h := by sorry

theorem reeb_ne_zero [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) :
    reeb α β h ≠ 0 := by sorry

noncomputable def horizontalProjection [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) :
    V →ₗ[ℝ] α.ker where
  toFun v := ⟨v - α v • reeb α β h, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

theorem horizontalProjection_coe [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) (v : V) :
    (horizontalProjection α β h v : V) = v - α v • reeb α β h := rfl

theorem horizontalProjection_subtype [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) (v : α.ker) :
    horizontalProjection α β h v = v := by sorry

theorem horizontalProjection_reeb [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) :
    horizontalProjection α β h (reeb α β h) = 0 := by sorry

noncomputable def splitting [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) :
    V ≃ₗ[ℝ] ℝ × α.ker where
  toFun v := (α v, horizontalProjection α β h v)
  invFun x := x.1 • reeb α β h + (x.2 : V)
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry

theorem splitting_apply [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) (v : V) :
    splitting α β h v = (α v, horizontalProjection α β h v) := rfl

theorem splitting_symm_apply [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β)
    (t : ℝ) (v : α.ker) :
    (splitting α β h).symm (t, v) = t • reeb α β h + (v : V) := rfl

theorem splitting_reeb [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) :
    splitting α β h (reeb α β h) = (1, 0) := by sorry

theorem beta_horizontalProjection [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) (v w : V) :
    β (horizontalProjection α β h v) (horizontalProjection α β h w) = β v w := by sorry

/-- Value of d(f alpha): c=f(x), ell=df_x. This is not merely c times beta. -/
def rescaledForm (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (c : ℝ) (ℓ : Module.Dual ℝ V) : BilinForm ℝ V :=
  c • β + BilinForm.linMulLin ℓ α - BilinForm.linMulLin α ℓ

theorem rescaledForm_apply (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (c : ℝ) (ℓ : Module.Dual ℝ V) (v w : V) :
    rescaledForm α β c ℓ v w = c * β v w + ℓ v * α w - α v * ℓ w := by sorry

theorem rescaledForm_zero (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (c : ℝ) :
    rescaledForm α β c 0 = c • β := by sorry

theorem rescaledForm_comp (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (c d : ℝ) (ℓ m : Module.Dual ℝ V) :
    rescaledForm (c • α) (rescaledForm α β c ℓ) d m =
      rescaledForm α β (d * c) (d • ℓ + c • m) := by sorry

theorem rescale_isContactData (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (c : ℝ) (hc : c ≠ 0) (ℓ : Module.Dual ℝ V) :
    IsContactData (c • α) (rescaledForm α β c ℓ) := by sorry

/-- Z solves beta(Z,w)=ell(w) on the horizontal kernel, with this sign. -/
theorem reeb_rescale [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β)
    (c : ℝ) (hc : c ≠ 0) (ℓ : Module.Dual ℝ V) :
    let Z : α.ker := ((β.restrict α.ker).toDual h.2.2).symm (ℓ.comp α.ker.subtype)
    reeb (c • α) (rescaledForm α β c ℓ) (rescale_isContactData α β h c hc ℓ) =
      c⁻¹ • reeb α β h + (c⁻¹)^2 • (Z : V) := by sorry

theorem reeb_rescale_constant [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β)
    (c : ℝ) (hc : c ≠ 0) :
    reeb (c • α) (rescaledForm α β c 0) (rescale_isContactData α β h c hc 0) =
      c⁻¹ • reeb α β h := by sorry

/-- Pointwise symplectization on the existing symplectic-form carrier.
No finite-dimensionality or smooth-manifold conclusion is hidden here. -/
def symplectization (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) : TauCeti.SymplecticForm (ℝ × V) where
  toBilinForm := β.comp (LinearMap.snd ℝ ℝ V) (LinearMap.snd ℝ ℝ V) +
    BilinForm.linMulLin (LinearMap.fst ℝ ℝ V) (α.comp (LinearMap.snd ℝ ℝ V)) -
    BilinForm.linMulLin (α.comp (LinearMap.snd ℝ ℝ V)) (LinearMap.fst ℝ ℝ V)
  isAlt := by sorry
  nondegenerate := by sorry

theorem symplectization_apply (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (s t : ℝ) (v w : V) :
    symplectization α β h (s, v) (t, w) = β v w + s * α w - t * α v := by sorry

theorem symplectization_horizontal (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (v w : α.ker) :
    symplectization α β h (0, (v : V)) (0, (w : V)) = horizontal α β h v w := by sorry

theorem symplectization_reeb_pair [FiniteDimensional ℝ V]
    (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) :
    symplectization α β h (1, 0) (0, reeb α β h) = 1 := by sorry

theorem pullback_isContactData (α : Module.Dual ℝ W) (β : BilinForm ℝ W)
    (h : IsContactData α β) (e : V ≃ₗ[ℝ] W) :
    IsContactData (α.comp e.toLinearMap) (β.comp e.toLinearMap e.toLinearMap) := by sorry

theorem reeb_pullback [FiniteDimensional ℝ V] [FiniteDimensional ℝ W]
    (α : Module.Dual ℝ W) (β : BilinForm ℝ W) (h : IsContactData α β)
    (e : V ≃ₗ[ℝ] W) :
    reeb (α.comp e.toLinearMap) (β.comp e.toLinearMap e.toLinearMap)
      (pullback_isContactData α β h e) = e.symm (reeb α β h) := by sorry

/-! Twenty-one definition/construction tests. Names are matched in the packet. -/

-- contact_one_dimensional
example : IsContactData (LinearMap.id : ℝ →ₗ[ℝ] ℝ) (0 : BilinForm ℝ ℝ) := by sorry
-- contact_zero_covector_rejected
example (β : BilinForm ℝ V) : ¬ IsContactData (0 : Module.Dual ℝ V) β := by sorry
-- contact_zero_twoform_rejected
example : ¬ IsContactData (LinearMap.fst ℝ ℝ (ℝ × ℝ))
    (0 : BilinForm ℝ (ℝ × (ℝ × ℝ))) := by sorry

-- horizontal_model
example (ω : TauCeti.SymplecticForm W) (x y : W) :
    let α := LinearMap.fst ℝ ℝ W
    let β := ω.toBilinForm.comp (LinearMap.snd ℝ ℝ W) (LinearMap.snd ℝ ℝ W)
    horizontal α β (model_isContactData ω) ⟨(0, x), by simp⟩ ⟨(0, y), by simp⟩ = ω x y := by sorry
-- horizontal_diagonal
example (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β) (v : α.ker) :
    horizontal α β h v v = 0 := by sorry
-- horizontal_zero_kernel
example (h : IsContactData (LinearMap.id : ℝ →ₗ[ℝ] ℝ) (0 : BilinForm ℝ ℝ))
    (v w : (LinearMap.id : ℝ →ₗ[ℝ] ℝ).ker) :
    horizontal LinearMap.id 0 h v w = 0 := by sorry

-- reeb_model
example [FiniteDimensional ℝ W] (ω : TauCeti.SymplecticForm W) :
    reeb (LinearMap.fst ℝ ℝ W)
      (ω.toBilinForm.comp (LinearMap.snd ℝ ℝ W) (LinearMap.snd ℝ ℝ W))
      (model_isContactData ω) = (1, 0) := by sorry
-- reeb_normalization_matters
example (h : IsContactData ((2 : ℝ) • (LinearMap.id : ℝ →ₗ[ℝ] ℝ)) 0) :
    reeb (2 • LinearMap.id) 0 h = (1 / 2 : ℝ) := by sorry
-- reeb_negative_coorientation
example (h : IsContactData (-(LinearMap.id : ℝ →ₗ[ℝ] ℝ)) 0) :
    reeb (-LinearMap.id) 0 h = (-1 : ℝ) := by sorry

-- projection_kills_reeb
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) : horizontalProjection α β h (reeb α β h) = 0 := by sorry
-- projection_fixes_horizontal
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (v : α.ker) : horizontalProjection α β h v = v := by sorry
-- projection_ignores_reeb_translation
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (v : V) (t : ℝ) :
    horizontalProjection α β h (v + t • reeb α β h) = horizontalProjection α β h v := by sorry

-- splitting_reeb_axis
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) : splitting α β h (reeb α β h) = (1, 0) := by sorry
-- splitting_horizontal_axis
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (v : α.ker) : splitting α β h v = (0, v) := by sorry
-- splitting_roundtrip
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (t : ℝ) (v : α.ker) :
    splitting α β h (t • reeb α β h + (v : V)) = (t, v) := by sorry

-- rescaling_constant
example (α : Module.Dual ℝ V) (β : BilinForm ℝ V) :
    rescaledForm α β 2 0 = (2 : ℝ) • β := by sorry
-- rescaling_gradient_term
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) (ℓ : Module.Dual ℝ V) (v : α.ker) :
    rescaledForm α β 1 ℓ (reeb α β h) v = -ℓ v := by sorry
-- rescaling_product_rule
example (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (ℓ m : Module.Dual ℝ V) :
    rescaledForm (2 • α) (rescaledForm α β 2 ℓ) 3 m =
      rescaledForm α β 6 (3 • ℓ + 2 • m) := by sorry

-- symplectization_reeb_area
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) : symplectization α β h (1, 0) (0, reeb α β h) = 1 := by sorry
-- symplectization_horizontal_area
example (α : Module.Dual ℝ V) (β : BilinForm ℝ V) (h : IsContactData α β)
    (v w : α.ker) : symplectization α β h (0, (v : V)) (0, (w : V)) = β v w := by sorry
-- symplectization_orientation
example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) : symplectization α β h (0, reeb α β h) (1, 0) = -1 := by sorry

/-! Theorem-level regressions: no additional definition tests are counted here. -/

example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) :
    reeb (1 • α) (rescaledForm α β 1 0) (rescale_isContactData α β h 1 one_ne_zero 0) =
      reeb α β h := by sorry

example [FiniteDimensional ℝ W] (ω : TauCeti.SymplecticForm W) (z : W) :
    let α := LinearMap.fst ℝ ℝ W
    let β := ω.toBilinForm.comp (LinearMap.snd ℝ ℝ W) (LinearMap.snd ℝ ℝ W)
    let h := model_isContactData ω
    let ℓ := (ω.toBilinForm z).comp (LinearMap.snd ℝ ℝ W)
    reeb α (rescaledForm α β 1 ℓ) (by simpa using rescale_isContactData α β h 1 one_ne_zero ℓ) =
      (1, z) := by sorry

example [FiniteDimensional ℝ V] (α : Module.Dual ℝ V) (β : BilinForm ℝ V)
    (h : IsContactData α β) :
    reeb (α.comp (LinearEquiv.refl ℝ V).toLinearMap)
      (β.comp (LinearEquiv.refl ℝ V).toLinearMap (LinearEquiv.refl ℝ V).toLinearMap)
      (pullback_isContactData α β h (LinearEquiv.refl ℝ V)) = reeb α β h := by sorry

end TauCeti.Contact
