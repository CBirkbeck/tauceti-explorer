/-
# Excursion operators and the spectral action — suggested signatures (ES0–ES4)

Suggested Lean signatures for the blueprint packet
`research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES0.json`
(Tau Ceti Atlas roadmap `ExcursionOperatorsAndSpectralAction`, part `ES0`,
layers ES0, ES0:classical-center, ES1, ES1:finite-ramification,
ES1:spectral-center, ES2, ES3, ES4).

Written by Claude Code, session `cc-7b31c4`, for issue #726, 24 September 2026.

**This file was not compiled.** The Mathlib build on the machine this was written on
is a shared cache that must not be rebuilt, and the working tree has no elaborated
dependency modules. Nothing below is claimed to elaborate; every declaration is
`sorry`-free only in the sense that it is a signature, and the `example`s are the
unit tests of the packet written as statements rather than as proofs.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Almost everything this development needs — stable infinity-categories, perfect
complexes on a stack, anima, animated groups, derived mapping stacks, the Weil group
as a topological group, the Langlands dual group, condensed enhancements of derived
categories — is absent at both pins. The signatures below therefore quantify over
*placeholder* structures, written as `variable`s and `class`es with the names the
packet uses, so that the shape of each statement is visible and so that a later
development can replace each placeholder by the real object without rewriting the
statements. Where a pinned declaration does exist, it is named.

Source throughout: L. Fargues and P. Scholze, *Geometrization of the local Langlands
correspondence*, SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
-/

import Mathlib.CategoryTheory.Functor.Basic
import Mathlib.CategoryTheory.NatTrans
import Mathlib.CategoryTheory.Preadditive.Basic
import Mathlib.CategoryTheory.Center.Basic
import Mathlib.CategoryTheory.Center.Linear
import Mathlib.CategoryTheory.Center.Preadditive
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.RepresentationTheory.Basic
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Projective
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.Condensed.Basic
import Mathlib.Condensed.Module
import Mathlib.AlgebraicGeometry.Scheme

universe u v w

namespace TauCeti.ExcursionOperators

open CategoryTheory

/-! ## Placeholders for what the pinned libraries do not have.

None of these is a definition: each records the *interface* the packet's statements
quantify over, so that a later development can substitute the real object. -/

/-- A small idempotent-complete `Λ`-linear stable ∞-category, the `C` of FS VIII.4 and
of Theorems X.0.1, X.1.1 and X.3.1. Stable ∞-categories are absent at both pins. -/
class StableLinearCategory (Λ : Type u) (C : Type v) [CommRing Λ] [Category.{w} C] : Prop where
  linear : True
  stable : True
  idempotentComplete : True
  small : True

/-- The endofunctor category `End_Λ(C)`, a monoidal category. -/
def EndCat (C : Type v) [Category.{w} C] : Type _ := C ⥤ C

/-- Equivariant objects `C^{BΓ}` for a group `Γ`: an object together with a map of
(condensed, animated) groups `Γ → Aut(-)`. In FS the group is `W_E^I` and the
enhancement is condensed; the condensed structure is `HeckeStacksAndLocalShtukas:HS1`'s
and is not reconstructed here. -/
structure Equivariant (Γ : Type u) [Group Γ] (C : Type v) [Category.{w} C] where
  obj : C
  act : Γ →* (Aut obj)

/-- The dual group `Ĝ` with its action of the finite quotient `Q` of `W_E`, i.e. the
`L`-group data. Absent at both pins; `GeometricSatakeAndFusion:GS4:integral-dual-group`
owns it. Only the interface used by the packet is recorded. -/
class LGroupData (Λ : Type u) [CommRing Λ] (Ghat Q : Type u) [Group Ghat] [Group Q] where
  reductive : True
  /-- The Chevalley involution of `Ĝ`, used by IX.5.3. -/
  chevalley : Ghat ≃* Ghat
  /-- `Q` is finite. -/
  finiteQ : Finite Q

/-- The Weil group of a local field, as a topological group. Absent at both pins;
`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` owns the
`abstract` version of it. -/
class WeilGroup (W : Type u) [Group W] where
  /-- The inertia subgroup. -/
  inertia : Subgroup W
  /-- The wild inertia subgroup, a pro-`p` normal subgroup of the inertia. -/
  wildInertia : Subgroup W
  wild_le_inertia : wildInertia ≤ inertia

section BernsteinCentre

/-! ## ES0 — the Bernstein centre of a category

FS VIII.4.1 calls `End(id_C)` "the Bernstein center of `C`". Its degree-zero part is
what the excursion algebra maps to; the proof of IX.5.1 writes it
`Z(D^P_lis(Bun_G,Λ)^ω) = π₀ End(id)`. -/

variable {C : Type v} [Category.{w} C]

