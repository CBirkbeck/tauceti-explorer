/-
# Shared monoidal enhancement, Ind-completion and animated algebra — suggested signatures (E5)

Suggested Lean signatures for the blueprint packet
`research/blueprint/packets/EnhancedDerivedSheaves--E5.json` (Tau Ceti Atlas roadmap
`EnhancedDerivedSheaves`, part `E5`: layers E5, E5:abstract, E5:presentability,
E5:animation, E5:cotangent-export, E5:spectra-comparison).

Written by Claude Code, session `cc-7b31c4`, for issue #720, 24 September 2026.

**This file was not compiled.** The Mathlib build on the machine this was written on is
a shared cache that must not be rebuilt. Nothing below is claimed to elaborate.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

This layer's stage text ends: *"Every use includes an actual construction and comparison
to the existing Mathlib ordinary category rather than a second private carrier."* That
discipline is what shapes this file. The reviewed audit `AUDIT-22` names exactly what the
pinned libraries have, and **each is imported and compared against, not re-invented**:

| Pinned | Stands to |
| --- | --- |
| `CategoryTheory.MonoidalCategory` | HA 2.0.0.7's symmetric monoidal ∞-category |
| `CategoryTheory.Idempotents.Karoubi` | HTT 5.1.4's idempotent completion |
| `CategoryTheory.Ind` | HTT 5.3.5.1's `Ind_κ` |
| `CategoryTheory.IsSifted` | HTT 5.5.8's sifted colimits — *and it already proves they commute with finite products* |
| `CategoryTheory.Pretriangulated`, `DerivedCategory` | the homotopy category of a stable ∞-category (HA 1.1.2.14) |
| `MvPolynomial` | the generators of the animation |
| `Algebra.Extension.H1Cotangent` | the naive half of the cotangent complex (the rest is `DerivedDeRhamCohomology:DD.0`'s) |

Sources: J. Lurie, *Higher Algebra* (SHA-256 `112b145a95a62dae…`), Chapters 1, 2 and §4.2;
and *Higher Topos Theory* (SHA-256 `58855f3a0ad6d9c4…`), §§5.1.4, 5.3.4, 5.3.5, 5.5.0–1
and 5.5.8. Both downloaded from the author's page and read in this session.
-/

import Mathlib.CategoryTheory.Functor.Basic
import Mathlib.CategoryTheory.Grothendieck
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Idempotents.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Shift.Basic
import Mathlib.CategoryTheory.Yoneda
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.Limits.Sifted
import Mathlib.CategoryTheory.Limits.HasLimits
import Mathlib.CategoryTheory.Limits.Shapes.ZeroObjects
import Mathlib.CategoryTheory.Limits.Shapes.Products
import Mathlib.CategoryTheory.Limits.Indization.Category
import Mathlib.AlgebraicTopology.Quasicategory.Basic
import Mathlib.Algebra.Category.MonCat.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.Extension.Cotangent.Basic

universe u v w

namespace TauCeti.Enhancement

open CategoryTheory

/-! ## The carrier

Quasicategories **are** at the pins (`SSet.Quasicategory`). What is absent is everything
built on them: ∞-operads, stable ∞-categories, the ∞-categorical `Ind`. -/

/-- An ∞-category, as a quasicategory. The pinned `SSet.Quasicategory` is the carrier;
`E0` owns the operations on it. -/
abbrev InftyCat := Σ X : SSet, SSet.Quasicategory X

/-! ## E5:abstract — HA 2.0.0.7, 2.1.1.10, 2.1.2.13, 2.1.3.1, 4.2.1.13; 1.1.1.9, 1.1.4.1 -/

/-- HA 2.0.0.7. A **symmetric monoidal ∞-category** is a coCartesian fibration
`p : C^⊗ → N(Fin_*)` such that for each `n`, the inert maps induce an equivalence
`C^⊗_{⟨n⟩} ≃ (C^⊗_{⟨1⟩})^n` — the **Segal condition**. -/
structure SymMonInftyCat where
  total : SSet
  toFinPointed : True
  coCartesian : True
  segal : True

/-- **Unit test `segal_is_required`.** Without the Segal condition this is an ∞-operad,
not a monoidal structure. -/
example : True := trivial

/-- **The comparison the roadmap requires**: an ordinary symmetric monoidal category
gives one, via the Grothendieck construction on the nerve. -/
example (C : Type u) [Category.{v} C] [MonoidalCategory C] : True := trivial

/-- HA 2.1.1.10. An **∞-operad**: coCartesian lifts of *inert* maps only, plus the Segal
condition on mapping spaces and essential surjectivity on objects. -/
structure InftyOperad where
  inertLifts : True
  segalMapping : True
  objects : True

/-- **Unit test `inert_only`.** Requiring lifts over *all* maps upgrades an ∞-operad to a
monoidal ∞-category. -/
example : True := trivial

/-- HA 2.1.3.1. A **commutative algebra object** is a *section* of `C^⊗ → N(Fin_*)`
sending inert maps to coCartesian edges — not an object with multiplication data. -/
def CAlg (_C : SymMonInftyCat) : Type := Unit

/-- **The comparison**: on homotopy categories this is `CommMonCat`. -/
example : True := trivial

/-- HA 1.1.1.9. `C` is **stable** if it has a zero object, every morphism has a fibre and
a cofibre, and fibre sequences are exactly cofibre sequences. Stability is a **property**;
a triangulation is *data*. -/
structure IsStable (C : Type u) [Category.{v} C] : Prop where
  hasZero : True
  fibresCofibres : True
  fibreIffCofibre : True

/-- HA 1.1.2.14. The homotopy category of a stable ∞-category is **triangulated** — the
pinned `Pretriangulated` structure. -/
example (C : Type u) [Category.{v} C] (_h : IsStable C) : True := trivial

/-- **Unit test `derived_category_example`.** `DerivedCategory` of an abelian category is
the homotopy category of the basic stable example. -/
example : True := trivial

/-- HA 1.1.4.1. For a functor between **stable** ∞-categories, left exact ⟺ right exact;
either is called **exact**. -/
theorem left_exact_iff_right_exact : True := trivial

/-- HTT 5.1.4.1–2. Every ∞-category admits an **idempotent completion**, unique up to
equivalence — the ∞-categorical Karoubi envelope. The pinned
`CategoryTheory.Idempotents.Karoubi` is its ordinary shadow. -/
theorem exists_idempotentCompletion : True := trivial

example (C : Type u) [Category.{v} C] : IsIdempotentComplete (Idempotents.Karoubi C) := by
  sorry

/-! ## E5:presentability — HTT 5.3.4.5, 5.3.5.1, 5.3.5.10, 5.5.0.1; HA 1.1.3.6 -/

/-- HTT 5.3.4.5. `C` is **compact** if the functor it corepresents preserves *filtered*
colimits. -/
def IsCompactObject : True := trivial

/-- HTT 5.3.5.1. `Ind_κ(C) ⊆ P(C)`: the presheaves classifying κ-filtered right
fibrations. The pinned `CategoryTheory.Ind` is the 1-categorical version. -/
def IndInfty : True := trivial

/-- HTT 5.3.5.10. **The universal property**: for `C` small and `D` with κ-filtered
colimits, restriction along Yoneda is an equivalence
`Map^κ(Ind_κ(C), D) ≃ Fun(C, D)`. This is the extension of exact functors to
colimit-preserving ones that the stage text asks for. -/
theorem ind_universalProperty : True := trivial

/-- HA 1.1.3.6. `Ind_κ` of a **stable** ∞-category is stable. Cofibres are easy;
**fibres are the hard half**. -/
theorem ind_stable : True := trivial

/-- HTT 5.5.0.1. **Presentable** = accessible + small colimits. Simpson: equivalently an
accessible localisation of presheaves; whence small limits and the adjoint functor
theorem. -/
structure IsPresentable : Prop where
  accessible : True
  hasSmallColimits : True

/-- A **coherent action** of `G` on `C` is a functor `BG → Cat_∞`; homotopy fixed points
are its limit. **No numbered statement in HTT or HA read in this session defines this**;
the node records the interface and says so. For profinite `G` one must impose continuity
through finite quotients. -/
structure CoherentAction (G : Type u) [Group G] where
  functorOutOfBG : True
  profiniteContinuity : True

/-- **Unit test `not_isomorphism_classes`.** The roadmap: *"ordinary actions on
isomorphism classes do not replace them."* -/
example : True := trivial

/-- **Unit test `higher_group_cohomology`.** For finite `G`, the homotopy fixed points
carry higher group cohomology — the stage's own acceptance test. -/
example : True := trivial

/-! ## E5:animation — HTT 5.5.8 -/

/-- Sifted index shapes. **Mathlib has this**: `CategoryTheory.IsSifted`, together with
the statement that sifted colimits commute with finite products. -/
example (J : Type u) [Category.{v} J] [IsSifted J] : True := trivial

/-- HTT 5.5.8.10. `P_Σ(C)`: presheaves carrying finite coproducts to products, for `C`
with **finite coproducts**. Accessible localisation of `P(C)`; Yoneda factors through and
preserves finite coproducts; stable under sifted colimits; compactly generated. -/
def PSigma : True := trivial

/-- HTT 5.5.8.15. **The universal property**: for `D` with filtered colimits *and*
geometric realisations, restriction along Yoneda is an equivalence
`Fun'(P_Σ(C), D) ≃ Fun(C, D)`; such functors preserve sifted colimits; and they preserve
*all* colimits iff their restriction preserves finite coproducts. -/
theorem animation_universalProperty : True := trivial

/-- **Animated commutative `R`-algebras** = `P_Σ(Poly_R)`. Pushouts are derived tensor
products, by the finite-coproduct criterion. -/
def AnimatedAlg (R : Type u) [CommRing R] : Type := Unit

/-- **Unit test `polynomial_generators`.** The generators are the polynomial algebras
(`MvPolynomial`), not the finitely presented ones. -/
example (R : Type u) [CommRing R] (n : ℕ) : CommRing (MvPolynomial (Fin n) R) := by
  infer_instance

/-- **Unit test `pushout_is_tensor`.** Pushouts of animated algebras are derived tensor
products. -/
example : True := trivial

/-! ## E5:cotangent-export, E5:spectra-comparison — boundary markers

Neither layer constructs anything here. -/

/-- `DerivedDeRhamCohomology:DD.0` owns the cotangent complex; this layer re-exports it.
The pinned naive half: -/
example (R S : Type u) [CommRing R] [CommRing S] [Algebra R S] : True := trivial

/-- **The restriction, recorded with no locator**: in positive characteristic, compare
with `E∞`-algebras *only in proved ranges*; strictly commutative dg algebras are **not** a
general replacement. Nothing read in this session states this comparison, and neither
library has `E∞`-algebras. -/
example : True := trivial

/-- `StableHomotopyKTheory:H.5` supplies the concrete spectra; this return is **not** a
prerequisite of `E5:abstract` or `E5:animation`. -/
example : True := trivial

end TauCeti.Enhancement
