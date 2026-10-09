import Mathlib
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Picard.Basic

/-!
# Néron models and semistable abelian varieties: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned Mathlib API. It is not an exhaustive list of the
results in any layer.

The file makes the following design choices explicit.

* The Néron mapping property is a predicate on an object of `Over S` relative to a fixed morphism
  `j : η ⟶ S`, quantified over **all** smooth test objects of `Over S`; the restriction map is the
  action of Mathlib's `Over.pullback j` on morphisms. Testing only étale objects is the weak-model
  condition, which is a separate structure.
* A Néron model is *marked*: the isomorphism of its generic fibre with the given variety is data,
  and every uniqueness statement is a statement about marked models.
* Finite type is enforced by `QuasiCompact` on top of `Smooth` (which already gives locally finite
  presentation); a locally-finite-type model is not a model in the sense of this file.
* The lattice-level part of the monodromy theory (the integral pairing, its cokernel and
  two-lattice discriminant pairing, and the cycle lattice of a dual multigraph) is stated over `ℤ` with no geometric carrier, so that the
  arithmetic computations of the roadmap's checks are already meaningful.
* The intersection-matrix comparison of the component group of a Jacobian uses Tau
  Ceti's numerical Picard group `TauCeti.NumericalType.Pic` and its degree map, which are pinned
  and not redefined.
-/

namespace TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

universe u

/-! ## Layer 1: Néron models and their uniqueness -/

section Models

variable {S η : Scheme.{u}} (j : η ⟶ S)

/-- The Néron mapping property of `X` over `S` relative to `j : η ⟶ S`: for every smooth `Y` over
`S` the generic restriction `Hom_S(Y, X) → Hom_η(Y_η, X_η)` is bijective
(Bosch–Lütkebohmert–Raynaud, §1.2 Definition 1). -/
def NeronMappingProperty (X : Over S) : Prop :=
  ∀ Y : Over S, Smooth Y.hom →
    Function.Bijective (fun f : Y ⟶ X => (Over.pullback j).map f)

namespace NeronMappingProperty

variable {j} {X Y : Over S}

/-- Generic restriction is bijective on the specified class of test objects. -/
theorem bijective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Bijective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry

/-- Generic restriction distinguishes morphisms from a permitted test object. -/
theorem injective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Injective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry

/-- Every generic morphism from a permitted test object extends. -/
theorem surjective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Surjective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry

/-- A generic morphism from a permitted test object has exactly one extension. -/
theorem existsUnique (h : NeronMappingProperty j X) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X) :
    ∃! g : Y ⟶ X, (Over.pullback j).map g = f := by sorry

/-- Morphisms from a permitted test object are equal when their generic restrictions agree. -/
theorem hom_ext (h : NeronMappingProperty j X) (hY : Smooth Y.hom)
    (f g : Y ⟶ X) (e : (Over.pullback j).map f = (Over.pullback j).map g) :
    f = g := by sorry

/-- The mapping property is equivalent to unique extension for every smooth test object. -/
theorem iff_existsUnique : NeronMappingProperty j X ↔
    ∀ Y : Over S, Smooth Y.hom →
      ∀ f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X,
        ∃! g : Y ⟶ X, (Over.pullback j).map g = f := by sorry

/-- An isomorphism of targets preserves the Néron mapping property. -/
theorem of_iso {X' : Over S} (e : X ≅ X') (h : NeronMappingProperty j X) :
    NeronMappingProperty j X' := by sorry

/-- A generically identity endomorphism of a smooth object with the mapping property is the identity. -/
theorem identityRestriction (h : NeronMappingProperty j X) (hX : Smooth X.hom)
    (f : X ⟶ X) (e : (Over.pullback j).map f = 𝟙 _) : f = 𝟙 X := by sorry

/-- A smooth test object with noninjective restriction refutes the mapping property. -/
theorem not_of_restriction_not_injective (hY : Smooth Y.hom)
    (h : ¬ Function.Injective (fun f : Y ⟶ X => (Over.pullback j).map f)) :
    ¬ NeronMappingProperty j X := by sorry

/-- A smooth test object with nonsurjective restriction refutes the mapping property. -/
theorem not_of_restriction_not_surjective (hY : Smooth Y.hom)
    (h : ¬ Function.Surjective (fun f : Y ⟶ X => (Over.pullback j).map f)) :
    ¬ NeronMappingProperty j X := by sorry

/-- One non-extendible map from a smooth test object refutes the mapping property. -/
example (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X)
    (h : ∀ g : Y ⟶ X, (Over.pullback j).map g ≠ f) :
    ¬ NeronMappingProperty j X := by sorry