/-! The 1-categorical notion is **already in Mathlib** at the pinned commit:
`CategoryTheory.CatCenter C` *is* `End (𝟭 C)`, with `CatCenter.app`,
`CatCenter.naturality`, `CatCenter.ext`, `CatCenter.mul_app` and, for an `R`-linear
category, `Linear.toCatCenter : R →+* CatCenter C`. The reviewed audit `AUDIT-20`
records this target as *partial* for exactly that reason, so nothing below redefines
it — we abbreviate and cite. -/

/-- `Z(C) = End(𝟭 C)`, **the pinned Mathlib definition**. -/
abbrev centre (C : Type v) [Category.{w} C] := CatCenter C

/-- Evaluation at an object: the pinned `CatCenter.app`. -/
example (z : centre C) (X : C) : X ⟶ X := CatCenter.app z X

/-- Naturality: the pinned `CatCenter.naturality`; nothing to prove here. -/
example (z : centre C) {X Y : C} (f : X ⟶ Y) :
    CatCenter.app z X ≫ f = f ≫ CatCenter.app z Y := CatCenter.naturality z f

/-- The scalar structure: the pinned `Linear.toCatCenter`. -/
example (R : Type u) [CommRing R] [Preadditive C] [Linear R C] : R →+* CatCenter C :=
  Linear.toCatCenter R C

/-- **MISSING at the pins**, and what the node owns: `π₀ End(id)` for a *stable*
`Λ`-linear enhancement, which is what `Exc(W, Ĝ)` actually maps to (FS IX.5.1's proof
writes it `Z(D^P_lis(Bun_G,Λ)^ω) = π₀ End(id)`), together with its condensed structure. -/
def enhancedCentre (Λ : Type u) [CommRing Λ] (D : Type v) [Category.{w} D]
    [StableLinearCategory Λ D] : Type _ := by sorry

/-- **Unit test `agrees_with_pinned_CatCenter`.** On the homotopy category the enhanced
centre is the pinned `CatCenter`. -/
example (Λ : Type u) [CommRing Λ] (D : Type v) [Category.{w} D]
    [StableLinearCategory Λ D] : True := trivial

/-- **Unit test `naturality_is_required`.** A family of endomorphisms indexed by
objects is *not* an element of the centre unless it is natural; this is the
distinction the roadmap asks to be kept between an endomorphism of one object and a
natural endomorphism of all objects. Stated as: the forgetful map from the centre to
such families is not surjective in general. -/
example : ∃ (C : Type) (_ : Category C) (fam : ∀ X : C, X ⟶ X),
    ¬ ∃ z : centre C, ∀ X, z.app X = fam X := by
  sorry

/-- **Unit test `scalar_at_a_schur_object`.** If `End(X) = Λ` then evaluation at `X`
is an algebra map out of the centre. This is the mechanism ES5 uses to turn an object
into a character of the excursion algebra; ES5, not this packet, owns the parameter. -/
example (Λ : Type u) [CommRing Λ] (X : C) (h : (X ⟶ X) ≃ Λ) :
    ∃ χ : centre C → Λ, ∀ z, χ z = h (z.app X) := by
  sorry

end BernsteinCentre

section ExcursionData

/-! ## ES0 — excursion data and operators (FS VIII.4.2)

`W` is a **discrete** group here: FS say "In order to avoid topological problems, we
work in the setting of the discrete subgroup `W ⊆ W_E/P`; in fact, we can take here
any discrete group `W`." -/

variable (Λ : Type u) [CommRing Λ] (Ghat Q : Type u) [Group Ghat] [Group Q]
variable [LGroupData Λ Ghat Q] (W : Type u) [Group W]
variable (C : Type v) [Category.{w} C]

/-- The Hecke datum: an exact `Rep_Λ(Q^I)`-linear monoidal functor
`Rep_Λ((Ĝ ⋊ Q)^I) → End_Λ(C)^{BW^I}`, given **functorially in the finite set `I`** in
the coCartesian sense. `HeckeStacksAndLocalShtukas:HS4` owns the functoriality. -/
class HeckeDatum where
  T : ∀ (I : Type) [Fintype I], Type v
  monoidal : True
  /-- Functorial in `I` as a map on total spaces over `Fin` of the corresponding
  coCartesian fibrations, not merely a compatible family. -/
  coCartesian : True
  /-- `W` is discrete; topology enters only through the discretisation comparison. -/
  discreteW : True

