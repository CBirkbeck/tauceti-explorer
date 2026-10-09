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
* The lattice-level part of the monodromy theory (character lattices, the integral monodromy
  pairing, its cokernel and discriminant pairing, the cycle lattice of a dual multigraph and the
  intersection-matrix quotient) is stated over `ℤ` with no geometric carrier, so that the
  arithmetic computations of the roadmap's checks are already meaningful.
* The intersection-matrix description of the component group of a Jacobian is stated against Tau
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

theorem bijective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Bijective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry

theorem injective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Injective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry

theorem surjective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Surjective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry

theorem existsUnique (h : NeronMappingProperty j X) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X) :
    ∃! g : Y ⟶ X, (Over.pullback j).map g = f := by sorry

theorem hom_ext (h : NeronMappingProperty j X) (hY : Smooth Y.hom)
    (f g : Y ⟶ X) (e : (Over.pullback j).map f = (Over.pullback j).map g) :
    f = g := by sorry

theorem iff_existsUnique : NeronMappingProperty j X ↔
    ∀ Y : Over S, Smooth Y.hom →
      ∀ f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X,
        ∃! g : Y ⟶ X, (Over.pullback j).map g = f := by sorry

theorem of_iso {X' : Over S} (e : X ≅ X') (h : NeronMappingProperty j X) :
    NeronMappingProperty j X' := by sorry

theorem identityRestriction (h : NeronMappingProperty j X) (hX : Smooth X.hom)
    (f : X ⟶ X) (e : (Over.pullback j).map f = 𝟙 _) : f = 𝟙 X := by sorry

theorem not_of_restriction_not_injective (hY : Smooth Y.hom)
    (h : ¬ Function.Injective (fun f : Y ⟶ X => (Over.pullback j).map f)) :
    ¬ NeronMappingProperty j X := by sorry

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

theorem smooth_model : Smooth M.model.hom := by sorry

theorem separated_model : IsSeparated M.model.hom := by sorry

theorem quasiCompact_model : QuasiCompact M.model.hom := by sorry

theorem mappingProperty : NeronMappingProperty j M.model := by sorry

theorem generic_hom_inv : M.genericIso.hom ≫ M.genericIso.inv = 𝟙 _ := by sorry

theorem generic_inv_hom : M.genericIso.inv ≫ M.genericIso.hom = 𝟙 _ := by sorry

theorem hom_ext (Y : Over S) (hY : Smooth Y.hom) (f g : Y ⟶ M.model)
    (e : (Over.pullback j).map f ≫ M.genericIso.hom =
      (Over.pullback j).map g ≫ M.genericIso.hom) : f = g := by sorry

