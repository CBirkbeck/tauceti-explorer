/-
# FunctionFieldArithmeticPartII — RS.0 native comparison

This file records suggested forms, not an exhaustive checklist or an implementation.
The companion README is the definitive specification, including every target, hypothesis,
API item and unit test. Only end conditions over carriers at the atlas pins occur below.
There are no admitted data definitions, new root carriers or substitute predicate fields.

Baseline: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369,
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

The algebra below specifies coordinate end conditions of the native comparison targets;
it does not reconstruct the accepted parent's FramedRoot or normalization algebra.
-/
import TauCeti.AlgebraicGeometry.LineBundle.Basic
import TauCeti.Algebra.Category.ModuleCat.Sheaf.Free
import TauCeti.Algebra.Category.ModuleCat.Sheaf.Invertible.LocalTriviality
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.NormNum

open CategoryTheory AlgebraicGeometry

namespace TauCeti.RootStack.RS0NativeSuggested

universe u v

section CoordinateEndConditions

variable {B : Type u} {C : Type v} [CommRing B] [CommRing C]

/-- Native-frame-change, with the source and target frames changed by actual units. -/
theorem frameChange_equation (n : ℕ) (u a b : Bˣ) (y f : B)
    (h : (u : B) * y ^ n = f) :
    ((b * u * (a ^ n)⁻¹ : Bˣ) : B) * ((a : B) * y) ^ n = (b : B) * f := by
  sorry

/-- Native-frame-change on arrows: retain the section and the power-identification square. -/
theorem frameChange_arrow (n : ℕ) (u q w a c b : Bˣ) (y z : B)
    (hs : z = (w : B) * y) (hp : q * w ^ n = u) :
    (c : B) * z = ((c * w * a⁻¹ : Bˣ) : B) * ((a : B) * y) ∧
      (b * q * (c ^ n)⁻¹) * (c * w * a⁻¹) ^ n = b * u * (a ^ n)⁻¹ := by
  sorry

/-- Native-coefficient-naturality: an arbitrary ring map transports the root equation. -/
theorem coefficientChange_equation (ψ : B →+* C) (n : ℕ) (u : Bˣ) (y f : B)
    (h : (u : B) * y ^ n = f) :
    ((Units.map ψ.toMonoidHom u : Cˣ) : C) * (ψ y) ^ n = ψ f := by
  sorry

/-- Native-coefficient-naturality on every labelled arrow, including zero sections. -/
theorem coefficientChange_arrow (ψ : B →+* C) (n : ℕ) (u q w : Bˣ) (y z : B)
    (hs : z = (w : B) * y) (hp : q * w ^ n = u) :
    ψ z = ((Units.map ψ.toMonoidHom w : Cˣ) : C) * ψ y ∧
      Units.map ψ.toMonoidHom q * (Units.map ψ.toMonoidHom w) ^ n =
        Units.map ψ.toMonoidHom u := by
  sorry

/-- Native-local-normalization's section equation, conditional on the actual unit root.
The existence and fppf cover are the accepted parent targets, not assumptions hidden in data. -/
theorem localNormalization_equation (n : ℕ) (u r : Bˣ) (y f : B)
    (hr : r ^ n = u) (hy : (u : B) * y ^ n = f) :
    ((r : B) * y) ^ n = f := by
  sorry

/-- Native-chart-frame-independence: the ratio of two unit roots is a μ_n label. -/
theorem transitionRoot_ratio (n : ℕ) (b r₁ r₂ : Bˣ)
    (h₁ : r₁ ^ n = b) (h₂ : r₂ ^ n = b) :
    (r₂ * r₁⁻¹) ^ n = 1 := by
  sorry

end CoordinateEndConditions

section NativeCarrierChecks

/-- The native coordinate bridge is an actual ring isomorphism, not definitional equality. -/
example (B : CommRingCat.{u}) (b : B) :
    (Scheme.ΓSpecIso B).hom ((Scheme.ΓSpecIso B).inv b) = b := by
  sorry