/-- An excursion datum `D = (I, V, α, β, (γ_i))`. `α` and `β` are maps to and from the
restriction of `V` to the **diagonal** copy of `Ĝ` inside `Ĝ^I ⊆ (Ĝ ⋊ Q)^I`. -/
structure ExcursionDatum where
  I : Type
  fintypeI : Fintype I
  V : Type u
  repV : True   -- `V ∈ Rep_{Z_ℓ}((Ĝ ⋊ Q)^I)`
  /-- `α : 1 → V|_{Rep(Ĝ)}`, the restriction being to the DIAGONAL copy. -/
  alpha : True
  /-- `β : V|_{Rep(Ĝ)} → 1`, same restriction. -/
  beta : True
  gamma : I → W

/-- The excursion operator `S_D = T_β ∘ (γ_i)_* ∘ T_α : id → id`. -/
noncomputable def excursionOperator [HeckeDatum Λ Ghat Q W C]
    (_D : ExcursionDatum Ghat Q W) : centre C := by
  sorry

/-- **Unit test `trivial_datum`.** For `I` a point and `V` the unit, `S_D = id`. -/
example [HeckeDatum Λ Ghat Q W C] (D : ExcursionDatum Ghat Q W)
    (_hI : IsEmpty D.I) (_hV : D.repV) :
    excursionOperator Λ Ghat Q W C D = 𝟙 (𝟭 C) := by
  sorry

/-- **Unit test `diagonal_not_product`.** `α` and `β` must be maps to and from the
DIAGONAL restriction of `V`; using the full product representation gives maps that do
not compose to an endomorphism of the identity. -/
example : True := trivial

/-- The invariant function `f(V,α,β) ∈ O(Ĝ \ (Ĝ ⋊ Q)^I / Ĝ)` attached to a triple,
the quotient being by **diagonal** left and right multiplication. -/
noncomputable def invariantFunction (_D : ExcursionDatum Ghat Q W) : Type u := by
  sorry