theorem extension_existsUnique (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ M.model, (Over.pullback j).map g ≫ M.genericIso.hom = f := by sorry

theorem genericIso_isIso : IsIso M.genericIso.hom := by sorry

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

theorem extend_restrict (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    (Over.pullback j).map (M.extend Y hY f) ≫ M.genericIso.hom = f := by sorry

theorem extend_unique (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) (g : Y ⟶ M.model)
    (h : (Over.pullback j).map g ≫ M.genericIso.hom = f) :
    g = M.extend Y hY f := by sorry

theorem extend_map (Y : Over S) (hY : Smooth Y.hom) (f : Y ⟶ M.model) :
    M.extend Y hY ((Over.pullback j).map f ≫ M.genericIso.hom) = f := by sorry

theorem extend_identity :
    M.extend M.model M.smooth M.genericIso.hom = 𝟙 M.model := by sorry

theorem extend_precomp (Y Z : Over S) (hY : Smooth Y.hom) (hZ : Smooth Z.hom)
    (g : Z ⟶ Y) (f : (Over.pullback j).obj Y ⟶ A) :
    M.extend Z hZ ((Over.pullback j).map g ≫ f) = g ≫ M.extend Y hY f := by sorry

theorem extend_proof_irrel (Y : Over S) (hY hY' : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) : M.extend Y hY f = M.extend Y hY' f := by sorry

theorem extend_to_model (N : NeronModel j A) :
    (Over.pullback j).map (M.extend N.model N.smooth N.genericIso.hom) ≫
      M.genericIso.hom = N.genericIso.hom := by sorry

theorem extend_comp_model (N P : NeronModel j A) :
    N.extend P.model P.smooth P.genericIso.hom ≫
      M.extend N.model N.smooth N.genericIso.hom =
      M.extend P.model P.smooth P.genericIso.hom := by sorry

theorem extend_inverse_model (N : NeronModel j A) :
    M.extend N.model N.smooth N.genericIso.hom ≫
      N.extend M.model M.smooth M.genericIso.hom = 𝟙 N.model := by sorry

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

theorem smooth_model : Smooth W.model.hom := by sorry

theorem separated_model : IsSeparated W.model.hom := by sorry

theorem quasiCompact_model : QuasiCompact W.model.hom := by sorry

theorem generic_hom_inv : W.genericIso.hom ≫ W.genericIso.inv = 𝟙 _ := by sorry

theorem generic_inv_hom : W.genericIso.inv ≫ W.genericIso.hom = 𝟙 _ := by sorry

theorem bijective (Y : Over S) (hY : Etale Y.hom) :
    Function.Bijective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry

theorem injective (Y : Over S) (hY : Etale Y.hom) :
    Function.Injective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry

theorem surjective (Y : Over S) (hY : Etale Y.hom) :
    Function.Surjective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry

theorem existsUnique (Y : Over S) (hY : Etale Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ W.model, (Over.pullback j).map g ≫ W.genericIso.hom = f := by sorry

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

theorem componentMap_apply (n e : ℕ) (r : ℤ) :
    componentMap n e (r : ZMod n) = ((e * r : ℤ) : ZMod (e * n)) := by sorry

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

/-- The adjoint `u♯ : Y → Hom(X, ℤ)` of an integral pairing `u : Y × X → ℤ`. -/
def adjoint (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ) : Y →ₗ[ℤ] Module.Dual ℤ X := u

/-- The component group attached to an integral pairing: the cokernel of its adjoint. For the
monodromy pairing of a semistable abelian variety over a henselian discrete valuation ring this is
the geometric component group of the Néron model (SGA 7 I, Exposé IX, Theorem 11.5). -/
abbrev componentGroup (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ) :=
  Module.Dual ℤ X ⧸ LinearMap.range (adjoint u)

/-- The discriminant pairing `coker(u♯) × coker((uᵀ)♯) → ℚ/ℤ` of a nondegenerate integral pairing
of finite free lattices. For the monodromy pairing it is Grothendieck's pairing on component
groups (SGA 7 I, Exposé IX, §1.2 and Theorem 11.5). -/
noncomputable def discriminantPairing (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u)) :
    componentGroup u →+ (componentGroup u.flip →+ AddCircle (1 : ℚ)) := by sorry

theorem discriminantPairing_zero_left (u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ)
    (hinj : Function.Injective (adjoint u)) (hfin : Finite (componentGroup u))
    (b : componentGroup u.flip) : discriminantPairing u hinj hfin 0 b = 0 := by sorry

/-- The rank-one pairing `(y, x) ↦ n·x·y` on `ℤ × ℤ`. -/
noncomputable def rankOne (n : ℕ) : ℤ →ₗ[ℤ] ℤ →ₗ[ℤ] ℤ := (n : ℤ) • LinearMap.mul ℤ ℤ

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

/-- The pairing of residue classes `r, s` in `ℤ/n` is `r·s/n` modulo `ℤ`, up to the fixed sign
convention. -/
example (n : ℕ) (hn : 0 < n) (r s : ℤ) :
    ∃ (hinj : Function.Injective (adjoint (rankOne n))) (hfin : Finite (componentGroup (rankOne n)))
      (a : componentGroup (rankOne n)) (b : componentGroup (rankOne n).flip),
      discriminantPairing (rankOne n) hinj hfin a b = ((r * s : ℚ) / n : ℚ) := by sorry

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

-- The conductor and the local Euler factor of an abelian variety are defined by
-- ArithmeticGaloisRepresentations (R01.2, R01.3, R01.6); this roadmap states their values for
-- semistable varieties and their ℓ-independence through the Raynaud extension, and types none of
-- it here: the Tate module of an abelian variety with its inertia action is not pinned.

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
theorem card_lt_of_subgroup_matrix (N g : ℕ) (hN : 1 < N)
    (H : Subgroup (Matrix (Fin (2 * g)) (Fin (2 * g)) (ZMod N))ˣ) :
    Nat.card H < N ^ (4 * g ^ 2) + 1 := by sorry

end Interfaces

/-!
## Statements not typed at the pinned libraries

The following targets of `README.md` have no signature in this file because their carriers
(abelian schemes over a Dedekind base, smooth group schemes over a discrete valuation ring and
their identity components, tori and character lattices with Galois action, Tate modules of abelian
varieties with inertia action, formal completions and Raynaud extensions, relative Picard
functors of semistable curves, Artin and Swan conductors, period rings) are not available in the
pinned Mathlib and Tau Ceti: the group law on a Néron model and the extension of homomorphisms;
weak-model smoothening and local existence over an excellent discrete valuation ring; spreading
out and the Dedekind local-to-global construction; étale base change; the invariant-differential
lattice; the identity component, the component group, the Chevalley decomposition and the toric
character lattice; isogeny functoriality; the elliptic reduction filtration, the smooth locus of
the minimal regular model, the geometric Kodaira configurations and their component groups; the
semistable reduction predicate and its isogeny and base-change properties; the toric–finite Tate
filtration, Weil orthogonality, unipotence of inertia, the monodromy criterion, semistable
reduction after a finite extension and the full-level criterion; the Raynaud extension and the
polarised uniformisation; the degree-zero Picard scheme of a semistable curve, the normalisation
sequence, the Picard–Néron identity comparison, the geometric monodromy pairing and the
intersection-matrix comparison with the actual Jacobian; the one-node hyperelliptic curve, its
generalised Jacobian, two-torsion and odd-factor torsors; the stable-family Picard and Hodge
comparison; Néron–Ogg–Shafarevich, isogeny invariance of good reduction, the p-adic comparisons,
the conductor interface, the semistable conductor formula, the Galois-theoretic Euler polynomial
and the residual conductor; and the Layer 6 exports.
-/

end TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties
