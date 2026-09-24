/-
# The parameter assignment and its functoriality — suggested signatures (ES5, ES6)

Suggested Lean signatures for the blueprint packet
`research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES5.json`
(Tau Ceti Atlas roadmap `ExcursionOperatorsAndSpectralAction`, part `ES5`,
layers ES5, ES6, ES6:functoriality, ES6:duality).

Written by Claude Code, session `cc-7b31c4`, for issue #727, 24 September 2026.

**This file was not compiled.** The Mathlib build on the machine this was written on
is a shared cache that must not be rebuilt, and the working tree has no elaborated
dependency modules. Nothing below is claimed to elaborate; the `example`s are the
unit tests of the packet written as statements.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Two things this part needs are absent from *both* pinned libraries and are not
approximated here:

* **local class field theory** — a search of the pinned declaration index found no
  Artin map, no local reciprocity map and no class field theory at all, and Tau Ceti's
  only `Weil` declarations concern Weil divisors. The whole torus case (FS IX.6.4,
  IX.6.5) rests on `Z¹(W_E, G_m) = Hom(E^×, G_m)`, so those statements are written
  below against a placeholder `LocalReciprocity` class;
* **the local Weil group** as a topological group, with its inertia, wild inertia and
  the degree map normalised by sending geometric Frobenius to `1`.

Everything else — the dual group, stable ∞-categories, perfect complexes on a stack,
the condensed enhancement of `D_lis` — is likewise a placeholder, named as the packet
names it, so that a later development can substitute the real object without rewriting
the statements.

Source throughout: L. Fargues and P. Scholze, *Geometrization of the local Langlands
correspondence*, SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
-/

import Mathlib.RepresentationTheory.Basic
import Mathlib.Algebra.Group.Hom.Defs
import Mathlib.NumberTheory.MulChar.Basic
import Mathlib.Algebra.Group.Units.Hom
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Ring.Defs
import Mathlib.Algebra.Ring.Hom.Defs
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.Algebra.Group.Subgroup.Defs
import Mathlib.Condensed.Basic
import Mathlib.Condensed.Module
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.AlgebraicGeometry.Scheme

universe u v w

namespace TauCeti.ParameterAssignment

open CategoryTheory

/-! ## Placeholders -/

/-- The local Weil group, with its inertia and wild inertia and the normalised degree
map. Absent at both pins; requested from
`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`. -/
class WeilGroup (W : Type u) [Group W] where
  inertia : Subgroup W
  wildInertia : Subgroup W
  wild_le_inertia : wildInertia ≤ inertia
  /-- `|·| : W → ℤ`, normalised by sending a geometric Frobenius to `1`. -/
  degree : W →* Multiplicative ℤ

/-- Local class field theory: `Z¹(W_E, G_m) = Hom(E^×, G_m)`, with a **fixed**
geometric-Frobenius normalisation. Absent at both pins; the whole torus case of
`ES6:functoriality` rests on it. -/
class LocalReciprocity (E : Type u) [Field E] (W : Type u) [Group W] [WeilGroup W] where
  recip : True
  /-- The normalisation is part of the datum, not a convention chosen later. -/
  geometricFrobeniusNormalised : True

/-- The dual group with its `Q`-action, its Chevalley involution and the switching
involution `sw` of FS VI.12.1. Owned by `GeometricSatakeAndFusion:GS4` and
`ReductiveGroupsPartII:RG2.5`. -/
class LGroupData (Ghat Q : Type u) [Group Ghat] [Group Q] where
  chevalley : Ghat ≃* Ghat
  finiteQ : Finite Q
  /-- `sw`, which agrees with the Chevalley involution up to an inner automorphism
  (FS VI.12.1, **not read**). -/
  sw : True

/-- The condensed enhancement of `D_lis(Bun_G, Λ)`. On compact objects it is the
*relatively discrete* condensed structure (FS IX.1.2). -/
class CondensedEnhancement (Λ : Type u) [CommRing Λ] (D : Type v) [Category.{w} D] where
  relativelyDiscreteOnCompacts : True

section Schur

/-! ## ES5 — Schur-irreducibility (FS IX.4.1)

`End(A) = L` **as condensed algebras**. The abstract condition is strictly weaker and
does not produce a continuous parameter. -/

variable (L : Type u) [Field L] {D : Type v} [Category.{w} D]
variable [CondensedEnhancement L D]

/-- `A` is Schur-irreducible: the unit `L → End(A)` is an isomorphism of **condensed**
`L`-algebras. -/
structure IsSchurIrreducible (A : D) : Prop where
  /-- Abstractly the endomorphisms are scalars … -/
  scalar : ∀ _f : A ⟶ A, True
  /-- … and the identification is one of condensed algebras, which is the content. -/
  condensed : True

/-- **Unit test `condensed_not_abstract`.** There are objects with `End(A) = L`
abstractly but not as condensed algebras; only the condensed condition is used. -/
example : True := trivial

/-- **Unit test `stable_under_shift`.** -/
example (A : D) (_h : IsSchurIrreducible L A) : True := trivial

/-- **Unit test `no_free_base_change`.** Base change along `L → L'` need not preserve
Schur-irreducibility; the transport statement below carries the hypothesis explicitly. -/
example : True := trivial

end Schur

section Character

/-! ## ES5 — the excursion character (FS VIII.3.7, VIII.3.8)

For each `n ≥ 1` a map `Θₙ(A) : O((Ĝ ⋊ Q)ⁿ // Ĝ) → Map(W_Eⁿ, L)` of **condensed sets**,
linear over `O(Qⁿ)`, satisfying the pullback and multiplication relations. -/

variable (L : Type u) [Field L] (Ghat Q : Type u) [Group Ghat] [Group Q] [LGroupData Ghat Q]
variable (W : Type u) [Group W] [WeilGroup W]

/-- `O((Ĝ ⋊ Q)ⁿ // Ĝ)`, the invariant functions. Owned by
`LanglandsParameterStacks:LP2:excursion-presentation`. -/
def invariants (_n : ℕ) : Type u := by sorry

/-- The excursion character of a Schur object. -/
noncomputable def excursionCharacter (_n : ℕ) : invariants Ghat Q _n → (Fin _n → W) → L := by
  sorry

/-- **Relation (pullback).** For `g : Fin m → Fin n` the square induced by pullback
along `g` commutes. -/
theorem excursionCharacter_pullback (m n : ℕ) (_g : Fin m → Fin n) : True := trivial

/-- **Relation (multiplication).** The square induced by the multiplication map
`(Ĝ ⋊ Q)^m → (Ĝ ⋊ Q)^n`, which multiplies in each fibre over `i` the terms of
`g⁻¹(i)` **in their induced order**, commutes. -/
theorem excursionCharacter_multiplication (m n : ℕ) (_g : Fin m → Fin n) : True := trivial

/-- **Unit test `ordering_matters`.** Reordering the terms of `g⁻¹(i)` gives a
different — and false — relation. -/
example : True := trivial

/-- **Unit test `continuity_from_condensed`.** The maps are condensed because the Schur
condition is; with the abstract condition no parameter results. -/
example : True := trivial

/-- **Unit test `no_parameter_yet`.** The construction produces a family of maps, not a
homomorphism out of `W_E`; the passage is FS VIII.3.8's, which
`LanglandsParameterStacks:LP2:semisimple-characters` owns. -/
example : True := trivial

end Character

section Parameter

/-! ## ES5 — the parameter itself (FS VIII.4.3, IX.4.1) -/

variable (L : Type u) [Field L] (Ghat Q : Type u) [Group Ghat] [Group Q] [LGroupData Ghat Q]
variable (WE : Type u) [Group WE] [WeilGroup WE]

/-- A semisimple `L`-parameter `W_E → Ĝ(L) ⋊ Q`, taken **up to `Ĝ(L)`-conjugation**. -/
structure SemisimpleParameter where
  map : WE →* Ghat
  continuous : True
  semisimple : True

/-- FS VIII.4.3: an object of an abstract Hecke category with `End(X) = L` has a unique
semisimple parameter, up to conjugation, characterised on all excursion data. `W` is
**discrete** in this statement. -/
theorem abstract_parameter_exists_unique : True := trivial

/-- FS IX.4.1: the same for a Schur-irreducible `A ∈ D_lis(Bun_G, L)`, with `W_E`
itself and with continuity from the condensed Schur condition. -/
theorem parameter_of_schur_object : True := trivial

/-- **Unit test `uniqueness_up_to_conjugacy_only`.** Two parameters with the same
semisimplification are not distinguished by the excursion operators. -/
example : True := trivial

/-- **Unit test `any_characteristic`.** The assignment needs no hypothesis on
`|π₀Z(G)|` and no good-prime condition; it holds for every `ℓ ≠ p`. -/
example : True := trivial

/-- FS VII.7.2: `i_b^*` has a left adjoint `π_{b!} q_b^*`, whose unit is an
equivalence — hence it is fully faithful. Owned by
`VStackSheavesAndLisseCategories:VS4`. -/
theorem stratumEmbedding_fullyFaithful : True := trivial