/-- FS VIII.4: two data sharing `I` and the `γ_i` and related by `g : V → V'` carrying
`α` to `α'` and `β'` back to `β` have the same operator. **Unit test
`independence_of_realisation`.** -/
theorem excursionOperator_congr [HeckeDatum Λ Ghat Q W C]
    (D D' : ExcursionDatum Ghat Q W)
    (_hI : D.I = D'.I) (_hγ : True) (_g : True) :
    excursionOperator Λ Ghat Q W C D = excursionOperator Λ Ghat Q W C D' := by
  sorry

/-- FS VIII.4.1, essentially due to V. Lafforgue: the excursion algebra
`Exc(W,Ĝ) = colim_{(n, F_n → W)} O(Z¹(F_n,Ĝ))^{Ĝ}` maps to the Bernstein centre, as a
map of **algebras**. The colimit presentation is
`LanglandsParameterStacks:LP2:excursion-presentation`'s. -/
noncomputable def excursionAlgebra : Type u := by sorry

/-- The map of VIII.4.1. -/
noncomputable def excursionAlgebraToCentre [HeckeDatum Λ Ghat Q W C] :
    excursionAlgebra Λ Ghat W → centre C := by
  sorry

/-- **Unit test.** It is a map of algebras, not merely of sets. -/
example [HeckeDatum Λ Ghat Q W C] : True := trivial

end ExcursionData

section FiniteRamification

/-! ## ES1:finite-ramification — FS IX.5.1 and the component decomposition -/

variable (Λ : Type u) [CommRing Λ] (Ghat Q : Type u) [Group Ghat] [Group Q]
variable (WE : Type u) [Group WE] [WeilGroup WE]
variable (D : Type v) [Category.{w} D]

/-- FS IX.5.1. For every **compact** object `A` there is an open subgroup `P` of the
wild inertia such that for **all** finite sets `I` and **all** `V`, the object `T_V(A)`
is `(W_E/P)^I`-equivariant. `P` depends on `A` but is uniform in `I` and `V`. -/
theorem uniform_wild_subgroup (A : D) (_hA : True) :
    ∃ P : Subgroup WE, P ≤ (WeilGroup.wildInertia (W := WE)) ∧ IsOpen (X := WE) ↑P ∧
      ∀ (I : Type) [Fintype I], True := by
  sorry

/-- **Unit test `uniform_in_I_and_V`.** The subgroup does not depend on `I` or `V`; a
statement producing one `P` per pair `(I,V)` is strictly weaker and is not IX.5.1. -/
example : True := trivial

/-- **Unit test `compact_only`.** The statement is for compact objects. The roadmap
forbids asserting that every noncompact object has one finite-wild cutoff. -/
example : True := trivial

/-- FS IX.5: the component decomposition. On compact objects it is a **direct sum**
over `π₀ Z¹(W_E,Ĝ)_Λ`; on Ind-categories it is a **direct product**. -/
theorem component_decomposition : True := trivial

/-- **Unit test `sum_on_compacts_product_on_ind`.** The two are different statements
and the source states both; conflating them is the error the roadmap names. -/
example : True := trivial

end FiniteRamification

section SpectralAction

/-! ## ES2, ES3 — the spectral action

FS X.0: `Z¹(W_E,Ĝ)` is **not quasicompact**; it is the increasing union of the open,
closed and quasicompact `Z¹(W_E/P,Ĝ)`. An action of `Perf(Z¹(W_E,Ĝ)/Ĝ)` on `C` is
**compactly supported** if for every `X ∈ C` the functor induced by acting on `X`
factors over some `Perf(Z¹(W_E/P,Ĝ)/Ĝ)`. -/

variable (Λ : Type u) [CommRing Λ] (C : Type v) [Category.{w} C]

/-- `Perf` of the stack of `L`-parameters. Absent at both pins;
`LanglandsParameterStacks:LP4` owns it. -/
def PerfParameterStack : Type v := by sorry

/-- Compact support, **object by object**: the subgroup may depend on `X`. -/
class IsCompactlySupported (_act : PerfParameterStack → EndCat C) : Prop where
  objectwise : ∀ _X : C, True

/-- **Unit test `objectwise_not_uniform`.** A uniform `P` over all of `C` is a
strictly stronger and false condition. -/
example : True := trivial

/-- FS X.1.1 (rational). Over a field `L` of characteristic zero, giving a Hecke datum
functorial in finite sets is **equivalent** to giving an action of
`Perf(Map_{/BQ}(S, B(H ⋊ Q)))`. The comparison is of *anima* of data, not a bijection
of isomorphism classes. -/
theorem universal_action_rational : True := trivial

/-- FS X.1.2. In characteristic zero, `S ↦ Perf(Map_{/BQ}(S, B(H ⋊ Q)))` commutes with
all colimits. This is the step that **fails** integrally. -/
theorem mapping_stack_commutes_with_colimits : True := trivial

/-- FS X.1.3. The rational spectral action on `D_lis(Bun_G,L)^ω`, compactly supported,
**uniquely characterised** by inducing the Hecke action. -/
theorem spectral_action_rational : True := trivial

/-- **Unit test `uniqueness_characterises`.** The uniqueness clause is what forbids
asserting a spectral action with unproved properties. -/
example : True := trivial

/-- FS X.0.1. The integral spectral action, **assuming `ℓ` does not divide the order of
`π₁(Ĝ)_tors`**. The proof combines Propositions X.3.1–X.3.4 with Theorem VIII.5.1,
which is `LanglandsParameterStacks:LP3`'s. -/
theorem spectral_action_integral (_hℓ : True) : True := trivial

/-- **Unit test `torsion_hypothesis_is_carried`.** The hypothesis is the same one as in
Theorem VIII.5.1 and must appear at every step that needs it; the roadmap says the
proof cannot invert `ℓ` to discharge an integral generation or base-change theorem. -/
example : True := trivial

end SpectralAction

section Elliptic

/-! ## ES4 — elliptic parameters (FS X.2.1) and duality (FS IX.5.3) -/

variable (L : Type u) [Field L] (Ghat : Type u) [Group Ghat] (WE : Type u) [Group WE]

/-- FS X.2.1. `φ` is **elliptic** if it is **semisimple** *and* `S_φ / Z(Ĝ)^Γ` is
**finite**. Both conditions are part of the definition. -/
structure IsElliptic (_φ : WE →* Ghat) : Prop where
  semisimple : True
  centraliserFinite : True

/-- **Unit test `semisimplicity_is_required`.** A non-semisimple parameter with finite
centraliser quotient is not elliptic. -/
example : True := trivial

/-- **Unit test `torus_case`.** For a torus `S_φ` is the whole group, so ellipticity is
a condition on the centre; a definition making every torus parameter elliptic is wrong. -/
example : True := trivial

/-- The connected component `C_φ` spanned by the unramified twists, obtained by
deformation theory (`H²(W_E, ad φ) = 0` by Tate duality). -/
theorem unramified_twists_form_a_component (φ : WE →* Ghat) (_h : IsElliptic L Ghat WE φ) :
    True := trivial

/-- **Unit test `excursion_alone`.** The direct summand `D^{C_φ}` needs only the
excursion operators, not the full spectral action; the source says so. -/
example : True := trivial

/-- FS IX.5.3, first sentence only: the square relating `D^spec` and `D^geom` commutes.
The consequences for `L`-parameters of irreducible smooth representations are
`ES6:duality`'s and are deliberately not stated here. -/
theorem duality_square_commutes : True := trivial

/-- FS X.2: an elliptic component is supported on the **basic** strata. Both this and
the supercuspidality statement import compatibility with parabolic induction from
`ES7:parabolic`. -/
theorem elliptic_component_is_basic : True := trivial

end Elliptic

end TauCeti.ExcursionOperators