/-- For smooth `X`, a generically trivial endomorphism is the identity. -/
example (h : NeronMappingProperty j X) (hX : Smooth X.hom)
    (f : X ⟶ X) (e : (Over.pullback j).map f = 𝟙 _) : f = 𝟙 X := by sorry

/-- For `j = 𝟙 S` every object has the mapping property: the degenerate case carries no
arithmetic content. -/
example (X : Over S) : NeronMappingProperty (𝟙 S) X := by sorry

end NeronMappingProperty

/-- A marked finite-type Néron model of `A` over `η`: a smooth, separated, quasi-compact object of
`Over S` with the Néron mapping property and a chosen isomorphism of its generic fibre with `A`.
Smoothness gives locally finite presentation; quasi-compactness enforces finite type
(Bosch–Lütkebohmert–Raynaud, §1.2 Definition 1 and Proposition 2). -/
structure NeronModel (A : Over η) where
  /-- The model, an object of `Over S`. -/
  model : Over S
  /-- The marking: the generic fibre of the model is `A`. -/
  genericIso : (Over.pullback j).obj model ≅ A
  smooth : Smooth model.hom
  separated : IsSeparated model.hom
  quasiCompact : QuasiCompact model.hom
  mapping : NeronMappingProperty j model

namespace NeronModel

variable {j} {A : Over η} (M : NeronModel j A)

/-- The structure morphism of a marked model is smooth. -/
theorem smooth_model : Smooth M.model.hom := by sorry

/-- The structure morphism of a marked model is separated. -/
theorem separated_model : IsSeparated M.model.hom := by sorry

/-- The structure morphism of a marked model is quasi-compact. -/
theorem quasiCompact_model : QuasiCompact M.model.hom := by sorry

/-- A marked Néron model satisfies the full smooth-test mapping property. -/
theorem mappingProperty : NeronMappingProperty j M.model := by sorry

/-- The marking followed by its inverse is the identity of the generic model. -/
theorem generic_hom_inv : M.genericIso.hom ≫ M.genericIso.inv = 𝟙 _ := by sorry

/-- The inverse marking followed by the marking is the identity of the given generic object. -/
theorem generic_inv_hom : M.genericIso.inv ≫ M.genericIso.hom = 𝟙 _ := by sorry

/-- Morphisms from a permitted test object are equal when their generic restrictions agree. -/
theorem hom_ext (Y : Over S) (hY : Smooth Y.hom) (f g : Y ⟶ M.model)
    (e : (Over.pullback j).map f ≫ M.genericIso.hom =
      (Over.pullback j).map g ≫ M.genericIso.hom) : f = g := by sorry