/-- Native line frames exist locally by an already implemented baseline declaration. -/
example {X : Scheme.{u}} (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    Nonempty (TauCeti.SheafOfModules.LocalTrivializations.{u, u, u} (R := X.ringCatSheaf) M.obj) := by
  exact ⟨TauCeti.SheafOfModules.LocalTrivializations.ofIsInvertible.{u, u, u} (R := X.ringCatSheaf) M.obj⟩

/-- Native section transport along an actual module isomorphism has the required roundtrip. -/
example {X : Scheme.{u}} {M N : X.Modules} (e : M ≅ N) (t : Γ(M, ⊤)) :
    e.inv.app ⊤ (e.hom.app ⊤ t) = t := by
  sorry

end NativeCarrierChecks

section WorkedCoordinateChecks

-- FramedNativeRoot.test_zero / framedNativeEquiv.test_zero_arrows / chart-realization:
-- the two distinct scalar labels preserve a zero section and its power identification.
example : (1 : (ZMod 4)ˣ) ≠ -1 := by
  decide

example : ((-1 : (ZMod 4)ˣ) : ZMod 4) * 0 = 0 ∧
    (-1 : (ZMod 4)ˣ) ^ 2 = 1 := by
  norm_num

-- FramedNativeEquiv.test_nonnormalized / chart-realization.test_not_surjective.
example : (3 : ZMod 4) * (1 : ZMod 4) ^ 2 = 3 := by
  norm_num

example : ¬ ∃ z : ZMod 4, z ^ 2 = 3 := by
  sorry

-- The nonzero nilpotent example tests roots with section against the reduced gerbe shortcut.
example : (3 : ZMod 9) ≠ 0 ∧ (3 : ZMod 9) ^ 2 = 0 := by
  decide

example : ¬ ∃ w : (ZMod 9)ˣ, (w : ZMod 9) * 3 = 0 := by
  sorry

-- An arbitrary test change may kill both a section and a nonidentity stabilizer.
example (ψ : ZMod 4 →+* ZMod 2) : ψ 2 = 0 ∧ ψ (-1) = 1 := by
  constructor
  · simpa only [map_ofNat] using (show (2 : ZMod 2) = 0 from by decide)
  · simpa only [map_neg, map_one] using (show (-1 : ZMod 2) = 1 from by decide)

-- The exponent-zero tensor-power check must read one, even for a zero section.
example {B : Type u} [CommRing B] : (0 : B) ^ 0 = 1 := by
  norm_num

-- Source-frame direction check: y'=2y requires u'=u/4 for n=2.
example : (1 / 4 : ℚ) * (2 : ℚ) ^ 2 = 1 := by
  norm_num

end WorkedCoordinateChecks

/-!
## Exhaustive native-signature boundary

The README section "Native signatures and the compilation boundary" records every target's
mathematical domain/codomain. The following thirteen targets are README-only as whole native
signatures at the atlas pins:

* native-power-pullback: κ on the parent root powers needs the imported tensorSection and
  strong monoidal module pullback. Its six API items and four tests are README targets.
* native-root-pullback: uses the parent RootObject carrier and κ. Its six API items and four
  tests are README targets; coefficientChange_* above are its scalar end conditions only.
* native-root-coherence: needs the root pseudofunctor and the concrete monoidal comparisons.
* native-framed-category: needs the parent native RootObject carrier. All six API items and
  four tests are specified in the README; no replacement data structure is introduced here.
* native-framed-equivalence: needs that framed category, the parent FramedRoot and native
  section-power coordinates. All six API items and four tests are README targets.
* native-frame-change: the native comparison needs the preceding carriers; frameChange_*
  states its two scalar end conditions at the actual ring/unit types.
* native-coefficient-naturality: its native natural isomorphism needs the two root categories;
  coefficientChange_* only states the scalar equations, including all unit labels.
* native-chart-realization: needs the accepted parent point groupoid, not just scalar points;
  all six API items and four tests are README targets.
* native-local-normalization: needs native root pullback and the chart functor, plus the
  accepted parent's actual fppf cover. localNormalization_equation states its final equation.
* native-stackification-equivalence: needs D0 stackification, the native root pseudofunctor
  and the affine-basis site adapter. It is not a predicate field or a proof of an orbit-set claim.
* native-chart-frame-independence: needs the native stack equivalences and their modifications;
  transitionRoot_ratio states only the μ_n equation for the transition label.
* native-finite-normalization-coherence: its whole signature needs the accepted parent's actual
  normalization and chosen-pullback maps. Native pullback uniqueness is a baseline import.
  For n=0 use the parent's all-exponent ring-map arrow square; its bundled normalization
  natural isomorphism and normalized-chart triangle are positive-exponent inputs only.
* native-universe-adapter: needs SF.0 native universe lifts and D0 equivalent-site transport;
  all six API items and four tests are README targets. No equivalence to all larger tests is asserted.

Every API/test omission is attached to its target above and enumerated by its exact name in the
README. Geometric stack, descent and universe statements are not inferred from the elaboration
of these coordinate conditions. The scalar conditions likewise do not implement the functors.
-/

end TauCeti.RootStack.RS0NativeSuggested