/-- The parameter `φ_(G,b,π)` of an irreducible smooth representation of `G_b(E)`, and
`φ_π` at `b = 1`. -/
noncomputable def parameterOfRepresentation : True := trivial

/-- **Unit test `independence_of_embedding`.** All eligible embeddings induce the same
map to the Bernstein centre, so the parameter does not depend on the choice. FS assert
this in a parenthesis in Definition IX.7.1 and prove it nowhere read. -/
example : True := trivial

/-- **Unit test `schur_is_proved_not_assumed`.** That the transported object has
condensed endomorphism algebra `L` is a statement about the representation category and
is **not** stated in the source. -/
example : True := trivial

end Parameter

section Functoriality

/-! ## ES6:functoriality — FS IX.6.1–IX.6.5

Every *centre-level* square below carries the standing hypothesis of FS IX.6 — the
order of `π₀Z(G)` invertible in `Λ` — **for each participating group**; the
*parameter-level* consequences carry none. -/

/-- FS IX.6.1. For `G' → G` inducing an isomorphism of adjoint groups, and `A'` a
Schur-irreducible **constituent** of `π^* A`, `φ_{A'}` is `φ_A` composed with
`Ĝ → Ĝ'`. -/
theorem isogeny_compat : True := trivial

/-- **Unit test `constituent_hypothesis`.** `π^* A` need not itself be
Schur-irreducible; dropping "constituent" makes the statement false. -/
example : True := trivial

/-- FS IX.6.2. Products of groups give products of parameters, for a Schur-irreducible
constituent of an exterior tensor product. -/
theorem product_compat : True := trivial

/-- FS IX.6.3. Weil restriction along a finite **separable** `E'/E`, with the
excursion-algebra comparison `Exc(W,Ĝ) = Exc(W',Ĝ')`. -/
theorem weilRestriction_compat : True := trivial

/-- **Unit test `finite_index_free`.** `F_n ×_W W' ⊆ F_n` is of finite index, hence
itself finitely generated free — this is what makes the colimit comparison work. -/
example (n : ℕ) (_H : Subgroup (FreeGroup (Fin n))) (_hfin : True) : True := trivial

/-- FS IX.6.4. For a torus, `Z^spec(T,Λ) ≅ lim_K Λ[T(E)/K]`. The `G_m` case **is**
local class field theory. -/
theorem torus_spectralCentre (E : Type u) [Field E] (W : Type u) [Group W] [WeilGroup W]
    [LocalReciprocity E W] : True := trivial

/-- FS IX.6.5. The map `Z^spec(T,Λ) → Z^geom(T,Λ)` is the **diagonal** embedding, and
`φ_χ` is the parameter local class field theory attaches to `χ`. -/
theorem torus_diagonal : True := trivial

/-- **Unit test `diagonal_not_one_component`.** The image is the diagonal; landing in a
single factor would make the assignment depend on `b`, which it does not. -/
example : True := trivial

/-- A **z-embedding** `G → G'`: torus quotient `D`, connected centre `Z(G')`. -/
structure IsZEmbedding : Prop where
  torusQuotient : True
  connectedCentre : True

/-- `B(G) → B(G')` is injective, **deduced** from surjectivity of `G'_{b'}(E) → D(E)`. -/
theorem zEmbedding_injective_on_B : True := trivial

/-- **Unit test `existence_is_external`.** The existence of a z-embedding is Kaletha's
(§5) and is **not** proved in anything read. -/
example : True := trivial

end Functoriality

section Duality

/-! ## ES6:duality — FS IX.5.3, second sentence -/

/-- Compatibility with Bernstein–Zelevinsky duals, from the commuting square of `ES4`
and the Chevalley involution. The inner automorphism of FS VI.12.1 may be dropped only
*after* passing to the quotient by conjugation. -/
theorem parameter_of_BZ_dual : True := trivial

/-- Compatibility with smooth duals. Immediate for supercuspidals, where the two duals
agree; in general it **follows from parabolic induction** (FS IX.7.3), which is
`ES7:parabolic`'s — so this is a late return and the dependence must not be made
circular. -/
theorem parameter_of_smooth_dual : True := trivial

/-- **Unit test `supercuspidal_case`.** For supercuspidal `π` the Bernstein–Zelevinsky
dual is the smooth dual. -/
example : True := trivial

/-- **Unit test `chevalley_preserved`.** The dual parameter carries the Chevalley
involution; forgetting it gives the wrong parameter. -/
example : True := trivial

end Duality

end TauCeti.ParameterAssignment