/-- A map to the marked generic object extends uniquely from any smooth test object. -/
theorem extension_existsUnique (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ M.model, (Over.pullback j).map g ≫ M.genericIso.hom = f := by sorry

/-- The forward morphism of the marking is an isomorphism. -/
theorem genericIso_isIso : IsIso M.genericIso.hom := by sorry

/-- An endomorphism preserving the marking is the identity. -/
theorem identity_unique (f : M.model ⟶ M.model)
    (h : (Over.pullback j).map f ≫ M.genericIso.hom = M.genericIso.hom) :
    f = 𝟙 M.model := by sorry

/-- The model is smooth, separated and quasi-compact at once. -/
example : Smooth M.model.hom ∧ IsSeparated M.model.hom ∧
    QuasiCompact M.model.hom := by sorry

/-- Two endomorphisms of the model with equal generic restrictions are equal. -/
example (f g : M.model ⟶ M.model)
    (e : (Over.pullback j).map f = (Over.pullback j).map g) : f = g := by sorry

/-- The marking composed with its inverse is the identity. -/
example : M.genericIso.hom ≫ M.genericIso.inv = 𝟙 _ := by sorry

/-- The morphism-valued extension supplied by the mapping property: the unique `Y ⟶ M` whose
marked generic restriction is `f` (Bosch–Lütkebohmert–Raynaud, §1.2 Proposition 2). -/
noncomputable def extend (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) : Y ⟶ M.model :=
  Classical.choose (ExistsUnique.exists (M.extension_existsUnique Y hY f))

/-- The marked generic restriction of the chosen extension is the given morphism. -/
theorem extend_restrict (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    (Over.pullback j).map (M.extend Y hY f) ≫ M.genericIso.hom = f := by sorry

/-- Any morphism with the prescribed marked restriction is the chosen extension. -/
theorem extend_unique (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) (g : Y ⟶ M.model)
    (h : (Over.pullback j).map g ≫ M.genericIso.hom = f) :
    g = M.extend Y hY f := by sorry

/-- Extending the marked restriction of an existing morphism returns that morphism. -/
theorem extend_map (Y : Over S) (hY : Smooth Y.hom) (f : Y ⟶ M.model) :
    M.extend Y hY ((Over.pullback j).map f ≫ M.genericIso.hom) = f := by sorry

/-- Extending the model’s own marking returns its identity. -/
theorem extend_identity :
    M.extend M.model M.smooth M.genericIso.hom = 𝟙 M.model := by sorry

/-- Extension commutes with precomposition by a morphism between smooth test objects. -/
theorem extend_precomp (Y Z : Over S) (hY : Smooth Y.hom) (hZ : Smooth Z.hom)
    (g : Z ⟶ Y) (f : (Over.pullback j).obj Y ⟶ A) :
    M.extend Z hZ ((Over.pullback j).map g ≫ f) = g ≫ M.extend Y hY f := by sorry

/-- The chosen extension is independent of the proof of smoothness. -/
theorem extend_proof_irrel (Y : Over S) (hY hY' : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) : M.extend Y hY f = M.extend Y hY' f := by sorry

/-- The canonical map from another marked model respects both markings. -/
theorem extend_to_model (N : NeronModel j A) :
    (Over.pullback j).map (M.extend N.model N.smooth N.genericIso.hom) ≫
      M.genericIso.hom = N.genericIso.hom := by sorry

/-- The composite of canonical maps of marked models is the canonical map. -/
theorem extend_comp_model (N P : NeronModel j A) :
    N.extend P.model P.smooth P.genericIso.hom ≫
      M.extend N.model N.smooth N.genericIso.hom =
      M.extend P.model P.smooth P.genericIso.hom := by sorry

/-- The two canonical maps between marked models compose to the identity. -/
theorem extend_inverse_model (N : NeronModel j A) :
    M.extend N.model N.smooth N.genericIso.hom ≫
      N.extend M.model M.smooth M.genericIso.hom = 𝟙 N.model := by sorry

/-- The canonical map between two marked Néron models is an isomorphism. -/
theorem extend_isIso (N : NeronModel j A) :
    IsIso (M.extend N.model N.smooth N.genericIso.hom) := by sorry

/-- Extending the marking of the model itself returns the identity. -/
example : M.extend M.model M.smooth M.genericIso.hom = 𝟙 M.model := by sorry

/-- The two canonical extensions between two marked models compose to the identity. -/
example (N : NeronModel j A) :
    M.extend N.model N.smooth N.genericIso.hom ≫
      N.extend M.model M.smooth M.genericIso.hom = 𝟙 N.model := by sorry

/-- The extension of a generic test map has exactly that marked restriction. -/
example (Y : Over S) (hY : Smooth Y.hom) (f : (Over.pullback j).obj Y ⟶ A) :
    (Over.pullback j).map (M.extend Y hY f) ≫ M.genericIso.hom = f := by sorry

/-- Uniqueness of marked Néron models: between two marked models of the same `A` there is exactly
one isomorphism compatible with the markings (Bosch–Lütkebohmert–Raynaud, §1.2 Proposition 2(a)). -/
theorem unique_iso (N : NeronModel j A) :
    ∃! e : M.model ≅ N.model,
      (Over.pullback j).map e.hom ≫ N.genericIso.hom = M.genericIso.hom := by sorry

end NeronModel

/-- A marked weak Néron model: the same carrier, but the extension property is only required for
étale test objects. Weak models need not be unique (Bosch–Lütkebohmert–Raynaud, §1.2
Definition 1 and §1.3). -/
structure WeakNeronModel (A : Over η) where
  model : Over S
  genericIso : (Over.pullback j).obj model ≅ A
  smooth : Smooth model.hom
  separated : IsSeparated model.hom
  quasiCompact : QuasiCompact model.hom
  mapping : ∀ Y : Over S, Etale Y.hom →
    Function.Bijective (fun f : Y ⟶ model => (Over.pullback j).map f)

namespace WeakNeronModel

variable {j} {A : Over η} (W : WeakNeronModel j A)

/-- The structure morphism of a marked model is smooth. -/
theorem smooth_model : Smooth W.model.hom := by sorry

/-- The structure morphism of a marked model is separated. -/
theorem separated_model : IsSeparated W.model.hom := by sorry

/-- The structure morphism of a marked model is quasi-compact. -/
theorem quasiCompact_model : QuasiCompact W.model.hom := by sorry

/-- The marking followed by its inverse is the identity of the generic model. -/
theorem generic_hom_inv : W.genericIso.hom ≫ W.genericIso.inv = 𝟙 _ := by sorry

/-- The inverse marking followed by the marking is the identity of the given generic object. -/
theorem generic_inv_hom : W.genericIso.inv ≫ W.genericIso.hom = 𝟙 _ := by sorry

/-- Generic restriction is bijective on the specified class of test objects. -/
theorem bijective (Y : Over S) (hY : Etale Y.hom) :
    Function.Bijective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry

/-- Generic restriction distinguishes morphisms from a permitted test object. -/
theorem injective (Y : Over S) (hY : Etale Y.hom) :
    Function.Injective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry

/-- Every generic morphism from a permitted test object extends. -/
theorem surjective (Y : Over S) (hY : Etale Y.hom) :
    Function.Surjective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry

/-- A generic morphism from a permitted test object has exactly one extension. -/
theorem existsUnique (Y : Over S) (hY : Etale Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ W.model, (Over.pullback j).map g ≫ W.genericIso.hom = f := by sorry

/-- Morphisms from a permitted test object are equal when their generic restrictions agree. -/
theorem hom_ext (Y : Over S) (hY : Etale Y.hom) (f g : Y ⟶ W.model)
    (e : (Over.pullback j).map f ≫ W.genericIso.hom =
      (Over.pullback j).map g ≫ W.genericIso.hom) : f = g := by sorry

/-- A Néron model is in particular a weak Néron model. -/
noncomputable def ofNeronModel (M : NeronModel j A) : WeakNeronModel j A where
  model := M.model
  genericIso := M.genericIso
  smooth := M.smooth
  separated := M.separated
  quasiCompact := M.quasiCompact
  mapping := sorry

/-- The weak model is smooth, separated and quasi-compact. -/
example : Smooth W.model.hom ∧ IsSeparated W.model.hom ∧
    QuasiCompact W.model.hom := by sorry

/-- A map from an étale generic test object has exactly one marked extension. -/
example (Y : Over S) (hY : Etale Y.hom) (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ W.model, (Over.pullback j).map g ≫ W.genericIso.hom = f := by sorry

/-- For `j = 𝟙 S` every smooth separated quasi-compact object is its own weak model; the degenerate
case says nothing about arithmetic existence. -/
example (X : Over S) (hX : Smooth X.hom) (hsep : IsSeparated X.hom)
    (hqc : QuasiCompact X.hom) : Nonempty (WeakNeronModel (𝟙 S) X) := by sorry

end WeakNeronModel

end Models

/-! ## Layer 2: special fibres and component groups -/

namespace ComponentGroup

/-- The rational component group of a nonsplit multiplicative elliptic curve over a finite residue
field is the fixed subgroup of `−1` on the geometric group `ℤ/n`: it has order `2` for even `n` and
order `1` for odd `n`, never `n` itself (Tate, §6). This is the group-theoretic core of that
computation. -/
theorem card_fixedPoints_neg (n : ℕ) (hn : 0 < n) :
    Nat.card {x : ZMod n // -x = x} = if Even n then 2 else 1 := by sorry

/-- The fixed subgroup of negation on `ℤ/4` has order `2`. -/
example : Nat.card {x : ZMod 4 // -x = x} = 2 := by sorry

/-- The fixed subgroup of negation on `ℤ/5` is trivial. -/
example : Nat.card {x : ZMod 5 // -x = x} = 1 := by sorry

/-- Negation on `ℤ/1` fixes everything: the degenerate case has order `1`, not `0`. -/
example : Nat.card {x : ZMod 1 // -x = x} = 1 := by sorry

/-- Negative control for `0 < n`: `ℤ/0 = ℤ` has one fixed point of negation, while the formula
would give `2` since `0` is even. -/
example : Nat.card {x : ZMod 0 // -x = x} = 1 ∧
    Nat.card {x : ZMod 0 // -x = x} ≠ if Even 0 then 2 else 1 := by sorry

end ComponentGroup

/-! ## Layer 3: semistable reduction and uniformisation -/

namespace RamifiedTate

/-- The canonical map of geometric component groups of a split Tate curve under a base change of
ramification index `e`: on `ℤ/n → ℤ/(e·n)` it is multiplication by `e` (Conrad, Example 4.6). -/
noncomputable def componentMap (n e : ℕ) : ZMod n →+ ZMod (e * n) :=
  ZMod.lift n ⟨zmultiplesHom _ (e : ZMod (e * n)), by sorry⟩

/-- Ramified Tate base change sends the residue class of `r` to that of `e*r`. -/
theorem componentMap_apply (n e : ℕ) (r : ℤ) :
    componentMap n e (r : ZMod n) = ((e * r : ℤ) : ZMod (e * n)) := by sorry

/-- Positive ramification index makes the Tate component map injective, including `n = 0` algebraically. -/
theorem componentMap_injective (n e : ℕ) (he : 0 < e) :
    Function.Injective (componentMap n e) := by sorry

/-- For `n = 1` and `e = 2` the component group grows from the trivial group to `ℤ/2` while the
identity torus is unchanged: full Néron models do not commute with ramified base change. -/
example : Nat.card (ZMod 1) = 1 ∧ Nat.card (ZMod (2 * 1)) = 2 := by sorry

/-- For `e = 1` the component map is the identity. -/
example (n : ℕ) (r : ZMod n) : componentMap n 1 r = (ZMod.castHom (by simp) (ZMod (1 * n))) r := by
  sorry

/-- The component map is never surjective for `e > 1` and `n > 0`. -/
example (n e : ℕ) (hn : 0 < n) (he : 1 < e) : ¬ Function.Surjective (componentMap n e) := by sorry

/-- Negative control for `0 < e`: for `e = 0` the map `ℤ/2 → ℤ/0 = ℤ` is zero, not injective. -/
example : ¬ Function.Injective (componentMap 2 0) := by sorry

end RamifiedTate

/-! ## Layer 4: Picard schemes of semistable curves, character lattices and monodromy -/

namespace DualGraph

variable {V E : Type*} [Fintype V] [Fintype E] [DecidableEq V] [DecidableEq E]

/-- The boundary map `ℤ^E → ℤ^V`, `e ↦ target(e) − source(e)`, of a finite multigraph given by its
source and target maps. Loops and parallel edges are allowed. -/
noncomputable def boundary (src tgt : E → V) : (E →₀ ℤ) →ₗ[ℤ] (V →₀ ℤ) :=
  Finsupp.linearCombination ℤ fun e => Finsupp.single (tgt e) 1 - Finsupp.single (src e) 1

/-- A loop has zero boundary. -/
example : boundary (fun _ : Unit => ()) (fun _ : Unit => ()) (Finsupp.single () 1) = 0 := by
  sorry

/-- An oriented edge has boundary `target - source`; reversing this sign fails the test. -/
example : boundary (fun _ : Unit => (0 : Fin 2)) (fun _ => 1) (Finsupp.single () 1) =
    Finsupp.single 1 1 - Finsupp.single 0 1 := by sorry

/-- Two parallel edges with coefficients `1,-1` cancel at both endpoints. -/
example : boundary (fun _ : Fin 2 => (0 : Fin 2)) (fun _ => 1)
    (Finsupp.single 0 1 - Finsupp.single 1 1) = 0 := by sorry

/-- The cycle lattice `H₁(Γ, ℤ) = ker ∂` of a finite multigraph; it is the character lattice of the
toric part of the generalised Jacobian of a nodal curve with dual graph `Γ`
(SGA 7 I, Exposé IX, 12.3.7). -/
noncomputable def cycleLattice (src tgt : E → V) : Submodule ℤ (E →₀ ℤ) :=
  LinearMap.ker (boundary src tgt)

/-- The edge-length form `(c, d) ↦ ∑_e ℓ(e) c_e d_e` on `ℤ^E`; with all lengths `1` it is the
monodromy pairing of the Jacobian of a regular semistable curve (SGA 7 I, Exposé IX, 12.5). -/
noncomputable def edgeForm (len : E → ℕ) : (E →₀ ℤ) →ₗ[ℤ] (E →₀ ℤ) →ₗ[ℤ] ℤ :=
  LinearMap.mk₂ ℤ (fun c d => ∑ e, (len e : ℤ) * c e * d e) (by sorry) (by sorry) (by sorry)
    (by sorry)

/-- The weighted edge form is symmetric on the edge module. -/
theorem edgeForm_symm (len : E → ℕ) (c d : E →₀ ℤ) :
    edgeForm len c d = edgeForm len d c := by sorry

/-- Reversing the orientation of an edge negates the corresponding coordinate and preserves the
form: the cycle lattice and the pairing do not depend on the chosen orientation. -/
theorem edgeForm_neg_coord (len : E → ℕ) (e₀ : E) (c d : E →₀ ℤ) :
    edgeForm len (c - 2 • Finsupp.single e₀ (c e₀)) (d - 2 • Finsupp.single e₀ (d e₀)) =
      edgeForm len c d := by sorry

/-- A single loop on one vertex has cycle lattice of rank `1`: a loop has zero boundary but
contributes a cycle. -/
example : Module.finrank ℤ (cycleLattice (fun _ : Unit => ()) (fun _ : Unit => ())) = 1 := by
  sorry

/-- Two vertices joined by one edge (a tree) have cycle lattice `0`. -/
example : Module.finrank ℤ (cycleLattice (fun _ : Unit => (0 : Fin 2)) (fun _ => 1)) = 0 := by
  sorry

/-- Two vertices joined by two parallel edges have cycle lattice of rank `1`; a simple graph on the
same vertices would give rank `0`. -/
example : Module.finrank ℤ (cycleLattice (fun _ : Fin 2 => (0 : Fin 2)) (fun _ => 1)) = 1 := by
  sorry

/-- A loop of length `5` gives `5` on its unit cycle and `10` on coefficients `1,2`. -/
example : edgeForm (fun _ : Unit => 5) (Finsupp.single () 1) (Finsupp.single () 1) = 5 ∧
    edgeForm (fun _ : Unit => 5) (Finsupp.single () 1) (Finsupp.single () 2) = 10 := by sorry

/-- A zero edge length makes the form zero, even on a nonzero cycle. -/
example : edgeForm (fun _ : Unit => 0) (Finsupp.single () 1) (Finsupp.single () 1) = 0 := by
  sorry

/-- Opposite coefficients on the two arguments change the sign; simultaneous reversal does not. -/
example : edgeForm (fun _ : Unit => 5) (Finsupp.single () 1) (Finsupp.single () (-1)) = -5 := by
  sorry

/-- The Betti number: for a connected multigraph with nonempty vertex set the cycle lattice has
rank `#E − #V + 1`. -/
theorem finrank_cycleLattice [Nonempty V] (src tgt : E → V)
    (hconn : ∀ v w : V, Relation.ReflTransGen
      (fun a b => ∃ e, (src e = a ∧ tgt e = b) ∨ (src e = b ∧ tgt e = a)) v w) :
    Module.finrank ℤ (cycleLattice src tgt) + Fintype.card V = Fintype.card E + 1 := by sorry

/-- Negative control for connectedness: two vertices and no edge have cycle lattice `0`, and
`0 + 2 ≠ 0 + 1`. -/
example : Module.finrank ℤ (cycleLattice (fun _ : Fin 0 => (0 : Fin 2)) (fun _ => 0)) +
    Fintype.card (Fin 2) ≠ Fintype.card (Fin 0) + 1 := by sorry

end DualGraph

namespace LatticePairing

variable {X Y : Type*} [AddCommGroup X] [AddCommGroup Y] [Module ℤ X] [Module ℤ Y]

/-- The adjoint `u♯ : Y → Hom(X, ℤ)` of an integral pairing `u : Y × X → ℤ`. Here `Y = X_{A^∨}` and `X = X_A`. -/
def adjoint (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ) : Y →ₗ[ℤ] Module.Dual ℤ X := u

/-- The component group attached to an integral pairing: the cokernel of its adjoint. For the
monodromy pairing of a semistable abelian variety over a henselian discrete valuation ring this is
the geometric component group of the Néron model (SGA 7 I, Exposé IX, Theorem 11.5). -/
abbrev componentGroup (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ) :=
  Module.Dual ℤ X ⧸ LinearMap.range (adjoint u)

variable [Module.Free ℤ X] [Module.Finite ℤ X] [Module.Free ℤ Y] [Module.Finite ℤ Y]

/-- The discriminant pairing `coker(u♯) × coker((uᵀ)♯) → ℚ/ℤ` of a nondegenerate integral pairing
of two finite free lattices, with the positive inverse-form convention. The geometric
comparison belongs to README Layer 4; no symmetry of the original pairing is assumed. -/
noncomputable def discriminantPairing (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u)) :
    componentGroup u →+ (componentGroup u.flip →+ AddCircle (1 : ℚ)) := by sorry

/-- The inverse-form pairing vanishes when its first cokernel class is zero. -/
theorem discriminantPairing_zero_left (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u))
    (b : componentGroup u.flip) : discriminantPairing u hinj hfin 0 b = 0 := by sorry

/-- Evaluation on specified quotient representatives pins the positive inverse pairing.
If `u♯ y = m a`, then the value at `[a], [b]` is `b(y)/m` modulo the integers. -/
theorem discriminantPairing_mk (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u))
    (a : Module.Dual ℤ X) (b : Module.Dual ℤ Y) (m : ℤ) (hm : m ≠ 0)
    (y : Y) (hy : adjoint u y = m • a) :
    discriminantPairing u hinj hfin (Submodule.Quotient.mk a) (Submodule.Quotient.mk b) =
      ((b y : ℚ) / m : ℚ) := by sorry

/-- The rank-one pairing `(y, x) ↦ n·x·y` on `ℤ × ℤ`. -/
noncomputable def rankOne (n : ℕ) : ℤ →ₗ[ℤ] ℤ →ₗ[ℤ] ℤ := (n : ℤ) • LinearMap.mul ℤ ℤ

/-- Rank-one evaluation specifies the adjoint: at `n = 5`, `y = 1`, `x = 2` its value is `10`. -/
example : adjoint (rankOne 5) 1 2 = 10 := by sorry

/-- At modulus `1` the adjoint is the identity functional; at modulus `0` it is zero. -/
example (y x : ℤ) : adjoint (rankOne 1) y x = y * x ∧
    adjoint (rankOne 0) y x = 0 := by sorry

/-- For the split Tate curve with `ord(q) = n` the pairing is multiplication by `n` and the
component group is `ℤ/n`. -/
example (n : ℕ) : Nonempty (componentGroup (rankOne n) ≃+ ZMod n) := by sorry

/-- For `n = 1` the component group is trivial. -/
example : Subsingleton (componentGroup (rankOne 1)) := by sorry

/-- Zero lattices (good reduction) give a zero component group, not a group of positive rank. -/
example : Subsingleton (componentGroup (0 : PUnit →ₗ[ℤ] PUnit →ₗ[ℤ] ℤ)) := by sorry

/-- Negative control for nondegeneracy: the zero pairing on `ℤ × ℤ` has cokernel `ℤ`, which is
infinite, so the discriminant pairing needs the finiteness hypothesis. -/
example : ¬ Finite (componentGroup (rankOne 0)) := by sorry

/-- The class of the dual functional `x ↦ r*x` in the first rank-one cokernel. -/
noncomputable def rankOneClass (n : ℕ) (r : ℤ) : componentGroup (rankOne n) :=
  Submodule.Quotient.mk (r • (LinearMap.id : Module.Dual ℤ ℤ))

/-- The same specified functional in the transposed rank-one cokernel. -/
noncomputable def rankOneDualClass (n : ℕ) (s : ℤ) : componentGroup (rankOne n).flip :=
  Submodule.Quotient.mk (s • (LinearMap.id : Module.Dual ℤ ℤ))

/-- The classes are the zero classes at residue `0`. -/
example (n : ℕ) : rankOneClass n 0 = 0 ∧ rankOneDualClass n 0 = 0 := by sorry

/-- Adding the modulus to a representative preserves each class. -/
example (n : ℕ) (r : ℤ) : rankOneClass n (r + n) = rankOneClass n r ∧
    rankOneDualClass n (r + n) = rankOneDualClass n r := by sorry

/-- At modulus `5` the class of `1` is nonzero in either cokernel. -/
example : rankOneClass 5 1 ≠ 0 ∧ rankOneDualClass 5 1 ≠ 0 := by sorry

/-- The value on the specified classes `r, s` is positive `r*s/n` modulo the integers. -/
theorem discriminantPairing_rankOne (n : ℕ) (hn : 0 < n)
    (hinj : Function.Injective (adjoint (rankOne n)))
    (hfin : Finite (componentGroup (rankOne n))) (r s : ℤ) :
    discriminantPairing (rankOne n) hinj hfin (rankOneClass n r) (rankOneDualClass n s) =
      ((r * s : ℚ) / n : ℚ) := by sorry

/-- At modulus `5`, the values at `(1, 1)` and `(1, 2)` are `1/5` and `2/5`; this
distinguishes the positive inverse form from its negative and from the zero pairing. -/
example (hinj : Function.Injective (adjoint (rankOne 5)))
    (hfin : Finite (componentGroup (rankOne 5))) :
    discriminantPairing (rankOne 5) hinj hfin (rankOneClass 5 1) (rankOneDualClass 5 1) =
      (1 / 5 : ℚ) ∧
    discriminantPairing (rankOne 5) hinj hfin (rankOneClass 5 1) (rankOneDualClass 5 2) =
      (2 / 5 : ℚ) := by sorry

/-- Replacing `r` by `r + n` changes `r·s/n` by the integer `s`, so the value in `ℚ/ℤ` is
unchanged. -/
example (n : ℕ) (hn : 0 < n) (r s : ℤ) :
    ((((r + n) * s : ℚ) / n : ℚ) : AddCircle (1 : ℚ)) = (((r * s : ℚ) / n : ℚ) : AddCircle (1 : ℚ)) := by
  sorry

end LatticePairing

-- Tau Ceti's numerical Picard group of a numerical type (components with multiplicities, weights
-- and intersection matrix) and its degree map; the roadmap compares the component group of the
-- Jacobian with the kernel of this degree map and does not redefine the numerical side.
#check @TauCeti.NumericalType.Pic
#check @TauCeti.NumericalType.degree

/-! ## Layer 5: Tate modules, conductors and local factors -/


/-! ## Layer 6: interfaces for modularity and finiteness -/

namespace Interfaces

/-- A `2`-group acting linearly on a nonzero `𝔽₂`-vector space fixes a nonzero vector: the
group-theoretic step of the residual-point export (Boxer–Calegari–Gee–Pilloni 2025, Lemma 9.1.8). -/
theorem exists_ne_zero_fixed_of_two_group {G : Type*} [Group G] [Finite G]
    (hG : ∃ k : ℕ, Nat.card G = 2 ^ k) {M : Type*} [AddCommGroup M] [Module (ZMod 2) M]
    [Module.Finite (ZMod 2) M] [Nontrivial M] (ρ : G →* (M →ₗ[ZMod 2] M)) :
    ∃ v : M, v ≠ 0 ∧ ∀ g, ρ g v = v := by sorry

/-- Negative control for the `2`-group hypothesis: a group of order `3` can permute the three
nonzero vectors of `𝔽₂²` cyclically and fix none of them. -/
example : ∃ ρ : Multiplicative (ZMod 3) →* ((Fin 2 → ZMod 2) →ₗ[ZMod 2] (Fin 2 → ZMod 2)),
    ∀ v : Fin 2 → ZMod 2, v ≠ 0 → ∃ g, ρ g v ≠ v := by sorry

/-- The image of `Gal(K(J[N])/K)` in `GSp_{2g}(ℤ/N)` has order less than `N^{4g²}`: the crude bound
used for the degree of a full-level extension (Yuan, Lemma 4.9). -/
theorem card_lt_of_subgroup_matrix (N g : ℕ) (hN : 1 < N) (hg : 0 < g)
    (H : Subgroup (Matrix (Fin (2 * g)) (Fin (2 * g)) (ZMod N))ˣ) :
    Nat.card H < N ^ (4 * g ^ 2) := by sorry

/-- Dimension zero refutes the strict bound: the group of units of `0×0` matrices has
order `1`, and `N^0 = 1`. -/
example : Nat.card (Matrix (Fin 0) (Fin 0) (ZMod 3))ˣ = 1 ∧
    ¬ Nat.card (Matrix (Fin 0) (Fin 0) (ZMod 3))ˣ < 3 ^ (4 * 0 ^ 2) := by sorry

/-- The finite-group intersection used in the ordinary residual-point theorem: the
centraliser of three disjoint transpositions has order `48`, while its point stabiliser
has order `8` (BCGP 2025, Lemma 9.1.8). -/
example (τ : Equiv.Perm (Fin 6))
    (hτ : τ = Equiv.swap 0 1 * Equiv.swap 2 3 * Equiv.swap 4 5) :
    Nat.card {σ : Equiv.Perm (Fin 6) // σ * τ = τ * σ} = 48 ∧
    Nat.card {σ : Equiv.Perm (Fin 6) // σ * τ = τ * σ ∧ σ 0 = 0} = 8 := by sorry

/-- Coordinate scaling `x = u²x'`, `y = u³y'` multiplies `dx/(2y)` by `u⁻¹`. -/
example (u : ℚ) (hu : u ≠ 0) : u ^ 2 / u ^ 3 = u⁻¹ := by sorry

/-- The two directions at `u = 5` have reciprocal factors, not the same factor. -/
example : (5 : ℚ) ^ 2 / 5 ^ 3 = 1 / 5 ∧ (5 : ℚ) ^ 3 / 5 ^ 2 = 5 := by sorry

end Interfaces

/-!
## Further targets in README.md

Geometric definitions and comparisons are recorded there rather than typed here:
`GoodReduction`, `WeakNeronBlowup`, `DifferentialLattice`, `IdentityComponent`,
the geometric `ComponentGroup`, `Chevalley`, `ToricCharacter`,
`SemistableReduction` and `henselization_iff`, `RaynaudExtensionComparison`,
`PolarizedUniformization`, `PicardZero`,
`IntegralMonodromyPairing`, `ComponentPairing`, `RegularPicardNeronQuotient`,
`BgwNodalPinch`, `BgwGeneralizedJacobian`, `BgwOddFactorTorsors`, `StableFamilyPicard`,
`B_cris`, `B_st`, `D_cris`, `D_st`, `D_dR`, the crystalline, semistable and de Rham predicates,
the `PeriodRealization` API and `AbelianVariety.deRham`, and `SemistableOrdinaryAdapter`.
Their geometric Checks are likewise in README.md.

The corresponding untyped theorems include `GroupLaw`, `Smoothening`, `LocalExistence`,
`AbelianSchemeModel`, `SpreadAbelian`, `DedekindGluing`, `EtaleBasechange`,
`JacobianIsogenyFactor`, `FiniteSeparableSemistableExtension`, `MonodromyCriterion`,
`GraphMonodromy`, `ComponentCokernel`, `IntersectionComponentQuotient`, the Picard–Néron
comparison, Néron–Ogg–Shafarevich, `PadicComparison`, conductor and local-factor comparisons,
and the geometric exports of Layer 6. The signed comparisons of `IntegralMonodromyPairing`
and `ComponentPairing` remain explicit gaps in README 4.3 and 4.6.
-/

end TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties
