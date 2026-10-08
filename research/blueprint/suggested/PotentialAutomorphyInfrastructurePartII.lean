/-
# Suggested Lean forms: Reusable infrastructure for potential automorphy over CM fields, Part II
## Polarized automorphy lifting and finiteness of deformation rings, layers PL.0–PL.9

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/PotentialAutomorphyInfrastructurePartII.md` is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry`, and so is every piece of data whose construction is a target of
this roadmap or of the roadmap that owns it. Nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The file imports Mathlib only: the Tau Ceti modules at
the pin contain none of the objects used here.

**How the file is built.**

* Mathlib's own objects are used wherever the pin has them: `Field.absoluteGaloisGroup` with its
  Krull topology, `IsNonarchimedeanLocalField` with `𝒪[K]` and `𝓀[K]`, `NumberField.IsCMField`,
  `NumberField.IsTotallyReal`, continuous homomorphisms `→ₜ*` into `GL (Fin n) E`,
  `Ideal.minimalPrimes`, `ringKrullDim`, `Representation.ind`, power series rings. A finite coefficient
  field `E` is used for lattices in `𝒪[E]` and residual representations in `𝓀[E]`.
  Realizing Q̄_l-valued automorphic and auxiliary data over E requires explicit enlargement;
  the total fixed-E imported interfaces below do not yet supply that input. A finite place of a number field with its
  completion is a `Place`: a local field with a dense embedding of the number field.
* The section "Imported interfaces", and the blocks "Imported interfaces used by PL.N" at the head
  of each layer, hold what other roadmaps own and this one consumes. Each declaration there is an
  opaque `def` of a type or a function with body `sorry`, and its docstring names the owner (roadmap
  and layer or node). A property owned elsewhere is an `Imported`: the owner's type of the objects
  that have the property, with its forgetful map; `P.Holds a` says that `a` has it. No `Prop` is
  defined by `sorry`, no structure has a `Prop`-valued placeholder field, and no statement is
  `True`.
* Everything this roadmap defines as a predicate is a real definition over Mathlib and those
  interfaces: ordinary of weight `λ`, the automorphy notions, connection and strong connection,
  potential diagonalizability, Taylor–Wiles data, strong residual oddness, Schur, primitive and
  strongly primitive representations, connectedness dimension and arithmetic rank, generic primes,
  generic Weil–Deligne representations, rigidity. Rings, modules and operators that this roadmap
  constructs (algebraic modular forms, Hecke algebras, the determinant subring, the semistable
  pseudodeformation rings) are given by their signatures.
* Each node of the packet has a section headed by its id. A definition or construction is followed
  by its API items, under the packet's names, and by its unit tests as `example`s, each preceded by
  `-- test: <name>`. The theorem signatures use the arithmetic objects of their nodes, with one declaration per
  part where appropriate. The unresolved interfaces listed here and in the review mean that
  not every proposed signature is yet a faithful realization of its packet statement.

**What the file leaves out or states differently.** The problem `D_C` of PL.1/connects-relation
(`componentDeformationProblem`) is given for `l ≠ p`; its form for `l = p`, on components of the
semistable lifting rings of fixed Hodge type, is not. Part (d) of
PL.2/ordinary-forms-free-over-lambda has no Lean form: the deformation data of Newton–Thorne 2021
§6 are not a definition node of the packet. In PL.8/pseudodeformation-tangent-comparison the
`Gal(F/F⁺)`-equivariance of the trace map modulo `ϖ^m` and the input Proposition 2.7 of
Newton–Thorne 2023 are not stated. In PL.9/generic-local-domain-lifting the Hodge–Tate weights are
written in the convention of this file, `HT(ε) = {-1}`, where the source normalises `ε` to have
weight `1`; the labelled weight, polynomial and K-type conversion remains unresolved. PL.9/generic-change-of-weight-lifting uses `Lifting.definiteUnitaryAutomorphic`, a
stand-in without an owner in the atlas; it belongs to the roadmap's gap on the generic Serre weight
theorem. Where a hypothesis was added to make a statement well formed (the coefficient field large
enough, `Fact l.Prime`, characteristic zero), the docstring says so.

The file elaborates at the pinned Mathlib with `declaration uses 'sorry'` as its only warning.
-/
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.GroupTheory.Abelianization.Defs
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.RepresentationTheory.Induced
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Intertwining
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Ideal.MinimalPrime.Basic
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Nilpotent.Defs
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.Field.ZMod
import Mathlib.Analysis.Complex.Basic
import Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.RingTheory.PowerSeries.NoZeroDivisors
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.Algebra.DualNumber
import Mathlib.Topology.Instances.TrivSqZeroExt

set_option autoImplicit false

noncomputable section

open ValuativeRel NumberField Matrix

namespace TauCeti.Automorphy

/-! ## Conventions

* `Gal K` is Mathlib's absolute Galois group `Field.absoluteGaloisGroup K` with its Krull topology.
* A `p`-adic local field is a `K` with `[IsNonarchimedeanLocalField K]`; `𝒪[K]` is its ring of
  integers and `𝓀[K]` its residue field.
* The coefficient field `E` is an `l`-adic local field, taken large enough to contain the image of
  every embedding of the number fields in play, as in Thorne's papers. Statements the sources make
  over `Q̄_l` are stated over such an `E`. Lattices are `𝒪[E]`-valued and residual representations
  `𝓀[E]`-valued.
* `Art_K` sends uniformizers to geometric Frobenius elements, so `HT(ε_l) = {-1}`.
-/

/-- The absolute Galois group `G_K`. -/
abbrev Gal (K : Type*) [Field K] := Field.absoluteGaloisGroup K

/-- `K` has residue characteristic `l`: `l` is a prime that is not a unit of `𝒪[K]`. -/
class ResChar (K : Type*) [Field K] [ValuativeRel K] (l : outParam ℕ) : Prop where
  prime : l.Prime
  lt_one : (l : K) <ᵥ 1

/-- `E` contains the image of every embedding of `F` into an algebraic closure of `E`. -/
class IsLargeFor (F E : Type*) [Field F] [NumberField F] [Field E] : Prop where
  card_embeddings : Nat.card (F →+* E) = Module.finrank ℚ F

/-- A finite place of `F` with its completion: a local field `Fv` with a dense embedding of `F`. -/
structure Place (F : Type) [Field F] where
  /-- The completion `F_v`. -/
  Fv : Type
  [field : Field Fv]
  [valRel : ValuativeRel Fv]
  [top : TopologicalSpace Fv]
  [localField : IsNonarchimedeanLocalField Fv]
  /-- The embedding `F → F_v`. -/
  emb : F →+* Fv
  dense : DenseRange emb

attribute [instance] Place.field Place.valRel Place.top Place.localField

namespace Place

variable {F : Type} [Field F]

/-- `v` lies above the rational prime `l`. -/
def Above (v : Place F) (l : ℕ) : Prop := (l : v.Fv) <ᵥ 1

/-- The decomposition map `G_{F_v} → G_F` (Mathlib's `absoluteGaloisGroup.map`). -/
def dec (v : Place F) : Gal v.Fv →ₜ* Gal F := Field.absoluteGaloisGroup.map v.emb

/-- The cardinality `Nv` of the residue field. -/
def norm (v : Place F) : ℕ := Nat.card 𝓀[v.Fv]

/-- Two completions represent the same place of `F`. A `Place` is a completion, so a place of `F`
has many representatives; a finite set of places is a finite set of representatives, and
"every place above `l` is in `S`" is stated up to this equivalence. -/
def IsEquivTo (v w : Place F) : Prop :=
  ∃ e : v.Fv ≃+* w.Fv, (e : v.Fv →+* w.Fv).comp v.emb = w.emb

end Place

/-- Restriction of a continuous homomorphism of `G_F` to a place. -/
def resPlace {F : Type} [Field F] {H : Type*} [Monoid H] [TopologicalSpace H]
    (ρ : Gal F →ₜ* H) (v : Place F) : Gal v.Fv →ₜ* H := ρ.comp v.dec

/-- Restriction of a continuous homomorphism of `G_K` along a field embedding `K → K'`. -/
def resField {K K' : Type*} [Field K] [Field K'] {H : Type*} [Monoid H] [TopologicalSpace H]
    (ρ : Gal K →ₜ* H) (f : K →+* K') : Gal K' →ₜ* H :=
  ρ.comp (Field.absoluteGaloisGroup.map f)

/-- Two representations are conjugate under `GL_n(A)`. -/
def Conj {G A : Type*} [Monoid G] [CommRing A] {n : ℕ} (ρ₁ ρ₂ : G → GL (Fin n) A) : Prop :=
  ∃ g : GL (Fin n) A, ∀ σ, ρ₁ σ = g * ρ₂ σ * g⁻¹

/-- A representation into `GL_n` of a field is upper triangular with diagonal characters `ψ`:
`ψ 0` acts on the invariant line. -/
def IsUpperTriangularWith {G E : Type*} [Monoid G] [Field E] {n : ℕ}
    (ρ : G → GL (Fin n) E) (ψ : Fin n → G → Eˣ) : Prop :=
  ∀ σ, (∀ i j, j < i → (ρ σ : Matrix (Fin n) (Fin n) E) i j = 0) ∧
    ∀ i, (ρ σ : Matrix (Fin n) (Fin n) E) i i = ψ i σ

/-- The one-dimensional representation of a character. -/
def charRep {G E : Type*} [Monoid G] [TopologicalSpace G] [Field E] [TopologicalSpace E]
    (ψ : G →ₜ* Eˣ) : G →ₜ* GL (Fin 1) E where
  toFun σ := ⟨Matrix.of fun _ _ => (ψ σ : E), Matrix.of fun _ _ => ((ψ σ)⁻¹ : Eˣ), by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry
  continuous_toFun := by sorry

/-- Reduction modulo the maximal ideal of a lattice-valued representation. -/
def reduction {G E : Type*} [Monoid G] [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] {n : ℕ} (ρ : G →* GL (Fin n) 𝒪[E]) : G →* GL (Fin n) 𝓀[E] :=
  (Matrix.GeneralLinearGroup.map (IsLocalRing.residue 𝒪[E])).comp ρ

/-- The representation over `E` of a lattice-valued representation. -/
def generic {G E : Type*} [Monoid G] [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] {n : ℕ} (ρ : G →* GL (Fin n) 𝒪[E]) : G →* GL (Fin n) E :=
  (Matrix.GeneralLinearGroup.map (algebraMap 𝒪[E] E)).comp ρ

/-! ## Imported interfaces

Nothing in this section is planned by this roadmap. Each declaration stands in for an object that
another roadmap, named in its docstring, owns; the owner's definition governs. An object enters as
an opaque `def` of a type or a function whose body is `sorry`. A *property* owned elsewhere enters
as an `Imported`: the owner's type of the objects that have the property, with its forgetful map.
No `Prop` is defined by `sorry`, and no structure has a `Prop`-valued placeholder field. -/

/-- An imported property of the elements of `α`: the owner's type of the elements having it, and
the forgetful map. -/
structure Imported (α : Type*) where
  /-- The owner's type of objects with the property. -/
  Carrier : Type
  /-- The forgetful map. -/
  forget : Carrier → α

/-- `a` has the imported property `P`. -/
def Imported.Holds {α : Type*} (P : Imported α) (a : α) : Prop := a ∈ Set.range P.forget

section LocalInterfaces

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- ArithmeticGaloisRepresentations R01.1 (stand-in): the inertia subgroup `I_K ⊂ G_K`. -/
def inertia : Subgroup (Gal K) := sorry

/-- ArithmeticGaloisRepresentations R01.1 (stand-in): a geometric Frobenius element of `G_K`. Only
its image in `G_K / I_K` is canonical. -/
def geomFrob : Gal K := sorry

/-- Tau Ceti ClassFieldTheory (stand-in): the local Artin map `K^× → G_K^{ab}`, sending
uniformizers to geometric Frobenius elements. -/
def artin : Kˣ →* Abelianization (Gal K) := sorry

/-- Mathlib's cyclotomic character, valued in `E^×` (stand-in for the composite of
`cyclotomicCharacter` with `ℤ_l^× → E^×`, `l` the residue characteristic of `E`). -/
def cyclo (F : Type*) [Field F] : Gal F →ₜ* Eˣ := sorry

variable {K E}

/-- `ψ ∘ Art_K : K^× → E^×` for a character `ψ` of `G_K`. -/
def artinChar (ψ : Gal K →ₜ* Eˣ) : Kˣ →* Eˣ :=
  (Abelianization.lift ψ.toMonoidHom).comp (artin K)

/-- A representation of `G_K` is unramified. -/
def IsUnramified {H : Type*} [Group H] (ρ : Gal K →* H) : Prop := inertia K ≤ ρ.ker

variable (K E)

/-- PadicHodgeTheory R06.2 (stand-in): the de Rham representations of `G_K` on `E^n`
(`K` and `E` of the same residue characteristic). -/
def deRham (n : ℕ) : Imported (Gal K →ₜ* GL (Fin n) E) := sorry

/-- PadicHodgeTheory R06.2 (stand-in): the semistable representations. -/
def semistable (n : ℕ) : Imported (Gal K →ₜ* GL (Fin n) E) := sorry

/-- PadicHodgeTheory R06.2 (stand-in): the crystalline representations. -/
def crystalline (n : ℕ) : Imported (Gal K →ₜ* GL (Fin n) E) := sorry

variable {K E}

/-- PadicHodgeTheory R06.2 (stand-in): the labelled Hodge–Tate weights `HT_τ(ρ)` of a de Rham
representation, with `HT(ε_l) = {-1}`. -/
def hodgeTate {n : ℕ} (ρ : (deRham K E n).Carrier) (τ : K →+* E) : Multiset ℤ := sorry

/-- `ρ` is de Rham with labelled Hodge–Tate weights `H`. -/
def HasHodgeTate {n : ℕ} (ρ : Gal K →ₜ* GL (Fin n) E) (H : (K →+* E) → Multiset ℤ) : Prop :=
  ∃ ρ' : (deRham K E n).Carrier, (deRham K E n).forget ρ' = ρ ∧ ∀ τ, hodgeTate ρ' τ = H τ

/-- `ρ` becomes crystalline over a finite extension of `K`. -/
def IsPotentiallyCrystalline {n : ℕ} (ρ : Gal K →ₜ* GL (Fin n) E) : Prop :=
  ∃ (K' : Type) (_ : Field K') (_ : ValuativeRel K') (_ : TopologicalSpace K')
    (_ : IsNonarchimedeanLocalField K') (f : K →+* K'),
    (crystalline K' E n).Holds (resField ρ f)

/-- SmoothRepresentationsOfLocalGroups SR.1 (stand-in): irreducible smooth representations of
`GL_n(K)` over `ℂ`. -/
def SmoothIrrep (K : Type) [Field K] (n : ℕ) : Type := sorry

variable (K E)

/-- SmoothRepresentationsOfLocalGroups SR.1 (stand-in): the unramified ones. -/
def unramifiedIrrep (n : ℕ) : Imported (SmoothIrrep K n) := sorry

/-- SmoothRepresentationsOfLocalGroups SR.1 (stand-in): the generic ones. -/
def genericIrrep (n : ℕ) : Imported (SmoothIrrep K n) := sorry

/-- SmoothRepresentationsOfLocalGroups SR.1 (stand-in): the supercuspidal ones. -/
def supercuspidalIrrep (n : ℕ) : Imported (SmoothIrrep K n) := sorry

/-- SmoothRepresentationsOfLocalGroups SR.1 (stand-in): the twists of the Steinberg
representation by unramified characters. -/
def steinbergTwist (n : ℕ) : Imported (SmoothIrrep K n) := sorry

/-- LocalGaloisDeformationRings R08.1 (stand-in): the framed lifting ring `R^□` of a residual
representation of `G_K`, an `𝒪[E]`-algebra. -/
def LiftingRing {n : ℕ} (ρbar : Gal K →* GL (Fin n) 𝓀[E]) : Type := sorry

instance {n : ℕ} (ρbar : Gal K →* GL (Fin n) 𝓀[E]) : CommRing (LiftingRing K E ρbar) := sorry

instance {n : ℕ} (ρbar : Gal K →* GL (Fin n) 𝓀[E]) : Algebra 𝒪[E] (LiftingRing K E ρbar) := sorry

variable {K E}

/-- LocalGaloisDeformationRings R08.1 (stand-in): the point of `R^□` classifying a lift. -/
def LiftingRing.point {n : ℕ} (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) :
    LiftingRing K E (reduction ρ.toMonoidHom) →ₐ[𝒪[E]] 𝒪[E] := sorry

/-- LocalGaloisDeformationRings R08.3 (stand-in): the quotient of `R^□` classifying the lifts that
are crystalline over `K'` with labelled Hodge–Tate weights `H`, as an ideal of `R^□`. -/
def crystallineIdeal {n : ℕ} (ρbar : Gal K →* GL (Fin n) 𝓀[E]) (H : (K →+* E) → Multiset ℤ)
    {K' : Type} [Field K'] (f : K →+* K') : Ideal (LiftingRing K E ρbar) := sorry

end LocalInterfaces

section GlobalInterfaces

variable (F : Type) [Field F] [NumberField F]
variable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group (stand-in): the group
`𝒢_n(A) = (GL_n(A) × A^×) ⋊ {1, j}`. -/
def CHT (n : ℕ) (A : Type*) [CommRing A] : Type := sorry

instance (n : ℕ) (A : Type*) [CommRing A] : Group (CHT n A) := sorry

instance (n : ℕ) (A : Type*) [CommRing A] [TopologicalSpace A] : TopologicalSpace (CHT n A) :=
  sorry

/-- G7 (stand-in): the multiplier `ν : 𝒢_n(A) → A^×`. -/
def CHT.nu (n : ℕ) (A : Type*) [CommRing A] : CHT n A →* Aˣ := sorry

/-- G7 (stand-in): the identity component `𝒢_n⁰(A) = GL_n(A) × A^×`. -/
def CHT.conn (n : ℕ) (A : Type*) [CommRing A] : Subgroup (CHT n A) := sorry

/-- G7 (stand-in): the projection `𝒢_n⁰(A) → GL_n(A)`. -/
def CHT.gl (n : ℕ) (A : Type*) [CommRing A] : CHT.conn n A →* GL (Fin n) A := sorry

/-- G7 (stand-in): functoriality of `𝒢_n` in the coefficient ring. -/
def CHT.map (n : ℕ) {A B : Type*} [CommRing A] [CommRing B] (f : A →+* B) :
    CHT n A →* CHT n B := sorry

/-- AutomorphicGaloisRepresentationsPartII AG2.0/regular-algebraic-of-weight (stand-in): the
regular algebraic automorphic representations of `GL_n(𝔸_F)`. -/
def RegAlg (F : Type) [Field F] [NumberField F] (n : ℕ) : Type := sorry

/-- AutomorphicGaloisRepresentationsPartII AG2.0/polarized-automorphic-representation (stand-in):
the regular algebraic cuspidal polarized automorphic representations `(π, χ)` of `GL_n(𝔸_F)`,
`F` CM or totally real. -/
def RACP (F : Type) [Field F] [NumberField F] (n : ℕ) : Type := sorry

variable {F E}

namespace RegAlg

variable {n : ℕ}

/-- AG2.0/regular-algebraic-of-weight (stand-in): the weight `a ∈ (ℤ^n)^{Hom(F, ℂ)}` of `π`. -/
def weight (π : RegAlg F n) : (F →+* ℂ) → Fin n → ℤ := sorry

/-- SmoothRepresentationsOfLocalGroups SR.1 (stand-in): the local component `π_v`. -/
def component (π : RegAlg F n) (v : Place F) : SmoothIrrep v.Fv n := sorry

/-- `π` has weight `ι_* λ`. -/
def HasWeight (π : RegAlg F n) (ι : E →+* ℂ) (lam : (F →+* E) → Fin n → ℤ) : Prop :=
  ∀ τ : F →+* E, π.weight (ι.comp τ) = lam τ

end RegAlg

namespace RACP

variable {n : ℕ}

/-- AG2.0 (stand-in): the underlying regular algebraic representation `π` of `(π, χ)`. -/
def toRegAlg (π : RACP F n) : RegAlg F n := sorry

/-- The weight of `π`. -/
def weight (π : RACP F n) : (F →+* ℂ) → Fin n → ℤ := π.toRegAlg.weight

/-- The local component `π_v`. -/
def component (π : RACP F n) (v : Place F) : SmoothIrrep v.Fv n := π.toRegAlg.component v

/-- AG2.2 (stand-in): the Galois representation `r_{l,ι}(π)`, for `ι : E → ℂ` and `E` large enough
to contain its field of definition. -/
-- REVIEW: a finite extension realizing this representation is not supplied by
-- IsLargeForF. This total fixed-E interface remains unresolved (AG2.2/AG2.7).
def galoisRep (π : RACP F n) (ι : E →+* ℂ) : Gal F →ₜ* GL (Fin n) E := sorry

/-- AG2.0/galois-character-of-an-algebraic-hecke-character (stand-in): `r_{l,ι}(χ)`, a character
of `G_{F⁺}`. -/
def multiplier (π : RACP F n) (ι : E →+* ℂ) : Gal (maximalRealSubfield F) →ₜ* Eˣ := sorry

/-- AG2.7/residual-representation-of-pi (stand-in): the semisimple residual representation
`r̄_{l,ι}(π)`. -/
def residualRep (π : RACP F n) (ι : E →+* ℂ) : Gal F →* GL (Fin n) 𝓀[E] := sorry

/-- `π` has weight `ι_* λ`. -/
def HasWeight (π : RACP F n) (ι : E →+* ℂ) (lam : (F →+* E) → Fin n → ℤ) : Prop :=
  ∀ τ : F →+* E, π.weight (ι.comp τ) = lam τ

end RACP

variable (F E)

/-- PotentialAutomorphyInfrastructure PA.2/iota-ordinary-automorphic-representation (import): the
`ι`-ordinary representations among the regular algebraic automorphic representations. -/
def iotaOrdinary (n : ℕ) (ι : E →+* ℂ) : Imported (RegAlg F n) := sorry

/-- AG2.6 (stand-in): the `π` whose components at the places above `l` become unramified after a
finite base change ("level potentially prime to `l`"). -/
def levelPotentiallyPrimeTo (n : ℕ) (l : ℕ) : Imported (RegAlg F n) := sorry

/-- GlobalGaloisDeformations G7/polarized-deformation-problem (stand-in): the polarized global
deformation problems `𝒮 = (F/F⁺, S, S̃, 𝒪, r̄, χ, {D_v})` for `𝒢_n`-valued representations of
`G_{F⁺}`, over the coefficient ring `Λ` (an `𝒪[E]`-algebra; `Λ = 𝒪[E]` in the fixed-weight
theory). -/
def DefProblem (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [ValuativeRel E]
    (n : ℕ) (Λ : Type) [CommRing Λ] [Algebra 𝒪[E] Λ] : Type := sorry

variable {F E}

namespace DefProblem

variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- G7 (stand-in): the residual representation `r̄ : G_{F⁺} → 𝒢_n(k)` of the problem. -/
def resid [NumberField.IsCMField F] (S : DefProblem F E n Λ) :
    Gal (maximalRealSubfield F) →* CHT n 𝓀[E] := sorry

/-- G7 (stand-in): the finite set of places of `F⁺` of the problem, through their chosen places
`ṽ` of `F`. -/
def places (S : DefProblem F E n Λ) : Set (Place F) := sorry

/-- G7/polarized-representability (stand-in): the universal deformation ring `R^univ_𝒮`. -/
def univRing (S : DefProblem F E n Λ) : Type := sorry

instance (S : DefProblem F E n Λ) : CommRing S.univRing := sorry

instance (S : DefProblem F E n Λ) : Algebra Λ S.univRing := sorry

/-- G7 (stand-in): the lifts of type `𝒮` to a `Λ`-algebra `A`, as `𝒢_n(A)`-valued
homomorphisms. -/
def lifts [NumberField.IsCMField F] (S : DefProblem F E n Λ) (A : Type) [CommRing A]
    [Algebra Λ A] : Imported (Gal (maximalRealSubfield F) →* CHT n A) := sorry

/-- G7 (stand-in): the lift of type `𝒮` classified by a `Λ`-algebra map from `R^univ_𝒮`. -/
def liftOf [NumberField.IsCMField F] (S : DefProblem F E n Λ) {A : Type} [CommRing A]
    [Algebra Λ A] (f : S.univRing →ₐ[Λ] A) : Gal (maximalRealSubfield F) →* CHT n A := sorry

end DefProblem

end GlobalInterfaces


section SharedInterfaces

/-- `ρ` is irreducible: `n > 0` and no proper nonzero invariant subspace. -/
def IsIrred {G k : Type*} [Field k] {n : ℕ} (ρ : G → GL (Fin n) k) : Prop :=
  0 < n ∧ ∀ W : Submodule k (Fin n → k),
    (∀ g, ∀ w ∈ W, (ρ g : Matrix (Fin n) (Fin n) k).mulVec w ∈ W) → W = ⊥ ∨ W = ⊤

/-- `ρ` is absolutely irreducible: irreducible over an algebraic closure. -/
def IsAbsIrred {G k : Type*} [Field k] {n : ℕ} (ρ : G → GL (Fin n) k) : Prop :=
  IsIrred fun g => Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k)) (ρ g)

/-- A homomorphism from `G_K` to a discrete group is continuous: its kernel is open. Residual
representations that are not reductions of a continuous lattice carry this hypothesis. -/
def IsContinuousResidual {K H : Type*} [Field K] [Group H] (ρbar : Gal K →* H) : Prop :=
  IsOpen (ρbar.ker : Set (Gal K))

/-- Restriction of a homomorphism of `G_K` along a field embedding `K → K'`. -/
def resFieldHom {K K' H : Type*} [Field K] [Field K'] [Monoid H] (ρ : Gal K →* H)
    (f : K →+* K') : Gal K' →* H :=
  ρ.comp (Field.absoluteGaloisGroup.map f).toMonoidHom

/-- ArithmeticGaloisRepresentations G7/adequate-subgroup (stand-in): the adequate subgroups of
`GL_n(k)` in the sense of Thorne 2012, Definition 2.3. -/
def adequate (k : Type*) [Field k] (n : ℕ) : Imported (Subgroup (GL (Fin n) k)) := sorry

/-- ArithmeticGaloisRepresentations G7/adequate-subgroup (stand-in): the adequate subgroups of
`GL_n(k)` in the sense of Thorne 2017, Definition 2.20 (Guralnick–Herzig–Tiep). -/
def ghtAdequate (k : Type*) [Field k] (n : ℕ) : Imported (Subgroup (GL (Fin n) k)) := sorry

/-- ArithmeticGaloisRepresentations G7/characteristic-zero-enormous-subgroups (stand-in): the
enormous subgroups of `GL_n(E)` (Newton–Thorne 2023, Definition 2.23). -/
def enormous (E : Type*) [Field E] (n : ℕ) : Imported (Subgroup (GL (Fin n) E)) := sorry

/-- The quadratic character `δ_{F/F⁺}` of `G_{F⁺}` attached to a CM field `F`, valued in `E^×`
(stand-in for the composite of restriction to `Gal(F/F⁺)` with the sign). -/
def delta (F : Type*) [Field F] [NumberField F] (E : Type*) [Field E] [TopologicalSpace E] :
    Gal (maximalRealSubfield F) →ₜ* Eˣ := sorry

end SharedInterfaces

/-! ## Shared definitions of PL.0–PL.3

The definitions other layers consume. Their API, unit tests and theorems follow layer by layer. -/

section SharedLocal

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- The algebraic character `x ↦ ∏_τ τ(x)^{a_τ}` of `K^×`, valued in `E^×`. -/
def algChar (a : (K →+* E) → ℤ) (x : Kˣ) : Eˣ :=
  ∏ᶠ τ : K →+* E, Units.map (τ : K →* E) x ^ a τ

/-- The image in `K^×` of a unit of `𝒪[K]`. -/
def unitOfInt (u : (𝒪[K])ˣ) : Kˣ := Units.map ((algebraMap 𝒪[K] K : 𝒪[K] →* K)) u

/-- **`PL.0/ordinary-of-weight`, at one place.** `ρ : G_K → GL_n(E)` is ordinary of weight
`μ ∈ (ℤ^n)^{Hom(K, E)}` if it is conjugate to an upper triangular representation with diagonal
characters `ψ_1, …, ψ_n` (`ψ_1` on the invariant line) such that
`x ↦ ψ_i(Art_K x) ∏_τ τ(x)^{μ_{τ,n-i+1}+i-1}` has finite order on `𝒪[K]^×`
(Thorne 2015, Definition 2.5). Indices here start at `0`. -/
def IsOrdinaryOfWeightAt (ρ : Gal K →ₜ* GL (Fin n) E) (μ : (K →+* E) → Fin n → ℤ) : Prop :=
  ∃ (ψ : Fin n → Gal K →ₜ* Eˣ) (ρ' : Gal K → GL (Fin n) E),
    Conj (ρ : Gal K → GL (Fin n) E) ρ' ∧ IsUpperTriangularWith ρ' (fun i σ => ψ i σ) ∧
    ∀ i : Fin n, ∃ m : ℕ, 0 < m ∧ ∀ u : (𝒪[K])ˣ,
      (artinChar (ψ i) (unitOfInt u) *
        algChar (fun τ => μ τ (Fin.rev i) + (i : ℤ)) (unitOfInt u)) ^ m = 1

/-- Conjugation of a lattice-valued representation by an element of `GL_n(𝒪[E])`. -/
def conjBy (g : GL (Fin n) 𝒪[E]) (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Gal K →ₜ* GL (Fin n) 𝒪[E] where
  toFun σ := g * ρ σ * g⁻¹
  map_one' := by simp
  map_mul' := by intro a b; simp [mul_assoc]
  continuous_toFun := by sorry

/-- The representation over `E` of a continuous lattice-valued representation. -/
def genericC (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Gal K →ₜ* GL (Fin n) E where
  toMonoidHom := generic ρ.toMonoidHom
  continuous_toFun := by sorry

/-- The diagonal representation `χ_1 ⊕ ⋯ ⊕ χ_n` of lattice-valued characters. -/
def diagRep (χ : Fin n → Gal K →ₜ* (𝒪[E])ˣ) : Gal K →ₜ* GL (Fin n) 𝒪[E] where
  toFun σ := ⟨Matrix.diagonal fun i => ((χ i σ : (𝒪[E])ˣ) : 𝒪[E]),
    Matrix.diagonal fun i => (((χ i σ)⁻¹ : (𝒪[E])ˣ) : 𝒪[E]), by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry
  continuous_toFun := by sorry

/-- Two primes of `R` lie on a common irreducible component of `Spec (R/I)[1/l]`. -/
def OnCommonComponent {R : Type*} [CommRing R] (I : Ideal R) (l : ℕ) (p₁ p₂ : Ideal R) : Prop :=
  ∃ q ∈ I.minimalPrimes, (l : R) ∉ q ∧ q ≤ p₁ ∧ q ≤ p₂

/-- A prime of `R` lies on exactly one irreducible component of `Spec (R/I)[1/l]`. -/
def OnUniqueComponent {R : Type*} [CommRing R] (I : Ideal R) (l : ℕ) (p : Ideal R) : Prop :=
  ∃! q, q ∈ I.minimalPrimes ∧ (l : R) ∉ q ∧ q ≤ p

/-- The lifts of a fixed residual representation. -/
abbrev Lift (ρbar : Gal K →* GL (Fin n) 𝓀[E]) :=
  {ρ : Gal K →ₜ* GL (Fin n) 𝒪[E] // reduction ρ.toMonoidHom = ρbar}

/-- The prime of `R^□` at which a lift is a point. -/
def Lift.prime {ρbar : Gal K →* GL (Fin n) 𝓀[E]} (ρ : Lift ρbar) : Ideal (LiftingRing K E ρbar) :=
  RingHom.ker (ρ.2 ▸ LiftingRing.point ρ.1 : LiftingRing K E ρbar →ₐ[𝒪[E]] 𝒪[E])

/-- Connection of two lifts of the same residual representation. For `l ≠ p` (the residue
characteristics of `E` and `K`): a common irreducible component of `Spec R^□[1/l]`. For `l = p`:
both are potentially crystalline with the same labelled Hodge–Tate weights `H` and lie on a common
irreducible component of the `K'`-crystalline quotient of Hodge type `H`, for some finite `K'/K`.
`E` is large enough that these components are geometrically irreducible (BLGGT14 take `Q̄_l`). -/
/- REVIEW: finite-E minimal primes must be compared with geometric components
over Q̄_l after compatible enlargement; the packet records this unresolved interface. -/
def ConnectsLift {p l : ℕ} [ResChar K p] [ResChar E l] {ρbar : Gal K →* GL (Fin n) 𝓀[E]}
    (ρ₁ ρ₂ : Lift ρbar) : Prop :=
  (p ≠ l → OnCommonComponent ⊥ l ρ₁.prime ρ₂.prime) ∧
  (p = l → ∃ (H : (K →+* E) → Multiset ℤ) (K' : Type) (_ : Field K') (_ : ValuativeRel K')
      (_ : TopologicalSpace K') (_ : IsNonarchimedeanLocalField K') (f : K →+* K'),
      HasHodgeTate (genericC ρ₁.1) H ∧ HasHodgeTate (genericC ρ₂.1) H ∧
      OnCommonComponent (crystallineIdeal ρbar H f) l ρ₁.prime ρ₂.prime)

/-- **`PL.1/connects-relation`: `ρ₁ ∼ ρ₂`.** The reductions are equivalent, and after conjugating
`ρ₂` so that the reductions agree the two lifts connect (BLGGT14 §§1.3–1.4). -/
def Connects {p l : ℕ} [ResChar K p] [ResChar E l] (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Prop :=
  ∃ (g : GL (Fin n) 𝒪[E]) (h : reduction (conjBy g ρ₂).toMonoidHom = reduction ρ₁.toMonoidHom),
    ConnectsLift (ρbar := reduction ρ₁.toMonoidHom) ⟨ρ₁, rfl⟩ ⟨conjBy g ρ₂, h⟩

/-- **`PL.1/connects-relation`: `ρ₁ ⇝ ρ₂`** (`l ≠ p`): `ρ₁ ∼ ρ₂` and `ρ₁` lies on a unique
irreducible component of `Spec R^□[1/l]`. -/
def StronglyConnects {p l : ℕ} [ResChar K p] [ResChar E l]
    (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Prop :=
  p ≠ l ∧ Connects ρ₁ ρ₂ ∧
    OnUniqueComponent ⊥ l (Lift.prime (ρbar := reduction ρ₁.toMonoidHom) ⟨ρ₁, rfl⟩)

/-- **`PL.1/connects-relation`: `D_C`.** For a finite set `C` of irreducible components of
`Spec R^□[1/l]` (minimal primes not containing `l`), the ideal cutting out the maximal reduced
`l`-torsion-free quotient supported on `C`. -/
def componentDeformationProblem {ρbar : Gal K →* GL (Fin n) 𝓀[E]}
    (C : Finset (Ideal (LiftingRing K E ρbar))) : Ideal (LiftingRing K E ρbar) :=
  C.inf id

/-- **`PL.1/potentially-diagonalizable`.** `ρ` is crystalline and connects to a sum of
crystalline characters (`K` and `E` of the same residue characteristic). -/
def IsDiagonalizable {l : ℕ} [ResChar K l] [ResChar E l]
    (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Prop :=
  (crystalline K E n).Holds (genericC ρ) ∧
  ∃ χ : Fin n → Gal K →ₜ* (𝒪[E])ˣ,
    (crystalline K E n).Holds (genericC (diagRep χ)) ∧ Connects ρ (diagRep χ)

/-- **`PL.1/potentially-diagonalizable`.** `ρ|G_{K'}` is diagonalizable for some finite `K'/K`. -/
def IsPotentiallyDiagonalizable {l : ℕ} [ResChar K l] [ResChar E l]
    (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Prop :=
  ∃ (K' : Type) (_ : Field K') (_ : ValuativeRel K') (_ : TopologicalSpace K')
    (_ : IsNonarchimedeanLocalField K') (_ : ResChar K' l) (f : K →+* K'),
    IsDiagonalizable (resField ρ f)

/-- Potential diagonalizability of a representation over `E`: some (equivalently every, BLGGT14
Lemma 1.4.1) invariant lattice is potentially diagonalizable. -/
def IsPotentiallyDiagonalizableRat {l : ℕ} [ResChar K l] [ResChar E l]
    (ρ : Gal K →ₜ* GL (Fin n) E) : Prop :=
  ∃ ρ₀ : Gal K →ₜ* GL (Fin n) 𝒪[E],
    Conj (ρ : Gal K → GL (Fin n) E) (genericC ρ₀) ∧ IsPotentiallyDiagonalizable ρ₀

end SharedLocal

section SharedGlobal

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- **`PL.0/ordinary-of-weight`.** `ρ : G_F → GL_n(E)` is ordinary of weight
`λ ∈ (ℤ^n_+)^{Hom(F, E)}` if its restriction to every place above `l` is. -/
def IsOrdinaryOfWeight (l : ℕ) (ρ : Gal F →ₜ* GL (Fin n) E) (lam : (F →+* E) → Fin n → ℤ) :
    Prop :=
  (∀ τ, Antitone (lam τ)) ∧ ∀ v : Place F, v.Above l →
    IsOrdinaryOfWeightAt (resPlace ρ v) (fun τ => lam (τ.comp v.emb))

/-- `(r, μ) ≅ (r_{l,ι}(π), r_{l,ι}(χ) ε_l^{1-n})`: the pair is automorphic through `π`. -/
def IsAutomorphicVia (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (π : RACP F n) : Prop :=
  Conj (r : Gal F → GL (Fin n) E) (π.galoisRep ι) ∧
    ∀ σ, μ σ = π.multiplier ι σ * (cyclo E (maximalRealSubfield F) σ) ^ (1 - (n : ℤ))

/-- **`PL.0/automorphic-polarized-representation`.** `(r, μ)` is automorphic
(BLGGT14 §2.1). -/
def IsAutomorphic (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) : Prop :=
  ∃ π : RACP F n, IsAutomorphicVia ι r μ π

/-- **`PL.0/automorphic-polarized-representation`.** Automorphic of level prime to `l`. -/
def IsAutomorphicOfLevelPrimeTo (l : ℕ) (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) : Prop :=
  ∃ π : RACP F n, IsAutomorphicVia ι r μ π ∧
    ∀ v : Place F, v.Above l → (unramifiedIrrep v.Fv n).Holds (π.component v)

/-- **`PL.0/automorphic-polarized-representation`.** Automorphic of level potentially prime to
`l`. -/
def IsAutomorphicOfLevelPotentiallyPrimeTo (l : ℕ) (ι : E →+* ℂ)
    (r : Gal F →ₜ* GL (Fin n) E) (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) : Prop :=
  ∃ π : RACP F n, IsAutomorphicVia ι r μ π ∧ (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg

/-- **`PL.0/automorphic-polarized-representation`.** Ordinarily automorphic: automorphic through
an `ι`-ordinary `π` (the notion of `ι`-ordinarity is imported from PA.2). -/
def IsOrdinarilyAutomorphic (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) : Prop :=
  ∃ π : RACP F n, IsAutomorphicVia ι r μ π ∧ (iotaOrdinary F E n ι).Holds π.toRegAlg

/-- **`PL.1/potentially-diagonalizable`.** Potentially diagonalizably automorphic. -/
def IsPotentiallyDiagonalizablyAutomorphic (l : ℕ) [ResChar E l] (ι : E →+* ℂ)
    (r : Gal F →ₜ* GL (Fin n) E) (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) : Prop :=
  ∃ π : RACP F n, IsAutomorphicVia ι r μ π ∧ (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg ∧
    ∀ (v : Place F) (_ : ResChar v.Fv l),
      IsPotentiallyDiagonalizableRat (resPlace (π.galoisRep ι) v)

end SharedGlobal

end TauCeti.Automorphy

namespace TauCeti.DefiniteUnitary

open TauCeti.Automorphy

/-! ## Shared signatures of PL.2

The data on which the definite unitary group, its algebraic modular forms and its Hecke algebras
depend. Their API, unit tests and theorems are in the PL.2 section. -/

/-- The data of the definite unitary group: an imaginary CM field `L` with `L/L⁺` unramified at
every finite place, the rank `n`, and a set of places `ṽ` of `L`, one above each place of `L⁺`
in the finite set `S(B)` of split places where `B` is a division algebra; `S(B) = ∅` is the
matrix case of Thorne 2012 §6, and `S(B) ≠ ∅` the case of Thorne 2015 §4.1. -/
structure CMData where
  /-- The imaginary CM field `L`. -/
  L : Type
  [field : Field L]
  [numberField : NumberField L]
  [cm : IsCMField L]
  /-- The rank `n`. -/
  n : ℕ
  n_pos : 0 < n
  unramified : Algebra.FormallyUnramified (𝓞 (maximalRealSubfield L)) (𝓞 L)
  /-- The chosen places `ṽ` above `S(B)`. -/
  SB : Set (Place L)
  SB_finite : SB.Finite
  SB_split : ∀ w ∈ SB, DenseRange (w.emb.comp (algebraMap (maximalRealSubfield L) L))
  SB_unique : ∀ w ∈ SB, ∀ w' ∈ SB,
    (∃ e : w.Fv ≃+* w'.Fv, Continuous e ∧ ∀ x : maximalRealSubfield L,
      e (w.emb (x : L)) = w'.emb (x : L)) → w = w'
  SB_even : Even n → Even (Nat.card SB)

attribute [instance] CMData.field CMData.numberField CMData.cm

/-- The maximal totally real subfield `L⁺`. -/
abbrev CMData.Lplus (D : CMData) : Type := maximalRealSubfield D.L

/-- The place `w` of `L` is split over `L⁺`: `L⁺` is dense in `L_w`. -/
def CMData.IsSplit (D : CMData) (w : Place D.L) : Prop :=
  DenseRange (w.emb.comp (algebraMap D.Lplus D.L))

/-- The places `w`, `w'` of `L` induce the same place of `L⁺`. -/
def CMData.SameBelow (D : CMData) (w w' : Place D.L) : Prop :=
  ∃ e : w.Fv ≃+* w'.Fv, Continuous e ∧ ∀ x : D.Lplus, e (w.emb (x : D.L)) = w'.emb (x : D.L)

/-- The place `w` of `L` lies above the place `v` of `L⁺`. -/
def CMData.LiesAbove (D : CMData) (w : Place D.L) (v : Place D.Lplus) : Prop :=
  ∃ f : v.Fv →+* w.Fv, Continuous f ∧ ∀ x : D.Lplus, f (v.emb x) = w.emb (x : D.L)

/-- The finite adeles `𝔸^∞_{L⁺}`. -/
abbrev CMData.finiteAdeles (D : CMData) : Type :=
  IsDedekindDomain.FiniteAdeleRing (𝓞 D.Lplus) D.Lplus

/-- **`PL.2/definite-unitary-group`.** The points `G(R)` of the definite unitary group over
`𝒪_{L⁺}` attached to `(B, *, 𝒪_B)`: quasi-split at finite places outside `S(B)` and compact at
every infinite place (Thorne 2012 §6 and Thorne 2015 §4.1). -/
def unitaryGroup (D : CMData) (R : Type) [CommRing R] [Algebra (𝓞 D.Lplus) R] : Type := sorry

instance (D : CMData) (R : Type) [CommRing R] [Algebra (𝓞 D.Lplus) R] :
    Group (unitaryGroup D R) := sorry

instance (D : CMData) (R : Type) [CommRing R] [Algebra (𝓞 D.Lplus) R] [TopologicalSpace R] :
    TopologicalSpace (unitaryGroup D R) := sorry

variable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- The data of Thorne 2012 §§6, 8: the group, the prime `l`, a level `U`, the finite set `T` of
split places (through chosen places `ṽ` of `L`), the subset `R ⊂ T` and the characters `χ_v` of
`(k(ṽ)^×)^n` for `v ∈ R`. -/
structure HeckeDatum where
  /-- The CM field and the rank. -/
  toCMData : CMData
  /-- The residue characteristic of the coefficient field. -/
  l : ℕ
  resChar : ResChar E l
  /-- The level `U ⊂ G(𝔸^∞_{L⁺})`. -/
  level : Subgroup (unitaryGroup toCMData toCMData.finiteAdeles)
  level_open : IsOpen (level : Set (unitaryGroup toCMData toCMData.finiteAdeles))
  level_compact : IsCompact (level : Set (unitaryGroup toCMData toCMData.finiteAdeles))
  /-- The finite set `T̃` of places of `L` above the split places `T ⊇ S_l ∪ R` of `L⁺`. -/
  T : Set (Place toCMData.L)
  T_finite : T.Finite
  above_l_mem : ∀ v : Place toCMData.L, v.Above l → ∃ w ∈ T, toCMData.SameBelow v w
  /-- The subset `R̃ ⊂ T̃`. -/
  R : Set (Place toCMData.L)
  R_subset : R ⊆ T
  R_not_above_l : ∀ v ∈ R, ¬ v.Above l
  /-- The characters `χ_{v,1}, …, χ_{v,n}` of `k(ṽ)^×` for `v ∈ R`. -/
  χ : (v : Place toCMData.L) → Fin toCMData.n → (𝓀[v.Fv])ˣ →* (𝒪[E])ˣ

variable {E}

/-- The CM field of a Hecke datum. -/
abbrev HeckeDatum.L (D : HeckeDatum E) : Type := D.toCMData.L

/-- The rank of a Hecke datum. -/
abbrev HeckeDatum.n (D : HeckeDatum E) : ℕ := D.toCMData.n

/-- **`PL.2/unitary-hecke-algebra`.** `T^T_{λ,{χ_v}}(U, 𝒪)`, the commutative `𝒪`-algebra generated
by the operators `T_w^j` and `(T_w^n)^{-1}` at the split places outside `T` acting on
`S_{λ,{χ_v}}(U, 𝒪)` (Thorne 2012 §6). -/
def heckeAlgebra (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) : Type := sorry

instance (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) : CommRing (heckeAlgebra D lam) :=
  sorry

instance (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) :
    Algebra 𝒪[E] (heckeAlgebra D lam) := sorry

/-- LocalGaloisDeformationRings L8/ordinary-coefficient-ring (stand-in): the Iwasawa algebra
`Λ = 𝒪⟦T(l)⟧`, `T(l)` the kernel of reduction on `∏_{v | l} T_n(𝒪_{L⁺_v})`. -/
def iwasawaAlgebra (D : HeckeDatum E) : Type := sorry

instance (D : HeckeDatum E) : CommRing (iwasawaAlgebra D) := sorry

instance (D : HeckeDatum E) : Algebra 𝒪[E] (iwasawaAlgebra D) := sorry

/-- **`PL.2/big-ordinary-hecke-algebra`.** `T^{T,ord}_{{χ_v}}(U(l^∞), 𝒪)`, the big ordinary Hecke
algebra of weight zero, a `Λ`-algebra through the twisted diamond operators (Thorne 2012,
Definitions 8.1 and 8.3). -/
def bigOrdinaryHeckeAlgebra (D : HeckeDatum E) : Type := sorry

instance (D : HeckeDatum E) : CommRing (bigOrdinaryHeckeAlgebra D) := sorry

instance (D : HeckeDatum E) : Algebra (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) := sorry

instance (D : HeckeDatum E) : Algebra 𝒪[E] (bigOrdinaryHeckeAlgebra D) := sorry

end TauCeti.DefiniteUnitary

namespace TauCeti.Automorphy

/-! ## PL.0 and PL.1

Ordinary Galois representations, automorphic polarized representations and the lemmas on twists,
base change and auxiliary fields and characters (PL.0); connection of local lifts and potential
diagonalizability (PL.1).

Besides the conventions of the preamble: `l` and `p` are primes (`[Fact l.Prime]`), the local
field `K` and the coefficient field `E` have characteristic zero, and where labelled Hodge–Tate
weights or weights `λ ∈ (ℤ^n)^{Hom(F, E)}` occur `E` contains the image of every embedding
(`IsLargeFor F E` for a number field, `IsLargeForLocal K E` for a local field). -/

/-! #### Constructions on `GL_n`-valued representations used by PL.0 and PL.1 -/

section Constructions

variable {G : Type*} [Group G] [TopologicalSpace G] {A : Type*} [CommRing A]
  [TopologicalSpace A] {n m : ℕ}

/-- The twist `ρ ⊗ ψ` of a representation by a character. -/
def twistRep (ρ : G →ₜ* GL (Fin n) A) (ψ : G →ₜ* Aˣ) : G →ₜ* GL (Fin n) A where
  toFun σ :=
    Units.map (Matrix.scalar (Fin n) : A →+* Matrix (Fin n) (Fin n) A).toMonoidHom (ψ σ) * ρ σ
  map_one' := by simp
  map_mul' := by sorry
  continuous_toFun := by sorry

/-- The dual representation `ρ^∨`: the inverse transpose. -/
def dualRep (ρ : G →ₜ* GL (Fin n) A) : G →ₜ* GL (Fin n) A where
  toFun σ := ⟨((ρ σ)⁻¹ : GL (Fin n) A).1ᵀ, (ρ σ).1ᵀ, by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry
  continuous_toFun := by sorry

/-- The direct sum `ρ ⊕ ρ'`, in block diagonal form. -/
def sumRep (ρ : G →ₜ* GL (Fin n) A) (ρ' : G →ₜ* GL (Fin m) A) : G →ₜ* GL (Fin (n + m)) A where
  toFun σ :=
    ⟨Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks (ρ σ).1 0 0 (ρ' σ).1),
      Matrix.reindex finSumFinEquiv finSumFinEquiv
        (Matrix.fromBlocks ((ρ σ)⁻¹ : GL (Fin n) A).1 0 0 ((ρ' σ)⁻¹ : GL (Fin m) A).1),
      by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry
  continuous_toFun := by sorry

/-- The tensor product `ρ ⊗ ρ'`, as the Kronecker product of matrices. -/
def tensorRep (ρ : G →ₜ* GL (Fin n) A) (ρ' : G →ₜ* GL (Fin m) A) :
    G →ₜ* GL (Fin (n * m)) A where
  toFun σ :=
    ⟨Matrix.reindex finProdFinEquiv finProdFinEquiv (Matrix.kronecker (ρ σ).1 (ρ' σ).1),
      Matrix.reindex finProdFinEquiv finProdFinEquiv
        (Matrix.kronecker ((ρ σ)⁻¹ : GL (Fin n) A).1 ((ρ' σ)⁻¹ : GL (Fin m) A).1),
      by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry
  continuous_toFun := by sorry

end Constructions

/-- `ρ` is semisimple: every invariant subspace has an invariant complement. -/
def IsSemisimpleRep {G k : Type*} [Field k] {n : ℕ} (ρ : G → GL (Fin n) k) : Prop :=
  ∀ W : Submodule k (Fin n → k),
    (∀ g, ∀ w ∈ W, (ρ g : Matrix (Fin n) (Fin n) k).mulVec w ∈ W) →
    ∃ W' : Submodule k (Fin n → k),
      (∀ g, ∀ w ∈ W', (ρ g : Matrix (Fin n) (Fin n) k).mulVec w ∈ W') ∧ IsCompl W W'

/-- A weight `λ` is dominant: `λ_{τ,1} ≥ ⋯ ≥ λ_{τ,n}` for every `τ`. -/
def IsDominant {T : Type*} {n : ℕ} (lam : T → Fin n → ℤ) : Prop := ∀ τ, Antitone (lam τ)

/-- `E` contains the image of every embedding of the local field `K` into an algebraic extension
of `E`. -/
def IsLargeForLocal (K E : Type) [Field K] [Field E] : Prop :=
  ∀ (E' : Type) [Field E'] [Algebra E E'] [Algebra.IsAlgebraic E E'] (τ : K →+* E'),
    ∃ τ₀ : K →+* E, τ = (algebraMap E E').comp τ₀

/-- The absolute ramification index of the local field `K` of residue characteristic `l`: the
largest `e` with `l ∈ 𝔪_K^e`. -/
def absRamIndex (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (l : ℕ) : ℕ :=
  sSup {e : ℕ | ((l : ℕ) : 𝒪[K]) ∈ 𝓂[K] ^ e}

section Reduction

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- `χbar` is the reduction of the character `χ`: each value of `χ` is a unit of `𝒪[E]` whose
residue class is the value of `χbar`. -/
def IsReductionOfChar {G : Type*} (χ : G → Eˣ) (χbar : G → (𝓀[E])ˣ) : Prop :=
  ∀ σ, ∃ u : 𝒪[E], algebraMap 𝒪[E] E u = (χ σ : E) ∧
    IsLocalRing.residue 𝒪[E] u = (χbar σ : 𝓀[E])

/-- `val_l(x) = a / b` for the valuation of `E` normalised by `val_l(l) = 1`. -/
def HasValuation (l : ℕ) (x : E) (a : ℤ) (b : ℕ) : Prop :=
  0 < b ∧ valuation E x ^ b = valuation E (l : E) ^ a

/-- `H⁰(G_K, (ad ρ)(1)) = 0` for a representation with values in an `𝒪[E]`-algebra `A` that is a
domain: no nonzero matrix `X` satisfies `ε_l(σ) ρ(σ) X ρ(σ)⁻¹ = X` for all `σ`. -/
def HasNoAdOneInvariants (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] {K : Type*} [Field K] {A : Type*} [CommRing A]
    [Algebra 𝒪[E] A] {n : ℕ} (ρ : Gal K → GL (Fin n) A) : Prop :=
  ∀ X : Matrix (Fin n) (Fin n) A,
    (∀ (σ : Gal K) (u : 𝒪[E]), algebraMap 𝒪[E] E u = (cyclo E K σ : E) →
      u • ((ρ σ : Matrix (Fin n) (Fin n) A) * X * ((ρ σ)⁻¹ : GL (Fin n) A)) = X) → X = 0

end Reduction

/-! #### Imported interfaces used by PL.0 -/

section PL0Interfaces

/-- SmoothRepresentationsOfLocalGroups SR.2 (stand-in): the irreducible smooth representations of
`GL_n(K)` isomorphic to the generic irreducible subquotient of the normalised induction
`n-Ind_{B_n}^{GL_n(K)} χ_1 ⊗ ⋯ ⊗ χ_n` from the upper triangular Borel subgroup, for smooth
characters `χ_i` of `K^×`. -/
def genericSubquotient {K : Type} [Field K] {n : ℕ} (χ : Fin n → Kˣ →* ℂˣ) :
    Imported (SmoothIrrep K n) := sorry

/-- SmoothRepresentationsOfLocalGroups SR.2, used by PotentialAutomorphyInfrastructure
PA.2/twisted-steinberg-ordinarity-criterion (stand-in): the twists `St_n ⊗ (ψ ∘ det)` of the
Steinberg representation of `GL_n(K)` by smooth characters `ψ` of `K^×`, ramified or not. -/
def steinbergCharTwist (K : Type) [Field K] (n : ℕ) : Imported (SmoothIrrep K n) := sorry

/-- ArithmeticGaloisRepresentations R01.6 (stand-in): the representation of `G_k` on the rational
Tate module `V_l W ⊗ E` of an elliptic curve `W` over `k`, in a basis; `l` is the residue
characteristic of `E`. -/
def tateRep {k : Type} [Field k] (W : WeierstrassCurve k) [W.IsElliptic] (E : Type) [Field E]
    [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E] :
    Gal k →ₜ* GL (Fin 2) E := sorry

/-- Tau Ceti EllipticCurves roadmap (stand-in): the Weierstrass equations over the local field `K`
of elliptic curves with split multiplicative reduction. -/
def splitMultiplicative (K : Type) [Field K] [ValuativeRel K] : Imported (WeierstrassCurve K) :=
  sorry

/-- Tau Ceti EllipticCurves roadmap (stand-in): the Weierstrass equations over the local field `K`
of elliptic curves with good supersingular reduction. -/
def goodSupersingular (K : Type) [Field K] [ValuativeRel K] : Imported (WeierstrassCurve K) :=
  sorry

/-- ArithmeticGaloisRepresentations R01.5 (stand-in): a complex conjugation `c_v ∈ G_K` at the
real place `v`. It is defined up to conjugacy and is used only through characters. -/
def conjAt (K : Type*) [Field K] (v : InfinitePlace K) : Gal K := sorry

/-- AutomorphicGaloisRepresentationsPartII AG2.0/polarized-galois-representation (stand-in): the
pairs `(r, μ)` that are polarized with sign `ε` at the infinite place `v` of `F⁺`: there is a
non-degenerate pairing on `E^n` with `⟨x, y⟩ = ε ⟨y, x⟩` and
`⟨r(σ) x, r(c_v σ c_v) y⟩ = μ(σ) ⟨x, y⟩` for `σ ∈ G_F`, and `ε = -μ(c_v)` if `F` is imaginary
(BLGGT14 §2.1). -/
def polarizedWithSign (F : Type) [Field F] [NumberField F] (E : Type) [Field E]
    [TopologicalSpace E] (n : ℕ) (v : InfinitePlace (maximalRealSubfield F)) (ε : ℤˣ) :
    Imported ((Gal F →ₜ* GL (Fin n) E) × (Gal (maximalRealSubfield F) →ₜ* Eˣ)) := sorry

/-- AutomorphicGaloisRepresentationsPartII AG2.0 (stand-in): the isomorphism classes of isobaric
automorphic representations of `GL_n(𝔸_F)`. -/
def AutRep (F : Type) [Field F] [NumberField F] (n : ℕ) : Type := sorry

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- AG2.0/regular-algebraic-of-weight (stand-in): the automorphic representation underlying a
regular algebraic one. -/
def RegAlg.toAutRep {n : ℕ} (π : RegAlg F n) : AutRep F n := sorry

/-- AG2.0 (stand-in): the cuspidal conjugate self-dual automorphic representations of
`GL_n(𝔸_F)`, `F` imaginary CM: `π^c ≅ π^∨`. -/
def cuspidalConjSelfDual (F : Type) [Field F] [NumberField F] (n : ℕ) : Imported (AutRep F n) :=
  sorry

/-- AG2.0 (stand-in): the isobaric sum `π₁ ⊞ π₂`. -/
def AutRep.isobaricSum {n₁ n₂ : ℕ} (π₁ : AutRep F n₁) (π₂ : AutRep F n₂) : AutRep F (n₁ + n₂) :=
  sorry

/-- AG2.0 (stand-in): the twist `π ⊗ |det|^{k/2}`, `k ∈ ℤ`. -/
def AutRep.absDetTwist {n : ℕ} (π : AutRep F n) (k : ℤ) : AutRep F n := sorry

/-- AG2.0/regular-algebraic-of-weight (stand-in): for a complex embedding `τ` of `F` with place
`v`, the Langlands parameter `rec(π_v)|_{ℂ^×} = ⊕_j z^{p_j} z̄^{q_j}` (`F_v ≅ ℂ` through `τ`), as
the multiset of the pairs `(p_j, q_j)`. -/
def AutRep.archParam {n : ℕ} (π : AutRep F n) (τ : F →+* ℂ) : Multiset (ℂ × ℂ) := sorry

/-- AG2.0/regular-algebraic-of-weight (stand-in): the trivial representation of `GL_n(𝔸_F)`, a
regular algebraic automorphic representation of weight `0` that is not cuspidal for `n ≥ 2`. -/
def RegAlg.trivialRep (F : Type) [Field F] [NumberField F] (n : ℕ) : RegAlg F n := sorry

/-- PotentialAutomorphyInfrastructure PA.2/ordinarily-automorphic-representation (import): the
pairs `(r, π)` such that `r` is `ι`-ordinarily automorphic through the regular algebraic `π`,
with no polarization. -/
def ordinarilyAutomorphicVia (F : Type) [Field F] [NumberField F] (E : Type) [Field E]
    [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E] (n : ℕ) (ι : E →+* ℂ) :
    Imported ((Gal F →ₜ* GL (Fin n) E) × RegAlg F n) := sorry

/-- PotentialAutomorphyInfrastructure PA.2/iota-ordinary-automorphic-representation (import): the
dimension of the ordinary part of `(ι⁻¹ π_v)^{Iw(v^{b,b})}`, on which the operators `U^{(j)}_{ϖ_v}`
normalised by the weight of `π` have unit eigenvalues. `π` is `ι`-ordinary when this is nonzero
for some `b` at every `v | l`. -/
def iotaOrdinaryPartDim {n : ℕ} (ι : E →+* ℂ) (π : RegAlg F n) (v : Place F) (b : ℕ) : ℕ := sorry

/-- AutomorphicFormsOnReductiveGroups AF.4 (stand-in): the irreducible admissible
`(Lie GL_n(k) ⊗ ℂ, U)`-modules, for `k = ℝ` with `U = O(n)` and `k = ℂ` with `U = U(n)`. -/
def ArchRep (k : Type) (n : ℕ) : Type := sorry

/-- AF.4 (stand-in): the unitary ones. -/
def archUnitary (k : Type) (n : ℕ) : Imported (ArchRep k n) := sorry

/-- AF.4 (stand-in): those whose Harish-Chandra parameter is half-integral, i.e. lies in one half
of the cocharacter group of a maximal torus of the complexified group. -/
def archHalfIntegral (k : Type) (n : ℕ) : Imported (ArchRep k n) := sorry

/-- AF.4 (stand-in): those `π` whose complex conjugate is isomorphic to the dual, `π^c ≅ π^∨`. -/
def archConjDual (k : Type) (n : ℕ) : Imported (ArchRep k n) := sorry

end PL0Interfaces

/-! ### Local definitions of PL.0 -/

section PL0Local

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- A character of `K^×` is smooth: its kernel is open. -/
def IsSmoothChar {H : Type*} [Group H] (χ : Kˣ →* H) : Prop := IsOpen (χ.ker : Set Kˣ)

/-- `ϖ ∈ K^×` is a uniformizer of `K`. -/
def IsUniformizer (ϖ : Kˣ) : Prop := ∃ x : 𝒪[K], Irreducible x ∧ (x : K) = ϖ

/-- `x ↦ ψ(Art_K x) ∏_τ τ(x)^{a_τ}` has finite order on `𝒪[K]^×`. -/
def HasFiniteOrderOnUnits (ψ : Gal K →ₜ* Eˣ) (a : (K →+* E) → ℤ) : Prop :=
  ∃ m : ℕ, 0 < m ∧ ∀ u : (𝒪[K])ˣ, (artinChar ψ (unitOfInt u) * algChar a (unitOfInt u)) ^ m = 1

/-- BLGGT14 §1.4, with the subgroup `U ⊂ 𝒪[K]^×` fixed: `ρ` has an invariant decreasing full flag
whose `i`-th graded piece is a character `χ_i` with `χ_i(Art_K α) = ∏_τ τ(α)^{b_{τ,i}}` on `U`,
and `b_{τ,1} < ⋯ < b_{τ,n}`. In upper triangular form the invariant line carries `χ_n`. -/
def IsOrdinaryWithExponentsOn (U : Subgroup (𝒪[K])ˣ) (ρ : Gal K →ₜ* GL (Fin n) E)
    (b : (K →+* E) → Fin n → ℤ) : Prop :=
  (∀ τ, StrictMono (b τ)) ∧
  ∃ (χ : Fin n → Gal K →ₜ* Eˣ) (ρ' : Gal K → GL (Fin n) E),
    Conj (ρ : Gal K → GL (Fin n) E) ρ' ∧ IsUpperTriangularWith ρ' (fun i σ => χ (Fin.rev i) σ) ∧
    ∀ i, ∀ u ∈ U, artinChar (χ i) (unitOfInt u) = algChar (fun τ => b τ i) (unitOfInt u)

/-- BLGGT14 §1.4: `ρ` is ordinary with exponents `b`, the characters being algebraic on some open
subgroup of `𝒪[K]^×`. -/
def IsOrdinaryWithExponents (ρ : Gal K →ₜ* GL (Fin n) E) (b : (K →+* E) → Fin n → ℤ) : Prop :=
  ∃ U : Subgroup (𝒪[K])ˣ, IsOpen (U : Set (𝒪[K])ˣ) ∧ IsOrdinaryWithExponentsOn U ρ b

/-- BLGGT14 §1.4: `ρ` is ss-ordinary with exponents `b`: one may take `U = 𝒪[K]^×`. -/
def IsSsOrdinaryWithExponents (ρ : Gal K →ₜ* GL (Fin n) E) (b : (K →+* E) → Fin n → ℤ) : Prop :=
  IsOrdinaryWithExponentsOn ⊤ ρ b

/-- BLGGT14 §1.4: `ρ` is ordinary. -/
def IsOrdinaryLocal (ρ : Gal K →ₜ* GL (Fin n) E) : Prop := ∃ b, IsOrdinaryWithExponents ρ b

/-- BLGGT14 §1.4: `ρ` is cr-ordinary: ordinary and crystalline. -/
def IsCrOrdinary (ρ : Gal K →ₜ* GL (Fin n) E) : Prop :=
  IsOrdinaryLocal ρ ∧ (crystalline K E n).Holds ρ

/-- `ι(E)` contains the values of every tuple of smooth characters whose normalised induction has
`π` as its generic subquotient: what "`E` large enough" means for a local component. -/
def ContainsInducingCharacters (ι : E →+* ℂ) (π : SmoothIrrep K n) : Prop :=
  ∀ χ : Fin n → Kˣ →* ℂˣ, (∀ i, IsSmoothChar (χ i)) → (genericSubquotient χ).Holds π →
    ∀ i x, ((χ i x : ℂˣ) : ℂ) ∈ ι.range

end PL0Local

/-! ### Global definitions of PL.0 -/

section PL0Global

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- The inclusion `G_F → G_{F⁺}`. -/
def toPlus (F : Type) [Field F] [NumberField F] : Gal F →ₜ* Gal (maximalRealSubfield F) :=
  Field.absoluteGaloisGroup.map (maximalRealSubfield F).subtype

/-- The inclusion `F⁺ → M⁺` induced by an embedding `F → M`. -/
def plusMap {M : Type} [Field M] [NumberField M] (f : F →+* M) :
    maximalRealSubfield F →+* maximalRealSubfield M :=
  (f.comp (maximalRealSubfield F).subtype).codRestrict (maximalRealSubfield M)
    (fun x φ => x.2 (φ.comp f))

/-- `ψ ψ^c = μ|_{G_F}` for characters `ψ` of `G_F` and `μ` of `G_{F⁺}`, `F` imaginary CM: for
`σ ∈ G_F`, `c ∈ G_{F⁺}` outside `G_F` and the element `σ'` of `G_F` with image `c σ c⁻¹`,
`ψ(σ) ψ(σ') = μ(σ)`. -/
def IsConjNorm {H : Type*} [CommGroup H] (ψ : Gal F →* H)
    (μ : Gal (maximalRealSubfield F) →* H) : Prop :=
  ∀ (c : Gal (maximalRealSubfield F)) (σ σ' : Gal F), c ∉ (toPlus F).toMonoidHom.range →
    toPlus F σ' = c * toPlus F σ * c⁻¹ → ψ σ * ψ σ' = μ (toPlus F σ)

/-- `φ` is `ψ` composed with the transfer `G_{F⁺}^{ab} → G_F^{ab}`, `F` imaginary CM (so `G_F`
has index two): `φ = ψ ψ^c` on `G_F`, and `φ(c) = ψ(c²)` for `c` outside `G_F`. -/
def IsTransferOf {H : Type*} [CommGroup H] (ψ : Gal F →* H)
    (φ : Gal (maximalRealSubfield F) →* H) : Prop :=
  IsConjNorm ψ φ ∧
    ∀ (c : Gal (maximalRealSubfield F)) (σ : Gal F), c ∉ (toPlus F).toMonoidHom.range →
      toPlus F σ = c * c → φ c = ψ σ

/-- A character of `G_F` is algebraic: de Rham at every place above `l` (BLGGT14 §2.1; a
continuous `l`-adic character is unramified at all but finitely many places). -/
def IsAlgebraicChar (l : ℕ) (ψ : Gal F →ₜ* Eˣ) : Prop :=
  ∀ v : Place F, v.Above l → (deRham v.Fv E 1).Holds (resPlace (charRep ψ) v)

/-- `(r, μ)` is a polarized `l`-adic representation of `G_F` (BLGGT14 §2.1): polarized with some
sign at some infinite place of `F⁺`. -/
def IsPolarized (r : Gal F →ₜ* GL (Fin n) E) (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) : Prop :=
  ∃ (v : InfinitePlace (maximalRealSubfield F)) (ε : ℤˣ), (polarizedWithSign F E n v ε).Holds (r, μ)

/-- `(r, μ)` is totally odd: polarized with sign `ε_v = 1` at every infinite place `v`. -/
def IsTotallyOdd (r : Gal F →ₜ* GL (Fin n) E) (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) : Prop :=
  ∀ v : InfinitePlace (maximalRealSubfield F), (polarizedWithSign F E n v 1).Holds (r, μ)

/-- `r` alone is automorphic: `r ≅ r_{l,ι}(π)` for a regular algebraic cuspidal polarized `π`
(BLGGT14 §2.1). -/
def IsAutomorphicRep (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E) : Prop :=
  ∃ π : RACP F n, Conj (r : Gal F → GL (Fin n) E) (π.galoisRep ι)

/-- `r` alone is automorphic of weight `λ`: `r ≅ r_{l,ι}(π)` for a regular algebraic cuspidal
polarized `π` of weight `ι_* λ`. -/
def IsAutomorphicOfWeight (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (lam : (F →+* E) → Fin n → ℤ) : Prop :=
  ∃ π : RACP F n, Conj (r : Gal F → GL (Fin n) E) (π.galoisRep ι) ∧ π.HasWeight ι lam

/-- The mod `l` pair `(r̄, μ̄)` is automorphic:
`(r̄, μ̄) ≅ (r̄_{l,ι}(π), r̄_{l,ι}(χ) ε̄_l^{1-n})` (BLGGT14 §2.1). -/
def IsResiduallyAutomorphic (ι : E →+* ℂ) (rbar : Gal F →* GL (Fin n) 𝓀[E])
    (μbar : Gal (maximalRealSubfield F) →* (𝓀[E])ˣ) : Prop :=
  ∃ π : RACP F n, Conj (rbar : Gal F → GL (Fin n) 𝓀[E]) (π.residualRep ι) ∧
    IsReductionOfChar
      (fun σ => π.multiplier ι σ * cyclo E (maximalRealSubfield F) σ ^ (1 - (n : ℤ))) μbar

/-- Two embeddings `F → E` induce the same place of `F`. -/
def InducesSamePlace (τ₁ τ₂ : F →+* E) : Prop :=
  ∃ (v : Place F) (σ₁ σ₂ : v.Fv →+* E), τ₁ = σ₁.comp v.emb ∧ τ₂ = σ₂.comp v.emb

/-- The finite place `v` of `F` splits completely in `M`: `M_w = F_v` for every place `w` of `M`
above `v`. -/
def Place.SplitsCompletelyIn (v : Place F) (M : Type) [Field M] [Algebra F M] : Prop :=
  ∀ (w : Place M) (f : v.Fv →+* w.Fv), f.comp v.emb = w.emb.comp (algebraMap F M) →
    Function.Surjective f

/-- The place `v` of `F` is unramified over `F⁺`: some element of `F⁺` is a uniformizer of
`F_v`. -/
def Place.IsUnramifiedOverPlus (v : Place F) : Prop :=
  ∃ (x : maximalRealSubfield F) (y : 𝒪[v.Fv]), Irreducible y ∧ (y : v.Fv) = v.emb x

/-- The representation of `G` on `E^n` given by a matrix representation. -/
def matRep {G : Type*} [Group G] (ρ : G →* GL (Fin n) E) : Representation E G (Fin n → E) where
  toFun σ := Matrix.mulVecLin (ρ σ : Matrix (Fin n) (Fin n) E)
  map_one' := by sorry
  map_mul' := by sorry

/-- `R ≅ Ind_{G_M}^{G_F} r` for an embedding `f : F → M` (Mathlib's `Representation.ind`). -/
def IsInducedFrom {M : Type} [Field M] {N : ℕ} (f : F →+* M) (R : Gal F →ₜ* GL (Fin N) E)
    (r : Gal M →ₜ* GL (Fin n) E) : Prop :=
  Nonempty ((matRep R.toMonoidHom).Equiv
    (Representation.ind (Field.absoluteGaloisGroup.map f).toMonoidHom (matRep r.toMonoidHom)))

end PL0Global

/-! ## PL.0 -/

section PL0

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  [CharZero E]
variable {l : ℕ} [Fact l.Prime] [ResChar E l] [IsLargeFor F E]
variable {n : ℕ}

/-! ### PL.0/ordinary-of-weight: Ordinary Galois representations of weight λ -/

-- `IsOrdinaryOfWeight` (with its local form `IsOrdinaryOfWeightAt`) is in the shared definitions
-- of the preamble. The local notions of BLGGT14 §1.4 are `IsOrdinaryWithExponents`,
-- `IsSsOrdinaryWithExponents`, `IsOrdinaryLocal` and `IsCrOrdinary` above.

/-- For `v | l` an ordinary `ρ` of weight `λ` has a `G_{F_v}`-stable full flag
`0 = W_0 ⊂ W_1 ⊂ ⋯ ⊂ W_n = E^n` on whose graded pieces `G_{F_v}` acts through characters `ψ_i`
(`ψ_1` on the invariant line) satisfying the finite-order condition with exponents
`λ_{τ,n-i+1} + i - 1`. -/
theorem IsOrdinaryOfWeight.exists_flag {ρ : Gal F →ₜ* GL (Fin n) E}
    {lam : (F →+* E) → Fin n → ℤ} (h : IsOrdinaryOfWeight l ρ lam) (v : Place F)
    (hv : v.Above l) :
    ∃ (W : Fin (n + 1) → Submodule E (Fin n → E)) (ψ : Fin n → Gal v.Fv →ₜ* Eˣ),
      (∀ i, Module.finrank E (W i) = i) ∧ Monotone W ∧
      (∀ (i : Fin n) (σ : Gal v.Fv), ∀ w ∈ W i.succ,
        (resPlace ρ v σ : Matrix (Fin n) (Fin n) E).mulVec w - (ψ i σ : E) • w ∈ W i.castSucc) ∧
      ∀ i : Fin n,
        HasFiniteOrderOnUnits (ψ i) (fun τ => lam (τ.comp v.emb) (Fin.rev i) + (i : ℤ)) := by
  sorry

/-- For dominant `λ`: `ρ` is ordinary of weight `λ` if and only if for every `v | l` the
restriction `ρ|G_{F_v}` is ordinary in the sense of BLGGT14 §1.4 with exponents
`b_{τ,i} = -(λ_{τ,i} + n - i)`. -/
theorem isOrdinaryOfWeight_iff_local (ρ : Gal F →ₜ* GL (Fin n) E)
    (lam : (F →+* E) → Fin n → ℤ) (hlam : IsDominant lam) :
    IsOrdinaryOfWeight l ρ lam ↔ ∀ v : Place F, v.Above l →
      IsOrdinaryWithExponents (resPlace ρ v)
        (fun τ i => -(lam (τ.comp v.emb) i + (n : ℤ) - 1 - (i : ℤ))) := by
  sorry

/-- If `F'/F` is finite then `ρ|G_{F'}` is ordinary of weight `λ_{F'}`,
`(λ_{F'})_τ = λ_{τ|F}`. -/
theorem IsOrdinaryOfWeight.restrict {ρ : Gal F →ₜ* GL (Fin n) E}
    {lam : (F →+* E) → Fin n → ℤ} (h : IsOrdinaryOfWeight l ρ lam) (F' : Type) [Field F']
    [NumberField F'] [Algebra F F'] :
    IsOrdinaryOfWeight l (resField ρ (algebraMap F F'))
      (fun τ => lam (τ.comp (algebraMap F F'))) := by
  sorry

/-- For a character `ψ` of `G_F` that is Hodge–Tate above `l` with `HT_τ(ψ) = {h_τ}`, the twist
`ρ ⊗ ψ` is ordinary of weight `(λ_{τ,i} + h_τ)`. -/
theorem IsOrdinaryOfWeight.twist {ρ : Gal F →ₜ* GL (Fin n) E} {lam : (F →+* E) → Fin n → ℤ}
    (h : IsOrdinaryOfWeight l ρ lam) (ψ : Gal F →ₜ* Eˣ) (ht : (F →+* E) → ℤ)
    (hψ : ∀ v : Place F, v.Above l →
      HasHodgeTate (resPlace (charRep ψ) v) (fun τ => {ht (τ.comp v.emb)})) :
    IsOrdinaryOfWeight l (twistRep ρ ψ) (fun τ i => lam τ i + ht τ) := by
  sorry

/-- `ρ^∨` is ordinary of weight `μ`, `μ_{τ,i} = -λ_{τ,n+1-i} - (n - 1)`. -/
theorem IsOrdinaryOfWeight.dual {ρ : Gal F →ₜ* GL (Fin n) E} {lam : (F →+* E) → Fin n → ℤ}
    (h : IsOrdinaryOfWeight l ρ lam) :
    IsOrdinaryOfWeight l (dualRep ρ) (fun τ i => -lam τ (Fin.rev i) - ((n : ℤ) - 1)) := by
  sorry

/-- An ordinary `ρ` of dominant weight `λ` is de Rham at every `v | l` with
`HT_τ(ρ|G_{F_v}) = {λ_{τ,i} + n - i}`, and it is semistable at `v` when, in some triangular form,
every `ψ_{v,i} ∘ Art` equals the algebraic character on all of `𝒪_{F_v}^×`. -/
theorem IsOrdinaryOfWeight.isDeRham {ρ : Gal F →ₜ* GL (Fin n) E}
    {lam : (F →+* E) → Fin n → ℤ} (hlam : IsDominant lam) (h : IsOrdinaryOfWeight l ρ lam)
    (v : Place F) (hv : v.Above l) :
    HasHodgeTate (resPlace ρ v)
        (fun τ => (Finset.univ : Finset (Fin n)).val.map
          fun i => lam (τ.comp v.emb) i + (n : ℤ) - 1 - (i : ℤ)) ∧
      ∀ (ψ : Fin n → Gal v.Fv →ₜ* Eˣ) (ρ' : Gal v.Fv → GL (Fin n) E),
        Conj (resPlace ρ v : Gal v.Fv → GL (Fin n) E) ρ' →
        IsUpperTriangularWith ρ' (fun i σ => ψ i σ) →
        (∀ (i : Fin n) (u : (𝒪[v.Fv])ˣ), artinChar (ψ i) (unitOfInt u) *
          algChar (fun τ => lam (τ.comp v.emb) (Fin.rev i) + (i : ℤ)) (unitOfInt u) = 1) →
        (semistable v.Fv E n).Holds (resPlace ρ v) := by
  sorry

/-- BLGGT14 §1.4: an ordinary `ρ_v` with exponents `b` is de Rham with
`HT_τ(ρ_v) = {-b_{τ,1}, …, -b_{τ,n}}`. -/
theorem IsOrdinaryWithExponents.hasHodgeTate {K : Type} [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K] [ResChar K l]
    {ρ : Gal K →ₜ* GL (Fin n) E} {b : (K →+* E) → Fin n → ℤ}
    (h : IsOrdinaryWithExponents ρ b) :
    HasHodgeTate ρ (fun τ => (Finset.univ : Finset (Fin n)).val.map fun i => -b τ i) := by
  sorry

/-- BLGGT14 §1.4: an ss-ordinary `ρ_v` is semistable. -/
theorem IsSsOrdinaryWithExponents.isSemistable {K : Type} [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K] [ResChar K l]
    {ρ : Gal K →ₜ* GL (Fin n) E} {b : (K →+* E) → Fin n → ℤ}
    (h : IsSsOrdinaryWithExponents ρ b) : (semistable K E n).Holds ρ := by
  sorry

-- test: ordinary_cyclotomic
example :
    IsOrdinaryOfWeight l (charRep (cyclo E ℚ)) (fun _ _ => -1) ∧
      ∀ v : Place ℚ, v.Above l →
        HasHodgeTate (resPlace (charRep (cyclo E ℚ)) v) (fun _ => {-1}) := by
  sorry

-- test: ordinary_tate_curve
example (W : WeierstrassCurve ℚ) [W.IsElliptic] (v : Place ℚ) (hv : v.Above l)
    (hW : (splitMultiplicative v.Fv).Holds (W.map v.emb)) :
    (∃ ρ' : Gal v.Fv → GL (Fin 2) E,
        Conj (resPlace (tateRep W E) v : Gal v.Fv → GL (Fin 2) E) ρ' ∧
        IsUpperTriangularWith ρ' (fun i σ => if i = 0 then cyclo E v.Fv σ else 1)) ∧
      IsOrdinaryOfWeightAt (resPlace (tateRep W E) v) (fun _ _ => -1) ∧
      HasHodgeTate (resPlace (tateRep W E) v) (fun _ => {0, -1}) := by
  sorry

-- test: ordinary_rank_one
example (ψ : Gal F →ₜ* Eˣ) (lam : (F →+* E) → Fin 1 → ℤ) :
    IsOrdinaryOfWeight l (charRep ψ) lam ↔ ∀ v : Place F, v.Above l →
      HasHodgeTate (resPlace (charRep ψ) v) (fun τ => {lam (τ.comp v.emb) 0}) := by
  sorry

-- second half: a character of finite order is ordinary of weight `0`
-- test: ordinary_rank_one
example (ψ : Gal F →ₜ* Eˣ) (m : ℕ) (hm : 0 < m) (hψ : ∀ σ, ψ σ ^ m = 1) :
    IsOrdinaryOfWeight l (charRep ψ) (fun _ _ => 0) := by
  sorry

-- test: not_ordinary_supersingular
example (W : WeierstrassCurve ℚ) [W.IsElliptic] (v : Place ℚ) (hv : v.Above l)
    (hW : (goodSupersingular v.Fv).Holds (W.map v.emb)) :
    (crystalline v.Fv E 2).Holds (resPlace (tateRep W E) v) ∧
      HasHodgeTate (resPlace (tateRep W E) v) (fun _ => {0, -1}) ∧
      ∀ μ : (v.Fv →+* E) → Fin 2 → ℤ, ¬ IsOrdinaryOfWeightAt (resPlace (tateRep W E) v) μ := by
  sorry

-- test: ordinary_weight_unique
example (ρ : Gal F →ₜ* GL (Fin n) E) (lam lam' : (F →+* E) → Fin n → ℤ)
    (hlam : IsDominant lam) (hlam' : IsDominant lam') (h : IsOrdinaryOfWeight l ρ lam)
    (h' : IsOrdinaryOfWeight l ρ lam') : lam = lam' := by
  sorry

/-! ### PL.0/iota-ordinary-principal-series: Principal-series characterisation of ι-ordinarity -/

/-- PL.0/iota-ordinary-principal-series (Clozel–Thorne, Lemma 2.5, with Geraghty's
Lemmas 5.1.1 and 5.1.3; Thorne 2015, Lemma 2.3 in the cuspidal polarized case). Let `π` be
regular algebraic of weight `ι_* λ` over a CM or totally real field, generic at every `v | l`,
with `E` containing the values of the inducing characters. Then `π` is `ι`-ordinary (the notion
imported from PA.2) if and only if at every `v | l` there are smooth characters
`χ_{v,1}, …, χ_{v,n}` of `F_v^×` with
`val_l(χ_{v,i}(ϖ_v)) = e_v⁻¹ ∑_τ (λ_{τ,n+1-i} - (n-1)/2 + i - 1)` for every uniformizer, such
that `π_v` is the generic subquotient of the normalised induction of `ι χ_{v,1} ⊗ ⋯ ⊗ ι χ_{v,n}`.
Genericity cannot be dropped: the trivial representation of `GL_n`, `n ≥ 2`, is not
`ι`-ordinary. -/
theorem iota_ordinary_principal_series (hF : IsCMField F ∨ IsTotallyReal F) (ι : E →+* ℂ)
    (lam : (F →+* E) → Fin n → ℤ) (hlam : IsDominant lam) (π : RegAlg F n)
    (hπ : π.HasWeight ι lam)
    (hgen : ∀ v : Place F, v.Above l → (genericIrrep v.Fv n).Holds (π.component v))
    (hE : ∀ v : Place F, v.Above l → ContainsInducingCharacters ι (π.component v)) :
    (iotaOrdinary F E n ι).Holds π ↔
      ∀ v : Place F, v.Above l → ∃ χ : Fin n → (v.Fv)ˣ →* Eˣ,
        (∀ i, IsSmoothChar (χ i)) ∧
        (∀ (ϖ : (v.Fv)ˣ) (i : Fin n), IsUniformizer ϖ →
          HasValuation l ((χ i ϖ : Eˣ) : E)
            (∑ᶠ τ : v.Fv →+* E,
              (2 * lam (τ.comp v.emb) (Fin.rev i) - ((n : ℤ) - 1) + 2 * (i : ℤ)))
            (2 * absRamIndex v.Fv l)) ∧
        (genericSubquotient fun i => (Units.map (ι : E →* ℂ)).comp (χ i)).Holds
          (π.component v) := by
  sorry

/-- PL.0/iota-ordinary-principal-series, the valuations in condition (1) increase strictly with
`i` (Clozel–Thorne, Lemma 2.5): for dominant `λ` and `v | l` the numerators
`∑_τ (2 λ_{τ,n+1-i} - (n-1) + 2(i-1))` are strictly increasing. -/
theorem iota_ordinary_principal_series_strictMono (lam : (F →+* E) → Fin n → ℤ)
    (hlam : IsDominant lam) (v : Place F) (hv : v.Above l) :
    StrictMono fun i : Fin n => ∑ᶠ τ : v.Fv →+* E,
      (2 * lam (τ.comp v.emb) (Fin.rev i) - ((n : ℤ) - 1) + 2 * (i : ℤ)) := by
  sorry

/-- PL.0/iota-ordinary-principal-series, uniqueness (Geraghty, Lemma 5.1.3; remark after
Thorne 2015, Lemma 2.3): the tuple `(χ_{v,1}, …, χ_{v,n})` with the valuations and the
subquotient property of `iota_ordinary_principal_series` is determined by `ι` and `π_v`. -/
theorem iota_ordinary_principal_series_unique (hF : IsCMField F ∨ IsTotallyReal F) (ι : E →+* ℂ)
    (lam : (F →+* E) → Fin n → ℤ) (hlam : IsDominant lam) (π : RegAlg F n)
    (hπ : π.HasWeight ι lam) (v : Place F) (hv : v.Above l)
    (χ χ' : Fin n → (v.Fv)ˣ →* Eˣ) (hχ : ∀ i, IsSmoothChar (χ i))
    (hχ' : ∀ i, IsSmoothChar (χ' i))
    (hval : ∀ (ϖ : (v.Fv)ˣ) (i : Fin n), IsUniformizer ϖ →
      HasValuation l ((χ i ϖ : Eˣ) : E)
        (∑ᶠ τ : v.Fv →+* E, (2 * lam (τ.comp v.emb) (Fin.rev i) - ((n : ℤ) - 1) + 2 * (i : ℤ)))
        (2 * absRamIndex v.Fv l))
    (hval' : ∀ (ϖ : (v.Fv)ˣ) (i : Fin n), IsUniformizer ϖ →
      HasValuation l ((χ' i ϖ : Eˣ) : E)
        (∑ᶠ τ : v.Fv →+* E, (2 * lam (τ.comp v.emb) (Fin.rev i) - ((n : ℤ) - 1) + 2 * (i : ℤ)))
        (2 * absRamIndex v.Fv l))
    (hsub : (genericSubquotient fun i => (Units.map (ι : E →* ℂ)).comp (χ i)).Holds
      (π.component v))
    (hsub' : (genericSubquotient fun i => (Units.map (ι : E →* ℂ)).comp (χ' i)).Holds
      (π.component v)) :
    χ = χ' := by
  sorry

/-- PL.0/iota-ordinary-principal-series, the ordinary part (Geraghty, Lemma 5.1.3): for an
`ι`-ordinary `π` with generic components above `l`, the ordinary part of
`(ι⁻¹ π_v)^{Iw(v^{b,b})}` has dimension at most one for every `b`, and dimension one for some
`b`. -/
theorem iota_ordinary_principal_series_dim (hF : IsCMField F ∨ IsTotallyReal F) (ι : E →+* ℂ)
    (π : RegAlg F n)
    (hgen : ∀ v : Place F, v.Above l → (genericIrrep v.Fv n).Holds (π.component v))
    (hord : (iotaOrdinary F E n ι).Holds π) (v : Place F) (hv : v.Above l) :
    (∀ b, iotaOrdinaryPartDim ι π v b ≤ 1) ∧ ∃ b, iotaOrdinaryPartDim ι π v b = 1 := by
  sorry

/-- PL.0/iota-ordinary-principal-series, necessity of genericity (Clozel–Thorne, Lemma 2.5(2)):
the trivial representation of `GL_n(𝔸_F)`, `n ≥ 2`, has weight `0` and non-generic components
above `l`, and it is not `ι`-ordinary. -/
theorem iota_ordinary_principal_series_trivial (hF : IsCMField F ∨ IsTotallyReal F) (hn : 2 ≤ n)
    (ι : E →+* ℂ) :
    (RegAlg.trivialRep F n).HasWeight ι (fun _ _ => 0) ∧
      (∀ v : Place F, v.Above l →
        ¬ (genericIrrep v.Fv n).Holds ((RegAlg.trivialRep F n).component v)) ∧
      ¬ (iotaOrdinary F E n ι).Holds (RegAlg.trivialRep F n) := by
  sorry

/-! ### PL.0/automorphic-polarized-representation: Automorphic polarized representations and
their levels -/

-- `IsAutomorphic`, `IsAutomorphicOfLevelPrimeTo`, `IsAutomorphicOfLevelPotentiallyPrimeTo` and
-- `IsOrdinarilyAutomorphic` are in the shared definitions of the preamble. The forms for `r`
-- alone and for mod `l` pairs are `IsAutomorphicOfWeight` and `IsResiduallyAutomorphic` above.

/-- Each of the four notions of automorphy is the same for every choice of `ι`
(BLGGT14 §2.1, from Clozel's theorem on `Aut(ℂ)`-conjugates). -/
theorem IsAutomorphic.indep_iota (hF : IsCMField F ∨ IsTotallyReal F) (ι ι' : E →+* ℂ)
    (r : Gal F →ₜ* GL (Fin n) E) (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) :
    (IsAutomorphic ι r μ ↔ IsAutomorphic ι' r μ) ∧
      (IsAutomorphicOfLevelPrimeTo l ι r μ ↔ IsAutomorphicOfLevelPrimeTo l ι' r μ) ∧
      (IsAutomorphicOfLevelPotentiallyPrimeTo l ι r μ ↔
        IsAutomorphicOfLevelPotentiallyPrimeTo l ι' r μ) ∧
      (IsOrdinarilyAutomorphic ι r μ ↔ IsOrdinarilyAutomorphic ι' r μ) := by
  sorry

/-- If `(r, μ)` is automorphic then so is its residual pair `(r̄^ss, μ̄)`: for an invariant
lattice `r₀` of `r`, any continuous semisimple `r̄` with the characteristic polynomials of the
reduction of `r₀`, and the reduction `μ̄` of `μ`. -/
theorem IsAutomorphic.residual (hF : IsCMField F ∨ IsTotallyReal F) {ι : E →+* ℂ}
    {r : Gal F →ₜ* GL (Fin n) E} {μ : Gal (maximalRealSubfield F) →ₜ* Eˣ}
    (h : IsAutomorphic ι r μ) (r₀ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hr₀ : Conj (r : Gal F → GL (Fin n) E) (generic r₀.toMonoidHom))
    (rbar : Gal F →* GL (Fin n) 𝓀[E]) (hc : IsContinuousResidual rbar)
    (hss : IsSemisimpleRep rbar)
    (hcp : ∀ σ, (rbar σ : Matrix (Fin n) (Fin n) 𝓀[E]).charpoly =
      (reduction r₀.toMonoidHom σ : Matrix (Fin n) (Fin n) 𝓀[E]).charpoly)
    (μbar : Gal (maximalRealSubfield F) →* (𝓀[E])ˣ) (hμ : IsReductionOfChar (⇑μ) (⇑μbar)) :
    IsResiduallyAutomorphic ι rbar μbar := by
  sorry

/-- An automorphic `(r, μ)` is totally odd: the sign `ε_v` is `1` at every infinite place, and
`μ(c_v)` is independent of `v | ∞` (BLGGT14, Theorem 2.1.1(1)). -/
theorem IsAutomorphic.totallyOdd (hF : IsCMField F ∨ IsTotallyReal F) {ι : E →+* ℂ}
    {r : Gal F →ₜ* GL (Fin n) E} {μ : Gal (maximalRealSubfield F) →ₜ* Eˣ}
    (h : IsAutomorphic ι r μ) :
    IsTotallyOdd r μ ∧ ∀ v v' : InfinitePlace (maximalRealSubfield F),
      μ (conjAt (maximalRealSubfield F) v) = μ (conjAt (maximalRealSubfield F) v') := by
  sorry

/-- If `(r, μ)` is ordinarily automorphic through `π` then `r` is `ι`-ordinarily automorphic in
the sense of PA.2/ordinarily-automorphic-representation, through the same `π` with its
polarization forgotten. -/
theorem IsOrdinarilyAutomorphic.forget_polarization (hF : IsCMField F ∨ IsTotallyReal F)
    {ι : E →+* ℂ} {r : Gal F →ₜ* GL (Fin n) E} {μ : Gal (maximalRealSubfield F) →ₜ* Eˣ}
    (π : RACP F n) (hπ : IsAutomorphicVia ι r μ π)
    (hord : (iotaOrdinary F E n ι).Holds π.toRegAlg) :
    (ordinarilyAutomorphicVia F E n ι).Holds (r, π.toRegAlg) := by
  sorry

-- test: isAutomorphic_rank_one
example [IsCMField F] (ι : E →+* ℂ) (ψ : Gal F →ₜ* Eˣ)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (hψ : IsAlgebraicChar l ψ)
    (hψμ : IsConjNorm ψ.toMonoidHom μ.toMonoidHom)
    (hodd : ∀ v : InfinitePlace (maximalRealSubfield F),
      μ (conjAt (maximalRealSubfield F) v) = -1) :
    IsAutomorphic ι (charRep ψ) μ := by
  sorry

-- test: not_isAutomorphic_of_not_totallyOdd
example (hF : IsCMField F ∨ IsTotallyReal F) (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (hpol : IsPolarized r μ)
    (v : InfinitePlace (maximalRealSubfield F))
    (hv : ¬ (polarizedWithSign F E n v 1).Holds (r, μ)) : ¬ IsAutomorphic ι r μ := by
  sorry

-- test: levelPrimeTo_crystalline
example (hF : IsCMField F ∨ IsTotallyReal F) (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (h : IsAutomorphicOfLevelPrimeTo l ι r μ)
    (v : Place F) (hv : v.Above l) : (crystalline v.Fv E n).Holds (resPlace r v) := by
  sorry

-- test: ordinarilyAutomorphic_ordinary
example (hF : IsCMField F ∨ IsTotallyReal F) (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (π : RACP F n) (hπ : IsAutomorphicVia ι r μ π)
    (hord : (iotaOrdinary F E n ι).Holds π.toRegAlg) (lam : (F →+* E) → Fin n → ℤ)
    (hw : π.HasWeight ι lam) : IsOrdinaryOfWeight l r lam := by
  sorry

/-! ### PL.0/iota-ordinary-implies-ordinary: ι-ordinary automorphic representations have ordinary
Galois representations -/

/-- PL.0/iota-ordinary-implies-ordinary (Thorne 2015, Corollary 2.6; BLGGT14 §2.1,
remark (6)). For a regular algebraic cuspidal polarized `(π, χ)` of weight `ι_* λ` over a CM or
totally real field that is `ι`-ordinary, `r_{l,ι}(π)` is ordinary of weight `λ`. The reduction
from totally real to CM fields uses the import PA.2/iota-ordinary-soluble-base-change. -/
theorem iota_ordinary_implies_ordinary (hF : IsCMField F ∨ IsTotallyReal F) (ι : E →+* ℂ)
    (lam : (F →+* E) → Fin n → ℤ) (π : RACP F n) (hw : π.HasWeight ι lam)
    (hord : (iotaOrdinary F E n ι).Holds π.toRegAlg) :
    IsOrdinaryOfWeight l (π.galoisRep ι) lam := by
  sorry

/-! ### PL.0/ordinary-implies-iota-ordinary: Ordinary Galois representations come from ι-ordinary
automorphic representations -/

/-- PL.0/ordinary-implies-iota-ordinary (BLGGT14 §2.1, remark (7), from Geraghty's
Lemmas 5.1.6 and 5.2.1). For a regular algebraic cuspidal polarized `(π, χ)` of level potentially
prime to `l` over a CM or totally real field: if `r_{l,ι}(π)|G_{F_v}` is ordinary for every
`v | l`, then `π` is `ι`-ordinary. The descent of `ι`-ordinarity along a soluble base change is
the import PA.2/iota-ordinary-soluble-base-change. -/
theorem ordinary_implies_iota_ordinary (hF : IsCMField F ∨ IsTotallyReal F) (ι : E →+* ℂ)
    (π : RACP F n) (hlev : (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg)
    (hord : ∀ v : Place F, v.Above l → IsOrdinaryLocal (resPlace (π.galoisRep ι) v)) :
    (iotaOrdinary F E n ι).Holds π.toRegAlg := by
  sorry

/-- PL.0/ordinary-implies-iota-ordinary, the consequence for pairs (BLGGT14 §2.1): a polarized
`(r, μ)` that is automorphic of level potentially prime to `l` and ordinary at every `v | l` is
ordinarily automorphic. -/
theorem ordinary_implies_iota_ordinary_automorphic (hF : IsCMField F ∨ IsTotallyReal F)
    (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E) (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ)
    (h : IsAutomorphicOfLevelPotentiallyPrimeTo l ι r μ)
    (hord : ∀ v : Place F, v.Above l → IsOrdinaryLocal (resPlace r v)) :
    IsOrdinarilyAutomorphic ι r μ := by
  sorry

/-! ### PL.0/steinberg-weight-zero-iota-ordinary: Weight-zero Steinberg representations are
ι-ordinary -/

/-- PL.0/steinberg-weight-zero-iota-ordinary (Newton–Thorne 2026, Lemma 2.6; Geraghty,
Lemma 5.1.5 of the preprint). A regular algebraic cuspidal polarized `π` of weight `0` over a
totally real or CM field whose component at every place above the prime `l` is a character twist
of the Steinberg representation is `ι`-ordinary for every `ι`. The local criterion is the import
PA.2/twisted-steinberg-ordinarity-criterion. -/
theorem steinberg_weight_zero_iota_ordinary (hF : IsCMField F ∨ IsTotallyReal F) (π : RACP F n)
    (hw : ∀ (τ : F →+* ℂ) (i : Fin n), π.weight τ i = 0)
    (hSt : ∀ v : Place F, v.Above l → (steinbergCharTwist v.Fv n).Holds (π.component v))
    (ι : E →+* ℂ) : (iotaOrdinary F E n ι).Holds π.toRegAlg := by
  sorry

/-! ### PL.0/isobaric-sum-iota-ordinary: Ordinarity of a regular algebraic isobaric sum -/

/-- PL.0/isobaric-sum-iota-ordinary, regularity of the summands (Clozel–Thorne §2.1): if
`π₁, π₂` are cuspidal conjugate self-dual and `π₁ ⊞ π₂` is regular algebraic, then
`π₁ |det|^{(n₁-n)/2}` and `π₂ |det|^{(n₂-n)/2}` are regular algebraic. -/
theorem isobaric_sum_iota_ordinary_summands [IsCMField F] {n₁ n₂ : ℕ} (π₁ : AutRep F n₁)
    (π₂ : AutRep F n₂) (h₁ : (cuspidalConjSelfDual F n₁).Holds π₁)
    (h₂ : (cuspidalConjSelfDual F n₂).Holds π₂) (P : RegAlg F (n₁ + n₂))
    (hP : P.toAutRep = π₁.isobaricSum π₂) :
    (∃ σ₁ : RegAlg F n₁, σ₁.toAutRep = π₁.absDetTwist ((n₁ : ℤ) - (n₁ + n₂ : ℕ))) ∧
      ∃ σ₂ : RegAlg F n₂, σ₂.toAutRep = π₂.absDetTwist ((n₂ : ℤ) - (n₁ + n₂ : ℕ)) := by
  sorry

/-- PL.0/isobaric-sum-iota-ordinary (Clozel–Thorne, Lemma 2.6). Let `F` be imaginary CM,
`π₁, π₂` cuspidal conjugate self-dual with `P = π₁ ⊞ π₂` regular algebraic, `σ_i` the regular
algebraic twists `π_i |det|^{(n_i-n)/2}`, and `rec(π_{1,v})|_{ℂ^×} = ⊕ (z/z̄)^{b_{τ,j}}`,
`rec(π_{2,v})|_{ℂ^×} = ⊕ (z/z̄)^{c_{τ,j}}` with `b_τ`, `c_τ` decreasing. Let `w_τ` be the
permutation sorting the concatenation `d_τ = (b_τ, c_τ)` into decreasing order. Then `P` is
`ι`-ordinary if and only if `σ₁` and `σ₂` are `ι`-ordinary and `w_τ` depends only on the place
of `F` induced by `ι⁻¹ τ`. -/
theorem isobaric_sum_iota_ordinary [IsCMField F] (ι : E →+* ℂ) {n₁ n₂ : ℕ} (π₁ : AutRep F n₁)
    (π₂ : AutRep F n₂) (h₁ : (cuspidalConjSelfDual F n₁).Holds π₁)
    (h₂ : (cuspidalConjSelfDual F n₂).Holds π₂) (P : RegAlg F (n₁ + n₂))
    (hP : P.toAutRep = π₁.isobaricSum π₂)
    (σ₁ : RegAlg F n₁) (hσ₁ : σ₁.toAutRep = π₁.absDetTwist ((n₁ : ℤ) - (n₁ + n₂ : ℕ)))
    (σ₂ : RegAlg F n₂) (hσ₂ : σ₂.toAutRep = π₂.absDetTwist ((n₂ : ℤ) - (n₁ + n₂ : ℕ)))
    (b : (F →+* ℂ) → Fin n₁ → ℚ) (c : (F →+* ℂ) → Fin n₂ → ℚ)
    (hb : ∀ τ, StrictAnti (b τ)) (hc : ∀ τ, StrictAnti (c τ))
    (hπ₁ : ∀ τ, π₁.archParam τ =
      (Finset.univ : Finset (Fin n₁)).val.map fun j => ((b τ j : ℂ), -(b τ j : ℂ)))
    (hπ₂ : ∀ τ, π₂.archParam τ =
      (Finset.univ : Finset (Fin n₂)).val.map fun j => ((c τ j : ℂ), -(c τ j : ℂ)))
    (w : (F →+* ℂ) → Equiv.Perm (Fin (n₁ + n₂)))
    (hw : ∀ τ, StrictAnti (Fin.append (b τ) (c τ) ∘ w τ)) :
    (iotaOrdinary F E (n₁ + n₂) ι).Holds P ↔
      (iotaOrdinary F E n₁ ι).Holds σ₁ ∧ (iotaOrdinary F E n₂ ι).Holds σ₂ ∧
        ∀ τ τ' : F →+* E, InducesSamePlace τ τ' → w (ι.comp τ) = w (ι.comp τ') := by
  sorry

/-! ### PL.0/automorphy-under-twist: Automorphy is invariant under algebraic twists -/

/-- PL.0/automorphy-under-twist (BLGGT14, Lemma 2.2.1). Let `F` be CM or totally real, `ψ` an
algebraic character of `G_F`, and `φ` the composite of `ψ` with the transfer if `F` is imaginary,
`φ = ψ²` if `F` is totally real. Then `(r, μ)` is automorphic if and only if `(r ⊗ ψ, μ φ)` is;
the same holds for "automorphic of level potentially prime to `l`" and for "ordinarily
automorphic". -/
theorem automorphy_under_twist (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (ψ : Gal F →ₜ* Eˣ) (hψ : IsAlgebraicChar l ψ)
    (φ : Gal (maximalRealSubfield F) →ₜ* Eˣ)
    (hφ : (IsCMField F ∧ IsTransferOf ψ.toMonoidHom φ.toMonoidHom) ∨
      (IsTotallyReal F ∧ ∀ σ : Gal F, φ (toPlus F σ) = ψ σ ^ 2)) :
    (IsAutomorphic ι r μ ↔ IsAutomorphic ι (twistRep r ψ) (μ * φ)) ∧
      (IsAutomorphicOfLevelPotentiallyPrimeTo l ι r μ ↔
        IsAutomorphicOfLevelPotentiallyPrimeTo l ι (twistRep r ψ) (μ * φ)) ∧
      (IsOrdinarilyAutomorphic ι r μ ↔ IsOrdinarilyAutomorphic ι (twistRep r ψ) (μ * φ)) := by
  sorry

/-- PL.0/automorphy-under-twist, level prime to `l` (BLGGT14, Lemma 2.2.1 as used at the end
of the proof of Proposition 4.1.1): if moreover `ψ` is crystalline at every place above `l`, then
`(r, μ)` is automorphic of level prime to `l` if and only if `(r ⊗ ψ, μ φ)` is. -/
theorem automorphy_under_twist_level_prime (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (ψ : Gal F →ₜ* Eˣ)
    (hψ : ∀ v : Place F, v.Above l → (crystalline v.Fv E 1).Holds (resPlace (charRep ψ) v))
    (φ : Gal (maximalRealSubfield F) →ₜ* Eˣ)
    (hφ : (IsCMField F ∧ IsTransferOf ψ.toMonoidHom φ.toMonoidHom) ∨
      (IsTotallyReal F ∧ ∀ σ : Gal F, φ (toPlus F σ) = ψ σ ^ 2)) :
    IsAutomorphicOfLevelPrimeTo l ι r μ ↔
      IsAutomorphicOfLevelPrimeTo l ι (twistRep r ψ) (μ * φ) := by
  sorry

/-! ### PL.0/soluble-descent: Soluble base change and descent of automorphy -/

section SolubleDescent

variable {M : Type} [Field M] [NumberField M] [Algebra F M] [IsGalois F M]

/-- PL.0/soluble-descent (BLGGT14, Lemma 2.2.2; Thorne 2015, Lemma 2.7 for CM fields). Let
`M/F` be a soluble Galois extension with `M` CM or totally real and `(r, μ)` a polarized `l`-adic
representation of `G_F` with `r|G_M` irreducible. Then `(r, μ)` is automorphic if and only if
`(r|G_M, μ|G_{M⁺})` is, and likewise for "automorphic of level potentially prime to `l`". Base
change and descent for `GL_n` are the imports PA.5/soluble-base-change-and-descent and ET.7a. -/
theorem soluble_descent (hsol : Group.IsSolvable (M ≃ₐ[F] M))
    (hM : IsCMField M ∨ IsTotallyReal M) (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (hpol : IsPolarized r μ)
    (hirr : IsAbsIrred (resField r (algebraMap F M) : Gal M → GL (Fin n) E)) :
    (IsAutomorphic ι r μ ↔
        IsAutomorphic ι (resField r (algebraMap F M)) (resField μ (plusMap (algebraMap F M)))) ∧
      (IsAutomorphicOfLevelPotentiallyPrimeTo l ι r μ ↔
        IsAutomorphicOfLevelPotentiallyPrimeTo l ι (resField r (algebraMap F M))
          (resField μ (plusMap (algebraMap F M)))) := by
  sorry

/-- PL.0/soluble-descent, level prime to `l`: in the situation of `soluble_descent`, if every
place of `F` above `l` splits completely in `M`, then level prime to `l` descends from `M` to
`F`. -/
theorem soluble_descent_level_prime (hsol : Group.IsSolvable (M ≃ₐ[F] M))
    (hM : IsCMField M ∨ IsTotallyReal M) (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (hpol : IsPolarized r μ)
    (hirr : IsAbsIrred (resField r (algebraMap F M) : Gal M → GL (Fin n) E))
    (hsplit : ∀ v : Place F, v.Above l → v.SplitsCompletelyIn M)
    (h : IsAutomorphicOfLevelPrimeTo l ι (resField r (algebraMap F M))
      (resField μ (plusMap (algebraMap F M)))) :
    IsAutomorphicOfLevelPrimeTo l ι r μ := by
  sorry

/-- PL.0/soluble-descent, weights (Thorne 2012, Lemma 1.2, quoting BLGHT11, Lemma 1.4). Let
`M/F` be a soluble Galois extension of imaginary CM fields, `(r, μ)` polarized with `r|G_M`
irreducible and `μ(c_v)` independent of `v | ∞`. If `r|G_M` is automorphic of dominant weight
`ν`, then `ν = λ_M` for a dominant `λ`, and `r` is automorphic of weight `λ`. -/
theorem soluble_descent_weight [IsCMField F] [IsCMField M] [IsLargeFor M E]
    (hsol : Group.IsSolvable (M ≃ₐ[F] M)) (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) E)
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (hpol : IsPolarized r μ)
    (hirr : IsAbsIrred (resField r (algebraMap F M) : Gal M → GL (Fin n) E))
    (hμ : ∀ v v' : InfinitePlace (maximalRealSubfield F),
      μ (conjAt (maximalRealSubfield F) v) = μ (conjAt (maximalRealSubfield F) v'))
    (ν : (M →+* E) → Fin n → ℤ) (hν : IsDominant ν)
    (h : IsAutomorphicOfWeight ι (resField r (algebraMap F M)) ν) :
    ∃ lam : (F →+* E) → Fin n → ℤ, IsDominant lam ∧
      (∀ τ : M →+* E, ν τ = lam (τ.comp (algebraMap F M))) ∧
      IsAutomorphicOfWeight ι r lam := by
  sorry

/-! ### PL.0/induction-descent: Automorphy of an induced representation descends -/

/-- PL.0/induction-descent (BLGGT14, Lemma 2.2.4). Let `F` be CM or totally real, `M/F` a
soluble Galois extension of degree `m` with `M` CM or totally real, `r : G_M → GL_n(E)`
irreducible and `μ` a character of `G_{F⁺}` such that `(Ind_{G_M}^{G_F} r, μ)` is an automorphic
polarized representation of `G_F`. Then `(r, μ|G_{M⁺})` is automorphic and polarized. -/
theorem induction_descent (hF : IsCMField F ∨ IsTotallyReal F)
    (hsol : Group.IsSolvable (M ≃ₐ[F] M)) (hM : IsCMField M ∨ IsTotallyReal M) (ι : E →+* ℂ)
    (r : Gal M →ₜ* GL (Fin n) E) (hirr : IsAbsIrred (r : Gal M → GL (Fin n) E))
    (μ : Gal (maximalRealSubfield F) →ₜ* Eˣ)
    (R : Gal F →ₜ* GL (Fin (Module.finrank F M * n)) E)
    (hR : IsInducedFrom (algebraMap F M) R r) (hpol : IsPolarized R μ)
    (haut : IsAutomorphic ι R μ) :
    IsAutomorphic ι r (resField μ (plusMap (algebraMap F M))) ∧
      IsPolarized r (resField μ (plusMap (algebraMap F M))) := by
  sorry

end SolubleDescent

/-- PL.0/induction-descent, the archimedean input (BLGGT14, Lemma 2.2.3): an irreducible
unitary admissible module for `GL_n(ℝ)` or `GL_n(ℂ)` with half-integral Harish-Chandra parameter
satisfies `π^c ≅ π^∨`. -/
theorem induction_descent_archimedean (n : ℕ) :
    (∀ π : ArchRep ℝ n, (archUnitary ℝ n).Holds π → (archHalfIntegral ℝ n).Holds π →
        (archConjDual ℝ n).Holds π) ∧
      ∀ π : ArchRep ℂ n, (archUnitary ℂ n).Holds π → (archHalfIntegral ℂ n).Holds π →
        (archConjDual ℂ n).Holds π := by
  sorry

/-! ### PL.0/auxiliary-cm-extensions: Soluble and cyclic CM extensions with prescribed local
behaviour -/

section AuxiliaryExtensions

variable (Favoid : Type) [Field Favoid] [Algebra F Favoid] [FiniteDimensional F Favoid]
  [IsGalois F Favoid]

/-- PL.0/auxiliary-cm-extensions, (A.2.1) (BLGGT14, Lemma A.2.1, from Clozel–Harris–Taylor,
Lemma 4.1.2). For a finite Galois `F^{(avoid)}/F`, a finite set `S` of finite places with finite
Galois extensions `E_v/F_v` (the elements of `S` being pairwise distinct places), and sets of
real places at which the extension is to be real or complex, there is a finite soluble Galois
`M/F`, linearly disjoint from `F^{(avoid)}`, with `M_w/F_v ≅ E_v/F_v` for all `v ∈ S` and `w | v`
and the prescribed behaviour at the real places. -/
theorem auxiliary_cm_extensions_1 (S : Set (Place F)) (hS : S.Finite)
    (hS' : ∀ v ∈ S, ∀ v' ∈ S, v.IsEquivTo v' → v = v') (Ev : Place F → Type)
    [∀ v, Field (Ev v)] [∀ v, Algebra v.Fv (Ev v)]
    (hEv : ∀ v ∈ S, FiniteDimensional v.Fv (Ev v) ∧ IsGalois v.Fv (Ev v))
    (Sreal Scomplex : Set (InfinitePlace F)) (hdisj : Disjoint Sreal Scomplex)
    (hSc : ∀ v ∈ Scomplex, v.IsReal) :
    ∃ (M : Type) (_ : Field M) (_ : NumberField M) (_ : Algebra F M),
      IsGalois F M ∧ Group.IsSolvable (M ≃ₐ[F] M) ∧ IsDomain (TensorProduct F M Favoid) ∧
      (∀ v ∈ S, ∀ (w : Place M) (f : v.Fv →+* w.Fv),
        f.comp v.emb = w.emb.comp (algebraMap F M) →
        ∃ e : Ev v ≃+* w.Fv, ∀ x : v.Fv, e (algebraMap v.Fv (Ev v) x) = f x) ∧
      (∀ v ∈ Sreal, InfinitePlace.IsUnramifiedIn M v) ∧
      ∀ v ∈ Scomplex, ∀ w : InfinitePlace M, w.comap (algebraMap F M) = v → w.IsComplex := by
  sorry

/-- PL.0/auxiliary-cm-extensions, (A.2.2) (BLGGT14, Lemma A.2.2). For `N ≥ 1` there is a
cyclic extension `M/F` of degree `N`, linearly disjoint from `F^{(avoid)}`, in which every place
of the finite set `S` (finite places) and `Sinf` (infinite places) splits completely. -/
theorem auxiliary_cm_extensions_2 (S : Set (Place F)) (hS : S.Finite)
    (Sinf : Set (InfinitePlace F)) (N : ℕ) (hN : 0 < N) :
    ∃ (M : Type) (_ : Field M) (_ : NumberField M) (_ : Algebra F M),
      IsGalois F M ∧ IsCyclic (M ≃ₐ[F] M) ∧ Module.finrank F M = N ∧
      IsDomain (TensorProduct F M Favoid) ∧ (∀ v ∈ S, v.SplitsCompletelyIn M) ∧
      ∀ v ∈ Sinf, InfinitePlace.IsUnramifiedIn M v := by
  sorry

/-- PL.0/auxiliary-cm-extensions, (A.2.3) (BLGGT14, Corollary A.2.3). If `F` is imaginary CM,
the cyclic extension of degree `N` of (A.2.2) can be taken CM. -/
theorem auxiliary_cm_extensions_3 [IsCMField F] (S : Set (Place F)) (hS : S.Finite)
    (Sinf : Set (InfinitePlace F)) (N : ℕ) (hN : 0 < N) :
    ∃ (M : Type) (_ : Field M) (_ : NumberField M) (_ : Algebra F M),
      IsCMField M ∧ IsGalois F M ∧ IsCyclic (M ≃ₐ[F] M) ∧ Module.finrank F M = N ∧
      IsDomain (TensorProduct F M Favoid) ∧ (∀ v ∈ S, v.SplitsCompletelyIn M) ∧
      ∀ v ∈ Sinf, InfinitePlace.IsUnramifiedIn M v := by
  sorry

end AuxiliaryExtensions

/-! ### PL.0/auxiliary-characters: Algebraic characters with prescribed conjugate-norm and local
behaviour -/

/-- PL.0/auxiliary-characters, part (1) (BLGGT14, Lemma A.2.5(1), from Lemma A.2.4). Let `F`
be imaginary CM, `S` a finite set of primes of `F` containing the primes above `l` and stable
under complex conjugation, `χ` a continuous character of `G_{F⁺}` and `ψ_v` (`v ∈ S`) continuous
characters of `G_{F_v}`, de Rham for `v | l`, with `(ψ_v ψ_{cv}^c)|I_{F_v} = χ|I_{F_v}`. If every
element of `S` is unramified over `F⁺` and `χ(c_v)` is independent of `v | ∞`, there is a
continuous character `θ` of `G_F` with `θ θ^c = χ|G_F` and `θ|I_{F_v} = ψ_v|I_{F_v}` for
`v ∈ S`. -/
/- REVIEW: A.2.5 may enlarge coefficients; this fixed-E output is still
an unresolved proposed signature, not a proved finite-field realization. -/
theorem auxiliary_characters_1 [IsCMField F] (S : Set (Place F)) (hS : S.Finite)
    (hSl : ∀ v : Place F, v.Above l → ∃ w ∈ S, v.IsEquivTo w)
    (hSc : ∀ w ∈ S, ∃ v ∈ S, ∃ e : v.Fv →+* w.Fv,
      e.comp v.emb = w.emb.comp (IsCMField.complexConj F : F →+* F))
    (χ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (ψ : (v : Place F) → Gal v.Fv →ₜ* Eˣ)
    (hψχ : ∀ v ∈ S, ∀ w ∈ S, ∀ e : v.Fv →+* w.Fv,
      e.comp v.emb = w.emb.comp (IsCMField.complexConj F : F →+* F) →
      ∀ σ ∈ inertia w.Fv,
        ψ w σ * ψ v (Field.absoluteGaloisGroup.map e σ) = χ (toPlus F (w.dec σ)))
    (hdR : ∀ v ∈ S, v.Above l → (deRham v.Fv E 1).Holds (charRep (ψ v)))
    (hunr : ∀ v ∈ S, v.IsUnramifiedOverPlus)
    (hχ : ∀ v v' : InfinitePlace (maximalRealSubfield F),
      χ (conjAt (maximalRealSubfield F) v) = χ (conjAt (maximalRealSubfield F) v')) :
    ∃ θ : Gal F →ₜ* Eˣ, IsConjNorm θ.toMonoidHom χ.toMonoidHom ∧
      ∀ v ∈ S, ∀ σ ∈ inertia v.Fv, θ (v.dec σ) = ψ v σ := by
  sorry

/-- PL.0/auxiliary-characters, part (2) (BLGGT14, Lemma A.2.5(2), from Clozel–Harris–Taylor,
Lemma 4.1.6). With `F`, `S`, `χ`, `ψ_v` as in part (1) but without its two extra assumptions: if
`l > 2` and `θ̄` is a continuous character of `G_F` with `θ̄ θ̄^c = χ̄|G_F` and
`θ̄|G_{F_v} = ψ̄_v` for `v ∈ S`, there is a continuous lift `θ` of `θ̄` with `θ θ^c = χ|G_F` and
`θ|I_{F_v} = ψ_v|I_{F_v}` for `v ∈ S`. -/
theorem auxiliary_characters_2 [IsCMField F] (hl : 2 < l) (S : Set (Place F)) (hS : S.Finite)
    (hSl : ∀ v : Place F, v.Above l → ∃ w ∈ S, v.IsEquivTo w)
    (hSc : ∀ w ∈ S, ∃ v ∈ S, ∃ e : v.Fv →+* w.Fv,
      e.comp v.emb = w.emb.comp (IsCMField.complexConj F : F →+* F))
    (χ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (ψ : (v : Place F) → Gal v.Fv →ₜ* Eˣ)
    (hψχ : ∀ v ∈ S, ∀ w ∈ S, ∀ e : v.Fv →+* w.Fv,
      e.comp v.emb = w.emb.comp (IsCMField.complexConj F : F →+* F) →
      ∀ σ ∈ inertia w.Fv,
        ψ w σ * ψ v (Field.absoluteGaloisGroup.map e σ) = χ (toPlus F (w.dec σ)))
    (hdR : ∀ v ∈ S, v.Above l → (deRham v.Fv E 1).Holds (charRep (ψ v)))
    (χbar : Gal (maximalRealSubfield F) →* (𝓀[E])ˣ) (hχbar : IsReductionOfChar (⇑χ) (⇑χbar))
    (θbar : Gal F →* (𝓀[E])ˣ) (hθc : IsContinuousResidual θbar)
    (hθθ : IsConjNorm θbar χbar)
    (hθψ : ∀ v ∈ S, IsReductionOfChar (⇑(ψ v)) (fun σ => θbar (v.dec σ))) :
    ∃ θ : Gal F →ₜ* Eˣ, IsReductionOfChar (⇑θ) (⇑θbar) ∧
      IsConjNorm θ.toMonoidHom χ.toMonoidHom ∧
      ∀ v ∈ S, ∀ σ ∈ inertia v.Fv, θ (v.dec σ) = ψ v σ := by
  sorry

/-- PL.0/auxiliary-characters, algebraicity of `χ` (BLGGT14, Lemma A.2.5): under the standing
hypotheses of the lemma the character `χ` of `G_{F⁺}` is algebraic; this is not assumed. -/
theorem auxiliary_characters_algebraic [IsCMField F] (S : Set (Place F)) (hS : S.Finite)
    (hSl : ∀ v : Place F, v.Above l → ∃ w ∈ S, v.IsEquivTo w)
    (hSc : ∀ w ∈ S, ∃ v ∈ S, ∃ e : v.Fv →+* w.Fv,
      e.comp v.emb = w.emb.comp (IsCMField.complexConj F : F →+* F))
    (χ : Gal (maximalRealSubfield F) →ₜ* Eˣ) (ψ : (v : Place F) → Gal v.Fv →ₜ* Eˣ)
    (hψχ : ∀ v ∈ S, ∀ w ∈ S, ∀ e : v.Fv →+* w.Fv,
      e.comp v.emb = w.emb.comp (IsCMField.complexConj F : F →+* F) →
      ∀ σ ∈ inertia w.Fv,
        ψ w σ * ψ v (Field.absoluteGaloisGroup.map e σ) = χ (toPlus F (w.dec σ)))
    (hdR : ∀ v ∈ S, v.Above l → (deRham v.Fv E 1).Holds (charRep (ψ v))) :
    IsAlgebraicChar l χ := by
  sorry

end PL0

/-! #### Imported interfaces used by PL.1 -/

section PL1Interfaces

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- ArithmeticGaloisRepresentations R01.2 (stand-in): the restriction to `I_K` of the Weil
representation `r` underlying the Weil–Deligne representation `WD(ρ) = (r, N)`: Grothendieck's
construction when the residue characteristics of `K` and `E` differ, Fontaine's for a potentially
semistable `ρ` when they agree. -/
def wdInertia (ρ : Gal K →ₜ* GL (Fin n) E) : inertia K →* GL (Fin n) E := sorry

/-- ArithmeticGaloisRepresentations R01.2 (stand-in): the monodromy operator `N` of
`WD(ρ) = (r, N)`. -/
def wdMonodromy (ρ : Gal K →ₜ* GL (Fin n) E) : Matrix (Fin n) (Fin n) E := sorry

/-- ArithmeticGaloisRepresentations R01.2 (stand-in): the exponent of the conductor of
`WD(ρ)`. -/
def conductorExponent (ρ : Gal K →ₜ* GL (Fin n) E) : ℕ := sorry

/-- EndoscopicTransferAndUnitaryTraceComparison ET.6 (stand-in): the pairs `(ρ, π)` of a
representation of `G_K` on `E^n` and an irreducible smooth representation of `GL_n(K)` with
`ι WD(ρ)^{F-ss} ≅ rec_K(π)`, `rec_K` the local Langlands correspondence. -/
def recMatch (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (n : ℕ) (ι : E →+* ℂ) :
    Imported ((Gal K →ₜ* GL (Fin n) E) × SmoothIrrep K n) := sorry

/-- LocalGaloisDeformationRings R08.1 (stand-in): the universal framed lift over `R^□`. -/
def LiftingRing.univ (ρbar : Gal K →* GL (Fin n) 𝓀[E]) :
    Gal K →* GL (Fin n) (LiftingRing K E ρbar) := sorry

/-- GlobalGaloisDeformations R04.3/local-deformation-problem (stand-in): the ideals of `R^□`
whose quotient classifies a local deformation problem in the sense of Clozel–Harris–Taylor,
Definition 2.2.2. -/
def localDeformationProblem (ρbar : Gal K →* GL (Fin n) 𝓀[E]) :
    Imported (Ideal (LiftingRing K E ρbar)) := sorry

/-- ArithmeticGaloisRepresentations G7/symmetric-and-exterior-powers (stand-in): the symmetric
power `Sym^k ρ` of a representation on a free module of rank `n`, in the monomial basis; its rank
is the number of monomials of degree `k` in `n` variables. -/
def symRep {G : Type*} [Group G] [TopologicalSpace G] {A : Type*} [CommRing A]
    [TopologicalSpace A] (k : ℕ) (ρ : G →ₜ* GL (Fin n) A) :
    G →ₜ* GL (Fin ((n + k - 1).choose k)) A := sorry

end PL1Interfaces

/-- `ℚ_l` has residue characteristic `l`. -/
instance instResCharPadic (l : ℕ) [Fact l.Prime] : ResChar ℚ_[l] l :=
  ⟨Fact.out, (Valuation.vlt_one_iff (valuation ℚ_[l])).mpr (Padic.valuation_p_lt_one _)⟩

/-- A closed point of `Spec R[1/l]`: a prime of `R` not containing `l` and maximal among these. -/
def IsClosedPointAway {R : Type*} [CommRing R] (l : ℕ) (P : Ideal R) : Prop :=
  P.IsPrime ∧ (l : R) ∉ P ∧ ∀ Q : Ideal R, Q.IsPrime → (l : R) ∉ Q → P ≤ Q → Q = P

/-! ## PL.1 -/

section PL1Connects

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CharZero K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  [CharZero E]
variable {p l : ℕ} [Fact p.Prime] [Fact l.Prime] [ResChar K p] [ResChar E l]
variable {n : ℕ}

/-- The inertial Weil–Deligne types of two lattices agree: `r₁|I_K ≅ r₂|I_K`. -/
def SameInertialType (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Prop :=
  Conj (wdInertia (genericC ρ₁) : inertia K → GL (Fin n) E) (wdInertia (genericC ρ₂))

/-- `(r₁|I_K, N₁) ≅ (r₂|I_K, N₂)` for the Weil–Deligne representations of two lattices. -/
def SameInertialTypeWithMonodromy (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Prop :=
  ∃ g : GL (Fin n) E,
    (∀ σ, wdInertia (genericC ρ₁) σ = g * wdInertia (genericC ρ₂) σ * g⁻¹) ∧
    wdMonodromy (genericC ρ₁) =
      (g : Matrix (Fin n) (Fin n) E) * wdMonodromy (genericC ρ₂) * ((g⁻¹ : GL (Fin n) E) :
        Matrix (Fin n) (Fin n) E)

/-- The lift classified by a prime `P` of `R^□` is robustly smooth: `H⁰(G_{K'}, (ad ρ_P)(1)) = 0`
for every finite `K'/K`, `ρ_P` being the universal lift over the domain `R^□/P`. -/
def IsRobustlySmoothAt (ρbar : Gal K →* GL (Fin n) 𝓀[E]) (P : Ideal (LiftingRing K E ρbar)) :
    Prop :=
  ∀ (K' : Type) [Field K'] [Algebra K K'] [FiniteDimensional K K'],
    HasNoAdOneInvariants E (fun σ : Gal K' =>
      Matrix.GeneralLinearGroup.map (Ideal.Quotient.mk P)
        (LiftingRing.univ ρbar (Field.absoluteGaloisGroup.map (algebraMap K K') σ)))

/-- The ideal of `R^□` cutting out the lifts that are trivial on the inertia group of a finite
extension `K'` of `K`. -/
def unramifiedOverIdeal (ρbar : Gal K →* GL (Fin n) 𝓀[E]) (K' : Type) [Field K'] [ValuativeRel K']
    [TopologicalSpace K'] [IsNonarchimedeanLocalField K'] [Algebra K K'] :
    Ideal (LiftingRing K E ρbar) :=
  Ideal.span {x | ∃ σ ∈ inertia K', ∃ i j : Fin n,
    x = (LiftingRing.univ ρbar (Field.absoluteGaloisGroup.map (algebraMap K K') σ) :
      Matrix (Fin n) (Fin n) (LiftingRing K E ρbar)) i j - (1 : Matrix (Fin n) (Fin n) _) i j}

/-! ### PL.1/connects-relation: Connecting and strongly connecting local lifts -/

-- `Connects`, `StronglyConnects` and `componentDeformationProblem` are in the shared definitions
-- of the preamble.

/-- `∼` is symmetric. -/
theorem Connects.symm {ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]} (h : Connects ρ₁ ρ₂) :
    Connects ρ₂ ρ₁ := by
  sorry

/-- Second half of the item `Connects.symm`: for `l = p` the relation `∼` is transitive, so it is
an equivalence relation on potentially crystalline lifts (the potentially crystalline lifting
rings are formally smooth after inverting `l`). -/
theorem Connects.trans {ρ₁ ρ₂ ρ₃ : Gal K →ₜ* GL (Fin n) 𝒪[E]} (hpl : p = l)
    (h₁₂ : Connects ρ₁ ρ₂) (h₂₃ : Connects ρ₂ ρ₃) : Connects ρ₁ ρ₃ := by
  sorry

/-- `∼` and `⇝` are invariant under `GL_n(𝒪)`-conjugation of either argument. -/
theorem Connects.of_conj (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) (g₁ g₂ : GL (Fin n) 𝒪[E]) :
    (Connects (conjBy g₁ ρ₁) (conjBy g₂ ρ₂) ↔ Connects ρ₁ ρ₂) ∧
      (StronglyConnects (conjBy g₁ ρ₁) (conjBy g₂ ρ₂) ↔ StronglyConnects ρ₁ ρ₂) := by
  sorry

/-- If `ρ₁ ∼ ρ₂` and `K'/K` is finite then `ρ₁|G_{K'} ∼ ρ₂|G_{K'}`. -/
theorem Connects.restrict {ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]} (h : Connects ρ₁ ρ₂) (K' : Type)
    [Field K'] [ValuativeRel K'] [TopologicalSpace K'] [IsNonarchimedeanLocalField K']
    [ResChar K' p] [Algebra K K'] [FiniteDimensional K K'] :
    Connects (resField ρ₁ (algebraMap K K')) (resField ρ₂ (algebraMap K K')) := by
  sorry

/-- If `ρ₁ ∼ ρ₂` and `ρ₁' ∼ ρ₂'` then `ρ₁ ⊕ ρ₁' ∼ ρ₂ ⊕ ρ₂'`, `ρ₁ ⊗ ρ₁' ∼ ρ₂ ⊗ ρ₂'` and
`ρ₁^∨ ∼ ρ₂^∨`. -/
theorem Connects.sum {m : ℕ} {ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]}
    {ρ₁' ρ₂' : Gal K →ₜ* GL (Fin m) 𝒪[E]} (h : Connects ρ₁ ρ₂) (h' : Connects ρ₁' ρ₂') :
    Connects (sumRep ρ₁ ρ₁') (sumRep ρ₂ ρ₂') ∧
      Connects (tensorRep ρ₁ ρ₁') (tensorRep ρ₂ ρ₂') ∧ Connects (dualRep ρ₁) (dualRep ρ₂) := by
  sorry

/-- For `l ≠ p` and a finite set `C` of irreducible components of `Spec R^□[1/l]`, the lifts
factoring through the reduced `l`-torsion-free quotient supported on `C` form a local deformation
problem `D_C` (BLGGT14 §1.3, from Lemma 1.2.2 and BLGHT11, Lemma 3.2). -/
theorem componentDeformationProblem_isLocalDeformationProblem (hpl : p ≠ l)
    (ρbar : Gal K →* GL (Fin n) 𝓀[E]) (hρbar : IsContinuousResidual ρbar)
    (C : Finset (Ideal (LiftingRing K E ρbar)))
    (hC : ∀ Q ∈ C, Q ∈ minimalPrimes (LiftingRing K E ρbar) ∧ (l : LiftingRing K E ρbar) ∉ Q) :
    (localDeformationProblem ρbar).Holds (componentDeformationProblem C) := by
  sorry

-- test: connects_unramified
example (hpl : p ≠ l) (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) (h₁ : IsUnramified ρ₁.toMonoidHom)
    (h₂ : IsUnramified ρ₂.toMonoidHom)
    (hbar : Conj (reduction ρ₁.toMonoidHom : Gal K → GL (Fin n) 𝓀[E])
      (reduction ρ₂.toMonoidHom)) :
    Connects ρ₁ ρ₂ := by
  sorry

-- first part: for `l ≠ p` every lift connects to itself
-- test: connects_refl
example (hpl : p ≠ l) (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Connects ρ ρ := by
  sorry

-- second part: for `l = p` exactly the potentially crystalline lifts connect to themselves
-- test: connects_refl
example (hpl : p = l) (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) :
    Connects ρ ρ ↔ IsPotentiallyCrystalline (genericC ρ) := by
  sorry

-- third part: if `l ≠ p` and `H⁰(G_K, (ad ρ)(1)) = 0` then `ρ ⇝ ρ'` whenever `ρ ∼ ρ'`
-- test: connects_refl
example (hpl : p ≠ l) (ρ ρ' : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (hH : HasNoAdOneInvariants E (genericC ρ : Gal K → GL (Fin n) E)) (h : Connects ρ ρ') :
    StronglyConnects ρ ρ' := by
  sorry

-- test: not_connects_inertia
example (hpl : p ≠ l) (hn : 0 < n) (ρ₁ : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (h₁ : IsUnramified ρ₁.toMonoidHom) (χ : Gal K →ₜ* (𝒪[E])ˣ)
    (hχ₁ : ∀ σ, IsLocalRing.residue 𝒪[E] (χ σ : 𝒪[E]) = 1) (hχ₂ : ∃ σ ∈ inertia K, χ σ ≠ 1)
    (hχ₃ : ∃ k : ℕ, ∀ σ ∈ inertia K, χ σ ^ l ^ k = 1) :
    reduction (twistRep ρ₁ χ).toMonoidHom = reduction ρ₁.toMonoidHom ∧
      ¬ Connects ρ₁ (twistRep ρ₁ χ) := by
  sorry

-- test: connects_crystalline_characters
example (hpl : p = l) (hE : IsLargeForLocal K E) (χ₁ χ₂ : Gal K →ₜ* (𝒪[E])ˣ)
    (h₁ : (crystalline K E 1).Holds (genericC (diagRep fun _ : Fin 1 => χ₁)))
    (h₂ : (crystalline K E 1).Holds (genericC (diagRep fun _ : Fin 1 => χ₂)))
    (hbar : ∀ σ, IsLocalRing.residue 𝒪[E] (χ₁ σ : 𝒪[E]) = IsLocalRing.residue 𝒪[E] (χ₂ σ : 𝒪[E]))
    (H : (K →+* E) → Multiset ℤ) (hH₁ : HasHodgeTate (genericC (diagRep fun _ : Fin 1 => χ₁)) H)
    (hH₂ : HasHodgeTate (genericC (diagRep fun _ : Fin 1 => χ₂)) H) :
    Connects (diagRep fun _ : Fin 1 => χ₁) (diagRep fun _ : Fin 1 => χ₂) := by
  sorry

-- test: connects_wd_inertia
example (hpl : p ≠ l) (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) (h : Connects ρ₁ ρ₂) :
    SameInertialType ρ₁ ρ₂ := by
  sorry

/-! ### PL.1/connects-properties: Properties of connection and strong connection -/

/-- PL.1/connects-properties, (1) (BLGGT14 §1.3, remarks (1)–(3)), `l ≠ p`: `∼` is symmetric,
`⇝` is transitive, and `ρ₁ ∼ ρ₂ ⇝ ρ₃` implies `ρ₁ ∼ ρ₃`. -/
theorem connects_properties_1 (hpl : p ≠ l) (ρ₁ ρ₂ ρ₃ : Gal K →ₜ* GL (Fin n) 𝒪[E]) :
    (Connects ρ₁ ρ₂ → Connects ρ₂ ρ₁) ∧
      (StronglyConnects ρ₁ ρ₂ → StronglyConnects ρ₂ ρ₃ → StronglyConnects ρ₁ ρ₃) ∧
      (Connects ρ₁ ρ₂ → StronglyConnects ρ₂ ρ₃ → Connects ρ₁ ρ₃) := by
  sorry

/-- PL.1/connects-properties, (2) (BLGGT14 §1.3, remark (5)), `l ≠ p`: if `ρ₁ ∼ ρ₂` and
`H⁰(G_K, (ad ρ₁)(1)) = 0` then `ρ₁ ⇝ ρ₂`. -/
theorem connects_properties_2 (hpl : p ≠ l) (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (h : Connects ρ₁ ρ₂)
    (hH : HasNoAdOneInvariants E (genericC ρ₁ : Gal K → GL (Fin n) E)) :
    StronglyConnects ρ₁ ρ₂ := by
  sorry

/-- PL.1/connects-properties, (3) (BLGGT14, Lemma 1.3.4, due to Choi), `l ≠ p`: `ρ₁ ∼ ρ₂`
implies `r₁|I_K ≅ r₂|I_K`; `ρ₁ ⇝ ρ₂` together with `ρ₂ ⇝ ρ₁` implies
`(r₁|I_K, N₁) ≅ (r₂|I_K, N₂)`, hence equal conductors. -/
theorem connects_properties_3 (hpl : p ≠ l) (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) :
    (Connects ρ₁ ρ₂ → SameInertialType ρ₁ ρ₂) ∧
      (StronglyConnects ρ₁ ρ₂ → StronglyConnects ρ₂ ρ₁ →
        SameInertialTypeWithMonodromy ρ₁ ρ₂ ∧
          conductorExponent (genericC ρ₁) = conductorExponent (genericC ρ₂)) := by
  sorry

/-- PL.1/connects-properties, (4) (BLGGT14 §1.3, remark (7)), `l ≠ p`: unramified lifts with
equivalent reductions connect. -/
theorem connects_properties_4_unramified (hpl : p ≠ l) (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (h₁ : IsUnramified ρ₁.toMonoidHom) (h₂ : IsUnramified ρ₂.toMonoidHom)
    (hbar : Conj (reduction ρ₁.toMonoidHom : Gal K → GL (Fin n) 𝓀[E])
      (reduction ρ₂.toMonoidHom)) :
    Connects ρ₁ ρ₂ := by
  sorry

/-- PL.1/connects-properties, (4) and the case `l = p` (BLGGT14 §1.3, remarks (8)–(10);
§1.4, remarks (4)–(5)): for `l ≠ p` and for `l = p`, `∼` is preserved by restriction to a finite
extension, direct sums, tensor products and duals. -/
theorem connects_properties_operations {m : ℕ} (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (ρ₁' ρ₂' : Gal K →ₜ* GL (Fin m) 𝒪[E]) (h : Connects ρ₁ ρ₂) (h' : Connects ρ₁' ρ₂')
    (K' : Type) [Field K'] [ValuativeRel K'] [TopologicalSpace K']
    [IsNonarchimedeanLocalField K'] [ResChar K' p] [Algebra K K'] [FiniteDimensional K K'] :
    Connects (resField ρ₁ (algebraMap K K')) (resField ρ₂ (algebraMap K K')) ∧
      Connects (sumRep ρ₁ ρ₁') (sumRep ρ₂ ρ₂') ∧
      Connects (tensorRep ρ₁ ρ₁') (tensorRep ρ₂ ρ₂') ∧ Connects (dualRep ρ₁) (dualRep ρ₂) := by
  sorry

/-- PL.1/connects-properties, (4) (BLGGT14 §1.3, remarks (10)–(11)), `l ≠ p`: `⇝` is
preserved by duals and by twisting both sides by a continuous character. -/
theorem connects_properties_4_strong (hpl : p ≠ l) (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (h : StronglyConnects ρ₁ ρ₂) (χ : Gal K →ₜ* (𝒪[E])ˣ) :
    StronglyConnects (dualRep ρ₁) (dualRep ρ₂) ∧
      StronglyConnects (twistRep ρ₁ χ) (twistRep ρ₂ χ) := by
  sorry

/-- PL.1/connects-properties, (4) and the case `l = p` (BLGGT14 §1.3, remark (11); §1.4,
remark (6)): `ρ₁ ∼ ρ₁ ⊗ μ` for an unramified character `μ` with trivial reduction; when `l = p`
the lift `ρ₁` is assumed potentially crystalline. -/
theorem connects_properties_unramified_twist (ρ₁ : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (hpc : p = l → IsPotentiallyCrystalline (genericC ρ₁)) (μ : Gal K →ₜ* (𝒪[E])ˣ)
    (hμ : IsUnramified μ.toMonoidHom) (hμbar : ∀ σ, IsLocalRing.residue 𝒪[E] (μ σ : 𝒪[E]) = 1) :
    Connects ρ₁ (twistRep ρ₁ μ) := by
  sorry

/-- PL.1/connects-properties, (4) and the case `l = p` (BLGGT14, Lemma 1.3.5; §1.4,
remark (7)): a lift `ρ₁` with semisimple reduction and an invariant filtration by direct summands
connects to the direct sum of its graded pieces; when `l = p` the lift is assumed potentially
crystalline. The filtration is given by a basis (the conjugation by `g`) in which `ρ₁` is block
triangular for the block function `d`, and the graded representation `ρ₂` is its block diagonal
part. -/
theorem connects_properties_filtration (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (hss : IsSemisimpleRep (reduction ρ₁.toMonoidHom))
    (hpc : p = l → IsPotentiallyCrystalline (genericC ρ₁)) (g : GL (Fin n) 𝒪[E])
    (d : Fin n → ℕ)
    (hd : ∀ σ, (conjBy g ρ₁ σ : Matrix (Fin n) (Fin n) 𝒪[E]).BlockTriangular d)
    (hgr : ∀ σ i j, (ρ₂ σ : Matrix (Fin n) (Fin n) 𝒪[E]) i j =
      if d i = d j then (conjBy g ρ₁ σ : Matrix (Fin n) (Fin n) 𝒪[E]) i j else 0) :
    Connects ρ₁ ρ₂ := by
  sorry

/-- PL.1/connects-properties, the case `l = p` (BLGGT14 §1.4, remark (2)): `∼` is an
equivalence relation on potentially crystalline lifts. -/
theorem connects_properties_equivalence (hpl : p = l) :
    (∀ ρ : Gal K →ₜ* GL (Fin n) 𝒪[E], IsPotentiallyCrystalline (genericC ρ) → Connects ρ ρ) ∧
      (∀ ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E], Connects ρ₁ ρ₂ → Connects ρ₂ ρ₁) ∧
      ∀ ρ₁ ρ₂ ρ₃ : Gal K →ₜ* GL (Fin n) 𝒪[E],
        Connects ρ₁ ρ₂ → Connects ρ₂ ρ₃ → Connects ρ₁ ρ₃ := by
  sorry

/-- PL.1/connects-properties, the case `l = p` (BLGGT14 §1.4, remark (3)): `ρ₁ ∼ ρ₂` implies
`WD(ρ₁)|I_K ≅ WD(ρ₂)|I_K`. -/
theorem connects_properties_wd (hpl : p = l) (hE : IsLargeForLocal K E)
    (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) (h : Connects ρ₁ ρ₂) : SameInertialType ρ₁ ρ₂ := by
  sorry

/-! ### PL.1/generic-smooth-points: Generic local representations are smooth points and smooth
points are dense -/

/-- PL.1/generic-smooth-points, (1) (BLGGT14, Lemma 1.3.2(1)), `l ≠ p`: if
`ι WD(ρ)^{F-ss} ≅ rec_K(π)` for an irreducible generic smooth `π` of `GL_n(K)`, then
`H⁰(G_K, (ad ρ)(1)) = 0`, the lift `ρ` lies on a unique irreducible component of `Spec R^□[1/l]`,
and `ρ ⇝ ρ'` for every `ρ'` with `ρ ∼ ρ'`. -/
theorem generic_smooth_points_1 (hpl : p ≠ l) (ι : E →+* ℂ) (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E])
    (π : SmoothIrrep K n) (hπ : (genericIrrep K n).Holds π)
    (hrec : (recMatch K E n ι).Holds (genericC ρ, π)) :
    HasNoAdOneInvariants E (genericC ρ : Gal K → GL (Fin n) E) ∧
      OnUniqueComponent ⊥ l (Lift.prime (ρbar := reduction ρ.toMonoidHom) ⟨ρ, rfl⟩) ∧
      ∀ ρ' : Gal K →ₜ* GL (Fin n) 𝒪[E], Connects ρ ρ' → StronglyConnects ρ ρ' := by
  sorry

/-- PL.1/generic-smooth-points, (2) (BLGGT14, Lemma 1.3.2(2)), `l ≠ p`: the closed points of
`Spec R^□[1/l]` at which the lift is robustly smooth are Zariski dense (an element of `R^□` lying
in all of them is nilpotent in `R^□[1/l]`); hence every irreducible component of `Spec R^□[1/l]`
is generically formally smooth of dimension `n²` (away from a proper closed subset its closed
points have regular local rings of dimension `n²`). -/
theorem generic_smooth_points_2 (hpl : p ≠ l) (ρbar : Gal K →* GL (Fin n) 𝓀[E])
    (hρbar : IsContinuousResidual ρbar) :
    (∀ x : LiftingRing K E ρbar,
        (∀ P : Ideal (LiftingRing K E ρbar), IsClosedPointAway l P →
          IsRobustlySmoothAt ρbar P → x ∈ P) →
        ∃ k m : ℕ, 0 < m ∧ (l : LiftingRing K E ρbar) ^ k * x ^ m = 0) ∧
      ∀ Q ∈ minimalPrimes (LiftingRing K E ρbar), (l : LiftingRing K E ρbar) ∉ Q →
        ∃ f : LiftingRing K E ρbar, f ∉ Q ∧
          ∀ (P : Ideal (LiftingRing K E ρbar)) [P.IsPrime], IsClosedPointAway l P → Q ≤ P →
            f ∉ P → IsRegularLocalRing (Localization.AtPrime P) ∧
              ringKrullDim (Localization.AtPrime P) = (n ^ 2 : ℕ) := by
  sorry

/-- PL.1/generic-smooth-points, (3) (BLGGT14, Lemma 1.3.3), `l ≠ p`: for a finite Galois
`K'/K`, the quotient of `R^□` classifying the lifts trivial on `I_{K'}` is, after inverting `l`,
zero or formally smooth of dimension `n²`: all its closed points have regular local rings of
dimension `n²`. -/
theorem generic_smooth_points_3 (hpl : p ≠ l) (ρbar : Gal K →* GL (Fin n) 𝓀[E])
    (hρbar : IsContinuousResidual ρbar) (K' : Type) [Field K'] [ValuativeRel K']
    [TopologicalSpace K'] [IsNonarchimedeanLocalField K'] [Algebra K K']
    [FiniteDimensional K K'] [IsGalois K K']
    (P : Ideal (LiftingRing K E ρbar ⧸ unramifiedOverIdeal ρbar K')) [P.IsPrime]
    (hP : IsClosedPointAway l P) :
    IsRegularLocalRing (Localization.AtPrime P) ∧
      ringKrullDim (Localization.AtPrime P) = (n ^ 2 : ℕ) := by
  sorry

end PL1Connects

section PL1Diagonalizable

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CharZero K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  [CharZero E]
variable {l : ℕ} [Fact l.Prime] [ResChar K l] [ResChar E l]
variable {n : ℕ}

/-! ### PL.1/potentially-diagonalizable: Diagonalizable and potentially diagonalizable
representations -/

-- `IsDiagonalizable`, `IsPotentiallyDiagonalizable`, `IsPotentiallyDiagonalizableRat` and
-- `IsPotentiallyDiagonalizablyAutomorphic` are in the shared definitions of the preamble.

/-- Invariance of potential diagonalizability under `GL_n(E)`-conjugation
(BLGGT14, Lemma 1.4.1). -/
theorem IsPotentiallyDiagonalizable.of_conj {ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]}
    (h : IsPotentiallyDiagonalizable ρ₁)
    (hc : Conj (genericC ρ₁ : Gal K → GL (Fin n) E) (genericC ρ₂)) :
    IsPotentiallyDiagonalizable ρ₂ := by
  sorry

/-- Potential diagonalizability passes to `ρ|G_{K'}` for every finite `K'/K`. -/
theorem IsPotentiallyDiagonalizable.restrict {ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]}
    (h : IsPotentiallyDiagonalizable ρ) (K' : Type) [Field K'] [ValuativeRel K']
    [TopologicalSpace K'] [IsNonarchimedeanLocalField K'] [ResChar K' l] [Algebra K K']
    [FiniteDimensional K K'] :
    IsPotentiallyDiagonalizable (resField ρ (algebraMap K K')) := by
  sorry

/-- Diagonalizability passes to `ρ|G_{K'}` for every finite `K'/K` (BLGGT14 §1.4). -/
theorem IsDiagonalizable.restrict {ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]} (h : IsDiagonalizable ρ)
    (K' : Type) [Field K'] [ValuativeRel K'] [TopologicalSpace K']
    [IsNonarchimedeanLocalField K'] [ResChar K' l] [Algebra K K'] [FiniteDimensional K K'] :
    IsDiagonalizable (resField ρ (algebraMap K K')) := by
  sorry

/-- A potentially diagonalizable `ρ` is potentially crystalline. -/
theorem IsPotentiallyDiagonalizable.isPotentiallyCrystalline {ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]}
    (h : IsPotentiallyDiagonalizable ρ) : IsPotentiallyCrystalline (genericC ρ) := by
  sorry

-- test: pd_character
example (χ : Gal K →ₜ* (𝒪[E])ˣ)
    (h : IsPotentiallyCrystalline (genericC (diagRep fun _ : Fin 1 => χ))) :
    IsPotentiallyDiagonalizable (diagRep fun _ : Fin 1 => χ) := by
  sorry

-- test: pd_unramified
example (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) (h : IsUnramified ρ.toMonoidHom) :
    IsPotentiallyDiagonalizable ρ := by
  sorry

-- test: pd_fontaine_laffaille
example (hl : 3 ≤ l) (W : WeierstrassCurve ℚ_[l]) [W.IsElliptic]
    (hW : (goodSupersingular ℚ_[l]).Holds W) :
    (crystalline ℚ_[l] E 2).Holds (tateRep W E) ∧
      HasHodgeTate (tateRep W E) (fun _ => {0, -1}) ∧
      IsPotentiallyDiagonalizableRat (tateRep W E) := by
  sorry

-- test: not_pd_tate_curve
example (W : WeierstrassCurve ℚ_[l]) [W.IsElliptic] (hW : (splitMultiplicative ℚ_[l]).Holds W) :
    ¬ IsPotentiallyCrystalline (tateRep W E) ∧
      ¬ IsPotentiallyDiagonalizableRat (tateRep W E) := by
  sorry

-- test: pd_conj_iff
example (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) (g : GL (Fin n) E)
    (h : ∀ σ, genericC ρ₁ σ = g * genericC ρ₂ σ * g⁻¹) :
    IsPotentiallyDiagonalizable ρ₁ ↔ IsPotentiallyDiagonalizable ρ₂ := by
  sorry

/-! ### PL.1/pd-criteria: Ordinary and Fontaine–Laffaille representations are potentially
diagonalizable -/

/-- PL.1/pd-criteria, (1) (BLGGT14, Lemma 1.4.3(1)): a potentially crystalline `ρ` with a
`G_K`-invariant filtration with one-dimensional graded pieces is potentially diagonalizable. -/
theorem pd_criteria_1 (ρ : Gal K →ₜ* GL (Fin n) E) (hpc : IsPotentiallyCrystalline ρ)
    (ψ : Fin n → Gal K →ₜ* Eˣ) (ρ' : Gal K → GL (Fin n) E)
    (hconj : Conj (ρ : Gal K → GL (Fin n) E) ρ')
    (htri : IsUpperTriangularWith ρ' (fun i σ => ψ i σ)) :
    IsPotentiallyDiagonalizableRat ρ := by
  sorry

/-- PL.1/pd-criteria, (1) for ordinary representations (BLGGT14, Lemma 1.4.3(1)): a
potentially crystalline ordinary `ρ` is potentially diagonalizable. -/
theorem pd_criteria_1_ordinary (ρ : Gal K →ₜ* GL (Fin n) E) (hpc : IsPotentiallyCrystalline ρ)
    (hord : IsOrdinaryLocal ρ) : IsPotentiallyDiagonalizableRat ρ := by
  sorry

/-- PL.1/pd-criteria, (2) (BLGGT14, Lemma 1.4.3(2)): if `K/ℚ_l` is unramified, `ρ` is
crystalline and `HT_τ(ρ) ⊂ [a_τ, a_τ + l - 2]` for every `τ`, then `ρ` is potentially
diagonalizable. -/
theorem pd_criteria_2 (hunr : Irreducible ((l : ℕ) : 𝒪[K])) (hE : IsLargeForLocal K E)
    (ρ : Gal K →ₜ* GL (Fin n) E) (hcr : (crystalline K E n).Holds ρ)
    (H : (K →+* E) → Multiset ℤ) (hH : HasHodgeTate ρ H) (a : (K →+* E) → ℤ)
    (hrange : ∀ τ, ∀ h ∈ H τ, a τ ≤ h ∧ h ≤ a τ + (l : ℤ) - 2) :
    IsPotentiallyDiagonalizableRat ρ := by
  sorry

/-! ### PL.1/potentially-barsotti-tate-diagonalizable: Two-dimensional potentially Barsotti–Tate
representations are potentially diagonalizable -/

/-- PL.1/potentially-barsotti-tate-diagonalizable (Gee–Kisin, Lemma 4.4.1). For `l > 2` and
`K/ℚ_l` finite, a two-dimensional potentially crystalline `ρ` with all labelled Hodge–Tate
weights `{0, 1}` is potentially diagonalizable. -/
theorem potentially_barsotti_tate_diagonalizable (hl : 2 < l) (hE : IsLargeForLocal K E)
    (ρ : Gal K →ₜ* GL (Fin 2) E) (hpc : IsPotentiallyCrystalline ρ)
    (hHT : HasHodgeTate ρ (fun _ => {0, 1})) : IsPotentiallyDiagonalizableRat ρ := by
  sorry

/-! ### PL.1/pd-operations: Potential diagonalizability is preserved by the tensor operations -/

/-- PL.1/pd-operations (BLGGT14 §1.4, remarks (4)–(5); the remark after
Barnet-Lamb–Gee–Geraghty 2011, Definition 3.3.5). For potentially diagonalizable `ρ`, `ρ'`, the
representations `ρ ⊕ ρ'`, `ρ ⊗ ρ'`, `ρ^∨`, every twist of `ρ` by a potentially crystalline
character, every symmetric power `Sym^k ρ` and every restriction `ρ|G_{K'}` to a finite extension
are potentially diagonalizable. -/
theorem pd_operations {m : ℕ} (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) (ρ' : Gal K →ₜ* GL (Fin m) 𝒪[E])
    (h : IsPotentiallyDiagonalizable ρ) (h' : IsPotentiallyDiagonalizable ρ')
    (χ : Gal K →ₜ* (𝒪[E])ˣ)
    (hχ : IsPotentiallyCrystalline (genericC (diagRep fun _ : Fin 1 => χ))) (k : ℕ) (K' : Type)
    [Field K'] [ValuativeRel K'] [TopologicalSpace K'] [IsNonarchimedeanLocalField K']
    [ResChar K' l] [Algebra K K'] [FiniteDimensional K K'] :
    IsPotentiallyDiagonalizable (sumRep ρ ρ') ∧ IsPotentiallyDiagonalizable (tensorRep ρ ρ') ∧
      IsPotentiallyDiagonalizable (dualRep ρ) ∧ IsPotentiallyDiagonalizable (twistRep ρ χ) ∧
      IsPotentiallyDiagonalizable (symRep k ρ) ∧
      IsPotentiallyDiagonalizable (resField ρ (algebraMap K K')) := by
  sorry

end PL1Diagonalizable

end TauCeti.Automorphy

namespace TauCeti.DefiniteUnitary

open TauCeti.Automorphy

/-! ## PL.2: definite unitary groups, algebraic modular forms and Hecke algebras -/

/-! #### Places of `L` and of `L⁺`

Core.lean indexes the sets `T`, `R`, `S(B)` by places `ṽ` of `L`. A place `w` of `L` split over
`L⁺` has `L_w = L⁺_v`, so `G(L⁺_v)` is `unitaryGroup D w.Fv`; a place of `L⁺` inert in `L` is a
`Place D.Lplus`. -/

/-- `L_w` as an algebra over `𝒪_{L⁺}`. -/
instance CMData.algPlace (D : CMData) (w : Place D.L) : Algebra (𝓞 D.Lplus) w.Fv :=
  (w.emb.comp ((algebraMap D.Lplus D.L).comp (algebraMap (𝓞 D.Lplus) D.Lplus))).toAlgebra

/-- `𝒪_{L_w}` as an algebra over `𝒪_{L⁺}`. -/
instance CMData.algPlaceInt (D : CMData) (w : Place D.L) : Algebra (𝓞 D.Lplus) 𝒪[w.Fv] :=
  ((algebraMap (𝓞 D.Lplus) w.Fv).codRestrict 𝒪[w.Fv] (by sorry)).toAlgebra

/-- `L⁺_v` as an algebra over `𝒪_{L⁺}`. -/
instance CMData.algPlacePlus (D : CMData) (v : Place D.Lplus) : Algebra (𝓞 D.Lplus) v.Fv :=
  (v.emb.comp (algebraMap (𝓞 D.Lplus) D.Lplus)).toAlgebra

/-- `𝒪_{L⁺_v}` as an algebra over `𝒪_{L⁺}`. -/
instance CMData.algPlacePlusInt (D : CMData) (v : Place D.Lplus) : Algebra (𝓞 D.Lplus) 𝒪[v.Fv] :=
  ((algebraMap (𝓞 D.Lplus) v.Fv).codRestrict 𝒪[v.Fv] (by sorry)).toAlgebra

/-- The place `w` of `L` does not lie above `S(B)`. -/
def CMData.OutsideSB (D : CMData) (w : Place D.L) : Prop := ∀ u ∈ D.SB, ¬ D.SameBelow u w

/-- The place `v` of `L⁺` is inert in `L`: `L` does not embed in `L⁺_v` over `L⁺` (`L/L⁺` is
unramified at every finite place). -/
def CMData.IsInert (D : CMData) (v : Place D.Lplus) : Prop :=
  ¬ ∃ σ : D.L →+* v.Fv, ∀ x : D.Lplus, σ (x : D.L) = v.emb x

/-- The conjugate place `w^c`. -/
def CMData.conjPlace (D : CMData) (w : Place D.L) : Place D.L where
  Fv := w.Fv
  emb := w.emb.comp (IsCMField.complexConj D.L : D.L →+* D.L)
  dense := by sorry

/-- `𝒪_{L_w} → L_w` as a map of `𝒪_{L⁺}`-algebras. -/
def CMData.intToPlace (D : CMData) (w : Place D.L) : 𝒪[w.Fv] →ₐ[𝓞 D.Lplus] w.Fv :=
  { algebraMap 𝒪[w.Fv] w.Fv with commutes' := by sorry }

/-- `𝒪_{L⁺_v} → L⁺_v` as a map of `𝒪_{L⁺}`-algebras. -/
def CMData.intToPlacePlus (D : CMData) (v : Place D.Lplus) : 𝒪[v.Fv] →ₐ[𝓞 D.Lplus] v.Fv :=
  { algebraMap 𝒪[v.Fv] v.Fv with commutes' := by sorry }

/-- A real place `σ` of `L⁺` makes `ℝ` an `𝒪_{L⁺}`-algebra. -/
@[reducible] def CMData.realAlgebra (D : CMData) (σ : D.Lplus →+* ℝ) : Algebra (𝓞 D.Lplus) ℝ :=
  (σ.comp (algebraMap (𝓞 D.Lplus) D.Lplus)).toAlgebra

/-! #### Imported interfaces used by PL.2 -/

/-- Mathlib, `IsDedekindDomain.FiniteAdeleRing` (stand-in): the projection of `𝔸^∞_{L⁺}` to the
completion of `L⁺` at the place below `w`, followed by its inclusion in `L_w`. -/
def adeleToPlace (D : CMData) (w : Place D.L) : D.finiteAdeles →ₐ[𝓞 D.Lplus] w.Fv := sorry

/-- Mathlib, `IsDedekindDomain.FiniteAdeleRing` (stand-in): the projection of `𝔸^∞_{L⁺}` to the
completion `L⁺_v`. -/
def adeleToPlacePlus (D : CMData) (v : Place D.Lplus) : D.finiteAdeles →ₐ[𝓞 D.Lplus] v.Fv :=
  sorry

/-- AdelicAlgebraicGroups AA.1 (stand-in): the hyperspecial maximal compact subgroups of
`G(L⁺_v)`. -/
def hyperspecial (D : CMData) (v : Place D.Lplus) : Imported (Subgroup (unitaryGroup D v.Fv)) :=
  sorry

/-- AdelicAlgebraicGroups AA.1 (stand-in): the groups of `L⁺_v`-points of the Borel subgroups of
`G` defined over `L⁺_v`. One exists exactly when `G` is quasi-split at `v`. -/
def borelPoints (D : CMData) (v : Place D.Lplus) : Imported (Subgroup (unitaryGroup D v.Fv)) :=
  sorry

/-- PL.2 construction interface: the invertible hermitian matrices `H ∈ M_n(L)` whose
unitary group is quasi-split over the completion of `L⁺` below `w`. Involutions of the second
kind on `M_n(L)` arise from hermitian matrices; quasi-splitness is an additional condition.
AA.1 supplies local points after the unitary model has been constructed here. -/
def quasiSplitHermitian (L : Type) [Field L] [NumberField L] [IsCMField L] (n : ℕ)
    (w : Place L) : Imported (Matrix (Fin n) (Fin n) L) := sorry

/-! ### PL.2/definite-unitary-group: The definite unitary group attached to a CM field -/

-- `unitaryGroup` is in Core.lean.

/-- Functoriality of `R ↦ G(R)` in the `𝒪_{L⁺}`-algebra `R`. -/
def unitaryGroup.map (D : CMData) {R S : Type} [CommRing R] [CommRing S]
    [Algebra (𝓞 D.Lplus) R] [Algebra (𝓞 D.Lplus) S] (f : R →ₐ[𝓞 D.Lplus] S) :
    unitaryGroup D R →* unitaryGroup D S := sorry

/-- The image of `G(𝒪_{L⁺_v})` in `G(L_w)`, `v` the place below `w`. -/
def integralPoints (D : CMData) (w : Place D.L) : Subgroup (unitaryGroup D w.Fv) :=
  (unitaryGroup.map D (D.intToPlace w)).range

/-- The image of `G(𝒪_{L⁺_v})` in `G(L⁺_v)`. -/
def integralPointsPlus (D : CMData) (v : Place D.Lplus) : Subgroup (unitaryGroup D v.Fv) :=
  (unitaryGroup.map D (D.intToPlacePlus v)).range

/-- The image of `G(L⁺)` in `G(𝔸^∞_{L⁺})`. -/
def globalPoints (D : CMData) : Subgroup (unitaryGroup D D.finiteAdeles) :=
  (unitaryGroup.map D (IsScalarTower.toAlgHom (𝓞 D.Lplus) D.Lplus D.finiteAdeles)).range

/-- The component at the place below `w` of an element of `G(𝔸^∞_{L⁺})`. -/
def localProj (D : CMData) (w : Place D.L) :
    unitaryGroup D D.finiteAdeles →* unitaryGroup D w.Fv :=
  unitaryGroup.map D (adeleToPlace D w)

/-- The component at `v` of an element of `G(𝔸^∞_{L⁺})`. -/
def localProjPlus (D : CMData) (v : Place D.Lplus) :
    unitaryGroup D D.finiteAdeles →* unitaryGroup D v.Fv :=
  unitaryGroup.map D (adeleToPlacePlus D v)

/-- The double coset space `G(L⁺)\G(𝔸^∞_{L⁺})/U`. -/
def DoubleCosetSpace (D : CMData) (U : Subgroup (unitaryGroup D D.finiteAdeles)) : Type :=
  Quot fun g g' : unitaryGroup D D.finiteAdeles => ∃ γ ∈ globalPoints D, ∃ u ∈ U, g' = γ * g * u

/-- The points of `G` at the real place `σ` of `L⁺`. -/
abbrev realPoints (D : CMData) (σ : D.Lplus →+* ℝ) : Type :=
  @unitaryGroup D ℝ _ (D.realAlgebra σ)

/-- `ι_w : G(L_w) ≅ GL_n(L_w)` for a place `w` of `L` not above `S(B)`, the first projection of
`B ⊗_{L⁺} L_w ≅ M_n(L_w) × M_n(L_w)`. For `w` split over `L⁺` this is `G(L⁺_v) ≅ GL_n(L_w)`. -/
def iotaW (D : CMData) (w : Place D.L) (hw : D.OutsideSB w) :
    unitaryGroup D w.Fv ≃* GL (Fin D.n) w.Fv := sorry

/-- `ι_{w^c}(g) = ᵗ(ι_w(g))^{-c}`: for an isomorphism `e : L_w ≅ L_{w'}` inducing complex
conjugation on `L` (so `w' = w^c`), which identifies the two models of `G(L⁺_v)`. -/
theorem iotaW_conj (D : CMData) (w w' : Place D.L) (hw : D.OutsideSB w) (hw' : D.OutsideSB w')
    (hsplit : D.IsSplit w) (e : w.Fv ≃ₐ[𝓞 D.Lplus] w'.Fv)
    (he : ∀ x : D.L, e (w.emb x) = w'.emb (IsCMField.complexConj D.L x))
    (g : unitaryGroup D w.Fv) :
    (iotaW D w' hw' (unitaryGroup.map D (e : w.Fv →ₐ[𝓞 D.Lplus] w'.Fv) g)).1 =
      ((iotaW D w hw g)⁻¹ : GL (Fin D.n) w.Fv).1ᵀ.map (e : w.Fv →+* w'.Fv) := by
  sorry

/-- `G(L⁺ ⊗_ℚ ℝ) = ∏_{σ} G(ℝ_σ)` is compact. -/
theorem isCompact_infty (D : CMData) : CompactSpace ((σ : D.Lplus →+* ℝ) → realPoints D σ) := by
  sorry

/-- `G` is quasi-split at every finite place of `L⁺` not in `S(B)`, and `G(L⁺_v)` has
hyperspecial maximal compact subgroups at the inert places. -/
theorem quasiSplit (D : CMData) (v : Place D.Lplus) :
    ((∀ w ∈ D.SB, ¬ D.LiesAbove w v) → ∃ B, (borelPoints D v).Holds B) ∧
      (D.IsInert v → ∃ K, (hyperspecial D v).Holds K) := by
  sorry

/-- `G(L⁺)\G(𝔸^∞_{L⁺})/U` is finite for every open compact `U`. -/
theorem finite_doubleCoset (D : CMData) (U : Subgroup (unitaryGroup D D.finiteAdeles))
    (hU : IsOpen (U : Set (unitaryGroup D D.finiteAdeles)))
    (hc : IsCompact (U : Set (unitaryGroup D D.finiteAdeles))) :
    Finite (DoubleCosetSpace D U) := by
  sorry

-- test: unitaryGroup_rank_one
example (D : CMData) (h1 : D.n = 1) (w : Place D.L) (hw : D.OutsideSB w) (hs : D.IsSplit w) :
    Nonempty (unitaryGroup D D.Lplus ≃*
      (MonoidHom.id (D.L)ˣ * Units.map (IsCMField.complexConj D.L : D.L →* D.L)).ker) ∧
    ∃ e : unitaryGroup D w.Fv ≃* (w.Fv)ˣ, ∀ g i j,
      (iotaW D w hw g : Matrix (Fin D.n) (Fin D.n) w.Fv) i j = (e g : w.Fv) := by
  sorry

-- test: unitaryGroup_compact_infty
example (D : CMData) (σ : D.Lplus →+* ℝ) :
    CompactSpace (Matrix.unitaryGroup (Fin D.n) ℂ) ∧
      Nonempty (realPoints D σ ≃ₜ* Matrix.unitaryGroup (Fin D.n) ℂ) := by
  sorry

-- test: unitaryGroup_split_place
example (D : CMData) (w : Place D.L) (hw : D.OutsideSB w) (hs : D.IsSplit w) :
    (integralPoints D w).map (iotaW D w hw).toMonoidHom =
      (Matrix.GeneralLinearGroup.map (n := Fin D.n) (algebraMap 𝒪[w.Fv] w.Fv)).range := by
  sorry

-- test: unitaryGroup_parity_obstruction
-- The hypothesis that `L/L⁺` is unramified is dropped: `L` is any CM field. An involution of the
-- second kind on `M_n(L)` is `g ↦ H⁻¹ ᵗḡ H` for an invertible hermitian `H`; its unitary group is
-- compact at a real place exactly when `H` is definite there.
example (L : Type) [Field L] [NumberField L] [IsCMField L] (n : ℕ) (hn : Even n)
    (hodd : Odd (n / 2 * Module.finrank ℚ (maximalRealSubfield L))) :
    ¬ ∃ H : Matrix (Fin n) (Fin n) L, IsUnit H ∧
      H.map (IsCMField.complexConj L) = Hᵀ ∧
      (∀ σ : L →+* ℂ,
        (∀ x : Fin n → ℂ, x ≠ 0 → 0 < (star x ⬝ᵥ (H.map σ).mulVec x).re) ∨
        (∀ x : Fin n → ℂ, x ≠ 0 → (star x ⬝ᵥ (H.map σ).mulVec x).re < 0)) ∧
      ∀ w : Place L, (quasiSplitHermitian L n w).Holds H := by
  sorry

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-! #### Levels -/

/-- The group `G(𝔸^∞_{L⁺})` of a Hecke datum. -/
abbrev HeckeDatum.G (D : HeckeDatum E) : Type := unitaryGroup D.toCMData D.toCMData.finiteAdeles

/-- The same data at another level `V`. -/
@[reducible] def HeckeDatum.withLevel (D : HeckeDatum E) (V : Subgroup D.G)
    (hV : IsOpen (V : Set D.G)) (hc : IsCompact (V : Set D.G)) : HeckeDatum E :=
  { D with level := V, level_open := hV, level_compact := hc }

/-- The component `U_v` of the level at the place below `w`. -/
def HeckeDatum.levelAt (D : HeckeDatum E) (w : Place D.L) :
    Subgroup (unitaryGroup D.toCMData w.Fv) :=
  D.level.map (localProj D.toCMData w)

/-- The component `U_v` of the level at a place `v` of `L⁺`. -/
def HeckeDatum.levelAtPlus (D : HeckeDatum E) (v : Place D.toCMData.Lplus) :
    Subgroup (unitaryGroup D.toCMData v.Fv) :=
  D.level.map (localProjPlus D.toCMData v)

/-- The level is a product `U = ∏_v U_v` over the finite places of `L⁺`. -/
def HeckeDatum.IsProduct (D : HeckeDatum E) : Prop :=
  ∀ g : D.G, (∀ v : Place D.toCMData.Lplus, localProjPlus D.toCMData v g ∈ D.levelAtPlus v) →
    g ∈ D.level

/-- The arithmetic group `Γ_t = t⁻¹ G(L⁺) t ∩ U`, as a subgroup of `U`. -/
def HeckeDatum.stabilizer (D : HeckeDatum E) (t : D.G) : Subgroup D.level :=
  ((globalPoints D.toCMData).comap (MulAut.conj t).toMonoidHom).subgroupOf D.level

/-- No group `t⁻¹ G(L⁺) t ∩ U` contains an element of order `l`. -/
def HeckeDatum.NoOrderL (D : HeckeDatum E) : Prop :=
  ∀ t : D.G, ∀ u ∈ D.stabilizer t, orderOf u ≠ D.l

/-- Every group `t⁻¹ G(L⁺) t ∩ U` is trivial. -/
def HeckeDatum.TrivialStabilizers (D : HeckeDatum E) : Prop := ∀ t : D.G, D.stabilizer t = ⊥

/-- `w` does not lie above a place of `T`. -/
def HeckeDatum.OutsideT (D : HeckeDatum E) (w : Place D.L) : Prop :=
  ∀ u ∈ D.T, ¬ D.toCMData.SameBelow u w

/-- `Iw(b, c) ⊂ GL_n(𝒪_K)`: the matrices that are upper triangular modulo `𝔪^c` and unipotent
upper triangular modulo `𝔪^b` (`b ≤ c`). `Iw = Iw(0, 1)` and `Iw₁ = Iw(1, 1)`. -/
def iwahoriInt (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n b c : ℕ) : Subgroup (GL (Fin n) 𝒪[K]) where
  carrier := {g |
    (∀ i j, j < i → (g : Matrix (Fin n) (Fin n) 𝒪[K]) i j ∈ IsLocalRing.maximalIdeal 𝒪[K] ^ c) ∧
    ∀ i, (g : Matrix (Fin n) (Fin n) 𝒪[K]) i i - 1 ∈ IsLocalRing.maximalIdeal 𝒪[K] ^ b}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- The image of `GL_n(𝒪_K)` in `GL_n(K)`. -/
def integralGL (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) : GL (Fin n) 𝒪[K] →* GL (Fin n) K :=
  Matrix.GeneralLinearGroup.map (algebraMap 𝒪[K] K)

/-- `ι_w⁻¹ Iw(w^{b,c}) ⊂ G(L_w)`. -/
def iwahoriAt (C : CMData) (w : Place C.L) (hw : C.OutsideSB w) (b c : ℕ) :
    Subgroup (unitaryGroup C w.Fv) :=
  ((iwahoriInt w.Fv C.n b c).map (integralGL w.Fv C.n)).comap (iotaW C w hw).toMonoidHom

/-! #### Imported interfaces used by PL.2 (algebraic modular forms) -/

/-- AutomorphicFormsOnReductiveGroups AF.4/coefficient-lattices (stand-in): the `𝒪`-lattice
`M_λ = ⊗_τ M_{λ_τ}` in the algebraic representation of highest weight `λ`, the tensor product
running over the embeddings `τ` of `L` inducing the chosen places above `l`. -/
def weightLattice (C : CMData) (l : ℕ) (lam : (C.L →+* E) → Fin C.n → ℤ) : Type := sorry

instance (C : CMData) (l : ℕ) (lam : (C.L →+* E) → Fin C.n → ℤ) :
    AddCommGroup (weightLattice C l lam) := sorry

instance (C : CMData) (l : ℕ) (lam : (C.L →+* E) → Fin C.n → ℤ) :
    Module 𝒪[E] (weightLattice C l lam) := sorry

/-- AutomorphicFormsOnReductiveGroups AF.5/algebraic-modular-forms (stand-in): the module `S(U, M)`
of algebraic modular forms on a group that is compact at infinity, with finite adelic points `Gf`,
rational points `Γ`, level `U` and coefficient `U`-module `M`, inside the functions `Gf → M`. -/
def AF5Forms {R Gf : Type} [CommRing R] [Group Gf] (Γ U : Subgroup Gf) (M : Type)
    [AddCommGroup M] [Module R M] (ρ : Representation R U M) : Submodule R (Gf → M) := sorry

/-- AutomorphicFormsOnReductiveGroups AF.5/algebraic-modular-forms-structure (iii) (stand-in): the
complex vector space `Hom_{G(L⁺_∞)}((⊗_{v ∈ R} ℂ(ιχ_v⁻¹)) ⊗ ξ_{ιλ}^∨, 𝒜(G))^U` of homomorphisms
into the `U`-invariant automorphic forms on `G`, `ξ_{ιλ}` the representation of `G(L⁺_∞)` of
highest weight `ιλ`. -/
def automorphicHom (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (ι : E →+* ℂ) : Type :=
  sorry

instance (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (ι : E →+* ℂ) :
    AddCommGroup (automorphicHom D lam ι) := sorry

instance (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (ι : E →+* ℂ) :
    Module ℂ (automorphicHom D lam ι) := sorry

/-! ### PL.2/unitary-algebraic-modular-forms: Algebraic modular forms on a definite unitary group -/

/-- The functions on `G(𝔸^∞_{L⁺})` with values in `M_{λ,{χ_v}} ⊗_𝒪 A`; this type does not depend
on the level. -/
abbrev HeckeDatum.FormFun (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type)
    [AddCommGroup A] [Module 𝒪[E] A] : Type :=
  D.G → TensorProduct 𝒪[E] (weightLattice D.toCMData D.l lam) A

/-- A function in the level-independent space; used to compare forms of different levels. -/
def HeckeDatum.asFun (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type)
    [AddCommGroup A] [Module 𝒪[E] A] (f : D.FormFun lam A) : D.FormFun lam A := f

/-- The underlying `𝒪`-module of `M_{λ,{χ_v}} = M_λ ⊗ ⊗_{v ∈ R} 𝒪(χ_v)`. -/
abbrev HeckeDatum.weightModule (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) : Type :=
  weightLattice D.toCMData D.l lam

/-- The action of `U` on `M_{λ,{χ_v}}`: `u` acts on `M_λ` through the components `ι_ṽ(u_v)`,
`v | l`, and by the scalars `χ_v(ι_ṽ(u_v) mod Iw₁(ṽ))`, `v ∈ R`. It is defined when
`U_v ⊂ G(𝒪_{L⁺_v})` for `v | l` and `U_v ⊂ ι_ṽ⁻¹ Iw(ṽ)` for `v ∈ R`. -/
def weightAction (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) :
    Representation 𝒪[E] D.level (D.weightModule lam) := sorry

/-- The action of `U` on `M_{λ,{χ_v}} ⊗_𝒪 A`. -/
def tensorAction (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type)
    [AddCommGroup A] [Module 𝒪[E] A] :
    Representation 𝒪[E] D.level (TensorProduct 𝒪[E] (D.weightModule lam) A) where
  toFun u := (weightAction D lam u).rTensor A
  map_one' := by sorry
  map_mul' := by sorry

/-- The standing hypotheses of PL.2: `l` is an odd prime, `E` contains the image of every
embedding of `L`, the places of `T` (in particular those above `l`) are split over `L⁺`, the
places of `R` and those above `l` are not above `S(B)`, `λ` is dominant, `U_v ⊂ G(𝒪_{L⁺_v})` for
`v | l` and `U_v ⊂ ι_ṽ⁻¹ Iw(ṽ)` for `v ∈ R`. -/
structure HeckeDatum.Standing (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) : Prop where
  l_prime : D.l.Prime
  l_odd : Odd D.l
  large : IsLargeFor D.L E
  T_split : ∀ v ∈ D.T, D.toCMData.IsSplit v
  T_unique : ∀ w ∈ D.T, ∀ w' ∈ D.T, D.toCMData.SameBelow w w' → w = w'
  R_outside : ∀ v ∈ D.R, D.toCMData.OutsideSB v
  l_outside : ∀ v : Place D.L, v.Above D.l → D.toCMData.OutsideSB v
  dominant : ∀ (τ : D.L →+* E) (i j : Fin D.n), i ≤ j → lam τ j ≤ lam τ i
  level_l : ∀ v : Place D.L, v.Above D.l → D.levelAt v ≤ integralPoints D.toCMData v
  level_R : ∀ (v : Place D.L) (hv : v ∈ D.R),
    D.levelAt v ≤ iwahoriAt D.toCMData v (R_outside v hv) 0 1

/-- **`S_{λ,{χ_v}}(U, A)`**: the functions `f : G(L⁺)\G(𝔸^∞_{L⁺}) → M_{λ,{χ_v}} ⊗_𝒪 A` with
`f(gu) = u⁻¹ f(g)` for `u ∈ U` (Thorne 2012, Definition 6.1). -/
def AlgebraicModularForm (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type)
    [AddCommGroup A] [Module 𝒪[E] A] :
    Submodule 𝒪[E] (D.G → TensorProduct 𝒪[E] (D.weightModule lam) A) where
  carrier := {f | (∀ γ ∈ globalPoints D.toCMData, ∀ g, f (γ * g) = f g) ∧
    ∀ (u : D.level) (g : D.G), f (g * u) = tensorAction D lam A u⁻¹ (f g)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

namespace AlgebraicModularForm

variable (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)

/-- Functoriality in the coefficient module: `S(U, A) → S(U, A')`. -/
def map {A A' : Type} [AddCommGroup A] [Module 𝒪[E] A] [AddCommGroup A'] [Module 𝒪[E] A']
    (φ : A →ₗ[𝒪[E]] A') : AlgebraicModularForm D lam A →ₗ[𝒪[E]] AlgebraicModularForm D lam A' where
  toFun f := ⟨fun g => φ.lTensor (D.weightModule lam) (f.1 g), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

theorem map_id (A : Type) [AddCommGroup A] [Module 𝒪[E] A] :
    map D lam (LinearMap.id : A →ₗ[𝒪[E]] A) = LinearMap.id := by
  sorry

theorem map_comp {A A' A'' : Type} [AddCommGroup A] [Module 𝒪[E] A] [AddCommGroup A']
    [Module 𝒪[E] A'] [AddCommGroup A''] [Module 𝒪[E] A''] (φ : A →ₗ[𝒪[E]] A')
    (ψ : A' →ₗ[𝒪[E]] A'') : map D lam (ψ ∘ₗ φ) = map D lam ψ ∘ₗ map D lam φ := by
  sorry

variable (A : Type) [AddCommGroup A] [Module 𝒪[E] A]

/-- For `V ⊂ U`, the action of `V` on `M_{λ,{χ_v}}` is the restriction of that of `U`. -/
theorem weightAction_withLevel (V : Subgroup D.G) (hV : IsOpen (V : Set D.G))
    (hc : IsCompact (V : Set D.G)) (hVU : V ≤ D.level) (u : V) (m : D.weightModule lam) :
    weightAction (D.withLevel V hV hc) lam u m = weightAction D lam ⟨u.1, hVU u.2⟩ m := by
  sorry

/-- For `V ⊂ U`, the inclusion `S(U, A) → S(V, A)`. -/
def restrict (V : Subgroup D.G) (hV : IsOpen (V : Set D.G)) (hc : IsCompact (V : Set D.G))
    (hVU : V ≤ D.level) :
    AlgebraicModularForm D lam A →ₗ[𝒪[E]] AlgebraicModularForm (D.withLevel V hV hc) lam A :=
  sorry

/-- `restrict` is the inclusion of functions on `G(𝔸^∞_{L⁺})`. -/
theorem restrict_apply (V : Subgroup D.G) (hV : IsOpen (V : Set D.G))
    (hc : IsCompact (V : Set D.G)) (hVU : V ≤ D.level) (f : AlgebraicModularForm D lam A)
    (g : D.G) : (restrict D lam A V hV hc hVU f).1 g = f.1 g := by
  sorry

/-- For `V ⊂ U`, the trace `tr_{U/V} : S(V, A) → S(U, A)`. -/
def trace (V : Subgroup D.G) (hV : IsOpen (V : Set D.G)) (hc : IsCompact (V : Set D.G))
    (hVU : V ≤ D.level) :
    AlgebraicModularForm (D.withLevel V hV hc) lam A →ₗ[𝒪[E]] AlgebraicModularForm D lam A :=
  sorry

/-- `tr_{U/V} f = Σ_{u ∈ U/V} u·f`, with `(u·f)(g) = u f(gu)`, for any set `s` of representatives
of `U/V`. -/
theorem trace_apply (V : Subgroup D.G) (hV : IsOpen (V : Set D.G))
    (hc : IsCompact (V : Set D.G)) (hVU : V ≤ D.level) (s : Finset D.level)
    (hs : ∀ u : D.level, ∃! r, r ∈ s ∧ ((r⁻¹ * u : D.level) : D.G) ∈ V)
    (f : AlgebraicModularForm (D.withLevel V hV hc) lam A) (g : D.G) :
    (trace D lam A V hV hc hVU f).1 g = ∑ r ∈ s, tensorAction D lam A r (f.1 (g * r)) := by
  sorry

/-- The invariants of `M_{λ,{χ_v}} ⊗ A` under `Γ_t = t⁻¹ G(L⁺) t ∩ U`. -/
def stabInvariants (t : D.G) : Submodule 𝒪[E] (TensorProduct 𝒪[E] (D.weightModule lam) A) where
  carrier := {m | ∀ u ∈ D.stabilizer t, tensorAction D lam A u m = m}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- `S(U, A) ≅ ⊕_j (M_{λ,{χ_v}} ⊗ A)^{Γ_{t_j}}` for representatives `t_j` of
`G(L⁺)\G(𝔸^∞_{L⁺})/U`. -/
def equiv_doubleCoset (t : DoubleCosetSpace D.toCMData D.level → D.G)
    (ht : ∀ x, Quot.mk _ (t x) = x) :
    AlgebraicModularForm D lam A ≃ₗ[𝒪[E]]
      ((x : DoubleCosetSpace D.toCMData D.level) → stabInvariants D lam A (t x)) := sorry

/-- The isomorphism `equiv_doubleCoset` is evaluation at the representatives. -/
theorem equiv_doubleCoset_apply (t : DoubleCosetSpace D.toCMData D.level → D.G)
    (ht : ∀ x, Quot.mk _ (t x) = x) (f : AlgebraicModularForm D lam A)
    (x : DoubleCosetSpace D.toCMData D.level) :
    ((equiv_doubleCoset D lam A t ht f x : stabInvariants D lam A (t x)) :
      TensorProduct 𝒪[E] (D.weightModule lam) A) = f.1 (t x) := by
  sorry

/-- The comparison with automorphic forms (Thorne 2012, Proposition 6.2), at level `U`: the
`ι`-linear map from `S_{λ,{χ_v}}(U, E)` to `Hom_{G(L⁺_∞)}((⊗ ℂ(ιχ_v⁻¹)) ⊗ ξ_{ιλ}^∨, 𝒜(G))^U`
becomes an isomorphism after extending scalars along `ι`. -/
def automorphicComparison (ι : E →+* ℂ) :
    letI : Algebra 𝒪[E] ℂ := (ι.comp (algebraMap 𝒪[E] E)).toAlgebra
    TensorProduct 𝒪[E] ℂ (AlgebraicModularForm D lam E) ≃ₗ[ℂ] automorphicHom D lam ι := sorry

end AlgebraicModularForm

/-- The crossed homomorphisms `Γ → M`. -/
def crossedHoms {R Γ M : Type} [CommRing R] [Group Γ] [AddCommGroup M] [Module R M]
    (ρ : Representation R Γ M) : Submodule R (Γ → M) where
  carrier := {c | ∀ g h, c (g * h) = c g + ρ g (c h)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- The principal crossed homomorphisms `g ↦ g m - m`. -/
def principalCrossedHoms {R Γ M : Type} [CommRing R] [Group Γ] [AddCommGroup M] [Module R M]
    (ρ : Representation R Γ M) : Submodule R (Γ → M) :=
  LinearMap.range (LinearMap.pi fun g => ρ g - LinearMap.id)

/-- `H¹(Γ, M)`: crossed homomorphisms modulo principal ones. -/
abbrev H1 {R Γ M : Type} [CommRing R] [Group Γ] [AddCommGroup M] [Module R M]
    (ρ : Representation R Γ M) : Type :=
  crossedHoms ρ ⧸ (principalCrossedHoms ρ).comap (crossedHoms ρ).subtype

-- test: amf_weight_zero_level
example (D : HeckeDatum E) (hst : D.Standing 0) (hR : D.R = ∅) :
    ∃ (e : D.weightModule 0 ≃ₗ[𝒪[E]] 𝒪[E])
      (Φ : AlgebraicModularForm D 0 𝒪[E] ≃ₗ[𝒪[E]]
        (DoubleCosetSpace D.toCMData D.level → 𝒪[E])),
      (∀ u m, e (weightAction D 0 u m) = e m) ∧
      ∀ f g, Φ f (Quot.mk _ g) = e (TensorProduct.rid 𝒪[E] _ (f.1 g)) := by
  sorry

-- test: amf_zero_module
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) :
    (∀ (A : Type) [AddCommGroup A] [Module 𝒪[E] A] [Subsingleton A],
      Subsingleton (AlgebraicModularForm D lam A)) ∧
    ∀ (A A' : Type) [AddCommGroup A] [Module 𝒪[E] A] [AddCommGroup A'] [Module 𝒪[E] A'],
      Function.Bijective fun f : AlgebraicModularForm D lam (A × A') =>
        (AlgebraicModularForm.map D lam (LinearMap.fst 𝒪[E] A A') f,
          AlgebraicModularForm.map D lam (LinearMap.snd 𝒪[E] A A') f) := by
  sorry

-- test: amf_compatibility_AF5
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type) [AddCommGroup A]
    [Module 𝒪[E] A] :
    AlgebraicModularForm D lam A =
      AF5Forms (globalPoints D.toCMData) D.level (TensorProduct 𝒪[E] (D.weightModule lam) A)
        (tensorAction D lam A) := by
  sorry

-- test: amf_not_free_without_smallness
-- (i) `S(U, 𝒪) ⊗ k → S(U, k)` is injective: the kernel of reduction is `𝔪 S(U, 𝒪)`.
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (hst : D.Standing lam) :
    LinearMap.ker (AlgebraicModularForm.map D lam (Algebra.linearMap 𝒪[E] 𝓀[E])) =
      IsLocalRing.maximalIdeal 𝒪[E] • (⊤ : Submodule 𝒪[E] (AlgebraicModularForm D lam 𝒪[E])) := by
  sorry

-- (ii) its cokernel is `⊕_j H¹(Γ_j, M_{λ,{χ_v}})[ϖ]`.
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (hst : D.Standing lam)
    (t : DoubleCosetSpace D.toCMData D.level → D.G) (ht : ∀ x, Quot.mk _ (t x) = x)
    (ϖ : 𝒪[E]) (hϖ : Irreducible ϖ) :
    Nonempty ((AlgebraicModularForm D lam 𝓀[E] ⧸
        LinearMap.range (AlgebraicModularForm.map D lam (Algebra.linearMap 𝒪[E] 𝓀[E]))) ≃ₗ[𝒪[E]]
      ((x : DoubleCosetSpace D.toCMData D.level) → LinearMap.ker (ϖ • (LinearMap.id :
        H1 ((weightAction D lam).comp (D.stabilizer (t x)).subtype) →ₗ[𝒪[E]] _)))) := by
  sorry

-- (iii) the cokernel is zero when `l ∤ #Γ_j` for all `j`.
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (hst : D.Standing lam)
    (h : ∀ t : D.G, ¬ D.l ∣ Nat.card (D.stabilizer t)) :
    Function.Surjective (AlgebraicModularForm.map D lam (Algebra.linearMap 𝒪[E] 𝓀[E])) := by
  sorry

-- (iv) the abstract model: `Γ = ℤ/l` acting on the augmentation ideal `I` of `𝒪[ℤ/l]` has
-- `I^Γ = 0`, but `(I ⊗ k)^Γ ≠ 0`.
example (l : ℕ) (hl : l.Prime) [ResChar E l] :
    (∀ x : MonoidAlgebra 𝒪[E] (Multiplicative (ZMod l)),
      MonoidAlgebra.lift 𝒪[E] 𝒪[E] (Multiplicative (ZMod l)) 1 x = 0 →
      (∀ g, MonoidAlgebra.of 𝒪[E] _ g * x = x) → x = 0) ∧
    ∃ x : MonoidAlgebra 𝓀[E] (Multiplicative (ZMod l)),
      MonoidAlgebra.lift 𝓀[E] 𝓀[E] (Multiplicative (ZMod l)) 1 x = 0 ∧
      (∀ g, MonoidAlgebra.of 𝓀[E] _ g * x = x) ∧ x ≠ 0 := by
  sorry

/-! #### Imported interfaces used by PL.2 (Hecke algebras) -/

/-- Mathlib's `cyclotomicCharacter` (stand-in): the `l`-adic cyclotomic character of `G_F` with
values in `A^×`, for a ring `A` in which `l` is topologically nilpotent (a complete local
`𝒪`-algebra or a quotient of one); for a field `A` of characteristic `l` it is the mod `l`
cyclotomic character. -/
def cycloChar (A : Type*) [CommRing A] (F : Type*) [Field F] : Gal F →* Aˣ := sorry

/-! ### PL.2/unitary-hecke-algebra: Hecke algebras of definite unitary groups and their maximal
ideals -/

/-- `ϖ` is a uniformizer of the local field `K`. -/
def IsUniformizer (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ϖ : K) : Prop :=
  ∃ p : 𝒪[K], Irreducible p ∧ (p : K) = ϖ

/-- `g ∈ G(𝔸^∞_{L⁺})` is supported at the place below `w`, with component `ι_w⁻¹(a)` there. -/
def IsLocalAt (C : CMData) (w : Place C.L) (hw : C.OutsideSB w) (a : GL (Fin C.n) w.Fv)
    (g : unitaryGroup C C.finiteAdeles) : Prop :=
  iotaW C w hw (localProj C w g) = a ∧
    ∀ v : Place C.Lplus, ¬ C.LiesAbove w v → localProjPlus C v g = 1

/-- The finite set `s` represents the left cosets in the double coset `U α U = ⊔_{x ∈ s} x U`. -/
def IsCosetDecomposition {G : Type} [Group G] (U : Subgroup G) (α : G) (s : Finset G) : Prop :=
  (∀ x ∈ s, ∃ u ∈ U, ∃ u' ∈ U, x = u * α * u') ∧
    ∀ u ∈ U, ∃! x, x ∈ s ∧ x⁻¹ * (u * α) ∈ U

/-- The places at which the unramified Hecke operators are defined: `w` is split over `L⁺`, does
not lie above `T` and does not lie above `S(B)`. -/
def HeckeDatum.IsHeckePlace (D : HeckeDatum E) (w : Place D.L) : Prop :=
  D.toCMData.IsSplit w ∧ D.OutsideT w ∧ D.toCMData.OutsideSB w

/-- `U_v = G(𝒪_{L⁺_v})` at the split places outside `T`. -/
def HeckeDatum.SphericalOutsideT (D : HeckeDatum E) : Prop :=
  ∀ w : Place D.L, D.IsHeckePlace w → D.levelAt w = integralPoints D.toCMData w

/-- `diag(a 1_j, 1_{n-j}) ∈ GL_n(K)` for `a ≠ 0`. -/
def diagBlock (K : Type) [Field K] (n j : ℕ) (a : Kˣ) : GL (Fin n) K :=
  Matrix.GeneralLinearGroup.mk'' (Matrix.diagonal fun i : Fin n => if (i : ℕ) < j then (a : K) else 1)
    (by sorry)

section HeckeOperators

variable (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)

/-- **`T_w^j`** `= ι_w⁻¹[GL_n(𝒪_{L_w}) diag(ϖ_w 1_j, 1_{n-j}) GL_n(𝒪_{L_w})]` acting on
`S_{λ,{χ_v}}(U, A)`, for a place `w` of `L` split over `L⁺` and not above `T`, and `1 ≤ j ≤ n`.
It does not depend on the uniformizer. -/
def heckeOperator (A : Type) [AddCommGroup A] [Module 𝒪[E] A] (w : Place D.L) (j : ℕ) :
    Module.End 𝒪[E] (AlgebraicModularForm D lam A) := sorry

/-- `T_w^j` is the double coset operator of any `α ∈ G(𝔸^∞_{L⁺})` supported at `w` with
`ι_w(α_w) = diag(ϖ 1_j, 1_{n-j})`: `(T_w^j f)(g) = Σ_i f(g x_i)` for `U α U = ⊔ x_i U`. -/
theorem heckeOperator_apply (hlev : D.SphericalOutsideT) (A : Type) [AddCommGroup A]
    [Module 𝒪[E] A] (w : Place D.L) (hw : D.IsHeckePlace w) (j : ℕ) (hj : 1 ≤ j ∧ j ≤ D.n)
    (ϖ : (w.Fv)ˣ) (hϖ : IsUniformizer w.Fv ϖ) (α : D.G)
    (hα : IsLocalAt D.toCMData w hw.2.2 (diagBlock w.Fv D.n j ϖ) α) (s : Finset D.G)
    (hs : IsCosetDecomposition D.level α s)
    (hsupport : ∀ x ∈ s, ∀ v : Place D.toCMData.Lplus,
      ¬ D.toCMData.LiesAbove w v → localProjPlus D.toCMData v x = 1)
    (f : AlgebraicModularForm D lam A) (g : D.G) :
    (heckeOperator D lam A w j f).1 g = ∑ x ∈ s, f.1 (g * x) := by
  sorry

/-- The generators of the Hecke algebra: the `T_w^j` and the inverses `(T_w^n)⁻¹`. -/
def heckeGenerators (A : Type) [AddCommGroup A] [Module 𝒪[E] A] :
    Set (Module.End 𝒪[E] (AlgebraicModularForm D lam A)) :=
  {x | ∃ w j, D.IsHeckePlace w ∧ 1 ≤ j ∧ j ≤ D.n ∧ x = heckeOperator D lam A w j} ∪
    {x | ∃ w, D.IsHeckePlace w ∧ x * heckeOperator D lam A w D.n = 1 ∧
      heckeOperator D lam A w D.n * x = 1}

/-- **`T^T_{λ,{χ_v}}(U, A)`** as the `𝒪`-subalgebra of `End_𝒪(S_{λ,{χ_v}}(U, A))` generated by the
`T_w^j` and `(T_w^n)⁻¹` (Thorne 2012 §6). -/
def heckeAlgebraWith (A : Type) [AddCommGroup A] [Module 𝒪[E] A] :
    Subalgebra 𝒪[E] (Module.End 𝒪[E] (AlgebraicModularForm D lam A)) :=
  Algebra.adjoin 𝒪[E] (heckeGenerators D lam A)

-- `heckeAlgebra` (coefficients `𝒪`) is in Core.lean.

/-- The action of `T^T_{λ,{χ_v}}(U, 𝒪)` on `S_{λ,{χ_v}}(U, 𝒪)`. -/
def heckeAlgebra.toEnd :
    heckeAlgebra D lam →ₐ[𝒪[E]] Module.End 𝒪[E] (AlgebraicModularForm D lam 𝒪[E]) := sorry

/-- `T^T_{λ,{χ_v}}(U, 𝒪)` acts faithfully. -/
theorem heckeAlgebra.toEnd_injective : Function.Injective (heckeAlgebra.toEnd D lam) := by
  sorry

/-- The image of `T^T_{λ,{χ_v}}(U, 𝒪)` is the subalgebra generated by the Hecke operators. -/
theorem heckeAlgebra.toEnd_range :
    (heckeAlgebra.toEnd D lam).range = heckeAlgebraWith D lam 𝒪[E] := by
  sorry

/-- The element `T_w^j` of `T^T_{λ,{χ_v}}(U, 𝒪)`. -/
def heckeAlgebra.T (w : Place D.L) (j : ℕ) : heckeAlgebra D lam := sorry

theorem heckeAlgebra.toEnd_T (w : Place D.L) (hw : D.IsHeckePlace w) (j : ℕ)
    (hj : 1 ≤ j ∧ j ≤ D.n) :
    heckeAlgebra.toEnd D lam (heckeAlgebra.T D lam w j) = heckeOperator D lam 𝒪[E] w j := by
  sorry

/-- `T^T_{λ,{χ_v}}(U, A)` is commutative. -/
instance heckeAlgebra.isCommutative (A : Type) [AddCommGroup A] [Module 𝒪[E] A] :
    Std.Commutative fun x y : heckeAlgebraWith D lam A => x * y := by
  sorry

/-- `T^T_λ(U, 𝒪)` is a finite `𝒪`-algebra. -/
instance heckeAlgebra.finite : Module.Finite 𝒪[E] (heckeAlgebra D lam) := by
  sorry

/-- `T^T_λ(U, 𝒪)` is free as an `𝒪`-module. -/
theorem heckeAlgebra.free : Module.Free 𝒪[E] (heckeAlgebra D lam) := by
  sorry

/-- `T^T_λ(U, 𝒪)` is semilocal and is the product of its localisations at maximal ideals. -/
theorem heckeAlgebra.semilocal :
    Finite (MaximalSpectrum (heckeAlgebra D lam)) ∧
      Function.Bijective (RingHom.pi fun m : MaximalSpectrum (heckeAlgebra D lam) =>
        algebraMap (heckeAlgebra D lam) (Localization.AtPrime m.asIdeal)) := by
  sorry

/-- `T^T_{λ,{χ_v}}(U, 𝒪)` is reduced: the forms over `Q̄_l` are a semisimple Hecke module. -/
theorem heckeAlgebra.isReduced (hst : D.Standing lam) (hlev : D.SphericalOutsideT) :
    IsReduced (heckeAlgebra D lam) := by
  sorry

/-- `T^T_{λ,{χ_v}}(U, A)` is finite over `𝒪` when `A` is a finitely generated `𝒪`-module. -/
theorem heckeAlgebraWith_finite (A : Type) [AddCommGroup A] [Module 𝒪[E] A]
    [Module.Finite 𝒪[E] A] : Module.Finite 𝒪[E] (heckeAlgebraWith D lam A) := by
  sorry

/-- The residue field `T/m` of a maximal ideal. -/
instance heckeAlgebra.residueField (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] :
    Field (heckeAlgebra D lam ⧸ m) := Ideal.Quotient.field m

/-- The Hecke polynomial `Σ_{j=0}^n (-1)^j (Nw)^{j(j-1)/2} T_w^j X^{n-j}`, with `T_w^0 = 1`. -/
def heckePoly (w : Place D.L) : Polynomial (heckeAlgebra D lam) :=
  ∑ j ∈ Finset.range (D.n + 1),
    Polynomial.C ((-1) ^ j * (w.norm : heckeAlgebra D lam) ^ (j * (j - 1) / 2) *
      (if j = 0 then 1 else heckeAlgebra.T D lam w j)) * Polynomial.X ^ (D.n - j)

/-- **`r̄_m`**: the semisimple residual representation `G_L → GL_n(T/m)` of a maximal ideal `m` of
`T^T_λ(U, 𝒪)` (Thorne 2012, Proposition 6.6). -/
def residualRep (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] :
    Gal D.L →* GL (Fin D.n) (heckeAlgebra D lam ⧸ m) := sorry

end HeckeOperators

/-- A matrix representation is semisimple: every invariant subspace has an invariant
complement. -/
def IsSemisimpleRep {G k : Type*} [Field k] {n : ℕ} (ρ : G → GL (Fin n) k) : Prop :=
  ∀ W : Submodule k (Fin n → k),
    (∀ g, ∀ w ∈ W, (ρ g : Matrix (Fin n) (Fin n) k).mulVec w ∈ W) →
    ∃ W' : Submodule k (Fin n → k),
      (∀ g, ∀ w ∈ W', (ρ g : Matrix (Fin n) (Fin n) k).mulVec w ∈ W') ∧ IsCompl W W'

/-- `G_L → G_{L⁺}`. -/
def CMData.galIncl (C : CMData) : Gal C.L →ₜ* Gal C.Lplus :=
  Field.absoluteGaloisGroup.map (algebraMap C.Lplus C.L)

/-- `r^c ≅ r^∨ ⊗ ψ` for a representation `r` of `G_L` and a character `ψ`: for every
`c ∈ G_{L⁺} - G_L` there is `P` with `r(c σ c⁻¹) P ᵗr(σ) = ψ(σ) P`. -/
def IsConjugateSelfDual (C : CMData) {k : Type*} [Field k] {n : ℕ} (r : Gal C.L → GL (Fin n) k)
    (ψ : Gal C.L → kˣ) : Prop :=
  ∀ c : Gal C.Lplus, c ∉ Set.range C.galIncl → ∃ P : GL (Fin n) k, ∀ σ σ' : Gal C.L,
    C.galIncl σ' = c * C.galIncl σ * c⁻¹ →
    (r σ' : Matrix (Fin n) (Fin n) k) * P.1 * (r σ : Matrix (Fin n) (Fin n) k)ᵀ =
      ((ψ σ : kˣ) : k) • P.1

section ResidualRep

variable (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
  (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal]

/-- `r̄_m` is continuous. -/
theorem residualRep_continuous : IsContinuousResidual (residualRep D lam m) := by
  sorry

/-- `r̄_m` is semisimple. -/
theorem residualRep_semisimple (hst : D.Standing lam) (hlev : D.SphericalOutsideT) :
    IsSemisimpleRep (residualRep D lam m) := by
  sorry

/-- `r̄_m^c ≅ r̄_m^∨(1 - n)`. -/
theorem residualRep_conjugateSelfDual (hst : D.Standing lam) (hlev : D.SphericalOutsideT) :
    IsConjugateSelfDual D.toCMData (residualRep D lam m)
      (fun σ => cycloChar (heckeAlgebra D lam ⧸ m) D.L σ ^ (1 - (D.n : ℤ))) := by
  sorry

/-- `r̄_m` is unramified at the split places `w` outside `T`, with the characteristic polynomial of
a geometric Frobenius equal to the Hecke polynomial modulo `m`. -/
theorem residualRep_charpoly (hst : D.Standing lam) (hlev : D.SphericalOutsideT)
    (w : Place D.L) (hw : D.IsHeckePlace w) :
    IsUnramified ((residualRep D lam m).comp w.dec.toMonoidHom) ∧
      (residualRep D lam m (w.dec (geomFrob w.Fv)) :
          Matrix (Fin D.n) (Fin D.n) (heckeAlgebra D lam ⧸ m)).charpoly =
        (heckePoly D lam w).map (Ideal.Quotient.mk m) := by
  sorry

/-- `r̄_m` is unramified above an inert place `v` at which `U_v` is hyperspecial. -/
theorem residualRep_unramified_inert (hst : D.Standing lam) (hlev : D.SphericalOutsideT)
    (v : Place D.toCMData.Lplus) (hv : D.toCMData.IsInert v)
    (hU : (hyperspecial D.toCMData v).Holds (D.levelAtPlus v)) (w : Place D.L)
    (hwv : D.toCMData.LiesAbove w v) :
    IsUnramified ((residualRep D lam m).comp w.dec.toMonoidHom) := by
  sorry

/-- `r̄_m` is determined up to conjugacy by continuity, semisimplicity and its Frobenius
polynomials. -/
theorem residualRep_unique (hst : D.Standing lam) (hlev : D.SphericalOutsideT)
    (r : Gal D.L →* GL (Fin D.n) (heckeAlgebra D lam ⧸ m)) (hc : IsContinuousResidual r)
    (hss : IsSemisimpleRep r)
    (hr : ∀ w : Place D.L, D.IsHeckePlace w → IsUnramified (r.comp w.dec.toMonoidHom) ∧
      (r (w.dec (geomFrob w.Fv)) : Matrix (Fin D.n) (Fin D.n) (heckeAlgebra D lam ⧸ m)).charpoly =
        (heckePoly D lam w).map (Ideal.Quotient.mk m)) :
    Conj (r : Gal D.L → GL (Fin D.n) (heckeAlgebra D lam ⧸ m)) (residualRep D lam m) := by
  sorry

/-- **`m` is non-Eisenstein**: `r̄_m` is absolutely irreducible. -/
def IsNonEisenstein : Prop :=
  IsAbsIrred (residualRep D lam m : Gal D.L → GL (Fin D.n) (heckeAlgebra D lam ⧸ m))

end ResidualRep

section MapRestrict

variable (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (V : Subgroup D.G)
  (hV : IsOpen (V : Set D.G)) (hc : IsCompact (V : Set D.G)) (hVU : V ≤ D.level)

/-- For `V ⊂ U` with the same `T`, the map `T^T(V, 𝒪) → T^T(U, 𝒪)` induced by the inclusion
`S(U, 𝒪) ⊂ S(V, 𝒪)`. -/
def heckeAlgebra.map_restrict (hVU : V ≤ D.level) :
    heckeAlgebra (D.withLevel V hV hc) lam →ₐ[𝒪[E]] heckeAlgebra D lam := sorry

/-- Restriction is Hecke-equivariant. -/
theorem heckeAlgebra.map_restrict_equivariant (hlev : (D.withLevel V hV hc).SphericalOutsideT)
    (x : heckeAlgebra (D.withLevel V hV hc) lam) (f : AlgebraicModularForm D lam 𝒪[E]) :
    AlgebraicModularForm.restrict D lam 𝒪[E] V hV hc hVU
        (heckeAlgebra.toEnd D lam (heckeAlgebra.map_restrict D lam V hV hc hVU x) f) =
      heckeAlgebra.toEnd (D.withLevel V hV hc) lam x
        (AlgebraicModularForm.restrict D lam 𝒪[E] V hV hc hVU f) := by
  sorry

/-- `T^T(V, 𝒪) → T^T(U, 𝒪)` is surjective and sends `T_w^j` to `T_w^j`. -/
theorem heckeAlgebra.map_restrict_surjective (hlev : (D.withLevel V hV hc).SphericalOutsideT) :
    Function.Surjective (heckeAlgebra.map_restrict D lam V hV hc hVU) ∧
      ∀ (w : Place D.L) (j : ℕ), D.IsHeckePlace w → 1 ≤ j → j ≤ D.n →
        heckeAlgebra.map_restrict D lam V hV hc hVU (heckeAlgebra.T (D.withLevel V hV hc) lam w j) =
          heckeAlgebra.T D lam w j := by
  sorry

end MapRestrict

-- test: heckeAlgebra_rank_one
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (h0 : lam = 0) (h1 : D.n = 1)
    (hst : D.Standing lam) (hlev : D.SphericalOutsideT) :
    (heckeAlgebra.toEnd D lam).range = Algebra.adjoin 𝒪[E]
        {x | ∃ a : D.G, (∀ v ∈ D.T, localProj D.toCMData v a = 1) ∧
          ∀ (f : AlgebraicModularForm D lam 𝒪[E]) (g : D.G), (x f).1 g = f.1 (g * a)} ∧
    ∀ (w : Place D.L) (hw : D.IsHeckePlace w) (ϖ : (w.Fv)ˣ), IsUniformizer w.Fv ϖ →
      ∀ α : D.G, IsLocalAt D.toCMData w hw.2.2 (diagBlock w.Fv D.n 1 ϖ) α →
      ∀ (f : AlgebraicModularForm D lam 𝒪[E]) (g : D.G),
        (heckeOperator D lam 𝒪[E] w 1 f).1 g = f.1 (g * α) := by
  sorry

-- test: heckeAlgebra_charpoly
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (hst : D.Standing lam)
    (hlev : D.SphericalOutsideT) (f : AlgebraicModularForm D lam 𝒪[E]) (hf : f ≠ 0)
    (θ : heckeAlgebra D lam →ₐ[𝒪[E]] 𝒪[E]) (hθ : ∀ x, heckeAlgebra.toEnd D lam x f = θ x • f)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal]
    (hm : m = RingHom.ker ((IsLocalRing.residue 𝒪[E]).comp (θ : heckeAlgebra D lam →+* 𝒪[E])))
    (w : Place D.L) (hw : D.IsHeckePlace w) :
    (residualRep D lam m (w.dec (geomFrob w.Fv)) :
        Matrix (Fin D.n) (Fin D.n) (heckeAlgebra D lam ⧸ m)).charpoly =
      ∑ j ∈ Finset.range (D.n + 1),
        Polynomial.C (Ideal.Quotient.mk m (algebraMap 𝒪[E] (heckeAlgebra D lam)
          ((-1) ^ j * (w.norm : 𝒪[E]) ^ (j * (j - 1) / 2) *
            (if j = 0 then 1 else θ (heckeAlgebra.T D lam w j))))) *
          Polynomial.X ^ (D.n - j) := by
  sorry

-- test: heckeAlgebra_zero
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (h : Subsingleton (AlgebraicModularForm D lam 𝒪[E])) : Subsingleton (heckeAlgebra D lam) := by
  sorry

-- test: eisenstein_not_nonEisenstein
example (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (h0 : lam = 0) (h2 : D.n = 2)
    (hst : D.Standing lam) (hlev : D.SphericalOutsideT) (hR : D.R = ∅)
    (f : AlgebraicModularForm D lam 𝒪[E]) (hf : f ≠ 0) (hconst : ∀ g g' : D.G, f.1 g = f.1 g')
    (θ : heckeAlgebra D lam →ₐ[𝒪[E]] 𝒪[E]) (hθ : ∀ x, heckeAlgebra.toEnd D lam x f = θ x • f)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal]
    (hm : m = RingHom.ker ((IsLocalRing.residue 𝒪[E]).comp (θ : heckeAlgebra D lam →+* 𝒪[E]))) :
    ¬ IsNonEisenstein D lam m ∧
      ∃ (ψ : Gal D.L →* (heckeAlgebra D lam ⧸ m)ˣ) (P : GL (Fin D.n) (heckeAlgebra D lam ⧸ m)),
        ∀ σ : Gal D.L,
          (residualRep D lam m σ : Matrix (Fin D.n) (Fin D.n) (heckeAlgebra D lam ⧸ m)) * P.1 =
            P.1 * Matrix.diagonal fun i : Fin D.n =>
              if (i : ℕ) = 0 then ((ψ σ : (heckeAlgebra D lam ⧸ m)ˣ) : heckeAlgebra D lam ⧸ m)
              else ((ψ σ * (cycloChar (heckeAlgebra D lam ⧸ m) D.L σ)⁻¹ :
                (heckeAlgebra D lam ⧸ m)ˣ) : heckeAlgebra D lam ⧸ m) := by
  sorry

/-! ### PL.2/exactness-and-freeness: Exactness and group-ring freeness at l-torsion-free level -/

/-- `V ⊴ U` is a normal subgroup with `U/V` abelian of `l`-power order. -/
def HeckeDatum.IsAbelianLCover (D : HeckeDatum E) (V : Subgroup D.G) : Prop :=
  V ≤ D.level ∧ (V.subgroupOf D.level).Normal ∧
    (∀ u u' : D.level, ((u * u' * u⁻¹ * u'⁻¹ : D.level) : D.G) ∈ V) ∧
    ∃ k : ℕ, (V.subgroupOf D.level).index = D.l ^ k

/-- `s` is a set of representatives of `U/V`. -/
def HeckeDatum.IsReps (D : HeckeDatum E) (V : Subgroup D.G) (s : Finset D.level) : Prop :=
  ∀ u : D.level, ∃! r, r ∈ s ∧ ((r⁻¹ * u : D.level) : D.G) ∈ V

/-- The diamond operator `[V u V]` on `S(V, A)` for `u ∈ U` normalising `V`:
`(u·f)(g) = u f(gu)`. -/
def diamondOp (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type) [AddCommGroup A]
    [Module 𝒪[E] A] (V : Subgroup D.G) (hV : IsOpen (V : Set D.G))
    (hc : IsCompact (V : Set D.G)) (u : D.level) :
    Module.End 𝒪[E] (AlgebraicModularForm (D.withLevel V hV hc) lam A) where
  toFun f := ⟨fun g => tensorAction D lam A u (f.1 (g * u)), by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- **PL.2/exactness-and-freeness (1)** (Thorne 2012, Lemma 6.3). If no `t⁻¹ G(L⁺) t ∩ U`
contains an element of order `l`, then `A ↦ S_{λ,{χ_v}}(U, A)` is exact. -/
theorem exactness_and_freeness_1 (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (hst : D.Standing lam) (hno : D.NoOrderL) {A A' A'' : Type} [AddCommGroup A]
    [Module 𝒪[E] A] [AddCommGroup A'] [Module 𝒪[E] A'] [AddCommGroup A''] [Module 𝒪[E] A'']
    (φ : A →ₗ[𝒪[E]] A') (ψ : A' →ₗ[𝒪[E]] A'') (hex : Function.Exact φ ψ) :
    Function.Exact (AlgebraicModularForm.map D lam φ) (AlgebraicModularForm.map D lam ψ) ∧
      (Function.Injective φ → Function.Injective (AlgebraicModularForm.map D lam φ)) ∧
      (Function.Surjective ψ → Function.Surjective (AlgebraicModularForm.map D lam ψ)) := by
  sorry

/-- **PL.2/exactness-and-freeness (2)** (Thorne 2012, Lemma 6.4). If moreover `V ⊴ U` is open with
`U/V` abelian of `l`-power order, the trace identifies the `U/V`-coinvariants of `S(V, A)` with
`S(U, A)`, and `S(V, 𝒪)` is free over `𝒪[U/V]`: for representatives `s` of `U/V` there are forms
`b_1, …, b_r` whose translates `u·b_i`, `u ∈ s`, are an `𝒪`-basis. -/
theorem exactness_and_freeness_2 (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (hst : D.Standing lam) (hno : D.NoOrderL) (V : Subgroup D.G) (hV : IsOpen (V : Set D.G))
    (hc : IsCompact (V : Set D.G)) (hcov : D.IsAbelianLCover V) :
    (∀ (A : Type) [AddCommGroup A] [Module 𝒪[E] A],
      Function.Surjective (AlgebraicModularForm.trace D lam A V hV hc hcov.1) ∧
      LinearMap.ker (AlgebraicModularForm.trace D lam A V hV hc hcov.1) =
        Submodule.span 𝒪[E] {x | ∃ (u : D.level)
          (f : AlgebraicModularForm (D.withLevel V hV hc) lam A),
          x = diamondOp D lam A V hV hc u f - f}) ∧
    ∀ s : Finset D.level, D.IsReps V s →
      ∃ (r : ℕ) (b : Fin r → AlgebraicModularForm (D.withLevel V hV hc) lam 𝒪[E]),
        LinearIndependent 𝒪[E]
          (fun p : s × Fin r => diamondOp D lam 𝒪[E] V hV hc p.1 (b p.2)) ∧
        Submodule.span 𝒪[E]
          (Set.range fun p : s × Fin r => diamondOp D lam 𝒪[E] V hV hc p.1 (b p.2)) = ⊤ := by
  sorry

/-! #### Imported interfaces used by PL.2 (Galois representations) -/

/-- AutomorphicGaloisRepresentationsPartII AG2.6 (stand-in): the `l`-adic representation
`r_l(ι⁻¹σ)` of `G_K` attached by the local Langlands correspondence to an irreducible smooth
representation `σ` of `GL_n(K)`, in the normalisation of Clozel–Harris–Taylor used in Thorne 2012
(`E` large enough to contain its field of definition). -/
def localGaloisRep {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {n : ℕ} (ι : E →+* ℂ) (σ : SmoothIrrep K n) :
    Gal K →ₜ* GL (Fin n) E := sorry

/-! ### PL.2/unitary-constituent-galois-representation: Galois representations attached to
constituents of algebraic modular forms -/

/-- Two families of matrices have the same characteristic polynomials. For representations over a
field of characteristic zero this says that their semisimplifications are isomorphic. -/
def SameCharpoly {G k : Type*} [CommRing k] {n : ℕ} (A B : G → Matrix (Fin n) (Fin n) k) : Prop :=
  ∀ σ, (A σ).charpoly = (B σ).charpoly

/-- The matrices of `ρ^∨(1 - n)`. -/
def dualTwist {K : Type*} [Field K] {n : ℕ} (ρ : Gal K → GL (Fin n) E) (σ : Gal K) :
    Matrix (Fin n) (Fin n) E :=
  ((cyclo E K σ : Eˣ) : E) ^ (1 - (n : ℤ)) • ((ρ σ)⁻¹ : GL (Fin n) E).1ᵀ

/-- The quadratic character `δ_{L/L⁺}` of `G_{L⁺}` with values in `A^×`. -/
def CMData.deltaChar (C : CMData) (A : Type*) [CommRing A] (τ : Gal C.Lplus) : Aˣ :=
  open Classical in if τ ∈ Set.range C.galIncl then 1 else -1

/-- The irreducible constituents `π` of the representation
`S_{λ,{χ_v}}(Q̄_l) = lim_V S_{λ,{χ_v}}(V, Q̄_l)` of `G(𝔸^{∞,R}_{L⁺}) × ∏_{v ∈ R} Iw(ṽ)` that have a
nonzero vector fixed by the level `U` of the datum (`E` large enough that they are defined over
`E`). -/
def Constituent (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) : Type := sorry

namespace Constituent

variable {D : HeckeDatum E} {lam : (D.L →+* E) → Fin D.n → ℤ}

/-- The character through which `T^T_{λ,{χ_v}}(U, 𝒪)` acts on `π^U`. -/
def eigensystem (π : Constituent D lam) : heckeAlgebra D lam →ₐ[𝒪[E]] E := sorry

/-- The representation `ι(π_v ∘ ι_w⁻¹)` of `GL_n(L_w)`, for a place `w` of `L` split over `L⁺` and
not above `R ∪ S(B)`. -/
def component (π : Constituent D lam) (ι : E →+* ℂ) (w : Place D.L) : SmoothIrrep w.Fv D.n :=
  sorry

/-- **`r_l(π)`**, the Galois representation of a constituent (Thorne 2012, Theorem 6.5). -/
def galoisRep (π : Constituent D lam) : Gal D.L →ₜ* GL (Fin D.n) E := sorry

end Constituent

section ConstituentGalois

variable (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ) (hst : D.Standing lam)
  (π : Constituent D lam)

include hst

/-- **PL.2/unitary-constituent-galois-representation** (Thorne 2012, Theorem 6.5; Geraghty,
Proposition 2.7.2): `r_l(π)` is semisimple. -/
theorem unitary_constituent_galois_representation : IsSemisimpleRep π.galoisRep := by
  sorry

/-- **PL.2/unitary-constituent-galois-representation (i)**: local–global compatibility at the split
places `w` not above `S_l ∪ R`: `(r_l(π)|G_{L_w})^{ss} ≅ (r_l(π_v ∘ ι_w⁻¹)^∨(1 - n))^{ss}`; where the
level is `G(𝒪_{L⁺_v})` the representation is unramified and the Frobenius polynomial is the Hecke
polynomial. -/
theorem unitary_constituent_galois_representation_i (ι : E →+* ℂ) (w : Place D.L)
    (hs : D.toCMData.IsSplit w) (hB : D.toCMData.OutsideSB w) (hl : ¬ w.Above D.l)
    (hR : ∀ u ∈ D.R, ¬ D.toCMData.SameBelow u w) :
    SameCharpoly (fun σ : Gal w.Fv => (π.galoisRep (w.dec σ) : Matrix (Fin D.n) (Fin D.n) E))
        (dualTwist (localGaloisRep ι (π.component ι w))) ∧
      (D.IsHeckePlace w → D.levelAt w = integralPoints D.toCMData w →
        IsUnramified (resPlace π.galoisRep w).toMonoidHom ∧
        (π.galoisRep (w.dec (geomFrob w.Fv)) : Matrix (Fin D.n) (Fin D.n) E).charpoly =
          (heckePoly D lam w).map (π.eigensystem : heckeAlgebra D lam →+* E)) := by
  sorry

/-- **PL.2/unitary-constituent-galois-representation (ii)**: `r_l(π)^c ≅ r_l(π)^∨(1 - n)`. -/
theorem unitary_constituent_galois_representation_ii :
    IsConjugateSelfDual D.toCMData π.galoisRep
      (fun σ => cyclo E D.L σ ^ (1 - (D.n : ℤ))) := by
  sorry

/-- **PL.2/unitary-constituent-galois-representation (iii)**: `r_l(π)` is unramified above an inert
place at which the level is hyperspecial (so that `π_v` has a hyperspecial-fixed vector). -/
theorem unitary_constituent_galois_representation_iii (hprod : D.IsProduct)
    (v : Place D.toCMData.Lplus) (hv : D.toCMData.IsInert v)
    (hU : (hyperspecial D.toCMData v).Holds (D.levelAtPlus v)) (w : Place D.L)
    (hwv : D.toCMData.LiesAbove w v) : IsUnramified (resPlace π.galoisRep w).toMonoidHom := by
  sorry

/-- **PL.2/unitary-constituent-galois-representation (iv)**: for `v ∈ R` with Iwahori level (so
that `π^{Iw(ṽ)} ≠ 0`) and `σ ∈ I_{L_ṽ}` with image `Art(u)`, `u ∈ 𝒪_{L_ṽ}^×`, the characteristic
polynomial of `r_l(π)(σ)` is `∏_j (X - χ_{v,j}(u)⁻¹)`. -/
theorem unitary_constituent_galois_representation_iv (v : Place D.L) (hv : v ∈ D.R)
    (hIw : D.levelAt v = iwahoriAt D.toCMData v (hst.R_outside v hv) 0 1) (u : (𝒪[v.Fv])ˣ)
    (σ : Gal v.Fv) (hσ : σ ∈ inertia v.Fv)
    (hu : Abelianization.of σ = artin v.Fv (unitOfInt u)) :
    (π.galoisRep (v.dec σ) : Matrix (Fin D.n) (Fin D.n) E).charpoly =
      ∏ j : Fin D.n, (Polynomial.X - Polynomial.C
        ((((D.χ v j (Units.map (IsLocalRing.residue 𝒪[v.Fv]).toMonoidHom u))⁻¹ : (𝒪[E])ˣ) :
          𝒪[E]) : E)) := by
  sorry

/-- **PL.2/unitary-constituent-galois-representation (v)**: at a place `w | l`, `r_l(π)|G_{L_w}`
is de Rham with `HT_τ = {λ_{τ,j} + n - j}`, and crystalline if `π_v` is unramified. The weight is
extended to all embeddings by `λ_{τc,i} = -λ_{τ,n+1-i}`. -/
theorem unitary_constituent_galois_representation_v (ι : E →+* ℂ)
    (hsymm : ∀ (τ : D.L →+* E) (i : Fin D.n),
      lam (τ.comp (IsCMField.complexConj D.L : D.L →+* D.L)) i = -lam τ (Fin.rev i))
    (w : Place D.L) (hw : w.Above D.l) :
    HasHodgeTate (resPlace π.galoisRep w)
        (fun τ => (Finset.univ : Finset (Fin D.n)).val.map fun j =>
          lam (τ.comp w.emb) j + (D.n : ℤ) - 1 - (j : ℤ)) ∧
      ((unramifiedIrrep w.Fv D.n).Holds (π.component ι w) →
        (crystalline w.Fv E D.n).Holds (resPlace π.galoisRep w)) := by
  sorry

/-- **PL.2/unitary-constituent-galois-representation**, genericity: if `r_l(π)` is irreducible
then `π_v ∘ ι_w⁻¹` is generic at every split place not above `R`. -/
theorem unitary_constituent_galois_representation_generic (ι : E →+* ℂ)
    (hirr : IsAbsIrred π.galoisRep) (w : Place D.L) (hs : D.toCMData.IsSplit w)
    (hB : D.toCMData.OutsideSB w) (hR : ∀ u ∈ D.R, ¬ D.toCMData.SameBelow u w) :
    (genericIrrep w.Fv D.n).Holds (π.component ι w) := by
  sorry

end ConstituentGalois

/-! ### PL.2/hecke-valued-galois-representation: The 𝒢_n-valued Galois representation over the
localized Hecke algebra -/

/-- `ρ` is the `GL_n`-component of the restriction to `G_L` of `r : G_{L⁺} → 𝒢_n(A)`, and
`r⁻¹(𝒢_n⁰(A)) = G_L`. -/
def IsGLRestriction (C : CMData) {A : Type*} [CommRing A] (r : Gal C.Lplus → CHT C.n A)
    (ρ : Gal C.L → GL (Fin C.n) A) : Prop :=
  (∀ τ : Gal C.Lplus, r τ ∈ CHT.conn C.n A ↔ τ ∈ Set.range C.galIncl) ∧
    ∀ σ : Gal C.L, ∃ h : r (C.galIncl σ) ∈ CHT.conn C.n A, CHT.gl C.n A ⟨_, h⟩ = ρ σ

section HeckeGalois

variable (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
  (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal]

/-- The `m`-adic topology of the localisation `T^T_λ(U, 𝒪)_m`. -/
instance heckeAlgebra.topLoc : TopologicalSpace (Localization.AtPrime m) :=
  TopologicalSpace.generateFrom {s | ∃ (x : Localization.AtPrime m) (k : ℕ),
    s = {y | y - x ∈ IsLocalRing.maximalIdeal (Localization.AtPrime m) ^ k}}

/-- The reduction `T^T_λ(U, 𝒪)_m → T^T_λ(U, 𝒪)/m`. -/
def heckeAlgebra.locResidue : Localization.AtPrime m →+* (heckeAlgebra D lam ⧸ m) :=
  IsLocalization.lift (M := m.primeCompl) (g := Ideal.Quotient.mk m) (by sorry)

/-- The extension `r̄_m : G_{L⁺} → 𝒢_n(T/m)` of the residual representation of a non-Eisenstein
maximal ideal. -/
def residualRepCHT : Gal D.toCMData.Lplus →* CHT D.n (heckeAlgebra D lam ⧸ m) := sorry

/-- The sign `µ_m ∈ ℤ/2` of the multiplier of `r̄_m`. -/
def heckeMu (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] : ZMod 2 := sorry

/-- **`r_m`** `: G_{L⁺} → 𝒢_n(T^T_λ(U, 𝒪)_m)`, the lift of `r̄_m` over the localised Hecke algebra
(Thorne 2012, Proposition 6.7). -/
def heckeGaloisRep : Gal D.toCMData.Lplus →ₜ* CHT D.n (Localization.AtPrime m) := sorry

/-- The `GL_n`-component of `r_m|G_L`. -/
def heckeGaloisRepGL : Gal D.L →ₜ* GL (Fin D.n) (Localization.AtPrime m) := sorry

variable (hst : D.Standing lam) (hlev : D.SphericalOutsideT) (hne : IsNonEisenstein D lam m)

include hst hlev hne

/-- **PL.2/hecke-valued-galois-representation** (Thorne 2012, Propositions 6.6–6.7; Clozel–Harris–
Taylor, Proposition 3.4.4), the residual extension: `r̄_m` extends to a continuous homomorphism
`G_{L⁺} → 𝒢_n(T/m)` with `r̄_m⁻¹(𝒢_n⁰) = G_L` and `ν ∘ r̄_m = ε^{1-n} δ_{L/L⁺}^{µ_m}`. -/
theorem hecke_valued_galois_representation_1 :
    IsContinuousResidual (residualRepCHT D lam m) ∧
      IsGLRestriction D.toCMData (residualRepCHT D lam m) (residualRep D lam m) ∧
      ∀ τ : Gal D.toCMData.Lplus,
        CHT.nu D.n (heckeAlgebra D lam ⧸ m) (residualRepCHT D lam m τ) =
          cycloChar (heckeAlgebra D lam ⧸ m) D.toCMData.Lplus τ ^ (1 - (D.n : ℤ)) *
            D.toCMData.deltaChar (heckeAlgebra D lam ⧸ m) τ ^ (heckeMu D lam m).val := by
  sorry

/-- **PL.2/hecke-valued-galois-representation**, the lift: `r_m` lifts `r̄_m`, restricts to `G_L`
with values in `GL_n × GL_1`, (i) is unramified at the split places `w` outside `T` with the
Hecke polynomial as characteristic polynomial of Frobenius, and (iii) has multiplier
`ε^{1-n} δ_{L/L⁺}^{µ_m}`. -/
theorem hecke_valued_galois_representation_2 :
    (CHT.map D.n (heckeAlgebra.locResidue D lam m)).comp (heckeGaloisRep D lam m).toMonoidHom =
        residualRepCHT D lam m ∧
      IsGLRestriction D.toCMData (heckeGaloisRep D lam m) (heckeGaloisRepGL D lam m) ∧
      (∀ w : Place D.L, D.IsHeckePlace w →
        IsUnramified (resPlace (heckeGaloisRepGL D lam m) w).toMonoidHom ∧
        (heckeGaloisRepGL D lam m (w.dec (geomFrob w.Fv)) :
            Matrix (Fin D.n) (Fin D.n) (Localization.AtPrime m)).charpoly =
          (heckePoly D lam w).map (algebraMap (heckeAlgebra D lam) (Localization.AtPrime m))) ∧
      ∀ τ : Gal D.toCMData.Lplus,
        CHT.nu D.n (Localization.AtPrime m) (heckeGaloisRep D lam m τ) =
          cycloChar (Localization.AtPrime m) D.toCMData.Lplus τ ^ (1 - (D.n : ℤ)) *
            D.toCMData.deltaChar (Localization.AtPrime m) τ ^ (heckeMu D lam m).val := by
  sorry

/-- **PL.2/hecke-valued-galois-representation (ii)**: `r_m` is unramified at an inert place `v`
with `U_v` hyperspecial. -/
theorem hecke_valued_galois_representation_3 (v : Place D.toCMData.Lplus)
    (hv : D.toCMData.IsInert v) (hU : (hyperspecial D.toCMData v).Holds (D.levelAtPlus v)) :
    IsUnramified (resPlace (heckeGaloisRep D lam m) v).toMonoidHom := by
  sorry

/-- **PL.2/hecke-valued-galois-representation**, uniqueness: a continuous lift of `r̄_m` with
property (i) is conjugate to `r_m` by an element of `𝒢_n⁰(T_m)` that reduces to the identity. -/
theorem hecke_valued_galois_representation_4
    (r' : Gal D.toCMData.Lplus →ₜ* CHT D.n (Localization.AtPrime m))
    (ρ' : Gal D.L →ₜ* GL (Fin D.n) (Localization.AtPrime m))
    (hlift : (CHT.map D.n (heckeAlgebra.locResidue D lam m)).comp r'.toMonoidHom =
      residualRepCHT D lam m)
    (hρ : IsGLRestriction D.toCMData r' ρ')
    (hfrob : ∀ w : Place D.L, D.IsHeckePlace w →
      IsUnramified (resPlace ρ' w).toMonoidHom ∧
      (ρ' (w.dec (geomFrob w.Fv)) : Matrix (Fin D.n) (Fin D.n) (Localization.AtPrime m)).charpoly =
        (heckePoly D lam w).map (algebraMap (heckeAlgebra D lam) (Localization.AtPrime m))) :
    ∃ g ∈ CHT.conn D.n (Localization.AtPrime m),
      CHT.map D.n (heckeAlgebra.locResidue D lam m) g = 1 ∧
      ∀ τ, r' τ = g * heckeGaloisRep D lam m τ * g⁻¹ := by
  sorry

end HeckeGalois

/-! #### Imported interfaces used by PL.2 (base change and descent) -/

/-- EndoscopicTransferAndUnitaryTraceComparison ET.7a (stand-in): the automorphic representations
`Π` of `G(𝔸_{L⁺})`. -/
def UnitaryAutRep (C : CMData) : Type := sorry

/-- ET.7a (stand-in): the component `Π_v ∘ ι_w⁻¹`, a representation of `GL_n(L_w)`, at a place `w`
of `L` split over `L⁺` and not above `S(B)`. -/
def UnitaryAutRep.component {C : CMData} (P : UnitaryAutRep C) (w : Place C.L) :
    SmoothIrrep w.Fv C.n := sorry

/-- ET.7a (stand-in): the `Π` with `Π_∞ ≅ ξ_a^∨`, `ξ_a` the representation of `G(L⁺_∞)` of highest
weight `a` (`a = 0`: `Π_∞` trivial). -/
def unitaryOfWeight (C : CMData) (a : (C.L →+* ℂ) → Fin C.n → ℤ) : Imported (UnitaryAutRep C) :=
  sorry

/-- ET.7a (stand-in): the `Π` whose component `Π_v` has a nonzero vector fixed by the subgroup
`K ⊂ G(L⁺_v)`. -/
def unitaryFixedBy (C : CMData) (v : Place C.Lplus) (K : Subgroup (unitaryGroup C v.Fv)) :
    Imported (UnitaryAutRep C) := sorry

/-- ET.7a (stand-in): the unramified base change to `GL_n(L_w)` of the component `Π_v` at an inert
place `v` below `w` at which `Π_v` is unramified. -/
def unramifiedBaseChange (C : CMData) (v : Place C.Lplus) (w : Place C.L)
    (P : UnitaryAutRep C) : SmoothIrrep w.Fv C.n := sorry

/-- ET.7a (stand-in): the isobaric sums `π₁ ⊞ ⋯ ⊞ π_s` of discrete conjugate self-dual automorphic
representations `π_i` of `GL_{n_i}(𝔸_F)` with `Σ n_i = n`, `F` a CM field. -/
def IsobaricRep (F : Type) [Field F] [NumberField F] (n : ℕ) : Type := sorry

/-- ET.7a (stand-in): the local component of an isobaric sum. -/
def IsobaricRep.component {F : Type} [Field F] [NumberField F] {n : ℕ} (B : IsobaricRep F n)
    (w : Place F) : SmoothIrrep w.Fv n := sorry

/-- ET.7a (stand-in): the number `s` of summands of an isobaric sum. -/
def IsobaricRep.length {F : Type} [Field F] [NumberField F] {n : ℕ} (B : IsobaricRep F n) : ℕ :=
  sorry

/-! ### PL.2/unitary-base-change-and-descent: Base change and descent between definite unitary
groups and GL_n -/

/-- A polarized `(π, χ)` over a CM field is RACSDC: `r_{l,ι}(χ) = δ_{F/F⁺}^n`, that is
`π^c ≅ π^∨`. -/
def IsRACSDC {F : Type} [Field F] [NumberField F] {n : ℕ} (π : RACP F n) (ι : E →+* ℂ) : Prop :=
  ∀ σ, π.multiplier ι σ = delta F E σ ^ n

/-- `B` is a base change of `Π`: its component at `w` is `Π_v ∘ ι_w⁻¹` for split `v = w w^c` not
in `S(B)`, and the unramified base change of `Π_v` for inert `v` with `Π_v` unramified. -/
def IsBaseChange (C : CMData) (P : UnitaryAutRep C) (B : IsobaricRep C.L C.n) : Prop :=
  (∀ w : Place C.L, C.IsSplit w → C.OutsideSB w → B.component w = P.component w) ∧
    ∀ (v : Place C.Lplus) (w : Place C.L), C.IsInert v → C.LiesAbove w v →
      (∃ K, (hyperspecial C v).Holds K ∧ (unitaryFixedBy C v K).Holds P) →
      B.component w = unramifiedBaseChange C v w P

/-- The automorphic representation `Π` of `G(𝔸_{L⁺})` with `ι⁻¹Π^∞ ≅ π` attached to a constituent
`π` by the comparison of Thorne 2012, Proposition 6.2. -/
def Constituent.autRep {D : HeckeDatum E} {lam : (D.L →+* E) → Fin D.n → ℤ}
    (π : Constituent D lam) (ι : E →+* ℂ) : UnitaryAutRep D.toCMData := sorry

/-- The components of `Π` at split places are those of `π`, and `Π_∞ ≅ ξ_{ιλ}^∨`. -/
theorem Constituent.autRep_spec {D : HeckeDatum E} {lam : (D.L →+* E) → Fin D.n → ℤ}
    (hst : D.Standing lam) (π : Constituent D lam) (ι : E →+* ℂ) :
    (∀ w : Place D.L, D.toCMData.IsSplit w → D.toCMData.OutsideSB w →
        (∀ u ∈ D.R, ¬ D.toCMData.SameBelow u w) → (π.autRep ι).component w = π.component ι w) ∧
      ∃ a : (D.L →+* ℂ) → Fin D.n → ℤ, (∀ τ : D.L →+* E, a (ι.comp τ) = lam τ) ∧
        (unitaryOfWeight D.toCMData a).Holds (π.autRep ι) := by
  sorry

/-- **PL.2/unitary-base-change-and-descent (1)**, descent (Labesse, Théorème 5.4; Geraghty,
Proposition 2.2.7; Clozel–Thorne 2014, Proposition 2.9(2)). A RACSDC `π` of `GL_n(𝔸_L)` descends to
an automorphic `Π` of `G(𝔸_{L⁺})` with `Π_∞ ≅ ξ^∨` of the weight of `π`, `Π_v ≅ π_w ∘ ι_w` at
split places, and a hyperspecial-fixed vector at every inert place where `π` is unramified. -/
theorem unitary_base_change_and_descent_1 (C : CMData) (hSB : C.SB = ∅) (ι : E →+* ℂ)
    (π : RACP C.L C.n) (hπ : IsRACSDC π ι) :
    ∃ P : UnitaryAutRep C, (unitaryOfWeight C π.weight).Holds P ∧
      (∀ w : Place C.L, C.IsSplit w → P.component w = π.component w) ∧
      ∀ v : Place C.Lplus, C.IsInert v →
        (∀ w : Place C.L, C.LiesAbove w v → (unramifiedIrrep w.Fv C.n).Holds (π.component w)) →
        ∃ K, (hyperspecial C v).Holds K ∧ (unitaryFixedBy C v K).Holds P := by
  sorry

/-- **PL.2/unitary-base-change-and-descent (2)**, base change (Labesse, Corollaire 5.3;
Clozel–Thorne 2014, Proposition 2.9(1)). Every automorphic representation of `G(𝔸_{L⁺})` has a
base change `π₁ ⊞ ⋯ ⊞ π_s`. -/
theorem unitary_base_change_and_descent_2 (C : CMData) (hSB : C.SB = ∅) (P : UnitaryAutRep C) :
    ∃ B : IsobaricRep C.L C.n, IsBaseChange C P B := by
  sorry

/-- **PL.2/unitary-base-change-and-descent (2)**, last assertion. If the Galois representation of
a constituent `π` is irreducible, the base change of its automorphic representation has one
summand, which is RACSDC with Galois representation `r_l(π)`. -/
theorem unitary_base_change_and_descent_2_irreducible (D : HeckeDatum E)
    (lam : (D.L →+* E) → Fin D.n → ℤ) (hst : D.Standing lam) (hSB : D.toCMData.SB = ∅)
    (ι : E →+* ℂ) (π : Constituent D lam) (hirr : IsAbsIrred π.galoisRep)
    (B : IsobaricRep D.L D.n) (hB : IsBaseChange D.toCMData (π.autRep ι) B) :
    B.length = 1 ∧ ∃ π₁ : RACP D.L D.n, IsRACSDC π₁ ι ∧
      (∀ w : Place D.L, π₁.component w = B.component w) ∧
      Conj (π₁.galoisRep ι : Gal D.L → GL (Fin D.n) E) π.galoisRep := by
  sorry

/-- **PL.2/unitary-base-change-and-descent (3)(a)**. Every `𝒪`-algebra homomorphism from
`T^T_λ(U, 𝒪)` to `E` is the system of Hecke eigenvalues of a constituent. -/
theorem unitary_base_change_and_descent_3a (D : HeckeDatum E)
    (lam : (D.L →+* E) → Fin D.n → ℤ) (hst : D.Standing lam) (hlev : D.SphericalOutsideT)
    (hSB : D.toCMData.SB = ∅) (f : heckeAlgebra D lam →ₐ[𝒪[E]] E) :
    ∃ π : Constituent D lam, π.eigensystem = f := by
  sorry

/-- **PL.2/unitary-base-change-and-descent (3)(a)**, non-Eisenstein case. For a non-Eisenstein `m`
and an `𝒪`-algebra homomorphism `f : T^T_λ(U, 𝒪)_m → 𝒪`, `f ∘ r_m|G_L ≅ r_{l,ι}(π)` for a RACSDC
`π` of weight `ι_*λ`. -/
theorem unitary_base_change_and_descent_3a_nonEisenstein (D : HeckeDatum E)
    (lam : (D.L →+* E) → Fin D.n → ℤ) (hst : D.Standing lam) (hlev : D.SphericalOutsideT)
    (hSB : D.toCMData.SB = ∅)
    (hsymm : ∀ (τ : D.L →+* E) (i : Fin D.n),
      lam (τ.comp (IsCMField.complexConj D.L : D.L →+* D.L)) i = -lam τ (Fin.rev i))
    (ι : E →+* ℂ) (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal]
    (hne : IsNonEisenstein D lam m) (f : Localization.AtPrime m →ₐ[𝒪[E]] 𝒪[E]) :
    ∃ π : RACP D.L D.n, IsRACSDC π ι ∧ π.HasWeight ι lam ∧
      Conj (fun σ : Gal D.L => Matrix.GeneralLinearGroup.map
          ((algebraMap 𝒪[E] E).comp (f : Localization.AtPrime m →+* 𝒪[E]))
          (heckeGaloisRepGL D lam m σ)) (π.galoisRep ι) := by
  sorry

-- Part (3)(b) uses the arithmetic primes of `Λ` and is stated after PL.2/hida-classicality.

/-- **PL.2/unitary-base-change-and-descent (4)**, division algebra variant (Thorne 2015,
Proposition 4.4). Let `S(B) ≠ ∅` and let `π` be RACSDC of weight `0`, unramified at the places
inert over `L⁺` and an unramified twist of Steinberg above `S(B)`. Then (a) `π` descends to a `σ`
with `σ_∞` trivial and a hyperspecial-fixed vector at every inert place; (b) for prescribed
hyperspecial subgroups `K_v` at the inert places there is such a `σ'` with `K_v`-fixed vectors. -/
theorem unitary_base_change_and_descent_4 (C : CMData) (hSB : C.SB.Nonempty) (ι : E →+* ℂ)
    (π : RACP C.L C.n) (hπ : IsRACSDC π ι) (hw : π.weight = 0)
    (hinert : ∀ w : Place C.L, ¬ C.IsSplit w → (unramifiedIrrep w.Fv C.n).Holds (π.component w))
    (hSt : ∀ w : Place C.L, ¬ C.OutsideSB w → (steinbergTwist w.Fv C.n).Holds (π.component w)) :
    (∃ σ : UnitaryAutRep C, (unitaryOfWeight C 0).Holds σ ∧
      (∀ w : Place C.L, C.IsSplit w → C.OutsideSB w → σ.component w = π.component w) ∧
      ∀ v : Place C.Lplus, C.IsInert v →
        ∃ K, (hyperspecial C v).Holds K ∧ (unitaryFixedBy C v K).Holds σ) ∧
    ∀ K : (v : Place C.Lplus) → Subgroup (unitaryGroup C v.Fv),
      (∀ v, C.IsInert v → (hyperspecial C v).Holds (K v)) →
      ∃ σ' : UnitaryAutRep C, (unitaryOfWeight C 0).Holds σ' ∧
        (∀ w : Place C.L, C.IsSplit w → C.OutsideSB w → σ'.component w = π.component w) ∧
        ∀ v : Place C.Lplus, C.IsInert v → (unitaryFixedBy C v (K v)).Holds σ' := by
  sorry

/-! #### Imported interfaces used by PL.2 (ordinary parts) -/

/-- AutomorphicFormsOnReductiveGroups AF.4/coefficient-lattices (stand-in): the operator
`(w₀λ)(α^j_ϖ)⁻¹ ξ_λ(α^j_ϖ)` on `M_λ`, `α^j_ϖ = diag(ϖ 1_j, 1_{n-j})` at the place `v | l`. It
preserves the lattice and is the identity on the lowest weight line (Geraghty, Definition 2.3.1
and Lemma 2.2.2). -/
def rescaledAction (C : CMData) (l : ℕ) (lam : (C.L →+* E) → Fin C.n → ℤ) (v : Place C.L)
    (j : ℕ) (ϖ : (v.Fv)ˣ) : Module.End 𝒪[E] (weightLattice C l lam) := sorry

/-- PadicFamilies L0a/finite-ordinary-projector (stand-in): the ordinary projector
`lim_r T^{r!}` of an endomorphism `T` of a module of finite length. -/
def finiteOrdinaryProjector {R M : Type} [CommRing R] [AddCommGroup M] [Module R M]
    (T : Module.End R M) : Module.End R M := sorry

/-! ### PL.2/iwahori-ordinary-parts: Iwahori levels at l, the U_p-operators and ordinary parts -/

/-- The choice of one place `ṽ` of `L` above each place `v | l` of `L⁺` (the set `S̃_l`); these
places are split over `L⁺`, not above `S(B)`, and `U_v = G(𝒪_{L⁺_v})` there. -/
structure HeckeDatum.LChoice (D : HeckeDatum E) where
  /-- The set `S̃_l`. -/
  Sl : Set (Place D.L)
  above : ∀ v ∈ Sl, v.Above D.l
  split : ∀ v ∈ Sl, D.toCMData.IsSplit v
  outside : ∀ v ∈ Sl, D.toCMData.OutsideSB v
  exists_below : ∀ w : Place D.L, w.Above D.l → ∃ v ∈ Sl, D.toCMData.SameBelow v w
  distinct : ∀ v ∈ Sl, ∀ v' ∈ Sl, D.toCMData.SameBelow v v' → v = v'
  level : ∀ v ∈ Sl, D.levelAt v = integralPoints D.toCMData v

/-- The torus `T(𝒪_{L⁺,l}) = ∏_{v | l} (𝒪_{L_ṽ}^×)^n`. -/
abbrev HeckeDatum.LChoice.torus {D : HeckeDatum E} (S : D.LChoice) : Type 1 :=
  (v : S.Sl) → Fin D.n → (𝒪[v.1.Fv])ˣ

/-- `T(l^b)`, the kernel of `T(𝒪_{L⁺,l}) → T(𝒪_{L⁺}/l^b)`. -/
def HeckeDatum.LChoice.torusLevel {D : HeckeDatum E} (S : D.LChoice) (b : ℕ) :
    Subgroup S.torus where
  carrier := {u | ∀ (v : S.Sl) (i : Fin D.n),
    ((u v i : (𝒪[v.1.Fv])ˣ) : 𝒪[v.1.Fv]) - 1 ∈ IsLocalRing.maximalIdeal 𝒪[v.1.Fv] ^ b}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

section IwahoriOrdinary

variable (D : HeckeDatum E) (S : D.LChoice)

/-- **`U(l^{b,c})`** `= U^l × ∏_{v ∈ S_l} ι_ṽ⁻¹ Iw(ṽ^{b,c})`. -/
def iwahoriLevel (b c : ℕ) : Subgroup D.G :=
  D.level ⊓ ⨅ (v : Place D.L) (hv : v ∈ S.Sl),
    (iwahoriAt D.toCMData v (S.outside v hv) b c).comap (localProj D.toCMData v)

theorem iwahoriLevel_isOpen (b c : ℕ) : IsOpen (iwahoriLevel D S b c : Set D.G) := by
  sorry

theorem iwahoriLevel_isCompact (b c : ℕ) : IsCompact (iwahoriLevel D S b c : Set D.G) := by
  sorry

/-- The datum at level `U(l^{b,c})`. -/
@[reducible] def HeckeDatum.atIwahori (b c : ℕ) : HeckeDatum E :=
  D.withLevel (iwahoriLevel D S b c) (iwahoriLevel_isOpen D S b c) (iwahoriLevel_isCompact D S b c)

variable (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type) [AddCommGroup A] [Module 𝒪[E] A]

/-- **`U^j_{λ,ϖ_ṽ}`** on `S_{λ,{χ_v}}(U(l^{b,c}), A)`, for `c ≥ 1`, any `𝒪`-module `A`, `v ∈ S_l`
and `1 ≤ j ≤ n`: the rescaled double coset operator of `α^j_ϖ = diag(ϖ 1_j, 1_{n-j})`. -/
def uOperator (b c : ℕ) (v : Place D.L) (j : ℕ) (ϖ : (v.Fv)ˣ) :
    Module.End 𝒪[E] (AlgebraicModularForm (D.atIwahori S b c) lam A) := sorry

/-- The rescaled coset sum: `U^j_{λ,ϖ} f = (w₀λ)(α)⁻¹ Σ_i (x_i α)·f` for
`U(l^{b,c}) α U(l^{b,c}) = ⊔_i x_i α U(l^{b,c})`, with `(g·f)(h) = g_{S_l ∪ R} f(hg)`. -/
theorem uOperator_apply (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) (v : Place D.L) (hv : v ∈ S.Sl) (j : ℕ)
    (hj : 1 ≤ j ∧ j ≤ D.n) (ϖ : (v.Fv)ˣ) (hϖ : IsUniformizer v.Fv ϖ) (α : D.G)
    (hα : IsLocalAt D.toCMData v (S.outside v hv) (diagBlock v.Fv D.n j ϖ) α)
    (s : Finset (D.atIwahori S b c).level)
    (hs : ∀ u : (D.atIwahori S b c).level, ∃! x, x ∈ s ∧
      α⁻¹ * ((x⁻¹ * u : (D.atIwahori S b c).level) : D.G) * α ∈ iwahoriLevel D S b c)
    (f : AlgebraicModularForm (D.atIwahori S b c) lam A) (h : D.G) :
    (uOperator D S lam A b c v j ϖ f).1 h =
      ∑ x ∈ s, tensorAction (D.atIwahori S b c) lam A x
        ((rescaledAction D.toCMData D.l lam v j ϖ).rTensor A (f.1 (h * x * α))) := by
  sorry

/-- **The diamond operators** `⟨u⟩ = [U(l^{b,c}) ι⁻¹(u) U(l^{b,c})]`, `u ∈ T(𝒪_{L⁺,l})`. -/
def diamond (b c : ℕ) :
    S.torus →* Module.End 𝒪[E] (AlgebraicModularForm (D.atIwahori S b c) lam A) := sorry

/-- `⟨u⟩ f = g·f` for any `g ∈ U(l^{0,c})` whose components `ι_ṽ(g_v)` have diagonal `u_v`. -/
theorem diamond_apply (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) (u : S.torus) (g : D.level)
    (hg : (g : D.G) ∈ iwahoriLevel D S 0 c)
    (hdiag : ∀ (v : S.Sl) (i : Fin D.n),
      (iotaW D.toCMData v.1 (S.outside v.1 v.2) (localProj D.toCMData v.1 g) :
        Matrix (Fin D.n) (Fin D.n) v.1.Fv) i i = ((u v i : 𝒪[v.1.Fv]) : v.1.Fv))
    (f : AlgebraicModularForm (D.atIwahori S b c) lam A) (h : D.G) :
    (diamond D S lam A b c u f).1 h = tensorAction D lam A g (f.1 (h * g)) := by
  sorry

/-- The diamond operators factor through `T(𝒪_{L⁺}/l^b)`. -/
theorem diamond_trivial (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) (u : S.torus) (hu : u ∈ S.torusLevel b) :
    diamond D S lam A b c u = 1 := by
  sorry

/-- The generators of `T̃^T_{λ,{χ_v}}(U(l^{b,c}), A)`: the `T_w^j`, `(T_w^n)⁻¹`, the diamond
operators and the `U^j_{λ,ϖ_ṽ}`. -/
def bigHeckeGenerators (b c : ℕ) :
    Set (Module.End 𝒪[E] (AlgebraicModularForm (D.atIwahori S b c) lam A)) :=
  heckeGenerators (D.atIwahori S b c) lam A ∪ Set.range (diamond D S lam A b c) ∪
    {x | ∃ (v : Place D.L) (j : ℕ) (ϖ : (v.Fv)ˣ), v ∈ S.Sl ∧ 1 ≤ j ∧ j ≤ D.n ∧
      IsUniformizer v.Fv ϖ ∧ x = uOperator D S lam A b c v j ϖ}

/-- The operators `T_w^j`, `U^j_{λ,ϖ_ṽ}` and `⟨u⟩` commute with each other
(Geraghty, Lemma 2.3.3). -/
theorem bigHeckeGenerators_commute (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) :
    ∀ x ∈ bigHeckeGenerators D S lam A b c, ∀ y ∈ bigHeckeGenerators D S lam A b c,
      x * y = y * x := by
  sorry

/-- `U(l) = ∏_{v ∈ S_l} ∏_{j=1}^n U^j_{λ,ϖ_ṽ}`. -/
def UlOperator (b c : ℕ) (ϖ : (v : Place D.L) → (v.Fv)ˣ) :
    Module.End 𝒪[E] (AlgebraicModularForm (D.atIwahori S b c) lam A) := sorry

/-- `U(l)` is the product of the `U^j_{λ,ϖ_ṽ}` over any enumeration of the pairs `(v, j)`. -/
theorem UlOperator_eq (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) (ϖ : (v : Place D.L) → (v.Fv)ˣ)
    (L : List (Place D.L × ℕ)) (hL : L.Nodup)
    (hmem : ∀ p, p ∈ L ↔ p.1 ∈ S.Sl ∧ 1 ≤ p.2 ∧ p.2 ≤ D.n) :
    UlOperator D S lam A b c ϖ =
      (L.map fun p => uOperator D S lam A b c p.1 p.2 (ϖ p.1)).prod := by
  sorry

/-- **The ordinary idempotent `e`** on `S_{λ,{χ_v}}(U(l^{b,c}), A)`, for `c ≥ 1` and `A` finitely
generated over `𝒪`: the idempotent of the finite `𝒪`-algebra `T̃^T` cutting out the maximal ideals
that contain no `U^j_{λ,ϖ_ṽ}`. -/
def ordinaryIdempotent (b c : ℕ) :
    Module.End 𝒪[E] (AlgebraicModularForm (D.atIwahori S b c) lam A) := sorry

/-- The ordinary part `S^{ord} = eS`. -/
def ordinaryPart (b c : ℕ) : Submodule 𝒪[E] (AlgebraicModularForm (D.atIwahori S b c) lam A) :=
  LinearMap.range (ordinaryIdempotent D S lam A b c)

/-- `e² = e`, `e` lies in `T̃^T`, and `e` commutes with all Hecke, diamond and `U`-operators. -/
@[simp]
theorem ordinaryIdempotent_isIdempotent (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) [Module.Finite 𝒪[E] A] :
    ordinaryIdempotent D S lam A b c * ordinaryIdempotent D S lam A b c =
        ordinaryIdempotent D S lam A b c ∧
      ordinaryIdempotent D S lam A b c ∈ Algebra.adjoin 𝒪[E] (bigHeckeGenerators D S lam A b c) ∧
      ∀ x ∈ bigHeckeGenerators D S lam A b c,
        x * ordinaryIdempotent D S lam A b c = ordinaryIdempotent D S lam A b c * x := by
  sorry

/-- `e = lim_r U(l)^{r!}`, and `U(l)` is topologically nilpotent on `(1 - e)S`. -/
theorem ordinaryIdempotent_eq_limit (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) [Module.Finite 𝒪[E] A]
    (ϖ : (v : Place D.L) → (v.Fv)ˣ) (hϖ : ∀ v, IsUniformizer v.Fv (ϖ v)) (k : ℕ) :
    ∃ r₀ : ℕ, ∀ r ≥ r₀, ∀ f : AlgebraicModularForm (D.atIwahori S b c) lam A,
      (UlOperator D S lam A b c ϖ ^ r.factorial - ordinaryIdempotent D S lam A b c) f ∈
          IsLocalRing.maximalIdeal 𝒪[E] ^ k • (⊤ : Submodule 𝒪[E] _) ∧
        (UlOperator D S lam A b c ϖ ^ r) ((1 - ordinaryIdempotent D S lam A b c) f) ∈
          IsLocalRing.maximalIdeal 𝒪[E] ^ k • (⊤ : Submodule 𝒪[E] _) := by
  sorry

/-- The submodules stable under the `U^j_{λ,ϖ_ṽ}` on which each of them is bijective, for a choice
`ϖ` of uniformizers. -/
def UBijectiveOn (b c : ℕ) (ϖ : (v : Place D.L) → (v.Fv)ˣ)
    (N : Submodule 𝒪[E] (AlgebraicModularForm (D.atIwahori S b c) lam A)) : Prop :=
  ∀ v ∈ S.Sl, ∀ j : ℕ, 1 ≤ j → j ≤ D.n →
    (∀ f ∈ N, uOperator D S lam A b c v j (ϖ v) f ∈ N) ∧
    ∀ g ∈ N, ∃! f, f ∈ N ∧ uOperator D S lam A b c v j (ϖ v) f = g

/-- `eS` is the largest submodule on which every `U^j_{λ,ϖ_ṽ}` is bijective; it does not depend
on the uniformizers `ϖ_ṽ`. -/
theorem ordinaryPart_indep_uniformizer (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) [Module.Finite 𝒪[E] A]
    (ϖ : (v : Place D.L) → (v.Fv)ˣ) (hϖ : ∀ v, IsUniformizer v.Fv (ϖ v)) :
    UBijectiveOn D S lam A b c ϖ (ordinaryPart D S lam A b c) ∧
      ∀ N, UBijectiveOn D S lam A b c ϖ N → N ≤ ordinaryPart D S lam A b c := by
  sorry

/-- For `b ≤ b'` and `c ≤ c'` the inclusion `S(U(l^{b,c}), A) ⊂ S(U(l^{b',c'}), A)` commutes with
`e`. -/
theorem ordinaryPart_restrict (b c b' c' : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) (hb : b ≤ b') (hc : c ≤ c')
    (hbc' : b' ≤ c') [Module.Finite 𝒪[E] A]
    (f : AlgebraicModularForm (D.atIwahori S b c) lam A)
    (f' : AlgebraicModularForm (D.atIwahori S b' c') lam A)
    (hf : D.asFun lam A f'.1 = D.asFun lam A f.1) :
    D.asFun lam A (ordinaryIdempotent D S lam A b' c' f').1 =
      D.asFun lam A (ordinaryIdempotent D S lam A b c f).1 := by
  sorry

end IwahoriOrdinary

/-- `K/𝒪` as an `𝒪`-module. -/
abbrev KmodO (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] : Type :=
  E ⧸ LinearMap.range (Algebra.linearMap 𝒪[E] E)

section OrdinaryLimit

variable (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)

/-- `S_{λ,{χ_v}}(U(l^∞), K/𝒪) = colim_c S_{λ,{χ_v}}(U(l^{c,c}), K/𝒪)`, as a module of functions
on `G(𝔸^∞_{L⁺})`. -/
def formsInfty :
    Submodule 𝒪[E] (D.G → TensorProduct 𝒪[E] (D.weightModule lam) (KmodO E)) :=
  ⨆ (c : ℕ) (_ : 1 ≤ c), AlgebraicModularForm (D.atIwahori S c c) lam (KmodO E)

/-- The ordinary idempotent on `S_{λ,{χ_v}}(U(l^∞), K/𝒪)`. -/
def ordinaryIdempotentInfty : Module.End 𝒪[E] (formsInfty D S lam) := sorry

/-- The ordinary idempotent on `S(U(l^∞), K/𝒪)` is the unique endomorphism restricting to the
ordinary idempotent of `S(U(l^{c,c}), K/𝒪)` for every `c ≥ 1`. -/
theorem ordinaryIdempotentInfty_spec (e : Module.End 𝒪[E] (formsInfty D S lam)) :
    e = ordinaryIdempotentInfty D S lam ↔
      ∀ (c : ℕ) (_ : 1 ≤ c) (f : AlgebraicModularForm (D.atIwahori S c c) lam (KmodO E))
        (f' : formsInfty D S lam), f'.1 = D.asFun lam (KmodO E) f.1 →
        (e f').1 = D.asFun lam (KmodO E) (ordinaryIdempotent D S lam (KmodO E) c c f).1 := by
  sorry

/-- `S^{ord}_{λ,{χ_v}}(U(l^∞), K/𝒪)`. -/
def ordinaryPartInfty : Submodule 𝒪[E] (formsInfty D S lam) :=
  LinearMap.range (ordinaryIdempotentInfty D S lam)

end OrdinaryLimit

-- test: ordinaryIdempotent_rank_one
example (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (hst : D.Standing lam) (h1 : D.n = 1) (A : Type) [AddCommGroup A] [Module 𝒪[E] A]
    [Module.Finite 𝒪[E] A] (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c) :
    (∀ v ∈ S.Sl, ∀ ϖ : (v.Fv)ˣ, IsUniformizer v.Fv ϖ →
      IsUnit (uOperator D S lam A b c v 1 ϖ)) ∧
      ordinaryIdempotent D S lam A b c = 1 := by
  sorry

-- test: ordinaryIdempotent_zero
example (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type)
    [AddCommGroup A] [Module 𝒪[E] A] [Module.Finite 𝒪[E] A] (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c)
    (h0 : Subsingleton (AlgebraicModularForm (D.atIwahori S b c) lam A)) :
    ordinaryPart D S lam A b c = ⊥ := by
  sorry

-- test: ordinary_compatibility_padicFamilies
example (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (hst : D.Standing lam) (b c k : ℕ) (hbc : b ≤ c ∧ 1 ≤ c)
    (ϖ : (v : Place D.L) → (v.Fv)ˣ) (hϖ : ∀ v, IsUniformizer v.Fv (ϖ v)) :
    ordinaryIdempotent D S lam (𝒪[E] ⧸ IsLocalRing.maximalIdeal 𝒪[E] ^ k) b c =
      finiteOrdinaryProjector
        (UlOperator D S lam (𝒪[E] ⧸ IsLocalRing.maximalIdeal 𝒪[E] ^ k) b c ϖ) := by
  sorry

-- test: nonordinary_example
example (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (hst : D.Standing lam) (b c : ℕ) (hbc : b ≤ c ∧ 1 ≤ c)
    (ϖ : (v : Place D.L) → (v.Fv)ˣ) (hϖ : ∀ v, IsUniformizer v.Fv (ϖ v))
    (f : AlgebraicModularForm (D.atIwahori S b c) lam 𝒪[E]) (a : 𝒪[E])
    (ha : a ∈ IsLocalRing.maximalIdeal 𝒪[E]) (hf : UlOperator D S lam 𝒪[E] b c ϖ f = a • f) :
    ordinaryIdempotent D S lam 𝒪[E] b c f = 0 ∧
      (1 - ordinaryIdempotent D S lam 𝒪[E] b c) f = f := by
  sorry

/-! #### Imported interfaces used by PL.2 (Iwasawa algebra) -/

/-- LocalGaloisDeformationRings L8/ordinary-coefficient-ring (stand-in): the group-like elements
`[u] ∈ Λ^×`, `u ∈ T(l)`, of `Λ = 𝒪⟦T(l)⟧`. -/
def iwasawaAlgebra.of (D : HeckeDatum E) (S : D.LChoice) :
    S.torusLevel 1 →* (iwasawaAlgebra D)ˣ := sorry

/-- LocalGaloisDeformationRings L8/ordinary-coefficient-ring (stand-in): the `𝒪`-algebra
homomorphism `Λ → 𝒪` induced by a continuous character `T(l) → 𝒪^×`. -/
def iwasawaAlgebra.lift (D : HeckeDatum E) (S : D.LChoice) (ψ : S.torusLevel 1 →* (𝒪[E])ˣ) :
    iwasawaAlgebra D →ₐ[𝒪[E]] 𝒪[E] := sorry

/-! ### PL.2/big-ordinary-hecke-algebra: The big ordinary Hecke algebra over Λ -/

/-- The weight `0`. -/
abbrev HeckeDatum.zeroWeight (D : HeckeDatum E) : (D.L →+* E) → Fin D.n → ℤ := 0

/-- The weight `ν` with `ν_τ = (n - 1, …, 1, 0)`. -/
def HeckeDatum.nu (D : HeckeDatum E) : (D.L →+* E) → Fin D.n → ℤ :=
  fun _ i => (D.n : ℤ) - 1 - (i : ℤ)

/-- The character `(w₀λ)(u) = ∏_{τ ∈ Ĩ_l} ∏_i τ(u_i)^{λ_{τ,n+1-i}}` of `T(𝒪_{L⁺,l})`. -/
def w0char {D : HeckeDatum E} (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ) :
    S.torus →* (𝒪[E])ˣ := sorry

theorem w0char_coe {D : HeckeDatum E} (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (u : S.torus) :
    (((w0char S lam u : (𝒪[E])ˣ) : 𝒪[E]) : E) =
      ∏ᶠ v : S.Sl, ∏ i : Fin D.n,
        ((algChar (fun τ : v.1.Fv →+* E => lam (τ.comp v.1.emb) (Fin.rev i))
          (unitOfInt (u v i)) : Eˣ) : E) := by
  sorry

section OrdHecke

variable (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ) (A : Type)
  [AddCommGroup A] [Module 𝒪[E] A]

/-- **`T^{T,ord}_{λ,{χ_v}}(U(l^{b,c}), A)`**: the image in `End_𝒪(eS)` of the algebra generated by
the `T_w^j`, `(T_w^n)⁻¹` and the diamond operators (Thorne 2012, Definition 8.1). -/
def ordHeckeAlgebra (b c : ℕ) :
    Subalgebra 𝒪[E] (Module.End 𝒪[E] (ordinaryPart D S lam A b c)) :=
  Algebra.adjoin 𝒪[E] {x | ∃ y ∈ heckeGenerators (D.atIwahori S b c) lam A ∪
      Set.range (diamond D S lam A b c),
    ∀ f : ordinaryPart D S lam A b c,
      ((x f : ordinaryPart D S lam A b c) : AlgebraicModularForm (D.atIwahori S b c) lam A) =
        y f}

end OrdHecke

namespace bigOrdinaryHeckeAlgebra

variable (D : HeckeDatum E) (S : D.LChoice)

-- `bigOrdinaryHeckeAlgebra` is in Core.lean.

/-- The element `T_w^j` of the big ordinary Hecke algebra. -/
def T (w : Place D.L) (j : ℕ) : bigOrdinaryHeckeAlgebra D := sorry

/-- The diamond operator `⟨u⟩`, `u ∈ T(𝒪_{L⁺,l})`, in the big ordinary Hecke algebra. -/
def diamond : S.torus →* (bigOrdinaryHeckeAlgebra D)ˣ := sorry

/-- The `Λ`-algebra structure through the twisted diamond operators (Thorne 2012,
Definition 8.3); the instance is declared in Core.lean. -/
@[reducible] def lambdaAlgebra : Algebra (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) :=
  inferInstance

/-- `[u] ∈ Λ` acts as `(∏_τ ∏_i τ(u_i)^{1-i}) ⟨u⟩ = (w₀ν)(u)⁻¹ ⟨u⟩`. -/
theorem lambdaAlgebra_of (u : S.torusLevel 1) :
    algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) (iwasawaAlgebra.of D S u) =
      (((w0char S D.nu u)⁻¹ : (𝒪[E])ˣ) : 𝒪[E]) •
        ((diamond D S u : (bigOrdinaryHeckeAlgebra D)ˣ) : bigOrdinaryHeckeAlgebra D) := by
  sorry

/-- The action of the big ordinary Hecke algebra on `S^{ord}_{0,{χ_v}}(U(l^∞), K/𝒪)`. -/
def toEnd : bigOrdinaryHeckeAlgebra D →ₐ[𝒪[E]]
    Module.End 𝒪[E] (ordinaryPartInfty D S D.zeroWeight) := sorry

/-- `T_w^j` and `⟨u⟩` act on forms of level `U(l^{c,c})` by the operators of that level. -/
theorem toEnd_spec (c : ℕ) (hc : 1 ≤ c) (f' : ordinaryPartInfty D S D.zeroWeight)
    (f : AlgebraicModularForm (D.atIwahori S c c) D.zeroWeight (KmodO E))
    (hf : f'.1.1 = D.asFun D.zeroWeight (KmodO E) f.1) :
    (∀ (w : Place D.L) (j : ℕ), D.IsHeckePlace w → 1 ≤ j → j ≤ D.n →
      (toEnd D S (T D w j) f').1.1 = D.asFun D.zeroWeight (KmodO E)
        (heckeOperator (D.atIwahori S c c) D.zeroWeight (KmodO E) w j f).1) ∧
    ∀ u : S.torus, (toEnd D S (diamond D S u) f').1.1 = D.asFun D.zeroWeight (KmodO E)
        (TauCeti.DefiniteUnitary.diamond D S D.zeroWeight (KmodO E) c c u f).1 := by
  sorry

/-- The big ordinary Hecke algebra acts faithfully on `e S(U(l^∞), K/𝒪)`. -/
theorem faithful (hst : D.Standing D.zeroWeight) (hlev : D.SphericalOutsideT) :
    Function.Injective (toEnd D S) := by
  sorry

/-- The specialisation `T^{T,ord}(U(l^∞), 𝒪) → T^{T,ord}_0(U(l^{c,c}), 𝒪)`. -/
def specialize (c : ℕ) :
    bigOrdinaryHeckeAlgebra D →ₐ[𝒪[E]] ordHeckeAlgebra D S D.zeroWeight 𝒪[E] c c := sorry

/-- The specialisations are surjective, send `T_w^j` to `T_w^j`, and are jointly injective: the big
algebra is the inverse limit of the algebras of finite level. -/
theorem specialize_spec (hst : D.Standing D.zeroWeight) (hlev : D.SphericalOutsideT) :
    (∀ c : ℕ, 1 ≤ c → Function.Surjective (specialize D S c)) ∧
    (∀ (c : ℕ) (w : Place D.L) (j : ℕ), 1 ≤ c → D.IsHeckePlace w → 1 ≤ j → j ≤ D.n →
      ∀ f : ordinaryPart D S D.zeroWeight 𝒪[E] c c,
        (((specialize D S c (T D w j) : ordHeckeAlgebra D S D.zeroWeight 𝒪[E] c c) :
            Module.End 𝒪[E] (ordinaryPart D S D.zeroWeight 𝒪[E] c c)) f :
          AlgebraicModularForm (D.atIwahori S c c) D.zeroWeight 𝒪[E]) =
        heckeOperator (D.atIwahori S c c) D.zeroWeight 𝒪[E] w j f) ∧
    ∀ x : bigOrdinaryHeckeAlgebra D, (∀ c : ℕ, 1 ≤ c → specialize D S c x = 0) → x = 0 := by
  sorry

/-- The localisation `T_m` at a maximal ideal. -/
abbrev localize (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal] : Type :=
  Localization.AtPrime m

/-- The big ordinary Hecke algebra is finite over `Λ`. -/
theorem finite_lambda (hst : D.Standing D.zeroWeight) (hlev : D.SphericalOutsideT) :
    Module.Finite (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) := by
  sorry

/-- `T_m` is a complete local `Λ`-algebra, finite over `Λ`, and the big ordinary Hecke algebra is
the product of its localisations. -/
theorem localize_spec (hst : D.Standing D.zeroWeight) (hlev : D.SphericalOutsideT) :
    (∀ (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal],
      IsAdicComplete (IsLocalRing.maximalIdeal (localize D m)) (localize D m) ∧
      Module.Finite (iwasawaAlgebra D) (localize D m)) ∧
    Finite (MaximalSpectrum (bigOrdinaryHeckeAlgebra D)) ∧
    Function.Bijective (RingHom.pi fun m : MaximalSpectrum (bigOrdinaryHeckeAlgebra D) =>
      algebraMap (bigOrdinaryHeckeAlgebra D) (Localization.AtPrime m.asIdeal)) := by
  sorry

end bigOrdinaryHeckeAlgebra

/-- LocalGaloisDeformationRings L8/ordinary-coefficient-ring (stand-in): the subalgebra
`Λ_b = 𝒪⟦T(l^b)⟧` of `Λ = 𝒪⟦T(l)⟧`, for `b ≥ 1`. -/
def iwasawaAlgebra.sub (D : HeckeDatum E) (S : D.LChoice) (b : ℕ) :
    Subalgebra 𝒪[E] (iwasawaAlgebra D) := sorry

/-- The level `U` is sufficiently small: its projection to some `G(L⁺_v)` contains no nontrivial
element of finite order. -/
def IsSufficientlySmall (C : CMData) (U : Subgroup (unitaryGroup C C.finiteAdeles)) : Prop :=
  ∃ v : Place C.Lplus, ∀ g ∈ U.map (localProjPlus C v), IsOfFinOrder g → g = 1

section Arithmetic

variable (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)

/-- The character `u ↦ α(u) (w₀ν)(u)⁻¹ (w₀λ)(u)⁻¹` of `T(l)`, for a character `α` of finite
order. -/
def arithmeticChar (α : S.torusLevel 1 →* (𝒪[E])ˣ) : S.torusLevel 1 →* (𝒪[E])ˣ :=
  α * ((w0char S D.nu)⁻¹ * (w0char S lam)⁻¹).comp (S.torusLevel 1).subtype

/-- **The arithmetic prime `℘_{λ,α}`** of `Λ`: the kernel of the homomorphism `Λ → 𝒪` induced by
`u ↦ α(u) (w₀ν)(u)⁻¹ (w₀λ)(u)⁻¹` (Geraghty, Definition 2.6.3; `E` contains the values of `α`). -/
def arithmeticPrime (α : S.torusLevel 1 →* (𝒪[E])ˣ) : Ideal (iwasawaAlgebra D) :=
  RingHom.ker (iwasawaAlgebra.lift D S (arithmeticChar D S lam α))

/-- The kernel of `Λ → 𝒪[T(l)/T(l^c)]`, `u ↦ (w₀ν)(u)⁻¹ (w₀λ)(u)⁻¹ [u]`: the ideal generated by
the `[u] - (w₀ν)(u)⁻¹ (w₀λ)(u)⁻¹`, `u ∈ T(l^c)`. -/
def twistedLevelIdeal (c : ℕ) : Ideal (iwasawaAlgebra D) :=
  Ideal.span {x | ∃ u : S.torusLevel 1, u.1 ∈ S.torusLevel c ∧
    x = ((iwasawaAlgebra.of D S u : (iwasawaAlgebra D)ˣ) : iwasawaAlgebra D) -
      algebraMap 𝒪[E] (iwasawaAlgebra D)
        (((w0char S D.nu u.1)⁻¹ * (w0char S lam u.1)⁻¹ : (𝒪[E])ˣ) : 𝒪[E])}

variable (A : Type) [AddCommGroup A] [Module 𝒪[E] A]

/-- **`S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, A)`**: the ordinary forms of level `U(l^{r,r})` on which
`⟨u⟩ = α(u)` for all `u ∈ T(l)`. -/
def ordFormsAlpha (r : ℕ) (α : S.torusLevel 1 →* (𝒪[E])ˣ) :
    Submodule 𝒪[E] (AlgebraicModularForm (D.atIwahori S r r) lam A) where
  carrier := {f | f ∈ ordinaryPart D S lam A r r ∧ ∀ u : S.torusLevel 1,
    diamond D S lam A r r u.1 f = ((α u : (𝒪[E])ˣ) : 𝒪[E]) • f}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- **`T^{T,ord}_{λ,{χ_v}}(U(l^{r,r}), α, A)`**: the image of the Hecke algebra in the
endomorphisms of `S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, A)`. -/
def ordHeckeAlgebraAlpha (r : ℕ) (α : S.torusLevel 1 →* (𝒪[E])ˣ) :
    Subalgebra 𝒪[E] (Module.End 𝒪[E] (ordFormsAlpha D S lam A r α)) :=
  Algebra.adjoin 𝒪[E] {x | ∃ y ∈ heckeGenerators (D.atIwahori S r r) lam A ∪
      Set.range (diamond D S lam A r r),
    ∀ f : ordFormsAlpha D S lam A r α,
      ((x f : ordFormsAlpha D S lam A r α) : AlgebraicModularForm (D.atIwahori S r r) lam A) =
        y f}

/-- `φ` is the specialisation of the weight `0` big ordinary Hecke algebra at the arithmetic prime
`℘_{λ,α}` induced by `φ_λ`: it sends `T_w^j` to `T_w^j` and `⟨u⟩` to `(w₀λ)(u)⁻¹⟨u⟩`, `Λ` acts
through `Λ/℘_{λ,α}`, the image spans the target after inverting `l`, and the kernel of the induced
map on `T ⊗_Λ Λ_℘/℘` is nilpotent. -/
def IsClassicalSpecialization (r : ℕ) (α : S.torusLevel 1 →* (𝒪[E])ˣ)
    (φ : bigOrdinaryHeckeAlgebra D →ₐ[𝒪[E]] ordHeckeAlgebraAlpha D S lam E r α) : Prop :=
  (∀ (w : Place D.L) (j : ℕ), D.IsHeckePlace w → 1 ≤ j → j ≤ D.n →
    ∀ f : ordFormsAlpha D S lam E r α,
      (((φ (bigOrdinaryHeckeAlgebra.T D w j) : ordHeckeAlgebraAlpha D S lam E r α) :
          Module.End 𝒪[E] (ordFormsAlpha D S lam E r α)) f :
        AlgebraicModularForm (D.atIwahori S r r) lam E) =
      heckeOperator (D.atIwahori S r r) lam E w j f) ∧
  (∀ (u : S.torus) (f : ordFormsAlpha D S lam E r α),
      (((φ (bigOrdinaryHeckeAlgebra.diamond D S u) : ordHeckeAlgebraAlpha D S lam E r α) :
          Module.End 𝒪[E] (ordFormsAlpha D S lam E r α)) f :
        AlgebraicModularForm (D.atIwahori S r r) lam E) =
      (((w0char S lam u)⁻¹ : (𝒪[E])ˣ) : 𝒪[E]) • diamond D S lam E r r u f) ∧
  (∀ x : iwasawaAlgebra D, φ (algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) x) =
    algebraMap 𝒪[E] _ (iwasawaAlgebra.lift D S (arithmeticChar D S lam α) x)) ∧
  (∀ y : ordHeckeAlgebraAlpha D S lam E r α, ∃ (k : ℕ) (x : bigOrdinaryHeckeAlgebra D),
    φ x = (D.l : 𝒪[E]) ^ k • y) ∧
  ∀ x : bigOrdinaryHeckeAlgebra D, φ x = 0 → ∃ (N : ℕ) (s : iwasawaAlgebra D),
    s ∉ arithmeticPrime D S lam α ∧
    s • x ^ N ∈ Ideal.map (algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D))
      (arithmeticPrime D S lam α)

end Arithmetic

-- test: bigOrd_rank_one
example (D : HeckeDatum E) (S : D.LChoice) (h1 : D.n = 1) (hst : D.Standing D.zeroWeight)
    (hlev : D.SphericalOutsideT) :
    (∀ c : ℕ, 1 ≤ c → ordinaryIdempotent D S D.zeroWeight 𝒪[E] c c = 1 ∧
      Module.finrank 𝒪[E] (ordHeckeAlgebra D S D.zeroWeight 𝒪[E] c c) =
        Nat.card (DoubleCosetSpace D.toCMData (iwahoriLevel D S c c))) ∧
    Module.Finite (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) ∧
    ((Module.Free (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) ∧
        Module.finrank (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) =
          Nat.card (DoubleCosetSpace D.toCMData (iwahoriLevel D S 1 1))) ↔
      globalPoints D.toCMData ⊓ iwahoriLevel D S 1 1 = ⊥) ∧
    (globalPoints D.toCMData ⊓ iwahoriLevel D S 1 1 = ⊥ ↔
      ∀ g ∈ globalPoints D.toCMData ⊓ D.level, orderOf g ≠ D.l) := by
  sorry

-- test: bigOrd_zero
example (D : HeckeDatum E) (S : D.LChoice) (hst : D.Standing D.zeroWeight)
    (hlev : D.SphericalOutsideT) (h0 : ordinaryPart D S D.zeroWeight 𝓀[E] 1 1 = ⊥) :
    Subsingleton (bigOrdinaryHeckeAlgebra D) := by
  sorry

-- test: bigOrd_specialization
-- Rationally, at the arithmetic prime `℘_{λ,α}` (Geraghty, Lemma 2.6.4; no smallness hypothesis).
example (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (hst : D.Standing lam) (hlev : D.SphericalOutsideT) (r : ℕ) (hr : 1 ≤ r)
    (α : S.torusLevel 1 →* (𝒪[E])ˣ) (hα : ∀ u : S.torusLevel 1, u.1 ∈ S.torusLevel r → α u = 1) :
    ∃ φ : bigOrdinaryHeckeAlgebra D →ₐ[𝒪[E]] ordHeckeAlgebraAlpha D S lam E r α,
      IsClassicalSpecialization D S lam r α φ := by
  sorry

-- Integrally, for each `c ≥ 1`.
example (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (hst : D.Standing lam) (hlev : D.SphericalOutsideT) (c : ℕ) (hc : 1 ≤ c) :
    ∃ φ : bigOrdinaryHeckeAlgebra D →ₐ[𝒪[E]] ordHeckeAlgebra D S lam 𝒪[E] c c,
      Function.Surjective φ ∧
      (∀ (w : Place D.L) (j : ℕ), D.IsHeckePlace w → 1 ≤ j → j ≤ D.n →
        ∀ f : ordinaryPart D S lam 𝒪[E] c c,
          (((φ (bigOrdinaryHeckeAlgebra.T D w j) : ordHeckeAlgebra D S lam 𝒪[E] c c) :
              Module.End 𝒪[E] (ordinaryPart D S lam 𝒪[E] c c)) f :
            AlgebraicModularForm (D.atIwahori S c c) lam 𝒪[E]) =
          heckeOperator (D.atIwahori S c c) lam 𝒪[E] w j f) ∧
      (∀ (u : S.torus) (f : ordinaryPart D S lam 𝒪[E] c c),
          (((φ (bigOrdinaryHeckeAlgebra.diamond D S u) : ordHeckeAlgebra D S lam 𝒪[E] c c) :
              Module.End 𝒪[E] (ordinaryPart D S lam 𝒪[E] c c)) f :
            AlgebraicModularForm (D.atIwahori S c c) lam 𝒪[E]) =
          (((w0char S lam u)⁻¹ : (𝒪[E])ˣ) : 𝒪[E]) • diamond D S lam 𝒪[E] c c u f) ∧
      ∀ x ∈ twistedLevelIdeal D S lam c,
        φ (algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) x) = 0 := by
  sorry

-- test: bigOrd_not_finite_over_O
example (D : HeckeDatum E) (S : D.LChoice) (hst : D.Standing D.zeroWeight)
    (hlev : D.SphericalOutsideT) (hne : ordinaryPart D S D.zeroWeight 𝓀[E] 1 1 ≠ ⊥) :
    ¬ Module.Finite 𝒪[E] (bigOrdinaryHeckeAlgebra D) ∧
    ∀ b₀ : ℕ, 1 ≤ b₀ → IsSufficientlySmall D.toCMData (iwahoriLevel D S b₀ b₀) →
      Module.Finite (iwasawaAlgebra.sub D S b₀) (bigOrdinaryHeckeAlgebra D) ∧
      (∀ x : iwasawaAlgebra.sub D S b₀,
        algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) x = 0 → x = 0) ∧
      ringKrullDim (iwasawaAlgebra.sub D S b₀) =
        1 + D.n * Module.finrank ℚ D.toCMData.Lplus := by
  sorry

/-! ### PL.2/ordinary-forms-free-over-lambda: Ordinary forms are finite free over Λ -/

section FreeOverLambda

variable (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)

/-- The diamond operators on `S^{ord}_{λ,{χ_v}}(U(l^∞), K/𝒪)`. -/
def diamondInfty : S.torus →* Module.End 𝒪[E] (ordinaryPartInfty D S lam) := sorry

/-- On forms of level `U(l^{c,c})` they are the diamond operators of that level. -/
theorem diamondInfty_spec (c : ℕ) (hc : 1 ≤ c) (f' : ordinaryPartInfty D S lam)
    (f : AlgebraicModularForm (D.atIwahori S c c) lam (KmodO E))
    (hf : f'.1.1 = D.asFun lam (KmodO E) f.1) (u : S.torus) :
    (diamondInfty D S lam u f').1.1 =
      D.asFun lam (KmodO E) (diamond D S lam (KmodO E) c c u f).1 := by
  sorry

/-- The Pontryagin dual `S^{ord}_{λ,{χ_v}}(U(l^∞), K/𝒪)^∨`. -/
abbrev ordDual : Type := ordinaryPartInfty D S lam →ₗ[𝒪[E]] KmodO E

/-- The `Λ`-module structure of the Pontryagin dual, extending the action of `T(l)` by the
transposes of the diamond operators. -/
@[reducible] def ordDual.lambdaModule : Module (iwasawaAlgebra D) (ordDual D S lam) := sorry

theorem ordDual.lambdaModule_spec (φ : ordDual D S lam) (f : ordinaryPartInfty D S lam) :
    letI := ordDual.lambdaModule D S lam
    (∀ u : S.torusLevel 1,
      (((iwasawaAlgebra.of D S u : (iwasawaAlgebra D)ˣ) : iwasawaAlgebra D) • φ) f =
        φ (diamondInfty D S lam u.1 f)) ∧
    ∀ a : 𝒪[E], (algebraMap 𝒪[E] (iwasawaAlgebra D) a • φ) f = a • φ f := by
  sorry

/-- **PL.2/ordinary-forms-free-over-lambda (a)** (Thorne 2012, Proposition 8.2). If no
`t⁻¹ G(L⁺) t ∩ U` contains an element of order `l`, the dual of the ordinary forms of level
`U(l^∞)` is a free `Λ`-module of rank `dim_k S^{ord}_{λ,{χ_v}}(U(l^{1,1}), k)`. -/
theorem ordinary_forms_free_over_lambda_a (hst : D.Standing lam) (hlev : D.SphericalOutsideT)
    (hno : D.NoOrderL) :
    letI := ordDual.lambdaModule D S lam
    Module.Free (iwasawaAlgebra D) (ordDual D S lam) ∧
      Module.Finite (iwasawaAlgebra D) (ordDual D S lam) ∧
      Nat.card (ordinaryPart D S lam 𝓀[E] 1 1) =
        Nat.card 𝓀[E] ^ Module.finrank (iwasawaAlgebra D) (ordDual D S lam) := by
  sorry

/-- **PL.2/ordinary-forms-free-over-lambda (a)**, consequence: the big ordinary Hecke algebra is a
finite `Λ`-algebra, faithful over `Λ` when the rank is positive. -/
theorem ordinary_forms_free_over_lambda_a_hecke (hst : D.Standing D.zeroWeight)
    (hlev : D.SphericalOutsideT) (hno : D.NoOrderL) :
    Module.Finite (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) ∧
      (ordinaryPart D S D.zeroWeight 𝓀[E] 1 1 ≠ ⊥ →
        Function.Injective (algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D))) := by
  sorry

/-- **PL.2/ordinary-forms-free-over-lambda (b)** (Geraghty, Proposition 2.5.3 and
Corollary 2.5.4). There is `b₀ ≥ 1` with `U(l^{b₀,b₀})` sufficiently small; for such `b₀` the dual
is free over `Λ_{b₀}` of rank `dim_k S^{ord}_{λ,{χ_v}}(U(l^{b₀,b₀}), k)`. -/
theorem ordinary_forms_free_over_lambda_b (hst : D.Standing lam) (hlev : D.SphericalOutsideT) :
    (∃ b₀ : ℕ, 1 ≤ b₀ ∧ IsSufficientlySmall D.toCMData (iwahoriLevel D S b₀ b₀)) ∧
    ∀ b₀ : ℕ, 1 ≤ b₀ → IsSufficientlySmall D.toCMData (iwahoriLevel D S b₀ b₀) →
      letI := ordDual.lambdaModule D S lam
      Module.Free (iwasawaAlgebra.sub D S b₀) (ordDual D S lam) ∧
        Module.Finite (iwasawaAlgebra.sub D S b₀) (ordDual D S lam) ∧
        Nat.card (ordinaryPart D S lam 𝓀[E] b₀ b₀) =
          Nat.card 𝓀[E] ^ Module.finrank (iwasawaAlgebra.sub D S b₀) (ordDual D S lam) := by
  sorry

/-- **PL.2/ordinary-forms-free-over-lambda (b)**, consequence: the big ordinary Hecke algebra is a
finite `Λ_{b₀}`-algebra, faithful when the rank is positive. -/
theorem ordinary_forms_free_over_lambda_b_hecke (hst : D.Standing D.zeroWeight)
    (hlev : D.SphericalOutsideT) (b₀ : ℕ) (hb : 1 ≤ b₀)
    (hsm : IsSufficientlySmall D.toCMData (iwahoriLevel D S b₀ b₀)) :
    Module.Finite (iwasawaAlgebra.sub D S b₀) (bigOrdinaryHeckeAlgebra D) ∧
      (ordinaryPart D S D.zeroWeight 𝓀[E] b₀ b₀ ≠ ⊥ → ∀ x : iwasawaAlgebra.sub D S b₀,
        algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) x = 0 → x = 0) := by
  sorry

/-- **PL.2/ordinary-forms-free-over-lambda (c)** (Thorne 2015, Proposition 4.3; division algebra
group, weight `0`). If some `U_v`, `v ∤ l`, has no nontrivial element of finite order, the big
ordinary Hecke algebra is a finite faithful `Λ`-algebra and the dual of the ordinary forms is a
faithful module over it, finite free over `Λ`. -/
theorem ordinary_forms_free_over_lambda_c (hst : D.Standing D.zeroWeight)
    (hlev : D.SphericalOutsideT) (hSB : D.toCMData.SB.Nonempty)
    (hsm : ∃ v : Place D.toCMData.Lplus, ¬ v.Above D.l ∧
      ∀ g ∈ D.levelAtPlus v, IsOfFinOrder g → g = 1) :
    Module.Finite (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) ∧
      Function.Injective (algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D)) ∧
      Function.Injective (bigOrdinaryHeckeAlgebra.toEnd D S) ∧
      (letI := ordDual.lambdaModule D S D.zeroWeight
       Module.Free (iwasawaAlgebra D) (ordDual D S D.zeroWeight) ∧
        Module.Finite (iwasawaAlgebra D) (ordDual D S D.zeroWeight)) := by
  sorry

-- Part (d) (Newton–Thorne 2021, Proposition 6.5) has no Lean form here. Its objects, the
-- deformation datum `D` of Newton–Thorne 2021 §6 with its levels `U(D, c)`, its coefficient module
-- `M_D`, `H^{ord}(D)` and `T^{ord}(D)`, are described in the statements of
-- PL.2/big-ordinary-hecke-algebra and of this node and are not a definition node of the packet.

end FreeOverLambda

/-! #### Imported interfaces used by PL.2 (weight comparison) -/

/-- AutomorphicFormsOnReductiveGroups AF.4/coefficient-lattices (stand-in): the projection of `M_λ`
onto its lowest weight line `𝒪(w₀λ)`, equivariant for the upper triangular matrices (Geraghty,
Lemma 2.2.2), with values in `M_0 = 𝒪`. -/
def lowestWeightProj (C : CMData) (l : ℕ) (lam : (C.L →+* E) → Fin C.n → ℤ) :
    weightLattice C l lam →ₗ[𝒪[E]] weightLattice C l (0 : (C.L →+* E) → Fin C.n → ℤ) := sorry

/-! ### PL.2/hida-classicality: Hida classicality and independence of the characters χ_v
modulo λ -/

-- The arithmetic primes `℘_{λ,α}` (`arithmeticPrime`), the spaces
-- `S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, A)` (`ordFormsAlpha`) and their Hecke algebras
-- (`ordHeckeAlgebraAlpha`) of part (2) are defined above, before the test `bigOrd_specialization`.

/-- The same data with other characters `χ'_v`. -/
@[reducible] def HeckeDatum.withChars (D : HeckeDatum E)
    (χ' : (v : Place D.L) → Fin D.n → (𝓀[v.Fv])ˣ →* (𝒪[E])ˣ) : HeckeDatum E :=
  { D with χ := χ' }

/-- `χ_v ≡ χ'_v` modulo the maximal ideal for every `v ∈ R`. -/
def HeckeDatum.CharsCongruent (D : HeckeDatum E)
    (χ' : (v : Place D.L) → Fin D.n → (𝓀[v.Fv])ˣ →* (𝒪[E])ˣ) : Prop :=
  ∀ v ∈ D.R, ∀ (i : Fin D.n) (x : (𝓀[v.Fv])ˣ),
    IsLocalRing.residue 𝒪[E] ((D.χ v i x : (𝒪[E])ˣ) : 𝒪[E]) =
      IsLocalRing.residue 𝒪[E] ((χ' v i x : (𝒪[E])ˣ) : 𝒪[E])

/-- The residue field of a maximal ideal of the big ordinary Hecke algebra. -/
instance bigOrdinaryHeckeAlgebra.residueField (D : HeckeDatum E)
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal] :
    Field (bigOrdinaryHeckeAlgebra D ⧸ m) := Ideal.Quotient.field m

/-- The maximal ideals `m` for `{χ_v}` and `m'` for `{χ'_v}` correspond: their residue fields are
identified compatibly with the Hecke operators. -/
def IdealsCorrespond (D : HeckeDatum E)
    (χ' : (v : Place D.L) → Fin D.n → (𝓀[v.Fv])ˣ →* (𝒪[E])ˣ)
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) (m' : Ideal (bigOrdinaryHeckeAlgebra (D.withChars χ'))) :
    Prop :=
  ∃ e : (bigOrdinaryHeckeAlgebra D ⧸ m) ≃+* (bigOrdinaryHeckeAlgebra (D.withChars χ') ⧸ m'),
    ∀ (w : Place D.L) (j : ℕ), D.IsHeckePlace w → 1 ≤ j → j ≤ D.n →
      e (Ideal.Quotient.mk m (bigOrdinaryHeckeAlgebra.T D w j)) =
        Ideal.Quotient.mk m' (bigOrdinaryHeckeAlgebra.T (D.withChars χ') w j)

section Hida

variable (D : HeckeDatum E) (S : D.LChoice) (lam : (D.L →+* E) → Fin D.n → ℤ)

/-- The `℘`-torsion of `S^{ord}_{0,{χ_v}}(U(l^∞), K/𝒪)` for the `Λ`-structure of Thorne 2012,
Definition 8.3; its Pontryagin dual is `𝒮/℘𝒮`. -/
def primeTorsion (I : Ideal (iwasawaAlgebra D)) :
    Submodule 𝒪[E] (ordinaryPartInfty D S D.zeroWeight) where
  carrier := {f | ∀ x ∈ I, bigOrdinaryHeckeAlgebra.toEnd D S
    (algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D) x) f = 0}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- **PL.2/hida-classicality (1)**, weight independence (Geraghty, Proposition 2.6.1). For `λ`
dominant, `c ≥ r ≥ 1` and coefficients killed by `ϖ^r`, composition with the projection of `M_λ`
onto its lowest weight line is an isomorphism `λ_*` of ordinary parts from weight `λ` to weight
`0`; it commutes with the `T_w^j`, carries `U^j_{λ,ϖ}` to `U^j_{0,ϖ}`, and
`λ_*(⟨u⟩f) = (w₀λ)(u)⟨u⟩λ_*(f)`. -/
theorem hida_classicality_1 (hst : D.Standing lam) (r c : ℕ) (hr : 1 ≤ r) (hrc : r ≤ c)
    (A : Type) [AddCommGroup A] [Module 𝒪[E] A] [Module.Finite 𝒪[E] A]
    (hA : ∀ x ∈ IsLocalRing.maximalIdeal 𝒪[E] ^ r, ∀ a : A, x • a = 0) :
    ∃ e : ordinaryPart D S lam A c c ≃ₗ[𝒪[E]] ordinaryPart D S D.zeroWeight A c c,
      (∀ (f : ordinaryPart D S lam A c c) (g : D.G),
        (e f).1.1 g = (lowestWeightProj D.toCMData D.l lam).rTensor A (f.1.1 g)) ∧
      (∀ (w : Place D.L) (j : ℕ) (f f₂ : ordinaryPart D S lam A c c), D.IsHeckePlace w →
        f₂.1 = heckeOperator (D.atIwahori S c c) lam A w j f.1 →
        (e f₂).1 = heckeOperator (D.atIwahori S c c) D.zeroWeight A w j (e f).1) ∧
      (∀ (v : Place D.L) (j : ℕ) (ϖ : (v.Fv)ˣ) (f f₂ : ordinaryPart D S lam A c c), v ∈ S.Sl →
        f₂.1 = uOperator D S lam A c c v j ϖ f.1 →
        (e f₂).1 = uOperator D S D.zeroWeight A c c v j ϖ (e f).1) ∧
      ∀ (u : S.torus) (f f₂ : ordinaryPart D S lam A c c),
        f₂.1 = diamond D S lam A c c u f.1 →
        (e f₂).1 = ((w0char S lam u : (𝒪[E])ˣ) : 𝒪[E]) •
          diamond D S D.zeroWeight A c c u (e f).1 := by
  sorry

/-- **PL.2/hida-classicality (1)**, in the limit:
`λ_* : S^{ord}_{λ,{χ_v}}(U(l^∞), K/𝒪) ≅ S^{ord}_{0,{χ_v}}(U(l^∞), K/𝒪)`. -/
theorem hida_classicality_1_limit (hst : D.Standing lam) :
    ∃ e : ordinaryPartInfty D S lam ≃ₗ[𝒪[E]] ordinaryPartInfty D S D.zeroWeight,
      ∀ (f : ordinaryPartInfty D S lam) (g : D.G),
        (e f).1.1 g = (lowestWeightProj D.toCMData D.l lam).rTensor (KmodO E) (f.1.1 g) := by
  sorry

variable (hst : D.Standing lam) (hlev : D.SphericalOutsideT) (r : ℕ) (hr : 1 ≤ r)
  (α : S.torusLevel 1 →* (𝒪[E])ˣ) (hα : ∀ u : S.torusLevel 1, u.1 ∈ S.torusLevel r → α u = 1)

include hst hlev hr hα

/-- **PL.2/hida-classicality (3)**, classicality (Geraghty, Lemma 2.6.4). At `℘ = ℘_{λ,α}`, the
fibre `𝒮_℘/℘𝒮_℘` of the dual of the weight `0` ordinary forms is the dual of
`S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, K')`, and `φ_λ` induces a surjection from `T^{ord} ⊗_Λ Λ_℘/℘`
onto the classical Hecke algebra with nilpotent kernel (`E` contains `K' = Frac(Λ/℘)`). -/
theorem hida_classicality_3 :
    (∃ φ : bigOrdinaryHeckeAlgebra D →ₐ[𝒪[E]] ordHeckeAlgebraAlpha D S lam E r α,
      IsClassicalSpecialization D S lam r α φ) ∧
    Nonempty (TensorProduct 𝒪[E] E
        (primeTorsion D S (arithmeticPrime D S lam α) →ₗ[𝒪[E]] KmodO E) ≃ₗ[E]
      (ordFormsAlpha D S lam E r α →ₗ[𝒪[E]] E)) := by
  sorry

/-- **PL.2/hida-classicality (3)**, consequence. A homomorphism from the big ordinary Hecke
algebra to `𝒪` whose restriction to `Λ` has kernel `℘_{λ,α}` is the system of Hecke eigenvalues of
a constituent of `S_{λ,{χ_v}}(Q̄_l)` with a nonzero vector in `S^{ord}_{λ,{χ_v}}(U(l^{r,r}), E)` on
which `T(l)` acts through `α`. -/
theorem hida_classicality_3_points (f : bigOrdinaryHeckeAlgebra D →ₐ[𝒪[E]] 𝒪[E])
    (hf : RingHom.ker ((f : bigOrdinaryHeckeAlgebra D →+* 𝒪[E]).comp
      (algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D))) = arithmeticPrime D S lam α) :
    ∃ (π : Constituent (D.atIwahori S r r) lam) (g : ordFormsAlpha D S lam E r α), g ≠ 0 ∧
      ∀ (w : Place D.L) (j : ℕ), D.IsHeckePlace w → 1 ≤ j → j ≤ D.n →
        π.eigensystem (heckeAlgebra.T (D.atIwahori S r r) lam w j) =
            algebraMap 𝒪[E] E (f (bigOrdinaryHeckeAlgebra.T D w j)) ∧
          heckeOperator (D.atIwahori S r r) lam E w j g.1 =
            f (bigOrdinaryHeckeAlgebra.T D w j) • g.1 := by
  sorry

/-- **PL.2/hida-classicality (3′)**, integral form. `𝒮/℘𝒮`, the Pontryagin dual of the
`℘`-torsion, is the dual of `S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, K/𝒪)`; if no `t⁻¹ G(L⁺) t ∩ U`
contains an element of order `l` it is `Hom_𝒪(S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, 𝒪), 𝒪)`. -/
theorem hida_classicality_3' :
    Nonempty ((primeTorsion D S (arithmeticPrime D S lam α) →ₗ[𝒪[E]] KmodO E) ≃ₗ[𝒪[E]]
        (ordFormsAlpha D S lam (KmodO E) r α →ₗ[𝒪[E]] KmodO E)) ∧
      (D.NoOrderL →
        Nonempty ((primeTorsion D S (arithmeticPrime D S lam α) →ₗ[𝒪[E]] KmodO E) ≃ₗ[𝒪[E]]
          (ordFormsAlpha D S lam 𝒪[E] r α →ₗ[𝒪[E]] 𝒪[E]))) := by
  sorry

/-- **PL.2/unitary-base-change-and-descent (3)(b)** (Geraghty, Lemma 2.6.4). A homomorphism `f`
from the big ordinary Hecke algebra whose restriction to `Λ` has kernel an arithmetic prime
`℘_{λ,α}` is the eigensystem of a constituent with an ordinary vector of level `U(l^{r,r})`; if
the Galois representation of the constituent is irreducible, it is `r_{l,ι}(π)` for a RACSDC
`π`. -/
theorem unitary_base_change_and_descent_3b (hSB : D.toCMData.SB = ∅) (ι : E →+* ℂ)
    (f : bigOrdinaryHeckeAlgebra D →ₐ[𝒪[E]] 𝒪[E])
    (hf : RingHom.ker ((f : bigOrdinaryHeckeAlgebra D →+* 𝒪[E]).comp
      (algebraMap (iwasawaAlgebra D) (bigOrdinaryHeckeAlgebra D))) = arithmeticPrime D S lam α) :
    ∃ σ : Constituent (D.atIwahori S r r) lam,
      (∀ (w : Place D.L) (j : ℕ), D.IsHeckePlace w → 1 ≤ j → j ≤ D.n →
        σ.eigensystem (heckeAlgebra.T (D.atIwahori S r r) lam w j) =
          algebraMap 𝒪[E] E (f (bigOrdinaryHeckeAlgebra.T D w j))) ∧
      (IsAbsIrred σ.galoisRep → ∃ π : RACP D.L D.n, IsRACSDC π ι ∧
        Conj (π.galoisRep ι : Gal D.L → GL (Fin D.n) E) σ.galoisRep) := by
  sorry

end Hida

/-- **PL.2/hida-classicality (4)**, independence of the `χ_v` modulo `λ` (Geraghty §2.2; Thorne
2012 §8). If `χ_v ≡ χ'_v` for all `v ∈ R`, then `S_{λ,{χ_v}}(U, A) = S_{λ,{χ'_v}}(U, A)` for every
`k`-vector space `A`, compatibly with the Hecke operators. -/
theorem hida_classicality_4 (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (hst : D.Standing lam) (χ' : (v : Place D.L) → Fin D.n → (𝓀[v.Fv])ˣ →* (𝒪[E])ˣ)
    (hχ : D.CharsCongruent χ') (A : Type) [AddCommGroup A] [Module 𝒪[E] A]
    (hA : ∀ x ∈ IsLocalRing.maximalIdeal 𝒪[E], ∀ a : A, x • a = 0) :
    (∀ f : D.FormFun lam A,
      f ∈ AlgebraicModularForm (D.withChars χ') lam A ↔ f ∈ AlgebraicModularForm D lam A) ∧
    ∀ (w : Place D.L) (j : ℕ) (f : AlgebraicModularForm D lam A)
      (f' : AlgebraicModularForm (D.withChars χ') lam A),
      D.asFun lam A f'.1 = D.asFun lam A f.1 →
      D.asFun lam A (heckeOperator (D.withChars χ') lam A w j f').1 =
        D.asFun lam A (heckeOperator D lam A w j f).1 := by
  sorry

/-- **PL.2/hida-classicality (4)**, maximal ideals. For congruent characters, a maximal ideal of
the big ordinary Hecke algebra for `{χ_v}` determines one for `{χ'_v}` with the same Hecke
eigenvalues in the residue field, hence the same residual representation. -/
theorem hida_classicality_4_ideals (D : HeckeDatum E) (hst : D.Standing D.zeroWeight)
    (hlev : D.SphericalOutsideT) (χ' : (v : Place D.L) → Fin D.n → (𝓀[v.Fv])ˣ →* (𝒪[E])ˣ)
    (hχ : D.CharsCongruent χ') (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal] :
    ∃ m' : Ideal (bigOrdinaryHeckeAlgebra (D.withChars χ')),
      m'.IsMaximal ∧ IdealsCorrespond D χ' m m' := by
  sorry

/-! #### Imported interfaces used by PL.2 (ordinary lifting rings) -/

/-- LocalGaloisDeformationRings L8/ordinary-coefficient-ring (stand-in): the local Iwasawa algebra
`Λ_ṽ = 𝒪⟦(I^{ab}_K(l))^n⟧`. -/
def localIwasawa (K : Type) [Field K] (E : Type) [Field E] [ValuativeRel E] (n : ℕ) : Type :=
  sorry

instance (K : Type) [Field K] (n : ℕ) : CommRing (localIwasawa K E n) := sorry

instance (K : Type) [Field K] (n : ℕ) : Algebra 𝒪[E] (localIwasawa K E n) := sorry

/-- L8 (stand-in): the `j`-th universal character `I_K → Λ_ṽ^×`. -/
def localIwasawa.univChar (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (n : ℕ) (j : Fin n) :
    inertia K →* (localIwasawa K E n)ˣ := sorry

/-- L8 (stand-in): the map `Λ_ṽ → Λ` induced by the inverse Artin map
`(I^{ab}_{L_ṽ}(l))^n ≅ (1 + ϖ_ṽ 𝒪_{L_ṽ})^n ⊂ T(l)`, for `v ∈ S_l`. -/
def localIwasawaToGlobal (D : HeckeDatum E) (S : D.LChoice) (v : Place D.L) (hv : v ∈ S.Sl) :
    localIwasawa v.Fv E D.n →ₐ[𝒪[E]] iwasawaAlgebra D := sorry

/-- LocalGaloisDeformationRings R08.1 (stand-in): the universal lifting
`G_K → GL_n(R^□)` of a residual representation. -/
def LiftingRing.univ {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {n : ℕ} (ρbar : Gal K →* GL (Fin n) 𝓀[E]) :
    Gal K →* GL (Fin n) (LiftingRing K E ρbar) := sorry

section OrdinaryRings

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] {n : ℕ}

/-- LocalGaloisDeformationRings L7/ordinary-flag-scheme (stand-in): the completed tensor product
`R^□ ⊗̂_𝒪 Λ_ṽ`. -/
def ordAmbientRing (ρbar : Gal K →* GL (Fin n) 𝓀[E]) : Type := sorry

instance (ρbar : Gal K →* GL (Fin n) 𝓀[E]) : CommRing (ordAmbientRing ρbar) := sorry

instance (ρbar : Gal K →* GL (Fin n) 𝓀[E]) :
    Algebra (LiftingRing K E ρbar) (ordAmbientRing ρbar) := sorry

instance (ρbar : Gal K →* GL (Fin n) 𝓀[E]) :
    Algebra (localIwasawa K E n) (ordAmbientRing ρbar) := sorry

/-- L7/ordinary-flag-scheme (stand-in): the kernel of `R^□ ⊗̂_𝒪 Λ_ṽ → R^△_{Λ_ṽ}`, the
scheme-theoretic image of the flag scheme with `l` inverted (Geraghty §3.1). -/
def ordinaryIdeal (ρbar : Gal K →* GL (Fin n) 𝓀[E]) : Ideal (ordAmbientRing ρbar) := sorry

/-- L7/trivial-residual-flag-ring (stand-in): the kernel of `R^□ ⊗̂_𝒪 Λ_ṽ → R^{△,ar}_{Λ_ṽ}`, for the
trivial residual representation (Geraghty, Definition 3.4.5). -/
def ordinaryArIdeal (ρbar : Gal K →* GL (Fin n) 𝓀[E]) : Ideal (ordAmbientRing ρbar) := sorry

end OrdinaryRings

/-! ### PL.2/ordinary-hecke-galois-representation: The Λ-adic Galois representation on the big
ordinary Hecke algebra -/

/-- The Hecke polynomial `Σ_{j=0}^n (-1)^j (Nw)^{j(j-1)/2} T_w^j X^{n-j}` over the big ordinary
Hecke algebra. -/
def ordHeckePoly (D : HeckeDatum E) (w : Place D.L) : Polynomial (bigOrdinaryHeckeAlgebra D) :=
  ∑ j ∈ Finset.range (D.n + 1),
    Polynomial.C ((-1) ^ j * (w.norm : bigOrdinaryHeckeAlgebra D) ^ (j * (j - 1) / 2) *
      (if j = 0 then 1 else bigOrdinaryHeckeAlgebra.T D w j)) * Polynomial.X ^ (D.n - j)

section OrdGalois

variable (D : HeckeDatum E) (S : D.LChoice) (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]

/-- **`r̄_m`** for a maximal ideal of the big ordinary Hecke algebra (Thorne 2012,
Proposition 8.4). -/
def ordResidualRep : Gal D.L →* GL (Fin D.n) (bigOrdinaryHeckeAlgebra D ⧸ m) := sorry

/-- `m` is non-Eisenstein: `r̄_m` is absolutely irreducible. -/
def IsOrdNonEisenstein : Prop :=
  IsAbsIrred (ordResidualRep D m : Gal D.L → GL (Fin D.n) (bigOrdinaryHeckeAlgebra D ⧸ m))

/-- The `m`-adic topology of `T^{ord}_m`. -/
instance bigOrdinaryHeckeAlgebra.topLoc : TopologicalSpace (Localization.AtPrime m) :=
  TopologicalSpace.generateFrom {s | ∃ (x : Localization.AtPrime m) (k : ℕ),
    s = {y | y - x ∈ IsLocalRing.maximalIdeal (Localization.AtPrime m) ^ k}}

/-- The reduction `T^{ord}_m → T^{ord}/m`. -/
def bigOrdinaryHeckeAlgebra.locResidue :
    Localization.AtPrime m →+* (bigOrdinaryHeckeAlgebra D ⧸ m) :=
  IsLocalization.lift (M := m.primeCompl) (g := Ideal.Quotient.mk m) (by sorry)

/-- The extension `r̄_m : G_{L⁺} → 𝒢_n(T^{ord}/m)`. -/
def ordResidualRepCHT : Gal D.toCMData.Lplus →* CHT D.n (bigOrdinaryHeckeAlgebra D ⧸ m) := sorry

/-- The sign `µ_m ∈ ℤ/2`. -/
def ordMu (D : HeckeDatum E) (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal] : ZMod 2 :=
  sorry

/-- **The `Λ`-adic `r_m`** `: G_{L⁺} → 𝒢_n(T^{ord}_m)` (Thorne 2012, Proposition 8.5). -/
def ordGaloisRep : Gal D.toCMData.Lplus →ₜ* CHT D.n (Localization.AtPrime m) := sorry

/-- The `GL_n`-component of `r_m|G_L`. -/
def ordGaloisRepGL : Gal D.L →ₜ* GL (Fin D.n) (Localization.AtPrime m) := sorry

/-- `r̄_m|G_{L_ṽ}` with coefficients in `k`, through an identification `κ : k ≅ T^{ord}/m`. -/
def ordLocalResidual (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m)) (v : Place D.L) :
    Gal v.Fv →* GL (Fin D.n) 𝓀[E] :=
  (Matrix.GeneralLinearGroup.map (κ.symm : (bigOrdinaryHeckeAlgebra D ⧸ m) →+* 𝓀[E])).comp
    ((ordResidualRep D m).comp v.dec.toMonoidHom)

/-- `φ : R^□_ṽ ⊗̂_𝒪 Λ_ṽ → T^{ord}_m` is the homomorphism given by `r_m|G_{L_ṽ}` and the
`Λ`-structure of Thorne 2012, Definition 8.3. -/
def IsOrdLocalMap (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m)) (v : Place D.L)
    (hv : v ∈ S.Sl)
    (φ : ordAmbientRing (ordLocalResidual D m κ v) →+* Localization.AtPrime m) : Prop :=
  (∀ x : localIwasawa v.Fv E D.n, φ (algebraMap _ _ x) =
    algebraMap (iwasawaAlgebra D) (Localization.AtPrime m) (localIwasawaToGlobal D S v hv x)) ∧
  ∀ σ : Gal v.Fv,
    Matrix.GeneralLinearGroup.map
        (φ.comp (algebraMap (LiftingRing v.Fv E (ordLocalResidual D m κ v)) _))
        (LiftingRing.univ (ordLocalResidual D m κ v) σ) =
      ordGaloisRepGL D m (v.dec σ)

variable (hst : D.Standing D.zeroWeight) (hlev : D.SphericalOutsideT)

include hst hlev

/-- **PL.2/ordinary-hecke-galois-representation (1)** (Thorne 2012, Proposition 8.4; Geraghty,
Proposition 2.7.3). `r̄_m` is continuous, semisimple, satisfies `r̄_m^c ≅ r̄_m^∨(1 - n)`, is
unramified at the split places outside `T` with the Hecke polynomial as Frobenius polynomial, and
is unramified above the inert places of hyperspecial level; it is the unique such
representation. -/
theorem ordinary_hecke_galois_representation_1 :
    IsContinuousResidual (ordResidualRep D m) ∧ IsSemisimpleRep (ordResidualRep D m) ∧
    IsConjugateSelfDual D.toCMData (ordResidualRep D m)
      (fun σ => cycloChar (bigOrdinaryHeckeAlgebra D ⧸ m) D.L σ ^ (1 - (D.n : ℤ))) ∧
    (∀ w : Place D.L, D.IsHeckePlace w →
      IsUnramified ((ordResidualRep D m).comp w.dec.toMonoidHom) ∧
      (ordResidualRep D m (w.dec (geomFrob w.Fv)) :
          Matrix (Fin D.n) (Fin D.n) (bigOrdinaryHeckeAlgebra D ⧸ m)).charpoly =
        (ordHeckePoly D w).map (Ideal.Quotient.mk m)) ∧
    (∀ (v : Place D.toCMData.Lplus) (w : Place D.L), D.toCMData.IsInert v →
      (hyperspecial D.toCMData v).Holds (D.levelAtPlus v) → D.toCMData.LiesAbove w v →
      IsUnramified ((ordResidualRep D m).comp w.dec.toMonoidHom)) ∧
    ∀ r : Gal D.L →* GL (Fin D.n) (bigOrdinaryHeckeAlgebra D ⧸ m),
      IsContinuousResidual r → IsSemisimpleRep r →
      (∀ w : Place D.L, D.IsHeckePlace w → IsUnramified (r.comp w.dec.toMonoidHom) ∧
        (r (w.dec (geomFrob w.Fv)) :
            Matrix (Fin D.n) (Fin D.n) (bigOrdinaryHeckeAlgebra D ⧸ m)).charpoly =
          (ordHeckePoly D w).map (Ideal.Quotient.mk m)) →
      Conj (r : Gal D.L → GL (Fin D.n) (bigOrdinaryHeckeAlgebra D ⧸ m))
        (ordResidualRep D m) := by
  sorry

variable (hne : IsOrdNonEisenstein D m)

include hne

/-- **PL.2/ordinary-hecke-galois-representation (2)** (Thorne 2012, Proposition 8.5; Geraghty,
Proposition 2.7.4). For non-Eisenstein `m`, `r̄_m` extends to `G_{L⁺} → 𝒢_n(T^{ord}/m)` with
multiplier `ε^{1-n} δ_{L/L⁺}^{µ_m}`, and `r_m` is a continuous lift of it which (i) is unramified
at the split places outside `T` with the Hecke polynomial as Frobenius polynomial, (ii) is
unramified at the inert places of hyperspecial level, (iii) has inertial characteristic
polynomial `∏_j (X - χ_{v,j}(u)⁻¹)` at `v ∈ R` of Iwahori level, and (iv) has multiplier
`ε^{1-n} δ_{L/L⁺}^{µ_m}`. -/
theorem ordinary_hecke_galois_representation_2 :
    (IsContinuousResidual (ordResidualRepCHT D m) ∧
      IsGLRestriction D.toCMData (ordResidualRepCHT D m) (ordResidualRep D m) ∧
      ∀ τ : Gal D.toCMData.Lplus,
        CHT.nu D.n (bigOrdinaryHeckeAlgebra D ⧸ m) (ordResidualRepCHT D m τ) =
          cycloChar (bigOrdinaryHeckeAlgebra D ⧸ m) D.toCMData.Lplus τ ^ (1 - (D.n : ℤ)) *
            D.toCMData.deltaChar (bigOrdinaryHeckeAlgebra D ⧸ m) τ ^ (ordMu D m).val) ∧
    (CHT.map D.n (bigOrdinaryHeckeAlgebra.locResidue D m)).comp (ordGaloisRep D m).toMonoidHom =
      ordResidualRepCHT D m ∧
    IsGLRestriction D.toCMData (ordGaloisRep D m) (ordGaloisRepGL D m) ∧
    (∀ w : Place D.L, D.IsHeckePlace w →
      IsUnramified (resPlace (ordGaloisRepGL D m) w).toMonoidHom ∧
      (ordGaloisRepGL D m (w.dec (geomFrob w.Fv)) :
          Matrix (Fin D.n) (Fin D.n) (Localization.AtPrime m)).charpoly =
        (ordHeckePoly D w).map
          (algebraMap (bigOrdinaryHeckeAlgebra D) (Localization.AtPrime m))) ∧
    (∀ v : Place D.toCMData.Lplus, D.toCMData.IsInert v →
      (hyperspecial D.toCMData v).Holds (D.levelAtPlus v) →
      IsUnramified (resPlace (ordGaloisRep D m) v).toMonoidHom) ∧
    (∀ (v : Place D.L) (hv : v ∈ D.R),
      D.levelAt v = iwahoriAt D.toCMData v (hst.R_outside v hv) 0 1 →
      ∀ (u : (𝒪[v.Fv])ˣ) (σ : Gal v.Fv), σ ∈ inertia v.Fv →
        Abelianization.of σ = artin v.Fv (unitOfInt u) →
        (ordGaloisRepGL D m (v.dec σ) :
            Matrix (Fin D.n) (Fin D.n) (Localization.AtPrime m)).charpoly =
          ∏ j : Fin D.n, (Polynomial.X - Polynomial.C (algebraMap 𝒪[E] (Localization.AtPrime m)
            (((D.χ v j (Units.map (IsLocalRing.residue 𝒪[v.Fv]).toMonoidHom u))⁻¹ : (𝒪[E])ˣ) :
              𝒪[E])))) ∧
    ∀ τ : Gal D.toCMData.Lplus,
      CHT.nu D.n (Localization.AtPrime m) (ordGaloisRep D m τ) =
        cycloChar (Localization.AtPrime m) D.toCMData.Lplus τ ^ (1 - (D.n : ℤ)) *
          D.toCMData.deltaChar (Localization.AtPrime m) τ ^ (ordMu D m).val := by
  sorry

/-- **PL.2/ordinary-hecke-galois-representation (2)**, uniqueness: a continuous lift of `r̄_m`
with property (i) is conjugate to `r_m` by an element of `𝒢_n⁰(T^{ord}_m)` reducing to the
identity. -/
theorem ordinary_hecke_galois_representation_2_unique
    (r' : Gal D.toCMData.Lplus →ₜ* CHT D.n (Localization.AtPrime m))
    (ρ' : Gal D.L →ₜ* GL (Fin D.n) (Localization.AtPrime m))
    (hlift : (CHT.map D.n (bigOrdinaryHeckeAlgebra.locResidue D m)).comp r'.toMonoidHom =
      ordResidualRepCHT D m)
    (hρ : IsGLRestriction D.toCMData r' ρ')
    (hfrob : ∀ w : Place D.L, D.IsHeckePlace w →
      IsUnramified (resPlace ρ' w).toMonoidHom ∧
      (ρ' (w.dec (geomFrob w.Fv)) : Matrix (Fin D.n) (Fin D.n) (Localization.AtPrime m)).charpoly =
        (ordHeckePoly D w).map
          (algebraMap (bigOrdinaryHeckeAlgebra D) (Localization.AtPrime m))) :
    ∃ g ∈ CHT.conn D.n (Localization.AtPrime m),
      CHT.map D.n (bigOrdinaryHeckeAlgebra.locResidue D m) g = 1 ∧
      ∀ τ, r' τ = g * ordGaloisRep D m τ * g⁻¹ := by
  sorry

variable (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m))
  (hκ : ∀ a : 𝒪[E], κ (IsLocalRing.residue 𝒪[E] a) =
    Ideal.Quotient.mk m (algebraMap 𝒪[E] (bigOrdinaryHeckeAlgebra D) a))

include hκ

/-- **PL.2/ordinary-hecke-galois-representation (3)**, ordinarity at `l` (Geraghty,
Corollary 3.1.4 and Lemma 3.1.3). For `v ∈ S_l`, the homomorphism `R^□_ṽ ⊗̂_𝒪 Λ_ṽ → T^{ord}_m`
given by `r_m|G_{L_ṽ}` and the `Λ`-structure factors through `R^△_{Λ_ṽ}`; and for every
`𝒪`-algebra homomorphism `ζ : T^{ord}_m → 𝒪`, `ζ ∘ r_m|G_{L_ṽ}` is `GL_n(𝒪)`-conjugate to an upper
triangular representation whose `j`-th diagonal character is, on inertia, the push-forward by `ζ`
of the `j`-th universal character. -/
theorem ordinary_hecke_galois_representation_3 (v : Place D.L) (hv : v ∈ S.Sl) :
    (∃ φ, IsOrdLocalMap D S m κ v hv φ ∧
      ∀ x ∈ ordinaryIdeal (ordLocalResidual D m κ v), φ x = 0) ∧
    ∀ ζ : Localization.AtPrime m →ₐ[𝒪[E]] 𝒪[E],
      ∃ (g : GL (Fin D.n) 𝒪[E]) (ρ' : Gal v.Fv → GL (Fin D.n) E) (ψ : Fin D.n → Gal v.Fv → Eˣ),
        (∀ σ : Gal v.Fv,
          Matrix.GeneralLinearGroup.map
              ((algebraMap 𝒪[E] E).comp (ζ : Localization.AtPrime m →+* 𝒪[E]))
              (ordGaloisRepGL D m (v.dec σ)) =
            Matrix.GeneralLinearGroup.map (algebraMap 𝒪[E] E) g * ρ' σ *
              (Matrix.GeneralLinearGroup.map (algebraMap 𝒪[E] E) g)⁻¹) ∧
        IsUpperTriangularWith ρ' ψ ∧
        ∀ (j : Fin D.n) (σ : inertia v.Fv),
          ((ψ j σ : Eˣ) : E) = algebraMap 𝒪[E] E (ζ (algebraMap (iwasawaAlgebra D)
            (Localization.AtPrime m) (localIwasawaToGlobal D S v hv
              ((localIwasawa.univChar v.Fv E D.n j σ : (localIwasawa v.Fv E D.n)ˣ) :
                localIwasawa v.Fv E D.n)))) := by
  sorry

/-- **PL.2/ordinary-hecke-galois-representation (4)** (Geraghty, Corollary 3.4.8 and Lemma 4.1.7).
If `r̄_m|G_{L_ṽ}` is trivial for all `v ∈ S_l`, the homomorphism of (3) factors through
`R^{△,ar}_{Λ_ṽ}`. That `r_m` is then of type `𝒮_{χ_v}` is part of PL.3/ordinary-r-equals-t. -/
theorem ordinary_hecke_galois_representation_4
    (htriv : ∀ v ∈ S.Sl, ∀ σ : Gal v.Fv, ordResidualRep D m (v.dec σ) = 1)
    (v : Place D.L) (hv : v ∈ S.Sl) :
    ∃ φ, IsOrdLocalMap D S m κ v hv φ ∧
      ∀ x ∈ ordinaryArIdeal (ordLocalResidual D m κ v), φ x = 0 := by
  sorry

end OrdGalois

end TauCeti.DefiniteUnitary

namespace TauCeti.Automorphy

open TauCeti.DefiniteUnitary

/-! ## PL.3: Taylor–Wiles data and the R = T theorems -/

/-! #### Imported interfaces used by PL.3 -/

/-- GlobalGaloisDeformations G7/polarized-tangent-obstruction and R04.3/local-deformation-problem
(stand-in): for the local deformation problem cut out by the ideal `I` of `R^□`, the annihilator
`L^⊥ ⊂ H¹(G_K, ad r̄(1))`, under local Tate duality, of its tangent space `L ⊂ H¹(G_K, ad r̄)`, as
a set of continuous cocycles `G_K → ad r̄(1) = M_n(k)` (a union of cohomology classes). -/
def tangentPerp {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] {n : ℕ} {ρbar : Gal K →* GL (Fin n) 𝓀[E]}
    (I : Ideal (LiftingRing K E ρbar)) : Set (Gal K → Matrix (Fin n) (Fin n) 𝓀[E]) := sorry

/-! ### PL.3/thorne-taylor-wiles-datum: Taylor–Wiles data with a residual eigenspace -/

section TWLocal

variable {F : Type} [Field F] {k : Type} [Field k] {n : ℕ}

/-- `e` is the projector `e_{Φ,α}` onto the generalised `α`-eigenspace of `Φ` along the sum of the
other generalised eigenspaces. -/
def IsEigenProjector (Φ e : Matrix (Fin n) (Fin n) k) (α : k) : Prop :=
  e * e = e ∧ e * Φ = Φ * e ∧
    LinearMap.range (Matrix.toLin' e) = Module.End.maxGenEigenspace (Matrix.toLin' Φ) α

/-- The local conditions of a Taylor–Wiles place `ṽ` for a residual representation `ρ̄` of `G_F`
(Thorne 2012, Definition 4.1): `Nv ≡ 1 mod l`, `ρ̄` is unramified at `ṽ`, `α` is an eigenvalue of
`ρ̄(Frob_ṽ)`, and `Frob_ṽ` acts on its generalised `α`-eigenspace `ψ̄_ṽ` as the scalar `α`. -/
def IsTWPlace (ρbar : Gal F →* GL (Fin n) k) (l : ℕ) (v : Place F) (α : k) : Prop :=
  (l : ℤ) ∣ (v.norm : ℤ) - 1 ∧ IsUnramified (ρbar.comp v.dec.toMonoidHom) ∧
    (ρbar (v.dec (geomFrob v.Fv)) : Matrix (Fin n) (Fin n) k).charpoly.IsRoot α ∧
    Module.End.maxGenEigenspace
        (Matrix.toLin' (ρbar (v.dec (geomFrob v.Fv)) : Matrix (Fin n) (Fin n) k)) α =
      Module.End.eigenspace
        (Matrix.toLin' (ρbar (v.dec (geomFrob v.Fv)) : Matrix (Fin n) (Fin n) k)) α

/-- The elements of order prime to `l` in a commutative group. -/
def primeToL (G : Type*) [CommGroup G] (l : ℕ) : Subgroup G where
  carrier := {x | ∃ m : ℕ, m.Coprime l ∧ x ^ m = 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- The maximal quotient of `l`-power order of a finite commutative group; `k(ṽ)^×(l)` for
`G = k(ṽ)^×`. -/
abbrev lQuot (G : Type*) [CommGroup G] (l : ℕ) : Type _ := G ⧸ primeToL G l

end TWLocal

section TWDatum

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- `G_F → G_{F⁺}` for a CM field `F`. -/
def galInclCM (F : Type) [Field F] [NumberField F] : Gal F →ₜ* Gal (maximalRealSubfield F) :=
  Field.absoluteGaloisGroup.map (algebraMap (maximalRealSubfield F) F)

/-- The places `w`, `w'` of `F` induce the same place of `F⁺`. -/
def SameBelowCM (w w' : Place F) : Prop :=
  ∃ e : w.Fv ≃+* w'.Fv, Continuous e ∧
    ∀ x : maximalRealSubfield F, e (w.emb (x : F)) = w'.emb (x : F)

/-- `ρ̄ = r̄|G_F : G_F → GL_n(k)`, the `GL_n`-component of the residual representation of a
polarized deformation problem. -/
def DefProblem.residGL (S : DefProblem F E n Λ) : Gal F →* GL (Fin n) 𝓀[E] where
  toFun σ := open Classical in
    if h : S.resid (galInclCM F σ) ∈ CHT.conn n 𝓀[E] then CHT.gl n 𝓀[E] ⟨_, h⟩ else 1
  map_one' := by sorry
  map_mul' := by sorry

/-- **A Taylor–Wiles datum** `(Q, Q̃, {ψ̄_ṽ})` for a polarized global deformation problem `𝒮`
(Thorne 2012, Definition 4.1): a finite set `Q̃` of places of `F`, split over `F⁺`, one above each
place of `Q`, none above a place of `𝒮`, with `Nv ≡ 1 mod l`, `r̄` unramified at `ṽ`, and an
eigenvalue `α_v` of `r̄(Frob_ṽ)` whose generalised eigenspace `ψ̄_ṽ` is acted on by `Frob_ṽ`
through the scalar `α_v`; `s̄_ṽ` is the sum of the other generalised eigenspaces. -/
structure TaylorWilesDatum (S : DefProblem F E n Λ) (l : ℕ) where
  /-- The set `Q̃` of chosen places of `F`. -/
  Q : Set (Place F)
  finite : Q.Finite
  split : ∀ v ∈ Q, DenseRange (v.emb.comp (algebraMap (maximalRealSubfield F) F))
  distinct : ∀ v ∈ Q, ∀ v' ∈ Q, SameBelowCM v v' → v = v'
  outside : ∀ v ∈ Q, ∀ u ∈ S.places, ¬ SameBelowCM u v
  /-- The eigenvalues `α_v`. -/
  α : Place F → 𝓀[E]
  tw : ∀ v ∈ Q, IsTWPlace S.residGL l v (α v)

namespace TaylorWilesDatum

variable {S : DefProblem F E n Λ} {l : ℕ}

/-- **The datum has level `N`**: `l^N` divides `Nv - 1` for every `v ∈ Q`. This is a predicate,
not a largest integer: the empty datum has every level. -/
def level (Q : TaylorWilesDatum S l) (N : ℕ) : Prop :=
  ∀ v ∈ Q.Q, (l : ℤ) ^ N ∣ (v.norm : ℤ) - 1

/-- The dimension `d_v` of `ψ̄_ṽ`. -/
def d (Q : TaylorWilesDatum S l) (v : Place F) : ℕ :=
  Module.finrank 𝓀[E] (Module.End.maxGenEigenspace
    (Matrix.toLin' (S.residGL (v.dec (geomFrob v.Fv)) : Matrix (Fin n) (Fin n) 𝓀[E])) (Q.α v))

/-- `r̄|G_{F_ṽ}`. -/
def localResid (S : DefProblem F E n Λ) (v : Place F) : Gal v.Fv →* GL (Fin n) 𝓀[E] :=
  S.residGL.comp v.dec.toMonoidHom

/-- The lift `ρ` of `r̄|G_{F_ṽ}` lies in `D_v^{TW}`: it is `1 + M_n(𝔪)`-conjugate to `s ⊕ ψ` with
`s` an unramified lift of `s̄_ṽ` and `ψ` a lift of `ψ̄_ṽ` on which inertia acts through scalars.
Equivalently there is an idempotent `e` commuting with `ρ`, lifting the projector onto `ψ̄_ṽ`, such
that inertia acts trivially on `(1 - e)` and through scalars on `e`. -/
def IsTWLift (Q : TaylorWilesDatum S l) (v : Place F) (ρ : Gal v.Fv → GL (Fin n) 𝒪[E]) : Prop :=
  ∃ e : Matrix (Fin n) (Fin n) 𝒪[E], e * e = e ∧
    (∀ σ, e * (ρ σ : Matrix (Fin n) (Fin n) 𝒪[E]) = (ρ σ : Matrix (Fin n) (Fin n) 𝒪[E]) * e) ∧
    IsEigenProjector (localResid S v (geomFrob v.Fv) : Matrix (Fin n) (Fin n) 𝓀[E])
      (e.map (IsLocalRing.residue 𝒪[E])) (Q.α v) ∧
    (∀ σ ∈ inertia v.Fv, (1 - e) * (ρ σ : Matrix (Fin n) (Fin n) 𝒪[E]) = 1 - e) ∧
    ∀ σ ∈ inertia v.Fv, ∃ c : 𝒪[E], e * (ρ σ : Matrix (Fin n) (Fin n) 𝒪[E]) = c • e

/-- **The local deformation problem `D_v^{TW}`**, as the ideal of `R^□_ṽ` cutting it out
(Thorne 2012, Definition 4.1 and Lemma 4.2). -/
def localProblem (Q : TaylorWilesDatum S l) (v : Place F) :
    Ideal (LiftingRing v.Fv E (localResid S v)) := sorry

/-- The `𝒪`-points of `D_v^{TW}` are the lifts conjugate to `s ⊕ ψ` with scalar inertia on
`ψ`. -/
theorem localProblem_spec (Q : TaylorWilesDatum S l) (v : Place F) (hv : v ∈ Q.Q)
    (ρ : Lift (localResid S v)) :
    Q.localProblem v ≤ ρ.prime ↔ Q.IsTWLift v ρ.1 := by
  sorry

/-- **The augmented problem `𝒮_Q`** `= (F/F⁺, S ∪ Q, S̃ ∪ Q̃, 𝒪, r̄, χ, {D_v}_{v ∈ S ∪ Q})`. -/
def augmented (Q : TaylorWilesDatum S l) : DefProblem F E n Λ := sorry

/-- `𝒮_Q` has the places `S̃ ∪ Q̃` and the residual representation of `𝒮`. -/
theorem augmented_spec (Q : TaylorWilesDatum S l) :
    Q.augmented.places = S.places ∪ Q.Q ∧ Q.augmented.resid = S.resid := by
  sorry

/-- `Δ_Q = ∏_{v ∈ Q} k(ṽ)^×(l)`. -/
abbrev Delta (Q : TaylorWilesDatum S l) : Type 1 := (v : Q.Q) → lQuot (𝓀[v.1.Fv])ˣ l

/-- **`R^univ_{𝒮_Q}` as a `Λ[Δ_Q]`-algebra**, through the scalar action of inertia on the
`ψ_v`. -/
@[reducible] def diamondAlgebra (Q : TaylorWilesDatum S l) :
    Algebra (MonoidAlgebra Λ Q.Delta) Q.augmented.univRing := sorry

/-- The augmentation quotient of `R^univ_{𝒮_Q}` is `R^univ_𝒮`. -/
theorem diamondAlgebra_augmentation (Q : TaylorWilesDatum S l) :
    letI := Q.diamondAlgebra
    Nonempty ((Q.augmented.univRing ⧸
        Ideal.map (algebraMap (MonoidAlgebra Λ Q.Delta) Q.augmented.univRing)
          (RingHom.ker (MonoidAlgebra.lift Λ Λ Q.Delta 1))) ≃+* S.univRing) := by
  sorry

/-- **`L_v^⊥`** is the space of unramified classes `[φ]` with `tr e_{Frob_ṽ,α_v} φ(Frob_ṽ) = 0`
(Thorne 2012, proof of Proposition 4.4; Thorne 2017, Lemma 2.19): a continuous cocycle `φ` with
values in `ad r̄(1)` lies in `L_v^⊥` if and only if it is cohomologous to a cocycle `φ'` that
vanishes on inertia and has `tr e φ'(Frob_ṽ) = 0`. -/
theorem localCondition_perp (Q : TaylorWilesDatum S l) (v : Place F) (hv : v ∈ Q.Q)
    (e : Matrix (Fin n) (Fin n) 𝓀[E])
    (he : IsEigenProjector (localResid S v (geomFrob v.Fv) : Matrix (Fin n) (Fin n) 𝓀[E]) e
      (Q.α v))
    (φ : Gal v.Fv → Matrix (Fin n) (Fin n) 𝓀[E])
    (hcont : ∀ X, IsOpen (φ ⁻¹' {X}))
    (hφ : ∀ σ τ, φ (σ * τ) = φ σ + ((cycloChar 𝓀[E] v.Fv σ : (𝓀[E])ˣ) : 𝓀[E]) •
      ((localResid S v σ : Matrix (Fin n) (Fin n) 𝓀[E]) * φ τ *
        ((localResid S v σ)⁻¹ : GL (Fin n) 𝓀[E]).1)) :
    φ ∈ tangentPerp (Q.localProblem v) ↔
      ∃ X : Matrix (Fin n) (Fin n) 𝓀[E],
        (∀ σ ∈ inertia v.Fv, φ σ + (((cycloChar 𝓀[E] v.Fv σ : (𝓀[E])ˣ) : 𝓀[E]) •
          ((localResid S v σ : Matrix (Fin n) (Fin n) 𝓀[E]) * X *
            ((localResid S v σ)⁻¹ : GL (Fin n) 𝓀[E]).1) - X) = 0) ∧
        Matrix.trace (e * (φ (geomFrob v.Fv) +
          (((cycloChar 𝓀[E] v.Fv (geomFrob v.Fv) : (𝓀[E])ˣ) : 𝓀[E]) •
            ((localResid S v (geomFrob v.Fv) : Matrix (Fin n) (Fin n) 𝓀[E]) * X *
              ((localResid S v (geomFrob v.Fv))⁻¹ : GL (Fin n) 𝓀[E]).1) - X))) = 0 := by
  sorry

end TaylorWilesDatum

-- test: twDatum_empty
example (S : DefProblem F E n Λ) (l : ℕ) (Q : TaylorWilesDatum S l) (h : Q.Q = ∅) :
    Q.augmented = S ∧ Subsingleton Q.Delta ∧ ∀ N : ℕ, Q.level N := by
  sorry

-- test: twDatum_rank_one_block
-- For `dim ψ̄_v = 1` the scalar condition is empty and `D_v^{TW}` is the condition of
-- Clozel–Harris–Taylor, Definition 2.5.7. The condition of GlobalGaloisDeformations
-- G7/taylor-wiles-local-diamond allows every lift (the zero ideal of `R^□`); `D_v^{TW}` is
-- contained in it, with equality only for `n = 1`.
example (S : DefProblem F E n Λ) (l : ℕ) (Q : TaylorWilesDatum S l) (v : Place F) (hv : v ∈ Q.Q)
    (hd : Q.d v = 1) :
    (∀ ρ : Lift (TaylorWilesDatum.localResid S v),
      Q.localProblem v ≤ ρ.prime ↔
        ∃ e : Matrix (Fin n) (Fin n) 𝒪[E], e * e = e ∧
          (∀ σ, e * (ρ.1 σ : Matrix (Fin n) (Fin n) 𝒪[E]) =
            (ρ.1 σ : Matrix (Fin n) (Fin n) 𝒪[E]) * e) ∧
          IsEigenProjector (TaylorWilesDatum.localResid S v (geomFrob v.Fv) :
              Matrix (Fin n) (Fin n) 𝓀[E]) (e.map (IsLocalRing.residue 𝒪[E])) (Q.α v) ∧
          ∀ σ ∈ inertia v.Fv, (1 - e) * (ρ.1 σ : Matrix (Fin n) (Fin n) 𝒪[E]) = 1 - e) ∧
    (n = 1 → Q.localProblem v = ⊥) ∧ (2 ≤ n → Q.localProblem v ≠ ⊥) := by
  sorry

-- test: twDatum_unramified_lift
example (S : DefProblem F E n Λ) (l : ℕ) (Q : TaylorWilesDatum S l) (v : Place F) (hv : v ∈ Q.Q)
    (ρ : Lift (TaylorWilesDatum.localResid S v)) (hur : IsUnramified ρ.1.toMonoidHom) :
    Q.localProblem v ≤ ρ.prime := by
  sorry

-- test: twDatum_nonexample_nonscalar
example (S : DefProblem F E n Λ) (l : ℕ) (Q : TaylorWilesDatum S l) (v : Place F) (hv : v ∈ Q.Q)
    (ρ : Lift (TaylorWilesDatum.localResid S v)) (e : Matrix (Fin n) (Fin n) 𝒪[E])
    (he : e * e = e)
    (hcomm : ∀ σ, e * (ρ.1 σ : Matrix (Fin n) (Fin n) 𝒪[E]) =
      (ρ.1 σ : Matrix (Fin n) (Fin n) 𝒪[E]) * e)
    (hproj : IsEigenProjector (TaylorWilesDatum.localResid S v (geomFrob v.Fv) :
      Matrix (Fin n) (Fin n) 𝓀[E]) (e.map (IsLocalRing.residue 𝒪[E])) (Q.α v))
    (σ : Gal v.Fv) (hσ : σ ∈ inertia v.Fv)
    (hunip : IsNilpotent (e * ((ρ.1 σ : Matrix (Fin n) (Fin n) 𝒪[E]) - 1)))
    (hns : ¬ ∃ c : 𝒪[E], e * (ρ.1 σ : Matrix (Fin n) (Fin n) 𝒪[E]) = c • e) :
    ¬ Q.localProblem v ≤ ρ.prime := by
  sorry

end TWDatum

end TauCeti.Automorphy

namespace TauCeti.DefiniteUnitary

open TauCeti.Automorphy

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-! ### PL.3/taylor-wiles-level-structures: Taylor–Wiles level structures and the parahoric
projection -/

/-- The parahoric subgroup `𝔭 ⊂ GL_n(𝒪_K)` of type `(n - d, d)`: the matrices whose reduction is
block upper triangular. -/
def parahoricInt (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n d : ℕ) : Subgroup (GL (Fin n) 𝒪[K]) where
  carrier := {g | ∀ i j : Fin n, (j : ℕ) < n - d → n - d ≤ (i : ℕ) →
    (g : Matrix (Fin n) (Fin n) 𝒪[K]) i j ∈ IsLocalRing.maximalIdeal 𝒪[K]}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- `𝔭₁ ⊂ 𝔭`: the kernel of `𝔭 → k^×(l)`, `g ↦` the class of the determinant of the lower right
`d × d` block of `g` modulo the maximal ideal. -/
def parahoric1Int (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n d l : ℕ) : Subgroup (GL (Fin n) 𝒪[K]) where
  carrier := {g | g ∈ parahoricInt K n d ∧ ∃ m : ℕ, m.Coprime l ∧
    IsLocalRing.residue 𝒪[K] (((g : Matrix (Fin n) (Fin n) 𝒪[K]).submatrix
      (Subtype.val : {i : Fin n // n - d ≤ (i : ℕ)} → Fin n) Subtype.val).det) ^ m = 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

/-- The diagonal matrix with entry `a` in position `i₀` and `1` elsewhere. -/
def diagAt (K : Type) [Field K] (n i₀ : ℕ) (a : Kˣ) : GL (Fin n) K :=
  Matrix.GeneralLinearGroup.mk''
    (Matrix.diagonal fun i : Fin n => if (i : ℕ) = i₀ then (a : K) else 1) (by sorry)

/-- `diag(1_{n-d}, a 1_j, 1_{d-j})`. -/
def diagMid (K : Type) [Field K] (n d j : ℕ) (a : Kˣ) : GL (Fin n) K :=
  Matrix.GeneralLinearGroup.mk''
    (Matrix.diagonal fun i : Fin n =>
      if n - d ≤ (i : ℕ) ∧ (i : ℕ) < n - d + j then (a : K) else 1) (by sorry)

/-- The same data with the set `T` enlarged by a finite set of places. -/
@[reducible] def HeckeDatum.addPlaces (D : HeckeDatum E) (Q : Set (Place D.L)) (hQ : Q.Finite) :
    HeckeDatum E :=
  { D with
    T := D.T ∪ Q
    T_finite := D.T_finite.union hQ
    above_l_mem := fun v hv =>
      let ⟨w, hw, e⟩ := D.above_l_mem v hv
      ⟨w, Or.inl hw, e⟩
    R_subset := fun _ hv => Or.inl (D.R_subset hv) }

/-- The level of Thorne 2012, Theorem 6.8: `R = ∅`, `U = ∏ U_v`, `U_v = G(𝒪_{L⁺_v})` for `v | l`
and for split `v ∉ T`, and `U_v` hyperspecial at the inert places. -/
structure HeckeDatum.MinimalLevel (D : HeckeDatum E) : Prop where
  R_empty : D.R = ∅
  product : D.IsProduct
  level_l : ∀ v : Place D.L, v.Above D.l → D.levelAt v = integralPoints D.toCMData v
  spherical : D.SphericalOutsideT
  hyperspecial : ∀ v : Place D.toCMData.Lplus, D.toCMData.IsInert v →
    (hyperspecial D.toCMData v).Holds (D.levelAtPlus v)

/-- `S_λ(U, 𝒪)_m`, as the largest Hecke-stable submodule of `S_λ(U, 𝒪)` on which every element of
`T^T_λ(U, 𝒪)` outside `m` is bijective (a direct summand, the Hecke algebra being finite over
`𝒪`). -/
def heckeLocalization (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) : Submodule 𝒪[E] (AlgebraicModularForm D lam 𝒪[E]) :=
  sSup {N | (∀ x, ∀ f ∈ N, heckeAlgebra.toEnd D lam x f ∈ N) ∧
    ∀ x, x ∉ m → ∀ g ∈ N, ∃! f, f ∈ N ∧ heckeAlgebra.toEnd D lam x f = g}

/-- The inclusion `T^{T ∪ Q}_λ(U, 𝒪) → T^T_λ(U, 𝒪)`. -/
def heckeAlgebra.map_addPlaces (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (Q : Set (Place D.L)) (hQ : Q.Finite) :
    heckeAlgebra (D.addPlaces Q hQ) lam →ₐ[𝒪[E]] heckeAlgebra D lam := sorry

theorem heckeAlgebra.map_addPlaces_spec (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (Q : Set (Place D.L)) (hQ : Q.Finite) :
    Function.Injective (heckeAlgebra.map_addPlaces D lam Q hQ) ∧
      ∀ (w : Place D.L) (j : ℕ), (D.addPlaces Q hQ).IsHeckePlace w → 1 ≤ j → j ≤ D.n →
        heckeAlgebra.map_addPlaces D lam Q hQ (heckeAlgebra.T (D.addPlaces Q hQ) lam w j) =
          heckeAlgebra.T D lam w j := by
  sorry

/-- A Taylor–Wiles datum `(Q, Q̃, {ψ̄_ṽ})` for a maximal ideal `m` of `T^T_λ(U, 𝒪)`: the datum of
PL.3/thorne-taylor-wiles-datum for `r̄_m`, with `Q̃` a finite set of places of `L` split over `L⁺`
and outside `T`, one above each place of `Q`, together with uniformizers `ϖ_ṽ`. -/
structure TWData (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] where
  /-- The set `Q̃`. -/
  Q : Set (Place D.L)
  finite : Q.Finite
  hecke : ∀ v ∈ Q, D.IsHeckePlace v
  distinct : ∀ v ∈ Q, ∀ v' ∈ Q, D.toCMData.SameBelow v v' → v = v'
  /-- The eigenvalues `α_ṽ`. -/
  α : Place D.L → heckeAlgebra D lam ⧸ m
  tw : ∀ v ∈ Q, IsTWPlace (residualRep D lam m) D.l v (α v)
  /-- The uniformizers `ϖ_ṽ`. -/
  ϖ : (v : Place D.L) → (v.Fv)ˣ
  ϖ_unif : ∀ v, IsUniformizer v.Fv (ϖ v)

namespace TWData

variable {D : HeckeDatum E} {lam : (D.L →+* E) → Fin D.n → ℤ} {m : Ideal (heckeAlgebra D lam)}
  [m.IsMaximal]

/-- The dimension `d_ṽ` of `ψ̄_ṽ`. -/
def d (Q : TWData D lam m) (v : Place D.L) : ℕ :=
  Module.finrank (heckeAlgebra D lam ⧸ m) (Module.End.maxGenEigenspace
    (Matrix.toLin' (residualRep D lam m (v.dec (geomFrob v.Fv)) :
      Matrix (Fin D.n) (Fin D.n) (heckeAlgebra D lam ⧸ m))) (Q.α v))

end TWData

section TWLevels

variable {D : HeckeDatum E} {lam : (D.L →+* E) → Fin D.n → ℤ} {m : Ideal (heckeAlgebra D lam)}
  [m.IsMaximal] (Q : TWData D lam m)

/-- **`U₀(Q)`**: `U` away from `Q`, the parahoric `ι_ṽ⁻¹ 𝔭_ṽ` of type `(n - d_ṽ, d_ṽ)` at
`v ∈ Q`. -/
def twLevel0 : Subgroup D.G :=
  D.level ⊓ ⨅ (v : Place D.L) (hv : v ∈ Q.Q),
    ((parahoricInt v.Fv D.n (Q.d v)).map (integralGL v.Fv D.n)).comap
      ((iotaW D.toCMData v (Q.hecke v hv).2.2).toMonoidHom.comp (localProj D.toCMData v))

/-- **`U₁(Q)`** `⊂ U₀(Q)`: `ι_ṽ⁻¹ 𝔭_{ṽ,1}` at `v ∈ Q`, so that `U₀(Q)/U₁(Q) ≅ Δ_Q`. -/
def twLevel1 : Subgroup D.G :=
  D.level ⊓ ⨅ (v : Place D.L) (hv : v ∈ Q.Q),
    ((parahoric1Int v.Fv D.n (Q.d v) D.l).map (integralGL v.Fv D.n)).comap
      ((iotaW D.toCMData v (Q.hecke v hv).2.2).toMonoidHom.comp (localProj D.toCMData v))

theorem twLevel0_isOpen : IsOpen (twLevel0 Q : Set D.G) := by
  sorry

theorem twLevel0_isCompact : IsCompact (twLevel0 Q : Set D.G) := by
  sorry

theorem twLevel1_isOpen : IsOpen (twLevel1 Q : Set D.G) := by
  sorry

theorem twLevel1_isCompact : IsCompact (twLevel1 Q : Set D.G) := by
  sorry

theorem twLevel0_le : twLevel0 Q ≤ D.level := by
  sorry

theorem twLevel1_le : twLevel1 Q ≤ twLevel0 Q := by
  sorry

/-- `U₁(Q) ⊴ U₀(Q)` with `U₀(Q)/U₁(Q) ≅ Δ_Q = ∏_{v ∈ Q} k(ṽ)^×(l)`. -/
theorem twLevel_quotient (hlev : D.MinimalLevel) :
    ((twLevel1 Q).subgroupOf (twLevel0 Q)).Normal ∧
      ∃ φ : twLevel0 Q →* ((v : Q.Q) → lQuot (𝓀[v.1.Fv])ˣ D.l),
        Function.Surjective φ ∧ φ.ker = (twLevel1 Q).subgroupOf (twLevel0 Q) := by
  sorry

/-- The datum at level `U₀(Q)`, with `T` enlarged by `Q̃`. -/
@[reducible] def TWData.datum0 : HeckeDatum E :=
  (D.addPlaces Q.Q Q.finite).withLevel (twLevel0 Q : Subgroup D.G) (twLevel0_isOpen Q)
    (twLevel0_isCompact Q)

/-- The datum at level `U₁(Q)`, with `T` enlarged by `Q̃`. -/
@[reducible] def TWData.datum1 : HeckeDatum E :=
  Q.datum0.withLevel (twLevel1 Q : Subgroup D.G) (twLevel1_isOpen Q) (twLevel1_isCompact Q)

/-- `T^{T ∪ Q}_λ(U₀(Q), 𝒪) → T^T_λ(U, 𝒪)`. -/
def TWData.toBase0 : heckeAlgebra Q.datum0 lam →ₐ[𝒪[E]] heckeAlgebra D lam :=
  (heckeAlgebra.map_addPlaces D lam Q.Q Q.finite).comp
    (heckeAlgebra.map_restrict (D.addPlaces Q.Q Q.finite) lam (twLevel0 Q : Subgroup D.G)
      (twLevel0_isOpen Q) (twLevel0_isCompact Q) (twLevel0_le Q))

/-- `T^{T ∪ Q}_λ(U₁(Q), 𝒪) → T^T_λ(U, 𝒪)`. -/
def TWData.toBase1 : heckeAlgebra Q.datum1 lam →ₐ[𝒪[E]] heckeAlgebra D lam :=
  Q.toBase0.comp (heckeAlgebra.map_restrict Q.datum0 lam (twLevel1 Q : Subgroup D.G)
    (twLevel1_isOpen Q) (twLevel1_isCompact Q) (twLevel1_le Q))

/-- The maximal ideal `m_Q` of `T^{T ∪ Q}_λ(U₀(Q), 𝒪)` induced by `m`. -/
def TWData.mQ0 : Ideal (heckeAlgebra Q.datum0 lam) := m.comap Q.toBase0

/-- The maximal ideal `m_Q` of `T^{T ∪ Q}_λ(U₁(Q), 𝒪)` induced by `m`. -/
def TWData.mQ1 : Ideal (heckeAlgebra Q.datum1 lam) := m.comap Q.toBase1

instance TWData.mQ0_isMaximal : Q.mQ0.IsMaximal := by
  sorry

instance TWData.mQ1_isMaximal : Q.mQ1.IsMaximal := by
  sorry

/-- **The action of `𝒪[Δ_Q]` on `S_λ(U₁(Q), A)` by diamond operators**, `Δ_Q = U₀(Q)/U₁(Q)`: the
class of `u ∈ U₀(Q)` acts by `(u·f)(g) = u f(gu)`. -/
def twDiamondAction (A : Type) [AddCommGroup A] [Module 𝒪[E] A] (u : Q.datum0.level) :
    Module.End 𝒪[E] (AlgebraicModularForm Q.datum1 lam A) :=
  diamondOp Q.datum0 lam A (twLevel1 Q : Subgroup D.G) (twLevel1_isOpen Q)
    (twLevel1_isCompact Q) u

/-- The diamond operators form an action of `Δ_Q` that commutes with `T^{T ∪ Q}`. -/
theorem twDiamondAction_spec (A : Type) [AddCommGroup A] [Module 𝒪[E] A] :
    (∀ u u' : Q.datum0.level,
      twDiamondAction Q A (u * u') = twDiamondAction Q A u * twDiamondAction Q A u') ∧
    (∀ u : Q.datum0.level, (u : D.G) ∈ twLevel1 Q → twDiamondAction Q A u = 1) ∧
    ∀ (u : Q.datum0.level), ∀ x ∈ heckeGenerators Q.datum1 lam A,
      twDiamondAction Q A u * x = x * twDiamondAction Q A u := by
  sorry

/-- The operator `V^j_ṽ = ι_ṽ⁻¹[𝔭₁ diag(1_{n-d}, ϖ_ṽ 1_j, 1_{d-j}) 𝔭₁]` on `S_λ(U₁(Q), 𝒪)`. -/
def twV (v : Place D.L) (j : ℕ) : Module.End 𝒪[E] (AlgebraicModularForm Q.datum1 lam 𝒪[E]) :=
  sorry

/-- `V^j_ṽ` is the double coset operator of `diag(1_{n-d}, ϖ_ṽ 1_j, 1_{d-j})`. -/
theorem twV_apply (v : Place D.L) (hv : v ∈ Q.Q) (j : ℕ) (hj : 1 ≤ j ∧ j ≤ Q.d v) (a : D.G)
    (ha : IsLocalAt D.toCMData v (Q.hecke v hv).2.2 (diagMid v.Fv D.n (Q.d v) j (Q.ϖ v)) a)
    (s : Finset D.G) (hs : IsCosetDecomposition (twLevel1 Q) a s)
    (hsupport : ∀ x ∈ s, ∀ u : Place D.toCMData.Lplus,
      ¬ D.toCMData.LiesAbove v u → localProjPlus D.toCMData u x = 1)
    (f : AlgebraicModularForm Q.datum1 lam 𝒪[E]) (g : D.G) :
    (twV Q v j f).1 g = ∑ x ∈ s, f.1 (g * x) := by
  sorry

/-- **The polynomial cutout `pr_{ϖ_ṽ} = ∏_{j=1}^{d_ṽ} Q_j(V^j_ṽ)`** of Thorne 2012 §5 on
`S_λ(U₁(Q), 𝒪)_{m_Q}`. It is not an idempotent: it is an automorphism of its image, the selected
module, which is a direct summand. -/
def twProjection (v : Place D.L) : Module.End 𝒪[E] (heckeLocalization Q.datum1 lam Q.mQ1) :=
  sorry

/-- `pr_{ϖ_ṽ}` at level `U₀(Q)`. -/
def twProjection0 (v : Place D.L) : Module.End 𝒪[E] (heckeLocalization Q.datum0 lam Q.mQ0) :=
  sorry

/-- `pr_{ϖ_ṽ}` is a polynomial in the `V^j_ṽ` with coefficients in the Hecke algebra; it kills a
complement of its image and is an automorphism of its image; the `pr_{ϖ_ṽ}` for different `v`
commute with each other and with `T^{T ∪ Q}`. -/
theorem twProjection_spec (hst : D.Standing lam) (hlev : D.MinimalLevel)
    (hne : IsNonEisenstein D lam m) (v : Place D.L) (hv : v ∈ Q.Q) :
    twProjection Q v ∈ Algebra.adjoin 𝒪[E] {y | ∃ x,
        (x ∈ Set.range (heckeAlgebra.toEnd Q.datum1 lam) ∨ ∃ j, 1 ≤ j ∧ j ≤ Q.d v ∧ x = twV Q v j) ∧
        ∀ f : heckeLocalization Q.datum1 lam Q.mQ1, (y f).1 = x f.1} ∧
    (∃ N N' : Submodule 𝒪[E] (heckeLocalization Q.datum1 lam Q.mQ1), IsCompl N N' ∧
      N = LinearMap.range (twProjection Q v) ∧ (∀ f ∈ N', twProjection Q v f = 0) ∧
      ∀ g ∈ N, ∃! f, f ∈ N ∧ twProjection Q v f = g) ∧
    (∀ v' ∈ Q.Q, twProjection Q v * twProjection Q v' = twProjection Q v' * twProjection Q v) ∧
    ∀ (x : heckeAlgebra Q.datum1 lam) (f f₂ : heckeLocalization Q.datum1 lam Q.mQ1),
      f₂.1 = heckeAlgebra.toEnd Q.datum1 lam x f.1 →
      (twProjection Q v f₂).1 = heckeAlgebra.toEnd Q.datum1 lam x (twProjection Q v f).1 := by
  sorry

/-- `H₁ = (∏_{v ∈ Q} pr_{ϖ_ṽ}) S_λ(U₁(Q), 𝒪)_{m_Q}`, as a submodule of `S_λ(U₁(Q), 𝒪)`. -/
def twModule1 : Submodule 𝒪[E] (AlgebraicModularForm Q.datum1 lam 𝒪[E]) :=
  (⨅ (v : Place D.L) (_ : v ∈ Q.Q), LinearMap.range (twProjection Q v)).map
    (heckeLocalization Q.datum1 lam Q.mQ1).subtype

/-- `H₀ = (∏_{v ∈ Q} pr_{ϖ_ṽ}) S_λ(U₀(Q), 𝒪)_{m_Q}`, as a submodule of `S_λ(U₀(Q), 𝒪)`. -/
def twModule0 : Submodule 𝒪[E] (AlgebraicModularForm Q.datum0 lam 𝒪[E]) :=
  (⨅ (v : Place D.L) (_ : v ∈ Q.Q), LinearMap.range (twProjection0 Q v)).map
    (heckeLocalization Q.datum0 lam Q.mQ0).subtype

/-- The trace `S_λ(U₁(Q), 𝒪) → S_λ(U₀(Q), 𝒪)`. -/
def twTrace : AlgebraicModularForm Q.datum1 lam 𝒪[E] →ₗ[𝒪[E]]
    AlgebraicModularForm Q.datum0 lam 𝒪[E] :=
  AlgebraicModularForm.trace Q.datum0 lam 𝒪[E] (twLevel1 Q : Subgroup D.G) (twLevel1_isOpen Q)
    (twLevel1_isCompact Q) (twLevel1_le Q)

/-- `H₁` is free over `𝒪[Δ_Q]`: it is stable under the diamond operators and, for representatives
`s` of `U₀(Q)/U₁(Q)`, has an `𝒪`-basis of translates `u·b_i`, `u ∈ s`, `1 ≤ i ≤ r`. -/
def IsFreeOverDelta (r : ℕ) : Prop :=
  (∀ (u : Q.datum0.level), ∀ f ∈ twModule1 Q, twDiamondAction Q 𝒪[E] u f ∈ twModule1 Q) ∧
  ∀ s : Finset Q.datum0.level, Q.datum0.IsReps (twLevel1 Q : Subgroup D.G) s →
    ∃ b : Fin r → AlgebraicModularForm Q.datum1 lam 𝒪[E],
      LinearIndependent 𝒪[E] (fun p : s × Fin r => twDiamondAction Q 𝒪[E] p.1 (b p.2)) ∧
      Submodule.span 𝒪[E] (Set.range fun p : s × Fin r => twDiamondAction Q 𝒪[E] p.1 (b p.2)) =
        twModule1 Q

/-- The trace induces `H₁/𝔞_Q H₁ ≅ H₀`, `𝔞_Q` the augmentation ideal of `𝒪[Δ_Q]`. -/
def TraceInducesIso : Prop :=
  (twModule1 Q).map (twTrace Q) = twModule0 Q ∧
  ∀ f ∈ twModule1 Q, twTrace Q f = 0 →
    f ∈ Submodule.span 𝒪[E] {x | ∃ (u : Q.datum0.level), ∃ g ∈ twModule1 Q,
      x = twDiamondAction Q 𝒪[E] u g - g}

variable (hst : D.Standing lam) (hlev : D.MinimalLevel) (hne : IsNonEisenstein D lam m)

include hst hlev hne

/-- **PL.3/taylor-wiles-level-structures (a)**: `T^{T ∪ Q}_λ(U, 𝒪)_m → T^T_λ(U, 𝒪)_m` is an
isomorphism (Thorne 2012, proof of Theorem 6.8). -/
theorem tw_hecke_iso :
    Function.Bijective (Localization.localRingHom
      (m.comap (heckeAlgebra.map_addPlaces D lam Q.Q Q.finite).toRingHom) m
      (heckeAlgebra.map_addPlaces D lam Q.Q Q.finite).toRingHom rfl) := by
  sorry

/-- **PL.3/taylor-wiles-level-structures (b)** (Thorne 2012, Proposition 5.9):
`∏_{v ∈ Q} pr_{ϖ_ṽ}` maps `H = S_λ(U, 𝒪)_m` isomorphically onto `H₀`, compatibly with
`T^{T ∪ Q}`. -/
theorem tw_level_zero_iso :
    ∃ e : heckeLocalization D lam m ≃ₗ[𝒪[E]] twModule0 Q,
      ∀ (x : heckeAlgebra Q.datum0 lam) (f f₂ : heckeLocalization D lam m),
        f₂.1 = heckeAlgebra.toEnd D lam (Q.toBase0 x) f.1 →
        (e f₂).1 = heckeAlgebra.toEnd Q.datum0 lam x (e f).1 := by
  sorry

/-- **`tw_free`** (PL.3/taylor-wiles-level-structures (c); Thorne 2012, Lemma 6.4). If no
`t⁻¹ G(L⁺) t ∩ U₀(Q)` contains an element of order `l`, then `H₁` is free over `𝒪[Δ_Q]`, of rank
`rank_𝒪 S_λ(U, 𝒪)_m`, with coinvariants `H₀ ≅ S_λ(U, 𝒪)_m`. -/
theorem tw_free (hno : Q.datum0.NoOrderL) :
    IsFreeOverDelta Q (Module.finrank 𝒪[E] (heckeLocalization D lam m)) ∧ TraceInducesIso Q ∧
      Nonempty (twModule0 Q ≃ₗ[𝒪[E]] heckeLocalization D lam m) := by
  sorry

omit hst hlev hne in
/-- The annihilator of `H₁` in `T^{T ∪ Q}_λ(U₁(Q), 𝒪)`. -/
def twAnn : Ideal (heckeAlgebra Q.datum1 lam) where
  carrier := {x | ∀ f ∈ twModule1 Q, heckeAlgebra.toEnd Q.datum1 lam x f = 0}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

omit hst hlev hne in
/-- `T₁`, the image of `T^{T ∪ Q}_λ(U₁(Q), 𝒪)` in `End_𝒪(H₁)`. -/
abbrev twT1 : Type := heckeAlgebra Q.datum1 lam ⧸ twAnn Q

omit hst hlev hne in
/-- `T^{T ∪ Q}_λ(U₁(Q), 𝒪)_{m_Q} → T₁`. -/
def twLocToT1 : Localization.AtPrime Q.mQ1 →+* twT1 Q :=
  IsLocalization.lift (M := Q.mQ1.primeCompl) (g := Ideal.Quotient.mk (twAnn Q)) (by sorry)

omit hst hlev hne in
/-- The reduction `T₁ → T^T_λ(U, 𝒪)/m`. -/
def twResidue : twT1 Q →+* (heckeAlgebra D lam ⧸ m) :=
  Ideal.Quotient.lift (twAnn Q) ((Ideal.Quotient.mk m).comp (Q.toBase1 : _ →+* _)) (by sorry)

omit hst hlev hne in
/-- `(r_{m_Q} ⊗ T₁)|G_{L_ṽ}`. -/
def twLocalRep (v : Place D.L) (σ : Gal v.Fv) : GL (Fin D.n) (twT1 Q) :=
  Matrix.GeneralLinearGroup.map (twLocToT1 Q) (heckeGaloisRepGL Q.datum1 lam Q.mQ1 (v.dec σ))

/-- **`tw_inertia`** (PL.3/taylor-wiles-level-structures (d); Thorne 2012, Proposition 5.12). For
`v ∈ Q` there is a character `V_ṽ : 𝒪_{L_ṽ}^× → T₁^×` such that the diamond operator `V_α` of
`α ∈ 𝒪_{L_ṽ}^×` acts on `H₁` as `V_ṽ(α)`, and `(r_{m_Q} ⊗ T₁)|G_{L_ṽ} ≅ s ⊕ ψ` with `s` an
unramified lift of `s̄_ṽ`, `ψ` a lift of `ψ̄_ṽ`, and inertia acting on `ψ` through the scalar
character `V_ṽ ∘ Art⁻¹`. -/
theorem tw_inertia (v : Place D.L) (hv : v ∈ Q.Q) :
    ∃ (V : (𝒪[v.Fv])ˣ →* (twT1 Q)ˣ) (e : Matrix (Fin D.n) (Fin D.n) (twT1 Q)),
      (∀ (a : (𝒪[v.Fv])ˣ) (u : Q.datum0.level),
        IsLocalAt D.toCMData v (Q.hecke v hv).2.2
          (diagAt v.Fv D.n (D.n - Q.d v) (unitOfInt a)) (u : D.G) →
        ∀ x : heckeAlgebra Q.datum1 lam, Ideal.Quotient.mk (twAnn Q) x = V a →
        ∀ f ∈ twModule1 Q, twDiamondAction Q 𝒪[E] u f = heckeAlgebra.toEnd Q.datum1 lam x f) ∧
      e * e = e ∧
      (∀ σ : Gal v.Fv, e * (twLocalRep Q v σ).1 = (twLocalRep Q v σ).1 * e) ∧
      IsEigenProjector (residualRep D lam m (v.dec (geomFrob v.Fv)) :
          Matrix (Fin D.n) (Fin D.n) (heckeAlgebra D lam ⧸ m)) (e.map (twResidue Q)) (Q.α v) ∧
      (∀ σ ∈ inertia v.Fv, (1 - e) * (twLocalRep Q v σ).1 = 1 - e) ∧
      ∀ (a : (𝒪[v.Fv])ˣ) (σ : Gal v.Fv), σ ∈ inertia v.Fv →
        Abelianization.of σ = artin v.Fv (unitOfInt a) →
        e * (twLocalRep Q v σ).1 = ((V a : (twT1 Q)ˣ) : twT1 Q) • e := by
  sorry

-- test: tw_empty
omit hst hlev hne in
example (hQ : Q.Q = ∅) :
    twLevel0 Q = D.level ∧ twLevel1 Q = D.level ∧
      (∀ u : Q.datum0.level, twDiamondAction Q 𝒪[E] u = 1) ∧
      ∀ v : Place D.L, twProjection Q v = 1 ∧ twProjection0 Q v = 1 := by
  sorry

-- test: tw_coinvariants
example (hno : Q.datum0.NoOrderL) :
    TraceInducesIso Q ∧
    (∀ (x : heckeAlgebra Q.datum1 lam) (f : AlgebraicModularForm Q.datum1 lam 𝒪[E]),
      twTrace Q (heckeAlgebra.toEnd Q.datum1 lam x f) =
        heckeAlgebra.toEnd Q.datum0 lam
          (heckeAlgebra.map_restrict Q.datum0 lam (twLevel1 Q : Subgroup D.G) (twLevel1_isOpen Q)
            (twLevel1_isCompact Q) (twLevel1_le Q) x) (twTrace Q f)) ∧
    ∃ e : heckeLocalization D lam m ≃ₗ[𝒪[E]] twModule0 Q,
      ∀ (x : heckeAlgebra Q.datum0 lam) (f f₂ : heckeLocalization D lam m),
        f₂.1 = heckeAlgebra.toEnd D lam (Q.toBase0 x) f.1 →
        (e f₂).1 = heckeAlgebra.toEnd Q.datum0 lam x (e f).1 := by
  sorry

-- test: tw_rank
example (v : Place D.L) (hQ : Q.Q = {v}) (hno : Q.datum0.NoOrderL) (r : ℕ)
    (hfree : Module.Free 𝒪[E] (heckeLocalization D lam m))
    (hr : Module.finrank 𝒪[E] (heckeLocalization D lam m) = r) :
    IsFreeOverDelta Q r ∧
      ((twLevel1 Q).subgroupOf (twLevel0 Q)).index = Nat.card (lQuot (𝓀[v.Fv])ˣ D.l) ∧
      Module.finrank 𝒪[E] (twModule1 Q) = r * Nat.card (lQuot (𝓀[v.Fv])ˣ D.l) := by
  sorry

-- test: tw_not_free_without_smallness
omit hne in
example (h0 : lam = 0)
    (hbad : ∃ t : D.G, ∃ u ∈ Q.datum0.stabilizer t, (u : D.G) ∉ twLevel1 Q) :
    (∃ (g : D.G) (u : D.G), u ∈ twLevel0 Q ∧ u ∉ twLevel1 Q ∧
      (Quot.mk _ (g * u) : DoubleCosetSpace D.toCMData (twLevel1 Q)) = Quot.mk _ g) ∧
    ∀ s : Finset Q.datum0.level, Q.datum0.IsReps (twLevel1 Q : Subgroup D.G) s →
      ¬ ∃ (r : ℕ) (b : Fin r → AlgebraicModularForm Q.datum1 lam 𝒪[E]),
        LinearIndependent 𝒪[E] (fun p : s × Fin r => twDiamondAction Q 𝒪[E] p.1 (b p.2)) ∧
        Submodule.span 𝒪[E]
          (Set.range fun p : s × Fin r => twDiamondAction Q 𝒪[E] p.1 (b p.2)) = ⊤ := by
  sorry

end TWLevels

end TauCeti.DefiniteUnitary

namespace TauCeti.Automorphy

/-! ## PL.6 and PL.7: residually reducible representations

Schur and primitive residual representations, connectedness dimension, the subring `P_𝒮` of the
universal deformation ring generated by characteristic polynomials, reducibility ideals, generic
primes and the generic `R_𝔭 = T_𝔭` theorem (PL.6); the finiteness and automorphy lifting theorems
of Thorne, Allen–Newton–Thorne and Newton–Thorne that are deduced from them (PL.7). -/

/-! #### Imported interfaces used by PL.6 -/

section ImportedPL6

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group (stand-in): the embedding
`GL_n(A) → 𝒢_n(A)`, `g ↦ (g, 1)`. -/
def CHT.ofGL (n : ℕ) (A : Type*) [CommRing A] : GL (Fin n) A →* CHT n A := sorry

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group (stand-in): the adjoint action
of `𝒢_n(A)` on `𝔤𝔩_n(A) = M_n(A)`: `(g, a)` acts by `X ↦ g X g⁻¹` and `ȷ` by `X ↦ -ᵗX`. -/
def CHT.ad (n : ℕ) (A : Type*) [CommRing A] :
    Representation A (CHT n A) (Matrix (Fin n) (Fin n) A) := sorry

/-- ArithmeticGaloisRepresentations G7/polarized-representation (stand-in): the block sum
`r₁ ⊕ r₂ : Γ → 𝒢_n(A)`, `n = n₁ + n₂`, of two homomorphisms `r_i : Γ → 𝒢_{n_i}(A)` with the same
multiplier and the same preimage of the identity component,
`(g₁, a)ȷ^e ⊕ (g₂, a)ȷ^e = (diag(g₁, g₂), a)ȷ^e`. -/
def CHT.directSum {Γ : Type*} [Group Γ] {A : Type*} [CommRing A] {n₁ n₂ n : ℕ} (_h : n₁ + n₂ = n)
    (r₁ : Γ →* CHT n₁ A) (r₂ : Γ →* CHT n₂ A) : Γ →* CHT n A := sorry

/-- GlobalGaloisDeformations R04.4/change-of-determinant (stand-in): the twist `r ⊗ ψ` of a
`𝒢_n(A)`-valued homomorphism of `G_{F⁺}` by a character `ψ` of `G_F` with `ψ ψ^c = 1`, for a
complex conjugation `c` (Thorne 2015, Lemma 3.34): the homomorphism with
`(r ⊗ ψ)|G_F = r|G_F ⊗ ψ` and `(r ⊗ ψ)(c) = r(c)`; then `ν ∘ (r ⊗ ψ) = ν ∘ r`. -/
def CHT.twist {F : Type*} [Field F] {A : Type*} [CommRing A] {n : ℕ}
    (c : Gal (maximalRealSubfield F)) (r : Gal (maximalRealSubfield F) →* CHT n A)
    (ψ : Gal F →* Aˣ) : Gal (maximalRealSubfield F) →* CHT n A := sorry

/-- IntegralHeckeAndGaloisDeterminants IHG.0/determinant (stand-in): the `n`-dimensional
determinants of `Γ` over `A` in the sense of Chenevier (multiplicative homogeneous polynomial laws
`A[Γ] → A` of degree `n`). -/
def Determinant (Γ : Type*) [Group Γ] (A : Type*) [CommRing A] (n : ℕ) : Type := sorry

namespace Determinant

variable {Γ : Type*} [Group Γ] {A : Type*} [CommRing A] {n : ℕ}

/-- IHG.0/determinant (stand-in): the determinant `det ∘ ρ` of a representation. -/
def ofRep (ρ : Γ → GL (Fin n) A) : Determinant Γ A n := sorry

/-- IHG.0/determinant (stand-in): extension of scalars `D ⊗_A B` along a ring homomorphism. -/
def map {B : Type*} [CommRing B] (f : A →+* B) (D : Determinant Γ A n) : Determinant Γ B n := sorry

/-- IHG.0/determinant (stand-in): restriction of a determinant along a group homomorphism. -/
def comap {Γ' : Type*} [Group Γ'] (f : Γ' →* Γ) (D : Determinant Γ A n) : Determinant Γ' A n :=
  sorry

/-- IHG.0/determinant (stand-in): the characteristic polynomial `χ_D(γ, X)` of an element of `Γ`,
monic of degree `n`. -/
def charpoly (D : Determinant Γ A n) (γ : Γ) : Polynomial A := sorry

/-- IHG.0/determinant (stand-in): the product `D_1 ⋯ D_s` of determinants of dimensions
`n_1, …, n_s`, of dimension `n = n_1 + ⋯ + n_s`. -/
def prod {s : ℕ} {dims : Fin s → ℕ} (_h : ∑ j, dims j = n)
    (Ds : (j : Fin s) → Determinant Γ A (dims j)) : Determinant Γ A n := sorry

end Determinant

/-- IntegralHeckeAndGaloisDeterminants IHG.0/continuous-determinant (stand-in): the continuous
determinants of a topological group over a topological ring. -/
def continuousDeterminant (Γ : Type*) [Group Γ] [TopologicalSpace Γ] (A : Type*) [CommRing A]
    [TopologicalSpace A] (n : ℕ) : Imported (Determinant Γ A n) := sorry

section DetDef

variable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {Γ : Type} [Group Γ] [TopologicalSpace Γ] {n : ℕ}

/-- GlobalGaloisDeformations R04.1/determinant-deformation-functor (stand-in): the ring `Q_t̄`
classifying the continuous determinants of the profinite group `Γ` (satisfying condition (F)) that
lift the residual determinant `t̄`, a complete Noetherian local `𝒪[E]`-algebra with residue field
`𝓀[E]` (Chenevier, Propositions 3.3 and 3.7). -/
def detDefRing (t : Determinant Γ 𝓀[E] n) : Type := sorry

instance (t : Determinant Γ 𝓀[E] n) : CommRing (detDefRing E t) := sorry

instance (t : Determinant Γ 𝓀[E] n) : Algebra 𝒪[E] (detDefRing E t) := sorry

/-- R04.1/determinant-deformation-functor (stand-in): the universal determinant over `Q_t̄`. -/
def detDefRing.univ (t : Determinant Γ 𝓀[E] n) : Determinant Γ (detDefRing E t) n := sorry

end DetDef

section GlobalD

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- LocalGaloisDeformationRings R08.1 (stand-in): the local deformation problems (conjugation
invariant quotients of the lifting ring, over the local coefficient ring) for `n`-dimensional
residual representations of `G_K` with coefficients in `𝒪[E]`, named by their kind. -/
def LocalCondition (K : Type) [Field K] (E : Type) [Field E] (n : ℕ) : Type := sorry

namespace LocalCondition

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- LocalGaloisDeformationRings R08.1 (stand-in): the unrestricted problem `R^□_v`. -/
def unrestricted : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings L7/ordinary-flag-scheme (stand-in): the ordinary problem `R^△_v`
at a place above `l` with trivial residual representation, a quotient of `R^□_v ⊗̂ Λ_v` with
`Λ_v = 𝒪⟦I^{ab}_{K}(l)^n⟧`. A global problem carrying it has for `Λ` the ordinary coefficient ring
of L8. -/
def ordinary : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings R08.2/steinberg-condition (stand-in): the Steinberg problem
`R^{St}_v` at a place with `q_v ≡ 1 mod l` and trivial residual representation. -/
def steinberg : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings R08.2/ihara-avoidance-components (stand-in): the `χ_v`-ramified
problem `R^{χ_v}_v` of Taylor at a place with `q_v ≡ 1 mod l` and trivial residual representation,
for characters `χ_{v,1}, …, χ_{v,n}` of `k(v)^×` trivial modulo the maximal ideal; for `χ_v = 1`
it is the unipotently ramified problem `R^1_v`. -/
def ramified (χ : Fin n → (𝓀[K])ˣ →* (𝒪[E])ˣ) : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings R08.2 (stand-in): the level-raising problem `R(ṽ, Θ_ṽ, n)` of
Newton–Thorne 2021 §1.17, for the integer `n_ṽ` and a character `Θ_ṽ` of order `l` of the units
of the unramified extension of `K` of degree `n_ṽ`, given through the Artin map as a character of
the inertia group of `K`. -/
def levelRaising (nv : ℕ) (Θ : inertia K →* (𝒪[E])ˣ) : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings R08.1 (stand-in): the liftings to `A` that satisfy a local
deformation problem, that is whose classifying homomorphism from the lifting ring factors through
the ring representing the problem. -/
def lifts (D : LocalCondition K E n) (A : Type) [CommRing A] :
    Imported (Gal K →* GL (Fin n) A) := sorry

/-- LocalGaloisDeformationRings R08.2/ihara-avoidance-components (stand-in): the local problems
over `𝒪[E]` for which `E` is large enough, in the sense of Thorne 2015, Propositions 3.15 and
3.17: the irreducible components of the representing ring and of its special fibre are
geometrically irreducible. -/
def geometricComponents : Imported (LocalCondition K E n) := sorry

end LocalCondition

namespace DefProblem

/-- GlobalGaloisDeformations G7/polarized-deformation-problem (stand-in): the local deformation
problem `𝒟_v` of `𝒮` at a place `ṽ` of `S̃`. -/
def localCondition (S : DefProblem F E n Λ) (v : Place F) : LocalCondition v.Fv E n := sorry

/-- GlobalGaloisDeformations G7/polarized-deformation-problem (stand-in): the multiplier
character `χ` of `𝒮`, a character of `G_{F⁺}` lifting `ν ∘ r̄`. -/
def multiplier [NumberField.IsCMField F] (S : DefProblem F E n Λ) :
    Gal (maximalRealSubfield F) →* (𝒪[E])ˣ := sorry

/-- GlobalGaloisDeformations G7/polarized-representability (stand-in): the augmentation
`R^univ_𝒮 → k` classifying `r̄`; its kernel is the maximal ideal. -/
def residue (S : DefProblem F E n Λ) : S.univRing →+* 𝓀[E] := sorry

/-- GlobalGaloisDeformations G7/polarized-presentation (stand-in): the ring
`R^{loc}_{𝒮,T}`, `T = S`, the completed tensor product over `v ∈ S` of the rings representing the
local problems `𝒟_v`, a `Λ`-algebra. -/
def localRing (S : DefProblem F E n Λ) : Type := sorry

instance (S : DefProblem F E n Λ) : CommRing S.localRing := sorry

instance (S : DefProblem F E n Λ) : Algebra Λ S.localRing := sorry

/-- GlobalGaloisDeformations G7/polarized-presentation (stand-in): the `Λ`-algebra homomorphism
`R^{loc}_{𝒮,T} → A` classifying the restrictions to the places of `S̃` of a lifting of type `𝒮`
over `A`. -/
def localRing.pointOf [NumberField.IsCMField F] (S : DefProblem F E n Λ) {A : Type} [CommRing A]
    [Algebra Λ A] (r : Gal (maximalRealSubfield F) →* CHT n A) : S.localRing →ₐ[Λ] A := sorry

end DefProblem

/-- LocalGaloisDeformationRings L8/ordinary-coefficient-ring (stand-in): the group
`I^{ab}_K(l)`, the maximal pro-`l` quotient of the abelianised inertia group of `K`. -/
def inertiaAbL (K : Type) [Field K] (l : ℕ) : Type := sorry

instance (K : Type) [Field K] (l : ℕ) : CommGroup (inertiaAbL K l) := sorry

/-- LocalGaloisDeformationRings L8/ordinary-coefficient-ring (stand-in): the problems `𝒮` whose
coefficient ring `Λ` is the ordinary one, `Λ = ⊗̂_{v ∈ S_l} 𝒪⟦I^{ab}_{F_ṽ}(l)^n⟧` (through a fixed
identification), `S_l` the places of `𝒮` above `l`. -/
def ordinaryCoefficients (F : Type) [Field F] [NumberField F] (E : Type) [Field E]
    [ValuativeRel E] (n : ℕ) (Λ : Type) [CommRing Λ] [Algebra 𝒪[E] Λ] (l : ℕ) :
    Imported (DefProblem F E n Λ) := sorry

/-- LocalGaloisDeformationRings L8/ordinary-coefficient-ring (stand-in): the universal characters
`ψ^v_1, …, ψ^v_n : I^{ab}_{F_ṽ}(l) → Λ^×` of the ordinary coefficient ring of `𝒮` at a place
`ṽ ∈ S̃` above `l`. -/
def DefProblem.univChar (S : DefProblem F E n Λ) (l : ℕ) (v : Place F) (i : Fin n) :
    inertiaAbL v.Fv l →* Λˣ := sorry

end GlobalD

/-- AdelicAlgebraicGroups AA.1 (stand-in): the open compact subgroup `U = ∏_v U_v` of
`G(𝔸^∞_{L⁺})` of Allen–Newton–Thorne §4.2 for the decomposition `T = S_l ⊔ S(B) ⊔ R ⊔ S_a`:
`U_v = G(𝒪_{L⁺_v})` at the split places outside `T` and at the places above `l`, a hyperspecial
maximal compact subgroup at the inert places, the maximal compact subgroup at `S(B)`, an Iwahori
subgroup at `R` and the principal congruence subgroup at `S_a`. -/
def standardLevel (D : DefiniteUnitary.CMData) (l : ℕ)
    (T R Sa : Set (Place D.L)) :
    Subgroup (DefiniteUnitary.unitaryGroup D D.finiteAdeles) := sorry

end ImportedPL6

/-! #### Imported interfaces used by PL.7 -/

section ImportedPL7

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group (stand-in): the element
`ȷ ∈ 𝒢_n(A)`. -/
def CHT.j (n : ℕ) (A : Type*) [CommRing A] : CHT n A := sorry

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- GlobalGaloisDeformations G7/polarized-presentation (stand-in): the conjugation invariant
quotients `R̄_v` of the `µ`-polarised framed deformation ring of a residual representation
`G_K → 𝒢_n(k)`, `K = F⁺_v` a completion of the totally real field (the lifting ring of
`r̄|G_{F_ṽ}` when `v` splits), `µ = ε^{1-n} δ^n_{F/F⁺}` (Bellovin–Gee §3). -/
def PolarizedLocalQuotient {n : ℕ} (rbar : Gal K →* CHT n 𝓀[E]) : Type := sorry

variable {K E}

/-- G7/polarized-presentation (stand-in): the ring `R̄_v`. -/
def PolarizedLocalQuotient.ring {n : ℕ} {rbar : Gal K →* CHT n 𝓀[E]}
    (R : PolarizedLocalQuotient K E rbar) : Type := sorry

instance {n : ℕ} {rbar : Gal K →* CHT n 𝓀[E]} (R : PolarizedLocalQuotient K E rbar) :
    CommRing R.ring := sorry

variable (K E)

/-- LocalGaloisDeformationRings R08.3/pst-deformation-ring (stand-in): the quotients `R̄_v` that
are cut out by a non-empty union of irreducible components of the generic fibre of the ring of a
fixed inertial type and, when `K` has the residue characteristic of `E`, a fixed regular Hodge
type. -/
def fixedTypeComponents {n : ℕ} (rbar : Gal K →* CHT n 𝓀[E]) :
    Imported (PolarizedLocalQuotient K E rbar) := sorry

/-- GlobalGaloisDeformations G7/polarized-representability (stand-in): the ring `R^univ`
representing the functor of `µ`-polarised deformations of `r̄ : G_{F⁺,S₀} → 𝒢_n(k)`,
`µ = ε^{1-n} δ^n_{F/F⁺}`, that are unramified outside the finite set `S₀` of places of `F⁺` and
whose restriction at each `v ∈ S₀` factors through the chosen quotient `R̄_v`. The functor is
representable when `H⁰(G_{F⁺,S₀}, ad r̄) = 0`. The places of `S₀` need not split in `F`. -/
def polarizedGlobalRing {F : Type} [Field F] [NumberField F] {n : ℕ}
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E])
    (S₀ : Set (Place (maximalRealSubfield F)))
    (Rbar : (u : Place (maximalRealSubfield F)) →
      PolarizedLocalQuotient u.Fv E (resFieldHom rbar u.emb)) : Type := sorry

instance {F : Type} [Field F] [NumberField F] {n : ℕ}
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E])
    (S₀ : Set (Place (maximalRealSubfield F)))
    (Rbar : (u : Place (maximalRealSubfield F)) →
      PolarizedLocalQuotient u.Fv E (resFieldHom rbar u.emb)) :
    CommRing (polarizedGlobalRing E rbar S₀ Rbar) := sorry

end ImportedPL7

end TauCeti.Automorphy
namespace TauCeti.Automorphy

/-! #### Shared definitions of PL.6 and PL.7 -/

section RepHelpers

/-- The representation on `A^n` of a `GL_n(A)`-valued homomorphism. -/
def stdRep {G : Type*} [Monoid G] {A : Type*} [CommRing A] {n : ℕ} (ρ : G →* GL (Fin n) A) :
    Representation A G (Fin n → A) :=
  (Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp ρ)

variable {G : Type*} [Monoid G] {k : Type*} [Field k]
variable {V : Type*} [AddCommGroup V] [Module k V] {W : Type*} [AddCommGroup W] [Module k W]

/-- The representation on `V/W` for a subrepresentation `W ⊂ V`. -/
def quotRep {ρ : Representation k G V} (W : Subrepresentation ρ) :
    Representation k G (V ⧸ W.toSubmodule) :=
  ρ.quotient W.toSubmodule fun g _ hx => W.apply_mem_toSubmodule g hx

/-- The representation on the subquotient `W₁/(W₁ ∩ W₂)` (that is `W₁/W₂` when `W₂ ⊂ W₁`). -/
def subquotRep {ρ : Representation k G V} (W₁ W₂ : Subrepresentation ρ) :
    Representation k G (W₁.toSubmodule ⧸ W₂.toSubmodule.comap W₁.toSubmodule.subtype) :=
  W₁.toRepresentation.quotient _ fun g _ hx => W₂.apply_mem_toSubmodule g hx

/-- Extension of scalars of a representation to a field `K ⊃ k`. -/
def repBaseChange (K : Type*) [Field K] [Algebra k K] (ρ : Representation k G V) :
    Representation K G (TensorProduct k K V) where
  toFun g := (ρ g).baseChange K
  map_one' := by sorry
  map_mul' := by sorry

/-- A representation is absolutely irreducible: irreducible after extension of scalars to an
algebraic closure. -/
def IsAbsIrredRep (ρ : Representation k G V) : Prop :=
  (repBaseChange (AlgebraicClosure k) ρ).IsIrreducible

/-- `ρ` is the semisimplification of `τ`: `ρ` is semisimple and there are finite filtrations of
`ρ` and of `τ` by subrepresentations with isomorphic successive quotients, so that `ρ` and `τ`
have the same Jordan–Hölder constituents with multiplicities. -/
def IsSemisimplificationOf (ρ : Representation k G V) (τ : Representation k G W) : Prop :=
  ComplementedLattice (Subrepresentation ρ) ∧
  ∃ (m : ℕ) (A : Fin (m + 1) → Subrepresentation ρ) (B : Fin (m + 1) → Subrepresentation τ),
    Monotone A ∧ Monotone B ∧ A 0 = ⊥ ∧ A (Fin.last m) = ⊤ ∧ B 0 = ⊥ ∧ B (Fin.last m) = ⊤ ∧
    ∀ i : Fin m, Nonempty
      ((subquotRep (A i.succ) (A i.castSucc)).Equiv (subquotRep (B i.succ) (B i.castSucc)))

/-- `σ^c ≅ τ^∨ ⊗ μ` for representations `σ`, `τ` of `Δ`, where `Δ → Γ` is a homomorphism, `c ∈ Γ`
and `σ^c(δ) = σ(c δ c⁻¹)`: a linear isomorphism `φ` from the space of `σ` to the dual of the space
of `τ` with `φ ∘ σ(δ') = μ(δ) τ^∨(δ) ∘ φ` whenever `δ'` maps to `c δ c⁻¹`. -/
def IsConjTwistedDual {Γ Δ : Type*} [Group Γ] [Group Δ] (f : Δ →* Γ) (c : Γ)
    (σ : Representation k Δ V) (τ : Representation k Δ W) (μ : Δ →* kˣ) : Prop :=
  ∃ φ : V ≃ₗ[k] Module.Dual k W, ∀ δ δ' : Δ, f δ' = c * f δ * c⁻¹ →
    ∀ x, φ (σ δ' x) = (μ δ : k) • τ.dual δ (φ x)

/-- The diagonal representation `χ_1 ⊕ ⋯ ⊕ χ_n` of characters. -/
def diagChar {G : Type*} [Monoid G] {A : Type*} [CommRing A] {n : ℕ} (χ : Fin n → G →* Aˣ) :
    G →* GL (Fin n) A where
  toFun g := ⟨Matrix.diagonal fun i => ((χ i g : Aˣ) : A),
    Matrix.diagonal fun i => (((χ i g)⁻¹ : Aˣ) : A), by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- The block diagonal sum `ρ_1 ⊕ ⋯ ⊕ ρ_d` of `GL_{m_i}(A)`-valued maps, in the coordinates given
by a bijection `e` between the disjoint union of the index sets of the blocks and `{1, …, n}`. -/
def blockSum {G : Type*} {A : Type*} [CommRing A] {n d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → G → GL (Fin (m i)) A) (g : G) :
    GL (Fin n) A :=
  ⟨Matrix.reindex e e (Matrix.blockDiagonal' fun i => ((ρs i g : GL (Fin (m i)) A) :
      Matrix (Fin (m i)) (Fin (m i)) A)),
    Matrix.reindex e e (Matrix.blockDiagonal' fun i => (((ρs i g)⁻¹ : GL (Fin (m i)) A) :
      Matrix (Fin (m i)) (Fin (m i)) A)), by sorry, by sorry⟩

/-- The diagonal matrix with unit entries `a_1, …, a_n`. -/
def diagGL {A : Type*} [CommRing A] {n : ℕ} (a : Fin n → Aˣ) : GL (Fin n) A :=
  ⟨Matrix.diagonal fun j => ((a j : Aˣ) : A), Matrix.diagonal fun j => (((a j)⁻¹ : Aˣ) : A),
    by sorry, by sorry⟩

/-- The block scalar matrix `⊕ a_i · 1_{m_i}` in the coordinates `e`. -/
def blockScalar {A : Type*} [CommRing A] {n d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (a : Fin d → Aˣ) : GL (Fin n) A :=
  diagGL fun j => a (e.symm j).1

/-- The block sign matrix `⊕ ε_i · 1_{m_i} ∈ GL_n(A)` of `ε ∈ µ₂^d`. -/
def blockSign (A : Type*) [CommRing A] {n d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ε : Fin d → ℤˣ) : GL (Fin n) A :=
  blockScalar e fun i => Units.map (Int.castRingHom A : ℤ →* A) (ε i)

/-- A matrix of `GL_n(A)` is scalar. -/
def IsScalarGL {A : Type*} [CommRing A] {n : ℕ} (g : GL (Fin n) A) : Prop :=
  ∃ a : A, (g : Matrix (Fin n) (Fin n) A) = Matrix.scalar (Fin n) a

/-- Extension of scalars of a `GL_n(A)`-valued map to the fraction field of the domain `A` is
absolutely irreducible. -/
def IsAbsIrredOverFrac {G : Type*} {A : Type*} [CommRing A] [IsDomain A] {n : ℕ}
    (ρ : G → GL (Fin n) A) : Prop :=
  IsAbsIrred fun g => Matrix.GeneralLinearGroup.map (algebraMap A (FractionRing A)) (ρ g)

/-- The characteristic polynomial of `g` has `n` roots in an algebraic closure of the fraction
field of the domain `A` which satisfy no non-trivial `ℤ`-linear relation (so `g` is regular
semisimple). -/
def HasIndependentEigenvalues {A : Type*} [CommRing A] [IsDomain A] {n : ℕ}
    (g : Matrix (Fin n) (Fin n) A) : Prop :=
  ∃ α : Fin n → (AlgebraicClosure (FractionRing A))ˣ,
    g.charpoly.map (algebraMap A (AlgebraicClosure (FractionRing A))) =
      ∏ i, (Polynomial.X - Polynomial.C ((α i : (AlgebraicClosure (FractionRing A))ˣ) :
        AlgebraicClosure (FractionRing A))) ∧
    ∀ a : Fin n → ℤ, ∏ i, α i ^ a i = 1 → a = 0

/-- The group `G` has no quotient of order `l`. -/
def HasNoQuotientOfOrder (G : Type*) [Group G] (l : ℕ) : Prop :=
  ∀ N : Subgroup G, N.Normal → N.index ≠ l

/-- The group `G` has no non-trivial quotient of `l`-power order. -/
def HasNoLPowerQuotient (G : Type*) [Group G] (l : ℕ) : Prop :=
  ∀ N : Subgroup G, N.Normal → (∃ a : ℕ, N.index = l ^ a) → N = ⊤

end RepHelpers

section CHTHelpers

variable {Γ : Type*} [Group Γ] {A : Type*} [CommRing A] {n : ℕ}

open Classical in
/-- The `GL_n(A)`-valued homomorphism `r ∘ f` for `f : Δ → Γ` and `r : Γ → 𝒢_n(A)` with
`r(f(Δ)) ⊂ 𝒢_n⁰(A)` (the trivial homomorphism if `r ∘ f` does not take values in `𝒢_n⁰(A)`). -/
def CHT.glOf {Δ : Type*} [Group Δ] (r : Γ →* CHT n A) (f : Δ →* Γ) : Δ →* GL (Fin n) A :=
  if h : ∀ δ, r (f δ) ∈ CHT.conn n A then
    (CHT.gl n A).comp ((r.comp f).codRestrict (CHT.conn n A) h)
  else 1

/-- Two `𝒢_n(A)`-valued maps are conjugate by an element of `GL_n(A)`. -/
def CHT.ConjGL (r r' : Γ → CHT n A) : Prop :=
  ∃ g : GL (Fin n) A, ∀ γ, r' γ = CHT.ofGL n A g * r γ * (CHT.ofGL n A g)⁻¹

/-- Strict equivalence of `𝒢_n(A)`-valued maps: conjugacy by an element of `1 + M_n(rad A)`,
`rad A` the Jacobson radical (the maximal ideal when `A` is local). -/
def CHT.StrictEquiv (r r' : Γ → CHT n A) : Prop :=
  ∃ g : GL (Fin n) A,
    (∀ i j, ((g : Matrix (Fin n) (Fin n) A) - 1) i j ∈ Ideal.jacobson (⊥ : Ideal A)) ∧
    ∀ γ, r' γ = CHT.ofGL n A g * r γ * (CHT.ofGL n A g)⁻¹

/-- The conjugate `g r g⁻¹` of a `𝒢_n(A)`-valued homomorphism by `g ∈ GL_n(A)`. -/
def CHT.conjGL (g : GL (Fin n) A) (r : Γ →* CHT n A) : Γ →* CHT n A :=
  (MulAut.conj (CHT.ofGL n A g)).toMonoidHom.comp r

end CHTHelpers

section GaloisHelpers

variable {F : Type} [Field F]

/-- The restriction map `G_F → G_{F⁺}`. -/
def resCM (F : Type*) [Field F] : Gal F →* Gal (maximalRealSubfield F) :=
  (Field.absoluteGaloisGroup.map (algebraMap (maximalRealSubfield F) F)).toMonoidHom

/-- The restriction `r|G_F` of a `𝒢_n(A)`-valued homomorphism of `G_{F⁺}` with
`r(G_F) ⊂ 𝒢_n⁰(A)`, as a `GL_n(A)`-valued homomorphism. -/
def CHT.glRes {A : Type*} [CommRing A] {n : ℕ} (r : Gal (maximalRealSubfield F) →* CHT n A) :
    Gal F →* GL (Fin n) A :=
  CHT.glOf r (resCM F)

/-- `ρ^c ≅ ρ^∨ ⊗ μ` for a representation `ρ` of `G_F`, `F` a CM field: conjugate self-duality
with multiplier `μ` (for every `c ∈ G_{F⁺}` outside `G_F`; the condition does not depend on
`c`). -/
def IsConjSelfDual {k : Type*} [Field k] {m : ℕ} (ρ : Gal F →* GL (Fin m) k)
    (μ : Gal F →* kˣ) : Prop :=
  ∀ c : Gal (maximalRealSubfield F), c ∉ (resCM F).range →
    IsConjTwistedDual (resCM F) c (stdRep ρ) (stdRep ρ) μ

variable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- Mathlib's cyclotomic character modulo `l`, valued in `𝓀[E]^×` (stand-in for the reduction of
`cyclo E F` modulo the maximal ideal of `𝒪[E]`). -/
def cycloBar (F : Type*) [Field F] : Gal F →* (𝓀[E])ˣ := sorry

namespace Place

/-- Two places of `F` are equal as places: they define the same valuation ring of `F`. -/
def Same (v w : Place F) : Prop := ∀ x : F, v.emb x ≤ᵥ 1 ↔ w.emb x ≤ᵥ 1

/-- The place `w` of an extension `M` of `F` lies above the place `v` of `F`. -/
def LiesOver {M : Type} [Field M] (w : Place M) (i : F →+* M) (v : Place F) : Prop :=
  ∀ x : F, w.emb (i x) ≤ᵥ 1 ↔ v.emb x ≤ᵥ 1

/-- The complex conjugate `ṽ^c` of a place of a CM field. -/
def conj [NumberField F] [IsCMField F] (v : Place F) : Place F where
  Fv := v.Fv
  emb := v.emb.comp (IsCMField.complexConj F).toAlgHom.toRingHom
  dense := by sorry

/-- `w` does not lie above the set of places of `F⁺` given through the chosen places `S̃ ⊂ S`:
it is neither a place of `S` nor the complex conjugate of one. -/
def Outside [NumberField F] [IsCMField F] (w : Place F) (S : Set (Place F)) : Prop :=
  ∀ v ∈ S, ¬ w.Same v ∧ ¬ w.Same v.conj

/-- The place of `F⁺` below `ṽ` splits in `F`: `F⁺` is dense in `F_ṽ`. -/
def IsSplit (v : Place F) : Prop :=
  DenseRange (v.emb.comp (maximalRealSubfield F).subtype)

/-- The degree `[F_v : ℚ_p]` of the completion over the closure of its prime field. -/
def localDegree (v : Place F) : ℕ :=
  Module.finrank (Subfield.topologicalClosure (⊥ : Subfield v.Fv)) v.Fv

/-- A geometric Frobenius element at `v`, as an element of `G_F`. -/
def frob (v : Place F) : Gal F := v.dec (geomFrob v.Fv)

end Place

/-- The space `Hom_cont(Δ/(c + 1), E)`, `Δ` the Galois group of the maximal abelian pro-`l`
extension of the CM field `F` unramified outside `l`: the continuous additive characters of `G_F`
with values in `E` that are unramified outside `l` and anti-invariant under complex conjugation. -/
def antiInvariantChars (F : Type) [Field F] (E : Type) [Field E] [TopologicalSpace E] (l : ℕ) :
    Set (Gal F → E) :=
  {χ | Continuous χ ∧ (∀ σ τ, χ (σ * τ) = χ σ + χ τ) ∧
    (∀ w : Place F, ¬ w.Above l → ∀ σ ∈ inertia w.Fv, χ (w.dec σ) = 0) ∧
    ∀ (c : Gal (maximalRealSubfield F)) (σ τ : Gal F), c ∉ (resCM F).range →
      resCM F τ = c * resCM F σ * c⁻¹ → χ τ = -χ σ}

/-- The `ℤ_l`-rank of the subgroup of `Δ/(c + 1)` generated by the Frobenius elements at a set `T`
of places of `F` not above `l` (`d₀` for `T = S(B)`, `d_R` for `T = R`): the dimension of the
span of the vectors `(χ(Frob_v))_{v ∈ T}`, `χ ∈ Hom_cont(Δ/(c + 1), E)`. -/
def frobRank (F : Type) [Field F] (E : Type) [Field E] [TopologicalSpace E] (l : ℕ)
    (T : Set (Place F)) : ℕ :=
  Module.finrank E (Submodule.span E
    {x : T → E | ∃ χ ∈ antiInvariantChars F E l, ∀ v : T, x v = χ v.1.frob})

end GaloisHelpers

section DefProblemHelpers

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- `A` is a complete Noetherian local `O`-algebra whose residue field is a quotient of `O`: for
`O = 𝒪[E]` an object of `C_𝒪`, and for `O = Λ ∈ C_𝒪` an object of `C_Λ`. -/
def IsCNL (O A : Type*) [CommRing O] [CommRing A] [Algebra O A] : Prop :=
  ∃ _ : IsLocalRing A, IsNoetherianRing A ∧ IsAdicComplete (IsLocalRing.maximalIdeal A) A ∧
    Function.Surjective (algebraMap O (IsLocalRing.ResidueField A))

namespace DefProblem

/-- A universal lifting of type `𝒮`, over `R^univ_𝒮` (a representative of the universal
deformation). -/
def univLift (S : DefProblem F E n Λ) : Gal (maximalRealSubfield F) →* CHT n S.univRing :=
  S.liftOf (AlgHom.id Λ S.univRing)

/-- `r_𝔭 = r^univ mod 𝔭`, over `R^univ_𝒮/𝔭`. -/
def liftMod (S : DefProblem F E n Λ) (𝔭 : Ideal S.univRing) :
    Gal (maximalRealSubfield F) →* CHT n (S.univRing ⧸ 𝔭) :=
  S.liftOf (Ideal.Quotient.mkₐ Λ 𝔭)

/-- The lifting of type `𝒮` classified by a ring homomorphism `g : R^univ_𝒮 → A`, where `A` is a
`Λ`-algebra through `g`. -/
def liftAt (S : DefProblem F E n Λ) {A : Type} [CommRing A] (g : S.univRing →+* A) :
    Gal (maximalRealSubfield F) →* CHT n A :=
  letI : Algebra Λ A := (g.comp (algebraMap Λ S.univRing)).toAlgebra
  S.liftOf (⟨g, fun _ => rfl⟩ : S.univRing →ₐ[Λ] A)

/-- The universal characters `ψ^v_i` pushed forward to a `Λ`-algebra `A`. -/
def charOn (S : DefProblem F E n Λ) (l : ℕ) (A : Type*) [CommRing A] [Algebra Λ A] (v : Place F)
    (i : Fin n) : inertiaAbL v.Fv l →* Aˣ :=
  (Units.map (algebraMap Λ A : Λ →* A)).comp (S.univChar l v i)

/-- The places of `𝒮` above `l`. -/
def placesAbove (S : DefProblem F E n Λ) (l : ℕ) : Set (Place F) := {v ∈ S.places | v.Above l}

/-- `d_l = inf_{v ∈ S_l} [F⁺_v : ℚ_l]`, the least local degree at the places of `𝒮` above `l`
(computed at the chosen places `ṽ`, where `F_ṽ = F⁺_v`). -/
def dl (S : DefProblem F E n Λ) (l : ℕ) : ℕ := sInf (Place.localDegree '' S.placesAbove l)

/-- The multiplier of `𝒮` is `ε^{1-n} δ^n_{F/F⁺}`. -/
def HasStandardMultiplier (S : DefProblem F E n Λ) : Prop :=
  ∀ σ, Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (S.multiplier σ) =
    cyclo E (maximalRealSubfield F) σ ^ (1 - (n : ℤ)) * delta F E σ ^ n

end DefProblem

open Classical in
/-- The residual multiplier is `ε̄^{1-n} δ̄^n_{F/F⁺}`: `ν ∘ r̄ = ε̄^{1-n}` on `G_F` and
`(-1)^n ε̄^{1-n}` outside. -/
def HasStandardResidualMultiplier (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) : Prop :=
  ∀ σ, CHT.nu n 𝓀[E] (rbar σ) =
    cycloBar E (maximalRealSubfield F) σ ^ (1 - (n : ℤ)) *
      (if σ ∈ (resCM F).range then 1 else (-1) ^ n)

end DefProblemHelpers

end TauCeti.Automorphy

namespace TauCeti.Automorphy

open TauCeti.DefiniteUnitary

/-! ## PL.3, continued: Taylor–Wiles primes and the R = T theorems -/

/-! #### Imported interfaces used by the theorems of PL.3 -/

section PL3Interfaces

/-- ArithmeticGaloisRepresentations G7/adequate-subgroup (stand-in): the subgroups of `𝒢_n(k)`
that are adequate in the `𝒢_n`-form of Thorne 2012, Definition 2.3. -/
def adequateCHT (k : Type*) [Field k] (n : ℕ) : Imported (Subgroup (CHT n k)) := sorry

namespace LocalCondition

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- LocalGaloisDeformationRings R08.1/local-lifting-ring (stand-in): the problem `R̄^□_v`, the
maximal reduced `l`-torsion-free quotient of the lifting ring. -/
def reducedUnrestricted : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings R08.3/pst-deformation-ring (stand-in): the crystalline lifting ring
of labelled Hodge–Tate weights `H`; `R^{λ,cr}_v` for `H_τ = {λ_{τ,j} + n - j}`. -/
def crystallineOfType (H : (K →+* E) → Multiset ℤ) : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings R08.2/ihara-avoidance-components (stand-in): the problem `R^a_v`
of the lifts on which every element of inertia has characteristic polynomial `(X - 1)^n`. -/
def unipotentInertia : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings R08.1 (stand-in): the problem `R^{ur}_v` of unramified lifts. -/
def unramified : LocalCondition K E n := sorry

/-- LocalGaloisDeformationRings R08.1 (stand-in): for a local problem `D` and a lift `ρ` of type
`D` lying on exactly one irreducible component of the generic fibre of the ring of `D`, the
problem cut out by that component (the maximal reduced `l`-torsion-free quotient supported on
it). -/
def componentThrough (D : LocalCondition K E n) (ρ : Gal K →ₜ* GL (Fin n) 𝒪[E]) :
    LocalCondition K E n := sorry

end LocalCondition

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

namespace DefProblem

/-- GlobalGaloisDeformations G7/polarized-presentation (stand-in): the ring `R^{loc}_{𝒮,T}`, the
completed tensor product over `v ∈ T ⊂ S` of the rings representing the local problems. -/
def locRingAt (S : DefProblem F E n Λ) (T : Set (Place F)) : Type := sorry

instance (S : DefProblem F E n Λ) (T : Set (Place F)) : CommRing (S.locRingAt T) := sorry

/-- GlobalGaloisDeformations G7/polarized-representability (stand-in): the `T`-framed universal
ring `R^T_𝒮`. -/
def framedRingAt (S : DefProblem F E n Λ) (T : Set (Place F)) : Type := sorry

instance (S : DefProblem F E n Λ) (T : Set (Place F)) : CommRing (S.framedRingAt T) := sorry

/-- GlobalGaloisDeformations G7/polarized-presentation (stand-in): the homomorphism
`R^{loc}_{𝒮,T} → R^T_{𝒮'}` for a problem `𝒮'` with the residual representation, the multiplier and
the local problems at `T` of `𝒮` (for instance `𝒮' = 𝒮_Q`). -/
def locToFramed (S S' : DefProblem F E n Λ) (T : Set (Place F)) :
    S.locRingAt T →+* S'.framedRingAt T := sorry

/-- GlobalGaloisDeformations G7/polarized-tangent-obstruction (stand-in): the dimension over `k`
of the dual Selmer group `H¹_{L^⊥,T}(G_{F⁺,S}, ad r̄(1))` of the problem relative to `T` (for
`p = 2` in the form of Thorne 2017 §2.3, with the conditions `µ_v^⊥` at `T`). -/
def dualSelmerDim (S : DefProblem F E n Λ) (T : Set (Place F)) : ℕ := sorry

/-- GlobalGaloisDeformations G7/polarized-tangent-obstruction (stand-in): the integer
`dim_k L_v - dim_k H⁰(G_{F_ṽ}, ad r̄)` for the tangent space `L_v` of the local problem at `ṽ`. -/
def localDefect (S : DefProblem F E n Λ) (v : Place F) : ℤ := sorry

end DefProblem

end PL3Interfaces

section PL3Helpers

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- The number of real places `v` of `F⁺` with `χ(c_v) = 1`, `χ` the multiplier of `𝒮`. The
complex conjugations of `G_{F⁺}` are its elements of order 2, and their conjugacy classes
correspond to the real places (Artin–Schreier). -/
def DefProblem.evenConjCount (S : DefProblem F E n Λ) : ℕ :=
  Nat.card {C : ConjClasses (Gal (maximalRealSubfield F)) //
    ∃ c, ConjClasses.mk c = C ∧ orderOf c = 2 ∧ S.multiplier c = 1}

/-- The number of generators in Thorne 2012, Proposition 4.4, for a Taylor–Wiles set with `q`
elements: `q - Σ_{v ∈ T, v | l} [F⁺_v : ℚ_l] n(n-1)/2 - n Σ_{v | ∞} (1 + χ(c_v))/2`. -/
def twGeneratorCount (S : DefProblem F E n Λ) (l : ℕ) (T : Set (Place F)) (q : ℕ) : ℤ :=
  (q : ℤ) -
    (∑ᶠ (v : Place F) (_ : v ∈ T ∧ v.Above l), (v.localDegree : ℤ) * ((n * (n - 1) / 2 : ℕ) : ℤ)) -
    (n : ℤ) * (S.evenConjCount : ℤ)

/-- `R^T_{𝒮'}` is topologically generated over `R^{loc}_{𝒮,T}` by `g` elements: the structure map
extends to a surjection from the power series ring in `g` variables over `R^{loc}_{𝒮,T}`. -/
def IsGeneratedOverLoc (S S' : DefProblem F E n Λ) (T : Set (Place F)) (g : ℕ) : Prop :=
  ∃ f : MvPowerSeries (Fin g) (S.locRingAt T) →+* S'.framedRingAt T,
    Function.Surjective f ∧
    ∀ x, f (algebraMap (S.locRingAt T) (MvPowerSeries (Fin g) (S.locRingAt T)) x) =
      S.locToFramed S' T x

/-- `r̄(G_{F⁺(ζ_l)}) ⊂ 𝒢_n(k)` is adequate in the `𝒢_n`-form of Thorne 2012, Definition 2.3. -/
def HasAdequateCHTImage (l : ℕ) {k : Type*} [Field k]
    (rbar : Gal (maximalRealSubfield F) →* CHT n k) : Prop :=
  (adequateCHT k n).Holds
    (resFieldHom rbar (algebraMap (maximalRealSubfield F)
      (CyclotomicField l (maximalRealSubfield F)))).range

/-- `ζ_l ∉ F` and `ρ̄(G_{F(ζ_l)}) ⊂ GL_n(k)` is adequate in the sense of Thorne 2017,
Definition 2.20 (the hypotheses of Thorne 2017, Propositions 7.1 and 7.2). -/
def HasGHTAdequateImage (l : ℕ) {k : Type*} [Field k] (ρbar : Gal F →* GL (Fin n) k) : Prop :=
  (∀ ζ : F, ¬ IsPrimitiveRoot ζ l) ∧
    (ghtAdequate k n).Holds (resFieldHom ρbar (algebraMap F (CyclotomicField l F))).range

/-- `ρ` is the restriction to `G_{F_ṽ}` of the `GL_n`-component of `r|G_F`. -/
def IsLocalComponent {A : Type*} [CommRing A] [TopologicalSpace A]
    (r : Gal (maximalRealSubfield F) →* CHT n A) (v : Place F)
    (ρ : Gal v.Fv →ₜ* GL (Fin n) A) : Prop :=
  ∀ σ, ρ σ = CHT.glRes r (v.dec σ)

/-- The labelled Hodge–Tate weights `H_τ = {λ_{τ,j} + n - j}` at the place `v` of a weight `λ`. -/
def hodgeTypeOfWeight (lam : (F →+* E) → Fin n → ℤ) (v : Place F) :
    (v.Fv →+* E) → Multiset ℤ :=
  fun τ => Multiset.ofList (List.ofFn fun i : Fin n => lam (τ.comp v.emb) i + ((n : ℤ) - 1 - i))

/-- Two lifts of the same residual representation lie on a common irreducible component of the
generic fibre of the crystalline lifting ring of Hodge type `H`. -/
def OnSameCrystallineComponent {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (l : ℕ) (H : (K →+* E) → Multiset ℤ)
    (ρ₁ ρ₂ : Gal K →ₜ* GL (Fin n) 𝒪[E]) : Prop :=
  ∃ h : reduction ρ₂.toMonoidHom = reduction ρ₁.toMonoidHom,
    OnCommonComponent (crystallineIdeal (reduction ρ₁.toMonoidHom) H (RingHom.id K)) l
      (Lift.prime (ρbar := reduction ρ₁.toMonoidHom) ⟨ρ₁, rfl⟩)
      (Lift.prime (ρbar := reduction ρ₁.toMonoidHom) ⟨ρ₂, h⟩)

end PL3Helpers

/-! ### PL.3/adequate-taylor-wiles-primes: Taylor–Wiles primes for adequate residual image -/

section TWPrimes

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- The hypotheses of Thorne 2012, Proposition 4.4, other than adequacy: `l` is odd, `T ⊂ S`,
`ρ̄ = r̄|G_F` is absolutely irreducible, `k` contains the eigenvalues of every element of
`ρ̄(G_F)`, and `dim L_v - dim H⁰(G_{F_ṽ}, ad r̄)` is `[F⁺_v : ℚ_l] n(n-1)/2` for `v ∈ S - T` above
`l` and `0` for `v ∈ S - T` not above `l`. -/
structure TWPrimesSetup (l : ℕ) (S : DefProblem F E n 𝒪[E]) (T : Set (Place F)) : Prop where
  prime : l.Prime
  odd : Odd l
  subset : T ⊆ S.places
  absIrred : IsAbsIrred (S.residGL : Gal F → GL (Fin n) 𝓀[E])
  eigenvalues : ∀ σ, (S.residGL σ : Matrix (Fin n) (Fin n) 𝓀[E]).charpoly.Splits
  local_defect : ∀ v ∈ S.places, v ∉ T →
    (v.Above l → S.localDefect v = (v.localDegree : ℤ) * ((n * (n - 1) / 2 : ℕ) : ℤ)) ∧
    (¬ v.Above l → S.localDefect v = 0)

/-- The conclusion of Thorne 2012, Proposition 4.4: for `q₀ ≥ 0`,
`q = max(dim H¹_{L^⊥,T}(ad r̄(1)), q₀)` and every `N ≥ 1` there is a Taylor–Wiles datum with
`#Q = q` and `Nv ≡ 1 mod l^N` for `v ∈ Q` such that `R^T_{𝒮_Q}` is topologically generated over
`R^{loc}_{𝒮,T}` by `#Q - Σ_{v ∈ T, v | l} [F⁺_v : ℚ_l] n(n-1)/2 - n Σ_{v | ∞} (1 + χ(c_v))/2`
elements. -/
def TWPrimesConclusion (l : ℕ) (S : DefProblem F E n 𝒪[E]) (T : Set (Place F)) : Prop :=
  ∀ q₀ N : ℕ, 1 ≤ N →
    ∃ Q : TaylorWilesDatum S l, Q.Q.ncard = max (S.dualSelmerDim T) q₀ ∧ Q.level N ∧
      ∃ g : ℕ, (g : ℤ) = twGeneratorCount S l T Q.Q.ncard ∧
        IsGeneratedOverLoc S Q.augmented T g

/-- **PL.3/adequate-taylor-wiles-primes** (Thorne 2012, Proposition 4.4, for hypothesis (a);
Thorne 2017, Proposition 7.1, for hypothesis (b)). Under the hypotheses `TWPrimesSetup`, assume
(a) `r̄(G_{F⁺(ζ_l)})` adequate in the sense of Thorne 2012, Definition 2.3, or (b) `ζ_l ∉ F` and
`ρ̄(G_{F(ζ_l)})` adequate in the sense of Thorne 2017, Definition 2.20. Then the conclusion
`TWPrimesConclusion` holds. -/
theorem adequate_taylor_wiles_primes (l : ℕ) (S : DefProblem F E n 𝒪[E]) (T : Set (Place F))
    (h : TWPrimesSetup l S T)
    (had : HasAdequateCHTImage l S.resid ∨ HasGHTAdequateImage l S.residGL) :
    TWPrimesConclusion l S T := by
  sorry

/-! ### PL.3/taylor-wiles-primes-two-adic: Taylor–Wiles data when F contains ζ_p, including
p = 2 -/

/-- The hypotheses of Thorne 2017, Proposition 2.21, other than adequacy, for a global deformation
problem in the sense of Thorne 2017 §2.1: `p` is any prime, `F/F⁺` is unramified at every finite
place, every place above `p` is split and in `S`, `ρ̄` is absolutely irreducible, and
(i) `χ(c_v) = -1` for every `v | ∞` (the problem has no condition at the infinite places);
(ii) `F = F⁺(ζ_p)` if `p ≠ 2` and `F = F⁺(√-1)` if `p = 2`; (iii) if `p = 2` and `n` is even,
`r̄(c_v)` is `GL_n(k)`-conjugate to `ȷ` for some `v | ∞`. -/
structure TwoAdicTWSetup (p : ℕ) (S : DefProblem F E n 𝒪[E]) : Prop where
  prime : p.Prime
  unramified : Algebra.FormallyUnramified (𝓞 (maximalRealSubfield F)) (𝓞 F)
  split : ∀ v : Place F, v.Above p → v.IsSplit
  above_mem : ∀ v : Place F, v.Above p → ¬ v.Outside S.places
  absIrred : IsAbsIrred (S.residGL : Gal F → GL (Fin n) 𝓀[E])
  multiplier_odd : ∀ c : Gal (maximalRealSubfield F), orderOf c = 2 → S.multiplier c = -1
  generated : ∃ ζ : F, IsPrimitiveRoot ζ (if p = 2 then 4 else p) ∧
    IntermediateField.adjoin (maximalRealSubfield F) ({ζ} : Set F) = ⊤
  conj_j : p = 2 → Even n → ∃ (c : Gal (maximalRealSubfield F)) (g : GL (Fin n) 𝓀[E]),
    orderOf c = 2 ∧
      S.resid c = CHT.ofGL n 𝓀[E] g * CHT.j n 𝓀[E] * (CHT.ofGL n 𝓀[E] g)⁻¹

/-- The conclusion of Thorne 2017, Proposition 2.21: with `T = S`, `q = h¹_{𝒮^⊥,T} - 1` and
`g = q + |T| - 1 - [F⁺ : ℚ] n(n-1)/2`, for each `N ≥ 1` and each finite set `X` of places there is
a Taylor–Wiles datum of level `N` avoiding `X`, with `#Q = q` and `ρ̄(Frob_v)` semisimple for
`v ∈ Q`, such that `R^{loc}_{𝒮,T} → R^T_{𝒮_Q}` extends to a surjection from
`R^{loc}_{𝒮,T}⟦X₁, …, X_g⟧`; so there are infinitely many such data. -/
def TwoAdicTWConclusion (p : ℕ) (S : DefProblem F E n 𝒪[E]) : Prop :=
  ∀ q g N : ℕ, 1 ≤ N → q + 1 = S.dualSelmerDim S.places →
    (g : ℤ) = (q : ℤ) + S.places.ncard - 1 -
      (Module.finrank ℚ (maximalRealSubfield F) : ℤ) * ((n * (n - 1) / 2 : ℕ) : ℤ) →
    ∀ X : Set (Place F), X.Finite →
      ∃ Q : TaylorWilesDatum S p, Q.level N ∧ Q.Q.ncard = q ∧
        (∀ v ∈ Q.Q, ∀ x ∈ X, ¬ v.Same x) ∧
        (∀ v ∈ Q.Q,
          Squarefree (minpoly 𝓀[E] (S.residGL v.frob : Matrix (Fin n) (Fin n) 𝓀[E]))) ∧
        IsGeneratedOverLoc S Q.augmented S.places g

/-- **PL.3/taylor-wiles-primes-two-adic** (Thorne 2017, Proposition 2.21). Under the hypotheses
`TwoAdicTWSetup`, if (iv) `ρ̄(G_F)` is adequate in the sense of Thorne 2017, Definition 2.20, then
the conclusion `TwoAdicTWConclusion` holds. -/
theorem taylor_wiles_primes_two_adic (p : ℕ) (S : DefProblem F E n 𝒪[E])
    (h : TwoAdicTWSetup p S) (h_iv : (ghtAdequate 𝓀[E] n).Holds S.residGL.range) :
    TwoAdicTWConclusion p S := by
  sorry

end TWPrimes

end TauCeti.Automorphy

namespace TauCeti.DefiniteUnitary

open TauCeti.Automorphy

/-! ### PL.3/minimal-r-equals-t: The minimal R = T theorem on definite unitary groups -/

section MinimalRT

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- The polarized problem `𝒮 = (L/L⁺, T, T̃, 𝒪, r̄_m, ε^{1-n} δ_{L/L⁺}^{µ_m},
{R̄^□_ṽ}_{v ∈ S_r} ∪ {R^{λ,cr}_ṽ}_{v ∈ S_l})` of Thorne 2012, Theorem 6.8, for a maximal ideal
`m` of `T^T_λ(U, 𝒪)` and an identification `κ` of `k` with `T/m`. -/
def IsMinimalProblem (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] (κ : 𝓀[E] ≃+* (heckeAlgebra D lam ⧸ m))
    (S : DefProblem D.L E D.n 𝒪[E]) : Prop :=
  S.places = D.T ∧
  S.resid = (CHT.map D.n (κ.symm : (heckeAlgebra D lam ⧸ m) →+* 𝓀[E])).comp
    (residualRepCHT D lam m) ∧
  (∀ σ, Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (S.multiplier σ) =
    cyclo E (maximalRealSubfield D.L) σ ^ (1 - (D.n : ℤ)) *
      delta D.L E σ ^ (heckeMu D lam m).val) ∧
  ∀ v ∈ D.T,
    (v.Above D.l →
      S.localCondition v = LocalCondition.crystallineOfType (hodgeTypeOfWeight lam v)) ∧
    (¬ v.Above D.l → S.localCondition v = LocalCondition.reducedUnrestricted)

/-- The hypotheses of Thorne 2012, Theorem 6.8, other than adequacy: `l` odd and the standing
hypotheses of PL.2; the matrix form of the group with `4 ∣ n [L⁺ : ℚ]`; `R = ∅`,
`U_v = G(𝒪_{L⁺_v})` above `l` and at the split places outside `T`, hyperspecial at the inert
places; trivial arithmetic stabilisers; `m` non-Eisenstein; and `𝒮` the problem above. -/
structure MinimalRT (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] (κ : 𝓀[E] ≃+* (heckeAlgebra D lam ⧸ m))
    (S : DefProblem D.L E D.n 𝒪[E]) : Prop where
  standing : D.Standing lam
  matrix_form : D.toCMData.SB = ∅
  four_dvd : 4 ∣ D.n * Module.finrank ℚ (maximalRealSubfield D.L)
  level : D.MinimalLevel
  trivial_stabilizers : D.TrivialStabilizers
  nonEisenstein : IsNonEisenstein D lam m
  residue_compat : ∀ a : 𝒪[E], κ (IsLocalRing.residue 𝒪[E] a) =
    Ideal.Quotient.mk m (algebraMap 𝒪[E] (heckeAlgebra D lam) a)
  problem : IsMinimalProblem D lam m κ S

/-- The conclusions of Thorne 2012, Theorem 6.8 and Corollary 6.9. (1) `r_m` is of type `𝒮`.
(2) If `r : G_{L⁺} → 𝒢_n(𝒪)` is a lifting of type `𝒮` and `f' : T_m → 𝒪` is such that, for
`v ∈ S_l`, `f' ∘ r_m` and `r` lie on a common component of the crystalline lifting ring at `ṽ`
and, for `v ∈ S_r`, `(f' ∘ r_m)|G_{L_ṽ} ⇝ r|G_{L_ṽ}`, then `r` is `GL_n(𝒪)`-conjugate to
`f ∘ r_m` for some `f : T_m → 𝒪`. (3) `µ_m ≡ n mod 2`. (4) For every `f'`, the universal ring of
the problem `𝒮'` whose local problems are the components through `f' ∘ r_m` is finite over
`𝒪`. -/
def MinimalRT.Conclusion (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] (l : ℕ) [ResChar E l]
    (S : DefProblem D.L E D.n 𝒪[E]) : Prop :=
  (S.lifts (Localization.AtPrime m)).Holds (heckeGaloisRep D lam m).toMonoidHom ∧
  (∀ (r : Gal (maximalRealSubfield D.L) →* CHT D.n 𝒪[E]) (f' : Localization.AtPrime m →+* 𝒪[E]),
    (S.lifts 𝒪[E]).Holds r →
    (∀ v ∈ D.T, v.Above l → ∀ ρ₁ ρ₂ : Gal v.Fv →ₜ* GL (Fin D.n) 𝒪[E],
      IsLocalComponent ((CHT.map D.n f').comp (heckeGaloisRep D lam m).toMonoidHom) v ρ₁ →
      IsLocalComponent r v ρ₂ →
      OnSameCrystallineComponent l (hodgeTypeOfWeight lam v) ρ₁ ρ₂) →
    (∀ v ∈ D.T, ¬ v.Above l → ∀ (p : ℕ) (_ : ResChar v.Fv p)
      (ρ₁ ρ₂ : Gal v.Fv →ₜ* GL (Fin D.n) 𝒪[E]),
      IsLocalComponent ((CHT.map D.n f').comp (heckeGaloisRep D lam m).toMonoidHom) v ρ₁ →
      IsLocalComponent r v ρ₂ → StronglyConnects ρ₁ ρ₂) →
    ∃ f : Localization.AtPrime m →+* 𝒪[E],
      CHT.ConjGL (r : Gal (maximalRealSubfield D.L) → CHT D.n 𝒪[E])
        ((CHT.map D.n f).comp (heckeGaloisRep D lam m).toMonoidHom)) ∧
  heckeMu D lam m = (D.n : ZMod 2) ∧
  ∀ (f' : Localization.AtPrime m →+* 𝒪[E]) (S' : DefProblem D.L E D.n 𝒪[E]),
    S'.places = S.places → S'.resid = S.resid → S'.multiplier = S.multiplier →
    (∀ v ∈ D.T, ∀ ρ : Gal v.Fv →ₜ* GL (Fin D.n) 𝒪[E],
      IsLocalComponent ((CHT.map D.n f').comp (heckeGaloisRep D lam m).toMonoidHom) v ρ →
      S'.localCondition v = (S.localCondition v).componentThrough ρ) →
    Module.Finite 𝒪[E] S'.univRing

/-- **PL.3/minimal-r-equals-t** (Thorne 2012, Theorem 6.8 and Corollary 6.9): under the
hypotheses `MinimalRT` and the adequacy of `r̄_m(G_{L⁺(ζ_l)}) ⊂ 𝒢_n(k)` in the sense of Thorne
2012, Definition 2.3, the conclusions `MinimalRT.Conclusion` hold. -/
theorem minimal_r_equals_t (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] (l : ℕ) [ResChar E l] (hl : D.l = l)
    (κ : 𝓀[E] ≃+* (heckeAlgebra D lam ⧸ m)) (S : DefProblem D.L E D.n 𝒪[E])
    (h : MinimalRT D lam m κ S)
    (had : HasAdequateCHTImage l (residualRepCHT D lam m)) :
    MinimalRT.Conclusion D lam m l S := by
  sorry

end MinimalRT

/-! ### PL.3/ordinary-r-equals-t: The ordinary R = T theorem with Taylor's Ihara avoidance -/

section OrdinaryRT

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- The polarized problem `𝒮_{χ_v} = (L/L⁺, T, T̃, Λ, r̄_m, ε^{1-n} δ^{µ_m}_{L/L⁺},
{R^{χ_v}_ṽ}_{v ∈ R} ∪ {R^{△,ar}_{Λ_ṽ}}_{v ∈ S_l} ∪ {R^a_{ṽ₁}})` of Thorne 2012, Theorem 8.6, over
`Λ`; `atV₁` is the local problem at `ṽ₁` (`R^a_{ṽ₁}`, or `R^{ur}_{ṽ₁}` for the problem `𝒮'` of
Corollary 8.7). -/
def IsOrdinaryProblem (D : HeckeDatum E) (Sc : D.LChoice)
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m)) (v₁ : Place D.L)
    (atV₁ : LocalCondition v₁.Fv E D.n) (S : DefProblem D.L E D.n (iwasawaAlgebra D)) : Prop :=
  S.places = D.T ∧
  S.resid = (CHT.map D.n (κ.symm : (bigOrdinaryHeckeAlgebra D ⧸ m) →+* 𝓀[E])).comp
    (ordResidualRepCHT D m) ∧
  (∀ σ, Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (S.multiplier σ) =
    cyclo E (maximalRealSubfield D.L) σ ^ (1 - (D.n : ℤ)) * delta D.L E σ ^ (ordMu D m).val) ∧
  (∀ v ∈ D.R, S.localCondition v = LocalCondition.ramified (D.χ v)) ∧
  (∀ v ∈ Sc.Sl, S.localCondition v = LocalCondition.ordinary) ∧
  S.localCondition v₁ = atV₁

/-- The hypotheses of Thorne 2012, Theorem 8.6, other than adequacy: the standing hypotheses of
PL.2 with the matrix form of the group; `T = R ∪ S_l ∪ {v₁}` with `v₁ ∤ l` split; the level is
`G(𝒪_{L⁺_v})` at `S_l` and at the split places outside `T`, hyperspecial at the inert places and
Iwahori at `R ∪ {v₁}`; `m` is non-Eisenstein; (i) `r̄_m` is trivial at `R ∪ S_l`; (ii) for
`v ∈ R`, `Nv ≡ 1 mod l` and, if `l^N ∥ Nv - 1`, then `l^N > n` and `𝒪` contains the `l^N`-th roots
of unity; (iii) `r̄_m` is unramified above `v₁` and `Nv₁ ≢ 1 mod l`; (iv) the characters `χ_v`
are trivial modulo the maximal ideal; and `𝒮` is the problem above. -/
structure OrdinaryRT (D : HeckeDatum E) (Sc : D.LChoice)
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m)) (v₁ : Place D.L)
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) : Prop where
  standing : D.Standing D.zeroWeight
  matrix_form : D.toCMData.SB = ∅
  four_dvd : 4 ∣ D.n * Module.finrank ℚ (maximalRealSubfield D.L)
  T_eq : D.T = D.R ∪ Sc.Sl ∪ {v₁}
  v₁_split : D.toCMData.IsSplit v₁
  v₁_outside : D.toCMData.OutsideSB v₁
  v₁_not_above : ¬ v₁.Above D.l
  v₁_notin_R : v₁ ∉ D.R
  product : D.IsProduct
  spherical : D.SphericalOutsideT
  hyperspecial : ∀ v : Place D.toCMData.Lplus, D.toCMData.IsInert v →
    (hyperspecial D.toCMData v).Holds (D.levelAtPlus v)
  iwahori_R : ∀ (v : Place D.L) (hv : v ∈ D.R),
    D.levelAt v = iwahoriAt D.toCMData v (standing.R_outside v hv) 0 1
  iwahori_v₁ : D.levelAt v₁ = iwahoriAt D.toCMData v₁ v₁_outside 0 1
  nonEisenstein : IsOrdNonEisenstein D m
  residue_compat : ∀ a : 𝒪[E], κ (IsLocalRing.residue 𝒪[E] a) =
    Ideal.Quotient.mk m (algebraMap 𝒪[E] (bigOrdinaryHeckeAlgebra D) a)
  residually_trivial : ∀ v ∈ D.R ∪ Sc.Sl, ∀ σ : Gal v.Fv, ordResidualRep D m (v.dec σ) = 1
  R_norm : ∀ v ∈ D.R, (D.l : ℤ) ∣ (v.norm : ℤ) - 1 ∧
    ∀ N : ℕ, (D.l : ℤ) ^ N ∣ (v.norm : ℤ) - 1 → ¬ (D.l : ℤ) ^ (N + 1) ∣ (v.norm : ℤ) - 1 →
      D.n < D.l ^ N ∧ ∃ ζ : 𝒪[E], IsPrimitiveRoot ζ (D.l ^ N)
  v₁_unramified : IsUnramified ((ordResidualRep D m).comp v₁.dec.toMonoidHom)
  v₁_norm : ¬ (D.l : ℤ) ∣ (v₁.norm : ℤ) - 1
  chars_trivial_mod : ∀ v ∈ D.R, ∀ (i : Fin D.n) (x : (𝓀[v.Fv])ˣ),
    IsLocalRing.residue 𝒪[E] ((D.χ v i x : (𝒪[E])ˣ) : 𝒪[E]) = 1
  problem : IsOrdinaryProblem D Sc m κ v₁ LocalCondition.unipotentInertia S

/-- The conclusions of Thorne 2012, Theorem 8.6 and Corollary 8.7. (1) The `Λ`-adic `r_m` is of
type `𝒮_{χ_v}`. (2) If the characters `χ_v` are trivial, `r : G_{L⁺} → 𝒢_n(𝒪)` is a lifting of
type `𝒮_{1}` for some `Λ`-algebra structure on `𝒪`, unramified above `v₁`, and some
`f' : T^{ord}_m → 𝒪` has `f' ∘ r_m` unramified above `v₁`, then `r` is `GL_n(𝒪)`-conjugate to
`f ∘ r_m` for some `f`. (3) `µ_m ≡ n mod 2`. (4) If the `χ_v` are trivial, the universal ring of
the problem `𝒮'_{1}`, with `R^a_{ṽ₁}` replaced by `R^{ur}_{ṽ₁}`, is a finite `Λ`-module. -/
def OrdinaryRT.Conclusion (D : HeckeDatum E) (Sc : D.LChoice)
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m)) (v₁ : Place D.L)
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) : Prop :=
  (S.lifts (Localization.AtPrime m)).Holds (ordGaloisRep D m).toMonoidHom ∧
  ((∀ v ∈ D.R, ∀ i, D.χ v i = 1) →
    ∀ (a : iwasawaAlgebra D →+* 𝒪[E]) (r : Gal (maximalRealSubfield D.L) →* CHT D.n 𝒪[E])
      (f' : Localization.AtPrime m →+* 𝒪[E]),
      (letI := a.toAlgebra; (S.lifts 𝒪[E]).Holds r) →
      IsUnramified ((CHT.glRes r).comp v₁.dec.toMonoidHom) →
      IsUnramified ((CHT.glRes ((CHT.map D.n f').comp (ordGaloisRep D m).toMonoidHom)).comp
        v₁.dec.toMonoidHom) →
      ∃ f : Localization.AtPrime m →+* 𝒪[E],
        CHT.ConjGL (r : Gal (maximalRealSubfield D.L) → CHT D.n 𝒪[E])
          ((CHT.map D.n f).comp (ordGaloisRep D m).toMonoidHom)) ∧
  ordMu D m = (D.n : ZMod 2) ∧
  ((∀ v ∈ D.R, ∀ i, D.χ v i = 1) →
    ∀ S' : DefProblem D.L E D.n (iwasawaAlgebra D),
      IsOrdinaryProblem D Sc m κ v₁ LocalCondition.unramified S' →
      Module.Finite (iwasawaAlgebra D) S'.univRing)

/-- **PL.3/ordinary-r-equals-t** (Thorne 2012, Theorem 8.6 and Corollary 8.7): under the
hypotheses `OrdinaryRT` and the adequacy of `r̄_m(G_{L⁺(ζ_l)}) ⊂ 𝒢_n(k)` in the sense of Thorne
2012, Definition 2.3, the conclusions `OrdinaryRT.Conclusion` hold. -/
theorem ordinary_r_equals_t (D : HeckeDatum E) (Sc : D.LChoice)
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m)) (v₁ : Place D.L)
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) (h : OrdinaryRT D Sc m κ v₁ S)
    (had : HasAdequateCHTImage D.l (ordResidualRepCHT D m)) :
    OrdinaryRT.Conclusion D Sc m κ v₁ S := by
  sorry

end OrdinaryRT

/-! ### PL.3/revised-adequacy-r-equals-t: The R = T theorems under Guralnick–Herzig–Tiep
adequacy -/

section RevisedAdequacy

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- **PL.3/revised-adequacy-r-equals-t**, minimal case (Thorne 2017, Proposition 7.2): the
conclusions of PL.3/minimal-r-equals-t hold when the adequacy hypothesis is replaced by
`ζ_l ∉ L` and `r̄_m(G_{L(ζ_l)}) ⊂ GL_n(k)` adequate in the sense of Thorne 2017,
Definition 2.20. -/
theorem revised_adequacy_r_equals_t_1 (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] (l : ℕ) [ResChar E l] (hl : D.l = l)
    (κ : 𝓀[E] ≃+* (heckeAlgebra D lam ⧸ m)) (S : DefProblem D.L E D.n 𝒪[E])
    (h : MinimalRT D lam m κ S)
    (had : HasGHTAdequateImage l (residualRep D lam m)) :
    MinimalRT.Conclusion D lam m l S := by
  sorry

/-- **PL.3/revised-adequacy-r-equals-t**, ordinary case (Thorne 2017, Proposition 7.2): the
conclusions of PL.3/ordinary-r-equals-t hold under the same replacement. -/
theorem revised_adequacy_r_equals_t_2 (D : HeckeDatum E) (Sc : D.LChoice)
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m)) (v₁ : Place D.L)
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) (h : OrdinaryRT D Sc m κ v₁ S)
    (had : HasGHTAdequateImage D.l (ordResidualRep D m)) :
    OrdinaryRT.Conclusion D Sc m κ v₁ S := by
  sorry

end RevisedAdequacy

end TauCeti.DefiniteUnitary

namespace TauCeti.Automorphy

/-! ## PL.4, PL.5 and PL.9: automorphy lifting, finiteness of deformation rings, lifts, rigidity

Conventions of this part.

* A continuous `l`-adic representation `r : G_F → GL_n(Q̄_l)` of the sources enters through an
  invariant lattice `r : G_F → GL_n(𝒪[E])`, which every continuous representation of `G_F` over `E`
  has; its reduction is the residual representation `r̄`, equal to its semisimplification whenever
  it is irreducible. A character `μ : G_{F⁺} → Q̄_l^×` enters as `μ : G_{F⁺} → 𝒪[E]^×`.
* "Irreducible" for a representation over `F̄_l` or `Q̄_l` is `IsAbsIrred`.
* Where a source produces an object over the integers of `Q̄_l`, the statement produces it over
  `𝒪[E']` for a further coefficient field `E'` with an embedding `E → E'`.
* Everything this part declares outside the packet's own names is in the namespace `Lifting`:
  first the imported interfaces, then the auxiliary definitions. -/

namespace Lifting

/-! #### Imported interfaces used by PL.4, PL.5 and PL.9 -/

section Imported

variable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- Mathlib's cyclotomic character valued in `𝒪[E]^×` (stand-in for the composite of
`cyclotomicCharacter` with `ℤ_l^× → 𝒪[E]^×`, `l` the residue characteristic of `E`). It is the
integral form of the shared stand-in `cyclo`: see `genericChar_cycloInt`. -/
def cycloInt (F : Type*) [Field F] : Gal F →ₜ* (𝒪[E])ˣ := sorry

variable {E}

/-- AutomorphicGaloisRepresentationsPartII
AG2.0/galois-character-of-an-algebraic-hecke-character (stand-in): the character `r_{l,ι}(χ)` of
`G_{F⁺}` with values in `𝒪[E]^×`. It is the integral form of `RACP.multiplier`: see
`genericChar_multiplierInt`. -/
def multiplierInt {F : Type} [Field F] [NumberField F] {n : ℕ} (π : RACP F n) (ι : E →+* ℂ) :
    Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ := sorry

/-- AutomorphicGaloisRepresentationsPartII AG2.0/polarized-automorphic-representation (stand-in):
the pairs `(π, χ)` with `χ = δ^n_{F/F⁺} ∘ Art`, that is, the regular algebraic conjugate self-dual
cuspidal (RACSDC) automorphic representations `π` of `GL_n(𝔸_F)`, `F` imaginary CM. -/
def racsdc (F : Type) [Field F] [NumberField F] (n : ℕ) : Imported (RACP F n) := sorry

/-- GlobalGaloisDeformations G7/polarized-deformation-problem (stand-in): the polarized global
deformation problem `𝒮 = (F/F⁺, S, S̃, 𝒪, r̄, χ, {D_v})`, with `S̃` the finite set of chosen places
of `F`, `r̄ : G_{F⁺} → 𝒢_n(k)` extending `r̆ : G_F → GL_n(k)`, multiplier `χ`, and at `ṽ ∈ S̃` the
local deformation problem cut out by the ideal `I ṽ` of the framed lifting ring of `r̆|G_{F_ṽ}`,
which the owner requires to be invariant under conjugation by the kernel of reduction (the ideals
at the places outside `S̃` play no role). -/
def DefProblem.ofLocalConditions {F : Type} [Field F] [NumberField F] [IsCMField F] {n : ℕ}
    (S : Finset (Place F)) (rt : Gal (maximalRealSubfield F) →* CHT n 𝓀[E])
    (rbar : Gal F →* GL (Fin n) 𝓀[E]) (χ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ)
    (I : ∀ w : Place F, Ideal (LiftingRing w.Fv E (rbar.comp w.dec.toMonoidHom))) :
    DefProblem F E n 𝒪[E] := sorry

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group (stand-in): the element
`j ∈ 𝒢_n(A)`, with `j (g, a) j⁻¹ = (a ᵗg⁻¹, a)` and `ν(j) = -1`. -/
def CHT.j (n : ℕ) (A : Type*) [CommRing A] : CHT n A := sorry

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group (stand-in): the inclusion
`GL_n(A) × A^× = 𝒢_n⁰(A) → 𝒢_n(A)`, `(g, a) ↦ (g, a)`. -/
def CHT.incl (n : ℕ) (A : Type*) [CommRing A] : GL (Fin n) A × Aˣ →* CHT n A := sorry

/-- ArithmeticGaloisRepresentations R01.1 (stand-in): a complex conjugation `c_v ∈ G_K` at an
infinite place `v` of `K` (used for real places). Only its conjugacy class is canonical. -/
def complexConj {K : Type*} [Field K] (v : InfinitePlace K) : Gal K := sorry

section Local

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- LocalGaloisDeformationRings R08.3/pst-deformation-ring (stand-in): the ideal of `R^□` cutting
out the quotient that classifies the lifts which are semistable over `K'` with labelled
Hodge–Tate weights `H` (the analogue of `crystallineIdeal`). -/
def semistableIdeal {n : ℕ} (ρbar : Gal K →* GL (Fin n) 𝓀[E]) (H : (K →+* E) → Multiset ℤ)
    {K' : Type} [Field K'] (f : K →+* K') : Ideal (LiftingRing K E ρbar) := sorry

/-- LocalGaloisDeformationRings L7 and L7/ordinary-flag-scheme (stand-in): the ideal of `R^□`
cutting out Geraghty's semistable ordinary quotient `R^□_{𝒪, ρ̄, {H_τ}, ss-ord}`, the reduced
`l`-torsion-free quotient whose points are the lifts that are semistable and ordinary with
labelled Hodge–Tate weights `H` (`K` and `E` of the same residue characteristic). -/
def semistableOrdinaryIdeal {n : ℕ} (ρbar : Gal K →* GL (Fin n) 𝓀[E])
    (H : (K →+* E) → Multiset ℤ) : Ideal (LiftingRing K E ρbar) := sorry

/-- LocalGaloisDeformationRings R08.2/minimally-ramified-condition (stand-in): the minimally
ramified liftings to `A` of a residual `𝒢_N(k)`-valued representation `r̄_v` of `Γ_{F⁺_v}`
(Liu–Tian–Xiao–Zhang–Zhu, Definition 3.4.8, at a place not split in `F`, for `ℓ ≥ N`;
Clozel–Harris–Taylor, Definition 2.4.14, at a split place). -/
def minimallyRamified {N : ℕ} (rbar : Gal K →* CHT N 𝓀[E]) (A : Type) [CommRing A]
    [Algebra 𝒪[E] A] : Imported (Gal K →* CHT N A) := sorry

/-- LocalGaloisDeformationRings L7/fontaine-laffaille-deformation-condition (stand-in): the
regular Fontaine–Laffaille crystalline residual representations of `G_K` over `𝓀[E]`, `K`
unramified over `ℚ_ℓ`: after an unramified extension of the coefficient field, crystalline with
regular Fontaine–Laffaille weights in an interval `[a, b]` with `0 ≤ b - a ≤ ℓ - 2`
(Liu–Tian–Xiao–Zhang–Zhu, Definition 3.2.4(2)). -/
def fontaineLaffaille (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (N : ℕ) : Imported (Gal K →* GL (Fin N) 𝓀[E]) := sorry

/-- LocalGaloisDeformationRings L7 (stand-in; Le–Le Hung–Levin–Morra §2.4): the tame inertial
types of `K` with coefficients in `E`, of dimension `n`. -/
def TameInertialType (K : Type) [Field K] (E : Type) [Field E] (n : ℕ) : Type := sorry

/-- LocalGaloisDeformationRings L7 (stand-in): the triples `(τ, s, μ)` such that `(s, μ - η)` is a
lowest alcove presentation of the tame inertial type `τ` (Le–Le Hung–Levin–Morra,
Definition 2.4.3): `s` in the Weyl group `(S_n)^{Hom(K, E)}` and `μ - η` in the base alcove. -/
def lowestAlcove {n : ℕ} : Imported (TameInertialType K E n ×
    ((K →+* E) → Equiv.Perm (Fin n)) × ((K →+* E) → Fin n → ℤ)) := sorry

/-- LocalGaloisDeformationRings R08.3/pst-deformation-ring (stand-in): the pairs `(ρ, τ)` with
`ρ` potentially semistable of inertial type `τ`. -/
def inertialType {n : ℕ} :
    Imported ((Gal K →ₜ* GL (Fin n) E) × TameInertialType K E n) := sorry

/-- LocalGaloisDeformationRings L7 (stand-in): the pairs `(π_w, τ)` such that the restriction of
`π_w` to `GL_n(𝒪_K)` contains `σ(τ) ⊗_{E,ι} ℂ`, where `σ(τ)` is the representation of `GL_n(𝒪_K)`
attached to `τ` by the inertial local Langlands correspondence (Le–Le Hung–Levin–Morra,
Theorem 2.5.4). The source says "`σ(τ)` is a `K`-type for `π`" without defining the phrase; this
is the reading the roadmap fixes. -/
def kType {n : ℕ} (ι : E →+* ℂ) : Imported (SmoothIrrep K n × TameInertialType K E n) := sorry

end Local

/-- LocalGaloisDeformationRings L7 (stand-in): the polynomial `P_{λ+η,e} ∈ ℤ[X₁, …, X_n]` of
Le–Le Hung–Levin–Morra, Theorem 7.3.2(2). It depends only on the set `W` of the weights
`λ_j + η_j` and on the ramification index `e` of the coefficient ring, not on `p`; the source does
not make it explicit. -/
def genericityPolynomial (n : ℕ) (W : Set (Fin n → ℤ)) (e : ℕ) : MvPolynomial (Fin n) ℤ := sorry

/-- A number field with an embedding into `ℂ`. -/
structure CoefficientField where
  /-- The number field. -/
  carrier : Type
  [field : Field carrier]
  [numberField : NumberField carrier]
  /-- The embedding into `ℂ`. -/
  emb : carrier →+* ℂ

attribute [instance] CoefficientField.field CoefficientField.numberField

/-- AutomorphicGaloisRepresentationsPartII AG2.2 (stand-in): the strong coefficient fields of
`π`, i.e. the number fields `E ⊂ ℂ` such that for every prime `λ` of `E` the representation
`ρ_{π,λ}` is defined over `E_λ` (Liu–Tian–Xiao–Zhang–Zhu, Definition 2.3.4). -/
def strongCoefficientField {F : Type} [Field F] [NumberField F] {N : ℕ} (π : RACP F N) :
    Imported CoefficientField := sorry

/-- ArithmeticGaloisRepresentations R01.6/tate-module-of-an-abelian-variety (stand-in): the
representation `ρ_{A,ℓ}` of `G_K` on `H¹_ét(A_{K̄}, ℤ_ℓ)`, the dual of the `ℓ`-adic Tate module,
in a basis, for an elliptic curve `A` over `K`. -/
def tateCohomology {K : Type} [Field K] (A : WeierstrassCurve K) [A.IsElliptic] (ℓ : ℕ)
    [Fact ℓ.Prime] : Gal K →ₜ* GL (Fin 2) 𝒪[ℚ_[ℓ]] := sorry

section Shimura

open IsDedekindDomain

/-- AutomorphicGaloisRepresentationsPartII AG2.1a (stand-in): the hermitian spaces of rank `N`
over the CM field `F`. -/
def HermitianSpace (F : Type) [Field F] [NumberField F] (N : ℕ) : Type := sorry

variable {F : Type} [Field F] [NumberField F] {N : ℕ}

/-- AG2.1a (stand-in): the nonarchimedean places `v` of `F⁺` at which `V_v` is not split. -/
def HermitianSpace.nonsplit (V : HermitianSpace F N) :
    Imported (HeightOneSpectrum (𝓞 (maximalRealSubfield F))) := sorry

/-- AG2.1a (stand-in): `d(V) = ∑_τ p_τ q_τ` for the signatures `(p_τ, q_τ)` of `V`, the dimension
of the Shimura varieties `Sh(V, K)`. -/
def HermitianSpace.shimuraDim (V : HermitianSpace F N) : ℕ := sorry

/-- AG2.1a (stand-in): the group `U(V)(𝔸^∞_{F⁺})`. -/
def HermitianSpace.adelicGroup (V : HermitianSpace F N) : Type := sorry

instance (V : HermitianSpace F N) : Group V.adelicGroup := sorry

instance (V : HermitianSpace F N) : TopologicalSpace V.adelicGroup := sorry

/-- AG2.1a (stand-in): the group `U(V)(F⁺_v)`. -/
def HermitianSpace.localGroup (V : HermitianSpace F N)
    (v : HeightOneSpectrum (𝓞 (maximalRealSubfield F))) : Type := sorry

instance (V : HermitianSpace F N) (v : HeightOneSpectrum (𝓞 (maximalRealSubfield F))) :
    Group (V.localGroup v) := sorry

/-- AG2.1a (stand-in): the projection `U(V)(𝔸^∞_{F⁺}) → U(V)(F⁺_v)`. -/
def HermitianSpace.proj (V : HermitianSpace F N)
    (v : HeightOneSpectrum (𝓞 (maximalRealSubfield F))) : V.adelicGroup →* V.localGroup v := sorry

/-- AG2.1a (stand-in): the neat subgroups of `U(V)(𝔸^∞_{F⁺})`. -/
def HermitianSpace.neat (V : HermitianSpace F N) : Imported (Subgroup V.adelicGroup) := sorry

/-- AG2.1a (stand-in): the subgroups `K = K_v × K^v` with `K_v = U(Λ_v)(𝒪_{F⁺_v})` the stabiliser
of a self-dual lattice `Λ_v` of `V_v`. -/
def HermitianSpace.hyperspecialAt (V : HermitianSpace F N)
    (v : HeightOneSpectrum (𝓞 (maximalRealSubfield F))) : Imported (Subgroup V.adelicGroup) :=
  sorry

/-- AG2.1a (stand-in): the subgroups `K = K_v × K^v` with `K_v` a special maximal subgroup of
`U(V)(F⁺_v)`. -/
def HermitianSpace.specialMaximalAt (V : HermitianSpace F N)
    (v : HeightOneSpectrum (𝓞 (maximalRealSubfield F))) : Imported (Subgroup V.adelicGroup) :=
  sorry

/-- AG2.1a (stand-in): the abstract unitary Hecke algebra `𝕋^S_N` away from a set `S` of places
of `F⁺` (Liu–Tian–Xiao–Zhang–Zhu, Definition 2.2.3), with coefficients extended to `𝒪[E]`. -/
def unitaryHecke (F : Type) [Field F] [NumberField F] (N : ℕ)
    (S : Set (HeightOneSpectrum (𝓞 (maximalRealSubfield F)))) (E : Type) [Field E]
    [ValuativeRel E] : Type := sorry

instance (S : Set (HeightOneSpectrum (𝓞 (maximalRealSubfield F)))) :
    CommRing (unitaryHecke F N S E) := sorry

instance (S : Set (HeightOneSpectrum (𝓞 (maximalRealSubfield F)))) :
    Algebra 𝒪[E] (unitaryHecke F N S E) := sorry

/-- AG2.1a (stand-in): the inclusion `𝕋^{S'}_N → 𝕋^S_N` for `S ⊆ S'`. -/
def unitaryHecke.restrict {S S' : Set (HeightOneSpectrum (𝓞 (maximalRealSubfield F)))}
    (h : S ⊆ S') : unitaryHecke F N S' E →ₐ[𝒪[E]] unitaryHecke F N S E := sorry

/-- AG2.1a (stand-in): the homomorphism `φ : 𝕋^S_N → k` attached to a residual representation
`r̄^♮ : Γ_F → GL_N(k)` by the Frobenius normalisation of Liu–Tian–Xiao–Zhang–Zhu §3.6: at `v ∉ S`
inducing one place `w` of `F` its unitary Hecke parameter `α` has `{α_i ‖v‖^{N-1}}` the
generalised eigenvalues of `r̄^♮(φ_w⁻¹)`, and at `v ∉ S` splitting into `w₁, w₂` it has
`{α_{i,j} ‖v‖^{(N-1)/2}}_j` those of `r̄^♮(φ_{w_i}⁻¹)`. -/
def unitaryHecke.residualCharacter (S : Set (HeightOneSpectrum (𝓞 (maximalRealSubfield F))))
    (rbarNat : Gal F →* GL (Fin N) 𝓀[E]) : unitaryHecke F N S E →+* 𝓀[E] := sorry

/-- AG2.1a (stand-in): `H^d_ét(Sh(V, K), L_ξ)`, the étale cohomology of the unitary Shimura
variety of level `K` with coefficients in the `𝒪[E]`-local system `L_ξ` of weight `ξ`, formed
through `ι`. -/
def etaleCohomology (V : HermitianSpace F N) (K : Subgroup V.adelicGroup)
    (ξ : (F →+* ℂ) → Fin N → ℤ) (ι : E →+* ℂ) (d : ℕ) : Type := sorry

instance (V : HermitianSpace F N) (K : Subgroup V.adelicGroup) (ξ : (F →+* ℂ) → Fin N → ℤ)
    (ι : E →+* ℂ) (d : ℕ) : AddCommGroup (etaleCohomology V K ξ ι d) := sorry

/-- AG2.1a (stand-in): the action of `𝕋^S_N` on `H^d_ét(Sh(V, K), L_ξ)`, defined when `K` is
hyperspecial outside `S`. -/
instance (V : HermitianSpace F N) (K : Subgroup V.adelicGroup) (ξ : (F →+* ℂ) → Fin N → ℤ)
    (ι : E →+* ℂ) (d : ℕ) (S : Set (HeightOneSpectrum (𝓞 (maximalRealSubfield F)))) :
    Module (unitaryHecke F N S E) (etaleCohomology V K ξ ι d) := sorry

/-- AG2.1a (stand-in): `H^d_ét(Sh(V, K), L_ξ ⊗_𝒪 k)`, the cohomology with coefficients in the
reduction of the local system. -/
def etaleCohomologyMod (V : HermitianSpace F N) (K : Subgroup V.adelicGroup)
    (ξ : (F →+* ℂ) → Fin N → ℤ) (ι : E →+* ℂ) (d : ℕ) : Type := sorry

instance (V : HermitianSpace F N) (K : Subgroup V.adelicGroup) (ξ : (F →+* ℂ) → Fin N → ℤ)
    (ι : E →+* ℂ) (d : ℕ) : AddCommGroup (etaleCohomologyMod V K ξ ι d) := sorry

/-- AG2.1a (stand-in): the action of `𝕋^S_N` on `H^d_ét(Sh(V, K), L_ξ ⊗_𝒪 k)`, defined when `K`
is hyperspecial outside `S`. -/
instance (V : HermitianSpace F N) (K : Subgroup V.adelicGroup) (ξ : (F →+* ℂ) → Fin N → ℤ)
    (ι : E →+* ℂ) (d : ℕ) (S : Set (HeightOneSpectrum (𝓞 (maximalRealSubfield F)))) :
    Module (unitaryHecke F N S E) (etaleCohomologyMod V K ξ ι d) := sorry

end Shimura

/-- Le–Le Hung–Levin–Morra §9.1 (stand-in): the continuous `r̄ : G_{F⁺} → 𝒢_n(𝔽)` that are
automorphic for a definite unitary group in the sense of the paragraph before their
Definition 9.1.1: `r̄ = r̄_𝔪` for a maximal ideal `𝔪` in the support of a space `S(U, W)` of
algebraic automorphic forms on an outer form of `GL_n` over `F⁺` that splits over `F` and is
definite at infinity, of sufficiently small level `U`. No roadmap of the atlas owns this notion:
it needs algebraic automorphic forms with arbitrary coefficient modules, which
PL.2/unitary-algebraic-modular-forms of this roadmap does not provide, and the roadmap records
the theorem that uses it (their Theorem 9.1.6) as a gap. -/
def definiteUnitaryAutomorphic (F : Type) [Field F] [NumberField F] (E : Type) [Field E]
    [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E] (n : ℕ) :
    Imported (Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) := sorry

end Imported

/-! #### Auxiliary definitions of PL.4, PL.5 and PL.9 -/

section Places

open IsDedekindDomain

variable {K L : Type} [Field K] [Field L]

/-- A place `w` of `L` lies over the place `v` of `K`: the open unit balls of the two completions
meet `K` in the same set. -/
def Place.LiesOver [Algebra K L] (w : Place L) (v : Place K) : Prop :=
  ∀ x : K, w.emb (algebraMap K L x) <ᵥ 1 ↔ v.emb x <ᵥ 1

/-- `w` is a completion of `K` at the prime `𝔭` of its ring of integers. -/
def Place.IsAt (w : Place K) (𝔭 : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∀ x : 𝓞 K, w.emb (x : K) <ᵥ 1 ↔ x ∈ 𝔭.asIdeal

/-- A place `w` of `L` lies over the prime `𝔭` of `K`. -/
def Place.IsOver [Algebra K L] (w : Place L) (𝔭 : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∀ x : 𝓞 K, w.emb (algebraMap K L x) <ᵥ 1 ↔ x ∈ 𝔭.asIdeal

/-- The rational prime `p` ramifies in `K`: some non-zero prime `P` of `𝓞 K` has `P² ∣ (p)`. -/
def IsRamifiedIn (p : ℕ) (K : Type) [Field K] : Prop :=
  ∃ P : Ideal (𝓞 K), P.IsPrime ∧ P ≠ ⊥ ∧ Ideal.span {(p : 𝓞 K)} ≤ P ^ 2

/-- The prime `v` of `K` is inert in `L`: it generates a prime ideal of `𝓞 L`. -/
def IsInertIn (v : HeightOneSpectrum (𝓞 K)) (L : Type) [Field L] [Algebra K L] : Prop :=
  (v.asIdeal.map (algebraMap (𝓞 K) (𝓞 L))).IsPrime

/-- The prime `v` of `K` splits in the quadratic extension `L`: two distinct primes lie over
it. -/
def IsSplitIn (v : HeightOneSpectrum (𝓞 K)) (L : Type) [Field L] [Algebra K L] : Prop :=
  ∃ P Q : Ideal (𝓞 L), P.IsPrime ∧ Q.IsPrime ∧ P ≠ Q ∧
    P.comap (algebraMap (𝓞 K) (𝓞 L)) = v.asIdeal ∧ Q.comap (algebraMap (𝓞 K) (𝓞 L)) = v.asIdeal

/-- The norm `‖v‖` of a prime: the cardinality of its residue field. -/
def primeNorm (v : HeightOneSpectrum (𝓞 K)) : ℕ := Nat.card (𝓞 K ⧸ v.asIdeal)

/-- The primes of `K` above the rational prime `p`. -/
def primesAbove (K : Type) [Field K] (p : ℕ) : Set (HeightOneSpectrum (𝓞 K)) :=
  {v | (p : 𝓞 K) ∈ v.asIdeal}

end Places

section Auxiliary

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

local notation "F⁺" => maximalRealSubfield F

/-- The inclusion `G_F → G_{F⁺}`. -/
def toPlus (F : Type) [Field F] [NumberField F] : Gal F →ₜ* Gal (maximalRealSubfield F) :=
  Field.absoluteGaloisGroup.map (algebraMap (maximalRealSubfield F) F)

/-- Restriction of a homomorphism of `G_F` to a place. -/
def resPlaceHom {H : Type*} [Monoid H] (ρ : Gal F →* H) (v : Place F) : Gal v.Fv →* H :=
  ρ.comp v.dec.toMonoidHom

/-- Reduction modulo the maximal ideal of an `𝒪[E]`-valued character. -/
def redChar {G : Type*} [Monoid G] [TopologicalSpace G] (χ : G →ₜ* (𝒪[E])ˣ) : G →* (𝓀[E])ˣ :=
  (Units.map (IsLocalRing.residue 𝒪[E] : 𝒪[E] →* 𝓀[E])).comp χ.toMonoidHom

/-- The `E^×`-valued character of an `𝒪[E]^×`-valued character. -/
def genericChar {G : Type*} [Monoid G] [TopologicalSpace G] (χ : G →ₜ* (𝒪[E])ˣ) : G →ₜ* Eˣ where
  toMonoidHom := (Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E)).comp χ.toMonoidHom
  continuous_toFun := by sorry

/-- The representation over `E` of a continuous lattice-valued representation of any group
(`genericC` is the case of a local Galois group). -/
def genericG {G : Type*} [Monoid G] [TopologicalSpace G] (ρ : G →ₜ* GL (Fin n) 𝒪[E]) :
    G →ₜ* GL (Fin n) E where
  toMonoidHom := generic ρ.toMonoidHom
  continuous_toFun := by sorry

/-- The stand-in `cycloInt` is the integral form of `cyclo`. -/
theorem genericChar_cycloInt (K : Type*) [Field K] : genericChar (cycloInt E K) = cyclo E K := by
  sorry

/-- The stand-in `multiplierInt` is the integral form of `RACP.multiplier`. -/
theorem genericChar_multiplierInt (π : RACP F n) (ι : E →+* ℂ) :
    genericChar (multiplierInt π ι) = π.multiplier ι := by
  sorry

/-- The residual cyclotomic character `ε̄ : G_K → 𝓀[E]^×`. -/
def cycloBar (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (K : Type*) [Field K] : Gal K →* (𝓀[E])ˣ :=
  redChar (cycloInt E K)

open scoped Classical in
/-- The quadratic character `δ_{F/F⁺}` of `G_{F⁺}` with values in any commutative ring: for `F`
imaginary CM, where `G_F` has index `2` in `G_{F⁺}`, it is `1` on `G_F` and `-1` outside; it is
trivial when `G_F` does not have index `2` (for instance for `F` totally real). For `A = E` it is
the shared stand-in `delta`. -/
def deltaSign (F : Type) [Field F] [NumberField F] (A : Type*) [CommRing A] :
    Gal (maximalRealSubfield F) →* Aˣ where
  toFun τ :=
    if (toPlus F).toMonoidHom.range.index = 2 ∧ τ ∉ (toPlus F).toMonoidHom.range then -1 else 1
  map_one' := by sorry
  map_mul' := by sorry

/-- `δ_{F/F⁺}` as a continuous character with values in `𝒪[E]^×`. -/
def deltaInt (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] :
    Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ where
  toMonoidHom := deltaSign F 𝒪[E]
  continuous_toFun := by sorry

/-- `rt : G_{F⁺} → 𝒢_n(A)` extends `ρ : G_F → GL_n(A)`: `rt⁻¹(𝒢_n⁰(A)) = G_F`, and the
`GL_n`-component of `rt|G_F` is `ρ`. The sources write `ρ = r̆` (BLGGT14) or `ρ = r^♮`
(Liu–Tian–Xiao–Zhang–Zhu); `ρ` is determined by `rt`. -/
def CHT.Extends {A : Type*} [CommRing A] (rt : Gal F⁺ → CHT n A) (ρ : Gal F → GL (Fin n) A) :
    Prop :=
  (∀ τ, rt τ ∈ CHT.conn n A ↔ τ ∈ Set.range (toPlus F)) ∧
    ∀ σ : Gal F, ∃ h : rt (toPlus F σ) ∈ CHT.conn n A, CHT.gl n A ⟨_, h⟩ = ρ σ

/-- An element of `𝒢_n(A)` is `GL_n(A)`-conjugate to `(a, 1) j`. -/
def CHT.IsGLConjTo {A : Type*} [CommRing A] (x : CHT n A) (a : GL (Fin n) A) : Prop :=
  ∃ g : GL (Fin n) A,
    x = CHT.incl n A (g, 1) * (CHT.incl n A (a, 1) * CHT.j n A) * (CHT.incl n A (g, 1))⁻¹

/-- Two `𝒢_n(A)`-valued maps over a local ring `A` are strictly equivalent: conjugate by an
element of the kernel of `GL_n(A) → GL_n(A/𝔪_A)`. -/
def CHT.StrictEquiv {G A : Type*} [CommRing A] [IsLocalRing A] (r₁ r₂ : G → CHT n A) : Prop :=
  ∃ g : GL (Fin n) A, Matrix.GeneralLinearGroup.map (IsLocalRing.residue A) g = 1 ∧
    ∀ σ, r₁ σ = CHT.incl n A (g, 1) * r₂ σ * (CHT.incl n A (g, 1))⁻¹

/-- The reduction of a `𝒢_n(𝒪[E])`-valued homomorphism. -/
def CHT.reduction {G : Type*} [Monoid G] (r : G →* CHT n 𝒪[E]) : G →* CHT n 𝓀[E] :=
  (CHT.map n (IsLocalRing.residue 𝒪[E])).comp r

/-- The matrix `Ψ_n` with `1` on the antidiagonal and `0` elsewhere (Thorne 2017, Lemma 2.16). -/
def antidiagonal (n : ℕ) (A : Type*) [CommRing A] : GL (Fin n) A :=
  ⟨Matrix.of fun i j => if j = Fin.rev i then 1 else 0,
    Matrix.of fun i j => if j = Fin.rev i then 1 else 0, by sorry, by sorry⟩

/-- BLGGT14 §2.1: `(r, μ)` is a polarized representation of `G_F`, for `F` CM or totally real.
For some infinite place `v` of `F⁺` there are a sign `ε_v` and a non-degenerate pairing
`⟨x, y⟩ = ᵗx J y` with `⟨x, y⟩ = ε_v ⟨y, x⟩` and `⟨r(σ)x, r(c_v σ c_v)y⟩ = μ(σ)⟨x, y⟩` for
`σ ∈ G_F`; if `F` is imaginary then moreover `ε_v = -μ(c_v)`. -/
def IsPolarized {A : Type*} [CommRing A] (r : Gal F → GL (Fin n) A) (μ : Gal F⁺ → Aˣ) : Prop :=
  ∃ (v : InfinitePlace F⁺) (ε : ℤˣ) (J : GL (Fin n) A),
    (J : Matrix (Fin n) (Fin n) A)ᵀ = (((ε : ℤ) : A)) • (J : Matrix (Fin n) (Fin n) A) ∧
    (∀ σ σ' : Gal F, toPlus F σ' = complexConj v * toPlus F σ * (complexConj v)⁻¹ →
      (r σ : Matrix (Fin n) (Fin n) A)ᵀ * (J : Matrix (Fin n) (Fin n) A) *
        (r σ' : Matrix (Fin n) (Fin n) A) = ((μ (toPlus F σ) : Aˣ) : A) • (J : Matrix _ _ A)) ∧
    (IsTotallyComplex F → (((ε : ℤ) : A)) = -((μ (complexConj v) : Aˣ) : A))

/-- `ρ^c ≅ ρ^∨ ⊗ χ` for a representation `ρ` of `G_F` and a character `χ` of `G_F`, `F` imaginary
CM: for some `c ∈ G_{F⁺}` outside `G_F`, `σ ↦ ρ(c σ c⁻¹)` is conjugate to `σ ↦ χ(σ) ᵗρ(σ)⁻¹`. -/
def IsConjugateSelfDual {A : Type*} [CommRing A] (ρ : Gal F → GL (Fin n) A) (χ : Gal F → Aˣ) :
    Prop :=
  ∃ (c : Gal F⁺) (g : GL (Fin n) A), c ∉ Set.range (toPlus F) ∧
    ∀ σ σ' : Gal F, toPlus F σ' = c * toPlus F σ * c⁻¹ →
      (ρ σ' : Matrix (Fin n) (Fin n) A) = ((χ σ : Aˣ) : A) •
        ((g : Matrix (Fin n) (Fin n) A) * ((ρ σ)⁻¹ : GL (Fin n) A).1ᵀ * (g⁻¹ : GL (Fin n) A).1)

/-- `ρ` is symplectic with multiplier `ν`: it preserves a non-degenerate alternating form up to
`ν`, i.e. it is conjugate to a `GSp_n`-valued homomorphism with multiplier `ν`. -/
def IsSymplectic {G k : Type*} [Field k] (ρ : G → GL (Fin n) k) (ν : G → kˣ) : Prop :=
  ∃ J : GL (Fin n) k, (J : Matrix (Fin n) (Fin n) k)ᵀ = -(J : Matrix (Fin n) (Fin n) k) ∧
    (∀ i, (J : Matrix (Fin n) (Fin n) k) i i = 0) ∧
    ∀ σ, (ρ σ : Matrix (Fin n) (Fin n) k)ᵀ * (J : Matrix (Fin n) (Fin n) k) *
      (ρ σ : Matrix (Fin n) (Fin n) k) = ((ν σ : kˣ) : k) • (J : Matrix (Fin n) (Fin n) k)

/-- Two representations over a field have isomorphic semisimplifications: their characteristic
polynomials agree (Brauer–Nesbitt). -/
def SameSemisimplification {G k : Type*} [Field k] (ρ₁ ρ₂ : G → GL (Fin n) k) : Prop :=
  ∀ σ, (ρ₁ σ : Matrix (Fin n) (Fin n) k).charpoly = (ρ₂ σ : Matrix (Fin n) (Fin n) k).charpoly

/-- A subspace is stable under the elements of a set `S` of the group. -/
def IsStableUnder {G k : Type*} [Field k] (S : Set G) (ρ : G → GL (Fin n) k)
    (W : Submodule k (Fin n → k)) : Prop :=
  ∀ g ∈ S, ∀ w ∈ W, (ρ g : Matrix (Fin n) (Fin n) k).mulVec w ∈ W

/-- A representation over a field is semisimple: every invariant subspace has an invariant
complement. -/
def IsSemisimple {G k : Type*} [Field k] (ρ : G → GL (Fin n) k) : Prop :=
  ∀ W : Submodule k (Fin n → k), IsStableUnder Set.univ ρ W →
    ∃ W' : Submodule k (Fin n → k), IsStableUnder Set.univ ρ W' ∧ IsCompl W W'

/-- A representation of `G_F` is unramified at all but finitely many places: outside the places
above a finite set of rational primes. -/
def IsUnramifiedAlmostEverywhere {H : Type*} [Group H] (ρ : Gal F →* H) : Prop :=
  ∃ T : Finset ℕ, ∀ w : Place F, (∀ p ∈ T, ¬ w.Above p) → IsUnramified (resPlaceHom ρ w)

/-- BLGGT14 §2.1: `r` is algebraic, i.e. unramified at all but finitely many places and de Rham at
the places above `l`. -/
def IsAlgebraic (l : ℕ) (r : Gal F →ₜ* GL (Fin n) E) : Prop :=
  IsUnramifiedAlmostEverywhere r.toMonoidHom ∧
    ∀ w : Place F, w.Above l → (deRham w.Fv E n).Holds (resPlace r w)

/-- BLGGT14 §2.1: `r` is regular algebraic, i.e. algebraic with `n` distinct Hodge–Tate numbers
at every embedding. -/
def IsRegularAlgebraic (l : ℕ) (r : Gal F →ₜ* GL (Fin n) E) : Prop :=
  IsUnramifiedAlmostEverywhere r.toMonoidHom ∧
    ∀ w : Place F, w.Above l → ∃ H : (w.Fv →+* E) → Multiset ℤ,
      HasHodgeTate (resPlace r w) H ∧ ∀ τ, (H τ).Nodup

/-- The Hodge–Tate numbers `{λ_{τ,i} + n - i}` attached to a weight (BLGGT14 Theorem 2.1.1(3)),
with indices starting at `0`. -/
def weightHT (lam : (F →+* E) → Fin n → ℤ) (τ : F →+* E) : Multiset ℤ :=
  (Finset.univ : Finset (Fin n)).val.map fun i => lam τ i + ((n : ℤ) - 1 - (i : ℤ))

/-- The labelled Hodge–Tate weights at a place `w` given by a family indexed by the embeddings of
`F`. -/
def localHT (H : (F →+* E) → Multiset ℤ) (w : Place F) : (w.Fv →+* E) → Multiset ℤ :=
  fun τ => H (τ.comp w.emb)

/-- The complex conjugation of a CM field, as a ring homomorphism. -/
def cmConj (F : Type) [Field F] [NumberField F] [IsCMField F] : F →+* F :=
  ((IsCMField.complexConj F : F ≃ₐ[maximalRealSubfield F] F) : F →+* F)

/-- A character `μ` of `G_{F⁺}` with values in `𝒪[E]^×` is de Rham above `l` with all Hodge–Tate
numbers equal to `w`. -/
def HasParallelWeight (l : ℕ) (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ) (w : ℤ) : Prop :=
  ∀ v : Place F⁺, v.Above l → HasHodgeTate (resPlace (charRep (genericChar μ)) v) fun _ => {w}

/-- A family `H_τ` of sets of `n` integers with `H_{τ∘c} = {w - h : h ∈ H_τ}` (BLGGT14 §2.4). -/
def IsSelfDualHodgeType [IsCMField F] (H : (F →+* E) → Finset ℤ) (n : ℕ) (w : ℤ) : Prop :=
  ∀ τ : F →+* E, (H τ).card = n ∧
    ∀ h : ℤ, h ∈ H (τ.comp (cmConj F)) ↔ ∃ h' ∈ H τ, h = w - h'

/-- BLGGT14 §1.4: a representation of a local Galois group is ordinary, i.e. ordinary of some
dominant weight in the sense of `IsOrdinaryOfWeightAt`. -/
def IsOrdinaryAt {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ρ : Gal K →ₜ* GL (Fin n) E) : Prop :=
  ∃ lam : (K →+* E) → Fin n → ℤ, (∀ τ, Antitone (lam τ)) ∧ IsOrdinaryOfWeightAt ρ lam

/-- The image `r̄(G_{F(ζ_l)})` as a subgroup of `GL_n(k)`. -/
def imageCyclo (l : ℕ) {k : Type*} [Field k] (rbar : Gal F →* GL (Fin n) k) :
    Subgroup (GL (Fin n) k) :=
  (resFieldHom rbar (algebraMap F (CyclotomicField l F))).range

/-- `r̄(G_{F(ζ_l)})` is adequate, in the sense of Thorne 2012, Definition 2.3, or in the sense of
Thorne 2017, Definition 2.20 (allowed by Thorne 2017, Proposition 7.2 and Corollary 7.3). -/
def HasAdequateImage (l : ℕ) {k : Type*} [Field k] (rbar : Gal F →* GL (Fin n) k) : Prop :=
  (adequate k n).Holds (imageCyclo l rbar) ∨ (ghtAdequate k n).Holds (imageCyclo l rbar)

/-- A closed subgroup `P` of a profinite group is pro-`l`: every open normal subgroup of `P` has
index a power of `l`. -/
def IsProLSubgroup (l : ℕ) {G : Type*} [Group G] [TopologicalSpace G] (P : Subgroup G) : Prop :=
  IsClosed (P : Set G) ∧
    ∀ U : Subgroup P, U.Normal → IsOpen (U : Set P) → ∃ m : ℕ, U.index = l ^ m

/-- The closed subgroup generated by all pro-`l` subgroups, equivalently by all Sylow pro-`l`
subgroups. -/
def sylowClosure (l : ℕ) (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    Subgroup G :=
  (⨆ P : {P : Subgroup G // IsProLSubgroup l P}, (P : Subgroup G)).topologicalClosure

/-- The integer `d` of BLGGT14 Propositions 3.2.1, 4.1.1 and Theorem 4.2.1: the largest dimension
of an irreducible constituent, over an algebraic closure of `k`, of the restriction of `r̄` to the
closed subgroup of `G_F` generated by all Sylow pro-`l` subgroups. For `l` odd and `F` imaginary
CM this is also the closed subgroup of `G_{F⁺}` generated by its Sylow pro-`l` subgroups. -/
def sylowConstituentDim (l : ℕ) {k : Type*} [Field k] (rbar : Gal F →* GL (Fin n) k) : ℕ :=
  sSup {d : ℕ | ∃ W₁ W₂ : Submodule (AlgebraicClosure k) (Fin n → AlgebraicClosure k),
    let ρ : Gal F → GL (Fin n) (AlgebraicClosure k) := fun g =>
      Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k)) (rbar g)
    let S : Set (Gal F) := (sylowClosure l (Gal F) : Set (Gal F))
    IsStableUnder S ρ W₁ ∧ IsStableUnder S ρ W₂ ∧ W₁ < W₂ ∧
    (∀ W, IsStableUnder S ρ W → W₁ ≤ W → W ≤ W₂ → W = W₁ ∨ W = W₂) ∧
    d + Module.finrank (AlgebraicClosure k) W₁ = Module.finrank (AlgebraicClosure k) W₂}

/-- The residual pair `(r̄, μ̄)` is automorphic through `π`:
`(r̄, μ̄) ≅ (r̄_{l,ι}(π), r̄_{l,ι}(χ) ε̄_l^{1-n})` (BLGGT14 §2.1). -/
def IsResiduallyAutomorphicVia (ι : E →+* ℂ) (rbar : Gal F →* GL (Fin n) 𝓀[E])
    (μbar : Gal F⁺ →* (𝓀[E])ˣ) (π : RACP F n) : Prop :=
  Conj (rbar : Gal F → GL (Fin n) 𝓀[E]) (π.residualRep ι) ∧
    ∀ σ, μbar σ = redChar (multiplierInt π ι * cycloInt E F⁺ ^ (1 - (n : ℤ))) σ

/-- The residual pair is automorphic. -/
def IsResiduallyAutomorphic (ι : E →+* ℂ) (rbar : Gal F →* GL (Fin n) 𝓀[E])
    (μbar : Gal F⁺ →* (𝓀[E])ˣ) : Prop :=
  ∃ π : RACP F n, IsResiduallyAutomorphicVia ι rbar μbar π

/-- The residual pair is ordinarily automorphic: automorphic through an `ι`-ordinary `π`. -/
def IsResiduallyOrdinarilyAutomorphic (ι : E →+* ℂ) (rbar : Gal F →* GL (Fin n) 𝓀[E])
    (μbar : Gal F⁺ →* (𝓀[E])ˣ) : Prop :=
  ∃ π : RACP F n, IsResiduallyAutomorphicVia ι rbar μbar π ∧
    (iotaOrdinary F E n ι).Holds π.toRegAlg

/-- The residual pair is potentially diagonalizably automorphic: automorphic through a `π` of
level potentially prime to `l` with `r_{l,ι}(π)` potentially diagonalizable above `l`. -/
def IsResiduallyPotentiallyDiagonalizablyAutomorphic (l : ℕ) [ResChar E l] (ι : E →+* ℂ)
    (rbar : Gal F →* GL (Fin n) 𝓀[E]) (μbar : Gal F⁺ →* (𝓀[E])ˣ) : Prop :=
  ∃ π : RACP F n, IsResiduallyAutomorphicVia ι rbar μbar π ∧
    (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg ∧
    ∀ (v : Place F) (_ : ResChar v.Fv l),
      IsPotentiallyDiagonalizableRat (resPlace (π.galoisRep ι) v)

/-- A place of `F` is split over `F⁺`: `F⁺` is dense in its completion, i.e. `F⁺_v = F_w`. -/
def IsSplitOverPlus (w : Place F) : Prop :=
  DenseRange (w.emb.comp (algebraMap (maximalRealSubfield F) F))

/-- `S̃` is a set of chosen places of `F`, one above each place of a finite set `S` of finite
places of `F⁺` that split in `F`. -/
def IsChosenSplitSet (S : Finset (Place F)) : Prop :=
  (∀ w ∈ S, IsSplitOverPlus w) ∧
    ∀ w ∈ S, ∀ w' ∈ S, (∃ v : Place F⁺, Place.LiesOver w v ∧ Place.LiesOver w' v) → w = w'

/-- The place `v` of `F⁺` belongs to `S`, the set of places below the chosen places `S̃`. -/
def MemBelow (S : Finset (Place F)) (v : Place F⁺) : Prop := ∃ w ∈ S, Place.LiesOver w v

/-- The place `u` of `F` lies above a place of `S`. -/
def MemAbove (S : Finset (Place F)) (u : Place F) : Prop :=
  ∃ v : Place F⁺, Place.LiesOver u v ∧ MemBelow S v

/-- The restriction of a lattice to a place, as a lift of the restriction of its reduction. -/
def localLift (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) (w : Place F) :
    Lift (resPlaceHom (reduction ρ.toMonoidHom) w) :=
  ⟨resPlace ρ w, rfl⟩

/-- `q` is an irreducible component of `Spec (R/I)[1/l]`: a minimal prime over `I` not containing
`l`. Its quotient `R/q` is the corresponding reduced `l`-torsion-free quotient. -/
def IsComponent {R : Type*} [CommRing R] (I : Ideal R) (l : ℕ) (q : Ideal R) : Prop :=
  q ∈ I.minimalPrimes ∧ (l : R) ∉ q

/-- The condition on `C_v` in Thorne 2012, Theorem 10.1, at a chosen place `w = ṽ`: `C` is an
irreducible component of `Spec R̄^□_w[1/l]` if `w ∤ l`, and of `Spec R^{λ,cr}_w[1/l]` if `w | l`,
which contains `ρ|G_{F_w}`, no other component containing it. -/
def IsIsolatedComponent (l : ℕ) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (lam : (F →+* E) → Fin n → ℤ) (w : Place F)
    (C : Ideal (LiftingRing w.Fv E (resPlaceHom (reduction ρ.toMonoidHom) w))) : Prop :=
  (¬ w.Above l → IsComponent ⊥ l C ∧ C ≤ Lift.prime (localLift ρ w) ∧
    OnUniqueComponent ⊥ l (Lift.prime (localLift ρ w))) ∧
  (w.Above l →
    IsComponent (crystallineIdeal (resPlaceHom (reduction ρ.toMonoidHom) w)
        (localHT (weightHT lam) w) (RingHom.id w.Fv)) l C ∧
      C ≤ Lift.prime (localLift ρ w) ∧
      OnUniqueComponent (crystallineIdeal (resPlaceHom (reduction ρ.toMonoidHom) w)
        (localHT (weightHT lam) w) (RingHom.id w.Fv)) l
        (Lift.prime (localLift ρ w)))

/-- The universal property of `R^univ_𝒮` (GlobalGaloisDeformations G7/polarized-representability):
for every complete local Noetherian `𝒪`-algebra `A` with residue field `k`, the lifts of type
`𝒮` classified by the `𝒪`-algebra maps `R^univ_𝒮 → A` represent the lifts of type `𝒮` to `A` up
to strict equivalence, each class exactly once. -/
def DefProblem.IsRepresentable [IsCMField F] (S : DefProblem F E n 𝒪[E]) : Prop :=
  ∀ (A : Type) [CommRing A] [Algebra 𝒪[E] A] [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A],
    Function.Surjective ((IsLocalRing.residue A).comp (algebraMap 𝒪[E] A)) →
    (∀ f : S.univRing →ₐ[𝒪[E]] A, (S.lifts A).Holds (S.liftOf f)) ∧
    ∀ r : Gal F⁺ →* CHT n A, (S.lifts A).Holds r →
      ∃! f : S.univRing →ₐ[𝒪[E]] A, CHT.StrictEquiv (r : Gal F⁺ → CHT n A) (S.liftOf f)

/-- A finite flat complete intersection over `𝒪`: finite free as an `𝒪`-module and of the form
`𝒪⟦x₁, …, x_g⟧/(f₁, …, f_g)`. -/
def IsFiniteFlatCompleteIntersection (O R : Type*) [CommRing O] [CommRing R] [Algebra O R] :
    Prop :=
  Module.Finite O R ∧ Module.Free O R ∧ ∃ (g : ℕ) (f : Fin g → MvPowerSeries (Fin g) O),
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin g) O ⧸ Ideal.span (Set.range f)))

end Auxiliary

section CoefficientExtension

variable {E E' : Type} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E] [Field E'] [ValuativeRel E'] [TopologicalSpace E']
  [IsNonarchimedeanLocalField E']

/-- The map `𝒪[E] → 𝒪[E']` induced by an embedding of coefficient fields; a field homomorphism
between non-archimedean local fields maps integers to integers. -/
def coeffInt (j : E →+* E') : 𝒪[E] →+* 𝒪[E'] :=
  (j.comp (algebraMap 𝒪[E] E)).codRestrict 𝒪[E'] (by sorry)

/-- The map `𝓀[E] → 𝓀[E']` induced by an embedding of coefficient fields. -/
def coeffRes (j : E →+* E') : 𝓀[E] →+* 𝓀[E'] :=
  Ideal.Quotient.lift _ ((IsLocalRing.residue 𝒪[E']).comp (coeffInt j)) (by sorry)

/-- Extension of the coefficients of a lattice-valued representation. -/
def coeffLattice {G : Type*} [Monoid G] [TopologicalSpace G] {n : ℕ} (j : E →+* E')
    (ρ : G →ₜ* GL (Fin n) 𝒪[E]) : G →ₜ* GL (Fin n) 𝒪[E'] where
  toMonoidHom := (Matrix.GeneralLinearGroup.map (coeffInt j)).comp ρ.toMonoidHom
  continuous_toFun := by sorry

/-- Extension of the coefficients of a residual representation. -/
def coeffResidual {G : Type*} [Monoid G] {n : ℕ} (j : E →+* E') (ρ : G →* GL (Fin n) 𝓀[E]) :
    G →* GL (Fin n) 𝓀[E'] :=
  (Matrix.GeneralLinearGroup.map (coeffRes j)).comp ρ

/-- The ramification index of the coefficient ring: the exponent of the maximal ideal in `(p)`. -/
def coeffRamificationIndex (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (p : ℕ) : ℕ :=
  sSup {m : ℕ | (p : 𝒪[E]) ∈ IsLocalRing.maximalIdeal 𝒪[E] ^ m}

end CoefficientExtension

end Lifting

/-! ## PL.4: automorphy lifting theorems and finiteness of deformation rings -/

section PL4

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

local notation "F⁺" => maximalRealSubfield F

/-! ### PL.4/minimal-automorphy-lifting: Minimal automorphy lifting with adequate residual image -/

/-- Hypothesis (vi) of Thorne 2012, Theorem 7.1: `(ρ', μ')` and the polarized cuspidal `(π, χ)`,
potentially unramified above `l`, form a seed for `(ρ, μ)`. (a) `ρ' ⊗ E ≅ r_{l,ι}(π)`;
(b) `μ' = r_{l,ι}(χ)`; (c) `(ρ̄, μ̄) = (ρ̄', μ̄')`; (d) at every place `w ∤ l` of `F`, either
`π_w` and `ρ|G_{F_w}` are both unramified or `ρ'|G_{F_w} ⇝ ρ|G_{F_w}`;
(e) `ρ'|G_{F_w} ∼ ρ|G_{F_w}` at every `w | l`. -/
def Lifting.IsMinimalSeed (l : ℕ) [ResChar E l] (ι : E →+* ℂ) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ) (ρ' : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ' : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (π : RACP F n) : Prop :=
  (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg ∧
  Conj (Lifting.genericG ρ' : Gal F → GL (Fin n) E) (π.galoisRep ι) ∧
  μ' = Lifting.multiplierInt π ι ∧
  reduction ρ.toMonoidHom = reduction ρ'.toMonoidHom ∧ Lifting.redChar μ = Lifting.redChar μ' ∧
  (∀ (w : Place F) (p : ℕ) (_ : ResChar w.Fv p), p.Prime → p ≠ l →
    ((unramifiedIrrep w.Fv n).Holds (π.component w) ∧
        IsUnramified (resPlace ρ w).toMonoidHom) ∨
      StronglyConnects (resPlace ρ' w) (resPlace ρ w)) ∧
  ∀ (w : Place F) (_ : ResChar w.Fv l), Connects (resPlace ρ' w) (resPlace ρ w)

/-- **PL.4/minimal-automorphy-lifting** (Thorne 2012, Theorem 7.1; with Thorne 2017,
Corollary 7.3 for adequacy in the sense of Definition 2.20). `F` imaginary CM, `l` odd,
`ρ : G_F → GL_n(𝒪)` and `μ : G_{F⁺} → 𝒪^×` (the Hecke multiplier of Thorne 2012) with
(i) `ρ^c ≅ ρ^∨ ε^{1-n} μ|G_F`, (ii) `μ(c_v)` independent of `v | ∞`, (iii) `ρ` ramified at finitely
many places, (iv) `ρ̄` absolutely irreducible with `ρ̄(G_{F(ζ_l)})` adequate, (v) `ζ_l ∉ F`,
(vi) a seed. Then, in the full-multiplier convention of PL.0, the polarized pair
`(ρ, ε^{1-n} μ)` is automorphic; it is automorphic of level prime to `l` if moreover `π` is
unramified above `l` and `ρ` is crystalline above `l`. -/
theorem minimal_automorphy_lifting [IsCMField F] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (hn : 1 ≤ n) (ι : E →+* ℂ)
    (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (h_i : Lifting.IsConjugateSelfDual ⇑(Lifting.genericG ρ) fun σ =>
      Lifting.genericChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * μ) (Lifting.toPlus F σ))
    (h_ii : ∀ v v' : InfinitePlace F⁺, μ (Lifting.complexConj v) = μ (Lifting.complexConj v'))
    (h_iii : Lifting.IsUnramifiedAlmostEverywhere ρ.toMonoidHom)
    (h_iv : IsAbsIrred ⇑(reduction ρ.toMonoidHom) ∧
      Lifting.HasAdequateImage l (reduction ρ.toMonoidHom))
    (h_v : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (ρ' : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ' : Gal F⁺ →ₜ* (𝒪[E])ˣ) (π : RACP F n)
    (h_vi : Lifting.IsMinimalSeed l ι ρ μ ρ' μ' π) :
    IsAutomorphic ι (Lifting.genericG ρ)
        (Lifting.genericChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * μ)) ∧
      ((∀ w : Place F, w.Above l → (unramifiedIrrep w.Fv n).Holds (π.component w)) →
        (∀ w : Place F, w.Above l → (crystalline w.Fv E n).Holds (genericC (resPlace ρ w))) →
        IsAutomorphicOfLevelPrimeTo l ι (Lifting.genericG ρ)
          (Lifting.genericChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * μ))) := by
  sorry

/-- **PL.4/minimal-automorphy-lifting**, in the form of BLGGT14 Theorem 2.3.1. `F` imaginary CM,
`l` odd, `ζ_l ∉ F`, `(r, μ)` an `n`-dimensional algebraic polarized `l`-adic representation (`μ`
the full multiplier) with `r̄` irreducible and `r̄(G_{F(ζ_l)})` adequate, and `(r̄, μ̄)` automorphic
of level potentially prime to `l`, arising from a `(π, χ)` of level potentially prime to `l` with
`r_{l,ι}(π)|G_{F_v} ∼ r|G_{F_v}` at every finite place `v` (`ρπ` is an invariant lattice of
`r_{l,ι}(π)`). Then `(r, μ)` is automorphic of level potentially prime to `l`, and of level prime
to `l` if `π` has level prime to `l` and `r` is crystalline above `l`. -/
theorem minimal_automorphy_lifting_blggt [IsCMField F] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (hn : 1 ≤ n) (ι : E →+* ℂ) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (r : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (hpol : Lifting.IsPolarized ⇑(Lifting.genericG r) ⇑(Lifting.genericChar μ))
    (halg : Lifting.IsAlgebraic l (Lifting.genericG r))
    (h1 : IsAbsIrred ⇑(reduction r.toMonoidHom) ∧
      Lifting.HasAdequateImage l (reduction r.toMonoidHom))
    (π : RACP F n) (hπl : (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg)
    (hπ : Lifting.IsResiduallyAutomorphicVia ι (reduction r.toMonoidHom) (Lifting.redChar μ) π)
    (ρπ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hρπ : Conj (Lifting.genericG ρπ : Gal F → GL (Fin n) E) (π.galoisRep ι))
    (h2 : ∀ (w : Place F) (p : ℕ) (_ : ResChar w.Fv p), p.Prime →
      Connects (resPlace ρπ w) (resPlace r w)) :
    IsAutomorphicOfLevelPotentiallyPrimeTo l ι (Lifting.genericG r) (Lifting.genericChar μ) ∧
      ((∀ w : Place F, w.Above l → (unramifiedIrrep w.Fv n).Holds (π.component w)) →
        (∀ w : Place F, w.Above l → (crystalline w.Fv E n).Holds (genericC (resPlace r w))) →
        IsAutomorphicOfLevelPrimeTo l ι (Lifting.genericG r) (Lifting.genericChar μ)) := by
  sorry

/-! ### PL.4/strongly-residually-odd: Strong residual oddness at a real place (p = 2) -/

/-- **PL.4/strongly-residually-odd** (Thorne 2017, Definition 3.3). The pair `(ρ̄, μ̄)` is strongly
residually odd at the infinite place `v` of `F⁺`: `ρ̄` extends to `r̄ : G_{F⁺} → 𝒢_n(k)` with
`ν ∘ r̄ = μ̄`, and `r̄(c_v)` is `GL_n(k)`-conjugate to `(1_n, 1) j`. The source defines the notion
for `k` perfect of characteristic `2`, `n` even, `F` imaginary CM and `(ρ̄, μ̄)` polarized with `ρ̄`
absolutely irreducible; under these hypotheses it depends neither on `r̄` nor on `c_v`
(`IsStronglyResiduallyOdd.indep_extension`). It is used in no other case. -/
def IsStronglyResiduallyOdd {k : Type*} [Field k] (ρbar : Gal F →* GL (Fin n) k)
    (μbar : Gal F⁺ →* kˣ) (v : InfinitePlace F⁺) : Prop :=
  ∃ rt : Gal F⁺ →* CHT n k, Lifting.CHT.Extends (rt : Gal F⁺ → CHT n k) ρbar ∧
    (∀ τ, CHT.nu n k (rt τ) = μbar τ) ∧
    Lifting.CHT.IsGLConjTo (rt (Lifting.complexConj v)) 1

/-- The condition does not depend on the choice of the `𝒢_n`-valued extension `r̄` with multiplier
`μ̄`, nor on `c_v` within its conjugacy class (Thorne 2017, Lemmas 2.2 and 2.16). -/
theorem IsStronglyResiduallyOdd.indep_extension [IsCMField F] {k : Type*} [Field k] [CharP k 2]
    [PerfectField k] (hn : Even n) {ρbar : Gal F →* GL (Fin n) k} {μbar : Gal F⁺ →* kˣ}
    (hcont : IsContinuousResidual ρbar) (hirr : IsAbsIrred ⇑ρbar) (v : InfinitePlace F⁺)
    (rt : Gal F⁺ →* CHT n k) (hrt : IsContinuousResidual rt)
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n k) ρbar)
    (hν : ∀ τ, CHT.nu n k (rt τ) = μbar τ) (g : Gal F⁺) :
    IsStronglyResiduallyOdd ρbar μbar v ↔
      Lifting.CHT.IsGLConjTo (rt (g * Lifting.complexConj v * g⁻¹)) 1 := by
  sorry

/-- For `k` perfect of characteristic `2`, `r̄(c_v) = (A, 1) j` with `A` symmetric. For `n ≥ 2`
even it is `GL_n(k)`-conjugate to exactly one of `(1_n, 1) j` and `(Ψ_n, 1) j`, according as the
symmetric form `A` is not, or is, alternating; for `n` odd it is always conjugate to `(1_n, 1) j`
(Thorne 2017, Lemma 2.16 and §3.1). -/
theorem complexConjugation_dichotomy [IsCMField F] {k : Type*} [Field k] [CharP k 2]
    [PerfectField k] (rt : Gal F⁺ →* CHT n k) (hrt : IsContinuousResidual rt)
    (hpre : ∀ τ, rt τ ∈ CHT.conn n k ↔ τ ∈ Set.range (Lifting.toPlus F))
    (v : InfinitePlace F⁺) :
    ∃ A : GL (Fin n) k,
      rt (Lifting.complexConj v) = Lifting.CHT.incl n k (A, 1) * Lifting.CHT.j n k ∧
      (A : Matrix (Fin n) (Fin n) k)ᵀ = A ∧
      (Odd n → Lifting.CHT.IsGLConjTo (rt (Lifting.complexConj v)) 1) ∧
      (Even n → 2 ≤ n →
        (Lifting.CHT.IsGLConjTo (rt (Lifting.complexConj v)) 1 ↔
          ∃ i, (A : Matrix (Fin n) (Fin n) k) i i ≠ 0) ∧
        (Lifting.CHT.IsGLConjTo (rt (Lifting.complexConj v)) (Lifting.antidiagonal n k) ↔
          ∀ i, (A : Matrix (Fin n) (Fin n) k) i i = 0)) := by
  sorry

/-- If `r : G_{F⁺} → 𝒢_n(𝒪)` (`p = 2`, `n` even) has `ρ̄` absolutely irreducible, where
`ρ = r|G_F` and `μ = ν ∘ r`, and `(ρ̄, μ̄)` is strongly residually odd at `v`, then
`μ(c_v) = -1` (Thorne 2017, Lemma 3.4). -/
theorem IsStronglyResiduallyOdd.mu_neg_one [IsCMField F] [ResChar E 2] (hn : Even n)
    (r : Gal F⁺ →* CHT n 𝒪[E]) (ρ : Gal F →* GL (Fin n) 𝒪[E])
    (hext : Lifting.CHT.Extends (r : Gal F⁺ → CHT n 𝒪[E]) ρ)
    (hirr : IsAbsIrred ⇑(reduction ρ)) (v : InfinitePlace F⁺)
    (hodd : IsStronglyResiduallyOdd (reduction ρ)
      ((CHT.nu n 𝓀[E]).comp (Lifting.CHT.reduction r)) v) :
    CHT.nu n 𝒪[E] (r (Lifting.complexConj v)) = -1 := by
  sorry

/-- Let `k` be a finite field of characteristic `2`, `σ : G_{F⁺} → GL₂(k)` continuous with
`σ|G_F` absolutely irreducible, `ψ : G_F → k^×` with `ψ ψ^c = ε̄ · det σ` and
`ρ̄ = σ|G_F ⊗ ψ⁻¹`. Then `(ρ̄, ε̄⁻¹)` is polarized, and it is strongly residually odd at `v` if and
only if `σ(c_v) ≠ 1` (Thorne 2017, Lemma 3.5). In characteristic `2` the mod `2` cyclotomic
character `ε̄` is trivial, so the multiplier is written `1`. -/
theorem isStronglyResiduallyOdd_rank_two_iff [IsCMField F] {k : Type} [Field k] [Finite k]
    [CharP k 2] (σ : Gal F⁺ →* GL (Fin 2) k) (hσ : IsContinuousResidual σ)
    (hirr : IsAbsIrred ⇑(σ.comp (Lifting.toPlus F).toMonoidHom)) (ψ : Gal F →* kˣ)
    (hψc : IsContinuousResidual ψ)
    (hψ : ∀ (c : Gal F⁺) (δ δ' : Gal F), c ∉ Set.range (Lifting.toPlus F) →
      Lifting.toPlus F δ' = c * Lifting.toPlus F δ * c⁻¹ →
      ((ψ δ * ψ δ' : kˣ) : k) = (σ (Lifting.toPlus F δ) : Matrix (Fin 2) (Fin 2) k).det)
    (ρbar : Gal F →* GL (Fin 2) k)
    (hρ : ∀ δ, (ρbar δ : Matrix (Fin 2) (Fin 2) k) =
      (((ψ δ)⁻¹ : kˣ) : k) • (σ (Lifting.toPlus F δ) : Matrix (Fin 2) (Fin 2) k)) :
    Lifting.IsPolarized ⇑ρbar (fun _ => (1 : kˣ)) ∧
      ∀ v : InfinitePlace F⁺,
        IsStronglyResiduallyOdd ρbar 1 v ↔ σ (Lifting.complexConj v) ≠ 1 := by
  sorry

/- For `n = 2`, `k = 𝔽₂`, `ψ = 1` (which satisfies `ψ ψ^c = ε̄ · det σ = 1`) and
`σ(c_v) = (1 1; 0 1)`: the matrix `A = σ(c_v) J⁻¹ = (1 1; 1 0)` is symmetric and not alternating,
so `(σ|G_F, 1)` is strongly residually odd at `v`. -/
-- test: sro_rank_two_nontrivial
example [IsCMField F] (σ : Gal F⁺ →* GL (Fin 2) (ZMod 2)) (hσ : IsContinuousResidual σ)
    (hirr : IsAbsIrred ⇑(σ.comp (Lifting.toPlus F).toMonoidHom)) (v : InfinitePlace F⁺)
    (hv : (σ (Lifting.complexConj v) : Matrix (Fin 2) (Fin 2) (ZMod 2)) = !![1, 1; 0, 1]) :
    (!![1, 1; 0, 1] * !![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) (ZMod 2)) = !![1, 1; 1, 0] ∧
      IsStronglyResiduallyOdd (σ.comp (Lifting.toPlus F).toMonoidHom) 1 v := by
  sorry

/- For `n = 2`, `k` finite of characteristic `2` and `σ`, `ψ` as in Lemma 3.5 with
`σ(c_v) = 1`: `A = J⁻¹ = Ψ₂` is alternating, so `(σ|G_F ⊗ ψ⁻¹, ε̄⁻¹)` is not strongly residually
odd at `v`. -/
-- test: sro_rank_two_trivial
example [IsCMField F] {k : Type} [Field k] [Finite k] [CharP k 2] (σ : Gal F⁺ →* GL (Fin 2) k)
    (hσ : IsContinuousResidual σ)
    (hirr : IsAbsIrred ⇑(σ.comp (Lifting.toPlus F).toMonoidHom)) (ψ : Gal F →* kˣ)
    (hψc : IsContinuousResidual ψ)
    (hψ : ∀ (c : Gal F⁺) (δ δ' : Gal F), c ∉ Set.range (Lifting.toPlus F) →
      Lifting.toPlus F δ' = c * Lifting.toPlus F δ * c⁻¹ →
      ((ψ δ * ψ δ' : kˣ) : k) = (σ (Lifting.toPlus F δ) : Matrix (Fin 2) (Fin 2) k).det)
    (ρbar : Gal F →* GL (Fin 2) k)
    (hρ : ∀ δ, (ρbar δ : Matrix (Fin 2) (Fin 2) k) =
      (((ψ δ)⁻¹ : kˣ) : k) • (σ (Lifting.toPlus F δ) : Matrix (Fin 2) (Fin 2) k))
    (v : InfinitePlace F⁺) (hv : σ (Lifting.complexConj v) = 1) :
    ¬ IsStronglyResiduallyOdd ρbar 1 v := by
  sorry

/- If `(ρ̄, μ̄)` is strongly residually odd at `v`, then every lift `r` with absolutely irreducible
`ρ̄` has `μ(c_v) = -1`. -/
-- test: sro_lift_sign
example [IsCMField F] [ResChar E 2] (hn : Even n) (ρbar : Gal F →* GL (Fin n) 𝓀[E])
    (hcont : IsContinuousResidual ρbar) (hirr : IsAbsIrred ⇑ρbar) (μbar : Gal F⁺ →* (𝓀[E])ˣ)
    (v : InfinitePlace F⁺) (hodd : IsStronglyResiduallyOdd ρbar μbar v) :
    ∀ (r : Gal F⁺ →* CHT n 𝒪[E]) (ρ : Gal F →* GL (Fin n) 𝒪[E]),
      Lifting.CHT.Extends (r : Gal F⁺ → CHT n 𝒪[E]) ρ → reduction ρ = ρbar →
      (CHT.nu n 𝓀[E]).comp (Lifting.CHT.reduction r) = μbar →
      CHT.nu n 𝒪[E] (r (Lifting.complexConj v)) = -1 := by
  sorry

/- For `n` odd, or `p` odd, the condition is not defined by the source, and hypothesis (v) of
Thorne 2017, Theorem 5.1, in the form in which `two_adic_automorphy_lifting` states it, imposes
nothing. -/
-- test: sro_odd_n_irrelevant
example [IsCMField F] {p : ℕ} (ρbar : Gal F →* GL (Fin n) 𝓀[E])
    (hcont : IsContinuousResidual ρbar) (h : p ≠ 2 ∨ ¬ Even n) :
    p = 2 → Even n → ∃ v : InfinitePlace F⁺, IsStronglyResiduallyOdd ρbar
      (Lifting.redChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * Lifting.deltaInt F E ^ n)) v := by
  sorry

/-! ### PL.4/two-adic-automorphy-lifting: Automorphy lifting for every prime p, including p = 2
and p | n -/

/-- **PL.4/two-adic-automorphy-lifting** (Thorne 2017, Theorem 5.1). `n ≥ 2`, `F` imaginary CM,
`p` any prime, `ρ : G_F → GL_n(Q̄_p)` continuous (through an invariant lattice) with
(i) `ρ^c ≅ ρ^∨ ε^{1-n}`; (ii) `ρ̄(G_{F(ζ_p)})` adequate in the sense of Thorne 2017,
Definition 2.20; (iii) `ρ` almost everywhere unramified; (iv) a RACSDC `π` with `r̄_ι(π) ≅ ρ̄` and
`r_ι(π)|G_{F_v} ∼ ρ|G_{F_v}` at every finite place `v` (`ρπ` an invariant lattice of `r_ι(π)`);
(v) if `p = 2` and `n` is even, `(ρ̄, ε^{1-n} δ^n_{F/F⁺})` is strongly residually odd at some
`v | ∞`. Then `ρ ≅ r_ι(Π)` for a RACSDC `Π`. No hypothesis `ζ_p ∉ F` is made. -/
theorem two_adic_automorphy_lifting [IsCMField F] {p : ℕ} [ResChar E p] (hp : p.Prime)
    (hn : 2 ≤ n) (ι : E →+* ℂ) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (h_i : Lifting.IsConjugateSelfDual ⇑(Lifting.genericG ρ) fun σ =>
      Lifting.genericChar (Lifting.cycloInt E F ^ (1 - (n : ℤ))) σ)
    (h_ii : (ghtAdequate 𝓀[E] n).Holds (Lifting.imageCyclo p (reduction ρ.toMonoidHom)))
    (h_iii : Lifting.IsUnramifiedAlmostEverywhere ρ.toMonoidHom)
    (π : RACP F n) (hπ : (Lifting.racsdc F n).Holds π)
    (hπbar : Conj (reduction ρ.toMonoidHom : Gal F → GL (Fin n) 𝓀[E]) (π.residualRep ι))
    (ρπ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hρπ : Conj (Lifting.genericG ρπ : Gal F → GL (Fin n) E) (π.galoisRep ι))
    (h_iv : ∀ (w : Place F) (q : ℕ) (_ : ResChar w.Fv q), q.Prime →
      Connects (resPlace ρπ w) (resPlace ρ w))
    (h_v : p = 2 → Even n → ∃ v : InfinitePlace F⁺,
      IsStronglyResiduallyOdd (reduction ρ.toMonoidHom)
        (Lifting.redChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * Lifting.deltaInt F E ^ n)) v) :
    ∃ π' : RACP F n, (Lifting.racsdc F n).Holds π' ∧
      Conj (Lifting.genericG ρ : Gal F → GL (Fin n) E) (π'.galoisRep ι) := by
  sorry

/-! ### PL.4/relaxed-adequacy: Adequacy relaxed to the vanishing of H¹(H, ad) -/

/-- `e` is the `σ`-equivariant projection of `k^n` onto the `α`-eigenspace of `σ`: an idempotent
commuting with `σ` whose image is the kernel of `σ - α`. For semisimple `σ` it is unique; it is
the element `e_{σ,α}` of Thorne 2017, Definition 2.20. -/
def Lifting.IsEigenProjection {k : Type*} [Field k] (σ e : Matrix (Fin n) (Fin n) k) (α : k) :
    Prop :=
  e * e = e ∧ e * σ = σ * e ∧ (σ - α • (1 : Matrix (Fin n) (Fin n) k)) * e = 0 ∧
    ∀ x : Fin n → k, (σ - α • (1 : Matrix (Fin n) (Fin n) k)).mulVec x = 0 → e.mulVec x = x

/-- `W ⊂ ad = M_n(k)` is stable under conjugation by `H`. -/
def Lifting.IsAdStable {k : Type*} [Field k] (H : Subgroup (GL (Fin n) k))
    (W : Submodule k (Matrix (Fin n) (Fin n) k)) : Prop :=
  ∀ h ∈ H, ∀ w ∈ W,
    (h : Matrix (Fin n) (Fin n) k) * w * ((h⁻¹ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) ∈ W

/-- `W ⊂ ad` is a simple `k[H]`-submodule. -/
def Lifting.IsSimpleAdSubmodule {k : Type*} [Field k] (H : Subgroup (GL (Fin n) k))
    (W : Submodule k (Matrix (Fin n) (Fin n) k)) : Prop :=
  W ≠ ⊥ ∧ Lifting.IsAdStable H W ∧
    ∀ W' : Submodule k (Matrix (Fin n) (Fin n) k), W' ≤ W → Lifting.IsAdStable H W' →
      W' = ⊥ ∨ W' = W

/-- **PL.4/relaxed-adequacy**: a finite subgroup `H ⊂ GL_n(k)`, `k` containing the eigenvalues of
the elements of `H`, is relaxed-adequate if `H¹(H, k) = 0` (no non-zero homomorphism `H → k`),
`H¹(H, ad) = 0` (every crossed homomorphism `H → M_n(k)` for the conjugation action is principal),
and for each simple `k[H]`-submodule `W ⊂ ad` there are a semisimple `σ ∈ H` and an eigenvalue
`α ∈ k` of `σ` with `tr e_{σ,α} W ≠ 0`. This is Thorne 2017, Definition 2.20 with
`H¹(H, ad₀) = 0` weakened to `H¹(H, ad) = 0` (Boxer–Calegari–Gee, proof of Theorem 3.1). -/
def Lifting.IsRelaxedAdequate {k : Type*} [Field k] (H : Subgroup (GL (Fin n) k)) : Prop :=
  Finite H ∧
  (∀ h ∈ H, (h : Matrix (Fin n) (Fin n) k).charpoly.Splits) ∧
  (∀ f : H →* Multiplicative k, f = 1) ∧
  (∀ c : H → Matrix (Fin n) (Fin n) k,
    (∀ g h : H, c (g * h) = c g + (g.1 : Matrix (Fin n) (Fin n) k) * c h *
      ((g.1⁻¹ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)) →
    ∃ X : Matrix (Fin n) (Fin n) k, ∀ g : H, c g = (g.1 : Matrix (Fin n) (Fin n) k) * X *
      ((g.1⁻¹ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) - X) ∧
  ∀ W : Submodule k (Matrix (Fin n) (Fin n) k), Lifting.IsSimpleAdSubmodule H W →
    ∃ σ ∈ H, ∃ (α : k) (e : Matrix (Fin n) (Fin n) k),
      (minpoly k (σ : Matrix (Fin n) (Fin n) k)).Separable ∧
      Lifting.IsEigenProjection (σ : Matrix (Fin n) (Fin n) k) e α ∧
      ∃ w ∈ W, (e * w).trace ≠ 0

/-- **PL.4/relaxed-adequacy**, first assertion: a finite subgroup that is adequate in the sense of
Thorne 2017, Definition 2.20 is relaxed-adequate, by the exactness of
`H¹(H, k) → H¹(H, ad) → H¹(H, ad₀)`. -/
theorem relaxed_adequacy_1 {k : Type*} [Field k] (H : Subgroup (GL (Fin n) k)) [Finite H]
    (hk : ∀ h ∈ H, (h : Matrix (Fin n) (Fin n) k).charpoly.Splits)
    (h : (ghtAdequate k n).Holds H) : Lifting.IsRelaxedAdequate H := by
  sorry

/-- **PL.4/relaxed-adequacy**, for PL.4/two-adic-automorphy-lifting (Thorne 2017, Theorem 5.1,
whose proof uses adequacy only through Proposition 2.21, absolute irreducibility and
`H¹(H, k) = 0`): the theorem holds with `ρ̄(G_{F(ζ_p)})` relaxed-adequate. -/
theorem relaxed_adequacy_2 [IsCMField F] {p : ℕ} [ResChar E p] (hp : p.Prime)
    (hn : 2 ≤ n) (ι : E →+* ℂ) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (h_i : Lifting.IsConjugateSelfDual ⇑(Lifting.genericG ρ) fun σ =>
      Lifting.genericChar (Lifting.cycloInt E F ^ (1 - (n : ℤ))) σ)
    (h_ii : Lifting.IsRelaxedAdequate (Lifting.imageCyclo p (reduction ρ.toMonoidHom)))
    (h_iii : Lifting.IsUnramifiedAlmostEverywhere ρ.toMonoidHom)
    (π : RACP F n) (hπ : (Lifting.racsdc F n).Holds π)
    (hπbar : Conj (reduction ρ.toMonoidHom : Gal F → GL (Fin n) 𝓀[E]) (π.residualRep ι))
    (ρπ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hρπ : Conj (Lifting.genericG ρπ : Gal F → GL (Fin n) E) (π.galoisRep ι))
    (h_iv : ∀ (w : Place F) (q : ℕ) (_ : ResChar w.Fv q), q.Prime →
      Connects (resPlace ρπ w) (resPlace ρ w))
    (h_v : p = 2 → Even n → ∃ v : InfinitePlace F⁺,
      IsStronglyResiduallyOdd (reduction ρ.toMonoidHom)
        (Lifting.redChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * Lifting.deltaInt F E ^ n)) v) :
    ∃ π' : RACP F n, (Lifting.racsdc F n).Holds π' ∧
      Conj (Lifting.genericG ρ : Gal F → GL (Fin n) E) (π'.galoisRep ι) := by
  sorry

/-- **PL.4/relaxed-adequacy**, for PL.4/minimal-automorphy-lifting (Thorne 2012, Theorem 7.1
through Thorne 2017, Corollary 7.3 and Proposition 7.1): the theorem holds with `ρ̄(G_{F(ζ_l)})`
relaxed-adequate. -/
theorem relaxed_adequacy_3 [IsCMField F] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (hn : 1 ≤ n) (ι : E →+* ℂ)
    (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (h_i : Lifting.IsConjugateSelfDual ⇑(Lifting.genericG ρ) fun σ =>
      Lifting.genericChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * μ) (Lifting.toPlus F σ))
    (h_ii : ∀ v v' : InfinitePlace F⁺, μ (Lifting.complexConj v) = μ (Lifting.complexConj v'))
    (h_iii : Lifting.IsUnramifiedAlmostEverywhere ρ.toMonoidHom)
    (h_iv : IsAbsIrred ⇑(reduction ρ.toMonoidHom) ∧
      Lifting.IsRelaxedAdequate (Lifting.imageCyclo l (reduction ρ.toMonoidHom)))
    (h_v : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (ρ' : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ' : Gal F⁺ →ₜ* (𝒪[E])ˣ) (π : RACP F n)
    (h_vi : Lifting.IsMinimalSeed l ι ρ μ ρ' μ' π) :
    IsAutomorphic ι (Lifting.genericG ρ)
        (Lifting.genericChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * μ)) ∧
      ((∀ w : Place F, w.Above l → (unramifiedIrrep w.Fv n).Holds (π.component w)) →
        (∀ w : Place F, w.Above l → (crystalline w.Fv E n).Holds (genericC (resPlace ρ w))) →
        IsAutomorphicOfLevelPrimeTo l ι (Lifting.genericG ρ)
          (Lifting.genericChar (Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * μ))) := by
  sorry

/-- **PL.4/relaxed-adequacy**, for PL.4/ordinary-automorphy-lifting (BLGGT14 Theorem 2.4.1 in the
form of Thorne 2012, Theorem 9.1 with Thorne 2017, Corollary 7.3): the theorem holds with
`r̄(G_{F(ζ_l)})` relaxed-adequate. -/
theorem relaxed_adequacy_4 (hF : IsCMField F ∨ IsTotallyReal F) {l : ℕ} [ResChar E l]
    (hl : l.Prime) (hodd : Odd l) (hn : 1 ≤ n) (ι : E →+* ℂ)
    (r : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (hpol : Lifting.IsPolarized ⇑(Lifting.genericG r) ⇑(Lifting.genericChar μ))
    (halg : Lifting.IsAlgebraic l (Lifting.genericG r))
    (h1 : IsAbsIrred ⇑(reduction r.toMonoidHom) ∧
      Lifting.IsRelaxedAdequate (Lifting.imageCyclo l (reduction r.toMonoidHom)))
    (h2 : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (h3 : ∀ w : Place F, w.Above l → Lifting.IsOrdinaryAt (genericC (resPlace r w)))
    (h4 : Lifting.IsResiduallyOrdinarilyAutomorphic ι (reduction r.toMonoidHom)
      (Lifting.redChar μ)) :
    IsOrdinarilyAutomorphic ι (Lifting.genericG r) (Lifting.genericChar μ) ∧
      ((∀ w : Place F, w.Above l → (crystalline w.Fv E n).Holds (genericC (resPlace r w))) →
        ∃ π : RACP F n, IsAutomorphicVia ι (Lifting.genericG r) (Lifting.genericChar μ) π ∧
          (iotaOrdinary F E n ι).Holds π.toRegAlg ∧
          ∀ w : Place F, w.Above l → (unramifiedIrrep w.Fv n).Holds (π.component w)) ∧
      ((∀ w : Place F, w.Above l → IsPotentiallyCrystalline (genericC (resPlace r w))) →
        ∃ π : RACP F n, IsAutomorphicVia ι (Lifting.genericG r) (Lifting.genericChar μ) π ∧
          (iotaOrdinary F E n ι).Holds π.toRegAlg ∧
          (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg) := by
  sorry

/-- **PL.4/relaxed-adequacy**, for PL.4/minimal-finiteness (Thorne 2012, Theorem 10.1 through
Thorne 2017, Proposition 7.2): the theorem holds with `ρ̄(G_{F(ζ_l)})` relaxed-adequate. -/
theorem relaxed_adequacy_5 [IsCMField F] [IsLargeFor F E] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l) (ι : E →+* ℂ)
    (S : Finset (Place F)) (hS : Lifting.IsChosenSplitSet S)
    (hSl : ∀ v : Place F⁺, v.Above l → Lifting.MemBelow S v)
    (π : RACP F n) (lam : (F →+* E) → Fin n → ℤ) (hwt : π.HasWeight ι lam)
    (hπS : ∀ u : Place F, ¬ Lifting.MemAbove S u → (unramifiedIrrep u.Fv n).Holds (π.component u))
    (hπl : ∀ u : Place F, u.Above l → (unramifiedIrrep u.Fv n).Holds (π.component u))
    (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hρ : Conj (Lifting.genericG ρ : Gal F → GL (Fin n) E) (π.galoisRep ι))
    (hirr : IsAbsIrred ⇑(reduction ρ.toMonoidHom))
    (had : Lifting.IsRelaxedAdequate (Lifting.imageCyclo l (reduction ρ.toMonoidHom)))
    (rt : Gal F⁺ →* CHT n 𝓀[E]) (hrt : IsContinuousResidual rt) (κ : ZMod 2)
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n 𝓀[E]) ⇑(reduction ρ.toMonoidHom))
    (hν : ∀ τ, CHT.nu n 𝓀[E] (rt τ) = Lifting.redChar (Lifting.multiplierInt π ι *
      Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * Lifting.deltaInt F E ^ κ.val) τ)
    (C : ∀ w : Place F,
      Ideal (LiftingRing w.Fv E (Lifting.resPlaceHom (reduction ρ.toMonoidHom) w)))
    (hC : ∀ w ∈ S, Lifting.IsIsolatedComponent l ρ lam w (C w)) :
    κ = 0 ∧ Module.Finite 𝒪[E] (Lifting.DefProblem.ofLocalConditions S rt
      (reduction ρ.toMonoidHom) (Lifting.multiplierInt π ι *
        Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * Lifting.deltaInt F E ^ κ.val) C).univRing := by
  sorry

/-- **PL.4/relaxed-adequacy**, for PL.4/ordinary-finiteness (BLGGT14 Theorem 2.4.2 in the form of
Thorne 2012, Theorem 10.2, through Thorne 2017, Proposition 7.2): the theorem holds with
`r̄_{l,ι}(π)(G_{F(ζ_l)})` relaxed-adequate. -/
theorem relaxed_adequacy_6 [IsCMField F] [IsLargeFor F E] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (hn : 1 ≤ n) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l) (ι : E →+* ℂ)
    (S : Finset (Place F)) (hS : Lifting.IsChosenSplitSet S)
    (hSl : ∀ v : Place F⁺, v.Above l → Lifting.MemBelow S v)
    (π : RACP F n) (hord : (iotaOrdinary F E n ι).Holds π.toRegAlg)
    (hπS : ∀ u : Place F, ¬ Lifting.MemAbove S u → (unramifiedIrrep u.Fv n).Holds (π.component u))
    (had : Lifting.IsRelaxedAdequate (Lifting.imageCyclo l (π.residualRep ι)))
    (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ) (w : ℤ)
    (hμ : Lifting.IsUnramifiedAlmostEverywhere μ.toMonoidHom)
    (hμw : Lifting.HasParallelWeight l μ w)
    (hμbar : ∀ τ, Lifting.redChar μ τ =
      Lifting.redChar (Lifting.multiplierInt π ι * Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ))) τ)
    (H : (F →+* E) → Finset ℤ) (hH : Lifting.IsSelfDualHodgeType H n w)
    (rt : Gal F⁺ →* CHT n 𝓀[E]) (hrt : IsContinuousResidual rt)
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n 𝓀[E]) ⇑(π.residualRep ι))
    (hν : ∀ τ, CHT.nu n 𝓀[E] (rt τ) = Lifting.redChar μ τ)
    (D : ∀ u : Place F, Ideal (LiftingRing u.Fv E (Lifting.resPlaceHom (π.residualRep ι) u)))
    (hD : ∀ u ∈ S, ¬ u.Above l → D u = ⊥)
    (hDl : ∀ u ∈ S, u.Above l → D u = Lifting.semistableOrdinaryIdeal
      (Lifting.resPlaceHom (π.residualRep ι) u) (Lifting.localHT (fun τ => (H τ).val) u)) :
    Module.Finite 𝒪[E]
      (Lifting.DefProblem.ofLocalConditions S rt (π.residualRep ι) μ D).univRing := by
  sorry

/-- **PL.4/relaxed-adequacy**, for PL.3/taylor-wiles-primes-two-adic (Thorne 2017,
Proposition 2.21): the conclusion holds with `ρ̄(G_F)` relaxed-adequate. -/
theorem relaxed_adequacy_7 [IsCMField F] (p : ℕ) (S : DefProblem F E n 𝒪[E])
    (h : TwoAdicTWSetup p S) (h_iv : Lifting.IsRelaxedAdequate S.residGL.range) :
    TwoAdicTWConclusion p S := by
  sorry

/-- **PL.4/relaxed-adequacy**, for PL.3/adequate-taylor-wiles-primes (b) (Thorne 2017,
Proposition 7.1): the conclusion holds when `ζ_l ∉ F` and `ρ̄(G_{F(ζ_l)})` is relaxed-adequate. -/
theorem relaxed_adequacy_8 [IsCMField F] (l : ℕ) (S : DefProblem F E n 𝒪[E])
    (T : Set (Place F)) (h : TWPrimesSetup l S T) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (had : Lifting.IsRelaxedAdequate (Lifting.imageCyclo l S.residGL)) :
    TWPrimesConclusion l S T := by
  sorry

open TauCeti.DefiniteUnitary in
/-- **PL.4/relaxed-adequacy**, for PL.3/revised-adequacy-r-equals-t, minimal case (Thorne 2017,
Proposition 7.2, which uses adequacy only through Proposition 7.1): the conclusions of
PL.3/minimal-r-equals-t hold when `ζ_l ∉ L` and `r̄_m(G_{L(ζ_l)})` is relaxed-adequate. -/
theorem relaxed_adequacy_9 (D : HeckeDatum E) (lam : (D.L →+* E) → Fin D.n → ℤ)
    (m : Ideal (heckeAlgebra D lam)) [m.IsMaximal] (l : ℕ) [ResChar E l] (hl : D.l = l)
    (κ : 𝓀[E] ≃+* (heckeAlgebra D lam ⧸ m)) (S : DefProblem D.L E D.n 𝒪[E])
    (h : MinimalRT D lam m κ S) (hζ : ∀ ζ : D.L, ¬ IsPrimitiveRoot ζ l)
    (had : Lifting.IsRelaxedAdequate (Lifting.imageCyclo l (residualRep D lam m))) :
    MinimalRT.Conclusion D lam m l S := by
  sorry

open TauCeti.DefiniteUnitary in
/-- **PL.4/relaxed-adequacy**, for PL.3/revised-adequacy-r-equals-t, ordinary case (Thorne 2017,
Proposition 7.2): the conclusions of PL.3/ordinary-r-equals-t hold when `ζ_l ∉ L` and
`r̄_m(G_{L(ζ_l)})` is relaxed-adequate. -/
theorem relaxed_adequacy_10 (D : HeckeDatum E) (Sc : D.LChoice)
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : 𝓀[E] ≃+* (bigOrdinaryHeckeAlgebra D ⧸ m)) (v₁ : Place D.L)
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) (h : OrdinaryRT D Sc m κ v₁ S)
    (hζ : ∀ ζ : D.L, ¬ IsPrimitiveRoot ζ D.l)
    (had : Lifting.IsRelaxedAdequate (Lifting.imageCyclo D.l (ordResidualRep D m))) :
    OrdinaryRT.Conclusion D Sc m κ v₁ S := by
  sorry

/-! ### PL.4/ordinary-automorphy-lifting: Ordinary automorphy lifting -/

/-- **PL.4/ordinary-automorphy-lifting** (BLGGT14 Theorem 2.4.1; for `F` imaginary Thorne 2012,
Theorem 9.1, after Geraghty, Theorem 5.3.2; adequacy in either sense by Thorne 2017,
Corollary 7.3). `F` CM or totally real, `l` odd, `(r, μ)` an `n`-dimensional algebraic polarized
`l`-adic representation of `G_F` with (1) `r̄` irreducible and `r̄(G_{F(ζ_l)})` adequate;
(2) `ζ_l ∉ F`; (3) `r` ordinary at every prime above `l`; (4) `(r̄, μ̄)` ordinarily automorphic.
Then `(r, μ)` is ordinarily automorphic; if `r` is crystalline (resp. potentially crystalline) at
every place above `l`, it is ordinarily automorphic of level prime to `l` (resp. potentially prime
to `l`). -/
theorem ordinary_automorphy_lifting (hF : IsCMField F ∨ IsTotallyReal F) {l : ℕ} [ResChar E l]
    (hl : l.Prime) (hodd : Odd l) (hn : 1 ≤ n) (ι : E →+* ℂ)
    (r : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (hpol : Lifting.IsPolarized ⇑(Lifting.genericG r) ⇑(Lifting.genericChar μ))
    (halg : Lifting.IsAlgebraic l (Lifting.genericG r))
    (h1 : IsAbsIrred ⇑(reduction r.toMonoidHom) ∧
      Lifting.HasAdequateImage l (reduction r.toMonoidHom))
    (h2 : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (h3 : ∀ w : Place F, w.Above l → Lifting.IsOrdinaryAt (genericC (resPlace r w)))
    (h4 : Lifting.IsResiduallyOrdinarilyAutomorphic ι (reduction r.toMonoidHom)
      (Lifting.redChar μ)) :
    IsOrdinarilyAutomorphic ι (Lifting.genericG r) (Lifting.genericChar μ) ∧
      ((∀ w : Place F, w.Above l → (crystalline w.Fv E n).Holds (genericC (resPlace r w))) →
        ∃ π : RACP F n, IsAutomorphicVia ι (Lifting.genericG r) (Lifting.genericChar μ) π ∧
          (iotaOrdinary F E n ι).Holds π.toRegAlg ∧
          ∀ w : Place F, w.Above l → (unramifiedIrrep w.Fv n).Holds (π.component w)) ∧
      ((∀ w : Place F, w.Above l → IsPotentiallyCrystalline (genericC (resPlace r w))) →
        ∃ π : RACP F n, IsAutomorphicVia ι (Lifting.genericG r) (Lifting.genericChar μ) π ∧
          (iotaOrdinary F E n ι).Holds π.toRegAlg ∧
          (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg) := by
  sorry

/-! ### PL.4/minimal-finiteness: Finiteness of polarized deformation rings for fixed components -/

/-- **PL.4/minimal-finiteness** (Thorne 2012, Theorem 10.1; adequacy in either sense by Thorne
2017, Proposition 7.2). `F` imaginary CM, `l` odd, `ζ_l ∉ F`, `S̃` chosen places above a finite set
`S` of places of `F⁺` split in `F` and containing those above `l`; `(π, χ)` of weight `ι_* λ`,
unramified outside `S` and at the places above `l`; `ρ` a lattice in `r_{l,ι}(π)` with `ρ̄`
absolutely irreducible and `ρ̄(G_{F(ζ_l)})` adequate; `μ = r_{l,ι}(χ)` the Hecke multiplier;
`r̄ : G_{F⁺} → 𝒢_n(k)` an extension of `ρ̄` with `ν ∘ r̄ = μ̄ ε̄^{1-n} δ^κ_{F/F⁺}`; and for each
`v ∈ S` an irreducible component `C_v` through `ρ|G_{F_ṽ}`, the only one containing it. For
`𝒮 = (F/F⁺, S, S̃, 𝒪, r̄, μ ε^{1-n} δ^κ, {R^{C_v}_ṽ})` one has `κ = 0`, and `R^univ_𝒮` is a finite
`𝒪`-module. The source asks only that `π` be unramified outside `S`; its proof takes hyperspecial
level at `l`, so `π` is required to be unramified above `l`. -/
theorem minimal_finiteness [IsCMField F] [IsLargeFor F E] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l) (ι : E →+* ℂ)
    (S : Finset (Place F)) (hS : Lifting.IsChosenSplitSet S)
    (hSl : ∀ v : Place F⁺, v.Above l → Lifting.MemBelow S v)
    (π : RACP F n) (lam : (F →+* E) → Fin n → ℤ) (hwt : π.HasWeight ι lam)
    (hπS : ∀ u : Place F, ¬ Lifting.MemAbove S u → (unramifiedIrrep u.Fv n).Holds (π.component u))
    (hπl : ∀ u : Place F, u.Above l → (unramifiedIrrep u.Fv n).Holds (π.component u))
    (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hρ : Conj (Lifting.genericG ρ : Gal F → GL (Fin n) E) (π.galoisRep ι))
    (hirr : IsAbsIrred ⇑(reduction ρ.toMonoidHom))
    (had : Lifting.HasAdequateImage l (reduction ρ.toMonoidHom))
    (rt : Gal F⁺ →* CHT n 𝓀[E]) (hrt : IsContinuousResidual rt) (κ : ZMod 2)
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n 𝓀[E]) ⇑(reduction ρ.toMonoidHom))
    (hν : ∀ τ, CHT.nu n 𝓀[E] (rt τ) = Lifting.redChar (Lifting.multiplierInt π ι *
      Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * Lifting.deltaInt F E ^ κ.val) τ)
    (C : ∀ w : Place F,
      Ideal (LiftingRing w.Fv E (Lifting.resPlaceHom (reduction ρ.toMonoidHom) w)))
    (hC : ∀ w ∈ S, Lifting.IsIsolatedComponent l ρ lam w (C w)) :
    κ = 0 ∧ Module.Finite 𝒪[E] (Lifting.DefProblem.ofLocalConditions S rt
      (reduction ρ.toMonoidHom) (Lifting.multiplierInt π ι *
        Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ)) * Lifting.deltaInt F E ^ κ.val) C).univRing := by
  sorry

/-- **PL.4/minimal-finiteness**, in the form of BLGGT14 Theorem 2.3.2: `(π, χ)` of weight
`ι_* λ`, unramified outside `S` and of level potentially prime to `l`, with
`r̄_{l,ι}(π)(G_{F(ζ_l)})` adequate; `ρ` a lattice in `r_{l,ι}(π)`; `r̄` the extension of
`r̄_{l,ι}(π)` with multiplier the reduction of `r_{l,ι}(χ) ε_l^{1-n}`; for `v | l`, `C_v` an
irreducible component through `ρ|G_{F_ṽ}` of the direct limit over `K'` of the `K'`-crystalline
lifting rings of the Hodge type of `π`; for `v ∤ l`, `C_v` the irreducible component of the
lifting ring through `ρ|G_{F_ṽ}`. Then `R^univ_𝒮` is a finitely generated `𝒪`-module for
`𝒮 = (F/F⁺, S, S̃, 𝒪, r̄, r_{l,ι}(χ) ε_l^{1-n}, {D_v})`. -/
theorem minimal_finiteness_blggt [IsCMField F] [IsLargeFor F E] {l : ℕ} [ResChar E l]
    (hl : l.Prime) (hodd : Odd l) (hn : 1 ≤ n) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (ι : E →+* ℂ) (S : Finset (Place F)) (hS : Lifting.IsChosenSplitSet S)
    (hSl : ∀ v : Place F⁺, v.Above l → Lifting.MemBelow S v)
    (π : RACP F n) (lam : (F →+* E) → Fin n → ℤ) (hwt : π.HasWeight ι lam)
    (hπS : ∀ u : Place F, ¬ Lifting.MemAbove S u → (unramifiedIrrep u.Fv n).Holds (π.component u))
    (hπl : (levelPotentiallyPrimeTo F n l).Holds π.toRegAlg)
    (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hρ : Conj (Lifting.genericG ρ : Gal F → GL (Fin n) E) (π.galoisRep ι))
    (had : Lifting.HasAdequateImage l (reduction ρ.toMonoidHom))
    (rt : Gal F⁺ →* CHT n 𝓀[E]) (hrt : IsContinuousResidual rt)
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n 𝓀[E]) ⇑(reduction ρ.toMonoidHom))
    (hν : ∀ τ, CHT.nu n 𝓀[E] (rt τ) = Lifting.redChar (Lifting.multiplierInt π ι *
      Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ))) τ)
    (C : ∀ w : Place F,
      Ideal (LiftingRing w.Fv E (Lifting.resPlaceHom (reduction ρ.toMonoidHom) w)))
    (hC : ∀ w ∈ S, ¬ w.Above l →
      Lifting.IsComponent ⊥ l (C w) ∧ C w ≤ Lift.prime (Lifting.localLift ρ w))
    (hCl : ∀ w ∈ S, w.Above l → C w ≤ Lift.prime (Lifting.localLift ρ w) ∧
      ∃ (K' : Type) (_ : Field K') (_ : ValuativeRel K') (_ : TopologicalSpace K')
        (_ : IsNonarchimedeanLocalField K') (f : w.Fv →+* K'),
        Lifting.IsComponent (crystallineIdeal (Lifting.resPlaceHom (reduction ρ.toMonoidHom) w)
          (Lifting.localHT (Lifting.weightHT lam) w) f) l (C w)) :
    Module.Finite 𝒪[E] (Lifting.DefProblem.ofLocalConditions S rt (reduction ρ.toMonoidHom)
      (Lifting.multiplierInt π ι * Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ))) C).univRing := by
  sorry

/-! ### PL.4/ordinary-finiteness: Finiteness of ordinary polarized deformation rings -/

/-- **PL.4/ordinary-finiteness** (BLGGT14 Theorem 2.4.2; Thorne 2012, Theorem 10.2, where the
statement is made with the Hecke multiplier and an extension `r̄` with
`ν ∘ r̄ = μ̄ ε̄^{1-n} δ^κ_{F/F⁺}`, and concludes also `κ = 0`; adequacy in either sense by Thorne
2017, Proposition 7.2). `F` imaginary CM, `l` odd, `ζ_l ∉ F`, `n ≥ 1`, `S̃` chosen places above a
finite set `S` of places of `F⁺` split in `F` and containing those above `l`; `(π, χ)`
`ι`-ordinary, unramified outside `S`, with `r̄_{l,ι}(π)(G_{F(ζ_l)})` adequate; `μ` an algebraic
character of `G_{F⁺}` with `μ̄ = r̄_{l,ι}(χ) ε̄_l^{1-n}` (the full multiplier) and `HT_τ(μ) = {w}`;
`H_τ` sets of `n` distinct integers with `H_{τ∘c} = {w - h : h ∈ H_τ}`; `r̄` the extension of
`r̄_{l,ι}(π)` with multiplier `μ̄`; `D_v` all lifts for `v ∤ l` and the semistable ordinary lifts
of type `{H_τ}` for `v | l`. Then `R^univ_𝒮` is a finitely generated `𝒪`-module. The weights
`H_τ` need not be those of `π`. -/
theorem ordinary_finiteness [IsCMField F] [IsLargeFor F E] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (hn : 1 ≤ n) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l) (ι : E →+* ℂ)
    (S : Finset (Place F)) (hS : Lifting.IsChosenSplitSet S)
    (hSl : ∀ v : Place F⁺, v.Above l → Lifting.MemBelow S v)
    (π : RACP F n) (hord : (iotaOrdinary F E n ι).Holds π.toRegAlg)
    (hπS : ∀ u : Place F, ¬ Lifting.MemAbove S u → (unramifiedIrrep u.Fv n).Holds (π.component u))
    (had : Lifting.HasAdequateImage l (π.residualRep ι))
    (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ) (w : ℤ)
    (hμ : Lifting.IsUnramifiedAlmostEverywhere μ.toMonoidHom)
    (hμw : Lifting.HasParallelWeight l μ w)
    (hμbar : ∀ τ, Lifting.redChar μ τ =
      Lifting.redChar (Lifting.multiplierInt π ι * Lifting.cycloInt E F⁺ ^ (1 - (n : ℤ))) τ)
    (H : (F →+* E) → Finset ℤ) (hH : Lifting.IsSelfDualHodgeType H n w)
    (rt : Gal F⁺ →* CHT n 𝓀[E]) (hrt : IsContinuousResidual rt)
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n 𝓀[E]) ⇑(π.residualRep ι))
    (hν : ∀ τ, CHT.nu n 𝓀[E] (rt τ) = Lifting.redChar μ τ)
    (D : ∀ u : Place F, Ideal (LiftingRing u.Fv E (Lifting.resPlaceHom (π.residualRep ι) u)))
    (hD : ∀ u ∈ S, ¬ u.Above l → D u = ⊥)
    (hDl : ∀ u ∈ S, u.Above l → D u = Lifting.semistableOrdinaryIdeal
      (Lifting.resPlaceHom (π.residualRep ι) u) (Lifting.localHT (fun τ => (H τ).val) u)) :
    Module.Finite 𝒪[E]
      (Lifting.DefProblem.ofLocalConditions S rt (π.residualRep ι) μ D).univRing := by
  sorry

/-! ### PL.4/characteristic-zero-lifts: Characteristic-zero lifts from finiteness and the
dimension bound -/

/-- `X ∈ M_n(k)` is fixed by `G_{F⁺}` acting on `ad r̄(1)`: the group `𝒢_n(k)` acts on `gl_n(k)`
by `ad (g, a) X = g X g⁻¹` and `ad (j) X = -ᵗX` (Clozel–Harris–Taylor §2.1), and the action is
twisted by `ε̄`. The space of such `X` is `H⁰(G_{F⁺,S}, ad r̄(1))` when `r̄` is unramified outside
`S`. -/
def Lifting.IsAdOneInvariant (rt : Gal F⁺ →* CHT n 𝓀[E]) (X : Matrix (Fin n) (Fin n) 𝓀[E]) :
    Prop :=
  ∀ (τ : Gal F⁺) (g : GL (Fin n) 𝓀[E]) (a : (𝓀[E])ˣ),
    (rt τ = Lifting.CHT.incl n 𝓀[E] (g, a) →
      ((Lifting.cycloBar E F⁺ τ : (𝓀[E])ˣ) : 𝓀[E]) •
        ((g : Matrix (Fin n) (Fin n) 𝓀[E]) * X * ((g⁻¹ : GL (Fin n) 𝓀[E]) : Matrix _ _ 𝓀[E]))
        = X) ∧
    (rt τ = Lifting.CHT.incl n 𝓀[E] (g, a) * Lifting.CHT.j n 𝓀[E] →
      ((Lifting.cycloBar E F⁺ τ : (𝓀[E])ˣ) : 𝓀[E]) •
        ((g : Matrix (Fin n) (Fin n) 𝓀[E]) * (-Xᵀ) * ((g⁻¹ : GL (Fin n) 𝓀[E]) : Matrix _ _ 𝓀[E]))
        = X)

/-- **PL.4/characteristic-zero-lifts** (BLGGT14 Proposition 1.5.1, from Clozel–Harris–Taylor,
Proposition 2.2.9 and Corollary 2.3.5; the Khare–Wintenberger method as at the end of the proof
of BLGGT14 Proposition 3.2.1). `l` odd, `F` imaginary CM, `S̃` chosen places above a finite set
`S` of places of `F⁺` split in `F` and containing those above `l`; `r̄ : G_{F⁺} → 𝒢_n(𝔽)`
continuous, unramified outside `S`, with `r̄⁻¹(𝒢_n⁰(𝔽)) = G_F` and `r̄|G_F` absolutely irreducible;
`μ` a de Rham lift of `ν ∘ r̄` with `HT_τ(μ) = {w}`; `H_τ` multisets of `n` integers with
`H_{τ∘c} = {w - h : h ∈ H_τ}`; `𝒮 = (F/F⁺, S, S̃, 𝒪, r̄, μ, {D_v})` with `D_v` given by a non-empty
finite set `C_v` of irreducible components of `Spec R^□_ṽ[1/l]` for `v ∤ l`, and of the direct
limit over `K'` of the `K'`-semistable lifting rings of Hodge type `{H_τ}` for `v | l` (the
quotient is the reduced `l`-torsion-free closure of the chosen components). Then:
(1) `R^univ_𝒮` represents the deformations of type `𝒮`;
(2) if `μ(c_v) = -1` for all `v | ∞`, each `H_τ` has `n` distinct elements and
`H⁰(G_{F⁺,S}, ad r̄(1)) = 0`, then `R^univ_𝒮` has Krull dimension at least `1`;
(3) if moreover `R^univ_𝒮` is a finite `𝒪`-module, there is an `𝒪`-algebra homomorphism from
`R^univ_𝒮` to a finite extension `E'` of `E`, that is, a lift of `r̄` of type `𝒮` in
characteristic zero. The vanishing of `H⁰` is not printed in BLGGT14; it holds when
`r̄|G_{F(ζ_l)}` is absolutely irreducible and `ζ_l ∉ F` (`characteristic_zero_lifts_h0`). -/
theorem characteristic_zero_lifts [IsCMField F] [IsLargeFor F E] {l : ℕ} [ResChar E l]
    (hl : l.Prime) (hodd : Odd l) (S : Finset (Place F)) (hS : Lifting.IsChosenSplitSet S)
    (hSl : ∀ v : Place F⁺, v.Above l → Lifting.MemBelow S v)
    (rt : Gal F⁺ →* CHT n 𝓀[E]) (hrt : IsContinuousResidual rt)
    (hunr : ∀ v : Place F⁺, ¬ Lifting.MemBelow S v → IsUnramified (Lifting.resPlaceHom rt v))
    (rbar : Gal F →* GL (Fin n) 𝓀[E])
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n 𝓀[E]) ⇑rbar) (hirr : IsAbsIrred ⇑rbar)
    (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ) (w : ℤ) (hν : ∀ τ, CHT.nu n 𝓀[E] (rt τ) = Lifting.redChar μ τ)
    (hμw : Lifting.HasParallelWeight l μ w)
    (H : (F →+* E) → Multiset ℤ)
    (hH : ∀ τ, (H τ).card = n ∧ H (τ.comp (Lifting.cmConj F)) = (H τ).map fun h => w - h)
    (C : ∀ u : Place F, Finset (Ideal (LiftingRing u.Fv E (Lifting.resPlaceHom rbar u))))
    (hCne : ∀ u ∈ S, (C u).Nonempty)
    (hC : ∀ u ∈ S, ¬ u.Above l → ∀ q ∈ C u, Lifting.IsComponent ⊥ l q)
    (hCl : ∀ u ∈ S, u.Above l → ∀ q ∈ C u,
      ∃ (K' : Type) (_ : Field K') (_ : ValuativeRel K') (_ : TopologicalSpace K')
        (_ : IsNonarchimedeanLocalField K') (f : u.Fv →+* K'),
        Lifting.IsComponent (Lifting.semistableIdeal (Lifting.resPlaceHom rbar u)
          (Lifting.localHT H u) f) l q) :
    Lifting.DefProblem.IsRepresentable (Lifting.DefProblem.ofLocalConditions S rt rbar μ
        fun u => componentDeformationProblem (C u)) ∧
      ((∀ v : InfinitePlace F⁺, μ (Lifting.complexConj v) = -1) → (∀ τ, (H τ).Nodup) →
        (∀ X, Lifting.IsAdOneInvariant rt X → X = 0) →
        1 ≤ ringKrullDim (Lifting.DefProblem.ofLocalConditions S rt rbar μ
          fun u => componentDeformationProblem (C u)).univRing ∧
        (Module.Finite 𝒪[E] (Lifting.DefProblem.ofLocalConditions S rt rbar μ
            fun u => componentDeformationProblem (C u)).univRing →
          ∃ (E' : Type) (_ : Field E') (_ : Algebra E E'), FiniteDimensional E E' ∧
            ∃ f : (Lifting.DefProblem.ofLocalConditions S rt rbar μ
                fun u => componentDeformationProblem (C u)).univRing →+* E',
              ∀ a : 𝒪[E], f (algebraMap 𝒪[E] _ a) = algebraMap E E' (a : E))) := by
  sorry

/-- **PL.4/characteristic-zero-lifts**, the vanishing used in the dimension bound: if
`r̄|G_{F(ζ_l)}` is absolutely irreducible and `ζ_l ∉ F`, then `H⁰(G_{F⁺,S}, ad r̄(1)) = 0`
(Bellovin–Gee §5.1; when `F = F⁺(ζ_l)` the scalar matrices give a non-zero invariant). -/
theorem characteristic_zero_lifts_h0 [IsCMField F] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (rt : Gal F⁺ →* CHT n 𝓀[E]) (hrt : IsContinuousResidual rt)
    (rbar : Gal F →* GL (Fin n) 𝓀[E])
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n 𝓀[E]) ⇑rbar)
    (hirr : IsAbsIrred ⇑(resFieldHom rbar (algebraMap F (CyclotomicField l F))))
    (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l) :
    ∀ X, Lifting.IsAdOneInvariant rt X → X = 0 := by
  sorry

end PL4

/-! ## PL.5: potential ordinary automorphy and potentially diagonalizable lifting -/

section PL5

/-! ### PL.5/dwork-potential-ordinary-automorphy: Potential ordinary automorphy of symplectic
mod l representations -/

/-- **PL.5/dwork-potential-ordinary-automorphy** (BLGGT14 Theorem 3.1.2). `F/F₀` a finite Galois
extension of totally real fields, `I` a finite set, and for each `i ∈ I`: `n_i` a positive even
integer, `l_i` an odd prime, `ι_i`, and `r̄_i : G_F → GSp_{n_i}(F̄_{l_i})` with open kernel and
multiplier `ε̄_{l_i}^{1-n_i}` (a `𝓀[E_i]`-valued representation preserving a non-degenerate
alternating form up to that multiplier; no irreducibility is assumed); `F^{(avoid)}/F` a finite
Galois extension. Then there are a finite totally real extension `F'/F` and, for each `i`, a
regular algebraic cuspidal polarized `(π_i, χ_i)` of `GL_{n_i}(𝔸_{F'})`, over a coefficient field
`E'_i ⊇ E_i`, such that (1) `F'/F₀` is Galois; (2) `F'` is linearly disjoint from `F^{(avoid)}`
over `F`;
(3) `(r̄_{l_i,ι_i}(π_i), r̄_{l_i,ι_i}(χ_i) ε̄^{1-n_i}) ≅ ((r̄_i|G_{F'})^{ss}, ε̄^{1-n_i})`;
(4) `π_i` has weight `0` and is `ι_i`-ordinary. The proof gives more, as Newton–Thorne 2021
record: (5) `χ_i = 1` and `π_{i,v}` is an unramified twist of the Steinberg representation at
every `v | l_i`. The source writes `r̄_i|G_{F'}` in (3); `r̄_{l,ι}(π)` being semisimple, the
statement is up to semisimplification. -/
theorem dwork_potential_ordinary_automorphy {F₀ F : Type} [Field F₀] [NumberField F₀]
    [IsTotallyReal F₀] [Field F] [NumberField F] [IsTotallyReal F] [Algebra F₀ F] [IsGalois F₀ F]
    {I : Type} [Finite I] (n : I → ℕ) (hn : ∀ i, 0 < n i ∧ Even (n i))
    (l : I → ℕ) (hl : ∀ i, (l i).Prime ∧ Odd (l i))
    (E : I → Type) [∀ i, Field (E i)] [∀ i, ValuativeRel (E i)] [∀ i, TopologicalSpace (E i)]
    [∀ i, IsNonarchimedeanLocalField (E i)] [∀ i, ResChar (E i) (l i)] (ι : ∀ i, E i →+* ℂ)
    (rbar : ∀ i, Gal F →* GL (Fin (n i)) 𝓀[E i]) (hcont : ∀ i, IsContinuousResidual (rbar i))
    (hsymp : ∀ i, Lifting.IsSymplectic ⇑(rbar i) fun σ =>
      Lifting.cycloBar (E i) F σ ^ (1 - (n i : ℤ)))
    (Favoid : Type) [Field Favoid] [Algebra F Favoid] [FiniteDimensional F Favoid]
    [IsGalois F Favoid] :
    ∃ (F' : Type) (_ : Field F') (_ : NumberField F') (_ : IsTotallyReal F') (_ : Algebra F F')
      (_ : Algebra F₀ F') (_ : IsScalarTower F₀ F F'),
      IsGalois F₀ F' ∧ IsField (TensorProduct F F' Favoid) ∧
      ∀ i, ∃ (E' : Type) (_ : Field E') (_ : ValuativeRel E') (_ : TopologicalSpace E')
        (_ : IsNonarchimedeanLocalField E') (_ : ResChar E' (l i)) (j : E i →+* E')
        (ι' : E' →+* ℂ) (π : RACP F' (n i)),
        ι'.comp j = ι i ∧
        Lifting.SameSemisimplification ⇑(π.residualRep ι')
          ⇑(Lifting.coeffResidual j (resFieldHom (rbar i) (algebraMap F F'))) ∧
        (∀ σ, Lifting.redChar (Lifting.multiplierInt π ι' *
            Lifting.cycloInt E' (maximalRealSubfield F') ^ (1 - (n i : ℤ))) σ =
          Lifting.cycloBar E' (maximalRealSubfield F') σ ^ (1 - (n i : ℤ))) ∧
        (∀ τ k, π.weight τ k = 0) ∧ (iotaOrdinary F' E' (n i) ι').Holds π.toRegAlg ∧
        (∀ σ, Lifting.multiplierInt π ι' σ = 1) ∧
        ∀ v : Place F', v.Above (l i) → (steinbergTwist v.Fv (n i)).Holds (π.component v) := by
  sorry

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

local notation "F⁺" => maximalRealSubfield F

/-! ### PL.5/ordinary-lifts-prescribed-local: Ordinary crystalline lifts with prescribed local
behaviour -/

/-- **PL.5/ordinary-lifts-prescribed-local** (BLGGT14 Proposition 3.2.1). `n ≥ 1`, `l` odd, `F`
imaginary CM with `ζ_l ∉ F`, `S̃` chosen places above a finite set `S` of finite places of `F⁺`
that split in `F`, containing all places above `l`. `μ` a continuous crystalline character of
`G_{F⁺}`, unramified outside `S`, with `μ(c_v) = -1` for all `v | ∞` and `HT_τ(μ) = {w}`; `H_τ`
sets of `n` distinct integers with `H_{τ∘c} = {w - h : h ∈ H_τ}`; `r̄ : G_{F⁺} → 𝒢_n(F̄_l)`
continuous, unramified outside `S`, with `ν ∘ r̄ = μ̄` and `r̄⁻¹ 𝒢_n⁰ = G_F`, of restriction `r̆`;
for `v ∈ S`, `v ∤ l`, `ρ_v` any lift of `r̆|G_{F_ṽ}`. Assume (a) `r̆|G_{F(ζ_l)}` irreducible and
`l ≥ 2(d + 1)`; (b) for every place `u | l` of `F`, `r̆|G_{F_u}` has a lift which is ordinary and
crystalline with Hodge–Tate numbers `H_τ`. Then there is a lift `r` of `r̄`, over the integers of
a coefficient field `E' ⊇ E`, such that (1) `ν ∘ r = μ`; (2) `r̆|G_{F_u}` is ordinary and
crystalline with Hodge–Tate numbers `H_τ` for every `u | l`; (3) `r̆|G_{F_ṽ} ∼ ρ_v` for `v ∈ S`,
`v ∤ l` (the relation `∼`, not `⇝`); (4) `r` is unramified outside `S`. -/
theorem ordinary_lifts_prescribed_local [IsCMField F] [IsLargeFor F E] {l : ℕ} [ResChar E l]
    (hl : l.Prime) (hodd : Odd l) (hn : 1 ≤ n) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (S : Finset (Place F)) (hS : Lifting.IsChosenSplitSet S)
    (hSl : ∀ v : Place F⁺, v.Above l → Lifting.MemBelow S v)
    (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (hμcr : ∀ v : Place F⁺, v.Above l →
      (crystalline v.Fv E 1).Holds (resPlace (charRep (Lifting.genericChar μ)) v))
    (hμS : ∀ v : Place F⁺, ¬ Lifting.MemBelow S v → IsUnramified (resPlace μ v).toMonoidHom)
    (hμodd : ∀ v : InfinitePlace F⁺, μ (Lifting.complexConj v) = -1)
    (w : ℤ) (hμw : Lifting.HasParallelWeight l μ w)
    (H : (F →+* E) → Finset ℤ) (hH : Lifting.IsSelfDualHodgeType H n w)
    (rt : Gal F⁺ →* CHT n 𝓀[E]) (hrt : IsContinuousResidual rt)
    (hunr : ∀ v : Place F⁺, ¬ Lifting.MemBelow S v → IsUnramified (Lifting.resPlaceHom rt v))
    (hν : ∀ τ, CHT.nu n 𝓀[E] (rt τ) = Lifting.redChar μ τ)
    (rbar : Gal F →* GL (Fin n) 𝓀[E])
    (hext : Lifting.CHT.Extends (rt : Gal F⁺ → CHT n 𝓀[E]) ⇑rbar)
    (ρloc : ∀ u : Place F, Lift (Lifting.resPlaceHom rbar u))
    (ha : IsAbsIrred ⇑(resFieldHom rbar (algebraMap F (CyclotomicField l F))) ∧
      2 * (Lifting.sylowConstituentDim l rbar + 1) ≤ l)
    (hb : ∀ u : Place F, u.Above l → ∃ ρu : Lift (Lifting.resPlaceHom rbar u),
      Lifting.IsOrdinaryAt (genericC ρu.1) ∧ (crystalline u.Fv E n).Holds (genericC ρu.1) ∧
      HasHodgeTate (genericC ρu.1) (Lifting.localHT (fun τ => (H τ).val) u)) :
    ∃ (E' : Type) (_ : Field E') (_ : ValuativeRel E') (_ : TopologicalSpace E')
      (_ : IsNonarchimedeanLocalField E') (_ : ResChar E' l) (j : E →+* E')
      (r : Gal F⁺ →ₜ* CHT n 𝒪[E']) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E']),
      Lifting.CHT.Extends (r : Gal F⁺ → CHT n 𝒪[E']) ⇑ρ ∧
      (∀ τ, CHT.map n (IsLocalRing.residue 𝒪[E']) (r τ) =
        CHT.map n (Lifting.coeffRes j) (rt τ)) ∧
      (∀ τ, CHT.nu n 𝒪[E'] (r τ) = Units.map (Lifting.coeffInt j : 𝒪[E] →* 𝒪[E']) (μ τ)) ∧
      (∀ u : Place F, u.Above l → Lifting.IsOrdinaryAt (genericC (resPlace ρ u)) ∧
        (crystalline u.Fv E' n).Holds (genericC (resPlace ρ u)) ∧
        ∃ H' : (u.Fv →+* E') → Multiset ℤ, HasHodgeTate (genericC (resPlace ρ u)) H' ∧
          ∀ (τ : F →+* E) (τ' : u.Fv →+* E'), τ'.comp u.emb = j.comp τ → H' τ' = (H τ).val) ∧
      (∀ u ∈ S, ¬ u.Above l → ∀ (p : ℕ) (_ : ResChar u.Fv p), p.Prime →
        Connects (resPlace ρ u) (Lifting.coeffLattice j (ρloc u).1)) ∧
      ∀ v : Place F⁺, ¬ Lifting.MemBelow S v → IsUnramified (resPlace r v).toMonoidHom := by
  sorry

/-! ### PL.5/tensor-product-trick-lifting: Harris's tensor product trick: a preliminary
potentially diagonalizable lifting theorem -/

/-- **PL.5/tensor-product-trick-lifting** (BLGGT14 Proposition 4.1.1). `F` imaginary CM, `l` odd,
`ζ_l ∉ F`, `n ≥ 1`, `(r, μ)` a regular algebraic, irreducible, `n`-dimensional polarized `l`-adic
representation of `G_F`, with `d` the largest dimension of an irreducible constituent of the
restriction of `r̄` to the closed subgroup generated by the Sylow pro-`l` subgroups. Assume
(1) `r|G_{F_v}` potentially diagonalizable for all `v | l`; (2) `r̄|G_{F(ζ_l)}` irreducible and
`l ≥ 2(d + 1)`; (3) the residual pair `(r̄, μ̄)` automorphic of level prime to `l`, arising from a
`(π, χ)` such that `r_{l,ι}(π)|G_{F_v}` is potentially diagonalizable for all `v | l`, the sums
`h + h'` with `h ∈ HT_τ(r)`, `h' ∈ HT_τ(r_{l,ι}(π))` are `n²` distinct integers for every `τ`,
and `r_{l,ι}(π)|G_{F_v} ∼ r|G_{F_v}` for every `v ∤ l` (`ρπ` an invariant lattice of
`r_{l,ι}(π)`). Then `(r, μ)` is potentially diagonalizably automorphic, in particular of level
potentially prime to `l`. Hypothesis (3) concerns the residual pair. -/
theorem tensor_product_trick_lifting [IsCMField F] {l : ℕ} [ResChar E l] (hl : l.Prime)
    (hodd : Odd l) (hn : 1 ≤ n) (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l) (ι : E →+* ℂ)
    (r : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (hpol : Lifting.IsPolarized ⇑(Lifting.genericG r) ⇑(Lifting.genericChar μ))
    (hreg : Lifting.IsRegularAlgebraic l (Lifting.genericG r))
    (hirr : IsAbsIrred ⇑(Lifting.genericG r))
    (h1 : ∀ (v : Place F) (_ : ResChar v.Fv l), IsPotentiallyDiagonalizable (resPlace r v))
    (h2 : IsAbsIrred
        ⇑(resFieldHom (reduction r.toMonoidHom) (algebraMap F (CyclotomicField l F))) ∧
      2 * (Lifting.sylowConstituentDim l (reduction r.toMonoidHom) + 1) ≤ l)
    (π : RACP F n)
    (h3 : Lifting.IsResiduallyAutomorphicVia ι (reduction r.toMonoidHom) (Lifting.redChar μ) π)
    (h3l : ∀ v : Place F, v.Above l → (unramifiedIrrep v.Fv n).Holds (π.component v))
    (ρπ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hρπ : Conj (Lifting.genericG ρπ : Gal F → GL (Fin n) E) (π.galoisRep ι))
    (h3pd : ∀ (v : Place F) (_ : ResChar v.Fv l), IsPotentiallyDiagonalizable (resPlace ρπ v))
    (h3reg : ∀ v : Place F, v.Above l → ∀ H H' : (v.Fv →+* E) → Multiset ℤ,
      HasHodgeTate (genericC (resPlace r v)) H → HasHodgeTate (genericC (resPlace ρπ v)) H' →
      ∀ τ, ((H τ ×ˢ H' τ).map fun p => p.1 + p.2).Nodup)
    (h3conn : ∀ (v : Place F) (p : ℕ) (_ : ResChar v.Fv p), p.Prime → p ≠ l →
      Connects (resPlace ρπ v) (resPlace r v)) :
    IsPotentiallyDiagonalizablyAutomorphic l ι (Lifting.genericG r) (Lifting.genericChar μ) := by
  sorry

/-! ### PL.5/pd-automorphy-lifting: Automorphy lifting for potentially diagonalizable
representations -/

/-- **PL.5/pd-automorphy-lifting** (BLGGT14 Theorem 4.2.1). `F` imaginary CM, `l` odd, `(r, μ)` a
regular algebraic, irreducible, `n`-dimensional polarized representation of `G_F`, with `d` the
maximal dimension of an irreducible constituent of `r̄` restricted to the closed subgroup of `G_F`
generated by the Sylow pro-`l` subgroups. Assume (1) `r|G_{F_v}` potentially diagonalizable for
all `v | l`; (2) `r̄|G_{F(ζ_l)}` irreducible, `l ≥ 2(d + 1)` and `ζ_l ∉ F`; (3) the residual pair
`(r̄, μ̄)` ordinarily automorphic or potentially diagonalizably automorphic. Then `(r, μ)` is
potentially diagonalizably automorphic, of level potentially prime to `l`. -/
theorem pd_automorphy_lifting [IsCMField F] {l : ℕ} [ResChar E l] (hl : l.Prime) (hodd : Odd l)
    (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) 𝒪[E]) (μ : Gal F⁺ →ₜ* (𝒪[E])ˣ)
    (hpol : Lifting.IsPolarized ⇑(Lifting.genericG r) ⇑(Lifting.genericChar μ))
    (hreg : Lifting.IsRegularAlgebraic l (Lifting.genericG r))
    (hirr : IsAbsIrred ⇑(Lifting.genericG r))
    (h1 : ∀ (v : Place F) (_ : ResChar v.Fv l), IsPotentiallyDiagonalizable (resPlace r v))
    (h2 : IsAbsIrred
        ⇑(resFieldHom (reduction r.toMonoidHom) (algebraMap F (CyclotomicField l F))) ∧
      2 * (Lifting.sylowConstituentDim l (reduction r.toMonoidHom) + 1) ≤ l ∧
      ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (h3 : Lifting.IsResiduallyOrdinarilyAutomorphic ι (reduction r.toMonoidHom)
        (Lifting.redChar μ) ∨
      Lifting.IsResiduallyPotentiallyDiagonalizablyAutomorphic l ι (reduction r.toMonoidHom)
        (Lifting.redChar μ)) :
    IsPotentiallyDiagonalizablyAutomorphic l ι (Lifting.genericG r) (Lifting.genericChar μ) := by
  sorry

end PL5

end TauCeti.Automorphy

namespace TauCeti.Automorphy

/-! ### PL.6/schur-residual-representation: Schur 𝒢_n-valued residual representations -/

section Schur

variable {Γ : Type*} [Group Γ] {k : Type*} [Field k] {n : ℕ}

/-- `Δ = r⁻¹(𝒢_n⁰(A))` for a homomorphism `r : Γ → 𝒢_n(A)`. -/
abbrev CHT.pre {A : Type*} [CommRing A] (r : Γ →* CHT n A) : Subgroup Γ := (CHT.conn n A).comap r

/-- `r|Δ : Δ → GL_n(A)`, `Δ = r⁻¹(𝒢_n⁰(A))`. -/
abbrev CHT.rep {A : Type*} [CommRing A] (r : Γ →* CHT n A) : CHT.pre r →* GL (Fin n) A :=
  CHT.glOf r (CHT.pre r).subtype

/-- `(ν ∘ r)|Δ`, `Δ = r⁻¹(𝒢_n⁰(A))`. -/
abbrev CHT.nuRes {A : Type*} [CommRing A] (r : Γ →* CHT n A) : CHT.pre r →* Aˣ :=
  ((CHT.nu n A).comp r).comp (CHT.pre r).subtype

/-- **`PL.6/schur-residual-representation`.** `r̄ : Γ → 𝒢_n(k)` is Schur (Thorne 2015,
Definition 3.2, after Clozel–Harris–Taylor, Definition 2.1.6): with `Δ = r̄⁻¹(𝒢_n⁰(k))`, every
irreducible `Δ`-subquotient of `k^n` is absolutely irreducible, and for all `Δ`-invariant
subspaces `k^n ⊃ W₁ ⊃ W₂` with `k^n/W₁` and `W₂` irreducible, `(k^n/W₁)^c ≇ W₂^∨ ⊗ (ν ∘ r̄)`.
Here `c` runs over `Γ - Δ`; when `Γ = Δ ⋊ {1, c}` the condition does not depend on `c`. No
hypothesis on the characteristic. -/
def IsSchur (r : Γ →* CHT n k) : Prop :=
  (∀ W₁ W₂ : Subrepresentation (stdRep (CHT.rep r)), W₂ ≤ W₁ →
    (subquotRep W₁ W₂).IsIrreducible → IsAbsIrredRep (subquotRep W₁ W₂)) ∧
  ∀ c : Γ, c ∉ CHT.pre r → ∀ W₁ W₂ : Subrepresentation (stdRep (CHT.rep r)), W₂ ≤ W₁ →
    (quotRep W₁).IsIrreducible → W₂.toRepresentation.IsIrreducible →
    ¬ IsConjTwistedDual (CHT.pre r).subtype c (quotRep W₁) W₂.toRepresentation (CHT.nuRes r)

/-- Thorne 2015, Lemma 3.3(1): for a Schur `r̄` with `Γ = Δ ⋊ {1, c}`, the restriction `r̄|Δ` is
semisimple and multiplicity free, and every irreducible constituent `ρ` satisfies
`ρ^c ≅ ρ^∨ ⊗ (ν ∘ r̄)`. -/
theorem IsSchur.semisimple_multiplicityFree {r : Γ →* CHT n k} (hr : IsSchur r)
    (hΔ : (CHT.pre r).index = 2) (c : Γ) (hc : c ∉ CHT.pre r) (hc2 : c * c = 1) :
    ComplementedLattice (Subrepresentation (stdRep (CHT.rep r))) ∧
    (∀ W W' : Subrepresentation (stdRep (CHT.rep r)), W.toRepresentation.IsIrreducible →
      W'.toRepresentation.IsIrreducible →
      Nonempty (W.toRepresentation.Equiv W'.toRepresentation) → W = W') ∧
    ∀ W : Subrepresentation (stdRep (CHT.rep r)), W.toRepresentation.IsIrreducible →
      IsConjTwistedDual (CHT.pre r).subtype c W.toRepresentation W.toRepresentation
        (CHT.nuRes r) := by
  sorry

/-- Thorne 2015, Lemma 3.3(2): over an algebraically closed field, two Schur homomorphisms
`Γ → 𝒢_n(k)` with the same `Δ`, the same trace on `Δ` and the same multiplier are conjugate by an
element of `GL_n(k)`. The equality of multipliers is needed; the source does not print it. -/
theorem IsSchur.conj_of_trace_eq [IsAlgClosed k] {r r' : Γ →* CHT n k} (hr : IsSchur r)
    (hr' : IsSchur r') (Δ : Subgroup Γ) (hΔ : Δ.index = 2) (hpre : CHT.pre r = Δ)
    (hpre' : CHT.pre r' = Δ) (c : Γ) (hc : c ∉ Δ) (hc2 : c * c = 1)
    (htr : ∀ δ : Δ, Matrix.trace (CHT.glOf r Δ.subtype δ : Matrix (Fin n) (Fin n) k) =
      Matrix.trace (CHT.glOf r' Δ.subtype δ : Matrix (Fin n) (Fin n) k))
    (hν : (CHT.nu n k).comp r = (CHT.nu n k).comp r') :
    CHT.ConjGL r r' := by
  sorry

/-- Thorne 2015, Lemma 3.3(2) over a general field: two Schur homomorphisms with the same trace
on `Δ` and the same multiplier become `GL_n`-conjugate over an algebraic closure. -/
theorem IsSchur.conj_of_trace_eq_algebraicClosure {r r' : Γ →* CHT n k} (hr : IsSchur r)
    (hr' : IsSchur r') (Δ : Subgroup Γ) (hΔ : Δ.index = 2) (hpre : CHT.pre r = Δ)
    (hpre' : CHT.pre r' = Δ) (c : Γ) (hc : c ∉ Δ) (hc2 : c * c = 1)
    (htr : ∀ δ : Δ, Matrix.trace (CHT.glOf r Δ.subtype δ : Matrix (Fin n) (Fin n) k) =
      Matrix.trace (CHT.glOf r' Δ.subtype δ : Matrix (Fin n) (Fin n) k))
    (hν : (CHT.nu n k).comp r = (CHT.nu n k).comp r') :
    CHT.ConjGL ((CHT.map n (algebraMap k (AlgebraicClosure k))).comp r)
      ((CHT.map n (algebraMap k (AlgebraicClosure k))).comp r') := by
  sorry

/-- Thorne 2015, Lemma 3.3(3): if `r̄` is Schur, `Γ = Δ ⋊ {1, c}` and the characteristic of `k`
is not `2`, then `H⁰(Γ, ad r̄) = 0`. -/
theorem IsSchur.h0_ad_eq_zero {r : Γ →* CHT n k} (hr : IsSchur r) (hΔ : (CHT.pre r).index = 2)
    (c : Γ) (hc : c ∉ CHT.pre r) (hc2 : c * c = 1) (h2 : (2 : k) ≠ 0)
    (X : Matrix (Fin n) (Fin n) k) (hX : ∀ γ, CHT.ad n k (r γ) X = X) : X = 0 := by
  sorry

/-- **`PL.6/schur-residual-representation`.** The extensions of `ρ : Δ → GL_n(k)` to a
homomorphism `r̄ : Γ → 𝒢_n(k)` with `r̄⁻¹(𝒢_n⁰(k)) = Δ` and `ν ∘ r̄ = µ` (Thorne 2015,
Lemma 3.4). -/
def extensionsOfPolarizedSum (Δ : Subgroup Γ) (ρ : Δ →* GL (Fin n) k) (μ : Γ →* kˣ) :
    Set (Γ →* CHT n k) :=
  {r | CHT.pre r = Δ ∧ CHT.glOf r Δ.subtype = ρ ∧ (CHT.nu n k).comp r = μ}

open Classical in
/-- The map `Γ → 𝒢_n(k)` equal to `r` on `Δ` and to `(z, 1) r` outside `Δ`. For `z = ⊕ α_i` a
block scalar matrix commuting with `r(Δ)` and `r(c) = (A, -µ(c))ȷ` this replaces the blocks `A_i`
of `A` by `α_i A_i`. -/
def scaleExtension (Δ : Subgroup Γ) (z : GL (Fin n) k) (r : Γ →* CHT n k) (γ : Γ) : CHT n k :=
  if γ ∈ Δ then r γ else CHT.ofGL n k z * r γ

/-- The hypotheses of Thorne 2015, Lemma 3.4, on `ρ = ⊕ ρ_i : Δ → GL_n(k)` and a character `µ` of
`Γ = Δ ⋊ {1, c}`: every `ρ_i` is absolutely irreducible and carries a perfect pairing
`⟨x, y⟩_i = ᵗx J_i y` with `⟨x, y⟩_i = -µ(c)⟨y, x⟩_i` and
`⟨ρ_i(δ)x, ρ_i(δ^c)y⟩_i = µ(δ)⟨x, y⟩_i`, and `ρ_i ≇ ρ_j`, `ρ_j^c ≇ ρ_i^∨ ⊗ µ` for `i ≠ j`. -/
structure IsPolarizedSum (Δ : Subgroup Γ) (c : Γ) (μ : Γ →* kˣ) {s : ℕ} {m : Fin s → ℕ}
    (e : (Σ i : Fin s, Fin (m i)) ≃ Fin n) (ρs : (i : Fin s) → Δ →* GL (Fin (m i)) k)
    (ρ : Δ →* GL (Fin n) k) : Prop where
  index_eq : Δ.index = 2
  not_mem : c ∉ Δ
  mul_self : c * c = 1
  eq_blockSum : ∀ δ, ρ δ = blockSum e (fun i => ρs i) δ
  absIrred : ∀ i, IsAbsIrred (ρs i)
  pairing : ∀ i, ∃ J : Matrix (Fin (m i)) (Fin (m i)) k, J.det ≠ 0 ∧
    J = -((μ c : kˣ) : k) • J.transpose ∧
    ∀ δ δ' : Δ, (δ' : Γ) = c * δ * c⁻¹ →
      (ρs i δ : Matrix (Fin (m i)) (Fin (m i)) k).transpose * J *
        (ρs i δ' : Matrix (Fin (m i)) (Fin (m i)) k) = ((μ δ : kˣ) : k) • J
  not_iso : ∀ i j, i ≠ j → IsEmpty ((stdRep (ρs i)).Equiv (stdRep (ρs j)))
  not_conj_dual : ∀ i j, i ≠ j →
    ¬ IsConjTwistedDual Δ.subtype c (stdRep (ρs j)) (stdRep (ρs i)) (μ.comp Δ.subtype)

/-- Thorne 2015, Lemma 3.4, existence: under its hypotheses `ρ` extends to `r̄ : Γ → 𝒢_n(k)` with
`r̄⁻¹(𝒢_n⁰(k)) = Δ` and `ν ∘ r̄ = µ`. -/
theorem extensionsOfPolarizedSum_nonempty {Δ : Subgroup Γ} {c : Γ} {μ : Γ →* kˣ} {s : ℕ}
    {m : Fin s → ℕ} {e : (Σ i : Fin s, Fin (m i)) ≃ Fin n}
    {ρs : (i : Fin s) → Δ →* GL (Fin (m i)) k} {ρ : Δ →* GL (Fin n) k}
    (h : IsPolarizedSum Δ c μ e ρs ρ) : (extensionsOfPolarizedSum Δ ρ μ).Nonempty := by
  sorry

/-- Thorne 2015, Lemma 3.4: every extension of `ρ` with multiplier `µ` is Schur. -/
theorem extensionsOfPolarizedSum_isSchur {Δ : Subgroup Γ} {c : Γ} {μ : Γ →* kˣ} {s : ℕ}
    {m : Fin s → ℕ} {e : (Σ i : Fin s, Fin (m i)) ≃ Fin n}
    {ρs : (i : Fin s) → Δ →* GL (Fin (m i)) k} {ρ : Δ →* GL (Fin n) k}
    (h : IsPolarizedSum Δ c μ e ρs ρ) (r : Γ →* CHT n k)
    (hr : r ∈ extensionsOfPolarizedSum Δ ρ μ) : IsSchur r := by
  sorry

/-- Thorne 2015, Lemma 3.4: the `GL_n(k)`-conjugacy classes of the extensions of `ρ` with
multiplier `µ` form a principal homogeneous space under `∏_i k^×/(k^×)²`, where `(α_i)` replaces
`A = ⊕ A_i` in `r̄(c) = (A, -µ(c))ȷ` by `⊕ α_i A_i`: the rescaled map is again an extension, any
two extensions differ by a rescaling up to conjugacy, and two rescalings of the same extension are
conjugate exactly when the scalars differ by squares. -/
theorem extensionsOfPolarizedSum_torsor {Δ : Subgroup Γ} {c : Γ} {μ : Γ →* kˣ} {s : ℕ}
    {m : Fin s → ℕ} {e : (Σ i : Fin s, Fin (m i)) ≃ Fin n}
    {ρs : (i : Fin s) → Δ →* GL (Fin (m i)) k} {ρ : Δ →* GL (Fin n) k}
    (h : IsPolarizedSum Δ c μ e ρs ρ) :
    (∀ r ∈ extensionsOfPolarizedSum Δ ρ μ, ∀ α : Fin s → kˣ,
      ∃ r' ∈ extensionsOfPolarizedSum Δ ρ μ, ∀ γ, r' γ = scaleExtension Δ (blockScalar e α) r γ) ∧
    (∀ r ∈ extensionsOfPolarizedSum Δ ρ μ, ∀ r' ∈ extensionsOfPolarizedSum Δ ρ μ,
      ∃ α : Fin s → kˣ, CHT.ConjGL (scaleExtension Δ (blockScalar e α) r) r') ∧
    ∀ r ∈ extensionsOfPolarizedSum Δ ρ μ, ∀ α β : Fin s → kˣ,
      CHT.ConjGL (scaleExtension Δ (blockScalar e α) r) (scaleExtension Δ (blockScalar e β) r) ↔
        ∀ i, ∃ u : kˣ, β i = α i * u ^ 2 := by
  sorry

/-- If `r̄|Δ` is absolutely irreducible then `r̄` is Schur: the second condition is vacuous. -/
theorem IsSchur.of_absIrred (r : Γ →* CHT n k) (h : IsAbsIrred (CHT.rep r)) : IsSchur r := by
  sorry

/-- Thorne 2015, Lemma 3.4 with one constituent: an absolutely irreducible `ρ̄ : Δ → GL_n(k)`
with a perfect pairing of sign `-µ(c)` satisfying `⟨ρ̄(δ)x, ρ̄(δ^c)y⟩ = µ(δ)⟨x, y⟩` extends to a
Schur homomorphism `r̄ : Γ → 𝒢_n(k)` with multiplier `µ`. -/
theorem IsSchur.exists_of_absIrred_pairing (Δ : Subgroup Γ) (hΔ : Δ.index = 2) (c : Γ)
    (hc : c ∉ Δ) (hc2 : c * c = 1) (μ : Γ →* kˣ) (ρ : Δ →* GL (Fin n) k) (hρ : IsAbsIrred ρ)
    (J : Matrix (Fin n) (Fin n) k) (hJ : J.det ≠ 0) (hsign : J = -((μ c : kˣ) : k) • J.transpose)
    (hcompat : ∀ δ δ' : Δ, (δ' : Γ) = c * δ * c⁻¹ →
      (ρ δ : Matrix (Fin n) (Fin n) k).transpose * J * (ρ δ' : Matrix (Fin n) (Fin n) k) =
        ((μ δ : kˣ) : k) • J) :
    ∃ r ∈ extensionsOfPolarizedSum Δ ρ μ, IsSchur r := by
  sorry

-- test: schur_absIrred
example (r : Γ →* CHT n k) (h : IsAbsIrred (CHT.rep r)) : IsSchur r := by
  sorry

-- test: schur_characters
example (h2 : (2 : k) ≠ 0) (Δ : Subgroup Γ) (hΔ : Δ.index = 2) (c : Γ) (hc : c ∉ Δ)
    (hc2 : c * c = 1) (μ : Γ →* kˣ) (hμ : μ c = -1) (χ₁ χ₂ : Δ →* kˣ) (hχ : χ₁ ≠ χ₂)
    (h₁ : ∀ δ δ' : Δ, (δ' : Γ) = c * δ * c⁻¹ → χ₁ δ * χ₁ δ' = μ δ)
    (h₂ : ∀ δ δ' : Δ, (δ' : Γ) = c * δ * c⁻¹ → χ₂ δ * χ₂ δ' = μ δ) :
    (extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ).Nonempty ∧
    (∀ r ∈ extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ, IsSchur r) ∧
    (∀ r ∈ extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ, ∀ α : Fin 2 → kˣ,
      ∃ r' ∈ extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ,
        ∀ γ, r' γ = scaleExtension Δ (diagGL α) r γ) ∧
    (∀ r ∈ extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ,
      ∀ r' ∈ extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ,
      ∃ α : Fin 2 → kˣ, CHT.ConjGL (scaleExtension Δ (diagGL α) r) r') ∧
    (∀ r ∈ extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ, ∀ α β : Fin 2 → kˣ,
      CHT.ConjGL (scaleExtension Δ (diagGL α) r) (scaleExtension Δ (diagGL β) r) ↔
        ∀ i, ∃ u : kˣ, β i = α i * u ^ 2) ∧
    (Finite k → Nat.card (Quot fun r r' : extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ =>
      CHT.ConjGL (r : Γ →* CHT 2 k) (r' : Γ →* CHT 2 k)) = 4) := by
  sorry

-- test: schur_characters (the conditions of Lemma 3.4 that are automatic: `χ₂^c ≠ χ₁⁻¹µ`
-- follows from `χ₁ ≠ χ₂`, and `µ(c) = -1` is forced because a pairing on a line is symmetric)
example (h2 : (2 : k) ≠ 0) (Δ : Subgroup Γ) (hΔ : Δ.index = 2) (c : Γ) (hc : c ∉ Δ)
    (hc2 : c * c = 1) (μ : Γ →* kˣ) (χ₁ χ₂ : Δ →* kˣ) (hχ : χ₁ ≠ χ₂)
    (h₁ : ∀ δ δ' : Δ, (δ' : Γ) = c * δ * c⁻¹ → χ₁ δ * χ₁ δ' = μ δ)
    (h₂ : ∀ δ δ' : Δ, (δ' : Γ) = c * δ * c⁻¹ → χ₂ δ * χ₂ δ' = μ δ) :
    (∃ δ δ' : Δ, (δ' : Γ) = c * δ * c⁻¹ ∧ χ₂ δ' ≠ (χ₁ δ)⁻¹ * μ δ) ∧
    ((extensionsOfPolarizedSum Δ (diagChar ![χ₁, χ₂]) μ).Nonempty → μ c = -1) := by
  sorry

-- test: not_schur_repeated
example (r : Γ →* CHT 2 k) (hΔ : (CHT.pre r).index = 2) (c : Γ) (hc : c ∉ CHT.pre r)
    (hc2 : c * c = 1) (χ : CHT.pre r →* kˣ)
    (h : Conj (CHT.rep r : CHT.pre r → GL (Fin 2) k) (diagChar ![χ, χ])) :
    ¬ IsSchur r ∧
    (∃ W W' : Subrepresentation (stdRep (CHT.rep r)), W.toRepresentation.IsIrreducible ∧
      W'.toRepresentation.IsIrreducible ∧
      Nonempty (W.toRepresentation.Equiv W'.toRepresentation) ∧ W ≠ W') ∧
    ∃ X : Matrix (Fin 2) (Fin 2) k, X ≠ 0 ∧ ∀ γ, CHT.ad 2 k (r γ) X = X := by
  sorry

-- test: schur_h0
example {r : Γ →* CHT n k} (hr : IsSchur r) (hΔ : (CHT.pre r).index = 2) (c : Γ)
    (hc : c ∉ CHT.pre r) (hc2 : c * c = 1) (d : ℕ)
    (hd : Nat.card {W : Subrepresentation (stdRep (CHT.rep r)) //
      W.toRepresentation.IsIrreducible} = d) :
    Module.finrank k (⨅ δ : CHT.pre r,
      LinearMap.ker (CHT.ad n k (r δ) - LinearMap.id) :
        Submodule k (Matrix (Fin n) (Fin n) k)) = d ∧
    (∀ X : Matrix (Fin n) (Fin n) k, (∀ δ : CHT.pre r, CHT.ad n k (r δ) X = X) →
      CHT.ad n k (r c) X = -X) ∧
    ((2 : k) ≠ 0 → ∀ X : Matrix (Fin n) (Fin n) k, (∀ γ, CHT.ad n k (r γ) X = X) → X = 0) ∧
    ((2 : k) = 0 → Module.finrank k (⨅ γ : Γ,
      LinearMap.ker (CHT.ad n k (r γ) - LinearMap.id) :
        Submodule k (Matrix (Fin n) (Fin n) k)) = d) := by
  sorry

end Schur

end TauCeti.Automorphy
namespace TauCeti.Automorphy

/-! ### PL.6/primitive-representation: Primitive representations -/

section Primitive

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {k : Type*} [Field k] {n : ℕ}

/-- **`PL.6/primitive-representation`.** `ρ̄ : Γ → GL_n(k)` is primitive: it is not isomorphic to
`Ind_{Γ'}^Γ σ̄` for any proper open subgroup `Γ' ⊂ Γ` and any continuous `σ̄ : Γ' → GL_m(k)`
(Newton–Thorne 2021 §5). Induction is Mathlib's `Representation.ind` along the inclusion, and
isomorphism is `Representation.Equiv`; `k` is discrete, so continuity means open kernel. For a
profinite `Γ` the open subgroups are the closed subgroups of finite index, and an isomorphism
forces `m [Γ : Γ'] = n`. -/
def IsPrimitive (ρ : Γ →* GL (Fin n) k) : Prop :=
  ∀ Γ' : Subgroup Γ, IsOpen (Γ' : Set Γ) → Γ' ≠ ⊤ →
    ∀ (m : ℕ) (σ : Γ' →* GL (Fin m) k), IsOpen (σ.ker : Set Γ') →
      IsEmpty ((stdRep ρ).Equiv (Representation.ind Γ'.subtype (stdRep σ)))

/-- **`PL.6/primitive-representation`.** `ρ̄` is strongly primitive: it is semisimple and is not
the semisimplification of `Ind_{Γ'}^Γ τ̄` for any proper open subgroup `Γ' ⊂ Γ` and any continuous
`τ̄ : Γ' → GL_m(k)`. This is the form of primitivity used by the Clifford-theory step of
Thorne 2015, Proposition 5.3. -/
def IsStronglyPrimitive (ρ : Γ →* GL (Fin n) k) : Prop :=
  ComplementedLattice (Subrepresentation (stdRep ρ)) ∧
  ∀ Γ' : Subgroup Γ, IsOpen (Γ' : Set Γ) → Γ' ≠ ⊤ →
    ∀ (m : ℕ) (τ : Γ' →* GL (Fin m) k), IsOpen (τ.ker : Set Γ') →
      ¬ IsSemisimplificationOf (stdRep ρ) (Representation.ind Γ'.subtype (stdRep τ))

/-- Primitivity depends only on the image (Allen–Newton–Thorne, proof of Lemma 5.2): for a
continuous `ρ̄` of a profinite group and an open subgroup `Γ''` with `ρ̄(Γ'') = ρ̄(Γ)`, the
restriction `ρ̄|Γ''` is primitive if and only if `ρ̄` is. -/
theorem IsPrimitive.restrict [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ]
    [TotallyDisconnectedSpace Γ] (ρ : Γ →* GL (Fin n) k) (hρ : IsOpen (ρ.ker : Set Γ))
    (Γ'' : Subgroup Γ) (hΓ'' : IsOpen (Γ'' : Set Γ)) (himage : Γ''.map ρ = ρ.range) :
    IsPrimitive (ρ.comp Γ''.subtype) ↔ IsPrimitive ρ := by
  sorry

/-- Every one-dimensional continuous representation of a profinite group is primitive. -/
theorem isPrimitive_of_dim_one [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ]
    [TotallyDisconnectedSpace Γ] (ρ : Γ →* GL (Fin 1) k) (hρ : IsOpen (ρ.ker : Set Γ)) :
    IsPrimitive ρ := by
  sorry

/-- `Ind_{Γ'}^Γ σ̄` with `[Γ : Γ'] > 1` is not primitive. -/
theorem not_isPrimitive_ind [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ]
    [TotallyDisconnectedSpace Γ] (Γ' : Subgroup Γ) (hΓ' : IsOpen (Γ' : Set Γ))
    (hindex : 1 < Γ'.index) (m : ℕ) (σ : Γ' →* GL (Fin m) k) (hσ : IsOpen (σ.ker : Set Γ'))
    (ρ : Γ →* GL (Fin n) k)
    (e : (stdRep ρ).Equiv (Representation.ind Γ'.subtype (stdRep σ))) : ¬ IsPrimitive ρ := by
  sorry

/-- A sum of continuous characters `χ_1 ⊕ ⋯ ⊕ χ_n` of a profinite group with `χ_i/χ_j` of order
greater than `n` for `i ≠ j` is primitive (Newton–Thorne 2021, Lemma 5.1; see
`character_sums_primitive`). -/
theorem isPrimitive_of_characters [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ]
    [TotallyDisconnectedSpace Γ] (χ : Fin n → Γ →* kˣ)
    (hχ : ∀ i, IsOpen ((χ i).ker : Set Γ))
    (hratio : ∀ i j, i ≠ j → ∀ m : ℕ, 0 < m → m ≤ n → (χ i / χ j) ^ m ≠ 1) :
    IsPrimitive (diagChar χ) := by
  sorry

/-- A strongly primitive representation is primitive: if `ρ̄ ≅ Ind_{Γ'}^Γ σ̄` with `ρ̄` semisimple
then `ρ̄` is the semisimplification of `Ind_{Γ'}^Γ σ̄`. -/
theorem IsStronglyPrimitive.isPrimitive {ρ : Γ →* GL (Fin n) k} (h : IsStronglyPrimitive ρ) :
    IsPrimitive ρ := by
  sorry

-- test: primitive_dim_one
example [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]
    (χ : Γ →* kˣ) (hχ : IsOpen (χ.ker : Set Γ)) :
    IsPrimitive (diagChar fun _ : Fin 1 => χ) := by
  sorry

-- test: not_primitive_induced
example [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]
    (Γ' : Subgroup Γ) (hΓ' : IsOpen (Γ' : Set Γ)) (hindex : Γ'.index = 2) (θ : Γ' →* kˣ)
    (hθ : IsOpen (θ.ker : Set Γ')) (ρ : Γ →* GL (Fin 2) k)
    (e : (stdRep ρ).Equiv (Representation.ind Γ'.subtype (stdRep (diagChar fun _ : Fin 1 => θ)))) :
    ¬ IsPrimitive ρ := by
  sorry

-- test: primitive_characters
example [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]
    [Fact (Nat.Prime 7)] (χ₁ χ₂ : Γ →* (ZMod 7)ˣ) (h₁ : IsOpen (χ₁.ker : Set Γ))
    (h₂ : IsOpen (χ₂.ker : Set Γ)) (horder : orderOf (χ₁ / χ₂) = 3) :
    IsPrimitive (diagChar ![χ₁, χ₂]) := by
  sorry

-- test: not_primitive_small_ratio
example [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]
    (χ₁ χ₂ : Γ →* kˣ) (h₁ : IsOpen (χ₁.ker : Set Γ)) (h₂ : IsOpen (χ₂.ker : Set Γ))
    (horder : orderOf (χ₁ / χ₂) = 2) :
    Nonempty ((stdRep (diagChar ![χ₁, χ₂])).Equiv
      (Representation.ind (χ₁ / χ₂).ker.subtype
        (stdRep (diagChar fun _ : Fin 1 => χ₁.comp (χ₁ / χ₂).ker.subtype)))) ∧
    ¬ IsPrimitive (diagChar ![χ₁, χ₂]) := by
  sorry

/-- The matrix of the `a`-th symmetric power of the standard representation of `SL₂`: the action
`(g · f)(X, Y) = f((X, Y) g)` on binary forms of degree `a`, in the basis `X^{a-i} Y^i`
(`0 ≤ i ≤ a`), computed after setting `X = 1`. -/
def symPowMatrix {A : Type*} [CommRing A] (a : ℕ) (g : Matrix (Fin 2) (Fin 2) A) :
    Matrix (Fin (a + 1)) (Fin (a + 1)) A :=
  Matrix.of fun j i =>
    ((Polynomial.C (g 0 0) + Polynomial.C (g 1 0) * Polynomial.X) ^ (a - (i : ℕ)) *
      (Polynomial.C (g 0 1) + Polynomial.C (g 1 1) * Polynomial.X) ^ (i : ℕ)).coeff j

/-- The representation `Sym^a` of `SL₂(A)` on binary forms of degree `a`. -/
def symPow {A : Type*} [CommRing A] (a : ℕ) :
    Matrix.SpecialLinearGroup (Fin 2) A →* GL (Fin (a + 1)) A where
  toFun g := ⟨symPowMatrix a g, symPowMatrix a (g⁻¹ : Matrix.SpecialLinearGroup (Fin 2) A),
    by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

-- test: primitive_not_stronglyPrimitive
example (l : ℕ) [Fact l.Prime] (hl : 13 ≤ l) (a : ℕ) (ha : 0 < a) (ha' : a < l - 1)
    (ha'' : 2 * a ≠ l - 1)
    [TopologicalSpace (Matrix.SpecialLinearGroup (Fin 2) (ZMod l))]
    [DiscreteTopology (Matrix.SpecialLinearGroup (Fin 2) (ZMod l))]
    (B : Subgroup (Matrix.SpecialLinearGroup (Fin 2) (ZMod l)))
    (hB : ∀ g : Matrix.SpecialLinearGroup (Fin 2) (ZMod l), g ∈ B ↔ g 1 0 = 0)
    (χ : B →* (AlgebraicClosure (ZMod l))ˣ)
    (hχ : ∀ b : B, ((χ b : (AlgebraicClosure (ZMod l))ˣ) : AlgebraicClosure (ZMod l)) =
      algebraMap (ZMod l) (AlgebraicClosure (ZMod l))
        ((b : Matrix.SpecialLinearGroup (Fin 2) (ZMod l)) 0 0) ^ a)
    (ρ : Matrix.SpecialLinearGroup (Fin 2) (ZMod l) →* GL (Fin (l + 1)) (AlgebraicClosure (ZMod l)))
    (e : (stdRep ρ).Equiv
      ((stdRep ((symPow a).comp (Matrix.SpecialLinearGroup.map
          (algebraMap (ZMod l) (AlgebraicClosure (ZMod l)))))).prod
        (stdRep ((symPow (l - 1 - a)).comp (Matrix.SpecialLinearGroup.map
          (algebraMap (ZMod l) (AlgebraicClosure (ZMod l)))))))) :
    ComplementedLattice (Subrepresentation (stdRep ρ)) ∧ IsPrimitive ρ ∧
    ¬ ComplementedLattice (Subrepresentation
      (Representation.ind B.subtype (stdRep (diagChar fun _ : Fin 1 => χ)))) ∧
    IsSemisimplificationOf (stdRep ρ)
      (Representation.ind B.subtype (stdRep (diagChar fun _ : Fin 1 => χ))) ∧
    ¬ IsStronglyPrimitive ρ := by
  sorry

end Primitive

/-! ### PL.6/character-sums-primitive: Sums of characters with large ratios are primitive -/

/-- **`PL.6/character-sums-primitive`** (Newton–Thorne 2021, Lemma 5.1). Let `Γ` be a profinite
group, `k` a field and `χ_1, …, χ_n : Γ → k^×` continuous characters such that `χ_i/χ_j` has order
greater than `n` for `i ≠ j`. Then `χ_1 ⊕ ⋯ ⊕ χ_n` is primitive. -/
theorem character_sums_primitive {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]
    {k : Type*} [Field k] {n : ℕ} (χ : Fin n → Γ →* kˣ)
    (hχ : ∀ i, IsOpen ((χ i).ker : Set Γ))
    (hratio : ∀ i j, i ≠ j → ∀ m : ℕ, 0 < m → m ≤ n → (χ i / χ j) ^ m ≠ 1) :
    IsPrimitive (diagChar χ) := by
  sorry

end TauCeti.Automorphy
namespace TauCeti.CommAlg

/-! ### PL.6/connectedness-dimension: Connectedness dimension and arithmetic rank -/

section ConnectednessDimension

/-- **`PL.6/connectedness-dimension`.** The connectedness dimension `c(R)` (Thorne 2015,
Definition 1.7): the infimum, over the partitions of the set of minimal primes of `R` into two
non-empty blocks `𝒞₁`, `𝒞₂`, of the Krull dimension of `⋃_{𝔭 ∈ 𝒞₁, 𝔮 ∈ 𝒞₂} V(𝔭 + 𝔮)`, that is of
`R / ⋂ (𝔭 + 𝔮)`. When `Spec R` is irreducible there is no such partition and `c(R) = dim R`
(the convention of Brodmann–Rung). Each term is at most `dim R`, so the infimum is taken together
with `dim R`. -/
def connectednessDim (R : Type*) [CommRing R] : WithBot ℕ∞ :=
  ringKrullDim R ⊓ ⨅ (A : Set (Ideal R)) (_ : A.Nonempty) (_ : A ⊂ minimalPrimes R),
    ringKrullDim (R ⧸ ⨅ p ∈ A, ⨅ q ∈ minimalPrimes R \ A, p ⊔ q)

/-- **`PL.6/connectedness-dimension`.** The arithmetic rank `r(I)`: the least `r` such that
`√(f₁, …, f_r) = √I` for some `f₁, …, f_r ∈ R` (`⊤` if there is no such `r`). -/
def arithmeticRank {R : Type*} [CommRing R] (I : Ideal R) : ℕ∞ :=
  ⨅ (r : ℕ) (_ : ∃ f : Fin r → R, (Ideal.span (Set.range f)).radical = I.radical), (r : ℕ∞)

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- Thorne 2015, Proposition 1.8 (quoted there from Brodmann–Rung, Theorem 2.4): for a complete
Noetherian local `𝒪`-algebra `R` with residue field `k` and a proper ideal `I`,
`c(R/I) ≥ c(R) - r(I) - 1`. -/
theorem connectednessDim_quotient (R : Type*) [CommRing R] [Algebra 𝒪[E] R]
    (hR : TauCeti.Automorphy.IsCNL 𝒪[E] R) (I : Ideal R) (hI : I ≠ ⊤) :
    connectednessDim R ≤ connectednessDim (R ⧸ I) + (arithmeticRank I : WithBot ℕ∞) + 1 := by
  sorry

/-- If `Spec R` is irreducible (at most one minimal prime) then `c(R) = dim R`. -/
theorem connectednessDim_of_irreducible (R : Type*) [CommRing R]
    (h : (minimalPrimes R).Subsingleton) : connectednessDim R = ringKrullDim R := by
  sorry

/-- `c(R) ≤ dim R`. -/
theorem connectednessDim_le_dim (R : Type*) [CommRing R] :
    connectednessDim R ≤ ringKrullDim R := by
  sorry

/-- `c(R) ≤ sdim R`: `c(R)` is at most the dimension of every irreducible component. -/
theorem connectednessDim_le_dim_component (R : Type*) [CommRing R] (p : Ideal R)
    (hp : p ∈ minimalPrimes R) : connectednessDim R ≤ ringKrullDim (R ⧸ p) := by
  sorry

/-- For a Noetherian local ring with at least two irreducible components, `c(R)` is strictly
smaller than the dimension of every irreducible component. -/
theorem connectednessDim_lt_dim_component (R : Type*) [CommRing R] [IsNoetherianRing R]
    [IsLocalRing R] (h : ¬ (minimalPrimes R).Subsingleton) (p : Ideal R)
    (hp : p ∈ minimalPrimes R) : connectednessDim R < ringKrullDim (R ⧸ p) := by
  sorry

/-- If `Spec R` has exactly two irreducible components `C`, `D` then `c(R) = dim (C ∩ D)`. -/
theorem connectednessDim_eq_of_two_components (R : Type*) [CommRing R] (p q : Ideal R)
    (hpq : p ≠ q) (h : minimalPrimes R = {p, q}) :
    connectednessDim R = ringKrullDim (R ⧸ (p ⊔ q)) := by
  sorry

/-- For a Noetherian ring and every partition `𝒞₁ ⊔ 𝒞₂` of its irreducible components into two
non-empty blocks there are `C ∈ 𝒞₁`, `D ∈ 𝒞₂` with `dim (C ∩ D) ≥ c(R)`. (With three or more
components `c(R) ≤ dim (C ∩ D)` can fail for a given pair.) -/
theorem connectednessDim_le_of_partition (R : Type*) [CommRing R] [IsNoetherianRing R]
    (A : Set (Ideal R)) (hA : A.Nonempty) (hA' : A ⊂ minimalPrimes R) :
    ∃ p ∈ A, ∃ q ∈ minimalPrimes R \ A, connectednessDim R ≤ ringKrullDim (R ⧸ (p ⊔ q)) := by
  sorry

-- test: cdim_node
example (k : Type*) [Field k] :
    connectednessDim (MvPowerSeries (Fin 2) k ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)}) = 0 ∧
    ringKrullDim (MvPowerSeries (Fin 2) k ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)}) = 1 := by
  sorry

-- test: cdim_node (equality in Proposition 1.8 for `R = k⟦x, y⟧`, `I = (xy)`: `0 = 2 - 1 - 1`)
example (k : Type*) [Field k] :
    connectednessDim (MvPowerSeries (Fin 2) k) = 2 ∧
    arithmeticRank
      (Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)}) = 1 := by
  sorry

-- test: cdim_domain
example (R : Type*) [CommRing R] [IsDomain R] : connectednessDim R = ringKrullDim R := by
  sorry

-- test: cdim_domain (a field)
example (k : Type*) [Field k] : connectednessDim k = 0 := by
  sorry

-- test: cdim_planes
example (k : Type*) [Field k] :
    connectednessDim (MvPowerSeries (Fin 4) k ⧸
      (Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 1} ⊓
        Ideal.span {(MvPowerSeries.X 2 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 3})) = 0 ∧
    ringKrullDim (MvPowerSeries (Fin 4) k ⧸
      (Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 1} ⊓
        Ideal.span {(MvPowerSeries.X 2 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 3})) = 2 := by
  sorry

-- test: arank_principal
example (R : Type*) [CommRing R] (I : Ideal R) :
    arithmeticRank I ≤ 1 ↔ ∃ f : R, (Ideal.span {f}).radical = I.radical := by
  sorry

-- test: arank_principal (the zero ideal)
example (R : Type*) [CommRing R] : arithmeticRank (⊥ : Ideal R) = 0 := by
  sorry

-- test: cdim_three_components
example (k : Type*) [Field k] :
    connectednessDim (MvPowerSeries (Fin 4) k ⧸
      (Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 1} ⊓
        Ideal.span {(MvPowerSeries.X 2 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 3} ⊓
        Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 3})) = 1 ∧
    ringKrullDim (MvPowerSeries (Fin 4) k ⧸
      (Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 1} ⊔
        Ideal.span {(MvPowerSeries.X 2 : MvPowerSeries (Fin 4) k), MvPowerSeries.X 3})) = 0 := by
  sorry

end ConnectednessDimension

end TauCeti.CommAlg
namespace TauCeti.Automorphy

/-! ### PL.6/polarized-pseudodeformation-subring: The subring P_𝒮 generated by characteristic
polynomials -/

section Pseudodeformation

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]
variable {l : ℕ} [Fact l.Prime] [ResChar E l]

/-- **`PL.6/polarized-pseudodeformation-subring`.** The ring `Q_𝒮`: the complete Noetherian local
`𝒪`-algebra representing the functor `PDef_𝒮` of continuous determinants `D : G_{F,S} → R` of
dimension `n` with `D ⊗_R k = D̄ = det ∘ r̄|G_{F,S}` on `C_𝒪` (Thorne 2015, Definition 3.25 and
Proposition 3.26, from Chenevier). -/
def pseudoDeformationRing (S : DefProblem F E n Λ) : Type := sorry

instance (S : DefProblem F E n Λ) : CommRing (pseudoDeformationRing S) := sorry

instance (S : DefProblem F E n Λ) : Algebra 𝒪[E] (pseudoDeformationRing S) := sorry

/-- The universal determinant of `G_{F,S}` over `Q_𝒮`, inflated to `G_F`. -/
def pseudoDeformationRing.univ (S : DefProblem F E n Λ) :
    Determinant (Gal F) (pseudoDeformationRing S) n := sorry

/-- The homomorphism `Q_𝒮 → R^univ_𝒮` classifying the determinant of the universal deformation
(Thorne 2015, Definition 3.27). -/
def pseudoDeformationRing.toUniv (S : DefProblem F E n Λ) :
    pseudoDeformationRing S →+* S.univRing := sorry

/-- `Q_𝒮` is an object of `C_𝒪` (Thorne 2015, Proposition 3.26). -/
theorem pseudoDeformationRing_isCNL (S : DefProblem F E n Λ) (hl : Odd l)
    (hS : IsSchur S.resid) : IsCNL 𝒪[E] (pseudoDeformationRing S) := by
  sorry

/-- The coefficients of the characteristic polynomials of `r^univ(σ)`, `σ ∈ G_F`. They do not
depend on the universal lifting chosen in its strict equivalence class. -/
def charPolyCoeffs (S : DefProblem F E n Λ) : Set S.univRing :=
  {x | ∃ (σ : Gal F) (i : ℕ),
    x = (CHT.glRes S.univLift σ : Matrix (Fin n) (Fin n) S.univRing).charpoly.coeff i}

/-- The closure of a subalgebra of `A` for the `rad A`-adic topology, `rad A` the Jacobson
radical (the maximal ideal when `A` is local). -/
def adicClosure {R A : Type*} [CommRing R] [CommRing A] [Algebra R A] (P : Subalgebra R A) :
    Subalgebra R A where
  carrier := {x | ∀ k : ℕ, ∃ p ∈ P, x - p ∈ Ideal.jacobson (⊥ : Ideal A) ^ k}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

/-- **`PL.6/polarized-pseudodeformation-subring`.** `P_𝒮 ⊂ R^univ_𝒮`: the closed `Λ`-subalgebra
topologically generated by the coefficients of the characteristic polynomials of the elements of
`G_{F,S}` under the universal deformation; equivalently the image of `Q_𝒮 ⊗̂_𝒪 Λ → R^univ_𝒮`
(Thorne 2015, Definition 3.27). -/
def charPolySubring (S : DefProblem F E n Λ) : Subalgebra Λ S.univRing :=
  adicClosure (Algebra.adjoin Λ (charPolyCoeffs S))

/-- `P_𝒮` is the closure of the `Λ`-subalgebra generated by the image of `Q_𝒮`, and the map
`Q_𝒮 → R^univ_𝒮` carries the universal determinant to `det ∘ r^univ|G_{F,S}`. -/
theorem charPolySubring_eq_closure_range (S : DefProblem F E n Λ) (hl : Odd l)
    (hS : IsSchur S.resid) :
    charPolySubring S =
      adicClosure (Algebra.adjoin Λ (Set.range (pseudoDeformationRing.toUniv S))) ∧
    Determinant.map (pseudoDeformationRing.toUniv S) (pseudoDeformationRing.univ S) =
      Determinant.ofRep (CHT.glRes S.univLift) := by
  sorry

/-- Thorne 2015, Proposition 3.29(1): if `l` is odd and `r̄|G_{F,S}` is absolutely irreducible
then `P_𝒮 = R^univ_𝒮`. -/
theorem charPolySubring_eq_top_of_absIrred (S : DefProblem F E n Λ) (hl : Odd l)
    (h : IsAbsIrred (CHT.glRes S.resid)) : charPolySubring S = ⊤ := by
  sorry

/-- Thorne 2015, Proposition 3.29(2): if `l` is odd and `r̄` is Schur then `R^univ_𝒮` is a finite
`P_𝒮`-module. -/
theorem charPolySubring_finite (S : DefProblem F E n Λ) (hl : Odd l) (hS : IsSchur S.resid) :
    Module.Finite (charPolySubring S) S.univRing := by
  sorry

/-- The residual decomposition of Allen–Newton–Thorne §3.2: `r̄` is Schur and
`r̄|G_{F,S} = ρ̄_1 ⊕ ⋯ ⊕ ρ̄_d` in the block coordinates `e`, with every `ρ̄_i` absolutely
irreducible. (The `ρ̄_i` are then pairwise non-isomorphic and `r̄(c)` is block diagonal, so
`r̄ = ⊕ r̄_i`.) -/
structure IsResidualDecomposition (S : DefProblem F E n Λ) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) :
    Prop where
  schur : IsSchur S.resid
  eq_blockSum : ∀ σ, CHT.glRes S.resid σ = blockSum e (fun i => ρs i) σ
  continuous : ∀ i, IsContinuousResidual (ρs i)
  absIrred : ∀ i, IsAbsIrred (ρs i)

/-- The liftings of type `𝒮` are stable under conjugation by the block sign matrices
`µ₂^d ⊂ GL_n(𝒪)`. This holds when every local problem `𝒟_v` is stable under these conjugations,
as the ordinary, Steinberg, `χ_v`-ramified and unrestricted problems are. -/
def DefProblem.IsBlockSignStable (S : DefProblem F E n Λ) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) : Prop :=
  ∀ (A : Type) [CommRing A] [Algebra Λ A] (r : Gal (maximalRealSubfield F) →* CHT n A)
    (ε : Fin d → ℤˣ), (S.lifts A).Holds r → (S.lifts A).Holds (CHT.conjGL (blockSign A e ε) r)

/-- The action of `µ₂^d` on `R^univ_𝒮`: `ε` acts by the `Λ`-algebra automorphism classifying the
conjugate of the universal deformation by the block sign matrix `⊕ ε_i · 1_{m_i}`
(Allen–Newton–Thorne §3.2; Thorne 2015 §3.4 for `d = 2`). -/
def blockSignAction (S : DefProblem F E n Λ) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) : (Fin d → ℤˣ) →* (S.univRing ≃ₐ[Λ] S.univRing) :=
  sorry

/-- The defining property of the action of `µ₂^d`: the lifting classified by the automorphism
attached to `ε` is strictly equivalent to the conjugate of the universal lifting by the block
sign matrix of `ε`. -/
theorem blockSignAction_spec (S : DefProblem F E n Λ) (hl : Odd l) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (hdec : IsResidualDecomposition S e ρs) (hstable : S.IsBlockSignStable e) (ε : Fin d → ℤˣ) :
    CHT.StrictEquiv (S.liftOf (blockSignAction S e ε).toAlgHom)
      (CHT.conjGL (blockSign S.univRing e ε) S.univLift) := by
  sorry

/-- Allen–Newton–Thorne, Proposition 3.2(1): if `l` is odd, `r̄ = ⊕_{i=1}^d r̄_i` with absolutely
irreducible `ρ̄_i` and the liftings of type `𝒮` are stable under block sign conjugation, then
`P_𝒮 = (R^univ_𝒮)^{µ₂^d}`, and the diagonal `µ₂` acts trivially. -/
theorem charPolySubring_eq_invariants (S : DefProblem F E n Λ) (hl : Odd l) {d : ℕ}
    {m : Fin d → ℕ} (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n)
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) (hdec : IsResidualDecomposition S e ρs)
    (hstable : S.IsBlockSignStable e) :
    (∀ x : S.univRing, x ∈ charPolySubring S ↔ ∀ ε, blockSignAction S e ε x = x) ∧
    ∀ ε : Fin d → ℤˣ, (∀ i j, ε i = ε j) → blockSignAction S e ε = 1 := by
  sorry

/-- Allen–Newton–Thorne, Proposition 3.2(2) (Thorne 2015, Proposition 3.29(3) for `d = 2`): under
the hypotheses of `charPolySubring_eq_invariants`, for every prime `𝔭` of `R^univ_𝒮` such that
`r_𝔭|G_{F,S} ⊗ Frac(R^univ_𝒮/𝔭)` is absolutely irreducible, with `𝔮 = 𝔭 ∩ P_𝒮`, the inclusion
`P_𝒮 → R^univ_𝒮` is étale at every prime above `𝔮`, and `µ₂^d` permutes these primes
transitively. No condition on the dimension or the characteristic of `𝔭`. -/
theorem charPolySubring_etale (S : DefProblem F E n Λ) (hl : Odd l) {d : ℕ}
    {m : Fin d → ℕ} (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n)
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) (hdec : IsResidualDecomposition S e ρs)
    (hstable : S.IsBlockSignStable e) (𝔭 : Ideal S.univRing) [𝔭.IsPrime]
    (hirr : IsAbsIrredOverFrac (CHT.glRes (S.liftMod 𝔭)))
    (𝔭' : Ideal S.univRing) [𝔭'.IsPrime]
    (habove : 𝔭'.comap (charPolySubring S).val = 𝔭.comap (charPolySubring S).val) :
    (∃ f : S.univRing, f ∉ 𝔭' ∧ Algebra.Etale (charPolySubring S) (Localization.Away f)) ∧
    ∃ ε : Fin d → ℤˣ, 𝔭' = 𝔭.map (blockSignAction S e ε) := by
  sorry

/-- Thorne 2015, Lemma 3.28: for `q ≥ 0` there is `C = C(q, r̄, S)` such that for every
deformation problem `𝒮'` over the ordinary coefficient algebra of §3.2, with residual
representation `r̄`, unramified outside a set `S' ⊃ S` of
places split in `F` with `|S' - S| ≤ q`, the ring `P_{𝒮'}` is a quotient of a power series ring
over `𝒪` in `C` variables. -/
theorem charPolySubring_generators (hl : Odd l)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) (hcont : IsContinuousResidual rbar)
    (hS : IsSchur rbar) (S₀ : Set (Place F)) (hS₀ : S₀.Finite) (q : ℕ) :
    ∃ C : ℕ, ∀ S' : DefProblem F E n Λ,
      (ordinaryCoefficients F E n Λ l).Holds S' →
      S'.resid = rbar → S₀ ⊆ S'.places →
      (S'.places \ S₀).ncard ≤ q →
      ∃ f : MvPowerSeries (Fin C) 𝒪[E] →+* charPolySubring S', Function.Surjective f ∧
        ∀ a : 𝒪[E], f (MvPowerSeries.C a) =
          algebraMap Λ (charPolySubring S') (algebraMap 𝒪[E] Λ a) := by
  sorry

-- test: ps_absIrred
example (S : DefProblem F E n Λ) (hl : Odd l) (h : IsAbsIrred (CHT.glRes S.resid)) :
    Function.Surjective (charPolySubring S).val := by
  sorry

-- test: ps_two_characters
example (S : DefProblem F E 2 Λ) (hl : Odd l) (χ : Fin 2 → Gal F →* (𝓀[E])ˣ)
    (e : (Σ _ : Fin 2, Fin 1) ≃ Fin 2) (he : ∀ i, e ⟨i, 0⟩ = i)
    (hdec : IsResidualDecomposition S e fun i => diagChar fun _ : Fin 1 => χ i)
    (hstable : S.IsBlockSignStable e) :
    blockSignAction S e (fun _ => -1) = 1 ∧
    CHT.StrictEquiv (S.liftOf (blockSignAction S e ![1, -1]).toAlgHom)
      (CHT.conjGL (diagGL ![1, -1]) S.univLift) ∧
    (∀ (σ : Gal F) (i j : Fin 2), i ≠ j →
      (CHT.glRes (CHT.conjGL (diagGL ![1, -1]) S.univLift) σ : Matrix (Fin 2) (Fin 2) S.univRing)
          i j =
        -(CHT.glRes S.univLift σ : Matrix (Fin 2) (Fin 2) S.univRing) i j) ∧
    (∀ x : S.univRing, x ∈ charPolySubring S ↔ blockSignAction S e ![1, -1] x = x) ∧
    charPolySubring S = adicClosure (Algebra.adjoin Λ
      {x | ∃ σ : Gal F,
        x = Matrix.trace (CHT.glRes S.univLift σ : Matrix (Fin 2) (Fin 2) S.univRing) ∨
        x = Matrix.det (CHT.glRes S.univLift σ : Matrix (Fin 2) (Fin 2) S.univRing)}) := by
  sorry

-- test: ps_compatibility_determinants
example (S : DefProblem F E n Λ) (hl : Odd l) (hS : IsSchur S.resid) (A : Type) [CommRing A]
    [Algebra Λ A] (f : S.univRing →ₐ[Λ] A) :
    Determinant.map (f.toRingHom.comp (pseudoDeformationRing.toUniv S))
        (pseudoDeformationRing.univ S) =
      Determinant.ofRep (CHT.glRes (S.liftOf f)) := by
  sorry

-- test: ps_not_surjective_reducible (surjectivity criterion)
example (S : DefProblem F E n Λ) (hl : Odd l) (hS : IsSchur S.resid) :
    charPolySubring S = ⊤ ↔
      ((RingHom.ker S.residue).comap (charPolySubring S).val).map (charPolySubring S).val =
        RingHom.ker S.residue := by
  sorry

-- test: ps_not_surjective_reducible
example (S : DefProblem F E n Λ) (hl : Odd l) (hS : IsSchur S.resid)
    (g : S.univRing →+*
      Polynomial 𝓀[E] ⧸ Ideal.span {(Polynomial.X : Polynomial 𝓀[E]) ^ 2})
    (hΛ : ∀ a : Λ, g (algebraMap Λ S.univRing a) =
      algebraMap 𝓀[E] (Polynomial 𝓀[E] ⧸ Ideal.span {(Polynomial.X : Polynomial 𝓀[E]) ^ 2})
        (S.residue (algebraMap Λ S.univRing a)))
    (hnc : ¬ ∃ h : 𝓀[E] →+*
      Polynomial 𝓀[E] ⧸ Ideal.span {(Polynomial.X : Polynomial 𝓀[E]) ^ 2},
      g = h.comp S.residue)
    (hdet : Determinant.ofRep (CHT.glRes (S.liftAt g)) =
      Determinant.map
        (algebraMap 𝓀[E] (Polynomial 𝓀[E] ⧸ Ideal.span {(Polynomial.X : Polynomial 𝓀[E]) ^ 2}))
        (Determinant.ofRep (CHT.glRes S.resid))) :
    charPolySubring S ≠ ⊤ := by
  sorry

end Pseudodeformation

/-! ### PL.6/pseudodeformation-restriction-finite: Restriction of pseudodeformations to a
finite-index subgroup is finite -/

/-- Mazur's condition `Φ_p` (Chenevier's condition (F); GlobalGaloisDeformations
R04.2/phi-p-condition, restated in Mathlib's terms): every open subgroup of `Γ` has only finitely
many continuous homomorphisms to `ℤ/p`. -/
def SatisfiesPhiP (Γ : Type*) [Group Γ] [TopologicalSpace Γ] (p : ℕ) : Prop :=
  ∀ H : Subgroup Γ, IsOpen (H : Set Γ) →
    {f : H →* Multiplicative (ZMod p) | IsOpen (f.ker : Set H)}.Finite

/-- **`PL.6/pseudodeformation-restriction-finite`** (Newton–Thorne 2021, Lemma 5.3, stated there
for topologically finitely generated groups; the extension to condition (F) uses Chenevier,
Lemma 3.8 and Proposition 3.7). Let `Γ` be a profinite group satisfying condition (F), `Σ ⊂ Γ` a
closed subgroup of finite index and `t̄` a continuous determinant of `Γ` of dimension `n` over the
finite field `k`. Then the homomorphism `Q_{t̄|Σ} → Q_t̄` classifying restriction to `Σ` is
finite. -/
theorem pseudodeformation_restriction_finite {E : Type} [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] {l : ℕ} [Fact l.Prime] [ResChar E l]
    [TopologicalSpace 𝓀[E]] [DiscreteTopology 𝓀[E]] {n : ℕ}
    {Γ : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ]
    [T2Space Γ] [TotallyDisconnectedSpace Γ] (hΓ : SatisfiesPhiP Γ l)
    (H : Subgroup Γ) (hclosed : IsClosed (H : Set Γ)) (hfin : H.FiniteIndex)
    (t : Determinant Γ 𝓀[E] n) (ht : (continuousDeterminant Γ 𝓀[E] n).Holds t)
    (res : detDefRing E (t.comap H.subtype) →ₐ[𝒪[E]] detDefRing E t)
    (hres : Determinant.map res.toRingHom (detDefRing.univ E (t.comap H.subtype)) =
      (detDefRing.univ E t).comap H.subtype) :
    res.toRingHom.Finite := by
  sorry

end TauCeti.Automorphy
namespace TauCeti.Automorphy

/-! ### PL.6/reducibility-ideal: Split deformation ideals and determinant reducibility ideals -/

section Reducibility

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]
variable {l : ℕ} [Fact l.Prime] [ResChar E l]

/-- The two-constituent residual decomposition of Thorne 2015 §3.5: `r̄` is Schur and
`r̄ = r̄₁ ⊕ r̄₂` with `r̄_i : G_{F⁺,S} → 𝒢_{n_i}(k)` of multiplier `ν ∘ r̄` and `r̄_i|G_{F,S}`
absolutely irreducible. -/
structure IsTwoBlockResidual (S : DefProblem F E n Λ) {n₁ n₂ : ℕ} (h : n₁ + n₂ = n)
    (rbar₁ : Gal (maximalRealSubfield F) →* CHT n₁ 𝓀[E])
    (rbar₂ : Gal (maximalRealSubfield F) →* CHT n₂ 𝓀[E]) : Prop where
  schur : IsSchur S.resid
  eq_directSum : S.resid = CHT.directSum h rbar₁ rbar₂
  continuous₁ : IsContinuousResidual rbar₁
  continuous₂ : IsContinuousResidual rbar₂
  absIrred₁ : IsAbsIrred (CHT.glRes rbar₁)
  absIrred₂ : IsAbsIrred (CHT.glRes rbar₂)

/-- **`PL.6/reducibility-ideal`.** The reducible deformations `Def^red_𝒮(A) ⊂ Def_𝒮(A)` for the
residual decomposition `r̄ = r̄₁ ⊕ r̄₂` into blocks of sizes `n₁`, `n₂` (Thorne 2015,
Definition 3.31): the liftings of type `𝒮` that are strictly equivalent to a block sum
`r₁ ⊕ r₂` with `r_i : G_{F⁺,S} → 𝒢_{n_i}(A)`. The `r_i` then lift the `r̄_i`, being the blocks of
a lifting of `r̄₁ ⊕ r̄₂`. -/
def reducibleDeformations (S : DefProblem F E n Λ) {n₁ n₂ : ℕ} (h : n₁ + n₂ = n) (A : Type)
    [CommRing A] [Algebra Λ A] : Set (Gal (maximalRealSubfield F) →* CHT n A) :=
  {r | (S.lifts A).Holds r ∧
    ∃ (r₁ : Gal (maximalRealSubfield F) →* CHT n₁ A)
      (r₂ : Gal (maximalRealSubfield F) →* CHT n₂ A),
      CHT.StrictEquiv r (CHT.directSum h r₁ r₂)}

/-- **`PL.6/reducibility-ideal`.** The split ideal `I_split ⊂ R^univ_𝒮`: the smallest ideal `I`
such that the universal deformation modulo `I` is reducible. The quotient
`R^red_𝒮 = R^univ_𝒮/I_split` represents `Def^red_𝒮` (Thorne 2015, Proposition 3.32). -/
def splitReducibilityIdeal (S : DefProblem F E n Λ) {n₁ n₂ : ℕ} (h : n₁ + n₂ = n) :
    Ideal S.univRing :=
  sInf {I | S.liftMod I ∈ reducibleDeformations S h (S.univRing ⧸ I)}

/-- Thorne 2015, Proposition 3.32: `Def^red_𝒮` is represented by `R^univ_𝒮/I_split`. -/
theorem mem_reducibleDeformations_iff (S : DefProblem F E n Λ) (hl : Odd l) {n₁ n₂ : ℕ}
    (h : n₁ + n₂ = n) (rbar₁ : Gal (maximalRealSubfield F) →* CHT n₁ 𝓀[E])
    (rbar₂ : Gal (maximalRealSubfield F) →* CHT n₂ 𝓀[E])
    (hres : IsTwoBlockResidual S h rbar₁ rbar₂) (A : Type) [CommRing A] [Algebra Λ A]
    (hA : IsCNL Λ A) (f : S.univRing →ₐ[Λ] A) :
    S.liftOf f ∈ reducibleDeformations S h A ↔ splitReducibilityIdeal S h ≤ RingHom.ker f := by
  sorry

/-- Thorne 2015, Lemma 3.33: a prime `𝔭` of dimension one of `R^univ_𝒮` which does not contain
`I_split` has `r_𝔭|G_{F,S} ⊗ Frac(R^univ_𝒮/𝔭)` absolutely irreducible. -/
theorem absIrred_of_not_splitReducibilityIdeal_le (S : DefProblem F E n Λ) (hl : Odd l)
    {n₁ n₂ : ℕ} (h : n₁ + n₂ = n) (rbar₁ : Gal (maximalRealSubfield F) →* CHT n₁ 𝓀[E])
    (rbar₂ : Gal (maximalRealSubfield F) →* CHT n₂ 𝓀[E])
    (hres : IsTwoBlockResidual S h rbar₁ rbar₂) (𝔭 : Ideal S.univRing) [𝔭.IsPrime]
    (hdim : ringKrullDim (S.univRing ⧸ 𝔭) = 1) (h𝔭 : ¬ splitReducibilityIdeal S h ≤ 𝔭) :
    IsAbsIrredOverFrac (CHT.glRes (S.liftMod 𝔭)) := by
  sorry

/-- The determinant `D^univ = det ∘ r^univ|G_{F,S}` as a determinant valued in `P_𝒮` (it descends
to `P_𝒮` by Chenevier, Corollary 1.14). -/
def charPolySubring.univDet (S : DefProblem F E n Λ) :
    Determinant (Gal F) (charPolySubring S) n := sorry

/-- The image of `D^univ` in `R^univ_𝒮` is the determinant of the universal lifting. -/
theorem charPolySubring.univDet_map (S : DefProblem F E n Λ) (hl : Odd l)
    (hS : IsSchur S.resid) :
    Determinant.map (charPolySubring S).val.toRingHom (charPolySubring.univDet S) =
      Determinant.ofRep (CHT.glRes S.univLift) := by
  sorry

/-- The partition ideal `I_𝒫(D) ⊂ A` of Allen–Newton–Thorne, Proposition 2.5, for a determinant
`D` of `Γ` over a Henselian local ring `A` with residue map `π : A → κ` whose residual determinant
is `∏_i det ρ̄_i` (split and multiplicity free) and a partition `𝒫` of the constituents into blocks
`𝒫⁻¹(j)`: the smallest ideal `J ⊂ ker π` such that `D mod J` is a product of determinants
`D_1 ⋯ D_s` with `D_j ⊗ κ = ∏_{𝒫(i) = j} det ρ̄_i`. -/
def partitionIdeal {Γ : Type*} [Group Γ] {A : Type*} [CommRing A] {κ : Type*} [Field κ]
    (π : A →+* κ) {n : ℕ} (D : Determinant Γ A n) {d : ℕ} {m : Fin d → ℕ}
    (ρs : (i : Fin d) → Γ → GL (Fin (m i)) κ) {s : ℕ} (part : Fin d → Fin s) : Ideal A :=
  sInf {J | ∃ (hJ : J ≤ RingHom.ker π) (dims : Fin s → ℕ) (hdims : ∑ j, dims j = n)
    (Ds : (j : Fin s) → Determinant Γ (A ⧸ J) (dims j)),
    Determinant.prod hdims Ds = D.map (Ideal.Quotient.mk J) ∧
    ∀ (j : Fin s) (γ : Γ),
      ((Ds j).charpoly γ).map (Ideal.Quotient.lift J π fun _ ha => RingHom.mem_ker.mp (hJ ha)) =
        ∏ i ∈ Finset.univ.filter (fun i => part i = j),
          (ρs i γ : Matrix (Fin (m i)) (Fin (m i)) κ).charpoly}

/-- **`PL.6/reducibility-ideal`.** The universal factorisation ideal `I_𝒫 ⊂ P_𝒮` of
Allen–Newton–Thorne, Proposition 2.5, for the partition `𝒫` of the constituents `ρ̄_1, …, ρ̄_d` of
`r̄|G_{F,S}`: an ideal `J ⊂ P_𝒮` contains `I_𝒫` if and only if `D^univ mod J` is a product of
determinants `D_1 ⋯ D_s` with `D_j ⊗ k = ∏_{𝒫(i) = j} det ρ̄_i`. -/
def reducibilityIdeal_partition (S : DefProblem F E n Λ) {d : ℕ} {m : Fin d → ℕ}
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) {s : ℕ} (part : Fin d → Fin s) :
    Ideal (charPolySubring S) :=
  partitionIdeal (S.residue.comp (charPolySubring S).val.toRingHom) (charPolySubring.univDet S)
    (fun i => ρs i) part

open Classical in
/-- **`PL.6/reducibility-ideal`.** The reducibility ideal `I^red_𝒮 ⊂ P_𝒮`
(Allen–Newton–Thorne §3.2): the product of the ideals `I_{(𝒫₁, 𝒫₂)}` over the partitions of
`{1, …, d}` into two non-empty blocks (each unordered partition once: `𝒫₁` is the block of the
least index). It is the unit ideal for `d = 1`. Its extension to an `R^univ_𝒮`-algebra `A` is
`I^red_𝒮 A`. -/
def reducibilityIdeal (S : DefProblem F E n Λ) {d : ℕ} {m : Fin d → ℕ}
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) : Ideal (charPolySubring S) :=
  ∏ B ∈ (Finset.univ : Finset (Finset (Fin d))).filter
      (fun B => B.Nonempty ∧ Bᶜ.Nonempty ∧ ∀ i : Fin d, (∀ j, i ≤ j) → i ∈ B),
    reducibilityIdeal_partition S ρs (fun i => if i ∈ B then (0 : Fin 2) else 1)

/-- Allen–Newton–Thorne, Lemma 3.4: for a prime `𝔭` of `R^univ_𝒮` and `𝔮 = 𝔭 ∩ P_𝒮`, the
representation `r_𝔭|G_{F,S} ⊗ Frac(R^univ_𝒮/𝔭)` is absolutely irreducible if and only if
`I^red_𝒮 ⊄ 𝔮`. -/
theorem absIrred_iff_not_le_reducibilityIdeal (S : DefProblem F E n Λ) (hl : Odd l) {d : ℕ}
    {m : Fin d → ℕ} (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n)
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) (hdec : IsResidualDecomposition S e ρs)
    (𝔭 : Ideal S.univRing) [𝔭.IsPrime] :
    IsAbsIrredOverFrac (CHT.glRes (S.liftMod 𝔭)) ↔
      ¬ reducibilityIdeal S ρs ≤ 𝔭.comap (charPolySubring S).val := by
  sorry

/-- Allen–Newton–Thorne, Lemma 3.5: for a prime `𝔭` of `R^univ_𝒮` such that
`r_𝔭|G_{F,S} ⊗ Frac(R^univ_𝒮/𝔭)` is not absolutely irreducible, `r_𝔭` is strictly equivalent
over `R^univ_𝒮/𝔭` to a lifting `r₁ ⊕ r₂` of type `𝒮` with `r_i` valued in `𝒢_{m_i}`,
`m₁ m₂ ≠ 0`. -/
theorem exists_directSum_of_not_absIrred (S : DefProblem F E n Λ) (hl : Odd l) {d : ℕ}
    {m : Fin d → ℕ} (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n)
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) (hdec : IsResidualDecomposition S e ρs)
    (𝔭 : Ideal S.univRing) [𝔭.IsPrime]
    (hred : ¬ IsAbsIrredOverFrac (CHT.glRes (S.liftMod 𝔭))) :
    ∃ (m₁ m₂ : ℕ) (h : m₁ + m₂ = n)
      (r₁ : Gal (maximalRealSubfield F) →* CHT m₁ (S.univRing ⧸ 𝔭))
      (r₂ : Gal (maximalRealSubfield F) →* CHT m₂ (S.univRing ⧸ 𝔭)),
      0 < m₁ ∧ 0 < m₂ ∧ (S.lifts (S.univRing ⧸ 𝔭)).Holds (CHT.directSum h r₁ r₂) ∧
      CHT.StrictEquiv (S.liftMod 𝔭) (CHT.directSum h r₁ r₂) := by
  sorry

/-- For two constituents the split ideal and the extension of the determinant reducibility ideal
have the same radical in `R^univ_𝒮` (from Allen–Newton–Thorne, Lemmas 3.4 and 3.5; the sources
claim no equality of the two ideals). -/
theorem splitReducibilityIdeal_radical (S : DefProblem F E n Λ) (hl : Odd l) {n₁ n₂ : ℕ}
    (h : n₁ + n₂ = n) (rbar₁ : Gal (maximalRealSubfield F) →* CHT n₁ 𝓀[E])
    (rbar₂ : Gal (maximalRealSubfield F) →* CHT n₂ 𝓀[E])
    (hres : IsTwoBlockResidual S h rbar₁ rbar₂) {m : Fin 2 → ℕ}
    (e : (Σ i : Fin 2, Fin (m i)) ≃ Fin n) (ρs : (i : Fin 2) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (hdec : IsResidualDecomposition S e ρs) :
    (splitReducibilityIdeal S h).radical =
      ((reducibilityIdeal S ρs).map (charPolySubring S).val).radical := by
  sorry

/-- (Not stated in the sources; it follows from the formula `I_𝒫 = Σ A_{ij} A_{ji}`.) If
`H ⊂ G_{F,S}` is open and the `ρ̄_i|H` remain absolutely irreducible and pairwise non-isomorphic,
then for each partition `𝒫` the partition ideal in `P_𝒮` of the restricted universal determinant
`D^univ|H` is contained in `I_𝒫`. -/
theorem reducibilityIdeal_map (S : DefProblem F E n Λ) (hl : Odd l) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (hdec : IsResidualDecomposition S e ρs) (H : Subgroup (Gal F))
    (hH : IsOpen (H : Set (Gal F))) (hirr : ∀ i, IsAbsIrred ((ρs i).comp H.subtype))
    (hniso : ∀ i j, i ≠ j →
      IsEmpty ((stdRep ((ρs i).comp H.subtype)).Equiv (stdRep ((ρs j).comp H.subtype))))
    {s : ℕ} (part : Fin d → Fin s) :
    partitionIdeal (S.residue.comp (charPolySubring S).val.toRingHom)
        ((charPolySubring.univDet S).comap H.subtype) (fun i => (ρs i).comp H.subtype) part ≤
      reducibilityIdeal_partition S ρs part := by
  sorry

/-- The ideal `(I^red_𝒮 A, λ)` of an `R^univ_𝒮`-algebra `g : R^univ_𝒮 → A`. -/
def reducibleSpecialIdeal (S : DefProblem F E n Λ) {d : ℕ} {m : Fin d → ℕ}
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) {A : Type} [CommRing A]
    (g : S.univRing →+* A) : Ideal A :=
  (reducibilityIdeal S ρs).map (g.comp (charPolySubring S).val.toRingHom) ⊔
    (IsLocalRing.maximalIdeal 𝒪[E]).map
      ((g.comp (algebraMap Λ S.univRing)).comp (algebraMap 𝒪[E] Λ))

-- test: red_absIrred
example (S : DefProblem F E n Λ) {m : Fin 1 → ℕ}
    (ρs : (i : Fin 1) → Gal F →* GL (Fin (m i)) 𝓀[E]) :
    reducibilityIdeal S ρs = ⊤ ∧
      Subsingleton (charPolySubring S ⧸ reducibilityIdeal S ρs) := by
  sorry

-- test: red_two_characters
-- (`I^red_𝒮` is generated by the products of off-diagonal entries of a universal lifting in
-- which some `σ₀` with `χ̄₁(σ₀) ≠ χ̄₂(σ₀)` is diagonal; over a prime quotient on which it vanishes
-- one of the two off-diagonal entries vanishes identically, but not necessarily both.)
example (S : DefProblem F E 2 Λ) (hl : Odd l) (χ : Fin 2 → Gal F →* (𝓀[E])ˣ)
    (e : (Σ _ : Fin 2, Fin 1) ≃ Fin 2) (he : ∀ i, e ⟨i, 0⟩ = i)
    (hdec : IsResidualDecomposition S e fun i => diagChar fun _ : Fin 1 => χ i)
    (r : Gal (maximalRealSubfield F) →* CHT 2 S.univRing) (hr : CHT.StrictEquiv S.univLift r)
    (σ₀ : Gal F) (hσ₀ : χ 0 σ₀ ≠ χ 1 σ₀)
    (hdiag : ∀ i j : Fin 2, i ≠ j →
      (CHT.glRes r σ₀ : Matrix (Fin 2) (Fin 2) S.univRing) i j = 0) :
    (∀ σ τ : Gal F, (CHT.glRes r σ : Matrix (Fin 2) (Fin 2) S.univRing) 0 1 *
      (CHT.glRes r τ : Matrix (Fin 2) (Fin 2) S.univRing) 1 0 ∈ charPolySubring S) ∧
    reducibilityIdeal S (fun i => diagChar fun _ : Fin 1 => χ i) =
      Ideal.span {x : charPolySubring S | ∃ σ τ : Gal F,
        (x : S.univRing) = (CHT.glRes r σ : Matrix (Fin 2) (Fin 2) S.univRing) 0 1 *
          (CHT.glRes r τ : Matrix (Fin 2) (Fin 2) S.univRing) 1 0} ∧
    ∀ 𝔭 : Ideal S.univRing, 𝔭.IsPrime →
      reducibilityIdeal S (fun i => diagChar fun _ : Fin 1 => χ i) ≤
        𝔭.comap (charPolySubring S).val →
      (∀ σ : Gal F, (CHT.glRes r σ : Matrix (Fin 2) (Fin 2) S.univRing) 0 1 ∈ 𝔭) ∨
        ∀ σ : Gal F, (CHT.glRes r σ : Matrix (Fin 2) (Fin 2) S.univRing) 1 0 ∈ 𝔭 := by
  sorry

-- test: red_split_lift
example (S : DefProblem F E n Λ) (hl : Odd l) {n₁ n₂ : ℕ} (h : n₁ + n₂ = n)
    (rbar₁ : Gal (maximalRealSubfield F) →* CHT n₁ 𝓀[E])
    (rbar₂ : Gal (maximalRealSubfield F) →* CHT n₂ 𝓀[E])
    (hres : IsTwoBlockResidual S h rbar₁ rbar₂) {m : Fin 2 → ℕ}
    (e : (Σ i : Fin 2, Fin (m i)) ≃ Fin n) (ρs : (i : Fin 2) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (hdec : IsResidualDecomposition S e ρs) (A : Type) [CommRing A] [Algebra Λ A]
    (hA : IsCNL Λ A) (f : S.univRing →ₐ[Λ] A) (hf : S.liftOf f ∈ reducibleDeformations S h A) :
    splitReducibilityIdeal S h ≤ RingHom.ker f ∧
      reducibilityIdeal S ρs ≤ (RingHom.ker f).comap (charPolySubring S).val := by
  sorry

-- test: red_irreducible_point
example (S : DefProblem F E n Λ) (hl : Odd l) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (hdec : IsResidualDecomposition S e ρs) (g : S.univRing →+* 𝒪[E])
    (hirr : IsAbsIrred (generic (CHT.glRes (S.liftAt g)))) :
    ¬ reducibilityIdeal S ρs ≤ (RingHom.ker g).comap (charPolySubring S).val := by
  sorry

/-! ### PL.6/reducible-locus-dimension: The reducible locus is small in the presence of
Steinberg places -/

/-- The global deformation problem (3.2) of Thorne 2015 (§3.3.6, recalled in §3.7):
`S = S_l ⊔ S(B) ⊔ R ⊔ S_a`, with `q_v ≡ 1 mod l` and `r̄|G_{F_ṽ}` trivial for `v ∈ S(B) ∪ R`, and
`q_v ≢ 1 mod l`, `r̄|G_{F_ṽ}` unramified and scalar for `v ∈ S_a`; the local problems are ordinary
at `S_l` (where `r̄|G_{F_ṽ}` is trivial and `Λ` is the ordinary coefficient ring), Steinberg at
`S(B)`, `χ_v`-ramified at `R` for characters `χ_{v,i}` of `k(v)^×` trivial modulo `λ`, and
unrestricted at `S_a`; and `r̄` is Schur. -/
structure IsThorneProblem (l : ℕ) (S : DefProblem F E n Λ) (SB R Sa : Set (Place F))
    (χ : (v : Place F) → Fin n → (𝓀[v.Fv])ˣ →* (𝒪[E])ˣ) : Prop where
  places_eq : S.places = S.placesAbove l ∪ SB ∪ R ∪ Sa
  disjoint : Disjoint SB R ∧ Disjoint SB Sa ∧ Disjoint R Sa
  not_above : ∀ v ∈ SB ∪ R ∪ Sa, ¬ v.Above l
  schur : IsSchur S.resid
  ordinaryCoefficients : (ordinaryCoefficients F E n Λ l).Holds S
  at_l : ∀ v ∈ S.placesAbove l, S.localCondition v = LocalCondition.ordinary ∧
    resFieldHom (CHT.glRes S.resid) v.emb = 1
  at_SB : ∀ v ∈ SB, S.localCondition v = LocalCondition.steinberg ∧ (v.norm : ZMod l) = 1 ∧
    resFieldHom (CHT.glRes S.resid) v.emb = 1
  at_R : ∀ v ∈ R, S.localCondition v = LocalCondition.ramified (χ v) ∧
    (v.norm : ZMod l) = 1 ∧ resFieldHom (CHT.glRes S.resid) v.emb = 1 ∧
    ∀ i x, Units.map (IsLocalRing.residue 𝒪[E] : 𝒪[E] →* 𝓀[E]) (χ v i x) = 1
  at_Sa : ∀ v ∈ Sa, S.localCondition v = LocalCondition.unrestricted ∧
    (v.norm : ZMod l) ≠ 1 ∧ IsUnramified (resFieldHom (CHT.glRes S.resid) v.emb) ∧
    ∀ σ : Gal v.Fv, IsScalarGL (CHT.glRes S.resid (v.dec σ))

/-- The set-up of Allen–Newton–Thorne §3.3: the problem (3.2) of Thorne 2015 with `χ_v = 1`, so
that the local problems at `R` are the unipotently ramified ones `𝒟^1_v`. -/
def IsANTProblem (l : ℕ) (S : DefProblem F E n Λ) (SB R Sa : Set (Place F)) : Prop :=
  IsThorneProblem l S SB R Sa fun _ _ => 1

/-- **`PL.6/reducible-locus-dimension`** (Allen–Newton–Thorne, Lemma 3.6). In the set-up of §3.3,
with `r̄|G_{F,S} = ⊕ ρ̄_i`, `d₀` the `ℤ_l`-rank of the subgroup of `Δ/(c + 1)` generated by the
Frobenius elements at `S(B)` and `d_l = inf_{v ∈ S_l} [F⁺_v : ℚ_l] > n(n-1)/2 + 1`: if
`A ∈ C_Λ` is a finite `Λ`-algebra and `r : G_{F⁺,S} → 𝒢_n(A)` is a lifting of type `𝒮`, then
`dim A/(I^red_𝒮 A, λ) ≤ n[F⁺ : ℚ] - d₀`. -/
theorem reducible_locus_dimension (S : DefProblem F E n Λ) (SB R Sa : Set (Place F))
    (hS : IsANTProblem l S SB R Sa) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (hdec : IsResidualDecomposition S e ρs)
    (hdl : n * (n - 1) / 2 + 1 < S.dl l)
    (A : Type) [CommRing A] [Algebra Λ A] (hA : IsCNL Λ A) (hfin : Module.Finite Λ A)
    (f : S.univRing →ₐ[Λ] A) :
    ringKrullDim (A ⧸ reducibleSpecialIdeal S ρs f.toRingHom) +
        (frobRank F E l SB : WithBot ℕ∞) ≤
      ((n * Module.finrank ℚ (maximalRealSubfield F) : ℕ) : WithBot ℕ∞) := by
  sorry

end Reducibility

end TauCeti.Automorphy
namespace TauCeti.Automorphy

/-! ### PL.6/generic-prime: Generic primes of an ordinary deformation ring -/

section GenericPrime

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- **`PL.6/generic-prime`.** A homomorphism `r : G_{F⁺,S} → 𝒢_n(A)` of type `𝒮` over `A ∈ C_Λ`
is generic at `l` (Allen–Newton–Thorne, Definition 3.7) if (i) for each `v ∈ S_l` the universal
characters `ψ^v_1, …, ψ^v_n : I^{ab}_{F_ṽ}(l) → A^×` are pairwise distinct, and (ii) for some
`v ∈ S_l` and `σ ∈ I^{ab}_{F_ṽ}(l)` the elements `ψ^v_1(σ), …, ψ^v_n(σ)` satisfy no non-trivial
`ℤ`-linear relation. The conditions depend on `r` only through the `Λ`-algebra `A`. -/
def IsGenericAtL (l : ℕ) (S : DefProblem F E n Λ) (A : Type) [CommRing A] [Algebra Λ A]
    (r : Gal (maximalRealSubfield F) →* CHT n A) : Prop :=
  (S.lifts A).Holds r ∧
  (∀ v ∈ S.placesAbove l, ∀ i j, i ≠ j → S.charOn l A v i ≠ S.charOn l A v j) ∧
  ∃ v ∈ S.placesAbove l, ∃ σ : inertiaAbL v.Fv l,
    ∀ a : Fin n → ℤ, ∏ i, S.charOn l A v i σ ^ a i = 1 → a = 0

/-- `r` is generic (Allen–Newton–Thorne, Definition 3.7): generic at `l`, `A` is a domain and
`r|G_F ⊗_A Frac(A)` is absolutely irreducible. No condition on `dim A` or the characteristic. -/
def IsGeneric (l : ℕ) (S : DefProblem F E n Λ) (A : Type) [CommRing A] [Algebra Λ A]
    (r : Gal (maximalRealSubfield F) →* CHT n A) : Prop :=
  IsGenericAtL l S A r ∧ ∃ _ : IsDomain A, IsAbsIrredOverFrac (CHT.glRes r)

/-- **`PL.6/generic-prime`.** A prime `𝔭 ⊂ R^univ_𝒮` is generic: it has dimension one and
characteristic `l`, and `r_𝔭 = r^univ mod 𝔭` over `R^univ_𝒮/𝔭` is generic (Newton–Thorne 2021 §5;
Thorne 2015 §6 for two constituents). -/
def IsGenericPrime (l : ℕ) (S : DefProblem F E n Λ) (𝔭 : Ideal S.univRing) : Prop :=
  𝔭.IsPrime ∧ ringKrullDim (S.univRing ⧸ 𝔭) = 1 ∧ (l : S.univRing) ∈ 𝔭 ∧
    IsGeneric l S (S.univRing ⧸ 𝔭) (S.liftMod 𝔭)

/-- The universal characters at each `v ∈ S_l` of a homomorphism generic at `l` are pairwise
distinct. -/
theorem IsGenericAtL.distinct {l : ℕ} {S : DefProblem F E n Λ} {A : Type} [CommRing A]
    [Algebra Λ A] {r : Gal (maximalRealSubfield F) →* CHT n A} (h : IsGenericAtL l S A r)
    (v : Place F) (hv : v ∈ S.placesAbove l) (i j : Fin n) (hij : i ≠ j) :
    S.charOn l A v i ≠ S.charOn l A v j := by
  sorry

/-- Pullback of generic primes (Thorne 2015, proof of Proposition 6.2; Newton–Thorne 2026 §3).
Let `M/L` be a finite CM extension in which every place above `l` splits completely, `𝒮_M` a
problem over `M` whose places above `l` are those above the places of `𝒮_L`, and
`φ : R^univ_{𝒮_M} → R^univ_{𝒮_L}` the homomorphism classifying the restriction to `G_{M⁺}` of the
universal deformation of type `𝒮_L`. If `𝔭` is a generic prime of `R^univ_{𝒮_L}` and `r_𝔭`
satisfies the hypotheses of Thorne 2015 §5.2 (`l > 3`, `ζ_l ∉ L`, `r̄` Schur over `L⁺(ζ_l)` and
strongly primitive on `G_L`, no `l`-power quotient of `r̄(G_{L(ζ_l)})`, an element with
`ℤ`-independent eigenvalues, `l ∤ n`, `µ(c) = -1`), then `φ⁻¹(𝔭)` is a generic prime of
`R^univ_{𝒮_M}`. The source prints "primitive"; see `genericity_under_restriction`. -/
theorem IsGenericPrime.restrict {l : ℕ} [Fact l.Prime] [ResChar E l]
    {L M : Type} [Field L] [NumberField L] [IsCMField L] [Field M] [NumberField M] [IsCMField M]
    {ΛL ΛM : Type} [CommRing ΛL] [Algebra 𝒪[E] ΛL] [CommRing ΛM] [Algebra 𝒪[E] ΛM]
    (i : L →+* M) (ip : maximalRealSubfield L →+* maximalRealSubfield M)
    (hi : ∀ x, ((ip x : maximalRealSubfield M) : M) = i (x : L))
    (SL : DefProblem L E n ΛL) (SM : DefProblem M E n ΛM)
    (hplaces₁ : ∀ w ∈ SM.placesAbove l, ∃ v ∈ SL.placesAbove l, w.LiesOver i v)
    (hplaces₂ : ∀ v ∈ SL.placesAbove l, ∃ w ∈ SM.placesAbove l, w.LiesOver i v)
    (hsplit : ∀ w : Place M, w.Above l → DenseRange (w.emb.comp i))
    (φ : SM.univRing →+* SL.univRing)
    (hφ : CHT.StrictEquiv (SM.liftAt φ)
      (SL.univLift.comp (Field.absoluteGaloisGroup.map ip).toMonoidHom))
    (𝔭 : Ideal SL.univRing) [𝔭.IsPrime] (h𝔭 : IsGenericPrime l SL 𝔭)
    (hl : 3 < l) (hζ : ∀ ζ : L, ¬ IsPrimitiveRoot ζ l)
    (hSchur : IsSchur (resFieldHom SL.resid
      (algebraMap (maximalRealSubfield L) (CyclotomicField l (maximalRealSubfield L)))))
    (hprim : IsStronglyPrimitive (CHT.glRes SL.resid))
    (hquot : HasNoLPowerQuotient
      (resFieldHom (CHT.glRes SL.resid) (algebraMap L (CyclotomicField l L))).range l)
    (hσ₀ : ∃ σ₀ : Gal L, HasIndependentEigenvalues
      (CHT.glRes (SL.liftMod 𝔭) σ₀ : Matrix (Fin n) (Fin n) (SL.univRing ⧸ 𝔭)))
    (hln : ¬ l ∣ n)
    (hμ : ∀ c : Gal (maximalRealSubfield L), orderOf c = 2 → CHT.nu n 𝓀[E] (SL.resid c) = -1) :
    IsGenericPrime l SM (𝔭.comap φ) := by
  sorry

/-- **`PL.6/generic-prime`.** The countable family of ideals `I_i ⊂ Λ` containing `λ` (ideals of
`Λ/(λ)`) of Allen–Newton–Thorne, Lemma 3.8: with `σ_{v,1}, …, σ_{v,d_v} ∈ I^{ab}_{F_ṽ}(l)` lifting
a `ℤ_l`-basis of the torsion-free quotient, the ideals
`(λ, ψ^v_i(σ_{v,k}) - ψ^v_j(σ_{v,k}))_k` for `v ∈ S_l`, `i < j`, and the ideals
`(λ, ∏_i ψ^v_i(σ_{v,j})^{A_{v,i,j}} - 1)_{v,j}` for families of integer `n × d_v` matrices `A_v`
with no zero column, in some enumeration. See `large_quotients_contain_generic_primes_1`. -/
def nonGenericIdeals (l : ℕ) (S : DefProblem F E n Λ) : ℕ → Ideal Λ := sorry

-- test: generic_rank_one
example (l : ℕ) (S : DefProblem F E 1 Λ) (A : Type) [CommRing A] [Algebra Λ A]
    (r : Gal (maximalRealSubfield F) →* CHT 1 A) (hr : (S.lifts A).Holds r) :
    IsGenericAtL l S A r ↔ ∃ v ∈ S.placesAbove l, ∃ σ : inertiaAbL v.Fv l,
      ∀ a : ℕ, 0 < a → S.charOn l A v 0 σ ^ a ≠ 1 := by
  sorry

-- test: generic_example (the power series computation: `1 + T₁` and `1 + T₂` are distinct and
-- multiplicatively independent in `k⟦T₁, T₂⟧`)
example (k : Type*) [Field k] (u : Fin 2 → (MvPowerSeries (Fin 2) k)ˣ)
    (hu : ∀ i, ((u i : (MvPowerSeries (Fin 2) k)ˣ) : MvPowerSeries (Fin 2) k) =
      1 + MvPowerSeries.X i) :
    u 0 ≠ u 1 ∧ ∀ a : Fin 2 → ℤ, ∏ i, u i ^ a i = 1 → a = 0 := by
  sorry

-- test: generic_example (the resulting genericity at `l`)
example (l : ℕ) (S : DefProblem F E 2 Λ) [Algebra Λ (MvPowerSeries (Fin 2) 𝓀[E])]
    (r : Gal (maximalRealSubfield F) →* CHT 2 (MvPowerSeries (Fin 2) 𝓀[E]))
    (hr : (S.lifts (MvPowerSeries (Fin 2) 𝓀[E])).Holds r) (v : Place F)
    (hv : v ∈ S.placesAbove l) (σ : inertiaAbL v.Fv l)
    (hσ : ∀ i, ((S.charOn l (MvPowerSeries (Fin 2) 𝓀[E]) v i σ :
      (MvPowerSeries (Fin 2) 𝓀[E])ˣ) : MvPowerSeries (Fin 2) 𝓀[E]) = 1 + MvPowerSeries.X i)
    (hother : ∀ w ∈ S.placesAbove l, w ≠ v → ∀ i j, i ≠ j →
      S.charOn l (MvPowerSeries (Fin 2) 𝓀[E]) w i ≠ S.charOn l (MvPowerSeries (Fin 2) 𝓀[E]) w j) :
    (∀ a : Fin 2 → ℤ, ∏ i, S.charOn l (MvPowerSeries (Fin 2) 𝓀[E]) v i σ ^ a i = 1 → a = 0) ∧
    IsGenericAtL l S (MvPowerSeries (Fin 2) 𝓀[E]) r := by
  sorry

-- test: generic_example (if `ψ₂(σ) = 1` then `σ` is not a witness of condition (ii))
example (l : ℕ) (S : DefProblem F E 2 Λ) (A : Type) [CommRing A] [Algebra Λ A] (v : Place F)
    (σ : inertiaAbL v.Fv l) (hσ : S.charOn l A v 1 σ = 1) :
    ¬ ∀ a : Fin 2 → ℤ, ∏ i, S.charOn l A v i σ ^ a i = 1 → a = 0 := by
  sorry

-- test: not_generic_equal_characters
example (l : ℕ) (S : DefProblem F E n Λ) (𝔭 : Ideal S.univRing) (v : Place F)
    (hv : v ∈ S.placesAbove l) (i j : Fin n) (hij : i ≠ j)
    (h : S.charOn l (S.univRing ⧸ 𝔭) v i = S.charOn l (S.univRing ⧸ 𝔭) v j) :
    ¬ IsGenericAtL l S (S.univRing ⧸ 𝔭) (S.liftMod 𝔭) := by
  sorry

-- test: not_generic_torsion
example (l : ℕ) (S : DefProblem F E n Λ) (A : Type) [CommRing A] [Algebra Λ A]
    (r : Gal (maximalRealSubfield F) →* CHT n A)
    (h : ∀ v ∈ S.placesAbove l, ∀ σ : inertiaAbL v.Fv l,
      ∃ a : Fin n → ℤ, a ≠ 0 ∧ ∏ i, S.charOn l A v i σ ^ a i = 1) :
    ¬ IsGenericAtL l S A r := by
  sorry

-- test: not_generic_torsion (characters of finite order)
example (l : ℕ) (S : DefProblem F E n Λ) (hn : 0 < n) (A : Type) [CommRing A] [Algebra Λ A]
    (r : Gal (maximalRealSubfield F) →* CHT n A)
    (h : ∀ v ∈ S.placesAbove l, ∀ (i : Fin n) (σ : inertiaAbL v.Fv l),
      ∃ a : ℕ, 0 < a ∧ S.charOn l A v i σ ^ a = 1) :
    ¬ IsGenericAtL l S A r := by
  sorry

/-! ### PL.6/large-quotients-contain-generic-primes: Large quotients contain generic primes -/

variable {l : ℕ} [Fact l.Prime] [ResChar E l]

/-- **`PL.6/large-quotients-contain-generic-primes`** (1) (Allen–Newton–Thorne, Lemma 3.8). In
the set-up of §3.3 the ideals `I_i ⊂ Λ` contain `λ`, satisfy `dim Λ/I_i ≤ n[F⁺ : ℚ] - d_l`, and
for every `A ∈ C_Λ` with `λ A = 0` and every lifting `r` of type `𝒮` over `A` which is not generic
at `l` there is `i` with `I_i A = 0`. (The source states this for all `A ∈ C_Λ`; it is meaningful
only for `A` killed by `λ`.) -/
theorem large_quotients_contain_generic_primes_1 (S : DefProblem F E n Λ)
    (SB R Sa : Set (Place F)) (hS : IsANTProblem l S SB R Sa) :
    (∀ i, (IsLocalRing.maximalIdeal 𝒪[E]).map (algebraMap 𝒪[E] Λ) ≤ nonGenericIdeals l S i) ∧
    (∀ i, ringKrullDim (Λ ⧸ nonGenericIdeals l S i) + (S.dl l : WithBot ℕ∞) ≤
      ((n * Module.finrank ℚ (maximalRealSubfield F) : ℕ) : WithBot ℕ∞)) ∧
    ∀ (A : Type) [CommRing A] [Algebra Λ A], IsCNL Λ A →
      (∀ x ∈ IsLocalRing.maximalIdeal 𝒪[E], algebraMap Λ A (algebraMap 𝒪[E] Λ x) = 0) →
      ∀ r : Gal (maximalRealSubfield F) →* CHT n A, (S.lifts A).Holds r →
        ¬ IsGenericAtL l S A r → ∃ i, (nonGenericIdeals l S i).map (algebraMap Λ A) = ⊥ := by
  sorry

/-- **`PL.6/large-quotients-contain-generic-primes`** (2) (Thorne 2015, Lemma 1.9). If `R` is a
complete Noetherian local `k`-algebra with residue field `k`, of dimension `d ≥ 1`, and
`I_1, I_2, …` are countably many ideals with `dim R/I_i ≤ d - 1`, there is a prime `𝔭 ⊂ R` of
dimension one containing none of the `I_i`. (The source takes `k` finite.) -/
theorem large_quotients_contain_generic_primes_2 (k : Type*) [Field k] (R : Type*) [CommRing R]
    [Algebra k R] (hR : IsCNL k R) (d : ℕ) (hd : 1 ≤ d) (hdim : ringKrullDim R = d)
    (I : ℕ → Ideal R) (hI : ∀ i, ringKrullDim (R ⧸ I i) + 1 ≤ d) :
    ∃ 𝔭 : Ideal R, 𝔭.IsPrime ∧ ringKrullDim (R ⧸ 𝔭) = 1 ∧ ∀ i, ¬ I i ≤ 𝔭 := by
  sorry

/-- **`PL.6/large-quotients-contain-generic-primes`** (3) (Allen–Newton–Thorne, Lemma 3.9). In
the set-up of §3.3 with `d_l > n(n-1)/2 + 1`, let `A ∈ C_Λ` be a finite `Λ`-algebra with
`dim A/(λ) > sup(n[F⁺ : ℚ] - d₀, n[F⁺ : ℚ] - d_l)` and `r` a homomorphism of type `𝒮` over `A`.
Then `A` has a prime `𝔭` of dimension one and characteristic `l` such that `r mod 𝔭` is
generic. -/
theorem large_quotients_contain_generic_primes_3 (S : DefProblem F E n Λ)
    (SB R Sa : Set (Place F)) (hS : IsANTProblem l S SB R Sa) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (hdec : IsResidualDecomposition S e ρs) (hdl : n * (n - 1) / 2 + 1 < S.dl l)
    (A : Type) [CommRing A] [Algebra Λ A] (hA : IsCNL Λ A) (hfin : Module.Finite Λ A)
    (f : S.univRing →ₐ[Λ] A)
    (hdim₀ : ((n * Module.finrank ℚ (maximalRealSubfield F) : ℕ) : WithBot ℕ∞) <
      ringKrullDim (A ⧸ (IsLocalRing.maximalIdeal 𝒪[E]).map
        ((algebraMap Λ A).comp (algebraMap 𝒪[E] Λ))) + (frobRank F E l SB : WithBot ℕ∞))
    (hdim_l : ((n * Module.finrank ℚ (maximalRealSubfield F) : ℕ) : WithBot ℕ∞) <
      ringKrullDim (A ⧸ (IsLocalRing.maximalIdeal 𝒪[E]).map
        ((algebraMap Λ A).comp (algebraMap 𝒪[E] Λ))) + (S.dl l : WithBot ℕ∞)) :
    ∃ 𝔭 : Ideal A, 𝔭.IsPrime ∧ ringKrullDim (A ⧸ 𝔭) = 1 ∧ (l : A) ∈ 𝔭 ∧
      IsGeneric l S (A ⧸ 𝔭) (S.liftOf ((Ideal.Quotient.mkₐ Λ 𝔭).comp f)) := by
  sorry

end GenericPrime

/-! ### PL.6/genericity-under-restriction: Absolute irreducibility at a generic prime survives
restriction -/

/-- **`PL.6/genericity-under-restriction`** (Thorne 2015, Proposition 5.3). Let `l > 3`, `k` a
finite field of characteristic `l`, `A = k⟦T⟧`, `F` a CM field, `S` a finite set of places of `F⁺`
split in `F` containing those above `l`, and `r : G_{F⁺,S} → 𝒢_n(A)` continuous such that (1)
`r|G_{F,S} ⊗_A Frac A` is absolutely irreducible; (2) `ζ_l ∉ F`, `r̄|G_{F⁺(ζ_l)}` is Schur and
`r̄|G_F` is strongly primitive; (3) the image of `r̄|G_{F(ζ_l)}` has no non-trivial quotient of
`l`-power order; (4) there is `σ₀ ∈ G_{F,S}` with `r(σ₀)` regular semisimple with eigenvalues in
`A^×` satisfying no non-trivial `ℤ`-linear relation; (5) `l ∤ n`; (6) `µ = ν ∘ r` has
`µ(c) = -1`. Then for every open subgroup `N ⊂ G_F`, `r|N ⊗_A Frac A` is absolutely irreducible.

The source prints "primitive" in (2). Its proof needs that the semisimple `r̄|G_F` is not the
semisimplification of a representation induced from a proper open subgroup, which is the strong
form stated here. Only (1), (4) and the primitivity in (2) enter the proof. The consequence for
generic primes is `IsGenericPrime.restrict`. -/
theorem genericity_under_restriction {F : Type} [Field F] [NumberField F] [IsCMField F]
    {l : ℕ} [Fact l.Prime] (hl : 3 < l) {k : Type} [Field k] [Finite k] [CharP k l] {n : ℕ}
    (S : Set (Place F)) (hS : S.Finite) (hsplit : ∀ v ∈ S, v.IsSplit)
    (hSl : ∀ v : Place F, v.Above l → ¬ v.Outside S)
    (r : Gal (maximalRealSubfield F) →* CHT n (PowerSeries k))
    (hcont : ∀ N : ℕ, IsOpen (((CHT.map n
      (Ideal.Quotient.mk (Ideal.span {(PowerSeries.X : PowerSeries k) ^ N}))).comp r).ker :
        Set (Gal (maximalRealSubfield F))))
    (hpre : CHT.pre r = (resCM F).range)
    (hunr : ∀ w : Place F, w.Outside S → IsUnramified (resFieldHom (CHT.glRes r) w.emb))
    (rbar : Gal (maximalRealSubfield F) →* CHT n k)
    (hrbar : rbar = (CHT.map n (PowerSeries.constantCoeff (R := k))).comp r)
    (h1 : IsAbsIrredOverFrac (CHT.glRes r))
    (h2ζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ l)
    (h2Schur : IsSchur (resFieldHom rbar
      (algebraMap (maximalRealSubfield F) (CyclotomicField l (maximalRealSubfield F)))))
    (h2prim : IsStronglyPrimitive (CHT.glRes rbar))
    (h3 : HasNoLPowerQuotient
      (resFieldHom (CHT.glRes rbar) (algebraMap F (CyclotomicField l F))).range l)
    (h4 : ∃ (σ₀ : Gal F) (α : Fin n → (PowerSeries k)ˣ),
      (CHT.glRes r σ₀ : Matrix (Fin n) (Fin n) (PowerSeries k)).charpoly =
        ∏ i, (Polynomial.X - Polynomial.C ((α i : (PowerSeries k)ˣ) : PowerSeries k)) ∧
      Function.Injective α ∧ ∀ a : Fin n → ℤ, ∏ i, α i ^ a i = 1 → a = 0)
    (h5 : ¬ l ∣ n)
    (h6 : ∀ c : Gal (maximalRealSubfield F), orderOf c = 2 → CHT.nu n (PowerSeries k) (r c) = -1)
    (N : Subgroup (Gal F)) (hN : IsOpen (N : Set (Gal F))) :
    IsAbsIrredOverFrac fun σ : N => CHT.glRes r σ := by
  sorry

end TauCeti.Automorphy
namespace TauCeti.Automorphy

open TauCeti.DefiniteUnitary

/-! #### The set-up of Thorne 2015 §4.3 and Allen–Newton–Thorne §4.2

Used by `PL.6/reducible-twisting-and-base-change` and `PL.6/generic-prime-r-equals-t`. -/

section HeckeSetup

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- `PL.2/ordinary-hecke-galois-representation` (constructed in the PL.2 part of this file and
restated here as data of this part): the semisimple residual representation
`ρ̄_m : G_L → GL_n(T/m)` attached to a maximal ideal `m` of the big ordinary Hecke algebra
`T = T^{T,ord}_χ(U(l^∞), 𝒪)`, with `ρ̄_m(Frob_w)` of characteristic polynomial given by the Hecke
operators at the split places `w` outside `T` (Thorne 2015, Proposition 4.9). -/
def heckeResidualRep (D : HeckeDatum E) (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal] :
    Gal D.L →* GL (Fin D.n) (bigOrdinaryHeckeAlgebra D ⧸ m) := sorry

/-- The homomorphism `P_𝒮 → T^T_χ(U(l^∞), 𝒪)_m` of Thorne 2015, Proposition 4.12, for a residually
Schur maximal ideal `m` and the problem `𝒮 = 𝒮_χ` with residual representation `r̄_m`: the map
`Q_𝒮 ⊗̂_𝒪 Λ → T_m` classifying the Hecke-valued determinant is surjective and factors through
`P_𝒮`. It sends the coefficients of the characteristic polynomial of `Frob_w` to the Hecke
operators at `w`. The sources construct no map from `R^univ_𝒮` to the Hecke algebra. -/
def charPolyToHecke (D : HeckeDatum E) (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) :
    charPolySubring S →ₐ[iwasawaAlgebra D] Localization.AtPrime m := sorry

/-- The ideal `J_𝒮 R^univ_𝒮`, the extension to `R^univ_𝒮` of `J_𝒮 = ker(P_𝒮 → T_m)`. -/
def heckeKernel (D : HeckeDatum E) (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) : Ideal S.univRing :=
  (RingHom.ker (charPolyToHecke D m S)).map (charPolySubring S).val

/-- The set-up of Allen–Newton–Thorne §4.1–4.2 (from Thorne 2015 §4.1 and §4.3): `l` is odd,
`L/L⁺` is everywhere unramified, `T = S_l ⊔ S(B) ⊔ R ⊔ S_a` consists of places split in `L`, the
unitary group is that of a division algebra ramified exactly at `S(B)`, `q_v ≡ 1 mod l` on
`S(B) ∪ R`, `S_a` is a non-empty set of absolutely unramified places of odd residue
characteristic with `q_v ≢ 1 mod l`, `[L⁺_v : ℚ_l] > n(n-1)/2 + 1` on `S_l`, the level is the one
of §4.2, and `m` is a maximal ideal with residue field `k` such that `ρ̄_m` is unramified with
scalar Frobenius at `S_a`, trivial at `S_l ∪ R ∪ S(B)`, and a sum of pairwise non-isomorphic
absolutely irreducible conjugate self-dual constituents. The problem `𝒮 = 𝒮_χ` has for residual
representation a Schur extension `r̄_m` of `ρ̄_m` with multiplier `ε̄^{1-n} δ̄^n`, multiplier
`ε^{1-n} δ^n_{L/L⁺}`, and local problems `R^△_v` at `S_l`, `R^{χ_v}_v` at `R`, `R^{St}_v` at
`S(B)` and `R^□_v` at `S_a`. -/
structure IsThorneSetup (D : HeckeDatum E) (Sa : Set (Place D.L))
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : (bigOrdinaryHeckeAlgebra D ⧸ m) ≃+* 𝓀[E])
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) : Prop where
  l_prime : D.l.Prime
  l_odd : Odd D.l
  problem : IsThorneProblem D.l S D.toCMData.SB D.R Sa D.χ
  places_eq : S.places = D.T
  split : ∀ v ∈ D.T, v.IsSplit
  Sa_nonempty : Sa.Nonempty
  Sa_unramified : ∀ v ∈ Sa, ∃ p : ℕ, p.Prime ∧ Odd p ∧
    IsLocalRing.maximalIdeal 𝒪[v.Fv] = Ideal.span {(p : 𝒪[v.Fv])}
  degree : D.n * (D.n - 1) / 2 + 1 < S.dl D.l
  level : D.level = standardLevel D.toCMData D.l D.T D.R Sa
  resid_eq : ∀ σ, CHT.glRes S.resid σ =
    Matrix.GeneralLinearGroup.map κ.toRingHom (heckeResidualRep D m σ)
  multiplier : S.HasStandardMultiplier ∧ HasStandardResidualMultiplier S.resid
  decomposition : ∃ (d : ℕ) (m' : Fin d → ℕ) (e : (Σ i : Fin d, Fin (m' i)) ≃ Fin D.n)
    (ρs : (i : Fin d) → Gal D.L →* GL (Fin (m' i)) 𝓀[E]),
    (∀ σ, CHT.glRes S.resid σ = blockSum e (fun i => ρs i) σ) ∧ (∀ i, IsAbsIrred (ρs i)) ∧
    (∀ i, IsConjSelfDual (ρs i) (cycloBar E D.L ^ (1 - (D.n : ℤ)))) ∧
    ∀ i j, i ≠ j → IsEmpty ((stdRep (ρs i)).Equiv (stdRep (ρs j)))

end HeckeSetup

/-! ### PL.6/reducible-twisting-and-base-change: Twisting and soluble base change for residually
reducible rings and Hecke algebras -/

section Twisting

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- The characters classified by `𝒪⟦Δ/(c + 1)⟧` with values in `A`, `Δ` the Galois group of the
maximal abelian pro-`l` extension of `F` unramified outside `l`: the continuous characters
`ψ : G_F → A^×` with trivial reduction modulo the radical of `A`, unramified outside `l`, with
`ψ ψ^c = 1`. -/
def twistChars (F : Type) [Field F] (l : ℕ) (A : Type*) [CommRing A] : Set (Gal F →* Aˣ) :=
  {ψ | (∀ σ, ((ψ σ : Aˣ) : A) - 1 ∈ Ideal.jacobson (⊥ : Ideal A)) ∧
    (∀ N : ℕ, IsOpen {σ : Gal F | ((ψ σ : Aˣ) : A) - 1 ∈ Ideal.jacobson (⊥ : Ideal A) ^ N}) ∧
    (∀ w : Place F, ¬ w.Above l → ∀ σ ∈ inertia w.Fv, ψ (w.dec σ) = 1) ∧
    ∀ (c : Gal (maximalRealSubfield F)) (σ τ : Gal F), c ∉ (resCM F).range →
      resCM F τ = c * resCM F σ * c⁻¹ → ψ τ * ψ σ = 1}

/-- `g : R^univ_𝒮 → A` is a morphism of `C_𝒪`: `A` is a complete Noetherian local `𝒪`-algebra
with residue field `k` and `g` is a local homomorphism of `𝒪`-algebras. -/
def DefProblem.IsPoint (S : DefProblem F E n Λ) {A : Type} [CommRing A] [Algebra 𝒪[E] A]
    (g : S.univRing →+* A) : Prop :=
  IsCNL 𝒪[E] A ∧ IsLocalHom g ∧
    ∀ a : 𝒪[E], g (algebraMap Λ S.univRing (algebraMap 𝒪[E] Λ a)) = algebraMap 𝒪[E] A a

/-- The standing hypotheses of Thorne 2015 §3.6: `r̄` is Schur, `l` is odd and does not divide
`n`, the local problems are among those of §3.3, and the determinant of every lifting of type `𝒮`
is unramified at the places of `S` not above `l` (true for the Steinberg and unipotently ramified
problems and for unrestricted problems at places where all liftings are unramified; this last
restriction is needed and is not printed in the source). -/
structure IsTwistable (l : ℕ) (S : DefProblem F E n Λ) : Prop where
  schur : IsSchur S.resid
  l_odd : Odd l
  not_dvd : ¬ l ∣ n
  localProblems : ∀ v ∈ S.places, S.localCondition v = LocalCondition.ordinary ∨
    S.localCondition v = LocalCondition.steinberg ∨
    (∃ χ, S.localCondition v = LocalCondition.ramified χ) ∨
    S.localCondition v = LocalCondition.unrestricted
  det_unramified : ∀ (A : Type) [CommRing A] [Algebra Λ A]
    (r : Gal (maximalRealSubfield F) →* CHT n A), (S.lifts A).Holds r →
    ∀ v ∈ S.places, ¬ v.Above l →
      IsUnramified (resFieldHom (Matrix.GeneralLinearGroup.det.comp (CHT.glRes r)) v.emb)

/-- The ideal of `R^univ_𝒮` cutting out the quotient `R^univ_{𝒮,ψ₀}` on which
`det r^univ|G_{F,S} = ψ₀`, the Teichmüller lift of `det r̄|G_{F,S}` (`τ` is the Teichmüller
character `k^× → 𝒪^×`). -/
def fixedDetIdeal (S : DefProblem F E n Λ) (τ : (𝓀[E])ˣ →* (𝒪[E])ˣ) : Ideal S.univRing :=
  Ideal.span {x | ∃ σ : Gal F,
    x = Matrix.det (CHT.glRes S.univLift σ : Matrix (Fin n) (Fin n) S.univRing) -
      algebraMap Λ S.univRing (algebraMap 𝒪[E] Λ
        ((τ (Matrix.GeneralLinearGroup.det (CHT.glRes S.resid σ)) : (𝒪[E])ˣ) : 𝒪[E]))}

variable {l : ℕ} [Fact l.Prime] [ResChar E l]

/-- **`PL.6/reducible-twisting-and-base-change`** (1) (Thorne 2015, Lemma 3.36). Under the
hypotheses of §3.6 there is a canonical isomorphism
`R^univ_𝒮 ≅ R^univ_{𝒮,ψ₀} ⊗̂_𝒪 𝒪⟦Δ/(c + 1)⟧`. It is stated on points with values in `A ∈ C_𝒪`:
every point `g` of `R^univ_𝒮` is, for a unique pair of a point `g₀` of `R^univ_{𝒮,ψ₀}` and a
character `ψ` of `Δ/(c + 1)` with values in `1 + m_A`, the point classifying the twist
`r_{g₀} ⊗ ψ`. -/
theorem reducible_twisting_and_base_change_1 (S : DefProblem F E n Λ) (hS : IsTwistable l S)
    (τ : (𝓀[E])ˣ →* (𝒪[E])ˣ)
    (hτ : ∀ x, Units.map (IsLocalRing.residue 𝒪[E] : 𝒪[E] →* 𝓀[E]) (τ x) = x)
    (c : Gal (maximalRealSubfield F)) (hc : orderOf c = 2)
    (A : Type) [CommRing A] [Algebra 𝒪[E] A] (g : S.univRing →+* A) (hg : S.IsPoint g) :
    ∃! p : (S.univRing →+* A) × (Gal F →* Aˣ),
      S.IsPoint p.1 ∧ fixedDetIdeal S τ ≤ RingHom.ker p.1 ∧ p.2 ∈ twistChars F l A ∧
      CHT.StrictEquiv (S.liftAt g) (CHT.twist c (S.liftAt p.1) p.2) := by
  sorry

/-- **`PL.6/reducible-twisting-and-base-change`** (2a) (Thorne 2015, Lemma 3.38(1)). Let `𝔭` be
a prime of dimension one and characteristic `l` of `R^univ_𝒮`, `A ≅ k⟦T⟧` the normalisation of
`R^univ_𝒮/𝔭` (after enlarging `k`), given by `g : R^univ_𝒮 → k⟦T⟧`, `ψ` a continuous character
of `Δ/(c + 1)` with values in `1 + m_A`, and `𝔭_ψ` the kernel of the point `g_ψ` classifying
`r_𝔭 ⊗ ψ`. Then a minimal prime `Q` of `R^univ_𝒮` lies in `𝔭` if and only if it lies in `𝔭_ψ`. -/
theorem reducible_twisting_and_base_change_2a (S : DefProblem F E n Λ) (hS : IsTwistable l S)
    (c : Gal (maximalRealSubfield F)) (hc : orderOf c = 2)
    (g : S.univRing →+* PowerSeries 𝓀[E]) (hg : S.IsPoint g)
    (hdim : ringKrullDim (S.univRing ⧸ RingHom.ker g) = 1) (hfin : g.Finite)
    (hbir : ∀ a : PowerSeries 𝓀[E], ∃ x y : S.univRing, g y ≠ 0 ∧ a * g y = g x)
    (ψ : Gal F →* (PowerSeries 𝓀[E])ˣ) (hψ : ψ ∈ twistChars F l (PowerSeries 𝓀[E]))
    (gψ : S.univRing →+* PowerSeries 𝓀[E]) (hgψ : S.IsPoint gψ)
    (htwist : CHT.StrictEquiv (S.liftAt gψ) (CHT.twist c (S.liftAt g) ψ))
    (Q : Ideal S.univRing) (hQ : Q ∈ minimalPrimes S.univRing) :
    Q ≤ RingHom.ker g ↔ Q ≤ RingHom.ker gψ := by
  sorry

/-- **`PL.6/reducible-twisting-and-base-change`** (2b) (Thorne 2015, Lemma 3.38(2)). In the
situation of (2a) the character `ψ` can be chosen so that
`Frac(P_𝒮/𝔮_ψ) = Frac(R^univ_𝒮/𝔭_ψ) = Frac A`: every element of `A` is a quotient of images of
elements of `P_𝒮`. -/
theorem reducible_twisting_and_base_change_2b (S : DefProblem F E n Λ) (hS : IsTwistable l S)
    (c : Gal (maximalRealSubfield F)) (hc : orderOf c = 2)
    (g : S.univRing →+* PowerSeries 𝓀[E]) (hg : S.IsPoint g)
    (hdim : ringKrullDim (S.univRing ⧸ RingHom.ker g) = 1) (hfin : g.Finite)
    (hbir : ∀ a : PowerSeries 𝓀[E], ∃ x y : S.univRing, g y ≠ 0 ∧ a * g y = g x) :
    ∃ (ψ : Gal F →* (PowerSeries 𝓀[E])ˣ) (gψ : S.univRing →+* PowerSeries 𝓀[E]),
      ψ ∈ twistChars F l (PowerSeries 𝓀[E]) ∧ S.IsPoint gψ ∧
      CHT.StrictEquiv (S.liftAt gψ) (CHT.twist c (S.liftAt g) ψ) ∧
      ∀ a : PowerSeries 𝓀[E], ∃ x y : charPolySubring S,
        gψ (y : S.univRing) ≠ 0 ∧ a * gψ (y : S.univRing) = gψ (x : S.univRing) := by
  sorry

end Twisting

section TwistingHecke

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- **`PL.6/reducible-twisting-and-base-change`** (2c) (Thorne 2015, Corollary 4.14). In the
setting of Thorne 2015 §4.3 and the situation of (2a): if `J_{𝒮_χ} R^univ_{𝒮_χ} ⊂ 𝔭` then
`J_{𝒮_χ} R^univ_{𝒮_χ} ⊂ 𝔭_ψ`. -/
theorem reducible_twisting_and_base_change_2c (D : HeckeDatum E) (Sa : Set (Place D.L))
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : (bigOrdinaryHeckeAlgebra D ⧸ m) ≃+* 𝓀[E])
    (S : DefProblem D.L E D.n (iwasawaAlgebra D)) (hsetup : IsThorneSetup D Sa m κ S)
    (hS : IsTwistable D.l S) (c : Gal (maximalRealSubfield D.L)) (hc : orderOf c = 2)
    (g : S.univRing →+* PowerSeries 𝓀[E]) (hg : S.IsPoint g)
    (hdim : ringKrullDim (S.univRing ⧸ RingHom.ker g) = 1) (hfin : g.Finite)
    (hbir : ∀ a : PowerSeries 𝓀[E], ∃ x y : S.univRing, g y ≠ 0 ∧ a * g y = g x)
    (ψ : Gal D.L →* (PowerSeries 𝓀[E])ˣ) (hψ : ψ ∈ twistChars D.L D.l (PowerSeries 𝓀[E]))
    (gψ : S.univRing →+* PowerSeries 𝓀[E]) (hgψ : S.IsPoint gψ)
    (htwist : CHT.StrictEquiv (S.liftAt gψ) (CHT.twist c (S.liftAt g) ψ))
    (hJ : heckeKernel D m S ≤ RingHom.ker g) : heckeKernel D m S ≤ RingHom.ker gψ := by
  sorry

end TwistingHecke

end TauCeti.Automorphy
namespace TauCeti.Automorphy

section Lemma340

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- The auxiliary extension `Λ → Λ̃` of Thorne 2015 §3.7 for a finite homomorphism `Λ → A`:
finite and faithfully flat, inducing a bijection on minimal primes, with a surjection `Λ̃ → A`
extending `Λ → A`, such that for every minimal prime `Q ⊂ Λ` the ring `Λ̃/(Q)` is a power series
ring over `𝒪` and `Λ/(Q, λ) → Λ̃/(Q, λ)` induces a separable extension of fraction fields. -/
structure IsThorneExtension (Λt : Type) [CommRing Λt] [Algebra Λ Λt] {A : Type} [CommRing A]
    [Algebra Λ A] (π : Λt →ₐ[Λ] A) : Prop where
  finite : Module.Finite Λ Λt
  faithfullyFlat : Module.FaithfullyFlat Λ Λt
  surjective : Function.Surjective π
  comap_minimal : ∀ Q' ∈ minimalPrimes Λt, Q'.comap (algebraMap Λ Λt) ∈ minimalPrimes Λ
  bijective : ∀ Q ∈ minimalPrimes Λ,
    ∃! Q' : Ideal Λt, Q' ∈ minimalPrimes Λt ∧ Q'.comap (algebraMap Λ Λt) = Q
  powerSeries : ∀ Q ∈ minimalPrimes Λ, ∃ s : ℕ,
    Nonempty ((Λt ⧸ Q.map (algebraMap Λ Λt)) ≃+* MvPowerSeries (Fin s) 𝒪[E])
  separable : ∀ Q ∈ minimalPrimes Λ,
    ∀ b : Λt ⧸ (Q ⊔ (IsLocalRing.maximalIdeal 𝒪[E]).map (algebraMap 𝒪[E] Λ)).map
        (algebraMap Λ Λt),
      ∃ p : Polynomial (Λ ⧸ (Q ⊔ (IsLocalRing.maximalIdeal 𝒪[E]).map (algebraMap 𝒪[E] Λ))),
        (p.map (algebraMap _ (FractionRing
          (Λ ⧸ (Q ⊔ (IsLocalRing.maximalIdeal 𝒪[E]).map (algebraMap 𝒪[E] Λ)))))).Separable ∧
        p.eval₂ (Ideal.quotientMap _ (algebraMap Λ Λt) Ideal.le_comap_map) b = 0

/-- The ring `R^∞ = (R^{loc}_{𝒮,S} ⊗_Λ Λ̃)⟦x_1, …, x_{q'}⟧` of Thorne 2015 §3.7. -/
abbrev DefProblem.patchedRing (S : DefProblem F E n Λ) (Λt : Type) [CommRing Λt] [Algebra Λ Λt]
    (q' : ℕ) : Type :=
  MvPowerSeries (Fin q') (TensorProduct Λ S.localRing Λt)

/-- The homomorphism `R^∞ → A` attached to a lifting `r` of type `𝒮` over `A` and `Λ̃ → A`,
sending each `x_i` to `0`. Its kernel is `P^∞`. -/
def DefProblem.patchedRingToPoint (S : DefProblem F E n Λ) (Λt : Type) [CommRing Λt]
    [Algebra Λ Λt] (q' : ℕ) {A : Type} [CommRing A] [Algebra Λ A]
    (r : Gal (maximalRealSubfield F) →* CHT n A) (π : Λt →ₐ[Λ] A) :
    S.patchedRing Λt q' →+* A :=
  (Algebra.TensorProduct.productMap (DefProblem.localRing.pointOf S r) π).toRingHom.comp
    MvPowerSeries.constantCoeff

/-- The ring `R^∞_{P^∞}/(Q)` of Thorne 2015, Lemma 3.40: the localisation of `R^∞` at `P^∞`,
completed, modulo the ideal generated by an ideal `Q` of `Λ`. -/
abbrev DefProblem.patchedLocalRing (S : DefProblem F E n Λ) (Λt : Type) [CommRing Λt]
    [Algebra Λ Λt] (q' : ℕ) (P : Ideal (S.patchedRing Λt q')) [P.IsPrime] (Q : Ideal Λ) : Type :=
  AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime P)) (Localization.AtPrime P) ⧸
    Q.map ((algebraMap (Localization.AtPrime P)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime P))
        (Localization.AtPrime P))).comp
      ((algebraMap (S.patchedRing Λt q') (Localization.AtPrime P)).comp
        (algebraMap Λ (S.patchedRing Λt q'))))

variable {l : ℕ} [Fact l.Prime] [ResChar E l]

/-- **`PL.6/reducible-twisting-and-base-change`** (3) (Thorne 2015, Lemma 3.40, with the erratum
of Allen–Newton–Thorne §3.1). Let `𝒮` be the problem (3.2) of Thorne 2015 with
`[F_ṽ : ℚ_l] > n(n-1)/2 + 1` on `S_l`, in the situation of Thorne 2015 §3.7: `l ∤ n`,
`[F⁺ : ℚ] > 1`, `r̄|G_{F,S}` has two absolutely irreducible constituents, `𝔭` is a prime of
dimension one and characteristic `l` of `R^univ_𝒮` with normalisation `A ≅ k⟦T⟧`, `Λ → A` is
finite and `Λ̃` is an auxiliary extension. Suppose the `ψ^v_i mod 𝔭` are pairwise distinct for
`v ∈ S_l`, `r_𝔭|G_{F_ṽ}` is unramified with scalar Frobenius in `1 + m_A` for `v ∈ S(B)`, and
`r_𝔭|G_{F_ṽ}` is trivial for `v ∈ R`. Then for each minimal prime `Q ⊂ Λ`: if the `χ_{v,i}`
(`v ∈ R`) are pairwise distinct, `Spec R^∞_{P^∞}/(Q)` is irreducible of dimension
`n(n+1)[F⁺ : ℚ]/2 + n²|S| + q'` with generic point of characteristic `0`; if the `χ_{v,i}` are
trivial and the coefficient field is large enough, it is equidimensional of that dimension with
all generic points of characteristic `0`, and each minimal prime of `R^∞_{P^∞}/(Q, λ)` contains a
unique minimal prime of `R^∞_{P^∞}/(Q)`. -/
theorem reducible_twisting_and_base_change_3 (S : DefProblem F E n Λ) (SB R Sa : Set (Place F))
    (χ : (v : Place F) → Fin n → (𝓀[v.Fv])ˣ →* (𝒪[E])ˣ)
    (hS : IsThorneProblem l S SB R Sa χ)
    (hdeg : ∀ v ∈ S.placesAbove l, n * (n - 1) / 2 + 1 < v.localDegree)
    (hl : Odd l) (hln : ¬ l ∣ n) {n₁ n₂ : ℕ} (h : n₁ + n₂ = n)
    (rbar₁ : Gal (maximalRealSubfield F) →* CHT n₁ 𝓀[E])
    (rbar₂ : Gal (maximalRealSubfield F) →* CHT n₂ 𝓀[E])
    (hres : IsTwoBlockResidual S h rbar₁ rbar₂)
    (hF : 1 < Module.finrank ℚ (maximalRealSubfield F))
    [Algebra Λ (PowerSeries 𝓀[E])] (f : S.univRing →ₐ[Λ] PowerSeries 𝓀[E])
    (hdim : ringKrullDim (S.univRing ⧸ RingHom.ker f) = 1) (hfin : f.toRingHom.Finite)
    (hbir : ∀ a : PowerSeries 𝓀[E], ∃ x y : S.univRing, f y ≠ 0 ∧ a * f y = f x)
    (hΛ : Module.Finite Λ (PowerSeries 𝓀[E]))
    (Λt : Type) [CommRing Λt] [Algebra Λ Λt] (π : Λt →ₐ[Λ] PowerSeries 𝓀[E])
    (hΛt : IsThorneExtension (E := E) Λt π) (q' : ℕ)
    (P : Ideal (S.patchedRing Λt q')) [P.IsPrime]
    (hP : P = RingHom.ker (S.patchedRingToPoint Λt q' (S.liftOf f) π))
    (h1 : ∀ v ∈ S.placesAbove l, ∀ i j, i ≠ j →
      S.charOn l (PowerSeries 𝓀[E]) v i ≠ S.charOn l (PowerSeries 𝓀[E]) v j)
    (h2 : ∀ v ∈ SB, IsUnramified (resFieldHom (CHT.glRes (S.liftOf f)) v.emb) ∧
      ∃ α : PowerSeries 𝓀[E], PowerSeries.constantCoeff α = 1 ∧
        (CHT.glRes (S.liftOf f) v.frob : Matrix (Fin n) (Fin n) (PowerSeries 𝓀[E])) =
          Matrix.scalar (Fin n) α)
    (h3 : ∀ v ∈ R, resFieldHom (CHT.glRes (S.liftOf f)) v.emb = 1)
    (Q : Ideal Λ) (hQ : Q ∈ minimalPrimes Λ) :
    ((∀ v ∈ R, Function.Injective (χ v)) →
      (∃! 𝔮 : Ideal (S.patchedLocalRing Λt q' P Q),
        𝔮 ∈ minimalPrimes (S.patchedLocalRing Λt q' P Q)) ∧
      ringKrullDim (S.patchedLocalRing Λt q' P Q) =
        ((n * (n + 1) * Module.finrank ℚ (maximalRealSubfield F) / 2 +
          n ^ 2 * S.places.ncard + q' : ℕ) : WithBot ℕ∞) ∧
      ∀ 𝔮 ∈ minimalPrimes (S.patchedLocalRing Λt q' P Q),
        (l : S.patchedLocalRing Λt q' P Q) ∉ 𝔮) ∧
    ((∀ v ∈ R, ∀ i, χ v i = 1) →
      (∀ v ∈ R, LocalCondition.geometricComponents.Holds (S.localCondition v)) →
      (∀ 𝔮 ∈ minimalPrimes (S.patchedLocalRing Λt q' P Q),
        ringKrullDim (S.patchedLocalRing Λt q' P Q ⧸ 𝔮) =
          ((n * (n + 1) * Module.finrank ℚ (maximalRealSubfield F) / 2 +
            n ^ 2 * S.places.ncard + q' : ℕ) : WithBot ℕ∞) ∧
        (l : S.patchedLocalRing Λt q' P Q) ∉ 𝔮) ∧
      ∀ 𝔮' ∈ (Ideal.span {(l : S.patchedLocalRing Λt q' P Q)}).minimalPrimes,
        ∃! 𝔮 : Ideal (S.patchedLocalRing Λt q' P Q),
          𝔮 ∈ minimalPrimes (S.patchedLocalRing Λt q' P Q) ∧ 𝔮 ≤ 𝔮') := by
  sorry

end Lemma340

end TauCeti.Automorphy
namespace TauCeti.Automorphy

open TauCeti.DefiniteUnitary

section BaseChangeHecke

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- The set `T_M` of places of `M` consists of the places above the set `T_L` of places of
`L`. -/
def IsSetOfPlacesAbove {L M : Type} [Field L] [Field M] (i : L →+* M) (TM : Set (Place M))
    (TL : Set (Place L)) : Prop :=
  (∀ w ∈ TM, ∃ v ∈ TL, w.LiesOver i v) ∧
    ∀ v ∈ TL, ∀ w : Place M, w.LiesOver i v → ∃ w' ∈ TM, w'.Same w

/-- **`PL.6/reducible-twisting-and-base-change`** (4) (Thorne 2015, Propositions 4.17 and 4.18).
In the setting of Thorne 2015 §4.3 over `L` and over a soluble CM extension `M/L`, linearly
disjoint over `L` from the extension of `L(ζ_l)` cut out by `r̄_m|G_{L(ζ_l)}`, in which every
place above `S_l ∪ S_a ∪ R` splits (the places of `S(B)` need not split), with the data over `M`
obtained from those over `L` (places above, `χ_w = χ_v` on residue fields,
`r̄_{m_M} = r̄_m|G_{M⁺}`): restriction of deformations gives a finite homomorphism
`φ : R^univ_{𝒮_{χ,M}} → R^univ_{𝒮_χ}` over a homomorphism `Λ_M → Λ_L`; it maps `P_{𝒮_{χ,M}}`
into `P_{𝒮_χ}`, and there is a homomorphism of the localised Hecke algebras making the square
with the maps `P → T` commute. In particular `J_{𝒮_{χ,M}} P_{𝒮_χ} ⊂ J_{𝒮_χ}`. -/
theorem reducible_twisting_and_base_change_4 (DL DM : HeckeDatum E) (hn : DM.n = DL.n)
    (hl : DM.l = DL.l) [Algebra DL.L DM.L] [IsGalois DL.L DM.L]
    (hsol : Group.IsSolvable (DM.L ≃ₐ[DL.L] DM.L))
    (ip : maximalRealSubfield DL.L →+* maximalRealSubfield DM.L)
    (hip : ∀ x, ((ip x : maximalRealSubfield DM.L) : DM.L) = algebraMap DL.L DM.L (x : DL.L))
    (SaL : Set (Place DL.L)) (SaM : Set (Place DM.L))
    (mL : Ideal (bigOrdinaryHeckeAlgebra DL)) [mL.IsMaximal]
    (mM : Ideal (bigOrdinaryHeckeAlgebra DM)) [mM.IsMaximal]
    (κL : (bigOrdinaryHeckeAlgebra DL ⧸ mL) ≃+* 𝓀[E])
    (κM : (bigOrdinaryHeckeAlgebra DM ⧸ mM) ≃+* 𝓀[E])
    (SL : DefProblem DL.L E DL.n (iwasawaAlgebra DL))
    (SM : DefProblem DM.L E DM.n (iwasawaAlgebra DM))
    (hL : IsThorneSetup DL SaL mL κL SL) (hM : IsThorneSetup DM SaM mM κM SM)
    (hT : IsSetOfPlacesAbove (algebraMap DL.L DM.L) DM.T DL.T)
    (hR : IsSetOfPlacesAbove (algebraMap DL.L DM.L) DM.R DL.R)
    (hSB : IsSetOfPlacesAbove (algebraMap DL.L DM.L) DM.toCMData.SB DL.toCMData.SB)
    (hSa : IsSetOfPlacesAbove (algebraMap DL.L DM.L) SaM SaL)
    (hχ : ∀ w ∈ DM.R, ∀ v ∈ DL.R, w.LiesOver (algebraMap DL.L DM.L) v →
      ∀ (j : Fin DL.n) (a : DL.L) (u : (𝒪[v.Fv])ˣ) (u' : (𝒪[w.Fv])ˣ),
        ((u : 𝒪[v.Fv]) : v.Fv) = v.emb a →
        ((u' : 𝒪[w.Fv]) : w.Fv) = w.emb (algebraMap DL.L DM.L a) →
        DM.χ w (Fin.cast hn.symm j)
            (Units.map (IsLocalRing.residue 𝒪[w.Fv] : 𝒪[w.Fv] →* 𝓀[w.Fv]) u') =
          DL.χ v j (Units.map (IsLocalRing.residue 𝒪[v.Fv] : 𝒪[v.Fv] →* 𝓀[v.Fv]) u))
    (hresid : SM.resid = (hn ▸ SL.resid.comp (Field.absoluteGaloisGroup.map ip).toMonoidHom :
      Gal (maximalRealSubfield DM.L) →* CHT DM.n 𝓀[E]))
    (hdisjoint : (Field.absoluteGaloisGroup.map (algebraMap DL.L DM.L)).toMonoidHom.range ⊔
      Subgroup.map
        (Field.absoluteGaloisGroup.map
          (algebraMap DL.L (CyclotomicField DL.l DL.L))).toMonoidHom
        (resFieldHom (CHT.glRes SL.resid) (algebraMap DL.L (CyclotomicField DL.l DL.L))).ker =
      ⊤)
    (hsplit : ∀ v ∈ {v ∈ DL.T | v.Above DL.l} ∪ SaL ∪ DL.R, ∀ w : Place DM.L,
      w.LiesOver (algebraMap DL.L DM.L) v ∨ w.LiesOver (algebraMap DL.L DM.L) v.conj →
        DenseRange (w.emb.comp (algebraMap DL.L DM.L))) :
    ∃ (lam : iwasawaAlgebra DM →+* iwasawaAlgebra DL) (φ : SM.univRing →+* SL.univRing)
      (φT : Localization.AtPrime mM →+* Localization.AtPrime mL),
      (∀ a, φ (algebraMap (iwasawaAlgebra DM) SM.univRing a) =
        algebraMap (iwasawaAlgebra DL) SL.univRing (lam a)) ∧
      CHT.StrictEquiv (SM.liftAt φ)
        (hn ▸ SL.univLift.comp (Field.absoluteGaloisGroup.map ip).toMonoidHom :
          Gal (maximalRealSubfield DM.L) →* CHT DM.n SL.univRing) ∧
      φ.Finite ∧ (∀ x ∈ charPolySubring SM, φ x ∈ charPolySubring SL) ∧
      (∀ (x : charPolySubring SM) (y : charPolySubring SL), (y : SL.univRing) = φ x →
        charPolyToHecke DL mL SL y = φT (charPolyToHecke DM mM SM x)) ∧
      ∀ (x : charPolySubring SM) (y : charPolySubring SL), (y : SL.univRing) = φ x →
        charPolyToHecke DM mM SM x = 0 → charPolyToHecke DL mL SL y = 0 := by
  sorry

end BaseChangeHecke

end TauCeti.Automorphy
namespace TauCeti.Automorphy

open TauCeti.DefiniteUnitary

/-! ### PL.6/generic-prime-r-equals-t: The generic R_𝔭 = T_𝔭 theorem -/

section GenericRT

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- **`PL.6/generic-prime-r-equals-t`** (Allen–Newton–Thorne, Theorem 4.1; for two constituents
Thorne 2015, Corollary 4.20 with Corollary 5.7). In the set-up of Allen–Newton–Thorne §4.1–4.2,
let `𝒮₁` be the problem with residual representation `r̄_m`, multiplier `ε^{1-n} δ^n_{L/L⁺}` and
local problems `R^△_v` at `S_l`, `R^1_v` at `R`, `R^{St}_v` at `S(B)`, `R^□_v` at `S_a`, and
`J_{𝒮₁} = ker(P_{𝒮₁} → T^T_1(U(l^∞), 𝒪)_m)`. Let `𝔭 ⊂ R^univ_{𝒮₁}` be a prime of dimension one
and characteristic `l` such that (1) `J_{𝒮₁} R^univ_{𝒮₁} ⊂ 𝔭`; (2) `r_𝔭` is generic; (3) for
`v ∈ R`, `r_𝔭|G_{L_ṽ}` is trivial and `l^N > n` where `l^N ∥ q_v - 1`, and for `v ∈ S(B)`,
`r_𝔭|G_{L_ṽ}` is unramified with `r_𝔭(Frob_ṽ)` scalar; (4) `r̄_m|G_{L,S}` is primitive; (5)
`ζ_l ∉ L`, `r̄_m|G_{L⁺(ζ_l)}` is Schur and `r̄_m(G_{L,S})` has no quotient of order `l`; (6)
`l > 3` and `l ∤ n`. Then every prime `Q ⊂ 𝔭` of `R^univ_{𝒮₁}` contains `J_{𝒮₁} R^univ_{𝒮₁}`.
For more than two constituents the source indicates the modification of Thorne's argument
without details. -/
theorem generic_prime_r_equals_t (D : HeckeDatum E) (Sa : Set (Place D.L))
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : (bigOrdinaryHeckeAlgebra D ⧸ m) ≃+* 𝓀[E])
    (S₁ : DefProblem D.L E D.n (iwasawaAlgebra D)) (hsetup : IsThorneSetup D Sa m κ S₁)
    (hχ : ∀ v ∈ D.R, ∀ i, D.χ v i = 1)
    (𝔭 : Ideal S₁.univRing) [𝔭.IsPrime]
    (h1 : heckeKernel D m S₁ ≤ 𝔭)
    (h2 : IsGenericPrime D.l S₁ 𝔭)
    (h3R : ∀ v ∈ D.R, resFieldHom (CHT.glRes (S₁.liftMod 𝔭)) v.emb = 1 ∧
      ∃ N : ℕ, D.n < D.l ^ N ∧ D.l ^ N ∣ v.norm - 1 ∧ ¬ D.l ^ (N + 1) ∣ v.norm - 1)
    (h3SB : ∀ v ∈ D.toCMData.SB,
      IsUnramified (resFieldHom (CHT.glRes (S₁.liftMod 𝔭)) v.emb) ∧
        IsScalarGL (CHT.glRes (S₁.liftMod 𝔭) v.frob))
    (h4 : IsStronglyPrimitive (CHT.glRes S₁.resid))
    (h5ζ : ∀ ζ : D.L, ¬ IsPrimitiveRoot ζ D.l)
    (h5Schur : IsSchur (resFieldHom S₁.resid (algebraMap (maximalRealSubfield D.L)
      (CyclotomicField D.l (maximalRealSubfield D.L)))))
    (h5quot : HasNoQuotientOfOrder (CHT.glRes S₁.resid).range D.l)
    (h6 : 3 < D.l ∧ ¬ D.l ∣ D.n)
    (Q : Ideal S₁.univRing) [Q.IsPrime] (hQ : Q ≤ 𝔭) : heckeKernel D m S₁ ≤ Q := by
  sorry

/-- **`PL.6/generic-prime-r-equals-t`**, variant used by Newton–Thorne 2026, Proposition 3.13:
with `S(B) = ∅`, the same conclusion when for `v ∈ R` the representation `r_𝔭|G_{L_ṽ}` is
unramified with scalar Frobenius (in place of trivial). It is deduced there from Theorem 4.1 by
repeating at `R` the unramified twist of Thorne 2015, Lemma 3.40. -/
theorem generic_prime_r_equals_t_scalar (D : HeckeDatum E) (Sa : Set (Place D.L))
    (m : Ideal (bigOrdinaryHeckeAlgebra D)) [m.IsMaximal]
    (κ : (bigOrdinaryHeckeAlgebra D ⧸ m) ≃+* 𝓀[E])
    (S₁ : DefProblem D.L E D.n (iwasawaAlgebra D)) (hsetup : IsThorneSetup D Sa m κ S₁)
    (hχ : ∀ v ∈ D.R, ∀ i, D.χ v i = 1) (hSB : D.toCMData.SB = ∅)
    (𝔭 : Ideal S₁.univRing) [𝔭.IsPrime]
    (h1 : heckeKernel D m S₁ ≤ 𝔭)
    (h2 : IsGenericPrime D.l S₁ 𝔭)
    (h3R : ∀ v ∈ D.R, IsUnramified (resFieldHom (CHT.glRes (S₁.liftMod 𝔭)) v.emb) ∧
      IsScalarGL (CHT.glRes (S₁.liftMod 𝔭) v.frob) ∧
      ∃ N : ℕ, D.n < D.l ^ N ∧ D.l ^ N ∣ v.norm - 1 ∧ ¬ D.l ^ (N + 1) ∣ v.norm - 1)
    (h4 : IsStronglyPrimitive (CHT.glRes S₁.resid))
    (h5ζ : ∀ ζ : D.L, ¬ IsPrimitiveRoot ζ D.l)
    (h5Schur : IsSchur (resFieldHom S₁.resid (algebraMap (maximalRealSubfield D.L)
      (CyclotomicField D.l (maximalRealSubfield D.L)))))
    (h5quot : HasNoQuotientOfOrder (CHT.glRes S₁.resid).range D.l)
    (h6 : 3 < D.l ∧ ¬ D.l ∣ D.n)
    (Q : Ideal S₁.univRing) [Q.IsPrime] (hQ : Q ≤ 𝔭) : heckeKernel D m S₁ ≤ Q := by
  sorry

end GenericRT

end TauCeti.Automorphy
namespace TauCeti.Automorphy

/-! ## PL.7: finiteness and automorphy lifting for residually reducible representations -/

section PL7Definitions

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- `π` is RACSDC: a regular algebraic cuspidal polarized representation of `GL_n(𝔸_F)`, `F` CM,
whose polarization has multiplier `δ^n_{F/F⁺}`, so that `π^c ≅ π^∨`. -/
def IsRACSDC (π : RACP F n) (ι : E →+* ℂ) : Prop :=
  ∀ σ, π.multiplier ι σ = delta F E σ ^ n

/-- `ρ` is ramified at only finitely many places. -/
def IsRamifiedAtFinitelyMany (ρ : Gal F →ₜ* GL (Fin n) E) : Prop :=
  ∃ T : Set (Place F), T.Finite ∧
    ∀ w : Place F, (∀ v ∈ T, ¬ w.Same v) → IsUnramified (resPlace ρ w).toMonoidHom

/-- `ρ̄` is the reduction of an invariant lattice in `ρ`. Its semisimplification `ρ̄^{ss}` does not
depend on the lattice. -/
def IsReductionOf (ρbar : Gal F →* GL (Fin n) 𝓀[E]) (ρ : Gal F →ₜ* GL (Fin n) E) : Prop :=
  ∃ ρ₀ : Gal F →ₜ* GL (Fin n) 𝒪[E],
    Conj (ρ : Gal F → GL (Fin n) E) (generic ρ₀.toMonoidHom) ∧ reduction ρ₀.toMonoidHom = ρbar

/-- A Steinberg-type place for `ρ`: `ρ|^{ss}_{G_{F_ṽ₀}} ≅ ⊕_{i=1}^n ψ ε^{n-i}` for an unramified
character `ψ` of `G_{F_ṽ₀}`. -/
def IsSteinbergTypeAt (ρ : Gal F →ₜ* GL (Fin n) E) (v₀ : Place F) : Prop :=
  ∃ ψ : Gal v₀.Fv →ₜ* Eˣ, IsUnramified ψ.toMonoidHom ∧
    IsSemisimplificationOf
      (stdRep (diagChar fun i : Fin n =>
        ψ.toMonoidHom * (cyclo E v₀.Fv).toMonoidHom ^ (n - 1 - (i : ℕ))))
      (stdRep (resPlace ρ v₀).toMonoidHom)

/-- `F'/F` is linearly disjoint over `F` from the extension of `F(ζ_l)` cut out by
`ρ̄|G_{F(ζ_l)}`: the group `G_F` is generated by `G_{F'}` and the kernel of `ρ̄|G_{F(ζ_l)}`. -/
def IsDisjointFromCutOut (l : ℕ) {H : Type*} [Group H] (ρbar : Gal F →* H) {F' : Type*}
    [Field F'] (i : F →+* F') : Prop :=
  (Field.absoluteGaloisGroup.map i).toMonoidHom.range ⊔
    Subgroup.map (Field.absoluteGaloisGroup.map (algebraMap F (CyclotomicField l F))).toMonoidHom
      (resFieldHom ρbar (algebraMap F (CyclotomicField l F))).ker = ⊤

/-- The residual hypotheses of Allen–Newton–Thorne, Theorem 6.1 (4), (7) and Theorem 6.2 (4),
(5), without the condition on `F(ζ_l)` and `ker ad`: `ρ̄^{ss} ≅ ρ̄_1 ⊕ ⋯ ⊕ ρ̄_d` with each `ρ̄_i`
absolutely irreducible and `ρ̄_i^c ≅ ρ̄_i^∨ ε^{1-n}`; `F ⊄ F⁺(ζ_l)`; each `ρ̄_i|G_{F(ζ_l)}` is
absolutely irreducible and `ρ̄_i|G_{F(ζ_l)} ≇ ρ̄_j|G_{F(ζ_l)}` for `i ≠ j` (so the `ρ̄_i` are
pairwise non-isomorphic); `ρ̄^{ss}` is primitive and `ρ̄^{ss}(G_F)` has no quotient of order
`l`. -/
structure IsANTResidual (l : ℕ) (ρbar ρss : Gal F →* GL (Fin n) 𝓀[E]) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E]) :
    Prop where
  ss : IsSemisimplificationOf (stdRep ρss) (stdRep ρbar)
  eq_blockSum : ∀ σ, ρss σ = blockSum e (fun i => ρs i) σ
  continuous : IsContinuousResidual ρss ∧ ∀ i, IsContinuousResidual (ρs i)
  absIrred : ∀ i, IsAbsIrred (ρs i)
  conjSelfDual : ∀ i, IsConjSelfDual (ρs i) (cycloBar E F ^ (1 - (n : ℤ)))
  not_sub : IsEmpty (F →ₐ[maximalRealSubfield F] CyclotomicField l (maximalRealSubfield F))
  absIrred_cyclo : ∀ i, IsAbsIrred (resFieldHom (ρs i) (algebraMap F (CyclotomicField l F)))
  not_iso_cyclo : ∀ i j, i ≠ j →
    IsEmpty ((stdRep (resFieldHom (ρs i) (algebraMap F (CyclotomicField l F)))).Equiv
      (stdRep (resFieldHom (ρs j) (algebraMap F (CyclotomicField l F)))))
  primitive : IsPrimitive ρss
  noQuotient : HasNoQuotientOfOrder ρss.range l

/-- `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}` for `ρ̄^{ss} = ⊕ ρ̄_i`: some element of `G_F` outside
`G_{F(ζ_l)}` acts on every `ρ̄_i` by the same scalar. -/
def CycloNotInAdKernel (l : ℕ) {k : Type*} [Field k] {d : ℕ} {m : Fin d → ℕ}
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) k) : Prop :=
  ∃ σ : Gal F,
    σ ∉ (Field.absoluteGaloisGroup.map (algebraMap F (CyclotomicField l F))).toMonoidHom.range ∧
    ∃ a : k, ∀ i, (ρs i σ : Matrix (Fin (m i)) (Fin (m i)) k) = Matrix.scalar (Fin (m i)) a

/-- The local condition of Thorne 2024, Theorem 7.5: there is a place `w ∤ l` of `F` at which
`ρ̄` is unramified and `H⁰(G_{F_w}, ad ρ̄(1)) = 0`. -/
def HasAuxiliaryPlace (l : ℕ) (ρbar : Gal F →* GL (Fin n) 𝓀[E]) : Prop :=
  ∃ w : Place F, ¬ w.Above l ∧ IsUnramified (resFieldHom ρbar w.emb) ∧
    ∀ X : Matrix (Fin n) (Fin n) 𝓀[E],
      (∀ σ : Gal w.Fv, ((cycloBar E w.Fv σ : (𝓀[E])ˣ) : 𝓀[E]) •
        ((ρbar (w.dec σ) : Matrix (Fin n) (Fin n) 𝓀[E]) * X *
          ((ρbar (w.dec σ))⁻¹ : GL (Fin n) 𝓀[E])) = X) → X = 0

/-- The ordinary problem with Steinberg places `Σ`: `S ⊃ S_l` consists of places split in `F`,
the coefficient ring is the ordinary one, and the local problems are `R^△_v` at `S_l` (where
`r̄|G_{F_ṽ}` is trivial), `R^{St}_v` at the places of `Σ` (prime to `l`, with `q_v ≡ 1 mod l` and
`r̄|G_{F_ṽ}` trivial) and `R^□_v` at the other places. -/
structure IsOrdinarySteinbergProblem (l : ℕ) (S : DefProblem F E n Λ) (St : Set (Place F)) :
    Prop where
  ordinaryCoefficients : (ordinaryCoefficients F E n Λ l).Holds S
  above_l : ∀ v : Place F, v.Above l → ¬ v.Outside S.places
  split : ∀ v ∈ S.places, v.IsSplit
  subset : St ⊆ S.places
  not_above : ∀ v ∈ St, ¬ v.Above l
  at_l : ∀ v ∈ S.placesAbove l, S.localCondition v = LocalCondition.ordinary ∧
    resFieldHom (CHT.glRes S.resid) v.emb = 1
  at_St : ∀ v ∈ St, S.localCondition v = LocalCondition.steinberg ∧ (v.norm : ZMod l) = 1 ∧
    resFieldHom (CHT.glRes S.resid) v.emb = 1
  elsewhere : ∀ v ∈ S.places, ¬ v.Above l → v ∉ St →
    S.localCondition v = LocalCondition.unrestricted

end PL7Definitions

section PL7a

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]
variable {l : ℕ} [Fact l.Prime] [ResChar E l]

/-! ### PL.7/ordinary-steinberg-finiteness: Finiteness of ordinary locally Steinberg deformation
rings -/

/-- **`PL.7/ordinary-steinberg-finiteness`** (a) (Allen–Newton–Thorne, Theorem 6.2). Let `π` be
a RACSDC automorphic representation of `GL_n(𝔸_F)`, `r : G_{F⁺} → 𝒢_n(𝒪)` an extension of
`r_ι(π)` with `ν ∘ r = ε^{1-n} δ^n_{F/F⁺}`, and `S ⊃ S_l` a finite set of places of `F⁺` split in
`F`. Assume (1) `π` is `ι`-ordinary and `r̄|G_{F_ṽ}` is trivial for `v ∈ S_l`; (2) `π` is
unramified outside `S`; (3) there is `v₀ ∈ S`, `v₀ ∤ l`, with `π_{ṽ₀}` an unramified twist of the
Steinberg representation, `q_{v₀} ≡ 1 mod l` and `r̄|G_{F_{ṽ₀}}` trivial; (4) with
`ρ̄ = r̄|G_{F,S}`, `ρ̄^{ss} ≅ ⊕ ρ̄_i` with `ρ̄_i` absolutely irreducible and
`ρ̄_i^c ≅ ρ̄_i^∨ ε^{1-n}`; (5) `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}`, `F ⊄ F⁺(ζ_l)`, the `ρ̄_i|G_{F(ζ_l)}`
are absolutely irreducible and pairwise non-isomorphic, `ρ̄` is primitive and `ρ̄(G_F)` has no
quotient of order `l`; (6) `l > 3` and `l ∤ n`. Then for
`𝒮 = (F/F⁺, S, S̃, Λ, r̄, ε^{1-n} δ^n_{F/F⁺}, {R^△_v}_{S_l} ∪ {R^□_v}_{S - (S_l ∪ {v₀})} ∪
{R^{St}_{v₀}})` the ring `R^univ_𝒮` is a finite `Λ`-algebra. -/
theorem ordinary_steinberg_finiteness_a (ι : E →+* ℂ) (π : RACP F n) (hπ : IsRACSDC π ι)
    (r : Gal (maximalRealSubfield F) →ₜ* CHT n 𝒪[E])
    (hrπ : Conj (π.galoisRep ι : Gal F → GL (Fin n) E) (generic (CHT.glRes r.toMonoidHom)))
    (hν : ∀ σ, Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (CHT.nu n 𝒪[E] (r σ)) =
      cyclo E (maximalRealSubfield F) σ ^ (1 - (n : ℤ)) * delta F E σ ^ n)
    (S : DefProblem F E n Λ)
    (hSr : S.resid = (CHT.map n (IsLocalRing.residue 𝒪[E])).comp r.toMonoidHom)
    (hmult : S.HasStandardMultiplier) (v₀ : Place F)
    (hS : IsOrdinarySteinbergProblem l S {v₀})
    (h1 : (iotaOrdinary F E n ι).Holds π.toRegAlg)
    (h2 : ∀ w : Place F, w.Outside S.places → (unramifiedIrrep w.Fv n).Holds (π.component w))
    (h3 : (steinbergTwist v₀.Fv n).Holds (π.component v₀))
    (ρss : Gal F →* GL (Fin n) 𝓀[E]) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (h45 : IsANTResidual l (CHT.glRes S.resid) ρss e ρs) (h5 : CycloNotInAdKernel l ρs)
    (h6 : 3 < l ∧ ¬ l ∣ n) :
    Module.Finite Λ S.univRing := by
  sorry

/-- **`PL.7/ordinary-steinberg-finiteness`** (b). The variant used by Newton–Thorne 2026 (proof
of Proposition 3.9), which the sources read assert without proof: the same conclusion with the
condition `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}` of (5) replaced by the existence of a place `w ∤ l` of
`F` at which `ρ̄` is unramified and `H⁰(G_{F_w}, ad ρ̄(1)) = 0`, the change that Thorne 2024,
Theorem 7.5, makes to the automorphy lifting theorem. -/
theorem ordinary_steinberg_finiteness_b (ι : E →+* ℂ) (π : RACP F n) (hπ : IsRACSDC π ι)
    (r : Gal (maximalRealSubfield F) →ₜ* CHT n 𝒪[E])
    (hrπ : Conj (π.galoisRep ι : Gal F → GL (Fin n) E) (generic (CHT.glRes r.toMonoidHom)))
    (hν : ∀ σ, Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (CHT.nu n 𝒪[E] (r σ)) =
      cyclo E (maximalRealSubfield F) σ ^ (1 - (n : ℤ)) * delta F E σ ^ n)
    (S : DefProblem F E n Λ)
    (hSr : S.resid = (CHT.map n (IsLocalRing.residue 𝒪[E])).comp r.toMonoidHom)
    (hmult : S.HasStandardMultiplier) (v₀ : Place F)
    (hS : IsOrdinarySteinbergProblem l S {v₀})
    (h1 : (iotaOrdinary F E n ι).Holds π.toRegAlg)
    (h2 : ∀ w : Place F, w.Outside S.places → (unramifiedIrrep w.Fv n).Holds (π.component w))
    (h3 : (steinbergTwist v₀.Fv n).Holds (π.component v₀))
    (ρss : Gal F →* GL (Fin n) 𝓀[E]) {d : ℕ} {m : Fin d → ℕ}
    (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n) (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (h45 : IsANTResidual l (CHT.glRes S.resid) ρss e ρs)
    (h5 : HasAuxiliaryPlace l (CHT.glRes S.resid))
    (h6 : 3 < l ∧ ¬ l ∣ n) :
    Module.Finite Λ S.univRing := by
  sorry

/-! ### PL.7/residually-reducible-automorphy-lifting: Automorphy lifting for residually
reducible representations -/

/-- **`PL.7/residually-reducible-automorphy-lifting`** (Allen–Newton–Thorne, Theorem 1.1 =
Theorem 6.1). Let `F` be an imaginary CM field, `n ≥ 2` and `ρ : G_F → GL_n(E)` a continuous
semisimple representation such that (1) `ρ^c ≅ ρ^∨ ε^{1-n}`; (2) `ρ` is ramified at only finitely
many places; (3) `ρ` is ordinary of weight `λ` for a dominant `λ`; (4) `ρ̄^{ss} ≅ ⊕ ρ̄_i` with
`ρ̄_i` absolutely irreducible, `ρ̄_i^c ≅ ρ̄_i^∨ ε^{1-n}` and `ρ̄_i ≇ ρ̄_j` for `i ≠ j`; (5) there is
a place `ṽ₀ ∤ l` with `ρ|^{ss}_{G_{F_{ṽ₀}}} ≅ ⊕ ψ ε^{n-i}`, `ψ` unramified; (6) there is a RACSDC
`π` with `π` `ι`-ordinary, `r̄_ι(π)^{ss} ≅ ρ̄^{ss}` and `π_{ṽ₀}` an unramified twist of the
Steinberg representation; (7) `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}`, `F ⊄ F⁺(ζ_l)`, the `ρ̄_i|G_{F(ζ_l)}`
are absolutely irreducible and pairwise non-isomorphic, `ρ̄^{ss}` is primitive and `ρ̄^{ss}(G_F)`
has no quotient of order `l`; (8) `l > 3` and `l ∤ n`. Then `ρ ≅ r_ι(Π)` for an `ι`-ordinary
RACSDC automorphic representation `Π` of `GL_n(𝔸_F)`. -/
theorem residually_reducible_automorphy_lifting [IsLargeFor F E] (hn : 2 ≤ n)
    (ρ : Gal F →ₜ* GL (Fin n) E)
    (hss : ComplementedLattice (Subrepresentation (stdRep ρ.toMonoidHom)))
    (h1 : IsConjSelfDual ρ.toMonoidHom ((cyclo E F).toMonoidHom ^ (1 - (n : ℤ))))
    (h2 : IsRamifiedAtFinitelyMany ρ)
    (lam : (F →+* E) → Fin n → ℤ) (hlam : ∀ τ, Antitone (lam τ))
    (h3 : IsOrdinaryOfWeight l ρ lam)
    (ρbar ρss : Gal F →* GL (Fin n) 𝓀[E]) (hρbar : IsReductionOf ρbar ρ) {d : ℕ}
    {m : Fin d → ℕ} (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n)
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (h47 : IsANTResidual l ρbar ρss e ρs) (h7 : CycloNotInAdKernel l ρs)
    (v₀ : Place F) (hv₀ : ¬ v₀.Above l) (h5 : IsSteinbergTypeAt ρ v₀)
    (ι : E →+* ℂ) (π : RACP F n) (hπ : IsRACSDC π ι)
    (h6a : (iotaOrdinary F E n ι).Holds π.toRegAlg)
    (h6b : IsSemisimplificationOf (stdRep (π.residualRep ι)) (stdRep ρbar))
    (h6c : (steinbergTwist v₀.Fv n).Holds (π.component v₀))
    (h8 : 3 < l ∧ ¬ l ∣ n) :
    ∃ π' : RACP F n, IsRACSDC π' ι ∧ (iotaOrdinary F E n ι).Holds π'.toRegAlg ∧
      Conj (ρ : Gal F → GL (Fin n) E) (π'.galoisRep ι) := by
  sorry

/-- **`PL.7/residually-reducible-automorphy-lifting`**, variant (Thorne 2024, Theorem 7.5,
justified there by a one-paragraph indication): the same conclusion, for `n ≥ 1`, with the
condition `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}` of (7) replaced by the existence of a place `w ∤ l` of
`F` at which `ρ̄` is unramified and `H⁰(G_{F_w}, ad ρ̄(1)) = 0`. -/
theorem residually_reducible_automorphy_lifting_variant [IsLargeFor F E] (hn : 1 ≤ n)
    (ρ : Gal F →ₜ* GL (Fin n) E)
    (hss : ComplementedLattice (Subrepresentation (stdRep ρ.toMonoidHom)))
    (h1 : IsConjSelfDual ρ.toMonoidHom ((cyclo E F).toMonoidHom ^ (1 - (n : ℤ))))
    (h2 : IsRamifiedAtFinitelyMany ρ)
    (lam : (F →+* E) → Fin n → ℤ) (hlam : ∀ τ, Antitone (lam τ))
    (h3 : IsOrdinaryOfWeight l ρ lam)
    (ρbar ρss : Gal F →* GL (Fin n) 𝓀[E]) (hρbar : IsReductionOf ρbar ρ) {d : ℕ}
    {m : Fin d → ℕ} (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n)
    (ρs : (i : Fin d) → Gal F →* GL (Fin (m i)) 𝓀[E])
    (h47 : IsANTResidual l ρbar ρss e ρs) (h7 : HasAuxiliaryPlace l ρbar)
    (v₀ : Place F) (hv₀ : ¬ v₀.Above l) (h5 : IsSteinbergTypeAt ρ v₀)
    (ι : E →+* ℂ) (π : RACP F n) (hπ : IsRACSDC π ι)
    (h6a : (iotaOrdinary F E n ι).Holds π.toRegAlg)
    (h6b : IsSemisimplificationOf (stdRep (π.residualRep ι)) (stdRep ρbar))
    (h6c : (steinbergTwist v₀.Fv n).Holds (π.component v₀))
    (h8 : 3 < l ∧ ¬ l ∣ n) :
    ∃ π' : RACP F n, IsRACSDC π' ι ∧ (iotaOrdinary F E n ι).Holds π'.toRegAlg ∧
      Conj (ρ : Gal F → GL (Fin n) E) (π'.galoisRep ι) := by
  sorry

/-! ### PL.7/two-constituent-automorphy-lifting: Thorne's automorphy lifting for two adequate
constituents -/

/-- **`PL.7/two-constituent-automorphy-lifting`** (Thorne 2015, Theorem 7.1). Let `l > 3`, `F`
an imaginary CM field, `n ≥ 2` and `ρ : G_F → GL_n(E)` a continuous semisimple representation
such that (1) `ρ^c ≅ ρ^∨ ε^{1-n}`; (2) `ρ` is ramified at only finitely many places; (3) `ρ` is
ordinary of weight `λ` for a dominant `λ`; (4) `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}`; (5)
`ρ̄^{ss} ≅ ρ̄₁ ⊕ ρ̄₂` with `ρ̄_i|G_{F(ζ_l)}` adequate in the sense of Thorne 2012, `ρ̄^{ss}`
primitive and `l ∤ n`; (6) `ρ̄₁ ≇ ρ̄₂` and `ε^{1-n} ρ̄₁^∨ ≇ ρ̄₂^c`; (7) there is a place `ṽ₀ ∤ l`
with `ρ|^{ss}_{G_{F_{ṽ₀}}} ≅ ⊕ ψ ε^{n-i}`, `ψ` unramified; (8) there is a RACSDC `π`,
`ι`-ordinary, with `r̄_ι(π)^{ss} ≅ ρ̄^{ss}` and `π_{ṽ₀}` an unramified twist of the Steinberg
representation; (9) there are a CM extension `F₀/F`, linearly disjoint from the extension of
`F(ζ_l)` cut out by `ρ̄^{ss}|G_{F(ζ_l)}`, and `ι`-ordinary RAECSDC representations `(π_i, χ_i)` of
`GL_{n_i}(𝔸_{F₀})` with `r̄_ι(π_i) ≅ ρ̄_i|G_{F₀}`. Then `ρ` is automorphic. -/
theorem two_constituent_automorphy_lifting [IsLargeFor F E] (hl : 3 < l) (hn : 2 ≤ n)
    (ρ : Gal F →ₜ* GL (Fin n) E)
    (hss : ComplementedLattice (Subrepresentation (stdRep ρ.toMonoidHom)))
    (h1 : IsConjSelfDual ρ.toMonoidHom ((cyclo E F).toMonoidHom ^ (1 - (n : ℤ))))
    (h2 : IsRamifiedAtFinitelyMany ρ)
    (lam : (F →+* E) → Fin n → ℤ) (hlam : ∀ τ, Antitone (lam τ))
    (h3 : IsOrdinaryOfWeight l ρ lam)
    (ρbar ρss : Gal F →* GL (Fin n) 𝓀[E]) (hρbar : IsReductionOf ρbar ρ)
    (hρss : IsSemisimplificationOf (stdRep ρss) (stdRep ρbar))
    {n₁ n₂ : ℕ} (ρ₁ : Gal F →* GL (Fin n₁) 𝓀[E]) (ρ₂ : Gal F →* GL (Fin n₂) 𝓀[E])
    (hcont : IsContinuousResidual ρss ∧ IsContinuousResidual ρ₁ ∧ IsContinuousResidual ρ₂)
    (h4 : ∃ σ : Gal F,
      σ ∉ (Field.absoluteGaloisGroup.map
        (algebraMap F (CyclotomicField l F))).toMonoidHom.range ∧ IsScalarGL (ρss σ))
    (h5sum : Nonempty ((stdRep ρss).Equiv ((stdRep ρ₁).prod (stdRep ρ₂))))
    (h5a₁ : (adequate 𝓀[E] n₁).Holds
      (resFieldHom ρ₁ (algebraMap F (CyclotomicField l F))).range)
    (h5a₂ : (adequate 𝓀[E] n₂).Holds
      (resFieldHom ρ₂ (algebraMap F (CyclotomicField l F))).range)
    (h5prim : IsPrimitive ρss) (h5n : ¬ l ∣ n)
    (h6a : IsEmpty ((stdRep ρ₁).Equiv (stdRep ρ₂)))
    (h6b : ∀ c : Gal (maximalRealSubfield F), c ∉ (resCM F).range →
      ¬ IsConjTwistedDual (resCM F) c (stdRep ρ₂) (stdRep ρ₁)
        (cycloBar E F ^ (1 - (n : ℤ))))
    (v₀ : Place F) (hv₀ : ¬ v₀.Above l) (h7 : IsSteinbergTypeAt ρ v₀)
    (ι : E →+* ℂ) (π : RACP F n) (hπ : IsRACSDC π ι)
    (h8a : (iotaOrdinary F E n ι).Holds π.toRegAlg)
    (h8b : IsSemisimplificationOf (stdRep (π.residualRep ι)) (stdRep ρbar))
    (h8c : (steinbergTwist v₀.Fv n).Holds (π.component v₀))
    (F₀ : Type) [Field F₀] [NumberField F₀] [IsCMField F₀] [Algebra F F₀]
    (h9disj : IsDisjointFromCutOut l ρss (algebraMap F F₀))
    (π₁ : RACP F₀ n₁) (π₂ : RACP F₀ n₂)
    (h9ord₁ : (iotaOrdinary F₀ E n₁ ι).Holds π₁.toRegAlg)
    (h9ord₂ : (iotaOrdinary F₀ E n₂ ι).Holds π₂.toRegAlg)
    (h9res₁ : Conj (π₁.residualRep ι : Gal F₀ → GL (Fin n₁) 𝓀[E])
      (resFieldHom ρ₁ (algebraMap F F₀)))
    (h9res₂ : Conj (π₂.residualRep ι : Gal F₀ → GL (Fin n₂) 𝓀[E])
      (resFieldHom ρ₂ (algebraMap F F₀))) :
    ∃ π' : RACP F n, IsRACSDC π' ι ∧ Conj (ρ : Gal F → GL (Fin n) E) (π'.galoisRep ι) := by
  sorry

end PL7a

end TauCeti.Automorphy
namespace TauCeti.Automorphy

section NTDefinitions

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]

/-- An `𝒪[E]^×`-valued continuous character, as an `E^×`-valued one. -/
def unitsCharToField {G : Type*} [Monoid G] [TopologicalSpace G] (μ : G →ₜ* (𝒪[E])ˣ) :
    G →ₜ* Eˣ where
  toMonoidHom := (Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E)).comp μ.toMonoidHom
  continuous_toFun := by sorry

/-- The set-up of Newton–Thorne 2021 §5 (before Theorem 5.2): `F/F⁺` is everywhere unramified;
`S ⊃ S_l` is a finite set of places of `F⁺` split in `F`; `µ : G_{F⁺,S} → 𝒪^×` is a continuous
de Rham character with `µ(c_v) = -1` at every real place; `n ≥ 2`; `χ̄_1, …, χ̄_n : G_{F,S} → k^×`
are characters with `χ̄_i χ̄_i^c = µ̄|G_{F,S}`; `r̄ : G_{F⁺,S} → 𝒢_n(k)` is the extension of
`ρ̄ = ⊕ χ̄_i` with `r̄(c) = (1_n, 1)ȷ`, so that `ν ∘ r̄ = µ̄`; and `r̄|G_{F_ṽ}` is trivial for
`v ∈ S_l`. -/
structure IsNTSetup (l : ℕ) (S₀ : Set (Place F))
    (μ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ) (χ : Fin n → Gal F →* (𝓀[E])ˣ)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) : Prop where
  unramified : Algebra.FormallyUnramified (𝓞 (maximalRealSubfield F)) (𝓞 F)
  finite : S₀.Finite
  split : ∀ v ∈ S₀, v.IsSplit
  above_l : ∀ v : Place F, v.Above l → ¬ v.Outside S₀
  μ_unramified : ∀ u : Place (maximalRealSubfield F),
    (∀ v ∈ S₀, ¬ v.LiesOver (maximalRealSubfield F).subtype u) →
      IsUnramified (resFieldHom μ.toMonoidHom u.emb)
  μ_deRham : ∀ u : Place (maximalRealSubfield F), u.Above l →
    (deRham u.Fv E 1).Holds (charRep (resPlace (unitsCharToField μ) u))
  μ_odd : ∀ c : Gal (maximalRealSubfield F), orderOf c = 2 → μ c = -1
  two_le : 2 ≤ n
  χ_continuous : ∀ i, IsContinuousResidual (χ i)
  χ_unramified : ∀ i, ∀ w : Place F, w.Outside S₀ → IsUnramified (resFieldHom (χ i) w.emb)
  χ_polarized : ∀ i, ∀ (c : Gal (maximalRealSubfield F)) (σ τ : Gal F),
    c ∉ (resCM F).range → resCM F τ = c * resCM F σ * c⁻¹ →
      χ i σ * χ i τ = Units.map (IsLocalRing.residue 𝒪[E] : 𝒪[E] →* 𝓀[E]) (μ (resCM F σ))
  rbar_continuous : IsContinuousResidual rbar
  rbar_pre : CHT.pre rbar = (resCM F).range
  rbar_gl : CHT.glRes rbar = diagChar χ
  rbar_nu : ∀ σ, CHT.nu n 𝓀[E] (rbar σ) =
    Units.map (IsLocalRing.residue 𝒪[E] : 𝒪[E] →* 𝓀[E]) (μ σ)
  rbar_c : ∃ c : Gal (maximalRealSubfield F), orderOf c = 2 ∧ rbar c = CHT.j n 𝓀[E]
  rbar_trivial : ∀ v ∈ S₀, v.Above l → resFieldHom (CHT.glRes rbar) v.emb = 1

/-- Hypotheses (1)–(3) of Newton–Thorne 2021, Theorem 5.2: `l > 2n`; for `i < j` the character
`χ̄_i/χ̄_j|G_{F(ζ_l)}` has order greater than `2n` (so `r̄` is Schur); `[F(ζ_l) : F] = l - 1`. -/
def NTConditions (l : ℕ) (χ : Fin n → Gal F →* (𝓀[E])ˣ) : Prop :=
  2 * n < l ∧
  (∀ i j, i < j → ∀ N : ℕ, 0 < N → N ≤ 2 * n →
    resFieldHom (χ i / χ j) (algebraMap F (CyclotomicField l F)) ^ N ≠ 1) ∧
  Module.finrank F (CyclotomicField l F) = l - 1

/-- The problem `𝒮_Σ = (F/F⁺, S ∪ Σ, S̃ ∪ Σ̃, Λ, r̄, µ, {R^△_v}_{S_l} ∪ {R^□_v}_{S - S_l} ∪
{R^{St}_v}_Σ)` of Newton–Thorne 2021 §5, for a finite set `Σ` of places split in `F` and disjoint
from `S` with `q_v ≡ 1 mod l` and `r̄|G_{F_ṽ}` trivial for `v ∈ Σ`, and
`Λ = ⊗̂_{v ∈ S_l} 𝒪⟦I^{ab}_{F_ṽ}(l)^n⟧`. -/
structure IsNTProblem (l : ℕ) (S₀ : Set (Place F))
    (μ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) (S : DefProblem F E n Λ)
    (St : Set (Place F)) : Prop where
  resid_eq : S.resid = rbar
  places_eq : S.places = S₀ ∪ St
  finite : St.Finite
  disjoint : ∀ v ∈ St, v.Outside S₀
  multiplier_eq : S.multiplier = μ.toMonoidHom
  problem : IsOrdinarySteinbergProblem l S St

/-- The ideal `(ϖ) = λ R^univ_𝒮`. -/
def DefProblem.specialIdeal (S : DefProblem F E n Λ) : Ideal S.univRing :=
  (IsLocalRing.maximalIdeal 𝒪[E]).map ((algebraMap Λ S.univRing).comp (algebraMap 𝒪[E] Λ))

/-- A representation of the Galois group of a local field has a non-trivial unramified
subquotient. -/
def HasUnramifiedSubquotient {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {κ : Type*} [Field κ] {m : ℕ} (ρ : Gal K →* GL (Fin m) κ) :
    Prop :=
  ∃ W₁ W₂ : Subrepresentation (stdRep ρ), W₂ < W₁ ∧ ∀ σ ∈ inertia K, subquotRep W₁ W₂ σ = 1

/-- The data of Newton–Thorne 2021 §1.17 at a place `v ∈ R` with completion `K`: the residue
characteristic is odd, `1 ≤ n_ṽ ≤ n`, `q_ṽ mod l` is a primitive `n_ṽ`-th root of unity, and
`r̄|G_K = σ̄_1 ⊕ σ̄_2` where `σ̄_1` is induced from an unramified character of the Galois group of
the unramified extension of `K` of degree `n_ṽ` and `σ̄_2` is the twist of an unramified
representation of dimension `n - n_ṽ` by a ramified quadratic character. -/
structure IsLevelRaisingPlace (l : ℕ) {K : Type} [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] {κ : Type} [Field κ]
    (ρbar : Gal K →* GL (Fin n) κ) (nv : ℕ) : Prop where
  odd : ∃ p : ℕ, p.Prime ∧ Odd p ∧ (p : K) <ᵥ 1
  nv_pos : 1 ≤ nv
  nv_le : nv ≤ n
  order : orderOf ((Nat.card 𝓀[K] : ℕ) : ZMod l) = nv
  decomposition : ∃ (K' : Type) (_ : Field K') (_ : ValuativeRel K') (_ : TopologicalSpace K')
    (_ : IsNonarchimedeanLocalField K') (f : K →+* K') (ψ : Gal K' →* κˣ)
    (σ₁ : Gal K →* GL (Fin nv) κ) (σ₂ τ : Gal K →* GL (Fin (n - nv)) κ) (η : Gal K →* κˣ),
    (letI := f.toAlgebra; Module.finrank K K' = nv) ∧ Nat.card 𝓀[K'] = Nat.card 𝓀[K] ^ nv ∧
    IsUnramified ψ ∧
    Nonempty ((stdRep σ₁).Equiv
      (Representation.ind (Field.absoluteGaloisGroup.map f).toMonoidHom
        (stdRep (diagChar fun _ : Fin 1 => ψ)))) ∧
    IsUnramified τ ∧ η ^ 2 = 1 ∧ ¬ IsUnramified η ∧
    (∀ g, (σ₂ g : Matrix (Fin (n - nv)) (Fin (n - nv)) κ) =
      ((η g : κˣ) : κ) • (τ g : Matrix (Fin (n - nv)) (Fin (n - nv)) κ)) ∧
    Nonempty ((stdRep ρbar).Equiv ((stdRep σ₁).prod (stdRep σ₂)))

/-- The problem `𝒮 = (F/F⁺, S, S̃, Λ, r̄, µ, {R^△_v}_{S_l} ∪ {R(ṽ, Θ_ṽ, n)}_{v ∈ R} ∪
{R^□_v}_{S - (S_l ∪ R)})` of Newton–Thorne 2021 §5 (before Theorem 5.7), with the data of §1.17
at the places of `R ⊂ S - S_l` and characters `Θ_ṽ` of order `l`. -/
structure IsNTLevelRaisingProblem (l : ℕ) (S₀ : Set (Place F))
    (μ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) (S : DefProblem F E n Λ)
    (R : Set (Place F)) (nv : Place F → ℕ) (Θ : (v : Place F) → inertia v.Fv →* (𝒪[E])ˣ) :
    Prop where
  resid_eq : S.resid = rbar
  places_eq : S.places = S₀
  multiplier_eq : S.multiplier = μ.toMonoidHom
  ordinaryCoefficients : (ordinaryCoefficients F E n Λ l).Holds S
  subset : R ⊆ S₀
  not_above : ∀ v ∈ R, ¬ v.Above l
  data : ∀ v ∈ R, IsLevelRaisingPlace l (resFieldHom (CHT.glRes rbar) v.emb) (nv v) ∧
    orderOf (Θ v) = l
  at_l : ∀ v ∈ S.placesAbove l, S.localCondition v = LocalCondition.ordinary
  at_R : ∀ v ∈ R, S.localCondition v = LocalCondition.levelRaising (nv v) (Θ v)
  elsewhere : ∀ v ∈ S₀, ¬ v.Above l → v ∉ R →
    S.localCondition v = LocalCondition.unrestricted

end NTDefinitions

section PL7b

variable {F : Type} [Field F] [NumberField F] [IsCMField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {Λ : Type} [CommRing Λ] [Algebra 𝒪[E] Λ]
variable {l : ℕ} [Fact l.Prime] [ResChar E l]

/-! ### PL.7/sum-of-characters-finiteness: Finiteness of ordinary deformation rings of sums of
characters -/

/-- **`PL.7/sum-of-characters-finiteness`** (Newton–Thorne 2021, Theorem 5.2). In the set-up of
Newton–Thorne 2021 §5 (the prime is called `p` there), let `Σ` be a finite set of places of `F⁺`,
split in `F` and disjoint from `S`, with `q_v ≡ 1 mod l` and `r̄|G_{F_ṽ}` trivial for `v ∈ Σ`.
Assume (1) `l > 2n`; (2) `χ̄_i/χ̄_j|G_{F(ζ_l)}` has order greater than `2n` for `i < j`; (3)
`[F(ζ_l) : F] = l - 1`; (4) `Σ ≠ ∅`. Then `R_{𝒮_Σ}` is a finite `Λ`-algebra. -/
theorem sum_of_characters_finiteness (S₀ : Set (Place F))
    (μ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ) (χ : Fin n → Gal F →* (𝓀[E])ˣ)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) (hsetup : IsNTSetup l S₀ μ χ rbar)
    (S : DefProblem F E n Λ) (St : Set (Place F)) (hS : IsNTProblem l S₀ μ rbar S St)
    (h123 : NTConditions l χ) (h4 : St.Nonempty) :
    Module.Finite Λ S.univRing := by
  sorry

/-! ### PL.7/ordinary-lifts-every-weight: Ordinary lifts of every weight -/

/-- **`PL.7/ordinary-lifts-every-weight`** (Newton–Thorne 2021, Corollary 5.4, with two
corrections: the lift is a representation of `G_{F⁺,S ∪ Σ}`, and `µ` must have Hodge–Tate weight
`n - 1`). Under the hypotheses of `sum_of_characters_finiteness`, assume that `µ ε^{n-1}` has
finite order, let `λ` be a dominant weight with `λ_{τc,i} = -λ_{τ,n+1-i}`, and suppose
`[F_ṽ : ℚ_l] > n(n-1)/2 + 1` for `v ∈ S_l`. Then there is a lifting `r` of `r̄` of type `𝒮_Σ`
with values in the ring of integers of a finite extension `E'` of `E` (so `ν ∘ r = µ`, and `r` is
of Steinberg type at `Σ` and unramified outside `S ∪ Σ`) such that `r|G_F` is ordinary of weight
`λ`. -/
theorem ordinary_lifts_every_weight [IsLargeFor F E] (S₀ : Set (Place F))
    (μ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ) (χ : Fin n → Gal F →* (𝓀[E])ˣ)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) (hsetup : IsNTSetup l S₀ μ χ rbar)
    (S : DefProblem F E n Λ) (St : Set (Place F)) (hS : IsNTProblem l S₀ μ rbar S St)
    (h123 : NTConditions l χ) (h4 : St.Nonempty)
    (hμ : ∃ N : ℕ, 0 < N ∧ ∀ σ,
      (unitsCharToField μ σ * cyclo E (maximalRealSubfield F) σ ^ ((n : ℤ) - 1)) ^ N = 1)
    (lam : (F →+* E) → Fin n → ℤ) (hdom : ∀ τ, Antitone (lam τ))
    (hlam : ∀ (τ : F →+* E) (i : Fin n),
      lam (τ.comp (IsCMField.complexConj F).toAlgHom.toRingHom) i = -lam τ (Fin.rev i))
    (hdeg : ∀ v ∈ S₀, v.Above l → n * (n - 1) / 2 + 1 < v.localDegree) :
    ∃ (E' : Type) (_ : Field E') (_ : ValuativeRel E') (_ : TopologicalSpace E')
      (_ : IsNonarchimedeanLocalField E') (j : E →+* E') (g : S.univRing →+* 𝒪[E'])
      (ρ : Gal F →ₜ* GL (Fin n) E') (lam' : (F →+* E') → Fin n → ℤ),
      (∀ a : 𝒪[E], ((g (algebraMap Λ S.univRing (algebraMap 𝒪[E] Λ a)) : 𝒪[E']) : E') =
        j (a : E)) ∧
      (∀ σ, ρ σ = Matrix.GeneralLinearGroup.map (algebraMap 𝒪[E'] E')
        (CHT.glRes (S.liftAt g) σ)) ∧
      (∀ τ : F →+* E, lam' (j.comp τ) = lam τ) ∧ IsOrdinaryOfWeight l ρ lam' := by
  sorry

/-! ### PL.7/unrestricted-ring-dimension-bound: A dimension bound for the ring without
Steinberg conditions -/

/-- **`PL.7/unrestricted-ring-dimension-bound`** (Newton–Thorne 2021, Corollary 5.5). Under
hypotheses (1)–(3) of `sum_of_characters_finiteness`, let `v₀ ∉ S` be split in `F` with
`q_{v₀} ≡ 1 mod l` and `r̄|G_{F_{ṽ₀}}` trivial. Then
`A = R_{𝒮_∅}/(ϖ, {tr r_{𝒮_∅}(Frob^i_{ṽ₀}) - n}_{i = 1, …, n})` is a finite `Λ`-algebra, and
`dim R_{𝒮_∅}/(ϖ) ≤ n[F⁺ : ℚ] + n`. -/
theorem unrestricted_ring_dimension_bound (S₀ : Set (Place F))
    (μ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ) (χ : Fin n → Gal F →* (𝓀[E])ˣ)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) (hsetup : IsNTSetup l S₀ μ χ rbar)
    (S : DefProblem F E n Λ) (hS : IsNTProblem l S₀ μ rbar S ∅) (h123 : NTConditions l χ)
    (v₀ : Place F) (hv₀ : v₀.Outside S₀) (hsplit : v₀.IsSplit)
    (hq : (v₀.norm : ZMod l) = 1) (htriv : resFieldHom (CHT.glRes rbar) v₀.emb = 1) :
    Module.Finite Λ (S.univRing ⧸ (S.specialIdeal ⊔ Ideal.span {x | ∃ i : Fin n,
      x = Matrix.trace (CHT.glRes S.univLift (v₀.frob ^ ((i : ℕ) + 1)) :
        Matrix (Fin n) (Fin n) S.univRing) - n})) ∧
    ringKrullDim (S.univRing ⧸ S.specialIdeal) ≤
      ((n * Module.finrank ℚ (maximalRealSubfield F) + n : ℕ) : WithBot ℕ∞) := by
  sorry

/-! ### PL.7/reducible-locus-small: The reducible locus is small -/

/-- **`PL.7/reducible-locus-small`** (Newton–Thorne 2021, Proposition 5.6). In the set-up of
Newton–Thorne 2021 §5 with `𝒮 = 𝒮_∅`, let `R_𝒮/(ϖ) → A` be a surjection onto a domain over which
the universal deformation is `r = r₁ ⊕ r₂` with `r_i : G_{F⁺,S} → 𝒢_{n_i}(A)`,
`ν ∘ r_i = ν ∘ r`, and let `R ⊂ S - S_l` be a set of places with the data of §1.17 and characters
`Θ_ṽ` of order `l`. If (1) `l > 2n`, (2) `χ̄_i/χ̄_j|G_{F(ζ_l)}` has order greater than `2n`, (3)
`[F_ṽ : ℚ_l] > n(n-1)/2 + 1` for `v ∈ S_l`, (4) `[F(ζ_l) : F] = l - 1`, and (5) for `v ∈ R` both
`r̄₁|G_{F_ṽ}` and `r̄₂|G_{F_ṽ}` have a non-trivial unramified subquotient and `R^□_v → A` factors
through `R(ṽ, Θ_ṽ, n)`, then `dim A ≤ n[F⁺ : ℚ] + n - d_R`, with `d_R` the `ℤ_l`-rank of the
subgroup of `Δ = Gal(L_{S_l}/F)/(c + 1)` generated by the `Frob_ṽ`, `v ∈ R`. -/
theorem reducible_locus_small (S₀ : Set (Place F))
    (μ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ) (χ : Fin n → Gal F →* (𝓀[E])ˣ)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) (hsetup : IsNTSetup l S₀ μ χ rbar)
    (S : DefProblem F E n Λ) (hS : IsNTProblem l S₀ μ rbar S ∅)
    (A : Type) [CommRing A] [IsDomain A] [IsLocalRing A] [Algebra Λ A] (hA : IsCNL Λ A)
    (f : S.univRing →ₐ[Λ] A) (hf : Function.Surjective f) (hϖ : S.specialIdeal ≤ RingHom.ker f)
    {n₁ n₂ : ℕ} (h : n₁ + n₂ = n) (r₁ : Gal (maximalRealSubfield F) →* CHT n₁ A)
    (r₂ : Gal (maximalRealSubfield F) →* CHT n₂ A)
    (hsum : S.liftOf f = CHT.directSum h r₁ r₂)
    (hν₁ : (CHT.nu n₁ A).comp r₁ = (CHT.nu n A).comp (S.liftOf f))
    (hν₂ : (CHT.nu n₂ A).comp r₂ = (CHT.nu n A).comp (S.liftOf f))
    (R : Set (Place F)) (hR : R ⊆ S₀) (hRl : ∀ v ∈ R, ¬ v.Above l) (nv : Place F → ℕ)
    (Θ : (v : Place F) → inertia v.Fv →* (𝒪[E])ˣ)
    (hdata : ∀ v ∈ R, IsLevelRaisingPlace l (resFieldHom (CHT.glRes rbar) v.emb) (nv v) ∧
      orderOf (Θ v) = l)
    (h124 : NTConditions l χ)
    (h3 : ∀ v ∈ S₀, v.Above l → n * (n - 1) / 2 + 1 < v.localDegree)
    (h5 : ∀ v ∈ R,
      HasUnramifiedSubquotient (resFieldHom
        (CHT.glRes ((CHT.map n₁ (IsLocalRing.residue A)).comp r₁)) v.emb) ∧
      HasUnramifiedSubquotient (resFieldHom
        (CHT.glRes ((CHT.map n₂ (IsLocalRing.residue A)).comp r₂)) v.emb) ∧
      ((LocalCondition.levelRaising (nv v) (Θ v) : LocalCondition v.Fv E n).lifts A).Holds
        (resFieldHom (CHT.glRes (S.liftOf f)) v.emb)) :
    ringKrullDim A + (frobRank F E l R : WithBot ℕ∞) ≤
      ((n * Module.finrank ℚ (maximalRealSubfield F) + n : ℕ) : WithBot ℕ∞) := by
  sorry

/-! ### PL.7/generic-primes-large-quotients: Generic primes in large quotients -/

/-- **`PL.7/generic-primes-large-quotients`** (Newton–Thorne 2021, Theorem 5.7). In the set-up
of Newton–Thorne 2021 §5 with `2 ≤ n < l/2`, `[F(ζ_l) : F] = l - 1`, `χ̄_i/χ̄_j|G_{F(ζ_l)}` of
order greater than `2n`, `[F_ṽ : ℚ_l] > n(n-1)/2 + 1` for `v ∈ S_l`, and `R = R₁ ⊔ R₂ ⊂ S - S_l`
with the data of §1.17, let `𝒮` be the problem with `R^△_v` at `S_l`, `R(ṽ, Θ_ṽ, n)` at `R` and
`R^□_v` elsewhere, and `R_𝒮 → B` a surjection in `C_Λ` with `B` finite over `Λ/(ϖ)`. If (1) every
irreducible component of `Spec B` has dimension greater than
`sup({n[F⁺ : ℚ] + n - d_{R_i}}_{i = 1, 2}, {n[F⁺ : ℚ] - [F_ṽ : ℚ_l]}_{v ∈ S_l})` and (2) for
every decomposition `r̄ = r̄₁ ⊕ r̄₂` with `n₁ n₂ ≠ 0` there is `i ∈ {1, 2}` such that for every
`v ∈ R_i` both `r̄₁|G_{F_ṽ}` and `r̄₂|G_{F_ṽ}` have a non-trivial unramified subquotient, then
there is a generic prime `𝔭 ⊂ R_𝒮` of dimension one and characteristic `l` containing
`ker(R_𝒮 → B)`. -/
theorem generic_primes_large_quotients (S₀ : Set (Place F))
    (μ : Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ) (χ : Fin n → Gal F →* (𝓀[E])ˣ)
    (rbar : Gal (maximalRealSubfield F) →* CHT n 𝓀[E]) (hsetup : IsNTSetup l S₀ μ χ rbar)
    (h124 : NTConditions l χ)
    (hdeg : ∀ v ∈ S₀, v.Above l → n * (n - 1) / 2 + 1 < v.localDegree)
    (R₁ R₂ : Set (Place F)) (hR : Disjoint R₁ R₂) (nv : Place F → ℕ)
    (Θ : (v : Place F) → inertia v.Fv →* (𝒪[E])ˣ) (S : DefProblem F E n Λ)
    (hS : IsNTLevelRaisingProblem l S₀ μ rbar S (R₁ ∪ R₂) nv Θ)
    (B : Type) [CommRing B] [Algebra Λ B] (hB : IsCNL Λ B) (hfin : Module.Finite Λ B)
    (f : S.univRing →ₐ[Λ] B) (hf : Function.Surjective f) (hϖ : S.specialIdeal ≤ RingHom.ker f)
    (h1 : ∀ 𝔮 ∈ minimalPrimes B,
      ((n * Module.finrank ℚ (maximalRealSubfield F) + n : ℕ) : WithBot ℕ∞) <
        ringKrullDim (B ⧸ 𝔮) + (frobRank F E l R₁ : WithBot ℕ∞) ∧
      ((n * Module.finrank ℚ (maximalRealSubfield F) + n : ℕ) : WithBot ℕ∞) <
        ringKrullDim (B ⧸ 𝔮) + (frobRank F E l R₂ : WithBot ℕ∞) ∧
      ∀ v ∈ S.placesAbove l,
        ((n * Module.finrank ℚ (maximalRealSubfield F) : ℕ) : WithBot ℕ∞) <
          ringKrullDim (B ⧸ 𝔮) + (v.localDegree : WithBot ℕ∞))
    (h2 : ∀ (n₁ n₂ : ℕ) (h : n₁ + n₂ = n) (r₁ : Gal (maximalRealSubfield F) →* CHT n₁ 𝓀[E])
      (r₂ : Gal (maximalRealSubfield F) →* CHT n₂ 𝓀[E]), 0 < n₁ → 0 < n₂ →
      rbar = CHT.directSum h r₁ r₂ →
      (∀ v ∈ R₁, HasUnramifiedSubquotient (resFieldHom (CHT.glRes r₁) v.emb) ∧
        HasUnramifiedSubquotient (resFieldHom (CHT.glRes r₂) v.emb)) ∨
      (∀ v ∈ R₂, HasUnramifiedSubquotient (resFieldHom (CHT.glRes r₁) v.emb) ∧
        HasUnramifiedSubquotient (resFieldHom (CHT.glRes r₂) v.emb))) :
    ∃ 𝔭 : Ideal S.univRing, RingHom.ker f ≤ 𝔭 ∧ IsGenericPrime l S 𝔭 := by
  sorry

end PL7b

end TauCeti.Automorphy
namespace TauCeti.Automorphy

section PL7c

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ} {l : ℕ} [Fact l.Prime] [ResChar E l]

/-! ### PL.7/global-lifts-schur: Global lifts with prescribed local components (Bellovin–Gee,
Schur form) -/

/-- **`PL.7/global-lifts-schur`** (Bellovin–Gee, Corollary 5.1.1, with absolute irreducibility
of `r̄|G_{F₀(ζ_l)}` replaced by the Schur property over `F₀⁺(ζ_l)`, as in Newton–Thorne 2021,
proof of Proposition 5.8). Let `l > 2`, `F₀` an imaginary CM field with `F₀ ⊄ F₀⁺(ζ_l)`, `S₀` a
finite set of finite places of `F₀⁺` containing those above `l`, and
`r̄ : G_{F₀⁺,S₀} → 𝒢_n(k)` continuous with `r̄⁻¹(𝒢_n⁰(k)) = G_{F₀,S₀}` and
`ν ∘ r̄ = ε̄^{1-n} δ̄^n_{F₀/F₀⁺}`, such that `r̄|G_{F₀⁺(ζ_l)}` is Schur. For each `v ∈ S₀` let
`R̄_v` be a quotient of the `µ`-polarised framed deformation ring of `r̄|G_{F₀⁺,v}`,
`µ = ε^{1-n} δ^n_{F₀/F₀⁺}`, cut out by a non-empty union of irreducible components of the generic
fibre of the ring of a fixed inertial type and, if `v | l`, a fixed regular Hodge type. Then
`H⁰(G_{F₀⁺,S₀}, ad r̄) = 0`, so that the functor of `µ`-polarised deformations of `r̄` unramified
outside `S₀` whose restriction at each `v ∈ S₀` factors through `R̄_v` is representable, and the
representing ring `R^univ` has Krull dimension at least `1`. -/
theorem global_lifts_schur {F₀ : Type} [Field F₀] [NumberField F₀] [IsCMField F₀] (hl : 2 < l)
    (hζ : IsEmpty
      (F₀ →ₐ[maximalRealSubfield F₀] CyclotomicField l (maximalRealSubfield F₀)))
    (S₀ : Set (Place (maximalRealSubfield F₀))) (hS₀ : S₀.Finite)
    (hS₀l : ∀ u : Place (maximalRealSubfield F₀), u.Above l → ∃ v ∈ S₀, u.Same v)
    (rbar : Gal (maximalRealSubfield F₀) →* CHT n 𝓀[E]) (hcont : IsContinuousResidual rbar)
    (hunr : ∀ u : Place (maximalRealSubfield F₀), (∀ v ∈ S₀, ¬ u.Same v) →
      IsUnramified (resFieldHom rbar u.emb))
    (hpre : CHT.pre rbar = (resCM F₀).range) (hν : HasStandardResidualMultiplier rbar)
    (hSchur : IsSchur (resFieldHom rbar (algebraMap (maximalRealSubfield F₀)
      (CyclotomicField l (maximalRealSubfield F₀)))))
    (Rbar : (u : Place (maximalRealSubfield F₀)) →
      PolarizedLocalQuotient u.Fv E (resFieldHom rbar u.emb))
    (hRbar : ∀ u ∈ S₀, (fixedTypeComponents u.Fv E (resFieldHom rbar u.emb)).Holds (Rbar u)) :
    (∀ X : Matrix (Fin n) (Fin n) 𝓀[E], (∀ γ, CHT.ad n 𝓀[E] (rbar γ) X = X) → X = 0) ∧
    1 ≤ ringKrullDim (polarizedGlobalRing E rbar S₀ Rbar) := by
  sorry

open Classical in
/-- **`PL.7/global-lifts-schur`**, the local dimensions: a quotient `R̄_v` as in
`global_lifts_schur` has dimension `1 + n²` if `v ∤ l` and
`1 + n² + n(n-1)[F⁺_{0,v} : ℚ_l]/2` if `v | l` (Bellovin–Gee, Theorem 3.3.3). -/
theorem global_lifts_schur_local_dim {F₀ : Type} [Field F₀] [NumberField F₀] [IsCMField F₀]
    (hl : 2 < l) (rbar : Gal (maximalRealSubfield F₀) →* CHT n 𝓀[E])
    (hcont : IsContinuousResidual rbar) (hpre : CHT.pre rbar = (resCM F₀).range)
    (hν : HasStandardResidualMultiplier rbar) (u : Place (maximalRealSubfield F₀))
    (R : PolarizedLocalQuotient u.Fv E (resFieldHom rbar u.emb))
    (hR : (fixedTypeComponents u.Fv E (resFieldHom rbar u.emb)).Holds R) :
    ringKrullDim R.ring =
      ((1 + n ^ 2 + (if u.Above l then n * (n - 1) / 2 * u.localDegree else 0) : ℕ) :
        WithBot ℕ∞) := by
  sorry

/-! ### PL.7/prescribed-type-lifts: Automorphic lifts of prescribed type from residual
automorphy over a soluble extension -/

/-- **`PL.7/prescribed-type-lifts`** (Newton–Thorne 2021, Proposition 5.8, modelled on
Bellovin–Gee, Theorem 5.2.1). Let `F₀` be an imaginary CM field with `F₀/F₀⁺` everywhere
unramified, `S₀` a finite set of finite places of `F₀⁺` containing the `l`-adic places, each of
which splits in `F₀`, `n ≥ 2`, and `ρ̄ = ⊕ ρ̄_i : G_{F₀,S₀} → GL_n(k)` with the `ρ̄_i` absolutely
irreducible, `ρ̄_i^c ≅ ρ̄_i^∨ ⊗ ε^{1-n}` and pairwise non-isomorphic. Fix disjoint `T₀, Σ₀ ⊂ S₀`
of places prime to `l` and split in `F₀`, with `q_ṽ ≡ 1 mod l` and `ρ̄|G_{F_{0,ṽ}}` trivial for
`v ∈ Σ₀`; for `v ∈ T₀` a non-empty union `R̄_v` of irreducible components of
`Spec R^□_v[1/l]`; assume `ρ̄(I_{F_{0,ṽ}})` has order prime to `l` for `v ∈ S₀` inert in `F₀`;
and fix a dominant `λ` with `λ_{τc,i} = -λ_{τ,n+1-i}` such that `ρ̄|G_{F_{0,ṽ}}` has a lift which
is ordinary of weight `λ_ṽ` for every `v | l`. Suppose there is a soluble CM extension `F/F₀`
with (1) `l > max(n, 3)`, and `[F_v : ℚ_l] > n(n-1)/2 + 1` and `ρ̄|G_{F_v}` trivial for `v | l`;
(2) `F(ζ_l) ⊄ F̄^{ker ad ρ̄}`, `F ⊄ F⁺(ζ_l)`, the `ρ̄_i|G_{F(ζ_l)}` absolutely irreducible and
pairwise non-isomorphic, `ρ̄|G_F` primitive and `ρ̄(G_F)` without quotient of order `l`; (3) a
RACSDC `π` of `GL_n(𝔸_F)`, `ι`-ordinary, with `r̄_{π,ι} ≅ ρ̄|G_F` and `π_v` an unramified twist of
the Steinberg representation at some place `v` of `F` above `Σ₀`; (4) every place of `F⁺` above
`S₀` splits in `F`. Then there is a RACSDC `π₀` of `GL_n(𝔸_{F₀})` with (1) `π₀` unramified
outside `S₀` and `r̄_{π₀,ι} ≅ ρ̄`; (2) `π₀` `ι`-ordinary of weight `ιλ`; (3)
`r_{π₀,ι}|G_{F_{0,ṽ}}` a point of `R̄_v` for `v ∈ T₀`; (4) `π_{0,ṽ}` an unramified twist of the
Steinberg representation for `v ∈ Σ₀`; (5) for `v ∈ S₀` inert in `F₀`, reduction maps
`r_{π₀,ι}(I_{F_{0,ṽ}})` isomorphically onto its image. Split places of `S₀` prime to `l` outside
`T₀ ∪ Σ₀` receive no local condition. -/
theorem prescribed_type_lifts {F₀ : Type} [Field F₀] [NumberField F₀] [IsCMField F₀]
    [IsLargeFor F₀ E] (hn : 2 ≤ n)
    (hunr : Algebra.FormallyUnramified (𝓞 (maximalRealSubfield F₀)) (𝓞 F₀))
    (S₀ : Set (Place F₀)) (hS₀ : S₀.Finite)
    (hS₀l : ∀ v : Place F₀, v.Above l → ¬ v.Outside S₀)
    (hsplit_l : ∀ v ∈ S₀, v.Above l → v.IsSplit)
    (ρbar : Gal F₀ →* GL (Fin n) 𝓀[E]) (hcont : IsContinuousResidual ρbar)
    (hρunr : ∀ w : Place F₀, w.Outside S₀ → IsUnramified (resFieldHom ρbar w.emb))
    {d : ℕ} {m : Fin d → ℕ} (e : (Σ i : Fin d, Fin (m i)) ≃ Fin n)
    (ρs : (i : Fin d) → Gal F₀ →* GL (Fin (m i)) 𝓀[E])
    (hsum : ∀ σ, ρbar σ = blockSum e (fun i => ρs i) σ)
    (hρs : ∀ i, IsContinuousResidual (ρs i)) (hirr : ∀ i, IsAbsIrred (ρs i))
    (hdual : ∀ i, IsConjSelfDual (ρs i) (cycloBar E F₀ ^ (1 - (n : ℤ))))
    (hniso : ∀ i j, i ≠ j → IsEmpty ((stdRep (ρs i)).Equiv (stdRep (ρs j))))
    (T₀ St₀ : Set (Place F₀)) (hT₀ : T₀ ⊆ S₀) (hSt₀ : St₀ ⊆ S₀) (hdisj : Disjoint T₀ St₀)
    (hprime : ∀ v ∈ T₀ ∪ St₀, ¬ v.Above l ∧ v.IsSplit)
    (hSt : ∀ v ∈ St₀, (v.norm : ZMod l) = 1 ∧ resFieldHom ρbar v.emb = 1)
    (C : (v : Place F₀) → Finset (Ideal (LiftingRing v.Fv E (resFieldHom ρbar v.emb))))
    (hC : ∀ v ∈ T₀, (C v).Nonempty ∧ ∀ q ∈ C v,
      q ∈ minimalPrimes (LiftingRing v.Fv E (resFieldHom ρbar v.emb)) ∧
        (l : LiftingRing v.Fv E (resFieldHom ρbar v.emb)) ∉ q)
    (hinert : ∀ v ∈ S₀, ¬ v.IsSplit →
      (Nat.card ((inertia v.Fv).map (resFieldHom ρbar v.emb))).Coprime l)
    (lam : (F₀ →+* E) → Fin n → ℤ) (hdom : ∀ τ, Antitone (lam τ))
    (hlam : ∀ (τ : F₀ →+* E) (i : Fin n),
      lam (τ.comp (IsCMField.complexConj F₀).toAlgHom.toRingHom) i = -lam τ (Fin.rev i))
    (hlift : ∀ v ∈ S₀, v.Above l → ∃ ρv : Gal v.Fv →ₜ* GL (Fin n) 𝒪[E],
      reduction ρv.toMonoidHom = resFieldHom ρbar v.emb ∧
        IsOrdinaryOfWeightAt (genericC ρv) (fun τ => lam (τ.comp v.emb)))
    (F : Type) [Field F] [NumberField F] [IsCMField F] [Algebra F₀ F] [IsGalois F₀ F]
    (hsol : Group.IsSolvable (F ≃ₐ[F₀] F))
    (h1 : max n 3 < l)
    (h1' : ∀ v : Place F, v.Above l → n * (n - 1) / 2 + 1 < v.localDegree ∧
      resFieldHom (resFieldHom ρbar (algebraMap F₀ F)) v.emb = 1)
    (h2 : IsANTResidual l (resFieldHom ρbar (algebraMap F₀ F))
      (resFieldHom ρbar (algebraMap F₀ F)) e (fun i => resFieldHom (ρs i) (algebraMap F₀ F)))
    (h2' : CycloNotInAdKernel l (fun i => resFieldHom (ρs i) (algebraMap F₀ F)))
    (ι : E →+* ℂ) (π : RACP F n) (hπ : IsRACSDC π ι)
    (h3a : Conj (π.residualRep ι : Gal F → GL (Fin n) 𝓀[E])
      (resFieldHom ρbar (algebraMap F₀ F)))
    (h3b : (iotaOrdinary F E n ι).Holds π.toRegAlg)
    (h3c : ∃ w : Place F, (∃ v ∈ St₀, w.LiesOver (algebraMap F₀ F) v) ∧
      (steinbergTwist w.Fv n).Holds (π.component w))
    (h4 : ∀ w : Place F, (∃ v ∈ S₀, w.LiesOver (algebraMap F₀ F) v ∨
      w.LiesOver (algebraMap F₀ F) v.conj) → w.IsSplit) :
    ∃ π₀ : RACP F₀ n, IsRACSDC π₀ ι ∧
      (∀ w : Place F₀, w.Outside S₀ → (unramifiedIrrep w.Fv n).Holds (π₀.component w)) ∧
      Conj (π₀.residualRep ι : Gal F₀ → GL (Fin n) 𝓀[E]) ρbar ∧
      (iotaOrdinary F₀ E n ι).Holds π₀.toRegAlg ∧ π₀.HasWeight ι lam ∧
      (∃ ρ₀ : Gal F₀ →ₜ* GL (Fin n) 𝒪[E],
        Conj (π₀.galoisRep ι : Gal F₀ → GL (Fin n) E) (generic ρ₀.toMonoidHom) ∧
        reduction ρ₀.toMonoidHom = ρbar ∧
        (∀ v ∈ T₀, ∃ (h : reduction (resPlace ρ₀ v).toMonoidHom = resFieldHom ρbar v.emb)
          (q : Ideal (LiftingRing v.Fv E (resFieldHom ρbar v.emb))),
          q ∈ C v ∧ q ≤ Lift.prime ⟨resPlace ρ₀ v, h⟩) ∧
        ∀ v ∈ S₀, ¬ v.IsSplit → ∀ σ ∈ inertia v.Fv,
          reduction ρ₀.toMonoidHom (v.dec σ) = 1 → ρ₀ (v.dec σ) = 1) ∧
      ∀ v ∈ St₀, (steinbergTwist v.Fv n).Holds (π₀.component v) := by
  sorry

end PL7c

end TauCeti.Automorphy

namespace TauCeti.Automorphy

/-! ## PL.8: adjoint Bloch–Kato Selmer groups and semistable pseudodeformation rings

Conventions of this layer. `F` is a number field; in the conjugate self-dual statements it is a CM
field with maximal totally real subfield `F⁺ = maximalRealSubfield F`. A representation of
`G_{F,S}` is a representation of `G_F` unramified at the finite places outside `S`
(`IsUnramifiedOutside`), and `H¹(G_{F,S}, V)` is the submodule `H1UnramifiedOutside S` of
`H¹(G_F, V)`. The prime `p` is the residue characteristic `residueChar E` of the coefficient field
`E`, which has characteristic zero. A finite set of finite places is a set of completions closed
under isomorphism and meeting finitely many places (`IsFinitePlaceSet`). -/

/-! #### Imported interfaces used by PL.8 -/

section PL8Imported

/-- ArithmeticGaloisRepresentations R01.2/weil-deligne-representation (stand-in): the Weil group
`W_K` of a local field, with the topology in which the inertia subgroup is open. -/
def weilGroup (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Type := sorry

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

instance : Group (weilGroup K) := sorry

instance : TopologicalSpace (weilGroup K) := sorry

/-- ArithmeticGaloisRepresentations R01.2/weil-deligne-representation (stand-in): the norm
character `‖·‖ : W_K → ℚ^×` corresponding to `|·|_K` under `Art_K`, `‖w‖ = |Art_K⁻¹(w)|_K`. Its
kernel is the inertia subgroup and a geometric Frobenius element has norm `q⁻¹`; the twist by
`‖·‖` is the Tate twist `r(1)`. -/
def weilNorm : weilGroup K →* ℚˣ := sorry

/-- Tau Ceti ProfiniteCohomology; SelmerIwasawaCohomology L2/galois-selmer-group (stand-in): the
continuous cohomology group `H¹(G, V)` of a topological group `G` acting linearly and continuously
on an `R`-module `V` (finite free over `E` or `𝒪[E]` with its adic topology, or of finite length
with the discrete topology), as an `R`-module. -/
def contH1 {G : Type*} [Group G] [TopologicalSpace G] {R : Type} [CommRing R] {V : Type}
    [AddCommGroup V] [Module R V] (ρ : Representation R G V) : Type := sorry

instance {G : Type*} [Group G] [TopologicalSpace G] {R : Type} [CommRing R] {V : Type}
    [AddCommGroup V] [Module R V] (ρ : Representation R G V) : AddCommGroup (contH1 ρ) := sorry

instance {G : Type*} [Group G] [TopologicalSpace G] {R : Type} [CommRing R] {V : Type}
    [AddCommGroup V] [Module R V] (ρ : Representation R G V) : Module R (contH1 ρ) := sorry

/-- Tau Ceti ProfiniteCohomology (stand-in): restriction `H¹(G, V) → H¹(H, V)` along a continuous
homomorphism `H → G`. -/
def contH1.res {G H : Type*} [Group G] [TopologicalSpace G] [Group H] [TopologicalSpace H]
    {R : Type} [CommRing R] {V : Type} [AddCommGroup V] [Module R V] (ρ : Representation R G V)
    (f : H →ₜ* G) :
    contH1 ρ →ₗ[R] contH1 (R := R) (V := V) (MonoidHom.comp ρ f.toMonoidHom) := sorry

/-- Tau Ceti ProfiniteCohomology (stand-in): the class in `H¹(G, V)` of a continuous `1`-cocycle
`φ : G → V`, `φ(στ) = φ(σ) + σ φ(τ)` (the owner's value on other functions is not used). -/
def contH1.ofCocycle {G : Type*} [Group G] [TopologicalSpace G] {R : Type} [CommRing R]
    {V : Type} [AddCommGroup V] [Module R V] (ρ : Representation R G V) (φ : G → V) :
    contH1 ρ := sorry

variable {K E}

/-- SelmerIwasawaCohomology L4/bloch-kato-condition (stand-in): the Bloch–Kato subspace
`H¹_f(K, V) ⊂ H¹(K, V)` of a continuous representation of `G_K` on a finite-dimensional
`E`-vector space: the kernel of `H¹(K, V) → H¹(K, V ⊗ B_crys)` if `K` and `E` have the same
residue characteristic, and the unramified classes otherwise. -/
def blochKatoF {V : Type} [AddCommGroup V] [Module E V] (ρ : Representation E (Gal K) V) :
    Submodule E (contH1 ρ) := sorry

/-- SelmerIwasawaCohomology L4/bloch-kato-condition (stand-in): the subspace
`H¹_g(K, V) ⊂ H¹(K, V)`: the kernel of `H¹(K, V) → H¹(K, V ⊗ B_dR)` if `K` and `E` have the same
residue characteristic, and all of `H¹(K, V)` otherwise. -/
def blochKatoG {V : Type} [AddCommGroup V] [Module E V] (ρ : Representation E (Gal K) V) :
    Submodule E (contH1 ρ) := sorry

/-- SelmerIwasawaCohomology L2/galois-selmer-group (stand-in): the Selmer module `Sel_𝓛(F, V)` of
a family `𝓛 = (𝓛_v)` of local conditions at the finite places of `F`: the classes of `H¹(G_F, V)`
whose restriction to every finite place `v` lies in `𝓛_v`. -/
def selmerModule {F : Type} [Field F] {V : Type} [AddCommGroup V] [Module E V]
    (ρ : Representation E (Gal F) V)
    (L : ∀ v : Place F, Submodule E
      (contH1 (R := E) (V := V) (MonoidHom.comp ρ v.dec.toMonoidHom))) :
    Submodule E (contH1 ρ) := sorry

/-- The determinant `det ∘ ρ` of a homomorphism `ρ : G → GL_n(A)`
(IntegralHeckeAndGaloisDeterminants IHG.0/determinant-of-matrix-representation). -/
def Determinant.ofHom {G : Type*} [Group G] {A : Type*} [CommRing A] {n : ℕ}
    (ρ : G →* GL (Fin n) A) : Determinant G A n := Determinant.ofRep ⇑ρ

/-- IntegralHeckeAndGaloisDeterminants IHG.1/cayley-hamilton (stand-in): the Cayley–Hamilton
representations `(A[G], D) → (B, D′)` of `G` over `A` of dimension `n`: a finitely generated
`A`-algebra `B`, a homomorphism `G → B^×` and a determinant `D′ : B → A` of dimension `n` whose
Cayley–Hamilton ideal is zero (Wake–Wang-Erickson, Definition 2.1.8). -/
def CayleyHamiltonRep (G : Type) [Group G] (A : Type) [CommRing A] (n : ℕ) : Type 1 := sorry

/-- IHG.1/cayley-hamilton (stand-in): the algebra `B` of a Cayley–Hamilton representation. -/
def CayleyHamiltonRep.Alg {G : Type} [Group G] {A : Type} [CommRing A] {n : ℕ}
    (C : CayleyHamiltonRep G A n) : Type := sorry

instance {G : Type} [Group G] {A : Type} [CommRing A] {n : ℕ} (C : CayleyHamiltonRep G A n) :
    Ring C.Alg := sorry

instance {G : Type} [Group G] {A : Type} [CommRing A] {n : ℕ} (C : CayleyHamiltonRep G A n) :
    Algebra A C.Alg := sorry

/-- IHG.1/cayley-hamilton (stand-in): the homomorphism `G → B^×`. -/
def CayleyHamiltonRep.hom {G : Type} [Group G] {A : Type} [CommRing A] {n : ℕ}
    (C : CayleyHamiltonRep G A n) : G →* C.Algˣ := sorry

/-- IHG.1/cayley-hamilton (stand-in): the determinant `D = D′ ∘ ρ` of `G` over `A`. -/
def CayleyHamiltonRep.det {G : Type} [Group G] {A : Type} [CommRing A] {n : ℕ}
    (C : CayleyHamiltonRep G A n) : Determinant G A n := sorry

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group and G7/adjoint-representations
(stand-in): the adjoint action of `𝒢_n(A)` on `gl_n(A) = M_n(A)`, `ad(g, μ)(x) = g x g⁻¹` and
`ad(j)(x) = -ᵗx`. It is linear over every base ring `R` of `A`. -/
def CHT.adOver (n : ℕ) (R : Type*) (A : Type*) [CommRing R] [CommRing A] [Algebra R A] :
    Representation R (CHT n A) (Matrix (Fin n) (Fin n) A) := sorry

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group and
G7/operations-on-polarized-representations (stand-in): the tensor product
`𝒢_n ×_{{1, j}} 𝒢_1 → 𝒢_n`, with `(g, μ) ⊗ (a, μ′) = (ag, μμ′)` and
`(g, μ)j ⊗ (a, μ′)j = (ag, μμ′)j`. It is used only on pairs lying in the same component. -/
def CHT.tensor (n : ℕ) (A : Type*) [CommRing A] : CHT n A → CHT 1 A → CHT n A := sorry

/-- ArithmeticGaloisRepresentations G7/clozel-harris-taylor-group (stand-in): for a lift `rε` of
`r : G → 𝒢_n(E)` to `𝒢_n(E[ε])` with the same multiplier, the function `φ : G → gl_n(E)` with
`rε = (1 + εφ) r`, a `1`-cocycle for `ad r` (the kernel of `𝒢_n(E[ε]) → 𝒢_n(E)` is
`gl_n(E) ⊕ E`, and `φ` is its first coordinate). -/
def CHT.tangentCocycle {G : Type*} [Group G] {E : Type*} [Field E] {n : ℕ} (r : G →* CHT n E)
    (rε : G →* CHT n (DualNumber E)) : G → Matrix (Fin n) (Fin n) E := sorry

variable (K E)

/-- PadicHodgeTheory R06.2/admissible-representations (stand-in): the continuous representations
of `G_K` on `E[ε]^n` whose underlying `2n`-dimensional `E`-linear representation is de Rham
(`K` and `E` of the same residue characteristic). -/
def deRhamDual (n : ℕ) : Imported (Gal K →* GL (Fin n) (DualNumber E)) := sorry

/-- SmoothRepresentationsOfLocalGroups SR.1 (stand-in): the irreducible smooth representations of
`GL_n(K)` with a non-zero vector fixed by the standard Iwahori subgroup. -/
def iwahoriSpherical (n : ℕ) : Imported (SmoothIrrep K n) := sorry

/-- PadicHodgeRegulators D.1/teichmuller-unit-decomposition (stand-in): the Teichmüller lift
`𝓀[E] → 𝒪[E]`, the multiplicative section of the reduction map. -/
def teichmuller : 𝓀[E] →* 𝒪[E] := sorry

variable {K E}

/-- GlobalGaloisDeformations R04.2/universal-deformation-ring (stand-in): the universal
deformation ring `R^univ_{ρ̄,S}` of an absolutely irreducible `ρ̄ : G_{F,S} → GL_n(𝓀[E])`
(deformations up to strict equivalence, without framing), an `𝒪[E]`-algebra. -/
def univDeformationRing {F : Type} [Field F] {n : ℕ} (S : Set (Place F))
    (ρbar : Gal F →* GL (Fin n) 𝓀[E]) : Type := sorry

instance {F : Type} [Field F] {n : ℕ} (S : Set (Place F)) (ρbar : Gal F →* GL (Fin n) 𝓀[E]) :
    CommRing (univDeformationRing S ρbar) := sorry

instance {F : Type} [Field F] {n : ℕ} (S : Set (Place F)) (ρbar : Gal F →* GL (Fin n) 𝓀[E]) :
    Algebra 𝒪[E] (univDeformationRing S ρbar) := sorry

/-- GlobalGaloisDeformations R04.1/determinant-comparison (stand-in): the determinant of the
universal deformation over `R^univ_{ρ̄,S}`. -/
def univDeformationRing.det {F : Type} [Field F] {n : ℕ} (S : Set (Place F))
    (ρbar : Gal F →* GL (Fin n) 𝓀[E]) :
    Determinant (Gal F) (univDeformationRing S ρbar) n := sorry

/-- NoncommutativeAndEquivariantIwasawa NE.0 (stand-in; see also IntegralHeckeAndGaloisDeterminants
IHG.4/completed-group-algebra-extension): the completed group algebra `R⟦Γ⟧` of a profinite
group `Γ`. -/
def completedGroupAlgebra (R : Type) [CommRing R] (Γ : Type) [Group Γ] [TopologicalSpace Γ] :
    Type := sorry

instance (R : Type) [CommRing R] (Γ : Type) [Group Γ] [TopologicalSpace Γ] :
    Ring (completedGroupAlgebra R Γ) := sorry

instance (R : Type) [CommRing R] (Γ : Type) [Group Γ] [TopologicalSpace Γ] :
    Algebra R (completedGroupAlgebra R Γ) := sorry

/-- NoncommutativeAndEquivariantIwasawa NE.0 (stand-in): the tautological character
`Γ → R⟦Γ⟧^×`. -/
def completedGroupAlgebra.of (R : Type) [CommRing R] (Γ : Type) [Group Γ] [TopologicalSpace Γ] :
    Γ →* (completedGroupAlgebra R Γ)ˣ := sorry

end PL8Imported

/-! #### Auxiliary definitions of PL.8

Real definitions in terms of Mathlib, `Core` and the interfaces above. -/

section PL8Auxiliary

/-- The residue characteristic `p` of a local field. -/
abbrev residueChar (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] : ℕ := ringChar 𝓀[E]

/-- The coefficient ring `𝒪/ϖ^m`. -/
abbrev OMod (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (m : ℕ) : Type := 𝒪[E] ⧸ 𝓂[E] ^ m

/-- The conjugation action of the units of an `R`-algebra `A` on `A`, `g · x = g x g⁻¹`, as an
`R`-linear representation. -/
def conjRep (R : Type*) (A : Type*) [CommSemiring R] [Ring A] [Algebra R A] :
    Representation R Aˣ A where
  toFun g := LinearMap.mulLeft R (g : A) ∘ₗ LinearMap.mulRight R ((g⁻¹ : Aˣ) : A)
  map_one' := by ext x; simp
  map_mul' g h := by ext x; simp [mul_assoc]

/-- `ad ρ = M_n(A)` with the adjoint action of `G` through `ρ : G → GL_n(A)`. -/
def adRep {G : Type*} [Group G] {A : Type*} [CommRing A] {n : ℕ} (ρ : G →* GL (Fin n) A) :
    Representation A G (Matrix (Fin n) (Fin n) A) :=
  MonoidHom.comp (conjRep A (Matrix (Fin n) (Fin n) A)) ρ

/-- The cocycle of a lift `ρε` of `ρ : G → GL_n(E)` to `GL_n(E[ε])`: the function `φ` with
`ρε = (1 + εφ) ρ`, that is `φ(σ) = b(σ) ρ(σ)⁻¹` for `ρε(σ) = ρ(σ) + ε b(σ)`. -/
def tangentCocycle {G : Type*} [Group G] {E : Type*} [Field E] {n : ℕ} (ρ : G →* GL (Fin n) E)
    (ρε : G →* GL (Fin n) (DualNumber E)) (σ : G) : Matrix (Fin n) (Fin n) E :=
  (ρε σ : Matrix (Fin n) (Fin n) (DualNumber E)).map TrivSqZeroExt.snd *
    (((ρ σ)⁻¹ : GL (Fin n) E) : Matrix (Fin n) (Fin n) E)

section Local

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- `W_m = ad ρ ⊗_𝒪 𝒪/ϖ^m` for `ρ : G → GL_n(𝒪[E])`, as an `𝒪[E]`-linear representation. -/
def adMod {G : Type*} [Group G] (ρ : G →* GL (Fin n) 𝒪[E]) (m : ℕ) :
    Representation 𝒪[E] G (Matrix (Fin n) (Fin n) (OMod E m)) :=
  MonoidHom.comp (conjRep 𝒪[E] (Matrix (Fin n) (Fin n) (OMod E m)))
    (MonoidHom.comp (Matrix.GeneralLinearGroup.map (Ideal.Quotient.mk (𝓂[E] ^ m))) ρ)

/-- The inclusion `I_K → G_K` of the inertia subgroup. -/
def inertiaIncl (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : inertia K →ₜ* Gal K where
  toMonoidHom := (inertia K).subtype
  continuous_toFun := continuous_subtype_val

/-- The unramified classes `H¹_ur(K, V) = ker(H¹(G_K, V) → H¹(I_K, V))`
(SelmerIwasawaCohomology L2/unramified-condition, restated over the interface). -/
def unramifiedClasses {R : Type} [CommRing R] {V : Type} [AddCommGroup V] [Module R V]
    (ρ : Representation R (Gal K) V) : Submodule R (contH1 ρ) :=
  LinearMap.ker (contH1.res ρ (inertiaIncl K))

/-- `ρ : G_K → GL_n(E)` is semistable with all labelled Hodge–Tate weights in `[a, b]`
(`HT(ε) = {-1}`; `E` contains the images of the embeddings of `K`). -/
def IsSemistableInRange (ρ : Gal K →ₜ* GL (Fin n) E) (a b : ℤ) : Prop :=
  (semistable K E n).Holds ρ ∧ ∃ ρ' : (deRham K E n).Carrier, (deRham K E n).forget ρ' = ρ ∧
    ∀ τ : K →+* E, ∀ h ∈ hodgeTate ρ' τ, a ≤ h ∧ h ≤ b

/-- **The local condition of `𝓔^{[a,b]}`** (Newton–Thorne 2023 §2.3). A finite abelian group `M`
with an action of `G_K` is isomorphic to a subquotient of a lattice in a semistable representation
of `G_K` with Hodge–Tate weights in `[a, b]`. The semistable representation is taken on `E^m`,
where `E` has the residue characteristic of `K` and contains the images of the embeddings of `K`,
so that the labelled weights are all the weights; a lattice is a compact open subgroup of `E^m`
stable under `G_K`, and `M` is the image of a stable subgroup `T'` of the lattice under an
equivariant homomorphism. -/
def IsTorsionSemistable (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (a b : ℤ) {M : Type} [AddCommGroup M]
    (act : Gal K → M →+ M) : Prop :=
  Finite M ∧ ∃ (m : ℕ) (ρ : Gal K →ₜ* GL (Fin m) E) (T T' : AddSubgroup (Fin m → E))
      (q : T' →+ M),
    IsSemistableInRange ρ a b ∧ IsCompact (T : Set (Fin m → E)) ∧ IsOpen (T : Set (Fin m → E)) ∧
    T' ≤ T ∧ (∀ σ, ∀ x ∈ T, (ρ σ : Matrix (Fin m) (Fin m) E).mulVec x ∈ T) ∧
    (∀ σ, ∀ x ∈ T', (ρ σ : Matrix (Fin m) (Fin m) E).mulVec x ∈ T') ∧ Function.Surjective q ∧
    ∀ (σ : Gal K) (x y : T'),
      (y : Fin m → E) = (ρ σ : Matrix (Fin m) (Fin m) E).mulVec (x : Fin m → E) →
      q y = act σ (q x)

/-- `ρA : G → GL_n(A)` lifts `ρbar : G → GL_n(𝓀[E])`, for a local `𝒪[E]`-algebra `A`. -/
def LiftsResidual {G : Type*} [Group G] {A : Type} [CommRing A] [Algebra 𝒪[E] A]
    [IsLocalRing A] [IsLocalHom (algebraMap 𝒪[E] A)] (ρA : G →* GL (Fin n) A)
    (ρbar : G →* GL (Fin n) 𝓀[E]) : Prop :=
  ∀ σ, Matrix.GeneralLinearGroup.map (IsLocalRing.residue A) (ρA σ) =
    Matrix.GeneralLinearGroup.map (IsLocalRing.ResidueField.map (algebraMap 𝒪[E] A)) (ρbar σ)

/-- `r ⊗ E : G → 𝒢_n(E)` for a lattice-valued `r : G → 𝒢_n(𝒪[E])`. -/
def CHT.rat {G : Type*} [Group G] (r : G →* CHT n 𝒪[E]) : G →* CHT n E :=
  MonoidHom.comp (CHT.map n (algebraMap 𝒪[E] E)) r

/-- `rε : G → 𝒢_n(E[ε])` is a lift of `r : G → 𝒢_n(E)` with the same multiplier. -/
def IsFixedMultiplierLift {G : Type*} [Group G] (r : G →* CHT n E)
    (rε : G →* CHT n (DualNumber E)) : Prop :=
  (∀ σ, CHT.map n (TrivSqZeroExt.fstHom E E E : DualNumber E →+* E) (rε σ) = r σ) ∧
  ∀ σ, CHT.nu n (DualNumber E) (rε σ) =
    Units.map ((algebraMap E (DualNumber E) : E →+* DualNumber E) : E →* DualNumber E)
      (CHT.nu n E (r σ))

/-- A lift `ρε` of `ρ : G_K → GL_n(E)` to `GL_n(E[ε])` carries a lift of the ordinary flag of
weight `μ` with constant inertial characters: `ρε` is conjugate under `GL_n(E[ε])` to an upper
triangular representation with diagonal characters `ψε_1, …, ψε_n` (`ψε_1` on the invariant line)
whose reductions `ψ_i` satisfy the condition of `IsOrdinaryOfWeightAt`, and each `ψε_i` agrees on
the inertia subgroup with `ψ_i`, that is takes values in `E^× ⊂ E[ε]^×` there. Under `Art_K` this
says that the graded characters `δ_{ε,i}` and `δ_i` agree on `𝒪[K]^×`. -/
def HasConstantOrdinaryFlagLift (ρε : Gal K →* GL (Fin n) (DualNumber E))
    (μ : (K →+* E) → Fin n → ℤ) : Prop :=
  ∃ (ψ : Fin n → Gal K →ₜ* Eˣ) (ψε : Fin n → Gal K →* (DualNumber E)ˣ)
      (g : GL (Fin n) (DualNumber E)),
    (∀ σ, (∀ i j, j < i →
        ((g * ρε σ * g⁻¹ : GL (Fin n) (DualNumber E)) : Matrix (Fin n) (Fin n) (DualNumber E)) i j
          = 0) ∧
      ∀ i, ((g * ρε σ * g⁻¹ : GL (Fin n) (DualNumber E)) :
        Matrix (Fin n) (Fin n) (DualNumber E)) i i = ψε i σ) ∧
    (∀ i σ, TrivSqZeroExt.fst ((ψε i σ : (DualNumber E)ˣ) : DualNumber E) = (ψ i σ : E)) ∧
    (∀ i : Fin n, ∃ m : ℕ, 0 < m ∧ ∀ u : (𝒪[K])ˣ,
      (artinChar (ψ i) (unitOfInt u) *
        algChar (fun τ => μ τ (Fin.rev i) + (i : ℤ)) (unitOfInt u)) ^ m = 1) ∧
    ∀ i, ∀ σ ∈ inertia K, TrivSqZeroExt.snd ((ψε i σ : (DualNumber E)ˣ) : DualNumber E) = 0

end Local

section Global

variable {F : Type} [Field F]

/-- The elements of `F` of absolute value `< 1` at `v`. Two completions with the same such set
are the same place of `F`. -/
def Place.primeSet (v : Place F) : Set F := {x | v.emb x <ᵥ 1}

/-- `S` is a finite set of finite places of `F`: a set of completions that is closed under
isomorphism of completions and meets only finitely many places of `F`. -/
def IsFinitePlaceSet (S : Set (Place F)) : Prop :=
  (∀ v w : Place F, v.primeSet = w.primeSet → (v ∈ S ↔ w ∈ S)) ∧ (Place.primeSet '' S).Finite

/-- The number of places of `F` in a set of completions. -/
def placeCount (S : Set (Place F)) : ℕ := (Place.primeSet '' S).ncard

/-- The restriction of a representation of `G_F` to the decomposition group at `v`. -/
abbrev localRep {R : Type} [CommRing R] {V : Type} [AddCommGroup V] [Module R V]
    (ρ : Representation R (Gal F) V) (v : Place F) : Representation R (Gal v.Fv) V :=
  MonoidHom.comp ρ v.dec.toMonoidHom

/-- A homomorphism of `G_F` factors through `G_{F,S}`: it is unramified at every finite place
outside `S`. -/
def IsUnramifiedOutside {H : Type*} [Group H] (S : Set (Place F)) (ρ : Gal F →* H) : Prop :=
  ∀ v : Place F, v ∉ S → IsUnramified (ρ.comp v.dec.toMonoidHom)

/-- `H¹(G_{F,S}, V)` as a submodule of `H¹(G_F, V)`, for `V` unramified outside `S`: the classes
unramified at every finite place outside `S` (inflation is injective with this image). -/
def H1UnramifiedOutside {R : Type} [CommRing R] {V : Type} [AddCommGroup V] [Module R V]
    (S : Set (Place F)) (ρ : Representation R (Gal F) V) : Submodule R (contH1 ρ) :=
  ⨅ v : Place F, ⨅ _ : v ∉ S, (unramifiedClasses (localRep ρ v)).comap (contH1.res ρ v.dec)

/-- **The category `𝓔^{[a,b]}_{F,S}`** (Newton–Thorne 2023 §2.3): a finite abelian group `M` with
a continuous action of `G_{F,S}` that satisfies `IsTorsionSemistable` at every place above `p`. -/
def InSemistableCategory (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (S : Set (Place F)) (a b : ℤ) {M : Type} [AddCommGroup M]
    (act : Gal F →* AddMonoid.End M) : Prop :=
  Finite M ∧ IsOpen (act.ker : Set (Gal F)) ∧
  (∀ v : Place F, v ∉ S → ∀ σ ∈ inertia v.Fv, act (v.dec σ) = 1) ∧
  ∀ v : Place F, v.Above (residueChar E) → IsTorsionSemistable E a b fun σ => act (v.dec σ)

/-- **Condition (2.3) of Newton–Thorne 2023.** A determinant `D` of `G_F` over a local ring `A`
admits a Cayley–Hamilton representation `(A[G_F], D) → (B, D′)` all of whose quotients
`B/𝔪_A^i B`, with `G_F` acting by left multiplication, lie in `𝓔^{[a,b]}_{F,S}`. -/
def SatisfiesSemistableCondition (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (S : Set (Place F)) (a b : ℤ) {A : Type} [CommRing A]
    [IsLocalRing A] {n : ℕ} (D : Determinant (Gal F) A n) : Prop :=
  ∃ C : CayleyHamiltonRep (Gal F) A n, C.det = D ∧ ∀ i : ℕ, 1 ≤ i →
    InSemistableCategory E S a b
      (M := C.Alg ⧸ Ideal.span ((algebraMap A C.Alg) '' (IsLocalRing.maximalIdeal A ^ i : Ideal A)))
      (MonoidHom.comp (Module.toAddMonoidEnd C.Alg _).toMonoidHom
        (MonoidHom.comp (Units.coeHom C.Alg) C.hom))

/-- The kernel of `G_F → G^{ab}_{F,S}(p)`: the intersection of the open subgroups `U` of `G_F`
with `G_F/U` an abelian `p`-group that contain the inertia groups at the finite places outside
`S`. -/
def abProPKernel (S : Set (Place F)) (p : ℕ) : Subgroup (Gal F) :=
  sInf {U : Subgroup (Gal F) | IsOpen (U : Set (Gal F)) ∧ commutator (Gal F) ≤ U ∧
    (∀ g : Gal F, ∃ k : ℕ, g ^ p ^ k ∈ U) ∧
    ∀ v : Place F, v ∉ S → (inertia v.Fv).map v.dec.toMonoidHom ≤ U}

instance (S : Set (Place F)) (p : ℕ) : (abProPKernel S p).Normal := by sorry

/-- `G^{ab}_{F,S}(p)`, the Galois group of the maximal abelian pro-`p` extension of `F` unramified
at the finite places outside `S`. -/
abbrev abProPQuotient (S : Set (Place F)) (p : ℕ) : Type := Gal F ⧸ abProPKernel S p

variable [NumberField F]

/-- The inclusion `G_F → G_{F⁺}`. -/
def galIncl (F : Type) [Field F] [NumberField F] : Gal F →ₜ* Gal (maximalRealSubfield F) :=
  Field.absoluteGaloisGroup.map (algebraMap (maximalRealSubfield F) F)

/-- `r : G_{F⁺} → 𝒢_n(A)` is a homomorphism in the sense of Clozel–Harris–Taylor §2.1:
`r⁻¹(𝒢_n⁰(A)) = G_F`. -/
def IsCHTHom {A : Type*} [CommRing A] {n : ℕ}
    (r : Gal (maximalRealSubfield F) →* CHT n A) : Prop :=
  ∀ σ, r σ ∈ CHT.conn n A ↔ σ ∈ (galIncl F).toMonoidHom.range

/-- `r : G_{F⁺} → 𝒢_n(A)` restricts to `ρ : G_F → GL_n(A)`: `r⁻¹(𝒢_n⁰(A)) = G_F` and `ρ` is the
`GL_n`-component of `r|G_F`. -/
def RestrictsTo {A : Type*} [CommRing A] {n : ℕ} (r : Gal (maximalRealSubfield F) →* CHT n A)
    (ρ : Gal F →* GL (Fin n) A) : Prop :=
  IsCHTHom r ∧ ∀ (τ : Gal F) (h : r (galIncl F τ) ∈ CHT.conn n A),
    CHT.gl n A ⟨r (galIncl F τ), h⟩ = ρ τ

/-- The place `v` of `F⁺` splits in `F`: `F` embeds in the completion `F⁺_v` over `F⁺`. -/
def Place.SplitsIn (v : Place (maximalRealSubfield F)) : Prop :=
  ∃ f : F →+* v.Fv, ∀ x : maximalRealSubfield F, f (x : F) = v.emb x

/-- The places of `F` above a set of places of `F⁺`. -/
def placesOver (S : Set (Place (maximalRealSubfield F))) : Set (Place F) :=
  {u | ∃ v ∈ S, u.LiesOver (algebraMap (maximalRealSubfield F) F) v}

end Global

end PL8Auxiliary

/-! ### PL.8/generic-weil-deligne: Generic Weil–Deligne representations -/

/-- A Weil–Deligne representation of dimension `n` over a field `C` of characteristic zero, for a
topological group `W` with a norm character `‖·‖ : W → ℚ^×`: a homomorphism `r : W → GL_n(C)`
trivial on an open subgroup of the kernel of the norm, and a nilpotent `N` with
`r(w) N r(w)⁻¹ = ‖w‖ N`. For `W = W_K` and the norm `|Art_K⁻¹(·)|_K`, whose kernel is the open
subgroup `I_K`, these are the Weil–Deligne representations of `W_K` of
ArithmeticGaloisRepresentations R01.2/weil-deligne-representation, whose definition governs. -/
structure WeilDeligne (W : Type*) [Group W] [TopologicalSpace W] (nrm : W →* ℚˣ) (C : Type*)
    [Field C] [CharZero C] (n : ℕ) where
  /-- The representation `r : W → GL_n(C)`. -/
  r : W →* GL (Fin n) C
  /-- The monodromy operator `N`. -/
  N : Matrix (Fin n) (Fin n) C
  smooth : IsOpen ((r.ker ⊓ nrm.ker : Subgroup W) : Set W)
  nilpotent : IsNilpotent N
  conj : ∀ w, (r w : Matrix (Fin n) (Fin n) C) * N =
    ((nrm w : ℚ) : C) • (N * (r w : Matrix (Fin n) (Fin n) C))

namespace WeilDeligne

/-- The norm character with values in `C^×`. -/
def normChar {W : Type*} [Group W] (nrm : W →* ℚˣ) (C : Type*) [Field C] [CharZero C] :
    W →* Cˣ :=
  MonoidHom.comp (Units.map ((Rat.castHom C : ℚ →+* C) : ℚ →* C)) nrm

variable {W : Type*} [Group W] [TopologicalSpace W] {nrm : W →* ℚˣ} {C : Type*} [Field C]
  [CharZero C] {n m : ℕ}

/-- The space of morphisms `(r, N) → (r', N')`: the linear maps `f` with `f r(w) = r'(w) f` for
all `w` and `f N = N' f`. -/
def Hom (D : WeilDeligne W nrm C n) (D' : WeilDeligne W nrm C m) :
    Submodule C (Matrix (Fin m) (Fin n) C) where
  carrier := {f | (∀ w, f * (D.r w : Matrix (Fin n) (Fin n) C) =
    (D'.r w : Matrix (Fin m) (Fin m) C) * f) ∧ f * D.N = D'.N * f}
  add_mem' := by
    rintro f g ⟨hf, hf'⟩ ⟨hg, hg'⟩
    exact ⟨fun w => by rw [Matrix.add_mul, Matrix.mul_add, hf w, hg w],
      by rw [Matrix.add_mul, Matrix.mul_add, hf', hg']⟩
  zero_mem' := ⟨fun w => by rw [Matrix.zero_mul, Matrix.mul_zero],
    by rw [Matrix.zero_mul, Matrix.mul_zero]⟩
  smul_mem' := by
    rintro c f ⟨hf, hf'⟩
    exact ⟨fun w => by rw [Matrix.smul_mul, Matrix.mul_smul, hf w],
      by rw [Matrix.smul_mul, Matrix.mul_smul, hf']⟩

/-- The twist `(r(1), N)`: `r(1) = r ⊗ ‖·‖`, with the same `N`. -/
def twist (D : WeilDeligne W nrm C n) : WeilDeligne W nrm C n where
  r :=
    { toFun := fun w => Matrix.GeneralLinearGroup.scalar (Fin n) (normChar nrm C w) * D.r w
      map_one' := by sorry
      map_mul' := by sorry }
  N := D.N
  smooth := by sorry
  nilpotent := D.nilpotent
  conj := by sorry

/-- The space of morphisms `(r, N) → (r(1), N)`, written out: the linear maps `f` with
`f r(w) = ‖w‖ r(w) f` for all `w` and `f N = N f`. It is `Hom D D.twist` (`homToTwist_eq`). -/
def homToTwist (D : WeilDeligne W nrm C n) : Submodule C (Matrix (Fin n) (Fin n) C) where
  carrier := {f | (∀ w, f * (D.r w : Matrix (Fin n) (Fin n) C) =
    ((nrm w : ℚ) : C) • ((D.r w : Matrix (Fin n) (Fin n) C) * f)) ∧ f * D.N = D.N * f}
  add_mem' := by
    rintro f g ⟨hf, hf'⟩ ⟨hg, hg'⟩
    exact ⟨fun w => by rw [Matrix.add_mul, Matrix.mul_add, hf w, hg w, smul_add],
      by rw [Matrix.add_mul, Matrix.mul_add, hf', hg']⟩
  zero_mem' := ⟨fun w => by rw [Matrix.zero_mul, Matrix.mul_zero, smul_zero],
    by rw [Matrix.zero_mul, Matrix.mul_zero]⟩
  smul_mem' := by
    rintro c f ⟨hf, hf'⟩
    exact ⟨fun w => by rw [Matrix.smul_mul, Matrix.mul_smul, hf w, smul_comm],
      by rw [Matrix.smul_mul, Matrix.mul_smul, hf']⟩

/-- **`PL.8/generic-weil-deligne`.** `(r, N)` is generic: there is no non-zero morphism
`(r, N) → (r(1), N)` (Newton–Thorne 2023, Definition 1.1). A continuous `ρ : G_K → GL_n(E)`,
de Rham if `K` and `E` have the same residue characteristic, is generic if `weilDeligne ρ` is. -/
def IsGeneric (D : WeilDeligne W nrm C n) : Prop := ∀ f ∈ D.homToTwist, f = 0

/-- The morphisms to the twist are the morphisms of Weil–Deligne representations
`(r, N) → (r(1), N)`. -/
theorem homToTwist_eq (D : WeilDeligne W nrm C n) : D.homToTwist = Hom D D.twist := by sorry

/-- Two Weil–Deligne representations are isomorphic. -/
def IsIsomorphic (D D' : WeilDeligne W nrm C n) : Prop :=
  ∃ g : GL (Fin n) C, (∀ w, D'.r w = g * D.r w * g⁻¹) ∧
    D'.N = (g : Matrix (Fin n) (Fin n) C) * D.N * ((g⁻¹ : GL (Fin n) C) : Matrix (Fin n) (Fin n) C)

/-- Extension of scalars of a Weil–Deligne representation along a field homomorphism. -/
def baseChange {C' : Type*} [Field C'] [CharZero C'] (f : C →+* C') (D : WeilDeligne W nrm C n) :
    WeilDeligne W nrm C' n where
  r := MonoidHom.comp (Matrix.GeneralLinearGroup.map f) D.r
  N := D.N.map f
  smooth := by sorry
  nilpotent := by sorry
  conj := by sorry

end WeilDeligne

/-! #### Imported interfaces used by PL.8: Weil–Deligne representations of local fields -/

section PL8ImportedWD

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- ArithmeticGaloisRepresentations R01.2/grothendieck-monodromy-and-the-weil-deligne-functor,
with PadicHodgeTheory R06.2 for equal residue characteristics (stand-in): the Weil–Deligne
representation `WD(ρ)` of a continuous `ρ : G_K → GL_n(E)`, de Rham if `K` and `E` have the same
residue characteristic, over an algebraic closure of `E`. -/
def weilDeligne [CharZero E] (ρ : Gal K →ₜ* GL (Fin n) E) :
    WeilDeligne (weilGroup K) (weilNorm K) (AlgebraicClosure E) n := sorry

/-- ArithmeticGaloisRepresentations R01.2/frobenius-semisimplification (stand-in): the Frobenius
semisimplification `(r, N)^{F-ss}` of a Weil–Deligne representation of `W_K`. -/
def WeilDeligne.frobSS {C : Type*} [Field C] [CharZero C]
    (D : WeilDeligne (weilGroup K) (weilNorm K) C n) :
    WeilDeligne (weilGroup K) (weilNorm K) C n := sorry

variable (K) in
/-- ArithmeticGaloisRepresentations R01.2/purity-of-weil-deligne-representations (stand-in): the
pure Weil–Deligne representations of `W_K` (of some weight, in the sense of Taylor–Yoshida). -/
def pureWD (C : Type) [Field C] [CharZero C] (n : ℕ) :
    Imported (WeilDeligne (weilGroup K) (weilNorm K) C n) := sorry

/-- EndoscopicTransferAndUnitaryTraceComparison ET.6 (stand-in): `rec^T_K(π)`, the image of an
irreducible smooth representation of `GL_n(K)` under the local Langlands correspondence in Tate's
normalisation, a Frobenius semisimple Weil–Deligne representation over `ℂ`. -/
def recT (π : SmoothIrrep K n) : WeilDeligne (weilGroup K) (weilNorm K) ℂ n := sorry

end PL8ImportedWD

namespace WeilDeligne

section API

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {W : Type*} [Group W] [TopologicalSpace W] {nrm : W →* ℚˣ} {C : Type} [Field C]
  [CharZero C] {n : ℕ}

/-- **API: `isGeneric_of_frobSS`.** If the Frobenius semisimplification of a Weil–Deligne
representation of `W_K` is generic then so is the representation: a morphism `(r, N) → (r(1), N)`
induces one between the Frobenius semisimplifications (Newton–Thorne 2023 §1). -/
theorem isGeneric_of_frobSS (D : WeilDeligne (weilGroup K) (weilNorm K) C n)
    (h : D.frobSS.IsGeneric) : D.IsGeneric := by sorry

/-- **API: `isGeneric_of_rec_generic`.** If `WD(ρ)^{F-ss} ≅ rec^T_K(π)` for a generic irreducible
smooth representation `π` of `GL_n(K)` then `ρ` is generic (Allen, Lemma 1.1.3; Newton–Thorne
2023 §1). The comparison is made over `ℂ` through `ι`. -/
theorem isGeneric_of_rec_generic [CharZero E] (ρ : Gal K →ₜ* GL (Fin n) E)
    (hdR : residueChar K = residueChar E → (deRham K E n).Holds ρ)
    (ι : AlgebraicClosure E →+* ℂ) (π : SmoothIrrep K n) (hπ : (genericIrrep K n).Holds π)
    (h : ((weilDeligne ρ).frobSS.baseChange ι).IsIsomorphic (recT π)) :
    (weilDeligne ρ).IsGeneric := by sorry

/-- **API: `isGeneric_of_pure`.** A pure Weil–Deligne representation of `W_K` is generic: a
morphism to the twist respects the monodromy filtrations and lowers the weights of the graded
pieces by two. -/
theorem isGeneric_of_pure (D : WeilDeligne (weilGroup K) (weilNorm K) C n)
    (h : (pureWD K C n).Holds D) : D.IsGeneric := by sorry

/-- **API: `IsGeneric.restrict`.** If `WD(ρ|G_{K'})` is generic for a finite extension `K'/K` then
`WD(ρ)` is generic. -/
theorem IsGeneric.restrict [CharZero E] {K' : Type} [Field K'] [ValuativeRel K']
    [TopologicalSpace K'] [IsNonarchimedeanLocalField K'] {ρ : Gal K →ₜ* GL (Fin n) E}
    {f : K →+* K'} (h : (weilDeligne (resField ρ f)).IsGeneric)
    (hfin : letI := f.toAlgebra; Module.Finite K K')
    (hdR : residueChar K = residueChar E → (deRham K E n).Holds ρ) :
    (weilDeligne ρ).IsGeneric := by sorry

/-- The one-dimensional `(1, 0)` is generic as soon as the norm character is non-trivial. -/
-- test: generic_trivial
example (D : WeilDeligne W nrm C 1) (hr : ∀ w, D.r w = 1) (h : ∃ w, nrm w ≠ 1) :
    D.IsGeneric := by sorry

/-- The one-dimensional `(1, 0)` of `W_K` is generic: `Hom_{W_K}(1, |·|) = 0` because `q ≠ 1`. -/
-- test: generic_trivial
example (D : WeilDeligne (weilGroup K) (weilNorm K) C 1) (hr : ∀ w, D.r w = 1) :
    D.IsGeneric ∧ D.homToTwist = ⊥ := by sorry

/-- `(1 ⊕ ‖·‖, 0)` is not generic: the summand `‖·‖` of `r` maps isomorphically onto the summand
`1(1) = ‖·‖` of `r(1)`, and this map commutes with `N = 0`. -/
-- test: not_generic_steinberg_pair
example (D : WeilDeligne W nrm C 2)
    (hr : ∀ w, (D.r w : Matrix (Fin 2) (Fin 2) C) = Matrix.diagonal ![1, ((nrm w : ℚ) : C)])
    (hN : D.N = 0) : ¬ D.IsGeneric := by sorry

/-- The unramified principal series sum `(1 ⊕ |·|, 0)` of `W_K` exists and is not generic. -/
-- test: not_generic_steinberg_pair
example : ∃ D : WeilDeligne (weilGroup K) (weilNorm K) C 2,
    (∀ w, (D.r w : Matrix (Fin 2) (Fin 2) C) =
      Matrix.diagonal ![1, ((weilNorm K w : ℚ) : C)]) ∧ D.N = 0 ∧ ¬ D.IsGeneric := by sorry

/-- If `r` is irreducible, `N = 0` and `‖·‖^n ≠ 1`, then `(r, 0)` is generic: an isomorphism
`r ≅ r ⊗ ‖·‖` would give `det r = ‖·‖^n det r`. -/
-- test: generic_irreducible
example (D : WeilDeligne W nrm C n) (hirr : IsIrred fun w => D.r w) (hN : D.N = 0)
    (h : ∃ w, nrm w ^ n ≠ 1) : D.IsGeneric := by sorry

/-- An irreducible representation of `W_K` with `N = 0` is generic. -/
-- test: generic_irreducible
example (D : WeilDeligne (weilGroup K) (weilNorm K) C n) (hirr : IsIrred fun w => D.r w)
    (hN : D.N = 0) : D.IsGeneric := by sorry

/-- The zero Weil–Deligne representation is generic. -/
-- test: generic_zero_dim
example (D : WeilDeligne W nrm C 0) : D.IsGeneric := by sorry

end API

end WeilDeligne

/-! ### PL.8/bloch-kato-at-generic-places: Bloch–Kato local conditions at generic places -/

section BlochKatoLocal

variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- **PL.8/bloch-kato-at-generic-places** (Newton–Thorne 2023 §1, after Allen, Remark 1.2.9).
For `K/ℚ_l` and `E/ℚ_p` finite and a continuous `ρ : G_K → GL_n(E)`, de Rham if `l = p`:
`H¹_f(K, ad ρ) = H¹_g(K, ad ρ)` if and only if `ρ` is generic. -/
theorem bloch_kato_at_generic_places [CharZero K] [CharZero E] (ρ : Gal K →ₜ* GL (Fin n) E)
    (hdR : residueChar K = residueChar E → (deRham K E n).Holds ρ) :
    blochKatoF (adRep ρ.toMonoidHom) = blochKatoG (adRep ρ.toMonoidHom) ↔
      (weilDeligne ρ).IsGeneric := by sorry

/-- **PL.8/bloch-kato-at-generic-places**, the case `l = p` (Newton–Thorne 2021, proof of
Proposition 2.11): for a generic de Rham `ρ`, the class of every de Rham self-extension of `ρ`,
given as a lift `ρε` of `ρ` to `GL_n(E[ε])`, lies in `H¹_f(K, ad ρ)`. -/
theorem bloch_kato_at_generic_places_2 [CharZero K] [CharZero E] (ρ : Gal K →ₜ* GL (Fin n) E)
    (hp : residueChar K = residueChar E) (hdR : (deRham K E n).Holds ρ)
    (hgen : (weilDeligne ρ).IsGeneric) (ρε : Gal K →* GL (Fin n) (DualNumber E))
    (hlift : ∀ σ, Matrix.GeneralLinearGroup.map
      (TrivSqZeroExt.fstHom E E E : DualNumber E →+* E) (ρε σ) = ρ σ)
    (hε : (deRhamDual K E n).Holds ρε) :
    contH1.ofCocycle (adRep ρ.toMonoidHom) (tangentCocycle ρ.toMonoidHom ρε) ∈
      blochKatoF (adRep ρ.toMonoidHom) := by sorry

/-- **PL.8/bloch-kato-at-generic-places**, the case `l ≠ p`: for a generic `ρ` every class is
unramified, `H¹(K, ad ρ) = H¹_ur(K, ad ρ)`. -/
theorem bloch_kato_at_generic_places_3 [CharZero K] [CharZero E] (ρ : Gal K →ₜ* GL (Fin n) E)
    (hp : residueChar K ≠ residueChar E) (hgen : (weilDeligne ρ).IsGeneric) :
    unramifiedClasses (adRep ρ.toMonoidHom) = ⊤ := by sorry

end BlochKatoLocal

/-! ### PL.8/adjoint-bloch-kato-selmer-group: The adjoint Bloch–Kato Selmer group of a conjugate
self-dual representation

The integral versions `H¹_{𝓛_S}(F⁺, W_m)` and `H¹_{𝓛_S}(F⁺, W_E)` of the node depend on the
set-up of Newton–Thorne 2023 §2.4; they are `ConjSelfDualSetup.selmerTorsion` and
`ConjSelfDualSetup.SelmerRat`, under PL.8/pseudodeformation-tangent-comparison. -/

section AdjointSelmer

variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

/-- **`PL.8/adjoint-bloch-kato-selmer-group`: `ad ρ`.** The `G`-module `ad ρ = gl_n(E)` through
`ad ∘ r`, for `r : G → 𝒢_n(E)`; for `G = G_{F⁺}` and `ρ = r|G_F`, the subgroup `G_F` acts by
conjugation through `ρ` and a complex conjugation by `X ↦ -X^*`, the negative of the adjoint for
the pairing attached to `r` (Newton–Thorne 2023 §1; Clozel–Harris–Taylor §2.1). -/
def adjointRep {G : Type*} [Group G] (r : G →* CHT n E) :
    Representation E G (Matrix (Fin n) (Fin n) E) :=
  MonoidHom.comp (CHT.adOver n E E) r

/-- `W_m = ad r ⊗_𝒪 𝒪/ϖ^m` for `r : G → 𝒢_n(𝒪[E])`, as an `𝒪[E]`-linear representation. -/
def adjointRepMod {G : Type*} [Group G] (r : G →* CHT n 𝒪[E]) (m : ℕ) :
    Representation 𝒪[E] G (Matrix (Fin n) (Fin n) (OMod E m)) :=
  MonoidHom.comp (CHT.adOver n 𝒪[E] (OMod E m))
    (MonoidHom.comp (CHT.map n (Ideal.Quotient.mk (𝓂[E] ^ m))) r)

/-- **`PL.8/adjoint-bloch-kato-selmer-group`: `H¹_f(F⁺, ad ρ)`.** The classes of `H¹(G_{F⁺}, ad ρ)`
whose restriction to every finite place `v` lies in the Bloch–Kato subspace `H¹_f(F⁺_v, ad ρ)`
(Newton–Thorne 2023, Introduction). It does not involve a set `S`. -/
def adjointSelmerF {F₀ : Type} [Field F₀] (r : Gal F₀ →* CHT n E) :
    Submodule E (contH1 (adjointRep r)) :=
  ⨅ v : Place F₀, (blochKatoF (localRep (adjointRep r) v)).comap (contH1.res (adjointRep r) v.dec)

/-- **`PL.8/adjoint-bloch-kato-selmer-group`: `H¹_{g,S}(F⁺, ad ρ)`.** The classes of
`H¹(G_{F⁺,S}, ad ρ)` whose restriction to each place above `p` lies in `H¹_g`; no condition is
imposed at the places of `S` not above `p`, and the group depends on `S`
(Newton–Thorne 2023 §1). -/
def adjointSelmerG {F₀ : Type} [Field F₀] (S : Set (Place F₀)) (r : Gal F₀ →* CHT n E) :
    Submodule E (contH1 (adjointRep r)) :=
  H1UnramifiedOutside S (adjointRep r) ⊓
    ⨅ v : Place F₀, ⨅ _ : v.Above (residueChar E),
      (blochKatoG (localRep (adjointRep r) v)).comap (contH1.res (adjointRep r) v.dec)

/-- The description of `H¹_f(F⁺, ad ρ)` relative to `S`: the classes of `H¹(G_{F⁺,S}, ad ρ)` in
`H¹_f(F⁺_v, ad ρ)` at every `v ∈ S`. -/
def adjointSelmerFOn {F₀ : Type} [Field F₀] (S : Set (Place F₀)) (r : Gal F₀ →* CHT n E) :
    Submodule E (contH1 (adjointRep r)) :=
  H1UnramifiedOutside S (adjointRep r) ⊓
    ⨅ v : Place F₀, ⨅ _ : v ∈ S,
      (blochKatoF (localRep (adjointRep r) v)).comap (contH1.res (adjointRep r) v.dec)

variable {F : Type} [Field F] [NumberField F]

local notation "F⁺" => maximalRealSubfield F

/-- **API: `adjointSelmerF_le_G`.** `H¹_f(F⁺, ad ρ) ⊂ H¹_{g,S}(F⁺, ad ρ)`, with equality when
`ρ|G_{F_u}` is generic for every place `u` of `F` above `S` (Newton–Thorne 2023,
Proposition 2.17(3), through PL.8/bloch-kato-at-generic-places). -/
theorem adjointSelmerF_le_G [IsCMField F] [CharZero E] (S : Set (Place F⁺))
    (hS : IsFinitePlaceSet S) (hSp : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S)
    (r : Gal F⁺ →ₜ* CHT n 𝒪[E]) (ρ : Gal F →ₜ* GL (Fin n) E)
    (hρ : RestrictsTo (CHT.rat r.toMonoidHom) ρ.toMonoidHom)
    (hur : IsUnramifiedOutside S r.toMonoidHom)
    (hdR : ∀ u : Place F, u.Above (residueChar E) → (deRham u.Fv E n).Holds (resPlace ρ u)) :
    adjointSelmerF (CHT.rat r.toMonoidHom) ≤ adjointSelmerG S (CHT.rat r.toMonoidHom) ∧
    ((∀ u ∈ placesOver S, (weilDeligne (resPlace ρ u)).IsGeneric) →
      adjointSelmerF (CHT.rat r.toMonoidHom) = adjointSelmerG S (CHT.rat r.toMonoidHom)) := by
  sorry

/-- **API: `adjointSelmerF_eq_tangent`.** `H¹_{g,S}(F⁺, ad ρ)` is the tangent space at `r` of the
polarized deformations with fixed multiplier that are unramified outside `S` and de Rham above
`p`: its classes are those of the continuous lifts `rε` of `r` to `𝒢_n(E[ε])` with these
properties. `H¹_f(F⁺, ad ρ)` is the subspace cut out by `H¹_f(F⁺_v, ad ρ)` at all `v ∈ S`, and it
equals `H¹_{g,S}(F⁺, ad ρ)` when `ρ` is generic at every place above `S`. -/
theorem adjointSelmerF_eq_tangent [IsCMField F] [CharZero E] (S : Set (Place F⁺))
    (hS : IsFinitePlaceSet S) (hSp : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S)
    (r : Gal F⁺ →ₜ* CHT n E) (ρ : Gal F →ₜ* GL (Fin n) E)
    (hρ : RestrictsTo r.toMonoidHom ρ.toMonoidHom) (hur : IsUnramifiedOutside S r.toMonoidHom)
    (hdR : ∀ u : Place F, u.Above (residueChar E) → (deRham u.Fv E n).Holds (resPlace ρ u)) :
    (∀ c : contH1 (adjointRep r.toMonoidHom), c ∈ adjointSelmerG S r.toMonoidHom ↔
      ∃ (rε : Gal F⁺ →ₜ* CHT n (DualNumber E)) (ρε : Gal F →* GL (Fin n) (DualNumber E)),
        IsFixedMultiplierLift r.toMonoidHom rε.toMonoidHom ∧ RestrictsTo rε.toMonoidHom ρε ∧
        IsUnramifiedOutside S rε.toMonoidHom ∧
        (∀ u : Place F, u.Above (residueChar E) →
          (deRhamDual u.Fv E n).Holds (ρε.comp u.dec.toMonoidHom)) ∧
        contH1.ofCocycle (adjointRep r.toMonoidHom)
          (CHT.tangentCocycle r.toMonoidHom rε.toMonoidHom) = c) ∧
    adjointSelmerF r.toMonoidHom = adjointSelmerFOn S r.toMonoidHom ∧
    ((∀ u ∈ placesOver S, (weilDeligne (resPlace ρ u)).IsGeneric) →
      adjointSelmerF r.toMonoidHom = adjointSelmerG S r.toMonoidHom) := by sorry

/-- **API: `adjointSelmer_twist`.** Twisting `r` by a character `θ` of `G_{F⁺}` with values in
`𝒢_1`, of the same component as `r`, changes neither `ad ρ` nor the Selmer groups
(Newton–Thorne 2023, proof of Theorem 5.2). -/
theorem adjointSelmer_twist [IsCMField F] (r r' : Gal F⁺ →* CHT n E) (θ : Gal F⁺ →* CHT 1 E)
    (hr : IsCHTHom r) (hθ : IsCHTHom θ) (h : ∀ σ, r' σ = CHT.tensor n E (r σ) (θ σ))
    (S : Set (Place F⁺)) :
    adjointRep r' = adjointRep r ∧ HEq (adjointSelmerF r') (adjointSelmerF r) ∧
      HEq (adjointSelmerG S r') (adjointSelmerG S r) := by sorry

/-- For `n = 1`, `ad ρ` is the character `δ_{F/F⁺}` on `E` and `H¹_f(F⁺, ad ρ) = 0`: an everywhere
unramified homomorphism `G_F → E` factors through the class group. -/
-- test: selmer_rank_one
example [IsCMField F] (r : Gal F⁺ →ₜ* CHT 1 𝒪[E]) (hr : IsCHTHom (CHT.rat r.toMonoidHom)) :
    (∀ σ x, adjointRep (CHT.rat r.toMonoidHom) σ x = ((delta F E σ : Eˣ) : E) • x) ∧
      adjointSelmerF (CHT.rat r.toMonoidHom) = ⊥ := by sorry

/-- `H¹_f(F⁺, ad ρ)` is a finite-dimensional `E`-vector space, a subspace of
`H¹(G_{F⁺,S}, ad ρ)`. -/
-- test: selmer_zero_coeff
example [IsCMField F] (S : Set (Place F⁺)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S) (r : Gal F⁺ →ₜ* CHT n 𝒪[E])
    (hr : IsCHTHom (CHT.rat r.toMonoidHom)) (hur : IsUnramifiedOutside S r.toMonoidHom) :
    Module.Finite E (adjointSelmerF (CHT.rat r.toMonoidHom)) ∧
      adjointSelmerF (CHT.rat r.toMonoidHom) ≤
        H1UnramifiedOutside S (adjointRep (CHT.rat r.toMonoidHom)) := by sorry

/-- `H¹_f(F⁺, ad ρ)` is unchanged when `S` is enlarged: its descriptions relative to `S ⊂ S'`
agree with each other and with the description by all finite places. -/
-- test: selmer_zero_coeff
example [IsCMField F] (S S' : Set (Place F⁺)) (hS : IsFinitePlaceSet S)
    (hS' : IsFinitePlaceSet S') (hSS' : S ⊆ S')
    (hSp : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S) (r : Gal F⁺ →ₜ* CHT n 𝒪[E])
    (hr : IsCHTHom (CHT.rat r.toMonoidHom)) (hur : IsUnramifiedOutside S r.toMonoidHom) :
    adjointSelmerFOn S (CHT.rat r.toMonoidHom) = adjointSelmerFOn S' (CHT.rat r.toMonoidHom) ∧
      adjointSelmerFOn S (CHT.rat r.toMonoidHom) = adjointSelmerF (CHT.rat r.toMonoidHom) := by
  sorry

/-- The ambient group does not vanish for odd `r`: by the global Euler characteristic formula,
`dim H¹(G_{F⁺,S}, ad ρ) ≥ [F⁺ : ℚ] n(n + 1)/2`, because each complex conjugation fixes a subspace
of `ad ρ` of dimension `n(n - 1)/2`. The complex conjugations are the elements of order two. -/
-- test: selmer_zero_coeff
example [IsCMField F] (S : Set (Place F⁺)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S) (r : Gal F⁺ →ₜ* CHT n 𝒪[E])
    (hr : IsCHTHom (CHT.rat r.toMonoidHom)) (hur : IsUnramifiedOutside S r.toMonoidHom)
    (hodd : ∀ c : Gal F⁺, orderOf c = 2 → CHT.nu n 𝒪[E] (r c) = -1) :
    Module.Finite E (H1UnramifiedOutside S (adjointRep (CHT.rat r.toMonoidHom))) ∧
      Module.finrank ℚ F⁺ * (n * (n + 1) / 2) ≤
        Module.finrank E (H1UnramifiedOutside S (adjointRep (CHT.rat r.toMonoidHom))) := by sorry

/-- `adjointSelmerF` is the Selmer module of SelmerIwasawaCohomology for the Bloch–Kato local
conditions `H¹_f(F⁺_v, ad ρ)`. -/
-- test: selmer_compatibility_selmerIwasawa
example [IsCMField F] (r : Gal F⁺ →ₜ* CHT n 𝒪[E]) :
    adjointSelmerF (CHT.rat r.toMonoidHom) =
      selmerModule (adjointRep (CHT.rat r.toMonoidHom))
        (fun v => blochKatoF (localRep (adjointRep (CHT.rat r.toMonoidHom)) v)) := by sorry

/-- For `n = 1`, `H¹(G_{F⁺,S}, E(δ_{F/F⁺}))` has dimension at least `[F⁺ : ℚ]` by the global Euler
characteristic formula, while `H¹_f = 0`: the Bloch–Kato group is not the full cohomology. -/
-- test: selmer_conditions_not_vacuous
example [IsCMField F] (S : Set (Place F⁺)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S) (r : Gal F⁺ →ₜ* CHT 1 𝒪[E])
    (hr : IsCHTHom (CHT.rat r.toMonoidHom)) (hur : IsUnramifiedOutside S r.toMonoidHom) :
    Module.Finite E (H1UnramifiedOutside S (adjointRep (CHT.rat r.toMonoidHom))) ∧
      Module.finrank ℚ F⁺ ≤
        Module.finrank E (H1UnramifiedOutside S (adjointRep (CHT.rat r.toMonoidHom))) ∧
      adjointSelmerF (CHT.rat r.toMonoidHom) = ⊥ ∧
      adjointSelmerF (CHT.rat r.toMonoidHom) ≠
        H1UnramifiedOutside S (adjointRep (CHT.rat r.toMonoidHom)) := by sorry

end AdjointSelmer

/-! ### PL.8/semistable-pseudodeformation-ring: Semistable conjugate self-dual
pseudodeformation rings -/

section DetRings

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

local notation "F⁺" => maximalRealSubfield F

/-- **`PL.8/semistable-pseudodeformation-ring`: `R_{D̄,S}`.** The object of `C_𝒪` representing the
continuous determinants of `G_{F,S}` over objects of `C_𝒪` that lift `D̄` (Newton–Thorne 2023,
Proposition 2.12, from Chenevier §3.3). -/
def detDeformationRing (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) : Type := sorry

instance (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) :
    CommRing (detDeformationRing S Dbar) := sorry

instance (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) :
    Algebra 𝒪[E] (detDeformationRing S Dbar) := sorry

/-- The universal determinant of `G_{F,S}` over `R_{D̄,S}`: a continuous determinant `D` over an
object `A` of `C_𝒪` lifting `D̄` is the image of the universal one under a unique local
`𝒪[E]`-algebra homomorphism `R_{D̄,S} → A`, the classifying map of `D`. -/
def detDeformationRing.univ (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) :
    Determinant (Gal F) (detDeformationRing S Dbar) n := sorry

/-- The ideal of `R_{D̄,S}` cutting out the determinants that satisfy condition (2.3) for the
category `𝓔^{[a,b]}_{F,S}` (Newton–Thorne 2023, Proposition 2.14, from Wake–Wang-Erickson,
Theorem 2.5.5); it is the unit ideal when no determinant satisfies the condition. -/
def semistableDetIdeal (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) (a b : ℤ) :
    Ideal (detDeformationRing S Dbar) := sorry

/-- **`PL.8/semistable-pseudodeformation-ring`: `R^{[a,b]}_{D̄,S}`.** The quotient of `R_{D̄,S}`
for the condition (2.3). -/
abbrev semistableDetRing (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) (a b : ℤ) :
    Type :=
  detDeformationRing S Dbar ⧸ semistableDetIdeal S Dbar a b

/-- The universal determinant over `R^{[a,b]}_{D̄,S}`. -/
def semistableDetRing.univ (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) (a b : ℤ) :
    Determinant (Gal F) (semistableDetRing S Dbar a b) n :=
  (detDeformationRing.univ S Dbar).map (Ideal.Quotient.mk (semistableDetIdeal S Dbar a b))

/-- The ideal of `R^{[a,b]}_{D̄,S}` generated by the elements `x - c·x`, for the involution `c` of
`R^{[a,b]}_{D̄,S}` sending a determinant `D′` to `(D′)^{c,∨} ⊗ χ|G_{F,S}`: it cuts out the
determinants with `(D′)^c = (D′)^∨ ⊗ χ|G_{F,S}` (Newton–Thorne 2023 §2.4). Here `F` is a CM
field, `S` is the set of places above a set of places of `F⁺` split in `F`, `χ` is a character of
`G_{F⁺,S}` with `D̄^{c,∨} ⊗ χ̄ = D̄`, and `a + b = w` where `χ ε^w` has finite order. -/
def conjSelfDualDetIdeal (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) (a b : ℤ)
    (χ : Gal F⁺ →* (𝒪[E])ˣ) : Ideal (semistableDetRing S Dbar a b) := sorry

/-- **`PL.8/semistable-pseudodeformation-ring`: `R_S`.** The conjugate self-dual quotient of
`R^{[a,b]}_{D̄,S}` for the involution `D′ ↦ (D′)^{c,∨} ⊗ χ`: its ring of coinvariants. -/
abbrev conjSelfDualDetRing (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) (a b : ℤ)
    (χ : Gal F⁺ →* (𝒪[E])ˣ) : Type :=
  semistableDetRing S Dbar a b ⧸ conjSelfDualDetIdeal S Dbar a b χ

/-- The universal determinant over `R_S`. -/
def conjSelfDualDetRing.univ (S : Set (Place F)) (Dbar : Determinant (Gal F) 𝓀[E] n) (a b : ℤ)
    (χ : Gal F⁺ →* (𝒪[E])ˣ) : Determinant (Gal F) (conjSelfDualDetRing S Dbar a b χ) n :=
  (semistableDetRing.univ S Dbar a b).map (Ideal.Quotient.mk (conjSelfDualDetIdeal S Dbar a b χ))

/-- **API: `detDeformationRing_generators`.** For each `q ≥ 0` there is `g₀ = g₀(S, D̄, q)` such
that `R_{D̄,S∪Q}` is a quotient of `𝒪⟦X_1, …, X_{g₀}⟧` for every set `Q` of at most `q` finite
places (Newton–Thorne 2023, Lemma 2.13). -/
theorem detDeformationRing_generators (S : Set (Place F)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρbar : Gal F →* GL (Fin n) 𝓀[E])
    (hc : IsContinuousResidual ρbar) (hur : IsUnramifiedOutside S ρbar) (q : ℕ) :
    ∃ g₀ : ℕ, ∀ Q : Set (Place F), IsFinitePlaceSet Q → placeCount Q ≤ q →
      ∃ f : MvPowerSeries (Fin g₀) 𝒪[E] →ₐ[𝒪[E]]
          detDeformationRing (S ∪ Q) (Determinant.ofHom ρbar),
        Function.Surjective f := by sorry

/-- **API: `semistableDetRing_points`.** A map `R_{D̄,S} → 𝒪[E]` factors through
`R^{[a,b]}_{D̄,S}` if and only if the associated semisimple representation, realised over a finite
extension `E'` of `E`, is semistable at every place above `p` with Hodge–Tate weights in
`[a, b]`. -/
theorem semistableDetRing_points [CharZero E] [IsLargeFor F E] (S : Set (Place F))
    (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρbar : Gal F →* GL (Fin n) 𝓀[E])
    (hc : IsContinuousResidual ρbar) (hur : IsUnramifiedOutside S ρbar) (a b : ℤ) (hab : a ≤ b)
    (x : detDeformationRing S (Determinant.ofHom ρbar) →ₐ[𝒪[E]] 𝒪[E]) :
    semistableDetIdeal S (Determinant.ofHom ρbar) a b ≤ RingHom.ker x.toRingHom ↔
    ∃ (E' : Type) (_ : Field E') (_ : ValuativeRel E') (_ : TopologicalSpace E')
      (_ : IsNonarchimedeanLocalField E') (_ : CharZero E') (j : E →+* E')
      (ρ : Gal F →ₜ* GL (Fin n) E'),
      IsSemisimpleRep (fun σ => ρ σ) ∧
      Determinant.ofHom ρ.toMonoidHom =
        (((detDeformationRing.univ S (Determinant.ofHom ρbar)).map x.toRingHom).map
          (j.comp (algebraMap 𝒪[E] E))) ∧
      ∀ v : Place F, v.Above (residueChar E) → IsSemistableInRange (resPlace ρ v) a b := by sorry

/-- **API: `semistableDetRing_absIrred`.** For absolutely irreducible `ρ̄`, where `R_{D̄,S}` is the
unframed deformation ring of `ρ̄`, the quotient `R^{[a,b]}_{D̄,S}` classifies the deformations
`ρ_A` such that every `ρ_A ⊗ A/𝔪_A^i` lies in `𝓔^{[a,b]}_{F,S}`: this is stated for the objects
`A` of finite length (finite local `𝒪`-algebras with residue field `𝓀`), which determine a
quotient of an object of `C_𝒪`. Its points with values in
the ring of integers of a finite extension `E'` of `E` are the lifts that are semistable with
Hodge–Tate weights in `[a, b]` at every place above `p`. Neither reducedness nor `𝒪`-flatness is
asserted. -/
theorem semistableDetRing_absIrred [CharZero E] [IsLargeFor F E] (S : Set (Place F))
    (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρbar : Gal F →* GL (Fin n) 𝓀[E])
    (hc : IsContinuousResidual ρbar) (hur : IsUnramifiedOutside S ρbar)
    (hirr : IsAbsIrred fun σ => ρbar σ) (a b : ℤ) (hab : a ≤ b) :
    (∀ (A : Type) [CommRing A] [Algebra 𝒪[E] A] [IsLocalRing A]
        [IsLocalHom (algebraMap 𝒪[E] A)] [Finite A] (ρA : Gal F →* GL (Fin n) A)
        (x : detDeformationRing S (Determinant.ofHom ρbar) →ₐ[𝒪[E]] A),
      Function.Surjective (IsLocalRing.ResidueField.map (algebraMap 𝒪[E] A)) →
      LiftsResidual ρA ρbar → IsOpen (ρA.ker : Set (Gal F)) → IsUnramifiedOutside S ρA →
      (detDeformationRing.univ S (Determinant.ofHom ρbar)).map x.toRingHom =
        Determinant.ofHom ρA →
      (semistableDetIdeal S (Determinant.ofHom ρbar) a b ≤ RingHom.ker x.toRingHom ↔
        InSemistableCategory E S a b (M := Fin n → A)
          (MonoidHom.comp
            (Module.toAddMonoidEnd (Matrix (Fin n) (Fin n) A) (Fin n → A)).toMonoidHom
            (MonoidHom.comp (Units.coeHom (Matrix (Fin n) (Fin n) A)) ρA)))) ∧
    (∀ (E' : Type) [Field E'] [ValuativeRel E'] [TopologicalSpace E']
        [IsNonarchimedeanLocalField E'] [CharZero E']
        (x : detDeformationRing S (Determinant.ofHom ρbar) →+* 𝒪[E'])
        (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E']),
      (detDeformationRing.univ S (Determinant.ofHom ρbar)).map x =
        Determinant.ofHom ρ.toMonoidHom →
      (semistableDetIdeal S (Determinant.ofHom ρbar) a b ≤ RingHom.ker x ↔
        ∀ v : Place F, v.Above (residueChar E) →
          IsSemistableInRange (genericC (resPlace ρ v)) a b)) := by sorry

/-- For `n = 1` a determinant is a character: every one-dimensional determinant of a group `G`
over `A` is the determinant of a unique homomorphism `G → GL_1(A)`. -/
-- test: ssdet_rank_one
example (G : Type) [Group G] (A : Type) [CommRing A] :
    Function.Bijective (Determinant.ofHom : (G →* GL (Fin 1) A) → Determinant G A 1) := by sorry

/-- For `n = 1` a Cayley–Hamilton algebra is `A` itself. -/
-- test: ssdet_rank_one
example (G : Type) [Group G] (A : Type) [CommRing A] (C : CayleyHamiltonRep G A 1) :
    Function.Bijective (algebraMap A C.Alg) := by sorry

/-- For `n = 1`, `R_{D̄,S} ≅ 𝒪⟦G^{ab}_{F,S}(p)⟧`, the universal character being the Teichmüller
lift of `χ̄` times the tautological character. -/
-- test: ssdet_rank_one
example (S : Set (Place F)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρbar : Gal F →* GL (Fin 1) 𝓀[E])
    (hc : IsContinuousResidual ρbar) (hur : IsUnramifiedOutside S ρbar) :
    ∃ (Ψ : Gal F →* GL (Fin 1) (detDeformationRing S (Determinant.ofHom ρbar)))
      (e : detDeformationRing S (Determinant.ofHom ρbar) ≃ₐ[𝒪[E]]
        completedGroupAlgebra 𝒪[E] (abProPQuotient S (residueChar E))),
      Determinant.ofHom Ψ = detDeformationRing.univ S (Determinant.ofHom ρbar) ∧
      ∀ σ : Gal F, e ((Ψ σ : Matrix (Fin 1) (Fin 1) _) 0 0) =
        algebraMap 𝒪[E] _ (teichmuller E ((ρbar σ : Matrix (Fin 1) (Fin 1) 𝓀[E]) 0 0)) *
          ((completedGroupAlgebra.of 𝒪[E] (abProPQuotient S (residueChar E))
            (QuotientGroup.mk σ) : (completedGroupAlgebra 𝒪[E] _)ˣ) :
            completedGroupAlgebra 𝒪[E] _) := by sorry

/-- For `n = 1`, `R^{[a,a]}_{D̄,S}` is the quotient of `R_{D̄,S}` classifying the lifts `ψ` with
`ψ|I_{F_v} = ε^{-a}|I_{F_v}` for every `v | p`, that is with `ψ ε^a` unramified above `p`; stated
for the objects `A` of finite length. Here `εO` is the cyclotomic character with values in
`𝒪[E]^×`. -/
-- test: ssdet_rank_one
example [IsLargeFor F E] (S : Set (Place F)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρbar : Gal F →* GL (Fin 1) 𝓀[E])
    (hc : IsContinuousResidual ρbar) (hur : IsUnramifiedOutside S ρbar) (a : ℤ)
    (εO : Gal F →* (𝒪[E])ˣ) (hε : ∀ σ, (((εO σ : (𝒪[E])ˣ) : 𝒪[E]) : E) = (cyclo E F σ : E))
    (A : Type) [CommRing A] [Algebra 𝒪[E] A] [IsLocalRing A] [IsLocalHom (algebraMap 𝒪[E] A)]
    [Finite A] (hres : Function.Surjective (IsLocalRing.ResidueField.map (algebraMap 𝒪[E] A)))
    (ψ : Gal F →* GL (Fin 1) A) (hψ : LiftsResidual ψ ρbar)
    (hopen : IsOpen (ψ.ker : Set (Gal F))) (hψur : IsUnramifiedOutside S ψ)
    (x : detDeformationRing S (Determinant.ofHom ρbar) →ₐ[𝒪[E]] A)
    (hx : (detDeformationRing.univ S (Determinant.ofHom ρbar)).map x.toRingHom =
      Determinant.ofHom ψ) :
    semistableDetIdeal S (Determinant.ofHom ρbar) a a ≤ RingHom.ker x.toRingHom ↔
      ∀ v : Place F, v.Above (residueChar E) → ∀ σ ∈ inertia v.Fv,
        Matrix.GeneralLinearGroup.det (ψ (v.dec σ)) *
          Units.map (algebraMap 𝒪[E] A : 𝒪[E] →* A) (εO (v.dec σ)) ^ a = 1 := by sorry

/-- For `n = 1` the functor `Def^{[a,a]}_{D̄,S}` is empty, and `R^{[a,a]}_{D̄,S}` is the zero ring,
unless `χ̄ ε̄^a` is unramified above `p`. -/
-- test: ssdet_rank_one
example [IsLargeFor F E] (S : Set (Place F)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρbar : Gal F →* GL (Fin 1) 𝓀[E])
    (hc : IsContinuousResidual ρbar) (hur : IsUnramifiedOutside S ρbar) (a : ℤ)
    (εO : Gal F →* (𝒪[E])ˣ) (hε : ∀ σ, (((εO σ : (𝒪[E])ˣ) : 𝒪[E]) : E) = (cyclo E F σ : E))
    (hram : ∃ v : Place F, v.Above (residueChar E) ∧ ∃ σ ∈ inertia v.Fv,
      Matrix.GeneralLinearGroup.det (ρbar (v.dec σ)) *
        Units.map (IsLocalRing.residue 𝒪[E] : 𝒪[E] →* 𝓀[E]) (εO (v.dec σ)) ^ a ≠ 1) :
    Subsingleton (semistableDetRing S (Determinant.ofHom ρbar) a a) := by sorry

/-- If `a > b` then `𝓔^{[a,b]}` contains only the zero module (`E` contains an image of `K`, so
that there is a labelled Hodge–Tate weight). -/
-- test: ssdet_empty_interval
example {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (hK : Nonempty (K →+* E)) (a b : ℤ) (hab : b < a) {M : Type} [AddCommGroup M]
    (act : Gal K → M →+ M) (hM : IsTorsionSemistable E a b act) : Subsingleton M := by sorry

/-- If `a > b`, no determinant of dimension `n ≥ 1` over a non-zero local ring satisfies condition
(2.3): `Def^{[a,b]}_{D̄,S}(A) = ∅` for every `A`, so the subfunctor has no representing object in
`C_𝒪`. The source assumes `a ≤ b`. -/
-- test: ssdet_empty_interval
example [IsLargeFor F E] (S : Set (Place F)) (a b : ℤ) (hab : b < a) (hn : 1 ≤ n) (A : Type)
    [CommRing A]
    [IsLocalRing A] (D : Determinant (Gal F) A n) :
    ¬ SatisfiesSemistableCondition E S a b D := by sorry

/-- If `a > b` the quotient `R^{[a,b]}_{D̄,S}` of this file is the zero ring, which is not an
object of `C_𝒪`. -/
-- test: ssdet_empty_interval
example [IsLargeFor F E] (S : Set (Place F)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρbar : Gal F →* GL (Fin n) 𝓀[E])
    (hc : IsContinuousResidual ρbar) (hur : IsUnramifiedOutside S ρbar) (a b : ℤ) (hab : b < a)
    (hn : 1 ≤ n) : Subsingleton (semistableDetRing S (Determinant.ofHom ρbar) a b) := by sorry

/-- If `ρ̄` is absolutely irreducible then `R_{D̄,S} ≅ R^univ_{ρ̄,S}`, the unframed deformation
ring, the universal determinant corresponding to the determinant of the universal deformation. -/
-- test: ssdet_absIrred
example (S : Set (Place F)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρbar : Gal F →* GL (Fin n) 𝓀[E])
    (hc : IsContinuousResidual ρbar) (hur : IsUnramifiedOutside S ρbar)
    (hirr : IsAbsIrred fun σ => ρbar σ) :
    ∃ e : detDeformationRing S (Determinant.ofHom ρbar) ≃ₐ[𝒪[E]] univDeformationRing S ρbar,
      (detDeformationRing.univ S (Determinant.ofHom ρbar)).map e.toAlgHom.toRingHom =
        univDeformationRing.det S ρbar := by sorry

/-- A characteristic-zero point whose representation is crystalline at a place `v | p` with a
Hodge–Tate weight outside `[a, b]` does not factor through `R^{[a,b]}_{D̄,S}`. -/
-- test: ssdet_not_semistable_point
example [CharZero E] [IsLargeFor F E] (S : Set (Place F)) (hS : IsFinitePlaceSet S)
    (hSp : ∀ v : Place F, v.Above (residueChar E) → v ∈ S) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hur : IsUnramifiedOutside S ρ.toMonoidHom) (a b : ℤ) (hab : a ≤ b)
    (x : detDeformationRing S (Determinant.ofHom (reduction ρ.toMonoidHom)) →ₐ[𝒪[E]] 𝒪[E])
    (hx : (detDeformationRing.univ S (Determinant.ofHom (reduction ρ.toMonoidHom))).map
      x.toRingHom = Determinant.ofHom ρ.toMonoidHom)
    (v : Place F) (hv : v.Above (residueChar E))
    (hcris : (crystalline v.Fv E n).Holds (genericC (resPlace ρ v)))
    (ρ' : (deRham v.Fv E n).Carrier) (hρ' : (deRham v.Fv E n).forget ρ' = genericC (resPlace ρ v))
    (τ : v.Fv →+* E) (h : ℤ) (hh : h ∈ hodgeTate ρ' τ) (hout : h < a ∨ b < h) :
    ¬ semistableDetIdeal S (Determinant.ofHom (reduction ρ.toMonoidHom)) a b ≤
      RingHom.ker x.toRingHom := by sorry

end DetRings

/-! ### PL.8/pseudodeformation-tangent-comparison: Tangent spaces of semistable
pseudodeformation rings and Selmer groups -/

section TangentComparison

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

local notation "F⁺" => maximalRealSubfield F

/-- The Selmer group `H¹_𝓔(F, W_m) ⊂ H¹(G_{F,S}, W_m)` of Newton–Thorne 2023 §2.3, for
`W_m = ad ρ ⊗ 𝒪/ϖ^m`: the classes unramified outside `S` whose restriction at each place `v | p`
is the class of a self-extension of `ρ|G_{F_v} ⊗ 𝒪/ϖ^m` that satisfies `IsTorsionSemistable`
with weights in `[a, b]`; no condition is imposed at the places of `S` not above `p`. -/
def torsionSemistableSelmer (S : Set (Place F)) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) (a b : ℤ)
    (m : ℕ) : Submodule 𝒪[E] (contH1 (adMod ρ.toMonoidHom m)) := sorry

/-- The map `tr_m : H¹_𝓔(F, W_m) → Hom_𝒪(𝔮/𝔮², 𝒪/ϖ^m)` of Newton–Thorne 2023, Proposition 2.15,
for the point `x` of `R^{[a,b]}_{D̄,S}` classifying the determinant of `ρ` and `𝔮 = ker x`: it
sends the class of a cocycle `φ` to the classifying map of the determinant of the lift
`ρ_φ = (1 + εφ)ρ` over `𝒪 ⊕ ε ϖ^{-m}𝒪/𝒪`, read as an `𝒪`-linear map `𝔮/𝔮² → 𝒪/ϖ^m`. -/
def traceMap (S : Set (Place F)) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) (a b : ℤ) (m : ℕ)
    (x : semistableDetRing S (Determinant.ofHom (reduction ρ.toMonoidHom)) a b →ₐ[𝒪[E]] 𝒪[E]) :
    torsionSemistableSelmer S ρ a b m →ₗ[𝒪[E]]
      ((RingHom.ker x.toRingHom).Cotangent →ₗ[𝒪[E]] OMod E m) := sorry

/-- **PL.8/pseudodeformation-tangent-comparison (1)** (Newton–Thorne 2023, Proposition 2.15).
For `ρ : G_F → GL_n(𝒪)` with `ρ ⊗ E` absolutely irreducible there is `c ≥ 1`, depending only on
`ρ`, such that for every finite `S ⊇ {v | p}` outside which `ρ` is unramified, every `[a, b]` such
that `ρ` is semistable with Hodge–Tate weights in `[a, b]` at the places above `p`, and every
`m ≥ 1`, the kernel and the cokernel of `tr_m` are killed by `p^c`. -/
theorem pseudodeformation_tangent_comparison_1 [CharZero E] [IsLargeFor F E]
    (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (hirr : IsAbsIrred fun σ => generic ρ.toMonoidHom σ) :
    ∃ c : ℕ, 1 ≤ c ∧ ∀ (S : Set (Place F)) (a b : ℤ) (m : ℕ)
      (x : semistableDetRing S (Determinant.ofHom (reduction ρ.toMonoidHom)) a b →ₐ[𝒪[E]] 𝒪[E]),
      IsFinitePlaceSet S → (∀ v : Place F, v.Above (residueChar E) → v ∈ S) →
      IsUnramifiedOutside S ρ.toMonoidHom →
      (∀ v : Place F, v.Above (residueChar E) →
        IsSemistableInRange (genericC (resPlace ρ v)) a b) →
      1 ≤ m →
      (semistableDetRing.univ S (Determinant.ofHom (reduction ρ.toMonoidHom)) a b).map
        x.toRingHom = Determinant.ofHom ρ.toMonoidHom →
      (∀ φ ∈ LinearMap.ker (traceMap S ρ a b m x), ((residueChar E : 𝒪[E]) ^ c) • φ = 0) ∧
      ∀ y : (RingHom.ker x.toRingHom).Cotangent →ₗ[𝒪[E]] OMod E m,
        ((residueChar E : 𝒪[E]) ^ c) • y ∈ LinearMap.range (traceMap S ρ a b m x) := by sorry

/-- **The conjugate self-dual set-up of Newton–Thorne 2023 §2.4**, for a continuous
`r : G_{F⁺} → 𝒢_n(𝒪)` with `ρ = r|G_F`: a finite set `S` of finite places of `F⁺` containing those
above `p`, all split in `F`, outside which `r` is unramified; `ρ ⊗ E` absolutely irreducible;
integers `a`, `b`, `w` such that `ρ` is semistable with Hodge–Tate weights in `[a, b]` at the
places above `p`, the character `χ ε^w` has finite order and is unramified above `p` for
`χ = ν ∘ r`, and `a + b = w`. -/
structure ConjSelfDualSetup [IsCMField F] [IsLargeFor F E] (r : Gal F⁺ →ₜ* CHT n 𝒪[E])
    (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) where
  /-- The set `S` of places of `F⁺`. -/
  S : Set (Place F⁺)
  finite : IsFinitePlaceSet S
  above_mem : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S
  split : ∀ v ∈ S, v.SplitsIn
  unramified : IsUnramifiedOutside S r.toMonoidHom
  restricts : RestrictsTo r.toMonoidHom ρ.toMonoidHom
  absIrred : IsAbsIrred fun σ => generic ρ.toMonoidHom σ
  /-- The lower bound of the Hodge–Tate weights. -/
  a : ℤ
  /-- The upper bound of the Hodge–Tate weights. -/
  b : ℤ
  /-- The integer `w` with `χ ε^w` of finite order. -/
  w : ℤ
  semistable : ∀ u : Place F, u.Above (residueChar E) →
    IsSemistableInRange (genericC (resPlace ρ u)) a b
  finite_order : ∃ k : ℕ, 0 < k ∧ ∀ σ : Gal F⁺,
    (Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (CHT.nu n 𝒪[E] (r σ)) * cyclo E F⁺ σ ^ w) ^ k = 1
  unramified_above : ∀ v : Place F⁺, v.Above (residueChar E) → ∀ σ ∈ inertia v.Fv,
    Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (CHT.nu n 𝒪[E] (r (v.dec σ))) *
      cyclo E F⁺ (v.dec σ) ^ w = 1
  sum_eq : a + b = w

namespace ConjSelfDualSetup

-- The local notation `F⁺` is not available inside `variable` binders.
variable [IsCMField F] [IsLargeFor F E] {r : Gal (maximalRealSubfield F) →ₜ* CHT n 𝒪[E]}
  {ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]}

/-- The ring `R_S` of the set-up: the conjugate self-dual quotient of `R^{[a,b]}_{D̄,S_F}` for
`D̄` the determinant of the reduction of `ρ`, `S_F` the places of `F` above `S` and `χ = ν ∘ r`. -/
abbrev ring (T : ConjSelfDualSetup r ρ) : Type :=
  conjSelfDualDetRing (placesOver T.S) (Determinant.ofHom (reduction ρ.toMonoidHom)) T.a T.b
    (MonoidHom.comp (CHT.nu n 𝒪[E]) r.toMonoidHom)

/-- `x : R_S → 𝒪` is the point of the determinant of `ρ`; its kernel is `𝔮_S`. -/
def IsPoint (T : ConjSelfDualSetup r ρ) (x : T.ring →ₐ[𝒪[E]] 𝒪[E]) : Prop :=
  (conjSelfDualDetRing.univ (placesOver T.S) (Determinant.ofHom (reduction ρ.toMonoidHom)) T.a
    T.b (MonoidHom.comp (CHT.nu n 𝒪[E]) r.toMonoidHom)).map x.toRingHom =
    Determinant.ofHom ρ.toMonoidHom

/-- The local ring `(R_S)_{(𝔮_S)}` of `R_S` at the kernel `𝔮_S` of a point `x : R_S → 𝒪`. Its
residue field is `E`, because `𝔮_S` is the kernel of a homomorphism onto `𝒪`. -/
abbrev localRing (T : ConjSelfDualSetup r ρ) (x : T.ring →ₐ[𝒪[E]] 𝒪[E]) : Type :=
  @Localization.AtPrime _ _ (RingHom.ker x.toRingHom) (RingHom.ker_isPrime x.toRingHom)

/-- The Selmer group `H¹_{𝓛_S}(F⁺, W_m)` of Newton–Thorne 2023 §2.4, for `W_m = ad r ⊗ 𝒪/ϖ^m`:
the classes of `H¹(G_{F⁺}, W_m)` that are unramified at `v ∉ S`, arbitrary at the places of `S`
not above `p`, and at `v ∈ S` above `p` the classes of the self-extensions of
`ρ|G_{F_ṽ} ⊗ 𝒪/ϖ^m` satisfying `IsTorsionSemistable` with weights in `[a, b]`. -/
def selmerTorsion (T : ConjSelfDualSetup r ρ) (m : ℕ) :
    Submodule 𝒪[E] (contH1 (adjointRepMod r.toMonoidHom m)) := sorry

/-- The map `tr_{m,S} : H¹_{𝓛_S}(F⁺, W_m) → Hom_𝒪(𝔮_S/𝔮_S², 𝒪/ϖ^m)` of Newton–Thorne 2023,
Proposition 2.16: the map induced by `tr_m` on the invariants of `Gal(F/F⁺)`, which acts on the
source through `ad r` and on the target through the involution `D′ ↦ (D′)^{c,∨} ⊗ χ`. -/
def traceMapS (T : ConjSelfDualSetup r ρ) (m : ℕ) (x : T.ring →ₐ[𝒪[E]] 𝒪[E]) :
    T.selmerTorsion m →ₗ[𝒪[E]] ((RingHom.ker x.toRingHom).Cotangent →ₗ[𝒪[E]] OMod E m) := sorry

/-- The Selmer group `H¹_{𝓛_S}(F⁺, W_E) = (lim_m H¹_{𝓛_S}(F⁺, W_m)) ⊗_𝒪 E` of Newton–Thorne 2023
§2.4, the limit being taken along the maps induced by `W_{m+1} → W_m`. -/
def SelmerRat (T : ConjSelfDualSetup r ρ) : Type := sorry

instance (T : ConjSelfDualSetup r ρ) : AddCommGroup T.SelmerRat := sorry

instance (T : ConjSelfDualSetup r ρ) : Module E T.SelmerRat := sorry

/-- The natural map `H¹_{𝓛_S}(F⁺, W_E) → H¹(G_{F⁺}, W_E)`, induced by
`lim_m H¹(G_{F⁺,S}, W_m) = H¹(G_{F⁺,S}, W)`. -/
def selmerRatToH1 (T : ConjSelfDualSetup r ρ) :
    T.SelmerRat →ₗ[E] contH1 (adjointRep (CHT.rat r.toMonoidHom)) := sorry

/-- The map `tr_{E,S} : H¹_{𝓛_S}(F⁺, W_E) → Hom_𝒪(𝔮_S/𝔮_S², E)` of Newton–Thorne 2023,
Proposition 2.17(1): the limit of the maps `tr_{m,S}`, after inverting `p`. -/
def traceMapRat (T : ConjSelfDualSetup r ρ) (x : T.ring →ₐ[𝒪[E]] 𝒪[E]) :
    T.SelmerRat →ₗ[E] ((RingHom.ker x.toRingHom).Cotangent →ₗ[𝒪[E]] E) := sorry

end ConjSelfDualSetup

/-- **PL.8/pseudodeformation-tangent-comparison (2)** (Newton–Thorne 2023, Proposition 2.16).
There is `d ≥ 0`, depending only on `r`, such that in every conjugate self-dual set-up for `r`
and every `m ≥ 1` the kernel and the cokernel of `tr_{m,S}` are killed by `p^d`. -/
theorem pseudodeformation_tangent_comparison_2 [IsCMField F] [CharZero E] [IsLargeFor F E]
    (r : Gal F⁺ →ₜ* CHT n 𝒪[E]) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) :
    ∃ d : ℕ, ∀ (T : ConjSelfDualSetup r ρ) (m : ℕ) (x : T.ring →ₐ[𝒪[E]] 𝒪[E]),
      1 ≤ m → T.IsPoint x →
      (∀ φ ∈ LinearMap.ker (T.traceMapS m x), ((residueChar E : 𝒪[E]) ^ d) • φ = 0) ∧
      ∀ y : (RingHom.ker x.toRingHom).Cotangent →ₗ[𝒪[E]] OMod E m,
        ((residueChar E : 𝒪[E]) ^ d) • y ∈ LinearMap.range (T.traceMapS m x) := by sorry

/-- **PL.8/pseudodeformation-tangent-comparison (3)** (Newton–Thorne 2023, Proposition 2.17).
After inverting `p`: `tr_{E,S} : H¹_{𝓛_S}(F⁺, W_E) → Hom_𝒪(𝔮_S/𝔮_S², E)` is an isomorphism; the
natural map identifies `H¹_{𝓛_S}(F⁺, W_E)` with the geometric Selmer group
`H¹_{g,S}(F⁺, W_E) ⊂ H¹(G_{F⁺,S}, W_E)`; and if `ρ|G_{F_ṽ}` is generic for every `v ∈ S` then
`H¹_{g,S}(F⁺, W_E) = H¹_f(F⁺, W_E)`. -/
theorem pseudodeformation_tangent_comparison_3 [IsCMField F] [CharZero E] [IsLargeFor F E]
    (r : Gal F⁺ →ₜ* CHT n 𝒪[E]) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) (T : ConjSelfDualSetup r ρ)
    (x : T.ring →ₐ[𝒪[E]] 𝒪[E]) (hx : T.IsPoint x) :
    Function.Bijective (T.traceMapRat x) ∧
    (Function.Injective T.selmerRatToH1 ∧
      LinearMap.range T.selmerRatToH1 = adjointSelmerG T.S (CHT.rat r.toMonoidHom)) ∧
    ((∀ u ∈ placesOver T.S, (weilDeligne (genericC (resPlace ρ u))).IsGeneric) →
      adjointSelmerG T.S (CHT.rat r.toMonoidHom) = adjointSelmerF (CHT.rat r.toMonoidHom)) := by
  sorry

-- Not stated here: the `Gal(F/F⁺)`-equivariance of `tr_m` in part (2), for want of an interface
-- for the action of `Gal(F/F⁺)` on `H¹(G_F, W_m)`; and the input Proposition 2.7, which needs the
-- ring `𝒪 ⊕ ε E/𝒪` with its scaling maps `α_k` and determinants over it.

end TangentComparison

/-! ### PL.8/adjoint-selmer-vanishing: Vanishing of adjoint Bloch–Kato Selmer groups of unitary
type -/

section Vanishing

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {n : ℕ}

local notation "F⁺" => maximalRealSubfield F

/-- **PL.8/adjoint-selmer-vanishing** (Newton–Thorne 2023, Theorem A). Let `F` be a CM field and
`π` a regular algebraic cuspidal automorphic representation of `GL_n(𝔸_F)` of unitary type: the
polarized pair is `(π, δ^n_{F/F⁺})`, so `r_{χ,ι} = δ^n_{F/F⁺}`. Let `r : G_{F⁺} → 𝒢_n(E)` be the
extension of `r_{π,ι}` with multiplier `ε^{1-n} δ^n_{F/F⁺}`. Suppose that `E` contains the
eigenvalues of the elements of the image and that `r_{π,ι}(G_{F(ζ_{p^∞})})` is enormous;
`G_{F(ζ_{p^∞})}` is the kernel of the cyclotomic character `ε_p` of `G_F`. Then
`H¹_f(F⁺, ad r_{π,ι}) = 0`. -/
theorem adjoint_selmer_vanishing [IsCMField F] [CharZero E] (π : RACP F n) (ι : E →+* ℂ)
    (hunit : ∀ σ, π.multiplier ι σ = delta F E σ ^ n) (r : Gal F⁺ →ₜ* CHT n E)
    (hr : RestrictsTo r.toMonoidHom (π.galoisRep ι).toMonoidHom)
    (hν : ∀ σ, CHT.nu n E (r σ) = cyclo E F⁺ σ ^ (1 - (n : ℤ)) * delta F E σ ^ n)
    (hsplit : ∀ σ : Gal F, (π.galoisRep ι σ : Matrix (Fin n) (Fin n) E).charpoly.Splits)
    (henorm : (enormous E n).Holds
      (Subgroup.map (π.galoisRep ι).toMonoidHom (cyclo E F).toMonoidHom.ker)) :
    adjointSelmerF r.toMonoidHom = ⊥ := by sorry

/-- **PL.8/adjoint-selmer-vanishing**, the polarized form (Newton–Thorne 2023, Theorem 5.2): the
same vanishing for every regular algebraic cuspidal polarized `(π, χ)` over the CM field `F`,
with `r` the extension of `r_{π,ι}` of multiplier `ε^{1-n} r_{χ,ι}`. -/
theorem adjoint_selmer_vanishing_polarized [IsCMField F] [CharZero E] (π : RACP F n)
    (ι : E →+* ℂ) (r : Gal F⁺ →ₜ* CHT n E)
    (hr : RestrictsTo r.toMonoidHom (π.galoisRep ι).toMonoidHom)
    (hν : ∀ σ, CHT.nu n E (r σ) = cyclo E F⁺ σ ^ (1 - (n : ℤ)) * π.multiplier ι σ)
    (hsplit : ∀ σ : Gal F, (π.galoisRep ι σ : Matrix (Fin n) (Fin n) E).charpoly.Splits)
    (henorm : (enormous E n).Holds
      (Subgroup.map (π.galoisRep ι).toMonoidHom (cyclo E F).toMonoidHom.ker)) :
    adjointSelmerF r.toMonoidHom = ⊥ := by sorry

/-- **PL.8/adjoint-selmer-vanishing**, the patched case (Newton–Thorne 2023, Theorems 4.1 and
4.28). In the set-up of §4.1 — `F/F⁺` unramified at all finite places, `[F⁺ : ℚ]` even, `n ≥ 2`,
`π` of unitary type with an Iwahori-fixed vector at every place above `p`, `S ⊇ S_p` a finite set
of places of `F⁺` split in `F` containing those above which `π` ramifies, a model `ρ` over `𝒪`
extended to `r` with `ν ∘ r = ε^{1-n} δ^n_{F/F⁺}`, and `a + b = n - 1` — the completed local ring
of `R_S` at `𝔮_S` is `E`: the local ring of `R_S` at `𝔮_S` is a field, with residue field `E`
because `𝔮_S` is the kernel of a map onto `𝒪`. -/
theorem adjoint_selmer_vanishing_patched [IsCMField F] [CharZero E] [IsLargeFor F E]
    (π : RACP F n) (ι : E →+* ℂ)
    (hunit : ∀ σ, π.multiplier ι σ = delta F E σ ^ n) (r : Gal F⁺ →ₜ* CHT n 𝒪[E])
    (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E]) (T : ConjSelfDualSetup r ρ) (hn : 2 ≤ n)
    (hw : T.w = (n : ℤ) - 1)
    (hunr : Algebra.FormallyUnramified (𝓞 F⁺) (𝓞 F)) (heven : Even (Module.finrank ℚ F⁺))
    (hπ : Conj (fun σ => generic ρ.toMonoidHom σ) (fun σ => π.galoisRep ι σ))
    (hν : ∀ σ, Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (CHT.nu n 𝒪[E] (r σ)) =
      cyclo E F⁺ σ ^ (1 - (n : ℤ)) * delta F E σ ^ n)
    (hiw : ∀ u : Place F, u.Above (residueChar E) → (iwahoriSpherical u.Fv n).Holds (π.component u))
    (hram : ∀ u : Place F, u ∉ placesOver T.S → (unramifiedIrrep u.Fv n).Holds (π.component u))
    (hsplit : ∀ σ : Gal F, (π.galoisRep ι σ : Matrix (Fin n) (Fin n) E).charpoly.Splits)
    (henorm : (enormous E n).Holds
      (Subgroup.map (π.galoisRep ι).toMonoidHom (cyclo E F).toMonoidHom.ker))
    (x : T.ring →ₐ[𝒪[E]] 𝒪[E]) (hx : T.IsPoint x) :
    IsField (T.localRing x) := by sorry

/-! ### PL.8/pseudodeformation-ring-regular-at-automorphic-point: The pseudodeformation ring is
its residue field at an automorphic point -/

/-- **PL.8/pseudodeformation-ring-regular-at-automorphic-point** (Newton–Thorne 2021 II, proof of
Theorem 2.1; Newton–Thorne 2026, proof of Theorem 4.1; from Newton–Thorne 2023, Theorem A and
Proposition 2.17). Let `F/F⁺` be a CM extension, `S` a finite set of places of `F⁺` containing
those above `p`, all split in `F`, and `P = R_S` the conjugate self-dual semistable
pseudodeformation ring of the set-up `T`, with similitude character `χ = ν ∘ r` and `a + b = w`.
Let `Π′` be a regular algebraic cuspidal polarized automorphic representation of `GL_n(𝔸_F)` with
`r_{Π′,ι} ≅ ρ ⊗ E` and multiplier `χ`, unramified outside `S`, semistable with Hodge–Tate weights
in `[a, b]` above `p` (part of `T`), and with `r_{Π′,ι}(G_{F(ζ_{p^∞})})` enormous. Then, for the
point `𝔭′ = ker(P → 𝒪)` of the determinant of `r_{Π′,ι}`, the local ring `P_{(𝔭′)}` is a field:
it equals its residue field `E`. The absolute irreducibility in `T` follows from the enormous
image. -/
theorem pseudodeformation_ring_regular_at_automorphic_point [IsCMField F] [CharZero E]
    [IsLargeFor F E]
    (π' : RACP F n) (ι : E →+* ℂ) (r : Gal F⁺ →ₜ* CHT n 𝒪[E]) (ρ : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (T : ConjSelfDualSetup r ρ)
    (hπ' : Conj (fun σ => generic ρ.toMonoidHom σ) (fun σ => π'.galoisRep ι σ))
    (hν : ∀ σ, Units.map (algebraMap 𝒪[E] E : 𝒪[E] →* E) (CHT.nu n 𝒪[E] (r σ)) =
      cyclo E F⁺ σ ^ (1 - (n : ℤ)) * π'.multiplier ι σ)
    (hram : ∀ u : Place F, u ∉ placesOver T.S → (unramifiedIrrep u.Fv n).Holds (π'.component u))
    (hsplit : ∀ σ : Gal F, (π'.galoisRep ι σ : Matrix (Fin n) (Fin n) E).charpoly.Splits)
    (henorm : (enormous E n).Holds
      (Subgroup.map (π'.galoisRep ι).toMonoidHom (cyclo E F).toMonoidHom.ker))
    (x : T.ring →ₐ[𝒪[E]] 𝒪[E]) (hx : T.IsPoint x) :
    IsField (T.localRing x) := by sorry

/-! ### PL.8/ordinary-tangent-vectors-h1g: Ordinary tangent vectors of trivial weight lie in
`H¹_g` -/

/-- **PL.8/ordinary-tangent-vectors-h1g** (Newton–Thorne 2021, proof of Theorem 2.27; Geraghty,
Lemma 3.9 = Lemma 3.3.2(1) of the 2010 preprint). Let `r : G_{F⁺,S} → 𝒢_n(E)` be continuous with
`ρ = r|G_F` ordinary of dominant weight `λ` at every place above `p`, and let `rε` be a
deformation of `r` to `𝒢_n(E[ε])` with the same multiplier, unramified outside `S`, such that at
every place `u | p` of `F` the ordinary flag lifts to a stable flag of `ρε` whose graded
characters agree with those of `ρ` on inertia (zero derivative in weight space). Then
`ρε|G_{F_u}` is ordinary of weight `λ_u` over `E[ε]`, hence potentially semistable, stated here as
de Rham; and the class of `rε` lies in `H¹_{g,S}(F⁺, ad ρ)`. -/
theorem ordinary_tangent_vectors_h1g [IsCMField F] [CharZero E] [IsLargeFor F E]
    (S : Set (Place F⁺))
    (hS : IsFinitePlaceSet S) (hSp : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S)
    (r : Gal F⁺ →ₜ* CHT n E) (ρ : Gal F →ₜ* GL (Fin n) E)
    (hρ : RestrictsTo r.toMonoidHom ρ.toMonoidHom) (hur : IsUnramifiedOutside S r.toMonoidHom)
    (lam : (F →+* E) → Fin n → ℤ) (hdom : ∀ τ i j, i ≤ j → lam τ j ≤ lam τ i)
    (hord : IsOrdinaryOfWeight (residueChar E) ρ lam)
    (rε : Gal F⁺ →ₜ* CHT n (DualNumber E)) (ρε : Gal F →* GL (Fin n) (DualNumber E))
    (hlift : IsFixedMultiplierLift r.toMonoidHom rε.toMonoidHom)
    (hρε : RestrictsTo rε.toMonoidHom ρε) (hurε : IsUnramifiedOutside S rε.toMonoidHom)
    (hflag : ∀ u : Place F, u.Above (residueChar E) →
      HasConstantOrdinaryFlagLift (ρε.comp u.dec.toMonoidHom) fun τ => lam (τ.comp u.emb)) :
    (∀ u : Place F, u.Above (residueChar E) →
      (deRhamDual u.Fv E n).Holds (ρε.comp u.dec.toMonoidHom)) ∧
    contH1.ofCocycle (adjointRep r.toMonoidHom)
      (CHT.tangentCocycle r.toMonoidHom rε.toMonoidHom) ∈ adjointSelmerG S r.toMonoidHom := by
  sorry

/-- **PL.8/ordinary-tangent-vectors-h1g**, the consequence used in Newton–Thorne 2021,
Theorem 2.27: if moreover `ρ` is generic at the places above `S` and `H¹_f(F⁺, ad ρ) = 0`, the
class of `rε` is zero, so the map from ordinary tangent vectors to the tangent space of weight
space is injective. -/
theorem ordinary_tangent_vectors_h1g_injective [IsCMField F] [CharZero E] [IsLargeFor F E]
    (S : Set (Place F⁺))
    (hS : IsFinitePlaceSet S) (hSp : ∀ v : Place F⁺, v.Above (residueChar E) → v ∈ S)
    (r : Gal F⁺ →ₜ* CHT n E) (ρ : Gal F →ₜ* GL (Fin n) E)
    (hρ : RestrictsTo r.toMonoidHom ρ.toMonoidHom) (hur : IsUnramifiedOutside S r.toMonoidHom)
    (lam : (F →+* E) → Fin n → ℤ) (hdom : ∀ τ i j, i ≤ j → lam τ j ≤ lam τ i)
    (hord : IsOrdinaryOfWeight (residueChar E) ρ lam)
    (rε : Gal F⁺ →ₜ* CHT n (DualNumber E)) (ρε : Gal F →* GL (Fin n) (DualNumber E))
    (hlift : IsFixedMultiplierLift r.toMonoidHom rε.toMonoidHom)
    (hρε : RestrictsTo rε.toMonoidHom ρε) (hurε : IsUnramifiedOutside S rε.toMonoidHom)
    (hflag : ∀ u : Place F, u.Above (residueChar E) →
      HasConstantOrdinaryFlagLift (ρε.comp u.dec.toMonoidHom) fun τ => lam (τ.comp u.emb))
    (hgen : ∀ u ∈ placesOver S, (weilDeligne (resPlace ρ u)).IsGeneric)
    (hvan : adjointSelmerF r.toMonoidHom = ⊥) :
    contH1.ofCocycle (adjointRep r.toMonoidHom)
      (CHT.tangentCocycle r.toMonoidHom rε.toMonoidHom) = 0 := by sorry

end Vanishing

end TauCeti.Automorphy

namespace TauCeti.Automorphy

/-! ## PL.9: rigid residual representations and lifting from generic local domains -/

section PL9

open IsDedekindDomain

variable {F : Type} [Field F] [NumberField F]
variable {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
variable {N : ℕ}

local notation "F⁺" => maximalRealSubfield F

/-! ### PL.9/rigid-residual-representation: Rigid residual conjugate self-dual representations -/

/-- `Σ⁺_bad`: the primes of `F⁺` above the rational primes that ramify in `F`. -/
def Lifting.badPlaces (F : Type) [Field F] [NumberField F] :
    Set (HeightOneSpectrum (𝓞 (maximalRealSubfield F))) :=
  {v | ∃ p : ℕ, p.Prime ∧ Lifting.IsRamifiedIn p F ∧ (p : 𝓞 (maximalRealSubfield F)) ∈ v.asIdeal}

/-- The similitude character `η^μ ε_ℓ^{1-N}` of `Γ_{F⁺}`, `η = δ_{F/F⁺}` and `μ ∈ ℤ/2`
(Liu–Tian–Xiao–Zhang–Zhu §3.6). -/
def Lifting.similitude (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] (N : ℕ) (μ : ZMod 2) :
    Gal (maximalRealSubfield F) →ₜ* (𝒪[E])ˣ :=
  Lifting.deltaInt F E ^ μ.val * Lifting.cycloInt E (maximalRealSubfield F) ^ (1 - (N : ℤ))

/-- Liu–Tian–Xiao–Zhang–Zhu, Definition 3.1.2: `r : Γ → 𝒢_N(A)` is a lifting of
`r̄ : Γ → 𝒢_N(k)` with similitude character `χ`, for a local `𝒪`-algebra `A` with residue field
`k`: `r` is continuous for the `𝔪_A`-adic topology, `r mod 𝔪_A = r̄` and `ν ∘ r = χ`. -/
def Lifting.IsLiftingWithSimilitude {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    (rbar : Γ →* CHT N 𝓀[E]) (χ : Γ →* (𝒪[E])ˣ) (A : Type) [CommRing A] [IsLocalRing A]
    [Algebra 𝒪[E] A] (r : Γ →* CHT N A) : Prop :=
  (∀ m : ℕ, IsOpen (((CHT.map N (Ideal.Quotient.mk (IsLocalRing.maximalIdeal A ^ m))).comp r).ker :
    Set Γ)) ∧
  (∃ φ : 𝓀[E] →+* IsLocalRing.ResidueField A,
    φ.comp (IsLocalRing.residue 𝒪[E]) = (IsLocalRing.residue A).comp (algebraMap 𝒪[E] A) ∧
    ∀ σ, CHT.map N (IsLocalRing.residue A) (r σ) = CHT.map N φ (rbar σ)) ∧
  ∀ σ, CHT.nu N A (r σ) = Units.map (algebraMap 𝒪[E] A : 𝒪[E] →* A) (χ σ)

/-- Condition (1) of rigidity at one place: every lifting of `r̄_v`, with the given similitude
character, to a complete local Noetherian `𝒪`-algebra with residue field `k` is minimally
ramified. -/
def Lifting.AllLiftingsMinimallyRamified {K : Type} [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (rbar : Gal K →* CHT N 𝓀[E])
    (χ : Gal K →* (𝒪[E])ˣ) : Prop :=
  ∀ (A : Type) [CommRing A] [IsLocalRing A] [IsNoetherianRing A] [Algebra 𝒪[E] A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A],
    Function.Surjective ((IsLocalRing.residue A).comp (algebraMap 𝒪[E] A)) →
    ∀ r : Gal K →* CHT N A, Lifting.IsLiftingWithSimilitude rbar χ A r →
      (Lifting.minimallyRamified rbar A).Holds r

/-- Condition (2) of rigidity at one place, for the matrix `M = r̄^♮_v(φ_w)` and `q = ‖v‖`: the
generalised eigenvalues of `M` contain the pair `{q^{-N}, q^{-N+2}}` exactly once, i.e. each of
the two is a root of the characteristic polynomial of multiplicity one. -/
def Lifting.HasLevelRaisingPair {k : Type*} [Field k] (M : Matrix (Fin N) (Fin N) k) (q : k) :
    Prop :=
  M.charpoly.rootMultiplicity (q⁻¹ ^ N) = 1 ∧ M.charpoly.rootMultiplicity (q⁻¹ ^ N * q ^ 2) = 1

/-- The standing assumptions of Liu–Tian–Xiao–Zhang–Zhu §3.6 under which rigidity is defined:
`N ≥ 2`; `ℓ` an odd prime, unramified in `F`, with `ℓ ≥ N`; `r̄` continuous with
`ν ∘ r̄ = η^μ ε_ℓ^{1-N}`; `Σ⁺_min` and `Σ⁺_lr` finite sets of primes of `F⁺` with `Σ⁺_min`,
`Σ⁺_lr`, `Σ⁺_ℓ` pairwise disjoint and `Σ⁺_min ⊇ Σ⁺_bad`; every `v ∈ Σ⁺_lr` inert in `F` with
`ℓ ∤ ‖v‖² - 1`. -/
def Lifting.IsRigiditySetup (ℓ : ℕ) (rt : Gal F⁺ →* CHT N 𝓀[E]) (μ : ZMod 2)
    (Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))) : Prop :=
  2 ≤ N ∧ ℓ.Prime ∧ Odd ℓ ∧ ¬ Lifting.IsRamifiedIn ℓ F ∧ N ≤ ℓ ∧ IsContinuousResidual rt ∧
  (∀ τ, CHT.nu N 𝓀[E] (rt τ) = Lifting.redChar (Lifting.similitude F E N μ) τ) ∧
  Smin.Finite ∧ Slr.Finite ∧ Disjoint Smin Slr ∧ Disjoint Smin (Lifting.primesAbove F⁺ ℓ) ∧
  Disjoint Slr (Lifting.primesAbove F⁺ ℓ) ∧ Lifting.badPlaces F ⊆ Smin ∧
  ∀ v ∈ Slr, Lifting.IsInertIn v F ∧ ¬ ℓ ∣ Lifting.primeNorm v ^ 2 - 1

/-- **PL.9/rigid-residual-representation** (Liu–Tian–Xiao–Zhang–Zhu, Definition 3.6.1).
`r̄ : Γ_{F⁺} → 𝒢_N(k)`, with `r̄⁻¹(GL_N(k) × k^×) = Γ_F`, similitude character `η^μ ε_ℓ^{1-N}` and
`GL_N`-component `r̄^♮` of `r̄|Γ_F`, is rigid for `(Σ⁺_min, Σ⁺_lr)` if, under the standing
assumptions `Lifting.IsRigiditySetup`:
(1) for `v ∈ Σ⁺_min`, every lifting of `r̄_v` is minimally ramified;
(2) for `v ∈ Σ⁺_lr`, with `w` the place of `F` above `v` and `φ_w` an arithmetic Frobenius, `r̄_v`
is unramified and the generalised eigenvalues of `r̄^♮_v(φ_w)` contain the pair
`{‖v‖^{-N}, ‖v‖^{-N+2}}` exactly once;
(3) for `v ∈ Σ⁺_ℓ`, `r̄^♮_v` is regular Fontaine–Laffaille crystalline;
(4) `r̄_v` is unramified at every nonarchimedean `v` outside `Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ`.
The unramifiedness in (2) is the standing assumption of §3.5 of the source. Local conditions at a
prime `v` are imposed on every completion at `v`. -/
def IsRigid (ℓ : ℕ) (rt : Gal F⁺ →* CHT N 𝓀[E]) (μ : ZMod 2)
    (Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))) : Prop :=
  Lifting.IsRigiditySetup ℓ rt μ Smin Slr ∧
  ∃ rbarNat : Gal F →* GL (Fin N) 𝓀[E],
    Lifting.CHT.Extends (rt : Gal F⁺ → CHT N 𝓀[E]) ⇑rbarNat ∧
    (∀ v ∈ Smin, ∀ w : Place F⁺, Lifting.Place.IsAt w v →
      Lifting.AllLiftingsMinimallyRamified (Lifting.resPlaceHom rt w)
        (resPlace (Lifting.similitude F E N μ) w).toMonoidHom) ∧
    (∀ v ∈ Slr, (∀ w : Place F⁺, Lifting.Place.IsAt w v →
        IsUnramified (Lifting.resPlaceHom rt w)) ∧
      ∀ u : Place F, Lifting.Place.IsOver u v →
        Lifting.HasLevelRaisingPair
          (rbarNat (u.dec (geomFrob u.Fv)⁻¹) : Matrix (Fin N) (Fin N) 𝓀[E])
          (Lifting.primeNorm v : 𝓀[E])) ∧
    (∀ v ∈ Lifting.primesAbove F⁺ ℓ, ∀ u : Place F, Lifting.Place.IsOver u v →
      (Lifting.fontaineLaffaille u.Fv E N).Holds (Lifting.resPlaceHom rbarNat u)) ∧
    ∀ v : HeightOneSpectrum (𝓞 F⁺), v ∉ Smin → v ∉ Slr → v ∉ Lifting.primesAbove F⁺ ℓ →
      ∀ w : Place F⁺, Lifting.Place.IsAt w v → IsUnramified (Lifting.resPlaceHom rt w)

/-- The polarized global deformation problem
`𝒮 = (r̄, η^μ ε_ℓ^{1-N}, Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ, {D_v})` attached to a rigid `r̄`: `D_v` is all
liftings for `v ∈ Σ⁺_min`, the problem `D^ram` of Liu–Tian–Xiao–Zhang–Zhu, Definition 3.5.1 for
`v ∈ Σ⁺_lr`, and `D^FL` of their Definition 3.2.5 for `v ∈ Σ⁺_ℓ`. When `Σ⁺_lr ≠ ∅` take `μ` even.
It is a problem in the sense of GlobalGaloisDeformations G7/polarized-deformation-problem once
that notion allows places that do not split in `F`. -/
def IsRigid.globalProblem [IsCMField F] {ℓ : ℕ} {rt : Gal F⁺ →* CHT N 𝓀[E]} {μ : ZMod 2}
    {Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))} (h : IsRigid ℓ rt μ Smin Slr) :
    DefProblem F E N 𝒪[E] := sorry

/-- If `r̄` is rigid for `(Σ⁺_min, Σ⁺_lr)` and `𝔭` is a prime of `F⁺` outside
`Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ`, inert in `F`, with `ℓ ∤ ‖𝔭‖² - 1` and such that the generalised
eigenvalues of `r̄^♮_𝔭(φ_w)` contain the pair `{‖𝔭‖^{-N}, ‖𝔭‖^{-N+2}}` exactly once, then `r̄` is
rigid for `(Σ⁺_min, Σ⁺_lr ∪ {𝔭})`. The two global problems differ at `𝔭`: unramified liftings for
the first pair, `D^ram` for the second. -/
theorem IsRigid.mono [IsCMField F] {ℓ : ℕ} {rt : Gal F⁺ →* CHT N 𝓀[E]} {μ : ZMod 2}
    {Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))} (h : IsRigid ℓ rt μ Smin Slr)
    (𝔭 : HeightOneSpectrum (𝓞 F⁺)) (h1 : 𝔭 ∉ Smin) (h2 : 𝔭 ∉ Slr)
    (h3 : 𝔭 ∉ Lifting.primesAbove F⁺ ℓ) (hinert : Lifting.IsInertIn 𝔭 F)
    (hℓ : ¬ ℓ ∣ Lifting.primeNorm 𝔭 ^ 2 - 1) (rbarNat : Gal F →* GL (Fin N) 𝓀[E])
    (hnat : Lifting.CHT.Extends (rt : Gal F⁺ → CHT N 𝓀[E]) ⇑rbarNat)
    (hpair : ∀ u : Place F, Lifting.Place.IsOver u 𝔭 →
      Lifting.HasLevelRaisingPair
        (rbarNat (u.dec (geomFrob u.Fv)⁻¹) : Matrix (Fin N) (Fin N) 𝓀[E])
        (Lifting.primeNorm 𝔭 : 𝓀[E])) :
    IsRigid ℓ rt μ Smin (Slr ∪ {𝔭}) := by
  sorry

/-- A rigid `r̄` is unramified at every nonarchimedean place outside `Σ⁺_min ∪ Σ⁺_ℓ`: outside the
three sets by condition (4), and at `Σ⁺_lr` by condition (2). -/
theorem IsRigid.unramified_outside {ℓ : ℕ} {rt : Gal F⁺ →* CHT N 𝓀[E]} {μ : ZMod 2}
    {Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))} (h : IsRigid ℓ rt μ Smin Slr)
    (v : HeightOneSpectrum (𝓞 F⁺)) (hv : v ∉ Smin) (hvℓ : v ∉ Lifting.primesAbove F⁺ ℓ)
    (w : Place F⁺) (hw : Lifting.Place.IsAt w v) : IsUnramified (Lifting.resPlaceHom rt w) := by
  sorry

/-- At `v ∈ Σ⁺_ℓ`, `r̄^♮_v` is regular Fontaine–Laffaille crystalline: after an unramified
extension of the coefficient field it is crystalline with regular Fontaine–Laffaille weights in
some interval `[a, b]` with `0 ≤ b - a ≤ ℓ - 2`. No weight `ξ` enters the definition; the bound
`ℓ ≥ (b_ξ - a_ξ) + 2` is the separate hypothesis (D0) of PL.9/rigid-r-equals-t. -/
theorem IsRigid.fontaineLaffaille {ℓ : ℕ} {rt : Gal F⁺ →* CHT N 𝓀[E]} {μ : ZMod 2}
    {Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))} (h : IsRigid ℓ rt μ Smin Slr)
    (rbarNat : Gal F →* GL (Fin N) 𝓀[E])
    (hnat : Lifting.CHT.Extends (rt : Gal F⁺ → CHT N 𝓀[E]) ⇑rbarNat)
    (v : HeightOneSpectrum (𝓞 F⁺)) (hv : v ∈ Lifting.primesAbove F⁺ ℓ) (u : Place F)
    (hu : Lifting.Place.IsOver u v) :
    (Lifting.fontaineLaffaille u.Fv E N).Holds (Lifting.resPlaceHom rbarNat u) := by
  sorry

/- Rigidity for `(∅, ∅)` cannot occur, since `Σ⁺_min ⊇ Σ⁺_bad ≠ ∅`. The degenerate case instead:
if `Σ⁺_lr = ∅`, `Σ⁺_min = Σ⁺_bad`, `r̄` is unramified outside `Σ⁺_bad ∪ Σ⁺_ℓ`, `r̄^♮_v` is regular
Fontaine–Laffaille crystalline for `v ∈ Σ⁺_ℓ` and every lifting of `r̄_v` is minimally ramified
for each `v ∈ Σ⁺_bad`, then `r̄` is rigid for `(Σ⁺_bad, ∅)`; condition (2) is empty. -/
-- test: rigid_empty_sets
example [IsCMField F] {ℓ : ℕ} (rt : Gal F⁺ →* CHT N 𝓀[E]) (μ : ZMod 2) :
    ¬ IsRigid ℓ rt μ ∅ ∅ ∧
    (2 ≤ N → ℓ.Prime → Odd ℓ → ¬ Lifting.IsRamifiedIn ℓ F → N ≤ ℓ → IsContinuousResidual rt →
      (∀ τ, CHT.nu N 𝓀[E] (rt τ) = Lifting.redChar (Lifting.similitude F E N μ) τ) →
      ∀ rbarNat : Gal F →* GL (Fin N) 𝓀[E],
        Lifting.CHT.Extends (rt : Gal F⁺ → CHT N 𝓀[E]) ⇑rbarNat →
        (∀ v : HeightOneSpectrum (𝓞 F⁺), v ∉ Lifting.badPlaces F →
          v ∉ Lifting.primesAbove F⁺ ℓ → ∀ w : Place F⁺, Lifting.Place.IsAt w v →
          IsUnramified (Lifting.resPlaceHom rt w)) →
        (∀ v ∈ Lifting.primesAbove F⁺ ℓ, ∀ u : Place F, Lifting.Place.IsOver u v →
          (Lifting.fontaineLaffaille u.Fv E N).Holds (Lifting.resPlaceHom rbarNat u)) →
        (∀ v ∈ Lifting.badPlaces F, ∀ w : Place F⁺, Lifting.Place.IsAt w v →
          Lifting.AllLiftingsMinimallyRamified (Lifting.resPlaceHom rt w)
            (resPlace (Lifting.similitude F E N μ) w).toMonoidHom) →
        IsRigid ℓ rt μ (Lifting.badPlaces F) ∅) := by
  sorry

/- For `N = 2` and `v ∈ Σ⁺_lr` with `q = ‖v‖`, condition (2) asks that `r̄^♮_v(φ_w)` have
generalised eigenvalues `{q^{-2}, 1}`, each with multiplicity one. -/
-- test: rigid_eigenvalue_pair
example [IsCMField F] {ℓ : ℕ} {rt : Gal F⁺ →* CHT 2 𝓀[E]} {μ : ZMod 2}
    {Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))} (h : IsRigid ℓ rt μ Smin Slr)
    (rbarNat : Gal F →* GL (Fin 2) 𝓀[E])
    (hnat : Lifting.CHT.Extends (rt : Gal F⁺ → CHT 2 𝓀[E]) ⇑rbarNat)
    (v : HeightOneSpectrum (𝓞 F⁺)) (hv : v ∈ Slr) (u : Place F)
    (hu : Lifting.Place.IsOver u v) :
    (rbarNat (u.dec (geomFrob u.Fv)⁻¹) : Matrix (Fin 2) (Fin 2) 𝓀[E]).charpoly =
      (Polynomial.X - Polynomial.C ((Lifting.primeNorm v : 𝓀[E])⁻¹ ^ 2)) *
        (Polynomial.X - Polynomial.C 1) := by
  sorry

/- If `r̄^♮_v(φ_w)` has the pair `{‖v‖^{-N}, ‖v‖^{-N+2}}` occurring twice among its generalised
eigenvalues (possible for `N ≥ 4`), `r̄` is not rigid at `v ∈ Σ⁺_lr`. -/
-- test: not_rigid_repeated_pair
example [IsCMField F] {ℓ : ℕ} {rt : Gal F⁺ →* CHT N 𝓀[E]} {μ : ZMod 2}
    {Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))} (rbarNat : Gal F →* GL (Fin N) 𝓀[E])
    (hnat : Lifting.CHT.Extends (rt : Gal F⁺ → CHT N 𝓀[E]) ⇑rbarNat)
    (v : HeightOneSpectrum (𝓞 F⁺)) (hv : v ∈ Slr) (u : Place F)
    (hu : Lifting.Place.IsOver u v)
    (h2 : 2 ≤ (rbarNat (u.dec (geomFrob u.Fv)⁻¹) :
          Matrix (Fin N) (Fin N) 𝓀[E]).charpoly.rootMultiplicity
            ((Lifting.primeNorm v : 𝓀[E])⁻¹ ^ N) ∧
      2 ≤ (rbarNat (u.dec (geomFrob u.Fv)⁻¹) :
          Matrix (Fin N) (Fin N) 𝓀[E]).charpoly.rootMultiplicity
            ((Lifting.primeNorm v : 𝓀[E])⁻¹ ^ N * (Lifting.primeNorm v : 𝓀[E]) ^ 2)) :
    ¬ IsRigid ℓ rt μ Smin Slr := by
  sorry

/- If `r̄^♮ = r̄|Γ_F` is absolutely irreducible, the global problem `𝒮` of a rigid `r̄` has a
universal deformation ring `R^univ_𝒮` (Liu–Tian–Xiao–Zhang–Zhu, Proposition 3.1.7), and its
residual representation is `r̄`. -/
-- test: rigid_compatibility_global
example [IsCMField F] {ℓ : ℕ} {rt : Gal F⁺ →* CHT N 𝓀[E]} {μ : ZMod 2}
    {Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))} (h : IsRigid ℓ rt μ Smin Slr)
    (hrt : IsContinuousResidual rt) (rbarNat : Gal F →* GL (Fin N) 𝓀[E])
    (hnat : Lifting.CHT.Extends (rt : Gal F⁺ → CHT N 𝓀[E]) ⇑rbarNat)
    (hirr : IsAbsIrred ⇑rbarNat) :
    Lifting.DefProblem.IsRepresentable h.globalProblem ∧ h.globalProblem.resid = rt := by
  sorry

/-! ### PL.9/rigid-r-equals-t: The almost minimal integral R = T theorem for rigid residual
representations -/

/-- `T_𝔪`: the localisation at a prime `𝔪` of the image `T = 𝕋/Ann(H)` of a commutative ring `𝕋`
in the endomorphisms of a `𝕋`-module `H`. -/
abbrev Lifting.LocalizedImage (T : Type*) [CommRing T] (H : Type*) [AddCommGroup H] [Module T H]
    (𝔪 : Ideal T) [𝔪.IsPrime] : Type _ :=
  Localization.AtPrime 𝔪 ⧸ (Module.annihilator T H).map (algebraMap T (Localization.AtPrime 𝔪))

/-- **PL.9/rigid-r-equals-t** (Liu–Tian–Xiao–Zhang–Zhu, Theorem 3.6.3). `F/F⁺` CM, `N ≥ 2`, `ℓ`
odd, `ξ ∈ (ℤ^N_≤)^{Σ_∞}` with `ξ_{τ,i} = -ξ_{τ^c,N+1-i}`, `r̄` with similitude character
`η^μ ε_ℓ^{1-N}`, sets `Σ⁺_min`, `Σ⁺_lr` as in PL.9/rigid-residual-representation with `Σ⁺_lr = ∅`
if `N` is odd. `V` a hermitian space of rank `N`, not split at every `v ∈ Σ⁺_lr`; `K` a neat open
compact subgroup, special maximal at `Σ⁺_lr` and the stabiliser of a self-dual lattice outside
`Σ⁺_min ∪ Σ⁺_lr`; `Σ⁺ ⊇ Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ` finite and `𝔪` the kernel of the character
`𝕋^{Σ⁺}_N → k` attached to `r̄` by the Frobenius normalisation of the source. Assume
(D0) `ℓ` odd, unramified in `F`, `ℓ ≥ (b_ξ - a_ξ) + 2`, where `a_ξ = min ξ_{τ,1}` and
`b_ξ = max ξ_{τ,N} + N - 1`; (D1) `ℓ ≥ 2(N + 1)`; (D2) `r̄^♮|Gal(F̄/F(ζ_ℓ))` absolutely
irreducible; (D3) `r̄` rigid for `(Σ⁺_min, Σ⁺_lr)`; (D4) for every finite `Σ⁺' ⊇ Σ⁺` and every
open compact `K' ⊆ K` with `K'_v = K_v` for `v ∉ Σ⁺'`, the cohomology
`H^d_ét(Sh(V, K'), L_ξ ⊗ k)` localised at `𝕋^{Σ⁺'}_N ∩ 𝔪` vanishes for all `d ≠ d(V)`. Let `T` be
the image of `𝕋^{Σ⁺}_N` in the endomorphisms of `H^{d(V)}_ét(Sh(V, K), L_ξ)`. If `T_𝔪 ≠ 0`, then
(1) `R^univ_𝒮 ≅ T_𝔪`, and these are complete intersections, finite and flat over `𝒪`;
(2) `H^{d(V)}_ét(Sh(V, K), L_ξ)_𝔪` is a finite free `T_𝔪`-module; (3) `μ ≡ N mod 2`.
The isomorphism of the source is the one classifying the Galois representation over `T_𝔪`; only
its existence is stated. The source's hypothesis that the algebraic representation attached to
`ξ` is defined over `ι_ℓ⁻¹ E` is replaced by the sufficient condition that `E` contains the image
of every embedding of `F`. The condition `K'_v = K_v` for `v ∉ Σ⁺'` is written as: `K'` contains
the elements of `K` with trivial components at `Σ⁺'`. -/
theorem rigid_r_equals_t [IsCMField F] [IsLargeFor F E] {ℓ : ℕ} [ResChar E ℓ] (ι : E →+* ℂ)
    (hN : 2 ≤ N) (ξ : (F →+* ℂ) → Fin N → ℤ) (hξmono : ∀ τ, Monotone (ξ τ))
    (hξ : ∀ τ i, ξ τ i = -ξ (τ.comp (Lifting.cmConj F)) (Fin.rev i))
    (rt : Gal F⁺ →* CHT N 𝓀[E]) (hrt : IsContinuousResidual rt) (μ : ZMod 2)
    (Smin Slr : Set (HeightOneSpectrum (𝓞 F⁺))) (hodd : Odd N → Slr = ∅)
    (rbarNat : Gal F →* GL (Fin N) 𝓀[E])
    (hnat : Lifting.CHT.Extends (rt : Gal F⁺ → CHT N 𝓀[E]) ⇑rbarNat)
    (V : Lifting.HermitianSpace F N) (hV : ∀ v ∈ Slr, V.nonsplit.Holds v)
    (K : Subgroup V.adelicGroup) (hKo : IsOpen (K : Set V.adelicGroup))
    (hKc : IsCompact (K : Set V.adelicGroup)) (hKneat : V.neat.Holds K)
    (hKlr : ∀ v ∈ Slr, (V.specialMaximalAt v).Holds K)
    (hKhyp : ∀ v, v ∉ Smin → v ∉ Slr → (V.hyperspecialAt v).Holds K)
    (S : Set (HeightOneSpectrum (𝓞 F⁺))) (hSfin : S.Finite)
    (hS : Smin ∪ Slr ∪ Lifting.primesAbove F⁺ ℓ ⊆ S)
    (𝔪 : Ideal (Lifting.unitaryHecke F N S E)) [𝔪.IsMaximal]
    (h𝔪 : 𝔪 = RingHom.ker (Lifting.unitaryHecke.residualCharacter S rbarNat))
    (hD0 : Odd ℓ ∧ ¬ Lifting.IsRamifiedIn ℓ F ∧
      ∀ (τ τ' : F →+* ℂ) (i j : Fin N), ξ τ' j - ξ τ i + ((N : ℤ) - 1) + 2 ≤ (ℓ : ℤ))
    (hD1 : 2 * (N + 1) ≤ ℓ)
    (hD2 : IsAbsIrred ⇑(resFieldHom rbarNat (algebraMap F (CyclotomicField ℓ F))))
    (hD3 : IsRigid ℓ rt μ Smin Slr)
    (hD4 : ∀ (S' : Set (HeightOneSpectrum (𝓞 F⁺))) (hSS' : S ⊆ S'), S'.Finite →
      ∀ K' : Subgroup V.adelicGroup, IsOpen (K' : Set V.adelicGroup) →
        IsCompact (K' : Set V.adelicGroup) → K' ≤ K →
        (∀ g ∈ K, (∀ v ∈ S', V.proj v g = 1) → g ∈ K') →
        ∀ d : ℕ, d ≠ V.shimuraDim → ∀ x : Lifting.etaleCohomologyMod V K' ξ ι d,
          ∃ t : Lifting.unitaryHecke F N S' E,
            Lifting.unitaryHecke.restrict hSS' t ∉ 𝔪 ∧ t • x = 0)
    (hne : Module.annihilator (Lifting.unitaryHecke F N S E)
      (Lifting.etaleCohomology V K ξ ι V.shimuraDim) ≤ 𝔪) :
    Nonempty (hD3.globalProblem.univRing ≃ₐ[𝒪[E]]
        Lifting.LocalizedImage (Lifting.unitaryHecke F N S E)
          (Lifting.etaleCohomology V K ξ ι V.shimuraDim) 𝔪) ∧
      Lifting.IsFiniteFlatCompleteIntersection 𝒪[E] hD3.globalProblem.univRing ∧
      (∃ r : ℕ, Nonempty
        (LocalizedModule 𝔪.primeCompl (Lifting.etaleCohomology V K ξ ι V.shimuraDim)
          ≃ₗ[Localization.AtPrime 𝔪]
          (Fin r → Lifting.LocalizedImage (Lifting.unitaryHecke F N S E)
            (Lifting.etaleCohomology V K ξ ι V.shimuraDim) 𝔪))) ∧
      μ = (N : ZMod 2) := by
  sorry

/-! ### PL.9/rigidity-for-almost-all-primes: Rigidity and residual irreducibility for almost all
primes -/

/-- The matrix of `Sym^{N-1}` of `g = (a b; c d) ∈ M₂(R)` in the basis `x^{N-1-i} y^i`,
`0 ≤ i < N`, of the forms of degree `N - 1`, on which `g` acts by `x ↦ a x + c y`,
`y ↦ b x + d y`; forms are written in the variable `X = x/y`. -/
def Lifting.symPowerMatrix (N : ℕ) {R : Type*} [CommRing R] (g : Matrix (Fin 2) (Fin 2) R) :
    Matrix (Fin N) (Fin N) R :=
  Matrix.of fun k i =>
    ((Polynomial.C (g 0 0) * Polynomial.X + Polynomial.C (g 1 0)) ^ (N - 1 - (i : ℕ)) *
      (Polynomial.C (g 0 1) * Polynomial.X + Polynomial.C (g 1 1)) ^ (i : ℕ)).coeff
      (N - 1 - (k : ℕ))

/-- The symmetric power `Sym^{N-1} : GL₂(R) → GL_N(R)`. -/
def Lifting.symPower (N : ℕ) (R : Type*) [CommRing R] : GL (Fin 2) R →* GL (Fin N) R where
  toFun g := ⟨Lifting.symPowerMatrix N (g : Matrix (Fin 2) (Fin 2) R),
    Lifting.symPowerMatrix N ((g⁻¹ : GL (Fin 2) R) : Matrix (Fin 2) (Fin 2) R),
    by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- The elliptic curve `A` over a number field `K` has good reduction at the prime `v`: some
Weierstrass equation of `A` has `v`-integral coefficients and discriminant a `v`-unit. -/
def Lifting.HasGoodReductionAt {K : Type} [Field K] [NumberField K] (A : WeierstrassCurve K)
    (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∃ C : WeierstrassCurve.VariableChange K,
    v.valuation K (C • A).a₁ ≤ 1 ∧ v.valuation K (C • A).a₂ ≤ 1 ∧ v.valuation K (C • A).a₃ ≤ 1 ∧
    v.valuation K (C • A).a₄ ≤ 1 ∧ v.valuation K (C • A).a₆ ≤ 1 ∧ v.valuation K (C • A).Δ = 1

/-- The homomorphism `r_{A,ℓ} : Γ_{F⁺} → 𝒢_N(ℤ_ℓ)` of Liu–Tian–Xiao–Zhang–Zhu §4.1 attached to
an elliptic curve `A` over `F⁺`: the continuous extension of `Sym^{N-1} ρ_{A,ℓ}|Γ_F` with similitude
character `η^N ε_ℓ^{1-N}`, given in a suitable basis by
`γ ↦ (Sym^{N-1} ρ_{A,ℓ}(γ), η^{N-1} ε_ℓ^{1-N}(γ)) 𝔠(γ)`, where `𝔠(γ) = j` exactly when
`γ ∉ Γ_F`. It is specified by `Lifting.ellipticCHT_spec`. -/
def Lifting.ellipticCHT [IsCMField F] (A : WeierstrassCurve F⁺) [A.IsElliptic] (N ℓ : ℕ)
    [Fact ℓ.Prime] : Gal F⁺ →ₜ* CHT N 𝒪[ℚ_[ℓ]] := sorry

/-- `r_{A,ℓ}` extends a representation conjugate to `Sym^{N-1} ρ_{A,ℓ}|Γ_F`, and its similitude
character is `η^N ε_ℓ^{1-N}`. -/
theorem Lifting.ellipticCHT_spec [IsCMField F] (A : WeierstrassCurve F⁺) [A.IsElliptic]
    (N ℓ : ℕ) [Fact ℓ.Prime] :
    (∃ ρ : Gal F →* GL (Fin N) 𝒪[ℚ_[ℓ]],
      Lifting.CHT.Extends (Lifting.ellipticCHT A N ℓ : Gal F⁺ → CHT N 𝒪[ℚ_[ℓ]]) ⇑ρ ∧
      Conj (ρ : Gal F → GL (Fin N) 𝒪[ℚ_[ℓ]]) fun σ =>
        Lifting.symPower N 𝒪[ℚ_[ℓ]] (Lifting.tateCohomology A ℓ (Lifting.toPlus F σ))) ∧
    ∀ τ, CHT.nu N 𝒪[ℚ_[ℓ]] (Lifting.ellipticCHT A N ℓ τ) =
      Lifting.similitude F ℚ_[ℓ] N (N : ZMod 2) τ := by
  sorry

/-- **PL.9/rigidity-for-almost-all-primes**, part (1) (Liu–Tian–Xiao–Zhang–Zhu,
Corollary 4.1.2). `A` an elliptic curve over `F⁺`, `N ≥ 2`, `Σ⁺` a finite set of nonarchimedean
places of `F⁺` containing `Σ⁺_bad` such that `A` has good reduction outside `Σ⁺`. Then for all
but finitely many `ℓ`, the reduction `r̄_{A,ℓ}` of `r_{A,ℓ}` is rigid for `(Σ⁺, ∅)`, with
`𝒪 = ℤ_ℓ`. -/
theorem rigidity_for_almost_all_primes_1 [IsCMField F] (A : WeierstrassCurve F⁺) [A.IsElliptic]
    (hN : 2 ≤ N) (S : Set (HeightOneSpectrum (𝓞 F⁺))) (hSfin : S.Finite)
    (hbad : Lifting.badPlaces F ⊆ S) (hgood : ∀ v, v ∉ S → Lifting.HasGoodReductionAt A v) :
    ∃ T : Finset ℕ, ∀ (ℓ : ℕ) [Fact ℓ.Prime] [ResChar ℚ_[ℓ] ℓ], ℓ ∉ T →
      IsRigid ℓ (Lifting.CHT.reduction (Lifting.ellipticCHT A N ℓ).toMonoidHom) (N : ZMod 2) S
        ∅ := by
  sorry

/-- **PL.9/rigidity-for-almost-all-primes**, part (2) (Liu–Tian–Xiao–Zhang–Zhu,
Proposition 4.2.3). Let `N ≥ 2` and `σ_w` a supercuspidal representation of `GL_N(F_w)` at a
nonarchimedean place `w` of `F`, and `E ⊂ ℂ` a number field. There is a finite set `Λ₁` of primes
of `E`, depending only on `σ_w`, such that for every RACSDC `Π` with `Π_w ≅ σ_w` and strong
coefficient field `E`: `ρ_{Π,λ}` is residually absolutely irreducible for `λ ∉ Λ₁`, and there is
a finite set `Λ₂ ⊇ Λ₁` such that `ρ̄_{Π,λ}|Gal(F̄/F(ζ_ℓ))` is absolutely irreducible for
`λ ∉ Λ₂`, `ℓ` being the residue characteristic of `λ`. A prime `λ` of `E` enters through a
completion `lam` of `E` at it and an embedding `ι : E_λ → ℂ` extending `E ⊂ ℂ`. -/
theorem rigidity_for_almost_all_primes_2 [IsCMField F] (hN : 2 ≤ N)
    (Ec : Lifting.CoefficientField) (w : Place F) (σw : SmoothIrrep w.Fv N)
    (hσ : (supercuspidalIrrep w.Fv N).Holds σw) :
    ∃ L₁ : Finset (HeightOneSpectrum (𝓞 Ec.carrier)),
      ∀ π : RACP F N, (Lifting.racsdc F N).Holds π →
        (Lifting.strongCoefficientField π).Holds Ec → π.component w = σw →
        (∀ (𝔩 : HeightOneSpectrum (𝓞 Ec.carrier)) (lam : Place Ec.carrier)
            (ι : lam.Fv →+* ℂ), Lifting.Place.IsAt lam 𝔩 → ι.comp lam.emb = Ec.emb → 𝔩 ∉ L₁ →
            IsAbsIrred ⇑(π.residualRep ι)) ∧
        ∃ L₂ : Finset (HeightOneSpectrum (𝓞 Ec.carrier)), L₁ ⊆ L₂ ∧
          ∀ (𝔩 : HeightOneSpectrum (𝓞 Ec.carrier)) (lam : Place Ec.carrier)
            (ι : lam.Fv →+* ℂ) (ℓ : ℕ), Lifting.Place.IsAt lam 𝔩 → ι.comp lam.emb = Ec.emb →
            ℓ.Prime → lam.Above ℓ → 𝔩 ∉ L₂ →
            IsAbsIrred ⇑(resFieldHom (π.residualRep ι) (algebraMap F (CyclotomicField ℓ F))) := by
  sorry

/-- **PL.9/rigidity-for-almost-all-primes**, part (3) (Liu–Tian–Xiao–Zhang–Zhu, Theorem 4.2.6).
`Π` a RACSDC representation of `GL_N(𝔸_F)`, `N ≥ 2`, with `Π_w` supercuspidal at some
nonarchimedean place `w` of `F`, `E ⊂ ℂ` a strong coefficient field of `Π`, and `Σ⁺` a finite set
of nonarchimedean places of `F⁺` containing `Σ⁺_Π`, i.e. containing `Σ⁺_bad` and such that `Π` is
unramified at the places of `F` not above `Σ⁺`. Then for all but finitely many primes `λ` of
`E`: `ρ_{Π,λ}` is residually absolutely irreducible, `ρ̄_{Π,λ}|Gal(F̄/F(ζ_ℓ))` is absolutely
irreducible, and `ρ̄_{Π,λ}` has an extension `r̄_{Π,λ} : Γ_{F⁺} → 𝒢_N(𝒪_E/λ)` with similitude
character `η^N ε_ℓ^{1-N}` which is rigid for `(Σ⁺, ∅)`, with `𝒪` the ring of integers of
`E_λ`. -/
theorem rigidity_for_almost_all_primes_3 [IsCMField F] (hN : 2 ≤ N) (π : RACP F N)
    (hπ : (Lifting.racsdc F N).Holds π) (Ec : Lifting.CoefficientField)
    (hEc : (Lifting.strongCoefficientField π).Holds Ec)
    (hsc : ∃ w : Place F, (supercuspidalIrrep w.Fv N).Holds (π.component w))
    (S : Set (HeightOneSpectrum (𝓞 F⁺))) (hSfin : S.Finite) (hbad : Lifting.badPlaces F ⊆ S)
    (hunr : ∀ v : HeightOneSpectrum (𝓞 F⁺), v ∉ S → ∀ u : Place F, Lifting.Place.IsOver u v →
      (unramifiedIrrep u.Fv N).Holds (π.component u)) :
    ∃ L : Finset (HeightOneSpectrum (𝓞 Ec.carrier)),
      ∀ (𝔩 : HeightOneSpectrum (𝓞 Ec.carrier)) (lam : Place Ec.carrier) (ι : lam.Fv →+* ℂ)
        (ℓ : ℕ) [ResChar lam.Fv ℓ], Lifting.Place.IsAt lam 𝔩 → ι.comp lam.emb = Ec.emb →
        ℓ.Prime → 𝔩 ∉ L →
        IsAbsIrred ⇑(π.residualRep ι) ∧
        IsAbsIrred ⇑(resFieldHom (π.residualRep ι) (algebraMap F (CyclotomicField ℓ F))) ∧
        ∃ rt : Gal F⁺ →* CHT N 𝓀[lam.Fv],
          Lifting.CHT.Extends (rt : Gal F⁺ → CHT N 𝓀[lam.Fv]) ⇑(π.residualRep ι) ∧
          IsRigid ℓ rt (N : ZMod 2) S ∅ := by
  sorry

/-! ### PL.9/generic-local-domain-lifting: Modularity lifting from polynomially generic local
domains -/

/-- The set of the weights `λ_τ + η`, `η = (n - 1, …, 1, 0)`, over the embeddings `τ` of `F`: the
set on which the polynomial `P_{λ+η,e}` depends. -/
def Lifting.shiftedWeights {F E : Type} [Field F] [Field E] {n : ℕ}
    (lam : (F →+* E) → Fin n → ℤ) : Set (Fin n → ℤ) :=
  Set.range fun τ : F →+* E => fun i : Fin n => lam τ i + ((n : ℤ) - 1 - (i : ℤ))

/-- Hypotheses (i)–(v) of Le–Le Hung–Levin–Morra, Theorem 9.2.1, with its standing assumptions,
for a genericity polynomial `P`: `F/F⁺` CM with `p` unramified in `F`, `F⁺ ≠ ℚ` and every place
of `F⁺` above `p` split in `F`; `r : G_F → GL_n(E)` (through a lattice) such that
(i) `r` is unramified at all but finitely many places;
(ii) at each place `v | p`, `r` is potentially crystalline of type `(λ + η, τ_v)`, `λ` dominant,
and the tame inertial type `τ_v` has a lowest alcove presentation `(s_v, μ_v - η)` with `μ_v`
`P`-generic: `P(μ_{v,j})` is prime to `p` for every embedding `j`;
(iii) `r^c ≅ r^∨ ε^{1-n}`;
(iv) `r̄` is semisimple at each place above `p`;
(v) `r̄(G_{F(ζ_p)})` is adequate and `ζ_p ∉ F̄^{ker ad r̄}`, i.e. some `σ ∈ G_F` with `r̄(σ)` scalar
moves `ζ_p`.
Hodge–Tate weights are taken in the convention of this file, `HT(ε) = {-1}`, in which (iii) is
compatible with the weights `λ + η`; the source normalises `ε` to have Hodge–Tate weight `1`. -/
def Lifting.IsGenericLiftingDatum {F : Type} [Field F] [NumberField F] [IsCMField F] {E : Type}
    [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E] {n : ℕ}
    (p : ℕ) [ResChar E p] (P : MvPolynomial (Fin n) ℤ) (r : Gal F →ₜ* GL (Fin n) 𝒪[E])
    (lam : (F →+* E) → Fin n → ℤ) (τ : ∀ v : Place F, Lifting.TameInertialType v.Fv E n)
    (s : ∀ v : Place F, (v.Fv →+* E) → Equiv.Perm (Fin n))
    (μ : ∀ v : Place F, (v.Fv →+* E) → Fin n → ℤ) : Prop :=
  (¬ Lifting.IsRamifiedIn p F ∧ 1 < Module.finrank ℚ (maximalRealSubfield F) ∧
    ∀ v ∈ Lifting.primesAbove (maximalRealSubfield F) p, Lifting.IsSplitIn v F) ∧
  Lifting.IsUnramifiedAlmostEverywhere r.toMonoidHom ∧
  ((∀ τ', Antitone (lam τ')) ∧ ∀ v : Place F, v.Above p →
    IsPotentiallyCrystalline (genericC (resPlace r v)) ∧
    HasHodgeTate (genericC (resPlace r v)) (Lifting.localHT (Lifting.weightHT lam) v) ∧
    Lifting.inertialType.Holds (genericC (resPlace r v), τ v) ∧
    Lifting.lowestAlcove.Holds (τ v, s v, μ v) ∧
    ∀ j : v.Fv →+* E, ¬ (p : ℤ) ∣ MvPolynomial.eval (μ v j) P) ∧
  Lifting.IsConjugateSelfDual ⇑(Lifting.genericG r)
    (fun σ => Lifting.genericChar (Lifting.cycloInt E F ^ (1 - (n : ℤ))) σ) ∧
  (∀ v : Place F, v.Above p →
    Lifting.IsSemisimple ⇑(Lifting.resPlaceHom (reduction r.toMonoidHom) v)) ∧
  (adequate 𝓀[E] n).Holds (Lifting.imageCyclo p (reduction r.toMonoidHom)) ∧
  ∃ σ : Gal F, (∃ a : 𝓀[E], (reduction r.toMonoidHom σ : Matrix (Fin n) (Fin n) 𝓀[E]) =
    a • (1 : Matrix (Fin n) (Fin n) 𝓀[E])) ∧ Lifting.cycloBar E F σ ≠ 1

/-- **PL.9/generic-local-domain-lifting** (Le–Le Hung–Levin–Morra, Theorem 9.2.1). Under
hypotheses (i)–(v) and the standing assumptions (`Lifting.IsGenericLiftingDatum`), for the
polynomial `P_{λ+η,e}` of their Theorem 7.3.2(2), `e` the ramification index of `𝒪`, assume
(vi) `r̄ ≅ r̄_ι(π)` for a RACSDC `π` of `GL_n(𝔸_F)` of weight `λ` such that `σ(τ)` is a `K`-type
for `π` at the places dividing `p`. Then `r ≅ r_ι(π')` for a RACSDC `π'` of weight `λ` with
`σ(τ)` a `K`-type at the places dividing `p`. The source does not define "`K`-type" and "weight
`λ`" for `π`; they are read as: `π_w|GL_n(𝒪_{F_w})` contains `σ(τ_w)` for each `w | p`
(`Lifting.kType`), and `r_ι(π)` has Hodge–Tate weights `λ + η` (`RACP.HasWeight`). -/
/- REVIEW: the LLHLM source has HT(ε) = +1. The common-convention λ
and genericity indices here still need the explicit conversion in the packet gap. -/
theorem generic_local_domain_lifting {F : Type} [Field F] [NumberField F] [IsCMField F]
    {E : Type} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    [IsLargeFor F E] {n : ℕ} {p : ℕ} [ResChar E p] (hp : p.Prime) (ι : E →+* ℂ)
    (r : Gal F →ₜ* GL (Fin n) 𝒪[E]) (lam : (F →+* E) → Fin n → ℤ)
    (τ : ∀ v : Place F, Lifting.TameInertialType v.Fv E n)
    (s : ∀ v : Place F, (v.Fv →+* E) → Equiv.Perm (Fin n))
    (μ : ∀ v : Place F, (v.Fv →+* E) → Fin n → ℤ)
    (h : Lifting.IsGenericLiftingDatum p
      (Lifting.genericityPolynomial n (Lifting.shiftedWeights lam)
        (Lifting.coeffRamificationIndex E p)) r lam τ s μ)
    (π : RACP F n) (hπ : (Lifting.racsdc F n).Holds π)
    (hπbar : Conj (reduction r.toMonoidHom : Gal F → GL (Fin n) 𝓀[E]) (π.residualRep ι))
    (hπwt : π.HasWeight ι lam)
    (hπK : ∀ v : Place F, v.Above p → (Lifting.kType ι).Holds (π.component v, τ v)) :
    ∃ π' : RACP F n, (Lifting.racsdc F n).Holds π' ∧
      Conj (Lifting.genericG r : Gal F → GL (Fin n) E) (π'.galoisRep ι) ∧
      π'.HasWeight ι lam ∧
      ∀ v : Place F, v.Above p → (Lifting.kType ι).Holds (π'.component v, τ v) := by
  sorry

/-! ### PL.9/generic-change-of-weight-lifting: Change-of-weight relaxation of generic-type
modularity lifting -/

/-- **PL.9/generic-change-of-weight-lifting** (Le–Le Hung–Levin–Morra, Remark 9.2.2(1), stated
there without proof; the change of weight uses their Theorem 9.1.6). For each rank `n`, set `W`
of weights `λ_j + η_j` and ramification index `e` there is a polynomial `P`, possibly different
from `P_{λ+η,e}`, such that under hypotheses (i)–(v) of PL.9/generic-local-domain-lifting for
`P`, hypothesis (vi) may be weakened to: `r̄ ≅ r̄_ι(π)` for some RACSDC `π` of `GL_n(𝔸_F)`, with
no condition on its weight or `K`-type, with the same conclusion. The hypotheses of their
Theorem 9.1.6 are kept: `p ∤ 2n`, `F⁺ ≠ ℚ`, `p` unramified with all places above `p` split in
`F` (in the datum), and `r̄` automorphic for a definite unitary group in the sense of their §9.1
(`Lifting.definiteUnitaryAutomorphic`, a notion without an owner in the atlas). The polynomial is
not made explicit by the source. -/
theorem generic_change_of_weight_lifting (n : ℕ) (W : Set (Fin n → ℤ)) (e : ℕ) :
    ∃ P : MvPolynomial (Fin n) ℤ,
      ∀ (F : Type) [Field F] [NumberField F] [IsCMField F] (E : Type) [Field E]
        [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E] [IsLargeFor F E]
        (p : ℕ) [ResChar E p] (ι : E →+* ℂ) (r : Gal F →ₜ* GL (Fin n) 𝒪[E])
        (lam : (F →+* E) → Fin n → ℤ) (τ : ∀ v : Place F, Lifting.TameInertialType v.Fv E n)
        (s : ∀ v : Place F, (v.Fv →+* E) → Equiv.Perm (Fin n))
        (μ : ∀ v : Place F, (v.Fv →+* E) → Fin n → ℤ),
        p.Prime → ¬ p ∣ 2 * n → Lifting.shiftedWeights lam = W →
        Lifting.coeffRamificationIndex E p = e →
        Lifting.IsGenericLiftingDatum p P r lam τ s μ →
        (∃ π : RACP F n, (Lifting.racsdc F n).Holds π ∧
          Conj (reduction r.toMonoidHom : Gal F → GL (Fin n) 𝓀[E]) (π.residualRep ι)) →
        (∃ rt : Gal (maximalRealSubfield F) →* CHT n 𝓀[E],
          Lifting.CHT.Extends (rt : Gal (maximalRealSubfield F) → CHT n 𝓀[E])
            ⇑(reduction r.toMonoidHom) ∧
          (Lifting.definiteUnitaryAutomorphic F E n).Holds rt) →
        ∃ π' : RACP F n, (Lifting.racsdc F n).Holds π' ∧
          Conj (Lifting.genericG r : Gal F → GL (Fin n) E) (π'.galoisRep ι) ∧
          π'.HasWeight ι lam ∧
          ∀ v : Place F, v.Above p → (Lifting.kType ι).Holds (π'.component v, τ v) := by
  sorry

end PL9

end TauCeti.Automorphy
